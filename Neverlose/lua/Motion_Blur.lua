-- DaCrib OWNS me & all,  https://discord.gg/EtjunmbdA2




local ffi = require("ffi")

ffi.cdef[[
	typedef struct
	{
		float x,y,z;
	}Vector;
	typedef struct 
	{
		int			iX;
		int			iUnscaledX;
		int			iY;
		int			iUnscaledY;
		int			iWidth;
		int			iUnscaledWidth;
		int			iHeight;
		int			iUnscaledHeight;
		bool		bOrtho;
		float		flOrthoLeft;
		float		flOrthoTop;
		float		flOrthoRight;
		float		flOrthoBottom;
		char	    pad0[0x7C];
		float		flFOV;
		float		flViewModelFOV;
		Vector		vecOrigin;
		Vector		angView;
		float		flNearZ;
		float		flFarZ;
		float		flNearViewmodelZ;
		float		flFarViewmodelZ;
		float		flAspectRatio;
		float		flNearBlurDepth;
		float		flNearFocusDepth;
		float		flFarFocusDepth;
		float		flFarBlurDepth;
		float		flNearBlurRadius;
		float		flFarBlurRadius;
		float		flDoFQuality;
		int			nMotionBlurMode;
		float		flShutterTime;
		Vector		vecShutterOpenPosition;
		Vector		vecShutterOpenAngles;
		Vector		vecShutterClosePosition;
		Vector		vecShutterCloseAngles;
		float		flOffCenterTop;
		float		flOffCenterBottom;
		float		flOffCenterLeft;
		float		flOffCenterRight;
		bool		bOffCenter : 1;
		bool		bRenderToSubrectOfLargerScreen : 1;
		bool		bDoBloomAndToneMapping : 1;
		bool		bDoDepthOfField : 1;
		bool		bHDRTarget : 1;
		bool		bDrawWorldNormal : 1;
		bool		bCullFontFaces : 1;
		bool		bCacheFullSceneState : 1;
		bool		bCSMView : 1;
	} CViewSetup_t;

	int VirtualProtect(void*, unsigned long, unsigned long, unsigned long*);
]]



local function find_sig(mdlname, pattern, typename, offset, deref_count)
	local raw_match = utils.opcode_scan(mdlname, pattern) or error("signature not found", 2)
	local match = ffi.cast("uintptr_t", raw_match)

	if offset ~= nil and offset ~= 0 then
		match = match + offset
	end

	if deref_count ~= nil then
		for i = 1, deref_count do
			match = ffi.cast("uintptr_t*", match)[0]
			if match == nil then
				return error("signature not found")
			end
		end
	end

	return ffi.cast(typename, match)
end

local clientMode = find_sig("client.dll", "8B 0D ? ? ? ? 8B 01 5D FF 60 30", "void*", 2, 2)

local VMTSwap = {}

function VMTSwap:Setup(vtable)
	self.hooked_functions = {}
	self.orig = nil
	self.orig_vtable = ffi.cast("void***", vtable)[0]
	self.fn_size = ffi.sizeof("uintptr_t")
	return self
end

function VMTSwap:Hook(index, proto, fn)
	jit.off(fn, true)
	local orig_prot = ffi.new("unsigned long[1]")
	local orig_fn = self.orig_vtable[index]
	table.insert(self.hooked_functions, {index = index, orig_fn = orig_fn})
	self.orig = ffi.cast(proto, orig_fn)

	ffi.C.VirtualProtect(ffi.cast("void*", self.orig_vtable + index), self.fn_size, 0x4, orig_prot)
	self.orig_vtable[index] = ffi.cast('void*', ffi.cast(proto, fn))
	ffi.C.VirtualProtect(ffi.cast("void*", self.orig_vtable + index),  self.fn_size, orig_prot[0], orig_prot)

end

