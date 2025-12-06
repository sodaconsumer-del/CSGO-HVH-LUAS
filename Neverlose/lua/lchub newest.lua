-- filename: LCHub.lua
-- version: LuaJIT2
-- line: [0, 0] id: 0
local gradient_lib = nil
local require_gradient = require("neverlose/gradient")
local local_player = entity.get_local_player()
local sv_maxusrcmdprocessticks = cvar.sv_maxusrcmdprocessticks
local is_force_defensive = false
local defensive_tick = 0
local last_velocity = 0
local ui_main = ui.create("LCHub", "Start breaking cheats")
local combo_mode = ui_main:combo("\u{e003}", {
    nil,
    "\u{e00d} Home",
    "\u{e2a1} ForwardTrack",
    "\u{e441} BackTrack"
})
local label_ping = ui_main:label("Make impossible to predict u with >15 ping")
local switch_forwardtrack = ui_main:switch("\u{e2a1}  ForwardTrack Abuse")
local switch_backtrack = ui_main:switch("\u{e441} BackTrack")
local switch_2d_indicator = ui_main:switch("\u{e014} 2D Indicator")
pcall(function()
    switch_2d_indicator:tooltip("Show 2D indicators")
end)
local switch_3d_indicator = ui_main:switch("\u{e014} 3D Indicator")
pcall(function()
    switch_3d_indicator:tooltip("Show 3D indicators")
end)
switch_3d_indicator:visibility(false)
switch_2d_indicator:visibility(false)
local switch_ping_warning = ui_main:switch("\u{e16f} Ping Warning ESP")
pcall(function()
    switch_ping_warning:tooltip("Show ESP warning if enemy can fix you")
end)
switch_ping_warning:visibility(false)
local switch_lagcomp_box = ui_main:switch("\u{e19b} Lagcomp box")
pcall(function()
    switch_lagcomp_box:tooltip("OnShot Lagcomp Box")
end)
switch_lagcomp_box:visibility(false)
local label_spacer = ui_main:label(" ")
local button_discord = ui_main:button("\u{e1cd} Check Our Discord")
local discord_url = "https://discord.gg/8pkS8q9XFA"
button_discord:set_callback(function()
    if panorama and panorama.SteamOverlayAPI and panorama.SteamOverlayAPI.OpenExternalBrowserURL then
        panorama.SteamOverlayAPI.OpenExternalBrowserURL(discord_url)
    elseif client and client.open_url then
        client.open_url(discord_url)
    end
end)
local switch_crossing = ui_main:switch("\u{e171} Crossing")
pcall(function()
    switch_crossing:tooltip("use against gamesense/skeet")
end)
local label_backtrack = ui_main:label("Make impossible to hit your backtrack")
local switch_airlag = ui_main:switch("\u{e08b} AirLag")
pcall(function()
    switch_airlag:tooltip("use against neverlose/primo")
end)
local switch_neo_mode = ui_main:switch("\u{e09e} NEO mode")
pcall(function()
    switch_neo_mode:tooltip("funny flick")
end)

local function show_home_ui()
    label_spacer:visibility(true)
    button_discord:visibility(true)
    switch_2d_indicator:visibility(true)
    switch_3d_indicator:visibility(true)
    switch_ping_warning:visibility(true)
    switch_lagcomp_box:visibility(true)
    label_ping:visibility(false)
    switch_crossing:visibility(false)
    label_backtrack:visibility(false)
    switch_airlag:visibility(false)
    switch_neo_mode:visibility(false)
end

switch_forwardtrack:visibility(false)
switch_backtrack:visibility(false)

local function show_forwardtrack_ui()
    switch_2d_indicator:visibility(false)
    label_spacer:visibility(false)
    button_discord:visibility(false)
    switch_3d_indicator:visibility(false)
    switch_ping_warning:visibility(false)
    switch_lagcomp_box:visibility(false)
    switch_crossing:visibility(true)
    label_ping:visibility(true)
    label_backtrack:visibility(false)
    switch_airlag:visibility(false)
    switch_neo_mode:visibility(true)
end

