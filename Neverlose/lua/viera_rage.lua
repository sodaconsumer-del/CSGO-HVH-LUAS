
local ffi = require("ffi")
local cast, typeof = ffi.cast, ffi.typeof

local pGetModuleHandle_sig = utils.opcode_scan("engine.dll", "FF 15 ? ? ? ? 85 C0 74 0B") or error("pGetModuleHandle_sig not found")
local pGetProcAddress_sig = utils.opcode_scan("engine.dll", "FF 15 ? ? ? ? A3 ? ? ? ? EB 05") or error("pGetProcAddress_sig not found")
local jmp_ecx = utils.opcode_scan("engine.dll", "FF E1") or error("jmp_ecx not found")

local pGetProcAddress = cast("uint32_t**", cast("uint32_t", pGetProcAddress_sig) + 2)[0][0]
local fnGetProcAddress = cast("uint32_t(__fastcall*)(unsigned int, unsigned int, uint32_t, const char*)", jmp_ecx)

local pGetModuleHandle = cast("uint32_t**", cast("uint32_t", pGetModuleHandle_sig) + 2)[0][0]
local fnGetModuleHandle = cast("uint32_t(__fastcall*)(unsigned int, unsigned int, const char*)", jmp_ecx)

local function proc_bind(module_name, function_name, typedef)
    local ctype = typeof(typedef)
    local module_handle = fnGetModuleHandle(pGetModuleHandle, 0, module_name)
    local proc_address = fnGetProcAddress(pGetProcAddress, 0, module_handle, function_name)
    local call_fn = cast(ctype, jmp_ecx)
    return function(...)
        return call_fn(proc_address, 0, ...)
    end
end

pcall(ffi.cdef, [[
    typedef void* HANDLE;
    typedef unsigned long DWORD;
    typedef int BOOL;
    typedef DWORD (__stdcall *LPTHREAD_START_ROUTINE)(void*);
    typedef void* LPVOID;

    HANDLE CreateThread(LPVOID lpThreadAttributes, DWORD dwStackSize, LPTHREAD_START_ROUTINE lpStartAddress, LPVOID lpParameter, DWORD dwCreationFlags, DWORD* lpThreadId);
    DWORD WaitForSingleObject(HANDLE hHandle, DWORD dwMilliseconds);
    BOOL CloseHandle(HANDLE hObject);

    typedef struct _SECURITY_ATTRIBUTES {
        DWORD nLength;
        LPVOID lpSecurityDescriptor;
        BOOL bInheritHandle;
    } SECURITY_ATTRIBUTES, *PSECURITY_ATTRIBUTES;

    DWORD GetLastError();

    void* __stdcall VirtualAlloc(void*, size_t, uint32_t, uint32_t);
    int   __stdcall VirtualFree (void*, size_t, uint32_t);
]])

local CreateThread = proc_bind("kernel32.dll", "CreateThread", "void*(__fastcall*)(uint32_t, uint32_t, void*, uint32_t, void*, void*, uint32_t, void*)")
local WaitForSingleObject = proc_bind("kernel32.dll", "WaitForSingleObject", "uint32_t(__fastcall*)(uint32_t, uint32_t, void*, uint32_t)")
local CloseHandle = proc_bind("kernel32.dll", "CloseHandle", "int32_t(__fastcall*)(uint32_t, uint32_t, void*)")
local TerminateThread = proc_bind("kernel32.dll", "TerminateThread", "bool(__fastcall*)(unsigned int, unsigned int, void*, unsigned long)")
local GetLastError = proc_bind("kernel32.dll", "GetLastError", "uint32_t(__fastcall*)(uint32_t)")

local Thread = {}
Thread.__index = Thread

function Thread.new()
    local self = setmetatable({}, Thread)
    self.shouldTerminate = ffi.new("bool[1]", false)
    self.threadHandle = nil
    events.shutdown(function()
        self:stop()
    end)
    return self
end

function Thread:__gc()
    self:stop()
end

function Thread:start(call, args)
    self.callWrapper = (args and function()
        local succ, err = pcall(call, args)
        if not succ then
            print("[Error] " .. tostring(err))
        end
        return 0
    end or function()
        local succ, err = pcall(call)
        if not succ then
            print("[Error] " .. tostring(err))
        end
        return 0
    end)

    local sec_attr = ffi.new("SECURITY_ATTRIBUTES")
    sec_attr.nLength = ffi.sizeof("SECURITY_ATTRIBUTES")
    sec_attr.bInheritHandle = 1

    self.threadFunc = ffi.cast("LPTHREAD_START_ROUTINE", self.callWrapper)
    self.threadHandle = CreateThread(sec_attr, 0, self.threadFunc, nil, 0, nil)

    if self.threadHandle == nil then
        local err_code = GetLastError()
        print("Failed to create thread! Error code: " .. tostring(err_code))
        return
    end
end

function Thread:stop()
    if self.threadHandle ~= nil then
        self.shouldTerminate[0] = true
        WaitForSingleObject(self.threadHandle, 0xFFFFFFFF)
        TerminateThread(self.threadHandle, 0)
        CloseHandle(self.threadHandle)
        self.threadHandle = nil
    end
end

local function safe_get_ptr(ent)
    local success, ptr = pcall(function() return ent[0] end)  -- без замыкания
    if not success or ptr == nil or ptr == ffi.NULL then return nil end
    return ptr
end

print = function(...)
    print_dev("\aDEFAULT" .. ...)
    print_raw("\aDEFAULT" .. ...)
end

local sim_cache = {}

pcall(ffi.cdef, [[
    typedef union {
        float           m_Float;
        long            m_Int;
        const char*     m_pString;
        void*           m_pData;
        float           m_Vector[3];
        double          m_Int64;
    } DVariant;
    typedef struct {
        DVariant        m_Value;
        const void*     m_pRecvProp;
        void*           m_pRecvProxyData;
        int             m_iElement;
        int             m_ObjectID;
    } CRecvProxyData;
    typedef void (__cdecl* RecvProxy_SimTime_t)(const CRecvProxyData*, void*, void*);

    int   __stdcall VirtualProtect(void*, unsigned long, unsigned long, unsigned long*);
    void* __stdcall VirtualAlloc  (void*, unsigned long, unsigned long, unsigned long);
]])

do
    local target = utils.opcode_scan(
        "client.dll",
        "55 8B EC 8B 45 08 8B 4D 0C 53 83 C1 08 56 8B 70 08 57 8B 01 FF 50 28 8B ? ? ? ? ? 99 8B"
    )
    if not target then
        print("[resolver] RecvProxy_SimulationTime sig not found — fallback to memory read only")
    else
        local STOLEN = 6
        local tgt_b   = ffi.cast("uint8_t*", target)
        local tgt_a   = tonumber(ffi.cast("uintptr_t", target))

        local tramp = ffi.C.VirtualAlloc(nil, 64, 0x3000, 0x40)
        assert(tramp ~= nil, "VirtualAlloc failed")
        local tr_b = ffi.cast("uint8_t*", tramp)
        local tr_a = tonumber(ffi.cast("uintptr_t", tramp))
        ffi.copy(tr_b, tgt_b, STOLEN)
        tr_b[STOLEN] = 0xE9
        ffi.cast("int32_t*", tr_b + STOLEN + 1)[0] = (tgt_a + STOLEN) - (tr_a + STOLEN + 5)
        local original = ffi.cast("RecvProxy_SimTime_t", tramp)

        local OFF_SIMTIME = 0x268
        local hook_cb = ffi.cast("RecvProxy_SimTime_t", function(pData, pStruct, pOut)
            local ent_ptr  = ffi.cast("uintptr_t", pStruct)
            local new_val  = ffi.cast("float*", pOut)[0]

            original(pData, pStruct, pOut)

            sim_cache[tonumber(ent_ptr)] = new_val
        end)

        local orig_bytes = ffi.new("uint8_t[?]", STOLEN)
        ffi.copy(orig_bytes, tgt_b, STOLEN)

        local old_prot = ffi.new("unsigned long[1]")
        ffi.C.VirtualProtect(tgt_b, STOLEN, 0x40, old_prot)
        local cb_a = tonumber(ffi.cast("uintptr_t", hook_cb))
        tgt_b[0] = 0xE9
        ffi.cast("int32_t*", tgt_b + 1)[0] = cb_a - (tgt_a + 5)
        for i = 5, STOLEN - 1 do tgt_b[i] = 0x90 end
        ffi.C.VirtualProtect(tgt_b, STOLEN, old_prot[0], old_prot)

        events.shutdown(function()
            local op = ffi.new("unsigned long[1]")
            ffi.C.VirtualProtect(tgt_b, STOLEN, 0x40, op)
            ffi.copy(tgt_b, orig_bytes, STOLEN)
            ffi.C.VirtualProtect(tgt_b, STOLEN, op[0], op)
            hook_cb:free()
        end)

        --print(string.format("[resolver] RecvProxy_SimulationTime hooked @ 0x%X", tgt_a))
    end
