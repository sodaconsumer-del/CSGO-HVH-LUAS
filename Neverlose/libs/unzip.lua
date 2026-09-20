local reloaded_0_0 = require("ffi")

reloaded_0_0.cdef("    int GetProcAddress(void*, const char*);\n    void* GetModuleHandleA(const char*);\n    typedef void*(__cdecl* ShellExecute)(void*, const char*, const char*, const char*, const char*, int);\n    int SetEnvironmentVariableA(const char *lpName, const char *lpValue);\n")

local reloaded_0_1 = reloaded_0_0.cast("ShellExecute", reloaded_0_0.C.GetProcAddress(reloaded_0_0.C.GetModuleHandleA("shell32.dll"), "ShellExecuteA"))

local function reloaded_0_2(arg_1_0, arg_1_1, arg_1_2)
	local reloaded_1_0 = arg_1_1

	if reloaded_0_0.C.SetEnvironmentVariableA("CD", reloaded_1_0) == 0 then
		print("Error setting current directory: " .. tostring(reloaded_0_0.errno()))
	else
		local reloaded_1_1 = "tar -xf " .. arg_1_0 .. "\\" .. arg_1_2 .. " -C " .. arg_1_1
		local reloaded_1_2
		local reloaded_1_3 = 0

		if reloaded_0_1(nil, "open", "cmd.exe", "/c " .. reloaded_1_1, reloaded_1_2, reloaded_1_3) == nil then
			print("Error running command: " .. tostring(reloaded_0_0.errno()))
		end
	end
end

return {
	unzip_file = reloaded_0_2
}