local function show_backtrack_ui()
    switch_2d_indicator:visibility(false)
    label_spacer:visibility(false)
    button_discord:visibility(false)
    switch_3d_indicator:visibility(false)
    switch_ping_warning:visibility(false)
    switch_lagcomp_box:visibility(false)
    label_ping:visibility(false)
    switch_crossing:visibility(false)
    label_backtrack:visibility(true)
    switch_airlag:visibility(true)
    switch_neo_mode:visibility(true)
end

local function get_combo_index(combo)
    local value = combo:get()
    if type(value) == "number" then
        return value
    end
    local list = combo:list()
    if not list then
        list = {}
    end
    for index, item in ipairs(list) do
        if item == value then
            return index
        end
    end
    return 1
end

local function update_ui_visibility()
    local mode_index = get_combo_index(combo_mode)
    if mode_index == 1 then
        show_home_ui()
    elseif mode_index == 2 then
        show_forwardtrack_ui()
        switch_neo_mode:visibility(true)
    else
        show_backtrack_ui()
        switch_neo_mode:visibility(true)
    end
end

combo_mode:set_callback(function()
    update_ui_visibility()
end, true)
update_ui_visibility()

switch_crossing:set_callback(function()
    local state = switch_crossing:get()
    switch_forwardtrack:set(state)
    switch_forwardtrack:override(state)
end, true)

switch_airlag:set_callback(function()
    local state = switch_airlag:get()
    switch_backtrack:set(state)
    switch_backtrack:override(state)
end, true)

local min_ping = 15
local max_ping = 100
local extreme_ping = 250

local function get_player_ping(player)
    if not player or not player:is_player() then
        return nil
    end
    
    local player_resource = entity.get_player_resource()
    if not player_resource then
        return nil
    end
    
    local player_index = player:get_index()
    local player_info = player:get_player_info()
    local userid = player_info and player_info.userid
    
    local ping_properties = {
        "m_iPing",
        "m_iPlayerPing",
        "m_iPings",
        "m_iPingMS"
    }
    
    local function try_get_ping(prop_name, index)
        local success, value = pcall(function()
            if index ~= nil then
                return player_resource[prop_name][index]
            end
            return player_resource[prop_name]
        end)
        if success and type(value) == "number" and value > 0 then
            return value
        end
        return nil
    end
    
    for _, prop in ipairs(ping_properties) do
        local ping = try_get_ping(prop, player_index)
        if ping then return ping end
    end
    
    if userid then
        for _, prop in ipairs(ping_properties) do
            local ping = try_get_ping(prop, userid)
            if ping then return ping end
        end
    end
    
    for _, prop in ipairs(ping_properties) do
        local ping = try_get_ping(prop)
        if ping then return ping end
    end
    
    local success, properties = pcall(function()
        local props = {}
        for prop_name, _ in pairs(player_resource) do
            table.insert(props, prop_name)
        end
        return props
    end)
    
    if success then
        for _, prop in ipairs(properties) do
            local ping = try_get_ping(prop, player_index)
            if ping then return ping end
            
            if userid then
                ping = try_get_ping(prop, userid)
                if ping then return ping end
            end
        end
    end
    
    return nil
end

local ping_warning_esp = esp.enemy:new_text("Ping Warning", "!", function(enemy)
    if not switch_ping_warning:get() then
        return 
    end
    
    local ping = get_player_ping(enemy)
    if not ping then
        return 
    end
    
    if ping < min_ping or (ping >= max_ping and ping <= extreme_ping) then
        return "Risk"
    end
end)

switch_ping_warning:set_callback(function()
    ping_warning_esp:set(switch_ping_warning:get())
end, true)

local indicator_duration = 1.1
local indicator_distance = 28
local indicator_pulse_rate = 6
local indicator_radius = 7
local indicator_label_distance = 4096
local indicator_start_pos = nil
local indicator_end_time = 0
local indicator_end_pos = nil

local function get_distance_2d(pos1, pos2)
    local dx = pos1.x - pos2.x
    local dy = pos1.y - pos2.y
    return math.sqrt(dx * dx + dy * dy)
end

