if not pcall(ffi.sizeof, "SteamApiContacts") then
	ffi.cdef([[
		typedef union {
			uint64_t steamid64;
			struct {
				uint32_t accountid : 32;
				unsigned int instance : 20;
				unsigned int type : 4;
				unsigned int universe : 8;
			};

			struct {
				uint32_t low;
				uint32_t high;
			};

		} __attribute__((packed)) SteamID;

		typedef struct {
			void* steam_client;
			void* steam_user;
			void* steam_friends;
			void* steam_utils;
			void* steam_matchmaking;
			void* steam_user_stats;
			void* steam_apps;
			void* steam_matchmakingservers;
			void* steam_networking;
			void* steam_remotestorage;
			void* steam_screenshots;
			void* steam_http;
			void* steam_unidentifiedmessages;
			void* steam_controller;
			void* steam_ugc;
			void* steam_applist;
			void* steam_music;
			void* steam_musicremote;
			void* steam_htmlsurface;
			void* steam_inventory;
			void* steam_video;
		} SteamApiContacts;
	]])
end

local RichPresence = {}
RichPresence.__index = setmetatable(RichPresence, {})
RichPresence.data = {
	CallBackList = {},
	DelayRequest = 0,
	ResetState = false,
	StoredRichList = {},
	Author = "SYR1337",
	RequestDelayTimer = 0,
	CachedSteamInterfaces = {},
	RequestFriendRichPresence = {},
	ScriptName = "Steam Rich Presence Library",
	SteamStructureBuffer = ffi.typeof("SteamID"),
	MySteam64 = panorama.MyPersonaAPI.GetXuid()
}

RichPresence.__index.ErrorLog = function(self, ...)
	print_raw(("\aFF0000[%s] Error: %s"):format(self.data.ScriptName, ...))
end

RichPresence.__index.VtableEntry = function(self, instance, index, type)
	return ffi.cast(type, (ffi.cast("void***", instance)[0])[index])
end

RichPresence.__index.BindArg = function(self, fn, arg)
	return function(...)
		return fn(arg, ...)
	end
end

RichPresence.__index.SetResetState = function(self, state)
	self.data.ResetState = state
end

RichPresence.__index.SetDelayRequest = function(self, delay)
	if type(delay) ~= "number" then
		return self:ErrorLog("failed set delay request, value not a number")
	end

	self.data.DelayRequest = delay
end

RichPresence.__index.GetSteamInstance = (function()
	local SteamMatch = ffi.cast("char*", utils.opcode_scan("client.dll", "FF 15 ?? ?? ?? ?? 8B D8 FF 15"))
	local SteamAPIGetHSteamUser = ffi.cast("int(__cdecl***)()", SteamMatch + 2)[0][0]
	local SteamAPIGetHSteamPipe = ffi.cast("int(__cdecl***)()", SteamMatch + 10)[0][0]
	local SteamPipeHandle = SteamAPIGetHSteamPipe()
	local SteamUserHandle = SteamAPIGetHSteamUser()
	return function(self, index, typeof, interface)
		local CachedKey = ("%s %s %s"):format(index, typeof, interface)
		if not self.data.CachedSteamInterfaces[CachedKey] then
			self.data.CachedSteamInterfaces[CachedKey] = utils.get_vfunc("steamclient.dll", "SteamClient020", index, typeof)(SteamUserHandle, SteamPipeHandle, interface)
		end

		return self.data.CachedSteamInterfaces[CachedKey]
	end
end)()

RichPresence.__index.SteamIDMatch = function(self, steam64)
	if type(steam64) == "string" then
		return steam64
	elseif type(steam64) == "number" then
		return steam64
	elseif ffi.istype(self.data.SteamStructureBuffer, steam64) then
		return steam64
	end

	return self:ErrorLog("failed steamid, this steamid not be a valid steamid")
end

RichPresence.__index.ToSteamID = function(self, steamid_3)
	local ThisSteamID = self:SteamIDMatch(steamid_3)
	if ffi.istype(self.data.SteamStructureBuffer,  ThisSteamID) then
		return steamid_3
	elseif type(ThisSteamID) == "string" then
		return self.data.SteamStructureBuffer(tonumber(ThisSteamID))
	elseif type(ThisSteamID) == "number" then
		return self.data.SteamStructureBuffer(76561197960265728ULL + ThisSteamID)
	elseif type(ThisSteamID) ~= "string" and type(ThisSteamID) ~= "number" then
		self:ErrorLog("failed steamid, this steamid not be a valid steamid 3")
		return false
	end

	return false
end

RichPresence.__index.RegisteredCallBack = function(self, key, handle)
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

