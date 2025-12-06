local l_pui_0 = require("neverlose/pui");
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local l_gradient_0 = require("neverlose/gradient");
local l_mtools_0 = require("neverlose/mtools");
local _ = require("neverlose/websockets");
local v6 = db.maxsense_data or {
    [1] = 0, 
    [2] = 0, 
    [3] = 0
};
local v7 = common.get_unixtime();
local function v12(v8)
    local v9 = math.floor(v8 / 3600);
    local v10 = math.floor((v8 - v9 * 3600) / 60);
    local v11 = math.floor(v8 - v9 * 3600 - v10 * 60);
    return string.format("%02d:%02d:%02d", v9, v10, v11);
end;
local v13 = {
    aa_enable = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    yawbase = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yawoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    avoidbackstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    yawmodifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    yawmodoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    leftlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    rightlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    bodyfrees = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    disableyawmod = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    bodyfreestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
    extendedangles = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
    extendedpitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
    extendedroll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"), 
    fakelag = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
    fakelaglimit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
    fakelagvariab = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"), 
    fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    legmovement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    scopeoverlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
    clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"), 
    lagoptions = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    hsoptions = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
};
local v14 = {
    home = l_pui_0.create("\v\f<house>  \rHome", "\n", 1), 
    data = l_pui_0.create("\v\f<house>  \rHome", "\n\n", 2), 
    configs = l_pui_0.create("\v\f<house>  \rHome", "\n\n\n", 2), 
    antiaim = l_pui_0.create("\v\f<user-helmet-safety>  \rAnti-Aim", "\n\n\n\n\n", 1), 
    builder = l_pui_0.create("\v\f<user-helmet-safety>  \rAnti-Aim", "\n\n\n\n\n\n", 2), 
    defensive = l_pui_0.create("\v\f<user-helmet-safety>  \rAnti-Aim", "\n\n\n\n\n\n\n", 2), 
    other = l_pui_0.create("\v\f<desktop>  \rOther", "\n\n\n\n\n\n\n\n", 1), 
    rage = l_pui_0.create("\v\f<desktop>  \rOther", "\n\n\n\n\n\n\n\n\n", 2), 
    visuals = l_pui_0.create("\v\f<desktop>  \rOther", "\n\n\n\n\n\n\n\n\n\n", 1), 
    misc = l_pui_0.create("\v\f<desktop>  \rOther", "\n\n\n\n\n\n\n\n\n\n\n", 2)
};
local v15 = v14.home:list("\n", {
    [1] = "\v\f<house>\r  Info", 
    [2] = " \v\f<server>\r  Cloud CFG", 
    [3] = "\v\f<database>\r  Local CFG"
});
v14.home:label(" \v\f<user>\r  " .. common.get_username() .. " ~ \v1111111111111");
local v16 = v12(v6[3]);
v14.data:label("\v\f<skull>\r   Enemies \veliminated: "):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v15
});
v14.data:button(" \v" .. v6[1] .. " ", function()

end, true):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v15
});
v14.data:label("\v\f<shield>\r   Missed shots at \vyou: "):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v15
});
v14.data:button(" \v" .. v6[2] .. " ", function()

end, true):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v15
});
v14.data:label("\v\f<clock>\r   Time \vPlayed: "):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v15
});
v14.data:button(" \v" .. v16 .. " ", function()

end, true):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v15
});
local v17 = {
    main_func = v14.other:listable("\n\n", {
        [1] = "\v\f<bomb>\r  Super Toss", 
        [2] = "\v\f<water-ladder>\r  Fast Ladder", 
        [3] = "\v\f<person-falling>\r  No Fall Damage"
    }), 
    main_func2 = v14.rage:listable("\n\n", {
        [1] = "\v\f<user-shield>\r  Auto Hide Shots"
    }), 
    screen_logs = v14.visuals:switch("\v\f<->\r  \208\191\208\190\209\130\208\190\208\188")
};
v17.screen_logs_create = v17.screen_logs:create():depend(v17.screen_logs);
v17.screen_logs_hit = v17.screen_logs_create:color_picker("Hit", color(201, 199, 255));
v17.screen_logs_miss = v17.screen_logs_create:color_picker("Miss", color(200, 112, 112));
v17.custom_scope = v14.visuals:switch("\v\f<crosshairs>\r  Custom Scope");
v17.custom_scope_create = v17.custom_scope:create():depend(v17.custom_scope);
v17.custom_scope_color = v17.custom_scope_create:color_picker("Color", color(200, 200, 200, 200));
v17.custom_scope_length = v17.custom_scope_create:slider("Length", 50, 300, 150);
v17.custom_scope_offset = v17.custom_scope_create:slider("Offset", 0, 50, 10);
v17.viewmodel = v14.visuals:switch("\v\f<hands-holding-heart>\r  Viewmodel Changer");
v17.viewmodel_create = v17.viewmodel:create():depend(v17.viewmodel);
v17.viewmodel_fov = v17.viewmodel_create:slider("Fov", -100, 100, 68);
v17.viewmodel_x = v17.viewmodel_create:slider("X", -100, 100, 25, 0.1);
v17.viewmodel_y = v17.viewmodel_create:slider("Y", -100, 100, 0, 0.1);
v17.viewmodel_z = v17.viewmodel_create:slider("Z", -100, 100, -15, 0.1);
v17.viewmodel_reset = v17.viewmodel_create:button("                                  \vReset                                  ", function()
    -- upvalues: v17 (ref)
    v17.viewmodel_fov:set(68);
    v17.viewmodel_x:set(25);
    v17.viewmodel_y:set(0);
    v17.viewmodel_z:set(-15);
end, true);
v17.min_damage = v14.visuals:switch("\v\f<gun>\r  Min. Damage Indicator");
v17.min_damage_create = v17.min_damage:create():depend(v17.min_damage);
v17.min_damage_color = v17.min_damage_create:color_picker("Color", color(255));
v17.min_damage_font = v17.min_damage_create:list("\n\n\n", {
    [1] = "Default", 
    [2] = "Small", 
    [3] = "Console", 
    [4] = "Bold"
});
v17.watermark = v14.visuals:combo("\v\f<indent>\r  Watermark Style", {
    [1] = "Default"
});
v17.fake_ping = v14.misc:switch("\v\f<wifi>\r  Fake Ping");
v17.fake_ping_create = v17.fake_ping:create():depend(v17.fake_ping);
v17.fake_ping_value = v17.fake_ping_create:slider("Value", 0, 200, 0);
v17.fd_settings = v14.misc:switch("\v\f<duck>\r  FD Settings");
v17.fd_settings_list = v17.fd_settings:create():listable("\n", {
    [1] = "Fast Fake Duck", 
    [2] = "Fake Duck On Freeze Time"
}):depend(v17.fd_settings);
v17.aspectratio = v14.misc:switch("\v\f<desktop>\r  Aspect Ratio");
v17.aspectratio_create = v17.aspectratio:create():depend(v17.aspectratio);
v17.aspectratio_value = v17.aspectratio_create:slider("Value", 0, 200, 0, 0.01, function(v18)
    if v18 == 125 then
        return "5:4";
    elseif v18 == 133 then
        return "4:3";
    elseif v18 == 150 then
        return "3:2";
    elseif v18 == 160 then
        return "16:10";
    elseif v18 == 180 then
        return "16:9";
    else
        return;
    end;
end);
v17.aspectratio_create:button("  \v5:4  ", function()
    -- upvalues: v17 (ref)
    v17.aspectratio_value:set(125);
end, true);
v17.aspectratio_create:button("  \v4:3  ", function()
    -- upvalues: v17 (ref)
    v17.aspectratio_value:set(133);
end, true);
v17.aspectratio_create:button("  \v3:2  ", function()
    -- upvalues: v17 (ref)
    v17.aspectratio_value:set(150);
end, true);
v17.aspectratio_create:button("  \v16:10  ", function()
    -- upvalues: v17 (ref)
    v17.aspectratio_value:set(160);
end, true);
v17.aspectratio_create:button("  \v16:9  ", function()
    -- upvalues: v17 (ref)
    v17.aspectratio_value:set(180);
end, true);
v17.dormant_aimbot = v14.misc:switch("\v\f<eye-low-vision>\r  Dormant Aimbot");
v17.lc_teleport = v14.misc:switch("\v\f<chart-network>\r  LC Teleport");
v17.logs = v14.misc:selectable("\v\f<rectangle-terminal>\r   Ragebot Logs", {
    [1] = "Console", 
    [2] = "Event"
});
v17.logs_create = v17.logs:create():depend({
    [1] = v17.logs, 
    [2] = function()
        -- upvalues: v17 (ref)
        return v17.logs:get("Console") or v17.logs:get("Event");
    end
});
v17.logs_hit = v17.logs_create:color_picker("Hit", color(201, 199, 255));
v17.logs_miss = v17.logs_create:color_picker("Miss", color(200, 112, 112));
local v19 = {
    [1] = "\v\f<circle-dot>  \rShare", 
    [2] = "\v\f<person>  \rStand", 
    [3] = "\v\f<person-running>  \rMove", 
    [4] = "\v\f<person-walking>  \rWalk", 
    [5] = "\v\f<wheelchair>  \rCrouch", 
    [6] = "\v\f<wheelchair-move>  \rCrouch Move", 
    [7] = "\v\f<person-falling>  \rAir", 
    [8] = "\v\f<person-falling-burst>  \rAir Crouch", 
    [9] = "\v\f<transporter>  \rOn Fakelag"
};
local v20 = {
    [1] = "\v\f<circle-dot>\r  \aFFFFFF40\f<left-right>\r  ", 
    [2] = "\v\f<person>\r  \aFFFFFF40\f<left-right>\r  ", 
    [3] = "\v\f<person-running>\r  \aFFFFFF40\f<left-right>\r  ", 
    [4] = "\v\f<person-walking>\r  \aFFFFFF40\f<left-right>\r  ", 
    [5] = "\v\f<wheelchair>\r  \aFFFFFF40\f<left-right>\r  ", 
    [6] = "\v\f<wheelchair-move>\r  \aFFFFFF40\f<left-right>\r  ", 
    [7] = "\v\f<person-falling>\r  \aFFFFFF40\f<left-right>\r  ", 
    [8] = "\v\f<person-falling-burst>\r  \aFFFFFF40\f<left-right>\r  ", 
    [9] = "\v\f<transporter>\r  \aFFFFFF40\f<left-right>\r  "
};
local v21 = {
    side = v14.antiaim:list("\n", {
        [1] = "  \v\f<gun>\v  \rTerrorist", 
        [2] = "  \v\f<shield>  \rCounter - Terrorist"
    }), 
    yaw_base = v14.antiaim:combo("\v\f<route>  \rYaw", {
        [1] = "At Target", 
        [2] = "Backward", 
        [3] = "Left", 
        [4] = "Right", 
        [5] = "Forward"
    })
};
v21.yaw_base_clear = v21.yaw_base:create():switch("Clear Yaw");
v21.defensive_flick = v21.yaw_base:create():switch("Defensive Flick");
v21.pitch = v14.antiaim:combo("\v\f<arrow-down-arrow-up>  \rPitch", v13.pitch:list());
v21.shit_aa = v14.antiaim:selectable("\v\f<arrows-spin>  \r\209\135\209\145\209\130\208\190 \209\130\208\176\208\188", {
    [1] = "On Warmup", 
    [2] = "No Enemies Alive"
});
v21.safe_head = v14.antiaim:selectable("\v\f<user-helmet-safety>  \rSafe Head", {
    [1] = "Air+ Knife", 
    [2] = "Air+ Zeus", 
    [3] = "Height Difference"
});
v21.airlag = v14.antiaim:switch("\v\f<transporter-1>  \rAirlag");
v21.airlag_hit = v21.airlag:create():switch("When Hittable");
v21.airlag_ticks = v21.airlag:create():slider("Ticks", 0, 10, 1);
v21.freestand = v14.antiaim:switch("\v\f<circle-location-arrow>  \rFreestanding");
v21.freestand_static = v21.freestand:create():switch("Clear Yaw");
v21.freestand_flick = v21.freestand:create():switch("Defensive Flick");
v21.anims = v14.antiaim:switch("\v\f<socks>  \rAnim. Breakers");
v21.anims_ground = v21.anims:create():combo("Ground", {
    [1] = "Disabled", 
    [2] = "Sliding", 
    [3] = "Moon Walk", 
    [4] = "Jitter"
}):depend(v21.anims);
v21.anims_ground_amount = v21.anims:create():slider("Legs Amount", 0, 100, 80):depend(v21.anims, {
    [1] = nil, 
    [2] = "Jitter", 
    [1] = v21.anims_ground
});
v21.anims_air = v21.anims:create():combo("Air", {
    [1] = "Disabled", 
    [2] = "Static", 
    [3] = "Moon Walk", 
    [4] = "Jitter"
}):depend(v21.anims);
v21.anims_other = v21.anims:create():selectable("Other", {
    [1] = "Move Lean", 
    [2] = "EarthQuake", 
    [3] = "Pitch Zero On Land"
}):depend(v21.anims);
v21.anims_lean = v21.anims:create():slider("Move Lean", 0, 100, 100, 1, "%"):depend(v21.anims, {
    [1] = nil, 
    [2] = "Move Lean", 
    [1] = v21.anims_other
});
v21.conditions = v14.builder:combo("\n", v19);
local v22 = {};
for v23 = 1, #v19 do
    v22[v23] = {};
    v22[v23].enable = v14.builder:switch("\v\f<square-check>\r  Override  " .. v19[v23]);
    v22[v23].yaw_type = v14.builder:slider("\n", 1, 3, 1, 1, function(v24)
        if v24 == 1 then
            return "Yaw Type: Default";
        elseif v24 == 2 then
            return "Yaw Type: Extended";
        else
            return "Yaw Type: Flick";
        end;
    end);
    v22[v23].yaw = v14.builder:slider("", -180, 180, 0, 1, "\194\176");
    v22[v23].yaw_left = v14.builder:slider("", -180, 180, 0, 1, function(v25)
        return v25 .. "\194\176  Left  ";
    end);
    v22[v23].yaw_right = v14.builder:slider("", -180, 180, 0, 1, function(v26)
        return v26 .. "\194\176 Right";
    end);
    v22[v23].yaw_random = v14.builder:slider("", 0, 100, 0, 1, function(v27)
        return v27 .. "% Random";
    end);
    v22[v23].modifier = v14.builder:combo("\n", v13.yawmodifier:list());
    v22[v23].modifier_offset = v14.builder:slider("\n", -180, 180, 0, 1, function(v28)
        return "Modifier " .. v28 .. "\194\176";
    end);
    v22[v23].mod_random = v14.builder:slider("\n", 0, 100, 0, 1, function(v29)
        return v29 .. "% Random";
    end);
    v22[v23].body_yaw = v14.builder:switch(v20[v23] .. "\v\f<dharmachakra>\r  Body Yaw");
    v22[v23].options = v22[v23].body_yaw:create():selectable("Options", v13.options:list());
    v22[v23].invert = v22[v23].body_yaw:create():switch("Inverter");
    v22[v23].delay = v22[v23].body_yaw:create():slider("Delay", 1, 10, 1, 1, function(v30)
        if v30 == 1 then
            return "NL";
        else
            return v30 .. " t";
        end;
    end);
    v22[v23].delay_rand = v22[v23].body_yaw:create():slider("Randomize", 0, 6, 0);
    v22[v23].hold_delay = v22[v23].body_yaw:create():slider("Delay Time", 1, 100, 100, 1, "%");
    v22[v23].freestand = v22[v23].body_yaw:create():combo("Freestanding", v13.bodyfrees:list());
    v22[v23].left_limit = v22[v23].body_yaw:create():slider("\n", 0, 60, 60, 1, function(v31)
        return v31 .. "\194\176 Left    Limit";
    end);
    v22[v23].right_limit = v22[v23].body_yaw:create():slider("\n", 0, 60, 60, 1, function(v32)
        return v32 .. "\194\176 Right Limit";
    end);
    v22[v23].limit_rand = v22[v23].body_yaw:create():slider("\n", 0, 100, 0, 1, function(v33)
        return v33 .. "% LBY Random";
    end);
    v22[v23].lc = v14.defensive:selectable(v20[v23] .. "\v\f<land-mine-on>\r  Force LC", {
        [1] = "DT", 
        [2] = "Hide Shots"
    });
    v22[v23].def_yaw = v14.defensive:slider(v20[v23] .. "\v\f<street-view>\r  Yaw", 1, 11, 1, 1, function(v34)
        if v34 == 1 then
            return "Disabled";
        elseif v34 == 2 then
            return "Default";
        elseif v34 == 3 then
            return "Custom Spin";
        elseif v34 == 4 then
            return "Random";
        elseif v34 == 5 then
            return "Offset";
        elseif v34 == 6 then
            return "L&R";
        elseif v34 == 7 then
            return "3-Way";
        elseif v34 == 8 then
            return "Center";
        elseif v34 == 9 then
            return "Silent Center";
        elseif v34 == 10 then
            return "Flick";
        elseif v34 == 11 then
            return "Smart Flick";
        else
            return;
        end;
    end);
    v22[v23].def_yaw_offset = v22[v23].def_yaw:create():slider("Offset", -180, 180, 0, 1, "\194\176");
    v22[v23].def_yaw_offset_l = v22[v23].def_yaw:create():slider("Offset Left", -180, 180, 0, 1, "\194\176");
    v22[v23].def_yaw_offset_r = v22[v23].def_yaw:create():slider("Offset Right", -180, 180, 0, 1, "\194\176");
    v22[v23].def_yaw_offset_random = v22[v23].def_yaw:create():slider("Random", 0, 100, 0, 1, "%");
    v22[v23].def_yaw_spin = v22[v23].def_yaw:create():slider("Spin Offset", 0, 360, 0, 1, "\194\176");
    v22[v23].def_yaw_spin_speed = v22[v23].def_yaw:create():slider("Spin Speed", -50, 50, 10, 1, "t");
    v22[v23].def_pitch = v14.defensive:slider(v20[v23] .. "\v\f<arrows-turn-to-dots>\r  Pitch", 1, 5, 1, 1, function(v35)
        if v35 == 1 then
            return "Disabled";
        elseif v35 == 2 then
            return "Offset";
        elseif v35 == 3 then
            return "Custom Spin";
        elseif v35 == 4 then
            return "Side Ways";
        elseif v35 == 5 then
            return "Random";
        else
            return;
        end;
    end);
    v22[v23].def_pitch_offset = v22[v23].def_pitch:create():slider("Offset", -89, 89, 0, 1, "\194\176");
    v22[v23].def_pitch_offset_l = v22[v23].def_pitch:create():slider("Offset Left", -89, 89, 0, 1, "\194\176");
    v22[v23].def_pitch_offset_r = v22[v23].def_pitch:create():slider("Offset Right", -89, 89, 0, 1, "\194\176");
    v22[v23].def_pitch_spin = v22[v23].def_pitch:create():slider("Spin Offset", 0, 178, 0, 1, "\194\176");
    v22[v23].def_pitch_spin_speed = v22[v23].def_pitch:create():slider("Spin Speed", -50, 50, 10, 1, "t");
    v22[v23].send_to_ct = v14.builder:button("  \v\f<share-nodes>                    \rSend To \vCT\r Side                       \v\f<share-nodes> ", function()

    end, true);
