--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol

slot_0_0_0 = {
	rad = math.rad,
	deg = math.deg,
	atan2 = math.atan2,
	abs = math.abs,
	band = bit.band,
	sin = math.sin,
	cos = math.cos,
	floor = math.floor,
	sqrt = math.sqrt,
	max = math.max,
	min = math.min,
	pi = math.pi,
	pow = math.pow
}
_DC_REQ = false
_savedHitlog = false
slot_0_1_0 = nil
slot_0_2_1 = nil
slot_0_3_0 = nil
slot_0_4_0 = nil
_CEL_JOIN_TIME = 0
Schema = {}

function Schema.get(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	if not arg_1_1 or not arg_1_2 then
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

slot_0_5_0 = {
	scale = 1,
	lastH = 0,
	lastW = 0,
	fontsDirty = false
}

function slot_0_6_0()
	local var_2_0, var_2_1 = game.engine:GetScreenSize()

	if not var_2_0 or var_2_0 < 1 then
		return
	end

	if var_2_0 ~= slot_0_5_0.lastW or var_2_1 ~= slot_0_5_0.lastH then
		slot_0_5_0.lastW = var_2_0
		slot_0_5_0.lastH = var_2_1
		slot_0_5_0.scale = slot_0_0_0.min(var_2_0 / 1920, var_2_1 / 1080)
		slot_0_5_0.fontsDirty = true

		if syncKUI then
			syncKUI()
		end
	end
end

function slot_0_7_0(arg_3_0)
	return slot_0_0_0.floor(arg_3_0 * (slot_0_5_0.scale or 1) + 0.5)
end

function slot_0_8_0(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_0 - arg_4_1
	local var_4_1 = var_4_0:Dot(arg_4_2)

	if var_4_1 < 0 then
		return var_4_0:Length()
	end

	return (arg_4_0 - (arg_4_1 + arg_4_2 * var_4_1)):Length()
end

slot_0_9_0 = draw.Color(255, 255, 255, 255)
slot_0_10_0 = draw.Color(0, 0, 0, 255)
slot_0_11_0 = draw.Color(140, 140, 140, 220)
slot_0_12_0 = draw.Color(180, 0, 0, 255)
slot_0_13_0 = draw.Color(0, 0, 0, 0)
slot_0_14_0 = 0
slot_0_15_0 = {
	vbx = 949,
	iby = 880,
	cx = 946,
	by = 920,
	bx = 940,
	ks = 18,
	is = 50,
	font = "gui_main",
	vby = 845
}

function slot_0_16_0()
	local var_5_0, var_5_1 = game.engine:GetScreenSize()

	slot_0_15_0.ks = slot_0_7_0(18)
	slot_0_15_0.is = slot_0_7_0(50)
	slot_0_15_0.bx = slot_0_0_0.floor(var_5_0 / 2) - slot_0_7_0(20)
	slot_0_15_0.by = slot_0_0_0.floor(var_5_1 * 0.85)
	slot_0_15_0.cx = slot_0_15_0.bx + slot_0_7_0(6)
	slot_0_15_0.iby = slot_0_15_0.by - slot_0_7_0(40)
	slot_0_15_0.vbx = slot_0_15_0.bx + slot_0_7_0(9)
	slot_0_15_0.vby = slot_0_15_0.by - slot_0_7_0(75)
end

slot_0_17_0 = {
	D = 68,
	CTRL = 17,
	SPACE = 32,
	W = 87,
	A = 65,
	S = 83
}
slot_0_18_0 = {
	[0] = nil,
	jb = gui.ctx:Find("misc>movement>jumpbug"),
	ej = gui.ctx:Find("misc>movement>edge jump"),
	legitAwall = gui.ctx:Find("legit>general>penetration"),
	dj = gui.ctx:Find("misc>movement>duck jump"),
	rageEnable = gui.ctx:Find("rage>aimbot>general>aimbot"),
	rageAwall = gui.ctx:Find("rage>aimbot>general>penetration"),
	rageNospread = gui.ctx:Find("rage>aimbot>nospread"),
	rageAutofire = gui.ctx:Find("rage>aimbot>general>autofire"),
	aaEnable = gui.ctx:Find("rage>anti-aim>angles>anti-aim"),
	aaLeft = gui.ctx:Find("rage>anti-aim>angles>manual override>override left"),
	aaRight = gui.ctx:Find("rage>anti-aim>angles>manual override>override right"),
	aaBack = gui.ctx:Find("rage>anti-aim>angles>manual override>override back"),
	aaFwd = gui.ctx:Find("rage>anti-aim>angles>manual override>override forward"),
	aaYaw = gui.ctx:Find("rage>anti-aim>angles>yaw>settings>amount"),
	slowwalk = gui.ctx:Find("misc>movement>slowwalk"),
	duckPeek = gui.ctx:Find("misc>movement>duck peek assist"),
	vmOffZ = gui.ctx:Find("visuals>misc>local>viewmodel override>settings>offset z"),
	af = gui.ctx:Find("rage>aimbot>general>autofire"),
	afFov = gui.ctx:Find("rage>aimbot>general>maximum fov"),
	mdGeneral = gui.ctx:Find("rage>weapon>general>weapon>mindamage"),
	mdSsg = gui.ctx:Find("rage>weapon>SSG-08>weapon>mindamage"),
	mdAwp = gui.ctx:Find("rage>weapon>AWP>weapon>mindamage"),
	mdR8 = gui.ctx:Find("rage>weapon>R8 Revolver>weapon>mindamage"),
	mdDeagle = gui.ctx:Find("rage>weapon>Desert Eagle>weapon>mindamage"),
	mdAuto = gui.ctx:Find("rage>weapon>Auto Snipers>weapon>mindamage"),
	mdHeavy = gui.ctx:Find("rage>weapon>Heavy>weapon>mindamage"),
	mdRifles = gui.ctx:Find("rage>weapon>Rifles>weapon>mindamage"),
	mdSmgs = gui.ctx:Find("rage>weapon>SMGs>weapon>mindamage"),
	mdPistols = gui.ctx:Find("rage>weapon>Pistols>weapon>mindamage"),
	dt = gui.ctx:Find("rage>aimbot>doubletap"),
	slowwalkSpeed = gui.ctx:Find("misc>movement>slowwalk speed"),
	easyStrafe = gui.ctx:Find("misc>movement>easy strafe"),
	forceBodyaim = gui.ctx:Find("rage>aimbot>general>force bodyaim"),
	forceShoot = gui.ctx:Find("rage>aimbot>general>force shoot"),
	ssgHitchance = gui.ctx:Find("rage>weapon>SSG-08>weapon>hitchance"),
	ssgPointscaleCtrl = gui.ctx:Find("rage>weapon>SSG-08>weapon>pointscale"),
	ssgAutostopMode = gui.ctx:Find("rage>weapon>SSG-08>extra>autostop>settings>mode"),
	aaJitter = gui.ctx:Find("rage>anti-aim>angles>yaw jitter"),
	aaJitterAmt = gui.ctx:Find("rage>anti-aim>angles>yaw jitter>settings>amount"),
	aaJitter3way = gui.ctx:Find("rage>anti-aim>angles>yaw jitter>settings>3way"),
	aaJitterDisabler = gui.ctx:Find("rage>anti-aim>angles>jitter disabler"),
	skyColor = gui.ctx:Find("visuals>world>environment>sky color"),
	thirdPerson = gui.ctx:Find("visuals>misc>local>thirdperson"),
	peekAssist = gui.ctx:Find("misc>movement>peek assist"),
	retreatOnRelease = gui.ctx:Find("misc>movement>peek assist>retreat on release"),
	aaSpin = gui.ctx:Find("rage>anti-aim>angles>spin"),
	aaSpinAmt = gui.ctx:Find("rage>anti-aim>angles>spin amount")
}
slot_0_19_0 = {
	md = {
		[0] = nil,
		rage = {},
		legit = {}
	},
	hc = {
		rage = {},
		legit = {}
	},
	ts = {}
}
slot_0_20_0 = {
	"general",
	"AWP",
	"SSG-08",
	"R8 Revolver",
	"Desert Eagle",
	"Auto Snipers",
	"AK-47",
	"P2000",
	"Rifles",
	"SMGs",
	"Heavy",
	"Pistols",
	[0] = nil
}
slot_0_21_0 = {
	active = false,
	saved = {}
}

function slot_0_22_0(arg_6_0)
	if not arg_6_0 then
		return false
	end

	return arg_6_0:Get()
end

function slot_0_23_0(arg_7_0, arg_7_1)
	if not arg_7_0 then
		return
	end

	local var_7_0 = arg_7_0:GetValue()

	if var_7_0 then
		var_7_0:Set(arg_7_1 and true or false)
	end
end

function slot_0_24_0(arg_8_0)
	if not arg_8_0 then
		return 0
	end

	local var_8_0 = arg_8_0:Get()

	if type(var_8_0) == "number" then
		return var_8_0
	end

	return 0
end

function slot_0_25_0(arg_9_0, arg_9_1)
	if not arg_9_0 then
		return
	end

	local var_9_0 = arg_9_0:GetValue()

	if var_9_0 then
		var_9_0:Set(arg_9_1)
	end
end

slot_0_26_0 = {
	legitawall = false,
	rageawall = false,
	dj = false,
	ej = false,
	afdelay = false,
	aipeek = false,
	aa = false,
	jb = false,
	autofire = false,
	ns = false,
	translate = nil
}
slot_0_27_0 = {
	offX = 0,
	keys = false,
	vel = false,
	jbej = false,
	alignAng = 30,
	offY = 150,
	autoAlign = false
}
slot_0_28_0 = {
	winTime = 0,
	lastWin = false,
	spinStart = 0,
	spinning = false,
	reels = {
		0,
		0,
		0,
		[0] = nil
	},
	spinDuration = {
		1.2,
		1.6,
		2,
		[0] = nil
	},
	result = {
		1,
		1,
		1,
		[0] = nil
	},
	symbols = {
		"1",
		"2",
		"3",
		"4",
		"5",
		"6",
		"7",
		"8",
		"9",
		[0] = nil
	}
}
slot_0_29_0 = {
	rageScoutPs = false,
	lowHpWarn = false,
	fastLadder = false,
	slotsEnabled = false,
	scoutAirFs = false,
	sparkle = false,
	nfd = false,
	fdVm = false,
	knifeDt = false,
	[0] = nil
}
slot_0_30_0 = {
	b = 241,
	r = 144,
	g = 170
}
slot_0_31_0 = {
	lastW = 0,
	lastH = 0
}
bombHud = {
	lastW = 0,
	lastH = 0
}
slot_0_32_0 = {}
slot_0_33_0 = {
	lastApexTime = 0
}
slot_0_34_0 = {
	lastW = 0,
	lastH = 0
}
slot_0_35_0 = {
	offX = 0,
	offY = 0
}
slot_0_36_0 = {}
slot_0_37_0 = {
	hudg = 50,
	hudr = 45,
	grad1b = 241,
	grad1g = 170,
	grad1r = 144,
	hudb = 65,
	grad1 = draw.Color(144, 170, 241, 255),
	hud = draw.Color(45, 50, 65, 255)
}
slot_0_38_0 = {
	prevBack = false,
	prevRight = false,
	prevLeft = false,
	jdDuration = 0.01,
	enabled = false,
	instantRotate = false,
	[0] = nil
}
slot_0_39_0 = {
	enabled = false,
	fov = 10,
	smooth = 5
}
slot_0_29_0.awpBodyaim = false
slot_0_40_0 = {}
slot_0_41_0 = {
	aiPeek = nil,
	slavebot = nil
}
slot_0_26_0.timeAccum = 0
slot_0_42_0 = {
	pingTimer = 0,
	showKd = true,
	showPing = true,
	showFps = true,
	showUser = true,
	fpsTimer = 0,
	fpsAccum = 0,
	fpsSamples = 0,
	kdKills = 0,
	kdDeaths = 0,
	kdSuicide = false,
	fps = 0,
	enabled = true,
	ping = 0,
	FPS_INTERVAL = 0.5,
	CW = 7,
	white_transparent = nil
}
slot_0_43_0 = false
slot_0_44_0 = false
slot_0_45_0 = {
	savedAutostop = nil,
	savedHC = nil,
	fullStopBit = 16,
	MinPS = 30,
	MaxPS = 40,
	hitchance = 0,
	MinHC = 58,
	wasInAir = false,
	pointscale = 0,
	forceShoot = false,
	ForceShootDist = 1060,
	MaxHC = 65,
	active = false
}
slot_0_46_0 = {
	retreatStartTime = nil,
	shotFired = false,
	state = "idle",
	retreatTime = 0,
	enabled = false,
	savedPeekAssist = nil,
	savedRetreatOnRelease = nil,
	[0] = nil
}
slot_0_47_0 = {
	rightOk = false,
	leftOk = false,
	visPts = {}
}
slot_0_48_0 = {
	enabled = false,
	curBoost = 0,
	maxBoost = 15,
	savedHc = {}
}
slot_0_49_0 = {
	enabled = false,
	hc = 60,
	wasAir = false,
	ps = 38
}
slot_0_26_0.slavebot = false
slot_0_26_0.rageFov = false
slot_0_50_0 = nil
slot_0_51_0 = Vector(0, 0, 0)
slot_0_52_1 = nil
slot_0_30_0.queue = nil
slot_0_30_0.gotHurt = false
slot_0_30_0.firstImpact = nil
slot_0_30_0.shotFired = false
slot_0_53_0 = {
	pending = false,
	hc = 0,
	weapon = nil,
	eyePos = nil,
	diedAfter = false,
	didHit = false,
	fireTime = 0
}
slot_0_54_0 = {}
slot_0_55_0 = {}
slot_0_56_0 = nil
slot_0_58_1 = gui.GetMainWindow():AddTab("celestial", draw.textures.icon_cloud, "CELESTIAL", gui.TabLayoutMode.SUBTABS)
slot_0_59_1 = slot_0_58_1:AddTab("celRage", "Rage", gui.TabLayoutMode.DEFAULT, true)
slot_0_60_1 = slot_0_58_1:AddTab("celLegit", "Legit", gui.TabLayoutMode.DEFAULT, false)
slot_0_61_1 = slot_0_58_1:AddTab("celSemi", "Semi", gui.TabLayoutMode.DEFAULT, false)
slot_0_62_1 = slot_0_58_1:AddTab("celMisc", "Misc", gui.TabLayoutMode.DEFAULT, false)
slot_0_63_1 = slot_0_58_1:AddTab("celMov", "Movement", gui.TabLayoutMode.DEFAULT, false)
slot_0_64_1 = slot_0_58_1:AddTab("celSet", "Settings", gui.TabLayoutMode.DEFAULT, false)
slot_0_65_1 = gui.Group("celGrpRage", "Rage", 200, gui.GroupWidthMode.REDUCED)
slot_0_54_0.scoutPs = gui.Checkbox("celScoutPs")

slot_0_65_1:Add(gui.MakeControl("Scout auto pointscale", slot_0_54_0.scoutPs))

slot_0_54_0.scoutAir = gui.Checkbox("celScoutAir")

slot_0_65_1:Add(gui.MakeControl("Scout air auto fs/ps/hc", slot_0_54_0.scoutAir))

slot_0_54_0.accBoostLevel = gui.ComboBox("celAccBoostLevel")

slot_0_54_0.accBoostLevel:Add(gui.Selectable("celAccOff", "Off"))
slot_0_54_0.accBoostLevel:Add(gui.Selectable("celAccLow", "Low"))
slot_0_54_0.accBoostLevel:Add(gui.Selectable("celAccMed", "Medium"))
slot_0_54_0.accBoostLevel:Add(gui.Selectable("celAccHigh", "High"))
slot_0_54_0.accBoostLevel:Add(gui.Selectable("celAccMax", "Maximum"))
slot_0_54_0.accBoostLevel:Get():Set(0)
slot_0_65_1:Add(gui.MakeControl("Accuracy boost", slot_0_54_0.accBoostLevel))

slot_0_54_0.ssgm = gui.Checkbox("celSsgm")
slot_0_66_1 = gui.MakeControl("Scout in air hc/ps", slot_0_54_0.ssgm)
slot_0_67_1 = gui.Settings("celSsgSettings")
slot_0_55_0.ssgHc = gui.Slider("celSsgHc", 10, 100)

slot_0_55_0.ssgHc:GetValue():Set(slot_0_49_0.hc)

slot_0_55_0.ssgPs = gui.Slider("celSsgPs", 5, 80)

slot_0_55_0.ssgPs:GetValue():Set(slot_0_49_0.ps)
slot_0_67_1:Add(gui.MakeControl("Hitchance", slot_0_55_0.ssgHc))
slot_0_67_1:Add(gui.MakeControl("Pointscale", slot_0_55_0.ssgPs))
slot_0_66_1:Add(slot_0_67_1)
slot_0_65_1:Add(slot_0_66_1)
slot_0_65_1:Reset()

slot_0_68_1 = gui.Group("celGrpFeatures", "Features", 200, gui.GroupWidthMode.REDUCED)
slot_0_54_0.knifeDt = gui.Checkbox("celKnifeDt")

slot_0_68_1:Add(gui.MakeControl("Knife dt", slot_0_54_0.knifeDt))

slot_0_54_0.aiPeek = gui.Checkbox("celAiPeek")
slot_0_69_1 = gui.MakeControl("Ai peek", slot_0_54_0.aiPeek)
slot_0_70_1 = gui.Settings("celAiSettings")
slot_0_54_0.aiRetreat = gui.Checkbox("celAiRetreat")
slot_0_71_1 = gui.MakeControl("Auto retreat", slot_0_54_0.aiRetreat)

slot_0_70_1:Add(slot_0_71_1)
slot_0_69_1:Add(slot_0_70_1)
slot_0_68_1:Add(slot_0_69_1)

slot_0_54_0.disableR8M2 = gui.Checkbox("celDisableR8M2")

slot_0_68_1:Add(gui.MakeControl("Disable r8 m2", slot_0_54_0.disableR8M2))

slot_0_54_0.quickSwitch = gui.Checkbox("celQuickSwitch")

slot_0_68_1:Add(gui.MakeControl("Quick switch", slot_0_54_0.quickSwitch))

slot_0_54_0.avoidWalls = gui.Checkbox("celAvoidWalls")
slot_0_72_1 = gui.MakeControl("Avoid walls", slot_0_54_0.avoidWalls)
slot_0_73_1 = gui.Settings("celAwSettings")
slot_0_55_0.awDist = gui.Slider("celAwDist", 10, 100)

slot_0_55_0.awDist:GetValue():Set(45)
slot_0_73_1:Add(gui.MakeControl("Distance", slot_0_55_0.awDist))
slot_0_72_1:Add(slot_0_73_1)
slot_0_68_1:Add(slot_0_72_1)
slot_0_68_1:Reset()

slot_0_74_1 = gui.Group("celGrpRageMov", "Movement", 150, gui.GroupWidthMode.REDUCED)
slot_0_54_0.fastLad = gui.Checkbox("celFastLad")

slot_0_74_1:Add(gui.MakeControl("Fast ladder", slot_0_54_0.fastLad))

slot_0_54_0.rageStop = gui.Checkbox("celRageStop")
slot_0_75_1 = gui.MakeControl("Slowwalk auto stop", slot_0_54_0.rageStop)
slot_0_76_1 = gui.Settings("celRsSettings")
slot_0_54_0.rsInAir = gui.Checkbox("celRsInAir")

slot_0_76_1:Add(gui.MakeControl("In air", slot_0_54_0.rsInAir))

slot_0_55_0.rsFov = gui.Slider("celRsFov", 1, 180)

slot_0_55_0.rsFov:GetValue():Set(90)
slot_0_76_1:Add(gui.MakeControl("fov", slot_0_55_0.rsFov))

slot_0_54_0.rsEarly = gui.ComboBox("celRsEarly")

slot_0_54_0.rsEarly:Add(gui.Selectable("celRsEarlyOff", "Off"))
slot_0_54_0.rsEarly:Add(gui.Selectable("celRsEarlyNorm", "Normal"))
slot_0_54_0.rsEarly:Add(gui.Selectable("celRsEarlyMax", "Max"))
slot_0_54_0.rsEarly:Get():Set(0)
slot_0_76_1:Add(gui.MakeControl("Early stop", slot_0_54_0.rsEarly))
slot_0_75_1:Add(slot_0_76_1)
slot_0_74_1:Add(slot_0_75_1)
slot_0_74_1:Reset()

slot_0_77_1 = gui.Group("celGrpAntiAim", "Anti Aim", 200, gui.GroupWidthMode.REDUCED)
slot_0_54_0.freestand = gui.Checkbox("celFreestand")
slot_0_78_1 = gui.MakeControl("Freestanding", slot_0_54_0.freestand)
slot_0_79_1 = gui.Settings("celFsSettings")
slot_0_54_0.fsDisableCrouch = gui.Checkbox("celFsDisableCrouch")

slot_0_79_1:Add(gui.MakeControl("Disable on crouch", slot_0_54_0.fsDisableCrouch))
slot_0_78_1:Add(slot_0_79_1)
slot_0_77_1:Add(slot_0_78_1)

slot_0_54_0.disableAaTimeout = gui.Checkbox("celDisableAaTimeout")

slot_0_77_1:Add(gui.MakeControl("Disable aa on timeout", slot_0_54_0.disableAaTimeout))

slot_0_54_0.instantRotate = gui.Checkbox("celInstantRotate")

slot_0_77_1:Add(gui.MakeControl("Instant rotate", slot_0_54_0.instantRotate))

slot_0_54_0.disableAaRoundEnd = gui.Checkbox("celDisableAaRoundEnd")

slot_0_77_1:Add(gui.MakeControl("Disable aa on round end", slot_0_54_0.disableAaRoundEnd))

slot_0_54_0.spinOnWin = gui.Checkbox("celSpinOnWin")

slot_0_77_1:Add(gui.MakeControl("Spin on win", slot_0_54_0.spinOnWin))
slot_0_77_1:Reset()

slot_0_80_1 = gui.MakeStackedGroups("rageCol1", draw.Vec2(224, 460), {
	slot_0_65_1,
	slot_0_77_1
})
slot_0_81_1 = gui.MakeStackedGroups("rageCol2", draw.Vec2(224, 460), {
	slot_0_68_1
})
slot_0_82_1 = gui.MakeStackedGroups("rageCol3", draw.Vec2(224, 460), {
	slot_0_74_1
})

slot_0_59_1:Add(slot_0_80_1)
slot_0_59_1:Add(slot_0_81_1)
slot_0_59_1:Add(slot_0_82_1)
slot_0_59_1:Reset()

slot_0_83_1 = gui.Group("celGrpVis", "Visuals", 200, gui.GroupWidthMode.REDUCED)
slot_0_54_0.lowHp = gui.Checkbox("celLowHp")

slot_0_83_1:Add(gui.MakeControl("Low hp warning", slot_0_54_0.lowHp))

slot_0_54_0.sparkle = gui.Checkbox("celSparkle")
slot_0_54_0.sparkleCol = gui.ColorPicker("celSparkleCol", true)

slot_0_54_0.sparkleCol:GetValue():Set(draw.Color(144, 170, 241, 255))

slot_0_84_1 = gui.MakeControl("Hit sparkle", slot_0_54_0.sparkle)

slot_0_84_1:Add(slot_0_54_0.sparkleCol)
slot_0_83_1:Add(slot_0_84_1)

slot_0_54_0.fdVm = gui.Checkbox("celFdVm")

slot_0_83_1:Add(gui.MakeControl("Fakeduck viewmodel", slot_0_54_0.fdVm))

slot_0_54_0.wpEnabled = gui.Checkbox("celWpEnabled")
slot_0_85_1 = gui.MakeControl("Wallbang spots", slot_0_54_0.wpEnabled)
slot_0_86_1 = gui.Settings("celWpSettings")
slot_0_54_0.wpAdd = gui.Button("celWpAdd", "Add spot")

slot_0_86_1:Add(slot_0_54_0.wpAdd)

slot_0_54_0.wpClear = gui.Button("celWpClear", "Clear last")

slot_0_86_1:Add(slot_0_54_0.wpClear)
slot_0_85_1:Add(slot_0_86_1)
slot_0_83_1:Add(slot_0_85_1)

slot_0_54_0.nadeEnabled = gui.Checkbox("celNadeEnabled")
slot_0_87_2 = gui.MakeControl("Grenade lineups", slot_0_54_0.nadeEnabled)
slot_0_88_2 = gui.Settings("celNadeSettings")
slot_0_54_0.nadeAdd = gui.Button("celNadeAdd", "Add lineup")

slot_0_88_2:Add(slot_0_54_0.nadeAdd)

slot_0_54_0.nadeClear = gui.Button("celNadeClear", "Clear last")

slot_0_88_2:Add(slot_0_54_0.nadeClear)

slot_0_54_0.nadeAutoAim = gui.Checkbox("celNadeAutoAim")
slot_0_89_2 = gui.MakeControl("Auto aim", slot_0_54_0.nadeAutoAim)
slot_0_90_2 = gui.Settings("celNadeAutoSettings")
slot_0_55_0.nadeSmooth = gui.Slider("celNadeSmooth", 1, 50)

slot_0_55_0.nadeSmooth:GetValue():Set(1)

slot_0_55_0.nadeFov = gui.Slider("celNadeFov", 1, 30)

slot_0_55_0.nadeFov:GetValue():Set(10)
slot_0_90_2:Add(gui.MakeControl("Smoothing", slot_0_55_0.nadeSmooth))
slot_0_90_2:Add(gui.MakeControl("Fov", slot_0_55_0.nadeFov))
slot_0_89_2:Add(slot_0_90_2)
slot_0_88_2:Add(slot_0_89_2)
slot_0_87_2:Add(slot_0_88_2)
slot_0_83_1:Add(slot_0_87_2)

slot_0_54_0.freecam = gui.Checkbox("celFreecam")

slot_0_83_1:Add(gui.MakeControl("Freecam", slot_0_54_0.freecam))

slot_0_54_0.leftKnife = gui.Checkbox("celLeftKnife")

slot_0_83_1:Add(gui.MakeControl("Left hand on knife", slot_0_54_0.leftKnife))
slot_0_83_1:Reset()

slot_0_91_2 = gui.Group("celGrpInd", "Indicators", 150, gui.GroupWidthMode.REDUCED)
slot_0_54_0.indCombo = gui.ComboBox("celIndCombo")
slot_0_54_0.indCombo.allowMultiple = true

slot_0_54_0.indCombo:Add(gui.Selectable("celIndAa", "Aa"))
slot_0_54_0.indCombo:Add(gui.Selectable("celIndRawall", "Rawall"))
slot_0_54_0.indCombo:Add(gui.Selectable("celIndAutowall", "Autowall"))
slot_0_54_0.indCombo:Add(gui.Selectable("celIndNs", "Ns"))
slot_0_54_0.indCombo:Add(gui.Selectable("celIndAutofire", "Autofire"))
slot_0_54_0.indCombo:Add(gui.Selectable("celIndJb", "Jump bug"))
slot_0_54_0.indCombo:Add(gui.Selectable("celIndEj", "Edge jump"))
slot_0_54_0.indCombo:Add(gui.Selectable("celIndAipeek", "Ai peek"))
slot_0_54_0.indCombo:Add(gui.Selectable("celIndAfdelay", "Af delay"))
slot_0_54_0.indCombo:Add(gui.Selectable("celIndRageFov", "Rage fov"))
slot_0_54_0.indCombo:Add(gui.Selectable("celIndMinDmg", "Minimum damage"))
slot_0_54_0.indCombo:Add(gui.Selectable("celIndMinAcc", "Min. accuracy"))
slot_0_54_0.indCombo:Add(gui.Selectable("celIndAutoRetreat", "Auto retreat"))
slot_0_54_0.indCombo:Add(gui.Selectable("celIndJumpApex", "Jump apex"))
slot_0_54_0.indCombo:Add(gui.Selectable("celIndBombTimer", "Bomb timer"))
slot_0_91_2:Add(gui.MakeControl("Screen", slot_0_54_0.indCombo))

slot_0_54_0.crosshairPos = gui.ComboBox("celCrossPos")

slot_0_54_0.crosshairPos:Add(gui.Selectable("celCrossTL", "Top left"))
slot_0_54_0.crosshairPos:Add(gui.Selectable("celCrossTR", "Top right"))
slot_0_54_0.crosshairPos:Add(gui.Selectable("celCrossBL", "Bottom left"))
slot_0_54_0.crosshairPos:Add(gui.Selectable("celCrossBR", "Bottom right"))
slot_0_91_2:Add(gui.MakeControl("Crosshair pos", slot_0_54_0.crosshairPos))

slot_0_54_0.crosshairItems = gui.ComboBox("celCrossItems")
slot_0_54_0.crosshairItems.allowMultiple = true

slot_0_54_0.crosshairItems:Add(gui.Selectable("celCrossMD", "Min damage"))
slot_0_54_0.crosshairItems:Add(gui.Selectable("celCrossHC", "Hitchance"))
slot_0_54_0.crosshairItems:Add(gui.Selectable("celCrossAW", "Auto wall"))
slot_0_54_0.crosshairItems:Add(gui.Selectable("celCrossDT", "Double tap"))
slot_0_54_0.crosshairItems:Add(gui.Selectable("celCrossFS", "Force shoot"))
slot_0_91_2:Add(gui.MakeControl("Crosshair", slot_0_54_0.crosshairItems))
slot_0_91_2:Reset()

slot_0_92_3 = gui.Group("celGrpFun", "Fun", 200, gui.GroupWidthMode.REDUCED)
slot_0_54_0.slotsEnabled = gui.Checkbox("celSlotsEnabled")
slot_0_93_3 = gui.MakeControl("Slots", slot_0_54_0.slotsEnabled)
slot_0_94_2 = gui.Settings("celSlotsSettings")
slot_0_54_0.spinOnKill = gui.Checkbox("celSpinOnKill")

slot_0_94_2:Add(gui.MakeControl("Spin on kill", slot_0_54_0.spinOnKill))
slot_0_93_3:Add(slot_0_94_2)
slot_0_92_3:Add(slot_0_93_3)

slot_0_54_0.slotSpin = gui.Button("celSlotSpin", "Spin")

slot_0_92_3:Add(slot_0_54_0.slotSpin)

slot_0_54_0.slavebotCb = gui.Checkbox("celSlavebot")

slot_0_92_3:Add(gui.MakeControl("Slave bot", slot_0_54_0.slavebotCb))

slot_0_54_0.blockbot = gui.Checkbox("celBlockbot")

slot_0_92_3:Add(gui.MakeControl("Block bot", slot_0_54_0.blockbot))

slot_0_54_0.copybot = gui.Checkbox("celCopybot")
slot_0_95_1 = gui.MakeControl("Copy bot", slot_0_54_0.copybot)
slot_0_96_1 = gui.Settings("celCopybotSet")
slot_0_54_0.copyTeams = gui.ComboBox("celCopyTeams")
slot_0_54_0.copyTeams.allowMultiple = true

slot_0_54_0.copyTeams:Add(gui.Selectable("celCopyCTItem", "Counter-Terrorists"))
slot_0_54_0.copyTeams:Add(gui.Selectable("celCopyTItem", "Terrorists"))
slot_0_54_0.copyTeams:Reset()
slot_0_96_1:Add(gui.MakeControl("Copy Team", slot_0_54_0.copyTeams))
slot_0_95_1:Add(slot_0_96_1)
slot_0_92_3:Add(slot_0_95_1)
slot_0_92_3:Reset()

slot_0_97_1 = gui.Group("celGrpFeatures", "Features", 200, gui.GroupWidthMode.REDUCED)
slot_0_54_0.edgeStop = gui.Checkbox("celEdgeStop")

slot_0_97_1:Add(gui.MakeControl("Edge stop", slot_0_54_0.edgeStop))

slot_0_54_0.autoDc = gui.ComboBox("celAutoDc")

slot_0_54_0.autoDc:Add(gui.Selectable("celAutoDcOff", "Off"))
slot_0_54_0.autoDc:Add(gui.Selectable("celAutoDcRound", "Round end"))
slot_0_54_0.autoDc:Add(gui.Selectable("celAutoDcMatch", "Match end"))
slot_0_54_0.autoDc:Reset()
slot_0_97_1:Add(gui.MakeControl("Auto disconnect", slot_0_54_0.autoDc))
slot_0_97_1:Reset()

slot_0_98_3 = gui.Group("celGrpWorldVis", "World visuals", 200, gui.GroupWidthMode.REDUCED)
slot_0_54_0.worldVisEnabled = gui.Checkbox("celWorldVisEnabled")
slot_0_99_1 = gui.MakeControl("Per-map visuals", slot_0_54_0.worldVisEnabled)
slot_0_100_1 = gui.Settings("celWorldVisSettings")
slot_0_54_0.wvSave = gui.Button("celWvSave", "Save for this map")

slot_0_100_1:Add(slot_0_54_0.wvSave)

slot_0_54_0.wvClear = gui.Button("celWvClear", "Clear this map")

slot_0_100_1:Add(slot_0_54_0.wvClear)
slot_0_99_1:Add(slot_0_100_1)
slot_0_98_3:Add(slot_0_99_1)
slot_0_98_3:Reset()

slot_0_101_1 = {}
slot_0_102_2 = {
	{
		k = "enabled",
		t = "bool",
		p = "visuals>world>environment>enabled",
		[0] = nil
	},
	{
		k = "exposure",
		t = "float",
		p = "visuals>world>environment>exposure",
		[0] = nil
	},
	{
		k = "worldColor",
		t = "color",
		p = "visuals>world>environment>world color",
		[0] = nil
	},
	{
		k = "lightsColor",
		t = "color",
		p = "visuals>world>environment>lights color",
		[0] = nil
	},
	{
		k = "fog",
		t = "bool",
		p = "visuals>world>environment>fog",
		[0] = nil
	},
	{
		k = "fogColor",
		t = "color",
		p = "visuals>world>environment>fog>settings>color",
		[0] = nil
	},
	{
		k = "fogDist",
		t = "float",
		p = "visuals>world>environment>fog>settings>distance",
		[0] = nil
	},
	{
		k = "fogSize",
		t = "float",
		p = "visuals>world>environment>fog>settings>size",
		[0] = nil
	},
	{
		k = "worldFx",
		t = "bits",
		p = "visuals>world>environment>world effects",
		[0] = nil
	},
	{
		k = "sky",
		t = "bool",
		p = "visuals>world>environment>sky",
		[0] = nil
	},
	{
		k = "sunColor",
		t = "color",
		p = "visuals>world>environment>sun color",
		[0] = nil
	},
	{
		k = "cloudColor",
		t = "color",
		p = "visuals>world>environment>cloud color",
		celAutoDc = nil
	},
	{
		k = "skyColor",
		t = "color",
		p = "visuals>world>environment>sky color",
		["visuals>world>environment>sun color"] = nil
	},
	{
		k = "skybox",
		t = "bits",
		p = "visuals>world>environment>skybox",
		[0] = nil
	},
	{
		k = "removals",
		t = "bits",
		p = "visuals>world>environment>removals",
		[0] = nil
	},
	{
		k = "dof",
		t = "bool",
		p = "visuals>world>environment>dof",
		[0] = nil
	},
	{
		k = "dofStr",
		t = "float",
		p = "visuals>world>environment>dof>strength",
		[0] = nil
	},
	{
		k = "dofFarS",
		t = "float",
		p = "visuals>world>environment>dof>far start",
		[0] = nil
	},
	{
		k = "dofFarE",
		t = "float",
		p = "visuals>world>environment>dof>far end",
		[0] = nil
	},
	{
		k = "dofNearS",
		t = "float",
		p = "visuals>world>environment>dof>near start",
		[0] = nil
	},
	{
		k = "dofNearE",
		t = "float",
		p = "visuals>world>environment>dof>near end",
		[0] = nil
	}
}

function slot_0_103_3()
	local var_10_0 = {}

	for iter_10_0, iter_10_1 in ipairs(slot_0_102_2) do
		local var_10_1 = gui.ctx:Find(iter_10_1.p)

		if var_10_1 then
			if iter_10_1.t == "bool" then
				local var_10_2 = var_10_1:Get()

				if type(var_10_2) == "boolean" then
					var_10_0[iter_10_1.k] = var_10_2
				end
			elseif iter_10_1.t == "float" then
				local var_10_3 = var_10_1:Get()

				if type(var_10_3) == "number" then
					var_10_0[iter_10_1.k] = var_10_3
				end
			elseif iter_10_1.t == "color" then
				local var_10_4 = var_10_1:Get()

				if var_10_4 and var_10_4.GetR then
					var_10_0[iter_10_1.k] = {
						[0] = nil,
						r = var_10_4:GetR(),
						g = var_10_4:GetG(),
						b = var_10_4:GetB(),
						a = var_10_4:GetA()
					}
				end
			elseif iter_10_1.t == "bits" then
				local var_10_5 = var_10_1:Get()

				if var_10_5 and var_10_5.GetRaw then
					var_10_0[iter_10_1.k] = var_10_5:GetRaw()
				end
			end
		end
	end

	return var_10_0
end

function slot_0_104_3(arg_11_0)
	if not arg_11_0 then
		return
	end

	for iter_11_0, iter_11_1 in ipairs(slot_0_102_2) do
		local var_11_0 = arg_11_0[iter_11_1.k]

		if var_11_0 ~= nil then
			local var_11_1 = gui.ctx:Find(iter_11_1.p)

			if var_11_1 then
				if iter_11_1.t == "bool" then
					local var_11_2 = var_11_1:GetValue()

					if var_11_2 then
						var_11_2:Set(var_11_0)
					end
				elseif iter_11_1.t == "float" then
					local var_11_3 = var_11_1:GetValue()

					if var_11_3 then
						var_11_3:Set(tonumber(var_11_0) or 0)
					end
				elseif iter_11_1.t == "color" then
					local var_11_4 = var_11_1:GetValue()

					if var_11_4 and type(var_11_0) == "table" then
						var_11_4:Set(draw.Color(var_11_0.r or 255, var_11_0.g or 255, var_11_0.b or 255, var_11_0.a or 255))
					end
				elseif iter_11_1.t == "bits" then
					local var_11_5 = var_11_1:GetValue()

					if var_11_5 then
						local var_11_6 = var_11_5:Get()

						if var_11_6 and var_11_6.SetRaw then
							var_11_6:SetRaw(tonumber(var_11_0) or 0)
							var_11_5:Set(var_11_6)
							var_11_1:Reset()
						end
					end
				end
			end
		end
	end
end

slot_0_105_4 = nil

if slot_0_54_0.wvSave then
	slot_0_54_0.wvSave:AddCallback(function()
		local var_12_0 = game.globalVars.m_szMapName or ""

		if #var_12_0 == 0 then
			return
		end

		local var_12_1 = slot_0_103_3()

		slot_0_101_1[var_12_0] = var_12_1

		utils.DbSave(slot_0_101_1, "celestial_wv")
		game.engine:ClientCmd("echo \"[Celestial] Saved world visuals for " .. var_12_0 .. "\"")
		gui.notify:Add(gui.Notification("Celestial", "World visuals saved: " .. var_12_0))
	end)
end

if slot_0_54_0.wvClear then
	slot_0_54_0.wvClear:AddCallback(function()
		local var_13_0 = game.globalVars.m_szMapName or ""

		if #var_13_0 == 0 then
			return
		end

		slot_0_101_1[var_13_0] = nil

		utils.DbSave(slot_0_101_1, "celestial_wv")
		game.engine:ClientCmd("echo \"[Celestial] Cleared world visuals for " .. var_13_0 .. "\"")
		gui.notify:Add(gui.Notification("Celestial", "World visuals cleared: " .. var_13_0))
	end)
end

slot_0_106_6 = utils.DbLoad("celestial_wv")

if type(slot_0_106_6) == "table" then
	slot_0_101_1 = slot_0_106_6
end

events.event:Add(function(arg_14_0)
	if arg_14_0:GetName() ~= "game_newmap" then
		return
	end

	if not slot_0_54_0.worldVisEnabled or not slot_0_54_0.worldVisEnabled:Get() then
		return
	end

	local var_14_0 = game.globalVars.m_szMapName or ""

	if #var_14_0 == 0 then
		return
	end

	if slot_0_101_1[var_14_0] then
		slot_0_104_3(slot_0_101_1[var_14_0])
		game.engine:ClientCmd("echo \"[Celestial] Applied world visuals for " .. var_14_0 .. "\"")
	end

	slot_0_105_4 = var_14_0
end)
events.presentQueue:Add(function()
	if not slot_0_54_0.worldVisEnabled or not slot_0_54_0.worldVisEnabled:Get() then
		slot_0_105_4 = nil

		return
	end

	if not game.engine:IsConnected() or not game.engine:InGame() then
		slot_0_105_4 = nil

		return
	end

	local var_15_0 = game.globalVars.m_szMapName or ""

	if #var_15_0 == 0 then
		return
	end

	if var_15_0 ~= slot_0_105_4 then
		slot_0_105_4 = var_15_0

		if slot_0_101_1[var_15_0] then
			slot_0_104_3(slot_0_101_1[var_15_0])
			game.engine:ClientCmd("echo \"[Celestial] Applied world visuals for " .. var_15_0 .. "\"")
		end
	end
end)

drawBombTimer = nil
slot_0_106_5 = {
	site = "?",
	defuseLen = 0,
	defuseStart = 0,
	defusing = false,
	plantTime = 0,
	active = false
}
slot_0_107_3 = 40
slot_0_108_4 = {
	{
		by = 2556,
		bx = 1218,
		ax = -1548,
		map = "de_dust2",
		ay = 2643
	},
	{
		by = 262,
		bx = 1404,
		ax = -290,
		map = "de_mirage",
		ay = -2070
	},
	{
		by = 2876,
		bx = 220,
		ax = 2088,
		map = "de_inferno",
		ay = 366,
		[0] = nil
	},
	{
		by = -780,
		bx = 490,
		ax = 680,
		map = "de_nuke",
		ay = -810,
		[0] = nil
	},
	{
		by = 1704,
		bx = -1906,
		ax = -1580,
		map = "de_overpass",
		ay = -320,
		[0] = nil
	},
	{
		by = 2296,
		bx = 1096,
		ax = -800,
		map = "de_anubis",
		ay = -1740,
		[0] = nil
	},
	{
		by = 124,
		bx = -769,
		ax = -414,
		map = "de_vertigo",
		ay = -747,
		[0] = nil
	},
	{
		by = 1460,
		bx = 645,
		ax = -710,
		map = "de_ancient",
		ay = -1350,
		[0] = nil
	},
	{
		by = 810,
		bx = 230,
		ax = -810,
		map = "de_train",
		ay = -510,
		[0] = nil
	}
}

function slot_0_109_3()
	return game.globalVars.m_flRealTime or 0
end

function slot_0_110_2(arg_17_0, arg_17_1)
	local var_17_0 = game.globalVars.m_szMapName or ""

	for iter_17_0, iter_17_1 in ipairs(slot_0_108_4) do
		if var_17_0:find(iter_17_1.map) then
			return slot_0_0_0.sqrt((arg_17_0 - iter_17_1.ax)^2 + (arg_17_1 - iter_17_1.ay)^2) < slot_0_0_0.sqrt((arg_17_0 - iter_17_1.bx)^2 + (arg_17_1 - iter_17_1.by)^2) and "A" or "B"
		end
	end

	return "?"
end

function slot_0_111_2()
	local var_18_0 = "?"

	entities.FindByClass("CC4", function(arg_19_0)
		if not arg_19_0 then
			return
		end

		local var_19_0 = arg_19_0:GetAbsOrigin()

		if var_19_0 then
			var_18_0 = slot_0_110_2(var_19_0.x, var_19_0.y)
		end
	end)

	return var_18_0
end

events.event:Add(function(arg_20_0)
	local var_20_0 = arg_20_0:GetName()

	if var_20_0 == "bomb_planted" then
		slot_0_106_5.active = true
		slot_0_106_5.plantTime = slot_0_109_3()
		slot_0_106_5.defusing = false
		slot_0_106_5.defuseStart = 0
		slot_0_106_5.defuseLen = 0
		slot_0_106_5.site = "?"

		local var_20_1 = arg_20_0:GetPawnFromId("userid")

		if var_20_1 then
			local var_20_2 = var_20_1:GetAbsOrigin()

			if var_20_2 then
				slot_0_106_5.site = slot_0_110_2(var_20_2.x, var_20_2.y)
			end
		end

		if slot_0_106_5.site == "?" then
			slot_0_106_5.site = slot_0_111_2()
		end
	elseif var_20_0 == "bomb_defused" or var_20_0 == "bomb_exploded" then
		slot_0_106_5.active = false
		slot_0_106_5.defusing = false
	elseif var_20_0 == "round_start" then
		slot_0_106_5.active = false
		slot_0_106_5.defusing = false
	elseif var_20_0 == "bomb_begindefuse" then
		slot_0_106_5.defusing = true
		slot_0_106_5.defuseStart = slot_0_109_3()

		local var_20_3 = arg_20_0:GetInt("haskit")

		slot_0_106_5.defuseLen = var_20_3 and var_20_3 ~= 0 and 5 or 10
	elseif var_20_0 == "bomb_abortdefuse" then
		slot_0_106_5.defusing = false
	end
end)

slot_0_112_2 = {}

function slot_0_113_2()
	local var_21_0 = slot_0_5_0.scale

	if slot_0_112_2.scale == var_21_0 then
		return slot_0_112_2
	end

	slot_0_112_2.scale = var_21_0
	slot_0_112_2.ROW_IH = slot_0_7_0(20)
	slot_0_112_2.PAD_IX = slot_0_7_0(12)
	slot_0_112_2.PAD_IY = slot_0_7_0(7)
	slot_0_112_2.R_IND = slot_0_7_0(7)
	slot_0_112_2.HDR_IH = slot_0_7_0(22)
	slot_0_112_2.gradIH = slot_0_7_0(3)
	slot_0_112_2.boxW = slot_0_0_0.max(slot_0_7_0(128), slot_0_7_0(110))
	slot_0_112_2.hdrY = slot_0_7_0(7)
	slot_0_112_2.colText = draw.Color(200, 200, 200, 230)
	slot_0_112_2.colHdr = draw.Color(220, 220, 220, 255)
	slot_0_112_2.colSep = draw.Color(60, 60, 60, 120)
	slot_0_112_2.colRed = draw.Color(247, 91, 91, 255)
	slot_0_112_2.colGrn = draw.Color(144, 238, 144, 230)

	local var_21_1 = draw.fonts.celestial_ind or draw.fonts.gui_main

	if var_21_1 then
		slot_0_112_2.hdrW = var_21_1:GetTextSize("Bomb").x
		slot_0_112_2.timeW = var_21_1:GetTextSize("Time").x
		slot_0_112_2.siteW = var_21_1:GetTextSize("Site").x
		slot_0_112_2.defuseW = var_21_1:GetTextSize("Defuse").x
	end

	return slot_0_112_2
end

function drawBombTimer()
	if not slot_0_26_0.bombTimer then
		return
	end

	if not slot_0_106_5.active then
		bombHud.lastW = 0

		return
	end

	slot_22_0_0 = game.engine

	if not slot_22_0_0:IsConnected() or not slot_22_0_0:InGame() then
		return
	end

	slot_22_1_0 = slot_0_109_3()
	slot_22_2_0 = slot_0_107_3 - (slot_22_1_0 - slot_0_106_5.plantTime)

	if slot_22_2_0 <= 0 then
		slot_0_106_5.active = false
		bombHud.lastW = 0

		return
	end

	slot_22_3_0 = slot_0_113_2()
	slot_22_4_0 = draw.surface
	slot_22_4_0.font = draw.fonts.celestial_ind or draw.fonts.gui_main
	slot_22_5_0 = slot_22_0_0:GetScreenSize()
	slot_22_6_0 = slot_22_3_0.boxW
	slot_22_7_0 = slot_0_106_5.defusing and 3 or 2
	slot_22_8_0 = slot_22_3_0.gradIH + slot_22_3_0.HDR_IH + slot_22_7_0 * slot_22_3_0.ROW_IH + slot_22_3_0.PAD_IY
	slot_22_9_0 = bombHud.x or slot_0_0_0.floor(slot_22_5_0 / 2 - slot_22_6_0 / 2)
	slot_22_10_0 = bombHud.y or slot_22_3_0.hdrY

	if not bombHud.x then
		bombHud.x = slot_22_9_0
	end

	if not bombHud.y then
		bombHud.y = slot_22_10_0
	end

	bombHud.lastW = slot_22_6_0
	bombHud.lastH = slot_22_8_0
	slot_22_11_0 = slot_22_3_0.R_IND

	slot_22_4_0:AddRectFilledRounded(draw.Rect(slot_22_9_0, slot_22_10_0, slot_22_9_0 + slot_22_6_0, slot_22_10_0 + slot_22_8_0), slot_0_37_0.hud, slot_22_11_0, draw.Rounding.ALL)

	slot_22_12_0 = slot_0_0_0.floor(slot_22_6_0 * slot_0_0_0.max(0, slot_0_0_0.min(1, slot_22_2_0 / slot_0_107_3)))

	if slot_22_12_0 > 0 then
		slot_22_13_1 = slot_22_3_0.gradIH
		slot_22_14_3 = slot_0_37_0.grad1

		slot_22_4_0:AddRectFilledRounded(draw.Rect(slot_22_9_0, slot_22_10_0, slot_22_9_0 + slot_22_11_0 * 2, slot_22_10_0 + slot_22_13_1 + slot_22_11_0), slot_22_14_3, slot_22_11_0, draw.Rounding.TOP_LEFT)

		if slot_22_12_0 >= slot_22_6_0 - slot_22_11_0 then
			slot_22_4_0:AddRectFilledRounded(draw.Rect(slot_22_9_0 + slot_22_12_0 - slot_22_11_0 * 2, slot_22_10_0, slot_22_9_0 + slot_22_12_0, slot_22_10_0 + slot_22_13_1 + slot_22_11_0), slot_22_14_3, slot_22_11_0, draw.Rounding.TOP_RIGHT)
		end

		slot_22_15_1 = slot_22_9_0 + slot_22_11_0 - 2
		slot_22_16_1 = slot_22_9_0 + slot_0_0_0.min(slot_22_12_0, slot_22_6_0 - slot_22_11_0 + 1)

		if slot_22_15_1 < slot_22_16_1 then
			slot_22_4_0:AddRectFilled(draw.Rect(slot_22_15_1, slot_22_10_0, slot_22_16_1, slot_22_10_0 + slot_22_13_1), slot_22_14_3)
		end

		slot_22_4_0:AddRectFilled(draw.Rect(slot_22_9_0, slot_22_10_0 + slot_22_13_1, slot_22_9_0 + slot_22_6_0, slot_22_10_0 + slot_22_13_1 + slot_22_11_0), slot_0_37_0.hud)
	end

	slot_22_4_0:AddText(draw.Vec2(slot_22_9_0 + slot_0_0_0.floor((slot_22_6_0 - (slot_22_3_0.hdrW or 20)) / 2), slot_22_10_0 + slot_22_3_0.hdrY), "Bomb", slot_22_3_0.colHdr)

	slot_22_13_0 = slot_22_10_0 + slot_22_3_0.HDR_IH + slot_22_3_0.gradIH

	slot_22_4_0:AddRectFilled(draw.Rect(slot_22_9_0 + slot_22_11_0, slot_22_13_0, slot_22_9_0 + slot_22_6_0 - slot_22_11_0, slot_22_13_0 + 1), slot_22_3_0.colSep)

	slot_22_14_2 = slot_22_13_0 + slot_22_3_0.PAD_IY - 2
	slot_22_15_0 = slot_22_3_0.PAD_IX
	slot_22_16_0 = slot_22_3_0.colText
	slot_22_17_0 = string.format("%.1fs", slot_22_2_0)
	slot_22_18_0 = slot_22_2_0 <= 10 and slot_22_3_0.colRed or slot_22_16_0

	slot_22_4_0:AddText(draw.Vec2(slot_22_9_0 + slot_22_15_0, slot_22_14_2), "Time", slot_22_16_0)
	slot_22_4_0:AddText(draw.Vec2(slot_22_9_0 + slot_22_6_0 - slot_22_15_0 - slot_22_4_0.font:GetTextSize(slot_22_17_0).x, slot_22_14_2), slot_22_17_0, slot_22_18_0)

	slot_22_14_1 = slot_22_14_2 + slot_22_3_0.ROW_IH
	slot_22_19_0 = slot_0_106_5.site or "?"

	slot_22_4_0:AddText(draw.Vec2(slot_22_9_0 + slot_22_15_0, slot_22_14_1), "Site", slot_22_16_0)
	slot_22_4_0:AddText(draw.Vec2(slot_22_9_0 + slot_22_6_0 - slot_22_15_0 - slot_22_4_0.font:GetTextSize(slot_22_19_0).x, slot_22_14_1), slot_22_19_0, slot_22_16_0)

	slot_22_14_0 = slot_22_14_1 + slot_22_3_0.ROW_IH

	if slot_0_106_5.defusing then
		slot_22_20_0 = slot_0_0_0.max(0, slot_0_106_5.defuseLen - (slot_22_1_0 - slot_0_106_5.defuseStart))
		slot_22_21_0 = string.format("%.1fs", slot_22_20_0)
		slot_22_22_0 = slot_22_20_0 < slot_22_2_0 and slot_22_3_0.colGrn or slot_22_3_0.colRed

		slot_22_4_0:AddText(draw.Vec2(slot_22_9_0 + slot_22_15_0, slot_22_14_0), "Defuse", slot_22_22_0)
		slot_22_4_0:AddText(draw.Vec2(slot_22_9_0 + slot_22_6_0 - slot_22_15_0 - slot_22_4_0.font:GetTextSize(slot_22_21_0).x, slot_22_14_0), slot_22_21_0, slot_22_16_0)
	end
end

slot_0_106_4 = gui.MakeStackedGroups("miscCol1", draw.Vec2(224, 460), {
	slot_0_83_1,
	slot_0_97_1
})
slot_0_107_2 = gui.MakeStackedGroups("miscCol2", draw.Vec2(224, 460), {
	slot_0_91_2,
	slot_0_98_3
})
slot_0_108_3 = gui.MakeStackedGroups("miscCol3", draw.Vec2(224, 460), {
	slot_0_92_3
})

slot_0_62_1:Add(slot_0_106_4)
slot_0_62_1:Add(slot_0_107_2)
slot_0_62_1:Add(slot_0_108_3)
slot_0_62_1:Reset()

slot_0_109_2 = gui.Group("celGrpMove", "Movement", 220, gui.GroupWidthMode.REDUCED)
slot_0_54_0.nfd = gui.Checkbox("celNfd")

slot_0_109_2:Add(gui.MakeControl("No fall damage", slot_0_54_0.nfd))

slot_0_54_0.align = gui.Checkbox("celAlign")
slot_0_110_1 = gui.MakeControl("Auto align", slot_0_54_0.align)
slot_0_111_1 = gui.Settings("celAlignSettings")
slot_0_55_0.alignAng = gui.Slider("celAlignAng", 5, 90)

slot_0_55_0.alignAng:GetValue():Set(slot_0_27_0.alignAng)
slot_0_111_1:Add(gui.MakeControl("Align angle", slot_0_55_0.alignAng))
slot_0_110_1:Add(slot_0_111_1)
slot_0_109_2:Add(slot_0_110_1)

slot_0_54_0.legitStrafe = gui.Checkbox("celLegitStrafe")

slot_0_109_2:Add(gui.MakeControl("Legit auto strafe", slot_0_54_0.legitStrafe))

slot_0_54_0.fakeBack = gui.Checkbox("celFakeBack")
slot_0_112_1 = gui.MakeControl("Fake backwards", slot_0_54_0.fakeBack)
slot_0_113_1 = gui.Settings("celFbSettings")
slot_0_55_0.fbSpeed = gui.Slider("celFbSpeed", 1, 100)

slot_0_55_0.fbSpeed:GetValue():Set(15)
slot_0_113_1:Add(gui.MakeControl("Speed", slot_0_55_0.fbSpeed))
slot_0_112_1:Add(slot_0_113_1)
slot_0_109_2:Add(slot_0_112_1)

slot_0_54_0.nullStrafe = gui.Checkbox("celNullStrafe")

slot_0_109_2:Add(gui.MakeControl("Null strafe", slot_0_54_0.nullStrafe))

slot_0_54_0.nullStrafeV2 = gui.Checkbox("celNullStrafeV2")

slot_0_109_2:Add(gui.MakeControl("Null strafe v2", slot_0_54_0.nullStrafeV2))

slot_0_54_0.smartEj = gui.Checkbox("celSmartEj")
slot_0_114_1 = gui.MakeControl("Smart edge jump", slot_0_54_0.smartEj)
slot_0_115_1 = gui.Settings("celSejSettings")
slot_0_54_0.sejMode = gui.ComboBox("celSejMode")

slot_0_54_0.sejMode:Add(gui.Selectable("celSejCircle", "Circle"))
slot_0_54_0.sejMode:Add(gui.Selectable("celSejLine", "Line"))
slot_0_115_1:Add(gui.MakeControl("Mode", slot_0_54_0.sejMode))

slot_0_55_0.sejLen = gui.Slider("celSejLen", 50, 500)

slot_0_55_0.sejLen:GetValue():Set(150)
slot_0_115_1:Add(gui.MakeControl("Size", slot_0_55_0.sejLen))

slot_0_55_0.sejWid = gui.Slider("celSejWid", 10, 150)

slot_0_55_0.sejWid:GetValue():Set(60)
slot_0_115_1:Add(gui.MakeControl("Line width", slot_0_55_0.sejWid))

slot_0_54_0.sejShowSpots = gui.Checkbox("celSejShowSpots")

slot_0_54_0.sejShowSpots:GetValue():Set(true)
slot_0_115_1:Add(gui.MakeControl("Show spots", slot_0_54_0.sejShowSpots))

slot_0_54_0.sejAdd = gui.Button("celSejAdd", "Add spot")

slot_0_115_1:Add(slot_0_54_0.sejAdd)

slot_0_54_0.sejClear = gui.Button("celSejClear", "Clear last")

slot_0_115_1:Add(slot_0_54_0.sejClear)

slot_0_54_0.sejClearAll = gui.Button("celSejClearAll", "Clear all")

slot_0_115_1:Add(slot_0_54_0.sejClearAll)
slot_0_114_1:Add(slot_0_115_1)
slot_0_109_2:Add(slot_0_114_1)
slot_0_109_2:Reset()

slot_0_116_3 = gui.Group("celGrpInd", "Indicators", 220, gui.GroupWidthMode.REDUCED)
slot_0_54_0.jbej = gui.Checkbox("celJbej")

slot_0_116_3:Add(gui.MakeControl("Movement indicators", slot_0_54_0.jbej))

slot_0_54_0.vel = gui.Checkbox("celVel")

slot_0_116_3:Add(gui.MakeControl("Show velocity", slot_0_54_0.vel))

slot_0_54_0.keys = gui.Checkbox("celKeys")

slot_0_116_3:Add(gui.MakeControl("Show movement keys", slot_0_54_0.keys))

slot_0_55_0.hudX = gui.Slider("celHudX", -500, 500)

slot_0_55_0.hudX:GetValue():Set(0)
slot_0_116_3:Add(gui.MakeControl("x", slot_0_55_0.hudX))

slot_0_55_0.hudY = gui.Slider("celHudY", -500, 500)

slot_0_55_0.hudY:GetValue():Set(150)
slot_0_116_3:Add(gui.MakeControl("y", slot_0_55_0.hudY))
slot_0_116_3:Reset()

slot_0_117_3 = gui.MakeStackedGroups("movCol1", draw.Vec2(224, 460), {
	slot_0_109_2
})
slot_0_118_4 = gui.MakeStackedGroups("movCol2", draw.Vec2(224, 460), {
	slot_0_116_3
})

slot_0_63_1:Add(slot_0_117_3)
slot_0_63_1:Add(slot_0_118_4)
slot_0_63_1:Reset()

slot_0_119_4 = gui.Group("celGrpLegitAim", "Aim", 280, gui.GroupWidthMode.REDUCED)
slot_0_54_0.hcTrigger = gui.Checkbox("celHcTrigger")
slot_0_120_4 = gui.MakeControl("Hitchance triggerbot", slot_0_54_0.hcTrigger)
slot_0_121_4 = gui.Settings("celHcSettings")
slot_0_54_0.hcPredict = gui.Checkbox("celHcPredict")
slot_0_55_0.hcValue = gui.Slider("celHcValue", 0, 100)

slot_0_55_0.hcValue:GetValue():Set(50)

slot_0_55_0.hcPs = gui.Slider("celHcPs", 0, 100)

slot_0_55_0.hcPs:GetValue():Set(100)
slot_0_121_4:Add(gui.MakeControl("Predict Spread (Seedless)", slot_0_54_0.hcPredict))
slot_0_121_4:Add(gui.MakeControl("Hitchance", slot_0_55_0.hcValue))
slot_0_121_4:Add(gui.MakeControl("Pointscale", slot_0_55_0.hcPs))
slot_0_120_4:Add(slot_0_121_4)
slot_0_119_4:Add(slot_0_120_4)

slot_0_54_0.legitAim = gui.Checkbox("celLegitAim")
slot_0_122_4 = gui.MakeControl("Aimbot", slot_0_54_0.legitAim)
slot_0_123_4 = gui.Settings("celLaSettings")
slot_0_55_0.laFov = gui.Slider("celLaFov", 1, 30)

slot_0_55_0.laFov:GetValue():Set(5)
slot_0_123_4:Add(gui.MakeControl("fov", slot_0_55_0.laFov))

slot_0_55_0.laSmooth = gui.Slider("celLaSmooth", 1, 100)

slot_0_55_0.laSmooth:GetValue():Set(15)
slot_0_123_4:Add(gui.MakeControl("Smooth", slot_0_55_0.laSmooth))

slot_0_54_0.laHitbox = gui.ComboBox("celLaHitbox")
slot_0_54_0.laHitbox.allowMultiple = true

slot_0_54_0.laHitbox:Add(gui.Selectable("celLaHbHead", "Head"))
slot_0_54_0.laHitbox:Add(gui.Selectable("celLaHbNeck", "Neck"))
slot_0_54_0.laHitbox:Add(gui.Selectable("celLaHbUchest", "Upper Chest"))
slot_0_54_0.laHitbox:Add(gui.Selectable("celLaHbChest", "Chest"))
slot_0_54_0.laHitbox:Add(gui.Selectable("celLaHbStomach", "Stomach"))
slot_0_54_0.laHitbox:Add(gui.Selectable("celLaHbPelvis", "Pelvis"))
slot_0_54_0.laHitbox:Reset()
slot_0_123_4:Add(gui.MakeControl("Hitbox", slot_0_54_0.laHitbox))
slot_0_122_4:Add(slot_0_123_4)
slot_0_119_4:Add(slot_0_122_4)

slot_0_54_0.legitAwall = gui.Checkbox("celLegitAwall")

slot_0_119_4:Add(gui.MakeControl("Awall", slot_0_54_0.legitAwall))

slot_0_54_0.legitStop = gui.Checkbox("celLegitStop")
slot_0_124_4 = gui.MakeControl("Quick stop", slot_0_54_0.legitStop)
slot_0_125_4 = gui.Settings("celLstopSettings")
slot_0_54_0.lstopEarly = gui.Checkbox("celLstopEarly")

slot_0_125_4:Add(gui.MakeControl("Early", slot_0_54_0.lstopEarly))
slot_0_124_4:Add(slot_0_125_4)
slot_0_119_4:Add(slot_0_124_4)

slot_0_55_0.laMd = gui.Slider("celLaMd", 1, 110)

slot_0_55_0.laMd:GetValue():Set(1)
slot_0_119_4:Add(gui.MakeControl("Min damage", slot_0_55_0.laMd))
slot_0_119_4:Reset()

slot_0_126_4 = gui.MakeStackedGroups("legitCol1", draw.Vec2(224, 460), {
	slot_0_119_4
})

slot_0_60_1:Add(slot_0_126_4)
slot_0_60_1:Reset()

slot_0_127_4 = gui.Group("celGrpSemi", "Semi", 220, gui.GroupWidthMode.REDUCED)
slot_0_54_0.aimLock = gui.Checkbox("celAimLock")
slot_0_128_4 = gui.MakeControl("Aim lock", slot_0_54_0.aimLock)
slot_0_129_4 = gui.Settings("celAlSettings")
slot_0_55_0.alFov = gui.Slider("celAlFov", 1, 60)

slot_0_55_0.alFov:GetValue():Set(slot_0_39_0.fov)

slot_0_55_0.alSmooth = gui.Slider("celAlSmooth", 1, 30)

slot_0_55_0.alSmooth:GetValue():Set(slot_0_39_0.smooth)
slot_0_129_4:Add(gui.MakeControl("fov", slot_0_55_0.alFov))
slot_0_129_4:Add(gui.MakeControl("Smooth", slot_0_55_0.alSmooth))
slot_0_128_4:Add(slot_0_129_4)
slot_0_127_4:Add(slot_0_128_4)

slot_0_54_0.dsEnable = gui.Checkbox("celDsEnable")
slot_0_130_4 = gui.MakeControl("Autofire delay", slot_0_54_0.dsEnable)
slot_0_131_4 = gui.Settings("celDsSettings")
slot_0_55_0.dsMs = gui.Slider("celDsMs", 10, 1000)

slot_0_55_0.dsMs:GetValue():Set(200)
slot_0_131_4:Add(gui.MakeControl("Delay ms", slot_0_55_0.dsMs))
slot_0_130_4:Add(slot_0_131_4)
slot_0_127_4:Add(slot_0_130_4)

slot_0_54_0.fnsTrigger = gui.Checkbox("celFnsTrigger")

slot_0_127_4:Add(gui.MakeControl("FNS triggerbot", slot_0_54_0.fnsTrigger))
slot_0_127_4:Reset()

slot_0_132_4 = gui.MakeStackedGroups("semiCol1", draw.Vec2(224, 460), {
	slot_0_127_4
})

slot_0_61_1:Add(slot_0_132_4)
slot_0_61_1:Reset()

slot_0_133_2 = gui.Group("celGrpWm", "Visuals", 180, gui.GroupWidthMode.REDUCED)
slot_0_54_0.wmCombo = gui.ComboBox("celWmCombo")
slot_0_54_0.wmCombo.allowMultiple = true

slot_0_54_0.wmCombo:Add(gui.Selectable("celWmUser", "User"))
slot_0_54_0.wmCombo:Add(gui.Selectable("celWmFps", "FPS"))
slot_0_54_0.wmCombo:Add(gui.Selectable("celWmPing", "Ping"))
slot_0_54_0.wmCombo:Add(gui.Selectable("celWmKd", "KD"))
slot_0_133_2:Add(gui.MakeControl("Watermark", slot_0_54_0.wmCombo))

slot_0_54_0.hitlog = gui.Checkbox("celHitlog")

slot_0_133_2:Add(gui.MakeControl("Hitlog", slot_0_54_0.hitlog))

slot_0_54_0.gradCol1 = gui.ColorPicker("celGradCol1", true)

slot_0_54_0.gradCol1:GetValue():Set(draw.Color(144, 170, 241, 255))
slot_0_133_2:Add(gui.MakeControl("Top colour", slot_0_54_0.gradCol1))

slot_0_54_0.hudCol = gui.ColorPicker("celHudCol", true)

slot_0_54_0.hudCol:GetValue():Set(draw.Color(45, 50, 65, 255))
slot_0_133_2:Add(gui.MakeControl("hud colour", slot_0_54_0.hudCol))
slot_0_133_2:Reset()

slot_0_134_2 = gui.Group("celGrpSetFeat", "Features", 180, gui.GroupWidthMode.REDUCED)
slot_0_54_0.clantag = gui.Checkbox("celClantag")

slot_0_134_2:Add(gui.MakeControl("Clan tag", slot_0_54_0.clantag))
slot_0_134_2:Reset()

slot_0_135_2 = gui.Group("celGrpCfg", "Config", 180, gui.GroupWidthMode.REDUCED)
slot_0_54_0.cfgSelect = gui.ComboBox("celCfgSelect")

slot_0_135_2:Add(gui.MakeControl("Configs", slot_0_54_0.cfgSelect))

slot_0_54_0.cfgName = gui.TextInput("celCfgName")
slot_0_54_0.cfgName.placeholder = "Config name..."

slot_0_135_2:Add(gui.MakeControl("Name", slot_0_54_0.cfgName))

slot_0_54_0.btnCreate = gui.Button("celBtnCreate", "Create")

slot_0_135_2:Add(slot_0_54_0.btnCreate)

slot_0_54_0.btnSave = gui.Button("celBtnSave", "Save")

slot_0_135_2:Add(slot_0_54_0.btnSave)

slot_0_54_0.btnLoad = gui.Button("celBtnLoad", "Load")

slot_0_135_2:Add(slot_0_54_0.btnLoad)

slot_0_54_0.btnDelete = gui.Button("celBtnDelete", "Delete")

slot_0_135_2:Add(slot_0_54_0.btnDelete)
slot_0_135_2:Reset()

slot_0_136_2 = gui.MakeStackedGroups("setCol1", draw.Vec2(224, 460), {
	slot_0_133_2
})
slot_0_137_2 = gui.MakeStackedGroups("setCol2", draw.Vec2(224, 460), {
	slot_0_135_2
})
slot_0_138_2 = gui.MakeStackedGroups("setCol3", draw.Vec2(224, 460), {
	slot_0_134_2
})

slot_0_64_1:Add(slot_0_136_2)
slot_0_64_1:Add(slot_0_137_2)
slot_0_64_1:Add(slot_0_138_2)
slot_0_64_1:Reset()

if slot_0_54_0.wmCombo then
	slot_0_139_3 = slot_0_54_0.wmCombo:Get()

	if slot_0_139_3 then
		slot_0_139_3:Set(0)
		slot_0_139_3:Set(1)
		slot_0_139_3:Set(2)
		slot_0_139_3:Set(3)
	end
end

slot_0_139_2 = {}

function slot_0_140_2(arg_23_0)
	local var_23_0 = {}

	for iter_23_0, iter_23_1 in pairs(slot_0_54_0) do
		if type(iter_23_1.GetValue) == "function" then
			local var_23_1 = iter_23_1:Get()

			if type(var_23_1) == "boolean" or type(var_23_1) == "number" then
				var_23_0["b_" .. iter_23_0] = var_23_1
			elseif type(var_23_1) == "userdata" and var_23_1.GetRaw then
				var_23_0["m_" .. iter_23_0] = var_23_1:GetRaw() or 0
			elseif type(var_23_1) == "userdata" and var_23_1.GetR then
				var_23_0["c_" .. iter_23_0] = {
					[0] = nil,
					r = var_23_1:GetR(),
					g = var_23_1:GetG(),
					b = var_23_1:GetB(),
					a = var_23_1:GetA()
				}
			end
		end
	end

	for iter_23_2, iter_23_3 in pairs(slot_0_55_0) do
		if type(iter_23_3.GetValue) == "function" then
			var_23_0["s_" .. iter_23_2] = iter_23_3:Get() or 0
		end
	end

	local var_23_2 = {}

	for iter_23_4, iter_23_5 in ipairs(slot_0_36_0) do
		var_23_2[iter_23_4] = {
			slot = nil,
			l = iter_23_5.l,
			m = iter_23_5.m,
			type = iter_23_5.type,
			px = iter_23_5.p and iter_23_5.p.x or 0,
			py = iter_23_5.p and iter_23_5.p.y or 0,
			pz = iter_23_5.p and iter_23_5.p.z or 0,
			vx = iter_23_5.va and iter_23_5.va.x or 0,
			vy = iter_23_5.va and iter_23_5.va.y or 0,
			vz = iter_23_5.va and iter_23_5.va.z or 0
		}
	end

	var_23_0._nadeList = var_23_2
	var_23_0._worldVis = slot_0_101_1

	return utils.DbSave(var_23_0, "celestial_cfg_" .. arg_23_0)
end

function slot_0_141_2(arg_24_0)
	slot_24_1_0 = utils.DbLoad("celestial_cfg_" .. arg_24_0)

	if not slot_24_1_0 then
		game.engine:ClientCmd("echo \"[Celestial] Config " .. arg_24_0 .. " not found\"")
		gui.notify:Add(gui.Notification("Celestial", "Not found: " .. arg_24_0))

		return
	end

	for iter_24_0, iter_24_1 in pairs(slot_24_1_0) do
		slot_24_7_0 = string.sub(iter_24_0, 1, 2)
		slot_24_8_0 = string.sub(iter_24_0, 3)

		if slot_24_7_0 == "b_" and slot_0_54_0[slot_24_8_0] then
			slot_24_9_3 = slot_0_54_0[slot_24_8_0]:GetValue()

			if slot_24_9_3 then
				slot_24_9_3:Set(iter_24_1)
			end
		elseif slot_24_7_0 == "s_" and slot_0_55_0[slot_24_8_0] then
			slot_24_9_2 = slot_0_55_0[slot_24_8_0]:GetValue()

			if slot_24_9_2 then
				slot_24_9_2:Set(tonumber(iter_24_1) or 0)
			end
		elseif slot_24_7_0 == "c_" and slot_0_54_0[slot_24_8_0] then
			slot_24_9_1 = slot_0_54_0[slot_24_8_0]:GetValue()

			if slot_24_9_1 and type(iter_24_1) == "table" then
				slot_24_9_1:Set(draw.Color(iter_24_1.r or 255, iter_24_1.g or 255, iter_24_1.b or 255, iter_24_1.a or 255))
			end
		elseif slot_24_7_0 == "m_" and slot_0_54_0[slot_24_8_0] then
			slot_24_9_0 = slot_0_54_0[slot_24_8_0]:GetValue()

			if slot_24_9_0 then
				slot_24_10_0 = slot_24_9_0:Get()

				if slot_24_10_0 and slot_24_10_0.SetRaw then
					slot_24_10_0:SetRaw(tonumber(iter_24_1) or 0)
				end
			end
		end
	end

	if slot_24_1_0._nadeList and type(slot_24_1_0._nadeList) == "table" then
		for iter_24_2 = #slot_0_36_0, 1, -1 do
			slot_0_36_0[iter_24_2] = nil
		end

		for iter_24_3, iter_24_4 in ipairs(slot_24_1_0._nadeList) do
			if iter_24_4.px and iter_24_4.py and iter_24_4.pz and iter_24_4.m then
				table.insert(slot_0_36_0, {
					[0] = nil,
					l = iter_24_4.l or "Nade",
					m = iter_24_4.m,
					type = iter_24_4.type or iter_24_4.l or "Nade",
					p = Vector(tonumber(iter_24_4.px) or 0, tonumber(iter_24_4.py) or 0, tonumber(iter_24_4.pz) or 0),
					va = Vector(tonumber(iter_24_4.vx) or 0, tonumber(iter_24_4.vy) or 0, tonumber(iter_24_4.vz) or 0)
				})
			end
		end

		game.engine:ClientCmd("echo \"[Celestial] Loaded " .. #slot_0_36_0 .. " nade lineups\"")
	end

	if slot_24_1_0._worldVis and type(slot_24_1_0._worldVis) == "table" then
		slot_0_101_1 = slot_24_1_0._worldVis

		utils.DbSave(slot_0_101_1, "celestial_wv")

		if slot_0_54_0.worldVisEnabled and slot_0_54_0.worldVisEnabled:Get() then
			slot_24_2_0 = game.globalVars.m_szMapName or ""

			if #slot_24_2_0 > 0 and slot_0_101_1[slot_24_2_0] then
				slot_0_104_3(slot_0_101_1[slot_24_2_0])
				game.engine:ClientCmd("echo \"[Celestial] Applied world visuals for " .. slot_24_2_0 .. "\"")
			end
		end
	end

	game.engine:ClientCmd("echo \"[Celestial] Loaded " .. arg_24_0 .. "\"")
	gui.notify:Add(gui.Notification("Celestial", "Loaded: " .. arg_24_0))
end

function slot_0_142_2(arg_25_0)
	utils.DbSave(nil, "celestial_cfg_" .. arg_25_0)

	local var_25_0 = {}

	for iter_25_0, iter_25_1 in ipairs(slot_0_139_2) do
		if iter_25_1 ~= arg_25_0 then
			table.insert(var_25_0, iter_25_1)
		end
	end

	slot_0_139_2 = var_25_0

	utils.DbSave(slot_0_139_2, "celestial_cfg_index")
	game.engine:ClientCmd("echo \"[Celestial] Deleted " .. arg_25_0 .. "\"")
	gui.notify:Add(gui.Notification("Celestial", "Deleted: " .. arg_25_0))
end

slot_0_143_2 = {}

function slot_0_144_3()
	local var_26_0 = utils.DbLoad("celestial_cfg_index")

	slot_0_139_2 = {}

	if type(var_26_0) == "table" and #var_26_0 > 0 then
		for iter_26_0, iter_26_1 in ipairs(var_26_0) do
			if type(iter_26_1) == "string" and iter_26_1:sub(1, 5) ~= "slot_" and iter_26_1 ~= "default" then
				table.insert(slot_0_139_2, iter_26_1)
			end
		end
	end

	if slot_0_54_0.cfgSelect then
		for iter_26_2, iter_26_3 in ipairs(slot_0_143_2) do
			iter_26_3:SetVisible(false)
		end

		slot_0_143_2 = {}

		for iter_26_4, iter_26_5 in ipairs(slot_0_139_2) do
			local var_26_1 = gui.Selectable("celCfgItem" .. tostring(iter_26_4), iter_26_5)

			slot_0_54_0.cfgSelect:Add(var_26_1)

			slot_0_143_2[#slot_0_143_2 + 1] = var_26_1
		end

		slot_0_54_0.cfgSelect:Reset()
	end
end

slot_0_144_3()

function slot_0_145_2()
	if not slot_0_54_0.cfgSelect then
		return nil
	end

	local var_27_0 = slot_0_54_0.cfgSelect:Get()

	if not var_27_0 then
		return nil
	end

	for iter_27_0, iter_27_1 in ipairs(slot_0_139_2) do
		if var_27_0:Get(iter_27_0 - 1) then
			return iter_27_1
		end
	end

	return nil
end

if slot_0_54_0.btnCreate then
	slot_0_54_0.btnCreate:AddCallback(function()
		local var_28_0 = slot_0_54_0.cfgName and slot_0_54_0.cfgName.value or ""

		if #var_28_0 == 0 then
			return
		end

		slot_0_140_2(var_28_0)

		local var_28_1 = false

		for iter_28_0, iter_28_1 in ipairs(slot_0_139_2) do
			if iter_28_1 == var_28_0 then
				var_28_1 = true

				break
			end
		end

		if not var_28_1 then
			table.insert(slot_0_139_2, var_28_0)
			utils.DbSave(slot_0_139_2, "celestial_cfg_index")
		end

		slot_0_144_3()
		game.engine:ClientCmd("echo \"[Celestial] Created " .. var_28_0 .. "\"")
		gui.notify:Add(gui.Notification("Celestial", "Created: " .. var_28_0))
	end)
end

if slot_0_54_0.btnSave then
	slot_0_54_0.btnSave:AddCallback(function()
		local var_29_0 = slot_0_145_2() or slot_0_54_0.cfgName and slot_0_54_0.cfgName.value or ""

		if #(var_29_0 or "") == 0 then
			return
		end

		slot_0_140_2(var_29_0)
		game.engine:ClientCmd("echo \"[Celestial] Saved " .. var_29_0 .. "\"")
		gui.notify:Add(gui.Notification("Celestial", "Saved: " .. var_29_0))
	end)
end

if slot_0_54_0.btnLoad then
	slot_0_54_0.btnLoad:AddCallback(function()
		local var_30_0 = slot_0_145_2()

		if not var_30_0 or #var_30_0 == 0 then
			var_30_0 = slot_0_54_0.cfgName and slot_0_54_0.cfgName.value or ""
		end

		if #(var_30_0 or "") == 0 then
			return
		end

		slot_0_141_2(var_30_0)
	end)
end

if slot_0_54_0.btnDelete then
	slot_0_54_0.btnDelete:AddCallback(function()
		local var_31_0 = slot_0_145_2()

		if var_31_0 and #var_31_0 > 0 then
			slot_0_142_2(var_31_0)
			slot_0_144_3()
		end
	end)
end

function syncNativeControls()
	if not slot_0_54_0.accBoostLevel then
		return
	end

	slot_0_29_0.fastLadder = slot_0_54_0.fastLad:Get() or false
	slot_32_0_0 = slot_0_54_0.rsEarly and slot_0_54_0.rsEarly:Get()
	slot_32_1_0 = 0

	if slot_32_0_0 then
		for iter_32_0 = 0, 2 do
			if slot_32_0_0:Get(iter_32_0) then
				slot_32_1_0 = iter_32_0

				break
			end
		end
	end

	slot_0_29_0.rsEarlyMode = slot_32_1_0
	slot_0_29_0.rageScoutPs = slot_0_54_0.scoutPs:Get() or false
	slot_0_29_0.knifeDt = slot_0_54_0.knifeDt:Get() or false
	slot_0_29_0.scoutAirFs = slot_0_54_0.scoutAir:Get() or false
	slot_32_2_0 = 0
	slot_32_3_0 = slot_0_54_0.accBoostLevel:Get()

	if slot_32_3_0 then
		for iter_32_1 = 0, 4 do
			if slot_32_3_0:Get(iter_32_1) then
				slot_32_2_0 = iter_32_1

				break
			end
		end
	end

	slot_0_48_0.enabled = slot_32_2_0 > 0
	slot_32_4_0 = {
		0,
		6,
		11,
		16,
		20,
		[0] = nil
	}
	slot_0_48_0.maxBoost = slot_32_4_0[slot_32_2_0 + 1] or 0
	slot_0_49_0.enabled = slot_0_54_0.ssgm:Get() or false
	slot_0_49_0.hc = slot_0_0_0.floor(slot_0_55_0.ssgHc:GetValue():Get() or 60)
	slot_0_49_0.ps = slot_0_0_0.floor(slot_0_55_0.ssgPs:GetValue():Get() or 38)
	slot_0_38_0.enabled = slot_0_54_0.freestand:Get() or false
	slot_0_29_0.lowHpWarn = slot_0_54_0.lowHp:Get() or false
	slot_0_29_0.dsEnabled = slot_0_54_0.dsEnable and slot_0_54_0.dsEnable:Get() or false
	slot_0_29_0.dsMs = slot_0_55_0.dsMs and slot_0_55_0.dsMs:GetValue():Get() or 200
	slot_0_29_0.sparkle = slot_0_54_0.sparkle:Get() or false
	slot_0_29_0.fdVm = slot_0_54_0.fdVm:Get() or false
	slot_32_5_0 = slot_0_54_0.indCombo:Get()

	if slot_32_5_0 then
		slot_0_26_0.aa = slot_32_5_0:Get(0) or false
		slot_0_26_0.rageawall = slot_32_5_0:Get(1) or false
		slot_0_26_0.legitawall = slot_32_5_0:Get(2) or false
		slot_0_26_0.ns = slot_32_5_0:Get(3) or false
		slot_0_26_0.autofire = slot_32_5_0:Get(4) or false
		slot_0_26_0.jb = slot_32_5_0:Get(5) or false
		slot_0_26_0.ej = slot_32_5_0:Get(6) or false
		slot_0_26_0.aipeek = slot_32_5_0:Get(7) or false
		slot_0_26_0.afdelay = slot_32_5_0:Get(8) or false
		slot_0_26_0.rageFov = slot_32_5_0:Get(9) or false
		slot_0_26_0.minDmg = slot_32_5_0:Get(10) or false
		slot_0_26_0.minAcc = slot_32_5_0:Get(11) or false
		slot_0_26_0.autoRetreat = slot_32_5_0:Get(12) or false
		slot_0_26_0.jumpApex = slot_32_5_0:Get(13) or false
		slot_0_26_0.bombTimer = slot_32_5_0:Get(14) or false
	end

	slot_0_27_0.jbej = slot_0_54_0.jbej:Get() or false
	slot_0_27_0.vel = slot_0_54_0.vel:Get() or false
	slot_0_27_0.keys = slot_0_54_0.keys:Get() or false

	if slot_0_55_0.hudX then
		slot_0_27_0.offX = slot_0_55_0.hudX:GetValue():Get() or 0
	end

	if slot_0_55_0.hudY then
		slot_0_27_0.offY = slot_0_55_0.hudY:GetValue():Get() or 150
	end

	slot_0_29_0.nfd = slot_0_54_0.nfd:Get() or false
	slot_0_27_0.autoAlign = slot_0_54_0.align:Get() or false
	slot_0_27_0.alignAng = slot_0_0_0.floor(slot_0_55_0.alignAng:GetValue():Get() or 45)
	slot_0_39_0.enabled = slot_0_54_0.aimLock:Get() or false
	slot_0_39_0.fov = slot_0_0_0.floor(slot_0_55_0.alFov:GetValue():Get() or 15)
	slot_0_39_0.smooth = slot_0_0_0.floor(slot_0_55_0.alSmooth:GetValue():Get() or 5)
	slot_32_6_0 = slot_0_54_0.wmCombo:Get()

	if slot_32_6_0 then
		slot_0_42_0.showUser = slot_32_6_0:Get(0) or false
		slot_0_42_0.showFps = slot_32_6_0:Get(1) or false
		slot_0_42_0.showPing = slot_32_6_0:Get(2) or false
		slot_0_42_0.showKd = slot_32_6_0:Get(3) or false
	end

	slot_0_42_0.enabled = slot_0_42_0.showUser or slot_0_42_0.showFps or slot_0_42_0.showPing or slot_0_42_0.showKd
	slot_0_44_0 = slot_0_54_0.hitlog:Get() or false
	slot_0_43_0 = slot_0_54_0.clantag:Get() or false

	if slot_0_54_0.gradCol1 then
		slot_0_37_0.grad1 = slot_0_54_0.gradCol1:Get()
		slot_32_7_2 = slot_0_37_0.grad1

		if slot_32_7_2 and slot_32_7_2.GetR then
			slot_0_37_0.grad1r = slot_32_7_2:GetR()
			slot_0_37_0.grad1g = slot_32_7_2:GetG()
			slot_0_37_0.grad1b = slot_32_7_2:GetB()
		end
	end

	if slot_0_54_0.hudCol then
		slot_0_37_0.hud = slot_0_54_0.hudCol:Get()
		slot_32_7_1 = slot_0_37_0.hud

		if slot_32_7_1 and slot_32_7_1.GetR then
			slot_0_37_0.hudr = slot_32_7_1:GetR()
			slot_0_37_0.hudg = slot_32_7_1:GetG()
			slot_0_37_0.hudb = slot_32_7_1:GetB()
		end
	end

	if slot_0_54_0.slotsEnabled then
		slot_0_29_0.slotsEnabled = slot_0_54_0.slotsEnabled:Get() or false
	end

	if slot_0_54_0.slotSpin then
		slot_0_54_0.slotSpin:SetVisible(slot_0_29_0.slotsEnabled)
	end

	if slot_0_54_0.slavebotCb then
		if slot_0_54_0.slavebotCb:Get() or false then
			slot_0_26_0.slavebot = true
		elseif not slot_0_41_0.slavebot then
			slot_0_26_0.slavebot = false
		end
	end

	slot_32_7_0 = slot_0_54_0.wpEnabled and slot_0_54_0.wpEnabled:Get() or false

	if slot_0_54_0.wpAdd then
		slot_0_54_0.wpAdd:SetVisible(slot_32_7_0)
	end

	if slot_0_54_0.wpClear then
		slot_0_54_0.wpClear:SetVisible(slot_32_7_0)
	end
end

mods.events:AddListener("game_newmap")
mods.events:AddListener("player_death")
mods.events:AddListener("weapon_fire")
mods.events:AddListener("player_hurt")
mods.events:AddListener("bullet_impact")
mods.events:AddListener("round_start")
mods.events:AddListener("bomb_planted")
mods.events:AddListener("bomb_defused")
mods.events:AddListener("bomb_exploded")
mods.events:AddListener("bomb_begindefuse")
mods.events:AddListener("bomb_abortdefuse")
mods.events:AddListener("round_freeze_end")
mods.events:AddListener("round_end")
mods.events:AddListener("round_win")
mods.events:AddListener("cs_win_panel_match")
mods.events:AddListener("cs_win_panel_round")
mods.events:AddListener("round_announce_match_end")
mods.events:AddListener("player_chat")
events.event:Add(function(arg_33_0)
	slot_33_1_0 = arg_33_0:GetName()

	if slot_33_1_0 == "round_end" or slot_33_1_0 == "cs_win_panel_round" or slot_33_1_0 == "round_win" then
		if (game.globalVars.m_flRealTime or 0) - _CEL_JOIN_TIME > 10 then
			slot_33_3_6 = slot_0_54_0.autoDc and slot_0_54_0.autoDc:Get()

			if slot_33_3_6 and slot_33_3_6:Get(1) then
				game.engine:ClientCmd("echo \"[Celestial] Disconnect trigger: Round End\"")

				_DC_REQ = true
			end
		end
	elseif slot_33_1_0 == "cs_win_panel_match" or slot_33_1_0 == "round_announce_match_end" then
		if (game.globalVars.m_flRealTime or 0) - _CEL_JOIN_TIME > 10 then
			slot_33_3_5 = slot_0_54_0.autoDc and slot_0_54_0.autoDc:Get()

			if slot_33_3_5 and slot_33_3_5:Get(2) then
				game.engine:ClientCmd("echo \"[Celestial] Disconnect trigger: Match End\"")

				_DC_REQ = true
			end
		end
	elseif slot_33_1_0 == "player_chat" then
		if slot_0_54_0.copybot and slot_0_54_0.copybot:Get() then
			slot_33_2_4 = arg_33_0:GetController("userid")
			slot_33_3_4 = entities.GetLocalController()

			if slot_33_2_4 and slot_33_3_4 and slot_33_2_4 ~= slot_33_3_4 then
				slot_33_4_5 = arg_33_0:GetString("text")

				if slot_33_4_5 and #slot_33_4_5 > 0 then
					slot_33_5_5 = slot_33_2_4.m_iTeamNum and slot_33_2_4.m_iTeamNum:Get() or 0
					slot_33_6_3 = false
					slot_33_7_3 = slot_0_54_0.copyTeams:Get()
					slot_33_8_1 = false
					slot_33_9_4 = false

					if slot_33_7_3 then
						if slot_33_7_3:Get(0) then
							slot_33_8_1 = true
						end

						if slot_33_7_3:Get(1) then
							slot_33_9_4 = true
						end
					end

					if slot_33_8_1 and slot_33_5_5 == 3 then
						slot_33_6_3 = true
					end

					if slot_33_9_4 and slot_33_5_5 == 2 then
						slot_33_6_3 = true
					end

					if not slot_33_8_1 and not slot_33_9_4 then
						slot_33_6_3 = true
					end

					if slot_33_6_3 then
						game.engine:ClientCmd("say \"" .. slot_33_4_5 .. "\"")
					end
				end
			end
		end

		return
	end

	if slot_33_1_0 == "game_newmap" then
		_CEL_JOIN_TIME = game.globalVars.m_flRealTime or 0
		slot_0_42_0.kdKills = 0
		slot_0_42_0.kdDeaths = 0
		slot_0_42_0.kdSuicide = false
		slot_0_42_0.ping = 0
		slot_0_42_0.pingTimer = 10

		return
	end

	if slot_33_1_0 == "player_death" then
		slot_33_2_3 = entities.GetLocalPawn()

		if not slot_33_2_3 then
			return
		end

		slot_33_3_3 = arg_33_0:GetPawnFromId("attacker")
		slot_33_4_4 = arg_33_0:GetPawnFromId("userid")
		slot_33_5_4 = slot_33_4_4 and slot_33_4_4 == slot_33_2_3
		slot_33_6_2 = slot_33_3_3 and slot_33_3_3 == slot_33_2_3
		slot_33_7_2 = slot_33_5_4 and not slot_33_3_3

		if slot_33_5_4 and slot_33_6_2 or slot_33_7_2 then
			slot_0_42_0.kdDeaths = slot_0_42_0.kdDeaths + 1
			slot_0_42_0.kdSuicide = true
		elseif slot_33_6_2 then
			slot_0_42_0.kdKills = slot_0_42_0.kdKills + 1
			slot_0_42_0.kdSuicide = false

			if slot_0_54_0.spinOnKill and slot_0_54_0.spinOnKill:Get() and not slot_0_28_0.spinning then
				slot_0_28_0.spinning = true
				slot_0_28_0.spinStart = game.globalVars.m_flRealTime or 0
				slot_0_28_0.result = slotGenerateResult()
				slot_0_28_0.lastWin = false
			end
		elseif slot_33_5_4 then
			slot_0_42_0.kdDeaths = slot_0_42_0.kdDeaths + 1
			slot_0_42_0.kdSuicide = false
		end

		if slot_33_5_4 then
			slot_0_45_0.active = false
			slot_0_45_0.wasInAir = false
			slot_0_45_0.forceShoot = false
			slot_0_45_0.hitchance = 0
			slot_0_45_0.pointscale = 0

			if slot_0_18_0.forceShoot then
				slot_33_9_3 = slot_0_18_0.forceShoot:GetValue()

				if slot_33_9_3 then
					slot_33_9_3:Set(false)
				end
			end

			if slot_0_45_0.savedPS and slot_0_18_0.ssgPointscaleCtrl then
				slot_33_9_2 = slot_0_18_0.ssgPointscaleCtrl:GetValue()

				if slot_33_9_2 then
					slot_33_9_2:Set(slot_0_45_0.savedPS)
				end
			end

			if slot_0_45_0.savedHC and slot_0_18_0.ssgHitchance then
				slot_33_9_1 = slot_0_18_0.ssgHitchance:GetValue()

				if slot_33_9_1 then
					slot_33_9_1:Set(slot_0_45_0.savedHC)
				end
			end

			if slot_0_45_0.savedAutostop and slot_0_18_0.ssgAutostopMode then
				slot_33_9_0 = slot_0_18_0.ssgAutostopMode:GetValue()

				if slot_33_9_0 then
					slot_33_10_0 = slot_33_9_0:Get()

					if slot_33_10_0 then
						slot_33_10_0:SetRaw(slot_0_45_0.savedAutostop)
						slot_33_9_0:Set(slot_33_10_0)
					end
				end
			end

			slot_0_45_0.savedPS = nil
			slot_0_45_0.savedHC = nil
			slot_0_45_0.savedFS = nil
			slot_0_45_0.savedAutostop = nil
			slot_0_49_0.savedHc = nil
			slot_0_49_0.savedPs = nil
			slot_0_49_0.wasAir = false
			slot_0_48_0.curBoost = 0
		end
	end

	if slot_33_1_0 == "weapon_fire" then
		slot_33_2_2 = entities.GetLocalController()
		slot_33_3_2 = arg_33_0:GetController("userid")

		if slot_33_3_2 and slot_33_3_2 == slot_33_2_2 then
			if slot_0_29_0.sparkle then
				slot_33_4_3 = entities.GetLocalPawn()
				slot_33_5_3 = slot_33_4_3 and slot_33_4_3:GetActiveWeapon()

				if slot_33_5_3 and slot_33_5_3:ToWeaponBaseGun() then
					slot_0_30_0.shotFired = true
					slot_0_30_0.gotHurt = false
					slot_0_30_0.firstImpact = nil
					slot_33_7_1 = slot_33_4_3 and slot_33_4_3:GetEyePos()

					if slot_33_7_1 then
						slot_0_30_0.shotOrigin = {
							[0] = nil,
							x = slot_33_7_1.x,
							y = slot_33_7_1.y,
							z = slot_33_7_1.z
						}
					end
				end
			end

			if slot_0_44_0 and slot_0_22_0(slot_0_18_0.rageEnable) and slot_0_22_0(slot_0_18_0.rageAutofire) then
				slot_33_4_2 = entities.GetLocalPawn()
				slot_33_5_2 = slot_33_4_2 and slot_33_4_2:GetActiveWeapon()

				if slot_33_5_2 and slot_33_5_2:ToWeaponBaseGun() then
					slot_0_53_0.pending = true
					slot_0_53_0.fireTime = game.globalVars.m_flRealTime or 0
					slot_0_53_0.didHit = false
					slot_0_53_0.diedAfter = false
					slot_0_53_0.hc = hlGetHc()
					slot_0_53_0.eyePos = slot_33_4_2 and slot_33_4_2:GetEyePos() or nil
					slot_0_53_0.weapon = slot_33_5_2
				end
			end
		end
	end

	if slot_33_1_0 == "bullet_impact" and slot_0_29_0.sparkle and slot_0_30_0.shotFired then
		slot_33_2_1 = entities.GetLocalController()
		slot_33_3_1 = arg_33_0:GetController("userid")

		if slot_33_3_1 and slot_33_3_1 == slot_33_2_1 and not slot_0_30_0.firstImpact and arg_33_0.GetFloat then
			slot_33_4_1 = arg_33_0:GetFloat("x")
			slot_33_5_1 = arg_33_0:GetFloat("y")
			slot_33_6_1 = arg_33_0:GetFloat("z")

			if slot_33_4_1 and slot_33_5_1 and slot_33_6_1 and slot_33_4_1 ~= 0 then
				slot_0_30_0.firstImpact = {
					[0] = nil,
					x = slot_33_4_1,
					y = slot_33_5_1,
					z = slot_33_6_1
				}
			end
		end
	end

	if slot_33_1_0 == "player_hurt" and slot_0_29_0.sparkle and slot_0_30_0.shotFired then
		slot_33_2_0 = entities.GetLocalController()
		slot_33_3_0 = arg_33_0:GetController("attacker")

		if slot_33_3_0 and slot_33_3_0 == slot_33_2_0 then
			slot_0_30_0.gotHurt = true
			slot_0_30_0.shotFired = false

			if slot_0_30_0.firstImpact then
				slot_33_4_0 = arg_33_0:GetPawnFromId("userid")

				if slot_33_4_0 then
					slot_33_5_0 = slot_33_4_0:GetAbsOrigin()

					if slot_33_5_0 then
						slot_33_6_0 = slot_0_30_0.firstImpact.x - slot_33_5_0.x
						slot_33_7_0 = slot_0_30_0.firstImpact.y - slot_33_5_0.y
						slot_33_8_0 = slot_0_30_0.firstImpact.z - (slot_33_5_0.z + 40)

						if slot_0_0_0.sqrt(slot_33_6_0 * slot_33_6_0 + slot_33_7_0 * slot_33_7_0 + slot_33_8_0 * slot_33_8_0) > 80 then
							slot_0_30_0.queue(slot_0_30_0.firstImpact.x, slot_0_30_0.firstImpact.y, slot_0_30_0.firstImpact.z, 8, slot_0_30_0.shotOrigin)
						else
							slot_0_30_0.queue(slot_33_5_0.x, slot_33_5_0.y, slot_33_5_0.z + 60, 10, slot_0_30_0.shotOrigin)
						end
					end
				end
			end

			slot_0_30_0.firstImpact = nil
		end
	end
end)

function slot_0_57_0()
	local var_34_0 = entities.GetLocalPawn()

	if not var_34_0 then
		return nil
	end

	return var_34_0
end

function slot_0_58_0()
	local var_35_0 = slot_0_57_0()

	if not var_35_0 or not var_35_0:IsAlive() then
		return false
	end

	local var_35_1 = var_35_0:GetActiveWeapon()

	if not var_35_1 then
		return false
	end

	local var_35_2 = var_35_1:ToWeaponBaseGun()

	if not var_35_2 then
		return true
	end

	local var_35_3 = var_35_2:GetDefIndex()

	if not var_35_3 then
		return false
	end

	if var_35_3 == weapon_id.taser or var_35_3 == weapon_id.melee or var_35_3 == weapon_id.fists then
		return true
	end

	if var_35_3 == weapon_id.knife or var_35_3 == weapon_id.knife_t or var_35_3 == weapon_id.knife_push then
		return true
	end

	if var_35_3 == weapon_id.knife_cord or var_35_3 == weapon_id.knife_canis or var_35_3 == weapon_id.knife_ursus then
		return true
	end

	if var_35_3 == weapon_id.knife_gypsy_jackknife or var_35_3 == weapon_id.knife_outdoor or var_35_3 == weapon_id.knifegg then
		return true
	end

	return false
end

function slot_0_59_0()
	local var_36_0 = entities.GetLocalPawn()

	if not var_36_0 then
		return false
	end

	local var_36_1 = var_36_0:GetActiveWeapon()

	if not var_36_1 then
		return false
	end

	local var_36_2 = var_36_1:ToWeaponBaseGun()

	if not var_36_2 then
		return false
	end

	local var_36_3 = var_36_2:GetDefIndex()

	if not var_36_3 then
		return false
	end

	return var_36_3 == 31
end

slot_0_60_0 = {
	[515] = true,
	[516] = true,
	[518] = true,
	[521] = true,
	[523] = true,
	[525] = true,
	[526] = true,
	[512] = true,
	[31] = true,
	[519] = true,
	[520] = true,
	[522] = true,
	[500] = true,
	[503] = true,
	[524] = true,
	[505] = true,
	[514] = true,
	[507] = true,
	[506] = true,
	[509] = true,
	[508] = true,
	[517] = true,
	[0] = nil
}

function slot_0_61_0()
	local var_37_0 = entities.GetLocalPawn()

	if not var_37_0 or not var_37_0:IsAlive() then
		return false
	end

	local var_37_1 = var_37_0:GetActiveWeapon() or nil

	if not var_37_1 then
		return false
	end

	local var_37_2 = var_37_1:ToWeaponBaseGun() or nil

	if not var_37_2 then
		return false
	end

	local var_37_3 = var_37_2:GetDefIndex() or 0

	if not var_37_3 or var_37_3 == 0 then
		return false
	end

	if slot_0_60_0[var_37_3] then
		return false
	end

	return true
end

function slot_0_62_0()
	if slot_0_18_0.aaLeft and slot_0_18_0.aaLeft:Get() then
		return " LEFT"
	end

	if slot_0_18_0.aaRight and slot_0_18_0.aaRight:Get() then
		return " RIGHT"
	end

	if slot_0_18_0.aaBack and slot_0_18_0.aaBack:Get() then
		return " BACK"
	end

	if slot_0_18_0.aaFwd and slot_0_18_0.aaFwd:Get() then
		return " FORWARD"
	end

	if slot_0_18_0.aaYaw then
		local var_38_0 = slot_0_18_0.aaYaw:Get() or 0

		if var_38_0 > 24 then
			return " LEFT"
		end

		if var_38_0 < -24 then
			return " RIGHT"
		end
	end

	return ""
end

function slot_0_63_0(arg_39_0)
	return gui.input:IsKeyDown(arg_39_0)
end

function slot_0_64_0(arg_40_0, arg_40_1, arg_40_2, arg_40_3)
	local var_40_0 = draw.surface
	local var_40_1 = 8
	local var_40_2 = arg_40_1 + 8

	if arg_40_3 then
		var_40_0:AddLine(draw.Vec2(arg_40_0 - var_40_1, var_40_2), draw.Vec2(arg_40_0 + var_40_1, var_40_2), draw.Color(200, 200, 200, 180))

		var_40_0.font = draw.fonts.gui_small or var_40_0.font

		var_40_0:AddText(draw.Vec2(arg_40_0 - 4, arg_40_1 - 6), arg_40_2, draw.Color(255, 255, 255, 255))
	else
		var_40_0:AddLine(draw.Vec2(arg_40_0 - var_40_1, var_40_2), draw.Vec2(arg_40_0 + var_40_1, var_40_2), draw.Color(120, 120, 120, 40))
	end
end

function slot_0_65_0(arg_41_0, arg_41_1)
	local var_41_0 = draw.surface

	var_41_0.font = draw.fonts[slot_0_15_0.font] or var_41_0.font

	local var_41_1 = slot_0_15_0.bx + arg_41_0
	local var_41_2 = slot_0_15_0.by + arg_41_1
	local var_41_3 = slot_0_15_0.ks
	local var_41_4 = var_41_2
	local var_41_5 = var_41_2 + var_41_3

	slot_0_64_0(var_41_1 + var_41_3, var_41_4, "W", slot_0_63_0(slot_0_17_0.W))
	slot_0_64_0(var_41_1, var_41_4, "J", slot_0_63_0(slot_0_17_0.SPACE))
	slot_0_64_0(var_41_1 + var_41_3 * 2, var_41_4, "C", slot_0_63_0(slot_0_17_0.CTRL))
	slot_0_64_0(var_41_1, var_41_5, "A", slot_0_63_0(slot_0_17_0.A))
	slot_0_64_0(var_41_1 + var_41_3, var_41_5, "S", slot_0_63_0(slot_0_17_0.S))
	slot_0_64_0(var_41_1 + var_41_3 * 2, var_41_5, "D", slot_0_63_0(slot_0_17_0.D))
end

slot_0_66_0 = Vector
slot_0_67_0 = ray_t and ray_t() or nil
slot_0_68_0 = {
	wasGround = true,
	lastDists = {}
}

function slot_0_69_0(arg_42_0, arg_42_1)
	if arg_42_0 == nil then
		return arg_42_1
	end

	if type(arg_42_0) == "userdata" and arg_42_0.get then
		return arg_42_0:Get()
	end

	return arg_42_0
end

function slot_0_70_0(arg_43_0)
	return math.AngleNormalize(arg_43_0)
end

function slot_0_71_0()
	slot_0_68_0.lockedAngle = nil
	slot_0_68_0.lockedDir = nil
	slot_0_68_0.baseAngle = nil
	slot_0_68_0.baseDir = nil
	slot_0_68_0.currentTarget = nil
	slot_0_68_0.lastDists = {}
end

function slot_0_72_0(arg_45_0)
	local var_45_0 = {
		ground = false,
		connected = game.engine:IsConnected() and game.engine:InGame(),
		pos = slot_0_66_0(0, 0, 0),
		ang = arg_45_0 and arg_45_0:GetViewangles() or Vector(0, 0, 0),
		vel = slot_0_66_0(0, 0, 0)
	}

	if not var_45_0.connected then
		return var_45_0
	end

	local var_45_1 = entities.GetLocalPawn()

	if not var_45_1 or not var_45_1:IsAlive() then
		return var_45_0
	end

	var_45_0.pawn = var_45_1
	var_45_0.pos = var_45_1:GetAbsOrigin() or slot_0_66_0(0, 0, 0)
	var_45_0.vel = var_45_1:GetAbsVelocity() or slot_0_66_0(0, 0, 0)

	local var_45_2 = slot_0_69_0(var_45_1.m_fFlags, 0) or 0

	var_45_0.ground = slot_0_0_0.band(var_45_2, 1) ~= 0

	return var_45_0
end

function slot_0_73_0(arg_46_0, arg_46_1)
	if not game.physicsQueryInterface then
		return nil
	end

	local var_46_0 = ray_t and ray_t() or slot_0_67_0

	if not var_46_0 then
		return nil
	end

	return game.physicsQueryInterface:TraceRay(var_46_0, arg_46_0, arg_46_1, false)
end

function slot_0_74_0(arg_47_0)
	if not arg_47_0 then
		return 1
	end

	return arg_47_0.fraction or arg_47_0.m_flFraction or 1
end

function slot_0_75_0(arg_48_0)
	if not arg_48_0 then
		return nil
	end

	if arg_48_0.normal then
		return arg_48_0.normal
	end

	if arg_48_0.plane_normal then
		return arg_48_0.plane_normal
	end

	if arg_48_0.surface_normal then
		return arg_48_0.surface_normal
	end

	if arg_48_0.plane and arg_48_0.plane.normal then
		return arg_48_0.plane.normal
	end

	if arg_48_0.m_vecNormal then
		return arg_48_0.m_vecNormal
	end

	return nil
end

function slot_0_76_0(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0 = slot_0_66_0(arg_49_0.x + arg_49_1.x * arg_49_2, arg_49_0.y + arg_49_1.y * arg_49_2, arg_49_0.z + arg_49_1.z * arg_49_2)
	local var_49_1 = slot_0_73_0(arg_49_0, var_49_0)

	if not var_49_1 then
		return nil, nil, nil
	end

	local var_49_2 = slot_0_74_0(var_49_1)

	if var_49_2 >= 1 then
		return nil, nil, var_49_1
	end

	return slot_0_75_0(var_49_1), var_49_2 * arg_49_2, var_49_1
end

function slot_0_77_0(arg_50_0)
	if not slot_0_27_0.autoAlign then
		slot_0_71_0()

		return
	end

	slot_50_1_0 = slot_0_72_0(arg_50_0)

	if not slot_50_1_0.pawn then
		return
	end

	if not slot_0_68_0.wasGround and slot_50_1_0.ground then
		slot_0_68_0.lockedAngle = nil
		slot_0_68_0.lockedDir = nil
	end

	slot_0_68_0.wasGround = slot_50_1_0.ground
	slot_50_2_0 = slot_50_1_0.ang.y
	slot_50_3_0 = slot_0_0_0.rad(slot_50_2_0)
	slot_50_4_0 = {
		{
			n = "right",
			[0] = nil,
			d = slot_0_66_0(slot_0_0_0.cos(slot_50_3_0 + math.pi * 0.5), slot_0_0_0.sin(slot_50_3_0 + math.pi * 0.5), 0)
		},
		{
			n = "left",
			d = slot_0_66_0(slot_0_0_0.cos(slot_50_3_0 - math.pi * 0.5), slot_0_0_0.sin(slot_50_3_0 - math.pi * 0.5), 0)
		},
		{
			n = "forward",
			d = slot_0_66_0(slot_0_0_0.cos(slot_50_3_0), slot_0_0_0.sin(slot_50_3_0), 0)
		},
		{
			n = "back",
			[0] = nil,
			d = slot_0_66_0(slot_0_0_0.cos(slot_50_3_0 + math.pi), slot_0_0_0.sin(slot_50_3_0 + math.pi), 0)
		}
	}
	slot_50_5_0 = slot_0_66_0(slot_50_1_0.pos.x, slot_50_1_0.pos.y, slot_50_1_0.pos.z)
	slot_50_6_0 = slot_0_27_0.alignAng or 30

	if slot_0_68_0.lockedAngle and slot_0_68_0.lockedDir then
		slot_50_7_1 = false

		for iter_50_0, iter_50_1 in ipairs(slot_50_4_0) do
			if iter_50_1.n == slot_0_68_0.lockedDir then
				slot_50_13_1, slot_50_14_1 = slot_0_76_0(slot_50_5_0, iter_50_1.d, 50)

				if slot_50_14_1 and slot_50_14_1 < 24 and slot_50_13_1 and slot_0_0_0.abs(slot_50_13_1.z) < 0.1 then
					slot_50_7_1 = true
				end

				slot_0_68_0.lastDists[iter_50_1.n] = slot_50_14_1 or 0
			end
		end

		if not slot_50_7_1 and slot_50_1_0.ground then
			slot_0_68_0.lockedAngle = nil
			slot_0_68_0.lockedDir = nil
		end

		if slot_0_68_0.lockedAngle then
			slot_50_8_1 = slot_0_70_0(slot_0_68_0.lockedAngle - slot_50_2_0)

			if slot_50_6_0 > slot_0_0_0.abs(slot_50_8_1) then
				slot_50_9_1 = arg_50_0:GetViewangles()

				arg_50_0:SetViewangles(slot_0_66_0(slot_50_9_1.x, slot_0_70_0(slot_50_2_0 + slot_50_8_1), slot_50_9_1.z))
				arg_50_0:LockAngles()
			end

			slot_0_68_0.currentTarget = slot_0_68_0.lockedAngle

			return
		end
	end

	slot_50_7_0 = nil
	slot_50_8_0 = nil
	slot_50_9_0 = nil

	for iter_50_2, iter_50_3 in ipairs(slot_50_4_0) do
		slot_50_15_0, slot_50_16_0 = slot_0_76_0(slot_50_5_0, iter_50_3.d, 50)
		slot_0_68_0.lastDists[iter_50_3.n] = slot_50_16_0 or 0

		if slot_50_16_0 and slot_50_16_0 < 24 and slot_50_15_0 and slot_0_0_0.abs(slot_50_15_0.z) < 0.1 then
			slot_50_9_0 = slot_0_70_0(slot_0_0_0.deg(slot_0_0_0.atan2(slot_50_15_0.y, slot_50_15_0.x)) + 90)
			slot_50_17_0 = slot_0_70_0(slot_0_0_0.deg(slot_0_0_0.atan2(slot_50_15_0.y, slot_50_15_0.x)) + 180)
			slot_50_7_0 = slot_0_70_0(slot_50_17_0 - slot_50_2_0) > 0 and slot_50_9_0 + 0.05 or slot_50_9_0 - 0.05
			slot_50_8_0 = iter_50_3.n

			break
		end
	end

	if slot_50_9_0 and slot_50_8_0 and slot_50_7_0 then
		slot_50_10_0 = slot_50_7_0
		slot_50_11_0 = slot_0_70_0(slot_50_10_0 - slot_50_2_0)

		if slot_0_0_0.abs(slot_50_11_0) > 90 then
			slot_50_10_0 = slot_0_70_0(slot_50_10_0 + 180)
			slot_50_11_0 = slot_0_70_0(slot_50_10_0 - slot_50_2_0)
		end

		if slot_50_6_0 > slot_0_0_0.abs(slot_50_11_0) then
			slot_50_12_0 = arg_50_0:GetViewangles()

			arg_50_0:SetViewangles(slot_0_66_0(slot_50_12_0.x, slot_0_70_0(slot_50_2_0 + slot_50_11_0), slot_50_12_0.z))
			arg_50_0:LockAngles()

			slot_0_68_0.lockedAngle = slot_50_10_0
			slot_0_68_0.lockedDir = slot_50_8_0
		end

		slot_0_68_0.currentTarget = slot_50_10_0
	else
		slot_0_68_0.currentTarget = nil
	end
end

slot_0_78_0 = false

function slot_0_79_0()
	if not slot_0_29_0.nfd then
		if slot_0_78_0 and slot_0_18_0.jb then
			local var_51_0 = slot_0_18_0.jb:GetValue()

			if var_51_0 then
				var_51_0:Set(false)
			end
		end

		slot_0_78_0 = false

		return
	end

	local var_51_1 = entities.GetLocalPawn()

	if not var_51_1 or not var_51_1:IsAlive() then
		slot_0_78_0 = false

		return
	end

	local var_51_2 = var_51_1.m_fFlags and var_51_1.m_fFlags:Get() or 0
	local var_51_3 = bit.band(var_51_2, 1) ~= 0
	local var_51_4 = var_51_1:GetAbsVelocity()
	local var_51_5 = var_51_4 and math.abs(var_51_4.z) or 0

	if not var_51_3 and var_51_5 >= 380 then
		if slot_0_18_0.jb then
			local var_51_6 = slot_0_18_0.jb:GetValue()

			if var_51_6 then
				var_51_6:Set(true)
			end
		end

		slot_0_78_0 = true
	elseif not var_51_3 and var_51_5 < 380 then
		if slot_0_78_0 and slot_0_18_0.jb then
			local var_51_7 = slot_0_18_0.jb:GetValue()

			if var_51_7 then
				var_51_7:Set(false)
			end
		end

		slot_0_78_0 = false
	end
end

function slot_0_80_0()
	return
end

function slot_0_81_0()
	local var_53_0 = entities.GetLocalPawn()

	if not var_53_0 then
		return false
	end

	local var_53_1 = var_53_0:GetActiveWeapon()

	if not var_53_1 then
		return false
	end

	local var_53_2 = var_53_1:ToWeaponBaseGun()

	if not var_53_2 then
		local var_53_3 = var_53_1.GetDefIndex and var_53_1:GetDefIndex() or 0

		if not var_53_3 or var_53_3 == 0 then
			return false
		end

		if var_53_3 >= 43 and var_53_3 <= 48 then
			return false
		end

		return true
	end

	local var_53_4 = var_53_2:GetDefIndex()

	if not var_53_4 then
		return false
	end

	if var_53_4 == 31 then
		return false
	end

	if var_53_4 >= 43 and var_53_4 <= 48 then
		return false
	end

	if var_53_4 >= 500 and var_53_4 <= 526 then
		return true
	end

	if var_53_4 == 42 or var_53_4 == 59 then
		return true
	end

	return false
end

function slot_0_82_0()
	return
end

slot_0_83_0 = {
	active = false,
	curOffset = 0
}

function slot_0_84_0()
	if not slot_0_29_0.fdVm or not slot_0_18_0.vmOffZ or not slot_0_18_0.duckPeek then
		return
	end

	local var_55_0 = slot_0_18_0.duckPeek:GetValue()
	local var_55_1 = var_55_0 and var_55_0:Get() or false
	local var_55_2 = slot_0_18_0.vmOffZ:GetValue()

	if not var_55_2 then
		return
	end

	if var_55_1 then
		if not slot_0_83_0.active then
			slot_0_83_0.savedZ = var_55_2:Get() or 0
			slot_0_83_0.active = true
		end

		local var_55_3 = slot_0_83_0.savedZ - 2

		slot_0_83_0.curOffset = slot_0_83_0.curOffset + (var_55_3 - slot_0_83_0.curOffset) * 0.15

		var_55_2:Set(slot_0_83_0.curOffset)
	elseif slot_0_83_0.active then
		local var_55_4 = slot_0_83_0.savedZ or 0

		slot_0_83_0.curOffset = slot_0_83_0.curOffset + (var_55_4 - slot_0_83_0.curOffset) * 0.15

		var_55_2:Set(slot_0_83_0.curOffset)

		if slot_0_0_0.abs(slot_0_83_0.curOffset - var_55_4) < 0.01 then
			var_55_2:Set(var_55_4)

			slot_0_83_0.active = false
			slot_0_83_0.savedZ = nil
		end
	end
end

function slot_0_85_0()
	if not slot_0_29_0.knifeDt or not slot_0_18_0.dt then
		return
	end

	local var_56_0 = slot_0_18_0.dt:GetValue()

	if not var_56_0 then
		return
	end

	local var_56_1 = entities.GetLocalPawn()

	if not var_56_1 or not var_56_1:IsAlive() then
		var_56_0:Set(false)

		return
	end

	local var_56_2 = var_56_1:GetActiveWeapon()

	if not var_56_2 then
		var_56_0:Set(false)

		return
	end

	local var_56_3 = var_56_2:ToWeaponBaseGun()
	local var_56_4 = false

	if not var_56_3 then
		var_56_4 = true
	else
		local var_56_5 = var_56_3:GetDefIndex() or 0

		if var_56_5 and slot_0_60_0[var_56_5] and var_56_5 ~= 31 then
			var_56_4 = true
		end
	end

	if var_56_4 ~= (var_56_0:Get() or false) then
		var_56_0:Set(var_56_4)
	end
end

function slot_0_86_0(arg_57_0)
	if not slot_0_29_0.fastLadder then
		return
	end

	local var_57_0 = entities.GetLocalPawn()

	if not var_57_0 then
		return
	end

	local var_57_1 = var_57_0:GetAbsVelocity()

	if slot_0_0_0.sqrt(var_57_1.x * var_57_1.x + var_57_1.y * var_57_1.y) > 50 or var_57_1.z < 20 then
		return
	end

	if (var_57_0.m_fFlags and var_57_0.m_fFlags:Get() or 0) ~= 65664 then
		return
	end

	if arg_57_0:GetForwardMove() <= 0 then
		return
	end

	local var_57_2 = arg_57_0:GetViewangles()

	arg_57_0:SetViewangles(Vector(var_57_2.x - 80, var_57_2.y + 80, var_57_2.z))
	arg_57_0:SetLeftMove(-1)
end

slot_0_87_1 = nil

function slot_0_88_1(arg_58_0, arg_58_1)
	if not arg_58_0 then
		return arg_58_1
	end

	if type(arg_58_0.get) == "function" then
		arg_58_0 = arg_58_0.get()
	elseif type(arg_58_0.Get) == "function" then
		arg_58_0 = arg_58_0:Get()
	end

	arg_58_0 = tonumber(arg_58_0)

	if not arg_58_0 then
		return arg_58_1
	end

	return arg_58_0
end

function slot_0_89_1(arg_59_0, arg_59_1)
	local var_59_0 = math.AngleNormalize(arg_59_0.x - arg_59_1.x)
	local var_59_1 = math.AngleNormalize(arg_59_0.y - arg_59_1.y)

	return slot_0_0_0.sqrt(var_59_0 * var_59_0 + var_59_1 * var_59_1)
end

slot_0_90_1 = nil

function slot_0_87_0(arg_60_0)
	if not slot_0_39_0.enabled then
		slot_0_90_1 = nil

		return
	end

	if not slot_0_61_0() then
		slot_0_90_1 = nil

		return
	end

	if not game.engine or not game.engine:IsConnected() or not game.engine:InGame() then
		slot_0_90_1 = nil

		return
	end

	local var_60_0 = entities.GetLocalPawn()

	if not var_60_0 or not var_60_0:IsAlive() then
		slot_0_90_1 = nil

		return
	end

	local var_60_1 = var_60_0:GetEyePos()

	if not var_60_1 then
		return
	end

	local var_60_2 = slot_0_88_1({
		get = function()
			return slot_0_39_0.fov
		end
	}, 10)

	if var_60_2 <= 0 then
		return
	end

	local var_60_3 = slot_0_88_1({
		get = function()
			return slot_0_39_0.smooth
		end
	}, 5)

	if var_60_3 < 1 then
		var_60_3 = 1
	end

	local var_60_4 = arg_60_0:GetViewangles()

	if slot_0_90_1 then
		if slot_0_90_1:IsAlive() then
			local var_60_5 = slot_0_90_1:GetHitboxCenter(0)

			if var_60_5 then
				local var_60_6 = math.CalcAngle(var_60_1, var_60_5)

				if slot_0_89_1(var_60_4, var_60_6) > var_60_2 * 2.5 then
					slot_0_90_1 = nil
				end
			else
				slot_0_90_1 = nil
			end
		else
			slot_0_90_1 = nil
		end
	end

	if not slot_0_90_1 then
		local var_60_7
		local var_60_8 = var_60_2

		entities.players:ForEach(function(arg_63_0)
			if not arg_63_0 then
				return
			end

			local var_63_0 = arg_63_0.entity ~= nil and arg_63_0.entity or arg_63_0

			if not var_63_0 or not var_63_0.IsAlive or not var_63_0:IsAlive() then
				return
			end

			if not var_63_0.IsEnemy or not var_63_0:IsEnemy() then
				return
			end

			local var_63_1 = var_63_0:GetHitboxCenter(0)

			if not var_63_1 then
				return
			end

			local var_63_2 = math.CalcAngle(var_60_1, var_63_1)
			local var_63_3 = slot_0_89_1(var_60_4, var_63_2)

			if var_63_3 < var_60_8 then
				var_60_8 = var_63_3
				var_60_7 = var_63_0
			end
		end)

		slot_0_90_1 = var_60_7
	end

	if not slot_0_90_1 then
		return
	end

	local var_60_9 = slot_0_90_1:GetHitboxCenter(0)

	if not var_60_9 then
		slot_0_90_1 = nil

		return
	end

	local var_60_10 = math.CalcAngle(var_60_1, var_60_9)

	var_60_10.x = math.clamp(var_60_10.x, -89, 89)
	var_60_10.z = 0

	local var_60_11 = game.globalVars.m_flFrameTime or 0.015625

	if var_60_11 <= 0 then
		var_60_11 = 0.015625
	end

	if var_60_3 <= 1 then
		arg_60_0:SetViewangles(var_60_10)
		arg_60_0:LockAngles()

		return
	end

	local var_60_12 = math.AngleNormalize(var_60_10.x - var_60_4.x)
	local var_60_13 = math.AngleNormalize(var_60_10.y - var_60_4.y)
	local var_60_14 = math.clamp(var_60_11 * 64 / var_60_3, 0, 1)
	local var_60_15 = Vector(var_60_4.x + var_60_12 * var_60_14, math.AngleNormalize(var_60_4.y + var_60_13 * var_60_14), 0)

	var_60_15.x = math.clamp(var_60_15.x, -89, 89)

	arg_60_0:SetViewangles(var_60_15)
	arg_60_0:LockAngles()
end

slot_0_88_0 = false
slot_0_89_0 = -1

function slot_0_90_0()
	local var_64_0 = game.globalVars and game.globalVars.m_iTickCount or -1

	if var_64_0 ~= slot_0_89_0 then
		slot_0_88_0 = game.engine and game.engine:IsConnected() and game.engine:InGame() or false
		slot_0_89_0 = var_64_0
	end

	return slot_0_88_0
end

slot_0_91_1 = nil
_ABHC = {
	[0] = nil,
	general = gui.ctx:Find("rage>weapon>general>weapon>hitchance"),
	pistols = gui.ctx:Find("rage>weapon>Pistols>weapon>hitchance"),
	smgs = gui.ctx:Find("rage>weapon>SMGs>weapon>hitchance"),
	rifles = gui.ctx:Find("rage>weapon>Rifles>weapon>hitchance"),
	heavy = gui.ctx:Find("rage>weapon>Heavy>weapon>hitchance"),
	autoSniper = gui.ctx:Find("rage>weapon>Auto Snipers>weapon>hitchance"),
	deagle = gui.ctx:Find("rage>weapon>Desert Eagle>weapon>hitchance"),
	fiveseven = gui.ctx:Find("rage>weapon>Five-SeveN>weapon>hitchance"),
	awp = gui.ctx:Find("rage>weapon>AWP>weapon>hitchance"),
	tec9 = gui.ctx:Find("rage>weapon>Tec-9>weapon>hitchance"),
	ssg = gui.ctx:Find("rage>weapon>SSG-08>weapon>hitchance"),
	r8 = gui.ctx:Find("rage>weapon>R8 Revolver>weapon>hitchance")
}
slot_0_92_2 = {}

;(function()
	local var_65_0 = weapon_id
	local var_65_1 = {
		{
			var_65_0.deagle,
			"deagle",
			[0] = nil
		},
		{
			var_65_0.fiveseven,
			"fiveseven",
			[0] = nil
		},
		{
			var_65_0.tec9,
			"tec9",
			[0] = nil
		},
		{
			var_65_0.r8,
			"r8",
			[0] = nil
		},
		{
			var_65_0.revolver,
			"r8",
			[0] = nil
		},
		{
			64,
			"r8",
			[0] = nil
		},
		{
			var_65_0.awp,
			"awp",
			[0] = nil
		},
		{
			var_65_0.ssg08,
			"ssg",
			[0] = nil
		},
		{
			var_65_0.g3sg1,
			"autoSniper",
			[0] = nil
		},
		{
			var_65_0.scar20,
			"autoSniper",
			[0] = nil
		},
		{
			var_65_0.nova,
			"heavy",
			[0] = nil
		},
		{
			var_65_0.xm1014,
			"heavy",
			[0] = nil
		},
		{
			var_65_0.mag7,
			"heavy",
			[0] = nil
		},
		{
			var_65_0.sawedoff,
			"heavy",
			[0] = nil
		},
		{
			var_65_0.m249,
			"heavy",
			[0] = nil
		},
		{
			var_65_0.negev,
			"heavy",
			[0] = nil
		},
		{
			var_65_0.mac10,
			"smgs",
			[0] = nil
		},
		{
			var_65_0.mp9,
			"smgs",
			[0] = nil
		},
		{
			var_65_0.mp7,
			"smgs",
			[0] = nil
		},
		{
			var_65_0.mp5sd,
			"smgs",
			[0] = nil
		},
		{
			var_65_0.ump45,
			"smgs",
			[0] = nil
		},
		{
			var_65_0.p90,
			"smgs",
			[0] = nil
		},
		{
			var_65_0.bizon,
			"smgs",
			[0] = nil
		},
		{
			var_65_0.ak47,
			"rifles",
			[0] = nil
		},
		{
			var_65_0.m4a4,
			"rifles",
			[0] = nil
		},
		{
			var_65_0.m4a1s,
			"rifles",
			[0] = nil
		},
		{
			var_65_0.galil,
			"rifles",
			[0] = nil
		},
		{
			var_65_0.famas,
			"rifles",
			[0] = nil
		},
		{
			var_65_0.aug,
			"rifles",
			[0] = nil
		},
		{
			var_65_0.sg556,
			"rifles",
			[0] = nil
		},
		{
			var_65_0.glock,
			"pistols",
			[0] = nil
		},
		{
			var_65_0.usp_s,
			"pistols",
			[0] = nil
		},
		{
			var_65_0.p2000,
			"pistols",
			[0] = nil
		},
		{
			var_65_0.p250,
			"pistols",
			[0] = nil
		},
		{
			var_65_0.cz75,
			"pistols",
			[0] = nil
		},
		{
			var_65_0.dualberettas,
			"pistols",
			[0] = nil
		}
	}

	for iter_65_0, iter_65_1 in ipairs(var_65_1) do
		if iter_65_1[1] then
			slot_0_92_2[iter_65_1[1]] = iter_65_1[2]
		end
	end
end)()

function hlGetHc()
	local var_66_0 = entities.GetLocalPawn()

	if not var_66_0 then
		return 0
	end

	local var_66_1 = var_66_0:GetActiveWeapon()

	if not var_66_1 then
		return 0
	end

	local var_66_2 = var_66_1:ToWeaponBaseGun()

	if not var_66_2 then
		return 0
	end

	local var_66_3 = var_66_2:GetDefIndex()

	if not var_66_3 then
		return 0
	end

	local var_66_4 = slot_0_92_2[var_66_3] or "general"
	local var_66_5 = _ABHC[var_66_4] or _ABHC.general

	if not var_66_5 then
		return 0
	end

	local var_66_6 = var_66_5:Get()

	if type(var_66_6) == "number" then
		return slot_0_0_0.floor(var_66_6)
	end

	return 0
end

function slot_0_91_0()
	if not slot_0_48_0.enabled then
		if slot_0_48_0.lockedHc then
			for iter_67_0, iter_67_1 in pairs(slot_0_48_0.lockedHc) do
				slot_67_5_2 = _ABHC[iter_67_0]

				if slot_67_5_2 then
					slot_67_6_2 = slot_67_5_2:GetValue()

					if slot_67_6_2 then
						slot_67_6_2:Set(iter_67_1)
					end
				end
			end
		end

		slot_0_48_0.lockedHc = nil
		slot_0_48_0.curBoost = 0

		return
	end

	if not slot_0_90_0() then
		return
	end

	slot_67_0_0 = entities.GetLocalPawn()

	if not slot_67_0_0 or not slot_67_0_0:IsAlive() then
		return
	end

	if not slot_0_48_0.lockedHc then
		slot_0_48_0.lockedHc = {}

		for iter_67_2, iter_67_3 in pairs(_ABHC) do
			if iter_67_3 then
				slot_67_6_1 = iter_67_3:GetValue()

				if slot_67_6_1 then
					slot_0_48_0.lockedHc[iter_67_2] = slot_67_6_1:Get()
				end
			end
		end
	end

	slot_67_1_0 = slot_67_0_0.m_fFlags and slot_67_0_0.m_fFlags:Get() or 0

	if bit.band(slot_67_1_0, 1) == 0 then
		slot_0_48_0.curBoost = 0

		return
	end

	slot_67_2_0 = slot_67_0_0:GetActiveWeapon()

	if not slot_67_2_0 then
		return
	end

	slot_67_3_0 = slot_67_2_0:ToWeaponBaseGun()

	if not slot_67_3_0 then
		return
	end

	slot_67_4_0 = slot_67_3_0:GetDefIndex() or 0
	slot_67_5_0 = "general"

	if slot_67_4_0 == weapon_id.deagle then
		slot_67_5_0 = "deagle"
	elseif slot_67_4_0 == weapon_id.fiveseven then
		slot_67_5_0 = "fiveseven"
	elseif slot_67_4_0 == weapon_id.tec9 then
		slot_67_5_0 = "tec9"
	elseif slot_67_4_0 == weapon_id.r8 then
		slot_67_5_0 = "r8"
	elseif slot_67_4_0 == weapon_id.awp then
		slot_67_5_0 = "awp"
	elseif slot_67_4_0 == weapon_id.ssg08 then
		slot_67_5_0 = "ssg"
	elseif slot_67_4_0 == weapon_id.g3sg1 or slot_67_4_0 == weapon_id.scar20 then
		slot_67_5_0 = "autoSniper"
	elseif slot_67_4_0 == weapon_id.nova or slot_67_4_0 == weapon_id.xm1014 or slot_67_4_0 == weapon_id.mag7 or slot_67_4_0 == weapon_id.sawedoff or slot_67_4_0 == weapon_id.m249 or slot_67_4_0 == weapon_id.negev then
		slot_67_5_0 = "heavy"
	elseif slot_67_4_0 == weapon_id.mac10 or slot_67_4_0 == weapon_id.mp9 or slot_67_4_0 == weapon_id.mp7 or slot_67_4_0 == weapon_id.mp5sd or slot_67_4_0 == weapon_id.ump45 or slot_67_4_0 == weapon_id.p90 or slot_67_4_0 == weapon_id.bizon then
		slot_67_5_0 = "smgs"
	elseif slot_67_4_0 == weapon_id.ak47 or slot_67_4_0 == weapon_id.m4a4 or slot_67_4_0 == weapon_id.m4a1s or slot_67_4_0 == weapon_id.galil or slot_67_4_0 == weapon_id.famas or slot_67_4_0 == weapon_id.aug or slot_67_4_0 == weapon_id.sg556 then
		slot_67_5_0 = "rifles"
	elseif slot_67_4_0 == weapon_id.glock or slot_67_4_0 == weapon_id.usp_s or slot_67_4_0 == weapon_id.p2000 or slot_67_4_0 == weapon_id.p250 or slot_67_4_0 == weapon_id.cz75 or slot_67_4_0 == weapon_id.dualberettas then
		slot_67_5_0 = "pistols"
	end

	slot_67_6_0 = _ABHC[slot_67_5_0] or _ABHC.general

	if not slot_67_6_0 then
		return
	end

	slot_67_7_0 = slot_0_48_0.lockedHc[slot_67_5_0] or slot_0_48_0.lockedHc.general or 60
	slot_67_8_0 = slot_67_0_0:GetEyePos()

	if not slot_67_8_0 then
		return
	end

	slot_67_9_0 = math.huge
	slot_67_10_0 = slot_67_0_0.m_iTeamNum and slot_67_0_0.m_iTeamNum:Get() or 0

	entities.players:ForEach(function(arg_68_0)
		if not arg_68_0 then
			return
		end

		local var_68_0 = arg_68_0.entity ~= nil and arg_68_0.entity or arg_68_0

		if not var_68_0 or var_68_0 == slot_67_0_0 then
			return
		end

		if not var_68_0.IsAlive or not var_68_0:IsAlive() then
			return
		end

		if (var_68_0.m_iTeamNum and var_68_0.m_iTeamNum:Get() or 0) == slot_67_10_0 then
			return
		end

		local var_68_1 = var_68_0:GetEyePos()

		if not var_68_1 then
			return
		end

		local var_68_2 = var_68_1.x - slot_67_8_0.x
		local var_68_3 = var_68_1.y - slot_67_8_0.y
		local var_68_4 = var_68_1.z - slot_67_8_0.z
		local var_68_5 = var_68_2 * var_68_2 + var_68_3 * var_68_3 + var_68_4 * var_68_4

		if var_68_5 < slot_67_9_0 then
			slot_67_9_0 = var_68_5
		end
	end)

	slot_67_11_0 = slot_0_0_0.sqrt(slot_67_9_0)
	slot_67_12_0 = 500
	slot_67_13_0 = 2500
	slot_67_14_0 = 0

	if slot_67_11_0 < slot_67_12_0 then
		slot_67_14_0 = slot_0_0_0.floor(slot_0_48_0.maxBoost * 0.1)
	elseif slot_67_13_0 < slot_67_11_0 then
		slot_67_14_0 = slot_0_0_0.floor(slot_0_48_0.maxBoost)
	else
		slot_67_15_1 = (slot_67_11_0 - slot_67_12_0) / (slot_67_13_0 - slot_67_12_0)
		slot_67_14_0 = slot_0_0_0.floor(slot_0_48_0.maxBoost * (0.1 + slot_67_15_1 * slot_67_15_1 * 0.9))
	end

	slot_67_15_0 = slot_67_0_0:GetAbsVelocity()

	if slot_67_15_0 then
		slot_67_16_1 = slot_0_0_0.sqrt(slot_67_15_0.x * slot_67_15_0.x + slot_67_15_0.y * slot_67_15_0.y)

		if slot_67_16_1 > 120 then
			slot_67_14_0 = slot_67_14_0 + 2
		elseif slot_67_16_1 > 30 then
			slot_67_14_0 = slot_67_14_0 + 1
		end
	end

	slot_0_48_0.curBoost = slot_67_14_0
	slot_67_16_0 = slot_67_6_0:GetValue()

	if slot_67_16_0 then
		slot_67_16_0:Set(slot_0_0_0.min(100, slot_67_7_0 + slot_67_14_0))
	end
end

slot_0_92_1 = nil
slot_0_93_2 = {
	lastSide = nil,
	[0] = nil
}

function slot_0_92_0(arg_69_0)
	slot_69_1_0 = not slot_0_38_0.enabled

	if not slot_69_1_0 and not slot_0_90_0() then
		slot_69_1_0 = true
	end

	if not slot_69_1_0 then
		slot_69_2_3 = entities.GetLocalPawn()

		if not slot_69_2_3 or not slot_69_2_3:IsAlive() then
			slot_69_1_0 = true
		end
	end

	if slot_69_1_0 then
		if slot_0_93_2.lastSide then
			if slot_0_18_0.aaLeft then
				slot_69_2_2 = slot_0_18_0.aaLeft:GetValue()

				if slot_69_2_2 then
					slot_69_2_2:Set(false)
				end
			end

			if slot_0_18_0.aaRight then
				slot_69_2_1 = slot_0_18_0.aaRight:GetValue()

				if slot_69_2_1 then
					slot_69_2_1:Set(false)
				end
			end

			slot_0_93_2.lastSide = nil
		end

		return
	end

	slot_69_2_0 = entities.GetLocalPawn()

	if not slot_69_2_0:GetAbsOrigin() then
		return
	end

	slot_69_4_0 = slot_69_2_0:GetEyePos()

	if not slot_69_4_0 then
		return
	end

	if not slot_0_54_0.freestand or not slot_0_54_0.freestand:Get() then
		if slot_0_93_2.lastSide then
			if slot_0_18_0.aaLeft then
				slot_69_5_3 = slot_0_18_0.aaLeft:GetValue()

				if slot_69_5_3 then
					slot_69_5_3:Set(false)
				end
			end

			if slot_0_18_0.aaRight then
				slot_69_5_2 = slot_0_18_0.aaRight:GetValue()

				if slot_69_5_2 then
					slot_69_5_2:Set(false)
				end
			end

			slot_0_93_2.lastSide = nil
		end

		return
	end

	if slot_0_54_0.fsDisableCrouch and slot_0_54_0.fsDisableCrouch:Get() then
		slot_69_5_1 = slot_69_2_0.m_fFlags and slot_69_2_0.m_fFlags:Get() or 0
		slot_69_6_1 = slot_69_2_0.m_flDuckAmount and slot_69_2_0.m_flDuckAmount:Get() or 0

		if bit.band(slot_69_5_1, 2) ~= 0 or slot_69_6_1 > 0.5 then
			if slot_0_93_2.lastSide then
				if slot_0_18_0.aaLeft then
					slot_69_7_2 = slot_0_18_0.aaLeft:GetValue()

					if slot_69_7_2 then
						slot_69_7_2:Set(false)
					end
				end

				if slot_0_18_0.aaRight then
					slot_69_7_1 = slot_0_18_0.aaRight:GetValue()

					if slot_69_7_1 then
						slot_69_7_1:Set(false)
					end
				end

				slot_0_93_2.lastSide = nil
			end

			return
		end
	end

	slot_69_5_0 = arg_69_0:GetViewangles()
	slot_69_6_0 = slot_0_0_0.rad(slot_69_5_0 and slot_69_5_0.y or 0)
	slot_69_7_0 = Vector(slot_0_0_0.cos(slot_69_6_0 + math.pi * 0.5), slot_0_0_0.sin(slot_69_6_0 + math.pi * 0.5), 0)
	slot_69_8_0 = Vector(slot_0_0_0.cos(slot_69_6_0 - math.pi * 0.5), slot_0_0_0.sin(slot_69_6_0 - math.pi * 0.5), 0)
	slot_69_9_0, slot_69_10_0 = slot_0_76_0(slot_69_4_0, slot_69_7_0, 80)
	slot_69_11_0, slot_69_12_0 = slot_0_76_0(slot_69_4_0, slot_69_8_0, 80)
	slot_69_13_0 = 0
	slot_69_14_0 = 0
	slot_69_15_0 = 5
	slot_69_16_0 = 60

	for iter_69_0 = 1, slot_69_15_0 do
		slot_69_21_0 = iter_69_0 / slot_69_15_0
		slot_69_22_0 = slot_69_6_0 + math.pi * 0.5 * slot_69_21_0
		slot_69_23_0 = Vector(slot_0_0_0.cos(slot_69_22_0), slot_0_0_0.sin(slot_69_22_0), 0)
		slot_69_24_0, slot_69_25_0 = slot_0_76_0(slot_69_4_0, slot_69_23_0, slot_69_16_0)

		if slot_69_25_0 and slot_69_25_0 < slot_69_16_0 then
			slot_69_13_0 = slot_69_13_0 + 1
		end

		slot_69_26_0 = slot_69_6_0 - math.pi * 0.5 * slot_69_21_0
		slot_69_27_0 = Vector(slot_0_0_0.cos(slot_69_26_0), slot_0_0_0.sin(slot_69_26_0), 0)
		slot_69_28_0, slot_69_29_0 = slot_0_76_0(slot_69_4_0, slot_69_27_0, slot_69_16_0)

		if slot_69_29_0 and slot_69_29_0 < slot_69_16_0 then
			slot_69_14_0 = slot_69_14_0 + 1
		end
	end

	slot_69_17_0 = nil

	if slot_69_14_0 < slot_69_13_0 and slot_69_13_0 >= 2 then
		slot_69_17_0 = "right"
	elseif slot_69_13_0 < slot_69_14_0 and slot_69_14_0 >= 2 then
		slot_69_17_0 = "left"
	elseif slot_69_10_0 and slot_69_12_0 then
		if slot_69_10_0 < 30 and (not slot_69_12_0 or slot_69_12_0 >= 30) then
			slot_69_17_0 = "right"
		elseif slot_69_12_0 < 30 and (not slot_69_10_0 or slot_69_10_0 >= 30) then
			slot_69_17_0 = "left"
		elseif slot_69_10_0 < 30 and slot_69_12_0 < 30 then
			slot_69_17_0 = slot_69_10_0 <= slot_69_12_0 and "right" or "left"
		end
	end

	if slot_69_17_0 == slot_0_93_2.lastSide then
		return
	end

	if slot_0_18_0.aaLeft then
		slot_69_18_1 = slot_0_18_0.aaLeft:GetValue()

		if slot_69_18_1 then
			slot_69_18_1:Set(slot_69_17_0 == "right")
		end
	end

	if slot_0_18_0.aaRight then
		slot_69_18_0 = slot_0_18_0.aaRight:GetValue()

		if slot_69_18_0 then
			slot_69_18_0:Set(slot_69_17_0 == "left")
		end
	end

	slot_0_93_2.lastSide = slot_69_17_0
end

events.createMove:Add(function(arg_70_0)
	if _DC_REQ then
		game.engine:ClientCmd("echo \"[Celestial] Disconnecting on event...\"")
		game.engine:ClientCmd("disconnect")

		_DC_REQ = false
		_savedHitlog = slot_0_54_0.hitlog and slot_0_54_0.hitlog:Get() or false

		if slot_0_54_0.hitlog then
			local var_70_0 = slot_0_54_0.hitlog:GetValue()

			if var_70_0 then
				var_70_0:Set(false)
			end
		end

		if hlEntries then
			for iter_70_0 = #hlEntries, 1, -1 do
				hlEntries[iter_70_0] = nil
			end
		end

		if slot_0_30_0 then
			slot_0_30_0.list = {}
			slot_0_30_0.shotFired = false
			slot_0_30_0.gotHurt = false
			slot_0_30_0.firstImpact = nil
		end
	end

	local var_70_1 = arg_70_0:GetViewangles()

	if var_70_1 then
		slot_0_51_0 = var_70_1
	end

	slot_0_77_0(arg_70_0)
	slot_0_79_0()
	slot_0_80_0()
	slot_0_82_0()
	slot_0_84_0()
	slot_0_85_0()
	slot_0_86_0(arg_70_0)
	slot_0_87_0(arg_70_0)
	slot_0_91_0()
	slot_0_92_0(arg_70_0)
end)

slot_0_93_1 = nil
slot_0_94_1 = {
	[34] = "PGDN",
	[122] = "F11",
	[114] = "F3",
	[45] = "DELETE",
	[123] = "F12",
	[9] = "TAB",
	[35] = "END",
	[116] = "F5",
	[17] = "C",
	[40] = "DOWN",
	[36] = "HOME",
	[32] = "J",
	[115] = "F4",
	[118] = "F7",
	[117] = "F6",
	[39] = "RIGHT",
	[38] = "UP",
	[119] = "F8",
	[33] = "PGUP",
	[37] = "LEFT",
	[120] = "F9",
	[18] = "ALT",
	[112] = "F1",
	[16] = "SHIFT",
	[121] = "F10",
	[113] = "F2",
	[0] = nil
}

for iter_0_0 = 65, 90 do
	slot_0_94_1[iter_0_0] = string.char(iter_0_0)
end

for iter_0_1 = 48, 57 do
	slot_0_94_1[iter_0_1] = string.char(iter_0_1)
end

function slot_0_93_0(arg_71_0)
	return slot_0_94_1[arg_71_0] or "0x" .. string.format("%02X", arg_71_0)
end

function slot_0_94_0()
	if not gui.IsVisible() then
		slot_0_35_0.target = nil
		slot_0_35_0.wasDown = false

		return
	end

	slot_72_0_0 = gui.input:Cursor()
	slot_72_1_0 = slot_72_0_0.x
	slot_72_2_0 = slot_72_0_0.y
	slot_72_3_0 = gui.input:IsMouseDown(gui.MouseButton.LEFT)
	slot_72_4_0 = slot_72_3_0 and not slot_0_35_0.wasDown
	slot_0_35_0.wasDown = slot_72_3_0

	if slot_72_3_0 and slot_0_35_0.target then
		if slot_0_35_0.target == "ind" then
			slot_0_31_0.x = slot_72_1_0 - slot_0_35_0.offX
			slot_0_31_0.y = slot_72_2_0 - slot_0_35_0.offY
		elseif slot_0_35_0.target == "afd" then
			slot_0_32_0.x = slot_72_1_0 - slot_0_35_0.offX + slot_0_0_0.floor((slot_0_32_0.lastW or 140) / 2)
			slot_0_32_0.y = slot_72_2_0 - slot_0_35_0.offY
		elseif slot_0_35_0.target == "ape" then
			slot_0_33_0.x = slot_72_1_0 - slot_0_35_0.offX + slot_0_0_0.floor((slot_0_33_0.lastW or 140) / 2)
			slot_0_33_0.y = slot_72_2_0 - slot_0_35_0.offY
		elseif slot_0_35_0.target == "slot" then
			slot_0_34_0.x = slot_72_1_0 - slot_0_35_0.offX
			slot_0_34_0.y = slot_72_2_0 - slot_0_35_0.offY
		elseif slot_0_35_0.target == "bomb" then
			bombHud.x = slot_72_1_0 - slot_0_35_0.offX
			bombHud.y = slot_72_2_0 - slot_0_35_0.offY
		end

		return
	end

	if not slot_72_3_0 then
		slot_0_35_0.target = nil
	end

	if slot_72_4_0 then
		slot_72_5_0 = slot_0_31_0.lastW or 120
		slot_72_6_0 = slot_0_31_0.lastH or 40
		slot_72_7_0 = slot_0_31_0.x or 28
		slot_72_8_0 = slot_0_31_0.y or 520

		if slot_72_7_0 <= slot_72_1_0 and slot_72_1_0 <= slot_72_7_0 + slot_72_5_0 and slot_72_8_0 <= slot_72_2_0 and slot_72_2_0 <= slot_72_8_0 + slot_72_6_0 then
			slot_0_35_0.target = "ind"
			slot_0_35_0.offX = slot_72_1_0 - slot_72_7_0
			slot_0_35_0.offY = slot_72_2_0 - slot_72_8_0

			return
		end

		slot_72_9_0 = slot_0_32_0.lastW or 140
		slot_72_10_0 = slot_0_32_0.lastH or 30
		slot_72_11_0 = (slot_0_32_0.x or 960) - slot_0_0_0.floor(slot_72_9_0 / 2)
		slot_72_12_0 = slot_0_32_0.y or 780

		if slot_72_11_0 <= slot_72_1_0 and slot_72_1_0 <= slot_72_11_0 + slot_72_9_0 and slot_72_12_0 <= slot_72_2_0 and slot_72_2_0 <= slot_72_12_0 + slot_72_10_0 then
			slot_0_35_0.target = "afd"
			slot_0_35_0.offX = slot_72_1_0 - slot_72_11_0
			slot_0_35_0.offY = slot_72_2_0 - slot_72_12_0

			return
		end

		slot_72_13_0 = slot_0_33_0.lastW or 140
		slot_72_14_0 = slot_0_33_0.lastH or 30
		slot_72_15_0 = (slot_0_33_0.x or 960) - slot_0_0_0.floor(slot_72_13_0 / 2)
		slot_72_16_0 = slot_0_33_0.y or slot_0_26_0.afdelay and dsConfig and dsConfig.enabled and 740 or 780

		if slot_72_15_0 <= slot_72_1_0 and slot_72_1_0 <= slot_72_15_0 + slot_72_13_0 and slot_72_16_0 <= slot_72_2_0 and slot_72_2_0 <= slot_72_16_0 + slot_72_14_0 then
			slot_0_35_0.target = "ape"
			slot_0_35_0.offX = slot_72_1_0 - slot_72_15_0
			slot_0_35_0.offY = slot_72_2_0 - slot_72_16_0

			return
		end

		if slot_0_29_0.slotsEnabled and slot_0_34_0.x then
			slot_72_17_1 = slot_0_34_0.lastW or 260
			slot_72_18_1 = slot_0_34_0.lastH or 88
			slot_72_19_1 = slot_0_34_0.x
			slot_72_20_1 = slot_0_34_0.y

			if slot_72_19_1 <= slot_72_1_0 and slot_72_1_0 <= slot_72_19_1 + slot_72_17_1 and slot_72_20_1 <= slot_72_2_0 and slot_72_2_0 <= slot_72_20_1 + slot_72_18_1 then
				slot_0_35_0.target = "slot"
				slot_0_35_0.offX = slot_72_1_0 - slot_72_19_1
				slot_0_35_0.offY = slot_72_2_0 - slot_72_20_1

				return
			end
		end

		if bombHud.lastW > 0 and bombHud.x then
			slot_72_17_0 = bombHud.lastW
			slot_72_18_0 = bombHud.lastH or 50
			slot_72_19_0 = bombHud.x
			slot_72_20_0 = bombHud.y

			if slot_72_19_0 <= slot_72_1_0 and slot_72_1_0 <= slot_72_19_0 + slot_72_17_0 and slot_72_20_0 <= slot_72_2_0 and slot_72_2_0 <= slot_72_20_0 + slot_72_18_0 then
				slot_0_35_0.target = "bomb"
				slot_0_35_0.offX = slot_72_1_0 - slot_72_19_0
				slot_0_35_0.offY = slot_72_2_0 - slot_72_20_0

				return
			end
		end
	end
end

function slot_0_95_0()
	for iter_73_0, iter_73_1 in pairs(slot_0_41_0) do
		if iter_73_1 and (iter_73_1.mode or "hold") == "hold" then
			local var_73_0 = false

			if iter_73_1.vk then
				var_73_0 = gui.input:IsKeyDown(iter_73_1.vk)
			elseif iter_73_1.mouse then
				var_73_0 = gui.input:IsMouseDown(iter_73_1.mouse)
			end

			if iter_73_0 == "aimlock" then
				slot_0_39_0.enabled = var_73_0
			elseif iter_73_0 == "aiPeek" then
				slot_0_46_0.enabled = var_73_0
			elseif iter_73_0 == "slavebot" then
				slot_0_26_0.slavebot = var_73_0
			elseif slot_0_26_0[iter_73_0] ~= nil then
				slot_0_26_0[iter_73_0] = var_73_0
			elseif slot_0_27_0[iter_73_0] ~= nil then
				slot_0_27_0[iter_73_0] = var_73_0
			end
		end
	end
end

function slot_0_96_0()
	slot_74_0_0 = draw.surface
	slot_74_1_0 = game.engine
	slot_74_0_0.font = draw.fonts.gui_title or draw.fonts.gui_main
	slot_0_26_0.timeAccum = slot_0_26_0.timeAccum + 0.04
	slot_74_2_0 = slot_0_22_0(slot_0_18_0.rageEnable)
	slot_74_3_0 = slot_0_22_0(slot_0_18_0.rageAwall)
	slot_74_4_0 = slot_0_22_0(slot_0_18_0.legitAwall)
	slot_74_5_0 = slot_0_22_0(slot_0_18_0.rageNospread)
	slot_74_6_0 = slot_0_22_0(slot_0_18_0.rageAutofire)
	slot_74_7_0 = slot_0_22_0(slot_0_18_0.aaEnable)
	slot_74_8_0 = slot_0_58_0()
	slot_74_9_0 = {}

	if slot_0_26_0.rageawall and not slot_74_8_0 and slot_74_2_0 and slot_74_3_0 then
		table.insert(slot_74_9_0, {
			r = "On",
			l = "Rawall",
			[0] = nil
		})
	end

	if slot_0_26_0.legitawall and not slot_74_8_0 and not slot_74_2_0 and slot_74_4_0 then
		table.insert(slot_74_9_0, {
			r = "On",
			l = "Autowall",
			[0] = nil
		})
	end

	if slot_0_26_0.ns and slot_74_2_0 and slot_74_5_0 then
		table.insert(slot_74_9_0, {
			r = "On",
			l = "NS",
			[0] = nil
		})
	end

	if slot_0_26_0.autofire and slot_74_2_0 and slot_74_6_0 then
		table.insert(slot_74_9_0, {
			r = "On",
			l = "Autofire",
			[0] = nil
		})
	end

	if slot_0_26_0.jb and slot_0_22_0(slot_0_18_0.jb) then
		table.insert(slot_74_9_0, {
			r = "On",
			l = "Jump bug",
			[0] = nil
		})
	end

	if slot_0_26_0.ej and slot_0_22_0(slot_0_18_0.ej) then
		table.insert(slot_74_9_0, {
			r = "On",
			l = "Edge jump",
			[0] = nil
		})
	end

	if slot_0_26_0.aipeek and (slot_0_54_0.aiPeek and slot_0_54_0.aiPeek:Get() or slot_0_46_0.enabled) then
		table.insert(slot_74_9_0, {
			r = "On",
			l = "AI Peek",
			[0] = nil
		})
	end

	slot_74_10_0 = entities.GetLocalPawn()

	if slot_74_10_0 and slot_74_10_0:IsAlive() and (slot_0_26_0.minDmg or slot_0_26_0.minAcc or slot_0_26_0.autoRetreat) then
		slot_74_11_1 = slot_74_10_0:GetActiveWeapon()
		slot_74_12_1 = "general"

		if slot_74_11_1 then
			slot_74_13_4 = slot_74_11_1:ToWeaponBaseGun()

			if slot_74_13_4 then
				slot_74_14_3 = slot_74_13_4:GetDefIndex() or 0

				if slot_74_14_3 ~= weapon_id.knife and slot_74_14_3 ~= weapon_id.knife_t and slot_74_14_3 ~= weapon_id.taser and slot_74_14_3 ~= weapon_id.melee and (not (slot_74_14_3 >= 500) or not (slot_74_14_3 <= 526)) then
					slot_74_12_1 = slot_0_1_0(slot_74_14_3)
				end
			end
		end

		if slot_0_26_0.minDmg then
			slot_74_13_3 = slot_74_2_0 and slot_0_19_0.md.rage[slot_74_12_1] or slot_0_19_0.md.legit[slot_74_12_1]

			if slot_74_13_3 then
				slot_74_14_2 = slot_74_13_3:Cast()

				if slot_74_14_2 and slot_74_14_2.GetHotkeyState and slot_74_14_2:GetHotkeyState() then
					slot_74_15_2 = slot_0_3_0(slot_74_13_3)

					if slot_74_15_2 then
						table.insert(slot_74_9_0, {
							l = "Minimum damage",
							[0] = nil,
							r = tostring(slot_74_15_2)
						})
					end
				end
			end
		end

		if slot_0_26_0.minAcc then
			slot_74_13_2 = slot_74_2_0 and slot_0_19_0.hc.rage[slot_74_12_1] or slot_0_19_0.hc.legit[slot_74_12_1]

			if slot_74_13_2 then
				slot_74_14_1 = slot_74_13_2:Cast()

				if slot_74_14_1 and slot_74_14_1.GetHotkeyState and slot_74_14_1:GetHotkeyState() then
					slot_74_15_1 = slot_0_3_0(slot_74_13_2)

					if slot_74_15_1 then
						table.insert(slot_74_9_0, {
							l = "Min. accuracy",
							[0] = nil,
							r = tostring(slot_74_15_1)
						})
					end
				end
			end
		end

		if slot_0_26_0.autoRetreat and slot_0_18_0.peekAssist then
			slot_74_13_1 = slot_0_18_0.peekAssist:Cast()

			if slot_74_13_1 and slot_74_13_1.GetHotkeyState and slot_74_13_1:GetHotkeyState() then
				table.insert(slot_74_9_0, {
					r = "On",
					l = "Auto retreat",
					[0] = nil
				})
			end
		end
	end

	if #slot_74_9_0 == 0 then
		return
	end

	slot_74_0_0.font = draw.fonts.celestial_ind or draw.fonts.gui_main
	slot_74_11_0 = slot_0_7_0(7)
	slot_74_12_0 = slot_0_7_0(20)
	slot_74_13_0 = slot_0_7_0(12)
	slot_74_14_0 = slot_0_7_0(7)
	slot_74_15_0 = slot_0_7_0(7)
	slot_74_16_0 = slot_0_7_0(22)
	slot_74_17_0 = #"Binds" * slot_74_11_0

	for iter_74_0 = 1, #slot_74_9_0 do
		slot_74_22_1 = slot_74_9_0[iter_74_0]
		slot_74_23_1 = (#slot_74_22_1.l + #slot_74_22_1.r + 4) * slot_74_11_0

		if slot_74_17_0 < slot_74_23_1 then
			slot_74_17_0 = slot_74_23_1
		end
	end

	slot_74_18_0, slot_74_19_0 = slot_74_1_0:GetScreenSize()
	slot_74_20_0 = slot_74_17_0 + slot_74_13_0 * 2 + slot_0_7_0(18)

	if slot_74_20_0 < slot_0_7_0(110) then
		slot_74_20_0 = slot_0_7_0(110)
	end

	slot_74_21_0 = slot_0_7_0(3) + slot_74_16_0 + #slot_74_9_0 * slot_74_12_0 + slot_74_14_0
	slot_74_22_0 = slot_0_31_0.x or slot_0_7_0(28)
	slot_74_23_0 = slot_0_31_0.y or slot_0_0_0.floor(slot_74_19_0 * 0.5)
	slot_74_24_0 = slot_0_7_0(3)

	slot_74_0_0:AddRectFilledRounded(draw.Rect(slot_74_22_0, slot_74_23_0, slot_74_22_0 + slot_74_20_0, slot_74_23_0 + slot_74_21_0), slot_0_37_0.hud, slot_74_15_0, draw.Rounding.ALL)
	slot_74_0_0:AddRectFilledRounded(draw.Rect(slot_74_22_0, slot_74_23_0, slot_74_22_0 + slot_74_15_0 * 2, slot_74_23_0 + slot_74_24_0 + slot_74_15_0), slot_0_37_0.grad1, slot_74_15_0, draw.Rounding.TOP_LEFT)
	slot_74_0_0:AddRectFilledRounded(draw.Rect(slot_74_22_0 + slot_74_20_0 - slot_74_15_0 * 2, slot_74_23_0, slot_74_22_0 + slot_74_20_0, slot_74_23_0 + slot_74_24_0 + slot_74_15_0), slot_0_37_0.grad1, slot_74_15_0, draw.Rounding.TOP_RIGHT)
	slot_74_0_0:AddRectFilled(draw.Rect(slot_74_22_0 + slot_74_15_0 - 2, slot_74_23_0, slot_74_22_0 + slot_74_20_0 - slot_74_15_0 + 1, slot_74_23_0 + slot_74_24_0), slot_0_37_0.grad1)
	slot_74_0_0:AddRectFilled(draw.Rect(slot_74_22_0, slot_74_23_0 + slot_74_24_0, slot_74_22_0 + slot_74_20_0, slot_74_23_0 + slot_74_24_0 + slot_74_15_0), slot_0_37_0.hud)

	slot_0_31_0.lastW, slot_0_31_0.lastH = slot_74_20_0, slot_74_21_0
	slot_74_25_0 = #"Binds" * slot_74_11_0
	slot_74_26_0 = slot_74_22_0 + slot_0_0_0.floor((slot_74_20_0 - slot_74_25_0) / 2)

	slot_74_0_0:AddText(draw.Vec2(slot_74_26_0, slot_74_23_0 + slot_0_7_0(7)), "Binds", draw.Color(220, 220, 220, 255))

	slot_74_27_0 = slot_74_23_0 + slot_74_16_0 + slot_0_7_0(3)

	slot_74_0_0:AddRectFilled(draw.Rect(slot_74_22_0 + slot_0_7_0(7), slot_74_27_0, slot_74_22_0 + slot_74_20_0 - slot_0_7_0(7), slot_74_27_0 + 1), draw.Color(60, 60, 60, 120))

	slot_74_28_0 = slot_74_27_0 + slot_74_14_0 - 2
	slot_74_29_0 = draw.Color(200, 200, 200, 230)

	for iter_74_1 = 1, #slot_74_9_0 do
		slot_74_34_0 = slot_74_9_0[iter_74_1]
		slot_74_35_0 = slot_74_22_0 + slot_74_13_0

		slot_74_0_0:AddText(draw.Vec2(slot_74_35_0, slot_74_28_0), slot_74_34_0.l, slot_74_29_0)

		slot_74_36_0 = slot_74_34_0.r
		slot_74_37_0 = #slot_74_36_0 * slot_74_11_0
		slot_74_38_0 = slot_74_22_0 + slot_74_20_0 - slot_74_13_0 - slot_74_37_0

		slot_74_0_0:AddText(draw.Vec2(slot_74_38_0, slot_74_28_0), slot_74_36_0, slot_74_29_0)

		slot_74_28_0 = slot_74_28_0 + slot_74_12_0
	end
end

function slot_0_97_0()
	slot_75_0_0 = draw.surface
	slot_75_0_0.font = draw.fonts.gui_title or draw.fonts.gui_main
	slot_75_1_0 = entities.GetLocalPawn()
	slot_75_2_0 = slot_0_7_0(slot_0_27_0.offX or 0)
	slot_75_3_0 = -slot_0_7_0((slot_0_27_0.offY or 150) - 150)

	if slot_0_27_0.jbej then
		slot_75_4_1 = slot_0_18_0.jb and slot_0_18_0.jb:Get() or false
		slot_75_5_1 = slot_0_18_0.ej and slot_0_18_0.ej:Get() or false
		slot_75_6_1 = slot_0_18_0.rageNospread and slot_0_18_0.rageNospread:Get() or false
		slot_75_7_1 = slot_0_18_0.rageEnable and slot_0_18_0.rageEnable:Get() or false

		if slot_75_6_1 and not slot_75_7_1 then
			slot_75_6_1 = false
		end

		slot_75_8_1 = {}

		if slot_75_4_1 then
			table.insert(slot_75_8_1, "JB")
		end

		if slot_75_5_1 then
			table.insert(slot_75_8_1, "EJ")
		end

		if slot_75_6_1 then
			table.insert(slot_75_8_1, "NS")
		end

		if slot_0_27_0.autoAlign then
			table.insert(slot_75_8_1, "AL")
		end

		slot_75_9_1 = #slot_75_8_1

		if slot_75_9_1 > 0 then
			slot_75_10_1 = (slot_75_9_1 - 1) * slot_0_15_0.is
			slot_75_11_0 = slot_0_15_0.cx - slot_75_10_1 / 2 + slot_75_2_0

			for iter_75_0 = 1, slot_75_9_1 do
				slot_75_0_0:AddText(draw.Vec2(slot_75_11_0 + (iter_75_0 - 1) * slot_0_15_0.is, slot_0_15_0.iby + slot_75_3_0), slot_75_8_1[iter_75_0], draw.Color(255, 255, 255, 255))
			end
		end
	end

	if slot_0_27_0.vel and slot_75_1_0 and slot_75_1_0:IsAlive() then
		slot_75_4_0 = slot_75_1_0:GetAbsVelocity()
		slot_75_5_0 = slot_0_0_0.floor(slot_0_0_0.sqrt(slot_75_4_0.x * slot_75_4_0.x + slot_75_4_0.y * slot_75_4_0.y))
		slot_75_6_0 = nil

		if slot_75_5_0 <= 1 then
			slot_75_6_0 = draw.Color(255, 255, 255, 255)
		elseif slot_75_5_0 < 210 then
			slot_75_6_0 = draw.Color(255, 80, 80, 255)
		elseif slot_75_5_0 < 287 then
			slot_75_6_0 = draw.Color(80, 255, 120, 255)
		else
			slot_75_6_0 = draw.Color(255, 210, 0, 255)
		end

		slot_75_7_0 = tostring(slot_75_5_0)
		slot_75_8_0 = #slot_75_7_0
		slot_75_9_0 = slot_0_7_0(8)
		slot_75_10_0 = nil

		if slot_75_8_0 == 1 then
			slot_75_10_0 = slot_0_15_0.vbx + slot_75_2_0
		elseif slot_75_8_0 == 2 then
			slot_75_10_0 = slot_0_15_0.vbx - slot_75_9_0 / 2 + slot_75_2_0
		else
			slot_75_10_0 = slot_0_15_0.vbx - slot_75_9_0 + slot_75_2_0
		end

		slot_75_0_0:AddText(draw.Vec2(slot_75_10_0, slot_0_15_0.vby + slot_75_3_0), slot_75_7_0, slot_75_6_0)
	end

	if slot_0_27_0.keys then
		slot_0_65_0(slot_75_2_0, slot_75_3_0)

		slot_75_0_0.font = draw.fonts.gui_title or draw.fonts.gui_main
	end
end

slot_0_98_0 = 270
slot_0_99_0 = 150
slot_0_100_0 = 12
slot_0_101_0 = 22
slot_0_102_1 = nil

ffi.cdef("    typedef void* (__cdecl *InstantiateInterfaceFn_t)();\n    typedef struct CInterfaceRegister {\n        InstantiateInterfaceFn_t fnCreate;\n        const char* szName;\n        struct CInterfaceRegister* pNext;\n    } CInterfaceRegister;\n    typedef struct {\n        const char* szName;\n        void* m_pNext;\n        char pad1[0x10];\n        const char* szDescription;\n        uint32_t nType;\n        uint32_t nRegistered;\n        uint32_t nFlags;\n        char pad2[0x15];\n        union {\n            bool i1; short i16; uint16_t u16; int i32; uint32_t u32;\n            int64_t i64; uint64_t u64; float fl; double db; const char* sz;\n        } value;\n    } CConVar;\n    typedef struct { CConVar* element; unsigned short prev; unsigned short next; } UtlLinkedListElement_t;\n    typedef struct { int size; UtlLinkedListElement_t* data; } CUtlLeanVector;\n    typedef struct {\n        CUtlLeanVector memory;\n        unsigned short iHead; unsigned short iTail; unsigned short iFirstFree;\n        unsigned short nElementCount; unsigned short nAllocated;\n        UtlLinkedListElement_t* pElements;\n    } CUtlLinkedList;\n    typedef struct { char pad[0x40]; CUtlLinkedList listConvars; } IEngineCVar;\n    typedef void* FILE_PTR;\n    FILE_PTR fopen(const char* path, const char* mode);\n    int      fclose(FILE_PTR f);\n    size_t   fwrite(const void* buf, size_t sz, size_t n, FILE_PTR f);\n    size_t   fread(void* buf, size_t sz, size_t n, FILE_PTR f);\n    int      fseek(FILE_PTR f, long offset, int whence);\n    long     ftell(FILE_PTR f);\n    int      feof(FILE_PTR f);\n    unsigned long GetModuleFileNameA(void* hModule, char* lpFilename, unsigned long nSize);\n")

slot_0_103_2 = {
	delay = 0.3,
	lastState = false,
	timer = 0,
	tick = 0,
	frames = {
		"c",
		"ce",
		"cel",
		"cele",
		"celes",
		"celest",
		"celesti",
		"celestia",
		"celestial",
		"celestial.",
		"celestial.l",
		"celestial.lu",
		"celestial.lua",
		"celestial.lu",
		"celestial.l",
		"celestial.",
		"celestial",
		"celestia",
		"celesti",
		"celest",
		"celes",
		"cele",
		"cel",
		"ce",
		"c",
		"",
		[0] = nil
	}
}

function slot_0_104_2(arg_76_0)
	local var_76_0 = utils.FindExport(arg_76_0, "CreateInterface")

	if not var_76_0 or var_76_0 == 0 then
		return nil
	end

	local var_76_1 = ffi.cast("int32_t*", var_76_0 + 3)[0]
	local var_76_2 = ffi.cast("uintptr_t", var_76_0) + 7

	return ffi.cast("CInterfaceRegister**", ffi.cast("uint8_t*", var_76_2 + var_76_1))[0]
end

function ctGetEngineCvar()
	local var_77_0 = slot_0_104_2("tier0.dll")

	if not var_77_0 then
		return nil
	end

	while var_77_0 ~= nil do
		if var_77_0.szName ~= nil and ffi.string(var_77_0.szName):find("VEngineCvar00", 1, true) then
			return ffi.cast("IEngineCVar*", var_77_0.fnCreate())
		end

		var_77_0 = var_77_0.pNext
	end

	return nil
end

function ctGetConvar(arg_78_0, arg_78_1)
	if not arg_78_0 then
		return nil
	end

	local var_78_0 = arg_78_0.listConvars

	if var_78_0.nElementCount == 0 or var_78_0.memory.data == nil then
		return nil
	end

	for iter_78_0 = var_78_0.iHead, var_78_0.iTail do
		local var_78_1 = var_78_0.memory.data[iter_78_0].element

		if var_78_1 ~= nil and var_78_1.szName ~= nil and ffi.string(var_78_1.szName) == arg_78_1 then
			return var_78_1
		end
	end

	return nil
end

function slot_0_105_3()
	local var_79_0 = ctGetEngineCvar()

	if not var_79_0 then
		return
	end

	local var_79_1 = ctGetConvar(var_79_0, "name")

	if var_79_1 then
		var_79_1.nFlags = 33408
	end
end

function slot_0_106_3()
	local var_80_0 = entities.GetLocalController()

	if not var_80_0 then
		return
	end

	local var_80_1 = var_80_0:GetName()

	if not var_80_1 or var_80_1 == "unconnected" then
		return
	end

	local var_80_2 = false

	for iter_80_0, iter_80_1 in ipairs(slot_0_103_2.frames) do
		if var_80_1:find(iter_80_1 .. " ", 1, true) then
			var_80_2 = true

			break
		end
	end

	if not var_80_2 then
		slot_0_103_2.orig = var_80_1
	end
end

slot_0_105_3()
slot_0_106_3()

function slot_0_102_0()
	local var_81_0 = entities.GetLocalController()

	if var_81_0 and var_81_0 ~= slot_0_103_2.lastLp then
		slot_0_103_2.lastLp = var_81_0
		slot_0_103_2.orig = nil
		slot_0_103_2.tick = 0
		slot_0_103_2.timer = 0

		slot_0_105_3()
		slot_0_106_3()
	end

	if not slot_0_103_2.orig then
		slot_0_106_3()
	end

	if not slot_0_43_0 and slot_0_103_2.lastState and slot_0_103_2.orig and slot_0_103_2.orig ~= "unconnected" then
		game.engine:ClientCmd("setinfo name \"" .. slot_0_103_2.orig .. "\"")
	end

	slot_0_103_2.lastState = slot_0_43_0

	if not slot_0_43_0 then
		return
	end

	if not slot_0_90_0() then
		return
	end

	local var_81_1 = game.globalVars.m_flRealTime

	if var_81_1 - slot_0_103_2.timer < slot_0_103_2.delay then
		return
	end

	slot_0_103_2.timer = var_81_1
	slot_0_103_2.tick = slot_0_103_2.tick % #slot_0_103_2.frames + 1

	local var_81_2 = slot_0_103_2.frames[slot_0_103_2.tick] .. " " .. (slot_0_103_2.orig or "user")

	game.engine:ClientCmd("setinfo name \"" .. var_81_2 .. "\"")
end

slot_0_103_1 = nil
slot_0_104_1 = nil
slot_0_104_0 = false
slot_0_105_2 = draw.FontGDI("Segoe UI Black", 54, 900, draw.FontFlags.ANTIALIAS)

slot_0_105_2:Create()

draw.fonts.celestial_intro = slot_0_105_2
slot_0_106_2 = {
	T_START = 0.5,
	FADE_OUT = 0.6,
	FADE_IN = 0.4,
	start = nil,
	GAP = -1,
	TEXT2 = ".lua",
	TEXT = "Celestial",
	HOLD = 1.2,
	T_SPEED = 0.07,
	[0] = nil
}
slot_0_106_2.totalLen = #slot_0_106_2.TEXT + #slot_0_106_2.TEXT2
slot_0_106_2.fullReveal = slot_0_106_2.totalLen * slot_0_106_2.T_SPEED
slot_0_106_2.duration = slot_0_106_2.T_START + slot_0_106_2.fullReveal + slot_0_106_2.HOLD + slot_0_106_2.FADE_OUT

function slot_0_107_1(arg_82_0, arg_82_1, arg_82_2)
	arg_82_2 = slot_0_0_0.max(0, slot_0_0_0.min(1, arg_82_2))

	return arg_82_0 + (arg_82_1 - arg_82_0) * arg_82_2
end

function slot_0_108_2(arg_83_0)
	arg_83_0 = slot_0_0_0.max(0, slot_0_0_0.min(1, arg_83_0))

	return 1 - (1 - arg_83_0) * (1 - arg_83_0)
end

function slot_0_109_1(arg_84_0, arg_84_1)
	if arg_84_0 and arg_84_0.GetTextSize then
		local var_84_0 = arg_84_0:GetTextSize(arg_84_1, true)

		if var_84_0 then
			return var_84_0.x
		end
	end

	return #arg_84_1 * 26
end

function slot_0_103_0()
	if slot_0_104_0 then
		return
	end

	slot_85_0_0 = draw.surface
	slot_85_1_0 = draw.fonts.celestial_intro or draw.fonts.gui_title

	if not slot_85_1_0 then
		return
	end

	slot_85_0_0.font = slot_85_1_0
	slot_85_2_0, slot_85_3_0 = game.engine:GetScreenSize()

	if not slot_85_2_0 or slot_85_2_0 <= 0 then
		return
	end

	slot_85_4_0 = game.globalVars.m_flRealTime

	if not slot_0_106_2.start then
		slot_0_106_2.start = slot_85_4_0
	end

	slot_85_5_0 = slot_85_4_0 - slot_0_106_2.start
	slot_85_6_0 = nil

	if slot_85_5_0 < slot_0_106_2.FADE_IN then
		slot_85_6_0 = slot_0_0_0.floor(slot_0_107_1(0, 185, slot_0_108_2(slot_85_5_0 / slot_0_106_2.FADE_IN)))
	elseif slot_85_5_0 < slot_0_106_2.duration - slot_0_106_2.FADE_OUT then
		slot_85_6_0 = 185
	else
		slot_85_7_1 = (slot_85_5_0 - (slot_0_106_2.duration - slot_0_106_2.FADE_OUT)) / slot_0_106_2.FADE_OUT
		slot_85_6_0 = slot_0_0_0.floor(slot_0_107_1(185, 0, slot_0_108_2(slot_85_7_1)))
	end

	slot_85_0_0:AddRectFilled(draw.Rect(0, 0, slot_85_2_0, slot_85_3_0), draw.Color(0, 0, 0, slot_85_6_0))

	slot_85_7_0 = slot_0_0_0.max(0, slot_85_5_0 - slot_0_106_2.T_START)
	slot_85_8_0 = nil
	slot_85_9_1 = nil

	if slot_85_7_0 < slot_0_106_2.fullReveal then
		slot_85_8_0 = slot_0_0_0.floor(slot_85_7_0 / slot_0_106_2.T_SPEED)
		slot_85_9_0 = 255
	elseif slot_85_7_0 < slot_0_106_2.fullReveal + slot_0_106_2.HOLD then
		slot_85_8_0 = slot_0_106_2.totalLen
		slot_85_9_0 = 255
	else
		slot_85_8_0 = slot_0_106_2.totalLen
		slot_85_10_1 = (slot_85_7_0 - slot_0_106_2.fullReveal - slot_0_106_2.HOLD) / slot_0_106_2.FADE_OUT
		slot_85_9_0 = slot_0_0_0.floor(slot_0_107_1(255, 0, slot_0_108_2(slot_85_10_1)))
	end

	if slot_85_6_0 <= 0 and slot_85_9_0 <= 0 then
		slot_0_104_0 = true

		return
	end

	if slot_85_9_0 <= 0 then
		return
	end

	slot_85_10_0 = slot_0_0_0.min(slot_85_8_0, #slot_0_106_2.TEXT)
	slot_85_11_0 = slot_0_0_0.max(0, slot_85_8_0 - #slot_0_106_2.TEXT)
	slot_85_12_0 = slot_0_109_1(slot_85_1_0, slot_0_106_2.TEXT)
	slot_85_13_0 = slot_0_109_1(slot_85_1_0, slot_0_106_2.TEXT2)
	slot_85_14_0 = slot_85_12_0 + slot_0_106_2.GAP + slot_85_13_0
	slot_85_15_0 = slot_85_1_0.height or 52
	slot_85_16_0 = slot_0_0_0.floor(slot_85_2_0 / 2 - slot_85_14_0 / 2)
	slot_85_17_0 = slot_0_0_0.floor(slot_85_3_0 / 2 - slot_85_15_0 / 2)
	slot_85_18_0 = slot_85_16_0 + slot_85_12_0 + slot_0_106_2.GAP
	slot_85_19_0 = draw.Color(190, 160, 255, slot_85_9_0)
	slot_85_20_0 = draw.Color(210, 210, 210, slot_0_0_0.floor(slot_85_9_0 * 0.86))

	if slot_85_10_0 > 0 then
		slot_85_21_1 = slot_0_0_0.floor(slot_85_9_0 * 0.1)

		if slot_85_21_1 > 0 then
			slot_85_22_0 = draw.Color(190, 160, 255, slot_85_21_1)

			for iter_85_0 = 1, 6 do
				slot_85_0_0:AddText(draw.Vec2(slot_85_16_0 - iter_85_0, slot_85_17_0), slot_0_106_2.TEXT:sub(1, slot_85_10_0), slot_85_22_0)
				slot_85_0_0:AddText(draw.Vec2(slot_85_16_0 + iter_85_0, slot_85_17_0), slot_0_106_2.TEXT:sub(1, slot_85_10_0), slot_85_22_0)
				slot_85_0_0:AddText(draw.Vec2(slot_85_16_0, slot_85_17_0 - iter_85_0), slot_0_106_2.TEXT:sub(1, slot_85_10_0), slot_85_22_0)
				slot_85_0_0:AddText(draw.Vec2(slot_85_16_0, slot_85_17_0 + iter_85_0), slot_0_106_2.TEXT:sub(1, slot_85_10_0), slot_85_22_0)
			end
		end

		slot_85_0_0:AddText(draw.Vec2(slot_85_16_0, slot_85_17_0), slot_0_106_2.TEXT:sub(1, slot_85_10_0), slot_85_19_0)
	end

	if slot_85_11_0 > 0 then
		slot_85_0_0:AddText(draw.Vec2(slot_85_18_0, slot_85_17_0), slot_0_106_2.TEXT2:sub(1, slot_85_11_0), slot_85_20_0)
	end

	if slot_85_8_0 < slot_0_106_2.totalLen then
		slot_85_21_0 = nil

		if slot_85_8_0 < #slot_0_106_2.TEXT then
			slot_85_21_0 = slot_85_16_0 + slot_0_109_1(slot_85_1_0, slot_0_106_2.TEXT:sub(1, slot_85_8_0))
		else
			slot_85_21_0 = slot_85_18_0 + slot_0_109_1(slot_85_1_0, slot_0_106_2.TEXT2:sub(1, slot_85_8_0 - #slot_0_106_2.TEXT))
		end

		if slot_0_0_0.floor(slot_85_5_0 / 0.25) % 2 == 0 then
			slot_85_0_0:AddText(draw.Vec2(slot_85_21_0, slot_85_17_0), "|", slot_85_19_0)
		end
	end
end

slot_0_105_1 = nil
slot_0_106_1 = nil
slot_0_107_0 = nil

function slot_0_105_0()
	local var_86_0 = slot_0_7_0(19)
	local var_86_1 = slot_0_7_0(54)
	local var_86_2 = draw.FontGDI("Segoe UI Black", var_86_0, 900, draw.FontFlags.ANTIALIAS)

	var_86_2:Create()

	draw.fonts.watermark = var_86_2

	local var_86_3 = draw.FontGDI("Segoe UI Black", var_86_0, 900, draw.FontFlags.ANTIALIAS)

	var_86_3:Create()

	draw.fonts.celestial_ind = var_86_3

	local var_86_4 = draw.FontGDI("Segoe UI Black", var_86_1, 900, draw.FontFlags.ANTIALIAS)

	var_86_4:Create()

	draw.fonts.celestial_intro = var_86_4
	slot_0_107_0 = var_86_2
	slot_0_5_0.fontsDirty = false
end

function slot_0_108_1()
	slot_0_6_0()

	if slot_0_5_0.fontsDirty then
		slot_0_105_0()
	end
end

slot_0_105_0()

function slot_0_106_0()
	slot_0_108_1()

	if not slot_0_42_0.enabled then
		return
	end

	if not slot_0_104_0 then
		return
	end

	slot_88_0_0, slot_88_1_0 = game.engine:GetScreenSize()
	slot_88_2_0 = game.globalVars.m_flRealTime or 0

	if not slot_0_42_0.lastTime then
		slot_0_42_0.lastTime = slot_88_2_0
	end

	slot_88_3_0 = slot_88_2_0 - slot_0_42_0.lastTime
	slot_0_42_0.lastTime = slot_88_2_0

	if slot_88_3_0 > 0 and slot_88_3_0 < 1 then
		slot_0_42_0.fpsSamples = slot_0_42_0.fpsSamples + 1
		slot_0_42_0.fpsAccum = slot_0_42_0.fpsAccum + slot_88_3_0
		slot_0_42_0.fpsTimer = slot_0_42_0.fpsTimer + slot_88_3_0

		if slot_0_42_0.fpsTimer >= 0.25 then
			slot_0_42_0.fps = slot_0_0_0.floor(slot_0_42_0.fpsSamples / slot_0_42_0.fpsAccum)
			slot_88_4_2 = slot_0_42_0.fps

			if slot_88_4_2 == 59 then
				slot_88_4_2 = 60
			elseif slot_88_4_2 == 99 then
				slot_88_4_2 = 100
			elseif slot_88_4_2 == 119 then
				slot_88_4_2 = 120
			elseif slot_88_4_2 == 139 then
				slot_88_4_2 = 140
			elseif slot_88_4_2 == 164 then
				slot_88_4_2 = 165
			elseif slot_88_4_2 == 179 then
				slot_88_4_2 = 180
			elseif slot_88_4_2 == 199 then
				slot_88_4_2 = 200
			elseif slot_88_4_2 == 239 then
				slot_88_4_2 = 240
			elseif slot_88_4_2 == 299 then
				slot_88_4_2 = 300
			elseif slot_88_4_2 == 359 then
				slot_88_4_2 = 360
			elseif slot_88_4_2 == 143 then
				slot_88_4_2 = 144
			end

			slot_0_42_0.fps = slot_88_4_2
			slot_0_42_0.fpsAccum = 0
			slot_0_42_0.fpsSamples = 0
			slot_0_42_0.fpsTimer = 0
		end
	end

	slot_0_42_0.pingTimer = slot_0_42_0.pingTimer + (slot_88_3_0 or 0)

	if slot_0_42_0.pingTimer >= 0.5 then
		slot_0_42_0.pingTimer = 0
		slot_88_4_1 = game.engine:GetNetChan()

		if slot_88_4_1 and not slot_88_4_1:IsNull() then
			slot_88_5_1 = slot_88_4_1:GetLatency()

			if slot_88_5_1 then
				slot_0_42_0.ping = slot_0_0_0.floor(slot_88_5_1 * 1000)
			end
		end
	end

	slot_88_4_0 = draw.surface
	slot_88_4_0.font = draw.fonts.watermark or draw.fonts.gui_main
	slot_88_5_0, slot_88_6_0 = game.engine:GetScreenSize()
	slot_88_7_0 = (gui.ctx and gui.ctx.user and gui.ctx.user.username or "user") .. " "
	slot_88_8_0 = tostring(slot_0_42_0.fps)
	slot_88_9_1 = nil
	slot_88_9_0 = slot_0_42_0.kdSuicide and "BOT" or tostring(slot_0_42_0.kdKills) .. "/" .. tostring(slot_0_42_0.kdDeaths)
	slot_88_10_1 = {
		{
			grad = true,
			[0] = nil,
			text = slot_88_7_0
		},
		{
			dim = true,
			text = "   FPS "
		},
		{
			grad = true,
			text = slot_88_8_0
		},
		{
			dim = true,
			text = "   PING ",
			[0] = nil
		},
		{
			grad = true,
			text = tostring(slot_0_42_0.ping)
		},
		{
			dim = true,
			text = "   KD "
		},
		{
			grad = true,
			text = slot_88_9_0
		}
	}
	slot_88_11_0 = {}
	slot_88_12_1 = false

	if slot_0_42_0.showUser then
		table.insert(slot_88_11_0, {
			grad = true,
			text = slot_88_7_0
		})

		slot_88_12_1 = true
	end

	if slot_0_42_0.showFps then
		if slot_88_12_1 then
			table.insert(slot_88_11_0, {
				dim = true,
				text = "   FPS ",
				["WP 56"] = nil
			})
		else
			table.insert(slot_88_11_0, {
				dim = true,
				text = "FPS ",
				[0] = nil
			})
		end

		table.insert(slot_88_11_0, {
			grad = true,
			text = slot_88_8_0
		})

		slot_88_12_1 = true
	end

	if slot_0_42_0.showPing then
		if slot_88_12_1 then
			table.insert(slot_88_11_0, {
				dim = true,
				text = "   PING  ",
				[0] = nil
			})
		else
			table.insert(slot_88_11_0, {
				dim = true,
				text = "PING  ",
				[0] = nil
			})
		end

		table.insert(slot_88_11_0, {
			grad = true,
			text = tostring(slot_0_42_0.ping)
		})

		slot_88_12_1 = true
	end

	if slot_0_42_0.showKd then
		if slot_88_12_1 then
			table.insert(slot_88_11_0, {
				dim = true,
				text = "   KD ",
				HEAD_HEIGHT = nil
			})
		else
			table.insert(slot_88_11_0, {
				dim = true,
				text = "KD ",
				[0] = nil
			})
		end

		table.insert(slot_88_11_0, {
			grad = true,
			text = slot_88_9_0
		})

		slot_88_12_0 = true
	end

	slot_88_10_0 = slot_88_11_0

	if #slot_88_10_0 == 0 then
		return
	end

	slot_88_13_0 = slot_0_7_0(6)
	slot_88_14_0 = 0

	for iter_88_0, iter_88_1 in ipairs(slot_88_10_0) do
		slot_88_14_0 = slot_88_14_0 + #iter_88_1.text
	end

	slot_88_15_0 = slot_0_7_0(12)
	slot_88_16_0 = slot_0_7_0(8)
	slot_88_17_0 = slot_0_7_0(26)
	slot_88_18_0 = slot_88_14_0 * slot_88_13_0 + slot_88_15_0 * 2
	slot_88_19_0, slot_88_20_0 = game.engine:GetScreenSize()
	slot_88_21_0 = slot_88_19_0 - slot_88_18_0 - slot_0_7_0(8)
	slot_88_22_0 = slot_0_7_0(8)
	slot_88_23_0 = slot_0_7_0(6)
	slot_88_24_0 = slot_0_7_0(3)

	slot_88_4_0:AddRectFilledRounded(draw.Rect(slot_88_21_0, slot_88_22_0, slot_88_21_0 + slot_88_18_0, slot_88_22_0 + slot_88_17_0), slot_0_37_0.hud, slot_88_23_0, draw.Rounding.ALL)
	slot_88_4_0:AddRectFilledRounded(draw.Rect(slot_88_21_0, slot_88_22_0, slot_88_21_0 + slot_88_23_0 * 2, slot_88_22_0 + slot_88_24_0 + slot_88_23_0), slot_0_37_0.grad1, slot_88_23_0, draw.Rounding.TOP_LEFT)
	slot_88_4_0:AddRectFilledRounded(draw.Rect(slot_88_21_0 + slot_88_18_0 - slot_88_23_0 * 2, slot_88_22_0, slot_88_21_0 + slot_88_18_0, slot_88_22_0 + slot_88_24_0 + slot_88_23_0), slot_0_37_0.grad1, slot_88_23_0, draw.Rounding.TOP_RIGHT)
	slot_88_4_0:AddRectFilled(draw.Rect(slot_88_21_0 + slot_88_23_0 - 2, slot_88_22_0, slot_88_21_0 + slot_88_18_0 - slot_88_23_0 + 1, slot_88_22_0 + slot_88_24_0), slot_0_37_0.grad1)

	for iter_88_2 = 0, slot_88_18_0 - 1, 2 do
		slot_88_29_0 = iter_88_2 / slot_88_18_0
		slot_88_30_1 = slot_88_29_0 * slot_88_29_0
		slot_88_31_1 = slot_0_0_0.floor(50 * slot_88_30_1)

		slot_88_4_0:AddRectFilled(draw.Rect(slot_88_21_0 + iter_88_2, slot_88_22_0, slot_88_21_0 + iter_88_2 + 2, slot_88_22_0 + slot_88_24_0), draw.Color(255, 255, 255, slot_88_31_1))
	end

	slot_88_4_0:AddRectFilled(draw.Rect(slot_88_21_0, slot_88_22_0 + slot_88_24_0, slot_88_21_0 + slot_88_18_0, slot_88_22_0 + slot_88_24_0 + slot_88_23_0), slot_0_37_0.hud)

	slot_88_25_0 = slot_88_21_0 + slot_88_15_0
	slot_88_26_0 = slot_88_22_0 + slot_88_16_0 - slot_0_7_0(2)

	for iter_88_3, iter_88_4 in ipairs(slot_88_10_0) do
		slot_88_32_0 = nil

		if iter_88_4.grad then
			slot_88_32_0 = slot_0_37_0.grad1
		else
			slot_88_32_0 = draw.Color(140, 140, 140, 220)
		end

		slot_88_4_0:AddText(draw.Vec2(slot_88_25_0, slot_88_26_0), iter_88_4.text, slot_88_32_0)

		slot_88_25_0 = slot_88_25_0 + #iter_88_4.text * slot_88_13_0
	end
end

slot_0_108_0 = {}
slot_0_107_0 = draw.fonts.watermark or draw.fonts.gui_main

function slot_0_109_0(arg_89_0)
	if arg_89_0 == nil then
		return "body"
	end

	return ({
		[0] = "body",
		"head",
		"chest",
		"stomach",
		"left arm",
		"right arm",
		"left leg",
		"right leg",
		nil,
		nil,
		"body",
		[0] = nil
	})[arg_89_0] or "body"
end

function slot_0_110_0(arg_90_0, ...)
	table.insert(slot_0_108_0, {
		xPad = -11,
		xPadB = -11,
		celGrpWorldVis = nil,
		text = {
			...
		},
		time = arg_90_0,
		delay = (game.globalVars.m_flRealTime or 0) + arg_90_0,
		color = {
			{
				144,
				170,
				241,
				[0] = nil
			},
			{
				10,
				10,
				10,
				[0] = nil
			}
		}
	})
end

function slot_0_111_0(arg_91_0)
	local var_91_0 = 0
	local var_91_1 = 0

	for iter_91_0 = 1, #arg_91_0 do
		local var_91_2 = arg_91_0[iter_91_0][4]
		local var_91_3 = slot_0_107_0:GetTextSize(var_91_2, true)

		var_91_0 = var_91_0 + var_91_3.x
		var_91_1 = var_91_3.y
	end

	return var_91_0, var_91_1
end

function slot_0_112_0(arg_92_0, arg_92_1, arg_92_2, arg_92_3)
	local var_92_0 = 0

	for iter_92_0 = 1, #arg_92_3 do
		local var_92_1 = arg_92_3[iter_92_0]
		local var_92_2 = slot_0_107_0:GetTextSize(var_92_1[4], true)

		arg_92_0:AddText(draw.Vec2(arg_92_1 + var_92_0, arg_92_2), var_92_1[4], draw.Color(var_92_1[1], var_92_1[2], var_92_1[3], 255))

		var_92_0 = var_92_0 + var_92_2.x
	end
end

function slot_0_113_0(arg_93_0, arg_93_1, arg_93_2, arg_93_3, arg_93_4)
	arg_93_0.font = slot_0_107_0

	if not arg_93_4.totalW then
		slot_93_5_1 = 0

		for iter_93_0 = 1, #arg_93_3 do
			slot_93_5_1 = slot_93_5_1 + slot_0_107_0:GetTextSize(arg_93_3[iter_93_0][4], true).x
		end

		arg_93_4.totalW = slot_93_5_1
		arg_93_4.mw = slot_0_0_0.max(150, slot_93_5_1 + 24)
	end

	slot_93_5_0 = arg_93_4.mw
	slot_93_6_0 = game.globalVars.m_flRealTime or 0
	slot_93_7_0 = 26
	slot_93_8_0 = 6
	slot_93_9_0 = 3
	slot_93_10_0 = 8

	if not arg_93_4.scale then
		arg_93_4.scale = 0.01
	end

	if not arg_93_4.hideOff then
		arg_93_4.hideOff = 0
	end

	slot_93_11_0 = slot_93_6_0 >= arg_93_4.delay

	if not slot_93_11_0 then
		if arg_93_4.scale < 1 then
			arg_93_4.scale = arg_93_4.scale + (1 - arg_93_4.scale) * 0.12
		end

		if arg_93_4.scale > 0.99 then
			arg_93_4.scale = 1
		end
	else
		arg_93_4.hideOff = arg_93_4.hideOff + 2.5
		arg_93_4.scale = arg_93_4.scale - arg_93_4.scale * 0.06

		if arg_93_4.scale < 0.02 then
			table.remove(slot_0_108_0, arg_93_1)

			return
		end
	end

	slot_93_12_0 = arg_93_4.scale
	slot_93_13_0 = slot_0_0_0.floor(255 * slot_93_12_0)

	if slot_93_13_0 < 2 then
		return
	end

	slot_93_14_0 = 8 + 32 * (arg_93_1 - 1)

	if slot_93_11_0 then
		slot_93_15_1 = slot_93_10_0
		slot_93_16_1 = slot_0_0_0.floor(slot_93_14_0 - arg_93_4.hideOff)

		if slot_93_16_1 < -slot_93_7_0 then
			table.remove(slot_0_108_0, arg_93_1)

			return
		end

		slot_93_17_1 = slot_0_37_0.hud

		arg_93_0:AddRectFilledRounded(draw.Rect(slot_93_15_1, slot_93_16_1, slot_93_15_1 + slot_93_5_0, slot_93_16_1 + slot_93_7_0), draw.Color(slot_93_17_1:GetR(), slot_93_17_1:GetG(), slot_93_17_1:GetB(), slot_93_13_0), slot_93_8_0, draw.Rounding.ALL)

		if slot_93_5_0 > slot_93_8_0 * 4 then
			arg_93_0:AddRectFilledRounded(draw.Rect(slot_93_15_1, slot_93_16_1, slot_93_15_1 + slot_93_8_0 * 2, slot_93_16_1 + slot_93_9_0 + slot_93_8_0), slot_0_37_0.grad1, slot_93_8_0, draw.Rounding.TOP_LEFT)
			arg_93_0:AddRectFilledRounded(draw.Rect(slot_93_15_1 + slot_93_5_0 - slot_93_8_0 * 2, slot_93_16_1, slot_93_15_1 + slot_93_5_0, slot_93_16_1 + slot_93_9_0 + slot_93_8_0), slot_0_37_0.grad1, slot_93_8_0, draw.Rounding.TOP_RIGHT)
			arg_93_0:AddRectFilled(draw.Rect(slot_93_15_1 + slot_93_8_0 - 2, slot_93_16_1, slot_93_15_1 + slot_93_5_0 - slot_93_8_0 + 1, slot_93_16_1 + slot_93_9_0), slot_0_37_0.grad1)

			for iter_93_1 = 0, slot_93_5_0 - 1, 6 do
				slot_93_22_1 = slot_0_0_0.floor(50 * (iter_93_1 / slot_93_5_0) * (iter_93_1 / slot_93_5_0))

				arg_93_0:AddRectFilled(draw.Rect(slot_93_15_1 + iter_93_1, slot_93_16_1, slot_93_15_1 + iter_93_1 + 6, slot_93_16_1 + slot_93_9_0), draw.Color(255, 255, 255, slot_93_22_1))
			end

			arg_93_0:AddRectFilled(draw.Rect(slot_93_15_1, slot_93_16_1 + slot_93_9_0, slot_93_15_1 + slot_93_5_0, slot_93_16_1 + slot_93_9_0 + slot_93_8_0), draw.Color(slot_93_17_1:GetR(), slot_93_17_1:GetG(), slot_93_17_1:GetB(), slot_93_13_0))
		end

		if slot_93_13_0 > 15 then
			slot_93_18_1 = slot_93_15_1 + slot_0_0_0.floor((slot_93_5_0 - arg_93_4.totalW) / 2)
			slot_93_19_1 = slot_93_16_1 + slot_0_0_0.floor(slot_93_7_0 / 2) - 7

			for iter_93_2 = 1, #arg_93_3 do
				slot_93_24_1 = arg_93_3[iter_93_2]
				slot_93_25_1 = slot_0_107_0:GetTextSize(slot_93_24_1[4], true)

				if slot_93_24_1[1] == 255 and slot_93_24_1[2] == 255 and slot_93_24_1[3] == 255 then
					arg_93_0:AddText(draw.Vec2(slot_93_18_1, slot_93_19_1), slot_93_24_1[4], draw.Color(140, 140, 140, slot_93_13_0))
				else
					arg_93_0:AddText(draw.Vec2(slot_93_18_1, slot_93_19_1), slot_93_24_1[4], slot_0_37_0.grad1)
				end

				slot_93_18_1 = slot_93_18_1 + slot_93_25_1.x
			end
		end
	else
		slot_93_15_0 = slot_0_0_0.floor(slot_93_5_0 * slot_93_12_0)
		slot_93_16_0 = slot_0_0_0.floor(slot_93_7_0 * slot_93_12_0)

		if slot_93_15_0 < 2 or slot_93_16_0 < 2 then
			return
		end

		slot_93_17_0 = slot_93_10_0 + slot_93_5_0 / 2
		slot_93_18_0 = slot_93_14_0 + slot_93_7_0 / 2
		slot_93_19_0 = slot_0_0_0.floor(slot_93_17_0 - slot_93_15_0 / 2)
		slot_93_20_0 = slot_0_0_0.floor(slot_93_18_0 - slot_93_16_0 / 2)
		slot_93_21_0 = slot_0_37_0.hud

		arg_93_0:AddRectFilledRounded(draw.Rect(slot_93_19_0, slot_93_20_0, slot_93_19_0 + slot_93_15_0, slot_93_20_0 + slot_93_16_0), draw.Color(slot_93_21_0:GetR(), slot_93_21_0:GetG(), slot_93_21_0:GetB(), slot_93_13_0), slot_93_8_0, draw.Rounding.ALL)

		if slot_93_15_0 > slot_93_8_0 * 4 then
			arg_93_0:AddRectFilledRounded(draw.Rect(slot_93_19_0, slot_93_20_0, slot_93_19_0 + slot_93_8_0 * 2, slot_93_20_0 + slot_93_9_0 + slot_93_8_0), slot_0_37_0.grad1, slot_93_8_0, draw.Rounding.TOP_LEFT)
			arg_93_0:AddRectFilledRounded(draw.Rect(slot_93_19_0 + slot_93_15_0 - slot_93_8_0 * 2, slot_93_20_0, slot_93_19_0 + slot_93_15_0, slot_93_20_0 + slot_93_9_0 + slot_93_8_0), slot_0_37_0.grad1, slot_93_8_0, draw.Rounding.TOP_RIGHT)
			arg_93_0:AddRectFilled(draw.Rect(slot_93_19_0 + slot_93_8_0 - 2, slot_93_20_0, slot_93_19_0 + slot_93_15_0 - slot_93_8_0 + 1, slot_93_20_0 + slot_93_9_0), slot_0_37_0.grad1)

			for iter_93_3 = 0, slot_93_15_0 - 1, 6 do
				slot_93_26_0 = slot_0_0_0.floor(50 * (iter_93_3 / slot_93_15_0) * (iter_93_3 / slot_93_15_0))

				arg_93_0:AddRectFilled(draw.Rect(slot_93_19_0 + iter_93_3, slot_93_20_0, slot_93_19_0 + iter_93_3 + 6, slot_93_20_0 + slot_93_9_0), draw.Color(255, 255, 255, slot_93_26_0))
			end

			arg_93_0:AddRectFilled(draw.Rect(slot_93_19_0, slot_93_20_0 + slot_93_9_0, slot_93_19_0 + slot_93_15_0, slot_93_20_0 + slot_93_9_0 + slot_93_8_0), draw.Color(slot_93_21_0:GetR(), slot_93_21_0:GetG(), slot_93_21_0:GetB(), slot_93_13_0))
		end

		if slot_93_12_0 > 0.5 then
			slot_93_22_0 = arg_93_4.totalW / 2
			slot_93_23_0 = slot_0_0_0.floor(slot_93_18_0 - 7 * slot_93_12_0)
			slot_93_24_0 = 0

			for iter_93_4 = 1, #arg_93_3 do
				slot_93_29_0 = arg_93_3[iter_93_4]
				slot_93_30_0 = slot_0_107_0:GetTextSize(slot_93_29_0[4], true)
				slot_93_31_0 = slot_93_24_0 - slot_93_22_0
				slot_93_32_0 = slot_0_0_0.floor(slot_93_17_0 + slot_93_31_0 * slot_93_12_0)

				if slot_93_29_0[1] == 255 and slot_93_29_0[2] == 255 and slot_93_29_0[3] == 255 then
					arg_93_0:AddText(draw.Vec2(slot_93_32_0, slot_93_23_0), slot_93_29_0[4], draw.Color(140, 140, 140, slot_93_13_0))
				else
					arg_93_0:AddText(draw.Vec2(slot_93_32_0, slot_93_23_0), slot_93_29_0[4], slot_0_37_0.grad1)
				end

				slot_93_24_0 = slot_93_24_0 + slot_93_30_0.x
			end
		end
	end
end

events.event:Add(function(arg_94_0)
	if not slot_0_44_0 then
		return
	end

	if not arg_94_0 then
		return
	end

	if arg_94_0:GetName() ~= "player_hurt" then
		return
	end

	local var_94_0 = entities.GetLocalPawn()

	if not var_94_0 then
		return
	end

	local var_94_1 = arg_94_0:GetPawnFromId("attacker")
	local var_94_2 = arg_94_0:GetPawnFromId("userid")

	if not var_94_1 or not var_94_2 then
		return
	end

	if var_94_1 ~= var_94_0 then
		return
	end

	slot_0_53_0.didHit = true
	slot_0_53_0.pending = false

	local var_94_3 = arg_94_0:GetInt("dmg_health") or 0

	if not arg_94_0:GetInt("health") then
		local var_94_4 = 0
	end

	local var_94_5 = arg_94_0:GetInt("hitgroup") or 0
	local var_94_6 = "enemy"

	if var_94_2.GetName then
		var_94_6 = var_94_2:GetName() or "enemy"
	end

	if #var_94_6 > 28 then
		var_94_6 = string.sub(var_94_6, 1, 28)
	end

	local var_94_7 = hlGetHc()
	local var_94_8 = {
		{
			255,
			255,
			255,
			"Hit ",
			[0] = nil
		},
		{
			0,
			0,
			0,
			var_94_6,
			[0] = nil
		},
		{
			255,
			255,
			255,
			" in the ",
			[0] = nil
		},
		{
			0,
			0,
			0,
			[0] = nil,
			slot_0_109_0(var_94_5)
		},
		{
			255,
			255,
			255,
			" for ",
			[0] = nil
		},
		{
			0,
			0,
			0,
			[0] = nil,
			tostring(var_94_3)
		},
		{
			255,
			255,
			255,
			" damage",
			[0] = nil
		}
	}

	slot_0_110_0(3, unpack(var_94_8))
end)
events.event:Add(function(arg_95_0)
	if not slot_0_44_0 then
		return
	end

	if not arg_95_0 then
		return
	end

	if arg_95_0:GetName() == "player_death" and slot_0_53_0.pending then
		local var_95_0 = entities.GetLocalPawn()
		local var_95_1 = arg_95_0:GetPawnFromId("userid")

		if var_95_0 and var_95_1 and var_95_1 == var_95_0 then
			slot_0_53_0.diedAfter = true
			slot_0_53_0.pending = false

			slot_0_110_0(3, {
				255,
				80,
				80,
				"Missed ",
				[0] = nil
			}, {
				255,
				255,
				255,
				"due to ",
				[0] = nil
			}, {
				255,
				80,
				80,
				"death",
				[0] = nil
			})
		end
	end
end)

function slot_0_114_0()
	if not slot_0_44_0 then
		return
	end

	if not slot_0_53_0.pending then
		return
	end

	if (game.globalVars.m_flRealTime or 0) - slot_0_53_0.fireTime > 0.11 and not slot_0_53_0.didHit then
		slot_0_53_0.pending = false

		local var_96_0 = entities.GetLocalPawn()

		if not var_96_0 or not var_96_0:IsAlive() then
			return
		end

		local var_96_1 = slot_0_53_0.eyePos or var_96_0:GetEyePos()
		local var_96_2 = slot_0_53_0.weapon or var_96_0:GetActiveWeapon()

		if not var_96_1 or not var_96_2 then
			return
		end

		if not var_96_2:ToWeaponBaseGun() then
			return
		end

		local var_96_3 = var_96_0.m_iTeamNum and var_96_0.m_iTeamNum:Get() or 0
		local var_96_4 = var_96_2:ToWeaponBaseGun()
		local var_96_5 = slot_0_18_0.mdGeneral

		if var_96_4 then
			local var_96_6 = var_96_4:GetDefIndex()

			if var_96_6 == weapon_id.ssg08 then
				var_96_5 = slot_0_18_0.mdSsg
			elseif var_96_6 == weapon_id.awp then
				var_96_5 = slot_0_18_0.mdAwp
			elseif var_96_6 == weapon_id.r8 then
				var_96_5 = slot_0_18_0.mdR8
			elseif var_96_6 == weapon_id.deagle then
				var_96_5 = slot_0_18_0.mdDeagle
			elseif var_96_6 == weapon_id.scar20 or var_96_6 == weapon_id.g3sg1 then
				var_96_5 = slot_0_18_0.mdAuto
			elseif var_96_6 == weapon_id.ak47 or var_96_6 == weapon_id.m4a4 or var_96_6 == weapon_id.m4a1s or var_96_6 == weapon_id.galil or var_96_6 == weapon_id.famas or var_96_6 == weapon_id.aug or var_96_6 == weapon_id.sg556 then
				var_96_5 = slot_0_18_0.mdRifles
			elseif var_96_6 == weapon_id.mac10 or var_96_6 == weapon_id.mp9 or var_96_6 == weapon_id.mp7 or var_96_6 == weapon_id.mp5sd or var_96_6 == weapon_id.ump45 or var_96_6 == weapon_id.p90 or var_96_6 == weapon_id.bizon then
				var_96_5 = slot_0_18_0.mdSmgs
			elseif var_96_6 == weapon_id.nova or var_96_6 == weapon_id.xm1014 or var_96_6 == weapon_id.mag7 or var_96_6 == weapon_id.sawedoff or var_96_6 == weapon_id.m249 or var_96_6 == weapon_id.negev then
				var_96_5 = slot_0_18_0.mdHeavy
			elseif var_96_6 == weapon_id.glock or var_96_6 == weapon_id.usp_s or var_96_6 == weapon_id.p2000 or var_96_6 == weapon_id.p250 or var_96_6 == weapon_id.cz75 or var_96_6 == weapon_id.dualberettas or var_96_6 == weapon_id.tec9 or var_96_6 == weapon_id.fiveseven then
				var_96_5 = slot_0_18_0.mdPistols
			end
		end

		local var_96_7 = 1

		if var_96_5 then
			local var_96_8 = var_96_5:Get()

			if type(var_96_8) == "number" then
				var_96_7 = slot_0_0_0.floor(var_96_8)
			end
		end

		local var_96_9 = false

		entities.players:ForEach(function(arg_97_0)
			if var_96_9 then
				return
			end

			if not arg_97_0 then
				return
			end

			local var_97_0 = arg_97_0.entity

			if not var_97_0 or var_97_0 == var_96_0 then
				return
			end

			if not var_97_0.IsAlive or not var_97_0:IsAlive() then
				return
			end

			if (var_97_0.m_iTeamNum and var_97_0.m_iTeamNum:Get() or 0) == var_96_3 then
				return
			end

			local var_97_1 = var_97_0:GetHitboxCenter(0)
			local var_97_2 = var_97_0:GetHitboxCenter(5)
			local var_97_3 = var_97_1 or var_97_2

			if not var_97_3 then
				return
			end

			local var_97_4 = Vector(var_97_3.x - var_96_1.x, var_97_3.y - var_96_1.y, var_97_3.z - var_96_1.z)
			local var_97_5, var_97_6 = mods.penetration.FireBullet(var_96_1, var_97_4, var_96_2, var_97_0, false, false)

			if var_97_6 and var_97_6.damage and var_97_6.damage >= var_96_7 then
				var_96_9 = true
			end
		end)

		if var_96_9 then
			slot_0_110_0(3, {
				255,
				80,
				80,
				"Missed ",
				[0] = nil
			}, {
				255,
				255,
				255,
				"due to ",
				[0] = nil
			}, {
				255,
				80,
				80,
				"spread",
				[0] = nil
			})
		end
	end
end

function slot_0_115_0()
	if not slot_0_44_0 then
		slot_0_108_0 = {}

		return
	end

	if #slot_0_108_0 == 0 then
		return
	end

	local var_98_0 = draw.surface

	var_98_0.font = slot_0_107_0

	for iter_98_0, iter_98_1 in pairs(slot_0_108_0) do
		slot_0_113_0(var_98_0, iter_98_0, iter_98_1.color, iter_98_1.text, iter_98_1)
	end
end

slot_0_116_2 = 84
slot_0_117_2 = 76
slot_0_118_3 = 46
slot_0_119_3 = 44
slot_0_120_3 = 23
slot_0_121_3 = 260
slot_0_122_3 = 18
slot_0_123_3 = 33
slot_0_124_3 = 25
slot_0_125_3 = 0.35
slot_0_126_3 = gui.ctx:Find("rage>weapon>SSG-08>weapon>pointscale")

function slot_0_127_3(arg_99_0)
	if not slot_0_126_3 then
		return
	end

	local var_99_0 = slot_0_126_3:GetValue()

	if var_99_0 then
		var_99_0:Set(arg_99_0)
	end
end

function slot_0_128_3()
	local var_100_0 = entities.GetLocalPawn()

	if not var_100_0 then
		return nil
	end

	return var_100_0
end

function slot_0_129_3(arg_101_0)
	if not arg_101_0 then
		return 0
	end

	local var_101_0 = arg_101_0:GetAbsVelocity()

	if not var_101_0 then
		return 0
	end

	return slot_0_0_0.sqrt(var_101_0.x * var_101_0.x + var_101_0.y * var_101_0.y)
end

function slot_0_130_3(arg_102_0)
	if not arg_102_0 then
		return false
	end

	local var_102_0 = arg_102_0.m_fFlags and arg_102_0.m_fFlags:Get() or 0

	return bit.band(var_102_0, 1) ~= 0
end

function slot_0_131_3(arg_103_0)
	if not arg_103_0 then
		return false
	end

	if arg_103_0.m_zoomLevel then
		return (arg_103_0.m_zoomLevel:Get() or 0) ~= 0
	end

	return false
end

slot_0_132_3 = slot_0_119_3

events.createMove:Add(function(arg_104_0)
	if not slot_0_29_0.rageScoutPs then
		return
	end

	if slot_0_29_0.scoutAirFs and slot_0_45_0.active then
		return
	end

	if not slot_0_90_0() then
		return
	end

	local var_104_0 = slot_0_128_3()

	if not var_104_0 or not var_104_0:IsAlive() then
		return
	end

	local var_104_1 = var_104_0:GetActiveWeapon() or nil
	local var_104_2 = var_104_1 and var_104_1:ToWeaponBaseGun()

	if not var_104_2 then
		return
	end

	if var_104_2:GetDefIndex() ~= weapon_id.ssg08 then
		return
	end

	local var_104_3 = slot_0_131_3(var_104_2)

	if not slot_0_130_3(var_104_0) then
		return
	end

	local var_104_4
	local var_104_5 = slot_0_129_3(var_104_0)

	if var_104_5 > slot_0_121_3 then
		var_104_5 = slot_0_121_3
	end

	if var_104_3 then
		if var_104_5 < 5 then
			var_104_4 = slot_0_116_2
		elseif var_104_5 <= slot_0_122_3 then
			local var_104_6 = (var_104_5 - 5) / (slot_0_122_3 - 5)

			if var_104_6 < 0 then
				var_104_6 = 0
			end

			if var_104_6 > 1 then
				var_104_6 = 1
			end

			var_104_4 = slot_0_116_2 - (slot_0_116_2 - slot_0_117_2) * var_104_6
		else
			local var_104_7 = (var_104_5 - slot_0_122_3) / (slot_0_121_3 - slot_0_122_3)

			if var_104_7 < 0 then
				var_104_7 = 0
			end

			if var_104_7 > 1 then
				var_104_7 = 1
			end

			var_104_4 = slot_0_117_2 - (slot_0_117_2 - slot_0_118_3) * var_104_7
		end
	elseif var_104_5 < 5 then
		var_104_4 = slot_0_119_3
	else
		local var_104_8 = var_104_5 / slot_0_121_3

		var_104_4 = slot_0_119_3 - (slot_0_119_3 - slot_0_120_3) * var_104_8
	end

	local var_104_9 = game.globalVars.m_flFrameTime or 0.015625

	if var_104_9 <= 0 then
		var_104_9 = 0.015625
	end

	slot_0_132_3 = slot_0_132_3 + (var_104_4 - slot_0_132_3) * (slot_0_125_3 * var_104_9 * 60)

	slot_0_127_3(slot_0_132_3)
end)
events.createMove:Add(function(arg_105_0)
	if not slot_0_49_0.enabled then
		if slot_0_49_0.wasAir then
			if slot_0_49_0.savedHc and slot_0_18_0.ssgHitchance then
				local var_105_0 = slot_0_18_0.ssgHitchance:GetValue()

				if var_105_0 then
					var_105_0:Set(slot_0_49_0.savedHc)
				end
			end

			if slot_0_49_0.savedPs and slot_0_18_0.ssgPointscaleCtrl then
				local var_105_1 = slot_0_18_0.ssgPointscaleCtrl:GetValue()

				if var_105_1 then
					var_105_1:Set(slot_0_49_0.savedPs)
				end
			end

			slot_0_49_0.savedHc = nil
			slot_0_49_0.savedPs = nil
			slot_0_49_0.wasAir = false
		end

		return
	end

	local var_105_2 = entities.GetLocalPawn()

	if not var_105_2 or not var_105_2:IsAlive() then
		slot_0_49_0.savedHc = nil
		slot_0_49_0.savedPs = nil
		slot_0_49_0.wasAir = false

		return
	end

	local var_105_3 = var_105_2:GetActiveWeapon()

	if not var_105_3 then
		return
	end

	local var_105_4 = var_105_3:ToWeaponBaseGun()

	if not var_105_4 then
		return
	end

	if var_105_4:GetDefIndex() ~= weapon_id.ssg08 then
		if slot_0_49_0.wasAir then
			if slot_0_49_0.savedHc and slot_0_18_0.ssgHitchance then
				local var_105_5 = slot_0_18_0.ssgHitchance:GetValue()

				if var_105_5 then
					var_105_5:Set(slot_0_49_0.savedHc)
				end
			end

			if slot_0_49_0.savedPs and slot_0_18_0.ssgPointscaleCtrl then
				local var_105_6 = slot_0_18_0.ssgPointscaleCtrl:GetValue()

				if var_105_6 then
					var_105_6:Set(slot_0_49_0.savedPs)
				end
			end

			slot_0_49_0.savedHc = nil
			slot_0_49_0.savedPs = nil
			slot_0_49_0.wasAir = false
		end

		return
	end

	local var_105_7 = var_105_2.m_fFlags and var_105_2.m_fFlags:Get() or 0

	if not (bit.band(var_105_7, 1) ~= 0) then
		if not slot_0_49_0.wasAir then
			if slot_0_18_0.ssgHitchance then
				local var_105_8 = slot_0_18_0.ssgHitchance:GetValue()

				if var_105_8 then
					slot_0_49_0.savedHc = var_105_8:Get()
				end
			end

			if slot_0_18_0.ssgPointscaleCtrl then
				local var_105_9 = slot_0_18_0.ssgPointscaleCtrl:GetValue()

				if var_105_9 then
					slot_0_49_0.savedPs = var_105_9:Get()
				end
			end

			slot_0_49_0.wasAir = true
		end

		if slot_0_18_0.ssgHitchance then
			local var_105_10 = slot_0_49_0.hc
			local var_105_11 = slot_0_18_0.ssgHitchance:GetValue()

			if var_105_11 then
				var_105_11:Set(var_105_10)
			end
		end

		if slot_0_18_0.ssgPointscaleCtrl then
			local var_105_12 = slot_0_18_0.ssgPointscaleCtrl:GetValue()

			if var_105_12 then
				var_105_12:Set(slot_0_49_0.ps)
			end
		end
	elseif slot_0_49_0.wasAir then
		if slot_0_49_0.savedHc and slot_0_18_0.ssgHitchance then
			local var_105_13 = slot_0_18_0.ssgHitchance:GetValue()

			if var_105_13 then
				var_105_13:Set(slot_0_49_0.savedHc)
			end
		end

		if slot_0_49_0.savedPs and slot_0_18_0.ssgPointscaleCtrl then
			local var_105_14 = slot_0_18_0.ssgPointscaleCtrl:GetValue()

			if var_105_14 then
				var_105_14:Set(slot_0_49_0.savedPs)
			end
		end

		slot_0_49_0.savedHc = nil
		slot_0_49_0.savedPs = nil
		slot_0_49_0.wasAir = false
	end
end)

slot_0_116_1 = math
slot_0_117_1 = 100
slot_0_118_2 = 360
slot_0_119_2 = 10
slot_0_120_2 = 32
slot_0_121_2 = {
	HEAD = 6,
	NECK = 5,
	PELVIS = 0,
	STOMACH = 1,
	RIGHT_CALF = 26,
	LEFT_HAND = 14,
	RIGHT_HAND = 15,
	LEFT_UPPER_ARM = 13,
	LEFT_CALF = 25,
	RIGHT_UPPER_ARM = 17,
	LEFT_THIGH = 22,
	RIGHT_THIGH = 23,
	LOWER_CHEST = 2,
	CHEST = 3,
	UPPER_CHEST = 4,
	[0] = nil
}
slot_0_122_2 = {
	slot_0_121_2.HEAD,
	slot_0_121_2.NECK,
	slot_0_121_2.UPPER_CHEST,
	slot_0_121_2.CHEST,
	slot_0_121_2.STOMACH,
	slot_0_121_2.PELVIS
}
slot_0_123_2 = {
	states = {},
	request = function(arg_106_0, arg_106_1, arg_106_2, arg_106_3)
		if not arg_106_0.states[arg_106_1] then
			arg_106_0.states[arg_106_1] = {
				isOverridden = false,
				[0] = nil,
				requests = {}
			}
		end

		arg_106_0.states[arg_106_1].requests[arg_106_2] = arg_106_3
	end,
	_ctrlCache = {},
	update = function(arg_107_0)
		for iter_107_0, iter_107_1 in pairs(arg_107_0.states) do
			local var_107_0 = arg_107_0._ctrlCache[iter_107_0]

			if not var_107_0 then
				var_107_0 = gui.ctx:Find(iter_107_0)
				arg_107_0._ctrlCache[iter_107_0] = var_107_0
			end

			if var_107_0 then
				local var_107_1

				for iter_107_2, iter_107_3 in pairs(iter_107_1.requests) do
					if iter_107_3 ~= nil then
						var_107_1 = iter_107_3

						break
					end
				end

				if var_107_1 ~= nil then
					if not iter_107_1.isOverridden then
						iter_107_1.orig = readFatalityVal(var_107_0)
						iter_107_1.isOverridden = true
					end

					if readFatalityVal(var_107_0) ~= var_107_1 then
						writeFatalityVal(var_107_0, var_107_1)
					end
				elseif iter_107_1.isOverridden then
					if iter_107_1.orig ~= nil and readFatalityVal(var_107_0) ~= iter_107_1.orig then
						writeFatalityVal(var_107_0, iter_107_1.orig)
					end

					iter_107_1.isOverridden = false
					iter_107_1.orig = nil
				end
			end
		end
	end
}
slot_0_124_2 = Ray_t()
slot_0_125_2 = {
	enemies = {}
}
slot_0_126_2 = {
	startTime = 0,
	duration = 0,
	active = false
}
slot_0_127_2 = {
	simulatedDamage = 0,
	active = false,
	[0] = nil,
	direction = {
		0,
		0,
		[0] = nil
	},
	scannedSpots = {}
}
slot_0_128_2 = {
	retreatStartTime = nil,
	shotFired = false,
	state = "idle",
	retreatTime = 0,
	Aim = nil
}
slot_0_129_2 = {
	deagle = {
		hsMult = 3.9,
		rangeMod = 0.85,
		pen = 2,
		armorRatio = 1.864,
		damage = 53
	},
	revolver = {
		hsMult = 4,
		rangeMod = 0.94,
		pen = 2,
		armorRatio = 1.864,
		damage = 86
	},
	glock = {
		hsMult = 4,
		rangeMod = 0.85,
		pen = 1,
		armorRatio = 0.94,
		damage = 30
	},
	["ak-47"] = {
		hsMult = 4,
		rangeMod = 0.98,
		pen = 2,
		armorRatio = 1.55,
		damage = 36
	},
	m4a4 = {
		hsMult = 4,
		rangeMod = 0.97,
		pen = 2,
		armorRatio = 1.4,
		damage = 33,
		[0] = nil
	},
	["m4a1-s"] = {
		hsMult = 3.475,
		rangeMod = 0.94,
		pen = 2,
		armorRatio = 1.4,
		damage = 38
	},
	awp = {
		hsMult = 4,
		rangeMod = 0.99,
		pen = 2.5,
		armorRatio = 1.95,
		damage = 115,
		[0] = nil
	},
	scout = {
		hsMult = 4,
		rangeMod = 0.98,
		pen = 2.5,
		armorRatio = 1.7,
		damage = 88
	}
}

function readFatalityVal(arg_108_0)
	if not arg_108_0 then
		return nil
	end

	local var_108_0 = arg_108_0.GetValue and arg_108_0:GetValue() or arg_108_0.GetValue and arg_108_0:GetValue()

	if var_108_0 then
		if var_108_0.Get then
			return var_108_0:Get()
		end

		if var_108_0.get then
			return var_108_0:Get()
		end
	end

	if arg_108_0.Get then
		return arg_108_0:Get()
	end

	if arg_108_0.get then
		return arg_108_0:Get()
	end

	return nil
end

function writeFatalityVal(arg_109_0, arg_109_1)
	if not arg_109_0 or arg_109_1 == nil then
		return false
	end

	local var_109_0 = arg_109_0.GetValue and arg_109_0:GetValue() or arg_109_0.GetValue and arg_109_0:GetValue()

	if var_109_0 then
		if type(var_109_0.Get) == "function" and type(var_109_0:Get()) == "userdata" then
			local var_109_1 = var_109_0:Get()

			if var_109_1.SetRaw then
				var_109_1:SetRaw(arg_109_1)
			elseif var_109_1.SetRaw then
				var_109_1:SetRaw(arg_109_1)
			end

			if var_109_0.Set then
				var_109_0:Set(var_109_1)
			elseif var_109_0.Set then
				var_109_0:Set(var_109_1)
			end
		elseif var_109_0.Set then
			var_109_0:Set(arg_109_1)
		elseif var_109_0.Set then
			var_109_0:Set(arg_109_1)
		end
	end

	if arg_109_0.Reset then
		arg_109_0:Reset()
	elseif arg_109_0.reset then
		arg_109_0:reset()
	end

	return true
end

slot_0_130_2 = -1

function slot_0_131_2()
	local var_110_0 = game.globalVars and game.globalVars.m_iTickCount or -1

	if var_110_0 == slot_0_130_2 then
		return
	end

	slot_0_130_2 = var_110_0
	slot_0_125_2.enemies = {}

	local var_110_1 = entities.GetLocalPawn()

	if not var_110_1 then
		return
	end

	entities.players:ForEach(function(arg_111_0)
		local var_111_0 = arg_111_0.entity

		if var_111_0 and var_111_0:IsAlive() and var_111_0 ~= var_110_1 and var_111_0:IsEnemy() then
			table.insert(slot_0_125_2.enemies, {
				[0] = nil,
				pawn = var_111_0,
				name = var_111_0:GetName() or "ENEMY"
			})
		end
	end)
end

function slot_0_132_2(arg_112_0, arg_112_1)
	return arg_112_0 - math.floor(arg_112_0 / arg_112_1) * arg_112_1
end

function slot_0_133_1(arg_113_0)
	local var_113_0 = 1

	if arg_113_0 < 0 then
		var_113_0 = -1
	end

	return (slot_0_132_2(math.abs(arg_113_0) + 180, 360) - 180) * var_113_0
end

function slot_0_134_1(arg_114_0, arg_114_1)
	if not arg_114_0 or not arg_114_1 then
		return nil
	end

	if type(arg_114_0.GetHitboxCenter) == "function" then
		local var_114_0 = arg_114_0:GetHitboxCenter(arg_114_1)

		if var_114_0 and var_114_0:LengthSqr() > 10 then
			return var_114_0
		end
	end

	return nil
end

function slot_0_135_1(arg_115_0)
	if not arg_115_0 then
		return nil
	end

	local var_115_0 = slot_0_134_1(arg_115_0, slot_0_121_2.CHEST)

	if var_115_0 then
		return var_115_0
	end

	local var_115_1 = arg_115_0:GetAbsOrigin()

	if var_115_1 then
		return Vector(var_115_1.x, var_115_1.y, var_115_1.z + 40)
	end

	return nil
end

function slot_0_136_1(arg_116_0)
	if not arg_116_0 then
		return nil, nil
	end

	local var_116_0, var_116_1, var_116_2 = arg_116_0:AngleVectors()

	return var_116_0, Vector(-var_116_1.x, -var_116_1.y, -var_116_1.z)
end

function slot_0_137_1(arg_117_0, arg_117_1)
	if not arg_117_0 or not arg_117_1 then
		return false
	end

	local var_117_0 = game.physicsQueryInterface:TraceRay(slot_0_124_2, arg_117_0, arg_117_1)

	return var_117_0 and var_117_0.m_flFraction >= 1
end

function slot_0_138_1(arg_118_0, arg_118_1, arg_118_2)
	local var_118_0 = math.CalcAngle(arg_118_1, arg_118_2)

	if not var_118_0 then
		return 9999
	end

	local var_118_1 = arg_118_0 - var_118_0

	return math.sqrt(math.abs(var_118_1.x)^2 + math.abs(slot_0_133_1(var_118_1.y))^2)
end

function slot_0_139_1(arg_119_0, arg_119_1)
	local var_119_0 = {}

	for iter_119_0, iter_119_1 in ipairs(slot_0_125_2.enemies) do
		local var_119_1 = iter_119_1.pawn

		if var_119_1 and var_119_1:IsAlive() then
			local var_119_2 = slot_0_135_1(var_119_1)

			if var_119_2 then
				local var_119_3 = slot_0_138_1(arg_119_1, arg_119_0, var_119_2)

				if var_119_3 <= slot_0_118_2 then
					table.insert(var_119_0, {
						pawn = var_119_1,
						fov = var_119_3,
						pos = var_119_2,
						name = iter_119_1.name
					})
				end
			end
		end
	end

	table.sort(var_119_0, function(arg_120_0, arg_120_1)
		return arg_120_0.fov < arg_120_1.fov
	end)

	return var_119_0
end

function slot_0_140_1(arg_121_0, arg_121_1)
	if arg_121_0 == slot_0_121_2.HEAD or arg_121_0 == slot_0_121_2.NECK then
		return arg_121_1
	end

	if arg_121_0 == slot_0_121_2.STOMACH or arg_121_0 == slot_0_121_2.PELVIS then
		return 1.25
	end

	return 1
end

function slot_0_141_1(arg_122_0, arg_122_1, arg_122_2, arg_122_3, arg_122_4)
	if not arg_122_0 then
		return 0
	end

	arg_122_3 = arg_122_3 or 3

	if arg_122_4 == nil then
		arg_122_4 = arg_122_3 == slot_0_121_2.HEAD or arg_122_3 == slot_0_121_2.NECK
	end

	local var_122_0 = (type(arg_122_0.GetClassName) == "function" and arg_122_0:GetClassName():lower() or ""):gsub("c_weapon", ""):gsub("c_", ""):gsub("weapon_", "")

	if var_122_0:find("deagle") or var_122_0:find("desert") then
		var_122_0 = "deagle"
	elseif var_122_0:find("ssg08") then
		var_122_0 = "scout"
	end

	local var_122_1 = slot_0_129_2[var_122_0] or {
		hsMult = 4,
		rangeMod = 0.98,
		pen = 1,
		armorRatio = 1,
		damage = 30,
		[0] = nil
	}
	local var_122_2 = var_122_1.damage * math.pow(var_122_1.rangeMod, arg_122_2 / 500) * slot_0_140_1(arg_122_3, var_122_1.hsMult)
	local var_122_3 = arg_122_1.m_ArmorValue and arg_122_1.m_ArmorValue:Get() or 0
	local var_122_4 = arg_122_1.m_bHasHelmet and arg_122_1.m_bHasHelmet:Get() or false

	if var_122_3 > 0 and (not arg_122_4 or var_122_4) then
		local var_122_5 = var_122_2 * var_122_1.armorRatio * 0.5

		if var_122_3 < (var_122_2 - var_122_5) * 0.5 then
			var_122_5 = var_122_2 - var_122_3 / 0.5
		end

		var_122_2 = var_122_5
	end

	return math.floor(var_122_2)
end

function slot_0_142_1(arg_123_0, arg_123_1, arg_123_2, arg_123_3, arg_123_4, arg_123_5)
	if not arg_123_0 or not arg_123_1 or not arg_123_2 then
		return {
			visible = false,
			damage = 0,
			hitgroup = 0
		}
	end

	local var_123_0 = arg_123_1 - arg_123_0
	local var_123_1 = var_123_0.x * var_123_0.x + var_123_0.y * var_123_0.y + var_123_0.z * var_123_0.z

	if var_123_1 > 16000000 or var_123_1 == 0 then
		return {
			visible = false,
			damage = 0,
			hitgroup = 0
		}
	end

	local var_123_2 = game.physicsQueryInterface:TraceRay(slot_0_124_2, arg_123_0, arg_123_1)
	local var_123_3 = var_123_2 and (var_123_2.m_flFraction >= 0.97 or arg_123_3 and var_123_2.m_pEnt == arg_123_3)
	local var_123_4 = arg_123_4 == slot_0_121_2.HEAD or arg_123_4 == slot_0_121_2.NECK

	if var_123_3 then
		return {
			visible = true,
			damage = slot_0_141_1(arg_123_2, arg_123_3, math.sqrt(var_123_1), arg_123_4, var_123_4),
			hitgroup = var_123_4 and 1 or 2
		}
	end

	if arg_123_5 == 2 and mods and mods.penetration then
		local var_123_5, var_123_6 = mods.penetration.FireBullet(arg_123_0, Vector(var_123_0.x * 1.5, var_123_0.y * 1.5, var_123_0.z * 1.5), arg_123_2, arg_123_3)

		if var_123_5 and var_123_6 and var_123_6.damage > 0 then
			local var_123_7 = var_123_6.damage

			if arg_123_3 and mods.penetration.ScaleDamage then
				local var_123_8 = mods.penetration.ScaleDamage(var_123_6.damage, arg_123_2, var_123_6.hitgroup or 2, arg_123_3)

				if type(var_123_8) == "number" then
					var_123_7 = var_123_8
				end
			end

			return {
				visible = false,
				damage = math.floor(var_123_7),
				hitgroup = var_123_6.hitgroup or 2
			}
		end
	end

	return {
		visible = false,
		damage = 0,
		hitgroup = 0,
		[0] = nil
	}
end

function slot_0_143_1()
	local var_124_0 = entities.GetLocalPawn()

	if not var_124_0 or not var_124_0:IsAlive() then
		slot_0_126_2.active = false

		return
	end

	local var_124_1 = var_124_0:GetActiveWeapon()

	if not var_124_1 then
		slot_0_126_2.active = false

		return
	end

	local var_124_2 = Schema:get(var_124_1, "m_nNextPrimaryAttackTick", "int*")

	if type(var_124_2) == "number" then
		local var_124_3 = game.globalVars.m_iTickCount or 0

		if var_124_3 < var_124_2 then
			slot_0_126_2.active = true
			slot_0_126_2.startTime = game.globalVars.m_flRealTime or 0
			slot_0_126_2.duration = (var_124_2 - var_124_3) * 0.015625
		else
			slot_0_126_2.active = false
		end
	end
end

function slot_0_144_2(arg_125_0)
	if not arg_125_0 then
		return true
	end

	local var_125_0 = type(arg_125_0.GetClassName) == "function" and arg_125_0:GetClassName() or ""

	if var_125_0 == "C_WeaponTaser" or var_125_0:find("Knife") or var_125_0:find("Bayonet") or var_125_0:find("Grenade") or var_125_0:find("C4") then
		return true
	end

	return false
end

events.event:Add(function(arg_126_0)
	if arg_126_0:GetName() ~= "weapon_fire" then
		return
	end

	local var_126_0 = entities.GetLocalController()

	if not var_126_0 then
		return
	end

	if arg_126_0:GetController("userid") == var_126_0 and (slot_0_128_2.state == "peeking" or slot_0_127_2.active) then
		slot_0_128_2.shotFired = true
	end
end)
events.createMove:Add(function(arg_127_0)
	if not arg_127_0 or not game.engine:InGame() then
		return
	end

	local var_127_0 = entities.GetLocalPawn()

	if not var_127_0 or not var_127_0:IsAlive() then
		slot_0_127_2.active = false

		return
	end

	local var_127_1 = slot_0_54_0.aiPeek and slot_0_54_0.aiPeek:Get() or slot_0_46_0.enabled
	local var_127_2 = slot_0_54_0.aiRetreat and slot_0_54_0.aiRetreat:Get() or false

	slot_0_131_2()
	slot_0_143_1()
	slot_0_123_2:update()
	slot_0_4_0()

	local var_127_3 = "misc>movement>peek assist"
	local var_127_4 = "misc>movement>peek assist>retreat on release"

	if var_127_1 and var_127_2 then
		slot_0_123_2:request(var_127_3, "ai_peek", true)
		slot_0_123_2:request(var_127_4, "ai_peek", true)
	else
		slot_0_123_2:request(var_127_3, "ai_peek", nil)
		slot_0_123_2:request(var_127_4, "ai_peek", nil)
	end

	if not var_127_1 then
		slot_0_127_2.active = false

		return
	end

	local function var_127_5()
		slot_128_0_0 = game.globalVars.m_flRealTime or 0

		if slot_0_126_2.active and slot_0_126_2.startTime + slot_0_126_2.duration - slot_128_0_0 > 0.05 then
			slot_0_127_2.active = false

			return
		end

		slot_128_1_0 = var_127_0:GetEyePos()
		slot_128_2_0 = arg_127_0:GetViewangles()
		slot_128_3_0 = var_127_0:GetActiveWeapon()

		if not slot_128_1_0 or not slot_128_2_0 or not slot_128_3_0 or slot_0_144_2(slot_128_3_0) then
			slot_0_127_2.active = false

			return
		end

		slot_128_4_0 = slot_0_139_1(slot_128_1_0, slot_128_2_0)

		if #slot_128_4_0 == 0 then
			slot_0_127_2.active = false

			return
		end

		slot_128_5_0 = {}

		for iter_128_0 = 1, math.min(#slot_128_4_0, slot_0_119_2) do
			slot_128_10_2 = slot_128_4_0[iter_128_0].pawn
			slot_128_11_1 = {}

			for iter_128_1, iter_128_2 in ipairs(slot_0_122_2) do
				slot_128_17_1 = slot_0_134_1(slot_128_10_2, iter_128_2)

				if slot_128_17_1 then
					table.insert(slot_128_11_1, {
						pos = slot_128_17_1,
						id = iter_128_2
					})
				end
			end

			if #slot_128_11_1 > 0 then
				table.insert(slot_128_5_0, {
					pawn = slot_128_10_2,
					bones = slot_128_11_1
				})
			end
		end

		if #slot_128_5_0 == 0 then
			slot_0_127_2.active = false

			return
		end

		if slot_0_127_2.active and slot_0_127_2.target and slot_0_127_2.target:IsAlive() then
			for iter_128_3, iter_128_4 in ipairs(slot_128_5_0) do
				if iter_128_4.pawn == slot_0_127_2.target then
					for iter_128_5, iter_128_6 in ipairs(iter_128_4.bones) do
						if slot_0_142_1(slot_128_1_0, iter_128_6.pos, slot_128_3_0, iter_128_4.pawn, iter_128_6.id, 2).damage > 0 then
							arg_127_0:SetForwardMove(0)
							arg_127_0:SetLeftMove(0)

							return
						end
					end
				end
			end
		end

		slot_128_6_0, slot_128_7_0 = slot_0_136_1(slot_128_2_0)
		slot_128_8_0 = {}

		for iter_128_7 = 0, slot_0_120_2 - 1 do
			slot_128_13_0 = iter_128_7 / slot_0_120_2 * 2 * math.pi
			slot_128_14_0 = math.sin(slot_128_13_0)
			slot_128_15_1 = math.cos(slot_128_13_0)
			slot_128_16_1 = Vector(slot_128_1_0.x + (slot_128_6_0.x * slot_128_15_1 + slot_128_7_0.x * slot_128_14_0) * slot_0_117_1, slot_128_1_0.y + (slot_128_6_0.y * slot_128_15_1 + slot_128_7_0.y * slot_128_14_0) * slot_0_117_1, slot_128_1_0.z)

			if slot_0_137_1(slot_128_1_0, slot_128_16_1) then
				for iter_128_8, iter_128_9 in ipairs(slot_128_5_0) do
					slot_128_22_0 = false

					for iter_128_10, iter_128_11 in ipairs(iter_128_9.bones) do
						slot_128_28_0 = slot_0_142_1(slot_128_16_1, iter_128_11.pos, slot_128_3_0, iter_128_9.pawn, iter_128_11.id, 2)

						if slot_128_28_0.damage > 0 then
							table.insert(slot_128_8_0, {
								[0] = nil,
								dir = {
									-slot_128_14_0,
									slot_128_15_1
								},
								angle = slot_128_13_0,
								target = iter_128_9.pawn,
								pos = iter_128_11.pos,
								dmg = slot_128_28_0.damage
							})

							slot_128_22_0 = true

							break
						end
					end

					if slot_128_22_0 then
						break
					end
				end
			end
		end

		slot_128_9_0 = nil

		if #slot_128_8_0 > 0 then
			slot_128_10_0 = 999
			slot_128_11_0 = math.rad(slot_0_133_1(math.CalcAngle(slot_128_1_0, slot_128_4_0[1].pos).y - slot_128_2_0.y))

			for iter_128_12, iter_128_13 in ipairs(slot_128_8_0) do
				slot_128_17_0 = math.abs(slot_0_133_1(math.deg(iter_128_13.angle - slot_128_11_0)))

				if slot_128_17_0 < slot_128_10_0 then
					slot_128_10_0 = slot_128_17_0
					slot_128_9_0 = iter_128_13
				end
			end
		end

		if slot_128_9_0 then
			slot_0_127_2.active = true
			slot_0_127_2.direction = slot_128_9_0.dir
			slot_0_127_2.target = slot_128_9_0.target
			slot_0_127_2.targetPos = slot_128_9_0.pos

			arg_127_0:SetLeftMove(slot_128_9_0.dir[1])
			arg_127_0:SetForwardMove(slot_128_9_0.dir[2])
		else
			slot_0_127_2.active = false
		end
	end

	local function var_127_6()
		if not var_127_2 then
			slot_0_128_2.state = "idle"
			slot_0_128_2.shotFired = false
			slot_0_128_2.homePos = nil

			return
		end

		if not slot_0_127_2.active and slot_0_128_2.state == "idle" then
			slot_0_128_2.homePos = var_127_0:GetAbsOrigin()
		end

		if slot_0_128_2.state == "idle" then
			slot_0_128_2.shotFired = false

			if slot_0_127_2.active then
				if (game.globalVars.m_flRealTime or 0) - slot_0_128_2.retreatTime < 0.2 then
					return
				end

				slot_0_128_2.state = "peeking"
				slot_0_128_2.startPos = var_127_0:GetAbsOrigin()
			end
		elseif slot_0_128_2.state == "peeking" then
			if slot_0_128_2.shotFired then
				slot_0_128_2.state = "retreating"
				slot_0_128_2.shotFired = false
				slot_0_128_2.retreatStartTime = game.globalVars.m_flRealTime or 0
			elseif not slot_0_127_2.active then
				slot_0_128_2.state = "idle"
			end
		elseif slot_0_128_2.state == "retreating" then
			local var_129_0 = var_127_0:GetAbsOrigin()
			local var_129_1 = slot_0_128_2.homePos or slot_0_128_2.startPos

			if not var_129_1 then
				slot_0_128_2.state = "idle"

				return
			end

			local var_129_2 = game.globalVars.m_flRealTime or 0

			if var_129_2 - (slot_0_128_2.retreatStartTime or 0) > 3 then
				slot_0_128_2.retreatTime = var_129_2
				slot_0_128_2.state = "idle"
				slot_0_128_2.retreatStartTime = nil

				return
			end

			local var_129_3 = var_129_0.x - var_129_1.x
			local var_129_4 = var_129_0.y - var_129_1.y
			local var_129_5 = slot_0_116_1.sqrt(var_129_3 * var_129_3 + var_129_4 * var_129_4)

			if var_129_5 <= 15 then
				slot_0_128_2.retreatTime = var_129_2
				slot_0_128_2.state = "idle"
				slot_0_128_2.retreatStartTime = nil

				arg_127_0:SetForwardMove(0)
				arg_127_0:SetLeftMove(0)
			else
				local var_129_6 = -var_129_3 / var_129_5
				local var_129_7 = -var_129_4 / var_129_5
				local var_129_8 = slot_0_116_1.rad(arg_127_0:GetViewangles().y)
				local var_129_9 = slot_0_116_1.cos(var_129_8)
				local var_129_10 = slot_0_116_1.sin(var_129_8)

				arg_127_0:SetForwardMove(slot_0_116_1.max(-1, slot_0_116_1.min(1, var_129_6 * var_129_9 + var_129_7 * var_129_10)))
				arg_127_0:SetLeftMove(slot_0_116_1.max(-1, slot_0_116_1.min(1, -var_129_6 * var_129_10 + var_129_7 * var_129_9)))
			end
		end
	end

	var_127_5()
	var_127_6()
end)

function slot_0_116_0(arg_130_0)
	local var_130_0 = entities.GetLocalPawn()

	if not var_130_0 or not var_130_0:IsAlive() then
		return nil
	end

	local var_130_1 = var_130_0:GetEyePos()

	if not var_130_1 then
		return nil
	end

	local var_130_2 = arg_130_0:GetViewangles()
	local var_130_3 = var_130_0.m_iTeamNum and var_130_0.m_iTeamNum:Get() or 0
	local var_130_4
	local var_130_5 = math.huge

	entities.players:ForEach(function(arg_131_0)
		local var_131_0 = arg_131_0.entity ~= nil and arg_131_0.entity or arg_131_0

		if not var_131_0 or var_131_0 == var_130_0 then
			return
		end

		if not var_131_0.IsAlive or not var_131_0:IsAlive() then
			return
		end

		if (var_131_0.m_iTeamNum and var_131_0.m_iTeamNum:Get() or 0) == var_130_3 then
			return
		end

		local var_131_1 = var_131_0:GetEyePos()

		if not var_131_1 then
			return
		end

		local var_131_2 = math.CalcAngle(var_130_1, var_131_1)
		local var_131_3 = math.AngleNormalize(var_131_2.x - var_130_2.x)
		local var_131_4 = math.AngleNormalize(var_131_2.y - var_130_2.y)
		local var_131_5 = slot_0_0_0.sqrt(var_131_3 * var_131_3 + var_131_4 * var_131_4)

		if var_131_5 < var_130_5 then
			var_130_5 = var_131_5

			local var_131_6 = var_131_1.x - var_130_1.x
			local var_131_7 = var_131_1.y - var_130_1.y
			local var_131_8 = var_131_1.z - var_130_1.z

			var_130_4 = slot_0_0_0.sqrt(var_131_6 * var_131_6 + var_131_7 * var_131_7 + var_131_8 * var_131_8)
		end
	end)

	return var_130_4
end

events.createMove:Add(function(arg_132_0)
	if not slot_0_29_0.scoutAirFs then
		if slot_0_45_0.wasInAir or slot_0_45_0.active then
			if slot_0_18_0.ssgPointscaleCtrl and slot_0_45_0.savedPS ~= nil then
				slot_132_1_4 = slot_0_18_0.ssgPointscaleCtrl:GetValue()

				if slot_132_1_4 then
					slot_132_1_4:Set(slot_0_45_0.savedPS)
				end
			end

			if slot_0_18_0.ssgHitchance and slot_0_45_0.savedHC ~= nil then
				slot_132_1_3 = slot_0_18_0.ssgHitchance:GetValue()

				if slot_132_1_3 then
					slot_132_1_3:Set(slot_0_45_0.savedHC)
				end
			end

			if slot_0_18_0.forceShoot and slot_0_45_0.savedFS ~= nil then
				slot_132_1_2 = slot_0_18_0.forceShoot:GetValue()

				if slot_132_1_2 then
					slot_132_1_2:Set(slot_0_45_0.savedFS)
				end
			end

			if slot_0_18_0.ssgAutostopMode and slot_0_45_0.savedAutostop ~= nil then
				slot_132_1_1 = slot_0_18_0.ssgAutostopMode:GetValue()

				if slot_132_1_1 then
					slot_132_2_1 = slot_132_1_1:Get()

					if slot_132_2_1 then
						slot_132_2_1:SetRaw(slot_0_45_0.savedAutostop)
						slot_132_1_1:Set(slot_132_2_1)
					end
				end
			end

			slot_0_45_0.savedPS = nil
			slot_0_45_0.savedHC = nil
			slot_0_45_0.savedFS = nil
			slot_0_45_0.savedAutostop = nil
			slot_0_45_0.wasInAir = false
		end

		slot_0_45_0.active = false

		return
	end

	slot_132_1_0 = entities.GetLocalPawn()

	if not slot_132_1_0 or not slot_132_1_0:IsAlive() then
		slot_0_45_0.active = false
		slot_0_45_0.wasInAir = false
		slot_0_45_0.savedPS = nil
		slot_0_45_0.savedHC = nil
		slot_0_45_0.savedFS = nil
		slot_0_45_0.savedAutostop = nil

		return
	end

	slot_132_2_0 = slot_132_1_0:GetActiveWeapon()

	if not slot_132_2_0 then
		slot_0_45_0.active = false

		return
	end

	slot_132_3_0 = slot_132_2_0:ToWeaponBaseGun()

	if not slot_132_3_0 then
		slot_0_45_0.active = false

		return
	end

	if slot_132_3_0:GetDefIndex() ~= weapon_id.ssg08 then
		slot_0_45_0.active = false

		return
	end

	slot_132_4_0 = slot_132_1_0.m_fFlags and slot_132_1_0.m_fFlags:Get() or 0

	if not (bit.band(slot_132_4_0, 1) ~= 0) then
		slot_0_45_0.active = true

		if not slot_0_45_0.wasInAir then
			slot_0_45_0.wasInAir = true

			if slot_0_18_0.ssgPointscaleCtrl then
				slot_132_6_8 = slot_0_18_0.ssgPointscaleCtrl:GetValue()

				if slot_132_6_8 then
					slot_0_45_0.savedPS = slot_132_6_8:Get()
				end
			end

			if slot_0_18_0.ssgHitchance then
				slot_132_6_7 = slot_0_18_0.ssgHitchance:GetValue()

				if slot_132_6_7 then
					slot_0_45_0.savedHC = slot_132_6_7:Get()
				end
			end

			if slot_0_18_0.forceShoot then
				slot_132_6_6 = slot_0_18_0.forceShoot:GetValue()

				if slot_132_6_6 then
					slot_0_45_0.savedFS = slot_132_6_6:Get()
				end
			end

			if slot_0_18_0.ssgAutostopMode then
				slot_132_6_5 = slot_0_18_0.ssgAutostopMode:GetValue()

				if slot_132_6_5 then
					slot_132_7_2 = slot_132_6_5:Get()

					if slot_132_7_2 then
						slot_0_45_0.savedAutostop = slot_132_7_2:GetRaw()
					end
				end
			end
		end

		slot_132_6_4 = slot_0_116_0(arg_132_0)

		if slot_132_6_4 then
			slot_132_7_1 = slot_0_0_0.min(slot_132_6_4 / slot_0_45_0.ForceShootDist, 1)
			slot_132_8_4 = slot_0_0_0.floor(slot_0_45_0.MinHC + slot_132_7_1 * (slot_0_45_0.MaxHC - slot_0_45_0.MinHC))
			slot_132_9_1 = slot_0_0_0.floor(slot_0_45_0.MaxPS - slot_132_7_1 * (slot_0_45_0.MaxPS - slot_0_45_0.MinPS))
			slot_132_8_3 = slot_0_0_0.max(slot_0_45_0.MinHC, slot_0_0_0.min(slot_0_45_0.MaxHC, slot_132_8_4))
			slot_132_9_0 = slot_0_0_0.max(slot_0_45_0.MinPS, slot_0_0_0.min(slot_0_45_0.MaxPS, slot_132_9_1))
			slot_0_45_0.hitchance = slot_132_8_3
			slot_0_45_0.pointscale = slot_132_9_0

			if slot_0_18_0.ssgHitchance then
				slot_132_10_2 = slot_0_18_0.ssgHitchance:GetValue()

				if slot_132_10_2 then
					slot_132_10_2:Set(slot_132_8_3)
				end
			end

			if slot_0_18_0.ssgPointscaleCtrl then
				slot_132_10_1 = slot_0_18_0.ssgPointscaleCtrl:GetValue()

				if slot_132_10_1 then
					slot_132_10_1:Set(slot_132_9_0)
				end
			end

			slot_132_10_0 = slot_132_6_4 > slot_0_45_0.ForceShootDist or slot_132_8_3 >= 73
			slot_0_45_0.forceShoot = slot_132_10_0

			if slot_132_10_0 then
				slot_132_8_2 = 76
				slot_0_45_0.hitchance = slot_132_8_2

				if slot_0_18_0.ssgHitchance then
					slot_132_11_3 = slot_0_18_0.ssgHitchance:GetValue()

					if slot_132_11_3 then
						slot_132_11_3:Set(76)
					end
				end
			elseif slot_132_7_1 >= 0.75 then
				slot_132_11_2 = (slot_132_7_1 - 0.75) / 0.25
				slot_132_8_1 = slot_0_0_0.floor(65 + slot_132_11_2 * 4)
				slot_132_8_0 = slot_0_0_0.max(65, slot_0_0_0.min(69, slot_132_8_1))
				slot_0_45_0.hitchance = slot_132_8_0

				if slot_0_18_0.ssgHitchance then
					slot_132_12_1 = slot_0_18_0.ssgHitchance:GetValue()

					if slot_132_12_1 then
						slot_132_12_1:Set(slot_132_8_0)
					end
				end
			end

			if slot_0_18_0.forceShoot then
				slot_132_11_1 = slot_0_18_0.forceShoot:GetValue()

				if slot_132_11_1 then
					slot_132_11_1:Set(slot_132_10_0)
				end
			end

			if slot_0_18_0.ssgAutostopMode and slot_0_45_0.savedAutostop ~= nil then
				slot_132_11_0 = slot_0_18_0.ssgAutostopMode:GetValue()

				if slot_132_11_0 then
					slot_132_12_0 = slot_132_11_0:Get()

					if slot_132_12_0 then
						if slot_132_10_0 then
							slot_132_12_0:SetRaw(bit.bor(slot_0_45_0.savedAutostop, slot_0_45_0.fullStopBit))
						else
							slot_132_12_0:SetRaw(slot_0_45_0.savedAutostop)
						end

						slot_132_11_0:Set(slot_132_12_0)
					end
				end
			end
		end
	elseif slot_0_45_0.wasInAir then
		slot_0_45_0.wasInAir = false
		slot_0_45_0.active = false

		if slot_0_18_0.ssgPointscaleCtrl and slot_0_45_0.savedPS ~= nil then
			slot_132_6_3 = slot_0_18_0.ssgPointscaleCtrl:GetValue()

			if slot_132_6_3 then
				slot_132_6_3:Set(slot_0_45_0.savedPS)
			end
		end

		if slot_0_18_0.ssgHitchance and slot_0_45_0.savedHC ~= nil then
			slot_132_6_2 = slot_0_18_0.ssgHitchance:GetValue()

			if slot_132_6_2 then
				slot_132_6_2:Set(slot_0_45_0.savedHC)
			end
		end

		if slot_0_18_0.forceShoot and slot_0_45_0.savedFS ~= nil then
			slot_132_6_1 = slot_0_18_0.forceShoot:GetValue()

			if slot_132_6_1 then
				slot_132_6_1:Set(slot_0_45_0.savedFS)
			end
		end

		if slot_0_18_0.ssgAutostopMode and slot_0_45_0.savedAutostop ~= nil then
			slot_132_6_0 = slot_0_18_0.ssgAutostopMode:GetValue()

			if slot_132_6_0 then
				slot_132_7_0 = slot_132_6_0:Get()

				if slot_132_7_0 then
					slot_132_7_0:SetRaw(slot_0_45_0.savedAutostop)
					slot_132_6_0:Set(slot_132_7_0)
				end
			end
		end
	end
end)

slot_0_117_0 = 0

events.createMove:Add(function(arg_133_0)
	if not slot_0_26_0.slavebot then
		return
	end

	local var_133_0 = entities.GetLocalPawn()

	if not var_133_0 or not var_133_0:IsAlive() then
		return
	end

	local var_133_1 = var_133_0:GetAbsOrigin()

	if not var_133_1 then
		return
	end

	local var_133_2 = var_133_0.m_iTeamNum and var_133_0.m_iTeamNum:Get() or 0
	local var_133_3
	local var_133_4 = math.huge

	entities.players:ForEach(function(arg_134_0)
		if not arg_134_0 then
			return
		end

		local var_134_0 = arg_134_0.entity ~= nil and arg_134_0.entity or arg_134_0

		if not var_134_0 or var_134_0 == var_133_0 then
			return
		end

		if not var_134_0.IsAlive or not var_134_0:IsAlive() then
			return
		end

		local var_134_1 = var_134_0.m_iTeamNum and var_134_0.m_iTeamNum:Get() or 0

		if var_134_1 ~= var_133_2 or var_134_1 == 0 then
			return
		end

		local var_134_2 = var_134_0:GetAbsOrigin()

		if not var_134_2 then
			return
		end

		local var_134_3 = var_134_2.x - var_133_1.x
		local var_134_4 = var_134_2.y - var_133_1.y
		local var_134_5 = slot_0_0_0.sqrt(var_134_3 * var_134_3 + var_134_4 * var_134_4)

		if var_134_5 > 1 and var_134_5 < var_133_4 then
			var_133_4 = var_134_5
			var_133_3 = var_134_0
		end
	end)

	if not var_133_3 then
		return
	end

	local var_133_5 = var_133_3:GetAbsOrigin()

	if not var_133_5 then
		return
	end

	local var_133_6 = var_133_3.m_fFlags and var_133_3.m_fFlags:Get() or 0
	local var_133_7 = var_133_0.m_fFlags and var_133_0.m_fFlags:Get() or 0
	local var_133_8 = bit.band(var_133_6, 1) == 0
	local var_133_9 = bit.band(var_133_7, 1) ~= 0
	local var_133_10 = bit.band(var_133_6, 2) ~= 0
	local var_133_11 = game.globalVars.m_flRealTime or 0

	if var_133_8 and var_133_9 and var_133_11 - slot_0_117_0 > 0.3 then
		arg_133_0:SetButton(InputBitMask_t.IN_JUMP)

		if var_133_10 then
			arg_133_0:SetButton(InputBitMask_t.IN_DUCK)
		end

		slot_0_117_0 = var_133_11
	end

	if var_133_10 and not var_133_8 then
		arg_133_0:SetButton(InputBitMask_t.IN_DUCK)
	end

	local var_133_12 = var_133_5.x - var_133_1.x
	local var_133_13 = var_133_5.y - var_133_1.y
	local var_133_14 = slot_0_0_0.sqrt(var_133_12 * var_133_12 + var_133_13 * var_133_13)

	if var_133_14 > 10 then
		local var_133_15 = var_133_12 / var_133_14
		local var_133_16 = var_133_13 / var_133_14
		local var_133_17 = slot_0_0_0.rad(arg_133_0:GetViewangles().y)
		local var_133_18 = slot_0_0_0.cos(var_133_17)
		local var_133_19 = slot_0_0_0.sin(var_133_17)
		local var_133_20 = var_133_15 * var_133_18 + var_133_16 * var_133_19
		local var_133_21 = -var_133_15 * var_133_19 + var_133_16 * var_133_18

		arg_133_0:SetForwardMove(slot_0_0_0.max(-1, slot_0_0_0.min(1, var_133_20)))
		arg_133_0:SetLeftMove(slot_0_0_0.max(-1, slot_0_0_0.min(1, var_133_21)))

		local var_133_22 = var_133_0:GetActiveWeapon()

		if var_133_22 then
			local var_133_23 = var_133_22:ToWeaponBaseGun()
			local var_133_24 = var_133_23 and var_133_23:GetDefIndex() or 0
			local var_133_25 = var_133_24 == 9 or var_133_24 == 40 or var_133_24 == 38 or var_133_24 == 11

			if weapon_id then
				var_133_25 = var_133_25 or var_133_24 == weapon_id.awp or var_133_24 == weapon_id.ssg08 or var_133_24 == weapon_id.scar20 or var_133_24 == weapon_id.g3sg1
			end

			if var_133_25 and (var_133_22.m_zoomLevel and var_133_22.m_zoomLevel:Get() or 0) == 0 then
				arg_133_0:SetButton(InputBitMask_t.IN_ATTACK2)
			end
		end
	else
		arg_133_0:SetForwardMove(0)
		arg_133_0:SetLeftMove(0)
	end
end)

slot_0_118_1 = nil
slot_0_119_1 = 0.25
slot_0_120_1 = 0.05
slot_0_121_1 = 0.03
slot_0_122_1 = 25
slot_0_123_1 = draw.shader(("cbuffer cb : register(b0) { float4x4 mvp; float2 tex; float time; float alpha; };\nstruct PS_INPUT { float4 pos : SV_POSITION; float4 col : COLOR0; float2 uv : TEXCOORD0; };\nfloat4 main(PS_INPUT inp) : SV_Target {\n    float2 c = float2(0.5, 0.5), d = inp.uv - c;\n    float dist = length(d), ang = degrees(atan2(d.y, d.x));\n    if (ang < 0) ang += 360.0;\n    float radius = %0.3f, thickness = %0.3f;\n    float inner = radius - thickness * 0.5, outer = radius + thickness * 0.5;\n    float ring = smoothstep(inner - 0.01, inner, dist) * (1.0 - smoothstep(outer, outer + 0.01, dist));\n    float inAngle = step(0.0, ang) * step(ang, 180.0);\n    return float4(inp.col.rgb, inp.col.a * inAngle * ring);\n}"):format(slot_0_119_1, slot_0_120_1))

slot_0_123_1:create()

slot_0_124_1 = {}
slot_0_125_1 = "cbuffer cb : register(b0) { float4x4 mvp; float2 tex; float time; float alpha; };\nstruct PS_INPUT { float4 pos : SV_POSITION; float4 col : COLOR0; float2 uv : TEXCOORD0; };\nfloat4 main(PS_INPUT inp) : SV_Target {\n    float2 c = float2(0.5, 0.5), d = inp.uv - c;\n    float dist = length(d), ang = degrees(atan2(d.y, d.x));\n    if (ang < 0) ang += 360.0;\n    float radius = %0.3f, thickness = %0.3f;\n    float inner = radius - thickness * 0.5, outer = radius + thickness * 0.5;\n    float ring = smoothstep(inner - 0.01, inner, dist) * (1.0 - smoothstep(outer, outer + 0.01, dist));\n    float inAngle = step(%0.3f, ang) * step(ang, %0.3f);\n    return float4(inp.col.rgb, inp.col.a * inAngle * ring);\n}"

function slot_0_126_1(arg_135_0, arg_135_1)
	local var_135_0 = arg_135_0 .. "_" .. arg_135_1

	if not slot_0_124_1[var_135_0] then
		local var_135_1 = draw.shader(slot_0_125_1:format(slot_0_119_1, slot_0_121_1, arg_135_0, arg_135_1))

		var_135_1:create()

		slot_0_124_1[var_135_0] = var_135_1
	end

	return slot_0_124_1[var_135_0]
end

slot_0_127_1 = 0
slot_0_128_1 = 0
slot_0_129_1 = 0
slot_0_130_1 = 0
slot_0_131_1 = 0

function slot_0_132_1()
	if slot_0_18_0.aaLeft and slot_0_18_0.aaLeft:Get() then
		return -1
	end

	if slot_0_18_0.aaRight and slot_0_18_0.aaRight:Get() then
		return 1
	end

	return 0
end

function slot_0_118_0()
	if not slot_0_26_0.aa then
		return
	end

	if not slot_0_22_0(slot_0_18_0.aaEnable) then
		return
	end

	local var_137_0 = entities.GetLocalPawn()

	if not var_137_0 or not var_137_0:IsAlive() then
		return
	end

	local var_137_1 = draw.surface
	local var_137_2, var_137_3 = game.engine:GetScreenSize()
	local var_137_4 = draw.Rect(var_137_2 / 2 - 60, var_137_3 / 2 - 60, var_137_2 / 2 + 60, var_137_3 / 2 + 60)
	local var_137_5 = slot_0_132_1()

	slot_0_129_1 = var_137_5 * -90

	local var_137_6 = game.globalVars.m_flRealTime or 0

	slot_0_130_1 = var_137_5 ~= 0 and 255 or var_137_6 - slot_0_131_1 > 0.8 and 0 or slot_0_130_1

	if var_137_5 ~= 0 then
		slot_0_131_1 = var_137_6
	end

	local var_137_7 = game.globalVars.m_flFrameTime or 0.015
	local var_137_8 = slot_0_0_0.min(1, 14 * var_137_7)

	slot_0_127_1 = slot_0_127_1 + (slot_0_129_1 - slot_0_127_1) * var_137_8
	slot_0_128_1 = slot_0_128_1 + (slot_0_130_1 - slot_0_128_1) * var_137_8

	if slot_0_128_1 < 5 then
		return
	end

	local var_137_9 = slot_0_128_1 / 255
	local var_137_10 = draw.Color(10, 10, 10, slot_0_0_0.floor(120 * var_137_9))
	local var_137_11 = slot_0_37_0.grad1
	local var_137_12 = 90 + slot_0_127_1
	local var_137_13 = slot_0_0_0.floor(var_137_12 - slot_0_122_1 + 0.5)
	local var_137_14 = slot_0_0_0.floor(var_137_12 + slot_0_122_1 + 0.5)

	if var_137_13 < 2 then
		var_137_14 = var_137_14 + (2 - var_137_13)
		var_137_13 = 2
	end

	if var_137_14 > 178 then
		var_137_13 = var_137_13 - (var_137_14 - 178)
		var_137_14 = 178
	end

	local var_137_15 = slot_0_126_1(var_137_13, var_137_14)
	local var_137_16 = var_137_1.g

	var_137_16:SetShader(slot_0_123_1)
	var_137_1:AddRectFilled(var_137_4, var_137_10)
	var_137_16:SetShader(nil)

	if var_137_15 then
		var_137_16:SetShader(var_137_15)
		var_137_1:AddRectFilled(var_137_4, var_137_11)
		var_137_16:SetShader(nil)
	end
end

slot_0_30_0.list = {}
slot_0_30_0.max = 22
slot_0_119_0 = draw.shader("cbuffer cb : register(b0) { float4x4 mvp; float2 tex; float time; float alpha; };\nstruct PS_INPUT { float4 pos : SV_POSITION; float4 col : COLOR0; float2 uv : TEXCOORD0; };\nfloat4 main(PS_INPUT inp) : SV_Target {\n    float2 c = float2(0.5, 0.5);\n    float dist = length(inp.uv - c) * 2.0;\n    float glow = 1.0 - smoothstep(0.0, 1.0, dist);\n    glow = glow * glow;\n    return float4(inp.col.rgb, inp.col.a * glow);\n}")

slot_0_119_0:create()

slot_0_120_0 = draw.Color(slot_0_0_0.floor(slot_0_30_0.r * 0.4), slot_0_0_0.floor(slot_0_30_0.g * 0.4), slot_0_0_0.floor(slot_0_30_0.b * 0.4), 255)
slot_0_121_0 = draw.Color(slot_0_0_0.floor(slot_0_30_0.r * 0.65), slot_0_0_0.floor(slot_0_30_0.g * 0.65), slot_0_0_0.floor(slot_0_30_0.b * 0.65), 255)
slot_0_122_0 = draw.Color(slot_0_30_0.r, slot_0_30_0.g, slot_0_30_0.b, 50)

function slot_0_30_0.queue(arg_138_0, arg_138_1, arg_138_2, arg_138_3, arg_138_4)
	slot_138_5_0 = game.globalVars.m_flRealTime or 0
	slot_138_6_0 = arg_138_3 or 6

	if slot_138_6_0 > 8 then
		slot_138_6_0 = 8
	end

	slot_0_30_0.r = slot_0_37_0.grad1r
	slot_0_30_0.g = slot_0_37_0.grad1g
	slot_0_30_0.b = slot_0_37_0.grad1b

	if slot_0_54_0.sparkleCol then
		slot_138_7_1 = slot_0_54_0.sparkleCol:Get()

		if slot_138_7_1 and slot_138_7_1.GetR then
			slot_0_30_0.r = slot_138_7_1:GetR()
			slot_0_30_0.g = slot_138_7_1:GetG()
			slot_0_30_0.b = slot_138_7_1:GetB()
		end
	end

	slot_0_120_0 = draw.Color(slot_0_0_0.floor(slot_0_30_0.r * 0.4), slot_0_0_0.floor(slot_0_30_0.g * 0.4), slot_0_0_0.floor(slot_0_30_0.b * 0.4), 255)
	slot_0_121_0 = draw.Color(slot_0_0_0.floor(slot_0_30_0.r * 0.65), slot_0_0_0.floor(slot_0_30_0.g * 0.65), slot_0_0_0.floor(slot_0_30_0.b * 0.65), 255)
	slot_0_122_0 = draw.Color(slot_0_30_0.r, slot_0_30_0.g, slot_0_30_0.b, 50)
	slot_138_7_0 = 0
	slot_138_8_0 = 0
	slot_138_9_0 = 1

	if arg_138_4 then
		slot_138_10_1 = arg_138_4.x - arg_138_0
		slot_138_11_1 = arg_138_4.y - arg_138_1
		slot_138_12_1 = arg_138_4.z - arg_138_2
		slot_138_13_1 = slot_0_0_0.sqrt(slot_138_10_1 * slot_138_10_1 + slot_138_11_1 * slot_138_11_1 + slot_138_12_1 * slot_138_12_1)

		if slot_138_13_1 > 0.001 then
			slot_138_7_0 = slot_138_10_1 / slot_138_13_1
			slot_138_8_0 = slot_138_11_1 / slot_138_13_1
			slot_138_9_0 = slot_138_12_1 / slot_138_13_1
		end
	end

	slot_138_10_0 = slot_138_8_0 * 1 - slot_138_9_0 * 0
	slot_138_11_0 = slot_138_9_0 * 0 - slot_138_7_0 * 1
	slot_138_12_0 = slot_138_7_0 * 0 - slot_138_8_0 * 0
	slot_138_13_0 = slot_0_0_0.sqrt(slot_138_10_0 * slot_138_10_0 + slot_138_11_0 * slot_138_11_0 + slot_138_12_0 * slot_138_12_0)

	if slot_138_13_0 < 0.001 then
		slot_138_10_0 = 1
		slot_138_11_0 = 0
		slot_138_12_0 = 0
	else
		slot_138_10_0 = slot_138_10_0 / slot_138_13_0
		slot_138_11_0 = slot_138_11_0 / slot_138_13_0
		slot_138_12_0 = slot_138_12_0 / slot_138_13_0
	end

	slot_138_14_0 = slot_138_11_0 * slot_138_9_0 - slot_138_12_0 * slot_138_8_0
	slot_138_15_0 = slot_138_12_0 * slot_138_7_0 - slot_138_10_0 * slot_138_9_0
	slot_138_16_0 = slot_138_10_0 * slot_138_8_0 - slot_138_11_0 * slot_138_7_0

	for iter_138_0 = 1, slot_138_6_0 do
		slot_138_21_0 = math.random() * 6.283
		slot_138_22_0 = (math.random() - 0.5) * 2
		slot_138_23_0 = 60 + math.random() * 140
		slot_138_24_0 = slot_0_0_0.cos(slot_138_22_0)
		slot_138_25_0 = 10 + slot_0_0_0.floor(math.random() * 6)

		if #slot_0_30_0.list >= slot_0_30_0.max then
			table.remove(slot_0_30_0.list, 1)
		end

		table.insert(slot_0_30_0.list, {
			[0] = nil,
			wx = arg_138_0 + (math.random() - 0.5) * 6,
			wy = arg_138_1 + (math.random() - 0.5) * 6,
			wz = arg_138_2 + (math.random() - 0.5) * 6,
			vx = slot_0_0_0.cos(slot_138_21_0) * slot_138_24_0 * slot_138_23_0,
			vy = slot_0_0_0.sin(slot_138_21_0) * slot_138_24_0 * slot_138_23_0,
			vz = slot_0_0_0.sin(slot_138_22_0) * slot_138_23_0 + 90,
			sz = slot_138_25_0,
			born = slot_138_5_0,
			life = 0.4 + math.random() * 0.5,
			spin = math.random() * 6.283,
			spinSpd = (4 + math.random() * 7) * (math.random() < 0.5 and -1 or 1),
			bRx = slot_138_10_0,
			bRy = slot_138_11_0,
			bRz = slot_138_12_0,
			bUx = slot_138_14_0,
			bUy = slot_138_15_0,
			bUz = slot_138_16_0
		})
	end
end

function slot_0_52_0()
	return
end

function slot_0_123_0()
	if not slot_0_29_0.sparkle then
		slot_0_30_0.list = {}

		return
	end

	slot_140_0_0 = #slot_0_30_0.list

	if slot_140_0_0 == 0 then
		return
	end

	slot_140_1_0 = game.globalVars.m_flRealTime or 0
	slot_140_2_0 = game.globalVars.m_flFrameTime or 0.015
	slot_140_3_0 = draw.surface
	slot_140_4_0 = {}
	slot_140_5_0 = slot_0_30_0.r
	slot_140_6_0 = slot_0_30_0.g
	slot_140_7_0 = slot_0_30_0.b

	for iter_140_0 = 1, slot_140_0_0 do
		slot_140_12_0 = slot_0_30_0.list[iter_140_0]
		slot_140_13_0 = slot_140_1_0 - slot_140_12_0.born

		if slot_140_13_0 >= slot_140_12_0.life then
			-- block empty
		else
			slot_140_12_0.wx = slot_140_12_0.wx + slot_140_12_0.vx * slot_140_2_0
			slot_140_12_0.wy = slot_140_12_0.wy + slot_140_12_0.vy * slot_140_2_0
			slot_140_12_0.wz = slot_140_12_0.wz + slot_140_12_0.vz * slot_140_2_0
			slot_140_12_0.vz = slot_140_12_0.vz - 350 * slot_140_2_0
			slot_140_12_0.vx = slot_140_12_0.vx * (1 - 1.8 * slot_140_2_0)
			slot_140_12_0.vy = slot_140_12_0.vy * (1 - 1.8 * slot_140_2_0)
			slot_140_12_0.spin = slot_140_12_0.spin + slot_140_12_0.spinSpd * slot_140_2_0

			if not slot_140_12_0.spin2 then
				slot_140_12_0.spin2 = math.random() * 6.283
			end

			slot_140_12_0.spin2 = slot_140_12_0.spin2 + slot_140_12_0.spinSpd * 0.7 * slot_140_2_0
			slot_140_14_0 = 1 - slot_140_13_0 / slot_140_12_0.life
			slot_140_15_0 = slot_0_0_0.floor(255 * slot_140_14_0)

			if slot_140_15_0 > 10 then
				slot_140_16_0 = slot_0_0_0.max(1.5, slot_140_12_0.sz * 0.22 * slot_140_14_0)
				slot_140_17_0 = slot_0_0_0.sin(slot_140_12_0.spin)
				slot_140_18_0 = slot_0_0_0.cos(slot_140_12_0.spin)
				slot_140_19_0 = slot_0_0_0.sin(slot_140_12_0.spin2)
				slot_140_20_0 = slot_0_0_0.cos(slot_140_12_0.spin2)
				slot_140_21_0 = slot_140_18_0 * 1
				slot_140_22_0 = -slot_140_17_0 * slot_140_20_0
				slot_140_23_0 = slot_140_17_0 * slot_140_19_0
				slot_140_24_0 = slot_140_17_0 * 1
				slot_140_25_0 = slot_140_18_0 * slot_140_20_0
				slot_140_26_0 = -slot_140_18_0 * slot_140_19_0
				slot_140_27_0 = 0
				slot_140_28_0 = slot_140_19_0
				slot_140_29_0 = slot_140_20_0
				slot_140_30_0 = {
					{
						-slot_140_16_0,
						-slot_140_16_0,
						-slot_140_16_0
					},
					{
						slot_140_16_0,
						-slot_140_16_0,
						-slot_140_16_0
					},
					{
						slot_140_16_0,
						slot_140_16_0,
						-slot_140_16_0
					},
					{
						-slot_140_16_0,
						slot_140_16_0,
						-slot_140_16_0
					},
					{
						-slot_140_16_0,
						-slot_140_16_0,
						slot_140_16_0
					},
					{
						slot_140_16_0,
						-slot_140_16_0,
						slot_140_16_0
					},
					{
						slot_140_16_0,
						slot_140_16_0,
						slot_140_16_0
					},
					{
						-slot_140_16_0,
						slot_140_16_0,
						slot_140_16_0
					}
				}
				slot_140_31_0 = {}
				slot_140_32_0 = true

				for iter_140_1 = 1, 8 do
					slot_140_37_1 = slot_140_30_0[iter_140_1][1]
					slot_140_38_3 = slot_140_30_0[iter_140_1][2]
					slot_140_39_3 = slot_140_30_0[iter_140_1][3]
					slot_140_40_3 = slot_140_12_0.wx + slot_140_21_0 * slot_140_37_1 + slot_140_22_0 * slot_140_38_3 + slot_140_23_0 * slot_140_39_3
					slot_140_41_1 = slot_140_12_0.wy + slot_140_24_0 * slot_140_37_1 + slot_140_25_0 * slot_140_38_3 + slot_140_26_0 * slot_140_39_3
					slot_140_42_1 = slot_140_12_0.wz + slot_140_27_0 * slot_140_37_1 + slot_140_28_0 * slot_140_38_3 + slot_140_29_0 * slot_140_39_3
					slot_140_43_0 = math.WorldToScreen(Vector(slot_140_40_3, slot_140_41_1, slot_140_42_1))

					if slot_140_43_0 then
						slot_140_31_0[iter_140_1] = slot_140_43_0
					else
						slot_140_32_0 = false
					end
				end

				if slot_140_32_0 then
					slot_140_33_0 = {
						{
							5,
							6,
							7,
							8,
							1,
							[0] = nil
						},
						{
							1,
							2,
							3,
							4,
							0.35,
							[0] = nil
						},
						{
							1,
							2,
							6,
							5,
							0.55,
							[0] = nil
						},
						{
							3,
							4,
							8,
							7,
							0.55,
							[0] = nil
						},
						{
							2,
							3,
							7,
							6,
							0.7,
							[0] = nil
						},
						{
							1,
							4,
							8,
							5,
							0.4,
							[0] = nil
						}
					}
					slot_140_34_0 = {}

					for iter_140_2 = 1, 6 do
						slot_140_39_2 = slot_140_33_0[iter_140_2]
						slot_140_40_2 = 0

						for iter_140_3 = 1, 4 do
							slot_140_45_1 = slot_140_30_0[slot_140_39_2[iter_140_3]]
							slot_140_40_2 = slot_140_40_2 + (slot_140_12_0.wz + slot_140_27_0 * slot_140_45_1[1] + slot_140_28_0 * slot_140_45_1[2] + slot_140_29_0 * slot_140_45_1[3])
						end

						slot_140_34_0[iter_140_2] = slot_140_40_2 * 0.25
					end

					for iter_140_4 = 1, 6 do
						slot_140_39_1 = slot_140_33_0[iter_140_4]
						slot_140_40_1 = slot_140_31_0[slot_140_39_1[1]]
						slot_140_41_0 = slot_140_31_0[slot_140_39_1[2]]
						slot_140_42_0 = slot_140_31_0[slot_140_39_1[3]]

						if (slot_140_41_0.x - slot_140_40_1.x) * (slot_140_42_0.y - slot_140_40_1.y) - (slot_140_41_0.y - slot_140_40_1.y) * (slot_140_42_0.x - slot_140_40_1.x) > 0 then
							slot_140_44_0 = slot_140_39_1[5]
							slot_140_45_0 = slot_0_0_0.floor(slot_140_5_0 * slot_140_44_0)
							slot_140_46_0 = slot_0_0_0.floor(slot_140_6_0 * slot_140_44_0)
							slot_140_47_0 = slot_0_0_0.floor(slot_140_7_0 * slot_140_44_0)
							slot_140_48_0 = draw.Color(slot_140_45_0, slot_140_46_0, slot_140_47_0, slot_140_15_0)
							slot_140_49_0 = slot_140_31_0[slot_140_39_1[1]]
							slot_140_50_0 = slot_140_31_0[slot_140_39_1[2]]
							slot_140_51_0 = slot_140_31_0[slot_140_39_1[3]]
							slot_140_52_0 = slot_140_31_0[slot_140_39_1[4]]

							slot_140_3_0:AddTriangleFilled(draw.Vec2(slot_140_49_0.x, slot_140_49_0.y), draw.Vec2(slot_140_50_0.x, slot_140_50_0.y), draw.Vec2(slot_140_51_0.x, slot_140_51_0.y), slot_140_48_0)
							slot_140_3_0:AddTriangleFilled(draw.Vec2(slot_140_49_0.x, slot_140_49_0.y), draw.Vec2(slot_140_51_0.x, slot_140_51_0.y), draw.Vec2(slot_140_52_0.x, slot_140_52_0.y), slot_140_48_0)
						end
					end

					slot_140_35_0 = slot_0_0_0.floor(slot_140_15_0 * 0.45)

					if slot_140_35_0 > 3 then
						slot_140_36_0 = (slot_140_31_0[1].x + slot_140_31_0[7].x) * 0.5
						slot_140_37_0 = (slot_140_31_0[1].y + slot_140_31_0[7].y) * 0.5
						slot_140_38_0 = slot_140_16_0 * 3.2
						slot_140_39_0 = draw.Color(slot_140_5_0, slot_140_6_0, slot_140_7_0, slot_140_35_0)
						slot_140_40_0 = slot_140_3_0.g

						slot_140_40_0:SetShader(slot_0_119_0)
						slot_140_3_0:AddRectFilled(draw.Rect(slot_140_36_0 - slot_140_38_0, slot_140_37_0 - slot_140_38_0, slot_140_36_0 + slot_140_38_0, slot_140_37_0 + slot_140_38_0), slot_140_39_0)
						slot_140_40_0:SetShader(nil)
					end
				end
			end

			slot_140_4_0[#slot_140_4_0 + 1] = slot_140_12_0
		end
	end

	slot_0_30_0.list = slot_140_4_0
end

slot_0_124_0 = {
	phase = 0,
	startTime = 0,
	cursed = false,
	active = false,
	[0] = nil
}
slot_0_125_0 = {
	startTime = 0,
	duration = 25000,
	phase = 0,
	savedSky = nil,
	active = false
}
slot_0_126_0 = {
	phase = 0
}

function slot_0_127_0()
	if not slot_0_29_0.lowHpWarn then
		return
	end

	if slot_0_124_0.active or slot_0_125_0.active then
		return
	end

	local var_141_0 = entities.GetLocalPawn()

	if not var_141_0 or not var_141_0:IsAlive() then
		slot_0_126_0.phase = 0

		return
	end

	local var_141_1 = var_141_0.m_iHealth and var_141_0.m_iHealth:Get() or 100

	if var_141_1 >= 40 or var_141_1 <= 0 then
		slot_0_126_0.phase = 0

		return
	end

	local var_141_2 = game.globalVars.m_flFrameTime or 0.015

	slot_0_126_0.phase = slot_0_126_0.phase + var_141_2 * 4

	if slot_0_126_0.phase > 6.283 then
		slot_0_126_0.phase = slot_0_126_0.phase - 6.283
	end

	local var_141_3 = var_141_1 / 40
	local var_141_4 = slot_0_0_0.floor((1 - var_141_3) * 180) + 40
	local var_141_5 = slot_0_0_0.sin(slot_0_126_0.phase)
	local var_141_6 = slot_0_0_0.floor(var_141_4 * (0.5 + 0.5 * var_141_5))

	if var_141_6 < 5 then
		return
	end

	local var_141_7, var_141_8 = game.engine:GetScreenSize()
	local var_141_9 = draw.surface
	local var_141_10 = slot_0_0_0.floor(var_141_7 * 0.08)

	for iter_141_0 = 0, var_141_10 - 1 do
		local var_141_11 = slot_0_0_0.floor(var_141_6 * (1 - iter_141_0 / var_141_10))

		if var_141_11 > 0 then
			var_141_9:AddRectFilled(draw.Rect(0, iter_141_0, var_141_7, iter_141_0 + 1), draw.Color(180, 0, 0, var_141_11))
		end
	end

	for iter_141_1 = 0, var_141_10 - 1 do
		local var_141_12 = slot_0_0_0.floor(var_141_6 * (1 - iter_141_1 / var_141_10))

		if var_141_12 > 0 then
			var_141_9:AddRectFilled(draw.Rect(0, var_141_8 - 1 - iter_141_1, var_141_7, var_141_8 - iter_141_1), draw.Color(180, 0, 0, var_141_12))
		end
	end

	for iter_141_2 = 0, var_141_10 - 1 do
		local var_141_13 = slot_0_0_0.floor(var_141_6 * (1 - iter_141_2 / var_141_10))

		if var_141_13 > 0 then
			var_141_9:AddRectFilled(draw.Rect(iter_141_2, 0, iter_141_2 + 1, var_141_8), draw.Color(180, 0, 0, var_141_13))
		end
	end

	for iter_141_3 = 0, var_141_10 - 1 do
		local var_141_14 = slot_0_0_0.floor(var_141_6 * (1 - iter_141_3 / var_141_10))

		if var_141_14 > 0 then
			var_141_9:AddRectFilled(draw.Rect(var_141_7 - 1 - iter_141_3, 0, var_141_7 - iter_141_3, var_141_8), draw.Color(180, 0, 0, var_141_14))
		end
	end
end

function slotGenerateResult()
	local var_142_0 = math.random(1, 100)
	local var_142_1 = slot_0_125_0.active and 15 or 7

	if var_142_0 <= var_142_1 then
		return {
			7,
			7,
			7,
			[0] = nil
		}
	elseif var_142_0 <= var_142_1 + 5 then
		return {
			6,
			6,
			6,
			[0] = nil
		}
	elseif var_142_0 <= var_142_1 + 7 then
		return {
			7,
			7,
			6,
			[0] = nil
		}
	else
		local var_142_2 = math.random(1, 9)
		local var_142_3 = math.random(1, 9)
		local var_142_4 = math.random(1, 9)

		if var_142_2 == 7 and var_142_3 == 7 and var_142_4 == 7 then
			var_142_4 = math.random(1, 5)
		end

		if var_142_2 == 6 and var_142_3 == 6 and var_142_4 == 6 then
			var_142_4 = math.random(1, 5)
		end

		if var_142_2 == 7 and var_142_3 == 7 and var_142_4 == 6 then
			var_142_4 = math.random(1, 5)
		end

		return {
			var_142_2,
			var_142_3,
			var_142_4
		}
	end
end

if slot_0_54_0.slotSpin then
	slot_0_54_0.slotSpin:AddCallback(function()
		if slot_0_28_0.spinning then
			return
		end

		slot_0_28_0.spinning = true
		slot_0_28_0.spinStart = game.globalVars.m_flRealTime or 0
		slot_0_28_0.result = slotGenerateResult()
		slot_0_28_0.lastWin = false
	end)
end

function slot_0_128_0()
	if not slot_0_29_0.slotsEnabled then
		return
	end

	slot_144_0_0 = draw.surface
	slot_144_1_0, slot_144_2_0 = game.engine:GetScreenSize()
	slot_144_3_0 = game.globalVars.m_flRealTime or 0
	slot_144_4_0 = 156
	slot_144_5_0 = 36
	slot_144_6_0 = 7
	slot_144_7_0 = slot_144_5_0 * 3 + slot_144_6_0 * 2
	slot_144_8_0 = 42
	slot_144_9_0 = slot_144_8_0 + 12

	if not slot_0_34_0.x then
		slot_0_34_0.x = slot_0_0_0.floor(slot_144_1_0 / 2 - slot_144_4_0 / 2)
	end

	if not slot_0_34_0.y then
		slot_0_34_0.y = slot_0_0_0.floor(slot_144_2_0 / 2 - slot_144_9_0 / 2) + 40
	end

	slot_144_10_0 = slot_0_34_0.x
	slot_144_11_0 = slot_0_34_0.y
	slot_0_34_0.lastW = slot_144_4_0
	slot_0_34_0.lastH = slot_144_9_0

	slot_144_0_0:AddRectFilledRounded(draw.Rect(slot_144_10_0, slot_144_11_0, slot_144_10_0 + slot_144_4_0, slot_144_11_0 + slot_144_9_0), draw.Color(12, 12, 12, 240), 6, draw.Rounding.ALL)

	slot_144_0_0.font = draw.fonts.gui_title or draw.fonts.gui_main
	slot_144_12_0 = slot_144_11_0 + 6
	slot_144_13_0 = slot_144_10_0 + slot_0_0_0.floor((slot_144_4_0 - slot_144_7_0) / 2)

	for iter_144_0 = 1, 3 do
		slot_144_18_1 = slot_144_13_0 + (iter_144_0 - 1) * (slot_144_5_0 + slot_144_6_0)
		slot_144_19_1 = slot_144_12_0

		slot_144_0_0:AddRectFilledRounded(draw.Rect(slot_144_18_1, slot_144_19_1, slot_144_18_1 + slot_144_5_0, slot_144_19_1 + slot_144_8_0), draw.Color(5, 5, 5, 255), 4, draw.Rounding.ALL)

		slot_144_20_0 = nil

		if slot_0_28_0.spinning then
			slot_144_21_1 = slot_144_3_0 - slot_0_28_0.spinStart

			if slot_144_21_1 >= slot_0_28_0.spinDuration[iter_144_0] then
				slot_144_20_0 = tostring(slot_0_28_0.result[iter_144_0])
				slot_0_28_0.reels[iter_144_0] = slot_0_28_0.result[iter_144_0]
			else
				slot_144_22_1 = 4 + iter_144_0 * 2
				slot_144_23_1 = slot_0_0_0.floor(slot_144_21_1 * slot_144_22_1 * 10)
				slot_144_20_0 = tostring(slot_144_23_1 % 9 + 1)
			end
		else
			slot_144_20_0 = tostring(slot_0_28_0.reels[iter_144_0])

			if slot_144_20_0 == "0" then
				slot_144_20_0 = "-"
			end
		end

		slot_144_21_0 = 8
		slot_144_22_0 = slot_144_18_1 + slot_0_0_0.floor((slot_144_5_0 - slot_144_21_0) / 2)
		slot_144_23_0 = slot_144_19_1 + 8
		slot_144_24_0 = nil
		slot_144_25_0 = slot_0_28_0.result[1] == 6 and slot_0_28_0.result[2] == 6 and slot_0_28_0.result[3] == 6

		if slot_144_20_0 == "7" then
			slot_144_24_0 = draw.Color(87, 246, 126, 255)
		elseif slot_144_20_0 == "6" and slot_144_25_0 and not slot_0_28_0.spinning then
			slot_144_24_0 = draw.Color(120, 0, 0, 255)
		else
			slot_144_24_0 = draw.Color(255, 255, 255, 255)
		end

		slot_144_0_0:AddText(draw.Vec2(slot_144_22_0, slot_144_23_0), slot_144_20_0, slot_144_24_0)
	end

	if slot_0_28_0.spinning and slot_144_3_0 - slot_0_28_0.spinStart >= slot_0_28_0.spinDuration[3] then
		slot_0_28_0.spinning = false
		slot_0_28_0.stopTime = slot_144_3_0
		slot_144_15_0 = slot_0_28_0.result
		slot_144_16_0 = slot_144_15_0[1] == 7 and slot_144_15_0[2] == 7 and slot_144_15_0[3] == 7
		slot_144_17_0 = slot_144_15_0[1] == 6 and slot_144_15_0[2] == 6 and slot_144_15_0[3] == 6
		slot_144_18_0 = slot_144_15_0[1] == 7 and slot_144_15_0[2] == 7 and slot_144_15_0[3] == 6
		slot_0_28_0.lastWin = slot_144_16_0

		if slot_144_17_0 then
			if not slot_0_125_0.active and not slot_0_124_0.active then
				slot_0_125_0.active = true
				slot_0_125_0.startTime = slot_144_3_0
				slot_0_125_0.phase = 0

				if slot_0_18_0.skyColor then
					slot_0_125_0.savedSky = slot_0_18_0.skyColor:Get()
					slot_144_19_0 = slot_0_18_0.skyColor:GetValue()

					if slot_144_19_0 then
						slot_144_19_0:Set(draw.Color(54, 0, 0, 200))
					end
				end
			end
		elseif slot_144_16_0 then
			slot_0_28_0.winTime = slot_144_3_0

			if slot_0_125_0.active then
				slot_0_124_0.active = true
				slot_0_124_0.startTime = slot_144_3_0
				slot_0_124_0.phase = 0
				slot_0_124_0.cursed = true
			elseif not slot_0_124_0.active then
				slot_0_124_0.active = true
				slot_0_124_0.startTime = slot_144_3_0
				slot_0_124_0.phase = 0
				slot_0_124_0.cursed = false
			end
		end
	end

	if not slot_0_28_0.spinning and slot_0_28_0.stopTime and slot_0_28_0.reels[1] ~= 0 and slot_144_3_0 - slot_0_28_0.stopTime >= 5 then
		slot_0_28_0.reels = {
			0,
			0,
			0,
			[0] = nil
		}
		slot_0_28_0.stopTime = nil
	end
end

function slot_0_129_0()
	if not slot_0_124_0.active then
		return
	end

	slot_145_0_0 = game.globalVars.m_flRealTime or 0
	slot_145_1_0 = 45000

	if slot_0_124_0.cursed and slot_0_125_0.active then
		slot_145_2_1 = slot_0_125_0.duration - (slot_145_0_0 - slot_0_125_0.startTime) * 1000

		if slot_145_2_1 <= 0 then
			slot_0_124_0.active = false
			slot_0_124_0.phase = 0
			slot_0_124_0.cursed = false

			return
		end

		slot_145_1_0 = slot_145_2_1 + (slot_145_0_0 - slot_0_124_0.startTime) * 1000
	end

	slot_145_2_0 = (slot_145_0_0 - slot_0_124_0.startTime) * 1000

	if slot_145_1_0 <= slot_145_2_0 then
		slot_0_124_0.active = false
		slot_0_124_0.phase = 0
		slot_0_124_0.cursed = false

		return
	end

	slot_145_3_0 = game.globalVars.m_flFrameTime or 0.015
	slot_145_4_0 = slot_145_1_0 - slot_145_2_0
	slot_145_5_0 = 3

	if slot_145_4_0 < 5000 then
		slot_145_5_0 = 8
	end

	slot_0_124_0.phase = slot_0_124_0.phase + slot_145_3_0 * slot_145_5_0

	if slot_0_124_0.phase > 6.283 then
		slot_0_124_0.phase = slot_0_124_0.phase - 6.283
	end

	slot_145_6_0 = 1

	if slot_145_4_0 < 5000 then
		slot_145_6_0 = 0.5 * (slot_145_4_0 / 5000)
	end

	slot_145_7_0 = slot_0_0_0.floor(54 * slot_145_6_0)
	slot_145_8_0 = slot_0_0_0.sin(slot_0_124_0.phase)
	slot_145_9_0 = slot_0_0_0.floor(slot_145_7_0 * (0.5 + 0.5 * slot_145_8_0))

	if slot_145_9_0 < 3 then
		return
	end

	slot_145_10_0, slot_145_11_0 = game.engine:GetScreenSize()
	slot_145_12_0 = draw.surface
	slot_145_13_0 = slot_0_0_0.floor(slot_145_10_0 * 0.08)

	if slot_0_124_0.cursed then
		for iter_145_0 = 0, slot_145_13_0 - 1 do
			slot_145_18_3 = iter_145_0 / slot_145_13_0
			slot_145_19_3 = slot_0_0_0.floor(slot_145_9_0 * (1 - slot_145_18_3))

			if slot_145_19_3 > 0 then
				slot_145_20_5 = draw.Color(slot_0_0_0.floor(80 + 100 * (1 - slot_145_18_3)), 0, 0, slot_145_19_3)

				slot_145_12_0:AddRectFilled(draw.Rect(0, iter_145_0, slot_145_10_0, iter_145_0 + 1), slot_145_20_5)
			end
		end

		for iter_145_1 = 0, slot_145_13_0 - 1 do
			slot_145_18_2 = iter_145_1 / slot_145_13_0
			slot_145_19_2 = slot_0_0_0.floor(slot_145_9_0 * (1 - slot_145_18_2))

			if slot_145_19_2 > 0 then
				slot_145_20_4 = draw.Color(slot_0_0_0.floor(80 + 100 * (1 - slot_145_18_2)), 0, 0, slot_145_19_2)

				slot_145_12_0:AddRectFilled(draw.Rect(0, slot_145_11_0 - 1 - iter_145_1, slot_145_10_0, slot_145_11_0 - iter_145_1), slot_145_20_4)
			end
		end

		for iter_145_2 = 0, slot_145_13_0 - 1 do
			slot_145_18_1 = iter_145_2 / slot_145_13_0
			slot_145_19_1 = slot_0_0_0.floor(slot_145_9_0 * (1 - slot_145_18_1))

			if slot_145_19_1 > 0 then
				slot_145_12_0:AddRectFilled(draw.Rect(iter_145_2, 0, iter_145_2 + 1, slot_145_11_0), draw.Color(80, 0, 0, slot_145_19_1))
			end
		end

		for iter_145_3 = 0, slot_145_13_0 - 1 do
			slot_145_18_0 = iter_145_3 / slot_145_13_0
			slot_145_19_0 = slot_0_0_0.floor(slot_145_9_0 * (1 - slot_145_18_0))

			if slot_145_19_0 > 0 then
				slot_145_12_0:AddRectFilled(draw.Rect(slot_145_10_0 - 1 - iter_145_3, 0, slot_145_10_0 - iter_145_3, slot_145_11_0), draw.Color(255, 0, 0, slot_145_19_0))
			end
		end
	else
		slot_145_14_0 = 87
		slot_145_15_0 = 246
		slot_145_16_0 = 126

		for iter_145_4 = 0, slot_145_13_0 - 1 do
			slot_145_21_3 = slot_0_0_0.floor(slot_145_9_0 * (1 - iter_145_4 / slot_145_13_0))

			if slot_145_21_3 > 0 then
				slot_145_12_0:AddRectFilled(draw.Rect(0, iter_145_4, slot_145_10_0, iter_145_4 + 1), draw.Color(slot_145_14_0, slot_145_15_0, slot_145_16_0, slot_145_21_3))
			end
		end

		for iter_145_5 = 0, slot_145_13_0 - 1 do
			slot_145_21_2 = slot_0_0_0.floor(slot_145_9_0 * (1 - iter_145_5 / slot_145_13_0))

			if slot_145_21_2 > 0 then
				slot_145_12_0:AddRectFilled(draw.Rect(0, slot_145_11_0 - 1 - iter_145_5, slot_145_10_0, slot_145_11_0 - iter_145_5), draw.Color(slot_145_14_0, slot_145_15_0, slot_145_16_0, slot_145_21_2))
			end
		end

		for iter_145_6 = 0, slot_145_13_0 - 1 do
			slot_145_21_1 = slot_0_0_0.floor(slot_145_9_0 * (1 - iter_145_6 / slot_145_13_0))

			if slot_145_21_1 > 0 then
				slot_145_12_0:AddRectFilled(draw.Rect(iter_145_6, 0, iter_145_6 + 1, slot_145_11_0), draw.Color(slot_145_14_0, slot_145_15_0, slot_145_16_0, slot_145_21_1))
			end
		end

		for iter_145_7 = 0, slot_145_13_0 - 1 do
			slot_145_21_0 = slot_0_0_0.floor(slot_145_9_0 * (1 - iter_145_7 / slot_145_13_0))

			if slot_145_21_0 > 0 then
				slot_145_12_0:AddRectFilled(draw.Rect(slot_145_10_0 - 1 - iter_145_7, 0, slot_145_10_0 - iter_145_7, slot_145_11_0), draw.Color(slot_145_14_0, slot_145_15_0, slot_145_16_0, slot_145_21_0))
			end
		end
	end
end

function slot_0_130_0()
	if not slot_0_125_0.active then
		return
	end

	slot_146_1_0 = ((game.globalVars.m_flRealTime or 0) - slot_0_125_0.startTime) * 1000

	if slot_146_1_0 >= slot_0_125_0.duration then
		slot_0_125_0.active = false
		slot_0_125_0.phase = 0

		if slot_0_18_0.skyColor and slot_0_125_0.savedSky then
			slot_146_2_1 = slot_0_18_0.skyColor:GetValue()

			if slot_146_2_1 then
				slot_146_2_1:Set(slot_0_125_0.savedSky)
			end
		end

		slot_0_125_0.savedSky = nil

		if slot_0_124_0.cursed then
			slot_0_124_0.active = false
			slot_0_124_0.cursed = false
		end

		return
	end

	slot_146_2_0 = game.globalVars.m_flFrameTime or 0.015
	slot_146_3_0 = slot_0_125_0.duration - slot_146_1_0
	slot_146_4_0 = 3

	if slot_146_3_0 < 5000 then
		slot_146_4_0 = 8
	end

	slot_0_125_0.phase = slot_0_125_0.phase + slot_146_2_0 * slot_146_4_0

	if slot_0_125_0.phase > 6.283 then
		slot_0_125_0.phase = slot_0_125_0.phase - 6.283
	end

	slot_146_5_0 = 1

	if slot_146_3_0 < 5000 then
		slot_146_5_0 = 0.5 * (slot_146_3_0 / 5000)
	end

	slot_146_6_0 = slot_0_0_0.floor(54 * slot_146_5_0)
	slot_146_7_0 = slot_0_0_0.sin(slot_0_125_0.phase)
	slot_146_8_0 = slot_0_0_0.floor(slot_146_6_0 * (0.5 + 0.5 * slot_146_7_0))

	if slot_146_8_0 < 3 then
		return
	end

	slot_146_9_0, slot_146_10_0 = game.engine:GetScreenSize()
	slot_146_11_0 = draw.surface
	slot_146_12_0 = slot_0_0_0.floor(slot_146_9_0 * 0.08)
	slot_146_13_0 = 120
	slot_146_14_0 = 0
	slot_146_15_0 = 0

	for iter_146_0 = 0, slot_146_12_0 - 1 do
		slot_146_20_3 = slot_0_0_0.floor(slot_146_8_0 * (1 - iter_146_0 / slot_146_12_0))

		if slot_146_20_3 > 0 then
			slot_146_11_0:AddRectFilled(draw.Rect(0, iter_146_0, slot_146_9_0, iter_146_0 + 1), draw.Color(slot_146_13_0, slot_146_14_0, slot_146_15_0, slot_146_20_3))
		end
	end

	for iter_146_1 = 0, slot_146_12_0 - 1 do
		slot_146_20_2 = slot_0_0_0.floor(slot_146_8_0 * (1 - iter_146_1 / slot_146_12_0))

		if slot_146_20_2 > 0 then
			slot_146_11_0:AddRectFilled(draw.Rect(0, slot_146_10_0 - 1 - iter_146_1, slot_146_9_0, slot_146_10_0 - iter_146_1), draw.Color(slot_146_13_0, slot_146_14_0, slot_146_15_0, slot_146_20_2))
		end
	end

	for iter_146_2 = 0, slot_146_12_0 - 1 do
		slot_146_20_1 = slot_0_0_0.floor(slot_146_8_0 * (1 - iter_146_2 / slot_146_12_0))

		if slot_146_20_1 > 0 then
			slot_146_11_0:AddRectFilled(draw.Rect(iter_146_2, 0, iter_146_2 + 1, slot_146_10_0), draw.Color(slot_146_13_0, slot_146_14_0, slot_146_15_0, slot_146_20_1))
		end
	end

	for iter_146_3 = 0, slot_146_12_0 - 1 do
		slot_146_20_0 = slot_0_0_0.floor(slot_146_8_0 * (1 - iter_146_3 / slot_146_12_0))

		if slot_146_20_0 > 0 then
			slot_146_11_0:AddRectFilled(draw.Rect(slot_146_9_0 - 1 - iter_146_3, 0, slot_146_9_0 - iter_146_3, slot_146_10_0), draw.Color(slot_146_13_0, slot_146_14_0, slot_146_15_0, slot_146_20_0))
		end
	end
end

slot_0_131_0 = {}
slot_0_132_0 = {
	prevFrameTime = 0.015625,
	prevVel = nil
}
slot_0_133_0 = {
	VA_PRED_MAX = 4,
	VA_PRED_MIN = 1,
	HEAD_Z_THRESH = 5,
	VA_ACCEL_DAMP = 0.85,
	ADAD_RHYTHM_WIN = 0.15,
	VA_MIN_FT = 0.001,
	FRONT_CORR_GAIN = 35,
	FRONT_CORR_TS = 0.15,
	FRONT_DEADZONE = 5,
	FRONT_DIST = 35,
	FRONT_VEL_THRESH = 50,
	FRONT_PRED_FRAMES = 4,
	MAX_SPEED = 250,
	MAX_CORR_DIST = 100,
	HEAD_DEADZONE = 1,
	HEAD_HEIGHT = 72,
	HEAD_PRED_FRAMES = 10,
	HEAD_XY_TOL = 15,
	VA_STRAFE_ADAD = 1,
	VA_STRAFE_BASE = 1,
	JUMP_VEL_THRESH = 200,
	ADAD_MIN_LAT = 0.1,
	MAX_PRED_FT = 0.033,
	ADAD_MIN_STREAK = 2,
	ADAD_DUR = 0.3,
	ADAD_MIN_SPD = 70,
	VA_LAT_DZ_ADAD = 0.05,
	VA_LAT_DZ_BASE = 0.2,
	VA_PRED_ADAD = 1,
	[0] = nil
}

function slot_0_134_0()
	local var_147_0 = entities.GetLocalPawn()

	if not var_147_0 or not var_147_0:IsAlive() then
		slot_0_132_0.target = nil

		return
	end

	local var_147_1 = var_147_0:GetAbsOrigin()

	if not var_147_1 then
		slot_0_132_0.target = nil

		return
	end

	local var_147_2 = var_147_0.m_iTeamNum and var_147_0.m_iTeamNum:Get() or 0

	if slot_0_132_0.target then
		local var_147_3 = slot_0_132_0.target

		if var_147_3.IsAlive and var_147_3:IsAlive() then
			local var_147_4 = var_147_3:GetAbsOrigin()

			if var_147_4 then
				local var_147_5 = var_147_1.x - var_147_4.x
				local var_147_6 = var_147_1.y - var_147_4.y

				if slot_0_0_0.sqrt(var_147_5 * var_147_5 + var_147_6 * var_147_6) < 1000 then
					return
				end
			end
		end

		slot_0_132_0.target = nil
	end

	local var_147_7 = math.huge
	local var_147_8

	entities.players:ForEach(function(arg_148_0)
		if not arg_148_0 then
			return
		end

		local var_148_0 = arg_148_0.entity ~= nil and arg_148_0.entity or arg_148_0

		if not var_148_0 or var_148_0 == var_147_0 then
			return
		end

		if not var_148_0.IsAlive or not var_148_0:IsAlive() then
			return
		end

		local var_148_1 = var_148_0.m_iTeamNum and var_148_0.m_iTeamNum:Get() or 0

		if var_148_1 ~= var_147_2 or var_148_1 == 0 then
			return
		end

		local var_148_2 = var_148_0:GetAbsOrigin()

		if not var_148_2 then
			return
		end

		local var_148_3 = var_147_1.x - var_148_2.x
		local var_148_4 = var_147_1.y - var_148_2.y
		local var_148_5 = slot_0_0_0.sqrt(var_148_3 * var_148_3 + var_148_4 * var_148_4)

		if var_148_5 > 1 and var_148_5 < 800 and var_148_5 < var_147_7 then
			var_147_7 = var_148_5
			var_147_8 = var_148_0
		end
	end)

	slot_0_132_0.target = var_147_8

	if not var_147_8 then
		slot_0_132_0.prevVel = nil
	end
end

function slot_0_135_0(arg_149_0, arg_149_1, arg_149_2)
	local var_149_0 = slot_0_0_0.sqrt(arg_149_0 * arg_149_0 + arg_149_1 * arg_149_1 + arg_149_2 * arg_149_2)

	if var_149_0 > 0.0001 then
		return arg_149_0 / var_149_0, arg_149_1 / var_149_0, arg_149_2 / var_149_0
	end

	return 0, 0, 0
end

events.createMove:Add(function(arg_150_0)
	if not slot_0_54_0.blockbot or not slot_0_54_0.blockbot:Get() then
		slot_0_132_0.target = nil
		slot_0_132_0.prevVel = nil

		return
	end

	if not slot_0_90_0() then
		return
	end

	slot_150_1_0 = entities.GetLocalPawn()

	if not slot_150_1_0 or not slot_150_1_0:IsAlive() then
		slot_0_132_0.target = nil

		return
	end

	slot_0_134_0()

	if not slot_0_132_0.target then
		return
	end

	slot_150_2_0 = slot_0_132_0.target

	if not slot_150_2_0.IsAlive or not slot_150_2_0:IsAlive() then
		slot_0_132_0.target = nil

		return
	end

	slot_150_3_0 = slot_150_1_0:GetAbsOrigin()
	slot_150_4_0 = slot_150_2_0:GetAbsOrigin()
	slot_150_5_0 = slot_150_2_0:GetAbsVelocity()

	if not slot_150_3_0 or not slot_150_4_0 then
		return
	end

	slot_150_5_0 = slot_150_5_0 or Vector(0, 0, 0)
	slot_150_6_0 = game.globalVars.m_flFrameTime or 0.015625

	if slot_150_6_0 <= 0 then
		slot_150_6_0 = 0.015625
	end

	slot_150_7_0 = slot_0_0_0.min(slot_150_6_0, slot_0_133_0.MAX_PRED_FT)
	slot_150_8_0 = slot_0_0_0.sqrt(slot_150_5_0.x * slot_150_5_0.x + slot_150_5_0.y * slot_150_5_0.y)
	slot_150_9_1 = 0
	slot_150_10_1 = 0

	if slot_0_132_0.prevVel and slot_0_132_0.prevFrameTime > slot_0_133_0.VA_MIN_FT then
		slot_150_9_0 = (slot_150_5_0.x - slot_0_132_0.prevVel.x) / slot_0_132_0.prevFrameTime * slot_0_133_0.VA_ACCEL_DAMP
		slot_150_10_0 = (slot_150_5_0.y - slot_0_132_0.prevVel.y) / slot_0_132_0.prevFrameTime * slot_0_133_0.VA_ACCEL_DAMP
	end

	slot_0_132_0.prevVel = Vector(slot_150_5_0.x, slot_150_5_0.y, slot_150_5_0.z)
	slot_0_132_0.prevFrameTime = slot_150_6_0
	slot_150_11_0 = slot_150_3_0.z - slot_150_4_0.z
	slot_150_12_0 = slot_0_0_0.sqrt((slot_150_3_0.x - slot_150_4_0.x)^2 + (slot_150_3_0.y - slot_150_4_0.y)^2)

	if slot_150_11_0 > slot_0_133_0.HEAD_Z_THRESH and slot_150_12_0 < slot_0_133_0.HEAD_XY_TOL then
		slot_150_14_1 = slot_150_7_0 * slot_0_133_0.HEAD_PRED_FRAMES
		slot_150_15_1 = slot_150_4_0.x + slot_150_5_0.x * slot_150_14_1
		slot_150_16_1 = slot_150_4_0.y + slot_150_5_0.y * slot_150_14_1
		slot_150_17_1 = slot_150_4_0.z + slot_150_5_0.z * slot_150_14_1 + slot_0_133_0.HEAD_HEIGHT
		slot_150_18_1 = slot_150_15_1 - slot_150_3_0.x
		slot_150_19_1 = slot_150_16_1 - slot_150_3_0.y
		slot_150_20_1 = slot_0_0_0.sqrt(slot_150_18_1 * slot_150_18_1 + slot_150_19_1 * slot_150_19_1)

		if slot_150_20_1 > slot_0_133_0.HEAD_DEADZONE then
			slot_150_21_1, slot_150_22_1 = slot_0_135_0(slot_150_18_1, slot_150_19_1, 0)
			slot_150_23_1 = slot_0_0_0.min(slot_150_20_1 / slot_0_133_0.MAX_CORR_DIST, 1)
			slot_150_24_1 = slot_0_0_0.min(slot_150_8_0 + slot_0_133_0.MAX_SPEED * slot_150_23_1, slot_0_133_0.MAX_SPEED)
			slot_150_25_1 = slot_0_133_0.MAX_SPEED > 1e-05 and slot_150_24_1 / slot_0_133_0.MAX_SPEED or 0
			slot_150_26_1 = slot_0_0_0.rad(arg_150_0:GetViewangles().y)
			slot_150_27_1 = slot_0_0_0.cos(slot_150_26_1)
			slot_150_28_1 = slot_0_0_0.sin(slot_150_26_1)
			slot_150_29_1 = slot_0_0_0.max(-1, slot_0_0_0.min(1, (slot_150_21_1 * slot_150_27_1 + slot_150_22_1 * slot_150_28_1) * slot_150_25_1))
			slot_150_30_1 = slot_0_0_0.max(-1, slot_0_0_0.min(1, (-slot_150_21_1 * slot_150_28_1 + slot_150_22_1 * slot_150_27_1) * slot_150_25_1))

			arg_150_0:SetForwardMove(slot_150_29_1)
			arg_150_0:SetLeftMove(slot_150_30_1)
		end
	else
		slot_150_14_0 = slot_150_7_0 * slot_0_133_0.FRONT_PRED_FRAMES
		slot_150_15_0 = slot_150_4_0.x + slot_150_5_0.x * slot_150_14_0
		slot_150_16_0 = slot_150_4_0.y + slot_150_5_0.y * slot_150_14_0
		slot_150_17_0 = nil

		if slot_150_8_0 > slot_0_133_0.FRONT_VEL_THRESH then
			slot_150_17_0 = slot_0_0_0.atan2(slot_150_5_0.y, slot_150_5_0.x)
		else
			slot_150_17_0 = 0
		end

		slot_150_18_0 = slot_150_15_0 + slot_0_0_0.cos(slot_150_17_0) * slot_0_133_0.FRONT_DIST
		slot_150_19_0 = slot_150_16_0 + slot_0_0_0.sin(slot_150_17_0) * slot_0_133_0.FRONT_DIST
		slot_150_20_0 = slot_150_18_0 - slot_150_3_0.x
		slot_150_21_0 = slot_150_19_0 - slot_150_3_0.y
		slot_150_22_0 = slot_0_0_0.sqrt(slot_150_20_0 * slot_150_20_0 + slot_150_21_0 * slot_150_21_0)

		if slot_150_22_0 > slot_0_133_0.FRONT_DEADZONE then
			slot_150_23_0 = slot_150_7_0 * slot_0_0_0.max(0.001, slot_0_133_0.FRONT_CORR_TS)

			if slot_150_23_0 <= 1e-05 then
				slot_150_23_0 = 1e-05
			end

			slot_150_24_0 = slot_150_22_0 / slot_150_23_0 * slot_0_133_0.FRONT_CORR_GAIN
			slot_150_25_0 = slot_0_0_0.min(slot_150_8_0 + slot_150_24_0, slot_0_133_0.MAX_SPEED)
			slot_150_26_0, slot_150_27_0 = slot_0_135_0(slot_150_20_0, slot_150_21_0, 0)
			slot_150_28_0 = slot_0_0_0.rad(arg_150_0:GetViewangles().y)
			slot_150_29_0 = slot_0_0_0.cos(slot_150_28_0)
			slot_150_30_0 = slot_0_0_0.sin(slot_150_28_0)
			slot_150_31_0 = slot_0_133_0.MAX_SPEED > 0.001 and slot_150_25_0 / slot_0_133_0.MAX_SPEED or 0

			arg_150_0:SetForwardMove(slot_0_0_0.max(-1, slot_0_0_0.min(1, (slot_150_26_0 * slot_150_29_0 + slot_150_27_0 * slot_150_30_0) * slot_150_31_0)))
			arg_150_0:SetLeftMove(slot_0_0_0.max(-1, slot_0_0_0.min(1, (-slot_150_26_0 * slot_150_30_0 + slot_150_27_0 * slot_150_29_0) * slot_150_31_0)))
		end
	end
end)

slot_0_136_0 = {}
slot_0_137_0 = 50
slot_0_138_0 = 300
slot_0_139_0 = 10
slot_0_140_0 = {
	{
		m = "de_mirage",
		l = "WP 1",
		[0] = nil,
		p = Vector(703.59, -1603.12, -262.88)
	},
	{
		m = "de_mirage",
		l = "WP 2",
		[0] = nil,
		p = Vector(-1039.57, -327.51, -367.97)
	},
	{
		m = "de_mirage",
		l = "WP 3",
		[0] = nil,
		p = Vector(605.47, -1718.96, -258.09)
	},
	{
		m = "de_mirage",
		l = "WP 4",
		["celestial.l"] = nil,
		p = Vector(-1005.98, -2480.6, -167.97)
	},
	{
		m = "de_mirage",
		l = "WP 5",
		[0] = nil,
		p = Vector(576.92, -1717.41, -259.04)
	},
	{
		m = "de_mirage",
		l = "WP 6",
		[0] = nil,
		p = Vector(12.23, -2093.41, -39.97)
	},
	{
		m = "de_mirage",
		l = "WP 7",
		[0] = nil,
		p = Vector(509.55, -1665.9, -263.97)
	},
	{
		m = "de_mirage",
		l = "WP 8",
		[0] = nil,
		p = Vector(459.3, -2343.78, -39.97)
	},
	{
		m = "de_mirage",
		l = "WP 9",
		[0] = nil,
		p = Vector(444.76, -1710.55, -234.35)
	},
	{
		m = "de_mirage",
		l = "WP 10",
		[0] = nil,
		p = Vector(1039.96, -1909.43, -71.97)
	},
	{
		m = "de_mirage",
		l = "WP 11",
		[0] = nil,
		p = Vector(430.87, -1523.46, -227.4)
	},
	{
		m = "de_mirage",
		l = "WP 12",
		[0] = nil,
		p = Vector(-675.45, -780.14, -262.05)
	},
	{
		m = "de_mirage",
		l = "WP 13",
		[0] = nil,
		p = Vector(487.58, -1601.25, -255.76)
	},
	{
		m = "de_mirage",
		l = "WP 14",
		[0] = nil,
		p = Vector(527.97, -534.74, -155.97)
	},
	{
		m = "de_mirage",
		l = "WP 15",
		[0] = nil,
		p = Vector(-647.06, -778.04, -261.97)
	},
	{
		m = "de_mirage",
		l = "WP 16",
		[0] = nil,
		p = Vector(419.38, -1522.17, -221.65)
	},
	{
		m = "de_mirage",
		l = "WP 17",
		[0] = nil,
		p = Vector(-628.49, -778.79, -261.97)
	},
	{
		m = "de_mirage",
		l = "WP 18",
		[0] = nil,
		p = Vector(-142.97, -1418.03, -72.18)
	},
	{
		m = "de_mirage",
		l = "WP 19",
		[0] = nil,
		p = Vector(-611.44, -767.45, -261.97)
	},
	{
		m = "de_mirage",
		l = "WP 20",
		[0] = nil,
		p = Vector(-297.2, -1529.68, -167.97)
	},
	{
		m = "de_mirage",
		l = "WP 21",
		[0] = nil,
		p = Vector(-600.88, -739.22, -262.38)
	},
	{
		m = "de_mirage",
		l = "WP 22",
		[0] = nil,
		p = Vector(-391.37, -2031.91, -179.97)
	},
	{
		m = "de_mirage",
		l = "WP 23",
		[0] = nil,
		p = Vector(-152.51, -934.7, -167.55)
	},
	{
		m = "de_mirage",
		l = "WP 24",
		[0] = nil,
		p = Vector(-704.82, -814.35, -263.97)
	},
	{
		m = "de_mirage",
		l = "WP 25",
		[0] = nil,
		p = Vector(-710.23, -812.21, -263.97)
	},
	{
		m = "de_mirage",
		l = "WP 26",
		[0] = nil,
		p = Vector(-1374.63, -987.34, -167.97)
	},
	{
		m = "de_mirage",
		l = "WP 27",
		[0] = nil,
		p = Vector(-999.98, -307.89, -367.97)
	},
	{
		m = "de_mirage",
		l = "WP 28",
		[0] = nil,
		p = Vector(684.14, -1625.9, -262.55)
	},
	{
		m = "de_mirage",
		l = "WP 29",
		[0] = nil,
		p = Vector(-1070.3, -2468.48, -167.97)
	},
	{
		m = "de_mirage",
		l = "WP 30",
		[0] = nil,
		p = Vector(691.76, -1642.52, -258.56)
	},
	{
		m = "de_mirage",
		l = "WP 31",
		[0] = nil,
		p = Vector(-1711.97, -1023.42, -203.92)
	},
	{
		m = "de_mirage",
		l = "WP 32",
		[0] = nil,
		p = Vector(11.61, -607.98, -189.97)
	},
	{
		m = "de_mirage",
		l = "WP 33",
		[0] = nil,
		p = Vector(-1671.04, 564.31, -167.97)
	},
	{
		m = "de_mirage",
		l = "WP 34",
		[0] = nil,
		p = Vector(-1133.83, -786.66, -167.97)
	},
	{
		m = "de_mirage",
		l = "WP 35",
		[0] = nil,
		p = Vector(-1567.95, 526.26, -167.97)
	},
	{
		m = "de_mirage",
		l = "WP 36",
		[0] = nil,
		p = Vector(-1054.21, 731.78, -79.97)
	},
	{
		m = "de_mirage",
		l = "WP 37",
		[0] = nil,
		p = Vector(-1571.11, 525.77, -167.97)
	},
	{
		m = "de_mirage",
		l = "WP 38",
		cel = nil,
		p = Vector(-1449.3, 252.92, -166.97)
	},
	{
		m = "de_mirage",
		l = "WP 39",
		[0] = nil,
		p = Vector(-1504.24, 750.58, -47.97)
	},
	{
		m = "de_mirage",
		l = "WP 40",
		[0] = nil,
		p = Vector(-1633.51, 115.84, -168.39)
	},
	{
		m = "de_mirage",
		l = "WP 41",
		[0] = nil,
		p = Vector(-752.04, -61.73, -161.07)
	},
	{
		m = "de_mirage",
		l = "WP 42",
		[0] = nil,
		p = Vector(20.35, -2122.48, -39.97)
	},
	{
		m = "de_mirage",
		l = "WP 43",
		[0] = nil,
		p = Vector(667.86, -1601.04, -263.97)
	},
	{
		m = "de_mirage",
		l = "WP 44",
		[0] = nil,
		p = Vector(151.97, -2071.96, -39.97)
	},
	{
		m = "de_mirage",
		l = "WP 45",
		[0] = nil,
		p = Vector(208.15, -1437.61, -175.97)
	},
	{
		m = "de_mirage",
		l = "WP 46",
		[0] = nil,
		p = Vector(15.97, -1740.47, -167.97)
	},
	{
		m = "de_mirage",
		l = "WP 47",
		[0] = nil,
		p = Vector(947.48, -2273.43, -39.97)
	},
	{
		m = "de_mirage",
		l = "WP 48",
		[0] = nil,
		p = Vector(-129.66, -2412.97, -163.97)
	},
	{
		m = "de_mirage",
		l = "WP 49",
		[0] = nil,
		p = Vector(468.79, -2337.59, -39.97)
	},
	{
		m = "de_mirage",
		l = "WP 50",
		[0] = nil,
		p = Vector(735.97, -2390.94, 10.63)
	},
	{
		m = "de_mirage",
		l = "WP 51",
		[0] = nil,
		p = Vector(-282.84, -2399.04, -163.97)
	},
	{
		m = "de_mirage",
		l = "WP 52",
		[0] = nil,
		p = Vector(1179.1, -1479.96, -167.97)
	},
	{
		m = "de_mirage",
		l = "WP 53",
		[0] = nil,
		p = Vector(878.89, -2009.5, -71.97)
	},
	{
		m = "de_mirage",
		l = "WP 54",
		[0] = nil,
		p = Vector(-552.23, -1310.53, -163.97)
	},
	{
		m = "de_mirage",
		l = "WP 55",
		[0] = nil,
		p = Vector(-453.46, -1798.52, -175.77)
	},
	{
		m = "de_mirage",
		l = "WP 56",
		[0] = nil,
		p = Vector(-1504.52, -1420.02, -259.97)
	},
	{
		m = "de_mirage",
		l = "WP 57",
		[0] = nil,
		p = Vector(-327.19, -2037.79, -175.18)
	},
	{
		m = "de_mirage",
		l = "WP 58",
		[0] = nil,
		p = Vector(-1525.03, -1474.21, -259.97)
	},
	{
		m = "de_mirage",
		l = "WP 59",
		[0] = nil,
		p = Vector(-494.8, -702.3, -267.72)
	},
	{
		m = "de_mirage",
		l = "WP 60",
		[0] = nil,
		p = Vector(-1504.39, -1440.34, -259.97)
	},
	{
		m = "de_mirage",
		l = "WP 61",
		[0] = nil,
		p = Vector(-1156.04, -1248.18, -167.97)
	},
	{
		m = "de_mirage",
		l = "WP 62",
		[0] = nil,
		p = Vector(-1556.84, -950.87, -191.93)
	},
	{
		m = "de_mirage",
		l = "WP 63",
		["Force shoot"] = nil,
		p = Vector(-1041.4, -300.32, -367.97)
	},
	{
		m = "de_mirage",
		l = "WP 64",
		[0] = nil,
		p = Vector(-1572.53, -1607.21, -263.62)
	},
	{
		m = "de_mirage",
		l = "WP 65",
		de_anubis = nil,
		p = Vector(-1961.6, -472.47, -167.97)
	},
	{
		m = "de_mirage",
		l = "WP 66",
		[0] = nil,
		p = Vector(-1006.52, -321.76, -367.97)
	},
	{
		m = "de_mirage",
		l = "WP 67",
		[0] = nil,
		p = Vector(-1128.4, 295.97, -159.97)
	},
	{
		m = "de_mirage",
		l = "WP 68",
		[0] = nil,
		p = Vector(-436.49, 662.3, -79.64)
	},
	{
		m = "de_mirage",
		l = "WP 69",
		[0] = nil,
		p = Vector(-1073.82, 297.22, -159.97)
	},
	{
		m = "de_mirage",
		l = "WP 70",
		[0] = nil,
		p = Vector(-1012.98, 546.72, -79.97)
	},
	{
		m = "de_mirage",
		l = "WP 71",
		[0] = nil,
		p = Vector(-1839.26, 241.86, -162.15)
	},
	{
		m = "de_mirage",
		l = "WP 72",
		[0] = nil,
		p = Vector(-982.12, 327.82, -367.97)
	},
	{
		m = "de_mirage",
		l = "WP 73",
		[0] = nil,
		p = Vector(-913.93, 112.04, -170.46)
	},
	{
		m = "de_mirage",
		l = "WP 74",
		["WP 68"] = nil,
		p = Vector(-1011.93, -163.11, -348.3)
	},
	{
		m = "de_mirage",
		l = "WP 75",
		[0] = nil,
		p = Vector(-2004.44, 682.37, -46.56)
	},
	{
		m = "de_mirage",
		l = "WP 76",
		[0] = nil,
		p = Vector(-1044, -333.05, -357.7)
	},
	{
		m = "de_mirage",
		l = "WP 77",
		[0] = nil,
		p = Vector(-1038.34, 360.31, -367.97)
	},
	{
		m = "de_mirage",
		l = "WP 78",
		[0] = nil,
		p = Vector(-1932.83, -356.13, -167.97)
	},
	{
		m = "de_mirage",
		l = "WP 79",
		[0] = nil,
		p = Vector(-969.88, -378.17, -346.88)
	},
	{
		m = "de_mirage",
		l = "WP 80",
		[0] = nil,
		p = Vector(187.1, 841.37, -135.97)
	},
	{
		m = "de_mirage",
		l = "WP 81",
		[0] = nil,
		p = Vector(-1017.47, -456.4, -307.77)
	},
	{
		m = "de_mirage",
		l = "WP 82",
		[0] = nil,
		p = Vector(-969.66, 240.66, -171.39)
	},
	{
		m = "de_mirage",
		l = "WP 83",
		[0] = nil,
		p = Vector(-710.95, -821.33, -263.97)
	},
	{
		m = "de_mirage",
		l = "WP 84",
		[0] = nil,
		p = Vector(-1255.57, -1440.03, -158.01)
	},
	{
		m = "de_dust2",
		l = "WP 85",
		[0] = nil,
		p = Vector(820.49, 808.03, 47.03)
	},
	{
		m = "de_dust2",
		l = "WP 86",
		[0] = nil,
		p = Vector(311.44, 1786.08, 96.03)
	},
	{
		m = "de_dust2",
		l = "WP 87",
		[0] = nil,
		p = Vector(915.47, 2412.67, 127.03)
	},
	{
		m = "de_dust2",
		l = "WP 88",
		[0] = nil,
		p = Vector(291.23, 2415.4, -121.09)
	},
	{
		m = "de_dust2",
		l = "WP 89",
		[0] = nil,
		p = Vector(-364.1, 2145.41, -127.84)
	},
	{
		m = "de_dust2",
		l = "WP 90",
		[0] = nil,
		p = Vector(334, 1678.27, 43.28)
	},
	{
		m = "de_dust2",
		l = "WP 91",
		[0] = nil,
		p = Vector(362.84, 1636.5, 21.39)
	},
	{
		m = "de_dust2",
		l = "WP 92",
		[0] = nil,
		p = Vector(-166.03, 2172.27, -126)
	},
	{
		m = "de_dust2",
		l = "WP 93",
		de_vertigo = nil,
		p = Vector(1146.69, 2276.1, 9.44)
	},
	{
		m = "de_dust2",
		l = "WP 94",
		[0] = nil,
		p = Vector(1356.49, 2533.7, 67.16)
	},
	{
		m = "de_dust2",
		l = "WP 95",
		[0] = nil,
		p = Vector(597.71, 457.31, 1.21)
	},
	{
		m = "de_dust2",
		l = "WP 96",
		[0] = nil,
		p = Vector(-541.42, 404.95, 5.82)
	}
}

for iter_0_2, iter_0_3 in ipairs(slot_0_140_0) do
	table.insert(slot_0_136_0, iter_0_3)
end

if slot_0_54_0.wpAdd then
	slot_0_54_0.wpAdd:AddCallback(function()
		local var_151_0 = entities.GetLocalPawn()

		if not var_151_0 or not var_151_0:IsAlive() then
			return
		end

		local var_151_1 = var_151_0:GetAbsOrigin()

		if not var_151_1 then
			return
		end

		local var_151_2 = game.globalVars.m_szMapName or "unknown"

		table.insert(slot_0_136_0, {
			celes = nil,
			l = "Custom " .. #slot_0_136_0,
			p = var_151_1,
			m = var_151_2
		})
	end)
end

if slot_0_54_0.wpClear then
	slot_0_54_0.wpClear:AddCallback(function()
		if #slot_0_136_0 > 0 then
			table.remove(slot_0_136_0)
		end
	end)
end

function slot_0_141_0()
	local var_153_0 = entities.GetLocalPawn()

	if not var_153_0 or not var_153_0:IsAlive() then
		return nil
	end

	local var_153_1 = var_153_0:GetActiveWeapon()

	if not var_153_1 then
		return nil
	end

	local var_153_2 = 0

	if var_153_1.GetDefIndex then
		var_153_2 = var_153_1:GetDefIndex()
	else
		local var_153_3 = var_153_1:ToWeaponBaseGun()

		if var_153_3 then
			var_153_2 = var_153_3:GetDefIndex() or 0
		end
	end

	if var_153_2 == 0 or var_153_2 == nil then
		return nil
	end

	if var_153_2 == 43 then
		return "Flashbang"
	elseif var_153_2 == 44 then
		return "HE Grenade"
	elseif var_153_2 == 45 then
		return "Smoke"
	elseif var_153_2 == 46 or var_153_2 == 48 then
		return "Molotov"
	elseif var_153_2 == 47 then
		return "Decoy"
	end

	return nil
end

if slot_0_54_0.nadeAdd then
	slot_0_54_0.nadeAdd:AddCallback(function()
		local var_154_0 = entities.GetLocalPawn()

		if not var_154_0 or not var_154_0:IsAlive() then
			return
		end

		local var_154_1 = var_154_0:GetActiveWeapon()
		local var_154_2 = var_154_0:GetAbsOrigin()

		if not var_154_2 then
			return
		end

		local var_154_3 = game.globalVars.m_szMapName or "unknown"
		local var_154_4 = slot_0_141_0()

		if not var_154_4 then
			local var_154_5 = 0

			if var_154_1 and var_154_1.GetDefIndex then
				var_154_5 = var_154_1:GetDefIndex()
			elseif var_154_1 then
				local var_154_6 = var_154_1:ToWeaponBaseGun()

				if var_154_6 then
					var_154_5 = var_154_6:GetDefIndex() or 0
				end
			end

			game.engine:ClientCmd("echo \"[Celestial] Error: You are holding weapon ID: " .. tostring(var_154_5) .. ". Please hold a grenade to save a lineup!\"")

			return
		end

		local var_154_7 = slot_0_51_0 or Vector(0, 0, 0)

		table.insert(slot_0_36_0, {
			[0] = nil,
			l = var_154_4,
			p = var_154_2,
			m = var_154_3,
			va = Vector(var_154_7.x, var_154_7.y, var_154_7.z),
			type = var_154_4
		})
		game.engine:ClientCmd("echo \"[Celestial] Saved " .. var_154_4 .. " lineup at " .. var_154_3 .. "\"")
	end)
end

if slot_0_54_0.nadeClear then
	slot_0_54_0.nadeClear:AddCallback(function()
		if #slot_0_36_0 > 0 then
			table.remove(slot_0_36_0)
		end
	end)
end

function slot_0_142_0(arg_156_0, arg_156_1)
	local var_156_0 = arg_156_0.x - arg_156_1.x
	local var_156_1 = arg_156_0.y - arg_156_1.y

	return slot_0_0_0.sqrt(var_156_0 * var_156_0 + var_156_1 * var_156_1)
end

function slot_0_143_0(arg_157_0, arg_157_1)
	local var_157_0 = arg_157_0.x - arg_157_1.x
	local var_157_1 = arg_157_0.y - arg_157_1.y
	local var_157_2 = arg_157_0.z - arg_157_1.z

	return slot_0_0_0.sqrt(var_157_0 * var_157_0 + var_157_1 * var_157_1 + var_157_2 * var_157_2)
end

function slot_0_144_0(arg_158_0)
	local var_158_0 = slot_0_0_0.rad(arg_158_0.x)
	local var_158_1 = slot_0_0_0.rad(arg_158_0.y)
	local var_158_2 = slot_0_0_0.cos(var_158_0)

	return Vector(var_158_2 * slot_0_0_0.cos(var_158_1), var_158_2 * slot_0_0_0.sin(var_158_1), -slot_0_0_0.sin(var_158_0))
end

function slot_0_145_0(arg_159_0, arg_159_1, arg_159_2, arg_159_3)
	arg_159_0.font = draw.fonts.gui_main

	local var_159_0 = #arg_159_2 * 8
	local var_159_1 = 16
	local var_159_2 = 12
	local var_159_3 = 22
	local var_159_4 = var_159_1 + var_159_0 + var_159_2
	local var_159_5 = slot_0_0_0.floor(arg_159_1.x - var_159_4 / 2)
	local var_159_6 = slot_0_0_0.floor(arg_159_1.y - 12 - var_159_3)
	local var_159_7 = draw.Rect(var_159_5, var_159_6, var_159_5 + var_159_4, var_159_6 + var_159_3)
	local var_159_8 = draw.Color(12, 12, 18, 220)

	arg_159_0:AddRectFilledRounded(var_159_7, var_159_8, 4, draw.Rounding.ALL)
	arg_159_0:AddRectFilled(draw.Rect(var_159_5 + 4, var_159_6 + 4, var_159_5 + 6, var_159_6 + var_159_3 - 4), arg_159_3)
	arg_159_0:AddText(draw.Vec2(var_159_5 + var_159_1, var_159_6 + 4), arg_159_2, draw.Color(220, 225, 240, 255))
end

function slot_0_146_0(arg_160_0, arg_160_1, arg_160_2)
	local var_160_0 = math.WorldToScreen(arg_160_0)
	local var_160_1 = math.WorldToScreen(arg_160_1)

	if not var_160_0 or not var_160_1 then
		return
	end

	local var_160_2 = draw.surface
	local var_160_3 = (math.sin(game.globalVars.m_flRealTime * 10) + 1) * 0.5
	local var_160_4 = slot_0_0_0.floor(arg_160_2:GetA() * (0.6 + var_160_3 * 0.4))
	local var_160_5 = draw.Color(arg_160_2:GetR(), arg_160_2:GetG(), arg_160_2:GetB(), var_160_4)

	var_160_2:AddLine(var_160_0, var_160_1, var_160_5, 3)
	var_160_2:AddLine(var_160_0, var_160_1, draw.Color(255, 255, 255, var_160_4), 1)

	local var_160_6 = 8

	for iter_160_0 = 0, var_160_6 do
		local var_160_7 = (iter_160_0 / var_160_6 + game.globalVars.m_flRealTime * 0.5) % 1
		local var_160_8 = Vector(arg_160_0.x + (arg_160_1.x - arg_160_0.x) * var_160_7, arg_160_0.y + (arg_160_1.y - arg_160_0.y) * var_160_7, arg_160_0.z + (arg_160_1.z - arg_160_0.z) * var_160_7)
		local var_160_9 = math.WorldToScreen(var_160_8)

		if var_160_9 then
			var_160_2:AddRectFilled(draw.Rect(var_160_9.x - 2, var_160_9.y - 2, var_160_9.x + 2, var_160_9.y + 2), var_160_5)
		end
	end
end

slot_0_147_0 = draw.Color(255, 0, 0, 255)
slot_0_148_0 = draw.Color(0, 255, 0, 255)
slot_0_149_0 = draw.Color(255, 255, 0, 255)
slot_0_150_0 = draw.Color(255, 255, 255, 255)
slot_0_151_0 = draw.Color(255, 255, 0, 100)
slot_0_152_0 = draw.Color(255, 255, 255, 200)

function slot_0_153_0()
	if not slot_0_54_0.wpEnabled or not slot_0_54_0.wpEnabled:Get() then
		return
	end

	if #slot_0_136_0 == 0 then
		return
	end

	if not slot_0_90_0() then
		return
	end

	local var_161_0 = entities.GetLocalPawn()

	if not var_161_0 or not var_161_0:IsAlive() then
		return
	end

	local var_161_1 = var_161_0:GetAbsOrigin()

	if not var_161_1 then
		return
	end

	local var_161_2 = game.globalVars.m_szMapName or ""
	local var_161_3 = draw.surface

	var_161_3.font = draw.fonts.gui_main

	local var_161_4 = {}
	local var_161_5 = #slot_0_136_0

	for iter_161_0 = 1, var_161_5 do
		local var_161_6 = slot_0_136_0[iter_161_0]

		if var_161_6.m == var_161_2 and slot_0_142_0(var_161_6.p, var_161_1) < slot_0_137_0 then
			var_161_4[iter_161_0] = true

			local var_161_7 = iter_161_0 % 2 == 1 and iter_161_0 + 1 or iter_161_0 - 1

			if var_161_7 >= 1 and var_161_7 <= var_161_5 then
				var_161_4[var_161_7] = true
			end
		end
	end

	if slot_0_14_0 % 4 == 0 then
		if not var_161_0.m_iTeamNum or not var_161_0.m_iTeamNum:Get() then
			local var_161_8 = 0
		end

		entities.players:ForEach(function(arg_162_0)
			if not arg_162_0 then
				return
			end

			local var_162_0 = arg_162_0.entity ~= nil and arg_162_0.entity or arg_162_0

			if not var_162_0 or not var_162_0.IsAlive or not var_162_0:IsAlive() then
				return
			end

			if not var_162_0.IsEnemy or not var_162_0:IsEnemy() then
				return
			end

			local var_162_1 = var_162_0:GetAbsOrigin()

			if not var_162_1 then
				return
			end

			for iter_162_0 = 1, var_161_5 do
				if not var_161_4[iter_162_0] and slot_0_136_0[iter_162_0].m == var_161_2 and slot_0_142_0(slot_0_136_0[iter_162_0].p, var_162_1) < slot_0_137_0 then
					var_161_4[iter_162_0] = true

					local var_162_2 = iter_162_0 % 2 == 1 and iter_162_0 + 1 or iter_162_0 - 1

					if var_162_2 >= 1 and var_162_2 <= var_161_5 then
						var_161_4[var_162_2] = true
					end
				end
			end
		end)
	end

	for iter_161_1 = 1, var_161_5 do
		local var_161_9 = slot_0_136_0[iter_161_1]

		if var_161_9.m ~= var_161_2 then
			-- block empty
		elseif not (slot_0_142_0(var_161_9.p, var_161_1) < slot_0_138_0 or var_161_4[iter_161_1]) then
			-- block empty
		else
			local var_161_10 = math.WorldToScreen(var_161_9.p)

			if not var_161_10 then
				-- block empty
			else
				if var_161_4[iter_161_1] then
					local var_161_11 = iter_161_1 % 2 == 1 and iter_161_1 + 1 or iter_161_1 - 1

					if var_161_11 >= 1 and var_161_11 <= var_161_5 and slot_0_136_0[var_161_11].m == var_161_2 then
						slot_0_146_0(var_161_9.p, slot_0_136_0[var_161_11].p, slot_0_152_0)
					end
				end

				local var_161_12 = slot_0_147_0
				local var_161_13 = iter_161_1 % 2 == 1 and iter_161_1 + 1 or iter_161_1 - 1

				if var_161_4[iter_161_1] then
					var_161_12 = slot_0_148_0
				elseif var_161_13 >= 1 and var_161_13 <= var_161_5 and var_161_4[var_161_13] then
					var_161_12 = slot_0_149_0
				end

				var_161_3:AddRectFilled(draw.Rect(var_161_10.x - 5, var_161_10.y - 5, var_161_10.x + 5, var_161_10.y + 5), var_161_12)

				if var_161_4[iter_161_1] then
					var_161_3:AddRect(draw.Rect(var_161_10.x - 7, var_161_10.y - 7, var_161_10.x + 7, var_161_10.y + 7), slot_0_151_0)
					var_161_3:AddRect(draw.Rect(var_161_10.x - 8, var_161_10.y - 8, var_161_10.x + 8, var_161_10.y + 8), slot_0_151_0)
				end
			end
		end
	end
end

function slot_0_154_0()
	if not slot_0_54_0.nadeEnabled or not slot_0_54_0.nadeEnabled:Get() then
		return
	end

	if #slot_0_36_0 == 0 then
		return
	end

	if not slot_0_90_0() then
		return
	end

	slot_163_0_0 = entities.GetLocalPawn()

	if not slot_163_0_0 or not slot_163_0_0:IsAlive() then
		return
	end

	slot_163_1_0 = slot_163_0_0:GetAbsOrigin()

	if not slot_163_1_0 then
		return
	end

	slot_163_2_0 = slot_0_141_0()

	if not slot_163_2_0 then
		return
	end

	if not game.globalVars.m_szMapName then
		slot_163_3_0 = ""
	end

	slot_163_4_0 = draw.surface
	slot_163_4_0.font = draw.fonts.gui_main
	slot_163_5_0 = (math.sin(game.globalVars.m_flRealTime * 5) + 1) * 0.5
	slot_163_6_0 = draw.Color(255, 255, 255, slot_0_0_0.floor(100 + slot_163_5_0 * 155))

	for iter_163_0, iter_163_1 in ipairs(slot_0_36_0) do
		slot_163_12_0 = game.globalVars.m_szMapName or ""

		if iter_163_1.m ~= slot_163_12_0 and iter_163_1.m ~= "unknown" then
			-- block empty
		elseif iter_163_1.type ~= slot_163_2_0 then
			-- block empty
		else
			slot_163_13_0 = slot_0_142_0(iter_163_1.p, slot_163_1_0)

			if slot_163_13_0 > 3000 then
				-- block empty
			else
				slot_163_14_0 = Vector(iter_163_1.p.x, iter_163_1.p.y, iter_163_1.p.z + 20)
				slot_163_15_0 = math.WorldToScreen(slot_163_14_0)

				if slot_163_15_0 then
					slot_163_17_0 = slot_163_13_0 < slot_0_139_0 and slot_0_148_0 or draw.Color(0, 255, 255, 255)

					slot_0_145_0(slot_163_4_0, slot_163_15_0, iter_163_1.l, slot_163_17_0)

					if slot_163_13_0 < slot_0_139_0 then
						slot_163_18_0 = slot_0_144_0(iter_163_1.va)
						slot_163_19_0 = slot_163_0_0:GetEyePos()

						if slot_163_19_0 then
							slot_163_20_0 = Vector(slot_163_19_0.x + slot_163_18_0.x * 120, slot_163_19_0.y + slot_163_18_0.y * 120, slot_163_19_0.z + slot_163_18_0.z * 120)
							slot_163_21_0 = math.WorldToScreen(slot_163_20_0)

							if slot_163_21_0 then
								slot_163_22_0 = 5 + (math.sin(game.globalVars.m_flRealTime * 10) + 1) * 2

								for iter_163_2 = 1, 8 do
									slot_163_27_0 = (iter_163_2 - 1) * (math.pi / 4)
									slot_163_28_0 = iter_163_2 * (math.pi / 4)

									slot_163_4_0:AddLine(draw.Vec2(slot_163_21_0.x + math.cos(slot_163_27_0) * slot_163_22_0, slot_163_21_0.y + math.sin(slot_163_27_0) * slot_163_22_0), draw.Vec2(slot_163_21_0.x + math.cos(slot_163_28_0) * slot_163_22_0, slot_163_21_0.y + math.sin(slot_163_28_0) * slot_163_22_0), slot_163_6_0, 2)
								end

								slot_163_4_0:AddRectFilled(draw.Rect(slot_163_21_0.x - 1, slot_163_21_0.y - 1, slot_163_21_0.x + 1, slot_163_21_0.y + 1), slot_163_6_0)
							end
						end
					end
				end
			end
		end
	end
end

function slot_0_1_0(arg_164_0)
	if arg_164_0 == weapon_id.awp or arg_164_0 == 9 then
		return "AWP"
	end

	if arg_164_0 == weapon_id.ssg08 or arg_164_0 == 3 then
		return "SSG-08"
	end

	if arg_164_0 == weapon_id.r8 or arg_164_0 == 64 then
		return "R8 Revolver"
	end

	if arg_164_0 == weapon_id.deagle or arg_164_0 == 1 then
		return "Desert Eagle"
	end

	if arg_164_0 == weapon_id.scar20 or arg_164_0 == 34 or arg_164_0 == weapon_id.g3sg1 or arg_164_0 == 11 then
		return "Auto Snipers"
	end

	if arg_164_0 == weapon_id.ak47 or arg_164_0 == 7 then
		return "AK-47"
	end

	if arg_164_0 == weapon_id.p2000 then
		return "P2000"
	end

	if arg_164_0 == weapon_id.galilar or arg_164_0 == 13 or arg_164_0 == weapon_id.famas or arg_164_0 == 10 or arg_164_0 == weapon_id.m4a1 or arg_164_0 == 16 or arg_164_0 == 60 or arg_164_0 == weapon_id.aug or arg_164_0 == 8 or arg_164_0 == weapon_id.sg556 or arg_164_0 == 39 then
		return "Rifles"
	end

	if arg_164_0 == weapon_id.mp9 or arg_164_0 == 35 or arg_164_0 == weapon_id.mp7 or arg_164_0 == 33 or arg_164_0 == weapon_id.uzi or arg_164_0 == 61 or arg_164_0 == weapon_id.p90 or arg_164_0 == 19 or arg_164_0 == weapon_id.bizon or arg_164_0 == 26 or arg_164_0 == weapon_id.ump45 or arg_164_0 == 24 or arg_164_0 == weapon_id.mp5sd or arg_164_0 == 23 then
		return "SMGs"
	end

	if arg_164_0 == weapon_id.nova or arg_164_0 == 36 or arg_164_0 == weapon_id.xm1014 or arg_164_0 == 25 or arg_164_0 == weapon_id.mag7 or arg_164_0 == 27 or arg_164_0 == weapon_id.sawedoff or arg_164_0 == 29 or arg_164_0 == weapon_id.m249 or arg_164_0 == 14 or arg_164_0 == weapon_id.negev or arg_164_0 == 28 then
		return "Heavy"
	end

	if arg_164_0 == weapon_id.glock or arg_164_0 == weapon_id.usp_s or arg_164_0 == weapon_id.p250 or arg_164_0 == weapon_id.cz75 or arg_164_0 == weapon_id.dualberettas or arg_164_0 == weapon_id.tec9 or arg_164_0 == weapon_id.fiveseven then
		return "Pistols"
	end

	if arg_164_0 >= 2 and arg_164_0 <= 6 then
		return "Pistols"
	end

	return "general"
end

function slot_0_2_0(arg_165_0, arg_165_1, arg_165_2)
	if arg_165_0 then
		if arg_165_1 == "general" then
			return "rage>weapon>general>weapon>" .. arg_165_2
		else
			return "rage>weapon>" .. arg_165_1 .. ">weapon>" .. arg_165_2
		end
	elseif arg_165_1 == "general" then
		return "legit>weapon>general>trigger>" .. arg_165_2
	else
		return "legit>weapon>" .. arg_165_1 .. ">trigger>" .. arg_165_2
	end
end

;(function()
	for iter_166_0 = 1, #slot_0_20_0 do
		local var_166_0 = slot_0_20_0[iter_166_0]
		local var_166_1 = slot_0_2_0(true, var_166_0, "mindamage")
		local var_166_2 = slot_0_2_0(false, var_166_0, "mindamage")
		local var_166_3 = slot_0_2_0(true, var_166_0, "hitchance")
		local var_166_4 = slot_0_2_0(false, var_166_0, "hitchance")
		local var_166_5 = "rage>weapon>" .. (var_166_0 == "general" and "general>weapon" or var_166_0 .. ">weapon") .. ">target selection"

		slot_0_19_0.md.rage[var_166_0] = gui.ctx:Find(var_166_1)
		slot_0_19_0.md.legit[var_166_0] = gui.ctx:Find(var_166_2)
		slot_0_19_0.hc.rage[var_166_0] = gui.ctx:Find(var_166_3)
		slot_0_19_0.hc.legit[var_166_0] = gui.ctx:Find(var_166_4)
		slot_0_19_0.ts[var_166_0] = gui.ctx:Find(var_166_5)
	end
end)()

function slot_0_4_0()
	if not slot_0_54_0.accBoostLevel then
		return
	end

	local var_167_0 = entities.GetLocalPawn()
	local var_167_1 = 0

	if var_167_0 and var_167_0:IsAlive() then
		local var_167_2 = var_167_0:GetAbsVelocity()

		if var_167_2 then
			var_167_1 = slot_0_0_0.sqrt(var_167_2.x * var_167_2.x + var_167_2.y * var_167_2.y)
		end
	end

	local var_167_3 = 0
	local var_167_4 = slot_0_54_0.accBoostLevel:Get()

	if var_167_4 then
		if type(var_167_4) == "number" then
			var_167_3 = var_167_4
		else
			for iter_167_0 = 0, 4 do
				if var_167_4:Get(iter_167_0) then
					var_167_3 = iter_167_0

					break
				end
			end
		end
	end

	if var_167_3 >= 3 and var_167_1 > 49 then
		slot_0_21_0.active = true

		for iter_167_1 = 1, #slot_0_20_0 do
			local var_167_5 = slot_0_20_0[iter_167_1]
			local var_167_6 = slot_0_19_0.ts[var_167_5]

			if var_167_6 then
				local var_167_7 = var_167_6:Get()
				local var_167_8 = false

				if var_167_7 and type(var_167_7) == "userdata" and var_167_7.Get then
					var_167_8 = var_167_7:Get(2)

					if var_167_8 then
						for iter_167_2 = 0, 8 do
							if iter_167_2 ~= 2 and var_167_7:Get(iter_167_2) then
								var_167_8 = false

								break
							end
						end
					end
				end

				if not var_167_8 then
					if slot_0_21_0.saved[var_167_5] == nil and var_167_7 and type(var_167_7) == "userdata" and var_167_7.Get then
						local var_167_9 = 0

						for iter_167_3 = 0, 8 do
							if var_167_7:Get(iter_167_3) then
								var_167_9 = var_167_9 + 2^iter_167_3
							end
						end

						slot_0_21_0.saved[var_167_5] = var_167_9
					end

					if var_167_7 and type(var_167_7) == "userdata" and var_167_7.Set then
						var_167_7:Reset()
						var_167_7:Set(2)

						local var_167_10 = var_167_6:GetValue()

						if var_167_10 and var_167_10.Set then
							var_167_10:Set(var_167_7)

							if var_167_6.Reset then
								var_167_6:Reset()
							end
						end
					end
				end
			end
		end
	elseif slot_0_21_0.active then
		slot_0_21_0.active = false

		for iter_167_4 = 1, #slot_0_20_0 do
			local var_167_11 = slot_0_20_0[iter_167_4]
			local var_167_12 = slot_0_19_0.ts[var_167_11]

			if var_167_12 and slot_0_21_0.saved[var_167_11] ~= nil then
				local var_167_13 = var_167_12:GetValue()
				local var_167_14 = var_167_12:Get()

				if var_167_13 and var_167_13.Set and var_167_14 and var_167_14.Set then
					local var_167_15 = slot_0_21_0.saved[var_167_11]

					var_167_14:Reset()

					for iter_167_5 = 0, 8 do
						if bit.band(var_167_15, 2^iter_167_5) ~= 0 then
							var_167_14:Set(iter_167_5)
						end
					end

					var_167_13:Set(var_167_14)

					if var_167_12.Reset then
						var_167_12:Reset()
					end
				end

				slot_0_21_0.saved[var_167_11] = nil
			end
		end
	end
end

slot_0_156_0 = 0

events.createMove:Add(function(arg_168_0)
	if not slot_0_54_0.fnsTrigger or not slot_0_54_0.fnsTrigger:Get() then
		return
	end

	if not slot_0_22_0(slot_0_18_0.rageEnable) then
		return
	end

	local var_168_0 = gui.ctx:Find("rage>aimbot>nospread")
	local var_168_1 = gui.ctx:Find("rage>aimbot>nospread>settings>force")

	if not var_168_0 or not slot_0_22_0(var_168_0) then
		return
	end

	if not var_168_1 or not slot_0_22_0(var_168_1) then
		return
	end

	if not slot_0_90_0() then
		return
	end

	local var_168_2 = entities.GetLocalPawn()

	if not var_168_2 or not var_168_2:IsAlive() then
		return
	end

	if not slot_0_61_0() then
		return
	end

	local var_168_3 = var_168_2:GetActiveWeapon()

	if not var_168_3 then
		return
	end

	local var_168_4 = var_168_3:ToWeaponBaseGun()
	local var_168_5 = var_168_4 and var_168_4:GetDefIndex() or 0
	local var_168_6 = var_168_2:GetEyePos()

	if not var_168_6 then
		return
	end

	local var_168_7 = arg_168_0:GetViewangles()
	local var_168_8 = slot_0_0_0.rad(var_168_7.x)
	local var_168_9 = slot_0_0_0.rad(var_168_7.y)
	local var_168_10 = slot_0_0_0.cos(var_168_8) * slot_0_0_0.cos(var_168_9)
	local var_168_11 = slot_0_0_0.cos(var_168_8) * slot_0_0_0.sin(var_168_9)
	local var_168_12 = -slot_0_0_0.sin(var_168_8)
	local var_168_13 = Vector(var_168_10 * 8192, var_168_11 * 8192, var_168_12 * 8192)
	local var_168_14 = var_168_2.m_iTeamNum and var_168_2.m_iTeamNum:Get() or 0
	local var_168_15 = false
	local var_168_16 = slot_0_22_0(slot_0_18_0.rageAwall)
	local var_168_17 = slot_0_1_0(var_168_5)
	local var_168_18 = slot_0_18_0.mdGeneral

	if var_168_17 == "SSG-08" then
		var_168_18 = slot_0_18_0.mdSsg
	elseif var_168_17 == "AWP" then
		var_168_18 = slot_0_18_0.mdAwp
	elseif var_168_17 == "R8 Revolver" then
		var_168_18 = slot_0_18_0.mdR8
	elseif var_168_17 == "Desert Eagle" then
		var_168_18 = slot_0_18_0.mdDeagle
	elseif var_168_17 == "Auto Snipers" then
		var_168_18 = slot_0_18_0.mdAuto
	elseif var_168_17 == "Heavy" then
		var_168_18 = slot_0_18_0.mdHeavy
	elseif var_168_17 == "Rifles" then
		var_168_18 = slot_0_18_0.mdRifles
	elseif var_168_17 == "SMGs" then
		var_168_18 = slot_0_18_0.mdSmgs
	elseif var_168_17 == "Pistols" then
		var_168_18 = slot_0_18_0.mdPistols
	end

	local var_168_19 = 1

	if var_168_18 then
		local var_168_20 = var_168_18:Get()

		if type(var_168_20) == "number" then
			var_168_19 = slot_0_0_0.floor(var_168_20)
		end
	end

	entities.players:ForEach(function(arg_169_0)
		if var_168_15 then
			return
		end

		if not arg_169_0 then
			return
		end

		local var_169_0 = arg_169_0.entity ~= nil and arg_169_0.entity or arg_169_0

		if not var_169_0 or var_169_0 == var_168_2 then
			return
		end

		if not var_169_0.IsAlive or not var_169_0:IsAlive() then
			return
		end

		if (var_169_0.m_iTeamNum and var_169_0.m_iTeamNum:Get() or 0) == var_168_14 then
			return
		end

		local var_169_1 = var_169_0.m_iHealth or 100

		if type(var_169_1) == "userdata" then
			var_169_1 = var_169_1:Get() or 100
		end

		local var_169_2 = slot_0_0_0.max(1, var_169_1)
		local var_169_3 = var_168_19

		if var_168_19 > 100 then
			var_169_3 = var_169_2 + (var_168_19 - 100)
		end

		local var_169_4 = slot_0_0_0.min(var_169_3, var_169_2)
		local var_169_5, var_169_6 = mods.penetration.FireBullet(var_168_6, var_168_13, var_168_3, var_169_0, false, false)

		if var_169_6 and var_169_6.damage and var_169_4 <= var_169_6.damage then
			local var_169_7 = var_168_13 / var_168_13:Length()
			local var_169_8 = -1
			local var_169_9 = 9999

			for iter_169_0 = 0, 18 do
				local var_169_10 = var_169_0:GetHitboxCenter(iter_169_0)

				if var_169_10 then
					local var_169_11 = slot_0_8_0(var_169_10, var_168_6, var_169_7)

					if var_169_11 < var_169_9 then
						var_169_9 = var_169_11
						var_169_8 = iter_169_0
					end
				end
			end

			local var_169_12 = false

			if var_169_8 ~= -1 and var_169_9 <= 0.5 + 0.8 * ((var_169_8 == 0 and 4.2 or 9.5) - 0.5) then
				var_169_12 = true
			end

			if var_169_12 then
				if var_168_16 then
					var_168_15 = true
				else
					local var_169_13 = var_169_0:GetAbsOrigin()

					if var_169_13 then
						local var_169_14 = var_169_13.x - var_168_6.x
						local var_169_15 = var_169_13.y - var_168_6.y
						local var_169_16 = var_169_13.z - var_168_6.z
						local var_169_17 = slot_0_0_0.sqrt(var_169_14 * var_169_14 + var_169_15 * var_169_15 + var_169_16 * var_169_16)
						local var_169_18, var_169_19 = slot_0_76_0(var_168_6, Vector(var_168_10, var_168_11, var_168_12), var_169_17 + 100)

						if not var_169_18 or var_169_19 >= var_169_17 * 0.7 then
							var_168_15 = true
						end
					end
				end
			end
		end
	end)

	if var_168_15 then
		local var_168_21 = game.globalVars.m_flRealTime or 0

		if var_168_21 - slot_0_156_0 >= 0.01 or var_168_21 < slot_0_156_0 then
			if var_168_5 == weapon_id.r8 or var_168_5 == 64 then
				arg_168_0:SetButton(InputBitMask_t.IN_ATTACK2)
			else
				arg_168_0:SetButton(InputBitMask_t.IN_ATTACK)
			end

			slot_0_156_0 = var_168_21
		end
	end
end)

slot_0_157_0 = {
	savedAng = nil,
	active = false,
	pos = Vector(0, 0, 0)
}
slot_0_158_0 = {}
slot_0_159_0 = {
	true,
	true,
	[65] = true,
	[32] = true,
	[87] = true,
	[17] = true,
	[83] = true,
	[68] = true,
	[16] = true
}

events.createMove:Add(function(arg_170_0)
	local var_170_0 = entities.GetLocalPawn()

	if gui.IsVisible() then
		arg_170_0:RemoveButton(InputBitMask_t.IN_ATTACK)
		arg_170_0:RemoveButton(InputBitMask_t.IN_ATTACK2)
	end

	if slot_0_54_0.freecam and slot_0_54_0.freecam:Get() and var_170_0 and var_170_0:IsAlive() then
		arg_170_0:SetForwardMove(0)
		arg_170_0:SetLeftMove(0)

		if slot_0_157_0.savedAng then
			arg_170_0:SetViewangles(slot_0_157_0.savedAng)
		end

		arg_170_0:RemoveButton(InputBitMask_t.IN_ATTACK)
		arg_170_0:RemoveButton(InputBitMask_t.IN_ATTACK2)
		arg_170_0:RemoveButton(InputBitMask_t.IN_DUCK)
		arg_170_0:RemoveButton(InputBitMask_t.IN_JUMP)
	end
end)
events.input:Add(function(arg_171_0, arg_171_1, arg_171_2)
	local var_171_0 = gui.IsVisible()
	local var_171_1 = slot_0_54_0.freecam and slot_0_54_0.freecam:Get()

	if not var_171_0 and not var_171_1 then
		return false
	end

	if arg_171_0 == 256 or arg_171_0 == 260 then
		if var_171_0 and (arg_171_1 == 1 or arg_171_1 == 2) then
			return true
		end

		if var_171_1 and slot_0_159_0[arg_171_1] then
			slot_0_158_0[arg_171_1] = true

			return true
		end
	end

	if (arg_171_0 == 257 or arg_171_0 == 261) and var_171_1 then
		slot_0_158_0[arg_171_1] = false
	end

	return false
end)
events.overrideView:Add(function(arg_172_0)
	if not arg_172_0 then
		return
	end

	if slot_0_54_0.freecam and slot_0_54_0.freecam:Get() then
		if not slot_0_157_0.active then
			slot_0_157_0.active = true
			slot_0_157_0.pos = Vector(arg_172_0.m_vecOrigin.x, arg_172_0.m_vecOrigin.y, arg_172_0.m_vecOrigin.z)

			local var_172_0 = game.input:GetViewAngles()

			if var_172_0 then
				slot_0_157_0.savedAng = Vector(var_172_0.x, var_172_0.y, 0)
			end
		end

		if slot_0_157_0.pos then
			local var_172_1 = game.input:GetViewAngles()

			if var_172_1 then
				local var_172_2 = slot_0_0_0.rad(var_172_1.x)
				local var_172_3 = slot_0_0_0.rad(var_172_1.y)
				local var_172_4 = slot_0_0_0.cos(var_172_2)
				local var_172_5 = slot_0_0_0.sin(var_172_2)
				local var_172_6 = slot_0_0_0.cos(var_172_3)
				local var_172_7 = slot_0_0_0.sin(var_172_3)
				local var_172_8 = Vector(var_172_4 * var_172_6, var_172_4 * var_172_7, -var_172_5)
				local var_172_9 = Vector(var_172_7, -var_172_6, 0)
				local var_172_10 = Vector(var_172_5 * var_172_6, var_172_5 * var_172_7, var_172_4)
				local var_172_11 = 400 * (game.globalVars.m_flFrameTime or 0.016)

				if slot_0_158_0[16] then
					var_172_11 = var_172_11 * 0.6
				end

				local var_172_12 = 0
				local var_172_13 = 0
				local var_172_14 = 0

				if slot_0_158_0[87] then
					var_172_12 = var_172_12 + 1
				end

				if slot_0_158_0[83] then
					var_172_12 = var_172_12 - 1
				end

				if slot_0_158_0[68] then
					var_172_13 = var_172_13 + 1
				end

				if slot_0_158_0[65] then
					var_172_13 = var_172_13 - 1
				end

				if slot_0_158_0[32] then
					var_172_14 = var_172_14 + 1
				end

				if slot_0_158_0[17] then
					var_172_14 = var_172_14 - 1
				end

				if var_172_12 ~= 0 or var_172_13 ~= 0 or var_172_14 ~= 0 then
					slot_0_157_0.pos.x = slot_0_157_0.pos.x + (var_172_8.x * var_172_12 + var_172_9.x * var_172_13 + var_172_10.x * var_172_14) * var_172_11
					slot_0_157_0.pos.y = slot_0_157_0.pos.y + (var_172_8.y * var_172_12 + var_172_9.y * var_172_13 + var_172_10.y * var_172_14) * var_172_11
					slot_0_157_0.pos.z = slot_0_157_0.pos.z + (var_172_8.z * var_172_12 + var_172_9.z * var_172_13 + var_172_10.z * var_172_14) * var_172_11
				end
			end

			arg_172_0.m_vecOrigin.x = slot_0_157_0.pos.x
			arg_172_0.m_vecOrigin.y = slot_0_157_0.pos.y
			arg_172_0.m_vecOrigin.z = slot_0_157_0.pos.z
		end
	else
		slot_0_157_0.active = false
		slot_0_157_0.pos = nil
		slot_0_157_0.savedAng = nil
	end
end)

slot_0_160_0 = {
	enabled = false,
	ms = 200,
	fired = false
}
slot_0_161_0 = Vector(0, 0, 0)

events.createMove:Add(function(arg_173_0)
	slot_0_160_0.enabled = slot_0_29_0.dsEnabled or false
	slot_0_160_0.ms = slot_0_29_0.dsMs or 200

	local var_173_0 = 180

	if slot_0_18_0.afFov then
		local var_173_1 = slot_0_18_0.afFov:Get()

		if type(var_173_1) == "number" then
			var_173_0 = var_173_1
		elseif type(var_173_1) == "userdata" and var_173_1.Get then
			local var_173_2 = var_173_1:Get()

			if type(var_173_2) == "number" then
				var_173_0 = var_173_2
			end
		end
	end

	local var_173_3 = arg_173_0:GetViewangles()

	if var_173_3 then
		slot_0_161_0 = var_173_3
	end

	if slot_0_160_0.enabled and slot_0_18_0.af and not slot_0_160_0.fired then
		slot_0_23_0(slot_0_18_0.af, false)
	end

	if not slot_0_160_0.enabled then
		if slot_0_160_0.fired and slot_0_18_0.af then
			slot_0_23_0(slot_0_18_0.af, false)
		end

		slot_0_160_0.timer = nil
		slot_0_160_0.fired = false

		return
	end

	if not game.engine:IsConnected() or not game.engine:InGame() then
		slot_0_160_0.timer = nil
		slot_0_160_0.fired = false

		if slot_0_18_0.af then
			slot_0_23_0(slot_0_18_0.af, false)
		end

		return
	end

	if not slot_0_61_0() then
		slot_0_160_0.timer = nil
		slot_0_160_0.fired = false

		if slot_0_18_0.af then
			slot_0_23_0(slot_0_18_0.af, false)
		end

		return
	end

	local var_173_4 = entities.GetLocalPawn()

	if not var_173_4 or not var_173_4:IsAlive() then
		return
	end

	local var_173_5 = var_173_4:GetActiveWeapon()

	if not var_173_5 then
		return
	end

	local var_173_6 = var_173_5:ToWeaponBaseGun()

	if not var_173_6 or not var_173_6:GetDefIndex() then
		local var_173_7 = 0
	end

	local var_173_8 = var_173_4:GetEyePos()
	local var_173_9 = game.globalVars.m_flRealTime or 0
	local var_173_10 = var_173_4.m_iTeamNum and var_173_4.m_iTeamNum:Get() or 0
	local var_173_11 = false

	if var_173_8 then
		local var_173_12 = slot_0_161_0

		entities.players:ForEach(function(arg_174_0)
			if var_173_11 then
				return
			end

			if not arg_174_0 then
				return
			end

			local var_174_0 = arg_174_0.entity ~= nil and arg_174_0.entity or arg_174_0

			if not var_174_0 or not var_174_0:IsAlive() then
				return
			end

			if (var_174_0.m_iTeamNum and var_174_0.m_iTeamNum:Get() or 0) == var_173_10 then
				return
			end

			local var_174_1 = var_174_0:GetHitboxCenter(0)

			if not var_174_1 then
				return
			end

			local var_174_2 = math.CalcAngle(var_173_8, var_174_1)
			local var_174_3 = math.AngleNormalize(var_174_2.x - var_173_12.x)
			local var_174_4 = math.AngleNormalize(var_174_2.y - var_173_12.y)
			local var_174_5 = slot_0_0_0.sqrt(var_174_3 * var_174_3 + var_174_4 * var_174_4)

			if var_174_5 > var_173_0 then
				return
			end

			local var_174_6 = var_174_0:GetHitboxCenter(5) or var_174_1
			local var_174_7 = var_174_1

			if var_174_6 then
				local var_174_8 = math.CalcAngle(var_173_8, var_174_6)
				local var_174_9 = math.AngleNormalize(var_174_8.x - var_173_12.x)
				local var_174_10 = math.AngleNormalize(var_174_8.y - var_173_12.y)

				if var_174_5 > slot_0_0_0.sqrt(var_174_9 * var_174_9 + var_174_10 * var_174_10) then
					var_174_7 = var_174_6
				end
			end

			local var_174_11 = Ray_t()
			local var_174_12 = game.physicsQueryInterface:TraceRay(var_174_11, var_173_8, var_174_7, false)

			if var_174_12 and var_174_12.m_flFraction and var_174_12.m_flFraction >= 0.7 then
				var_173_11 = true
			end
		end)
	end

	if var_173_11 then
		if not slot_0_160_0.timer then
			slot_0_160_0.timer = var_173_9
			slot_0_160_0.fired = false
		end

		if (var_173_9 - slot_0_160_0.timer) * 1000 >= slot_0_160_0.ms and not slot_0_160_0.fired then
			slot_0_160_0.fired = true

			if slot_0_18_0.af then
				slot_0_23_0(slot_0_18_0.af, true)
			end
		end
	else
		slot_0_160_0.timer = nil

		if slot_0_160_0.fired then
			slot_0_160_0.fired = false

			if slot_0_18_0.af then
				slot_0_23_0(slot_0_18_0.af, false)
			end
		end
	end
end)

slot_0_162_0 = ffi
slot_0_163_0 = {
	isInit = false,
	isActive = false
}
slot_0_164_0 = {
	lastNat = 0,
	startTime = 0,
	duration = 0,
	active = false,
	[0] = nil
}

function slot_0_165_0(arg_175_0)
	if not arg_175_0 then
		return 0
	end

	local var_175_0 = arg_175_0:GetActiveWeapon()

	if not var_175_0 then
		return 0
	end

	local var_175_1 = var_175_0:ToWeaponBaseGun()

	if not var_175_1 then
		return 0
	end

	return var_175_1:IsAttackable() and 0 or 0.1
end

function slot_0_166_0(arg_176_0)
	if not arg_176_0 then
		return
	end

	local var_176_0 = Schema:get(arg_176_0, "m_nNextPrimaryAttackTick", "int*")

	if type(var_176_0) ~= "number" or var_176_0 <= 0 then
		return
	end

	local var_176_1 = game.globalVars
	local var_176_2 = var_176_1.m_iTickCount or 0
	local var_176_3 = var_176_1.m_flRealTime or 0

	if var_176_2 < var_176_0 then
		local var_176_4 = (var_176_0 - var_176_2) * 0.015625

		if var_176_4 > 0 then
			slot_0_164_0.active = true
			slot_0_164_0.startTime = var_176_3
			slot_0_164_0.duration = var_176_4
		end
	end
end

events.event:Add(function(arg_177_0)
	if arg_177_0:GetName() ~= "weapon_fire" then
		return
	end

	local var_177_0 = entities.GetLocalController()
	local var_177_1 = arg_177_0:GetController("userid")

	if var_177_1 and var_177_1 == var_177_0 then
		local var_177_2 = entities.GetLocalPawn()

		if var_177_2 then
			slot_0_166_0(var_177_2:GetActiveWeapon())
		end
	end
end)

slot_0_167_0 = {}
slot_0_168_0 = 0.12

events.presentQueue:Add(function()
	local var_178_0 = entities.GetLocalPawn()

	if not var_178_0 then
		return
	end

	local var_178_1 = game.globalVars and game.globalVars.m_flRealTime or 0
	local var_178_2 = var_178_0.m_iTeamNum and var_178_0.m_iTeamNum:Get() or 0

	entities.players:ForEach(function(arg_179_0)
		if not arg_179_0 then
			return
		end

		local var_179_0 = arg_179_0.entity ~= nil and arg_179_0.entity or arg_179_0

		if not var_179_0 or var_179_0 == var_178_0 then
			return
		end

		if not var_179_0.IsAlive or not var_179_0:IsAlive() then
			return
		end

		if (var_179_0.m_iTeamNum and var_179_0.m_iTeamNum:Get() or 0) == var_178_2 then
			return
		end

		local var_179_1 = var_179_0.GetIndex and var_179_0:GetIndex() or tostring(var_179_0)

		if not slot_0_167_0[var_179_1] then
			slot_0_167_0[var_179_1] = {}
		end

		local var_179_2 = var_179_0:GetHitboxCenter(0)
		local var_179_3 = var_179_0:GetHitboxCenter(5)

		if not var_179_2 and not var_179_3 then
			return
		end

		local var_179_4 = {}

		if var_179_2 then
			var_179_4[1] = var_179_2
		end

		if var_179_3 then
			var_179_4[#var_179_4 + 1] = var_179_3
		end

		local var_179_5 = slot_0_167_0[var_179_1]

		var_179_5[#var_179_5 + 1] = {
			[0] = nil,
			time = var_178_1,
			points = var_179_4
		}

		while var_179_5[1] and var_178_1 - var_179_5[1].time > slot_0_168_0 do
			table.remove(var_179_5, 1)
		end
	end)
end)

function slot_0_169_0()
	slot_0_163_0.isActive = true

	if slot_0_18_0.slowwalk then
		local var_180_0 = slot_0_18_0.slowwalk:GetValue()

		if var_180_0 then
			var_180_0:Set(true)
		end
	end

	if slot_0_18_0.slowwalkSpeed then
		local var_180_1 = slot_0_18_0.slowwalkSpeed:GetValue()

		if var_180_1 then
			var_180_1:Set(5)
		end
	end
end

function slot_0_170_0()
	if slot_0_163_0.isActive then
		slot_0_163_0.isActive = false

		if slot_0_18_0.slowwalk then
			local var_181_0 = slot_0_18_0.slowwalk:GetValue()

			if var_181_0 then
				var_181_0:Set(slot_0_163_0.savedWalk)
			end
		end

		if slot_0_18_0.slowwalkSpeed then
			local var_181_1 = slot_0_18_0.slowwalkSpeed:GetValue()

			if var_181_1 then
				var_181_1:Set(slot_0_163_0.savedSpeed)
			end
		end
	end
end

events.createMove:Add(function(arg_182_0)
	slot_182_1_0 = entities.GetLocalPawn()

	if not slot_182_1_0 or not slot_182_1_0:IsAlive() then
		slot_0_170_0()

		return
	end

	slot_182_2_0 = slot_182_1_0:GetActiveWeapon()

	if not slot_182_2_0 then
		slot_0_170_0()

		return
	end

	slot_182_3_0 = slot_182_2_0:ToWeaponBaseGun()

	if not slot_182_3_0 then
		slot_0_170_0()

		return
	end

	slot_182_4_0 = slot_182_3_0:GetDefIndex() or 0
	slot_182_5_0 = slot_0_1_0(slot_182_4_0)

	if slot_182_4_0 == 31 or slot_182_4_0 == 42 or slot_182_4_0 == 59 or slot_182_4_0 >= 43 and slot_182_4_0 <= 48 or slot_182_4_0 >= 500 and slot_182_4_0 <= 526 then
		slot_0_170_0()

		return
	end

	slot_182_6_0 = slot_0_165_0(slot_182_1_0)
	slot_182_8_0 = game.globalVars.m_flRealTime or 0
	slot_182_9_0 = true

	if slot_0_164_0.active and slot_182_8_0 - slot_0_164_0.startTime < slot_0_164_0.duration then
		slot_182_9_0 = false
	elseif slot_182_6_0 > 0.05 then
		slot_182_9_0 = false
	else
		slot_0_164_0.active = false
	end

	if not slot_0_54_0.rageStop or not slot_0_54_0.rageStop:Get() then
		if slot_0_163_0.isInit then
			slot_0_170_0()

			slot_0_163_0.isInit = false
		end

		return
	end

	if not slot_182_9_0 then
		slot_0_170_0()

		return
	end

	if not slot_0_163_0.isInit then
		if slot_0_18_0.slowwalk then
			slot_0_163_0.savedWalk = slot_0_18_0.slowwalk:Get()
		end

		if slot_0_18_0.slowwalkSpeed then
			slot_182_10_1 = slot_0_18_0.slowwalkSpeed:GetValue()
			slot_0_163_0.savedSpeed = slot_182_10_1 and slot_182_10_1:Get() or 25
		end

		slot_0_163_0.isInit = true
	end

	if not slot_0_163_0.isActive and slot_0_18_0.slowwalk and slot_0_18_0.slowwalk:Get() then
		return
	end

	slot_182_10_0 = slot_182_1_0.m_fFlags and slot_182_1_0.m_fFlags:Get() or 0
	slot_182_11_0 = bit.band(slot_182_10_0, 1) ~= 0
	slot_182_12_0 = slot_182_1_0:GetAbsVelocity()
	slot_182_13_0 = slot_182_12_0 and slot_0_0_0.sqrt(slot_182_12_0.x * slot_182_12_0.x + slot_182_12_0.y * slot_182_12_0.y) or 0
	slot_182_14_0 = not slot_182_11_0 and slot_0_54_0.rsInAir and slot_0_54_0.rsInAir:Get() and slot_182_12_0 and slot_0_0_0.abs(slot_182_12_0.z) < 90
	slot_182_15_0 = slot_0_22_0(slot_0_18_0.rageEnable)
	slot_182_16_0 = 0

	if slot_182_15_0 and slot_182_3_0 then
		slot_182_17_1 = slot_182_3_0:GetDefIndex()
		slot_182_18_1 = slot_0_18_0.mdGeneral

		if slot_182_17_1 == weapon_id.ssg08 then
			slot_182_18_1 = slot_0_18_0.mdSsg
		elseif slot_182_17_1 == weapon_id.awp then
			slot_182_18_1 = slot_0_18_0.mdAwp
		elseif slot_182_17_1 == weapon_id.r8 then
			slot_182_18_1 = slot_0_18_0.mdR8
		elseif slot_182_17_1 == weapon_id.deagle then
			slot_182_18_1 = slot_0_18_0.mdDeagle
		elseif slot_182_17_1 == weapon_id.scar20 or slot_182_17_1 == weapon_id.g3sg1 then
			slot_182_18_1 = slot_0_18_0.mdAuto
		elseif slot_182_17_1 == weapon_id.ak47 or slot_182_17_1 == weapon_id.m4a4 or slot_182_17_1 == weapon_id.m4a1s or slot_182_17_1 == weapon_id.galil or slot_182_17_1 == weapon_id.famas or slot_182_17_1 == weapon_id.aug or slot_182_17_1 == weapon_id.sg556 then
			slot_182_18_1 = slot_0_18_0.mdRifles
		elseif slot_182_17_1 == weapon_id.mac10 or slot_182_17_1 == weapon_id.mp9 or slot_182_17_1 == weapon_id.mp7 or slot_182_17_1 == weapon_id.mp5sd or slot_182_17_1 == weapon_id.ump45 or slot_182_17_1 == weapon_id.p90 or slot_182_17_1 == weapon_id.bizon then
			slot_182_18_1 = slot_0_18_0.mdSmgs
		elseif slot_182_17_1 == weapon_id.nova or slot_182_17_1 == weapon_id.xm1014 or slot_182_17_1 == weapon_id.mag7 or slot_182_17_1 == weapon_id.sawedoff or slot_182_17_1 == weapon_id.m249 or slot_182_17_1 == weapon_id.negev then
			slot_182_18_1 = slot_0_18_0.mdHeavy
		elseif slot_182_17_1 == weapon_id.glock or slot_182_17_1 == weapon_id.usp_s or slot_182_17_1 == weapon_id.p2000 or slot_182_17_1 == weapon_id.p250 or slot_182_17_1 == weapon_id.cz75 or slot_182_17_1 == weapon_id.dualberettas or slot_182_17_1 == weapon_id.tec9 or slot_182_17_1 == weapon_id.fiveseven then
			slot_182_18_1 = slot_0_18_0.mdPistols
		end

		if slot_182_18_1 then
			slot_182_16_0 = slot_0_24_0(slot_182_18_1) or 0
		end
	end

	slot_182_17_0 = false
	slot_182_18_0 = slot_182_1_0:GetEyePos()

	if not slot_182_18_0 then
		return
	end

	slot_182_19_0 = arg_182_0:GetViewangles()
	slot_182_20_0 = slot_0_55_0.rsFov and slot_0_55_0.rsFov:GetValue():Get() or 90
	slot_182_21_0 = slot_182_1_0.m_iTeamNum and slot_182_1_0.m_iTeamNum:Get() or 0

	entities.players:ForEach(function(arg_183_0)
		if slot_182_17_0 then
			return
		end

		if not arg_183_0 then
			return
		end

		slot_183_1_0 = arg_183_0.entity ~= nil and arg_183_0.entity or arg_183_0

		if not slot_183_1_0 or slot_183_1_0 == slot_182_1_0 then
			return
		end

		if not slot_183_1_0.IsAlive or not slot_183_1_0:IsAlive() then
			return
		end

		if (slot_183_1_0.m_iTeamNum and slot_183_1_0.m_iTeamNum:Get() or 0) == slot_182_21_0 then
			return
		end

		if not slot_182_11_0 and slot_182_5_0 ~= "SSG-08" then
			slot_183_3_2 = slot_182_1_0:GetAbsOrigin()
			slot_183_4_1 = slot_183_1_0:GetAbsOrigin()

			if slot_183_3_2 and slot_183_4_1 then
				slot_183_5_1 = slot_183_4_1.x - slot_183_3_2.x
				slot_183_6_1 = slot_183_4_1.y - slot_183_3_2.y
				slot_183_7_1 = slot_183_4_1.z - slot_183_3_2.z

				if slot_0_0_0.sqrt(slot_183_5_1 * slot_183_5_1 + slot_183_6_1 * slot_183_6_1 + slot_183_7_1 * slot_183_7_1) > 250 then
					return
				end
			end
		end

		slot_183_3_1 = slot_183_1_0.m_iHealth

		if type(slot_183_3_1) == "userdata" then
			slot_183_3_1 = slot_183_3_1:Get()
		end

		slot_183_3_0 = slot_0_0_0.max(1, slot_183_3_1 or 100)
		slot_183_4_0 = {}
		slot_183_5_0 = slot_183_1_0:GetHitboxCenter(0)
		slot_183_6_0 = slot_183_1_0:GetHitboxCenter(5)

		if slot_183_5_0 then
			slot_183_4_0[1] = slot_183_5_0
		end

		if slot_183_6_0 then
			slot_183_4_0[#slot_183_4_0 + 1] = slot_183_6_0
		end

		if not slot_183_4_0[1] then
			return
		end

		function slot_183_7_0(arg_184_0)
			slot_184_1_0 = slot_182_16_0 > 0 and slot_0_0_0.min(slot_183_3_0, slot_182_16_0) or slot_183_3_0
			slot_184_2_0 = slot_183_4_0[1]

			if slot_184_2_0 then
				slot_184_3_1 = math.CalcAngle(arg_184_0, slot_184_2_0)
				slot_184_4_1 = math.AngleNormalize(slot_184_3_1.x - slot_182_19_0.x)
				slot_184_5_0 = math.AngleNormalize(slot_184_3_1.y - slot_182_19_0.y)

				if slot_184_4_1 * slot_184_4_1 + slot_184_5_0 * slot_184_5_0 < slot_182_20_0 * slot_182_20_0 then
					slot_184_6_1 = Vector(slot_184_2_0.x - arg_184_0.x, slot_184_2_0.y - arg_184_0.y, slot_184_2_0.z - arg_184_0.z)
					slot_184_7_1, slot_184_8_2 = mods.penetration.FireBullet(arg_184_0, slot_184_6_1, slot_182_2_0, slot_183_1_0, false, false)

					if slot_184_8_2 and slot_184_8_2.damage and slot_184_1_0 <= slot_184_8_2.damage then
						return true
					end
				end
			end

			for iter_184_0 = 2, #slot_183_4_0 do
				slot_184_7_0 = slot_183_4_0[iter_184_0]
				slot_184_8_1 = math.CalcAngle(arg_184_0, slot_184_7_0)
				slot_184_9_1 = math.AngleNormalize(slot_184_8_1.x - slot_182_19_0.x)
				slot_184_10_0 = math.AngleNormalize(slot_184_8_1.y - slot_182_19_0.y)

				if slot_0_0_0.sqrt(slot_184_9_1 * slot_184_9_1 + slot_184_10_0 * slot_184_10_0) < slot_182_20_0 then
					slot_184_11_0 = Vector(slot_184_7_0.x - arg_184_0.x, slot_184_7_0.y - arg_184_0.y, slot_184_7_0.z - arg_184_0.z)
					slot_184_12_0, slot_184_13_1 = mods.penetration.FireBullet(arg_184_0, slot_184_11_0, slot_182_2_0, slot_183_1_0, false, false)

					if slot_184_13_1 and slot_184_13_1.damage and slot_184_1_0 <= slot_184_13_1.damage then
						return true
					end
				end
			end

			slot_184_3_0 = slot_183_1_0:GetAbsVelocity()

			if slot_184_3_0 and (math.abs(slot_184_3_0.x) > 5 or math.abs(slot_184_3_0.y) > 5 or math.abs(slot_184_3_0.z) > 5) then
				slot_184_4_0 = {
					0.03,
					0.07,
					[0] = nil
				}

				for iter_184_1, iter_184_2 in ipairs(slot_184_4_0) do
					for iter_184_3, iter_184_4 in ipairs(slot_183_4_0) do
						slot_184_15_0 = Vector(iter_184_4.x + slot_184_3_0.x * iter_184_2, iter_184_4.y + slot_184_3_0.y * iter_184_2, iter_184_4.z + slot_184_3_0.z * iter_184_2)
						slot_184_16_0 = math.CalcAngle(arg_184_0, slot_184_15_0)
						slot_184_17_0 = math.AngleNormalize(slot_184_16_0.x - slot_182_19_0.x)
						slot_184_18_0 = math.AngleNormalize(slot_184_16_0.y - slot_182_19_0.y)

						if slot_0_0_0.sqrt(slot_184_17_0 * slot_184_17_0 + slot_184_18_0 * slot_184_18_0) < slot_182_20_0 then
							slot_184_19_0 = Vector(slot_184_15_0.x - arg_184_0.x, slot_184_15_0.y - arg_184_0.y, slot_184_15_0.z - arg_184_0.z)
							slot_184_20_0, slot_184_21_0 = mods.penetration.FireBullet(arg_184_0, slot_184_19_0, slot_182_2_0, slot_183_1_0, false, false)

							if slot_184_21_0 and slot_184_21_0.damage and slot_184_1_0 <= slot_184_21_0.damage then
								return true
							end
						end
					end
				end
			end

			return false
		end

		slot_183_8_0 = slot_183_7_0(slot_182_18_0)
		slot_183_9_0 = slot_0_29_0.rsEarlyMode or 0

		if not slot_183_8_0 and slot_183_9_0 > 0 and slot_182_13_0 > 38 and slot_182_12_0 then
			slot_183_10_1 = slot_182_12_0.x / slot_182_13_0
			slot_183_11_1 = slot_182_12_0.y / slot_182_13_0
			slot_183_12_1 = 1
			slot_183_13_1 = slot_0_54_0.rsInAir and slot_0_54_0.rsInAir:Get()

			if not slot_182_11_0 and slot_183_13_1 then
				slot_183_12_1 = 0.1
			elseif slot_182_5_0 == "Heavy" or slot_182_5_0 == "R8 Revolver" then
				slot_183_12_1 = 0.3
			end

			if slot_183_9_0 == 1 then
				slot_183_14_1 = slot_182_13_0 * 0.045 * slot_183_12_1
				slot_183_15_1 = Vector(slot_182_18_0.x + slot_183_10_1 * slot_183_14_1, slot_182_18_0.y + slot_183_11_1 * slot_183_14_1, slot_182_18_0.z)
				slot_183_8_0 = slot_183_7_0(slot_183_15_1)
			elseif slot_183_9_0 == 2 then
				slot_183_14_0 = slot_182_13_0 * 0.045 * slot_183_12_1
				slot_183_15_0 = Vector(slot_182_18_0.x + slot_183_10_1 * slot_183_14_0, slot_182_18_0.y + slot_183_11_1 * slot_183_14_0, slot_182_18_0.z)
				slot_183_8_0 = slot_183_7_0(slot_183_15_0)

				if not slot_183_8_0 then
					slot_183_16_0 = slot_183_1_0.GetIndex and slot_183_1_0:GetIndex() or tostring(slot_183_1_0)
					slot_183_17_1 = slot_0_167_0[slot_183_16_0]

					if slot_183_17_1 and #slot_183_17_1 >= 2 then
						slot_183_18_1 = slot_183_17_1[#slot_183_17_1]
						slot_183_19_0 = slot_183_17_1[#slot_183_17_1 - 1]

						if slot_183_18_1 and slot_183_19_0 and slot_183_18_1.points and slot_183_19_0.points and slot_183_18_1.points[1] and slot_183_19_0.points[1] then
							slot_183_20_0 = (slot_183_18_1.time or 0) - (slot_183_19_0.time or 0)

							if slot_183_20_0 > 0 then
								slot_183_21_0 = slot_183_18_1.points[1]
								slot_183_22_1 = slot_183_19_0.points[1]
								slot_183_23_1 = (slot_183_21_0.x - slot_183_22_1.x) / slot_183_20_0
								slot_183_24_1 = (slot_183_21_0.y - slot_183_22_1.y) / slot_183_20_0
								slot_183_25_1 = (slot_183_21_0.z - slot_183_22_1.z) / slot_183_20_0
								slot_183_26_1 = 0.051
								slot_183_27_0 = Vector(slot_183_21_0.x + slot_183_23_1 * slot_183_26_1, slot_183_21_0.y + slot_183_24_1 * slot_183_26_1, slot_183_21_0.z + slot_183_25_1 * slot_183_26_1)
								slot_183_28_0 = Vector(slot_183_27_0.x - slot_182_18_0.x, slot_183_27_0.y - slot_182_18_0.y, slot_183_27_0.z - slot_182_18_0.z)
								slot_183_29_0 = slot_182_16_0 > 0 and slot_0_0_0.min(slot_183_3_0, slot_182_16_0) or slot_183_3_0
								slot_183_30_0, slot_183_31_0 = mods.penetration.FireBullet(slot_182_18_0, slot_183_28_0, slot_182_2_0, slot_183_1_0, false, false)

								if slot_183_31_0 and slot_183_31_0.damage and slot_183_29_0 <= slot_183_31_0.damage then
									slot_183_8_0 = true
								end
							end
						end
					end
				end
			end
		end

		if not slot_183_8_0 then
			slot_183_10_0 = slot_183_1_0.GetIndex and slot_183_1_0:GetIndex() or tostring(slot_183_1_0)
			slot_183_11_0 = slot_0_167_0[slot_183_10_0]

			if slot_183_11_0 and #slot_183_11_0 > 0 then
				slot_183_12_0 = slot_182_16_0 > 0 and slot_0_0_0.min(slot_183_3_0, slot_182_16_0) or slot_183_3_0
				slot_183_13_0 = slot_0_0_0.min(3, #slot_183_11_0)

				for iter_183_0 = #slot_183_11_0, #slot_183_11_0 - slot_183_13_0 + 1, -1 do
					slot_183_18_0 = slot_183_11_0[iter_183_0]

					if slot_183_18_0 and slot_183_18_0.points then
						for iter_183_1, iter_183_2 in ipairs(slot_183_18_0.points) do
							slot_183_24_0 = Vector(iter_183_2.x - slot_182_18_0.x, iter_183_2.y - slot_182_18_0.y, iter_183_2.z - slot_182_18_0.z)
							slot_183_25_0, slot_183_26_0 = mods.penetration.FireBullet(slot_182_18_0, slot_183_24_0, slot_182_2_0, slot_183_1_0, false, false)

							if slot_183_26_0 and slot_183_26_0.damage and slot_183_12_0 <= slot_183_26_0.damage then
								slot_183_8_0 = true

								break
							end
						end
					end

					if slot_183_8_0 then
						break
					end
				end
			end
		end

		if slot_183_8_0 then
			slot_182_17_0 = true
		end
	end)

	if slot_182_17_0 and (slot_182_11_0 or slot_182_14_0) then
		slot_0_169_0()
	else
		slot_0_170_0()
	end
end)

slot_0_171_0 = {
	origSpeed = nil,
	active = false
}
slot_0_172_0 = nil
slot_0_173_0 = nil
slot_0_174_0 = 0

function slot_0_175_0()
	if slot_0_171_0.active then
		if slot_0_18_0.slowwalk and slot_0_171_0.origWalk ~= nil then
			local var_185_0 = slot_0_18_0.slowwalk:GetValue()

			if var_185_0 then
				var_185_0:Set(slot_0_171_0.origWalk)
			end
		end

		if slot_0_18_0.slowwalkSpeed and slot_0_171_0.origSpeed ~= nil then
			local var_185_1 = slot_0_18_0.slowwalkSpeed:GetValue()

			if var_185_1 then
				var_185_1:Set(slot_0_171_0.origSpeed)
			end
		end

		slot_0_171_0.active = false
		slot_0_171_0.origWalk = nil
		slot_0_171_0.origSpeed = nil
	end
end

function slot_0_176_0()
	if not slot_0_171_0.active then
		if slot_0_18_0.slowwalk then
			local var_186_0 = slot_0_18_0.slowwalk:GetValue()

			if var_186_0 then
				slot_0_171_0.origWalk = var_186_0:Get()
			end
		end

		if slot_0_18_0.slowwalkSpeed then
			local var_186_1 = slot_0_18_0.slowwalkSpeed:GetValue()

			if var_186_1 then
				slot_0_171_0.origSpeed = var_186_1:Get()
			end
		end

		slot_0_171_0.active = true
	end

	if slot_0_18_0.slowwalk then
		local var_186_2 = slot_0_18_0.slowwalk:GetValue()

		if var_186_2 then
			var_186_2:Set(true)
		end
	end

	if slot_0_18_0.slowwalkSpeed then
		local var_186_3 = slot_0_18_0.slowwalkSpeed:GetValue()

		if var_186_3 then
			var_186_3:Set(32)
		end
	end
end

events.createMove:Add(function(arg_187_0)
	if not slot_0_54_0.legitStop or not slot_0_54_0.legitStop:Get() then
		slot_0_175_0()

		return
	end

	if not game.engine:IsConnected() or not game.engine:InGame() then
		return
	end

	slot_187_1_0 = entities.GetLocalPawn()

	if not slot_187_1_0 or not slot_187_1_0:IsAlive() then
		slot_0_175_0()

		return
	end

	if not slot_0_61_0() then
		slot_0_175_0()

		return
	end

	slot_187_2_0 = slot_187_1_0:GetActiveWeapon()

	if not slot_187_2_0 then
		return
	end

	slot_187_3_0 = slot_0_165_0(slot_187_1_0)
	slot_187_4_0 = game.globalVars.m_flRealTime or 0
	slot_187_5_0 = true
	slot_187_6_0 = 0.05

	if slot_0_164_0.active and slot_187_4_0 - slot_0_164_0.startTime < slot_0_164_0.duration then
		slot_187_5_0 = false
	elseif slot_187_6_0 < slot_187_3_0 then
		slot_187_5_0 = false
	else
		slot_0_164_0.active = false
	end

	if not slot_187_5_0 then
		slot_0_175_0()

		return
	end

	slot_187_7_0 = slot_187_1_0:GetEyePos()

	if not slot_187_7_0 then
		return
	end

	slot_187_8_0 = slot_187_7_0
	slot_187_9_0 = arg_187_0:GetViewangles()
	slot_187_10_0 = slot_187_1_0.m_iTeamNum and slot_187_1_0.m_iTeamNum:Get() or 0
	slot_187_11_0 = slot_0_54_0.legitAwall and slot_0_54_0.legitAwall:Get() or false
	slot_187_12_0 = slot_0_54_0.legitAim and slot_0_54_0.legitAim:Get() or false
	slot_187_13_0 = slot_0_54_0.hcTrigger and slot_0_54_0.hcTrigger:Get() or false
	slot_187_14_0 = slot_0_55_0.laFov and slot_0_55_0.laFov:GetValue():Get() or 5
	slot_187_15_0 = slot_0_55_0.laMd:GetValue():Get()
	slot_187_16_0 = slot_187_14_0 * slot_187_14_0
	slot_187_17_0 = false
	slot_187_18_0 = {}
	slot_187_19_0 = {}

	if slot_187_12_0 then
		slot_187_20_1 = slot_0_54_0.laHitbox and slot_0_54_0.laHitbox:Get()

		if slot_187_20_1 then
			for iter_187_0 = 0, 4 do
				if slot_187_20_1:Get(iter_187_0) then
					slot_187_25_2 = iter_187_0 == 0 and 0 or iter_187_0 + 1
					slot_187_18_0[#slot_187_18_0 + 1] = slot_187_25_2
					slot_187_19_0[slot_187_25_2] = 0.5 + 0.56 * ((slot_187_25_2 == 0 and 4.2 or 9.5) - 0.5)
				end
			end
		end

		if #slot_187_18_0 == 0 then
			slot_187_18_0 = {
				0,
				[0] = nil
			}
			slot_187_19_0[0] = 2.5720000000000005
		end
	end

	slot_187_20_0 = nil
	slot_187_21_0 = nil
	slot_187_22_0 = nil

	if slot_187_13_0 then
		slot_187_23_1 = slot_0_0_0.rad(slot_187_9_0.x)
		slot_187_24_1 = slot_0_0_0.rad(slot_187_9_0.y)
		slot_187_25_1 = slot_0_0_0.cos(slot_187_23_1)
		slot_187_26_1 = slot_0_0_0.cos(slot_187_24_1)
		slot_187_27_1 = slot_0_0_0.sin(slot_187_23_1)
		slot_187_28_0 = slot_0_0_0.sin(slot_187_24_1)
		slot_187_20_0 = Vector(slot_187_25_1 * slot_187_26_1 * 8192, slot_187_25_1 * slot_187_28_0 * 8192, -slot_187_27_1 * 8192)
		slot_187_21_0 = slot_187_20_0:Normalized()
		slot_187_22_0 = slot_0_55_0.hcPs:GetValue():Get()
	end

	entities.players:ForEach(function(arg_188_0)
		if slot_187_17_0 then
			return
		end

		local var_188_0 = arg_188_0.entity ~= nil and arg_188_0.entity or arg_188_0

		if not var_188_0 or var_188_0 == slot_187_1_0 or not var_188_0:IsAlive() then
			return
		end

		if (var_188_0.m_iTeamNum and var_188_0.m_iTeamNum:Get() or 0) == slot_187_10_0 then
			return
		end

		local var_188_1 = var_188_0.m_iHealth and (type(var_188_0.m_iHealth) == "userdata" and var_188_0.m_iHealth:Get() or var_188_0.m_iHealth) or 100
		local var_188_2 = slot_0_0_0.max(1, var_188_1)
		local var_188_3 = slot_187_15_0 > 100 and var_188_2 + slot_187_15_0 - 100 or slot_0_0_0.min(slot_187_15_0, var_188_2)

		if slot_187_12_0 then
			for iter_188_0, iter_188_1 in ipairs(slot_187_18_0) do
				local var_188_4 = var_188_0:GetHitboxCenter(iter_188_1)

				if var_188_4 then
					local var_188_5 = slot_187_19_0[iter_188_1]
					local var_188_6, var_188_7, var_188_8 = math.CalcAngle(slot_187_7_0, var_188_4):AngleVectors()
					local var_188_9 = {
						var_188_4,
						var_188_4 + var_188_8 * var_188_5,
						var_188_4 - var_188_8 * var_188_5,
						var_188_4 + var_188_7 * var_188_5,
						var_188_4 - var_188_7 * var_188_5
					}

					for iter_188_2, iter_188_3 in ipairs(var_188_9) do
						local var_188_10 = math.CalcAngle(slot_187_8_0, iter_188_3)
						local var_188_11 = math.AngleNormalize(var_188_10.x - slot_187_9_0.x)
						local var_188_12 = math.AngleNormalize(var_188_10.y - slot_187_9_0.y)

						if var_188_11 * var_188_11 + var_188_12 * var_188_12 < slot_187_16_0 then
							local var_188_13 = iter_188_3 - slot_187_8_0
							local var_188_14 = var_188_13:Length()

							if var_188_14 > 1 then
								local var_188_15, var_188_16 = mods.penetration.FireBullet(slot_187_8_0, var_188_13, slot_187_2_0, var_188_0, false, false)

								if var_188_16 and var_188_16.damage and var_188_3 <= var_188_16.damage then
									if slot_187_11_0 then
										slot_187_17_0 = true

										return
									else
										local var_188_17, var_188_18 = slot_0_76_0(slot_187_8_0, var_188_13:Normalized(), var_188_14)

										if var_188_18 == nil or var_188_18 >= var_188_14 * 0.95 then
											slot_187_17_0 = true

											return
										end
									end
								end
							end
						end
					end
				end
			end
		elseif slot_187_13_0 then
			local var_188_19, var_188_20 = mods.penetration.FireBullet(slot_187_8_0, slot_187_20_0, slot_187_2_0, var_188_0, false, false)

			if var_188_20 and var_188_20.damage and var_188_20.damage > 0 then
				local var_188_21 = -1
				local var_188_22 = 9999

				for iter_188_4 = 0, 18 do
					if iter_188_4 ~= 1 then
						local var_188_23 = var_188_0:GetHitboxCenter(iter_188_4)

						if var_188_23 then
							local var_188_24 = slot_0_8_0(var_188_23, slot_187_7_0, slot_187_21_0)

							if var_188_24 < var_188_22 then
								var_188_22 = var_188_24
								var_188_21 = iter_188_4
							end
						end
					end
				end

				if var_188_21 ~= -1 then
					local var_188_25 = var_188_21 == 0 and 4.2 or 9.5

					if var_188_22 <= 0.5 + (20 + slot_187_22_0 / 100 * 80) / 100 * (var_188_25 - 0.5) and var_188_3 <= var_188_20.damage then
						if slot_187_11_0 then
							slot_187_17_0 = true
						else
							local var_188_26 = var_188_0:GetAbsOrigin()

							if var_188_26 then
								local var_188_27 = (var_188_26 - slot_187_8_0):Length()
								local var_188_28, var_188_29 = slot_0_76_0(slot_187_8_0, slot_187_21_0, var_188_27 + 100)

								if not var_188_28 or var_188_29 >= var_188_27 * 0.7 then
									slot_187_17_0 = true
								end
							end
						end
					end
				end
			end
		end
	end)

	if not slot_187_17_0 and slot_0_54_0.lstopEarly and slot_0_54_0.lstopEarly:Get() then
		slot_187_23_0 = slot_187_1_0:GetAbsVelocity()
		slot_187_24_0 = slot_187_23_0 and slot_0_0_0.sqrt(slot_187_23_0.x * slot_187_23_0.x + slot_187_23_0.y * slot_187_23_0.y) or 0

		if slot_187_24_0 > 38 then
			slot_187_25_0 = slot_187_23_0.x / slot_187_24_0
			slot_187_26_0 = slot_187_23_0.y / slot_187_24_0
			slot_187_27_0 = Vector(slot_187_7_0.x + slot_187_25_0 * slot_187_24_0 * 0.045, slot_187_7_0.y + slot_187_26_0 * slot_187_24_0 * 0.045, slot_187_7_0.z)

			entities.players:ForEach(function(arg_189_0)
				if slot_187_17_0 then
					return
				end

				local var_189_0 = arg_189_0.entity ~= nil and arg_189_0.entity or arg_189_0

				if not var_189_0 or var_189_0 == slot_187_1_0 or not var_189_0:IsAlive() then
					return
				end

				if (var_189_0.m_iTeamNum and var_189_0.m_iTeamNum:Get() or 0) == slot_187_10_0 then
					return
				end

				local var_189_1 = var_189_0.m_iHealth and (type(var_189_0.m_iHealth) == "userdata" and var_189_0.m_iHealth:Get() or var_189_0.m_iHealth) or 100
				local var_189_2 = slot_0_0_0.max(1, var_189_1)
				local var_189_3 = slot_0_55_0.laMd:GetValue():Get()
				local var_189_4 = var_189_3 > 100 and var_189_2 + var_189_3 - 100 or slot_0_0_0.min(var_189_3, var_189_2)

				for iter_189_0, iter_189_1 in ipairs({
					0,
					5,
					[0] = nil
				}) do
					local var_189_5 = var_189_0:GetHitboxCenter(iter_189_1)

					if var_189_5 then
						local var_189_6 = var_189_5 - slot_187_27_0

						if var_189_6:Length() > 1 then
							local var_189_7, var_189_8 = mods.penetration.FireBullet(slot_187_27_0, var_189_6, slot_187_2_0, var_189_0, false, false)

							if var_189_8 and var_189_8.damage and var_189_4 <= var_189_8.damage then
								slot_187_17_0 = true

								return
							end
						end
					end
				end
			end)
		end
	end

	if slot_187_17_0 then
		slot_0_176_0()
	else
		slot_0_175_0()
	end
end)
events.createMove:Add(function(arg_190_0)
	if not slot_0_54_0.legitAim or not slot_0_54_0.legitAim:Get() then
		slot_0_172_0 = nil
		slot_0_173_0 = nil

		return
	end

	if not slot_0_61_0() then
		slot_0_172_0 = nil
		slot_0_173_0 = nil

		return
	end

	if not game.engine:IsConnected() or not game.engine:InGame() then
		slot_0_172_0 = nil
		slot_0_173_0 = nil

		return
	end

	slot_190_1_0 = entities.GetLocalPawn()

	if not slot_190_1_0 or not slot_190_1_0:IsAlive() then
		slot_0_172_0 = nil
		slot_0_173_0 = nil

		return
	end

	slot_190_2_0 = slot_190_1_0:GetEyePos()

	if not slot_190_2_0 then
		return
	end

	slot_190_3_0 = slot_190_1_0:GetActiveWeapon()

	if not slot_190_3_0 then
		return
	end

	slot_190_4_0 = slot_0_55_0.laFov and slot_0_55_0.laFov:GetValue():Get() or 5
	slot_190_5_0 = slot_0_55_0.laSmooth and slot_0_55_0.laSmooth:GetValue():Get() or 15
	slot_190_6_0 = slot_0_54_0.legitAwall and slot_0_54_0.legitAwall:Get() or false
	slot_190_7_0 = arg_190_0:GetViewangles()
	slot_190_8_0 = slot_0_55_0.laMd:GetValue():Get()
	slot_190_9_0 = slot_190_4_0 * 2 * (slot_190_4_0 * 2)
	slot_190_10_0 = 2.5720000000000005
	slot_190_11_0 = 5.540000000000001
	slot_190_12_0 = slot_0_54_0.laHitbox and slot_0_54_0.laHitbox:Get()
	slot_190_13_0 = {}

	if slot_190_12_0 then
		if slot_190_12_0:Get(0) then
			slot_190_13_0[#slot_190_13_0 + 1] = 0
		end

		if slot_190_12_0:Get(1) then
			slot_190_13_0[#slot_190_13_0 + 1] = 2
		end

		if slot_190_12_0:Get(2) then
			slot_190_13_0[#slot_190_13_0 + 1] = 3
		end

		if slot_190_12_0:Get(3) then
			slot_190_13_0[#slot_190_13_0 + 1] = 4
		end

		if slot_190_12_0:Get(4) then
			slot_190_13_0[#slot_190_13_0 + 1] = 5
		end
	end

	if #slot_190_13_0 == 0 then
		slot_190_13_0 = {
			0,
			[0] = nil
		}
	end

	function slot_190_14_0(arg_191_0)
		local var_191_0 = arg_191_0.m_iHealth and arg_191_0.m_iHealth:Get() or 100
		local var_191_1 = slot_190_8_0 > 100 and var_191_0 + slot_190_8_0 - 100 or slot_0_0_0.min(slot_190_8_0, var_191_0)
		local var_191_2
		local var_191_3 = 999
		local var_191_4
		local var_191_5 = 999
		local var_191_6
		local var_191_7 = -1
		local var_191_8 = 999

		for iter_191_0, iter_191_1 in ipairs(slot_190_13_0) do
			local var_191_9 = arg_191_0:GetHitboxCenter(iter_191_1)

			if var_191_9 then
				local var_191_10 = iter_191_1 == 0 and slot_190_10_0 or slot_190_11_0
				local var_191_11, var_191_12, var_191_13 = math.CalcAngle(slot_190_2_0, var_191_9):AngleVectors()
				local var_191_14 = {
					var_191_9,
					var_191_9 + var_191_13 * var_191_10,
					var_191_9 - var_191_13 * var_191_10,
					var_191_9 + var_191_12 * var_191_10,
					var_191_9 - var_191_12 * var_191_10
				}
				local var_191_15 = false
				local var_191_16 = iter_191_1 == 0

				for iter_191_2, iter_191_3 in ipairs(var_191_14) do
					local var_191_17 = math.CalcAngle(slot_190_2_0, iter_191_3)
					local var_191_18 = math.AngleNormalize(var_191_17.x - slot_190_7_0.x)
					local var_191_19 = math.AngleNormalize(var_191_17.y - slot_190_7_0.y)
					local var_191_20 = var_191_18 * var_191_18 + var_191_19 * var_191_19

					if var_191_20 < slot_190_9_0 then
						local var_191_21 = iter_191_3 - slot_190_2_0
						local var_191_22 = var_191_21:Length()

						if var_191_22 > 1 then
							local var_191_23, var_191_24 = mods.penetration.FireBullet(slot_190_2_0, var_191_21, slot_190_3_0, arg_191_0, false, false)
							local var_191_25 = var_191_24 and var_191_24.damage or 0

							if var_191_25 > 0 then
								local var_191_26 = iter_191_2 == 1
								local var_191_27, var_191_28 = slot_0_76_0(slot_190_2_0, var_191_21:Normalized(), var_191_22)
								local var_191_29 = var_191_28 == nil or var_191_28 >= var_191_22 * 0.95

								if var_191_29 and var_191_1 <= var_191_25 or slot_190_6_0 and var_191_1 <= var_191_25 then
									local var_191_30 = slot_0_0_0.sqrt(var_191_20)
									local var_191_31 = var_191_26 and var_191_30 * 0.5 or var_191_30

									if var_191_0 <= var_191_25 then
										if not var_191_16 then
											if var_191_31 < var_191_3 then
												var_191_2, var_191_3 = iter_191_3, var_191_30
											end
										elseif var_191_31 < var_191_5 then
											var_191_4, var_191_5 = iter_191_3, var_191_30
										end
									end

									if var_191_7 < var_191_25 or var_191_25 == var_191_7 and var_191_31 < var_191_8 then
										var_191_6, var_191_7, var_191_8 = iter_191_3, var_191_25, var_191_30
									end

									if var_191_26 and var_191_0 <= var_191_25 and var_191_29 then
										var_191_15 = true
									end
								end
							end
						end
					end

					if var_191_15 then
						break
					end
				end
			end
		end

		if var_191_2 then
			return var_191_2, var_191_3
		end

		if var_191_4 then
			return var_191_4, var_191_5
		end

		return var_191_6, var_191_8
	end

	if slot_0_172_0 then
		if slot_0_172_0:IsAlive() then
			slot_190_15_2, slot_190_16_2 = slot_190_14_0(slot_0_172_0)

			if not slot_190_15_2 or slot_190_16_2 > slot_190_4_0 * 2.5 then
				slot_0_172_0 = nil
				slot_0_173_0 = nil
			else
				slot_0_173_0 = slot_190_15_2
			end
		else
			slot_0_172_0 = nil
			slot_0_173_0 = nil
		end
	end

	if not slot_0_172_0 then
		slot_190_15_1 = nil
		slot_190_16_1 = slot_190_4_0
		slot_190_17_1 = nil
		slot_190_18_1 = slot_190_1_0.m_iTeamNum and slot_190_1_0.m_iTeamNum:Get() or 0

		entities.players:ForEach(function(arg_192_0)
			local var_192_0 = arg_192_0.entity ~= nil and arg_192_0.entity or arg_192_0

			if not var_192_0 or var_192_0 == slot_190_1_0 or not var_192_0:IsAlive() then
				return
			end

			if (var_192_0.m_iTeamNum and var_192_0.m_iTeamNum:Get() or 0) == slot_190_18_1 then
				return
			end

			local var_192_1, var_192_2 = slot_190_14_0(var_192_0)

			if var_192_1 and var_192_2 < slot_190_16_1 then
				slot_190_16_1, slot_190_15_1, slot_190_17_1 = var_192_2, var_192_0, var_192_1
			end
		end)

		slot_0_172_0, slot_0_173_0 = slot_190_15_1, slot_190_17_1
	end

	if not slot_0_172_0 or not slot_0_173_0 then
		return
	end

	slot_190_15_0 = math.CalcAngle(slot_190_2_0, slot_0_173_0)
	slot_190_15_0.x = math.clamp(slot_190_15_0.x, -89, 89)
	slot_190_15_0.z = 0
	slot_190_16_0 = game.globalVars.m_flFrameTime or 0.015625
	slot_190_17_0 = math.clamp(slot_190_16_0 * 64 / math.max(1, slot_190_5_0), 0, 1)
	slot_190_18_0 = Vector(math.clamp(slot_190_7_0.x + math.AngleNormalize(slot_190_15_0.x - slot_190_7_0.x) * slot_190_17_0, -89, 89), math.AngleNormalize(slot_190_7_0.y + math.AngleNormalize(slot_190_15_0.y - slot_190_7_0.y) * slot_190_17_0), 0)

	arg_190_0:SetViewangles(slot_190_18_0)
	arg_190_0:LockAngles()
end)
events.createMove:Add(function(arg_193_0)
	if not slot_0_54_0.hcTrigger or not slot_0_54_0.hcTrigger:Get() then
		return
	end

	if not game.engine:IsConnected() or not game.engine:InGame() then
		return
	end

	local var_193_0 = entities.GetLocalPawn()

	if not var_193_0 or not var_193_0:IsAlive() or not slot_0_61_0() then
		return
	end

	local var_193_1 = var_193_0:GetActiveWeapon()

	if not var_193_1 then
		return
	end

	local var_193_2 = var_193_1:ToWeaponBaseGun()

	if not var_193_2 then
		return
	end

	local var_193_3 = var_193_0:GetEyePos()

	if not var_193_3 then
		return
	end

	local var_193_4 = arg_193_0:GetViewangles()
	local var_193_5 = slot_0_0_0.rad(var_193_4.x)
	local var_193_6 = slot_0_0_0.rad(var_193_4.y)
	local var_193_7 = Vector(slot_0_0_0.cos(var_193_5) * slot_0_0_0.cos(var_193_6) * 8192, slot_0_0_0.cos(var_193_5) * slot_0_0_0.sin(var_193_6) * 8192, -slot_0_0_0.sin(var_193_5) * 8192)
	local var_193_8 = var_193_7:Normalized()
	local var_193_9 = var_193_0.m_iTeamNum and var_193_0.m_iTeamNum:Get() or 0
	local var_193_10 = slot_0_54_0.legitAwall and slot_0_54_0.legitAwall:Get() or false
	local var_193_11 = slot_0_55_0.hcPs:GetValue():Get()
	local var_193_12 = slot_0_55_0.laMd:GetValue():Get()
	local var_193_13 = slot_0_54_0.hcPredict:Get() and 5 or slot_0_55_0.hcValue:GetValue():Get()
	local var_193_14 = (var_193_2.GetInaccuracy and var_193_2:GetInaccuracy() or 0) + (var_193_2.GetSpread and var_193_2:GetSpread() or 0)
	local var_193_15 = 0.5 + (20 + var_193_11 / 100 * 80) / 100 * 3.7
	local var_193_16 = 0.5 + (20 + var_193_11 / 100 * 80) / 100 * 9
	local var_193_17 = false

	entities.players:ForEach(function(arg_194_0)
		if var_193_17 then
			return
		end

		local var_194_0 = arg_194_0.entity ~= nil and arg_194_0.entity or arg_194_0

		if not var_194_0 or var_194_0 == var_193_0 or not var_194_0:IsAlive() then
			return
		end

		if (var_194_0.m_iTeamNum and var_194_0.m_iTeamNum:Get() or 0) == var_193_9 then
			return
		end

		local var_194_1 = var_194_0.m_iHealth and var_194_0.m_iHealth:Get() or 100
		local var_194_2 = var_193_12 > 100 and var_194_1 + var_193_12 - 100 or slot_0_0_0.min(var_193_12, var_194_1)
		local var_194_3, var_194_4 = mods.penetration.FireBullet(var_193_3, var_193_7, var_193_1, var_194_0, false, false)

		if var_194_4 and var_194_4.damage and var_194_4.damage > 0 then
			local var_194_5 = -1
			local var_194_6 = 9999

			for iter_194_0 = 0, 18 do
				if iter_194_0 ~= 1 then
					local var_194_7 = var_194_0:GetHitboxCenter(iter_194_0)

					if var_194_7 then
						local var_194_8 = slot_0_8_0(var_194_7, var_193_3, var_193_8)

						if var_194_8 < var_194_6 then
							var_194_6 = var_194_8
							var_194_5 = iter_194_0
						end
					end
				end
			end

			if var_194_5 ~= -1 then
				local var_194_9 = var_194_5 == 0 and var_193_15 or var_193_16

				if var_194_9 < var_194_6 then
					return
				end

				local var_194_10 = (var_194_0:GetHitboxCenter(var_194_5) - var_193_3):Length()

				if (var_193_14 <= 0.0001 and 100 or slot_0_0_0.max(0, slot_0_0_0.min(100, (slot_0_0_0.atan2(var_194_9, var_194_10) / var_193_14 * 100)^2 / 100))) < var_193_13 then
					return
				end

				if var_194_2 > var_194_4.damage then
					return
				end

				local var_194_11, var_194_12 = slot_0_76_0(var_193_3, var_193_8, var_194_10)

				if not (var_194_12 == nil or var_194_12 >= var_194_10 * 0.95) and not var_193_10 then
					return
				end

				if var_193_10 then
					var_193_17 = true
				else
					local var_194_13 = var_194_0:GetAbsOrigin()

					if var_194_13 then
						local var_194_14 = (var_194_13 - var_193_3):Length()
						local var_194_15, var_194_16 = slot_0_76_0(var_193_3, var_193_8, var_194_14 + 100)

						if not var_194_15 or var_194_16 >= var_194_14 * 0.7 then
							var_193_17 = true
						end
					end
				end
			end
		end
	end)

	if var_193_17 then
		local var_193_18 = game.globalVars.m_flRealTime or 0

		if var_193_18 - slot_0_174_0 >= 0.01 or var_193_18 < slot_0_174_0 then
			arg_193_0:SetButton(InputBitMask_t.IN_ATTACK)

			slot_0_174_0 = var_193_18
		end
	end
end)

slot_0_177_0 = 0

events.createMove:Add(function(arg_195_0)
	local var_195_0 = slot_0_54_0.fakeBack and slot_0_54_0.fakeBack:Get()
	local var_195_1 = entities.GetLocalPawn()

	if not var_195_1 or not var_195_1:IsAlive() then
		slot_0_177_0 = 0

		return
	end

	if slot_0_54_0.legitAim and slot_0_54_0.legitAim:Get() and slot_0_172_0 then
		slot_0_177_0 = 0

		return
	end

	local var_195_2 = arg_195_0:GetViewangles()

	if not var_195_2 then
		return
	end

	local var_195_3 = 45 + ((slot_0_55_0.fbSpeed and slot_0_55_0.fbSpeed:GetValue():Get() or 15) - 1) * 17.7
	local var_195_4 = game.globalVars.m_flFrameTime or 0.015625

	if var_195_4 <= 0 then
		var_195_4 = 0.015625
	end

	local var_195_5 = var_195_3 * var_195_4

	if var_195_0 then
		slot_0_177_0 = slot_0_0_0.min(180, slot_0_177_0 + var_195_5)
	else
		slot_0_177_0 = slot_0_0_0.max(0, slot_0_177_0 - var_195_5)

		if slot_0_177_0 <= 0 then
			return
		end
	end

	local var_195_6 = var_195_2.y + slot_0_177_0

	while var_195_6 > 180 do
		var_195_6 = var_195_6 - 360
	end

	while var_195_6 < -180 do
		var_195_6 = var_195_6 + 360
	end

	local var_195_7 = arg_195_0:GetForwardMove() or 0
	local var_195_8 = arg_195_0:GetLeftMove() or 0
	local var_195_9 = slot_0_0_0.rad(slot_0_177_0)
	local var_195_10 = slot_0_0_0.cos(var_195_9)
	local var_195_11 = slot_0_0_0.sin(var_195_9)
	local var_195_12 = var_195_7 * var_195_10 + var_195_8 * var_195_11
	local var_195_13 = -var_195_7 * var_195_11 + var_195_8 * var_195_10

	arg_195_0:SetForwardMove(slot_0_0_0.max(-1, slot_0_0_0.min(1, var_195_12)))
	arg_195_0:SetLeftMove(slot_0_0_0.max(-1, slot_0_0_0.min(1, var_195_13)))
	arg_195_0:SetViewangles(Vector(var_195_2.x, var_195_6, var_195_2.z))
end)
events.createMove:Add(function(arg_196_0)
	if not slot_0_54_0.nullStrafe or not slot_0_54_0.nullStrafe:Get() then
		return
	end

	if not slot_0_18_0.easyStrafe then
		return
	end

	local var_196_0 = entities.GetLocalPawn()

	if not var_196_0 or not var_196_0:IsAlive() then
		return
	end

	local var_196_1 = var_196_0.m_fFlags and var_196_0.m_fFlags:Get() or 0
	local var_196_2 = bit.band(var_196_1, 1) ~= 0
	local var_196_3 = slot_0_18_0.easyStrafe:GetValue()

	if var_196_3 then
		var_196_3:Set(not var_196_2)
	end
end)

slot_0_178_0 = nil

events.createMove:Add(function(arg_197_0)
	if not slot_0_54_0.legitStrafe or not slot_0_54_0.legitStrafe:Get() then
		slot_0_178_0 = nil

		return
	end

	local var_197_0 = entities.GetLocalPawn()

	if not var_197_0 or not var_197_0:IsAlive() then
		slot_0_178_0 = nil

		return
	end

	local var_197_1 = var_197_0.m_fFlags and var_197_0.m_fFlags:Get() or 0
	local var_197_2 = bit.band(var_197_1, 1) ~= 0
	local var_197_3 = arg_197_0:GetViewangles().y

	if not var_197_2 and slot_0_178_0 ~= nil then
		local var_197_4 = math.fmod(var_197_3 - slot_0_178_0 + 540, 360) - 180

		if var_197_4 > 0.1 then
			arg_197_0:SetLeftMove(1)
		elseif var_197_4 < -0.1 then
			arg_197_0:SetLeftMove(-1)
		end
	end

	slot_0_178_0 = var_197_3
end)

slot_0_179_0 = nil

events.createMove:Add(function(arg_198_0)
	if not slot_0_54_0.nullStrafeV2 or not slot_0_54_0.nullStrafeV2:Get() then
		slot_0_179_0 = nil

		return
	end

	local var_198_0 = entities.GetLocalPawn()

	if not var_198_0 or not var_198_0:IsAlive() then
		slot_0_179_0 = nil

		return
	end

	local var_198_1 = var_198_0.m_fFlags and var_198_0.m_fFlags:Get() or 0

	if bit.band(var_198_1, 1) ~= 0 then
		slot_0_179_0 = nil

		return
	end

	local var_198_2 = arg_198_0:GetButton(InputBitMask_t.IN_MOVELEFT)
	local var_198_3 = arg_198_0:GetButton(InputBitMask_t.IN_MOVERIGHT)

	if not (var_198_2 or var_198_3) then
		slot_0_179_0 = arg_198_0:GetViewangles().y

		return
	end

	local var_198_4 = arg_198_0:GetViewangles().y

	if slot_0_179_0 then
		local var_198_5 = math.fmod(var_198_4 - slot_0_179_0 + 540, 360) - 180

		if var_198_5 > 0.1 then
			arg_198_0:SetLeftMove(1)
		elseif var_198_5 < -0.1 then
			arg_198_0:SetLeftMove(-1)
		end
	end

	slot_0_179_0 = var_198_4
end)

function slot_0_180_0(arg_199_0, arg_199_1)
	local var_199_0 = arg_199_1.y - arg_199_0.y
	local var_199_1 = arg_199_1.x - arg_199_0.x

	while var_199_0 > 180 do
		var_199_0 = var_199_0 - 360
	end

	while var_199_0 < -180 do
		var_199_0 = var_199_0 + 360
	end

	return slot_0_0_0.sqrt(var_199_0 * var_199_0 + var_199_1 * var_199_1)
end

events.createMove:Add(function(arg_200_0)
	if not slot_0_54_0.nadeAutoAim or not slot_0_54_0.nadeAutoAim:Get() then
		return
	end

	if not slot_0_54_0.nadeEnabled or not slot_0_54_0.nadeEnabled:Get() then
		return
	end

	local var_200_0 = entities.GetLocalPawn()

	if not var_200_0 or not var_200_0:IsAlive() then
		return
	end

	local var_200_1 = slot_0_141_0()

	if not var_200_1 then
		return
	end

	local var_200_2 = var_200_0:GetAbsOrigin()
	local var_200_3 = game.globalVars.m_szMapName or ""
	local var_200_4 = arg_200_0:GetViewangles()

	for iter_200_0, iter_200_1 in ipairs(slot_0_36_0) do
		if (iter_200_1.m == var_200_3 or iter_200_1.m == "unknown") and iter_200_1.type == var_200_1 and slot_0_142_0(iter_200_1.p, var_200_2) < slot_0_139_0 then
			if slot_0_180_0(var_200_4, iter_200_1.va) < slot_0_55_0.nadeFov:GetValue():Get() then
				local var_200_5 = slot_0_55_0.nadeSmooth:GetValue():Get()

				if var_200_5 <= 1 then
					arg_200_0:SetViewangles(Vector(iter_200_1.va.x, iter_200_1.va.y, iter_200_1.va.z))
					arg_200_0:LockAngles()

					break
				end

				local var_200_6 = game.globalVars.m_flFrameTime or 0.015
				local var_200_7 = math.clamp(var_200_6 * 64 / var_200_5, 0, 1)
				local var_200_8 = math.AngleNormalize(iter_200_1.va.x - var_200_4.x)
				local var_200_9 = math.AngleNormalize(iter_200_1.va.y - var_200_4.y)
				local var_200_10 = Vector(math.clamp(var_200_4.x + var_200_8 * var_200_7, -89, 89), math.AngleNormalize(var_200_4.y + var_200_9 * var_200_7), 0)

				arg_200_0:SetViewangles(var_200_10)
				arg_200_0:LockAngles()
			end

			break
		end
	end
end)

function slot_0_181_0()
	if not slot_0_46_0.enabled and (not slot_0_54_0.aiPeek or not slot_0_54_0.aiPeek:Get()) then
		return
	end

	local var_201_0 = draw.surface
	local var_201_1 = draw.Color(100, 255, 100, 120)
	local var_201_2 = draw.Color(100, 100, 255, 120)
	local var_201_3 = draw.Color(255, 200, 50, 200)
	local var_201_4 = draw.Color(50, 255, 50, 255)
	local var_201_5 = draw.Color(255, 255, 255, 40)
	local var_201_6 = slot_0_47_0.visLeftOrg
	local var_201_7 = slot_0_47_0.visRightOrg

	if var_201_6 then
		local var_201_8 = math.WorldToScreen(var_201_6)

		if var_201_8 then
			local var_201_9 = slot_0_47_0.leftOk and var_201_4 or var_201_1

			var_201_0:AddRectFilled(draw.Rect(var_201_8.x - 4, var_201_8.y - 4, var_201_8.x + 4, var_201_8.y + 4), var_201_9)
		end
	end

	if var_201_7 then
		local var_201_10 = math.WorldToScreen(var_201_7)

		if var_201_10 then
			local var_201_11 = slot_0_47_0.rightOk and var_201_4 or var_201_2

			var_201_0:AddRectFilled(draw.Rect(var_201_10.x - 4, var_201_10.y - 4, var_201_10.x + 4, var_201_10.y + 4), var_201_11)
		end
	end

	local var_201_12 = slot_0_47_0.visPts

	if var_201_12 then
		for iter_201_0, iter_201_1 in ipairs(var_201_12) do
			if iter_201_1 then
				local var_201_13 = math.WorldToScreen(iter_201_1)

				if var_201_13 then
					var_201_0:AddRectFilled(draw.Rect(var_201_13.x - 2, var_201_13.y - 2, var_201_13.x + 2, var_201_13.y + 2), var_201_3)

					if var_201_6 and slot_0_47_0.leftOk then
						local var_201_14 = math.WorldToScreen(var_201_6)

						if var_201_14 then
							var_201_0:AddLine(var_201_14, var_201_13, var_201_5, 1)
						end
					end

					if var_201_7 and slot_0_47_0.rightOk then
						local var_201_15 = math.WorldToScreen(var_201_7)

						if var_201_15 then
							var_201_0:AddLine(var_201_15, var_201_13, var_201_5, 1)
						end
					end
				end
			end
		end
	end
end

events.presentQueue:Add(function()
	slot_0_14_0 = slot_0_14_0 + 1
	slot_202_0_0 = entities.GetLocalPawn()
	slot_202_1_0 = draw.surface

	if _savedHitlog then
		if slot_0_54_0.hitlog then
			slot_202_2_4 = slot_0_54_0.hitlog:GetValue()

			if slot_202_2_4 then
				slot_202_2_4:Set(_savedHitlog)
			end
		end

		_savedHitlog = false
	end

	slot_0_6_0()

	if slot_0_5_0.fontsDirty then
		slot_0_105_0()
	end

	slot_0_103_0()
	slot_0_95_0()
	slot_0_94_0()

	if slot_0_29_0.awpBodyaim and slot_0_18_0.forceBodyaim then
		slot_202_2_3 = entities.GetLocalPawn()
		slot_202_3_3 = slot_202_2_3 and slot_202_2_3:GetActiveWeapon()
		slot_202_4_3 = slot_202_3_3 and slot_202_3_3:GetDefIndex() or 0

		slot_0_23_0(slot_0_18_0.forceBodyaim, slot_202_4_3 == (weapon_id.awp or 0))
	elseif not slot_0_29_0.awpBodyaim and slot_0_18_0.forceBodyaim then
		slot_0_23_0(slot_0_18_0.forceBodyaim, false)
	end

	slot_0_102_0()
	syncNativeControls()
	slot_0_106_0()
	slot_0_115_0()
	slot_0_114_0()
	slot_0_96_0()
	slot_0_118_0()

	if slot_0_26_0.rageFov and slot_0_22_0(slot_0_18_0.rageEnable) and slot_0_18_0.afFov then
		slot_202_2_2 = slot_0_24_0(slot_0_18_0.afFov) or 0

		if slot_202_2_2 > 0 then
			slot_202_3_2, slot_202_4_2 = game.engine:GetScreenSize()
			slot_202_5_2 = slot_0_0_0.floor(slot_202_3_2 / 2)
			slot_202_6_2 = slot_0_0_0.floor(slot_202_4_2 / 2)
			slot_202_7_2 = 90
			slot_202_8_2 = slot_0_0_0.floor(slot_202_2_2 / slot_202_7_2 * (slot_202_3_2 / 2))

			if slot_202_8_2 > 1 and slot_202_8_2 < slot_202_3_2 then
				slot_202_9_2 = draw.surface
				slot_202_10_2 = 48
				slot_202_11_2 = 2 * math.pi / slot_202_10_2
				slot_202_12_2 = draw.Color(255, 255, 255, 60)

				for iter_202_0 = 0, slot_202_10_2 - 1 do
					slot_202_17_2 = iter_202_0 * slot_202_11_2
					slot_202_18_2 = (iter_202_0 + 1) * slot_202_11_2
					slot_202_19_2 = slot_202_5_2 + slot_0_0_0.floor(slot_0_0_0.cos(slot_202_17_2) * slot_202_8_2)
					slot_202_20_5 = slot_202_6_2 + slot_0_0_0.floor(slot_0_0_0.sin(slot_202_17_2) * slot_202_8_2)
					slot_202_21_2 = slot_202_5_2 + slot_0_0_0.floor(slot_0_0_0.cos(slot_202_18_2) * slot_202_8_2)
					slot_202_22_2 = slot_202_6_2 + slot_0_0_0.floor(slot_0_0_0.sin(slot_202_18_2) * slot_202_8_2)

					slot_202_9_2:AddLine(draw.Vec2(slot_202_19_2, slot_202_20_5), draw.Vec2(slot_202_21_2, slot_202_22_2), slot_202_12_2, 1)
				end
			end
		end
	end

	slot_0_97_0()
	slot_0_127_0()
	slot_0_129_0()
	slot_0_130_0()
	slot_0_123_0()

	if drawBombTimer then
		drawBombTimer()
	end

	slot_0_181_0()

	if slot_0_26_0.afdelay and slot_0_160_0 and slot_0_160_0.enabled then
		slot_202_2_1 = draw.surface
		slot_202_2_1.font = draw.fonts.gui_main
		slot_202_3_1 = game.engine:GetScreenSize()
		slot_202_4_1 = 120
		slot_202_5_1 = 6
		slot_202_6_1 = 10
		slot_202_7_1 = 6
		slot_202_8_1 = game.globalVars.m_flRealTime or 0
		slot_202_9_1 = slot_0_160_0.timer and slot_0_0_0.min((slot_202_8_1 - slot_0_160_0.timer) * 1000, slot_0_160_0.ms) or 0
		slot_202_10_1 = slot_0_160_0.ms > 0 and slot_202_9_1 / slot_0_160_0.ms or 0

		if gui.IsVisible() and not slot_0_160_0.timer then
			slot_202_10_1 = 0
			slot_202_9_1 = 0
		end

		slot_202_11_1 = nil
		slot_202_12_1 = nil
		slot_202_13_2 = nil

		if slot_0_160_0.fired then
			slot_202_11_1 = 0
			slot_202_12_1 = 255
			slot_202_13_1 = 255
		elseif slot_202_10_1 < 0.5 then
			slot_202_14_4 = slot_202_10_1 / 0.5
			slot_202_11_1 = 220
			slot_202_12_1 = slot_0_0_0.floor(220 * slot_202_14_4)
			slot_202_13_1 = 0
		elseif slot_202_10_1 < 0.9 then
			slot_202_14_3 = (slot_202_10_1 - 0.5) / 0.4
			slot_202_11_1 = slot_0_0_0.floor(220 * (1 - slot_202_14_3))
			slot_202_12_1 = 200
			slot_202_13_1 = 0
		else
			slot_202_14_2 = (slot_202_10_1 - 0.9) / 0.1
			slot_202_11_1 = 0
			slot_202_12_1 = 200
			slot_202_13_1 = slot_0_0_0.floor(255 * slot_202_14_2)
		end

		slot_202_14_1 = draw.Color(slot_202_11_1, slot_202_12_1, slot_202_13_1, 255)
		slot_202_15_1 = slot_0_160_0.fired and "Ready" or gui.IsVisible() and not slot_0_160_0.timer and "Delay Shot" or slot_0_0_0.floor(slot_202_9_1) .. " / " .. slot_0_0_0.floor(slot_0_160_0.ms)
		slot_202_16_1 = slot_202_4_1 + slot_202_6_1 * 2
		slot_202_17_1 = slot_202_7_1 * 2 + 14 + slot_202_5_1 + 4
		slot_202_18_1 = (slot_0_32_0.x or slot_0_0_0.floor(slot_202_3_1 / 2)) - slot_0_0_0.floor(slot_202_16_1 / 2)
		slot_202_19_1 = slot_0_32_0.y or 780
		slot_0_32_0.lastW = slot_202_16_1
		slot_0_32_0.lastH = slot_202_17_1

		slot_202_2_1:AddRectFilledRounded(draw.Rect(slot_202_18_1, slot_202_19_1, slot_202_18_1 + slot_202_16_1, slot_202_19_1 + slot_202_17_1), draw.Color(5, 5, 5, 180), 6, draw.Rounding.ALL)

		slot_202_20_4 = slot_202_18_1 + slot_202_6_1
		slot_202_21_1 = slot_202_20_4 + slot_0_0_0.floor((slot_202_4_1 - #slot_202_15_1 * 7) / 2)

		slot_202_2_1:AddText(draw.Vec2(slot_202_21_1, slot_202_19_1 + slot_202_7_1), slot_202_15_1, slot_202_14_1)

		slot_202_22_1 = slot_202_19_1 + slot_202_7_1 + 14 + 2

		slot_202_2_1:AddRectFilledRounded(draw.Rect(slot_202_20_4, slot_202_22_1, slot_202_20_4 + slot_202_4_1, slot_202_22_1 + slot_202_5_1), draw.Color(30, 30, 30, 200), 3, draw.Rounding.ALL)

		slot_202_23_1 = slot_0_0_0.floor(slot_202_4_1 * slot_202_10_1)

		if slot_202_23_1 > 0 then
			slot_202_2_1:AddRectFilledRounded(draw.Rect(slot_202_20_4, slot_202_22_1, slot_202_20_4 + slot_202_23_1, slot_202_22_1 + slot_202_5_1), draw.Color(slot_202_11_1, slot_202_12_1, slot_202_13_1, 230), 3, draw.Rounding.ALL)
		end
	end

	if slot_0_26_0.jumpApex then
		slot_202_2_0 = gui.IsVisible()

		if slot_202_0_0 and (slot_202_0_0:IsAlive() or slot_202_2_0) then
			slot_202_3_0 = slot_202_0_0 and slot_202_0_0.m_fFlags and slot_202_0_0.m_fFlags:Get() or 0
			slot_202_4_0 = slot_0_0_0.band(slot_202_3_0, 1) ~= 0

			if not slot_202_4_0 or slot_202_2_0 then
				slot_202_5_0 = slot_202_0_0 and slot_202_0_0:GetAbsVelocity() or {
					z = 0,
					[0] = nil
				}

				if slot_202_5_0 and slot_202_5_0.z > -400 or slot_202_2_0 then
					slot_202_6_0 = slot_202_5_0.z
					slot_202_7_0 = 0

					if slot_202_6_0 > 0 then
						slot_202_7_0 = slot_0_0_0.max(0, slot_0_0_0.min(1, 1 - slot_202_6_0 / 302))
					elseif not slot_202_4_0 then
						slot_202_7_0 = slot_0_0_0.max(0, slot_0_0_0.min(1, 1 - slot_0_0_0.abs(slot_202_6_0) / 302))
					end

					slot_202_8_0 = draw.surface
					slot_202_8_0.font = draw.fonts.gui_main
					slot_202_9_0 = game.engine:GetScreenSize()
					slot_202_10_0 = 120
					slot_202_11_0 = 6
					slot_202_12_0 = 10
					slot_202_13_0 = 6
					slot_202_14_0 = 220
					slot_202_15_0 = 220
					slot_202_16_0 = 220
					slot_202_17_0 = "Ascending"
					slot_202_18_0 = game.globalVars.m_flRealTime or 0

					if slot_0_0_0.abs(slot_202_6_0) < 30 and not slot_202_4_0 then
						slot_0_33_0.lastApexTime = slot_202_18_0
					end

					slot_202_19_0 = slot_202_18_0 - (slot_0_33_0.lastApexTime or 0) < 0.16

					if slot_202_2_0 and slot_202_4_0 then
						slot_202_17_0 = "Jump apex"
						slot_202_7_0 = 0
						slot_202_14_0, slot_202_15_0, slot_202_16_0 = 220, 220, 220
					elseif slot_202_19_0 then
						slot_202_14_0, slot_202_15_0, slot_202_16_0 = 0, 255, 255
						slot_202_17_0 = "APEX"
					elseif slot_202_6_0 < 0 then
						slot_202_14_0, slot_202_15_0, slot_202_16_0 = 0, 200, 255
						slot_202_17_0 = "Descending"
					elseif slot_202_7_0 < 0.5 then
						slot_202_20_3 = slot_202_7_0 / 0.5
						slot_202_14_0 = 220
						slot_202_15_0 = slot_0_0_0.floor(220 * slot_202_20_3)
						slot_202_16_0 = 0
					elseif slot_202_7_0 < 0.9 then
						slot_202_20_2 = (slot_202_7_0 - 0.5) / 0.4
						slot_202_14_0 = slot_0_0_0.floor(220 * (1 - slot_202_20_2))
						slot_202_15_0 = 200
						slot_202_16_0 = 0
					else
						slot_202_20_1 = (slot_202_7_0 - 0.9) / 0.1
						slot_202_14_0 = 0
						slot_202_15_0 = 200
						slot_202_16_0 = slot_0_0_0.floor(255 * slot_202_20_1)
					end

					slot_202_20_0 = draw.Color(slot_202_14_0, slot_202_15_0, slot_202_16_0, 255)
					slot_202_21_0 = slot_202_10_0 + slot_202_12_0 * 2
					slot_202_22_0 = slot_202_13_0 * 2 + 14 + slot_202_11_0 + 4
					slot_202_23_0 = (slot_0_33_0.x or slot_0_0_0.floor(slot_202_9_0 / 2)) - slot_0_0_0.floor(slot_202_21_0 / 2)
					slot_202_24_0 = slot_0_33_0.y or slot_0_26_0.afdelay and slot_0_160_0 and slot_0_160_0.enabled and 740 or 780
					slot_0_33_0.lastW = slot_202_21_0
					slot_0_33_0.lastH = slot_202_22_0

					slot_202_8_0:AddRectFilledRounded(draw.Rect(slot_202_23_0, slot_202_24_0, slot_202_23_0 + slot_202_21_0, slot_202_24_0 + slot_202_22_0), draw.Color(5, 5, 5, 180), 6, draw.Rounding.ALL)

					slot_202_25_0 = slot_202_23_0 + slot_202_12_0
					slot_202_26_0 = slot_202_25_0 + slot_0_0_0.floor((slot_202_10_0 - #slot_202_17_0 * 7) / 2)

					slot_202_8_0:AddText(draw.Vec2(slot_202_26_0, slot_202_24_0 + slot_202_13_0), slot_202_17_0, slot_202_20_0)

					slot_202_27_0 = slot_202_24_0 + slot_202_13_0 + 14 + 2

					slot_202_8_0:AddRectFilledRounded(draw.Rect(slot_202_25_0, slot_202_27_0, slot_202_25_0 + slot_202_10_0, slot_202_27_0 + slot_202_11_0), draw.Color(30, 30, 30, 200), 3, draw.Rounding.ALL)

					slot_202_28_0 = slot_0_0_0.floor(slot_202_10_0 * slot_202_7_0)

					if slot_202_28_0 > 0 then
						slot_202_8_0:AddRectFilledRounded(draw.Rect(slot_202_25_0, slot_202_27_0, slot_202_25_0 + slot_202_28_0, slot_202_27_0 + slot_202_11_0), draw.Color(slot_202_14_0, slot_202_15_0, slot_202_16_0, 230), 3, draw.Rounding.ALL)
					end
				end
			end
		end
	end

	slot_0_128_0()
	slot_0_153_0()
	slot_0_154_0()
end)
events.input:Add(function()
	slot_0_94_0()
end)
events.createMove:Add(function(arg_204_0)
	if not slot_0_54_0.disableR8M2 or not slot_0_54_0.disableR8M2:Get() then
		return
	end

	local var_204_0 = entities.GetLocalPawn()

	if not var_204_0 or not var_204_0:IsAlive() then
		return
	end

	local var_204_1 = var_204_0:GetActiveWeapon()

	if not var_204_1 then
		return
	end

	local var_204_2 = var_204_1:ToWeaponBaseGun()

	if not var_204_2 then
		return
	end

	local var_204_3 = var_204_2:GetDefIndex()

	if var_204_3 == weapon_id.r8 or var_204_3 == 64 then
		arg_204_0:RemoveButton(InputBitMask_t.IN_ATTACK2)
	end
end)

slot_0_182_0 = {}

events.input:Add(function(arg_205_0, arg_205_1, arg_205_2)
	if not slot_0_54_0.disableR8M2 or not slot_0_54_0.disableR8M2:Get() then
		return false
	end

	local var_205_0 = entities.GetLocalPawn()

	if not var_205_0 or not var_205_0:IsAlive() then
		return false
	end

	local var_205_1 = var_205_0:GetActiveWeapon()

	if not var_205_1 then
		return false
	end

	local var_205_2 = var_205_1:ToWeaponBaseGun()

	if not var_205_2 then
		return false
	end

	local var_205_3 = var_205_2:GetDefIndex()

	if var_205_3 ~= weapon_id.r8 and var_205_3 ~= 64 then
		return false
	end

	local var_205_4 = false

	if (arg_205_0 == 256 or arg_205_0 == 260) and arg_205_1 == 2 then
		slot_0_182_0[arg_205_1] = true
		var_205_4 = true
	end

	if arg_205_0 == 257 or arg_205_0 == 261 then
		slot_0_182_0[arg_205_1] = false
	end

	if arg_205_0 == 516 or arg_205_0 == 517 or arg_205_0 == 518 then
		var_205_4 = true
	end

	if arg_205_0 == 516 or arg_205_0 == 517 or arg_205_0 == 518 then
		var_205_4 = true
	end

	return var_205_4
end)

slot_0_183_9 = draw.FontGDI("Segoe UI Black", 14, 900, draw.FontFlags.ANTIALIAS)

slot_0_183_9:Create()

slot_0_184_8 = {}
slot_0_185_7 = gui.ctx:Find("legit>weapon>general>trigger>triggerbot")
slot_0_186_3 = {
	[weapon_id.awp] = 1.5,
	[weapon_id.ssg08] = 1.3,
	[weapon_id.scar20] = 0.25,
	[weapon_id.g3sg1] = 0.25,
	[weapon_id.deagle] = 0.22,
	[weapon_id.revolver] = 0.5,
	[weapon_id.usp_silencer] = 0.17,
	[weapon_id.hkp2000] = 0.16,
	[weapon_id.p250] = 0.21,
	[weapon_id.cz75a] = 0.21,
	[weapon_id.fiveseven] = 0.21,
	[weapon_id.glock] = 0.21,
	[weapon_id.tec9] = 0.17,
	[weapon_id.m4a1] = 0.16,
	[weapon_id.m4a1_silencer] = 0.12,
	[weapon_id.ak47] = 0.1,
	[weapon_id.galilar] = 0.09,
	[weapon_id.famas] = 0.09,
	[weapon_id.sg556] = 0.09,
	[weapon_id.aug] = 0.09,
	[weapon_id.p90] = 0.08,
	[weapon_id.mp7] = 0.08,
	[weapon_id.mp9] = 0.07,
	[weapon_id.mac10] = 0.08,
	[weapon_id.ump45] = 0.08,
	[weapon_id.bizon] = 0.08,
	[weapon_id.mp5sd] = 0.08,
	[weapon_id.xm1014] = 0.8,
	[weapon_id.sawedoff] = 0.85,
	[weapon_id.nova] = 0.7,
	[weapon_id.mag7] = 0.75,
	[weapon_id.m249] = 0.08,
	[weapon_id.negev] = 0.08
}
slot_0_187_3 = {
	readyTimeMs = 0,
	charges = 0,
	weaponId = 0,
	[0] = nil
}

function slot_0_3_0(arg_206_0)
	if not arg_206_0 then
		return nil
	end

	local var_206_0 = arg_206_0:GetValue()

	if type(var_206_0) == "number" then
		return var_206_0
	end

	if var_206_0 and var_206_0.Get then
		return var_206_0:Get()
	end

	return nil
end

function slot_0_188_1(arg_207_0)
	if not arg_207_0 then
		return 0
	end

	local var_207_0 = arg_207_0:GetActiveWeapon()

	if not var_207_0 then
		return 0
	end

	local var_207_1 = Schema:get(var_207_0, "m_nNextPrimaryAttackTick", "int*")

	if type(var_207_1) ~= "number" then
		return 0
	end

	local var_207_2 = game.globalVars.m_iTickCount or 0

	if var_207_2 < var_207_1 then
		return var_207_1 - var_207_2
	end

	return 0
end

function slot_0_189_1(arg_208_0)
	if not arg_208_0 then
		return 0
	end

	local var_208_0 = arg_208_0:GetActiveWeapon()

	if not var_208_0 then
		slot_0_187_3.readyTimeMs = 0

		return 0
	end

	local var_208_1 = var_208_0:GetDefIndex() or 0
	local var_208_2 = (game.globalVars.m_flRealTime or 0) * 1000

	if var_208_1 ~= slot_0_187_3.weaponId then
		slot_0_187_3.weaponId = var_208_1
		slot_0_187_3.readyTimeMs = 0
		slot_0_187_3.charges = 0

		return 0
	end

	if slot_0_188_1(arg_208_0) > 0 then
		slot_0_187_3.readyTimeMs = 0
		slot_0_187_3.charges = 0

		return 0
	end

	if slot_0_187_3.readyTimeMs == 0 then
		slot_0_187_3.readyTimeMs = var_208_2
		slot_0_187_3.charges = 1

		return 1
	end

	if (slot_0_186_3[var_208_1] or 1) * 1000 <= var_208_2 - slot_0_187_3.readyTimeMs then
		slot_0_187_3.charges = 2

		return 2
	end

	slot_0_187_3.charges = 1

	return 1
end

function slot_0_190_1()
	if not slot_0_54_0.crosshairPos then
		return -1
	end

	local var_209_0 = slot_0_54_0.crosshairPos:Get()

	if not var_209_0 then
		return -1
	end

	if var_209_0:Get(0) then
		return 0
	end

	if var_209_0:Get(1) then
		return 1
	end

	if var_209_0:Get(2) then
		return 2
	end

	if var_209_0:Get(3) then
		return 3
	end

	return -1
end

function slot_0_191_1(arg_210_0)
	if not slot_0_54_0.crosshairItems then
		return false
	end

	local var_210_0 = slot_0_54_0.crosshairItems:Get()

	if not var_210_0 then
		return false
	end

	return var_210_0:Get(arg_210_0) or false
end

function slot_0_192_1(arg_211_0, arg_211_1, arg_211_2, arg_211_3, arg_211_4, arg_211_5, arg_211_6, arg_211_7)
	local var_211_0 = arg_211_5 .. " "
	local var_211_1 = 0
	local var_211_2 = 0
	local var_211_3 = 10

	if slot_0_183_9 and slot_0_183_9.GetTextSize then
		local var_211_4 = slot_0_183_9:GetTextSize(var_211_0, true)

		var_211_1 = var_211_4.x

		local var_211_5 = var_211_4.y

		if arg_211_6 and #arg_211_6 > 0 then
			var_211_2 = slot_0_183_9:GetTextSize(arg_211_6, true).x
		end
	end

	local var_211_6 = var_211_1 + var_211_2
	local var_211_7

	if arg_211_4 == 0 or arg_211_4 == 2 then
		var_211_7 = arg_211_2 - arg_211_3 - var_211_6
	else
		var_211_7 = arg_211_2 + arg_211_3
	end

	arg_211_0:AddText(draw.Vec2(var_211_7 + 1, arg_211_1 + 1), var_211_0, draw.Color(0, 0, 0, 255))
	arg_211_0:AddText(draw.Vec2(var_211_7 - 1, arg_211_1 - 1), var_211_0, draw.Color(0, 0, 0, 255))
	arg_211_0:AddText(draw.Vec2(var_211_7, arg_211_1), var_211_0, draw.Color(255, 255, 255, 255))

	if not slot_0_184_8[arg_211_5] then
		slot_0_184_8[arg_211_5] = {
			curAlpha = 0,
			curY = arg_211_1 + 15,
			prevValue = arg_211_6
		}
	end

	local var_211_8 = slot_0_184_8[arg_211_5]

	if var_211_8.prevValue ~= arg_211_6 then
		var_211_8.prevValue = arg_211_6
		var_211_8.curY = arg_211_1 + 15
		var_211_8.curAlpha = 0
	end

	var_211_8.curY = var_211_8.curY + (arg_211_1 - var_211_8.curY) * 0.2
	var_211_8.curAlpha = slot_0_0_0.min(1, var_211_8.curAlpha + 0.15)

	local var_211_9 = 255
	local var_211_10 = 255
	local var_211_11 = 255

	if arg_211_7 then
		var_211_9, var_211_10, var_211_11 = arg_211_7:GetR(), arg_211_7:GetG(), arg_211_7:GetB()
	end

	local var_211_12 = draw.Color(var_211_9, var_211_10, var_211_11, slot_0_0_0.floor(var_211_8.curAlpha * 255))
	local var_211_13 = draw.Color(0, 0, 0, slot_0_0_0.floor(var_211_8.curAlpha * 255))
	local var_211_14 = var_211_7 + var_211_1

	arg_211_0:AddText(draw.Vec2(var_211_14 + 1, var_211_8.curY + 1), arg_211_6, var_211_13)
	arg_211_0:AddText(draw.Vec2(var_211_14 - 1, var_211_8.curY - 1), arg_211_6, var_211_13)
	arg_211_0:AddText(draw.Vec2(var_211_14, var_211_8.curY), arg_211_6, var_211_12)
end

function slot_0_193_1(arg_212_0, arg_212_1, arg_212_2, arg_212_3, arg_212_4, arg_212_5)
	local var_212_0

	if arg_212_4 == 0 or arg_212_4 == 2 then
		var_212_0 = arg_212_2 - arg_212_3 - 20
	else
		var_212_0 = arg_212_2 + arg_212_3
	end

	local var_212_1 = draw.Color(128, 128, 128, 255)
	local var_212_2 = draw.Color(255, 255, 255, 255)
	local var_212_3 = draw.Color(0, 0, 0, 255)
	local var_212_4 = arg_212_5 >= 1 and var_212_2 or var_212_1
	local var_212_5 = arg_212_5 >= 2 and var_212_2 or var_212_1

	arg_212_0:AddText(draw.Vec2(var_212_0 + 1, arg_212_1 + 1), "D", var_212_3)
	arg_212_0:AddText(draw.Vec2(var_212_0 - 1, arg_212_1 - 1), "D", var_212_3)
	arg_212_0:AddText(draw.Vec2(var_212_0, arg_212_1), "D", var_212_4)

	local var_212_6 = 7

	if slot_0_183_9 and slot_0_183_9.GetTextSize then
		var_212_6 = slot_0_183_9:GetTextSize("D", true).x
	end

	arg_212_0:AddText(draw.Vec2(var_212_0 + var_212_6 + 1, arg_212_1 + 1), "T", var_212_3)
	arg_212_0:AddText(draw.Vec2(var_212_0 + var_212_6 - 1, arg_212_1 - 1), "T", var_212_3)
	arg_212_0:AddText(draw.Vec2(var_212_0 + var_212_6, arg_212_1), "T", var_212_5)

	if arg_212_5 >= 2 then
		local var_212_7 = (game.globalVars.m_flRealTime or 0) * 6
		local var_212_8 = slot_0_0_0.sin(var_212_7) * 0.5 + 0.5
		local var_212_9 = slot_0_0_0.floor(255 - 55 * var_212_8)
		local var_212_10 = slot_0_0_0.floor(255 - 27 * var_212_8)
		local var_212_11 = draw.Color(var_212_9, var_212_10, 255, 255)

		arg_212_0:AddText(draw.Vec2(var_212_0 + 1, arg_212_1 + 1), "DT", var_212_3)
		arg_212_0:AddText(draw.Vec2(var_212_0 - 1, arg_212_1 - 1), "DT", var_212_3)
		arg_212_0:AddText(draw.Vec2(var_212_0, arg_212_1), "DT", var_212_2)
		arg_212_0:AddText(draw.Vec2(var_212_0, arg_212_1), "DT", var_212_11)
	end
end

events.presentQueue:Add(function()
	if not slot_0_90_0() then
		return
	end

	slot_213_0_0 = entities.GetLocalPawn()

	if not slot_213_0_0 or not slot_213_0_0:IsAlive() then
		return
	end

	slot_213_1_0 = slot_0_190_1()

	if slot_213_1_0 == -1 then
		return
	end

	if not (slot_0_191_1(0) or slot_0_191_1(1) or slot_0_191_1(2) or slot_0_191_1(3) or slot_0_191_1(4)) then
		return
	end

	slot_213_3_0 = draw.surface

	if slot_0_183_9 then
		slot_213_3_0.font = slot_0_183_9
	end

	slot_213_4_0, slot_213_5_0 = game.engine:GetScreenSize()
	slot_213_6_0 = slot_213_4_0 / 2
	slot_213_7_0 = slot_213_5_0 / 2
	slot_213_8_0 = false

	if slot_0_18_0.rageEnable then
		slot_213_9_1 = slot_0_18_0.rageEnable:GetValue()

		if slot_213_9_1 and slot_213_9_1.Get then
			slot_213_8_0 = slot_213_9_1:Get()
		end
	end

	slot_213_9_0 = false

	if slot_0_185_7 then
		slot_213_10_1 = slot_0_185_7:GetValue()

		if slot_213_10_1 and slot_213_10_1.Get then
			slot_213_9_0 = slot_213_10_1:Get()
		end
	end

	if not slot_213_8_0 and not slot_213_9_0 then
		return
	end

	slot_213_10_0 = slot_213_0_0:GetActiveWeapon()
	slot_213_11_0 = "general"

	if slot_213_10_0 then
		slot_213_12_1 = slot_213_10_0:ToWeaponBaseGun()

		if slot_213_12_1 then
			slot_213_13_6 = slot_213_12_1:GetDefIndex() or 0

			if slot_213_13_6 ~= weapon_id.knife and slot_213_13_6 ~= weapon_id.knife_t and slot_213_13_6 ~= weapon_id.taser and slot_213_13_6 ~= weapon_id.melee and (not (slot_213_13_6 >= 500) or not (slot_213_13_6 <= 526)) then
				slot_213_11_0 = slot_0_1_0(slot_213_13_6)
			end
		end
	end

	slot_213_12_0 = {}

	if slot_0_191_1(0) and slot_213_10_0 then
		slot_213_13_5 = slot_213_10_0:ToWeaponBaseGun()

		if slot_213_13_5 then
			slot_213_14_4 = slot_213_13_5:GetDefIndex() or 0

			if slot_213_14_4 ~= weapon_id.knife and slot_213_14_4 ~= weapon_id.knife_t and slot_213_14_4 ~= weapon_id.taser and slot_213_14_4 ~= weapon_id.melee and (not (slot_213_14_4 >= 500) or not (slot_213_14_4 <= 526)) then
				slot_213_15_3 = slot_0_2_0(slot_213_8_0, slot_213_11_0, "mindamage")
				slot_213_16_3 = gui.ctx:Find(slot_213_15_3)
				slot_213_17_3 = slot_0_3_0(slot_213_16_3)

				if slot_213_17_3 ~= nil then
					slot_213_18_2 = tonumber(slot_213_17_3) or 0
					slot_213_19_1 = nil
					slot_213_20_1 = nil

					if slot_213_18_2 > 125 then
						slot_213_19_1 = "LETHAL"
						slot_213_20_1 = draw.Color(255, 255, 255, 255)
					else
						slot_213_21_2 = false

						if slot_213_16_3 then
							slot_213_22_4 = slot_213_16_3:Cast()

							if slot_213_22_4 and slot_213_22_4.GetHotkeyState then
								slot_213_21_2 = slot_213_22_4:GetHotkeyState()
							end
						end

						slot_213_19_1 = tostring(slot_213_18_2)
						slot_213_20_1 = slot_213_21_2 and slot_0_37_0.grad1 or nil
					end

					slot_213_12_0[#slot_213_12_0 + 1] = {
						t = "MD",
						[0] = nil,
						v = slot_213_19_1,
						c = slot_213_20_1
					}
				end
			end
		end
	end

	if slot_0_191_1(1) and slot_213_10_0 then
		slot_213_13_4 = slot_213_10_0:ToWeaponBaseGun()

		if slot_213_13_4 then
			slot_213_14_3 = slot_213_13_4:GetDefIndex() or 0

			if slot_213_14_3 ~= weapon_id.knife and slot_213_14_3 ~= weapon_id.knife_t and slot_213_14_3 ~= weapon_id.taser and slot_213_14_3 ~= weapon_id.melee and (not (slot_213_14_3 >= 500) or not (slot_213_14_3 <= 526)) then
				slot_213_15_2 = slot_0_2_0(slot_213_8_0, slot_213_11_0, "hitchance")
				slot_213_16_2 = gui.ctx:Find(slot_213_15_2)
				slot_213_17_2 = slot_0_3_0(slot_213_16_2)

				if slot_213_17_2 ~= nil then
					slot_213_18_1 = tonumber(slot_213_17_2) or 0
					slot_213_19_0 = nil
					slot_213_20_0 = nil

					if slot_213_18_1 < 0 or slot_213_18_1 > 100 then
						slot_213_19_0 = "AUTO"
						slot_213_20_0 = draw.Color(255, 255, 255, 255)
					else
						slot_213_21_1 = false

						if slot_213_16_2 then
							slot_213_22_3 = slot_213_16_2:Cast()

							if slot_213_22_3 and slot_213_22_3.GetHotkeyState then
								slot_213_21_1 = slot_213_22_3:GetHotkeyState()
							end
						end

						slot_213_19_0 = tostring(slot_213_18_1)
						slot_213_20_0 = slot_213_21_1 and slot_0_37_0.grad1 or nil
					end

					slot_213_12_0[#slot_213_12_0 + 1] = {
						t = "HC",
						[0] = nil,
						v = slot_213_19_0,
						c = slot_213_20_0
					}
				end
			end
		end
	end

	if slot_0_191_1(2) then
		slot_213_13_3 = slot_213_8_0 and slot_0_2_0(true, slot_213_11_0, "autowall") or "legit>general>penetration"
		slot_213_14_2 = gui.ctx:Find(slot_213_13_3)

		if slot_0_3_0(slot_213_14_2) then
			slot_213_12_0[#slot_213_12_0 + 1] = {
				t = "AW",
				v = "",
				[0] = nil
			}
		end
	end

	if slot_0_191_1(3) and slot_0_18_0.dt then
		slot_213_13_2 = slot_0_18_0.dt:GetValue()
		slot_213_14_1 = false

		if slot_213_13_2 and slot_213_13_2.Get then
			slot_213_14_1 = slot_213_13_2:Get()
		end

		if slot_213_14_1 then
			slot_213_15_1 = false

			if slot_213_10_0 then
				slot_213_16_1 = slot_213_10_0:ToWeaponBaseGun()

				if slot_213_16_1 then
					slot_213_17_1 = slot_213_16_1:GetDefIndex() or 0

					if slot_213_17_1 == weapon_id.taser or slot_213_17_1 == weapon_id.revolver then
						slot_213_15_1 = true
					end

					if slot_213_17_1 == weapon_id.flashbang or slot_213_17_1 == weapon_id.hegrenade or slot_213_17_1 == weapon_id.smokegrenade then
						slot_213_15_1 = true
					end

					if slot_213_17_1 == weapon_id.decoy or slot_213_17_1 == weapon_id.molotov or slot_213_17_1 == weapon_id.incgrenade then
						slot_213_15_1 = true
					end

					if slot_213_17_1 == weapon_id.c4 or slot_213_17_1 == weapon_id.tagrenade or slot_213_17_1 == weapon_id.bumpmine then
						slot_213_15_1 = true
					end

					if slot_213_17_1 == weapon_id.breachcharge or slot_213_17_1 == weapon_id.diversion or slot_213_17_1 == weapon_id.fraggrenade then
						slot_213_15_1 = true
					end

					if slot_213_17_1 == weapon_id.snowball then
						slot_213_15_1 = true
					end
				end
			end

			if not slot_213_15_1 then
				slot_213_12_0[#slot_213_12_0 + 1] = {
					t = "DT",
					v = ""
				}
			end
		end
	end

	if slot_0_191_1(4) and slot_213_8_0 and slot_0_18_0.forceShoot then
		slot_213_13_1 = slot_0_18_0.forceShoot:GetValue()

		if slot_213_13_1 and slot_213_13_1:Get() then
			slot_213_12_0[#slot_213_12_0 + 1] = {
				t = "FS",
				v = "",
				[0] = nil
			}
		end
	end

	if #slot_213_12_0 == 0 then
		return
	end

	slot_213_13_0 = 8
	slot_213_14_0 = 13
	slot_213_15_0 = 14
	slot_213_16_0 = 7
	slot_213_17_0 = nil

	if slot_213_1_0 == 0 or slot_213_1_0 == 1 then
		slot_213_17_0 = slot_213_7_0 - slot_213_15_0
	else
		slot_213_17_0 = slot_213_7_0 + slot_213_16_0
	end

	for iter_213_0, iter_213_1 in ipairs(slot_213_12_0) do
		slot_213_23_2 = slot_213_17_0 + (iter_213_0 - 1) * slot_213_14_0

		if iter_213_1.t == "DT" then
			slot_0_193_1(slot_213_3_0, slot_213_23_2, slot_213_6_0, slot_213_13_0, slot_213_1_0, slot_0_189_1(slot_213_0_0))
		else
			slot_0_192_1(slot_213_3_0, slot_213_23_2, slot_213_6_0, slot_213_13_0, slot_213_1_0, iter_213_1.t, iter_213_1.v, iter_213_1.c)
		end
	end

	slot_213_18_0 = {}

	for iter_213_2, iter_213_3 in ipairs(slot_213_12_0) do
		slot_213_18_0[iter_213_3.t] = true
	end

	for iter_213_4, iter_213_5 in pairs(slot_0_184_8) do
		if not slot_213_18_0[iter_213_4] then
			slot_0_184_8[iter_213_4] = nil
		end
	end
end)

slot_0_183_8 = 0
slot_0_184_7 = 0
slot_0_185_6 = 0

events.event:Add(function(arg_214_0)
	if not slot_0_54_0.quickSwitch or not slot_0_54_0.quickSwitch:Get() then
		return
	end

	if not arg_214_0 or arg_214_0:GetName() ~= "weapon_fire" then
		return
	end

	local var_214_0 = entities.GetLocalPawn()

	if not var_214_0 or not var_214_0:IsAlive() then
		return
	end

	local var_214_1 = arg_214_0:GetPawnFromId("userid")

	if not var_214_1 or var_214_1 ~= var_214_0 then
		return
	end

	local var_214_2 = var_214_0:GetActiveWeapon()

	if not var_214_2 then
		return
	end

	if var_214_2.m_zoomLevel then
		slot_0_185_6 = var_214_2.m_zoomLevel:Get() or 0
	end

	local var_214_3 = var_214_2:ToWeaponBaseGun()
	local var_214_4 = var_214_3 and var_214_3:GetDefIndex() or 0
	local var_214_5 = false

	if var_214_4 == 40 then
		var_214_5 = true
	end

	if weapon_id and var_214_4 == weapon_id.ssg08 then
		var_214_5 = true
	end

	if not var_214_5 then
		return
	end

	slot_0_183_8 = 1
end)
events.createMove:Add(function(arg_215_0)
	if not slot_0_54_0.quickSwitch or not slot_0_54_0.quickSwitch:Get() then
		return
	end

	local var_215_0 = entities.GetLocalPawn()

	if not var_215_0 or not var_215_0:IsAlive() then
		return
	end

	if slot_0_183_8 == 0 then
		return
	end

	local var_215_1 = (game.globalVars or {}).m_iTickCount or 0

	if slot_0_183_8 == 1 then
		game.engine:ClientCmd("slot3")

		slot_0_183_8 = 2
		slot_0_184_7 = var_215_1 + 1
	elseif slot_0_183_8 == 2 then
		if var_215_1 >= slot_0_184_7 then
			game.engine:ClientCmd("slot1")

			slot_0_183_8 = 3
			slot_0_184_7 = var_215_1 + 8
		end
	elseif slot_0_183_8 == 3 and var_215_1 >= slot_0_184_7 then
		local var_215_2 = var_215_0:GetActiveWeapon()

		if var_215_2 then
			local var_215_3 = var_215_2:ToWeaponBaseGun()
			local var_215_4 = var_215_3 and var_215_3:GetDefIndex() or 0
			local var_215_5 = var_215_4 == 9 or var_215_4 == 40 or var_215_4 == 38 or var_215_4 == 11

			if weapon_id then
				var_215_5 = var_215_5 or var_215_4 == weapon_id.awp or var_215_4 == weapon_id.ssg08 or var_215_4 == weapon_id.scar20 or var_215_4 == weapon_id.g3sg1
			end

			if var_215_5 then
				local var_215_6 = 0

				if var_215_2.m_zoomLevel then
					var_215_6 = var_215_2.m_zoomLevel:Get() or 0
				end

				if var_215_6 == 0 then
					arg_215_0:SetButton(InputBitMask_t.IN_ATTACK2)
				else
					slot_0_183_8 = 0
				end
			else
				slot_0_183_8 = 0
			end
		else
			slot_0_183_8 = 0
		end
	end
end)

slot_0_183_7 = false
slot_0_184_6 = nil
slot_0_185_5 = false

function slot_0_186_2()
	if slot_0_184_6 ~= nil then
		return
	end

	if not slot_0_18_0.aaEnable then
		return
	end

	local var_216_0 = slot_0_18_0.aaEnable:GetValue()

	if not var_216_0 then
		return
	end

	if var_216_0:Get() then
		slot_0_184_6 = true

		var_216_0:Set(false)
	end
end

function slot_0_187_2()
	if slot_0_184_6 == nil then
		return
	end

	if not slot_0_18_0.aaEnable then
		return
	end

	local var_217_0 = slot_0_18_0.aaEnable:GetValue()

	if var_217_0 then
		var_217_0:Set(slot_0_184_6)
	end

	slot_0_184_6 = nil
end

events.event:Add(function(arg_218_0)
	if not arg_218_0 then
		return
	end

	if not slot_0_54_0.disableAaTimeout or not slot_0_54_0.disableAaTimeout:Get() then
		return
	end

	local var_218_0 = arg_218_0:GetName()

	if var_218_0 == "round_start" then
		slot_0_183_7 = true
		slot_0_185_5 = true

		slot_0_186_2()
	elseif var_218_0 == "round_freeze_end" then
		slot_0_183_7 = false
		slot_0_185_5 = true

		slot_0_187_2()
	end
end)
events.createMove:Add(function(arg_219_0)
	if not slot_0_54_0.disableAaTimeout or not slot_0_54_0.disableAaTimeout:Get() then
		slot_0_187_2()

		slot_0_183_7 = false
		slot_0_185_5 = false

		return
	end

	if not slot_0_90_0() then
		return
	end

	if not slot_0_185_5 then
		return
	end

	if slot_0_183_7 then
		slot_0_186_2()
	else
		slot_0_187_2()
	end
end)

slot_0_183_6 = {
	startTime = 0,
	duration = 0.09,
	wasOverride = false,
	cooldown = false,
	active = false
}

function slot_0_184_5(arg_220_0)
	if not arg_220_0 then
		return nil
	end

	if arg_220_0.Get then
		return arg_220_0:Get()
	end

	if arg_220_0.GetValue then
		local var_220_0 = arg_220_0:GetValue()

		if var_220_0 and var_220_0.Get then
			return var_220_0:Get()
		end
	end

	return nil
end

function slot_0_185_4(arg_221_0, arg_221_1)
	if not arg_221_0 or arg_221_1 == nil then
		return false
	end

	if arg_221_0.SetValue then
		arg_221_0:SetValue(arg_221_1)

		return true
	end

	if arg_221_0.Set then
		arg_221_0:Set(arg_221_1)

		return true
	end

	if arg_221_0.GetValue then
		local var_221_0 = arg_221_0:GetValue()

		if var_221_0 then
			local var_221_1 = var_221_0.Get and var_221_0:Get() or nil

			if type(arg_221_1) == "number" and var_221_1 and type(var_221_1) == "userdata" then
				local var_221_2 = math.floor(arg_221_1 + 0.5)

				if var_221_2 < 1 then
					var_221_2 = 1
				end

				if var_221_1.Reset then
					var_221_1:Reset()
				end

				if var_221_1.Set then
					var_221_1:Set(var_221_2)
				end

				if var_221_0.Set then
					var_221_0:Set(var_221_1)
				end

				if arg_221_0.Reset then
					arg_221_0:Reset()
				end

				return true
			end

			if var_221_0.Set then
				var_221_0:Set(arg_221_1)

				return true
			end
		end
	end

	return false
end

function slot_0_186_1()
	if slot_0_183_6.active then
		return
	end

	if slot_0_18_0.aaJitter then
		local var_222_0 = slot_0_184_5(slot_0_18_0.aaJitter)

		if var_222_0 ~= nil then
			slot_0_183_6.savedMode = var_222_0

			if type(var_222_0) == "userdata" and var_222_0.GetRaw then
				slot_0_183_6.savedModeRaw = var_222_0:GetRaw()
			end
		end

		if not slot_0_185_4(slot_0_18_0.aaJitter, 1) then
			slot_0_185_4(slot_0_18_0.aaJitter, 2)
		end
	end

	if slot_0_18_0.aaJitterAmt then
		local var_222_1 = slot_0_184_5(slot_0_18_0.aaJitterAmt)

		if var_222_1 ~= nil then
			slot_0_183_6.savedAmt = var_222_1
		end

		slot_0_185_4(slot_0_18_0.aaJitterAmt, 90)
	end

	slot_0_183_6.active = true
	slot_0_183_6.cooldown = true
	slot_0_183_6.startTime = game.globalVars.m_flRealTime or 0
end

function slot_0_187_1()
	if not slot_0_183_6.active then
		return
	end

	if slot_0_18_0.aaJitter then
		if slot_0_183_6.savedModeRaw ~= nil then
			local var_223_0 = slot_0_18_0.aaJitter.GetValue and slot_0_18_0.aaJitter:GetValue() or nil

			if var_223_0 then
				local var_223_1 = var_223_0.Get and var_223_0:Get() or nil

				if var_223_1 and type(var_223_1) == "userdata" and var_223_1.SetRaw then
					var_223_1:SetRaw(slot_0_183_6.savedModeRaw)

					if var_223_0.Set then
						var_223_0:Set(var_223_1)
					end

					if slot_0_18_0.aaJitter.Reset then
						slot_0_18_0.aaJitter:Reset()
					end
				end
			end
		elseif slot_0_183_6.savedMode ~= nil then
			slot_0_185_4(slot_0_18_0.aaJitter, slot_0_183_6.savedMode)
		end
	end

	if slot_0_18_0.aaJitterAmt and slot_0_183_6.savedAmt ~= nil then
		slot_0_185_4(slot_0_18_0.aaJitterAmt, slot_0_183_6.savedAmt)
	end

	slot_0_183_6.active = false
	slot_0_183_6.savedMode = nil
	slot_0_183_6.savedModeRaw = nil
	slot_0_183_6.savedAmt = nil
end

events.createMove:Add(function(arg_224_0)
	if not slot_0_54_0.instantRotate or not slot_0_54_0.instantRotate:Get() then
		slot_0_187_1()

		slot_0_183_6.wasOverride = false
		slot_0_183_6.cooldown = false

		return
	end

	if not slot_0_90_0() then
		return
	end

	local var_224_0 = entities.GetLocalPawn()

	if not var_224_0 or not var_224_0:IsAlive() then
		slot_0_187_1()

		slot_0_183_6.wasOverride = false
		slot_0_183_6.cooldown = false

		return
	end

	local var_224_1 = false

	if slot_0_18_0.aaLeft and slot_0_18_0.aaLeft:Get() then
		var_224_1 = true
	end

	if slot_0_18_0.aaRight and slot_0_18_0.aaRight:Get() then
		var_224_1 = true
	end

	if slot_0_18_0.aaBack and slot_0_18_0.aaBack:Get() then
		var_224_1 = true
	end

	if var_224_1 and not slot_0_183_6.wasOverride and not slot_0_183_6.cooldown then
		slot_0_186_1()
	end

	slot_0_183_6.wasOverride = var_224_1

	if not var_224_1 then
		slot_0_183_6.cooldown = false
	end

	if slot_0_183_6.active and (game.globalVars.m_flRealTime or 0) - slot_0_183_6.startTime >= slot_0_183_6.duration then
		slot_0_187_1()
	end
end)

slot_0_183_5 = nil
slot_0_184_4 = false

events.event:Add(function(arg_225_0)
	if not arg_225_0 then
		return
	end

	local var_225_0 = arg_225_0:GetName()

	if var_225_0 == "round_end" then
		if not slot_0_54_0.disableAaRoundEnd or not slot_0_54_0.disableAaRoundEnd:Get() then
			return
		end

		if slot_0_183_5 ~= nil then
			return
		end

		slot_0_184_4 = true

		if slot_0_18_0.aaEnable then
			local var_225_1 = slot_0_18_0.aaEnable:GetValue()

			if var_225_1 and var_225_1:Get() then
				slot_0_183_5 = true

				var_225_1:Set(false)
			end
		end
	elseif var_225_0 == "round_start" or var_225_0 == "round_freeze_end" then
		if slot_0_183_5 ~= nil and slot_0_18_0.aaEnable then
			local var_225_2 = slot_0_18_0.aaEnable:GetValue()

			if var_225_2 then
				var_225_2:Set(slot_0_183_5)
			end

			slot_0_183_5 = nil
		end

		slot_0_184_4 = false
	end
end)
events.createMove:Add(function(arg_226_0)
	if not slot_0_54_0.disableAaRoundEnd or not slot_0_54_0.disableAaRoundEnd:Get() then
		if slot_0_183_5 ~= nil and slot_0_18_0.aaEnable then
			local var_226_0 = slot_0_18_0.aaEnable:GetValue()

			if var_226_0 then
				var_226_0:Set(slot_0_183_5)
			end

			slot_0_183_5 = nil
		end

		slot_0_184_4 = false

		return
	end

	if slot_0_184_4 and slot_0_183_5 ~= nil and slot_0_18_0.aaEnable then
		local var_226_1 = slot_0_18_0.aaEnable:GetValue()

		if var_226_1 and var_226_1:Get() then
			var_226_1:Set(false)
		end
	end
end)

slot_0_183_4 = nil
slot_0_184_3 = nil
slot_0_185_3 = false

events.event:Add(function(arg_227_0)
	if not slot_0_54_0.spinOnWin or not slot_0_54_0.spinOnWin:Get() then
		return
	end

	local var_227_0 = arg_227_0:GetName()

	if var_227_0 == "round_end" then
		local var_227_1 = entities.GetLocalPawn()

		if not var_227_1 then
			return
		end

		local var_227_2 = arg_227_0:GetInt("winner")
		local var_227_3 = 0

		if var_227_1.m_iTeamNum then
			var_227_3 = var_227_1.m_iTeamNum:Get()
		elseif var_227_1.GetTeam then
			var_227_3 = var_227_1:GetTeam()
		elseif var_227_1.GetPropInt then
			var_227_3 = var_227_1:GetPropInt("m_iTeamNum")
		end

		if var_227_2 ~= 0 and var_227_2 == var_227_3 then
			if not slot_0_185_3 then
				if slot_0_18_0.aaSpin then
					slot_0_183_4 = slot_0_18_0.aaSpin:GetValue():Get()
				end

				if slot_0_18_0.aaSpinAmt then
					local var_227_4 = slot_0_18_0.aaSpinAmt:GetValue()

					if var_227_4 then
						slot_0_184_3 = var_227_4:Get()
					end
				end
			end

			if slot_0_18_0.aaSpin then
				local var_227_5 = slot_0_18_0.aaSpin:GetValue()

				if var_227_5 then
					var_227_5:Set(true)
				end
			end

			if slot_0_18_0.aaSpinAmt then
				local var_227_6 = slot_0_18_0.aaSpinAmt:GetValue()

				if var_227_6 then
					var_227_6:Set(7)
				end
			end

			slot_0_185_3 = true
		end
	elseif (var_227_0 == "round_start" or var_227_0 == "round_freeze_end") and slot_0_185_3 then
		if slot_0_18_0.aaSpin and slot_0_183_4 ~= nil then
			local var_227_7 = slot_0_18_0.aaSpin:GetValue()

			if var_227_7 then
				var_227_7:Set(slot_0_183_4)
			end
		end

		if slot_0_18_0.aaSpinAmt and slot_0_184_3 ~= nil then
			local var_227_8 = slot_0_18_0.aaSpinAmt:GetValue()

			if var_227_8 then
				var_227_8:Set(slot_0_184_3)
			end
		end

		slot_0_183_4 = nil
		slot_0_184_3 = nil
		slot_0_185_3 = false
	end
end)

slot_0_183_3 = "none"
slot_0_184_2 = 0

function slot_0_185_2(arg_228_0)
	if arg_228_0 == 0 then
		return false
	end

	if arg_228_0 == 42 or arg_228_0 == 59 then
		return true
	end

	if arg_228_0 >= 500 and arg_228_0 <= 526 then
		return true
	end

	if weapon_id then
		if arg_228_0 == weapon_id.knife or arg_228_0 == weapon_id.knife_t then
			return true
		end

		if weapon_id.knife_push and arg_228_0 == weapon_id.knife_push then
			return true
		end

		if weapon_id.knife_cord and arg_228_0 == weapon_id.knife_cord then
			return true
		end

		if weapon_id.knife_canis and arg_228_0 == weapon_id.knife_canis then
			return true
		end

		if weapon_id.knife_ursus and arg_228_0 == weapon_id.knife_ursus then
			return true
		end

		if weapon_id.knife_gypsy_jackknife and arg_228_0 == weapon_id.knife_gypsy_jackknife then
			return true
		end

		if weapon_id.knife_outdoor and arg_228_0 == weapon_id.knife_outdoor then
			return true
		end

		if weapon_id.knifegg and arg_228_0 == weapon_id.knifegg then
			return true
		end
	end

	return false
end

events.createMove:Add(function(arg_229_0)
	if not slot_0_54_0.leftKnife or not slot_0_54_0.leftKnife:Get() then
		if slot_0_183_3 == "left" then
			game.engine:ClientCmd("switchhandsright")
		end

		slot_0_183_3 = "none"
		slot_0_184_2 = 0

		return
	end

	local var_229_0 = entities.GetLocalPawn()

	if not var_229_0 or not var_229_0:IsAlive() then
		slot_0_184_2 = 0

		return
	end

	local var_229_1 = var_229_0:GetActiveWeapon()

	if not var_229_1 then
		return
	end

	local var_229_2 = var_229_1:ToWeaponBaseGun()
	local var_229_3 = 0

	if var_229_2 then
		var_229_3 = var_229_2:GetDefIndex() or 0
	else
		var_229_3 = var_229_1.GetDefIndex and var_229_1:GetDefIndex() or 0
	end

	if var_229_3 == slot_0_184_2 then
		return
	end

	slot_0_184_2 = var_229_3

	local var_229_4 = slot_0_185_2(var_229_3)

	if var_229_4 and slot_0_183_3 ~= "left" then
		arg_229_0:SetButton(InputBitMask_t.IN_ATTACK)
		game.engine:ClientCmd("switchhandsleft")

		slot_0_183_3 = "left"
	elseif not var_229_4 and slot_0_183_3 == "left" then
		game.engine:ClientCmd("switchhandsright")

		slot_0_183_3 = "right"
	end
end)

slot_0_183_2 = {
	fwd = false
}

function slot_0_184_1(arg_230_0)
	while arg_230_0 > 180 do
		arg_230_0 = arg_230_0 - 360
	end

	while arg_230_0 < -180 do
		arg_230_0 = arg_230_0 + 360
	end

	return arg_230_0
end

function slot_0_185_1(arg_231_0, arg_231_1, arg_231_2)
	local var_231_0 = slot_0_0_0.rad(arg_231_1)
	local var_231_1 = Vector(slot_0_0_0.cos(var_231_0), slot_0_0_0.sin(var_231_0), 0)
	local var_231_2 = Vector(arg_231_0.x + var_231_1.x * arg_231_2, arg_231_0.y + var_231_1.y * arg_231_2, arg_231_0.z)
	local var_231_3 = ray_t and ray_t()

	if not var_231_3 then
		return 1, var_231_2
	end

	local var_231_4 = game.physicsQueryInterface:TraceRay(var_231_3, arg_231_0, var_231_2, false)

	return var_231_4 and (var_231_4.fraction or 1) or 1, var_231_2
end

events.createMove:Add(function(arg_232_0)
	if not slot_0_54_0.avoidWalls or not slot_0_54_0.avoidWalls:Get() then
		return
	end

	local var_232_0 = entities.GetLocalPawn()

	if not var_232_0 or not var_232_0:IsAlive() then
		return
	end

	local var_232_1 = var_232_0:GetAbsOrigin()

	if not var_232_1 then
		return
	end

	local var_232_2 = game.input:GetViewAngles()
	local var_232_3 = slot_0_55_0.awDist and slot_0_55_0.awDist:GetValue():Get() or 45

	slot_0_183_2.fwd = false

	local var_232_4 = arg_232_0:GetForwardMove()
	local var_232_5 = arg_232_0:GetLeftMove()

	if slot_0_0_0.abs(var_232_4) < 1 and slot_0_0_0.abs(var_232_5) < 1 then
		return
	end

	local var_232_6 = slot_0_0_0.rad(var_232_2.y)
	local var_232_7 = slot_0_0_0.cos(var_232_6)
	local var_232_8 = slot_0_0_0.sin(var_232_6)
	local var_232_9 = var_232_4 * var_232_7 - var_232_5 * var_232_8
	local var_232_10 = var_232_4 * var_232_8 + var_232_5 * var_232_7
	local var_232_11 = false

	for iter_232_0 = 0, 7 do
		local var_232_12 = iter_232_0 * 45
		local var_232_13 = slot_0_184_1(var_232_2.y + var_232_12)
		local var_232_14 = slot_0_0_0.rad(var_232_13)
		local var_232_15 = slot_0_0_0.cos(var_232_14)
		local var_232_16 = slot_0_0_0.sin(var_232_14)
		local var_232_17 = slot_0_185_1(var_232_1 + Vector(0, 0, 32), var_232_13, var_232_3 + 15) * (var_232_3 + 15)

		if var_232_17 < var_232_3 then
			var_232_11 = true

			if var_232_17 < var_232_3 * 0.8 then
				local var_232_18 = 25

				var_232_9 = var_232_9 - var_232_15 * var_232_18
				var_232_10 = var_232_10 - var_232_16 * var_232_18
			end

			local var_232_19 = var_232_9 * var_232_15 + var_232_10 * var_232_16

			if var_232_19 > 0 then
				var_232_9 = var_232_9 - var_232_15 * var_232_19
				var_232_10 = var_232_10 - var_232_16 * var_232_19
				slot_0_183_2.fwd = true
			end
		end
	end

	if not var_232_11 then
		return
	end

	local var_232_20 = var_232_9 * var_232_7 + var_232_10 * var_232_8
	local var_232_21 = -var_232_9 * var_232_8 + var_232_10 * var_232_7

	arg_232_0:SetForwardMove(var_232_20)
	arg_232_0:SetLeftMove(var_232_21)
end)

slot_0_183_1 = gui.ctx:Find("misc>movement>edge jump")
slot_0_184_0 = {
	{
		m = "de_mirage",
		len = 154,
		l = "1",
		wid = 50,
		type = "line",
		ang = 89.47,
		[0] = nil,
		p = Vector(-1097.09, -683.97, -134.97)
	},
	{
		m = "de_mirage",
		l = "2",
		len = 50,
		type = "circle",
		[0] = nil,
		p = Vector(226.78, -730.88, -87.97)
	},
	{
		m = "de_mirage",
		l = "3",
		len = 50,
		type = "circle",
		[0] = nil,
		p = Vector(4.17, -1833.67, -39.97)
	},
	{
		m = "de_mirage",
		l = "4",
		len = 50,
		type = "circle",
		[0] = nil,
		p = Vector(-1959.46, 635.74, -43.97)
	}
}
slot_0_185_0 = false
slot_0_186_0 = 500
slot_0_187_0 = 32

function slot_0_188_0(arg_233_0, arg_233_1)
	local var_233_0 = arg_233_0.x - arg_233_1.x
	local var_233_1 = arg_233_0.y - arg_233_1.y
	local var_233_2 = arg_233_0.z - arg_233_1.z

	return slot_0_0_0.sqrt(var_233_0 * var_233_0 + var_233_1 * var_233_1 + var_233_2 * var_233_2)
end

function slot_0_189_0(arg_234_0)
	local var_234_0 = slot_0_0_0.rad(arg_234_0)
	local var_234_1 = slot_0_0_0.cos(var_234_0)
	local var_234_2 = slot_0_0_0.sin(var_234_0)

	return {
		x = var_234_1,
		y = var_234_2
	}, {
		x = var_234_2,
		y = -var_234_1
	}
end

function slot_0_190_0()
	if not slot_0_54_0.sejMode then
		return false
	end

	local var_235_0 = slot_0_54_0.sejMode:GetValue()

	if not var_235_0 then
		return false
	end

	local var_235_1 = var_235_0:Get()

	if type(var_235_1) == "userdata" and var_235_1.Get then
		return var_235_1:Get(1)
	end

	if type(var_235_1) == "number" then
		return var_235_1 == 1
	end

	return false
end

if slot_0_54_0.sejAdd then
	slot_0_54_0.sejAdd:AddCallback(function()
		local var_236_0 = entities.GetLocalPawn()

		if not var_236_0 or not var_236_0:IsAlive() then
			return
		end

		local var_236_1 = var_236_0:GetAbsOrigin()

		if not var_236_1 then
			return
		end

		local var_236_2 = game.globalVars.m_szMapName or "unknown"
		local var_236_3 = slot_0_190_0()
		local var_236_4 = slot_0_55_0.sejLen and slot_0_55_0.sejLen:GetValue():Get() or 150
		local var_236_5 = slot_0_55_0.sejWid and slot_0_55_0.sejWid:GetValue():Get() or 60
		local var_236_6 = game.input:GetViewAngles()
		local var_236_7 = var_236_6 and var_236_6.y or 0

		slot_0_184_0[#slot_0_184_0 + 1] = {
			["WP 62"] = nil,
			p = Vector(var_236_1.x, var_236_1.y, var_236_1.z),
			m = var_236_2,
			l = tostring(#slot_0_184_0 + 1),
			type = var_236_3 and "line" or "circle",
			len = var_236_4,
			wid = var_236_5,
			ang = var_236_7
		}
	end)
end

if slot_0_54_0.sejClear then
	slot_0_54_0.sejClear:AddCallback(function()
		if #slot_0_184_0 > 0 then
			table.remove(slot_0_184_0)
		end
	end)
end

if slot_0_54_0.sejClearAll then
	slot_0_54_0.sejClearAll:AddCallback(function()
		slot_0_184_0 = {}
	end)
end

events.createMove:Add(function(arg_239_0)
	if not slot_0_54_0.smartEj or not slot_0_54_0.smartEj:Get() then
		if slot_0_185_0 and slot_0_183_1 then
			local var_239_0 = slot_0_183_1:GetValue()

			if var_239_0 then
				var_239_0:Set(false)
			end

			slot_0_185_0 = false
		end

		return
	end

	if not slot_0_183_1 then
		return
	end

	local var_239_1 = entities.GetLocalPawn()

	if not var_239_1 or not var_239_1:IsAlive() then
		return
	end

	local var_239_2 = var_239_1:GetAbsOrigin()

	if not var_239_2 then
		return
	end

	local var_239_3 = game.globalVars.m_szMapName or ""
	local var_239_4 = false

	for iter_239_0 = 1, #slot_0_184_0 do
		local var_239_5 = slot_0_184_0[iter_239_0]

		if var_239_5.m == var_239_3 then
			local var_239_6 = var_239_5.type or "circle"
			local var_239_7 = var_239_5.len or 50

			if var_239_6 == "circle" then
				if var_239_7 > slot_0_188_0(var_239_5.p, var_239_2) then
					var_239_4 = true

					break
				end
			elseif var_239_6 == "line" then
				local var_239_8, var_239_9 = slot_0_189_0(var_239_5.ang)
				local var_239_10 = var_239_2.x - var_239_5.p.x
				local var_239_11 = var_239_2.y - var_239_5.p.y
				local var_239_12 = var_239_2.z - var_239_5.p.z
				local var_239_13 = var_239_10 * var_239_8.x + var_239_11 * var_239_8.y
				local var_239_14 = var_239_10 * var_239_9.x + var_239_11 * var_239_9.y
				local var_239_15 = var_239_5.wid or 60

				if var_239_13 >= -5 and var_239_13 <= var_239_7 and slot_0_0_0.abs(var_239_14) <= var_239_15 / 2 and slot_0_0_0.abs(var_239_12) <= 60 then
					var_239_4 = true

					break
				end
			end
		end
	end

	if var_239_4 then
		local var_239_16 = slot_0_183_1:GetValue()

		if var_239_16 then
			var_239_16:Set(true)
		end

		slot_0_185_0 = true
	elseif slot_0_185_0 then
		local var_239_17 = slot_0_183_1:GetValue()

		if var_239_17 then
			var_239_17:Set(false)
		end

		slot_0_185_0 = false
	end
end)

slot_0_191_0 = draw.Color(255, 80, 80, 255)
slot_0_192_0 = draw.Color(80, 255, 80, 255)
slot_0_193_0 = draw.Color(255, 255, 255, 200)
slot_0_194_0 = draw.Color(80, 255, 80, 60)
slot_0_195_0 = draw.Color(255, 80, 80, 100)
slot_0_196_0 = draw.Color(80, 255, 80, 100)

function slot_0_197_0(arg_240_0, arg_240_1, arg_240_2, arg_240_3, arg_240_4)
	local var_240_0 = {}
	local var_240_1 = 2 * slot_0_0_0.pi / slot_0_187_0

	for iter_240_0 = 0, slot_0_187_0 do
		local var_240_2 = iter_240_0 * var_240_1
		local var_240_3 = math.WorldToScreen(Vector(arg_240_1.x + slot_0_0_0.cos(var_240_2) * arg_240_2, arg_240_1.y + slot_0_0_0.sin(var_240_2) * arg_240_2, arg_240_1.z + (arg_240_4 or 0)))

		if var_240_3 then
			var_240_0[#var_240_0 + 1] = var_240_3
		end
	end

	for iter_240_1 = 1, #var_240_0 - 1 do
		arg_240_0:AddLine(var_240_0[iter_240_1], var_240_0[iter_240_1 + 1], arg_240_3, 1)
	end
end

function slot_0_198_0(arg_241_0, arg_241_1, arg_241_2, arg_241_3, arg_241_4, arg_241_5, arg_241_6)
	local var_241_0, var_241_1 = slot_0_189_0(arg_241_2)
	local var_241_2 = arg_241_4 / 2
	local var_241_3 = arg_241_1.z + (arg_241_6 or 0)
	local var_241_4 = math.WorldToScreen(Vector(arg_241_1.x + var_241_0.x * arg_241_3 + var_241_1.x * var_241_2, arg_241_1.y + var_241_0.y * arg_241_3 + var_241_1.y * var_241_2, var_241_3))
	local var_241_5 = math.WorldToScreen(Vector(arg_241_1.x + var_241_0.x * arg_241_3 - var_241_1.x * var_241_2, arg_241_1.y + var_241_0.y * arg_241_3 - var_241_1.y * var_241_2, var_241_3))
	local var_241_6 = math.WorldToScreen(Vector(arg_241_1.x - var_241_1.x * var_241_2, arg_241_1.y - var_241_1.y * var_241_2, var_241_3))
	local var_241_7 = math.WorldToScreen(Vector(arg_241_1.x + var_241_1.x * var_241_2, arg_241_1.y + var_241_1.y * var_241_2, var_241_3))

	if var_241_4 and var_241_5 and var_241_6 and var_241_7 then
		arg_241_0:AddLine(var_241_4, var_241_5, arg_241_5, 1)
		arg_241_0:AddLine(var_241_5, var_241_6, arg_241_5, 1)
		arg_241_0:AddLine(var_241_6, var_241_7, arg_241_5, 1)
		arg_241_0:AddLine(var_241_7, var_241_4, arg_241_5, 1)
	end
end

events.presentQueue:Add(function()
	if not slot_0_54_0.smartEj or not slot_0_54_0.smartEj:Get() then
		return
	end

	if not slot_0_54_0.sejShowSpots or not slot_0_54_0.sejShowSpots:Get() then
		return
	end

	if #slot_0_184_0 == 0 then
		return
	end

	if not slot_0_90_0() then
		return
	end

	local var_242_0 = entities.GetLocalPawn()

	if not var_242_0 or not var_242_0:IsAlive() then
		return
	end

	local var_242_1 = var_242_0:GetAbsOrigin()

	if not var_242_1 then
		return
	end

	local var_242_2 = game.globalVars.m_szMapName or ""
	local var_242_3 = draw.surface

	var_242_3.font = draw.fonts.gui_main

	for iter_242_0 = 1, #slot_0_184_0 do
		local var_242_4 = slot_0_184_0[iter_242_0]

		if var_242_4.m == var_242_2 then
			local var_242_5 = slot_0_188_0(var_242_4.p, var_242_1)

			if var_242_5 <= slot_0_186_0 then
				local var_242_6 = math.WorldToScreen(var_242_4.p)

				if var_242_6 then
					local var_242_7 = var_242_4.type or "circle"
					local var_242_8 = var_242_4.len or 50
					local var_242_9 = false

					if var_242_7 == "circle" then
						var_242_9 = var_242_5 < var_242_8
					elseif var_242_7 == "line" then
						local var_242_10, var_242_11 = slot_0_189_0(var_242_4.ang)
						local var_242_12 = var_242_1.x - var_242_4.p.x
						local var_242_13 = var_242_1.y - var_242_4.p.y
						local var_242_14 = var_242_1.z - var_242_4.p.z
						local var_242_15 = var_242_12 * var_242_10.x + var_242_13 * var_242_10.y
						local var_242_16 = var_242_12 * var_242_11.x + var_242_13 * var_242_11.y

						var_242_9 = var_242_15 >= -5 and var_242_15 <= var_242_8 and slot_0_0_0.abs(var_242_16) <= (var_242_4.wid or 60) / 2 and slot_0_0_0.abs(var_242_14) <= 60
					end

					local var_242_17 = var_242_9 and slot_0_192_0 or slot_0_191_0
					local var_242_18 = var_242_9 and slot_0_196_0 or slot_0_195_0

					if var_242_7 == "circle" then
						slot_0_197_0(var_242_3, var_242_4.p, var_242_8, var_242_18, 0)
					elseif var_242_7 == "line" then
						slot_0_198_0(var_242_3, var_242_4.p, var_242_4.ang, var_242_8, var_242_4.wid or 60, var_242_18, 0)
					end

					var_242_3:AddRectFilled(draw.Rect(var_242_6.x - 4, var_242_6.y - 4, var_242_6.x + 4, var_242_6.y + 4), var_242_17)

					if var_242_9 then
						var_242_3:AddRectFilled(draw.Rect(var_242_6.x - 7, var_242_6.y - 7, var_242_6.x + 7, var_242_6.y + 7), slot_0_194_0)
					end

					var_242_3:AddText(draw.Vec2(var_242_6.x + 8, var_242_6.y - 6), var_242_4.l .. " (" .. slot_0_0_0.floor(var_242_5) .. "u)", slot_0_193_0)
				end
			end
		end
	end
end)

slot_0_183_0 = {
	savedSpeed = nil,
	active = false
}

events.createMove:Add(function(arg_243_0)
	if not slot_0_54_0.edgeStop:Get() then
		if slot_0_183_0.active and slot_0_183_0.savedWalk ~= nil then
			local var_243_0 = slot_0_18_0.slowwalk:GetValue()

			if var_243_0 then
				var_243_0:Set(slot_0_183_0.savedWalk)
			end

			if slot_0_183_0.savedSpeed ~= nil then
				local var_243_1 = slot_0_18_0.slowwalkSpeed:GetValue()

				if var_243_1 then
					var_243_1:Set(slot_0_183_0.savedSpeed)
				end
			end

			slot_0_183_0.active = false
			slot_0_183_0.savedWalk = nil
			slot_0_183_0.savedSpeed = nil
		end

		return
	end

	local var_243_2 = entities.GetLocalPawn()

	if not var_243_2 or not var_243_2:IsAlive() then
		return
	end

	local var_243_3 = var_243_2.m_fFlags and var_243_2.m_fFlags:Get() or 0

	if bit.band(var_243_3, 1) == 0 then
		if slot_0_183_0.active and slot_0_183_0.savedWalk ~= nil then
			local var_243_4 = slot_0_18_0.slowwalk:GetValue()

			if var_243_4 then
				var_243_4:Set(slot_0_183_0.savedWalk)
			end

			if slot_0_183_0.savedSpeed ~= nil then
				local var_243_5 = slot_0_18_0.slowwalkSpeed:GetValue()

				if var_243_5 then
					var_243_5:Set(slot_0_183_0.savedSpeed)
				end
			end

			slot_0_183_0.active = false
			slot_0_183_0.savedWalk = nil
			slot_0_183_0.savedSpeed = nil
		end

		return
	end

	local var_243_6 = var_243_2:GetAbsOrigin()
	local var_243_7 = 49
	local var_243_8 = Vector(var_243_6.x, var_243_6.y, var_243_6.z - var_243_7)
	local var_243_9 = ray_t and ray_t() or slot_0_67_0
	local var_243_10 = var_243_9 and game.physicsQueryInterface:TraceRay(var_243_9, var_243_6, var_243_8, false)

	if not var_243_10 or (var_243_10.fraction or 1) >= 1 then
		local var_243_11 = var_243_2:GetAbsVelocity()

		if slot_0_0_0.sqrt(var_243_11.x * var_243_11.x + var_243_11.y * var_243_11.y) > 10 and not slot_0_183_0.active then
			local var_243_12 = slot_0_18_0.slowwalk:GetValue()

			if var_243_12 then
				slot_0_183_0.savedWalk = var_243_12:Get()

				var_243_12:Set(true)
			end

			local var_243_13 = slot_0_18_0.slowwalkSpeed:GetValue()

			if var_243_13 then
				slot_0_183_0.savedSpeed = var_243_13:Get()

				var_243_13:Set(1)
			end

			slot_0_183_0.active = true
		end
	elseif slot_0_183_0.active and slot_0_183_0.savedWalk ~= nil then
		local var_243_14 = slot_0_18_0.slowwalk:GetValue()

		if var_243_14 then
			var_243_14:Set(slot_0_183_0.savedWalk)
		end

		if slot_0_183_0.savedSpeed ~= nil then
			local var_243_15 = slot_0_18_0.slowwalkSpeed:GetValue()

			if var_243_15 then
				var_243_15:Set(slot_0_183_0.savedSpeed)
			end
		end

		slot_0_183_0.active = false
		slot_0_183_0.savedWalk = nil
		slot_0_183_0.savedSpeed = nil
	end
end)
