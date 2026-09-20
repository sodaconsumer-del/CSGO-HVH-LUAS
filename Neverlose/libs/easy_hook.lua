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

local EasyHook = {}
EasyHook.__index = setmetatable(EasyHook, {})
EasyHook.data = {
	Hooks = {},
	CallBackList = {},
	Author = "SYR1337",
	CallBackDebug = false,
	SuccessBuffer = ffi.new("int[1]"),
	ScriptName = "Easy Hook Library",
	ProtectAddrBuffer = ffi.new("unsigned long[1]")
}

EasyHook.__index.BindArg = function(self, handler, address)
	return function(...)
		return handler(address, ...)
	end
end

EasyHook.__index.RegisteredCallBack = function(self, key, handle)
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

EasyHook.__index.TrampolineHook = function(self, addr, cast, func)
	local ActualCallBack = function(...)
		local Successed, Result = pcall(func, ...)
		if not Successed and self.data.CallBackDebug then
			print_raw(("\aFF0000Trampoline Hook Error: %s"):format(Result))
			return false
		end

		return Result
	end

	local Trampoline = {
		Hooked = false,
		OriginalFunction = ffi.cast(cast, addr),
		OriginalFuncBytes = ffi.new("uint8_t[?]", 5),
		OriginalFunctionPointer = ffi.cast("void*", addr),
		ProtectAddrBuffer = self.data.ProtectAddrBuffer,
		OriginalFunctionAddress = ffi.cast("intptr_t", addr),
		HookFunctionAddress = tonumber(ffi.cast("intptr_t", ffi.cast("void*", ffi.cast(cast, ActualCallBack))))
	}

	local TrampolineMetaTable = {}
	TrampolineMetaTable.__index = setmetatable(TrampolineMetaTable, {})
	ffi.copy(Trampoline.OriginalFuncBytes, Trampoline.OriginalFunctionPointer, ffi.sizeof(Trampoline.OriginalFuncBytes))
	Trampoline.HookBytes = ffi.new("uint8_t[?]", ffi.sizeof(Trampoline.OriginalFuncBytes), 0x90)
	Trampoline.HookBytes[0] = 0xE9
	ffi.cast("uint32_t*", Trampoline.HookBytes + 1)[0] = Trampoline.HookFunctionAddress - Trampoline.OriginalFunctionAddress - 5
	TrampolineMetaTable.__index.CallingMethod = function(self, Override)
		if self.Hooked ~= Override then
			self.Hooked = Override
			local TrampolineBytes = Override and self.HookBytes or self.OriginalFuncBytes
			ffi.C.VirtualProtect(self.OriginalFunctionPointer, ffi.sizeof(TrampolineBytes), 0x40, self.ProtectAddrBuffer)
			ffi.copy(self.OriginalFunctionPointer, TrampolineBytes, ffi.sizeof(TrampolineBytes))
			ffi.C.VirtualProtect(self.OriginalFunctionPointer, ffi.sizeof(TrampolineBytes), self.ProtectAddrBuffer[0], self.ProtectAddrBuffer)
		end
	end

	TrampolineMetaTable.__index.Hook = function(self)
		self:CallingMethod(true)
	end

	TrampolineMetaTable.__index.UnHook = function(self)
		self:CallingMethod(false)
	end

	local TrampolineMetaTable = setmetatable(Trampoline, {
		__index = TrampolineMetaTable,
		__call = function(self, ...)
			self:CallingMethod(false)
			local Result = self.OriginalFunction(...)
			self:CallingMethod(true)
			return Result
		end
	})

	TrampolineMetaTable:Hook()
	table.insert(self.data.Hooks, TrampolineMetaTable)
	return TrampolineMetaTable
end

