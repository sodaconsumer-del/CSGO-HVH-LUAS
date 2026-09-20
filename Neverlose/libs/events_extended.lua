if not pcall(ffi.sizeof, "CUserCmd") then
	ffi.cdef([[
		typedef struct {
			float x, y, z;
		} Vector;

		typedef struct {
			float m_flMatVal[3][4];
		} Matrix3x4;

		typedef struct {
			Matrix3x4 arrays[128];
		} Matrix3x4Arrays;

		unsigned long FindWindowA(
			const char* lpClassName,
			const char* lpWindowName
		);

		long SetWindowLongA(
			long hWnd,
			int nTypeIndex,
			unsigned long dwNewLong
		);

		typedef struct{
			int nameIndex;
			int numHitboxes;
			int hitboxIndex;
		} StudioHitboxSet;

		typedef struct {
			uint8_t r;
			uint8_t g;
			uint8_t b;
			uint8_t a;
		} ColorInfo;

		long CallWindowProcA(
			long lpPrevWndFunc,
			uintptr_t hWnd,
			unsigned int Msg,
			unsigned long wParam,
			long lParam
		);

		typedef struct {
			int m_bone;
			int m_group;
			Vector m_mins;
			Vector m_maxs;
			int m_name_id;
			Vector m_angle;
			float m_radius;
			int pad2[4];
		} StudioBoundBox;

		typedef struct {
			char pad_0x0000[0x18];
			uint32_t sequence;
			float prev_cycle;
			float weight;
			float weight_delta_rate;
			float playback_rate;
			float cycle;
			void *entity;
			char pad_0x0038[0x4];
		} AnimationLayer;

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
		} StudioHandler;

		typedef struct {
			StudioHandler* m_pStudioHdr;
			void* m_pStudioHWData;
			void* m_pRenderable;
			const Matrix3x4Arrays* m_pModelToWorld;
			void* m_decals;
			int m_drawFlags;
			int m_lod;
		} DrawModelState;

		typedef struct {
			void* fnHandle;
			char szName[260];
			int nLoadFlags;
			int nServerCount;
			int type;
			int flags;
			Vector vecMins;
			Vector vecMaxs;
			float radius;
			char pad[0x1C];
		} ModelInfo;

		typedef struct {
			void* GetSingleton;
			void* GetName;
			void* SetHost;
			void* ResetTouchList;
			void* AddToTouched;
			void* ProcessImpacts;
			void* Printf;
			void* StartSound;
			void* EmitSound;
			void* PlayBackEventFull;
			void* PlayerFallingDamage;
			void* PlayerSetAnimation;
			void* GetSrufaceProps;
			void* IsWorldEntity;
			void* SetSingleton;
		} CMoveHelper;

		typedef struct {
			Vector origin;
			Vector angles;
			char pad[0x4];
			void *pRenderable;
			const ModelInfo* pModel;
			const Matrix3x4Arrays* pModelToWorld;
			const Matrix3x4Arrays* pLightingOffset;
			const Vector *pLightingOrigin;
			int flags;
			int entity_index;
			int skin;
			int body;
			int hitboxset;
		} ModelRenderInfo;

		typedef struct {
			bool m_bFirstRunOfFunctions;
			bool m_bGameCodeMovedPlayer;
			bool m_bNoAirControl;
			int m_nPlayerHandle;
			int m_nImpulseCommand;
			Vector m_vecViewAngles;
			Vector m_vecAbsViewAngles;
			int m_nButtons;
			int m_nOldButtons;
			float m_flForwardMove;
			float m_flSideMove;
			float m_flUpMove;
			float m_flMaxSpeed;
			float m_flClientMaxSpeed;
			Vector m_vecVelocity;
			Vector m_vecTrailingVelocity;
			float m_flTrailingVelocityTime;
			Vector m_vecAngles;
			Vector m_vecOldAngles;
			float m_outStepHeight;
			Vector m_outWishVel;
			Vector m_outJumpVel;
			Vector m_vecConstraintCenter;
			float m_flConstraintRadius;
			float m_flConstraintWidth;
			float m_flConstraintSpeedFactor;
			bool m_bConstraintPastRadius;
			Vector m_vecAbsOrigin;
		} CMoveData;

		typedef struct {
			int x;
			int x_old;
			int y;
			int y_old;
			int width;
			int width_old;
			int height;
			int height_old;
			char pad_0x0020[0x90];
			float fov;
			float viewmodel_fov;
			Vector origin;
			Vector angles;
			float m_nearZ;
			float m_farZ;
			float m_nearViewModelZ;
			float m_farViewModelZ;
			float m_aspectRatio;
			float m_nearBlurDepth;
			float m_nearFocusDepth;
			float m_farFocusDepth;
			float m_farBlurDepth;
			float m_nearBlurRadius;
			float m_farBlurRadius;
			float m_doFQuality;
			int m_motionBlurMode;
			float m_shutterTime;
			Vector m_shutterOpenPosition;
			Vector m_shutterOpenAngles;
			Vector m_shutterClosePosition;
			Vector m_shutterCloseAngles;
			float m_offCenterTop;
			float m_offCenterBottom;
			float m_offCenterLeft;
			float m_offCenterRight;
			int m_edgeBlur;
			char pad_0x00D0[0x7C];
		} CViewSetup;

		typedef struct {
			void* vtable;
			int command_number;
			int tick_count;
			Vector view_angles;
			Vector aim_direction;
			float forwardmove;
			float sidemove;
			float upmove;
			int buttons;
			char impulse;
			int weapon_select;
			int weapon_subtype;
			int random_seed;
			short mousedx;
			short mousedy;
			bool predicted;
			Vector head_angles;
			Vector head_offset;
			bool send_packet;
			bool no_choke;
			float move_yaw;
			int block_movement;
			bool force_defensive;
			bool jitter_move;
			bool animate_move_lean;
			int choked_commands;
			bool in_left;
			bool in_use;
			bool in_alt;
			bool in_run;
			bool in_back;
			bool in_right;
			bool in_alt2;
			bool in_duck;
			bool in_jump;
			bool in_walk;
			bool in_attack;
			bool in_cancel;
			bool in_score;
			bool in_zoom;
			bool in_speed;
			bool in_reload;
			bool in_forward;
			bool in_attack2;
			bool in_moveleft;
			bool in_weapon;
			bool in_bullrush;
			bool in_grenade;
			bool in_lookspin;
			bool in_weapon2;
			bool in_grenade2;
			bool in_moveright;
		} CUserCmd;
	]])
end

local EventsExtended = {}
EventsExtended.__index = setmetatable(EventsExtended, {})
EventsExtended.data = {
	CallBackList = {},
	HookBuffers = {},
	MaterialCached = {},
	Author = "SYR1337",
	UserCmdShared = nil,
	WndProcOriginal = nil,
	CommandShared = nil,
	MoveHelperVFuncs = {},
	NetMessageVFuncs = {},
	ShouldTrackback = true,
	OldWndProcWindow = nil,
	HookedListenerTerminal = {},
	SharedSetupCommand = nil,
	ScriptName = "Events Extended Library",
	EasyHook = require("neverlose/easy_hook"),
	LastCommandTimer = common.get_timestamp() / 1000,
	LastSetupCommandTimer = common.get_timestamp() / 1000,
	ShutDownTimer = db["Extended Events Timer"] or (common.get_timestamp() / 1000),
	ExtendedEvents = {"paint", "output", "paint_ui", "renderer", "render_view", "view_render", "setup_bones", "direct3d_reset", "direct3d_clear", "in_prediction", "get_user_cmd", "paint_traverse", "start_drawing", "finish_drawing", "direct3d_present", "start_render_view", "accumulate_pose", "paint_traverse_ui", "override_mouse", "run_command", "move_command", "pre_render_3d", "direct3d_end_scene", "reset_command", "finish_command", "setup_command", "predict_command", "process_command", "window_procedure", "pre_data_update", "pre_data_change", "direct3d_begin_scene", "post_data_update", "post_data_change", "post_override_view", "send_net_message", "pre_send_datagram", "post_send_datagram", "draw_model_execute", "steam_send_message", "steam_retrieve_message", "receive_entity_message", "particle_simulate_end", "particle_simulate_start", "dispatch_user_message", "studio_frame_advance", "setup_movement_bounds", "start_track_prediction_errors", "finish_track_prediction_errors", "pre_entity_packet_received", "post_entity_packet_received", "post_network_data_received", "pre_update_client_side_animation", "post_update_client_side_animation", "pre_changed_client_side_animation", "post_changed_client_side_animation"},
	CallBackBuffer = {
		List = {},
		Status = {}
	},

	AnimationLayers = {
		["LEAN"] = 12,
		["ADJUST"] = 3,
		["FLINCH"] = 10,
		["FLASHED"] = 9,
		["ALIVELOPP"] = 11,
		["AIMMATRIX"] = 0,
		["WHOLE_BODY"] = 8,
		["WEAPON_ACTION"] = 1,
		["MOVEMENT_MOVE"] = 6,
		["MOVEMENT_JUMP_OR_FALL"] = 4,
		["MOVEMENT_STRAFECHANGE"] = 7,
		["MOVEMENT_LAND_OR_CLIMB"] = 5,
		["WEAPON_ACTION_RECROUCH"] = 2
	},

	AnimationPoses = {
		["SPEED"] = 3,
		["STAND"] = 1,
		["LEAN_YAW"] = 2,
		["JUMP_FALL"] = 6,
		["MOVE_YAW"] = 7,
		["BODY_YAW"] = 11,
		["STRAFE_YAW"] = 0,
		["DEATH_YAW"] = 18,
		["LADDER_YAW"] = 4,
		["BODY_PITCH"] = 12,
		["LADDER_SPEED"] = 5,
		["MOVE_BLEND_RUN"] = 10,
		["MOVE_BLEND_WALK"] = 9,
		["MOVE_BLEND_CROUCH"] = 8,
		["AIM_BLEND_STAND_IDLE"] = 13,
		["AIM_BLEND_STAND_RUN"] = 15,
		["AIM_BLEND_STAND_WALK"] = 14,
		["AIM_BLEND_CROUCH_IDLE"] = 16,
		["AIM_BLEND_CROUCH_WALK"] = 17
	},

	Buttons = {
		in_left = bit.lshift(1, 7),
		in_use = bit.lshift(1, 5),
		in_alt = bit.lshift(1, 14),
		in_run = bit.lshift(1, 12),
		in_back = bit.lshift(1, 4),
		in_right = bit.lshift(1, 8),
		in_alt2 = bit.lshift(1, 15),
		in_duck = bit.lshift(1, 2),
		in_jump = bit.lshift(1, 1),
		in_walk = bit.lshift(1, 18),
		in_attack = bit.lshift(1, 0),
		in_cancel = bit.lshift(1, 6),
		in_score = bit.lshift(1, 16),
		in_zoom = bit.lshift(1, 19),
		in_speed = bit.lshift(1, 17),
		in_reload = bit.lshift(1, 13),
		in_forward = bit.lshift(1, 3),
		in_attack2 = bit.lshift(1, 11),
		in_moveleft = bit.lshift(1, 9),
		in_weapon = bit.lshift(1, 20),
		in_bullrush = bit.lshift(1, 22),
		in_grenade = bit.lshift(1, 23),
		in_lookspin = bit.lshift(1, 25),
		in_weapon2 = bit.lshift(1, 21),
		in_grenade2 = bit.lshift(1, 24),
		in_moveright = bit.lshift(1, 10)
	}
}

EventsExtended.__index.ErrorOutput = function(self, event, text)
	print_raw(("\a00FFFF[%s] \aFFFFFF-> stack error trackback[\a00FFFF%s\aFFFFFF]: \aFF0000%s"):format(self.data.ScriptName, event, text))
end

EventsExtended.__index.GetJmpAddress = function(self, addr, pattern)
	local Signature = ffi.cast("uintptr_t", utils.opcode_scan(addr, pattern))
	return ffi.cast("uintptr_t", Signature + 0x5 + ffi.cast("int32_t*", Signature + 0x1)[0])
end

EventsExtended.__index.Contains = function(self, array, this)
	for _, data in pairs(array) do
		if data == this then
			return true
		end
	end

	return false
end

EventsExtended.__index.Initiative = function(self)
	for _, data in pairs(self.data.ExtendedEvents) do
		self.data.CallBackBuffer.List[data] = {}
		self.data.CallBackBuffer.Status[data] = false
	end
end

EventsExtended.__index.HexTextToOriginal = function(self, text, only_rgb)
	local OriginalText = tostring(text)
	local HexText = OriginalText:gmatch(only_rgb and "\a%x%x%x%x%x%x" or "\a%x%x%x%x%x%x%x%x")()
	while (HexText ~= nil) do
		OriginalText = OriginalText:gsub(HexText, "")
		HexText = OriginalText:gmatch(only_rgb and "\a%x%x%x%x%x%x" or "\a%x%x%x%x%x%x%x%x")()
	end

	return OriginalText
end

EventsExtended.__index.BindArgs = function(self, callback, ...)
	local arguments = {...}
	if #arguments <= 1 then
		return function(...)
			return callback(unpack(arguments), ...)
		end

	elseif #arguments > 1 then
		for _, arg in pairs(arguments) do
			callback = self:BindArgs(callback, arg)
		end

		return callback
	end
end

EventsExtended.__index.Assert = function(self, inline, event, output)
	local Successfully, Result = pcall(function()
		local OriginalText = self:HexTextToOriginal(output, true)
		local TrackBackLineTextStartPointer = OriginalText:find('"]:')
		if TrackBackLineTextStartPointer then
			OriginalText = OriginalText:sub(TrackBackLineTextStartPointer + 3, OriginalText:len())
		end

		local TrackBackLineNumberEnd = OriginalText:find(":")
		if TrackBackLineNumberEnd then
			local LineNumber = OriginalText:sub(0, TrackBackLineNumberEnd - 1)
			OriginalText = ("(line %s) -> %s"):format(LineNumber, OriginalText:sub(TrackBackLineNumberEnd + 2, OriginalText:len()))
		end

		if not inline then
			self:ErrorOutput(event, OriginalText)
			return true
		end

		return false
	end)

	return Successfully and Result
end