end;
local v36 = {};
for v37 = 1, #v19 do
    v36[v37] = {};
    v36[v37].enable = v14.builder:switch("\v\f<square-check>\r  Override  " .. v19[v37]);
    v36[v37].yaw_type = v14.builder:slider("\n", 1, 3, 1, 1, function(v38)
        if v38 == 1 then
            return "Yaw Type: Default";
        elseif v38 == 2 then
            return "Yaw Type: Extended";
        else
            return "Yaw Type: Flick";
        end;
    end);
    v36[v37].yaw = v14.builder:slider("", -180, 180, 0, 1, "\194\176");
    v36[v37].yaw_left = v14.builder:slider("", -180, 180, 0, 1, function(v39)
        return v39 .. "\194\176  Left  ";
    end);
    v36[v37].yaw_right = v14.builder:slider("", -180, 180, 0, 1, function(v40)
        return v40 .. "\194\176 Right";
    end);
    v36[v37].yaw_random = v14.builder:slider("", 0, 100, 0, 1, function(v41)
        return v41 .. "% Random";
    end);
    v36[v37].modifier = v14.builder:combo("\n", v13.yawmodifier:list());
    v36[v37].modifier_offset = v14.builder:slider("\n", -180, 180, 0, 1, function(v42)
        return "Modifier " .. v42 .. "\194\176";
    end);
    v36[v37].mod_random = v14.builder:slider("\n", 0, 100, 0, 1, function(v43)
        return v43 .. "% Random";
    end);
    v36[v37].body_yaw = v14.builder:switch(v20[v37] .. "\v\f<dharmachakra>\r  Body Yaw");
    v36[v37].options = v36[v37].body_yaw:create():selectable("Options", v13.options:list());
    v36[v37].invert = v36[v37].body_yaw:create():switch("Inverter");
    v36[v37].delay = v36[v37].body_yaw:create():slider("Delay", 1, 10, 1, 1, function(v44)
        if v44 == 1 then
            return "NL";
        else
            return v44 .. " t";
        end;
    end);
    v36[v37].delay_rand = v36[v37].body_yaw:create():slider("Randomize", 0, 6, 0);
    v36[v37].hold_delay = v36[v37].body_yaw:create():slider("Delay Time", 1, 100, 100, 1, "%");
    v36[v37].freestand = v36[v37].body_yaw:create():combo("Freestanding", v13.bodyfrees:list());
    v36[v37].left_limit = v36[v37].body_yaw:create():slider("\n", 0, 60, 60, 1, function(v45)
        return v45 .. "\194\176 Left    Limit";
    end);
    v36[v37].right_limit = v36[v37].body_yaw:create():slider("\n", 0, 60, 60, 1, function(v46)
        return v46 .. "\194\176 Right Limit";
    end);
    v36[v37].limit_rand = v36[v37].body_yaw:create():slider("\n", 0, 100, 0, 1, function(v47)
        return v47 .. "% LBY Random";
    end);
    v36[v37].lc = v14.defensive:selectable(v20[v37] .. "\v\f<land-mine-on>\r  Force LC", {
        [1] = "DT", 
        [2] = "Hide Shots"
    });
    v36[v37].def_yaw = v14.defensive:slider(v20[v37] .. "\v\f<street-view>\r  Yaw", 1, 11, 1, 1, function(v48)
        if v48 == 1 then
            return "Disabled";
        elseif v48 == 2 then
            return "Default";
        elseif v48 == 3 then
            return "Custom Spin";
        elseif v48 == 4 then
            return "Random";
        elseif v48 == 5 then
            return "Offset";
        elseif v48 == 6 then
            return "L&R";
        elseif v48 == 7 then
            return "3-Way";
        elseif v48 == 8 then
            return "Center";
        elseif v48 == 9 then
            return "Silent Center";
        elseif v48 == 10 then
            return "Flick";
        elseif v48 == 11 then
            return "Smart Flick";
        else
            return;
        end;
    end);
    v36[v37].def_yaw_offset = v36[v37].def_yaw:create():slider("Offset", -180, 180, 0, 1, "\194\176");
    v36[v37].def_yaw_offset_l = v36[v37].def_yaw:create():slider("Offset Left", -180, 180, 0, 1, "\194\176");
    v36[v37].def_yaw_offset_r = v36[v37].def_yaw:create():slider("Offset Right", -180, 180, 0, 1, "\194\176");
    v36[v37].def_yaw_offset_random = v36[v37].def_yaw:create():slider("Random", 0, 100, 0, 1, "%");
    v36[v37].def_yaw_spin = v36[v37].def_yaw:create():slider("Spin Offset", 0, 360, 0, 1, "\194\176");
    v36[v37].def_yaw_spin_speed = v36[v37].def_yaw:create():slider("Spin Speed", -50, 50, 10, 1, "t");
    v36[v37].def_pitch = v14.defensive:slider(v20[v37] .. "\v\f<arrows-turn-to-dots>\r  Pitch", 1, 5, 1, 1, function(v49)
        if v49 == 1 then
            return "Disabled";
        elseif v49 == 2 then
            return "Offset";
        elseif v49 == 3 then
            return "Custom Spin";
        elseif v49 == 4 then
            return "Side Ways";
        elseif v49 == 5 then
            return "Random";
        else
            return;
        end;
    end);
    v36[v37].def_pitch_offset = v36[v37].def_pitch:create():slider("Offset", -89, 89, 0, 1, "\194\176");
    v36[v37].def_pitch_offset_l = v36[v37].def_pitch:create():slider("Offset Left", -89, 89, 0, 1, "\194\176");
    v36[v37].def_pitch_offset_r = v36[v37].def_pitch:create():slider("Offset Right", -89, 89, 0, 1, "\194\176");
    v36[v37].def_pitch_spin = v36[v37].def_pitch:create():slider("Spin Offset", 0, 178, 0, 1, "\194\176");
    v36[v37].def_pitch_spin_speed = v36[v37].def_pitch:create():slider("Spin Speed", -50, 50, 10, 1, "t");
    v36[v37].send_to_t = v14.builder:button("  \v\f<share-nodes>                     \rSend To \vT\r Side                        \v\f<share-nodes> ", function()

    end, true);
end;
for v50 = 1, #v19 do
    do
        local l_v50_0 = v50;
        local v52 = {
            [1] = v21.conditions, 
            [2] = function()
                -- upvalues: l_v50_0 (ref)
                return l_v50_0 ~= 1;
            end
        };
        local _ = {
            [1] = v22[l_v50_0].enable, 
            [2] = function()
                -- upvalues: l_v50_0 (ref), v22 (ref)
                if l_v50_0 == 1 then
                    return true;
                else
                    return v22[l_v50_0].enable:get();
                end;
            end
        };
        local v54 = {
            [1] = v21.conditions, 
            [2] = v19[l_v50_0]
        };
        local v55 = {
            [1] = nil, 
            [2] = 1, 
            [1] = v21.side
        };
        v22[l_v50_0].enable:depend(v54, v52, v55);
        v22[l_v50_0].yaw_type:depend(v54, v55);
        v22[l_v50_0].yaw:depend(v54, {
            [1] = nil, 
            [2] = 1, 
            [1] = v22[l_v50_0].yaw_type
        }, v55);
        v22[l_v50_0].yaw_left:depend(v54, {
            [1] = v22[l_v50_0].yaw_type, 
            [2] = function()
                -- upvalues: v22 (ref), l_v50_0 (ref)
                return v22[l_v50_0].yaw_type:get() ~= 1;
            end
        }, v55);
        v22[l_v50_0].yaw_right:depend(v54, {
            [1] = v22[l_v50_0].yaw_type, 
            [2] = function()
                -- upvalues: v22 (ref), l_v50_0 (ref)
                return v22[l_v50_0].yaw_type:get() ~= 1;
            end
        }, v55);
        v22[l_v50_0].yaw_random:depend(v54, {
            [1] = v22[l_v50_0].yaw_type, 
            [2] = function()
                -- upvalues: v22 (ref), l_v50_0 (ref)
                return v22[l_v50_0].yaw_type:get() ~= 1;
            end
        }, v55);
        v22[l_v50_0].modifier:depend(v54, v55);
        v22[l_v50_0].modifier_offset:depend(v54, {
            [1] = v22[l_v50_0].modifier, 
            [2] = function()
                -- upvalues: v22 (ref), l_v50_0 (ref)
                return v22[l_v50_0].modifier:get() ~= "Disabled";
            end
        }, v55);
        v22[l_v50_0].mod_random:depend(v54, {
            [1] = v22[l_v50_0].modifier, 
            [2] = function()
                -- upvalues: v22 (ref), l_v50_0 (ref)
                return v22[l_v50_0].modifier:get() ~= "Disabled";
            end
        }, v55);
        v22[l_v50_0].body_yaw:depend(v54, v55);
        v22[l_v50_0].options:depend(v54, v22[l_v50_0].body_yaw, v55);
        v22[l_v50_0].invert:depend(v54, v22[l_v50_0].body_yaw, {
            [1] = v22[l_v50_0].options, 
            [2] = function()
                -- upvalues: v22 (ref), l_v50_0 (ref)
                return not v22[l_v50_0].options:get("Jitter");
            end
        }, v55);
        v22[l_v50_0].delay:depend(v54, v22[l_v50_0].body_yaw, {
            [1] = nil, 
            [2] = "Jitter", 
            [1] = v22[l_v50_0].options
        }, v55);
        v22[l_v50_0].delay_rand:depend(v54, v22[l_v50_0].body_yaw, {
            [1] = nil, 
            [2] = "Jitter", 
            [1] = v22[l_v50_0].options
        }, v55);
        v22[l_v50_0].hold_delay:depend(v54, v22[l_v50_0].body_yaw, {
            [1] = nil, 
            [2] = "Jitter", 
            [1] = v22[l_v50_0].options
        }, v55);
        v22[l_v50_0].freestand:depend(v54, v22[l_v50_0].body_yaw, v55);
        v22[l_v50_0].left_limit:depend(v54, v22[l_v50_0].body_yaw, v55);
        v22[l_v50_0].right_limit:depend(v54, v22[l_v50_0].body_yaw, v55);
        v22[l_v50_0].limit_rand:depend(v54, v22[l_v50_0].body_yaw, v55);
        v22[l_v50_0].lc:depend(v54, v55);
        v22[l_v50_0].def_yaw:depend(v54, v55);
        v22[l_v50_0].def_yaw_offset:depend(v54, {
            [1] = v22[l_v50_0].def_yaw, 
            [2] = function()
                -- upvalues: v22 (ref), l_v50_0 (ref)
                return v22[l_v50_0].def_yaw:get() == 4 or not (v22[l_v50_0].def_yaw:get() ~= 5) or not (v22[l_v50_0].def_yaw:get() ~= 7) or not (v22[l_v50_0].def_yaw:get() ~= 8) or not (v22[l_v50_0].def_yaw:get() ~= 9) or v22[l_v50_0].def_yaw:get() == 10;
            end
        }, v55);
        v22[l_v50_0].def_yaw_offset_l:depend(v54, {
            [1] = v22[l_v50_0].def_yaw, 
            [2] = function()
                -- upvalues: v22 (ref), l_v50_0 (ref)
                return v22[l_v50_0].def_yaw:get() == 6;
            end
        }, v55);
        v22[l_v50_0].def_yaw_offset_r:depend(v54, {
            [1] = v22[l_v50_0].def_yaw, 
            [2] = function()
                -- upvalues: v22 (ref), l_v50_0 (ref)
                return v22[l_v50_0].def_yaw:get() == 6;
            end
        }, v55);
        v22[l_v50_0].def_yaw_offset_random:depend(v54, {
            [1] = v22[l_v50_0].def_yaw, 
            [2] = function()
                -- upvalues: v22 (ref), l_v50_0 (ref)
                return v22[l_v50_0].def_yaw:get() == 6 or not (v22[l_v50_0].def_yaw:get() ~= 8) or v22[l_v50_0].def_yaw:get() == 9;
            end
        }, v55);
        v22[l_v50_0].def_yaw_spin:depend(v54, {
            [1] = nil, 
            [2] = 3, 
            [1] = v22[l_v50_0].def_yaw
        }, v55);
        v22[l_v50_0].def_yaw_spin_speed:depend(v54, {
            [1] = nil, 
            [2] = 3, 
            [1] = v22[l_v50_0].def_yaw
        }, v55);
        v22[l_v50_0].def_pitch:depend(v54, v55);
        v22[l_v50_0].def_pitch_offset:depend(v54, {
            [1] = v22[l_v50_0].def_pitch, 
            [2] = function()
                -- upvalues: v22 (ref), l_v50_0 (ref)
                return v22[l_v50_0].def_pitch:get() == 2 or not (v22[l_v50_0].def_pitch:get() ~= 4) or v22[l_v50_0].def_pitch:get() == 5;
            end
        }, v55);
        v22[l_v50_0].def_pitch_offset_l:depend(v54, {
            [1] = nil, 
            [2] = 6, 
            [1] = v22[l_v50_0].def_pitch
        }, v55);
        v22[l_v50_0].def_pitch_offset_r:depend(v54, {
            [1] = nil, 
            [2] = 6, 
            [1] = v22[l_v50_0].def_pitch
        }, v55);
        v22[l_v50_0].def_pitch_spin:depend(v54, {
            [1] = nil, 
            [2] = 3, 
            [1] = v22[l_v50_0].def_pitch
        }, v55);
        v22[l_v50_0].def_pitch_spin_speed:depend(v54, {
            [1] = nil, 
            [2] = 3, 
            [1] = v22[l_v50_0].def_pitch
        }, v55);
        v22[l_v50_0].send_to_ct:depend(v54, v55);
    end;
