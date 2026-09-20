
local loader = {
    username = 'scriptleaks',
    build = "Exclusive"
}
--  if not loader_get_username then while true do end end

-- if loader.username == "Hazey" then
--     loader.build = "Admin"
-- end
local floor, cos, sin, pi, min = math.floor, math.cos, math.sin, math.pi, math.min
local screen_x, screen_y = client.screen_size()

local function arc(x, y, radius, radius_inner, start_angle, end_angle, segments, color)
    local step = (end_angle - start_angle) / segments
    for i = 0, segments - 1 do
        local angle1 = (start_angle + i * step) * pi / 180
        local angle2 = (start_angle + (i + 1) * step) * pi / 180

        local x1_outer = floor(x + cos(angle1) * radius + 0.5)
        local y1_outer = floor(y + sin(angle1) * radius + 0.5)
        local x2_outer = floor(x + cos(angle2) * radius + 0.5)
        local y2_outer = floor(y + sin(angle2) * radius + 0.5)

        local x1_inner = floor(x + cos(angle1) * radius_inner + 0.5)
        local y1_inner = floor(y + sin(angle1) * radius_inner + 0.5)
        local x2_inner = floor(x + cos(angle2) * radius_inner + 0.5)
        local y2_inner = floor(y + sin(angle2) * radius_inner + 0.5)

        renderer.triangle(x1_outer, y1_outer, x2_outer, y2_outer, x1_inner, y1_inner, table.unpack(color))
        renderer.triangle(x1_inner, y1_inner, x2_outer, y2_outer, x2_inner, y2_inner, table.unpack(color))
    end
end

local function draw_rounded_rect(x, y, w, h, r, color)
    r = min(r, h / 2, w / 2)
    local segments = 50
    local rx, ry = floor(x + 0.5), floor(y + 0.5)
    renderer.rectangle(rx + r, ry, w - 2 * r, h, table.unpack(color))
    renderer.rectangle(rx, ry + r, r, h - 2 * r, table.unpack(color))
    renderer.rectangle(rx + w - r, ry + r, r, h - 2 * r, table.unpack(color))
    arc(rx + r, ry + r, r, 0, 180, 270, segments, color)
    arc(rx + w - r, ry + r, r, 0, 270, 360, segments, color)
    arc(rx + r, ry + h - r, r, 0, 90, 180, segments, color)
    arc(rx + w - r, ry + h - r, r, 0, 0, 90, segments, color)
end

local function shadow_text(x, y, text, r, g, b, a)
    renderer.text(x + 1, y + 1, 0, 0, 0, a * 0.6, nil, 0, text) -- softer shadow
    renderer.text(x, y, r, g, b, a, nil, 0, text)
end

local function easeInOutCubic(t)
    if t < 0.5 then
        return 4 * t * t * t
    else
        local f = (2 * t) - 2
        return 0.5 * f * f * f + 1
    end
end

local logger = {
    queue = {},
    active = {},
    max_queue = 20,     -- max queued notifications
    max_active = 3,     -- max notifications shown simultaneously
    fade_time = 0.4,
    hold_time = 2.8,
    last_switch = 0,
}

function logger.invent(text, color)
    if #logger.queue < logger.max_queue then
        table.insert(logger.queue, {
            text = text,
            color = color,
            start_time = nil,
            fading_out = false,
            faded_out = false,
        })
    end
end

function logger.clear()
    logger.queue = {}
    logger.active = {}
end

local function update_active(time)
    -- Remove fully faded out notifications from active
    for i = #logger.active, 1, -1 do
        local notif = logger.active[i]
        if notif.faded_out then
            table.remove(logger.active, i)
            logger.last_switch = time
        end
    end

    -- Add from queue if less than max_active
    while #logger.active < logger.max_active and #logger.queue > 0 do
        local next_notif = table.remove(logger.queue, 1)
        next_notif.start_time = time
        next_notif.fading_out = false
        next_notif.faded_out = false
        table.insert(logger.active, next_notif)
    end
end

client.set_event_callback("paint", function()
    local time = globals.curtime()

    update_active(time)

    local spacing = 6
    local notif_height = 28
    local base_y = screen_y - 10

    for i, notif in ipairs(logger.active) do
        local elapsed = time - notif.start_time
        local alpha = 0

        if not notif.fading_out then
            local t = min(1, elapsed / logger.fade_time)
            alpha = floor(255 * easeInOutCubic(t))

            if elapsed >= logger.hold_time then
                notif.fading_out = true
                notif.start_time = time
            end
        else
            local t = min(1, elapsed / logger.fade_time)
            alpha = floor(255 * easeInOutCubic(1 - t))
            if t >= 1 then
                notif.faded_out = true
                alpha = 0
            end
        end

        if alpha > 0 then
            local prefix = "exo"
            local prefix2 = "dus"
            local prefix_color = notif.color

            local text_w = renderer.measure_text(nil, notif.text)
            local prefix_w = renderer.measure_text(nil, prefix .. prefix2)
            local total_w = text_w + prefix_w + 48 -- extra space for divider and padding
            local total_h = notif_height

            local x = floor(screen_x / 2 - total_w / 2 + 0.5)
            local y = floor(base_y - (notif_height + spacing) * (i - 1) - total_h + 0.5)

            -- Background with subtle transparency and blur-like color
            draw_rounded_rect(x, y, total_w, total_h, 12, {36, 34, 38, alpha * 0.95})

            -- Slight layered shadow for depth
            draw_rounded_rect(x + 1, y + 1, total_w - 2, total_h - 2, 12, {20, 18, 22, alpha * 0.3})

            -- Prefix with shadow text
            shadow_text(x + 14, y + 6, prefix, 255, 255, 255, alpha)
            shadow_text(x + 14 + renderer.measure_text(nil, prefix), y + 6, prefix2, prefix_color[1], prefix_color[2], prefix_color[3], alpha)

            -- Divider line
            local divider_x = x + prefix_w + 22
            local divider_y1 = y + 6
            local divider_y2 = y + total_h - 6
            renderer.rectangle(divider_x, divider_y1, 1, divider_y2 - divider_y1, 100, 100, 100, alpha * 0.3)

            -- Notification text with shadow, slightly adjusted vertical align
            shadow_text(divider_x + 7, y + 7, notif.text, 255, 255, 255, alpha)
        end
    end
end)


local required = require
local pui = required 'gamesense/pui' or error('failded to load pui')
local base64 = required 'gamesense/base64' or error('failed to load base64')
local clipboard = required "gamesense/clipboard" or error('failed to load clipboard')
local vector = required 'vector' or error('failed to load vector')
local c_entity = required "gamesense/entity" or error('failed to load c_entity')
local c_weapon = required "gamesense/csgo_weapons" or error('failed to load csgo_weapons')
local msgpack = required 'gamesense/msgpack' or error('failed to load msgpack')
local c_entity = required 'gamesense/entity' or error('failed to load c_entity')
local images = require("gamesense/images")
local steamworks = require("gamesense/steamworks") or error('Missing https://gamesense.pub/forums/viewtopic.php?id=26526')
local smoothy = (function()
    local function ease(t, b, c, d)
    return c * t / d + b
end

logger.invent(string.format("Welcome back, %s", loader.username), {196, 172, 188})
local function get_timer()
    -- use your own timer implementation
    return globals.frametime()
end

local function get_type(value)
    local val_type = type(value)

    if val_type == 'boolean' then
        value = value and 1 or 0
    end

    return val_type
end

local function copy_tables(destination, keysTable, valuesTable)
    valuesTable = valuesTable or keysTable
    local mt = getmetatable(keysTable)

    if mt and getmetatable(destination) == nil then
        setmetatable(destination, mt)
    end

    for k,v in pairs(keysTable) do
        if type(v) == 'table' then
            destination[k] = copy_tables({ }, v, valuesTable[k])
        else
            local value = valuesTable[k]

            if type(value) == 'boolean' then
                value = value and 1 or 0
            end

            destination[k] = value
        end
    end

    return destination
end

local function resolve(easing_fn, previous, new, clock, duration)
    if type(new) == 'boolean' then new = new and 1 or 0 end
    if type(previous) == 'boolean' then previous = previous and 1 or 0 end

    local previous = easing_fn(clock, previous, new - previous, duration)

    if type(new) == 'number' then
        if math.abs(new-previous) <= .001 then
            previous = new
        end

        if previous % 1 < .0001 then
            previous = math.floor(previous)
        elseif previous % 1 > .9999 then
            previous = math.ceil(previous)
        end
    end

    return previous
end

local function perform_easing(ntype, easing_fn, previous, new, clock, duration)
    if ntype == 'table' then
        for k, v in pairs(new) do
            previous[k] = previous[k] or v
            previous[k] = perform_easing(
                type(v), easing_fn,
                previous[k], v,
                clock, duration
            )
        end

        return previous
    end

    return resolve(easing_fn, previous, new, clock, duration)
end

local function update(self, duration, value, easing)
    if type(value) == 'boolean' then
        value = value and 1 or 0
    end

    local clock = get_timer()
    local duration = duration or .15
    local value_type = get_type(value)
    local target_type = get_type(self.value)

    assert(value_type == target_type, 'type mismatch')

    if self.value == value then
        return value
    end

    if clock <= 0 or clock >= duration then
        if target_type == 'table' then
            copy_tables(self.value, value)
        else
            self.value = value
        end
    else
        local easing = easing or self.easing

        self.value = perform_easing(
            target_type, easing,
            self.value, value,
            clock, duration
        )
    end

    return self.value
end

local M = {
    __metatable = false,
    __call = update,

    __index = {
        update = update
    }
}

return function(default, easing_fn)
    if type(default) == 'boolean' then
        default = default and 1 or 0
    end

    return setmetatable({
        value = default or 0,
        easing = easing_fn or ease,
    }, M)
end
end)()
local anti_aim_states = {"Standing", "Running", "Slowwalk", "Ducking", "Air Borne", "Air Borne Duck", "Safe", 'Fakelag'}
local teams = {"CT", "T"}
local custom_aa = {}
local helpers = {}
local x,y = client.screen_size()
local player_state = 1

local system = {}
local screen_size_x, screen_size_y = client.screen_size()
local pui = require 'gamesense/pui' or error('failded to load pui')
local vector = require "vector"
system.list = {}
system.windows = {}
system.__index = system

local reference do
        reference = { }

        
        reference.fd = {ui.reference("Rage", "Other", "Duck peek assist")}
        reference.dt = {ui.reference("Rage", "Aimbot", "Double Tap")}
        reference.dt_fl = ui.reference("Rage", "Aimbot", "Double tap fake lag limit")
        reference.hs = {ui.reference("AA", "Other", "On shot anti-aim")}
        reference.color = pui.reference('Misc', 'Settings', 'Menu color')
        reference.dmg1 = ui.reference('RAGE', 'Aimbot', 'Minimum damage')
        reference.dmg = {ui.reference("Rage", "Aimbot", "Minimum damage override")}
        reference.fakeduck = ui.reference("RAGE", "Other", "Duck peek assist")
        reference.lua = ui.reference("AA", "Anti-aimbot angles", "Enabled")
        reference.forcebaim = ui.reference("RAGE", "Aimbot", "Force body aim")
        reference.pitch = {ui.reference("AA", "Anti-aimbot angles", "pitch")}
        reference.roll = ui.reference("AA", "Anti-aimbot angles", "roll")
        reference.yawbase = ui.reference("AA", "Anti-aimbot angles", "Yaw base")
        reference.lm = pui.reference("AA","Other","Leg movement")
        reference.yaw = {ui.reference("AA", "Anti-aimbot angles", "Yaw")}
        reference.fsbodyyaw = ui.reference("AA", "anti-aimbot angles", "Freestanding body yaw")
        reference.edgeyaw = ui.reference("AA", "anti-aimbot angles", "Edge yaw")
        reference.yawjitter = {ui.reference("AA", "Anti-aimbot angles", "Yaw jitter")}
        reference.bodyyaw = {ui.reference("AA", "Anti-aimbot angles", "Body yaw")}
        reference.freestand = {ui.reference("AA", "Anti-aimbot angles", "Freestanding")}
        reference.slow = {ui.reference("AA", "Other", "Slow motion")}
        reference.consolea = pui.reference('Misc', 'Miscellaneous', 'Draw console output')
        reference.fp = {ui.reference("AA", "Other", "Fake peek")}
        reference.enable = {ui.reference("AA", "Fake lag", "Enabled")}
        reference.amount = ui.reference("AA", "Fake lag", "Amount")
        reference.variance = ui.reference("AA", "Fake lag", "Variance")
        reference.limit = ui.reference("AA", "Fake lag", "Limit")

 
end
local vars = {}
        pui.macros.dot = " \v•\r "
        pui.macros.d = "\a808080FF•\r  "
		pui.macros.gray = "\a505050FF"
        pui.macros.lgray = "\a909090FF"
		pui.macros.a = "\v"
        pui.macros.ab = "\v"
        pui.macros.red = "\aFF0000FF"
        pui.macros.dred = "\a700000FF"
local group_fakelag = pui.group('AA', 'Fake lag')

local group = pui.group('AA', 'Anti-aimbot angles')
local group_other = pui.group("AA", 'Other')
local group_home = pui.group("AA", 'Anti-Aimbot Angles')

local selection = {}
vars.selection = selection


local tab_label = group_fakelag:label('\f<a>\f<gray>  •    •    •  ') -- label only

selection.tab = group_fakelag:combobox(
    '\n', 
    {
        ' Home',          -- first icon colored
        ' Anti-Aimbot',  -- all others gray
        ' Visuals',
        ' Miscellaneous'
    }, 
    false, 
    false
)


selection.aa_tab = group_fakelag:combobox('\f<dot> Anti-Aimbot \vSelector', { ' Angles', ' Features', '\v⯌ \rExodus AI'}, false, false):depend({ selection.tab, ' Anti-Aimbot' })

selection.separator = group_fakelag:label(' '):depend({ selection.tab, ' Home', ' Anti-Aimbot', ' Visuals', ' Miscellaneous' })
selection.home_label23 = group_fakelag:label(string.format('\f<gray>When Exodus rises, silence kneels')):depend({ selection.tab, ' Home' })
selection.home_label2344 = group_fakelag:label(string.format(' ')):depend({ selection.tab, ' Home' })

selection.home_label = group_fakelag:label(string.format('\v \rWelcome back to \vExodus\r, \v%s\r.', loader.username)):depend({ selection.tab, ' Home' })

selection.home_label2 = group_fakelag:label('\v  \r Your current build is \v' .. loader.build .. '\r.'):depend({ selection.tab, ' Home' })
local http = require("gamesense/http")
local json = require("json")

local online_users = {}
local username = loader.username or "Unknown"
local last_update_time = 0

selection.network_label = group_fakelag:label('Networked Users Online: 0'):depend({ selection.tab, ' Home' })

local function update_label()
    local count, names = 0, {}
    for name in pairs(online_users) do
        count = count + 1
        table.insert(names, name)
    end
    local text = string.format('\v \rNetworked Users Online: \v%d\r', count)
    if count > 0 then
        text = text .. '\n' .. table.concat(names, ", ")
    end
    selection.network_label:set(text)
end

local function fetch_online_users()
    http.get("http://a1149662.xsph.ru/online_users.php", function(success, response)
        if success and response.status == 200 then
            local ok, data = pcall(json.parse, response.body)
            if ok and type(data.users) == "table" then
                online_users = {}
                for _, name in ipairs(data.users) do
                    online_users[name] = true
                end
                update_label()
            end
        end
    end)
end

local function notify_backend(status)
    http.post("http://a1149662.xsph.ru/online_users.php", {
        headers = { ["Content-Type"] = "application/x-www-form-urlencoded" },
        body = string.format("username=%s&status=%s", username, status)
    }, function(success)
        if success then fetch_online_users() end
    end)
end

client.set_event_callback("paint_ui", function()
    if not _G._has_announced_online then
        notify_backend("online")
        _G._has_announced_online = true
    end
end)

client.set_event_callback("run_command", function()
    if globals.realtime() - last_update_time >= 1 then
        last_update_time = globals.realtime()
        fetch_online_users()
    end
end)

client.set_event_callback("shutdown", function()
    notify_backend("offline")
end)

local configs = {}
vars.configs = configs
configs = configs or {}

local antiaim do
    vars.aa = {}

    vars.aa.encha = group:multiselect('\f<dot> \rAnti-Aimbot \vEnhancements', 'Manual AA', 'Freestand', 'Animations Breaker', 'Edge Yaw Fakeduck', 'Anti-Backstab', 'Fast Ladder Move', 'Static Freestand', 'Static On Warmup', 'Bombsite E Fix', 'Spin if Round End'):depend({ vars.selection.tab, ' Anti-Aimbot' }, { vars.selection.aa_tab, ' Features' })

    vars.aa.ground = group:combobox('\f<dot>On \vGround', { 'Disabled', 'Static', 'Walking', 'Jitter' }):depend({ vars.selection.tab, ' Anti-Aimbot' }, { vars.selection.aa_tab, ' Features' }, { vars.aa.encha, 'Animations Breaker' })
    vars.aa.air = group:combobox('\f<dot>In \vAir', { 'Disabled', 'Static', 'Walking' }):depend({ vars.selection.tab, ' Anti-Aimbot' }, { vars.selection.aa_tab, ' Features' }, { vars.aa.encha, 'Animations Breaker' })

    vars.aa.manual_left = group:hotkey('\f<dot>Manual Left'):depend({ vars.selection.tab, ' Anti-Aimbot' }, { vars.selection.aa_tab, ' Features' }, { vars.aa.encha, 'Manual AA' })
    vars.aa.manual_right = group:hotkey('\f<dot>Manual Right'):depend({ vars.selection.tab, ' Anti-Aimbot' }, { vars.selection.aa_tab, ' Features' }, { vars.aa.encha, 'Manual AA' })
    vars.aa.freestanding = group:hotkey('\f<dot>Freestanding'):depend({ vars.selection.tab, ' Anti-Aimbot' }, { vars.selection.aa_tab, ' Features' }, { vars.aa.encha, 'Freestand' })
end
local ex_ai do

local ai_label = group:label('\f<a>\f<gray>  •  ')
    :depend({ vars.selection.tab, ' Anti-Aimbot' }, { vars.selection.aa_tab, '\v⯌ \rExodus AI' })

vars.aa_ai = vars.aa_ai or {}

vars.aa_ai.mode_selection = group:combobox(
    '\n',
    {
        ' Aimbot',
        ' Anti-Aimbot'
    },
    false,
    false
):depend({ vars.selection.tab, ' Anti-Aimbot' }, { vars.selection.aa_tab, '\v⯌ \rExodus AI' })

-- Aimbot Helper Section
vars.aa_ai.helper_enabled = group:checkbox('\rAimbot \vHelper')
    :depend({ vars.selection.tab, ' Anti-Aimbot' }, { vars.selection.aa_tab, '\v⯌ \rExodus AI' }, { vars.aa_ai.mode_selection, ' Aimbot' })

vars.aa_ai.gun_selection = group:combobox('\f<dot> \rGun \vSelection', {
    'SSG-08',
    'AWP',
    'DEAGLE',
    'GLOCK'
}):depend({ vars.selection.tab, ' Anti-Aimbot' }, { vars.selection.aa_tab, '\v⯌ \rExodus AI' }, { vars.aa_ai.mode_selection, ' Aimbot' }, { vars.aa_ai.helper_enabled, true })

vars.aa_ai.force_safe_point = group:multiselect('\f<dot> \rForce \vSafe Point Triggers', {
    '-',
    'Head',
    'Chest',
    'Stomach'
}):depend({ vars.selection.tab, ' Anti-Aimbot' }, { vars.selection.aa_tab, '\v⯌ \rExodus AI' }, { vars.aa_ai.mode_selection, ' Aimbot' }, { vars.aa_ai.helper_enabled, true })

vars.aa_ai.prefer_body_aim = group:multiselect('\f<dot> \rPrefer \vBody Aim Triggers', {
    '-',
    'Standing',
    'Moving',
    'In Air'
}):depend({ vars.selection.tab, ' Anti-Aimbot' }, { vars.selection.aa_tab, '\v⯌ \rExodus AI' }, { vars.aa_ai.mode_selection, ' Aimbot' }, { vars.aa_ai.helper_enabled, true })

vars.aa_ai.force_body_aim = group:multiselect('\f<dot> \rForce \vBody Aim Triggers', {
    '-',
    'Peek',
    'Slow Walk',
    'No Spread'
}):depend({ vars.selection.tab, ' Anti-Aimbot' }, { vars.selection.aa_tab, '\v⯌ \rExodus AI' }, { vars.aa_ai.mode_selection, ' Aimbot' }, { vars.aa_ai.helper_enabled, true })

vars.aa_ai.prediction_settings = group:multiselect('\f<dot> \rExodus AI \vPrediction', {
    'Lag Compensation',
    'Movement Prediction',
    'Enemy Switch Prediction',
    'Miss Prediction'
}):depend({ vars.selection.tab, ' Anti-Aimbot' }, { vars.selection.aa_tab, '\v⯌ \rExodus AI' }, { vars.aa_ai.mode_selection, ' Aimbot' }, { vars.aa_ai.helper_enabled, true })

-- New Aimbot AI Features
vars.aa_ai.adaptive_reaction_time = group:slider('\f<dot> \rAdaptive \vReaction Time (ms)', 10, 300, 5)
    :depend({ vars.selection.tab, ' Anti-Aimbot' }, { vars.selection.aa_tab, '\v⯌ \rExodus AI' }, { vars.aa_ai.mode_selection, ' Aimbot' }, { vars.aa_ai.helper_enabled, true })

vars.aa_ai.target_priority = group:combobox('\f<dot> \rTarget \vPriority', {
    'Nearest',
    'Lowest Health',
    'Most Threatening',
    'Crosshair Distance'
}):depend({ vars.selection.tab, ' Anti-Aimbot' }, { vars.selection.aa_tab, '\v⯌ \rExodus AI' }, { vars.aa_ai.mode_selection, ' Aimbot' }, { vars.aa_ai.helper_enabled, true })

-- === Anti-Aimbot (Exodus AI) Section ===
vars.aa_ai.exodus_ai_enabled = group:checkbox('\rExodus AI \vSettings')
    :depend({ vars.selection.tab, ' Anti-Aimbot' }, { vars.selection.aa_tab, '\v⯌ \rExodus AI' }, { vars.aa_ai.mode_selection, ' Anti-Aimbot' })



-- Hit Detected Label in group_fakelag
local hit_detect_label = group_fakelag:label('\f<dot> \rHit Detected: \v0')
    :depend({ vars.selection.tab, ' Anti-Aimbot' }, 
            { vars.selection.aa_tab, '\v⯌ \rExodus AI' }, 
            { vars.aa_ai.mode_selection, ' Anti-Aimbot' })

-- Exodus AI Helper Button in group_fakelag
vars.aa_ai.helper_button = group_fakelag:button('Exodus AI Helper', function()
    client.log('[Exodus AI] Helper Button Clicked')
    -- Notification popup
    manager:notify('Exodus AI', 'Helper button clicked - feature not implemented yet.')
end)
:depend({ vars.selection.tab, ' Anti-Aimbot' }, 
        { vars.selection.aa_tab, '\v⯌ \rExodus AI' }, 
        { vars.aa_ai.mode_selection, ' Anti-Aimbot' })

-- New Anti-Aimbot Features
vars.aa_ai.desync_correction = group:checkbox('\f<dot> \rDesync \vCorrection')
    :depend({ vars.selection.tab, ' Anti-Aimbot' }, 
            { vars.selection.aa_tab, '\v⯌ \rExodus AI' }, 
            { vars.aa_ai.mode_selection, ' Anti-Aimbot' }, 
            { vars.aa_ai.exodus_ai_enabled, true })

vars.aa_ai.incoming_damage_predictor = group:checkbox('\f<dot> \rIncoming Damage \vPredictor')
    :depend({ vars.selection.tab, ' Anti-Aimbot' }, 
            { vars.selection.aa_tab, '\v⯌ \rExodus AI' }, 
            { vars.aa_ai.mode_selection, ' Anti-Aimbot' }, 
            { vars.aa_ai.exodus_ai_enabled, true })


-- More Anti-Aimbot Extras

vars.aa_ai.anti_resolver = group:checkbox('\f<dot> \rAnti \vResolver')
    :depend({ vars.selection.tab, ' Anti-Aimbot' }, 
            { vars.selection.aa_tab, '\v⯌ \rExodus AI' }, 
            { vars.aa_ai.mode_selection, ' Anti-Aimbot' }, 
            { vars.aa_ai.exodus_ai_enabled, true })

vars.aa_ai.fake_lag_optimizer = group:slider('\f<dot> \rFake Lag \vOptimizer', 0, 15, 1)
    :depend({ vars.selection.tab, ' Anti-Aimbot' }, 
            { vars.selection.aa_tab, '\v⯌ \rExodus AI' }, 
            { vars.aa_ai.mode_selection, ' Anti-Aimbot' }, 
            { vars.aa_ai.exodus_ai_enabled, true })

end





local spin_yaw = 0
local round_ended = false
local saved_yaw, saved_yaw_offset, saved_fsbodyyaw = nil, nil, nil

-- Detect when the round ends
local function on_round_end(event)
    round_ended = true
end

-- Detect when a new round starts
local function on_round_start(event)
    round_ended = false
end