events.render:set(function()
    local gradient_text = require_gradient.text_animate("LCHub", -2, {
        ui.get_style("Link Active"),
        color(255, 255, 255)
    })
    gradient_text:animate()
    ui.sidebar(gradient_text:get_animated_text(), "\u{e13a}")
    
    if not switch_3d_indicator:get() and not switch_2d_indicator:get() then
        indicator_end_pos = nil
        indicator_end_time = 0
        indicator_start_pos = nil
        return 
    end
    
    local player = entity.get_local_player()
    if not player or player.m_iHealth <= 0 then
        indicator_end_pos = nil
        return 
    end
    
    if switch_3d_indicator:get() then
        local origin = player.m_vecOrigin
        if not origin then
            return 
        end
        
        local is_abusing = switch_forwardtrack:get() or switch_backtrack:get()
        
        if is_abusing and indicator_end_pos and get_distance_2d(origin, indicator_end_pos) >= indicator_distance then
            indicator_start_pos = vector(indicator_end_pos.x, indicator_end_pos.y, indicator_end_pos.z)
            indicator_end_pos = vector(origin.x, origin.y, origin.z)
            indicator_end_time = globals.realtime + indicator_duration
        end
        
        indicator_end_pos = vector(origin.x, origin.y, origin.z)
        
        if indicator_end_time < globals.realtime then
            return 
        end
        
        local alpha = math.floor(((math.sin(globals.realtime * 2 * math.pi * indicator_pulse_rate) * 0.5 + 0.5 - 1) * 0.75 + 0.25) * 255 + 0.5)
        local r, g, b = 200, 200, 200
        
        if switch_backtrack:get() then
            r, g, b = 40, 40, 255
        end
        
        if indicator_start_pos then
            render.circle_3d(indicator_start_pos, color(r, g, b, alpha), indicator_radius, 0, 1)
        end
        
        if indicator_end_pos then
            render.circle_3d(indicator_end_pos, color(255, 255, 255, 255), indicator_radius, 0, 1)
        end
        
        local start_screen = indicator_start_pos and render.world_to_screen(indicator_start_pos)
        local end_screen = indicator_end_pos and render.world_to_screen(indicator_end_pos)
        
        if start_screen and end_screen and switch_backtrack:get() then
            local dx = indicator_end_pos.x - indicator_start_pos.x
            local dy = indicator_end_pos.y - indicator_start_pos.y
            
            if indicator_label_distance <= dx * dx + dy * dy then
                local screen_dx = end_screen.x - start_screen.x
                local screen_dy = end_screen.y - start_screen.y
                local screen_dist = math.max(1, math.sqrt(screen_dx * screen_dx + screen_dy * screen_dy))
                
                local center_pos = vector(
                    (start_screen.x + end_screen.x) * 0.5 + screen_dy / screen_dist * 8,
                    (start_screen.y + end_screen.y) * 0.5 + -screen_dx / screen_dist * 8,
                    0
                )
                
                local label_text = "LC"
                render.text(4, center_pos + vector(1, 1, 0), color(0, 0, 0, 200), "c", label_text)
                render.text(4, center_pos, color(255, 255, 255, 255), "c", label_text)
            end
        end
    end
    
    if switch_2d_indicator:get() then
        local player = entity.get_local_player()
        if not player or player.m_iHealth <= 0 then
            return 
        end
        
        local screen_size = render.screen_size()
        local scale = render.get_scale and render.get_scale(1) or 1
        
        local bar_width = scale * 200
        local bar_height = scale * 7
        local bar_x = screen_size.x * 0.5 - bar_width * 0.5
        local bar_y = screen_size.y - scale * 18
        
        local is_active = defensive_tick >= globals.tickcount and 1 or 0
        last_velocity = last_velocity + (is_active - last_velocity) * 0.2
        
        local bar_start = vector(bar_x, bar_y)
        local bar_end = vector(bar_x + bar_width, bar_y + bar_height)
        
        render.rect(bar_start, bar_end, color(20, 20, 20, 200), 4)
        render.rect_outline(bar_start, bar_end, color(220, 220, 220, 230), 1, 4)
        
        if last_velocity > 0.01 then
            render.push_clip_rect(bar_start, vector(bar_x + bar_width * last_velocity, bar_y + bar_height))
            
            local pulse = math.sin(globals.tickcount % 100 / 100 * math.pi * 2) * 25 + 35
            local color_start = color(255, 255, 255, 255)
            local color_end = color(pulse + 200, pulse + 200, pulse + 200, 255)
            
            render.gradient(bar_start, bar_end, color_start, color_end, color_end, color_start, 4)
            render.pop_clip_rect()
        end
        
        local velocity = player.m_vecVelocity or vector(0, 0, 0)
        local speed = velocity:length2d()
        
        if speed > 275 and (switch_forwardtrack:get() or (speed > 275 and switch_backtrack:get())) then
            render.text(4, vector(bar_x + bar_width / 2, bar_y - 13), color(255, 255, 255), "cs", "Ideal Crossing")
        end
    end
end)