end;
for v56 = 1, #v19 do
    do
        local l_v56_0 = v56;
        local v58 = {
            [1] = v21.conditions, 
            [2] = function()
                -- upvalues: l_v56_0 (ref)
                return l_v56_0 ~= 1;
            end
        };
        local _ = {
            [1] = v36[l_v56_0].enable, 
            [2] = function()
                -- upvalues: l_v56_0 (ref), v36 (ref)
                if l_v56_0 == 1 then
                    return true;
                else
                    return v36[l_v56_0].enable:get();
                end;
            end
        };
        local v60 = {
            [1] = v21.conditions, 
            [2] = v19[l_v56_0]
        };
        local v61 = {
            [1] = nil, 
            [2] = 2, 
            [1] = v21.side
        };
        v36[l_v56_0].enable:depend(v60, v58, v61);
        v36[l_v56_0].yaw_type:depend(v60, v61);
        v36[l_v56_0].yaw:depend(v60, {
            [1] = nil, 
            [2] = 1, 
            [1] = v36[l_v56_0].yaw_type
        }, v61);
        v36[l_v56_0].yaw_left:depend(v60, {
            [1] = v36[l_v56_0].yaw_type, 
            [2] = function()
                -- upvalues: v36 (ref), l_v56_0 (ref)
                return v36[l_v56_0].yaw_type:get() ~= 1;
            end
        }, v61);
        v36[l_v56_0].yaw_right:depend(v60, {
            [1] = v36[l_v56_0].yaw_type, 
            [2] = function()
                -- upvalues: v36 (ref), l_v56_0 (ref)
                return v36[l_v56_0].yaw_type:get() ~= 1;
            end
        }, v61);
        v36[l_v56_0].yaw_random:depend(v60, {
            [1] = v36[l_v56_0].yaw_type, 
            [2] = function()
                -- upvalues: v36 (ref), l_v56_0 (ref)
                return v36[l_v56_0].yaw_type:get() ~= 1;
            end
        }, v61);
        v36[l_v56_0].modifier:depend(v60, v61);
        v36[l_v56_0].modifier_offset:depend(v60, {
            [1] = v36[l_v56_0].modifier, 
            [2] = function()
                -- upvalues: v36 (ref), l_v56_0 (ref)
                return v36[l_v56_0].modifier:get() ~= "Disabled";
            end
        }, v61);
        v36[l_v56_0].mod_random:depend(v60, {
            [1] = v36[l_v56_0].modifier, 
            [2] = function()
                -- upvalues: v36 (ref), l_v56_0 (ref)
                return v36[l_v56_0].modifier:get() ~= "Disabled";
            end
        }, v61);
        v36[l_v56_0].body_yaw:depend(v60, v61);
        v36[l_v56_0].options:depend(v60, v36[l_v56_0].body_yaw, v61);
        v36[l_v56_0].invert:depend(v60, v36[l_v56_0].body_yaw, {
            [1] = v36[l_v56_0].options, 
            [2] = function()
                -- upvalues: v36 (ref), l_v56_0 (ref)
                return not v36[l_v56_0].options:get("Jitter");
            end
        }, v61);
        v36[l_v56_0].delay:depend(v60, v36[l_v56_0].body_yaw, {
            [1] = nil, 
            [2] = "Jitter", 
            [1] = v36[l_v56_0].options
        }, v61);
        v36[l_v56_0].delay_rand:depend(v60, v36[l_v56_0].body_yaw, {
            [1] = nil, 
            [2] = "Jitter", 
            [1] = v36[l_v56_0].options
        }, v61);
        v36[l_v56_0].hold_delay:depend(v60, v36[l_v56_0].body_yaw, {
            [1] = nil, 
            [2] = "Jitter", 
            [1] = v36[l_v56_0].options
        }, v61);
        v36[l_v56_0].freestand:depend(v60, v36[l_v56_0].body_yaw, v61);
        v36[l_v56_0].left_limit:depend(v60, v36[l_v56_0].body_yaw, v61);
        v36[l_v56_0].right_limit:depend(v60, v36[l_v56_0].body_yaw, v61);
        v36[l_v56_0].limit_rand:depend(v60, v36[l_v56_0].body_yaw, v61);
        v36[l_v56_0].lc:depend(v60, v61);
        v36[l_v56_0].def_yaw:depend(v60, v61);
        v36[l_v56_0].def_yaw_offset:depend(v60, {
            [1] = v36[l_v56_0].def_yaw, 
            [2] = function()
                -- upvalues: v36 (ref), l_v56_0 (ref)
                return v36[l_v56_0].def_yaw:get() == 4 or not (v36[l_v56_0].def_yaw:get() ~= 5) or not (v36[l_v56_0].def_yaw:get() ~= 7) or not (v36[l_v56_0].def_yaw:get() ~= 8) or not (v36[l_v56_0].def_yaw:get() ~= 9) or v36[l_v56_0].def_yaw:get() == 10;
            end
        }, v61);
        v36[l_v56_0].def_yaw_offset_l:depend(v60, {
            [1] = v36[l_v56_0].def_yaw, 
            [2] = function()
                -- upvalues: v36 (ref), l_v56_0 (ref)
                return v36[l_v56_0].def_yaw:get() == 6;
            end
        }, v61);
        v36[l_v56_0].def_yaw_offset_r:depend(v60, {
            [1] = v36[l_v56_0].def_yaw, 
            [2] = function()
                -- upvalues: v36 (ref), l_v56_0 (ref)
                return v36[l_v56_0].def_yaw:get() == 6;
            end
        }, v61);
        v36[l_v56_0].def_yaw_offset_random:depend(v60, {
            [1] = v36[l_v56_0].def_yaw, 
            [2] = function()
                -- upvalues: v36 (ref), l_v56_0 (ref)
                return v36[l_v56_0].def_yaw:get() == 6 or not (v36[l_v56_0].def_yaw:get() ~= 8) or v36[l_v56_0].def_yaw:get() == 9;
            end
        }, v61);
        v36[l_v56_0].def_yaw_spin:depend(v60, {
            [1] = nil, 
            [2] = 3, 
            [1] = v36[l_v56_0].def_yaw
        }, v61);
        v36[l_v56_0].def_yaw_spin_speed:depend(v60, {
            [1] = nil, 
            [2] = 3, 
            [1] = v36[l_v56_0].def_yaw
        }, v61);
        v36[l_v56_0].def_pitch:depend(v60, v61);
        v36[l_v56_0].def_pitch_offset:depend(v60, {
            [1] = v36[l_v56_0].def_pitch, 
            [2] = function()
                -- upvalues: v36 (ref), l_v56_0 (ref)
                return v36[l_v56_0].def_pitch:get() == 2 or not (v36[l_v56_0].def_pitch:get() ~= 4) or v36[l_v56_0].def_pitch:get() == 5;
            end
        }, v61);
        v36[l_v56_0].def_pitch_offset_l:depend(v60, {
            [1] = nil, 
            [2] = 6, 
            [1] = v36[l_v56_0].def_pitch
        }, v61);
        v36[l_v56_0].def_pitch_offset_r:depend(v60, {
            [1] = nil, 
            [2] = 6, 
            [1] = v36[l_v56_0].def_pitch
        }, v61);
        v36[l_v56_0].def_pitch_spin:depend(v60, {
            [1] = nil, 
            [2] = 3, 
            [1] = v36[l_v56_0].def_pitch
        }, v61);
        v36[l_v56_0].def_pitch_spin_speed:depend(v60, {
            [1] = nil, 
            [2] = 3, 
            [1] = v36[l_v56_0].def_pitch
        }, v61);
        v36[l_v56_0].send_to_t:depend(v60, v61);
    end;
end;
local function v65(v62)
    -- upvalues: v21 (ref), v22 (ref), v36 (ref)
    local v63 = v21.side:get() == 2 and v22[v62] or v36[v62];
    local v64 = v21.side:get() == 2 and v36[v62] or v22[v62];
    v63.enable:set(v64.enable:get());
    v63.yaw_type:set(v64.yaw_type:get());
    v63.yaw:set(v64.yaw:get());
    v63.yaw_left:set(v64.yaw_left:get());
    v63.yaw_right:set(v64.yaw_right:get());
    v63.yaw_random:set(v64.yaw_random:get());
    v63.modifier:set(v64.modifier:get());
    v63.modifier_offset:set(v64.modifier_offset:get());
    v63.mod_random:set(v64.mod_random:get());
    v63.body_yaw:set(v64.body_yaw:get());
    v63.options:set(v64.options:get());
    v63.invert:set(v64.invert:get());
    v63.delay:set(v64.delay:get());
    v63.delay_rand:set(v64.delay_rand:get());
    v63.hold_delay:set(v64.hold_delay:get());
    v63.freestand:set(v64.freestand:get());
    v63.left_limit:set(v64.left_limit:get());
    v63.right_limit:set(v64.right_limit:get());
    v63.lc:set(v64.lc:get());
    v63.def_yaw:set(v64.def_yaw:get());
    v63.def_yaw_offset:set(v64.def_yaw_offset:get());
    v63.def_yaw_offset_l:set(v64.def_yaw_offset_l:get());
    v63.def_yaw_offset_r:set(v64.def_yaw_offset_r:get());
    v63.def_yaw_offset_random:set(v64.def_yaw_offset_random:get());
    v63.def_yaw_spin:set(v64.def_yaw_spin:get());
    v63.def_yaw_spin_speed:set(v64.def_yaw_spin_speed:get());
    v63.def_pitch:set(v64.def_pitch:get());
    v63.def_pitch_offset:set(v64.def_pitch_offset:get());
    v63.def_pitch_offset_l:set(v64.def_pitch_offset_l:get());
    v63.def_pitch_offset_r:set(v64.def_pitch_offset_r:get());
    v63.def_pitch_spin:set(v64.def_pitch_spin:get());
    v63.def_pitch_spin_speed:set(v64.def_pitch_spin_speed:get());
end;
for v66 = 1, #v19 do
    do
        local l_v66_0 = v66;
        v22[l_v66_0].send_to_ct:set_callback(function()
            -- upvalues: v65 (ref), l_v66_0 (ref)
            v65(l_v66_0);
        end);
        v36[l_v66_0].send_to_t:set_callback(function()
            -- upvalues: v65 (ref), l_v66_0 (ref)
            v65(l_v66_0);
        end);
    end;
end;
math.lerp = function(v68, v69, v70)
    return v68 + (v69 - v68) * globals.frametime * v70;
end;
math.interpolate = function(v71, v72, v73)
    return v71 + v73 * (v72 - v71);
end;
math.compute_vector = function(v74, v75)
    local v76 = math.sin(math.rad(v74));
    local v77 = math.cos(math.rad(v74));
    local v78 = math.sin(math.rad(v75));
    local v79 = math.cos(math.rad(v75));
    return vector(v77 * v79, v77 * v78, -v76);
end;
math.calculate_direction = function(_, _)
    local v82 = math.sin(math.rad(pitch));
    local v83 = math.cos(math.rad(pitch));
    local v84 = math.sin(math.rad(yaw));
    local v85 = math.cos(math.rad(yaw));
    return vector(v83 * v85, v83 * v84, -v82);
end;
math.randomize = function(v86, v87)
    local v88 = v86 - v86 * v87 / 100;
    local v89 = v86 + v86 * v87 / 100;
    return math.random(v88, v89);
end;
math.spin = function(v90, v91)
    if v91 == 0 then
        return 0;
    elseif v90 >= 0 then
        tick = globals.tickcount * v90;
        result = tick % v91 - v91 / 2;
        return result;
    else
        tick = globals.tickcount * v90;
        result = tick % -v91 + v91 / 2;
        return result;
    end;
end;
local v92 = v22[1];
local v93 = false;
local v94 = 0;
local v95 = {};
local function v100(v96, v97, v98)
    -- upvalues: v94 (ref), v93 (ref)
    local v99 = nil;
    v99 = math.max(1, v97) < globals.tickcount % 100 and 1 or math.max(0, v96);
    if globals.tickcount > v94 + v99 then
        if v98.choked_commands == 0 then
            v93 = not v93;
            v94 = globals.tickcount;
        end;
    elseif globals.tickcount < v94 then
        v94 = globals.tickcount;
    end;
    return v93;
end;
local function v114(v101)
    -- upvalues: v13 (ref), v22 (ref), v92 (ref), v36 (ref), v21 (ref), v100 (ref), v95 (ref)
    local v102 = entity.get_local_player();
    if not v102 then
        return;
    elseif not v102:is_alive() then
        return;
    else
        local v103 = bit.band(v102.m_fFlags, 1) == 1;
        local v104 = bit.band(v102.m_fFlags, 1) == 0 or v101.in_jump;
        local v105 = v102.m_flDuckAmount > 0.7 or v13.fakeduck:get();
        local v106 = v102.m_vecVelocity:length() > 5;
        local v107 = v104 and v105;
        if v102.m_iTeamNum ~= 3 then
            if v22[9].enable:get() and rage.exploit:get() < 0.9 then
                id = 9;
            elseif v22[8].enable:get() and v105 and v104 then
                id = 8;
            elseif v22[7].enable:get() and v104 then
                id = 7;
            elseif v22[6].enable:get() and v105 and v106 then
                id = 6;
            elseif v22[5].enable:get() and v105 then
                id = 5;
            elseif v22[4].enable:get() and v103 and v13.slowwalk:get() and v106 then
                id = 4;
            elseif v22[3].enable:get() and v103 and v106 then
                id = 3;
            elseif v22[2].enable:get() and v103 and not v106 then
                id = 2;
            else
                id = 1;
            end;
            v92 = v22[id];
        else
            if v36[9].enable:get() and rage.exploit:get() < 0.9 then
                id = 9;
            elseif v36[8].enable:get() and v105 and v104 then
                id = 8;
            elseif v36[7].enable:get() and v104 then
                id = 7;
            elseif v36[6].enable:get() and v105 and v106 then
                id = 6;
            elseif v36[5].enable:get() and v105 then
                id = 5;
            elseif v36[4].enable:get() and v103 and v13.slowwalk:get() and v106 then
                id = 4;
            elseif v36[3].enable:get() and v103 and v106 then
                id = 3;
            elseif v36[2].enable:get() and v103 and not v106 then
                id = 2;
            else
                id = 1;
            end;
            v92 = v36[id];
        end;
        v13.aa_enable:override(true);
        v13.pitch:override(v21.pitch:get());
        v13.yaw:override("Backward");
        v13.hidden:override(true);
        if v92.yaw_type:get() == 1 then
            v13.yawoffset:override(v92.yaw:get());
        elseif v92.yaw_type:get() == 2 then
            v13.yawoffset:override(rage.antiaim:inverter() and math.randomize(v92.yaw_left:get(), v92.yaw_random:get()) or math.randomize(v92.yaw_right:get(), v92.yaw_random:get()));
        elseif v101.command_number % math.random(3, 6) >= 3 then
            v13.yawoffset:override(rage.antiaim:inverter() and math.randomize(v92.yaw_left:get(), v92.yaw_random:get()) or math.randomize(v92.yaw_right:get(), v92.yaw_random:get()));
        else
            v13.yawoffset:override(rage.antiaim:inverter() and v92.yaw_left:get() or v92.yaw_right:get());
        end;
        v13.yawmodifier:override(v92.modifier:get());
        v13.yawmodoffset:override(math.randomize(v92.modifier_offset:get(), v92.mod_random:get()));
        v13.options:override(v92.options:get());
        v13.bodyyaw:override(v92.body_yaw:get());
        v13.inverter:override(v92.invert:get());
        v13.leftlimit:override(math.randomize(v92.left_limit:get(), v92.limit_rand:get()));
        v13.rightlimit:override(math.randomize(v92.right_limit:get(), v92.limit_rand:get()));
        v13.bodyfrees:override(v92.freestand:get());
        if v92.options:get("Jitter") and v92.delay:get() > 1 then
            v13.options:override("");
            v13.bodyfrees:override("Off");
            v13.inverter:override(v100(v92.delay:get() + math.random(0, v92.delay_rand:get()), v92.hold_delay:get(), v101));
        end;
        v13.lagoptions:override(v92.lc:get("DT") and "Always On" or "On Peek");
        v13.hsoptions:override(v92.lc:get("Hide Shots") and "Break LC" or "Favor Fire Rate");
        if v92.def_yaw:get() == 1 then
            rage.antiaim:override_hidden_yaw_offset(0);
        elseif v92.def_yaw:get() == 3 then
            rage.antiaim:override_hidden_yaw_offset(math.spin(v92.def_yaw_spin_speed:get(), v92.def_yaw_spin:get()));
        elseif v92.def_yaw:get() == 4 then
            rage.antiaim:override_hidden_yaw_offset(math.random(-v92.def_yaw_offset:get(), v92.def_yaw_offset:get()));
        elseif v92.def_yaw:get() == 5 then
            rage.antiaim:override_hidden_yaw_offset(v92.def_yaw_offset:get());
        elseif v92.def_yaw:get() == 6 then
            rage.antiaim:override_hidden_yaw_offset(rage.antiaim:inverter() and math.randomize(v92.def_yaw_offset_l:get(), v92.def_yaw_offset_random:get()) or math.randomize(v92.def_yaw_offset_r:get(), v92.def_yaw_offset_random:get()));
        elseif v92.def_yaw:get() == 7 then
            if globals.tickcount % 3 == 0 then
                rage.antiaim:override_hidden_yaw_offset(v92.def_yaw_offset:get());
            elseif globals.tickcount % 3 == 1 then
                rage.antiaim:override_hidden_yaw_offset(0);
            else
                rage.antiaim:override_hidden_yaw_offset(-v92.def_yaw_offset:get());
            end;
        elseif v92.def_yaw:get() == 8 then
            rage.antiaim:override_hidden_yaw_offset(globals.tickcount % 4 > 1 and math.randomize(v92.def_yaw_offset:get(), v92.def_yaw_offset_random:get()) or -math.randomize(v92.def_yaw_offset:get(), v92.def_yaw_offset_random:get()));
        elseif v92.def_yaw:get() == 9 then
            v101.force_defensive = v101.choked_commands == 1 and v101.send_packet == true and v101.command_number % 13 > 8;
            if not v92.options:get("Jitter") then
                v13.options:override("Jitter");
            end;
            rage.antiaim:override_hidden_yaw_offset(rage.antiaim:inverter() and math.randomize(v92.def_yaw_offset:get(), v92.def_yaw_offset_random:get()) or -math.randomize(v92.def_yaw_offset:get(), v92.def_yaw_offset_random:get()));
        elseif v92.def_yaw:get() == 10 then
            v101.force_defensive = v101.choked_commands == 1 and v101.send_packet == true and v101.command_number % 13 > 8;
            rage.antiaim:override_hidden_yaw_offset(v92.def_yaw_offset:get());
        elseif v92.def_yaw:get() == 11 then
            v13.options:override("");
            v13.inverter:override(false);
            v13.bodyfrees:override("Peek Real");
            v101.force_defensive = v101.choked_commands == 1 and v101.send_packet == true and v101.command_number % 13 > 8;
            rage.antiaim:override_hidden_yaw_offset(rage.antiaim:inverter() and 90 or -90);
        end;
        if v92.def_pitch:get() == 2 then
            rage.antiaim:override_hidden_pitch(v92.def_pitch_offset:get());
        elseif v92.def_pitch:get() == 3 then
            rage.antiaim:override_hidden_pitch(math.spin(v92.def_pitch_spin_speed:get(), v92.def_pitch_spin:get()));
        elseif v92.def_pitch:get() == 4 then
            rage.antiaim:override_hidden_pitch(rage.antiaim:inverter() and v92.def_pitch_offset:get() or -v92.def_pitch_offset:get());
        elseif v92.def_pitch:get() == 5 then
            rage.antiaim:override_hidden_pitch(math.random(-v92.def_pitch_offset:get(), v92.def_pitch_offset:get()));
        end;
        entity.get_players(true, true, function(v108)
            -- upvalues: v95 (ref)
            if v108:is_alive() then
                table.insert(v95, v108);
            end;
        end);
        if v21.shit_aa:get(1) and entity.get_game_rules().m_bWarmupPeriod then
            v13.yawoffset:override(math.spin(10, 360));
            rage.antiaim:override_hidden_pitch(0);
            rage.antiaim:override_hidden_yaw_offset(0);
            v13.bodyyaw:override(false);
            v13.lagoptions:override("Disabled");
            v13.hsoptions:override("Favor Fire Rate");
            v13.yawmodifier:override("Disabled");
            v13.options:override("");
            v13.pitch:override("Disabled");
        elseif v21.shit_aa:get(2) and #v95 == 0 then
            v13.yawoffset:override(math.spin(10, 360));
            rage.antiaim:override_hidden_pitch(0);
            rage.antiaim:override_hidden_yaw_offset(0);
            v13.bodyyaw:override(false);
            v13.lagoptions:override("Disabled");
            v13.hsoptions:override("Favor Fire Rate");
            v13.yawmodifier:override("Disabled");
            v13.options:override("");
            v13.pitch:override("Disabled");
        end;
        local v109 = v102:get_player_weapon();
        if not v109 then
            return;
        else
            local v110 = v109:get_classname();
            if not v110 then
                return;
            else
                if v21.safe_head:get(1) then
                    if v110 == "CKnife" and v107 then
                        v13.pitch:override("Down");
                        v13.yawmodifier:override("Disabled");
                        v13.yawoffset:override(18);
                        v13.options:override("");
                        v13.inverter:override(false);
                        v13.hidden:override(false);
                    end;
                elseif v21.safe_head:get(2) then
                    if v110 == "CWeaponTaser" and v107 then
                        v13.pitch:override("Down");
                        v13.yawmodifier:override("Disabled");
                        v13.yawoffset:override(18);
                        v13.options:override("");
                        v13.inverter:override(false);
                        v13.hidden:override(false);
                    end;
                elseif v21.safe_head:get(3) then
                    local v111 = entity.get_threat(true);
                    if not v111 then
                        return;
                    else
                        local v112 = v102:get_hitbox_position(1);
                        local v113 = v111:get_hitbox_position(1);
                        if not v112 then
                            return;
                        elseif not v113 then
                            return;
                        elseif v112.z - v113.z > 150 then
                            v13.pitch:override("Down");
                            v13.yawmodifier:override("Disabled");
                            v13.yawoffset:override(18);
                            v13.options:override("");
                            v13.inverter:override(false);
                            v13.hidden:override(false);
                        end;
                    end;
                end;
                v13.freestanding:override(v21.freestand:get());
                v13.disableyawmod:override(v21.freestand_static:get());
                v13.bodyfreestanding:override(v21.freestand_static:get());
                if v21.freestand:get() and v21.freestand_flick:get() then
                    if not rage.antiaim:get_target(true) then
                        return;
                    else
                        v13.lagoptions:override("Always On");
                        v13.hsoptions:override("Break LC");
                        rage.antiaim:override_hidden_yaw_offset(180);
                        rage.antiaim:override_hidden_pitch(0);
                    end;
                end;
                if v21.yaw_base:get() == "Backward" then
                    v13.yawbase:override("Local View");
                elseif v21.yaw_base:get() == "At Target" then
                    v13.yawbase:override("At Target");
                elseif v21.yaw_base:get() == "Left" then
                    v13.yawbase:override("Local View");
                    v13.yawoffset:override(-90);
                    v13.hidden:override(false);
                    if v21.yaw_base_clear:get() then
                        v13.yawmodifier:override("Disabled");
                        v13.options:override("");
                    end;
                    if v21.defensive_flick:get() then
                        v13.lagoptions:override("Always On");
                        v13.hsoptions:override("Break LC");
                        v13.hidden:override(true);
                        rage.antiaim:override_hidden_yaw_offset(180);
                        rage.antiaim:override_hidden_pitch(0);
                    end;
                elseif v21.yaw_base:get() == "Right" then
                    v13.yawbase:override("Local View");
                    v13.yawoffset:override(90);
                    v13.hidden:override(false);
                    if v21.yaw_base_clear:get() then
                        v13.yawmodifier:override("Disabled");
                        v13.options:override("");
                    end;
                    if v21.defensive_flick:get() then
                        v13.lagoptions:override("Always On");
                        v13.hsoptions:override("Break LC");
                        v13.hidden:override(true);
                        rage.antiaim:override_hidden_yaw_offset(180);
                        rage.antiaim:override_hidden_pitch(0);
                    end;
                elseif v21.yaw_base:get() == "Forward" then
                    v13.yawbase:override("Local View");
                    v13.yawoffset:override(180);
                    v13.hidden:override(false);
                    if v21.yaw_base_clear:get() then
                        v13.yawmodifier:override("Disabled");
                        v13.options:override("");
                    end;
                    if v21.defensive_flick:get() then
                        v13.lagoptions:override("Always On");
                        v13.hsoptions:override("Break LC");
                        v13.hidden:override(true);
                        rage.antiaim:override_hidden_yaw_offset(180);
                        rage.antiaim:override_hidden_pitch(0);
                    end;
                end;
                v95 = {};
                return;
            end;
        end;
    end;
