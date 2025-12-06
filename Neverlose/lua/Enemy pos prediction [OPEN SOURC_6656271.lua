local esp_data = {}
local sim_ticks, net_data = {}, {}
local sidebar = ui.sidebar("\v box predict")

local function get_prediction_color(distance)
    if distance < 10 then return color(47, 117, 221, 255)
    elseif distance < 50 then return color(255, 165, 0, 255)
    else return color(255, 0, 0, 255) end
end

local group_ref = ui.create("visualization")
local enabled_ref = group_ref:switch("enable")
local show_box_ref = group_ref:switch("prediction Box", true)
local show_tb_ref = group_ref:switch("tickbase Indicator", true)
local always_box_ref = group_ref:switch("always Show Box", true)
local debug_ref = group_ref:switch("debug Line", false)
local text_color_ref = group_ref:color_picker("Text Color", color(255, 45, 45, 255))
local box_color_ref = group_ref:color_picker("Box Color", color(47, 117, 221, 255))
local prediction_strength_ref = group_ref:slider("Prediction Strength", 1, 16, 8, 1)

local function vector_subtract(a, b)
    if not a or not b then return vector(0, 0, 0) end
    return vector(a.x - b.x, a.y - b.y, a.z - b.z)
end

local function vector_add(a, b)
    if not a or not b then return vector(0, 0, 0) end
    return vector(a.x + b.x, a.y + b.y, a.z + b.z)
end

local function vector_length_2d(vec)
    if not vec then return 0 end
    return math.sqrt(vec.x * vec.x + vec.y * vec.y)
end

local function time_to_ticks(t)
    return math.floor(0.5 + (t / globals.tickinterval))
end

local function draw_3d_box(mins, maxs, col)
    if not mins or not maxs then return end
    
    local points = {
        vector(mins.x, mins.y, mins.z), vector(mins.x, maxs.y, mins.z),
        vector(maxs.x, maxs.y, mins.z), vector(maxs.x, mins.y, mins.z),
        vector(mins.x, mins.y, maxs.z), vector(mins.x, maxs.y, maxs.z),
        vector(maxs.x, maxs.y, maxs.z), vector(maxs.x, mins.y, maxs.z)
    }

    local edges = {
        {1, 2}, {2, 3}, {3, 4}, {4, 1}, 
        {5, 6}, {6, 7}, {7, 8}, {8, 5}, 
        {1, 5}, {2, 6}, {3, 7}, {4, 8}
    }

    for i = 1, #edges do
        local p1_idx, p2_idx = edges[i][1], edges[i][2]
        if points[p1_idx] and points[p2_idx] then
            local p1 = points[p1_idx]:to_screen()
            local p2 = points[p2_idx]:to_screen()
            if p1 and p2 then
                render.line(p1, p2, col)
            end
        end
    end
end

local function get_entities(enemy_only, alive_only)
    enemy_only = enemy_only ~= nil and enemy_only or false
    alive_only = alive_only ~= nil and alive_only or true
    
    local result = {}
    local player_resource = entity.get_player_resource()
    
    for player = 1, globals.max_players do
        local ent = entity.get(player)
        if ent then
            local is_enemy, is_alive = true, true
            
            if enemy_only and not ent:is_enemy() then is_enemy = false end
            if is_enemy then
                if alive_only and not ent:is_alive() then is_alive = false end
                if is_alive then table.insert(result, ent) end
            end
        end
    end

    return result
end

local function extrapolate(ent, origin, flags, ticks)
    if not ent or not origin then return origin end
    
    local tickinterval = globals.tickinterval
    local sv_gravity = cvar.sv_gravity:float() * tickinterval
    local sv_jump_impulse = cvar.sv_jump_impulse:float() * tickinterval

    local p_origin, prev_origin = origin, origin
    
    local vel_x, vel_y, vel_z = 0, 0, 0
    if ent.m_vecVelocity then
        vel_x = ent.m_vecVelocity.x or 0
        vel_y = ent.m_vecVelocity.y or 0
        vel_z = ent.m_vecVelocity.z or 0
    end
    
    local velocity = vector(vel_x, vel_y, vel_z)
    
    local on_ground = bit.band(flags or 0, 1) == 1
    local gravity = 0
    
    if not on_ground then
        gravity = velocity.z > 0 and -sv_gravity or -sv_gravity
    else
        gravity = velocity.z > 1 and sv_jump_impulse or 0
    end

    for i = 1, ticks do
        prev_origin = p_origin
        
        p_origin = vector(
            p_origin.x + (velocity.x * tickinterval),
            p_origin.y + (velocity.y * tickinterval),
            p_origin.z + (velocity.z + gravity) * tickinterval
        )
        
        if not on_ground then
            velocity.z = velocity.z + gravity
        end

        local trace = utils.trace_line(
            prev_origin, 
            p_origin,
            ent,
            nil,
            0x1
        )

        if trace.fraction < 1.0 then
            if trace.fraction > 0 then
                local hit_pos = vector(
                    prev_origin.x + (p_origin.x - prev_origin.x) * trace.fraction,
                    prev_origin.y + (p_origin.y - prev_origin.y) * trace.fraction,
                    prev_origin.z + (p_origin.z - prev_origin.z) * trace.fraction
                )
                
                return hit_pos
            end
            return prev_origin
        end
    end

    return p_origin
end

local function on_net_update()
    if not enabled_ref:get() then
        return
    end

    local me = entity.get_local_player()
    if not me or not me:is_alive() then
        return
    end

    local players = get_entities(true, true)
    local prediction_strength = prediction_strength_ref:get()

    for i = 1, #players do
        local idx = players[i]
        if not idx then goto continue end
        
        local player_idx = idx:get_index()
        local prev_tick = sim_ticks[player_idx]
        
        if idx:is_dormant() or not idx:is_alive() then
            sim_ticks[player_idx] = nil
            net_data[player_idx] = nil
            esp_data[player_idx] = nil
        else
            local player_origin = idx:get_origin()
            if not player_origin then goto continue end
            
            local sim_time = idx.m_flSimulationTime
            if not sim_time then goto continue end
            
            local simulation_time = time_to_ticks(sim_time)
    
            if prev_tick ~= nil then
                local delta = simulation_time - prev_tick.tick

                -- Always predict for non-fakelag players
                local force_predict = delta <= 1 or delta > 64

                if delta < 0 or (delta > 0 and delta <= 64) or force_predict then
                    local m_fFlags = idx.m_fFlags or 0

                    local diff_origin = vector_subtract(player_origin, prev_tick.origin)
                    local teleport_distance = vector_length_2d(diff_origin)

                    local ticks_to_predict = delta < 0 and 1 or delta
                    
                    local velocity_length = vector_length_2d(idx.m_vecVelocity or vector(0,0,0))
                    local normal_prediction_ticks = 2
                    
                    if velocity_length > 100 then
                        normal_prediction_ticks = math.min(prediction_strength, math.floor(velocity_length / 50))
                    end
                    
                    local normal_prediction = not (delta < 0) and not (teleport_distance > 64)
                    local final_prediction_ticks = force_predict and prediction_strength or 
                                                   (normal_prediction and normal_prediction_ticks or ticks_to_predict)
                    
                    local extrapolated = extrapolate(idx, player_origin, m_fFlags, final_prediction_ticks)
    
                    local is_tickbase = delta < 0
                    local is_fakelag = teleport_distance > 64
                    
                    -- Enhanced defensive peek detection
                    local velocity_mag = vector_length_2d(idx.m_vecVelocity or vector(0,0,0))
                    local rapid_direction_change = false
                    
                    if prev_tick.velocity then
                        local prev_vel = prev_tick.velocity
                        local curr_vel = idx.m_vecVelocity or vector(0,0,0)
                        
                        if prev_vel.x and prev_vel.y and curr_vel.x and curr_vel.y then
                            local dot = (prev_vel.x * curr_vel.x + prev_vel.y * curr_vel.y) / 
                                        (math.sqrt(prev_vel.x * prev_vel.x + prev_vel.y * prev_vel.y) * 
                                         math.sqrt(curr_vel.x * curr_vel.x + curr_vel.y * curr_vel.y) + 0.001)
                                         
                            rapid_direction_change = dot < 0.7 and velocity_mag > 150
                        end
                    end
                    
                    local is_defensive_peek = (is_fakelag or is_tickbase or force_predict) and rapid_direction_change
                    
                    if is_tickbase then
                        esp_data[player_idx] = 1
                    elseif is_fakelag and esp_data[player_idx] == 0 then
                        esp_data[player_idx] = 0.8
                    elseif is_defensive_peek or force_predict then
                        esp_data[player_idx] = 0.9
                    end

                    net_data[player_idx] = {
                        tick = final_prediction_ticks,
                        origin = player_origin,
                        predicted_origin = extrapolated,
                        tickbase = is_tickbase,
                        lagcomp = is_fakelag,
                        normal_prediction = normal_prediction,
                        defensive_peek = is_defensive_peek,
                        force_predict = force_predict
                    }
                end
            end
    
            if esp_data[player_idx] == nil then
                esp_data[player_idx] = 0
            end

            sim_ticks[player_idx] = {
                tick = simulation_time,
                origin = player_origin,
                velocity = idx.m_vecVelocity
            }
        end
        
        ::continue::
    end
end

local function on_paint()
    if not enabled_ref:get() then return end
    
    local box_color = box_color_ref:get()
    local me = entity.get_local_player()
    if not me or not me:is_alive() then return end

    local active_players = {}
    local observer_mode = me.m_iObserverMode or 0

    if observer_mode == 0 or observer_mode == 1 or observer_mode == 2 or observer_mode == 6 then
        active_players = get_entities(true, true)
    elseif observer_mode == 4 or observer_mode == 5 then
        local all_players = get_entities(false, true)
        local observer_target_handle = me.m_hObserverTarget
        local observer_target = nil
        
        if observer_target_handle then
            observer_target = entity.get(observer_target_handle)
        end
        
        if observer_target then
            local observer_target_team = observer_target.m_iTeamNum

            for i = 1, #all_players do
                local test_player = all_players[i]
                if test_player and test_player.m_iTeamNum ~= observer_target_team and test_player:get_index() ~= me:get_index() then
                    table.insert(active_players, test_player)
                end
            end
        end
    end

    if #active_players == 0 then return end

    for idx, player_net_data in pairs(net_data) do
        local ent = entity.get(idx)
        if not ent then goto continue end
        
        if ent:is_alive() and ent:is_enemy() and player_net_data ~= nil then
            local predicted_pos = player_net_data.predicted_origin
            if not predicted_pos then goto continue end
            
            local player_origin = ent:get_origin()
            if not player_origin then goto continue end
            
            local distance = player_origin:dist(predicted_pos)
            local adaptive_color = get_prediction_color(distance)
            
            if box_color.r ~= 47 or box_color.g ~= 117 or box_color.b ~= 221 then
                adaptive_color = box_color
            end
            
            -- Show prediction for more scenarios
            if show_box_ref:get() and (always_box_ref:get() or 
               player_net_data.lagcomp or 
               player_net_data.normal_prediction or 
               player_net_data.force_predict) then
                local min_vec = ent.m_vecMins
                local max_vec = ent.m_vecMaxs
                
                if not min_vec or not max_vec then goto continue end
                
                local mins = vector_add(vector(min_vec.x, min_vec.y, min_vec.z), predicted_pos)
                local maxs = vector_add(vector(max_vec.x, max_vec.y, max_vec.z), predicted_pos)
                
                draw_3d_box(mins, maxs, adaptive_color)
                
                if debug_ref:get() then
                    local origin = ent:get_origin()
                    if origin then
                        local origin_w2s = origin:to_screen()
                        local pred_w2s = predicted_pos:to_screen()
                        
                        if origin_w2s and pred_w2s then
                            render.line(origin_w2s, pred_w2s, color(255, 255, 0, 200))
                        end
                    end
                end
            end

            local text = {
                [0] = '', 
                [1] = 'LAG COMP',
                [2] = 'TICKBASE',
                [3] = 'PREDICTION',
                [4] = 'DEFENSIVE PEEK',
                [5] = 'FORCE PREDICT'
            }

            local bbox = ent:get_bbox()
            if bbox and bbox.pos1 and bbox.pos2 then
                local x1, y1, x2, y2, a = bbox.pos1.x, bbox.pos1.y, bbox.pos2.x, bbox.pos2.y, bbox.alpha or 255
                local palpha = 0

                if esp_data[idx] > 0 then
                    esp_data[idx] = esp_data[idx] - globals.frametime * 2
                    esp_data[idx] = esp_data[idx] < 0 and 0 or esp_data[idx]
                    palpha = esp_data[idx]
                end

                local tb = player_net_data.tickbase or esp_data[idx] > 0
                local lc = player_net_data.lagcomp
                local normal_pred = player_net_data.normal_prediction or false
                local def_peek = player_net_data.defensive_peek or false
                local force_pred = player_net_data.force_predict or false
                
                if (not tb and not lc and not normal_pred and not def_peek and not force_pred and not always_box_ref:get()) then
                    goto continue
                end
                
                if not tb or player_net_data.lagcomp then
                    palpha = a
                end

                if a > 0 then
                    local text_color = text_color_ref:get()
                    text_color.a = palpha * 255
                    
                    local name = ent:get_name() or ""
                    local y_add = name == '' and -8 or 0
                    
                    if tb and show_tb_ref:get() then
                        render.text(1, vector(x1 + (x2-x1)/2, y1 - 18 + y_add), text_color, "c", text[2])
                    end
                    
                    if lc and show_box_ref:get() then
                        render.text(1, vector(x1 + (x2-x1)/2, y1 - 28 + y_add), text_color, "c", text[1])
                    end
                    
                    if normal_pred and show_box_ref:get() and not def_peek then
                        render.text(1, vector(x1 + (x2-x1)/2, y1 - 28 + y_add), text_color, "c", text[3])
                    end
                    
                    if def_peek and show_box_ref:get() then
                        -- Make defensive peek warning more visible (pulsing effect)
                        local pulse = (math.sin(globals.realtime * 5) * 0.5 + 0.5) * 255
                        local alert_color = color(255, 20, 20, pulse)
                        render.text(1, vector(x1 + (x2-x1)/2, y1 - 28 + y_add), alert_color, "c", text[4])
                    end
                    
                    if force_pred and show_box_ref:get() then
                        -- Distinct color for force prediction
                        local force_pred_color = color(0, 255, 0, text_color.a)
                        render.text(1, vector(x1 + (x2-x1)/2, y1 - 28 + y_add), force_pred_color, "c", text[5])
                    end
                    
                    if show_box_ref:get() and distance > 5 then
                        render.text(1, vector(x1 + (x2-x1)/2, y1 - 38 + y_add), text_color, "c", 
                            string.format("Pred: %.1f", distance))
                    end
                end
            end
        end
        
        ::continue::
    end
end

events.net_update_end:set(on_net_update)
events.render:set(on_paint)

events.shutdown:set(function()
    esp_data = {}
    sim_ticks = {}
    net_data = {}
end)