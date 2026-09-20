ffi.cdef("\ttypedef struct {float x, y, z;}vec3_t;\n    typedef struct {\n\t\tint         m_nType;\n\t\tvoid*       m_pStartEnt;\n\t\tint         m_nStartAttachment;\n\t\tvoid*       m_pEndEnt;\n\t\tint         m_nEndAttachment;\n\t\tvec3_t      m_vecStart;\n\t\tvec3_t      m_vecEnd;\n\t\tint         m_nModelIndex;\n\t\tconst       char* m_pszModelName;\n\t\tint         m_nHaloIndex;\n\t\tconst       char* m_pszHaloName;\n\t\tfloat       m_flHaloScale;\n\t\tfloat       m_flLife;\n\t\tfloat       m_flWidth;\n\t\tfloat       m_flEndWidth;\n\t\tfloat       m_flFadeLength;\n\t\tfloat       m_flAmplitude;\n\t\tfloat       m_flBrightness;\n\t\tfloat       m_flSpeed;\n\t\tint         m_nStartFrame;\n\t\tfloat       m_flFrameRate;\n\t\tfloat       m_flRed;\n\t\tfloat       m_flGreen;\n\t\tfloat       m_flBlue;\n\t\tbool        m_bRenderable;\n\t\tint         m_nSegments;\n\t\tint         m_nFlags;\n\t\tvec3_t      m_vecCenter;\n\t\tfloat       m_flStartRadius;\n\t\tfloat       m_flEndRadius;\n\t} beam_info_t;\n")

local reloaded_0_0 = {
	IVModelInfo = ffi.cast("void***", utils.create_interface("engine.dll", "VModelInfoClient004"))
}

reloaded_0_0.FindOrLoadModel = ffi.cast("void*(__thiscall*)(void*, const char*)", reloaded_0_0.IVModelInfo[0][39])
reloaded_0_0.GetModelIndex = ffi.cast("int(__thiscall*)(void*, const char*)", reloaded_0_0.IVModelInfo[0][2])
reloaded_0_0.INetworkStringTable = ffi.cast("void***", utils.create_interface("engine.dll", "VEngineClientStringTable001"))
reloaded_0_0.FindTable = ffi.cast("void*(__thiscall*)(void*, const char*)", reloaded_0_0.INetworkStringTable[0][3])
reloaded_0_0.IViewRenderBeams = ffi.cast("void***", ffi.cast("void**", ffi.cast("char*", utils.opcode_scan("client.dll", "B9 ? ? ? ? A1 ? ? ? ? FF 10 A1 ? ? ? ? B9")) + 1)[0])
reloaded_0_0.DrawBeam = ffi.cast("void(__thiscall*)(void*, void*)", reloaded_0_0.IViewRenderBeams[0][6])

local reloaded_0_1 = ffi.new("beam_info_t")
local reloaded_0_2 = {
	cached = {},
	__init = function(arg_1_0)
		arg_1_0.m_nType = 0
		arg_1_0.m_pStartEnt = nil
		arg_1_0.m_nStartAttachment = 0
		arg_1_0.m_pEndEnt = nil
		arg_1_0.m_nEndAttachment = 0
		arg_1_0.m_vecStart = vector()
		arg_1_0.m_vecEnd = vector()
		arg_1_0.m_nModelIndex = -1
		arg_1_0.m_pszModelName = ""
		arg_1_0.m_nHaloIndex = -1
		arg_1_0.m_pszHaloName = ""
		arg_1_0.m_flHaloScale = 0
		arg_1_0.m_flLife = 0
		arg_1_0.m_flWidth = 0
		arg_1_0.m_flEndWidth = 0
		arg_1_0.m_flFadeLength = 0
		arg_1_0.m_flAmplitude = 0
		arg_1_0.m_flSpeed = 0
		arg_1_0.m_nStartFrame = 0
		arg_1_0.m_flFrameRate = 0
		arg_1_0.m_color = color()
		arg_1_0.m_bRenderable = 0
		arg_1_0.m_nSegments = 2
		arg_1_0.m_nFlags = 0
		arg_1_0.m_vecCenter = vector()
		arg_1_0.m_flStartRadius = 0
		arg_1_0.m_flEndRadius = 0
	end
}

reloaded_0_2:__init()

local reloaded_0_3 = {
	points = 12,
	circle_points = 18,
	ring_point = 16,
	ring = 14
}