local box_width = 8
local box_height = 8
local box_depth = 30
local box_duration = 1
local max_boxes = 3
local max_box_distance = 3596

local function clamp(value)
    if value < 0 then
        return 0
    elseif value > 1 then
        return 1
    else
        return value
    end
end

local function draw_box_3d(center, width, height, depth, alpha)
    local corners = {
        vector(center.x - width, center.y - height, center.z - depth),
        vector(center.x + width, center.y - height, center.z - depth),
        vector(center.x + width, center.y + height, center.z - depth),
        vector(center.x - width, center.y + height, center.z - depth),
        vector(center.x - width, center.y - height, center.z + depth),
        vector(center.x + width, center.y - height, center.z + depth),
        vector(center.x + width, center.y + height, center.z + depth),
        vector(center.x - width, center.y + height, center.z + depth)
    }
    
    local edges = {
        {1, 2}, {2, 3}, {3, 4}, {4, 1},
        {5, 6}, {6, 7}, {7, 8}, {8, 5},
        {1, 5}, {2, 6}, {3, 7}, {4, 8}
    }
    
    for _, edge in ipairs(edges) do
        local start_pos = render.world_to_screen(corners[edge[1]])
        local end_pos = render.world_to_screen(corners[edge[2]])
        
        if start_pos and end_pos then
            render.line(start_pos, end_pos, color(150, 150, 150, alpha))
        end
    end
end

local bullet_impacts = {}
local lagcomp_boxes = {}

events.bullet_fire:set(function(event)
    if not switch_lagcomp_box:get() then
        return 
    end
    
    local player = entity.get_local_player()
    if not player then
        return 
    end
    
    local attacker = event.entity
    if not attacker or attacker == player or not attacker:is_enemy() then
        return 
    end
    
    local eye_pos = attacker:get_eye_position()
    if not eye_pos then
        eye_pos = attacker:get_origin() or event.origin
    end
    
    if not eye_pos then
        return 
    end
    
    bullet_impacts[attacker:get_index()] = {
        best_dist = 0,
        eye = vector(eye_pos.x, eye_pos.y, eye_pos.z),
        expire = globals.realtime + 0.12,
    }
end)

events.bullet_impact:set(function(event)
    if not switch_lagcomp_box:get() then
        return 
    end
    
    local player = entity.get_local_player()
    if not player then
        return 
    end
    
    local attacker = entity.get(event.userid, true)
    if not attacker or attacker == player or not attacker:is_enemy() then
        return 
    end
    
    local attacker_index = attacker:get_index()
    local impact_data = bullet_impacts[attacker_index]
    
    if not impact_data then
        local eye_pos = attacker:get_eye_position() or attacker:get_origin()
        if not eye_pos then
            return 
        end
        
        impact_data = {
            best_dist = 0,
            eye = vector(eye_pos.x, eye_pos.y, eye_pos.z),
            expire = globals.realtime + 0.1,
        }
        bullet_impacts[attacker_index] = impact_data
    end
    
    local impact_pos = vector(event.x or 0, event.y or 0, event.z or 0)
    local dx = impact_pos.x - impact_data.eye.x
    local dy = impact_pos.y - impact_data.eye.y
    local dz = impact_pos.z - impact_data.eye.z
    local distance = math.sqrt(dx * dx + dy * dy + dz * dz)
    
    if (impact_data.best_dist or 0) <= distance then
        impact_data.best_dist = distance
        impact_data.best = impact_pos
    end
    
    impact_data.expire = globals.realtime + 0.06
end)