end;
local l_realtime_0 = globals.realtime;
local l_realtime_1 = globals.realtime;
events.bullet_impact:set(function(v117)
    -- upvalues: l_realtime_1 (ref), v6 (ref), l_realtime_0 (ref)
    local v118 = entity.get_local_player();
    if not v118 then
        return;
    elseif not v118:is_alive() then
        return;
    else
        local v119 = entity.get(v117.userid, true);
        if not v119:is_enemy() then
            return;
        elseif entity.get_threat(true) == nil then
            return;
        else
            local v120 = (vector(v117.x, v117.y, v117.z) - v119:get_hitbox_position(0)):angles();
            local v121 = (v118:get_hitbox_position(3) - v119:get_hitbox_position(0)):angles() - v120;
            v121.y = math.clamp(v121.y, -180, 180);
            if math.sqrt(v121.y * v121.y + v121.x * v121.x) < 10 and l_realtime_1 + 0.1 < globals.realtime then
                v6[2] = v6[2] + 1;
                l_realtime_0 = globals.realtime;
                l_realtime_1 = globals.realtime + 0.1;
            end;
            return;
        end;
    end;
end);
local v122 = 0;
local v123 = 0;
local function v125()
    -- upvalues: v122 (ref), v123 (ref)
    local v124 = entity.get_local_player();
    if not v124 then
        return;
    else
        if bit.band(v124.m_fFlags, 1) == 1 then
            v122 = v122 + 1;
        else
            v122 = 0;
            v123 = globals.curtime + 1;
        end;
        return v122 > 1 and v123 > globals.curtime;
    end;
end;
local _ = ffi.typeof("uintptr_t**");
local v127 = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)");
ffi.cdef("    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder;\n        int m_nSequence;\n        float m_flPrevCycle;\n        float m_flWeight;\n        float m_flWeightDeltaRate;\n        float m_flPlaybackRate;\n        float m_flCycle;\n        void *m_pOwner;\n        char  pad_0038[4];\n    } animstate_layer_t;\n");
local function v132(v128)
    -- upvalues: v127 (ref), v21 (ref), v125 (ref)
    v128 = entity.get_local_player();
    if v128 == nil then
        return;
    elseif not v128:is_alive() then
        return;
    elseif v128:get_index() == nil then
        return;
    else
        local v129 = v127(v128:get_index());
        local v130 = v128.m_vecVelocity:length() > 5;
        local v131 = bit.band(v128.m_fFlags, 1) == 0;
        if not v21.anims:get() then
            return;
        else
            if v21.anims_ground:get() == "Sliding" then
                v128.m_flPoseParameter[0] = 1;
                ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Sliding");
            elseif v21.anims_ground:get() == "Moon Walk" then
                v128.m_flPoseParameter[7] = 1;
                ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Walking");
            elseif v21.anims_ground:get() == "Jitter" then
                v128.m_flPoseParameter[0] = globals.tickcount % 4 > 1 and v21.anims_ground_amount:get() / 100 or 1;
                ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override(globals.tickcount % 8 > 3 and "Walking" or "Sliding");
            end;
            if v21.anims_air:get() == "Static" then
                v128.m_flPoseParameter[6] = 1;
            elseif v21.anims_air:get() == "Jitter" then
                v128.m_flPoseParameter[6] = globals.tickcount % 4 > 1 and math.random(0, 10) / 10 or 1;
            elseif v21.anims_air:get() == "Moon Walk" and v130 and v131 then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v129) + 10640)[0][6].m_flWeight = 1;
            end;
            if v21.anims_other:get("Pitch Zero On Land") and v125() then
                v128.m_flPoseParameter[12] = 0.5;
            end;
            if v21.anims_other:get("EarthQuake") then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v129) + 10640)[0][12].m_flWeight = math.random(0, 100) / 100;
            elseif v21.anims_other:get("Move Lean") and v130 then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v129) + 10640)[0][12].m_flWeight = v21.anims_lean:get() / 100;
            end;
            return;
        end;
    end;
end;
events.post_update_clientside_animation:set(v132);
local v133 = {};
local v134 = render.screen_size();
local v135 = v134 / 2;
v133.dmg_ind = function()
    -- upvalues: v17 (ref), v135 (ref)
    local v136 = entity.get_local_player();
    if not v136 then
        return;
    elseif not v136:is_alive() then
        return;
    else
        render.text(v17.min_damage_font:get(), vector(v135.x + 5, v135.y - 15), v17.min_damage_color:get(), "", ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get());
        return;
    end;
end;
local v137 = 0;
local l_v137_0 = v137;
local function v139()
    -- upvalues: l_v137_0 (ref), v137 (ref), v139 (ref)
    utils.execute_after(0.1, function()
        -- upvalues: l_v137_0 (ref), v137 (ref), v139 (ref)
        l_v137_0 = v137;
        v139();
    end);
end;
v139();
v133.airlag = function(v140)
    -- upvalues: v21 (ref)
    local v141 = entity.get_local_player();
    if not v141 then
        return;
    elseif not v141:is_alive() then
        return;
    else
        local v142 = bit.band(v141.m_fFlags, 1) == 0 or v140.in_jump;
        if v21.airlag_hit:get() and not entity.get_threat(true) then
            return;
        else
            if v140.in_jump or v142 then
                v140.force_defensive = true;
                rage.exploit:allow_charge(true);
                rage.exploit:force_charge();
                if globals.tickcount % 5 + v21.airlag_ticks:get() > 1 then
                    rage.exploit:force_teleport();
                end;
            end;
            return;
        end;
    end;
end;
local v143 = render.load_font("Verdana", 15, "ad");
v133.custom_hud = function()
    -- upvalues: v137 (ref), l_mtools_0 (ref), v17 (ref), l_v137_0 (ref), v143 (ref), v134 (ref)
    if not entity.get_local_player() then
        return;
    else
        v137 = l_mtools_0.Client.GetFPS();
        local v144 = utils.net_channel();
        local v145 = math.floor(v144.latency[1] * 1000);
        local v146 = v144.loss[0];
        local v147 = math.floor(v146 * 100 + 0.5);
        local _ = v17.custom_hud_text_color:get():to_hex();
        local v149 = "\aDCDCDCFF fps: " .. l_v137_0 .. "  \aDCDCDCFFloss: " .. v147 .. "  \aDCDCDCFFping: " .. v145 .. " ";
        local v150 = render.measure_text(v143, "ad", v149);
        render.rect(vector(v134.x / 2 - 5 - v150.x / 2, v134.y - 32), vector(v134.x / 2 + v150.x + 5 - v150.x / 2, v134.y - 8), color(40, 40, 40, 150), 4);
        render.rect_outline(vector(v134.x / 2 - 5 - v150.x / 2, v134.y - 32), vector(v134.x / 2 + v150.x + 5 - v150.x / 2, v134.y - 8), color(v17.custom_hud_color:get().r, v17.custom_hud_color:get().g, v17.custom_hud_color:get().b, 150), 1, 4);
        render.shadow(vector(v134.x / 2 - 5 - v150.x / 2, v134.y - 32), vector(v134.x / 2 + v150.x + 5 - v150.x / 2, v134.y - 8), color(v17.custom_hud_color:get().r, v17.custom_hud_color:get().g, v17.custom_hud_color:get().b, 255), 20, 0, 4);
        render.text(v143, vector(v134.x / 2 - v150.x / 2, v134.y - 29), color(220), "", v149);
        return;
    end;
end;
local v151 = l_mtools_0.Client.GetAvatar();
v133.watermark = function()
    -- upvalues: l_gradient_0 (ref), v17 (ref), v135 (ref), v151 (ref)
    local v152 = entity.get_local_player();
    if not v152 then
        return;
    elseif not v152:is_alive() then
        return;
    else
        local v153 = l_gradient_0.text_animate("M A X S E N S E", -1, {
            color(220), 
            color(190), 
            color(160)
        });
        if v17.watermark:get() == "Default" then
            v153:animate();
            render.text(1, vector(25, v135.y - 15), color(255), "", v153:get_animated_text());
        else
            render.text(2, vector(55, v135.y - 50), color(255), "", "MAXSENSE");
            render.text(2, vector(55, v135.y - 40), color(255), "", "[PRIVATE]");
            render.texture(v151, vector(10, v135.y - 57), vector(40, 40));
        end;
        return;
    end;
end;
local v154 = 0;
v133.customscope = function()
    -- upvalues: v135 (ref), v154 (ref), v17 (ref)
    local l_x_0 = v135.x;
    local l_y_0 = v135.y;
    local v157 = entity.get_local_player();
    if not v157 then
        return;
    elseif not v157:is_alive() then
        return;
    else
        local l_m_bIsScoped_0 = v157.m_bIsScoped;
        v154 = math.lerp(v154, l_m_bIsScoped_0 and v17.custom_scope_color:get().a or 0, 10);
        local v159 = color(v17.custom_scope_color:get().r, v17.custom_scope_color:get().g, v17.custom_scope_color:get().b, v154);
        local v160 = color(v159.r, v159.g, v159.b, 1);
        if l_m_bIsScoped_0 then
            render.gradient(vector(l_x_0, l_y_0 + v17.custom_scope_offset:get()), vector(l_x_0 + 1, l_y_0 + v17.custom_scope_length:get() + v17.custom_scope_offset:get()), v159, v159, v160, v160);
            render.gradient(vector(l_x_0 + v17.custom_scope_length:get() + v17.custom_scope_offset:get(), l_y_0), vector(l_x_0 + v17.custom_scope_offset:get(), l_y_0 + 1), v160, v159, v160, v159);
            render.gradient(vector(l_x_0, l_y_0 - (v17.custom_scope_offset:get() - 1) - v17.custom_scope_length:get()), vector(l_x_0 + 1, l_y_0 - (v17.custom_scope_offset:get() - 1)), v160, v160, v159, v159);
            render.gradient(vector(l_x_0 - v17.custom_scope_length:get() - (v17.custom_scope_offset:get() - 1), l_y_0), vector(l_x_0 - (v17.custom_scope_offset:get() - 1), l_y_0 + 1), v160, v159, v160, v159);
        end;
        return;
    end;
