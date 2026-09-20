if not pcall(ffi.sizeof, "VirtualProtect") then
	ffi.cdef([[
		int VirtualProtect(
			void* lpAddress,
			unsigned long dwSize,
			unsigned long flNewProtect,
			unsigned long* lpflOldProtect
		);
	]])
end

local Interface = {}
Interface.__index = setmetatable(Interface, {})
Interface.data = {
	CallBackList = {},
	CachedHookers = {},
	CachedInterface = {},
	Author = "SYR1337",
	CachedHookInterface = {},
	ScriptName = "Interface Helpers Library"
}

Interface.__index.IsValid = function(self, addr)
	return addr and addr ~= nil and addr ~= ffi.NULL and (type(addr) == "userdata" or type(addr) == "cdata")
end

Interface.__index.BindArg = function(self, fn, this)
	return function(...)
		return fn(this, ...)
	end
end

Interface.__index.Contains = function(self, tab, this)
	for _, data in pairs(tab) do
		if data == this then
			return true
		end
	end

	return false
end

Interface.__index.RegisteredCallBack = function(self, key, handle)
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

Interface.__index.InLineHooked = function(self, typeof, callback, hook_addr)
	local hooked_meta = {}
	local org_bytes = ffi.new("uint8_t[?]", 5)
	local old_prot = ffi.new("unsigned long[1]")
	local void_addr = ffi.cast("void*", hook_addr)
	local base_addr = ffi.cast("intptr_t", hook_addr)
	hooked_meta.OriginalFunction = ffi.cast(typeof, base_addr)
	local detour_addr = tonumber(ffi.cast("intptr_t", ffi.cast("void*", ffi.cast(typeof, callback))))
	ffi.copy(org_bytes, void_addr, ffi.sizeof(org_bytes))
	local hook_bytes = ffi.new("uint8_t[?]", ffi.sizeof(org_bytes), 0x90)
	hook_bytes[0] = 0xE9
	ffi.cast("uint32_t*", hook_bytes + 1)[0] = detour_addr - base_addr - 5
	local function SwitchHookedStatus(Hooked)
		local original_bytes = Hooked and hook_bytes or org_bytes
		ffi.C.VirtualProtect(void_addr, ffi.sizeof(original_bytes), 0x40, old_prot)
		ffi.copy(void_addr, original_bytes, ffi.sizeof(original_bytes))
		ffi.C.VirtualProtect(void_addr, ffi.sizeof(original_bytes), old_prot[0], old_prot)
	end

	SwitchHookedStatus(true)
	table.insert(self.data.CachedHookers, function()
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
end

Interface.__index.ShutDown = function(self)
	for Index, UnHooked in pairs(self.data.CachedHookers) do
		pcall(UnHooked)
		self.data.CachedHookers[Index] = nil
	end
end

Interface.__index.CallBacks = function(self)
	return {
		["shutdown"] = function(e)
			self:ShutDown(e)
		end
	}
end

Interface.__index.Work = function(self)
	for Name, Handler in pairs(self:CallBacks()) do
		self:RegisteredCallBack(Name, Handler)
	end

	return function(Module, Interface)
		local InterfaceVtable = ffi.cast("void***", Module)
		if type(Module) == "string" and type(Interface) == "string" then
			InterfaceVtable = ffi.cast("void***", utils.create_interface(Module, Interface))
		end

		assert(self:IsValid(InterfaceVtable), ("[%s] invalid interface"):format(self.data.ScriptName))
		return setmetatable({
			data = self.data,
			Addr = InterfaceVtable,
			Bind = self:BindArg(self.BindArg, self),
			ThisIsValid =  self:BindArg(self.IsValid, self),
			Contains =  self:BindArg(self.Contains, self),
			TrampolineHook = self:BindArg(self.InLineHooked, self)
		}, {
			__tostring = function(self)
				return ("userdata: %s"):format(tostring(self.Addr):gsub("cdata<void ***>: ", ""))
			end,

			__index = function(self, key)
				if type(key) == "number" then
					return self.Addr[0][12]
				elseif key == "IsValid" then
					return function(self)
						return self.ThisIsValid(self.Addr)
					end

				elseif key == "GetVFunc" then
					return function(self, index, typeof)
						local AddrKey = tostring(self.Addr)
						assert(type(index) == "number", ("[%s] invalid vfunc index"):format(self.data.ScriptName))
						assert(type(typeof) == "string", ("[%s] invalid vfunc typeof"):format(self.data.ScriptName))
						if not self.data.CachedInterface[AddrKey] then
							self.data.CachedInterface[AddrKey] = {}
						end

						local CachedKey = ("%s: %s"):format(index, typeof)
						if not self.data.CachedInterface[AddrKey][CachedKey] or self.data.CachedInterface[AddrKey][CachedKey] == ffi.NULL then
							self.data.CachedInterface[AddrKey][CachedKey] = ffi.cast(typeof, self.Addr[0][index])
						end

						return setmetatable({
							Interface = self,
							Addr = self.Addr,
							VFunc = self.Bind(self.data.CachedInterface[AddrKey][CachedKey], self.Addr)
						}, {
							__tostring = function(self)
								return ("VFunc: (Instance Address: %s, Index: %s, Typeof: %s)"):format(tostring(self.Addr):gsub("cdata<void ***>: ", ""), index, typeof)
							end,

							__index = {
								GetInterface = function(self)
									return self.Interface
								end
							},

							__call = function(self, ...)
								local Successed, Result = pcall(self.VFunc, ...)
								if not Successed then
									print_raw(Result)
									return false
								end

								return Result
							end
						})
					end

				elseif key == "Hook" then
					return function(self, index, typeof, trampoline, post, igorn)
						local AddrKey = tostring(self.Addr)
						assert(type(typeof) == "string", ("[%s] invalid vfunc typeof"):format(self.data.ScriptName))
						local OriginalAddress = ffi.cast("intptr_t*", type(index) == "number" and self.Addr[0][index] or index)
						assert(type(trampoline) == "function", ("[%s] invalid trampoline function"):format(self.data.ScriptName))
						assert(type(index) == "number" or type(index) == "userdata" or type(index) == "cdata", ("[%s] invalid vfunc index"):format(self.data.ScriptName))
						if not self.data.CachedHookInterface[AddrKey] then
							self.data.CachedHookInterface[AddrKey] = {}
						end

						local CachedKey = ("%s: %s"):format(typeof, OriginalAddress)
						if not self.data.CachedHookInterface[AddrKey][CachedKey] then
							self.data.CachedHookInterface[AddrKey][CachedKey] = {}
							self.data.CachedHookInterface[AddrKey][CachedKey].CallBacks = {
								Pre = {},
								Post = {}
							}

							self.data.CachedHookInterface[AddrKey][CachedKey].OriginalFunction = self.TrampolineHook(typeof, function(...)
								local Contexts = {...}
								local OriginalResult = nil
								for _, trampoline in pairs(self.data.CachedHookInterface[AddrKey][CachedKey].CallBacks["Pre"]) do
									local Successed, Result = pcall(trampoline, ...)
									if not Successed then
										print_raw(Result)
									elseif Successed and type(Result) == "table" then
										for index, data in pairs(Result) do
											Contexts[index] = data
										end

									elseif Successed then
										OriginalResult = Result
									end
								end

								if not igorn then
									OriginalResult = self.data.CachedHookInterface[AddrKey][CachedKey].OriginalFunction(unpack(Contexts))
								end

								for _, trampoline in pairs(self.data.CachedHookInterface[AddrKey][CachedKey].CallBacks["Post"]) do
									local Successed, Result = pcall(trampoline, ...)
									if not Successed then
										print_raw(Result)
									end
								end

								return OriginalResult
							end, OriginalAddress)
							table.insert(self.data.CachedHookInterface[AddrKey][CachedKey].CallBacks[post and "Post" or "Pre"], trampoline)
						elseif self.data.CachedHookInterface[AddrKey][CachedKey] then
							if not self.Contains(self.data.CachedHookInterface[AddrKey][CachedKey].CallBacks[post and "Post" or "Pre"], trampoline) then
								table.insert(self.data.CachedHookInterface[AddrKey][CachedKey].CallBacks[post and "Post" or "Pre"], trampoline)
							end
						end

						return setmetatable({
							Pointer = self,
							data = self.data,
							Contains = self.Contains,
							Hook = self.data.CachedHookInterface[AddrKey][CachedKey]
						}, {
							__index = {
								GetInterface = function(self)
									return self.Pointer
								end,

								Set = function(self, state)
									assert(type(state) == "boolean", ("[%s] invalid set trampoline state"):format(self.data.ScriptName))
									self.Hook.OriginalFunction:Set(state)
								end,

								Original = function(self, ...)
									self.Hook.OriginalFunction(...)
								end
							},

							__call = function(self, trampoline, post)
								assert(type(trampoline) == "function", ("[%s] invalid add call trampoline function"):format(self.data.ScriptName))
								if not self.Contains(self.Hook.CallBacks[post and "Post" or "Pre"], trampoline) then
									table.insert(self.Hook.CallBacks[post and "Post" or "Pre"], trampoline)
								elseif self.Contains(self.Hook.CallBacks[post and "Post" or "Pre"], trampoline) then
									for index, callback in pairs(self.Hook.CallBacks[post and "Post" or "Pre"]) do
										if callback == trampoline then
											table.remove(self.Hook.CallBacks[post and "Post" or "Pre"], index)
										end
									end
								end
							end
						})
					end
				end
			end
		})
	end
end

return Interface:Work()