RichPresence.__index.CreateCHelpers = function(self)
	self.CHelpers = { 
		RichPresence = (function()
			local SteamFriends = self:GetSteamInstance(8, "void*(__thiscall*)(void*, int, int, const char *)", "SteamFriends017")
			local ClearRichPresence = self:BindArg(self:VtableEntry(SteamFriends, 44, "void(__thiscall*)(void*)"), SteamFriends)
			local RequestFriendRichPresence = self:BindArg(self:VtableEntry(SteamFriends, 48, "void(__thiscall*)(void*, SteamID)"), SteamFriends)
			local GetFriendRichPresenceKeyCount = self:BindArg(self:VtableEntry(SteamFriends, 46, "int(__thiscall*)(void*, SteamID)"), SteamFriends)
			local GetFriendRichPresence = self:BindArg(self:VtableEntry(SteamFriends, 45, "const char *(__thiscall*)(void*, SteamID, const char *)"), SteamFriends)
			local GetFriendRichPresenceKeyByIndex = self:BindArg(self:VtableEntry(SteamFriends, 47, "const char *(__thiscall*)(void*, SteamID, int)"), SteamFriends)
			local SteamApiCtx = ffi.cast("SteamApiContacts**", ffi.cast("char*", utils.opcode_scan("client.dll", "FF 15 ?? ?? ?? ?? B9 ?? ?? ?? ?? E8 ?? ?? ?? ?? 6A")) + 7)[0]
			local SetRichPresence = self:BindArg(ffi.cast("bool(__thiscall*)(void*, const char*, const char*)", ffi.cast("void***", SteamApiCtx.steam_friends)[0][43]), SteamApiCtx.steam_friends)
			return {
				ClearRichPresence = function()
					ClearRichPresence()
					self.data.StoredRichPresense = false
				end,

				SetRichPresence = function(Key, Raw)
					pcall(SetRichPresence, Key, Raw)
					self.data.StoredRichPresense = true
					if not self.data.StoredRichList[Key] then
						self.data.StoredRichList[Key] = true
					end
				end,

				GetRichPresenceKeyCount = function(SteamID3)
					local SteamIDStructure = self:ToSteamID(SteamID3)
					return GetFriendRichPresenceKeyCount(SteamIDStructure)
				end,

				GetRichPresenceKeyByIndex = function(SteamID3, Index)
					local SteamIDStructure = self:ToSteamID(SteamID3)
					return GetFriendRichPresenceKeyByIndex(SteamIDStructure, Index)
				end,

				GetRichPresenceByKey = function(SteamID3, Key)
					local SteamIDStructure = self:ToSteamID(SteamID3)
					return GetFriendRichPresence(SteamIDStructure, Key)
				end,

				GetRichPresenceKeyList = function(SteamID3)
					local CachedRichKeys = {}
					local SteamIDStructure = self:ToSteamID(SteamID3)
					local RichKeyCount = GetFriendRichPresenceKeyCount(SteamIDStructure)
					if not self.data.RequestFriendRichPresence[SteamID3] and SteamID3 ~= MySteam64 then
						if self.data.DelayRequest ~= 0 then
							utils.execute_after(self.data.RequestDelayTimer, function()
								RequestFriendRichPresence(SteamIDStructure)
							end)

							self.data.RequestDelayTimer = self.data.RequestDelayTimer + self.data.DelayRequest
						elseif self.data.DelayRequest == 0 then
							RequestFriendRichPresence(SteamIDStructure)
						end

						self.data.DelayIndex = self.data.DelayIndex + 1
						self.data.RequestFriendRichPresence[SteamID3] = true
					end

					for index = 1, RichKeyCount do
						local Successed, RichPresenceKey = pcall(GetFriendRichPresenceKeyByIndex, SteamIDStructure, index)
						if Successed and RichPresenceKey then
							table.insert(CachedRichKeys, RichPresenceKey)
						end
					end

					return CachedRichKeys
				end,

				GetRichPresence = function(SteamID3)
					local CachedRichState = {}
					local SteamIDStructure = self:ToSteamID(SteamID3)
					local MaximizedRichCount = GetFriendRichPresenceKeyCount(SteamIDStructure)
					if not self.data.RequestFriendRichPresence[SteamID3] and SteamID3 ~= MySteam64 then
						if self.data.DelayRequest ~= 0 then
							utils.execute_after(self.data.RequestDelayTimer, function()
								RequestFriendRichPresence(SteamIDStructure)
							end)

							self.data.RequestDelayTimer = self.data.RequestDelayTimer + self.data.DelayRequest
						elseif self.data.DelayRequest == 0 then
							RequestFriendRichPresence(SteamIDStructure)
						end

						self.data.RequestFriendRichPresence[SteamID3] = true
					end

					for index = 1, MaximizedRichCount do
						local Successed, RichPresenceKey = pcall(GetFriendRichPresenceKeyByIndex, SteamIDStructure, index)
						if Successed and RichPresenceKey then
							local Successed, RichPresenceState = pcall(GetFriendRichPresence, SteamIDStructure, RichPresenceKey)
							if Successed and RichPresenceState then
								local RichPresenceKeyString = ffi.string(RichPresenceKey)
								CachedRichState[RichPresenceKeyString] = ffi.string(RichPresenceState)
							end
						end
					end

					return CachedRichState
				end
			}
		end)()
	}