EventsExtended.__index.CreateCHelpers = function(self)
	self.CHelpers = {
		User32Library = ffi.load("User32.dll"),
		VClient = ffi.cast("void***", utils.create_interface("client.dll", "VClient018")),
		ParticlesSimulationEnd = self:GetJmpAddress("client.dll", "E8 ? ? ? ? 85 F6 74 14"),
		VGuiPanel = ffi.cast("void***", utils.create_interface("vgui2.dll", "VGUI_Panel009")),
		VEngineVGui = ffi.cast("void***", utils.create_interface("engine.dll", "VEngineVGui001")),
		VEngineClient = ffi.cast("void***", utils.create_interface("engine.dll", "VEngineClient014")),
		VEngineModel = ffi.cast("void***", utils.create_interface("engine.dll", "VEngineModel016")),
		Print = ffi.cast("uintptr_t", utils.opcode_scan("client.dll", "55 8B EC FF 75 08 8B 11 8D 41 1C")),
		VClientPrediction = ffi.cast("void***", utils.create_interface("client.dll", "VClientPrediction001")),
		VGameMovement = ffi.cast("void***", utils.create_interface("client.dll", "GameMovement001")),
		GetNetChannel = utils.get_vfunc("engine.dll", "VEngineClient014", 78, "void***(__thiscall*)(void*)"),
		ParticlesSimulationStart = self:GetJmpAddress("client.dll", "E8 ? ? ? ? C7 43 ? ? ? ? ? 8D BB ? ? ? ?"),
		FinishDrawing = ffi.cast("uintptr_t", utils.opcode_scan("vguimatsurface.dll", "8B 0D ? ? ? ? 56 C6 05")),
		ColorPrint = ffi.cast("uintptr_t", utils.opcode_scan("client.dll", "55 8B EC 56 8B F1 80 ? ? ? ? ? ? 74 0B")),
		StartDrawing = ffi.cast("uintptr_t", utils.opcode_scan("vguimatsurface.dll", "55 8B EC 83 E4 C0 83 EC 38")),
		GetVGuiPanelName = utils.get_vfunc("vgui2.dll", "VGUI_Panel009", 36, "const char*(__thiscall*)(void*, uint32_t)"),
		UpdateClientSideAnimation = ffi.cast("uintptr_t", utils.opcode_scan("client.dll", "8B F1 80 BE ? ? ? ? ? 74 36", - 5)),
		AccumulatePose = ffi.cast("uintptr_t", utils.opcode_scan("client.dll", "55 8B EC 83 E4 ? B8 ? ? ? ? E8 ? ? ? ? A1 ? ? ? ? 56 57 8B F9")),
		ForcedMaterialOverride = utils.get_vfunc("studiorender.dll", "VStudioRender026", 33, "void(__thiscall*)(void*, void*, const int32_t, const int32_t)"),
		FindMaterial = utils.get_vfunc("materialsystem.dll", "VMaterialSystem080", 84, "void*(__thiscall*)(void*, const char*, const char*, bool, const char*)"),
		VViewRender = (function()
			local ViewBaseAddress = utils.opcode_scan("client.dll", "8B 0D ? ? ? ? FF 75 0C 8B 45 08")
			local ViewRenderAddress = ffi.cast("void***",  ffi.cast("uintptr_t", ViewBaseAddress) + 0x2)[0][0]
			return ffi.cast("void***", ViewRenderAddress)
		end)(),

		VDirectDevice = (function()
			local ShaderApiAddress = utils.opcode_scan("shaderapidx9.dll", "A1 ? ? ? ? 50 8B 08 FF 51 0C")
			local DirectDeviceAddress = ffi.cast("void***",  ffi.cast("uintptr_t", ShaderApiAddress) + 0x1)[0][0]
			return ffi.cast("void***", DirectDeviceAddress)
		end)(),

		VClientInput = (function()
			local ClientBaseAddress = ffi.cast("uintptr_t**", utils.create_interface("client.dll", "VClient018"))[0]
			local ClientInputAddress = ffi.cast("void**", ClientBaseAddress[16] + ffi.cast("unsigned long", 0x1))[0]
			return ffi.cast("void***", ClientInputAddress)
		end)(),

		VClientMode = (function()
			local ClientBaseAddress = ffi.cast("uintptr_t**", utils.create_interface("client.dll", "VClient018"))[0]
			local ClientModeAddress = ffi.cast("void***", ClientBaseAddress[10] + ffi.cast("unsigned long", 0x5))[0][0]
			return ffi.cast("void***", ClientModeAddress)
		end)(),

		GetSteamGenericInterface = (function()
			local SteamImport = utils.opcode_scan("client.dll", "FF 15 ? ? ? ? 8B D8 FF 15")
			local GetSteamUser = ffi.cast("int(__cdecl***)()", ffi.cast("char*", SteamImport) + 2)[0][0]
			local GetSteamPipe = ffi.cast("int(__cdecl***)()", ffi.cast("char*", SteamImport) + 10)[0][0]
			local GetSteamGenericInterface = utils.get_vfunc("steamclient.dll", "SteamClient020", 12, "void*(__thiscall*)(void*, int, int, const char*)")
			return self:BindArgs(GetSteamGenericInterface, GetSteamUser(), GetSteamPipe())
		end)()
	}

	self.CHelpers.VSteamGameCoordinator = ffi.cast("void***", self.CHelpers.GetSteamGenericInterface("SteamGameCoordinator001"))
	self.CHelpers.GetUserCmd = self:BindArgs(ffi.cast("CUserCmd*(__thiscall*)(void*, int, int)", self.CHelpers.VClientInput[0][8]), self.CHelpers.VClientInput)
	self.CHelpers.SteamGameCoordinatorIsMessageAvailable = self:BindArgs(ffi.cast("bool(__thiscall*)(void*, uint32_t*)", self.CHelpers.VSteamGameCoordinator[0][1]), self.CHelpers.VSteamGameCoordinator)
end

EventsExtended.__index.RegisteredCallBack = function(self, key, handle)
	if not self.data.CallBackList[key] then
		self.data.CallBackList[key] = {
			List = {},
			Handle = nil,
			Successed = false
		}
	end

	table.insert(self.data.CallBackList[key].List, handle)
	if not self.data.CallBackList[key].Successed then
		local ThisInstance = function(...)
			for _, Handle in pairs(self.data.CallBackList[key].List) do
				if type(Handle) == "function" then
					Handle(...)
				end
			end
		end

		if key == "shutdown" then
			utils.execute_after(0.1, function()
				events[key]:set(ThisInstance)
			end)
		else
			events[key]:set(ThisInstance)
		end

		self.data.CallBackList[key].Successed = true
		self.data.CallBackList[key].Handle = ThisInstance
	end
end

EventsExtended.__index.GetStudioBoundContexts = function(self, StudioBound)
	return {
		bone = StudioBound.m_bone,
		group = StudioBound.m_group,
		radius = StudioBound.m_radius,
		name_id = StudioBound.m_name_id,
		mins = vector(StudioBound.m_mins.x, StudioBound.m_mins.y, StudioBound.m_mins.z),
		maxs = vector(StudioBound.m_maxs.x, StudioBound.m_maxs.y, StudioBound.m_maxs.z),
		angle = vector(StudioBound.m_angle.x, StudioBound.m_angle.y, StudioBound.m_angle.z)

	}
end

EventsExtended.__index.GetAnimationLayer = function(self, player)
	if not player or type(player) ~= "userdata" or not player:is_player() then
		return false
	end

	local AddressVtable = ffi.cast("void***", player[0])
	return ffi.cast("AnimationLayer**",
		ffi.cast("char*", AddressVtable) + 0x2990
	)[0]
end

EventsExtended.__index.GetBoundBox = function(self, player, bone, studio_handler)
	if not player or not player:is_alive() then
		return false
	end

	local Results = {}
	local m_HitboxSet = player["m_nHitboxSet"]
	local m_StudioHitboxSet = ffi.cast("StudioHitboxSet*", ffi.cast("uintptr_t", studio_handler) + studio_handler.hitboxSetIndex) + m_HitboxSet
	if type(bone) == "table" then
		for _, index in ipairs(bone) do
			Results[index % m_StudioHitboxSet.numHitboxes] = ffi.cast("StudioBoundBox*", ffi.cast("uintptr_t", m_StudioHitboxSet) + m_StudioHitboxSet.hitboxIndex) + index % m_StudioHitboxSet.numHitboxes
		end

		return Results
	elseif type(bone) == "number" then
		return ffi.cast("StudioBoundBox*", ffi.cast("uintptr_t", m_StudioHitboxSet) + m_StudioHitboxSet.hitboxIndex) + bone % m_StudioHitboxSet.numHitboxes
	end

	return false
end

EventsExtended.__index.GetEntIndex = function(self, entity_handle, from_renderable, is_networkable)
	if not entity_handle or entity_handle == ffi.NULL then
		return false
	end

	local Renderable = ffi.cast("void***", is_networkable and entity_handle or (from_renderable and entity_handle or (ffi.cast("uintptr_t", entity_handle) + 0x4)))
	if not self.GetEntIndexFromRenderable then
		local GetClientUnknown = ffi.cast("void***(__thiscall*)(void*)", Renderable[0][0])
		if GetClientUnknown == ffi.NULL then
			return false
		end

		local GetClientNetworkable = ffi.cast("void***(__thiscall*)(void*)", GetClientUnknown(Renderable)[0][4])
		if GetClientNetworkable == ffi.NULL then
			return false
		end

		local GetEntIndex = ffi.cast("int(__thiscall*)(void*)", GetClientNetworkable(GetClientUnknown(Renderable))[0][10])
		if GetEntIndex == ffi.NULL then
			return false
		end

		self.GetEntIndexFromRenderable = function(self, renderable, is_networkable)
			if not renderable or renderable == ffi.NULL then
				return false
			end

			if is_networkable then
				return GetEntIndex(renderable)
			end

			local ClientUnknown = GetClientUnknown(renderable)
			if not ClientUnknown or ClientUnknown == ffi.NULL then
				return false
			end

			local ClientNetworkable = GetClientNetworkable(ClientUnknown)
			if not ClientNetworkable or ClientNetworkable == ffi.NULL then
				return false
			end

			return GetEntIndex(ClientNetworkable)
		end

		return false
	end

	return self:GetEntIndexFromRenderable(Renderable, is_networkable)
end

EventsExtended.__index.GetMoveHelperContexts = function(self, MoveHelper)
	return setmetatable({
		[0] = MoveHelper,
	}, {
		__index = {
			SetHost = function(this, Host)
				if not self.data.MoveHelperVFuncs["SetHost"] then
					self.data.MoveHelperVFuncs["SetHost"] = self:BindArgs(ffi.cast("void(__thiscall*)(void*, void*)", MoveHelper.SetHost), this[0])
				end

				return self.data.MoveHelperVFuncs["SetHost"](Host)
			end,

			ProcessImpacts = function(this)
				if not self.data.MoveHelperVFuncs["ProcessImpacts"] then
					self.data.MoveHelperVFuncs["ProcessImpacts"] = self:BindArgs(ffi.cast("void(__thiscall*)(void*)", MoveHelper.ProcessImpacts), this[0])
				end

				return self.data.MoveHelperVFuncs["ProcessImpacts"]()
			end,

			GetName = function(this, EntityPointer)
				if not self.data.MoveHelperVFuncs["GetName"] then
					self.data.MoveHelperVFuncs["GetName"] = self:BindArgs(ffi.cast("const char*(__thiscall*)(void*, void*)", MoveHelper.GetName), this[0])
				end

				return ffi.string(self.data.MoveHelperVFuncs["GetName"](EntityPointer))
			end
		}
	})
end

EventsExtended.__index.WriteUserCmdContexts = function(self, UserCmdContexts, UserCmd, List)
	for Key, Data in pairs(UserCmdContexts) do
		if (type(List) == "table" and not self:Contains(List, Key)) or self:Contains({
			"in_alt",
			"in_left",
			"in_run",
			"in_use",
			"in_alt2",
			"in_walk",
			"in_back",
			"in_right",
			"in_duck",
			"in_jump",
			"in_score",
			"in_zoom",
			"in_speed",
			"in_attack",
			"in_cancel",
			"in_reload",
			"no_choke",
			"in_attack2",
			"move_yaw",
			"in_forward",
			"in_weapon",
			"in_bullrush",
			"in_grenade",
			"jitter_move",
			"in_lookspin",
			"in_moveleft",
			"in_weapon2",
			"in_grenade2",
			"send_packet",
			"in_moveright",
			"force_defensive",
			"block_movement",
			"choked_commands",
			"animate_move_lean"
		}, Key) then
			goto skip
		end

		local Received = type(Data)
		if self:Contains({
			"view_angles",
			"aim_direction",
			"mouse_movement"
		}, Key) then
			if not self:Assert(Received == "userdata" and type(Data.x) == "number" and type(Data.y) == "number" and type(Data.z) == "number", "*.command", ('attempt to write: "%s" to a invalid value, received: %s, expected: userdata'):format(Key, Received)) then
				local Current = Key == "mouse_movement" and vector(UserCmd.mousedx, UserCmd.mousedy) or vector(UserCmd[Key].x, UserCmd[Key].y, UserCmd[Key].z)
				if Key == "mouse_movement" then
					if UserCmd.mousedx ~= Data.x then
						UserCmd.mousedx = Data.x
					end

					if UserCmd.mousedy ~= Data.y then
						UserCmd.mousedy = Data.y
					end

				elseif Key ~= "mouse_movement" then
					for _, This in pairs({"x", "y", "z"}) do
						if UserCmd[Key][This] ~= Data[This] then
							UserCmd[Key][This] = Data[This]
						end
					end
				end
			end

		elseif type(Data) == type(UserCmd[Key]) and UserCmd[Key] ~= Data then
			if not self:Assert(Received == type(UserCmd[Key]), "*.command", ('attempt to write: "%s" to a invalid value, received: %s, expected: %s'):format(Key, Received, type(UserCmd[Key]))) then
				UserCmd[Key] = Data
			end
		end

		::skip::
	end
end

