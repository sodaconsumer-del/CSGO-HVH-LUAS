local vColorTable = ffi.typeof("int*")
local matrix3x4_t = ffi.typeof("float*")

ffi.cdef[[
	typedef struct {
	    float x;
	    float y;
	    float z;
	} Vector;
	  
	typedef struct {
		int id;
		int version;
		int checksum;
		char name[64];
		int length;
		Vector eyePosition;
		Vector illumPosition;
		Vector hullMin;
		Vector hullMax;
		Vector bbMin;
		Vector bbMax;
		int flags;
		int numBones;
		int boneIndex;
		int numBoneControllers;
		int boneControllerIndex;
		int numHitboxSets;
		int hitboxSetIndex;
	} StudioHdr;

	typedef struct {
		int nameIndex;
		int numHitboxes;
		int hitboxIndex;
	} StudioHitboxSet;

	typedef struct {
		int bone;
		int group;
		Vector bbMin;
		Vector bbMax;
		int hitboxNameIndex;
		Vector offsetOrientation;
		float capsuleRadius;
		int unused[4];
	} StudioBbox;
]]

local StudioHdr = ffi.typeof("StudioHdr*")
local StudioHitboxSet = ffi.typeof("StudioHitboxSet*")
local StudioBbox = ffi.typeof("StudioBbox*")

local nativeGetClientEntity = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "uintptr_t(__thiscall*)(void*, int)")

local nativeGetModel = utils.get_vfunc('engine.dll', 'VModelInfoClient004', 1, 'void*(__thiscall*)(void*, int)')
local nativeGetStudioModel = utils.get_vfunc('engine.dll', 'VModelInfoClient004', 32, 'StudioHdr*(__thiscall*)(void*, void*)')

