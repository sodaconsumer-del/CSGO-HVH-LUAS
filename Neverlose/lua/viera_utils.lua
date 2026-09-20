local IS_BETA = true

local ffi     = require("ffi")
local bit     = require("bit")
local inspect = require "neverlose/inspect"

local calculate_padding, text_format do
    function calculate_padding(units)
        local spaces = 0
        local invisibles = 0
        while units >= 6 do
            spaces = spaces + 1
            units = units - 3
        end
        while units >= 4 do
            invisibles = invisibles + 1
            units = units - 2
        end
        if units == 3 then
            spaces = spaces + 1
        elseif units == 2 then
            invisibles = invisibles + 1
        end
        return spaces, invisibles
    end

    function text_format(icon, text, left_pad, right_pad, extra_pad, link_color, extra_icon)
        left_pad  = left_pad  or 0
        right_pad = right_pad or 0
        extra_pad = extra_pad or 0
        local empty_unicode_char = "\226\128\138"
        local space_char = " "
        local l_spaces, l_invis = 0, 0
        local r_spaces, r_invis = 0, 0
        local e_spaces, e_invis = 0, 0
        if left_pad  >= 2 then l_spaces, l_invis = calculate_padding(left_pad)  end
        if right_pad >= 2 then r_spaces, r_invis = calculate_padding(right_pad) end
        if extra_pad >= 2 then e_spaces, e_invis = calculate_padding(extra_pad) end
        local result = ""
        result = result
            .. string.rep(space_char, l_spaces)
            .. string.rep(empty_unicode_char, l_invis)
        if type(link_color) == "userdata" then
            link_color = "\a" .. link_color:to_hex()
        end
        if icon then
            local icon_color = link_color or "\a{Link Active}"
            local i = ui.get_icon(icon)
            if #i == 0 then i = tostring(icon) end
            result = result .. string.format("%s%s\aDEFAULT", icon_color, i)
        end
        result = result
            .. string.rep(space_char, r_spaces)
            .. string.rep(empty_unicode_char, r_invis)
        result = result .. (text or "")
        result = result
            .. string.rep(space_char, e_spaces)
            .. string.rep(empty_unicode_char, e_invis)
        if extra_icon then
            local icon_color = link_color or "\a{Link Active}"
            local i = ui.get_icon(extra_icon)
            if #i == 0 then i = tostring(extra_icon) end
            result = result .. string.format("%s%s\aDEFAULT", icon_color, i)
        end
        return result
    end
end

ffi.cdef[[
    typedef struct { float x, y, z; } vec3_t;
    typedef float matrix3x4_t[3][4];

    typedef struct {
        float anim_time;
        float fade_out_time;
        void* studio_hdr;
        int   dispatched_src;
        int   dispatched_dst;
        int   order;
        int   sequence;
        float prev_cycle;
        float weight;
        float weight_delta_rate;
        float playback_rate;
        float cycle;
        void* owner;
        int   invalidate_physics_bits;
    } anim_layer_t;

    typedef struct {
        matrix3x4_t* matrix_center;
        matrix3x4_t* matrix_left;
        matrix3x4_t* matrix_right;
        matrix3x4_t* matrix_secondary;
        float  pose_parameters[24];
        anim_layer_t anim_layers[13];
        char   pad[184];
    } lag_anim_data_t;

    typedef struct {
        vec3_t origin;
        vec3_t velocity;
        vec3_t abs_velocity;
        float  simulation_time;
        vec3_t mins;
        float  maxs_x;
        float  maxs_y;
        float  aim_yaw_max;
        int    choked_ticks;
        char   pad_44[24];
        float  desync_weight;
        char   pad_60[4];
        float  eye_pitch;
        float  abs_yaw;
        float  body_yaw;
        vec3_t view_offset;
        float  origin_prev_x;
        float  origin_prev_y;
        int    server_tick;
        char   pad_88[12];
        float  lagcomp_simtime;
        float  duck_amount;
        char   pad_9C[4];
        float  maxs_z;
        int    lagcomp_valid;
        char   pad_A8[4];
        int    extrap_cleared;
        int    record_flags;
        char   pad_B4[4];
        lag_anim_data_t anim;
    } lag_record_t;

    typedef struct {
        void*          pad;
        lag_record_t** records;
        int            capacity;
        int            head;
        int            count;
    } lag_ringbuf_t;

    typedef struct {
        void*         BaseAddress;
        void*         AllocationBase;
        unsigned long AllocationProtect;
        unsigned long RegionSize;
        unsigned long State;
        unsigned long Protect;
        unsigned long Type;
    } MEMORY_BASIC_INFORMATION;
    unsigned long VirtualQuery(const void*, MEMORY_BASIC_INFORMATION*, unsigned long);

    int   VirtualProtect(void*, unsigned long, unsigned long, unsigned long*);
    void* VirtualAlloc(void*, unsigned long, unsigned long, unsigned long);
    int   VirtualFree(void* addr, unsigned long size, unsigned long type);
    void* GetCurrentProcess(void);
    int   FlushInstructionCache(void* hProcess, const void* base, unsigned long size);
]]

local W = nil

local MBI_SZ                 = ffi.sizeof("MEMORY_BASIC_INFORMATION")
local PAGE_EXECUTE_READWRITE = 0x40
local MEM_COMMIT_RESERVE     = 0x3000
local MEM_RELEASE            = 0x8000