EventsExtended.__index.GetMoveDataContexts = function(self, MoveData)
	return {
		buttons = MoveData.m_nButtons,
		upmove = MoveData.m_flUpMove,
		sidemove = MoveData.m_flSideMove,
		maxspeed = MoveData.m_flMaxSpeed,
		old_buttons = MoveData.m_nOldButtons,
		step_height = MoveData.m_outStepHeight,
		player_handle = MoveData.m_nPlayerHandle,
		no_air_control = MoveData.m_bNoAirControl,
		forwardmove = MoveData.m_flForwardMove,
		constrain_width = MoveData.m_flConstraintWidth,
		client_maxspeed = MoveData.m_flClientMaxSpeed,
		constraint_radius = MoveData.m_flConstraintRadius,
		impulse_command = MoveData.m_nImpulseCommand,
		trailing_velocity_time = MoveData.m_flTrailingVelocityTime,
		first_run_of_functions = MoveData.m_bFirstRunOfFunctions,
		constraint_past_radius = MoveData.m_bConstraintPastRadius,
		constraint_speed_factor = MoveData.m_flConstraintSpeedFactor,
		game_code_moved_player = MoveData.m_bGameCodeMovedPlayer,
		angles = vector(MoveData.m_vecAngles.x, MoveData.m_vecAngles.y, MoveData.m_vecAngles.z),
		velocity = vector(MoveData.m_vecVelocity.x, MoveData.m_vecVelocity.y, MoveData.m_vecVelocity.z),
		wish_velocity = vector(MoveData.m_outWishVel.x, MoveData.m_outWishVel.y, MoveData.m_outWishVel.z),
		jump_velocity = vector(MoveData.m_outJumpVel.x, MoveData.m_outJumpVel.y, MoveData.m_outJumpVel.z),
		abs_origin = vector(MoveData.m_vecAbsOrigin.x, MoveData.m_vecAbsOrigin.y, MoveData.m_vecAbsOrigin.z),
		old_angles = vector(MoveData.m_vecOldAngles.x, MoveData.m_vecOldAngles.y, MoveData.m_vecOldAngles.z),
		view_angles = vector(MoveData.m_vecViewAngles.x, MoveData.m_vecViewAngles.y, MoveData.m_vecViewAngles.z),
		trailing_velocity = vector(MoveData.m_vecTrailingVelocity.x, MoveData.m_vecTrailingVelocity.y, MoveData.m_vecTrailingVelocity.z),
		abs_view_angles = vector(MoveData.m_vecAbsViewAngles.x, MoveData.m_vecAbsViewAngles.y, MoveData.m_vecAbsViewAngles.z),
		constraint_center = vector(MoveData.m_vecConstraintCenter.x, MoveData.m_vecConstraintCenter.y, MoveData.m_vecConstraintCenter.z)
	}
end

EventsExtended.__index.GetViewSetupContexts = function(self, ViewSetup)
	return {
		fov = ViewSetup.fov,
		far_z = ViewSetup.m_farZ,
		near_z = ViewSetup.m_nearZ,
		edge_blur = ViewSetup.m_edgeBlur,
		dof_quality = ViewSetup.m_doFQuality,
		aspect_ratio = ViewSetup.m_aspectRatio,
		shutter_time = ViewSetup.m_shutterTime,
		screen = vector(ViewSetup.x, ViewSetup.y),
		viewmodel_fov = ViewSetup.viewmodel_fov,
		far_blur_depth = ViewSetup.m_farBlurDepth,
		far_blur_radius = ViewSetup.m_farBlurRadius,
		far_focus_depth = ViewSetup.m_farFocusDepth,
		near_blur_depth = ViewSetup.m_nearBlurDepth,
		near_blur_radius = ViewSetup.m_nearBlurRadius,
		size = vector(ViewSetup.width, ViewSetup.height),
		far_view_model_z = ViewSetup.m_farViewModelZ,
		near_focus_depth = ViewSetup.m_nearFocusDepth,
		offscreen_center_left = ViewSetup.m_offCenterLeft,
		offscreen_center_top = ViewSetup.m_offCenterTop,
		motion_blur_mode = ViewSetup.m_motionBlurMode,
		near_view_model_z = ViewSetup.m_nearViewModelZ,
		offscreen_center_right = ViewSetup.m_offCenterRight,
		old_screen = vector(ViewSetup.x_old, ViewSetup.y_old),
		offscreen_center_bottom = ViewSetup.m_offCenterBottom,
		old_size = vector(ViewSetup.width_old, ViewSetup.height_old),
		view = vector(ViewSetup.origin.x, ViewSetup.origin.y, ViewSetup.origin.z),
		camera = vector(ViewSetup.angles.x, ViewSetup.angles.y, ViewSetup.angles.z),
		shutter_close_angles = vector(ViewSetup.m_shutterCloseAngles.x, ViewSetup.m_shutterCloseAngles.y, ViewSetup.m_shutterCloseAngles.z),
		shutter_open_angles = vector(ViewSetup.m_shutterOpenAngles.x, ViewSetup.m_shutterOpenAngles.y, ViewSetup.m_shutterOpenAngles.z),
		shutter_close_position = vector(ViewSetup.m_shutterClosePosition.x, ViewSetup.m_shutterClosePosition.y, ViewSetup.m_shutterClosePosition.z),
		shutter_open_position = vector(ViewSetup.m_shutterOpenPosition.x, ViewSetup.m_shutterOpenPosition.y, ViewSetup.m_shutterOpenPosition.z)
	}
end

EventsExtended.__index.GetUserCmdContexts = function(self, UserCmd, Extra)
	return {
		in_alt = UserCmd.in_alt,
		in_left = UserCmd.in_left,
		in_run = UserCmd.in_run,
		in_use = UserCmd.in_use,
		in_alt2 = UserCmd.in_alt2,
		in_walk = UserCmd.in_walk,
		in_right = UserCmd.in_right,
		in_back = UserCmd.in_back,
		no_choke = Extra.no_choke,
		in_duck = UserCmd.in_duck,
		buttons = UserCmd.buttons,
		in_jump = UserCmd.in_jump,
		in_score = UserCmd.in_score,
		upmove = UserCmd.upmove,
		move_yaw = Extra.move_yaw,
		in_zoom = UserCmd.in_zoom,
		in_speed = UserCmd.in_speed,
		jitter_move = Extra.jitter_move,
		in_attack = UserCmd.in_attack,
		in_reload = UserCmd.in_reload,
		in_cancel = UserCmd.in_cancel,
		predicted = UserCmd.predicted,
		sidemove = UserCmd.sidemove,
		in_attack2 = UserCmd.in_attack2,
		send_packet = Extra.send_packet,
		tick_count = UserCmd.tick_count,
		in_forward = UserCmd.in_forward,
		in_bullrush = UserCmd.in_bullrush,
		in_weapon = UserCmd.in_weapon,
		in_grenade = UserCmd.in_grenade,
		in_lookspin = UserCmd.in_lookspin,
		in_moveleft = UserCmd.in_moveleft,
		in_weapon2 = UserCmd.in_weapon2,
		in_grenade2 = UserCmd.in_grenade2,
		in_moveright = UserCmd.in_moveright,
		forwardmove = UserCmd.forwardmove,
		random_seed = UserCmd.random_seed,
		force_defensive = Extra.force_defensive,
		weapon_select = UserCmd.weapon_select,
		block_movement = Extra.block_movement,
		weapon_subtype = UserCmd.weapon_subtype,
		choked_commands = Extra.choked_commands,
		animate_move_lean = Extra.animate_move_lean,
		command_number = UserCmd.command_number,
		mouse_movement = vector(UserCmd.mousedx, UserCmd.mousedy),
		view_angles = vector(UserCmd.view_angles.x, UserCmd.view_angles.y, UserCmd.view_angles.z),
		aim_direction = vector(UserCmd.aim_direction.x, UserCmd.aim_direction.y, UserCmd.aim_direction.z)
	}
end

EventsExtended.__index.WriteViewSetupContexts = function(self, ViewSetupContexts, ViewSetup)
	local Converts = {
		far_z = "m_farZ",
		near_z = "m_nearZ",
		edge_blur = "m_edgeBlur",
		dof_quality = "m_doFQuality",
		aspect_ratio = "m_aspectRatio",
		shutter_time = "m_shutterTime",
		far_blur_depth = "m_farBlurDepth",
		far_blur_radius = "m_farBlurRadius",
		far_focus_depth = "m_farFocusDepth",
		near_blur_depth = "m_nearBlurDepth",
		near_blur_radius = "m_nearBlurRadius",
		far_view_model_z = "m_farViewModelZ",
		near_focus_depth = "m_nearFocusDepth",
		offscreen_center_left = "m_offCenterLeft",
		offscreen_center_top = "m_offCenterTop",
		motion_blur_mode = "m_motionBlurMode",
		near_view_model_z = "m_nearViewModelZ",
		offscreen_center_right = "m_offCenterRight",
		offscreen_center_bottom = "m_offCenterBottom"
	}

	for Key, Data in pairs(ViewSetupContexts) do
		local Received = type(Data)
		local CurrentKey = Converts[Key] or Key
		if self:Contains({
			"size",
			"view",
			"screen",
			"camera",
			"old_size",
			"old_screen",
			"shutter_close_angles",
			"shutter_open_angles",
			"shutter_close_position",
			"shutter_open_position"
		}, Key) then
			if not self:Assert(Received == "userdata", "*.view", ('attempt to write: "%s" to a invalid value, received: %s, expected: userdata'):format(Key, Received)) then
				if Key == "screen" then
					ViewSetup.x = Data.x
					ViewSetup.y = Data.y
				elseif Key == "old_screen" then
					ViewSetup.x_old = Data.x
					ViewSetup.y_old = Data.y
				elseif Key == "size" then
					ViewSetup.width = Data.x
					ViewSetup.height = Data.y
				elseif Key == "old_size" then
					ViewSetup.width_old = Data.x
					ViewSetup.height_old = Data.y
				elseif Key == "view" then
					ViewSetup.origin.x = Data.x
					ViewSetup.origin.y = Data.y
					ViewSetup.origin.z = Data.z
				elseif Key == "camera" then
					ViewSetup.angles.x = Data.x
					ViewSetup.angles.y = Data.y
					ViewSetup.angles.z = Data.z
				elseif Key == "shutter_close_angles" then
					ViewSetup.m_shutterCloseAngles.x = Data.x
					ViewSetup.m_shutterCloseAngles.y = Data.y
					ViewSetup.m_shutterCloseAngles.z = Data.z
				elseif Key == "shutter_open_angles" then
					ViewSetup.m_shutterOpenAngles.x = Data.x
					ViewSetup.m_shutterOpenAngles.y = Data.y
					ViewSetup.m_shutterOpenAngles.z = Data.z
				elseif Key == "shutter_close_position" then
					ViewSetup.m_shutterClosePosition.x = Data.x
					ViewSetup.m_shutterClosePosition.y = Data.y
					ViewSetup.m_shutterClosePosition.z = Data.z
				elseif Key == "shutter_open_position" then
					ViewSetup.m_shutterOpenPosition.x = Data.x
					ViewSetup.m_shutterOpenPosition.y = Data.y
					ViewSetup.m_shutterOpenPosition.z = Data.z
				end
			end

		elseif self:Assert(Received == type(ViewSetup[CurrentKey]), "*.view", ('attempt to write: "%s" to a invalid value, received: %s, expected: %s'):format(Key, Received, type(ViewSetup[CurrentKey]))) and ViewSetup[CurrentKey] ~= Data then
			ViewSetup[CurrentKey] = Data
		end
	end
end

EventsExtended.__index.GetNetMessageContexts = function(self, iNetMessage)
	local NetMessage = ffi.cast("void***", iNetMessage)
	return setmetatable({
		[0] = iNetMessage,
		MessageVtable = NetMessage
	}, {
		__index = {
			process = function(this)
				if not self.data.NetMessageVFuncs["Process"] then
					self.data.NetMessageVFuncs["Process"] = self:BindArgs(ffi.cast("bool(__thiscall*)(void*)", this.MessageVtable[0][3]), this.MessageVtable)
				end

				return self.data.NetMessageVFuncs["Process"]()
			end,

			get_type = function(this)
				if not self.data.NetMessageVFuncs["GetType"] then
					self.data.NetMessageVFuncs["GetType"] = self:BindArgs(ffi.cast("int(__thiscall*)(void*)", this.MessageVtable[0][7]), this.MessageVtable)
				end

				return self.data.NetMessageVFuncs["GetType"]()
			end,

			is_reliable = function(this)
				if not self.data.NetMessageVFuncs["IsReliable"] then
					self.data.NetMessageVFuncs["IsReliable"] = self:BindArgs(ffi.cast("bool(__thiscall*)(void*)", this.MessageVtable[0][6]), this.MessageVtable)
				end

				return self.data.NetMessageVFuncs["IsReliable"]()
			end,

			set_reliable = function(this, State)
				if not self.data.NetMessageVFuncs["SetReliable"] then
					self.data.NetMessageVFuncs["SetReliable"] = self:BindArgs(ffi.cast("void(__thiscall*)(void*, bool)", this.MessageVtable[0][2]), this.MessageVtable)
				end

				return self.data.NetMessageVFuncs["SetReliable"](State)
			end,

			get_size = function(this)
				if not self.data.NetMessageVFuncs["GetSize"] then
					self.data.NetMessageVFuncs["GetSize"] = self:BindArgs(ffi.cast("uint32_t(__thiscall*)(void*)", this.MessageVtable[0][12]), this.MessageVtable)
				end

				return self.data.NetMessageVFuncs["GetSize"]()
			end,

			get_name = function(this)
				if not self.data.NetMessageVFuncs["GetName"] then
					self.data.NetMessageVFuncs["GetName"] = self:BindArgs(ffi.cast("const char*(__thiscall*)(void*)", this.MessageVtable[0][9]), this.MessageVtable)
				end

				return ffi.string(self.data.NetMessageVFuncs["GetName"]())
			end,

			get_group = function(this)
				if not self.data.NetMessageVFuncs["GetGroup"] then
					self.data.NetMessageVFuncs["GetGroup"] = self:BindArgs(ffi.cast("int(__thiscall*)(void*)", this.MessageVtable[0][8]), this.MessageVtable)
				end

				return self.data.NetMessageVFuncs["GetGroup"]()
			end,

			get_net_channel = function(this)
				if not self.data.NetMessageVFuncs["GetNetChannel"] then
					self.data.NetMessageVFuncs["GetNetChannel"] = self:BindArgs(ffi.cast("void*(__thiscall*)(void*)", this.MessageVtable[0][10]), this.MessageVtable)
				end

				return self.data.NetMessageVFuncs["GetNetChannel"]()
			end,

			set_net_channel = function(this, iNetChannel)
				if not self.data.NetMessageVFuncs["SetNetChannel"] then
					self.data.NetMessageVFuncs["SetNetChannel"] = self:BindArgs(ffi.cast("void(__thiscall*)(void*, void*)", this.MessageVtable[0][1]), this.MessageVtable)
				end

				return self.data.NetMessageVFuncs["SetNetChannel"](iNetChannel)
			end,

			write_from_buffer = function(this, Buffer)
				if not self.data.NetMessageVFuncs["WriteFromBuffer"] then
					self.data.NetMessageVFuncs["WriteFromBuffer"] = self:BindArgs(ffi.cast("bool(__thiscall*)(void*, void*)", this.MessageVtable[0][5]), this.MessageVtable)
				end

				return self.data.NetMessageVFuncs["WriteFromBuffer"](Buffer)
			end,

			read_from_buffer = function(this, Buffer)
				if not self.data.NetMessageVFuncs["ReadFromBuffer"] then
					self.data.NetMessageVFuncs["ReadFromBuffer"] = self:BindArgs(ffi.cast("bool(__thiscall*)(void*, void*)", this.MessageVtable[0][4]), this.MessageVtable)
				end

				return self.data.NetMessageVFuncs["ReadFromBuffer"](Buffer)
			end
		}
	})
