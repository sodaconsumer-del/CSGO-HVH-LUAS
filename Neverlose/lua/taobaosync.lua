-- requires
pui = require "neverlose/pui"
gradient = require "neverlose/gradient"
drag_system = require "neverlose/drag_system"
mtools = require "neverlose/mtools"

common.add_notify("金长冲", "Welcome to 金长冲")
-- sidebar
pui.sidebar("\v金长冲", "\f<joint>")

local version = "金长冲"

local fonts = {
	vrdn = render.load_font("Verdana", 21, "ab")
}
-- tabs
local tabs = {
	main = pui.create("金", "\n长", 1),
	main2 = pui.create("金", "\n冲", 2),
	antiaim1 = pui.create("长", "金", 1),
	antiaim2 = pui.create("长", "冲", 2),
	antiaim3 = pui.create("长","\n贝", 2),
	antiaim4 = pui.create("长", "\n冲", 1),
	misc = pui.create("冲", "金长", 1),
	misc2 = pui.create("冲", "金", 1),
	misc3 = pui.create("冲", "长", 2),
}

-- references
local refs = {
	enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"),
	pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
	yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
	yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
	yaw_modifer = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
	yaw_modifer_slider = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
	hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"),
	body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
	freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
	disable_yaw_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"),
	body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"),
	l_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
	r_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
	options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
	body_yaw_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"),
	slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
	dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
	hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
	lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
	fake_lag_limit = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"),
	hs_options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"),
	fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
	avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
	md = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
	fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
	fake_lag = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"),
	hitchnc = ui.find("Aimbot", "Ragebot", "Selection", "Pistols", "Hit Chance"),
	leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"),
}

local refs2 = {
	yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
}

-- main tab
tabs.main:label("\v\f<user> \rUser: \v"..common.get_username().."")
tabs.main:label("\v\f<memo-circle-info> \rBuild: \v贝塔")
tabs.main:label("\v金长冲 - ChinChanChon - ЧинЧанЧон")
tabs.main:label("Developed by \v毛泽东")