end

RichPresence.__index.ResetPresence = function(self)
	local me_prefix = ""
	local RichPresenceList = {
		["map"] = "default",
		["team2"] = ("\n"):rep(50),
		["score"] = ("\n"):rep(113),
		["team1"] = ("\n"):rep(113),
		["gamestatus"] = "Winning",
		["system:access"] = "private",
		["game:mode"] = "competitive",
		["steam_display"] = "#bcast_teamvsteammap"
	}

	for Key, _ in pairs(self.data.StoredRichList) do
		self.data.StoredRichList[Key] = false
		self.CHelpers.RichPresence.SetRichPresence(Key, ffi.NULL)
	end

	for Key, State in pairs(RichPresenceList) do
		self.CHelpers.RichPresence.SetRichPresence(Key, State)
	end

	self.CHelpers.RichPresence.ClearRichPresence()
end

RichPresence.__index.SetSearchKey = function(self, SearchKey)
	local SearchKey = tostring(SearchKey)
	local AddSearchKey = ("%s%s"):format(SearchKey, ("\n"):rep((113 - SearchKey:len()) / 2))
	self.CHelpers.RichPresence.SetRichPresence("connect", SearchKey)
	self.CHelpers.RichPresence.SetRichPresence("score", AddSearchKey)
	utils.execute_after(0.5, function()
		self:SetSearchKey(SearchKey)
	end)
end

RichPresence.__index.GetRichPresenceSearch = function(self, SteamID3, Search, Accurate)
	local SearchText = tostring(Search)
	local SearchTargetText = Accurate and SearchText or SearchText:lower()
	local RichPresenceList = self.CHelpers.RichPresence.GetRichPresence(SteamID3)
	for Key, State in pairs(RichPresenceList) do
		local SearchState = Accurate and State or State:lower()
		if Accurate and SearchState == SearchTargetText then
			return true
		elseif not Accurate and SearchState:find(SearchTargetText) then
			return true
		end
	end

	return false
end

RichPresence.__index.RoundStart = function(self, e)
	if not self.data.ResetState then
		return
	end

	self.data.RequestFriendRichPresence = {}
end

RichPresence.__index.CSGameDisconnected = function(self, e)
	self.data.RequestDelayTimer = 0
	if not self.data.ResetState then
		return
	end

	self.data.RequestFriendRichPresence = {}
end

RichPresence.__index.ShutDown = function(self)
	if self.data.StoredRichPresense then
		self:ResetPresence()
		self.data.StoredRichPresense = false
	end
end

RichPresence.__index.CallBacks = function(self)
	return {
		["shutdown"] = function(e)
			self:ShutDown(e)
		end,

		["round_start"] = function(e)
			self:RoundStart(e)
		end,

		["cs_game_disconnected"] = function(e)
			self:CSGameDisconnected(e)
		end
	}
end

RichPresence.__index.Work = function(self)
	self:CreateCHelpers()
	for Key, Handle in pairs(self:CallBacks()) do
		self:RegisteredCallBack(Key, Handle)
	end

	return {
		SetKey = self:BindArg(self.SetSearchKey, self),
		SetReset = self:BindArg(self.SetResetState, self),
		SetRequestDelay = self:BindArg(self.SetDelayRequest, self),
		SetRichPresence = self.CHelpers.RichPresence.SetRichPresence,
		GetRichSearch = self:BindArg(self.GetRichPresenceSearch, self),
		GetRichPresence = self.CHelpers.RichPresence.GetRichPresence,
		ClearRichPresence = self.CHelpers.RichPresence.ClearRichPresence,
		GetRichPresenceByKey = self.CHelpers.RichPresence.GetRichPresenceByKey,
		GetRichPresenceKeyList = self.CHelpers.RichPresence.GetRichPresenceKeyList,
		GetRichPresenceKeyCount = self.CHelpers.RichPresence.GetRichPresenceKeyCount,
		GetRichPresenceKeyByIndex = self.CHelpers.RichPresence.GetRichPresenceKeyByIndex
	}
end

return RichPresence:Work()