local function process_bullet_impact(attacker_index)
    local impact_data = bullet_impacts[attacker_index]
    if not impact_data or not impact_data.best then
        return 
    end
    
    local player = entity.get_local_player()
    if not player then
        bullet_impacts[attacker_index] = nil
        return 
    end
    
    local player_origin = player.m_vecOrigin or player:get_origin()
    local player_velocity = player.m_vecVelocity or vector(0, 0, 0)
    
    local impact_dir = vector(
        impact_data.best.x - impact_data.eye.x,
        impact_data.best.y - impact_data.eye.y,
        impact_data.best.z - impact_data.eye.z
    )
    
    local impact_dir_len_sqr = impact_dir.x * impact_dir.x + impact_dir.y * impact_dir.y + impact_dir.z * impact_dir.z
    local projected_pos = impact_data.best
    
    if impact_dir_len_sqr > 0.000001 then
        local player_dir = vector(
            player_origin.x - impact_data.eye.x,
            player_origin.y - impact_data.eye.y,
            player_origin.z - impact_data.eye.z
        )
        
        local t = clamp((player_dir.x * impact_dir.x + player_dir.y * impact_dir.y + player_dir.z * impact_dir.z) / impact_dir_len_sqr)
        projected_pos = vector(
            impact_data.eye.x + impact_dir.x * t,
            impact_data.eye.y + impact_dir.y * t,
            impact_data.eye.z + impact_dir.z * t
        )
    end
    
    local dx = projected_pos.x - player_origin.x
    local dy = projected_pos.y - player_origin.y
    local dz = projected_pos.z - player_origin.z
    
    if max_box_distance * max_box_distance < dx * dx + dy * dy + dz * dz then
        bullet_impacts[attacker_index] = nil
        return 
    end
    
    local vel_x = player_velocity.x
    local vel_y = player_velocity.y
    local speed = math.sqrt(vel_x * vel_x + vel_y * vel_y)
    local time_to_hit = 0
    
    if speed > 0.000001 then
        time_to_hit = ((projected_pos.x - player_origin.x) * vel_x / speed + (projected_pos.y - player_origin.y) * vel_y / speed) / speed * 2.2
    end
    
    if time_to_hit > 2 then
        bullet_impacts[attacker_index] = nil
        return 
    end
    
    table.insert(lagcomp_boxes, {
        t = globals.realtime,
        center = projected_pos,
        secs = time_to_hit,
    })
    
    if #lagcomp_boxes > max_boxes then
        table.remove(lagcomp_boxes, 1)
    end
    
    bullet_impacts[attacker_index] = nil
end

events.render:set(function()
    if not switch_lagcomp_box:get() then
        return 
    end
    
    local current_time = globals.realtime
    
    for index, impact_data in pairs(bullet_impacts) do
        if impact_data.expire <= current_time then
            process_bullet_impact(index)
        end
    end
    
    if not lagcomp_boxes[1] then
        return 
    end
    
    for i = #lagcomp_boxes, 1, -1 do
        local box = lagcomp_boxes[i]
        local time_passed = current_time - box.t
        
        if box_duration < time_passed then
            table.remove(lagcomp_boxes, i)
        else
            local alpha = math.floor((time_passed / box_duration - 1) * 255 + 0.5)
            draw_box_3d(box.center, box_width, box_height, box_depth, math.min(alpha, 220))
            
            local screen_pos = render.world_to_screen(box.center)
            if screen_pos then
                local time_text = string.format("%.2fs", box.secs or 0)
                render.text(4, screen_pos + vector(0, -14, 0), color(0, 0, 0, alpha), "c", time_text)
                render.text(4, screen_pos + vector(0, -15, 0), color(255, 255, 255, alpha), "c", time_text)
            end
        end
    end
end)

local yaw_speed = 4
local current_yaw = -360

