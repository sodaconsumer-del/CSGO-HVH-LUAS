--[[
@Author:    Crow@QQ:        2715930853
@Website:   https://crow.pub/

Last update - 2022.10.29
]]



-- Start

_DEBUG = true

print_raw("Better fake lag loaded")
print_raw("Author:     Crow")
print_raw("Discord:    InkCrow#2173")
print_raw("Thx for ur use <3")



local ffi = require ("ffi") or error("Please allow unsafe scripts")
local bit = require ("bit")
local vmt_hook = require("neverlose/vmt_hook")




ffi.cdef[[
    typedef uintptr_t (__thiscall* GetClientEntity_4242425_t)(void*, int);
]]




local fl = {}

fl.defines = {
    max_fl = 32;

    entity_list_pointer = ffi.cast("void***", utils.create_interface("client.dll", "VClientEntityList003"));

    screen_size = render.screen_size();

    font = render.load_font('tahoma',25,'b');

    fire_tick   = 5;
}




fl.api = {
    find    = ui.find;
    create  = ui.create;
    execute = utils.console_exec;
}



fl.funs = {
    gradient_text = function (r1, g1, b1, a1, r2, g2, b2, a2, text)
        local output = ''
        local len = #text-1
        local rinc = (r2 - r1) / len
        local ginc = (g2 - g1) / len
        local binc = (b2 - b1) / len
        local ainc = (a2 - a1) / len
        for i=1, len+1 do
            output = output .. ('\a%02x%02x%02x%02x%s'):format(r1, g1, b1, a1, text:sub(i, i))
            r1 = r1 + rinc
            g1 = g1 + ginc
            b1 = b1 + binc
            a1 = a1 + ainc
        end
    
        return output
    end;


}


fl.ui = {
    FakeLag     = fl.api.create(fl.funs.gradient_text(106,17,203,255,37,117,252,255,"Fake Lag"), fl.funs.gradient_text(50,245,215,255,75,85,240,255,"Better FL"));
    Visual  = fl.api.create(fl.funs.gradient_text(106,17,203,255,37,117,252,255,"Visual"), fl.funs.gradient_text(50,245,215,255,75,85,240,255,"Visual"));
    Misc    = fl.api.create(fl.funs.gradient_text(106,17,203,255,37,117,252,255,"Misc"), fl.funs.gradient_text(50,245,215,255,75,85,240,255,"Misc"))
}


fl.menu = {
    Main                = fl.ui.FakeLag:switch(fl.funs.gradient_text(50,245,215,255,75,85,240,255,"Enable"), false);
    -- FakeLag_Style       = fl.ui.FakeLag:combo("FakeLag Style", {"Original", "Beta"});
    FakeLag_switch      = fl.ui.FakeLag:combo("Fake-Lag", {"Normal", "On Peek", "On Shot"});
    FakeLag_Mode        = fl.ui.FakeLag:combo("Modes", { "Fluctuate", "Jitter", "Random", "Maximum", "Fluctuate-Update", "Always Choke" });
    FakeLag_Step_Tick = fl.ui.FakeLag:slider("Fake-Lag Step", 1, 32, 1, "smaller = faster");
    Min_FakeLag         = fl.ui.FakeLag:slider("Min Fake-Lag", 1, fl.defines.max_fl, fl.defines.max_fl);
    Max_FakeLag         = fl.ui.FakeLag:slider("Max Fake-Lag", 1, fl.defines.max_fl, fl.defines.max_fl);
    Peek_FakeLag        = fl.ui.FakeLag:switch("Fake-Lag on peek", false);
    Peek_Value          = fl.ui.FakeLag:slider("On-Peek FL Value", 1, fl.defines.max_fl, 1);
    SMFL                = fl.ui.FakeLag:switch("Adaption FL on shot", true);
    On_Shot_FakeLag     = fl.ui.FakeLag:switch("Fake-Lag on shot", false);
    On_Shot_Value       = fl.ui.FakeLag:slider("On Shot FL Value", 1, fl.defines.max_fl, 1);
    


    FL_Val_Ind                = fl.ui.Visual:switch(fl.funs.gradient_text(50,245,215,255,75,85,240,255,"Choke Packs Indicator"), false);



    Aspect_ratio   = fl.ui.Misc:switch(fl.funs.gradient_text(50,245,215,255,75,85,240,255,"Enable Aspect ratio"), false);
    Ratio_Value    = fl.ui.Misc:slider("Ratio Value", 0, 20, 10, 0.1);
    Camera_Changer = fl.ui.Misc:combo(fl.funs.gradient_text(50,245,215,255,75,85,240,255,"Camera Animfix"), { "Disable", "Bob", "Collision", "Follow Bone", "Static" });
    Camera_Z       = fl.ui.Misc:slider("Camera Height", -20, 50, 0);
    Viewmodel      = fl.ui.Misc:switch(fl.funs.gradient_text(50,245,215,255,75,85,240,255,"Viewmodel Changer"), false);
    Viewmodel_fov  = fl.ui.Misc:slider("FOV", 0, 100, 60);
    Viewmodel_x    = fl.ui.Misc:slider("X", -15, 15, 1);
    Viewmodel_y    = fl.ui.Misc:slider("Y", -15, 15, 1);
    Viewmodel_z    = fl.ui.Misc:slider("Z", -15, 15, 0);

}