end;
local v161 = {};
v133.screen_notify = function()
    -- upvalues: v134 (ref), v161 (ref), v135 (ref)
    local v162 = 0;
    local v163 = v134.y * 0.9;
    for v164, v165 in ipairs(v161) do
        local v166, v167, v168, v169 = unpack(v165);
        local v170 = globals.curtime - v168 < 4 and (not (#v161 > 6) or v164 >= #v161 - 5);
        local v171 = math.lerp(v167, v170 and 255 or 0, 20);
        v165[2] = v171;
        v162 = v162 + 25 * (v171 / 255);
        local v172 = render.measure_text(1, "od", v166);
        local l_x_1 = v135.x;
        local v174 = vector(l_x_1 - v172.x / 2, v163 - v162 + 6);
        local v175 = vector(l_x_1 + v172.x / 2, v163 - v162 + 6);
        render.shadow(v174, v175, color(v169.r, v169.g, v169.b, v171), 30, 0, 0);
        local v176 = vector(l_x_1 - v172.x / 2, v163 - v162);
        render.text(1, v176, color(255, 255, 255, v171), "od", v166);
        if v171 < 0.1 or not entity.get_local_player() then
            table.remove(v161, v164);
        end;
    end;
end;
render.notify = function(v177, v178)
    -- upvalues: v161 (ref)
    table.insert(v161, {
        [1] = nil, 
        [2] = 0, 
        [1] = v177, 
        [3] = globals.curtime, 
        [4] = v178
    });
end;
v133.lc_teleport = function(v179)
    local v180 = entity.get_local_player();
    if not v180 then
        return;
    elseif not v180:is_alive() then
        return;
    else
        local v181 = bit.band(v180.m_fFlags, 1) == 0;
        local v182 = v180.m_vecVelocity:length() > 10;
        if v181 and v182 and entity.get_threat(true) then
            v179.force_defensive = true;
            utils.execute_after(0.07, function()
                rage.exploit:force_teleport();
            end);
        end;
        return;
    end;
end;
local v183 = {
    freezetime_status = false, 
    freeze_check = false, 
    fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    is_fd_on = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get()
};
v183.fd:set_callback(function()
    -- upvalues: v183 (ref)
    v183.is_fd_on = v183.fd:get();
end);
v133.fast_fd = function(v184)
    -- upvalues: v183 (ref)
    if not v183.is_fd_on then
        return;
    else
        local v185 = entity.get_local_player();
        if not v185 or not v185:is_alive() then
            return;
        else
            local v186 = 5;
            local l_forwardmove_0 = v184.forwardmove;
            local l_sidemove_0 = v184.sidemove;
            if v186 < math.abs(l_forwardmove_0) or v186 < math.abs(l_sidemove_0) then
                local v189 = 450 / (l_forwardmove_0 * l_forwardmove_0 + l_sidemove_0 * l_sidemove_0) ^ 0.5;
                v184.forwardmove = l_forwardmove_0 * v189;
                v184.sidemove = l_sidemove_0 * v189;
            end;
            return;
        end;
    end;
end;
v133.freeze_fd = function()
    -- upvalues: v183 (ref)
    local v190 = entity.get_game_rules();
    if not v190 then
        return;
    else
        v183.freezetime_status = v190.m_bFreezePeriod;
        if v183.freezetime_status then
            v190.m_bFreezePeriod = false;
            v183.freeze_check = true;
        end;
        return;
    end;
end;
v133.freeze_fd_run = function()
    -- upvalues: v183 (ref)
    if not v183.freeze_check then
        return;
    else
        local v191 = entity.get_game_rules();
        if v191 then
            v191.m_bFreezePeriod = v183.freezetime_status;
            v183.freeze_check = false;
        end;
        return;
    end;
end;
local v192 = false;
v133.hegrenade_fix = function(v193)
    -- upvalues: v192 (ref)
    ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override();
    ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"):override("Auto Pistols");
    local v194 = entity.get_local_player();
    if not v194 then
        return;
    else
        local v195 = v194:get_player_weapon();
        if not v195 then
            return;
        else
            local v196 = v195:get_classname();
            if not v196 then
                return;
            else
                check_grenade = string.match(v196, "Grenade");
                if check_grenade then
                    rage.exploit:allow_defensive(false);
                    v193.force_defensive = false;
                    ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Disabled");
                else
                    v192 = false;
                end;
                local l_m_fThrowTime_0 = v195.m_fThrowTime;
                if l_m_fThrowTime_0 ~= nil and l_m_fThrowTime_0 ~= 0 then
                    v193.in_attack = true;
                    v192 = true;
                elseif v192 then
                    v193.in_attack = true;
                    utils.console_exec("slot2");
                    utils.console_exec("slot1");
                    v192 = false;
                end;
                if v193.weaponselect ~= 0 then
                    v193.force_defensive = true;
                end;
                return;
            end;
        end;
    end;
end;
v133.avoid_collision = function(v198)
    local v199 = entity.get_local_player();
    if not v199 or not v198.in_jump then
        return;
    else
        local l_huge_0 = math.huge;
        local v201 = nil;
        local l_m_vecOrigin_0 = v199.m_vecOrigin;
        local l_y_1 = render.camera_angles().y;
        for v204 = 1, 180 do
            local v205 = l_y_1 + v204 - 90;
            local v206 = math.compute_vector(0, v205);
            local v207 = vector(l_m_vecOrigin_0.x + v206.x * 70, l_m_vecOrigin_0.y + v206.y * 70, l_m_vecOrigin_0.z + 60);
            local v208 = l_m_vecOrigin_0:dist(utils.trace_line(l_m_vecOrigin_0, v207, nil, nil, 1).end_pos);
            if v208 < l_huge_0 then
                l_huge_0 = v208;
                v201 = v204;
            end;
        end;
        if v201 and l_huge_0 < 40 and not v198.in_back and not v198.in_moveleft and not v198.in_moveright then
            local v209 = v199.m_vecVelocity:length();
            local v210 = math.rad(v201);
            v198.sidemove = v209 * math.sin(v210);
            if v201 < 90 then
                v198.sidemove = -v198.sidemove;
            end;
            v198.forwardmove = math.abs(v209 * math.cos(v210));
        end;
        return;
    end;
end;
v133.autostop_func = function(v211, v212)
    local v213 = math.sqrt(v211.forwardmove * v211.forwardmove + v211.sidemove * v211.sidemove);
    if v212 <= 0 or v213 <= 0 then
        return;
    else
        if v211.in_duck == 1 then
            v212 = v212 * 2.94117647;
        end;
        if v213 <= v212 then
            return;
        else
            local v214 = v212 / v213;
            v211.forwardmove = v211.forwardmove * v214;
            v211.sidemove = v211.sidemove * v214;
            return;
        end;
    end;
end;
v133.check_attack = function(v215)
    if not v215 then
        return;
    else
        local v216 = v215:get_player_weapon();
        if not v216 then
            return;
        else
            return v216.m_flNextPrimaryAttack < globals.curtime;
        end;
    end;
end;
v133.dormantaimbot = function(v217)
    -- upvalues: v133 (ref)
    local v218 = entity.get_local_player();
    if not v218 then
        return;
    else
        local v219 = v218:get_player_weapon();
        if not v219 then
            return;
        else
            local v220 = v219:get_inaccuracy();
            if not v220 then
                return;
            else
                local v221 = v219:get_weapon_info();
                local _ = bit.band(v218.m_fFlags, 1) == 1;
                local v223 = v218:get_eye_position();
                local l_m_bIsScoped_1 = v218.m_bIsScoped;
                local v225 = entity.get_players(true, true);
                for v226 = 1, #v225 do
                    local v227 = v225[v226];
                    if v227:is_dormant() then
                        origin = v227:get_origin();
                        local v228 = v227:get_bbox();
                        if origin.x ~= 0 and v228.alpha ~= 0 and (v227:get_network_state() == 1 or not (v227:get_network_state() ~= 2) or not (v227:get_network_state() ~= 3) or v227:get_network_state() == 4) then
                            local v229 = origin + vector(0, 0, 30);
                            local v230 = v223:to(v229):angles();
                            local v231, v232 = utils.trace_bullet(v218, vector(v223.x, v223.y, v223.z), vector(v229.x, v229.y, v229.z), true);
                            if v232 then
                                if not v232:did_hit_world() then
                                    return;
                                elseif (v232.fraction < 1 or v232.fraction_left_solid == 1) and ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get() < v231 and not v227:is_visible() and v133.check_attack(v218) then
                                    v133.autostop_func(v217, (l_m_bIsScoped_1 and v221.max_player_speed_alt or v221.max_player_speed) * 0.33);
                                    if v221.weapon_class == "primary_sniper" and not l_m_bIsScoped_1 then
                                        v217.in_attack2 = 1;
                                    end;
                                    if v220 < 0.009 and not ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get() then
                                        v217.no_choke = true;
                                    end;
                                    if v220 < 0.009 and v217.choked_commands == 0 then
                                        v217.view_angles.x = v230.x;
                                        v217.view_angles.y = v230.y;
                                        v217.in_attack = 1;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
                return;
            end;
        end;
    end;
end;
v133.no_fall_damage = function(v233)
    local v234 = entity.get_local_player();
    if not v234 then
        return;
    elseif v234.m_vecVelocity.z > -500 then
        return;
    else
        local v235 = v234:get_origin();
        local v236 = vector(v235.x, v235.y, v235.z);
        local v237 = vector(v235.x, v235.y, v235.z - 15);
        local v238 = vector(v235.x, v235.y, v235.z - 50);
        local v239 = utils.trace_line(v236, v237);
        local v240 = utils.trace_line(v236, v238);
        if v239.fraction ~= 1 then
            v233.in_duck = 0;
        elseif v240.fraction ~= 1 then
            v233.in_duck = 1;
        end;
        return;
    end;
end;
v133.fastladder = function(v241)
    local v242 = entity.get_local_player();
    if not v242 or v242.m_MoveType ~= 9 then
        return;
    else
        local l_view_angles_0 = v241.view_angles;
        if v241.sidemove == 0 then
            l_view_angles_0.y = l_view_angles_0.y + 45;
        elseif v241.sidemove < 0 and v241.in_forward then
            l_view_angles_0.y = l_view_angles_0.y + 90;
        elseif v241.sidemove > 0 and v241.in_back then
            l_view_angles_0.y = l_view_angles_0.y + 90;
        end;
        v241.in_moveleft = v241.in_back;
        v241.in_moveright = v241.in_forward;
        if l_view_angles_0.x < 0 then
            l_view_angles_0.x = -45;
        end;
        return;
    end;
end;
v133.auto_hs = function(_)
    -- upvalues: v13 (ref), v17 (ref)
    local v245 = entity.get_local_player();
    if not v245 then
        return;
    else
        local v246 = v245:get_player_weapon();
        if not v246 then
            return;
        else
            local v247 = v246:get_weapon_info();
            if not v247 then
                return;
            else
                local v248 = bit.band(v245.m_fFlags, 1) == 1;
                local v249 = (not (v245.m_vecVelocity:length() >= 3) or ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):get()) and v248;
                local v250 = v245.m_flDuckAmount > 0.7 or v13.fakeduck:get();
                if v17.main_func2:get(3) and ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() and v247.cycle_time > 1 and rage.exploit:get() > 0.99 and (v250 and v248 or v249) and not ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"):get() then
                    ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):override(true);
                    ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override(false);
                else
                    ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):override();
                    ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override();
                end;
                return;
            end;
        end;
    end;
end;
local v252 = {
    adjust = function(v251)
        if v251.x > -10 then
            v251.x = 0.9 * v251.x + 9;
        else
            v251.x = 1.125 * v251.x + 11.25;
        end;
        return v251;
    end
};
v252.calculate_grenade_path = function(v253, v254, v255, v256)
    -- upvalues: v252 (ref)
    v253.x = v253.x - 10 + math.abs(v253.x) / 9;
    local v257 = vector():angles(v253);
    local v258 = v256 * 1.25;
    local v259 = math.clamp(v254 * 0.9, 15, 750);
    local v260 = math.clamp(v255, 0, 1);
    v259 = v259 * math.interpolate(0.3, 1, v260);
    local l_v257_0 = v257;
    for _ = 1, 8 do
        l_v257_0 = (v257 * (l_v257_0 * v259 + v258):length() - v258) / v259;
        l_v257_0:normalize();
    end;
    local v263 = l_v257_0.angles(l_v257_0);
    return (v252.adjust(v263));
end;
events.grenade_override_view:set(function(v264)
    -- upvalues: v17 (ref), v252 (ref)
    if not v17.main_func:get(1) then
        return;
    else
        local v265 = entity.get_local_player();
        if not v265 then
            return;
        else
            local v266 = v265:get_player_weapon();
            if not v266 then
                return;
            else
                local v267 = v266:get_weapon_info();
                if not v267 then
                    return;
                else
                    v264.angles = v252.calculate_grenade_path(v264.angles, v267.throw_velocity, v266.m_flThrowStrength, v264.velocity);
                    return;
                end;
            end;
        end;
    end;
end);
v133.super_toss = function(v268)
    -- upvalues: v252 (ref)
    if v268.jitter_move ~= true then
        return;
    else
        local v269 = entity.get_local_player();
        if not v269 then
            return;
        else
            local v270 = v269:get_player_weapon();
            if not v270 then
                return;
            else
                local v271 = v270:get_weapon_info();
                if not v271 or v271.weapon_type ~= 9 then
                    return;
                elseif v270.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
                    return;
                else
                    v268.in_speed = true;
                    local v272 = v269:simulate_movement();
                    v272:think();
                    v268.view_angles = v252.calculate_grenade_path(v268.view_angles, v271.throw_velocity, v270.m_flThrowStrength, v272.velocity);
                    return;
                end;
            end;
        end;
    end;
end;
v133.set_aspectratio = function()
    -- upvalues: v17 (ref)
    cvar.r_aspectratio:float(v17.aspectratio:get() and v17.aspectratio_value:get() / 100 or 0);
end;
v133.set_aspectratio();
v17.aspectratio:set_callback(function()
    -- upvalues: v133 (ref)
    v133.set_aspectratio();
end);
v17.aspectratio_value:set_callback(function()
    -- upvalues: v133 (ref)
    v133.set_aspectratio();
end);
v133.set_viewmodel = function()
    -- upvalues: v17 (ref)
    cvar.sv_competitive_minspec:int(0);
    cvar.viewmodel_fov:int(v17.viewmodel:get() and v17.viewmodel_fov:get() or 68);
    cvar.viewmodel_offset_x:float(v17.viewmodel:get() and v17.viewmodel_x:get() / 10 or 2.5);
    cvar.viewmodel_offset_y:float(v17.viewmodel:get() and v17.viewmodel_y:get() / 10 or 0);
    cvar.viewmodel_offset_z:float(v17.viewmodel:get() and v17.viewmodel_z:get() / 10 or -1.5);
end;
v133.set_viewmodel();
v17.viewmodel:set_callback(function()
    -- upvalues: v133 (ref)
    v133.set_viewmodel();
end);
v17.viewmodel_fov:set_callback(function()
    -- upvalues: v133 (ref)
    v133.set_viewmodel();
end);
v17.viewmodel_x:set_callback(function()
    -- upvalues: v133 (ref)
    v133.set_viewmodel();
end);
v17.viewmodel_y:set_callback(function()
    -- upvalues: v133 (ref)
    v133.set_viewmodel();
end);
v17.viewmodel_z:set_callback(function()
    -- upvalues: v133 (ref)
    v133.set_viewmodel();
end);
local v273 = {
    [0] = "generic", 
    [1] = "head", 
    [2] = "chest", 
    [3] = "stomach", 
    [4] = "left arm", 
    [5] = "right arm", 
    [6] = "left leg", 
    [7] = "right leg", 
    [8] = "neck", 
    [9] = "generic", 
    [10] = "gear"
};
events.aim_ack:set(function(v274)
    -- upvalues: v17 (ref), v273 (ref), v6 (ref)
    local v275 = entity.get(v274.target);
    if not v275 then
        return;
    else
        local v276 = v17.screen_logs_hit:get();
        local v277 = color(v276.r, v276.g, v276.b, 255);
        local v278 = v277:to_hex();
        local v279 = v17.logs_hit:get();
        local v280 = "\a" .. color(v279.r, v279.g, v279.b, 255):to_hex();
        local v281 = v273[v274.hitgroup];
        local l_damage_0 = v274.damage;
        if v274.state == nil then
            if v274.wanted_hitgroup ~= v274.hitgroup then
                v281 = string.format("%s (%s)", v281, v273[v274.wanted_hitgroup or v274.hitgroup]);
            end;
            if v274.wanted_damage ~= v274.damage then
                l_damage_0 = string.format("%s (%s)", l_damage_0, v274.wanted_damage);
            end;
            local v283 = string.format("%s[maxsense]\aFFFFFFFF Registered shot in %s%s\aFFFFFFFF %s for%s %s damage\aFFFFFFFF (hitchance: %s%d%%\aFFFFFFFF | safety: %s1\aFFFFFFFF | history(\206\148): %s%d\aFFFFFFFF)", v280, v280, v275:get_name(), v281, v280, l_damage_0, v280, v274.hitchance, v280, v280, v274.backtrack);
            local v284 = string.format("", v278, ui.get_icon(""), v278, v275:get_name(), v281, v278, v274.hitchance, v278, l_damage_0);
            if v17.screen_logs:get() then
                render.notify(v284, v277);
            end;
            if v17.logs:get("Event") then
                print_dev(v283);
            end;
            if v17.logs:get("Console") then
                print_raw(v283);
            end;
            if v275.m_iHealth < 1 then
                v6[1] = v6[1] + 1;
            end;
        else
            v281 = v273[v274.wanted_hitgroup];
            l_damage_0 = v274.damage;
            local v285 = v17.screen_logs_miss:get();
            local v286 = color(v285.r, v285.g, v285.b, 255);
            local v287 = v286:to_hex();
            local v288 = v17.logs_miss:get();
            local v289 = "\a" .. color(v288.r, v288.g, v288.b, 255):to_hex();
            local v290 = string.format("%s[maxsense]\aFFFFFFFF Missed shot at %s%s\aFFFFFFFF %s(%d%%) due to%s %s \aFFFFFFFFdmg:%s %d \aFFFFFFFFsafety: %s1\aFFFFFFFF history(\206\148):%s%d\aFFFFFFFF)", v289, v289, v275:get_name(), v281, v274.hitchance, v289, v274.state, v289, v274.wanted_damage, v289, v289, v274.backtrack);
            local v291 = string.format("", v287, ui.get_icon(""), v287, v275:get_name(), v281, v287, v274.hitchance, v287, v274.state);
            if v17.screen_logs:get() then
                render.notify(v291, v286);
            end;
            if v17.logs:get("Event") then
                print_dev(v290);
            end;
            if v17.logs:get("Console") then
                print_raw(v290);
            end;
        end;
        return;
    end;
end);
events.createmove_run:set(function(v292)
    -- upvalues: v17 (ref), v133 (ref)
    if v17.fd_settings:get() then
        if v17.fd_settings_list:get(1) then
            v133.fast_fd(v292);
        end;
        if v17.fd_settings_list:get(2) then
            v133.freeze_fd_run();
        end;
    end;
end);
events.createmove:set(function(v293)
    -- upvalues: v114 (ref), v17 (ref), v133 (ref), v21 (ref)
    if not entity.get_local_player() then
        return;
    else
        v114(v293);
        if v17.fake_ping:get() then
            ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):override(v17.fake_ping_value:get());
        else
            ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):override();
        end;
        if v17.main_func2:get(2) then
            v133.avoid_collision(v293);
        end;
        if v17.main_func2:get(1) then
            v133.hegrenade_fix(v293);
        else
            check_grenade = false;
        end;
        if v17.main_func:get(3) then
            v133.no_fall_damage(v293);
        end;
        if v17.main_func:get(2) then
            v133.fastladder(v293);
        end;
        if v17.dormant_aimbot:get() then
            v133.dormantaimbot(v293);
        end;
        if v17.main_func:get(1) then
            v133.super_toss(v293);
        end;
        if v17.fd_settings:get() and v17.fd_settings_list:get(2) then
            v133.freeze_fd();
        end;
        if v17.lc_teleport:get() then
            v133.lc_teleport(v293);
        end;
        if v21.airlag:get() then
            v133.airlag(v293);
        end;
        v133.auto_hs(v293);
        return;
    end;
end);
events.render:set(function()
    -- upvalues: v133 (ref), v17 (ref), l_gradient_0 (ref)
    v133.screen_notify();
    if v17.min_damage:get() then
        v133.dmg_ind();
    end;
    v133.watermark();
    if v17.custom_scope:get() then
        ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):override("Remove All");
        v133.customscope();
    else
        ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):override();
    end;
    local v294 = l_gradient_0.text_animate("M A X S E N S E", -1, {
        color(220), 
        color(190), 
        color(160)
    });
    if ui.get_alpha() > 0 then
        v294:animate();
        ui.sidebar(v294:get_animated_text(), ui.get_icon("cube"));
    end;
