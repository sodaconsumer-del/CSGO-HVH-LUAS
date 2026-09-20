local reloaded_0_0 = {}
local reloaded_0_1 = ffi.load("Shell32.dll")
local reloaded_0_2 = ffi.load("UrlMon")
local reloaded_0_3 = ffi.load("WinInet")
local reloaded_0_4 = ffi.load("Winmm")
local reloaded_0_5 = ffi.load("user32")
local reloaded_0_6 = ffi.load("kernel32")

ffi.cdef("    typedef unsigned long DWORD;\n    typedef void *HANDLE;\n    typedef void *HWND;\n    typedef struct _FILETIME {\n        DWORD dwLowDateTime;\n        DWORD dwHighDateTime;\n    } FILETIME, *PFILETIME;\n\n    typedef long LPARAM;\n    typedef unsigned int WPARAM;\n    typedef unsigned int       DWORD;\n    typedef void* HHOOK;\n    typedef void* HMODULE;\n    typedef const char* LPCSTR;\n\n    typedef void* HINSTANCE;\n    typedef int (*HOOKPROC)(int code, WPARAM wParam, LPARAM lParam);\n    typedef HOOKPROC (__stdcall *SetWindowsHookEx_t)(int idHook, HOOKPROC lpfn, HINSTANCE hMod, DWORD dwThreadId);\n    HHOOK SetWindowsHookExA(int idHook, HOOKPROC lpfn, HINSTANCE hMod, DWORD dwThreadId);\n    HMODULE GetModuleHandleA(LPCSTR lpModuleName);\n\n    typedef struct _WIN32_FIND_DATAA {\n      DWORD dwFileAttributes;\n      FILETIME ftCreationTime;\n      FILETIME ftLastAccessTime;\n      FILETIME ftLastWriteTime;\n      DWORD nFileSizeHigh;\n      DWORD nFileSizeLow;\n      DWORD dwReserved0;\n      DWORD dwReserved1;\n      char cFileName[260];\n      char cAlternateFileName[14];\n    } WIN32_FIND_DATAA, *PWIN32_FIND_DATAA, *LPWIN32_FIND_DATAA;\n\n    HANDLE FindFirstFileA(\n      const char* lpFileName,\n      PWIN32_FIND_DATAA lpFindFileData\n    );\n\n    bool FindNextFileA(\n      HANDLE hFindFile,\n      PWIN32_FIND_DATAA lpFindFileData\n    );\n\n    bool FindClose(HANDLE hFindFile);\n\n\n\n    bool SetWindowTextA(void* hWnd, const char* lpString);\n    bool SetCursorPos(int X, int Y);\n    void keybd_event(int bVk, int bScan, int dwFlags, int dwExtraInfo);\n\n    int ShellExecuteA(void* hwnd, const char* lpOperation, const char* lpFile, const char* lpParameters, const char* lpDirectory, int nShowCmd);\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);  \n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n    bool PlaySound(const char *pszSound, void *hmod, uint32_t fdwSound);\n    int MessageBoxA(void *w, const char *txt, const char *cap, int type);\n    bool Beep( int start , int end);\n    void Sleep(int ms);\n    int SystemParametersInfoA( int uAction, int uParam, const char* lpvParam, int fuWinIni);\n    int LoadKeyboardLayoutA(const char* pwszKLID, int Flags);\n    typedef struct { int x; int y; } POINT;\n    typedef struct { int left; int top; int right; int bottom; } RECT;\n\n    HWND GetForegroundWindow();\n    bool ShowWindow(HWND hWnd, int nCmdShow);\n    bool GetWindowRect(HWND hWnd, RECT *pRect);\n    bool ClientToScreen(HWND hWnd, POINT *pPoint);\n\n    int GetWindowLongA(void* hWnd, int nIndex);\n    int SetWindowLongA(void* hWnd, int nIndex, int dwNewLong);\n    bool SetLayeredWindowAttributes(void* hWnd, int crKey, int bAlpha, int dwFlags);\n    bool SetWindowPos(void* hWnd, void* hWndInsertAfter, int X, int Y, int cx, int cy, int uFlags);\n    int GetWindowTextA( void* hWnd, char* lpString, int nMaxCount);\n    typedef int (__stdcall *WNDENUMPROC)(void*, unsigned long);\n    int EnumWindows(WNDENUMPROC lpEnumFunc, unsigned long lParam);\n    int GetWindowTextA(void* hWnd, char *lpString, int nMaxCount);\n    int IsWindowVisible(void* hWnd);\n    HWND FindWindowA(const char *lpClassName, const char *lpWindowName);\n")

local function reloaded_0_7(arg_1_0, arg_1_1)
	local reloaded_1_0 = ffi.new("char[256]")

	if ffi.C.GetWindowTextA(arg_1_0, reloaded_1_0, 256) > 0 and ffi.C.IsWindowVisible(arg_1_0) ~= 0 then
		table.insert(ttable, arg_1_0)
	end

	return 1
end

local function reloaded_0_8(arg_2_0, arg_2_1)
	local reloaded_2_0 = ffi.new("char[256]")

	if ffi.C.GetWindowTextA(arg_2_0, reloaded_2_0, 256) > 0 then
		table.insert(ttable, arg_2_0)
	end

	return 1