local function get_next_yaw()
    current_yaw = current_yaw + yaw_speed
    if current_yaw > 180 then
        current_yaw = current_yaw - 360
    end
    return current_yaw
end

local function handle_neo_mode(cmd)
    if not switch_neo_mode:get() then
        ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"):override(true)
        return 
    end
    
    if (switch_forwardtrack:get() and cmd.in_jump) or (switch_backtrack:get() and cmd.in_jump) then
        ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"):override(false)
    else
        ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"):override()
        return 
    end
    
    local random_pitch = utils.random_float and utils.random_float(-89, 89) or 0
    cmd.view_angles.x = math.clamp(random_pitch, -67, 36)
    cmd.view_angles.y = get_next_yaw()
end

function handle_forwardtrack(cmd)
    if switch_forwardtrack:get() and not switch_backtrack:get() and cmd.in_jump then
        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("On Peek")
        ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override(1)
        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(0)
        ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override(true)
        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"):override(false)
        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override(1)
        ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"):override(0)
        ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):override(false)
        ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):override(false)
        
        if not entity.get_local_player() then
            return 
        end
        
        sv_maxusrcmdprocessticks:int(19)
        
        if cmd.in_jump then
            if globals.tickcount % 4 == 0 then
                rage.exploit:force_teleport()
                rage.exploit:allow_charge(false)
                cmd.force_defensive = false
                is_force_defensive = false
            else
                rage.exploit:allow_charge(true)
                rage.exploit:force_charge()
                cmd.force_defensive = true
                is_force_defensive = true
                defensive_tick = globals.tickcount + 2
            end
            
            if globals.tickcount % 10 == 0 then
                rage.exploit:force_teleport()
                rage.exploit:allow_charge(false)
                cmd.force_defensive = false
                is_force_defensive = false
            else
                rage.exploit:allow_charge(true)
                rage.exploit:force_charge()
                cmd.force_defensive = true
                is_force_defensive = true
                defensive_tick = globals.tickcount + 2
            end
        end
    else
        ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override()
        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override()
        ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override()
        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"):override()
        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override()
        ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"):override()
        ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):override(true)
        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):override()
        ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):override()
    end
end

function handle_airlag(cmd)
    if switch_backtrack:get() and not switch_forwardtrack:get() then
        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(0)
        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("On Peek")
        ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override(17)
        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(0)
        ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override(true)
        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"):override(false)
        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override(1)
        ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"):override(0)
        ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):override(false)
        ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):override(false)
        
        if not entity.get_local_player() then
            return 
        end
        
        if cmd.in_jump then
            if globals.tickcount % 2 == 1 then
                sv_maxusrcmdprocessticks:int(16)
                ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):override(true)
            else
                sv_maxusrcmdprocessticks:int(19)
                ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):override(false)
                defensive_tick = globals.tickcount + 2
            end
        else
            ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):override()
            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):override()
        end
    end
end

events.createmove:set(function(cmd)
    handle_neo_mode(cmd)
    handle_forwardtrack(cmd)
    handle_airlag(cmd)
    
    if not switch_forwardtrack:get() and not switch_backtrack:get() then
        sv_maxusrcmdprocessticks:int(16)
        ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):override()
        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override()
        ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):override()
        ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override()
        ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override()
        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override()
        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override()
        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"):override()
        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override()
        ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"):override()
        ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):override()
        ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):override()
    end
end)

local notification_max_count = 4
local notification_duration = 4
local notification_fade_in = 1
local notification_fade_out = 0.35
local notification_stay = 0.5
local notification_width = 300
local notification_height = 44
local notification_spacing = 8
local notification_bg_color = color(16, 16, 20, 220)
local notification_gradient_color = color(28, 28, 32, 220)
local notification_title_color = color(240, 240, 245, 255)
local notification_sub_color = color(200, 200, 205, 240)
local notification_safe_color = color(80, 200, 120, 255)
local notification_risk_color = color(255, 80, 80, 255)
local notification_font = 4

local function is_risky_ping(ping)
    return ping and (ping >= min_ping or (ping >= max_ping and ping <= extreme_ping))
end

