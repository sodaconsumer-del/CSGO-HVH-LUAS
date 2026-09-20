local ffi = require("ffi")

ffi.cdef[[
    typedef void* HWND;
    typedef const char* LPCSTR;
    void* ShellExecuteA(HWND hwnd, LPCSTR lpOperation, LPCSTR lpFile, LPCSTR lpParameters, LPCSTR lpDirectory, int nShowCmd);
]]

local shell32 = ffi.load("shell32")

local function open_folder(folder_path)
    local result = shell32.ShellExecuteA(nil, "explore", folder_path, nil, nil, 1)
    -- Cast the result to a pointer and check if it is invalid
    if result == nil or tonumber(ffi.cast("intptr_t", result)) <= 32 then
        error("Failed to open folder, error code: " .. tonumber(ffi.cast("intptr_t", result)))
    end
end

return {
    open_folder = open_folder
}