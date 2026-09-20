if not pcall(ffi.sizeof, "BaseAnimatingStateInfo") then
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

		typedef struct{
			int nameIndex;
			int numHitboxes;
			int hitboxIndex;
		} StudioHitboxSet;

		int VirtualFree(
			void* lpAddress,
			unsigned long dwSize,
			unsigned long dwFreeType
		);

		typedef struct {
			int sznameindex;
			int numhitboxes;
			int hitboxindex;
		} StudioHitboxesSet;

		typedef struct {
			char pad[0x117D0];
			float pitch;
			float yaw;
			float roll;
		} ViewAngles;

		void* VirtualAlloc(
			void* lpAddress,
			unsigned long dwSize,
			unsigned long flAllocationType,
			unsigned long flProtect
		);

		int VirtualProtect(
			void* lpAddress,
			unsigned long dwSize,
			unsigned long flNewProtect,
			unsigned long* lpflOldProtect
		);

		typedef struct {
			unsigned memory;
			char pad[8];
			unsigned int count;
			unsigned pelements;
		} CUtlVectorSimple;

		typedef struct {
			const char* szPlayerModelSearchSubStr;
			const char* szSkintoneIndex;
			const char* szAssociatedGloveModel;
			const char* szAssociatedSleeveModel;
			const char* szAssociatedSleeveModelEconOverride;
		} ArmsConfigs;

		typedef struct {
			void(__thiscall* CustomRunCallBackBase)(struct SteamAPICallBackBase*, void*, bool, uint64_t);
			void(__thiscall* DefaultRunCallBackBase)(struct SteamAPICallBackBase*, void*);
			int(__thiscall* GetCallBackBase)(struct SteamAPICallBackBase*);
		} SteamAPICallBackBaseVirtualTable;

		typedef struct {
			SteamAPICallBackBaseVirtualTable *CallBackVirtualTable;
			uint8_t CallBackFlags;
			int CallBackIndex;
			uint64_t CallBackHandle;
			SteamAPICallBackBaseVirtualTable CallBackVirtualTableStorage[1];
		} SteamAPICallBackBase;

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
			char pad_0x0000[0x18];
			uint32_t sequence;
			float prev_cycle;
			float weight;
			float weight_delta_rate;
			float playback_rate;
			float cycle;
			void *entity;
			char pad_0x0038[0x4];
		} AnimLayerInfo;

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
			char pad_0x00D0[0x7C];
		} CViewSetup;

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
		} StudioHandlersInfo;

		typedef struct {
			StudioHandlersInfo* studio_hdr;
			void* hardware_data;
			int32_t decals;
			int32_t skin;
			int32_t body;
			int32_t hitbox_set;
			void*** renderable;
		} DrawModelInfo;

		typedef struct {
			char pad[3];
			char m_bForceWeaponUpdate;
			char pad1[91];
			void* m_pBaseEntity;
 			void* m_pActiveWeapon;
			void* m_pLastActiveWeapon;
			float m_flLastClientSideAnimationUpdateTime;
			int m_iLastClientSideAnimationUpdateFramecount;
			float m_flAnimUpdateDelta;
			float m_flEyeYaw;
			float m_flPitch;
			float m_flGoalFeetYaw;
			float m_flCurrentFeetYaw;
			float m_flCurrentTorsoYaw;
			float m_flUnknownVelocityLean;
			float m_flLeanAmount;
			char pad2[4];
			float m_flFeetCycle;
			float m_flFeetYawRate;
			char pad3[4];
			float m_flDuckAmount;
			float m_fLandingDuckAdditiveSomething;
			char pad4[4];
			float m_vOriginX;
			float m_vOriginY;
			float m_vOriginZ;
			float m_vLastOriginX;
			float m_vLastOriginY;
			float m_vLastOriginZ;
			float m_vVelocityX;
			float m_vVelocityY;
			char pad5[4];
			float m_flUnknownFloat1;
			char pad6[8];
			float m_flUnknownFloat2;
			float m_flUnknownFloat3;
			float m_flUnknown;
			float m_flSpeed2D;
			float m_flUpVelocity;
			float m_flSpeedNormalized;
			float m_flFeetSpeedForwardsOrSideWays;
			float m_flFeetSpeedUnknownForwardOrSideways;
			float m_flTimeSinceStartedMoving;
			float m_flTimeSinceStoppedMoving;
			bool m_bOnGround;
			bool m_bInHitGroundAnimation;
			float m_flTimeSinceInAir;
			float m_flLastOriginZ;
			float m_flHeadHeightOrOffsetFromHittingGroundAnimation;
			float m_flStopToFullRunningFraction;
			char pad7[4];
			float m_flMagicFraction;
			char pad8[60];
			float m_flWorldForce;
			char pad9[458];
			float m_flMinYaw;
			float m_flMaxYaw;
		} AnimatingStateInfo;

		typedef struct {
			char pad_0x0000[0x18];
			float anim_update_timer;
			char pad_0x001C[0xC];
			float started_moving_time;
			float last_move_time;
			char pad_0x0030[0x10];
			float last_lby_time;
			char pad_0x0044[0x8];
			float run_amount;
			char pad_0x0050[0x10];
			void *entity;
			__int32 active_weapon;
			__int32 last_active_weapon;
			float last_client_side_animation_update_time;
			__int32 last_client_side_animation_update_framecount;
			float eye_timer;
			float eye_angles_y;
			float eye_angles_x;
			float goal_feet_yaw;
			float current_feet_yaw;
			float torso_yaw;
			float last_move_yaw;
			float lean_amount;
			char pad_0x0094[0x4];
			float feet_cycle;
			float feet_yaw_rate;
			char pad_0x00A0[0x4];
			float duck_amount;
			float landing_duck_amount;
			char pad_0x00AC[0x4];
			float current_origin[3];
			float last_origin[3];
			float velocity_x;
			float velocity_y;
			char pad_0x00D0[0x10];
			float move_direction_1;
			float move_direction_2;
			char pad_0x00E8[0x4];
			float m_velocity;
			float jump_fall_velocity;
			float clamped_velocity;
			float feet_speed_forwards_or_sideways;
			float feet_speed_unknown_forwards_or_sideways;
			float last_time_started_moving;
			float last_time_stopped_moving;
			bool on_ground;
			bool hit_in_ground_animation;
			char pad_0x0110[0x8];
			float last_origin_z;
			float head_from_ground_distance_standing;
			float stop_to_full_running_fraction;
			char pad_0x0120[0x14];
			__int32 is_not_moving;
			char pad_0x0138[0x20];
			float last_anim_update_time;
			float moving_direction_x;
			float moving_direction_y;
			float moving_direction_z;
			char pad_0x0168[0x44];
			__int32 started_moving;
			char pad_0x01B0[0x8];
			float lean_yaw;
			char pad_0x01BC[0x8];
			float poses_speed;
			char pad_0x01C8[0x8];
			float ladder_speed;
			char pad_0x01D4[0x8];
			float ladder_yaw;
			char pad_0x01E0[0x8];
			float some_pose;
			char pad_0x01EC[0x14];
			float body_yaw;
			char pad_0x0204[0x8];
			float body_pitch;
			char pad_0x0210[0x8];
			float death_yaw;
			char pad_0x021C[0x8];
			float stand;
			char pad_0x0228[0x8];
			float jump_fall;
			char pad_0x0234[0x8];
			float aim_blend_stand_idle;
			char pad_0x0240[0x8];
			float aim_blend_crouch_idle;
			char pad_0x024C[0x8];
			float strafe_yaw;
			char pad_0x0258[0x8];
			float aim_blend_stand_walk;
			char pad_0x0264[0x8];
			float aim_blend_stand_run;
			char pad_0x0270[0x8];
			float aim_blend_crouch_walk;
			char pad_0x027C[0x8];
			float move_blend_walk;
			char pad_0x0288[0x8];
			float move_blend_run;
			char pad_0x0294[0x8];
			float move_blend_crouch;
			char pad_0x02A0[0x4];
			float speed;
			__int32 moving_in_any_direction;
			float acceleration;
			char pad_0x02B0[0x74];
			float crouch_height;
			__int32 is_full_crouched;
			char pad_0x032C[0x4];
			float velocity_subtract_x;
			float velocity_subtract_y;
			float velocity_subtract_z;
			float standing_head_height;
			char pad_0x0340[0x4];
		} BaseAnimatingStateInfo;
	]])
end