end

EventsExtended.__index.RectangleRender = function(self, RectanglePointer)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["render_view"]) do
		local Successfully, Result = pcall(CallBack, RectanglePointer)
		self:Assert(Successfully or not self.data.ShouldTrackback, "render_view", Result)
	end
end

EventsExtended.__index.StartDrawing = function(self)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["start_drawing"]) do
		local Successfully, Result = pcall(CallBack)
		self:Assert(Successfully or not self.data.ShouldTrackback, "start_drawing", Result)
	end
end

EventsExtended.__index.FinishDrawing = function(self)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["finish_drawing"]) do
		local Successfully, Result = pcall(CallBack)
		self:Assert(Successfully or not self.data.ShouldTrackback, "finish_drawing", Result)
	end
end

EventsExtended.__index.ResetCommand = function(self)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["reset_command"]) do
		local Successfully, Result = pcall(CallBack)
		self:Assert(Successfully or not self.data.ShouldTrackback, "reset_command", Result)
	end
end

EventsExtended.__index.AccumulatePose = function(self)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["accumulate_pose"]) do
		local Successfully, Result = pcall(CallBack)
		self:Assert(Successfully or not self.data.ShouldTrackback, "accumulate_pose", Result)
	end
end

EventsExtended.__index.DirectReset = function(self, Direct3DDevice, Direct3DPresentParameter)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["direct3d_reset"]) do
		local Successfully, Result = pcall(CallBack, Direct3DDevice, Direct3DPresentParameter)
		self:Assert(Successfully or not self.data.ShouldTrackback, "direct3d_reset", Result)
	end
end

EventsExtended.__index.DirectEndScene = function(self, Direct3DDevice)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["direct3d_end_scene"]) do
		local Successfully, Result = pcall(CallBack, Direct3DDevice)
		self:Assert(Successfully or not self.data.ShouldTrackback, "direct3d_end_scene", Result)
	end
end

EventsExtended.__index.PreSendDatagram = function(self, Datagram)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["pre_send_datagram"]) do
		local Successfully, Result = pcall(CallBack, Datagram)
		self:Assert(Successfully or not self.data.ShouldTrackback, "pre_send_datagram", Result)
	end
end

EventsExtended.__index.PostSendDatagram = function(self, Datagram, Stack)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["post_send_datagram"]) do
		local Successfully, Result = pcall(CallBack, Datagram, Stack)
		self:Assert(Successfully or not self.data.ShouldTrackback, "post_send_datagram", Result)
	end
end

EventsExtended.__index.DirectBeginScene = function(self, Direct3DDevice)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["direct3d_begin_scene"]) do
		local Successfully, Result = pcall(CallBack, Direct3DDevice)
		self:Assert(Successfully or not self.data.ShouldTrackback, "direct3d_begin_scene", Result)
	end
end

EventsExtended.__index.ParticlesSimulationEnd = function(self, ParticleEntity)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["particle_simulate_end"]) do
		local Successfully, Result = pcall(CallBack, ParticleEntity)
		self:Assert(Successfully or not self.data.ShouldTrackback, "particle_simulate_end", Result)
	end
end

EventsExtended.__index.ParticlesSimulationStart = function(self, ParticleEntity)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["particle_simulate_start"]) do
		local Successfully, Result = pcall(CallBack, ParticleEntity)
		self:Assert(Successfully or not self.data.ShouldTrackback, "particle_simulate_start", Result)
	end
end

EventsExtended.__index.SetupMovementBounds = function(self, MoveData)
	local MoveDataContexts = self:GetMoveDataContexts(MoveData)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["setup_movement_bounds"]) do
		local Successfully, Result = pcall(CallBack, MoveDataContexts)
		self:Assert(Successfully or not self.data.ShouldTrackback, "setup_movement_bounds", Result)
	end
end

EventsExtended.__index.PostEntityPacketReceived = function(self)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["post_entity_packet_received"]) do
		local Successfully, Result = pcall(CallBack)
		self:Assert(Successfully or not self.data.ShouldTrackback, "post_entity_packet_received", Result)
	end
end

EventsExtended.__index.PostNetworkDataReceived = function(self, CommandsAcknowledged)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["post_network_data_received"]) do
		local Successfully, Result = pcall(CallBack, CommandsAcknowledged)
		self:Assert(Successfully or not self.data.ShouldTrackback, "post_network_data_received", Result)
	end
end

EventsExtended.__index.PreClientSideAnimationChanged = function(self)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["pre_changed_client_side_animation"]) do
		local Successfully, Result = pcall(CallBack)
		self:Assert(Successfully or not self.data.ShouldTrackback, "pre_changed_client_side_animation", Result)
	end
end

EventsExtended.__index.PostClientSideAnimationChanged = function(self)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["post_changed_client_side_animation"]) do
		local Successfully, Result = pcall(CallBack)
		self:Assert(Successfully or not self.data.ShouldTrackback, "post_changed_client_side_animation", Result)
	end
end

EventsExtended.__index.DirectClear = function(self, Direct3DDevice, Count, RectanglePointer, Flags, Color, Z, Stencil)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["direct3d_clear"]) do
		local Successfully, Result = pcall(CallBack, Direct3DDevice, Count, RectanglePointer, Flags, Color, Z, Stencil)
		self:Assert(Successfully or not self.data.ShouldTrackback, "direct3d_clear", Result)
	end
end

EventsExtended.__index.DirectPresent = function(self, Direct3DDevice, SourceRectangle, DestinationRectangle, hWnd, DirtyRegion)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["direct3d_present"]) do
		local Successfully, Result = pcall(CallBack, Direct3DDevice, SourceRectangle, DestinationRectangle, hWnd, DirtyRegion)
		self:Assert(Successfully or not self.data.ShouldTrackback, "direct3d_present", Result)
	end
end

EventsExtended.__index.PreEntityPacketReceived = function(self, CommandsAcknowledged, CurrentWorldUpdatePacket, ServerTicksElapsed)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["pre_entity_packet_received"]) do
		local Successfully, Result = pcall(CallBack, CommandsAcknowledged, CurrentWorldUpdatePacket, ServerTicksElapsed)
		self:Assert(Successfully or not self.data.ShouldTrackback, "pre_entity_packet_received", Result)
	end
end

EventsExtended.__index.SteamRetrieveMessage = function(self, nMessageType, pMessageHeader, pDestination, nDestinationSize, pMessageSize)
	local bIsAvailable = self.CHelpers.SteamGameCoordinatorIsMessageAvailable(pMessageSize)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["steam_retrieve_message"]) do
		local Successfully, Result = pcall(CallBack, nMessageType, pMessageHeader, pDestination, nDestinationSize, pMessageSize, bIsAvailable)
		self:Assert(Successfully or not self.data.ShouldTrackback, "steam_retrieve_message", Result)
	end
end

EventsExtended.__index.PreDataUpdate = function(self, NetWorkable, iType)
	local EntIndex = self:GetEntIndex(NetWorkable, false, true)
	if EntIndex then
		local Entity = entity.get(EntIndex)
		for _, CallBack in pairs(self.data.CallBackBuffer.List["pre_data_update"]) do
			local Successfully, Result = pcall(CallBack, Entity, iType)
			self:Assert(Successfully or not self.data.ShouldTrackback, "pre_data_update", Result)
		end
	end
end

EventsExtended.__index.PreDataChange = function(self, NetWorkable, iType)
	local EntIndex = self:GetEntIndex(NetWorkable, false, true)
	if EntIndex then
		local Entity = entity.get(EntIndex)
		for _, CallBack in pairs(self.data.CallBackBuffer.List["pre_data_change"]) do
			local Successfully, Result = pcall(CallBack, Entity, iType)
			self:Assert(Successfully or not self.data.ShouldTrackback, "pre_data_change", Result)
		end
	end
end

EventsExtended.__index.PostDataUpdate = function(self, NetWorkable, iType)
	local EntIndex = self:GetEntIndex(NetWorkable, false, true)
	if EntIndex then
		local Entity = entity.get(EntIndex)
		for _, CallBack in pairs(self.data.CallBackBuffer.List["post_data_update"]) do
			local Successfully, Result = pcall(CallBack, Entity, iType)
			self:Assert(Successfully or not self.data.ShouldTrackback, "post_data_update", Result)
		end
	end
end

EventsExtended.__index.PostDataChange = function(self, NetWorkable, iType)
	local EntIndex = self:GetEntIndex(NetWorkable, false, true)
	if EntIndex then
		local Entity = entity.get(EntIndex)
		for _, CallBack in pairs(self.data.CallBackBuffer.List["post_data_change"]) do
			local Successfully, Result = pcall(CallBack, Entity, iType)
			self:Assert(Successfully or not self.data.ShouldTrackback, "post_data_change", Result)
		end
	end
end

EventsExtended.__index.SetupBones = function(self, Renderable, BoneMatrix, MaxBones, Mask, Timer)
	local EntIndex = self:GetEntIndex(Renderable, true)
	if EntIndex then
		local Entity = entity.get(EntIndex)
		for _, CallBack in pairs(self.data.CallBackBuffer.List["setup_bones"]) do
			local Successfully, Result = pcall(CallBack, Entity, BoneMatrix, MaxBones, Mask, Timer)
			self:Assert(Successfully or not self.data.ShouldTrackback, "setup_bones", Result)
		end
	end
end

EventsExtended.__index.StudioFrameAdvance = function(self, player)
	local EntIndex = self:GetEntIndex(player)
	if EntIndex then
		local Entity = entity.get(EntIndex)
		for _, CallBack in pairs(self.data.CallBackBuffer.List["studio_frame_advance"]) do
			local Successfully, Result = pcall(CallBack, Entity)
			self:Assert(Successfully or not self.data.ShouldTrackback, "studio_frame_advance", Result)
		end
	end
end

EventsExtended.__index.StartTrackPredictionErrors = function(self, player)
	local EntIndex = self:GetEntIndex(player)
	if EntIndex then
		local Entity = entity.get(EntIndex)
		for _, CallBack in pairs(self.data.CallBackBuffer.List["start_track_prediction_errors"]) do
			local Successfully, Result = pcall(CallBack, Entity)
			self:Assert(Successfully or not self.data.ShouldTrackback, "start_track_prediction_errors", Result)
		end
	end
end

EventsExtended.__index.FinishTrackPredictionErrors = function(self, player)
	local EntIndex = self:GetEntIndex(player)
	if EntIndex then
		local Entity = entity.get(EntIndex)
		for _, CallBack in pairs(self.data.CallBackBuffer.List["finish_track_prediction_errors"]) do
			local Successfully, Result = pcall(CallBack, Entity)
			self:Assert(Successfully or not self.data.ShouldTrackback, "finish_track_prediction_errors", Result)
		end
	end
end

EventsExtended.__index.ReceiveMessage = function(self, NetWorkable, ClassIndex, Buffer)
	local EntIndex = self:GetEntIndex(NetWorkable, false, true)
	if EntIndex then
		local Entity = entity.get(EntIndex)
		for _, CallBack in pairs(self.data.CallBackBuffer.List["receive_entity_message"]) do
			local Successfully, Result = pcall(CallBack, Entity, ClassIndex, Buffer)
			self:Assert(Successfully or not self.data.ShouldTrackback, "receive_entity_message", Result)
		end
	end
end

EventsExtended.__index.StartRenderView = function(self)
	if not globals.is_connected or not globals.is_in_game then
		return
	end

	for _, CallBack in pairs(self.data.CallBackBuffer.List["start_render_view"]) do
		local Successfully, Result = pcall(CallBack)
		self:Assert(Successfully or not self.data.ShouldTrackback, "start_render_view", Result)
	end
end

EventsExtended.__index.OverrideMouse = function(self, MouseX, MouseY)
	local MouseMovementPosition = vector(MouseX[0], MouseY[0])
	local TargetMousePosition = ui.get_mouse_position() + MouseMovementPosition
	for _, CallBack in pairs(self.data.CallBackBuffer.List["override_mouse"]) do
		local Successfully, Result = pcall(CallBack, TargetMousePosition, MouseMovementPosition)
		self:Assert(Successfully or not self.data.ShouldTrackback, "override_mouse", Result)
	end

	MouseX[0] = MouseMovementPosition.x
	MouseY[0] = MouseMovementPosition.y
end

EventsExtended.__index.InPrediction = function(self, Status)
	local PreventStatus = nil
	for _, CallBack in pairs(self.data.CallBackBuffer.List["in_prediction"]) do
		local Successfully, Result = pcall(CallBack, Status)
		self:Assert(Successfully or not self.data.ShouldTrackback, "in_prediction", Result)
		if type(Result) == "boolean" then
			PreventStatus = Result
		end
	end

	return PreventStatus
end

EventsExtended.__index.DispatchUserMessage = function(self, MessageType, Dest, Bytes, MessageData)
	local Status = nil
	for _, CallBack in pairs(self.data.CallBackBuffer.List["dispatch_user_message"]) do
		local Successfully, Result = pcall(CallBack, MessageType, Dest, Bytes, MessageData)
		self:Assert(Successfully or not self.data.ShouldTrackback, "dispatch_user_message", Result)
		if type(Result) == "boolean" then
			Status = Result
		end
	end

	return Status
end

EventsExtended.__index.SteamSendMessage = function(self, uMessageHeader, pData, uData)
	local PreventStatus = nil
	local nMessageHeader = uMessageHeader % 0x7FFFFFFF
	for _, CallBack in pairs(self.data.CallBackBuffer.List["steam_send_message"]) do
		local Successfully, Result = pcall(CallBack, nMessageHeader, uMessageHeader, pData, uData)
		self:Assert(Successfully or not self.data.ShouldTrackback, "steam_send_message", Result)
		if type(Result) == "number" then
			PreventStatus = Result
		end
	end

	return PreventStatus