local function get_player_ping_simple(player)
    local player_resource = entity.get_player_resource()
    if not player_resource or not player then
        return nil
    end
    
    local player_index = player:get_index()
    local success, ping = pcall(function()
        return player_resource.m_iPing[player_index]
    end)
    
    if success and type(ping) == "number" then
        return ping
    end
    
    return tonumber(player_resource.m_iPing)
end

local notifications = {}

local function add_notification(title, subtitle, color)
    table.insert(notifications, 1, {
        title = title,
        sub = subtitle,
        col = color,
        t_start = globals.realtime,
    })
    
    while #notifications > notification_max_count do
        table.remove(notifications)
    end
end

events.player_death:set(function(event)
    local player = entity.get_local_player()
    if not player then
        return 
    end
    
    if entity.get(event.userid, true) ~= player then
        return 
    end
    
    local attacker = entity.get(event.attacker, true)
    local attacker_name = attacker and attacker:get_name() or "World"
    local attacker_ping = attacker and get_player_ping_simple(attacker)
    local is_risky = is_risky_ping(attacker_ping)
    
    local ping_text = attacker_ping and (tostring(math.floor(attacker_ping + 0.5)) .. " ms") or "N/A"
    local title = ("Killed By %s"):format(attacker_name)
    local subtitle = ("Ping %s (%s)"):format(ping_text, is_risky and "unsafe" or "safe")
    
    add_notification(title, subtitle, is_risky and notification_risk_color or notification_safe_color)
end)

events.render:set(function()
    if switch_ping_warning:get() then
        if not notifications then
            return 
        end
        
        local screen_size = render.screen_size()
        local scale = render.get_scale and render.get_scale(1) or 1
        
        local notif_width = notification_width * scale
        local notif_height = notification_height * scale
        local notif_spacing = notification_spacing * scale
        local notif_x = screen_size.x * 0.5 - notif_width * 0.5
        local notif_y = screen_size.y - notif_height - scale * 50
        
        for i = #notifications, 1, -1 do
            local notif = notifications[i]
            local time_passed = globals.realtime - notif.t_start
            
            if notification_duration <= time_passed then
                table.remove(notifications, i)
            else
                local alpha = 1
                if time_passed < notification_fade_in then
                    alpha = time_passed / notification_fade_in
                else
                    local time_remaining = notification_duration - time_passed
                    if time_remaining < notification_fade_out then
                        alpha = time_remaining / notification_fade_out
                    end
                end
                
                local slide_progress = math.min(1, time_passed / notification_stay)
                local current_x = notif_x
                local current_y = notif_y - (i - 1) * (notif_height + notif_spacing) + (slide_progress - 1) * notif_height * scale
                
                local bg_alpha = math.floor(alpha * 220 + 0.5)
                
                render.rect(vector(current_x, current_y), vector(current_x + notif_width, current_y + notif_height), 
                           color(notification_bg_color.r, notification_bg_color.g, notification_bg_color.b, bg_alpha), 6)
                
                render.gradient(vector(current_x, current_y), vector(current_x + notif_width, current_y + notif_height),
                              color(notification_gradient_color.r, notification_gradient_color.g, notification_gradient_color.b, bg_alpha),
                              color(notification_bg_color.r, notification_bg_color.g, notification_bg_color.b, bg_alpha),
                              color(notification_bg_color.r, notification_bg_color.g, notification_bg_color.b, bg_alpha),
                              color(notification_gradient_color.r, notification_gradient_color.g, notification_gradient_color.b, bg_alpha), 6)
                
                render.rect(vector(current_x, current_y), vector(current_x + scale * 4, current_y + notif_height),
                           color(notif.col.r, notif.col.g, notif.col.b, math.floor(alpha * 255)))
                
                render.text(notification_font, vector(current_x + scale * 10, current_y + scale * 8),
                           color(notification_title_color.r, notification_title_color.g, notification_title_color.b, math.floor(alpha * 255)), "l", notif.title)
                
                render.text(notification_font, vector(current_x + scale * 10, current_y + scale * 24),
                           color(notification_sub_color.r, notification_sub_color.g, notification_sub_color.b, math.floor(alpha * 230)), "l", notif.sub)
            end
        end
    end
end)