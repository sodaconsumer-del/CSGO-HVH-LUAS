local reloaded_0_0
local reloaded_0_1 = {
	follow_relative_jump = function(arg_1_0)
		return ffi.cast("int*", arg_1_0 + 1)[0] + arg_1_0 + 5
	end,
	get_ctype = function(arg_2_0, ...)
		assert(arg_2_0 ~= nil, "target address is null")

		local reloaded_2_0, reloaded_2_1 = pcall(ffi.typeof, ...)

		if not reloaded_2_0 then
			reloaded_2_0, reloaded_2_1 = pcall(ffi.typeof, arg_2_0)
		end

		assert(reloaded_2_0, string.format("invalid C type (%s)", reloaded_2_1))

		local reloaded_2_2

		reloaded_2_2, arg_2_0 = pcall(ffi.cast, reloaded_2_1, arg_2_0)

		assert(reloaded_2_2, string.format("invalid C type (%s)", arg_2_0))

		return arg_2_0, reloaded_2_1
	end,
	make_pointer = function(arg_3_0)
		local reloaded_3_0, reloaded_3_1 = pcall(ffi.typeof, "$[1]", arg_3_0)

		assert(reloaded_3_0, string.format("invalid C type (%s)", reloaded_3_1))

		return reloaded_3_1()
	end
}
local reloaded_0_2
local reloaded_0_3
local reloaded_0_4 = ffi.typeof("bool(__cdecl*)(void*, void*, void*, bool)")
local reloaded_0_5 = ffi.typeof("void(__cdecl*)(void*, bool)")
local reloaded_0_6 = ffi.cast("uintptr_t", utils.opcode_scan("gameoverlayrenderer.dll", "55 8B EC 51 8B 45 10 C7") or error("invalid signature #1", 2))
local reloaded_0_7 = reloaded_0_1.follow_relative_jump(ffi.cast("uintptr_t", utils.opcode_scan("gameoverlayrenderer.dll", "E8 ? ? ? ? 83 C4 08 FF 15 ? ? ? ?") or error("invalid signature #2", 2)))
local reloaded_0_8 = ffi.cast(reloaded_0_4, reloaded_0_6)
local reloaded_0_9 = ffi.cast(reloaded_0_5, reloaded_0_7)

function reloaded_0_1.hook_func(arg_4_0, arg_4_1, ...)
	assert(arg_4_1 ~= nil and type(arg_4_1) == "function", "invalid target function")

	local reloaded_4_0
	local reloaded_4_1, reloaded_4_2 = reloaded_0_1.get_ctype(arg_4_0, ...)
	local reloaded_4_3 = reloaded_0_1.make_pointer(reloaded_4_2)
	local reloaded_4_4, reloaded_4_5 = pcall(ffi.cast, reloaded_4_2, function(...)
		local reloaded_5_0 = {
			pcall(arg_4_1, reloaded_4_0, ...)
		}

		if reloaded_5_0[1] == true then
			return select(2, unpack(reloaded_5_0))
		end

		return reloaded_4_3[0](...)
	end)

	assert(reloaded_4_4, string.format("invalid C type (%s)", reloaded_4_5))

	local reloaded_4_6
	local reloaded_4_7 = {}
	local reloaded_4_8 = {}

	local function reloaded_4_9()
		return reloaded_0_9(reloaded_4_1, false)
	end

	function reloaded_4_8.get_original(arg_7_0, ...)
		return reloaded_4_3[0](...)
	end

	function reloaded_4_8.get_address(arg_8_0, arg_8_1)
		return arg_8_1 == true and reloaded_4_5 or reloaded_4_1
	end

	function reloaded_4_8.detach(arg_9_0)
		reloaded_4_9()
		events.shutdown:unset(reloaded_4_9)

		return arg_9_0
	end

	function reloaded_4_8.attach(arg_10_0)
		if not reloaded_0_8(reloaded_4_1, reloaded_4_5, reloaded_4_3, false) and last_log == nil then
			return error("an unknown error occured", 2)
		end

		events.shutdown:set(reloaded_4_9)

		return arg_10_0
	end

	reloaded_4_0 = setmetatable(reloaded_4_7, {
		__metatable = false,
		__index = reloaded_4_8
	})

	return reloaded_4_0:attach()
end

function reloaded_0_1.hook_vfunc(arg_11_0, arg_11_1, arg_11_2, arg_11_3, ...)
	local reloaded_11_0 = ffi.cast("void***", utils.create_interface(arg_11_0, arg_11_1) or error("invalid interface", 2))

	return reloaded_0_1.hook_func(reloaded_11_0[0][arg_11_2], arg_11_3, ...)
end

return reloaded_0_1