EasyHook.__index.VmtHook = function(self, vtable_class)
	local VmtMetatable = {
		Hooked = {},
		Orgtable = {},
		Base = self.data,
		Vmtable = ffi.cast("intptr_t**", vtable_class)[0],
		ProtectAddrBuffer = self.data.ProtectAddrBuffer
	}

	VmtMetatable.__index = setmetatable(VmtMetatable, {})
	VmtMetatable.__index.Hook = function(self, method, cast, func)
		if not self.Hooked[method] then
			self.Hooked[method] = true
			if not self.Orgtable[method] then
				self.Orgtable[method] = self.Vmtable[method]
			end

			local ActualCallBack = function(...)
				local Successed, Result = pcall(func, ...)
				if not Successed and self.Base.CallBackDebug then
					print_raw(("\aFF0000Vmt Hook Error: %s"):format(Result))
					return false
				end

				return Result
			end

			local VmtHookMeta = {
				Hooked = fasle,
				Method = method,
				Vmtable = self.Vmtable,
				Orgtable = self.Orgtable,
				ProtectAddrBuffer = self.ProtectAddrBuffer,
				HookFunction = ffi.cast(cast, ActualCallBack),
				OriginalFunction = ffi.cast(cast, self.Orgtable[method])
			}

			local VmtHookMetatable = {}
			VmtHookMetatable.__index = setmetatable(VmtHookMeta, {})
			VmtHookMetatable.__index.Hook = function(self)
				if not self.Hooked then
					self.Hooked = true
					ffi.C.VirtualProtect(self.Vmtable + self.Method, 4, 0x4, self.ProtectAddrBuffer)
					self.Vmtable[method] = ffi.cast("intptr_t", self.HookFunction)
					ffi.C.VirtualProtect(self.Vmtable + self.Method, 4, self.ProtectAddrBuffer[0], self.ProtectAddrBuffer)
				end
			end

			VmtHookMetatable.__index.UnHook = function(self)
				if self.Hooked then
					self.Hooked = false
					ffi.C.VirtualProtect(self.Vmtable + self.Method, 4, 0x4, self.ProtectAddrBuffer)
					self.Vmtable[method] = ffi.cast("intptr_t", self.OriginalFunction)
					ffi.C.VirtualProtect(self.Vmtable + self.Method, 4, self.ProtectAddrBuffer[0], self.ProtectAddrBuffer)
				end
			end

			local VmtHookMetatable = setmetatable(VmtHookMeta, {
				__index = VmtHookMetatable,
				__call = function(self, ...)
					self.OriginalFunction(...)
				end
			})

			VmtHookMetatable:Hook()
			return VmtHookMetatable
		end

		return false
	end

	VmtMetatable.__index.UnHookMethod = function(self, method)
		if self.Hooked[method] then
			ffi.C.VirtualProtect(self.Vmtable + method, 4, 0x4, self.ProtectAddrBuffer)
			self.Vmtable[method] = self.Orgtable[method]
			ffi.C.VirtualProtect(self.Vmtable + method, 4, self.ProtectAddrBuffer[0], self.ProtectAddrBuffer)
			self.Hooked[method] = false
			self.Orgtable[method] = nil
		end
	end

	VmtMetatable.__index.UnHook = function(self)
		for method, _ in pairs(self.Orgtable) do
			self:UnHookMethod(method)
		end
	end

	table.insert(self.data.Hooks, VmtMetatable)
	return VmtMetatable
end

EasyHook.__index.JmpHook = function(self)
	local JmpHook = ffi.cast("int(__cdecl*)(void*, void*, void*, int)", utils.opcode_scan("GameOverlayRenderer.dll", "55 8B EC 51 8B 45 10 C7"))
	local JmpUnHook = ffi.cast("void(__cdecl*)(void*, bool)", utils.opcode_scan("gameoverlayrenderer.dll", "55 8B EC 64 A1 ?? ?? ?? ?? 6A FF 68 ?? ?? ?? ?? 50 64 89 25 ?? ?? ?? ?? 81 EC ?? ?? ?? ?? 56 8B 75"))
	return function(self, addr, cast, func)
		local JmpHookMeta = {
			Hooked = false,
			HookFunction = ffi.cast(cast, func),
			OriginalFunction = ffi.cast(cast, addr),
			SuccessBuffer = self.data.SuccessBuffer,
			ProtectAddrBuffer = self.data.ProtectAddrBuffer
		}

		JmpHookMeta.CallBackPointer = ffi.typeof("$[1]", JmpHookMeta.HookFunction)()
		local ActualCallBack = function(...)
			local Successed, Result = pcall(func, ...)
			if not Successed and self.data.CallBackDebug then
				print_raw(("\aFF0000Jmp Hook Error: %s"):format(Result))
				return false
			end

			return Result
		end

		local JmpHookMetatable = {}
		JmpHookMetatable.__index = setmetatable(JmpHookMeta, {})
		JmpHookMetatable.__index.Hook = function(self)
			if not self.Hooked then
				self.Hooked = JmpHook(self.OriginalFunction, ffi.cast(cast, ActualCallBack), self.CallBackPointer, 0) ~= 0
			end
		end

		JmpHookMetatable.__index.UnHook = function(self)
			if self.Hooked then
				self.Hooked = false
				JmpUnHook(self.OriginalFunction, false)
			end
		end

		local JmpHookMetatable = setmetatable(JmpHookMeta, {
			__index = JmpHookMetatable,
			__call = function(self, ...)
				return self.CallBackPointer[0](...)
			end
		})

		JmpHookMetatable:Hook()
		table.insert(self.data.Hooks, JmpHookMetatable)
		return JmpHookMetatable
	end
end

EasyHook.__index.ShutDown = function(self)
	for Index, Pointer in pairs(self.data.Hooks) do
		Pointer:UnHook()
		self.data.Hooks[Index] = nil
	end
end

EasyHook.__index.CallBacks = function(self)
	return {
		["shutdown"] = function(e)
			self:ShutDown(e)
		end
	}
end

EasyHook.__index.Work = function(self)
	for Name, Handler in pairs(self:CallBacks()) do
		self:RegisteredCallBack(Name, Handler)
	end

	return {
		VmtHook = self:BindArg(self.VmtHook, self),
		JmpHook = self:BindArg(self:JmpHook(), self),
		TrampolineHook = self:BindArg(self.TrampolineHook, self),
		SetDebug = function(state)
			self.data.CallBackDebug = state
		end
	}
end

return EasyHook:Work()