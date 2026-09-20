_G._chematic_ready = false;
local panorama_api = nil;
do
	local ok, result = pcall(function()
		if (panorama and panorama.open) then
			return panorama.open();
		end
		return nil;
	end);
	panorama_api = (ok and result) or nil;
end
local function get_user_name()
	if (panorama_api and panorama_api.MyPersonaAPI and panorama_api.MyPersonaAPI.GetName) then
		local ok, persona = pcall(panorama_api.MyPersonaAPI.GetName);
		if (ok and (type(persona) == "string") and (persona ~= "")) then
			return persona;
		end
	end
	local lp = (entity.get_local_player and entity.get_local_player()) or nil;
	if (lp and (lp ~= 0) and entity.get_player_name) then
		local n = entity.get_player_name(lp);
		if ((type(n) == "string") and (n ~= "")) then
			return n;
		end
	end
	return "Player";
end
do
	local start_time = globals.realtime();
	local duration = 6;
	local finished = false;
	local rain = {};
	local initialized = false;
	local function init(w, h)
		rain = {};
		for i = 1, 100 do
			table.insert(rain, {x=math.random(0, w),y=math.random(-h, h),speed=math.random(180, 320),len=math.random(8, 18),alpha=math.random(25, 90)});
		end
	end
	local function ease(t)
		return t * t * (3 - (2 * t));
	end
	local function draw()
		if finished then
			return;
		end
		local w, h = client.screen_size();
		local cx, cy = w / 2, h / 2;
		local dt = globals.frametime();
		local time = globals.realtime() - start_time;
		local t = math.min(time / duration, 1);
		if not initialized then
			init(w, h);
			initialized = true;
		end
		if (t >= 1) then
			finished = true;
			_G._chematic_ready = true;
			client.unset_event_callback("paint", draw);
			client.unset_event_callback("paint_ui", draw);
			return;
		end
		local fade = 255;
		if (time < 1) then
			fade = math.floor(255 * time);
		elseif (time > (duration - 1)) then
			fade = math.floor(255 * (duration - time));
		end
		fade = math.max(0, math.min(255, fade));
		local fa = fade / 255;
		renderer.rectangle(0, 0, w, h, 0, 0, 0, 255);
		local haze_h = math.floor(h * 0.22);
		renderer.gradient(0, h - haze_h, w, haze_h, 0, 0, 0, 0, 120, 10, 10, math.floor(90 * fa), false);
		for _, r in ipairs(rain) do
			r.y = r.y + (r.speed * dt);
			if (r.y > (h + r.len)) then
				r.y = -r.len;
				r.x = math.random(0, w);
			end
			renderer.line(r.x, r.y, r.x, r.y + r.len, 210, 35, 35, math.floor(r.alpha * fa));
		end
		local progress = ease(t);
		local pulse_logo = math.floor((195 + (math.sin(globals.realtime() * 2) * 38)) * fa);
		local user = get_user_name();
		renderer.text(cx, cy - 64, 210, 200, 205, math.floor(130 * fa), "c", 0, "Welcome back " .. user);
		renderer.text(cx, cy - 48, 170, 165, 170, math.floor(120 * fa), "c", 0, "Thank you for using");
		for i = 1, 4 do
			renderer.text(cx, (cy - 30) + i, 60, 10, 10, math.floor(18 * (5 - i) * fa), "c+", 0, "$chematic");
		end
		renderer.text(cx, cy - 30, 255, 90, 90, pulse_logo, "c+", 0, "$chematic");
		renderer.text(cx, cy + 2, 210, 200, 225, math.floor(118 * fa), "c", 0, "CRACK \xc2\xb7 v4.2");
		local lw = math.floor(w * 0.14);
		renderer.gradient(cx - lw, cy + 18, lw, 1, 120, 10, 10, 0, 255, 90, 90, math.floor((145 * fade) / 255), false);
		renderer.gradient(cx, cy + 18, lw, 1, 255, 90, 90, math.floor((145 * fade) / 255), 120, 10, 10, 0, false);
		local bar_reveal = math.max(0, math.min(1, (time - 0.8) / 0.8));
		local bw = math.floor(w * 0.22);
		local bx = cx - (bw / 2);
		local by_ = cy + 38;
		local fill = math.floor(bw * progress);
		local br = bar_reveal * fa;
		renderer.rectangle(bx, by_, bw, 2, 20, 20, 20, math.floor(55 * bar_reveal * fa));
		if (fill > 0) then
			renderer.gradient(bx, by_, fill, 2, 120, 10, 10, math.floor(220 * br), 255, 90, 90, math.floor(255 * br), false);
		end
		renderer.text(cx, by_ + 16, 190, 175, 215, math.floor(88 * bar_reveal * fa), "c", 0, string.format("%d%%", math.floor(progress * 100)));
	end
	client.set_event_callback("paint", draw);
	client.set_event_callback("paint_ui", draw);
end
local function try_require(mod, msg)
	local ok, result = pcall(require, mod);
	if ok then
		return result;
	end
	error(msg or ("failed to require: " .. mod), 2);
end
local X, Y = 100, 100;
local W, H = 700, 560;
local TITLE_BAR_H = 46;
local SIDEBAR_W = 152;
local RIGHT_PANEL_W = 132;
local IS_DRAGGING = false;
local DRAG_X, DRAG_Y = 0, 0;
local ACTIVE_TAB = "RESOLVER";
local SESSION_START = globals.realtime();
local DB_KEY = "$chematic_CRACK::usage";
local HAS_DB = (type(database) == "table") and (type(database.read) == "function") and (type(database.write) == "function");
local TOTAL_BASE_SECONDS = 0;
local LAST_TOTAL_WRITE_RT = globals.realtime();
do
	if HAS_DB then
		local ok, data = pcall(database.read, DB_KEY);
		if (ok and (type(data) == "table") and (type(data.total_seconds) == "number")) then
			TOTAL_BASE_SECONDS = math.max(0, math.floor(data.total_seconds));
		end
	end
end
local OPTIONS = {menu_opacity=100,color_mode="CRACK",theme_r=200,theme_g=20,theme_b=20,high_r=255,high_g=60,high_b=60,slider_r=200,slider_g=20,slider_b=20,enable_master=true,enable_resolver=true,resolver_mode="Safe",bruteforce_mode=true,multi_target=true,defensive_res=false,resolver_conditions={"Stand","Move","Walk","Crouch","Crouch+Move","Air","Air+Crouch"},brute_misses=2,brute_stages=5,defensive_thresh=5,pred_scale_resolver=85,baim_override=true,damage_threshold=72,prediction_enabled=true,prediction_mode="Dynamic",prediction_accuracy=75,prediction_reaction=50,prediction_learning=75,prediction_indicator=true,prediction_indicator_style="Standard",prediction_hotkey=true,show_angles_debug=false,hitmarker_enabled=true,debug_panel_style="CRACK",debug_include_target_info=false,debug_panel_enabled=false,debug_panel_modes={},trashtalk_enabled=false,trashtalk_mode="Normal",trashtalk_special=false,trashtalk_auto_gg=false,trashtalk_delay=3,clantag_enabled=false,config_preset="Custom"};
_G._SCHEMATIC_OPTIONS = OPTIONS;
local function sync_schematic_options()
	OPTIONS.enable_resolver = OPTIONS.enable_master;
	local rf = {};
	if OPTIONS.bruteforce_mode then
		table.insert(rf, "Smart Bruteforce");
	end
	if OPTIONS.multi_target then
		table.insert(rf, "Dynamic Angles");
	end
	if OPTIONS.defensive_res then
		table.insert(rf, "Defensive Prediction");
	end
	table.insert(rf, "Break LC Detection");
	OPTIONS.resolver_features = rf;
	OPTIONS.debug_panel_enabled = OPTIONS.show_angles_debug;
	OPTIONS.debug_panel_modes = {};
	if OPTIONS.show_angles_debug then
		table.insert(OPTIONS.debug_panel_modes, "Angles");
	end
	if OPTIONS.debug_include_target_info then
		table.insert(OPTIONS.debug_panel_modes, "Target Info");
	end
end
local function in_bounds(mx, my, x, y, w, h)
	return (mx >= x) and (mx <= (x + w)) and (my >= y) and (my <= (y + h));
end
local MOUSE_DOWN = false;
local PREV_MOUSE_DOWN = false;
local function a_mul(a)
	local pct = math.max(10, OPTIONS.menu_opacity) / 100;
	return math.floor(a * pct);
end
local function draw_rect_outline(x, y, w, h, r, g, b, a)
	renderer.rectangle(x, y, w, 1, r, g, b, a_mul(a));
	renderer.rectangle(x, (y + h) - 1, w, 1, r, g, b, a_mul(a));
	renderer.rectangle(x, y + 1, 1, h - 2, r, g, b, a_mul(a));
	renderer.rectangle((x + w) - 1, y + 1, 1, h - 2, r, g, b, a_mul(a));
end
local function format_hms(seconds)
	seconds = math.max(0, math.floor(tonumber(seconds) or 0));
	local h = math.floor(seconds / 3600);
	local m = math.floor((seconds % 3600) / 60);
	local s = seconds % 60;
	return string.format("%02d:%02d:%02d", h, m, s);