function reloaded_0_2.__preCacheModel(arg_2_0)
	if reloaded_0_2.cached[arg_2_0] or not globals.is_in_game then
		return
	end

	local reloaded_2_0 = ffi.cast("void***", reloaded_0_0.FindTable(reloaded_0_0.INetworkStringTable, "modelprecache"))
	local reloaded_2_1 = ffi.cast("int(__thiscall*)(void*, bool, const char*, int, const void*)", reloaded_2_0[0][8])

	reloaded_0_0.FindOrLoadModel(reloaded_0_0.IVModelInfo, arg_2_0)

	local reloaded_2_2 = reloaded_2_1(reloaded_2_0, false, arg_2_0, -1, nil)
	local reloaded_2_3 = reloaded_0_2.cached

	if reloaded_2_2 == -1 then
		-- block empty
	end

	reloaded_2_3[arg_2_0] = true
end

for iter_0_0, iter_0_1 in pairs(reloaded_0_3) do
	reloaded_0_2[string.format("fncreate%s", iter_0_0)] = ffi.cast("void*(__thiscall*)(void*, beam_info_t&)", reloaded_0_0.IViewRenderBeams[0][iter_0_1])
	reloaded_0_2[string.format("create_beam_%s", iter_0_0)] = function()
		reloaded_0_1.m_nType = reloaded_0_2.m_nType
		reloaded_0_1.m_pStartEnt = reloaded_0_2.m_pStartEnt
		reloaded_0_1.m_nStartAttachment = reloaded_0_2.m_nStartAttachment
		reloaded_0_1.m_pEndEnt = reloaded_0_2.m_pEndEnt
		reloaded_0_1.m_nEndAttachment = reloaded_0_2.m_nEndAttachment
		reloaded_0_1.m_vecStart = {
			reloaded_0_2.m_vecStart:unpack()
		}
		reloaded_0_1.m_vecEnd = {
			reloaded_0_2.m_vecEnd:unpack()
		}
		reloaded_0_1.m_nModelIndex = reloaded_0_2.m_nModelIndex
		reloaded_0_1.m_pszModelName = reloaded_0_2.m_pszModelName
		reloaded_0_1.m_nHaloIndex = reloaded_0_2.m_nHaloIndex
		reloaded_0_1.m_pszHaloName = reloaded_0_2.m_pszHaloName
		reloaded_0_1.m_flHaloScale = reloaded_0_2.m_flHaloScale
		reloaded_0_1.m_flLife = reloaded_0_2.m_flLife
		reloaded_0_1.m_flWidth = reloaded_0_2.m_flWidth
		reloaded_0_1.m_flEndWidth = reloaded_0_2.m_flEndWidth
		reloaded_0_1.m_flFadeLength = reloaded_0_2.m_flFadeLength
		reloaded_0_1.m_flAmplitude = reloaded_0_2.m_flAmplitude
		reloaded_0_1.m_flSpeed = reloaded_0_2.m_flSpeed
		reloaded_0_1.m_nStartFrame = reloaded_0_2.m_nStartFrame
		reloaded_0_1.m_flFrameRate = reloaded_0_2.m_flFrameRate
		reloaded_0_1.m_flRed = reloaded_0_2.m_color.r
		reloaded_0_1.m_flGreen = reloaded_0_2.m_color.g
		reloaded_0_1.m_flBlue = reloaded_0_2.m_color.b
		reloaded_0_1.m_flBrightness = reloaded_0_2.m_color.a
		reloaded_0_1.m_bRenderable = reloaded_0_2.m_bRenderable
		reloaded_0_1.m_nSegments = reloaded_0_2.m_nSegments
		reloaded_0_1.m_nFlags = reloaded_0_2.m_nFlags
		reloaded_0_1.m_vecCenter = {
			reloaded_0_2.m_vecCenter:unpack()
		}
		reloaded_0_1.m_flStartRadius = reloaded_0_2.m_flStartRadius
		reloaded_0_1.m_flEndRadius = reloaded_0_2.m_flEndRadius

		if reloaded_0_2.m_nModelIndex == -1 then
			reloaded_0_1.m_nModelIndex = reloaded_0_0.GetModelIndex(reloaded_0_0.IVModelInfo, reloaded_0_2.m_pszModelName)
		end

		if reloaded_0_2.m_nHaloIndex == -1 then
			reloaded_0_1.m_nHaloIndex = reloaded_0_0.GetModelIndex(reloaded_0_0.IVModelInfo, reloaded_0_2.m_pszHaloName)
		end

		local reloaded_3_0 = reloaded_0_2[string.format("fncreate%s", iter_0_0)](reloaded_0_0.IViewRenderBeams, reloaded_0_1)

		reloaded_0_2.__preCacheModel(reloaded_0_2.m_pszModelName)
		reloaded_0_0.DrawBeam(reloaded_0_0.IViewRenderBeams, reloaded_3_0)
		reloaded_0_2:__init()
	end
end

return reloaded_0_2