end

local function sign(x) 
    if x > 0 then return 1 elseif x < 0 then return -1 else return 0 end 
end

local SIDES = { 1, -1, 0, 2 };
local MISSED_TO_SIDE = { [1] = 1, [2] = -1, [3] = 0, [4] = -2 }

local exploits = (function()
    local hideshots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
    local doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");

    local max_process_ticks = math.abs(cvar.sv_maxusrcmdprocessticks:float()) - 1;
    local tickbase_difference = 0
    local ticks_processed = 0
    local command_number = 0
    local choked_commands = 0
    local need_force_defensive = false
    local current_shift_amount = 0;

    local function reset_vars()
        ticks_processed = 0 
        tickbase_difference = 0 
        choked_commands = 0 
        command_number = 0
    end

    local function store_vars(ctx) 
        command_number = ctx.command_number
        choked_commands = ctx.choked_commands 
    end

    local function store_tickbase_difference(ctx)
        local me = entity.get_local_player()
        if me == nil then return end;

        if ctx.command_number == command_number then
            ticks_processed = math.clamp(math.abs(me.m_nTickBase - tickbase_difference), 0, max_process_ticks - choked_commands)
            tickbase_difference = math.max(me.m_nTickBase, tickbase_difference or 0)
            command_number = 0
        end
    end

    local function is_doubletap() return doubletap:get() end
    local function is_hideshots() return hideshots:get() end
    local function is_active() return is_doubletap() or is_hideshots() end


    local function in_defensive() 
        return is_active() and (ticks_processed > 1 and ticks_processed < max_process_ticks) 
    end

    local function is_defensive_ended() 
        return not in_defensive() or (ticks_processed >= 0 and ticks_processed <= 5) and tickbase_difference > 0 
    end

    local function is_lagcomp_broken() 
        local me = entity.get_local_player()
        if me == nil then return false end;
        return not is_defensive_ended() or tickbase_difference < me.m_nTickBase
    end


    local function can_recharge()
        local me = entity.get_local_player()
        if me == nil then return false end;
        
        local weapon = me:get_player_weapon()
        if weapon == nil then return false end;

        if not is_active() then return false end
        local curtime = globals.tickinterval * (me.m_nTickBase - 16)
        if curtime < me.m_flNextAttack then return false end
        if curtime < weapon.m_flNextPrimaryAttack then return false end
        return true
    end

    local function in_recharge()
        if not (is_active() and can_recharge()) or in_defensive() then 
            return false 
        end

        local charge_amount = math.floor(rage.exploit:get() * 100)
        return (charge_amount > 0 and charge_amount < 100)
    end


    events.createmove_run(store_vars);
    events.createmove_run(store_tickbase_difference);

    return {
        is_doubletap = is_doubletap,
        is_hideshots = is_hideshots,
        is_active = is_active,
        in_defensive = in_defensive,
        is_defensive_ended = is_defensive_ended,
        is_lagcomp_broken = is_lagcomp_broken,
        can_recharge = can_recharge,
        in_recharge = in_recharge
    }
end)()

local classes = {}
local function class(classes, name) 
    return function(tab) 
        if not tab then 
            return classes[name] 
        end 
        tab.__index, tab.__classname = tab, name 
        if tab.call then 
            tab.__call = tab.call 
        end 
        
        setmetatable(tab, tab) 
        classes[name] = tab 
        
        return tab 
    end 
end

function emplace_front(t, ...) 
    local args = {...} 
    
    if #args > 0 then 
        for i = #t, 1, -1 do 
            t[i + #args] = t[i] 
        end 
        
        for i, v in ipairs(args) do 
            t[i] = v 
        end 
    end 
end

local inspect = require "neverlose/inspect"

local g_ctx = {
    local_player = nil, weapon = nil,
    cvar = {
        sv_maxusrcmdprocessticks = cvar.sv_maxusrcmdprocessticks:int(),
        sv_maxunlag = cvar.sv_maxunlag:float(),
        cl_interp = cvar.cl_interp:float(),
        cl_interp_ratio = cvar.cl_interp_ratio:float(),
        cl_updaterate = cvar.cl_updaterate:float(),
    },
    structs = {
        animstate_t = ffi.typeof 'struct { int layer_order_preset; bool first_run_since_init; bool first_foot_plant_since_init; int last_update_tick; float eye_position_smooth_lerp; float strafe_change_weight_smooth_fall_off; float stand_walk_duration_state_has_been_valid; float stand_walk_duration_state_has_been_invalid; float stand_walk_how_long_to_wait_until_transition_can_blend_in; float stand_walk_how_long_to_wait_until_transition_can_blend_out; float stand_walk_blend_value; float stand_run_duration_state_has_been_valid; float stand_run_duration_state_has_been_invalid; float stand_run_how_long_to_wait_until_transition_can_blend_in; float stand_run_how_long_to_wait_until_transition_can_blend_out; float stand_run_blend_value; float crouch_walk_duration_state_has_been_valid; float crouch_walk_duration_state_has_been_invalid; float crouch_walk_how_long_to_wait_until_transition_can_blend_in; float crouch_walk_how_long_to_wait_until_transition_can_blend_out; float crouch_walk_blend_value; int cached_model_index; float step_height_left; float step_height_right; void* weapon_last_bone_setup; void* player; void* weapon; void* weapon_last; float last_update_time; int last_update_frame; float last_update_increment; float eye_yaw; float eye_pitch; float abs_yaw; float abs_yaw_last; float move_yaw; float move_yaw_ideal; float move_yaw_current_to_ideal; char pad1[4]; float primary_cycle; float move_weight; float move_weight_smoothed; float anim_duck_amount; float duck_additional; float recrouch_weight; float position_current[3]; float position_last[3]; float velocity[3]; float velocity_normalized[3]; float velocity_normalized_non_zero[3]; float velocity_length_xy; float velocity_length_z; float speed_as_portion_of_run_top_speed; float speed_as_portion_of_walk_top_speed; float speed_as_portion_of_crouch_top_speed; float duration_moving; float duration_still; bool on_ground; bool landing; float jump_to_fall; float duration_in_air; float left_ground_height; float land_anim_multiplier; float walk_run_transition; bool landed_on_ground_this_frame; bool left_the_ground_this_frame; float in_air_smooth_value; bool on_ladder; float ladder_weight; float ladder_speed; bool walk_to_run_transition_state; bool defuse_started; bool plant_anim_started; bool twitch_anim_started; bool adjust_started; char activity_modifiers_server[20]; float next_twitch_time; float time_of_last_known_injury; float last_velocity_test_time; float velocity_last[3]; float target_acceleration[3]; float acceleration[3]; float acceleration_weight; float aim_matrix_transition; float aim_matrix_transition_delay; bool flashed; float strafe_change_weight; float strafe_change_target_weight; float strafe_change_cycle; int strafe_sequence; bool strafe_changing; float duration_strafing; float foot_lerp; bool feet_crossed; bool player_is_accelerating; char pad2[24]; float duration_move_weight_is_too_high; float static_approach_speed; int previous_move_state; float stutter_step; float action_weight_bias_remainder; char pad3[112]; float camera_smooth_height; bool smooth_height_valid; float last_time_velocity_over_ten; float unk; float aim_yaw_min; float aim_yaw_max; float aim_pitch_min; float aim_pitch_max; int animstate_model_version; } **',
        animlayer_t = ffi.typeof 'struct { bool client_blend; float blend_in; void *studio_hdr; int dispatch_sequence; int second_dispatch_sequence; uint32_t order; uint32_t sequence; float prev_cycle; float weight; float weight_delta_rate; float playback_rate; float cycle; void *entity; char pad_0x0038[0x4]; } **'
    },
    native = { get_client_entity = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)") }
}

local group = ui.create("Resolver");

local gui = class(classes, "gui") {
    contains = function(self, tab, val) for i = 1, #tab do if tab[i] == val then return true end end return false end,
    ping_spike = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
    fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),

    debug_options = group:selectable("Debug options", {"Side flag", "Delay flag", "Predicted box", "Backtrack box"}),
    jitter_correction = group:combo("Jitter correction", {"None", "Default", "Alternative"}),
    delay_shot = group:selectable("Delay shot+ conditions", {"Breaking lagcomp", "Jitter", "Defensive"}),
    force_delay = group:selectable("Force delay shot conditions", {"Breaking lagcomp", "Defensive"}),
    match_record = group:switch("Match Record"),

    perfomance_mode = group:switch("Perfomance mode")
}