function VMTSwap:UnhookByIndex(index)
	local orig_protection = ffi.new("unsigned long[1]")
	for i, hooked in pairs(self.hooked_functions) do
		if index == hooked.index then
			ffi.C.VirtualProtect(ffi.cast("void*", self.orig_vtable + index), self.fn_size, 0x4, orig_protection)
			self.orig_vtable[index] = hooked.orig_fn
			ffi.C.VirtualProtect(ffi.cast("void*", self.orig_vtable + index), self.fn_size, orig_protection[0], orig_protection)
			break
		end
	end
end
--
--local error = error
--local math_max, math_min = math.max, math.min
--
local native_FindMaterial = utils.get_vfunc("materialsystem.dll", "VMaterialSystem080", 84, "void*(__thiscall*)(void* thisPtr, char const* szMaterialName, const char* szTextureGroupName, bool bComplain, const char* pComplainPrefix)")
local native_GetRenderContext = utils.get_vfunc("materialsystem.dll", "VMaterialSystem080", 115, "void*(__thiscall*)(void* thisPtr)")
-- 	void DrawScreenSpaceRectangle(IMaterial* pMaterial, int iDestX, int iDestY, int iWidth, int iHeight, float flTextureX0, float flTextureY0, float flTextureX1, float flTextureY1, int iTextureWidth, int iTextureHeight, void* pClientRenderable = nullptr, int nXDice = 1, int nYDice = 1)
local native_DrawScreenSpaceRectangle = utils.get_vfunc(114, "void*(__thiscall*)(void*, void*, int, int, int, int, float, float, float, float, int, int, void*, int, int)")
local native_MaterialFindVar = utils.get_vfunc(11, "void*(__thiscall*)(void*, const char*, bool*, bool)")
local native_MaterialVarSetVector = utils.get_vfunc(10, "void(__thiscall*)(void*, float, float, float, float)")
--
local function DrawScreenSpaceRectangle(renderContext, pMaterial, destX, destY, width, height, flTextureX0, flTextureY0, flTextureX1, flTextureY1, iTextureWidth, iTextureHeight)
	native_DrawScreenSpaceRectangle(renderContext, pMaterial, destX, destY, width, height, flTextureX0, flTextureY0, flTextureX1, flTextureY1, iTextureWidth, iTextureHeight, nil, 1, 1)
end
--
local blurMaterial = native_FindMaterial("dev/motion_blur", "Other textures", true, nil) or error("Couldn't find blur material")
local blurMaterialVar = native_MaterialFindVar(blurMaterial, "$MotionBlurInternal", nil, true) or error("Couldn't find blur material variable")
--
local function math_clamp(x, min, max)
	return math.max(min, math.min(x, max))
end

local function clamp(x)
	return math.max(0, math.min(1, x))
end

local function setBlur(x, y, z, time, strength)
	native_MaterialVarSetVector(blurMaterialVar, x, y, time, z)
end
--
local function drawBlur(x, y, w, h)
	local renderContext = native_GetRenderContext()
	if renderContext == nil then return end

	local screen = render.screen_size()
	DrawScreenSpaceRectangle(renderContext, blurMaterial, x, y, w, h, x, y, x + w, y + h, screen.x, screen.y)
end
--
local function DotProduct(a, b)
	return a.x * b.x + a.y * b.y + a.z * b.z
end
--
local old_data = {
	lastUpdateTime = 0,
	position = vector(0, 0, 0),
	noMotionBlurUntil = 0,
	previousYaw = 0,
	previousPitch = 0,
}
--
local blur_group = ui.create("Blur")

local motionBlurSettings = {
	enabled = blur_group:switch("Motion Blur"),
	strength = blur_group:slider("Strength", 1, 100, 1, 0.1),
	rotationIntensity =  blur_group:slider(" Rotation Intensity", 1, 100, 15, 0.01),
	fallingIntensity =  blur_group:slider("Falling Intensity", 1, 100, 100, 0.01),
	fallingMin =  blur_group:slider("Falling Min", 1, 200, 80, 0.1),
	fallingMax =  blur_group:slider("Falling Max", 1, 200, 100, 0.1),
}
--
motionBlurSettings.strength:visibility(false)
motionBlurSettings.rotationIntensity:visibility(false)
motionBlurSettings.fallingIntensity:visibility(false)
motionBlurSettings.fallingMin:visibility(false)
motionBlurSettings.fallingMax:visibility(false)
--