local VirtualQuery, scan, scan_all, scan_exec, ptr, wi32, patch, save do
    function VirtualQuery(addr)
        local mbi = ffi.new("MEMORY_BASIC_INFORMATION")
        if ffi.C.VirtualQuery(addr, mbi, MBI_SZ) == 0 then return nil end
        return mbi
    end

    function scan(base, size, pat)
        local p   = ffi.cast("uint8_t*", base)
        local len = #pat
        for i = 0, size - len do
            local ok = true
            for j = 1, len do
                if pat[j] ~= W and p[i + j - 1] ~= pat[j] then ok = false; break end
            end
            if ok then return ffi.cast("uint8_t*", p + i) end
        end
    end

    function scan_all(b, s, pat)
        local results = {}
        local p   = ffi.cast("uint8_t*", b)
        local len = #pat
        for i = 0, s - len do
            local ok = true
            for j = 1, len do
                if pat[j] ~= W and p[i + j - 1] ~= pat[j] then ok = false; break end
            end
            if ok then results[#results + 1] = p + i end
        end
        return results
    end

    function scan_exec(pat)
        local plen, addr = #pat, 0x10000
        while addr < 0x7FFF0000 do
            local m = VirtualQuery(ffi.cast("void*", addr))
            if not m then
                addr = addr + 0x10000
            else
                local base_n = tonumber(ffi.cast("uintptr_t", m.BaseAddress))
                local end_n  = base_n + tonumber(m.RegionSize)
                if m.State == 0x1000 and bit.band(m.Protect, 0xF0) ~= 0
                   and bit.band(m.Protect, 0x01) == 0 and bit.band(m.Protect, 0x100) == 0 then
                    local p = ffi.cast("uint8_t*", base_n)
                    for i = 0, end_n - base_n - plen do
                        local ok = true
                        for j = 1, plen do
                            if pat[j] and p[i+j-1] ~= pat[j] then ok = false; break end
                        end
                        if ok then return p + i end
                    end
                end
                addr = end_n > addr and end_n or (addr + 0x10000)
            end
        end
    end

    function ptr(cdata)
        return tonumber(ffi.cast("uintptr_t", cdata))
    end

    function wi32(abs_addr, v)
        local b = ffi.cast("uint8_t*", abs_addr)
        b[0] = bit.band(v, 0xFF)
        b[1] = bit.band(bit.rshift(v, 8),  0xFF)
        b[2] = bit.band(bit.rshift(v, 16), 0xFF)
        b[3] = bit.band(bit.rshift(v, 24), 0xFF)
    end

    function patch(addr, bytes)
        local p = addr
        for i, b in ipairs(bytes) do p[i-1] = b end
    end

    function save(addr, n)
        local p = ffi.cast("uint8_t*", addr)
        local t = {}
        for i = 0, n - 1 do t[i + 1] = p[i] end
        return t
    end
end

local base, size do
    local a = scan_exec({0xF3,0x0F,0x5B,0xCA,0x0F,0x5B,0xC9,0x0F,0x2E,0xCB})
    if a == nil then return end
    local memory = VirtualQuery(a)
    if memory == nil then return end
    base = memory.AllocationBase
    size = 0x3501000
end

local MAX_ENTITY_INDEX = 64
local g_target_mode = "Default"
local on_shutdown   = {}

local interpoint = "\226\128\162"

local a_ui = ui.create("A", "Targeting")
local b_ui = ui.create("A", "Lag Records")
local c_ui = ui.create("A", "Extrapolation")
local d_ui = ui.create("A", "Fixes")
local e_ui = ui.create("A", "Fake Duck")
local f_ui = ui.create("A", "Debug")

local table_ptr do
    local table_hit = scan(base, size, {0x89, 0x86, 0xB0, 0x00, 0x00, 0x00, 0xA1, W, W, W, W, 0x89, 0x86, 0xAC, 0x00, 0x00, 0x00})
        or error("failed to find ring pattern")
    table_ptr = ffi.cast("uint8_t**", ffi.cast("uint32_t*", table_hit + 7)[0])
end

local function get_table_base()
    local tb = table_ptr[0]
    if tb == nil or tb == ffi.NULL then return nil end
    return tb
end

local function get_ring_safe(idx)
    if idx < 0 or idx > MAX_ENTITY_INDEX then return nil end
    local tb = get_table_base()
    if tb == nil then return nil end
    local ring = ffi.cast("lag_ringbuf_t*", tb + idx * 0x10940)
    if ring.records == nil then return nil end
    if ring.capacity <= 0 then return nil end
    return ring
end

local g_extrap_cached_ptr do
    local hit = scan(base, size, {
        0x31, 0xC0, 0xC3,
        0x83, 0x3D, W, W, W, W, 0x00,
        0x0F, 0x94, 0xC0,
        0xC3
    })
    if hit then
        g_extrap_cached_ptr = ffi.cast("int32_t*", ffi.cast("uint32_t*", hit + 5)[0])
    end
end

local g_log_hittable_ptr do
    local hit = scan(base, size, {
        0x80, 0x3D, W, W, W, W, 0x00,
        0x0F, 0x84, W, W, W, W,
        0x83, 0x3D, W, W, W, W, 0x00,
        0x0F, 0x8E, W, W, W, W,
        0xB3, 0x01
    })
    if hit then
        g_log_hittable_ptr   = ffi.cast("uint8_t*",  ffi.cast("uint32_t*", hit + 2)[0])
    end
end

local g_server_tick_ptr do
    local hit = scan(base, size, {0xA1, W, W, W, W, 0x2B, 0x47, 0x74})
    if hit then
        g_server_tick_ptr = ffi.cast("int32_t*", ffi.cast("uint32_t*", hit + 1)[0])
    end
end

local function get_record_at(ring, offset)
    if not ring or ring.count <= 0 then return nil end
    if offset < 0 or offset >= ring.count then return nil end
    local j = bit.band(ring.head + offset, ring.capacity - 1)
    local rec = ring.records[j]
    if rec == nil then return nil end
    local mbi = VirtualQuery(rec)
    if not mbi or mbi.State ~= 0x1000 or bit.band(mbi.Protect, 0x101) ~= 0 then return nil end
    return rec
end

local function is_extrap_active()
    if not g_extrap_cached_ptr then return false end
    return g_extrap_cached_ptr[0] == 0
end

local force_center_resolve do
    a_ui:switch(text_format(interpoint, "Force center resolve", 2, 7, 7)):set_callback(function(e)
        local value = e:get()
        events.createmove(function(cmd)

            if true then return end
            entity.get_players(true, false, function(ent)
                if ent == nil or not ent:is_alive() then return end
                if ent:is_dormant() then return end
                local idx = ent:get_index()

                if ent.m_iTeamNum == 2 and ent.m_vecVelocity:length2d() < 91 then
                    return;
                end

                local ring = get_ring_safe(idx)
                if ring == nil then return end
                if ring.count <= 0 then return end

                local cap = ring.capacity
                for i = 0, ring.count - 1 do
                    local j = bit.band(ring.head - i, cap - 1)
                    local rec = ring.records[j]
                    if rec == nil then goto continue end

                    local center = rec.anim.matrix_center
                    if center == nil then goto continue end
                    if rec.anim.matrix_left == center and rec.anim.matrix_right == center then goto continue end

                    rec.anim.matrix_left  = center
                    rec.anim.matrix_right = center

                    ::continue::
                end
            end)
        end, value)
    end, true):tooltip("Force all lag records to use center body yaw matrix")
end

local preserve_valid_records do
    local scan_skip_sig = scan(base, size, {0xA9, 0x08, 0x08, 0x00, 0x00, 0x75, 0x0F, 0x43})
    local scan_skip_orig = scan_skip_sig and save(scan_skip_sig + 6, 1)

    if IS_BETA and scan_skip_sig then
        b_ui:switch(text_format(interpoint, "Preserve valid records", 2, 7, 7)):set_callback(function(e)
            if e:get() == false then
                patch(scan_skip_sig + 6, scan_skip_orig)
                return
            end
            patch(scan_skip_sig + 6, {0x00})
        end, true):tooltip("Keep valid-flagged records that would normally be skipped during scan")
    end

    on_shutdown[#on_shutdown + 1] = function()
        if scan_skip_orig then patch(scan_skip_sig + 6, scan_skip_orig) end
    end
end

local target_priority do
    local saved_counts = {}
    local priority_idx = -1

    local function restore_counts()
        for idx, count in pairs(saved_counts) do
            local ring = get_ring_safe(idx)
            if ring and ring.count == 0 then
                ring.count = count
            end
        end
        saved_counts = {}
    end

    local function suppress_others(skip_idx)
        entity.get_players(true, false, function(ent)
            if ent == nil or not ent:is_alive() then return end
            if ent:is_dormant() then return end
            local idx = ent:get_index()
            if idx == skip_idx then return end
            local ring = get_ring_safe(idx)
            if ring == nil or ring.count <= 0 then return end
            saved_counts[idx] = ring.count
            ring.count = 0
        end)
    end

    local function find_closest_to_crosshair()
        local camera_position = render.camera_position()
        if not camera_position then return -1 end
        local camera_angles = render.camera_angles()
        if not camera_angles then return -1 end

        local direction = vector():angles(camera_angles)

        local closest_distance, closest_enemy = math.huge, -1
        for _, enemy in ipairs(entity.get_players(true)) do
            if enemy:is_alive() and not enemy:is_dormant() then
                local head_position = enemy:get_hitbox_position(1)
                if head_position then
                    local ray_distance = head_position:dist_to_ray(
                        camera_position, direction
                    )
                    if ray_distance < closest_distance then
                        closest_distance = ray_distance
                        closest_enemy = enemy:get_index()
                    end
                end
            end
        end

        return closest_enemy
    end

    local function find_bomb_carrier()
        local res = entity.get_player_resource()
        if not res then return -1 end

        local idx = -1

        entity.get_players(true, false, function(ent)
            if ent == nil or ent:is_dormant() then
                return;
            end

            local ent_index = ent:get_index()

            if ent_index == res.m_iPlayerC4 then
                idx = ent_index;
            end
        end)

        return idx
    end

    local function find_lowest_health()
        local best_idx, best_hp = -1, math.huge

        entity.get_players(true, false, function(ent)
            if ent == nil or not ent:is_alive() or ent:is_dormant() then return end
            local hp = ent.m_iHealth
            if hp and hp < best_hp then 
                best_hp = hp; 
                best_idx = ent:get_index() 
            end
        end)

        return best_idx
    end

    a_ui:combo(text_format(interpoint, "Target priority", 2, 7, 7),
               "Default", "Closest to crosshair", "Bomb priority", "Lowest health"):set_callback(function(e)
        g_target_mode = e:get()
        if g_target_mode == "Default" then restore_counts() end
    end, true):tooltip(
        "Override target selection order.\n"..
        "Falls back to default every 3 ticks to avoid tunnel vision")

    local PREFER_TICKS = 2
    local tick_counter = 0

    events.createmove:set(function(cmd)
        restore_counts()

        if g_target_mode == "Default" then tick_counter = 0; return end

        local lp = entity.get_local_player()
        if not lp or not lp:is_alive() then return end

        if g_target_mode == "Closest to crosshair" then
            priority_idx = find_closest_to_crosshair()
        elseif g_target_mode == "Bomb priority" then
            priority_idx = find_bomb_carrier()
        elseif g_target_mode == "Lowest health" then
            priority_idx = find_lowest_health()
        end

        if priority_idx <= 0 then return end

        local ring = get_ring_safe(priority_idx)
        if not ring or ring.count <= 0 then return end

        tick_counter = tick_counter + 1
        if tick_counter > PREFER_TICKS then
            tick_counter = 0
            return
        end

        suppress_others(priority_idx)
    end, true)

    on_shutdown[#on_shutdown + 1] = function()
        restore_counts()
    end
end

local defensive_bt_fix do
    local defensive_bt_install, defensive_bt_uninstall

    local def_bt_sig = scan(base, size, {
        0x80, 0x3D, W, W, W, W, 0x00,
        0x0F, 0x84, W, W, W, W,
        0x83, 0x3D, W, W, W, W, 0x00,
        0x0F, 0x8E, W, W, W, W,
        0xB3, 0x01
    }) or error("failed to find defensive backtrack gate pattern")

    local DEF_BT = {
        installed  = false,
        stub       = nil,
        orig_bytes = nil,
    }

    function defensive_bt_install()
        if DEF_BT.installed then return true end

        local jz_addr = ptr(def_bt_sig + 7)
        local cont_addr = ptr(def_bt_sig + 13)

        local stub = ffi.cast("uint8_t*",
            ffi.C.VirtualAlloc(nil, 32, MEM_COMMIT_RESERVE, PAGE_EXECUTE_READWRITE))
        if stub == nil then return false end
        local sa = ptr(stub)

        stub[0] = 0xC6
        stub[1] = 0x46
        stub[2] = 0x1A
        stub[3] = 0x01
        stub[4] = 0xE9
        wi32(sa + 5, cont_addr - (sa + 9))

        DEF_BT.orig_bytes = save(def_bt_sig + 9, 4)

        local old = ffi.new("unsigned long[1]")
        if ffi.C.VirtualProtect(ffi.cast("void*", jz_addr), 6,
                                PAGE_EXECUTE_READWRITE, old) == 0 then
            ffi.C.VirtualFree(stub, 0, MEM_RELEASE)
            return false
        end

        wi32(jz_addr + 2, sa - cont_addr)

        ffi.C.VirtualProtect(ffi.cast("void*", jz_addr), 6, old[0], old)
        ffi.C.FlushInstructionCache(ffi.C.GetCurrentProcess(),
                                    ffi.cast("void*", jz_addr), 6)

        DEF_BT.installed = true
        DEF_BT.stub      = stub
        return true
    end

    function defensive_bt_uninstall()
        if not DEF_BT.installed then return end

        if DEF_BT.orig_bytes then
            local jz_addr = ptr(def_bt_sig + 7)
            local old = ffi.new("unsigned long[1]")
            ffi.C.VirtualProtect(ffi.cast("void*", jz_addr), 6,
                                 PAGE_EXECUTE_READWRITE, old)
            patch(ffi.cast("uint8_t*", ptr(def_bt_sig + 9)), DEF_BT.orig_bytes)
            ffi.C.VirtualProtect(ffi.cast("void*", jz_addr), 6, old[0], old)
            ffi.C.FlushInstructionCache(ffi.C.GetCurrentProcess(),
                                        ffi.cast("void*", jz_addr), 6)
        end

        if DEF_BT.stub then ffi.C.VirtualFree(DEF_BT.stub, 0, MEM_RELEASE) end

        DEF_BT.installed  = false
        DEF_BT.stub       = nil
        DEF_BT.orig_bytes = nil
    end

    if IS_BETA then
        a_ui:switch(text_format(interpoint, "Defensive on backtrack", 2, 7, 7)):set_callback(function(e)
            if e:get() then
                defensive_bt_install()
            else
                defensive_bt_uninstall()
            end
        end, true):tooltip(
            "Activate defensive mode when shooting backtracked records,\n"..
            "not only current-position shots")
    end

    on_shutdown[#on_shutdown + 1] = function()
        defensive_bt_uninstall()
    end
end

local defensive_early_tick do
    local def_tick_sig = scan(base, size, {
        0x4F, 0x3B, 0x3D, W, W, W, W, 0x0F, 0x8F, W, W, W, W, 0x8B, 0x45
    }) or error("failed to find defensive tickcount pattern")
    print(def_tick_sig)
    local def_tick_orig = save(def_tick_sig, 1)

    if IS_BETA then
        a_ui:switch(text_format(interpoint, "Early defensive activation", 2, 7, 7)):set_callback(function(e)
            if e:get() then
                patch(def_tick_sig, {0x90})
            else
                patch(def_tick_sig, def_tick_orig)
            end
        end, true):tooltip("Activate defensive 1 tick earlier by skipping the tickcount decrement")
    end

    on_shutdown[#on_shutdown + 1] = function()
        patch(def_tick_sig, def_tick_orig)
    end
end

local extrap_addon do
    local extrap_primary_install, extrap_primary_uninstall

    local g_glob_sig = scan(base, size, {
        0xB1, 0x01, 0x31, 0xC0,
        0x80, 0x3D, W, W, W, W, 0x00, 0x0F, 0x85, W, W, W, W,
        0x80, 0x3D, W, W, W, W, 0x00, 0x0F, 0x84,
    }) or error("extrap: failed to find breaklc/                                             globals pattern")
    local g_hittable_a = ffi.cast("uint32_t*", g_glob_sig + 6)[0]
    local g_breaklc_a  = ffi.cast("uint32_t*", g_glob_sig + 19)[0]

    local b1 = bit.band(g_breaklc_a, 0xFF)
    local b2 = bit.band(bit.rshift(g_breaklc_a,  8), 0xFF)
    local b3 = bit.band(bit.rshift(g_breaklc_a, 16), 0xFF)
    local b4 = bit.band(bit.rshift(g_breaklc_a, 24), 0xFF)
    local h1 = bit.band(g_hittable_a, 0xFF)
    local h2 = bit.band(bit.rshift(g_hittable_a,  8), 0xFF)
    local h3 = bit.band(bit.rshift(g_hittable_a, 16), 0xFF)
    local h4 = bit.band(bit.rshift(g_hittable_a, 24), 0xFF)
    
    local se_call_sig = scan(base, size, {
        0xE8, W, W, W, W,
        0x84, 0xC0,
        0x74, W,
        0x89, 0xD9,
        0xFF, 0x74, 0x24, 0x24,
    }) or error("extrap#5: failed to find should_extrapolate call site")

    local EXTRAP_PRIMARY = { installed = false, stub = nil, orig_bytes = nil }

    function extrap_primary_install()
        if EXTRAP_PRIMARY.installed then return true end
        local site_a = ptr(se_call_sig)
        local ret_a  = site_a + 5
        local rel = ffi.cast("int32_t*", se_call_sig + 1)[0]
        local tgt = site_a + 5 + rel

        local stub = ffi.cast("uint8_t*",
            ffi.C.VirtualAlloc(nil, 96, MEM_COMMIT_RESERVE, PAGE_EXECUTE_READWRITE))
        if stub == nil then return false end
        local sa = ptr(stub)

        local b = {
            0x83, 0x3D, b1, b2, b3, b4, 0x00,
            0x74, 0x10,
            0x83, 0x3D, h1, h2, h3, h4, 0x00,
            0x75, 0x07,
            0xB8, 0x01, 0x00, 0x00, 0x00,
            0xEB, 0x05,
            0xE8, 0x00, 0x00, 0x00, 0x00,
            0xE9, 0x00, 0x00, 0x00, 0x00,
        }
        for i, v in ipairs(b) do stub[i - 1] = v end

        local do_real_call = sa + 25
        local ret_jmp      = sa + 30
        wi32(do_real_call + 1, tgt - (do_real_call + 5))
        wi32(ret_jmp + 1, ret_a - (ret_jmp + 5))

        EXTRAP_PRIMARY.orig_bytes = save(se_call_sig, 5)

        local old = ffi.new("unsigned long[1]")
        if ffi.C.VirtualProtect(ffi.cast("void*", site_a), 5,
                                PAGE_EXECUTE_READWRITE, old) == 0 then
            ffi.C.VirtualFree(stub, 0, MEM_RELEASE)
            return false
        end
        local sb = ffi.cast("uint8_t*", site_a)
        sb[0] = 0xE9
        wi32(site_a + 1, sa - (site_a + 5))
        ffi.C.VirtualProtect(ffi.cast("void*", site_a), 5, old[0], old)
        ffi.C.FlushInstructionCache(ffi.C.GetCurrentProcess(),
                                    ffi.cast("void*", site_a), 5)

        EXTRAP_PRIMARY.installed  = true
        EXTRAP_PRIMARY.stub       = stub
        return true
    end

    function extrap_primary_uninstall()
        if not EXTRAP_PRIMARY.installed then return end
        local site_a = ptr(se_call_sig)
        if EXTRAP_PRIMARY.orig_bytes then
            local old = ffi.new("unsigned long[1]")
            ffi.C.VirtualProtect(ffi.cast("void*", site_a), 5,
                                 PAGE_EXECUTE_READWRITE, old)
            patch(ffi.cast("uint8_t*", site_a), EXTRAP_PRIMARY.orig_bytes)
            ffi.C.VirtualProtect(ffi.cast("void*", site_a), 5, old[0], old)
            ffi.C.FlushInstructionCache(ffi.C.GetCurrentProcess(),
                                        ffi.cast("void*", site_a), 5)
        end
        if EXTRAP_PRIMARY.stub then ffi.C.VirtualFree(EXTRAP_PRIMARY.stub, 0, MEM_RELEASE) end
        EXTRAP_PRIMARY.installed  = false
        EXTRAP_PRIMARY.stub       = nil
        EXTRAP_PRIMARY.orig_bytes = nil
    end

    on_shutdown[#on_shutdown + 1] = function()
        extrap_primary_uninstall()
    end
end

local crouch_desync_fix do
    local JITTER_CACHE_SIZE = 8
    local jitter_states = {}

    events.round_start(function()
        jitter_states = {}
    end)

    local function detect_jitter(ring, idx)
        if ring.count < 3 then return false end

        if not jitter_states[idx] then
            jitter_states[idx] = { static_ticks = 0, jitter_ticks = 0 }
        end
        local state = jitter_states[idx]

        local cap = ring.capacity
        local count = math.min(ring.count, JITTER_CACHE_SIZE)

        local avg_delta = 0;

        for i = 0, count - 2 do
            local j_cur  = bit.band(ring.head + i, cap - 1)
            local j_next = bit.band(ring.head + i + 1, cap - 1)

            local rec      = ring.records[j_cur]    
            local prev_rec = ring.records[j_next]
            if rec ~= nil and prev_rec ~= nil then
                local diff = math.abs(math.normalize_yaw(rec.abs_yaw - prev_rec.abs_yaw))

                if diff > 18 then
                    state.jitter_ticks = state.jitter_ticks + 1;
                else
                    state.static_ticks = state.static_ticks + 1;
                end
            end
        end

        if state.jitter_ticks > state.static_ticks then
            return true;
        end

        return avg_delta * 0.5 < 30;
    end

    if IS_BETA then
        d_ui:switch(text_format(interpoint, "Ass bait fix", 2, 7, 7)):set_callback(function(e)
            local value = e:get()
            events.createmove(function(cmd)
                if not get_table_base() then
                    return
                end

                entity.get_players(true, false, function(ent)
                    if ent == nil or not ent:is_alive() then return end
                    if ent:is_dormant() then return end
                    local idx = ent:get_index()

                    local ring = get_ring_safe(idx)
                    if ring == nil or ring.count <= 0 then return end

                    local head = get_record_at(ring, 0)
                    if head == nil then return end

                    if ent.m_iTeamNum ~= 2 then
                        return
                    end

                    local vx, vy = head.velocity.x, head.velocity.y
                    if (vx * vx + vy * vy) > 90.0 then return end
                    if detect_jitter(ring, idx) then return end
                    if math.abs(head.desync_weight) > 0.1 then return end

                    local diff = math.normalize_yaw(head.body_yaw - head.abs_yaw)
                    if math.abs(diff) < 3 then return end

                    local new_weight = diff > 0 and 1.0 or -1.0

                    local cap = ring.capacity
                    for i = 0, ring.count - 1 do
                        local j = bit.band(ring.head + i, cap - 1)
                        local rec = ring.records[j]
                        if rec == nil then goto continue end

                        if rec.duck_amount >= 0.8 then
                            local rvx, rvy = rec.velocity.x, rec.velocity.y
                            if (rvx * rvx + rvy * rvy) <= 90 and math.abs(rec.desync_weight) <= 0.1 then
                                rec.desync_weight = new_weight

                                local m = new_weight > 0 and rec.anim.matrix_right or rec.anim.matrix_left;

                                if rec.anim.matrix_center ~= m then
                                    rec.anim.matrix_center = m;
                                end

                                local sel_m = new_weight > 0 and anim.matrix_left or anim.matrix_right;

                                if new_weight > 0 then
                                    if rec.anim.matrix_left ~= m then
                                        rec.anim.matrix_left = m;
                                    end
                                else
                                    if rec.anim.matrix_right ~= m then
                                        rec.anim.matrix_right = m;
                                    end
                                end
                            end
                        end

                        ::continue::
                    end
                end)
            end, value)
        end, true):tooltip(
            "Fixes missed shots on crouching players who stand still and hide their desync.\n"..
            "Automatically skips players with jitter desync")

        d_ui:switch(text_format(interpoint, "Aim snap correction", 2, 7, 7)):set_callback(function(e)

            local value = e:get()
            events.createmove(function(cmd)
                -- the idea is to properly detect when player presses E and resolve their angle and change matrices, but idk HOW EXACTLY i can detect him pressing E

                --[[
                    if press_e then record[i].desync_weight = resolved ... if resolved < 0 then right matrix (override every matrix on right) else left matrix (override every matrix on left)
                ]]
            end, value)
        end, true):tooltip(
            "Detects when an enemy suddenly turns towards you and corrects the resolver.\n"..
            "Useful against players who spam interact or flick in your direction\n\aFF0000FFDOES NOT WORK NOW. WILL BE ADDED IN FUTURE")
    end
end

local break_dist_bypass do
    local bd_site1 = scan(base, size, {
        0x49, 0x21, 0xD9, 0x8B, 0x0C, 0x88,
        0xE8, W, W, W, W,
        0x84, 0xC0, 0x0F, 0x84
    })
    local bd_site2 = scan(base, size, {
        0x48, 0x21, 0xD8, 0x8B, 0x0C, 0x81,
        0xE8, W, W, W, W,
        0x84, 0xC0, 0x74
    })

    local bd_orig1 = bd_site1 and save(bd_site1 + 6, 5)
    local bd_orig2 = bd_site2 and save(bd_site2 + 6, 5)
    local bd_applied = false
    local bd_nop = {0xB0, 0x00, 0x90, 0x90, 0x90}

    if IS_BETA and bd_site1 and bd_site2 then
        d_ui:switch(text_format(interpoint, "Skip break distance check", 2, 7, 7)):set_callback(function(e)
            if e:get() then
                patch(bd_site1 + 6, bd_nop)
                patch(bd_site2 + 6, bd_nop)
                bd_applied = true
            elseif bd_applied then
                patch(bd_site1 + 6, bd_orig1)
                patch(bd_site2 + 6, bd_orig2)
                bd_applied = false
            end
        end, true):tooltip(
            "Remove lagrecord_within_break_distance calls in select_lagrecord.\n"..
            "Eliminates extra delay when selecting backtrack records")
    end

    on_shutdown[#on_shutdown + 1] = function()
        if bd_applied then
            patch(bd_site1 + 6, bd_orig1)
            patch(bd_site2 + 6, bd_orig2)
            bd_applied = false
        end
    end
end

local record_select_patch do
    local rs_sig = scan(base, size, {
        0xF6, 0x81, 0xB0, 0x00, 0x00, 0x00, 0x08,
        0xF3, 0x0F, 0x10, 0x0C, 0x24,
        0x0F, 0x85, W, W, W, W,
        0x8B, 0x04, 0x87,
        0x80, 0xB8, 0xA4, 0x00, 0x00, 0x00, 0x00
    })

    local rs_eix_sig = scan(base, size, {
        0x8D, 0x59, 0x08,
        0x8B, 0x41, 0x08,
        0x89, 0xD9,
        0xFF, 0x50, 0x28,
        0x83, 0xF8, 0x41
    })
    local rs_eix_site = rs_eix_sig and (rs_eix_sig + 11) or nil

    local fb_sig = scan(base, size, {
        0x8B, 0x0D, W, W, W, W,
        0x8D, 0x87, 0xA4, 0x00, 0x00, 0x00,
        0xF3, 0x0F, 0x10, 0x87, 0x94, 0x00, 0x00, 0x00
    })

    local fn_valid_sig = scan(base, size, {
        0x83, 0x79, 0x10, 0x02, 0x73, 0x03, 0x31, 0xC0, 0xC3, 0x56, 0x8B, 0x41, 0x0C
    })
    local fn_expired_sig = scan(base, size, {
        0x56, 0xA1, W, W, W, W, 0x89, 0xC2, 0xC1, 0xEA, 0x1F, 0x01, 0xC2, 0xD1, 0xFA
    })
    local addr_ret_sig = scan(base, size, {
        0xFF, 0x74, 0x24, W, 0xFF, 0x74, 0x24, W, 0xE8, W, W, W, W,
        0x89, 0xC6, 0x8B, 0x4C, 0x24, 0x0C, 0x31, 0xE1
    })

    local af_sig = scan(base, size, {
        0xF3, 0x0F, 0x10, 0x92, 0x70, 0x03, 0x00, 0x00,
        0xF3, 0x0F, 0x11, 0x90, 0x80, 0x01, 0x00, 0x00
    })

    local rs_stub      = nil
    local rs_orig      = nil
    local rs_eix_orig  = nil
    local rs_applied   = false
    local fb_orig      = nil
    local fb_applied   = false
    local af_orig      = nil
    local af_applied   = false

    local rs_shot_arr = nil
    local rs_is_firing = nil
    local rs_tpr_arr = nil
    local tpr_offset = utils.get_netvar_offset("DT_CSPlayer", "m_flThirdpersonRecoil")

    local function rs_fill_shot_times()
        if not rs_applied or not rs_is_firing then return end
        ffi.fill(rs_is_firing, 65 * 4, 0)
        if rs_tpr_arr then ffi.fill(rs_tpr_arr, 65 * 4, 0) end
        local players = entity.get_players(true)
        if not players then return end
        for _, p in ipairs(players) do
            if p:is_alive() then
                local idx = p:get_index()
                if idx >= 0 and idx < 65 then
                    local ring = get_ring_safe(idx)
                    if ring and ring.count > 0 then
                        local newest = get_record_at(ring, 0)
                        if newest then
                            local oldest = ring.count > 1 and get_record_at(ring, ring.count - 1) or nil
                            local ok, lst = pcall(function()
                                local wpn = p:get_player_weapon()
                                if not wpn then return 0 end
                                local v = wpn.m_fLastShotTime
                                return type(v) == "number" and v or 0
                            end)
                            local last_shot = ok and lst or 0
                            if oldest and last_shot > 0
                               and newest.simulation_time >= last_shot
                               and last_shot > oldest.simulation_time then
                                rs_is_firing[idx] = 1.0
                            else
                                rs_is_firing[idx] = 0.0
                            end
                            if rs_tpr_arr and tpr_offset and tpr_offset > 0 then
                                local ok_tpr, tpr_val = pcall(function()
                                    local ptr = ffi.cast("float*", ffi.cast("uintptr_t", p[0]) + tpr_offset)
                                    return ptr[0]
                                end)
                                rs_tpr_arr[idx] = ok_tpr and tpr_val or 0
                            end
                        end
                    else
                        rs_is_firing[idx] = 0.0
                    end
                end
            end
        end
    end
    events.createmove(rs_fill_shot_times)


    local function rs_install()
        if rs_applied or not rs_sig or not fn_valid_sig or not fn_expired_sig or not addr_ret_sig then return end
        if rs_sig[0] == 0xE9 then return end

        if not rs_stub then
            rs_stub = ffi.cast("uint8_t*",
                ffi.C.VirtualAlloc(nil, 4096, MEM_COMMIT_RESERVE, PAGE_EXECUTE_READWRITE))
            if rs_stub == nil then return end
        end

        local cave = ptr(rs_stub)
        local site = ptr(rs_sig)

        local addr_527   = site + 34 + tonumber(ffi.cast("int8_t*", rs_sig + 33)[0])
        local addr_7E2   = site + 39 + tonumber(ffi.cast("int32_t*", rs_sig + 35)[0])
        local g_cmd_ctx  = tonumber(ffi.cast("uint32_t*", addr_7E2 + 8)[0])
        local fn_valid   = ptr(fn_valid_sig)
        local fn_expired = ptr(fn_expired_sig)
        local addr_ret   = ptr(addr_ret_sig) + 15

        local d_8f       = cave + 0x15A
        local d_180      = cave + 0x15E
        local d_n180     = cave + 0x162
        local d_360      = cave + 0x166
        local g_entindex = cave + 0x26E
        local g_is_firing = cave + 0x3B0
        local g_tpr_arr  = cave + 0x4B8
        rs_is_firing = ffi.cast("float*", g_is_firing)
        rs_tpr_arr   = ffi.cast("float*", g_tpr_arr)

        local c = {
            -- ===== SAVE REGISTERS =====
            0x56,                                       -- 00: push esi
            0x57,                                       -- 01: push edi
            0x52,                                       -- 02: push edx
            0x51,                                       -- 03: push ecx
            -- [+0]=ecx(head) [+4]=edx(rdata) [+8]=edi(recs) [+C]=esi
            -- [+10]=prev_dist [+18]=ring_saved [+34]=arg_0

            -- ===== GET OLDEST RECORD =====
            0x8B, 0x74, 0x24, 0x18,                    -- 04: mov esi,[esp+18h]  ring_saved
            0x8B, 0x46, 0x0C,                           -- 08: mov eax,[esi+0Ch] head_index
            0x03, 0x46, 0x10,                           -- 0B: add eax,[esi+10h] +count
            0x48,                                       -- 0E: dec eax
            0x8B, 0x72, 0x08,                           -- 0F: mov esi,[edx+8]   capacity
            0x4E,                                       -- 12: dec esi
            0x21, 0xF0,                                 -- 13: and eax,esi        oldest_idx
            0x8B, 0x34, 0x87,                           -- 15: mov esi,[edi+eax*4] oldest→esi

            -- ===== CMD_TICK CHECK =====
            0xA1, 0,0,0,0,                             -- 18: mov eax,[g_cmd_ctx] @19
            0x8B, 0x80, 0x6C, 0x01, 0x00, 0x00,        -- 1D: mov eax,[eax+16Ch]
            0x3B, 0x81, 0x84, 0x00, 0x00, 0x00,        -- 23: cmp eax,[ecx+84h]  head->tick
            0x0F, 0x84, 0x03, 0x01, 0x00, 0x00,        -- 29: je .no_custom(132)

            -- ===== FIRING_SHOT CHECK (g_is_firing[g_entindex]) =====
            0xA1, 0,0,0,0,                              -- 2F: mov eax,[g_entindex] @30
            0xF3, 0x0F, 0x10, 0x04, 0x85, 0,0,0,0,     -- 34: movss xmm0,[eax*4+g_is_firing] @39
            0x0F, 0x57, 0xC9,                           -- 3D: xorps xmm1,xmm1
            0x0F, 0x2E, 0xC1,                           -- 40: ucomiss xmm0,xmm1
            0x0F, 0x87, 0xA4, 0x00, 0x00, 0x00,        -- 43: ja .try_head(ED)
            0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, -- 49: nop*30
            0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90,
            0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90,
            0x90, 0x90, 0x90, 0x90, 0x90, 0x90,        -- 66: end nops

            -- ===== DISTANCE CHECK =====
            0x8B, 0x0C, 0x24,                           -- 67: mov ecx,[esp] .skip_fire
            0xF3, 0x0F, 0x10, 0x01,                    -- 6A: movss xmm0,[ecx]
            0xF3, 0x0F, 0x5C, 0x06,                    -- 6E: subss xmm0,[esi]
            0xF3, 0x0F, 0x59, 0xC0,                    -- 72: mulss xmm0,xmm0
            0xF3, 0x0F, 0x10, 0x49, 0x04,              -- 76: movss xmm1,[ecx+4]
            0xF3, 0x0F, 0x5C, 0x4E, 0x04,              -- 7B: subss xmm1,[esi+4]
            0xF3, 0x0F, 0x59, 0xC9,                    -- 80: mulss xmm1,xmm1
            0xF3, 0x0F, 0x58, 0xC1,                    -- 84: addss xmm0,xmm1
            0xF3, 0x0F, 0x10, 0x49, 0x08,              -- 88: movss xmm1,[ecx+8]
            0xF3, 0x0F, 0x5C, 0x4E, 0x08,              -- 8D: subss xmm1,[esi+8]
            0xF3, 0x0F, 0x59, 0xC9,                    -- 92: mulss xmm1,xmm1
            0xF3, 0x0F, 0x58, 0xC1,                    -- 96: addss xmm0,xmm1
            0xF3, 0x0F, 0x51, 0xC0,                    -- 9A: sqrtss xmm0,xmm0
            0x0F, 0x2E, 0x05, 0,0,0,0,                -- 9E: ucomiss xmm0,[8f] @A1
            0x73, 0x46,                                 -- A5: jae .try_head(ED)

            -- ===== ANGLE CHECK =====
            0xF3, 0x0F, 0x10, 0x41, 0x68,              -- A7: movss xmm0,[ecx+68h] abs_yaw
            0xF3, 0x0F, 0x5C, 0x46, 0x68,              -- AC: subss xmm0,[esi+68h]
            0x0F, 0x2E, 0x05, 0,0,0,0,                -- B1: ucomiss xmm0,[180f] @B4
            0x76, 0x08,                                 -- B8: jbe .not_above(C2)
            0xF3, 0x0F, 0x5C, 0x05, 0,0,0,0,          -- BA: subss xmm0,[360f] @BE
            0xF3, 0x0F, 0x10, 0x0D, 0,0,0,0,          -- C2: movss xmm1,[-180f] @C6
            0x0F, 0x2E, 0xC8,                           -- CA: ucomiss xmm1,xmm0
            0x76, 0x08,                                 -- CD: jbe .not_below(D7)
            0xF3, 0x0F, 0x58, 0x05, 0,0,0,0,          -- CF: addss xmm0,[360f] @D3
            0x0F, 0x57, 0xC9,                           -- D7: xorps xmm1,xmm1
            0xF3, 0x0F, 0x5C, 0xC8,                    -- DA: subss xmm1,xmm0
            0xF3, 0x0F, 0x5F, 0xC1,                    -- DE: maxss xmm0,xmm1
            0x0F, 0x2E, 0x05, 0,0,0,0,                -- E2: ucomiss xmm0,[8f] @E5
            0x77, 0x02,                                 -- E9: ja .try_head(ED)
            0xEB, 0x03,                                 -- EB: jmp .validate(F0)

            -- ===== TRY HEAD =====
            0x8B, 0x34, 0x24,                           -- ED: mov esi,[esp]

            -- ===== VALIDATE =====
            0x8B, 0x4C, 0x24, 0x18,                    -- F0: mov ecx,[esp+18h] ring_saved
            0xB8, 0,0,0,0,                             -- F4: mov eax,fn_valid @F5
            0xFF, 0xD0,                                 -- F9: call eax
            0x84, 0xC0,                                 -- FB: test al,al
            0x74, 0x0F,                                 -- FD: jz .ret_oldest(10E)

            0x8B, 0xCE,                                 -- FF: mov ecx,esi
            0xB8, 0,0,0,0,                             -- 101: mov eax,fn_expired @102
            0xFF, 0xD0,                                 -- 106: call eax
            0x84, 0xC0,                                 -- 108: test al,al
            0x75, 0x02,                                 -- 10A: jnz .ret_oldest(10E)

            0xEB, 0x1C,                                 -- 10C: jmp .finish_return(12A)

            -- ===== RET OLDEST =====
            0x8B, 0x54, 0x24, 0x04,                    -- 10E: mov edx,[esp+4]
            0x8B, 0x7C, 0x24, 0x08,                    -- 112: mov edi,[esp+8]
            0x8B, 0x44, 0x24, 0x18,                    -- 116: mov eax,[esp+18h]
            0x8B, 0x48, 0x0C,                           -- 11A: mov ecx,[eax+Ch]
            0x03, 0x48, 0x10,                           -- 11D: add ecx,[eax+10h]
            0x49,                                       -- 120: dec ecx
            0x8B, 0x42, 0x08,                           -- 121: mov eax,[edx+8]
            0x48,                                       -- 124: dec eax
            0x21, 0xC1,                                 -- 125: and ecx,eax
            0x8B, 0x34, 0x8F,                           -- 127: mov esi,[edi+ecx*4]

            -- ===== FINISH RETURN =====
            0x83, 0xC4, 0x10,                           -- 12A: add esp,10h
            0xE9, 0,0,0,0,                             -- 12D: jmp return @12E

            -- ===== NO CUSTOM (original path) =====
            0x59,                                       -- 132: pop ecx
            0x5A,                                       -- 133: pop edx
            0x5F,                                       -- 134: pop edi
            0x5E,                                       -- 135: pop esi
            0x8B, 0x42, 0x08,                           -- 136: mov eax,[edx+8]
            0x48,                                       -- 139: dec eax
            0x21, 0xD8,                                 -- 13A: and eax,ebx
            0xF3, 0x0F, 0x10, 0x0C, 0x24,              -- 13C: movss xmm1,[esp]
            0x8B, 0x04, 0x87,                           -- 141: mov eax,[edi+eax*4]
            0x80, 0xB8, 0xA4, 0x00, 0x00, 0x00, 0x00,  -- 144: cmp byte[eax+A4h],0
            0x8B, 0x7C, 0x24, 0x08,                    -- 14B: mov edi,[esp+8]
            0x0F, 0x85, 0,0,0,0,                       -- 14F: jnz 527 @151
            0xE9, 0,0,0,0,                             -- 155: jmp 7E2 @156

            -- ===== DATA =====
            0x00, 0x00, 0x00, 0x41,                    -- 15A: 8.0f
            0x00, 0x00, 0x34, 0x43,                    -- 15E: 180.0f
            0x00, 0x00, 0x34, 0xC3,                    -- 162: -180.0f
            0x00, 0x00, 0xB4, 0x43,                    -- 166: 360.0f
            -- 16A: cave3 (animfix thirdperson_recoil patch)
        }

        local function fix(off, val)
            c[off+1] = bit.band(val, 0xFF)
            c[off+2] = bit.band(bit.rshift(val,  8), 0xFF)
            c[off+3] = bit.band(bit.rshift(val, 16), 0xFF)
            c[off+4] = bit.band(bit.rshift(val, 24), 0xFF)
        end

        fix(0x19,  g_cmd_ctx)
        fix(0x30,  g_entindex)
        fix(0x39,  g_is_firing)
        fix(0xA1,  d_8f)
        fix(0xB4,  d_180)
        fix(0xBE,  d_360)
        fix(0xC6,  d_n180)
        fix(0xD3,  d_360)
        fix(0xE5,  d_8f)
        fix(0xF5,  fn_valid)
        fix(0x102, fn_expired)
        fix(0x12E, addr_ret - (cave + 0x132))
        fix(0x151, addr_527 - (cave + 0x155))
        fix(0x156, addr_7E2 - (cave + 0x15A))

        for i = 1, #c do rs_stub[i-1] = c[i] end

        -- entindex-saving stub at cave+0x272 (20 bytes)
        -- saves entity index from original GetEntityIndex call to g_entindex,
        -- then replays the original cmp eax,41h / jb logic
        local eix_stub = cave + 0x272
        local eix_stub_p = ffi.cast("uint8_t*", eix_stub)
        local eix_s = {
            0xA3, 0,0,0,0,                             -- 00: mov [g_entindex],eax
            0x83, 0xF8, 0x41,                           -- 05: cmp eax,41h
            0x72, 0x05,                                 -- 08: jb .ok(0F)
            0xE9, 0,0,0,0,                             -- 0A: jmp rs_eix_site+5 (fall-through)
            0xE9, 0,0,0,0,                             -- 0F: jmp rs_eix_site+5+0x26 (jb target)
        }
        local eix_site_val = ptr(rs_eix_site)
        local function eix_fix(off, val)
            eix_s[off+1] = bit.band(val, 0xFF)
            eix_s[off+2] = bit.band(bit.rshift(val,  8), 0xFF)
            eix_s[off+3] = bit.band(bit.rshift(val, 16), 0xFF)
            eix_s[off+4] = bit.band(bit.rshift(val, 24), 0xFF)
        end
        eix_fix(0x01, g_entindex)
        eix_fix(0x0B, (eix_site_val + 5) - (eix_stub + 0x0F))
        eix_fix(0x10, (eix_site_val + 5 + 0x26) - (eix_stub + 0x14))
        for i = 1, #eix_s do eix_stub_p[i-1] = eix_s[i] end

        -- cave2: fallback record selection at cave+0x290
        local cave2 = cave + 0x290
        local cave2_p = ffi.cast("uint8_t*", cave2)
        local d2_8f   = cave2 + 0x106
        local d2_180  = cave2 + 0x10A
        local d2_n180 = cave2 + 0x10E
        local d2_360  = cave2 + 0x112
        local g_pdc   = fb_sig and tonumber(ffi.cast("uint32_t*", fb_sig + 2)[0]) or 0
        local c2 = {
            0x51,                                       -- 00: push ecx
            0x52,                                       -- 01: push edx
            0x8B, 0xC3,                                 -- 02: mov eax,ebx
            0x8B, 0x55, 0x08,                           -- 04: mov edx,[ebp+8]
            0x4A,                                       -- 07: dec edx
            0x21, 0xD0,                                 -- 08: and eax,edx
            0x8B, 0x55, 0x04,                           -- 0A: mov edx,[ebp+4]
            0x8B, 0x14, 0x82,                           -- 0D: mov edx,[edx+eax*4]
            0x52,                                       -- 10: push edx

            -- ===== FIRING_SHOT CHECK (g_is_firing[g_entindex]) =====
            0xA1, 0,0,0,0,                              -- 11: mov eax,[g_entindex] @12
            0xF3, 0x0F, 0x10, 0x04, 0x85, 0,0,0,0,     -- 16: movss xmm0,[eax*4+g_is_firing] @1B
            0x0F, 0x57, 0xC9,                           -- 1F: xorps xmm1,xmm1
            0x0F, 0x2E, 0xC1,                           -- 22: ucomiss xmm0,xmm1
            0x0F, 0x87, 0x9E, 0x00, 0x00, 0x00,        -- 25: ja .try_head(C9)
            0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, -- 2B: nop*20
            0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90,
            0x90, 0x90, 0x90, 0x90,                     -- 3E: end nops

            0x8B, 0x0C, 0x24,                           -- 3F: mov ecx,[esp]
            0xF3, 0x0F, 0x10, 0x01,                    -- 42: movss xmm0,[ecx]
            0xF3, 0x0F, 0x5C, 0x07,                    -- 46: subss xmm0,[edi]
            0xF3, 0x0F, 0x59, 0xC0,                    -- 4A: mulss xmm0,xmm0
            0xF3, 0x0F, 0x10, 0x49, 0x04,              -- 4E: movss xmm1,[ecx+4]
            0xF3, 0x0F, 0x5C, 0x4F, 0x04,              -- 53: subss xmm1,[edi+4]
            0xF3, 0x0F, 0x59, 0xC9,                    -- 58: mulss xmm1,xmm1
            0xF3, 0x0F, 0x58, 0xC1,                    -- 5C: addss xmm0,xmm1
            0xF3, 0x0F, 0x10, 0x49, 0x08,              -- 60: movss xmm1,[ecx+8]
            0xF3, 0x0F, 0x5C, 0x4F, 0x08,              -- 65: subss xmm1,[edi+8]
            0xF3, 0x0F, 0x59, 0xC9,                    -- 6A: mulss xmm1,xmm1
            0xF3, 0x0F, 0x58, 0xC1,                    -- 6E: addss xmm0,xmm1
            0xF3, 0x0F, 0x51, 0xC0,                    -- 72: sqrtss xmm0,xmm0
            0x0F, 0x2E, 0x05, 0,0,0,0,                -- 76: ucomiss xmm0,[8f] @79
            0x0F, 0x83, 0x46, 0x00, 0x00, 0x00,        -- 7D: jae .try_head(C9)

            0xF3, 0x0F, 0x10, 0x41, 0x68,              -- 83: movss xmm0,[ecx+68h] abs_yaw
            0xF3, 0x0F, 0x5C, 0x47, 0x68,              -- 88: subss xmm0,[edi+68h]
            0x0F, 0x2E, 0x05, 0,0,0,0,                -- 8D: ucomiss xmm0,[180f] @90
            0x76, 0x08,                                 -- 94: jbe .not_above(9E)
            0xF3, 0x0F, 0x5C, 0x05, 0,0,0,0,          -- 96: subss xmm0,[360f] @9A
            0xF3, 0x0F, 0x10, 0x0D, 0,0,0,0,          -- 9E: movss xmm1,[-180f] @A2
            0x0F, 0x2E, 0xC8,                           -- A6: ucomiss xmm1,xmm0
            0x76, 0x08,                                 -- A9: jbe .not_below(B3)
            0xF3, 0x0F, 0x58, 0x05, 0,0,0,0,          -- AB: addss xmm0,[360f] @AF
            0x0F, 0x57, 0xC9,                           -- B3: xorps xmm1,xmm1
            0xF3, 0x0F, 0x5C, 0xC8,                    -- B6: subss xmm1,xmm0
            0xF3, 0x0F, 0x5F, 0xC1,                    -- BA: maxss xmm0,xmm1
            0x0F, 0x2E, 0x05, 0,0,0,0,                -- BE: ucomiss xmm0,[8f] @C1
            0x77, 0x02,                                 -- C5: ja .try_head(C9)
            0xEB, 0x2F,                                 -- C7: jmp .no_custom(F8)

            0x8B, 0xCD,                                 -- C9: mov ecx,ebp
            0xB8, 0,0,0,0,                             -- CB: mov eax,fn_valid @CC
            0xFF, 0xD0,                                 -- D0: call eax
            0x84, 0xC0,                                 -- D2: test al,al
            0x74, 0x17,                                 -- D4: jz .ret_oldest(ED)
            0x8B, 0xCF,                                 -- D6: mov ecx,edi
            0xB8, 0,0,0,0,                             -- D8: mov eax,fn_expired @D9
            0xFF, 0xD0,                                 -- DD: call eax
            0x84, 0xC0,                                 -- DF: test al,al
            0x75, 0x0A,                                 -- E1: jnz .ret_oldest(ED)
            0x8B, 0xF7,                                 -- E3: mov esi,edi
            0x83, 0xC4, 0x0C,                           -- E5: add esp,0Ch
            0xE9, 0,0,0,0,                             -- E8: jmp return @E9

            0x8B, 0x34, 0x24,                           -- ED: mov esi,[esp]
            0x83, 0xC4, 0x0C,                           -- F0: add esp,0Ch
            0xE9, 0,0,0,0,                             -- F3: jmp return @F4

            0x83, 0xC4, 0x0C,                           -- F8: add esp,0Ch
            0x8B, 0x0D, 0,0,0,0,                       -- FB: mov ecx,[g_pdc] @FD
            0xE9, 0,0,0,0,                             -- 101: jmp back @102

            0x00, 0x00, 0x00, 0x41,                    -- 106: 8.0f
            0x00, 0x00, 0x34, 0x43,                    -- 10A: 180.0f
            0x00, 0x00, 0x34, 0xC3,                    -- 10E: -180.0f
            0x00, 0x00, 0xB4, 0x43,                    -- 112: 360.0f
        }
        local function fix2(off, val)
            c2[off+1] = bit.band(val, 0xFF)
            c2[off+2] = bit.band(bit.rshift(val,  8), 0xFF)
            c2[off+3] = bit.band(bit.rshift(val, 16), 0xFF)
            c2[off+4] = bit.band(bit.rshift(val, 24), 0xFF)
        end
        fix2(0x12,  g_entindex)
        fix2(0x1B,  g_is_firing)
        fix2(0x79,  d2_8f)
        fix2(0x90,  d2_180)
        fix2(0x9A,  d2_360)
        fix2(0xA2,  d2_n180)
        fix2(0xAF,  d2_360)
        fix2(0xC1,  d2_8f)
        fix2(0xCC,  fn_valid)
        fix2(0xD9,  fn_expired)
        fix2(0xE9,  addr_ret - (cave2 + 0xED))
        fix2(0xF4,  addr_ret - (cave2 + 0xF8))
        fix2(0xFD,  g_pdc)
        fix2(0x102, fb_sig and (ptr(fb_sig + 6) - (cave2 + 0x106)) or 0)
        for i = 1, #c2 do cave2_p[i-1] = c2[i] end

        -- install main cave patch
        rs_orig = save(rs_sig, 39)
        local old = ffi.new("unsigned long[1]")
        ffi.C.VirtualProtect(ffi.cast("void*", site), 39, PAGE_EXECUTE_READWRITE, old)
        rs_sig[0] = 0xE9
        wi32(site + 1, cave - (site + 5))
        for i = 5, 38 do rs_sig[i] = 0x90 end
        ffi.C.VirtualProtect(ffi.cast("void*", site), 39, old[0], old)

        -- install entindex hook at rs_eix_site
        if rs_eix_site and rs_eix_site[0] ~= 0xE9 then
            rs_eix_orig = save(rs_eix_site, 5)
            ffi.C.VirtualProtect(ffi.cast("void*", eix_site_val), 5, PAGE_EXECUTE_READWRITE, old)
            rs_eix_site[0] = 0xE9
            wi32(eix_site_val + 1, eix_stub - (eix_site_val + 5))
            ffi.C.VirtualProtect(ffi.cast("void*", eix_site_val), 5, old[0], old)
            ffi.C.FlushInstructionCache(ffi.C.GetCurrentProcess(), ffi.cast("void*", eix_site_val), 5)
        end

        ffi.C.FlushInstructionCache(ffi.C.GetCurrentProcess(), ffi.cast("void*", site), 39)

        -- cave3: animfix thirdperson_recoil patch at cave+0x16A
        if af_sig and tpr_offset and tpr_offset > 0 and af_sig[0] ~= 0xE9 then
            local cave3 = cave + 0x16A
            local cave3_p = ffi.cast("uint8_t*", cave3)
            local af_site = ptr(af_sig)
            local af_ret = af_site + 16
            local c3 = {
                -- original: movss xmm2,[edx+370h]; movss [eax+180h],xmm2
                0xF3, 0x0F, 0x10, 0x92, 0x70, 0x03, 0x00, 0x00, -- 00: movss xmm2,[edx+370h]
                0xF3, 0x0F, 0x11, 0x90, 0x80, 0x01, 0x00, 0x00, -- 08: movss [eax+180h],xmm2
                -- check is_firing via g_is_firing[g_entindex]
                0x51,                                             -- 10: push ecx
                0x8B, 0x0D, 0,0,0,0,                             -- 11: mov ecx,[g_entindex] @13
                0xF3, 0x0F, 0x10, 0x14, 0x8D, 0,0,0,0,           -- 17: movss xmm2,[ecx*4+g_is_firing] @1C
                0x0F, 0x57, 0xDB,                                 -- 20: xorps xmm3,xmm3
                0x0F, 0x2E, 0xD3,                                 -- 23: ucomiss xmm2,xmm3
                0x76, 0x1B,                                        -- 26: jbe .skip(43)
                -- load thirdperson_recoil from g_tpr_arr[g_entindex] (ecx still = entindex)
                0xF3, 0x0F, 0x10, 0x14, 0x8D, 0,0,0,0,           -- 28: movss xmm2,[ecx*4+g_tpr_arr] @2D
                -- write to player entity
                0x8B, 0x8E, 0xE0, 0x02, 0x00, 0x00,               -- 31: mov ecx,[esi+2E0h]
                0x85, 0xC9,                                        -- 37: test ecx,ecx
                0x74, 0x08,                                        -- 39: jz .skip(43)
                0xF3, 0x0F, 0x11, 0x91, 0,0,0,0,                  -- 3B: movss [ecx+tpr_offset],xmm2 @3F
                -- .skip:
                0x59,                                              -- 43: pop ecx
                0xE9, 0,0,0,0,                                    -- 44: jmp af_ret @45
            }
            local function fix3(off, val)
                c3[off+1] = bit.band(val, 0xFF)
                c3[off+2] = bit.band(bit.rshift(val,  8), 0xFF)
                c3[off+3] = bit.band(bit.rshift(val, 16), 0xFF)
                c3[off+4] = bit.band(bit.rshift(val, 24), 0xFF)
            end
            fix3(0x13, g_entindex)
            fix3(0x1C, g_is_firing)
            fix3(0x2D, g_tpr_arr)
            fix3(0x3F, tpr_offset)
            fix3(0x45, af_ret - (cave3 + 0x49))
            for i = 1, #c3 do cave3_p[i-1] = c3[i] end

            af_orig = save(af_sig, 16)
            ffi.C.VirtualProtect(ffi.cast("void*", af_site), 16, PAGE_EXECUTE_READWRITE, old)
            af_sig[0] = 0xE9
            wi32(af_site + 1, cave3 - (af_site + 5))
            for i = 5, 15 do af_sig[i] = 0x90 end
            ffi.C.VirtualProtect(ffi.cast("void*", af_site), 16, old[0], old)
            ffi.C.FlushInstructionCache(ffi.C.GetCurrentProcess(), ffi.cast("void*", af_site), 16)
            af_applied = true
        end

        ffi.C.FlushInstructionCache(ffi.C.GetCurrentProcess(), ffi.cast("void*", cave), 0x400)
        rs_applied = true
    end

    local function fb_install()
        if fb_applied or not rs_applied then return end
        if not fb_sig then return end
        if fb_sig[0] == 0xE9 then return end
        local site = ptr(fb_sig)
        local cave2 = ptr(rs_stub) + 0x290
        fb_orig = save(fb_sig, 6)
        local old = ffi.new("unsigned long[1]")
        ffi.C.VirtualProtect(ffi.cast("void*", site), 6, PAGE_EXECUTE_READWRITE, old)
        fb_sig[0] = 0xE9
        wi32(site + 1, cave2 - (site + 5))
        fb_sig[5] = 0x90
        ffi.C.VirtualProtect(ffi.cast("void*", site), 6, old[0], old)
        ffi.C.FlushInstructionCache(ffi.C.GetCurrentProcess(), ffi.cast("void*", site), 6)
        fb_applied = true
    end

    local function fb_uninstall()
        if not fb_applied then return end
        if not fb_orig or fb_sig[0] ~= 0xE9 then fb_applied = false return end
        local site = ptr(fb_sig)
        local old = ffi.new("unsigned long[1]")
        ffi.C.VirtualProtect(ffi.cast("void*", site), 6, PAGE_EXECUTE_READWRITE, old)
        patch(fb_sig, fb_orig)
        ffi.C.VirtualProtect(ffi.cast("void*", site), 6, old[0], old)
        ffi.C.FlushInstructionCache(ffi.C.GetCurrentProcess(), ffi.cast("void*", site), 6)
        fb_orig = nil
        fb_applied = false
    end

    local function rs_uninstall()
        if not rs_applied then return end
        fb_uninstall()
        local old = ffi.new("unsigned long[1]")

        -- restore entindex hook
        if rs_eix_site and rs_eix_orig and rs_eix_site[0] == 0xE9 then
            local eix_site_val = ptr(rs_eix_site)
            ffi.C.VirtualProtect(ffi.cast("void*", eix_site_val), 5, PAGE_EXECUTE_READWRITE, old)
            patch(rs_eix_site, rs_eix_orig)
            ffi.C.VirtualProtect(ffi.cast("void*", eix_site_val), 5, old[0], old)
            ffi.C.FlushInstructionCache(ffi.C.GetCurrentProcess(), ffi.cast("void*", eix_site_val), 5)
            rs_eix_orig = nil
        end

        -- restore animfix patch
        if af_applied and af_orig and af_sig[0] == 0xE9 then
            local af_site = ptr(af_sig)
            ffi.C.VirtualProtect(ffi.cast("void*", af_site), 16, PAGE_EXECUTE_READWRITE, old)
            patch(af_sig, af_orig)
            ffi.C.VirtualProtect(ffi.cast("void*", af_site), 16, old[0], old)
            ffi.C.FlushInstructionCache(ffi.C.GetCurrentProcess(), ffi.cast("void*", af_site), 16)
            af_orig = nil
            af_applied = false
        end

        -- restore main cave patch
        if rs_orig and rs_sig[0] == 0xE9 then
            local site = ptr(rs_sig)
            ffi.C.VirtualProtect(ffi.cast("void*", site), 39, PAGE_EXECUTE_READWRITE, old)
            patch(rs_sig, rs_orig)
            ffi.C.VirtualProtect(ffi.cast("void*", site), 39, old[0], old)
            ffi.C.FlushInstructionCache(ffi.C.GetCurrentProcess(), ffi.cast("void*", site), 39)
        end
        rs_shot_arr = nil
        rs_is_firing = nil
        rs_tpr_arr = nil
        rs_applied = false
    end

    if IS_BETA and rs_sig and rs_eix_site and fn_valid_sig and fn_expired_sig and addr_ret_sig then
        b_ui:switch(text_format(interpoint, "Custom record selection", 2, 7, 7)):set_callback(function(e)
            if e:get() then
                rs_install()
            else
                rs_uninstall()
            end
        end, true)
    end

    if IS_BETA and fb_sig and rs_eix_site and fn_valid_sig and fn_expired_sig and addr_ret_sig then
        b_ui:switch(text_format(interpoint, "Custom fallback selection", 2, 7, 7)):set_callback(function(e)
            if e:get() then
                rs_install()
                fb_install()
            else
                fb_uninstall()
            end
        end, true)
    end

    on_shutdown[#on_shutdown + 1] = function()
        fb_uninstall()
        rs_uninstall()
        if rs_stub then
            ffi.C.VirtualFree(rs_stub, 0, MEM_RELEASE)
            rs_stub = nil
        end
    end
end

local aimbot_logs do
    local enabled = false
    local MAX_DESYNC_DELTA = 58

    local FLAG_NAMES = {
        [0x001] = "VALID",
        [0x004] = "BREAK_LC",
        [0x008] = "TELEPORT",
        [0x010] = "TICK_EXPIRE",
        [0x020] = "RESOLVED",
        [0x040] = "EXTENDED",
        [0x080] = "EXTRA_LAYERS",
        [0x100] = "NO_ANIM",
        [0x200] = "ON_GROUND",
        [0x800] = "DORMANT",
    }

    local function decode_flags(flags)
        if flags == 0 then return "NONE" end
        local lo = bit.band(flags, 0xFFF)
        local alive = bit.rshift(flags, 12)
        local parts = {}
        local known = 0
        for mask, name in pairs(FLAG_NAMES) do
            if bit.band(lo, mask) ~= 0 then
                parts[#parts + 1] = name
                known = bit.bor(known, mask)
            end
        end
        local unknown = bit.band(lo, bit.bnot(known))
        if unknown ~= 0 then
            parts[#parts + 1] = string.format("UNK_%X", unknown)
        end
        if alive > 0 then
            parts[#parts + 1] = string.format("ALV=%d", alive)
        end
        return table.concat(parts, "|")
    end

    local HITGROUP_NAMES = {
        [0] = "generic", "head", "chest", "stomach",
        "left arm", "right arm", "left leg", "right leg",
        "neck", "generic", "gear"
    }

    local function hg_name(hg)
        return HITGROUP_NAMES[hg] or tostring(hg)
    end

    local pending_shots = {}

    f_ui:switch(text_format(interpoint, "Extended aimbot logs", 2, 7, 7)):set_callback(function(e)
        enabled = e:get()
    end, true):tooltip(
        "Print detailed shot info to console on hit/miss:\n"..
        "record flags, desync, choked ticks, lagcomp state,\n"..
        "extrapolation source, velocity, yaw, tick delta")

    events.aim_fire:set(function(shot)
        if not enabled then return end

        local ok_rt, now = pcall(function() return globals.realtime end)
        if ok_rt and now then
            local expired = {}
            for id, s in pairs(pending_shots) do
                if now - s.time > 5 then
                    expired[#expired + 1] = id
                end
            end
            for _, id in ipairs(expired) do
                pending_shots[id] = nil
            end
        end

        local target = shot.target
        if not target then return end

        local ok_idx, idx = pcall(function() return target:get_index() end)
        if not ok_idx or not idx then return end

        local ok_name, name = pcall(function() return target:get_name() end)
        if not ok_name then name = "?" end

        local flags = -1
        local choked = 0
        local desync = 0
        local lagcomp_valid = 0
        local extrap_cleared = 0
        local rec_source = "none"
        local duck = 0
        local abs_yaw = 0
        local body_yaw = 0
        local simtime = 0
        local rec_tick = 0
        local velocity = {0, 0, 0}

        local ring = get_ring_safe(idx)
        if ring and ring.count > 0 then
            local rec = nil

            if shot.backtrack > 0 then
                rec = get_record_at(ring, shot.backtrack)
                if rec then rec_source = "bt" end
            else
                rec = get_record_at(ring, 0)
                if rec then
                    rec_source = "head"
                    if is_extrap_active() then
                        rec_source = "extrap_global"
                    elseif rec.lagcomp_valid == 0 then
                        rec_source = "extrap_lc"
                    end
                end
            end

            if rec then
                local ok_read = pcall(function()
                    flags          = rec.record_flags
                    choked         = rec.choked_ticks
                    desync         = rec.desync_weight
                    lagcomp_valid  = rec.lagcomp_valid
                    extrap_cleared = rec.extrap_cleared
                    duck           = rec.duck_amount
                    abs_yaw        = rec.abs_yaw
                    body_yaw       = rec.body_yaw
                    simtime        = rec.simulation_time
                    rec_tick       = rec.server_tick
                    velocity       = {rec.velocity.x, rec.velocity.y, rec.velocity.z}
                end)
                if not ok_read then
                    flags = -1
                    rec_source = "err"
                end
            end
        end

        local hittable = 0
        local srv_tick = 0
        if g_log_hittable_ptr then hittable    = g_log_hittable_ptr[0] end
        if g_server_tick_ptr  then srv_tick    = g_server_tick_ptr[0] end

        pending_shots[shot.id] = {
            id             = shot.id,
            time           = globals.realtime,
            name           = name,
            hitgroup       = shot.hitgroup,
            damage         = shot.damage,
            hitchance      = shot.hitchance,
            backtrack      = shot.backtrack,
            flags          = flags,
            choked         = choked,
            desync         = desync,
            lagcomp_valid  = lagcomp_valid,
            extrap_cleared = extrap_cleared,
            rec_source     = rec_source,
            duck           = duck,
            abs_yaw        = abs_yaw,
            body_yaw       = body_yaw,
            simtime        = simtime,
            rec_tick       = rec_tick,
            velocity       = velocity,
            hittable       = hittable,
            srv_tick       = srv_tick,
            ring_count     = ring and ring.count or 0,
        }
    end, true)

    events.aim_ack:set(function(ack)
        if not enabled then return end
        local e = pending_shots[ack.id]
        if not e then return end
        pending_shots[ack.id] = nil

        local desync_max = e.desync * MAX_DESYNC_DELTA
        local speed = math.sqrt(e.velocity[1]*e.velocity[1] + e.velocity[2]*e.velocity[2])
        local flags_hex = e.flags >= 0 and string.format("0x%X", e.flags) or "?"
        local flags_str = e.flags >= 0 and decode_flags(e.flags) or "?"
        local tick_delta = e.srv_tick - e.rec_tick
        local alive_count = e.flags >= 0 and bit.rshift(e.flags, 12) or 0

        if ack.state == nil then
            print(string.format(
                "[HIT]  #%d %s hg=%s dmg=%d (wanted: hg=%s dmg=%d) hc=%d%% bt=%d | flags=%s(%s) chk=%d dsync=%.1f(%.1f\194\176) lc=%d ext=%d src=%s",
                ack.id, e.name,
                hg_name(ack.hitgroup), ack.damage,
                hg_name(ack.wanted_hitgroup), ack.wanted_damage,
                e.hitchance, e.backtrack,
                flags_hex, flags_str,
                e.choked, e.desync, desync_max,
                e.lagcomp_valid, e.extrap_cleared,
                e.rec_source
            ))

            print_dev(string.format(
                "[HIT]  #%d %s hg=%s dmg=%d (wanted: hg=%s dmg=%d) hc=%d%% bt=%d | flags=%s(%s) chk=%d dsync=%.1f(%.1f\194\176) lc=%d ext=%d src=%s",
                ack.id, e.name,
                hg_name(ack.hitgroup), ack.damage,
                hg_name(ack.wanted_hitgroup), ack.wanted_damage,
                e.hitchance, e.backtrack,
                flags_hex, flags_str,
                e.choked, e.desync, desync_max,
                e.lagcomp_valid, e.extrap_cleared,
                e.rec_source
            ))
        else
            print(string.format(
                "[MISS] #%d %s reason=%s spread=%.3f (wanted: hg=%s dmg=%d) hc=%d%% bt=%d | flags=%s(%s) chk=%d dsync=%.1f(%.1f\194\176) lc=%d ext=%d src=%s",
                ack.id, e.name,
                tostring(ack.state), ack.spread,
                hg_name(ack.wanted_hitgroup), ack.wanted_damage,
                e.hitchance, e.backtrack,
                flags_hex, flags_str,
                e.choked, e.desync, desync_max,
                e.lagcomp_valid, e.extrap_cleared,
                e.rec_source
            ))

            print_dev(string.format(
                "[MISS] #%d %s reason=%s spread=%.3f (wanted: hg=%s dmg=%d) hc=%d%% bt=%d | flags=%s(%s) chk=%d dsync=%.1f(%.1f\194\176) lc=%d ext=%d src=%s",
                ack.id, e.name,
                tostring(ack.state), ack.spread,
                hg_name(ack.wanted_hitgroup), ack.wanted_damage,
                e.hitchance, e.backtrack,
                flags_hex, flags_str,
                e.choked, e.desync, desync_max,
                e.lagcomp_valid, e.extrap_cleared,
                e.rec_source
            ))
        end
    end, true)
end

events.shutdown(function()
    for i = #on_shutdown, 1, -1 do
        on_shutdown[i]()
    end
end, true)

ui.sidebar("\a{Link Active}Viera Utils", "list-music")