end

EventsExtended.__index.OverrideView = function(self, ViewSetup)
	if not globals.is_connected or not globals.is_in_game then
		return
	end

	local ViewSetupContexts = self:GetViewSetupContexts(ViewSetup)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["post_override_view"]) do
		local Successfully, Result = pcall(CallBack, ViewSetupContexts)
		self:Assert(Successfully or not self.data.ShouldTrackback, "post_override_view", Result)
	end

	self:WriteViewSetupContexts(ViewSetupContexts, ViewSetup)
end

EventsExtended.__index.PreRenderView = function(self, ViewSetup)
	if not globals.is_connected or not globals.is_in_game then
		return
	end

	local ViewSetupContexts = self:GetViewSetupContexts(ViewSetup)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["pre_render_3d"]) do
		local Successfully, Result = pcall(CallBack, ViewSetupContexts)
		self:Assert(Successfully or not self.data.ShouldTrackback, "pre_render_3d", Result)
	end

	self:WriteViewSetupContexts(ViewSetupContexts, ViewSetup)
end

EventsExtended.__index.ProcessCommand = function(self, player, MoveData)
	local local_player = entity.get_local_player()
	if not local_player or player ~= ffi.cast("void*", local_player[0]) then
		return 
	end

	local MoveDataContexts = self:GetMoveDataContexts(MoveData)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["process_command"]) do
		local Successfully, Result = pcall(CallBack, MoveDataContexts)
		self:Assert(Successfully or not self.data.ShouldTrackback, "process_command", Result)
	end
end

EventsExtended.__index.PredictionCommand = function(self, StartFrame, ValidFrame, InComingAcknowledged, OutgoingCommand)
	local Context = {
		valid_frame = ValidFrame,
		begin_frame = StartFrame,
		command_number = OutgoingCommand,
		command_outgoing = InComingAcknowledged
	}

	for _, CallBack in pairs(self.data.CallBackBuffer.List["predict_command"]) do
		local Successfully, Result = pcall(CallBack, Context)
		self:Assert(Successfully or not self.data.ShouldTrackback, "predict_command", Result)
	end
end

EventsExtended.__index.Paint = function(self, this, iPanel)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["paint_ui"]) do
		local Successfully, Result = pcall(CallBack)
		self:Assert(Successfully or not self.data.ShouldTrackback, "paint_ui", Result)
	end

	if globals.is_connected and globals.is_in_game then
		for _, CallBack in pairs(self.data.CallBackBuffer.List["paint"]) do
			local Successfully, Result = pcall(CallBack)
			self:Assert(Successfully or not self.data.ShouldTrackback, "paint", Result)
		end
	end
end

EventsExtended.__index.WindowProcedure = function(self, Message, Wparam, Lparam)
	local Context = {
		result = nil,
		lparam = Lparam,
		wparam = Wparam,
		message = Message,
	}

	for _, CallBack in pairs(self.data.CallBackBuffer.List["window_procedure"]) do
		local Successfully, Result = pcall(CallBack, Context)
		if not self:Assert(Successfully or not self.data.ShouldTrackback, "window_procedure", Result) then
			Context.result = Result
		end
	end

	return Context.result
end

EventsExtended.__index.ViewRender = function(self, ViewSetup, ViewSetupHud, ClearFlags, WhatToDraw)
	if not globals.is_connected or not globals.is_in_game then
		return
	end

	local ViewSetupContexts = self:GetViewSetupContexts(ViewSetup)
	local ViewSetupHudContexts = self:GetViewSetupContexts(ViewSetupHud)
	for _, CallBack in pairs(self.data.CallBackBuffer.List["view_render"]) do
		local Successfully, Result = pcall(CallBack, ViewSetupContexts, ViewSetupHudContexts, ClearFlags, WhatToDraw)
		self:Assert(Successfully or not self.data.ShouldTrackback, "view_render", Result)
	end

	self:WriteViewSetupContexts(ViewSetupContexts, ViewSetup)
	self:WriteViewSetupContexts(ViewSetupHudContexts, ViewSetupHud)
end

EventsExtended.__index.OutPutLog = function(self, cText, Color)
	local Context = {
		prevent = false,
		message = ffi.string(cText),
		color = color(255, 255, 255, 255)
	}

	if Color then
		Context.color = color(Color.r, Color.g, Color.b, Color.a)
	end

	for _, CallBack in pairs(self.data.CallBackBuffer.List["output"]) do
		local Successfully, Result = pcall(CallBack, Context)
		self:Assert(Successfully or not self.data.ShouldTrackback, "output", Result)
		if type(Result) == "boolean" then
			Context.prevent = not Result
		end
	end

	return Context
end

EventsExtended.__index.SendNetMessage = function(self, iNetMessage, bForceReliable, bVoice)
	local Contexts = {
		result = nil,
		voice = bVoice,
		force_reliable = bForceReliable,
		net_message = self:GetNetMessageContexts(iNetMessage)
	}

	for _, CallBack in pairs(self.data.CallBackBuffer.List["send_net_message"]) do
		local Successfully, Result = pcall(CallBack, Contexts)
		self:Assert(Successfully or not self.data.ShouldTrackback, "send_net_message", Result)
		if type(Result) == "boolean" then
			Contexts.result = Result
		end
	end

	if type(Contexts.result) == "boolean" then
		return Contexts.result
	end

	return Contexts
end

EventsExtended.__index.RunCommand = function(self, player, UserCmd, MoveHelper)
	local local_player = entity.get_local_player()
	if not local_player or player ~= ffi.cast("void*", local_player[0]) or not self.data.CommandShared then
		return 
	end

	for key, data in pairs(self.data.Buttons) do
		UserCmd[key] = bit.band(UserCmd.buttons, data) ~= 0
	end

	local MoveHelperContexts = self:GetMoveHelperContexts(MoveHelper)
	local UserCmdContexts = self:GetUserCmdContexts(UserCmd, {
		no_choke = false,
		jitter_move = true,
		send_packet = true,
		force_defensive = false,
		move_yaw = self.data.CommandShared.move_yaw,
		block_movement = self.data.CommandShared.block_movement,
		choked_commands = self.data.CommandShared.choked_commands,
		animate_move_lean = self.data.CommandShared.animate_move_lean
	})

	for _, CallBack in pairs(self.data.CallBackBuffer.List["run_command"]) do
		local Successfully, Result = pcall(CallBack, UserCmdContexts, MoveHelperContexts)
		self:Assert(Successfully or not self.data.ShouldTrackback, "run_command", Result)
	end
end

EventsExtended.__index.PaintTraverse = function(self, this, iPanel)
	if type(this) == "string" and this == "RenderPanel" then
		for _, CallBack in pairs(self.data.CallBackBuffer.List["renderer"]) do
			local Successfully, Result = pcall(CallBack)
			self:Assert(Successfully or not self.data.ShouldTrackback, "renderer", Result)
		end

	elseif type(this) ~= "string" then
		local VGuiPanelName = ffi.string(self.CHelpers.GetVGuiPanelName(iPanel))
		if VGuiPanelName == "FocusOverlayPanel" then
			for _, CallBack in pairs(self.data.CallBackBuffer.List["renderer"]) do
				local Successfully, Result = pcall(CallBack)
				self:Assert(Successfully or not self.data.ShouldTrackback, "renderer", Result)
			end

			for _, CallBack in pairs(self.data.CallBackBuffer.List["paint_traverse_ui"]) do
				local Successfully, Result = pcall(CallBack)
				self:Assert(Successfully or not self.data.ShouldTrackback, "paint_traverse_ui", Result)
			end

		elseif VGuiPanelName == "CounterStrike Root Panel" then
			for _, CallBack in pairs(self.data.CallBackBuffer.List["paint_traverse"]) do
				local Successfully, Result = pcall(CallBack)
				self:Assert(Successfully or not self.data.ShouldTrackback, "paint_traverse", Result)
			end
		end
	end
end

EventsExtended.__index.SetupCommand = function(self, player, UserCmd, MoveHelper, MoveData)
	local local_player = entity.get_local_player()
	if not local_player or player ~= ffi.cast("void*", local_player[0]) or not self.data.CommandShared then
		return
	end

	local ValidCallBackPacket = false
	local CurrentTimer = common.get_timestamp() / 1000
	local MoveDataContexts = self:GetMoveDataContexts(MoveData)
	local MoveHelperContexts = self:GetMoveHelperContexts(MoveHelper)
	for key, data in pairs(self.data.Buttons) do
		UserCmd[key] = bit.band(UserCmd.buttons, data) ~= 0
	end

	local UserCmdContexts = self:GetUserCmdContexts(UserCmd, {
		no_choke = false,
		jitter_move = true,
		send_packet = true,
		force_defensive = false,
		move_yaw = self.data.CommandShared.move_yaw,
		block_movement = self.data.CommandShared.block_movement,
		choked_commands = self.data.CommandShared.choked_commands,
		animate_move_lean = self.data.CommandShared.animate_move_lean
	})

	for _, CallBack in pairs(self.data.CallBackBuffer.List["move_command"]) do
		ValidCallBackPacket = true
		local Successfully, Result = pcall(CallBack, UserCmdContexts)
		self:Assert(Successfully or not self.data.ShouldTrackback, "move_command", Result)
	end

	for _, CallBack in pairs(self.data.CallBackBuffer.List["setup_command"]) do
		ValidCallBackPacket = true
		local Successfully, Result = pcall(CallBack, UserCmdContexts, MoveHelperContexts, MoveDataContexts)
		self:Assert(Successfully or not self.data.ShouldTrackback, "setup_command", Result)
	end

	local MoveYaw = math.rad(UserCmdContexts.view_angles.y - UserCmdContexts.move_yaw)
	UserCmdContexts.sidemove = math.sin(MoveYaw) * UserCmdContexts.sidemove
	UserCmdContexts.forwardmove = math.cos(MoveYaw) * UserCmdContexts.forwardmove
	for key, data in pairs(self.data.Buttons) do
		local CurrentButtonState = bit.band(UserCmdContexts.buttons, data) ~= 0
		local ButtonState = UserCmdContexts[key] and UserCmdContexts[key] ~= 0
		if CurrentButtonState ~= ButtonState then
			UserCmdContexts.buttons = ButtonState and bit.bor(UserCmdContexts.buttons, data) or bit.bxor(UserCmdContexts.buttons, data)
		end
	end

	self.data.UserCmdShared = UserCmdContexts
	self.data.SharedSetupCommand = UserCmdContexts
	self:WriteUserCmdContexts(UserCmdContexts, UserCmd)
	if ValidCallBackPacket then
		self.data.LastCommandTimer = CurrentTimer
		self.data.LastSetupCommandTimer = CurrentTimer
	end
end

EventsExtended.__index.FinishCommand = function(self, player, UserCmd, MoveData)
	local local_player = entity.get_local_player()
	if not local_player or player ~= ffi.cast("void*", local_player[0]) then
		return 
	end

	local CurrentTimer = common.get_timestamp() / 1000
	local SharedCommand = self.data.SharedSetupCommand or self.data.CommandShared
	if SharedCommand == self.data.SharedSetupCommand and math.abs(CurrentTimer - self.data.LastSetupCommandTimer) > 0.25 then
		SharedCommand = self.data.CommandShared
	end

	if not SharedCommand then
		return
	end

	local ValidCallBackPacket = false
	local MoveDataContexts = self:GetMoveDataContexts(MoveData)
	for key, data in pairs(self.data.Buttons) do
		UserCmd[key] = bit.band(UserCmd.buttons, data) ~= 0
	end

	local UserCmdContexts = self:GetUserCmdContexts(UserCmd, {
		no_choke = false,
		jitter_move = true,
		send_packet = true,
		force_defensive = false,
		move_yaw = SharedCommand.move_yaw,
		block_movement = SharedCommand.block_movement,
		choked_commands = SharedCommand.choked_commands,
		animate_move_lean = SharedCommand.animate_move_lean
	})

	if SharedCommand == self.data.SharedSetupCommand then
		UserCmdContexts.no_choke = self.data.SharedSetupCommand.no_choke
		UserCmdContexts.jitter_move = self.data.SharedSetupCommand.jitter_move
		UserCmdContexts.send_packet = self.data.SharedSetupCommand.send_packet
		UserCmdContexts.force_defensive = self.data.SharedSetupCommand.force_defensive
	end

	for _, CallBack in pairs(self.data.CallBackBuffer.List["move_command"]) do
		ValidCallBackPacket = true
		local Successfully, Result = pcall(CallBack, UserCmdContexts)
		self:Assert(Successfully or not self.data.ShouldTrackback, "move_command", Result)
	end

	for _, CallBack in pairs(self.data.CallBackBuffer.List["finish_command"]) do
		ValidCallBackPacket = true
		local Successfully, Result = pcall(CallBack, UserCmdContexts, MoveDataContexts)
		self:Assert(Successfully or not self.data.ShouldTrackback, "finish_command", Result)
	end

	local MoveYaw = math.rad(UserCmdContexts.view_angles.y - UserCmdContexts.move_yaw)
	UserCmdContexts.sidemove = math.sin(MoveYaw) * UserCmdContexts.sidemove
	UserCmdContexts.forwardmove = math.cos(MoveYaw) * UserCmdContexts.forwardmove
	for key, data in pairs(self.data.Buttons) do
		local CurrentButtonState = bit.band(UserCmdContexts.buttons, data) ~= 0
		local ButtonState = UserCmdContexts[key] or (type(UserCmdContexts[key]) == "number" and UserCmdContexts[key] >= 1)
		if CurrentButtonState ~= ButtonState then
			UserCmdContexts.buttons = ButtonState and bit.bor(UserCmdContexts.buttons, data) or bit.bxor(UserCmdContexts.buttons, data)
		end
	end

	self.data.UserCmdShared = UserCmdContexts
	self:WriteUserCmdContexts(UserCmdContexts, UserCmd, {
		"buttons",
		"upmove",
		"sidemove",
		"tick_count",
		"view_angles",
		"forwardmove",
		"aim_direction",
		"command_number"
	})

	if ValidCallBackPacket then
		self.data.LastCommandTimer = CurrentTimer
	end
end