motionBlurSettings.enabled:set_callback(function(ref)
	motionBlurSettings.strength:visibility(ref:get())
	motionBlurSettings.rotationIntensity:visibility(ref:get())
	motionBlurSettings.fallingIntensity:visibility(ref:get())
	motionBlurSettings.fallingMin:visibility(ref:get())
	motionBlurSettings.fallingMax:visibility(ref:get())
end)

--
local hook_viewRender = VMTSwap:Setup(clientMode)

-- it's actually DoPostScreenSpaceEffects

local localVector = ffi.typeof([[
	struct
	{
		float x,y,z;
	}
]])

local matrix3x4_t = ffi.typeof([[
	struct
	{
		float m_flMatVal[3][4];
	}
]])

local MotionBlurHistory_t = ffi.typeof([[
	struct
	{
		float m_flLastTimeUpdate;
		float m_flPreviousPitch;
		float m_flPreviousYaw;
		$ m_vPreviousPositon;
		$ m_mPreviousFrameBasisVectors;
		float m_flNoRotationalMotionBlurUntil;
	}
]], localVector, matrix3x4_t)

local history = ffi.new(MotionBlurHistory_t)
local g_vMotionBlurValues = ffi.new("float[4]")

local function SinCos(radians) 
	return math.sin(radians), math.cos(radians)
end

local function AngleMatrix(angles, matrix)
	local sr, sp, sy, cr, cp, cy

	local sy, cy = SinCos( math.rad( angles.y))
	local sp, cp = SinCos( math.rad( angles.x))
	local sr, cr = SinCos( math.rad( angles.z))

	matrix.m_flMatVal[0][0] = cp*cy
	matrix.m_flMatVal[1][0] = cp*sy
	matrix.m_flMatVal[2][0] = -sp

	local crcy = cr*cy
	local crsy = cr*sy
	local srcy = sr*cy
	local srsy = sr*sy
	matrix.m_flMatVal[0][1] = sp*srcy-crsy
	matrix.m_flMatVal[1][1] = sp*srsy+crcy
	matrix.m_flMatVal[2][1] = sr*cp

	matrix.m_flMatVal[0][2] = (sp*crcy+srsy)
	matrix.m_flMatVal[1][2] = (sp*crsy-srcy)
	matrix.m_flMatVal[2][2] = cr*cp

	matrix.m_flMatVal[0][3] = 0.0
	matrix.m_flMatVal[1][3] = 0.0
	matrix.m_flMatVal[2][3] = 0.0

end

local function VectorSubtract(a, b)
    return localVector(a.x - b.x, a.y - b.y, a.z - b.z)
end

local function VectorLength(v)
    local FLT_EPSILON = 1.192092896e-07
    return math.sqrt(v.x * v.x + v.y * v.y + v.z * v.z + FLT_EPSILON)
end

local function DotProduct(v1, v2)
	return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z
end