end);
events.round_start:set(function()
    -- upvalues: v161 (ref), v95 (ref)
    v161 = {};
    v95 = {};
end);
events.level_init:set(function()
    -- upvalues: v161 (ref), v95 (ref)
    v161 = {};
    v95 = {};
end);
events.shutdown:set(function()
    -- upvalues: v7 (ref), v6 (ref), v183 (ref)
    local v295 = common.get_unixtime() - v7;
    v6[3] = v6[3] + v295;
    db.maxsense_data = v6;
    cvar.r_aspectratio:float(0);
    cvar.viewmodel_fov:int(68);
    cvar.viewmodel_offset_x:float(2.5);
    cvar.viewmodel_offset_y:float(0);
    cvar.viewmodel_offset_z:float(-1.5);
    db.maxsense_cfg1 = config_data;
    if v183.freeze_check then
        local v296 = entity.get_game_rules();
        if v296 then
            v296.m_bFreezePeriod = v183.freezetime_status;
        end;
    end;
end);
local v297 = l_pui_0.setup({
    [1] = v17, 
    [2] = v21, 
    [3] = v22, 
    [4] = v36
}, true);
local v298 = {};
local v299 = {};
local v300 = db.maxsense_cfg or {};
v300.config_list = v300.config_list or {
    [1] = {
        [1] = "Default", 
        [2] = "W3siYWFfb3ZlcnJpZGUiOlsifiJdLCJhbmltX2JyZWFrIjp0cnVlLCJhbmltX2JyZWFrX2FpciI6IlN0YXRpYyIsImFuaW1fYnJlYWtfZ3JvdW5kIjoiQmV0dGVyIEppdHRlciIsImFuaW1fYnJlYWtfZ3JvdW5kX2Ftb3VudCI6MTAuMCwiYW5pbV9icmVha19sZWFuIjoxMC4wLCJhbmltX2JyZWFrX290aGVyIjpbIk1vdmUgTGVhbiIsIn4iXSwiYXZvaWRfYmFja3N0YWIiOjIuMCwiY29uZGl0aW9uIjoiQWlyK0MiLCJmcmVlc3RhbmRpbmciOmZhbHNlLCJmcmVlc3RhbmRpbmdfZmxpY2siOmZhbHNlLCJmcmVlc3RhbmRpbmdfZmxpY2tfb2Zmc2V0IjowLjAsImZyZWVzdGFuZGluZ19zdGF0aWMiOnRydWUsInBpdGNoIjoiRG93biIsInNhZmVfaGVhZCI6WyJBaXIrQyBLbmlmZSIsIn4iXSwic2lkZSI6MS4wLCJ5YXdfYmFzZSI6IkF0IFRhcmdldCIsInlhd19iYXNlX2ZsaWNrIjpmYWxzZSwieWF3X2Jhc2VfZmxpY2tfb2Zmc2V0IjowLjAsInlhd19iYXNlX3N0YXRpYyI6ZmFsc2V9LHsiYXNwZWN0cmF0aW8iOnRydWUsImFzcGVjdHJhdGlvX3ZhbHVlIjoxMzMuMCwiYXV0b19oaWRlc2hvdHMiOnRydWUsImF2b2lkX2NvbGxpc2lvbiI6dHJ1ZSwiY3VzdG9tX2h1ZCI6dHJ1ZSwiY3VzdG9tX2h1ZF9jb2xvciI6IiM2NDY0NjQ5NiIsImN1c3RvbV9odWRfdGV4dF9jb2xvciI6IiM5OTk5OTlGRiIsImN1c3RvbV9zY29wZSI6dHJ1ZSwiY3VzdG9tX3Njb3BlX2NvbG9yIjoiI0M4QzhDOEM4IiwiY3VzdG9tX3Njb3BlX2xlbmd0aCI6MTg4LjAsImN1c3RvbV9zY29wZV9vZmZzZXQiOjMuMCwiZG9ybWFudF9haW1ib3QiOmZhbHNlLCJmYWtlX3BpbmciOmZhbHNlLCJmYWtlX3BpbmdfdmFsdWUiOjAuMCwiZmRfc2V0dGluZ3MiOmZhbHNlLCJmZF9zZXR0aW5nc19saXN0IjpbIn4iXSwibGNfdGVsZXBvcnQiOmZhbHNlLCJsb2dzIjpbIkNvbnNvbGUiLCJ+Il0sImxvZ3NfaGl0IjoiI0M5QzdGRkZGIiwibG9nc19taXNzIjoiIzZBNkE2QUZGIiwibWFpbl9mdW5jIjpbMS4wLDIuMCwifiJdLCJtaW5fZGFtYWdlIjp0cnVlLCJtaW5fZGFtYWdlX2NvbG9yIjoiI0ExQTFBMUZGIiwibWluX2RhbWFnZV9mb250IjoyLjAsIm5hZGVfZml4Ijp0cnVlLCJzY3JlZW5fbG9ncyI6dHJ1ZSwic2NyZWVuX2xvZ3NfaGl0IjoiIzZDODFDQkZGIiwic2NyZWVuX2xvZ3NfbWlzcyI6IiM2QTZBNkFGRiIsInZpZXdtb2RlbCI6dHJ1ZSwidmlld21vZGVsX2ZvdiI6NzkuMCwidmlld21vZGVsX3giOi03LjAsInZpZXdtb2RlbF95IjotMjUuMCwidmlld21vZGVsX3oiOjEwLjAsIndhdGVybWFyayI6IkRlZmF1bHQifSxbeyJib2R5X3lhdyI6dHJ1ZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjotOTAuMCwiZGVmX3lhd19zcGVlZCI6MjAuMCwiZGVmX3lhd19zcGluIjowLjAsImRlZmVuc2l2ZV9mbGljayI6IkwmUiIsImRlZmVuc2l2ZV9mbGlja19sIjozNS4wLCJkZWZlbnNpdmVfZmxpY2tfb2Zmc2V0IjotOTAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOi0zNS4wLCJkZWZlbnNpdmVfZmxpY2tfcmFuZG9tIjoxMC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImVuYWJsZSI6ZmFsc2UsImZvcmNlX2RlZmVuc2l2ZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MjAuMCwibW9kX29mZnNldCI6LTE0LjAsIm1vZF9yYW5kb20iOjEwLjAsIm1vZF90eXBlIjoiQ2VudGVyIiwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInlhdyI6MC4wLCJ5YXdfZGVsYXkiOjQuMCwieWF3X2RlbGF5X3JhbmQiOjAuMCwieWF3X2xlZnQiOjMuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjIxLjAsInlhd190eXBlIjoxLjB9LHsiYm9keV95YXciOmZhbHNlLCJkZWZfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZl9waXRjaF9zcGVlZCI6MjAuMCwiZGVmX3BpdGNoX3NwaW4iOjAuMCwiZGVmX3lhd19vZmZzZXQiOjAuMCwiZGVmX3lhd19zcGVlZCI6MjAuMCwiZGVmX3lhd19zcGluIjowLjAsImRlZmVuc2l2ZV9mbGljayI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX2ZsaWNrX2wiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfZmxpY2tfciI6MC4wLCJkZWZlbnNpdmVfZmxpY2tfcmFuZG9tIjowLjAsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZW5hYmxlIjpmYWxzZSwiZm9yY2VfZGVmZW5zaXZlIjpbIn4iXSwiZnJlZXN0YW5kIjoiT2ZmIiwiaW52ZXJ0IjpmYWxzZSwibGJ5X2wiOjYwLjAsImxieV9yIjo2MC4wLCJsYnlfcmFuZG9tIjowLjAsIm1vZF9vZmZzZXQiOjAuMCwibW9kX3JhbmRvbSI6MC4wLCJtb2RfdHlwZSI6IkRpc2FibGVkIiwib3B0aW9ucyI6WyJ+Il0sInlhdyI6MC4wLCJ5YXdfZGVsYXkiOjQuMCwieWF3X2RlbGF5X3JhbmQiOjAuMCwieWF3X2xlZnQiOjAuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjAuMCwieWF3X3R5cGUiOjEuMH0seyJib2R5X3lhdyI6dHJ1ZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJMJlIiLCJkZWZlbnNpdmVfZmxpY2tfbCI6MTAuMCwiZGVmZW5zaXZlX2ZsaWNrX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfZmxpY2tfciI6LTEwLjAsImRlZmVuc2l2ZV9mbGlja19yYW5kb20iOjEwLjAsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZW5hYmxlIjp0cnVlLCJmb3JjZV9kZWZlbnNpdmUiOlsifiJdLCJmcmVlc3RhbmQiOiJPZmYiLCJpbnZlcnQiOmZhbHNlLCJsYnlfbCI6NjAuMCwibGJ5X3IiOjYwLjAsImxieV9yYW5kb20iOjAuMCwibW9kX29mZnNldCI6LTY2LjAsIm1vZF9yYW5kb20iOjAuMCwibW9kX3R5cGUiOiJDZW50ZXIiLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwieWF3IjozLjAsInlhd19kZWxheSI6NC4wLCJ5YXdfZGVsYXlfcmFuZCI6MC4wLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MC4wLCJ5YXdfdHlwZSI6MS4wfSx7ImJvZHlfeWF3IjpmYWxzZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9mbGlja19sIjowLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3JhbmRvbSI6MC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImVuYWJsZSI6ZmFsc2UsImZvcmNlX2RlZmVuc2l2ZSI6WyJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MC4wLCJtb2Rfb2Zmc2V0IjowLjAsIm1vZF9yYW5kb20iOjAuMCwibW9kX3R5cGUiOiJEaXNhYmxlZCIsIm9wdGlvbnMiOlsifiJdLCJ5YXciOjAuMCwieWF3X2RlbGF5Ijo0LjAsInlhd19kZWxheV9yYW5kIjowLjAsInlhd19sZWZ0IjowLjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0IjowLjAsInlhd190eXBlIjoxLjB9LHsiYm9keV95YXciOnRydWUsImRlZl9waXRjaF9vZmZzZXQiOjAuMCwiZGVmX3BpdGNoX3NwZWVkIjoyMC4wLCJkZWZfcGl0Y2hfc3BpbiI6MC4wLCJkZWZfeWF3X29mZnNldCI6MC4wLCJkZWZfeWF3X3NwZWVkIjoyMC4wLCJkZWZfeWF3X3NwaW4iOjAuMCwiZGVmZW5zaXZlX2ZsaWNrIjoiTCZSIiwiZGVmZW5zaXZlX2ZsaWNrX2wiOjIyLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOi0yMC4wLCJkZWZlbnNpdmVfZmxpY2tfcmFuZG9tIjo3LjAsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZW5hYmxlIjp0cnVlLCJmb3JjZV9kZWZlbnNpdmUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJmcmVlc3RhbmQiOiJPZmYiLCJpbnZlcnQiOmZhbHNlLCJsYnlfbCI6NjAuMCwibGJ5X3IiOjYwLjAsImxieV9yYW5kb20iOjAuMCwibW9kX29mZnNldCI6LTM4LjAsIm1vZF9yYW5kb20iOjguMCwibW9kX3R5cGUiOiJDZW50ZXIiLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwieWF3Ijo2LjAsInlhd19kZWxheSI6NC4wLCJ5YXdfZGVsYXlfcmFuZCI6MC4wLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MC4wLCJ5YXdfdHlwZSI6MS4wfSx7ImJvZHlfeWF3Ijp0cnVlLCJkZWZfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZl9waXRjaF9zcGVlZCI6MjAuMCwiZGVmX3BpdGNoX3NwaW4iOjAuMCwiZGVmX3lhd19vZmZzZXQiOjAuMCwiZGVmX3lhd19zcGVlZCI6MjAuMCwiZGVmX3lhd19zcGluIjowLjAsImRlZmVuc2l2ZV9mbGljayI6IkwmUiIsImRlZmVuc2l2ZV9mbGlja19sIjoxNS4wLCJkZWZlbnNpdmVfZmxpY2tfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV9mbGlja19yIjotMTUuMCwiZGVmZW5zaXZlX2ZsaWNrX3JhbmRvbSI6OC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImVuYWJsZSI6dHJ1ZSwiZm9yY2VfZGVmZW5zaXZlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZnJlZXN0YW5kIjoiT2ZmIiwiaW52ZXJ0IjpmYWxzZSwibGJ5X2wiOjYwLjAsImxieV9yIjo2MC4wLCJsYnlfcmFuZG9tIjowLjAsIm1vZF9vZmZzZXQiOi0zMy4wLCJtb2RfcmFuZG9tIjowLjAsIm1vZF90eXBlIjoiQ2VudGVyIiwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInlhdyI6NS4wLCJ5YXdfZGVsYXkiOjQuMCwieWF3X2RlbGF5X3JhbmQiOjAuMCwieWF3X2xlZnQiOjAuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjAuMCwieWF3X3R5cGUiOjEuMH0seyJib2R5X3lhdyI6dHJ1ZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJMJlIiLCJkZWZlbnNpdmVfZmxpY2tfbCI6LTIyLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOjIyLjAsImRlZmVuc2l2ZV9mbGlja19yYW5kb20iOjcuMCwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfeWF3IjoiRGlzYWJsZWQiLCJlbmFibGUiOnRydWUsImZvcmNlX2RlZmVuc2l2ZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MC4wLCJtb2Rfb2Zmc2V0IjotNS4wLCJtb2RfcmFuZG9tIjoxOS4wLCJtb2RfdHlwZSI6IkNlbnRlciIsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJ5YXciOjAuMCwieWF3X2RlbGF5Ijo0LjAsInlhd19kZWxheV9yYW5kIjoxLjAsInlhd19sZWZ0IjotNS4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MTUuMCwieWF3X3R5cGUiOjEuMH0seyJib2R5X3lhdyI6dHJ1ZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJMJlIiLCJkZWZlbnNpdmVfZmxpY2tfbCI6LTIyLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOjI3LjAsImRlZmVuc2l2ZV9mbGlja19yYW5kb20iOjguMCwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfeWF3IjoiRGlzYWJsZWQiLCJlbmFibGUiOnRydWUsImZvcmNlX2RlZmVuc2l2ZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MTAuMCwibW9kX29mZnNldCI6MC4wLCJtb2RfcmFuZG9tIjowLjAsIm1vZF90eXBlIjoiQ2VudGVyIiwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInlhdyI6MjQuMCwieWF3X2RlbGF5Ijo1LjAsInlhd19kZWxheV9yYW5kIjowLjAsInlhd19sZWZ0IjoxOC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6My4wLCJ5YXdfdHlwZSI6Mi4wfSx7ImJvZHlfeWF3IjpmYWxzZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9mbGlja19sIjowLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3JhbmRvbSI6MC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImVuYWJsZSI6ZmFsc2UsImZvcmNlX2RlZmVuc2l2ZSI6WyJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MC4wLCJtb2Rfb2Zmc2V0IjowLjAsIm1vZF9yYW5kb20iOjAuMCwibW9kX3R5cGUiOiJEaXNhYmxlZCIsIm9wdGlvbnMiOlsifiJdLCJ5YXciOjAuMCwieWF3X2RlbGF5Ijo0LjAsInlhd19kZWxheV9yYW5kIjowLjAsInlhd19sZWZ0IjowLjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0IjowLjAsInlhd190eXBlIjoxLjB9XSxbeyJib2R5X3lhdyI6dHJ1ZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjotOTAuMCwiZGVmX3lhd19zcGVlZCI6MjAuMCwiZGVmX3lhd19zcGluIjowLjAsImRlZmVuc2l2ZV9mbGljayI6IkwmUiIsImRlZmVuc2l2ZV9mbGlja19sIjozNS4wLCJkZWZlbnNpdmVfZmxpY2tfb2Zmc2V0IjotOTAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOi0zNS4wLCJkZWZlbnNpdmVfZmxpY2tfcmFuZG9tIjoxMC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImVuYWJsZSI6ZmFsc2UsImZvcmNlX2RlZmVuc2l2ZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MjAuMCwibW9kX29mZnNldCI6LTE0LjAsIm1vZF9yYW5kb20iOjEwLjAsIm1vZF90eXBlIjoiQ2VudGVyIiwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInlhdyI6MC4wLCJ5YXdfZGVsYXkiOjQuMCwieWF3X2RlbGF5X3JhbmQiOjAuMCwieWF3X2xlZnQiOjMuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjIxLjAsInlhd190eXBlIjoxLjB9LHsiYm9keV95YXciOmZhbHNlLCJkZWZfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZl9waXRjaF9zcGVlZCI6MjAuMCwiZGVmX3BpdGNoX3NwaW4iOjAuMCwiZGVmX3lhd19vZmZzZXQiOjAuMCwiZGVmX3lhd19zcGVlZCI6MjAuMCwiZGVmX3lhd19zcGluIjowLjAsImRlZmVuc2l2ZV9mbGljayI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX2ZsaWNrX2wiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfZmxpY2tfciI6MC4wLCJkZWZlbnNpdmVfZmxpY2tfcmFuZG9tIjowLjAsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZW5hYmxlIjpmYWxzZSwiZm9yY2VfZGVmZW5zaXZlIjpbIn4iXSwiZnJlZXN0YW5kIjoiT2ZmIiwiaW52ZXJ0IjpmYWxzZSwibGJ5X2wiOjYwLjAsImxieV9yIjo2MC4wLCJsYnlfcmFuZG9tIjowLjAsIm1vZF9vZmZzZXQiOjAuMCwibW9kX3JhbmRvbSI6MC4wLCJtb2RfdHlwZSI6IkRpc2FibGVkIiwib3B0aW9ucyI6WyJ+Il0sInlhdyI6MC4wLCJ5YXdfZGVsYXkiOjQuMCwieWF3X2RlbGF5X3JhbmQiOjAuMCwieWF3X2xlZnQiOjAuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjAuMCwieWF3X3R5cGUiOjEuMH0seyJib2R5X3lhdyI6dHJ1ZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJMJlIiLCJkZWZlbnNpdmVfZmxpY2tfbCI6MTAuMCwiZGVmZW5zaXZlX2ZsaWNrX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfZmxpY2tfciI6LTEwLjAsImRlZmVuc2l2ZV9mbGlja19yYW5kb20iOjEwLjAsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZW5hYmxlIjp0cnVlLCJmb3JjZV9kZWZlbnNpdmUiOlsifiJdLCJmcmVlc3RhbmQiOiJPZmYiLCJpbnZlcnQiOmZhbHNlLCJsYnlfbCI6NjAuMCwibGJ5X3IiOjYwLjAsImxieV9yYW5kb20iOjAuMCwibW9kX29mZnNldCI6LTY2LjAsIm1vZF9yYW5kb20iOjAuMCwibW9kX3R5cGUiOiJDZW50ZXIiLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwieWF3IjozLjAsInlhd19kZWxheSI6NC4wLCJ5YXdfZGVsYXlfcmFuZCI6MC4wLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MC4wLCJ5YXdfdHlwZSI6MS4wfSx7ImJvZHlfeWF3IjpmYWxzZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9mbGlja19sIjowLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3JhbmRvbSI6MC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImVuYWJsZSI6ZmFsc2UsImZvcmNlX2RlZmVuc2l2ZSI6WyJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MC4wLCJtb2Rfb2Zmc2V0IjowLjAsIm1vZF9yYW5kb20iOjAuMCwibW9kX3R5cGUiOiJEaXNhYmxlZCIsIm9wdGlvbnMiOlsifiJdLCJ5YXciOjAuMCwieWF3X2RlbGF5Ijo0LjAsInlhd19kZWxheV9yYW5kIjowLjAsInlhd19sZWZ0IjowLjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0IjowLjAsInlhd190eXBlIjoxLjB9LHsiYm9keV95YXciOnRydWUsImRlZl9waXRjaF9vZmZzZXQiOjAuMCwiZGVmX3BpdGNoX3NwZWVkIjoyMC4wLCJkZWZfcGl0Y2hfc3BpbiI6MC4wLCJkZWZfeWF3X29mZnNldCI6MC4wLCJkZWZfeWF3X3NwZWVkIjoyMC4wLCJkZWZfeWF3X3NwaW4iOjAuMCwiZGVmZW5zaXZlX2ZsaWNrIjoiTCZSIiwiZGVmZW5zaXZlX2ZsaWNrX2wiOjIyLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOi0yMC4wLCJkZWZlbnNpdmVfZmxpY2tfcmFuZG9tIjo3LjAsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZW5hYmxlIjp0cnVlLCJmb3JjZV9kZWZlbnNpdmUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJmcmVlc3RhbmQiOiJPZmYiLCJpbnZlcnQiOmZhbHNlLCJsYnlfbCI6NjAuMCwibGJ5X3IiOjYwLjAsImxieV9yYW5kb20iOjAuMCwibW9kX29mZnNldCI6LTM4LjAsIm1vZF9yYW5kb20iOjguMCwibW9kX3R5cGUiOiJDZW50ZXIiLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwieWF3Ijo2LjAsInlhd19kZWxheSI6NC4wLCJ5YXdfZGVsYXlfcmFuZCI6MC4wLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MC4wLCJ5YXdfdHlwZSI6MS4wfSx7ImJvZHlfeWF3Ijp0cnVlLCJkZWZfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZl9waXRjaF9zcGVlZCI6MjAuMCwiZGVmX3BpdGNoX3NwaW4iOjAuMCwiZGVmX3lhd19vZmZzZXQiOjAuMCwiZGVmX3lhd19zcGVlZCI6MjAuMCwiZGVmX3lhd19zcGluIjowLjAsImRlZmVuc2l2ZV9mbGljayI6IkwmUiIsImRlZmVuc2l2ZV9mbGlja19sIjoxNS4wLCJkZWZlbnNpdmVfZmxpY2tfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV9mbGlja19yIjotMTUuMCwiZGVmZW5zaXZlX2ZsaWNrX3JhbmRvbSI6OC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImVuYWJsZSI6dHJ1ZSwiZm9yY2VfZGVmZW5zaXZlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZnJlZXN0YW5kIjoiT2ZmIiwiaW52ZXJ0IjpmYWxzZSwibGJ5X2wiOjYwLjAsImxieV9yIjo2MC4wLCJsYnlfcmFuZG9tIjowLjAsIm1vZF9vZmZzZXQiOi0zMy4wLCJtb2RfcmFuZG9tIjowLjAsIm1vZF90eXBlIjoiQ2VudGVyIiwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInlhdyI6NS4wLCJ5YXdfZGVsYXkiOjQuMCwieWF3X2RlbGF5X3JhbmQiOjAuMCwieWF3X2xlZnQiOjAuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjAuMCwieWF3X3R5cGUiOjEuMH0seyJib2R5X3lhdyI6dHJ1ZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJMJlIiLCJkZWZlbnNpdmVfZmxpY2tfbCI6LTIyLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOjIyLjAsImRlZmVuc2l2ZV9mbGlja19yYW5kb20iOjcuMCwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfeWF3IjoiRGlzYWJsZWQiLCJlbmFibGUiOnRydWUsImZvcmNlX2RlZmVuc2l2ZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MC4wLCJtb2Rfb2Zmc2V0IjotNS4wLCJtb2RfcmFuZG9tIjoxOS4wLCJtb2RfdHlwZSI6IkNlbnRlciIsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJ5YXciOjAuMCwieWF3X2RlbGF5Ijo0LjAsInlhd19kZWxheV9yYW5kIjoxLjAsInlhd19sZWZ0IjotNS4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MTUuMCwieWF3X3R5cGUiOjEuMH0seyJib2R5X3lhdyI6dHJ1ZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJMJlIiLCJkZWZlbnNpdmVfZmxpY2tfbCI6LTIyLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOjI3LjAsImRlZmVuc2l2ZV9mbGlja19yYW5kb20iOjguMCwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfeWF3IjoiRGlzYWJsZWQiLCJlbmFibGUiOnRydWUsImZvcmNlX2RlZmVuc2l2ZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MTAuMCwibW9kX29mZnNldCI6MC4wLCJtb2RfcmFuZG9tIjowLjAsIm1vZF90eXBlIjoiQ2VudGVyIiwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInlhdyI6MjQuMCwieWF3X2RlbGF5Ijo1LjAsInlhd19kZWxheV9yYW5kIjowLjAsInlhd19sZWZ0IjoxOC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6My4wLCJ5YXdfdHlwZSI6Mi4wfSx7ImJvZHlfeWF3IjpmYWxzZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9mbGlja19sIjowLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3JhbmRvbSI6MC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImVuYWJsZSI6ZmFsc2UsImZvcmNlX2RlZmVuc2l2ZSI6WyJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MC4wLCJtb2Rfb2Zmc2V0IjowLjAsIm1vZF9yYW5kb20iOjAuMCwibW9kX3R5cGUiOiJEaXNhYmxlZCIsIm9wdGlvbnMiOlsifiJdLCJ5YXciOjAuMCwieWF3X2RlbGF5Ijo0LjAsInlhd19kZWxheV9yYW5kIjowLjAsInlhd19sZWZ0IjowLjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0IjowLjAsInlhd190eXBlIjoxLjB9XV0="
    }
};
v300.menu_list = v300.menu_list or {
    [1] = "Default"
};
v300.config_list[1][2] = "W3siYWFfb3ZlcnJpZGUiOlsifiJdLCJhbmltX2JyZWFrIjp0cnVlLCJhbmltX2JyZWFrX2FpciI6IlN0YXRpYyIsImFuaW1fYnJlYWtfZ3JvdW5kIjoiQmV0dGVyIEppdHRlciIsImFuaW1fYnJlYWtfZ3JvdW5kX2Ftb3VudCI6MTAuMCwiYW5pbV9icmVha19sZWFuIjoxMC4wLCJhbmltX2JyZWFrX290aGVyIjpbIk1vdmUgTGVhbiIsIn4iXSwiYXZvaWRfYmFja3N0YWIiOjIuMCwiY29uZGl0aW9uIjoiQWlyK0MiLCJmcmVlc3RhbmRpbmciOmZhbHNlLCJmcmVlc3RhbmRpbmdfZmxpY2siOmZhbHNlLCJmcmVlc3RhbmRpbmdfZmxpY2tfb2Zmc2V0IjowLjAsImZyZWVzdGFuZGluZ19zdGF0aWMiOnRydWUsInBpdGNoIjoiRG93biIsInNhZmVfaGVhZCI6WyJBaXIrQyBLbmlmZSIsIn4iXSwic2lkZSI6MS4wLCJ5YXdfYmFzZSI6IkF0IFRhcmdldCIsInlhd19iYXNlX2ZsaWNrIjpmYWxzZSwieWF3X2Jhc2VfZmxpY2tfb2Zmc2V0IjowLjAsInlhd19iYXNlX3N0YXRpYyI6ZmFsc2V9LHsiYXNwZWN0cmF0aW8iOnRydWUsImFzcGVjdHJhdGlvX3ZhbHVlIjoxMzMuMCwiYXV0b19oaWRlc2hvdHMiOnRydWUsImF2b2lkX2NvbGxpc2lvbiI6dHJ1ZSwiY3VzdG9tX2h1ZCI6dHJ1ZSwiY3VzdG9tX2h1ZF9jb2xvciI6IiM2NDY0NjQ5NiIsImN1c3RvbV9odWRfdGV4dF9jb2xvciI6IiM5OTk5OTlGRiIsImN1c3RvbV9zY29wZSI6dHJ1ZSwiY3VzdG9tX3Njb3BlX2NvbG9yIjoiI0M4QzhDOEM4IiwiY3VzdG9tX3Njb3BlX2xlbmd0aCI6MTg4LjAsImN1c3RvbV9zY29wZV9vZmZzZXQiOjMuMCwiZG9ybWFudF9haW1ib3QiOmZhbHNlLCJmYWtlX3BpbmciOmZhbHNlLCJmYWtlX3BpbmdfdmFsdWUiOjAuMCwiZmRfc2V0dGluZ3MiOmZhbHNlLCJmZF9zZXR0aW5nc19saXN0IjpbIn4iXSwibGNfdGVsZXBvcnQiOmZhbHNlLCJsb2dzIjpbIkNvbnNvbGUiLCJ+Il0sImxvZ3NfaGl0IjoiI0M5QzdGRkZGIiwibG9nc19taXNzIjoiIzZBNkE2QUZGIiwibWFpbl9mdW5jIjpbMS4wLDIuMCwifiJdLCJtaW5fZGFtYWdlIjp0cnVlLCJtaW5fZGFtYWdlX2NvbG9yIjoiI0ExQTFBMUZGIiwibWluX2RhbWFnZV9mb250IjoyLjAsIm5hZGVfZml4Ijp0cnVlLCJzY3JlZW5fbG9ncyI6dHJ1ZSwic2NyZWVuX2xvZ3NfaGl0IjoiIzZDODFDQkZGIiwic2NyZWVuX2xvZ3NfbWlzcyI6IiM2QTZBNkFGRiIsInZpZXdtb2RlbCI6dHJ1ZSwidmlld21vZGVsX2ZvdiI6NzkuMCwidmlld21vZGVsX3giOi03LjAsInZpZXdtb2RlbF95IjotMjUuMCwidmlld21vZGVsX3oiOjEwLjAsIndhdGVybWFyayI6IkRlZmF1bHQifSxbeyJib2R5X3lhdyI6dHJ1ZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjotOTAuMCwiZGVmX3lhd19zcGVlZCI6MjAuMCwiZGVmX3lhd19zcGluIjowLjAsImRlZmVuc2l2ZV9mbGljayI6IkwmUiIsImRlZmVuc2l2ZV9mbGlja19sIjozNS4wLCJkZWZlbnNpdmVfZmxpY2tfb2Zmc2V0IjotOTAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOi0zNS4wLCJkZWZlbnNpdmVfZmxpY2tfcmFuZG9tIjoxMC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImVuYWJsZSI6ZmFsc2UsImZvcmNlX2RlZmVuc2l2ZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MjAuMCwibW9kX29mZnNldCI6LTE0LjAsIm1vZF9yYW5kb20iOjEwLjAsIm1vZF90eXBlIjoiQ2VudGVyIiwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInlhdyI6MC4wLCJ5YXdfZGVsYXkiOjQuMCwieWF3X2RlbGF5X3JhbmQiOjAuMCwieWF3X2xlZnQiOjMuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjIxLjAsInlhd190eXBlIjoxLjB9LHsiYm9keV95YXciOmZhbHNlLCJkZWZfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZl9waXRjaF9zcGVlZCI6MjAuMCwiZGVmX3BpdGNoX3NwaW4iOjAuMCwiZGVmX3lhd19vZmZzZXQiOjAuMCwiZGVmX3lhd19zcGVlZCI6MjAuMCwiZGVmX3lhd19zcGluIjowLjAsImRlZmVuc2l2ZV9mbGljayI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX2ZsaWNrX2wiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfZmxpY2tfciI6MC4wLCJkZWZlbnNpdmVfZmxpY2tfcmFuZG9tIjowLjAsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZW5hYmxlIjpmYWxzZSwiZm9yY2VfZGVmZW5zaXZlIjpbIn4iXSwiZnJlZXN0YW5kIjoiT2ZmIiwiaW52ZXJ0IjpmYWxzZSwibGJ5X2wiOjYwLjAsImxieV9yIjo2MC4wLCJsYnlfcmFuZG9tIjowLjAsIm1vZF9vZmZzZXQiOjAuMCwibW9kX3JhbmRvbSI6MC4wLCJtb2RfdHlwZSI6IkRpc2FibGVkIiwib3B0aW9ucyI6WyJ+Il0sInlhdyI6MC4wLCJ5YXdfZGVsYXkiOjQuMCwieWF3X2RlbGF5X3JhbmQiOjAuMCwieWF3X2xlZnQiOjAuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjAuMCwieWF3X3R5cGUiOjEuMH0seyJib2R5X3lhdyI6dHJ1ZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJMJlIiLCJkZWZlbnNpdmVfZmxpY2tfbCI6MTAuMCwiZGVmZW5zaXZlX2ZsaWNrX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfZmxpY2tfciI6LTEwLjAsImRlZmVuc2l2ZV9mbGlja19yYW5kb20iOjEwLjAsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZW5hYmxlIjp0cnVlLCJmb3JjZV9kZWZlbnNpdmUiOlsifiJdLCJmcmVlc3RhbmQiOiJPZmYiLCJpbnZlcnQiOmZhbHNlLCJsYnlfbCI6NjAuMCwibGJ5X3IiOjYwLjAsImxieV9yYW5kb20iOjAuMCwibW9kX29mZnNldCI6LTY2LjAsIm1vZF9yYW5kb20iOjAuMCwibW9kX3R5cGUiOiJDZW50ZXIiLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwieWF3IjozLjAsInlhd19kZWxheSI6NC4wLCJ5YXdfZGVsYXlfcmFuZCI6MC4wLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MC4wLCJ5YXdfdHlwZSI6MS4wfSx7ImJvZHlfeWF3IjpmYWxzZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9mbGlja19sIjowLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3JhbmRvbSI6MC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImVuYWJsZSI6ZmFsc2UsImZvcmNlX2RlZmVuc2l2ZSI6WyJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MC4wLCJtb2Rfb2Zmc2V0IjowLjAsIm1vZF9yYW5kb20iOjAuMCwibW9kX3R5cGUiOiJEaXNhYmxlZCIsIm9wdGlvbnMiOlsifiJdLCJ5YXciOjAuMCwieWF3X2RlbGF5Ijo0LjAsInlhd19kZWxheV9yYW5kIjowLjAsInlhd19sZWZ0IjowLjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0IjowLjAsInlhd190eXBlIjoxLjB9LHsiYm9keV95YXciOnRydWUsImRlZl9waXRjaF9vZmZzZXQiOjAuMCwiZGVmX3BpdGNoX3NwZWVkIjoyMC4wLCJkZWZfcGl0Y2hfc3BpbiI6MC4wLCJkZWZfeWF3X29mZnNldCI6MC4wLCJkZWZfeWF3X3NwZWVkIjoyMC4wLCJkZWZfeWF3X3NwaW4iOjAuMCwiZGVmZW5zaXZlX2ZsaWNrIjoiTCZSIiwiZGVmZW5zaXZlX2ZsaWNrX2wiOjIyLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOi0yMC4wLCJkZWZlbnNpdmVfZmxpY2tfcmFuZG9tIjo3LjAsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZW5hYmxlIjp0cnVlLCJmb3JjZV9kZWZlbnNpdmUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJmcmVlc3RhbmQiOiJPZmYiLCJpbnZlcnQiOmZhbHNlLCJsYnlfbCI6NjAuMCwibGJ5X3IiOjYwLjAsImxieV9yYW5kb20iOjAuMCwibW9kX29mZnNldCI6LTM4LjAsIm1vZF9yYW5kb20iOjguMCwibW9kX3R5cGUiOiJDZW50ZXIiLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwieWF3Ijo2LjAsInlhd19kZWxheSI6NC4wLCJ5YXdfZGVsYXlfcmFuZCI6MC4wLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MC4wLCJ5YXdfdHlwZSI6MS4wfSx7ImJvZHlfeWF3Ijp0cnVlLCJkZWZfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZl9waXRjaF9zcGVlZCI6MjAuMCwiZGVmX3BpdGNoX3NwaW4iOjAuMCwiZGVmX3lhd19vZmZzZXQiOjAuMCwiZGVmX3lhd19zcGVlZCI6MjAuMCwiZGVmX3lhd19zcGluIjowLjAsImRlZmVuc2l2ZV9mbGljayI6IkwmUiIsImRlZmVuc2l2ZV9mbGlja19sIjoxNS4wLCJkZWZlbnNpdmVfZmxpY2tfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV9mbGlja19yIjotMTUuMCwiZGVmZW5zaXZlX2ZsaWNrX3JhbmRvbSI6OC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImVuYWJsZSI6dHJ1ZSwiZm9yY2VfZGVmZW5zaXZlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZnJlZXN0YW5kIjoiT2ZmIiwiaW52ZXJ0IjpmYWxzZSwibGJ5X2wiOjYwLjAsImxieV9yIjo2MC4wLCJsYnlfcmFuZG9tIjowLjAsIm1vZF9vZmZzZXQiOi0zMy4wLCJtb2RfcmFuZG9tIjowLjAsIm1vZF90eXBlIjoiQ2VudGVyIiwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInlhdyI6NS4wLCJ5YXdfZGVsYXkiOjQuMCwieWF3X2RlbGF5X3JhbmQiOjAuMCwieWF3X2xlZnQiOjAuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjAuMCwieWF3X3R5cGUiOjEuMH0seyJib2R5X3lhdyI6dHJ1ZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJMJlIiLCJkZWZlbnNpdmVfZmxpY2tfbCI6LTIyLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOjIyLjAsImRlZmVuc2l2ZV9mbGlja19yYW5kb20iOjcuMCwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfeWF3IjoiRGlzYWJsZWQiLCJlbmFibGUiOnRydWUsImZvcmNlX2RlZmVuc2l2ZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MC4wLCJtb2Rfb2Zmc2V0IjotNS4wLCJtb2RfcmFuZG9tIjoxOS4wLCJtb2RfdHlwZSI6IkNlbnRlciIsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJ5YXciOjAuMCwieWF3X2RlbGF5Ijo0LjAsInlhd19kZWxheV9yYW5kIjoxLjAsInlhd19sZWZ0IjotNS4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MTUuMCwieWF3X3R5cGUiOjEuMH0seyJib2R5X3lhdyI6dHJ1ZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJMJlIiLCJkZWZlbnNpdmVfZmxpY2tfbCI6LTIyLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOjI3LjAsImRlZmVuc2l2ZV9mbGlja19yYW5kb20iOjguMCwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfeWF3IjoiRGlzYWJsZWQiLCJlbmFibGUiOnRydWUsImZvcmNlX2RlZmVuc2l2ZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MTAuMCwibW9kX29mZnNldCI6MC4wLCJtb2RfcmFuZG9tIjowLjAsIm1vZF90eXBlIjoiQ2VudGVyIiwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInlhdyI6MjQuMCwieWF3X2RlbGF5Ijo1LjAsInlhd19kZWxheV9yYW5kIjowLjAsInlhd19sZWZ0IjoxOC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6My4wLCJ5YXdfdHlwZSI6Mi4wfSx7ImJvZHlfeWF3IjpmYWxzZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9mbGlja19sIjowLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3JhbmRvbSI6MC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImVuYWJsZSI6ZmFsc2UsImZvcmNlX2RlZmVuc2l2ZSI6WyJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MC4wLCJtb2Rfb2Zmc2V0IjowLjAsIm1vZF9yYW5kb20iOjAuMCwibW9kX3R5cGUiOiJEaXNhYmxlZCIsIm9wdGlvbnMiOlsifiJdLCJ5YXciOjAuMCwieWF3X2RlbGF5Ijo0LjAsInlhd19kZWxheV9yYW5kIjowLjAsInlhd19sZWZ0IjowLjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0IjowLjAsInlhd190eXBlIjoxLjB9XSxbeyJib2R5X3lhdyI6dHJ1ZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjotOTAuMCwiZGVmX3lhd19zcGVlZCI6MjAuMCwiZGVmX3lhd19zcGluIjowLjAsImRlZmVuc2l2ZV9mbGljayI6IkwmUiIsImRlZmVuc2l2ZV9mbGlja19sIjozNS4wLCJkZWZlbnNpdmVfZmxpY2tfb2Zmc2V0IjotOTAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOi0zNS4wLCJkZWZlbnNpdmVfZmxpY2tfcmFuZG9tIjoxMC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImVuYWJsZSI6ZmFsc2UsImZvcmNlX2RlZmVuc2l2ZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MjAuMCwibW9kX29mZnNldCI6LTE0LjAsIm1vZF9yYW5kb20iOjEwLjAsIm1vZF90eXBlIjoiQ2VudGVyIiwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInlhdyI6MC4wLCJ5YXdfZGVsYXkiOjQuMCwieWF3X2RlbGF5X3JhbmQiOjAuMCwieWF3X2xlZnQiOjMuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjIxLjAsInlhd190eXBlIjoxLjB9LHsiYm9keV95YXciOmZhbHNlLCJkZWZfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZl9waXRjaF9zcGVlZCI6MjAuMCwiZGVmX3BpdGNoX3NwaW4iOjAuMCwiZGVmX3lhd19vZmZzZXQiOjAuMCwiZGVmX3lhd19zcGVlZCI6MjAuMCwiZGVmX3lhd19zcGluIjowLjAsImRlZmVuc2l2ZV9mbGljayI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX2ZsaWNrX2wiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfZmxpY2tfciI6MC4wLCJkZWZlbnNpdmVfZmxpY2tfcmFuZG9tIjowLjAsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZW5hYmxlIjpmYWxzZSwiZm9yY2VfZGVmZW5zaXZlIjpbIn4iXSwiZnJlZXN0YW5kIjoiT2ZmIiwiaW52ZXJ0IjpmYWxzZSwibGJ5X2wiOjYwLjAsImxieV9yIjo2MC4wLCJsYnlfcmFuZG9tIjowLjAsIm1vZF9vZmZzZXQiOjAuMCwibW9kX3JhbmRvbSI6MC4wLCJtb2RfdHlwZSI6IkRpc2FibGVkIiwib3B0aW9ucyI6WyJ+Il0sInlhdyI6MC4wLCJ5YXdfZGVsYXkiOjQuMCwieWF3X2RlbGF5X3JhbmQiOjAuMCwieWF3X2xlZnQiOjAuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjAuMCwieWF3X3R5cGUiOjEuMH0seyJib2R5X3lhdyI6dHJ1ZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJMJlIiLCJkZWZlbnNpdmVfZmxpY2tfbCI6MTAuMCwiZGVmZW5zaXZlX2ZsaWNrX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfZmxpY2tfciI6LTEwLjAsImRlZmVuc2l2ZV9mbGlja19yYW5kb20iOjEwLjAsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZW5hYmxlIjp0cnVlLCJmb3JjZV9kZWZlbnNpdmUiOlsifiJdLCJmcmVlc3RhbmQiOiJPZmYiLCJpbnZlcnQiOmZhbHNlLCJsYnlfbCI6NjAuMCwibGJ5X3IiOjYwLjAsImxieV9yYW5kb20iOjAuMCwibW9kX29mZnNldCI6LTY2LjAsIm1vZF9yYW5kb20iOjAuMCwibW9kX3R5cGUiOiJDZW50ZXIiLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwieWF3IjozLjAsInlhd19kZWxheSI6NC4wLCJ5YXdfZGVsYXlfcmFuZCI6MC4wLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MC4wLCJ5YXdfdHlwZSI6MS4wfSx7ImJvZHlfeWF3IjpmYWxzZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9mbGlja19sIjowLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3JhbmRvbSI6MC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImVuYWJsZSI6ZmFsc2UsImZvcmNlX2RlZmVuc2l2ZSI6WyJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MC4wLCJtb2Rfb2Zmc2V0IjowLjAsIm1vZF9yYW5kb20iOjAuMCwibW9kX3R5cGUiOiJEaXNhYmxlZCIsIm9wdGlvbnMiOlsifiJdLCJ5YXciOjAuMCwieWF3X2RlbGF5Ijo0LjAsInlhd19kZWxheV9yYW5kIjowLjAsInlhd19sZWZ0IjowLjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0IjowLjAsInlhd190eXBlIjoxLjB9LHsiYm9keV95YXciOnRydWUsImRlZl9waXRjaF9vZmZzZXQiOjAuMCwiZGVmX3BpdGNoX3NwZWVkIjoyMC4wLCJkZWZfcGl0Y2hfc3BpbiI6MC4wLCJkZWZfeWF3X29mZnNldCI6MC4wLCJkZWZfeWF3X3NwZWVkIjoyMC4wLCJkZWZfeWF3X3NwaW4iOjAuMCwiZGVmZW5zaXZlX2ZsaWNrIjoiTCZSIiwiZGVmZW5zaXZlX2ZsaWNrX2wiOjIyLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOi0yMC4wLCJkZWZlbnNpdmVfZmxpY2tfcmFuZG9tIjo3LjAsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZW5hYmxlIjp0cnVlLCJmb3JjZV9kZWZlbnNpdmUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJmcmVlc3RhbmQiOiJPZmYiLCJpbnZlcnQiOmZhbHNlLCJsYnlfbCI6NjAuMCwibGJ5X3IiOjYwLjAsImxieV9yYW5kb20iOjAuMCwibW9kX29mZnNldCI6LTM4LjAsIm1vZF9yYW5kb20iOjguMCwibW9kX3R5cGUiOiJDZW50ZXIiLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwieWF3Ijo2LjAsInlhd19kZWxheSI6NC4wLCJ5YXdfZGVsYXlfcmFuZCI6MC4wLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MC4wLCJ5YXdfdHlwZSI6MS4wfSx7ImJvZHlfeWF3Ijp0cnVlLCJkZWZfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZl9waXRjaF9zcGVlZCI6MjAuMCwiZGVmX3BpdGNoX3NwaW4iOjAuMCwiZGVmX3lhd19vZmZzZXQiOjAuMCwiZGVmX3lhd19zcGVlZCI6MjAuMCwiZGVmX3lhd19zcGluIjowLjAsImRlZmVuc2l2ZV9mbGljayI6IkwmUiIsImRlZmVuc2l2ZV9mbGlja19sIjoxNS4wLCJkZWZlbnNpdmVfZmxpY2tfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV9mbGlja19yIjotMTUuMCwiZGVmZW5zaXZlX2ZsaWNrX3JhbmRvbSI6OC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImVuYWJsZSI6dHJ1ZSwiZm9yY2VfZGVmZW5zaXZlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZnJlZXN0YW5kIjoiT2ZmIiwiaW52ZXJ0IjpmYWxzZSwibGJ5X2wiOjYwLjAsImxieV9yIjo2MC4wLCJsYnlfcmFuZG9tIjowLjAsIm1vZF9vZmZzZXQiOi0zMy4wLCJtb2RfcmFuZG9tIjowLjAsIm1vZF90eXBlIjoiQ2VudGVyIiwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInlhdyI6NS4wLCJ5YXdfZGVsYXkiOjQuMCwieWF3X2RlbGF5X3JhbmQiOjAuMCwieWF3X2xlZnQiOjAuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjAuMCwieWF3X3R5cGUiOjEuMH0seyJib2R5X3lhdyI6dHJ1ZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJMJlIiLCJkZWZlbnNpdmVfZmxpY2tfbCI6LTIyLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOjIyLjAsImRlZmVuc2l2ZV9mbGlja19yYW5kb20iOjcuMCwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfeWF3IjoiRGlzYWJsZWQiLCJlbmFibGUiOnRydWUsImZvcmNlX2RlZmVuc2l2ZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MC4wLCJtb2Rfb2Zmc2V0IjotNS4wLCJtb2RfcmFuZG9tIjoxOS4wLCJtb2RfdHlwZSI6IkNlbnRlciIsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJ5YXciOjAuMCwieWF3X2RlbGF5Ijo0LjAsInlhd19kZWxheV9yYW5kIjoxLjAsInlhd19sZWZ0IjotNS4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MTUuMCwieWF3X3R5cGUiOjEuMH0seyJib2R5X3lhdyI6dHJ1ZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJMJlIiLCJkZWZlbnNpdmVfZmxpY2tfbCI6LTIyLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOjI3LjAsImRlZmVuc2l2ZV9mbGlja19yYW5kb20iOjguMCwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfeWF3IjoiRGlzYWJsZWQiLCJlbmFibGUiOnRydWUsImZvcmNlX2RlZmVuc2l2ZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MTAuMCwibW9kX29mZnNldCI6MC4wLCJtb2RfcmFuZG9tIjowLjAsIm1vZF90eXBlIjoiQ2VudGVyIiwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInlhdyI6MjQuMCwieWF3X2RlbGF5Ijo1LjAsInlhd19kZWxheV9yYW5kIjowLjAsInlhd19sZWZ0IjoxOC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6My4wLCJ5YXdfdHlwZSI6Mi4wfSx7ImJvZHlfeWF3IjpmYWxzZSwiZGVmX3BpdGNoX29mZnNldCI6MC4wLCJkZWZfcGl0Y2hfc3BlZWQiOjIwLjAsImRlZl9waXRjaF9zcGluIjowLjAsImRlZl95YXdfb2Zmc2V0IjowLjAsImRlZl95YXdfc3BlZWQiOjIwLjAsImRlZl95YXdfc3BpbiI6MC4wLCJkZWZlbnNpdmVfZmxpY2siOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9mbGlja19sIjowLjAsImRlZmVuc2l2ZV9mbGlja19vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3IiOjAuMCwiZGVmZW5zaXZlX2ZsaWNrX3JhbmRvbSI6MC4wLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImVuYWJsZSI6ZmFsc2UsImZvcmNlX2RlZmVuc2l2ZSI6WyJ+Il0sImZyZWVzdGFuZCI6Ik9mZiIsImludmVydCI6ZmFsc2UsImxieV9sIjo2MC4wLCJsYnlfciI6NjAuMCwibGJ5X3JhbmRvbSI6MC4wLCJtb2Rfb2Zmc2V0IjowLjAsIm1vZF9yYW5kb20iOjAuMCwibW9kX3R5cGUiOiJEaXNhYmxlZCIsIm9wdGlvbnMiOlsifiJdLCJ5YXciOjAuMCwieWF3X2RlbGF5Ijo0LjAsInlhd19kZWxheV9yYW5kIjowLjAsInlhd19sZWZ0IjowLjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0IjowLjAsInlhd190eXBlIjoxLjB9XV0=";
v299.save = function(v301)
    -- upvalues: v297 (ref), v300 (ref), l_base64_0 (ref)
    if v301 == 1 then
        return;
    else
        local v302 = v297:save();
        v300.config_list[v301][2] = l_base64_0.encode(json.stringify(v302));
        db.maxsense_cfg = v300;
        return;
    end;
