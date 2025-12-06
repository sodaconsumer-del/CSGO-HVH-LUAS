local pui = require 'neverlose/pui'

ffi.cdef[[
typedef void* HWND;
typedef unsigned int UINT;
typedef unsigned long DWORD;
typedef long LONG;
typedef unsigned long WPARAM;
typedef long LPARAM;
typedef long LRESULT;

HWND GetForegroundWindow(void);
LRESULT SendMessageA(HWND hWnd, UINT Msg, WPARAM wParam, LPARAM lParam);
]]

local user32 = ffi.load("user32")
local main = pui.create('', 'Main')

local master_switch = main:switch("Enable Feature", false, function(gear)
    return {
        mode = gear:combo("Mode", {"Default", "Smart", "Legit"}),
        conditions = gear:selectable("Conditions", {"Hittable", "In Air"}),
        tick_slider = gear:slider("Interval", 1, 640, 32, 0.1, 't'),
    }
end)

master_switch.tick_slider:depend({master_switch.mode, "Smart", true})
master_switch.conditions:depend({master_switch.mode, "Smart", true})

local references = { } do
    references.double_tap = pui.find("Aimbot", "Ragebot", "Main", "Double Tap")
    references.fake_duck = pui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck")
end

local function toggle_key(vk, down)
    local hwnd = user32.GetForegroundWindow()
    if hwnd == nil then return end

    local msg = down and 0x0100 or 0x0101

    user32.SendMessageA(hwnd, msg, vk, 0)
end

local ctx = { } do
    ctx.ui = { }
    ctx.cache = { }
end

ctx.legit_toggle_handles = {}

local function clear()
    for _, handle in ipairs(ctx.legit_toggle_handles) do
        if handle.cancel then
            handle:cancel()
        end
    end
    ctx.legit_toggle_handles = {}
end

local function start()
    if ctx.legit_toggle_running then return end
    ctx.legit_toggle_running = true

    local function toggle_off()
        if not ctx.legit_toggle_running then return end
        toggle_key(ctx.cache.bind, false)
        local handle = utils.execute_after(0.05, toggle_on)
        table.insert(ctx.legit_toggle_handles, handle)
    end

    function toggle_on()
        if not ctx.legit_toggle_running then return end
        toggle_key(ctx.cache.bind, true)
        local handle = utils.execute_after(to_time(ctx.ui.tick_slider), toggle_off)
        table.insert(ctx.legit_toggle_handles, handle)
    end

    toggle_on()
end

local function stop()
    ctx.legit_toggle_running = false
    toggle_key(ctx.cache.bind, false)
    clear()
end

local event_callbacks = { } do
    event_callbacks["Default"] = function()
        if ctx.ui.conditions:get("Hittable") and not ctx.hittable then
            return
        end

        if ctx.ui.conditions:get("In Air") and not ctx.in_air then
            return
        end

        references.fake_duck:override(globals.tickcount % ctx.ui.tick_slider == 0)
    end

    event_callbacks["Smart"] = function()
        if not ctx.in_air or not ctx.is_crouching or not ctx.hittable then
            return
        end

        references.fake_duck:override(globals.tickcount % 14 == 0)
    end

    event_callbacks["Legit"] = function()
        if ctx.ui.conditions:get("Hittable") and not ctx.hittable then
            stop()
            return
        end

        if ctx.ui.conditions:get("In Air") and not ctx.in_air then
            stop()
            return
        end

        start()
    end

    event_callbacks["Main"] = function()
        local lp = entity.get_local_player()
        if not lp then return end

        ctx.lp = lp
        ctx.in_air = bit.band(lp.m_fFlags, bit.lshift(1, 0)) == 0
        ctx.is_crouching = bit.band(lp.m_fFlags, bit.lshift(1, 1)) ~= 0
        ctx.hittable = entity.get_threat(true)

        event_callbacks[ctx.ui.mode]()
    end
end

master_switch:set_callback(function(self)
    ctx.ui.mode = self.mode:get()
    ctx.ui.conditions = self.conditions
    ctx.ui.tick_slider = self.tick_slider:get()
    ctx.ui.keybind = self.keybind

    local bind_table = json.parse(references.double_tap:export())["254269077"][1]["193496974"] -- hardcoded because i am too lazy lets hope it works for other users :pray:

    if not ctx.cache.bind or ctx.cache.bind ~= bind_table then
        ctx.cache.bind = bind_table
    end

    events.createmove(event_callbacks["Main"], self:get())

    if not self:get() then
        references.fake_duck:override()
        stop()
    end
end, true)
