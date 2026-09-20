local reloaded_0_0 = require("ffi")

reloaded_0_0.cdef("    typedef void* PVOID;\n    typedef unsigned int LONG;\n    typedef LONG LRESULT;\n    typedef unsigned long ULONG;\n    typedef PVOID HWND;\n    typedef PVOID LPVOID;\n    typedef const char* LPCSTR;\n    typedef const wchar_t* LPCWSTR;\n    typedef unsigned long int HINSTANCE;\n    typedef unsigned int UINT;\n    typedef unsigned int WPARAM;\n    typedef LONG LPARAM;\n    typedef PVOID HANDLE;\n    typedef PVOID HGLOBAL;\n\n    typedef LRESULT(__stdcall* WNDPROC)(HWND, UINT, WPARAM, LPARAM);\n    LRESULT CallWindowProcA(WNDPROC lpPrevWndFunc, HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);\n    HWND FindWindowA(LPCSTR lpClassName, LPCSTR lpFileName);\n    LONG SetWindowLongA(HWND hWnd, int nIndex, LONG dwNewLong);\n    HWND GetForegroundWindow();\n")

local reloaded_0_1 = {
	funcs = {},
	registercallback = function(arg_1_0, arg_1_1)
		arg_1_0.funcs[#arg_1_0.funcs + 1] = arg_1_1
	end,
	unregistercallback = function(arg_2_0, arg_2_1)
		for iter_2_0, iter_2_1 in pairs(arg_2_0.funcs) do
			if iter_2_1 == arg_2_1 then
				arg_2_0.funcs[iter_2_0] = nil
			end
		end
	end
}

function reloaded_0_1.wndProc(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	for iter_3_0, iter_3_1 in pairs(reloaded_0_1.funcs) do
		if iter_3_1({
			hWnd = arg_3_0,
			uMessage = arg_3_1,
			wParam = arg_3_2,
			lParam = arg_3_3
		}) == false then
			return false
		end
	end

	return reloaded_0_0.C.CallWindowProcA(reloaded_0_1.oldWndProc, arg_3_0, arg_3_1, arg_3_2, arg_3_3)
end

reloaded_0_1.oldWndProc = reloaded_0_0.cast("WNDPROC", reloaded_0_0.C.SetWindowLongA(reloaded_0_0.C.FindWindowA("Valve001", nil), -4, reloaded_0_0.cast("uintptr_t", reloaded_0_0.cast("WNDPROC", reloaded_0_1.wndProc))))

events.shutdown:set(function()
	reloaded_0_0.C.SetWindowLongA(reloaded_0_0.C.FindWindowA("Valve001", nil), -4, reloaded_0_0.cast("uintptr_t", reloaded_0_1.oldWndProc))
end)

return reloaded_0_1