EventsExtended.__index.PreUpdateClientSideAnimation = function(self, entity_handle)
	local EntIndex = self:GetEntIndex(entity_handle)
	if EntIndex then
		local Player = entity.get(EntIndex)
		local AnimationLayer = self:GetAnimationLayer(Player)
		local Contexts = setmetatable({
			entity = Player,
		}, {
			__index = {
				SetPoseParameter = function(this, key, value)
					local PoseParameter = this.entity["m_flPoseParameter"]
					local index = type(key) == "string" and self.data.AnimationPoses[key] or key
					if PoseParameter and not self:Assert(type(index) == "number" and type(value) == "number", "pre_update_client_side_animation", "attempt set pose pamater to a invalid index / set pose pamater to a invalid number") then
						PoseParameter[index] = value
					end
				end,

				SetAnimationLayer = function(this, key, data)
					local index = type(key) == "string" and self.data.AnimationLayers[key] or key
					if AnimationLayer and not self:Assert(type(index) == "number" and type(data) == "table", "pre_update_client_side_animation", "attempt set animation layer to a invalid index / set animation layer to a invalid data") and index <= 12 then
						local LayerInfo = AnimationLayer[index]
						if LayerInfo then
							for _, key in pairs({
								"cycle",
								"weight",
								"sequence",
								"prev_cycle",
								"playback_rate",
								"weight_delta_rate"
							}) do
								if type(data[key]) == "number" and LayerInfo[key] ~= data[key] then
									LayerInfo[key] = data[key]
								end
							end
						end
					end
				end
			}
		})

		for _, CallBack in pairs(self.data.CallBackBuffer.List["pre_update_client_side_animation"]) do
			local Successfully, Result = pcall(CallBack, Contexts)
			self:Assert(Successfully or not self.data.ShouldTrackback, "pre_update_client_side_animation", Result)
		end
	end
end

EventsExtended.__index.PostUpdateClientSideAnimation = function(self, entity_handle)
	local EntIndex = self:GetEntIndex(entity_handle)
	if EntIndex then
		local Player = entity.get(EntIndex)
		local AnimationLayer = self:GetAnimationLayer(Player)
		local Contexts = setmetatable({
			entity = Player,
		}, {
			__index = {
				SetPoseParameter = function(this, key, value)
					local PoseParameter = this.entity["m_flPoseParameter"]
					local index = type(key) == "string" and self.data.AnimationPoses[key] or key
					if PoseParameter and not self:Assert(type(index) == "number" and type(value) == "number", "post_update_client_side_animation", "attempt set pose pamater to a invalid index / set pose pamater to a invalid number") then
						PoseParameter[index] = value
					end
				end,

				SetAnimationLayer = function(this, key, data)
					local index = type(key) == "string" and self.data.AnimationLayers[key] or key
					if AnimationLayer and not self:Assert(type(index) == "number" and type(data) == "table", "post_update_client_side_animation", "attempt set animation layer to a invalid index / set animation layer to a invalid data") and index <= 12 then
						local LayerInfo = AnimationLayer[index]
						if LayerInfo then
							for _, key in pairs({
								"cycle",
								"weight",
								"sequence",
								"prev_cycle",
								"playback_rate",
								"weight_delta_rate"
							}) do
								if data[key] and type(data[key]) == "number" and LayerInfo[key] ~= data[key] then
									LayerInfo[key] = data[key]
								end
							end
						end
					end
				end
			}
		})

		for _, CallBack in pairs(self.data.CallBackBuffer.List["post_update_client_side_animation"]) do
			local Successfully, Result = pcall(CallBack, Contexts)
			self:Assert(Successfully or not self.data.ShouldTrackback, "post_update_client_side_animation", Result)
		end
	end
end

EventsExtended.__index.DrawModelExecute = function(self, DrawModelState, ModelRenderInfo, BoneToWorld)
	local RenderableEntity = nil
	pcall(function()
		local EntIndex = self:GetEntIndex(ModelRenderInfo.pRenderable, true)
		if EntIndex then
			RenderableEntity = entity.get(EntIndex)
		end
	end)

	local Context = setmetatable({
		prevent = false,
		entity = RenderableEntity,
		name = ffi.string(DrawModelState.m_pStudioHdr.name),
		raws = {
			matrix = BoneToWorld,
			draw_model_state = DrawModelState,
			model_render_info = ModelRenderInfo
		}
	}, {
		__call = function(this, Material)
			if self:Assert(type(Material) == "userdata" and Material:is_valid(), "draw_model_execute", "attempt draw a invalid material") then
				return
			end

			local MaterialsName = Material:get_name()
			local MaterialsGroupName = Material:get_texture_group_name()
			if not self.data.MaterialCached[MaterialsName] or self.data.MaterialCached[MaterialsName] == ffi.NULL then
				self.data.MaterialCached[MaterialsName] = self.CHelpers.FindMaterial(MaterialsName, MaterialsGroupName, true, "")
				return
			end

			self.CHelpers.ForcedMaterialOverride(self.data.MaterialCached[MaterialsName], 0, - 1)
		end,

		__index = {
			get_studio_bound_from_hitgroup = function(this, Hitgroup)
				if not this.entity or self:Assert(type(Hitgroup) == "number", "draw_model_execute", "attempt get studio bound from a invalid hitgroup index") then
					return
				end

				local StudioBound = self:GetBoundBox(this.entity, Hitgroup, this.raws.draw_model_state.m_pStudioHdr)
				if not StudioBound then
					return
				end

				return self:GetStudioBoundContexts(StudioBound)
			end,

			get_bone_index_from_hitgroup = function(this, Hitgroup)
				if not this.entity or self:Assert(type(Hitgroup) == "number", "draw_model_execute", "attempt get bone position from a invalid hitgroup index") then
					return
				end

				local Bound = self:GetBoundBox(this.entity, Hitgroup, this.raws.draw_model_state.m_pStudioHdr)
				return Bound.m_bone
			end,

			set_bone_position_from_hitgroup = function(this, Hitgroup, Position)
				if not this.entity or self:Assert(type(Position) == "userdata" and type(Position.x) == "number" and type(Position.y) == "number" and type(Position.z) == "number", "draw_model_execute", "attempt set a invalid hitgroup position") then
					return
				end

				local Bound = self:GetBoundBox(this.entity, Hitgroup, this.raws.draw_model_state.m_pStudioHdr)
				this.raws.matrix.arrays[Bound.m_bone].m_flMatVal[0][3] = Position.x
				this.raws.matrix.arrays[Bound.m_bone].m_flMatVal[1][3] = Position.y
				this.raws.matrix.arrays[Bound.m_bone].m_flMatVal[2][3] = Position.z
			end,

			get_bone_position_from_hitgroup = function(this, Hitgroup)
				if not this.entity or self:Assert(type(Hitgroup) == "number", "draw_model_execute", "attempt get a invalid hitgroup index") then
					return
				end

				local Bound = self:GetBoundBox(this.entity, Hitgroup, this.raws.draw_model_state.m_pStudioHdr)
				return vector(
					this.raws.matrix.arrays[Bound.m_bone].m_flMatVal[0][3],
					this.raws.matrix.arrays[Bound.m_bone].m_flMatVal[1][3],
					this.raws.matrix.arrays[Bound.m_bone].m_flMatVal[2][3]
				)
			end,

			draw = function(this, Material)
				if self:Assert(type(Material) == "userdata" and Material:is_valid(), "draw_model_execute", "attempt draw a invalid material") then
					return
				end

				local MaterialsName = Material:get_name()
				local MaterialsGroupName = Material:get_texture_group_name()
				if not self.data.MaterialCached[MaterialsName] or self.data.MaterialCached[MaterialsName] == ffi.NULL then
					self.data.MaterialCached[MaterialsName] = self.CHelpers.FindMaterial(MaterialsName, MaterialsGroupName, true, "")
					return
				end

				self.CHelpers.ForcedMaterialOverride(self.data.MaterialCached[MaterialsName], 0, - 1)
			end
		}
	})

	for _, CallBack in pairs(self.data.CallBackBuffer.List["draw_model_execute"]) do
		local Successfully, Result = pcall(CallBack, Context)
		self:Assert(Successfully or not self.data.ShouldTrackback, "draw_model_execute", Result)
		if type(Result) == "boolean" then
			Context.prevent = not Result
		end
	end

	return Context.prevent
end