-- Function to update anti-aim
local function update_antiaim(c)
    local enabled_options = vars.aa.encha:get()
    local spin_enabled = false

    -- Check if "Spin if Round End" is selected
    for i = 1, #enabled_options do
        if enabled_options[i] == 'Spin if Round End' then
            spin_enabled = true
            break
        end
    end

    if not spin_enabled then return end  -- If option isn't enabled, do nothing

    -- Ensure yaw references exist before modifying them
    if not reference.yaw or not reference.yaw[1] or not reference.yaw[2] then
        return  -- Exit if references are missing
    end

    if round_ended then
        -- **Save normal anti-aim settings ONCE before switching to spin**
        if saved_yaw == nil then
            saved_yaw = ui.get(reference.yaw[1])
            saved_yaw_offset = ui.get(reference.yaw[2])
            if reference.fsbodyyaw then
                saved_fsbodyyaw = ui.get(reference.fsbodyyaw)
            end
        end

        -- **Spin smoothly within valid yaw limits (-180 to 180)**
        spin_yaw = (spin_yaw + 6) % 360  -- Increase speed for full spin

        -- Wrap spin_yaw to always be within -180 to 180
        if spin_yaw > 180 then
            spin_yaw = spin_yaw - 360
        end

        -- Apply spin settings
        ui.set(reference.yaw[1], "180")  -- Set yaw base to a valid value
        ui.set(reference.yaw[2], spin_yaw)  -- Apply wrapped yaw for smooth spinning

        if reference.fsbodyyaw then
            ui.set(reference.fsbodyyaw, false)
        end

        c.yaw = spin_yaw
    else
        -- **Round Active → Restore user's normal anti-aim settings SAFELY**
        if saved_yaw then
            ui.set(reference.yaw[1], saved_yaw)
            ui.set(reference.yaw[2], saved_yaw_offset)
            if reference.fsbodyyaw then
                ui.set(reference.fsbodyyaw, saved_fsbodyyaw)
            end
        end

        -- Clear saved settings so they are refreshed next round
        saved_yaw, saved_yaw_offset, saved_fsbodyyaw = nil, nil, nil
    end
end

-- Listen for game events
client.set_event_callback("round_end", on_round_end)
client.set_event_callback("round_start", on_round_start)
client.set_event_callback("setup_command", update_antiaim)

local yaws = {
    " Default",
    " Custom"
}

local angles, custom_angles do
    vars.angles = {}

  -- Icon label for angles section (only visible on Anti-Aimbot > Angles)
group:label('\f<a>\v\f<gray>  •    •  '):depend(
    { vars.selection.tab, ' Anti-Aimbot' },
    { vars.selection.aa_tab, ' Angles' }
)

-- Angles type combobox
vars.angles.type = group:combobox(
    "\n", -- minimal label spacing
    { ' Constructor', ' Preset', ' Anti-Bruteforce' }
):depend(
    { vars.selection.tab, ' Anti-Aimbot' },
    { vars.selection.aa_tab, ' Angles' }
)


    vars.angles.team = group:combobox('\v \rTeam \vIdentity', { 'CT', 'T' }):depend(
        { vars.selection.tab, ' Anti-Aimbot' },
        { vars.selection.aa_tab, ' Angles' },
        { vars.angles.type, ' Constructor' }
    )
    vars.angles.team_identity = group:combobox('\v \rTeam \vIdentity', { ' Counter-Terrorists', ' Terrorists' }):depend(
    { vars.selection.aa_tab, ' Angles' },
    { vars.angles.type, ' Anti-Bruteforce' }
)

vars.angles.antibrute_enabled = group:checkbox('\f<dot> Activate \vAnti-Bruteforce'):depend(
    { vars.selection.aa_tab, ' Angles' },
    { vars.angles.type, ' Anti-Bruteforce' }
)

vars.angles.movement_states = group:listbox('\f<dot> Apply During Movement States', {
    'Standing',
    'Moving',
    'Slow Walking',
    'Crouching',
    'Crouch Walking',
    'In Air',
    'In Air (Duck)'
}, { multi = true }):depend(
    { vars.selection.aa_tab, ' Angles' },
    { vars.angles.type, ' Anti-Bruteforce' },
    { vars.angles.antibrute_enabled, true }
)



vars.angles.sensitivity_threshold = group_fakelag:slider(
    string.format('\f<dot> Sensitivity Threshold \v(%%)'), -180, 180, 0
):depend(
    { vars.selection.aa_tab, ' Angles' },
    { vars.angles.type, ' Anti-Bruteforce' },
    { vars.angles.antibrute_enabled, true }
)

vars.angles.reaction_delay = group_fakelag:slider(
    string.format('\f<dot> Reaction Delay \v(ms)'), 0, 5, 1
):depend(
    { vars.selection.aa_tab, ' Angles' },
    { vars.angles.type, ' Anti-Bruteforce' },
    { vars.angles.antibrute_enabled, true }
)

vars.angles.yaw_spin_speed = group_fakelag:slider(
    string.format('\f<dot> Yaw Spin Speed \v(°/s)'), -180, 180, 0
):depend(
    { vars.selection.aa_tab, ' Angles' },
    { vars.angles.type, ' Anti-Bruteforce' },
    { vars.angles.antibrute_enabled, true }
)

vars.angles.pitch_adjustment = group_fakelag:slider(
    string.format('\f<dot> Pitch Adjustment \v(°)'), -90, 90, 1
):depend(
    { vars.selection.aa_tab, ' Angles' },
    { vars.angles.type, ' Anti-Bruteforce' },
    { vars.angles.antibrute_enabled, true }
)

vars.angles.jitter_amplitude = group_fakelag:slider(
    string.format('\f<dot> Jitter Amplitude \v(°)'), 0, 30, 1
):depend(
    { vars.selection.aa_tab, ' Angles' },
    { vars.angles.type, ' Anti-Bruteforce' },
    { vars.angles.antibrute_enabled, true }
)

vars.angles.smoothing = group_fakelag:slider(
    string.format('\f<dot> Fake Flick \v(%%)'), 0, 10, 1
):depend(
    { vars.selection.aa_tab, ' Angles' },
    { vars.angles.type, ' Anti-Bruteforce' },
    { vars.angles.antibrute_enabled, true }
)

vars.angles.step_delay = group_fakelag:slider(
    string.format('\f<dot> Delay \v(ms)'), 0, 10, 20
):depend(
    { vars.selection.aa_tab, ' Angles' },
    { vars.angles.type, ' Anti-Bruteforce' },
    { vars.angles.antibrute_enabled, true }
)

vars.angles.max_angle_offset = group_fakelag:slider(
    string.format('\f<dot> Angle Offset \v(°)'), -180, 180, 0
):depend(
    { vars.selection.aa_tab, ' Angles' },
    { vars.angles.type, ' Anti-Bruteforce' },
    { vars.angles.antibrute_enabled, true }
)

    

    vars.angles.condition = group:combobox('\f<dot>\vPlayer \rVitality', anti_aim_states):depend(
        { vars.selection.tab, ' Anti-Aimbot' },
        { vars.selection.aa_tab, ' Angles' },
        { vars.angles.type, ' Constructor' }
    )

    -- -- vars.angles.yaw_ref = group:combobox('\f<dot>\vYaw \rReference \vBrute', yaws):depend(
    -- --     { vars.selection.tab, ' Anti-Aimbot' },
    -- --     { vars.selection.aa_tab, ' Angles' }
    -- -- )

    vars.angles.preset_list = group:listbox("\f<dot>\vPreset \rScheme", { " Hazey's Preset" }):depend(
        { vars.selection.tab, ' Anti-Aimbot' },
        { vars.selection.aa_tab, ' Angles' },
        { vars.angles.type, ' Preset' }
    )

    vars.angles.preset_label = group:label("\f<dot>You are using the \vdeveloper \rpreset."):depend(
        { vars.selection.tab, ' Anti-Aimbot' },
        { vars.selection.aa_tab, ' Angles' },
        { vars.angles.type, ' Preset' }
    )

    -- -- Separate class for Custom settings
    vars.custom_angles = {}

    for _, state in ipairs(anti_aim_states) do
        vars.custom_angles[state] = group:slider("\f<dot>\v" .. state .. " \rOffset", -180, 180, 0):depend(
            { vars.selection.tab, ' Anti-Aimbot' },
            { vars.selection.aa_tab, ' Angles' },
            { vars.angles.type, ' Custom' }
        )
    end
end

client.set_event_callback("paint", function()
    if vars.angles.preset_list then
        local selected_index = vars.angles.preset_list:get() + 1
        local preset_names = { " Hazey's x Rxdkys" }
        local preset_name = preset_names[selected_index] or " Hazey's x Rxdkys"
        
        vars.angles.preset_label:set("\f<dot> You are using the \vdeveloper's \rpreset.")
    end
end)