fl.item = {
    FL_Val_Color = fl.menu.FL_Val_Ind:color_picker("Color");
    -- Choke_Color = fl.menu.Choke_Pack_Ind:color_picker("Color");
}


fl.variables = {
    Peek           = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist");
    DT              = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
    OS              = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
    FakeDuck       = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
    Leg_Movement    = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement");
    Desync          = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw");
    FakeLag_Enable = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled");
    FakeLag_Limit  = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit");
    FakeLag_Random = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability");
    Thirdperson    = ui.find("Visuals", "World", "Main", "Force Thirdperson");
    flag           = false;
    ducking        = false;
    ticks          = 0;
    fakelag_value  = 0;
    temp_fl        = 0;
    last_z         = 0;
    on_land_tick   = 0;
    bunnyhop_tick  = 0;
    peek_fl_ticks  = 0;

    hooked_function = nil;
    is_jumping = false;
    get_client_entity_fn = ffi.cast("GetClientEntity_4242425_t", fl.defines.entity_list_pointer[0][3]);

    fl_table        = {};
    -- choke_table     = {};
    last_fl         = 0;
    -- last_choke      = 0;

    last_fire       = 0;
}


for i = 1, 64 do
    table.insert(fl.variables.fl_table, 0)
end

-- for i = 1, 5 do
--     table.insert(fl.variables.choke_table, 0)
-- end

fl.callback_on_aim_fire = function ()
    if not fl.variables.FakeDuck:get() then
        fl.variables.ticks = fl.defines.fire_tick
    end
end

fl.callback_on_aim_ack = function ()
    if fl.variables.FakeDuck:get() then
        fl.variables.ticks = fl.defines.fire_tick
    end
end