local nativeAddEntityTextOverlay = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 0, 'void(__cdecl*)(void*, int, int, float, int, int, int, int, const char*, ...)') -- E9 ? ? ? ? 83 E9 04 E9 ? ? ? ? 83 6C 24 ? ? E9 ? ? ? ? 83 6C 24 ? ?
local nativeAddBoxOverlay = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 1, 'void(__thiscall*)(void*, const Vector&, const Vector&, const Vector&, const Vector&, int, int, int, int, float)') -- E9 ? ? ? ? 83 6C 24 ? ? E9 ? ? ? ? 83 E9 04 E9 ? ? ? ? 83 E9 04
local nativeAddSphereOverlay = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 2, 'void(__thiscall*)(void*, const Vector&, float, int, int, int, int, int, int, float)') -- 55 8B EC F3 0F 10 45 ? 8B 55 10
local nativeAddTriangleOverlay = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 3, 'void(__thiscall*)(void*, const Vector&, const Vector&, const Vector&, int, int, int, int, bool, float)') -- E9 ? ? ? ? 83 6C 24 ? ? E9 ? ? ? ? 83 6C 24 ? ?
local nativeAddBoxOverlayNew = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 4, 'void(__thiscall*)(void*, const Vector&, const Vector&, int, int, int, int, float, float)') -- 55 8B EC 83 EC 30 8B 45 0C
local nativeAddLineOverlay = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 5, 'void(__thiscall*)(void*, const Vector&, const Vector&, int, int, int, bool, float)') -- E9 ? ? ? ? 83 E9 04 E9 ? ? ? ? 83 6C 24 ? ? E9 ? ? ? ? 83 E9 04 E9 ? ? ? ? 83 E9 04
local nativeAddTextOverlayOffset = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 6, 'void(__cdecl*)(void*, const Vector&, int, float, const char*, ...)') -- 55 8B EC 56 57 8B 7D 08 8D 45 1C
local nativeAddTextOverlay = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 7, 'void(__cdecl*)(void*, const Vector&, float, const char*, ...)') -- E9 ? ? ? ? 83 6C 24 ? ? E9 ? ? ? ? CC
local nativeAddScreenTextOverlay = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 8, 'void(__thiscall*)(void*, float, float, float, int, int, int, int, const char*)') -- 55 8B EC FF 75 24
local nativeAddSweptBoxOverlay = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 9, 'void(__thiscall*)(void*, const Vector&, const Vector&, const Vector&, const Vector&, const Vector&, int, int, int, int, float)') -- 55 8B EC F3 0F 10 45 ? 8B 55 0C 51 8B 4D 08 F3 0F 11 04 24 FF 75 28
local nativeAddGridOverlay = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 10, 'void(__thiscall*)(void*, const Vector&)') -- 55 8B EC 8B 4D 08 E8 ? ? ? ? 5D C2 04 00 CC 55 8B EC 8B 55 10
local nativeAddCoordFrameOverlay = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 11, 'void(__thiscall*)(void*, float*, float, int*)') -- 55 8B EC 8B 55 10 F3 0F 10 4D ?
local nativeScreenPositionVector = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 13, 'int(__thiscall*)(void*, const Vector&, const Vector&)') -- 55 8B EC 8B 55 0C 8B 4D 08 E8 ? ? ? ? 5D C2 08 00 CC CC CC CC CC CC CC CC CC CC CC CC CC CC 55 8B EC 8B 4D 10
local nativeScreenPosition = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 12, 'int(__thiscall*)(void*, float, float, const Vector&)') -- 55 8B EC 8B 4D 10 F3 0F 10 4D ? 
local nativeGetFirst = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 14, 'void*(__thiscall*)(void*)') -- A1 ? ? ? ? C3 CC CC CC CC CC CC CC CC CC CC 55 8B EC 8B 45 08 8B 80 ? ? ? ?
local nativeGetNext = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 15, 'void*(__thiscall*)(void*, void*)') -- 55 8B EC 8B 45 08 8B 80 ? ? ? ? 5D
local nativeClearDeadOverlays = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 16, 'void(__thiscall*)(void*)') -- E9 ? ? ? ? CC CC CC CC CC CC CC CC CC CC CC E9 ? ? ? ? CC CC CC CC CC CC CC CC CC CC CC 55 8B EC F3 0F 10 45 ?
local nativeClearAllOverlays = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 17, 'void(__thiscall*)(void*)') -- E9 ? ? ? ? CC CC CC CC CC CC CC CC CC CC CC 55 8B EC F3 0F 10 45 ? 8B 55 0C 51
local nativeAddTextOverlayRGBFloat = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 18, 'void(__cdecl*)(void*, const Vector&, int, float, float, float, float, float, const char*, ...)') -- E9 ? ? ? ? 83 E9 04 E9 ? ? ? ? 83 E9 04 E9 ? ? ? ? 83 6C 24 ? ?
local nativeAddTextOverlayRGB = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 19, 'void(__cdecl*)(void*, const Vector&, int, float, int, int, int, int, const char*, ...)') -- 55 8B EC 56 57 8B 7D 08 8D 45 2C 50 51 FF 75 28 8D 77 08 89 87 ? ? ? ? BA ? ? ? ? 8B CE E8 ? ? ? ? 83 C4 0C 85 C0 78 07 3D ? ? ? ? 7C 07 C6 86 ? ? ? ? ? 66 0F 6E 45 ?
local nativeAddLineOverlayAlpha = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 20, 'void(__thiscall*)(void*, const Vector&, const Vector&, int, int, int, int, bool, float)') -- 55 8B EC F3 0F 10 45 ? 8B 55 0C 51 8B 4D 08 F3 0F 11 04 24 FF 75 20
local nativeAddBoxOverlay2 = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 21, 'void(__thiscall*)(void*, const Vector&, const Vector&, const Vector&, const Vector&, unsigned char*, unsigned char*, float)') -- 55 8B EC F3 0F 10 45 ? 8B 55 0C 51 8B 4D 08 F3 0F 11 04 24 FF 75 1C FF 75 18
local nativeAddLineOverlayWithAdjustableWidth = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 4, 'void(__thiscall*)(void*, const Vector&, const Vector&, int, int, int, int, float, float)') -- 55 8B EC 83 EC 30 8B 45 0C
local nativePurgeTextOverlays = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 22, 'void(__thiscall*)(void*)') -- E9 ? ? ? ? CC CC CC CC CC CC CC CC CC CC CC 55 8B EC F3 0F 10 45 ? 8B 55 0C 6A 00
local nativeAddCapsuleOverlay = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 23, 'void(__thiscall*)(void*,const Vector&, const Vector&, const float&, int, int, int, int, float)') -- 55 8B EC FF 75 2C
local nativeDrawPill = utils.get_vfunc('engine.dll', 'VDebugOverlay004', 24, 'void(__thiscall*)(void*,const Vector&, const Vector&, const float&, int, int, int, int, float)') -- 55 8B EC F3 0F 10 45 ? 8B 55 0C 6A 00

local DebugOverlay = {}