end

function reloaded_0_0.moveMouse(arg_3_0, arg_3_1)
	return reloaded_0_5.SetCursorPos(arg_3_0, arg_3_1) ~= 0
end

function reloaded_0_0.pressKey(arg_4_0)
	reloaded_0_5.keybd_event(arg_4_0, 0, 0, 0)
	reloaded_0_5.keybd_event(arg_4_0, 0, 2, 0)
end

function reloaded_0_0.desktop_image(arg_5_0)
	local reloaded_5_0 = 1
	local reloaded_5_1 = 2
	local reloaded_5_2 = 20
	local reloaded_5_3 = arg_5_0

	return (ffi.C.SystemParametersInfoA(reloaded_5_2, 0, reloaded_5_3, reloaded_5_0 + reloaded_5_1))
end

function reloaded_0_0.change_languages(arg_6_0)
	reloaded_0_5.LoadKeyboardLayoutA(arg_6_0, 1)
end

function reloaded_0_0.get_active_window()
	return (reloaded_0_5.GetForegroundWindow())
end

function reloaded_0_0.ShowWindow(arg_8_0, arg_8_1)
	reloaded_0_5.ShowWindow(arg_8_0, arg_8_1)
end

function reloaded_0_0.setWindowTitle(arg_9_0, arg_9_1)
	return reloaded_0_5.SetWindowTextA(arg_9_0, arg_9_1) ~= 0
end

function reloaded_0_0.get_files(arg_10_0)
	local reloaded_10_0 = {}
	local reloaded_10_1 = arg_10_0 .. "\\*"
	local reloaded_10_2 = ffi.new("WIN32_FIND_DATAA[1]")
	local reloaded_10_3 = reloaded_0_6.FindFirstFileA(reloaded_10_1, reloaded_10_2)

	if reloaded_10_3 == ffi.cast("HANDLE", -1) then
		print(reloaded_10_3 .. "ERROR")

		return reloaded_10_0
	end

	repeat
		if ffi.string(reloaded_10_2[0].cFileName) ~= "." and ffi.string(reloaded_10_2[0].cFileName) ~= ".." then
			minitable = {}
			minitable[1] = ffi.string(reloaded_10_2[0].cFileName)
			minitable[2] = arg_10_0 .. "\\" .. ffi.string(reloaded_10_2[0].cFileName)

			table.insert(reloaded_10_0, minitable)
		end
	until not reloaded_0_6.FindNextFileA(reloaded_10_3, reloaded_10_2)

	reloaded_0_6.FindClose(reloaded_10_3)

	return reloaded_10_0
end

function reloaded_0_0.setWindowAlpha(arg_11_0, arg_11_1)
	local reloaded_11_0 = ffi.C.GetWindowLongA(arg_11_0, -20)
	local reloaded_11_1 = bit.bor(reloaded_11_0, 524288)

	ffi.C.SetWindowLongA(arg_11_0, -20, reloaded_11_1)
	ffi.C.SetLayeredWindowAttributes(arg_11_0, 0, arg_11_1, 2)
end

function reloaded_0_0.getWindowText(arg_12_0)
	local reloaded_12_0 = ffi.new("char[1024]")
	local reloaded_12_1 = reloaded_0_5.GetWindowTextA(arg_12_0, reloaded_12_0, 1024)

	return ffi.string(reloaded_12_0, reloaded_12_1)
end

function reloaded_0_0.GetAllWindowHWnd(arg_13_0)
	ttable = {}

	if arg_13_0 == 1 then
		ffi.C.EnumWindows(reloaded_0_7, 0)
	else
		ffi.C.EnumWindows(reloaded_0_8, 0)
	end

	return ttable
end

function reloaded_0_0.IsWindowVisible(arg_14_0)
	if ffi.C.IsWindowVisible(arg_14_0) ~= 0 then
		return true
	else
		return false
	end
end

function reloaded_0_0.getHWndByTitle(arg_15_0)
	return (reloaded_0_5.FindWindowA(nil, arg_15_0))
end

function reloaded_0_0.cmd(arg_16_0, arg_16_1, arg_16_2)
	return reloaded_0_1.ShellExecuteA(nil, "open", "cmd", "/c " .. arg_16_0, nil, arg_16_1)
end

function Download(arg_17_0, arg_17_1)
	reloaded_0_3.DeleteUrlCacheEntryA(arg_17_0)
	reloaded_0_2.URLDownloadToFileA(nil, arg_17_0, arg_17_1, 0, 0)
end

function reloaded_0_0.download(arg_18_0, arg_18_1)
	return Download(arg_18_0, arg_18_1)
end

function reloaded_0_0.beep(arg_19_0, arg_19_1)
	return ffi.C.Beep(arg_19_0, arg_19_1)
end

function reloaded_0_0.sleep(arg_20_0)
	return ffi.C.Sleep(arg_20_0)
end

function reloaded_0_0.MessageBox(arg_21_0, arg_21_1, arg_21_2)
	return ffi.C.MessageBoxA(nil, " " .. arg_21_0, " " .. arg_21_1, arg_21_2)
end

function reloaded_0_0.playsound(arg_22_0)
	reloaded_0_4.PlaySound(arg_22_0, nil, 131075)
end

return reloaded_0_0
