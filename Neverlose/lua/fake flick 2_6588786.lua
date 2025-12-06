refs = {
    enableaanl = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"),
    disable = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
    base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
    yawoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
    backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
    hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"),
    modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
    modoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
    bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
    inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
    leftlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
    rightlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
    options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
    bodyyawfs = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"),
    extended = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"),
    extendedpitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"),
    extendedroll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"),
    fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
    fss = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"),
    fsb = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"),
    fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
    sw = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
    leg = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"),
    pa = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"),
    dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
    hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
    hslag = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"),
    dtlag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
    scope = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"),
    fov = ui.find("Visuals", "World", "Main", "Field of View"),
    weaponact = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"),
    spike = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
    bodyaim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"),
    dormant = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"),
    min_damage_ui = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
    dmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
    clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"),
    ragebot_find = ui.find("Aimbot", "Ragebot", "Main"),
    hc_find = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"),
}
local fakeflick = ui.find("Aimbot", "Anti Aim", "Angles"):switch("Fake Flick")
local fakeflick = function(cmd)
local low_delta_enable = ui.find("Aimbot", "Anti Aim", "Angles", "Fake Flick"):get()
        if not low_delta_enable == 0 then
            return
        end

        if rage.exploit:get() < 1 then
            return
        end

         if ui.find("Aimbot", "Anti Aim", "Angles", "Fake Flick"):get() then
            rage.antiaim:inverter(false)

            refs.yawoffset:override(11)
            refs.modifier:override("Disabled")
            refs.bodyyaw:override(true)
            refs.options:override("")
			local rand4= math.random(1,4)
						if rand4 == 1 then 
							t_def = 57
						elseif rand4 == 2 then
						   t_def = 32
						elseif rand4 == 3 then
						    t_def = 55
						elseif rand4 == 4 then
						    t_def = 30
						end
            refs.leftlimit:override(t_def)
            refs.rightlimit:override(t_def - math.random(10 ) )
            refs.fs:override(false)

            refs.hidden:override(true)
            
			 local rand7= math.random(1,3)
						if rand7 == 1 then 
							u_def = math.random(-67,-70 )
						elseif rand7 == 2 then
						   u_def = -80
						elseif rand7 == 3 then
						   u_def = -40
						end
			rage.antiaim:override_hidden_pitch(u_def)
            rage.antiaim:override_hidden_yaw_offset(-75)

            refs.hslag:override("Break LC" or nil)
            refs.dtlag:override("Always On" or nil)

	           local rand3= math.random(1,4)
					if rand3 == 1 then 
						f_def = math.random(6,7)
					elseif rand3 == 2 then
					   f_def = math.random(9,11)
					elseif rand3 == 3 then
					    f_def = math.random(5,7)
					elseif rand3 == 4 then
					    f_def = math.random(8,19)
					end
			        cmd.force_defensive = (cmd.command_number % f_def == 0)
         end
        end
         events.createmove:set(function(cmd)
            fakeflick(cmd)
         end)