end;
v299.update = function(v303)
    -- upvalues: v300 (ref)
    local v304 = v300.config_list[v303][1] .. "\v - Active";
    for v305, v306 in ipairs(v300.config_list) do
        v300.menu_list[v305] = v306[1];
    end;
    v300.menu_list[v303] = v304;
end;
v299.create = function(v307)
    -- upvalues: v300 (ref)
    if type(v307) ~= "string" then
        return;
    elseif v307 == nil or v307 == "" or v307 == " " then
        common.add_notify("maxsense", "Invalid Name");
        return;
    else
        for v308 = #v300.menu_list, 1, -1 do
            if v300.menu_list[v308] == v307 then
                common.add_notify("maxsense", "A config with this name already exists");
                return;
            end;
        end;
        if #v300.config_list > 9 then
            common.add_notify("maxsense", "Maximum number of configs: 10");
            return;
        else
            local v309 = {
                [1] = nil, 
                [2] = "", 
                [1] = v307
            };
            table.insert(v300.config_list, v309);
            table.insert(v300.menu_list, v307);
            db.maxsense_cfg = v300;
            return;
        end;
    end;
end;
v299.delete = function(v310)
    -- upvalues: v300 (ref)
    if v310 == 1 then
        return;
    else
        local v311 = v300.config_list[v310][1];
        for v312 = #v300.config_list, 1, -1 do
            if v300.config_list[v312][1] == v311 then
                table.remove(v300.config_list, v312);
                table.remove(v300.menu_list, v312);
            end;
        end;
        db.maxsense_cfg = v300;
        return;
    end;