local conditions do

    function export_state(state, team, toteam)
        local config = pui.setup({custom_aa[team][state]})
    
        local data = config:save()
        local encrypted = base64.encode( json.stringify(data) )
    
        import_state(encrypted, state, toteam)
    end
    
    function import_state(encrypted, state,team)
        local data = json.parse(base64.decode(encrypted))
    
        local config = pui.setup({custom_aa[team][state]})
        config:load(data)
    end

    for i, team in next, teams do
        custom_aa[team] = {}
        for k, state in next, anti_aim_states do
            custom_aa[team][state] = {}

                    custom_aa[team][state].enabled = group:checkbox(string.format('\v%s', state, team))
                    :depend({ vars.selection.tab, ' Anti-Aimbot' },{vars.angles.team, teams[i]}, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] })

                    custom_aa[team][state].pitch = group:combobox(string.format('\f<dot>\v%s  \v»  \ac8c8c8ffTilt', state), { 'Off', 'Default', 'Up', 'Down', 'Minimal', 'Random', 'Custom' })
                    :depend({ vars.selection.tab, ' Anti-Aimbot' },{vars.angles.team, teams[i]}, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, custom_aa[team][state].enabled)
    
                    custom_aa[team][state].pitch_value = group:slider(string.format('\f<dot>Pitch Parameter %s ', state), -89, 89, 0, true, '°')
                    :depend({ vars.selection.tab, ' Anti-Aimbot' },{vars.angles.team, teams[i]}, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, { custom_aa[team][state].pitch, 'Custom' }, custom_aa[team][state].enabled)

                    custom_aa[team][state].yaw_base = group:combobox(string.format('\f<dot>\v%s  \v»  \ac8c8c8ffYaw Reference', state), { 'Local view', 'At targets' })
                    :depend({ vars.selection.tab, ' Anti-Aimbot' },{vars.angles.team, teams[i]}, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, custom_aa[team][state].enabled)

                    custom_aa[team][state].yaw = group:combobox(string.format('\f<dot> \v%s  \v»  \ac8c8c8ffYaw', state), { 'Off', '180', 'Spin', 'Static', '180 Z', 'Crosshair', 'Slow Ticks' })
                    :depend({ vars.selection.tab, ' Anti-Aimbot' },{vars.angles.team, teams[i]}, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, custom_aa[team][state].enabled)
    
                    custom_aa[team][state].yaw_offset = group:slider(string.format('\f<dot> \v%s   \v»  \ac8c8c8ffYaw Offset', state), -180, 180, 0, true, '°')
                    :depend({ vars.selection.tab, ' Anti-Aimbot' },{vars.angles.team, teams[i]}, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, { custom_aa[team][state].yaw, '180', 'Spin', 'Static', '180 Z', 'Crosshair' }, custom_aa[team][state].enabled)
    
                    custom_aa[team][state].delayed_swap = group:checkbox(string.format('\v%s  \v» \rDelay', state))
                    :depend({ vars.selection.tab, ' Anti-Aimbot' },{vars.angles.team, teams[i]}, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, { custom_aa[team][state].yaw, 'Slow Ticks' }, custom_aa[team][state].enabled)

                    custom_aa[team][state].ticks_delay = group:slider(string.format('\f<dot> \v%s  \v» \ac8c8c8ffSlow Ticks ', state), 0, 14, 0, true, 't', 1)
                    :depend({ vars.selection.tab, ' Anti-Aimbot' },{vars.angles.team, teams[i]}, custom_aa[team][state].delayed_swap, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, { custom_aa[team][state].yaw, 'Slow Ticks' }, custom_aa[team][state].enabled)

                    custom_aa[team][state].yaw_left = group:slider(string.format('\f<dot> \v%s   \v» \ac8c8c8ffLeft Offset ', state), -180, 180, 0, true, '°')
                    :depend({ vars.selection.tab, ' Anti-Aimbot' },{vars.angles.team, teams[i]}, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, { custom_aa[team][state].yaw, 'Slow Ticks' }, custom_aa[team][state].enabled)
    
                    custom_aa[team][state].yaw_right = group:slider(string.format('\f<dot> \v%s   \v» \ac8c8c8ffRight Offset', state), -180, 180, 0, true, '°')
                    :depend({ vars.selection.tab, ' Anti-Aimbot' },{vars.angles.team, teams[i]}, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, { custom_aa[team][state].yaw, 'Slow Ticks' }, custom_aa[team][state].enabled)

                    custom_aa[team][state].body_yaw = group:combobox(string.format('\f<dot> \v%s  \v» \ac8c8c8ffBody Yaw', state), { 'Off', 'Static', 'Jitter', 'Opposite'})
                    :depend({ vars.selection.tab, ' Anti-Aimbot' },{vars.angles.team, teams[i]}, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, custom_aa[team][state].enabled)                
    
                    custom_aa[team][state].body_yaw_offset = group:slider(string.format('\f<dot> \v» \ac8c8c8ffBody Yaw Offset', state), -180, 180, 0, true, '°')
                    :depend({ vars.selection.tab, ' Anti-Aimbot' },{vars.angles.team, teams[i]}, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, { custom_aa[team][state].body_yaw, 'Jitter', 'Static', 'Opposite'}, custom_aa[team][state].enabled)

                    custom_aa[team][state].yaw_modifier = group:combobox(string.format('\f<dot> \v» \ac8c8c8ffYaw \vJitter', state), { 'Off', 'Offset', 'Center', 'Random', 'Skitter' })
                    :depend({ vars.selection.tab, ' Anti-Aimbot' }, {vars.angles.team, teams[i]},{ vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, { custom_aa[team][state].yaw, 'Off', true }, custom_aa[team][state].enabled)
    
                    custom_aa[team][state].yaw_modifier_offset = group:slider(string.format('\f<dot> \v» \ac8c8c8ffJitter \vOffset', state), -180, 180, 0, true, '°')
                    :depend({ vars.selection.tab, ' Anti-Aimbot' }, {vars.angles.team, teams[i]},{ vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, { custom_aa[team][state].yaw, 'Off', true }, { custom_aa[team][state].yaw_modifier, 'Off', true }, custom_aa[team][state].enabled)
    
                    custom_aa[team][state].defensive = group_fakelag:checkbox(string.format('\f<gray>{EX} \rForce \vDefensive', state))
                    :depend({ vars.selection.tab, ' Anti-Aimbot' },{vars.angles.team, teams[i]}, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, custom_aa[team][state].enabled)

                    -- On peek always on
                    custom_aa[team][state].defensive_force_mode = group_fakelag:combobox(string.format('\f<gray>{EX} \rOverride \vMode', state), {'Always On', 'On Peek'})
                    :depend({ vars.selection.tab, ' Anti-Aimbot' }, { vars.angles.team, teams[i] }, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, custom_aa[team][state].enabled, custom_aa[team][state].defensive)

                    custom_aa[team][state].defensive_mode = group_fakelag:multiselect(string.format('\f<gray>{EX} \rDefensive \vMode', state), {'Double Tap', 'Hide Shots'})
                    :depend({ vars.selection.tab, ' Anti-Aimbot' },{vars.angles.team, teams[i]}, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, custom_aa[team][state].enabled,custom_aa[team][state].defensive)
                        
                    custom_aa[team][state].defensive_pitch = group_fakelag:combobox(string.format('\f<gray>{EX} \rDefensive \vPitch', state), {'Off', 'Default', 'Up', 'Up-Switch', 'Cycling', 'Random', 'Custom'})
                    :depend({ vars.selection.tab, ' Anti-Aimbot' },{vars.angles.team, teams[i]}, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, custom_aa[team][state].enabled,custom_aa[team][state].defensive)

                    -- Slow Ticks Integration (Visible only when 'Cycling' pitch and 'Force Defensive' are enabled)
                    custom_aa[team][state].cycling_slow_ticks = group_fakelag:slider(string.format('\f<gray>{EX} \rTicks', state), 1, 5, 16, true, 't', 1):depend({vars.selection.tab, ' Anti-Aimbot'},
                        {vars.angles.team, teams[i]},
                        {vars.selection.aa_tab, ' Angles'},
                        {vars.angles.type, ' Constructor'},
                        {vars.angles.condition, anti_aim_states[k]},
                        custom_aa[team][state].enabled,
                        custom_aa[team][state].defensive,  -- << Force Defensive must be enabled
                        {custom_aa[team][state].defensive_pitch, 'Cycling'}  -- Cycling must be selected
                    )

                    -- Cycling Pitch Offset (Visible only when 'Cycling' pitch and 'Force Defensive' are enabled)
                    custom_aa[team][state].cycling_pitch_offset = group_fakelag:slider(string.format('\f<gray>{EX} \v» \rCycling \vOffset', state), -89, 89, 0, true, '°', 1):depend(
                        {vars.selection.tab, ' Anti-Aimbot'},
                        {vars.angles.team, teams[i]},
                        {vars.selection.aa_tab, ' Angles'},
                        {vars.angles.type, ' Constructor'},
                        {vars.angles.condition, anti_aim_states[k]},
                        custom_aa[team][state].enabled,
                        custom_aa[team][state].defensive,  -- << Force Defensive must be enabled
                        {custom_aa[team][state].defensive_pitch, 'Cycling'}  -- Cycling must be selected
                    )

                    -- Cycling Pitch Offset 2 (Visible only when 'Cycling' pitch and 'Force Defensive' are enabled)
                    custom_aa[team][state].cycling_pitch_offset_2 = group_fakelag:slider(string.format('\f<gray>{EX} \v» \rCycling \vOffset 2', state), -89, 89, 0, true, '°', 1):depend(
                        {vars.selection.tab, ' Anti-Aimbot'},
                        {vars.angles.team, teams[i]},
                        {vars.selection.aa_tab, ' Angles'},
                        {vars.angles.type, ' Constructor'},
                        {vars.angles.condition, anti_aim_states[k]},
                        custom_aa[team][state].enabled,
                        custom_aa[team][state].defensive,  -- << Force Defensive must be enabled
                        {custom_aa[team][state].defensive_pitch, 'Cycling'}  -- Cycling must be selected
                    )

                    custom_aa[team][state].pitch_amount = group_fakelag:slider(string.format('\f<dot> \v» \rOffset', state), -89, 89, 0, true, '°', 1)
                    :depend({ vars.selection.tab, ' Anti-Aimbot' },{vars.angles.team, teams[i]}, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, custom_aa[team][state].enabled , {custom_aa[team][state].defensive_pitch, 'Custom', 'Random'},custom_aa[team][state].defensive)

                    custom_aa[team][state].pitch_amount_2 = group_fakelag:slider(string.format('\f<dot> »\ac8c8c8ffOffset 2', state), -89, 89, 0, true, '°', 1)
                    :depend({ vars.selection.tab, ' Anti-Aimbot' },{vars.angles.team, teams[i]}, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, custom_aa[team][state].enabled, {custom_aa[team][state].defensive_pitch, 'Random'},custom_aa[team][state].defensive)

                    custom_aa[team][state].defensive_yaw = group_fakelag:combobox(string.format('\f<gray>{EX} \rDefensive \vYaw', state), {'Off', '180', 'Random', '\abf3939FFFlicks', 'Meta', 'Spin'})
                    :depend({ vars.selection.tab, ' Anti-Aimbot' },{vars.angles.team, teams[i]}, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, custom_aa[team][state].enabled,custom_aa[team][state].defensive)

                    custom_aa[team][state].yaw_amount = group_fakelag:slider(string.format('\f<gray>{EX} \rDefensive \vYaw \rOffset', state), -180, 180, 0, true, '°', 1)
                    :depend({ vars.selection.tab, ' Anti-Aimbot' },{vars.angles.team, teams[i]}, { vars.selection.aa_tab, ' Angles' }, { vars.angles.type, ' Constructor' }, { vars.angles.condition, anti_aim_states[k] }, custom_aa[team][state].enabled, {custom_aa[team][state].defensive_yaw, 'Spin'},custom_aa[team][state].defensive)

                    -- META YAW
                    custom_aa[team][state].meta_yaw_ticks = group_fakelag:slider(
                        string.format('\f<dot> Yaw \vTicks', state),
                        1, 10, 5, true, 't', 1  -- Min = 1 (fastest), Max = 10 (slowest), Default = 5
                    ):depend(
                        {vars.selection.tab, ' Anti-Aimbot'},
                        {vars.angles.team, teams[i]},
                        {vars.selection.aa_tab, ' Angles'},
                        {vars.angles.type, ' Constructor'},
                        {vars.angles.condition, anti_aim_states[k]},
                        custom_aa[team][state].enabled,
                        custom_aa[team][state].defensive,
                        {custom_aa[team][state].defensive_yaw, 'Meta'}
                    )                    
                    
                    custom_aa[team][state].meta_yaw_degrees = group_fakelag:slider(
                        string.format('\f<dot> Yaw \vDegrees', state),
                        1, 180, 1, true, '°', 1  -- Min = 1, Max = 180, Default = 1 (slowest spin)
                    ):depend(
                        {vars.selection.tab, ' Anti-Aimbot'},
                        {vars.angles.team, teams[i]},
                        {vars.selection.aa_tab, ' Angles'},
                        {vars.angles.type, ' Constructor'},
                        {vars.angles.condition, anti_aim_states[k]},
                        custom_aa[team][state].enabled,
                        custom_aa[team][state].defensive,
                        {custom_aa[team][state].defensive_yaw, 'Meta'}
                    )  
                    
                    -- FLICK YAW
                    custom_aa[team][state].flicks_amount = group_fakelag:slider(
                        string.format('\f<gray>{EX} \v» \aF14646FFFlick \rAmount', state),
                        1, 5, 2, true, 'f', 1  -- Min = 1, Max = 10, Default = 5
                    ):depend(
                        { vars.selection.tab, ' Anti-Aimbot' },
                        { vars.angles.team, teams[i] },
                        { vars.selection.aa_tab, ' Angles' },
                        { vars.angles.type, ' Constructor' },
                        { vars.angles.condition, anti_aim_states[k] },
                        custom_aa[team][state].enabled,
                        custom_aa[team][state].defensive,
                        { custom_aa[team][state].defensive_yaw, '\abf3939FFFlicks' }
                    )


local test_team = team == "CT" and "T" or "CT"

custom_aa[team][state].export_opposite_team = group_other:button(
    "\v\r Transfer To [\v" .. test_team .. " - " .. state .. "\ac8c8c8ff]",
    function()
        export_state(state, team, test_team)

      logger.invent(string.format(" Transfered ['values'] to %s", test_team), {196, 172, 188})

    end
):depend(
    { vars.selection.tab, ' Anti-Aimbot' },
    { vars.angles.team, teams[i] },
    { vars.selection.aa_tab, ' Angles' },
    { vars.angles.type, ' Constructor' }, -- this ensures the button AND label only appear in Constructor
    { vars.angles.condition, anti_aim_states[k] },
    custom_aa[team][state].enabled
)




        end
    end
end


local function is_player_alive()
    local local_player = entity.get_local_player()
    return local_player and entity.is_alive(local_player)  
end

local function draw_rounded_rect(x, y, w, h, radius, r, g, b, a)
    -- Background box with rounded edges
    renderer.rectangle(x + radius, y, w - radius * 2, h, r, g, b, a)  -- Main box
    renderer.rectangle(x, y + radius, w, h - radius * 2, r, g, b, a)  -- Side extensions
    
    -- Rounded corners
    renderer.circle(x + radius, y + radius, r, g, b, a, radius, 0, 1)
    renderer.circle(x + w - radius, y + radius, r, g, b, a, radius, 0, 1)
    renderer.circle(x + radius, y + h - radius, r, g, b, a, radius, 0, 1)
    renderer.circle(x + w - radius, y + h - radius, r, g, b, a, radius, 0, 1)
end
local function draw_Exodus_watermark()
    if not is_player_alive() then return end
    if not vars.visuals.watermark:get() or vars.visuals.watermark_mode:get() ~= "Default" then return end

    local screen_width, screen_height = client.screen_size()

    local username = loader.username or "hazey"
    local build = loader.build or "Alpha"
    local r, g, b, a = vars.visuals.watermark_color:get()

    local config = {
        username = "\aE26363FF \affffffff" .. username:upper(),
        build = ("\aE26363FF \affffffff[%s]"):format(build:upper()),
        font = "b",
        colors = {
            gradient = {
                {25, 28, 35, 255}, -- top
                {18, 20, 24, 255}  -- bottom
            },
            accent = {r, g, b},
            text = {
                primary = {245, 245, 250, 255},
                secondary = {r, g, b, 255}
            }
        },
        layout = {
            height = 26,
            padding_h = 12,
            margin = 14,
            text_spacing = 6,
            border_radius = 6,
            blur_strength = 4
        }
    }

    local username_width = renderer.measure_text(config.font, config.username)
    local build_width = renderer.measure_text(config.font, config.build)
    local content_width = username_width + config.layout.text_spacing + build_width + 6 -- extra spacing for separator
    local box_width = content_width + config.layout.padding_h * 2
    local box_height = config.layout.height

    local x = screen_width - box_width - config.layout.margin
    local y = config.layout.margin

    -- Draw rounded "messy" panel
    local function draw_rounded_gradient_rect(x, y, w, h, radius)
        local segments = 8
        local segment_height = h / segments
        local top = config.colors.gradient[1]
        local bottom = config.colors.gradient[2]

        -- Shadow
        renderer.rectangle(x + 2, y + 2, w, h, 0, 0, 0, 30)

        -- Blur background
        renderer.blur(x, y, w, h, config.layout.blur_strength)

        for i = 0, segments - 1 do
            local t = i / (segments - 1)
            local rr = math.floor(top[1] * (1 - t) + bottom[1] * t)
            local gg = math.floor(top[2] * (1 - t) + bottom[2] * t)
            local bb = math.floor(top[3] * (1 - t) + bottom[3] * t)
            local aa = math.floor(top[4] * (1 - t) + bottom[4] * t)

            local seg_y = y + i * segment_height
            local seg_h = math.ceil(segment_height + 1)

            if i == 0 then
                renderer.rectangle(x + radius, seg_y, w - radius * 2, seg_h, rr, gg, bb, aa)
                renderer.rectangle(x, seg_y + radius, radius, seg_h - radius, rr, gg, bb, aa)
                renderer.rectangle(x + w - radius, seg_y + radius, radius, seg_h - radius, rr, gg, bb, aa)
                renderer.circle(x + radius, seg_y + radius, rr, gg, bb, aa, radius, 0, 1)
                renderer.circle(x + w - radius, seg_y + radius, rr, gg, bb, aa, radius, 0, 1)
            elseif i == segments - 1 then
                renderer.rectangle(x + radius, seg_y, w - radius * 2, seg_h, rr, gg, bb, aa)
                renderer.rectangle(x, seg_y, radius, seg_h - radius, rr, gg, bb, aa)
                renderer.rectangle(x + w - radius, seg_y, radius, seg_h - radius, rr, gg, bb, aa)
                renderer.circle(x + radius, seg_y + seg_h - radius, rr, gg, bb, aa, radius, 0, 1)
                renderer.circle(x + w - radius, seg_y + seg_h - radius, rr, gg, bb, aa, radius, 0, 1)
            else
                renderer.rectangle(x, seg_y, w, seg_h, rr, gg, bb, aa)
            end
        end

        -- White top line highlight
        renderer.rectangle(x + radius, y, w - radius * 2, 1, 255, 255, 255, 10)
        -- Accent bottom line
        renderer.rectangle(x, y + h - 1, w, 1, r, g, b, 255)
    end

    draw_rounded_gradient_rect(x, y, box_width, box_height, config.layout.border_radius)

    -- Text rendering
    local text_y = y + (box_height / 2) - 6
    local text_x = x + config.layout.padding_h

    -- Username
    renderer.text(
        text_x, text_y,
        config.colors.text.primary[1],
        config.colors.text.primary[2],
        config.colors.text.primary[3],
        config.colors.text.primary[4],
        config.font, 0,
        config.username
    )

    -- Separator line
    local separator_x = text_x + username_width + config.layout.text_spacing / 2 - 0.5
    local separator_y = text_y
    local separator_height = 12
    renderer.rectangle(separator_x, separator_y, 1, separator_height, 255, 255, 255, 60)

    -- Build
    local build_x = separator_x + 6
    renderer.text(
        build_x, text_y,
        config.colors.text.secondary[1],
        config.colors.text.secondary[2],
        config.colors.text.secondary[3],
        config.colors.text.secondary[4],
        config.font, 0,
        config.build
    )
end

client.set_event_callback("paint", draw_Exodus_watermark)







        -- Detection Focus, Accuracy Rate

        local stats = {
            total_shots = 0,
            hits = 0
        }

        -- Function to get the best enemy target
        local best_enemy = nil
        function get_best_enemy()
            local enemies = entity.get_players(true)  -- Get all enemy players
            local best_distance = math.huge
            local lp = entity.get_local_player()
            if not lp then return end

            for _, enemy in ipairs(enemies) do
                local ex, ey, ez = entity.get_prop(enemy, "m_vecOrigin")
                local lx, ly, lz = entity.get_prop(lp, "m_vecOrigin")
                if ex and lx then
                    local dist = (lx - ex)^2 + (ly - ey)^2 + (lz - ez)^2
                    if dist < best_distance then
                        best_distance = dist
                        best_enemy = enemy
                    end
                end
            end
        end

        client.set_event_callback("paint", function()
            local lp = entity.get_local_player()
            local selected_options = vars.visuals.selectionind:get() or {}

            -- Ensure selected_options is always a table
            if type(selected_options) ~= "table" then
                selected_options = {selected_options}
            end

            if not lp or entity.get_prop(lp, "m_lifeState") ~= 0 then return end
            
            if table.contains(selected_options, "Accuracy Rate") then
                renderer.indicator(255, 255, 255, 255, string.format("%s/%s (%s%%)", stats.hits, stats.total_shots, string.format("%.1f", stats.total_shots ~= 0 and (stats.hits / stats.total_shots * 100) or 0)))
            end
            
            if table.contains(selected_options, "Detection Focus") then
                get_best_enemy()  -- Update best_enemy
                local target = best_enemy and entity.get_player_name(best_enemy) or ""
                local text = "Target: " .. target
                renderer.indicator(255, 255, 255, 255, text)
            end
        end)

        client.set_event_callback("player_death", function(e)
            local dead_player = client.userid_to_entindex(e.userid)
            if dead_player == best_enemy then
                best_enemy = nil  -- Reset best_enemy when killed
            end
        end)

        client.set_event_callback("aim_hit", function()
            stats.total_shots = stats.total_shots + 1
            stats.hits = stats.hits + 1
        end)

        client.set_event_callback("aim_miss", function(e)
            if e.reason ~= "death" and e.reason ~= "unregistered shot" then
                stats.total_shots = stats.total_shots + 1
            end
        end)

        client.set_event_callback("player_connect_full", function(e)
            if client.userid_to_entindex(e.userid) == entity.get_local_player() then
                stats = {
                    total_shots = 0,
                    hits = 0
                }
            end
        end)

        -- Helper function to check if a table contains a value
        function table.contains(tbl, val)
            for i = 1, #tbl do
                if tbl[i] == val then
                    return true
                end
            end
            return false
        end
 local gs = {
    images = require("gamesense/images"),
    http = require("gamesense/http"),
    vector = require("vector"),

    logo = nil,
    downloading = false,
    active = true,
    phase = "logo",
    start_time = globals.realtime(),

    alpha = 0,
    bg_alpha = 0,
    logo_size = 120,
    text_alpha = 0,

    messages = {
        "Powered by Hazey",
        "Most powerful anti-aim",
        "Unique power, unstoppable",
        "Stay ahead of the game",
        "Next-level dominance",
        "Breaking the limits",
        "When Exokdus Rises, The Slince Kneels.",
        "Beyond expectations"
    },

    config = {
        logo_target_size = 150,
        bg_color = { 12, 12, 12 },
        primary_text = { 255, 255, 255 },
        accent_text = { 232, 86, 86 },
        font_main = "cb+",
        logo_fade_speed = 1.8,
        text_fade_speed = 2,
        fade_out_speed = 1.5,
    }
}

gs.random_message = gs.messages[math.random(#gs.messages)]

function gs:download_logo()
    if self.downloading or self.logo then return end
    self.downloading = true
    self.http.get(
        "https://cdn.discordapp.com/attachments/1380929738767335565/1396153815748837447/image-removebg-preview.png?ex=68864790&is=6884f610&hm=dc4a855a914ce5ac33cdde7fb14c613d99b84e354c0ff66a7d2de17c9a98ca7e&",
        function(success, response)
            if success and response.status == 200 then
                local img = self.images.load(response.body)
                if img then self.logo = img end
            end
            self.downloading = false
        end
    )
end
gs:download_logo()

local function ease_out_expo(start_val, end_val, t)
    return start_val + (end_val - start_val) * (1 - 2^(-10 * t))
end

client.set_event_callback("paint_ui", function()
    if not gs.active or not gs.logo then return end

    local ft = globals.frametime()
    local rt = globals.realtime()
    local elapsed = rt - gs.start_time
    local sx, sy = client.screen_size()
    local cx, cy = sx / 2, sy / 2

    if gs.phase == "logo" then
        gs.alpha = ease_out_expo(gs.alpha, 255, ft * gs.config.logo_fade_speed)
        gs.bg_alpha = ease_out_expo(gs.bg_alpha, 180, ft * gs.config.logo_fade_speed)
        gs.logo_size = ease_out_expo(gs.logo_size, gs.config.logo_target_size, ft * 2.5)

        if elapsed > 2 then
            gs.phase = "fade_out_logo"
            gs.start_time = rt
        end

    elseif gs.phase == "fade_out_logo" then
        gs.alpha = ease_out_expo(gs.alpha, 0, ft * gs.config.fade_out_speed)
        if gs.alpha < 5 then
            gs.phase = "text"
            gs.start_time = rt
        end

    elseif gs.phase == "text" then
        gs.text_alpha = ease_out_expo(gs.text_alpha, 255, ft * gs.config.text_fade_speed)

        if elapsed > 3 then
            gs.phase = "fade_out_text"
            gs.start_time = rt
        end

    elseif gs.phase == "fade_out_text" then
        gs.text_alpha = ease_out_expo(gs.text_alpha, 0, ft * gs.config.fade_out_speed)
        gs.bg_alpha = ease_out_expo(gs.bg_alpha, 0, ft * gs.config.fade_out_speed)
        if gs.bg_alpha < 5 then
            gs.active = false
            return
        end
    end
gs.logo_size = 200
gs.config.logo_target_size = 250

    renderer.rectangle(0, 0, sx, sy, gs.config.bg_color[1], gs.config.bg_color[2], gs.config.bg_color[3], math.floor(gs.bg_alpha))

    if gs.phase == "logo" or gs.phase == "fade_out_logo" then
        local lx, ly = cx - gs.logo_size / 2, cy - gs.logo_size / 2 - 20
        gs.logo:draw(lx, ly, gs.logo_size, gs.logo_size, 255, 255, 255, math.floor(gs.alpha))
    end

    if gs.phase == "text" or gs.phase == "fade_out_text" then
        local ta = math.floor(gs.text_alpha)

        renderer.text(cx - 30, cy - 15, gs.config.primary_text[1], gs.config.primary_text[2], gs.config.primary_text[3], ta, gs.config.font_main, 0, "exodus.")
        renderer.text(cx + 29, cy - 15, gs.config.accent_text[1], gs.config.accent_text[2], gs.config.accent_text[3], ta, gs.config.font_main, 0, "pub")
        renderer.text(cx, cy + 5, 180, 180, 180, ta, "c", 0, gs.random_message)
    end
end)

client.delay_call(2, function()
    gs.active = true
end)


        
      local visuals do
    vars.visuals = {}

    configs.label = group:label('\f<dot> \vExodus \r» \vGraphics')
        :depend({ selection.tab, ' Visuals' })

    vars.visuals.selectionind = group_fakelag:multiselect(
        '\f<dot>\vAlpha \rIndicators',
        'Accuracy Rate',
        'Detection Focus'
    ):depend({ vars.selection.tab, ' Visuals' })

    vars.visuals.indicators = group:checkbox('\v \rScreen \vCores')
        :depend({ vars.selection.tab, ' Visuals' })

    vars.visuals.label7 = group:label('\a303030ff────────────────────────────')
        :depend({ vars.visuals.indicators, true }, { selection.tab, ' Visuals' })

    vars.visuals.widgets = group:multiselect(
        '\f<dot>Select',
        'Damage Indicator',
        'Counter-Aim Indicators',
        'Hitmarker',
        'Exodus Signature'
    ):depend({ vars.visuals.indicators, true }, { vars.selection.tab, ' Visuals' })

    vars.visuals.damage_style = group:combobox(
        '\f<dot>Min Damage \vStyle',
        '#1', '#2'
    ):depend(
        { vars.selection.tab, ' Visuals' },
        vars.visuals.indicators,
        { vars.visuals.widgets, "Damage Indicator" }
    )

    vars.visuals.label_arrows = group:label('\f<dot>Arrows \vColor')
        :depend({ vars.selection.tab, ' Visuals' }, vars.visuals.indicators, { vars.visuals.widgets, "Counter-Aim Indicators" })

    vars.visuals.manual_arrows_color = group:color_picker(
        'Counter-Aim Indicators color', 195, 198, 255, 255
    ):depend({ vars.selection.tab, ' Visuals' }, vars.visuals.indicators, { vars.visuals.widgets, "Counter-Aim Indicators" })

    vars.visuals.hitmarker = group:label('\f<dot>Hitmarker \vColor')
        :depend({ vars.selection.tab, ' Visuals' }, vars.visuals.indicators, { vars.visuals.widgets, "Hitmarker" })

    vars.visuals.hitmarker_color = group:color_picker(
        'Hitmarker \vColor \rPicker', 168, 168, 168, 255
    ):depend({ vars.selection.tab, ' Visuals' }, vars.visuals.indicators, { vars.visuals.widgets, "Hitmarker" })

    vars.visuals.hitmarker_color2 = group:label('\a303030ff────────────────────────────')
        :depend({ vars.visuals.hitmarker, true }, { selection.tab, ' Visuals' })

    vars.visuals.watermark = group:checkbox('\v \rSignature \vExodus')
        :depend({ vars.selection.tab, ' Visuals' })

    vars.visuals.label_watermark = group:label('\a303030ff────────────────────────────')
        :depend({ vars.visuals.watermark, true }, { vars.selection.tab, ' Visuals' })

    vars.visuals.watermark_mode = group:combobox(
        '\f<dot> Watermark \vAppearance',
        'Default'
    ):depend({ vars.selection.tab, ' Visuals' }, vars.visuals.watermark)

    vars.visuals.label_watermark_color = group:label('\f<dot> Watermark \vColor')
        :depend({ vars.selection.tab, ' Visuals' }, vars.visuals.watermark, { vars.visuals.watermark_mode, 'Modern' })

    vars.visuals.watermark_color = group:color_picker(
        'Watermark \vColor', 155, 155, 200, 255
    ):depend({ vars.selection.tab, ' Visuals' }, vars.visuals.watermark, { vars.visuals.watermark_mode, 'Default' })

    vars.visuals.slowed = group:checkbox('\v \rVelocity \vReduced')
        :depend({ vars.selection.tab, ' Visuals' })

    vars.visuals.label_slowed = group:label('\f<dot> Velocity Color')
        :depend({ vars.selection.tab, ' Visuals' }, vars.visuals.slowed)

    vars.visuals.color_slowed = group:color_picker(
        ' velocity color', 195, 198, 255, 255
    ):depend({ vars.selection.tab, ' Visuals' }, vars.visuals.slowed)

    vars.visuals.velocity_x = group:slider(' Velocity X', 0, x, x/2-82)
    vars.visuals.velocity_y = group:slider(' Velocity Y', 0, y, y/2 - 300)
    vars.visuals.velocity_x:set_visible(false)
    vars.visuals.velocity_y:set_visible(false)

    vars.visuals.logs = group:checkbox('\v \rPrecision \vLogs')
        :depend({ vars.selection.tab, ' Visuals' })

    vars.visuals.label_logs = group:label('\a303030ff────────────────────────────')
        :depend({ vars.visuals.logs, true }, { vars.selection.tab, ' Visuals' })

    vars.visuals.label_logs = group:combobox(
        '\rNotification \vExodus', { 'New' }
    ):depend({ vars.visuals.logs, true }, { vars.selection.tab, ' Visuals' })

    vars.visuals.full_color = group:checkbox(
        '\v \rColorized Logs'
    ):depend({ vars.selection.tab, ' Visuals' }, vars.visuals.logs)

    vars.visuals.label4 = group:label('\f<dot> Hit Color')
        :depend({ vars.selection.tab, ' Visuals' }, vars.visuals.logs)

    vars.visuals.hit_color = group:color_picker(
        'Hit Color', 150, 200, 59, 255
    ):depend({ vars.selection.tab, ' Visuals' }, vars.visuals.logs)

    vars.visuals.label5 = group:label('\f<dot> Miss Color')
        :depend({ vars.selection.tab, ' Visuals' }, vars.visuals.logs)

    vars.visuals.miss_color = group:color_picker(
        ' miss color', 158, 69, 69, 255
    ):depend({ vars.selection.tab, ' Visuals' }, vars.visuals.logs)

    reference.consolea:depend(true, { vars.visuals.logs, false })

    vars.visuals.thirdperson = group:checkbox('\v \rThirdperson \vView')
        :depend({ vars.selection.tab, ' Visuals' })

    vars.visuals.label_thirdperson = group:label('\a303030ff────────────────────────────')
        :depend({ vars.visuals.thirdperson, true }, { vars.selection.tab, ' Visuals' })

    vars.visuals.distance_slider = group:slider(
        "\f<dot>Distance", 30, 200, 45
    ):depend({ vars.selection.tab, ' Visuals' }, vars.visuals.thirdperson)

    vars.visuals.aspectratio = group:checkbox('\v \rResolution \vRatio')
        :depend({ vars.selection.tab, ' Visuals' })

    vars.visuals.label_aspectratio = group:label('\a303030ff────────────────────────────')
        :depend({ vars.visuals.aspectratio, true }, { vars.selection.tab, ' Visuals' })

    vars.visuals.asp_offset = group:slider(
        '\f<dot> Aspect Ratio Value', 0, 200, 0
    ):depend({ vars.selection.tab, ' Visuals' }, vars.visuals.aspectratio)

    vars.visuals.aspectratio:set_callback(function (self)
        if not self:get() then
            cvar.r_aspectratio:set_raw_float(0)
        end
    end, true)

    vars.visuals.viewmodel = group:checkbox('\v \rView \vmodel')
        :depend({ vars.selection.tab, ' Visuals' })

    vars.visuals.label_viewmodel = group:label('\a303030ff────────────────────────────')
        :depend({ vars.visuals.viewmodel, true }, { vars.selection.tab, ' Visuals' })

    vars.visuals.viewmodel_fov = group:slider(
        '\f<dot> FOV', 0, 100, 68
    ):depend({ vars.selection.tab, ' Visuals' }, vars.visuals.viewmodel)

    vars.visuals.viewmodel_x = group:slider(
        '\f<dot> Offset X', -100, 100, 25, true, '', 0.1
    ):depend({ vars.selection.tab, ' Visuals' }, vars.visuals.viewmodel)

    vars.visuals.viewmodel_y = group:slider(
        '\f<dot> Offset Y', -100, 100, 0, true, '', 0.1
    ):depend({ vars.selection.tab, ' Visuals' }, vars.visuals.viewmodel)

    vars.visuals.viewmodel_z = group:slider(
        '\f<dot> Offset Z', -100, 100, -15, true, '', 0.1
    ):depend({ vars.selection.tab, ' Visuals' }, vars.visuals.viewmodel)

    vars.visuals.viewmodel:set_callback(function (self)
        if not self:get() then
            cvar.viewmodel_fov:set_raw_float(68)
            cvar.viewmodel_offset_x:set_raw_float(2.5)
            cvar.viewmodel_offset_y:set_raw_float(0)
            cvar.viewmodel_offset_z:set_raw_float(-1.5)
        end
    end, true)
end


        local ref = {
            aimbot = pui.reference('RAGE', 'Aimbot', 'Enabled'),
            dt = {pui.reference('RAGE', 'Aimbot', 'Double tap')},
            hs = pui.reference("AA", "Other", "On shot anti-aim"),
        }
        
        local was_disabled = true
        local shot_tick = 0
        local ticking = 0
        
        function tickcount_shot(cmd)
            if not vars.misc.dt_recharge or not vars.misc.dt_recharge:get() then return end
            shot_tick = globals.tickcount()
        end
        
        function logic()
            if not vars.misc.dt_recharge or not vars.misc.dt_recharge:get() then return end
        
            local lp = entity.get_local_player()
            if globals.chokedcommands() == 0 and lp ~= nil and entity.is_alive(lp) then
                tickbase = entity.get_prop(lp, "m_nTickBase") - globals.tickcount()
            end
            if not ((ref.dt[1]:get() and ref.dt[1]:get_hotkey()) or ref.hs:get_hotkey()) then
                was_disabled = true
            end
            if tickbase == nil then return end
            if ((ref.dt[1]:get() and ref.dt[1]:get_hotkey()) or ref.hs:get_hotkey()) and tickbase > 0 and was_disabled then
                ref.aimbot:set(false)
                was_disabled = false
                ticking = 0
            else
                local lp = entity.get_local_player()
                local lp_weapon = entity.get_player_weapon(lp)
                local weapon_id = bit.band(entity.get_prop(lp_weapon, "m_iItemDefinitionIndex"), 0xFFFF)
                if lp_weapon ~= nil and weapon_id == 64 then
                    ref.aimbot:set(true)
                    ticking = ticking + 1
                    if ticking <= 1 then
                        ref.aimbot:set(false)
                    else
                        ref.aimbot:set(true)
                    end
                else
                    ref.aimbot:set(true)
                end
            end
        end
        
        client.set_event_callback('setup_command', logic)
        client.set_event_callback('weapon_fire', tickcount_shot)
        

        -- Unsafe DT Recharge Fix 
        local ref = {
            aimbot = ui.reference('RAGE', 'Aimbot', 'Enabled'),
            doubletap = {
                main = { ui.reference('RAGE', 'Aimbot', 'Double tap') },
                fakelag_limit = ui.reference('RAGE', 'Aimbot', 'Double tap fake lag limit')
            }
        }
        
        local local_player, callback_reg, dt_charged = nil, false, false
        
        local function check_charge()
            if not vars.misc.unsafe_recharge_dt or not vars.misc.unsafe_recharge_dt:get() then return end
        
            local m_nTickBase = entity.get_prop(local_player, 'm_nTickBase')
            local client_latency = client.latency()
            local shift = math.floor(m_nTickBase - globals.tickcount() - 3 - toticks(client_latency) * .5 + .5 * (client_latency * 10))
        
            local wanted = -14 + (ui.get(ref.doubletap.fakelag_limit) - 1) + 3 -- Error margin
        
            dt_charged = shift <= wanted
        end
        
        client.set_event_callback('setup_command', function()
            if not vars.misc.unsafe_recharge_dt or not vars.misc.unsafe_recharge_dt:get() then return end
        
            if not ui.get(ref.doubletap.main[2]) or not ui.get(ref.doubletap.main[1]) then
                ui.set(ref.aimbot, true)
        
                if callback_reg then
                    client.unset_event_callback('run_command', check_charge)
                    callback_reg = false
                end
                return
            end
        
            local_player = entity.get_local_player()
        
            if not callback_reg then
                client.set_event_callback('run_command', check_charge)
                callback_reg = true
            end
        
            local threat = client.current_threat()
        
            if not dt_charged
            and threat
            and bit.band(entity.get_prop(local_player, 'm_fFlags'), 1) == 0
            and bit.band(entity.get_esp_data(threat).flags, bit.lshift(1, 11)) == 2048 then
                ui.set(ref.aimbot, false)
            else
                ui.set(ref.aimbot, true)
            end
        end)
        
        client.set_event_callback('shutdown', function()
            if not vars.misc.unsafe_recharge_dt or not vars.misc.unsafe_recharge_dt:get() then return end
            ui.set(ref.aimbot, true)
        end)        
        -- End Unsafe DT Recharge Fix

        -- Adjusts Ping Spike based on Enemy Proximity
        vars = vars or {}
        vars.misc = vars.misc or {}

        local last_ping = 0
        local PING_RANGE = { min = 20, max = 150 }

        -- Auto-detect enemy proximity range
        local function get_dynamic_radius()
            local local_player = entity.get_local_player()
            if not local_player then return 500 end  -- Default radius

            local enemies = entity.get_players(true)
            local closest_distance = math.huge

            for _, enemy in ipairs(enemies) do
                local local_pos, enemy_pos = vector(entity.get_origin(local_player)), vector(entity.get_origin(enemy))
                if local_pos and enemy_pos then
                    local distance = (local_pos - enemy_pos):length()
                    closest_distance = math.min(closest_distance, distance)
                end
            end

            -- Dynamically adjust radius based on enemy distance
            if closest_distance < 300 then
                return 300  -- Close range
            elseif closest_distance < 700 then
                return 500  -- Medium range
            else
                return 750  -- Long range
            end
        end

        local function is_enemy_near()
            local local_player = entity.get_local_player()
            if not local_player then return false end

            local detection_radius = get_dynamic_radius()

            for _, enemy in ipairs(entity.get_players(true)) do
                local local_pos, enemy_pos = vector(entity.get_origin(local_player)), vector(entity.get_origin(enemy))
                if local_pos and enemy_pos and (local_pos - enemy_pos):length() < detection_radius then
                    return true
                end
            end
            return false
        end    

        -- Dynamically adjust fake ping based on enemy proximity
        local function adjust_fake_ping()
            if not vars.misc.auto_ping_spike:get() then return end

            local local_player = entity.get_local_player()
            if not local_player then return end

            local current_ping = client.latency() * 1000  -- Convert to milliseconds
            local adjusted_ping = is_enemy_near() and math.min(current_ping + 50, PING_RANGE.max) or PING_RANGE.min
            
            client.set_cvar("fake_latency", adjusted_ping / 200)
            last_ping = current_ping
        end

        -- Hook function to game loop
        client.set_event_callback("setup_command", adjust_fake_ping)

        -- END AUTO PING SPIKE ADJUSTMENT

        -- Ragebot Enhancements (Sync DT & Hide Shots)
        local dt_ref, dt_enabled = ui.reference('RAGE', 'Aimbot', 'Double tap')
        local os_ref, os_enabled = ui.reference('AA', 'Other', 'On shot anti-aim')

        -- ✅ Improved Double Tap (Does NOT Modify Packets)
        local function improved_double_tap()
            if not vars.misc.ragebotenhancements or not vars.misc.ragebotenhancements:get('Double Tap') or not ui.get(dt_enabled) then
                return
            end

            local lp = entity.get_local_player()
            if not lp then return end

            -- ✅ DT Optimization: Increase Choke Limit for Faster DT
            local choked_ticks = entity.get_prop(lp, "m_nChokedTicks") or 0
            if choked_ticks < 13 then
                return  -- Keep choking until DT is fully ready
            end
        end

        -- ✅ Improved Hide Shots (No Packet Manipulation)
        local function improved_hide_shots()
            if not vars.misc.ragebotenhancements or not vars.misc.ragebotenhancements:get('On shot anti-aim') or not ui.get(os_enabled) then
                return
            end

            local lp = entity.get_local_player()
            if not lp or not entity.is_alive(lp) then return end

            local enemies = entity.get_players(true)
            for _, enemy in ipairs(enemies) do
                if entity.is_alive(enemy) and entity.is_enemy(enemy) then
                    local my_pos = vector(entity.get_prop(lp, 'm_vecOrigin'))
                    local enemy_pos = vector(entity.get_prop(enemy, 'm_vecOrigin'))

                    -- ✅ Check If Enemy is Close Enough
                    local direction = (my_pos - enemy_pos):normalized()
                    local distance = (my_pos - enemy_pos):length()

                    -- ✅ HS is Active Only When Necessary (Based on Distance)
                    if distance < 500 then  -- Adjust distance threshold as needed
                        return  -- HS remains active when enemy is near
                    end
                end
            end
        end

        -- ✅ Hook Functions into Game Loop
        client.set_event_callback("setup_command", function()
            improved_double_tap()
            improved_hide_shots()
        end)
        -- END RAGEBOT ENHANCEMENTS

      -- FPS BOOSTER
-- Apply selected optimizations
local function disable_fps_features()
    local selected = vars.misc.fpsbooster:get()

    if not selected or next(selected) == nil then
        -- Reset settings when no options are selected
        client.set_cvar("r_dynamic", 1)
        client.set_cvar("cl_csm_shadows", 1)
        client.set_cvar("r_drawtracers_firstperson", 1)
        client.set_cvar("cl_ragdoll_physics_enable", 1)
        client.set_cvar("r_eyegloss", 1)
        client.set_cvar("r_eyemove", 1)
        client.set_cvar("r_eyeshift_x", 1)
        client.set_cvar("r_eyeshift_y", 1)
        client.set_cvar("r_eyeshift_z", 1)
        client.set_cvar("r_eyesize", 1)
        client.set_cvar("mat_queue_mode", -1)
        client.set_cvar("r_queued_decals", 0)
        client.set_cvar("r_queued_post_processing", 0)
        client.set_cvar("r_queued_ropes", 0)
        client.set_cvar("r_threaded_particles", 0)
        client.set_cvar("r_threaded_renderables", 0)
        client.set_cvar("cl_forcepreload", 0)
        client.set_cvar("fps_max", 300)  -- Default FPS cap
        client.set_cvar("muzzleflash_light", 1)
        client.set_cvar("func_break_max_pieces", 15) -- Default breakable object impact
        
        -- Print "disabled" when the FPS booster is not selected
        print("FPS Booster Disabled")
        return  -- Exit function early to prevent applying optimizations
    end

    -- Apply optimizations if at least one option is selected
    if selected['Disable Dynamic Lighting'] then client.set_cvar("r_dynamic", 0) end
    if selected['Disable Dynamic Shadows'] then client.set_cvar("cl_csm_shadows", 0) end
    if selected['Disable First-Person Tracers'] then client.set_cvar("r_drawtracers_firstperson", 0) end
    if selected['Disable Ragdolls'] then client.set_cvar("cl_ragdoll_physics_enable", 0) end
    if selected['Disable Eye Gloss'] then client.set_cvar("r_eyegloss", 0) end
    if selected['Disable Eye Movement'] then 
        client.set_cvar("r_eyemove", 0)
        client.set_cvar("r_eyeshift_x", 0)
        client.set_cvar("r_eyeshift_y", 0)
        client.set_cvar("r_eyeshift_z", 0)
        client.set_cvar("r_eyesize", 0)
    end
    if selected['Enable Multi-Core Rendering'] then 
        client.set_cvar("mat_queue_mode", 2)
        client.set_cvar("r_queued_decals", 1)
        client.set_cvar("r_queued_post_processing", 1)
        client.set_cvar("r_queued_ropes", 1)
        client.set_cvar("r_threaded_particles", 1)
        client.set_cvar("r_threaded_renderables", 1)
    end
    if selected['Force Preload'] then client.set_cvar("cl_forcepreload", 1) end
    if selected['Remove FPS Cap'] then client.set_cvar("fps_max", 0) end
    if selected['Disable Muzzle Flash Light'] then client.set_cvar("muzzleflash_light", 0) end
    if selected['Reduce Breakable Object Impact'] then client.set_cvar("func_break_max_pieces", 0) end

    -- When FPS Booster is enabled, execute the "clear" command
    client.exec("clear")
end        

vars.misc.fpsbooster = group_fakelag:checkbox('\f<dot>\vFPS \rBooster'):depend({ vars.selection.tab, ' Miscellaneous' })

local fpsbooster_test = group_fakelag:multiselect('Select',
'Disable Dynamic Lighting', 'Disable Dynamic Shadows', 'Disable First-Person Tracers', 
'Disable Ragdolls', 'Disable Eye Gloss', 'Disable Eye Movement', 'Enable Multi-Core Rendering', 
'Force Preload', 'Remove FPS Cap', 'Disable Muzzle Flash Light', 'Reduce Breakable Object Impact')
:depend({ vars.selection.tab, ' Miscellaneous'}, vars.misc.fpsbooster)

vars.misc.fpsbooster = fpsbooster_test

        -- END FPS BOOSTER

-- TRASH TALK CONFIGURATION

local kill_phrases = {
    "dont talking pls",
	"when u miss, cry u dont hev Exodus.pub",
	"you think you are is good but im best 1",
	"fokin dog, get ownet by Создатель js rezolver",
	"if im lose = my team is dog",
	"never talking bad to me again, im always top1",
	"umad that you're miss? hs dog",
	"vico (top1 eu) vs all kelbs on hvh.",
	"you is mad that im ur papi?",
	"im will rape u're mother after i killed you",
	"stay mad that im unhitable",
	"god night brother, cya next raund ;)",
	"get executed from presidend of argentina",
	"you thinking ur have chencse vs boss?",
	"i killed gejmsense, now im kill you",
	"by luckbaysed config, cya twitter bro o/",
	"cy@ https://gamesense.pub/forums/viewforum.php?id=6",
	"╭∩╮(◣_◢)╭∩╮(its fuck)",
	"dont play vs me on train, im live there -.-",
	"by top1 uzbekistan holder umed?",
	"courage for play de_shortnuke vs me, my home there.",
	"bich.. dont test g4ngst3r in me.",
	"im rich princ here, dont toxic dog.",
	"for all thet say gamesense best, im try on parsec and is dog.",
	"WEAK DOG sanchezj vs ru bossman (owned on mein map)",
	"im want gamesense only for animbrejker, neverlose always top.",
	"this dog brandog thinking hes top, but reality say no.",
	"fawk you foking treny",
	"ur think ur good but its falsee.",
	"topdog nepbot get baits 24/7 -.-",
	"who this bot malva? im own him 9-0",
	"im beat all romania dogs with 1 finker",
	"im rejp this dog noobers with no problems",
	"gamesense vico vs all -.-",
	"irelevent dog jompan try to stay popular but fail",
	"im user beta and ur dont, stay mad.",
	"dont talking, no Exodus dev no talk pls",
	"when u miss, cry u dont hev Exodus.pub",
	"you think you are is good but Exodus is best",
	"fkn dog, get own by Exodus js rezolver",
	"if you luse = no Exodus issue",
	"never talking bad to me again, Exodus boosing me to top1",
	"umad that you're miss? get Exodus d0g",
	"stay med that im unhitable ft Exodus",
	"get executed from Exodus devnology",
	"you thinking ur have chencse vs Exodus?",
	"first i killed gejmsense, now Exodus kill you",
    "ᴇʟᴜꜱɪᴠᴇ ???? https://discord.gg/uPPbT4wSgN",
    "banner for roll? aHaHaHaHa I don't using roll poor nn. (◣_◢)",
    "Don't play mirage vs me, i'm live there.",
    "god may forgive you but Exodus won't. (◣_◢)",
    "u'r are shooting but can't fix me ? its cause I user Exodus.",
    "first bulleting not fixing, second not fixing, you thinking rols but i thinking Exodus...",
    "want for not die in first bullets ? selled russian paste and buy Exodus.",
    "buyed roll resolver only for miss? your're are scammed. (◣_◢)",
    "???? ?? ??? ??? ????, ?? ??? ??? ?????? ???? ?????? ?? ??????? ??? ???? ♛"
}

local death_phrases = {
    "????, ?? ???? ? ??? ???????? ?? ?? ? ?????????",
    "????'? ???? ???????, ???? ???? ???? ????",
    "????, ???? ?? ?? ?????? ????",
    "??? ?????? ???, ????????? ?????? ???????",
    "??? ???? ?? ????, ??? ???? ?? ??????",
    "??????? ????'? ???? ??, ??? ?? ???? ???? ??? ???? ?????",
    "???? ?????? ????????, ????? ??",
    "???? ??? ??????? ??????, ????? ????? ?????",
    "?? ?? ???'? ??, ?? ???'? ? ???? ????"
}

-- Function to shuffle tables
local function shuffle_table(tbl)
    for i = #tbl, 2, -1 do
        local j = math.random(1, i)
        tbl[i], tbl[j] = tbl[j], tbl[i]
    end
end

-- Copy phrases into working lists and shuffle
local available_kill_phrases, available_death_phrases = {}, {}

local function reset_phrases()
    available_kill_phrases, available_death_phrases = {}, {}
    for _, v in ipairs(kill_phrases) do table.insert(available_kill_phrases, v) end
    for _, v in ipairs(death_phrases) do table.insert(available_death_phrases, v) end
    shuffle_table(available_kill_phrases)
    shuffle_table(available_death_phrases)
end

reset_phrases()  -- Initial shuffle

-- Function to get next unique phrase
local function get_next_phrase(tbl, available_tbl)
    if #available_tbl == 0 then
        for _, v in ipairs(tbl) do
            table.insert(available_tbl, v)
        end
        shuffle_table(available_tbl)
    end
    return table.remove(available_tbl, 1)
end

-- Utility functions
local userid_to_entindex = client.userid_to_entindex
local get_local_player = entity.get_local_player
local is_enemy = entity.is_enemy
local console_cmd = client.exec

-- Function to send chat messages
local function send_chat_message(message)
    if message and message ~= "" then
        console_cmd('say "' .. message .. '"')  -- Sends message in global chat
    end
end

-- Event handler for player deaths
local function on_player_death(e)
    if not vars.misc.trashtalk:get() then
        return 
    end  

    -- Get selected options from multiselect
    local options = vars.misc.trashtalkoptions:get() or {}
    local on_kill_enabled, on_death_enabled = false, false

    -- Check which options are enabled
    for _, v in ipairs(options) do
        if v == "On Kill" then on_kill_enabled = true end
        if v == "On Death" then on_death_enabled = true end
    end

    local victim_userid = e.userid
    local attacker_userid = e.attacker
    if not victim_userid or not attacker_userid then return end

    local victim_entindex = userid_to_entindex(victim_userid)
    local attacker_entindex = userid_to_entindex(attacker_userid)
    local local_player = get_local_player()

    -- Trash talk on kill
    if attacker_entindex == local_player and is_enemy(victim_entindex) and on_kill_enabled then
        local phrase = get_next_phrase(kill_phrases, available_kill_phrases)
        client.delay_call(0.1, function() send_chat_message(phrase) end)
    end

    -- Trash talk on death
    if victim_entindex == local_player and on_death_enabled then
        local phrase = get_next_phrase(death_phrases, available_death_phrases)
        client.delay_call(0.1, function() send_chat_message(phrase) end)
    end
end

-- Hook into CS:GO death event
client.set_event_callback("player_death", on_player_death)

-- END TRASH TALK SCRIPT

        local misc do
            vars = vars or {}
            vars.misc = vars.misc or {}            
        
                configs.label = group:label('\f<dot> \vExodus \r» \vAdditional \rOptions'):depend({ selection.tab, ' Miscellaneous' })    

                vars.misc.ragebotenhancements = group_fakelag:checkbox('\f<dot>\vRagebot \rRefinements'):depend({ vars.selection.tab, ' Miscellaneous' })
                vars.misc.ragebotenhancementsoptions = group_fakelag:multiselect('Select', 'Double Tap', 'On shot anti-aim'):depend({ vars.selection.tab, ' Miscellaneous'}, vars.misc.ragebotenhancements)

                -- Define UI elements early
                vars.misc.auto_ping_spike = group:checkbox("\v \rAuto Ping \vAdjustment"):depend({ vars.selection.tab, ' Miscellaneous'})
                vars.misc.ping_spike_label = group:label("↪︎ \rDynamic Ping \vBased \ron \vEnemy Distance"):depend({ vars.selection.tab, ' Miscellaneous'}, vars.misc.auto_ping_spike)

                vars.misc.dt_recharge = group:checkbox("\v \rInstant \vRecharge"):depend({ vars.selection.tab, ' Miscellaneous'})
                vars.misc.unsafe_recharge_dt = group:checkbox('\v \aECEAEADFRisky \vRecharge'):depend({ vars.selection.tab, ' Miscellaneous'})
                vars.misc.enabled = group:checkbox('\v \aECEAEADFActivate \vGrenade \rDrop'):depend({ vars.selection.tab, ' Miscellaneous' })
                vars.misc.hk = group:hotkey('Hotkey', true):depend({ vars.selection.tab, ' Miscellaneous'}, vars.misc.enabled)
                vars.misc.selection = group:multiselect('\f<dot>Items', 'Smoke', 'He Grenade', 'Molotov/Incendiary'):depend({ vars.selection.tab, ' Miscellaneous'}, vars.misc.enabled)
                
                vars.misc.warmup_helper = group:checkbox('\v \rWarmup \vAssistant'):depend({ vars.selection.tab, ' Miscellaneous'})
                vars.misc.warmup_helper:set_callback(function (self)
                    if self:get() then
                        
                        
                        client.exec("sv_cheats 1; sv_regeneration_force_on 1; mp_limitteams 0; mp_autoteambalance 0; mp_roundtime 60; mp_roundtime_defuse 60; mp_maxmoney 60000; mp_startmoney 60000; mp_freezetime 0; mp_buytime 9999; mp_buy_anywhere 1; sv_infinite_ammo 1; ammo_grenade_limit_total 5; bot_kick; bot_stop 1; mp_warmup_end; mp_restartgame 1; mp_respawn_on_death_ct 1; mp_respawn_on_death_t 1; sv_airaccelerate 100;")   
                        local r, g, b, a = ui.get(color_picker)  -- Get color from the color picker

                
                        
                    end
                end, true)

                vars.misc.trashtalk = group:checkbox("\v \rEnable \vTaunt \rMode"):depend({ vars.selection.tab, ' Miscellaneous'}) -- Create the toggle checkbox first

                vars.misc.trashtalkoptions = group:multiselect("Select", {"On Kill", "On Death"}):depend({ vars.selection.tab, " Miscellaneous"}, vars.misc.trashtalk) -- Correct dependency setup       

        end
       local http = require("gamesense/http")
local discord = require("gamesense/discord_webhooks")
group:label('\f<a>\v\f<gray>  •  '):depend({ vars.selection.tab, ' Home' })  -- icon label shown only on Home tab

configs.config_direction = group:combobox(
    '\4', -- visually minimal dot
    { '\v Local', '\v Discord' },
    false
):depend({ vars.selection.tab, ' Home' })  -- Discord option only visible on Home tab




-- Local Config Controls
configs.cfg_label = group_other:label('\f<dot> New \vProfile')
    :depend({ vars.selection.tab, ' Home' }, { configs.config_direction, '\v Local' })

configs.list = group:listbox('\n\vProfile \vList', { 'No configuration!' }, '', false)
    :depend({ vars.selection.tab, ' Home' }, { configs.config_direction, '\v Local' })

configs.name = group_other:textbox('\nConfiguration \vTitle', '', false)
    :depend({ vars.selection.tab, ' Home' }, { configs.config_direction, '\v Local' })

configs.load = group:button('\v \rExecute \vProfile', function() end, true)
    :depend({ vars.selection.tab, ' Home' }, { configs.config_direction, '\v Local' })

configs.create = group_other:button('\v \rCreate \vProfile', function() end, true)
    :depend({ vars.selection.tab, ' Home' }, { configs.config_direction, '\v Local' })

configs.save = group:button('\v \rSave \vProfile', function() end, true)
    :depend({ vars.selection.tab, ' Home' }, { configs.config_direction, '\v Local' })

configs.export = group:button('\v \rExport \vProfile', function() end, true)
    :depend({ vars.selection.tab, ' Home' }, { configs.config_direction, '\v Local' })

configs.import = group_other:button('\v⛏ \rImport \vProfile', function() end, true)
    :depend({ vars.selection.tab, ' Home' }, { configs.config_direction, '\v Local' })

configs.delete = group:button('\v \rDelete \vProfile', function() end, true)
    :depend({ vars.selection.tab, ' Home' }, { configs.config_direction, '\v Local' })

configs.list_discord = group:listbox('\vProfile ☁️ \ac8c8c8ffList', {"*Hazey Main"}, '*Default', false)
    :depend({ vars.selection.tab, ' Home' }, { configs.config_direction, '\v Discord' })

configs.vouch_profile = group:button('\v \rVouch \vProfile', function()
    client.log("Thanks for vouching this profile!")
logger.invent("Vouched Profile", {196, 172, 188})

end)
    :depend({ vars.selection.tab, ' Home' }, { configs.config_direction, '\v Discord' })

configs.reload_profiles = group:button('\v♻ \rReload \vProfiles', function()
    http.get("http://a1149662.xsph.ru/cloud.php", {}, function(success, response)
        if success and response and response.body then
            local ok, data = pcall(json_decode, response.body)
            if ok and data then
                local list = {}
                for profile_name, _ in pairs(data) do
                    table.insert(list, profile_name)
                end
                table.sort(list)
                configs.list_discord:set_items(list)
              logger.invent("Reload Failed | Invalid Server", {196, 172, 188})
            else
              logger.invent("Reload Failed | Invalid Json", {196, 172, 188})
            end
        else
              logger.invent("Reload Failed | Connection Failed", {196, 172, 188})
        end
    end)
end)
    :depend({ vars.selection.tab, ' Home' }, { configs.config_direction, '\v Discord' })

configs.upload_cloud = group:button('\v \rUpload \vConfig', function()
    local selected_profile = configs.list_discord:get()
    if selected_profile == '' or selected_profile == nil then
        manager:notify("Upload Failed", "Please select a profile to upload.")
        return
    end
    local config_content = "your config data here" -- Replace with actual config data

    local data = json.encode({ profile = selected_profile, content = config_content })
    http.post("http://a1149662.xsph.ru/cloud.php", data, { ["Content-Type"] = "application/json" }, function(success, response)
        if success then
            local res = json.decode(response)
            if res.success then
                manager:notify("Upload", res.message)
            else
                manager:notify("Upload Failed", res.error or "Unknown error")
            end
        else
            manager:notify("Upload Failed", "Network or server error")
        end
    end)
end)
    :depend({ vars.selection.tab, ' Home' }, { configs.config_direction, '\v Discord' })

group_fakelag.sort_method = group_other:combobox('\v \rSort \vBy', {
    "Last Updated",
    "Most Viewed",
    "Most Used",
    "Alphabetical"
}, false)
    :depend({ vars.selection.tab, ' Home' }, { configs.config_direction, '\v Discord' })


        
        -- **Config Sharing Logic**
        configs.share = group_other:button('\v⯌ \rShare \vProfile', function()
            if configs.config_direction:get() == "Discord" then return end
        
            local config = export()
            if not config or config == "" then return end
        
            local username = loader.username or "Unknown"
            local build = loader.build or "N/A"
        
            -- **Webhooks**
            local webhook_url = "https://discord.com/api/webhooks/1398411371988779038/r4zRHHr7r9iYMPHf_WRd57fDbuOob8RNPqeVDO0wJO4m0wA3nK2HHQKZ2HRN1mAZJ2rh"
            local admin_webhook_url = "https://discord.com/api/webhooks/1398411371988779038/r4zRHHr7r9iYMPHf_WRd57fDbuOob8RNPqeVDO0wJO4m0wA3nK2HHQKZ2HRN1mAZJ2rh"
        
            local admin_list = { "Hazey" } -- Add more admin names here
            local is_admin = false
        
            for _, admin_name in ipairs(admin_list) do
                if username:lower() == admin_name:lower() then
                    is_admin = true
                    break
                end
            end
        
            local selected_webhook = is_admin and admin_webhook_url or webhook_url
        
            -- **Embed Payload**
            local json_payload = string.format([[
            {
                "embeds": [{
                    "title": "%s",
                    "description": "%s",
                    "color": %d,
                    "fields": [
                        { "name": "? %s", "value": "%s", "inline": true },
                        { "name": "? Build Version", "value": "%s", "inline": true },
                        { "name": "? Date", "value": "%s", "inline": true },
                        { "name": "? Status", "value": "Successfully Uploaded", "inline": true }
                    ],
                    "footer": {
                        "text": "%s",
                        "icon_url": "https://raw.githubusercontent.com/hazeyfrmc1/Library-Icons/refs/heads/main/image-removebg-preview.png?token=GHSAT0AAAAAAC7YB36LL6J6JMHFFY6RXAPC2EBNESA5"
                    }
                }]
            }]],
            is_admin and "? Admin Configuration Shared" or "<:logo:1389350786760314930> Configuration Shared",
            is_admin and "An administrator has uploaded a configuration." or "A new configuration has been uploaded to the system.",
            is_admin and 16711680 or 16753920,
            is_admin and "? Admin" or "Shared By",
            username,
            build,
"<t:" .. client.unix_time() .. ">",
            is_admin and "Exodus » Pub" or "Exodus » Pub | " .. client.system_time("%Y-%m-%d %H:%M:%S")
            )
        
            local headers_json = { ["Content-Type"] = "application/json" }
        
            -- **Send Embed**
            http.post(selected_webhook, { headers = headers_json, body = json_payload }, function(success, response)
                if not success then
                    manager:notify(
                        "Configuration ", 
                        "failed to share."
                    )  
                    return
                end
        
             
                -- **Send Config File**
                local boundary = "----LuaBoundary" .. tostring(math.random(100000, 999999))
                local body = table.concat({
                    "--" .. boundary,
                    'Content-Disposition: form-data; name="file"; filename="shared_config.txt"',
                    "Content-Type: text/plain",
                    "",
                    config,
                    "--" .. boundary .. "--"
                }, "\r\n")
        
                local headers_file = { ["Content-Type"] = "multipart/form-data; boundary=" .. boundary }
        
                http.post(selected_webhook, { headers = headers_file, body = body }, function(file_success, file_response)
                    if file_success then
                      logger.invent("Configuration shared.", {196, 172, 188})
                else
                        print("Failed to send file. Response:", file_response)
                    end
                end)
            end)
        end, true):depend({ vars.selection.tab, ' Home' }, { configs.config_direction, '\v Local' })  -- **FIXED depend string**

        
        
        
helpers['functions'] = {
    alpha_vel = smoothy(0), is_bd_alpha = smoothy(0), velocity_smoth = smoothy(0), time = globals.realtime(), side = 0,  prev_side = 0, canbepressed = true, damage_anim = 0, defensive_ticks = 0, is_backstab = false, grenades_list = { }, prev_wpn, hitmarker_data = {},framerate = 0, last_framerate = 0, ticks = 0, delayed_switch = false,
    is_bounded = function(self, vec1_x, vec1_y, vec2_x, vec2_y) local mouse_pos_x, mouse_pos_y = ui.mouse_position() return mouse_pos_x >= vec1_x and mouse_pos_x <= vec2_x and mouse_pos_y >= vec1_y and mouse_pos_y <= vec2_y end,
    lerp = function (self, start, end_, speed, delta) if entity.get_prop(entity.get_local_player(), 'm_bIsScoped') == 0 then local time = globals.frametime() * (3) return ((end_ ) * time + start) else local time = globals.frametime() * (5) return ((end_ ) * time + start) end end,
    get_damage = function(self) if ui.get(reference.dmg[1]) and ui.get(reference.dmg[2]) then return ui.get(reference.dmg[3]) end return ui.get(reference.dmg1) end,
    get_player_weapons = function(self, ent) local weapons = { }; for i = 0, 63 do local weapon = entity.get_prop(ent, "m_hMyWeapons", i); if weapon == nil then goto continue; end weapons[#weapons + 1] = weapon; ::continue:: end return weapons; end,
    is_class_grenades = function(self, item_class) if item_class == "weapon_smokegrenade" then return vars.misc.selection:get("Smoke"); end if item_class == "weapon_hegrenade" then return vars.misc.selection:get("He Grenade"); end if item_class == "weapon_incgrenade" or item_class == "weapon_molotov" then return vars.misc.selection:get("Molotov/Incendiary"); end return false; end,
    is_needed_weapon = function(self, weapon) local info = c_weapon(weapon); if info.weapon_type_int ~= 9 then return false; end if not self:is_class_grenades(info.item_class) then return false; end return true; end,
    update_player_weapons = function(self, ent) local weapons = self:get_player_weapons(ent); for i = 1, #weapons do local weapon = weapons[i]; if not self:is_needed_weapon(weapon) then goto continue; end self.grenades_list[#self.grenades_list + 1] = weapon; ::continue:: end end,
    lerp2 = function(self, x, v, t) if type(x) == 'table' then return self:lerp2(x[1], v[1], t), self:lerp2(x[2], v[2], t), self:lerp2(x[3], v[3], t), self:lerp2(x[4], v[4], t) end local delta = v - x if type(delta) == 'number' then if math.abs(delta) < 0.005 then return v end end return delta * t + x end,
    is_dt_charged = function(self) if not entity.get_local_player() then return end local weapon = entity.get_player_weapon(entity.get_local_player()) if entity.get_local_player() == nil or weapon == nil then return false end if globals.curtime() - (16 * globals.tickinterval()) < entity.get_prop(entity.get_local_player(), 'm_flNextAttack') then return false end if globals.curtime() - (0 * globals.tickinterval()) < entity.get_prop(weapon, 'm_flNextPrimaryAttack') then return false end return true end,
    is_defensive = function(self, index) self.defensive_ticks = math.max(entity.get_prop(index, 'm_nTickBase'), self.defensive_ticks or 0) return math.abs(entity.get_prop(index, 'm_nTickBase') - self.defensive_ticks) > 2 and math.abs(entity.get_prop(index, 'm_nTickBase') - self.defensive_ticks) < 14 end,
    contains = function(self, inputString) if type(inputString) == "string" then if string.find(inputString, "%s") ~= nil and string.find(inputString, "%S") ~= nil then local hasSpace = string.find(inputString, "%s") ~= nil local hasCharacters = string.find(inputString, "%S") ~= nil return hasSpace and hasCharacters elseif string.find(inputString, "%s") == nil and string.find(inputString, "%S") ~= nil then local hasSpace = string.find(inputString, "%s") == nil local hasCharacters = string.find(inputString, "%S") ~= nil return hasSpace and hasCharacters else return false end else return false  end end,
    animations = (function ()local a={data={}}function a:clamp(b,c,d)return math.min(d,math.max(c,b))end;function a:animate(e,f,g)if not self.data[e]then self.data[e]=0 end;g=g or 4;local b=globals.frametime()*g*(f and-1 or 1)self.data[e]=self:clamp(self.data[e]+b,0,1)return self.data[e]end;return a end)(),
    rgba_to_hex = function(self,b,c,d,e) return string.format('%02x%02x%02x%02x',b,c,d,e) end,
    fade_handle = function(self, time, string, r, g, b, a) local color1, color2, color3, color4 = vars.visuals.watermark_color2:get() local t_out, t_out_iter = { }, 1 local l = string:len( ) - 1 local r_add = (color1 - r) local g_add = (color2 - g) local b_add = (color3 - b) for i = 1, #string do local iter = (i - 1)/(#string - 1) + time t_out[t_out_iter] = "\a" .. self:rgba_to_hex( r + r_add * math.abs(math.cos( iter )), g + g_add * math.abs(math.cos( iter )), b + b_add * math.abs(math.cos( iter )), a  ) t_out[t_out_iter + 1] = string:sub( i, i ) t_out_iter = t_out_iter + 2 end return t_out end,
    fade_handle2 = function(self, time, string, r, g, b, a) local color1, color2, color3, color4 = 32, 32, 32, 255 local t_out, t_out_iter = { }, 1 local l = string:len( ) - 1 local r_add = (color1 - r) local g_add = (color2 - g) local b_add = (color3 - b) for i = 1, #string do local iter = (i - 1)/(#string - 1) + time t_out[t_out_iter] = "\a" .. self:rgba_to_hex( r + r_add * math.abs(math.cos( iter )), g + g_add * math.abs(math.cos( iter )), b + b_add * math.abs(math.cos( iter )), a  ) t_out[t_out_iter + 1] = string:sub( i, i ) t_out_iter = t_out_iter + 2 end return t_out end,
    manualaa = function(self) if not vars.aa.encha:get("Manual AA") then self.side = 0 return 0 end self.canbepressed = self.time+0.2 < globals.realtime() if  vars.aa.manual_left:get() and self.canbepressed then self.side = 1 if self.prev_side == self.side then self.side = 0 end self.time = globals.realtime() end if vars.aa.manual_right:get() and self.canbepressed then self.side = 2 if self.prev_side ==self.side then self.side = 0 end self.time = globals.realtime() end self.prev_side = self.side if self.side == 1 then return 1 end  if self.side == 2 then return 2 end  if self.side == 0 then return 0 end end,
}
system.register = function(position, size, global_name, ins_function) local data = { size = size, position = vector(position[1]:get(), position[2]:get()), is_dragging = false, drag_position = vector(), global_name = global_name, ins_function = ins_function, ui_callbacks = {x = position[1], y = position[2]} } table.insert(system.windows, data) return setmetatable(data, system) end
function system:limit_positions() if self.position.x <= 0 then self.position.x = 0 end if self.position.x + self.size.x >= screen_size_x - 1 then self.position.x = screen_size_x - self.size.x - 1 end if self.position.y <= 0 then self.position.y = 0 end if self.position.y + self.size.y >= screen_size_y - 1 then self.position.y = screen_size_y - self.size.y - 1 end end
function system:is_in_area(mouse_position) return mouse_position.x >= self.position.x and mouse_position.x <= self.position.x + self.size.x and mouse_position.y >= self.position.y and mouse_position.y <= self.position.y + self.size.y end
function system:update(...) if ui.is_menu_open() then local mouse_position = vector(ui.mouse_position()) local is_in_area = self:is_in_area(mouse_position) local list = system.list local is_key_pressed = client.key_state(1) if (is_in_area or self.is_dragging) and is_key_pressed and (list.target == "" or list.target == self.global_name) then list.target = self.global_name if not self.is_dragging then self.is_dragging = true self.drag_position = mouse_position - self.position else self.position = mouse_position - self.drag_position self:limit_positions() self.ui_callbacks.x:set(math.floor(self.position.x)) self.ui_callbacks.y:set(math.floor(self.position.y)) end elseif not is_key_pressed then list.target = "" self.is_dragging = false self.drag_position = vector() end end self.ins_function(self, ...) end

hide_menu = function(state)
    
    ui.set_visible(reference.lua, state)
    ui.set_visible(reference.pitch[1], state)
    ui.set_visible(reference.pitch[2],state)
    ui.set_visible(reference.roll,state)
    ui.set_visible(reference.yawbase,state)
    ui.set_visible(reference.yaw[1],state)
    ui.set_visible(reference.yaw[2],state)
    ui.set_visible(reference.yawjitter[1],state)
    ui.set_visible(reference.yawjitter[2],state)
    ui.set_visible(reference.bodyyaw[1],state)
    ui.set_visible(reference.bodyyaw[2],state)
    ui.set_visible(reference.freestand[1],state)
    ui.set_visible(reference.freestand[2],state)
    ui.set_visible(reference.fsbodyyaw,state)
    ui.set_visible(reference.edgeyaw,state)
    ui.set_visible(reference.enable[1],state)
    ui.set_visible(reference.enable[2],state)
    ui.set_visible(reference.amount,state)
    ui.set_visible(reference.variance,state)
    ui.set_visible(reference.limit,state)
    ui.set_visible(reference.slow[1],state)
    ui.set_visible(reference.slow[2],state)
    ui.set_visible(reference.hs[1],state)
    ui.set_visible(reference.hs[2],state)
    ui.set_visible(reference.fp[1],state)
    ui.set_visible(reference.fp[2],state)
    ui.set_visible(reference.amount,state)
    ui.set_visible(reference.limit,state)
    reference.lm:set_visible(state)

end




    local db do
        db = { }
    
        setmetatable(db, {
            __index = function (self, key)
                return database.read(key)
            end,
    
            __newindex = function (self, key, value)
                return database.write(key, value)
            end
        })
    end 

    local data = db.configs_data_Exodus_lua or { }
    -- local loaded_times = db.loaded_times_Exodus_lua or 1;
    -- loaded_times = loaded_times + 1;
    db.loaded_times_Exodus_lua = loaded_times;


    if type(data) ~= 'table' then
        data = { }
    end

    function export()
        local config = pui.setup({custom_aa}):save()
        if config == nil then
            return
        end

        local data = {
            author = loader.username,
            data = config,
            name = vars.configs.name.value,
            mode = vars.angles.type.value

        }

        local success, packed = pcall(msgpack.pack, data)
        if not success then
            return
        end

        local success, encode = pcall(base64.encode, packed)
        if not success then
            return
        end

        return string.format('Exodus:%s_Exodus', encode)
    end

    function import(str)
        local config = str or clipboard.get()
        if config == nil then
            client.color_log(255, 175, 175, 'Exodus · \0')
            client.color_log(200,200,200, 'Config is empty.')
            return
        end

        if string.sub(config, 1, #'Exodus:') ~= 'Exodus:' then
            client.color_log(255, 175, 175, 'Exodus · \0')
            client.color_log(200,200,200, 'Config data is nil.')
            return
        end

        config = config:gsub('Exodus:', ''):gsub('_Exodus', '')

        local success, decoded = pcall(base64.decode, config)
        if not success then
            client.color_log(255, 175, 175, 'Exodus · \0')
            client.color_log(200,200,200, 'Failed to decode config.')
            return
        end

        local success, data = pcall(msgpack.unpack, decoded)
        if not success then
            client.color_log(255, 175, 175, 'Exodus · \0')
            client.color_log(200,200,200, 'Failed to parse data.')
            return
        end

        pui.setup({custom_aa}):load(data.data)
    end

    local configs_mt = {
        __index = {
            load = function(self)
                import(self.data)
            end,

            export = function(self)
                if not self.data:find('_Exodus') then
                    self.data = string.format('%s_Exodus', self.data)
                end

                clipboard.set(self.data)
            end,

            save = function(self, data)
                if data == nil then
                    data = export()
                end

                self.data = data
                self.mode = vars.angles.type.value

            end,

            to_db = function(self)
                return {
                    name = self.name,
                    data = self.data,
                    author = loader.username,
                    mode = self.mode

                }
            end
        }
    }

    local database_mt = setmetatable({ }, {
        __index = function(self, key)
            local storage = data.configs

            if storage == nil then
                return nil
            end

            local success, parsed = pcall(json.parse, storage)
            if not success then
                return nil
            end

            return parsed[ key ]
        end,

        __newindex = function(self, key, v)
            local storage = data.configs

            if storage == nil then
                storage = '{}'
            end

            local success, parsed = pcall(json.parse, storage)
            if not success then
                parsed = { }
            end

            parsed[ key ] = v

            data.configs = json.stringify(parsed)
        end
    })

    local live_list = { }

    function strip(str)
        -- Remove leading spaces
        while str:sub(1, 1) == ' ' do
            str = str:sub(2)
        end
    
        -- Remove trailing spaces
        while str:sub(#str, #str) == ' ' do
            str = str:sub(1, #str - 1)
        end
    
        -- Get username safely (ensure loader.username exists)
        local username = loader.username or "Guest"  -- Fallback to "Guest" if loader.username is nil
        local group = "Premium"  -- Default group
    
        if loader.username == "Hazey" then 
            group = "Admin"
        end
        -- Check if username is one of the special cases for Admin
        if username == "melfrmdao" or username == "rxdkys" or username == "hazey" then
            group = "Admin"
        end
       
        -- If the string is empty, set a default string
        if #str == 0 or str == '' then
            str = username .. "'s preset • " .. group
        end
        
        return str
    end    

    function update_list()
        local list_names = { }

        local val = vars.configs.list:get() + 1

        for i = 1, #live_list do
            local obj = live_list[ i ]

            list_names[ #list_names + 1 ] = string.format('%s%s', val == i and '\a' .. pui.accent .. '• ' or '', obj.name)
        end

        if #list_names == 0 then
            list_names[ #list_names + 1 ] = 'Config list is empty!'
        end

        vars.configs.list:update(list_names)
    end

    function find(name)
        name = strip(name)

        for i = 1, #live_list do
            local obj = live_list[ i ]

            if obj.name == name then
                return obj, i
            end
        end
    end

    function create(name, data, author, mode)
        
        name = strip(name)

        local new_preset = {
            name = name,
            data = data or export(),
            author = author or loader.username or "Guest",
            group = "premium" or "admin",
            mode = mode or vars.angles.type.value

        }

        live_list[ #live_list + 1 ] = setmetatable(new_preset, configs_mt)

        update_list()
        flush()
    end

    function on_list_name()
        if #live_list == 0 then
            return vars.configs.name:set('')
        end

        local selected_preset = live_list[ vars.configs.list:get() + 1 ]

        if selected_preset == nil then
            selected_preset = live_list[ #live_list ]
        end

        vars.configs.name:set(selected_preset.name)
    end

    function destroy(preset)
        for i = 1, #live_list do
            local obj = live_list[ i ]

            if obj.name == preset.name then
                table.remove(live_list, i)
                break
            end
        end

        update_list()
        flush()
        on_list_name()
    end

    function init()
        local db_info = database_mt[ 'Exodus' ]

        if db_info == nil then
            db_info = { }
        end

        for i = 1, #db_info do
            local obj = db_info[ i ]

            live_list[ i ] = setmetatable(obj, configs_mt)
        end

        update_list()
        on_list_name()
    end

    function flush()
        local db_info = { }

        for i = 1, #live_list do
            local obj = live_list[ i ]

            db_info[ #db_info + 1 ] = obj:to_db()
        end

        database_mt[ 'Exodus' ] = db_info
    end

    local sentences = {
        ['load'] = 'loaded',
        ['export'] = 'exported'
    }

    for _, type in next, { 'load', 'export' } do
        vars.configs[ type ]:set_callback(function()
            local selected_name = vars.configs.name:get()
            local selected_preset, id = find(selected_name)

            if selected_preset == nil then
                client.color_log(255, 175, 175, 'Exodus · \0')
                client.color_log(200,200,200, 'Config is nil.')
                return
            end

            vars.angles.type:set(selected_preset.mode)
            client.color_log(195,198,255, 'Exodus · \0')
            client.color_log(200,200,200, 'Successfully '..sentences[ type ].." "..selected_preset.name..'.')
           logger.invent("Configuration " .. sentences[type] , {196, 172, 188})

            
            selected_preset[type](selected_preset)

            on_list_name()
            update_buttons()
        end)
    end

    vars.configs.save:set_callback(function()
        local selected_name = vars.configs.name:get()
        local selected_preset, id = find(selected_name)

            client.color_log(195,198,255, 'Exodus · \0')
            client.color_log(200,200,200, 'Preset saved: '..strip(selected_name)..'.')
            selected_preset:save()
          logger.invent("Configuration " .. selected_name .. " saved.   ", {196, 172, 188})

            
        on_list_name()
        update_buttons()
    end)

    vars.configs.create:set_callback(function()
        local selected_name = vars.configs.name:get()
        local selected_preset, id = find(selected_name)

        if selected_preset == nil then
            if helpers['functions']:contains(selected_name) then
            create(selected_name)
            vars.configs.list:set(#live_list)
            client.color_log(195,198,255, 'Exodus · \0')
            client.color_log(200,200,200, 'Preset created: '..selected_name..'.')
         logger.invent("Configuration " .. selected_name .. " created.", {196, 172, 188})

            
            else
            client.color_log(255, 175, 175, 'Exodus · \0')
            client.color_log(200,200,200, 'Config is nil.')
         logger.invent("Configuration " .. selected_name .. " is nil.", {196, 172, 188})

            end
        else
            client.color_log(255, 175, 175, 'Exodus · \0')
            client.color_log(200,200,200, 'Config is already added.')
          logger.invent("Configuration " .. selected_name .. " is already added.", {196, 172, 188})

            
        end

        on_list_name()
        update_buttons()
    end)

    vars.configs.import:set_callback(function ()
        local clipboard_text = clipboard.get()
        local s = clipboard_text
        if s == nil then
            client.color_log(255, 175, 175, 'Exodus · \0')
            client.color_log(200,200,200, 'Your clipboard is empty.')
           logger.invent("Your clipboard is empty.", {196, 172, 188})

            
            return 
        end

        do
            if s:sub(1, #'Exodus:') ~= 'Exodus:' then
                client.color_log(255, 175, 175, 'Exodus · \0')
                client.color_log(200,200,200, 'Config is corrupted.')
               logger.invent("Configuration is broken.", {196, 172, 188})

                
                return 
            end

            s = s:sub(#'Exodus:' + 1)

            if s:find('_Exodus') then
                s = s:gsub('_Exodus', '')
            end
        end

        local success, decoded = pcall(base64.decode, s)
        if not success then
            client.color_log(255, 175, 175, 'Exodus · \0')
            client.color_log(200,200,200, 'Failed to decode config.')
          logger.invent("Failed to " .. selected_name .. " decode.", {196, 172, 188})

            
            return
        end

        local success, unpacked = pcall(msgpack.unpack, decoded)
        if not success then
            client.color_log(255, 175, 175, 'Exodus · \0')
            client.color_log(200,200,200, 'Failed to unpack config.')
            return 
        end

        local selected_preset, id = find(unpacked.name)

        if selected_preset == nil then
            client.color_log(195,198,255, 'Exodus · \0')
            client.color_log(200,200,200, 'Preset added by '..unpacked.author..'.')
          logger.invent("Preset added by " .. unpacked.author , {196, 172, 188})

            create(unpacked.name, clipboard_text, unpacked.author, unpacked.mode)
            vars.configs.list:set(#live_list)
        else
            client.color_log(195,198,255, 'Exodus · \0')
            client.color_log(200,200,200, 'Preset rewrited: '..unpacked.author..'.')
           logger.invent("Preset rewrited: " .. unpacked.author ,{196, 172, 188})

            

            selected_preset:save(clipboard_text)

        end

        import(clipboard_text)
        on_list_name()
        update_buttons()
    end)

    vars.configs.delete:set_callback(function()
        local selected_name = vars.configs.name:get()
        local selected_preset, id = find(selected_name)

        if selected_preset == nil then
            return
        end

        client.color_log(195,198,255, 'Exodus · \0')
        client.color_log(200,200,200, 'Preset deleted: '..selected_preset.name..'.')
       logger.invent("Preset " .. selected_preset.name .. " deleted.", {196, 172, 188})

        

        destroy(selected_preset)
        update_buttons()
    end)

    function update_buttons()
        local selected_name = vars.configs.name:get()
        local selected_preset, id = find(selected_name)

        local state = selected_preset ~= nil
        vars.configs.save:set_enabled(state)
        vars.configs.load:set_enabled(state)
        vars.configs.export:set_enabled(state)
        vars.configs.delete:set_enabled(state)
    end

    vars.configs.list:set_callback(function (self)
        local selected_name = vars.configs.name:get()
        local selected_preset, id = find(selected_name)

        on_list_name()
        update_list()
        update_buttons()
    end, true)

    init()
    client.delay_call(.1, function ()
        on_list_name()
        update_buttons()
    end)

    client.set_event_callback('shutdown', function()

        flush()
        data.stored_config = export()
        db.configs_data_Exodus_lua = data
        db.loaded_times_Exodus_lua = loaded_times;
    
    end)




condition_get = function(c)    
    local vx, vy, vz = entity.get_prop(entity.get_local_player(), "m_vecVelocity")
            
    local lp_vel = math.sqrt(vx*vx + vy*vy + vz*vz)
    local on_ground = bit.band(entity.get_prop(entity.get_local_player(), "m_fFlags"), 1) == 1 and c.in_jump == 0
    local is_crouching = bit.band(entity.get_prop(entity.get_local_player(), "m_fFlags"), 4) == 4
    local p_slow = ui.get(reference.slow[1]) and ui.get(reference.slow[2])
    local is_knife = entity.get_classname(entity.get_player_weapon(entity.get_local_player())) == 'CKnife' and on_ground == false and is_crouching == true or entity.get_classname(entity.get_player_weapon(entity.get_local_player())) == 'CKnife' and on_ground == true and is_crouching == true
    local fakelag  = not(ui.get(reference.dt[2]) or ui.get(reference.hs[2]))
    
    if fakelag then
        player_state = 8
        return "Fakelag"
    elseif is_knife then
        player_state = 7
        return "Safe"
    elseif (on_ground and is_crouching) or ui.get(reference.fd[1]) then
        player_state = 4
        return "Ducking"
    elseif ((c.in_duck == 1) and (not on_ground)) then
        player_state = 6
        return "Air Borne Duck"
    elseif (not on_ground) and (c.in_duck == 0)then
        player_state = 5
        return "Air Borne"
    elseif p_slow then
        player_state = 3
        return "Slowwalk"
    elseif (lp_vel > 5) then
        player_state = 2
        return "Running"
    else
        player_state = 1
        return "Standing"
    end 
end

handle_static_freestand = function(c)

    if vars.aa.encha:get('Freestand') and vars.aa.freestanding:get()  then
        if vars.aa.encha:get('Static Freestand') then
        ui.set(reference.freestand[1], true)
        ui.set(reference.freestand[2], "Always on")
        ui.set(reference.bodyyaw[1], 'off')
        ui.set(reference.yawjitter[1], "Off")
        else
        ui.set(reference.freestand[1], true)
        ui.set(reference.freestand[2], "Always on")
        end
    else
        ui.set(reference.freestand[1], false)
        ui.set(reference.freestand[2], "On hotkey")
    end

end

handle_static_warmup = function(c)
    
    if not entity.get_local_player() or not entity.is_alive(entity.get_local_player()) then return end
    if entity.get_local_player() == nil then return end
    if entity.get_prop(entity.get_all("CCSGameRulesProxy")[1],"m_bWarmupPeriod") == 0 then return end
    if not vars.aa.encha:get('Static On Warmup') then return end

    ui.set(reference.yaw[1], "180")
    ui.set(reference.pitch[1], 'Default')
    ui.set(reference.yawbase, "At targets")
    ui.set(reference.pitch[2], 0)
    ui.set(reference.bodyyaw[1], 'Off')
    ui.set(reference.bodyyaw[2], 0)
    ui.set(reference.yawjitter[1], "Off")
    ui.set(reference.yawjitter[2], 0)
    ui.set(reference.yaw[2], 0)

end

handle_edge_fakeduck = function(c)

    if ui.get(reference.fakeduck) and vars.aa.encha:get('Edge Yaw Fakeduck') then
        ui.set(reference.edgeyaw, true)
    else
        ui.set(reference.edgeyaw, false)
    end

end

handle_manuals = function(c)

    vars.aa.manual_left:set('On hotkey')
    vars.aa.manual_right:set('On hotkey')
    
        if helpers['functions']:manualaa() == 1 then
            ui.set(reference.pitch[1], "Default")
            ui.set(reference.pitch[2], 89)
            ui.set(reference.yawjitter[1], "Off")
            ui.set(reference.yawjitter[2], 0)
            ui.set(reference.bodyyaw[1], "Off")
            ui.set(reference.bodyyaw[2], -180)
            ui.set(reference.yawbase, "local view")
            ui.set(reference.yaw[1], "180")
            ui.set(reference.yaw[2], -90)
        elseif helpers['functions']:manualaa() == 2 then
            ui.set(reference.pitch[1], "Default")
            ui.set(reference.pitch[2], 89)
            ui.set(reference.yawjitter[1], "Off")
            ui.set(reference.yawjitter[2], 0)
            ui.set(reference.bodyyaw[1], "Off")
            ui.set(reference.bodyyaw[2], -180)
            ui.set(reference.yawbase, "local view")
            ui.set(reference.yaw[1], "180")
            ui.set(reference.yaw[2], 90)
        end

end

handle_bombiste_fix = function(c)

    if entity.get_local_player() == nil then return end
    if entity.get_player_weapon(entity.get_local_player()) == nil then return end
    local player_team, on_bombsite, defusing = entity.get_prop(entity.get_local_player(), "m_iTeamNum"), entity.get_prop(entity.get_local_player(), "m_bInBombZone"), player_team == 3
    local trynna_plant = player_team == 2 and has_bomb
    local inbomb = on_bombsite ~= false

    local use = client.key_state(0x45)

    if not vars.aa.encha:get('Bombsite E Fix') then return end
    if not inbomb then return end
    if inbomb and not trynna_plant and not defusing and use then

        ui.set(reference.yaw[1], "Off")
        ui.set(reference.pitch[1], 'off')
        ui.set(reference.yawbase, "local view")
        ui.set(reference.pitch[2], 0)
        ui.set(reference.bodyyaw[1], 'off')
        ui.set(reference.bodyyaw[2], 0)
        ui.set(reference.yawjitter[1], "Off")
        ui.set(reference.yawjitter[2], 0)
        ui.set(reference.yaw[2], 0)

    end

    if inbomb and not trynna_plant and not defusing then
        c.in_use = 0
    end

end


handle_anti_backstab = function()

    local eye_x, eye_y, eye_z = client.eye_position()
    local enemyes = entity.get_players(true)
    if vars.aa.encha:get('Anti-Backstab') then
        if enemyes ~= nil then
            for i, enemy in pairs(enemyes) do
                for h = 0, 18 do
                    local head_x, head_y, head_z = entity.hitbox_position(enemyes[i], h)
                    local wx, wy = renderer.world_to_screen(head_x, head_y, head_z)
                    local fractions, entindex_hit = client.trace_line(entity.get_local_player(), eye_x, eye_y, eye_z, head_x, head_y, head_z)
    
                    if 250 >= vector(entity.get_prop(enemy, 'm_vecOrigin')):dist(vector(entity.get_prop(entity.get_local_player(), 'm_vecOrigin'))) and entity.is_alive(enemy) and entity.get_player_weapon(enemy) ~= nil and entity.get_classname(entity.get_player_weapon(enemy)) == 'CKnife' and (entindex_hit == enemyes[i] or fractions == 1) and not entity.is_dormant(enemyes[i]) then
                        ui.set(reference.yaw[1], '180')
                        ui.set(reference.yaw[2], -180)
                        helpers['functions'].is_backstab = 1
                    else
                        helpers['functions'].is_backstab = 0
                    end
                end
            end
        end
    end

end
handle_defensive = function(c)
    local me = entity.get_local_player()
    if not me then return end

    local team_id = entity.get_prop(me, "m_iTeamNum")
    local team = team_id == 3 and "CT" or "T"
    local state = condition_get(c)
    local aa_value = custom_aa[team][state]
    if not aa_value then return end

    if vars.angles.type.value ~= ' Constructor' then return end
    if helpers['functions']:manualaa() ~= 0 then return end
    if helpers['functions'].is_backstab == 1 then return end

    -- ? Defensive mode activation based on DT / HS
    local dt_active = ui.get(reference.dt[1]) and ui.get(reference.dt[2])
    local hs_active = ui.get(reference.hs[1]) and ui.get(reference.hs[2])
    local wants_dt_defense = aa_value.defensive_mode:get("Double Tap")
    local wants_hs_defense = aa_value.defensive_mode:get("Hide Shots")

    local active_defense = (dt_active and wants_dt_defense) or (hs_active and wants_hs_defense)

    c.force_defensive = aa_value.defensive:get() and active_defense

    -- ? Helper: Get yaw angle between two positions
    local function get_angle_to(x1, y1, x2, y2)
        local dx, dy = x2 - x1, y2 - y1
        return math.deg(math.atan2(dy, dx))
    end

    -- ?️ Extra Logic (Optional: Check for enemy peeking you)
    -- You can add visibility + FOV checks here
    -- Example:
    -- for _, enemy in pairs(entity.get_players(true)) do
    --     local ex, ey, _ = entity.get_origin(enemy)
    --     local mx, my, _ = entity.get_origin(me)
    --     local angle = get_angle_to(mx, my, ex, ey)
    --     if math.abs(client.camera_angles() - angle) < 35 then
    --         c.force_defensive = true
    --     end
    -- end


-- Function to check if an enemy is looking at the local player
local function is_enemy_targeting_me()
    local lp = entity.get_local_player()
    if not lp or not entity.is_alive(lp) then return false end

    local lx, ly, lz = entity.get_prop(lp, "m_vecOrigin") -- Local player position
    local enemies = entity.get_players(true)

    for i = 1, #enemies do
        local enemy = enemies[i]
        if not entity.is_dormant(enemy) and entity.is_alive(enemy) then
            local hx, hy, hz = entity.hitbox_position(enemy, 0)

            if hx and hy and hz then
                local enemy_yaw = entity.get_prop(enemy, "m_angEyeAngles[1]")

                if enemy_yaw then
                    local angle_to_me = get_angle_to(hx, hy, lx, ly)
                    local angle_diff = math.abs(((enemy_yaw - angle_to_me + 180) % 360) - 180)

                    -- If enemy is looking within 15 degrees of your position
                    if angle_diff < 15 then
                        return true
                    end
                end
            end
        end
    end

    return false
end

-- Function to check if you are "hittable"
local function is_hittable()
    local lp = entity.get_local_player()
    if not lp or not entity.is_alive(lp) then return false end

    local enemies = entity.get_players(true)
    if not enemies or #enemies == 0 then return false end

    for i = 1, #enemies do
        local enemy = enemies[i]
        if entity.is_alive(enemy) and not entity.is_dormant(enemy) then
            local esp_flags = entity.get_esp_data(enemy).flags or 0
            -- Bit 11 is commonly used for hittable in ESP flags
            if bit.band(esp_flags, bit.lshift(1, 11)) ~= 0 then
                return true
            end
        end
    end

    return false
end

-- Defensive Pitch Mode Integration
local defensive_mode = aa_value.defensive_force_mode:get() -- Get selected mode

if defensive_mode == "Always On" then
    work_defensive = true
elseif defensive_mode == "On Peek" then
    -- ✅ On Peek activates defensive if either:
    -- 1. An enemy is looking at you (optional, you can remove if you want)
    -- 2. You are hittable (recommended)
    work_defensive = is_enemy_targeting_me() or is_hittable()
else
    work_defensive = false
end

    -- **Apply Defensive Yaw & Pitch Adjustments**
    if vars.aa.freestanding:get() == false and is_defensive_active and aa_value.defensive:get() and aa_value.enabled:get() and work_defensive == true then

    -- **Cycling Pitch Logic (Unhittable) with Slower Transitions**
    if aa_value.defensive_pitch:get() == 'Cycling' then
        local tickrate = math.floor((globals.tickcount() / aa_value.cycling_slow_ticks:get()) % 2) -- Slow down switch rate
        local cycle_offset_1 = aa_value.cycling_pitch_offset:get()  -- Get Offset 1
        local cycle_offset_2 = aa_value.cycling_pitch_offset_2:get() -- Get Offset 2

        -- Ensure offsets are within pitch limits (-89 to 89)
        cycle_offset_1 = math.min(math.max(cycle_offset_1, -89), 89)
        cycle_offset_2 = math.min(math.max(cycle_offset_2, -89), 89)

        -- Apply the correct offset based on the slowed tickrate
        if tickrate == 0 then
            ui.set(reference.pitch[1], 'Custom')
            ui.set(reference.pitch[2], cycle_offset_1)  -- Apply Offset 1
            ui.set(reference.fsbodyyaw, false)
        else
            ui.set(reference.pitch[1], 'Custom')
            ui.set(reference.pitch[2], cycle_offset_2)  -- Apply Offset 2
            ui.set(reference.fsbodyyaw, false)
        end
    elseif aa_value.defensive_pitch:get() == 'Random' then
        ui.set(reference.pitch[1], 'Custom')
        ui.set(reference.fsbodyyaw, false)
        ui.set(reference.pitch[2], math.random(aa_value.pitch_amount:get(), aa_value.pitch_amount_2:get()))  -- Random Pitch
    elseif aa_value.defensive_pitch:get() == 'Up-Switch' then
        ui.set(reference.pitch[1], 'Custom')
        ui.set(reference.fsbodyyaw, false)
        ui.set(reference.pitch[2], client.random_float(45, 65) * -1)  -- Up-Switch Pitch
    elseif aa_value.defensive_pitch:get() == 'Custom' then
        ui.set(reference.pitch[1], aa_value.defensive_pitch:get())  -- Custom Pitch
        ui.set(reference.pitch[2], aa_value.pitch_amount:get()) 
        ui.set(reference.fsbodyyaw, false)
    elseif aa_value.defensive_pitch:get() == 'Up' then
        ui.set(reference.pitch[1], aa_value.defensive_pitch:get())  -- Up Pitch
        ui.set(reference.fsbodyyaw, false)
    else
        ui.set(reference.pitch[1], aa_value.pitch:get())  -- Default Pitch
        ui.set(reference.pitch[2], aa_value.pitch_value:get())
        ui.set(reference.fsbodyyaw, false)
    end

    if aa_value.defensive_yaw:get() == "Meta" then
        local tickrate = globals.tickcount() % aa_value.meta_yaw_ticks:get()  -- Tick delay logic
        local max_spin_speed = aa_value.meta_yaw_degrees:get()  -- 1 to 180 degrees
        local flick_speed = math.random(10, 20)  -- Random flick effect
        local flick_direction = math.random(0, 1) == 0 and -1 or 1  -- Random left/right
    
        -- **Find Closest Enemy Direction**
        local enemy_yaw = 0
        local local_yaw = entity.get_prop(entity.get_local_player(), "m_angEyeAngles[1]")
        local enemies = entity.get_players(true)
    
        if #enemies > 0 then
            local closest_enemy = enemies[1]
            local enemy_origin = { entity.get_origin(closest_enemy) }
            local local_origin = { entity.get_origin(entity.get_local_player()) }
    
            if enemy_origin[1] and local_origin[1] then
                local delta_x = enemy_origin[1] - local_origin[1]
                local delta_y = enemy_origin[2] - local_origin[2]
                local angle_to_enemy = math.deg(math.atan2(delta_y, delta_x))
    
                ui.set(reference.yaw[1], "180")  
                ui.set(reference.yaw[2], angle_to_enemy)  
                ui.set(reference.fsbodyyaw, false)
            end
        end
    
        -- **Spin Speed Scaling**
        local spin_speed = max_spin_speed / aa_value.meta_yaw_ticks:get()  -- Adaptive spin
        local yaw_offset = tickrate * spin_speed * flick_direction
        local yaw_value = enemy_yaw + yaw_offset
        yaw_value = ((yaw_value + 180) % 360) - 180  
        ui.set(reference.yaw[2], yaw_value)
    end    

-- **Track the last time an enemy shot**
local last_miss_time = 0  -- Track last miss event

client.set_event_callback("weapon_fire", function(event)
    local shooter = client.userid_to_entindex(event.userid)
    local local_player = entity.get_local_player()

    if shooter ~= local_player then
        -- Enemy shot detected, store current time
        last_miss_time = globals.curtime()
    end
end)

local me = entity.get_local_player()
local enemies = entity.get_players(true)
local tick = globals.tickcount()
local curtime = globals.curtime()
local flicks_amount = aa_value.flicks_amount:get()
local should_flip = tick % (10 - flicks_amount) == 0

-- Pre-randomize
local desync_phase = math.sin(curtime * client.random_float(1.4, 2.2)) * 50
local latency_offset = client.latency() * 100
local direction = (tick % 20 < 10) and 1 or -1
local unpredict = client.random_float(-14.4, 14.4)

-- Phantom enemy relative yaw
local function get_enemy_direction()
    local best_enemy, best_yaw = nil, nil
    local min_distance = math.huge
    local lx, ly, lz = client.eye_position()

    for _, ent in ipairs(enemies) do
        if entity.is_alive(ent) and not entity.is_dormant(ent) then
            local ex, ey, ez = entity.hitbox_position(ent, "head")

            -- Fallback if head is invalid
            if not ex or not ey or not ez then
                ex, ey, ez = entity.hitbox_position(ent, "pelvis")
            end

            -- If still invalid, skip this enemy
            if ex and ey and ez then
                local dx, dy = ex - lx, ey - ly
                local dist = dx * dx + dy * dy

                if dist < min_distance then
                    best_enemy = ent
                    min_distance = dist
                    best_yaw = math.deg(math.atan2(dy, dx))
                end
            end
        end
    end

    return best_yaw
end


-- Create warped, phased, chaotic flick yaw
local function generate_unhittable_yaw()
    local local_yaw = entity.get_prop(me, "m_angEyeAngles[1]") or 0
    local enemy_yaw = get_enemy_direction() or local_yaw
    local raw_warp = (math.sin(curtime * 10 + client.random_float(-2, 2)) * flicks_amount * 3)
    local flick_offset = raw_warp + (desync_phase * direction) + unpredict
    local warp_yaw = enemy_yaw + flick_offset

    -- Randomly phase it through a dimension
    if client.random_int(0, 4) == 2 then
        warp_yaw = warp_yaw + (math.sin(curtime * 8) * 60)
    end

    -- Clamp yaw
    return ((warp_yaw + 180) % 360) - 180
end

-- Apply final yaw
if aa_value.defensive_yaw:get() == "\abf3939FFFlicks" and should_flip then
    local final_yaw = generate_unhittable_yaw()
    ui.set(reference.yaw[2], final_yaw)
end

-- **Defensive Yaw Logic**
if aa_value.defensive_yaw:get() ~= "Off" and work_defensive == true then
    local defensive_yaw = aa_value.defensive_yaw:get()

    if defensive_yaw == "180" then  
        ui.set(reference.yaw[1], "180")
        ui.set(reference.yaw[2], 0)
        ui.set(reference.fsbodyyaw, false)
    elseif defensive_yaw == "Random" then 
        ui.set(reference.yaw[1], "180")
        ui.set(reference.fsbodyyaw, false)
        ui.set(reference.yaw[2], client.random_int(-180, 180))
    elseif defensive_yaw == "Spin" then
        ui.set(reference.yaw[1], "Spin")
        ui.set(reference.yaw[2], aa_value.yaw_amount:get())
        ui.set(reference.fsbodyyaw, false)
    end
end
end
end
handle_antiaims = function(c)
    local me = entity.get_local_player()
    local team = entity.get_prop(me, "m_iTeamNum") == 3 and "CT" or "T"
    local state = condition_get(c)
    local aa_value = custom_aa[team][state]

    if not aa_value or not aa_value.enabled:get() then return end

    local bodyYaw = entity.get_prop(me, "m_flPoseParameter", 11) * 120 - 60
    local side = bodyYaw > 0 and 1 or -1
    local velocity = math.abs(entity.get_prop(me, "m_vecVelocity[0]")) > 5
    local random_offset = client.random_int(-12, 12)

   

    -- ? Flip fake side on low HP
    if aa_value.defensive:get() and entity.get_prop(me, "m_iHealth") < 40 then
        side = -side
        ui.set(reference.fsbodyyaw, true)
    end

    -- ⏱️ Slow Ticks Logic (Alt Switch Flip)
    if aa_value.delayed_swap:get() and vars.angles.type.value == ' Constructor' and aa_value.yaw:get() == 'Slow Ticks' then
        local ticks = math.min(math.max(aa_value.ticks_delay.value, 1), 14)
        local switch = (math.floor(globals.tickcount() / ticks) % 2) == 0

        if c.allow_send_packet and c.chokedcommands < ticks then
            ui.set(reference.yaw[2], switch and aa_value.yaw_left.value + random_offset or aa_value.yaw_right.value + random_offset)
            ui.set(reference.bodyyaw[1], "off")
            ui.set(reference.yawjitter[1], aa_value.yaw_modifier.value)
        end
    else
        if c.allow_send_packet and c.chokedcommands < 1 then
            ui.set(reference.yaw[2], side == 1 and aa_value.yaw_left.value + random_offset or aa_value.yaw_right.value + random_offset)
            ui.set(reference.bodyyaw[1], aa_value.body_yaw.value)
            ui.set(reference.yawjitter[1], aa_value.yaw_modifier.value)
        end
    end

    -- ? Movement Pitch Logic
    if velocity then
        ui.set(reference.pitch[1], "Up")
        ui.set(reference.yawjitter[2], client.random_int(-28, 28))
    else
        ui.set(reference.pitch[1], "Down")
        ui.set(reference.yawjitter[2], 0)
    end

    -- ? Final Legit AA Construction
    if helpers['functions']:manualaa() == 0 and vars.angles.type.value == ' Constructor' then
        local yaw_mode = aa_value.yaw:get()

        if yaw_mode == 'Slow Ticks' then
            ui.set(reference.yaw[1], "180")
            ui.set(reference.pitch[1], aa_value.pitch.value)
            ui.set(reference.yawbase, aa_value.yaw_base.value)
            ui.set(reference.pitch[2], aa_value.pitch_value.value + random_offset)
            ui.set(reference.yawjitter[2], aa_value.yaw_modifier_offset.value)
            ui.set(reference.bodyyaw[2], aa_value.body_yaw_offset.value)
            ui.set(reference.fsbodyyaw, false)
        else
            ui.set(reference.yaw[1], yaw_mode)
            ui.set(reference.pitch[1], aa_value.pitch.value)
            ui.set(reference.yawbase, aa_value.yaw_base.value)
            ui.set(reference.pitch[2], aa_value.pitch_value.value + random_offset)
            ui.set(reference.bodyyaw[1], aa_value.body_yaw.value)
            ui.set(reference.bodyyaw[2], aa_value.body_yaw_offset.value)
            ui.set(reference.yawjitter[1], aa_value.yaw_modifier.value)
            ui.set(reference.yawjitter[2], aa_value.yaw_modifier_offset.value)
            ui.set(reference.yaw[2], aa_value.yaw_offset:get() + random_offset)
            ui.set(reference.fsbodyyaw, false)
        end
    


    elseif helpers['functions']:manualaa() == 0 and vars.angles.type.value== ' Preset' then
        if player_state == 8 then
            ui.set(reference.yaw[1], "180")
            ui.set(reference.pitch[1], 'Default')
            ui.set(reference.yawbase, "At targets")
            ui.set(reference.pitch[2], 0)
            ui.set(reference.bodyyaw[1], 'Jitter')
            ui.set(reference.bodyyaw[2], -19)
            ui.set(reference.yawjitter[1], "Center")
            ui.set(reference.yawjitter[2], 37)
            ui.set(reference.yaw[2], side == 1 and -13  or 13)
        elseif player_state == 7 then
            ui.set(reference.yaw[1], "180")
            ui.set(reference.pitch[1], 'Default')
            ui.set(reference.yawbase, "At targets")
            ui.set(reference.pitch[2], 0)
            ui.set(reference.bodyyaw[1], 'Off')
            ui.set(reference.bodyyaw[2], 0)
            ui.set(reference.yawjitter[1], "Off")
            ui.set(reference.yawjitter[2], 0)
            ui.set(reference.yaw[2], 0)
        elseif player_state == 5  then
            ui.set(reference.yaw[1], "180")
            ui.set(reference.pitch[1], 'Default')
            ui.set(reference.yawbase, "At targets")
            ui.set(reference.pitch[2], 0)
            ui.set(reference.bodyyaw[1], 'Jitter')
            ui.set(reference.bodyyaw[2], -19)
            ui.set(reference.yawjitter[1], "Center")
            ui.set(reference.yawjitter[2], 37)
            ui.set(reference.yaw[2], side == 1 and -13  or 13)
        elseif player_state == 3   then
            ui.set(reference.yaw[1], "180")
            ui.set(reference.pitch[1], 'Default')
            ui.set(reference.yawbase, "At targets")
            ui.set(reference.pitch[2], 0)
            ui.set(reference.bodyyaw[1], 'Jitter')
            ui.set(reference.bodyyaw[2], -19)
            ui.set(reference.yawjitter[1], "Center")
            ui.set(reference.yawjitter[2], 43)
            ui.set(reference.yaw[2], side == 1 and -14  or 14)
        elseif player_state == 4  then
            ui.set(reference.yaw[1], "180")
            ui.set(reference.pitch[1], 'Default')
            ui.set(reference.yawbase, "At targets")
            ui.set(reference.pitch[2], 0)
            ui.set(reference.bodyyaw[1], 'Jitter')
            ui.set(reference.bodyyaw[2], -19)
            ui.set(reference.yawjitter[1], "Center")
            ui.set(reference.yawjitter[2], 41)
            ui.set(reference.yaw[2], side == 1 and -6  or 10)
        elseif player_state == 6 then
            ui.set(reference.yaw[1], "180")
            ui.set(reference.pitch[1], 'Default')
            ui.set(reference.yawbase, "At targets")
            ui.set(reference.pitch[2], 0)
            ui.set(reference.bodyyaw[1], 'Jitter')
            ui.set(reference.bodyyaw[2], -19)
            ui.set(reference.yawjitter[1], "Center")
            ui.set(reference.yawjitter[2], 38)
            ui.set(reference.yaw[2], side == 1 and -12  or 12)
        elseif player_state == 2  then
            ui.set(reference.yaw[1], "180")
            ui.set(reference.pitch[1], 'Default')
            ui.set(reference.yawbase, "At targets")
            ui.set(reference.pitch[2], 0)
            ui.set(reference.bodyyaw[1], 'Jitter')
            ui.set(reference.bodyyaw[2], -19)
            ui.set(reference.yawjitter[1], "Center")
            ui.set(reference.yawjitter[2], 45)
            ui.set(reference.yaw[2], side == 1 and -12  or 6)   
         elseif player_state == 1 then
            ui.set(reference.yaw[1], "180")
            ui.set(reference.pitch[1], 'Default')
            ui.set(reference.yawbase, "At targets")
            ui.set(reference.pitch[2], 0)
            ui.set(reference.bodyyaw[1], 'Jitter')
            ui.set(reference.bodyyaw[2], -19)
            ui.set(reference.yawjitter[1], "Center")
            ui.set(reference.yawjitter[2], 28)
            ui.set(reference.yaw[2], side == 1 and -12  or 12) 
        end 
    elseif not aa_value.enabled:get() and helpers['functions']:manualaa() == 0 and vars.angles.type.value == ' Constructor'  then
        ui.set(reference.yaw[1], "Off")
        ui.set(reference.pitch[1], 'off')
        ui.set(reference.yawbase, "local view")
        ui.set(reference.pitch[2], 0)
        ui.set(reference.bodyyaw[1], 'off')
        ui.set(reference.bodyyaw[2], 0)
        ui.set(reference.yawjitter[1], "Off")
        ui.set(reference.yawjitter[2], 0)
        ui.set(reference.yaw[2], 0)
   
    end   
          
            handle_defensive(c)
            handle_static_freestand(c)
            handle_static_warmup(c)
            handle_edge_fakeduck(c)
            handle_manuals(c)
            handle_bombiste_fix(c)


end      
    
handle_drop_nades = function(c)
    if not vars.misc.enabled:get() then
        table.clear(helpers['functions'].grenades_list);
        return;
    end

    local wpn = entity.get_player_weapon(entity.get_local_player());
    if wpn == nil then return end

    if not vars.misc.hk:get() then
        table.clear(helpers['functions'].grenades_list);
        helpers['functions']:update_player_weapons(entity.get_local_player());
        return
    end

    if helpers['functions'].grenades_list == nil then
        return;
    end

    local wanted_weapon = helpers['functions'].grenades_list[1];

    if wanted_weapon == nil then
        return;
    end

    if wpn == wanted_weapon then
        local pitch, yaw = client.camera_angles();

        local offset = 0.0001;

        if pitch > 0 then
            offset = -offset;
        end

        c.yaw = yaw;
        c.pitch = pitch + offset;

        if wpn == helpers['functions'].prev_wpn then
            c.no_choke = true;
            c.allow_send_packet = true;

            if c.chokedcommands == 0 then
                client.exec("drop");
                table.remove(helpers['functions'].grenades_list, 1);
            end
        end
    end

    c.weaponselect = wanted_weapon;
    helpers['functions'].prev_wpn = wpn;
end

handle_fastladder = function(c)
    if vars.aa.encha:get('Fast Ladder Move') then
        local pitch, yaw = client.camera_angles()
        if entity.get_prop(entity.get_local_player(), "m_MoveType") == 9 then
            c.yaw = math.floor(c.yaw+0.5)
            c.roll = 0
            
            if c.forwardmove > 0 then
                if pitch < 45 then

                    c.pitch = 89
                    c.in_moveright = 1
                    c.in_moveleft = 0
                    c.in_forward = 0
                    c.in_back = 1

                    if c.sidemove == 0 then
                        c.yaw = c.yaw + 90
                    end

                    if c.sidemove < 0 then
                        c.yaw = c.yaw + 150
                    end

                    if c.sidemove > 0 then
                        c.yaw = c.yaw + 30
                    end
                end 
            end

            if c.forwardmove < 0 then
                c.pitch = 89
                c.in_moveleft = 1
                c.in_moveright = 0
                c.in_forward = 1
                c.in_back = 0
                if c.sidemove == 0 then
                    c.yaw = c.yaw + 90
                end
                if c.sidemove > 0 then
                    c.yaw = c.yaw + 150
                end
                if c.sidemove < 0 then
                    c.yaw = c.yaw + 30
                end
            end

        end
    end
end

    thirdperson_render = function()
        if vars.visuals.thirdperson:get() then
            client.exec("cam_idealdist ", vars.misc.distance_slider:get())
        end
    end

    arrows_render = function()
        if not entity.get_local_player() or not entity.is_alive(entity.get_local_player()) then return end
        local arrow_color = {vars.visuals.manual_arrows_color:get()}
        local global_alpha = helpers['functions'].animations:animate("alpha2", not (vars.visuals.indicators:get() and vars.visuals.widgets:get('Counter-Aim Indicators')), 6)
        local left_alpha = helpers['functions'].animations:animate("alpha_arrows_left", not (helpers['functions']:manualaa() == 1), 6)
        local right_alpha = helpers['functions'].animations:animate("alpha_arrows_right", not (helpers['functions']:manualaa() == 2), 6)

        renderer.text(x/2-55, y/2-2, arrow_color[1], arrow_color[2], arrow_color[3], arrow_color[4] * global_alpha * left_alpha, 'c+', 0, '‹')
        renderer.text(x/2+55, y/2-2, arrow_color[1], arrow_color[2], arrow_color[3], arrow_color[4] * global_alpha * right_alpha, 'c+', 0, '›')
    end

    damage_render = function()
        if not entity.get_local_player() or not entity.is_alive(entity.get_local_player()) then return end
        local damage = helpers['functions']:get_damage()
        helpers['functions'].damage_anim = helpers['functions']:lerp2(helpers['functions'].damage_anim, damage, 0.040)
        local dmg_string = damage == 0 and "AUTO" or tostring(math.floor(helpers['functions'].damage_anim + 0.5))
        local global_alpha = helpers['functions'].animations:animate("damage_ind", not (vars.visuals.indicators:get() and vars.visuals.widgets:get('Damage Indicator')), 12)
        renderer.text(x/2+5, y/2+5, 200, 200, 200, 220 * global_alpha, 'db', 0, dmg_string)
    end

    watermark_render = function()
        if not entity.get_local_player() then return end
        local watermark_enabled = vars.visuals.watermark:get()
        if not watermark_enabled then return end
        local r1, g1, b1, a1 = vars.visuals.watermark_color:get()
        local watermark_mode = vars.visuals.watermark_mode:get()
        local style_2 = (watermark_mode == 'Modern') and 1 or 0
        local style_3 = (watermark_mode == 'Bottom-Icon') and 1 or 0
        local screen_x, screen_y = client.screen_size()
        local pos_x, pos_y = screen_x - 125, 10  

        -- if style_2 > 0 then
        --     renderer.gradient(pos_x - 10, pos_y, 130, 50, r1, g1, b1, a1 * 0, r1, g1, b1, a1, true)
        --     renderer.text(pos_x + 40, pos_y + 7, 255, 255, 255, 255, "db", nil, "Exodus.PUB")
        --     renderer.text(pos_x + 35, pos_y + 20, 255, 255, 255, 255, "-", nil, string.upper(string.format("[%s]", loader.username)))
        --     renderer.text(pos_x + 80, pos_y + 20, 255, 255, 255, 255, "-", nil, string.upper(string.format("[%s]", loader.build)))
        -- end

        -- if style_3 > 0 and logo then
        --     local new_logo_size = logo_size * 6 -- Increase size by 50%
        --     logo:draw(screen_x / 2 - (new_logo_size / 2), screen_y - 120, new_logo_size, new_logo_size, 255, 255, 255, 255)
        -- end
        
    end

    thirdperson_render = function()

        if vars.visuals.thirdperson:get() then
            client.exec("cam_idealdist ", vars.visuals.distance_slider:get())
        else
    
        end

    end

    arrows_render = function()
    
        if not entity.get_local_player() or not entity.is_alive(entity.get_local_player()) then
            return
        end
    
        local arrow_color = {vars.visuals.manual_arrows_color:get()}
        local global_alpha = helpers['functions'].animations:animate("alpha2", not (vars.visuals.indicators:get()  and vars.visuals.widgets:get('Counter-Aim Indicators') ), 6)
        local left_alpha = helpers['functions'].animations:animate("alpha_arrows_left", not (helpers['functions']:manualaa() == 1), 6)
        local right_alpha = helpers['functions'].animations:animate("alpha_arrows_right", not (helpers['functions']:manualaa() == 2), 6)
    
        renderer.text(x/2-55,y/2-2, arrow_color[1], arrow_color[2], arrow_color[3], arrow_color[4]*global_alpha*left_alpha, 'c+', 0, '‹')
        renderer.text(x/2+55,y/2-2, arrow_color[1], arrow_color[2], arrow_color[3], arrow_color[4]*global_alpha*right_alpha, 'c+', 0, '›')
    
    end
    damage_render = function()

        if not entity.get_local_player() or not entity.is_alive(entity.get_local_player()) then
            return
        end

        local damage = helpers['functions']:get_damage();
    
        helpers['functions'].damage_anim = helpers['functions']:lerp2(helpers['functions'].damage_anim, damage, 0.040)

        local dmg_string = damage == 0 and "AUTO" or tostring(math.floor(helpers['functions'].damage_anim + 0.5))

        local global_alpha = helpers['functions'].animations:animate("damage_ind", not (vars.visuals.indicators:get() and vars.visuals.widgets:get('Damage Indicator')), 12)
        local style_alpha11 = helpers['functions'].animations:animate("damage_ind_style1", not (vars.visuals.damage_style:get() == '#1'), 12)
        
        local style_alpha12 = helpers['functions'].animations:animate("damage_ind_style2", not (vars.visuals.damage_style:get() == '#2'), 12)


        renderer.text(x/2+5,y/2-15, 255,255,255,255*global_alpha*style_alpha11, 'd', 0, dmg_string)

        local dmg_is = helpers['functions'].animations:animate("damage_ind_ena", not (ui.get(reference.dmg[1]) and ui.get(reference.dmg[2])), 12)

        renderer.text(x/2+5,y/2-15, 255,255,255,255*global_alpha * dmg_is * style_alpha12, 'd', 0, ui.get(reference.dmg[3]))

    
    end

    aspectratio_render = function()
        
        if vars.visuals.aspectratio:get()  then
            if vars.visuals.asp_offset:get() == 0 then
                cvar.r_aspectratio:set_float(0)
            else
                cvar.r_aspectratio:set_float(vars.visuals.asp_offset:get()/100)
            end
        else
            cvar.r_aspectratio:set_float()
        end

    end

    viewmodel_render = function()

        if vars.visuals.viewmodel:get() then
            cvar.viewmodel_fov:set_raw_float(vars.visuals.viewmodel_fov:get(), true)
            cvar.viewmodel_offset_x:set_raw_float(vars.visuals.viewmodel_x:get() / 10, true)
            cvar.viewmodel_offset_y:set_raw_float(vars.visuals.viewmodel_y:get() / 10, true)
            cvar.viewmodel_offset_z:set_raw_float(vars.visuals.viewmodel_z:get() / 10, true)
        else
            cvar.viewmodel_fov:set_raw_float()
            cvar.viewmodel_offset_x:set_raw_float()
            cvar.viewmodel_offset_y:set_raw_float()
            cvar.viewmodel_offset_z:set_raw_float()
        end
end

    watermark_render = function()
    if not entity.get_local_player() then return end

    local watermark_enabled = vars.visuals.watermark:get()
    if not watermark_enabled then return end

    local r1, g1, b1, a1 = vars.visuals.watermark_color:get()
    local r, g, b, a = vars.visuals.watermark_color:get()

    local watermark_mode = vars.visuals.watermark_mode:get()

    -- Ensure only one style is active
    local style_1 = (watermark_mode == 'Default') and 1 or 0
    local style_2 = (watermark_mode == 'Modern') and 1 or 0
    local style_3 = (watermark_mode == 'Bottom-Icon') and 1 or 0

    local steamid64 = entity.get_steam64(entity.get_local_player())
    local avatar = images.get_steam_avatar(steamid64)

    -- Render style_1 (off)
    if style_1 > 0 then
        return
    end

    local screen_x, screen_y = client.screen_size()
    if style_2 > 0 then
        local pos_x, pos_y = screen_x - 252, 8
        local box_width, box_height = 248, 50
        local radius = 8
    
        local r, g, b = {255,255,255}
    
        local function draw_rounded_box(x, y, w, h, radius, r, g, b, a)
            renderer.rectangle(x + radius, y, w - radius * 2, h, 10, 10, 12, 255)
            renderer.rectangle(x, y + radius, w, h - radius * 2, 10, 10, 12, 255)
            renderer.circle(x + radius, y + radius, 10, 10, 12, 255, radius, 0, 1)
            renderer.circle(x + w - radius, y + radius, 10, 10, 12, 255, radius, 0, 1)
            renderer.circle(x + radius, y + h - radius, 10, 10, 12, 255, radius, 0, 1)
            renderer.circle(x + w - radius, y + h - radius, 10, 10, 12, 255, radius, 0, 1)
        end
    
        draw_rounded_box(pos_x, pos_y, box_width, box_height, radius, r, g, b, 80)
    
        -- **Generate 99 Static Straight Lines**
        if not lines then
            lines = {}
            for i = 1, 120 do
                local is_vertical = math.random(0, 1) == 1  -- Randomly vertical or horizontal
                if is_vertical then
                    local x = pos_x + math.random(5, box_width - 5)
                    table.insert(lines, {
                        x1 = x, y1 = pos_y + 5,
                        x2 = x, y2 = pos_y + box_height - 5,
                        alpha = math.random(0,0)
                    })
                else
                    local y = pos_y + math.random(5, box_height - 5)
                    table.insert(lines, {
                        x1 = pos_x + 5, y1 = y,
                        x2 = pos_x + box_width - 5, y2 = y,
                        alpha = math.random(0,0)
                    })
                end
            end
        end
    
        -- **Draw 99 Static Straight Lines**
        for _, line in ipairs(lines) do
            renderer.line(line.x1, line.y1, line.x2, line.y2, r, g, b, line.alpha)
        end
    
        -- **Main UI Elements**
        local hours, minutes, seconds = client.system_time()
        local formatted_time = string.format("%02d:%02d:%02d", hours, minutes, seconds)
    
        renderer.text(pos_x + 21, pos_y + 10, r, g, b, 255, "db+", nil, "Exodus")
        renderer.text(pos_x + 135, pos_y + 8, r, g, b, 255, "b", nil, formatted_time)
    
        renderer.rectangle(pos_x + 125, pos_y + 8, 1, box_height - 10, 255, 255, 255, 80)
    
        local loader = {
            username = loader.username or "Guest"
        }
        if loader.username == "hazey" or loader.username == "melfrmdao" or loader.username == "rxdkys" then
            loader.build = "ADMIN"
        else
            loader.build = "EXCLUSIVE"
        end
    
        renderer.text(pos_x + 132, pos_y + 20, r, g, b, 230, "b", nil, "[" .. loader.build .. "] " .. loader.username )
        renderer.text(pos_x + 132, pos_y + 33, r, g, b, 255, "b", nil, "discord.gg/exodus")
    end
     
end
        hitmarker_render = function()

            if not vars.visuals.widgets:get('Hitmarker') then return end
            if not entity.get_local_player() or not entity.is_alive(entity.get_local_player()) then return end
            if not vars.visuals.indicators:get() then return end

            local r,g,b,a = vars.visuals.hitmarker_color:get()
            for tick, data in pairs(helpers['functions'].hitmarker_data) do
                if globals.realtime() <= data[4] then
                    local x1, y1 = renderer.world_to_screen(data[1], data[2], data[3])
                    if x1 ~= nil and y1 ~= nil then

                       renderer.line(x1 - 6,y1,x1 + 6,y1,r,g,b,a)
                       renderer.line(x1,y1 - 6,x1,y1 + 6 ,r,g,b,a)

                    end
                end
            end
        end
      -- Slowdown Indicator
-- Persistent position for the indicator
local slowed_pos = vector(client.screen_size() / 2 - 82, client.screen_size() / 3 - 20)
local dragging = false
local drag_offset = vector(0, 0)

local velocity_render = system.register(
    { vars.visuals.velocity_x, vars.visuals.velocity_y },
    slowed_pos,
    "Slowed Down Indicator",
    function(self)
        local local_player = entity.get_local_player()
        if not local_player or not entity.is_alive(local_player) then return end

        local r, g, b, a = vars.visuals.color_slowed:get()
        local modifier = entity.get_prop(local_player, "m_flVelocityModifier") or 1

        if ui.is_menu_open() then
            modifier = helpers.functions.velocity_smoth(0.1, globals.tickcount() % 125) / 122
        end

        local screen_w, screen_h = client.screen_size()
        local mouse_x, mouse_y = ui.mouse_position()  -- Your preferred method here
        local box_width, box_height = 195, 40
        local box_x, box_y = slowed_pos.x, slowed_pos.y

        -- Drag logic
        local is_hovered = mouse_x >= box_x and mouse_x <= box_x + box_width and mouse_y >= box_y and mouse_y <= box_y + box_height
        local mouse_left_down = client.key_state(0x01) -- Left mouse button

        if mouse_left_down and is_hovered and not dragging then
            dragging = true
            drag_offset = vector(mouse_x - box_x, mouse_y - box_y)
        elseif not mouse_left_down then
            dragging = false
        end

        if dragging then
            slowed_pos.x = mouse_x - drag_offset.x
            slowed_pos.y = mouse_y - drag_offset.y
        end

        -- Draw rounded box function
        local function draw_rounded_box(x, y, w, h, r, g, b, a, radius)
            renderer.rectangle(x + radius, y, w - radius * 2, h, r, g, b, a) -- Center rectangle
            renderer.rectangle(x, y + radius, w, h - radius * 2, r, g, b, a) -- Side bars
            renderer.circle(x + radius, y + radius, r, g, b, a, radius, 0, 1) -- Top-left corner
            renderer.circle(x + w - radius, y + radius, r, g, b, a, radius, 0, 1) -- Top-right corner
            renderer.circle(x + radius, y + h - radius, r, g, b, a, radius, 0, 1) -- Bottom-left corner
            renderer.circle(x + w - radius, y + h - radius, r, g, b, a, radius, 0, 1) -- Bottom-right corner
        end

        local global_alpha = helpers.functions.animations:animate("global_slowed_alpha", not vars.visuals.slowed:get(), 6)
        local velocity_alpha = helpers.functions.alpha_vel(0.05, ui.is_menu_open() and 255 or (modifier == 1 and 0 or 255)) * global_alpha
        local velocity_amount = modifier

        -- Draw background
        draw_rounded_box(slowed_pos.x, slowed_pos.y, box_width, box_height, 10, 10, 10, velocity_alpha, 10)

        -- Draw text & progress bar
        renderer.text(slowed_pos.x + box_width / 2 - 18, slowed_pos.y + 14, 200, 200, 200, velocity_alpha, "c", 0, "  Slowed Down")
        renderer.text(slowed_pos.x + box_width + -6, slowed_pos.y + 8, 200, 200, 200, velocity_alpha, "r", 0, math.floor(velocity_amount * 100) .. "%")

        renderer.rectangle(slowed_pos.x + 50, slowed_pos.y + 25, 140, 4, 50, 50, 50, velocity_alpha * 0.8)
        renderer.rectangle(slowed_pos.x + 50, slowed_pos.y + 25, 140 * velocity_amount, 4, r, g, b, velocity_alpha)

        -- Render icon & divider
        local svg_data = renderer.load_svg(
            '<svg width="22" height="22" viewBox="0 0 16 16"><path fill="' ..
            string.format("#%02x%02x%02x", r, g, b) ..
            '" d="m13.259 13h-10.518c-0.35787 0.0023-0.68906-0.1889-0.866-0.5-0.18093-0.3088-0.18093-0.6912 0-1l5.259-9.015c0.1769-0.31014 0.50696-0.50115 0.864-0.5 0.3568-0.00121 0.68659 0.18986 0.863 0.5l5.26 9.015c0.1809 0.3088 0.1809 0.6912 0 1-0.1764 0.3097-0.5056 0.5006-0.862 0.5zm-6.259-3v2h2v-2zm0-5v4h2v-4z"/></svg>',
            32, 32
        )
        renderer.texture(svg_data, slowed_pos.x - -5, slowed_pos.y + 5, 32, 32, 255, 255, 255, velocity_alpha, "f")
        renderer.rectangle(slowed_pos.x - -40, slowed_pos.y, 1, box_height, 51, 51, 51, velocity_alpha * 0.6)
    end
)

        

        client.set_event_callback('paint', function()

            damage_render()
        
            arrows_render()
        
            watermark_render()
        
            aspectratio_render()
        
            viewmodel_render()
        
            thirdperson_render()
        
            hitmarker_render()
        
            if entity.get_local_player() == nil then helpers['functions'].defensive_ticks = 0 end

            velocity_render:update()
        
        end)



client.set_event_callback('paint_ui', function()

    if entity.get_local_player() == nil then helpers['functions'].defensive_ticks = 0 end

    if not ui.is_menu_open() then
        return
    end

    hide_menu(false)

    if vars.visuals.logs:get() then
        reference.consolea:override(true)
    else
        reference.consolea:override()
    end

end)

client.set_event_callback('shutdown', function()

    ui.set(reference.yaw[1], "Off")
    ui.set(reference.pitch[1], 'off')
    ui.set(reference.yawbase, "local view")
    ui.set(reference.pitch[2], 0)
    ui.set(reference.bodyyaw[1], 'off')
    ui.set(reference.bodyyaw[2], 0)
    ui.set(reference.yawjitter[1], "Off")
    ui.set(reference.yawjitter[2], 0)
    ui.set(reference.yaw[2], 0)

    hide_menu(true)
    
end)

client.set_event_callback('net_update_end', function()

    if entity.get_local_player() ~= nil then
        is_defensive_active = helpers['functions']:is_defensive(entity.get_local_player())
    end

end)

client.set_event_callback('aim_fire', function(e)

    helpers['functions'].hitmarker_data[globals.tickcount()] = {e.x,e.y,e.z, globals.realtime() + 3}

    original = e

    history = globals.tickcount() - e.tick

end)


local hitgroup_names = {"generic", "head", "chest", "stomach", "left arm", "right arm", "left leg", "right leg", "neck", "?", "gear"}
local weapons = { knife = 'Knifed', hegrenade = 'Naded', inferno = 'Burned' }

client.set_event_callback('aim_hit', function(e)

if not entity.get_local_player() or not entity.is_alive(entity.get_local_player()) then
    return
end

if not vars.visuals.logs:get() then
    return
end

local group = hitgroup_names[e.hitgroup + 1] or "?"
local text = ''
local text22 = ''
local textik = ''
local r, g, b, a = vars.visuals.hit_color:get()

local mismatch_text = ''
local hgroup = hitgroup_names[e.hitgroup + 1] or '?'
local aimed_hgroup = hitgroup_names[original.hitgroup + 1] or '?'
local hg_diff = hgroup ~= aimed_hgroup
local dmg_diff = e.damage ~= original.damage

if entity.get_prop(e.target, "m_iHealth") == 0 then
    text = 'dead, \0'
    text22 = ' Killed \0'
else
    text = entity.get_prop(e.target, "m_iHealth")
    textik = ' hp, \0'
    text22 = ' Hit \0'
end

if not vars.visuals.full_color:get() then
    client.color_log(200, 200, 200, "[\0")
    client.color_log(r, g, b, "Exodus\0")
    client.color_log(200, 200, 200, "]\0")
    client.color_log(200, 200, 200, text22)
    client.color_log(r, g, b, entity.get_player_name(e.target).."\0")
    client.color_log(200, 200, 200, "'s \0")
    client.color_log(r, g, b, group.."\0")
    client.color_log(200, 200, 200, " for \0")
    client.color_log(r, g, b, e.damage.."\0")
    client.color_log(200, 200, 200, " [remaining: \0")
    client.color_log(r, g, b, text.."\0")
    client.color_log(200, 200, 200, textik.."\0")
    client.color_log(200, 200, 200, "HC: \0")
    client.color_log(r, g, b, math.floor(e.hit_chance).."%\0")
    client.color_log(200, 200, 200, ", history: \0")
    client.color_log(r, g, b, history..'\0')

    if dmg_diff then 
        client.color_log(200, 200, 200, ' , mismatch: {dmg: \0')
        client.color_log(r, g, b, original.damage..'\0')
        client.color_log(200, 200, 200, string.format('%s', (hg_diff and ' , ' or '}')) .. '\0')
    end
    
    if hg_diff then 
        client.color_log(200, 200, 200, (hg_diff and 'hitgroup: \0'))
        client.color_log(r, g, b, aimed_hgroup..'\0')
        client.color_log(200, 200, 200, '}\0')
    end
    client.color_log(200, 200, 200, "]")
else
    client.color_log(r, g, b, "[\0")
    client.color_log(r, g, b, "Exodus\0")
    client.color_log(r, g, b, "]\0")
    client.color_log(r, g, b, text22)
    client.color_log(r, g, b, entity.get_player_name(e.target).."\0")
    client.color_log(r, g, b, "'s \0")
    client.color_log(r, g, b, group.."\0")
    client.color_log(r, g, b, " for \0")
    client.color_log(r, g, b, e.damage.."\0")
    client.color_log(r, g, b, " [remaining: \0")
    client.color_log(r, g, b, text.."\0")
    client.color_log(r, g, b, textik.."\0")
    client.color_log(r, g, b, "HC: \0")
    client.color_log(r, g, b, math.floor(e.hit_chance).."%\0")
    client.color_log(r, g, b, ", history: \0")
    client.color_log(r, g, b, history..'\0')

    if dmg_diff then 
        client.color_log(r, g, b, ' , mismatch: {dmg: \0')
        client.color_log(r, g, b, original.damage..'\0')
        client.color_log(r, g, b, string.format('%s', (hg_diff and ' , ' or '}')) .. '\0')
    end
    
    if hg_diff then 
        client.color_log(r, g, b, (hg_diff and 'hitgroup: \0'))
        client.color_log(r, g, b, aimed_hgroup..'\0')
        client.color_log(r, g, b, '}\0')
    end
    client.color_log(r, g, b, "]")
end

if vars.visuals.label_logs:get() == "New" then
local player_name = entity.get_player_name(e.target)
local group_lower = group:lower()
local damage = e.damage

local text = string.format("Hit %s in the %s for %s", player_name, group_lower, damage)
logger.invent(text, {r, g, b, a})

end    

end)

client.set_event_callback('player_hurt', function(e)

    if not entity.get_local_player() or not entity.is_alive(entity.get_local_player()) then
        return
    end

    if not vars.visuals.logs:get() then
        return
    end

    local attacker_id = client.userid_to_entindex(e.attacker)

    if attacker_id == nil or attacker_id ~= entity.get_local_player() then
        return
    end

    local r,g,b,a = vars.visuals.hit_color:get()

    local gad = ''

    if e.health == 0 then
        gad = 'dead'
     else
        gad = e.health
     end

     local target_id = client.userid_to_entindex(e.userid)
     local target_name = entity.get_player_name(target_id)

     if weapons[e.weapon] ~= nil then
        if not vars.visuals.full_color:get() then
            client.color_log(200, 200, 200, "[\0")
            client.color_log(r, g, b, "Exodus\0")
            client.color_log(200, 200, 200, "]\0")
            client.color_log(200, 200, 200, string.format(" %s\0", weapons[e.weapon]))
            client.color_log(r, g, b, string.format(" %s\0", target_name))
            client.color_log(200, 200, 200, " for\0")
            client.color_log(r, g, b, string.format(" %s\0", e.dmg_health))
            client.color_log(200, 200, 200, " [remaining: \0")
            client.color_log(r, g, b, gad .. "\0")
            client.color_log(200, 200, 200, "]")
    
            
        else    
            client.color_log(r,g,b, "[\0")
            client.color_log(r, g, b, "Exodus\0")
            client.color_log(r,g,b, "]\0")
            client.color_log(r,g,b, string.format(" %s\0", weapons[e.weapon]))
            client.color_log(r,g,b, string.format(" %s\0", target_name))
            client.color_log(r,g,b, " for\0")
            client.color_log(r,g,b, string.format(" %s\0", e.dmg_health))
            client.color_log(r,g,b, " [remaining: \0")
            client.color_log(r,g,b, gad.. '\0')
            client.color_log(r,g,b, "]")
        end

    end

end)

client.set_event_callback('aim_miss', function(e)

    if not entity.get_local_player() or not entity.is_alive(entity.get_local_player()) then
        return
    end

    local group = hitgroup_names[e.hitgroup + 1] or "?"
    local r, g, b, a = vars.visuals.miss_color:get()

    if vars.visuals.logs:get() then
        if not vars.visuals.full_color:get() then
            client.color_log(200, 200, 200, "[\0")
            client.color_log(r, g, b, "Exodus\0")
            client.color_log(200, 200, 200, "]\0")
            client.color_log(200, 200, 200, " Missed \0")
            client.color_log(r, g, b, entity.get_player_name(e.target).."\0")
            client.color_log(200, 200, 200, "'s \0")
            client.color_log(r, g, b, group.."\0")
            client.color_log(200, 200, 200, " due to \0")
            client.color_log(r, g, b, e.reason.. "\0")
            client.color_log(200, 200, 200, " [dmg: \0")
            client.color_log(r, g, b, original.damage.."\0")
            client.color_log(200, 200, 200, " hp, \0")
            client.color_log(200, 200, 200, "HC: \0")
            client.color_log(r, g, b, math.floor(e.hit_chance).."%\0")
            client.color_log(200, 200, 200, ", history: \0")
            client.color_log(r, g, b, history..'\0')
            client.color_log(200, 200, 200, "]")
        else
            client.color_log(r, g, b, "[\0")
       client.color_log(r, g, b, "Exodus\0")
            client.color_log(r, g, b, "]\0")
            client.color_log(r, g, b, " Missed \0")
            client.color_log(r, g, b, entity.get_player_name(e.target).."\0")
            client.color_log(r, g, b, "'s \0")
            client.color_log(r, g, b, group.."\0")
            client.color_log(r, g, b, " due to \0")
            client.color_log(r, g, b, e.reason.. "\0")
            client.color_log(r, g, b, " [dmg: \0")
            client.color_log(r, g, b, original.damage.."\0")
            client.color_log(r, g, b, " hp, \0")
            client.color_log(r, g, b, "HC: \0")
            client.color_log(r, g, b, math.floor(e.hit_chance).."%\0")
            client.color_log(r, g, b, ", history: \0")
            client.color_log(r, g, b, history..'\0')
            client.color_log(r, g, b, "]")
        end
        
        if vars.visuals.label_logs:get() == "New" then
        local player_name = entity.get_player_name(e.target) or "unknown"
        local group_lower = (group or "unknown"):lower()
        local reason = e.reason or "unknown"

        local text = string.format("Missed %s's %s due to %s", player_name, group_lower, reason)
        logger.invent(text, {r, g, b, a})
    end
        
    end
end)

local function get_camera_pos(enemy)
    local e_x, e_y, e_z = entity.get_prop(enemy, "m_vecOrigin")
    if e_x == nil then return end
    local _, _, ofs = entity.get_prop(enemy, "m_vecViewOffset")
    e_z = e_z + (ofs - (entity.get_prop(enemy, "m_flDuckAmount") * 16))
    return e_x, e_y, e_z
end
local function fired_at(target, shooter, shot)
    local shooter_cam = {get_camera_pos(shooter)}
    if shooter_cam[1] == nil then return end
    
    local player_head = {entity.hitbox_position(target, 0)}
    
    -- Calculate vectors from camera to head and shot points
    local shooter_cam_to_head = {
        player_head[1] - shooter_cam[1],
        player_head[2] - shooter_cam[2],
        player_head[3] - shooter_cam[3]
    }
    
    local shooter_cam_to_shot = {
        shot[1] - shooter_cam[1],
        shot[2] - shooter_cam[2],
        shot[3] - shooter_cam[3]
    }
    
    -- Calculate projection factor
    local magic = ((shooter_cam_to_head[1]*shooter_cam_to_shot[1]) +
                  (shooter_cam_to_head[2]*shooter_cam_to_shot[2]) +
                  (shooter_cam_to_head[3]*shooter_cam_to_shot[3])) /
                 (math.pow(shooter_cam_to_shot[1], 2) +
                  math.pow(shooter_cam_to_shot[2], 2) +
                  math.pow(shooter_cam_to_shot[3], 2))
    
    -- Calculate closest point on shot trajectory
    local closest = {
        shooter_cam[1] + shooter_cam_to_shot[1]*magic,
        shooter_cam[2] + shooter_cam_to_shot[2]*magic,
        shooter_cam[3] + shooter_cam_to_shot[3]*magic
    }
    
    -- Calculate distance to head position
    local length = math.abs(math.sqrt(
        math.pow((player_head[1]-closest[1]), 2) +
        math.pow((player_head[2]-closest[2]), 2) +
        math.pow((player_head[3]-closest[3]), 2)
    ))
    
    -- Perform trace checks
    local frac_shot = client.trace_line(shooter, shot[1], shot[2], shot[3],
                                      player_head[1], player_head[2], player_head[3])
    local frac_final = client.trace_line(target, closest[1], closest[2], closest[3],
                                       player_head[1], player_head[2], player_head[3])
    
    return (length < 69) and (frac_shot > 0.99 or frac_final > 0.99)
end

client.set_event_callback("bullet_impact", function(event)
    if not vars.visuals.logs:get() then
        return
    end

    local lp = entity.get_local_player()
    if lp == nil then return end
    
    local enemy = client.userid_to_entindex(event.userid)
    if enemy == lp or not entity.is_enemy(enemy) or not entity.is_alive(lp) then return end

    if fired_at(lp, enemy, {event.x, event.y, event.z}) then
        if tickshot ~= globals.tickcount() then
            local selected_log = vars.visuals.label_logs:get() -- Get selected value from combobox
            if selected_log == "New" then
                -- Get color from the color picker
   
                
                -- Check if any color values are nil and set defaults if necessary
                r = r or 255
                g = g or 255
                b = b or 255
                a = a or 255
                
                -- Now safely use these values in the string.format
              local text = string.format(
    "Changed ['jitter'] due to bullet from %s",
    string.lower(entity.get_player_name(enemy) or "unknown")
)
logger.invent(text, {196, 172, 188, 255}) -- example color, adjust if needed

            end
            
            
            
            tickshot = globals.tickcount()
        end
    end
end)

client.set_event_callback("round_prestart", function()
    helpers['functions'].hitmarker_data = {}
end)


client.set_event_callback('pre_render', function(c)

    if not entity.get_local_player() or not entity.is_alive(entity.get_local_player()) then
        return
    end
    
    if not vars.aa.encha:get('Animations Breaker') then reference.lm:override("Never slide"); return end
    local on_ground = bit.band(entity.get_prop(entity.get_local_player(), "m_fFlags"), 1) == 1 

    if vars.aa.ground.value == 'Static' then
        entity.set_prop(entity.get_local_player(), 'm_flPoseParameter', 1, 0)
        reference.lm:override('Always slide')
    elseif vars.aa.ground.value == 'Walking' then
        entity.set_prop(entity.get_local_player(), 'm_flPoseParameter', .5, 7)
        reference.lm:override('Never slide')
    elseif vars.aa.ground.value == 'Jitter' then
        if globals.tickcount() % 3 > 1  then
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 0);
            reference.lm:override('Always slide')
        else
            reference.lm:override("Never slide");
        end
        entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, globals.tickcount() % 4 > 1 and 5 or 1)
    end

    if vars.aa.air.value == 'Static' and not on_ground then
        entity.set_prop(entity.get_local_player(), 'm_flPoseParameter', 1, 6)
    elseif vars.aa.air.value == 'Walking' and not on_ground then
        local ent = c_entity(entity.get_local_player())
        local animlayer = ent:get_anim_overlay(6)
        animlayer.weight = 1
    end

end)

client.set_event_callback('post_config_load', function()
    for _, point in pairs(system.windows) do
        point.position = vector(point.ui_callbacks.x:get(), point.ui_callbacks.y:get())
    end
end)

client.set_event_callback('setup_command', function(c)
    
    if not entity.get_local_player() or not entity.is_alive(entity.get_local_player()) then
        return
    end

    if ui.is_menu_open() then
        c.in_attack = false
    end

    handle_antiaims(c)
    handle_drop_nades(c)
    handle_fastladder(c)
    handle_anti_backstab(c)
    
end)
local client_screen_size, renderer_measure_text, renderer_text = client.screen_size, renderer.measure_text, renderer.text

local function get_moving_gradient_color(index, speed)
    local time = globals.realtime() * (speed * 0.2) + (index * 0.3)
    local intensity = math.floor((math.sin(time) + 1) * 50) + 150 -- Gray range (150-200)
    return intensity, intensity, intensity, 150 -- Alpha transparency 150
end
-- local group = pui.group('Rage',)

local vars = {}
vars.rage = {}
vars.rage.resolver = ui.new_checkbox("Rage", "Other", "\aE87785FF \rExodus \affffffff»\aE87785FFResolver")
vars.rage.show_active_mode = ui.new_checkbox("Rage", "Other", "Show Active Mode on \aE87785FFScreen")
vars.rage.show_indicator = ui.new_checkbox("Rage", "Other", "Show Screen Render \aE87785FFIndicator")
local text_slider = ui.new_slider("Rage", "Other", "Mode Selector", 1, 4, 1, true, "", 1, {"Jitter","Defensive", "Both", "Interpolated Jitter"})


local function update_visibility()
    local enabled = ui.get(vars.rage.resolver) == true
    ui.set_visible(vars.rage.show_active_mode, enabled)
    ui.set_visible(vars.rage.show_indicator, enabled)
    ui.set_visible(text_slider, enabled)
end

ui.set_callback(vars.rage.resolver, update_visibility)
update_visibility()

local function auto_detect_mode()
    return "Auto Detect"
end

local function on_paint()
    -- Check if local player exists and is alive
    local local_player = entity.get_local_player()
    if not local_player or not entity.is_alive(local_player) then
        return -- Exit function if the player is dead
    end

    if not ui.get(vars.rage.resolver) then return end

    if ui.get(vars.rage.show_active_mode) then
        local mode_names = {"Jitter","Defensive", "Both"}
        local selected_index = ui.get(text_slider) or 1
        local selected_mode = mode_names[selected_index] or "Unknown"

        if selected_index == 5 then
            selected_mode = auto_detect_mode()
        end

        local screen_width, _ = client.screen_size()
        renderer.text(screen_width - 10, 5, 255, 255, 255, 255, "r", 0, "Active Mode: " .. selected_mode)
    end

    if ui.get(vars.rage.show_indicator) then
        local text = "Exodus"
        local final_text = ""
        for i = 1, #text do
            local char = text:sub(i, i)
            local r, g, b, a = get_moving_gradient_color(i, 25) -- Slower animation
            final_text = final_text .. string.format("\a%02X%02X%02X%02X%s", r, g, b, a, char)
        end
        renderer.indicator(255, 255, 255, 255, final_text)
    end
end

client.set_event_callback("paint", on_paint)


local client_latency, client_screen_size, client_set_event_callback, client_system_time, entity_get_local_player, entity_get_player_resource, entity_get_prop, globals_absoluteframetime, globals_tickinterval, math_ceil, math_floor, math_min, math_sqrt, renderer_measure_text, ui_reference, pcall, renderer_gradient, renderer_rectangle, renderer_text, string_format, table_insert, ui_get, ui_new_checkbox, ui_new_color_picker, ui_new_multiselect, ui_new_textbox, ui_set, ui_set_callback, ui_set_visible = client.latency, client.screen_size, client.set_event_callback, client.system_time, entity.get_local_player, entity.get_player_resource, entity.get_prop, globals.absoluteframetime, globals.tickinterval, math.ceil, math.floor, math.min, math.sqrt, renderer.measure_text, ui.reference, pcall, renderer.gradient, renderer.rectangle, renderer.text, string.format, table.insert, ui.get, ui.new_checkbox, ui.new_color_picker, ui.new_multiselect, ui.new_textbox, ui.set, ui.set_callback, ui.set_visible

local ffi = require 'ffi'

ffi.cdef[[
    struct c_animstate {
        char pad[3];
        char m_bForceWeaponUpdate; //0x4
        char pad1[91];
        void* m_pBaseEntity; //0x60
        void* m_pActiveWeapon; //0x64
        void* m_pLastActiveWeapon; //0x68
        float m_flLastClientSideAnimationUpdateTime; //0x6C
        int m_iLastClientSideAnimationUpdateFramecount; //0x70
        float m_flAnimUpdateDelta; //0x74
        float m_flEyeYaw; //0x78
        float m_flPitch; //0x7C
        float m_flGoalFeetYaw; //0x80
        float m_flCurrentFeetYaw; //0x84
        float m_flCurrentTorsoYaw; //0x88
        float m_flUnknownVelocityLean; //0x8C
        float m_flLeanAmount; //0x90
        char pad2[4];
        float m_flFeetCycle; //0x98
        float m_flFeetYawRate; //0x9C
        char pad3[4];
        float m_fDuckAmount; //0xA4
        float m_fLandingDuckAdditiveSomething; //0xA8
        char pad4[4];
        float m_vOriginX; //0xB0
        float m_vOriginY; //0xB4
        float m_vOriginZ; //0xB8
        float m_vLastOriginX; //0xBC
        float m_vLastOriginY; //0xC0
        float m_vLastOriginZ; //0xC4
        float m_vVelocityX; //0xC8
        float m_vVelocityY; //0xCC
        char pad5[4];
        float m_flUnknownFloat1; //0xD4
        char pad6[8];
        float m_flUnknownFloat2; //0xE0
        float m_flUnknownFloat3; //0xE4
        float m_flUnknown; //0xE8
        float m_flSpeed2D; //0xEC
        float m_flUpVelocity; //0xF0
        float m_flSpeedNormalized; //0xF4
        float m_flFeetSpeedForwardsOrSideWays; //0xF8
        float m_flFeetSpeedUnknownForwardOrSideways; //0xFC
        float m_flTimeSinceStartedMoving; //0x100
        float m_flTimeSinceStoppedMoving; //0x104
        bool m_bOnGround; //0x108
        bool m_bInHitGroundAnimation; //0x109
        float m_flTimeSinceInAir; //0x10A
        float m_flLastOriginZ; //0x10E
        float m_flHeadHeightOrOffsetFromHittingGroundAnimation; //0x112
        float m_flStopToFullRunningFraction; //0x116
        char pad7[4]; //0x11A
        float m_flMagicFraction; //0x11E
        char pad8[60]; //0x122
        float m_flWorldForce; //0x15E
        char pad9[462]; //0x162
        float m_flMaxYaw; //0x334
        float velocity_subtract_x; //0x330
        float velocity_subtract_y; //0x334
        float velocity_subtract_z; //0x338
    };

    typedef void*(__thiscall* get_client_entity_t)(void*, int);

    typedef struct
    {
        float m_anim_time;
        float m_fade_out_time;
        int m_flags;
        int m_activity;
        int m_priority;
        int m_order;
        int m_sequence;
        float m_prev_cycle;
        float m_weight;
        float m_weight_delta_rate;
        float m_playback_rate;
        float m_cycle;
        void* m_owner;
        int m_bits;
    } C_AnimationLayer;

    typedef uintptr_t(__thiscall* GetClientEntityHandle_4242425_t)(void*, uintptr_t);
]]

ffi.cdef[[
    typedef struct MaterialAdapterInfo_tt
    {
        char m_pDriverName[512];
        unsigned int m_VendorID;
        unsigned int m_DeviceID;
        unsigned int m_SubSysID;
        unsigned int m_Revision;
        int m_nDXSupportLevel;
        int m_nMinDXSupportLevel;
        int m_nMaxDXSupportLevel;
        unsigned int m_nDriverVersionHigh;
        unsigned int m_nDriverVersionLow;
    };

    typedef int(__thiscall* get_current_adapter_fn)(void*);
    typedef void(__thiscall* get_adapter_info_fn)(void*, int adapter, struct MaterialAdapterInfo_tt& info);
]]




math.clamp = function(value, min, max)
    return value < min and min or (value > max and max or value)
end


math.vec_length2d = function(vec)
    return math.sqrt(vec.x * vec.x + vec.y * vec.y)
end


math.vec_length3d = function(vec)
    return math.sqrt(vec.x * vec.x + vec.y * vec.y + vec.z * vec.z)
end


math.dot2d = function(vec1, vec2)
    return vec1.x * vec2.x + vec1.y * vec2.y
end


math.dot3d = function(vec1, vec2)
    return vec1.x * vec2.x + vec1.y * vec2.y + vec1.z * vec2.z
end


math.cross3d = function(vec1, vec2)
    return {
        x = vec1.y * vec2.z - vec1.z * vec2.y,
        y = vec1.z * vec2.x - vec1.x * vec2.z,
        z = vec1.x * vec2.y - vec1.y * vec2.x
    }
end


math.angle_normalize = function(angle)
    return (angle % 360 + 360) % 360
end


math.angle_diff = function(dest, src)
    local delta = (dest - src + 540) % 360 - 180
    return delta
end


math.approach_angle = function(target, value, speed)
    target = math.angle_normalize(target)
    value = math.angle_normalize(value)

    local delta = math.angle_diff(target, value)
    speed = math.abs(speed)

    if delta > speed then
        value = value + speed
    elseif delta < -speed then
        value = value - speed
    else
        value = target
    end

    return math.angle_normalize(value)
end


math.lerp = function(a, b, t)
    return a + (b - a) * t
end


math.inv_lerp = function(a, b, value)
    return (value - a) / (b - a)
end


math.remap = function(value, in_min, in_max, out_min, out_max)
    return out_min + (value - in_min) * (out_max - out_min) / (in_max - in_min)
end


math.distance2d = function(point1, point2)
    local dx = point2.x - point1.x
    local dy = point2.y - point1.y
    return math.sqrt(dx * dx + dy * dy)
end


math.distance3d = function(point1, point2)
    local dx = point2.x - point1.x
    local dy = point2.y - point1.y
    local dz = point2.z - point1.z
    return math.sqrt(dx * dx + dy * dy + dz * dz)
end


math.midpoint2d = function(point1, point2)
    return {
        x = (point1.x + point2.x) * 0.5,
        y = (point1.y + point2.y) * 0.5
    }
end


math.midpoint3d = function(point1, point2)
    return {
        x = (point1.x + point2.x) * 0.5,
        y = (point1.y + point2.y) * 0.5,
        z = (point1.z + point2.z) * 0.5
    }
end


math.angle_between2d = function(vec1, vec2)
    local dot = math.dot2d(vec1, vec2)
    local len1 = math.vec_length2d(vec1)
    local len2 = math.vec_length2d(vec2)
    return math.acos(dot / (len1 * len2))
end


math.angle_between3d = function(vec1, vec2)
    local dot = math.dot3d(vec1, vec2)
    local len1 = math.vec_length3d(vec1)
    local len2 = math.vec_length3d(vec2)
    return math.acos(dot / (len1 * len2))
end


math.point_in_bbox2d = function(point, bbox_min, bbox_max)
    return point.x >= bbox_min.x and point.x <= bbox_max.x and
           point.y >= bbox_min.y and point.y <= bbox_max.y
end


math.point_in_bbox3d = function(point, bbox_min, bbox_max)
    return point.x >= bbox_min.x and point.x <= bbox_max.x and
           point.y >= bbox_min.y and point.y <= bbox_max.y and
           point.z >= bbox_min.z and point.z <= bbox_max.z
end


math.signed_area_triangle2d = function(a, b, c)
    return (b.x - a.x) * (c.y - a.y) - (b.y - a.y) * (c.x - a.x)
end


math.point_in_triangle2d = function(point, a, b, c)
    local d1 = math.signed_area_triangle2d(point, a, b)
    local d2 = math.signed_area_triangle2d(point, b, c)
    local d3 = math.signed_area_triangle2d(point, c, a)

    local has_neg = d1 < 0 or d2 < 0 or d3 < 0
    local has_pos = d1 > 0 or d2 > 0 or d3 > 0

    return not (has_neg and has_pos)
end

local ffi = require("ffi")

-- Define c_animstate structure
ffi.cdef([[
    typedef struct {
        char pad[3]; // Adjust based on actual struct size
        float speed;
        float velocity_x;
        float velocity_y;
        float yaw;
        float pitch;
        int some_flags;
    } c_animstate;
]])

local entity_list_ptr = ffi.cast("void***", client.create_interface("client.dll", "VClientEntityList003"))
local get_client_entity_fn = ffi.cast("void*(__thiscall*)(void*, int)", entity_list_ptr[0][3])

local voidptr = ffi.typeof("void***")
local rawientitylist = client.create_interface("client_panorama.dll", "VClientEntityList003") or error("VClientEntityList003 wasn't found", 2)
local ientitylist = ffi.cast(voidptr, rawientitylist) or error("rawientitylist is nil", 2)
local get_client_entity = ffi.cast("void*(__thiscall*)(void*, int)", ientitylist[0][3]) or error("get_client_entity is nil", 2)

entity.get_vector_prop = function(idx, prop, array)
    local v1, v2, v3 = entity.get_prop(idx, prop, array)
    return {x = v1, y = v2, z = v3}
end

entity.get_address = function(idx)
    return get_client_entity_fn(entity_list_ptr, idx)
end

entity.get_animstate = function(idx)
    local addr = entity.get_address(idx)
    if not addr then return nil end

end

entity.get_animlayer = function(idx)
    local addr = entity.get_address(idx)
    if not addr then return nil end
    return ffi.cast("C_AnimationLayer**", ffi.cast("uintptr_t", addr) + 0x9960)[0]
end


local resolver = {
    layers = {},
    prediction_time = 0.3,
    smoothing_factor = 0.1,
    max_prediction_time = 0.5,
    min_prediction_time = 0.1,
    history = {},
    max_history_size = 10
}

resolver.m_flMaxDelta = function(idx)
    local animstate = entity.get_animstate(idx)
    if not animstate then return 0 end

    local speedfactor = math.clamp(animstate.m_flFeetSpeedForwardsOrSideWays, 0, 1)
    local avg_speedfactor = (animstate.m_flStopToFullRunningFraction * -0.3 - 0.2) * speedfactor + 1
    local duck_amount = animstate.m_fDuckAmount

    if duck_amount > 0 then
        local max_velocity = math.clamp(animstate.m_flFeetSpeedForwardsOrSideWays, 0, 1)
        local duck_speed = duck_amount * max_velocity
        avg_speedfactor = avg_speedfactor + (duck_speed * (0.5 - avg_speedfactor))
    end

    return avg_speedfactor * animstate.m_flMaxYaw
end

resolver.update_layers = function(idx)
    local layers = entity.get_animlayer(idx)
    if not layers then return end
    if not resolver.layers[idx] then
        resolver.layers[idx] = {}
    end

    for i = 0, 13 do
        local layer = layers[i]
        if not resolver.layers[idx][i] then
            resolver.layers[idx][i] = {}
        end

        resolver.layers[idx][i].m_cycle = layer.m_cycle
        resolver.layers[idx][i].m_playback_rate = layer.m_playback_rate
        resolver.layers[idx][i].m_weight = layer.m_weight
        resolver.layers[idx][i].m_weight_delta_rate = layer.m_weight_delta_rate
    end
end

resolver.get_layers = function(idx)
    return resolver.layers[idx] or {}
end

resolver.predict_position = function(idx)
    local animstate = entity.get_animstate(idx)
    if not animstate then return end

    local velocity = entity.get_vector_prop(idx, "m_vecVelocity")
    local origin = entity.get_vector_prop(idx, "m_vecOrigin")

    
    local speed = math.vec_length2d(velocity)
    local acceleration = math.vec_length2d({x = animstate.velocity_subtract_x, y = animstate.velocity_subtract_y, z = animstate.velocity_subtract_z})
    local dynamic_prediction_time = math.clamp(resolver.prediction_time, resolver.min_prediction_time, resolver.max_prediction_time)
    dynamic_prediction_time = dynamic_prediction_time * (speed / 100) * (1 + acceleration / 1000)

    
    local future_position = {
        x = origin.x + velocity.x * dynamic_prediction_time,
        y = origin.y + velocity.y * dynamic_prediction_time,
        z = origin.z + velocity.z * dynamic_prediction_time
    }

    future_position.x = future_position.x + 0.5 * animstate.velocity_subtract_x * dynamic_prediction_time^2
    future_position.y = future_position.y + 0.5 * animstate.velocity_subtract_y * dynamic_prediction_time^2
    future_position.z = future_position.z + 0.5 * animstate.velocity_subtract_z * dynamic_prediction_time^2

   
    if not resolver.history[idx] then
        resolver.history[idx] = {}
    end
    table.insert(resolver.history[idx], {position = future_position, time = globals.curtime()})
    if #resolver.history[idx] > resolver.max_history_size then
        table.remove(resolver.history[idx], 1)
    end

    return future_position
end

resolver.predict_yaw = function(idx, current_yaw)
    local animstate = entity.get_animstate(idx)
    if not animstate then return current_yaw end

    local velocity = entity.get_vector_prop(idx, "m_vecVelocity")
    local speed = math.vec_length2d(velocity)

    
    local acceleration = math.vec_length2d({x = animstate.velocity_subtract_x, y = animstate.velocity_subtract_y, z = animstate.velocity_subtract_z})
    local dynamic_prediction_time = math.clamp(resolver.prediction_time, resolver.min_prediction_time, resolver.max_prediction_time)
    dynamic_prediction_time = dynamic_prediction_time * (speed / 100) * (1 + acceleration / 1000)

    
    local predicted_yaw = animstate.m_flGoalFeetYaw + (animstate.m_flFeetYawRate * dynamic_prediction_time)

    
    local delta = math.abs(predicted_yaw - current_yaw)
    local smoothing_factor = resolver.smoothing_factor * (1 + speed / 300) * (1 + delta / 180)
    local smoothed_yaw = math.angle_normalize(current_yaw + (predicted_yaw - current_yaw) * smoothing_factor)

    return smoothed_yaw
end


client.set_event_callback("net_update_end", function()
    local players = entity.get_players(true)
    if not players then return end

    for i = 1, #players do
        local ent = players[i]
        resolver.update_layers(ent)
    end
end)

local function find_layer(ent, act)
    local layers = entity.get_animlayer(ent)
    if not layers then return -1 end

    for i = 0, 13 do
        local layer = layers[i]
        if layer.m_activity == act then
            return i
        end
    end
    return -1
end

client.set_event_callback("paint", function()
    if not vars.rage.resolver then return end

    local players = entity.get_players(true)
    for i = 1, #players do
        local ent = players[i]

        local lay = find_layer(ent, 1)
        if lay == -1 then goto skip end

        local animstate = entity.get_animstate(ent)
        if not animstate then return end

        local max_delta = resolver.m_flMaxDelta(ent)
        local delta = entity.get_prop(ent, "m_angEyeAngles[1]")
        local speed = entity.get_prop(ent, "m_vecVelocity[0]")

        delta = math.angle_diff(delta, 0)
        local feet_yaw = max_delta

        local clamped_delta = math.clamp(delta, -feet_yaw, feet_yaw)
        local ang = entity.get_prop(ent, "m_angEyeAngles[1]") + clamped_delta

        local predicted_yaw = resolver.predict_yaw(ent, animstate.m_flGoalFeetYaw)
        local approach_delta = math.approach_angle(predicted_yaw, ang, math.max(0.5, math.abs(predicted_yaw - ang) / 10))
        animstate.m_flGoalFeetYaw = approach_delta

        if speed <= 0.1 then
            animstate.m_flGoalFeetYaw = ang
        end

        ::skip::
    end
end)