fl.callback_on_createmove = function(cmd)
    fl.variables.ducking = bit.band(cmd.buttons, bit.lshift(1, 2)) ~= 0
    fl.variables.is_jumping = bit.band(cmd.buttons, 2) ~= 0

    -- local lp = entity.get_local_player()
    -- if not lp:is_alive() then return end
    -- local weapon = lp:get_player_weapon(false)
    -- if not weapon then return end
    -- if fl.variables.last_fire ~= weapon["m_fLastShotTime"] then
    --     fl.variables.last_fire = weapon["m_fLastShotTime"]
    --     fl.variables.ticks = fl.defines.fire_tick
    -- end


    if fl.menu.Main:get() then
        local speed   = fl.menu.FakeLag_Step_Tick:get()
        local fl_mode = fl.menu.FakeLag_Mode:get()
        local min_fl  = fl.menu.Min_FakeLag:get()
        local max_fl  = fl.menu.Max_FakeLag:get()


        if fl_mode == "Fluctuate" then
            if globals.tickcount % speed == 0 then fl.variables.fakelag_value = fl.variables.fakelag_value + 1 end
            if fl.variables.fakelag_value > max_fl or fl.variables.fakelag_value < min_fl then fl.variables.fakelag_value = min_fl end

        elseif fl_mode == "Jitter" then
            if (globals.tickcount % speed) == 0 then
                fl.variables.fakelag_value = (fl.variables.flag and min_fl or max_fl)
                fl.variables.flag = (not fl.variables.flag)
            end

        elseif fl_mode == "Random" then
            if globals.tickcount % speed == 0 then fl.variables.fakelag_value = math.random(min_fl, max_fl) end

        elseif fl_mode == "Maximum" then
            fl.variables.fakelag_value = max_fl

        elseif fl_mode == "Fluctuate-Update" then
            if globals.tickcount % speed == 0 then
                if fl.variables.temp_fl < min_fl or fl.variables.temp_fl > max_fl then fl.variables.temp_fl = min_fl end

                if fl.variables.flag then
                    fl.variables.fakelag_value = min_fl
                else
                    fl.variables.fakelag_value = fl.variables.temp_fl
                    fl.variables.temp_fl = fl.variables.temp_fl + 1
                end
                fl.variables.flag = (not fl.variables.flag)
            end
        end

        if fl.menu.Peek_FakeLag:get() and fl.variables.Peek:get() and fl.variables.ticks < 1 then
            fl.variables.fakelag_value = fl.menu.Peek_Value:get()
        end


        if fl.variables.ticks > 0 and fl.menu.On_Shot_FakeLag:get() and not fl.menu.SMFL:get() then
            fl.variables.fakelag_value = fl.menu.On_Shot_Value:get()
        end


        if globals.tickcount % 8 == 0 then
            table.insert(fl.variables.fl_table, globals.choked_commands)
        end
        while #fl.variables.fl_table > 64 do table.remove(fl.variables.fl_table, 1) end

        fl.variables.FakeLag_Limit:override(fl.variables.fakelag_value)

        if fl.menu.FakeLag_Mode:get() == "Always Choke" then
            fl.variables.FakeLag_Enable:override(false)
            cmd.send_packet = false
        else
            fl.variables.FakeLag_Enable:override(true)
        end

        if fl.menu.FakeLag_Mode:get() == "Always Choke" then
            if not fl.variables.FakeDuck:get() then
                if fl.variables.ticks > fl.defines.fire_tick - 2 and fl.menu.SMFL:get() then
                    cmd.no_choke = true
                    cmd.send_packet = false
                    fl.variables.Desync:override(false)

                    if not fl.variables.DT:get() and not fl.variables.OS:get() then
                        cvar["sv_maxusrcmdprocessticks"]:int(1)
                    end
                else
                    fl.variables.Desync:override(nil)
                    if fl.variables.DT:get() or fl.variables.OS:get() then
                        cvar["sv_maxusrcmdprocessticks"]:int(16)
                    elseif fl.variables.fakelag_value > 15 then
                        cvar["sv_maxusrcmdprocessticks"]:int(max_fl + 1)
                    else
                        cvar["sv_maxusrcmdprocessticks"]:int(16)
                    end
                end
            else
                if fl.variables.ticks > fl.defines.fire_tick - 1 and fl.menu.SMFL:get() then
                    cmd.no_choke = true
                    cmd.send_packet = false
                    fl.variables.Desync:override(false)
                    cvar["sv_maxusrcmdprocessticks"]:int(1)
                else
                    fl.variables.Desync:override(nil)
                    if fl.variables.DT:get() or fl.variables.OS:get() then
                        cvar["sv_maxusrcmdprocessticks"]:int(16)
                    elseif max_fl > 15 then
                        cvar["sv_maxusrcmdprocessticks"]:int(max_fl + 1)
                    else
                        cvar["sv_maxusrcmdprocessticks"]:int(16)
                    end
                end
            end
        else
            if fl.variables.ticks > fl.defines.fire_tick - 1 and fl.menu.SMFL:get() then
                cmd.no_choke = true
                cmd.send_packet = false
                fl.variables.Desync:override(false)
                if not fl.variables.DT:get() and not fl.variables.OS:get() then
                    cvar["sv_maxusrcmdprocessticks"]:int(1)
                end
            elseif fl.variables.ticks > 0 and fl.variables.ticks < fl.defines.fire_tick - 0 and fl.menu.SMFL:get() then
                cmd.no_choke = false
                cmd.send_packet = false
                if fl.variables.DT:get() or fl.variables.OS:get() then
                    cvar["sv_maxusrcmdprocessticks"]:int(16)
                elseif max_fl > 15 then
                    cvar["sv_maxusrcmdprocessticks"]:int(max_fl + 1)
                else
                    cvar["sv_maxusrcmdprocessticks"]:int(16)
                end
            else
                if fl.variables.DT:get() or fl.variables.OS:get() then
                    cvar["sv_maxusrcmdprocessticks"]:int(16)
                elseif fl.variables.fakelag_value > 15 then
                    cvar["sv_maxusrcmdprocessticks"]:int(fl.variables.fakelag_value + 1)
                else
                    cvar["sv_maxusrcmdprocessticks"]:int(16)
                end
                fl.variables.Desync:override(nil)
            end
        end



    end

    if fl.variables.ticks > 0 then
        fl.variables.ticks = fl.variables.ticks - 1
    end