end;
v299.load = function(v313)
    -- upvalues: v300 (ref), v297 (ref), l_base64_0 (ref)
    if v300.config_list[v313][2] == nil or v300.config_list[v313][2] == "" then
        print("Error loading config with ID: " .. v313);
        return;
    elseif #v300.config_list < v313 then
        print("Error: Config ID out of range: " .. v313);
        return;
    else
        v297:load(json.parse(l_base64_0.decode(v300.config_list[v313][2])));
        cvar.play:call("ambient\\tones\\elev1");
        return;
    end;
end;
v298.cfg_selector = v14.configs:list("", v300.menu_list):depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v15
});
v298.name = v14.configs:input("", "Config Name"):depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v15
});
v298.create = v14.configs:button("  \v\f<layer-plus>  ", function()
    -- upvalues: v299 (ref), v298 (ref), v300 (ref)
    v299.create(v298.name:get());
    v298.cfg_selector:update(v300.menu_list);
end, true):depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v15
});
v298.create:tooltip("Create Config");
v298.remove = v14.configs:button("   \v\f<trash-xmark>   ", function()
    -- upvalues: v299 (ref), v298 (ref), v300 (ref)
    v299.delete(v298.cfg_selector:get());
    v298.cfg_selector:update(v300.menu_list);
end, true):depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v15
});
v298.remove:tooltip("Remove Config");
v298.save = v14.configs:button("   \v\f<floppy-disk>   ", function()
    -- upvalues: v299 (ref), v298 (ref)
    v299.save(v298.cfg_selector:get());
    cvar.play:call("ambient\\tones\\elev1");
end, true):depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v15
});
v298.save:tooltip("Save Config");
v298.load = v14.configs:button("   \v\f<check>   ", function()
    -- upvalues: v299 (ref), v298 (ref), v300 (ref)
    v299.update(v298.cfg_selector:get());
    v299.load(v298.cfg_selector:get());
    v298.cfg_selector:update(v300.menu_list);
    cvar.play:call("ambient\\tones\\elev1");
end, true):depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v15
});
v298.load:tooltip("Load Config");
v298.import = v14.configs:button("  \v\f<download>  ", function()
    -- upvalues: v297 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
    v297:load(json.parse(l_base64_0.decode(l_clipboard_0.get())));
    cvar.play:call("ambient\\tones\\elev1");
end, true):depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v15
});
v298.import:tooltip("Import Config");
v298.export = v14.configs:button("   \v\f<share-nodes>   ", function()
    -- upvalues: l_clipboard_0 (ref), l_base64_0 (ref), v297 (ref)
    l_clipboard_0.set(l_base64_0.encode(json.stringify(v297:save())));
    cvar.play:call("ambient\\tones\\elev1");
end, true):depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v15
});
v298.export:tooltip("Export Config");