local data = {
	Poses = {},
	Speed = 0,
	Layers = {},
	Hooks = {},
	Hooker = nil,
	PlayerData = {},
	CallBackList = {},
	EyeAnglesY = nil,
	Successed = true,
	SetPoseState = {},
	DuckAmount = 0,
	SetLayerState = {},
	InverterState = nil,
	SetPoseCached = {},
	MaterialCached = {},
	SetLayerCached = {},
	SetOriginalState = {},
	Author = "SYR1337",
	CachedBodyYaw = {},
	SrvGoalFeetYaw = nil,
	PlayerRenderable = {},
	SetBodyYawState = {},
	SetOriginalCached = {},
	SetViewAnglesState = {},
	SetBodyYawCached = {},
	WeaponWorldEntity = {},
	PlayerModelHooked = {},
	SetPlayerModelReset = {},
	SetViewAnglesCached = {},
	SetArmsModelCached = {},
	SetArmsModelOriginal = {},
	ForceUpdateInvoke = false,
	RequestGetRenderable = {},
	SetPlayerModelCached = {},
	SetHitboxesPositionState = {},
	DrawPlayerModelCached = {},
	SetWeaponModelCached = {},
	EntityMatrixArraysCached = {},
	CachedApiCallBackResults = {},
	CachedRegisteredCallBack = {},
	ProcessedModelUpdate = false,
	StopToFullRunningFraction = 0,
	SetHitboxesPositionCached = {},
	CachedApiCallBackHandlers = {},
	HookedWeaponModelCached = {},
	LibraryName = "Animating Library",
	SetWeaponWorldModelCached = {},
	SetWeaponWorldModelVHelpers = {},
	Matrix3X4Cached = ffi.typeof("float*"),
	ProcessedStudioFrameAdvance = false,
	UnsignedIntPointer = ffi.typeof("uintptr_t"),
	GameDirectory = common.get_game_directory(),
	CallBackBaseSize = ffi.sizeof("SteamAPICallBackBase"),
	StudioHitboxSetCached = ffi.typeof("StudioHitboxSet*"),
	StudioBoundBoxCached = ffi.typeof("StudioBoundBox*"),
	SteamCallBackBaseCached = ffi.typeof("SteamAPICallBackBase"),
	SteamCallBackBasePointerCached = ffi.typeof("SteamAPICallBackBase*"),
	SteamCallBackBaseArrayCached = ffi.typeof("SteamAPICallBackBase[1]"),
	NeverloseCached = {
		Found = {},
		Signature = nil,
		SignatureCount = {}
	},

	ClientSideAnimationHooks = {
		["OverrideView"] = nil,
		["ModelUpdate"] = nil,
		["StudioFrameAdvance"] = nil
	},

	CallBackHookerList = {
		["PreSetModel"] = {},
		["PostSetModel"] = {},
		["PreDrawModel"] = {},
		["PostDrawModel"] = {},
		["PreOverrideView"] = {},
		["PreModelUpdate"] = {},
		["PostOverrideView"] = {},
		["PostModelUpdate"] = {},
		["PreStudioFrameAdvance"] = {},
		["PostStudioFrameAdvance"] = {},
		["PreClientSideAnimationUpdate"] = {},
		["PostClientSideAnimationUpdate"] = {}
	},

	AnimationLayerIndex = {
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

	AnimationPoseIndex = {
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

	AnimationData = {
		AbsYaw = 0,
		FeetYaw = 0,
		DesyncDelta = 0,
		DesyncExact = 0,
		ServerFeetYaw = 0,
		AbsVelocity = ffi.new("float[3]"),
		BalanceAdjust = {
			NextUpdate = 0,
			Updating = false
		},

		Tickbase = { 
			Shifting = 0,
			List = (function()
				local index, max = {}, 16
				for i = 1, max do
					index[#index + 1] = 0
					if i == max then
						return index
					end
				end
			end)()
		}
	}
}

data.__index = setmetatable(data, {})
data.__index.ErrorLog = function(self, ...)
	print_raw(("\aFFC0CB[%s]\aFF0000%s"):format(self.LibraryName, ...))
end

data.__index.TimeToTicks = function(self, ticks)
	return ticks / globals.tickinterval
end

data.__index.AngleModifier = function(self, angle)
	return (360 / 65536) * bit.band(math.floor(angle * (65536 / 360)), 65535)
end

data.__index.RandomizedCode = function(self, min, max)
	return ("%02x%02x%02x%02x"):format(math.random(min - 20, max + 20), math.random(min + 40, max - 40), math.random(min - 60, max + 60), math.random(min + 80, max - 80))
end

data.__index.DegToRad = function(self, Deg)
	return Deg * (math.pi / 180)
end

data.__index.RadToDeg = function(self, Rad)
	return Rad * (180 / math.pi)
end

data.__indexGetCallBackBaseSize = function(self, this)
	return self.CallBackBaseSize
end

data.__index.PointerToUnsignedIntPointerAddress = function(self, pointer)
	return tostring(tonumber(ffi.cast(self.UnsignedIntPointer, pointer)))
end

data.__index.DefaultCallBackBaseRunCommon = function(self, this, parameter)
	self:CallBackBaseRunCommon(this, parameter, false)
end

data.__index.VectorLength = function(self, VectorStart, VectorEnd)
	return VectorStart.x * VectorEnd.x + VectorStart.y * VectorEnd.y + VectorStart.z * VectorEnd.z
end

data.__index.BindArg = function(self, fn, arg)
	return function(...)
		return fn(arg, ...)
	end
end

data.__index.GetVtableFunc = function(self, instance, index, type)
	local addr = ffi.cast("void***", instance)
	return self:BindArg(ffi.cast(ffi.typeof(type), addr[0][index]), addr)
end

data.__index.CustomCallBackBaseRunCommon = function(self, this, parameter, input_error, instance_handler)
	if instance_handler == this.CallBackHandle then
		self:CallBackBaseRunCommon(this, parameter, input_error)
	end
end

data.__index.IsValidObject = function(self, object)
	if type(object) ~= "table" or type(object.type) ~= "string" then
		return false
	end

	local this_meta = getmetatable(object)
	return tostring(object.type) == "Animating" and type(this_meta) == "table" and type(this_meta.__index) == "table" and tostring(this_meta.__index.Type) == "Animating Pose"
end

data.__index.Contains = function(self, tab, var)
	for _, data in pairs(tab) do
		if data == var then
			return true
		end
	end

	return false
end

data.__index.PoseIndexCode = function(self, pose_code)
	for pose_name, code in pairs(self.Poses) do
		if code == pose_code then
			return self.AnimationPoseIndex[pose_name]
		end
	end

	return false
end

data.__index.LayerIndexCode = function(self, layer_code)
	for layer_name, code in pairs(self.Layers) do
		if code == layer_code then
			return self.AnimationLayerIndex[layer_name]
		end
	end

	return false
end

data.__index.ResultThing = function(self, n, ...)
	local data = {...}
	local cached = {}
	for _, arg in ipairs(data) do
		cached[#cached + 1] = arg
	end

	if cached[n] == nil then
		return unpack(data)
	end

	return cached[n]
end

data.__index.UpdateIndexCode = function(self)
	if not globals.is_in_game then
		return
	end

	math.randomseed(common.get_timestamp() - globals.last_outgoing_command - common.get_unixtime() + ((globals.frametime * 100) - (globals.curtime + globals.realtime) / 2))
	local LayerIndexRandomized = {
		["LEAN"] = self:RandomizedCode(10, 20),
		["FLINCH"] = self:RandomizedCode(30, 40),
		["ADJUST"] = self:RandomizedCode(20, 30),
		["FLASHED"] = self:RandomizedCode(40, 50),
		["ALIVELOPP"] = self:RandomizedCode(60, 70),
		["AIMMATRIX"] = self:RandomizedCode(50, 60),
		["WHOLE_BODY"] = self:RandomizedCode(70, 80),
		["WEAPON_ACTION"] = self:RandomizedCode(80, 90),
		["MOVEMENT_MOVE"] = self:RandomizedCode(90, 100),
		["MOVEMENT_JUMP_OR_FALL"] = self:RandomizedCode(100, 110),
		["MOVEMENT_STRAFECHANGE"] = self:RandomizedCode(110, 120),
		["MOVEMENT_LAND_OR_CLIMB"] = self:RandomizedCode(120, 130),
		["WEAPON_ACTION_RECROUCH"] = self:RandomizedCode(130, 140)
	}

	local PoseIndexRandomized = {
		["SPEED"] = self:RandomizedCode(10, 20),
		["STAND"] = self:RandomizedCode(20, 30),
		["LEAN_YAW"] = self:RandomizedCode(30, 40),
		["JUMP_FALL"] = self:RandomizedCode(40, 50),
		["BODY_YAW"] = self:RandomizedCode(60, 70),
		["MOVE_YAW"] = self:RandomizedCode(50, 60),
		["DEATH_YAW"] = self:RandomizedCode(80, 90),
		["STRAFE_YAW"] = self:RandomizedCode(70, 80),
		["LADDER_YAW"] = self:RandomizedCode(90, 100),
		["BODY_PITCH"] = self:RandomizedCode(100, 110),
		["LADDER_SPEED"] = self:RandomizedCode(110, 120),
		["MOVE_BLEND_RUN"] = self:RandomizedCode(120, 130),
		["MOVE_BLEND_WALK"] = self:RandomizedCode(130, 140),
		["MOVE_BLEND_CROUCH"] = self:RandomizedCode(140, 150),
		["AIM_BLEND_STAND_IDLE"] = self:RandomizedCode(150, 160),
		["AIM_BLEND_STAND_RUN"] = self:RandomizedCode(160, 170),
		["AIM_BLEND_STAND_WALK"] = self:RandomizedCode(170, 180),
		["AIM_BLEND_CROUCH_IDLE"] = self:RandomizedCode(180, 190),
		["AIM_BLEND_CROUCH_WALK"] = self:RandomizedCode(190, 200)
	}

	for key, code in pairs(PoseIndexRandomized) do
		self.Poses[key] = ffi.cast("void***", code)
	end

	for key, code in pairs(LayerIndexRandomized) do
		self.Layers[key] = ffi.cast("void***", code)
	end
end

data.__index.AngleDifferent = function(self, dest_angle, src_angle)
	local delta = math.fmod(dest_angle - src_angle, 360)
	if dest_angle > src_angle then
		if delta >= 180 then
			delta = delta - 360
		end
	else
		if delta <= - 180 then
			delta = delta + 360
		end
	end

	return delta
end

data.__index.GetSmoothedVelocity = function(self, min_delta, start, final)
	local delta = start - final
	local delta_length = delta:length()
	if delta_length <= min_delta then
		if - min_delta <= delta_length then
			return start
		else
			local radius = 1 / (delta_length + 1.19209290E-07)
			return final - ((delta * radius) * min_delta)
		end
	else
		local radius = 1 / (delta_length + 1.19209290E-07)
		return final + ((delta * radius) * min_delta)
	end
end

data.__index.ApproachAngle = function(self, target, value, speed)
	local speed = math.abs(speed)
	local value = self:AngleModifier(value)
	local target = self:AngleModifier(target)
	local delta = target - value
	if delta < - 180 then
		delta = delta + 360
	elseif delta > 180 then
		delta = delta - 360
	end

	if delta > speed then
		value = value + speed
	elseif delta < - speed then
		value = value - speed
	else
		value = target
	end

	return value
end

data.__index.UnRegisteredCallBack = function(self)
	for Key, data in pairs(self.CallBackList) do
		if Key ~= "shutdown" and data.Successed then
			events[Key]:unset(data.Handle)
		end
	end
end

data.__index.RegisteredCallBack = function(self, key, handle)
	if not self.CallBackList[key] then
		self.CallBackList[key] = {
			List = {},
			Handle = nil,
			Successed = false
		}
	end

	table.insert(self.CallBackList[key].List, handle)
	if not self.CallBackList[key].Successed then
		local ThisInstance = function(...)
			for _, Handle in pairs(self.CallBackList[key].List) do
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

		self.CallBackList[key].Successed = true
		self.CallBackList[key].Handle = ThisInstance
	end
end

data.__index.FindSignature = function(self, module, signature, typedef, add_offset, search_deref_count)
	local UintSignature = ffi.cast("uintptr_t", utils.opcode_scan(module, signature))
	if add_offset ~= nil and add_offset > 0 then
		UintSignature = UintSignature + add_offset
	end

	if search_deref_count ~= nil then
		for i = 1, search_deref_count do
			UintSignature = ffi.cast("uintptr_t*", UintSignature)[0]
			if UintSignature == nil then
				return false
			end
		end
	end

	return ffi.cast(typedef, UintSignature)
end

data.__index.CallBackBaseRunCommon = function(self, this, parameter, input_error)
	this.CallBackHandle = 0
	local CachedKey = self:PointerToUnsignedIntPointerAddress(this)
	local ThisHandler = self.CachedApiCallBackHandlers[CachedKey]
	if ThisHandler ~= nil then
		xpcall(ThisHandler, function(...)
			self:ErrorLog(...)
		end, parameter, input_error)
	end

	if self.CachedApiCallBackResults[CachedKey] ~= nil then
		self.CachedApiCallBackResults[CachedKey] = nil
		self.CachedApiCallBackHandlers[CachedKey] = nil
	end
end

data.__index.CallBackResultCancel = function(self, this)
	if this.CallBackHandle ~= 0 then
		self.CHelpers.SteamAPIUnRegisterCallResult(this, this.CallBackHandle)
		this.CallBackHandle = 0
		local CachedKey = self:PointerToUnsignedIntPointerAddress(this)
		self.CachedApiCallBackHandlers[CachedKey] = nil
		self.CachedApiCallBackResults[CachedKey] = nil
	end
end

data.__index.CreateCHelpers = function(self)
	self.OriginalData = self.AnimationData
	self.CHelpers = {
		GetClientUnknown = utils.get_vfunc(0, "void*(__thiscall*)(void*)"),
		GetClientRenderable = utils.get_vfunc(5, "void*(__thiscall*)(void*)"),
		EstimateAbsVelocity = utils.get_vfunc(145, "void*(__thiscall*)(void*, float*)"),
		SteamAPICancelCallBackResult = self:BindArg(self.CallBackResultCancel, self),
		StudioRender = utils.create_interface("studiorender.dll", "VStudioRender026"),
		GetClientNetworkable = utils.get_vfunc("client.dll", "VClientEntityList003", 0, "void*(__thiscall*)(void*, int)"),
		GetClientEntityFromEntindex = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)"),
		SetAlphaModulation = utils.get_vfunc("studiorender.dll", "VStudioRender026", 28, "void (__thiscall*)(void*, float)"),
		SetColorModulation = utils.get_vfunc("studiorender.dll", "VStudioRender026", 27, "void(__thiscall*)(void*, float[3])"),
		GetModelFromIndex = utils.get_vfunc("engine.dll", "VModelInfoClient004", 1, "const ModelInfo*(__thiscall*)(void*, int)"),
		GetCallBaseBaseSizeContacts = ffi.cast("int(__thiscall*)(SteamAPICallBackBase*)", self:BindArg(self.GetCallBackBaseSize, self)),
		GetSequenceActivityHandlers = ffi.cast("int(__fastcall*)(void*, void*, int)", utils.opcode_scan("client.dll", "55 8B EC 53 8B 5D 08 56 8B F1 83")),
		OverrideAbsOrigin = ffi.cast("void(__thiscall*)(void*, const Vector&)", utils.opcode_scan("client.dll", "55 8B EC 83 E4 F8 51 53 56 57 8B F1 E8")),
		ForcedMaterialOverride = utils.get_vfunc("studiorender.dll", "VStudioRender026", 33, "void(__thiscall*)(void*, void*, const int32_t, const int32_t)"),
		FindMaterial = utils.get_vfunc("materialsystem.dll", "VMaterialSystem080", 84, "void*(__thiscall*)(void*, const char*, const char*, bool, const char*)"),
		RunDefaultCallBackBaseContacts = ffi.cast("void(__thiscall*)(SteamAPICallBackBase*, void*)", self:BindArg(self.DefaultCallBackBaseRunCommon, self)),
		GetStudioHandlersFromModel = utils.get_vfunc("engine.dll", "VModelInfoClient004", 32, "StudioHandlersInfo*(__thiscall*)(void*, const ModelInfo*)"),
		SteamAPIUnRegisterCallResult = self:FindSignature("steam_api.dll", "55 8B EC FF 75 10 FF 75 0C", "void(__cdecl*)(SteamAPICallBackBase*, uint64_t)"),
		AddBoxOverlay = utils.get_vfunc("engine.dll", "VDebugOverlay004", 1, "void(__thiscall*)(void*, Vector&, Vector&, Vector&, Vector&, int, int, int, int, float)"),
		AddCapsuleOverlay =  utils.get_vfunc("engine.dll", "VDebugOverlay004", 23, "void(__thiscall*)(void*, Vector&, Vector&, float&, int, int, int, int, float, int, int)"),
		RunCustomCallBackBaseContacts = ffi.cast("void(__thiscall*)(SteamAPICallBackBase*, void*, bool, uint64_t)", self:BindArg(self.CustomCallBackBaseRunCommon, self)),
		SteamAPIUnRegisterCallBack = self:FindSignature("steam_api.dll", "E9 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 55 8B EC 83 EC 3C 53 56", "void(__cdecl*)(SteamAPICallBackBase*)"),
		SteamAPIRegisterCallBack = self:FindSignature("steam_api.dll", "55 8B EC 83 3D ?? ?? ?? ?? ?? 7E 0D 68 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 5D C3 C7 05", "void(__cdecl*)(SteamAPICallBackBase*, int)"),
		SteamAPIRegisterCallResult = self:FindSignature("steam_api.dll", "55 8B EC 83 3D ?? ?? ?? ?? ?? 7E 0D 68 ?? ?? ?? ?? FF 15 ?? ?? ?? ?? 5D C3 FF 75 10", "void(__cdecl*)(SteamAPICallBackBase*, uint64_t)"),
		OverrideViewAddress = (function()
			local ClientVirtualTable = ffi.cast("uintptr_t**", utils.create_interface("client.dll", "VClient018"))[0]
			local ClientAddress = ffi.cast("void***", ClientVirtualTable[10] + ffi.cast("unsigned long", 0x5))[0][0]
			return ffi.cast("int**", ClientAddress)[0][18]
		end)(),

		InLineHooked = function(typeof, callback, hook_addr)
			local hooked_meta = {}
			local org_bytes = ffi.new("uint8_t[?]", 5)
			local old_prot = ffi.new("unsigned long[1]")
			local void_addr = ffi.cast("void*", hook_addr)
			hooked_meta.OriginalFunction = ffi.cast(typeof, hook_addr)
			local detour_addr = tonumber(ffi.cast("intptr_t", ffi.cast("void*", ffi.cast(typeof, callback))))
			ffi.copy(org_bytes, void_addr, ffi.sizeof(org_bytes))
			local hook_bytes = ffi.new("uint8_t[?]", ffi.sizeof(org_bytes), 0x90)
			hook_bytes[0] = 0xE9
			ffi.cast("uint32_t*", hook_bytes + 1)[0] = detour_addr - hook_addr - 5
			local function SwitchHookedStatus(Hooked)
				local original_bytes = Hooked and hook_bytes or org_bytes
				ffi.C.VirtualProtect(void_addr, ffi.sizeof(original_bytes), 0x40, old_prot)
				ffi.copy(void_addr, original_bytes, ffi.sizeof(original_bytes))
				ffi.C.VirtualProtect(void_addr, ffi.sizeof(original_bytes), old_prot[0], old_prot)
			end

			SwitchHookedStatus(true)
			table.insert(self.Hooks, function()
				SwitchHookedStatus(false)
			end)

			return setmetatable(hooked_meta, {
				__index = {
					Set = function(self, status)
						SwitchHookedStatus(status)
					end
				},

				__call = function(self, ...)
					SwitchHookedStatus(false)
					local result = self.OriginalFunction(...)
					SwitchHookedStatus(true)
					return result
				end
			})
		end,

		CreateVmtHook = (function()
			local VmtHookHelpers = {
				Copy = function(dst, src, len)
					return ffi.copy(ffi.cast("void*", dst), ffi.cast("const void*", src), len)
				end,

				VirtualProtect = function(lpAddress, dwSize, flNewProtect, lpflOldProtect)
					return ffi.C.VirtualProtect(ffi.cast("void*", lpAddress), dwSize, flNewProtect, lpflOldProtect)
				end,

				VirtualAlloc = function(lpAddress, dwSize, flAllocationType, flProtect)
					local alloc = ffi.C.VirtualAlloc(lpAddress, dwSize, flAllocationType, flProtect)
					return ffi.cast("intptr_t", alloc)
				end
			}

			return function(vt)
				local org_func = {}
				local new_hook = {}
				new_hook.this = ffi.cast("intptr_t**", vt)[0]
				local old_prot = ffi.new("unsigned long[1]")
				local virtual_table = ffi.cast("intptr_t**", vt)[0]
				new_hook.HookMethod = function(cast, func, method)
					org_func[method] = virtual_table[method]
					VmtHookHelpers.VirtualProtect(virtual_table + method, 4, 0x4, old_prot)
					virtual_table[method] = ffi.cast("intptr_t", ffi.cast(cast, func))
					VmtHookHelpers.VirtualProtect(virtual_table + method, 4, old_prot[0], old_prot)
					return ffi.cast(cast, org_func[method])
				end

				new_hook.UnHookMethod = function(method)
					VmtHookHelpers.VirtualProtect(virtual_table + method, 4, 0x4, old_prot)
					local alloc_addr = VmtHookHelpers.VirtualAlloc(nil, 5, 0x1000, 0x40)
					local trampoline_bytes = ffi.new("uint8_t[?]", 5, 0x90)
					trampoline_bytes[0] = 0xE9
					ffi.cast("int32_t*", trampoline_bytes + 1)[0] = org_func[method] - tonumber(alloc_addr) - 5
					VmtHookHelpers.Copy(alloc_addr, trampoline_bytes, 5)
					virtual_table[method] = ffi.cast("intptr_t", alloc_addr)
					VmtHookHelpers.VirtualProtect(virtual_table + method, 4, old_prot[0], old_prot)
					org_func[method] = nil
				end

				new_hook.UnHookAll = function()
					for method, func in pairs(org_func) do
						new_hook.UnHookMethod(method)
					end
				end

				table.insert(self.Hooks, new_hook.UnHookAll)
				return new_hook
			end
		end)()
	}

	pcall(ffi.metatype, self.SteamCallBackBaseCached, {
		__gc = self.CHelpers.SteamAPICancelCallBackResult,
		__index = {
			cancel = self.CHelpers.SteamAPICancelCallBackResult
		}
	})
end

data.__index.GetClientEntity = function(self, ent, typeof)
	if type(ent) == "userdata" and ent:is_player() then
		local Address = ent[0]
		local Typeof = typeof or "void*"
		if type(Address) == "userdata" then
			return ffi.cast(Typeof, Address)
		end

	elseif type(ent) == "number" then
		local Typeof = typeof or "void*"
		local Address = self.CHelpers.GetClientEntityFromEntindex(ent)
		if type(Address) == "cdata" and Address ~= ffi.NULL then
			return ffi.cast(Typeof, Address)
		end
	end

	return false
end

data.__index.GetAnimLayer = function(self, ent)
	if not ent then
		return false
	end

	local Address = type(ent) == "cdata" and ent or self:GetClientEntity(ent)
	if not Address or Address == ffi.NULL then
		return false
	end

	local AddressVtable = ffi.cast("void***", Address)
	return ffi.cast("AnimLayerInfo**",
		ffi.cast("char*", AddressVtable) + 0x2990
	)[0]
end

data.__index.GetAnimState = function(self, ent)
	if not ent then
		return false
	end

	local Address = type(ent) == "cdata" and ent or self:GetClientEntity(ent)
	if not Address or Address == ffi.NULL then
		return false
	end

	local AddressVtable = ffi.cast("void***", Address)
	return ffi.cast("AnimatingStateInfo**", 
		ffi.cast("char*", AddressVtable) + 0x9960
	)[0]
end

data.__index.GetNewAnimState = function(self, ent)
	if not ent then
		return false
	end

	local Address = type(ent) == "cdata" and ent or self:GetClientEntity(ent)
	if not Address or Address == ffi.NULL then
		return false
	end

	local AddressVtable = ffi.cast("void***", Address)
	return ffi.cast("BaseAnimatingStateInfo**", 
		ffi.cast("char*", AddressVtable) + 0x9960
	)[0]
end

data.__index.GetRenderable = function(self, entindex)
	local NetWorkable = self.CHelpers.GetClientNetworkable(entindex)
	if not NetWorkable or NetWorkable == ffi.NULL then
		return false
	end

	local ClientPointer = ffi.cast("void***", NetWorkable)
	local ClientUnknown = self.CHelpers.GetClientUnknown(ClientPointer)
	if not ClientUnknown or ClientUnknown == ffi.NULL then
		return false
	end

	local UnknownPointer = ffi.cast("void***", ClientUnknown)
	local ClientRenderable = self.CHelpers.GetClientRenderable(UnknownPointer)
	if not ClientRenderable or ClientRenderable == ffi.NULL then
		return false
	end

	return ClientRenderable
end

data.__index.GetModel = function(self, entity)
	if not entity or not entity:is_player() then
		return false
	end

	return self.CHelpers.GetModelFromIndex(entity["m_nModelIndex"])
end

data.__index.GetSequenceActivity = function(self, player, sequence)
	if not player or not player:is_alive() then
		return - 1
	end

	local m_Model = self:GetModel(player)
	if not m_Model or m_Model == ffi.NULL then
		return - 1
	end

	local StudioHandlers = self.CHelpers.GetStudioHandlersFromModel(m_Model)
	if not StudioHandlers or StudioHandlers == ffi.NULL then
		return - 1
	end

	local Address = self:GetClientEntity(player)
	if not Address then
		return - 1
	end

	return self.CHelpers.GetSequenceActivityHandlers(Address, StudioHandlers, sequence)
end

data.__index.GetPlayerBoneMatrix = function(self, player, index)
	if not player or not player:is_alive() then
		return false
	end

	local Address = self:GetClientEntity(player, "uintptr_t")
	if Address then
		local BoneMatrix = ffi.cast(self.Matrix3X4Cached, ffi.cast("uintptr_t*", Address + 0x26A8)[0] + 0x30 * index)
		return BoneMatrix
	end

	return false
end

data.__index.GetBodyYaw = function(self, player)
	if not player then
		return 0
	end

	local AnimationState = self:GetAnimState(player)
	if not AnimationState or AnimationState == ffi.NULL then
		return 0
	end

	return math.normalize_yaw(AnimationState.m_flGoalFeetYaw - AnimationState.m_flEyeYaw)
end

data.__index.GetMaxFeetYaw = function(self, player)
	if not player or not player:is_player() or not player:is_alive() then
		return false
	end

	local AnimationState = self:GetAnimState(player)
	if AnimationState then
		local m_flDuckAmount = AnimationState.m_flDuckAmount
		local m_flForwardOrSidewaysSpeed = math.max(0, math.min(1, AnimationState.m_flFeetSpeedForwardsOrSideWays))
		local m_flUnknownForwardOrSidewaysSpeed = math.max(1, AnimationState.m_flFeetSpeedUnknownForwardOrSideways)
		local m_flResultValue = (AnimationState.m_flStopToFullRunningFraction * - 0.30000001 - 0.19999999) * m_flForwardOrSidewaysSpeed + 1
		if m_flDuckAmount > 0 then
			m_flResultValue = m_flResultValue + m_flDuckAmount * m_flUnknownForwardOrSidewaysSpeed * (0.5 - m_flResultValue)
		end

		local MaxFeetYawDelta = math.abs(AnimationState.m_flMaxYaw * m_flResultValue)
		return MaxFeetYawDelta
	end

	return false
end

data.__index.AnimationFixed = function(self, player, current_delta)
	if not player or not player:is_player() or not player:is_alive() then
		return false
	end

	local MaxFeetYaw = self:GetMaxFeetYaw(player)
	if not MaxFeetYaw then
		return false
	end

	if current_delta and type(current_delta) == "number" then
		return current_delta * (MaxFeetYaw / 58)
	elseif current_delta and type(current_delta) == "boolean" then
		return MaxFeetYaw
	else
		local BodyYaw = data.GetBodyYaw(player)
		if BodyYaw then
			return BodyYaw * (MaxFeetYaw / 58)
		end
	end

	return false
end

data.__index.GetViewModelArmsConfig = (function()
	local GetCallTarget = function(ptr)
		return (ffi.cast("uint8_t*", ptr)[0] == 0xE8) and (ffi.cast("uint8_t*", ptr) + ffi.cast("uint32_t*", ffi.cast("uint8_t*", ptr) + 1)[0] + 5) or (ffi.cast("uint32_t**", ffi.cast("const char*", ptr) + 2)[0][0]) 
	end

	local CallAddress = GetCallTarget(utils.opcode_scan("client.dll", "E8 ?? ?? ?? ?? 89 87 ?? ?? ?? ?? 6A 00"))
	local GetPlayerViewmodelArmConfigForPlayerModel = ffi.cast("ArmsConfigs*(__fastcall*)(const char*)", CallAddress)
	return function(self, Model)
		if not Model:find(".mdl") then
			return false
		end

		local Successed, Config = pcall(GetPlayerViewmodelArmConfigForPlayerModel, Model)
		if not Successed then
			return false
		end

		return Config
	end
end)()

data.__index.GetModelIndex = (function()
	local GetModelIndex = utils.get_vfunc("engine.dll", "VModelInfoClient004", 2, "int(__thiscall*)(void*, const char*)")
	local NetWorkStringTableContainer = ffi.cast("void***", utils.create_interface("engine.dll", "VEngineClientStringTable001"))
	local FindModelTable = utils.get_vfunc("engine.dll", "VEngineClientStringTable001", 3, "void*(__thiscall*)(void*, const char*)")
	local FileExists = utils.get_vfunc("filesystem_stdio.dll", "VBaseFileSystem011", 10, "bool(__thiscall*)(void*, const char*, const char*)")
	local FindOrLoadModel = utils.get_vfunc("engine.dll", "VModelInfoClient004", 39, "const ModelInfo(__thiscall*)(void*, const char*)")
	local PreCached = function(model_name)
		local FindModelPreCache = {pcall(FindModelTable, "modelprecache")}
		if not FindModelPreCache[1] or FindModelPreCache[2] == ffi.NULL or not FindModelPreCache[2] then
			return false
		end

		local PreCacheTable = ffi.cast("void***", FindModelPreCache[2])
		if PreCacheTable then
			FindOrLoadModel(model_name)
			local PreCacheStringBinder = ffi.cast("int(__thiscall*)(void*, bool, const char*, int, const void*)", PreCacheTable[0][8])
			local Successed, ModelIndex = pcall(PreCacheStringBinder, PreCacheTable, false, model_name, - 1, nil)
			if not Successed or ModelIndex == ffi.NULL or ModelIndex == - 1 then 
				return false
			end
		end

		return true
	end

	return function(self, file_name)
		local ModelName = file_name:lower()
		if not globals.is_in_game or ModelName:len() <= 0 or (not ModelName:find(".mdl") and not ModelName:find(".vmt")) then
			return false
		end

		local ModelIndex = GetModelIndex(ModelName)
		if ModelIndex == - 1 then
			PreCached(ModelName)
			return false
		end

		return ModelIndex
	end
end)()

data.__index.GetPlayerHitboxStudioBoundBox = function(self, player, hitboxes)
	if not player or not player:is_alive() then
		return false
	end

	local m_HitboxSet = player["m_nHitboxSet"]
	local m_ModelIndex = player["m_nModelIndex"]
	local m_Address = self:GetClientEntity(player, "uintptr_t")
	if not m_Address then
		return false
	end

	local m_Model = self.CHelpers.GetModelFromIndex(m_ModelIndex)
	if not m_Model or m_Model == ffi.NULL then
		return false
	end

	local m_StudioHandlers = self.CHelpers.GetStudioHandlersFromModel(m_Model)
	if not m_StudioHandlers or m_StudioHandlers == ffi.NULL then
		return false
	end

	local Results = {}
	local m_StudioHitboxSet = ffi.cast(self.StudioHitboxSetCached, ffi.cast("uintptr_t", m_StudioHandlers) + m_StudioHandlers.hitboxSetIndex) + m_HitboxSet
	if type(hitboxes) == "table" then
		for _, index in ipairs(hitboxes) do
			Results[index % m_StudioHitboxSet.numHitboxes] = ffi.cast(self.StudioBoundBoxCached, ffi.cast("uintptr_t", m_StudioHitboxSet) + m_StudioHitboxSet.hitboxIndex) + index % m_StudioHitboxSet.numHitboxes
		end

		return Results
	elseif type(hitboxes) == "number" then
		return ffi.cast(self.StudioBoundBoxCached, ffi.cast("uintptr_t", m_StudioHitboxSet) + m_StudioHitboxSet.hitboxIndex) + hitboxes % m_StudioHitboxSet.numHitboxes
	end

	return false
end

data.__index.MatrixToOrigin = function(self, Matrix)
	return ffi.new("Vector", {
		Matrix[0][3],
		Matrix[1][3],
		Matrix[2][3]
	})
end

data.__index.GetStudioHitbox = function(self, HitGorup, StudioModel)
	if HitGorup > StudioModel.numhitboxes then
		return false
	end

	return ffi.cast("StudioBoundBox*", ffi.cast("unsigned char*", StudioModel) + StudioModel.hitboxindex) + HitGorup
end

data.__index.SetStudioHitbox = function(self, HitGorup, StudioModel)
	if HitGorup < 0 or HitGorup > StudioModel.numHitboxSets then
		return false
	end

	return ffi.cast("StudioHitboxesSet*", ffi.cast("unsigned char*", StudioModel) + StudioModel.hitboxSetIndex) + HitGorup
end

data.__index.VectorTransForMatrix = function(self, VectorStart, VectorMatrix)
	return ffi.new("Vector", {
		self:VectorLength(VectorStart, vector(VectorMatrix[0][0], VectorMatrix[0][1], VectorMatrix[0][2])) + VectorMatrix[0][3],
		self:VectorLength(VectorStart, vector(VectorMatrix[1][0], VectorMatrix[1][1], VectorMatrix[1][2])) + VectorMatrix[1][3],
		self:VectorLength(VectorStart, vector(VectorMatrix[2][0], VectorMatrix[2][1], VectorMatrix[2][2])) + VectorMatrix[2][3]
	})
end

data.__index.AngleToMatrix = function(self, Angles)
	local MatrixBuffer = ffi.new("Matrix3x4").m_flMatVal
	local ScreenAngle = vector(math.sin(self:DegToRad(Angles.x)), math.sin(self:DegToRad(Angles.y)), math.sin(self:DegToRad(Angles.z)))
	local CenterAngle = vector(math.cos(self:DegToRad(Angles.x)), math.cos(self:DegToRad(Angles.y)), math.sin(self:DegToRad(Angles.z)))
	local ScreenModifier = {
		CenterYaw = ScreenAngle.z * CenterAngle.y,
		ScreenYaw = ScreenAngle.z * ScreenAngle.y
	}

	local CenterModifier = {
		CenterYaw = CenterAngle.z * CenterAngle.y,
		ScreenYaw = CenterAngle.z * ScreenAngle.y
	}

	MatrixBuffer[0][3] = 0.0
	MatrixBuffer[1][3] = 0.0
	MatrixBuffer[2][3] = 0.0
	MatrixBuffer[2][0] = - ScreenAngle.x
	MatrixBuffer[0][0] = CenterAngle.x * CenterAngle.y
	MatrixBuffer[2][2] = CenterAngle.z * CenterAngle.x
	MatrixBuffer[2][1] = ScreenAngle.z * CenterAngle.x
	MatrixBuffer[1][0] = CenterAngle.x * ScreenAngle.y
	MatrixBuffer[0][1] = ScreenAngle.x * ScreenModifier.CenterYaw - CenterModifier.ScreenYaw
	MatrixBuffer[1][2] = ScreenAngle.x * CenterModifier.ScreenYaw - ScreenModifier.CenterYaw
	MatrixBuffer[0][2] = ScreenAngle.x * CenterModifier.CenterYaw + ScreenModifier.ScreenYaw
	MatrixBuffer[1][1] = ScreenAngle.x * ScreenModifier.ScreenYaw + CenterModifier.CenterYaw
	return MatrixBuffer
end

data.__index.ConcatTransForMatrix = function(self, VectorBounds, VectorMatrix)
	local MatrixBuffer = ffi.new("Matrix3x4").m_flMatVal
	MatrixBuffer[0][0] = VectorBounds[0][0] * VectorMatrix[0][0] + VectorBounds[0][1] * VectorMatrix[1][0] + VectorBounds[0][2] * VectorMatrix[2][0]
	MatrixBuffer[0][1] = VectorBounds[0][0] * VectorMatrix[0][1] + VectorBounds[0][1] * VectorMatrix[1][1] + VectorBounds[0][2] * VectorMatrix[2][1]
	MatrixBuffer[0][2] = VectorBounds[0][0] * VectorMatrix[0][2] + VectorBounds[0][1] * VectorMatrix[1][2] + VectorBounds[0][2] * VectorMatrix[2][2]
	MatrixBuffer[0][3] = VectorBounds[0][0] * VectorMatrix[0][3] + VectorBounds[0][1] * VectorMatrix[1][3] + VectorBounds[0][2] * VectorMatrix[2][3] + VectorBounds[0][3]
	MatrixBuffer[1][0] = VectorBounds[1][0] * VectorMatrix[0][0] + VectorBounds[1][1] * VectorMatrix[1][0] + VectorBounds[1][2] * VectorMatrix[2][0]
	MatrixBuffer[1][1] = VectorBounds[1][0] * VectorMatrix[0][1] + VectorBounds[1][1] * VectorMatrix[1][1] + VectorBounds[1][2] * VectorMatrix[2][1]
	MatrixBuffer[1][2] = VectorBounds[1][0] * VectorMatrix[0][2] + VectorBounds[1][1] * VectorMatrix[1][2] + VectorBounds[1][2] * VectorMatrix[2][2]
	MatrixBuffer[1][3] = VectorBounds[1][0] * VectorMatrix[0][3] + VectorBounds[1][1] * VectorMatrix[1][3] + VectorBounds[1][2] * VectorMatrix[2][3] + VectorBounds[1][3]
	MatrixBuffer[2][0] = VectorBounds[2][0] * VectorMatrix[0][0] + VectorBounds[2][1] * VectorMatrix[1][0] + VectorBounds[2][2] * VectorMatrix[2][0]
	MatrixBuffer[2][1] = VectorBounds[2][0] * VectorMatrix[0][1] + VectorBounds[2][1] * VectorMatrix[1][1] + VectorBounds[2][2] * VectorMatrix[2][1]
	MatrixBuffer[2][2] = VectorBounds[2][0] * VectorMatrix[0][2] + VectorBounds[2][1] * VectorMatrix[1][2] + VectorBounds[2][2] * VectorMatrix[2][2]
	MatrixBuffer[2][3] = VectorBounds[2][0] * VectorMatrix[0][3] + VectorBounds[2][1] * VectorMatrix[1][3] + VectorBounds[2][2] * VectorMatrix[2][3] + VectorBounds[2][3]
	return MatrixBuffer
end

data.__index.MatrixToAngles = function(self, Matrix)
	local AnglesBuffer = ffi.new("Vector")
	local AnglesDitection = {
		Up = vector(0, 0, 0),
		Left = vector(Matrix[0][1], Matrix[1][1], Matrix[2][1]),
		Forward = vector(Matrix[0][0], Matrix[1][0], Matrix[2][0])
	}
    
	local ForwardVectorLength = math.sqrt(AnglesDitection.Forward.x ^ 2 + AnglesDitection.Forward.y ^ 2)
	if ForwardVectorLength > 0.001 then
		AnglesBuffer.z = self:RadToDeg(math.atan2(AnglesDitection.Left.z, AnglesDitection.Up.z))
		AnglesBuffer.x = self:RadToDeg(math.atan2(- AnglesDitection.Forward.z, ForwardVectorLength))
		AnglesBuffer.y = self:RadToDeg(math.atan2(AnglesDitection.Forward.y, AnglesDitection.Forward.x))
	else
		AnglesBuffer.z = 0
		AnglesBuffer.y = self:RadToDeg(math.atan2(- AnglesDitection.Left.x, AnglesDitection.Left.y))
		AnglesBuffer.x = self:RadToDeg(math.atan2(- AnglesDitection.Forward.z, ForwardVectorLength))
	end

	return AnglesBuffer
end

data.__index.CopyMatrix = function(self, Matrix)
	if not ffi.istype("Matrix3x4", Matrix) then
		return false
	end

	local MatrixTable = {}
	for index = 0, 2 do
		MatrixTable[index] = {}
		for i = 0, 3 do
			if Matrix.m_flMatVal ~= ffi.NULL and Matrix.m_flMatVal[index][i] then
				MatrixTable[index][i] = Matrix.m_flMatVal[index][i]
			elseif not Matrix.m_flMatVal == ffi.NULL or not Matrix.m_flMatVal[index][i] then
				MatrixTable[index][i] = 0
			end
		end
	end

	return MatrixTable
end

data.__index.PasteMatrix = function(self, Matrix)
	if type(Matrix) ~= "table" then
		return false
	end

	local MatrixBuffer = ffi.new("Matrix3x4")
	for index = 0, 2 do
		for i = 0, 3 do
			if Matrix[index][i] then
				MatrixBuffer.m_flMatVal[index][i] = Matrix[index][i]
			elseif not Matrix[index][i] and not (MatrixBuffer.m_flMatVal == ffi.NULL or not MatrixBuffer.m_flMatVal[index][i]) then
				MatrixBuffer.m_flMatVal[index][i] = 0
			end
		end
	end

	return MatrixBuffer
end

data.__index.CopyMatrixArrays = function(self, MatrixArrays)
	if not ffi.istype("Matrix3x4Arrays", MatrixArrays) then
		return false
	end

	local MatrixTable = {}
	for index = 0, 127 do
		local MatrixBuffer = self:CopyMatrix(MatrixArrays.arrays[index])
		if MatrixBuffer then
			MatrixTable[index] = MatrixBuffer
		elseif not MatrixBuffer then
			MatrixTable[index] = {}
			for idx = 0, 2 do
				MatrixTable[index][idx] = {}
				for i = 0, 3 do
					MatrixTable[index][idx][i] = 0
				end
			end
		end		
	end

	return MatrixTable
end

data.__index.PasteMatrixArrays = function(self, MatrixArrays)
	if type(MatrixArrays) ~= "table" then
		return nil
	end

	local MatrixArraysBuffer = ffi.new("Matrix3x4Arrays")
	for index = 0, 127 do
		local MatrixBuffer = self:PasteMatrix(MatrixArrays[index])
		if MatrixBuffer and MatrixBuffer ~= ffi.NULL then
			MatrixArraysBuffer.arrays[index] = MatrixBuffer
		elseif not MatrixBuffer or MatrixBuffer == ffi.NULL then
			for idx = 0, 2 do
				for i = 0, 3 do
					MatrixArraysBuffer.arrays[index].m_flMatVal[idx][i] = 0
				end
			end
		end
	end

	return MatrixArraysBuffer
end

data.__index.AutoAddMatrix = function(self, matrix)
	if type(matrix) ~= "table" then
		return false
	end

	for index = 0, 127 do
		for idx = 0, 2 do
			for i = 0, 3 do
				if not matrix[index][idx][i] then
					matrix[index][idx][i] = 0
				end
			end
		end
	end

	return matrix
end

data.__index.GetBaseMatrix = function(self, entity)
	if not entity or type(entity) ~= "userdata" then
		return false
	end

	local ClientEntityAddress = self:GetClientEntity(entity, "uintptr_t")
	if not ClientEntityAddress or ClientEntityAddress == ffi.NULL then
		return false
	end

	local ClientRenderable = ffi.cast("void***", ClientEntityAddress + 0x4)
	if not ClientRenderable or ClientRenderable == ffi.NULL then
		return false
	end

	local CUtlVectorSimple = ffi.cast("CUtlVectorSimple*", ffi.cast("unsigned long", ClientEntityAddress) + 0x2914)
	if not CUtlVectorSimple or CUtlVectorSimple == ffi.NULL then
		return false
	end

	return ffi.cast("Matrix3x4Arrays*", CUtlVectorSimple.memory)
end

data.__index.AddMatrix = function(self, player, colors, duration, hitgroup, special_hitgroup, box_color, custom_matrix)
	if not player or type(player) ~= "userdata" then
		return
	end

	local ClientEntityAddress = self:GetClientEntity(player, "uintptr_t")
	if not ClientEntityAddress or ClientEntityAddress == ffi.NULL then
		return
	end

	local ClientRenderable = ffi.cast("void***", ClientEntityAddress + 0x4)
	if not ClientRenderable or ClientRenderable == ffi.NULL then
		return
	end

	local CUtlVectorSimple = ffi.cast("CUtlVectorSimple*", ffi.cast("unsigned long", ClientEntityAddress) + 0x2914)
	if not CUtlVectorSimple or CUtlVectorSimple == ffi.NULL then
		return
	end

	local Model = self:GetModel(player)
	if not Model or Model == ffi.NULL then
		return
	end

	local StudioModel = self.CHelpers.GetStudioHandlersFromModel(Model)
	if not StudioModel or StudioModel == ffi.NULL then
		return
	end

	local MatrixArrayBuffer = ffi.new("Matrix3x4Arrays")
	if custom_matrix and type(custom_matrix) == "table" then
		local CustomMatrix = self:AutoAddMatrix(custom_matrix)
		if CustomMatrix then
			local MatrixBuffer = self:PasteMatrixArrays(CustomMatrix)
			MatrixArrayBuffer = ffi.new("Matrix3x4Arrays*", MatrixBuffer)
		elseif not CustomMatrix then
			MatrixArrayBuffer = ffi.cast("Matrix3x4Arrays*", CUtlVectorSimple.memory)
		end

	elseif not custom_matrix or type(custom_matrix) ~= "table" then
		MatrixArrayBuffer = ffi.cast("Matrix3x4Arrays*", CUtlVectorSimple.memory)
	end

	if not MatrixArrayBuffer or MatrixArrayBuffer == ffi.NULL then
		return
	end

	local HitboxSet = self:SetStudioHitbox(player["m_nHitboxSet"], StudioModel)
	if not HitboxSet or HitboxSet == ffi.NULL then
		return
	end

	local AddMatrix = function(colors, duration, hitgroup)
		local BoundBox = self:GetStudioHitbox(hitgroup, HitboxSet)
		if not BoundBox or BoundBox == ffi.NULL then
			return
		end

		if BoundBox.m_radius == - 1 then
			local RotationMatrix = self:AngleToMatrix(BoundBox.m_angle)
			if RotationMatrix and RotationMatrix ~= ffi.NULL then
				local MatrixBuffer = self:ConcatTransForMatrix(MatrixArrayBuffer[0].arrays[BoundBox.m_bone].m_flMatVal, RotationMatrix)
				if MatrixBuffer and MatrixBuffer ~= ffi.NULL then
					local BoundBoxAngles = self:MatrixToAngles(MatrixBuffer)
					if BoundBoxAngles and BoundBoxAngles ~= ffi.NULL then
						local MatrixOrigin = self:MatrixToOrigin(MatrixBuffer)
						if MatrixOrigin and MatrixOrigin ~= ffi.NULL then
							local BoxOverlayColor = box_color or colors
							if BoxOverlayColor.a > 0 then
								pcall(self.CHelpers.AddBoxOverlay, MatrixOrigin, BoundBox.m_mins, BoundBox.m_maxs, BoundBoxAngles, BoxOverlayColor.r or 255, BoxOverlayColor.g or 255, BoxOverlayColor.b or 255, math.clamp(BoxOverlayColor.a / 255, 0, 1), duration)
							end
						end
					end
				end
			end
		else
			local CapsuleOverlayBoxVector = {
				VecMins = self:VectorTransForMatrix(BoundBox.m_mins, MatrixArrayBuffer[0].arrays[BoundBox.m_bone].m_flMatVal),
				VecMaxs = self:VectorTransForMatrix(BoundBox.m_maxs, MatrixArrayBuffer[0].arrays[BoundBox.m_bone].m_flMatVal)
			}

			if CapsuleOverlayBoxVector.VecMins and CapsuleOverlayBoxVector.VecMaxs and CapsuleOverlayBoxVector.VecMins ~= ffi.NULL and CapsuleOverlayBoxVector.VecMaxs ~= ffi.NULL and colors.a > 0 then
				pcall(self.CHelpers.AddCapsuleOverlay, CapsuleOverlayBoxVector.VecMins, CapsuleOverlayBoxVector.VecMaxs, ffi.new("float[1]", BoundBox.m_radius), colors.r or 255, colors.g or 255, colors.b or 255, colors.a or 255, duration, 0, 1)
			end
		end
	end

	if not hitgroup then
		local SpecialHitGroupData = special_hitgroup
		for hitgroup = 0, HitboxSet.numhitboxes - 1 do
			if SpecialHitGroupData and (SpecialHitGroupData[1] - 1) == hitgroup and type(SpecialHitGroupData[2]) == "userdata" then
				AddMatrix(SpecialHitGroupData[2], duration, hitgroup)
			else
				AddMatrix(colors, duration, hitgroup)
			end
		end

	elseif type(hitgroup) == "number" then
		AddMatrix(colors, duration, hitgroup - 1)
	elseif type(hitgroup) == "table" then
		local SpecialHitGroupData = special_hitgroup
		for _, hitbox in pairs(hitgroup) do
			if (hitbox - 1) < (HitboxSet.numhitboxes - 1) then
				if SpecialHitGroupData and SpecialHitGroupData[1] == hitbox and type(SpecialHitGroupData[2]) == "userdata" then
					AddMatrix(SpecialHitGroupData[2], duration, hitbox - 1)
				else
					AddMatrix(colors, duration, hitbox - 1)
				end
			end
		end
	end
end

data.__index.RoundStart = function(self)
	self.PlayerData = {}
	self.SetPoseState = {}
	self.SetLayerState = {}
	self.SetPoseCached = {}
	self.SetLayerCached = {}
	self.SetOriginalState = {}
	self.CachedBodyYaw = {}
	self.PlayerRenderable = {}
	self.SetBodyYawState = {}
	self.SetOriginalCached = {}
	self.SetViewAnglesState = {}
	self.SetBodyYawCached = {}
	self.SetViewAnglesCached = {}
	self.SetArmsModelCached = {}
	self.RequestGetRenderable = {}
	self.SetPlayerModelCached = {}
	self.SetHitboxesPositionState = {}
	self.DrawPlayerModelCached = {}
	self.SetWeaponModelCached = {}
	self.EntityMatrixArraysCached = {}
	self.SetHitboxesPositionCached = {}
end

data.__index.NetUpdateAttachment = function(self)
	self.WeaponWorldEntity = {}
	for _, ptr in pairs(entity.get_players()) do
		local EntIndex = ptr:get_index()
		for _, WeaponWorldEntity in pairs(entity.get_entities("CBaseWeaponWorldModel")) do
			local WeaponWorldIndex = WeaponWorldEntity:get_index()
			if not self.WeaponWorldEntity[EntIndex] and bit.band(WeaponWorldEntity["moveparent"], bit.lshift(1, 12) - 1) == EntIndex then
				self.WeaponWorldEntity[EntIndex] = WeaponWorldIndex
			end
		end
	end
end

data.__index.NetUpdateTickbase = function(self)
	local local_player = entity.get_local_player()
	if not local_player or not local_player:is_alive() then
		return
	end

	local sim_time = local_player["m_flSimulationTime"]
	if not sim_time then
		return
	end

	local tick_count = globals.tickcount
	local shifted = math.max(unpack(self.AnimationData.Tickbase.List))
	self.AnimationData.Tickbase.Shifting = shifted < 0 and math.abs(shifted) or 0
	self.AnimationData.Tickbase.List[#self.AnimationData.Tickbase.List + 1] = sim_time / globals.tickinterval - tick_count
	table.remove(self.AnimationData.Tickbase.List, 1)
end

data.__index.AnglesControl = function(self)
	for entindex, angles in pairs(self.SetViewAnglesCached) do
		local Player = entity.get(entindex)
		local SetTickCount = self.SetViewAnglesState[entindex]
		if Player then
			local ViewAnglesPointer = self:GetClientEntity(Player, "ViewAngles*")
			if angles.x ~= - 999 then
				ViewAnglesPointer.pitch = math.clamp(angles.x, - 180, 180)
			end

			if angles.y ~= - 999 then
				ViewAnglesPointer.yaw = math.normalize_yaw(angles.y)
			end

			if angles.z ~= - 999 then
				ViewAnglesPointer.roll = math.clamp(angles.z, - 180, 180)
			end
		end

		if math.abs(globals.tickcount - SetTickCount) >= 6 then
			self.SetViewAnglesState[entindex] = nil
			self.SetViewAnglesCached[entindex] = nil
		end
	end
end

data.__index.Render = function(self)
	if not globals.is_in_game then
		for SteamID, data in pairs(self.HookedWeaponModelCached) do
			data.Vmt.UnHookAll()
			data.WorldVmt.UnHookAll()
			self.HookedWeaponModelCached[SteamID] = nil
		end

		for EntIndex, Cached in pairs(self.SetWeaponWorldModelVHelpers) do
			for WeaponIndex, data in pairs(Cached) do
				data.Vmt.UnHookAll()
				Cached[WeaponIndex] = nil
			end

			self.SetWeaponWorldModelVHelpers[EntIndex] = nil
		end

		return
	end
end

data.__index.WeaponModelMain = function(self)
	for entindex, data in pairs(self.SetWeaponModelCached) do
		local Player = entity.get(entindex)
		if Player and Player:is_player() then
			local PlayerInfo = Player:get_player_info()
			local Weapon = Player:get_player_weapon()
			local ViewModel = Player["m_hViewModel[0]"]
			local ResetTime = self:TimeToTicks(self.SetPlayerModelReset[entindex] or 0.5)
			if Weapon and ViewModel and not self.HookedWeaponModelCached[PlayerInfo.steamid64] then
				self.HookedWeaponModelCached[PlayerInfo.steamid64] = {}
				local ViewModelIBaseEntity = ffi.cast("void*", ViewModel[0])
				self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedIndex = {}
				self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedWorldIndex = {}
				local WorldModelBaseEntity = ffi.cast("void*", Weapon["m_hWeaponWorldModel"][0])
				self.HookedWeaponModelCached[PlayerInfo.steamid64].Vmt = self.CHelpers.CreateVmtHook(ViewModelIBaseEntity)
				self.HookedWeaponModelCached[PlayerInfo.steamid64].WorldVmt = self.CHelpers.CreateVmtHook(WorldModelBaseEntity)
				self.HookedWeaponModelCached[PlayerInfo.steamid64].SetModelIndex = self.HookedWeaponModelCached[PlayerInfo.steamid64].Vmt.HookMethod("void(__thiscall*)(void*, int)", function(this, index)
					for entindex, data in pairs(self.SetWeaponModelCached) do
						local Player = entity.get(entindex)
						if Player and Player:is_player() then
							local Weapon = Player:get_player_weapon()
							local ViewModel = Player["m_hViewModel[0]"]
							if ViewModel and Weapon then
								local WeaponIndex = Weapon:get_weapon_index()
								local ViewModelIBaseEntity = ffi.cast("void*", ViewModel[0])
								if not self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedIndex[WeaponIndex] then
									self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedIndex[WeaponIndex] = index
								end

								if data.index and not self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedIndex[data.index] then
									self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedIndex[data.index] = index
								end

								if data.index and this == ViewModelIBaseEntity then
									return self.HookedWeaponModelCached[PlayerInfo.steamid64].SetModelIndex(this, data.index)
								end
							end
						end
					end

					if self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedIndex[index] then
						return self.HookedWeaponModelCached[PlayerInfo.steamid64].SetModelIndex(this, self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedIndex[index])
					end

					return self.HookedWeaponModelCached[PlayerInfo.steamid64].SetModelIndex(this, index)
				end, 75)

				self.HookedWeaponModelCached[PlayerInfo.steamid64].SetWorldModelIndex = self.HookedWeaponModelCached[PlayerInfo.steamid64].WorldVmt.HookMethod("void(__thiscall*)(void*, int)", function(this, index)
					for entindex, data in pairs(self.SetWeaponModelCached) do
						local Player = entity.get(entindex)
						if Player and Player:is_player() then
							local Weapon = Player:get_player_weapon()
							if Weapon and data.world and data.world_index then
								local WorldModel = Weapon["m_hWeaponWorldModel"]
								if WorldModel then
									local WorldModelEntIndex = WorldModel:get_index()
									local WorldModelBaseEntity = ffi.cast("void*", WorldModel[0])
									if not self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedWorldIndex[WorldModelEntIndex] then
										self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedWorldIndex[WorldModelEntIndex] = index
									end

									if data.world_index and self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedWorldIndex[data.world_index] then
										self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedWorldIndex[data.world_index] = index
									end

									if this == WorldModelBaseEntity and data.world_index then
										return self.HookedWeaponModelCached[PlayerInfo.steamid64].SetWorldModelIndex(this, data.world_index)
									end
								end
							end
						end
					end

					if self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedWorldIndex[index] then
						return self.HookedWeaponModelCached[PlayerInfo.steamid64].SetWorldModelIndex(this, self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedWorldIndex[index])
					end

					return self.HookedWeaponModelCached[PlayerInfo.steamid64].SetWorldModelIndex(this, index)
				end, 75)
			end
		end
	end
end

data.__index.WeaponModelOverride = function(self)
	local WeaponOwner = {}
	for _, ptr in pairs(entity.get_entities("CBaseWeaponWorldModel")) do
		local WeaponOwnerIndex = bit.band(ptr["moveparent"], 4095)
		if WeaponOwnerIndex > 0 and WeaponOwnerIndex <= 64 then
			if not WeaponOwner[WeaponOwnerIndex] then
				WeaponOwner[WeaponOwnerIndex] = {}
			end

			table.insert(WeaponOwner[WeaponOwnerIndex], {
				WorldModelEntIndex = ptr:get_index(),
				CombatWeapon = ptr["m_hCombatWeaponParent"]
			})
		end
	end

	for entindex, data in pairs(self.SetWeaponModelCached) do
		local Player = entity.get(entindex)
		if Player and Player:is_player() then
			local PlayerInfo = Player:get_player_info()
			local Weapon = Player:get_player_weapon()
			local ViewModel = Player["m_hViewModel[0]"]
			if not self.SetWeaponWorldModelCached[entindex] then
				self.SetWeaponWorldModelCached[entindex] = {}
			elseif data.world and data.world_index and Weapon then
				local WeaponIndex = Weapon:get_weapon_index()
				if not self.SetWeaponWorldModelCached[entindex][WeaponIndex] then
					self.SetWeaponWorldModelCached[entindex][WeaponIndex] = {}
				end

				self.SetWeaponWorldModelCached[entindex][WeaponIndex].Status = true
				self.SetWeaponWorldModelCached[entindex][WeaponIndex].BaseModelIndex = data.index
				self.SetWeaponWorldModelCached[entindex][WeaponIndex].ModelIndex = data.world_index
			elseif not data.world or not data.world_index and Weapon then
				local WeaponIndex = Weapon:get_weapon_index()
				if not self.SetWeaponWorldModelCached[entindex][WeaponIndex] then
					self.SetWeaponWorldModelCached[entindex][WeaponIndex] = {}
				end

				self.SetWeaponWorldModelCached[entindex][WeaponIndex].Status = false
			end

			if data.world_drop and data.world_index and WeaponOwner[entindex] then
				for index, buffer in pairs(WeaponOwner[entindex]) do
					local BaseWorldModel = entity.get(buffer.WorldModelEntIndex)
					local BaseWorldModelCombat = entity.get(buffer.CombatWeapon)
					if BaseWorldModel and BaseWorldModelCombat then
						local WeaponIndex = BaseWorldModelCombat:get_weapon_index()
						if WeaponIndex == data.weapon_index then
							BaseWorldModel["m_nModelIndex"] = data.world_index
							BaseWorldModelCombat["m_iWorldModelIndex"] = data.world_index
							BaseWorldModelCombat["m_iWorldDroppedModelIndex"] = data.world_index
							if not self.SetWeaponWorldModelVHelpers[entindex] then
								self.SetWeaponWorldModelVHelpers[entindex] = {}
							elseif not self.SetWeaponWorldModelVHelpers[entindex][WeaponIndex] then
								self.SetWeaponWorldModelVHelpers[entindex][WeaponIndex] = {}
								self.SetWeaponWorldModelVHelpers[entindex][WeaponIndex].Vmt = self.CHelpers.CreateVmtHook(BaseWorldModelCombat[0])
								self.SetWeaponWorldModelVHelpers[entindex][WeaponIndex].SetModelIndex = self.SetWeaponWorldModelVHelpers[entindex][WeaponIndex].Vmt.HookMethod("void(__thiscall*)(void*, int)", function(this, index)
									local WeaponOwner = {}
									for _, ptr in pairs(entity.get_entities("CBaseWeaponWorldModel")) do
										local WeaponOwnerIndex = bit.band(ptr["moveparent"], 4095)
										if WeaponOwnerIndex > 0 and WeaponOwnerIndex <= 64 then
											if not WeaponOwner[WeaponOwnerIndex] then
												WeaponOwner[WeaponOwnerIndex] = {}
											end

											table.insert(WeaponOwner[WeaponOwnerIndex], {
												WorldModelEntIndex = ptr:get_index(),
												CombatWeapon = ptr["m_hCombatWeaponParent"]
											})
										end
									end

									for entindex, data in pairs(self.SetWeaponWorldModelCached) do
										for weapon_index, override in pairs(data) do
											local Player = entity.get(entindex)
											if override.Status and Player and Player:is_player() then
												local Weapon = Player:get_player_weapon()
												if Weapon and override.ModelIndex and WeaponOwner[entindex] then
													for index, buffer in pairs(WeaponOwner[entindex]) do
														local BaseWorldModelCombat = entity.get(buffer.CombatWeapon)
														if BaseWorldModelCombat then
															local CurrentWeaponIndex = Weapon:get_weapon_index()
															local ThisWeaponIndex = BaseWorldModelCombat:get_weapon_index()
															if weapon_index == ThisWeaponIndex and ffi.cast("void*", BaseWorldModelCombat[0]) == this then
																return self.SetWeaponWorldModelVHelpers[entindex][WeaponIndex].SetModelIndex(this, override.ModelIndex)
															elseif weapon_index == CurrentWeaponIndex and override.BaseModelIndex and ffi.cast("void*", Weapon[0]) == this then
																return self.SetWeaponWorldModelVHelpers[entindex][WeaponIndex].SetModelIndex(this, override.BaseModelIndex)
															end
														end
													end
												end
											end
										end
									end

									return self.SetWeaponWorldModelVHelpers[entindex][WeaponIndex].SetModelIndex(this, index)
								end, 75)
							end
						end
					end
				end
			end

			if math.abs(globals.tickcount - data.ticks) > 1 then
				if Weapon then
					local WeaponIndex = Weapon:get_weapon_index()
					local WeaponWorldModel = Weapon["m_hWeaponWorldModel"]
					if self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedIndex[WeaponIndex] then
						pcall(self.HookedWeaponModelCached[PlayerInfo.steamid64].SetModelIndex, ffi.cast("void*", ViewModel[0]), self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedIndex[WeaponIndex])
						self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedIndex[WeaponIndex] = nil
					end

					if WeaponWorldModel and self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedWorldIndex[WeaponWorldModel:get_index()] then
						pcall(self.HookedWeaponModelCached[PlayerInfo.steamid64].SetWorldModelIndex, ffi.cast("void*", WeaponWorldModel[0]), self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedIndex[WeaponIndex])
						self.HookedWeaponModelCached[PlayerInfo.steamid64].CachedIndex[WeaponIndex] = nil
					end

					if WeaponWorldModel and data.last_index ~= WeaponIndex and self.HookedWeaponModelCached[PlayerInfo.steamid64].SetWorldModelIndex then
						data.reset = 10
						data.last_index = WeaponIndex
					elseif WeaponWorldModel and data.reset > 0 and self.HookedWeaponModelCached[PlayerInfo.steamid64].SetWorldModelIndex then
						data.reset = data.reset - 1
						pcall(self.HookedWeaponModelCached[PlayerInfo.steamid64].SetWorldModelIndex, ffi.cast("void*", WeaponWorldModel[0]), data.world_index)
					end
				end

				self.SetWeaponModelCached[entindex] = nil
			end
		end
	end
end

data.__index.ModelOverride = function(self)
	for entindex, data in pairs(self.SetPlayerModelCached) do
		local Player = entity.get(entindex)
		if Player and Player:is_player() then
			Player["m_nModelIndex"] = data.index
			local m_hRagdoll = Player["m_hRagdoll"]
			local ResetTime = self:TimeToTicks(self.SetPlayerModelReset[entindex] or 0.5)
			if m_hRagdoll then
				m_hRagdoll["m_nModelIndex"] = data.index
			end

			if math.abs(globals.tickcount - data.ticks) > ResetTime then
				if data.original then
					Player["m_nModelIndex"] = data.original
				end

				if Player:is_alive() then
					self.ForceUpdateInvoke = true
				end

				self.SetPlayerModelCached[entindex] = nil
			end
		end
	end

	for entindex, data in pairs(self.SetArmsModelCached) do
		local Player = entity.get(entindex)
		if Player and Player:is_player() then
			self:GetModelIndex(data.model)
			local OverrideModel = self.SetPlayerModelCached[entindex]
			local ResetTime = self:TimeToTicks(self.SetPlayerModelReset[entindex] or 0.5)
			local PlayerModel = OverrideModel and OverrideModel.model or Player:get_model_name()
			if PlayerModel and PlayerModel:find(".mdl") then
				local ModelArmConfigs = self:GetViewModelArmsConfig(PlayerModel)
				if ModelArmConfigs then
					if not self.SetArmsModelOriginal[PlayerModel] then
						self.SetArmsModelOriginal[PlayerModel] = {
							szSkintoneIndex = ModelArmConfigs.szSkintoneIndex,
							szAssociatedGloveModel = ModelArmConfigs.szAssociatedGloveModel,
							szAssociatedSleeveModel = ModelArmConfigs.szAssociatedSleeveModel,
							szPlayerModelSearchSubStr = ModelArmConfigs.szPlayerModelSearchSubStr,
							szAssociatedSleeveModelEconOverride = ModelArmConfigs.szAssociatedSleeveModelEconOverride
						}

						utils.execute_after(0.35, common.force_full_update)
					elseif self.SetArmsModelOriginal[PlayerModel] then
						ModelArmConfigs.szAssociatedGloveModel = data.model
						if data.override_sleeve then
							ModelArmConfigs.szAssociatedSleeveModel = data.model
						end
					end
				end

				if math.abs(globals.tickcount - data.ticks) > ResetTime then
					if self.SetArmsModelOriginal[PlayerModel] then
						for Key, Original in pairs(self.SetArmsModelOriginal[PlayerModel]) do
							if ModelArmConfigs[Key] then
								ModelArmConfigs[Key] = Original
							end
						end
					end

					if Player:is_alive() then
						self.ForceUpdateInvoke = true
					end

					self.SetArmsModelCached[entindex] = nil
				end
			end
		end
	end

	if self.ForceUpdateInvoke then
		common.force_full_update()
		self.ForceUpdateInvoke = false
	end
end

data.__index.PlayersSimulation = function(self)
	local local_player = entity.get_local_player()
	if not globals.is_in_game then
		return
	end

	for _, ptr in pairs(entity.get_players()) do
		local origin = ptr:get_origin()
		local entindex = ptr:get_index()
		local simulation_time = ptr:get_simulation_time()
		local simulation_delta = self:TimeToTicks(simulation_time.current - simulation_time.old)
		if not self.PlayerData[entindex] then
			self.PlayerData[entindex] = {
				Lag = 0,
				Ticks = 0,
				Different = 0,
				Exploits = false,
				Teleport = false,
				PrevOrigin = origin,
				CurrentOrigin = origin
			}
		end

		self.PlayerData[entindex].CurrentOrigin = origin
		self.PlayerData[entindex].Ticks = simulation_delta - 1
		self.PlayerData[entindex].Exploits = simulation_delta < 0
		self.PlayerData[entindex].Different = (self.PlayerData[entindex].CurrentOrigin - self.PlayerData[entindex].PrevOrigin):lengthsqr()
		self.PlayerData[entindex].Teleport = self.PlayerData[entindex].Different > 4096
		if self.PlayerData[entindex].Ticks > 0 then
			self.PlayerData[entindex].Lag = self.PlayerData[entindex].Ticks
		end

		self.PlayerData[entindex].PrevOrigin = origin
	end
end

data.__index.UpdateClientSideAnimation = function(self, ptr, edx)
	for entindex, cached in pairs(self.SetBodyYawCached) do	
		local Player = entity.get(entindex)
		local SetTickcount = self.SetBodyYawState[entindex]
		if Player and Player:is_player() and Player:is_alive() then
			local Address = self:GetClientEntity(Player)
			if ptr == Address then
				local AnimState = self:GetAnimState(Player)
				if AnimState then
					AnimState.m_flGoalFeetYaw = math.normalize_yaw(AnimState.m_flEyeYaw + cached.angle)
					if cached.lowerbody and cached.lowerbody ~= - 999 then
						Player["m_flLowerBodyYawTarget"] = cached.lowerbody
					end
				end
			end
		end

		if math.abs(globals.tickcount - SetTickcount) >= 6 then
			self.SetBodyYawState[entindex] = nil
			self.SetBodyYawCached[entindex] = nil
		end
	end

	for entindex, cached in pairs(self.SetOriginalCached) do
		local Player = entity.get(entindex)
		local SetTickcount = self.SetOriginalState[entindex]
		if Player and Player:is_player() and Player:is_alive() then
			local Address = self:GetClientEntity(Player)
			if ptr == Address then
				local Original = ffi.new("Vector")
				Original.x, Original.y, Original.z = cached.x, cached.y, cached.z
				self.CHelpers.OverrideAbsOrigin(Address, Original)
			end
		end

		if math.abs(globals.tickcount - SetTickcount) >= 6 then
			self.SetOriginalState[entindex] = nil
			self.SetOriginalCached[entindex] = nil
		end
	end

	for _, Player in pairs(entity.get_players()) do
		local Address = self:GetClientEntity(Player)
		if ptr == Address then
			events["PreClientSideAnimationUpdate"]:call(Player)
			for Index, CallBack in pairs(self.CallBackHookerList["PreClientSideAnimationUpdate"]) do
				if __DEBUG then
					local Successed, ErrorTrack = pcall(CallBack, Player)
					if not Successed then
						print_raw(("\aFF0000[%s]CallBack: PreClientSideAnimationUpdate, Error: %s"):format(self.LibraryName, ErrorTrack))
						self.CallBackHookerList["PreClientSideAnimationUpdate"][Index] = nil
					end
				else
					pcall(CallBack, Player)
				end
			end
		end
	end

	pcall(self.Hooker, ptr, edx)
	local local_player = entity.get_local_player()
	for entindex, cached in pairs(self.SetHitboxesPositionCached) do
		local Player = entity.get(entindex)
		local SetTickcountList = self.SetHitboxesPositionState[entindex]
		if Player and Player:is_player() and Player:is_alive() then
			local Address = self:GetClientEntity(Player)
			if ptr == Address then
				for hitboxes, position in pairs(cached) do
					local SetTickcount = SetTickcountList[hitboxes]
					local BoundBox = self:GetPlayerHitboxStudioBoundBox(Player, hitboxes)
					if BoundBox then
						local BoneMatrix = self:GetPlayerBoneMatrix(Player, BoundBox.m_bone)
						if BoneMatrix then
							BoneMatrix[3] = position.x
							BoneMatrix[7] = position.y
							BoneMatrix[11] = position.z
						end
					end

					if math.abs(globals.tickcount - SetTickcount) >= 6 then
						self.SetHitboxesPositionState[entindex][hitboxes] = nil
						self.SetHitboxesPositionCached[entindex][hitboxes] = nil
					end
				end
			end
		end
	end

	for entindex, cached in pairs(self.SetPoseCached) do
		local Player = entity.get(entindex)
		local SetTickcountList = self.SetPoseState[entindex]
		if Player and Player:is_player() and Player:is_alive() then
			local Address = self:GetClientEntity(Player)
			if ptr == Address then
				local poseparameter = Player["m_flPoseParameter"]
				for pose_index, percentage in pairs(cached) do
					poseparameter[pose_index] = percentage
					local SetTickcount = SetTickcountList[pose_index]
					if math.abs(globals.tickcount - SetTickcount) >= 6 then
						self.SetPoseState[entindex][pose_index] = nil
						self.SetPoseCached[entindex][pose_index] = nil
					end
				end
			end
		end
	end

	for entindex, cached in pairs(self.SetLayerCached) do
		local Player = entity.get(entindex)
		local SetTickcountList = self.SetLayerState[entindex]
		if Player and Player:is_player() and Player:is_alive() then
			local Address = self:GetClientEntity(Player)
			if ptr == Address then
				local AnimLayer = self:GetAnimLayer(Player)
				if AnimLayer then
					for layer_index, data in pairs(cached) do
						local anim_layer = AnimLayer[layer_index]
						local SetTickcount = SetTickcountList[layer_index]
						if data.weight and data.weight ~= - 999 then
							anim_layer.weight = data.weight
						end

						if data.cycle == false then
							anim_layer.cycle = 1
						elseif data.cycle ~= - 999 then
							anim_layer.cycle = data.cycle
						end

						if data.sequence and data.sequence ~= - 999 then
							anim_layer.sequence = data.sequence
						end

						if math.abs(globals.tickcount - SetTickcount) >= 6 then
							self.SetLayerState[entindex][layer_index] = nil
							self.SetLayerCached[entindex][layer_index] = nil
						end
					end
				end
			end
		end
	end

	for _, Player in pairs(entity.get_players()) do
		local Address = self:GetClientEntity(Player)
		if ptr == Address then
			events["PostClientSideAnimationUpdate"]:call(Player)
			for Index, CallBack in pairs(self.CallBackHookerList["PostClientSideAnimationUpdate"]) do
				if __DEBUG then
					local Successed, ErrorTrack = pcall(CallBack, Player)
					if not Successed then
						print_raw(("\aFF0000[%s]CallBack: PostClientSideAnimationUpdate, Error: %s"):format(self.LibraryName, ErrorTrack))
						self.CallBackHookerList["PostClientSideAnimationUpdate"][Index] = nil
					end
				else
					pcall(CallBack, Player)
				end
			end
		end
	end
end

data.__index.RegistrationInLineHooked = function(self)
	if not self.Hooker then
		local UpdateClientSideAnimationAddress = ffi.cast("uintptr_t", utils.opcode_scan("client.dll", "8B F1 80 BE ? ? ? ? ? 74 36", - 5))
		self.Hooker = self.CHelpers.InLineHooked("void(__fastcall*)(void*, void*)", function(ptr, edx)
			local Successed, Arg = pcall(function()
				self:UpdateClientSideAnimation(ptr, edx)
			end)

			if not Successed and self.Successed then
				self.Successed = false
				common.unload_script()
				print_raw(("\aFF0000[%s]Failed inside update client side animation callback, result: %s"):format(self.LibraryName, Arg))
			end

		end, UpdateClientSideAnimationAddress)
	end
end

data.__index.SetupMovementUpdate = function(self, e)
	local local_player = entity.get_local_player()
	if not local_player or not local_player:is_alive() then
		return
	end

	local Curtime = globals.curtime
	local Tickinterval = globals.tickinterval
	local Address = self:GetClientEntity(local_player)
	if not Address then
		return
	end

	local Weapon = local_player:get_player_weapon()
	local AnimLayer = self:GetAnimLayer(local_player)
	local AnimState = self:GetNewAnimState(Address)
	if not Weapon or not AnimState or not AnimLayer then
		return
	end

	if AnimState.anim_update_timer <= 0.0 then
		self.Speed = 0
		self.EyeAnglesY = nil
		self.DuckAmount = 0
		self.SrvGoalFeetYaw = nil
		self.StopToFullRunningFraction = 0
		self.AnimationData = self.OriginalData
		return
	end

	if not self.EyeAnglesY or not self.SrvGoalFeetYaw then
		self.EyeAnglesY = AnimState.eye_angles_y
		self.SrvGoalFeetYaw = AnimState.goal_feet_yaw
	end

	if e.choked_commands == 0 then
		self.EyeAnglesY = AnimState.eye_angles_y
		self.DuckAmount = AnimState.duck_amount
		local Velocity = local_player["m_vecVelocity"]
		self.StopToFullRunningFraction = AnimState.stop_to_full_running_fraction
		self.CHelpers.EstimateAbsVelocity(Address, self.AnimationData.AbsVelocity)
		local AbsVelocity = vector(self.AnimationData.AbsVelocity[0], self.AnimationData.AbsVelocity[1], self.AnimationData.AbsVelocity[2])
		if AbsVelocity:lengthsqr() > math.pow(1.2 * 260, 2) then
			local VelocityNormalized = AbsVelocity:normalized()
			AbsVelocity = VelocityNormalized * (1.2 * 260)
		end

		AbsVelocity.z = 0
		local SmoothedVelocity = self:GetSmoothedVelocity(Tickinterval * 2000, AbsVelocity, Velocity)
		data.Speed = math.min(SmoothedVelocity:length(), 260)
	end

	local LowerBody = AnimLayer[3]
	local MaxMovementSpeed = math.max(Weapon:get_max_speed(), 0.001)
	local RunningSpeed = math.clamp(self.Speed / (MaxMovementSpeed * 0.520), 0, 1)
	local YawModifier = (((self.StopToFullRunningFraction * - 0.3) - 0.2) * RunningSpeed) + 1
	if self.DuckAmount > 0 then
		local DuckingSpeed = math.clamp(self.Speed / (MaxMovementSpeed * 0.340), 0, 1)
		YawModifier = YawModifier + ((self.DuckAmount * DuckingSpeed) * (0.5 - YawModifier))
	end

	self.SrvGoalFeetYaw = math.clamp(self.SrvGoalFeetYaw, - 360, 360)
	local EyeFeetDelta = self:AngleDifferent(self.EyeAnglesY, self.SrvGoalFeetYaw)
	local MaxYawModifier, MinYawModifier = YawModifier * 58, YawModifier * - 58
	if EyeFeetDelta <= MaxYawModifier then
		if MinYawModifier > EyeFeetDelta then
			self.SrvGoalFeetYaw = math.abs(MinYawModifier) + self.EyeAnglesY
		end
	else
		self.SrvGoalFeetYaw = self.EyeAnglesY - math.abs(MaxYawModifier)
	end

	if self.Speed > 0.1 then
		self.SrvGoalFeetYaw = self:ApproachAngle(
			self.EyeAnglesY,
			math.normalize_yaw(self.SrvGoalFeetYaw),
			((self.StopToFullRunningFraction * 20) + 30) * Tickinterval
		)
	else
		self.SrvGoalFeetYaw = self:ApproachAngle(
			local_player["m_flLowerBodyYawTarget"],
			math.normalize_yaw(self.SrvGoalFeetYaw),
			Tickinterval * 100
		)
	end

	if not self.AnimationData.BalanceAdjust.Updating then
		self.AnimationData.BalanceAdjust.NextUpdate = Curtime + 0.22
	elseif self:GetSequenceActivity(local_player, LowerBody.sequence) == 979 then
		if self.AnimationData.BalanceAdjust.NextUpdate < Curtime and LowerBody.weight > 0.000 then
			self.AnimationData.BalanceAdjust.NextUpdate = Curtime + 1.1
		end
	end

	if e.choked_commands == 0 then
		self.AnimationData.AbsYaw = AnimState.eye_angles_y
		self.AnimationData.FeetYaw = AnimState.goal_feet_yaw
		self.AnimationData.ServerFeetYaw = self.SrvGoalFeetYaw
		local BodyLean = math.abs(self:AngleDifferent(AnimState.eye_angles_y, AnimState.goal_feet_yaw))
		self.AnimationData.DesyncExact = self:AngleDifferent(data.SrvGoalFeetYaw, AnimState.goal_feet_yaw)
		self.AnimationData.DesyncDelta = math.clamp(self.AnimationData.DesyncExact, - BodyLean, BodyLean)
		self.AnimationData.BalanceAdjust.Updating = AnimState.on_ground and AnimState.m_velocity < 0.1 and AnimState.anim_update_timer > 0.0
	end
end

data.__index.UpdateOverrideView = function(self, pred, original, override)
	if original.fov ~= override.fov then
		if type(override.fov) ~= "number" then
			print_raw(("\aFF0000[%s]CallBack: %s, Error: Fov Is Not Valid Number"):format(self.LibraryName, pred and "PreOverrideView" or "PostOverrideView"))
			return
		end

		original.fov = override.fov
	end

	if original.viewmodel_fov ~= override.view_fov then
		if type(override.view_fov) ~= "number" then
			print_raw(("\aFF0000[%s]CallBack: %s, Error: View Fov Is Not Valid Number"):format(self.LibraryName, pred and "PreOverrideView" or "PostOverrideView"))
			return
		end

		original.viewmodel_fov = override.view_fov
	end

	if type(override.screen) ~= "userdata" then
		print_raw(("\aFF0000[%s]CallBack: %s, Error: Screen Is Not Valid Vector"):format(self.LibraryName, pred and "PreOverrideView" or "PostOverrideView"))
		return
	elseif override.screen.x and override.screen.y then
		if original.width ~= override.screen.x then
			original.width = override.screen.x
		end

		if original.height ~= override.screen.y then
			original.height = override.screen.y
		end
	end

	if type(override.view) ~= "userdata" then
		print_raw(("\aFF0000[%s]CallBack: %s, Error: View Is Not Valid Vector"):format(self.LibraryName, pred and "PreOverrideView" or "PostOverrideView"))
		return
	elseif override.view.x and override.view.y and override.view.z then
		if original.origin.x ~= override.view.x then
			original.origin.x = override.view.x
		end

		if original.origin.y ~= override.view.y then
			original.origin.y = override.view.y
		end

		if original.origin.z ~= override.view.z then
			original.origin.z = override.view.z
		end
	end

	if type(override.camera) ~= "userdata" then
		print_raw(("\aFF0000[%s]CallBack: %s, Error: Camera Is Not Valid Vector"):format(self.LibraryName, pred and "PreOverrideView" or "PostOverrideView"))
		return
	elseif override.camera.x and override.camera.y and override.camera.z then
		if original.angles.x ~= override.camera.x then
			original.angles.x = override.camera.x
		end

		if original.angles.y ~= override.camera.y then
			original.angles.y = override.camera.y
		end

		if original.angles.z ~= override.camera.z then
			original.angles.z = override.camera.z
		end
	end
end

data.__index.HookOverrideView = function(self)
	if not self.ClientSideAnimationHooks["OverrideView"] then
		self.ClientSideAnimationHooks["OverrideView"] = self.CHelpers.InLineHooked("void(__fastcall*)(void*, void*, CViewSetup*)", function(ecx, edx, e)
			local PreOverrideViewContext = setmetatable({
				fov = e.fov,
				view_fov = e.viewmodel_fov,
				screen = vector(e.width, e.height),
				view = vector(e.origin.x, e.origin.y, e.origin.z),
				camera = vector(e.angles.x, e.angles.y, e.angles.z)
			}, {
				__tostring = function()
					return ("userdata: 0x%s"):format(self.CHelpers.OverrideViewAddress)
				end
			})

			events["PreOverrideView"]:call(PreOverrideViewContext)
			for Index, CallBack in pairs(self.CallBackHookerList["PreOverrideView"]) do
				if __DEBUG then
					local Successed, ErrorTrack = pcall(CallBack, PreOverrideViewContext)
					if not Successed then
						print_raw(("\aFF0000[%s]CallBack: PreOverrideView, Error: %s"):format(self.LibraryName, ErrorTrack))
						self.CallBackHookerList["PreOverrideView"][Index] = nil
					end
				else
					pcall(CallBack, PreOverrideViewContext)
				end
			end

			self:UpdateOverrideView(true, e, PreOverrideViewContext)
			pcall(self.ClientSideAnimationHooks["OverrideView"], ecx, edx, e)
			local PostOverrideViewContext = setmetatable({
				fov = e.fov,
				view_fov = e.viewmodel_fov,
				screen = vector(e.width, e.height),
				view = vector(e.origin.x, e.origin.y, e.origin.z),
				camera = vector(e.angles.x, e.angles.y, e.angles.z)
			}, {
				__tostring = function()
					return ("userdata: 0x%s"):format(self.CHelpers.OverrideViewAddress)
				end
			})

			events["PostOverrideView"]:call(PostOverrideViewContext)
			for Index, CallBack in pairs(self.CallBackHookerList["PostOverrideView"]) do
				if __DEBUG then
					local Successed, ErrorTrack = pcall(CallBack, PostOverrideViewContext)
					if not Successed then
						print_raw(("\aFF0000[%s]CallBack: PostOverrideView, Error: %s"):format(self.LibraryName, ErrorTrack))
						self.CallBackHookerList["PostOverrideView"][Index] = nil
					end
				else
					pcall(CallBack, PostOverrideViewContext)
				end
			end

			self:UpdateOverrideView(false, e, PostOverrideViewContext)
		end, self.CHelpers.OverrideViewAddress)
	end
end

data.__index.StudioRenderHook = function(self)
	if not self.DrawModel then
		self.DrawModel = self.CHelpers.CreateVmtHook(self.CHelpers.StudioRender).HookMethod("void(__thiscall*)(void*, void*, DrawModelInfo&, Matrix3x4Arrays*, float*, float*, Vector*, const int32_t)", function(this, results, info, bones, flex_weights, flex_delayed_weights, origin, flags)
			local EntIndex = - 1
			local Success, Arg = pcall(function()
				if info.renderable and info.renderable ~= ffi.NULL then
					local IsOverride = false
					if not self.IGetClientUnknown or self.IGetClientUnknown == ffi.NULL then
						self.IGetClientUnknown = ffi.cast("void***(__thiscall*)(void*)", info.renderable[0][0])
						self.IGetClientNetworkable = ffi.cast("void***(__thiscall*)(void*)", self.IGetClientUnknown(info.renderable)[0][4])
						self.IGetEntIndex = ffi.cast("int(__thiscall*)(void*)", self.IGetClientNetworkable(self.IGetClientUnknown(info.renderable))[0][10])
						self.GetEntIndexFromRenderable = function(self, renderable)
							if not renderable or renderable == ffi.NULL then
								return - 1
							end

							local ClientUnknown = self.IGetClientUnknown(renderable)
							if not ClientUnknown or ClientUnknown == ffi.NULL then
								return - 1
							end

							local ClientNetworkable = self.IGetClientNetworkable(ClientUnknown)
							if not ClientNetworkable or ClientNetworkable == ffi.NULL then
								return - 1
							end

							return self.IGetEntIndex(ClientNetworkable)
						end

						return self.DrawModel(this, results, info, bones, flex_weights, flex_delayed_weights, origin, flags)
					end

					EntIndex = self:GetEntIndexFromRenderable(info.renderable)
					if EntIndex ~= - 1 and self.RequestGetRenderable[EntIndex] then
						self.PlayerRenderable[EntIndex] = info.renderable
						self.EntityMatrixArraysCached[EntIndex] = self:CopyMatrixArrays(bones)
						if math.abs(globals.tickcount - self.RequestGetRenderable[EntIndex]) > 6 then
							self.RequestGetRenderable[EntIndex] = nil
						end
					end

					for index, data in pairs(self.DrawPlayerModelCached) do
						local ClientRenderable = self.PlayerRenderable[index]
						local AttachmentClientRenderable = self.PlayerRenderable[data.attachment]	
						local IsEntity = ClientRenderable and ClientRenderable ~= ffi.NULL and ClientRenderable == info.renderable
						local IsAttachment = data.attachment ~= - 1 and AttachmentClientRenderable and AttachmentClientRenderable ~= ffi.NULL and AttachmentClientRenderable == info.renderable
						if IsEntity or IsAttachment then
							IsOverride = true
							if IsEntity and data.draw_original then
								self.DrawModel(this, results, info, bones, flex_weights, flex_delayed_weights, origin, flags)
							end

							local PlayerMatrix = self:AutoAddMatrix(data.matrix)
							if PlayerMatrix then
								local MatrixBuffer = self:PasteMatrixArrays(PlayerMatrix)
								if MatrixBuffer and MatrixBuffer ~= ffi.NULL and ffi.istype("Matrix3x4Arrays", MatrixBuffer) then
									local CurrentMaterialGroupName = ""
									local CurrentMaterialName = data.material
									local MatrixAddress = ffi.cast("Matrix3x4Arrays*", MatrixBuffer)
									if type(data.material) == "userdata" and data.material:is_valid() then
										CurrentMaterialName = data.material:get_name()
										CurrentMaterialGroupName = data.material:get_texture_group_name()
									end

									if CurrentMaterialName and type(CurrentMaterialName) == "string" then
										if not self.MaterialCached[CurrentMaterialName] then
											local Material = self.CHelpers.FindMaterial(CurrentMaterialName, CurrentMaterialGroupName, true, "")
											self.MaterialCached[CurrentMaterialName] = {
												Material = Material,
												ModulateAlpha = self:GetVtableFunc(Material, 27, "void(__thiscall*)(void*, float)"),
												ModulateColor = self:GetVtableFunc(Material, 28, "void(__thiscall*)(void*, float, float, float)")
											}

										elseif self.MaterialCached[CurrentMaterialName] and self.MaterialCached[CurrentMaterialName].Material ~= ffi.NULL then
											self.CHelpers.ForcedMaterialOverride(self.MaterialCached[CurrentMaterialName].Material, 0, - 1)
										end
									end

									if data.color then
										self.CHelpers.SetAlphaModulation(math.clamp(data.color.a / 255, 0, 1))
										self.CHelpers.SetColorModulation(ffi.new("float[3]", math.clamp(data.color.r / 255, 0, 1), math.clamp(data.color.g / 255, 0, 1), math.clamp(data.color.b / 255, 0, 1)))
										if CurrentMaterialName and self.MaterialCached[CurrentMaterialName] and self.MaterialCached[CurrentMaterialName].Material ~= ffi.NULL then
											self.MaterialCached[CurrentMaterialName].ModulateAlpha(math.clamp(data.color.a / 255, 0, 1))
											self.MaterialCached[CurrentMaterialName].ModulateColor(math.clamp(data.color.r / 255, 0, 1), math.clamp(data.color.g / 255, 0, 1), math.clamp(data.color.b / 255, 0, 1))
										end
									end

									if IsEntity then
										self.DrawModel(this, results, info, MatrixAddress, flex_weights, flex_delayed_weights, origin, flags)
									elseif IsAttachment then
										local AttachmentMatrix = self:AutoAddMatrix(data.attachment_matrix)
										if AttachmentMatrix then
											local MatrixBuffer = self:PasteMatrixArrays(AttachmentMatrix)
											if MatrixBuffer and MatrixBuffer ~= ffi.NULL and ffi.istype("Matrix3x4Arrays", MatrixBuffer) then
												local MatrixAddress = ffi.cast("Matrix3x4Arrays*", MatrixBuffer)
												self.DrawModel(this, results, info, MatrixAddress, flex_weights, flex_delayed_weights, origin, flags)
											end
										end
									end
								end
							end
						end

						if math.abs(globals.tickcount - data.tick) >= 6 then
							self.DrawPlayerModelCached[index] = nil
						end
					end
				end
			end)

			if not Success then
				print_raw(("[%s] error: \aFF00FF%s"):format(self.LibraryName, Arg))
			end

			local Success, Result = pcall(function()
				local PreDrawModelContext = setmetatable({
					entity = nil,
					entindex = EntIndex,
					draw_original = true,
					name = ffi.string(info.studio_hdr.name),
				}, {
					__tostring = function(this)
						return ("PreDrawModel: Context"):format(this.name)
					end,

					__index = function(this, key)
						if key == "GetOrigin" then
							return vector(origin.x, origin.y, origin.z)
						elseif key == "GetMatrix" then
							return self:CopyMatrixArrays(bones)
						elseif key == "GetModel" and self.entindex ~= - 1 then
							return self:GetModel(entity.get(this.entindex))
						elseif key == "GetSudioHandle" then
							return info.studio_hdr
						elseif key == "GetDrawModelInfo" then
							return info
						elseif key == "Override" then
							return function(this, material, color)
								local MaterialsName = material
								local MaterialsGroupName = ""
								if type(material) == "userdata" and material:is_valid() then
									MaterialsName = material:get_name()
									MaterialsGroupName = material:get_texture_group_name()
								end

								if MaterialsName and type(MaterialsName) == "string" then
									if not self.MaterialCached[MaterialsName] then
										local CMaterial = self.CHelpers.FindMaterial(MaterialsName, MaterialsGroupName, true, "")
										self.MaterialCached[MaterialsName] = {
											Material = CMaterial,
											ModulateAlpha = self:GetVtableFunc(CMaterial, 27, "void(__thiscall*)(void*, float)"),
											ModulateColor = self:GetVtableFunc(CMaterial, 28, "void(__thiscall*)(void*, float, float, float)")
										}

										return false
									elseif self.MaterialCached[MaterialsName] and self.MaterialCached[MaterialsName].Material ~= ffi.NULL then
										self.CHelpers.SetAlphaModulation(math.clamp(color.a / 255, 0, 1))
										self.CHelpers.SetColorModulation(ffi.new("float[3]", math.clamp(color.r / 255, 0, 1), math.clamp(color.g / 255, 0, 1), math.clamp(color.b / 255, 0, 1)))
										if color and type(color) == "userdata" then
											self.MaterialCached[MaterialsName].ModulateAlpha(math.clamp(color.a / 255, 0, 1))
											self.MaterialCached[MaterialsName].ModulateColor(math.clamp(color.r / 255, 0, 1), math.clamp(color.g / 255, 0, 1), math.clamp(color.b / 255, 0, 1))
										end

										self.CHelpers.ForcedMaterialOverride(self.MaterialCached[MaterialsName].Material, 0, - 1)
										self.DrawModel(this, results, info, bones, flex_weights, flex_delayed_weights, origin, flags)
									end
								end
							end
						end
					end
				})

				if EntIndex ~= - 1 then
					PreDrawModelContext.entity = entity.get(EntIndex)
				end

				events["PreDrawModel"]:call(PreDrawModelContext)
				for Index, CallBack in pairs(self.CallBackHookerList["PreDrawModel"]) do
					if __DEBUG then
						local Successed, ErrorTrack = pcall(CallBack, PreDrawModelContext)
						if not Successed then
							print_raw(("\aFF0000[%s]CallBack: PreDrawModel, Error: %s"):format(self.LibraryName, ErrorTrack))
							self.CallBackHookerList["PreDrawModel"][Index] = nil
						elseif Successed and type(ErrorTrack) == "boolean" then
							PreDrawModelContext.draw_original = ErrorTrack
						end
					else
						local Successed, Result = pcall(CallBack, PreDrawModelContext)
						if Successed and type(Result) == "boolean" then
							PreDrawModelContext.draw_original = Result
						end
					end
				end

				if PreDrawModelContext.draw_original then
					self.DrawModel(this, results, info, bones, flex_weights, flex_delayed_weights, origin, flags)
				end

				local PostDrawModelContext = setmetatable({
					entity = nil,
					entindex = EntIndex,
					draw_original = true,
					name = ffi.string(info.studio_hdr.name),
				}, {
					__tostring = function(this)
						return ("PostDrawModel: Context"):format(this.name)
					end,

					__index = function(this, key)
						if key == "GetOrigin" then
							return vector(origin.x, origin.y, origin.z)
						elseif key == "GetMatrix" then
							return self:CopyMatrixArrays(bones)
						elseif key == "GetModel" and self.entindex ~= - 1 then
							return self:GetModel(entity.get(this.entindex))
						elseif key == "GetSudioHandle" then
							return info.studio_hdr
						elseif key == "GetDrawModelInfo" then
							return info
						elseif key == "Override" then
							return function(this, material, color)
								local MaterialsName = material
								local MaterialsGroupName = ""
								if type(material) == "userdata" and material:is_valid() then
									MaterialsName = material:get_name()
									MaterialsGroupName = material:get_texture_group_name()
								end

								if MaterialsName and type(MaterialsName) == "string" then
									if not self.MaterialCached[MaterialsName] then
										local CMaterial = self.CHelpers.FindMaterial(MaterialsName, MaterialsGroupName, true, "")
										self.MaterialCached[MaterialsName] = {
											Material = CMaterial,
											ModulateAlpha = self:GetVtableFunc(CMaterial, 27, "void(__thiscall*)(void*, float)"),
											ModulateColor = self:GetVtableFunc(CMaterial, 28, "void(__thiscall*)(void*, float, float, float)")
										}

										return false
									elseif self.MaterialCached[MaterialsName] and self.MaterialCached[MaterialsName].Material ~= ffi.NULL then
										self.CHelpers.SetAlphaModulation(math.clamp(color.a / 255, 0, 1))
										self.CHelpers.SetColorModulation(ffi.new("float[3]", math.clamp(color.r / 255, 0, 1), math.clamp(color.g / 255, 0, 1), math.clamp(color.b / 255, 0, 1)))
										if color and type(color) == "userdata" then
											self.MaterialCached[MaterialsName].ModulateAlpha(math.clamp(color.a / 255, 0, 1))
											self.MaterialCached[MaterialsName].ModulateColor(math.clamp(color.r / 255, 0, 1), math.clamp(color.g / 255, 0, 1), math.clamp(color.b / 255, 0, 1))
										end

										self.CHelpers.ForcedMaterialOverride(self.MaterialCached[MaterialsName].Material, 0, - 1)
										self.DrawModel(this, results, info, bones, flex_weights, flex_delayed_weights, origin, flags)
									end
								end
							end
						end
					end
				})

				if EntIndex ~= - 1 then
					PostDrawModelContext.entity = entity.get(EntIndex)
				end

				events["PostDrawModel"]:call(PostDrawModelContext)
				for Index, CallBack in pairs(self.CallBackHookerList["PostDrawModel"]) do
					if __DEBUG then
						local Successed, ErrorTrack = pcall(CallBack, PostDrawModelContext)
						if not Successed then
							print_raw(("\aFF0000[%s]CallBack: PostDrawModel, Error: %s"):format(self.LibraryName, ErrorTrack))
							self.CallBackHookerList["PostDrawModel"][Index] = nil
						end
					else
						pcall(CallBack, PostDrawModelContext)
					end
				end
			end)

			if not Success then
				print_raw(("[%s] error: \aFF00FF%s"):format(self.LibraryName, Result))
			end
		end, 29)
	end
end

data.__index.HookClientSideAnimating = function(self)
	local local_player = entity.get_local_player()
	if not local_player or not local_player:is_alive() then
		return
	end

	local Address = self:GetClientEntity(local_player)
	if Address then
		if self.ProcessedStudioFrameAdvance and not self.ClientSideAnimationHooks["StudioFrameAdvance"] then
			local CBasePlayer = self.CHelpers.CreateVmtHook(Address)
			self.ClientSideAnimationHooks["StudioFrameAdvance"] = CBasePlayer.HookMethod("void(__fastcall*)(void*, void*)", function(ptr, edx)
				for _, Player in pairs(entity.get_players()) do
					local Address = self:GetClientEntity(Player)
					if ptr == Address then
						events["PreStudioFrameAdvance"]:call(Player)
						for Index, CallBack in pairs(self.CallBackHookerList["PreStudioFrameAdvance"]) do
							if __DEBUG then
								local Successed, ErrorTrack = pcall(CallBack, Player)
								if not Successed then
									print_raw(("\aFF0000[%s]CallBack: PreStudioFrameAdvance, Error: %s"):format(self.LibraryName, ErrorTrack))
									self.CallBackHookerList["PreStudioFrameAdvance"][Index] = nil
								end
							else
								pcall(CallBack, Player)
							end
						end
					end
				end

				pcall(self.ClientSideAnimationHooks["StudioFrameAdvance"], ptr, edx)
				for _, Player in pairs(entity.get_players()) do
					local Address = self:GetClientEntity(Player)
					if ptr == Address then
						events["PostStudioFrameAdvance"]:call(Player)
						for Index, CallBack in pairs(self.CallBackHookerList["PostStudioFrameAdvance"]) do
							if __DEBUG then
								local Successed, ErrorTrack = pcall(CallBack, Player)
								if not Successed then
									print_raw(("\aFF0000[%s]CallBack: PostStudioFrameAdvance, Error: %s"):format(self.LibraryName, ErrorTrack))
									self.CallBackHookerList["PostStudioFrameAdvance"][Index] = nil
								end
							else
								pcall(CallBack, Player)
							end
						end
					end
				end
			end, 220)
		end

		if self.ProcessedModelUpdate and not self.ClientSideAnimationHooks["ModelUpdate"] then
			local CBasePlayer = self.CHelpers.CreateVmtHook(Address)
			self.ClientSideAnimationHooks["ModelUpdate"] = CBasePlayer.HookMethod("void(__fastcall*)(void*, void*, int)", function(ptr, edx, index)
				events["PreSetModel"]:call(ptr, index)
				for Index, CallBack in pairs(self.CallBackHookerList["PreSetModel"]) do
					if __DEBUG then
						local Successed, ErrorTrack = pcall(CallBack, ptr, index)
						if not Successed then
							print_raw(("\aFF0000[%s]CallBack: PreSetModel, Error: %s"):format(self.LibraryName, ErrorTrack))
							self.CallBackHookerList["PreSetModel"][Index] = nil
						end
					else
						pcall(CallBack, ptr, index)
					end
				end

				for _, Player in pairs(entity.get_players()) do
					local Address = self:GetClientEntity(Player)
					if ptr == Address then
						events["PreModelUpdate"]:call(Player, index)
						for Index, CallBack in pairs(self.CallBackHookerList["PreModelUpdate"]) do
							if __DEBUG then
								local Successed, ErrorTrack = pcall(CallBack, Player, index)
								if not Successed then
									print_raw(("\aFF0000[%s]CallBack: PreModelUpdate, Error: %s"):format(self.LibraryName, ErrorTrack))
									self.CallBackHookerList["PreModelUpdate"][Index] = nil
								end
							else
								pcall(CallBack, Player, index)
							end
						end
					end
				end

				pcall(self.ClientSideAnimationHooks["ModelUpdate"], ptr, edx, index)
				for Index, CallBack in pairs(self.CallBackHookerList["PostSetModel"]) do
					if __DEBUG then
						local Successed, ErrorTrack = pcall(CallBack, ptr, index)
						if not Successed then
							print_raw(("\aFF0000[%s]CallBack: PostSetModel, Error: %s"):format(self.LibraryName, ErrorTrack))
							self.CallBackHookerList["PostSetModel"][Index] = nil
						end
					else
						pcall(CallBack, ptr, index)
					end
				end

				events["PostSetModel"]:call(ptr, index)
				for _, Player in pairs(entity.get_players()) do
					local Address = self:GetClientEntity(Player)
					if ptr == Address then
						events["PostModelUpdate"]:call(Player, index)
						for Index, CallBack in pairs(self.CallBackHookerList["PostModelUpdate"]) do
							if __DEBUG then
								local Successed, ErrorTrack = pcall(CallBack, Player, index)
								if not Successed then
									print_raw(("\aFF0000[%s]CallBack: PostModelUpdate, Error: %s"):format(self.LibraryName, ErrorTrack))
									self.CallBackHookerList["PostModelUpdate"][Index] = nil
								end
							else
								pcall(CallBack, Player, index)
							end
						end
					end
				end
			end, 75)
		end
	end
end

data.__index.NetUpdateStart = function(self, e)
	self:PlayersSimulation(e)
end

data.__index.CreateMove = function(self, e)
	self:UpdateIndexCode(e)
	self:SetupMovementUpdate(e)
	self:HookClientSideAnimating(e)
end

data.__index.NetUpdateEnd = function(self, e)
	self:AnglesControl(e)
	self:ModelOverride(e)
	self:NetUpdateTickbase(e)
	self:WeaponModelMain(e)
	self:NetUpdateAttachment(e)
	self:WeaponModelOverride(e)
end

data.__index.Release = function(self)
	self:UnRegisteredCallBack()
	for entindex, data in pairs(self.SetWeaponModelCached) do
		self.ForceUpdateInvoke = true
	end

	for Key, CallBack in pairs(self.CachedApiCallBackHandlers) do
		self.Interfaces.UnSetSteamEvent(CallBack)
		self.CachedApiCallBackHandlers[Key] = nil
	end

	for model, data in pairs(self.SetArmsModelOriginal) do
		local ModelArmConfigs = self:GetViewModelArmsConfig(model)
		if ModelArmConfigs then
			self.ForceUpdateInvoke = true
			for key, original in pairs(data) do
				if ModelArmConfigs[key] then
					ModelArmConfigs[key] = original
				end
			end
		end
	end

	for entindex, data in pairs(self.SetPlayerModelCached) do
		local Player = entity.get(entindex)
		if Player and Player:is_player() then
			if data.original then
				self.ForceUpdateInvoke = true
				Player["m_nModelIndex"] = data.original
			end
		end
	end

	for entindex, cached in pairs(self.SetLayerCached) do
		local Player = entity.get(entindex)
		if Player and Player:is_player() and Player:is_alive() then
			local AnimLayer = self:GetAnimLayer(Player)
			if AnimLayer then
				for layer_index, data in pairs(cached) do
					local anim_layer = AnimLayer[layer_index]
					if data.cycle ~= - 999 then
						anim_layer.cycle = 1
					end
				end
			end
		end
	end

	if self.ForceUpdateInvoke then
		common.force_full_update()
		self.ForceUpdateInvoke = false
	end
end

data.__index.ShutDown = function(self)
	self:Release()
	for _, UnHook in pairs(self.Hooks) do
		UnHook()
	end
end

data.__index.CreateAnimatingMeta = function(self)
	self.AnimatingMeta = {
		__tostring = function(args)
			if not self:IsValidObject(args) then
				return "userdata"
			end

			local player = args.player
			if not player or type(player) ~= "userdata" then
				return "userdata"
			end

			local Address = ffi.cast("uintptr_t", args.player[0])
			if not Address or Address == ffi.NULL then
				return "userdata"
			end

			return ("userdata: %s"):format(tostring(Address):gsub("cdata<unsigned int>: ", ""))
		end,

		__index = {
			Type = "Animating Pose",
			GetClientEntity = function(args, typeof)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Get client entity error: attempt get client entity to a failed object"):format(self.LibraryName))
					return false
				end

				local player = args.player
				if not player or type(player) ~= "userdata" then
					print_raw(("\aFF0000[%s]Get client entity error: attempt get client entity to a failed entity"):format(self.LibraryName))
					return false
				end

				return self:GetClientEntity(player, typeof)
			end,

			GetBaseAnimating = function(args, typeof)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Get base animating error: attempt get base animating to a failed object"):format(self.LibraryName))
					return false
				end

				local player = args.player
				if not player or type(player) ~= "userdata" then
					print_raw(("\aFF0000[%s]Get base animating error: attempt get base animating to a failed entity"):format(self.LibraryName))
					return false
				end

				local typeof = typeof or "void*"
				local pointer = self:GetClientEntity(player, "void***")
				return self:BindArg(ffi.cast(("%s(__thiscall*)(void*)"):format(typeof), pointer[0][44]), pointer)()
			end,

			GetSequenceActivity = function(args, sequence)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Get sequence activity error: attempt get sequence activity to a failed object"):format(self.LibraryName))
					return false
				end

				if not sequence or type(sequence) ~= "number" then
					print_raw(("\aFF0000[%s]Get sequence activity error: attempt get sequence activity to a failed sequence number"):format(self.LibraryName))
					return false
				end

				local player = args.player
				if not player or type(player) ~= "userdata" or not player:is_player() then
					print_raw(("\aFF0000[%s]Get sequence activity error: attempt get sequence activity to a failed player"):format(self.LibraryName))
					return false
				end

				return self:GetSequenceActivity(player, sequence)
			end,

			GetMatrix = function(args)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Get matrix 3x4 arrays error: attempt get matrix 3x4 arrays to a failed object"):format(self.LibraryName))
					return false
				end

				local player = args.player
				if not player or type(player) ~= "userdata" then
					print_raw(("\aFF0000[%s]Get matrix 3x4 arrays error: attempt get matrix 3x4 arrays to a failed entity"):format(self.LibraryName))
					return false
				end

				self:StudioRenderHook()
				local EntIndex = player:get_index()
				self.RequestGetRenderable[EntIndex] = globals.tickcount
				return self.EntityMatrixArraysCached[EntIndex]
			end,

			GetBaseMatrix = function(args)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Get base matrix 3x4 arrays error: attempt get base matrix 3x4 arrays to a failed object"):format(self.LibraryName))
					return false
				end

				local player = args.player
				if not player or type(player) ~= "userdata" then
					print_raw(("\aFF0000[%s]Get base matrix 3x4 arrays error: attempt get base matrix 3x4 arrays to a failed entity"):format(self.LibraryName))
					return false
				end

				local BaseMatrix = self:GetBaseMatrix(player)
				if BaseMatrix and BaseMatrix ~= ffi.NULL then
					return self:CopyMatrixArrays(BaseMatrix)
				end

				return false
			end,

			GetAttachmentMatrix = function(args)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Get attachment matrix 3x4 arrays error: attempt get attachment matrix 3x4 arrays to a failed object"):format(self.LibraryName))
					return false
				end

				local player = args.player
				if not player or type(player) ~= "userdata" then
					print_raw(("\aFF0000[%s]Get attachment matrix 3x4 arrays error: attempt get attachment matrix 3x4 arrays to a failed entity"):format(self.LibraryName))
					return false
				end

				self:StudioRenderHook()
				local EntIndex = player:get_index()
				if self.WeaponWorldEntity[EntIndex] then
					self.RequestGetRenderable[self.WeaponWorldEntity[EntIndex]] = globals.tickcount
					return self.EntityMatrixArraysCached[self.WeaponWorldEntity[EntIndex]]
				end

				return nil
			end,

			GetSimulationData = function(args)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Get simulation data error: attempt get simulation data to a failed object"):format(self.LibraryName))
					return nil
				end

				local player = args.player
				if not player or type(player) ~= "userdata" or not player:is_player() then
					print_raw(("\aFF0000[%s]Get simulation data error: attempt get simulation data to a failed player"):format(self.LibraryName))
					return nil
				end

				local origin = player:get_origin()
				local entindex = player:get_index()
				if not self.PlayerData[entindex] then
					self.PlayerData[entindex] = {
						Lag = 0,
						Ticks = 0,
						Different = 0,
						Exploits = false,
						Teleport = false,
						PrevOrigin = origin,
						CurrentOrigin = origin
					}
				end

				return {
					Choke = self.PlayerData[entindex].Lag,
					Exploit = self.PlayerData[entindex].Exploits,
					Teleport = self.PlayerData[entindex].Teleport
				}
			end,

			SetModelResetTime = function(args, delay)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Set model reset time error: attempt set model reset time to a failed object"):format(self.LibraryName))
					return false
				end

				local player = args.player
				if not player or type(player) ~= "userdata" or not player:is_player() then
					print_raw(("\aFF0000[%s]Set model reset time error: attempt set model reset time to a failed player"):format(self.LibraryName))
					return false
				end

				if not delay or type(delay) ~= "number" then
					print_raw(("\aFF0000[%s]Set model reset time error: attempt set model reset time to not a number delay"):format(self.LibraryName))
					return false
				end

				local entindex = player:get_index()
				self.SetPlayerModelReset[entindex] = delay
			end,

			SetModel = function(args, model_name, override_arms)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Set player model error: attempt set player model to a failed object"):format(self.LibraryName))
					return false
				end

				local player = args.player
				if not player or type(player) ~= "userdata" or not player:is_player() then
					print_raw(("\aFF0000[%s]Set player model error: attempt set player model to a failed player"):format(self.LibraryName))
					return false
				end

				if not model_name or type(model_name) ~= "string" then
					print_raw(("\aFF0000[%s]Set player model error: attempt set player model to a failed model name"):format(self.LibraryName))
					return false
				end

				local entindex = player:get_index()
				local ModelIndex = self:GetModelIndex(model_name)
				if ModelIndex then
					local ArmsModel = model_name:gsub(".mdl", "_arms.mdl")
					local OriginalModelIndex = self:GetModelIndex(player["m_iTeamNum"] == 2 and "models/player/custom_player/legacy/tm_phoenix.mdl" or "models/player/custom_player/legacy/ctm_sas.mdl")
					if override_arms then
						args:SetArmsModel(ArmsModel, false)
					end

					self.SetPlayerModelCached[entindex] = {
						index = ModelIndex,
						model = model_name,
						ticks = globals.tickcount,
						original = OriginalModelIndex
					}
				end
			end,

			SetWeaponModel = function(args, model_name, world_model, drop_model)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Set weapon model error: attempt set weapon model to a failed object"):format(self.LibraryName))
					return false
				end

				local player = args.player
				if not player or type(player) ~= "userdata" or not player:is_player() then
					print_raw(("\aFF0000[%s]Set weapon model error: attempt set weapon model to a failed player"):format(self.LibraryName))
					return false
				end

				if not model_name or type(model_name) ~= "string" then
					print_raw(("\aFF0000[%s]Set weapon model error: attempt set weapon model to a failed model name"):format(self.LibraryName))
					return false
				end

				local entindex = player:get_index()
				local Weapon = player:get_player_weapon()
				local ModelIndex = self:GetModelIndex(model_name)
				if ModelIndex then
					local WorldModel = model_name:gsub("v_", "w_")
					local WorldModelIndex = self:GetModelIndex(WorldModel)
					self.SetWeaponModelCached[entindex] = {
						reset = 0,
						last_index = 0,
						index = ModelIndex,
						world = world_model,
						ticks = globals.tickcount,
						world_drop = drop_model,
						world_index = WorldModelIndex,
						weapon_index = Weapon and Weapon:get_weapon_index() or - 1
					}
				end
			end,

			SetArmsModel = function(args, model_name, override_sleeve)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Set arms model error: attempt set arms model to a failed object"):format(self.LibraryName))
					return false
				end

				local player = args.player
				if not player or type(player) ~= "userdata" or not player:is_player() then
					print_raw(("\aFF0000[%s]Set arms model error: attempt set arms model to a failed player"):format(self.LibraryName))
					return false
				end

				if not model_name or type(model_name) ~= "string" then
					print_raw(("\aFF0000[%s]Set arms model error: attempt set arms model to a failed model name"):format(self.LibraryName))
					return false
				end

				local entindex = player:get_index()
				local ModelIndex = self:GetModelIndex(model_name)
				if model_name:find(".mdl") and ModelIndex then
					self.SetArmsModelCached[entindex] = {
						model = model_name,
						ticks = globals.tickcount,
						override_sleeve = override_sleeve
					}
				end
			end,

			SetOrigin = function(args, origin)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Set origin error: attempt set origin to a failed object"):format(self.LibraryName))
					return false
				end

				local player = args.player
				if not player or type(player) ~= "userdata" or not player:is_player() then
					print_raw(("\aFF0000[%s]Set origin error: attempt set origin to a failed player"):format(self.LibraryName))
					return false
				end

				if not origin or type(origin) ~= "userdata" then
					print_raw(("\aFF0000[%s]Set origin error: attempt set origin to a failed position"):format(self.LibraryName))
					return false
				end

				self:RegistrationInLineHooked()
				local entindex = player:get_index()
				self.SetOriginalCached[entindex] = origin
				self.SetOriginalState[entindex] = globals.tickcount
			end,

			GetViewAngles = function(args)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Get viewangles error: attempt get viewangles to a failed object"):format(self.LibraryName))
					return nil
				end

				local player = args.player
				if not player or type(player) ~= "userdata" or not player:is_player() then
					print_raw(("\aFF0000[%s]Get view angles error: attempt get view angles to a failed player"):format(self.LibraryName))
					return nil
				end

				local angles = player["m_angEyeAngles"]
				if not angles then
					print_raw(("\aFF0000[%s]Get view angles error: attempt get view angles to a failed entity, please check your parameter: player"):format(self.LibraryName))
					return nil
				end

				return angles
			end,

			SetViewAngles = function(args, angles)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Set viewangles error: attempt set viewangles to a failed object"):format(self.LibraryName))
					return false
				end

				local player = args.player
				if not player or type(player) ~= "userdata" or not player:is_player() then
					print_raw(("\aFF0000[%s]Set view angles error: attempt set view angles to a failed player"):format(self.LibraryName))
					return false
				end

				if not angles or type(angles) ~= "userdata" then
					print_raw(("\aFF0000[%s]Set view angles error: attempt set view angles to a failed angles"):format(self.LibraryName))
					return false
				end

				local entindex = player:get_index()
				self.SetViewAnglesCached[entindex] = angles
				self.SetViewAnglesState[entindex] = globals.tickcount
			end,

			GetBodyYaw = function(args, avoid_desync)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Get body yaw error: attempt get body yaw to a failed object"):format(self.LibraryName))
					return 0
				end

				local player = args.player
				local local_player = entity.get_local_player()
				if not player or type(player) ~= "userdata" or not player:is_player() then
					print_raw(("\aFF0000[%s]Get body yaw error: attempt get body yaw to a failed player"):format(self.LibraryName))
					return 0
				end

				local Delta = self:GetBodyYaw(player)
				if Delta then
					if avoid_desync and player == local_player then
						local Entindex = player:get_index()
						if not self.CachedBodyYaw[Entindex] then
							self.CachedBodyYaw[Entindex] = Delta
						end

						if globals.choked_commands ~= 0 then
							self.CachedBodyYaw[Entindex] = Delta
						end

						return self.CachedBodyYaw[Entindex]
					else
						return Delta
					end
				end

				return 0
			end,

			SetBodyYaw = function(args, angle, lower_body_yaw, animation_fixed)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Set body yaw error: attempt set body yaw to a failed object"):format(self.LibraryName))
					return false
				end

				local player = args.player
				local lowerbody = type(lower_body_yaw) == "number" and lower_body_yaw or - 999
				if not player or type(player) ~= "userdata" or not player:is_player() then
					print_raw(("\aFF0000[%s]Set body yaw error: attempt set body yaw to a failed player"):format(self.LibraryName))
					return false
				end

				if not angle or type(angle) ~= "number" then
					print_raw(("\aFF0000[%s]Set body yaw error: attempt set body yaw to a failed angle"):format(self.LibraryName))
					return false
				end

				self:RegistrationInLineHooked()
				if player:is_alive() and player:is_enemy() then
					local entindex = player:get_index()
					if not self.SetBodyYawCached[entindex] then
						self.SetBodyYawCached[entindex] = {}
					end

					if not animation_fixed then
						self.SetBodyYawCached[entindex].angle = math.clamp(angle, - 58, 58)
					else
						local AngleCompensation = self:AnimationFixed(player, math.clamp(angle, - 58, 58))
						self.SetBodyYawCached[entindex].angle = AngleCompensation and AngleCompensation or angle
					end

					if lowerbody and lowerbody ~= - 999 then
						self.SetBodyYawCached[entindex].lowerbody = math.clamp(lowerbody, - 180, 180)
					end

					self.SetBodyYawState[entindex] = globals.tickcount
				end
			end,

			SetPlayerHitboxPosition = function(args, hitboxes, position)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Set hitboxes position error: attempt set hitboxes position to a failed object"):format(self.LibraryName))
					return false
				end

				local player = args.player
				if not player or type(player) ~= "userdata" or not player:is_player() then
					print_raw(("\aFF0000[%s]Set hitboxes position error: attempt set hitboxes position to a failed player"):format(self.LibraryName))
					return false
				end

				if not hitboxes or type(hitboxes) ~= "number" or (hitboxes < 0 or hitboxes > 18) then
					print_raw(("\aFF0000[%s]Set hitboxes position error: attempt set hitboxes position to a failed hitboxes index"):format(self.LibraryName))
					return false
				end

				if not position or type(position) ~= "userdata" then
					print_raw(("\aFF0000[%s]Set hitboxes position error: attempt set hitboxes position to a failed hitboxes position (vector)"):format(self.LibraryName))
					return false
				end

				self:RegistrationInLineHooked()
				if player:is_alive() then
					local Entindex = player:get_index()
					if not self.SetHitboxesPositionState[Entindex] then
						self.SetHitboxesPositionState[Entindex] = {}
					end

					if not self.SetHitboxesPositionCached[Entindex] then
						self.SetHitboxesPositionCached[Entindex] = {}
					end

					self.SetHitboxesPositionCached[Entindex][hitboxes] = position
					self.SetHitboxesPositionState[Entindex][hitboxes] = globals.tickcount
				end
			end,

			DrawHitboxes = function(args, color, duration, hitgroup, special_hitgroup, box_color, custom_matrix)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Draw hitboxes error: attempt draw hitboxes to a failed object"):format(self.LibraryName))
					return false
				end

				if not color or type(color) ~= "userdata" then
					print_raw(("\aFF0000[%s]Draw hitboxes error: attempt draw hitboxes to a failed color"):format(self.LibraryName))
					return false
				end

				if not duration or type(duration) ~= "number" then
					print_raw(("\aFF0000[%s]Draw hitboxes error: attempt draw hitboxes to a failed duration"):format(self.LibraryName))
					return false
				end

				local player = args.player
				if not player or type(player) ~= "userdata" then
					print_raw(("\aFF0000[%s]Draw model error: attempt draw model to a failed entity"):format(self.LibraryName))
					return false
				end

				self:AddMatrix(player, color, duration, hitgroup, special_hitgroup, box_color, custom_matrix)
			end,

			DrawModel = function(args, matrix, original, color, material, draw_worldattachment, worldattachment_matrix)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Draw model error: attempt draw model to a failed object"):format(self.LibraryName))
					return false
				end

				if type(matrix) ~= "table" then
					print_raw(("\aFF0000[%s]Draw model error: attempt draw model to a failed matrix, please use object:GetMatrix"):format(self.LibraryName))
					return false
				end

				local player = args.player
				if not player or type(player) ~= "userdata" then
					print_raw(("\aFF0000[%s]Draw model error: attempt draw model to a failed entity"):format(self.LibraryName))
					return false
				end

				self:StudioRenderHook()
				local AttachmentEntityIndex = nil
				local EntIndex = player:get_index()
				self.DrawPlayerModelCached[EntIndex] = {
					color = color,
					matrix = matrix,
					material = material,
					tick = globals.tickcount,
					draw_original = original,
					attachment_matrix = worldattachment_matrix,
					attachment = draw_worldattachment and (self.WeaponWorldEntity[EntIndex] or - 1) or - 1
				}
			end,

			SetRenderPose = function(args, pose_code, percentage_amount)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Set render pose error: attempt set render pose to a failed object"):format(self.LibraryName))
					return false
				end

				local player = args.player
				if not percentage_amount or type(percentage_amount) ~= "number" then
					print_raw(("\aFF0000[%s]Set render pose error: attempt set render pose to a failed percentage"):format(self.LibraryName))
					return false
				end

				if not pose_code or type(pose_code) ~= "cdata" then
					print_raw(("\aFF0000[%s]Set render pose error: attempt set render pose to a failed pose object"):format(self.LibraryName))
					return false
				end

				if not player or type(player) ~= "userdata" or not player:is_player() then
					print_raw(("\aFF0000[%s]Set render pose error: attempt set render pose to a failed player"):format(self.LibraryName))
					return false
				end

				self:RegistrationInLineHooked()
				local pose_index = self:PoseIndexCode(pose_code)
				local percentage = math.clamp(percentage_amount, - 1, 1)
				if pose_index and player:is_alive() then
					local entindex = player:get_index()
					if not self.SetPoseState[entindex] then
						self.SetPoseState[entindex] = {}
					end

					if not self.SetPoseCached[entindex] then
						self.SetPoseCached[entindex] = {}
					end

					self.SetPoseCached[entindex][pose_index] = percentage
					self.SetPoseState[entindex][pose_index] = globals.tickcount
				end
			end,

			SetRenderLayer = function(args, layer_code, weight_amount, cycle_amount, sequence_index)
				if not self:IsValidObject(args) then
					print_raw(("\aFF0000[%s]Set render layer error: attempt set render layer to a failed object"):format(self.LibraryName))
					return false
				end

				local player = args.player
				local sequence = type(sequence_index) == "number" and sequence_index or 0
				local cycle = math.clamp(type(cycle_amount) == "number" and cycle_amount or 0, - 1, 1)
				local weight = math.clamp(type(weight_amount) == "number" and weight_amount or 0, - 1, 1)
				if not layer_code or type(layer_code) ~= "cdata" then
					print_raw(("\aFF0000[%s]Set render layer error: attempt set render layer to a failed layer object"):format(self.LibraryName))
					return false
				end

				if not player or type(player) ~= "userdata" or not player:is_player() then
					print_raw(("\aFF0000[%s]Set render layer error: attempt set render layer to a failed player"):format(self.LibraryName))
					return false
				end

				self:RegistrationInLineHooked()
				local layer_index = self:LayerIndexCode(layer_code)
				if layer_index and player:is_alive() then
					local entindex = player:get_index()
					if not self.SetLayerCached[entindex] then
						self.SetLayerCached[entindex] = {}
					end

					if not self.SetLayerState[entindex] then
						self.SetLayerState[entindex] = {}
					end

					if not self.SetLayerCached[entindex][layer_index] then
						self.SetLayerCached[entindex][layer_index] = {}
						if cycle_amount and cycle_amount ~= - 999 then
							self.SetLayerCached[entindex][layer_index].cycle = cycle
						end

						if weight_amount and weight_amount ~= - 999 then
							self.SetLayerCached[entindex][layer_index].weight = weight
						end

						if sequence_index and sequence_index ~= - 999 then
							self.SetLayerCached[entindex][layer_index].sequence = sequence
						end
					end

					if cycle_amount and cycle_amount ~= - 999 then
						self.SetLayerCached[entindex][layer_index].cycle = cycle
					end

					if weight_amount and weight_amount ~= - 999 then
						self.SetLayerCached[entindex][layer_index].weight = weight
					end

					if sequence_index and sequence_index ~= - 999 then
						self.SetLayerCached[entindex][layer_index].sequence = sequence
					end

					self.SetLayerState[entindex][layer_index] = globals.tickcount
				end
			end
		}
	}

	self.Interfaces = {
		GetPoses = function()
			return self.Poses
		end,

		GetLayers = function()
			return self.Layers
		end,

		GetDoubleTap = function()
			return rage.exploit:get() > 0
		end,

		IsValid = function(object)
			return self:IsValidObject(object)
		end,

		GetAbsYaw = function()
			return self.AnimationData.AbsYaw
		end,

		GetBalanceAdjust = function()
			return self.AnimationData.BalanceAdjust
		end,

		GetTickbaseShifting = function()
			return self.AnimationData.Tickbase.Shifting
		end,

		GetDesyncDelta = function(n)
			return self:ResultThing(n, data.AnimationData.DesyncDelta, data.AnimationData.DesyncExact)
		end,

		GetDesyncYaw = function(n)
			return math.normalize_yaw(self:ResultThing(n, self.AnimationData.FeetYaw, self.AnimationData.ServerFeetYaw))
		end,

		GetInverter = function()
			if globals.choked_commands == 0 or self.InverterState == nil then
				self.InverterState = self.Interfaces.GetDesyncDelta() < 0
			end

			return self.InverterState
		end,

		New = function(player)
			if not player or not player:is_player() then
				print_raw(("\aFF0000[%s]entity error: attempt create a not entity object"):format(self.LibraryName))
			end

			return setmetatable({
				player = player,
				type = "Animating"
			}, self.AnimatingMeta)
		end,

		AngleDiff = function(dest_angle, src_angle)
			if type(dest_angle) ~= "number" then
				print_raw(("\aFF0000[%s]Angle diff error: attempt diff a failed dest angle"):format(self.LibraryName))
				return
			end

			if type(src_angle) ~= "number" then
				print_raw(("\aFF0000[%s]Angle diff error: attempt diff a failed source angle"):format(self.LibraryName))
				return
			end

			return self:AngleDifferent(dest_angle, src_angle)
		end,

		ApproachAngle = function(target, value, speed)
			if type(target) ~= "number" then
				print_raw(("\aFF0000[%s]Approach angle error: attempt approach a failed target angle"):format(self.LibraryName))
				return
			end

			if type(value) ~= "number" then
				print_raw(("\aFF0000[%s]Approach angle error: attempt approach a failed value angle"):format(self.LibraryName))
				return
			end

			if type(speed) ~= "number" then
				print_raw(("\aFF0000[%s]Approach angle error: attempt approach a failed speed"):format(self.LibraryName))
				return
			end

			return self:ApproachAngle(target, value, speed)
		end,

		GetOverlap = function(rotation)
			local client, server, lean = self.AnimationData.FeetYaw, self.AnimationData.ServerFeetYaw, self:AngleDifferent(self.AnimationData.AbsYaw, self.AnimationData.FeetYaw)
			if type(rotation) == "number" then
				local cLean = math.abs(lean)
				client = math.clamp(
					rotation, 
					self.AnimationData.AbsYaw - cLean,
					self.AnimationData.AbsYaw + cLean
				)

			elseif type(rotation) == "boolean" and rotation then
				client = self.AnimationData.AbsYaw + lean
			end

			local angle_different = math.abs(self:AngleDifferent(client, server))
			return {
				BodyYaw = client,
				Amount = 1 - (angle_different / 120 * 1)
			}
		end,

		UnSetSteamEvent = function(TargetCallBack)
			for Key, CallBack in pairs(self.CachedApiCallBackHandlers) do
				if TargetCallBack == CallBack then
					if self.CachedApiCallBackResults[Key] and self.CachedApiCallBackResults[Key] ~= ffi.NULL then
						local ThisInstance = ffi.cast(self.SteamCallBackBasePointerCached, self.CachedApiCallBackResults[Key])
						self.CHelpers.SteamAPICancelCallBackResult(ThisInstance)
						self.CachedApiCallBackResults[Key] = nil
					end

					if self.CachedRegisteredCallBack[Key] and self.CachedRegisteredCallBack[Key] ~= ffi.NULL then
						local ThisInstance = ffi.cast(self.SteamCallBackBasePointerCached, self.CachedRegisteredCallBack[Key])
						self.CHelpers.SteamAPIUnRegisterCallBack(ThisInstance)
						self.CachedRegisteredCallBack[Key] = nil
					end

					self.CachedApiCallBackHandlers[Key] = nil
				end
			end
		end,

		SetSteamEventCallResult = function(ApiCallBackHandle, Handler, Index)
			assert(ApiCallBackHandle ~= 0, "This api callback handle is not valid address")
			local InstanceStorage = self.SteamCallBackBaseArrayCached()
			local ThisInstance = ffi.cast(self.SteamCallBackBasePointerCached, InstanceStorage)
			ThisInstance["CallBackIndex"] = Index
			ThisInstance["CallBackHandle"] = ApiCallBackHandle
			ThisInstance["CallBackVirtualTableStorage"][0]["GetCallBackBase"] = self.CHelpers["GetCallBaseBaseSizeContacts"]
			ThisInstance["CallBackVirtualTableStorage"][0]["DefaultRunCallBackBase"] = self.CHelpers["RunDefaultCallBackBaseContacts"]
			ThisInstance["CallBackVirtualTableStorage"][0]["CustomRunCallBackBase"] = self.CHelpers["RunCustomCallBackBaseContacts"]
			ThisInstance["CallBackVirtualTable"] = ThisInstance["CallBackVirtualTableStorage"]
			local CachedKey = self:PointerToUnsignedIntPointerAddress(ThisInstance)
			self.CachedApiCallBackHandlers[CachedKey] = Handler
			self.CachedApiCallBackResults[CachedKey] = InstanceStorage
			self.CHelpers.SteamAPIRegisterCallResult(ThisInstance, ApiCallBackHandle)
			return ThisInstance
		end,

		SetSteamEventCallBack = function(Index, InstanceHandle)
			assert(self.CachedRegisteredCallBack[Index] == nil, "This cached callback has been register")
			local InstanceStorage = self.SteamCallBackBaseArrayCached()
			local ThisInstance = ffi.cast(self.SteamCallBackBasePointerCached, InstanceStorage)
			ThisInstance["CallBackHandle"] = 0
			ThisInstance["CallBackIndex"] = Index
			ThisInstance["CallBackVirtualTableStorage"][0]["GetCallBackBase"] = self.CHelpers["GetCallBaseBaseSizeContacts"]
			ThisInstance["CallBackVirtualTableStorage"][0]["DefaultRunCallBackBase"] = self.CHelpers["RunDefaultCallBackBaseContacts"]
			ThisInstance["CallBackVirtualTableStorage"][0]["CustomRunCallBackBase"] = self.CHelpers["RunCustomCallBackBaseContacts"]
			ThisInstance["CallBackVirtualTable"] = ThisInstance["CallBackVirtualTableStorage"]
			local CachedKey = self:PointerToUnsignedIntPointerAddress(ThisInstance)
			self.CachedApiCallBackHandlers[CachedKey] = InstanceHandle
			self.CachedRegisteredCallBack[Index] = InstanceStorage
			self.CHelpers.SteamAPIRegisterCallBack(ThisInstance, Index)
			return ThisInstance
		end,

		SetCallBack = function(callback_type, callback, force_hook)
			if type(callback) ~= "function" then
				print_raw(("\aFF0000[%s]This callback is not a function value, your cant set callback a not function value"):format(self.LibraryName))
				return
			end

			if not self.CallBackHookerList[callback_type] then
				print_raw(("\aFF0000[%s]This callback type is not a valid type, your cant set callback because this type: %s is not valid"):format(self.LibraryName, callback_type))
				return
			end

			if self:Contains({"PreDrawModel", "PostDrawModel", "PreOverrideView", "PostOverrideView"}, callback_type) and not force_hook then
				events[self:Contains({"PreDrawModel", "PostDrawModel"}) and "draw_model" or "override_view"]:set(callback)
				return
			end

			if not self:Contains(self.CallBackHookerList[callback_type], callback) then
				if self:Contains({"PreDrawModel", "PostDrawModel"}, callback_type) then
					self:StudioRenderHook()
				elseif self:Contains({"PreOverrideView", "PostOverrideView"}, callback_type) then
					self:HookOverrideView()
				elseif self:Contains({"PreStudioFrameAdvance", "PostStudioFrameAdvance"}, callback_type) then
					self.ProcessedStudioFrameAdvance = true
				elseif self:Contains({"PreClientSideAnimationUpdate", "PostClientSideAnimationUpdate"}, callback_type) then
					self:RegistrationInLineHooked()
				elseif self:Contains({"PreSetModel", "PreModelUpdate", "PostSetModel", "PostModelUpdate"}, callback_type) then
					self.ProcessedModelUpdate = true
				end

				table.insert(self.CallBackHookerList[callback_type], callback)
			else
				print_raw(("\aFF0000[%s]This callback has been set, your cant set the same callback twice"):format(self.LibraryName))
			end
		end,

		UnSetCallBack = function(callback_type, callback, force_hook)
			if type(callback) ~= "function" then
				print_raw(("\aFF0000[%s]This callback is not a function value, your cant unset callback a not function value"):format(self.LibraryName))
				return
			end

			if not self.CallBackHookerList[callback_type] then
				print_raw(("\aFF0000[%s]This callback type is not a valid type, your cant unset callback because this type: %s is not valid"):format(self.LibraryName, callback_type))
				return
			end

			if self:Contains({"PreDrawModel", "PostDrawModel", "PreOverrideView", "PostOverrideView"}, callback_type) and not force_hook then
				events[self:Contains({"PreDrawModel", "PostDrawModel"}) and "draw_model" or "override_view"]:unset(callback)
				return
			end

			if self:Contains(self.CallBackHookerList[callback_type], callback) then
				for index, handle in pairs(self.CallBackHookerList[callback_type]) do
					if handle == callback then
						self.CallBackHookerList[callback_type][index] = nil
					end
				end
			else
				print_raw(("\aFF0000[%s]This callback is not set, your cant unset a not set callback"):format(self.LibraryName))
			end
		end
	}

	return self.Interfaces
end

data.__index.CallBacks = function(self)
	return {
		["render"] = function(e)
			self:Render(e)
		end,

		["shutdown"] = function(e)
			self:ShutDown(e)
		end,

		["round_start"] = function(e)
			self:RoundStart(e)
		end,

		["createmove"] = function(e)
			self:CreateMove(e)
		end,

		["net_update_end"] = function(e)
			self:NetUpdateEnd(e)
		end,

		["net_update_start"] = function(e)
			self:NetUpdateStart(e)
		end
	}
end

data.__index.Work = function(self, processed, ret)
	self:CreateCHelpers()
	self:UpdateIndexCode()
	for Name, Handle in pairs(self:CallBacks()) do
		self:RegisteredCallBack(Name, Handle)
	end

	if processed then
		self:HookOverrideView()
		self:StudioRenderHook()
		self:RegistrationInLineHooked()
		self.ProcessedModelUpdate = true
		self.ProcessedStudioFrameAdvance = true
	end

	if not ret then
		print_raw(("\aFFC0CB[%s]---------------------------------------------------------------------------------------------------"):format(data.LibraryName))
		print_raw(("\aFFC0CB[%s]  ----------------------------- SYR1337@Shiroko7 Love Forever -----------------------------------"):format(data.LibraryName))
		print_raw(("\aFFC0CB[%s]---------------------------------------------------------------------------------------------------"):format(data.LibraryName))
	end

	return self:CreateAnimatingMeta()
end

return function(processed, ret)
	return data:Work(processed, ret)
end