end -- createmove end



fl.menu.Aspect_ratio:set_callback(function()
    cvar.r_aspectratio:float(fl.menu.Aspect_ratio:get() and fl.menu.Ratio_Value:get() / 10 or 0)
end, true)

fl.menu.Ratio_Value:set_callback(function()
    cvar.r_aspectratio:float(fl.menu.Ratio_Value:get() / 10)
end, true)






fl.callback_on_render = function()

    local main_enable = fl.menu.Main:get()
    local on_peek = fl.menu.Peek_FakeLag:get()
    local low_FL = fl.menu.On_Shot_FakeLag:get()
    local enable_ratio = fl.menu.Aspect_ratio:get()
    local Viewmodel = fl.menu.Viewmodel:get()
    local ac = fl.menu.FakeLag_Mode:get() == "Always Choke"

    fl.menu.Ratio_Value:visibility(enable_ratio)
    fl.menu.Camera_Z:visibility(fl.menu.Camera_Changer:get() ~= "Disable")
    fl.menu.Viewmodel_fov:visibility(Viewmodel)
    fl.menu.Viewmodel_x:visibility(Viewmodel)
    fl.menu.Viewmodel_y:visibility(Viewmodel)
    fl.menu.Viewmodel_z:visibility(Viewmodel)

    -- fl.menu.Choke_Pack_Ind_y:visibility(fl.menu.Choke_Pack_Ind:get())

    fl.menu.FakeLag_switch:visibility(main_enable)
    -- fl.menu.FakeLag_Style:visibility(main_enable)
    fl.menu.FakeLag_Mode:visibility(main_enable and fl.menu.FakeLag_switch:get() == "Normal")
    fl.menu.FakeLag_Step_Tick:visibility(main_enable and fl.menu.FakeLag_switch:get() == "Normal" and not ac)
    fl.menu.Min_FakeLag:visibility(main_enable and fl.menu.FakeLag_switch:get() == "Normal" and not ac)
    fl.menu.Max_FakeLag:visibility(main_enable and fl.menu.FakeLag_switch:get() == "Normal")
    fl.menu.Peek_FakeLag:visibility(main_enable and fl.menu.FakeLag_switch:get() == "On Peek")
    fl.menu.Peek_Value:visibility(main_enable and on_peek and fl.menu.FakeLag_switch:get() == "On Peek")
    fl.menu.On_Shot_FakeLag:visibility(main_enable and fl.menu.FakeLag_switch:get() == "On Shot" and not fl.menu.SMFL:get())
    fl.menu.On_Shot_Value:visibility(main_enable and low_FL and fl.menu.FakeLag_switch:get() == "On Shot" and not fl.menu.SMFL:get())
    fl.menu.SMFL:visibility(main_enable and fl.menu.FakeLag_switch:get() == "On Shot")




    if fl.menu.Min_FakeLag:get() > fl.menu.Max_FakeLag:get() then
        fl.menu.Min_FakeLag:set(fl.menu.Max_FakeLag:get())
    end


    if not fl.menu.Main:get() or not globals.is_connected then return end
    if fl.menu.FL_Val_Ind:get() then
        local x = fl.defines.screen_size.x / 2 - 128
        local y = fl.defines.screen_size.y - 50

        for i = 1, 64 do
            render.line(vector(x + (i * 4), y - (fl.variables.fl_table[i] * 2)), vector(x + (i * 4), y + 2), fl.item.FL_Val_Color:get())
        end
    end

    if Viewmodel then
        local fov = fl.menu.Viewmodel_fov:get()
        local x,y,z = fl.menu.Viewmodel_x:get(),fl.menu.Viewmodel_y:get(),fl.menu.Viewmodel_z:get()
        cvar.viewmodel_offset_x:float(x,true)
        cvar.viewmodel_offset_y:float(y,true)
        cvar.viewmodel_offset_z:float(z,true)
        cvar.viewmodel_fov:float(fov,true)
    end


end -- render end



