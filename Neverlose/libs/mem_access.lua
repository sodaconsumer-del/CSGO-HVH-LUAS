local memory = { procId = 0 }
ffi.cdef[[
    typedef unsigned long ULONG_PTR;
    typedef long LONG;
    typedef uint32_t DWORD;
    typedef void* HANDLE;
    typedef void* HMODULE;
    typedef void* LPVOID;
    typedef const void* LPCVOID;
    typedef unsigned char BYTE;
    typedef bool BOOL;
    typedef size_t SIZE_T;

    typedef enum {
        TH32CS_SNAPPROCESS = 0x00000002,
        TH32CS_SNAPMODULE = 0x00000008,
        TH32CS_SNAPMODULE32 = 0x00000010
    } SnapshotFlags;

    typedef enum {
        INVALID_HANDLE_VALUE = -1
    }  HandleValues;

    typedef enum {
        PROCESS_VM_READ = 0x0010,
        PROCESS_VM_WRITE = 0x0020,
        PROCESS_VM_OPERATION = 0x0008,
        PROCESS_ALL_ACCESS = PROCESS_VM_READ | PROCESS_VM_WRITE | PROCESS_VM_OPERATION ,
        PROCESS_QUERY_INFORMATION = 0x0400
    } ProcessAccessRights;

    typedef enum {
        MAX_PATH = 260,
        MAX_MODULE_NAME32 = 255
    } MaxPath;

    typedef struct _MODULEENTRY32 {
        DWORD   dwSize;
        DWORD   th32ModuleID;
        DWORD   th32ProcessID;
        DWORD   GlblcntUsage;
        DWORD   ProccntUsage;
        BYTE  * modBaseAddr;
        DWORD   modBaseSize;
        HMODULE hModule;
        char   szModule[MAX_MODULE_NAME32 + 1];
        char   szExePath[MAX_PATH];
    } MODULEENTRY32, *PMODULEENTRY32 , *LPMODULEENTRY32;

    typedef struct _PROCESSENTRY32 {
        DWORD   dwSize;
        DWORD   cntUsage;
        DWORD   th32ProcessID;
        ULONG_PTR th32DefaultHeapID;
        DWORD   th32ModuleID;
        DWORD   cntThreads;
        DWORD   th32ParentProcessID;
        LONG    pcPriClassBase;
        DWORD   dwFlags;
        char    szExeFile[MAX_PATH];
    } PROCESSENTRY32, *PPROCESSENTRY32;

    HANDLE CreateToolhelp32Snapshot(DWORD dwFlags, DWORD th32ProcessID);
    BOOL Module32First(HANDLE hSnapshot, LPMODULEENTRY32 lpme);
    BOOL Module32Next(HANDLE hSnapshot, LPMODULEENTRY32 lpme);
    BOOL Process32First(HANDLE hSnapshot, PROCESSENTRY32 *lppe);
    BOOL Process32Next(HANDLE hSnapshot, PROCESSENTRY32 *lppe);
    HANDLE OpenProcess(DWORD dwDesiredAccess, BOOL bInheritHandle, DWORD dwProcessId);
    BOOL ReadProcessMemory(HANDLE hProcess, LPCVOID lpBaseAddress, LPVOID lpBuffer, SIZE_T nSize, SIZE_T* lpNumberOfBytesRead);
    BOOL WriteProcessMemory(HANDLE hProcess, LPVOID lpBaseAddress, LPCVOID lpBuffer, SIZE_T nSize, SIZE_T *lpNumberOfBytesWritten);
    void CloseHandle(HANDLE hObject);
]]
local kernel32 = ffi.load("kernel32")

function memory:getProcSnapshot()
    local hSnap = kernel32.CreateToolhelp32Snapshot(ffi.C.TH32CS_SNAPPROCESS, 0)

    if ffi.cast("HANDLE", hSnap) == ffi.cast("HANDLE", ffi.C.INVALID_HANDLE_VALUE) then
        print_raw("[MEMORY] CreateToolhelp32Snapshot failed")
        return ffi.C.INVALID_HANDLE_VALUE
    end

    return hSnap
end

function memory:getHandle( print )
    if memory.procId == 0 then
        print_raw("[MEMORY] getHandle: procId is nil")
        return nil
    end

    local hProc = kernel32.OpenProcess(ffi.C.PROCESS_ALL_ACCESS, false, memory.procId)

    if ffi.cast("HANDLE", hProc) == ffi.cast("HANDLE", ffi.C.INVALID_HANDLE_VALUE) then
        print_raw("[MEMORY] OpenProcess failed")
        return ffi.C.INVALID_HANDLE_VALUE
    end

    if print then
        print_raw("[MEMORY] Successfully opened handle")
    end

    return hProc

end