end
client.set_event_callback("paint_ui", function()
	if not _G._chematic_ready then
		return;
	end
	if not ui.is_menu_open() then
		return;
	end
	sync_schematic_options();
	local mx, my = ui.mouse_position();
	local m_down = client.key_state(1);
	local CLICKED = m_down and not PREV_MOUSE_DOWN;
	local THEMES = {CRACK={theme={200,20,20},high={255,60,60},slider={200,20,20},ui={bg={10,9,14},bg_deep={6,5,9},surface={17,15,22},surface_2={26,23,32},border={48,44,58},divider={32,29,40},text={228,226,232},muted={132,128,142}}},old={theme={130,80,210},high={200,170,255},slider={130,80,210},ui={bg={8,8,11},bg_deep={5,5,7},surface={15,15,18},surface_2={22,22,28},border={50,50,58},divider={34,34,40},text={228,226,232},muted={132,128,142}}}};
	local mode = OPTIONS.color_mode;
	if not THEMES[mode] then
		mode = "CRACK";
		OPTIONS.color_mode = mode;
	end
	do
		local t = THEMES[mode];
		OPTIONS.theme_r, OPTIONS.theme_g, OPTIONS.theme_b = t.theme[1], t.theme[2], t.theme[3];
		OPTIONS.high_r, OPTIONS.high_g, OPTIONS.high_b = t.high[1], t.high[2], t.high[3];
		OPTIONS.slider_r, OPTIONS.slider_g, OPTIONS.slider_b = t.slider[1], t.slider[2], t.slider[3];
	end
	local session_seconds = globals.realtime() - SESSION_START;
	local total_seconds = TOTAL_BASE_SECONDS + math.max(0, session_seconds);
	if HAS_DB then
		local now_rt = globals.realtime();
		if ((now_rt - LAST_TOTAL_WRITE_RT) >= 2) then
			LAST_TOTAL_WRITE_RT = now_rt;
			pcall(database.write, DB_KEY, {total_seconds=math.floor(total_seconds)});
		end
	end
	local tr = OPTIONS.theme_r;
	local tg = OPTIONS.theme_g;
	local tb = OPTIONS.theme_b;
	local hr = OPTIONS.high_r;
	local hg = OPTIONS.high_g;
	local hb = OPTIONS.high_b;
	local sr = OPTIONS.slider_r;
	local sg = OPTIONS.slider_g;
	local sb = OPTIONS.slider_b;
	local UI = THEMES[mode].ui;
	local dsys = rawget(_G, "debug_system");
	local dbgWin = dsys and dsys.window;
	local dbg_w = (dbgWin and dbgWin.width) or 300;
	local on_debug_header = OPTIONS.show_angles_debug and dbgWin and in_bounds(mx, my, dbgWin.x, dbgWin.y, dbg_w, 30);
	if m_down then
		if (on_debug_header and dbgWin) then
			if not dbgWin.drag.active then
				dbgWin.drag.active = true;
				dbgWin.drag.x = mx - dbgWin.x;
				dbgWin.drag.y = my - dbgWin.y;
			end
		elseif (in_bounds(mx, my, X, Y, W, TITLE_BAR_H) and not IS_DRAGGING) then
			IS_DRAGGING = true;
			DRAG_X, DRAG_Y = mx - X, my - Y;
		end
	else
		if dbgWin then
			dbgWin.drag.active = false;
		end
		IS_DRAGGING = false;
	end
	if (dbgWin and dbgWin.drag.active) then
		dbgWin.x = mx - dbgWin.drag.x;
		dbgWin.y = my - dbgWin.drag.y;
	elseif IS_DRAGGING then
		X, Y = mx - DRAG_X, my - DRAG_Y;
	end
	local bg_deep = UI.bg_deep or UI.bg;
	renderer.rectangle(X - 2, Y - 2, W + 4, H + 4, tr, tg, tb, a_mul(22));
	renderer.rectangle(X, Y, W, H, UI.bg[1], UI.bg[2], UI.bg[3], a_mul(255));
	renderer.gradient(X, Y, W, math.floor(H * 0.45), tr, tg, tb, a_mul(14), UI.bg[1], UI.bg[2], UI.bg[3], 0, false);
	renderer.gradient(X, Y + math.floor(H * 0.55), W, math.floor(H * 0.45) + 1, UI.bg[1], UI.bg[2], UI.bg[3], 0, bg_deep[1], bg_deep[2], bg_deep[3], a_mul(55), false);
	draw_rect_outline(X - 1, Y - 1, W + 2, H + 2, UI.border[1], UI.border[2], UI.border[3], 255);
	renderer.rectangle(X, Y, W, 1, hr, hg, hb, a_mul(90));
	renderer.gradient(X, Y, W, TITLE_BAR_H, tr, tg, tb, a_mul(18), UI.surface[1], UI.surface[2], UI.surface[3], a_mul(120), false);
	renderer.rectangle(X, (Y + TITLE_BAR_H) - 1, W, 1, UI.divider[1], UI.divider[2], UI.divider[3], a_mul(255));
	renderer.text(X + 11, Y + 9, UI.text[1], UI.text[2], UI.text[3], a_mul(255), "b", 0, "$CHEMATIC CRACK made by Rinnegan x Hakkai");
	renderer.text((X + W) - 12, Y + 11, UI.muted[1], UI.muted[2], UI.muted[3], a_mul(200), "r", 0, "drag header to move");
	local side_top = Y + TITLE_BAR_H;
	local side_h = H - TITLE_BAR_H;
	renderer.rectangle(X, side_top, SIDEBAR_W, side_h, UI.surface[1], UI.surface[2], UI.surface[3], a_mul(255));
	renderer.gradient(X, side_top, 3, side_h, hr, hg, hb, a_mul(70), hr, hg, hb, 0, false);
	renderer.rectangle(X + SIDEBAR_W, side_top, 1, side_h, UI.divider[1], UI.divider[2], UI.divider[3], a_mul(255));
	local bb_y = side_top + 10;
	renderer.rectangle(X + 10, bb_y, SIDEBAR_W - 20, 52, UI.surface_2[1], UI.surface_2[2], UI.surface_2[3], a_mul(160));
	draw_rect_outline(X + 9, bb_y - 1, SIDEBAR_W - 18, 54, UI.border[1], UI.border[2], UI.border[3], 180);
	renderer.gradient(X + 10, bb_y, SIDEBAR_W - 20, 52, tr, tg, tb, a_mul(24), UI.surface_2[1], UI.surface_2[2], UI.surface_2[3], 0, false);
	renderer.text(X + 18, bb_y + 8, 0, 0, 0, a_mul(45), "b", 0, "$chematic");
	renderer.text(X + 17, bb_y + 7, hr, hg, hb, a_mul(255), "b", 0, "$chematic");
	renderer.text(X + 18, bb_y + 24, UI.text[1], UI.text[2], UI.text[3], a_mul(255), "b", 0, "CRACK");
	renderer.text(X + 18, bb_y + 40, UI.muted[1], UI.muted[2], UI.muted[3], a_mul(220), "", 0, "v4.2 · stable");
	local tab_start_y = bb_y + 62;
	local tabs = {"DASHBOARD","RESOLVER","VISUALS","SETTINGS"};
	local tab_y = tab_start_y;
	for _, t in next, tabs do
		local hover = in_bounds(mx, my, X, tab_y, SIDEBAR_W, 32);
		if (CLICKED and hover) then
			ACTIVE_TAB = t;
		end
		if (ACTIVE_TAB == t) then
			renderer.rectangle(X + 6, tab_y, SIDEBAR_W - 6, 32, tr, tg, tb, a_mul(35));
			renderer.gradient(X + 6, tab_y, SIDEBAR_W - 6, 32, hr, hg, hb, a_mul(20), tr, tg, tb, 0, false);
			renderer.rectangle(X + 6, tab_y, 3, 32, hr, hg, hb, a_mul(255));
			renderer.text(X + 18, tab_y + 9, UI.text[1], UI.text[2], UI.text[3], a_mul(255), "b", 0, t);
		else
			if hover then
				renderer.rectangle(X + 6, tab_y, SIDEBAR_W - 6, 32, UI.surface_2[1], UI.surface_2[2], UI.surface_2[3], a_mul(90));
			end
			renderer.text(X + 18, tab_y + 9, UI.muted[1], UI.muted[2], UI.muted[3], a_mul((hover and 255) or 185), "b", 0, t);
		end
		tab_y = tab_y + 34;
	end
	local cx = X + SIDEBAR_W + 1;
	local cy = Y + TITLE_BAR_H;
	local cw = ((W - SIDEBAR_W) - 1) - RIGHT_PANEL_W;
	local content_top = cy + 10;
	local content_bottom = (Y + H) - 14;
	local content_h = H - TITLE_BAR_H;
	local function row_visible(item_y, row_h)
		return ((item_y + row_h) >= content_top) and (item_y <= content_bottom);
	end
	renderer.rectangle(cx, cy, cw, content_h, UI.bg[1], UI.bg[2], UI.bg[3], a_mul(230));
	renderer.gradient(cx, cy, cw, math.floor(content_h * 0.42), tr, tg, tb, a_mul(12), UI.bg[1], UI.bg[2], UI.bg[3], 0, false);
	renderer.rectangle(cx + 12, cy + 10, cw - 24, content_h - 20, UI.surface[1], UI.surface[2], UI.surface[3], a_mul(120));
	draw_rect_outline(cx + 11, cy + 9, cw - 22, content_h - 18, UI.border[1], UI.border[2], UI.border[3], 180);
	local function draw_section_title(ty, label, sub)
		renderer.rectangle(cx + 20, ty + 2, 3, 14, hr, hg, hb, a_mul(255));
		renderer.gradient(cx + 25, ty + 16, cw - 52, 1, hr, hg, hb, a_mul(75), UI.divider[1], UI.divider[2], UI.divider[3], a_mul(0), false);
		renderer.text(cx + 31, ty + 1, 0, 0, 0, a_mul(60), "b", 0, label);
		renderer.text(cx + 30, ty, UI.text[1], UI.text[2], UI.text[3], a_mul(255), "b", 0, label);
		if sub then
			renderer.text(cx + 30, ty + 14, UI.muted[1], UI.muted[2], UI.muted[3], a_mul(210), "", 0, sub);
			return ty + 32;
		end
		return ty + 22;
	end
	local function draw_slider(item_y, name, opt_key, min, max)
		if not row_visible(item_y, 42) then
			return item_y + 22;
		end
		local t_val = math.floor(OPTIONS[opt_key]);
		local row_r = (cx + cw) - 24;
		renderer.text(cx + 20, item_y, UI.muted[1], UI.muted[2], UI.muted[3], a_mul(255), "", 0, name);
		renderer.text(row_r, item_y, hr, hg, hb, a_mul(255), "r", 0, tostring(t_val));
		item_y = item_y + 18;
		local sx, sy, sw = cx + 20, item_y + 2, cw - 40;
		local track_h = 6;
		renderer.rectangle(sx, sy - 1, sw, track_h + 2, 0, 0, 0, a_mul(30));
		renderer.rectangle(sx, sy, sw, track_h, UI.surface_2[1], UI.surface_2[2], UI.surface_2[3], a_mul(255));
		renderer.rectangle(sx, sy, sw, 1, 0, 0, 0, a_mul(40));
		if (m_down and row_visible(item_y, 20) and in_bounds(mx, my, sx - 6, sy - 6, sw + 12, track_h + 12)) then
			local pct = math.max(0, math.min(1, (mx - sx) / sw));
			OPTIONS[opt_key] = min + ((max - min) * pct);
		end
		local fill_pct = (OPTIONS[opt_key] - min) / (max - min);
		local fw = math.max(0, math.floor(sw * fill_pct));
		if (fw > 0) then
			renderer.gradient(sx, sy, fw, track_h, math.min(255, sr + 25), math.min(255, sg + 25), math.min(255, sb + 25), a_mul(255), sr, sg, sb, a_mul(255), false);
			renderer.rectangle(sx, sy, fw, 1, 255, 255, 255, a_mul(28));
		end
		local knob_x = sx + fw;
		local kx = math.floor(math.max(sx + 3, math.min((sx + sw) - 3, knob_x)));
		local ky = math.floor(sy + (track_h / 2));
		renderer.circle(kx, ky, 0, 0, 0, a_mul(80), 7, 0, 1);
		renderer.circle(kx, ky, hr, hg, hb, a_mul(240), 5, 0, 1);
		renderer.circle(kx, ky, 255, 255, 255, a_mul(105), 2, 0, 1);
		return item_y + 22;
	end
	local function draw_checkbox(item_y, name, opt_key)
		if not row_visible(item_y, 22) then
			return item_y + 28;
		end
		local hover = in_bounds(mx, my, cx + 20, item_y, cw - 40, 22);
		if (CLICKED and hover) then
			OPTIONS[opt_key] = not OPTIONS[opt_key];
		end
		local val = OPTIONS[opt_key];
		local bx, by, bz, dr, dg, db;
		if val then
			bx, by, bz = tr, tg, tb;
			dr, dg, db = hr, hg, hb;
		else
			bx, by, bz = UI.surface_2[1], UI.surface_2[2], UI.surface_2[3];
			dr, dg, db = UI.border[1], UI.border[2], UI.border[3];
		end
		if (hover and not val) then
			renderer.rectangle(cx + 18, item_y + 2, cw - 36, 20, UI.surface_2[1], UI.surface_2[2], UI.surface_2[3], a_mul(45));
			renderer.rectangle(cx + 19, item_y + 3, 16, 16, UI.surface_2[1], UI.surface_2[2], UI.surface_2[3], a_mul(120));
		end
		renderer.rectangle(cx + 20, item_y + 4, 14, 14, bx, by, bz, a_mul((val and 255) or 200));
		if val then
			renderer.gradient(cx + 20, item_y + 4, 14, 14, hr, hg, hb, a_mul(40), tr, tg, tb, a_mul(200), false);
		end
		draw_rect_outline(cx + 19, item_y + 3, 16, 16, dr, dg, db, 255);
		if val then
			renderer.text(cx + 22, item_y + 5, 255, 255, 255, a_mul(255), "b", 0, "\226\156\147");
		end
		renderer.text(cx + 42, item_y + 5, (hover and UI.text[1]) or UI.muted[1], (hover and UI.text[2]) or UI.muted[2], (hover and UI.text[3]) or UI.muted[3], a_mul(255), "", 0, name);
		return item_y + 28;
	end
	local function draw_mode_button(item_y)
		if not row_visible(item_y, 28) then
			return item_y + 36;
		end
		local bx, by, bw, bh = cx + 20, item_y, math.max(140, cw - 40), 26;
		local hover = in_bounds(mx, my, bx, by, bw, bh);
		if (CLICKED and hover) then
			OPTIONS.color_mode = ((OPTIONS.color_mode == "CRACK") and "old") or "CRACK";
		end
		renderer.rectangle(bx, by, bw, bh, UI.surface[1], UI.surface[2], UI.surface[3], a_mul(255));
		if hover then
			renderer.gradient(bx, by, bw, bh, hr, hg, hb, a_mul(25), UI.surface[1], UI.surface[2], UI.surface[3], a_mul(255), false);
		end
		draw_rect_outline(bx - 1, by - 1, bw + 2, bh + 2, (hover and hr) or UI.border[1], (hover and hg) or UI.border[2], (hover and hb) or UI.border[3], 255);
		renderer.text(bx + 10, by + 7, UI.muted[1], UI.muted[2], UI.muted[3], a_mul(255), "", 0, "Color mode");
		renderer.text((bx + bw) - 10, by + 7, hr, hg, hb, a_mul(255), "r", 0, OPTIONS.color_mode);
		return item_y + 36;
	end
	local DEBUG_STYLE_ORDER = {"Old","CRACK","Black & White"};
	local function draw_debug_style_button(item_y)
		if not row_visible(item_y, 28) then
			return item_y + 36;
		end
		local bx, by, bw, bh = cx + 20, item_y, math.max(140, cw - 40), 26;
		local hover = in_bounds(mx, my, bx, by, bw, bh);
		if (CLICKED and hover) then
			local cur = OPTIONS.debug_panel_style;
			local idx = 1;
			for i, n in ipairs(DEBUG_STYLE_ORDER) do
				if (n == cur) then
					idx = i;
					break;
				end
			end
			idx = (idx % #DEBUG_STYLE_ORDER) + 1;
			OPTIONS.debug_panel_style = DEBUG_STYLE_ORDER[idx];
		end
		renderer.rectangle(bx, by, bw, bh, UI.surface[1], UI.surface[2], UI.surface[3], a_mul(255));
		if hover then
			renderer.gradient(bx, by, bw, bh, hr, hg, hb, a_mul(25), UI.surface[1], UI.surface[2], UI.surface[3], a_mul(255), false);
		end
		draw_rect_outline(bx - 1, by - 1, bw + 2, bh + 2, (hover and hr) or UI.border[1], (hover and hg) or UI.border[2], (hover and hb) or UI.border[3], 255);
		renderer.text(bx + 10, by + 7, UI.muted[1], UI.muted[2], UI.muted[3], a_mul(255), "", 0, "Debug panel style");
		renderer.text((bx + bw) - 10, by + 7, hr, hg, hb, a_mul(255), "r", 0, OPTIONS.debug_panel_style);
		return item_y + 36;
	end
	local RESOLVER_MODE_ORDER = {"Safe","Optimal","Aggressive","Maximum","Dynamic","Adaptive"};
	local PRED_MODE_ORDER = {"Dynamic","Aggressive","Adaptive","Maximum"};
	local IND_STYLE_ORDER = {"Standard","Minimal","Advanced"};
	local TLK_MODE_ORDER = {"Normal","Funny","Aggressive","Rebron","Taunting","Sarcastic","Random Mix"};
	local CFG_PRESET_ORDER = {"1v1","2v2","3v3","Community","Custom"};
	local function draw_cycle_row(item_y, title, opt_key, order_list)
		if not row_visible(item_y, 28) then
			return item_y + 36;
		end
		local bx, by, bw, bh = cx + 20, item_y, math.max(140, cw - 40), 26;
		local hover = in_bounds(mx, my, bx, by, bw, bh);
		if (CLICKED and hover) then
			local cur = tostring(OPTIONS[opt_key] or order_list[1]);
			local idx = 1;
			for i, n in ipairs(order_list) do
				if (n == cur) then
					idx = i;
					break;
				end
			end
			idx = (idx % #order_list) + 1;
			OPTIONS[opt_key] = order_list[idx];
		end
		renderer.rectangle(bx, by, bw, bh, UI.surface[1], UI.surface[2], UI.surface[3], a_mul(255));
		if hover then
			renderer.gradient(bx, by, bw, bh, hr, hg, hb, a_mul(25), UI.surface[1], UI.surface[2], UI.surface[3], a_mul(255), false);
		end
		draw_rect_outline(bx - 1, by - 1, bw + 2, bh + 2, (hover and hr) or UI.border[1], (hover and hg) or UI.border[2], (hover and hb) or UI.border[3], 255);
		renderer.text(bx + 10, by + 7, UI.muted[1], UI.muted[2], UI.muted[3], a_mul(255), "", 0, title);
		renderer.text((bx + bw) - 10, by + 7, hr, hg, hb, a_mul(255), "r", 0, tostring(OPTIONS[opt_key] or ""));
		return item_y + 36;
	end
	local function draw_action_row(item_y, title, fn)
		if not row_visible(item_y, 30) then
			return item_y + 38;
		end
		local bx, by, bw, bh = cx + 20, item_y, cw - 40, 28;
		local hover = in_bounds(mx, my, bx, by, bw, bh);
		if (CLICKED and hover) then
			pcall(fn);
		end
		renderer.rectangle(bx, by, bw, bh, UI.surface[1], UI.surface[2], UI.surface[3], a_mul(255));
		if hover then
			renderer.gradient(bx, by, bw, bh, hr, hg, hb, a_mul(35), UI.surface[1], UI.surface[2], UI.surface[3], a_mul(255), false);
		end
		draw_rect_outline(bx - 1, by - 1, bw + 2, bh + 2, (hover and hr) or UI.border[1], (hover and hg) or UI.border[2], (hover and hb) or UI.border[3], 255);
		renderer.text(bx + (bw / 2), by + 8, UI.text[1], UI.text[2], UI.text[3], a_mul(255), "c", 0, title);
		renderer.rectangle(bx + 8, (by + bh) - 3, bw - 16, 1, hr, hg, hb, a_mul((hover and 130) or 55));
		return item_y + 38;
	end
	local function apply_selected_preset()
		local r = rawget(_G, "resolver");
		if (r and r.config_system and r.config_system.apply_config) then
			r.config_system:apply_config(OPTIONS.config_preset or "Custom");
		end
	end
	local function save_custom_preset()
		local r = rawget(_G, "resolver");
		if (r and r.config_system and r.config_system.save_custom_config) then
			r.config_system:save_custom_config();
			OPTIONS.config_preset = "Custom";
		end
	end
	if (ACTIVE_TAB == "DASHBOARD") then
		local head_y = draw_section_title(cy + 16, "Dashboard", "Session overview & usage");
		local card_x, card_y = cx + 20, head_y + 10;
		local card_w, card_h = cw - 40, 138;
		renderer.rectangle(card_x, card_y, card_w, card_h, UI.surface[1], UI.surface[2], UI.surface[3], a_mul(255));
		draw_rect_outline(card_x - 1, card_y - 1, card_w + 2, card_h + 2, UI.border[1], UI.border[2], UI.border[3], 255);
		renderer.rectangle(card_x, card_y, 4, card_h, hr, hg, hb, a_mul(200));
		renderer.gradient(card_x, card_y, card_w, card_h, tr, tg, tb, a_mul(20), UI.surface[1], UI.surface[2], UI.surface[3], 0, false);
		renderer.rectangle(card_x + 10, card_y + 8, card_w - 20, 1, 255, 255, 255, a_mul(18));
		local user = get_user_name();
		local played = format_hms(globals.realtime() - SESSION_START);
		local total_played = format_hms(total_seconds);
		renderer.text(card_x + 18, card_y + 18, hr, hg, hb, a_mul(255), "b", 0, "Welcome back");
		renderer.text(card_x + 18, card_y + 38, UI.text[1], UI.text[2], UI.text[3], a_mul(255), "", 0, user);
		renderer.rectangle(card_x + 18, card_y + 64, card_w - 36, 1, UI.divider[1], UI.divider[2], UI.divider[3], a_mul(255));
		renderer.text(card_x + 18, card_y + 76, UI.muted[1], UI.muted[2], UI.muted[3], a_mul(255), "", 0, "Session play time");
		renderer.text((card_x + card_w) - 18, card_y + 76, hr, hg, hb, a_mul(255), "r", 0, played);
		renderer.text(card_x + 18, card_y + 98, UI.muted[1], UI.muted[2], UI.muted[3], a_mul(255), "", 0, "Total time on CRACK");
		renderer.text((card_x + card_w) - 18, card_y + 98, hr, hg, hb, a_mul(255), "r", 0, total_played);
	end
	if (ACTIVE_TAB == "RESOLVER") then
		local item_y = draw_section_title(cy + 16, "Resolver", "Anti-aim compensation & resolver features");
		item_y = item_y + 6;
		item_y = draw_checkbox(item_y, "Enable Master Logic", "enable_master");
		item_y = draw_checkbox(item_y, "Bruteforce Mode", "bruteforce_mode");
		item_y = draw_checkbox(item_y, "Multi-Target Prediction", "multi_target");
		item_y = draw_checkbox(item_y, "Defensive Resolver", "defensive_res");
		item_y = item_y + 8;
		item_y = draw_cycle_row(item_y, "Resolver mode", "resolver_mode", RESOLVER_MODE_ORDER);
		item_y = draw_slider(item_y, "Bruteforce misses (instant)", "brute_misses", 1, 6);
		item_y = draw_slider(item_y, "Bruteforce stages", "brute_stages", 1, 10);
		item_y = draw_slider(item_y, "Defensive threshold", "defensive_thresh", 1, 15);
		item_y = draw_slider(item_y, "Adapt / pred scale", "pred_scale_resolver", 50, 100);
		item_y = item_y + 10;
		renderer.rectangle(cx + 20, item_y, cw - 40, 1, UI.divider[1], UI.divider[2], UI.divider[3], a_mul(255));
		item_y = item_y + 10;
		item_y = item_y + 10;
		renderer.rectangle(cx + 20, item_y, cw - 40, 1, UI.divider[1], UI.divider[2], UI.divider[3], a_mul(255));
		item_y = item_y + 10;
		item_y = draw_checkbox(item_y, "BAIM Override", "baim_override");
		item_y = draw_slider(item_y, "Damage Threshold", "damage_threshold", 0, 100);
	end
	if (ACTIVE_TAB == "VISUALS") then
		local item_y = draw_section_title(cy + 16, "Visuals", "Debug, HUD, indicators, hitmarker");
		item_y = item_y + 8;
		item_y = draw_checkbox(item_y, "Angles debug panel", "show_angles_debug");
		item_y = draw_checkbox(item_y, "Target info section (debug)", "debug_include_target_info");
		item_y = draw_checkbox(item_y, "Damage hitmarker", "hitmarker_enabled");
		item_y = draw_debug_style_button(item_y);
		item_y = item_y + 8;
		renderer.rectangle(cx + 20, item_y, cw - 40, 1, UI.divider[1], UI.divider[2], UI.divider[3], a_mul(255));
		item_y = item_y + 10;
		item_y = draw_checkbox(item_y, "Prediction system", "prediction_enabled");
		item_y = draw_checkbox(item_y, "Prediction on-screen indicator", "prediction_indicator");
		item_y = draw_checkbox(item_y, "Prediction hotkey active", "prediction_hotkey");
		item_y = draw_cycle_row(item_y, "Prediction mode", "prediction_mode", PRED_MODE_ORDER);
		item_y = draw_cycle_row(item_y, "Prediction indicator style", "prediction_indicator_style", IND_STYLE_ORDER);
		item_y = draw_slider(item_y, "Prediction accuracy", "prediction_accuracy", 50, 100);
		item_y = draw_slider(item_y, "Prediction reaction", "prediction_reaction", 10, 100);
		item_y = draw_slider(item_y, "Prediction learning", "prediction_learning", 10, 100);
	end
	if (ACTIVE_TAB == "SETTINGS") then
		local item_y = draw_section_title(cy + 16, "Settings", "Theme, configs, trashtalk, clantag");
		item_y = item_y + 8;
		item_y = draw_mode_button(item_y);
		item_y = draw_slider(item_y, "Menu opacity %", "menu_opacity", 10, 100);
		item_y = item_y + 14;
		renderer.rectangle(cx + 20, item_y, cw - 40, 1, UI.divider[1], UI.divider[2], UI.divider[3], a_mul(255));
		item_y = item_y + 12;
		item_y = draw_cycle_row(item_y, "Config preset", "config_preset", CFG_PRESET_ORDER);
		item_y = draw_action_row(item_y, "Apply selected preset", apply_selected_preset);
		item_y = draw_action_row(item_y, "Save current as Custom", save_custom_preset);
		item_y = item_y + 10;
		renderer.rectangle(cx + 20, item_y, cw - 40, 1, UI.divider[1], UI.divider[2], UI.divider[3], a_mul(255));
		item_y = item_y + 12;
		item_y = draw_checkbox(item_y, "Trashtalk on kill", "trashtalk_enabled");
		item_y = draw_cycle_row(item_y, "Trashtalk style", "trashtalk_mode", TLK_MODE_ORDER);
		item_y = draw_checkbox(item_y, "Use special lines (HS / knife / wall)", "trashtalk_special");
		item_y = draw_checkbox(item_y, "Auto GG on round end", "trashtalk_auto_gg");
		item_y = draw_slider(item_y, "Trashtalk delay (s)", "trashtalk_delay", 1, 10);
		item_y = item_y + 8;
		item_y = draw_checkbox(item_y, "Animated clantag", "clantag_enabled");
	end
	local rx = (X + W) - RIGHT_PANEL_W;
	local r_mid = rx + math.floor(RIGHT_PANEL_W / 2);
	renderer.rectangle(rx, side_top, 1, side_h, UI.divider[1], UI.divider[2], UI.divider[3], a_mul(255));
	renderer.gradient(rx, side_top, RIGHT_PANEL_W, side_h, tr, tg, tb, a_mul(6), UI.surface[1], UI.surface[2], UI.surface[3], 0, false);
	if (ACTIVE_TAB == "SETTINGS") then
		renderer.text(r_mid, side_top + 18, UI.muted[1], UI.muted[2], UI.muted[3], a_mul(255), "c", 0, "THEME PREVIEW");
		local p_x, p_y = rx + 16, side_top + 52;
		local p_w, p_h = 100, 80;
		renderer.rectangle(p_x, p_y, p_w, p_h, UI.bg[1], UI.bg[2], UI.bg[3], a_mul(255));
		draw_rect_outline(p_x - 1, p_y - 1, p_w + 2, p_h + 2, UI.border[1], UI.border[2], UI.border[3], a_mul(255));
		renderer.gradient(p_x, p_y, p_w, p_h, tr, tg, tb, a_mul(28), UI.bg[1], UI.bg[2], UI.bg[3], 0, false);
		renderer.rectangle(p_x, p_y, 30, p_h, UI.surface[1], UI.surface[2], UI.surface[3], a_mul(255));
		renderer.rectangle(p_x + 30, p_y, 1, p_h, UI.divider[1], UI.divider[2], UI.divider[3], a_mul(255));
		renderer.text(p_x + 6, p_y + 5, hr, hg, hb, a_mul(255), "b", 0, "$");
		renderer.rectangle(p_x, p_y + 20, 30, 1, UI.divider[1], UI.divider[2], UI.divider[3], a_mul(255));
		renderer.rectangle(p_x, p_y + 25, 30, 12, tr, tg, tb, a_mul(40));
		renderer.rectangle(p_x, p_y + 25, 2, 12, hr, hg, hb, a_mul(255));
		renderer.rectangle(p_x + 40, p_y + 15, 8, 8, tr, tg, tb, a_mul(255));
		draw_rect_outline(p_x + 39, p_y + 14, 10, 10, math.max(0, tr - 30), math.max(0, tg - 30), math.max(0, tb - 30), a_mul(255));
		renderer.rectangle(p_x + 55, p_y + 17, 20, 4, UI.divider[1], UI.divider[2], UI.divider[3], a_mul(255));
		renderer.rectangle(p_x + 40, p_y + 35, 50, 4, UI.surface_2[1], UI.surface_2[2], UI.surface_2[3], a_mul(255));
		renderer.rectangle(p_x + 40, p_y + 35, 30, 4, sr, sg, sb, a_mul(255));
		renderer.rectangle((p_x + 40 + 30) - 3, p_y + 33, 6, 8, sr, sg, sb, a_mul(255));
		renderer.rectangle(p_x + 40, p_y + 55, 8, 8, UI.surface_2[1], UI.surface_2[2], UI.surface_2[3], a_mul(255));
		draw_rect_outline(p_x + 39, p_y + 54, 10, 10, UI.border[1], UI.border[2], UI.border[3], a_mul(255));
		renderer.rectangle(p_x + 55, p_y + 57, 20, 4, UI.divider[1], UI.divider[2], UI.divider[3], a_mul(255));
		renderer.text(r_mid, p_y + p_h + 28, UI.muted[1], UI.muted[2], UI.muted[3], a_mul(255), "c", 0, "SWATCHES");
		renderer.rectangle(rx + 26, p_y + p_h + 48, 20, 15, tr, tg, tb, a_mul(255));
		draw_rect_outline(rx + 25, p_y + p_h + 47, 22, 17, UI.border[1], UI.border[2], UI.border[3], a_mul(255));
		renderer.text(r_mid - 33, p_y + p_h + 72, UI.muted[1], UI.muted[2], UI.muted[3], a_mul(255), "c", 0, "THEME");
		renderer.rectangle(rx + 86, p_y + p_h + 48, 20, 15, sr, sg, sb, a_mul(255));
		draw_rect_outline(rx + 85, p_y + p_h + 47, 22, 17, UI.border[1], UI.border[2], UI.border[3], a_mul(255));
		renderer.text(r_mid + 27, p_y + p_h + 72, UI.muted[1], UI.muted[2], UI.muted[3], a_mul(255), "c", 0, "SLIDER");
	elseif (ACTIVE_TAB == "VISUALS") then
		renderer.text(r_mid, side_top + 18, UI.muted[1], UI.muted[2], UI.muted[3], a_mul(255), "c", 0, "LIVE PREVIEW");
		local ox, oy = rx + 18, side_top + 48;
		local ow, oh = RIGHT_PANEL_W - 36, 86;
		renderer.rectangle(ox, oy, ow, oh, UI.bg[1], UI.bg[2], UI.bg[3], a_mul(255));
		draw_rect_outline(ox - 1, oy - 1, ow + 2, oh + 2, UI.border[1], UI.border[2], UI.border[3], a_mul(255));
		for i = 0, 3 do
			renderer.rectangle(ox + 8 + (i * 18), ((oy + oh) - 14) - (i * 6), 10, 4 + (i * 2), hr, hg, hb, a_mul(90 - (i * 18)));
		end
		renderer.text(r_mid, oy + oh + 18, UI.muted[1], UI.muted[2], UI.muted[3], a_mul(200), "c", 0, "Placeholder bars");
	else
		local pr, pg, pb = UI.text[1], UI.text[2], UI.text[3];
		renderer.text(r_mid, side_top + 18, pr, pg, pb, a_mul(255), "c", 0, "BRUTE RADAR");
		local r_cx, r_cy = r_mid, side_top + 78;
		renderer.circle_outline(r_cx, r_cy, UI.muted[1], UI.muted[2], UI.muted[3], a_mul(200), 40, 0, 1, 1);
		renderer.circle_outline(r_cx, r_cy, hr, hg, hb, a_mul(180), 30, 0, 1, 1);
		renderer.rectangle(r_cx - 30, r_cy, 60, 1, pr, pg, pb, a_mul(220));
		renderer.rectangle(r_cx, r_cy - 30, 1, 60, pr, pg, pb, a_mul(220));
		local rt = globals.realtime();
		local dot_deg = (rt * 80) % 360;
		local dr_r = 22;
		local dx = r_cx + (dr_r * math.cos(math.rad(dot_deg)));
		local dy = r_cy + (dr_r * math.sin(math.rad(dot_deg)));
		renderer.circle(math.floor(dx), math.floor(dy), hr, hg, hb, a_mul(255), 4, 0, 1);
		local stat_y = r_cy + 58;
		local function draw_stat(k, v, highlight)
			renderer.text(rx + 14, stat_y, UI.muted[1], UI.muted[2], UI.muted[3], a_mul(255), "", 0, k);
			if highlight then
				renderer.text((rx + RIGHT_PANEL_W) - 14, stat_y, hr, hg, hb, a_mul(255), "r", 0, v);
			else
				renderer.text((rx + RIGHT_PANEL_W) - 14, stat_y, tr, tg, tb, a_mul(220), "r", 0, v);
			end
			stat_y = stat_y + 16;
		end
		local side = math.floor(math.sin(math.rad(dot_deg)) * 60);
		local stage = math.floor(rt * 2) % 4;
		local modes = {"Safe","Bruteforce","Predict","Adaptive"};
		local is_hit = math.sin(rt * 10) > 0.8;
		local hit_str = (is_hit and "HIT") or "-";
		draw_stat("Side:", (((side > 0) and "+") or "") .. side .. "°");
		draw_stat("Stage:", tostring(stage));
		draw_stat("Mode:", modes[stage + 1]);
		draw_stat("Hit:", hit_str, is_hit);
	end
	PREV_MOUSE_DOWN = m_down;
end);
local function try_require(mod, msg)
	local ok, result = pcall(require, mod);
	if ok then
		return result;
	end
	if msg then
		error(msg);
	end
	return nil;
end
local ffi = try_require("ffi", "ffi required for animstate access");
local bit = try_require("bit", "bit required");
local vector = try_require("vector", "vector required");
local function lerp(a, b, t)
	t = ((t < 0) and 0) or ((t > 1) and 1) or t;
	return a + ((b - a) * t);
end
local function clamp(v, lo, hi)
	return ((v < lo) and lo) or ((v > hi) and hi) or v;
end
local function normalize_yaw(yaw)
	while yaw > 180 do
		yaw = yaw - 360;
	end
	while yaw < -180 do
		yaw = yaw + 360;
	end
	return yaw;
end
local MAX_DESYNC = 58;
local function validate_angle(angle)
	return clamp(angle, -MAX_DESYNC, MAX_DESYNC);
end
local COLORS = {accent={217,77,77,255},accent_darker={187,57,57,255},white={255,255,255,255},gray={176,176,176,255},dark={100,100,100,255},black={15,15,15,255},black_trans={15,15,15,200},green={124,195,13,255},yellow={255,185,0,255},blue={0,140,255,255},neon_red={255,55,85,255},neon_blue={85,205,255,255},neon_green={55,255,120,255},neon_purple={200,100,255,255},neon_yellow={255,225,85,255}};
local function rgba_to_hex(color)
	return string.format("\a%02X%02X%02X%02X", color[1], color[2], color[3], color[4]);
end
local function mo()
	return _G._SCHEMATIC_OPTIONS or {};
end
local function update_visibility()
end
local menu = setmetatable({}, {__index=function(_, k)
	local o = mo();
	if (k == "enable") then
		return o.enable_resolver;
	end
	if (k == "mode") then
		return o.resolver_mode or "Safe";
	end
	if (k == "features") then
		return o.resolver_features or {};
	end
	if (k == "conditions") then
		return o.resolver_conditions or {};
	end
	if (k == "misses") then
		return o.brute_misses or 2;
	end
	if (k == "stages") then
		return o.brute_stages or 5;
	end
	if (k == "threshold") then
		return o.defensive_thresh or 3;
	end
	if (k == "pred_scale") then
		return o.pred_scale_resolver or 85;
	end
	if (k == "main") then
		return {enabled=o.enable_resolver,mode=(o.resolver_mode or "Safe")};
	end
	if (k == "config_type") then
		return o.config_preset or "Custom";
	end
	return nil;
end});
local prediction = setmetatable({}, {__index=function(_, k)
	local o = mo();
	if (k == "enabled") then
		return o.prediction_enabled;
	end
	if (k == "mode") then
		return o.prediction_mode or "Dynamic";
	end
	if (k == "accuracy") then
		return o.prediction_accuracy or 75;
	end
	if (k == "reaction") then
		return o.prediction_reaction or 50;
	end
	if (k == "learning") then
		return o.prediction_learning or 75;
	end
	if (k == "indicator") then
		return o.prediction_indicator;
	end
	if (k == "indicator_style") then
		return o.prediction_indicator_style or "Standard";
	end
	if (k == "hotkey") then
		return o.prediction_hotkey;
	end
	if (k == "settings") then
		return {accuracy=(o.prediction_accuracy or 75),reaction=(o.prediction_reaction or 50),learning=(o.prediction_learning or 75)};
	end
	return nil;
end});
local function apply_preset_to_options(config)
	local o = mo();
	if not config then
		return;
	end
	if config.resolver_mode then
		o.resolver_mode = config.resolver_mode;
	end
	if config.resolver_features then
		o.resolver_features = config.resolver_features;
	end
	if config.resolver_conditions then
		o.resolver_conditions = config.resolver_conditions;
	end
	if config.resolver_misses then
		o.brute_misses = config.resolver_misses;
	end
	if config.resolver_stages then
		o.brute_stages = config.resolver_stages;
	end
	if config.resolver_adapt_scale then
		o.pred_scale_resolver = config.resolver_adapt_scale;
	end
	if (config.resolver_enable ~= nil) then
		o.enable_resolver = config.resolver_enable;
	end
	if config.resolver_threshold then
		o.defensive_thresh = config.resolver_threshold;
	end
	if (config.prediction_enable ~= nil) then
		o.prediction_enabled = config.prediction_enable;
	end
	if config.prediction_mode then
		o.prediction_mode = config.prediction_mode;
	end
	if config.prediction_accuracy then
		o.prediction_accuracy = config.prediction_accuracy;
	end
	if config.prediction_reaction then
		o.prediction_reaction = config.prediction_reaction;
	end
	if config.prediction_learning then
		o.prediction_learning = config.prediction_learning;
	end
	if (config.prediction_indicator ~= nil) then
		o.prediction_indicator = config.prediction_indicator;
	end
	if config.prediction_indicator_style then
		o.prediction_indicator_style = config.prediction_indicator_style;
	end
end
local function resolver_init_settings()
	local o = mo();
	if (o.enable_resolver == nil) then
		o.enable_resolver = true;
	end
	if (o.resolver_mode == nil) then
		o.resolver_mode = "Safe";
	end
	if (o.resolver_features == nil) then
		o.resolver_features = {};
	end
	if (o.resolver_conditions == nil) then
		o.resolver_conditions = {};
	end
	if (o.brute_misses == nil) then
		o.brute_misses = 2;
	end
	if (o.brute_stages == nil) then
		o.brute_stages = 5;
	end
	if (o.defensive_thresh == nil) then
		o.defensive_thresh = 5;
	end
	if (o.pred_scale_resolver == nil) then
		o.pred_scale_resolver = 85;
	end
	if (o.hitmarker_enabled == nil) then
		o.hitmarker_enabled = true;
	end
end
ffi.cdef([[typedef void* (__thiscall *get_client_entity_t)(void*, int);]]);
local _ent_list_ok, _ent_list = pcall(function()
	return ffi.cast("void***", client.create_interface("client_panorama.dll", "VClientEntityList003"));
end);
local _get_ent_fn;
if (_ent_list_ok and _ent_list) then
	_get_ent_fn = ffi.cast("get_client_entity_t", _ent_list[0][3]);
end
local function get_entity_address(idx)
	if not _get_ent_fn then
		return nil;
	end
	local ok, addr = pcall(_get_ent_fn, _ent_list, idx);
	return (ok and addr) or nil;
end
local function get_animstate_float(idx, byte_offset)
	local addr = get_entity_address(idx);
	if not addr then
		return 0;
	end
	local ok, val = pcall(function()
		local as_ptr = ffi.cast("float*", ffi.cast("char*", addr) + byte_offset);
		return as_ptr[0];
	end);
	return (ok and val) or 0;
end
local ANIM_OFF = {eye_yaw=39300,current_feet_yaw=39304,goal_feet_yaw=39308,duck_amount=39232,speed_normalized=39236};
local function get_current_feet_yaw(ent_idx)
	return get_animstate_float(ent_idx, ANIM_OFF.current_feet_yaw);
end
local function get_goal_feet_yaw(ent_idx)
	return get_animstate_float(ent_idx, ANIM_OFF.goal_feet_yaw);
end
local function ent_index(ent)
	return ent;
end
local function make_history(max_size)
	return {_buf={},_head=1,_size=0,_max=max_size};
end
local function history_push(h, record)
	h._buf[h._head] = record;
	h._head = (h._head % h._max) + 1;
	if (h._size < h._max) then
		h._size = h._size + 1;
	end
end
local function history_iter(h)
	local count = h._size;
	local idx = ((h._head - 2) % h._max) + 1;
	local i = 0;
	return function()
		if (i >= count) then
			return nil;
		end
		i = i + 1;
		local rec = h._buf[idx];
		idx = ((idx - 2) % h._max) + 1;
		return i, rec;
	end;
end
local function history_to_array(h)
	local t = {};
	for _, rec in history_iter(h) do
		t[#t + 1] = rec;
	end
	return t;
end
local DEFENSIVE_TRIGGER_TIME = 0.15;
local RESOLVER_CHANGE_TIMEOUT = 2;
local resolver = {data={},name="$chematic CRACK",version="4.2",author="Wikingss x Resentvul x Losafaml",build="CRACK",last_update="2026-04-10"};
_G.resolver = resolver;
local STATES = {STAND=0,MOVE=1,WALK=2,CROUCH=3,CROUCH_MOVE=4,AIR=5,AIR_CROUCH=6};
local ANGLES = {SAFE={REAL={45,-45,30,-30,0},FAKE={35,-35,25,-25}},OPTIMAL={REAL={58,-58,35,-35,0},FAKE={45,-45,30,-30}},AGGRESSIVE={REAL={58,-58,40,-40,0},FAKE={58,-58,35,-35}},MAXIMUM={REAL={58,-58,45,-45,30,-30,0},FAKE={58,-58,40,-40}}};
local DIRECTIONS = {FORWARD=0,BACKWARD=180,LEFT=90,RIGHT=-90,FORWARDLEFT=45,FORWARDRIGHT=-45,BACKWARDLEFT=135,BACKWARDRIGHT=-135};
local smooth_lerp = lerp;
local function calculate_delta(a, b)
	local delta = (a - b) % 360;
	if (delta > 180) then
		delta = delta - 360;
	end
	return delta;
end
local function range(from, to, step)
	step = step or 1;
	local t = {};
	for i = from, to, step do
		table.insert(t, i);
	end
	return t;
end
local visuals = {init_time=globals.realtime(),fade_alpha=0,last_update=0,analyzing_offset=0,active_color={r=124,g=195,b=13},colors={active={r=124,g=195,b=13},inactive={r=195,g=13,b=13},warning={r=255,g=185,b=0},text={r=255,g=255,b=255},background={r=17,g=17,b=17,a=200},accent={r=127,g=0,b=255}},animations={rotation=0,wave=0,fade=0,offset=0},render_text=function(x, y, r, g, b, a, flags, text)
	renderer.text(x, y, r, g, b, a, flags, 0, text);
end,render_rect=function(x, y, w, h, r, g, b, a)
	renderer.rectangle(x, y, w, h, r, g, b, a);
end,render_gradient=function(x, y, w, h, r1, g1, b1, a1, r2, g2, b2, a2, horizontal)
	renderer.gradient(x, y, w, h, r1, g1, b1, a1, r2, g2, b2, a2, horizontal);
end};
resolver.data = resolver.data or {};
local NeuralNet = {weights={movement=0.3,defensive=0.25,history_accuracy=0.25,last_delta=0.2,pattern_confidence=0.15},layers={input={},hidden={size=6,neurons={},weights={}},output={}},training_data={},learning_rate=0.1,momentum=0.9,init=function(self)
	for i = 1, self.layers.hidden.size do
		self.layers.hidden.neurons[i] = 0;
		self.layers.hidden.weights[i] = {};
		for name, _ in pairs(self.weights) do
			self.layers.hidden.weights[i][name] = (math.random() * 0.2) - 0.1;
		end
	end
	self:normalize_weights();
end,normalize_weights=function(self)
	local sum = 0;
	for _, weight in pairs(self.weights) do
		sum = sum + weight;
	end
	for name, weight in pairs(self.weights) do
		self.weights[name] = weight / sum;
	end
end,activate=function(self, x)
	return ((x > 0) and math.tanh(x)) or (0.01 * x);
end,train=function(self, input_data, expected_output)
	if not input_data then
		return;
	end
	local input_layer = {movement=math.min(1, input_data.state.speed / 250),defensive=math.min(1, input_data.defensive.confidence),history_accuracy=(input_data.history_accuracy or 0.5),last_delta=math.min(1, math.abs(input_data.last_angle_delta) / 180),pattern_confidence=(input_data.pattern_confidence or 0.5)};
	local hidden_layer = {};
	for i = 1, self.layers.hidden.size do
		hidden_layer[i] = 0;
		for name, value in pairs(input_layer) do
			hidden_layer[i] = hidden_layer[i] + (value * self.layers.hidden.weights[i][name]);
		end
		hidden_layer[i] = self:activate(hidden_layer[i]);
	end
	local output = {angle_prediction=0,confidence=0,layer_activations={}};
	local active_neurons = 0;
	local dropout_rate = 0.1;
	for i, value in ipairs(hidden_layer) do
		local should_dropout = math.random() < (dropout_rate * (1 - (input_data.pattern_confidence or 0.5)));
		if not should_dropout then
			output.angle_prediction = output.angle_prediction + (value * 60);
			output.confidence = output.confidence + math.abs(value);
			output.layer_activations[i] = value;
			active_neurons = active_neurons + 1;
		end
	end
	if (active_neurons > 0) then
		output.angle_prediction = output.angle_prediction / active_neurons;
		output.confidence = output.confidence / active_neurons;
	end
	output.angle_prediction = validate_angle(output.angle_prediction);
	output.confidence = math.min(1, output.confidence);
	if expected_output then
		local error = expected_output - output.angle_prediction;
		local adaptive_rate = self.learning_rate * (1 - output.confidence);
		if (not self.training_data or (type(self.training_data) ~= "table")) then
			self.training_data = {};
		end
		for i = 1, self.layers.hidden.size do
			if not self.training_data[i] then
				self.training_data[i] = {};
			end
			for name, weight in pairs(self.layers.hidden.weights[i]) do
				local delta = error * adaptive_rate * input_layer[name];
				local momentum_term = self.training_data[i][name] or 0;
				self.layers.hidden.weights[i][name] = weight + delta + (momentum_term * self.momentum);
				self.training_data[i][name] = delta;
			end
		end
	end
	return output;
end};
local PatternAnalyzer = {max_samples=32,decay_rate=0.95,patterns={defensive={},switching={},static={},random={}},analyze=function(self, data)
	local hist = data.history;
	if (not hist or (#hist < 2)) then
		return {type="unknown",confidence=0,weights={defensive=0,switching=0,static=0,random=1}};
	end
	local analysis = {switches=0,static_count=0,defensive_count=0,total_samples=0,last_angles={},delta_history={},time_patterns={}};
	local limit = math.min(#hist, self.max_samples);
	for idx = 1, limit do
		local record = hist[idx];
		local weight = self.decay_rate ^ (idx - 1);
		if record.real_angle then
			analysis.total_samples = analysis.total_samples + weight;
			table.insert(analysis.last_angles, {angle=record.real_angle,weight=weight});
			if (#analysis.last_angles > 5) then
				table.remove(analysis.last_angles, 1);
			end
			if record.time then
				table.insert(analysis.time_patterns, {time=record.time,angle=record.real_angle,weight=weight});
			end
			if (#analysis.last_angles >= 2) then
				local prev = analysis.last_angles[#analysis.last_angles - 1];
				local curr = analysis.last_angles[#analysis.last_angles];
				local delta = math.abs(curr.angle - prev.angle);
				local avg_weight = (curr.weight + prev.weight) / 2;
				table.insert(analysis.delta_history, {delta=delta,weight=avg_weight});
				if (delta > 50) then
					analysis.switches = analysis.switches + (avg_weight * 1.2);
				elseif (delta < 10) then
					analysis.static_count = analysis.static_count + avg_weight;
				end
			end
			if record.defensive then
				analysis.defensive_count = analysis.defensive_count + weight;
			end
		end
	end
	local weights = {defensive=(analysis.defensive_count / math.max(0.001, analysis.total_samples)),switching=(analysis.switches / math.max(0.001, analysis.total_samples)),static=(analysis.static_count / math.max(0.001, analysis.total_samples))};
	weights.random = math.max(0.05, 1 - (weights.defensive + weights.switching + weights.static));
	local weight_sum = weights.defensive + weights.switching + weights.static + weights.random;
	for k, v in pairs(weights) do
		weights[k] = v / weight_sum;
	end
	local max_weight = 0;
	local pattern_type = "random";
	for ptype, weight in pairs(weights) do
		if (weight > max_weight) then
			max_weight = weight;
			pattern_type = ptype;
		end
	end
	local time_confidence = 0;
	if (#analysis.time_patterns >= 3) then
		local time_diffs = {};
		for i = 2, #analysis.time_patterns do
			table.insert(time_diffs, {diff=(analysis.time_patterns[i].time - analysis.time_patterns[i - 1].time),weight=analysis.time_patterns[i].weight});
		end
		local total_weight = 0;
		local weighted_sum = 0;
		for _, diff_data in ipairs(time_diffs) do
			weighted_sum = weighted_sum + (diff_data.diff * diff_data.weight);
			total_weight = total_weight + diff_data.weight;
		end
		local avg_time_diff = weighted_sum / math.max(0.001, total_weight);
		local weighted_variance = 0;
		for _, diff_data in ipairs(time_diffs) do
			weighted_variance = weighted_variance + (math.abs(diff_data.diff - avg_time_diff) * diff_data.weight);
		end
		weighted_variance = weighted_variance / math.max(0.001, total_weight);
		time_confidence = 1 - math.min(1, weighted_variance / ((avg_time_diff * 0.5) + 5));
	end
	return {type=pattern_type,confidence=max_weight,weights=weights,time_confidence=time_confidence,analysis=analysis};
end,predict_next_angle=function(self, pattern_data, current_angle)
	local weights = pattern_data.weights;
	local base_angle = current_angle or 0;
	if (weights.defensive > 0.5) then
		base_angle = base_angle * (0.85 - ((weights.defensive - 0.5) * 0.2));
	elseif (weights.switching > 0.5) then
		local switch_strength = 1 + ((weights.switching - 0.5) * 0.3);
		base_angle = base_angle * -switch_strength;
	elseif (weights.static > 0.5) then
		local static_factor = 0.95 + ((weights.static - 0.5) * 0.1);
		base_angle = base_angle * static_factor;
	else
		local noise = ((math.random() * 20) - 10) * weights.random;
		base_angle = base_angle + noise;
	end
	if (pattern_data.time_confidence > 0.6) then
		local time_factor = 1 + ((pattern_data.time_confidence - 0.6) * 0.4);
		base_angle = base_angle * time_factor;
	end
	return validate_angle(base_angle);
end};
local BruteforceSystem = {stages={{angles={58,-58},weight=1,success_rate=0},{angles={35,-35},weight=0.8,success_rate=0},{angles={25,-25},weight=0.6,success_rate=0},{angles={15,-15},weight=0.4,success_rate=0},{angles={45,-45},weight=0.7,success_rate=0},{angles={48,-48},weight=0.9,success_rate=0},{angles={30,-30},weight=0.5,success_rate=0},{angles={0,0},weight=0.3,success_rate=0}},update_success_rates=function(self, data)
	local hist = history_to_array(data.history);
	if (#hist < 1) then
		return;
	end
	local total_attempts = {};
	local success_counts = {};
	for i = 1, #self.stages do
		total_attempts[i] = 0;
		success_counts[i] = 0;
	end
	for idx, record in ipairs(hist) do
		if (record.brute_stage and (record.success ~= nil)) then
			local weight = 1 / math.sqrt(idx);
			total_attempts[record.brute_stage] = total_attempts[record.brute_stage] + weight;
			if record.success then
				success_counts[record.brute_stage] = success_counts[record.brute_stage] + weight;
			end
		end
	end
	for i = 1, #self.stages do
		if (total_attempts[i] > 0) then
			self.stages[i].success_rate = success_counts[i] / total_attempts[i];
		end
	end
end,analyze_recent_performance=function(self, history)
	local hits, misses = 0, 0;
	local max_samples = 10;
	for i = 1, math.min(max_samples, #history) do
		local record = history[i];
		if (record and (record.success ~= nil)) then
			if record.success then
				hits = hits + 1;
			else
				misses = misses + 1;
			end
		end
	end
	return {hits=hits,misses=misses,total=(hits + misses)};
end,get_next_angle=function(self, data)
	self:update_success_rates(data);
	local best_stage = 1;
	local best_score = 0;
	for i, stage in ipairs(self.stages) do
		local score = (stage.success_rate * 0.7) + (stage.weight * 0.3);
		if (data.defensive and data.defensive.active) then
			score = score * (1 - (math.abs(stage.angles[1]) / 70));
		end
		if (score > best_score) then
			best_score = score;
			best_stage = i;
		end
	end
	data.brute_stage = best_stage;
	local stage = self.stages[best_stage];
	local angle_index = 1;
	if data.last_success_side then
		angle_index = ((data.last_success_side == "left") and 2) or 1;
	elseif data.side_success_rate then
		angle_index = ((data.side_success_rate.right > data.side_success_rate.left) and 1) or 2;
	end
	local base_angle = stage.angles[angle_index] * stage.weight;
	if (data.history and data.history._size and (data.history._size > 0)) then
		local hist_arr = history_to_array(data.history);
		local recent_hit_miss = self:analyze_recent_performance(hist_arr);
		if (recent_hit_miss.total > 0) then
			local success_rate = recent_hit_miss.hits / recent_hit_miss.total;
			local confidence_factor = math.max(0.7, math.min(1.3, 1 + (success_rate - 0.5)));
			base_angle = base_angle * confidence_factor;
		end
	end
	if (data.defensive and data.defensive.active) then
		local defensive_scale = 0.85 - (data.defensive.confidence * 0.1);
		base_angle = base_angle * defensive_scale;
	end
	return validate_angle(base_angle);
end};
local function analyze_state(player)
	if (not player or not entity.is_alive(player)) then
		return {type=STATES.STAND,confidence=0};
	end
	local velocity = vector(entity.get_prop(player, "m_vecVelocity"));
	local flags = entity.get_prop(player, "m_fFlags");
	local duck_amount = entity.get_prop(player, "m_flDuckAmount");
	if (not velocity or not flags or not duck_amount) then
		return {type=STATES.STAND,confidence=0};
	end
	local speed = velocity:length2d();
	local in_air = bit.band(flags, 1) == 0;
	local ducking = duck_amount > 0.5;
	local state = {speed=speed,air_time=0,ground_time=0,duck_time=0,direction=((math.atan2(velocity.y, velocity.x) * 180) / math.pi),velocity=velocity,flags=flags,duck_amount=duck_amount,confidence=0,last_update=globals.realtime()};
	if in_air then
		state.type = (ducking and STATES.AIR_CROUCH) or STATES.AIR;
		state.confidence = 0.9 - (state.air_time * 0.05);
	elseif ducking then
		state.type = ((speed > 1.5) and STATES.CROUCH_MOVE) or STATES.CROUCH;
		state.confidence = 0.85 + (state.duck_time * 0.05);
	elseif (speed < 1.5) then
		state.type = STATES.STAND;
		state.confidence = 0.95 + (state.ground_time * 0.01);
	elseif (speed < 85) then
		state.type = STATES.WALK;
		state.confidence = 0.8 + ((math.min(speed, 85) / 85) * 0.15);
	else
		state.type = STATES.MOVE;
		local speed_factor = math.max(0, math.min(1, (speed - 85) / 165));
		state.confidence = 0.9 - (speed_factor * 0.1);
	end
	return state;
end
local function analyze_animations(player)
	if not player then
		return {};
	end
	local layers = {};
	for i = 0, 13 do
		layers[i] = {weight=(entity.get_prop(player, "m_flWeight", i) or 0),rate=(entity.get_prop(player, "m_flPlaybackRate", i) or 0),sequence=(entity.get_prop(player, "m_nSequence", i) or 0),cycle=(entity.get_prop(player, "m_flCycle", i) or 0)};
	end
	local eye_raw = {entity.get_prop(player, "m_angEyeAngles")};
	local pose_bdy = entity.get_prop(player, "m_flPoseParameter", 11) or 0;
	local pose_mv = entity.get_prop(player, "m_flPoseParameter", 0) or 0;
	local pose_ln = entity.get_prop(player, "m_flPoseParameter", 2) or 0;
	local idx = ent_index(player);
	local cur_feet_yaw = get_current_feet_yaw(idx);
	local goal_feet_yaw = get_goal_feet_yaw(idx);
	return {layers=layers,eye_angles=eye_raw,pose_params={body_yaw=pose_bdy,move_yaw=pose_mv,lean_amount=pose_ln},goalfeet_yaw=goal_feet_yaw,current_feet_yaw=cur_feet_yaw};
end
local function detect_defensive_resolver_state(data, current_time)
	local threshold = math.max(1, math.min(15, math.floor(tonumber(mo().defensive_thresh) or 5)));
	local score = 0;
	local ang_arr = history_to_array(data.angle_history);
	local anim_arr = history_to_array(data.animation_layers_history);
	local sim_arr = history_to_array(data.simulation_time_history);
	if (#ang_arr >= 2) then
		local current_pitch = tonumber(ang_arr[1].x) or 0;
		local previous_pitch = tonumber(ang_arr[2].x) or 0;
		if (math.abs(current_pitch - previous_pitch) > 45) then
			score = score + 6;
		end
	end
	if (#anim_arr >= 2) then
		local current_layers = anim_arr[1].layers;
		local previous_layers = anim_arr[2].layers;
		local current_aim = current_layers and current_layers[0];
		local previous_aim = previous_layers and previous_layers[0];
		if (current_aim and previous_aim) then
			local cycle_delta = math.abs((current_aim.cycle or 0) - (previous_aim.cycle or 0));
			local weight_delta = math.abs((current_aim.weight or 0) - (previous_aim.weight or 0));
			if ((cycle_delta > 0.9) or (weight_delta > 0.9)) then
				score = score + 6;
			end
		end
	end
	if (data.defensive_triggered and ((current_time - (data.last_defensive_time or 0)) < DEFENSIVE_TRIGGER_TIME)) then
		score = score + 4;
	end
	if (#sim_arr >= 2) then
		local sim_diff = (sim_arr[1].sim or 0) - (sim_arr[2].sim or 0);
		if ((sim_diff > (globals.tickinterval() * 2)) or (sim_diff < 0)) then
			score = score + 6;
		end
	end
	local defensive_active = score >= threshold;
	data.defensive_score = score;
	if (defensive_active and not data.defensive_triggered) then
		data.last_defensive_time = current_time;
	end
	return defensive_active;
end
resolver.update_player = function(self, player)
	if (not player or not entity.is_alive(player)) then
		return;
	end
	local sim_time = entity.get_prop(player, "m_flSimulationTime") or 0;
	if not self.data[player] then
		self.data[player] = {history=make_history(32),defensive_history=make_history(32),angle_history=make_history(32),animation_layers_history=make_history(16),simulation_time_history=make_history(16),hits=0,misses=0,miss_count=0,last_update=0,last_sim_time=-1,shots=0,current_angle=0,confidence=0,brute_stage=1,brute_direction=1,last_state=nil,last_defensive_time=nil,last_hit_time=0,last_miss_time=0,last_hit_side=nil,last_miss_side=nil,defensive_triggered=false,last_success_side=nil,side_success_rate={left=0,right=0}};
	end
	local data = self.data[player];
	if (sim_time == data.last_sim_time) then
		return;
	end
	data.last_sim_time = sim_time;
	local current_time = globals.realtime();
	local state = analyze_state(player);
	local o = mo();
	local animations = (entity.is_alive(player) and analyze_animations(player)) or {layers={},pose_params={body_yaw=0,move_yaw=0,lean_amount=0},goalfeet_yaw=0,current_feet_yaw=0};
	history_push(data.angle_history, {time=current_time,x=((animations.eye_angles and animations.eye_angles[1]) or 0),y=((animations.eye_angles and animations.eye_angles[2]) or 0)});
	history_push(data.animation_layers_history, {time=current_time,layers=animations.layers});
	history_push(data.simulation_time_history, {time=current_time,sim=sim_time});
	local defensive = {active=false,confidence=0,duration=0};
	if (animations.layers[3] and (animations.layers[3].weight > 0.1)) then
		defensive.active = true;
		defensive.confidence = animations.layers[3].weight;
		if (animations.layers[6] and (animations.layers[6].weight > 0.2)) then
			defensive.confidence = math.min(1, defensive.confidence + (animations.layers[6].weight * 0.5));
		end
		defensive.duration = current_time - (data.last_defensive_time or current_time);
		data.last_defensive_time = current_time;
		history_push(data.defensive_history, {time=current_time,confidence=defensive.confidence,real_angle=((animations.pose_params.body_yaw * 120) - 60)});
	end
	local defensive_state_active = (o.defensive_res and detect_defensive_resolver_state(data, current_time)) or false;
	if defensive_state_active then
		defensive.active = true;
		defensive.confidence = math.max(defensive.confidence, 0.65);
	end
	data.defensive_triggered = defensive.active;
	local pattern_data = self.pattern_analyzer:analyze({history=history_to_array(data.history)});
	local nn_input = {state=state,defensive=defensive,history_accuracy=(data.hits / math.max(1, data.hits + data.misses)),last_angle_delta=((data.current_angle and calculate_delta((animations.pose_params.body_yaw * 120) - 60, data.current_angle)) or 0),pattern_confidence=pattern_data.confidence};
	data.nn_input_cache = nn_input;
	local nn_output = self.neural_net:train(nn_input);
	local final_angle = nn_output.angle_prediction;
	local confidence = nn_output.confidence;
	local adapt_scale = math.max(0.01, math.min(1, (tonumber(o.pred_scale_resolver) or 85) / 100));
	if (pattern_data.confidence > 0.4) then
		local pattern_angle = self.pattern_analyzer:predict_next_angle(pattern_data, final_angle);
		local blend_factor = math.min(1, pattern_data.confidence * 1.5 * adapt_scale);
		final_angle = lerp(final_angle, pattern_angle, blend_factor);
	end
	local forced_defensive = false;
	if (o.defensive_res and data.defensive_triggered) then
		local resolved_side = nil;
		if (data.last_hit_side and ((current_time - (data.last_hit_time or 0)) < 5)) then
			resolved_side = data.last_hit_side;
		else
			local aim_layer = animations.layers and animations.layers[0];
			if aim_layer then
				resolved_side = (((aim_layer.weight or 0) > 0.5) and "right") or "left";
			else
				resolved_side = "right";
			end
		end
		final_angle = ((resolved_side == "left") and -MAX_DESYNC) or MAX_DESYNC;
		confidence = math.max(confidence, 0.65);
		forced_defensive = true;
	end
	if (o.bruteforce_mode and not forced_defensive and (data.miss_count > 0) and ((current_time - (data.last_miss_time or 0)) < RESOLVER_CHANGE_TIMEOUT)) then
		local miss_threshold = math.max(1, math.floor(tonumber(o.brute_misses) or 2));
		local brute_steps = math.max(1, math.floor(tonumber(o.brute_stages) or 5));
		if (data.miss_count >= miss_threshold) then
			local stage_idx = (data.brute_stage - 1) % brute_steps;
			local step_size = MAX_DESYNC / brute_steps;
			local resolved_desync = step_size * (stage_idx + 1);
			local side_positive = (data.brute_direction or 1) > 0;
			final_angle = (side_positive and resolved_desync) or -resolved_desync;
			data.brute_stage = data.brute_stage + 1;
			if (data.brute_stage > brute_steps) then
				data.brute_direction = -(data.brute_direction or 1);
				data.brute_stage = 1;
			end
			confidence = math.max(confidence, 0.7);
		elseif data.last_miss_side then
			final_angle = ((data.last_miss_side == "right") and (-MAX_DESYNC * 0.9)) or (MAX_DESYNC * 0.9);
			confidence = math.max(confidence, 0.6);
		end
	elseif not forced_defensive then
		local use_bruteforce = (confidence < 0.6) or (data.misses >= 3);
		if use_bruteforce then
			local bruteforce_angle = self.BruteforceSystem:get_next_angle(data);
			local brute_factor = math.max(0.2, math.min(0.9, 1 - confidence)) * (0.6 + (adapt_scale * 0.4));
			final_angle = lerp(final_angle, bruteforce_angle, brute_factor);
		end
		if defensive.active then
			local def_arr = history_to_array(data.defensive_history);
			if (#def_arr > 5) then
				local defensive_pattern = self.pattern_analyzer:analyze({history=def_arr});
				if (defensive_pattern.weights.switching > 0.6) then
					final_angle = -final_angle * 0.9;
				elseif (defensive_pattern.weights.static > 0.6) then
					final_angle = final_angle * 0.7;
				else
					final_angle = final_angle * 0.85;
				end
			else
				final_angle = final_angle * 0.85;
			end
		end
	end
	final_angle = validate_angle(final_angle);
	data.current_angle = final_angle;
	data.confidence = confidence;
	data.last_update = current_time;
	data.last_state = state;
	history_push(data.history, {time=current_time,angle=final_angle,state=state.type,defensive=defensive.active,real_angle=((animations.pose_params.body_yaw * 120) - 60),brute_stage=data.brute_stage});
	pcall(plist.set, player, "Force body yaw", true);
	pcall(plist.set, player, "Force body yaw value", final_angle);
end;
resolver.register_hit = function(self, player, hitbox, damage)
	if (not player or not entity.is_alive(player)) then
		return;
	end
	local data = self.data[player];
	if not data then
		return;
	end
	data.hits = data.hits + 1;
	data.miss_count = 0;
	data.last_hit_time = globals.realtime();
	if (data.current_angle > 0) then
		data.last_hit_side = "right";
	elseif (data.current_angle < 0) then
		data.last_hit_side = "left";
	end
	history_push(data.history, {time=globals.realtime(),success=true,hitbox=hitbox,damage=damage,angle=data.current_angle,brute_stage=data.brute_stage,state=((data.last_state and data.last_state.type) or nil)});
	if data.nn_input_cache then
		self.neural_net:train(data.nn_input_cache, data.current_angle);
	end
	if (data.current_angle > 0) then
		data.last_success_side = "right";
		data.side_success_rate.right = data.side_success_rate.right + 1;
	elseif (data.current_angle < 0) then
		data.last_success_side = "left";
		data.side_success_rate.left = data.side_success_rate.left + 1;
	end
end;
resolver.register_miss = function(self, player, hitbox_aimed)
	if (not player or not entity.is_alive(player)) then
		return;
	end
	local data = self.data[player];
	if not data then
		return;
	end
	data.misses = data.misses + 1;
	data.miss_count = (data.miss_count or 0) + 1;
	data.last_miss_time = globals.realtime();
	if (data.current_angle > 0) then
		data.last_miss_side = "right";
	elseif (data.current_angle < 0) then
		data.last_miss_side = "left";
	end
	history_push(data.history, {time=globals.realtime(),success=false,hitbox=hitbox_aimed,angle=data.current_angle,brute_stage=data.brute_stage,state=((data.last_state and data.last_state.type) or nil)});
	if data.nn_input_cache then
		self.neural_net:train(data.nn_input_cache, -data.current_angle);
	end
end;
client.set_event_callback("aim_hit", function(e)
	if (not e or not e.target) then
		return;
	end
	if not mo().enable_resolver then
		return;
	end
	pcall(resolver.register_hit, resolver, e.target, e.hitbox, e.damage);
end);
client.set_event_callback("aim_miss", function(e)
	if (not e or not e.target) then
		return;
	end
	if not mo().enable_resolver then
		return;
	end
	pcall(resolver.register_miss, resolver, e.target, e.hitbox);
end);
resolver_init_settings();
update_visibility();
NeuralNet:init();
resolver.neural_net = NeuralNet;
resolver.pattern_analyzer = PatternAnalyzer;
resolver.BruteforceSystem = BruteforceSystem;
resolver.menu = old_menu_mapping;
print("$chematic resolver loaded successfully! (version 2.3 - Wiking)");
local function render_glow_text(x, y, r, g, b, a, flags, text)
	renderer.text(x + 1, y + 1, 0, 0, 0, a * 0.3, flags, 0, text);
	renderer.text(x, y, r, g, b, a, flags, 0, text);
end
local hitmarker = {hits={},last_hit=0,fade_time=1,add=function(self, x, y, damage)
	table.insert(self.hits, {x=x,y=y,damage=damage,time=globals.realtime(),alpha=1});
	self.last_hit = globals.realtime();
end,render=function(self)
	local time = globals.realtime();
	for i = #self.hits, 1, -1 do
		local hit = self.hits[i];
		local delta = time - hit.time;
		if (delta > self.fade_time) then
			table.remove(self.hits, i);
		else
			hit.alpha = 1 - (delta / self.fade_time);
			hit.y = hit.y - (delta * 30);
			render_glow_text(hit.x, hit.y, 255, 255, 255, 255 * hit.alpha, "c", tostring(hit.damage));
		end
	end
end};
client.set_event_callback("net_update_end", function()
	if not mo().enable_resolver then
		return;
	end
	local players = entity.get_players(true);
	if not players then
		return;
	end
	for _, ent in ipairs(players) do
		if (entity.is_alive(ent) and not entity.is_dormant(ent)) then
			local ok, err = pcall(resolver.update_player, resolver, ent);
			if not ok then
				client.color_log(255, 80, 80, "[$chematic resolver] update_player error: " .. tostring(err));
			end
		end
	end
end);
client.set_event_callback("player_hurt", function(e)
	local attacker = client.userid_to_entindex(e.attacker);
	if (attacker == entity.get_local_player()) then
		local target = client.userid_to_entindex(e.userid);
		if target then
			local x, y = entity.get_prop(target, "m_vecOrigin");
			if (x and y) then
				hitmarker:add(x, y, e.dmg_health);
			end
		end
	end
end);
resolver.render = render;
resolver.hitmarker = hitmarker;
resolver.ICONS = ICONS;
local c_accent = rgba_to_hex(COLORS.accent);
local c_white = rgba_to_hex(COLORS.white);
local c_gray = rgba_to_hex(COLORS.gray);
local c_dark = rgba_to_hex(COLORS.dark);
local function update_prediction_visibility()
end
local function render_rounded_rectangle(x, y, w, h, radius, r, g, b, a)
	if (not x or not y or not w or not h or not radius or not r or not g or not b or not a) then
		return;
	end
	if ((w <= 0) or (h <= 0) or (radius <= 0)) then
		return;
	end
	radius = math.min(radius, math.min(w / 2, h / 2));
	renderer.rectangle(x + radius, y, w - (radius * 2), h, r, g, b, a);
	renderer.rectangle(x, y + radius, radius, h - (radius * 2), r, g, b, a);
	renderer.rectangle((x + w) - radius, y + radius, radius, h - (radius * 2), r, g, b, a);
	for i = 0, radius do
		local rad = i / radius;
		local curve = math.sqrt(1 - ((1 - rad) * (1 - rad))) * radius;
		renderer.rectangle(x + i, (y + radius) - curve, 1, curve, r, g, b, a);
		renderer.rectangle(((x + w) - i) - 1, (y + radius) - curve, 1, curve, r, g, b, a);
		renderer.rectangle(x + i, (y + h) - radius, 1, curve, r, g, b, a);
		renderer.rectangle(((x + w) - i) - 1, (y + h) - radius, 1, curve, r, g, b, a);
	end
end
local function calculate_distance(v1, v2)
	if (not v1 or not v2 or not v1[1] or not v2[1]) then
		return 1000;
	end
	local dx = v1[1] - v2[1];
	local dy = v1[2] - v2[2];
	local dz = v1[3] - v2[3];
	return math.sqrt((dx * dx) + (dy * dy) + (dz * dz));
end
local function normalize_vector(vx, vy, vz)
	if (not vx or not vy or not vz) then
		return 0, 0, 0;
	end
	local length = math.sqrt((vx * vx) + (vy * vy) + (vz * vz));
	if (length < 0.0001) then
		return 0, 0, 0;
	end
	return vx / length, vy / length, vz / length;
end
local PredictionSystem = {data={},active=false,last_target=nil,last_prediction=0,last_confidence=0.5,last_update=globals.realtime(),history={},mode=1,ui_positions={indicator={x=0,y=0,dragging=false,drag_x=0,drag_y=0,min_x=-500,max_x=500,min_y=-300,max_y=300}},colors={active=COLORS.neon_green,warning=COLORS.neon_yellow,danger=COLORS.neon_red,neutral=COLORS.gray,anomaly=COLORS.neon_purple},statistics={total_predictions=0,successful_predictions=0,accuracy=0,streak=0,best_streak=0,last_prediction_distance=0,anomalies_detected=0},animations={fade=0,rotation=0,scale=1,offset=0,pulse=0,transition_speed=5,indicator_y_offset=0},_anomaly_defaults={speed_history={},max_history=10,threshold=3,cooldown=1.5,last_anomaly_time=0,is_anomaly=false},get_anomaly=function(self, player)
	local d = self.data[player];
	if not d then
		return self._anomaly_defaults;
	end
	if not d.anomaly then
		d.anomaly = {speed_history={},max_history=10,threshold=3,cooldown=1.5,last_anomaly_time=0,is_anomaly=false};
	end
	return d.anomaly;
end,initialize=function(self)
	self.animations = {fade=0,rotation=0,scale=1,offset=0,pulse=0,transition_speed=5,indicator_y_offset=0};
	self.statistics = {total_predictions=0,successful_predictions=0,accuracy=0,streak=0,best_streak=0,last_prediction_distance=0,anomalies_detected=0};
	for ent, d in next, self.data do
		d.anomaly = nil;
	end
end,analyze_movement=function(self, player)
	if (not player or not entity.is_alive(player)) then
		return nil;
	end
	local velocity = {entity.get_prop(player, "m_vecVelocity")};
	if (not velocity or not velocity[1]) then
		return nil;
	end
	local speed = math.sqrt((velocity[1] ^ 2) + (velocity[2] ^ 2));
	local direction = (math.atan2(velocity[2] or 0, velocity[1] or 0) * 180) / math.pi;
	local flags = entity.get_prop(player, "m_fFlags");
	local on_ground = bit.band(flags or 0, 1) ~= 0;
	local anomaly = self:detect_anomaly(player, speed, velocity);
	local smoothed_velocity = {velocity[1],velocity[2],velocity[3]};
	if anomaly then
		local ad = self:get_anomaly(player);
		if (#ad.speed_history > 2) then
			local avg_vx, avg_vy, avg_vz, weight_sum = 0, 0, 0, 0;
			for i = 1, math.min(5, #ad.speed_history) do
				local w = 1 - ((i / 5) * 0.6);
				local hv = ad.speed_history[i];
				avg_vx = avg_vx + (hv[1] * w);
				avg_vy = avg_vy + (hv[2] * w);
				avg_vz = avg_vz + (hv[3] * w);
				weight_sum = weight_sum + w;
			end
			if (weight_sum > 0) then
				smoothed_velocity[1] = avg_vx / weight_sum;
				smoothed_velocity[2] = avg_vy / weight_sum;
				smoothed_velocity[3] = avg_vz / weight_sum;
			end
		end
	end
	local result = {speed=speed,direction=direction,velocity=velocity,smoothed_velocity=smoothed_velocity,on_ground=on_ground,prediction_factor=math.min(1, speed / 250),anomaly={detected=anomaly,time=self:get_anomaly(player).last_anomaly_time,confidence_modifier=((anomaly and -0.3) or 0)},pattern={erratic=((speed > 10) and (speed < 70)),running=(speed > 200),jumping=not on_ground,still=(speed < 5)}};
	local ad = self:get_anomaly(player);
	table.insert(ad.speed_history, 1, velocity);
	if (#ad.speed_history > ad.max_history) then
		table.remove(ad.speed_history);
	end
	return result;
end,detect_anomaly=function(self, player, current_speed, current_velocity)
	local ad = self:get_anomaly(player);
	local history = ad.speed_history;
	local current_time = globals.realtime();
	if ((current_time - ad.last_anomaly_time) < ad.cooldown) then
		return ad.is_anomaly;
	end
	if (#history < 3) then
		return false;
	end
	local prev_velocity = history[1];
	if not prev_velocity then
		return false;
	end
	local prev_speed = math.sqrt((prev_velocity[1] ^ 2) + (prev_velocity[2] ^ 2));
	local speed_ratio = (current_speed > 0) and (prev_speed > 0) and (math.max(current_speed, prev_speed) / math.max(1, math.min(current_speed, prev_speed)));
	local dot_product = 0;
	if (current_velocity[1] and current_velocity[2] and prev_velocity[1] and prev_velocity[2]) then
		local curr_len = math.sqrt((current_velocity[1] ^ 2) + (current_velocity[2] ^ 2));
		local prev_len = math.sqrt((prev_velocity[1] ^ 2) + (prev_velocity[2] ^ 2));
		if ((curr_len > 0) and (prev_len > 0)) then
			dot_product = ((current_velocity[1] / curr_len) * (prev_velocity[1] / prev_len)) + ((current_velocity[2] / curr_len) * (prev_velocity[2] / prev_len));
		end
	end
	local anomaly_detected = false;
	if ((speed_ratio and (speed_ratio > ad.threshold) and (current_speed > 50)) or (dot_product and (dot_product < 0.5) and (current_speed > 50) and (prev_speed > 50))) then
		ad.is_anomaly = true;
		ad.last_anomaly_time = current_time;
		self.statistics.anomalies_detected = self.statistics.anomalies_detected + 1;
		anomaly_detected = true;
	elseif ((current_time - ad.last_anomaly_time) >= ad.cooldown) then
		ad.is_anomaly = false;
	end
	return anomaly_detected or ad.is_anomaly;
end,predict_position=function(self, player, time_delta)
	if (not player or not entity.is_alive(player)) then
		return nil;
	end
	local current_pos = {entity.get_origin(player)};
	if (not current_pos or not current_pos[1]) then
		return nil;
	end
	local velocity = {entity.get_prop(player, "m_vecVelocity")};
	if (not velocity or not velocity[1]) then
		return current_pos;
	end
	local movement_data = self:analyze_movement(player);
	local use_smoothed = false;
	if (movement_data and movement_data.anomaly and movement_data.anomaly.detected) then
		velocity = movement_data.smoothed_velocity;
		time_delta = time_delta * 0.5;
	end
	local predicted_pos = {(current_pos[1] + (velocity[1] * time_delta)),(current_pos[2] + (velocity[2] * time_delta)),(current_pos[3] + (velocity[3] * time_delta))};
	local flags = entity.get_prop(player, "m_fFlags");
	local on_ground = bit.band(flags or 0, 1) ~= 0;
	if not on_ground then
		predicted_pos[3] = predicted_pos[3] - (800 * time_delta * time_delta * 0.5);
	end
	local fraction, entindex = client.trace_line(entity.get_local_player(), current_pos[1], current_pos[2], current_pos[3], predicted_pos[1], predicted_pos[2], predicted_pos[3]);
	if (fraction < 1) then
		predicted_pos[1] = current_pos[1] + ((predicted_pos[1] - current_pos[1]) * fraction * 0.9);
		predicted_pos[2] = current_pos[2] + ((predicted_pos[2] - current_pos[2]) * fraction * 0.9);
		predicted_pos[3] = current_pos[3] + ((predicted_pos[3] - current_pos[3]) * fraction * 0.9);
	end
	local dx = predicted_pos[1] - current_pos[1];
	local dy = predicted_pos[2] - current_pos[2];
	local dz = predicted_pos[3] - current_pos[3];
	local distance = math.sqrt((dx * dx) + (dy * dy) + (dz * dz));
	local max_prediction_distance = 500 * time_delta;
	if ((distance > max_prediction_distance) and not use_smoothed) then
		local scale_factor = max_prediction_distance / distance;
		predicted_pos[1] = current_pos[1] + (dx * scale_factor);
		predicted_pos[2] = current_pos[2] + (dy * scale_factor);
		predicted_pos[3] = current_pos[3] + (dz * scale_factor);
		distance = max_prediction_distance;
	end
	self.statistics.last_prediction_distance = distance;
	return predicted_pos;
end,calculate_confidence=function(self, data)
	if not data then
		return 0.5;
	end
	local base_confidence = 0.5;
	local factors = {history=0.3,movement=0.3,pattern=0.2,anomaly=0.2};
	if (data.history and (#data.history > 0)) then
		local recent_success = 0;
		local weight_sum = 0;
		for i = 1, math.min(5, #data.history) do
			local w = 1 / i;
			weight_sum = weight_sum + w;
			if (data.history[i].success == true) then
				recent_success = recent_success + w;
			end
		end
		if (weight_sum > 0) then
			base_confidence = base_confidence + (factors.history * (recent_success / weight_sum));
		end
	end
	if data.movement then
		local movement_conf = 0.5;
		if data.movement.pattern then
			if data.movement.pattern.still then
				movement_conf = 0.8;
			elseif data.movement.pattern.erratic then
				movement_conf = 0.3;
			elseif data.movement.pattern.running then
				movement_conf = 0.7;
			elseif data.movement.pattern.jumping then
				movement_conf = 0.4;
			end
		else
			movement_conf = 1 - math.min(1, (data.movement.speed or 0) / 250);
		end
		base_confidence = base_confidence + (factors.movement * movement_conf);
	end
	if (data.pattern and data.pattern.confidence) then
		base_confidence = base_confidence + (factors.pattern * data.pattern.confidence);
	end
	if (data.movement and data.movement.anomaly and data.movement.anomaly.detected) then
		base_confidence = base_confidence * 0.7;
	end
	return clamp(base_confidence, 0, 1);
end,update=function(self, target)
	if (not target or not entity.is_alive(target)) then
		self.active = false;
		self.last_target = nil;
		return;
	end
	if not self.data[target] then
		self.data[target] = {history={},movement={},pattern={},defensive={active=false,confidence=0},confidence=0.5,last_update=0};
	end
	local data = self.data[target];
	local current_time = globals.realtime();
	if ((current_time - data.last_update) >= 0.05) then
		data.movement = self:analyze_movement(target);
		if (resolver and resolver.pattern_analyzer and (type(resolver.pattern_analyzer.analyze) == "function")) then
			data.pattern = resolver.pattern_analyzer:analyze({history=data.history});
		end
		data.confidence = self:calculate_confidence(data);
		self.last_confidence = data.confidence;
		self.last_update = current_time;
		local accuracy_threshold = 0.75;
		if (prediction and prediction.settings and prediction.settings.accuracy) then
			accuracy_threshold = (mo().prediction_accuracy or 75) / 100;
		end
		self.active = data.confidence >= accuracy_threshold;
		if (self.last_target == target) then
			self.statistics.total_predictions = self.statistics.total_predictions + 1;
			if (data.confidence > 0.7) then
				self.statistics.successful_predictions = self.statistics.successful_predictions + 1;
				self.statistics.streak = self.statistics.streak + 1;
				self.statistics.best_streak = math.max(self.statistics.streak, self.statistics.best_streak);
			else
				self.statistics.streak = 0;
			end
			if (self.statistics.total_predictions > 0) then
				self.statistics.accuracy = self.statistics.successful_predictions / self.statistics.total_predictions;
			end
		else
			self.last_target = target;
		end
		data.last_update = current_time;
	end
	local dt = current_time - (self.last_animation_time or current_time);
	self.last_animation_time = current_time;
	local is_active = mo().prediction_hotkey;
	self.animations.fade = lerp(self.animations.fade, (is_active and 1) or 0.3, dt * self.animations.transition_speed);
	self.animations.rotation = (self.animations.rotation + (dt * 80)) % 360;
	self.animations.pulse = (math.sin(current_time * 3) * 0.5) + 0.5;
	self.animations.indicator_y_offset = math.sin(current_time * 1.5) * 2;
end,handle_dragging=function(self)
	if (not ui.is_menu_open() or not mo().prediction_indicator) then
		return;
	end
	local mouse_x, mouse_y = ui.mouse_position();
	local screen_w, screen_h = client.screen_size();
	local indicator_style = mo().prediction_indicator_style or "Standard" or "Standard";
	local ind_width, ind_height;
	if (indicator_style == "Minimal") then
		ind_width, ind_height = 100, 20;
	elseif (indicator_style == "Standard") then
		ind_width, ind_height = 150, 35;
	else
		ind_width, ind_height = 200, 60;
	end
	local ind_x = ((screen_w / 2) - (ind_width / 2)) + self.ui_positions.indicator.x;
	local ind_y = ((screen_h - ind_height) - (((indicator_style == "Advanced") and 30) or 20)) + self.ui_positions.indicator.y;
	if ((ind_x < 5) or ((ind_x + ind_width) > (screen_w - 5)) or (ind_y < 5) or ((ind_y + ind_height) > (screen_h - 5))) then
		if (ind_x < 5) then
			self.ui_positions.indicator.x = (-screen_w / 2) + (ind_width / 2) + 5;
		elseif ((ind_x + ind_width) > (screen_w - 5)) then
			self.ui_positions.indicator.x = ((screen_w / 2) - (ind_width / 2)) - 5;
		end
		if (ind_y < 5) then
			self.ui_positions.indicator.y = -screen_h + ind_height + (((indicator_style == "Advanced") and 30) or 20) + 5;
		elseif ((ind_y + ind_height) > (screen_h - 5)) then
			self.ui_positions.indicator.y = -5;
		end
		ind_x = ((screen_w / 2) - (ind_width / 2)) + self.ui_positions.indicator.x;
		ind_y = ((screen_h - ind_height) - (((indicator_style == "Advanced") and 30) or 20)) + self.ui_positions.indicator.y;
	end
	if ui.is_menu_open() then
		renderer.rectangle((ind_x + ind_width) - 15, ind_y + 5, 10, 10, 200, 200, 200, 180);
	end
	if ((mouse_x >= ind_x) and (mouse_x <= (ind_x + ind_width)) and (mouse_y >= ind_y) and (mouse_y <= (ind_y + ind_height))) then
		if client.key_state(1) then
			if not self.ui_positions.indicator.dragging then
				self.ui_positions.indicator.dragging = true;
				self.ui_positions.indicator.drag_x = mouse_x - ind_x;
				self.ui_positions.indicator.drag_y = mouse_y - ind_y;
			end
		else
			self.ui_positions.indicator.dragging = false;
		end
	end
	if self.ui_positions.indicator.dragging then
		local new_x = ((mouse_x - self.ui_positions.indicator.drag_x) - (screen_w / 2)) + (ind_width / 2);
		local new_y = (mouse_y - self.ui_positions.indicator.drag_y) - ((screen_h - ind_height) - (((indicator_style == "Advanced") and 30) or 20));
		new_x = clamp(new_x, self.ui_positions.indicator.min_x, self.ui_positions.indicator.max_x);
		new_y = clamp(new_y, self.ui_positions.indicator.min_y, self.ui_positions.indicator.max_y);
		self.ui_positions.indicator.x = new_x;
		self.ui_positions.indicator.y = new_y;
	end
end,render_indicator=function(self)
	if (not mo().prediction_enabled or not mo().prediction_indicator) then
		return;
	end
	local screen_w, screen_h = client.screen_size();
	if ((screen_w <= 0) or (screen_h <= 0)) then
		return;
	end
	local indicator_style = mo().prediction_indicator_style or "Standard" or "Standard";
	local is_active = mo().prediction_hotkey;
	local confidence = self.last_confidence or 0.5;
	local alpha = math.floor(255 * self.animations.fade);
	if (alpha < 5) then
		return;
	end
	local _tgt_anomaly = (self.last_target and self:get_anomaly(self.last_target)) or self._anomaly_defaults;
	local color;
	if _tgt_anomaly.is_anomaly then
		color = self.colors.anomaly;
	elseif (confidence > 0.7) then
		color = self.colors.active;
	elseif (confidence > 0.4) then
		color = self.colors.warning;
	else
		color = self.colors.danger;
	end
	local y_offset = math.floor(self.animations.indicator_y_offset);
	if (indicator_style == "Minimal") then
		local ind_width = 100;
		local ind_height = 20;
		local ind_x = ((screen_w / 2) - (ind_width / 2)) + self.ui_positions.indicator.x;
		local ind_y = ((screen_h - ind_height) - 20) + self.ui_positions.indicator.y + y_offset;
		local radius = 4;
		ind_x = math.max(5, math.min((screen_w - ind_width) - 5, ind_x));
		ind_y = math.max(5, math.min((screen_h - ind_height) - 5, ind_y));
		render_rounded_rectangle(ind_x, ind_y, ind_width, ind_height, radius, COLORS.black_trans[1], COLORS.black_trans[2], COLORS.black_trans[3], alpha * 0.8);
		local wave = self.animations.pulse;
		local bar_width = ind_width * wave;
		renderer.gradient(ind_x + ((ind_width - bar_width) / 2), ind_y, bar_width / 2, 1, COLORS.neon_blue[1], COLORS.neon_blue[2], COLORS.neon_blue[3], 0, color[1], color[2], color[3], alpha, true);
		renderer.gradient(ind_x + (ind_width / 2), ind_y, bar_width / 2, 1, color[1], color[2], color[3], alpha, COLORS.neon_blue[1], COLORS.neon_blue[2], COLORS.neon_blue[3], 0, true);
		local status = (is_active and "ACTIVE") or "READY";
		renderer.text(ind_x + (ind_width / 2), (ind_y + (ind_height / 2)) - 3, color[1], color[2], color[3], alpha, "c", 0, string.format("%s: %d%%", status, confidence * 100));
	elseif (indicator_style == "Standard") then
		local ind_width = 150;
		local ind_height = 35;
		local ind_x = ((screen_w / 2) - (ind_width / 2)) + self.ui_positions.indicator.x;
		local ind_y = ((screen_h - ind_height) - 20) + self.ui_positions.indicator.y + y_offset;
		local radius = 5;
		ind_x = math.max(5, math.min((screen_w - ind_width) - 5, ind_x));
		ind_y = math.max(5, math.min((screen_h - ind_height) - 5, ind_y));
		render_rounded_rectangle(ind_x, ind_y, ind_width, ind_height, radius, COLORS.black_trans[1], COLORS.black_trans[2], COLORS.black_trans[3], alpha * 0.8);
		local pulse = self.animations.pulse;
		local bar_height = 2;
		renderer.gradient(ind_x, ind_y, ind_width / 2, bar_height, COLORS.neon_blue[1], COLORS.neon_blue[2], COLORS.neon_blue[3], alpha, color[1], color[2], color[3], alpha, true);
		renderer.gradient(ind_x + (ind_width / 2), ind_y, ind_width / 2, bar_height, color[1], color[2], color[3], alpha, COLORS.neon_blue[1], COLORS.neon_blue[2], COLORS.neon_blue[3], alpha, true);
		renderer.text(ind_x + (ind_width / 2), ind_y + 11, 20, 20, 20, alpha * 0.5, "c", 0, "CRACK prediction");
		renderer.text(ind_x + (ind_width / 2), ind_y + 10, color[1], color[2], color[3], alpha, "c", 0, "CRACK prediction");
		local status = (is_active and "ACTIVE") or "READY";
		if _tgt_anomaly.is_anomaly then
			status = "ANOMALY";
		end
		renderer.text(ind_x + (ind_width / 2), ind_y + 24, COLORS.white[1], COLORS.white[2], COLORS.white[3], alpha, "c", 0, string.format("%s: %d%%", status, confidence * 100));
		local bar_y = (ind_y + ind_height) - 1;
		renderer.rectangle(ind_x, bar_y, ind_width * confidence, 1, color[1], color[2], color[3], alpha * 0.7);
	else
		local ind_width = 200;
		local ind_height = 60;
		local ind_x = ((screen_w / 2) - (ind_width / 2)) + self.ui_positions.indicator.x;
		local ind_y = ((screen_h - ind_height) - 30) + self.ui_positions.indicator.y + y_offset;
		local radius = 6;
		ind_x = math.max(5, math.min((screen_w - ind_width) - 5, ind_x));
		ind_y = math.max(5, math.min((screen_h - ind_height) - 5, ind_y));
		render_rounded_rectangle(ind_x + 2, ind_y + 2, ind_width, ind_height, radius, 5, 5, 5, alpha * 0.3);
		render_rounded_rectangle(ind_x, ind_y, ind_width, ind_height, radius, COLORS.black_trans[1], COLORS.black_trans[2], COLORS.black_trans[3], alpha * 0.85);
		local bar_width = ind_width * (0.5 + (0.5 * self.animations.pulse));
		renderer.gradient(ind_x + ((ind_width - bar_width) / 2), ind_y, bar_width / 2, 2, COLORS.neon_blue[1], COLORS.neon_blue[2], COLORS.neon_blue[3], alpha * 0.5, color[1], color[2], color[3], alpha, true);
		renderer.gradient(ind_x + (ind_width / 2), ind_y, bar_width / 2, 2, color[1], color[2], color[3], alpha, COLORS.neon_blue[1], COLORS.neon_blue[2], COLORS.neon_blue[3], alpha * 0.5, true);
		local title_y_offset = math.sin(globals.realtime() * 2) * 1;
		renderer.text(ind_x + (ind_width / 2), ind_y + 12 + title_y_offset, color[1], color[2], color[3], alpha, "c", 0, "$chematic CRACK");
		local current_time = globals.realtime();
		renderer.text(ind_x + 10, ind_y + 25, COLORS.white[1], COLORS.white[2], COLORS.white[3], alpha * 0.7, "", 0, "Build: $chematic CRACK v4.2");
		local status = (is_active and "ACTIVE") or "READY";
		local status_color = (is_active and self.colors.active) or self.colors.neutral;
		if _tgt_anomaly.is_anomaly then
			status = "ANOMALY";
			status_color = self.colors.anomaly;
		end
		renderer.text(ind_x + 10, ind_y + 35, COLORS.white[1], COLORS.white[2], COLORS.white[3], alpha, "", 0, "Prediction:");
		renderer.text((ind_x + ind_width) - 10, ind_y + 20, status_color[1], status_color[2], status_color[3], alpha, "r", 0, status);
		local bar_x = ind_x + 10;
		local bar_y = ind_y + 50;
		local bar_width = ind_width - 20;
		local bar_height = 4;
		renderer.rectangle(bar_x, bar_y, bar_width, bar_height, 40, 40, 40, alpha * 0.6);
		renderer.gradient(bar_x, bar_y, bar_width * confidence, bar_height, color[1], color[2], color[3], alpha * 0.8, color[1], color[2], color[3], alpha, false);
		local conf_text = string.format("%d%%", confidence * 100);
		renderer.text((bar_x + bar_width) - 5, bar_y - 12, color[1], color[2], color[3], alpha, "r", 0, conf_text);
		local dist_text = string.format("%.1fu", self.statistics.last_prediction_distance);
		renderer.text(bar_x, bar_y - 12, COLORS.gray[1], COLORS.gray[2], COLORS.gray[3], alpha * 0.8, "", 0, dist_text);
		local bottom_y = (ind_y + ind_height) - 2;
		local wave = (math.sin(current_time * 1.5) * 0.5) + 0.5;
		renderer.gradient(ind_x, bottom_y, ind_width * wave, 2, color[1], color[2], color[3], 0, color[1], color[2], color[3], alpha * 0.5, true);
		if (self.statistics.anomalies_detected > 0) then
			renderer.text(ind_x + bar_width, bar_y + 15, COLORS.neon_purple[1], COLORS.neon_purple[2], COLORS.neon_purple[3], alpha * 0.9, "r", 0, string.format("Anomalies: %d", self.statistics.anomalies_detected));
		end
	end
end};
PredictionSystem:initialize();
client.set_event_callback("aim_fire", function(e)
	local success, err = pcall(function()
		if (PredictionSystem.active and PredictionSystem.last_target) then
			local data = PredictionSystem.data[PredictionSystem.last_target];
			if data then
				table.insert(data.history, {time=globals.realtime(),fired=true,confidence=data.confidence,anomaly=PredictionSystem:get_anomaly(PredictionSystem.last_target).is_anomaly});
				if (#data.history > 10) then
					table.remove(data.history, 1);
				end
			end
		end
	end);
	if not success then
		client.color_log(255, 0, 0, string.format("[Prediction Error] %s", err));
	end
end);
client.set_event_callback("aim_hit", function(e)
	local success, err = pcall(function()
		if (not e or not e.target) then
			return;
		end
		if (PredictionSystem.last_target and (PredictionSystem.last_target == e.target)) then
			local data = PredictionSystem.data[e.target];
			if data then
				data.prediction_success = (data.prediction_success or 0) + 1;
				data.confidence = math.min(1, (data.confidence or 0.5) + 0.05);
				local ad = PredictionSystem:get_anomaly(e.target);
				if ad.is_anomaly then
					ad.threshold = ad.threshold * 1.05;
				end
			end
		end
	end);
	if not success then
		client.color_log(255, 0, 0, string.format("[Prediction Error] %s", err));
	end
end);
client.set_event_callback("aim_miss", function(e)
	local success, err = pcall(function()
		if (not e or not e.target) then
			return;
		end
		if (PredictionSystem.last_target and (PredictionSystem.last_target == e.target)) then
			local data = PredictionSystem.data[e.target];
			if data then
				data.prediction_failures = (data.prediction_failures or 0) + 1;
				local velocity = {entity.get_prop(e.target, "m_vecVelocity")};
				local speed = (velocity and math.sqrt(((velocity[1] or 0) ^ 2) + ((velocity[2] or 0) ^ 2))) or 0;
				local ad = PredictionSystem:get_anomaly(e.target);
				if ((speed > 200) and not ad.is_anomaly) then
					ad.threshold = math.max(1.5, ad.threshold * 0.9);
					ad.is_anomaly = true;
					ad.last_anomaly_time = globals.realtime();
					PredictionSystem.statistics.anomalies_detected = (PredictionSystem.statistics.anomalies_detected or 0) + 1;
				end
				data.confidence = math.max(0.1, (data.confidence or 0.5) - 0.1);
				if (e.reason == "spread") then
					data.confidence = math.min(1, data.confidence + 0.05);
				end
			end
		end
	end);
	if not success then
		client.color_log(255, 0, 0, string.format("[Prediction Error] %s", err));
	end
end);
local function prediction_init_settings()
	local o = mo();
	if (o.prediction_enabled == nil) then
		o.prediction_enabled = true;
	end
	if (o.prediction_mode == nil) then
		o.prediction_mode = "Dynamic";
	end
	if (o.prediction_accuracy == nil) then
		o.prediction_accuracy = 75;
	end
	if (o.prediction_reaction == nil) then
		o.prediction_reaction = 50;
	end
	if (o.prediction_learning == nil) then
		o.prediction_learning = 75;
	end
	if (o.prediction_indicator == nil) then
		o.prediction_indicator = true;
	end
	if (o.prediction_indicator_style == nil) then
		o.prediction_indicator_style = "Standard";
	end
	if (o.prediction_hotkey == nil) then
		o.prediction_hotkey = true;
	end
end
client.color_log(COLORS.accent[1], COLORS.accent[2], COLORS.accent[3], "[$chematic CRACK] Version 4.2 loaded");
client.color_log(COLORS.accent[1], COLORS.accent[2], COLORS.accent[3], "[$chematic CRACK] Created by Wiking | Losafaml | Resentvul | 2026-04-10");
prediction_init_settings();
update_prediction_visibility();
if not resolver then
	resolver = {};
end
resolver.prediction = prediction;
resolver.PredictionSystem = PredictionSystem;
client.delay_call(1, function()
	if (PredictionSystem.animations.fade < 0.1) then
		PredictionSystem.animations.fade = 1;
		client.color_log(255, 255, 0, "[CRACK prediction] Indicator visibility reset");
	end
end);
resolver.data = resolver.data or {};
local normalize_angle = normalize_yaw;
local function convert_to_cheat_angle(angle)
	local normalized = normalize_angle(angle);
	if (normalized > 0) then
		return normalized - 180;
	else
		return normalized + 180;
	end
end
local angle_smoothing = {real=0,fake=0,side="unknown",last_update=0,raw_angle=0};
local function smooth_angle(current, target, smoothing_factor)
	local normalized_current = normalize_angle(current);
	local normalized_target = normalize_angle(target);
	local diff = normalize_angle(normalized_target - normalized_current);
	local smooth_speed = math.min(1, (smoothing_factor or 0.1) * globals.frametime() * 165);
	local result = normalized_current + (diff * smooth_speed);
	return normalize_angle(result);
end
local c_accent_dbg = "\aD94D4DFF";
local c_white_dbg = "\aFFFFFFFF";
local c_gray_dbg = "\aB0B0B0FF";
local c_dark_dbg = "\a646464FF";
if not debug_system then
	debug_system = {};
end
debug_system.window = {x=100,y=100,width=300,height=400,drag={active=false,x=0,y=0},alpha=255};
local debug_panel = {};
local styles = {Old={bg={17,17,17},header={30,30,35},accent={127,0,255},text={255,255,255},success={0,255,140},warning={255,185,0},danger={255,70,70}},CRACK={bg={14,12,18},header={28,16,20},accent={217,77,77},text={242,238,238},success={110,230,140},warning={255,170,70},danger={255,85,85}},["Black & White"]={bg={8,8,8},header={24,24,24},accent={240,240,240},text={224,224,224},success={210,210,210},warning={185,185,185},danger={255,255,255}}};
local function draw_container(x, y, w, h, style, alpha)
	renderer.rectangle(x, y, w, h, style.bg[1], style.bg[2], style.bg[3], alpha * 0.95);
	renderer.rectangle(x, y, w, 30, style.header[1], style.header[2], style.header[3], alpha);
	local time = globals.realtime() * 2;
	local wave = (math.sin(time) * 0.5) + 0.5;
	renderer.gradient(x, y + 29, w * wave, 1, style.accent[1], style.accent[2], style.accent[3], 0, style.accent[1], style.accent[2], style.accent[3], alpha, true);
end
local function draw_text(x, y, text, color, alpha, flags)
	renderer.text(x + 1, y + 1, 0, 0, 0, alpha * 0.5, flags, nil, text);
	renderer.text(x, y, color[1], color[2], color[3], alpha, flags, nil, text);
end
local function draw_bar(x, y, w, value, max, style, alpha)
	renderer.rectangle(x, y, w, 6, 40, 40, 40, alpha * 0.5);
	local percentage = value / max;
	local color = style.success;
	if (percentage < 0.3) then
		color = style.danger;
	elseif (percentage < 0.7) then
		color = style.warning;
	end
	local bar_width = w * percentage;
	renderer.gradient(x, y, bar_width, 6, color[1], color[2], color[3], alpha, color[1] * 0.8, color[2] * 0.8, color[3] * 0.8, alpha, true);
end
local sections = {["Target Info"]=function(x, y, w, target, style, alpha)
	if not target then
		return y;
	end
	draw_text(x + 15, y, "Target Info", style.accent, alpha, "");
	y = y + 20;
	local target_name = entity.get_player_name(target) or "unknown";
	draw_text(x + 15, y, "Player: " .. target_name, style.text, alpha, "");
	y = y + 20;
	local health = entity.get_prop(target, "m_iHealth") or 0;
	local armor = entity.get_prop(target, "m_ArmorValue") or 0;
	draw_text(x + 15, y, "Health: " .. tostring(math.max(0, math.floor(health))), style.text, alpha, "");
	draw_bar(x + 15, y + 15, w - 30, health, 100, style, alpha);
	y = y + 30;
	draw_text(x + 15, y, "Armor: " .. tostring(math.max(0, math.floor(armor))), style.text, alpha, "");
	draw_bar(x + 15, y + 15, w - 30, armor, 100, style, alpha);
	y = y + 30;
	local weapon = entity.get_player_weapon(target);
	local weapon_name = (weapon and entity.get_classname(weapon):gsub("CWeapon", "")) or "none";
	draw_text(x + 15, y, "Weapon: " .. weapon_name, style.text, alpha, "");
	y = y + 20;
	return y + 10;
end,Angles=function(x, y, w, target, style, alpha)
	if not target then
		return y;
	end
	draw_text(x + 15, y, "Angle Analysis", style.accent, alpha, "");
	y = y + 25;
	local eye_angles = {entity.get_prop(target, "m_angEyeAngles")};
	local current_yaw = eye_angles[2] or 0;
	local pose_param = entity.get_prop(target, "m_flPoseParameter", 11) or 0;
	local current_fake = current_yaw + ((pose_param * 120) - 60);
	current_yaw = normalize_angle(current_yaw);
	current_fake = normalize_angle(current_fake);
	local cheat_yaw = convert_to_cheat_angle(current_yaw);
	local cheat_fake = convert_to_cheat_angle(current_fake);
	local time = globals.realtime();
	local dt = time - angle_smoothing.last_update;
	angle_smoothing.last_update = time;
	angle_smoothing.real = smooth_angle(angle_smoothing.real, cheat_yaw, dt * 5);
	angle_smoothing.fake = smooth_angle(angle_smoothing.fake, cheat_fake, dt * 5);
	angle_smoothing.raw_angle = smooth_angle(angle_smoothing.raw_angle, current_yaw, dt * 5);
	local delta = math.abs(normalize_angle(angle_smoothing.real - angle_smoothing.fake));
	local center_x = x + (w / 2);
	local radius = 25;
	local circle_y = y + radius + 5;
	local calibration_time = globals.realtime() * 2;
	local calibration_angle = calibration_time * 180;
	for i = 0, 360, 45 do
		local cal_x = center_x + (radius * math.cos(math.rad(i + calibration_angle)));
		local cal_y = circle_y + (radius * math.sin(math.rad(i + calibration_angle)));
		renderer.circle_outline(cal_x, cal_y, style.accent[1], style.accent[2], style.accent[3], alpha * 0.2, 2, 0, 360, 1);
	end
	renderer.circle_outline(center_x, circle_y, 40, 40, 40, alpha * 0.5, radius, 0, 360, 2);
	local real_x = center_x + (radius * math.cos(math.rad(angle_smoothing.real)));
	local real_y = circle_y + (radius * math.sin(math.rad(angle_smoothing.real)));
	renderer.circle_outline(real_x, real_y, style.text[1], style.text[2], style.text[3], alpha, 3, 0, 360, 2);
	local fake_x = center_x + (radius * math.cos(math.rad(angle_smoothing.fake)));
	local fake_y = circle_y + (radius * math.sin(math.rad(angle_smoothing.fake)));
	renderer.circle_outline(fake_x, fake_y, style.accent[1], style.accent[2], style.accent[3], alpha, 3, 0, 360, 2);
	local pulse = (math.sin(globals.realtime() * 4) * 0.3) + 0.7;
	renderer.line(real_x, real_y, fake_x, fake_y, style.warning[1], style.warning[2], style.warning[3], alpha * pulse);
	y = y + (radius * 2) + 15;
	draw_text(x + 15, y, "Real:", style.text, alpha, "");
	draw_text((x + w) - 50, y, string.format("%.1f°", angle_smoothing.real), style.text, alpha, "r");
	y = y + 20;
	draw_text(x + 15, y, "Fake:", style.text, alpha, "");
	draw_text((x + w) - 50, y, string.format("%.1f°", angle_smoothing.fake), style.text, alpha, "r");
	y = y + 20;
	local delta_color = ((delta > 30) and style.danger) or ((delta > 15) and style.warning) or style.success;
	draw_text(x + 15, y, "Delta:", delta_color, alpha, "");
	draw_text((x + w) - 50, y, string.format("%.1f°", delta), delta_color, alpha, "r");
	y = y + 20;
	local side = ((angle_smoothing.fake > 0) and "Right") or "Left";
	if (side ~= angle_smoothing.side) then
		if ((globals.realtime() - (angle_smoothing.side_change or 0)) > 0.1) then
			angle_smoothing.side = side;
			angle_smoothing.side_change = globals.realtime();
		end
	end
	local side_color = ((side == "Right") and style.success) or style.warning;
	draw_text(x + 15, y, "Side:", style.text, alpha, "");
	draw_text((x + w) - 50, y, angle_smoothing.side, side_color, alpha, "r");
	y = y + 20;
	draw_text(x + 15, y, "Desync", style.text, alpha, "");
	y = y + 20;
	local bar_w = w - 30;
	local bar_h = 8;
	renderer.rectangle(x + 15, y, bar_w, bar_h, 40, 40, 40, alpha * 0.5);
	local center_pulse = (math.sin(globals.realtime() * 2) * 0.5) + 0.5;
	renderer.rectangle((x + 15 + (bar_w / 2)) - 1, y, 2, bar_h, style.text[1], style.text[2], style.text[3], alpha * center_pulse);
	local desync_percentage = (angle_smoothing.fake + 180) / 360;
	local desync_width = math.max(4, math.min(bar_w * desync_percentage, bar_w));
	renderer.gradient(x + 15 + (bar_w / 2), y, desync_width - (bar_w / 2), bar_h, delta_color[1], delta_color[2], delta_color[3], alpha, delta_color[1] * 0.7, delta_color[2] * 0.7, delta_color[3] * 0.7, alpha, true);
	y = y + 15;
	return y + 10;
end,["Resolver Mode"]=function(x, y, w, target, style, alpha)
	if not target then
		return y;
	end
	draw_text(x + 15, y, "Resolver Mode", style.accent, alpha, "");
	y = y + 20;
	local velocity = {entity.get_prop(target, "m_vecVelocity")};
	local speed = math.sqrt((velocity[1] ^ 2) + (velocity[2] ^ 2));
	local flags = entity.get_prop(target, "m_fFlags");
	local in_air = bit.band(flags, 1) == 0;
	local mode, mode_color;
	if in_air then
		mode = "ADAPTIVE";
		mode_color = style.warning;
	elseif (speed > 250) then
		mode = "DYNAMIC";
		mode_color = style.accent;
	else
		mode = "STABLE";
		mode_color = style.success;
	end
	draw_text(x + 15, y, "Current: ", style.text, alpha, "");
	draw_text(x + 70, y, mode, mode_color, alpha, "");
	y = y + 20;
	return y + 10;
end};
local function calculate_distance(v1, v2)
	if (not v1 or not v2 or (#v1 < 3) or (#v2 < 3)) then
		return 1000;
	end
	if not (v1[1] and v1[2] and v1[3] and v2[1] and v2[2] and v2[3]) then
		return 1000;
	end
	return math.sqrt(((v1[1] - v2[1]) ^ 2) + ((v1[2] - v2[2]) ^ 2) + ((v1[3] - v2[3]) ^ 2));
end
local function calculate_prediction(target)
	if not target then
		return;
	end
	local velocity = {entity.get_prop(target, "m_vecVelocity")};
	local speed = math.sqrt((velocity[1] ^ 2) + (velocity[2] ^ 2));
	local flags = entity.get_prop(target, "m_fFlags");
	local in_air = bit.band(flags, 1) == 0;
	local ducking = bit.band(flags, 4) ~= 0;
	local player_origin = {entity.get_origin(entity.get_local_player())};
	local target_origin = {entity.get_origin(target)};
	local distance = calculate_distance(player_origin, target_origin);
	local hit_chance = 85;
	if (speed > 250) then
		hit_chance = hit_chance * 0.75;
	elseif (speed > 130) then
		hit_chance = hit_chance * 0.9;
	end
	if in_air then
		hit_chance = hit_chance * 0.65;
	elseif ducking then
		hit_chance = hit_chance * 0.85;
	end
	if (distance > 800) then
		hit_chance = hit_chance * 0.8;
	end
	local defensive_aa = false;
	if (resolver and resolver.data and resolver.data[target] and resolver.data[target].defensive) then
		defensive_aa = resolver.data[target].defensive > 0;
	end
	if defensive_aa then
		hit_chance = hit_chance * 0.6;
	end
	local prediction_active = false;
	if (resolver and resolver.prediction) then
		if mo().prediction_enabled then
			if mo().prediction_hotkey then
				prediction_active = true;
				hit_chance = hit_chance * 1.2;
			end
		end
	end
	hit_chance = math.min(98, math.max(10, hit_chance));
	local jitter = math.sin(globals.realtime() * 2.5) * 3;
	hit_chance = hit_chance + jitter;
	if not resolver.PredictionSystem then
		resolver.PredictionSystem = {};
	end
	resolver.PredictionSystem.last_confidence = hit_chance / 100;
	resolver.PredictionSystem.last_update = globals.realtime();
	resolver.PredictionSystem.active = prediction_active;
end
local function on_paint()
	if (not debug_system or not mo().debug_panel_enabled) then
		return;
	end
	local style_name = mo().debug_panel_style or "CRACK" or "CRACK";
	local style = styles[style_name];
	if not style then
		style = styles['CRACK'];
	end
	local target = client.current_threat();
	local has_target = target and entity.is_alive(target);
	local x = debug_system.window.x;
	local y = debug_system.window.y;
	local w = debug_system.window.width;
	local h = debug_system.window.height;
	draw_container(x, y, w, h, style, 255);
	draw_text(x + (w / 2), y + 15, "$chematic CRACK v4.2", style.accent, 255, "c");
	if has_target then
		local current_y = y + 40;
		local selected_modes = mo().debug_panel_modes or {};
		if (#selected_modes == 0) then
			selected_modes = {"Angles"};
		end
		for _, mode in ipairs(selected_modes) do
			if sections[mode] then
				current_y = sections[mode](x, current_y, w, target, style, 255);
			end
		end
		calculate_prediction(target);
	else
		draw_text(x + (w / 2), y + (h / 2), "No target", style.text, 255, "c");
	end
	local mouse_x, mouse_y = ui.mouse_position();
	if client.key_state(1) then
		if ((mouse_x >= x) and (mouse_x <= (x + w)) and (mouse_y >= y) and (mouse_y <= (y + 30))) then
			debug_system.window.drag.active = true;
			debug_system.window.drag.x = mouse_x - x;
			debug_system.window.drag.y = mouse_y - y;
		end
	else
		debug_system.window.drag.active = false;
	end
	if debug_system.window.drag.active then
		debug_system.window.x = mouse_x - debug_system.window.drag.x;
		debug_system.window.y = mouse_y - debug_system.window.drag.y;
	end
end
local function debug_init_settings()
	local o = mo();
	if (o.debug_panel_enabled == nil) then
		o.debug_panel_enabled = false;
	end
	if (o.debug_panel_style == nil) then
		o.debug_panel_style = "CRACK";
	end
	if (o.debug_panel_modes == nil) then
		o.debug_panel_modes = {};
	end
end
debug_init_settings();
update_visibility();
if not resolver then
	resolver = {};
end
resolver.debug = debug_system;
local clantag_animation = {"$ ","$s ","$sc ","$sch ","$sche ","$schem ","$schema ","$schemat ","$schemati ","$schematic","$schematic ","$schematic r","$schematic re","$schematic reb","$schematic rebo","$schematic rebor","$schematic CRACK","$schematic CRACK","$schematic rebor","$schematic rebo","$schematic reb","$schematic re","$schematic r","$schematic ","$schematic","$schemati","$schemat","$schema","$schem","$sche","$sch","$sc","$s","$"};
local trashtalk_data = {last_message=0,last_kill_time=0,pending_message=nil};
local trashtalk_messages = {Normal={"schematic CRACK resolver > all","1 by schematic CRACK resolver","nice fake by schematic CRACK","resolver too strong for u","sit by schematic CRACK","1 by CRACK version","solved by CRACK + ratio","CRACK tech = CRACK results","another one solved by schematic CRACK"},Funny={"oops my CRACK resolver did it again >.<","looks like someone needs anti-aim tutorials :3","nice flip... of your chair xD","schematic CRACK goes brrrrr ˎ₍•ʚ•₎ˏ","getting solved like homework (╯°□°）╯","ez like sunday morning ᕕ( ᐛ )ᕗ","resolved faster than my life problems :D","your anti-aim just got CRACK'd ( ͡° ͜ʖ ͡°)","404: your skill not found ¯\\_(ツ)_/¯","CRACK resolver eating your AA like pacman"},Aggressive={"GET RESOLVED BY SCHEMATIC CRACK KID","BACK TO CONFIGS NN","IMAGINE GETTING TAPPED BY CRACK","RESOLVED + RATIO + MAD","SIT DOWN AND CRY","UNINSTALL YOUR PASTE","SCHEMATIC CRACK JUST HIT!","MAYBE TIME TO GET CRACK YOURSELF?","CRACK POWER > YOUR WEAK PASTE","THAT'S WHAT SCHEMATIC CRACK DOES TO KIDS"},CRACK={"schematic CRACK > your life savings","I'd say GG but CRACK never loses","imagine not using schematic CRACK in 2025","resolved by the best CRACK tech","back to searching 'free hvh configs'","your AA config just got a CRACK-shaped hole in it","getting tapped by schematic's CRACK resolver","CRACK experience = CRACK results","when you evolve past Rebron, you get CRACK taps","this is what CRACK tier looks like"},Taunting={"did you even try to dodge that?","too predictable with that AA","CRACK sees through your config like glass","keep practicing, maybe in 100 years you'll stand a chance","this is embarrassing for you, honestly","I'm starting to feel bad for how easy this is","is that the best you've got?","at least try to make this challenging","your config leaks like a sieve against CRACK"},Sarcastic={"oh no, did CRACK hurt your feelings?","wow, almost had to try there... almost","surely your next config will work, right?","that's a lovely config... be a shame if CRACK solved it","wait, was that supposed to be anti-aim?","schematic CRACK sends its regards to your config dev","I'm sure that config works great... against bots","so close yet so... actually not close at all","thanks for the practice target"}};
local trashtalk_specials = {headshot={"SCHEMATIC CRACK HEADSHOT MACHINE","head deleted by CRACK","head.exe stopped working thanks to CRACK","schematic CRACK head removal service - quick and efficient"},knife={"imagine getting knifed by schematic CRACK LMAO","CRACK knife > your life","didn't even need resolver for that one","knife kills are just more CRACK"},wallbang={"CRACK sees through walls and configs","walls can't stop schematic CRACK","schematic CRACK wallbang technology™","not even walls can save you from CRACK"}};
local trashtalk_round_end = {win={"gg ez schematic CRACK win","CRACK diff","another day, another CRACK victory","CRACK users always on top"},loss={"imagine needing to cheat against schematic CRACK","lucky round, CRACK will be back","even CRACK needs a challenge sometimes","strategically letting you win that one"}};
local clantag_state = {last_index=0};
local function set_clantag(tag)
	client.set_clan_tag(tag);
end
local function queue_message(type)
	local mode = mo().trashtalk_mode or "Normal";
	local msg;
	if (type and mo().trashtalk_special) then
		msg = trashtalk_specials[type];
	end
	if not msg then
		if (mode == "Random Mix") then
			local modes = {"Normal","Funny","Aggressive","Rebron","Taunting","Sarcastic"};
			mode = modes[client.random_int(1, #modes)];
		end
		msg = trashtalk_messages[mode];
	end
	if msg then
		trashtalk_data.pending_message = msg[client.random_int(1, #msg)];
		trashtalk_data.last_kill_time = globals.realtime();
	end
end
client.set_event_callback("player_death", function(e)
	if not mo().trashtalk_enabled then
		return;
	end
	local lp = entity.get_local_player();
	local attacker = client.userid_to_entindex(e.attacker);
	local victim = client.userid_to_entindex(e.userid);
	if ((attacker == lp) and (victim ~= lp)) then
		local t;
		if e.headshot then
			t = "headshot";
		elseif (e.weapon == "knife") then
			t = "knife";
		elseif (e.penetrated and (e.penetrated > 0)) then
			t = "wallbang";
		end
		queue_message(t);
	end
end);
client.set_event_callback("round_end", function(e)
	if not mo().trashtalk_auto_gg then
		return;
	end
	local lp = entity.get_local_player();
	local team = entity.get_prop(lp, "m_iTeamNum");
	local win = e.winner;
	local msgs = ((team == win) and trashtalk_round_end.win) or trashtalk_round_end.loss;
	if msgs then
		client.delay_call(0.5, function()
			client.exec("say " .. msgs[client.random_int(1, #msgs)]);
		end);
	end
end);
local function schematic_trashtalk_clantag_paint()
	local now = globals.realtime();
	if (trashtalk_data.pending_message and ((now - trashtalk_data.last_kill_time) >= (mo().trashtalk_delay or 3))) then
		if ((now - trashtalk_data.last_message) >= 0.5) then
			client.exec("say " .. trashtalk_data.pending_message);
			trashtalk_data.pending_message = nil;
			trashtalk_data.last_message = now;
		end
	end
	if mo().clantag_enabled then
		local tick = (math.floor(globals.tickcount() / 40) % #clantag_animation) + 1;
		if (tick ~= clantag_state.last_index) then
			clantag_state.last_index = tick;
			set_clantag(clantag_animation[tick]);
		end
	else
		set_clantag("");
	end
end
local function schematic_paint_tick()
	if (mo().hitmarker_enabled ~= false) then
		pcall(function()
			hitmarker:render();
		end);
	end
	local ok, err = pcall(function()
		PredictionSystem:handle_dragging();
		local target = client.current_threat();
		if (target and entity.is_alive(target)) then
			PredictionSystem:update(target);
		end
		PredictionSystem:render_indicator();
	end);
	if not ok then
		client.color_log(255, 0, 0, string.format("[Prediction Error] %s", tostring(err)));
	end
	pcall(on_paint);
	schematic_trashtalk_clantag_paint();
end
client.set_event_callback("paint", schematic_paint_tick);
client.set_event_callback("shutdown", function()
	set_clantag("");
end);
local config_system = {version="4.2",author="Wiking |Resentvul |Losafaml",date="2026-04-10",menu_mapper={resolver_mode=menu.mode,resolver_features=menu.features,resolver_conditions=menu.conditions,resolver_misses=menu.misses,resolver_stages=menu.stages,resolver_adapt_scale=(menu.adapt_scale or menu.pred_scale),resolver_enable=menu.enable,resolver_threshold=menu.threshold,prediction_enable=prediction.enabled,prediction_mode=prediction.mode,prediction_accuracy=prediction.accuracy,prediction_reaction=prediction.reaction,prediction_learning=prediction.learning,prediction_indicator=prediction.indicator,prediction_indicator_style=prediction.indicator_style,prediction_hotkey=prediction.hotkey},presets={["1v1"]={resolver_mode="Aggressive",resolver_features={"Smart Bruteforce","Break LC Detection","Dynamic Angles"},resolver_conditions={"Stand","Move","Walk","Crouch","Crouch+Move","Air","Air+Crouch"},resolver_misses=1,resolver_stages=7,resolver_adapt_scale=95,resolver_threshold=8,prediction_enable=true,prediction_mode="Aggressive",prediction_accuracy=90,prediction_reaction=30,prediction_learning=90,prediction_indicator=true,prediction_indicator_style="Advanced"},["2v2"]={resolver_mode="Optimal",resolver_features={"Smart Bruteforce","Break LC Detection","Dynamic Angles"},resolver_conditions={"Stand","Move","Walk","Crouch","Crouch+Move","Air","Air+Crouch"},resolver_misses=2,resolver_stages=5,resolver_adapt_scale=85,resolver_threshold=5,prediction_enable=true,prediction_mode="Dynamic",prediction_accuracy=80,prediction_reaction=45,prediction_learning=75,prediction_indicator=true,prediction_indicator_style="Standard"},["3v3"]={resolver_mode="Safe",resolver_features={"Smart Bruteforce","Break LC Detection","Dynamic Angles"},resolver_conditions={"Stand","Move","Walk","Crouch","Crouch+Move","Air","Air+Crouch"},resolver_misses=3,resolver_stages=4,resolver_adapt_scale=70,resolver_threshold=3,prediction_enable=true,prediction_mode="Adaptive",prediction_accuracy=70,prediction_reaction=60,prediction_learning=65,prediction_indicator=true,prediction_indicator_style="Minimal"},Community={resolver_mode="Maximum",resolver_features={"Smart Bruteforce","Break LC Detection","Dynamic Angles"},resolver_conditions={"Stand","Move","Walk","Crouch","Crouch+Move","Air","Air+Crouch"},resolver_misses=2,resolver_stages=8,resolver_adapt_scale=100,resolver_threshold=10,prediction_enable=true,prediction_mode="Maximum",prediction_accuracy=100,prediction_reaction=20,prediction_learning=100,prediction_indicator=true,prediction_indicator_style="Advanced"},Custom={resolver_mode="Optimal",resolver_features={"Smart Bruteforce","Break LC Detection","Dynamic Angles"},resolver_conditions={"Stand","Move","Walk","Crouch","Crouch+Move","Air","Air+Crouch"},resolver_misses=2,resolver_stages=5,resolver_adapt_scale=85,resolver_threshold=5,prediction_enable=true,prediction_mode="Dynamic",prediction_accuracy=75,prediction_reaction=50,prediction_learning=75,prediction_indicator=true,prediction_indicator_style="Standard"}},current="Custom",_ensure_systems_enabled=function(self)
end,save_custom_config=function(self)
	local o = mo();
	self.presets['Custom'] = {resolver_mode=o.resolver_mode,resolver_features=o.resolver_features,resolver_conditions=o.resolver_conditions,resolver_misses=o.brute_misses,resolver_stages=o.brute_stages,resolver_adapt_scale=o.pred_scale_resolver,resolver_enable=o.enable_resolver,resolver_threshold=o.defensive_thresh,prediction_enable=o.prediction_enabled,prediction_mode=o.prediction_mode,prediction_accuracy=o.prediction_accuracy,prediction_reaction=o.prediction_reaction,prediction_learning=o.prediction_learning,prediction_indicator=o.prediction_indicator,prediction_indicator_style=o.prediction_indicator_style};
	client.color_log((COLORS and COLORS.accent[1]) or 217, (COLORS and COLORS.accent[2]) or 77, (COLORS and COLORS.accent[3]) or 77, "[$chematic Config] Custom configuration saved successfully!");
	return true;
end,apply_config=function(self, config_name)
	if not self.presets[config_name] then
		return false;
	end
	local config = self.presets[config_name];
	self:_ensure_systems_enabled();
	apply_preset_to_options(config);
	if (PredictionSystem and (config_name ~= "Custom")) then
		client.delay_call(0.2, function()
			local threshold, cooldown;
			if ((config_name == "1v1") or (config_name == "Community")) then
				threshold, cooldown = 2.5, 1;
			elseif (config_name == "2v2") then
				threshold, cooldown = 3, 1.5;
			else
				threshold, cooldown = 3.5, 2;
			end
			PredictionSystem._anomaly_defaults.threshold = threshold;
			PredictionSystem._anomaly_defaults.cooldown = cooldown;
			for _, d in next, PredictionSystem.data do
				if d.anomaly then
					d.anomaly.threshold = threshold;
					d.anomaly.cooldown = cooldown;
				end
			end
			if PredictionSystem.animations then
				PredictionSystem.animations.fade = 1;
			end
			if (update_prediction_visibility and (type(update_prediction_visibility) == "function")) then
				update_prediction_visibility();
			end
		end);
	end
	client.delay_call(0.1, function()
		self:_ensure_systems_enabled();
	end);
	self.current = config_name;
	client.color_log((COLORS and COLORS.accent[1]) or 217, (COLORS and COLORS.accent[2]) or 77, (COLORS and COLORS.accent[3]) or 77, string.format("[$chematic Config] %s configuration applied!", config_name));
	return true;
end};
resolver = resolver or {};
local function get_accent_colors()
	if (COLORS and COLORS.accent) then
		return COLORS.accent[1], COLORS.accent[2], COLORS.accent[3];
	end
	return 217, 77, 77;
end
if resolver then
	resolver.config_system = config_system;
end
if prediction then
	prediction.config_system = config_system;
end
local function initialize_systems()
	local current_config = mo().config_preset or "Custom";
	if (current_config ~= "Custom") then
		config_system:apply_config(current_config);
	end
	local r, g, b = get_accent_colors();
	client.color_log(r, g, b, "[$chematic] Prediction & Resolver systems initialized");
	client.color_log(r, g, b, string.format("[$chematic] Current configuration: %s", current_config));
end
client.delay_call(0.5, function()
	initialize_systems();
end);
local _ensure_timer_active = true;
local function ensure_systems_timer()
	if not _ensure_timer_active then
		return;
	end
	client.delay_call(60, ensure_systems_timer);
end
client.set_event_callback("shutdown", function()
	_ensure_timer_active = false;
end);
client.set_event_callback("level_init", function()
	resolver.data = {};
	PredictionSystem.data = {};
	_ensure_timer_active = true;
end);
client.set_event_callback("round_start", function()
	resolver.data = {};
	PredictionSystem.data = {};
	client.color_log(COLORS.accent[1], COLORS.accent[2], COLORS.accent[3], "[$chematic] Round started — resolver/prediction data reset");
end);
ensure_systems_timer();
client.delay_call(2, function()
	if (PredictionSystem and PredictionSystem.animations and (PredictionSystem.animations.fade < 0.5)) then
		PredictionSystem.animations.fade = 1;
		client.color_log(get_accent_colors(), "[$chematic] Fixed prediction system visibility");
	end
end);