tabs.main:button("                                        \v\f<discord>                                           ", function() panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/KbfM8jKr") end, true);

local image_loaded = render.load_image(network.get("https://images-ext-1.discordapp.net/external/-_jvk0nEFY47KYR_10-LTBIXgIhlDrGwzihi3tBDYHI/https/media1.tenor.com/m/xnRrTN2HlJQAAAAC/tom-ching-cheng-hanji.gif"), vector(250, 280))
tabs.main2:texture(image_loaded, vector(290, 280), color(255, 255, 255, 255), 'f')

-- anti aims
local chinchanchon = {}
chinchanchon.activate = tabs.antiaim2:combo("╭∩╮( •̀_•́ )╭∩╮ฅඞ", {"Disabled", "Chin", "Chan", "Chon"})
chinchanchon.chan_base = tabs.antiaim1:combo("Chan Base", {"Local View", "At Target"})
chinchanchon.chinchanchon_manuals = tabs.antiaim1:combo("Chinuals", {"Disabled", "Forward", "Left", "Right"})
	chinchanchon.chinchanchon_manuals_ref = chinchanchon.chinchanchon_manuals:create()
		chinchanchon.chinchanchon_manuals:tooltip("Manuals")
		static_chinuals = chinchanchon.chinchanchon_manuals_ref:switch("Static Chinuals")
		e_peek = chinchanchon.chinchanchon_manuals_ref:switch("Chin-Peek")
		chinuals_indicators_enable = chinchanchon.chinchanchon_manuals_ref:switch("Chinuals Indicators")
		chinuals_indicators = chinchanchon.chinchanchon_manuals_ref:combo("Indicators Type", {"Default", "金长冲"}):depend(chinuals_indicators_enable)
		chinuals_color = chinchanchon.chinchanchon_manuals_ref:color_picker("Color"):depend(chinuals_indicators_enable)
		chinuals_inverter_color = chinchanchon.chinchanchon_manuals_ref:color_picker("Inverter Color"):depend(chinuals_indicators_enable)
		chinuals_left_color = chinchanchon.chinchanchon_manuals_ref:color_picker("Left Color"):depend(chinuals_indicators_enable)
		chinuals_right_color = chinchanchon.chinchanchon_manuals_ref:color_picker("Right Color"):depend(chinuals_indicators_enable)
chinchanchon.freestand = tabs.antiaim1:switch("Chonding")
	chinchanchon.freestand_ref = chinchanchon.freestand:create()
		chinchanchon.freestand:tooltip("Freestanding")
		dis_yaw_modifiers = chinchanchon.freestand_ref:switch("Disabled Yaw Modifiers")
		dis_def_modifiers = chinchanchon.freestand_ref:switch("Disabled Defensive")
		body_freestand = chinchanchon.freestand_ref:switch("Body Freestanding")
chinchanchon.anim_breakers = tabs.antiaim1:switch("\vAnim. breakers")
chinchanchon.anim_breakers_ref = chinchanchon.anim_breakers:create()
chinchanchon.legs = chinchanchon.anim_breakers_ref:combo("Legs Breaker", {"Disabled", "Follow Direction", "Jitter", "MoonWalk"})
chinchanchon.in_air = chinchanchon.anim_breakers_ref:combo("In Air", {"Disabled", "Static", "MoonWalk"})
chinchanchon.jitter_legs = chinchanchon.anim_breakers_ref:slider("Jitter Legs", 0, 100, 50):depend({chinchanchon.legs, "Switch"})
chinchanchon.movelean = chinchanchon.anim_breakers_ref:switch("Move Lean")
chinchanchon.tweaks = tabs.antiaim4:listable("\nChinks", {"Warchon AA", "Avoid Chinstab", "Static on Chan"})
chinchanchon.defensive_triggers = tabs.antiaim3:switch("Custom Chinfensive")
chinchanchon.defensive_states = tabs.antiaim3:selectable("States", {"Standing", "Moving", "Walking", "Crouching", "Air", "Air Crouching"}):depend(chinchanchon.defensive_triggers)
chinchanchon.def_pitch = tabs.antiaim3:combo("Chonfensive Pitch", {"Disabled", "Up", "Semi-Up", "Down", "Semi-Down", "Switch", "Random", "Custom"}):depend(chinchanchon.defensive_triggers)
	chinchanchon.def_pitch_ref = chinchanchon.def_pitch:create()
		custom_def_pitch = chinchanchon.def_pitch_ref:combo("Custom Pitch", {"Disabled", "Offset", "Switch", "Random"})
		custom_offset_pitch = chinchanchon.def_pitch_ref:slider("Offset", -89, 89, 0)
		custom_switchup_pitch = chinchanchon.def_pitch_ref:slider("Switch #1", -89, 89, 0)
		custom_switchdown_pitch = chinchanchon.def_pitch_ref:slider("Switch #2", -89, 89, 0)
		custom_random_pitch = chinchanchon.def_pitch_ref:slider("Random", -89, 89, 0)
	chinchanchon.def_yaw = tabs.antiaim3:combo("Chonfensive Yaw", {"Disabled", "Switch", "Opposite", "Spin", "Random", "Custom"}):depend(chinchanchon.defensive_triggers)
		chinchanchon.def_yaw_ref = chinchanchon.def_yaw:create()
			custom_def_yaw = chinchanchon.def_yaw_ref:combo("Custom Yaw", {"Disabled", ":override", "rage.antiaim:inverter", "math.normalize_yaw", "math.random"})
			custom_offset_yaw = chinchanchon.def_yaw_ref:slider("Offset", -180, 180, 0)
			custom_switch1_yaw = chinchanchon.def_yaw_ref:slider("Switch #1", -180, 180, 0)
			custom_switch2_yaw = chinchanchon.def_yaw_ref:slider("Switch #2", -180, 180, 0)
			custom_spin_yaw = chinchanchon.def_yaw_ref:slider("Spin", -180, 180, 0)
			custom_random_yaw = chinchanchon.def_yaw_ref:slider("Random", -180, 180, 0)

-- visual tab
local visuals = {}
visuals.aspect_ratio = tabs.misc2:switch("Aspect Ratio") 
	visuals.aspect_ratio_ref = visuals.aspect_ratio:create():depend(aspect_ratio)
		aspect_ratio_value = visuals.aspect_ratio_ref:slider("Value", 0, 200, 100, 0.01)
visuals.viewmodel_changer = tabs.misc2:switch("Viewmodel Changer")
	visuals.viewmodel_changer_ref = visuals.viewmodel_changer:create():depend(viewmodel_changer)
		viewmodel_changer_fov = visuals.viewmodel_changer_ref:slider("FOV", -100, 100, 68, 1)
		viewmodel_changer_x = visuals.viewmodel_changer_ref:slider("X", -10, 10, 2.5, 0.5)
		viewmodel_changer_y = visuals.viewmodel_changer_ref:slider("Y", -10, 10, 0, 0.5)
		viewmodel_changer_z = visuals.viewmodel_changer_ref:slider("Z", -10, 10, -1.5, 0.5)
visuals.last_backtrack_tick = tabs.misc:switch("\v金长冲 \rExploit")
visuals.chinchanchon_indicators = tabs.misc3:switch("Indicators")
	visuals.chinchanchon_indicators_ref = visuals.chinchanchon_indicators:create()
		chinchanchon_indicators_style = visuals.chinchanchon_indicators_ref:combo("Style", {"Default", "Modern"})
		chinchanchon_indicators_clr = visuals.chinchanchon_indicators_ref:color_picker("Color", color(255, 255, 255, 255))
		chinchanchon_indicators_first_clr = visuals.chinchanchon_indicators_ref:color_picker("First Color", color(255, 255, 255, 255))
		chinchanchon_indicators_second_clr = visuals.chinchanchon_indicators_ref:color_picker("Second Color", color(1, 1, 1, 255))
visuals.chin_damage_indicator = tabs.misc3:switch("Chin. Damage Indicator")
visuals.chin_ping_prank = tabs.misc:switch("Chin Ping Prank")
	visuals.chin_ping_prank_ref = visuals.chin_ping_prank:create()
		chin_ping_prank_value = visuals.chin_ping_prank_ref:slider("Value", 0, 200, 1)
visuals.chinchanchon_logs = tabs.misc3:switch("AimChon Logs")
visuals.chinchanchon_logs_ref = visuals.chinchanchon_logs:create():depend(visuals.chinchanchon_logs)
visuals.chinchanchon_logs_select = visuals.chinchanchon_logs_ref:selectable("Select", {"On-Screen", "Notify/Console"})
visuals.hit_color = visuals.chinchanchon_logs_ref:color_picker("Hit Color", color(255, 255, 255, 255))
visuals.miss_color = visuals.chinchanchon_logs_ref:color_picker("Miss Color", color(255, 255, 255, 255))
visuals.chintag = tabs.misc3:switch("Chintag")
visuals.fastladder = tabs.misc:switch("Fast Ladder")

-- crosshair indicators
local screen_size = render.screen_size()
screen_center = screen_size * 0.5
local function chinchanchon_inds()
	local localplayer = entity.get_local_player()
	local x = render.screen_size().x 
	local y = render.screen_size().y
	if not globals.is_in_game then return end
	if not globals.is_connected then return end
	mtools.Animation:Register("cross_ind");
	mtools.Animation:Update("cross_ind", 6);
	space_lerp = mtools.Animation:Lerp("cross_ind", "chinchanchon", (localplayer.m_bIsScoped), vector(x, y), vector(x + 70, y), 30);
	space_lerp2 = mtools.Animation:Lerp("cross_ind", "chinchanchon", (localplayer.m_bIsScoped), vector(x, y), vector(x + 105, y), 30);
	local ind_states
    if localplayer.m_fFlags == 263 then
        ind_states = "CROUCH"
    elseif localplayer.m_vecVelocity:length2d() < 5 then
        ind_states = "STAND"
    elseif localplayer.m_fFlags == 256 then
        ind_states = "AIR"
    elseif localplayer.m_fFlags == 262 then
        ind_states = "AIR+C"
    elseif localplayer.m_vecVelocity:length2d() <= 110 then
        ind_states = "WALK"
    elseif localplayer.m_vecVelocity:length2d() > 110 then
        ind_states = "MOVE"
    end

	local ind_states2
    if localplayer.m_fFlags == 263 then
        ind_states2 = "️🕊️Palestinian"
    elseif localplayer.m_vecVelocity:length2d() < 5 then
        ind_states2 = "🦍💨"
    elseif localplayer.m_fFlags == 256 then
        ind_states2 = "▄︻デ══━一"
    elseif localplayer.m_fFlags == 262 then
        ind_states2 = "╭∩╮( •̀_•́ )╭∩╮"
    elseif localplayer.m_vecVelocity:length2d() <= 110 then
        ind_states2 = "🎰⩇⩇:⩇⩇🐮"
    elseif localplayer.m_vecVelocity:length2d() > 110 then
        ind_states2 = "🥛cum is yum🥛"
    end

    if not entity.get_local_player() then return end
    if not entity.get_local_player():is_alive() then return end
	local bodyyaw = entity.get_local_player().m_flPoseParameter[11] * 120 - 60
    if bodyyaw < 0 then angle = bodyyaw*-1 else angle = bodyyaw end
    local alpha = math.max(math.floor(math.sin((globals.realtime%4)*1)*255+25.5),55)
	first_clr = chinchanchon_indicators_first_clr:get()
	second_clr = chinchanchon_indicators_second_clr:get()
	all_clr = (first_clr or second_clr)
	local binds = ui.get_binds()
	local modern_ind = gradient.text_animate('.˚-🍀CHINCHANCHON🍀-˚.', 1.5, {first_clr, second_clr})
	modern_ind:animate()
	if visuals.chinchanchon_indicators:get() then
		if chinchanchon_indicators_style:get() == "Default" then
			render.text(4, vector(space_lerp.x/2, y/2+19), chinchanchon_indicators_clr:get(), 'c', 'chinchanchon')  
			render.text(2, vector(space_lerp.x/2, y/2+30), color(255, 255, 255, 255), 'c', (refs.fd:get() and "FAKEDUCK" or ind_states))
			if refs.dt:get() then render.text(2, vector(space_lerp.x/2, y/2+40), color(255, rage.exploit:get()*255, rage.exploit:get()*255, 255), 'c', 'DOUBLETAP') end
			if refs.hs:get() and not refs.dt:get() then render.text(2, vector(space_lerp.x/2, y/2+40), color(255, 255, 255, 255), 'c', 'HIDESHOTS') end
		elseif chinchanchon_indicators_style:get() == "Modern" then
			render.text(4, vector(space_lerp2.x/2, y/2+20), all_clr, 'c', modern_ind:get_animated_text())  
			render.text(1, vector(space_lerp2.x/2, y/2+30), color(255, 255, 255, 255), 'c', (refs.fd:get() and "fakeducking" or ind_states2))
			if refs.dt:get() then render.text(1, vector(space_lerp2.x/2 ,y/2+40), color(176, rage.exploit:get()*255, rage.exploit:get()*59, 255), 'c', 'dt') end
			if refs.hs:get() and not refs.dt:get() then render.text(1, vector(space_lerp2.x/2 ,y/2+40), color(255, 144, 59, 255), 'c', 'os') end
		end
	end

	if visuals.chin_damage_indicator:get() then 
		render.text(1, vector(x/2+5, y/2-20), color(255, 255, 255, 255), '', refs.md:get())
	end  

	local local_player = entity.get_local_player()
	clan_anim = function(text, indices) if not globals.is_connected then return end local text_anim = '               ' .. text .. '                      '  local tickinterval = globals.tickinterval local tickcount = globals.tickcount + math.floor(utils.net_channel().avg_latency[0]+0.22 / globals.tickinterval + 0.5) local i = tickcount / math.floor(0.3 / globals.tickinterval + 0.5) i = math.floor(i % #indices) i = indices[i+1]+1 return string.sub(text_anim, i, i+15) end
	if visuals.chintag:get() then
		if local_player ~= nil and globals.is_connected and globals.choked_commands then
			clan_tag = clan_anim(' chinchanchon ', {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 0})
			if entity.get_game_rules()['m_gamePhase'] == 5 or entity.get_game_rules()['m_gamePhase'] == 4 then
				clan_tag = clan_anim(' chinchanchon ', {12})
				common.set_clan_tag(clan_tag)
			elseif clan_tag ~= clan_tag_prev then
				common.set_clan_tag(clan_tag)
			end
			clan_tag_prev = clan_tag
		end
		enabled_prev = false
	elseif not visuals.chintag:get() and enabled_prev == false then
        common.set_clan_tag('')
        enabled_prev = true
	end

	if chinuals_indicators_enable:get() then
		if chinuals_indicators:get() == "Default" then
			if globals.is_in_game then
				local localplayer = entity.get_local_player()
				if localplayer:is_alive() then
					render.poly(chinchanchon.chinchanchon_manuals:get() == "Right" and chinuals_color:get() or color(35, 35, 35, 150), vector(screen_size.x / 2 + 55, screen_size.y / 2 - 2 + 2), vector(screen_size.x / 2 + 42, screen_size.y / 2 - 2 - 7), vector(screen_size.x / 2 + 42, screen_size.y / 2 - 2 + 11))
					render.poly(chinchanchon.chinchanchon_manuals:get() == "Left" and chinuals_color:get() or color(35, 35, 35, 150), vector(screen_size.x / 2 - 55, screen_size.y / 2 - 2 + 2), vector(screen_size.x / 2 - 42, screen_size.y / 2 - 2 - 7), vector(screen_size.x / 2 - 42, screen_size.y / 2 - 2 + 11))

					render.rect_outline(vector(screen_size.x / 2 + 38, screen_size.y / 2 - 2 - 7), vector(screen_size.x / 2 + 38 + 2, screen_size.y / 2 - 2 - 7 + 18), rage.antiaim:inverter() == true == true and chinuals_inverter_color:get() or color(35, 35, 35, 150))
					render.rect_outline(vector(screen_size.x / 2 - 40, screen_size.y / 2 - 2 - 7), vector(screen_size.x / 2 - 38, screen_size.y / 2 - 2 - 7 + 18), rage.antiaim:inverter() == true == false and chinuals_inverter_color:get() or color(35, 35, 35, 150))
				end
			end
		elseif chinuals_indicators:get() == "金长冲" then
			render.text(fonts.vrdn, vector(screen_size.x / 2 - 55, screen_size.y / 2 - 12), chinchanchon.chinchanchon_manuals:get() == "Left" and chinuals_left_color:get() or color(35, 35, 35, 150), '', '金')
			render.text(fonts.vrdn, vector(screen_size.x / 2 + 41, screen_size.y / 2 - 12), chinchanchon.chinchanchon_manuals:get() == "Right" and chinuals_right_color:get() or color(35, 35, 35, 150), '', '长')  
		end

		if not visuals.chinchanchon_indicators:get() then
			render.text(1, vector(screen_size.x / 2 - 55, screen_size.y / 2 + 520), color(255, 255, 255, 255), '', 'C H I N C H A N C H O N')
		end
	end

end
events.render:set(function()
    chinchanchon_inds()
end)

-- menu logic
events.render:set(function()
	if chinchanchon.def_pitch:get() == "Custom" then
		chinchanchon.def_pitch_ref:visibility(true)
		custom_def_pitch:visibility(true)
		custom_offset_pitch:visibility(false)
		custom_switchup_pitch:visibility(false)
		custom_switchdown_pitch:visibility(false)
		custom_random_pitch:visibility(false)
	else
		chinchanchon.def_pitch_ref:visibility(false)
		custom_def_pitch:visibility(false)
		custom_offset_pitch:visibility(false)
		custom_switchup_pitch:visibility(false)
		custom_switchdown_pitch:visibility(false)
		custom_random_pitch:visibility(false)
	end

	if custom_def_pitch:get() == "Switch" then 
		custom_offset_pitch:visibility(false)
		custom_switchup_pitch:visibility(true)
		custom_switchdown_pitch:visibility(true)
		custom_random_pitch:visibility(false)
	elseif custom_def_pitch:get() == "Offset" then 
		custom_offset_pitch:visibility(true)
		custom_switchup_pitch:visibility(false)
		custom_switchdown_pitch:visibility(false)
		custom_random_pitch:visibility(false)
	elseif custom_def_pitch:get() == "Random" then 
		custom_offset_pitch:visibility(false)
		custom_switchup_pitch:visibility(false)
		custom_switchdown_pitch:visibility(false)
		custom_random_pitch:visibility(true)
	end

	if chinchanchon.def_yaw:get() == "Custom" then
		chinchanchon.def_yaw_ref:visibility(true)
		custom_def_yaw:visibility(true)
		custom_offset_yaw:visibility(false)
		custom_switch1_yaw:visibility(false)
		custom_switch2_yaw:visibility(false)
		custom_spin_yaw:visibility(false)
		custom_random_yaw:visibility(false)
	else
		chinchanchon.def_yaw_ref:visibility(false)
		custom_def_yaw:visibility(false)
		custom_offset_yaw:visibility(false)
		custom_switch1_yaw:visibility(false)
		custom_switch2_yaw:visibility(false)
		custom_spin_yaw:visibility(false)
		custom_random_yaw:visibility(false)
	end

	if custom_def_yaw:get() == ":override" then
		custom_offset_yaw:visibility(true)
		custom_switch1_yaw:visibility(false)
		custom_switch2_yaw:visibility(false)
		custom_spin_yaw:visibility(false)
		custom_random_yaw:visibility(false)
	elseif custom_def_yaw:get() == "rage.antiaim:inverter" then
		custom_offset_yaw:visibility(false)
		custom_switch1_yaw:visibility(true)
		custom_switch2_yaw:visibility(true)
		custom_spin_yaw:visibility(false)
		custom_random_yaw:visibility(false)
	elseif custom_def_yaw:get() == "math.normalize_yaw" then
		custom_offset_yaw:visibility(false)
		custom_switch1_yaw:visibility(false)
		custom_switch2_yaw:visibility(false)
		custom_spin_yaw:visibility(true)
		custom_random_yaw:visibility(false)
	elseif custom_def_yaw:get() == "math.random" then
		custom_offset_yaw:visibility(false)
		custom_switch1_yaw:visibility(false)
		custom_switch2_yaw:visibility(false)
		custom_spin_yaw:visibility(false)
		custom_random_yaw:visibility(true)
	end

	if chinchanchon.activate:get() == "Disabled" then
		chinchanchon.defensive_triggers:visibility(false)
		chinchanchon.defensive_states:visibility(false)
		chinchanchon.def_pitch:visibility(false)
		chinchanchon.def_yaw:visibility(false)
	elseif chinchanchon.activate:get() == "Chin" then
		chinchanchon.defensive_triggers:visibility(false)
		chinchanchon.defensive_states:visibility(false)
		chinchanchon.def_pitch:visibility(false)
		chinchanchon.def_yaw:visibility(false)
	elseif chinchanchon.activate:get() == "Chan" then
		chinchanchon.defensive_triggers:visibility(false)
		chinchanchon.defensive_states:visibility(false)
		chinchanchon.def_pitch:visibility(false)
		chinchanchon.def_yaw:visibility(false)
	elseif chinchanchon.activate:get() == "Chon" then
		chinchanchon.defensive_triggers:visibility(true)
	end

	if chinchanchon_indicators_style:get() == "Default" then
		chinchanchon_indicators_clr:visibility(true)
		chinchanchon_indicators_first_clr:visibility(false)
		chinchanchon_indicators_second_clr:visibility(false)
	elseif chinchanchon_indicators_style:get() == "Modern" then
		chinchanchon_indicators_clr:visibility(false)
		chinchanchon_indicators_first_clr:visibility(true)
		chinchanchon_indicators_second_clr:visibility(true)
	end

	if chinuals_indicators_enable:get() then
		if chinuals_indicators:get() == "Default" then
			chinuals_color:visibility(true)
			chinuals_inverter_color:visibility(true)
			chinuals_left_color:visibility(false)
			chinuals_right_color:visibility(false)
		elseif chinuals_indicators:get() == "金长冲" then
			chinuals_color:visibility(false)
			chinuals_inverter_color:visibility(false)
			chinuals_left_color:visibility(true)
			chinuals_right_color:visibility(true)
		end
	end

end)

--credits to @bennito
local hitgroup_str = {
    [0] = 'generic',
    'head', 'chest', 'stomach',
    'left arm', 'right arm',
    'left leg', 'right leg',
    'neck', 'generic', 'gear'
}

events.aim_ack:set(function(e)
    if visuals.chinchanchon_logs_select:get("Notify/Console") then
        local userid = entity.get(e.userid, true)
        local clr = visuals.hit_color:get()
        local clr_miss = visuals.miss_color:get()
        local me = entity.get_local_player()
        local target = entity.get(e.target)
        local damage = e.damage
        local wanted_damage = e.wanted_damage
        local wanted_hitgroup = hitgroup_str[e.wanted_hitgroup]
        local hitchance = e.hitchance
        local state = e.state
        local state1 = e.state
        local bt = e.backtrack
        if not target then return end
        if target == nil then return end
        local health = target["m_iHealth"]
    
        if state1 == "spread" then
            state1 = "\a"..clr_miss:to_hex().."spread"
        end
        if state1 == "prediction error" then
            state1 = "\a"..clr_miss:to_hex().."pred. error"
        end
        if state1 == "correction" then
            state1 = "\a"..clr_miss:to_hex().."resolver"
        end
        if state1 == "misprediction" then
            state1 = "\a"..clr_miss:to_hex().."misprediction"
        end
        if state1 == "lagcomp failure" then
            state1 = "\a"..clr_miss:to_hex().."lagcomp failure"
        end
        if state == "correction" then
            state = "resolver"
        end
    
        local hitgroup = hitgroup_str[e.hitgroup]
        
        if state == nil then
            print_dev(("\a"..clr:to_hex().."[chinchanchon] \aFFFFFFFFRegistred \a"..clr:to_hex().."%s \aFFFFFFFFin the \a"..clr:to_hex().."%s \aFFFFFFFFfor \a"..clr:to_hex().."%d\aFFFFFFFF(\a"..clr:to_hex()..""..string.format("%.f", wanted_damage).."\aFFFFFFFF) \aFFFFFFFFdamage (hp: "..health..") (aimed: "..wanted_hitgroup..") (bt: %s)"):format(target:get_name(), hitgroup, e.damage, bt))
            print_raw(("\a"..clr:to_hex().."[chinchanchon] \aFFFFFFFFRegistred \a"..clr:to_hex().."%s \aFFFFFFFFin the \a"..clr:to_hex().."%s \aFFFFFFFFfor \a"..clr:to_hex().."%d\aFFFFFFFF(\a"..clr:to_hex()..""..string.format("%.f", wanted_damage).."\aFFFFFFFF) \aFFFFFFFFdamage (hp: "..health..") (aimed: "..wanted_hitgroup..") (bt: %s)"):format(target:get_name(), hitgroup, e.damage, bt))
        else
            print_dev(('\a'..clr_miss:to_hex()..'[chinchanchon] \aFFFFFFFFMissed shot in \a'..clr_miss:to_hex()..'%s \aFFFFFFFFin the %s due to \a'..clr_miss:to_hex()..''..state1..'\aFFFFFFFF (hc: '..string.format("%.f", hitchance)..') (damage: '..string.format("%.f", wanted_damage)..')'):format(target:get_name(), wanted_hitgroup))
            print_raw(('\a'..clr_miss:to_hex()..'[chinchanchon] \aFFFFFFFFMissed shot in \a'..clr_miss:to_hex()..'%s \aFFFFFFFFin the %s due to \a'..clr_miss:to_hex()..''..state1..'\aFFFFFFFF (hc: '..string.format("%.f", hitchance)..') (damage: '..string.format("%.f", wanted_damage)..')'):format(target:get_name(), wanted_hitgroup))
        end
    end
    end)

events.player_hurt:set(function(e)
    if visuals.chinchanchon_logs_select:get("Notify/Console") then
        local clr = visuals.hit_color:get()
        local me = entity.get_local_player()
        local attacker = entity.get(e.attacker, true)
        local weapon = e.weapon
        local type_hit = 'Hit'
    
        if weapon == 'hegrenade' then 
            type_hit = 'Naded'
        end
    
        if weapon == 'inferno' then
            type_hit = 'Burned'
        end
    
        if weapon == 'knife' then 
            type_hit = 'Knifed'
        end
    
        if weapon == 'hegrenade' or weapon == 'inferno' or weapon == 'knife' then
    
        if me == attacker then
            local user = entity.get(e.userid, true)
            print_raw(('\a'..clr:to_hex()..'[chinchanchon] \aFFFFFFFF'..type_hit..' \a'..clr:to_hex()..'%s \aFFFFFFFFfor \a'..clr:to_hex()..'%d \aFFFFFFFFdamage (%d health remaining)'):format(user:get_name(), e.dmg_health, e.health))
            print_dev((''..type_hit..' %s for %d damage (%d health remaining)'):format(user:get_name(), e.dmg_health, e.health))
        end
        end
        end
    end)

local screen = render.screen_size()
local hitgroup_str = {[0] = 'generic','head', 'chest', 'stomach','left arm', 'right arm','left leg', 'right leg','neck', 'generic', 'gear'}
local hitlog = {}
local id = 1
local weapon_to_verb = {knife = 'Knifed', hegrenade = 'Naded', inferno = 'Burned'}
events.player_hurt:set(function(e)
    if visuals.chinchanchon_logs_select:get("On-Screen") then
        local clr = visuals.hit_color:get()
		local me = entity.get_local_player()
		local attacker = entity.get(e.attacker, true)
        if me == attacker then
		local damage = e.dmg_health
		local user = entity.get(e.userid, true)
		local hitgroup = hitgroup_str[e.hitgroup]
		local weapon_name = e.weapon
		local remaining_health = e.health
		if weapon_name == 'hegrenade' or weapon_name == 'inferno' or weapon_name == 'knife' then return end
		if result == nil then
			hitlog[#hitlog+1] = {("\a"..clr:to_hex().."[chinchanchon] \aFFFFFFFFRegistred \a"..clr:to_hex()..""..user:get_name().." \aFFFFFFC8in the \a"..clr:to_hex()..""..hitgroup.." \aFFFFFFC8for \a"..clr:to_hex()..""..damage.." \aFFFFFFC8damage ("..remaining_health.." \aFFFFFFC8health remaining)"), globals.tickcount + 250, 0}
		end
		id = id == 999 and 1 or id + 1 
	end
end
end)

events.player_hurt:set(function(e)
    if visuals.chinchanchon_logs_select:get("On-Screen") then
        local clr = visuals.hit_color:get()
        local me = entity.get_local_player()
        local attacker = entity.get(e.attacker, true)
        local weapon = e.weapon
        local type_hit = 'Hit'
    
        if weapon == 'hegrenade' then 
            type_hit = 'Naded'
        end
    
        if weapon == 'inferno' then
            type_hit = 'Burned'
        end
    
        if weapon == 'knife' then 
            type_hit = 'Knifed'
        end
    
        if weapon == 'hegrenade' or weapon == 'inferno' or weapon == 'knife' then
    
        if me == attacker then
            local user = entity.get(e.userid, true)
			hitlog[#hitlog+1] = {("\a"..clr:to_hex().."[chinchanchon] \aFFFFFFFF"..type_hit.." \a"..clr:to_hex().."%s \aFFFFFFC8for \a"..clr:to_hex().."%s \aFFFFFFC8damage (%s \aFFFFFFC8health remaining)"):format(user:get_name(), e.dmg_health, e.health), globals.tickcount + 250, 0}
        end
        end
        end
    end)

events.aim_ack:set(function(shot)
	if visuals.chinchanchon_logs_select:get("On-Screen") then
    local clr_miss = visuals.miss_color:get()
	player_name = shot.target:get_name()
    damage = shot.damage
    hitchance = shot.hitchance
    hitgroup = hitgroup_str[shot.hitgroup]
    backtrack = shot.backtrack
    wanted_damage = shot.wanted_damage
    hitchance = shot.hitchance
    wanted_hitgroup = hitgroup_str[shot.wanted_hitgroup]
    state = shot.state
    local text = "%"
	if not (state == nil) then
        hitlog[#hitlog+1] = {("\a"..clr_miss:to_hex().."[chinchanchon] \aFFFFFFFFMissed shot in \a"..clr_miss:to_hex()..""..player_name.." \aFFFFFFC8in the \a"..clr_miss:to_hex()..""..wanted_hitgroup.." \aFFFFFFC8due to \a"..clr_miss:to_hex()..""..state.." \aFFFFFFC8("..hitchance..""..text.."\aFFFFFFC8 HC)"), globals.tickcount + 250, 0}
    end
	id = id == 999 and 1 or id + 1 
end
end)

events.render:set(function()
	if #hitlog > 0 then
        if globals.tickcount >= hitlog[1][2] then
            if hitlog[1][3] > 0 then
                hitlog[1][3] = hitlog[1][3] - 20
            elseif hitlog[1][3] <= 0 then
                table.remove(hitlog, 1)
            end
        end
        if #hitlog > 6 then
            table.remove(hitlog, 1)
        end
        if globals.is_connected == false then
            table.remove(hitlog, #hitlog)
        end
        for i = 1, #hitlog do
            text_size = render.measure_text(1, nil, hitlog[i][1]).x
           if hitlog[i][3] < 255 then 
                hitlog[i][3] = hitlog[i][3] + 10 
            end
            if visuals.chinchanchon_logs_select:get("On-Screen") then
            render.text(1, vector(screen.x/2 - text_size/2 + (hitlog[i][3]/35), screen.y/1.3 + 13 * i), color(255, 255, 255, hitlog[i][3]), nil, hitlog[i][1])
            end
		end
    end
end)
--credits to @bennito

--- visual tab func
events.createmove:set(function()
    if visuals.last_backtrack_tick:get() then
        cvar.cl_interp_ratio:float(1)
		cvar.sv_max_allowed_net_graph:float(2)
		cvar.cl_interpolate:float(0)
    else
        cvar.cl_interp_ratio:float(2)
		cvar.cl_interpolate:float(1)
    end

    if visuals.aspect_ratio:get() then
        cvar.r_aspectratio:float(aspect_ratio_value:get()/100)
    else
        cvar.r_aspectratio:float(0)
    end

    if visuals.viewmodel_changer:get() then
        cvar.viewmodel_fov:int(viewmodel_changer_fov:get(), true)
		cvar.viewmodel_offset_x:float(viewmodel_changer_x:get(), true)
		cvar.viewmodel_offset_y:float(viewmodel_changer_y:get(), true)
		cvar.viewmodel_offset_z:float(viewmodel_changer_z:get(), true)
    else
        cvar.viewmodel_fov:int(68)
        cvar.viewmodel_offset_x:float(2.5)
        cvar.viewmodel_offset_y:float(0)
        cvar.viewmodel_offset_z:float(-1.5)
    end

end)

-- anti aim system
FLAGS = {
    ON_GROUND = 257,
    DUCKING = 263,
    IN_AIR = 256,
    IN_AIR_DUCKING = 262,
}

STATES = {
    STAND = 1,
    WALK = 2,
    SLOW_WALK = 3,
    DUCK = 4,
    AIR = 5,
    AIR_DUCK = 6,
}

function anti_aim_states()
    local lp = entity.get_local_player()
    local velocity = lp.m_vecVelocity:length2d()
    local flags = lp.m_fFlags

    local state_table = {
        [FLAGS.ON_GROUND] = {
            [velocity < 3] = STATES.STAND,
            [velocity > 3 and velocity < 81] = STATES.SLOW_WALK,
            [velocity > 81] = STATES.WALK,
        },
        [FLAGS.DUCKING] = STATES.DUCK,
        [FLAGS.IN_AIR] = STATES.AIR,
        [FLAGS.IN_AIR_DUCKING] = STATES.AIR_DUCK,
    }

    local state = state_table[flags]
    if state then
        if type(state) == "table" then
            for condition, value in pairs(state) do
                if condition then
                    return value
                end
            end
        else
            return state
        end
    end
end

-- anti aim func
--[[
	1 - STANDING
	2 - MOVING
	3 - WALKING
	4 - CROUCHING
	5 - AIR
	6 - AIR CROUCHING
	]]
function chinchanchon_aa_system(cmd)
	if chinchanchon.activate:get() == "Chin" or chinchanchon.activate:get() == "Chan" or chinchanchon.activate:get() == "Chon" or chinchanchon.activate:get() == "Disabled" then

-- CHIN preset
		if chinchanchon.activate:get() == "Chin" then
			if anti_aim_states() == 1 then	--														stand
				refs.pitch:override("Down")
            	refs.yaw:override("Backward")
				refs2.yaw_base:override("At Target")
            	refs.yaw_modifer:override("Center")
				refs.yaw_offset:override(-5)
            	refs.yaw_modifer_slider:override(-8)
            	refs.body_yaw:override(true)
            	refs.l_limit:override(50)
            	refs.r_limit:override(50)
            	refs.options:override()
            	refs.body_yaw_freestanding:override("Peek Fake")
				refs.hidden:override(true)
				rage.antiaim:override_hidden_pitch(math.random(-76 , 64))
				rage.antiaim:override_hidden_yaw_offset(math.random(-95 , 124))
				refs.lag_options:override("Always On")
				refs.hs_options:override("Break LC")
	elseif anti_aim_states() == 2 then --														move
				refs.pitch:override("Down")
            	refs.yaw:override("Backward")
            	refs.yaw_modifer:override("Center")  
            	refs.yaw_modifer_slider:override(rage.antiaim:inverter() == true and -14 or 88)
            	refs.body_yaw:override(true)
            	refs.l_limit:override(60)
            	refs.r_limit:override(60)
            	refs.options:override()
            	refs.body_yaw_freestanding:override("Peek Fake")
				refs.hidden:override(true)
				rage.antiaim:override_hidden_pitch(math.random(14 , 88))
				rage.antiaim:override_hidden_yaw_offset(math.random(-14 , 88))
				refs.lag_options:override("Always On")
				refs.hs_options:override("Break LC")

    	elseif anti_aim_states() == 3 then
            	refs.pitch:override("Down")--														walk
            	refs.yaw:override("Backward")
				refs2.yaw_base:override("At Target")
            	refs.yaw_modifer:override("Center")  
            	refs.yaw_modifer_slider:override(-39)
            	refs.body_yaw:override(true)
            	refs.l_limit:override(54)
            	refs.r_limit:override(55)
            	refs.options:override("Jitter")
				refs.hidden:override(true)
				rage.antiaim:override_hidden_pitch(math.random(-14 ,88))
				rage.antiaim:override_hidden_yaw_offset(math.random(-114 ,88))
				refs.lag_options:override("Always On")
				refs.hs_options:override("Break LC")
    	elseif anti_aim_states() == 4 then
                refs.pitch:override("Down")--														crouching
                refs.yaw:override("Backward")
				refs2.yaw_base:override("At Target")
                refs.yaw_modifer:override("Center") 
                refs.yaw_modifer_slider:override(-45)
                refs.body_yaw:override(true)
                refs.l_limit:override(60)
                refs.r_limit:override(60)
                refs.options:override("Jitter")
                refs.hidden:override(true)
                rage.antiaim:override_hidden_pitch(math.random(-43, 67))
                rage.antiaim:override_hidden_yaw_offset(utils.random_int(-89, 177))
                refs.lag_options:override("Always On")
                refs.hs_options:override("Break LC")
    	elseif anti_aim_states() == 5 then
            	refs.pitch:override("Down")--														air
            	refs.yaw:override("Backward")
				refs2.yaw_base:override("At Target")
            	refs.yaw_modifer:override("Center") 
            	refs.yaw_modifer_slider:override(-86)
            	refs.body_yaw:override(true)
            	refs.l_limit:override(60)
            	refs.r_limit:override(60)
            	refs.options:override("Jitter")
            	refs.body_yaw_freestanding:override("Peek Fake")
				refs.hidden:override(true)
				rage.antiaim:override_hidden_pitch(-12)
				rage.antiaim:override_hidden_yaw_offset(math.random(147, 177))
				refs.lag_options:override("Always On")
				refs.hs_options:override("Break LC")
		elseif anti_aim_states() == 6 then
                refs.pitch:override("Down")--														air+c
                refs.yaw:override("Backward")
				refs2.yaw_base:override("At Target")
				refs.yaw_offset:override()
                refs.yaw_modifer:override("Center") 
                refs.yaw_modifer_slider:override(0)
                refs.body_yaw:override(true)
                refs.l_limit:override(51)
                refs.r_limit:override(60)
                refs.options:override("Jitter, Anti-Brute")
                refs.hidden:override(true)
                rage.antiaim:override_hidden_pitch(math.random(-88, -88))
               rage.antiaim:override_hidden_yaw_offset(math.random(-101, 128))
                refs.lag_options:override("Always On")
                refs.hs_options:override("Break LC")
            end


				-- CHAN preset
		elseif chinchanchon.activate:get() == "Chan" then 
			if anti_aim_states() == 1 then
            	refs.pitch:override("Down")
            	refs.yaw:override("Backward")
				refs2.yaw_base:override("At Target")
            	refs.yaw_modifer:override("Center")
				refs.yaw_offset:override(-5)
            	refs.yaw_modifer_slider:override(-8)
            	refs.body_yaw:override(true)
            	refs.l_limit:override(50)
            	refs.r_limit:override(50)
            	refs.options:override()
            	refs.body_yaw_freestanding:override("Peek Fake")
				refs.hidden:override(true)
				rage.antiaim:override_hidden_pitch(math.random(-76 , 64))
				rage.antiaim:override_hidden_yaw_offset(math.random(-95 , 124))
				refs.lag_options:override("Always On")
				refs.hs_options:override("Break LC")
    	elseif anti_aim_states() == 2 then
           		refs.pitch:override("Down")
            	refs.yaw:override("Backward")
            	refs.yaw_modifer:override("Center")  
            	refs.yaw_modifer_slider:override(rage.antiaim:inverter() == true and -14 or 88)
            	refs.body_yaw:override(true)
            	refs.l_limit:override(60)
            	refs.r_limit:override(60)
            	refs.options:override()
            	refs.body_yaw_freestanding:override()
				refs.hidden:override(true)
				rage.antiaim:override_hidden_pitch(math.random(54 , -55))
				rage.antiaim:override_hidden_yaw_offset(math.random(-114 , 88))
				refs.lag_options:override("Always On")
				refs.hs_options:override("Break LC")
    	elseif anti_aim_states() == 3 then
            	refs.pitch:override("Down")
            	refs.yaw:override("Backward")
            	refs.yaw_modifer:override("Center") 
            	refs.yaw_modifer_slider:override(rage.antiaim:inverter() == true and 16 or 15)
            	refs.body_yaw:override(true)
            	refs.l_limit:override(60)
            	refs.r_limit:override(60)
            	refs.options:override({Jitter})
            	refs.body_yaw_freestanding:override()
                refs.hidden:override(true)
                rage.antiaim:override_hidden_pitch(math.random(-12, 51))
                rage.antiaim:override_hidden_yaw_offset(utils.random_int(-116, 131))
                refs.lag_options:override("Always On")
				refs.hs_options:override("Break LC")
    	elseif anti_aim_states() == 4 then
            	refs.pitch:override("Down")
            	refs.yaw:override("Backward")
				refs2.yaw_base:override("At Target")
            	refs.yaw_modifer:override("Center") 
            	refs.yaw_modifer_slider:override(-55)
				refs.body_yaw:override(true)
            	refs.l_limit:override(60)
				refs.r_limit:override(60)
            	refs.options:override("Jitter")
            	refs.body_yaw_freestanding:override()
                refs.hidden:override(true)
                rage.antiaim:override_hidden_pitch(math.random(-70 ,55))
                rage.antiaim:override_hidden_yaw_offset(utils.random_int(-153, 133))
                refs.lag_options:override("Always On")
                refs.hs_options:override("Break LC")
    	elseif anti_aim_states() == 5 then
            	refs.pitch:override("Down")
            	refs.yaw:override("Backward")
            	refs.yaw_modifer:override("Center") 
            	refs.yaw_modifer_slider:override(-46)
            	refs.body_yaw:override(true)
            	refs.l_limit:override(60)
            	refs.r_limit:override(60)
            	refs.options:override("Jitter")
            	refs.body_yaw_freestanding:override("Peek Fake")
				refs.hidden:override(true)
				rage.antiaim:override_hidden_pitch(80)
				rage.antiaim:override_hidden_yaw_offset(math.random(-90, 180))
				refs.lag_options:override("Always On")
				refs.hs_options:override("Break LC")
    	elseif anti_aim_states() == 6 then
            	refs.pitch:override("Down")
            	refs.yaw:override("Backward")
				refs2.yaw_base:override("At Target")
            	refs.yaw_modifer:override("Center") 
            	refs.yaw_modifer_slider:override(0)
            	refs.body_yaw:override(true)
            	refs.l_limit:override(60)
				refs.r_limit:override(60)
            	refs.options:override("Jitter")
            	refs.body_yaw_freestanding:override()
                refs.hidden:override(true)
                rage.antiaim:override_hidden_pitch(math.random(-75, 80))
                rage.antiaim:override_hidden_yaw_offset(utils.random_int(-53, 151))
                refs.lag_options:override("Always On")
                refs.hs_options:override("Break LC")
			end

			-- DISABLED presets
		elseif chinchanchon.activate:get() == "Disabled" then
			refs.pitch:override()
			refs.yaw:override()
			refs.yaw_modifer:override() 
			refs.yaw_offset:override()
			refs.yaw_modifer_slider:override()
			refs.body_yaw:override(false)
			refs.l_limit:override()
			refs.r_limit:override()
			refs.options:override()
			refs.body_yaw_freestanding:override()
		end
    end

	-- defensive states
	local states = false

	if (anti_aim_states() == 1 and chinchanchon.defensive_states:get("Standing")) or
	(anti_aim_states() == 2 and chinchanchon.defensive_states:get("Moving")) or
	(anti_aim_states() == 3 and chinchanchon.defensive_states:get("Walking")) or
	(anti_aim_states() == 4 and chinchanchon.defensive_states:get("Crouching")) or
	(anti_aim_states() == 5 and chinchanchon.defensive_states:get("Air")) or
	(anti_aim_states() == 6 and chinchanchon.defensive_states:get("Air Crouching")) then
		states = true
	else
		states = false
	end

	if states == true and chinchanchon.defensive_triggers:get() and chinchanchon.activate:get() == "Chon" then
		refs.hidden:override(true)
	else
		refs.hidden:override(false)
	end

	local def_chinchan = chinchanchon.activate:get()

	if (def_chinchan == "Chin" or def_chinchan == "Chan") then
		refs.hidden:override(true)
	end

	if (def_chinchan == "Chin" or def_chinchan == "Chan") then
		chinchanchon.defensive_triggers:set(false)
	end

	-- defensive pitch presets
	if chinchanchon.defensive_triggers:get() then
		if chinchanchon.def_pitch:get() == "Disabled" then
            rage.antiaim:override_hidden_pitch(0)
		elseif chinchanchon.def_pitch:get() == "Up" then
			rage.antiaim:override_hidden_pitch(-89)
		elseif chinchanchon.def_pitch:get() == "Semi-Up" then
			rage.antiaim:override_hidden_pitch(-45)
		elseif chinchanchon.def_pitch:get() == "Down" then
			rage.antiaim:override_hidden_pitch(89)
		elseif chinchanchon.def_pitch:get() == "Semi-Down" then
			rage.antiaim:override_hidden_pitch(45)
		elseif chinchanchon.def_pitch:get() == "Switch" then
			rage.antiaim:override_hidden_pitch(rage.antiaim:inverter() == true and -89 or 89)
		elseif chinchanchon.def_pitch:get() == "Random" then
			rage.antiaim:override_hidden_pitch(math.random(-89, 89))
		end

		-- defensive pitch custom
		if chinchanchon.def_pitch:get() == "Custom" then
			if custom_def_pitch:get() == "Disabled" then
				rage.antiaim:override_hidden_pitch(0)
			elseif custom_def_pitch:get() == "Offset" then
				rage.antiaim:override_hidden_pitch(custom_offset_pitch:get())
			elseif custom_def_pitch:get() == "Switch" then
				local stage = globals.tickcount % 3
				if stage == 0 then
					rage.antiaim:override_hidden_pitch(custom_switchup_pitch:get())
				elseif stage == 2 then
					rage.antiaim:override_hidden_pitch(custom_switchdown_pitch:get())
				end
			elseif custom_def_pitch:get() == "Random" then
				random_pitch = (math.random(-89, 89))
				rage.antiaim:override_hidden_pitch(custom_random_pitch:get()+random_pitch)
			end
		end

		-- defensive yaw presets
		if chinchanchon.def_yaw:get() == "Disabled" then 
			rage.antiaim:override_hidden_yaw_offset(0)
		elseif chinchanchon.def_yaw:get() == "Switch" then
			local stage = globals.tickcount % 3
			if stage == 0 then
				rage.antiaim:override_hidden_yaw_offset(utils.random_int(-180, -90))
			elseif stage == 2 then
				rage.antiaim:override_hidden_yaw_offset(utils.random_int(90, 180))
			end
		elseif chinchanchon.def_yaw:get() == "Opposite" then
			rage.antiaim:override_hidden_yaw_offset(180)
		elseif chinchanchon.def_yaw:get() == "Spin" then
			local calcspin = (globals.curtime * 550)
			calcspin = math.normalize_yaw(calcspin)
			rage.antiaim:override_hidden_yaw_offset(calcspin)
		elseif chinchanchon.def_yaw:get() == "Random" then
			rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180))
		end

		-- defensive yaw custom
		if chinchanchon.def_yaw:get() == "Custom" then 
			if custom_def_yaw:get() == "Disabled" then
				rage.antiaim:override_hidden_yaw_offset(0)
			elseif custom_def_yaw:get() == ":override" then
				rage.antiaim:override_hidden_yaw_offset(custom_offset_yaw:get())
			elseif custom_def_yaw:get() == "rage.antiaim:inverter" then
				local stage = globals.tickcount % 3
				if stage == 0 then
					rage.antiaim:override_hidden_yaw_offset(custom_switch1_yaw:get())
				elseif stage == 2 then
					rage.antiaim:override_hidden_yaw_offset(custom_switch2_yaw:get())
				end
			elseif custom_def_yaw:get() == "math.normalize_yaw" then
				local calcspin = (globals.curtime * custom_spin_yaw:get() * 45)
				calcspin = math.normalize_yaw(calcspin)
				rage.antiaim:override_hidden_yaw_offset(calcspin)
			elseif custom_def_yaw:get() == "math.random" then
				random_yaw = (math.random(-180, 180))
				rage.antiaim:override_hidden_yaw_offset(custom_random_yaw:get()+random_yaw)
			end
		end
	end

	-- yaw base
	if chinchanchon.chan_base:get() == "Local View" then
		refs2.yaw_base:override("Local View")
	elseif chinchanchon.chan_base:get() == "At Target" then
		refs2.yaw_base:override("At Target")
	end

	-- manuals
	if chinchanchon.chinchanchon_manuals:get() == "Forward" then
		refs.yaw_offset:override(180)
		refs2.yaw_base:override("Local View")
		refs.hidden:override(false)
	elseif chinchanchon.chinchanchon_manuals:get() == "Left" then
		refs.yaw_offset:override(-90)
		refs2.yaw_base:override("Local View")
		refs.hidden:override(false)
	elseif chinchanchon.chinchanchon_manuals:get() == "Right" then
		refs.yaw_offset:override(90)
		refs2.yaw_base:override("Local View")
		refs.hidden:override(false)
	end

	-- disable yaw modifiers manual
	chnls = chinchanchon.chinchanchon_manuals:get()
	if (chnls == "Forward" or chnls == "Left" or chnls == "Right") and static_chinuals:get() then
		refs.pitch:override("Down")
		refs.options:override({})
		refs.yaw_modifer:override("Disabled")
		refs.l_limit:override(60)
		refs.r_limit:override(60)
		refs.body_yaw:override(true)
		refs.body_yaw_freestanding:override()
		refs.hidden:override()
	end

	-- e-peek
	if (chnls == "Left" or chnls == "Right") and e_peek:get() then
		chinchanchon.activate:get()
		refs.hidden:override(true)
		rage.antiaim:override_hidden_pitch(0)
		rage.antiaim:override_hidden_yaw_offset(180)
	end

	-- ping spike
	if visuals.chin_ping_prank:get() then
        refs.fake_latency:override(chin_ping_prank_value:get())
    else
        refs.fake_latency:override()
    end

	-- freestanding
	if chinchanchon.freestand:get() then
		refs.freestanding:override(true)
	else
		refs.freestanding:override(false)
	end

	if chinchanchon.freestand:get() then
		if dis_yaw_modifiers:get() then
			refs.yaw_modifer:override("Disabled")
			refs.yaw_modifer_slider:override(0)
			refs.yaw_offset:override(0)
			refs.options:override({})
			refs.hidden:override(false)
		elseif dis_def_modifiers:get() then
			refs.hidden:override(false)
		end
	end

	-- freestanding body freestand
	if body_freestand:get() then
		refs.body_freestanding:override(true)
	else
		refs.body_freestanding:override(false)
	end

	-- warmup anti aim
	if (chinchanchon.tweaks:get('Warchon AA') and entity.get_game_rules()["m_bWarmupPeriod"] == true) then
		refs.pitch:override("Disabled")
		refs.yaw_offset:override(math.random(-180, 180))
		refs.yaw_modifer:override("Disabled")
		refs.yaw_modifer_slider:override(0)
		refs.l_limit:override(math.random(0, 58))
        refs.r_limit:override(math.random(0, 58))
		refs.options:override({})
    end

	-- anti backstab
	if chinchanchon.tweaks:get('Avoid Chinstab') then
		refs.avoid_backstab:override(true)
	else
		refs.avoid_backstab:override(false)
	end

	-- static knife
	local lp = entity.get_local_player()
    if chinchanchon.tweaks:get('Static on Chan') then
        if anti_aim_states() == 6 then
            if lp:get_player_weapon(false):get_classname() == "CKnife" and chinchanchon.tweaks:get('Static on Chan') then
                refs.yaw_offset:override(0)
                refs.yaw_modifer:override("Disabled")
                refs.body_yaw:override(false) 
				refs.hidden:override(false)      
            end
        end
    end

	-- update anti-aims
	if entity.get_game_rules()["m_bFreezePeriod"] == true then
		return
	end
end
events.createmove_run:set(chinchanchon_aa_system)

--animation breakers
ffi.cdef[[
    typedef void*(__thiscall* get_client_entity_t)(void*, int);
    typedef struct {
        char  pad_0000[20];
        int m_nOrder; //0x0014
        int m_nSequence; //0x0018
        float m_flPrevCycle; //0x001C
        float m_flWeight; //0x0020
        float m_flWeightDeltaRate; //0x0024
        float m_flPlaybackRate; //0x0028
        float m_flCycle; //0x002C
        void *m_pOwner; //0x0030
        char  pad_0038[4]; //0x0034
    } animstate_layer_t;
]]

local uintptr_t = ffi.typeof("uintptr_t**")
local get_entity_address = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)")
local animslsg = nil
local animbreak = function(localplayer)
	localplayer = entity.get_local_player()
    if localplayer == nil then return end
    if not localplayer:is_alive() then return end
    if localplayer:get_index() == nil then return end
    animslsg = get_entity_address(localplayer:get_index())
    move = math.sqrt(localplayer.m_vecVelocity.x ^ 2 + localplayer.m_vecVelocity.y ^ 2) > 5
    jump = bit.band(localplayer.m_fFlags, 1) == 0
	if chinchanchon.legs:get() == "Follow Direction" and chinchanchon.anim_breakers:get() then
        localplayer.m_flPoseParameter[0] = 1
        refs.leg_movement:override("Sliding")
	end
	if chinchanchon.legs:get() == "Jitter" and chinchanchon.anim_breakers:get() then
        localplayer.m_flPoseParameter[0] = globals.tickcount %4 > 1 and chinchanchon.jitter_legs:get()/100 or 1
        refs.leg_movement:override("Sliding")
    end
	if chinchanchon.legs:get() == "MoonWalk" and chinchanchon.anim_breakers:get() then
        localplayer.m_flPoseParameter[7] = 1
        refs.leg_movement:override("Walking")
    end
	if chinchanchon.in_air:get() == "Static" and chinchanchon.anim_breakers:get() then
        localplayer.m_flPoseParameter[6] = 1
    end
	if chinchanchon.in_air:get() == "MoonWalk" and chinchanchon.anim_breakers:get() then
        if jump and move then
            ffi.cast('animstate_layer_t**', ffi.cast('uintptr_t', animslsg) + 0x2990)[0][6].m_flWeight = 1
        end
    end
	if chinchanchon.movelean:get() and chinchanchon.anim_breakers:get() then
        if move then
            ffi.cast('animstate_layer_t**', ffi.cast('uintptr_t', animslsg) + 0x2990)[0][12].m_flWeight = 1
        end
    end
end
events.post_update_clientside_animation:set(animbreak)

--{other features}--
-- fastladder
function fast_ladder(cmd)
	local lp = entity.get_local_player()
	if lp["m_MoveType"] == 9 then
		if cmd.sidemove == 0 then
			cmd.view_angles.y = cmd.view_angles.y + 45
		end
		if cmd.sidemove < 0 and cmd.in_forward then
			cmd.view_angles.y = cmd.view_angles.y + 90
		end
		if cmd.sidemove > 0 and cmd.in_back then
			cmd.view_angles.y = cmd.view_angles.y + 90
		end
		cmd.in_moveleft = cmd.in_back
		cmd.in_moveright = cmd.in_forward
		if cmd.view_angles.x < 0 then
			cmd.view_angles.x = -45  
		end
	end
end

events.createmove:set(function(cmd)
    local lp = entity.get_local_player()
    if not lp then return end
    if not lp:is_alive() then return end
    if visuals.fastladder:get() then
    	fast_ladder(cmd)
    end
end)