EventsExtended.__index.HooksControllerTerminal = function(self)
	return {
		["StartDrawing"] = function()
			StartDrawingOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.StartDrawing, "void*(__thiscall*)(void*)", function(this)
				self:StartDrawing()
				return StartDrawingOriginalFn(this)
			end)

			table.insert(self.data.HookBuffers, StartDrawingOriginalFn)
		end,

		["FinishDrawing"] = function()
			FinishDrawingOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.FinishDrawing, "void*(__thiscall*)(void*)", function(this)
				self:FinishDrawing()
				return FinishDrawingOriginalFn(this)
			end)

			table.insert(self.data.HookBuffers, FinishDrawingOriginalFn)
		end,

		["StartRenderView"] = function()
			StartRenderViewOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VViewRender[0][4], "void*(__thiscall*)(void*)", function(this)
				self:StartRenderView()
				return StartRenderViewOriginalFn(this)
			end)

			table.insert(self.data.HookBuffers, StartRenderViewOriginalFn)
		end,

		["ResetCommand"] = function()
			ResetCommandOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VGameMovement[0][2], "void*(__thiscall*)(void*)", function(this)
				self:ResetCommand()
				return ResetCommandOriginalFn(this)
			end)

			table.insert(self.data.HookBuffers, ResetCommandOriginalFn)
		end,

		["PostRenderView"] = function()
			PostRenderViewOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VClientMode[0][31], "void*(__fastcall*)(void*, void*)", function(ecx, edx)
				self:PostRenderView()
				return PostRenderViewOriginalFn(ecx, edx)
			end)

			table.insert(self.data.HookBuffers, PostRenderViewOriginalFn)
		end,

		["PostEntityPacketReceived"] = function()
			PostEntityPacketReceivedOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VClientPrediction[0][5], "void*(__thiscall*)(void*)", function(this)
				self:PostEntityPacketReceived()
				return PostEntityPacketReceivedOriginalFn(this)
			end)

			table.insert(self.data.HookBuffers, PostEntityPacketReceivedOriginalFn)
		end,

		["Direct3DEndScene"] = function()
			Direct3DEndSceneOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VDirectDevice[0][42], "void*(__stdcall*)(void*)", function(IDirect3DDevice9)
				self:DirectEndScene(IDirect3DDevice9)
				return Direct3DEndSceneOriginalFn(IDirect3DDevice9)
			end)

			table.insert(self.data.HookBuffers, Direct3DEndSceneOriginalFn)
		end,

		["Direct3DBeginScene"] = function()
			Direct3DBeginSceneOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VDirectDevice[0][41], "void*(__stdcall*)(void*)", function(IDirect3DDevice9)
				self:DirectBeginScene(IDirect3DDevice9)
				return Direct3DBeginSceneOriginalFn(IDirect3DDevice9)
			end)

			table.insert(self.data.HookBuffers, Direct3DBeginSceneOriginalFn)
		end,

		["RenderView"] = function()
			RenderViewOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VViewRender[0][5], "void*(__thiscall*)(void*, void*)", function(this, RectanglePointer)
				self:RectangleRender(RectanglePointer)
				return RenderViewOriginalFn(this, RectanglePointer)
			end)

			table.insert(self.data.HookBuffers, RenderViewOriginalFn)
		end,

		["ParticlesSimulationEnd"] = function()
			ParticlesSimulationEndOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.ParticlesSimulationEnd, "void*(__fastcall*)(void*, void*)", function(ecx, edx)
				self:ParticlesSimulationEnd(ecx)
				return ParticlesSimulationEndOriginalFn(ecx, edx)
			end)

			table.insert(self.data.HookBuffers, ParticlesSimulationEndOriginalFn)
		end,

		["ParticlesSimulationStart"] = function()
			ParticlesSimulationStartOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.ParticlesSimulationStart, "void*(__fastcall*)(void*, void*)", function(ecx, edx)
				local Result = ParticlesSimulationStartOriginalFn(ecx, edx)
				self:ParticlesSimulationStart(Result)
				return Result
			end)

			table.insert(self.data.HookBuffers, ParticlesSimulationStartOriginalFn)
		end,

		["StartTrackPredictionErrors"] = function()
			StartTrackPredictionErrorsOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VGameMovement[0][3], "void*(__thiscall*)(void*, void*)", function(this, player)
				self:StartTrackPredictionErrors(player)
				return StartTrackPredictionErrorsOriginalFn(this, player)
			end)

			table.insert(self.data.HookBuffers, StartTrackPredictionErrorsOriginalFn)
		end,

		["FinishTrackPredictionErrors"] = function()
			FinishTrackPredictionErrorsOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VGameMovement[0][3], "void*(__thiscall*)(void*, void*)", function(this, player)
				self:FinishTrackPredictionErrors(player)
				return FinishTrackPredictionErrorsOriginalFn(this, player)
			end)

			table.insert(self.data.HookBuffers, FinishTrackPredictionErrorsOriginalFn)
		end,

		["PreRenderView"] = function()
			PreRenderViewOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VClientMode[0][30], "void*(__fastcall*)(void*, void*, CViewSetup*)", function(ecx, edx, ViewSetup)
				self:PreRenderView(ViewSetup)
				return PreRenderViewOriginalFn(ecx, edx, ViewSetup)
			end)

			table.insert(self.data.HookBuffers, PreRenderViewOriginalFn)
		end,

		["SetupMovementBounds"] = function()
			SetupMovementBoundsOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VGameMovement[0][12], "void*(__thiscall*)(void*, CMoveData*)", function(this, MoveData)
				self:SetupMovementBounds(MoveData)
				return SetupMovementBoundsOriginalFn(this, MoveData)
			end)

			table.insert(self.data.HookBuffers, SetupMovementBoundsOriginalFn)
		end,

		["OverrideMouse"] = function()
			OverrideMouseOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VClientMode[0][23], "void*(__fastcall*)(void*, void*, float*, float*)", function(ecx, edx, MouseX, MouseY)
				self:OverrideMouse(MouseX, MouseY)
				return OverrideMouseOriginalFn(ecx, edx, MouseX, MouseY)
			end)

			table.insert(self.data.HookBuffers, OverrideMouseOriginalFn)
		end,

		["PostNetworkDataReceived"] = function()
			PostNetworkDataReceivedOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VClientPrediction[0][6], "void*(__thiscall*)(void*, int)", function(this, CommandsAcknowledged)
				self:PostNetworkDataReceived(CommandsAcknowledged)
				return PostNetworkDataReceivedOriginalFn(this, CommandsAcknowledged)
			end)

			table.insert(self.data.HookBuffers, PostNetworkDataReceivedOriginalFn)
		end,

		["ProcessCommand"] = function()
			ProcessCommandOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VGameMovement[0][1], "void*(__thiscall*)(void*, void*, CMoveData*)", function(this, player, MoveData)
				self:ProcessCommand(player, MoveData)
				return ProcessCommandOriginalFn(this, player, MoveData)
			end)

			table.insert(self.data.HookBuffers, ProcessCommandOriginalFn)
		end,

		["Direct3DReset"] = function()
			Direct3DResetOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VDirectDevice[0][16], "void*(__stdcall*)(void*, void*)", function(IDirect3DDevice9, IDirect3DPresentParameter)
				self:DirectReset(IDirect3DDevice9, IDirect3DPresentParameter)
				return Direct3DResetOriginalFn(IDirect3DDevice9, IDirect3DPresentParameter)
			end)

			table.insert(self.data.HookBuffers, Direct3DResetOriginalFn)
		end,

		["FinishCommand"] = function()
			FinishCommandOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VClientPrediction[0][21], "void*(__thiscall*)(void*, void*, CUserCmd*, CMoveData*)", function(this, player, UserCmd, MoveData)
				self:FinishCommand(player, UserCmd, MoveData)
				return FinishCommandOriginalFn(this, player, UserCmd, MoveData)
			end)

			table.insert(self.data.HookBuffers, FinishCommandOriginalFn)
		end,

		["RunCommand"] = function()
			RunCommandOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VClientPrediction[0][19], "void*(__thiscall*)(void*, void*, CUserCmd*, CMoveHelper*)", function(this, player, UserCmd, MoveHelper)
				self:RunCommand(player, UserCmd, MoveHelper)
				return RunCommandOriginalFn(this, player, UserCmd, MoveHelper)
			end)

			table.insert(self.data.HookBuffers, RunCommandOriginalFn)
		end,

		["ViewRender"] = function()
			ViewRenderOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VViewRender[0][6], "void*(__thiscall*)(void*, CViewSetup*, CViewSetup*, int, int)", function(this, ViewSetup, ViewSetupHud, ClearFlags, WhatToDraw)
				self:ViewRender(ViewSetup, ViewSetupHud, ClearFlags, WhatToDraw)
				return ViewRenderOriginalFn(this, ViewSetup, ViewSetupHud, ClearFlags, WhatToDraw)
			end)

			table.insert(self.data.HookBuffers, ViewRenderOriginalFn)
		end,

		["AccumulatePose"] = function()
			AccumulatePoseOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.AccumulatePose, "void*(__thiscall*)(void*, void*, void*, int, float, float, float, void*)", function(this, Pose, Layers, Sequence, Cycle, Weight, Time, Context)
				self:AccumulatePose()
				return AccumulatePoseOriginalFn(this, Pose, Layers, Sequence, Cycle, Weight, Time, Context)
			end)

			table.insert(self.data.HookBuffers, AccumulatePoseOriginalFn)
		end,

		["SetupCommand"] = function()
			SetupCommandOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VClientPrediction[0][20], "void*(__thiscall*)(void*, void*, CUserCmd*, CMoveHelper*, CMoveData*)", function(this, player, UserCmd, MoveHelper, MoveData)
				self:SetupCommand(player, UserCmd, MoveHelper, MoveData)	
				return SetupCommandOriginalFn(this, player, UserCmd, MoveHelper, MoveData)
			end)

			table.insert(self.data.HookBuffers, SetupCommandOriginalFn)
		end,

		["PreEntityPacketReceived"] = function()
			PreEntityPacketReceivedOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VClientPrediction[0][4], "void*(__thiscall*)(void*, int, int, int)", function(this, CommandsAcknowledged, CurrentWorldUpdatePacket, ServerTicksElapsed)
				self:PreEntityPacketReceived(CommandsAcknowledged, CurrentWorldUpdatePacket, ServerTicksElapsed)
				return PreEntityPacketReceivedOriginalFn(this, CommandsAcknowledged, CurrentWorldUpdatePacket, ServerTicksElapsed)
			end)

			table.insert(self.data.HookBuffers, PreEntityPacketReceivedOriginalFn)
		end,

		["PredictionCommand"] = function()
			PredictionCommandOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VClientPrediction[0][3], "void*(__thiscall*)(void*, int, bool, int, int)", function(this, flStartFrame, bValidFrame, iInComingAcknowledged, iOutgoingCommand)
				self:PredictionCommand(flStartFrame, bValidFrame, iInComingAcknowledged, iOutgoingCommand)
				return PredictionCommandOriginalFn(this, flStartFrame, bValidFrame, iInComingAcknowledged, iOutgoingCommand)
			end)

			table.insert(self.data.HookBuffers, PredictionCommandOriginalFn)
		end,

		["Direct3DPresent"] = function()
			Direct3DPresentOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VDirectDevice[0][17], "void*(__stdcall*)(void*, void*, void*, unsigned long, void*)", function(IDirect3DDevice9, SourceRectangle, DestinationRectangle, hWnd, DirtyRegion)
				self:DirectPresent(IDirect3DDevice9, SourceRectangle, DestinationRectangle, hWnd, DirtyRegion)
				return Direct3DPresentOriginalFn(IDirect3DDevice9, SourceRectangle, DestinationRectangle, hWnd, DirtyRegion)
			end)

			table.insert(self.data.HookBuffers, Direct3DPresentOriginalFn)
		end,

		["Direct3DClear"] = function()
			Direct3DClearOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VDirectDevice[0][43], "void*(__stdcall*)(void*, unsigned long, void*, unsigned long, void*, float, unsigned long)", function(IDirect3DDevice9, Count, RectanglePointer, Flags, Color, Z, Stencil)
				self:DirectClear(IDirect3DDevice9, Count, RectanglePointer, Flags, Color, Z, Stencil)
				return Direct3DClearOriginalFn(IDirect3DDevice9, Count, RectanglePointer, Flags, Color, Z, Stencil)
			end)

			table.insert(self.data.HookBuffers, Direct3DClearOriginalFn)
		end,

		["OverrideView"] = function()
			OverrideViewOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VClientMode[0][18], "void*(__fastcall*)(void*, void*, CViewSetup*)", function(ecx, edx, ViewSetup)
				local Result = OverrideViewOriginalFn(ecx, edx, ViewSetup)
				self:OverrideView(ViewSetup)
				return Result
			end)

			table.insert(self.data.HookBuffers, OverrideViewOriginalFn)
		end,

		["SteamRetrieveMessage"] = function()
			SteamRetrieveMessageOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VSteamGameCoordinator[0][2], "int(__thiscall*)(void*, uint32_t*, void*, uint32_t, uint32_t*)", function(this, pMessageHeader, pDestination, nDestinationSize, pMessageSize)
				local Result = SteamRetrieveMessageOriginalFn(this, pMessageHeader, pDestination, nDestinationSize, pMessageSize)
				self:SteamRetrieveMessage(Result, pMessageHeader, pDestination, nDestinationSize, pMessageSize)
				return Result
			end)

			table.insert(self.data.HookBuffers, SteamRetrieveMessageOriginalFn)
		end,

		["InPrediction"] = function()
			InPredictionOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VClientPrediction[0][14], "bool(__thiscall*)(void*)", function(this)
				local OriginalFnResult = InPredictionOriginalFn(this)
				local Result = self:InPrediction(Result)
				if type(Result) == "boolean" then
					return Result
				end

				return OriginalFnResult
			end)

			table.insert(self.data.HookBuffers, InPredictionOriginalFn)
		end,

		["SteamSendMessage"] = function()
			SteamSendMessageOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VSteamGameCoordinator[0][0], "int(__thiscall*)(void*, uint32_t, const void*, uint32_t)", function(this, uMessageHeader, pData, uData)
				local Result = self:SteamSendMessage(uMessageHeader, pData, uData)
				if type(Result) == "number" then
					return Result
				end

				return SteamSendMessageOriginalFn(this, uMessageHeader, pData, uData)
			end)

			table.insert(self.data.HookBuffers, SteamSendMessageOriginalFn)
		end,

		["DispatchUserMessage"] = function()
			DispatchUserMessageOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VClient[0][38], "bool(__thiscall*)(void*, int, int, int, void*)", function(this, MessageType, Dest, Bytes, MessageData)
				local Result = self:DispatchUserMessage(MessageType, Dest, Bytes, MessageData)
				if type(Result) == "boolean" then
					return Result
				end

				return DispatchUserMessageOriginalFn(this, MessageType, Dest, Bytes, MessageData)
			end)

			table.insert(self.data.HookBuffers, DispatchUserMessageOriginalFn)
		end,

		["UpdateClientSideAnimation"] = function()
			UpdateClientSideAnimationOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.UpdateClientSideAnimation, "void*(__fastcall*)(void*, void*)", function(ecx, edx)
				self:PreUpdateClientSideAnimation(ecx)
				local Result = UpdateClientSideAnimationOriginalFn(ecx, edx)
				self:PostUpdateClientSideAnimation(ecx)
				return Result
			end)

			table.insert(self.data.HookBuffers, UpdateClientSideAnimationOriginalFn)
		end,

		["DrawModelExecute"] = function()
			DrawModelExecuteOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VEngineModel[0][21], "void*(__thiscall*)(void*, void*, const DrawModelState&, const ModelRenderInfo&, Matrix3x4Arrays*)", function(this, MatRenderContext, DrawModelState, ModelRenderInfo, BoneToWorld)
				local Result = self:DrawModelExecute(DrawModelState, ModelRenderInfo, BoneToWorld)
				if type(Result) == "boolean" and Result then
					return
				end

				return DrawModelExecuteOriginalFn(this, MatRenderContext, DrawModelState, ModelRenderInfo, BoneToWorld)
			end)

			table.insert(self.data.HookBuffers, DrawModelExecuteOriginalFn)
		end,

		["PaintTraverse"] = function(Shared)
			PaintTraverseOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VGuiPanel[0][41], "void*(__thiscall*)(void*, unsigned long, bool, bool)", function(this, iPanel, bForceRePaint, bAllowedForce)
				self:PaintTraverse(this, iPanel)
				return PaintTraverseOriginalFn(this, iPanel, bForceRePaint, bAllowedForce)
			end)

			table.insert(self.data.HookBuffers, PaintTraverseOriginalFn)
			if Shared then
				events["render"]:set(function()
					self:PaintTraverse("RenderPanel")
				end)
			end
		end,

		["Paint"] = function()
			local PaintRenderPanel = function()
				self:Paint()
			end

			PaintOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.VGuiPanel[0][15], "void*(__thiscall*)(void*, int)", function(this, iPaintMode)
				self:Paint()
				return PaintOriginalFn(this, iPaintMode)
			end)

			events["render"]:set(PaintRenderPanel)
			table.insert(self.data.HookBuffers, PaintOriginalFn)
		end,

		["SetupBones"] = function()
			events["createmove"]:set(function(e)
				local local_player = entity.get_local_player()
				local Renderable = ffi.cast("void***", ffi.cast("uintptr_t", local_player[0]) + 0x4)
				if not SetupBoneOriginalFn and Renderable ~= ffi.NULL then
					SetupBoneOriginalFn = self.data.EasyHook.TrampolineHook(Renderable[0][13], "bool(__thiscall*)(void*, Matrix3x4Arrays*, int, int, float)", function(this, BoneMatrix, MaxBones, Mask, Timer)
						self:SetupBones(this, BoneMatrix, MaxBones, Mask, Timer)
						return SetupBoneOriginalFn(this, BoneMatrix, MaxBones, Mask, Timer)
					end)

					table.insert(self.data.HookBuffers, SetupBoneOriginalFn)
				end
			end)
		end,

		["PreDataUpdate"] = function()
			events["createmove"]:set(function(e)
				local local_player = entity.get_local_player()
				local NetWorkable = ffi.cast("void***", ffi.cast("uintptr_t", local_player[0]) + 0x8)
				if not PreDataUpdateOriginalFn and NetWorkable ~= ffi.NULL then
					PreDataUpdateOriginalFn = self.data.EasyHook.TrampolineHook(NetWorkable[0][6], "void*(__thiscall*)(void*, int)", function(this, iType)
						self:PreDataUpdate(this, iType)
						return PreDataUpdateOriginalFn(this, iType)
					end)

					table.insert(self.data.HookBuffers, PreDataUpdateOriginalFn)
				end
			end)
		end,

		["PreDataChange"] = function()
			events["createmove"]:set(function(e)
				local local_player = entity.get_local_player()
				local NetWorkable = ffi.cast("void***", ffi.cast("uintptr_t", local_player[0]) + 0x8)
				if not PreDataChangeOriginalFn and NetWorkable ~= ffi.NULL then
					PreDataChangeOriginalFn = self.data.EasyHook.TrampolineHook(NetWorkable[0][4], "void*(__thiscall*)(void*, int)", function(this, iType)
						self:PreDataChange(this, iType)
						return PreDataChangeOriginalFn(this, iType)
					end)

					table.insert(self.data.HookBuffers, PreDataChangeOriginalFn)
				end
			end)
		end,

		["PostDataUpdate"] = function()
			events["createmove"]:set(function(e)
				local local_player = entity.get_local_player()
				local NetWorkable = ffi.cast("void***", ffi.cast("uintptr_t", local_player[0]) + 0x8)
				if not PostDataUpdateOriginalFn and NetWorkable ~= ffi.NULL then
					PostDataUpdateOriginalFn = self.data.EasyHook.TrampolineHook(NetWorkable[0][7], "void*(__thiscall*)(void*, int)", function(this, iType)
						self:PostDataUpdate(this, iType)
						return PostDataUpdateOriginalFn(this, iType)
					end)

					table.insert(self.data.HookBuffers, PostDataUpdateOriginalFn)
				end
			end)
		end,

		["PostDataChange"] = function()
			events["createmove"]:set(function(e)
				local local_player = entity.get_local_player()
				local NetWorkable = ffi.cast("void***", ffi.cast("uintptr_t", local_player[0]) + 0x8)
				if not PostDataChangeOriginalFn and NetWorkable ~= ffi.NULL then
					PostDataChangeOriginalFn = self.data.EasyHook.TrampolineHook(NetWorkable[0][5], "void*(__thiscall*)(void*, int)", function(this, iType)
						self:PostDataChange(this, iType)
						return PostDataChangeOriginalFn(this, iType)
					end)

					table.insert(self.data.HookBuffers, PostDataChangeOriginalFn)
				end
			end)
		end,

		["StudioFrameAdvance"] = function()
			events["createmove"]:set(function(e)
				local local_player = entity.get_local_player()
				local ClientEntity = ffi.cast("void***", local_player[0])
				if not StudioFrameAdvanceOriginalFn and ClientEntity ~= ffi.NULL then
					StudioFrameAdvanceOriginalFn = self.data.EasyHook.TrampolineHook(ClientEntity[0][220], "void*(__thiscall*)(void*)", function(this)
						self:StudioFrameAdvance(this)
						return StudioFrameAdvanceOriginalFn(this)
					end)

					table.insert(self.data.HookBuffers, StudioFrameAdvanceOriginalFn)
				end
			end)
		end,

		["ReceiveMessage"] = function()
			events["createmove"]:set(function(e)
				local local_player = entity.get_local_player()
				local NetWorkable = ffi.cast("void***", ffi.cast("uintptr_t", local_player[0]) + 0x8)
				if not ReceiveMessageOriginalFn and NetWorkable ~= ffi.NULL then
					ReceiveMessageOriginalFn = self.data.EasyHook.TrampolineHook(NetWorkable[0][11], "void*(__thiscall*)(void*, int, void*)", function(this, ClassIndex, Buffer)
						self:ReceiveMessage(this, ClassIndex, Buffer)
						return ReceiveMessageOriginalFn(this, ClassIndex, Buffer)
					end)

					table.insert(self.data.HookBuffers, ReceiveMessageOriginalFn)
				end
			end)
		end,

		["WindowProcedure"] = function()
			local CurrentWindow = self.CHelpers.User32Library.FindWindowA("Valve001", nil)
			local WndProcNewHandle = ffi.cast("long(__stdcall*)(uintptr_t, unsigned int, unsigned long, long)", function(hWnd, Message, Wparam, Lparam)
				local Result = self:WindowProcedure(Message, Wparam, Lparam)
				if type(Result) == "number" then
					return Result
				end

				return self.CHelpers.User32Library.CallWindowProcA(self.data.WndProcOriginal, hWnd, Message, Wparam, Lparam)
			end)

			self.data.OldWndProcWindow = CurrentWindow
			self.data.WndProcOriginal = self.CHelpers.User32Library.SetWindowLongA(CurrentWindow, - 4, ffi.cast("unsigned long", WndProcNewHandle))
		end,

		["ClientSideAnimationChanged"] = function()
			events["createmove"]:set(function(e)
				local local_player = entity.get_local_player()
				local ClientEntity = ffi.cast("void***", local_player[0])
				if not ClientSideAnimationChangedOriginalFn and ClientEntity ~= ffi.NULL then
					ClientSideAnimationChangedOriginalFn = self.data.EasyHook.TrampolineHook(ClientEntity[0][225], "void*(__thiscall*)(void*)", function(this)
						self:PreClientSideAnimationChanged()
						local Result = ClientSideAnimationChangedOriginalFn(this)
						self:PostClientSideAnimationChanged()
						return Result
					end)

					table.insert(self.data.HookBuffers, ClientSideAnimationChangedOriginalFn)
				end
			end)
		end,

		["OutPut"] = function()
			PrintOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.Print, "void*(__thiscall*)(void*, const char*)", function(this, cText)
				local Result = self:OutPutLog(cText)
				if type(Result.prevent) == "boolean" and Result.prevent then
					return
				end

				return PrintOriginalFn(this, tostring(Result.message))
			end)

			ColorPrintOriginalFn = self.data.EasyHook.TrampolineHook(self.CHelpers.ColorPrint, "void*(__thiscall*)(void*, ColorInfo*, const char*)", function(this, Color, cText)
				local Result = self:OutPutLog(cText, Color)
				if type(Result.prevent) == "boolean" and Result.prevent then
					return
				end

				local ColorInfo = ffi.new("ColorInfo")
				for _, data in pairs({"r", "g", "b", "a"}) do
					ColorInfo[data] = math.clamp(Result.color[data], 0, 255)
				end

				return ColorPrintOriginalFn(this, ColorInfo, tostring(Result.message))
			end)

			table.insert(self.data.HookBuffers, PrintOriginalFn)
			table.insert(self.data.HookBuffers, ColorPrintOriginalFn)
		end,

		["SendDatagram"] = function()
			events["render"]:set(function(e)
				if globals.is_connected then
					local INetChannel = self.CHelpers.GetNetChannel()
					if not SendDatagramOriginalFn then
						SendDatagramOriginalFn = self.data.EasyHook.TrampolineHook(INetChannel[0][46], "int(__thiscall*)(void*, void*)", function(this, Datagram)
							self:PreSendDatagram(Datagram)
							local Result = SendDatagramOriginalFn(this, Datagram)
							self:PostSendDatagram(Datagram, Result)
							return Result
						end)

						table.insert(self.data.HookBuffers, SendDatagramOriginalFn)
					end

				elseif not globals.is_connected and SendDatagramOriginalFn then
					SendDatagramOriginalFn:UnHook()
					for Index, Buffer in pairs(self.data.HookBuffers) do
						if Buffer == SendDatagramOriginalFn then
							table.remove(self.data.HookBuffers, Index)
							break
						end
					end

					SendDatagramOriginalFn = nil
				end
			end)
		end,

		["SendNetMessage"] = function()
			events["render"]:set(function(e)
				if globals.is_connected then
					local INetChannel = self.CHelpers.GetNetChannel()
					if not SendNetMessageOriginalFn then
						SendNetMessageOriginalFn = self.data.EasyHook.TrampolineHook(INetChannel[0][40], "bool(__thiscall*)(void*, void*, bool, bool)", function(this, INetMessage, bForceReliable, bVoice)
							local Result = self:SendNetMessage(INetMessage, bForceReliable, bVoice)
							if type(Result) == "boolean" then
								return Result
							elseif type(Result) == "table" then
								if type(Result.voice) == "boolean" then
									bVoice = Result.voice
								end

								if type(Result.force_reliable) == "boolean" then
									bForceReliable = Result.force_reliable
								end
							end

							return SendNetMessageOriginalFn(this, INetMessage, bForceReliable, bVoice)
						end)

						table.insert(self.data.HookBuffers, SendNetMessageOriginalFn)
					end

				elseif not globals.is_connected and SendDatagramOriginalFn then
					SendNetMessageOriginalFn:UnHook()
					for Index, Buffer in pairs(self.data.HookBuffers) do
						if Buffer == SendNetMessageOriginalFn then
							table.remove(self.data.HookBuffers, Index)
							break
						end
					end

					SendNetMessageOriginalFn = nil
				end
			end)
		end
	}