gui.perfomance_mode:tooltip("Works only on at target entity")
gui.match_record:tooltip("Makes NL use our Lag compensation system")

local utils = class(classes, "utils") {
    clamp = function(self, value, min, max) 
        return math.clamp(value, min, max)
    end,    
    normalize_yaw = function(self, yaw)
        return math.normalize_yaw(yaw);
    end,
    deg2rad = function(self, deg) 
        return deg * (math.pi / 180)
    end,
    rad2deg = function(self, rad) 
        return rad * (180 / math.pi) 
    end,
    lerp = function(self, a, b, t) 
        return a + (b - a) * t 
    end,
    remainderf = function(self, x, y)
        local result = x % y
        if math.abs(result) > math.abs(y) / 2 then
            result = result - y * sign(result)
        end
        return result
    end,
    approach = function(self, current, target, step)
        if current < target then
            current = math.min(current + step, target)
        elseif current > target then
            current = math.max(current - step, target)
        end
        return current
    end,
    calculate_angle = function(self, src, dest)
        local angle = vector(0, 0, 0)
        local delta = vector(src.x - dest.x, src.y - dest.y, src.z - dest.z)
        local hyp = math.sqrt(delta.x * delta.x + delta.y * delta.y)
        angle.x = math.atan(delta.z / hyp) * 57.295779513082
        angle.y = math.atan(delta.y / delta.x) * 57.295779513082
        angle.z = 0.0
        if delta.x >= 0.0 then angle.y = angle.y + 180.0 end
        return angle
    end,
    roundf = function(self, x)
        if x ~= x then return x end
        if x == math.huge or x == -math.huge then return x end
        local abs_x = math.abs(x)
        local fractional = abs_x - math.floor(abs_x)
        if fractional >= 0.5 then
            return x > 0 and math.ceil(x) or math.floor(x)
        else
            return x > 0 and math.floor(x) or math.ceil(x)
        end
    end,
    vector_add = function(self, a, b) 
        return vector(a.x + b.x, a.y + b.y, a.z + b.z)
    end,
    vector_reduce = function(self, a, b) 
        return vector(a.x - b.x, a.y - b.y, a.z - b.z)
    end,
    render_box3d = function(self, ent, origin, predicted_origin, clr)
        local lerp_velocity = origin:lerp(predicted_origin, .41)
        local min = ent.m_vecMins + lerp_velocity
        local max = ent.m_vecMaxs + lerp_velocity

        local points = { {min.x, min.y, min.z}, {min.x, max.y, min.z}, {max.x, max.y, min.z}, {max.x, min.y, min.z}, {min.x, min.y, max.z}, {min.x, max.y, max.z}, {max.x, max.y, max.z}, {max.x, min.y, max.z}, }
        local edges = { {0, 1}, {1, 2}, {2, 3}, {3, 0}, {5, 6}, {6, 7}, {1, 4}, {4, 8}, {0, 4}, {1, 5}, {2, 6}, {3, 7}, {5, 8}, {7, 8}, {3, 4} }

        for i = 1, #edges do
            if points[edges[i][1]] ~= nil and points[edges[i][2]] ~= nil then
                local p1 = vector(points[edges[i][1]][1], points[edges[i][1]][2], points[edges[i][1]][3]):to_screen()
                local p2 = vector(points[edges[i][2]][1], points[edges[i][2]][2], points[edges[i][2]][3]):to_screen()
                if p1 ~= nil and p2 ~= nil and (p1.x ~= 0 and p1.y ~= 0) and (p2.x ~= 0 and p2.y ~= 0) then
                    render.line(p1, p2, clr)
                end
            end
        end
    end
}

local player = class(classes, "player") {
    is_valid = function(self, ent)
        if ent == nil then return false end
        local ptr = safe_get_ptr(ent)
        if not ptr then return false end
        return ent:is_alive() and ent.m_iHealth > 0 and ent.m_iHealth < 127 and ent:get_name() ~= ""
    end,

    get_animstate = function(self, ent)
        if not ent then return false end
        local success, ptr = pcall(function() return ent[0] end)
        if not success or ptr == ffi.NULL then return end;
        local ent_adr = ffi.cast("char*", ptr)

        local animstate_pointer = ffi.cast(g_ctx.structs.animstate_t, ent_adr + 0x9960);
        if animstate_pointer == nil or animstate_pointer == ffi.NULL then return end
        return animstate_pointer[0]
    end,
    
    get_animlayer = function(self, ent)
        if not ent then return false end
        local success, ptr = pcall(function() return ent[0] end)
        if not success or ptr == ffi.NULL then return end;
        local ent_adr = ffi.cast("char*", ptr)

        local animlayer_pointer = ffi.cast(g_ctx.structs.animlayer_t, ent_adr + 0x2990)
        if animlayer_pointer == nil or animlayer_pointer == ffi.NULL then return end
        return animlayer_pointer[0]
    end,

    get_simulation_time = function(self, ent)
        local success, ptr = pcall(function() return ent[0] end)

        if success and ptr ~= nil and ptr ~= ffi.NULL then
            local simtime = ffi.cast("float*", ffi.cast("uintptr_t", ptr) + 0x268)
            local simtime_old = ffi.cast("float*", ffi.cast("uintptr_t", ptr) + 0x26C)

            if simtime == nil or simtime == ffi.NULL then
                return 0, 0
            end

            if simtime_old == nil or simtime_old == ffi.NULL then
                return 0, 0
            end

            return simtime[0], simtime_old[0]
        else 
            return 0, 0
        end
    end,

    get_choked_packets = function(self, ent)
        local simulation_time, old_simulation_time = self:get_simulation_time(ent)
        return utils:clamp(to_ticks(simulation_time - old_simulation_time), 0, 64)
    end,

    get_min_rotation = function(self, ent) 
        local state = self:get_animstate(ent)
        local speed_walk = math.max(.0, math.min(state.speed_as_portion_of_walk_top_speed, 1.0))
        local speed_duck = math.max(.0, math.min(state.speed_as_portion_of_crouch_top_speed, 1.0))
        local modifier = ((state.walk_run_transition * -.30000001) - .19999999) * speed_walk + 1.0
        if state.anim_duck_amount > .0 then modifier = modifier + ((state.anim_duck_amount * speed_duck) * (.5 - modifier)) end
        return -58.0 * modifier
    end,

    get_max_rotation = function(self, ent) 
        local state = self:get_animstate(ent)
        local speed_walk = math.max(.0, math.min(state.speed_as_portion_of_walk_top_speed, 1.0))
        local speed_duck = math.max(.0, math.min(state.speed_as_portion_of_crouch_top_speed, 1.0))
        local modifier = ((state.walk_run_transition * -.30000001) - .19999999) * speed_walk + 1.0
        if state.anim_duck_amount > .0 then modifier = modifier + ((state.anim_duck_amount * speed_duck) * (.5 - modifier)) end
        return 58.0 * modifier
    end,

    store_layer = function(self, ent, layer)   
        local animlayer = self:get_animlayer(ent)
        for i = 0, 12 do
            local L = animlayer[i]
            if animlayer then
                layer[i] = layer[i] or {}
                layer[i].client_blend = L.client_blend
                layer[i].blend_in = L.blend_in
                layer[i].studio_hdr = L.studio_hdr
                layer[i].dispatch_sequence = L.dispatch_sequence
                layer[i].second_dispatch_sequence = L.second_dispatch_sequence
                layer[i].order = L.order
                layer[i].sequence = L.sequence
                layer[i].prev_cycle = L.prev_cycle
                layer[i].weight = L.weight
                layer[i].weight_delta_rate = L.weight_delta_rate
                layer[i].playback_rate = L.playback_rate
                layer[i].cycle = L.cycle
                layer[i].entity = L.entity
                layer[i].pad_0x0038 = L.pad_0x0038
            end
        end
    end
}