fl.callback_on_view = function(view)
    if math.abs(view.camera.z - fl.variables.last_z) > 80 then fl.variables.last_z = view.camera.z end
    if fl.menu.Camera_Changer:get() == "Bob" and fl.variables.Thirdperson:get() then
        local me = entity.get_local_player()
        if not me:is_alive() then return end
        local on_land = me["m_vecVelocity[2]"] == 0
        local bone_z = view.camera.z
        local camera_z = fl.menu.Camera_Z:get()


        if on_land then
            fl.variables.on_land_tick = fl.variables.on_land_tick + 1
        else
            fl.variables.on_land_tick = 0
        end

        if fl.variables.on_land_tick < 10 and fl.variables.on_land_tick ~= 0 then
            fl.variables.bunnyhop_tick = 80
        end

        if fl.variables.bunnyhop_tick > 0 and fl.variables.last_z < bone_z then
            fl.variables.bunnyhop_tick = fl.variables.bunnyhop_tick - 1
            fl.variables.last_z = fl.variables.last_z + 1
        else
            if fl.variables.bunnyhop_tick > 0 then fl.variables.bunnyhop_tick = fl.variables.bunnyhop_tick - 10 end
            fl.variables.last_z = bone_z
        end

        view.camera.z = fl.variables.last_z + camera_z

    elseif fl.menu.Camera_Changer:get() == "Collision" and fl.variables.Thirdperson:get() then
        local me = entity.get_local_player()
        if not me:is_alive() then return end
        local speed = me["m_vecVelocity[2]"]
        local camera_z = fl.menu.Camera_Z:get()

        if speed > 80 then
            fl.variables.last_z = view.camera.z + (fl.variables.ducking and 18 or 12)
        elseif speed < -80 then
            fl.variables.last_z = view.camera.z - (fl.variables.ducking and 18 or 12)
        else
            fl.variables.last_z = view.camera.z
        end

        view.camera.z = fl.variables.last_z + camera_z

    elseif fl.menu.Camera_Changer:get() == "Follow Bone" and fl.variables.Thirdperson:get() then
        local me = entity.get_local_player()
        if not me:is_alive() then return end
        local bone_z = me:get_bone_position(8).z
        local camera_z = fl.menu.Camera_Z:get()

        view.camera.z = bone_z + camera_z

    elseif fl.menu.Camera_Changer:get() == "Static" and fl.variables.Thirdperson:get() then
        if math.abs(view.camera.z - fl.variables.last_z) > 80 then fl.variables.last_z = view.camera.z end
        local camera_z = fl.menu.Camera_Z:get()

        if fl.variables.last_z > view.camera.z + camera_z + 5 then
            fl.variables.last_z = fl.variables.last_z - 1
        elseif fl.variables.last_z  < view.camera.z + camera_z - 25 then
            fl.variables.last_z = fl.variables.last_z + 1
        end

        view.camera.z =  fl.variables.last_z
    end

end -- view end


-- fl.callback_on_net_update_start = function ()
--     if globals.choked_commands <= fl.variables.choke_table[5] then --sent
--         table.insert(fl.variables.choke_table, globals.choked_commands)
--     end
--     while #fl.variables.choke_table > 5 do table.remove(fl.variables.choke_table, 1) end
-- end

ui.sidebar(fl.funs.gradient_text(50,245,215,255,75,85,240,255,'Better Fake Lag'),'blind')

common.add_notify("Welcome", [[
Better fake lag loaded
Last update - 23.3.2023
Discord:    InkCrow#2173
]])


events.aim_fire:set(fl.callback_on_aim_fire)
events.aim_ack:set(fl.callback_on_aim_ack)
events.createmove:set(fl.callback_on_createmove)
events.render:set(fl.callback_on_render)
events.override_view:set(fl.callback_on_view)






events.shutdown:set(function()
    cvar.r_aspectratio:float(0)
    cvar.viewmodel_offset_x:float(1, true)
    cvar.viewmodel_offset_y:float(1, true)
    cvar.viewmodel_offset_z:float(-1,true)
    cvar.viewmodel_fov:float(60, true)

    fl.variables.FakeLag_Enable:override(nil)
    fl.variables.FakeLag_Limit:override(nil)
    fl.variables.FakeLag_Random:override(nil)
    fl.variables.Leg_Movement:override(nil)
    fl.variables.Desync:override(nil)


    fl = nil
    
    common.add_notify("Unload", "Bye")
end)



--end