function memory:dumpModules()
    
    local hSnap = kernel32.CreateToolhelp32Snapshot(ffi.C.TH32CS_SNAPMODULE + ffi.C.TH32CS_SNAPMODULE32, memory.procId)

    if ffi.cast("HANDLE", hSnap) == ffi.cast("HANDLE", ffi.C.INVALID_HANDLE_VALUE) then
        print_raw("[MEMORY] CreateToolhelp32Snapshot failed")
    end

    local modBaseAddr = ffi.new("uintptr_t[1]")
    modBaseAddr[0] = 0

    local modEntry = ffi.new("MODULEENTRY32")
    modEntry.dwSize = ffi.sizeof("MODULEENTRY32")

    if kernel32.Module32First(hSnap, modEntry) then
        repeat
            modBaseAddr[0] = ffi.cast("uintptr_t", modEntry.modBaseAddr)
            print_raw(string.format("[MEMORY] Module: %s, Base: 0x%X, Size: 0x%X", ffi.string(modEntry.szModule), modBaseAddr[0], modEntry.modBaseSize))
        until not kernel32.Module32Next(hSnap, modEntry)
    end

    kernel32.CloseHandle(hSnap)

end

function memory:GetModuleBaseAddress( modName )

    local hSnap = kernel32.CreateToolhelp32Snapshot(ffi.C.TH32CS_SNAPMODULE + ffi.C.TH32CS_SNAPMODULE32, memory.procId)

    if ffi.cast("HANDLE", hSnap) == ffi.cast("HANDLE", ffi.C.INVALID_HANDLE_VALUE) then
        print_raw("[MEMORY] CreateToolhelp32Snapshot failed")
        return ffi.C.INVALID_HANDLE_VALUE
    end

    local modBaseAddr = ffi.new("uintptr_t[1]")
    local modEntry = ffi.new("MODULEENTRY32")
    modEntry.dwSize = ffi.sizeof("MODULEENTRY32")
    modBaseAddr[0] = -1

    if kernel32.Module32First(hSnap, modEntry) then
        repeat
            if ffi.string(modEntry.szModule) == modName then
                modBaseAddr[0] = ffi.cast("uintptr_t", modEntry.modBaseAddr)
                break
            end
        until not kernel32.Module32Next(hSnap, modEntry)
    end

    kernel32.CloseHandle(hSnap)
    return modBaseAddr[0]
end

function memory:findProcID( processname )
    local hProcessSnap = kernel32.CreateToolhelp32Snapshot(ffi.C.TH32CS_SNAPPROCESS, 0)
    if ffi.cast("HANDLE", hProcessSnap) == ffi.cast("HANDLE", ffi.C.INVALID_HANDLE_VALUE) then
        return ffi.C.INVALID_HANDLE_VALUE
    end

    local pe32 = ffi.new("PROCESSENTRY32")
    pe32.dwSize = ffi.sizeof("PROCESSENTRY32")

    if not kernel32.Process32First(hProcessSnap, pe32) then
        kernel32.CloseHandle(hProcessSnap)
        return ffi.C.INVALID_HANDLE_VALUE
    end

    local result = 0

    repeat
        if processname == ffi.string(pe32.szExeFile) then
            result = pe32.th32ProcessID
            break
        end
    until not kernel32.Process32Next(hProcessSnap, pe32)

    kernel32.CloseHandle(hProcessSnap)

    return result
    
end

function memory:read( address, valueType )

    local hProc = memory:getHandle()

    if ffi.cast("HANDLE", hProc) == ffi.cast("HANDLE", ffi.C.INVALID_HANDLE_VALUE) then
        print_raw("[MEMORY] OpenProcess failed")
        return false
    end

    local value = ffi.new(valueType .. "[1]")
    local bytesRead = ffi.new("SIZE_T[1]")
    bytesRead[0] = 0

    if not kernel32.ReadProcessMemory(hProc, ffi.cast("LPCVOID", address), value, ffi.sizeof(valueType), bytesRead) then
        print_raw("[MEMORY] ReadProcessMemory failed")
        return false
    end

    kernel32.CloseHandle(hProc)

    return value[0]
end


function memory:write( address, value, valueType)

    if memory.procId == 0 or address == nil or value == nil or valueType == nil or valueType == "" then
        print_raw("[MEMORY] WriteProcessMemory failed")
        return false
    end

    local hProc = memory:getHandle(procId)

    if ffi.cast("HANDLE", hProc) == ffi.cast("HANDLE", ffi.C.INVALID_HANDLE_VALUE) then
        print_raw("[MEMORY] OpenProcess failed")
        return false
    end

    local buffer = ffi.new(valueType .. "[1]")
    buffer[0] = value

    local bytesWritten = ffi.new("SIZE_T[1]")
    bytesWritten[0] = 0

    if not kernel32.WriteProcessMemory(hProc, ffi.cast("LPVOID", address), ffi.cast("LPVOID", buffer), ffi.sizeof(valueType), bytesWritten) then
        print_raw("[MEMORY] WriteProcessMemory failed")
        return false
    end

    kernel32.CloseHandle(hProc)

    return true
end

function memory:GetDMAAddr( baseAddr, offsets)

    if memory.procId == 0 or baseAddr == nil or offsets == nil then
        print_raw("[MEMORY] GetDMAAddr failed")
        return false
    end
    

    local dmaAddr = ffi.cast("uintptr_t", baseAddr)

    for i = 1, #offsets do
        local value = memory:read(dmaAddr, "uintptr_t")
        dmaAddr = value + offsets[i]
    end

    return dmaAddr
end

function memory:new(name)

    memory.procId = memory:findProcID(name)

    if memory.procId == 0 then
        print_raw("[MEMORY] Failed to find process ID")
        return -1
    end
    
end

return memory