local function hooked_RenderView(ecx, view)

	local x = view.iX
	local y = view.iY
	local w = view.iWidth
	local h = view.iHeight

	local flMotionBlurRotationIntensity = 10.0 * 0.15
	local flMotionBlurRollIntensity = 0.3
	local flMotionBlurFallingIntensity = 1.0
	local flMotionBlurFallingMin = 10.0
	local flMotionBlurFallingMax = 20.0
	local flMotionBlurGlobalStrength = 1.0

	local flTimeElapsed = globals.realtime - history.m_flLastTimeUpdate
	local flCurrentPitch =  math.normalize_yaw(view.angView.x)
	local flCurrentYaw =  math.normalize_yaw(view.angView.y)
	local mCurrentBasisVectors = ffi.new(matrix3x4_t)

	AngleMatrix(view.angView, mCurrentBasisVectors)

	local vCurrentSideVec = localVector(mCurrentBasisVectors.m_flMatVal[0][1], mCurrentBasisVectors.m_flMatVal[1][1], mCurrentBasisVectors.m_flMatVal[2][1])
	local vCurrentForwardVec = localVector(mCurrentBasisVectors.m_flMatVal[0][0], mCurrentBasisVectors.m_flMatVal[1][0], mCurrentBasisVectors.m_flMatVal[2][0])

    local vCurrentPosition = view.vecOrigin

    local vPositionChange = VectorSubtract(history.m_vPreviousPositon, vCurrentPosition)

    if VectorLength(vPositionChange) > 30.0 and flTimeElapsed >= 0.5 then
        g_vMotionBlurValues[0] = 0.0
		g_vMotionBlurValues[1] = 0.0
		g_vMotionBlurValues[2] = 0.0
		g_vMotionBlurValues[3] = 0.0
    elseif flTimeElapsed > (1.0 / 15.0) then
        g_vMotionBlurValues[0] = 0.0
		g_vMotionBlurValues[1] = 0.0
		g_vMotionBlurValues[2] = 0.0
		g_vMotionBlurValues[3] = 0.0
    elseif VectorLength(vPositionChange) > 50.0 then
        history.m_flNoRotationalMotionBlurUntil = globals.realtime + 1.0
    else
        local flHorizontalFov = view.flFOV
        local flVerticalFov = (view.flAspectRatio <= 0.0) and view.flFOV or view.flFOV / view.flAspectRatio
        local flViewDotMotion = DotProduct(vCurrentForwardVec, vPositionChange)
        g_vMotionBlurValues[2] = flViewDotMotion

        local flSideDotMotion = DotProduct( vCurrentSideVec, vPositionChange)
		local flYawDiffOriginal = history.m_flPreviousYaw - flCurrentYaw;
		if (((history.m_flPreviousYaw - flCurrentYaw > 180.0) or (history.m_flPreviousYaw - flCurrentYaw < -180.0) ) and ((history.m_flPreviousYaw + flCurrentYaw > -180.0) and (history.m_flPreviousYaw + flCurrentYaw < 180.0))) then
            flYawDiffOriginal = history.m_flPreviousYaw + flCurrentYaw
        end

        local flYawDiffAdjusted = flYawDiffOriginal + ( flSideDotMotion / 3.0)

        if ( flYawDiffOriginal < 0.0) then
            flYawDiffAdjusted = math.clamp(flYawDiffAdjusted, flYawDiffOriginal, 0.0)
		else
            flYawDiffAdjusted = math.clamp(flYawDiffAdjusted, 0.0, flYawDiffOriginal)
        end

        local flUndampenedYaw = flYawDiffAdjusted / flHorizontalFov
        g_vMotionBlurValues[0] = flUndampenedYaw * (1.0 - (math.abs(flCurrentPitch) / 90.0))

        local flPitchCompensateMask = 1.0 - (( 1.0 - math.abs(vCurrentForwardVec[2])) * ( 1.0 - math.abs( vCurrentForwardVec[2])))
		local flPitchDiffOriginal = history.m_flPreviousPitch - flCurrentPitch
		local flPitchDiffAdjusted = flPitchDiffOriginal

		if (flCurrentPitch > 0.0) then
            flPitchDiffAdjusted = flPitchDiffOriginal - ((flViewDotMotion / 2.0) * flPitchCompensateMask)
        else
            flPitchDiffAdjusted = flPitchDiffOriginal + ((flViewDotMotion / 2.0) * flPitchCompensateMask)
        end

        if (flPitchDiffOriginal < 0.0) then
			flPitchDiffAdjusted = math.clamp(flPitchDiffAdjusted, flPitchDiffOriginal, 0.0)
		else
		    flPitchDiffAdjusted = math.clamp(flPitchDiffAdjusted, 0.0, flPitchDiffOriginal)
        end

        g_vMotionBlurValues[1] = flPitchDiffAdjusted / flVerticalFov

        g_vMotionBlurValues[3] = flUndampenedYaw
        g_vMotionBlurValues[3] = g_vMotionBlurValues[3] * ((math.abs(flCurrentPitch) / 90.0) * (math.abs(flCurrentPitch) / 90.0) * (math.abs(flCurrentPitch) / 90.0))

        if (flTimeElapsed > 0.0) then
            g_vMotionBlurValues[2] = g_vMotionBlurValues[2] / (flTimeElapsed * 30.0)
		else
			g_vMotionBlurValues[2] = 0.0
        end

        g_vMotionBlurValues[2] = math.clamp((math.abs(g_vMotionBlurValues[2]) - flMotionBlurFallingMin) / (flMotionBlurFallingMax - flMotionBlurFallingMin), 0.0, 1.0) * (g_vMotionBlurValues[2] >= 0.0 and 1.0 or -1.0)
        g_vMotionBlurValues[2] = g_vMotionBlurValues[2] / 30.0

        g_vMotionBlurValues[0] = g_vMotionBlurValues[0] * flMotionBlurRotationIntensity * flMotionBlurGlobalStrength
        g_vMotionBlurValues[1] = g_vMotionBlurValues[1] * flMotionBlurRotationIntensity * flMotionBlurGlobalStrength
        g_vMotionBlurValues[2] = g_vMotionBlurValues[2] * flMotionBlurFallingIntensity * flMotionBlurGlobalStrength
        g_vMotionBlurValues[3] = g_vMotionBlurValues[3] * flMotionBlurRollIntensity * flMotionBlurGlobalStrength

        local flSlowFps = 30.0
        local flFastFps = 50.0
        local flCurrentFps = (flTimeElapsed > 0.0) and (1.0 / flTimeElapsed) or 0.0
        local flDampenFactor = math.clamp(((flCurrentFps - flSlowFps) / (flFastFps - flSlowFps)), 0.0, 1.0)

        g_vMotionBlurValues[0] = g_vMotionBlurValues[0] * flDampenFactor
        g_vMotionBlurValues[1] = g_vMotionBlurValues[1] * flDampenFactor
        g_vMotionBlurValues[2] = g_vMotionBlurValues[2] * flDampenFactor
        g_vMotionBlurValues[3] = g_vMotionBlurValues[3] * flDampenFactor
    end 
    if (globals.realtime < history.m_flNoRotationalMotionBlurUntil) then
        g_vMotionBlurValues[0] = 0.0
        g_vMotionBlurValues[1] = 0.0
        g_vMotionBlurValues[3] = 0.0
	else
        history.m_flNoRotationalMotionBlurUntil = 0.0
    end
    
    vCurrentPosition.x = history.m_vPreviousPositon.x
    vCurrentPosition.y = history.m_vPreviousPositon.y
    vCurrentPosition.z = history.m_vPreviousPositon.z

    history.m_mPreviousFrameBasisVectors = mCurrentBasisVectors
    history.m_flPreviousPitch = flCurrentPitch
    history.m_flPreviousYaw = flCurrentYaw
    history.m_flLastTimeUpdate = globals.realtime
	-- print_dev(view.angView.x)
	-- AngleMatrix(view.angView, mCurrentBasisVectors )
    setBlur(g_vMotionBlurValues[0], g_vMotionBlurValues[1], g_vMotionBlurValues[2], g_vMotionBlurValues[3], 1)
	drawBlur(view.iX, view.iY, view.iWidth, view.iHeight)
	--print(ffi.cast("void*", ecx))
	hook_viewRender.orig(ecx, view)
end

hook_viewRender:Hook(44, "void(__thiscall*)(void* ecx, const CViewSetup_t* view)", hooked_RenderView)

events.shutdown:set(function()
   hook_viewRender:UnhookByIndex(44)
end)

events.client_disconnect:set(function()
	old_data = {
		lastUpdateTime = 0,
		position = vector(0, 0, 0),
		noMotionBlurUntil = 0,
		previousYaw = 0,
		previousPitch = 0,
	}
end)