DebugOverlay = {
	AddEntityTextOverlay = function(ent_index, line_offset, duration, r, g, b, a, format, ...)
        nativeAddEntityTextOverlay(ent_index, line_offset, duration, r, g, b, a, format, ...)
    end,
	AddBoxOverlay = function(origin, mins, max, angles, r, g, b, a, duration)
		local origin = ffi.new("Vector", origin:unpack())
		local mins = ffi.new("Vector", mins:unpack())
		local max = ffi.new("Vector", max:unpack())
		local angles = ffi.new("Vector", angles:unpack())
        nativeAddBoxOverlay(origin, mins, max, angles, r, g, b, a, duration)
    end,
	AddSphereOverlay = function(origin, flRadius, nTheta, nPhi, r, g, b, a, duration)
		local origin = ffi.new("Vector", origin:unpack())
        nativeAddSphereOverlay(origin, flRadius, nTheta, nPhi, r, g, b, a, duration)
    end,
	AddTriangleOverlay = function(p1, p2, p3, r, g, b, a, noDepthTest, duration)
		local p1 = ffi.new("Vector", p1:unpack())
		local p2 = ffi.new("Vector", p2:unpack())
		local p3 = ffi.new("Vector", p3:unpack())
        nativeAddTriangleOverlay(p1, p2, p3, r, g, b, a, noDepthTest, duration)
    end,
	AddBoxOverlayNew = function(origin, dest, r, g, b, a, flThickness, duration)
		local origin = ffi.new("Vector", origin:unpack())
		local dest = ffi.new("Vector", dest:unpack())
        nativeAddBoxOverlayNew(origin, dest, r, g, b, a, flThickness, duration)
    end,
	AddLineOverlay = function(origin, dest, r, g, b, NoDepthTest, duration)
		local origin = ffi.new("Vector", origin:unpack())
		local dest = ffi.new("Vector", dest:unpack())
        nativeAddLineOverlay(origin, dest, r, g, b, NoDepthTest, duration)
    end,
	AddTextOverlayOffset = function(origin, line_offset, duration, format, ...)
		local origin = ffi.new("Vector", origin:unpack())
        nativeAddTextOverlayOffset(origin, line_offset, duration, format, ...)
    end,
	AddTextOverlay = function(origin, duration, format, ...)
		local origin = ffi.new("Vector", origin:unpack())
        nativeAddTextOverlay(origin, duration, format, ...)
    end,
	AddScreenTextOverlay = function(flXPos, flYPos, duration, r, g, b, a, text)
        nativeAddScreenTextOverlay(flXPos, flYPos, duration, r, g, b, a, text)
    end,
	AddSweptBoxOverlay = function(vStart, vEnd, mins, max, angles, r, g, b, a, duration)
		local vStart = ffi.new("Vector", vStart:unpack())
		local vEnd = ffi.new("Vector", vEnd:unpack())
		local mins = ffi.new("Vector", mins:unpack())
		local max = ffi.new("Vector", max:unpack())
		local angles = ffi.new("Vector", angles:unpack())
        nativeAddSweptBoxOverlay(vStart, vEnd, mins, max, angles, r, g, b, a, duration)
    end,
	AddGridOverlay = function(origin)
		local origin = ffi.new("Vector", origin:unpack())
        nativeAddGridOverlay(origin)
    end,
	AddCoordFrameOverlay = function(frame, flScale, vColorTable)
        nativeAddCoordFrameOverlay(frame, flScale, vColorTable)
    end,
	ScreenPositionVector = function(point)
        local screen = ffi.new("Vector")
		local point = ffi.new("Vector", point:unpack())
        return nativeScreenPositionVector(point, screen), screen
    end,
	ScreenPosition = function(flXPos, flYPos)
        local screen = ffi.new("Vector")
        return nativeScreenPosition(flXPos, flYPos, vecResult), screen
    end,
	GetFirst = function()
        return nativeGetFirst()
    end,
	GetNext = function(pCurrent)
        return nativeGetNext(pCurrent)
    end,
	ClearDeadOverlays = function()
        nativeClearDeadOverlays()
    end,
	ClearAllOverlays = function()
        nativeClearAllOverlays()
    end,
	AddTextOverlayRGBFloat = function(origin, line_offset, duration, r, g, b, a, format, ...)
		local origin = ffi.new("Vector", origin:unpack())
        nativeAddTextOverlayRGBFloat(origin, line_offset, duration, r, g, b, a, format, ...)
    end,
	AddTextOverlayRGB = function(origin, line_offset, duration, r, g, b, a, format, ...)
		local origin = ffi.new("Vector", origin:unpack())
        nativeAddTextOverlayRGBFloat(origin, line_offset, duration, r * 0.0039215689, g * 0.0039215689, b * 0.0039215689, a * 0.0039215689, format, ...)
    end,
	AddLineOverlayAlpha = function(origin, dest, r, g, b, a, NoDepthTest, duration)
		local origin = ffi.new("Vector", origin:unpack())
		local dest = ffi.new("Vector", dest:unpack())
        nativeAddLineOverlayAlpha(origin, dest, r, g, b, a, NoDepthTest, duration)
    end,
	AddBoxOverlay2 = function(origin, mins, max, angles, faceColor, edgeColor, duration)
		local origin = ffi.new("Vector", origin:unpack())
		local mins = ffi.new("Vector", mins:unpack())
		local max = ffi.new("Vector", max:unpack())
		local angles = ffi.new("Vector", angles:unpack())
        nativeAddBoxOverlay2(origin, mins, max, angles, faceColor, edgeColor, duration)
    end,
	AddLineOverlayWithAdjustableWidth = function(origin, dest, r, g, b, a, flThickness, duration)
		local origin = ffi.new("Vector", origin:unpack())
		local dest = ffi.new("Vector", dest:unpack())
        nativeAddLineOverlayWithAdjustableWidth(origin, dest, r, g, b, a, flThickness, duration)
    end,
	PurgeTextOverlays = function()
        nativePurgeTextOverlays()
    end,
	AddCapsuleOverlay = function(mins, max, flRadius, r, g, b, a, duration)
		local mins = ffi.new("Vector", mins:unpack())
		local max = ffi.new("Vector", max:unpack())
		local flRadius = ffi.new("float[1]", flRadius)
        nativeAddCapsuleOverlay(mins, max, flRadius, r, g, b, a, duration)
    end,
	DrawPill = function(mins, max, flRadius, r, g, b, a, duration)
		local mins = ffi.new("Vector", mins:unpack())
		local max = ffi.new("Vector", max:unpack())
		local flRadius = ffi.new("float[1]", flRadius)
        nativeDrawPill(mins, max, flRadius, r, g, b, a, duration)
    end,
    Utils = {
    	VectorTransform = function(vec, matrix)
			return vector(
				vec.x * matrix[0] + vec.y * matrix[1] + vec.z * matrix[2] + matrix[3],
				vec.x * matrix[4] + vec.y * matrix[5] + vec.z * matrix[6] + matrix[7],
				vec.x * matrix[8] + vec.y * matrix[9] + vec.z * matrix[10] + matrix[11]
			)
        end,
    	MatrixAngles = function(matrix)
			local flDist = math.sqrt(matrix[0] * matrix[0] + matrix[4] * matrix[4])
			if flDist > 0.001 then
				return vector(
					math.atan2(-matrix[8], flDist) * (180 / math.pi),
					math.atan2(matrix[4], matrix[0]) * (180 / math.pi),
					math.atan2(matrix[9], matrix[10]) * (180 / math.pi)
				)
			else
				return vector(
					math.atan2(-matrix[8], flDist) * (180 / math.pi),
					math.atan2(-matrix[1], matrix[5]) * (180 / math.pi),
					0
				)
			end
        end,
    	GetPlayerBoneMatrix = function(player, boneIndex)
			local pEntity = nativeGetClientEntity(player:get_index())
			local boneMatrix = ffi.cast(matrix3x4_t, ffi.cast("uintptr_t*", pEntity + 0x26A8)[0] + 0x30 * boneIndex)
			return boneMatrix
        end,
    	GetPlayerHitboxStudioBbox = function(player, hitboxes)
			local m_nModelIndex = player["m_nModelIndex"]
			local pModel = nativeGetModel(m_nModelIndex)
			if pModel == nil then
				return
			end
			local pStudioHdr = nativeGetStudioModel(pModel)
			if pStudioHdr == nil then
				return
			end
			local m_nHitboxSet = player["m_nHitboxSet"]
			local pHitboxSet = ffi.cast(StudioHitboxSet, ffi.cast("uintptr_t", pStudioHdr) + pStudioHdr.hitboxSetIndex) + m_nHitboxSet
			local ret = {}
			for _, v in ipairs(hitboxes) do
				ret[v % pHitboxSet.numHitboxes] = ffi.cast(StudioBbox, ffi.cast("uintptr_t", pHitboxSet) + pHitboxSet.hitboxIndex) + v % pHitboxSet.numHitboxes
			end
            return ret
        end
    },
	DrawHitboxes = function(player, hitboxes, r, g, b, a, duration)
        local hitboxes = DebugOverlay.Utils.GetPlayerHitboxStudioBbox(player, hitboxes)
        if hitboxes == nil then return end
		
        for i, v in pairs(hitboxes) do
            local boneMatrix = DebugOverlay.Utils.GetPlayerBoneMatrix(player, v.bone)
            if boneMatrix ~= nil then
                if v.capsuleRadius == -1 then
					if v.bbMin == nil or v.bbMax == nil then return end
                    DebugOverlay.AddBoxOverlay(vector(boneMatrix[3], boneMatrix[7], boneMatrix[11]), vector(v.bbMin.x, v.bbMin.y, v.bbMin.z), vector(v.bbMax.x, v.bbMax.y, v.bbMax.z), DebugOverlay.Utils.MatrixAngles(boneMatrix), r, g, b, a, duration)
                else
                    DebugOverlay.AddCapsuleOverlay(DebugOverlay.Utils.VectorTransform(v.bbMin, boneMatrix), DebugOverlay.Utils.VectorTransform(v.bbMax, boneMatrix), v.capsuleRadius, r, g, b, a, duration)
                end
            end
        end
    end
}

return DebugOverlay