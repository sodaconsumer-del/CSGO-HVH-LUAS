group_ref = ui.find("Visuals", "Players", "Enemies", "ESP");
enable_sound = group_ref:switch("Sound ESP", false);
group_sound = enable_sound:create();
sound_color = group_sound:color_picker("Sound Color", color(255, 255, 255));
sound_custom = group_sound:switch("Sound Customization", false);
custom_life = group_sound:slider("Lifetime", 1, 10, 2);
custom_radious = group_sound:slider("Radious", 1, 10, 2);
custom_width = group_sound:slider("Width", 1, 10, 2);
custom_walls = group_sound:switch("Show Through Walls", false);
ui.find("Visuals", "Players", "Enemies", "ESP", "Sounds"):set(false);
ui.find("Visuals", "Players", "Enemies", "ESP", "Sounds"):visibility(false);
group_ref2 = ui.find("Visuals", "Players", "Teammates", "ESP");
enable_sound2 = group_ref2:switch("Sound ESP", false);
group_sound2 = enable_sound2:create();
sound_color2 = group_sound2:color_picker("Sound Color", color(255, 255, 255));
sound_custom2 = group_sound2:switch("Sound Customization", false);
custom_life2 = group_sound2:slider("Lifetime", 1, 10, 2);
custom_radious2 = group_sound2:slider("Radious", 1, 10, 2);
custom_width2 = group_sound2:slider("Width", 1, 10, 2);
custom_walls2 = group_sound2:switch("Show Through Walls", false);
ui.find("Visuals", "Players", "Teammates", "ESP", "Sounds"):set(false);
ui.find("Visuals", "Players", "Teammates", "ESP", "Sounds"):visibility(false);
ui_callback = function()
    custom_life:visibility(sound_custom:get() and true or false);
    custom_radious:visibility(sound_custom:get() and true or false);
    custom_width:visibility(sound_custom:get() and true or false);
    custom_walls:visibility(sound_custom:get() and true or false);
    custom_life2:visibility(sound_custom2:get() and true or false);
    custom_radious2:visibility(sound_custom2:get() and true or false);
    custom_width2:visibility(sound_custom2:get() and true or false);
    custom_walls2:visibility(sound_custom2:get() and true or false);
end;
ui_callback();
sound_custom:set_callback(ui_callback);
sound_custom2:set_callback(ui_callback);
beams = require("neverlose/beams");
GetEnemies = function()
    local v0 = {};
    for _, v2 in pairs(entity.get_players(true)) do
        if v2:is_enemy() then
            table.insert(v0, entity.get(v2));
        end;
    end;
    return v0;
end;
GetTeammates = function()
    local v3 = {};
    for _, v5 in pairs(entity.get_players()) do
        if not v5:is_enemy() and v5 ~= entity.get_local_player() then
            table.insert(v3, entity.get(v5));
        end;
    end;
    return v3;
end;
in_air = function(v6)
    if entity.get_local_player() == nil then
        return;
    else
        local l_m_fFlags_0 = v6.m_fFlags;
        if bit.band(l_m_fFlags_0, 1) == 0 then
            return true;
        else
            return false;
        end;
    end;
end;
lerp = function(v8, v9, v10)
    return v9 * (1 - v8) + v10 * v8;
end;
setignorez = function(v11)
    if v11 == true then
        for _, v13 in ipairs(materials.get_materials("sprites/purplelaser1")) do
            v13:var_flag(15, true);
        end;
    else
        for _, v15 in ipairs(materials.get_materials("sprites/purplelaser1")) do
            v15:var_flag(15, false);
        end;
    end;
end;
draw_sound_beam = function(v16, v17)
    beams.m_nType = 7;
    beams.m_pszModelName = "sprites/purplelaser1.vmt";
    beams.m_nModelIndex = -1;
    beams.m_pszHaloName = "sprites/purplelaser1.vmt";
    beams.m_nHaloIndex = -1;
    beams.m_flHaloScale = 5;
    beams.m_flFadeLength = 1;
    beams.m_flAmplitude = 0;
    beams.m_flSpeed = 0;
    beams.m_nStartFrame = 3;
    beams.m_flFrameRate = 5;
    beams.m_nSegments = 0;
    beams.m_bRenderable = true;
    beams.m_color = v17 == 1 and sound_color:get() or sound_color2:get();
    beams.m_nFlags = 0;
    beams.m_vecCenter = v16 + vector(0, 0, 10);
    beams.m_flStartRadius = 30;
    if v17 == 1 then
        if sound_custom:get() then
            beams.m_flLife = custom_life:get() / 10 + 0.5;
            beams.m_flEndRadius = custom_radious:get() * 100 + 200;
            beams.m_flWidth = custom_width:get() + 5;
            if custom_walls:get() then
                setignorez(true);
            else
                setignorez(false);
            end;
        else
            beams.m_flLife = 0.7;
            beams.m_flEndRadius = 600;
            beams.m_flWidth = 12;
            setignorez(false);
        end;
    elseif sound_custom2:get() then
        beams.m_flLife = custom_life2:get() / 10 + 0.5;
        beams.m_flEndRadius = custom_radious2:get() * 100 + 200;
        beams.m_flWidth = custom_width2:get() + 5;
        if custom_walls2:get() then
            setignorez(true);
        else
            setignorez(false);
        end;
    else
        beams.m_flLife = 0.7;
        beams.m_flEndRadius = 600;
        beams.m_flWidth = 12;
        setignorez(false);
    end;
    beams.create_beam_ring_point();
end;
local v18 = {};
for v19 = 0, 64 do
    v18[v19] = {
        stop_per_player = 0
    };
end;
local function v29(v20)
    -- upvalues: v18 (ref)
    if enable_sound:get() then
        for v21, v22 in pairs(GetEnemies()) do
            if not v22:is_dormant() and v22:is_alive() then
                local _ = v22.m_fFlags;
                local l_m_vecOrigin_0 = v22.m_vecOrigin;
                if v22.m_flLastMadeNoiseTime + 1 >= globals.curtime and v18[v21].stop_per_player == 0 then
                    if v20 == 1 and in_air(v22) then
                        return;
                    else
                        v18[v21].stop_per_player = globals.tickcount;
                        draw_sound_beam(l_m_vecOrigin_0, 1);
                    end;
                end;
                if globals.tickcount > v18[v21].stop_per_player + 64 then
                    v18[v21].stop_per_player = 0;
                end;
            end;
        end;
    end;
    if enable_sound2:get() then
        for v25, v26 in pairs(GetTeammates()) do
            if not v26:is_dormant() and v26:is_alive() then
                local _ = Enemy.m_fFlags;
                local l_m_vecOrigin_1 = v26.m_vecOrigin;
                if v26.m_flLastMadeNoiseTime + 1 >= globals.curtime and v18[v25].stop_per_player == 0 then
                    if v20 == 1 and in_air(Enemy) then
                        return;
                    else
                        v18[v25].stop_per_player = globals.tickcount;
                        draw_sound_beam(l_m_vecOrigin_1, 0);
                    end;
                end;
                if globals.tickcount > v18[v25].stop_per_player + 64 then
                    v18[v25].stop_per_player = 0;
                end;
            end;
        end;
    end;
end;
events.render(function()
    -- upvalues: v29 (ref)
    v29(1);
end);
events.player_jump(function()
    -- upvalues: v29 (ref)
    v29(0);
end);
events.player_falldamage(function()
    -- upvalues: v29 (ref)
    v29(0);
end);
events.round_end(function()
    -- upvalues: v18 (ref)
    for v30 = 0, 64 do
        v18[v30].stop_per_player = 0;
    end;
end);