local resolver = class(classes, "resolver") {
    info = {},
    defaults = { boolean = false, number = 0, string = "", tbl = {}, buffer = 6 },
    init_info = function(self, index)
        entity.get_players(true, true, function(ent)
            if ent == nil then
                return
            end

            local idx = ent:get_index();


            self.info[idx] = {
                hitted_shots = self.defaults.number, missed_shots = self.defaults.number, need_resolve = self.defaults.boolean,
                lock_side = self.defaults.boolean, updated_side = self.defaults.boolean,
                previous_side = self.defaults.number, side = self.defaults.number,
                angle = self.defaults.number, previous_angle = self.defaults.number,
                update_time = self.defaults.number, mode = self.defaults.string,
                shot_time = self.defaults.number, total_server_hits = self.defaults.number,
                last_backtrack_tick = self.defaults.number,
                jitter = self.defaults.boolean, jitter_cache = self.defaults.number, jitter_buffer = self.defaults.buffer, jitter_difference = self.defaults.number,
                yaw_cache = {}, yaw_diffs = {}
            }
        end)
    end,
    rebuild_server_yaw = function(self, ent, record, side)
        local info = self.info[ent:get_index()]
        local state = player:get_animstate(ent)
        local networked_abs_angles = .0
    
        local velocity = record.velocity
        local speed = velocity:length2dsqr()
        if speed > math.pow(1.2 * 260.0, 2.0) then 
            velocity = velocity:normalized() * (1.2 * 260.0) 
        end
    
        local min_body_yaw, max_body_yaw = player:get_min_rotation(ent), player:get_max_rotation(ent)
    
        local eye_yaw = state.eye_yaw
        local eye_diff = utils:remainderf(eye_yaw - networked_abs_angles, 360.0)
        if eye_diff <= max_body_yaw then
            if min_body_yaw > eye_diff then
                networked_abs_angles = math.abs(min_body_yaw) + eye_yaw
            end
        else
            networked_abs_angles = eye_yaw - math.abs(max_body_yaw)
        end
    
        networked_abs_angles = utils:remainderf(networked_abs_angles, 360.0)
    
        if speed > .1 or math.abs(velocity.z) > 100.0 then
            networked_abs_angles = utils:approach(eye_yaw, networked_abs_angles, ((state.left_ground_height * 20.0) + 30.0) * state.last_update_time)
        else 
            networked_abs_angles = utils:approach(record.lower_body_yaw_target, networked_abs_angles, state.last_update_time * 100.0)
        end
    
        return ({[-1] = eye_yaw + min_body_yaw, [0] = networked_abs_angles, [1] = eye_yaw + max_body_yaw, [-2] = eye_yaw})[side]
    end,
    prepare_jitter = function(self, state, ent)
        local info = self.info[ent:get_index()]
        if not info then 
            return false 
        end

        info.yaw_cache[info.jitter_cache % info.jitter_buffer] = state.eye_yaw
        info.jitter_cache = info.jitter_cache >= info.jitter_buffer and 0 or info.jitter_cache + 1
    
        for i = 0, info.jitter_buffer, 1 do
            if i < info.jitter_buffer then
                local prev_yaw_cache_index = (info.jitter_cache - i) % info.jitter_buffer
                local curr_yaw_cache_index = info.jitter_cache % info.jitter_buffer
                
                local cache_got_valid = not (prev_yaw_cache_index < 1 or prev_yaw_cache_index > #info.yaw_cache) and not (curr_yaw_cache_index < 1 or curr_yaw_cache_index > #info.yaw_cache) 
                if cache_got_valid then
                    local prev_yaw_cache, curr_yaw_cache = info.yaw_cache[prev_yaw_cache_index], info.yaw_cache[curr_yaw_cache_index]
                    local yaw_diff_sign = (curr_yaw_cache - prev_yaw_cache) / math.abs(curr_yaw_cache - prev_yaw_cache)
                    local difference = (info.yaw_cache[i - info.jitter_cache % info.jitter_buffer] ~= nil and info.yaw_cache[info.jitter_cache % info.jitter_buffer] ~= nil) and math.abs(info.yaw_cache[i - info.jitter_cache % info.jitter_buffer] - info.yaw_cache[info.jitter_cache % info.jitter_buffer]) or 0
                    if difference ~= nil and difference ~= 0.0 then
                        info.jitter = utils:normalize_yaw(difference) >= 29.0

                        if yaw_diff_sign == 1 or yaw_diff_sign == -1 then
                            info.jitter_difference = utils:normalize_yaw(yaw_diff_sign * math.abs(difference))
                        end
                    end
                end
            end
        end
        return info.jitter
    end,
    find_desync_side = function(self, ent, record)
        local info = self.info[ent:get_index()]
        if not info then 
            self:init_info(ent:get_index())
        end

        local state, layers = player:get_animstate(ent), player:get_animlayer(ent)
        if info.missed_shots >= 1 then
            info.side = MISSED_TO_SIDE[info.missed_shots]
        else
            if layers[6].weight == 0 or layers[6].weight == 1 then
                info.side = -2
            elseif record.velocity:length2d() <= 5 and layers[6].weight > .001 then
                local delta = utils:normalize_yaw(state.abs_yaw - state.eye_yaw)
                if math.abs(delta) > player:get_max_rotation(ent) then
                    info.side = delta > 0 and -1 or 1
                end
            elseif record.velocity:length2d() > 5 then
                info.side = 0
            end
            
            self:prepare_jitter(state, ent)
        end
    end,
    find_oprimal_degree = function(self, ent, record, state, info, layers)
        if info.missed_shots >= 1 then
            info.mode = "B"
            info.angle = self:rebuild_server_yaw(ent, record, info.side)
        else
            if record.velocity:length2d() <= 5 then
                info.mode = "S"
                info.angle = (layers[3].cycle == .0 and layers[3].weight == .0) and player:get_max_rotation(ent) or (player:get_max_rotation(ent) / 2)
            elseif layers[6].playback_rate > .0001 then
                info.mode = "M"
                info.angle = self:rebuild_server_yaw(ent, record, 0)
            end
        end
    end,
    correct_angles = function(self, ent, record)
        if not record then 
            return 
        end

        local info = self.info[ent:get_index()]
        if not info then 
            self:init_info(ent:get_index())
        else
            local state, layers = player:get_animstate(ent), player:get_animlayer(ent)
            local has_micromove, on_ladder = layers[6].weight ~= 0 and layers[6].weight ~= 1, ent.m_MoveType == 9
            
            info.need_resolve = true
            if info.need_resolve then
                self:find_oprimal_degree(ent, record, state, info, layers)
                state.abs_yaw = utils:normalize_yaw(info.mode == "S" and state.eye_yaw + (info.angle * info.side) or info.angle)
            else
                state.abs_yaw = state.eye_yaw
            end
        end
    end
}

local animation_fix = class(classes, "animation_fix") {
    all_animation_info = {}, all_animation_info_map = {},
    animation_info = function(self, ent, records) 
        return { ent = ent, records = records, all_records = { }, last_record = { }, previous_record = { }, backup_record = { } }
    end,
    get_animation_info = function(self, idx) 
        return idx and self.all_animation_info_map[idx] or nil 
    end,
    get_data_by_index = function(self, record, side) 
        return ({[1] = record.sim_left, [-1] = record.sim_right, [0] = record.sim_zero, [2] = record.sim_orig})[side] 
    end,
    simulate_player = function(self, ent, record, side)
        local state = player:get_animstate(ent)
        if not state then 
            return 
        end

        local anim_player = self:get_animation_info(ent:get_index())
        local last_record = anim_player.last_record
        local current_side = self:get_data_by_index(record, side)

        player:store_layer(ent, current_side.layers)

        local last_current_side = self:get_data_by_index(last_record, side)

        if not last_record or record.dormant or state.last_update_time == 0 then
            state.last_update_time = (record.simulation_time - globals.tickinterval)
            if record.sim_orig.layers and #record.sim_orig.layers > 0 then
                state.primary_cycle = record.sim_orig.layers[6].cycle
                state.move_weight = record.sim_orig.layers[6].weight
                state.strafe_sequence = record.sim_orig.layers[7].sequence
                state.strafe_change_weight = record.sim_orig.layers[7].weight
                state.strafe_change_cycle = record.sim_orig.layers[7].cycle
                state.acceleration_weight = record.sim_orig.layers[12].weight
            end
        else
            state.primary_cycle = last_record.sim_orig.layers[6].cycle
            state.move_weight = last_record.sim_orig.layers[6].weight
            state.acceleration_weight = last_record.sim_orig.layers[12].weight
        end

        if not last_record or (record.choked ~= nil and record.choked < 2) then
            record.velocity = ent.m_vecVelocity
            record.abs_velocity = record.velocity
            if not record.teammate then
                if side ~= 2 then
                    state.abs_yaw = state.eye_yaw + (player:get_max_rotation(ent) * side)
                else
                    if resolver:prepare_jitter(state, ent) then
                        local info, cache = resolver.info[ent:get_index()], {}
                        
                        if gui.jitter_correction:get() == "Default" then
                            if math.abs(info.jitter_difference) > 29 then
                                state.abs_yaw = resolver:rebuild_server_yaw(ent, record, 0) + info.jitter_difference
                            else
                                resolver:correct_angles(ent, record)
                            end
                        elseif gui.jitter_correction:get() == "Alternative" then
                            local yc5 = info.yaw_cache[info.jitter_buffer - 1]
                            local yc4 = info.yaw_cache[info.jitter_buffer - 2]

                            if yc5 == nil or yc4 == nil then
                                resolver:correct_angles(ent, record)
                            else
                                cache.first_sin = math.sin(utils:deg2rad(utils:normalize_yaw(yc5)))
                                cache.second_sin = math.sin(utils:deg2rad(utils:normalize_yaw(yc4)))
                                cache.first_cos = math.cos(utils:deg2rad(utils:normalize_yaw(yc5)))
                                cache.second_cos = math.cos(utils:deg2rad(utils:normalize_yaw(yc4)))

                                cache.avg_yaw = utils:normalize_yaw(utils:rad2deg(math.atan2((cache.first_sin + cache.second_sin) / 2.0, (cache.first_cos + cache.second_cos) / 2.0)))
                                cache.difference = utils:normalize_yaw(resolver:rebuild_server_yaw(ent, record, 0) - cache.avg_yaw)

                                if cache.difference ~= 0 then
                                    state.abs_yaw = resolver:rebuild_server_yaw(ent, record, 0) + (45.0 * cache.difference > .0 and 1 or -1)
                                    --state.abs_yaw = state.eye_yaw + (45.0 * cache.difference > .0 and 1 or -1)
                                else
                                    resolver:correct_angles(ent, record)
                                end
                            end
                        else
                            resolver:correct_angles(ent, record)
                        end

                        record.delay_shot.jitter = true
                    else
                        resolver:correct_angles(ent, record)
                    end

                    if record.choked <= 1 then
                        if record.velocity:length2d() > .1 and bit.band(ent.m_fFlags, 1) == 1 then
                            ent.m_flPoseParameter[0] = (utils:normalize_yaw(state.move_yaw + 180.0) + 180.0) / 360.0
                        end
                    elseif record.choked == 0 then
                        local last_current_side = self:get_data_by_index(last_record, side)
                        if last_current_side then
                            local layers = last_current_side.layers
                            state.primary_cycle = layers[6].cycle
                            state.move_weight = layers[6].weight
                            state.strafe_sequence = layers[7].sequence
                            state.strafe_change_weight = layers[7].weight
                            state.strafe_change_cycle = layers[7].cycle
                            state.acceleration_weight = layers[12].weight
                        end
                    end
                end
            end
        else
            local wpn = ent:get_player_weapon()
            if record.choked ~= nil then
                for i = 0, record.choked, 1 do
                    local new_simtime = record.old_simulation_time + to_time(i + 1)
                    local sim_tick = to_ticks(new_simtime)

                    record.abs_velocity = record.velocity

                    if not record.teammate then
                        if side ~= 2 then
                            state.abs_yaw = state.eye_yaw + (player:get_max_rotation(ent) * side)
                        else
                            if i > 2 and last_record.sim_orig then
                                local layers = last_record.sim_orig.layers
                                if #layers > 0 and layers[6] then
                                    state.primary_cycle = layers[6].cycle
                                    state.move_weight = layers[6].weight
                                    state.strafe_sequence = layers[7].sequence
                                    state.strafe_change_weight = layers[7].weight
                                    state.strafe_change_cycle = layers[7].cycle
                                    state.acceleration_weight = layers[12].weight
                                end
                            end

                            resolver:correct_angles(ent, record)

                            if record.choked > 1 and record.did_shot and anim_player.backup_record.simulation_time >= wpn.m_fLastShotTime then
                                local fire_yaw = utils:normalize_yaw(utils:calculate_angle(ent:get_hitbox_position(8), ent:get_hitbox_position(0)).y)
                                local left_fire_yaw_delta = math.abs(utils:normalize_yaw(fire_yaw - (record.eye_angles.y + player:get_max_rotation(ent))))
                                local right_fire_yaw_delta = math.abs(utils:normalize_yaw(fire_yaw - (record.eye_angles.y + player:get_min_rotation(ent))))
                                state.abs_yaw = resolver:rebuild_server_yaw(ent, record, left_fire_yaw_delta > right_fire_yaw_delta and 1 or -1)
                            else
                                if record.last_shot_time <= record.simulation_time then
                                    state.eye_yaw = record.eye_angles.y
                                end
                            end
                        end
                    end
                end
            end
        end

        if record.sim_orig and last_record.sim_orig then
            if not last_record then
                record.sim_orig.layers[12].weight, record.sim_orig.layers[12].cycle = .0, .0
            elseif last_current_side and last_record.sim_orig.layers ~= 0 then
                if last_record.sim_orig.layers[12] and record.sim_orig.layers[12] then
                    record.sim_orig.layers[12].weight = last_record.sim_orig.layers[12].weight
                    record.sim_orig.layers[12].cycle = last_record.sim_orig.layers[12].cycle
                end 
            end
        end
    end,
}

local c_animation_fix = {}
setmetatable(c_animation_fix, { __index = animation_fix })

local lag_compensation = class(classes, "lag_compensation") {
    all_records = {},
    fill_record = function(self, ent)
        local record = {
            valid = false,
            ent = ent,
            dormant = true, dormant_ticks = 0,
            flags = 0,
            simulation_time = 0, old_simulation_time = 0,
            velocity = vector(), abs_velocity = vector(),
            origin = vector(), abs_origin = vector(),
            state = nil,
            lower_body_yaw_target = 0,
            did_shot = false, last_shot_time = 0,
            eye_angles = vector(), abs_angles = vector(),
            choked, shifting, breaking_lc = 0, false, false,
            sim_orig = { layers = { } }, 
            sim_left = { layers = { } }, 
            sim_right = { layers = { } }, 
            sim_zero = { layers = { } },
            teammate = false,
            delay_shot = { state = false, breaking_lc = false, jitter = false, defensive = false }
        }
        return record
    end,
    update_record = function(self, ent, record)
        local wpn = ent:get_player_weapon()
        if wpn == nil then return end;
        local sim_time, old_sim_time = player:get_simulation_time(ent)
        record.valid = true
        record.ent = ent
        record.dormant = ent:is_dormant()
        record.flags = ent.m_fFlags
        record.simulation_time, record.old_simulation_time = sim_time, old_sim_time
        record.velocity, record.abs_velocity = ent.m_vecVelocity, ent.m_vecAbsVelocity
        record.origin, record.abs_origin = ent.m_vecOrigin, ent.m_vecNetworkOrigin;
        record.state = player:get_animstate(ent) or nil
        record.last_shot_time = wpn.m_fLastShotTime or 0
        record.lower_body_yaw_target = ent.m_flLowerBodyYawTarget
        record.eye_angles, record.abs_angles = ent.m_angEyeAngles, record.state.abs_yaw
        record.choked = utils:clamp(to_ticks(sim_time - old_sim_time), 0, math.abs(g_ctx.cvar.sv_maxusrcmdprocessticks) + 1)
        record.teammate = g_ctx.local_player and g_ctx.local_player.m_iTeamNum == ent.m_iTeamNum
        player:store_layer(ent, record.sim_orig.layers)
    end,
    update_dormant = function(self, record) 
        record.dormant = record.dormant_ticks < 1
    end,
    update_shot = function(self, record, last_record)
        local wpn = record.ent:get_player_weapon()
        if last_record ~= nil and #last_record > 0 and wpn then
            record.last_shot_time = wpn.m_fLastShotTime
            record.did_shot = record.simulation_time >= record.last_shot_time and record.last_shot_time > last_record.simulation_time
        end
    end,
    post_update_player = function(self)
        if not player:is_valid(g_ctx.local_player) then
            if c_animation_fix.all_animation_info_map then
                for k, v in pairs(c_animation_fix.all_animation_info_map) do
                    c_animation_fix.all_animation_info_map[k] = nil
                end
            end
            return
        end
    
        entity.get_players(true, true, function(idx)
            if idx == nil or not idx:is_alive() then
                return
            end

            if not player:is_valid(idx) then
                if idx and idx.get_index then
                    c_animation_fix.all_animation_info_map[idx:get_index()] = nil;
                end
                return
            end

            local threat = entity.get_threat() or nil;
            local threat_index = threat and (threat:get_index() or -1) or -1

            if gui.perfomance_mode:get() and idx:get_index() ~= threat_index then
                return
            end

            local track = c_animation_fix.all_animation_info_map[idx:get_index()]
            if not track then
                track = c_animation_fix:animation_info(idx:get_index(), {})
                c_animation_fix.all_animation_info_map[idx:get_index()] = track
            end

            while #track.all_records >= 32 do 
                table.remove(track.all_records, #track.all_records) 
            end
    
            if #track.all_records > 0 then
                track.last_record = track.all_records[#track.all_records]

                if #track.all_records > 3 then 
                    track.previous_record = track.all_records[#track.all_records - 1] 
                end
            end
    
            track.backup_record = nil
            if not track.backup_record then 
                track.backup_record = self:fill_record(idx) 
            end
            
            self:update_record(idx, track.backup_record)
    
            local current_record = nil
            if not current_record then
                current_record = self:fill_record(idx) 
            end

            emplace_front(track.all_records, current_record)

            self:update_record(idx, current_record)
            self:update_dormant(current_record)
            self:update_shot(current_record, track.last_record)

            current_record.dormant_ticks = current_record.dormant_ticks < 1 and current_record.dormant_ticks + 1 or current_record.dormant_ticks

            local old_state = player:get_animstate(idx)

            for key, side in ipairs(SIDES) do
                c_animation_fix:simulate_player(idx, current_record, side)
                current_record.state = old_state
            end

            resolver:find_desync_side(idx, current_record)
            
            local sim_time, old_sim_time = player:get_simulation_time(idx)
            if old_sim_time > current_record.simulation_time then
                current_record.did_shot = false
                current_record.last_shot_time = 0
                current_record.shifting = true
            else
                old_sim_time = current_record.simulation_time
            end

            current_record.delay_shot.defensive = current_record.shifting

            if not current_record.shifting and track.last_record then
                if current_record.origin ~= nil and track.last_record.origin ~= nil then
                    current_record.breaking_lc = current_record.choked > 3 and (current_record.origin - track.last_record.origin):lengthsqr() > 4096.0
                else
                    current_record.breaking_lc = false
                end

                current_record.delay_shot.breaking_lc = current_record.breaking_lc
            end
    
            track.last_record, track.previous_record = {}, {}
        end)
    end,
    get_lerp_time = function(self)
        local output, last_tick = 0, 0
        if globals.tickcount == last_tick then return output end
        local client_interp_amount = math.max(math.abs(g_ctx.cvar.cl_interp), math.abs(g_ctx.cvar.cl_interp_ratio) / math.abs(g_ctx.cvar.cl_updaterate))
        output = utils:roundf(client_interp_amount * 1000.0) / 1000.0
        last_tick = globals.tickcount
        return output
    end,
    is_valid_record = function(self, simtime)
        if not player:is_valid(entity.get_local_player()) then 
            return false
        end
        
        if exploits:is_active() and exploits:in_recharge() then 
            return false
        end

        local latency = entity.get_local_player():get_resource().m_iPing;
        local possible_future_tick = globals.server_tick + to_ticks(latency) + 8

        local correct = 0
        correct = correct + latency
        correct = correct + self:get_lerp_time()
        correct = utils:clamp(correct, .0, math.abs(g_ctx.cvar.sv_maxunlag))
        
        local delta_time = correct - (globals.curtime - simtime)
        local delta_time_unshifted = correct - (globals.curtime - globals.tickinterval - simtime)
        local delta_time_shifted = correct - (globals.curtime + globals.tickinterval - simtime)

        local ping_spike_amount = (gui.ping_spike:get() or gui.ping_spike:get_override()) / 1000;
        local ping_spike = ping_spike_amount > 0

        local ping_additivie = ping_spike and ping_spike_amount or 0

        local current_max_unlag = (exploits:is_active() and not exploits:in_recharge()) and math.abs(g_ctx.cvar.sv_maxunlag) + ping_additivie or math.abs(g_ctx.cvar.sv_maxunlag)
        local record_time = current_max_unlag

        if math.abs(delta_time) >= record_time or to_ticks(simtime + self:get_lerp_time()) > possible_future_tick then
            return false
        end

        local extra_choke = gui.fake_duck:get() and 14 - globals.choked_commands or 0
        local server_tickcount = globals.tickcount + latency + extra_choke

        local deadtime = math.floor((server_tickcount * globals.tickinterval - current_max_unlag) / globals.tickinterval + .5)

        if exploits:is_active() and not exploits:in_recharge() then
            --if exploits:is_active() and not exploits:is_hideshots() then
                return (math.abs(delta_time_unshifted) < record_time and math.abs(delta_time_shifted) < record_time)
            --end

            --return (math.abs(delta_time_unshifted) < record_time and math.abs(delta_time_shifted) < record_time) and exploits:is_lagcomp_broken()
        end

        return math.abs(delta_time) < record_time
    end,
    get_latest_record  = function(self, index)
        local track = c_animation_fix.all_animation_info_map[index]
        if not track then 
            return nil 
        end

        if not track.all_records or #track.all_records == 0 then 
            return nil 
        end

        for i = #track.all_records, 1, -1 do
            if self:is_valid_record(track.all_records[i].simulation_time) then
                return track.all_records[i]
            end
        end

        return nil
    end,
    get_oldest_record = function(self, index)
        local track = c_animation_fix.all_animation_info_map[index]
        if not track then 
            return nil
        end

        if not track.all_records or #track.all_records == 0 then 
            return nil 
        end

        for i, record in ipairs(track.all_records) do
            if self:is_valid_record(record.simulation_time) then
                return record
            end
        end

        return nil
    end,
    is_broken_record = function(self, index, record_type, record_idx, miss_log)
        record_type = record_type or "latest"
        record_idx = record_idx or 0
        miss_log = miss_log or false

        local track = c_animation_fix.all_animation_info_map[index]
        if not track then 
            return false
        end

        if not track.all_records or #track.all_records == 0 then 
            return false 
        end

        if record_type == "latest" then
            local latest_record = self:get_latest_record(index)
            if latest_record then
                if latest_record.breaking_lc then
                    if miss_log then
                        print(("breaking_lc:%s"):format(latest_record.shifting))
                    end
                    
                    return latest_record.breaking_lc
                end

                if latest_record.shifting then
                    if miss_log then
                        print(("shifting:%s"):format(latest_record.shifting))
                    end
                    
                    return latest_record.shifting
                end

                if latest_record.old_simulation_time > latest_record.simulation_time then
                    if miss_log then
                        print(("invalid sim_time:%s"):format(latest_record.old_simulation_time > latest_record.simulation_time))
                    end

                    return latest_record.old_simulation_time > latest_record.simulation_time
                end

                return false
            end
        elseif record_type == "oldest" then
            local oldest_record = self:get_oldest_record(index)
            if oldest_record then
                if oldest_record.breaking_lc then
                    if miss_log then
                        print(("breaking_lc:%s"):format(oldest_record.shifting))
                    end

                    return oldest_record.breaking_lc
                end

                if oldest_record.shifting then
                    if miss_log then
                        print(("shifting:%s"):format(oldest_record.shifting))
                    end
                    return oldest_record.shifting
                end

                if oldest_record.old_simulation_time > oldest_record.simulation_time then
                    if miss_log then
                        print(("invalid sim_time:%s"):format(oldest_record.old_simulation_time > oldest_record.simulation_time))
                    end

                    return oldest_record.old_simulation_time > oldest_record.simulation_time
                end

                return false
            end
        else
            for idx, current_record in ipairs(track.all_records) do
                if idx == record_idx then
                    if current_record.breaking_lc then
                        if miss_log then
                            print(("breaking_lc:%s"):format(current_record.shifting))
                        end
                        return current_record.shifting                                                                                                                                                                                                          
                    end
    
                    if current_record.shifting then
                        if miss_log then
                            print(("shifting:%s"):format(current_record.shifting))
                        end
                        return current_record.shifting
                    end

                    if current_record.old_simulation_time > current_record.simulation_time then
                        if miss_log then
                            print(("invalid sim_time:%s"):format(current_record.old_simulation_time > current_record.simulation_time))
                        end

                        return current_record.old_simulation_time > current_record.simulation_time
                    end

                    return false
                end
            end
        end

        return false
    end
}

local c_lag_compensation = {}
setmetatable(c_lag_compensation, { __index = lag_compensation })

local function threaded_post_update_player() c_lag_compensation:post_update_player() end
local new_thread = Thread.new()
new_thread:start(threaded_post_update_player)

local hook = {
    on_createmove = function(ctx)
        if not player:is_valid(entity.get_local_player()) then 
            return 
        end

        if not (g_ctx.local_player and (g_ctx.local_player == entity.get_local_player())) then 
            g_ctx.local_player = entity.get_local_player() 
        end

        if not (g_ctx.weapon and (g_ctx.weapon == g_ctx.local_player:get_player_weapon())) then 
            g_ctx.weapon = g_ctx.local_player:get_player_weapon();
        end
    end,

    on_net_update_end = function()
        if not player:is_valid(g_ctx.local_player) then 
            return
        end 

        threaded_post_update_player()

        --c_lag_compensation:post_update_player()

        entity.get_players(true, true, function(idx)
            if not player:is_valid(idx) then
                return
            end

            local threat = entity.get_threat() or nil;
            local threat_index = threat and (threat:get_index() or -1) or -1
            if gui.perfomance_mode:get() and idx:get_index() ~= threat_index then
                return
            end

            local anim_player = c_animation_fix:get_animation_info(idx:get_index())
            
            if anim_player and anim_player.ent ~= idx then
                anim_player.records, anim_player.all_records, anim_player.last_record, anim_player.previous_record, anim_player.backup_record = { }, { }, { }, { }, { }
                if anim_player.ent then 
                    anim_player.ent = nil 
                end

                anim_player.ent = idx
                return
            end

            if not idx:is_alive() then 
                if anim_player then anim_player.ent = nil end 

                if not idx:is_alive() then 
                    if anim_player then
                        anim_player.records = {}
                        anim_player.all_records = {}
                        anim_player.last_record = nil
                        anim_player.previous_record = nil
                        anim_player.backup_record = nil
                    end
                    c_animation_fix.all_animation_info_map[idx:get_index()] = nil
                    return
                end

                return
            end

            local sim_time, old_sim_time = player:get_simulation_time(idx)
            if sim_time == old_sim_time then 
                return
            end

            if idx:is_dormant() then
                anim_player.records, anim_player.all_records, anim_player.last_record, anim_player.previous_record = { }, { }, { }, { }
                return
            end
        end)

        entity.get_players(true, false, function(idx)
            local threat = entity.get_threat() or nil;
            local threat_index = threat and (threat:get_index() or -1) or -1

            if gui.perfomance_mode:get() and idx:get_index() ~= threat_index then
                return
            end

            local oldest_record, latest_record = c_lag_compensation:get_latest_record(idx:get_index()), c_lag_compensation:get_oldest_record(idx:get_index())

            if oldest_record then
                oldest_record.delay_shot.state = gui.delay_shot:get("Jitter") and oldest_record.delay_shot.jitter

                ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"):override()
                ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"):override()
                if oldest_record and oldest_record.delay_shot.state then
                    ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"):override("Force")
                end
            end

            if latest_record then
                latest_record.delay_shot.state = false
                if gui.delay_shot:get("Breaking lagcomp") and latest_record.delay_shot.breaking_lc then
                    latest_record.delay_shot.state = true
                end
    
                if gui.delay_shot:get("Defensive") and latest_record.delay_shot.defensive then
                    latest_record.delay_shot.state = true
                end
            end

            if latest_record and #latest_record > 0 and latest_record.delay_shot.state then
                ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"):override("Force")
            end

            if gui.force_delay:get("Breaking lagcomp") then
                if latest_record and #latest_record > 0 and latest_record.delay_shot.breaking_lc then
                    ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"):override("Force")
                end
            end

            if gui.force_delay:get("Defensive") then
                if latest_record and #latest_record > 0 and latest_record.delay_shot.defensive then
                    ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"):override("Force")
                end
            end
        end)
    end,

    on_render = function()
        for i = 1, globals.max_players do
            local idx = entity.get(i);
            if idx ~= entity.get_local_player() and player:is_valid(idx) and not idx:is_dormant() and idx:is_enemy() then
                local oldest_record = c_lag_compensation:get_latest_record(idx:get_index())

                if oldest_record and gui.debug_options:get("Backtrack box") then
                    utils:render_box3d(idx, oldest_record.origin, oldest_record.origin, color(c_lag_compensation:is_broken_record(idx:get_index(), "latest", 0, false) and 255 or 125, 125, 125))
                end
            end
        end
    end,

    on_aim_ack = function(ctx)
        if not ctx.target then 
            return 
        end

        local HITGROUP_NAMES = {
            [0] = "generic", "head", "chest", "stomach",
            "left arm", "right arm", "left leg", "right leg",
            "neck", "generic", "gear"
        }

        if not resolver.info[ctx.target:get_index()] then
            resolver:init_info(ctx.target:get_index())
        end

        local info = resolver.info[ctx.target:get_index()];


        if ctx.state == nil then
            info.total_server_hits = g_ctx.local_player.m_totalHitsOnServer
            info.shot_time = globals.realtime
            info.last_backtrack_tick = ctx.backtrack
            info.hitted_shots = info.hitted_shots + 1

            print(("hit in %s's %s(%s) for %s(%s) dmg (bt: %st, need_resolve: %s, jitter: %s, choke: %s)"):format(
                ctx.target:get_name(),      
                HITGROUP_NAMES[ctx.hitgroup],
                HITGROUP_NAMES[ctx.wanted_hitgroup],
                ctx.damage,
                ctx.wanted_damage,
                ctx.backtrack,
                info.need_resolve, 
                info.jitter,
                player:get_choked_packets(ctx.target)

            ))
            return
        end

        local total_server_hits = g_ctx.local_player.m_totalHitsOnServer
        local is_valid_total_hits = total_server_hits < 255 and info.total_server_hits < 255

        local miss_reason = ctx.state

        if c_lag_compensation:is_broken_record(ctx.target:get_index(), "current", ctx.backtrack, true) then
            miss_reason = "backtrack failure"
        end

        -- when extrapolated
        --if resolver.info[ctx.target:get_index()].last_backtrack_tick < -1 and player:get_choked_packets(ctx.target) > 14 then
        --    miss_reason = "backtrack failure"
        --end

        if miss_reason == "correction" then
            info.missed_shots = info.missed_shots + 1

            if info.missed_shots > 4 then 
                info.missed_shots = 0 
            end
        end

        print(("miss in %s's %s for %s dmg due to %s (bt: %st, need_resolve: %s, jitter: %s, choke: %s)"):format(
            ctx.target:get_name(),
            HITGROUP_NAMES[ctx.wanted_hitgroup],
            ctx.wanted_damage,
            miss_reason,
            ctx.backtrack,
            info.need_resolve,
            info.jitter,
            player:get_choked_packets(ctx.target)
        ))
    end,

    on_player_death = function(ctx)
        if not (ctx.userid and ctx.attacker) then 
            return 
        end

        local victim_ent = entity.get(ctx.userid, true)
        local attacker_ent = entity.get(ctx.attacker, true)

        local info = resolver.info[victim_ent:get_index()];

        if not info then 
            return 
        end

        if attacker_ent == entity.get_local_player() and attacker_ent ~= nil and victim_ent ~= nil and victim_ent:is_enemy() then
            local missed_shots_count = info.missed_shots or 0
            local hit_data_count = info.hitted_shots or 0
            
            if missed_shots_count <= 4 and hit_data_count ~= 0 then
                info.missed_shots = info.missed_shots
            end

            if missed_shots_count >= 3 and hit_data_count == 0 then
                info.missed_shots = 0

                if info.hitted_shots then
                    info.hitted_shots = 0
                end
            end
        end
    end,

    on_round_end = function(ctx)
        for k, v in pairs(c_animation_fix.all_animation_info_map) do
            c_animation_fix.all_animation_info_map[k] = nil
        end        
    end,

    on_round_start = function(ctx)
        for k, v in pairs(c_animation_fix.all_animation_info_map) do
            c_animation_fix.all_animation_info_map[k] = nil
        end
    end,

    on_player_spawn = function(ctx)
        for k, v in pairs(c_animation_fix.all_animation_info_map) do
            c_animation_fix.all_animation_info_map[k] = nil
        end
    end,
}

for k, v in next, hook do
    events[k:sub(4)](v) 
end


esp.enemy:new_text("Side flag", "RESOLVED", function(ent)
    if not gui.debug_options:get("Side flag") then 
        return 
    end

    if ent:is_dormant() and not player:is_valid(ent) then 
        return
    end

    if not resolver.info[ent:get_index()] then 
        return 
    end

    local side = resolver.info[ent:get_index()].side;

    if side == -1 then
        return "R";
    elseif side == 1 then
        return "L"
    elseif side == 0 then
        return "M"
    elseif side == -2 then
        return "N"
    end
end);

esp.enemy:new_text("Delay", "DELAY", function(ent)
    if not gui.debug_options:get("Delay flag") then 
        return
    end

    if ent:is_dormant() and not player:is_valid(ent) then 
        return
    end

    local oldest_record, latest_record = c_lag_compensation:get_oldest_record(ent:get_index()), c_lag_compensation:get_latest_record(ent:get_index())

    if latest_record and latest_record.delay_shot.state then
        return "DELAY" 
    end

    if oldest_record and oldest_record.delay_shot.state then
        return "DELAY" 
    end

    return
end)

local match_record do

    local function decide(simtime)
        return c_lag_compensation:is_valid_record(simtime)
    end

    local st_buf = ffi.new("uint32_t[1]")
    local st_flt = ffi.cast("float*", st_buf)

    local function cb_body(simtime_bits)
        st_buf[0] = simtime_bits
        local ok, res = pcall(decide, st_flt[0])
        if not ok then return 1 end
        return res and 1 or 0
    end

    local cb = ffi.cast("int(__cdecl*)(unsigned int)", cb_body)
    local cb_ptr = tonumber(ffi.cast("uintptr_t", cb))

    local function u32le(v)
        v = bit.band(v, 0xFFFFFFFF)
        return string.char(
            bit.band(v, 0xFF),
            bit.band(bit.rshift(v, 8),  0xFF),
            bit.band(bit.rshift(v, 16), 0xFF),
            bit.band(bit.rshift(v, 24), 0xFF)
        )
    end

    local region = ffi.C.VirtualAlloc(nil, 64, 0x3000, 0x40)
    assert(region ~= nil, "VirtualAlloc failed")
    local shim_addr = tonumber(ffi.cast("uintptr_t", region))

    local shim =
          "\x55"                 
       .. "\x89\xE5"             
       .. "\x83\xEC\x08"         
       .. "\x8B\x45\x08"         
       .. "\x89\x04\x24"         
       .. "\xB8" .. u32le(cb_ptr)
       .. "\xFF\xD0"             
       .. "\x83\xC4\x08"         
       .. "\x8B\x55\x10"         
       .. "\x85\xD2"             
       .. "\x74\x02"             
       .. "\x88\x02"             
       .. "\x0F\xB6\xC0"         
       .. "\x5D"                 
       .. "\xC2\x14\x00"         

    ffi.copy(region, shim, #shim)

    local FN = 0x41400BF0

    --0x41400BF0
    local p  = ffi.cast("uint8_t*", FN)
    assert(p[0] == 0x53, "wrong prolog")

    local backup = ffi.new("uint8_t[6]")
    for i = 0, 5 do backup[i] = p[i] end

    local rel = bit.band(shim_addr - (FN + 5), 0xFFFFFFFF)
    local install_bytes = "\xE9" .. u32le(rel) .. "\x90"
    local hooked = false

    local function install()
        if hooked then return end
        for i = 0, 5 do p[i] = string.byte(install_bytes, i + 1) end
        hooked = true
    end

    local function uninstall()
        if not hooked then return end
        for i = 0, 5 do p[i] = backup[i] end
        hooked = false
    end


    gui.match_record:set_callback(function(e)
        local value = e:get()

        if value == false then
            uninstall()
            return;
        end

        install();
    end)

    events.shutdown(uninstall)
end