end

EventsExtended.__index.PushCallBackController = function(self)
	local HookedControllerTerminal = self:HooksControllerTerminal()
	return setmetatable(self.data.CallBackBuffer, {
		__index = function(this, key)
			if key == "debug" then
				return function(state)
					if type(state) ~= "boolean" then
						__DEBUG = not __DEBUG
						self.data.ShouldTrackback = not self.data.ShouldTrackback
						return
					end

					__DEBUG = state
					self.data.ShouldTrackback = state
				end

			elseif not self:Contains(self.data.ExtendedEvents, key) then
				return events[key]
			end

			local HookEventListener = ({
				["paint"] = "Paint",
				["paint_ui"] = "Paint",
				["output"] = "OutPut",
				["renderer"] = "PaintTraverse",
				["view_render"] = "ViewRender",
				["render_view"] = "RenderView",
				["setup_bones"] = "SetupBones",
				["in_prediction"] = "InPrediction",
				["start_drawing"] = "StartDrawing",
				["paint_traverse"] = "PaintTraverse",
				["direct3d_clear"] = "Direct3DClear",
				["direct3d_reset"] = "Direct3DReset",
				["finish_drawing"] = "FinishDrawing",
				["run_command"] = "RunCommand",
				["pre_render_3d"] = "PreRenderView",
				["paint_traverse_ui"] = "PaintTraverse",
				["override_mouse"] = "OverrideMouse",
				["reset_command"] = "ResetCommand",
				["pre_data_update"] = "PreDataUpdate",
				["post_override_view"] = "OverrideView",
				["finish_command"] = "FinishCommand",
				["direct3d_present"] = "Direct3DPresent",
				["pre_data_change"] = "PreDataChange",
				["setup_command"] = "SetupCommand",
				["accumulate_pose"] = "AccumulatePose",
				["start_render_view"] = "StartRenderView",
				["post_data_update"] = "PostDataUpdate",
				["pre_send_datagram"] = "SendDatagram",
				["post_data_change"] = "PostDataChange",
				["post_send_datagram"] = "SendDatagram",
				["send_net_message"] = "SendNetMessage",
				["process_command"] = "ProcessCommand",
				["direct3d_end_scene"] ="Direct3DEndScene",
				["window_procedure"] = "WindowProcedure",
				["get_user_cmd"] = self.CHelpers.GetUserCmd,
				["predict_command"] = "PredictionCommand",
				["receive_entity_message"] = "ReceiveMessage",
				["draw_model_execute"] = "DrawModelExecute",
				["steam_send_message"] = "SteamSendMessage",
				["direct3d_begin_scene"] = "Direct3DBeginScene",
				["studio_frame_advance"] = "StudioFrameAdvance",
				["particle_simulate_end"] = "ParticlesSimulationEnd",
				["dispatch_user_message"] = "DispatchUserMessage",
				["particle_simulate_start"] = "ParticlesSimulationStart",
				["steam_retrieve_message"] = "SteamRetrieveMessage",
				["setup_movement_bounds"] = "SetupMovementBounds",
				["pre_entity_packet_received"] = "PreEntityPacketReceived",
				["post_entity_packet_received"] = "PostEntityPacketReceived",
				["move_command"] = {"SetupCommand", "FinishCommand"},
				["start_track_prediction_errors"] = "StartTrackPredictionErrors",
				["post_network_data_received"] = "PostNetworkDataReceived",
				["finish_track_prediction_errors"] = "FinishTrackPredictionErrors",
				["pre_update_client_side_animation"] = "UpdateClientSideAnimation",
				["post_update_client_side_animation"] = "UpdateClientSideAnimation",
				["pre_changed_client_side_animation"] = "ClientSideAnimationChanged",
				["post_changed_client_side_animation"] = "ClientSideAnimationChanged"
			})[key]

			if type(HookEventListener) == "function" then
				return HookEventListener
			end

			if not this.Status[key] then
				this.List[key] = {}
				this.Status[key] = true
				local HookedType = type(HookEventListener)
				local CurrentTimer = common.get_timestamp() / 1000
				local TimeDifferent = math.abs(CurrentTimer - self.data.ShutDownTimer)
				if HookedType == "string" and not self.data.HookedListenerTerminal[HookEventListener] then
					if TimeDifferent >= 0.5 then
						pcall(HookedControllerTerminal[HookEventListener], key == "renderer")
					elseif TimeDifferent < 0.5 then
						utils.execute_after(0.5 - TimeDifferent, HookedControllerTerminal[HookEventListener], key == "renderer")
					end

					self.data.HookedListenerTerminal[HookEventListener] = true
				elseif HookedType == "table" then
					for Key, HookController in pairs(HookEventListener) do
						if TimeDifferent >= 0.5 then
							pcall(HookedControllerTerminal[HookController], Key == "renderer")
						elseif TimeDifferent < 0.5 then
							utils.execute_after(0.5 - TimeDifferent, HookedControllerTerminal[HookController], Key == "renderer")
						end

						self.data.HookedListenerTerminal[Key] = true
					end
				end
			end

			return setmetatable(this.List[key], {
				__index = {
					call = function(this, callback)
						events[key]:call(callback)
					end,

					set = function(this, callback)
						if self:Assert(type(callback) == "function", key, "attempt to set not a function callback") then
							return
						end

						if not self:Contains(this, callback) then
							table.insert(this, callback)
						end
					end,

					unset = function(this, callback)
						if self:Assert(type(callback) == "function", key, "attempt to unset not a function callback") then
							return
						end

						if self:Contains(this, callback) then
							for index, data in pairs(this) do
								if data == callback then
									table.remove(this, index)
								end
							end
						end
					end
				},

				__call = function(this, callback, state)
					if self:Assert(type(callback) == "function", key, "attempt to operate not a function callback") then
						return
					end

					if type(state) == "boolean" then
						if state and not self:Contains(this, callback) then
							table.insert(this, callback)
						elseif not state and self:Contains(this, callback) then
							for index, data in pairs(this) do
								if data == callback then
									table.remove(this, index)
								end
							end
						end

					elseif not self:Contains(this, callback) then
						table.insert(this, callback)
					elseif self:Contains(this, callback) then
						for index, data in pairs(this) do
							if data == callback then
								table.remove(this, index)
							end
						end
					end
				end
			})
		end
	})
end

EventsExtended.__index.CreateMove = function(self, e)
	local CurrentTimer = common.get_timestamp() / 1000
	self.data.CommandShared = {
		move_yaw = e.move_yaw,
		block_movement = e.block_movement,
		choked_commands = e.choked_commands
	}

	if self.data.UserCmdShared and math.abs(CurrentTimer - self.data.LastCommandTimer) < 0.25 then
		for _, Data in pairs({
			"no_choke",
			"move_yaw",
			"jitter_move",
			"send_packet",
			"force_defensive",
			"block_movement",
			"animate_move_lean"
		}) do
			local Expected = type(e[Data])
			local Received = type(self.data.UserCmdShared[Data])
			if not self:Assert(Received == Expected, "*.command", ('attempt to write: "%s" to a invalid value, received: %s, expected: %s'):format(Data, Received, Expected)) and e[Data] ~= self.data.UserCmdShared[Data] then
				e[Data] = self.data.UserCmdShared[Data]
			end
		end
	end
end

EventsExtended.__index.ShutDown = function(self)
	db["Extended Events Timer"] = (common.get_timestamp() / 1000)
	if self.data.OldWndProcWindow and self.data.WndProcOriginal then
		self.CHelpers.User32Library.SetWindowLongA(self.data.OldWndProcWindow, - 4, self.data.WndProcOriginal)
	end

	for _, Buffer in pairs(self.data.HookBuffers) do
		Buffer:UnHook()
	end
end

EventsExtended.__index.CallBacks = function(self)
	return {
		["shutdown"] = function(e)
			self:ShutDown(e)
		end,

		["createmove"] = function(e)
			self:CreateMove(e)
		end
	}
end

EventsExtended.__index.Work = function(self)
	self:Initiative()
	self:CreateCHelpers()
	for Name, Handler in pairs(self:CallBacks()) do
		self:RegisteredCallBack(Name, Handler)
	end

	return self:PushCallBackController()
end

return EventsExtended:Work()