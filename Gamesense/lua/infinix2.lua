


			local j = setmetatable({}, { __index = function() return function() return false end end });

			(function()
				if rawget(_G, 'vector') == nil then

					local y, Q = pcall(require, "vector");

					if y and (Q ~= nil) then

						_G.vector = Q;

					else

						local y, Q = pcall(require, 'gamesense/vector');

						if y and (Q ~= nil) then

							_G.vector = Q;

						end;

					end;

				end;

				if rawget(_G, "vector") == nil then

					local y = {

						__index = {

							lengthsqr = function(Q)

								local b, l, V = Q.x or 0, Q.y or 0, Q.z or 0;

								return (b * b) + (l * l) + (V * V);

							end

						}

					};

					function y.__sub(Q, b)

						return setmetatable({

							x = ((Q.x or 0) - (b.x or 0)),

							y = ((Q.y or 0) - (b.y or 0)),

							z = ((Q.z or 0) - (b.z or 0))

						}, y);

					end;

					function _G.vector(Q, b, l)

						return setmetatable({

							x = (Q or 0),

							y = (b or 0),

							z = (l or 0)

						}, y);

					end;

				end;

			end)();

			local y = unpack or table.unpack;

			local Q = 0;

			local function b(l)

				Q = Q + 1;

				return (l or "") .. string.rep(" ", Q);

			end;

			local function Q(l, ...)

				local V, q = pcall(l, ...);

				if V and (q ~= nil) then

					return q;

				end;

				return nil;

			end;

			local function l( ...)

				local V, q, O = pcall(ui.reference, ...);

				if not V then

					return nil, nil;

				end;

				return q, O;

			end;

			local function V(q)

				if q == nil then

					return nil;

				end;

				local O, E = pcall(ui.get, q);

				if not O then

					return nil;

				end;

				return E;

			end;

			local function q(O, E)

				if (O == nil) or (E == nil) or (ui.menu_position == nil) or (ui.menu_size == nil) then

					return false;

				end;

				local a, s, z = pcall(ui.menu_position);

				local h, _, c = pcall(ui.menu_size);

				if (not a) or (not h) then

					return false;

				end;

				if (type(s) ~= 'number') or (type(z) ~= "number") or (type(_) ~= "number") or (type(c) ~= 'number') then

					return false;

				end;

				return (O >= s) and (O <= (s + _)) and (E >= z) and (E <= (z + c));

			end;

			local O = {};

			local E = nil;

			local a = 0;

			local s = 0;

			local z, h = nil, nil;

			local function _(c)

				s = s + 1;

				for P in pairs(O) do

					O[P] = nil;

				end;

				if (type(c) == "number") and (c > a) then

					a = c;

				end;

			end;

			local function c(P, o)

				if P == nil then

					return;

				end;

				o = (o and true) or false;

				local m = tostring(P);

				if (a <= 0) and (O[m] == o) then

					return;

				end;

				O[m] = o;

				pcall(ui.set_visible, P, o);

			end;

			local function P(o, m)

				if o == nil then

					return;

				end;

				m = (m and true) or false;

				local B = tostring(o);

				O[B] = m;

				pcall(ui.set_visible, o, m);

			end;

			local function O(o, ...)

				if o == nil then

					return;

				end;

				pcall(ui.set, o, ...);

			end;

			local function o(m, B)

				if (m == nil) or (B == nil) then

					return;

				end;

				pcall(ui.set_callback, m, B);

			end;

			INFINIX_DPI = rawget(_G, "INFINIX_DPI_STATE") or {

				ref = nil,

				on = false,

				scale = 1,

				flag = ''

			};

			rawset(_G, "INFINIX_DPI_STATE", INFINIX_DPI);

			function infinix_dpi_parse(m)

				if type(m) == "string" then

					local B = tonumber(m:match('(%d+%.?%d*)'));

					return (B and (B * 0.01)) or 1;

				end;

				if type(m) == "number" then

					return ((m > 10) and (m * 0.01)) or m;

				end;

				return 1;

			end;

			function infinix_dpi_refresh()

				local m = rawget(_G, 'INFINIX_DPI_SCALING') ~= false;

				local B = 1;

				if m and (INFINIX_DPI.ref ~= nil) then

					local M, g = pcall(ui.get, INFINIX_DPI.ref);

					if M then

						B = infinix_dpi_parse(g);

					end;

				end;

				if (type(B) ~= "number") or (B <= 0) then

					B = 1;

				end;

				INFINIX_DPI.on = m and (B ~= 1);

				INFINIX_DPI.scale = (INFINIX_DPI.on and B) or 1;

				INFINIX_DPI.flag = (INFINIX_DPI.on and "d") or "";

			end;

			function infinix_dpi_bind(m)

				INFINIX_DPI.ref = m;

				infinix_dpi_refresh();

				if m ~= nil then

					o(m, infinix_dpi_refresh);

				end;

			end;

			function infinix_dpi_scale()

				return INFINIX_DPI.scale or 1;

			end;

			function infinix_dpi_round(m)

				return math.floor(((tonumber(m) or 0) * infinix_dpi_scale()) + 0.5);

			end;

			function infinix_dpi_screen_size()

				infinix_dpi_refresh();

				local m, B, M = pcall(client.screen_size);

				if not m then

					return nil, nil;

				end;

				local m = infinix_dpi_scale();

				if (type(B) ~= "number") or (type(M) ~= 'number') or (B <= 0) or (M <= 0) then

					return nil, nil;

				end;

				if m ~= 1 then

					return B / m, M / m;

				end;

				return B, M;

			end;

			function infinix_render_surface_ready()

				local m, B, M = pcall(client.screen_size);

				return m and (type(B) == "number") and (type(M) == 'number') and (B >= 64) and (M >= 64);

			end;

			function infinix_dpi_mouse_position()

				local m, B = ui.mouse_position();

				local M = infinix_dpi_scale();

				if (m ~= nil) and (B ~= nil) and (M ~= 1) then

					return m / M, B / M;

				end;

				return m, B;

			end;

			function infinix_dpi_measure_text(m, B)

				local M, g = renderer.measure_text(m, B);

				local m = infinix_dpi_scale();

				if m ~= 1 then

					return (M or 0) / m, (g or 0) / m;

				end;

				return M, g;

			end;

			function infinix_dpi_text(m, B, M, g, W, Y, H, X, ...)

				renderer.text(infinix_dpi_round(m), infinix_dpi_round(B), M, g, W, Y, (H or '') .. (INFINIX_DPI.flag or ''), X or 0, ...);

			end;

			function infinix_dpi_rectangle(m, B, M, g, W, Y, H, X)

				renderer.rectangle(infinix_dpi_round(m), infinix_dpi_round(B), infinix_dpi_round(M), infinix_dpi_round(g), W, Y, H, X);

			end;

			function infinix_dpi_gradient(m, B, M, g, ...)

				renderer.gradient(infinix_dpi_round(m), infinix_dpi_round(B), infinix_dpi_round(M), infinix_dpi_round(g), ...);

			end;

			function infinix_dpi_line(m, B, M, g, W, Y, H, X)

				renderer.line(infinix_dpi_round(m), infinix_dpi_round(B), infinix_dpi_round(M), infinix_dpi_round(g), W, Y, H, X);

			end;

			function infinix_dpi_texture(m, B, M, g, W, ...)

				renderer.texture(m, infinix_dpi_round(B), infinix_dpi_round(M), infinix_dpi_round(g), infinix_dpi_round(W), ...);

			end;

			function infinix_dpi_circle_outline(m, B, M, g, W, Y, H, ...)

				renderer.circle_outline(infinix_dpi_round(m), infinix_dpi_round(B), M, g, W, Y, infinix_dpi_round(H), ...);

			end;

			function infinix_dpi_circle(m, B, M, g, W, Y, H, ...)

				renderer.circle(infinix_dpi_round(m), infinix_dpi_round(B), M, g, W, Y, infinix_dpi_round(H), ...);

			end;

			function infinix_dpi_triangle(m, B, M, g, W, Y, H, X, p, C)

				renderer.triangle(infinix_dpi_round(m), infinix_dpi_round(B), infinix_dpi_round(M), infinix_dpi_round(g), infinix_dpi_round(W), infinix_dpi_round(Y), H, X, p, C);

			end;

			rawset(_G, "INFINIX_DPI_SCALING", true);

			function infinix_drag_screen_size()

				local m, B = infinix_dpi_screen_size();

				if (type(m) ~= 'number') or (m < 320) then

					m = 1920;

				end;

				if (type(B) ~= "number") or (B < 240) then

					B = 1080;

				end;

				return m, B;

			end;

			function infinix_drag_can_save()

				local m, B = client.screen_size();

				return (type(m) == 'number') and (type(B) == 'number') and (m >= 640) and (B >= 480);

			end;

			function infinix_drag_parse_abs(m, B, M)

				if type(m) ~= 'string' then

					return B, M;

				end;

				local g, W = m:match('^n:([%-%.%d]+),([%-%.%d]+)$');

				if (g ~= nil) and (W ~= nil) then

					local Y, H = infinix_drag_screen_size();

					return (tonumber(g) or 0) * Y, (tonumber(W) or 0) * H;

				end;

				local g, W = m:match("^(-?%d+),(-?%d+)$");

				return tonumber(g) or B, tonumber(W) or M;

			end;

			function infinix_drag_save_abs(m, B, M)

				if m == nil then

					return;

				end;

				if not infinix_drag_can_save() then

					return;

				end;

				local g, W = infinix_drag_screen_size();

				O(m, ('n:%.6f,%.6f'):format((tonumber(B) or 0) / g, (tonumber(M) or 0) / W));

			end;

			function infinix_drag_parse_center(m, B, M)

				if type(m) ~= "string" then

					return B, M;

				end;

				local g, W = m:match('^c:([%-%.%d]+),([%-%.%d]+)$');

				if (g ~= nil) and (W ~= nil) then

					local Y, H = infinix_drag_screen_size();

					return (tonumber(g) or 0) * Y, (tonumber(W) or 0) * H;

				end;

				local g, W = m:match("^(-?%d+),(-?%d+)$");

				return tonumber(g) or B, tonumber(W) or M;

			end;

			function infinix_drag_save_center(m, B, M)

				if m == nil then

					return;

				end;

				if not infinix_drag_can_save() then

					return;

				end;

				local g, W = infinix_drag_screen_size();

				O(m, ("c:%.6f,%.6f"):format((tonumber(B) or 0) / g, (tonumber(M) or 0) / W));

			end;

			function infinix_drag_anim_xy(m, B, M, g)

				if m == nil then

					return B, M;

				end;

				B, M = tonumber(B) or 0, tonumber(M) or 0;

				local W, Y = m.anim_x, m.anim_y;

				if (W == nil) or (Y == nil) or (math.abs(W - B) > 520) or (math.abs(Y - M) > 520) then

					m.anim_x, m.anim_y = B, M;

					return B, M;

				end;

				local H = (globals.absoluteframetime and globals.absoluteframetime()) or (globals.frametime and globals.frametime()) or 0.0083333333333333;

				if H < 0 then

					H = 0;

				end;

				if H > 0.08 then

					H = 0.08;

				end;

				local X = 1 - math.exp(- H * (tonumber(g) or 18));

				W = W + ((B - W) * X);

				Y = Y + ((M - Y) * X);

				if math.abs(W - B) < 0.05 then

					W = B;

				end;

				if math.abs(Y - M) < 0.05 then

					Y = M;

				end;

				m.anim_x, m.anim_y = W, Y;

				return W, Y;

			end;

			function infinix_drag_phase(m, B, M, g)

				if (m == nil) or (B == nil) then

					return (M and 1) or 0;

				end;

				local W = tonumber(m[B]) or 0;

				local Y = (M and 1) or 0;

				local M = (globals.absoluteframetime and globals.absoluteframetime()) or (globals.frametime and globals.frametime()) or 0.0083333333333333;

				if M < 0 then

					M = 0;

				end;

				if M > 0.08 then

					M = 0.08;

				end;

				local H = 1 - math.exp(- M * (tonumber(g) or 16));

				W = W + ((Y - W) * H);

				if math.abs(Y - W) < 0.004 then

					W = Y;

				end;

				m[B] = W;

				return W;

			end;

			local function m(B, M)

				B = tostring(B or '');

				M = M or 24;

				local g = math.max(0, M - # B);

				local M = math.floor(g / 2);

				local W = g - M;

				return string.rep(" ", M) .. B .. string.rep(" ", W);

			end;

			local function B()

			end;

			local function M()

			end;

			INFINIX_DRAG_BLOCK_ATTACK = false;

			local function g( ...)

				if (plist == nil) or (plist.set == nil) then

					return false;

				end;

				return pcall(plist.set, ...);

			end;

			local function W( ...)

				if (plist == nil) or (plist.get == nil) then

					return nil;

				end;

				local Y, H = pcall(plist.get, ...);

				if Y then

					return H;

				end;

				return nil;

			end;

			local Y = {

				state = {},

				defaults = {

					['Force Body Yaw'] = false,

					['Force Body Yaw Value'] = 0,

					['Prefer safepoint'] = false,

					["Correction Active"] = false,

					['Minimum damage'] = 0,

					["Override prefer body aim"] = '-',

					['Override safe point'] = '-'

				},

				keys = {

					"Force Body Yaw",

					"Force Body Yaw Value",

					"Prefer safepoint",

					"Correction Active",

					"Minimum damage",

					"Override prefer body aim",

					'Override safe point'

				}

			};

			local function H(X)

				local p = Y.defaults[X];

				if p ~= nil then

					return p;

				end;

				return "-";

			end;

			local function X(p)

				if p == nil then

					return nil;

				end;

				local C = Y.state[p];

				if C == nil then

					C = {

						requests = {},

						owned = {},

						backup = {},

						applied = {},

						reasons = {}

					};

					Y.state[p] = C;

				end;

				return C;

			end;

			function Y.begin_player(p, C)

				local D = X(p);

				if D == nil then

					return nil;

				end;

				if C == nil then

					for p in pairs(D.requests) do

						D.requests[p] = nil;

					end;

					for p in pairs(D.reasons) do

						D.reasons[p] = nil;

					end;

				else

					C = tostring(C);

					for p, N in pairs(D.requests) do

						if (type(N) == "table") and (N.owner == C) then

							D.requests[p] = nil;

							D.reasons[p] = nil;

						end;

					end;

				end;

				return D;

			end;

			function Y.request(p, C, D, N, L, G)

				if (p == nil) or (D == nil) or (N == nil) then

					return false;

				end;

				local v = X(p);

				if v == nil then

					return false;

				end;

				L = tonumber(L) or 0;

				C = tostring(C or 'unknown');

				local X = v.requests[D];

				if (X == nil) or (L >= (X.priority or 0)) then

					v.requests[D] = {

						owner = C,

						value = N,

						priority = L,

						reason = tostring(G or C)

					};

				end;

				return true;

			end;

			function Y.apply_player(X)

				local p = Y.state[X];

				if p == nil then

					return;

				end;

				for C = 1, # Y.keys do

					local D = Y.keys[C];

					local C = p.requests[D];

					if C ~= nil then

						if not p.owned[D] then

							local N = W(X, D);

							p.backup[D] = ((N == nil) and H(D)) or N;

							p.owned[D] = true;

						end;

						if p.applied[D] ~= C.value then

							g(X, D, C.value);

							p.applied[D] = C.value;

						end;

						p.reasons[D] = C.reason;

					elseif p.owned[D] then

						local C = p.backup[D];

						if C == nil then

							C = H(D);

						end;

						g(X, D, C);

						p.owned[D], p.backup[D], p.applied[D], p.reasons[D] = nil, nil, nil, nil;

					end;

				end;

			end;

			function Y.clear_key(X, p, C)

				local D = Y.state[X];

				if D == nil then

					return;

				end;

				if C ~= nil then

					local N = D.requests[p];

					if (type(N) ~= "table") or (N.owner ~= tostring(C)) then

						return;

					end;

				end;

				D.requests[p] = nil;

				D.reasons[p] = nil;

				if D.owned[p] then

					local C = D.backup[p];

					if C == nil then

						C = H(p);

					end;

					g(X, p, C);

					D.owned[p], D.backup[p], D.applied[p] = nil, nil, nil;

				end;

			end;

			function Y.clear_player(g)

				local H = Y.state[g];

				if H == nil then

					return;

				end;

				for H = 1, # Y.keys do

					Y.clear_key(g, Y.keys[H]);

				end;

				Y.state[g] = nil;

			end;

			function Y.clear_all()

				local g = {};

				for H in pairs(Y.state) do

					g[# g + 1] = H;

				end;

				for H = 1, # g do

					Y.clear_player(g[H]);

				end;

			end;

			function Y.clear_owner(g)

				g = tostring(g or "");

				if g == "" then

					return;

				end;

				local H = {};

				for X in pairs(Y.state) do

					H[# H + 1] = X;

				end;

				for X = 1, # H do

					local p = H[X];

					local H = Y.state[p];

					if type(H) == "table" then

						for X, C in pairs(H.requests) do

							if (type(C) == "table") and (C.owner == g) then

								Y.clear_key(p, X, g);

							end;

						end;

					end;

				end;

			end;

			function Y.clear_key_all(g)

				for H in pairs(Y.state) do

					Y.clear_key(H, g);

				end;

			end;

			function Y.apply_all()

				for g in pairs(Y.state) do

					Y.apply_player(g);

				end;

			end;

			function Y.prune()

				local g = {};

				for H in pairs(Y.state) do

					local X = false;

					if (type(H) == 'number') and (entity ~= nil) and (entity.is_alive ~= nil) then

						local p, C = pcall(entity.is_alive, H);

						X = p and (C == true);

					end;

					if not X then

						g[# g + 1] = H;

					end;

				end;

				for H = 1, # g do

					Y.clear_player(g[H]);

				end;

			end;

			function Y.peek_key(g, H)

				local X = ((g ~= nil) and Y.state[g]) or nil;

				if (X == nil) or (H == nil) then

					return nil;

				end;

				local g = X.requests[H];

				if type(g) == 'table' then

					return g.value, g.owner, g.reason, g.priority, 'request';

				end;

				if X.applied[H] ~= nil then

					return X.applied[H], nil, X.reasons[H], nil, "applied";

				end;

				return nil;

			end;

			INFINIX = INFINIX or {};

			INFINIX.rage_decision = Y;

			local function g(H, X)

				if H == nil then

					return false;

				end;

				local p, C = pcall(ui.get, H);

				if (not p) or (type(C) ~= "table") then

					return false;

				end;

				for H, H in ipairs(C) do

					if H == X then

						return true;

					end;

				end;

				return false;

			end;

			local function H(X, p, C)

				if X < p then

					return p;

				end;

				if X > C then

					return C;

				end;

				return X;

			end;

			local function X(p, C, D)

				local N = D - C;

				if N <= 0 then

					return p;

				end;

				while p < C do

					p = p + N;

				end;

				while p > D do

					p = p - N;

				end;

				return p;

			end;

			local function p(C)

				C = C % 360;

				if C > 180 then

					C = C - 360;

				end;

				return C;

			end;

			local function C(D, N, L)

				return D + ((N - D) * L);

			end;

			local D = 0;

			local N = false;

			local L = 0;

			local function G()

				N = true;

				local v = (globals.realtime and globals.realtime()) or 0;

				L = v + 0.08;

			end;

			local function v()

				local r = globals.absoluteframetime or globals.frametime;

				local T = (r and r()) or 0.016;

				if T < 0 then

					T = 0;

				end;

				if T > 0.1 then

					T = 0.1;

				end;

				local r = (globals.realtime and globals.realtime()) or 0;

				local w = ((N or (r < L)) and 1) or 0;

				N = false;

				local N = ((w == 1) and 6.5) or 4.5;

				D = C(D, w, H(T * N, 0, 1));

				if D <= 0.005 then

					return;

				end;

				local N, L = client.screen_size();

				if (N == nil) or (L == nil) then

					return;

				end;

				local r = D;

				r = r * r * (3 - (2 * r));

				renderer.rectangle(0, 0, N, L, 8, 8, 8, math.floor((92 * r) + 0.5));

			end;

			local function D(N, L, r, T, w, n, u, e, J)

				w = w or 3;

				if (r <= (w * 2)) or (T <= (w * 2)) then

					renderer.rectangle(N, L, r, 1, n, u, e, J);

					renderer.rectangle(N, L + T, r, 1, n, u, e, J);

					renderer.rectangle(N, L, 1, T, n, u, e, J);

					renderer.rectangle(N + r, L, 1, T, n, u, e, J);

					return;

				end;

				renderer.rectangle(N + w, L, r - (w * 2), 1, n, u, e, J);

				renderer.rectangle(N + w, L + T, r - (w * 2), 1, n, u, e, J);

				renderer.rectangle(N, L + w, 1, T - (w * 2), n, u, e, J);

				renderer.rectangle(N + r, L + w, 1, T - (w * 2), n, u, e, J);

				if type(renderer.circle_outline) == 'function' then

					renderer.circle_outline(N + w, L + w, n, u, e, J, w, 180, 0.25, 1);

					renderer.circle_outline((N + r) - w, L + w, n, u, e, J, w, 270, 0.25, 1);

					renderer.circle_outline((N + r) - w, (L + T) - w, n, u, e, J, w, 0, 0.25, 1);

					renderer.circle_outline(N + w, (L + T) - w, n, u, e, J, w, 90, 0.25, 1);

				else

					renderer.rectangle(N + 1, L + 1, 1, 1, n, u, e, J);

					renderer.rectangle((N + r) - 1, L + 1, 1, 1, n, u, e, J);

					renderer.rectangle((N + r) - 1, (L + T) - 1, 1, 1, n, u, e, J);

					renderer.rectangle(N + 1, (L + T) - 1, 1, 1, n, u, e, J);

				end;

			end;

			function infinix_dpi_rounded_outline(N, L, r, T, w, n, u, e, J)

				local K = infinix_dpi_scale();

				D(math.floor(((N or 0) * K) + 0.5), math.floor(((L or 0) * K) + 0.5), math.floor(((r or 0) * K) + 0.5), math.floor(((T or 0) * K) + 0.5), math.floor(((w or 3) * K) + 0.5), n, u, e, J);

			end;

			local function D(N, L)

				if (N == nil) or (L == nil) then

					return 0;

				end;

				if N == L then

					return N;

				end;

				if N > L then

					N, L = L, N;

				end;

				return math.random(math.floor(N), math.floor(L));

			end;

			function _G.INFINIX_DT_RELAXING(N)

				return (N or globals.tickcount()) < (rawget(_G, 'INFINIX_DT_RELAX_UNTIL') or 0);

			end;

			local function N(L, r, T)

				local w = math.sqrt((L * L) + (r * r));

				local n = math.deg(math.atan2(- T, w));

				local T = math.deg(math.atan2(r, L));

				return n, T;

			end;

			local function L(r, T, w)

				return ('\a%02X%02X%02XFF'):format(r, T, w);

			end;

			local r = {

				'home',

				"anti-aim",

				'ragebot',

				'visuals',

				'misc',

				"config"

			};

			local T = {

				home = {},

				["anti-aim"] = {

					'settings',

					"builder",

					"hotkeys"

				},

				ragebot = {},

				visuals = {},

				misc = {},

				config = {}

			};

			local w = {

				"global",

				'standing',

				'moving',

				'slow walk',

				'crouch',

				'move-crouch',

				'air',

				'air-crouch',

				"shared"

			};

			local n = {

				global = "gl",

				standing = "st",

				moving = 'mv',

				["slow walk"] = "sw",

				crouch = "cr",

				['move-crouch'] = "mc",

				air = "ar",

				['air-crouch'] = "ac",

				shared = 'sh'

			};

			local u = {

				155,

				213,

				60,

				255

			};

			local e;

			local J;

			local K = {

				155,

				213,

				60,

				255

			};

			local f = - 1.0;

			local function i()

				f = - 1.0;

			end;

			local function U()

				local x = (j[29] and j[29]()) or - 2.0;

				if x ~= f then

					f = x;

					if (e ~= nil) and (J ~= nil) then

						local f = V(e);

						if f == true then

							local f, x, t, A, S = pcall(ui.get, J);

							if f and (type(x) == 'number') then

								K[1] = x;

								K[2] = t;

								K[3] = A;

								K[4] = S or 255;

								return x, t, A, S or 255;

							end;

						end;

					end;

					local f = u;

					K[1] = f[1];

					K[2] = f[2];

					K[3] = f[3];

					K[4] = f[4];

				end;

				return K[1], K[2], K[3], K[4];

			end;

			local u = {};

			local K = {

				'Enabled',

				"Pitch",

				"Yaw base",

				"Yaw",

				"Yaw jitter",

				"Body yaw",

				"Freestanding body yaw",

				"Edge yaw",

				"Freestanding",

				'Roll'

			};

			local function f(x, t, A)

				if A == nil then

					return;

				end;

				local S = tostring(A);

				if t[S] then

					return;

				end;

				t[S] = true;

				x[# x + 1] = A;

			end;

			local function x()

				local t, A = u, {};

				u = {};

				for S = 1, # t do

					f(u, A, t[S]);

				end;

				for t = 1, # K do

					local S, d, R, k, I, F, Z = pcall(ui.reference, "AA", "Anti-aimbot angles", K[t]);

					if S then

						f(u, A, d);

						f(u, A, R);

						f(u, A, k);

						f(u, A, I);

						f(u, A, F);

						f(u, A, Z);

					end;

				end;

			end;

			x();

			local K = 0;

			local function t(A)

				local S = (globals.realtime and globals.realtime()) or 0;

				if A and (S >= (rawget(_G, "INFINIX_NATIVE_REFRESH_NEXT") or 0)) then

					x();

					rawset(_G, 'INFINIX_NATIVE_REFRESH_NEXT', S + 0.12);

				end;

				local x = A == true;

				if (not x) and (S >= (rawget(_G, "INFINIX_NATIVE_HIDE_NEXT") or 0)) then

					x = true;

				end;

				if x then

					rawset(_G, "INFINIX_NATIVE_HIDE_NEXT", S + 0.08);

				end;

				for A, A in ipairs(u) do

					if x then

						P(A, false);

					else

						c(A, false);

					end;

				end;

			end;

			local function x(A, S, d)

				local R, k, I, F, Z = pcall(ui.reference, A, S, d);

				local A = {};

				if R then

					if k ~= nil then

						A[# A + 1] = k;

					end;

					if I ~= nil then

						A[# A + 1] = I;

					end;

					if F ~= nil then

						A[# A + 1] = F;

					end;

					if Z ~= nil then

						A[# A + 1] = Z;

					end;

				end;

				return A;

			end;

			local A = {

				["anti-aim.hotkeys"] = {

					slow_motion = x("AA", 'Other', 'Slow motion'),

					leg_movement = x('AA', "Other", "Leg movement"),

					on_shot_aa = x('AA', "Other", "On shot anti-aim"),

					fake_peek = x('AA', "Other", 'Fake peek')

				},

				["anti-aim.settings"] = {

					fl_enabled = x('AA', 'Fake lag', 'Enabled'),

					fl_amount = x("AA", "Fake lag", "Amount"),

					fl_variance = x('AA', 'Fake lag', 'Variance'),

					fl_limit = x("AA", 'Fake lag', 'Limit')

				}

			};

			local x = {};

			for S, S in pairs(A) do

				for d, d in pairs(S) do

					for S, S in ipairs(d) do

						x[# x + 1] = S;

					end;

				end;

			end;

			local function S(d)

				for R, R in ipairs(u) do

					P(R, d);

				end;

				for R, R in ipairs(x) do

					P(R, d);

				end;

			end;

			local function x(d)

				for R, k in pairs(A) do

					local I = R == d;

					for d, d in pairs(k) do

						for R, R in ipairs(d) do

							if I then

								c(R, true);

							else

								c(R, false);

							end;

						end;

					end;

				end;

			end;

			local d = false;

			local R = false;

			local k = {};

			local I;

			local function F(Z)

				if d and (not R) then

					return string.rep(string.char(226, 128, 190), Z);

				end;

				return string.rep("-", Z);

			end;

			local function Z()

				return 26;

			end;

			local yK = function()

			end;

			local function jK()

				local QK = (globals.realtime and globals.realtime()) or 0;

				local bK = math.abs(((QK * 0.5) % 2) - 1);

				bK = bK * bK;

				return bK * bK;

			end;

			local function QK(bK, lK, VK)

				return math.floor(bK + ((lK - bK) * VK) + 0.5);

			end;

			local function bK()

				local lK, VK, qK = U();

				local OK = jK();

				return L(QK(53, lK, OK), QK(53, VK, OK), QK(53, qK, OK));

			end;

			local function jK()

				local QK = bK();

				return '' .. '\a3A3A3AFF----------  ' .. QK .. "infinix\aFFFFFFFF repaste\a3A3A3AFF  ----------";

			end;

			local QK = ui.new_label("AA", "Anti-aimbot angles", jK());

			local lK = function()

			end;

			local function VK(qK)

				if qK ~= true then

					i();

				end;

				O(QK, jK());

				lK();

				yK();

			end;

			local function i()

				if d or R then

					return;

				end;

				d = true;

				local qK = pcall(ui.set, QK, jK());

				if not qK then

					d = false;

					R = true;

					O(QK, jK());

					return;

				end;

				yK();

				if I ~= nil then

					local d = I();

					for R = 1, # k do

						O(k[R], d);

					end;

				end;

			end;

			local function d()

				return ui.new_label("AA", 'Anti-aimbot angles', b(""));

			end;

			d();

			local R = ui.new_combobox('AA', "Anti-aimbot angles", 'section', r);

			local jK = {};

			for QK, QK in ipairs(r) do

				local qK = T[QK] or {};

				if # qK > 0 then

					jK[QK] = ui.new_combobox('AA', "Anti-aimbot angles", b("subsection"), qK);

				end;

			end;

			d();

			local d = {

				last_pulse = - 1.0,

				last_path = ""

			};

			local QK = {

				['home._flat'] = {

					'home',

					'loader user and build info'

				},

				['anti-aim.settings'] = {

					"anti-aim / settings",

					'safety, fakelag and movement tools'

				},

				['anti-aim.builder'] = {

					'anti-aim / builder',

					"state based yaw, body yaw and delay controls"

				},

				['anti-aim.hotkeys'] = {

					"anti-aim / hotkeys",

					"manual yaw, freestanding and native binds"

				},

				["ragebot._flat"] = {

					"ragebot tools",

					'resolver, interpolate improve, head aim fix and ai peek'

				},

				['visuals._flat'] = {

					'visual layer',

					"accent, indicators, logs and view settings"

				},

				["misc._flat"] = {

					'miscellaneous',

					'utility, animation and quality-of-life modules'

				},

				["config._flat"] = {

					"profiles",

					'local presets and import/export tools'

				}

			};

			function I()

				return bK() .. F(Z());

			end;

			local function F(Z, qK)

				local OK = Q(ui.new_label, Z, qK, I());

				if OK ~= nil then

					k[# k + 1] = OK;

				end;

				return OK;

			end;

			local function Z()

				if I == nil then

					return;

				end;

				local qK = I();

				for OK = 1, # k do

					O(k[OK], qK);

				end;

			end;

			local k = Q(ui.new_label, "AA", 'Anti-aimbot angles', "");

			local qK = Q(ui.new_label, 'AA', 'Anti-aimbot angles', I());

			local OK = Q(ui.new_label, 'AA', 'Anti-aimbot angles', "");

			local EK = {

				['home._flat'] = true,

				["anti-aim.builder"] = true,

				['anti-aim.hotkeys'] = true,

				["anti-aim.settings"] = true,

				["ragebot._flat"] = true,

				["visuals._flat"] = true,

				["misc._flat"] = true,

				['config._flat'] = true

			};

			local aK = {};

			for sK, sK in ipairs(r) do

				aK[sK] = {};

				local zK = T[sK];

				if (zK == nil) or (# zK == 0) then

					local T = sK .. "._flat";

					if EK[T] then

						aK[sK]._flat = {};

					else

						aK[sK]._flat = {

							placeholder = ui.new_label('AA', 'Anti-aimbot angles', "\a808080FF  [" .. sK .. ']  empty' .. b(""))

						};

					end;

				else

					for T, T in ipairs(zK) do

						local zK = sK .. '.' .. T;

						if EK[zK] then

							aK[sK][T] = {};

						else

							aK[sK][T] = {

								placeholder = ui.new_label('AA', "Anti-aimbot angles", "\a808080FF  [" .. sK .. " / " .. T .. "]  empty" .. b(''))

							};

						end;

					end;

				end;

			end;

			do

				local T = aK.home and aK.home._flat;

				local EK, sK = "-", '-';

				local function zK()

					local hK, _K, cK = U();

					return '\a777777FF user:  CodeBreakers & LordHakkai (Rinnegan.lua)';

				end;

				local function hK()

					local _K, cK, PK = U();

					return "\a777777FF build: Cracked";

				end;

				local _K = Q(ui.new_label, "AA", "Anti-aimbot angles", zK());

				local zK = Q(ui.new_label, "AA", 'Anti-aimbot angles', hK());

				if T ~= nil then

					T.user = _K;

					T.build = zK;

				end;

				local function T(hK)

					if type(hK) == 'string' then

						if hK ~= "" then

							return hK;

						end;

					elseif (type(hK) == "number") or (type(hK) == 'boolean') then

						return tostring(hK);

					end;

					return nil;

				end;

				local function hK()

					return T(_USER_NAME) or T(rawget(_G, "_USER_NAME")) or 'CodeBreakers & LordHakkai (Rinnegan.lua)';

				end;

				local function cK(PK)

					local oK = T(PK);

					if oK == nil then

						return nil;

					end;

					local PK = string.lower(oK);

					if (PK == "beta") or (PK:find('beta', 1, true) ~= nil) then

						return "beta";

					end;

					if (PK == "stable") or (PK:find('stable', 1, true) ~= nil) then

						return 'stable';

					end;

					return nil;

				end;

				local function PK()

					local oK = _SCRIPT_NAME or rawget(_G, "_SCRIPT_NAME");

					return cK(oK) or T(oK) or 'Cracked';

				end;

				local function T()

					local cK, oK, mK = U();

					return '\a777777FF user:  ' .. L(cK, oK, mK) .. EK;

				end;

				local function cK()

					local oK, mK, BK = U();

					return '\a777777FF build: ' .. L(oK, mK, BK) .. sK;

				end;

				function lK()

					EK = hK();

					sK = PK();

					O(_K, T());

					O(zK, cK());

				end;

				lK();

			end;

			local T = Q(ui.new_combobox, 'AA', 'Anti-aimbot angles', "state ~", w);

			local lK = F('AA', "Anti-aimbot angles");

			INFINIX_PRESET_MODE_NOTE_1 = Q(ui.new_label, 'AA', 'Anti-aimbot angles', "\a777777FFyou use presset mode.");

			INFINIX_PRESET_MODE_NOTE_2 = Q(ui.new_label, "AA", 'Anti-aimbot angles', '\a777777FFload local cfg to access the builder.');

			c(INFINIX_PRESET_MODE_NOTE_1, false);

			c(INFINIX_PRESET_MODE_NOTE_2, false);

			aK["anti-aim"].builder.state_combo = T;

			aK["anti-aim"].builder.preset_mode_note_1 = INFINIX_PRESET_MODE_NOTE_1;

			aK["anti-aim"].builder.preset_mode_note_2 = INFINIX_PRESET_MODE_NOTE_2;

			function infinix_is_preset_mode()

				return rawget(_G, 'INFINIX_PRESET_MODE') == true;

			end;

			function infinix_set_preset_mode(EK)

				rawset(_G, "INFINIX_PRESET_MODE", EK == true);

			end;

			local EK = {};

			local sK = {};

			local zK = {};

			local hK = {};

			local _K = {};

			hK.pre_render = {};

			hK.pre_config_save = {};

			hK.runtime_errors = {};

			local cK = {};

			function cK.set_event_callback(cK, PK, oK)

				if (client == nil) or (type(PK) ~= 'function') then

					return false;

				end;

				local mK = (oK and client.set_event_callback) or client.unset_event_callback;

				if type(mK) ~= "function" then

					return false;

				end;

				return pcall(mK, cK, PK);

			end;

			function hK.safe_call(cK, PK, ...)

				if type(PK) ~= "function" then

					return nil;

				end;

				local oK, mK, BK, MK, gK = pcall(PK, ...);

				if not oK then

					local oK = tostring(cK or PK);

					if not hK.runtime_errors[oK] then

						hK.runtime_errors[oK] = true;

						pcall(client.color_log, 255, 90, 90, '[infinix recode]' .. " " .. oK .. ': ' .. tostring(mK));

					end;

					return nil;

				end;

				return mK, BK, MK, gK;

			end;

			function hK.safe_call0(cK, PK)

				if type(PK) ~= "function" then

					return nil;

				end;

				local oK, mK, BK, MK, gK = pcall(PK);

				if not oK then

					local oK = tostring(cK or PK);

					if not hK.runtime_errors[oK] then

						hK.runtime_errors[oK] = true;

						pcall(client.color_log, 255, 90, 90, '[infinix recode]' .. " " .. oK .. ': ' .. tostring(mK));

					end;

					return nil;

				end;

				return mK, BK, MK, gK;

			end;

			function hK.safe_call1(cK, PK, oK)

				if type(PK) ~= "function" then

					return nil;

				end;

				local mK, BK, MK, gK, WK = pcall(PK, oK);

				if not mK then

					local oK = tostring(cK or PK);

					if not hK.runtime_errors[oK] then

						hK.runtime_errors[oK] = true;

						pcall(client.color_log, 255, 90, 90, '[infinix recode]' .. ' ' .. oK .. ': ' .. tostring(BK));

					end;

					return nil;

				end;

				return BK, MK, gK, WK;

			end;

			function hK.safe_call3(cK, PK, oK, mK, BK)

				if type(PK) ~= 'function' then

					return nil;

				end;

				local MK, gK, WK, YK, HK = pcall(PK, oK, mK, BK);

				if not MK then

					local oK = tostring(cK or PK);

					if not hK.runtime_errors[oK] then

						hK.runtime_errors[oK] = true;

						pcall(client.color_log, 255, 90, 90, '[infinix recode]' .. ' ' .. oK .. ': ' .. tostring(gK));

					end;

					return nil;

				end;

				return gK, WK, YK, HK;

			end;

			do

				local cK = aK.home and aK.home._flat;

				local PK = {

					version = 1,

					players = {}

				};

				local function oK(mK)

					if (type(mK) == "string") and (mK ~= "") then

						return mK;

					end;

					if (type(mK) == 'number') or (type(mK) == "boolean") then

						return tostring(mK);

					end;

					return nil;

				end;

				local function mK()

					return oK(_USER_NAME) or oK(rawget(_G, "_USER_NAME")) or "local";

				end;

				local function oK()

					if (database == nil) or (type(database.read) ~= "function") then

						return {

							version = 1,

							players = {}

						};

					end;

					local BK, MK = pcall(database.read, 'infinix_home_stats_v1');

					if BK and (type(MK) == 'table') then

						MK.version = 1;

						if type(MK.players) ~= "table" then

							MK.players = {};

						end;

						return MK;

					end;

					return {

						version = PK.version,

						players = {}

					};

				end;

				local function PK(BK)

					if (database == nil) or (type(database.write) ~= 'function') then

						return;

					end;

					pcall(database.write, "infinix_home_stats_v1", BK);

					if type(database.save) == "function" then

						pcall(database.save);

					end;

				end;

				local function BK(MK, gK)

					local WK = MK.players;

					local MK = WK[gK];

					if type(MK) ~= "table" then

						MK = {

							loads = 0,

							seconds = 0,

							kills = 0,

							evaded = 0,

							shots_hit = 0

						};

						WK[gK] = MK;

					end;

					MK.loads = tonumber(MK.loads) or 0;

					MK.seconds = tonumber(MK.seconds) or 0;

					MK.kills = tonumber(MK.kills) or 0;

					MK.evaded = tonumber(MK.evaded) or 0;

					MK.shots_hit = tonumber(MK.shots_hit) or 0;

					return MK;

				end;

				local MK = oK();

				local oK = mK();

				local mK = BK(MK, oK);

				local BK = (globals.realtime and globals.realtime()) or 0;

				local gK = BK;

				local WK, YK, HK = false, 0, 0;

				local XK = - 999.0;

				local pK = - 999.0;

				local CK = {};

				rawset(_G, "INFINIX_ENEMY_MISS_HOOKS", CK);

				mK.loads = mK.loads + 1;

				WK = true;

				local DK = Q(ui.new_label, "AA", 'Fake lag', '\aCDCDCDFFstatistics' .. b(''));

				local NK = F("AA", "Fake lag");

				local LK = Q(ui.new_label, 'AA', 'Fake lag', b(''));

				local GK = Q(ui.new_label, "AA", "Fake lag", b(""));

				local vK = Q(ui.new_label, 'AA', "Fake lag", b(""));

				local rK = Q(ui.new_label, "AA", "Fake lag", b(''));

				local TK = Q(ui.new_label, "AA", "Fake lag", b(''));

				if cK ~= nil then

					cK.stats_title = DK;

					cK.stats_rule = NK;

					cK.stats_time = LK;

					cK.stats_session = TK;

					cK.stats_kills = vK;

					cK.stats_hit = rK;

					cK.stats_evaded = GK;

				end;

				local function cK()

					local wK = (globals.realtime and globals.realtime()) or gK;

					local nK = wK - gK;

					if (nK > 0) and (nK < 3600) then

						mK.seconds = mK.seconds + nK;

						WK = true;

					end;

					gK = wK;

				end;

				local function wK(nK)

					nK = math.floor((tonumber(nK) or 0) + 0.5);

					local uK = math.floor(nK / 3600);

					local eK = math.floor((nK % 3600) / 60);

					local JK = nK % 60;

					return (((uK < 10) and "0") or '') .. tostring(uK) .. ":" .. (((eK < 10) and '0') or "") .. tostring(eK) .. ':' .. (((JK < 10) and "0") or '') .. tostring(JK);

				end;

				local function nK(uK, eK)

					local JK, KK, fK = U();

					return "\a606060FF" .. uK .. ":  " .. L(JK, KK, fK) .. tostring(eK);

				end;

				local function L()

					local uK = mK.seconds;

					local eK = (globals.realtime and globals.realtime()) or gK;

					if eK > gK then

						uK = uK + (eK - gK);

					end;

					local gK = eK - BK;

					if gK < 0 then

						gK = 0;

					end;

					O(DK, "\aCDCDCDFFstatistics");

					O(LK, nK('time played', wK(uK)));

					O(GK, nK('enemies missed you', mK.evaded));

					O(vK, nK('enemies killed', mK.kills));

					O(rK, nK("shots hit", mK.shots_hit));

					O(TK, nK("session time", wK(gK)));

				end;

				local function BK(gK)

					local wK = (globals.realtime and globals.realtime()) or 0;

					if (gK ~= true) and (wK < YK) then

						return;

					end;

					cK();

					if (gK ~= true) and (WK ~= true) then

						return;

					end;

					MK.players[oK] = mK;

					PK(MK);

					WK = false;

					YK = wK + 20;

				end;

				local function cK(PK, oK)

					mK[PK] = (tonumber(mK[PK]) or 0) + (oK or 1);

					WK = true;

					L();

				end;

				rawset(_G, "INFINIX_HOME_ADD_STAT", cK);

				local function PK(oK)

					cK("evaded", 1);

					for mK = 1, # CK do

						local MK = CK[mK];

						if type(MK) == "function" then

							pcall(MK, oK);

						end;

					end;

				end;

				local function oK(mK, MK, gK, WK, YK, CK, wK, nK, uK)

					local eK, JK, KK = wK - WK, nK - YK, uK - CK;

					local wK, nK, uK = mK - WK, MK - YK, gK - CK;

					local fK = (eK * eK) + (JK * JK) + (KK * KK);

					local iK = ((fK > 0) and (((wK * eK) + (nK * JK) + (uK * KK)) / fK)) or 0;

					if iK < 0 then

						iK = 0;

					elseif iK > 1 then

						iK = 1;

					end;

					local wK, nK, uK = WK + (eK * iK), YK + (JK * iK), CK + (KK * iK);

					local WK, YK, CK = mK - wK, MK - nK, gK - uK;

					return math.sqrt((WK * WK) + (YK * YK) + (CK * CK));

				end;

				client.set_event_callback('player_death', function(mK)

					if (mK == nil) or (mK.attacker == nil) or (mK.userid == nil) then

						return;

					end;

					local MK = entity.get_local_player();

					if MK == nil then

						return;

					end;

					local gK = client.userid_to_entindex(mK.attacker);

					local WK = client.userid_to_entindex(mK.userid);

					if (gK == MK) and (WK ~= nil) and (WK ~= MK) then

						local mK, MK = pcall(entity.is_enemy, WK);

						if mK and MK then

							cK('kills', 1);

						end;

					end;

				end);

				client.set_event_callback("aim_hit", function(mK)

					if mK == nil then

						return;

					end;

					cK("shots_hit", 1);

				end);

				client.set_event_callback("player_hurt", function(cK)

					local mK = entity.get_local_player();

					if (mK == nil) or (cK == nil) or (cK.userid == nil) then

						return;

					end;

					if client.userid_to_entindex(cK.userid) ~= mK then

						return;

					end;

					XK = (globals.tickcount and globals.tickcount()) or 0;

				end);

				client.set_event_callback("bullet_impact", function(cK)

					local mK = entity.get_local_player();

					if (mK == nil) or (entity.is_alive(mK) ~= true) or (cK == nil) or (cK.userid == nil) then

						return;

					end;

					local MK = (globals.tickcount and globals.tickcount()) or 0;

					if pK == MK then

						return;

					end;

					local gK = client.userid_to_entindex(cK.userid);

					if (gK == nil) or (gK == mK) then

						return;

					end;

					local WK, YK = pcall(entity.is_enemy, gK);

					if (not WK) or (not YK) then

						return;

					end;

					if entity.is_dormant and entity.is_dormant(gK) then

						return;

					end;

					local WK, YK, CK = entity.get_origin(gK);

					if WK == nil then

						return;

					end;

					local wK, nK, uK = entity.get_prop(gK, 'm_vecViewOffset');

					WK, YK, CK = WK + (wK or 0), YK + (nK or 0), CK + (uK or 64);

					local wK, nK, uK = cK.x, cK.y, cK.z;

					if (wK == nil) or (nK == nil) or (uK == nil) then

						return;

					end;

					local eK, JK = nil, nil;

					local KK, fK = pcall(entity.get_players, false);

					if (not KK) or (type(fK) ~= "table") then

						fK = {

							mK

						};

					end;

					local KK = false;

					for iK = 1, # fK do

						if fK[iK] == mK then

							KK = true;

							break;

						end;

					end;

					if not KK then

						fK[# fK + 1] = mK;

					end;

					for KK = 1, # fK do

						local iK = fK[KK];

						local KK, fK = pcall(entity.is_enemy, iK);

						if KK and (not fK) and (entity.is_alive(iK) == true) then

							local KK, fK, UK = entity.hitbox_position(iK, 0);

							if KK ~= nil then

								local xK = oK(KK, fK, UK, WK, YK, CK, wK, nK, uK);

								if (JK == nil) or (xK < JK) then

									JK = xK;

								end;

								if iK == mK then

									eK = xK;

								end;

							end;

						end;

					end;

					if (eK == nil) or (JK == nil) then

						return;

					end;

					if not ((eK < 40) or ((eK == JK) and (eK < 128))) then

						return;

					end;

					pK = MK;

					local function oK()

						local WK = XK or - 999.0;

						if (WK >= MK) and (WK <= (MK + 2)) then

							return;

						end;

						if (entity.get_local_player() == mK) and (entity.is_alive(mK) == true) then

							PK({

								attacker = gK,

								userid = cK.userid,

								dist = eK

							});

						end;

					end;

					if client.delay_call ~= nil then

						client.delay_call((globals.tickinterval and globals.tickinterval()) or 0.015, oK);

					else

						oK();

					end;

				end);

				EK[# EK + 1] = function(cK)

					local PK = cK == 'home';

					c(DK, PK);

					c(NK, PK);

					c(LK, PK);

					c(GK, PK);

					c(vK, PK);

					c(rK, PK);

					c(TK, PK);

				end;

				_K[# _K + 1] = function()

					local cK = (globals.realtime and globals.realtime()) or 0;

					if cK >= HK then

						L();

						HK = cK + 1;

					end;

					BK(false);

				end;

				function sK.home_stats()

					BK(true);

				end;

				L();

				BK(true);

			end;

			rawset(_G, "INFINIX_ENEMY_CACHE_STATE", rawget(_G, "INFINIX_ENEMY_CACHE_STATE") or {

				tick = - 1.0,

				count = 0,

				players = {}

			});

			local function L(cK)

				local PK = rawget(_G, 'INFINIX_ENEMY_CACHE_STATE');

				local oK = (globals.tickcount and globals.tickcount()) or 0;

				if (cK == true) or (PK.tick ~= oK) then

					PK.tick = oK;

					for cK = 1, PK.count do

						PK.players[cK] = nil;

					end;

					PK.count = 0;

					local cK, oK = pcall(entity.get_players, true);

					if cK and (type(oK) == 'table') then

						for cK = 1, # oK do

							PK.count = PK.count + 1;

							PK.players[PK.count] = oK[cK];

						end;

					end;

				end;

				return PK.players, PK.count;

			end;

			rawset(_G, "INFINIX_GET_ENEMY_CACHE", L);

			local function cK()

				local PK = V(R);

				if type(PK) ~= "string" then

					PK = r[1];

				end;

				local r = nil;

				if jK[PK] ~= nil then

					local oK = V(jK[PK]);

					if type(oK) == "string" then

						r = oK;

					end;

				end;

				if r == nil then

					r = "_flat";

				end;

				return PK, r;

			end;

			local function r()

				local PK = V(T);

				if type(PK) == 'string' then

					return PK;

				end;

				return w[1];

			end;

			function yK()

				local PK = bK();

				local bK, oK = cK();

				local mK = tostring(bK or "") .. "." .. tostring(oK or "");

				local oK = QK[mK] or {

					tostring(bK or "section"),

					""

				};

				local QK = mK ~= 'anti-aim.builder';

				O(k, '\aCDCDCD80*  ' .. PK .. oK[1]);

				c(qK, QK);

				if QK then

					O(qK, I());

				end;

				Z();

				O(OK, '\a777777FF ' .. oK[2]);

			end;

			_K[# _K + 1] = function()

				if ui.is_menu_open and (ui.is_menu_open() ~= true) then

					return;

				end;

				i();

				local i = math.floor((((globals.realtime and globals.realtime()) or 0) * 20) + 0.5);

				local k, I = cK();

				local Z = tostring(k or '') .. "." .. tostring(I or '');

				if (i ~= d.last_pulse) or (Z ~= d.last_path) then

					d.last_pulse = i;

					d.last_path = Z;

					VK(true);

				end;

			end;

			yK();

			local i = {

				["anti-aim.builder"] = true,

				['anti-aim.hotkeys'] = true,

				['anti-aim.settings'] = true,

				["ragebot._flat"] = true,

				['visuals._flat'] = true,

				['misc._flat'] = true

			};

			local function d(k, I)

				for Z, QK in pairs(aK) do

					for bK, qK in pairs(QK) do

						local QK = (Z == k) and (bK == I);

						local k = i[Z .. "." .. bK] == true;

						if (not QK) or (not k) then

							for i, i in pairs(qK) do

								c(i, QK);

							end;

						end;

					end;

				end;

			end;

			local i;

			local function k()

				local I = ui.is_menu_open and (ui.is_menu_open() == true);

				if (not I) and (a <= 0) and (K <= 0) then

					return;

				end;

				if I ~= E then

					E = I;

					_(3);

				end;

				if I and (ui.menu_position ~= nil) then

					ui.menu_position();

				end;

				if I and (ui.menu_size ~= nil) then

					local I, Z, QK = pcall(ui.menu_size);

					if I and ((Z ~= z) or (QK ~= h)) then

						z, h = Z, QK;

						K = 30;

						t(true);

						if client.delay_call ~= nil then

							pcall(client.delay_call, 0.03, t, true);

						end;

					end;

				end;

				for z, z in ipairs(u) do

					c(z, false);

				end;

				local z, h = cK();

				local I = r();

				for Z, QK in pairs(jK) do

					if Z ~= z then

						c(QK, false);

					end;

				end;

				d(z, h);

				for Z, QK in ipairs(EK) do

					hK.safe_call3(3000 + Z, QK, z, h, I);

				end;

				local I = z .. "." .. h;

				x(I);

				if a > 0 then

					a = a - 1;

				end;

			end;

			function i()

				_(2);

				local z, h = cK();

				local x = r();

				yK();

				for I, Z in pairs(jK) do

					c(Z, I == z);

				end;

				d(z, h);

				for d, I in ipairs(EK) do

					hK.safe_call3(3100 + d, I, z, h, x);

				end;

				k();

			end;

			o(R, i);

			for z, z in pairs(jK) do

				o(z, i);

			end;

			o(T, i);

			local z = {

				antiaimbot = {

					angles = {}

				}

			};

			(function()

				local h = z.antiaimbot.angles;

				h.enabled = l("AA", "Anti-aimbot angles", "Enabled");

				h.pitch = {

					l("AA", 'Anti-aimbot angles', "Pitch")

				};

				h.yaw_base = l("AA", 'Anti-aimbot angles', 'Yaw base');

				h.yaw = {

					l("AA", 'Anti-aimbot angles', 'Yaw')

				};

				h.yaw_jitter = {

					l('AA', "Anti-aimbot angles", 'Yaw jitter')

				};

				h.body_yaw = {

					l('AA', "Anti-aimbot angles", 'Body yaw')

				};

				h.freestanding_body_yaw = l("AA", "Anti-aimbot angles", "Freestanding body yaw");

				h.edge_yaw = l("AA", 'Anti-aimbot angles', "Edge yaw");

				h.freestanding = {

					l('AA', "Anti-aimbot angles", "Freestanding")

				};

				h.roll = l("AA", 'Anti-aimbot angles', "Roll");

				h.other_slow_motion = {

					l('AA', 'Other', 'Slow motion')

				};

				function z.is_slow_motion()

					local x = h.other_slow_motion;

					if (not x[1]) or (not x[2]) then

						return false;

					end;

					local d, R = pcall(ui.get, x[1]);

					local I, Z = pcall(ui.get, x[2]);

					return d and I and (R == true) and (Z == true);

				end;

				function z.is_freestanding()

					local x = h.freestanding;

					if (not x[1]) or (not x[2]) then

						return false;

					end;

					local h, d = pcall(ui.get, x[1]);

					local R, I = pcall(ui.get, x[2]);

					return h and R and (d == true) and (I == true);

				end;

				function z.is_double_tap_active()

					local h = rawget(_G, "INFINIX_REF_DT_1");

					local x = rawget(_G, "INFINIX_REF_DT_2");

					if (h == nil) and (rawget(_G, 'INFINIX_REF_DT_READY') ~= true) then

						local d, R, I = pcall(ui.reference, 'Rage', "Aimbot", 'Double tap');

						if (not d) or (R == nil) then

							d, R, I = pcall(ui.reference, 'RAGE', 'Aimbot', 'Double tap');

						end;

						if d and (R ~= nil) then

							rawset(_G, 'INFINIX_REF_DT_1', R);

							rawset(_G, 'INFINIX_REF_DT_2', I);

							h, x = R, I;

							rawset(_G, "INFINIX_REF_DT_READY", true);

						end;

					end;

					if h == nil then

						return false;

					end;

					local d, R = pcall(ui.get, h);

					if x ~= nil then

						local h, I = pcall(ui.get, x);

						return d and h and (R == true) and (I == true);

					end;

					return d and (R == true);

				end;

				function z.is_on_shot_antiaim_active()

					local h, x = pcall(ui.reference, 'AA', 'Other', "On shot anti-aim");

					if (not h) or (x == nil) then

						return false;

					end;

					local h, d = pcall(ui.get, x);

					return h and (d == true);

				end;

				function z.is_duck_peek_assist()

					local h, x, d = pcall(ui.reference, "RAGE", 'Other', "Duck peek assist");

					if (not h) or (x == nil) then

						return false;

					end;

					local h, R = pcall(ui.get, x);

					if d ~= nil then

						local x, I = pcall(ui.get, d);

						return h and x and (R == true) and (I == true);

					end;

					return h and (R == true);

				end;

			end)();

			(function()

				local h = z.antiaimbot.angles;

				local x = {};

				for d = 1, # u do

					x[tostring(u[d])] = true;

				end;

				f(u, x, h.enabled);

				f(u, x, h.pitch[1]);

				f(u, x, h.pitch[2]);

				f(u, x, h.yaw_base);

				f(u, x, h.yaw[1]);

				f(u, x, h.yaw[2]);

				f(u, x, h.yaw_jitter[1]);

				f(u, x, h.yaw_jitter[2]);

				f(u, x, h.body_yaw[1]);

				f(u, x, h.body_yaw[2]);

				f(u, x, h.freestanding_body_yaw);

				f(u, x, h.edge_yaw);

				f(u, x, h.freestanding[1]);

				f(u, x, h.freestanding[2]);

				f(u, x, h.roll);

			end)();

			local h;

			local u = {};

			(function()

				local f = {

					[0] = 'Always on',

					[1] = 'On hotkey',

					[2] = 'Toggle',

					[3] = "Off hotkey"

				};

				local function x(d)

					if (d == nil) or (u[d] ~= nil) then

						return;

					end;

					local R, I = pcall(ui.is_menu_open, d);

					if not R then

						return;

					end;

					local R, Z, yK, jK, QK = pcall(ui.get, d);

					if not R then

						return;

					end;

					if I == 'hotkey' then

						u[d] = {

							(f[yK] or 'Always on'),

							(jK or 0)

						};

					else

						u[d] = {

							Z,

							yK,

							jK,

							QK

						};

					end;

				end;

				local f = z.antiaimbot.angles;

				x(f.enabled);

				x(f.pitch[1]);

				x(f.pitch[2]);

				x(f.yaw_base);

				x(f.yaw[1]);

				x(f.yaw[2]);

				x(f.yaw_jitter[1]);

				x(f.yaw_jitter[2]);

				x(f.body_yaw[1]);

				x(f.body_yaw[2]);

				x(f.freestanding_body_yaw);

				x(f.edge_yaw);

				x(f.freestanding[1]);

				x(f.freestanding[2]);

				x(f.roll);

			end)();

			local function f()

				for x, d in pairs(u) do

					pcall(ui.set, x, y(d));

				end;

				rawset(_G, "INFINIX_OVERRIDE_REFRESH_TICK", 0);

				if (h ~= nil) and (h.invalidate ~= nil) then

					pcall(h.invalidate);

				end;

			end;

			sK.native_stash = f;

			local u = 0;

			local function x()

				local d = (globals.tickcount and globals.tickcount()) or 0;

				u = math.max(u, d + 24);

				rawset(_G, 'INFINIX_OVERRIDE_REFRESH_TICK', 0);

				rawset(_G, 'INFINIX_OVERRIDE_FORCE_INVALIDATE', true);

				if (h ~= nil) and (h.invalidate ~= nil) then

					pcall(h.invalidate);

				end;

				if type(aa_clear_runtime_owners) == "function" then

					pcall(aa_clear_runtime_owners);

				end;

				if (Y ~= nil) and (type(Y.clear_all) == 'function') then

					pcall(Y.clear_all);

				end;

				if (builder ~= nil) and (type(builder.reset_inverter) == 'function') then

					pcall(builder.reset_inverter);

				end;

				_(6);

				if i ~= nil then

					pcall(i);

					if type(client.delay_call) == "function" then

						pcall(client.delay_call, 0, i);

						pcall(client.delay_call, 0.15, i);

					end;

				end;

			end;

			client.set_event_callback("pre_config_save", function()

				f();

				if hK.cfg_pre_save_hook then

					hK.safe_call("pre_config_save.config", hK.cfg_pre_save_hook);

				end;

				for f, d in ipairs(hK.pre_config_save) do

					hK.safe_call0(7000 + f, d);

				end;

				x();

			end);

			do

				local function f()

					x();

				end;

				pcall(client.set_event_callback, "level_init", f);

				pcall(client.set_event_callback, "cs_game_disconnected", f);

				pcall(client.set_event_callback, 'round_prestart', f);

				pcall(client.set_event_callback, 'round_start', f);

				pcall(client.set_event_callback, "player_connect_full", f);

				pcall(client.set_event_callback, 'post_config_load', f);

			end;

			h = {};

			(function()

				local f = {};

				local d = {};

				local R = {};

				local I = {

					[0] = "Always on",

					[1] = "On hotkey",

					[2] = "Toggle",

					[3] = "Off hotkey"

				};

				local function Z( ...)

					return {

						n = select("#", ...),

						...

					};

				end;

				local function yK(jK, ...)

					if jK == nil then

						return false;

					end;

					local QK = select("#", ...);

					if jK.n ~= QK then

						return false;

					end;

					for bK = 1, QK do

						if jK[bK] ~= select(bK, ...) then

							return false;

						end;

					end;

					return true;

				end;

				local function jK(QK)

					local bK, qK = pcall(ui.is_menu_open, QK);

					if not bK then

						return nil;

					end;

					local bK, OK, PK, oK, mK = pcall(ui.get, QK);

					if not bK then

						return nil;

					end;

					if qK == 'hotkey' then

						local QK = I[PK];

						local I = oK or 0;

						return {

							QK,

							I

						};

					end;

					return {

						OK,

						PK,

						oK,

						mK

					};

				end;

				local function I(QK, bK)

					local qK = tostring(QK);

					if R[qK] then

						return;

					end;

					R[qK] = true;

					pcall(client.color_log, 255, 90, 90, '[infinix recode]' .. " override failed: " .. tostring(bK));

				end;

				function h.get(R)

					local QK = f[R];

					if (QK == nil) or (QK == false) then

						return nil;

					end;

					return y(QK);

				end;

				function h.invalidate()

					for R in pairs(d) do

						d[R] = nil;

					end;

					rawset(_G, "INFINIX_OVERRIDE_REFRESH_TICK", 0);

					local R = rawget(_G, "NATIVE_DECISION");

					if (type(R) == "table") and (type(R.invalidate) == 'function') then

						pcall(R.invalidate);

					end;

				end;

				function h.set(R, ...)

					if R == nil then

						return;

					end;

					if f[R] == nil then

						f[R] = jK(R) or false;

					end;

					local jK = (globals.tickcount and globals.tickcount()) or 0;

					if rawget(_G, "INFINIX_OVERRIDE_FORCE_INVALIDATE") == true then

						rawset(_G, 'INFINIX_OVERRIDE_FORCE_INVALIDATE', false);

						for QK in pairs(d) do

							d[QK] = nil;

						end;

					elseif (jK ~= 0) and (jK >= (rawget(_G, "INFINIX_OVERRIDE_REFRESH_TICK") or 0)) then

						for QK in pairs(d) do

							d[QK] = nil;

						end;

						rawset(_G, "INFINIX_OVERRIDE_REFRESH_TICK", jK + 64);

					end;

					if yK(d[R], ...) then

						return;

					end;

					local yK, jK = pcall(ui.set, R, ...);

					if not yK then

						d[R] = nil;

						I(R, jK);

						return false;

					end;

					d[R] = Z(...);

					return true;

				end;

				function h.unset(R)

					if R == nil then

						return;

					end;

					d[R] = nil;

					local d = f[R];

					if (d == nil) or (d == false) then

						return;

					end;

					local Z, yK = pcall(ui.set, R, y(d));

					if not Z then

						I(R, yK);

					end;

					f[R] = nil;

				end;

			end)();

			NATIVE_DECISION = {

				refs = {},

				owner_refs = {}

			};

			do

				local function f( ...)

					return {

						n = select('#', ...),

						...

					};

				end;

				local function d(R, I)

					if (R == nil) or (I == nil) or (R.n ~= I.n) then

						return false;

					end;

					for Z = 1, R.n do

						if R[Z] ~= I[Z] then

							return false;

						end;

					end;

					return true;

				end;

				local function R(I)

					if I == nil then

						return nil;

					end;

					local Z = NATIVE_DECISION.refs[I];

					if Z == nil then

						Z = {

							requests = {},

							applied = nil,

							applied_owner = nil,

							applied_reason = nil

						};

						NATIVE_DECISION.refs[I] = Z;

					end;

					return Z;

				end;

				local function I(Z, yK, jK)

					if (Z == nil) or (yK == nil) then

						return;

					end;

					Z = tostring(Z);

					local QK = NATIVE_DECISION.owner_refs[Z];

					if QK == nil then

						if not jK then

							return;

						end;

						QK = {};

						NATIVE_DECISION.owner_refs[Z] = QK;

					end;

					QK[yK] = (jK and true) or nil;

					if not next(QK) then

						NATIVE_DECISION.owner_refs[Z] = nil;

					end;

				end;

				local function Z(yK)

					local jK = nil;

					for QK, QK in pairs(yK.requests) do

						if (type(QK) == 'table') and ((jK == nil) or ((QK.priority or 0) >= (jK.priority or 0))) then

							jK = QK;

						end;

					end;

					return jK;

				end;

				function NATIVE_DECISION.apply_ref(yK)

					local jK = NATIVE_DECISION.refs[yK];

					if jK == nil then

						return;

					end;

					local QK = Z(jK);

					if QK ~= nil then

						if not d(jK.applied, QK.values) then

							pcall(h.set, yK, y(QK.values, 1, QK.values.n));

							jK.applied = f(y(QK.values, 1, QK.values.n));

						end;

						jK.applied_owner = QK.owner;

						jK.applied_reason = QK.reason;

					else

						if jK.applied ~= nil then

							pcall(h.unset, yK);

						end;

						NATIVE_DECISION.refs[yK] = nil;

					end;

				end;

				function NATIVE_DECISION.apply_all()

					local d = {};

					for Z in pairs(NATIVE_DECISION.refs) do

						d[# d + 1] = Z;

					end;

					for Z = 1, # d do

						NATIVE_DECISION.apply_ref(d[Z]);

					end;

				end;

				function NATIVE_DECISION.request(d, Z, yK, jK, ...)

					if d == nil then

						return false;

					end;

					Z = tostring(Z or "unknown");

					local QK = R(d);

					if QK == nil then

						return false;

					end;

					QK.requests[Z] = {

						owner = Z,

						priority = (tonumber(yK) or 0),

						reason = tostring(jK or Z),

						values = f(...)

					};

					I(Z, d, true);

					NATIVE_DECISION.apply_ref(d);

					return true;

				end;

				function NATIVE_DECISION.clear(f, d)

					local R = NATIVE_DECISION.refs[f];

					if R == nil then

						return;

					end;

					if d == nil then

						for Z in pairs(R.requests) do

							I(Z, f, false);

						end;

						for Z in pairs(R.requests) do

							R.requests[Z] = nil;

						end;

					else

						d = tostring(d);

						R.requests[d] = nil;

						I(d, f, false);

					end;

					NATIVE_DECISION.apply_ref(f);

				end;

				function NATIVE_DECISION.clear_owner(f)

					f = tostring(f or "");

					local d = NATIVE_DECISION.owner_refs[f];

					if d == nil then

						return;

					end;

					local R = {};

					for I in pairs(d) do

						R[# R + 1] = I;

					end;

					for d = 1, # R do

						NATIVE_DECISION.clear(R[d], f);

					end;

				end;

				function NATIVE_DECISION.clear_all()

					local f = {};

					for d in pairs(NATIVE_DECISION.refs) do

						f[# f + 1] = d;

					end;

					for d = 1, # f do

						NATIVE_DECISION.clear(f[d]);

					end;

				end;

				function NATIVE_DECISION.peek(f)

					local d = NATIVE_DECISION.refs[f];

					if d == nil then

						return nil;

					end;

					return d.applied, d.applied_owner, d.applied_reason;

				end;

				function NATIVE_DECISION.invalidate()

					for f, f in pairs(NATIVE_DECISION.refs) do

						if type(f) == "table" then

							f.applied = nil;

						end;

					end;

				end;

			end;

			INFINIX = INFINIX or {};

			INFINIX.native_decision = NATIVE_DECISION;

			function sK.native_decision()

				NATIVE_DECISION.clear_all();

			end;

			AA_OWNER_BUILDER = "aa_builder";

			AA_OWNER_HOTKEY_FS = 'aa_hotkey_fs';

			AA_OWNER_MANUAL = "aa_manual";

			AA_OWNER_BACKSTAB = "aa_backstab";

			AA_OWNER_SAFE_HEAD = 'aa_safe_head';

			AA_OWNER_EBOMB = "aa_ebomb";

			AA_OWNER_FLICK = "aa_flick";

			AA_OWNER_GUARD = "aa_guardian";

			AA_RUNTIME_OWNERS = {

				AA_OWNER_BUILDER,

				AA_OWNER_HOTKEY_FS,

				AA_OWNER_MANUAL,

				AA_OWNER_BACKSTAB,

				AA_OWNER_SAFE_HEAD,

				AA_OWNER_EBOMB,

				AA_OWNER_FLICK,

				AA_OWNER_GUARD

			};

			function aa_request(f, d, R, I, ...)

				if I == nil then

					return false;

				end;

				return NATIVE_DECISION.request(I, f, d, R, ...);

			end;

			function aa_clear_owner(f)

				if f ~= nil then

					NATIVE_DECISION.clear_owner(f);

				end;

			end;

			function aa_clear_runtime_owners()

				for f = 1, # AA_RUNTIME_OWNERS do

					NATIVE_DECISION.clear_owner(AA_RUNTIME_OWNERS[f]);

				end;

			end;

			local f = {};

			f.__index = f;

			function f.new()

				return setmetatable({}, f);

			end;

			function f:clear()

				for d in pairs(self) do

					self[d] = nil;

				end;

			end;

			function f:copy(d)

				for R, I in pairs(d) do

					self[R] = I;

				end;

			end;

			local d = {

				off = 'Off',

				offset = 'Offset',

				center = "Center",

				random = "Random",

				skitter = "Skitter",

				opposite = 'Opposite',

				static = 'Static',

				jitter = "Jitter",

				sway = "Sway",

				switch = 'Switch',

				spin = "Spin",

				["side based"] = 'Side Based',

				['left/right'] = 'Left/Right',

				["x-way"] = 'X-Way',

				["3-way"] = "3-Way",

				["5-way"] = '5-Way',

				["static random"] = "Static Random"

			};

			local function R(I)

				if type(I) ~= "string" then

					return I;

				end;

				return d[I] or I;

			end;

			local function d(I, Z)

				if (Z == nil) or (I == nil) then

					return;

				end;

				aa_request(AA_OWNER_BUILDER, 10, 'builder', I, Z);

			end;

			function f:set()

				local I = z.antiaimbot.angles;

				if self.pitch_offset ~= nil then

					self.pitch_offset = H(self.pitch_offset, - 89.0, 89);

				end;

				if self.yaw_offset ~= nil then

					self.yaw_offset = X(self.yaw_offset, - 180.0, 180);

				end;

				if self.jitter_offset ~= nil then

					self.jitter_offset = X(self.jitter_offset, - 180.0, 180);

				end;

				if self.body_yaw_offset ~= nil then

					self.body_yaw_offset = H(self.body_yaw_offset, - 180.0, 180);

				end;

				d(I.enabled, self.enabled);

				d(I.pitch[1], R(self.pitch));

				d(I.pitch[2], self.pitch_offset);

				d(I.yaw_base, self.yaw_base);

				d(I.yaw[1], R(self.yaw));

				d(I.yaw[2], self.yaw_offset);

				d(I.yaw_jitter[1], R(self.yaw_jitter));

				d(I.yaw_jitter[2], self.jitter_offset);

				d(I.body_yaw[1], R(self.body_yaw));

				d(I.body_yaw[2], self.body_yaw_offset);

				d(I.freestanding_body_yaw, self.freestanding_body_yaw);

				d(I.edge_yaw, self.edge_yaw);

				if self.freestanding == true then

					d(I.freestanding[1], true);

					d(I.freestanding[2], 'Always on');

				elseif self.freestanding == false then

					d(I.freestanding[1], false);

					d(I.freestanding[2], 'On hotkey');

				end;

				d(I.roll, self.roll);

			end;

			function f.unset()

				aa_clear_owner(AA_OWNER_BUILDER);

			end;

			local X = f:new();

			local f = {};

			do

				local d = 0;

				local R = 0;

				local function I(Z)

					return math.floor(0.5 + (Z / globals.tickinterval()));

				end;

				local Z = {

					old_origin = _G.vector(),

					old_simtime = 0,

					shift = false,

					breaking_lc = false,

					defensive = {

						force = false,

						left = 0,

						max = 0

					},

					lagcompensation = {

						distance = 0,

						teleport = false

					}

				};

				local function yK(jK)

					Z.shift = globals.tickcount() > (entity.get_prop(jK, "m_nTickBase") or 0);

				end;

				local function jK(QK, bK)

					local qK = bK - QK;

					local QK = qK:lengthsqr();

					local bK = QK > 4096;

					Z.breaking_lc = bK;

					Z.lagcompensation.distance = QK;

					Z.lagcompensation.teleport = bK;

				end;

				local function QK(bK)

					local qK = Z.old_origin;

					local OK = Z.old_simtime;

					local PK, oK, mK = entity.get_origin(bK);

					if PK == nil then

						return;

					end;

					local BK = _G.vector(PK, oK, mK);

					local PK = I(entity.get_prop(bK, "m_flSimulationTime") or 0);

					if OK ~= nil then

						local I = PK - OK;

						if (I < 0) or ((I > 0) and (I <= 64)) then

							jK(qK, BK);

						end;

					end;

					Z.old_origin = BK;

					Z.old_simtime = PK;

				end;

				local function I(jK)

					local bK = entity.get_prop(jK, "m_nTickBase") or 0;

					if math.abs(bK - d) > 64 then

						d = 0;

					end;

					local jK = 0;

					if bK > d then

						d = bK;

					elseif d > bK then

						jK = math.min(14, math.max(0, (d - bK) - 1));

					end;

					if jK > 0 then

						Z.breaking_lc = true;

						Z.defensive.left = jK;

						if Z.defensive.max == 0 then

							Z.defensive.max = jK;

						end;

					else

						Z.defensive.left = 0;

						Z.defensive.max = 0;

					end;

				end;

				function f.get()

					return Z;

				end;

				function f.update()

					return Z;

				end;

				f.max_tickbase = 0;

				f.defensive_ticks_left = 0;

				client.set_event_callback("run_command", function(jK)

					local bK = entity.get_local_player();

					if bK == nil then

						return;

					end;

					yK(bK);

					R = jK.command_number;

				end);

				client.set_event_callback('predict_command', function(yK)

					local jK = entity.get_local_player();

					if jK == nil then

						return;

					end;

					if yK.command_number == R then

						I(jK);

						R = nil;

					end;

					f.max_tickbase = d;

					f.defensive_ticks_left = Z.defensive.left;

				end);

				client.set_event_callback("net_update_start", function()

					local d = entity.get_local_player();

					if d == nil then

						return;

					end;

					QK(d);

				end);

			end;

			local d = {};

			do

				local R = bit.lshift(1, 0);

				local I = bit.lshift(1, 1);

				local function Z()

					local yK = globals.tickcount();

					if rawget(_G, "INFINIX_ANY_ENEMY_TICK") == yK then

						return rawget(_G, 'INFINIX_ANY_ENEMY_VALUE') == true;

					end;

					local jK, QK = L();

					if jK == nil then

						rawset(_G, "INFINIX_ANY_ENEMY_TICK", yK);

						rawset(_G, 'INFINIX_ANY_ENEMY_VALUE', false);

						return false;

					end;

					for bK = 1, QK do

						local QK = jK[bK];

						if entity.is_alive(QK) and (not entity.is_dormant(QK)) then

							rawset(_G, "INFINIX_ANY_ENEMY_TICK", yK);

							rawset(_G, 'INFINIX_ANY_ENEMY_VALUE', true);

							return true;

						end;

					end;

					rawset(_G, "INFINIX_ANY_ENEMY_TICK", yK);

					rawset(_G, "INFINIX_ANY_ENEMY_VALUE", false);

					return false;

				end;

				local function yK(jK)

					local QK = entity.get_prop(jK, "m_fFlags") or 0;

					return bit.band(QK, R) ~= 0;

				end;

				local function R(jK)

					local QK = entity.get_prop(jK, "m_flDuckAmount") or 0;

					if QK > 0.7 then

						return true;

					end;

					local QK = entity.get_prop(jK, 'm_fFlags') or 0;

					return bit.band(QK, I) ~= 0;

				end;

				local function I(jK)

					local QK = entity.get_prop(jK, 'm_vecVelocity[0]') or 0;

					local bK = entity.get_prop(jK, "m_vecVelocity[1]") or 0;

					return ((QK * QK) + (bK * bK)) > 4;

				end;

				local jK;

				function d.set_builder(QK)

					jK = QK;

				end;

				local function QK()

					if jK == nil then

						return false;

					end;

					local bK = jK.shared;

					if (bK == nil) or (bK.enabled == nil) then

						return false;

					end;

					local jK, qK = pcall(ui.get, bK.enabled);

					return jK and (qK == true);

				end;

				local jK, bK, qK = nil, nil, 0;

				local OK, PK = - 1.0, nil;

				local function oK(mK)

					jK = mK;

					bK = nil;

					qK = 0;

					OK = - 1.0;

					PK = nil;

				end;

				local function mK(BK)

					if type(BK) ~= 'string' then

						return BK;

					end;

					local MK = (globals.tickcount and globals.tickcount()) or 0;

					if (OK == MK) and (PK ~= nil) then

						return PK;

					end;

					OK = MK;

					if jK == nil then

						jK = BK;

						PK = BK;

						return BK;

					end;

					if BK == jK then

						bK = nil;

						qK = 0;

						PK = jK;

						return jK;

					end;

					if bK ~= BK then

						bK = BK;

						qK = 1;

					else

						qK = qK + 1;

					end;

					local OK = 2;

					if (BK == "air") or (BK == "air-crouch") then

						OK = 1;

					elseif BK == "shared" then

						OK = 10;

					elseif jK == "shared" then

						OK = 1;

					elseif (jK == 'air') or (jK == 'air-crouch') then

						OK = 2;

					end;

					if qK >= OK then

						jK = BK;

						bK = nil;

						qK = 0;

					end;

					PK = jK;

					return jK;

				end;

				function d.reset_guard()

					oK(nil);

				end;

				function d.get()

					if QK() and (not Z()) then

						return mK('shared');

					end;

					local Z = entity.get_local_player();

					if (Z == nil) or (not entity.is_alive(Z)) then

						local jK = (QK() and "shared") or "standing";

						oK(jK);

						return jK;

					end;

					local jK = yK(Z);

					local yK = R(Z);

					local R = I(Z);

					local I;

					if not jK then

						I = (yK and 'air-crouch') or 'air';

					elseif yK then

						I = (R and "move-crouch") or 'crouch';

					elseif R then

						I = (z.is_slow_motion() and "slow walk") or 'moving';

					else

						I = "standing";

					end;

					return mK(I);

				end;

				pcall(client.set_event_callback, 'round_start', d.reset_guard);

				pcall(client.set_event_callback, "player_connect_full", d.reset_guard);

				pcall(client.set_event_callback, "cs_game_disconnected", d.reset_guard);

			end;

			local R = {

				move_dir = nil,

				sent_packets = 0,

				is_onground = false,

				is_moving = false,

				is_crouched = false,

				is_peeking = false

			};

			zK[# zK + 1] = function(I)

				local Z = (I and I.forwardmove) or 0;

				local yK = (I and I.sidemove) or 0;

				local jK = ((Z > 0) and 1) or ((Z < 0) and - 1.0) or 0;

				local Z = ((yK > 0) and 1) or ((yK < 0) and - 1.0) or 0;

				R.move_dir = _G.vector(jK, Z, 0);

				if ((I and I.chokedcommands) or 0) == 0 then

					R.sent_packets = (R.sent_packets or 0) + 1;

				end;

				local I = entity.get_local_player();

				if (I == nil) or (not entity.is_alive(I)) then

					R.is_onground = false;

					R.is_moving = false;

					R.is_crouched = false;

					return;

				end;

				local Z = entity.get_prop(I, "m_fFlags") or 0;

				R.is_onground = bit.band(Z, 1) ~= 0;

				local yK = entity.get_prop(I, 'm_flDuckAmount') or 0;

				R.is_crouched = (yK > 0.7) or (bit.band(Z, bit.lshift(1, 1)) ~= 0);

				local Z, yK = entity.get_prop(I, "m_vecVelocity");

				local I = 0;

				if Z then

					I = math.sqrt((Z * Z) + ((yK or 0) * (yK or 0)));

				end;

				R.is_moving = I > 2;

			end;

			local I;

			local Z;

			local yK;

			local jK;

			local QK;

			local bK = function()

				return false;

			end;

			local qK = false;

			local OK = false;

			local PK = false;

			local oK = false;

			local mK;

			local BK;

			local MK = false;

			local function gK(WK)

				return (WK == "moving") or (WK == 'slow walk') or (WK == 'move-crouch');

			end;

			local function WK()

				return not gK(d:get());

			end;

			local function YK()

				return (MK == true) or (PK == true) or (OK == true);

			end;

			local HK = {};

			local XK = {};

			local function pK(CK, DK, NK)

				if NK == nil then

					return;

				end;

				if not HK[CK] then

					HK[CK] = {};

				end;

				if HK[CK][DK] then

					M(255, 180, 0, '[cfg] collision: ' .. CK .. '/' .. DK);

				end;

				HK[CK][DK] = NK;

			end;

			(function()

				local CK = {

					'off',

					'offset',

					'center',

					'random',

					'skitter'

				};

				local DK = {

					'off',

					'opposite',

					"static",

					"jitter"

				};

				local NK = {

					pitch = true,

					yaw = true,

					['yaw base'] = true,

					['yaw jitter'] = true,

					["body yaw"] = true,

					roll = true,

					freestanding = true,

					['edge yaw'] = true,

					["freestanding body yaw"] = true,

					enabled = true

				};

				local function LK(GK)

					if GK == nil then

						return false;

					end;

					local vK = string.lower(GK):gsub("%s+", ' '):gsub('^%s*(.-)%s*$', "%1");

					return NK[vK] == true;

				end;

				local function NK(GK, vK)

					local rK = n[GK] or GK;

					if LK(vK) then

						return '\a00000000' .. rK .. "\aFFFFFFFF" .. "a?? " .. vK .. ' ~';

					end;

					return "\a00000000" .. rK .. '\aFFFFFFFF' .. "a?? " .. vK;

				end;

				local function LK(GK)

					local vK = {};

					local rK = GK == 'global';

					if not rK then

						vK.enabled = Q(ui.new_checkbox, "AA", "Anti-aimbot angles", NK(GK, "override"));

					end;

					vK.yaw_left = Q(ui.new_slider, 'AA', 'Anti-aimbot angles', NK(GK, 'yaw left'), - 180.0, 180, 0, true, "A ");

					vK.yaw_right = Q(ui.new_slider, 'AA', "Anti-aimbot angles", NK(GK, 'yaw right'), - 180.0, 180, 0, true, 'A ');

					vK.yaw_random = Q(ui.new_slider, "AA", "Anti-aimbot angles", NK(GK, 'random'), 0, 30, 0, true, '%');

					vK.line_jitter = F("AA", "Anti-aimbot angles");

					vK.yaw_jitter = Q(ui.new_combobox, "AA", "Anti-aimbot angles", NK(GK, "jitter"), CK);

					vK.jitter_offset = Q(ui.new_slider, 'AA', "Anti-aimbot angles", NK(GK, 'jitter offset'), - 180.0, 180, 0, true, "A ");

					vK.jitter_random = Q(ui.new_slider, "AA", 'Anti-aimbot angles', NK(GK, "jitter random"), 0, 30, 0, true, "%");

					vK.line_body = F('AA', "Anti-aimbot angles");

					vK.body_yaw = Q(ui.new_combobox, 'AA', "Anti-aimbot angles", NK(GK, 'body'), DK);

					vK.body_yaw_offset = Q(ui.new_slider, 'AA', "Anti-aimbot angles", NK(GK, "body offset"), - 180.0, 180, 0, true, 'A ');

					vK.freestanding_body_yaw = Q(ui.new_checkbox, 'AA', "Anti-aimbot angles", NK(GK, "freestand body"));

					vK.line_delay = F('AA', "Anti-aimbot angles");

					vK.delay_from = Q(ui.new_slider, "AA", 'Anti-aimbot angles', NK(GK, "delay from"), 1, 8, 1, true, "t");

					vK.delay_to = Q(ui.new_slider, "AA", "Anti-aimbot angles", NK(GK, 'delay to'), 1, 8, 1, true, 't');

					vK.secret_delay = Q(ui.new_checkbox, 'AA', 'Anti-aimbot angles', NK(GK, 'secret delay'));

					vK.line_delay_random = F("AA", 'Anti-aimbot angles');

					vK.invert_chance = Q(ui.new_slider, "AA", "Anti-aimbot angles", NK(GK, 'delay randomization'), 0, 100, 100, true, "%");

					return vK;

				end;

				I = {};

				for CK, CK in ipairs(w) do

					I[CK] = LK(CK);

				end;

				d.set_builder(I);

				local CK = false;

				local DK = 0;

				local NK = {

					- 1.0,

					1,

					0,

					- 1.0,

					1,

					0,

					- 1.0,

					0,

					1,

					- 1.0,

					0,

					1

				};

				local LK = 0;

				local GK = 1;

				local vK = - 1.0;

				local rK = nil;

				local function TK()

					DK = 0;

					CK = false;

					LK = 0;

					GK = 1;

					rK = nil;

				end;

				local function wK()

					return math.max(1, math.min(4, tonumber(GK) or 1));

				end;

				rawset(_G, "INFINIX_AA_SECRET_DELAY_VALUE", wK);

				local function nK(uK)

					local eK = tonumber(uK);

					if (eK == nil) or (eK <= 0) then

						return 100;

					end;

					return math.min(100, eK);

				end;

				local function uK(eK, JK, KK, fK, iK, UK, xK, tK, AK)

					local SK, dK, RK = xK - fK, tK - iK, AK - UK;

					local xK = (SK * SK) + (dK * dK) + (RK * RK);

					if xK <= 0.001 then

						return 999999;

					end;

					local tK = (((eK - fK) * SK) + ((JK - iK) * dK) + ((KK - UK) * RK)) / xK;

					if tK < 0 then

						tK = 0;

					elseif tK > 1 then

						tK = 1;

					end;

					local xK, AK, kK = fK + (SK * tK), iK + (dK * tK), UK + (RK * tK);

					local fK, iK, UK = eK - xK, JK - AK, KK - kK;

					return math.sqrt((fK * fK) + (iK * iK) + (UK * UK));

				end;

				pcall(client.set_event_callback, "bullet_impact", function(eK)

					if (eK == nil) or (eK.userid == nil) then

						return;

					end;

					local JK = globals.tickcount();

					if JK == vK then

						return;

					end;

					local KK = entity.get_local_player();

					if (KK == nil) or (not entity.is_alive(KK)) then

						return;

					end;

					local fK = client.userid_to_entindex(eK.userid);

					if (fK == nil) or (fK == KK) then

						return;

					end;

					local iK, UK = pcall(entity.is_enemy, fK);

					if (not iK) or (UK ~= true) then

						return;

					end;

					local iK, UK, xK = entity.hitbox_position(KK, 0);

					local KK, tK, AK = entity.get_origin(fK);

					if (iK == nil) or (KK == nil) or (type(eK.x) ~= 'number') or (type(eK.y) ~= 'number') or (type(eK.z) ~= 'number') then

						return;

					end;

					local SK, dK, RK = entity.get_prop(fK, "m_vecViewOffset");

					KK, tK, AK = KK + (SK or 0), tK + (dK or 0), AK + (RK or 64);

					local fK = uK(iK, UK, xK, KK, tK, AK, eK.x, eK.y, eK.z);

					if fK < 128 then

						GK = D(1, 4);

						vK = JK;

					end;

				end);

				pcall(client.set_event_callback, "round_start", function()

					GK = 1;

					vK = - 1.0;

				end);

				local function GK()

					X.pitch = 'Default';

				end;

				local function vK(uK)

					if uK.yaw_base == nil then

						X.yaw_base = "At targets";

					else

						X.yaw_base = V(uK.yaw_base);

					end;

				end;

				local function uK(eK)

					if (eK.yaw_left == nil) or (eK.yaw_right == nil) then

						return;

					end;

					local JK = V(eK.yaw_left) or 0;

					local KK = V(eK.yaw_right) or 0;

					local fK = V(eK.yaw_random) or 0;

					local eK = JK * fK * 0.01;

					local iK = KK * fK * 0.01;

					JK = JK + D(- eK, eK);

					KK = KK + D(- iK, iK);

					X.yaw = "180";

					X.yaw_offset = 0;

					X.yaw_left = JK;

					X.yaw_right = KK;

				end;

				local function eK(JK)

					if JK.yaw_jitter == nil then

						return;

					end;

					local KK = V(JK.yaw_jitter) or 'off';

					local fK = V(JK.jitter_offset) or 0;

					if KK ~= 'off' then

						local iK = (V(JK.jitter_random) or 0) * 0.01;

						local JK = fK * iK;

						fK = fK + D(- JK, JK);

					end;

					X.yaw_jitter = KK;

					X.jitter_offset = fK;

				end;

				local function JK(KK)

					if KK.body_yaw == nil then

						return;

					end;

					local fK = V(KK.body_yaw) or 'off';

					local iK = V(KK.body_yaw_offset) or 0;

					if fK == "jitter" then

						iK = 60;

					end;

					local UK = false;

					if fK ~= 'jitter' then

						UK = V(KK.freestanding_body_yaw) == true;

					end;

					X.body_yaw = fK;

					X.body_yaw_offset = iK;

					X.body_yaw_raw = fK;

					X.body_yaw_raw_offset = iK;

					X.freestanding_body_yaw = UK;

					local fK = (KK.secret_delay ~= nil) and (V(KK.secret_delay) == true);

					X.secret_delay = fK;

					if fK then

						X.delay = wK();

					elseif (KK.delay_from ~= nil) and (KK.delay_to ~= nil) then

						X.delay = D(V(KK.delay_from) or 1, V(KK.delay_to) or 1);

					end;

					if KK.invert_chance ~= nil then

						X.invert_chance = V(KK.invert_chance) or 100;

					end;

				end;

				function I:get(wK)

					return self[wK];

				end;

				function I:is_active_ex(wK)

					if wK == nil then

						return false;

					end;

					if wK.enabled == nil then

						return true;

					end;

					return V(wK.enabled) == true;

				end;

				function I:is_active(wK)

					return self:is_active_ex(self:get(wK));

				end;

				function I:apply_ex(wK)

					if wK == nil then

						return false;

					end;

					X.enabled = true;

					GK();

					vK(wK);

					uK(wK);

					eK(wK);

					JK(wK);

					return true;

				end;

				function I:apply(GK)

					local vK = self:get(GK);

					if vK == nil then

						return false, nil;

					end;

					if not self:is_active_ex(vK) then

						return false, vK;

					end;

					self:apply_ex(vK);

					return true, vK;

				end;

				function I:update(GK)

					local vK = d:get();

					local wK = ((type(vK) == 'string') and vK) or ((type(vK) == "table") and vK[# vK]) or nil;

					if wK == nil then

						return false, nil, nil;

					end;

					local vK = wK;

					local uK, eK = self:apply(wK);

					if (not uK) or (eK == nil) then

						local uK, JK = self:apply('global');

						if (uK == true) and (JK ~= nil) then

							eK = JK;

							wK = "global";

						else

							return false, nil, wK;

						end;

					end;

					if QK ~= nil then

						QK(GK, vK, wK);

					end;

					if rK ~= wK then

						DK = 0;

						LK = 0;

						rK = wK;

					end;

					return true, eK, wK;

				end;

				local function GK()

					if (X.defensive_active == true) and (jK ~= nil) and (jK.update_inverter ~= nil) then

						jK.update_inverter();

					end;

					local vK = math.max(1, X.delay or 1);

					DK = DK + 1;

					if DK < vK then

						return;

					end;

					local vK = true;

					if X.body_yaw == 'jitter' then

						local rK = nK(X.invert_chance);

						local wK = D(0, 100);

						vK = wK <= rK;

					end;

					LK = LK + 1;

					if vK then

						CK = not CK;

					end;

					DK = 0;

				end;

				local function DK()

					if X.body_yaw_offset == nil then

						return;

					end;

					if (X.yaw_left ~= nil) and (X.yaw_right ~= nil) then

						local vK = X.yaw_offset or 0;

						if X.body_yaw_offset < 0 then

							X.yaw_offset = vK + X.yaw_left;

						end;

						if X.body_yaw_offset > 0 then

							X.yaw_offset = vK + X.yaw_right;

						end;

					end;

				end;

				local function vK()

					if X.yaw_jitter == "offset" then

						local rK = X.yaw_offset or 0;

						local wK = X.jitter_offset or 0;

						X.yaw_jitter = "Off";

						X.jitter_offset = 0;

						X.yaw_offset = rK + ((CK and wK) or 0);

						return;

					end;

					if X.yaw_jitter == "center" then

						local rK = X.yaw_offset or 0;

						local wK = X.jitter_offset or 0;

						if not CK then

							wK = - wK;

						end;

						X.yaw_jitter = "Off";

						X.jitter_offset = 0;

						X.yaw_offset = rK + (wK / 2);

						return;

					end;

					if X.yaw_jitter == "skitter" then

						local rK = LK % # NK;

						local LK = NK[rK + 1];

						local NK = X.yaw_offset or 0;

						local rK = X.jitter_offset or 0;

						X.yaw_jitter = 'Off';

						X.jitter_offset = 0;

						X.yaw_offset = NK + (rK * LK);

						return;

					end;

					if X.yaw_jitter == 'spin' then

						local NK = globals.curtime() * 3;

						local LK = X.yaw_offset or 0;

						local rK = X.jitter_offset or 0;

						X.yaw_jitter = 'Off';

						X.jitter_offset = 0;

						X.yaw_offset = LK + C(- rK, rK, NK % 1);

						return;

					end;

				end;

				local function NK()

					if X.body_yaw == "jitter" then

						local LK = X.body_yaw_offset or 0;

						if LK == 0 then

							LK = 60;

						end;

						if not CK then

							LK = - LK;

						end;

						X.body_yaw = "Static";

						X.body_yaw_offset = LK;

					end;

				end;

				local function CK(LK)

					if (jK ~= nil) and jK.update_defensive then

						jK.update_defensive(LK);

					end;

				end;

				local function LK(rK)

					CK(rK);

					if rK.chokedcommands == 0 then

						GK();

					end;

					NK();

					vK();

					DK();

				end;

				function Z(CK)

					X:clear();

					local DK, NK, NK = I:update(CK);

					if DK ~= true then

						X:unset();

						MK = false;

						rawset(_G, "INFINIX_AA_BUILDER_ACTIVE", false);

						return;

					end;

					LK(CK);

					if qK then

						if OK and (mK ~= nil) and (V(mK) == true) then

							X.yaw_left = 0;

							X.yaw_right = 0;

							X.yaw_jitter = "Off";

							X.jitter_offset = 0;

							X.jitter_random = 0;

							X.body_yaw = 'Static';

							X.body_yaw_offset = 0;

							X.freestanding_body_yaw = false;

						end;

						if PK and (not WK()) then

							X.freestanding_body_yaw = false;

						elseif PK and (not OK) and (BK ~= nil) and (V(BK) == true) then

							local WK = tostring(X.body_yaw or 'off');

							X.freestanding_body_yaw = (WK ~= 'off') and (WK ~= 'jitter');

						end;

					end;

					MK = X.freestanding_body_yaw == true;

					X:set();

					rawset(_G, "INFINIX_AA_BUILDER_ACTIVE", true);

					rawset(_G, "INFINIX_AA_BUILDER_TICK", globals.tickcount());

					local MK, WK = nil, nil;

					local CK = z.antiaimbot.angles;

					if (CK.body_yaw ~= nil) and (CK.body_yaw[1] ~= nil) and (NATIVE_DECISION ~= nil) then

						local DK, DK = NATIVE_DECISION.peek(CK.body_yaw[1]);

						MK = DK;

					end;

					if (CK.body_yaw ~= nil) and (CK.body_yaw[2] ~= nil) and (NATIVE_DECISION ~= nil) then

						local DK, DK = NATIVE_DECISION.peek(CK.body_yaw[2]);

						WK = DK;

					end;

					rawset(_G, "INFINIX_AA_BUILDER_EXPECTS", {

						enabled = (X.enabled == true),

						state = NK,

						yaw = X.yaw,

						pitch = X.pitch,

						body_yaw = X.body_yaw,

						body_yaw_offset = X.body_yaw_offset,

						body_yaw_raw = X.body_yaw_raw,

						body_yaw_raw_offset = X.body_yaw_raw_offset,

						body_yaw_mode_owner = MK,

						body_yaw_offset_owner = WK,

						freestanding_body_yaw = (X.freestanding_body_yaw == true)

					});

				end;

				I.reset_inverter = TK;

				function yK(MK, WK, CK)

					local DK = (MK == "anti-aim") and (WK == 'builder');

					local MK = DK and infinix_is_preset_mode();

					c(T, DK and (not MK));

					c(lK, DK and (not MK));

					c(INFINIX_PRESET_MODE_NOTE_1, MK);

					c(INFINIX_PRESET_MODE_NOTE_2, MK);

					for T, lK in pairs(I) do

						if type(lK) == 'table' then

							local WK = DK and (not MK) and (T == CK);

							for T, T in pairs(lK) do

								if (type(T) == "userdata") or (type(T) == 'number') then

									c(T, WK);

								end;

							end;

						end;

					end;

					if MK then

						return;

					end;

					if DK and (CK ~= nil) then

						local T = I[CK];

						if T ~= nil then

							local lK = (T.enabled == nil) or (V(T.enabled) == true);

							if not lK then

								for lK, MK in pairs(T) do

									if (lK ~= "enabled") and ((type(MK) == "userdata") or (type(MK) == 'number')) then

										c(MK, false);

									end;

								end;

								return;

							end;

							local lK = V(T.body_yaw);

							if T.body_yaw_offset ~= nil then

								c(T.body_yaw_offset, (lK ~= nil) and (lK ~= 'off') and (lK ~= "jitter"));

							end;

							if T.freestanding_body_yaw ~= nil then

								c(T.freestanding_body_yaw, (lK ~= nil) and (lK ~= 'off') and (lK ~= 'jitter'));

							end;

							local lK = V(T.yaw_jitter);

							local MK = (lK ~= nil) and (lK ~= "off");

							if T.jitter_offset ~= nil then

								c(T.jitter_offset, MK);

							end;

							if T.jitter_random ~= nil then

								c(T.jitter_random, MK);

							end;

							local lK = (T.secret_delay ~= nil) and (V(T.secret_delay) == true);

							if T.delay_from ~= nil then

								c(T.delay_from, not lK);

							end;

							if T.delay_to ~= nil then

								c(T.delay_to, not lK);

							end;

						end;

					end;

				end;

				EK[# EK + 1] = yK;

				for T, T in ipairs(w) do

					local yK = I[T];

					o(yK.body_yaw, i);

					o(yK.yaw_jitter, i);

					o(yK.enabled, i);

					o(yK.secret_delay, i);

				end;

				zK[# zK + 1] = function(T)

					if hotkeys_pre_cmd ~= nil then

						hotkeys_pre_cmd(T);

					end;

					Z(T);

				end;

				for T, T in ipairs(w) do

					local Z = I[T];

					if type(Z) == "table" then

						local yK = T .. '_';

						pK('builder', yK .. "enabled", Z.enabled);

						pK('builder', yK .. 'yaw_left', Z.yaw_left);

						pK("builder", yK .. 'yaw_right', Z.yaw_right);

						pK("builder", yK .. "yaw_random", Z.yaw_random);

						pK('builder', yK .. 'yaw_jitter', Z.yaw_jitter);

						pK("builder", yK .. "jitter_offset", Z.jitter_offset);

						pK("builder", yK .. 'jitter_random', Z.jitter_random);

						pK("builder", yK .. 'body_yaw', Z.body_yaw);

						pK("builder", yK .. "body_offset", Z.body_yaw_offset);

						pK("builder", yK .. 'fs_body', Z.freestanding_body_yaw);

						pK('builder', yK .. 'delay_from', Z.delay_from);

						pK("builder", yK .. "delay_to", Z.delay_to);

						pK("builder", yK .. "secret_delay", Z.secret_delay);

						pK("builder", yK .. "invert_chance", Z.invert_chance);

					end;

				end;

			end)();

			local T;

			local Z = {};

			local yK = {};

			local lK = {};

			local MK;

			do

				local WK = {

					["slow motion"] = true,

					['leg movement'] = true,

					["on shot anti-aim"] = true,

					["fake peek"] = true

				};

				local function CK(DK)

					if WK[DK:lower()] then

						return DK .. ' ~';

					end;

					return DK;

				end;

				local function WK(DK, NK, ...)

					return Q(DK, 'AA', "Other", NK, ...);

				end;

				T = WK(ui.new_checkbox, 'defensive');

				for DK, DK in ipairs(w) do

					yK[DK] = false;

					lK[DK] = WK(ui.new_checkbox, '\a00000000defensive state ' .. DK);

					c(lK[DK], false);

				end;

				local DK = false;

				local function NK(LK)

					local GK = (LK and lK[LK]) or nil;

					local vK = V(GK);

					if vK ~= nil then

						yK[LK] = vK == true;

					end;

					return yK[LK] == true;

				end;

				local function LK(GK, vK)

					if GK == nil then

						return;

					end;

					vK = vK == true;

					yK[GK] = vK;

					local rK = lK[GK];

					if (rK ~= nil) and (V(rK) ~= vK) then

						O(rK, vK);

					end;

				end;

				local function GK(vK)

					if vK == nil then

						return;

					end;

					DK = true;

					local rK = NK(vK);

					if V(T) ~= rK then

						O(T, rK);

					end;

					DK = false;

				end;

				local function vK()

					if DK then

						return;

					end;

					local DK = r();

					local rK = V(T);

					if rK ~= nil then

						LK(DK, rK == true);

					end;

					if rK ~= true then

						X.defensive = nil;

					end;

					pcall(i);

				end;

				o(T, vK);

				local function DK(LK)

					local vK = {};

					local rK = n[LK] or LK;

					local function n(LK)

						return CK('\a00000000' .. rK .. '\aFFFFFFFF' .. 'a?? ' .. LK);

					end;

					vK.force_break_lc = WK(ui.new_checkbox, n('force break lc'));

					vK.force_break_lc_key = WK(ui.new_hotkey, n('force break lc key'), true);

					vK.pitch = WK(ui.new_combobox, n('pitch'), "off", "static", "sway", "switch", 'random', 'static random');

					vK.pitch_offset_1 = WK(ui.new_slider, n("pitch from"), - 89.0, 89, 0, true, 'd');

					vK.pitch_offset_2 = WK(ui.new_slider, n('pitch to'), - 89.0, 89, 0, true, 'd');

					vK.pitch_speed = WK(ui.new_slider, n('pitch speed'), - 75.0, 75, 20, true, nil, 0.1);

					vK.line_yaw = F('AA', "Other");

					vK.yaw = WK(ui.new_combobox, n("yaw"), 'off', 'side based', 'opposite', 'spin', 'sway', 'x-way', "random", 'left/right', "static random");

					vK.ways_count = WK(ui.new_slider, n('ways'), 3, 7, 3, true, "");

					vK.ways_custom = WK(ui.new_checkbox, n("custom ways"));

					for CK = 1, 7 do

						vK['way_' .. CK] = WK(ui.new_slider, n('way ' .. CK), - 180.0, 180, 0, true, "d");

					end;

					vK.yaw_offset = WK(ui.new_slider, n('yaw offset'), - 180.0, 180, 0, true, "d");

					vK.yaw_left = WK(ui.new_slider, n("yaw left"), - 180.0, 180, 0, true, "d");

					vK.yaw_right = WK(ui.new_slider, n("yaw right"), - 180.0, 180, 0, true, "d");

					vK.yaw_speed = WK(ui.new_slider, n("yaw speed"), - 75.0, 75, 20, true, '', 0.1);

					vK.ways_auto_body_yaw = WK(ui.new_checkbox, n("auto body"));

					vK.line_body = F("AA", 'Other');

					vK.body_yaw = WK(ui.new_combobox, n('body'), "off", "opposite", "static", "jitter");

					vK.body_yaw_offset = WK(ui.new_slider, n('body offset'), - 180.0, 180, 0, true, 'd');

					vK.freestanding_body_yaw = WK(ui.new_checkbox, n("freestand body"));

					vK.line_delay = F("AA", "Other");

					vK.delay_from = WK(ui.new_slider, n("delay from"), 1, 8, 1, true, "t");

					vK.delay_to = WK(ui.new_slider, n("delay to"), 1, 8, 1, true, "t");

					vK.secret_delay = WK(ui.new_checkbox, n('secret delay'));

					vK.line_delay_random = F("AA", "Other");

					vK.invert_chance = WK(ui.new_slider, n("delay randomization"), 0, 100, 100, true, "%");

					return vK;

				end;

				for n, n in ipairs(w) do

					Z[n] = DK(n);

				end;

				for n, n in ipairs(w) do

					local WK = Z[n];

					o(WK.pitch, i);

					o(WK.yaw, i);

					o(WK.body_yaw, i);

					o(WK.ways_custom, i);

					o(WK.ways_count, i);

					o(WK.secret_delay, i);

					o(WK.force_break_lc, i);

				end;

				local n = 0;

				local WK = 0;

				local CK = false;

				local DK = 0;

				local LK = nil;

				local function vK()

					return z.is_double_tap_active() or z.is_on_shot_antiaim_active();

				end;

				local function rK(TK, wK)

					local nK = V(wK.pitch);

					local uK = V(wK.pitch_offset_1) or 0;

					local eK = V(wK.pitch_offset_2) or 0;

					local JK = V(wK.pitch_speed) or 0;

					if (nK == 'off') or (nK == nil) then

						return;

					end;

					if nK == "static" then

						TK.pitch = "Custom";

						TK.pitch_offset = uK;

						return;

					end;

					if nK == 'sway' then

						local wK = globals.curtime() * JK * 0.1;

						TK.pitch = 'Custom';

						TK.pitch_offset = C(uK, eK, wK % 1);

						return;

					end;

					if nK == "switch" then

						TK.pitch = "Custom";

						TK.pitch_offset = (CK and eK) or uK;

						return;

					end;

					if nK == "random" then

						TK.pitch = "Custom";

						TK.pitch_offset = D(uK, eK);

						return;

					end;

					if nK == "static random" then

						local wK = f.get().defensive;

						if (wK ~= nil) and (wK.left == wK.max) then

							n = D(uK, eK);

						end;

						TK.pitch = 'Custom';

						TK.pitch_offset = n;

					end;

				end;

				local function n(TK, wK)

					local nK = V(wK.yaw);

					local uK = V(wK.yaw_offset) or 0;

					if (nK == "off") or (nK == nil) then

						return;

					end;

					TK.yaw_left = 0;

					TK.yaw_right = 0;

					TK.yaw_offset = 0;

					TK.yaw_jitter = 'Off';

					TK.jitter_offset = 0;

					if nK == "side based" then

						TK.yaw = '180';

						TK.yaw_offset = 0;

						TK.yaw_left = - uK;

						TK.yaw_right = uK;

					end;

					if nK == 'opposite' then

						TK.yaw = "180";

						TK.yaw_offset = - 180.0 + uK;

					end;

					if nK == 'spin' then

						TK.yaw = '180';

						TK.yaw_offset = (globals.curtime() * uK * 12) % 360;

					end;

					if nK == "sway" then

						local eK = V(wK.yaw_speed) or 0;

						local JK = V(wK.yaw_left) or 0;

						local KK = V(wK.yaw_right) or 0;

						local fK = globals.curtime() * eK * 0.1;

						TK.yaw = '180';

						TK.yaw_offset = C(JK, KK, fK % 1);

					end;

					if nK == "random" then

						TK.yaw = "180";

						TK.yaw_offset = D(- uK, uK);

					end;

					if nK == "left/right" then

						TK.yaw = "180";

						TK.yaw_offset = 0;

						TK.yaw_left = V(wK.yaw_left) or 0;

						TK.yaw_right = V(wK.yaw_right) or 0;

					end;

					if nK == 'static random' then

						local eK = f.get().defensive;

						if (eK ~= nil) and (eK.left == eK.max) then

							local eK = V(wK.yaw_left) or 0;

							local JK = V(wK.yaw_right) or 0;

							WK = D(eK, JK);

						end;

						TK.yaw = '180';

						TK.yaw_offset = WK;

					end;

					if nK == "x-way" then

						local WK = V(wK.ways_count) or 3;

						local nK = V(wK.ways_custom) or false;

						local eK = R.sent_packets or 0;

						local JK = eK % WK;

						if nK then

							local nK = wK["way_" .. (JK + 1)];

							if nK ~= nil then

								TK.yaw = "180";

								TK.yaw_offset = V(nK) or 0;

							end;

						else

							local nK = JK / (WK - 1);

							TK.yaw = "180";

							TK.yaw_offset = C(- uK, uK, nK);

						end;

						if V(wK.ways_auto_body_yaw) then

							local WK = 0;

							if TK.yaw_offset and (TK.yaw_offset < 0) then

								WK = - 1.0;

							end;

							if TK.yaw_offset and (TK.yaw_offset > 0) then

								WK = 1;

							end;

							TK.body_yaw = 'Static';

							TK.body_yaw_offset = WK;

						end;

					end;

				end;

				local function WK(TK, wK)

					if wK.body_yaw == nil then

						return;

					end;

					local nK = V(wK.body_yaw);

					local uK = V(wK.body_yaw_offset) or 0;

					if nK == 'jitter' then

						uK = 60;

					end;

					local eK = false;

					if nK ~= "jitter" then

						eK = V(wK.freestanding_body_yaw) or false;

					end;

					TK.body_yaw = nK;

					TK.body_yaw_offset = uK;

					TK.freestanding_body_yaw = eK;

					local nK = (wK.secret_delay ~= nil) and (V(wK.secret_delay) == true);

					TK.secret_delay = nK;

					if nK then

						local nK = rawget(_G, 'INFINIX_AA_SECRET_DELAY_VALUE');

						TK.delay = ((type(nK) == "function") and nK()) or 1;

					elseif (wK.delay_from ~= nil) and (wK.delay_to ~= nil) then

						TK.delay = D(V(wK.delay_from) or 1, V(wK.delay_to) or 1);

					end;

					if wK.invert_chance ~= nil then

						TK.invert_chance = V(wK.invert_chance) or 100;

					end;

				end;

				jK = {};

				local function TK(wK, nK)

					X.defensive = nil;

					X.defensive_active = nil;

					DK = 0;

					LK = nil;

					if (wK ~= nil) and (nK ~= true) then

						wK.force_defensive = false;

					end;

				end;

				function jK.apply(wK, nK)

					if bK() then

						TK(wK);

						return false;

					end;

					if nK == nil then

						TK(wK, (wK ~= nil) and (wK.force_defensive == true));

						return false;

					end;

					local uK = z.is_duck_peek_assist();

					if (not vK()) or uK then

						TK(wK, (wK ~= nil) and (wK.force_defensive == true));

						return false;

					end;

					local vK = f.get().defensive;

					if (vK == nil) or ((vK.left or 0) <= 0) then

						TK(wK, (wK ~= nil) and (wK.force_defensive == true));

						return false;

					end;

					local vK = {};

					WK(vK, nK);

					rK(vK, nK);

					n(vK, nK);

					X.defensive = vK;

					return true;

				end;

				function QK(n, QK, WK)

					if bK() then

						TK(n);

						return false;

					end;

					local vK = QK or WK;

					if vK == "moving" then

						TK(n);

						return false;

					end;

					local QK = vK or "global";

					if (not NK(QK)) and (QK ~= 'global') and NK("global") then

						QK = "global";

					end;

					if not NK(QK) then

						TK(n);

						return false;

					end;

					if LK ~= QK then

						DK = 0;

						LK = QK;

					end;

					local WK = Z[QK];

					local QK = jK.force_break_lc_active(WK);

					if WK == nil then

						TK(n);

						return false;

					end;

					local LK = jK.apply(n, WK) == true;

					if n ~= nil then

						n.force_defensive = LK or QK;

					end;

					return LK or QK;

				end;

				function jK.is_active()

					if bK() then

						return false;

					end;

					local n = ((d ~= nil) and d:get()) or "global";

					if n == "moving" then

						return false;

					end;

					if not NK(n) then

						if (n ~= 'global') and NK("global") then

							n = "global";

						else

							return false;

						end;

					end;

					local n = f.defensive_ticks_left;

					if n == nil then

						local QK = f.get().defensive;

						n = (QK and QK.left) or 0;

					end;

					return (n or 0) > 0;

				end;

				function jK.force_break_lc_active(n)

					if (n == nil) or (V(n.force_break_lc) ~= true) then

						return false;

					end;

					local QK = V(n.force_break_lc_key);

					if type(QK) == 'boolean' then

						return QK;

					end;

					return false;

				end;

				function jK.update_inverter()

					local n = math.max(1, X.delay or 1);

					DK = DK + 1;

					if DK < n then

						return;

					end;

					local n = invert_chance_value(X.invert_chance);

					if D(0, 100) <= n then

						CK = not CK;

					end;

					DK = 0;

				end;

				function jK.update_defensive(n)

					if bK() then

						TK(n);

						return false;

					end;

					local jK = X.defensive;

					local QK = z.is_double_tap_active() or z.is_on_shot_antiaim_active();

					if z.is_duck_peek_assist() then

						QK = false;

					end;

					local WK = (n ~= nil) and (n.force_defensive == true);

					if not QK then

						TK(n, WK);

						return false;

					end;

					local QK = f.get().defensive;

					local CK = (QK and QK.left) or f.defensive_ticks_left or 0;

					if (jK == nil) or ((CK or 0) <= 0) then

						TK(n, WK);

						return false;

					end;

					if X.copy then

						X:copy(jK);

					else

						for n, QK in pairs(jK) do

							X[n] = QK;

						end;

					end;

					X.defensive_active = true;

				end;

				local function n(jK)

					if I == nil then

						return true;

					end;

					local QK = I[jK];

					if (QK == nil) or (QK.enabled == nil) then

						return true;

					end;

					return V(QK.enabled) == true;

				end;

				function MK(jK, QK, WK, CK, DK, NK)

					if infinix_is_preset_mode() then

						return false;

					end;

					if (jK ~= 'anti-aim') or (QK ~= 'builder') then

						return false;

					end;

					if (CK ~= WK) or (yK[CK] ~= true) then

						return false;

					end;

					if not n(WK) then

						return false;

					end;

					if DK == nil then

						return false;

					end;

					local jK = tostring(NK or "");

					if (jK == 'pitch') or (jK == "yaw") or (jK == "body_yaw") or (jK == 'secret_delay') or (jK == 'invert_chance') or (jK == "force_break_lc") then

						return true;

					end;

					if jK == "force_break_lc_key" then

						return (DK.force_break_lc ~= nil) and (V(DK.force_break_lc) == true);

					end;

					if (jK == "line_yaw") or (jK == 'line_body') or (jK == "line_delay") or (jK == 'line_delay_random') then

						return true;

					end;

					local QK = V(DK.pitch) or "off";

					if jK == 'pitch_offset_1' then

						return QK ~= "off";

					end;

					if jK == 'pitch_offset_2' then

						return (QK == "sway") or (QK == 'switch') or (QK == 'random') or (QK == "static random");

					end;

					if jK == 'pitch_speed' then

						return QK == "sway";

					end;

					local QK = V(DK.yaw) or 'off';

					local WK = QK ~= 'off';

					if jK == "yaw_offset" then

						return WK and (QK ~= "sway") and (QK ~= 'left/right') and (QK ~= 'x-way') and (QK ~= 'static random');

					end;

					if (jK == "yaw_left") or (jK == 'yaw_right') then

						return WK and ((QK == "side based") or (QK == 'sway') or (QK == 'left/right') or (QK == "static random"));

					end;

					if jK == 'yaw_speed' then

						return QK == 'sway';

					end;

					if (jK == "ways_count") or (jK == 'ways_custom') or (jK == 'ways_auto_body_yaw') then

						return QK == "x-way";

					end;

					local WK = tonumber(jK:match('^way_(%d+)$'));

					if WK ~= nil then

						local CK = V(DK.ways_count) or 3;

						return (QK == 'x-way') and (V(DK.ways_custom) == true) and (WK <= CK);

					end;

					local QK = V(DK.body_yaw) or 'off';

					if jK == "body_yaw_offset" then

						return (QK ~= "off") and (QK ~= "jitter");

					end;

					if jK == 'freestanding_body_yaw' then

						return (QK ~= 'off') and (QK ~= "jitter");

					end;

					if (jK == 'delay_from') or (jK == 'delay_to') then

						return not ((DK.secret_delay ~= nil) and (V(DK.secret_delay) == true));

					end;

					return false;

				end;

				EK[# EK + 1] = function(jK, QK, WK)

					GK(WK);

					if infinix_is_preset_mode() then

						c(T, false);

						return;

					end;

					local CK = (jK == 'anti-aim') and (QK == 'builder');

					local jK = n(WK);

					local n = CK and jK;

					c(T, n);

					if n and (WK ~= nil) and (yK[WK] == true) then

						local n = Z[WK];

						if n ~= nil then

							local yK = V(n.pitch) or 'off';

							c(n.pitch_offset_1, yK ~= 'off');

							local jK = (yK == "sway") or (yK == 'switch') or (yK == "random") or (yK == 'static random');

							c(n.pitch_offset_2, jK);

							c(n.pitch_speed, yK == 'sway');

							local yK = V(n.yaw) or 'off';

							local jK = yK ~= 'off';

							c(n.yaw_offset, jK and (yK ~= "sway") and (yK ~= 'left/right') and (yK ~= 'x-way') and (yK ~= "static random"));

							local QK = jK and ((yK == "side based") or (yK == 'sway') or (yK == 'left/right') or (yK == 'static random'));

							c(n.yaw_left, QK);

							c(n.yaw_right, QK);

							c(n.yaw_speed, yK == "sway");

							local jK = yK == 'x-way';

							c(n.ways_count, jK);

							c(n.ways_custom, jK);

							c(n.ways_auto_body_yaw, jK);

							local yK = jK and (V(n.ways_custom) == true);

							local jK = V(n.ways_count) or 3;

							for QK = 1, 7 do

								c(n["way_" .. QK], yK and (QK <= jK));

							end;

							local yK = V(n.body_yaw) or 'off';

							local jK = yK ~= "off";

							c(n.body_yaw_offset, jK);

							c(n.freestanding_body_yaw, jK and (yK ~= "jitter"));

							local yK = (n.secret_delay ~= nil) and (V(n.secret_delay) == true);

							c(n.delay_from, not yK);

							c(n.delay_to, not yK);

							c(n.secret_delay, true);

							c(n.invert_chance, true);

							local yK = (n.force_break_lc ~= nil) and (V(n.force_break_lc) == true);

							c(n.force_break_lc, true);

							c(n.force_break_lc_key, yK);

						end;

					end;

				end;

				zK[# zK + 1] = function()

				end;

				pK("defensive", "master", T);

				for T, T in ipairs(w) do

					local n = Z[T];

					if type(n) == "table" then

						local yK = T .. "_";

						pK("defensive", yK .. 'enabled', lK[T]);

						pK("defensive", yK .. "pitch", n.pitch);

						pK('defensive', yK .. "pitch_off_1", n.pitch_offset_1);

						pK("defensive", yK .. 'pitch_off_2', n.pitch_offset_2);

						pK('defensive', yK .. "pitch_speed", n.pitch_speed);

						pK('defensive', yK .. "yaw", n.yaw);

						pK("defensive", yK .. 'ways_count', n.ways_count);

						pK("defensive", yK .. "ways_custom", n.ways_custom);

						for T = 1, 7 do

							pK("defensive", yK .. "way_" .. T, n["way_" .. T]);

						end;

						pK("defensive", yK .. "yaw_offset", n.yaw_offset);

						pK('defensive', yK .. 'yaw_left', n.yaw_left);

						pK("defensive", yK .. 'yaw_right', n.yaw_right);

						pK("defensive", yK .. "yaw_speed", n.yaw_speed);

						pK('defensive', yK .. "auto_body", n.ways_auto_body_yaw);

						pK("defensive", yK .. "body_yaw", n.body_yaw);

						pK("defensive", yK .. "body_offset", n.body_yaw_offset);

						pK("defensive", yK .. 'fs_body', n.freestanding_body_yaw);

						pK("defensive", yK .. 'delay_from', n.delay_from);

						pK('defensive', yK .. 'delay_to', n.delay_to);

						pK("defensive", yK .. "secret_delay", n.secret_delay);

						pK("defensive", yK .. 'invert_chance', n.invert_chance);

						pK('defensive', yK .. 'force_break_lc', n.force_break_lc);

						pK("defensive", yK .. "force_break_lc_key", n.force_break_lc_key);

					end;

				end;

			end;

			local T;

			local n;

			local yK;

			local jK;

			do

				local QK = aK['anti-aim'].hotkeys;

				local WK = {

					alpha = 0

				};

				local CK = Q(ui.new_checkbox, "AA", 'Anti-aimbot angles', 'yaw tweaks' .. b(''));

				local DK = Q(ui.new_checkbox, 'AA', 'Anti-aimbot angles', '  a?? static manual yaw' .. b(''));

				local NK = Q(ui.new_checkbox, 'AA', 'Anti-aimbot angles', "  a?? freestand yaw" .. b(''));

				local LK = Q(ui.new_hotkey, 'AA', "Anti-aimbot angles", "~ left" .. b(''));

				local GK = Q(ui.new_hotkey, "AA", 'Anti-aimbot angles', "~ right" .. b(""));

				local vK = Q(ui.new_hotkey, 'AA', "Anti-aimbot angles", '~ reset' .. b(""));

				local rK = Q(ui.new_hotkey, "AA", "Anti-aimbot angles", "~ freestanding" .. b(''));

				WK.arrows = Q(ui.new_combobox, 'AA', "Anti-aimbot angles", '  manual arrows', "off", 'classic', 'teamskeet', "cs2");

				WK.arrow_color = Q(ui.new_color_picker, 'AA', 'Anti-aimbot angles', "manual arrows color", 155, 213, 60, 235);

				WK.arrow_distance = Q(ui.new_slider, "AA", 'Anti-aimbot angles', "  a?? manual arrows distance", 25, 180, 47, true, 'px');

				c(WK.arrows, false);

				c(WK.arrow_color, false);

				c(WK.arrow_distance, false);

				local TK = F('AA', 'Anti-aimbot angles');

				local wK = Q(ui.new_checkbox, 'AA', 'Anti-aimbot angles', 'disable defensive' .. b(""));

				local nK = Q(ui.new_hotkey, 'AA', 'Anti-aimbot angles', "~ disable def" .. b(''), true);

				function bK()

					return (V(wK) == true) and (V(nK) == true);

				end;

				for uK, uK in ipairs({

					LK,

					GK,

					vK

				}) do

					if uK then

						pcall(ui.set, uK, 'Toggle');

					end;

				end;

				mK = DK;

				BK = NK;

				QK.yt_en = CK;

				QK.yt_static = DK;

				QK.yt_freestand = NK;

				QK.yt_left = LK;

				QK.yt_right = GK;

				QK.yt_reset = vK;

				QK.yt_fs = rK;

				QK.yt_arrows = WK.arrows;

				QK.yt_arrow_color = WK.arrow_color;

				QK.yt_arrow_distance = WK.arrow_distance;

				QK.yt_dd_rule = TK;

				QK.dd_en = wK;

				QK.dd_hk = nK;

				function yK(QK, mK)

					local BK = (QK == 'anti-aim') and (mK == 'hotkeys');

					if not BK then

						c(CK, false);

						c(DK, false);

						c(NK, false);

						c(LK, false);

						c(GK, false);

						c(vK, false);

						c(rK, false);

						c(WK.arrows, false);

						c(WK.arrow_color, false);

						c(WK.arrow_distance, false);

						c(TK, false);

						c(wK, false);

						c(nK, false);

						return;

					end;

					c(CK, true);

					local QK = V(CK) == true;

					c(DK, QK);

					c(NK, QK);

					c(LK, QK);

					c(GK, QK);

					c(vK, QK);

					c(rK, QK);

					c(WK.arrows, QK);

					local mK = QK and (tostring(V(WK.arrows) or "off") ~= 'off');

					c(WK.arrow_color, mK);

					c(WK.arrow_distance, mK);

					c(TK, true);

					c(wK, true);

					c(nK, V(wK) == true);

				end;

				EK[# EK + 1] = yK;

				o(CK, i);

				o(WK.arrows, i);

				o(wK, i);

				do

					local yK = z.antiaimbot.angles;

					if yK.freestanding and yK.freestanding[2] then

						h.set(yK.freestanding[2], 'Always on');

					end;

				end;

				local yK = nil;

				WK[1] = {

					yaw = - 90.0,

					ref = LK,

					active = nil

				};

				WK[2] = {

					yaw = 90,

					ref = GK,

					active = nil

				};

				local QK = nil;

				local function mK()

					if V(CK) ~= true then

						yK = nil;

						return;

					end;

					if vK then

						local BK, TK = pcall(ui.get, vK);

						if BK then

							if QK == nil then

								QK = TK;

							end;

							if TK ~= QK then

								QK = TK;

								if TK then

									yK = nil;

								end;

							end;

						end;

					end;

					for QK, BK in ipairs(WK) do

						if BK.ref then

							local TK, uK, eK = pcall(ui.get, BK.ref);

							if TK then

								if BK.active == nil then

									BK.active = uK;

								end;

								if BK.active ~= uK then

									BK.active = uK;

									if eK == 1 then

										yK = (uK and QK) or nil;

									elseif eK == 2 then

										yK = ((yK ~= QK) and QK) or nil;

									end;

								end;

							end;

						end;

					end;

				end;

				local function QK()

					local BK, TK, uK, eK, JK = pcall(ui.get, WK.arrow_color);

					if BK and (type(TK) == "number") then

						return TK, uK, eK, JK or 235;

					end;

					return 155, 213, 60, 235;

				end;

				local function BK(TK, uK, eK, JK, KK, fK, iK, UK)

					local xK = ((eK == 1) and 'i??') or 'i??';

					local tK, AK = infinix_dpi_measure_text('+', xK);

					tK = tK or 14;

					AK = AK or 14;

					local SK = ((eK == 1) and (((TK - tK) - JK) + 1)) or (TK + JK);

					infinix_dpi_text(SK, (uK - (AK * 0.5)) - 4, KK, fK, iK, UK, "+", 0, xK);

				end;

				local function TK(uK, eK, JK, KK, fK, iK, UK, xK)

					if type(renderer.triangle) ~= 'function' then

						BK(uK, eK, JK, KK, fK, iK, UK, xK);

						return;

					end;

					local tK = math.floor(13.5);

					local AK = X.body_yaw_offset or 0;

					local function SK(dK)

						if dK then

							return fK, iK, UK, xK;

						end;

						return 0, 0, 0, math.floor((127 * (xK / 255)) + 0.5);

					end;

					local function dK(RK)

						if RK then

							return fK, iK, UK, math.floor((xK * 0.78) + 0.5);

						end;

						return 0, 0, 0, math.floor((95 * (xK / 255)) + 0.5);

					end;

					local fK, iK, UK, xK = dK(AK < 0);

					local RK, kK, IK, FK = SK(JK == 1);

					infinix_dpi_rectangle((uK - KK) - 2, eK - 9, 2, 18, fK, iK, UK, xK);

					infinix_dpi_triangle(((uK - KK) - 2) - 2, eK - 9, ((uK - KK) - 2) - 2, eK + 9, (((uK - KK) - 2) - 2) - tK, eK, RK, kK, IK, FK);

					fK, iK, UK, xK = dK(AK > 0);

					RK, kK, IK, FK = SK(JK == 2);

					infinix_dpi_rectangle(uK + KK + 1, eK - 9, 2, 18, fK, iK, UK, xK);

					infinix_dpi_triangle(uK + KK + 2 + 2 + 1, eK - 9, uK + KK + 2 + 2 + 1, eK + 9, uK + KK + 2 + 2 + tK + 1, eK, RK, kK, IK, FK);

				end;

				local uK = nil;

				local function eK()

					if uK ~= nil then

						return uK;

					end;

					uK = false;

					if (type(renderer.load_png_alt) ~= 'function') or (type(renderer.texture) ~= 'function') then

						return false;

					end;

					local JK, KK = {}, 1;

					for fK = 1, 64 do

						for iK = 1, 64 do

							local UK, xK = iK - 32.5, fK - 32.5;

							local fK = (UK * UK) + (xK * xK);

							local iK = math.floor((205 * math.exp(- fK / 220.5)) + 0.5);

							JK[KK] = string.char(255, 255, 255, iK);

							KK = KK + 1;

						end;

					end;

					local KK, fK = pcall(renderer.load_png_alt, table.concat(JK), 64, 64);

					if KK and fK then

						uK = fK;

					end;

					return uK;

				end;

				local function uK(JK, KK, fK, iK, UK, xK, tK, AK)

					local SK = ((fK == 1) and (JK - iK)) or (JK + iK);

					local JK = eK();

					if JK then

						local eK = pcall(infinix_dpi_texture, JK, SK - 15.5, KK - 15.5, 31, 31, UK, xK, tK, AK, 'f');

						if eK then

							return;

						end;

					end;

					local eK = AK * 0.46;

					if type(renderer.circle) == 'function' then

						local function JK(fK)

							if fK <= 3 then

								return eK;

							end;

							local iK = fK - 3;

							return eK * math.exp(- (iK * iK) / 32);

						end;

						for eK = 11, 3, - 1.0 do

							local fK = math.floor((JK(eK) - JK(eK + 1)) + 0.5);

							if fK > 0 then

								infinix_dpi_circle(SK, KK, UK, xK, tK, fK, eK, 0, 1);

							end;

						end;

					elseif type(renderer.circle_outline) == 'function' then

						for eK = 11, 3, - 1.0 do

							local JK = (11 - eK) / 8;

							local fK = math.floor((AK * (0.004 + (0.04 * JK * JK))) + 0.5);

							if fK > 0 then

								infinix_dpi_circle_outline(SK, KK, UK, xK, tK, fK, eK, 0, 1, 2);

							end;

						end;

					else

						infinix_dpi_rectangle(SK - 2, KK - 2, 4, 4, UK, xK, tK, math.floor(AK * 0.2));

					end;

				end;

				local function eK()

					local JK = tostring(V(WK.arrows) or "off");

					local KK = entity.get_local_player();

					local fK = (KK ~= nil) and entity.is_alive(KK);

					local KK = ((V(CK) == true) and fK and (yK ~= nil) and (JK ~= "off") and 1) or 0;

					local fK = (globals.absoluteframetime and globals.absoluteframetime()) or (globals.frametime and globals.frametime()) or 0.0083333333333333;

					if fK < 0 then

						fK = 0;

					end;

					if fK > 0.1 then

						fK = 0.1;

					end;

					WK.alpha = WK.alpha + ((KK - WK.alpha) * (1 - math.exp(- fK * 14)));

					if WK.alpha <= 0.01 then

						return;

					end;

					local KK, fK = infinix_dpi_screen_size();

					if (not KK) or (not fK) then

						return;

					end;

					local iK, UK = math.floor(KK * 0.5), math.floor(fK * 0.5);

					local KK, fK, xK, tK = QK();

					if yK ~= nil then

						WK.last = yK;

					end;

					local QK = yK or WK.last or 2;

					tK = math.floor((tK * WK.alpha) + 0.5);

					local AK = H(tonumber(V(WK.arrow_distance)) or 47, 25, 180);

					if JK == "teamskeet" then

						TK(iK, UK, QK, AK, KK, fK, xK, tK);

					elseif JK == 'cs2' then

						uK(iK, UK, QK, AK, KK, fK, xK, tK);

					else

						BK(iK, UK, QK, AK, KK, fK, xK, tK);

					end;

				end;

				jK = eK;

				function n()

					local QK = z.antiaimbot.angles;

					local BK = globals.tickcount();

					local TK, uK, eK;

					if rawget(_G, 'INFINIX_YT_TICK') == BK then

						TK = rawget(_G, "INFINIX_YT_ON") == true;

						uK = rawget(_G, 'INFINIX_YT_FS_ACTIVE') == true;

						eK = rawget(_G, 'INFINIX_YT_MANUAL');

					else

						TK = V(CK) == true;

						uK = TK and (V(rK) == true);

						if TK then

							mK();

						else

							yK = nil;

						end;

						eK = yK;

					end;

					OK = TK and (eK ~= nil);

					if QK.freestanding and QK.freestanding[1] then

						if uK then

							aa_request(AA_OWNER_HOTKEY_FS, 60, 'freestand hotkey', QK.freestanding[1], true);

							if QK.freestanding[2] then

								aa_request(AA_OWNER_HOTKEY_FS, 60, "freestand hotkey", QK.freestanding[2], "Always on");

							end;

						else

							aa_clear_owner(AA_OWNER_HOTKEY_FS);

						end;

					end;

					PK = uK;

					oK = false;

					if eK ~= nil then

						local yK = WK[eK].yaw;

						if QK.freestanding and QK.freestanding[1] then

							aa_request(AA_OWNER_MANUAL, 70, 'manual yaw', QK.freestanding[1], false);

						end;

						if QK.yaw and QK.yaw[2] then

							aa_request(AA_OWNER_MANUAL, 70, "manual yaw", QK.yaw[2], yK);

						end;

						if QK.yaw_base then

							aa_request(AA_OWNER_MANUAL, 70, "manual yaw", QK.yaw_base, "Local view");

						end;

						if QK.body_yaw and QK.body_yaw[1] then

							aa_request(AA_OWNER_MANUAL, 70, "manual yaw", QK.body_yaw[1], 'Static');

						end;

					else

						aa_clear_owner(AA_OWNER_MANUAL);

					end;

					qK = TK and ((eK ~= nil) or uK or oK);

				end;

				zK[# zK + 1] = n;

				T = {

					yt_en = CK,

					yt_static = DK,

					yt_freestand = NK,

					yt_left = LK,

					yt_right = GK,

					yt_reset = vK,

					yt_fs = rK,

					yt_arrows = WK.arrows,

					yt_arrow_color = WK.arrow_color,

					yt_arrow_distance = WK.arrow_distance

				};

				pK("hotkeys", 'yt_en', CK);

				pK("hotkeys", "yt_static", DK);

				pK('hotkeys', 'yt_freestand', NK);

				pK('hotkeys', 'yt_left', LK);

				pK('hotkeys', "yt_right", GK);

				pK("hotkeys", 'yt_reset', vK);

				pK('hotkeys', 'yt_fs', rK);

				pK("hotkeys", "yt_arrows", WK.arrows);

				pK('hotkeys', "yt_arrow_color", WK.arrow_color);

				pK('hotkeys', 'yt_arrow_distance', WK.arrow_distance);

				pK('hotkeys', 'dd_en', wK);

				pK("hotkeys", "dd_hk", nK);

			end;

			local n;

			local yK;

			local QK;

			(function()

				local qK = aK["anti-aim"].settings;

				local PK = Q(ui.new_checkbox, "AA", "Anti-aimbot angles", 'avoid backstab' .. b(''));

				local oK = Q(ui.new_checkbox, "AA", 'Anti-aimbot angles', "fast ladder" .. b(''));

				local mK = Q(ui.new_checkbox, 'AA', 'Anti-aimbot angles', 'safe head' .. b(''));

				local BK = Q(ui.new_multiselect, 'AA', "Anti-aimbot angles", '  a?? safe head conditions' .. b(""), {

					'standing',

					"crouch",

					'air crouch knife',

					'air crouch zeus',

					"distance"

				});

				local WK = Q(ui.new_checkbox, "AA", 'Anti-aimbot angles', 'e-bomb fix' .. b(""));

				local CK = Q(ui.new_checkbox, 'AA', "Anti-aimbot angles", 'flick exploit' .. b(''));

				local DK = Q(ui.new_multiselect, "AA", "Anti-aimbot angles", "  flick states" .. b(""), {

					'standing',

					'moving',

					'slow walk',

					"air",

					"air-crouch",

					"crouch",

					"move-crouch"

				});

				local NK = Q(ui.new_combobox, 'AA', "Anti-aimbot angles", '  flick pitch' .. b(""), "off", 'static', 'sway', "switch", "random", 'static random');

				local LK = Q(ui.new_slider, "AA", "Anti-aimbot angles", '  flick pitch from' .. b(''), - 89.0, 89, 0, true, 'A ');

				local GK = Q(ui.new_slider, 'AA', "Anti-aimbot angles", "  flick pitch to" .. b(""), - 89.0, 89, 0, true, 'A ');

				local vK = Q(ui.new_slider, "AA", "Anti-aimbot angles", '  flick pitch speed' .. b(""), - 75.0, 75, 20, true);

				local rK = Q(ui.new_checkbox, 'AA', 'Fake lag', "custom fakelag" .. b(''));

				local TK = Q(ui.new_slider, "AA", "Fake lag", "base choke" .. b(''), 1, 15, 14, true, 't');

				QK = rK;

				qK.ab_en = PK;

				qK.fl_en = oK;

				qK.sh_en = mK;

				qK.sh_cond = BK;

				qK.eb_en = WK;

				qK.fx_en = CK;

				qK.fx_states = DK;

				qK.fx_pitch = NK;

				qK.fx_p_off1 = LK;

				qK.fx_p_off2 = GK;

				qK.fx_p_speed = vK;

				function yK(qK, wK)

					local nK = (qK == "anti-aim") and (wK == "settings");

					c(PK, nK);

					c(oK, nK);

					c(mK, nK);

					c(WK, nK);

					c(CK, nK);

					if not nK then

						c(rK, false);

						c(TK, false);

						return;

					end;

					local qK = V(mK) == true;

					c(BK, qK);

					local qK = V(CK) == true;

					c(DK, qK);

					c(NK, qK);

					c(LK, qK);

					c(GK, qK);

					c(vK, qK);

					c(rK, true);

					c(TK, V(rK) == true);

				end;

				EK[# EK + 1] = yK;

				local function yK()

					rawset(_G, "INFINIX_AB_ON", V(PK) == true);

					rawset(_G, "INFINIX_FL_ON", V(oK) == true);

					rawset(_G, 'INFINIX_SH_ON', V(mK) == true);

					rawset(_G, 'INFINIX_EB_ON', V(WK) == true);

					rawset(_G, 'INFINIX_FX_ON', V(CK) == true);

					rawset(_G, "INFINIX_CF_ON", V(rK) == true);

				end;

				yK();

				o(PK, yK);

				o(oK, yK);

				o(WK, yK);

				o(mK, function()

					yK();

					pcall(i);

				end);

				o(CK, function()

					yK();

					pcall(i);

				end);

				local qK = {

					CWeaponTaser = {

						type = "knife",

						idx = 31,

						max_speed = 220

					},

					CKnife = {

						type = 'knife',

						max_speed = 250

					},

					CKnifeGG = {

						type = "knife",

						max_speed = 250

					},

					CWeaponRevolver = {

						type = "pistol",

						is_revolver = true,

						max_speed = 180,

						max_speed_alt = 180

					},

					CDEagle = {

						type = 'pistol',

						max_speed = 230

					},

					CFlashbang = {

						type = "grenade",

						max_speed = 245

					},

					CHEGrenade = {

						type = "grenade",

						max_speed = 245

					},

					CSmokeGrenade = {

						type = 'grenade',

						max_speed = 245

					},

					CMolotovGrenade = {

						type = "grenade",

						max_speed = 245

					},

					CIncendiaryGrenade = {

						type = "grenade",

						max_speed = 245

					},

					CDecoyGrenade = {

						type = 'grenade',

						max_speed = 245

					},

					CSensorGrenade = {

						type = "grenade",

						max_speed = 245

					}

				};

				local function wK(nK)

					if nK == nil then

						return nil;

					end;

					local uK = entity.get_classname(nK) or "";

					local nK = qK[uK];

					if nK then

						return nK;

					end;

					if uK:find("Knife") then

						return {

							type = "knife",

							max_speed = 250

						};

					end;

					if uK:find('Grenade') or uK:find("Flashbang") then

						return {

							type = 'grenade',

							max_speed = 245

						};

					end;

					return {

						type = 'other',

						idx = 0,

						max_speed = 250

					};

				end;

				local function qK(nK)

					if nK == nil then

						return nil;

					end;

					local uK, eK, JK = entity.get_origin(nK);

					if uK == nil then

						return nil;

					end;

					local KK, fK, iK = entity.get_prop(nK, 'm_vecViewOffset');

					return uK + (KK or 0), eK + (fK or 0), JK + (iK or 64);

				end;

				local function nK(uK, eK, JK, KK, fK, iK, UK)

					local xK = UK * (globals.tickinterval() or 0.015625);

					return uK + (KK * xK), eK + (fK * xK), JK + (iK * xK);

				end;

				local function uK(eK, JK, KK)

					local fK = rawget(_G, "infinix_predict_rework");

					if (type(fK) ~= 'table') or (type(fK.predict_eye) ~= "function") then

						return nil;

					end;

					if type(fK.is_enabled) == 'function' then

						local iK, UK = pcall(fK.is_enabled);

						if (not iK) or (UK ~= true) then

							return nil;

						end;

					end;

					local iK, UK, xK, tK = pcall(fK.predict_eye, eK, JK, {

						purpose = (KK or "safe_head"),

						max_ticks = JK,

						allow_untrusted = false

					});

					if iK and (UK ~= nil) then

						return UK, xK, tK;

					end;

					return nil;

				end;

				local function eK(JK)

					if JK == nil then

						return false;

					end;

					local KK = tostring(entity.get_classname(JK) or '');

					local JK = KK:lower();

					if JK:find("taser", 1, true) or JK:find('zeus', 1, true) then

						return false;

					end;

					return (JK:find("knife", 1, true) ~= nil) or (JK:find('bayonet', 1, true) ~= nil);

				end;

				local JK = 0;

				local KK, fK = nil, 0;

				local function iK()

					if V(PK) ~= true then

						return;

					end;

					local UK = entity.get_local_player();

					if (UK == nil) or (not entity.is_alive(UK)) then

						return;

					end;

					local xK, tK, AK = entity.get_origin(UK);

					if xK == nil then

						return;

					end;

					local UK, SK = L();

					if UK == nil then

						return;

					end;

					local dK = math.huge;

					local RK = false;

					local kK = nil;

					for IK = 1, SK do

						local SK = UK[IK];

						local UK = entity.get_player_weapon(SK);

						if eK(UK) then

							local eK, UK, IK = entity.get_origin(SK);

							if eK ~= nil then

								local FK, ZK = eK - xK, UK - tK;

								local eK = (IK or AK) - AK;

								local UK = (FK * FK) + (ZK * ZK) + (eK * eK);

								if (UK < dK) and (UK < 102400) then

									dK = UK;

									RK = true;

									kK = SK;

								end;

							end;

						end;

					end;

					local eK = (globals.tickcount and globals.tickcount()) or 0;

					if RK then

						JK = eK + 28;

						fK = eK + 64;

						KK = kK;

					elseif (KK ~= nil) and (eK <= fK) and entity.is_alive(KK) then

						local fK, UK, SK = entity.get_origin(KK);

						if fK ~= nil then

							local KK, dK = fK - xK, UK - tK;

							local fK = (SK or AK) - AK;

							if ((KK * KK) + (dK * dK) + (fK * fK)) < 102400 then

								RK = true;

								JK = math.max(JK, eK + 14);

							end;

						end;

					end;

					if RK or (eK <= JK) then

						local eK = z.antiaimbot.angles;

						if eK.pitch and eK.pitch[1] then

							aa_request(AA_OWNER_BACKSTAB, 95, "avoid backstab", eK.pitch[1], 'Down');

						end;

						if eK.yaw_base then

							aa_request(AA_OWNER_BACKSTAB, 95, "avoid backstab", eK.yaw_base, "At targets");

						end;

						if eK.yaw and eK.yaw[1] then

							aa_request(AA_OWNER_BACKSTAB, 95, "avoid backstab", eK.yaw[1], '180');

						end;

						if eK.yaw and eK.yaw[2] then

							aa_request(AA_OWNER_BACKSTAB, 95, 'avoid backstab', eK.yaw[2], 180);

						end;

						if eK.yaw_jitter and eK.yaw_jitter[1] then

							aa_request(AA_OWNER_BACKSTAB, 95, 'avoid backstab', eK.yaw_jitter[1], 'Off');

						end;

						if eK.yaw_jitter and eK.yaw_jitter[2] then

							aa_request(AA_OWNER_BACKSTAB, 95, "avoid backstab", eK.yaw_jitter[2], 0);

						end;

						if eK.body_yaw and eK.body_yaw[1] then

							aa_request(AA_OWNER_BACKSTAB, 95, "avoid backstab", eK.body_yaw[1], 'Static');

						end;

						if eK.body_yaw and eK.body_yaw[2] then

							aa_request(AA_OWNER_BACKSTAB, 95, "avoid backstab", eK.body_yaw[2], 0);

						end;

						if eK.freestanding_body_yaw then

							aa_request(AA_OWNER_BACKSTAB, 95, "avoid backstab", eK.freestanding_body_yaw, false);

						end;

						if eK.edge_yaw then

							aa_request(AA_OWNER_BACKSTAB, 95, 'avoid backstab', eK.edge_yaw, false);

						end;

						if eK.freestanding and eK.freestanding[1] then

							aa_request(AA_OWNER_BACKSTAB, 95, "avoid backstab", eK.freestanding[1], false);

						end;

						if eK.roll then

							aa_request(AA_OWNER_BACKSTAB, 95, 'avoid backstab', eK.roll, 0);

						end;

						return true;

					end;

				end;

				local function eK(JK)

					local KK = wK(JK);

					if (KK == nil) or (KK.type ~= 'grenade') then

						return false;

					end;

					local KK = entity.get_prop(JK, 'm_fThrowTime');

					if (KK == nil) or (KK == 0) then

						return false;

					end;

					return true;

				end;

				local function JK(KK)

					if V(oK) ~= true then

						return;

					end;

					local fK = entity.get_local_player();

					if fK == nil then

						return;

					end;

					local UK = entity.get_prop(fK, "m_MoveType") or entity.get_prop(fK, "m_iMoveType");

					if (UK ~= 9) or R.is_onground then

						return;

					end;

					KK.yaw = math.floor(0.5 + (KK.yaw or 0));

					KK.roll = 0;

					local UK = entity.get_player_weapon(fK);

					if UK == nil then

						return;

					end;

					if eK(UK) then

						return;

					end;

					local eK, UK, xK = entity.get_prop(fK, 'm_vecLadderNormal');

					if (eK == nil) or (((eK * eK) + (UK * UK) + (xK * xK)) == 0) then

						return;

					end;

					local fK, tK = client.camera_angles();

					local AK, SK = N(eK, UK, xK);

					local eK = p((SK - tK) + 180);

					local UK = H(AK - fK, - 89.0, 89);

					local fK = math.abs(eK);

					local xK = - 90.0;

					local tK = UK < - 45.0;

					local UK = eK > 0;

					local eK = (KK.sidemove or 0) > 0;

					local AK = (KK.forwardmove or 0) > 0;

					if (fK > 70) and (fK < 135) then

						if ((KK.forwardmove or 0) ~= 0) or ((KK.sidemove or 0) == 0) then

							return;

						end;

						if not UK then

							xK = - xK;

						end;

						if UK then

							eK = not eK;

						end;

						KK.in_back = (eK and 1) or 0;

						KK.in_forward = (eK and 0) or 1;

						if UK then

							eK = not eK;

						end;

						KK.in_moveleft = (eK and 1) or 0;

						KK.in_moveright = (eK and 0) or 1;

						KK.pitch = 89;

						KK.yaw = p(SK + xK);

						return;

					end;

					if ((KK.sidemove or 0) ~= 0) or ((KK.forwardmove or 0) == 0) then

						return;

					end;

					if not UK then

						xK = - xK;

					end;

					if not tK then

						AK = not AK;

					end;

					KK.in_back = (AK and 0) or 1;

					KK.in_forward = (AK and 1) or 0;

					if not UK then

						AK = not AK;

					end;

					KK.in_moveleft = (AK and 1) or 0;

					KK.in_moveright = (AK and 0) or 1;

					KK.pitch = 89;

					KK.yaw = p(SK + xK);

				end;

				local p = 0;

				local function eK(KK, fK, UK, xK, tK, AK, SK, dK)

					local RK, kK = client.trace_line(KK, fK, UK, xK, tK, AK, SK, false);

					if RK ~= dK then

						return 0;

					end;

					return kK or 0;

				end;

				local function KK(fK, UK)

					local xK = entity.get_prop(fK, "m_iHealth") or 0;

					if xK <= 0 then

						return false;

					end;

					local tK, AK, SK = qK(UK);

					if tK == nil then

						return nil;

					end;

					local dK, RK, kK = entity.hitbox_position(fK, 0);

					if dK == nil then

						return nil;

					end;

					if eK(UK, tK, AK, SK, dK, RK, kK, fK) >= xK then

						return true;

					end;

					local IK, FK, ZK = uK(UK, 32, 'safe_head');

					if (IK ~= nil) and (eK(UK, IK, FK, ZK, dK, RK, kK, fK) >= xK) then

						return true;

					end;

					local IK, FK, ZK = entity.get_prop(UK, 'm_vecVelocity');

					if IK ~= nil then

						local yA, jA, QA = nK(tK, AK, SK, IK, FK, ZK, 32);

						if eK(UK, yA, jA, QA, dK, RK, kK, fK) >= xK then

							return true;

						end;

					end;

					return false;

				end;

				local function fK(UK, xK)

					local tK = entity.get_prop(UK, "m_iHealth") or 0;

					if tK <= 0 then

						return false;

					end;

					local AK, SK, dK = qK(xK);

					if AK == nil then

						return nil;

					end;

					local RK, kK, IK = entity.hitbox_position(UK, 3);

					if RK == nil then

						return nil;

					end;

					if eK(xK, AK, SK, dK, RK, kK, IK, UK) >= tK then

						return true;

					end;

					local FK, ZK, yA = uK(xK, 16, 'safe_head');

					if (FK ~= nil) and (eK(xK, FK, ZK, yA, RK, kK, IK, UK) >= tK) then

						return true;

					end;

					local uK, FK, ZK = entity.get_prop(xK, 'm_vecVelocity');

					if uK ~= nil then

						local yA, jA, QA = nK(AK, SK, dK, uK, FK, ZK, 16);

						if eK(xK, yA, jA, QA, RK, kK, IK, UK) >= tK then

							return true;

						end;

					end;

					return false;

				end;

				local function nK(uK, eK)

					local UK = entity.get_player_weapon(uK);

					if UK == nil then

						return nil;

					end;

					local xK = wK(UK);

					if xK == nil then

						return nil;

					end;

					local UK = xK.type == 'knife';

					local tK = xK.idx == 31;

					local xK, AK, SK = entity.get_origin(uK);

					local uK, dK, RK = entity.get_origin(eK);

					if (xK == nil) or (uK == nil) then

						return nil;

					end;

					local eK, kK = uK - xK, dK - AK;

					local uK = - (RK - SK);

					local xK = (eK * eK) + (kK * kK);

					if R.is_onground then

						local eK = (not R.is_moving) or R.is_crouched;

						if eK and (uK >= 10) and (xK > 1000000) then

							return "distance";

						end;

						if R.is_crouched then

							if uK >= 48 then

								return "crouch";

							end;

						elseif (not R.is_moving) and (uK >= 24) then

							return "standing";

						end;

						return nil;

					end;

					if R.is_crouched then

						if tK and (uK > - 20.0) and (xK < 250000) then

							return "air crouch zeus";

						end;

						if UK then

							return "air crouch knife";

						end;

						if uK > 160 then

							return 'air crouch';

						end;

					end;

					return nil;

				end;

				local function uK(eK)

					if V(mK) ~= true then

						return;

					end;

					local UK = entity.get_local_player();

					if UK == nil then

						return;

					end;

					if entity.get_local_player == nil then

						return;

					end;

					local xK = entity.get_local_player();

					if xK == nil then

						return;

					end;

					local tK = nK(UK, xK);

					if tK == nil then

						return;

					end;

					if not g(BK, tK) then

						return;

					end;

					if z.is_freestanding() or YK() then

						p = 0;

						return;

					end;

					if entity.is_dormant then

						local nK, tK = pcall(entity.is_dormant, xK);

						if nK and tK then

							p = 0;

							return;

						end;

					end;

					local nK, tK, AK = entity.get_prop(UK, "m_vecVelocity");

					local SK = 0;

					if nK ~= nil then

						SK = math.sqrt((nK * nK) + ((tK or 0) * (tK or 0)) + ((AK or 0) * (AK or 0)));

					end;

					local nK, nK, nK = qK(xK);

					local tK, tK, tK = entity.get_origin(UK);

					local AK = (R.is_crouched and 45) or 60;

					local dK = math.ceil((tK + AK) - (nK or 0));

					local nK = not R.is_onground;

					local tK = R.is_crouched;

					local AK = (SK <= 1.1001) and (not tK) and (not nK);

					local RK = entity.get_player_weapon(UK);

					local kK = (RK and wK(RK)) or nil;

					local RK = (kK and (kK.max_speed_alt or kK.max_speed)) or 250;

					if (entity.get_prop(UK, "m_bIsScoped") == 1) and kK and kK.max_speed_alt then

						RK = kK.max_speed_alt;

					end;

					if tK then

						RK = RK * 0.34;

					end;

					local IK = (SK > 1.1001) and (SK < (RK - (RK * 0.1)));

					local SK = (eK.in_forward == 1) or ((eK.forwardmove or 0) > 0);

					local RK = (eK.in_back == 1) or ((eK.forwardmove or 0) < 0);

					local FK = (eK.in_moveright == 1) or ((eK.sidemove or 0) > 0);

					local ZK = (eK.in_moveleft == 1) or ((eK.sidemove or 0) < 0);

					local yA = entity.get_prop(UK, 'm_iTeamNum');

					local jA = false;

					local QA = (kK and (kK.type == 'knife')) or false;

					if QA and nK and tK then

						jA = (((yA == 3) and - 35.0) or - 20.0) < dK;

					else

						local kK = (AK and ((((yA == 3) and - 6.0) or 20) <= dK)) or (tK and (not nK) and ((((yA == 3) and - 20.0) or - 4.0) <= dK));

						local tK = entity.get_prop(xK, 'm_fFlags') or 0;

						local dK = bit.band(tK, 1) ~= 0;

						local tK, yA = entity.get_prop(xK, 'm_vecVelocity');

						local QA = 0;

						if tK ~= nil then

							QA = math.sqrt((tK * tK) + ((yA or 0) * (yA or 0)));

						end;

						local tK = fK(UK, xK);

						local fK = ((not dK) and (QA > 75)) or (tK ~= true);

						if kK and fK then

							local fK = KK(UK, xK);

							local KK = globals.tickcount();

							if fK == false then

								jA = true;

								p = KK + 16;

							elseif fK == true then

								jA = false;

								p = 0;

							else

								jA = p >= KK;

							end;

						end;

					end;

					if not jA then

						return;

					end;

					local p;

					if AK then

						p = 35;

					elseif nK then

						p = 32;

					elseif SK and ((eK.forwardmove or 0) > 0) then

						if IK then

							p = (FK and ((eK.sidemove or 0) > 0) and 33) or (ZK and ((eK.sidemove or 0) < 0) and 20) or 20;

						else

							p = (FK and ((eK.sidemove or 0) > 0) and 38) or (ZK and ((eK.sidemove or 0) < 0) and 14) or 26;

						end;

					elseif RK and ((eK.forwardmove or 0) < 0) then

						p = (FK and ((eK.sidemove or 0) > 0) and 30) or (ZK and ((eK.sidemove or 0) < 0) and 20) or 30;

					else

						p = (FK and ((eK.sidemove or 0) > 0) and 38) or (ZK and ((eK.sidemove or 0) < 0) and 20) or 32;

					end;

					p = - p + 45;

					local nK = z.antiaimbot.angles;

					if nK.pitch and nK.pitch[1] then

						aa_request(AA_OWNER_SAFE_HEAD, 80, 'safe head', nK.pitch[1], 'Down');

					end;

					if nK.yaw_base then

						aa_request(AA_OWNER_SAFE_HEAD, 80, 'safe head', nK.yaw_base, "At targets");

					end;

					if nK.yaw and nK.yaw[1] then

						aa_request(AA_OWNER_SAFE_HEAD, 80, 'safe head', nK.yaw[1], "180");

					end;

					if nK.yaw and nK.yaw[2] then

						aa_request(AA_OWNER_SAFE_HEAD, 80, 'safe head', nK.yaw[2], p);

					end;

					if nK.yaw_jitter and nK.yaw_jitter[1] then

						aa_request(AA_OWNER_SAFE_HEAD, 80, "safe head", nK.yaw_jitter[1], 'Off');

					end;

					if nK.yaw_jitter and nK.yaw_jitter[2] then

						aa_request(AA_OWNER_SAFE_HEAD, 80, "safe head", nK.yaw_jitter[2], 0);

					end;

					if nK.body_yaw and nK.body_yaw[1] then

						aa_request(AA_OWNER_SAFE_HEAD, 80, "safe head", nK.body_yaw[1], 'Static');

					end;

					if nK.body_yaw and nK.body_yaw[2] then

						aa_request(AA_OWNER_SAFE_HEAD, 80, 'safe head', nK.body_yaw[2], 0);

					end;

					if nK.freestanding_body_yaw then

						aa_request(AA_OWNER_SAFE_HEAD, 80, 'safe head', nK.freestanding_body_yaw, false);

					end;

					if nK.roll then

						aa_request(AA_OWNER_SAFE_HEAD, 80, "safe head", nK.roll, 0);

					end;

					return true;

				end;

				local function p(nK)

					if V(WK) ~= true then

						return;

					end;

					local eK = entity.get_local_player();

					if eK == nil then

						return;

					end;

					if entity.get_prop(eK, 'm_iTeamNum') ~= 2 then

						return;

					end;

					if (entity.get_prop(eK, "m_bInBombZone") or 0) <= 0 then

						return;

					end;

					local KK = entity.get_player_weapon(eK);

					local eK = (KK and entity.get_classname(KK)) or "";

					if eK == 'CC4' then

						return;

					end;

					if nK.buttons and (bit.band(nK.buttons, 32) == 32) then

						nK.buttons = bit.band(nK.buttons, bit.bnot(32));

						local nK = z.antiaimbot.angles;

						if nK.yaw and nK.yaw[2] then

							aa_request(AA_OWNER_EBOMB, 85, "e-bomb fix", nK.yaw[2], 180);

						end;

						if nK.body_yaw and nK.body_yaw[1] then

							aa_request(AA_OWNER_EBOMB, 85, 'e-bomb fix', nK.body_yaw[1], "Static");

						end;

						return true;

					end;

				end;

				local nK = false;

				local eK = 0;

				local KK = - 1.0;

				local fK = 0;

				local function UK()

					if not R.is_onground then

						if R.is_crouched then

							return "air-crouch";

						end;

						return "air";

					end;

					if R.is_crouched then

						if R.is_moving then

							return 'move-crouch';

						end;

						return "crouch";

					end;

					if R.is_moving then

						if z.is_slow_motion() then

							return 'slow walk';

						end;

						return "moving";

					end;

					return 'standing';

				end;

				local function xK()

					local tK = f.get();

					if not (tK and tK.shift) then

						return false;

					end;

					local tK = entity.get_local_player();

					if tK == nil then

						return false;

					end;

					local AK = entity.get_player_weapon(tK);

					if AK == nil then

						return false;

					end;

					local tK = wK(AK);

					if (tK == nil) or tK.is_revolver then

						return false;

					end;

					local wK = UK();

					if wK == nil then

						return false;

					end;

					return g(DK, wK);

				end;

				local function wK()

					local UK = globals.tickcount();

					if UK < fK then

						return;

					end;

					fK = UK + 4;

					if entity.get_local_player == nil then

						return;

					end;

					local fK = entity.get_local_player();

					if fK == nil then

						return;

					end;

					local UK = entity.get_local_player();

					if UK == nil then

						return;

					end;

					local tK, AK, SK = entity.get_origin(fK);

					local dK, RK, kK = entity.get_origin(UK);

					if (tK == nil) or (dK == nil) then

						return;

					end;

					local IK, IK = N(dK - tK, RK - AK, kK - SK);

					local N, tK, AK = qK(fK);

					local qK, SK, dK = entity.hitbox_position(UK, 3);

					if (N == nil) or (qK == nil) then

						return;

					end;

					local UK = math.rad(IK + 90);

					local RK = math.rad(IK - 90);

					local kK, IK = N + (math.cos(UK) * 31), tK + (math.sin(UK) * 31);

					local UK, FK = N + (math.cos(RK) * 31), tK + (math.sin(RK) * 31);

					local N, N = client.trace_line(fK, kK, IK, AK, qK, SK, dK, false);

					local tK, tK = client.trace_line(fK, UK, FK, AK, qK, SK, dK, false);

					N = N or 0;

					tK = tK or 0;

					if ((N > 0) or (tK > 0)) and (N ~= tK) then

						KK = ((N > tK) and - 1.0) or 1;

					end;

				end;

				local function N(qK)

					local fK = V(NK);

					if (fK == nil) or (fK == 'off') then

						return false;

					end;

					local UK = V(LK) or 0;

					local tK = V(GK) or 0;

					local AK = V(vK) or 20;

					local SK, dK;

					if fK == 'static' then

						SK, dK = "Custom", UK;

					elseif fK == 'sway' then

						local RK = (globals.curtime() * AK * 0.1) % 1;

						SK, dK = 'Custom', C(UK, tK, RK);

					elseif fK == 'switch' then

						SK, dK = "Custom", (nK and tK) or UK;

					elseif fK == 'random' then

						local C, AK = math.min(UK, tK), math.max(UK, tK);

						SK, dK = 'Custom', D(C, AK);

					elseif fK == "static random" then

						local C = f.get().defensive;

						if C and (C.left == C.max) then

							local C, fK = math.min(UK, tK), math.max(UK, tK);

							eK = D(C, fK);

						end;

						SK, dK = "Custom", eK;

					end;

					if qK.pitch and qK.pitch[1] then

						aa_request(AA_OWNER_FLICK, 75, 'flick exploit', qK.pitch[1], SK);

					end;

					if qK.pitch and qK.pitch[2] then

						aa_request(AA_OWNER_FLICK, 75, 'flick exploit', qK.pitch[2], H(dK, - 89.0, 89));

					end;

					return true;

				end;

				local function C(D)

					if V(CK) ~= true then

						return;

					end;

					if not xK() then

						return;

					end;

					if z.is_freestanding() or YK() then

						return;

					end;

					wK();

					local qK = KK == - 1.0;

					local YK = f.get().defensive;

					local wK = ((YK and YK.left) or 0) ~= 0;

					if D.chokedcommands == 0 then

						nK = not nK;

					end;

					local D = z.antiaimbot.angles;

					if D.pitch and D.pitch[1] then

						aa_request(AA_OWNER_FLICK, 75, "flick exploit", D.pitch[1], (wK and 'Custom') or "Default");

					end;

					if D.pitch and D.pitch[2] then

						aa_request(AA_OWNER_FLICK, 75, "flick exploit", D.pitch[2], 0);

					end;

					N(D);

					if D.yaw_base then

						aa_request(AA_OWNER_FLICK, 75, 'flick exploit', D.yaw_base, 'At targets');

					end;

					if D.yaw and D.yaw[1] then

						aa_request(AA_OWNER_FLICK, 75, "flick exploit", D.yaw[1], '180');

					end;

					local N = (wK and 90) or 0;

					if qK then

						N = - N;

					end;

					if D.yaw and D.yaw[2] then

						aa_request(AA_OWNER_FLICK, 75, 'flick exploit', D.yaw[2], N);

					end;

					if D.yaw_jitter and D.yaw_jitter[1] then

						aa_request(AA_OWNER_FLICK, 75, "flick exploit", D.yaw_jitter[1], 'Off');

					end;

					if D.yaw_jitter and D.yaw_jitter[2] then

						aa_request(AA_OWNER_FLICK, 75, "flick exploit", D.yaw_jitter[2], 0);

					end;

					if D.body_yaw and D.body_yaw[1] then

						aa_request(AA_OWNER_FLICK, 75, 'flick exploit', D.body_yaw[1], "Static");

					end;

					if D.body_yaw and D.body_yaw[2] then

						aa_request(AA_OWNER_FLICK, 75, 'flick exploit', D.body_yaw[2], (wK and - 1.0) or 1);

					end;

					if D.freestanding_body_yaw then

						aa_request(AA_OWNER_FLICK, 75, 'flick exploit', D.freestanding_body_yaw, false);

					end;

					if D.edge_yaw then

						aa_request(AA_OWNER_FLICK, 75, "flick exploit", D.edge_yaw, false);

					end;

					if D.freestanding and D.freestanding[1] then

						aa_request(AA_OWNER_FLICK, 75, "flick exploit", D.freestanding[1], false);

					end;

					if D.roll then

						aa_request(AA_OWNER_FLICK, 75, 'flick exploit', D.roll, 0);

					end;

					return true;

				end;

				local D = - 999.0;

				local N, qK = l('Rage', 'Aimbot', "Double tap");

				local function YK()

					return (N ~= nil) and (qK ~= nil) and (V(N) == true) and (V(qK) == true);

				end;

				client.set_event_callback('aim_fire', function()

					if V(rK) == true then

						if YK() then

							rawset(_G, "INFINIX_DT_RELAX_UNTIL", globals.tickcount() + 48);

							D = - 999.0;

							return;

						end;

						D = globals.tickcount();

					end;

				end);

				local function N(qK)

					if V(rK) ~= true then

						return;

					end;

					if YK() then

						D = - 999.0;

						qK.no_choke = true;

						return;

					end;

					local YK = V(TK) or 14;

					local wK = globals.tickcount() - D;

					if wK <= 64 then

						if qK.chokedcommands < 14 then

							qK.allow_send_packet = false;

						elseif (qK.chokedcommands % 3) == 0 then

							qK.no_choke = true;

						else

							qK.allow_send_packet = false;

						end;

					elseif qK.chokedcommands < YK then

						qK.allow_send_packet = false;

					else

						qK.no_choke = true;

					end;

				end;

				local D = false;

				local qK, YK, wK = nil, nil, nil;

				local function nK()

					local eK = A['anti-aim.settings'];

					if eK == nil then

						return;

					end;

					if eK.fl_amount and eK.fl_amount[1] then

						pcall(h.unset, eK.fl_amount[1]);

					end;

					if eK.fl_variance and eK.fl_variance[1] then

						pcall(h.unset, eK.fl_variance[1]);

					end;

					if eK.fl_limit and eK.fl_limit[1] then

						pcall(h.unset, eK.fl_limit[1]);

					end;

					D = false;

					qK, YK, wK = nil, nil, nil;

				end;

				local function eK()

					local KK = A['anti-aim.settings'];

					if KK == nil then

						return;

					end;

					local fK = V(rK) == true;

					if fK then

						local fK = V(TK) or 14;

						local UK = math.min(fK, 15);

						if KK.fl_amount and KK.fl_amount[1] and (qK ~= "Fluctuate") then

							h.set(KK.fl_amount[1], "Fluctuate");

							qK = 'Fluctuate';

						end;

						if KK.fl_variance and KK.fl_variance[1] and (YK ~= 0) then

							h.set(KK.fl_variance[1], 0);

							YK = 0;

						end;

						if KK.fl_limit and KK.fl_limit[1] and (wK ~= UK) then

							h.set(KK.fl_limit[1], UK);

							wK = UK;

						end;

						D = true;

					elseif D then

						nK();

					end;

				end;

				o(rK, function()

					yK();

					pcall(i);

					eK();

				end);

				o(TK, eK);

				sK.settings_custom_fakelag = nK;

				hK.pre_config_save[# hK.pre_config_save + 1] = nK;

				function n(D)

					local yK = rawget(_G, "INFINIX_AB_ON") == true;

					local qK = rawget(_G, 'INFINIX_FL_ON') == true;

					local YK = rawget(_G, 'INFINIX_SH_ON') == true;

					local wK = rawget(_G, 'INFINIX_EB_ON') == true;

					local nK = rawget(_G, 'INFINIX_FX_ON') == true;

					local KK = rawget(_G, "INFINIX_CF_ON") == true;

					if not yK then

						aa_clear_owner(AA_OWNER_BACKSTAB);

					end;

					if not YK then

						aa_clear_owner(AA_OWNER_SAFE_HEAD);

					end;

					if not wK then

						aa_clear_owner(AA_OWNER_EBOMB);

					end;

					if not nK then

						aa_clear_owner(AA_OWNER_FLICK);

					end;

					if not (yK or qK or YK or wK or nK or KK) then

						return;

					end;

					local fK = ((YK or nK or KK) and INFINIX_DT_RELAXING()) or false;

					if qK then

						JK(D);

					end;

					if wK and (p(D) ~= true) then

						aa_clear_owner(AA_OWNER_EBOMB);

					end;

					if yK and (iK(D) ~= true) then

						aa_clear_owner(AA_OWNER_BACKSTAB);

					end;

					if not fK then

						if YK and (uK(D) ~= true) then

							aa_clear_owner(AA_OWNER_SAFE_HEAD);

						end;

						if nK and (C(D) ~= true) then

							aa_clear_owner(AA_OWNER_FLICK);

						end;

					else

						aa_clear_owner(AA_OWNER_SAFE_HEAD);

						aa_clear_owner(AA_OWNER_FLICK);

					end;

					if KK then

						N(D);

					end;

					if KK and (not fK) then

						eK();

					end;

				end;

				zK[# zK + 1] = n;

				pK('settings', 'ab_en', PK);

				pK('settings', 'fl_en', oK);

				pK("settings", 'sh_en', mK);

				pK("settings", 'sh_cond', BK);

				pK('settings', "eb_en", WK);

				pK("settings", 'fx_en', CK);

				pK("settings", 'fx_states', DK);

				pK('settings', "fx_pitch", NK);

				pK('settings', 'fx_p_off1', LK);

				pK("settings", 'fx_p_off2', GK);

				pK("settings", "fx_p_speed", vK);

				pK('settings', "cf_en", rK);

				pK('settings', "cf_base", TK);

			end)();

			local p = k;

			local C = {};

			local D = - 1.0;

			local N = nil;

			local n = 0;

			function k()

				local yK = ui.is_menu_open and (ui.is_menu_open() == true);

				if (not yK) and (E == false) and (a <= 0) and (n <= 0) and (K <= 0) then

					return;

				end;

				local E, qK = cK();

				local cK = r();

				local r = tostring(E) .. ' ' .. tostring(qK) .. " " .. tostring(cK);

				if r ~= N then

					N = r;

					_();

					n = 3;

					for _ in pairs(C) do

						C[_] = nil;

					end;

				end;

				p();

				if D ~= s then

					D = s;

					for s in pairs(C) do

						C[s] = nil;

					end;

				end;

				if (QK ~= nil) and (V(QK) == true) then

					local s = A['anti-aim.settings'];

					if s ~= nil then

						for _, p in pairs(s) do

							if (_ == 'fl_enabled') or (_ == "fl_amount") or (_ == "fl_variance") or (_ == "fl_limit") then

								for s, s in ipairs(p) do

									P(s, false);

								end;

							end;

						end;

					end;

				end;

				do

					local s, _ = E, qK;

					local p = cK;

					for D, N in pairs(Z) do

						if lK[D] ~= nil then

							c(lK[D], false);

						end;

						for r, Z in pairs(N) do

							if (type(Z) == 'userdata') or (type(Z) == 'number') then

								local QK = false;

								if type(MK) == 'function' then

									QK = MK(s, _, p, D, N, r) == true;

								end;

								local s = tostring(Z);

								if C[s] ~= QK then

									C[s] = QK;

									c(Z, QK);

								end;

							end;

						end;

					end;

				end;

				local s = (n > 0) or (a > 0) or (yK == true);

				t(s or (E == 'anti-aim'));

				if n > 0 then

					n = n - 1;

				end;

			end;

			local E;

			(function()

				local a = aK.misc._flat;

				local s = {

					CHEGrenade = 'he',

					CSmokeGrenade = 'smoke',

					CMolotovGrenade = 'molotov',

					CIncendiaryGrenade = "molotov"

				};

				local _ = {

					he = 'weapon_hegrenade',

					smoke = "weapon_smokegrenade",

					molotov = "weapon_molotov"

				};

				local p = Q(ui.new_checkbox, 'AA', "Anti-aimbot angles", 'drop nades' .. b(""));

				local C = Q(ui.new_hotkey, 'AA', "Anti-aimbot angles", '  drop nades hotkey' .. b(''), true);

				local D = Q(ui.new_multiselect, "AA", "Anti-aimbot angles", "  drop nades types" .. b(''), {

					'he',

					'smoke',

					"molotov"

				});

				local N = Q(ui.new_checkbox, "AA", "Anti-aimbot angles", "fps optimize" .. b(""));

				local r = Q(ui.new_checkbox, "AA", "Anti-aimbot angles", "  a?? fps optimize always on" .. b(''));

				local n = Q(ui.new_multiselect, 'AA', 'Anti-aimbot angles', '  a?? fps optimize detections' .. b(''), {

					"peeking",

					'hit flag'

				});

				local Z = Q(ui.new_multiselect, 'AA', "Anti-aimbot angles", "  a?? fps optimizations" .. b(''), {

					"blood",

					"bloom",

					'decals',

					'shadows',

					'sprites',

					"particles",

					'ropes',

					'dynamic lights',

					'map details',

					"weapon effects"

				});

				local yK = Q(ui.new_checkbox, 'AA', "Anti-aimbot angles", "game smooth mode" .. b(""));

				local QK = Q(ui.new_checkbox, 'AA', "Anti-aimbot angles", 'console filter' .. b(""));

				local lK = Q(ui.new_checkbox, 'AA', "Anti-aimbot angles", 'reveal enemy team chat' .. b(''));

				local qK = Q(ui.new_checkbox, "AA", 'Anti-aimbot angles', 'allow duck on fd' .. b(''));

				a.dn_en = p;

				a.dn_hk = C;

				a.dn_sel = D;

				a.fo_en = N;

				a.fo_always = r;

				a.fo_dets = n;

				a.fo_list = Z;

				a.smooth_en = yK;

				a.kf_en = QK;

				a.rc_en = lK;

				a.dfd_en = qK;

				function E(cK)

					local PK = cK == 'misc';

					c(p, PK);

					c(N, PK);

					c(yK, PK);

					c(QK, PK);

					c(lK, PK);

					c(qK, PK);

					if not PK then

						return;

					end;

					local cK = V(p) == true;

					c(C, cK);

					c(D, cK);

					local cK = V(N) == true;

					c(r, cK);

					c(n, cK and (V(r) ~= true));

					c(Z, cK);

				end;

				EK[# EK + 1] = E;

				local function E()

					rawset(_G, 'INFINIX_DN_ON', V(p) == true);

					rawset(_G, 'INFINIX_FO_ON', V(N) == true);

					rawset(_G, 'INFINIX_FO_ALWAYS', V(r) == true);

					rawset(_G, "INFINIX_SMOOTH_MODE", V(yK) == true);

					rawset(_G, "INFINIX_DFD_ON", V(qK) == true);

					pcall(i);

				end;

				E();

				o(p, E);

				o(N, E);

				o(r, E);

				o(yK, E);

				local cK = {

					queue = {},

					throwing = false,

					old_state = nil

				};

				local function PK(oK)

					local mK = {};

					for BK = 0, 63 do

						local MK = entity.get_prop(oK, "m_hMyWeapons", BK);

						if (MK ~= nil) and (MK ~= 0) then

							local oK = bit.band(MK, 4095);

							local BK = entity.get_classname(oK) or '';

							local MK = s[BK];

							if (MK ~= nil) and g(D, MK) then

								table.insert(mK, {

									ent = oK,

									kind = MK

								});

							end;

						end;

					end;

					return mK;

				end;

				local function s(oK)

					if rawget(_G, "INFINIX_DN_ON") ~= true then

						return;

					end;

					local mK = entity.get_local_player();

					if (mK == nil) or (not entity.is_alive(mK)) then

						return;

					end;

					local BK = V(C) == true;

					if cK.old_state ~= BK then

						cK.old_state = BK;

						if BK and (not cK.throwing) then

							cK.queue = PK(mK);

							cK.throwing = # cK.queue > 0;

						end;

					end;

					if cK.throwing and (# cK.queue > 0) then

						local C = (globals.realtime and globals.realtime()) or 0;

						local PK = C + (4 * (globals.tickinterval() or 0.015625));

						for C, mK in ipairs(cK.queue) do

							local BK = _[mK.kind];

							if BK ~= nil then

								local _ = C == # cK.queue;

								client.delay_call(PK * C, function()

									client.exec(('use %s; drop'):format(BK));

									if _ then

										client.delay_call(0.1, function()

											cK.throwing = false;

										end);

									end;

								end);

							end;

						end;

						cK.queue = {};

						local _, C = client.camera_angles();

						local cK = 0.0001;

						if _ and (_ > 0) then

							cK = - cK;

						end;

						oK.yaw = C or oK.yaw;

						oK.pitch = (_ or 0) + cK;

						oK.no_choke = true;

						oK.allow_send_packet = true;

					end;

				end;

				local _ = nil;

				local C = false;

				local function cK()

					if _ ~= nil then

						return;

					end;

					local function PK(oK, mK)

						local BK = cvar[oK];

						if BK == nil then

							return nil;

						end;

						return {

							convar = BK,

							old_value = nil,

							new_value = mK,

							name = oK

						};

					end;

					local function oK( ...)

						local mK = {};

						for BK = 1, select('#', ...) do

							local MK = select(BK, ...);

							if MK ~= nil then

								mK[# mK + 1] = MK;

							end;

						end;

						return mK;

					end;

					_ = {

						blood = oK(PK('violence_hblood', 0)),

						bloom = oK(PK('mat_disable_bloom', 1)),

						decals = oK(PK('r_drawdecals', 0)),

						shadows = oK(PK("r_shadows", 0), PK('cl_csm_static_prop_shadows', 0), PK("cl_csm_shadows", 0), PK('cl_csm_world_shadows', 0), PK('cl_foot_contact_shadows', 0), PK('cl_csm_viewmodel_shadows', 0), PK('cl_csm_rope_shadows', 0), PK('cl_csm_sprite_shadows', 0), PK("cl_csm_translucent_shadows", 0), PK("cl_csm_entity_shadows", 0)),

						sprites = oK(PK("r_drawsprites", 0)),

						particles = oK(PK("r_drawparticles", 0)),

						ropes = oK(PK('r_drawropes', 0)),

						['dynamic lights'] = oK(PK('mat_disable_fancy_blending', 1)),

						["map details"] = oK(PK('func_break_max_pieces', 0), PK("props_break_max_pieces", 0)),

						['weapon effects'] = oK(PK('muzzleflash_light', 0), PK('r_drawtracers_firstperson', 0))

					};

				end;

				local function PK()

					if (not C) or (_ == nil) then

						return;

					end;

					for oK, oK in pairs(_) do

						for mK, mK in ipairs(oK) do

							if (mK.old_value ~= nil) and mK.convar then

								pcall(function()

									mK.convar:set_int(mK.old_value);

								end);

								mK.old_value = nil;

							end;

						end;

					end;

					C = false;

				end;

				local function oK()

					if C or (_ == nil) then

						return;

					end;

					local mK, BK = pcall(ui.get, Z);

					if (not mK) or (type(BK) ~= 'table') then

						return;

					end;

					for mK, mK in ipairs(BK) do

						local BK = _[mK];

						if BK then

							for _, _ in ipairs(BK) do

								if _.convar and (_.old_value == nil) then

									local mK, BK = pcall(function()

										return _.convar:get_int();

									end);

									if mK then

										_.old_value = BK;

									end;

									pcall(function()

										_.convar:set_int(_.new_value);

									end);

								end;

							end;

						end;

					end;

					C = true;

				end;

				local function _()

					if rawget(_G, 'INFINIX_FO_ON') ~= true then

						return false;

					end;

					if rawget(_G, 'INFINIX_FO_ALWAYS') == true then

						return true;

					end;

					if g(n, "peeking") and R.is_peeking then

						return true;

					end;

					if g(n, "hit flag") then

						local R, mK = L();

						if R then

							for BK = 1, mK do

								local mK = R[BK];

								local R = csgo_weapons and csgo_weapons(mK);

								if R and R.flags and (bit.band(R.flags, bit.lshift(1, 11)) ~= 0) then

									return true;

								end;

							end;

						end;

					end;

					return false;

				end;

				client.set_event_callback('net_update_end', function()

					if rawget(_G, 'INFINIX_FO_ON') ~= true then

						if C then

							PK();

						end;

						return;

					end;

					cK();

					if _() then

						oK();

					else

						PK();

					end;

				end);

				o(Z, function()

					PK();

					if _() then

						oK();

					end;

				end);

				sK.misc_fps_optimize = PK;

				local _ = false;

				local function C()

					_ = false;

					if cvar.con_filter_enable then

						pcall(function()

							cvar.con_filter_enable:set_int(0);

						end);

					end;

					if cvar.con_filter_text then

						pcall(function()

							cvar.con_filter_text:set_string('');

						end);

					end;

				end;

				local function R()

					if V(QK) ~= true then

						_ = false;

						return;

					end;

					if cvar.con_filter_enable then

						pcall(function()

							cvar.con_filter_enable:set_raw_int(1);

						end);

					end;

					if cvar.con_filter_text then

						pcall(function()

							cvar.con_filter_text:set_string("infinix");

						end);

					end;

					client.delay_call(1, R);

				end;

				o(QK, function()

					if V(QK) == true then

						pcall(client.exec, "clear");

						if not _ then

							_ = true;

							R();

						end;

					else

						C();

					end;

				end);

				sK.misc_console_filter = C;

				local _ = {};

				local C = nil;

				do

					local R, cK = pcall(require, 'gamesense/chat');

					if R and (type(cK) == 'table') then

						C = cK;

					elseif type(chat) == 'table' then

						C = chat;

					end;

				end;

				local R = nil;

				do

					local cK, PK = pcall(panorama.open);

					if cK and PK then

						R = PK.GameStateAPI;

					end;

				end;

				local cK = cvar.cl_mute_enemy_team;

				local PK = cvar.cl_mute_all_but_friends_and_party;

				client.set_event_callback('player_chat', function(oK)

					if V(lK) ~= true then

						return;

					end;

					if (oK == nil) or (oK.entity == nil) then

						return;

					end;

					if not entity.is_enemy(oK.entity) then

						return;

					end;

					_[oK.entity] = globals.realtime();

				end);

				client.set_event_callback('player_say', function(oK)

					if V(lK) ~= true then

						return;

					end;

					if (oK == nil) or (oK.userid == nil) then

						return;

					end;

					local mK = client.userid_to_entindex(oK.userid);

					if (mK == nil) or (not entity.is_enemy(mK)) then

						return;

					end;

					if R and R.GetPlayerXuidStringFromEntIndex then

						local BK = R.GetPlayerXuidStringFromEntIndex(mK);

						if BK and R.IsSelectedPlayerMuted and R.IsSelectedPlayerMuted(BK) then

							return;

						end;

					end;

					if cK and pcall(function()

						return cK:get_int();

					end) and (cK:get_int() == 1) then

						return;

					end;

					if PK and pcall(function()

						return PK:get_int();

					end) and (PK:get_int() == 1) then

						return;

					end;

					client.delay_call(0.2, function()

						if (_[mK] ~= nil) and (math.abs(globals.realtime() - _[mK]) < 0.4) then

							return;

						end;

						local _ = entity.get_player_resource();

						local R = entity.get_prop(mK, "m_szLastPlaceName") or "";

						local cK = entity.get_player_name(mK) or "unknown";

						local PK = entity.get_prop(_, "m_iTeam", mK);

						local _ = ((PK == 2) and "T") or "CT";

						local PK = (entity.is_alive(mK) and 'Loc') or "Dead";

						local BK = _G.localize or function(MK)

							return MK;

						end;

						local MK = ('Cstrike_Chat_%s_%s'):format(_, PK);

						local WK = BK(((R ~= "") and R) or "UI_Unknown");

						local R = BK(MK, {

							s1 = cK,

							s2 = (oK.text or ""),

							s3 = WK

						});

						if (R == nil) or (R == MK) then

							R = ("(%s %s) %s: %s"):format(_, PK, cK, oK.text or "");

						end;

						if C and C.print_player then

							pcall(C.print_player, mK, R);

						end;

					end);

				end);

				local _;

				do

					local C = {

						{

							'Rage',

							"Other",

							"Duck peek assist"

						},

						{

							'RAGE',

							'Other',

							"Duck peek assist"

						}

					};

					for R, R in ipairs(C) do

						local C, cK = pcall(ui.reference, R[1], R[2], R[3]);

						if C and cK then

							_ = cK;

							break;

						end;

					end;

				end;

				local C = false;

				local function R()

					if _ and h.unset then

						pcall(h.unset, _);

					end;

				end;

				local function cK(PK)

					if rawget(_G, "INFINIX_DFD_ON") ~= true then

						if C then

							R();

							C = false;

						end;

						return;

					end;

					if _ == nil then

						return;

					end;

					local oK = entity.get_local_player();

					if oK == nil then

						return;

					end;

					local mK = entity.get_prop(oK, "m_flDuckAmount");

					if mK == nil then

						return;

					end;

					local BK = entity.get_prop(oK, 'm_fFlags') or 0;

					local oK = bit.band(BK, 1) ~= 0;

					local BK = ui.is_menu_open() or (PK.in_duck == 0) or (not oK);

					if BK then

						C = false;

					elseif mK > 0.75 then

						C = true;

					end;

					if C then

						h.set(_, "On hotkey", 0);

					else

						R();

					end;

				end;

				o(qK, function()

					E();

					if rawget(_G, "INFINIX_DFD_ON") ~= true then

						R();

					end;

				end);

				sK.misc_duck_fd = R;

				zK[# zK + 1] = function(E)

					local _ = rawget(_G, 'INFINIX_DN_ON') == true;

					local R = rawget(_G, 'INFINIX_DFD_ON') == true;

					if (not _) and (not R) and (not C) then

						return;

					end;

					if _ then

						s(E);

					end;

					if R or C then

						cK(E);

					end;

				end;

				pK('misc', "dn_en", p);

				pK('misc', "dn_sel", D);

				pK('misc', 'fo_en', N);

				pK('misc', 'fo_always', r);

				pK("misc", "fo_dets", n);

				pK("misc", 'fo_list', Z);

				pK("misc", "smooth_en", yK);

				pK("misc", "kf_en", QK);

				pK("misc", "rc_en", lK);

				pK("misc", 'dfd_en', qK);

				do

					local E = Q(ui.new_checkbox, 'AA', "Other", "buybot");

					local s = Q(ui.new_combobox, "AA", "Other", "primary", "none", "awp", 'scout', "g3sg1 / scar-20");

					local _ = Q(ui.new_combobox, "AA", 'Other', 'alternative', "off", "scout", 'g3sg1 / scar-20');

					local p = Q(ui.new_combobox, 'AA', 'Other', "secondary", 'none', 'p250', 'elites', "five-seven / tec-9 / cz75", 'deagle / r8');

					local C = Q(ui.new_multiselect, "AA", "Other", 'equipment', {

						"kevlar",

						'kevlar + helmet',

						"defuse kit",

						"he",

						'smoke',

						"molotov",

						'taser'

					});

					local D = Q(ui.new_checkbox, 'AA', "Other", 'ignore pistol round');

					local N = Q(ui.new_checkbox, 'AA', "Other", 'only $16k');

					a.bb_en = E;

					a.bb_pri = s;

					a.bb_alt = _;

					a.bb_sec = p;

					a.bb_eq = C;

					a.bb_ig = D;

					a.bb_16k = N;

					EK[# EK + 1] = function(r)

						local n = r == 'misc';

						local r = n and (V(E) == true);

						local R = r and (V(s) or "none");

						local Z = r and (type(R) == 'string') and (R ~= "none") and (R ~= '');

						c(E, n);

						c(s, r);

						c(_, r and (R == "awp"));

						c(p, Z);

						c(C, r);

						c(D, r);

						c(N, r);

					end;

					local r = {

						awp = 'awp',

						scout = "ssg08",

						["g3sg1 / scar-20"] = 'scar20'

					};

					local n = {

						scout = 'ssg08',

						['g3sg1 / scar-20'] = 'scar20'

					};

					local R = {

						p250 = 'p250',

						elites = "elite",

						["five-seven / tec-9 / cz75"] = 'fn57',

						['deagle / r8'] = 'deagle'

					};

					local Z = {

						kevlar = 'vest',

						["kevlar + helmet"] = "vesthelm",

						["defuse kit"] = 'defuser',

						he = 'hegrenade',

						smoke = "smokegrenade",

						molotov = 'molotov',

						taser = "taser"

					};

					local yK = cvar.mp_afterroundmoney;

					local function QK()

						local lK = entity.get_local_player();

						if not lK then

							return false;

						end;

						local qK = entity.get_prop(lK, 'm_iAccount') or 0;

						if (V(D) == true) and (qK <= 1000) then

							return false;

						end;

						if V(N) == true then

							local lK = (yK and yK:get_int()) or 0;

							return (qK >= 16000) or (lK >= 16000);

						end;

						return true;

					end;

					local function yK()

						local lK = entity.get_local_player();

						if not lK then

							return false;

						end;

						local qK = entity.get_player_weapon(lK);

						if not qK then

							return true;

						end;

						local lK = entity.get_prop(qK, "m_iPrimaryAmmoType") or 0;

						return lK == 0;

					end;

					local function lK()

						if V(E) ~= true then

							return;

						end;

						if not QK() then

							return;

						end;

						local QK = {};

						local qK = V(s);

						local cK = r[qK];

						if cK then

							table.insert(QK, cK);

							if qK == 'awp' then

								client.delay_call((globals.realtime() or 0) + 0.15, function()

									if not yK() then

										return;

									end;

									local r = n[V(_)];

									if r then

										client.exec('buy ' .. r);

									end;

								end);

							end;

						end;

						local r = R[V(p)];

						if r then

							table.insert(QK, r);

						end;

						local r = V(C);

						if type(r) == 'table' then

							for n, n in ipairs(r) do

								local r = Z[n];

								if r then

									table.insert(QK, r);

								end;

							end;

						end;

						if # QK > 0 then

							for r, r in ipairs(QK) do

								client.exec('buy ' .. r);

							end;

						end;

					end;

					local function r()

						if V(E) ~= true then

							return;

						end;

						client.delay_call((globals.realtime() or 0) + 0.125, lK);

					end;

					client.set_event_callback("round_prestart", r);

					o(E, i);

					o(s, i);

					pK('misc', 'bb_en', E);

					pK("misc", "bb_pri", s);

					pK("misc", "bb_alt", _);

					pK('misc', 'bb_sec', p);

					pK('misc', "bb_eq", C);

					pK("misc", "bb_ig", D);

					pK('misc', 'bb_16k', N);

				end;

				do

					local E = Q(ui.new_checkbox, 'AA', 'Anti-aimbot angles', "clantag" .. b(""));

					a.ct_en = E;

					EK[# EK + 1] = function(s)

						c(E, s == 'misc');

					end;

					local s = {

						"$_",

						'~$_',

						"~i#_",

						'~in*_',

						'~inf!_',

						"~infi&_",

						"~infin@_",

						"~infini?_",

						'~infinix$_',

						"~infinix.$_",

						'~infinix.l#_',

						'~infinix.lu!_',

						'~infinix.lua&_',

						'~infinix.lua~_',

						'~infinix.lua~',

						'~infinix.lua~',

						'~infinix.lua~',

						'~infinix.lua~',

						'~infinix.lua~',

						'~infinix.lua~',

						"~infinix.lua~",

						"~infinix.lua~",

						"~infinix.lua~",

						'~infinix.lua~',

						'~infinix.lua~',

						'~infinix.lua~_',

						"~infinix.lua%_",

						"~infinix.lu^_",

						"~infinix.l?_",

						'~infinix.8_',

						'~infinix4_',

						"~infini2_",

						"~infin%_",

						"~infi^_",

						"~inf?_",

						"~in8_",

						"~i4_",

						'~2_',

						'%_',

						"_"

					};

					local _;

					pcall(function()

						_ = ui.reference("Misc", 'Miscellaneous', "Clan tag spammer");

					end);

					local function p()

						rawset(_G, 'INFINIX_CT_ON', V(E) == true);

						pcall(i);

					end;

					p();

					local function C()

						if rawget(_G, "INFINIX_CT_ON") ~= true then

							return;

						end;

						local D = (math.floor((globals.curtime() * 4) + 0.5) % # s) + 1;

						pcall(client.set_clan_tag, s[D]);

					end;

					local function s()

						pcall(client.set_clan_tag, '');

						client.delay_call(0.1, function()

							pcall(client.set_clan_tag, '');

						end);

						client.delay_call(0.3, function()

							pcall(client.set_clan_tag, "");

						end);

						if _ then

							pcall(h.unset, _);

						end;

					end;

					o(E, function()

						p();

						if rawget(_G, "INFINIX_CT_ON") == true then

							if _ then

								pcall(h.set, _, false);

							end;

						else

							s();

						end;

					end);

					client.set_event_callback('net_update_end', function()

						C();

					end);

					sK.clantag = s;

					pK('misc', 'ct_en', E);

				end;

				do

					local E;

					pcall(function()

						E = require('gamesense/entity');

					end);

					local s = A['anti-aim.hotkeys'] and A["anti-aim.hotkeys"].leg_movement and A['anti-aim.hotkeys'].leg_movement[1];

					local _ = Q(ui.new_checkbox, "AA", "Fake lag", 'anim breaker');

					local p = Q(ui.new_combobox, "AA", 'Fake lag', "air legs", {

						"off",

						"static",

						'moonwalk',

						'chaos'

					});

					local C = Q(ui.new_slider, 'AA', "Fake lag", "air weight", 0, 100, 100, true, '%');

					local D = Q(ui.new_combobox, "AA", 'Fake lag', 'ground legs', {

						'off',

						"static",

						'jitter',

						"moonwalk",

						'chaos',

						'secret'

					});

					local N = Q(ui.new_slider, 'AA', 'Fake lag', "offset 1", 0, 100, 100, true, '');

					local r = Q(ui.new_slider, "AA", "Fake lag", "offset 2", 0, 100, 100, true, "");

					local n = Q(ui.new_slider, "AA", "Fake lag", "jitter time", 1, 8, 2, true, 't');

					local A = Q(ui.new_multiselect, 'AA', 'Fake lag', "options", {

						"move lean",

						"pitch zero on land",

						"smooth animfix"

					});

					local R = Q(ui.new_slider, "AA", 'Fake lag', 'move lean', 0, 100, 50, true, '%');

					a.ab_en = _;

					a.ab_air = p;

					a.ab_airw = C;

					a.ab_gnd = D;

					a.ab_off1 = N;

					a.ab_off2 = r;

					a.ab_jt = n;

					a.ab_opts = A;

					a.ab_lean = R;

					local function a(Z)

						if Z == "kangaroo" then

							return 'chaos';

						end;

						if Z == "pacan4ik" then

							return 'secret';

						end;

						return Z;

					end;

					EK[# EK + 1] = function(Z)

						local yK = Z == "misc";

						local Z = yK and (V(_) == true);

						local QK = a(V(p) or "off");

						local lK = a(V(D) or 'off');

						c(_, yK);

						c(p, Z);

						c(C, Z and (QK == 'static'));

						c(D, Z);

						local yK = Z and ((lK == "jitter") or (lK == "secret"));

						c(N, yK);

						c(r, yK);

						c(n, Z and (lK == 'jitter'));

						c(A, Z);

						c(R, Z and g(A, "move lean"));

					end;

					local function Z()

						rawset(_G, 'INFINIX_ANIM_BREAKER_ON', V(_) == true);

						pcall(i);

					end;

					Z();

					o(_, Z);

					o(p, i);

					o(D, i);

					local function Z(yK)

						if not E then

							return nil, nil, nil;

						end;

						local QK, lK = pcall(E, yK);

						if (not QK) or (not lK) then

							return nil, nil, nil;

						end;

						local yK, QK, qK;

						pcall(function()

							yK = lK:get_anim_state();

							QK = lK:get_anim_overlay(6);

							qK = lK:get_anim_overlay(12);

						end);

						return yK, QK, qK;

					end;

					local function yK(QK, lK)

						local qK = a(V(p));

						if qK == "static" then

							pcall(entity.set_prop, QK, 'm_flPoseParameter', (V(C) or 100) * 0.01, 6);

						elseif (qK == 'moonwalk') and lK then

							lK.weight = 1;

							lK.cycle = (globals.curtime() * 0.55) % 1;

						elseif qK == "chaos" then

							pcall(entity.set_prop, QK, "m_flPoseParameter", math.random(), 3);

							pcall(entity.set_prop, QK, 'm_flPoseParameter', math.random(), 7);

							pcall(entity.set_prop, QK, "m_flPoseParameter", math.random(), 6);

						end;

					end;

					local function QK(lK)

						local qK = a(V(D));

						if qK == 'static' then

							pcall(entity.set_prop, lK, 'm_flPoseParameter', 1, 0);

							if s then

								pcall(h.set, s, "Always slide");

							end;

						elseif qK == "jitter" then

							local a = globals.tickcount();

							local cK = V(N) or 100;

							local PK = V(r) or 100;

							local oK = V(n) or 2;

							local mK = 1 / ((((a % (oK * 4)) >= (oK * 2)) and 200) or 400);

							local BK = (((a % (oK * 2)) >= oK) and cK) or PK;

							pcall(entity.set_prop, lK, 'm_flPoseParameter', BK * mK, 0);

							if s then

								pcall(h.set, s, 'Always slide');

							end;

						elseif qK == "moonwalk" then

							pcall(entity.set_prop, lK, "m_flPoseParameter", 0, 7);

							if s then

								pcall(h.set, s, "Never slide");

							end;

						elseif qK == 'chaos' then

							pcall(entity.set_prop, lK, "m_flPoseParameter", math.random(), 3);

							pcall(entity.set_prop, lK, 'm_flPoseParameter', math.random(), 7);

							pcall(entity.set_prop, lK, 'm_flPoseParameter', math.random(), 6);

							if s then

								pcall(h.unset, s);

							end;

						elseif qK == "secret" then

							local a = (V(N) or 100) * 0.01;

							local qK = (V(r) or 100) * 0.01;

							local cK = a + (math.random() * math.max(0, qK - a));

							local a = ((math.random(0, 1) == 0) and 'Off') or "Always slide";

							pcall(entity.set_prop, lK, "m_flPoseParameter", cK, 0);

							if s then

								pcall(h.set, s, a);

							end;

						elseif s then

							pcall(h.unset, s);

						end;

					end;

					local function a(lK)

						local qK = entity.get_prop(lK, "m_fFlags") or 0;

						local cK = bit.band(qK, 1) == 1;

						local qK, PK, oK = Z(lK);

						if cK then

							QK(lK);

							if g(A, "pitch zero on land") and qK then

								if qK.hit_in_ground_animation then

									pcall(entity.set_prop, lK, "m_flPoseParameter", 0.5, 12);

								end;

							end;

						else

							yK(lK, PK);

						end;

						if g(A, "move lean") and oK then

							local Z, yK = entity.get_prop(lK, 'm_vecVelocity');

							if Z and yK then

								local QK = math.sqrt((Z * Z) + (yK * yK));

								if QK > 0.1 then

									oK.weight = (V(R) or 50) * 0.01;

								end;

							end;

						end;

					end;

					local Z, yK = {}, {};

					local QK = false;

					local lK = false;

					zK[# zK + 1] = function()

						if rawget(_G, "INFINIX_ANIM_BREAKER_ON") ~= true then

							if QK then

								if s then

									pcall(h.unset, s);

								end;

								for qK in pairs(Z) do

									Z[qK] = nil;

								end;

								for qK in pairs(yK) do

									yK[qK] = nil;

								end;

								lK = false;

								QK = false;

							end;

							return;

						end;

						QK = true;

						local QK = entity.get_local_player();

						if (not QK) or (not entity.is_alive(QK)) then

							return;

						end;

						a(QK);

					end;

					hK.pre_render[# hK.pre_render + 1] = function()

						if rawget(_G, "INFINIX_ANIM_BREAKER_ON") ~= true then

							return;

						end;

						local QK = entity.get_local_player();

						if (not QK) or (not entity.is_alive(QK)) then

							return;

						end;

						a(QK);

						if not g(A, "smooth animfix") then

							if lK then

								for a in pairs(Z) do

									Z[a] = nil;

								end;

								for a in pairs(yK) do

									yK[a] = nil;

								end;

								lK = false;

							end;

							return;

						end;

						lK = true;

						for a = 0, 12 do

							local lK, qK = pcall(entity.get_prop, QK, "m_flPoseParameter", a);

							qK = (lK and tonumber(qK)) or nil;

							if qK ~= nil then

								local lK = Z[a];

								local cK = ((lK == nil) and qK) or (lK + ((qK - lK) * 0.26));

								Z[a] = cK;

								pcall(entity.set_prop, QK, 'm_flPoseParameter', cK, a);

							end;

						end;

						if E then

							local a, Z = pcall(E, QK);

							if (not a) or (not Z) then

								return;

							end;

							for E = 0, 12 do

								local a, QK = pcall(function()

									return Z:get_anim_overlay(E);

								end);

								if a and QK then

									local a = tonumber(QK.weight) or 0;

									local Z = yK[E];

									local lK = ((Z == nil) and a) or (Z + ((a - Z) * 0.26));

									yK[E] = lK;

									QK.weight = lK;

								end;

							end;

						end;

					end;

					function sK.ab()

						if s then

							pcall(h.unset, s);

						end;

					end;

					pK('misc', 'ab_en', _);

					pK('misc', "ab_air", p);

					pK("misc", 'ab_airw', C);

					pK('misc', 'ab_gnd', D);

					pK('misc', "ab_off1", N);

					pK("misc", 'ab_off2', r);

					pK('misc', 'ab_jt', n);

					pK('misc', "ab_opts", A);

					pK('misc', "ab_lean", R);

				end;

			end)();

			local E;

			local a, s, _, p;

			local C = {};

			local D;

			local N;

			local r;

			local function n(A)

				A = A or {};

				local R = A.tab or 'AA';

				local Z = A.group or 'Fake lag';

				local yK = A.uniq or b;

				local A = Q(ui.new_checkbox, R, Z, "skeet autostop rework" .. yK(""));

				if A ~= nil then

					pK('ragebot', 'autostop', A);

				end;

				local R = {

					0,

					3,

					4

				};

				local Z = {

					0,

					2,

					3,

					4,

					5,

					6

				};

				local yK = {

					last_contact = - 10.0,

					aimed_since = - 1.0,

					alive = false,

					spawn_grace_until = 0,

					enemy_tick = - 1.0,

					enemy_visible = false,

					enemy_fov = nil,

					stop_until = 0,

					reason = "idle"

				};

				local QK = {

					CWeaponTaser = "taser",

					CKnife = 'knife',

					CKnifeGG = 'knife',

					CFlashbang = "grenade",

					CHEGrenade = "grenade",

					CSmokeGrenade = 'grenade',

					CMolotovGrenade = "grenade",

					CIncendiaryGrenade = 'grenade',

					CDecoyGrenade = 'grenade',

					CDEagle = "pistol",

					CWeaponRevolver = "pistol",

					CWeaponSSG08 = 'scout',

					CWeaponAWP = "sniper",

					CWeaponSCAR20 = 'auto',

					CWeaponG3SG1 = 'auto'

				};

				local function lK(qK)

					yK.last_contact = - 10.0;

					yK.aimed_since = - 1.0;

					yK.spawn_grace_until = (qK and (qK > 0) and ((globals.curtime() or 0) + qK)) or 0;

				end;

				local function qK(cK)

					cK = (tonumber(cK) or 0) % 360;

					if cK > 180 then

						cK = cK - 360;

					end;

					return cK;

				end;

				local function cK(PK, oK)

					local mK = PK and PK[oK];

					return (mK == true) or (mK == 1);

				end;

				local function PK(oK)

					return cK(oK, 'in_forward') or cK(oK, "in_back") or cK(oK, "in_moveleft") or cK(oK, 'in_moveright');

				end;

				local function oK(mK)

					if cK(mK, 'in_attack') or cK(mK, 'in_attack2') then

						return true;

					end;

					return mK and (mK.buttons ~= nil) and (bit ~= nil) and (bit.band(mK.buttons, 1) ~= 0);

				end;

				local function mK(BK)

					if cK(BK, 'in_jump') then

						return true;

					end;

					return BK and (BK.buttons ~= nil) and (bit ~= nil) and (bit.band(BK.buttons, 2) ~= 0);

				end;

				local function BK(MK)

					if cK(MK, "in_use") then

						return true;

					end;

					if MK and (MK.buttons ~= nil) and (bit ~= nil) and (bit.band(MK.buttons, 32) ~= 0) then

						return true;

					end;

					return false;

				end;

				local function cK(MK)

					if MK == nil then

						return "none";

					end;

					local WK = entity.get_classname(MK) or "";

					if QK[WK] ~= nil then

						return QK[WK];

					end;

					if WK:find('Knife', 1, true) then

						return 'knife';

					end;

					if WK:find('Grenade', 1, true) or WK:find("Flashbang", 1, true) then

						return "grenade";

					end;

					return 'other';

				end;

				local function QK(MK, WK)

					local YK = entity.get_classname(WK) or "";

					local WK = entity.get_prop(MK, 'm_bIsScoped') == 1;

					if YK == "CWeaponAWP" then

						return (WK and 100) or 200;

					end;

					if (YK == "CWeaponSCAR20") or (YK == "CWeaponG3SG1") then

						return (WK and 150) or 215;

					end;

					if YK == "CWeaponSSG08" then

						return 230;

					end;

					if YK == 'CWeaponRevolver' then

						return 180;

					end;

					if YK == "CDEagle" then

						return 230;

					end;

					return 250;

				end;

				local function MK(WK, YK, CK)

					local DK = cK(YK);

					local YK = entity.get_prop(WK, 'm_bIsScoped') == 1;

					local NK = entity.get_prop(WK, 'm_flDuckAmount') or 0;

					local LK = entity.get_prop(WK, "m_flVelocityModifier") or 1;

					local WK = 0.26;

					if (DK == 'sniper') or (DK == "auto") or (DK == 'scout') then

						WK = (YK and 0.2) or 0.1;

					end;

					if NK > 0.7 then

						WK = WK + 0.02;

					end;

					WK = WK * H(LK, 0.8, 1);

					local YK = math.max(6, math.floor((CK * WK) + 0.5));

					return YK, math.max(3, YK - 8);

				end;

				local function WK(YK)

					local CK, DK, NK = entity.get_prop(YK, "m_vecAbsVelocity");

					if CK == nil then

						CK, DK, NK = entity.get_prop(YK, 'm_vecVelocity');

					end;

					if CK == nil then

						CK = entity.get_prop(YK, 'm_vecVelocity[0]') or 0;

						DK = entity.get_prop(YK, 'm_vecVelocity[1]') or 0;

						NK = entity.get_prop(YK, "m_vecVelocity[2]") or 0;

					end;

					return CK or 0, DK or 0, NK or 0;

				end;

				local function YK(CK)

					local DK = globals.tickcount();

					if yK.enemy_tick == DK then

						return yK.enemy_visible, yK.enemy_fov;

					end;

					local NK, LK = client.eye_position();

					if NK == nil then

						return false, nil;

					end;

					local GK, vK = {}, {};

					if entity.get_local_player ~= nil then

						local rK, TK = pcall(entity.get_local_player);

						if rK and (TK ~= nil) and entity.is_alive(TK) and (not entity.is_dormant(TK)) then

							GK[# GK + 1] = TK;

							vK[TK] = true;

						end;

					end;

					local rK = entity.get_players(true);

					if type(rK) == 'table' then

						for TK = 1, # rK do

							local wK = rK[TK];

							if not vK[wK] then

								GK[# GK + 1] = wK;

								vK[wK] = true;

								if # GK >= 3 then

									break;

								end;

							end;

						end;

					end;

					if type(GK) ~= "table" then

						return false, nil;

					end;

					local vK, rK = nil, false;

					for TK = 1, # GK do

						local wK = GK[TK];

						if entity.is_alive(wK) and (not entity.is_dormant(wK)) then

							for GK = 1, # R do

								local TK, nK, uK = entity.hitbox_position(wK, R[GK]);

								if (TK ~= nil) and j[85](TK, nK, uK) then

									rK = true;

									local R = math.deg(math.atan2(nK - LK, TK - NK));

									local NK = math.abs(qK(R - CK));

									if (vK == nil) or (NK < vK) then

										vK = NK;

									end;

									break;

								end;

							end;

						end;

					end;

					yK.enemy_tick, yK.enemy_visible, yK.enemy_fov = DK, rK, vK;

					return rK, vK;

				end;

				local function R(CK, DK, NK)

					local LK = (entity.get_prop(CK, 'm_nTickBase') or 0) * (globals.tickinterval() or 0.015625);

					local GK = entity.get_prop(DK, "m_flNextPrimaryAttack") or 0;

					local DK = entity.get_prop(CK, 'm_flNextAttack') or 0;

					local CK = math.max(GK, DK) - LK;

					return CK <= ((globals.tickinterval() or 0.015625) * NK), CK <= 0;

				end;

				local function CK()

					local DK = rawget(_G, "INFINIX_SHOT_DIRECTOR");

					if (type(DK) ~= "table") or (DK.active ~= true) then

						return false, false, "idle";

					end;

					local NK = tonumber(DK.target) or 0;

					if NK <= 0 then

						return false, false, tostring(DK.reason or 'no target');

					end;

					local NK = tostring(DK.reason or "force shot");

					local LK = (DK.applied == true) or (DK.stop_pressure == true);

					local GK = LK or (DK.stop_pressure == true);

					return GK == true, LK == true, NK;

				end;

				local function DK()

					local NK = rawget(_G, 'INFINIX_SHOT_DIRECTOR');

					if (type(NK) ~= "table") or (NK.active ~= true) then

						return false, false, nil;

					end;

					local LK = globals.tickcount();

					if (NK.tick ~= nil) and (LK ~= nil) and ((LK - (tonumber(NK.tick) or 0)) > 1) then

						return true, false, NK;

					end;

					local LK = tonumber(NK.target) or 0;

					local GK = (NK.applied == true) and (NK.air_release == true) and (LK > 0);

					return true, GK, NK;

				end;

				local function NK()

					local LK = rawget(_G, "INFINIX_AI_PEEK_CONTEXT");

					if (type(LK) ~= "table") or (type(LK.get) ~= 'function') then

						return false;

					end;

					local GK, vK = pcall(LK.get);

					if (not GK) or (type(vK) ~= "table") then

						return false;

					end;

					return (vK.active == true) or (vK.returning == true) or (vK.return_allowed == true) or (vK.force_return_now == true) or (tostring(vK.state or '') == "peeking") or (tostring(vK.state or "") == 'returning');

				end;

				local function LK(GK, vK, rK, TK, wK, nK)

					if TK <= wK then

						GK.forwardmove, GK.sidemove = 0, 0;

						return;

					end;

					local uK, uK = client.camera_angles();

					if GK.yaw ~= nil then

						uK = GK.yaw;

					end;

					local eK = math.rad(qK((uK or 0) - math.deg(math.atan2(rK, vK))));

					local vK = TK - wK;

					local rK = (nK and (((vK > 42) and 960) or 860)) or ((vK > 35) and 650) or ((vK > 15) and math.min(250, math.max(150, vK * 16))) or math.max(50, vK * 22);

					GK.forwardmove = - math.cos(eK) * rK;

					GK.sidemove = - math.sin(eK) * rK;

				end;

				local function GK(vK)

					if vK == nil then

						return;

					end;

					vK.in_forward = false;

					vK.in_back = false;

					vK.in_moveleft = false;

					vK.in_moveright = false;

				end;

				local function vK(rK, TK)

					GK(rK);

					if (rK.forwardmove or 0) > 1 then

						rK.in_forward = true;

					elseif (rK.forwardmove or 0) < - 1.0 then

						rK.in_back = true;

					end;

					if (rK.sidemove or 0) > 1 then

						rK.in_moveright = true;

					elseif (rK.sidemove or 0) < - 1.0 then

						rK.in_moveleft = true;

					end;

					if TK ~= false then

						rK.in_speed = true;

					end;

				end;

				local function rK()

					local TK = rawget(_G, 'INFINIX_AIR_SCOUT_AUTOSTOP_ACTIVE');

					if type(TK) == "function" then

						local wK, nK = pcall(TK);

						return wK and (nK == true);

					end;

					return rawget(_G, 'INFINIX_AIR_SCOUT_AUTOSTOP_ON') == true;

				end;

				local function TK(wK, nK)

					local uK = entity.get_prop(wK, 'm_fFlags') or 0;

					if (bit ~= nil) and (bit.band(uK, 1) ~= 0) then

						return false;

					end;

					if nK == nil then

						local uK, uK, uK = WK(wK);

						nK = uK;

					end;

					return (tonumber(nK) or 0) > - 10.0;

				end;

				local function wK(nK, uK)

					if (uK == nil) or (uK == 0) then

						return false, 0;

					end;

					if (not entity.is_alive(uK)) or entity.is_dormant(uK) or (not entity.is_enemy(uK)) then

						return false, 0;

					end;

					local eK, JK, KK = client.eye_position();

					if eK == nil then

						return false, 0;

					end;

					local fK = 0;

					for iK = 1, # Z do

						local UK, xK, tK = entity.hitbox_position(uK, Z[iK]);

						if UK ~= nil then

							local Z, iK = pcall(client.trace_bullet, nK, eK, JK, KK, UK, xK, tK);

							local AK, SK, dK = pcall(client.trace_line, nK, eK, JK, KK, UK, xK, tK, false);

							dK = tonumber(dK) or 0;

							if dK > fK then

								fK = dK;

							end;

							local nK = SK == uK;

							local uK = (tonumber(iK) or 0) > 0.7;

							if Z and AK and (dK >= 2) and (nK or uK) then

								return true, dK;

							end;

						end;

					end;

					return false, fK;

				end;

				local function Z(nK)

					local uK, eK = nil, 0;

					local JK = {};

					if entity.get_local_player ~= nil then

						local KK, fK = pcall(entity.get_local_player);

						if KK and (fK ~= nil) and (fK ~= 0) then

							JK[fK] = true;

							local KK, iK = wK(nK, fK);

							if KK then

								return fK, iK;

							end;

							uK, eK = fK, math.max(eK, tonumber(iK) or 0);

						end;

					end;

					local KK = entity.get_players(true);

					if type(KK) ~= "table" then

						return uK, eK;

					end;

					for fK = 1, # KK do

						local iK = KK[fK];

						if not JK[iK] then

							JK[iK] = true;

							local JK, KK = wK(nK, iK);

							KK = tonumber(KK) or 0;

							if JK then

								return iK, KK;

							end;

							if KK > eK then

								uK, eK = iK, KK;

							end;

						end;

					end;

					return uK, eK;

				end;

				local function wK(nK)

					if (nK == nil) or (nK == 0) then

						return 0;

					end;

					local uK, eK = entity.get_prop(nK, "m_vecAbsVelocity");

					if uK == nil then

						uK, eK = entity.get_prop(nK, "m_vecVelocity");

					end;

					if uK == nil then

						uK = entity.get_prop(nK, 'm_vecVelocity[0]') or 0;

						eK = entity.get_prop(nK, "m_vecVelocity[1]") or 0;

					end;

					return math.sqrt(((uK or 0) * (uK or 0)) + ((eK or 0) * (eK or 0)));

				end;

				local function nK(uK, eK, JK, KK, fK)

					local iK = wK(uK);

					if iK < 135 then

						return true, false, iK;

					end;

					if (not JK) or (not KK) or (type(fK) ~= "table") then

						return false, true, iK;

					end;

					local wK = tonumber(fK.fov) or 999;

					local uK = tonumber(fK.accuracy) or 0;

					local JK = tonumber(fK.delay_ticks) or 0;

					local KK = tonumber(eK) or 0;

					if wK > 18 then

						return false, true, iK;

					end;

					if (uK > 0) and (uK < 0.52) then

						return false, true, iK;

					end;

					if JK < 1 then

						return false, true, iK;

					end;

					if KK < 24 then

						return false, true, iK;

					end;

					return true, true, iK;

				end;

				local function wK(uK, eK, JK)

					local KK = math.sqrt(((eK or 0) * (eK or 0)) + ((JK or 0) * (JK or 0)));

					if KK <= 2 then

						return 450;

					end;

					local fK, iK, UK = entity.get_origin(uK);

					if fK == nil then

						return 450;

					end;

					local xK, tK = (eK or 0) / KK, (JK or 0) / KK;

					local eK = (UK or 0) + 36;

					local JK = 1;

					local KK, UK = pcall(client.trace_bullet, uK, fK, iK, eK, fK + (xK * 72), iK + (tK * 72), eK);

					if KK and (UK ~= nil) and (UK < JK) then

						JK = UK;

					end;

					local KK, UK = pcall(client.trace_bullet, uK, fK, iK, eK, fK - (xK * 72), iK - (tK * 72), eK);

					if KK and (UK ~= nil) and (UK < JK) then

						JK = UK;

					end;

					if JK < 0.18 then

						return 260;

					end;

					if JK < 0.34 then

						return 340;

					end;

					return 450;

				end;

				local function uK(eK, JK, KK, fK)

					local iK = math.sqrt(((KK or 0) * (KK or 0)) + ((fK or 0) * (fK or 0)));

					if iK <= 2 then

						eK.forwardmove = 0;

						eK.sidemove = 0;

						GK(eK);

						eK.move_yaw = eK.yaw;

						eK.in_speed = true;

						eK.quick_stop = true;

						return;

					end;

					local GK = eK.move_yaw or eK.yaw or 0;

					local iK = math.deg(math.atan2(fK or 0, KK or 0));

					local UK = math.rad(qK(iK - GK));

					local qK = wK(JK, KK, fK);

					eK.forwardmove = H(- math.cos(UK) * qK, - qK, qK);

					eK.sidemove = H(math.sin(UK) * qK, - qK, qK);

					eK.move_yaw = GK;

					eK.quick_stop = true;

					vK(eK, true);

				end;

				local function qK(GK, vK, wK, eK, JK, KK)

					if not rK() then

						return false;

					end;

					if cK(wK) ~= 'scout' then

						return false;

					end;

					if not TK(vK, KK) then

						return false;

					end;

					local TK, KK, fK = DK();

					if TK then

						if not KK then

							yK.reason = (fK and tostring(fK.reason or 'force shot wait')) or "force shot wait";

							return false;

						end;

					end;

					local DK = R(vK, wK, 15);

					if not DK then

						return false;

					end;

					local DK, wK;

					if TK and (fK ~= nil) then

						DK = tonumber(fK.target) or 0;

						wK = tonumber(fK.damage) or 0;

					else

						DK, wK = Z(vK);

					end;

					wK = tonumber(wK) or 0;

					if (DK == nil) or (DK == 0) or (wK < 2) then

						yK.reason = ((wK > 0) and "air scout trace weak") or 'air scout no damage';

						return false;

					end;

					local Z, iK = nK(DK, wK, TK, KK, fK);

					if not Z then

						yK.reason = (iK and "air scout cross wait") or "air scout wait";

						return false;

					end;

					yK.stop_until = globals.tickcount() + 1;

					yK.reason = (iK and 'air scout cross') or 'air scout';

					uK(GK, vK, eK, JK);

					return true;

				end;

				zK[# zK + 1] = function(Z)

					local DK = V(A) == true;

					local GK = rK();

					if (not DK) and (not GK) then

						return;

					end;

					if NK() then

						yK.stop_until = 0;

						yK.reason = 'ai peek';

						return;

					end;

					local NK = entity.get_local_player();

					if NK == nil then

						yK.alive = false;

						lK(0.22);

						return;

					end;

					if not entity.is_alive(NK) then

						if yK.alive then

							lK(0.28);

						end;

						yK.alive = false;

						return;

					end;

					if not yK.alive then

						yK.alive = true;

						lK(0.28);

					end;

					local vK = globals.curtime() or 0;

					if vK < yK.spawn_grace_until then

						return;

					end;

					if mK(Z) and (not GK) then

						lK(0.08);

						return;

					end;

					if BK(Z) then

						lK(0.1);

						return;

					end;

					if PK(Z) and (not GK) then

						return;

					end;

					local lK = entity.get_player_weapon(NK);

					if lK == nil then

						return;

					end;

					local mK = cK(lK);

					if (mK == "knife") or (mK == "grenade") or (mK == 'taser') then

						return;

					end;

					local cK = entity.get_prop(NK, 'm_MoveType') or 0;

					if (cK == 8) or (cK == 9) then

						return;

					end;

					local cK = entity.get_prop(NK, 'm_fFlags') or 0;

					local BK, GK, rK = WK(NK);

					if (bit ~= nil) and (bit.band(cK, 1) == 0) then

						if qK(Z, NK, lK, BK, GK, rK) then

							return;

						end;

						return;

					end;

					if not DK then

						return;

					end;

					if PK(Z) then

						return;

					end;

					if math.abs(rK or 0) > 55 then

						return;

					end;

					local qK = math.sqrt((BK * BK) + (GK * GK));

					if qK <= 3 then

						return;

					end;

					local cK, cK = client.camera_angles();

					if Z.yaw ~= nil then

						cK = Z.yaw;

					end;

					local PK, WK = YK(cK or 0);

					if PK then

						yK.last_contact = vK;

					end;

					local cK = (vK - yK.last_contact) <= 0.24;

					local YK, DK = R(NK, lK, ((mK == "pistol") and 14) or 6);

					local R = (WK ~= nil) and (WK <= 28);

					if R then

						if yK.aimed_since < 0 then

							yK.aimed_since = vK;

						end;

					else

						yK.aimed_since = - 1.0;

					end;

					local rK = R and (yK.aimed_since >= 0) and ((vK - yK.aimed_since) >= (((qK > 140) and 0.075) or 0.025));

					local vK = PK and ((WK == nil) or (WK <= 52));

					local WK, TK, wK = CK();

					local CK = oK(Z) or YK or DK or PK or cK;

					local nK = ((rK or R or cK or vK) and CK) or (WK and (TK or YK or DK or cK)) or (globals.tickcount() <= (yK.stop_until or 0));

					if nK then

						if WK then

							yK.reason = (TK and 'force shot ready') or wK;

						elseif oK(Z) then

							yK.reason = "attack";

						elseif PK then

							yK.reason = "visible";

						elseif cK then

							yK.reason = "recent";

						else

							yK.reason = 'weapon ready';

						end;

						yK.stop_until = globals.tickcount() + 3;

						local R = QK(NK, lK);

						local yK, yK = MK(NK, lK, R);

						LK(Z, BK, GK, qK, yK, mK == 'pistol');

					end;

				end;

				return A;

			end;

			local function A(R)

				R = R or {};

				local Z = R.tab or 'AA';

				local yK = R.group or "Fake lag";

				local QK = R.uniq or b;

				local R = Q(ui.new_checkbox, Z, yK, 'force shot' .. QK(""));

				if R == nil then

					return nil;

				end;

				local lK = Q(ui.new_hotkey, Z, yK, '  force shot key', true);

				local qK = Q(ui.new_label, Z, yK, "\aFF8060FF  don't use with custom hitchance" .. QK(""));

				local Z;

				do

					local yK = {

						{

							'Rage',

							'Aimbot',

							"Minimum hit chance"

						},

						{

							'RAGE',

							"Aimbot",

							"Minimum hit chance"

						},

						{

							"Rage",

							"Aimbot",

							'Minimum hitchance'

						},

						{

							'RAGE',

							'Aimbot',

							"Minimum hitchance"

						}

					};

					for QK = 1, # yK do

						local cK, PK = pcall(ui.reference, yK[QK][1], yK[QK][2], yK[QK][3]);

						if cK and (PK ~= nil) then

							Z = PK;

							break;

						end;

					end;

				end;

				local yK, QK;

				do

					local cK = {

						{

							"Rage",

							'Aimbot',

							'Multi-point'

						},

						{

							"RAGE",

							"Aimbot",

							'Multi-point'

						},

						{

							"Rage",

							"Aimbot",

							'Multipoint'

						},

						{

							'RAGE',

							'Aimbot',

							'Multipoint'

						},

						{

							'Rage',

							'Aimbot',

							'Target multipoint'

						},

						{

							'RAGE',

							'Aimbot',

							"Target multipoint"

						}

					};

					local PK = {

						{

							'Rage',

							'Aimbot',

							'Multi-point scale'

						},

						{

							"RAGE",

							"Aimbot",

							'Multi-point scale'

						},

						{

							"Rage",

							'Aimbot',

							"Multipoint scale"

						},

						{

							"RAGE",

							"Aimbot",

							'Multipoint scale'

						},

						{

							"Rage",

							'Aimbot',

							'Point scale'

						},

						{

							"RAGE",

							"Aimbot",

							'Point scale'

						}

					};

					for oK = 1, # cK do

						local mK, BK = pcall(ui.reference, cK[oK][1], cK[oK][2], cK[oK][3]);

						if mK and (BK ~= nil) then

							yK = BK;

							break;

						end;

					end;

					for cK = 1, # PK do

						local oK, mK = pcall(ui.reference, PK[cK][1], PK[cK][2], PK[cK][3]);

						if oK and (mK ~= nil) then

							QK = mK;

							break;

						end;

					end;

				end;

				local cK = {

					scout = {

						air = {

							perfect = 0.007,

							worst = 0.08

						},

						land = {

							perfect = 0.003,

							worst = 0.035

						},

						noscope = {

							perfect = 0.04,

							worst = 0.12

						}

					},

					awp = {

						air = {

							perfect = 0.01,

							worst = 0.1

						},

						land = {

							perfect = 0.001,

							worst = 0.025

						},

						noscope = {

							perfect = 0.03,

							worst = 0.1

						}

					},

					auto = {

						air = {

							perfect = 0.008,

							worst = 0.09

						},

						land = {

							perfect = 0.002,

							worst = 0.03

						},

						noscope = {

							perfect = 0.025,

							worst = 0.08

						}

					},

					deagle = {

						air = {

							perfect = 0.02,

							worst = 0.15

						},

						land = {

							perfect = 0.004,

							worst = 0.05

						},

						noscope = {

							perfect = 0.004,

							worst = 0.05

						}

					},

					revolver = {

						air = {

							perfect = 0.015,

							worst = 0.12

						},

						land = {

							perfect = 0.003,

							worst = 0.04

						},

						noscope = {

							perfect = 0.003,

							worst = 0.04

						}

					},

					pistol = {

						air = {

							perfect = 0.02,

							worst = 0.12

						},

						land = {

							perfect = 0.005,

							worst = 0.045

						},

						noscope = {

							perfect = 0.005,

							worst = 0.045

						}

					}

				};

				local PK = {

					CWeaponSSG08 = "scout",

					CWeaponAWP = 'awp',

					CWeaponG3SG1 = "auto",

					CWeaponSCAR20 = "auto",

					CDEagle = 'deagle',

					CWeaponRevolver = "revolver",

					CGlock = "pistol",

					CWeaponP2000 = 'pistol',

					CWeaponUSP_Silencer = 'pistol',

					CWeaponP250 = 'pistol',

					CWeaponFiveSeven = "pistol",

					CWeaponTec9 = 'pistol',

					CWeaponElite = 'pistol',

					CWeaponCZ75A = 'pistol'

				};

				local oK, mK, BK = false, false, false;

				local MK, WK = nil, 0;

				local YK = math.floor(20.3);

				local CK = {

					scout = 42,

					awp = 45,

					auto = 46,

					deagle = 44,

					revolver = 38,

					pistol = 45

				};

				local DK = {

					scout = {

						close = {

							hc = 38,

							scale = 78,

							points = {

								'Head',

								"Chest",

								"Stomach"

							},

							name = 'scout close fast'

						},

						mid = {

							hc = 42,

							scale = 70,

							points = {

								"Head",

								'Chest',

								'Stomach'

							},

							name = "scout mid balanced"

						},

						far = {

							hc = 48,

							scale = 58,

							points = {

								'Head',

								"Chest"

							},

							name = 'scout far safe'

						}

					},

					awp = {

						close = {

							hc = 40,

							scale = 74,

							points = {

								'Chest',

								"Stomach",

								"Head"

							},

							name = 'awp close body'

						},

						mid = {

							hc = 45,

							scale = 66,

							points = {

								"Chest",

								"Stomach",

								"Head"

							},

							name = 'awp mid balanced'

						},

						far = {

							hc = 52,

							scale = 54,

							points = {

								'Chest',

								'Stomach'

							},

							name = 'awp far safe'

						}

					},

					auto = {

						close = {

							hc = 42,

							scale = 72,

							points = {

								'Chest',

								"Stomach"

							},

							name = 'auto close stable'

						},

						mid = {

							hc = 46,

							scale = 64,

							points = {

								'Chest',

								'Stomach'

							},

							name = 'auto mid stable'

						},

						far = {

							hc = 52,

							scale = 52,

							points = {

								"Chest"

							},

							name = "auto far safe"

						}

					},

					pistol = {

						close = {

							hc = 44,

							scale = 64,

							points = {

								"Head",

								"Chest"

							},

							name = "pistol close"

						},

						mid = {

							hc = 50,

							scale = 56,

							points = {

								'Head',

								"Chest"

							},

							name = 'pistol mid'

						},

						far = {

							hc = 58,

							scale = 48,

							points = {

								"Head"

							},

							name = 'pistol far'

						}

					}

				};

				local NK = {

					scout = {

						close = 55,

						mid = 40,

						far = 30

					},

					awp = {

						close = 70,

						mid = 55,

						far = 40

					},

					auto = {

						close = 35,

						mid = 28,

						far = 22

					},

					pistol = {

						close = 30,

						mid = 25,

						far = 20

					}

				};

				local LK = {

					{

						dist = 450,

						hc = 50,

						seen = 0,

						fov = 34,

						acc = 0.3,

						vz = 360,

						dmg = 55

					},

					{

						dist = 900,

						hc = 40,

						seen = 1,

						fov = 28,

						acc = 0.38,

						vz = 320,

						dmg = 40

					},

					{

						dist = 1400,

						hc = 30,

						seen = 2,

						fov = 22,

						acc = 0.48,

						vz = 270,

						dmg = 30

					},

					{

						dist = 99999,

						hc = 24,

						seen = 3,

						fov = 18,

						acc = 0.58,

						vz = 230,

						dmg = 25

					}

				};

				local GK, vK = nil, false;

				local rK = false;

				local TK, wK, nK = 0, 0, 0;

				local uK = - 999.0;

				local eK, JK, KK, fK = false, 'idle', 0, 0;

				local iK = {

					source = "force shot",

					active = false,

					ready = false,

					applied = false,

					reason = "idle"

				};

				rawset(_G, "INFINIX_SHOT_DIRECTOR", iK);

				rawset(_G, 'INFINIX_FORCE_SHOT_ACTIVE', false);

				rawset(_G, "INFINIX_FORCE_SHOT_READY", false);

				rawset(_G, "INFINIX_FORCE_SHOT_APPLIED", false);

				rawset(_G, "INFINIX_FORCE_SHOT_BLOCKED", false);

				rawset(_G, 'INFINIX_FORCE_SHOT_BLOCKED_REASON', "idle");

				local function UK(xK, tK, AK, SK, dK, RK, kK)

					kK = ((type(kK) == 'table') and kK) or nil;

					iK.tick = globals.tickcount();

					iK.active = oK == true;

					iK.ready = mK == true;

					iK.applied = BK == true;

					iK.stop_pressure = (kK and (kK.stop_pressure == true)) or (BK == true);

					iK.target = xK or 0;

					iK.reason = tostring(tK or "idle");

					iK.delay_ticks = tonumber(AK) or 0;

					iK.fire_gap = tonumber(SK) or 0;

					iK.hitchance = tonumber(dK) or 0;

					iK.accuracy = tonumber(RK) or 0;

					iK.weapon_type = (kK and tostring(kK.weapon_type or '')) or "";

					iK.on_ground = (kK and (kK.on_ground == true)) or false;

					iK.air_release = (kK and (kK.air_release == true)) or false;

					iK.distance = (kK and (tonumber(kK.distance) or 0)) or 0;

					iK.fov = (kK and (tonumber(kK.fov) or 0)) or 0;

					iK.damage = (kK and (tonumber(kK.damage) or 0)) or 0;

					iK.speed = (kK and (tonumber(kK.speed) or 0)) or 0;

					iK.vz = (kK and (tonumber(kK.vz) or 0)) or 0;

					iK.policy = (kK and tostring(kK.policy or "")) or '';

					iK.point_scale = (kK and (tonumber(kK.point_scale) or 0)) or 0;

					iK.multipoints = (kK and tostring(kK.multipoints or '')) or "";

					iK.fire_policy = (kK and tostring(kK.fire_policy or '')) or '';

				end;

				local function iK(xK)

					if type(xK) ~= "table" then

						return '-';

					end;

					local tK = {};

					for AK = 1, # xK do

						tK[# tK + 1] = tostring(xK[AK]);

					end;

					return ((# tK > 0) and table.concat(tK, '/')) or "-";

				end;

				local function xK()

					return;

				end;

				local function tK()

					if (Z ~= nil) and vK then

						NATIVE_DECISION.clear(Z, "force_shot");

					end;

					if (yK ~= nil) and rK then

						NATIVE_DECISION.clear(yK, 'force_shot');

					end;

					if (QK ~= nil) and rK then

						NATIVE_DECISION.clear(QK, "force_shot");

					end;

					GK, vK = nil, false;

					rK = false;

				end;

				local function AK(SK)

					if (Z == nil) or (SK == nil) then

						return;

					end;

					if not vK then

						GK = V(Z);

						vK = true;

					end;

					NATIVE_DECISION.request(Z, 'force_shot', 45, 'delay release', SK);

				end;

				local function SK(dK)

					if type(dK) ~= 'table' then

						return;

					end;

					if (yK ~= nil) and (type(dK.points) == "table") and (# dK.points > 0) then

						NATIVE_DECISION.request(yK, 'force_shot', 44, dK.name or 'force shot points', y(dK.points));

						rK = true;

					end;

					if (QK ~= nil) and (dK.scale ~= nil) then

						NATIVE_DECISION.request(QK, "force_shot", 44, dK.name or 'force shot scale', dK.scale);

						rK = true;

					end;

				end;

				local function yK()

					if (not oK) and (not mK) and (not BK) and (not vK) and (not rK) and (TK <= 0) and (uK < 0) then

						return;

					end;

					tK();

					oK = false;

					mK = false;

					BK = false;

					rawset(_G, "INFINIX_FORCE_SHOT_ACTIVE", false);

					rawset(_G, 'INFINIX_FORCE_SHOT_READY', false);

					rawset(_G, "INFINIX_FORCE_SHOT_APPLIED", false);

					rawset(_G, 'INFINIX_FORCE_SHOT_BLOCKED', false);

					rawset(_G, "INFINIX_FORCE_SHOT_BLOCKED_REASON", 'idle');

					uK = - 999.0;

					eK, JK, KK, fK = false, 'idle', 0, 0;

					wK = 0;

					UK(0, 'idle', 0, 0, 0, 0);

				end;

				local function QK(vK)

					if vK == nil then

						return false;

					end;

					local rK = tostring(entity.get_classname(vK) or ""):lower();

					return not (rK:find("knife") or rK:find("grenade") or rK:find("flashbang") or rK:find('molotov') or rK:find("incgrenade") or rK:find('decoy') or rK:find("smoke") or rK:find("c4") or rK:find('taser'));

				end;

				local function vK(rK)

					local dK = entity.get_classname(rK) or '';

					return PK[dK] or 'pistol';

				end;

				local function PK(rK, dK, RK, kK, IK, FK, ZK)

					local yA = cK[rK] or cK.pistol;

					local cK = ((not FK) and yA.air) or ((not ZK) and yA.noscope) or yA.land;

					local rK = entity.get_prop(IK, 'm_fAccuracyPenalty') or 0;

					local IK = math.max(0, math.min(1, 1 - ((rK - cK.perfect) / (cK.worst - cK.perfect))));

					local cK = entity.get_prop(kK, "m_vecVelocity[0]") or 0;

					local ZK = entity.get_prop(kK, "m_vecVelocity[1]") or 0;

					local kK = math.sqrt((cK * cK) + (ZK * ZK));

					local cK = ((kK <= 2) and 1) or ((kK >= 85) and 0) or (1 - ((kK - 2) / 83));

					local ZK = (FK and math.min(IK, cK)) or IK;

					ZK = ZK * ZK * (3 - (2 * ZK));

					local cK = ((RK == - 1.0) and math.floor(15 + (40 * (1 - ZK)))) or RK;

					local RK = math.floor(cK + ((dK - cK) * (1 - ZK)) + 0.5);

					return math.max(1, math.min(100, RK)), ZK, rK, kK;

				end;

				local function cK(rK, dK)

					local RK = entity.get_prop(rK, 'm_nTickBase') or 0;

					local kK = RK * (globals.tickinterval() or 0.015625);

					local RK = entity.get_prop(dK, "m_flNextPrimaryAttack") or 0;

					local IK = entity.get_prop(rK, "m_flNextAttack") or 0;

					local rK = entity.get_prop(dK, 'm_iClip1');

					return ((rK == nil) or (rK > 0)) and (RK <= kK) and (IK <= kK);

				end;

				local function rK(dK)

					local RK, kK, IK = client.eye_position();

					if RK ~= nil then

						return RK, kK, IK;

					end;

					local RK, kK, IK = entity.get_origin(dK);

					if RK == nil then

						return nil;

					end;

					local FK, FK, FK = entity.get_prop(dK, "m_vecViewOffset");

					return RK, kK, IK + (FK or 64);

				end;

				local function dK(RK, kK)

					if (kK == nil) or (kK == 0) then

						return nil, nil;

					end;

					local IK, FK, ZK = rK(RK);

					if IK == nil then

						return nil, nil;

					end;

					local RK, yA, jA = entity.hitbox_position(kK, 3);

					if RK == nil then

						RK, yA, jA = entity.hitbox_position(kK, 0);

					end;

					if RK == nil then

						RK, yA, jA = entity.get_origin(kK);

						if RK == nil then

							return nil, nil;

						end;

					end;

					local kK, QA, bA = RK - IK, yA - FK, (jA or ZK) - ZK;

					local RK = math.sqrt((kK * kK) + (QA * QA) + (bA * bA));

					local IK, IK = client.camera_angles();

					local FK = math.deg(math.atan2(QA, kK));

					local kK = math.abs((((FK - (IK or 0)) + 180) % 360) - 180);

					return RK, kK;

				end;

				local function RK(kK)

					kK = tonumber(kK) or 99999;

					for IK = 1, # LK do

						local FK = LK[IK];

						if kK <= FK.dist then

							return FK;

						end;

					end;

					return LK[# LK];

				end;

				local function LK(kK)

					kK = tonumber(kK) or 99999;

					if kK <= 550 then

						return "close";

					end;

					if kK <= 1150 then

						return 'mid';

					end;

					return "far";

				end;

				local function kK(IK)

					if (IK == nil) or (IK == 0) then

						return 100;

					end;

					local FK = tonumber(entity.get_prop(IK, 'm_iHealth')) or 0;

					return ((FK > 0) and FK) or 100;

				end;

				local function IK(FK, ZK, yA)

					if (type(yA) == 'table') and (yA.dmg ~= nil) then

						return tonumber(yA.dmg) or 25;

					end;

					local yA = FK;

					if (yA == "deagle") or (yA == 'revolver') then

						yA = "pistol";

					end;

					local FK = NK[yA] or NK.pistol;

					local NK = LK(ZK);

					return FK[NK] or FK.mid or 25;

				end;

				local function NK(FK, ZK, yA, jA, QA)

					local bA = tonumber(yA) or 0;

					local yA = IK(FK, ZK, QA);

					local IK = kK(jA);

					if (IK > 0) and (bA >= IK) then

						return true, yA, IK, true;

					end;

					return bA >= yA, yA, IK, false;

				end;

				local function kK(IK, FK, ZK, yA, jA)

					local QA = IK;

					if (QA == 'deagle') or (QA == "revolver") then

						QA = "pistol";

					end;

					local IK = DK[QA] or DK.pistol;

					local DK = LK(FK);

					local LK = IK[DK] or IK.mid or IK.close;

					if LK == nil then

						return nil, DK;

					end;

					local IK = {

						name = LK.name,

						hc = LK.hc,

						scale = LK.scale,

						points = LK.points

					};

					local LK = tonumber(ZK) or 0;

					if yA and (DK ~= "far") then

						IK.hc = math.max(20, IK.hc - 4);

						IK.scale = math.min(82, (IK.scale or 60) + 4);

						IK.name = tostring(IK.name or 'policy') .. ' hard';

					end;

					if (LK > 0) and (LK < 20) then

						IK.hc = IK.hc + 5;

						IK.scale = math.max(45, (IK.scale or 60) - 6);

						IK.name = tostring(IK.name or 'policy') .. " lowdmg";

					elseif (LK >= 70) and (DK ~= "far") then

						IK.hc = math.max(20, IK.hc - 3);

					end;

					if (tonumber(jA) or 0) < 0.65 then

						IK.hc = IK.hc + 4;

						IK.scale = math.max(45, (IK.scale or 60) - 4);

					end;

					IK.hc = math.max(20, math.min(75, math.floor((IK.hc or 45) + 0.5)));

					IK.scale = math.max(35, math.min(85, math.floor((IK.scale or 60) + 0.5)));

					return IK, DK;

				end;

				local function DK(LK, IK, FK, ZK, yA, jA, QA)

					local bA, lA = dK(LK, IK);

					if (bA == nil) or (lA == nil) then

						return false, 0, 'air scout no metrics', 0, 0, 0;

					end;

					local VA = RK(bA);

					local RK, RK, qA = entity.get_prop(LK, "m_vecAbsVelocity");

					if qA == nil then

						RK, RK, qA = entity.get_prop(LK, 'm_vecVelocity');

					end;

					if qA == nil then

						qA = entity.get_prop(LK, "m_vecVelocity[2]");

					end;

					local LK = math.abs(tonumber(qA) or 0);

					local RK = tostring(FK or "") == "visible";

					local FK = tonumber(ZK) or 0;

					local ZK = bA <= 450;

					if lA > VA.fov then

						return false, 0, "air scout fov", bA, lA, LK;

					end;

					if (tonumber(QA) or 0) < VA.acc then

						return false, 0, "air scout accuracy", bA, lA, LK;

					end;

					if (LK > VA.vz) and (not ZK) then

						return false, 0, "air scout vertical", bA, lA, LK;

					end;

					if ((tonumber(yA) or 0) < VA.seen) or ((tonumber(jA) or 0) < VA.seen) then

						return false, 0, "air scout cross guard", bA, lA, LK;

					end;

					if (not RK) and (FK <= 0) then

						return false, 0, "air scout no damage", bA, lA, LK;

					end;

					local yA, jA = NK("scout", bA, FK, IK, VA);

					if not yA then

						return false, 0, 'air scout damage < ' .. tostring(jA), bA, lA, LK;

					end;

					local IK = VA.hc;

					if FK >= 60 then

						IK = IK - 4;

					end;

					if RK and ZK then

						IK = IK + 2;

					end;

					if (tonumber(QA) or 0) < (VA.acc + 0.1) then

						IK = IK + 5;

					end;

					return true, math.max(20, math.min(55, math.floor(IK + 0.5))), ((bA > 1400) and 'air scout very long') or ((bA > 900) and "air scout long") or ((bA > 450) and "air scout medium") or 'air scout close', bA, lA, LK;

				end;

				local function LK(RK)

					if entity.get_local_player == nil then

						return false, "no threat", 0, 0;

					end;

					local IK, FK = pcall(entity.get_local_player);

					if (not IK) or (FK == nil) or (not entity.is_alive(FK)) or (not entity.is_enemy(FK)) then

						return false, "no target", 0, 0;

					end;

					if entity.is_dormant(FK) then

						return false, "dormant", FK, 0;

					end;

					local IK, ZK, yA = rK(RK);

					if IK == nil then

						return false, 'no eye', FK, 0;

					end;

					local rK = {

						0,

						3,

						4,

						5

					};

					for jA = 1, # rK do

						local QA, bA, lA = entity.hitbox_position(FK, rK[jA]);

						if QA ~= nil then

							local rK = j[85](QA, bA, lA) == true;

							local jA, VA, qA = pcall(client.trace_line, RK, IK, ZK, yA, QA, bA, lA, false);

							if jA and (VA == FK) and ((tonumber(qA) or 0) > 0) then

								return true, (rK and 'visible') or 'damage', FK, tonumber(qA) or 0;

							end;

							if rK then

								return true, "visible", FK, 0;

							end;

						end;

					end;

					return false, "no damage", FK, 0;

				end;

				local function rK(RK, IK)

					local FK = globals.tickcount();

					local ZK = ((IK >= 2) and 4) or ((IK >= 1) and 3) or 2;

					if (FK - uK) < ZK then

						return eK, JK, KK, fK;

					end;

					uK = FK;

					eK, JK, KK, fK = LK(RK);

					return eK, JK, KK, fK;

				end;

				client.set_event_callback("aim_fire", function()

					nK = globals.tickcount();

					TK = 0;

					wK = 0;

				end);

				local function LK()

					if (V(R) ~= true) or (Z == nil) then

						yK();

						return;

					end;

					if (lK ~= nil) and (V(lK) ~= true) then

						yK();

						return;

					end;

					local uK = entity.get_local_player();

					if (uK == nil) or (not entity.is_alive(uK)) then

						yK();

						MK = nil;

						return;

					end;

					local eK = entity.get_player_weapon(uK);

					if eK == nil then

						yK();

						return;

					end;

					local JK = entity.get_prop(eK, "m_iItemDefinitionIndex") or entity.get_classname(eK) or 0;

					if not QK(eK) then

						if MK ~= JK then

							yK();

							MK = JK;

						end;

						oK, mK, BK = false, false, false;

						return;

					end;

					oK = true;

					if JK ~= MK then

						yK();

						oK = true;

						WK = 8;

						MK = JK;

						rawset(_G, 'INFINIX_FORCE_SHOT_BLOCKED', true);

						rawset(_G, 'INFINIX_FORCE_SHOT_BLOCKED_REASON', 'weapon delay');

						UK(0, 'weapon delay', 0, 0, 0, 0, {

							weapon_type = vK(eK),

							on_ground = true

						});

						return;

					end;

					local QK = entity.get_prop(uK, 'm_fFlags') or 0;

					local MK = bit.band(QK, 1) == 1;

					local QK = vK(eK);

					local vK = (not MK) and (QK == "scout");

					if (not MK) and (not vK) then

						tK();

						mK = false;

						BK = false;

						rawset(_G, 'INFINIX_FORCE_SHOT_BLOCKED', true);

						rawset(_G, "INFINIX_FORCE_SHOT_BLOCKED_REASON", 'air');

						UK(0, "air", 0, 0, 0, 0, {

							weapon_type = QK,

							on_ground = false

						});

						return;

					end;

					if WK > 0 then

						WK = WK - 1;

						tK();

						mK = false;

						BK = false;

						rawset(_G, 'INFINIX_FORCE_SHOT_BLOCKED', true);

						rawset(_G, 'INFINIX_FORCE_SHOT_BLOCKED_REASON', "weapon delay");

						UK(0, "weapon delay", 0, 0, 0, 0, {

							weapon_type = QK,

							on_ground = MK

						});

						return;

					end;

					if not cK(uK, eK) then

						tK();

						mK = false;

						BK = false;

						rawset(_G, "INFINIX_FORCE_SHOT_BLOCKED", true);

						rawset(_G, 'INFINIX_FORCE_SHOT_BLOCKED_REASON', "weapon wait");

						UK(0, 'weapon wait', 0, 0, 0, 0, {

							weapon_type = QK,

							on_ground = MK

						});

						return;

					end;

					local cK = globals.tickcount();

					local WK = tonumber(rawget(_G, "INFINIX_PERF_LEVEL")) or 0;

					local JK, KK, fK, RK = rK(uK, WK);

					if JK then

						if (TK <= 0) or (wK ~= fK) then

							TK = cK;

							wK = fK or 0;

						end;

					elseif (cK - TK) > 10 then

						TK = 0;

						wK = 0;

					end;

					local WK = ((TK > 0) and (cK - TK)) or 0;

					local rK = ((nK > 0) and (cK - nK)) or WK;

					local cK = tonumber(GK) or tonumber(V(Z)) or 50;

					local Z = entity.get_prop(uK, 'm_bIsScoped') == 1;

					if vK then

						local GK, GK, vK, vK = PK(QK, cK, 50, uK, eK, false, Z);

						local TK, wK, nK, IK, FK, ZK = false, 0, KK or "air scout", 0, 0, 0;

						if JK then

							TK, wK, nK, IK, FK, ZK = DK(uK, fK, KK, RK, WK, rK, GK);

						end;

						if TK then

							rawset(_G, 'INFINIX_FORCE_SHOT_BLOCKED', false);

							mK = true;

							BK = true;

							local DK = kK(QK, IK, RK, true, GK);

							local TK = math.min(cK, wK);

							if DK ~= nil then

								TK = math.min(cK, math.max(DK.hc or TK, TK));

								SK(DK);

							end;

							AK(TK);

							UK(fK, nK, WK, rK, TK, GK, {

								weapon_type = QK,

								on_ground = false,

								air_release = true,

								distance = IK,

								fov = FK,

								damage = RK,

								speed = vK,

								vz = ZK,

								policy = ((DK and DK.name) or 'air scout'),

								point_scale = ((DK and DK.scale) or 0),

								multipoints = ((DK and iK(DK.points)) or '-'),

								fire_policy = 'air'

							});

							xK('air', {

								weapon_type = QK,

								distance = IK,

								hc = TK,

								points = ((DK and iK(DK.points)) or "-"),

								scale = ((DK and DK.scale) or "-"),

								damage = RK,

								acc = GK,

								seen = WK,

								gap = rK,

								target = fK,

								reason = nK,

								policy = ((DK and DK.name) or 'air scout')

							});

						else

							tK();

							mK = false;

							BK = false;

							rawset(_G, 'INFINIX_FORCE_SHOT_BLOCKED', true);

							rawset(_G, "INFINIX_FORCE_SHOT_BLOCKED_REASON", nK or KK or "air scout");

							UK(fK, nK or KK or 'air scout', WK, rK, 0, GK, {

								weapon_type = QK,

								on_ground = false,

								air_release = false,

								distance = IK,

								fov = FK,

								damage = RK,

								speed = vK,

								vz = ZK

							});

							xK('blocked', {

								weapon_type = QK,

								distance = IK,

								hc = "-",

								points = '-',

								scale = "-",

								damage = RK,

								acc = GK,

								seen = WK,

								gap = rK,

								target = fK,

								reason = (nK or KK or "air scout"),

								policy = "air scout"

							});

						end;

						return;

					end;

					mK = JK and (WK >= YK) and (rK >= YK);

					local YK = JK and (WK >= 36) and (rK >= 36);

					local DK, GK = dK(uK, fK);

					local vK = kK(QK, DK, RK, false, 1);

					if not YK then

						tK();

						BK = false;

						rawset(_G, 'INFINIX_FORCE_SHOT_BLOCKED', true);

						rawset(_G, 'INFINIX_FORCE_SHOT_BLOCKED_REASON', KK or 'no delay');

						UK(fK, KK or 'no delay', WK, rK, 0, 0, {

							weapon_type = QK,

							on_ground = true,

							distance = (DK or 0),

							fov = (GK or 0),

							damage = RK

						});

						xK("blocked", {

							weapon_type = QK,

							distance = DK,

							hc = "-",

							points = "-",

							scale = "-",

							damage = RK,

							acc = 0,

							seen = WK,

							gap = rK,

							target = fK,

							reason = (KK or 'no delay'),

							policy = ((vK and vK.name) or "delay")

						});

						return;

					end;

					local YK = (WK >= 64) and (rK >= 64);

					local TK, wK = NK(QK, DK, RK, fK, nil);

					if not TK then

						tK();

						mK = false;

						BK = false;

						rawset(_G, 'INFINIX_FORCE_SHOT_BLOCKED', true);

						rawset(_G, 'INFINIX_FORCE_SHOT_BLOCKED_REASON', "damage < " .. tostring(wK));

						UK(fK, 'damage < ' .. tostring(wK), WK, rK, 0, 0, {

							weapon_type = QK,

							on_ground = true,

							distance = (DK or 0),

							fov = (GK or 0),

							damage = RK,

							fire_policy = 'damage_floor'

						});

						return;

					end;

					rawset(_G, 'INFINIX_FORCE_SHOT_BLOCKED', false);

					mK = true;

					local NK = CK[QK] or 45;

					if not YK then

						NK = math.max(NK + 8, cK - 18);

					end;

					vK = kK(QK, DK, RK, YK, 1);

					if (vK ~= nil) and (vK.hc ~= nil) then

						NK = math.max(20, math.min(NK, vK.hc));

					end;

					local CK, TK, wK, nK = PK(QK, cK, NK, uK, eK, MK, Z);

					if (CK ~= nil) and ((TK or 0) >= ((YK and 0.58) or 0.68)) then

						CK = math.min(cK, math.max(NK, CK));

						BK = true;

						if vK ~= nil then

							SK(vK);

						end;

						AK(CK);

						UK(fK, (YK and 'hard delay release') or 'soft delay release', WK, rK, CK, TK, {

							weapon_type = QK,

							on_ground = true,

							distance = (DK or 0),

							fov = (GK or 0),

							damage = RK,

							speed = nK,

							policy = ((vK and vK.name) or 'default'),

							point_scale = ((vK and vK.scale) or 0),

							multipoints = ((vK and iK(vK.points)) or '-'),

							fire_policy = ((YK and "hard") or "soft")

						});

						xK("applied", {

							weapon_type = QK,

							distance = DK,

							hc = CK,

							points = ((vK and iK(vK.points)) or "-"),

							scale = ((vK and vK.scale) or "-"),

							damage = RK,

							acc = TK,

							seen = WK,

							gap = rK,

							target = fK,

							reason = ((YK and 'hard delay release') or "soft delay release"),

							policy = ((vK and vK.name) or "default")

						});

					else

						tK();

						mK = false;

						BK = false;

						rawset(_G, 'INFINIX_FORCE_SHOT_BLOCKED', true);

						rawset(_G, 'INFINIX_FORCE_SHOT_BLOCKED_REASON', string.format("accuracy %.2f / %.3f / %.0f", TK or 0, wK or 0, nK or 0));

						UK(fK, "accuracy", WK, rK, 0, TK, {

							weapon_type = QK,

							on_ground = true,

							distance = (DK or 0),

							fov = (GK or 0),

							damage = RK,

							speed = nK,

							policy = ((vK and vK.name) or "default"),

							point_scale = ((vK and vK.scale) or 0),

							multipoints = ((vK and iK(vK.points)) or "-"),

							fire_policy = 'blocked'

						});

						xK("blocked", {

							weapon_type = QK,

							distance = DK,

							hc = 0,

							points = ((vK and iK(vK.points)) or "-"),

							scale = ((vK and vK.scale) or '-'),

							damage = RK,

							acc = TK,

							seen = WK,

							gap = rK,

							target = fK,

							reason = "accuracy",

							policy = ((vK and vK.name) or "default")

						});

					end;

				end;

				zK[# zK + 1] = function()

					LK();

					rawset(_G, "INFINIX_FORCE_SHOT_ACTIVE", oK == true);

					rawset(_G, 'INFINIX_FORCE_SHOT_READY', mK == true);

					rawset(_G, 'INFINIX_FORCE_SHOT_APPLIED', BK == true);

				end;

				o(R, function()

					if V(R) ~= true then

						yK();

					end;

					pcall(i);

				end);

				sK.force_shot = yK;

				hK.pre_config_save[# hK.pre_config_save + 1] = yK;

				pK('ragebot', "force_shot", R);

				pK('ragebot', "force_shot_key", lK);

				return R, lK, qK;

			end;

			(function()

				local R = aK.ragebot._flat;

				local Z = {

					CGlock = 'pistol',

					CWeaponP2000 = 'pistol',

					CWeaponUSP_Silencer = 'pistol',

					CWeaponP250 = "pistol",

					CWeaponFiveSeven = 'pistol',

					CWeaponTec9 = "pistol",

					CWeaponElite = 'pistol',

					CWeaponCZ75A = 'pistol',

					CDEagle = "heavy pistol",

					CWeaponRevolver = "heavy pistol",

					CWeaponMP9 = "smg",

					CWeaponMAC10 = 'smg',

					CWeaponMP7 = 'smg',

					CWeaponUMP45 = 'smg',

					CWeaponP90 = 'smg',

					CWeaponBizon = "smg",

					CWeaponMP5SD = "smg",

					CWeaponSawedoff = 'shotgun',

					CWeaponNova = "shotgun",

					CWeaponMAG7 = "shotgun",

					CWeaponXM1014 = 'shotgun',

					CWeaponGalilAR = 'rifle',

					CWeaponFamas = 'rifle',

					CAK47 = 'rifle',

					CWeaponM4A1 = 'rifle',

					CWeaponM4A1_Silencer = 'rifle',

					CWeaponAUG = 'rifle',

					CWeaponSG556 = "rifle",

					CWeaponM249 = "rifle",

					CWeaponNegev = 'rifle',

					CWeaponSSG08 = "scout",

					CWeaponAWP = 'awp',

					CWeaponG3SG1 = 'auto-sniper',

					CWeaponSCAR20 = 'auto-sniper'

				};

				local function yK()

					local QK = entity.get_local_player();

					if QK == nil then

						return nil;

					end;

					local lK = entity.get_player_weapon(QK);

					if lK == nil then

						return nil;

					end;

					return Z[entity.get_classname(lK) or ""];

				end;

				local function Z(QK)

					local lK, qK, cK = entity.get_origin(QK);

					if lK == nil then

						return nil;

					end;

					local PK, oK, mK = entity.get_prop(QK, 'm_vecViewOffset');

					return lK + (PK or 0), qK + (oK or 0), cK + (mK or 64);

				end;

				a = Q(ui.new_checkbox, 'AA', 'Fake lag', b("resolver"));

				s = Q(ui.new_checkbox, 'AA', "Fake lag", b("  a?? debug panel"));

				_ = Q(j[119], 'infinix_resolver_debug_pos', '14,190');

				p = Q(ui.new_checkbox, "AA", "Fake lag", b("  a?? resolved flag"));

				local QK = F("AA", 'Fake lag');

				local lK, qK, cK = A({

					tab = 'AA',

					group = 'Fake lag',

					uniq = b

				});

				C.name = Q(ui.new_textbox, "AA", 'Other', "  db name" .. b(''));

				C.create = Q(ui.new_button, "AA", "Other", m("create db"), function()

				end);

				C.list = Q(ui.new_listbox, 'AA', "Other", '  resolver db list' .. b(""), {

					"default"

				});

				C.load = Q(ui.new_button, 'AA', "Other", m("load"), function()

				end);

				C.export = Q(ui.new_button, "AA", "Other", m("export"), function()

				end);

				C.import = Q(ui.new_button, "AA", 'Other', m('import'), function()

				end);

				C.delete = Q(ui.new_button, 'AA', 'Other', m('delete db'), function()

				end);

				R.resolver_enable = a;

				R.resolver_debug_panel = s;

				R.resolver_panel_pos = _;

				R.resolver_chance_flag = p;

				R.rb_fix_delay_rule = QK;

				R.rb_force_shot = lK;

				R.rb_force_shot_key = qK;

				R.rb_force_shot_warning = cK;

				R.resolver_db_name = C.name;

				R.resolver_db_create = C.create;

				R.resolver_db_list = C.list;

				R.resolver_db_load = C.load;

				R.resolver_db_export = C.export;

				R.resolver_db_import = C.import;

				R.resolver_db_delete = C.delete;

				local function A()

					rawset(_G, 'INFINIX_RESOLVER_ON', V(a) == true);

					rawset(_G, "INFINIX_RESOLVER_DEBUG_ON", V(s) == true);

					rawset(_G, 'INFINIX_RESOLVER_FLAG_ON', V(p) == true);

				end;

				A();

				o(a, function()

					A();

					if (rawget(_G, 'INFINIX_RESOLVER_ON') ~= true) and D then

						D();

					end;

					pcall(i);

				end);

				o(s, function()

					A();

					pcall(i);

				end);

				o(p, A);

				pK('misc', "rsv_enable", a);

				pK('misc', "rsv_debug_panel", s);

				pK('misc', 'rsv_chance_flag', p);

				pK('misc', "rsv_panel_pos", _);

				local A = F('AA', "Fake lag");

				R.rb_predict_rule = A;

				do

					local A = {

						["predict_rework.lua"] = [=[-- infinix predict_rework.lua
-- Standalone hybrid prediction manager for GameSense Lua.
--
-- Integration intent:
--   * prediction owns position trust only, never resolver angles;
--   * ragebot settings are not touched;
--   * disabling prediction only clears prediction state.
--
-- Minimal future integration points in infinix_recode_new_fixed.lua:
--   1) call infinix_predict_rework.install_ui({...}) inside the ragebot UI block;
--   2) call infinix_predict_rework.on_net_update_end() from net_update_end;
--   3) replace simple extrapolate(...) safe-head checks with predict_eye(...);
--   4) inside resolver, read get_resolver_context(...) only as positional context.

local infinix_predict_rework = (function()
    local M = {}

    local DEFAULTS = {
        enabled = false,
        debug = false,
        use_accel = true,
        use_gravity = true,
        allow_untrusted_safe_head = false,
        max_normal_ticks = 8,
        max_safe_ticks = 16,
        max_records = 8,
        stale_ticks = 3,
        teleport_delta = 64,
        teleport_margin = 32,
        accel_limit = 1800,
        accel_smoothing = 0.45,
        accel_air_limit = 1100,
        accel_idle_limit = 700,
        accel_outlier_scale = 1.75,
    }

    local cfg = {}
    for k, v in pairs(DEFAULTS) do cfg[k] = v end

    local refs = {}
    local PRED = {}
    local callbacks_installed = false

    local function ok_call(fn, ...)
        if type(fn) ~= \"function\" then return false end
        return pcall(fn, ...)
    end

    local function get_ui(ref, fallback)
        if ref == nil or ui == nil or ui.get == nil then return fallback end
        local ok, v = pcall(ui.get, ref)
        if not ok or v == nil then return fallback end
        return v
    end

    local function set_ui(ref, value)
        if ref == nil or ui == nil or ui.set == nil then return false end
        return pcall(ui.set, ref, value)
    end

    local function now_tick()
        if globals ~= nil and globals.tickcount ~= nil then
            local ok, v = pcall(globals.tickcount)
            if ok and v ~= nil then return v end
        end
        return 0
    end

    local function realtime()
        if globals ~= nil and globals.realtime ~= nil then
            local ok, v = pcall(globals.realtime)
            if ok and v ~= nil then return v end
        end
        return 0
    end

    local function tickinterval()
        if globals ~= nil and globals.tickinterval ~= nil then
            local ok, v = pcall(globals.tickinterval)
            if ok and v and v > 0 then return v end
        end
        return 1 / 64
    end

    local function ceil_to_ticks(seconds)
        seconds = tonumber(seconds) or 0
        if seconds <= 0 then return 0 end
        return math.ceil(seconds / tickinterval())
    end

    local function to_ticks(t)
        local ti = tickinterval()
        return math.floor(0.5 + (t or 0) / ti)
    end

    local function clamp(v, lo, hi)
        v = v or 0
        if v < lo then return lo end
        if v > hi then return hi end
        return v
    end

    local function len2(x, y)
        return math.sqrt((x or 0) * (x or 0) + (y or 0) * (y or 0))
    end

    local function len3(x, y, z)
        return math.sqrt((x or 0) * (x or 0) + (y or 0) * (y or 0) + (z or 0) * (z or 0))
    end

    local function clamp_vec3(x, y, z, lim)
        x, y, z = x or 0, y or 0, z or 0
        lim = tonumber(lim) or 0
        if lim <= 0 then return 0, 0, 0, 0 end

        local mag = len3(x, y, z)
        if mag <= lim then
            return x, y, z, mag
        end

        local k = lim / math.max(mag, 0.001)
        return x * k, y * k, z * k, lim
    end

    local function read_bool(name)
        if refs[name] ~= nil then return get_ui(refs[name], cfg[name]) == true end
        return cfg[name] == true
    end

    local function read_int(name)
        local v = refs[name] ~= nil and get_ui(refs[name], cfg[name]) or cfg[name]
        return tonumber(v) or tonumber(DEFAULTS[name]) or 0
    end

    local function read_float(name)
        local v = refs[name] ~= nil and get_ui(refs[name], cfg[name]) or cfg[name]
        return tonumber(v) or tonumber(DEFAULTS[name]) or 0
    end

    local function cvar_float(name, fallback)
        if cvar == nil or cvar[name] == nil then return fallback end
        local ok, v = pcall(function() return cvar[name]:get_float() end)
        if ok and v ~= nil then return v end
        return fallback
    end

    local function cvar_int(name, fallback)
        if cvar == nil or cvar[name] == nil then return fallback end
        local ok, v = pcall(function() return cvar[name]:get_int() end)
        if ok and v ~= nil then return v end
        return fallback
    end

    local function latency_ticks()
        if client ~= nil and client.latency ~= nil then
            local ok, latency = pcall(client.latency)
            if ok and latency and latency > 0 then
                return clamp(ceil_to_ticks(latency), 0, 16)
            end
        end
        return 0
    end

    local function interp_ticks()
        local interp = cvar_float(\"cl_interp\", 0) or 0
        local ratio = cvar_float("cl_interp_ratio", 0) or 0
        local updaterate = cvar_float(\"cl_updaterate", 0) or 0

        if updaterate <= 0 then updaterate = cvar_int(\"cl_updaterate\", 64) or 64 end
        if updaterate <= 0 then updaterate = 64 end
        local ratio_interp = ratio > 0 and (ratio / updaterate) or 0
        return clamp(ceil_to_ticks(math.max(interp, ratio_interp)), 0, 8)
    end

    local function dynamic_lookahead_ticks(st)
        local choke = st and st.choke_ticks or 0
        local lat = latency_ticks()
        local interp = interp_ticks()
        local ticks = lat + interp + choke + 1
        if st ~= nil then
            st.lookahead_latency = lat
            st.lookahead_interp = interp
            st.lookahead_choke = choke
            st.lookahead_ticks = clamp(ticks, 2, 16)
        end
        return st and st.lookahead_ticks or clamp(ticks, 2, 16)
    end

    local function is_enabled()
        return read_bool(\"enabled")
    end

    local function is_alive(idx)

        if entity == nil or idx == nil then return false end

        if entity.is_alive ~= nil then

            local ok, alive = pcall(entity.is_alive, idx)

            if ok then return alive == true end
        end

        return true
    end


    local function is_dormant(idx)
        if entity == nil or entity.is_dormant == nil or idx == nil then return false end
        local ok, dormant = pcall(entity.is_dormant, idx)

        return ok and dormant == true

    end

    local function ent_prop(idx, prop)

        if entity == nil or entity.get_prop == nil or idx == nil then return nil end
        local ok, a, b, c = pcall(entity.get_prop, idx, prop)

        if not ok then return nil end

        return a, b, c

    end

    local function ent_origin(idx)

        if entity == nil or idx == nil then return nil end
        if entity.get_origin ~= nil then

            local ok, x, y, z = pcall(entity.get_origin, idx)
            if ok and x ~= nil then return x, y, z end
        end
        local x = ent_prop(idx, \"m_vecOrigin[0]")

        local y = ent_prop(idx, \"m_vecOrigin[1]")
        local z = ent_prop(idx, "m_vecOrigin[2]")

        if x == nil then return nil end
        return x, y or 0, z or 0
    end


    local function ent_velocity(idx)

        local vx, vy, vz = ent_prop(idx, \"m_vecVelocity")
        if vx ~= nil then return vx or 0, vy or 0, vz or 0 end

        vx = ent_prop(idx, \"m_vecVelocity[0]\") or 0
        vy = ent_prop(idx, \"m_vecVelocity[1]\") or 0
        vz = ent_prop(idx, \"m_vecVelocity[2]\") or 0
        return vx, vy, vz
    end

    local function ent_view_offset(idx)
        local x, y, z = ent_prop(idx, "m_vecViewOffset\")
        if x ~= nil then return x or 0, y or 0, z or 64 end
        return 0, 0, ent_prop(idx, "m_vecViewOffset[2]") or 64
    end

    local function gravity()
        if cvar ~= nil and cvar.sv_gravity ~= nil then
            local ok, g = pcall(function() return cvar.sv_gravity:get_float() end)
            if ok and g and g > 0 then return g end
        end
        return 800
    end

    local function bound_prediction(st, cur, px, py, pz, dt)
        local dx, dy, dz = px - cur.x, py - cur.y, pz - cur.z
        local dist = len3(dx, dy, dz)
        local max_dist = math.max(16, ((cur.speed2d or 0) + math.abs(cur.vz or 0) * 0.35) * dt + read_int(\"teleport_margin\"))
        local clamped = false
        if dist > max_dist then
            local k = max_dist / math.max(dist, 0.001)
            px, py, pz = cur.x + dx * k, cur.y + dy * k, cur.z + dz * k
            dx, dy, dz = px - cur.x, py - cur.y, pz - cur.z
            dist = max_dist
            clamped = true
        end
        if client ~= nil and client.trace_line ~= nil and dist > 4 then
            local ok, fraction = pcall(client.trace_line, st.idx or -1, cur.x, cur.y, cur.z + 2, px, py, pz + 2)
            fraction = ok and tonumber(fraction) or 1
            if fraction < 0.96 then
                local k = math.max(0, fraction - 0.04)
                px, py, pz = cur.x + dx * k, cur.y + dy * k, cur.z + dz * k
                clamped = true
            end
        end
        return px, py, pz, clamped
    end

    local function make_state(idx)
        return {
            idx = idx,
            records = {},
            reliable = false,
            confidence = 0,
            reason = \"empty\",
            untrusted_until = 0,
            prediction = nil,
            prediction_reason = \"empty\",
            pred_cache = nil,
            accel_x = 0,
            accel_y = 0,
            accel_z = 0,
            accel_mag = 0,
            accel_outlier = false,
        }
    end

    local function state_for(idx)
        if idx == nil then return nil end
        if PRED[idx] == nil then PRED[idx] = make_state(idx) end
        return PRED[idx]
    end

    local function push_record(st, rec)
        local limit = read_int(\"max_records")

        if limit < 3 then limit = 3 end
        if limit > 16 then limit = 16 end



        st.pred_cache = nil



        for i = limit, 2, -1 do
            st.records[i] = st.records[i - 1]

        end
        st.records[1] = rec

        for i = limit + 1, limit + 4 do

            st.records[i] = nil
        end

    end



    local function read_record(idx)
        if idx == nil or not is_alive(idx) or is_dormant(idx) then return nil end



        local ox, oy, oz = ent_origin(idx)

        if ox == nil then return nil end


        local vx, vy, vz = ent_velocity(idx)
        local vo_x, vo_y, vo_z = ent_view_offset(idx)

        local flags = ent_prop(idx, \"m_fFlags\") or 0
        local simtime = ent_prop(idx, "m_flSimulationTime\") or 0

        return {
            tick = now_tick(),
            rt = realtime(),
            simtime = simtime,
            simtick = to_ticks(simtime),
            x = ox, y = oy, z = oz,
            eye_x = ox + vo_x,
            eye_y = oy + vo_y,
            eye_z = oz + vo_z,
            vo_x = vo_x, vo_y = vo_y, vo_z = vo_z,
            vx = vx or 0, vy = vy or 0, vz = vz or 0,
            flags = flags,
            on_ground = bit ~= nil and bit.band ~= nil and bit.band(flags, 1) == 1,
            speed2d = len2(vx, vy),
        }
    end

    local function analyze_state(st)
        local cur = st.records[1]
        local prev = st.records[2]
        if cur == nil then
            st.reliable = false
            st.confidence = 0
            st.reason = \"empty"
            return
        end


        if prev == nil then

            st.reliable = true
            st.confidence = 0.45

            st.reason = \"warmup\"
            return
        end

        local ti = tickinterval()
        local sim_dticks = cur.simtick - prev.simtick
        local wall_dticks = cur.tick - prev.tick
        local dt = math.max(ti, math.abs(sim_dticks) * ti)

        local dx, dy, dz = cur.x - prev.x, cur.y - prev.y, cur.z - prev.z
        local dist2d = len2(dx, dy)
        local dist3d = len3(dx, dy, dz)
        local expected = math.max(cur.speed2d, prev.speed2d) * dt + read_int("teleport_margin\")

        st.sim_dticks = sim_dticks
        st.wall_dticks = wall_dticks
        st.dist2d = dist2d
        st.dist3d = dist3d
        st.choke_ticks = sim_dticks > 1 and (sim_dticks - 1) or 0
        st.teleport = dist3d > read_int("teleport_delta") and dist3d > expected
        st.break_lc = dist2d > 64
        st.sim_rewind = sim_dticks < 0
        st.stale = sim_dticks == 0 and wall_dticks >= read_int(\"stale_ticks")



        if st.sim_rewind then

            st.reliable = false

            st.confidence = 0.05

            st.reason = \"sim_rewind\"
            st.untrusted_until = now_tick() + 8
        elseif st.teleport then
            st.reliable = false
            st.confidence = 0.10
            st.reason = "teleport\"
            st.untrusted_until = now_tick() + 8
        elseif st.break_lc then
            st.reliable = false
            st.confidence = 0.20
            st.reason = "break_lc\"
            st.untrusted_until = now_tick() + 6
        elseif st.stale then
            st.reliable = false
            st.confidence = 0.30
            st.reason = \"stale_sim\"
            st.untrusted_until = now_tick() + 3
        else
            local conf = 0.72
            if st.choke_ticks > 0 then conf = conf - math.min(0.25, st.choke_ticks * 0.04) end
            if cur.speed2d < 5 then conf = conf + 0.08 end
            if #st.records >= 4 then conf = conf + 0.08 end
            st.reliable = true
            st.confidence = clamp(conf, 0.35, 0.90)
            st.reason = st.choke_ticks > 0 and "choked\" or \"ok\"
        end
    end

    local function sample_one(idx)
        local rec = read_record(idx)
        if rec == nil then return nil end
        local st = state_for(idx)
        push_record(st, rec)
        analyze_state(st)
        return st
    end

    local function velocity_from_history(st)
        local cur = st.records[1]
        local prev = st.records[2]
        if cur == nil then return 0, 0, 0, 0 end
        if prev == nil then return cur.vx, cur.vy, cur.vz, 0.45 end

        local ti = tickinterval()
        local dticks = cur.simtick - prev.simtick
        if dticks <= 0 or dticks > 16 or st.teleport or st.sim_rewind then
            return cur.vx, cur.vy, cur.vz, 0.45
        end

        local dt = math.max(ti, dticks * ti)
        local hvx = (cur.x - prev.x) / dt
        local hvy = (cur.y - prev.y) / dt
        local hvz = (cur.z - prev.z) / dt
        local diff = len3(cur.vx - hvx, cur.vy - hvy, cur.vz - hvz)

        if diff > 300 then
            return hvx, hvy, hvz, 0.55
        end

        return cur.vx * 0.65 + hvx * 0.35,
               cur.vy * 0.65 + hvy * 0.35,
               cur.vz * 0.65 + hvz * 0.35,
               0.75
    end

    local function acceleration_from_history(st)
        if not read_bool(\"use_accel\") then return 0, 0, 0 end
        if st.teleport or st.sim_rewind or st.stale then return 0, 0, 0 end

        local a = st.records[1]
        local b = st.records[2]
        local c = st.records[3]
        if a == nil or b == nil or c == nil then return 0, 0, 0 end

        local ti = tickinterval()
        local dt1 = a.simtick - b.simtick
        local dt2 = b.simtick - c.simtick
        if dt1 <= 0 or dt2 <= 0 or dt1 > 4 or dt2 > 4 then return 0, 0, 0 end
        if st.choke_ticks and st.choke_ticks > 1 then return 0, 0, 0 end
        if len3(a.x - b.x, a.y - b.y, a.z - b.z) > read_int(\"teleport_delta\") then return 0, 0, 0 end

        local vx1 = (a.x - b.x) / math.max(ti, dt1 * ti)
        local vy1 = (a.y - b.y) / math.max(ti, dt1 * ti)
        local vz1 = (a.z - b.z) / math.max(ti, dt1 * ti)
        local vx0 = (b.x - c.x) / math.max(ti, dt2 * ti)
        local vy0 = (b.y - c.y) / math.max(ti, dt2 * ti)
        local vz0 = (b.z - c.z) / math.max(ti, dt2 * ti)

        local ax = (vx1 - vx0) / math.max(ti, dt1 * ti)
        local ay = (vy1 - vy0) / math.max(ti, dt1 * ti)
        local az = (vz1 - vz0) / math.max(ti, dt1 * ti)
        local lim = read_float("accel_limit")
        if not a.on_ground then
            lim = math.min(lim, read_float(\"accel_air_limit"))

        elseif a.speed2d < 5 and b.speed2d < 5 then

            lim = math.min(lim, read_float("accel_idle_limit\"))
        end

        local raw_mag = len3(ax, ay, az)
        if raw_mag > lim * read_float("accel_outlier_scale\") then
            st.accel_x, st.accel_y, st.accel_z = 0, 0, 0
            st.accel_mag = 0
            st.accel_outlier = true
            return 0, 0, 0
        end

        local mag
        ax, ay, az, mag = clamp_vec3(ax, ay, az, lim)

        local smooth = clamp(read_float(\"accel_smoothing\"), 0, 0.95)
        if smooth > 0 and st.accel_mag and st.accel_mag > 0 then
            ax = st.accel_x * smooth + ax * (1 - smooth)
            ay = st.accel_y * smooth + ay * (1 - smooth)
            az = st.accel_z * smooth + az * (1 - smooth)
            ax, ay, az, mag = clamp_vec3(ax, ay, az, lim)
        end

        st.accel_x, st.accel_y, st.accel_z = ax, ay, az
        st.accel_mag = mag or len3(ax, ay, az)
        st.accel_outlier = false

        return ax, ay, az
    end

    local function build_prediction(st, ticks, opts)
        opts = opts or {}
        local cur = st and st.records and st.records[1]
        if cur == nil then return nil, "empty\" end

        local purpose = opts.purpose or \"normal"
        local max_ticks = opts.max_ticks
        if max_ticks == nil then

            max_ticks = purpose == \"safe_head\" and read_int(\"max_safe_ticks\") or read_int(\"max_normal_ticks\")
        end
        max_ticks = clamp(max_ticks, 1, 32)
        ticks = clamp(tonumber(ticks) or 0, 0, max_ticks)

        local allow_untrusted = opts.allow_untrusted == true
        if purpose == \"safe_head\" and read_bool(\"allow_untrusted_safe_head") then

            allow_untrusted = true
        end


        local accel_enabled = read_bool(\"use_accel\")
        local gravity_enabled = read_bool("use_gravity\")
        local cache_key = tostring(cur.tick) .. \":" .. tostring(cur.simtick) .. ":\" .. tostring(ticks) .. \":" ..

            tostring(purpose) .. ":\" .. tostring(max_ticks) .. \":\" .. tostring(allow_untrusted) .. \":\" ..
            tostring(accel_enabled) .. ":\" .. tostring(gravity_enabled)

        if st.pred_cache ~= nil and st.pred_cache.key == cache_key then
            return st.pred_cache.pred, st.pred_cache.reason
        end

        if not st.reliable and not allow_untrusted then
            local reason = st.reason or \"untrusted\"
            st.pred_cache = { key = cache_key, pred = nil, reason = reason }
            return nil, reason
        end

        local ti = tickinterval()
        local dt = ticks * ti
        local vx, vy, vz, vconf = velocity_from_history(st)
        local ax, ay, az = acceleration_from_history(st)

        local px = cur.x + vx * dt + 0.5 * ax * dt * dt
        local py = cur.y + vy * dt + 0.5 * ay * dt * dt
        local pz = cur.z + vz * dt + 0.5 * az * dt * dt

        if gravity_enabled and not cur.on_ground then
            pz = pz - 0.5 * gravity() * dt * dt
        elseif cur.on_ground and math.abs(vz) < 75 then
            pz = cur.z
        end

        local collision_clamped = false
        px, py, pz, collision_clamped = bound_prediction(st, cur, px, py, pz, dt)

        local conf = (st.confidence or 0.35) * (vconf or 0.5)
        if ticks > 4 then conf = conf - (ticks - 4) * 0.025 end
        if st.choke_ticks and st.choke_ticks > 0 then conf = conf - st.choke_ticks * 0.025 end
        local accel_mag = len3(ax, ay, az)
        if accel_mag > 0 then
            local accel_ratio = accel_mag / math.max(read_float("accel_limit"), 1)
            conf = conf - math.min(0.16, accel_ratio * 0.10)
        end
        if st.accel_outlier then conf = math.min(conf, 0.30) end
        if collision_clamped then conf = math.min(conf, 0.36) end
        if not cur.on_ground and ticks > 3 then conf = conf - 0.04 end
        if not st.reliable then conf = math.min(conf, 0.25) end
        conf = clamp(conf, 0.05, 0.92)

        local result = {
            idx = st.idx,
            tick = now_tick(),
            ticks = ticks,
            dt = dt,
            x = px, y = py, z = pz,
            eye_x = px + cur.vo_x,
            eye_y = py + cur.vo_y,
            eye_z = pz + cur.vo_z,
            vx = vx, vy = vy, vz = vz,
            ax = ax, ay = ay, az = az,
            accel_mag = accel_mag,
            velocity_confidence = vconf,
            confidence = conf,
            reliable = st.reliable == true,
            reason = st.reason,
            untrusted = not st.reliable,
            break_lc = st.break_lc == true,
            teleport = st.teleport == true,
            collision_clamped = collision_clamped == true,
            stale = st.stale == true,
            choke_ticks = st.choke_ticks or 0,
        }

        st.pred_cache = { key = cache_key, pred = result, reason = "ok" }
        return result
    end

    local function update_prediction_signal(idx, st)
        if st == nil or st.records == nil then return end
        local lookahead = dynamic_lookahead_ticks(st)
        local pred, reason = build_prediction(st, lookahead, {
            purpose = \"auto\",
            max_ticks = lookahead,
            allow_untrusted = false
        })
        st.prediction = pred
        st.prediction_reason = pred ~= nil and "ok\" or (reason or st.reason or \"untrusted\")
    end

    function M.configure(opts)
        if type(opts) ~= "table\" then return end
        for k, v in pairs(opts) do
            if cfg[k] ~= nil then cfg[k] = v end
        end
    end

    function M.is_enabled()
        return is_enabled()
    end

    function M.sample(idx)
        if not is_enabled() then return nil end
        return sample_one(idx)
    end

    function M.sample_all(enemies_only, max_count, preferred)
        if not is_enabled() then return end
        if entity == nil or entity.get_players == nil then return end
        local cache_fn = rawget(_G, 'INFINIX_GET_ENEMY_CACHE')
        local players, count
        if enemies_only ~= false and type(cache_fn) == \"function\" then
            players, count = cache_fn()
        else
            local ok
            ok, players = pcall(entity.get_players, enemies_only ~= false)
            count = ok and type(players) == "table" and #players or 0
        end
        if type(players) ~= "table\" then return end
        local sampled = 0
        local limit = tonumber(max_count) or count
        if preferred ~= nil then
            local st = sample_one(preferred)
            update_prediction_signal(preferred, st)
            sampled = sampled + 1
        end
        for i = 1, count do
            local idx = players[i]
            if sampled >= limit then break end
            if idx ~= preferred then
                local st = sample_one(idx)
                update_prediction_signal(idx, st)
                sampled = sampled + 1
            end
        end
    end

    function M.get_state(idx)
        return PRED[idx]
    end

    function M.predict_origin(idx, ticks, opts)
        if not is_enabled() then return nil, \"disabled\" end
        local st = PRED[idx] or sample_one(idx)
        if st == nil then return nil, \"no_state\" end
        return build_prediction(st, ticks, opts)
    end

    function M.predict_eye(idx, ticks, opts)
        local pred, reason = M.predict_origin(idx, ticks, opts)
        if pred == nil then return nil, reason end
        return pred.eye_x, pred.eye_y, pred.eye_z, pred
    end

    function M.get_resolver_context(idx, ps, ctx)
        if not is_enabled() then
            return {
                active = false,
                reason = "disabled",
            }
        end

        local st = PRED[idx] or sample_one(idx)
        if st == nil then
            return {
                active = false,
                reason = "no_state\",
            }
        end

        ctx = ctx or {}
        local dt_active = ctx.dt_active == true
        local dt_phase = ctx.dt_phase or "idle\"
        local now = now_tick()

        local shifted = dt_active and dt_phase == "shifted"
        local pred = st.prediction
        local pred_conf = pred ~= nil and pred.confidence or st.confidence or 0
        local low_conf = pred_conf < 0.30
        local untrusted = (not st.reliable) or shifted or low_conf or now < (st.untrusted_until or 0)

        local result = {
            active = true,
            reason = shifted and "dt_shift" or (low_conf and \"low_conf\" or st.reason),
            confidence = pred_conf,
            reliable = st.reliable == true and not shifted and not low_conf,
            untrusted = untrusted,
            prediction = pred,
            prediction_reason = st.prediction_reason,
            lookahead_ticks = st.lookahead_ticks or dynamic_lookahead_ticks(st),
            choke_ticks = st.choke_ticks or 0,
            break_lc = st.break_lc == true,
            teleport = st.teleport == true,
            stale = st.stale == true,
            accel_mag = st.accel_mag or 0,
            accel_outlier = st.accel_outlier == true,
            pred_eye_x = pred and pred.eye_x or nil,
            pred_eye_y = pred and pred.eye_y or nil,
            pred_eye_z = pred and pred.eye_z or nil,
        }

        if type(ps) == \"table" then
            ps.pred = result

        end



        return result

    end

    function M.on_net_update_end(max_count, preferred)

        M.sample_all(true, max_count, preferred)

    end


    function M.on_round_reset()

        M.reset_all(false)
    end


    function M.reset_player(idx, hard)

        PRED[idx] = nil

    end



    function M.reset_all(hard)
        local ids = {}

        for idx, _ in pairs(PRED) do
            ids[#ids + 1] = idx

        end

        for _, idx in ipairs(ids) do
            M.reset_player(idx, hard == true)

        end

        PRED = {}

    end


    function M.set_enabled(value)

        cfg.enabled = value == true

        set_ui(refs.enabled, cfg.enabled)
        if not cfg.enabled then M.reset_all(false) end

    end


    function M.disable(resolver_enabled)
        cfg.enabled = false
        set_ui(refs.enabled, false)

        M.reset_all(resolver_enabled == true and false or true)

    end

    function M.install_callbacks()
        if callbacks_installed or client == nil or client.set_event_callback == nil then return false end

        callbacks_installed = true

        client.set_event_callback("net_update_end\", M.on_net_update_end)
        client.set_event_callback(\"round_start\", M.on_round_reset)
        client.set_event_callback(\"game_newmap\", M.on_round_reset)
        client.set_event_callback("cs_game_disconnected\", M.on_round_reset)
        return true
    end

    function M.install_ui(env)
        env = env or {}
        if ui == nil then return false end

        local tab = env.TAB or env.tab or "RAGE"
        local group = env.GRP or env.group or \"Other\"
        local section = env.section or env.sec or "ragebot\"
        local uniq = env.uniq or function(s) return s or \"\" end
        local safe_new = env.safe_new or function(ctor, ...)
            if type(ctor) ~= \"function\" then return nil end
            local ok, ref = pcall(ctor, ...)
            if ok then return ref end
            return nil
        end
        local vis = env.vis or function(ref, state)
            if ui and ui.set_visible and ref ~= nil then pcall(ui.set_visible, ref, state == true) end
        end
        local set_cb = env.set_cb or function(ref, cb)
            if ui and ui.set_callback and ref ~= nil then pcall(ui.set_callback, ref, cb) end
        end
        local apply_visibility = env.apply_visibility or function() end
        local cfg_register = env.cfg_register
        local vis_hooks = env.vis_hooks
        local slot = env.SLOT

        refs.enabled = safe_new(ui.new_checkbox, tab, group, "interpolate improve" .. uniq("\"))

        if refs.enabled == nil then return false end

        local function pred_vis(sec)
            local active = sec == nil or sec == section
            vis(refs.enabled, active)
        end

        set_cb(refs.enabled, function()
            if get_ui(refs.enabled, false) ~= true then M.reset_all(false) end
            pred_vis(section)
            ok_call(apply_visibility)
        end)

        if type(vis_hooks) == \"table" then
            vis_hooks[#vis_hooks + 1] = pred_vis

        end

        if type(cfg_register) == \"function" then

            cfg_register(\"ragebot", \"pred_enabled\", refs.enabled)
        end

        if type(slot) == "table\" then
            slot.pred_enabled = refs.enabled
        end

        pred_vis(section)
        return true
    end

    function M.debug_lines(idx)
        local st = idx and PRED[idx] or nil
        if st == nil then return { \"pred: no state" } end

        return {
            string.format(\"pred: %s conf=%.2f", st.reason or \"?\", st.confidence or 0),
            string.format(\"reliable=%s result=%s", tostring(st.reliable), tostring(st.prediction_reason or \"?\")),
            string.format("lookahead=%dt l=%d i=%d c=%d\", st.lookahead_ticks or 0, st.lookahead_latency or 0, st.lookahead_interp or 0, st.lookahead_choke or 0),
            string.format("accel=%.0f outlier=%s", st.accel_mag or 0, tostring(st.accel_outlier == true)),
        }
    end

    function M.version()
        return \"predict_rework/1.0\"
    end

    return M
end)()

_G.infinix_predict_rework = infinix_predict_rework

if not _G.INFINIX_PREDICT_REWORK_NO_BOOT then
    local function pred_boot_standalone()
        if ui == nil or ui.new_checkbox == nil then return false end
        local ok = infinix_predict_rework.install_ui({ tab = \"LUA\", group = "B\", section = "lua\" })
        if not ok then
            ok = infinix_predict_rework.install_ui({ tab = \"LUA\", group = \"A\", section = \"lua" })
        end

        infinix_predict_rework.install_callbacks()

        return ok == true
    end

    local ok_boot, booted = pcall(pred_boot_standalone)

    if client ~= nil and client.color_log ~= nil then

        if ok_boot and booted then

            pcall(client.color_log, 120, 255, 120, "[infinix] predict rework loaded")

        elseif ok_boot then

            pcall(client.color_log, 255, 180, 80, \"[infinix] predict rework loaded without UI\")
        else
            pcall(client.color_log, 255, 120, 90, \"[infinix] predict rework boot failed\")
        end
    end
end


]=],

						["aimtools.lua"] = [==[-- aimtools.lua
-- Smart body/head decision layer for GameSense ragebot.

local TAG = \"[head aim fix]\"
local INFINIX_EMBED = rawget(_G, \"INFINIX_AIMTOOLS_EMBED\")
local TAB = INFINIX_EMBED and (INFINIX_EMBED.TAB or INFINIX_EMBED.tab) or \"LUA"

local CONTAINER = INFINIX_EMBED and (INFINIX_EMBED.GRP or INFINIX_EMBED.group) or "B"

local unpack = unpack or table.unpack

local get_enemy_cache = INFINIX_EMBED and INFINIX_EMBED.get_enemy_cache or rawget(_G, 'INFINIX_GET_ENEMY_CACHE')
local rage_decision = INFINIX_EMBED and INFINIX_EMBED.rage_decision or nil
if rage_decision == nil then

    local root = rawget(_G, \"INFINIX\")
    rage_decision = type(root) == \"table" and root.rage_decision or nil

end



local function safe_ui_new(ctor, ...)
    if INFINIX_EMBED and type(INFINIX_EMBED.safe_new) == \"function\" then
        return INFINIX_EMBED.safe_new(ctor, ...)
    end

    local ok, ref = pcall(ctor, ...)
    if ok then
        return ref
    end

    pcall(client.color_log, 255, 120, 90, TAG .. " ui init failed: \" .. tostring(ref))
    return nil
end

local function ui_get(ref, fallback)
    if ref == nil then
        return fallback
    end

    local ok, value = pcall(ui.get, ref)
    if ok then
        return value
    end

    return fallback
end

local function ui_set(ref, ...)
    if ref ~= nil then
        pcall(ui.set, ref, ...)
    end
end

local function ui_vis(ref, state)
    if INFINIX_EMBED and type(INFINIX_EMBED.vis) == "function\" then
        INFINIX_EMBED.vis(ref, state == true)
        return
    end

    if ref ~= nil then
        pcall(ui.set_visible, ref, state == true)
    end
end

local menu = {
    enabled = safe_ui_new(ui.new_checkbox, TAB, CONTAINER, \"head aim fix\")
}

local section_visible = true
local function embed_register_menu()
    if not INFINIX_EMBED then return end
    local slot = INFINIX_EMBED.SLOT
    local cfg_register = INFINIX_EMBED.cfg_register
    if type(slot) == "table\" then
        for name, ref in pairs(menu) do
            if ref ~= nil then slot["aimtools_\" .. tostring(name)] = ref end
        end
    end
    if type(cfg_register) == "function\" then
        for name, ref in pairs(menu) do
            if ref ~= nil then cfg_register(\"ragebot\", \"aimtools_\" .. tostring(name), ref) end
        end
    end
    for _, ref in pairs(menu) do ui_vis(ref, false) end
end

local function aim_set_callback(ref, cb)
    if INFINIX_EMBED and type(INFINIX_EMBED.set_cb) == \"function\" then
        INFINIX_EMBED.set_cb(ref, cb)
    elseif ref ~= nil and cb ~= nil then
        pcall(ui.set_callback, ref, cb)
    end
end

local function aim_event(name, fn)
    if INFINIX_EMBED and name == "setup_command\" and type(INFINIX_EMBED.on_cmd_hooks) == \"table\" then
        INFINIX_EMBED.on_cmd_hooks[#INFINIX_EMBED.on_cmd_hooks + 1] = fn
        return
    end
    if INFINIX_EMBED and name == \"shutdown\" and type(INFINIX_EMBED.shutdown_hooks) == \"table\" then
        INFINIX_EMBED.shutdown_hooks.aimtools = fn
        return
    end
    pcall(client.set_event_callback, name, fn)
end

embed_register_menu()

local weapon_names = {
    CWeaponSSG08 = "ssg-08\",
    CWeaponRevolver = "r8\"
}

local auto_profile = {
    weapons = {
        ["ssg-08"] = true,
        r8 = true
    },
    point_scale = 4,
    update_ticks = 2
}

local body_hitboxes = { 2, 3, 4, 5, 6 }
local head_hitboxes = { 0 }

local hitbox_names = {
    [0] = \"head\",
    [2] = "pelvis\",
    [3] = \"stomach\",
    [4] = "lower chest\",
    [5] = \"chest\",
    [6] = \"upper chest\"
}

local backup = {}
local owned = {}
local last_reason = {}
local miss_count = {}
local miss_tick = {}
local scan_state = {}
local last_info = {}
local active_target = nil
local active_until = 0
local shot_lock_until = 0
local last_tick = 0
local player_list_update_tick = 0
local was_active = false
local mode_guard = false
local active_mode = \"auto"

local nil_backup = {}
local scan_points = {}
local seen_players = {}

local candidates_buf = {}
local scan_targets_buf = {}

local stale_buf = {}

local stale_info_buf = {}

local AIMTOOLS_TRACE_BUDGET = 36

local AIMTOOLS_TRACE_BUDGET_BUSY = 24

local AIMTOOLS_MAX_TARGETS = 2
local aimtools_trace_budget = 0


local function ms_has(ref, name)
    local values = ui_get(ref, {})
    name = tostring(name or ""):lower()

    if type(values) ~= \"table\" then
        return tostring(values or "\"):lower() == name
    end

    for i = 1, #values do
        if tostring(values[i] or \""):lower() == name then

            return true
        end

    end

    return false
end

local function read_mode()

    local has_auto = ms_has(menu.mode, \"auto\")
    local has_manual = ms_has(menu.mode, \"manual\")

    if has_auto and has_manual then
        return active_mode == \"auto\" and "manual\" or "auto\"
    end

    if has_manual then
        return "manual\"
    end

    return \"auto\"
end

local function update_visibility()
    local active_root = (not INFINIX_EMBED) or section_visible
    ui_vis(menu.enabled, active_root)
end

local function sync_mode()
    if mode_guard then
        return
    end

    active_mode = read_mode()
    mode_guard = true
    ui_set(menu.mode, active_mode)
    mode_guard = false
    update_visibility()
end

local function log_debug(text)
end

local function safe_plist_get(player, key)
    if plist == nil or type(plist.get) ~= "function\" then
        return nil
    end

    local ok, value = pcall(plist.get, player, key)
    if ok then
        return value
    end

    return nil
end

local function safe_plist_set(player, key, value)
    if plist == nil or type(plist.set) ~= \"function" then
        return false

    end



    return pcall(plist.set, player, key, value)
end

local function backup_key(player, key)
    backup[player] = backup[player] or {}


    if backup[player][key] == nil then

        local value = safe_plist_get(player, key)

        backup[player][key] = value == nil and nil_backup or value
    end

end


local function override_key(player, key, value)
    if rage_decision ~= nil and type(rage_decision.request) == "function" then

        rage_decision.request(player, "aimtools", key, value, 70, \"aimtools")

        owned[player] = true

        return

    end
    backup_key(player, key)
    safe_plist_set(player, key, value)
end


local function restore_key(player, key)
    if rage_decision ~= nil and type(rage_decision.clear_key) == \"function" then

        rage_decision.clear_key(player, key, \"aimtools")
        return
    end

    local player_backup = backup[player]

    if player_backup == nil or player_backup[key] == nil then
        return
    end


    local value = player_backup[key]

    safe_plist_set(player, key, value == nil_backup and \"-\" or value)
    player_backup[key] = nil

    if next(player_backup) == nil then
        backup[player] = nil
        last_reason[player] = nil
    end
end

local function clear_target(player)
    restore_key(player, "Override prefer body aim\")
    restore_key(player, \"Override safe point\")
    restore_key(player, \"Minimum damage")
    owned[player] = nil

    last_reason[player] = nil
    scan_state[player] = nil

    last_info[player] = nil

end



local function clear_all()

    local players = {}


    for player in pairs(backup) do
        players[#players + 1] = player
    end
    for player in pairs(owned) do
        players[#players + 1] = player
    end



    for i = 1, #players do

        clear_target(players[i])

    end


    active_target = nil

    active_until = 0
end



local function hard_clear_current_players()
    pcall(client.update_player_list)


    local enemies, enemy_count

    if type(get_enemy_cache) == \"function" then

        enemies, enemy_count = get_enemy_cache(true)
    else

        enemies = entity.get_players(true) or {}

        enemy_count = #enemies

    end
    for i = 1, enemy_count do
        local player = enemies[i]

        if player ~= nil then
            if rage_decision ~= nil and type(rage_decision.clear_key) == "function\" then
                rage_decision.clear_key(player, \"Override prefer body aim\", \"aimtools\")
                rage_decision.clear_key(player, \"Override safe point", \"aimtools\")
                rage_decision.clear_key(player, \"Minimum damage\", \"aimtools\")
            else
                safe_plist_set(player, "Override prefer body aim\", \"-\")
                safe_plist_set(player, \"Override safe point\", "-")
                safe_plist_set(player, "Minimum damage", 0)
            end
        end
    end

    backup = {}
    owned = {}
    last_reason = {}
    scan_state = {}
    last_info = {}
    active_target = nil
    active_until = 0
end

local function get_eye_position(player)
    local ok, x, y, z = pcall(client.eye_position)
    if ok and x ~= nil then
        return x, y, z
    end

    local ox, oy, oz = entity.get_origin(player)
    if ox == nil then
        return nil
    end

    local _, _, vz = entity.get_prop(player, \"m_vecViewOffset\")
    return ox, oy, oz + (vz or 64)
end

local function angle_forward(pitch, yaw)
    local p = math.rad(pitch or 0)
    local y = math.rad(yaw or 0)
    local cp = math.cos(p)

    return math.cos(y) * cp, math.sin(y) * cp, -math.sin(p)
end

local function is_weapon_ready(local_player)
    local weapon = entity.get_player_weapon(local_player)
    if weapon == nil then
        return false
    end

    local clip = entity.get_prop(weapon, "m_iClip1")
    if clip ~= nil and clip <= 0 then
        return false
    end

    local curtime = globals.curtime()
    local next_attack = entity.get_prop(weapon, "m_flNextPrimaryAttack\") or 0
    local player_next = entity.get_prop(local_player, "m_flNextAttack") or 0

    return next_attack <= curtime and player_next <= curtime
end

local function peek_sheltered(local_player, sx, sy, sz)
    local pitch, yaw = client.camera_angles()
    local fx, fy, fz = angle_forward(pitch, yaw)
    local ok, fraction = pcall(client.trace_line, local_player, sx, sy, sz, sx + fx * 64, sy + fy * 64, sz + fz * 64)

    if not ok then
        return false
    end

    return (tonumber(fraction) or 1) < 0.70
end

local function add_point(points, count, x, y, z)
    if x ~= nil and y ~= nil and z ~= nil then
        count = count + 1
        local point = points[count]
        if point == nil then
            point = {}
            points[count] = point
        end
        point.x, point.y, point.z = x, y, z
    end
    return count
end

local function collect_points(points, sx, sy, target, hitbox, scale, ox, oy)
    local count = 0
    local cx, cy, cz = entity.hitbox_position(target, hitbox)
    if cx == nil then
        return 0
    end

    count = add_point(points, count, cx, cy, cz)

    if scale <= 0 then
        return count
    end

    local dx = (ox or cx) - sx
    local dy = (oy or cy) - sy
    local len = math.sqrt(dx * dx + dy * dy)

    if len > 0.1 then
        local nx = -dy / len
        local ny = dx / len
        count = add_point(points, count, cx + nx * scale, cy + ny * scale, cz)
        count = add_point(points, count, cx - nx * scale, cy - ny * scale, cz)

        if hitbox == 0 then
            count = add_point(points, count, cx + nx * (scale * 0.55), cy + ny * (scale * 0.55), cz + scale * 0.45)
            count = add_point(points, count, cx - nx * (scale * 0.55), cy - ny * (scale * 0.55), cz + scale * 0.45)
        else
            count = add_point(points, count, cx, cy, cz + scale * 0.35)
            count = add_point(points, count, cx, cy, cz - scale * 0.35)
        end
    end

    return count
end

local function trace_point(local_player, sx, sy, sz, target, point)
    if aimtools_trace_budget <= 0 then
        return 0
    end
    aimtools_trace_budget = aimtools_trace_budget - 1

    local ok, hit_entity, damage = pcall(
        client.trace_bullet,
        local_player,
        sx,
        sy,
        sz,
        point.x,
        point.y,
        point.z,
        false
    )

    if not ok then
        return 0
    end

    damage = tonumber(damage) or 0

    if hit_entity ~= target then
        return 0
    end

    return damage
end

local function scan_damage(local_player, sx, sy, sz, target, hitboxes, scale, max_damage, ox, oy)
    local best_damage, best_hitbox, traces, hits = 0, nil, 0, 0

    for i = 1, #hitboxes do
        if aimtools_trace_budget <= 0 then break end
        local hitbox = hitboxes[i]
        local point_count = collect_points(scan_points, sx, sy, target, hitbox, scale, ox, oy)

        for j = 1, point_count do
            if aimtools_trace_budget <= 0 then break end
            traces = traces + 1

            local damage = trace_point(local_player, sx, sy, sz, target, scan_points[j])

            if max_damage ~= nil and damage > max_damage then
                damage = 0
            end

            if damage > 0 then
                hits = hits + 1
            end

            if damage > best_damage then
                best_damage = damage
                best_hitbox = hitbox
            end
        end
    end

    return best_damage, best_hitbox, traces, hits
end

local function trace_visible(local_player, sx, sy, sz, target, hitbox)
    local hx, hy, hz = entity.hitbox_position(target, hitbox)
    if hx == nil then
        return false
    end

    local ok, fraction, hit_entity = pcall(client.trace_line, local_player, sx, sy, sz, hx, hy, hz)
    if not ok then
        return false
    end

    return hit_entity == target or (tonumber(fraction) or 0) > 0.97
end

local function target_visibility(local_player, sx, sy, sz, target)
    local body_open = false

    for i = 1, #body_hitboxes do
        if trace_visible(local_player, sx, sy, sz, target, body_hitboxes[i]) then
            body_open = true
            break
        end
    end

    local head_open = trace_visible(local_player, sx, sy, sz, target, 0)
    return body_open or head_open, body_open, head_open
end

local function get_weapon_group(local_player)
    local weapon = entity.get_player_weapon(local_player)
    if weapon == nil then
        return nil
    end

    return weapon_names[entity.get_classname(weapon)]
end

local function weapon_enabled(group)
    return auto_profile.weapons[group] == true
end

local function get_profile(group)
    return {
        weapon_group = group,
        point_scale = auto_profile.point_scale,
        update_ticks = auto_profile.update_ticks
    }
end

local function get_resolver_state(target)
    local root = rawget(_G, \"INFINIX\")
    local resolver = type(root) == "table\" and root.resolver_v2 or nil

    if type(resolver) ~= \"table\" or type(resolver.get_state) ~= "function" then
        return nil
    end

    local ok, state = pcall(resolver.get_state, target)
    if ok and type(state) == \"table\" then
        return state
    end

    return nil
end

local function resolver_blocked(state)
    if type(state) ~= "table" then
        return false, \"none\"
    end

    local tick = globals.tickcount()
    if state.dt_state == "shifted\" and tick < (state.dt_lagcomp_until or 0) then
        return true, \"dt-shift\"
    end

    if state.defensive_active == true then
        return false, \"defensive\"
    end

    return false, "none\"
end

local function get_target_misses(target, state)
    local own = miss_count[target] or 0
    local resolver = 0

    if type(state) == \"table\" then
        resolver = tonumber(state.miss or state.misses) or 0
    end

    return math.max(own, resolver)
end

local function bucket_damage(value)
    value = tonumber(value) or 0
    return math.floor(value / 5) * 5
end

local function body_damage_sane(info, profile)
    if info.body_damage <= 0 or info.body_hits <= 0 then
        return false, \"no-body\"
    end
    if not info.body_open and (info.body_hits or 0) < 2 then
        return false, \"wall-weak\"
    end

    return true, \"ok"
end

local function lethal_body_margin(info, profile)

    local hp = tonumber(info and info.hp) or 0

    if hp <= 35 then

        return 1

    end
    if profile and profile.weapon_group == \"ssg-08" then

        return (tonumber(info and info.armor) or 0) > 0 and 12 or 6
    end

    if profile and profile.weapon_group == \"r8\" then
        return (tonumber(info and info.armor) or 0) > 0 and 8 or 4
    end
    return 5
end

local function body_lethal_allowed(info, profile)
    if not info.body_sane then
        return false, info.body_sane_reason or \"no-body"
    end

    local hp = tonumber(info.hp) or 0

    local dmg = tonumber(info.body_damage) or 0


    local margin = lethal_body_margin(info, profile)

    if dmg < hp + margin then

        return false, \"not-lethal\"
    end

    if not info.body_open and dmg < hp + margin + 8 then
        return false, "wall-margin\"
    end

    return true, \"ok\"
end

local function update_scan_confidence(target, info)
    local key = table.concat({
        bucket_damage(info.body_damage),
        bucket_damage(info.head_damage),
        tostring(info.body_hitbox or \"-\"),
        tostring(info.head_hitbox or \"-\"),
        info.body_open and "bo\" or "bc\",
        info.head_open and \"ho" or "hc\",
        info.body_sane and "bs\" or (\"bx:\" .. tostring(info.body_sane_reason))
    }, \":\")

    local state = scan_state[target]
    if state == nil or state.key ~= key then
        state = { key = key, stable = 1 }
        scan_state[target] = state
    else
        state.stable = math.min((state.stable or 0) + 1, 8)
    end

    info.stable = state.stable
end

local function reset_round_state()
    miss_count = {}
    miss_tick = {}
    scan_state = {}
    last_info = {}
    active_target = nil
    active_until = 0
    shot_lock_until = 0
    player_list_update_tick = 0
    clear_all()
end

local function make_decision(info, profile)
    local body_lethal, lethal_reason = body_lethal_allowed(info, profile)

    if body_lethal then
        local min_damage = math.max(1, math.min(info.hp, math.floor(info.body_damage)))
        local priority = 120
        local reason = info.body_open and \"body lethal\" or "wall body lethal"
        if (tonumber(info.resolver_confidence) or 0) < 0.58
           or (tonumber(info.resolver_mismatch) or 0) > 0
           or (tonumber(info.misses) or 0) > 0 then
            priority = priority + 10
            reason = reason .. \" / resolver unsafe\"
        end
        if (tonumber(info.director_delay) or 0) >= 36 then
            priority = priority + 5
            reason = reason .. \" / delayed"

        end
        return "Force\", nil, min_damage, reason, priority
    end

    info.body_sane_reason = lethal_reason or info.body_sane_reason
    return nil, nil, nil, "clear", 0
end

local function apply_decision(target, prefer_value, safe_value, min_damage_value, reason, info)
    if prefer_value ~= nil then
        override_key(target, "Override prefer body aim", prefer_value)
    else
        restore_key(target, \"Override prefer body aim")
    end


    if safe_value ~= nil then

        override_key(target, \"Override safe point", safe_value)
    else

        restore_key(target, "Override safe point")

    end

    if min_damage_value ~= nil then
        override_key(target, "Minimum damage\", min_damage_value)
    else
        restore_key(target, \"Minimum damage")

    end

    if rage_decision ~= nil and type(rage_decision.apply_player) == \"function\" then
        rage_decision.apply_player(target)
    end

    local body_box = hitbox_names[info.body_hitbox] or \"-"
    local head_box = hitbox_names[info.head_hitbox] or \"-\"
    local signature = string.format(
        \"%s:%s:%s:%s:%d:%d:%d:%d:%d:%d:%s:%s",

        reason,

        tostring(prefer_value),
        tostring(safe_value),

        tostring(min_damage_value),
        info.hp,

        info.body_damage,

        info.head_damage,
        info.body_hits or 0,
        info.stable or 0,
        info.misses,
        info.resolver_reason,

        info.body_sane_reason

    )


    if last_reason[target] ~= signature then

        last_reason[target] = signature
        log_debug(string.format(
            \"%s -> %s | hp=%d body=%d(%s/%d) head=%d(%s) stable=%d miss=%d rs=%s sane=%s",

            entity.get_player_name(target) or tostring(target),
            reason,

            info.hp,

            info.body_damage,

            body_box,
            info.body_hits or 0,
            info.head_damage,
            head_box,
            info.stable or 0,
            info.misses,

            info.resolver_reason,

            info.body_sane_reason

        ))

    end

end


local function maybe_decay_misses(target)

    local last = miss_tick[target]
    if last ~= nil and globals.tickcount() - last > 512 then
        miss_count[target] = nil
        miss_tick[target] = nil

    end

end



local function decision_better(candidate, current)
    if current == nil then

        return true
    end



    if candidate.priority ~= current.priority then
        return candidate.priority > current.priority

    end


    if (candidate.info.stable or 0) ~= (current.info.stable or 0) then

        return (candidate.info.stable or 0) > (current.info.stable or 0)
    end

    return (candidate.info.body_damage or 0) > (current.info.body_damage or 0)

end


local function select_candidate(candidates, tick)

    local best, locked = nil, nil


    for i = 1, #candidates do
        local candidate = candidates[i]



        if (candidate.priority or 0) > 0 then

            if candidate.target == active_target then

                locked = candidate

            end

            if decision_better(candidate, best) then

                best = candidate
            end
        end
    end


    if best == nil then
        active_target = nil

        active_until = 0

        return nil

    end


    if locked ~= nil and tick <= active_until and locked.priority >= best.priority - 20 then
        return locked
    end


    active_target = best.target

    active_until = tick + 18

    return best
end



local function on_setup_command()
    if ui_get(menu.enabled, false) ~= true then

        if was_active then

            clear_all()
            was_active = false

        end

        return

    end

    was_active = true
    if globals.tickcount() < (rawget(_G, 'INFINIX_DT_RELAX_UNTIL') or 0) then

        clear_all()

        return
    end


    local local_player = entity.get_local_player()

    if local_player == nil or not entity.is_alive(local_player) then
        reset_round_state()

        return

    end


    local weapon_group = get_weapon_group(local_player)
    if weapon_group == nil or not weapon_enabled(weapon_group) then

        clear_all()

        return

    end


    local tick = globals.tickcount()

    local perf_stress = tick < (rawget(_G, 'INFINIX_PERF_STRESS_UNTIL') or 0)

    local perf_level = tonumber(rawget(_G, 'INFINIX_PERF_LEVEL')) or (perf_stress and 1 or 0)
    local profile = get_profile(weapon_group)

    local update_ticks = profile.update_ticks

    if perf_level >= 2 then
        update_ticks = math.max(update_ticks, 4)

    elseif perf_level >= 1 then

        update_ticks = math.max(update_ticks, 3)
    end
    if tick - last_tick < update_ticks then

        return

    end

    last_tick = tick



    if tick < shot_lock_until then

        if tick > active_until then
            clear_all()

        end

        return

    end

    if not is_weapon_ready(local_player) then

        if tick > active_until then
            clear_all()

        end



        return

    end



    local sx, sy, sz = get_eye_position(local_player)

    if sx == nil then

        clear_all()

        return

    end


    if tick < player_list_update_tick or tick - player_list_update_tick > 16 then

        player_list_update_tick = tick
        pcall(client.update_player_list)
    end

    for player in pairs(seen_players) do seen_players[player] = nil end

    local seen = seen_players

    local candidates = candidates_buf
    local candidate_count = 0
    local enemies, enemy_count

    if type(get_enemy_cache) == "function\" then
        enemies, enemy_count = get_enemy_cache()
    else
        enemies = entity.get_players(true) or {}
        enemy_count = #enemies
    end
    local sheltered = peek_sheltered(local_player, sx, sy, sz)
    local scan_count = 0

    for i = 1, #scan_targets_buf do scan_targets_buf[i] = nil end

    local function push_scan_target(target)
        if target == nil or seen[target] then return end
        if entity.is_alive(target) and not entity.is_dormant(target) then
            scan_count = scan_count + 1
            scan_targets_buf[scan_count] = target
            seen[target] = true
        end
    end

    local threat = nil
    if client.current_threat ~= nil then
        local ok_threat, cur_threat = pcall(client.current_threat)
        if ok_threat and cur_threat ~= nil and entity.is_alive(cur_threat) and not entity.is_dormant(cur_threat) then
            threat = cur_threat
            push_scan_target(threat)
        end
    end
    local max_scan_targets = threat ~= nil and 2 or AIMTOOLS_MAX_TARGETS
    if perf_level >= 2 then
        max_scan_targets = 1
    elseif perf_level >= 1 then
        max_scan_targets = threat ~= nil and 1 or 2
    end
    if active_target ~= nil and active_target ~= threat and scan_count < max_scan_targets then
        push_scan_target(active_target)
    end
    for i = 1, enemy_count do
        if scan_count >= max_scan_targets then break end
        local target = enemies[i]
        if target ~= threat then
            push_scan_target(target)
        end
    end

    aimtools_trace_budget = enemy_count >= 4 and AIMTOOLS_TRACE_BUDGET_BUSY or AIMTOOLS_TRACE_BUDGET
    if perf_level >= 2 then
        aimtools_trace_budget = math.min(aimtools_trace_budget, 16)
    elseif perf_level >= 1 then
        aimtools_trace_budget = math.min(aimtools_trace_budget, 24)
    end

    for scan_i = 1, scan_count do
        local target = scan_targets_buf[scan_i]

        if target ~= nil then
            maybe_decay_misses(target)

            local state = get_resolver_state(target)
            local blocked, block_reason = resolver_blocked(state)
            local hp = entity.get_prop(target, "m_iHealth\") or 100
            local armor = entity.get_prop(target, "m_ArmorValue\") or 0
            local helmet = entity.get_prop(target, \"m_bHasHelmet\") or 0
            local tox, toy = entity.get_origin(target)
            local visible, body_open, head_open = false, false, false
            local body_damage, body_hitbox, body_traces, body_hits = 0, nil, 0, 0
            local head_damage, head_hitbox = 0, nil

            visible, body_open, head_open = target_visibility(local_player, sx, sy, sz, target)
            body_damage, body_hitbox, body_traces, body_hits = scan_damage(
                local_player,
                sx,
                sy,
                sz,
                target,
                body_hitboxes,
                profile.point_scale,
                nil,
                tox,
                toy
            )
            head_damage, head_hitbox = scan_damage(
                local_player,
                sx,
                sy,
                sz,
                target,
                head_hitboxes,
                math.max(1, math.floor((profile.point_scale or 4) * 0.75 + 0.5)),
                nil,
                tox,
                toy
            )
            local info = last_info[target]
            if info == nil then
                info = {}
                last_info[target] = info
            end
            info.target = target
            info.tick = tick
            info.hp = hp
            info.body_damage = math.floor(math.max(body_damage, 0))
            info.head_damage = math.floor(math.max(head_damage, 0))
            info.body_hitbox = body_hitbox
            info.head_hitbox = head_hitbox
            info.body_hits = body_hits or 0
            info.visible = visible
            info.body_open = body_open
            info.head_open = head_open
            info.armor = armor
            info.helmet = helmet
            info.peek_sheltered = sheltered
            info.misses = get_target_misses(target, state)
            info.resolver_blocked = blocked
            info.resolver_reason = block_reason
            info.resolver_confidence = tonumber(state and state.confidence) or 0
            info.resolver_mismatch = tonumber(state and state.mismatch_streak) or 0
            info.resolver_good = state ~= nil and (tonumber(state.good_until) or 0) > tick
            do
                local director = rawget(_G, \"INFINIX_SHOT_DIRECTOR\")
                if type(director) == \"table\" and tonumber(director.target) == target then
                    info.director_delay = tonumber(director.delay_ticks) or 0
                    info.director_reason = director.reason or \"idle\"
                else
                    info.director_delay = 0
                    info.director_reason = \"idle\"
                end
            end

            info.body_sane, info.body_sane_reason = body_damage_sane(info, profile)
            update_scan_confidence(target, info)

            local prefer_value, safe_value, min_damage_value, reason, priority = make_decision(info, profile)
            candidate_count = candidate_count + 1
            local candidate = candidates[candidate_count]
            if candidate == nil then
                candidate = {}
                candidates[candidate_count] = candidate
            end
            candidate.target = target
            candidate.prefer = prefer_value
            candidate.safe = safe_value
            candidate.min_damage = min_damage_value
            candidate.reason = reason
            candidate.priority = priority or 0
            candidate.info = info
        end
    end
    for i = candidate_count + 1, #candidates do candidates[i] = nil end

    local chosen = select_candidate(candidates, tick)

    for i = 1, #candidates do
        local candidate = candidates[i]

        if chosen ~= nil and candidate.target == chosen.target then
            apply_decision(candidate.target, candidate.prefer, candidate.safe, candidate.min_damage, candidate.reason, candidate.info)
        else
            clear_target(candidate.target)
        end
    end

    local stale = stale_buf
    for i = 1, #stale do stale[i] = nil end
    for player in pairs(backup) do
        if not seen[player] then
            stale[#stale + 1] = player
        end
    end
    for player in pairs(owned) do
        if not seen[player] then
            stale[#stale + 1] = player
        end
    end

    for i = 1, #stale do
        clear_target(stale[i])
    end

    local stale_info = stale_info_buf
    for i = 1, #stale_info do stale_info[i] = nil end
    for player in pairs(last_info) do
        if not seen[player] then
            stale_info[#stale_info + 1] = player
        end
    end

    for i = 1, #stale_info do
        last_info[stale_info[i]] = nil
    end
end

local function shot_hit_mismatch(e)
    local shot_ctx = rawget(_G, \"INFINIX_RESOLVER_SHOT_CONTEXT\")
    if type(shot_ctx) ~= \"table\" or type(shot_ctx.get) ~= \"function\" then
        return false, nil, nil, 0
    end
    local ok_ctx, ctx = pcall(shot_ctx.get, e)
    if not ok_ctx or type(ctx) ~= \"table\" then
        return false, nil, nil, 0
    end
    local expected_hg = tonumber(ctx.expected_hitgroup)
    local actual_hg = tonumber(e and e.hitgroup)
    if expected_hg == nil or actual_hg == nil or expected_hg <= 0 or actual_hg <= 0 or expected_hg == actual_hg then
        return false, ctx, actual_hg, 0
    end
    local expected_damage = tonumber(ctx.expected_damage) or 0
    local actual_damage = tonumber(e and e.damage) or 0
    return (expected_hg == 1 or (expected_damage - actual_damage) >= 10), ctx, actual_hg,
        math.max(0, expected_damage - actual_damage)
end

aim_event(\"aim_miss\", function(e)
    local target = e.target
    if target == nil then
        return
    end

    local reason = tostring(e.reason or \"?\")
    if reason == \"spread\" or reason == "prediction_error\" or reason == \"prediction error\" then
        return
    end

    local shot_ctx = rawget(_G, "INFINIX_RESOLVER_SHOT_CONTEXT\")
    if type(shot_ctx) == \"table\" and type(shot_ctx.ignore_reason) == \"function\" then
        local ok_ignore, ignore_reason = pcall(shot_ctx.ignore_reason, e, target)
        if ok_ignore and ignore_reason ~= nil then
            return
        end
    end

    local state = get_resolver_state(target)
    local blocked = resolver_blocked(state)
    if blocked then
        return
    end

    if reason == \"wrong_hitbox\" then
        miss_count[target] = (miss_count[target] or 0) + 2
    elseif reason == "?\" then
        miss_count[target] = (miss_count[target] or 0) + 1
    end

    shot_lock_until = globals.tickcount() + 6
    miss_tick[target] = globals.tickcount()
end)

aim_event(\"aim_hit\", function(e)
    if e.target ~= nil then
        local mismatch, ctx = shot_hit_mismatch(e)
        if mismatch then
            miss_count[e.target] = (miss_count[e.target] or 0) + 2
            miss_tick[e.target] = globals.tickcount()
        else
            miss_count[e.target] = 0
            miss_tick[e.target] = nil
        end
    end

    shot_lock_until = globals.tickcount() + 6
end)

local function aim_fire_head(e)
    local hitbox = tonumber(e.hitbox)
    local hitgroup = tonumber(e.hitgroup)

    return hitbox == 0 or hitgroup == 1
end

aim_event(\"aim_fire\", function(e)
    local target = e.target
    if target == nil or not aim_fire_head(e) then
        shot_lock_until = globals.tickcount() + 6
        return
    end

    shot_lock_until = globals.tickcount() + 6
end)

aim_event("player_death\", function(e)
    if e.userid == nil then
        return
    end

    local player = client.userid_to_entindex(e.userid)
    if player ~= nil then
        miss_count[player] = nil
        miss_tick[player] = nil
        scan_state[player] = nil
        last_info[player] = nil
        clear_target(player)
    end
end)

aim_event(\"round_prestart\", reset_round_state)
aim_event("shutdown", clear_all)
aim_event(\"setup_command", on_setup_command)

if menu.enabled ~= nil then

    aim_set_callback(menu.enabled, function()
        update_visibility()


        if ui_get(menu.enabled, false) ~= true then

            clear_all()

            was_active = false

        else

            hard_clear_current_players()

        end

    end)

end

if menu.mode ~= nil then
    aim_set_callback(menu.mode, sync_mode)
end


if menu.miss_escalation ~= nil then
    aim_set_callback(menu.miss_escalation, update_visibility)
end



if INFINIX_EMBED and type(INFINIX_EMBED.vis_hooks) == \"table\" then
    INFINIX_EMBED.vis_hooks[#INFINIX_EMBED.vis_hooks + 1] = function(sec)
        section_visible = (sec == (INFINIX_EMBED.section or \"ragebot\"))
        update_visibility()
    end
end

sync_mode()
update_visibility()

if ui_get(menu.enabled, false) == true then
    hard_clear_current_players()
end

if not INFINIX_EMBED then
    client.log(TAG .. \" loaded")

end

]==],
						["ai_peek_infinix.lua"] = [==[--[[
    AI Peek clean standalone
    Core logic is ported from Emberlash; only menu/settings shell is changed.
]]

local TAG = '[ai peek]\'
local VERSION = \'emberlash-core-r1\'
local INFINIX_EMBED = rawget(_G, \'INFINIX_AI_PEEK_EMBED\')
local TAB = INFINIX_EMBED and (INFINIX_EMBED.TAB or INFINIX_EMBED.tab) or \'AA'
local GROUP = INFINIX_EMBED and (INFINIX_EMBED.GRP or INFINIX_EMBED.group) or \'Fake lag\'
local get_enemy_cache = INFINIX_EMBED and INFINIX_EMBED.get_enemy_cache or rawget(_G, \'INFINIX_GET_ENEMY_CACHE')
local infinix_accent = INFINIX_EMBED and INFINIX_EMBED.infinix_accent or rawget(_G, 'infinix_accent')
if type(infinix_accent) ~= 'function\' then
    infinix_accent = function() return 155, 213, 60, 255 end
end

local unpack = unpack or table.unpack

local function safe_require(name)
    local ok, module = pcall(require, name)
    if ok then return module end
    pcall(client.color_log, 255, 120, 90, TAG .. \' missing module: ' .. tostring(name))
    return nil
end

local vector = safe_require(\'vector') or rawget(_G, \'vector')
local trace = safe_require('gamesense/trace\')

if vector == nil then
    pcall(client.color_log, 255, 80, 80, TAG .. \' failed: vector library not loaded')
    return
end
local ai_peek_core_ok = trace ~= nil
if not ai_peek_core_ok then
    pcall(client.color_log, 255, 120, 90, TAG .. \' warning: gamesense/trace missing; menu loaded, core disabled\')
end

local function safe_ref(...)
    local ok, a, b = pcall(ui.reference, ...)
    if ok then return a, b end
    return nil, nil
end

local function safe_get(ref, fallback)
    if ref == nil then return fallback end
    local ok, value = pcall(ui.get, ref)
    if ok then return value end
    return fallback
end

local function safe_set(ref, ...)
    if ref ~= nil then pcall(ui.set, ref, ...) end
end

local function set_hotkey_mode(ref, mode)
    if ref == nil then return end
    if pcall(ui.set, ref, mode) then return end
    if mode == \'Always on\' and pcall(ui.set, ref, \'Always On\') then return end
    if mode == 'Always on\' then pcall(ui.set, ref, true) end
end

local function safe_visible(ref, value)
    if INFINIX_EMBED and type(INFINIX_EMBED.vis) == \'function\' then
        INFINIX_EMBED.vis(ref, value and true or false)
        return
    end
    if ref ~= nil then pcall(ui.set_visible, ref, value and true or false) end
end

local function safe_new(ctor, ...)
    if INFINIX_EMBED and type(INFINIX_EMBED.safe_new) == \'function' then
        return INFINIX_EMBED.safe_new(ctor, ...)
    end
    local ok, ref = pcall(ctor, ...)
    if ok then return ref end
    return nil
end

local function ai_set_callback(ref, cb)
    if INFINIX_EMBED and type(INFINIX_EMBED.set_cb) == \'function' then
        INFINIX_EMBED.set_cb(ref, cb)
    elseif ref ~= nil and cb ~= nil then
        pcall(ui.set_callback, ref, cb)
    end
end

local function ai_event(name, fn)
    if INFINIX_EMBED and name == 'setup_command' and type(INFINIX_EMBED.on_cmd_hooks) == \'table\' then
        INFINIX_EMBED.on_cmd_hooks[#INFINIX_EMBED.on_cmd_hooks + 1] = fn
        return
    end
    if INFINIX_EMBED and name == \'paint\' and type(INFINIX_EMBED.paint_hooks) == 'table\' then
        INFINIX_EMBED.paint_hooks[#INFINIX_EMBED.paint_hooks + 1] = fn
        return
    end
    if INFINIX_EMBED and name == \'shutdown\' and type(INFINIX_EMBED.shutdown_hooks) == 'table\' then
        INFINIX_EMBED.shutdown_hooks.ai_peek = fn
        return
    end
    pcall(client.set_event_callback, name, fn)
end

local function table_contains(tbl, val)
    if type(tbl) ~= 'table' then return false end
    for i = 1, #tbl do
        if tbl[i] == val then return true end
    end
    return false
end

local function normalize_angle(angle)
    angle = angle % 360
    if angle > 180 then angle = angle - 360 end
    return angle
end

local override_cache = {}
local hotkey_mode = { [0] = 'Always on', [1] = \'On hotkey\', [2] = \'Toggle', [3] = \'Off hotkey' }

local function read_ref(ref)
    if ref == nil then return nil end
    local ok_type, typ = pcall(ui.type, ref)
    local ok, a, b, c, d = pcall(ui.get, ref)
    if not ok then return nil end

    if ok_type and typ == \'hotkey\' then
        return { hotkey_mode[b] or \'On hotkey\', c or 0 }
    end

    return { a, b, c, d }
end

local function override_set(ref, ...)
    if ref == nil then return end
    if override_cache[ref] == nil then
        override_cache[ref] = read_ref(ref)
    end
    safe_set(ref, ...)
end

local function override_unset(ref)
    local value = ref and override_cache[ref]
    if value == nil then return end
    safe_set(ref, unpack(value))
    override_cache[ref] = nil
end

local function override_release_all()
    for ref, value in pairs(override_cache) do
        safe_set(ref, unpack(value))
        override_cache[ref] = nil
    end
end

local refs = {
    target_hitbox = safe_ref('RAGE\', \'Aimbot\', \'Target hitbox'),
    minimum_damage = safe_ref(\'RAGE\', \'Aimbot\', 'Minimum damage\'),
    force_body = safe_ref(\'RAGE\', \'Aimbot\', \'Force body aim\'),
    auto_scope = safe_ref('RAGE\', 'Aimbot', 'Automatic scope\'),
    quickpeek = { safe_ref(\'RAGE', 'Other\', \'Quick peek assist') },
    quickpeek_mode = { safe_ref(\'RAGE\', \'Other\', \'Quick peek assist mode') },
    quickpeek_distance = safe_ref(\'RAGE\', \'Other\', \'Quick peek assist distance'),
    double_tap = { safe_ref('RAGE\', \'Aimbot\', 'Double tap\') },
    hideshots = { safe_ref(\'AA', \'Other\', \'On shot anti-aim\') },
    fake_duck = safe_ref(\'RAGE', \'Other\', 'Duck peek assist\'),
}

refs.minimum_damage_override = {}
do
    local candidates = {
        { 'Rage\', \'Aimbot\', 'Minimum damage override\' },
        { 'RAGE', \'Aimbot\', \'Minimum damage override\' },
    }
    local seen = {}
    for i = 1, #candidates do
        local c = candidates[i]
        local ok, a, b, d = pcall(ui.reference, c[1], c[2], c[3])
        if ok then
            local values = { a, b, d }
            for j = 1, #values do
                local ref = values[j]
                if ref ~= nil and not seen[ref] then
                    refs.minimum_damage_override[#refs.minimum_damage_override + 1] = ref
                    seen[ref] = true
                end
            end
        end
    end
end

local ui_ai = {
    enable = safe_new(ui.new_checkbox, TAB, GROUP, \'ai peek\'),
    key = safe_new(ui.new_hotkey, TAB, GROUP, \'  ai peek key\', true),
    weapon = safe_new(ui.new_multiselect, TAB, GROUP, '  weapon profiles', {
        \'scout\',
        \'awp\',
        'auto sniper\',
        \'pistol\',
        'heavy pistol',
    }),
    distance = safe_new(ui.new_combobox, TAB, GROUP, '  peek style', { \'aggressive', \'safe\' }),
    target = safe_new(ui.new_combobox, TAB, GROUP, \'  target mode\', { \'current threat\', \'closest to crosshair\' }),
    mode = safe_new(ui.new_multiselect, TAB, GROUP, \'  peek mode\', {
        \'automatically teleport back\',
        'force defensive\',
    }),
    visual = safe_new(ui.new_combobox, TAB, GROUP, \'  visual style', { \'off', \'minimal\', \'diagnostic' }),
}

safe_set(ui_ai.weapon, \'scout', 'awp\', \'auto sniper', \'pistol', \'heavy pistol')
safe_set(ui_ai.distance, \'aggressive\')
safe_set(ui_ai.visual, \'minimal\')

local section_visible = true
local function embed_register_menu()
    if not INFINIX_EMBED then return end
    local slot = INFINIX_EMBED.SLOT
    local cfg_register = INFINIX_EMBED.cfg_register
    if type(slot) == \'table\' then
        for name, ref in pairs(ui_ai) do
            if ref ~= nil then slot[\'ai_peek_' .. tostring(name)] = ref end
        end
    end
    if type(cfg_register) == \'function' then
        for name, ref in pairs(ui_ai) do
            if ref ~= nil then cfg_register(\'ragebot', 'ai_peek_\' .. tostring(name), ref) end
        end
    end
    for _, ref in pairs(ui_ai) do safe_visible(ref, false) end
end

embed_register_menu()

local function update_visibility()
    local active_root = (not INFINIX_EMBED) or section_visible
    local on = active_root and safe_get(ui_ai.enable, false)
    safe_visible(ui_ai.enable, active_root)
    safe_visible(ui_ai.key, on)
    safe_visible(ui_ai.weapon, on)
    safe_visible(ui_ai.distance, on)
    safe_visible(ui_ai.target, on)
    safe_visible(ui_ai.mode, on)
    safe_visible(ui_ai.visual, on)
end

ai_set_callback(ui_ai.enable, update_visibility)
update_visibility()

local exploits = {
    max_process_ticks = math.abs(client.get_cvar(\'sv_maxusrcmdprocessticks') or 16) - 1,
    tickbase_difference = 0,
    ticks_processed = 0,
    command_number = 0,
    choked_commands = 0,
}

function exploits:reset_vars()
    self.tickbase_difference = 0
    self.ticks_processed = 0
    self.command_number = 0
    self.choked_commands = 0
end

function exploits:store_vars(ctx)
    self.command_number = ctx.command_number or 0
    self.choked_commands = ctx.chokedcommands or 0
end

function exploits:store_tickbase_difference(ctx)
    if ctx.command_number ~= self.command_number then return end
    local me = entity.get_local_player()
    if me == nil then return end

    local tickbase = entity.get_prop(me, \'m_nTickBase') or 0
    local max_ticks = math.max(0, (self.max_process_ticks or 0) - (self.choked_commands or 0))
    local diff = math.abs(tickbase - (self.tickbase_difference or 0))
    self.ticks_processed = math.min(math.max(diff, 0), max_ticks)
    self.tickbase_difference = math.max(tickbase, self.tickbase_difference or 0)
    self.command_number = 0
end

function exploits:is_active()
    return safe_get(refs.double_tap[2], false) or safe_get(refs.hideshots[2], false)
end

function exploits:can_recharge()
    if not self:is_active() then return false end

    local me = entity.get_local_player()
    local weapon = me and entity.get_player_weapon(me)
    if me == nil or weapon == nil then return false end

    local tickbase = entity.get_prop(me, 'm_nTickBase') or 0
    local curtime = globals.tickinterval() * (tickbase - 16)

    if curtime < (entity.get_prop(me, 'm_flNextAttack') or 0) then return false end
    if curtime < (entity.get_prop(weapon, \'m_flNextPrimaryAttack\') or 0) then return false end
    return true
end

local ai_peek = {
    active_hitboxes = {},
    state = \'idle\',
    returning = false,
    targeting = false,
    should_return = false,
    dt_teleport = false,
    disable_dt = false,
    amount = 6,
    step_distance = 50,
    peek_profile = nil,
    hotkeys = {
        main = false,
        force_baim = false,
    },
    cache = {
        autopeek = {},
        middle_pos = vector(),
        origin_z = 0,
        origin_grounded = false,
        origin_tick = 0,
        origin_valid = false,
        origin_key_locked = false,
        native_qp_origin_locked = false,
        native_qp_origin_tick = 0,
        active_point_index = 0,
        positions = {},
        vectors_to_target = {},
        last_returning_time = 0,
        return_start_tick = nil,
        current_target = 0,
        enemy_count = 0,
        points_tick = 0,
        points_angle = nil,
        points_origin = nil,
        points_amount = 0,
        points_step = 0,
        qp_distance = nil,
        qp_hotkey_forced = false,
        bt_state = 'clean\',
        bt_risk = 0,
        trace_damage = 0,
        live_damage = 0,
        pred_damage = 0,
        bt_quality = 100,
        bt_delta = 0,
        bt_candidate_damage = 0,
        bt_allowed = false,
        bt_reject_reason = \'off',
        live_vs_bt_delta = 0,
        commit_kind = \'none\',
        required_damage = 0,
        minimum_damage = 0,
        damage_source = 'idle\',
        target_health = 0,
        damage_gap = 0,
        hitbox_points = {},
        trace_tick = 0,
        trace_cache = {},
        edge_trace_confirm = {},
        exposure_tick = 0,
        exposure_cache = {},
        target_exposure = 0,
        exposure_enemies = {},
        enemy_candidates = {},
        candidate_buf = {},
        record_cache = {},
        decision = nil,
        decision_tick = 0,
        decision_mode = nil,
        decision_distance = nil,
        decision_middle = nil,
        last_good_pos = nil,
        last_good_index = 0,
        last_good_target = 0,
        last_good_tick = 0,
        last_good_damage = 0,
        last_good_required_damage = 0,
        last_good_damage_source = \'idle',
        last_reason = \'idle',
        return_last_dist = 0,
        return_stuck_ticks = 0,
        return_session_id = 0,
        return_phase = 'idle',
        return_reason = \'idle\',
        return_release_done = false,
        native_return_only = false,
        native_post_shot_settle_until = 0,
        forced_return_until = 0,
        return_allowed = false,
        peek_target = 0,
        peek_point_index = 0,
        peek_start_tick = nil,
        peek_start_dist = 0,
        peek_last_dist = 0,
        peek_no_progress_ticks = 0,
        peek_last_damage_tick = 0,
        return_dt_released = false,
        return_dt_release_tick = 0,
        dt_return_cooldown_until = 0,
        dt_return_cooldown_min_until = 0,
        dt_return_wait_recharge = false,
        dt_return_ready_ticks = 0,
        dt_return_rearm_until = 0,
        velocity_return_cooldown_until = 0,
        session_active = false,
        session_target = 0,
        session_point_index = 0,
        session_started_tick = 0,
        session_last_seen_tick = 0,
        session_last_live_damage_tick = 0,
        session_lost_reason = 'idle',
        session_point_pos = nil,
        session_start_pos = nil,
        session_target_origin = nil,
        session_move_yaw = 0,
        session_path_len = 0,
        session_force_return_now = false,
        session_boundary_tick = 0,
        session_air_probe = false,
        fd_cooldown_until = 0,
    },
    visual = {
        active = false,
        pos = nil,
        target_pos = nil,
        phase = 0,
        fading = false,
        fade_start_tick = 0,
        last_state = 'idle',
    }
}

local AI_PEEK_LEGACY_SAFE_CORE = true
local AI_PEEK_DECISION_TTL = 8
local AI_PEEK_TRACE_BUDGET = 34
local AI_PEEK_TRACE_BUDGET_BUSY = 26
local AI_PEEK_TRACE_BUDGET_MANY = 20
local AI_PEEK_RECORD_MAX_TICKS = 6
local AI_PEEK_RECORD_COMMIT_TICKS = 2
local AI_PEEK_DORMANT_RECORD_TICKS = 24
local AI_PEEK_DORMANT_COMMIT_TICKS = 12
local AI_PEEK_ORIGIN_MAX_Z_DELTA = 64
local AI_PEEK_ORIGIN_FALL_Z_DELTA = 36
local AI_PEEK_ORIGIN_MAX_DIST = 320
local AI_PEEK_DISABLE_BACKTRACK_TEST = false
local AI_PEEK_STRICT_LIVE_TRACE_TEST = true
local AI_PEEK_USE_NATIVE_QUICKPEEK = true
local AI_PEEK_SMART_BACKTRACK = true
local AI_PEEK_BT_MAX_DELTA = 64
local AI_PEEK_DT_RECHARGE_READY_TICKS = 3
local AI_PEEK_DT_REARM_TICKS = 3
local AI_PEEK_DISTANCE_PROFILES = {
    safe = { amount = 3, step = 28, adaptive_extra = 1, index_penalty = 6, exposure_penalty = 12, max_exposure = 26, hard_exposure = 36, min_score = -6, memory_ticks = 3, fail_ticks = 1, min_progress = 8, arrive_radius = 18, allow_air_probe = false, boundary_hold_ticks = 1, boundary_grace_ticks = 1, unsafe_return_ticks = 1, bait_hold_ticks = 1, commit_hold_ticks = 2, return_guard_ticks = 2, start_wait_ticks = 2, chase_move_delta = 20 },
    aggressive = { amount = 3, step = 31, adaptive_extra = 1, index_penalty = 5, exposure_penalty = 11, max_exposure = 22, hard_exposure = 34, min_score = -9, memory_ticks = 3, travel_ticks = 3, fail_ticks = 2, min_progress = 10, arrive_radius = 22, allow_air_probe = true, boundary_hold_ticks = 2, boundary_grace_ticks = 2, unsafe_return_ticks = 1, bait_hold_ticks = 2, commit_hold_ticks = 3, return_guard_ticks = 3, start_wait_ticks = 3, chase_move_delta = 24, early_live_ratio = 0.50, medium_tier_amount = 3 },
    adaptive = { amount = 3, step = 31, adaptive_extra = 1, index_penalty = 5, exposure_penalty = 11, max_exposure = 22, hard_exposure = 34, min_score = -9, memory_ticks = 3, travel_ticks = 3, fail_ticks = 2, min_progress = 10, arrive_radius = 22, allow_air_probe = true, boundary_hold_ticks = 2, boundary_grace_ticks = 2, unsafe_return_ticks = 1, bait_hold_ticks = 2, commit_hold_ticks = 3, return_guard_ticks = 3, start_wait_ticks = 3, chase_move_delta = 24, early_live_ratio = 0.50, medium_tier_amount = 3 },
    long = { amount = 5, step = 42, adaptive_extra = 1, index_penalty = 5, exposure_penalty = 10, max_exposure = 20, hard_exposure = 30, min_score = -9, memory_ticks = 4, travel_ticks = 5, fail_ticks = 2, min_progress = 12, arrive_radius = 28, allow_air_probe = true, boundary_hold_ticks = 3, boundary_grace_ticks = 2, unsafe_return_ticks = 1, bait_hold_ticks = 3, commit_hold_ticks = 4, return_guard_ticks = 4, start_wait_ticks = 5, chase_move_delta = 28, early_live_ratio = 0.52 },
    medium = { amount = 3, step = 31, adaptive_extra = 1, index_penalty = 5, exposure_penalty = 11, max_exposure = 22, hard_exposure = 34, min_score = -9, memory_ticks = 3, travel_ticks = 3, fail_ticks = 2, min_progress = 10, arrive_radius = 22, allow_air_probe = true, boundary_hold_ticks = 2, boundary_grace_ticks = 2, unsafe_return_ticks = 1, bait_hold_ticks = 2, commit_hold_ticks = 3, return_guard_ticks = 3, start_wait_ticks = 3, chase_move_delta = 24, early_live_ratio = 0.50, medium_tier_amount = 3 },
    short = { amount = 3, step = 28, adaptive_extra = 1, index_penalty = 6, exposure_penalty = 12, max_exposure = 26, hard_exposure = 36, min_score = -6, memory_ticks = 3, fail_ticks = 1, min_progress = 8, arrive_radius = 18, allow_air_probe = false, boundary_hold_ticks = 1, boundary_grace_ticks = 1, unsafe_return_ticks = 1, bait_hold_ticks = 1, commit_hold_ticks = 2, return_guard_ticks = 2, start_wait_ticks = 2, chase_move_delta = 20 },
}

local AI_PEEK_WEAPON_PROFILE_MODS = {
    scout = {
        adaptive = { min_score = -10, early_live_ratio = 0.48, start_wait_ticks = 2, long_tier_amount = 2 },
        medium = { min_score = -10, early_live_ratio = 0.48, start_wait_ticks = 2 },
        long = { min_score = -10, early_live_ratio = 0.50, start_wait_ticks = 4 },
    },
    awp = {
        adaptive = { min_score = -7, early_live_ratio = 0.58, exposure_penalty = 12, hard_exposure = 30, long_tier_amount = 2 },
        medium = { min_score = -7, early_live_ratio = 0.62, exposure_penalty = 12 },
        long = { min_score = -7, early_live_ratio = 0.66, exposure_penalty = 12, hard_exposure = 28 },
    },
    ['auto sniper'] = {
        adaptive = { min_score = -9, early_live_ratio = 0.50, long_tier_amount = 2 },
        medium = { min_score = -9, early_live_ratio = 0.52 },
        long = { min_score = -9, early_live_ratio = 0.54 },
    },
    ['heavy pistol\'] = {
        adaptive = { step = 33, min_score = -8, early_live_ratio = 0.50, long_tier_amount = 1, long_tier_step = 40 },
        medium = { step = 33, min_score = -9, early_live_ratio = 0.50 },
        long = { amount = 4, step = 40, min_score = -8, early_live_ratio = 0.54 },
    },
    pistol = {
        adaptive = { step = 32, min_score = -9, early_live_ratio = 0.46, long_tier_amount = 1, long_tier_step = 38 },
        medium = { step = 32, min_score = -10, early_live_ratio = 0.46 },
        long = { amount = 4, step = 38, min_score = -8, early_live_ratio = 0.50 },
    },
}

local function ai_peek_copy_profile(base)
    local out = {}
    for k, v in pairs(base or {}) do out[k] = v end
    return out
end

local function normalize_ai_peek_distance_mode(distance_mode)
    local value = tostring(distance_mode or \'aggressive\'):lower()
    if value == \'safe\' or value == 'short\' then
        return 'safe\', \'short'
    end
    if value == \'aggressive\' or value == \'agressive\' or value == \'medium\' or value == \'adaptive' or value == \'long\' then
        return \'aggressive', \'medium\'
    end
    return \'aggressive', \'medium\'
end

ai_peek.detect_weapon_profile = function(weapon)
    if weapon == nil then return nil end

    local class = string.lower(entity.get_classname(weapon) or \'')
    local detected = nil
    if class:find('ssg08', 1, true) or class:find(\'scout', 1, true) then
        detected = \'scout\'
    elseif class:find(\'awp\', 1, true) then
        detected = \'awp\'
    elseif class:find('scar20\', 1, true) or class:find('g3sg1\', 1, true) then
        detected = \'auto sniper\'
    elseif class:find(\'deagle\', 1, true) or class:find(\'revolver\', 1, true) then
        detected = \'heavy pistol'
    elseif class:find('glock', 1, true)
        or class:find(\'usp', 1, true)
        or class:find(\'hkp2000\', 1, true)
        or class:find(\'p250\', 1, true)
        or class:find('fiveseven', 1, true)
        or class:find(\'tec9\', 1, true)
        or class:find(\'cz75\', 1, true)
        or class:find(\'elite\', 1, true) then
        detected = \'pistol\'
    end

    if detected == nil then return nil end
    if table_contains(safe_get(ui_ai.weapon, {}), detected) then return detected end
    return nil
end

ai_peek.resolve_profile = function(distance_mode, local_player, weapon)
    local normalized_mode, source_mode = normalize_ai_peek_distance_mode(distance_mode)
    local base = AI_PEEK_DISTANCE_PROFILES[normalized_mode] or AI_PEEK_DISTANCE_PROFILES.aggressive
    local profile = ai_peek_copy_profile(base)
    local weapon_profile = ai_peek.detect_weapon_profile(weapon or (local_player and entity.get_player_weapon(local_player)))
    if weapon_profile == nil then
        ai_peek.cache.weapon_profile = \'disabled'
        return nil
    end
    local mods = AI_PEEK_WEAPON_PROFILE_MODS[weapon_profile]
    local distance_mods = mods and (mods[normalized_mode] or mods[source_mode]) or nil
    if distance_mods ~= nil then
        for k, v in pairs(distance_mods) do profile[k] = v end
    end
    profile.distance_mode = normalized_mode
    profile.source_distance_mode = source_mode
    profile.weapon_profile = weapon_profile
    ai_peek.cache.weapon_profile = profile.weapon_profile
    return profile
end

ai_peek.hitgroups_to_hitboxes = {
    [\'Head\'] = { 0 },
    [\'Chest'] = { 4, 5, 6 },
    [\'Stomach'] = { 2, 3 },
    ['Arms\'] = { 13, 14, 15, 16, 17, 18 },
    [\'Legs\'] = { 7, 8, 9, 10 },
    [\'Feet\'] = { 11, 12 },
}

ai_peek.allowed_hitboxes = {
    0, 4, 5, 6, 2, 3, 13, 14, 15, 16, 17, 18, 7, 8, 9, 10, 11, 12
}

local AI_PEEK_STAND_SCAN_HITBOXES = { 0, 2, 3, 4, 5, 6 }
local AI_PEEK_AIR_SCAN_HITBOXES = { 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 0 }

ai_peek.skip_func = function(entindex)
    local ent_classname = entity.get_classname(entindex)
    if ent_classname == \'CCSPlayer\' and entity.is_enemy(entindex) then
        return false
    end
    return true
end

ai_peek.create_values = function()
    for i = 0, ai_peek.amount do
        ai_peek.cache.vectors_to_target[i] = {}
    end
end

ai_peek.set_state = function(state, reason)
    ai_peek.state = state or ai_peek.state or \'idle\'
    if reason ~= nil then
        ai_peek.cache.last_reason = reason
    end
end

ai_peek.is_grounded = function(player)
    local flags = player ~= nil and (entity.get_prop(player, 'm_fFlags\') or 0) or 0
    return bit.band(flags, bit.lshift(1, 0)) == 1
end

ai_peek.update_hitboxes = function(force_baim)
    local new_hitboxes = {}
    local target_hitboxes = safe_get(refs.target_hitbox, { \'Head', \'Chest\', \'Stomach' })
    local disabled = { 'Head\', \'Arms\', \'Legs\', \'Feet' }

    if type(target_hitboxes) ~= \'table' then
        target_hitboxes = { \'Head\', \'Chest\', \'Stomach' }
    end

    for i = 1, #target_hitboxes do
        local group = target_hitboxes[i]
        if not (force_baim and table_contains(disabled, group)) then
            local hitboxes = ai_peek.hitgroups_to_hitboxes[group]
            if hitboxes ~= nil then
                for j = 1, #hitboxes do
                    local hitbox = hitboxes[j]
                    if table_contains(ai_peek.allowed_hitboxes, hitbox) then
                        new_hitboxes[#new_hitboxes + 1] = hitbox
                    end
                end
            end
        end
    end

    if #new_hitboxes == 0 then
        new_hitboxes = force_baim and { 2, 3, 4, 5, 6 } or { 0, 2, 3, 4, 5, 6 }
    end

    ai_peek.active_hitboxes = new_hitboxes
end

ai_peek.build_scan_hitboxes = function(target, selected)
    local out, seen = {}, {}
    local function add(hitbox)
        hitbox = tonumber(hitbox)
        if hitbox == nil or seen[hitbox] or not table_contains(ai_peek.allowed_hitboxes, hitbox) then return end
        seen[hitbox] = true
        out[#out + 1] = hitbox
    end

    local flags = entity.get_prop(target, \'m_fFlags\') or 0
    local airborne = bit.band(flags, bit.lshift(1, 0)) ~= 1
    local primary = airborne and AI_PEEK_AIR_SCAN_HITBOXES or AI_PEEK_STAND_SCAN_HITBOXES

    for i = 1, #primary do add(primary[i]) end
    if type(selected) == \'table\' then
        for i = 1, #selected do
            if #out >= 12 then break end
            add(selected[i])
        end
    end

    if #out == 0 then
        out = { 0, 2, 3, 4, 5, 6 }
    end
    return out
end

ai_peek.capture_origin = function(local_player)
    local ox, oy, oz = entity.get_origin(local_player)
    if ox == nil then return false end
    ai_peek.cache.middle_pos = vector(ox, oy, oz)
    ai_peek.cache.origin_z = oz or 0
    ai_peek.cache.origin_grounded = ai_peek.is_grounded(local_player)
    ai_peek.cache.origin_tick = globals.tickcount()
    ai_peek.cache.origin_valid = ai_peek.cache.origin_grounded == true
    return true
end

ai_peek.origin_valid = function(local_player, origin, current_origin, dist)
    if origin == nil or current_origin == nil then return false, 'no origin' end
    if ai_peek.cache.origin_valid ~= true then return false, \'origin invalid\' end
    if (dist or current_origin:dist2d(origin)) > AI_PEEK_ORIGIN_MAX_DIST then return false, 'origin far' end

    local dz = math.abs((current_origin.z or 0) - (origin.z or 0))
    if dz > AI_PEEK_ORIGIN_MAX_Z_DELTA then return false, \'origin z\' end

    local grounded = ai_peek.is_grounded(local_player)
    if not grounded and ((origin.z or 0) - (current_origin.z or 0)) > AI_PEEK_ORIGIN_FALL_Z_DELTA then
        return false, 'falling origin\'
    end

    return true, 'origin ok'
end

if refs.target_hitbox ~= nil then
    ai_set_callback(refs.target_hitbox, function()
        ai_peek.update_hitboxes(safe_get(refs.force_body, false))
    end)
end

ai_peek.set_movement = function(e, destination, local_player, speed)
    local move_yaw = vector(vector(entity.get_origin(local_player)):to(destination):angles()).y
    speed = tonumber(speed) or 800

    e.in_forward = 1
    e.in_back = 0
    e.in_moveleft = 0
    e.in_moveright = 0
    e.in_speed = 0
    e.forwardmove = speed
    e.sidemove = 0
    e.move_yaw = move_yaw
end

ai_peek.set_movement_yaw = function(e, move_yaw, speed)
    speed = tonumber(speed) or 800
    e.in_forward = 1
    e.in_back = 0
    e.in_moveleft = 0
    e.in_moveright = 0
    e.in_speed = 0
    e.forwardmove = speed
    e.sidemove = 0
    e.move_yaw = move_yaw
end

ai_peek.extrapolate_position = function(ent, origin, ticks, inverted)
    local tickinterval = globals.tickinterval()
    local sv_gravity = cvar.sv_gravity:get_float() * tickinterval
    local sv_jump_impulse = cvar.sv_jump_impulse:get_float() * tickinterval
    local p_origin, prev_origin = origin, origin
    local velocity = vector(entity.get_prop(ent, 'm_vecVelocity'))
    local gravity = velocity.z > 0 and -sv_gravity or sv_jump_impulse

    for _ = 1, ticks do
        prev_origin = p_origin
        p_origin = vector(
            p_origin.x + (inverted and -(velocity.x * tickinterval) or (velocity.x * tickinterval)),
            p_origin.y + (inverted and -(velocity.y * tickinterval) or (velocity.y * tickinterval)),
            p_origin.z + (inverted and -((velocity.z + gravity) * tickinterval) or (velocity.z + gravity) * tickinterval)
        )

        local fraction = client.trace_line(-1,
            prev_origin.x, prev_origin.y, prev_origin.z,
            p_origin.x, p_origin.y, p_origin.z
        )

        if fraction <= .99 then
            return prev_origin
        end
    end

    return p_origin
end

ai_peek.extend_vector = function(pos, length, angle)
    local rad = math.rad(angle)
    return vector(pos.x + (math.cos(rad) * length), pos.y + (math.sin(rad) * length), pos.z)
end

ai_peek.get_players = function(include_enemies, include_teammates, include_localplayer, include_dormant, include_invisible)
    local result = {}
    local player_resource = entity.get_player_resource()
    local maxplayers = globals.maxplayers()
    local plocal = entity.get_local_player()

    for player = 1, maxplayers do
        local pass = true
        if entity.get_prop(player_resource, \'m_bConnected', player) ~= 1 then pass = false end
        if pass and entity.get_prop(player_resource, 'm_bAlive', player) ~= 1 then pass = false end
        if pass and not include_localplayer and player == plocal then pass = false end

        if pass and include_teammates then
            if not include_enemies and entity.is_enemy(player) then pass = false end
        elseif pass and not entity.is_enemy(player) then
            pass = false
        end

        if pass and not include_dormant and entity.is_dormant(player) then pass = false end
        if pass and not include_invisible and select(5, entity.get_bounding_box(player)) <= 0 then pass = false end

        if pass then result[#result + 1] = player end
    end

    return result
end

local function calc_angle(xdelta, ydelta)
    if xdelta == 0 and ydelta == 0 then return 0 end
    return math.deg(math.atan2(ydelta, xdelta))
end

ai_peek.get_nearest_player = function(players)
    local lp_eyepos = vector(client.eye_position())
    local _, camera_yaw = client.camera_angles()
    local best_enemy, best_fov = nil, 180

    for i = 1, #players do
        local player = players[i]
        local player_origin = ai_peek.get_target_origin(player)
        if player_origin ~= nil then
            local cur_fov = math.abs(normalize_angle(
                calc_angle(lp_eyepos.x - player_origin.x, lp_eyepos.y - player_origin.y) - camera_yaw + 180
            ))

            if cur_fov < best_fov then
                best_fov = cur_fov
                best_enemy = player
            end
        end
    end

    return best_enemy
end

ai_peek.target_alive_enemy = function(player)
    if type(player) ~= \'number' then return false end
    if not entity.is_alive(player) then return false end
    if not entity.is_enemy(player) then return false end
    return true
end

ai_peek.record_age = function(player)
    local rec = ai_peek.cache.record_cache[player]
    if type(rec) ~= 'table\' then return 999 end
    return globals.tickcount() - (rec.tick or 0)
end

ai_peek.record_fresh = function(player, max_ticks)
    if AI_PEEK_DISABLE_BACKTRACK_TEST then return false end
    return ai_peek.record_age(player) <= (max_ticks or AI_PEEK_RECORD_MAX_TICKS)
end

ai_peek.record_limit = function(player)
    if player ~= nil and entity.is_dormant(player) and ai_peek.dormant_peek_enabled() then
        return AI_PEEK_DORMANT_RECORD_TICKS
    end
    return AI_PEEK_RECORD_MAX_TICKS
end

ai_peek.dormant_peek_enabled = function()
    return false
end

ai_peek.dormant_target_allowed = function(player)
    if not ai_peek.dormant_peek_enabled() then return false end
    if not ai_peek.target_alive_enemy(player) then return false end
    if not entity.is_dormant(player) then return false end
    return ai_peek.record_fresh(player, AI_PEEK_DORMANT_RECORD_TICKS)
end

ai_peek.target_valid = function(player)
    if not ai_peek.target_alive_enemy(player) then return false end
    if entity.is_dormant(player) then
        return ai_peek.dormant_target_allowed(player)
    end
    return true
end

ai_peek.update_target_record = function(player)
    if not ai_peek.target_alive_enemy(player) or entity.is_dormant(player) then return end
    local ox, oy, oz = entity.get_origin(player)
    if ox == nil then return end

    local rec = ai_peek.cache.record_cache[player]
    if type(rec) ~= 'table\' then
        rec = { hitboxes = {} }
        ai_peek.cache.record_cache[player] = rec
    end

    local old_hitboxes = rec.hitboxes
    if rec.tick ~= nil and type(old_hitboxes) == \'table\' and rec.origin ~= nil then
        rec.prev_tick = rec.tick
        rec.prev_origin = rec.origin
        rec.prev_velocity = rec.velocity
        rec.prev_hitboxes = old_hitboxes
    end

    rec.tick = globals.tickcount()
    rec.origin = vector(ox, oy, oz)
    local vx, vy, vz = entity.get_prop(player, \'m_vecVelocity')
    rec.velocity = vector(tonumber(vx) or 0, tonumber(vy) or 0, tonumber(vz) or 0)
    rec.dormant = false
    rec.hitboxes = {}

    local scan_hitboxes = ai_peek.build_scan_hitboxes(player, ai_peek.active_hitboxes)
    for i = 1, #scan_hitboxes do
        local hitbox = scan_hitboxes[i]
        local hx, hy, hz = entity.hitbox_position(player, hitbox)
        if hx ~= nil then
            rec.hitboxes[hitbox] = { hx, hy, hz }
        end
    end
end

ai_peek.get_record_hitbox = function(player, hitbox)
    if AI_PEEK_DISABLE_BACKTRACK_TEST then return nil end
    local rec = ai_peek.cache.record_cache[player]
    if type(rec) ~= \'table' or ai_peek.record_age(player) > ai_peek.record_limit(player) then return nil end
    local hp = type(rec.hitboxes) == 'table' and rec.hitboxes[hitbox] or nil
    if type(hp) ~= \'table\' then return nil end
    local age = globals.tickcount() - (rec.tick or globals.tickcount())
    local vel = rec.velocity
    local dt = age * (globals.tickinterval and globals.tickinterval() or (1 / 64))
    local vx, vy, vz = 0, 0, 0
    if vel ~= nil then
        vx, vy, vz = tonumber(vel.x) or 0, tonumber(vel.y) or 0, tonumber(vel.z) or 0
    end
    return hp[1] + vx * dt, hp[2] + vy * dt, hp[3] + vz * dt, age
end

ai_peek.smart_bt_hitbox = function(player, hitbox, hx, hy, hz, status)
    if not AI_PEEK_SMART_BACKTRACK or AI_PEEK_DISABLE_BACKTRACK_TEST then return nil, \'off' end
    if entity.is_dormant(player) then return nil, \'dormant\' end
    if status ~= nil and ((status.invalid == true) or (tonumber(status.risk) or 0) >= 24) then
        return nil, status.reason or \'bt risk\'
    end
    local rec = ai_peek.cache.record_cache[player]
    if type(rec) ~= \'table\' or type(rec.prev_hitboxes) ~= \'table\' or rec.prev_origin == nil then
        return nil, \'no record'
    end
    local age = globals.tickcount() - (rec.prev_tick or 0)
    if age < 1 or age > AI_PEEK_RECORD_MAX_TICKS then return nil, 'record age' end
    local current_origin = ai_peek.get_target_origin(player)
    if current_origin == nil then return nil, \'no origin\' end
    local origin_delta = current_origin:dist2d(rec.prev_origin)
    local z_delta = math.abs((current_origin.z or 0) - (rec.prev_origin.z or 0))
    if origin_delta > AI_PEEK_BT_MAX_DELTA or z_delta > 24 then return nil, \'record moved' end
    local hp = rec.prev_hitboxes[hitbox]
    if type(hp) ~= 'table\' then return nil, \'no hitbox\' end
    local delta = 0
    if hx ~= nil then
        local dx, dy, dz = (hx - hp[1]), (hy - hp[2]), (hz - hp[3])
        delta = math.sqrt(dx * dx + dy * dy + dz * dz)
        if delta > AI_PEEK_BT_MAX_DELTA then return nil, 'hitbox moved' end
    end
    return hp[1], hp[2], hp[3], age, delta, 'ok'
end

ai_peek.get_target_origin = function(player)
    local ox, oy, oz = entity.get_origin(player)
    if ox ~= nil and not entity.is_dormant(player) then
        return vector(ox, oy, oz), 0
    end

    if entity.is_dormant(player) and not ai_peek.dormant_target_allowed(player) then return nil, 999 end
    if AI_PEEK_DISABLE_BACKTRACK_TEST then return nil, 999 end

    local rec = ai_peek.cache.record_cache[player]
    if type(rec) ~= 'table\' or rec.origin == nil or ai_peek.record_age(player) > ai_peek.record_limit(player) then
        return nil, 999
    end

    local age = globals.tickcount() - (rec.tick or globals.tickcount())
    local dt = age * (globals.tickinterval and globals.tickinterval() or (1 / 64))
    local vel = rec.velocity
    local vx, vy, vz = 0, 0, 0
    if vel ~= nil then
        vx, vy, vz = tonumber(vel.x) or 0, tonumber(vel.y) or 0, tonumber(vel.z) or 0
    end
    return vector(rec.origin.x + vx * dt, rec.origin.y + vy * dt, rec.origin.z + vz * dt), age
end

ai_peek.get_enemy_candidates = function()
    local result = ai_peek.cache.enemy_candidates
    for i = 1, #result do result[i] = nil end
    local seen = {}
    local players, count
    if type(get_enemy_cache) == \'function\' then
        players, count = get_enemy_cache()
    else
        local ok
        ok, players = pcall(entity.get_players, true)
        count = ok and type(players) == 'table\' and #players or 0
    end
    if type(players) ~= 'table\' or count == 0 then
        players = ai_peek.get_players(true, false, false, false, true)
        count = #players
    end
    for i = 1, count do
        local player = players[i]
        ai_peek.update_target_record(player)
        if ai_peek.target_valid(player) then
            seen[player] = true
            result[#result + 1] = player
        end
    end
    for player, rec in pairs(ai_peek.cache.record_cache) do
        local record_limit = entity.is_dormant(player) and AI_PEEK_DORMANT_RECORD_TICKS or AI_PEEK_RECORD_MAX_TICKS
        if not AI_PEEK_DISABLE_BACKTRACK_TEST
            and not seen[player] and ai_peek.target_valid(player) and ai_peek.record_fresh(player, record_limit) then
            result[#result + 1] = player
        elseif AI_PEEK_DISABLE_BACKTRACK_TEST
            or (type(rec) == \'table' and ai_peek.record_age(player) > record_limit + 8) then
            ai_peek.cache.record_cache[player] = nil
        end
    end
    return result
end

ai_peek.passive_record_update = function()
    if safe_get(ui_ai.enable, false) ~= true then return end
    if not ai_peek.dormant_peek_enabled() then return end

    local tick = globals.tickcount()
    if tick < (ai_peek.cache.passive_record_next or 0) then return end
    ai_peek.cache.passive_record_next = tick + 2

    local players, count
    if type(get_enemy_cache) == 'function\' then
        players, count = get_enemy_cache()
    else
        local ok
        ok, players = pcall(entity.get_players, true)
        count = ok and type(players) == \'table\' and #players or 0
    end
    if type(players) ~= \'table' then return end
    count = count or #players

    for i = 1, count do
        local player = players[i]
        if ai_peek.target_alive_enemy(player) and not entity.is_dormant(player) then
            ai_peek.update_target_record(player)
        end
    end
end

ai_peek.select_target = function(target_mode)
    if target_mode == 'current threat\' and client.current_threat ~= nil then
        local ok, target = pcall(client.current_threat)
        if ok and ai_peek.target_valid(target) then return target end
    end
    return ai_peek.get_nearest_player(ai_peek.get_enemy_candidates())
end

ai_peek.get_resolver_state = function(target)
    local root = rawget(_G, \'INFINIX\')
    local resolver = type(root) == 'table\' and root.resolver_v2 or nil
    if type(resolver) ~= \'table\' or type(resolver.get_state) ~= 'function\' then return nil end
    local ok, state = pcall(resolver.get_state, target)
    if ok and type(state) == 'table' then return state end
    return nil
end

ai_peek.backtrack_status = function(target)
    local state = ai_peek.get_resolver_state(target)
    local tick = globals.tickcount()
    local status = { state = state, reason = \'clean\', risk = 0, invalid = false, quality = 100 }

    if AI_PEEK_DISABLE_BACKTRACK_TEST then
        status.reason = \'bt_disabled\'
        status.state = nil
        return status
    end

    if state == nil then return status end

    if state.dt_state == \'shifted\' and tick < (state.dt_lagcomp_until or 0) then
        status.reason, status.risk, status.invalid = \'dt_shift', 45, true
    elseif state.defensive_active == true then
        status.reason, status.risk = 'defensive\', 28
    elseif type(state.pred) == \'table' and state.pred.untrusted == true then
        status.reason, status.risk, status.invalid = \'pred_untrusted', 24, true
    elseif (tonumber(state.chokes) or 0) > 3 then
        status.reason, status.risk, status.invalid = \'high_choke', 14, true
    end

    local chokes = tonumber(state.chokes) or 0
    status.quality = math.max(0, math.min(100, 100 - (status.risk or 0) - (chokes * 5)))
    return status
end

ai_peek.predict_delta = function(target, status)
    if AI_PEEK_DISABLE_BACKTRACK_TEST then return nil end
    if AI_PEEK_SMART_BACKTRACK then return nil end
    local pred = rawget(_G, 'infinix_predict_rework\')
    if type(pred) ~= \'table\' or type(pred.predict_origin) ~= 'function' then return nil end
    if type(pred.is_enabled) == \'function' then
        local ok_enabled, enabled = pcall(pred.is_enabled)
        if not ok_enabled or enabled ~= true then return nil end
    end

    local state = status and status.state or nil
    local vx, vy = entity.get_prop(target, \'m_vecVelocity')
    vx, vy = tonumber(vx) or 0, tonumber(vy) or 0
    local speed = math.sqrt(vx * vx + vy * vy)
    local ticks = 1 + math.min(8, math.max(0, tonumber(state and state.chokes) or 0) + math.floor(speed / 120))
    if status and status.invalid then ticks = math.max(ticks, 4) end

    local ok, prediction = pcall(pred.predict_origin, target, ticks, {
        purpose = \'ai_peek\',
        max_ticks = ticks,
        allow_untrusted = false,
    })
    local min_confidence = speed > 220 and 0.16 or 0.22
    if not ok or type(prediction) ~= 'table\' or (prediction.confidence or 0) < min_confidence then return nil end

    local ox, oy, oz = entity.get_origin(target)
    if ox == nil then return nil end

    return prediction.x - ox, prediction.y - oy, prediction.z - oz, prediction.confidence
end

ai_peek.trace_damage = function(local_player, pos, target, hitbox, hx, hy, hz)
    local tick = globals.tickcount()
    local cache = ai_peek.cache.trace_cache
    local edge_confirm = ai_peek.cache.edge_trace_confirm
    if type(edge_confirm) ~= 'table' then
        edge_confirm = {}
        ai_peek.cache.edge_trace_confirm = edge_confirm
    end
    if ai_peek.cache.trace_tick ~= tick then
        for k in pairs(cache) do cache[k] = nil end
        for k, seen_tick in pairs(edge_confirm) do
            if tick - (tonumber(seen_tick) or 0) > 8 then
                edge_confirm[k] = nil
            end
        end
        ai_peek.cache.trace_tick = tick
    end
    local key = tostring(target) .. \':\' .. tostring(hitbox) .. \':\'
        .. tostring(math.floor((pos.x or 0) + 0.5)) .. \','
        .. tostring(math.floor((pos.y or 0) + 0.5)) .. \','
        .. tostring(math.floor((pos.z or 0) + 0.5)) .. \'>\'
        .. tostring(math.floor((hx or 0) + 0.5)) .. \','
        .. tostring(math.floor((hy or 0) + 0.5)) .. ',\'
        .. tostring(math.floor((hz or 0) + 0.5))
    local cached = cache[key]
    if cached ~= nil then return cached end
    local ok, hit_entity, damage = pcall(
        client.trace_bullet,
        local_player,
        pos.x, pos.y, pos.z,
        hx, hy, hz,
        false
    )
    local result = 0
    damage = tonumber(damage) or 0
    local dormant_record = ai_peek.dormant_target_allowed(target)
    if ok and damage > 0 and hit_entity == target then
        result = damage
    elseif ok and damage > 0 and dormant_record
        and (hit_entity == nil or hit_entity == 0) then
        result = damage
    elseif ok and damage > 0 and not AI_PEEK_STRICT_LIVE_TRACE_TEST
        and (hit_entity == nil or hit_entity == 0) then
        result = damage
    elseif ok and damage > 0 and AI_PEEK_STRICT_LIVE_TRACE_TEST
        and (hit_entity == nil or hit_entity == 0) then
        local confirm_key = \'edge:' .. key
        local last_seen = tonumber(edge_confirm[confirm_key]) or 0
        edge_confirm[confirm_key] = tick
        if tick - last_seen <= 2 then
            result = damage
        end
    end
    cache[key] = result
    return result
end

ai_peek.point_exposure_penalty = function(pos, target, include_target)
    if pos == nil then return 0 end
    local tick = globals.tickcount()
    local cache = ai_peek.cache.exposure_cache
    if ai_peek.cache.exposure_tick ~= tick then
        for k in pairs(cache) do cache[k] = nil end
        ai_peek.cache.exposure_tick = tick
    end

    local key = tostring(target) .. \':' .. (include_target and \'1:' or \'0:')
        .. tostring(math.floor((pos.x or 0) + 0.5)) .. ',\'
        .. tostring(math.floor((pos.y or 0) + 0.5)) .. ',\'
        .. tostring(math.floor((pos.z or 0) + 0.5))
    local cached = cache[key]
    if cached ~= nil then return cached end

    local enemies = ai_peek.cache.exposure_enemies
    if type(enemies) ~= \'table\' then
        cache[key] = 0
        return 0
    end

    local profile = ai_peek.peek_profile or AI_PEEK_DISTANCE_PROFILES.aggressive
    local max_checks = (tonumber(ai_peek.cache.enemy_count) or 0) >= 5 and 2 or 3
    if include_target and target ~= nil and target ~= 0 then
        max_checks = max_checks + 1
    end
    local checks, exposed = 0, 0
    local px, py, pz = pos.x, pos.y, pos.z or 0
    local local_heights = { 58, 44, 32 }

    local function check_enemy_exposure(enemy)
        if checks >= max_checks or not ai_peek.target_valid(enemy) then return end
        local ex, ey, ez = entity.hitbox_position(enemy, 0)
        if ex ~= nil then
            checks = checks + 1
            for h = 1, #local_heights do
                local fraction = client.trace_line(enemy, ex, ey, ez, px, py, pz + local_heights[h]) or 0
                if fraction > 0.96 then
                    exposed = exposed + (h == 1 and 1 or 2)
                    break
                end
            end
        end
    end

    if include_target and target ~= nil and target ~= 0 then
        check_enemy_exposure(target)
    end

    for i = 1, #enemies do
        if checks >= max_checks then break end
        local enemy = enemies[i]
        if enemy ~= target or not include_target then
            check_enemy_exposure(enemy)
        end
    end

    local penalty = exposed * (profile.exposure_penalty or 8)
    cache[key] = penalty
    return penalty
end

ai_peek.point_is_safe = function(pos, target, profile)
    profile = profile or ai_peek.peek_profile or AI_PEEK_DISTANCE_PROFILES.aggressive
    local exposure = ai_peek.point_exposure_penalty(pos, target)
    return exposure <= (profile.hard_exposure or profile.max_exposure or 24), exposure
end

ai_peek.point_line_open = function(local_player, pos, target, hx, hy, hz)
    if pos == nil or hx == nil then return false end
    local ok, fraction, hit_ent = pcall(client.trace_line, local_player, pos.x, pos.y, pos.z, hx, hy, hz)
    if not ok then return false end
    fraction = tonumber(fraction) or 0
    return fraction > 0.965 or hit_ent == target
end

ai_peek.wall_commit_damage = function(profile, required_damage, target_health)
    required_damage = math.max(1, tonumber(required_damage) or 1)
    target_health = math.max(1, tonumber(target_health) or required_damage)
    local ratio = tonumber(profile and profile.wall_min_ratio) or 0.60
    local margin = tonumber(profile and profile.wall_damage_margin) or 8
    local by_health = math.floor(target_health * ratio + 0.5)
    local by_min_damage = required_damage + margin
    if target_health <= required_damage then
        return required_damage
    end
    return math.min(target_health, math.max(required_damage, by_health, by_min_damage))
end

ai_peek.handle_point = function(position, prev_position, angle, step_distance, index, view_offset, vec_mins, vec_maxs, max_step)
    local start_pos = prev_position and (prev_position - view_offset) or position
    local pos = ai_peek.extend_vector(start_pos, index == 0 and 0 or step_distance, angle)

    local trace_up = trace.hull(
        start_pos,
        start_pos + vector(0, 0, max_step),
        vec_mins,
        vec_maxs,
        { skip = ai_peek.skip_func, mask = 0x201400B }
    ).end_pos

    local trace_horizontal = trace.hull(
        vector(start_pos.x, start_pos.y, trace_up.z),
        vector(pos.x, pos.y, trace_up.z),
        vec_mins,
        vec_maxs,
        { skip = ai_peek.skip_func, mask = 0x201400B }
    ).end_pos

    if pos:dist2d(trace_horizontal) >= step_distance * .97
        and start_pos:dist2d(trace_horizontal) < 8 then
        return false
    end

    local trace_down = trace.hull(
        trace_horizontal,
        vector(trace_horizontal.x, trace_horizontal.y, position.z - 240),
        vec_mins,
        vec_maxs,
        { skip = ai_peek.skip_func, mask = 0x201400B }
    ).end_pos

    if (start_pos.z or position.z) - (trace_down.z or position.z) > max_step then
        return false
    end

    return trace_down + view_offset
end

local max_step = 18

ai_peek.points_cache_valid = function(position, angle, amount, step_distance)
    local c = ai_peek.cache
    local tick = globals.tickcount()
    if c.points_origin == nil then return false end
    if tick - (c.points_tick or 0) > 2 then return false end
    if c.points_amount ~= amount or c.points_step ~= step_distance then return false end
    if math.abs(normalize_angle(angle - (c.points_angle or angle))) > 3 then return false end
    if c.points_origin:dist2d(position) > 2 then return false end
    if math.abs((c.points_origin.z or 0) - (position.z or 0)) > 4 then return false end
    return true
end

ai_peek.setup_points = function(local_player, position, angle, amount, step_distance)
    if ai_peek.points_cache_valid(position, angle, amount, step_distance) then
        return ai_peek.cache.positions
    end

    for k in pairs(ai_peek.cache.positions) do
        ai_peek.cache.positions[k] = nil
    end

    local view_offset = vector(entity.get_prop(local_player, \'m_vecViewOffset'))
    local vec_mins = vector(entity.get_prop(local_player, 'm_vecMins'))
    local vec_maxs = vector(entity.get_prop(local_player, \'m_vecMaxs'))
    local slot = 1
    local profile = ai_peek.peek_profile or AI_PEEK_DISTANCE_PROFILES.aggressive
    local adaptive_extra = math.max(0, math.floor(tonumber(profile.adaptive_extra) or 0))
    local chain_amount = math.max(amount, amount + adaptive_extra)

    ai_peek.cache.positions[0] = ai_peek.handle_point(
        position, nil, 0, step_distance, 0, view_offset, vec_mins, vec_maxs, max_step
    )

    if AI_PEEK_LEGACY_SAFE_CORE then
        local mode = profile.distance_mode or \'adaptive\'
        local tiers = {}
        if mode == \'adaptive\' then
            tiers[#tiers + 1] = { amount = profile.short_tier_amount or 3, step = profile.short_tier_step or 28 }
            tiers[#tiers + 1] = { amount = profile.medium_tier_amount or 3, step = profile.medium_tier_step or step_distance }
            if (profile.long_tier_amount or 0) > 0 then
                tiers[#tiers + 1] = { amount = profile.long_tier_amount or 2, step = profile.long_tier_step or step_distance }
            end
        else
            tiers[#tiers + 1] = { amount = amount, step = step_distance }
        end

        local out_index = 1
        local left_prev = ai_peek.cache.positions[0]
        local right_prev = ai_peek.cache.positions[0]
        for t = 1, #tiers do
            local spec = tiers[t]
            for i = 1, spec.amount do
                local side_left = i % 2 == 1
                local prev_point = side_left and left_prev or right_prev
                local side_angle = side_left and angle + 90 or angle - 90
                if prev_point then
                    local point = ai_peek.handle_point(
                        position, prev_point, side_angle, spec.step, out_index, view_offset, vec_mins, vec_maxs, max_step
                    )
                    if not point or math.abs(prev_point.z - point.z) > max_step then
                        if side_left then left_prev = nil else right_prev = nil end
                    else
                        ai_peek.cache.positions[out_index] = point
                        out_index = out_index + 1
                        if side_left then left_prev = point else right_prev = point end
                    end
                end
            end
        end

        ai_peek.cache.points_tick = globals.tickcount()
        ai_peek.cache.points_angle = angle
        ai_peek.cache.points_origin = vector(position.x, position.y, position.z)
        ai_peek.cache.points_amount = amount
        ai_peek.cache.points_generated = out_index - 1
        ai_peek.cache.points_step = step_distance

        return ai_peek.cache.positions
    end

    local function add_candidate(point)
        if point then
            ai_peek.cache.positions[slot] = point
            slot = slot + 1
        end
    end

    if profile.model_peek == true then
        local model_step = math.max(8, math.min(18, tonumber(profile.step) or step_distance or 14))
        local close_specs = {
            { angle + 90, model_step },
            { angle - 90, model_step },
            { angle + 72, model_step * 0.75 },
            { angle - 72, model_step * 0.75 },
            { angle + 108, model_step * 0.75 },
            { angle - 108, model_step * 0.75 },
        }

        for i = 1, #close_specs do
            local spec = close_specs[i]
            add_candidate(ai_peek.handle_point(
                position, nil, spec[1], spec[2], 1, view_offset, vec_mins, vec_maxs, max_step
            ))
        end

        ai_peek.cache.points_tick = globals.tickcount()
        ai_peek.cache.points_angle = angle
        ai_peek.cache.points_origin = vector(position.x, position.y, position.z)
        ai_peek.cache.points_amount = amount
        ai_peek.cache.points_generated = slot - 1
        ai_peek.cache.points_step = step_distance

        return ai_peek.cache.positions
    end

    local frontier_mid = step_distance * (amount + 0.5)
    local frontier_full = step_distance * chain_amount
    local priority_specs = {
        { angle + 90, step_distance },
        { angle - 90, step_distance },
        { angle + 90, frontier_mid },
        { angle - 90, frontier_mid },
        { angle + 90, frontier_full },
        { angle - 90, frontier_full },
    }
    for i = 1, #priority_specs do
        local spec = priority_specs[i]
        add_candidate(ai_peek.handle_point(
            position, nil, spec[1], spec[2], i, view_offset, vec_mins, vec_maxs, max_step
        ))
    end

    local micro_step = math.max(14, math.min(24, step_distance * 0.50))
    local micro_specs = {
        { angle + 90, micro_step },
        { angle - 90, micro_step },
        { angle + 58, micro_step },
        { angle - 58, micro_step },
    }
    for i = 1, #micro_specs do
        local spec = micro_specs[i]
        add_candidate(ai_peek.handle_point(
            position, nil, spec[1], spec[2], 1, view_offset, vec_mins, vec_maxs, max_step
        ))
    end

    local adaptive_specs = {
        { angle + 90, step_distance * 0.45 },
        { angle - 90, step_distance * 0.45 },
        { angle + 74, step_distance * 0.70 },
        { angle - 74, step_distance * 0.70 },
        { angle + 106, step_distance * 0.70 },
        { angle - 106, step_distance * 0.70 },
    }
    for i = 1, #adaptive_specs do
        local spec = adaptive_specs[i]
        add_candidate(ai_peek.handle_point(
            position, nil, spec[1], spec[2], 1, view_offset, vec_mins, vec_maxs, max_step
        ))
    end

    for i = 1, chain_amount do
        local half_step = step_distance * (i - 0.5)
        if half_step > 0 then
            add_candidate(ai_peek.handle_point(
                position, nil, angle + 90, half_step, i, view_offset, vec_mins, vec_maxs, max_step
            ))
            add_candidate(ai_peek.handle_point(
                position, nil, angle - 90, half_step, i, view_offset, vec_mins, vec_maxs, max_step
            ))
        end
    end

    for side = 1, 2 do
        local side_angle = side == 1 and angle + 90 or angle - 90
        local prev_point = nil
        for i = 1, chain_amount do
            local point = ai_peek.handle_point(
                position, prev_point, side_angle, step_distance, i, view_offset, vec_mins, vec_maxs, max_step
            )
            if not point or (prev_point and math.abs(prev_point.z - point.z) > max_step) then
                break
            end
            add_candidate(point)
            prev_point = point
        end
    end

    ai_peek.cache.points_tick = globals.tickcount()
    ai_peek.cache.points_angle = angle
    ai_peek.cache.points_origin = vector(position.x, position.y, position.z)
    ai_peek.cache.points_amount = amount
    ai_peek.cache.points_generated = slot - 1
    ai_peek.cache.points_step = step_distance

    return ai_peek.cache.positions
end

local function get_ai_rage_decision()
    if INFINIX_EMBED and type(INFINIX_EMBED.rage_decision) == \'table\' then
        return INFINIX_EMBED.rage_decision
    end
    local root = rawget(_G, \'INFINIX\')
    return type(root) == \'table' and root.rage_decision or nil
end

local function safe_ai_plist_get(player, key)
    if plist == nil or type(plist.get) ~= \'function\' then return nil end
    local ok, value = pcall(plist.get, player, key)
    if ok then return value end
    return nil
end

local function ai_peek_min_damage_override()
    local active, value = false, nil
    local list = refs.minimum_damage_override
    if type(list) ~= \'table' then return false, nil end

    for i = 1, #list do
        local ref = list[i]
        local ok_type, typ = pcall(ui.type, ref)
        local current = safe_get(ref)
        if ok_type and typ == \'hotkey\' then
            if current == true then active = true end
        elseif type(current) == \'number' then
            value = current
        elseif type(current) == \'boolean\' and current == true then
            active = true
        end
    end

    return active, value
end

ai_peek.damage_policy = function(target)
    local target_health = tonumber(entity.get_prop(target, 'm_iHealth\')) or 100
    if target_health < 1 then target_health = 100 end

    local minimum_damage = tonumber(safe_get(refs.minimum_damage)) or 1
    local source, owner, reason, priority = \'global\', nil, nil, nil

    local rd = get_ai_rage_decision()
    local owned_damage = false
    if rd ~= nil and type(rd.peek_key) == \'function\' then
        local value, req_owner, req_reason, req_priority = rd.peek_key(target, \'Minimum damage')
        value = tonumber(value)
        if value ~= nil and value > 0 then
            minimum_damage = value
            source, owner, reason, priority = \'rage_decision', req_owner, req_reason, req_priority
            owned_damage = true
        end
    end

    if not owned_damage then
        local plist_damage = tonumber(safe_ai_plist_get(target, \'Minimum damage\'))
        if plist_damage ~= nil and plist_damage > 0 then
            minimum_damage = plist_damage
            source = 'plist'
        end
    end

    local override_active, override_damage = ai_peek_min_damage_override()
    if override_active == true then
        override_damage = tonumber(override_damage)
        if override_damage ~= nil and override_damage > 0 then
            minimum_damage = override_damage
            source, owner, reason, priority = \'hotkey\', \'user\', \'minimum damage override\', 100
        else
            source, owner, reason, priority = \'hotkey_missing_value\', 'user\', \'minimum damage override\', 100
        end
    end

    if minimum_damage < 1 then
        minimum_damage = 1
        source = 'fallback\'
    end

    local required_damage = math.min(minimum_damage, target_health)
    return {
        minimum_damage = minimum_damage,
        required_damage = required_damage,
        target_health = target_health,
        source = source,
        owner = owner,
        reason = reason,
        priority = priority,
    }
end

ai_peek.trace_enemy = function(positions, local_player, target, hitboxes)
    local damage_policy = ai_peek.damage_policy(target)
    local target_health = damage_policy.target_health
    local required_damage = damage_policy.required_damage
    local status = ai_peek.backtrack_status(target)
    local pdx, pdy, pdz, pconf = nil, nil, nil, nil
    local pred_checked = false
    local hitbox_points = ai_peek.cache.hitbox_points
    local hitbox_count = 0
    local best_pos, best_index, best_score, best_damage = nil, 0, -9999, 0
    local best_live_damage, best_pred_damage, best_bt_delta = 0, 0, 0
    local best_commit_kind = 'none\'
    local enemy_count = tonumber(ai_peek.cache.enemy_count) or 0
    local profile = ai_peek.peek_profile or AI_PEEK_DISTANCE_PROFILES.aggressive
    local tvx, tvy = entity.get_prop(target, \'m_vecVelocity')
    if tvx == nil then
        local rec = ai_peek.cache.record_cache[target]
        local vel = type(rec) == \'table' and rec.velocity or nil
        tvx, tvy = vel and vel.x or 0, vel and vel.y or 0
    end
    tvx, tvy = tonumber(tvx) or 0, tonumber(tvy) or 0
    local target_speed = math.sqrt(tvx * tvx + tvy * tvy)
    local trace_budget = enemy_count >= 5 and AI_PEEK_TRACE_BUDGET_MANY
        or (enemy_count >= 3 and AI_PEEK_TRACE_BUDGET_BUSY or AI_PEEK_TRACE_BUDGET)
    local perf_level = tonumber(rawget(_G, \'INFINIX_PERF_LEVEL\')) or 0
    if perf_level >= 2 then
        trace_budget = math.min(trace_budget, 18)
    elseif perf_level >= 1 or globals.tickcount() < (rawget(_G, \'INFINIX_PERF_STRESS_UNTIL\') or 0) then
        trace_budget = math.min(trace_budget, 22)
    end

    ai_peek.cache.bt_state = status.reason
    ai_peek.cache.bt_risk = status.risk
    ai_peek.cache.bt_quality = status.quality or 100
    ai_peek.cache.bt_delta = 0
    ai_peek.cache.bt_candidate_damage = 0
    ai_peek.cache.bt_allowed = false
    ai_peek.cache.bt_reject_reason = \'no bt'
    ai_peek.cache.live_vs_bt_delta = 0
    ai_peek.cache.commit_kind = \'none\'
    ai_peek.cache.live_damage = 0
    ai_peek.cache.pred_damage = 0
    ai_peek.cache.target_exposure = 0
    ai_peek.cache.minimum_damage = damage_policy.minimum_damage
    ai_peek.cache.required_damage = required_damage
    ai_peek.cache.damage_source = damage_policy.source
    ai_peek.cache.target_health = target_health

    local scan_hitboxes = ai_peek.build_scan_hitboxes(target, hitboxes)
    for j = 1, #scan_hitboxes do
        local hitbox = scan_hitboxes[j]
        local hx, hy, hz = entity.hitbox_position(target, hitbox)
        if hx == nil and (not AI_PEEK_SMART_BACKTRACK or ai_peek.dormant_target_allowed(target)) then
            hx, hy, hz = ai_peek.get_record_hitbox(target, hitbox)
        end
        if hx ~= nil then
            hitbox_count = hitbox_count + 1
            local hp = hitbox_points[hitbox_count]
            if hp == nil then
                hp = {}
                hitbox_points[hitbox_count] = hp
            end
            hp[1], hp[2], hp[3], hp[4] = hitbox, hx, hy, hz
        end
    end

    if hitbox_count == 0 then
        ai_peek.cache.trace_damage = 0
        ai_peek.cache.live_damage = 0
        ai_peek.cache.pred_damage = 0
        ai_peek.cache.commit_kind = \'none\'
        ai_peek.cache.bt_delta = 0
        ai_peek.cache.bt_candidate_damage = 0
        ai_peek.cache.bt_allowed = false
        ai_peek.cache.bt_reject_reason = 'no hitbox'
        ai_peek.cache.live_vs_bt_delta = 0
        ai_peek.cache.damage_gap = required_damage
        return nil, 0, 0, -9999, status, damage_policy, 0, 0, \'none\', 0, status.quality or 100
    end

    local primary_count = math.min(hitbox_count, target_speed > 180 and 5 or 3)
    for pass = 1, 2 do
        local first_hitbox = pass == 1 and 1 or primary_count + 1
        local last_hitbox = pass == 1 and primary_count or hitbox_count
        if first_hitbox <= last_hitbox then
            for i = 0, #positions do
                if trace_budget <= 0 then break end
                local pos = positions[i]
                if pos then
                    local safe_point, exposure_penalty = ai_peek.point_is_safe(pos, target, profile)
                    if not safe_point then
                        ai_peek.cache.last_reason = \'exposed point\'
                        exposure_penalty = exposure_penalty + (profile.exposure_penalty or 8)
                    end
                    local origin_pos = ai_peek.cache.middle_pos or positions[0] or pos
                    local move_dist = origin_pos and origin_pos:dist2d(pos) or (i * 18)
                    local move_penalty = math.floor(move_dist / 24) * ((status.invalid and 3 or 2) + (profile.index_penalty or 3))
                    if move_dist < 2 then move_penalty = 0 end
                    for j = first_hitbox, last_hitbox do
                        if trace_budget <= 0 then break end
                        local hp = hitbox_points[j]
                        local hitbox, hx, hy, hz = hp[1], hp[2], hp[3], hp[4]
                        trace_budget = trace_budget - 1
                        local live_damage = ai_peek.trace_damage(local_player, pos, target, hitbox, hx, hy, hz)
                        local bt_damage, bt_delta, bt_reason = 0, 0, \'no live'
                        if AI_PEEK_SMART_BACKTRACK and trace_budget > 0 and live_damage > 0 then
                            local bx, by, bz, _, rec_delta, rec_reason = ai_peek.smart_bt_hitbox(target, hitbox, hx, hy, hz, status)
                            bt_reason = rec_reason or bt_reason
                            if bx ~= nil then
                                trace_budget = trace_budget - 1
                                bt_delta = tonumber(rec_delta) or 0
                                bt_damage = ai_peek.trace_damage(local_player, pos, target, hitbox, bx, by, bz)
                                if bt_damage > (ai_peek.cache.bt_candidate_damage or 0) then
                                    ai_peek.cache.bt_candidate_damage = bt_damage
                                    ai_peek.cache.live_vs_bt_delta = bt_delta
                                    ai_peek.cache.bt_allowed = live_damage >= required_damage
                                    ai_peek.cache.bt_reject_reason = live_damage >= required_damage and 'confirmed' or \'live below required\'
                                end
                            elseif (ai_peek.cache.bt_candidate_damage or 0) <= 0 then
                                ai_peek.cache.bt_reject_reason = bt_reason
                            end
                        end
                        local pred_damage = 0
                        if status.risk > 0 or live_damage < required_damage then
                            if not pred_checked then
                                pdx, pdy, pdz, pconf = ai_peek.predict_delta(target, status)
                                pred_checked = true
                            end
                            if pdx ~= nil and trace_budget > 0 then
                                trace_budget = trace_budget - 1
                                pred_damage = ai_peek.trace_damage(local_player, pos, target, hitbox, hx + pdx, hy + pdy, hz + pdz)
                            end
                        end

                        local pred_delta = 0
                        if pdx ~= nil then
                            pred_delta = math.sqrt((pdx * pdx) + (pdy * pdy) + (pdz * pdz))
                            if pred_delta > bt_delta then bt_delta = pred_delta end
                        end
                        local pred_only_bait = pred_damage >= required_damage and live_damage < required_damage
                        local open_line = live_damage > 0 and ai_peek.point_line_open(local_player, pos, target, hx, hy, hz)
                        local wall_required = ai_peek.wall_commit_damage(profile, required_damage, target_health)
                        local wall_damage_ok = open_line or live_damage >= wall_required
                        local early_ratio = tonumber(profile.early_live_ratio) or 0.55
                        local visible_ratio = tonumber(profile.early_visible_ratio) or early_ratio
                        local visible_early_floor = math.max(8, math.floor(required_damage * visible_ratio))
                        local early_damage = AI_PEEK_LEGACY_SAFE_CORE
                            and live_damage > 0
                            and live_damage >= math.max(8, math.floor(required_damage * early_ratio))
                        if not AI_PEEK_LEGACY_SAFE_CORE and live_damage > 0 then
                            if open_line then
                                early_damage = live_damage >= visible_early_floor
                            elseif profile.allow_wall_early == true then
                                early_damage = live_damage >= math.max(wall_required, math.floor(required_damage * early_ratio))
                            else
                                early_damage = false
                            end
                        end

                        if AI_PEEK_SMART_BACKTRACK and bt_damage >= required_damage and live_damage < required_damage then
                            ai_peek.cache.last_reason = 'bt bait blocked\'
                            ai_peek.cache.bt_reject_reason = \'live below required\'
                        elseif pred_only_bait then
                            ai_peek.cache.last_reason = status.risk > 0 and 'bt bait guard\' or \'prediction guard\'
                        elseif (live_damage >= required_damage and wall_damage_ok) or early_damage then
                            local score = live_damage - move_penalty
                            if live_damage < required_damage then
                                score = score - 14 - math.floor((required_damage - live_damage) * 0.45)
                            end
                            if not open_line then
                                score = score - (profile.wall_penalty or 8)
                            end
                            if hitbox == 0 then score = score + 8 end
                            if live_damage >= target_health then score = score + 18 end
                            score = score + 8
                            if pred_damage >= required_damage then score = score + math.min(8, 2 + math.floor((pconf or 0) * 8)) end
                            if bt_damage >= required_damage then score = score + math.min(6, 2 + math.floor((status.quality or 100) / 25)) end
                            if pred_damage > 0 and pred_damage < required_damage then score = score + 1 end
                            score = score - exposure_penalty
                            if status.invalid then score = score - math.floor((status.risk or 0) * 0.35) end
                            if pred_damage > live_damage then score = score - math.min(10, math.floor((pred_damage - live_damage) * 0.20)) end
                            if bt_delta > 28 then score = score - math.min(18, math.floor((bt_delta - 28) * 0.35)) end
                            if status.reason == \'defensive' and hitbox == 0 then score = score - 6 end
                            if status.reason == \'high_choke\' and pred_damage <= 0 and live_damage < (required_damage + 10) then
                                score = score - 10
                            end
                            if score > best_score then
                                best_score = score
                                best_pos = pos
                                best_index = i
                                best_damage = live_damage
                                best_live_damage = live_damage
                                best_pred_damage = pred_damage
                                best_bt_delta = bt_delta
                                best_commit_kind = live_damage >= required_damage
                                    and (bt_damage >= required_damage and \'real_bt_confirmed\'
                                        or (pred_damage >= required_damage and \'real_assisted\' or 'real\'))
                                    or \'early_live\'
                            end
                        end
                    end
                end
            end
        end
        if trace_budget <= 0 then break end
    end

    if best_pos ~= nil and best_score < (profile.min_score or -4) then
        ai_peek.cache.last_reason = \'low score accepted\'
    end

    ai_peek.cache.trace_damage = best_live_damage
    ai_peek.cache.live_damage = best_live_damage
    ai_peek.cache.pred_damage = best_pred_damage
    ai_peek.cache.commit_kind = best_commit_kind
    ai_peek.cache.bt_delta = best_bt_delta
    ai_peek.cache.bt_quality = status.quality or 100
    ai_peek.cache.damage_gap = math.max(0, required_damage - (best_damage or 0))
    return best_pos, best_index, best_damage, best_score, status, damage_policy,
        best_live_damage, best_pred_damage, best_commit_kind, best_bt_delta, status.quality or 100
end

ai_peek.weapon_can_fire = function(player, weapon)
    if player == nil or weapon == nil then return false end

    local next_attack = tonumber(entity.get_prop(player, \'m_flNextAttack\')) or 0
    local next_primary = tonumber(entity.get_prop(weapon, 'm_flNextPrimaryAttack')) or 0
    local clip = tonumber(entity.get_prop(weapon, \'m_iClip1\'))

    if math.max(0, next_attack, next_primary) > globals.curtime() or (clip ~= nil and clip <= 0) then
        return false
    end

    return true
end

ai_peek.commit_ready = function(player, weapon)
    if player == nil or weapon == nil then return false, 'no weapon\' end

    local clip = tonumber(entity.get_prop(weapon, \'m_iClip1'))
    if clip ~= nil and clip <= 0 then return false, \'empty' end
    if entity.get_prop(weapon, \'m_bInReload\') == 1 then return false, \'reload' end

    local next_attack = tonumber(entity.get_prop(player, \'m_flNextAttack')) or 0
    local next_primary = tonumber(entity.get_prop(weapon, 'm_flNextPrimaryAttack\')) or 0
    if math.max(0, next_attack, next_primary) > globals.curtime() then
        return false, \'weapon wait'
    end

    local velocity_modifier = tonumber(entity.get_prop(player, \'m_flVelocityModifier\'))
    if velocity_modifier ~= nil and velocity_modifier < .86 then
        return false, \'velocity\'
    end

    if safe_get(refs.double_tap[2], false) and not exploits:can_recharge() then
        return false, 'dt recharge\'
    end

    return true, \'ready\'
end

ai_peek.weapon_ready_ticks = function(player, weapon)
    if player == nil or weapon == nil then return 999 end

    local next_attack = tonumber(entity.get_prop(player, \'m_flNextAttack')) or 0
    local next_primary = tonumber(entity.get_prop(weapon, 'm_flNextPrimaryAttack')) or 0
    local ready_at = math.max(0, next_attack, next_primary)
    local wait = ready_at - globals.curtime()
    if wait <= 0 then return 0 end

    local ti = globals.tickinterval and globals.tickinterval() or (1 / 64)
    return math.ceil(wait / ti)
end

ai_peek.target_retreating_from = function(target, reference_pos)
    if target == nil or reference_pos == nil then return false, 0, 0 end
    local origin = ai_peek.get_target_origin(target)
    if origin == nil then return false, 0, 0 end

    local vx, vy = entity.get_prop(target, \'m_vecVelocity\')
    if vx == nil then
        local rec = ai_peek.cache.record_cache[target]
        local vel = type(rec) == \'table' and rec.velocity or nil
        vx, vy = vel and vel.x or 0, vel and vel.y or 0
    end
    vx, vy = tonumber(vx) or 0, tonumber(vy) or 0
    local speed = math.sqrt(vx * vx + vy * vy)
    if speed < 90 then return false, speed, 0 end

    local dx, dy = (origin.x or 0) - (reference_pos.x or 0), (origin.y or 0) - (reference_pos.y or 0)
    local len = math.sqrt(dx * dx + dy * dy)
    if len < 1 then return false, speed, 0 end

    local away = (vx * dx + vy * dy) / (speed * len)
    return away > 0.38, speed, away
end

ai_peek.target_gate = function(local_player, target)
    local gate = {
        hard = false,
        traceable = true,
        penalty = 0,
        wait_ticks = 0,
        reason = \'ok',
    }

    if not target then
        gate.hard, gate.traceable, gate.reason = true, false, \'no target'
        return gate
    end

    local weapon = entity.get_player_weapon(local_player)
    if weapon == nil then
        gate.hard, gate.traceable, gate.reason = true, false, \'no weapon'
        return gate
    end

    local clip = tonumber(entity.get_prop(weapon, \'m_iClip1\'))
    if clip ~= nil and clip <= 0 then
        gate.hard, gate.traceable, gate.reason = true, false, \'empty\'
        return gate
    end

    local wait_ticks = ai_peek.weapon_ready_ticks(local_player, weapon)
    gate.wait_ticks = wait_ticks
    if AI_PEEK_LEGACY_SAFE_CORE and wait_ticks > 0 then
        if wait_ticks > 14 then
            gate.hard, gate.traceable, gate.reason = true, false, \'weapon wait\'
            return gate
        end
        gate.penalty = gate.penalty + wait_ticks * 2
        gate.reason = \'weapon soon'
    elseif wait_ticks > 0 then
        local profile = ai_peek.peek_profile or AI_PEEK_DISTANCE_PROFILES.aggressive
        local start_wait_ticks = profile.start_wait_ticks or 1
        if wait_ticks > start_wait_ticks then
            gate.hard, gate.traceable, gate.reason = true, false, wait_ticks > 14 and \'weapon wait' or \'weapon not ready'
            return gate
        end
        if wait_ticks > 36 then
            gate.penalty = gate.penalty + 42
        elseif wait_ticks > 14 then
            gate.penalty = gate.penalty + 22 + math.floor((wait_ticks - 14) * 0.8)
        else
            gate.penalty = gate.penalty + wait_ticks * 2
        end
        gate.reason = wait_ticks > 14 and 'prepeek wait\' or \'weapon soon\'
    end

    local scope_weapons = {
        CWeaponSSG08 = true,
        CWeaponAWP = true,
        CWeaponG3SG1 = true,
        CWeaponSCAR20 = true,
    }

    if not safe_get(refs.auto_scope, false) and scope_weapons[entity.get_classname(weapon)] then
        if entity.get_prop(local_player, \'m_bIsScoped\') ~= 1 then
            gate.penalty = gate.penalty + 18
            gate.reason = \'scope\'
        end
    end

    if safe_get(refs.double_tap[2], false) and not exploits:can_recharge() then
        gate.penalty = gate.penalty + 14
        gate.reason = \'dt prepeek'
    end

    local velocity_modifier = tonumber(entity.get_prop(local_player, 'm_flVelocityModifier\'))
    if velocity_modifier ~= nil and velocity_modifier < .98 then
        if velocity_modifier < .86 then
            gate.penalty = gate.penalty + 28
            gate.reason = \'slowdown'
        else
            gate.penalty = gate.penalty + 12
            gate.reason = \'velmod\'
        end
    end

    local esp_data = entity.get_esp_data(target)
    local alpha = tonumber(esp_data and esp_data.alpha) or 1
    if alpha < .18 then
        gate.penalty = gate.penalty + 18
        gate.reason = \'low alpha'
    elseif alpha < .75 then
        gate.penalty = gate.penalty + math.floor((.75 - alpha) * 24)
        gate.reason = 'low alpha\'
    end

    return gate
end

ai_peek.can_target = function(local_player, target)
    local gate = ai_peek.target_gate(local_player, target)
    return gate.hard ~= true and gate.traceable == true
end

ai_peek.get_current_threat = function()
    if client.current_threat == nil then return nil end
    local ok, target = pcall(client.current_threat)
    if ok and ai_peek.target_valid(target) then return target end
    return nil
end

ai_peek.peek_intent_score = function(target, middle_pos)
    local target_origin = ai_peek.get_target_origin(target)
    if target_origin == nil then return 0 end
    local tx, ty = target_origin.x, target_origin.y

    local vx, vy = entity.get_prop(target, \'m_vecVelocity')
    if vx == nil then
        local rec = ai_peek.cache.record_cache[target]
        local vel = type(rec) == 'table' and rec.velocity or nil
        vx, vy = vel and vel.x or 0, vel and vel.y or 0
    end
    vx, vy = tonumber(vx) or 0, tonumber(vy) or 0
    local speed = math.sqrt(vx * vx + vy * vy)
    local flags = entity.get_prop(target, 'm_fFlags\') or 0
    local airborne = bit.band(flags, 1) ~= 1
    local score = airborne and 10 or 0
    if speed < 20 then return score end

    local dx, dy = (middle_pos.x or tx) - tx, (middle_pos.y or ty) - ty
    local len = math.sqrt(dx * dx + dy * dy)
    if len < 1 then return score end

    local toward = (vx * dx + vy * dy) / (speed * len)
    score = score + math.min(8, speed / 45)
    if toward > 0.12 then
        score = score + math.min(14, toward * 16)
    elseif toward < -0.55 then
        score = score - 8
    end

    return score
end

ai_peek.fov_penalty = function(local_player, target)
    local lx, ly = entity.get_origin(local_player)
    local target_origin = ai_peek.get_target_origin(target)
    if lx == nil or target_origin == nil then return 0 end
    local tx, ty = target_origin.x, target_origin.y

    local _, yaw = client.camera_angles()
    local target_yaw = calc_angle(tx - lx, ty - ly)
    local delta = math.abs(normalize_angle(target_yaw - (yaw or target_yaw)))
    return math.min(24, delta * 0.10)
end

ai_peek.rank_candidates = function(local_player, candidates, threat, target_mode)
    local ranked = ai_peek.cache.candidate_buf
    for i = 1, #ranked do ranked[i] = nil end

    local count = 0
    for i = 1, #candidates do
        local target = candidates[i]
        if target ~= nil then
            local score = 0
            if threat ~= nil and target == threat then
                score = score + 100
            end
            score = score - ai_peek.fov_penalty(local_player, target)
            local vx, vy = entity.get_prop(target, 'm_vecVelocity\')
            if vx == nil then
                local rec = ai_peek.cache.record_cache[target]
                local vel = type(rec) == 'table\' and rec.velocity or nil
                vx, vy = vel and vel.x or 0, vel and vel.y or 0
            end
            vx, vy = tonumber(vx) or 0, tonumber(vy) or 0
            score = score + math.min(12, math.sqrt(vx * vx + vy * vy) / 35)
            count = count + 1
            local item = ranked[count] or {}
            item.target = target
            item.score = score
            ranked[count] = item
        end
    end

    table.sort(ranked, function(a, b)
        return (a.score or -9999) > (b.score or -9999)
    end)
    return ranked
end

ai_peek.evaluate_target = function(local_player, target, middle_pos, target_mode, threat)
    local gate = ai_peek.target_gate(local_player, target)
    if gate.hard then return nil, gate.reason end

    local target_origin, record_age = ai_peek.get_target_origin(target)
    if target_origin == nil then return nil, \'no origin' end

    local angle = vector(middle_pos:to(target_origin):angles()).y
    local positions = ai_peek.setup_points(local_player, middle_pos, angle, ai_peek.amount, ai_peek.step_distance)
    local pos, index, damage, score, status, damage_policy,
        live_damage, pred_damage, commit_kind, bt_delta, bt_quality =
        ai_peek.trace_enemy(positions, local_player, target, ai_peek.active_hitboxes)
    local tick = globals.tickcount()
    local profile = ai_peek.peek_profile or AI_PEEK_DISTANCE_PROFILES.aggressive

    if not pos then
        if AI_PEEK_STRICT_LIVE_TRACE_TEST then return nil, \'memory disabled' end
        if ai_peek.cache.last_good_target == target
            and ai_peek.cache.last_good_pos ~= nil
            and tick - (ai_peek.cache.last_good_tick or 0) <= (profile.memory_ticks or 5)
            and (ai_peek.cache.last_good_index or 0) <= #positions then
            if status ~= nil and (status.risk or 0) > 0 then return nil, \'bt memory blocked' end
            local required_damage = damage_policy and damage_policy.required_damage or 1
            if (ai_peek.cache.last_good_damage or 0) < required_damage then return nil, 'weak memory damage\' end
            local age = tick - (ai_peek.cache.last_good_tick or tick)
            local safe_memory, exposure_penalty = ai_peek.point_is_safe(ai_peek.cache.last_good_pos, target, profile)
            if not safe_memory then return nil, 'unsafe memory' end
            local memory_score = (ai_peek.cache.last_good_damage or 0) - (age * 5) - gate.penalty - exposure_penalty
            if memory_score < (profile.min_score or -4) then return nil, \'weak memory\' end
            return {
                target = target,
                pos = ai_peek.cache.last_good_pos,
                index = ai_peek.cache.last_good_index or 0,
                damage = ai_peek.cache.last_good_damage or 0,
                score = memory_score,
                status = status,
                required_damage = required_damage,
                minimum_damage = damage_policy and damage_policy.minimum_damage or required_damage,
                damage_source = damage_policy and damage_policy.source or \'memory\',
                target_health = damage_policy and damage_policy.target_health or 0,
                damage_gap = math.max(0, required_damage - (ai_peek.cache.last_good_damage or 0)),
                live_damage = ai_peek.cache.last_good_damage or 0,
                pred_damage = 0,
                commit_kind = 'memory',
                bt_delta = 0,
                bt_quality = status and status.quality or 100,
                reason = \'memory',
            }
        end
        return nil, \'no damage\'
    end

    local required_damage = damage_policy and damage_policy.required_damage or 1
    local target_health = damage_policy and damage_policy.target_health or 0
    local retreating, retreat_speed = ai_peek.target_retreating_from(target, middle_pos)
    local high_commit = (damage or 0) >= math.max(required_damage + 12, math.min(target_health > 0 and target_health or 100, required_damage + 24))
        or (target_health > 0 and (damage or 0) >= target_health)
    local anti_chase_penalty = retreating and not high_commit and (retreat_speed > 160 and 10 or 5) or 0

    local total = (score or 0) - gate.penalty - anti_chase_penalty + ai_peek.peek_intent_score(target, middle_pos)
    if target_mode == \'current threat\' and threat ~= nil and target == threat then
        total = total + 18
    elseif target_mode == 'closest to crosshair\' then
        total = total - ai_peek.fov_penalty(local_player, target)
    end

    return {
        target = target,
        pos = pos,
        index = index or 0,
        damage = damage or 0,
        score = total,
        status = status,
        record_age = record_age or 0,
        required_damage = damage_policy and damage_policy.required_damage or 1,
        minimum_damage = damage_policy and damage_policy.minimum_damage or 1,
        damage_source = damage_policy and damage_policy.source or \'fallback\',
        target_health = damage_policy and damage_policy.target_health or 0,
        damage_gap = damage_policy and math.max(0, (damage_policy.required_damage or 1) - (damage or 0)) or 0,
        live_damage = live_damage or damage or 0,
        pred_damage = pred_damage or 0,
        commit_kind = commit_kind or \'real\',
        bt_delta = bt_delta or 0,
        bt_quality = bt_quality or (status and status.quality) or 100,
        reason = gate.reason,
    }
end

ai_peek.select_best_target = function(local_player, middle_pos, target_mode)
    local candidates = ai_peek.get_enemy_candidates()
    local threat = ai_peek.get_current_threat()
    local best, best_score, last_reason = nil, -9999, \'no targets'
    ai_peek.cache.enemy_count = #candidates
    ai_peek.cache.exposure_enemies = candidates

    if threat ~= nil then
        local result, reason = ai_peek.evaluate_target(local_player, threat, middle_pos, target_mode, threat)
        if result ~= nil then
            best, best_score = result, result.score
        elseif reason ~= nil then
            last_reason = reason
        end
    end

    local ranked = ai_peek.rank_candidates(local_player, candidates, threat, target_mode)
    local max_checks = #candidates >= 5 and 3 or 4
    if target_mode == \'current threat' then
        max_checks = #candidates >= 5 and 3 or 4
    end
    local checked = 0

    for i = 1, #ranked do
        if checked >= max_checks then break end
        local target = ranked[i].target
        if target ~= threat then
            checked = checked + 1
            local result, reason = ai_peek.evaluate_target(local_player, target, middle_pos, target_mode, threat)
            if result ~= nil and result.score > best_score then
                best, best_score = result, result.score
            elseif reason ~= nil then
                last_reason = reason
            end
        end
    end

    local profile = ai_peek.peek_profile or AI_PEEK_DISTANCE_PROFILES.aggressive
    if best ~= nil
        and best_score < (profile.min_score or -4)
        and (best.damage or 0) < math.max(1, best.required_damage or 1) then
        ai_peek.cache.last_reason = \'low score\'
        return nil
    end

    ai_peek.cache.last_reason = best ~= nil and (best.reason or \'ok') or last_reason
    return best
end

ai_peek.cached_decision = function(middle_pos, target_mode, distance_mode)
    local c = ai_peek.cache
    local decision = c.decision
    if type(decision) ~= \'table\' then return nil end
    if globals.tickcount() - (c.decision_tick or 0) > AI_PEEK_DECISION_TTL then return nil end
    if c.decision_mode ~= target_mode then return nil end
    if c.decision_distance ~= distance_mode then return nil end
    if c.decision_middle == nil or c.decision_middle:dist2d(middle_pos) > 8 then return nil end
    if not ai_peek.target_valid(decision.target) then return nil end
    local current_origin = ai_peek.get_target_origin(decision.target)
    if current_origin == nil then return nil end
    if c.decision_target_origin ~= nil then
        if current_origin:dist2d(c.decision_target_origin) > 18
            or math.abs((current_origin.z or 0) - (c.decision_target_origin.z or 0)) > 24 then
            return nil
        end
    end
    local status = ai_peek.backtrack_status(decision.target)
    if c.decision_bt_reason ~= nil and status.reason ~= c.decision_bt_reason then return nil end
    if math.abs((status.risk or 0) - (c.decision_bt_risk or 0)) > 12 then return nil end
    local damage_policy = ai_peek.damage_policy(decision.target)
    if (decision.damage or 0) < (damage_policy.required_damage or 1) then return nil end
    local profile = ai_peek.peek_profile or AI_PEEK_DISTANCE_PROFILES.aggressive
    local safe_point = ai_peek.point_is_safe(decision.pos, decision.target, profile)
    if not safe_point then
        decision.score = (decision.score or 0) - (profile.exposure_penalty or 8)
    end
    if (decision.score or 0) < (profile.min_score or -4)
        and (decision.damage or 0) < (damage_policy.required_damage or 1) then
        return nil
    end
    decision.status = status
    decision.required_damage = damage_policy.required_damage
    decision.minimum_damage = damage_policy.minimum_damage
    decision.damage_source = damage_policy.source
    decision.target_health = damage_policy.target_health
    decision.damage_gap = math.max(0, (damage_policy.required_damage or 1) - (decision.damage or 0))
    decision.live_damage = decision.damage or 0
    decision.pred_damage = decision.pred_damage or 0
    decision.commit_kind = decision.commit_kind or \'real\'
    decision.bt_delta = decision.bt_delta or 0
    decision.bt_quality = status.quality or 100
    return decision
end

ai_peek.store_decision = function(decision, middle_pos, target_mode, distance_mode)
    local c = ai_peek.cache
    c.decision = decision
    c.decision_tick = globals.tickcount()
    c.decision_mode = target_mode
    c.decision_distance = distance_mode
    c.decision_middle = vector(middle_pos.x, middle_pos.y, middle_pos.z)
    local target_origin = ai_peek.get_target_origin(decision.target)
    c.decision_target_origin = target_origin ~= nil and vector(target_origin.x, target_origin.y, target_origin.z) or nil
    local status = decision.status or ai_peek.backtrack_status(decision.target)
    c.decision_bt_reason = status.reason
    c.decision_bt_risk = status.risk or 0
end

local function main_key()
    return safe_get(ui_ai.enable, false) and safe_get(ui_ai.key, false)
end

local function restore_quickpeek()
    override_unset(refs.quickpeek[1])
    override_unset(refs.quickpeek[2])
    override_unset(refs.quickpeek_mode[1])
    override_unset(refs.quickpeek_distance)
end

local function apply_quickpeek(profile)
    if not AI_PEEK_USE_NATIVE_QUICKPEEK then return end
    override_set(refs.quickpeek[1], true)
    if refs.quickpeek[2] ~= nil and override_cache[refs.quickpeek[2]] == nil then
        override_cache[refs.quickpeek[2]] = read_ref(refs.quickpeek[2])
    end
    if not ai_peek.cache.qp_hotkey_forced then
        set_hotkey_mode(refs.quickpeek[2], 'Always on\')
        ai_peek.cache.qp_hotkey_forced = true
    end
    if ai_peek.cache.native_qp_origin_locked ~= true then
        local local_player = entity.get_local_player()
        if local_player ~= nil and entity.is_alive(local_player) and ai_peek.capture_origin(local_player) then
            ai_peek.cache.origin_key_locked = true
            ai_peek.cache.native_qp_origin_locked = ai_peek.cache.origin_valid == true
            ai_peek.cache.native_qp_origin_tick = globals.tickcount()
        end
    end
end

local function release_dt_for_return()
    if ai_peek.returning ~= true or ai_peek.targeting == true then return end
    if ai_peek.cache.return_release_done == true then return end
    if refs.double_tap ~= nil and refs.double_tap[1] ~= nil then
        override_set(refs.double_tap[1], false)
        ai_peek.cache.return_dt_released = true
        ai_peek.cache.return_release_done = true
        ai_peek.cache.return_dt_release_tick = ai_peek.cache.return_dt_release_tick ~= 0
            and ai_peek.cache.return_dt_release_tick or globals.tickcount()
    end
end

local function return_should_release_dt(reason)
    reason = tostring(reason or '')
    if reason == 'post shot return\' then return false end
    if reason == \'dt recharge return\' then return false end
    if reason == \'key release return\' then return false end
    return true
end

local function restore_dt_after_return()
    if ai_peek.cache.return_dt_released and refs.double_tap ~= nil and refs.double_tap[1] ~= nil then
        override_unset(refs.double_tap[1])
    end
    ai_peek.cache.return_dt_released = false
    ai_peek.cache.return_dt_release_tick = 0
    ai_peek.cache.return_release_done = false
    ai_peek.cache.native_return_only = false
end

local function set_ai_return_phase(phase)
    ai_peek.cache.return_phase = phase or \'idle\'
end

local function ai_peek_dt_active()
    return refs.double_tap ~= nil
        and safe_get(refs.double_tap[1], false) == true
        and safe_get(refs.double_tap[2], false) == true
end

local function clear_dt_return_cooldown()
    ai_peek.cache.dt_return_cooldown_until = 0
    ai_peek.cache.dt_return_cooldown_min_until = 0
    ai_peek.cache.dt_return_wait_recharge = false
    ai_peek.cache.dt_return_ready_ticks = 0
    ai_peek.cache.dt_return_rearm_until = 0
    if ai_peek.cache.return_phase == 'recharge_wait\' then
        set_ai_return_phase(\'idle\')
    end
end

local function ai_peek_dt_ready()
    if not ai_peek_dt_active() then return false end
    if exploit ~= nil and type(exploit.get) == \'function\' then
        local ok, exp = pcall(exploit.get)
        if ok and type(exp) == \'table' and exp.shift ~= nil and exp.shift ~= true then
            return false
        end
    end
    return exploits:can_recharge()
end

local function start_dt_return_cooldown(force)
    if force ~= true and ai_peek.cache.return_dt_released ~= true then return false end
    local tick = globals.tickcount()
    ai_peek.cache.dt_return_cooldown_min_until = math.max(ai_peek.cache.dt_return_cooldown_min_until or 0, tick + 4)
    ai_peek.cache.dt_return_cooldown_until = math.max(ai_peek.cache.dt_return_cooldown_until or 0, tick + 24)
    ai_peek.cache.dt_return_wait_recharge = true
    ai_peek.cache.dt_return_ready_ticks = 0
    ai_peek.cache.dt_return_rearm_until = 0
    set_ai_return_phase(\'recharge_wait\')
    ai_peek.cache.velocity_return_cooldown_until = math.max(ai_peek.cache.velocity_return_cooldown_until or 0, tick + 18)
    return true
end

local function return_needs_recharge_wait(reason)
    reason = tostring(reason or \'\')
    return reason == \'dt recharge return\'
end

local function begin_native_post_shot_return(dist_to_origin, auto_return)
    clear_dt_return_cooldown()
    ai_peek.cache.velocity_return_cooldown_until = 0
    ai_peek.cache.return_dt_released = false
    ai_peek.cache.return_dt_release_tick = 0
    ai_peek.cache.return_release_done = false
    ai_peek.cache.session_force_return_now = false
    ai_peek.cache.decision = nil
    ai_peek.cache.decision_tick = 0
    ai_peek.cache.active_point_index = 0
    ai_peek.cache.current_target = 0
    if auto_return == true and ai_peek.cache.return_allowed == true and (tonumber(dist_to_origin) or 0) > 6 then
        ai_peek.returning = true
        ai_peek.should_return = true
        ai_peek.dt_teleport = true
        ai_peek.targeting = false
        ai_peek.disable_dt = false
        ai_peek.cache.return_start_tick = ai_peek.cache.return_start_tick or globals.tickcount()
        ai_peek.cache.return_reason = \'post shot return\'
        ai_peek.cache.native_return_only = AI_PEEK_USE_NATIVE_QUICKPEEK == true
        set_ai_return_phase(\'native_post_shot\')
        ai_peek.set_state('returning\', \'post shot return\')
        return true
    end
    ai_peek.targeting = false
    ai_peek.should_return = false
    ai_peek.dt_teleport = false
    ai_peek.disable_dt = false
    ai_peek.cache.return_reason = \'post shot return'
    ai_peek.cache.native_return_only = false
    set_ai_return_phase(\'idle')
    ai_peek.set_state(\'cooldown', 'shot throttle')
    return false
end

local function native_post_shot_return_active()
    return ai_peek.cache.native_return_only == true
        and tostring(ai_peek.cache.return_reason or '\') == \'post shot return\'
end

local function native_post_shot_settle_active(dist_to_origin)
    local until_tick = tonumber(ai_peek.cache.native_post_shot_settle_until) or 0
    if until_tick <= 0 then return false end
    if globals.tickcount() >= until_tick or (tonumber(dist_to_origin) or 0) <= 18 then
        ai_peek.cache.native_post_shot_settle_until = 0
        return false
    end
    return true
end

local function finish_native_post_shot_return(dist_to_origin)
    if not native_post_shot_return_active() then return false end
    local tick = globals.tickcount()
    ai_peek.returning = false
    ai_peek.should_return = false
    ai_peek.dt_teleport = false
    ai_peek.disable_dt = false
    ai_peek.cache.return_allowed = false
    ai_peek.cache.return_start_tick = nil
    ai_peek.cache.return_stuck_ticks = 0
    ai_peek.cache.return_last_dist = 0
    ai_peek.cache.return_release_done = false
    ai_peek.cache.native_return_only = false
    ai_peek.cache.session_force_return_now = false
    ai_peek.cache.peek_target = 0
    ai_peek.cache.peek_point_index = 0
    ai_peek.cache.peek_start_tick = nil
    ai_peek.cache.peek_start_dist = 0
    ai_peek.cache.peek_last_dist = 0
    ai_peek.cache.peek_no_progress_ticks = 0
    ai_peek.cache.peek_last_damage_tick = 0
    ai_peek.cache.session_active = false
    ai_peek.cache.session_target = 0
    ai_peek.cache.session_point_index = 0
    ai_peek.cache.session_started_tick = 0
    ai_peek.cache.session_last_seen_tick = 0
    ai_peek.cache.session_lost_reason = 'idle'
    ai_peek.cache.session_point_pos = nil
    ai_peek.cache.session_start_pos = nil
    ai_peek.cache.session_target_origin = nil
    ai_peek.cache.session_boundary_tick = 0
    ai_peek.cache.session_air_probe = false
    ai_peek.cache.decision = nil
    ai_peek.cache.decision_tick = 0
    ai_peek.cache.active_point_index = 0
    ai_peek.cache.current_target = 0
    if (tonumber(dist_to_origin) or 0) > 18 then
        ai_peek.cache.native_post_shot_settle_until = tick + 10
    else
        ai_peek.cache.native_post_shot_settle_until = 0
    end
    set_ai_return_phase('idle\')
    ai_peek.set_state(\'cooldown\', 'native returned\')
    return true
end

local function ai_local_speed2d(player)
    local vx, vy = entity.get_prop(player, 'm_vecVelocity\')
    if vx == nil then
        vx = entity.get_prop(player, \'m_vecVelocity[0]') or 0
        vy = entity.get_prop(player, 'm_vecVelocity[1]') or 0
    end
    vx, vy = tonumber(vx) or 0, tonumber(vy) or 0
    return math.sqrt(vx * vx + vy * vy)
end

local function velocity_return_cooldown_active(player)
    local until_tick = tonumber(ai_peek.cache.velocity_return_cooldown_until) or 0
    if until_tick <= 0 then return false end
    local tick = globals.tickcount()
    if tick >= until_tick then
        ai_peek.cache.velocity_return_cooldown_until = 0
        return false
    end
    if ai_local_speed2d(player) >= 18 then
        ai_peek.cache.velocity_return_cooldown_until = 0
        return false
    end
    return true
end

local function dt_return_cooldown_active()
    local tick = globals.tickcount()
    local min_until = tonumber(ai_peek.cache.dt_return_cooldown_min_until) or 0
    local until_tick = tonumber(ai_peek.cache.dt_return_cooldown_until) or 0
    local wait_recharge = ai_peek.cache.dt_return_wait_recharge == true
    local rearm_until = tonumber(ai_peek.cache.dt_return_rearm_until) or 0
    if rearm_until > 0 then
        if tick < rearm_until then
            ai_peek.cache.last_reason = \'dt rearm wait\'
            ai_peek.set_state(\'cooldown\', \'dt rearm wait\')
            ai_peek.cache.dt_return_cooldown_until = math.max(until_tick, rearm_until)
            return true
        end
        clear_dt_return_cooldown()
        return false
    end
    if until_tick <= 0 then
        ai_peek.cache.dt_return_wait_recharge = false
        ai_peek.cache.dt_return_ready_ticks = 0
        if ai_peek.cache.return_phase == \'recharge_wait\' then
            set_ai_return_phase(\'idle')
        end
        return false
    end
    if tick < min_until then return true end
    if wait_recharge then
        if not ai_peek_dt_active() then
            ai_peek.cache.dt_return_ready_ticks = 0
            ai_peek.cache.last_reason = \'dt enable wait\'
            ai_peek.set_state(\'cooldown\', \'dt enable wait\')
            ai_peek.cache.dt_return_cooldown_until = math.max(until_tick, tick + 2)
            return true
        end
        if not ai_peek_dt_ready() then
            ai_peek.cache.dt_return_ready_ticks = 0
            ai_peek.cache.last_reason = 'dt recharge wait\'
            ai_peek.set_state(\'cooldown\', 'dt recharge wait\')
            ai_peek.cache.dt_return_cooldown_until = math.max(until_tick, tick + 2)
            return true
        end
        local ready_ticks = (tonumber(ai_peek.cache.dt_return_ready_ticks) or 0) + 1
        ai_peek.cache.dt_return_ready_ticks = ready_ticks
        if ready_ticks < AI_PEEK_DT_RECHARGE_READY_TICKS then
            ai_peek.cache.last_reason = \'dt stable wait'
            ai_peek.set_state(\'cooldown', 'dt stable wait\')
            ai_peek.cache.dt_return_cooldown_until = math.max(until_tick, tick + 2)
            return true
        end
        ai_peek.cache.dt_return_rearm_until = tick + AI_PEEK_DT_REARM_TICKS
        ai_peek.cache.dt_return_cooldown_until = math.max(until_tick, ai_peek.cache.dt_return_rearm_until)
        ai_peek.cache.last_reason = 'dt rearm wait\'
        ai_peek.set_state(\'cooldown\', \'dt rearm wait\')
        return true
    end
    if tick >= until_tick then
        clear_dt_return_cooldown()
        return false
    end
    if ai_peek_dt_active() and not ai_peek_dt_ready() then
        return true
    end
    clear_dt_return_cooldown()
    return false
end

local function restore_dt_on_released_key(pressed, dist_to_origin)
    if pressed or ai_peek.cache.return_dt_released ~= true then return end
    local tick = globals.tickcount()
    local release_tick = tonumber(ai_peek.cache.return_dt_release_tick) or tick
    if ai_peek.returning ~= true
        or (tonumber(dist_to_origin) or 999) <= 18
        or tick - release_tick >= 6 then
        start_dt_return_cooldown()
        restore_dt_after_return()
    end
end

local function reset_peek_progress()
    ai_peek.cache.peek_target = 0
    ai_peek.cache.peek_point_index = 0
    ai_peek.cache.peek_start_tick = nil
    ai_peek.cache.peek_start_dist = 0
    ai_peek.cache.peek_last_dist = 0
    ai_peek.cache.peek_no_progress_ticks = 0
    ai_peek.cache.peek_last_damage_tick = 0
end

local function reset_peek_session()
    ai_peek.cache.session_active = false
    ai_peek.cache.session_target = 0
    ai_peek.cache.session_point_index = 0
    ai_peek.cache.session_started_tick = 0
    ai_peek.cache.session_last_seen_tick = 0
    ai_peek.cache.session_last_live_damage_tick = 0
    ai_peek.cache.session_lost_reason = 'idle'
    ai_peek.cache.session_point_pos = nil
    ai_peek.cache.session_start_pos = nil
    ai_peek.cache.session_target_origin = nil
    ai_peek.cache.session_move_yaw = 0
    ai_peek.cache.session_path_len = 0
    ai_peek.cache.session_force_return_now = false
    ai_peek.cache.session_boundary_tick = 0
    ai_peek.cache.session_air_probe = false
end

local function start_peek_session(decision, point_index)
    if decision == nil or decision.target == nil then return end
    local tick = globals.tickcount()
    local target = decision.target
    local same_session = ai_peek.cache.session_active == true
        and ai_peek.cache.session_target == target
        and ai_peek.cache.session_point_index == point_index

    if not same_session then
        ai_peek.cache.session_active = true
        ai_peek.cache.session_target = target
        ai_peek.cache.session_point_index = point_index or 0
        ai_peek.cache.session_started_tick = tick
        ai_peek.cache.session_last_live_damage_tick = 0
        ai_peek.cache.session_lost_reason = 'active'
        ai_peek.cache.session_boundary_tick = 0
        ai_peek.cache.session_air_probe = false

        local start_pos = ai_peek.cache.middle_pos
        local point_pos = decision.pos
        ai_peek.cache.session_start_pos = start_pos ~= nil and vector(start_pos.x, start_pos.y, start_pos.z) or nil
        ai_peek.cache.session_point_pos = point_pos ~= nil and vector(point_pos.x, point_pos.y, point_pos.z) or nil
        if start_pos ~= nil and point_pos ~= nil then
            ai_peek.cache.session_move_yaw = vector(vector(start_pos.x, start_pos.y, start_pos.z):to(point_pos):angles()).y
            ai_peek.cache.session_path_len = math.max(1, start_pos:dist2d(point_pos))
        else
            ai_peek.cache.session_move_yaw = 0
            ai_peek.cache.session_path_len = 1
        end
        local target_origin = ai_peek.get_target_origin(target)
        ai_peek.cache.session_target_origin = target_origin ~= nil and vector(target_origin.x, target_origin.y, target_origin.z) or nil
    end

    ai_peek.cache.session_last_seen_tick = tick
    local required_damage = math.max(1, decision.required_damage or ai_peek.cache.required_damage or 1)
    local live_damage = decision.live_damage or decision.damage or 0
    if live_damage >= required_damage then
        ai_peek.cache.session_last_live_damage_tick = tick
    end
end

local function mark_peek_session_lost(reason)
    if ai_peek.cache.session_active ~= true then return end
    ai_peek.cache.session_lost_reason = reason or 'target lost\'
    ai_peek.cache.last_reason = ai_peek.cache.session_lost_reason
    ai_peek.cache.session_force_return_now = true
end

local function peek_session_lost_reason()
    local target = ai_peek.cache.session_target
    if target == nil or target == 0 then return \'target lost\' end
    if not ai_peek.target_alive_enemy(target) then return 'target dead\' end
    local origin, age = ai_peek.get_target_origin(target)
    if origin == nil then return entity.is_dormant(target) and 'esp rip\' or 'target origin lost' end
    if age ~= nil and age > 0 then
        if entity.is_dormant(target) and ai_peek.dormant_target_allowed(target)
            and age <= AI_PEEK_DORMANT_COMMIT_TICKS then
            return \'damage lost\'
        end
        return \'record stale\'
    end
    return 'damage lost'
end

local function locked_peek_decision(local_player, profile)
    if ai_peek.cache.session_active ~= true or ai_peek.returning then return nil end
    local target = ai_peek.cache.session_target
    local point_pos = ai_peek.cache.session_point_pos
    if target == nil or target == 0 or point_pos == nil then
        mark_peek_session_lost('locked missing\')
        return nil
    end
    if not ai_peek.target_alive_enemy(target) then
        mark_peek_session_lost('target dead\')
        return nil
    end
    local target_dormant_record = entity.is_dormant(target) and ai_peek.dormant_target_allowed(target)
    if entity.is_dormant(target) and not target_dormant_record then
        mark_peek_session_lost(\'esp rip')
        return nil
    end

    local current_origin, current_record_age = ai_peek.get_target_origin(target)
    if current_origin == nil then
        mark_peek_session_lost(\'target origin lost\')
        return nil
    end
    local locked_origin = ai_peek.cache.session_target_origin
    if locked_origin ~= nil and current_origin:dist2d(locked_origin) > 64 then
        mark_peek_session_lost('target moved')
        return nil
    end
    if locked_origin ~= nil and math.abs((current_origin.z or 0) - (locked_origin.z or 0)) > 24 then
        if profile and profile.allow_air_probe == true then
            ai_peek.cache.session_air_probe = true
            ai_peek.cache.last_reason = \'target jump probe\'
        else
            mark_peek_session_lost('target jump\')
            return nil
        end
    end
    local target_flags = target_dormant_record and 1 or (entity.get_prop(target, 'm_fFlags\') or 0)
    if not target_dormant_record and bit.band(target_flags, 1) ~= 1 then
        if profile and profile.allow_air_probe == true then
            ai_peek.cache.session_air_probe = true
            ai_peek.cache.last_reason = \'target air probe\'
        else
            mark_peek_session_lost(\'target air')
            return nil
        end
    end

    local positions = ai_peek.cache.candidate_buf
    for k in pairs(positions) do positions[k] = nil end
    positions[0] = point_pos
    local pos, index, damage, score, status, damage_policy,
        live_damage, pred_damage, commit_kind, bt_delta, bt_quality =
        ai_peek.trace_enemy(positions, local_player, target, ai_peek.active_hitboxes)

    damage_policy = damage_policy or ai_peek.damage_policy(target)
    status = status or ai_peek.backtrack_status(target)
    damage = damage or 0
    live_damage = live_damage or damage
    local required_damage = damage_policy.required_damage or 1
    local moved_delta = locked_origin ~= nil and current_origin:dist2d(locked_origin) or 0
    local retreating, retreat_speed = ai_peek.target_retreating_from(target, locked_origin or ai_peek.cache.middle_pos)
    local weak_damage = damage < math.max(8, math.floor(required_damage * 0.65))
    if damage < required_damage
        and (moved_delta > (profile.chase_move_delta or 24) or retreating) then
        mark_peek_session_lost(retreating and \'anti chase retreat\' or 'anti chase moved\')
        return nil
    elseif weak_damage and moved_delta > math.max(12, math.floor((profile.chase_move_delta or 24) * 0.65)) then
        mark_peek_session_lost(\'anti chase weak')
        return nil
    end

    return {
        target = target,
        pos = point_pos,
        index = ai_peek.cache.session_point_index or index or 0,
        damage = damage,
        score = score or (damage - 4),
        status = status,
        required_damage = required_damage,
        minimum_damage = damage_policy.minimum_damage or required_damage,
        damage_source = damage_policy.source or \'fallback\',
        target_health = damage_policy.target_health or 0,
        damage_gap = math.max(0, required_damage - damage),
        live_damage = live_damage,
        pred_damage = pred_damage or 0,
        commit_kind = commit_kind or (damage >= required_damage and \'locked\' or \'locked_low\'),
        bt_delta = bt_delta or 0,
        bt_quality = bt_quality or status.quality or 100,
        record_age = current_record_age or 0,
        reason = target_dormant_record and \'locked dormant\'
            or (damage >= required_damage and 'locked peek\' or (retreat_speed > 90 and 'locked anti chase watch\' or \'locked low damage\')),
    }
end

local function force_ai_return(reason)
    reason = reason or \'return\'
    if ai_peek.cache.return_allowed ~= true then
        ai_peek.returning = false
        ai_peek.should_return = false
        ai_peek.dt_teleport = false
        ai_peek.cache.last_reason = reason or 'return ignored'
        return
    end
    if native_post_shot_return_active() then
        ai_peek.cache.last_reason = 'post shot return\'
        ai_peek.cache.session_force_return_now = false
        ai_peek.cache.decision = nil
        ai_peek.cache.active_point_index = 0
        return
    end
    local was_returning = ai_peek.returning == true
    if not was_returning then
        ai_peek.cache.return_session_id = (tonumber(ai_peek.cache.return_session_id) or 0) + 1
        ai_peek.cache.return_reason = reason
        ai_peek.cache.return_release_done = false
        ai_peek.cache.native_return_only = false
    elseif ai_peek.cache.native_return_only == true then
        ai_peek.cache.native_return_only = false
        ai_peek.cache.return_reason = reason
    else
        reason = ai_peek.cache.return_reason or ai_peek.cache.last_reason or reason
    end
    ai_peek.returning = true
    ai_peek.should_return = true
    ai_peek.dt_teleport = true
    ai_peek.targeting = false
    ai_peek.disable_dt = false
    ai_peek.cache.current_target = 0
    ai_peek.cache.active_point_index = 0
    ai_peek.cache.decision = nil
    ai_peek.cache.decision_tick = 0
    ai_peek.cache.decision_target_origin = nil
    ai_peek.cache.decision_bt_reason = nil
    ai_peek.cache.decision_bt_risk = 0
    ai_peek.cache.last_reason = reason
    set_ai_return_phase('returning\')
    if ai_peek.cache.return_start_tick == nil then
        ai_peek.cache.return_start_tick = globals.tickcount()
    end
    ai_peek.set_state(\'returning\', reason)
end

local function cancel_ai_return(reason, local_player)
    ai_peek.returning = false
    ai_peek.should_return = false
    ai_peek.dt_teleport = false
    ai_peek.targeting = false
    ai_peek.cache.decision = nil
    ai_peek.cache.current_target = 0
    ai_peek.cache.active_point_index = 0
    ai_peek.cache.return_start_tick = nil
    ai_peek.cache.return_last_dist = 0
    ai_peek.cache.return_stuck_ticks = 0
    ai_peek.cache.return_reason = \'cancel\'
    set_ai_return_phase('idle\')
    ai_peek.cache.return_release_done = false
    ai_peek.cache.native_return_only = false
    ai_peek.cache.forced_return_until = globals.tickcount() + 4
    ai_peek.cache.return_allowed = false
    reset_peek_progress()
    reset_peek_session()
    restore_dt_after_return()
    ai_peek.set_state('cooldown\', reason or \'return cancel')
end

local function fade_ai_visual()
    local vis = ai_peek.visual
    if vis.pos ~= nil and (tonumber(vis.phase) or 0) > 0.02 then
        vis.active = true
        vis.fading = true
        vis.fade_start_tick = globals.tickcount()
        vis.target_pos = nil
        vis.last_state = 'fade\'
    else
        vis.active = false
        vis.pos = nil
        vis.target_pos = nil
        vis.phase = 0
        vis.fading = false
        vis.fade_start_tick = 0
        vis.last_state = \'idle\'
    end
end

local function clear_ai_visual()
    local vis = ai_peek.visual
    vis.active = false
    vis.pos = nil
    vis.target_pos = nil
    vis.phase = 0
    vis.fading = false
    vis.fade_start_tick = 0
    vis.last_state = \'idle\'
end

local function reset_ai_state()
    ai_peek.set_state('idle\', \'idle\')
    ai_peek.returning = false
    ai_peek.targeting = false
    ai_peek.should_return = false
    ai_peek.dt_teleport = false
    ai_peek.disable_dt = false
    fade_ai_visual()
    ai_peek.cache.return_start_tick = nil
    ai_peek.cache.qp_distance = nil
    ai_peek.cache.qp_hotkey_forced = false
    ai_peek.cache.last_good_pos = nil
    ai_peek.cache.last_good_index = 0
    ai_peek.cache.last_good_target = 0
    ai_peek.cache.last_good_tick = 0
    ai_peek.cache.last_good_damage = 0
    ai_peek.cache.last_good_required_damage = 0
    ai_peek.cache.last_good_damage_source = \'idle'
    ai_peek.cache.enemy_count = 0
    for k in pairs(ai_peek.cache.exposure_enemies) do
        ai_peek.cache.exposure_enemies[k] = nil
    end
    ai_peek.cache.decision = nil
    ai_peek.cache.decision_tick = 0
    ai_peek.cache.decision_mode = nil
    ai_peek.cache.decision_distance = nil
    ai_peek.cache.decision_middle = nil
    ai_peek.cache.decision_target_origin = nil
    ai_peek.cache.decision_bt_reason = nil
    ai_peek.cache.decision_bt_risk = 0
    ai_peek.cache.last_reason = \'idle\'
    ai_peek.cache.live_damage = 0
    ai_peek.cache.pred_damage = 0
    ai_peek.cache.target_exposure = 0
    ai_peek.cache.bt_quality = 100
    ai_peek.cache.bt_delta = 0
    ai_peek.cache.bt_candidate_damage = 0
    ai_peek.cache.bt_allowed = false
    ai_peek.cache.bt_reject_reason = \'off\'
    ai_peek.cache.live_vs_bt_delta = 0
    ai_peek.cache.commit_kind = \'none\'
    ai_peek.cache.required_damage = 0
    ai_peek.cache.minimum_damage = 0
    ai_peek.cache.damage_source = 'idle\'
    ai_peek.cache.target_health = 0
    ai_peek.cache.damage_gap = 0
    ai_peek.cache.return_last_dist = 0
    ai_peek.cache.return_stuck_ticks = 0
    set_ai_return_phase(\'idle')
    ai_peek.cache.return_reason = 'idle\'
    ai_peek.cache.return_release_done = false
    ai_peek.cache.native_return_only = false
    ai_peek.cache.native_post_shot_settle_until = 0
    ai_peek.cache.forced_return_until = 0
    ai_peek.cache.return_allowed = false
    ai_peek.cache.origin_key_locked = false
    ai_peek.cache.native_qp_origin_locked = false
    ai_peek.cache.native_qp_origin_tick = 0
    ai_peek.cache.dt_return_cooldown_until = 0
    ai_peek.cache.dt_return_cooldown_min_until = 0
    ai_peek.cache.dt_return_wait_recharge = false
    ai_peek.cache.dt_return_ready_ticks = 0
    ai_peek.cache.dt_return_rearm_until = 0
    ai_peek.cache.velocity_return_cooldown_until = 0
    reset_peek_progress()
    reset_peek_session()
    restore_dt_after_return()
    restore_quickpeek()
end

local function hard_reset_ai_state(reason)
    reset_ai_state()
    clear_ai_visual()
    ai_peek.hotkeys.main = false
    ai_peek.hotkeys.force_baim = false
    ai_peek.cache.return_dt_released = false
    ai_peek.cache.return_dt_release_tick = 0
    ai_peek.cache.last_reason = reason or \'hard cancel\'
    ai_peek.set_state(\'idle\', reason or \'hard cancel\')
end

local function stop_ai_peek_on_key_release(reason)
    reset_ai_state()
    ai_peek.hotkeys.main = false
    ai_peek.hotkeys.force_baim = false
    ai_peek.cache.last_reason = reason or \'key release stop'
    ai_peek.set_state(\'idle\', reason or \'key release stop\')
end

local function ai_peek_block_for_fd(reason)
    reset_ai_state()
    ai_peek.hotkeys.main = false
    ai_peek.cache.fd_cooldown_until = globals.tickcount() + 10
    ai_peek.cache.last_reason = reason or 'fake duck'
    restore_quickpeek()
end

local function ai_peek_fake_duck_active()
    if software ~= nil and type(software.is_duck_peek_assist) == 'function\' and software.is_duck_peek_assist() then
        return true
    end
    local v = safe_get(refs.fake_duck, false)
    if type(v) == \'boolean' then return v end
    if type(v) == \'number\' then return v ~= 0 end
    return false
end

local function ai_peek_director_block(kind)
    local director = rawget(_G, 'INFINIX_SHOT_DIRECTOR\')
    if type(director) ~= \'table\' then return false, nil end
    local tick = globals.tickcount()
    local director_tick = tonumber(director.tick) or 0
    if tick - director_tick > 4 then return false, nil end
    if director.active ~= true or director.applied == true then return false, nil end
    local reason = tostring(director.reason or 'idle\')
    if kind == \'move\' then
        return false, nil
    end
    if reason:find(\'weapon wait\', 1, true)
        or reason:find('weapon delay\', 1, true)
        or reason:find('accuracy\', 1, true) then
        return true, \'shot director \' .. reason
    end
    return false, nil
end

ai_peek.cmd_jumping = function(cmd)
    if cmd == nil then return false end
    local jump = cmd.in_jump
    if jump == true or jump == 1 then return true end
    return cmd.buttons ~= nil and bit ~= nil and bit.band(cmd.buttons, 2) ~= 0
end

local function handle_legacy_safe_core(e)
    if not ai_peek_core_ok then return end
    if safe_get(ui_ai.enable, false) ~= true then
        if ai_peek.hotkeys.main or ai_peek.visual.active or ai_peek.targeting or ai_peek.returning then
            reset_ai_state()
            ai_peek.hotkeys.main = false
        end
        return
    end

    local local_player = entity.get_local_player()
    if local_player == nil or not entity.is_alive(local_player) then
        if ai_peek.visual.active or ai_peek.targeting or ai_peek.returning
            or ai_peek.should_return or ai_peek.cache.decision ~= nil
            or ai_peek.hotkeys.main then
            hard_reset_ai_state('dead')
        end
        return
    end

    local weapon = entity.get_player_weapon(local_player)
    if not weapon then return end
    if csgo_weapons ~= nil and csgo_weapons(weapon).is_revolver then return end
    if ai_peek.cmd_jumping(e) then
        ai_peek.cache.last_reason = 'jump guard\'
        restore_quickpeek()
        return
    end
    if ai_peek_fake_duck_active() then
        ai_peek_block_for_fd('fake duck')
        return
    end
    local distance_mode = safe_get(ui_ai.distance, 'aggressive\')
    local profile = ai_peek.resolve_profile(distance_mode, local_player, weapon)
    if profile == nil then
        if ai_peek.visual.active or ai_peek.targeting or ai_peek.returning
            or ai_peek.should_return or ai_peek.cache.decision ~= nil then
            reset_ai_state()
        end
        ai_peek.hotkeys.main = false
        ai_peek.cache.last_reason = \'weapon disabled\'
        return
    end
    ai_peek.passive_record_update()

    if globals.tickcount() < (ai_peek.cache.fd_cooldown_until or 0) then
        restore_quickpeek()
        ai_peek.hotkeys.main = false
        ai_peek.targeting = false
        ai_peek.cache.decision = nil
        ai_peek.cache.last_reason = \'fake duck cooldown\'
        return
    end

    local pressed = main_key()
    if pressed and not ai_peek.hotkeys.main then
        ai_peek.capture_origin(local_player)
        ai_peek.cache.origin_key_locked = ai_peek.cache.origin_valid == true
        ai_peek.hotkeys.main = true
        ai_peek.set_state(\'armed\', ai_peek.cache.origin_valid and \'armed\' or \'origin wait\')
    elseif not pressed and ai_peek.hotkeys.main then
        reset_ai_state()
        ai_peek.hotkeys.main = false
    end

    if globals.tickcount() < (rawget(_G, \'INFINIX_DT_RELAX_UNTIL') or 0) then
        restore_quickpeek()
        ai_peek.cache.last_reason = \'dt relax\'
        return
    end

    local force_baim = safe_get(refs.force_body, false)
    if force_baim and not ai_peek.hotkeys.force_baim then
        ai_peek.update_hitboxes(true)
        ai_peek.hotkeys.force_baim = true
    elseif not force_baim and ai_peek.hotkeys.force_baim then
        ai_peek.update_hitboxes(false)
        ai_peek.hotkeys.force_baim = false
    end

    if not pressed then
        if ai_peek.visual.active or ai_peek.targeting or ai_peek.returning
            or ai_peek.should_return or ai_peek.cache.decision ~= nil then
            reset_ai_state()
        end
        return
    end

    local modes = safe_get(ui_ai.mode, {})
    local auto_return = table_contains(modes, 'automatically teleport back')
    local force_defensive = table_contains(modes, \'force defensive\')
    ai_peek.peek_profile = profile
    ai_peek.amount = profile.amount
    ai_peek.step_distance = profile.step

    apply_quickpeek(profile)

    local flags = entity.get_prop(local_player, 'm_fFlags\') or 0
    local local_override = bit.band(flags, bit.lshift(1, 0)) ~= 1
    local middle_pos = ai_peek.cache.middle_pos
    local lp_origin = vector(entity.get_origin(local_player))
    local dist_to_middle = middle_pos:dist2d(lp_origin)
    local post_shot_throttle = globals.tickcount() < (rawget(_G, \'INFINIX_POST_SHOT_THROTTLE_UNTIL\') or 0)
    local post_shot_return = false
    if post_shot_throttle then
        post_shot_return = begin_native_post_shot_return(dist_to_middle, auto_return)
    elseif native_post_shot_return_active() then
        finish_native_post_shot_return(dist_to_middle)
    elseif not ai_peek.returning and dt_return_cooldown_active() then
        ai_peek.cache.decision = nil
        ai_peek.targeting = false
        ai_peek.should_return = false
        ai_peek.cache.active_point_index = 0
        ai_peek.cache.last_reason = \'dt recharge cooldown'
        ai_peek.set_state(\'cooldown\', \'dt recharge cooldown\')
        restore_quickpeek()
        return
    end
    if native_post_shot_settle_active(dist_to_middle) then
        ai_peek.cache.decision = nil
        ai_peek.targeting = false
        ai_peek.should_return = false
        ai_peek.cache.active_point_index = 0
        ai_peek.cache.last_reason = \'native post shot settle'
        ai_peek.set_state('cooldown', 'native post shot settle\')
        return
    end

    local origin_key_locked = (ai_peek.cache.origin_key_locked == true or ai_peek.cache.native_qp_origin_locked == true)
        and ai_peek.cache.origin_valid == true
    if not origin_key_locked and not post_shot_return and (local_override
        or ((not auto_return) and not ai_peek.targeting and not ai_peek.returning)
        or (dist_to_middle > 300 and not ai_peek.returning)) then
        ai_peek.capture_origin(local_player)
        middle_pos = ai_peek.cache.middle_pos
        dist_to_middle = middle_pos:dist2d(lp_origin)
    end

    ai_peek.visual.active = true

    local decision = nil
    local active_point_pos, active_point_index = nil, 0
    if not post_shot_return and not local_override and not ai_peek.returning then
        ai_peek.set_state(\'scanning\', ai_peek.cache.last_reason)
        local target_mode = safe_get(ui_ai.target, 'current threat\')
        if post_shot_throttle then
            ai_peek.cache.last_reason = \'shot throttle\'
        else
            decision = ai_peek.cached_decision(middle_pos, target_mode, distance_mode)
        end
        if decision == nil and not post_shot_throttle then
            decision = ai_peek.select_best_target(local_player, middle_pos, target_mode)
            if decision ~= nil then
                ai_peek.store_decision(decision, middle_pos, target_mode, distance_mode)
            end
        end
    else
        ai_peek.cache.decision = nil
        if local_override then
            ai_peek.cache.last_reason = 'air\'
        end
    end

    if decision ~= nil then
        active_point_pos = decision.pos
        active_point_index = decision.index or 0
        ai_peek.cache.current_target = decision.target
        ai_peek.cache.trace_damage = decision.damage or 0
        ai_peek.cache.live_damage = decision.live_damage or decision.damage or 0
        ai_peek.cache.pred_damage = decision.pred_damage or 0
        ai_peek.cache.commit_kind = decision.commit_kind or \'real'
        ai_peek.cache.bt_delta = decision.bt_delta or 0
        ai_peek.cache.bt_quality = decision.bt_quality or (decision.status and decision.status.quality) or 100
        ai_peek.cache.required_damage = decision.required_damage or 1
        ai_peek.cache.minimum_damage = decision.minimum_damage or ai_peek.cache.required_damage
        ai_peek.cache.damage_source = decision.damage_source or \'fallback'
        ai_peek.cache.target_health = decision.target_health or 0
        ai_peek.cache.damage_gap = decision.damage_gap or math.max(0, (ai_peek.cache.required_damage or 1) - (decision.damage or 0))
        ai_peek.cache.bt_state = decision.status and decision.status.reason or \'clean\'
        ai_peek.cache.bt_risk = decision.status and decision.status.risk or 0
    else
        ai_peek.cache.current_target = 0
        ai_peek.cache.trace_damage = 0
        ai_peek.cache.live_damage = 0
        ai_peek.cache.pred_damage = 0
        ai_peek.cache.target_exposure = 0
        ai_peek.cache.commit_kind = \'none\'
        ai_peek.cache.bt_delta = 0
        ai_peek.cache.bt_candidate_damage = 0
        ai_peek.cache.bt_allowed = false
        ai_peek.cache.bt_reject_reason = 'idle'
        ai_peek.cache.live_vs_bt_delta = 0
        ai_peek.cache.bt_quality = 100
        ai_peek.cache.required_damage = 0
        ai_peek.cache.minimum_damage = 0
        ai_peek.cache.damage_source = \'idle\'
        ai_peek.cache.target_health = 0
        ai_peek.cache.damage_gap = 0
    end

    ai_peek.cache.active_point_index = active_point_index
    ai_peek.targeting = active_point_pos ~= nil
    if not ai_peek.targeting
        and not ai_peek.returning
        and ai_peek.cache.return_allowed == true
        and dist_to_middle > 8 then
        ai_peek.cache.return_reason = post_shot_throttle and 'post shot return\' or \'lost target return\'
        ai_peek.cache.return_release_done = false
        ai_peek.should_return = true
    end
    if not auto_return and not ai_peek.targeting then
        ai_peek.should_return = false
    end

    if ai_peek.targeting then
        reset_peek_session()
        ai_peek.cache.return_allowed = true
        restore_dt_after_return()
        ai_peek.visual.target_pos = active_point_pos ~= nil
            and vector(active_point_pos.x, active_point_pos.y, (middle_pos and middle_pos.z) or active_point_pos.z or 0)
            or nil
        ai_peek.visual.fading = false
        ai_peek.visual.fade_start_tick = 0
        ai_peek.cache.last_good_pos = active_point_pos
        ai_peek.cache.last_good_index = active_point_index
        ai_peek.cache.last_good_target = ai_peek.cache.current_target
        ai_peek.cache.last_good_tick = globals.tickcount()
        ai_peek.cache.last_good_damage = ai_peek.cache.trace_damage or 0
        ai_peek.cache.last_good_required_damage = ai_peek.cache.required_damage or 1
        ai_peek.cache.last_good_damage_source = ai_peek.cache.damage_source or \'fallback\'
        ai_peek.set_movement(e, active_point_pos, local_player, 800)
        if force_defensive and (ai_peek.cache.bt_risk or 0) >= 24
            and ai_peek.weapon_can_fire(local_player, entity.get_player_weapon(local_player)) then
            e.force_defensive = true
        end
        ai_peek.returning = false
        ai_peek.should_return = auto_return
        ai_peek.disable_dt = false
        ai_peek.cache.native_return_only = false
        ai_peek.cache.return_start_tick = nil
        ai_peek.set_state('peeking\', decision and decision.reason or 'peeking\')
    elseif local_override then
        ai_peek.returning = false
        ai_peek.should_return = false
        ai_peek.dt_teleport = false
        ai_peek.disable_dt = false
        ai_peek.cache.return_allowed = false
        ai_peek.cache.return_start_tick = nil
        ai_peek.cache.native_return_only = false
        reset_peek_progress()
        reset_peek_session()
        restore_dt_after_return()
        set_ai_return_phase('idle')
        restore_quickpeek()
    elseif ai_peek.should_return and ai_peek.cache.return_allowed == true then
        if not ai_peek.returning then
            ai_peek.cache.return_start_tick = globals.tickcount()
            set_ai_return_phase(\'returning')
            ai_peek.cache.native_return_only = false
        end
        ai_peek.returning = true
        ai_peek.dt_teleport = true
        ai_peek.set_state(\'returning', ai_peek.cache.return_reason or ai_peek.cache.last_reason)
    end

    if not ai_peek.returning then
        ai_peek.cache.last_returning_time = globals.tickcount()
    end

    if ai_peek.returning then
        if dist_to_middle < 6 then
            ai_peek.returning = false
            ai_peek.should_return = false
            ai_peek.dt_teleport = false
            ai_peek.disable_dt = false
            ai_peek.cache.return_allowed = false
            ai_peek.cache.return_start_tick = nil
            ai_peek.cache.return_stuck_ticks = 0
            ai_peek.cache.return_last_dist = 0
            ai_peek.cache.native_return_only = false
            reset_peek_progress()
            reset_peek_session()
            local return_reason = ai_peek.cache.return_reason or ai_peek.cache.last_reason
            if return_should_release_dt(return_reason) then
                if not start_dt_return_cooldown() then
                    set_ai_return_phase(\'idle')
                end
            else
                set_ai_return_phase('idle\')
            end
            restore_dt_after_return()
            ai_peek.set_state(\'cooldown\', \'returned\')
        else
            ai_peek.dt_teleport = true
            local return_ticks = globals.tickcount() - (ai_peek.cache.return_start_tick or globals.tickcount())
            local native_return_takeover = AI_PEEK_USE_NATIVE_QUICKPEEK
                and ai_peek.cache.native_return_only == true
            if not native_return_takeover then
                ai_peek.set_movement(e, middle_pos, local_player, dist_to_middle > 36 and 800 or 450)
            end
            local return_reason = ai_peek.cache.return_reason or ai_peek.cache.last_reason or \'\'
            if return_ticks >= (profile.return_release_ticks or 2)
                and return_should_release_dt(return_reason) then
                release_dt_for_return()
            end
            if force_defensive and return_ticks <= 2
                and ai_peek.weapon_can_fire(local_player, entity.get_player_weapon(local_player)) then
                e.force_defensive = true
            end
        end
    end

    if AI_PEEK_USE_NATIVE_QUICKPEEK and ai_peek.returning then
        override_set(refs.quickpeek_mode[1], \'Retreat on shot', \'Retreat on key release\')
    else
        override_unset(refs.quickpeek_mode[1])
    end
end

ai_peek.handle = function(e)
    if AI_PEEK_LEGACY_SAFE_CORE then
        return handle_legacy_safe_core(e)
    end

    if not ai_peek_core_ok then return end
    if safe_get(ui_ai.enable, false) ~= true then
        if ai_peek.hotkeys.main or ai_peek.visual.active or ai_peek.targeting or ai_peek.returning then
            reset_ai_state()
            ai_peek.hotkeys.main = false
        end
        return
    end
    local local_player = entity.get_local_player()
    if local_player == nil or not entity.is_alive(local_player) then
        if ai_peek.visual.active or ai_peek.targeting or ai_peek.returning
            or ai_peek.should_return or ai_peek.cache.decision ~= nil
            or ai_peek.cache.return_allowed == true
            or ai_peek.cache.return_dt_released == true
            or ai_peek.hotkeys.main then
            hard_reset_ai_state(\'dead\')
        end
        return
    end

    local weapon = entity.get_player_weapon(local_player)
    if not weapon then return end
    if ai_peek.cmd_jumping(e) then
        ai_peek.cache.last_reason = \'jump guard\'
        restore_quickpeek()
        return
    end

    if ai_peek_fake_duck_active() then
        ai_peek_block_for_fd(\'fake duck\')
        return
    end
    local distance_mode = safe_get(ui_ai.distance, \'aggressive\')
    local profile = ai_peek.resolve_profile(distance_mode, local_player, weapon)
    if profile == nil then
        if ai_peek.visual.active or ai_peek.targeting or ai_peek.returning
            or ai_peek.should_return or ai_peek.cache.decision ~= nil then
            reset_ai_state()
        end
        ai_peek.hotkeys.main = false
        ai_peek.cache.last_reason = \'weapon disabled\'
        return
    end
    ai_peek.passive_record_update()

    if globals.tickcount() < (ai_peek.cache.fd_cooldown_until or 0) then
        restore_quickpeek()
        ai_peek.hotkeys.main = false
        ai_peek.targeting = false
        ai_peek.cache.decision = nil
        ai_peek.cache.last_reason = \'fake duck cooldown'
        return
    end

    local pressed = main_key()

    if pressed and not ai_peek.hotkeys.main then
        ai_peek.capture_origin(local_player)
        ai_peek.cache.origin_key_locked = ai_peek.cache.origin_valid == true
        ai_peek.set_state(\'armed', ai_peek.cache.origin_valid and \'armed\' or \'origin wait')
        ai_peek.hotkeys.main = true
    elseif not pressed and ai_peek.hotkeys.main then
        stop_ai_peek_on_key_release('key release stop')
    end

    local dt_relax_active = globals.tickcount() < (rawget(_G, \'INFINIX_DT_RELAX_UNTIL') or 0)

    local force_baim = safe_get(refs.force_body, false)
    if force_baim and not ai_peek.hotkeys.force_baim then
        ai_peek.update_hitboxes(true)
        ai_peek.hotkeys.force_baim = true
    elseif not force_baim and ai_peek.hotkeys.force_baim then
        ai_peek.update_hitboxes(false)
        ai_peek.hotkeys.force_baim = false
    end

    local continue_return_without_key = false

    if not pressed and not continue_return_without_key then
        if ai_peek.visual.active or ai_peek.targeting or ai_peek.returning
            or ai_peek.should_return or ai_peek.cache.decision ~= nil then
            stop_ai_peek_on_key_release(\'key release stop\')
        end
        return
    end

    local modes = safe_get(ui_ai.mode, {})
    local auto_return = table_contains(modes, 'automatically teleport back\')
    local force_defensive = table_contains(modes, \'force defensive')
    local director_move_block, director_move_reason = ai_peek_director_block(\'move\')
    local director_commit_block, director_commit_reason = ai_peek_director_block(\'commit\')

    ai_peek.peek_profile = profile
    ai_peek.amount = profile.amount
    ai_peek.step_distance = profile.step

    local flags = entity.get_prop(local_player, \'m_fFlags\') or 0
    local local_override = bit.band(flags, bit.lshift(1, 0)) ~= 1

    local middle_pos = ai_peek.cache.middle_pos
    local lp_origin = vector(entity.get_origin(local_player))
    local dist_to_middle = middle_pos:dist2d(lp_origin)
    local post_shot_throttle = globals.tickcount() < (rawget(_G, \'INFINIX_POST_SHOT_THROTTLE_UNTIL\') or 0)
    if post_shot_throttle then
        apply_quickpeek(profile)
        begin_native_post_shot_return(dist_to_middle, auto_return)
    elseif native_post_shot_return_active() then
        finish_native_post_shot_return(dist_to_middle)
    end
    restore_dt_on_released_key(pressed, dist_to_middle)
    if native_post_shot_settle_active(dist_to_middle) then
        apply_quickpeek(profile)
        ai_peek.cache.decision = nil
        ai_peek.targeting = false
        ai_peek.should_return = false
        ai_peek.cache.active_point_index = 0
        ai_peek.cache.last_reason = \'native post shot settle\'
        ai_peek.set_state(\'cooldown', \'native post shot settle\')
        return
    end
    if not post_shot_throttle and velocity_return_cooldown_active(local_player) then
        ai_peek.cache.decision = nil
        ai_peek.targeting = false
        ai_peek.should_return = false
        ai_peek.cache.active_point_index = 0
        ai_peek.cache.last_reason = \'velocity cooldown\'
        ai_peek.set_state(\'cooldown\', \'velocity cooldown\')
        return
    end
    if not post_shot_throttle and dt_return_cooldown_active() then
        ai_peek.cache.decision = nil
        ai_peek.targeting = false
        ai_peek.should_return = false
        ai_peek.cache.active_point_index = 0
        ai_peek.cache.last_reason = 'dt recharge cooldown'
        ai_peek.set_state('cooldown\', \'dt recharge cooldown\')
        return
    end
    local origin_ok, origin_reason = ai_peek.origin_valid(local_player, middle_pos, lp_origin, dist_to_middle)
    if post_shot_throttle then
        ai_peek.cache.session_force_return_now = false
    end

    local origin_locked = ai_peek.cache.return_allowed == true
        or ai_peek.cache.session_active == true
        or ai_peek.targeting == true
        or ai_peek.returning == true
        or (ai_peek.cache.origin_key_locked == true and ai_peek.cache.origin_valid == true)
        or (ai_peek.cache.native_qp_origin_locked == true and ai_peek.cache.origin_valid == true)

    if not origin_locked and ((local_override and dist_to_middle <= 18)
        or ((not auto_return) and not ai_peek.targeting and not ai_peek.returning and dist_to_middle <= 18)
        or (dist_to_middle > 300 and not ai_peek.returning)) then
        ai_peek.capture_origin(local_player)
        middle_pos = ai_peek.cache.middle_pos
        dist_to_middle = middle_pos:dist2d(lp_origin)
        origin_ok, origin_reason = ai_peek.origin_valid(local_player, middle_pos, lp_origin, dist_to_middle)
    elseif not origin_locked and not origin_ok and dist_to_middle <= 18 and ai_peek.is_grounded(local_player) then
        ai_peek.capture_origin(local_player)
        middle_pos = ai_peek.cache.middle_pos
        dist_to_middle = middle_pos:dist2d(lp_origin)
        origin_ok, origin_reason = ai_peek.origin_valid(local_player, middle_pos, lp_origin, dist_to_middle)
    end

    ai_peek.visual.active = true

    local active_point_pos, active_point_index = nil, 0
    local decision = nil
    local return_only = ai_peek.returning == true or ai_peek.cache.session_force_return_now == true
    if director_move_block and ai_peek.cache.session_active == true then
        mark_peek_session_lost(director_move_reason or 'shot director\')
        return_only = true
    end
    if return_only then
        ai_peek.cache.decision = nil
        ai_peek.cache.last_reason = post_shot_throttle and 'post shot return\'
            or ai_peek.cache.session_lost_reason or ai_peek.cache.last_reason or \'return\'
    elseif director_move_block then
        ai_peek.cache.decision = nil
        ai_peek.cache.last_reason = director_move_reason or 'shot director\'
    elseif not local_override then
        ai_peek.set_state(\'scanning\', ai_peek.cache.last_reason)
        local target_mode = safe_get(ui_ai.target, \'current threat')
        local return_guard = globals.tickcount() < (ai_peek.cache.forced_return_until or 0)
        if post_shot_throttle then
            ai_peek.cache.decision = nil
            ai_peek.cache.last_reason = \'shot throttle\'
        elseif ai_peek.cache.session_active == true and not ai_peek.returning then
            decision = locked_peek_decision(local_player, profile)
        else
            decision = return_guard and nil or ai_peek.cached_decision(middle_pos, target_mode, distance_mode)
        end
        if decision == nil and ai_peek.cache.session_active ~= true and not post_shot_throttle then
            local scanned = ai_peek.select_best_target(local_player, middle_pos, target_mode)
            if return_guard then
                local interrupt_score = (profile.min_score or -4) + 4
                local interrupt_damage = scanned ~= nil
                    and (scanned.damage or 0) >= math.max(8, scanned.required_damage or 1)
                if scanned ~= nil and (interrupt_damage or ((scanned.damage or 0) >= 8 and (scanned.score or 0) >= interrupt_score)) then
                    decision = scanned
                    ai_peek.cache.forced_return_until = 0
                else
                    ai_peek.cache.last_reason = post_shot_throttle and \'return guard throttle\' or \'return guard\'
                end
            else
                decision = scanned
            end
            if decision ~= nil then
                ai_peek.store_decision(decision, middle_pos, target_mode, distance_mode)
            end
        end
    elseif not ai_peek.returning then
        ai_peek.cache.decision = nil
        ai_peek.cache.last_reason = 'air'
    end

    if decision ~= nil then
        active_point_pos = decision.pos
        active_point_index = decision.index or 0
        ai_peek.cache.current_target = decision.target
        ai_peek.cache.trace_damage = decision.damage or 0
        ai_peek.cache.live_damage = decision.live_damage or decision.damage or 0
        ai_peek.cache.pred_damage = decision.pred_damage or 0
        ai_peek.cache.commit_kind = decision.commit_kind or \'real'
        ai_peek.cache.bt_delta = decision.bt_delta or 0
        ai_peek.cache.bt_quality = decision.bt_quality or (decision.status and decision.status.quality) or 100
        ai_peek.cache.required_damage = decision.required_damage or 1
        ai_peek.cache.minimum_damage = decision.minimum_damage or ai_peek.cache.required_damage
        ai_peek.cache.damage_source = decision.damage_source or \'fallback\'
        ai_peek.cache.target_health = decision.target_health or 0
        ai_peek.cache.damage_gap = decision.damage_gap or math.max(0, (ai_peek.cache.required_damage or 1) - (decision.damage or 0))
        ai_peek.cache.bt_state = decision.status and decision.status.reason or \'clean\'
        ai_peek.cache.bt_risk = decision.status and decision.status.risk or 0
    else
        if not post_shot_throttle and ai_peek.cache.return_allowed == true and ai_peek.cache.session_active == true and not ai_peek.returning then
            mark_peek_session_lost(peek_session_lost_reason())
        end
        ai_peek.cache.current_target = 0
        ai_peek.cache.trace_damage = 0
        ai_peek.cache.live_damage = 0
        ai_peek.cache.pred_damage = 0
        ai_peek.cache.target_exposure = 0
        ai_peek.cache.commit_kind = \'none\'
        ai_peek.cache.bt_delta = 0
        ai_peek.cache.bt_candidate_damage = 0
        ai_peek.cache.bt_allowed = false
        ai_peek.cache.bt_reject_reason = 'idle\'
        ai_peek.cache.live_vs_bt_delta = 0
        ai_peek.cache.bt_quality = 100
        ai_peek.cache.required_damage = 0
        ai_peek.cache.minimum_damage = 0
        ai_peek.cache.damage_source = 'idle\'
        ai_peek.cache.target_health = 0
        ai_peek.cache.damage_gap = 0
    end

    ai_peek.cache.active_point_index = active_point_index
    ai_peek.targeting = active_point_pos ~= nil
    if not ai_peek.targeting and not ai_peek.returning and ai_peek.cache.return_allowed ~= true then
        restore_quickpeek()
    end

    local commit_ready, commit_reason = ai_peek.commit_ready(local_player, weapon)
    local record_commit_limit = AI_PEEK_RECORD_COMMIT_TICKS
    if ai_peek.targeting and decision ~= nil and entity.is_dormant(decision.target) then
        record_commit_limit = AI_PEEK_DORMANT_COMMIT_TICKS
    end
    if ai_peek.targeting and decision ~= nil and (decision.record_age or 0) > record_commit_limit then
        commit_ready, commit_reason = false, \'record stale\'
    end
    if ai_peek.targeting and ai_peek.cache.session_active == true and commit_reason == \'dt recharge' then
        commit_ready, commit_reason = true, \'active dt hold\'
    end
    if ai_peek.targeting and director_commit_block then
        commit_ready, commit_reason = false, director_commit_reason or \'shot director'
    end
    if ai_peek.targeting and not origin_ok then
        commit_ready, commit_reason = false, origin_reason or \'origin invalid\'
    end
    local soft_commit_wait = false
    if ai_peek.targeting and not commit_ready then
        local cr = tostring(commit_reason or '\')
        soft_commit_wait = cr:find(\'weapon wait\', 1, true) ~= nil
            or cr:find(\'weapon not ready', 1, true) ~= nil
            or cr:find(\'dt recharge\', 1, true) ~= nil
            or cr:find(\'accuracy', 1, true) ~= nil
            or cr:find(\'shot director\', 1, true) ~= nil
        active_point_pos = nil
        active_point_index = 0
        ai_peek.targeting = false
        ai_peek.cache.active_point_index = 0
        ai_peek.cache.last_reason = commit_reason or 'not ready'
        if dist_to_middle > 18 and not soft_commit_wait then
            if origin_ok then
                force_ai_return(\'commit \' .. tostring(commit_reason or \'not ready\'))
            else
                cancel_ai_return(origin_reason or \'origin invalid\', local_player)
            end
        else
            reset_peek_progress()
            if ai_peek.cache.session_active == true then
                reset_peek_session()
            end
        end
    end

    if not post_shot_throttle and not soft_commit_wait and not ai_peek.targeting and dist_to_middle > 18 and ai_peek.cache.return_allowed == true then
        if origin_ok then
            local lost_reason = ai_peek.cache.session_lost_reason
            if lost_reason == nil or lost_reason == \'idle\' or lost_reason == \'active\' then
                lost_reason = auto_return and 'return guard\' or 'failed peek return\'
            end
            force_ai_return(lost_reason)
            ai_peek.cache.forced_return_until = math.max(ai_peek.cache.forced_return_until or 0, globals.tickcount() + (profile.return_guard_ticks or 3))
        else
            cancel_ai_return(origin_reason or \'origin invalid', local_player)
        end
    elseif not ai_peek.targeting and dist_to_middle > 18 and ai_peek.cache.return_allowed ~= true then
        ai_peek.should_return = false
        ai_peek.returning = false
        ai_peek.dt_teleport = false
        restore_dt_after_return()
        restore_quickpeek()
    end

    if not auto_return and not ai_peek.targeting and dist_to_middle <= 18 then
        ai_peek.should_return = false
    end

    if not ai_peek.targeting
        and not ai_peek.returning
        and ai_peek.cache.return_allowed == true
        and ai_peek.cache.session_force_return_now == true then
        if origin_ok then
            force_ai_return(ai_peek.cache.session_lost_reason or 'lost return\')
            ai_peek.cache.forced_return_until = math.max(ai_peek.cache.forced_return_until or 0, globals.tickcount() + (profile.return_guard_ticks or 3))
        else
            cancel_ai_return(origin_reason or 'origin invalid', local_player)
        end
    end

    if ai_peek.targeting then
        start_peek_session(decision, active_point_index)
        ai_peek.cache.return_allowed = true
        apply_quickpeek(profile)
        ai_peek.set_state(\'peeking\', decision and decision.reason or \'peeking')
        restore_dt_after_return()
        ai_peek.visual.target_pos = active_point_pos ~= nil
            and vector(active_point_pos.x, active_point_pos.y, (middle_pos and middle_pos.z) or active_point_pos.z or 0)
            or nil
        ai_peek.visual.fading = false
        ai_peek.visual.fade_start_tick = 0
        ai_peek.cache.last_good_pos = active_point_pos
        ai_peek.cache.last_good_index = active_point_index
        ai_peek.cache.last_good_target = ai_peek.cache.current_target
        ai_peek.cache.last_good_tick = globals.tickcount()
        ai_peek.cache.last_good_damage = ai_peek.cache.trace_damage or 0
        ai_peek.cache.last_good_required_damage = ai_peek.cache.required_damage or 1
        ai_peek.cache.last_good_damage_source = ai_peek.cache.damage_source or 'fallback\'
        restore_dt_after_return()

        local tick = globals.tickcount()
        local point_dist = active_point_pos:dist2d(lp_origin)
        local same_peek = ai_peek.cache.peek_target == ai_peek.cache.current_target
            and ai_peek.cache.peek_point_index == active_point_index
            and ai_peek.cache.peek_start_tick ~= nil

        if not same_peek then
            ai_peek.cache.peek_target = ai_peek.cache.current_target
            ai_peek.cache.peek_point_index = active_point_index
            ai_peek.cache.peek_start_tick = tick
            ai_peek.cache.peek_start_dist = point_dist
            ai_peek.cache.peek_last_dist = point_dist
            ai_peek.cache.peek_no_progress_ticks = 0
            ai_peek.cache.peek_last_damage_tick = (ai_peek.cache.trace_damage or 0) >= math.max(1, ai_peek.cache.required_damage or 1) and tick or 0
        else
            if (ai_peek.cache.trace_damage or 0) >= math.max(1, ai_peek.cache.required_damage or 1)
                and decision ~= nil and decision.reason ~= \'memory' then
                ai_peek.cache.peek_last_damage_tick = tick
            end
            if point_dist >= (ai_peek.cache.peek_last_dist or point_dist) - 1.5 then
                ai_peek.cache.peek_no_progress_ticks = (ai_peek.cache.peek_no_progress_ticks or 0) + 1
            else
                ai_peek.cache.peek_no_progress_ticks = 0
            end
            ai_peek.cache.peek_last_dist = point_dist
        end

        local elapsed = tick - (ai_peek.cache.peek_start_tick or tick)
        local progress = (ai_peek.cache.peek_start_dist or point_dist) - point_dist
        local no_damage_ticks = tick - (ai_peek.cache.peek_last_damage_tick or 0)
        local required_damage = math.max(1, ai_peek.cache.required_damage or 1)
        local trace_damage = ai_peek.cache.trace_damage or 0
        local below_required = trace_damage < required_damage
        local failed_peek = false
        local locked_path_len = math.max(1, tonumber(ai_peek.cache.session_path_len) or 1)
        local locked_progress = point_dist / locked_path_len
        local current_exposure = ai_peek.point_exposure_penalty(lp_origin, ai_peek.cache.current_target, true)
        ai_peek.cache.target_exposure = current_exposure
        local unsafe_current = current_exposure >= (profile.hard_exposure or 28)
        local locked_boundary = ai_peek.cache.session_active == true
            and (point_dist <= (profile.arrive_radius or 24) or locked_progress <= 0.18)
        local session_elapsed = ai_peek.cache.session_active == true
            and math.max(0, tick - (ai_peek.cache.session_started_tick or tick)) or elapsed
        local commit_window = ai_peek.cache.session_active == true
            and session_elapsed < (profile.commit_hold_ticks or 3)
            and not locked_boundary
        local target_flags = 0
        local target_speed = 0
        if ai_peek.cache.current_target ~= 0 then
            target_flags = entity.get_prop(ai_peek.cache.current_target, 'm_fFlags\') or 0
            local tvx, tvy = entity.get_prop(ai_peek.cache.current_target, \'m_vecVelocity\')
            if tvx == nil then
                local rec = ai_peek.cache.record_cache[ai_peek.cache.current_target]
                local vel = type(rec) == \'table' and rec.velocity or nil
                tvx, tvy = vel and vel.x or 0, vel and vel.y or 0
            end
            tvx, tvy = tonumber(tvx) or 0, tonumber(tvy) or 0
            target_speed = math.sqrt(tvx * tvx + tvy * tvy)
        end
        local target_airborne = ai_peek.cache.current_target ~= 0 and bit.band(target_flags, 1) ~= 1
        local bait_damage_ok = trace_damage >= math.max(8, math.floor(required_damage * 0.65))
        local bait_window = ai_peek.cache.session_active == true
            and ai_peek.cache.current_target ~= 0
            and bait_damage_ok
            and (target_airborne or target_speed > 160)
            and session_elapsed < (profile.bait_hold_ticks or 2)
        if locked_boundary and (ai_peek.cache.session_boundary_tick or 0) == 0 then
            ai_peek.cache.session_boundary_tick = tick
        elseif not locked_boundary then
            ai_peek.cache.session_boundary_tick = 0
        end
        local boundary_ticks = locked_boundary and (tick - (ai_peek.cache.session_boundary_tick or tick)) or 0
        if unsafe_current
            and not bait_window
            and below_required
            and session_elapsed >= (profile.unsafe_return_ticks or 1) then
            failed_peek = true
            ai_peek.cache.last_reason = \'unsafe exposure return\'
        elseif not commit_window
            and below_required and elapsed >= (profile.travel_ticks or 3)
            and progress < (profile.min_progress or 8)
            and (ai_peek.cache.peek_no_progress_ticks or 0) >= 2 then
            failed_peek = true
            ai_peek.cache.last_reason = trace_damage > 0 and \'low damage progress' or 'no peek progress\'
        elseif ai_peek.cache.session_active == true
            and locked_boundary
            and below_required
            and boundary_ticks >= (profile.boundary_grace_ticks or 1) then
            failed_peek = true
            ai_peek.cache.last_reason = ai_peek.cache.session_air_probe and \'air probe no real\' or \'boundary no real\'
        elseif ai_peek.cache.session_active == true
            and locked_boundary
            and boundary_ticks >= (profile.boundary_hold_ticks or 3) then
            failed_peek = true
            ai_peek.cache.last_reason = ai_peek.cache.session_air_probe and 'air probe hold done' or 'boundary hold done\'
        elseif not commit_window
            and below_required
            and ai_peek.cache.session_active == true
            and elapsed >= math.max(1, (profile.fail_ticks or 2))
            and no_damage_ticks >= math.max(1, (profile.fail_ticks or 2)) then
            failed_peek = true
            ai_peek.cache.last_reason = trace_damage > 0 and \'locked low damage quick return\' or \'locked no damage quick return'
        elseif not commit_window
            and below_required
            and ai_peek.cache.session_active == true
            and elapsed >= (profile.fail_ticks or 2)
            and locked_progress < 0.20 then
            failed_peek = true
            ai_peek.cache.last_reason = trace_damage > 0 and 'locked low damage return\' or \'locked no damage return\'
        elseif not commit_window
            and below_required
            and point_dist <= (profile.arrive_radius or 24)
            and no_damage_ticks >= (profile.fail_ticks or 2) then
            failed_peek = true
            ai_peek.cache.last_reason = trace_damage > 0 and 'low damage return' or \'no damage return'
        end

        if failed_peek then
            if origin_ok then
                force_ai_return(ai_peek.cache.last_reason)
            else
                cancel_ai_return(origin_reason or \'origin invalid', local_player)
            end
        else
            if locked_boundary then
                e.in_forward = 0
                e.in_back = 0
                e.in_moveleft = 0
                e.in_moveright = 0
                e.forwardmove = 0
                e.sidemove = 0
            elseif ai_peek.cache.session_active == true and ai_peek.cache.session_point_pos ~= nil then
                local session_dist = ai_peek.cache.session_point_pos:dist2d(lp_origin)
                local session_speed = session_dist > 36 and 800 or 450
                ai_peek.set_movement(e, ai_peek.cache.session_point_pos, local_player, session_speed)
            else
                ai_peek.set_movement(e, active_point_pos, local_player, 800)
            end
            if force_defensive and not dt_relax_active and (ai_peek.cache.bt_risk or 0) >= 24
                and ai_peek.weapon_can_fire(local_player, entity.get_player_weapon(local_player)) then
                e.force_defensive = true
            end
            ai_peek.returning = false
            ai_peek.should_return = auto_return
            ai_peek.disable_dt = false
            ai_peek.cache.return_start_tick = nil
            ai_peek.cache.return_stuck_ticks = 0
            ai_peek.cache.return_last_dist = 0
        end
    elseif local_override and not ai_peek.returning then
        if ai_peek.cache.return_allowed == true and ai_peek.cache.session_active == true and dist_to_middle > 18 then
            mark_peek_session_lost('air return')
            if origin_ok then
                force_ai_return(\'air return\')
            else
                cancel_ai_return(origin_reason or \'origin invalid\', local_player)
            end
        else
            ai_peek.returning = false
            ai_peek.should_return = false
            ai_peek.dt_teleport = false
            ai_peek.disable_dt = false
            ai_peek.cache.return_allowed = false
            ai_peek.cache.return_start_tick = nil
            reset_peek_progress()
            reset_peek_session()
            restore_dt_after_return()
            restore_quickpeek()
        end
    elseif ai_peek.should_return then
        if ai_peek.cache.return_allowed ~= true then
            ai_peek.returning = false
            ai_peek.should_return = false
            ai_peek.dt_teleport = false
            restore_dt_after_return()
            restore_quickpeek()
        elseif origin_ok then
            if not ai_peek.returning then
                ai_peek.cache.return_start_tick = globals.tickcount()
                ai_peek.cache.return_session_id = (tonumber(ai_peek.cache.return_session_id) or 0) + 1
                ai_peek.cache.return_reason = ai_peek.cache.last_reason or 'return'
                ai_peek.cache.return_release_done = false
                ai_peek.cache.native_return_only = false
            end
            ai_peek.returning = true
            ai_peek.dt_teleport = true
            ai_peek.set_state(\'returning', ai_peek.cache.last_reason)
        else
            cancel_ai_return(origin_reason or 'origin invalid\', local_player)
        end
    end

    if not ai_peek.returning then
        ai_peek.cache.last_returning_time = globals.tickcount()
    end

    if ai_peek.returning then
        if not origin_ok then
            cancel_ai_return(origin_reason or \'origin invalid', local_player)
        elseif dist_to_middle < 6 then
            ai_peek.returning = false
            ai_peek.should_return = false
            ai_peek.dt_teleport = false
            ai_peek.disable_dt = false
            ai_peek.cache.return_allowed = false
            ai_peek.cache.return_start_tick = nil
            ai_peek.cache.return_stuck_ticks = 0
            ai_peek.cache.return_last_dist = 0
            reset_peek_progress()
            reset_peek_session()
            local return_reason = ai_peek.cache.return_reason or ai_peek.cache.last_reason
            if return_should_release_dt(return_reason) then
                start_dt_return_cooldown()
            elseif return_needs_recharge_wait(return_reason) then
                start_dt_return_cooldown(true)
            else
                set_ai_return_phase(\'idle')
            end
            restore_dt_after_return()
            ai_peek.set_state(\'cooldown', \'returned\')
        else
            ai_peek.dt_teleport = true
            local return_reason = ai_peek.cache.return_reason or ai_peek.cache.last_reason or \'\'
            local native_return_takeover = AI_PEEK_USE_NATIVE_QUICKPEEK
                and ai_peek.cache.native_return_only == true
            if not native_return_takeover then
                local return_speed = dist_to_middle > 36 and 800 or (dist_to_middle > 16 and 450 or 220)
                ai_peek.set_movement(e, middle_pos, local_player, return_speed)
            end
            local return_ticks = globals.tickcount() - (ai_peek.cache.return_start_tick or globals.tickcount())
            if return_ticks >= (profile.return_release_ticks or 2)
                and return_should_release_dt(return_reason) then
                release_dt_for_return()
            end
            local last_dist = tonumber(ai_peek.cache.return_last_dist) or 0
            if last_dist > 0 and dist_to_middle >= last_dist - 1 then
                ai_peek.cache.return_stuck_ticks = (ai_peek.cache.return_stuck_ticks or 0) + 1
            else
                ai_peek.cache.return_stuck_ticks = 0
            end
            ai_peek.cache.return_last_dist = dist_to_middle
            if (ai_peek.cache.return_stuck_ticks or 0) >= 8 then
                ai_peek.cache.decision = nil
                ai_peek.cache.last_good_pos = nil
                ai_peek.cache.last_good_target = 0
                cancel_ai_return(\'return stuck\', local_player)
            end
            if ai_peek.returning then
                if force_defensive and not dt_relax_active and return_ticks <= 2
                    and ai_peek.weapon_can_fire(local_player, entity.get_player_weapon(local_player)) then
                    e.force_defensive = true
                end
            end
        end
    end

    if AI_PEEK_USE_NATIVE_QUICKPEEK and ai_peek.returning then
        override_set(refs.quickpeek_mode[1], 'Retreat on shot', 'Retreat on key release\')
    else
        override_unset(refs.quickpeek_mode[1])
    end

end

local function ai_world_to_screen(pos, lift)
    if pos == nil or type(renderer.world_to_screen) ~= \'function\' then return nil, nil end
    return renderer.world_to_screen(pos.x, pos.y, (pos.z or 0) + (lift or 4))
end

local function ai_line_3d(a, b, r, g, bl, alpha)
    if type(renderer.line) ~= \'function\' then return end
    local ax, ay = ai_world_to_screen(a, 4)
    local bx, by = ai_world_to_screen(b, 4)
    if ax ~= nil and bx ~= nil then
        renderer.line(ax, ay, bx, by, r, g, bl, alpha)
    end
end

local function ai_ring_3d(center, radius, r, g, bl, alpha)
    if type(renderer.line) ~= 'function\' or center == nil then return end
    local prev_x, prev_y = nil, nil
    for i = 0, 16 do
        local a = (i / 16) * math.pi * 2
        local p = vector(center.x + math.cos(a) * radius, center.y + math.sin(a) * radius, center.z or 0)
        local x, y = ai_world_to_screen(p, 3)
        if x ~= nil and prev_x ~= nil then
            renderer.line(prev_x, prev_y, x, y, r, g, bl, alpha)
        end
        prev_x, prev_y = x, y
    end
end

local function ai_diamond_3d(pos, radius, r, g, bl, alpha)
    local x, y = ai_world_to_screen(pos, 7)
    if x == nil or type(renderer.line) ~= 'function\' then return end
    renderer.line(x, y - radius, x + radius, y, r, g, bl, alpha)
    renderer.line(x + radius, y, x, y + radius, r, g, bl, alpha)
    renderer.line(x, y + radius, x - radius, y, r, g, bl, alpha)
    renderer.line(x - radius, y, x, y - radius, r, g, bl, alpha)
end

local function ai_cylinder_3d(origin, target, r, g, bl, alpha, phase, radius_scale)
    if origin == nil or target == nil or type(renderer.line) ~= \'function\' then return end
    phase = math.max(0, math.min(1, tonumber(phase) or 1))
    if phase <= 0.01 then return end
    radius_scale = math.max(0.45, math.min(1.25, tonumber(radius_scale) or 1))
    local cx, cy = target.x or origin.x or 0, target.y or origin.y or 0
    local base_z = origin.z or target.z or 0
    local radius, z0, z1, segments = 7 * radius_scale, base_z + 2, base_z + 2 + (78 * phase), 8
    local bottom, top = {}, {}
    for i = 1, segments do
        local a = (i - 1) * 6.28318530718 / segments
        local px, py = cx + math.cos(a) * radius, cy + math.sin(a) * radius
        local bx, by = ai_world_to_screen(vector(px, py, z0), 0)
        local tx, ty = ai_world_to_screen(vector(px, py, z1), 0)
        bottom[i], top[i] = bx ~= nil and { bx, by } or nil, tx ~= nil and { tx, ty } or nil
    end
    alpha = math.floor((tonumber(alpha) or 0) * phase + 0.5)
    local fill_alpha = math.floor(alpha * 0.10)
    local line_alpha = math.min(95, math.floor(alpha * 0.72))
    local soft_alpha = math.floor(line_alpha * 0.58)
    for i = 1, segments do
        local ni = i == segments and 1 or i + 1
        local b1, b2, t1, t2 = bottom[i], bottom[ni], top[i], top[ni]
        if b1 ~= nil and b2 ~= nil and t1 ~= nil and t2 ~= nil then
            if type(renderer.triangle) == \'function\' then
                renderer.triangle(b1[1], b1[2], b2[1], b2[2], t2[1], t2[2], r, g, bl, fill_alpha)
                renderer.triangle(b1[1], b1[2], t2[1], t2[2], t1[1], t1[2], r, g, bl, fill_alpha)
            end
            renderer.line(t1[1], t1[2], t2[1], t2[2], r, g, bl, line_alpha)
            renderer.line(b1[1], b1[2], b2[1], b2[2], r, g, bl, soft_alpha)
            if i % 2 == 1 then
                renderer.line(b1[1], b1[2], t1[1], t1[2], r, g, bl, soft_alpha)
            end
        end
    end
end

local function ai_intent_color()
    local r, g, b = infinix_accent()
    return r, g, b
end

local function ai_visual_smooth_pos(current, target, rate, dt)
    if target == nil then return current end
    if current == nil then return vector(target.x, target.y, target.z or 0) end
    dt = math.max(0, math.min(0.05, tonumber(dt) or 0))
    local k = 1 - math.exp(-dt * (rate or 18))
    return vector(
        current.x + ((target.x or current.x) - current.x) * k,
        current.y + ((target.y or current.y) - current.y) * k,
        (current.z or 0) + (((target.z or current.z or 0) - (current.z or 0)) * k)
    )
end

local function ai_visual_smooth_value(current, target, rate, dt)
    dt = math.max(0, math.min(0.05, tonumber(dt) or 0))
    local k = 1 - math.exp(-dt * (rate or 16))
    return current + (target - current) * k
end

ai_peek.render = function()
    if not ai_peek_core_ok then return end
    local local_player = entity.get_local_player()
    if local_player == nil or not entity.is_alive(local_player) then return end

    if not ai_peek.visual.active then return end

    local visual_style = safe_get(ui_ai.visual, \'minimal\')
    local r, g, b = ai_intent_color()
    local pulse = (math.sin((globals.realtime() or 0) * 2.2) + 1) * 0.5
    local origin = ai_peek.cache.middle_pos
    local lp_origin = vector(entity.get_origin(local_player))
    local vis = ai_peek.visual
    local selected = ai_peek.targeting == true and vis.target_pos or nil
    local ft = globals.absoluteframetime and globals.absoluteframetime()
        or globals.frametime and globals.frametime() or (1 / 120)
    if ft <= 0 or ft ~= ft then ft = 1 / 120 end

    if visual_style ~= \'off' then
        local visual_fading = ai_peek.returning == true or vis.fading == true
        if origin ~= nil then
            local ring_alpha = visual_fading and math.floor(110 * math.max(0, math.min(1, tonumber(vis.phase) or 0))) or 78
            ai_ring_3d(origin, ai_peek.returning and (13 + pulse * 2) or 12, r, g, b, ring_alpha)
        end
        local visual_target = selected or (visual_fading and vis.pos or nil)

        if visual_target ~= nil then
            local returning = visual_fading
            local dist_home = origin ~= nil and lp_origin:dist2d(origin) or 999
            local fade_start_tick = vis.fading and (vis.fade_start_tick or globals.tickcount())
                or (ai_peek.cache.return_start_tick or globals.tickcount())
            local return_ticks = returning and (globals.tickcount() - fade_start_tick) or 0
            local return_fade = returning and math.max(0, math.min(1, 1 - (return_ticks / 4))) or 1
            if returning and dist_home <= 26 then
                return_fade = return_fade * math.max(0, math.min(1, dist_home / 26))
            end
            local pos_rate = returning and 28 or 18
            local target_phase = returning and (0.36 * return_fade) or 1
            local phase_rate = returning and 34 or 14
            local radius_scale = returning and (0.56 + 0.18 * return_fade) or 1
            local cylinder_alpha = returning
                and math.floor((34 + math.floor(pulse * 8)) * return_fade)
                or (70 + math.floor(pulse * 18))
            vis.pos = ai_visual_smooth_pos(vis.pos, visual_target, pos_rate, ft)
            vis.phase = ai_visual_smooth_value(tonumber(vis.phase) or 0, target_phase, phase_rate, ft)
            vis.last_state = returning and \'returning' or \'peeking\'
            if vis.pos ~= nil and vis.phase > 0.02 then
                ai_cylinder_3d(origin or lp_origin, vis.pos, r, g, b, cylinder_alpha, vis.phase, radius_scale)
                if not returning then
                    ai_diamond_3d(vis.pos, 7 + math.floor(pulse * 1), r, g, b, math.floor((175 + math.floor(pulse * 24)) * vis.phase))
                end
            end
        else
            vis.phase = ai_visual_smooth_value(tonumber(vis.phase) or 0, 0, 24, ft)
            if vis.phase <= 0.02 then vis.pos = nil end
        end
        if (tonumber(vis.phase) or 0) <= 0.025 and not ai_peek.targeting and not ai_peek.returning then
            vis.active = false
            vis.pos = nil
            vis.target_pos = nil
            vis.fading = false
            vis.fade_start_tick = 0
            vis.last_state = 'idle\'
        elseif not visual_fading then
            vis.fading = false
            vis.fade_start_tick = 0
        end

        if visual_style == 'diagnostic\' and selected ~= nil then
            local sx, sy = ai_world_to_screen(selected, 22)
            if sx ~= nil then
                local dmg = math.floor((ai_peek.cache.trace_damage or 0) + 0.5)
                local req = math.floor((ai_peek.cache.required_damage or 0) + 0.5)
                local ds = infinix_dpi_scale()
                infinix_dpi_text(sx / ds, sy / ds, r, g, b, 165, 'c-\', 0, tostring(dmg) .. \'/\' .. tostring(req))
            end
        end
    else
        vis.active = false
        vis.pos = nil
        vis.target_pos = nil
        vis.phase = 0
        vis.fading = false
        vis.fade_start_tick = 0
        vis.last_state = 'idle\'
    end
end

ai_peek.create_values()
ai_peek.update_hitboxes(false)

local function export_ai_peek_context()
    local target = ai_peek.cache.current_target
    return {
        state = ai_peek.state or 'idle',
        active = ai_peek.targeting == true,
        returning = ai_peek.returning == true,
        return_allowed = ai_peek.cache.return_allowed == true,
        force_return_now = ai_peek.cache.session_force_return_now == true,
        boundary = (ai_peek.cache.session_boundary_tick or 0) > 0,
        air_probe = ai_peek.cache.session_air_probe == true,
        target = target,
        session_target = ai_peek.cache.session_target or 0,
        point = ai_peek.cache.active_point_index or 0,
        bt_state = ai_peek.cache.bt_state or \'clean\',
        bt_risk = ai_peek.cache.bt_risk or 0,
        bt_quality = ai_peek.cache.bt_quality or 100,
        bt_delta = ai_peek.cache.bt_delta or 0,
        bt_candidate_damage = ai_peek.cache.bt_candidate_damage or 0,
        bt_allowed = ai_peek.cache.bt_allowed == true,
        bt_reject_reason = ai_peek.cache.bt_reject_reason or 'off',
        live_vs_bt_delta = ai_peek.cache.live_vs_bt_delta or 0,
        smart_bt = AI_PEEK_SMART_BACKTRACK == true,
        commit_kind = ai_peek.cache.commit_kind or \'none\',
        weapon_profile = ai_peek.cache.weapon_profile or \'base\',
        distance_profile = \'adaptive\',
        early_live_ratio = ai_peek.peek_profile and ai_peek.peek_profile.early_live_ratio or 0.55,
        adaptive_points = ai_peek.cache.points_generated or ai_peek.cache.points_amount or 0,
        bt_disabled = AI_PEEK_DISABLE_BACKTRACK_TEST == true,
        trace_damage = ai_peek.cache.trace_damage or 0,
        live_damage = ai_peek.cache.live_damage or ai_peek.cache.trace_damage or 0,
        pred_damage = ai_peek.cache.pred_damage or 0,
        target_exposure = ai_peek.cache.target_exposure or 0,
        required_damage = ai_peek.cache.required_damage or 0,
        minimum_damage = ai_peek.cache.minimum_damage or 0,
        damage_source = ai_peek.cache.damage_source or \'idle\',
        target_health = ai_peek.cache.target_health or 0,
        damage_gap = ai_peek.cache.damage_gap or 0,
        record_age = target ~= nil and target ~= 0 and ai_peek.record_age(target) or 999,
        origin_valid = ai_peek.cache.origin_valid == true,
        lost_reason = ai_peek.cache.session_lost_reason or \'idle',
        reason = ai_peek.cache.last_reason or \'idle\',
    }
end

rawset(_G, \'INFINIX_AI_PEEK_CONTEXT\', { get = export_ai_peek_context })

ai_event(\'setup_command\', ai_peek.handle)
ai_event('paint\', ai_peek.render)
ai_event(\'run_command\', function(ctx)
    if safe_get(ui_ai.enable, false) == true then exploits:store_vars(ctx) end
end)
ai_event('predict_command', function(ctx)
    if safe_get(ui_ai.enable, false) == true then exploits:store_tickbase_difference(ctx) end
end)
ai_event(\'round_start\', function() exploits:reset_vars() end)
ai_event('round_end\', function() exploits:reset_vars() end)
ai_event(\'level_init\', function() exploits:reset_vars() end)
ai_event('shutdown', function()
    reset_ai_state()
    override_release_all()
    local ctx = rawget(_G, \'INFINIX_AI_PEEK_CONTEXT\')
    if type(ctx) == 'table' and ctx.get == export_ai_peek_context then
        rawset(_G, \'INFINIX_AI_PEEK_CONTEXT\', nil)
    end
end)

if INFINIX_EMBED and type(INFINIX_EMBED.vis_hooks) == \'table' then
    INFINIX_EMBED.vis_hooks[#INFINIX_EMBED.vis_hooks + 1] = function(sec)
        section_visible = (sec == (INFINIX_EMBED.section or \'ragebot'))
        update_visibility()
    end
end

if not INFINIX_EMBED then
    client.color_log(155, 213, 60, TAG .. \' loaded \' .. VERSION)
end

]==]
					};
					local function QK(lK)
						local qK = A[lK];
						if (type(qK) == 'string') and (qK ~= '') then
							return qK;
						end;
						local A = nil;
						if readfile ~= nil then
							local qK = {
								lK,
								("csgo\\" .. lK),
								("csgo/" .. lK),
								('C:\\Program Files (x86)\\Steam\\steamapps\\common\\csgo legacy\\' .. lK),
                                ('D:\\SteamLibrary\\steamapps\\common\\csgo legacy\\' .. lK),
                                ('D:\\SteamLibrary\\steamapps\\common\\csgo legacy\\lua\\' .. lK)
							};
							for lK, lK in ipairs(qK) do
								local qK, cK = pcall(readfile, lK);
								if qK and (type(cK) == 'string') and (cK ~= "") then
									return cK;
								end;
								if not qK then
									A = cK;
								end;
							end;
						end;
						return nil, A or ((readfile == nil) and 'readfile unavailable') or 'file not found';
					end;
					local function A(lK, qK)
						if loadstring == nil then
							return nil, 'loadstring unavailable';
						end;
						local cK, PK = QK(lK);
						if cK == nil then
							return nil, PK;
						end;
						if type(qK) == 'function' then
							cK = qK(cK);
						end;
						local QK, qK = loadstring(cK, "@" .. lK);
						if QK == nil then
							return nil, qK;
						end;
						return QK;
					end;
					local function QK(lK, qK)
						pcall(client.color_log, 255, 120, 90, '[infinix recode]' .. ' [' .. lK .. '] ' .. tostring(qK));
					end;
					do
						local lK, qK = pcall(function()
							_G.INFINIX_PREDICT_REWORK_NO_BOOT = true;
							local cK, PK = A('predict_rework.lua');
							if cK == nil then
								_G.INFINIX_PREDICT_REWORK_NO_BOOT = nil;
								error(PK);
							end;
							local PK, oK = pcall(cK);
							_G.INFINIX_PREDICT_REWORK_NO_BOOT = nil;
							if not PK then
								error(oK);
							end;
							local cK = rawget(_G, 'infinix_predict_rework');
							if type(cK) ~= "table" then
								error("module did not export");
							end;
							local PK = cK.install_ui({
								tab = "AA",
								group = "Fake lag",
								section = "ragebot",
								uniq = b,
								safe_new = Q,
								vis = c,
								set_cb = o,
								apply_visibility = i,
								cfg_register = pK,
								vis_hooks = EK,
								SLOT = R
							});
							if PK ~= true then
								error('ui init failed');
							end;
							rawset(_G, 'INFINIX_PREDICT_RUNTIME', cK);
						end);
						if not lK then
							QK('predict', qK);
						end;
					end;
					local function lK(qK, cK, PK)
						local oK, mK = A(qK);
						if oK == nil then
							QK(qK, mK);
							return false;
						end;
						rawset(_G, cK, PK);
						local A, PK = pcall(oK);
						rawset(_G, cK, nil);
						if not A then
							QK(qK, PK);
							return false;
						end;
						return true;
					end;
					local A = {
						TAB = 'AA',
						GRP = "Fake lag",
						section = 'ragebot',
						safe_new = Q,
						vis = c,
						set_cb = o,
						apply_visibility = i,
						cfg_register = pK,
						vis_hooks = EK,
						SLOT = R,
						on_cmd_hooks = zK,
						paint_hooks = hK,
						shutdown_hooks = sK,
						rage_decision = Y,
						get_enemy_cache = L,
						infinix_accent = U
					};
					local QK = F('AA', 'Fake lag');
					R.rb_aimtools_rule = QK;
					lK('aimtools.lua', "INFINIX_AIMTOOLS_EMBED", A);
					local QK = F("AA", 'Fake lag');
					R.rb_autostop_rule = QK;
					R.rb_autostop = n({
						tab = "AA",
						group = 'Fake lag',
						uniq = b
					});
					local n = F("AA", "Fake lag");
					R.rb_ai_peek_rule = n;
					lK('ai_peek_infinix.lua', 'INFINIX_AI_PEEK_EMBED', A);
					pcall(i);
				end;
				local n = Q(ui.new_checkbox, 'AA', "Anti-aimbot angles", "only on-shot" .. b(""));
				local A = Q(ui.new_multiselect, "AA", "Anti-aimbot angles", '  a?? on-shot weapons' .. b(""), {
					"pistol",
					'heavy pistol',
					'scout',
					"awp",
					'auto-sniper'
				});
				local QK = Q(ui.new_checkbox, "AA", "Anti-aimbot angles", 'neverlose quick switch' .. b(''));
				local lK = Q(ui.new_checkbox, "AA", 'Anti-aimbot angles', "unsafe lc" .. b(""));
				local qK = Q(ui.new_label, 'AA', "Anti-aimbot angles", "\aFF8060FF  crash if you use new gamesense crack" .. b(""));
				local cK = Q(ui.new_checkbox, 'AA', "Anti-aimbot angles", "onshot fix" .. b(''));
				local PK = Q(ui.new_checkbox, "AA", "Anti-aimbot angles", "defensive fix" .. b(""));
				local oK = Q(ui.new_checkbox, "AA", 'Anti-aimbot angles', "scout in air autostop");
				local mK = Q(ui.new_hotkey, "AA", 'Anti-aimbot angles', 'scout in air autostop key', true);
				c(oK, false);
				c(mK, false);
				R.rb_onshot = n;
				R.rb_weapons = A;
				R.nlqs_en = QK;
				R.uslc_en = lK;
				R.uslc_warn = qK;
				R.osf_en = cK;
				R.dfx_en = PK;
				R.rb_air_scout_en = oK;
				R.rb_air_scout_key = mK;
				function E(BK)
					local MK = BK == 'ragebot';
					c(n, MK);
					c(QK, MK);
					c(lK, false);
					c(qK, false);
					c(cK, MK);
					c(PK, MK);
					c(oK, MK);
					c(mK, MK and (V(oK) == true));
					c(R.rb_predict_rule, MK);
					c(R.rb_aimtools_rule, MK);
					c(R.rb_autostop_rule, MK);
					c(R.rb_autostop, MK);
					c(R.rb_ai_peek_rule, MK);
					local qK = MK and (V(a) == true);
					c(a, MK);
					c(s, qK);
					c(p, qK);
					c(R.rb_fix_delay_rule, MK);
					c(R.rb_force_shot, MK);
					local a = MK and (R.rb_force_shot ~= nil) and (V(R.rb_force_shot) == true);
					c(R.rb_force_shot_key, a);
					c(R.rb_force_shot_warning, a);
					for a, a in pairs(C) do
						if (type(a) ~= "table") and (type(a) ~= 'function') then
							c(a, qK);
						end;
					end;
					c(A, MK and (V(n) == true));
				end;
				EK[# EK + 1] = E;
				local function E()
					rawset(_G, "INFINIX_RB_ONSHOT_ON", V(n) == true);
					rawset(_G, 'INFINIX_NLQS_ON', V(QK) == true);
					rawset(_G, "INFINIX_USLC_ON", false);
					rawset(_G, 'INFINIX_USLC_ACTIVE', false);
					rawset(_G, "INFINIX_OSF_ON", V(cK) == true);
					rawset(_G, "INFINIX_DFX_ON", V(PK) == true);
					rawset(_G, "INFINIX_AIR_SCOUT_AUTOSTOP_ON", V(oK) == true);
					rawset(_G, 'INFINIX_AIR_SCOUT_AUTOSTOP_KEY_ON', (mK ~= nil) and (V(mK) == true));
					pcall(i);
				end;
				rawset(_G, 'INFINIX_AIR_SCOUT_AUTOSTOP_ACTIVE', function()
					return (V(oK) == true) and (mK ~= nil) and (V(mK) == true);
				end);
				E();
				local a;
				do
					local s = {
						{
							'Rage',
							'Aimbot',
							"Enabled"
						},
						{
							'RAGE',
							"Aimbot",
							'Enabled'
						},
						{
							'Rage',
							"General",
							"Enabled"
						}
					};
					for p, p in ipairs(s) do
						local s, R = pcall(ui.reference, p[1], p[2], p[3]);
						if s and R then
							a = R;
							break;
						end;
					end;
				end;
				local s = - 9999.0;
				client.set_event_callback("player_shoot", function(p)
					if (p == nil) or (p.userid == nil) then
						return;
					end;
					local R = client.userid_to_entindex(p.userid);
					if (R == nil) or (R == entity.get_local_player()) then
						return;
					end;
					local p, qK = pcall(entity.is_enemy, R);
					if (not p) or (not qK) then
						return;
					end;
					s = globals.tickcount();
				end);
				local function p()
					if entity.get_local_player == nil then
						return false;
					end;
					local R = entity.get_local_player();
					if R == nil then
						return false;
					end;
					local qK = entity.get_player_weapon(R);
					if qK ~= nil then
						local BK = entity.get_classname(qK) or '';
						if BK:find('Knife') or (BK == "CKnife") or (BK == 'CWeaponTaser') then
							return true;
						end;
					end;
					local qK = entity.get_local_player();
					if (qK == nil) or (not entity.is_alive(qK)) then
						return false;
					end;
					local BK = entity.get_prop(qK, "m_iHealth") or 0;
					if BK <= 0 then
						return false;
					end;
					local MK, WK, YK = Z(R);
					if MK == nil then
						return false;
					end;
					local Z, CK, DK = entity.hitbox_position(qK, 0);
					if Z == nil then
						return false;
					end;
					local NK, LK = client.trace_line(R, MK, WK, YK, Z, CK, DK, false);
					if (NK == qK) and LK and (LK >= BK) then
						return true;
					end;
					return false;
				end;
				local R = false;
				local function Z()
					if R and a then
						NATIVE_DECISION.clear(a, 'only_onshot');
						R = false;
					end;
				end;
				local function qK()
					if rawget(_G, "INFINIX_RB_ONSHOT_ON") ~= true then
						Z();
						return;
					end;
					if a == nil then
						return;
					end;
					local BK = yK();
					if BK == 'scout' then
						Z();
						return;
					end;
					if (BK == nil) or (not g(A, BK)) then
						Z();
						return;
					end;
					local yK = globals.tickcount();
					if INFINIX_DT_RELAXING(yK) then
						Z();
						return;
					end;
					local BK = (yK - s) < 16;
					local s = false;
					if not BK then
						if yK < (rawget(_G, "INFINIX_RB_TRACE_NEXT") or 0) then
							s = rawget(_G, 'INFINIX_RB_TRACE_VALUE') == true;
						else
							s = p();
							rawset(_G, 'INFINIX_RB_TRACE_VALUE', s == true);
							rawset(_G, "INFINIX_RB_TRACE_NEXT", yK + 3);
						end;
					end;
					if BK or s then
						Z();
					elseif not R then
						NATIVE_DECISION.request(a, 'only_onshot', 35, "only on-shot gate", false);
						R = true;
					end;
				end;
				o(n, function()
					E();
					if rawget(_G, 'INFINIX_RB_ONSHOT_ON') ~= true then
						Z();
					end;
				end);
				sK.ragebot_only_onshot = Z;
				local s;
				do
					local p = {
						{
							"Misc",
							'Miscellaneous',
							'Quick Switch'
						},
						{
							'Misc',
							"Miscellaneous",
							"Quick switch"
						},
						{
							'MISC',
							'Miscellaneous',
							'Quick Switch'
						}
					};
					for R, R in ipairs(p) do
						local p, yK = pcall(ui.reference, R[1], R[2], R[3]);
						if p and yK then
							s = yK;
							break;
						end;
					end;
				end;
				local function p()
					if s == nil then
						return;
					end;
					pcall(h.unset, s);
					pcall(ui.set, s, true);
				end;
				local function R()
					if s == nil then
						return;
					end;
					pcall(h.set, s, false);
					pcall(ui.set, s, false);
				end;
				client.set_event_callback('grenade_thrown', function(s)
					if rawget(_G, 'INFINIX_NLQS_ON') ~= true then
						return;
					end;
					local yK = entity.get_local_player();
					if yK == nil then
						return;
					end;
					if (s == nil) or (s.userid == nil) then
						return;
					end;
					if client.userid_to_entindex(s.userid) ~= yK then
						return;
					end;
					local s = globals.tickinterval() or 0.015625;
					client.delay_call(s, function()
						client.exec("slot3; slot2; slot1");
					end);
				end);
				client.set_event_callback('weapon_fire', function(s)
					if r then
						pcall(r, s);
					end;
					if rawget(_G, 'INFINIX_NLQS_ON') ~= true then
						return;
					end;
					local yK = entity.get_local_player();
					if yK == nil then
						return;
					end;
					if (s == nil) or (s.userid == nil) then
						return;
					end;
					if s.weapon ~= 'weapon_taser' then
						return;
					end;
					if cvar.sv_infinite_ammo and pcall(function()
						return cvar.sv_infinite_ammo:get_int();
					end) and (cvar.sv_infinite_ammo:get_int() == 1) then
						return;
					end;
					if client.userid_to_entindex(s.userid) ~= yK then
						return;
					end;
					client.exec('slot3; slot2; slot1');
				end);
				o(QK, function()
					E();
					if rawget(_G, "INFINIX_NLQS_ON") == true then
						R();
					else
						p();
					end;
				end);
				if rawget(_G, 'INFINIX_NLQS_ON') == true then
					R();
				end;
				sK.ragebot_nlqs = p;
				local s, p = pcall(require, "ffi");
				local R, yK, BK, MK = false, nil, nil, nil;
				if s and false then
					local s = pcall(function()
						yK = p.new('char[?]', 29);
						BK = p.new("char[?]", 29);
						MK = p.cast('char*', 1127923787);
						p.copy(BK, MK, 29);
						p.copy(yK, BK, 29);
						p.fill(yK, 24, 144);
						yK[24] = 233;
						R = true;
					end);
					if not s then
						M(255, 200, 80, '[infinix] unsafe LC: ffi patch init failed; runtime gate still active');
					end;
				end;
				local function s()
					if not R then
						return;
					end;
					pcall(function()
						p.copy(MK, BK, 29);
					end);
				end;
				local p = {};
				local R = {};
				do
					local yK, BK, MK = pcall(ui.reference, 'Rage', 'Aimbot', 'Double tap');
					if yK then
						p[1] = BK;
						p[2] = MK;
					end;
					local yK, BK, MK = pcall(ui.reference, "AA", "Other", 'On shot anti-aim');
					if yK then
						R[1] = BK;
						R[2] = MK;
					end;
					local R = pcall(ui.reference, "Rage", "Other", 'Duck peek assist');
					if R then
					end;
				end;
				local function R()
					if (p[1] == nil) or (p[2] == nil) then
						return false;
					end;
					local yK = V(p[1]);
					local BK = V(p[2]);
					return (yK == true) and (BK == true);
				end;
				client.set_event_callback("aim_fire", function()
					if R() then
						rawset(_G, 'INFINIX_DT_RELAX_UNTIL', globals.tickcount() + 48);
					end;
				end);
				local function p()
					if a then
						NATIVE_DECISION.clear(a, "unsafe_lc");
					end;
					rawset(_G, 'INFINIX_USLC_ACTIVE', false);
				end;
				o(lK, function()
					E();
					s();
					p();
				end);
				function sK.ragebot_uslc()
					s();
					p();
				end;
				local a;
				do
					local s, yK = pcall(ui.reference, 'AA', "Fake lag", "Enabled");
					if s then
						a = yK;
					end;
				end;
				local s = false;
				local function yK()
					if s and a then
						NATIVE_DECISION.clear(a, "onshot_fix");
						s = false;
					end;
				end;
				local function BK()
					if a then
						NATIVE_DECISION.request(a, 'onshot_fix', 40, "onshot fake lag fix", false);
						s = true;
					end;
				end;
				local function a()
					local MK = z.is_double_tap_active();
					local WK = z.is_duck_peek_assist();
					local YK = z.is_on_shot_antiaim_active();
					return YK and (not MK) and (not WK);
				end;
				local function MK()
					if rawget(_G, 'INFINIX_OSF_ON') ~= true then
						yK();
						return;
					end;
					if a() then
						if not s then
							BK();
						end;
					else
						yK();
					end;
				end;
				o(cK, function()
					E();
					if rawget(_G, 'INFINIX_OSF_ON') ~= true then
						yK();
					end;
				end);
				_K[# _K + 1] = function()
					if s and (rawget(_G, 'INFINIX_OSF_ON') ~= true) then
						yK();
					end;
				end;
				sK.ragebot_osf = yK;
				local a = {
					0,
					6
				};
				local s = {
					0,
					4
				};
				local BK = 0;
				local WK, YK = 0, false;
				local function CK()
					local DK, NK = {}, {};
					if entity.get_local_player ~= nil then
						local LK, GK = pcall(entity.get_local_player);
						if LK and (GK ~= nil) and entity.is_alive(GK) and entity.is_enemy(GK) then
							DK[# DK + 1] = GK;
							NK[GK] = true;
						end;
					end;
					if entity.get_players ~= nil then
						local LK, GK = pcall(entity.get_players, true);
						if LK and (type(GK) == 'table') then
							for LK = 1, # GK do
								local vK = GK[LK];
								if (vK ~= nil) and (not NK[vK]) then
									DK[# DK + 1] = vK;
									NK[vK] = true;
									if # DK >= 1 then
										return DK;
									end;
								end;
							end;
							return DK;
						end;
					end;
					local LK = (globals.maxplayers and globals.maxplayers()) or 64;
					for GK = 1, LK do
						if (not NK[GK]) and entity.is_alive(GK) and entity.is_enemy(GK) then
							DK[# DK + 1] = GK;
							if # DK >= 1 then
								return DK;
							end;
						end;
					end;
					return DK;
				end;
				local function DK(NK)
					local LK, GK, vK = entity.get_prop(NK, "m_vecVelocity");
					return tonumber(LK) or 0, tonumber(GK) or 0, tonumber(vK) or 0;
				end;
				local function NK(LK, GK, vK, rK, TK, wK, nK)
					local uK = (globals.tickinterval and globals.tickinterval()) or 0.015625;
					local eK = uK * (tonumber(nK) or 0);
					return LK + (rK * eK), GK + (TK * eK), vK + (wK * eK);
				end;
				local function LK(GK, vK)
					local rK, TK, wK = DK(GK);
					local nK, uK, eK = entity.get_origin(GK);
					if nK ~= nil then
						local JK, KK, fK = entity.get_prop(GK, "m_vecViewOffset");
						local iK, UK, xK = NK(nK, uK, eK, rK, TK, wK, vK);
						return iK + (JK or 0), UK + (KK or 0), xK + (fK or 64);
					end;
					local nK, uK, eK = entity.hitbox_position(GK, 0);
					if nK == nil then
						return nil;
					end;
					return NK(nK, uK, eK, rK, TK, wK, vK);
				end;
				local function GK(vK, rK, TK)
					local wK, nK, uK = entity.hitbox_position(vK, rK);
					if wK == nil then
						return nil;
					end;
					local rK, eK, JK = DK(vK);
					return NK(wK, nK, uK, rK, eK, JK, TK);
				end;
				local function DK(NK)
					if csgo_weapons == nil then
						return false;
					end;
					local vK = csgo_weapons(NK);
					local NK = vK and vK.flags;
					return (type(NK) == "number") and (bit.band(NK, bit.lshift(1, 11)) ~= 0);
				end;
				local function NK()
					local vK = rawget(_G, "INFINIX_AI_PEEK_CONTEXT");
					if (type(vK) ~= 'table') or (type(vK.get) ~= 'function') then
						return false;
					end;
					local rK, TK = pcall(vK.get);
					if (not rK) or (type(TK) ~= 'table') then
						return false;
					end;
					if (TK.active ~= true) and (TK.returning ~= true) then
						return false;
					end;
					local vK = TK.target;
					if (vK == nil) or (vK == 0) or (not entity.is_alive(vK)) or (not entity.is_enemy(vK)) then
						return false;
					end;
					if (tonumber(TK.trace_damage) or 0) > 0 then
						return true;
					end;
					if (tonumber(TK.bt_risk) or 0) >= 24 then
						return true;
					end;
					return DK(vK);
				end;
				local function vK(rK, TK, wK)
					local nK, uK, eK = LK(TK, wK);
					if nK == nil then
						return false;
					end;
					for LK = 1, # s do
						local JK, KK, fK = GK(rK, s[LK], wK);
						if JK ~= nil then
							local s, LK, GK = pcall(client.trace_line, TK, nK, uK, eK, JK, KK, fK);
							if s and (type(GK) == "number") and (GK > 0) then
								if (LK == rK) or (LK == nil) or (LK == 0) then
									return true;
								end;
							end;
						end;
					end;
					return false;
				end;
				local function s(LK)
					if (client.eye_position == nil) or (client.trace_line == nil) then
						return false;
					end;
					if NK(LK) then
						return true;
					end;
					local NK = CK();
					for CK = 1, # NK do
						local GK = NK[CK];
						if (GK ~= nil) and entity.is_alive(GK) then
							if DK(GK) then
								return true;
							end;
							for CK = 1, # a do
								if vK(LK, GK, a[CK]) then
									return true;
								end;
							end;
						end;
					end;
					return false;
				end;
				local function a(CK)
					if rawget(_G, 'INFINIX_DFX_ON') ~= true then
						BK = 0;
						WK = 0;
						return;
					end;
					if bK() then
						BK = 0;
						WK = 0;
						return;
					end;
					if (CK == nil) or (not R()) then
						BK = 0;
						WK = 0;
						return;
					end;
					if globals.tickcount() < (rawget(_G, "INFINIX_DT_RELAX_UNTIL") or 0) then
						return;
					end;
					if CK.chokedcommands ~= 0 then
						return;
					end;
					local R = entity.get_local_player();
					if (R == nil) or (not entity.is_alive(R)) then
						BK = 0;
						WK = 0;
						return;
					end;
					local DK = globals.tickcount();
					if DK < BK then
						CK.force_defensive = true;
						return;
					end;
					local NK;
					if DK < WK then
						NK = YK;
					else
						NK = s(R);
						YK = NK;
						WK = DK + 8;
					end;
					if NK then
						BK = DK + 6;
						CK.force_defensive = true;
					end;
				end;
				local s = false;
				zK[# zK + 1] = function(R)
					local YK = rawget(_G, 'INFINIX_RB_ONSHOT_ON') == true;
					local CK = rawget(_G, 'INFINIX_OSF_ON') == true;
					local DK = rawget(_G, "INFINIX_DFX_ON") == true;
					if not (YK or CK or DK) then
						if s then
							Z();
							p();
							yK();
							BK = 0;
							WK = 0;
							s = false;
						end;
						return;
					end;
					s = true;
					if YK then
						qK(R);
					else
						Z();
					end;
					p();
					if CK then
						MK(R);
					else
						yK();
					end;
					if DK then
						a(R);
					else
						BK = 0;
						WK = 0;
					end;
				end;
				o(PK, E);
				o(oK, E);
				o(mK, E);
				pK("ragebot", "rb_onshot", n);
				pK('ragebot', "rb_weapons", A);
				pK("ragebot", 'nlqs_en', QK);
				pK('ragebot', 'uslc_en', lK);
				pK("ragebot", 'osf_en', cK);
				pK('ragebot', "dfx_en", PK);
				pK('ragebot', "rb_air_scout_en", oK);
				pK('ragebot', 'rb_air_scout_key', mK);
			end)();
			(function()
				local E, a = pcall(function()
					local s, p = math.pi / 180, 180 / math.pi;
					local function n(A)
						A = A % 360;
						if A > 180 then
							A = A - 360;
						end;
						return A;
					end;
					local function A(R, Z)
						return n(R - Z);
					end;
					local R = require("ffi");
					local Z = require('bit');
					local yK = {
						rows = {},
						max = 300,
						head = 1,
						count = 0
					};
					function yK.push(QK)
						if yK.count < yK.max then
							yK.count = yK.count + 1;
							yK.rows[yK.count] = QK;
							return;
						end;
						yK.rows[yK.head] = QK;
						yK.head = (yK.head % yK.max) + 1;
					end;
					function yK.each(QK)
						for lK = 0, yK.count - 1 do
							local qK = (((yK.head - 1) + lK) % yK.max) + 1;
							local lK = yK.rows[qK];
							if lK ~= nil then
								QK(lK);
							end;
						end;
					end;
					function yK.line(QK)
						if type(QK) ~= "table" then
							return tostring(QK);
						end;
						local lK = string.format('[%07.1f] %-14s', QK.t or 0, tostring(QK.kind));
						local qK = tonumber(QK.n) or 0;
						if qK <= 0 then
							return lK;
						end;
						local cK = {
							lK
						};
						for lK = 1, qK do
							cK[# cK + 1] = tostring(QK[lK]);
						end;
						return table.concat(cK, " ");
					end;
					local function QK(lK, ...)
						local qK = (globals.realtime and globals.realtime()) or 0;
						local cK = select("#", ...);
						local PK = {
							t = qK,
							kind = lK,
							n = cK
						};
						for lK = 1, cK do
							PK[lK] = select(lK, ...);
						end;
						yK.push(PK);
					end;
					local lK = false;
					pcall(R.cdef, [[
                    struct animation_layer_t {
                        char pad_0[20];
                        uint32_t m_nOrder;
                        uint32_t m_nSequence;
                        float m_flPrevCycle;
                        float m_flWeight;
                        float m_flWeightDeltaRate;
                        float m_flPlaybackRate;
                        float m_flCycle;
                        void *m_pOwner;
                        char pad_1[4];
                    };
                ]])

                                    pcall(R.cdef, [[
                    struct animstate_t {
                        char pad0[3]; char m_bForceWeaponUpdate; char pad1[91];
                        void* m_pBaseEntity; void* m_pActiveWeapon; void* m_pLastActiveWeapon;
                        float m_flLastClientSideAnimationUpdateTime;
                        int   m_iLastClientSideAnimationUpdateFramecount;
                        float m_flAnimUpdateDelta;
                        float m_flEyeYaw; float m_flPitch;
                        float m_flGoalFeetYaw; float m_flCurrentFeetYaw; float m_flCurrentTorsoYaw;
                        float m_flUnknownVelocityLean; float m_flLeanAmount;
                        char pad2[4];
                        float m_flFeetCycle; float m_flFeetYawRate;
                        char pad3[4];
                        float m_fDuckAmount; float m_fLandingDuckAdditiveSomething;
                        char pad4[4];
                        float m_vOriginX; float m_vOriginY; float m_vOriginZ;
                        float m_vLastOriginX; float m_vLastOriginY; float m_vLastOriginZ;
                        float m_vVelocityX; float m_vVelocityY;
                        char pad5[4]; float m_flUnknownFloat1; char pad6[8];
                        float m_flUnknownFloat2; float m_flUnknownFloat3; float m_flUnknown;
                        float m_flSpeed2D; float m_flUpVelocity; float m_flSpeedNormalized;
                        float m_flFeetSpeedForwardsOrSideWays; float m_flFeetSpeedUnknownForwardOrSideways;
                        float m_flTimeSinceStartedMoving; float m_flTimeSinceStoppedMoving;
                        bool  m_bOnGround; bool  m_bInHitGroundAnimation; char  m_pad[2];
                        float m_flTimeSinceInAir; float m_flLastOriginZ;
                        float m_flHeadHeightOrOffsetFromHittingGroundAnimation;
                        float m_flStopToFullRunningFraction;
                        char pad7[4]; float m_flMagicFraction; char pad8[60];
                        float m_flWorldForce; char pad9[462]; float m_flMaxYaw;
                    };
                ]])
					local qK = R.typeof("void***");
					local cK = R.typeof("uintptr_t");
					local PK = client.create_interface('client.dll', 'VClientEntityList003') or error("VClientEntityList003 not found");
					local oK = R.cast(qK, PK);
					local qK = R.cast("void*(__thiscall*)(void*, int)", oK[0][3]);
					local function PK(mK)
						return qK(oK, mK);
					end;
					local function qK(oK)
						local mK = PK(oK);
						if not mK then
							return nil;
						end;
						if R.cast(cK, mK) == 0 then
							return nil;
						end;
						local oK = R.cast("struct animstate_t**", R.cast("char*", mK) + 39264);
						if R.cast(cK, oK[0]) == 0 then
							return nil;
						end;
						return oK[0];
					end;
					local function oK(mK, BK)
						local MK = PK(mK);
						if not MK then
							return nil;
						end;
						if R.cast(cK, MK) == 0 then
							return nil;
						end;
						local PK = R.cast('struct animation_layer_t**', R.cast('char*', MK) + 10640);
						if R.cast(cK, PK[0]) == 0 then
							return nil;
						end;
						return PK[0][BK or 0];
					end;
					local cK = {
						PATH = 'infinix\\resolver\\db.json',
						PATH_ALT = 'infinix/resolver/db.json',
						PATH_FLAT = 'infinix_resolver_db.json',
						PATH_ACTIVE = 'infinix_resolver_v3',
						GS_KEY = "infinix_resolver_v3",
						LEGACY_GS_KEY = 'infinix_resolver_v3',
						BACKEND = 'database',
						DETECT_NOTE = 'not-run',
						STATUS = "untested",
						LAST_ERR = "",
						ABS_ERR = '',
						MAX_ENTRIES = 4096,
						MAX_COUNT = 1000000,
						FOUND = false,
						CREATED = false,
						ACTIVE_CONFIG = 'resolver',
						ACTIVE_PROFILE = "default"
					};
					INFINIX_ACTIVE_CONFIG_NAME = INFINIX_ACTIVE_CONFIG_NAME or "default";
					INFINIX_DB_PROFILE_AUTOSAVE = nil;
					local PK = math.huge;
					local mK = {
						CWeaponAWP = "awp",
						CWeaponSSG08 = 'scout',
						CWeaponSCAR20 = "auto",
						CWeaponG3SG1 = "auto",
						CAK47 = 'rifle',
						CWeaponM4A1 = "rifle",
						CM4A1 = 'rifle',
						CWeaponAug = 'rifle',
						CWeaponSG556 = 'rifle',
						CWeaponFamas = 'rifle',
						CWeaponGalilAR = "rifle",
						CDEagle = "deagle",
						CWeaponDeagle = "deagle",
						CWeaponRevolver = "deagle",
						CWeaponMP9 = "smg",
						CWeaponMAC10 = "smg",
						CWeaponMP7 = 'smg',
						CWeaponMP5SD = 'smg',
						CWeaponUMP45 = 'smg',
						CWeaponP90 = 'smg',
						CWeaponBizon = 'smg',
						CWeaponGlock = "pistol",
						CWeaponUSP_silencer = "pistol",
						CWeaponHKP2000 = 'pistol',
						CWeaponP250 = "pistol",
						CWeaponFiveSeven = 'pistol',
						CWeaponTec9 = 'pistol',
						CWeaponCZ75A = 'pistol',
						CWeaponElite = "pistol",
						CWeaponNOVA = "shotgun",
						CWeaponXM1014 = 'shotgun',
						CWeaponMAG7 = 'shotgun',
						CWeaponSawedoff = 'shotgun',
						CWeaponM249 = 'lmg',
						CWeaponNegev = 'lmg',
						CKnife = "knife",
						CWeaponTaser = "taser",
						CC4 = "bomb",
						CItem_Healthshot = 'item',
						weapon_awp = "awp",
						weapon_ssg08 = "scout",
						weapon_scar20 = 'auto',
						weapon_g3sg1 = "auto",
						weapon_ak47 = 'rifle',
						weapon_m4a1 = 'rifle',
						weapon_m4a1_silencer = 'rifle',
						weapon_aug = "rifle",
						weapon_sg556 = "rifle",
						weapon_famas = 'rifle',
						weapon_galilar = "rifle",
						weapon_deagle = 'deagle',
						weapon_revolver = 'deagle',
						weapon_mp9 = 'smg',
						weapon_mac10 = 'smg',
						weapon_mp7 = "smg",
						weapon_mp5sd = 'smg',
						weapon_ump45 = 'smg',
						weapon_p90 = "smg",
						weapon_bizon = 'smg',
						weapon_glock = "pistol",
						weapon_usp_silencer = "pistol",
						weapon_hkp2000 = "pistol",
						weapon_p250 = "pistol",
						weapon_fiveseven = "pistol",
						weapon_tec9 = 'pistol',
						weapon_cz75a = "pistol",
						weapon_elite = 'pistol',
						weapon_nova = 'shotgun',
						weapon_xm1014 = "shotgun",
						weapon_mag7 = 'shotgun',
						weapon_sawedoff = "shotgun",
						weapon_m249 = "lmg",
						weapon_negev = "lmg"
					};
					local BK = {};
					local function MK(WK)
						local YK = entity.get_player_weapon(WK);
						if not YK then
							return 'other';
						end;
						local WK = entity.get_classname(YK);
						if not WK then
							return "other";
						end;
						local YK = mK[WK];
						if YK then
							return YK;
						end;
						BK[WK] = (BK[WK] or 0) + 1;
						return "other";
					end;
					local mK = {
						fbyw = (l('Players', 'Adjustments', 'Force Body Yaw')),
						fbyv = (l('Players', 'Adjustments', 'Correction Active')),
						reset = (l('Players', "Players", "Reset All"))
					};
					local BK = {
						total = 0,
						found_pers = 0,
						found_clus = 0,
						found_nbr = 0,
						not_found = 0
					};
					local WK = {};
					local YK = {};
					local function CK(DK)
						if not YK[DK] then
							YK[DK] = {
								wins = 0,
								hits = 0,
								misses = 0
							};
						end;
						return YK[DK];
					end;
					lK = false;
					local DK = 0;
					local NK = 0;
					local LK = '';
					local function GK()
						local vK, rK = pcall(function()
							local TK = client.create_interface("filesystem_stdio.dll", "VFileSystem017");
							if TK == nil then
								error('VFileSystem017 not found');
							end;
							local wK = R.cast(R.typeof("void***"), TK);
							local TK = R.cast('void (__thiscall*)(void*, const char*, const char*)', wK[0][22]);
							TK(wK, 'infinix', 'GAME');
							TK(wK, "infinix\\resolver", "GAME");
						end);
						if not vK then
							cK.LAST_ERR = 'mkdir failed: ' .. tostring(rK);
							return false;
						end;
						return true;
					end;
					local function R(vK, rK)
						local TK, wK = pcall(writefile, vK, rK);
						if not TK then
							cK.LAST_ERR = tostring(wK);
							return false;
						end;
						local TK, wK = pcall(readfile, vK);
						if (not TK) or (not wK) or (wK == '') then
							cK.LAST_ERR = "writefile no-op (readback empty)";
							return false;
						end;
						if wK ~= rK then
							cK.LAST_ERR = 'writefile readback mismatch';
							return false;
						end;
						return true;
					end;
					local function vK(rK)
						local TK, wK = pcall(readfile, rK);
						if TK and wK and (wK ~= "") then
							return wK;
						end;
						return nil;
					end;
					local function rK(TK)
						return tostring(TK or ''):gsub("/", "/");
					end;
					local function TK()
						return (type(database) == 'table') and (type(database.read) == 'function') and (type(database.write) == "function");
					end;
					local function wK(nK)
						nK = tostring(nK or "default");
						nK = nK:match("^%s*(.-)%s*$") or 'default';
						if nK == "" then
							nK = "default";
						end;
						nK = nK:gsub("[^%w_%-%. ]", "_");
						if # nK > 48 then
							nK = nK:sub(1, 48);
						end;
						return nK;
					end;
					local function nK(uK, eK)
						return 'infinix_resolver_v3:' .. wK(uK) .. ":" .. wK(eK);
					end;
					local function uK(eK, JK)
						eK = wK(eK);
						JK = wK(JK);
						cK.ACTIVE_CONFIG = eK;
						cK.ACTIVE_PROFILE = JK;
						cK.GS_KEY = nK(eK, JK);
						cK.PATH_ACTIVE = cK.GS_KEY;
					end;
					local function eK()
						if cK.BACKEND == 'database' then
							return 'gamesense:database:' .. cK.GS_KEY;
						end;
						return rK(cK.PATH_ACTIVE);
					end;
					uK('resolver', "default");
					local function JK(KK)
						return vK(KK);
					end;
					local function KK(fK, iK)
						return R(fK, iK);
					end;
					local function fK()
						if cK.PATH_ACTIVE == cK.PATH_FLAT then
							return;
						end;
						if JK(cK.PATH_ACTIVE) ~= nil then
							return;
						end;
						local iK = vK(cK.PATH_FLAT);
						if not iK then
							return;
						end;
						if KK(cK.PATH_ACTIVE, iK) then
							B('[infinix] DB migrated -> ' .. rK(cK.PATH_ACTIVE));
						else
							B("[infinix] DB migration failed: " .. tostring(cK.LAST_ERR));
						end;
					end;
					local function vK(iK, UK)
						cK.BACKEND = 'file';
						cK.PATH_ACTIVE = iK;
						if R(UK, 'v3') then
							pcall(writefile, UK, '');
							return true;
						end;
						return false;
					end;
					local function R()
						cK.ABS_ERR = "";
						cK.DETECT_NOTE = "";
						if TK() then
							cK.BACKEND = 'database';
							cK.PATH_ACTIVE = cK.GS_KEY;
							cK.STATUS = 'database';
							cK.DETECT_NOTE = 'gamesense database API primary; resolver profiles handle exchange';
							cK.LAST_ERR = '';
							B("[infinix] DB -> " .. eK());
							B('[infinix] DB backend -> gamesense database API; exchange via resolver DB profiles');
							return;
						end;
						GK();
						cK.DETECT_NOTE = 'gamesense database API missing; writefile fallback';
						cK.BACKEND = "file";
						if vK(cK.PATH, 'infinix\\resolver\\.inf_marker') then
							cK.STATUS = 'ok';
							cK.LAST_ERR = '';
							fK();
							B("[infinix] DB -> " .. rK(cK.PATH_ACTIVE));
							return;
						end;
						local GK = cK.LAST_ERR;
						if vK(cK.PATH_ALT, "infinix/resolver/.inf_marker") then
							cK.STATUS = "ok";
							cK.LAST_ERR = "";
							fK();
							B("[infinix] DB -> " .. rK(cK.PATH_ACTIVE));
							return;
						end;
						GK = tostring(GK) .. '; slash: ' .. tostring(cK.LAST_ERR);
						if vK(cK.PATH_FLAT, "infinix_resolver_marker.tmp") then
							cK.STATUS = "flat";
							cK.LAST_ERR = 'subdir failed: ' .. tostring(GK);
							B("[infinix] DB subdir FAILED, using flat fallback -> " .. cK.PATH_FLAT .. ': ' .. tostring(GK));
							return;
						end;
						if TK() then
							cK.BACKEND = "database";
							cK.PATH_ACTIVE = cK.GS_KEY;
							cK.STATUS = 'database';
							cK.LAST_ERR = 'file paths failed: ' .. tostring(GK) .. "; flat: " .. tostring(cK.LAST_ERR);
							B("[infinix] DB file backend FAILED, using gamesense database -> " .. cK.GS_KEY);
							return;
						end;
						cK.STATUS = 'failed';
						B("[infinix] DB path FAILED -> " .. rK(cK.PATH) .. ": " .. tostring(cK.LAST_ERR));
					end;
					R();
					local R = {};
					local GK = {};
					local vK = {
						epoch = 0,
						shot_hits = 0,
						shot_misses = 0,
						shot_dmg = 0,
						commit_rounds = 0,
						commit_shots = 0,
						discard_rounds = 0
					};
					local fK = false;
					local iK = {
						last_t = 0,
						interval = 60,
						round_delay = 1.25,
						round_t = 0,
						round_dirty = false,
						post_shot_throttle_ticks = 6
					};
					local function UK(xK, tK)
						return "c_" .. xK .. "_" .. tK;
					end;
					local function xK(tK, AK, SK)
						return "p_" .. tostring(tK) .. '_' .. AK .. "_" .. SK;
					end;
					local function tK(AK)
						local SK, dK = pcall(entity.get_steam_id, AK);
						if SK and dK and (dK ~= 0) then
							return tostring(dK);
						end;
						return nil;
					end;
					local function AK(SK)
						if type(SK) ~= "string" then
							return tostring(SK or "")
						end

						return (SK
							:gsub("\\", "\\\\")
							:gsub('"', '\\"')
							:gsub("\n", "\\n")
							:gsub("\r", "\\r")
							:gsub("\t", "\\t")
						)
					end;

					local function SK(dK)

						local RK = type(dK);

						if RK == "nil" then

							return "null";

						elseif RK == "boolean" then

							return (dK and "true") or 'false';

						elseif RK == "number" then

							if (dK ~= dK) or (dK == math.huge) or (dK == - math.huge) then

								return '0';

							end;

							if (dK == math.floor(dK)) and (math.abs(dK) < 1000000000000000) then

								return string.format("%d", dK);

							end;

							return string.format('%.6g', dK);

						elseif RK == "string" then
							return "\"" .. AK(dK) .. "\"";
						elseif RK == 'table' then
							local RK, kK = true, 0;
							for IK in pairs(dK) do
								kK = kK + 1;
								if (type(IK) ~= 'number') or (IK ~= math.floor(IK)) or (IK < 1) then
									RK = false;
									break;
								end;
							end;
							if RK and (kK > 0) then
								local RK = {};
								for IK = 1, kK do
									RK[# RK + 1] = SK(dK[IK]);
								end;
								return "[" .. table.concat(RK, ",") .. "]";
							end;
							local RK = {};
							for kK, IK in pairs(dK) do
								local dK;
								if type(kK) == 'string' then
									dK = "\"" .. AK(kK) .. "\"";
								elseif type(kK) == 'number' then
									dK = tostring(kK);
								else
									dK = '"' .. AK(tostring(kK)) .. '"';
								end;
								RK[# RK + 1] = dK .. ':' .. SK(IK);
							end;
							return "{" .. table.concat(RK, ",") .. '}';
						end;
						return 'null';
					end;
					local function AK(dK)
						if (type(dK) ~= 'string') or (# dK == 0) then
							return nil;
						end;
						local RK = 1;
						local kK = # dK;
						local function IK()
							while RK <= kK do
								local FK = dK:byte(RK);
								if (FK == 32) or (FK == 9) or (FK == 10) or (FK == 13) then
									RK = RK + 1;
								else
									break;
								end;
							end;
						end;
						local FK;
						local function ZK()  -- parse string
							if dK:byte(RK) ~= 34 then  -- 34 = "
								return nil, 'expected " at position ' .. RK
							end

							RK = RK + 1
							local start = RK
							local chunks = {}

							while RK <= kK do
								local byte = dK:byte(RK)

								if byte == 34 then  -- "
									chunks[#chunks + 1] = dK:sub(start, RK - 1)
									RK = RK + 1
									return table.concat(chunks)
								elseif byte == 92 then  -- \
									chunks[#chunks + 1] = dK:sub(start, RK - 1)

									local nextByte = dK:byte(RK + 1)
									if nextByte == 110 then         -- \n
										chunks[#chunks + 1] = "\n"
									elseif nextByte == 116 then     -- \t
										chunks[#chunks + 1] = "\t"
									elseif nextByte == 114 then     -- \r
										chunks[#chunks + 1] = "\r"
									elseif nextByte == 34 then      -- \"
										chunks[#chunks + 1] = '"'
									elseif nextByte == 92 then      -- \\
										chunks[#chunks + 1] = "\\"
									elseif nextByte == 47 then      -- \/
										chunks[#chunks + 1] = "/"
									else
										chunks[#chunks + 1] = string.char(nextByte or 32)
									end

									RK = RK + 2
									start = RK
								else
									RK = RK + 1
								end
							end

							return nil, 'unterminated string'
						end

						local function yA()  -- parse number
							local start = RK
							if dK:byte(RK) == 45 then  -- -
								RK = RK + 1
							end

							while RK <= kK do
								local b = dK:byte(RK)
								if (b >= 48 and b <= 57) or b == 46 or b == 43 or b == 45 or b == 101 or b == 69 then
									RK = RK + 1
								else
									break
								end
							end

							return tonumber(dK:sub(start, RK - 1))
						end

						local function jA()  -- parse object
							local obj = {}
							RK = RK + 1  -- skip {
							IK()

							if dK:byte(RK) == 125 then  -- }
								RK = RK + 1
								return obj
							end

							while RK <= kK do
								IK()
								local key, err = ZK()
								if not key then
									return nil, err
								end

								IK()
								if dK:byte(RK) ~= 58 then  -- :
									return nil, "expected ':' at " .. RK
								end
								RK = RK + 1

								IK()
								local value, err2 = FK()
								if err2 then
									return nil, err2
								end

								obj[key] = value

								IK()
								local b = dK:byte(RK)
								if b == 44 then      -- ,
									RK = RK + 1
								elseif b == 125 then -- }
									RK = RK + 1
									return obj
								else
									return nil, "expected ',' or '}' at " .. RK
								end
							end

							return nil, 'unterminated object'
						end

						local function QA()  -- parse array
							local arr = {}
							RK = RK + 1  -- skip [
							IK()

							if dK:byte(RK) == 93 then  -- ]
								RK = RK + 1
								return arr
							end

							local idx = 1
							while RK <= kK do
								IK()
								local value, err = FK()
								if err then
									return nil, err
								end

								arr[idx] = value
								idx = idx + 1

								IK()
								local b = dK:byte(RK)
								if b == 44 then
									RK = RK + 1
								elseif b == 93 then
									RK = RK + 1
									return arr
								else
									return nil, "expected ',' or ']' at " .. RK
								end
							end

							return nil, 'unterminated array'
						end

						function FK()  -- main dispatcher
							IK()
							if RK > kK then
								return nil
							end

							local byte = dK:byte(RK)

							if byte == 123 then      -- {
								return jA()
							elseif byte == 91 then   -- [
								return QA()
							elseif byte == 34 then   -- "
								return ZK()
							elseif byte == 116 then  -- t (true)
								if dK:sub(RK, RK + 3) == "true" then
									RK = RK + 4
									return true
								end
							elseif byte == 102 then  -- f (false)
								if dK:sub(RK, RK + 4) == "false" then
									RK = RK + 5
									return false
								end
							elseif byte == 110 then  -- n (null)
								if dK:sub(RK, RK + 3) == "null" then
									RK = RK + 4
									return nil
								end
							elseif (byte >= 48 and byte <= 57) or byte == 45 then  -- number
								return yA()
							end

							return nil, 'unexpected character at ' .. RK .. ': ' .. string.char(byte)
						end

						local result, err = FK()
						if result == nil and err then
							B("[infinix] json_decode failed: " .. tostring(err))
							return nil
						end

						return result
                    end

					function R.new_entry()

						return {

							l_hits = 0,

							l_misses = 0,

							l_wh = 0,

							r_hits = 0,

							r_misses = 0,

							r_wh = 0,

							l_hist = {},

							r_hist = {},

							l_miss_hist = {},

							r_miss_hist = {},

							l_wh_hist = {},

							r_wh_hist = {},

							samples = 0,

							last_epoch = vK.epoch,

							players = 0

						};

					end;

					local function dK(RK)

						RK.l_hits = RK.l_hits or 0;

						RK.l_misses = RK.l_misses or 0;

						RK.l_wh = RK.l_wh or 0;

						RK.r_hits = RK.r_hits or 0;

						RK.r_misses = RK.r_misses or 0;

						RK.r_wh = RK.r_wh or 0;

						RK.l_hist = RK.l_hist or {};

						RK.r_hist = RK.r_hist or {};

						RK.l_miss_hist = RK.l_miss_hist or {};

						RK.r_miss_hist = RK.r_miss_hist or {};

						RK.l_wh_hist = RK.l_wh_hist or {};

						RK.r_wh_hist = RK.r_wh_hist or {};

						RK.samples = RK.samples or 0;

						RK.last_epoch = RK.last_epoch or 0;

						RK.players = RK.players or 0;

					end;

					local function RK(kK)

						if (type(kK) ~= 'number') or (kK ~= kK) or (kK == math.huge) or (kK == - math.huge) then

							return 0;

						end;

						return math.min(58, math.max(0, math.floor(math.abs(kK))));

					end;

					local function kK(IK)

						IK = tonumber(IK) or 0;

						if (IK ~= IK) or (IK < 0) then

							return 0;

						end;

						return math.min(math.floor(IK), cK.MAX_COUNT);

					end;

					local function IK(FK)

						local ZK = tonumber(FK);

						if (not ZK) or (ZK ~= ZK) or (ZK < 0) or (ZK > 58) then

							return nil;

						end;

						return tostring(math.floor(ZK + 0.5));

					end;

					local function FK(ZK)

						local yA = {};

						if type(ZK) ~= "table" then

							return yA;

						end;

						for jA, QA in pairs(ZK) do

							local ZK = IK(jA);

							if ZK then

								yA[ZK] = kK((yA[ZK] or 0) + kK(QA));

							end;

						end;

						return yA;

					end;

					local function ZK(yA)

						if type(yA) ~= 'table' then

							return nil;

						end;

						yA.l_hits = kK(yA.l_hits);

						yA.l_misses = kK(yA.l_misses);

						yA.l_wh = kK(yA.l_wh);

						yA.r_hits = kK(yA.r_hits);

						yA.r_misses = kK(yA.r_misses);

						yA.r_wh = kK(yA.r_wh);

						yA.l_hist = FK(yA.l_hist);

						yA.r_hist = FK(yA.r_hist);

						yA.l_miss_hist = FK(yA.l_miss_hist);

						yA.r_miss_hist = FK(yA.r_miss_hist);

						yA.l_wh_hist = FK(yA.l_wh_hist);

						yA.r_wh_hist = FK(yA.r_wh_hist);

						yA.samples = kK(yA.samples);

						yA.last_epoch = kK(yA.last_epoch);

						yA.players = kK(yA.players);

						return yA;

					end;

					local function FK(yA)

						local jA, QA, bA = {}, 0, 0;

						if type(yA) ~= 'table' then

							return jA, 0, 0;

						end;

						for lA, VA in pairs(yA) do

							if (type(lA) == "string") and (# lA <= 180) and ((lA:sub(1, 2) == "c_") or (lA:sub(1, 2) == "p_")) then

								local yA = ZK(VA);

								if yA and (QA < cK.MAX_ENTRIES) then

									jA[lA] = yA;

									QA = QA + 1;

								else

									bA = bA + 1;

								end;

							else

								bA = bA + 1;

							end;

						end;

						return jA, QA, bA;

					end;

					local function yA(jA)

						if type(jA) ~= 'table' then

							return 0;

						end;

						return tonumber(jA.version) or 0;

					end;

					local function jA(QA)

						local bA = kK(QA);

						if bA <= 0 then

							return 0;

						end;

						return kK(math.floor((bA * 0.5) + 0.5));

					end;

					local function QA(bA)

						local lA = {};

						if type(bA) ~= 'table' then

							return lA;

						end;

						for VA, qA in pairs(bA) do

							local bA = IK(VA);

							local VA = jA(qA);

							if bA and (VA > 0) then

								lA[bA] = kK((lA[bA] or 0) + VA);

							end;

						end;

						return lA;

					end;

					local function bA(lA)

						local VA = 0;

						if type(lA) ~= "table" then

							return 0;

						end;

						for qA, qA in pairs(lA) do

							if type(qA) == "table" then

								dK(qA);

								local lA, OA = kK(qA.l_hits), kK(qA.r_hits);

								qA.l_hits = jA(qA.l_hits);

								qA.r_hits = jA(qA.r_hits);

								qA.l_hist = QA(qA.l_hist);

								qA.r_hist = QA(qA.r_hist);

								qA.samples = kK(qA.l_hits + qA.r_hits + qA.l_misses + qA.r_misses + qA.l_wh + qA.r_wh);

								if (qA.l_hits ~= lA) or (qA.r_hits ~= OA) then

									VA = VA + 1;

								end;

							end;

						end;

						return VA;

					end;

					function R.record_hit(jA, QA, lA)

						dK(jA);

						local VA = RK(lA);

						if QA == 1 then

							jA.r_hits = jA.r_hits + 1;

							jA.r_hist[tostring(VA)] = (jA.r_hist[tostring(VA)] or 0) + 1;

						elseif QA == - 1.0 then

							jA.l_hits = jA.l_hits + 1;

							jA.l_hist[tostring(VA)] = (jA.l_hist[tostring(VA)] or 0) + 1;

						end;

						jA.samples = jA.samples + 1;

						jA.last_epoch = vK.epoch;

					end;

					function R.record_miss(jA, QA, lA)

						dK(jA);

						if QA == 1 then

							jA.r_misses = jA.r_misses + 1;

							if lA then

								local VA = tostring(RK(lA));

								jA.r_miss_hist[VA] = (jA.r_miss_hist[VA] or 0) + 1;

							end;

						elseif QA == - 1.0 then

							jA.l_misses = jA.l_misses + 1;

							if lA then

								local QA = tostring(RK(lA));

								jA.l_miss_hist[QA] = (jA.l_miss_hist[QA] or 0) + 1;

							end;

						end;

						jA.samples = jA.samples + 1;

						jA.last_epoch = vK.epoch;

					end;

					function R.record_wrong_hitbox(jA, QA, lA)

						dK(jA);

						if QA == 1 then

							jA.r_wh = jA.r_wh + 1;

							if lA then

								local VA = tostring(RK(lA));

								jA.r_wh_hist[VA] = (jA.r_wh_hist[VA] or 0) + 1;

							end;

						elseif QA == - 1.0 then

							jA.l_wh = jA.l_wh + 1;

							if lA then

								local QA = tostring(RK(lA));

								jA.l_wh_hist[QA] = (jA.l_wh_hist[QA] or 0) + 1;

							end;

						end;

						jA.samples = jA.samples + 1;

						jA.last_epoch = vK.epoch;

					end;

					local function RK(jA, QA, lA)

						local VA, qA = - math.huge, 0;

						local OA, EA = {}, {};

						local function aA(sA)

							if type(sA) ~= "table" then

								return;

							end;

							for zA in pairs(sA) do

								local sA = IK(zA);

								if sA and (not EA[sA]) then

									EA[sA] = true;

									OA[# OA + 1] = sA;

								end;

							end;

						end;

						aA(jA);

						aA(QA);

						aA(lA);

						for aA = 0, 58, 2 do

							local sA = tostring(aA);

							if not EA[sA] then

								EA[sA] = true;

								OA[# OA + 1] = sA;

							end;

						end;

						for EA, EA in ipairs(OA) do

							local OA = kK(((type(jA) == "table") and jA[EA]) or 0);

							local jA = kK(((type(QA) == "table") and QA[EA]) or 0);

							local QA = kK(((type(lA) == "table") and lA[EA]) or 0);

							local lA = (OA - jA) - QA;

							local jA = tonumber(EA) or 0;

							if lA > VA then

								VA, qA = lA, jA;

							end;

						end;

						return qA;

					end;

					function R.best_side(jA, QA)

						if not jA then

							return 0, 0, 0;

						end;

						dK(jA);

						if jA.samples < QA then

							return 0, 0, 0;

						end;

						local QA = jA.l_hits + jA.l_misses + jA.l_wh;

						local lA = jA.r_hits + jA.r_misses + jA.r_wh;

						local VA = ((QA > 0) and (jA.l_hits / QA)) or 0;

						local QA = ((lA > 0) and (jA.r_hits / lA)) or 0;

						if math.max(VA, QA) < 0.62 then

							return 0, 0, 0;

						end;

						if math.abs(VA - QA) < 0.1 then

							return 0, 0, 0;

						end;

						if VA > QA then

							return - 1.0, RK(jA.l_hist, jA.l_miss_hist, jA.l_wh_hist), VA;

						else

							return 1, RK(jA.r_hist, jA.r_miss_hist, jA.r_wh_hist), QA;

						end;

					end;

					function R.read(RK)

						return GK[RK];

					end;

					function R.write(RK, jA)

						if (not RK) or (not jA) then

							return;

						end;

						if (type(RK) ~= "string") or (# RK > 180) then

							return;

						end;

						jA = ZK(jA);

						if not jA then

							return;

						end;

						GK[RK] = jA;

						fK = true;

						if RK:sub(1, 2) == "c_" then

							WK = {};

						end;

					end;

					local function RK()

						return {

							version = 3,

							epoch = vK.epoch,

							meta = {

								shot_hits = vK.shot_hits,

								shot_misses = vK.shot_misses,

								shot_dmg = vK.shot_dmg,

								commit_rounds = vK.commit_rounds,

								commit_shots = vK.commit_shots,

								discard_rounds = vK.discard_rounds

							},

							entries = GK

						};

					end;

					local function ZK(jA)

						if not TK() then

							cK.LAST_ERR = "gamesense database API missing";

							return false;

						end;

						local QA, lA = pcall(database.write, cK.GS_KEY, jA);

						if not QA then

							cK.LAST_ERR = 'database.write failed: ' .. tostring(lA);

							return false;

						end;

						if type(database.save) == "function" then

							local jA, QA = pcall(database.save);

							if not jA then

								cK.LAST_ERR = "database.flush failed: " .. tostring(QA);

								return false;

							end;

						end;

						return true;

					end;

					local function jA(QA)

						if not TK() then

							return nil;

						end;

						local lA, VA = pcall(database.read, QA or cK.GS_KEY);

						if lA and (type(VA) == "table") then

							return VA;

						end;

						return nil;

					end;

					function R.save()

						if not fK then

							return true;

						end;

						local QA = RK();

						local lA = false;

						if cK.BACKEND == "database" then

							lA = ZK(QA);

						else

							lA = KK(cK.PATH_ACTIVE, SK(QA));

							if (not lA) and ZK(QA) then

								cK.BACKEND = "database";

								cK.PATH_ACTIVE = cK.GS_KEY;

								cK.STATUS = 'database';

								B("[infinix] DB file save failed, switched to gamesense database -> " .. cK.GS_KEY);

								lA = true;

							end;

						end;

						if lA and (type(INFINIX_DB_PROFILE_AUTOSAVE) == "function") then

							local VA, qA, OA = pcall(INFINIX_DB_PROFILE_AUTOSAVE, QA);

							if (not VA) or (qA == false) then

								cK.LAST_ERR = "profile autosave failed: " .. tostring((VA and OA) or qA);

								lA = false;

							end;

						end;

						if lA then

							if not cK.FOUND then

								cK.CREATED = true;

							end;

							cK.FOUND = true;

							fK = false;

							cK.LAST_ERR = "";

						else

							B("[infinix] DB.save FAILED -> " .. eK() .. ": " .. tostring(cK.LAST_ERR));

						end;

						return lA;

					end;

					function R.save_all()

						fK = true;

						return R.save();

					end;

					local function QA(lA)

						local VA = yA(lA);

						if type(lA.entries) == "table" then

							local yA, qA, OA = FK(lA.entries);

							GK = yA;

							if OA > 0 then

								B(string.format("[infinix] DB sanitized: kept %d, dropped %d bad/overflow entries", qA, OA));

								fK = true;

							end;

						end;

						if type(lA.meta) == "table" then

							vK.shot_hits = kK(lA.meta.shot_hits);

							vK.shot_misses = kK(lA.meta.shot_misses);

							vK.shot_dmg = kK(lA.meta.shot_dmg);

							vK.commit_rounds = kK(lA.meta.commit_rounds);

							vK.commit_shots = kK(lA.meta.commit_shots);

							vK.discard_rounds = kK(lA.meta.discard_rounds);

						end;

						vK.epoch = kK(lA.epoch);

						for FK, FK in pairs(GK) do

							dK(FK);

						end;

						if VA < 3 then

							local dK = bA(GK);

							fK = true;

							if dK > 0 then

								WK = {};

								B(string.format("[infinix] DB legacy v%d -> v%d: deweighted %d hit-biased entries", VA, 3, dK));

							end;

						end;

						local dK = 0;

						for FK in pairs(GK) do

							dK = dK + 1;

						end;

						return {

							entries = dK

						};

					end;

					function R.load()

						local dK;

						if cK.BACKEND == "database" then

							dK = jA();

							if (type(dK) ~= 'table') and (cK.ACTIVE_CONFIG == "resolver") and (cK.ACTIVE_PROFILE == "default") and (cK.GS_KEY ~= cK.LEGACY_GS_KEY) then

								dK = jA(cK.LEGACY_GS_KEY);

								if type(dK) == "table" then

									B('[infinix] DB migrated legacy global -> scoped default/default');

									ZK(dK);

								end;

							end;

							cK.FOUND = type(dK) == 'table';

							if type(dK) == "table" then

								return QA(dK);

							end;

							return {

								entries = 0

							};

						end;

						local FK = JK(cK.PATH_ACTIVE);

						cK.FOUND = FK ~= nil;

						if FK then

							local ZK, yA = pcall(AK, FK);

							if ZK and (type(yA) == 'table') then

								return QA(yA);

							end;

							cK.LAST_ERR = 'DB.load malformed JSON: ' .. tostring(yA);

							B("[infinix] " .. cK.LAST_ERR);

						end;

						dK = jA();

						if type(dK) == 'table' then

							cK.BACKEND = 'database';

							cK.PATH_ACTIVE = cK.GS_KEY;

							cK.STATUS = "database";

							cK.FOUND = true;

							B('[infinix] DB loaded from gamesense database fallback');

							return QA(dK);

						end;

						if FK then

							B("[infinix] DB.load: starting empty");

						end;

						return {

							entries = 0

						};

					end;

					local dK;

					local function FK()

						local ZK = C;

						if (type(ZK) ~= 'table') or (ZK.list == nil) then

							return;

						end;

						local C, yA = pcall(require, 'gamesense/clipboard');

						if not C then

							yA = nil;

						end;

						local C, bA;

						do

							local lA, VA = {}, {};

							for qA = 1, 64 do

								local OA = string.byte("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", qA);

								lA[qA - 1] = OA;

								VA[OA] = qA - 1;

							end;

							function C(qA)

								qA = tostring(qA or '');

								local OA, EA, aA = {}, 1, # qA;

								local sA = aA % 3;

								for zA = 1, aA - sA, 3 do

									local hA, _A, cA = string.byte(qA, zA, zA + 2);

									local zA = (hA * 65536) + (_A * 256) + cA;

									OA[EA] = string.char(lA[Z.band(Z.rshift(zA, 18), 63)], lA[Z.band(Z.rshift(zA, 12), 63)], lA[Z.band(Z.rshift(zA, 6), 63)], lA[Z.band(zA, 63)]);

									EA = EA + 1;

								end;

								if sA == 2 then

									local zA, hA = string.byte(qA, aA - 1, aA);

									local _A = (zA * 65536) + (hA * 256);

									OA[EA] = string.char(lA[Z.band(Z.rshift(_A, 18), 63)], lA[Z.band(Z.rshift(_A, 12), 63)], lA[Z.band(Z.rshift(_A, 6), 63)]) .. "=";

								elseif sA == 1 then

									local sA = string.byte(qA, aA) * 65536;

									OA[EA] = string.char(lA[Z.band(Z.rshift(sA, 18), 63)], lA[Z.band(Z.rshift(sA, 12), 63)]) .. '==';

								end;

								return table.concat(OA);

							end;

							function bA(lA)

								lA = tostring(lA or ""):gsub("[^A-Za-z0-9+/=]", '');

								local qA = # lA;

								if qA == 0 then

									return "";

								end;

								local OA = ((lA:sub(- 2.0) == "==") and 2) or ((lA:sub(- 1.0) == "=") and 1) or 0;

								local EA, aA = {}, 1;

								local sA = ((OA > 0) and (qA - 4)) or qA;

								for zA = 1, sA, 4 do

									local sA = VA[string.byte(lA, zA)];

									local hA = VA[string.byte(lA, zA + 1)];

									local _A = VA[string.byte(lA, zA + 2)];

									local cA = VA[string.byte(lA, zA + 3)];

									if (sA == nil) or (hA == nil) or (_A == nil) or (cA == nil) then

										return nil;

									end;

									local zA = (sA * 262144) + (hA * 4096) + (_A * 64) + cA;

									EA[aA] = string.char(Z.band(Z.rshift(zA, 16), 255), Z.band(Z.rshift(zA, 8), 255), Z.band(zA, 255));

									aA = aA + 1;

								end;

								if OA == 1 then

									local sA = VA[string.byte(lA, qA - 3)];

									local zA = VA[string.byte(lA, qA - 2)];

									local hA = VA[string.byte(lA, qA - 1)];

									if (sA == nil) or (zA == nil) or (hA == nil) then

										return nil;

									end;

									local _A = (sA * 262144) + (zA * 4096) + (hA * 64);

									EA[aA] = string.char(Z.band(Z.rshift(_A, 16), 255), Z.band(Z.rshift(_A, 8), 255));

								elseif OA == 2 then

									local OA = VA[string.byte(lA, qA - 3)];

									local sA = VA[string.byte(lA, qA - 2)];

									if (OA == nil) or (sA == nil) then

										return nil;

									end;

									local lA = (OA * 262144) + (sA * 4096);

									EA[aA] = string.char(Z.band(Z.rshift(lA, 16), 255));

								end;

								return table.concat(EA);

							end;

						end;

						local function Z(lA)

							local VA = {

								version = 3,

								active = "default",

								profiles = {}

							};

							if type(lA) ~= 'table' then

								return VA;

							end;

							if type(lA.profiles) == 'table' then

								VA.version = lA.version or 3;

								VA.active = ((type(lA.active) == 'string') and lA.active) or 'default';

								VA.profiles = lA.profiles;

								return VA;

							end;

							if type(lA.configs) == "table" then

								local qA = wK(lA.active_config or cK.ACTIVE_CONFIG or 'default');

								local function wK(OA, EA)

									if (type(EA) ~= 'table') or (type(EA.profiles) ~= "table") then

										return;

									end;

									local aA = nil;

									for sA, zA in pairs(EA.profiles) do

										if (sA ~= "default") and (type(zA) == 'table') then

											local hA = tostring(sA);

											if VA.profiles[hA] ~= nil then

												hA = tostring(OA) .. " / " .. hA;

											end;

											VA.profiles[hA] = zA;

											if sA == EA.active then

												aA = hA;

											end;

										end;

									end;

									if (OA == qA) and (type(EA.active) == 'string') and (EA.active ~= "") and (EA.active ~= 'default') then

										VA.active = aA or EA.active;

									elseif (VA.active == 'default') and (aA ~= nil) then

										VA.active = aA;

									end;

								end;

								wK("resolver", lA.configs.resolver);

								for qA, OA in pairs(lA.configs) do

									if qA ~= 'resolver' then

										wK(qA, OA);

									end;

								end;

							end;

							return VA;

						end;

						local wK = {

							version = 3,

							active = "default",

							profiles = {}

						};

						if TK() then

							local lA, VA = pcall(database.read, 'infinix_resolver_profiles_v2');

							if (not lA) or (type(VA) ~= "table") then

								lA, VA = pcall(database.read, "infinix_resolver_profiles_v1");

							end;

							if lA and (type(VA) == 'table') then

								wK = Z(VA);

							end;

						end;

						if type(wK.profiles) ~= 'table' then

							wK.profiles = {};

						end;

						if (type(wK.active) ~= 'string') or (wK.active == "") then

							wK.active = "default";

						end;

						local Z = 'resolver';

						local lA = wK;

						local VA = {

							"default"

						};

						local function qA()

							if not TK() then

								return false;

							end;

							local OA = pcall(database.write, 'infinix_resolver_profiles_v2', wK);

							if OA and (type(database.save) == 'function') then

								pcall(database.save);

							end;

							return OA;

						end;

						local function OA(EA)

							local aA, sA = pcall(function()

								return AK(SK(EA));

							end);

							if aA and (type(sA) == "table") then

								return sA;

							end;

							return EA;

						end;

						local function EA()

							return OA(RK());

						end;

						local function RK()

							return {

								version = 3,

								epoch = 0,

								meta = {

									shot_hits = 0,

									shot_misses = 0,

									shot_dmg = 0,

									commit_rounds = 0,

									commit_shots = 0,

									discard_rounds = 0

								},

								entries = {}

							};

						end;

						local function aA(sA)

							local zA, hA, _A = 0, 0, 0;

							local cA = ((type(sA) == 'table') and sA.entries) or nil;

							if type(cA) ~= "table" then

								return 0, 0, 0;

							end;

							for sA in pairs(cA) do

								zA = zA + 1;

								if (type(sA) == 'string') and (sA:sub(1, 2) == 'p_') then

									hA = hA + 1;

								else

									_A = _A + 1;

								end;

							end;

							return zA, hA, _A;

						end;

						local function sA(zA, hA)

							local _A = ((hA == false) and "[infinix] DB profile error: ") or '[infinix] DB profile: ';

							B(_A .. tostring(zA or ''));

						end;

						local function zA(hA)

							hA = 'resolver';

							local _A = wK;

							if type(_A.profiles) ~= 'table' then

								_A.profiles = {};

							end;

							if (type(_A.active) ~= 'string') or (_A.active == '') then

								_A.active = 'default';

							end;

							if (_A.active ~= 'default') and (_A.profiles[_A.active] == nil) then

								local cA = jA(nK(hA, _A.active));

								if type(cA) == 'table' then

									_A.profiles[_A.active] = cA;

								else

									_A.active = "default";

								end;

							end;

							Z = hA;

							lA = _A;

							uK(Z, lA.active);

							return lA;

						end;

						zA();

						local function zA()

							VA = {

								"default"

							};

							for hA in pairs(lA.profiles) do

								if hA ~= "default" then

									VA[# VA + 1] = hA;

								end;

							end;

							table.sort(VA, function(hA, _A)

								if hA == "default" then

									return true;

								end;

								if _A == "default" then

									return false;

								end;

								return tostring(hA) < tostring(_A);

							end);

							pcall(ui.update, ZK.list, VA);

						end;

						local function hA()

							local _A, cA = pcall(ui.get, ZK.list);

							cA = (_A and tonumber(cA)) or 0;

							return VA[(cA or 0) + 1] or VA[1] or 'default';

						end;

						local function _A(cA)

							for PA, oA in ipairs(VA) do

								if oA == cA then

									pcall(ui.set, ZK.list, PA - 1);

									return;

								end;

							end;

						end;

						local function VA(cA)

							local PA, oA = pcall(ui.get, ZK.name);

							oA = (PA and (type(oA) == 'string') and oA:match('^%s*(.-)%s*$')) or "";

							if oA == '' then

								oA = cA or "";

							end;

							if # oA > 32 then

								oA = oA:sub(1, 32);

							end;

							return oA;

						end;

						local function cA(PA, oA)

							if not TK() then

								return false;

							end;

							local TK = pcall(database.write, nK(Z, PA), oA);

							if TK and (type(database.save) == "function") then

								pcall(database.save);

							end;

							return TK;

						end;

						local function TK(PA, oA)

							if (PA == '') or (PA == 'default') then

								return false;

							end;

							if (type(oA) ~= "table") or (type(oA.entries) ~= 'table') then

								return false;

							end;

							local mA = OA(oA);

							lA.profiles[PA] = mA;

							local oA = cA(PA, mA);

							return qA() and oA;

						end;

						local function cA(PA)

							if (PA == nil) or (PA == "") then

								PA = 'default';

							end;

							if (PA ~= 'default') and (lA.profiles[PA] == nil) then

								local oA = jA(nK(Z, PA));

								if type(oA) == "table" then

									lA.profiles[PA] = oA;

								else

									return false;

								end;

							end;

							lA.active = PA;

							uK(Z, PA);

							return qA();

						end;

						local function PA(oA)

							local mA = jA(nK(Z, oA));

							if type(mA) == "table" then

								return mA;

							end;

							if oA == 'default' then

								return RK();

							end;

							return lA.profiles[oA];

						end;

						local function oA(mA)

							if mA == (lA.active or "default") then

								return EA();

							end;

							return PA(mA);

						end;

						local function EA()

							local mA = hA();

							local BA = oA(mA);

							if type(BA) ~= 'table' then

								sA("profile not found", false);

								return;

							end;

							if not cA(mA) then

								sA("active switch failed", false);

								return;

							end;

							QA(OA(BA));

							fK = true;

							WK = {};

							if D then

								pcall(D);

							end;

							R.save_all();

							local MA = aA(BA);

							sA(string.format("%s loaded active (%d entries)", mA, MA));

							dK();

						end;

						local function mA()

							local BA = hA();

							local MA = oA(BA);

							if type(MA) ~= "table" then

								sA('profile not found', false);

								return;

							end;

							local oA = 'INFINIXDB:"' .. C(SK({

								version = 3,

								name = BA,

								payload = MA

							})) .. "\"";

							if yA == nil then

								sA("clipboard module missing", false);

								return;

							end;

							local C = pcall(yA.set, oA);

							sA((C and ("exported " .. BA)) or "clipboard error", C);

						end;

						local function C(SK)

							if (type(SK) ~= 'string') or (SK == '') then

								return nil;

							end;

							local function oA(BA)

								if (type(BA) ~= "string") or (BA == "") then

									return nil;

								end;

								local MA, gA = pcall(AK, BA);

								if MA then

									return gA;

								end;

								return nil;

							end;

							local AK = SK:match('^%s*INFINIXDB:%s*"([A-Za-z0-9+/=]+)"%s*$') or SK:match('^%s*INFINIXDB:%s*([A-Za-z0-9+/=]+)%s*$');

							local BA;

							if AK then

								BA = oA(bA(AK));

							end;

							if type(BA) ~= "table" then

								local AK = SK:match('^%s*INFINIXDB1:(.+)$');

								BA = (AK and oA(AK)) or oA(SK);

							end;

							if type(BA) ~= 'table' then

								return nil;

							end;

							if type(BA.payload) == "table" then

								return BA.name, BA.payload;

							end;

							if type(BA.entries) == 'table' then

								return nil, BA;

							end;

							return nil;

						end;

						local function AK()

							if yA == nil then

								sA('clipboard module missing', false);

								return;

							end;

							local SK, bA = pcall(yA.get);

							if (not SK) or (type(bA) ~= 'string') or (bA == "") then

								sA('clipboard empty', false);

								return;

							end;

							local SK, yA = C(bA);

							if (type(yA) ~= "table") or (type(yA.entries) ~= 'table') then

								sA("invalid db code", false);

								return;

							end;

							local C = VA(SK);

							if C == "default" then

								C = "";

							end;

							if C == "" then

								local SK = 1;

								repeat

									C = "imported " .. SK;

									SK = SK + 1;

								until lA.profiles[C] == nil;

							elseif lA.profiles[C] ~= nil then

								local SK, bA = C, 1;

								repeat

									C = SK .. ' ' .. bA;

									bA = bA + 1;

								until lA.profiles[C] == nil;

							end;

							if not TK(C, yA) then

								sA('profile save failed', false);

								return;

							end;

							pcall(ui.set, ZK.name, "");

							zA();

							_A(C);

							sA(C .. " imported");

						end;

						if wK.profiles.default ~= nil then

							local C = wK.profiles.default;

							wK.profiles.default = nil;

							if (type(C) == "table") and (type(C.entries) == "table") then

								local SK = aA(C);

								if (SK > 0) and (wK.profiles['legacy default'] == nil) then

									wK.profiles["legacy default"] = C;

								end;

							end;

						end;

						qA();

						if (lA.active ~= 'default') and (lA.profiles[lA.active] == nil) and (jA(nK(Z, lA.active)) == nil) then

							cA("default");

						end;

						function INFINIX_DB_PROFILE_AUTOSAVE(C)

							local wK = lA.active;

							if (type(wK) ~= 'string') or (wK == "") then

								wK = 'default';

								lA.active = wK;

								uK(Z, wK);

							end;

							if wK == "default" then

								return true;

							end;

							if type(lA.profiles[wK]) ~= "table" then

								lA.active = 'default';

								uK(Z, "default");

								qA();

								return false, "active profile missing: " .. tostring(wK);

							end;

							lA.profiles[wK] = OA(C);

							if not qA() then

								return false, "profile database.write failed";

							end;

							return true;

						end;

						function INFINIX_RESOLVER_SET_CONFIG()

							return true;

						end;

						o(ZK.create, function()

							local C = VA("");

							if C == "" then

								sA('enter db name', false);

								return;

							end;

							if C == 'default' then

								sA("default is live DB", false);

								return;

							end;

							if lA.profiles[C] ~= nil then

								sA('profile exists', false);

								return;

							end;

							local Z = RK();

							if not TK(C, Z) then

								sA("profile save failed", false);

								return;

							end;

							if not cA(C) then

								sA('active switch failed', false);

								return;

							end;

							QA(OA(Z));

							fK = true;

							WK = {};

							if N then

								pcall(N);

							end;

							if D then

								pcall(D);

							end;

							pcall(ui.set, ZK.name, '');

							zA();

							_A(C);

							R.save_all();

							sA(C .. ' created clean + active');

						end);

						o(ZK.load, EA);

						o(ZK.export, mA);

						o(ZK.import, AK);

						o(ZK.delete, function()

							local C = hA();

							if C == 'default' then

								sA("can't delete default", false);

								return;

							end;

							if lA.profiles[C] == nil then

								sA('profile not found', false);

								return;

							end;

							lA.profiles[C] = nil;

							if lA.active == C then

								cA('default');

								QA(PA('default'));

								fK = true;

								R.save_all();

							end;

							if not qA() then

								sA('profile delete failed', false);

								return;

							end;

							pcall(ui.set, ZK.list, 0);

							zA();

							sA(C .. " deleted");

						end);

						local C = PA(lA.active or "default");

						if type(C) == 'table' then

							QA(OA(C));

							fK = true;

							R.save_all();

						end;

						zA();

						_A(lA.active or 'default');

						sA("active:" .. tostring(lA.active or "default"));

					end;

					local function C()

						local Z = ((cK.LAST_ERR ~= '') and cK.LAST_ERR) or "none";

						if cK.ABS_ERR ~= '' then

							Z = tostring(Z) .. ' | abs: ' .. tostring(cK.ABS_ERR);

							if # Z > 240 then

								Z = Z:sub(1, 240) .. '...';

							end;

						end;

						local TK;

						if cK.BACKEND == "database" then

							TK = jA() ~= nil;

						else

							TK = JK(cK.PATH_ACTIVE) ~= nil;

						end;

						return string.format('[infinix] DB status -> backend:%s path:%s scope:%s active:%s profiles:database found:%s created:%s exists:%s fs:%s detect:%s err:%s', tostring(cK.BACKEND), eK(), tostring(cK.ACTIVE_CONFIG or "default"), tostring(cK.ACTIVE_PROFILE or 'default'), (cK.FOUND and 'yes') or 'no', (cK.CREATED and 'yes') or 'no', (TK and "yes") or 'no', tostring(cK.STATUS), tostring(cK.DETECT_NOTE), tostring(Z));

					end;

					local function Z(TK)
						local wK = cK.LAST_ERR;

						pcall(function()
							KK('infinix_resolver_status.txt', TK .. '\n');
						end);

						cK.LAST_ERR = wK;
					end;

					function dK()

						local TK = C();

						INFINIX_DB_STATUS_LINE = TK;

						B(TK);

						M(120, 220, 120, TK);

						Z(TK);

					end;

					function R.bump_epoch()

						vK.epoch = vK.epoch + 1;

						fK = true;

					end;

					function R.stats()

						local C = 0;

						for Z in pairs(GK) do

							C = C + 1;

						end;

						return {

							epoch = vK.epoch,

							shot_hits = vK.shot_hits,

							shot_misses = vK.shot_misses,

							shot_dmg = vK.shot_dmg,

							commit_rounds = vK.commit_rounds,

							commit_shots = vK.commit_shots,

							discard_rounds = vK.discard_rounds,

							cluster = C

						};

					end;

					function R.clear()

						GK = {};

						vK = {

							epoch = 0,

							shot_hits = 0,

							shot_misses = 0,

							shot_dmg = 0,

							commit_rounds = 0,

							commit_shots = 0,

							discard_rounds = 0

						};

						fK = true;

						iK.round_dirty = false;

						iK.round_t = 0;

						BK = {

							total = 0,

							found_pers = 0,

							found_clus = 0,

							found_nbr = 0,

							not_found = 0

						};

						WK = {};

						pcall(R.save);

						B('[infinix] DB cleared');

					end;

					local function C(Z)

						if Z < 5 then

							return 0;

						elseif Z < 20 then

							return 1;

						elseif Z < 45 then

							return 2;

						else

							return 3;

						end;

					end;

					local function Z(TK)

						if TK < 20 then

							return 0;

						elseif TK < 45 then

							return 1;

						else

							return 2;

						end;

					end;

					local function TK(wK, nK)

						if not nK then

							return 3;

						end;

						if wK.m_fDuckAmount > 0.5 then

							return 2;

						end;

						if wK.m_flSpeed2D > 100 then

							return 1;

						end;

						return 0;

					end;

					local function wK(nK, uK)

						local JK = nK[uK .. "_until"] or 0;

						return globals.tickcount() < JK;

					end;

					local function nK(uK, JK)

						uK[JK .. "_until"] = globals.tickcount() + 256;

					end;

					local function uK(JK, KK)

						local AK = KK.m_bOnGround;

						local SK = JK.is_fake_duck and wK(JK, 'is_fake_duck');

						local RK = JK.is_dt_user and wK(JK, "is_dt_user");

						local ZK = JK.avoid_overlap and wK(JK, "avoid_overlap");

						local wK = (SK and 0) or TK(KK, AK);

						local TK = (RK and 1) or 0;

						local KK = (ZK and 1) or 0;

						local AK = (SK and 1) or 0;

						return string.format("j%dd%ds%dT%dA%dF%d", C(JK.jitter_diff), Z(JK.desync), wK, TK, KK, AK);

					end;

					local function TK(wK)

						return wK:match("^(.+)s%dT%dA%dF%d$") or wK:match("^(.+)c%ds%dT%dA%dF%d$") or wK:match('^(.+)s%d$') or wK:match('^(.+)s%dD%dJ%d$') or wK;

					end;

					local function wK(JK, KK)

						if not JK then

							return 0;

						end;

						local AK = math.floor((JK.confidence or 0) * 60);

						local SK = 0;

						if JK.fingerprint and (JK.fingerprint ~= "") and JK.weapon then

							local RK = tK(KK);

							if RK then

								local KK = R.read(xK(RK, JK.weapon, JK.fingerprint));

								if KK then

									local RK, ZK, ZK = R.best_side(KK, 3);

									if (RK ~= 0) and (ZK > 0) then

										SK = math.floor(ZK * 40);

									end;

								end;

							end;

							if SK == 0 then

								local KK = R.read(UK(JK.weapon, JK.fingerprint));

								if KK then

									local JK, RK, RK = R.best_side(KK, 4);

									if (JK ~= 0) and (RK > 0) then

										SK = math.floor(RK * 30);

									end;

								end;

							end;

						end;

						return math.min(100, AK + SK);

					end;

					local JK = {

						awp = {

							"awp",

							"scout",

							'auto'

						},

						scout = {

							'scout',

							'awp',

							'auto'

						},

						auto = {

							'auto',

							'awp',

							'scout'

						},

						rifle = {

							'rifle'

						},

						deagle = {

							"deagle"

						},

						smg = {

							'smg'

						},

						pistol = {

							"pistol"

						},

						other = {

							"other"

						}

					};

					local function KK(AK, SK, RK)

						local ZK = globals.tickcount();

						local yA = AK .. '_' .. SK;

						local jA = WK[yA];

						if jA and ((ZK - jA.tick) < 128) then

							return jA.agg, jA.count;

						end;

						local jA = R.new_entry();

						local QA = 0;

						local bA = {

							AK

						};

						if RK then

							for lA, lA in ipairs(RK) do

								if lA ~= AK then

									bA[# bA + 1] = lA;

								end;

							end;

						end;

						local function AK(RK, lA)

							if (type(RK) ~= 'table') or (type(lA) ~= 'table') then

								return;

							end;

							for VA, qA in pairs(lA) do

								local lA = IK(VA);

								if lA then

									RK[lA] = kK((RK[lA] or 0) + kK(qA));

								end;

							end;

						end;

						for RK, RK in ipairs(bA) do

							local IK = "c_" .. RK .. '_' .. SK;

							for SK, RK in pairs(GK) do

								if (type(SK) == "string") and (type(RK) == 'table') and (SK:sub(1, # IK) == IK) and (SK:sub(# IK + 1, # IK + 1) == "s") then

									AK(jA.l_hist, RK.l_hist);

									AK(jA.r_hist, RK.r_hist);

									AK(jA.l_miss_hist, RK.l_miss_hist);

									AK(jA.r_miss_hist, RK.r_miss_hist);

									AK(jA.l_wh_hist, RK.l_wh_hist);

									AK(jA.r_wh_hist, RK.r_wh_hist);

									jA.l_hits = kK(jA.l_hits + kK(RK.l_hits));

									jA.r_hits = kK(jA.r_hits + kK(RK.r_hits));

									jA.l_misses = kK(jA.l_misses + kK(RK.l_misses));

									jA.r_misses = kK(jA.r_misses + kK(RK.r_misses));

									jA.l_wh = kK(jA.l_wh + kK(RK.l_wh));

									jA.r_wh = kK(jA.r_wh + kK(RK.r_wh));

									jA.samples = kK(jA.samples + kK(RK.samples));

									QA = QA + 1;

								end;

							end;

						end;

						WK[yA] = {

							tick = ZK,

							agg = jA,

							count = QA

						};

						return jA, QA;

					end;

					local function AK(SK, SK, RK, kK)

						if (not RK) or (RK == "") or (not kK) then

							return 0, 0, 0, nil;

						end;

						BK.total = BK.total + 1;

						local IK = tK(SK);

						if IK then

							local SK = R.read(xK(IK, kK, RK));

							if SK then

								local IK, ZK, yA = R.best_side(SK, 3);

								if IK ~= 0 then

									BK.found_pers = BK.found_pers + 1;

									return IK, ZK, yA, 'MEM-p';

								end;

							end;

						end;

						local SK = R.read(UK(kK, RK));

						if SK then

							local IK, ZK, yA = R.best_side(SK, 4);

							if IK ~= 0 then

								BK.found_clus = BK.found_clus + 1;

								return IK, ZK, yA, "MEM-c";

							end;

						end;

						do

							local SK = TK(RK);

							if SK and (SK ~= RK) then

								local TK = JK[kK];

								local JK, RK = KK(kK, SK, TK);

								if (RK >= 2) and (JK.samples >= 10) then

									local KK, SK, RK = R.best_side(JK, 10);

									if KK ~= 0 then

										BK.found_nbr = BK.found_nbr + 1;

										local JK = TK and (# TK > 1);

										local TK = (JK and 0.6) or 0.65;

										return KK, SK, math.min(RK * 0.75, TK), "MEM-n";

									end;

								end;

							end;

						end;

						BK.not_found = BK.not_found + 1;

						return 0, 0, 0, nil;

					end;

					rawset(_G, 'INFINIX_ADAPTIVE_DAMAGE_ENABLED', false);

					local function BK(TK, JK)

						if rawget(_G, "INFINIX_ADAPTIVE_DAMAGE_ENABLED") ~= true then

							Y.clear_key(TK, "Minimum damage", 'resolver');

							return 0;

						end;

						if JK >= 100 then

							Y.clear_key(TK, 'Minimum damage', 'resolver');

							return 0;

						end;

						local KK = math.max(JK, 1);

						Y.request(TK, "resolver", 'Minimum damage', KK, 45, "resolver lethal dmg");

						return KK;

					end;

					local TK = {};

					local JK = {};

					local KK = 0;

					local function SK()

						return KK;

					end;

					function N()

						JK = {};

						KK = 0;

						iK.round_dirty = false;

						iK.round_t = 0;

					end;

					local function N(RK)

						if not TK[RK] then

							TK[RK] = {

								records = {},

								side = 0,

								desync = 29,

								desync_l_last = 0,

								desync_r_last = 0,

								yaw_cache = {},

								jitter_idx = 0,

								is_jitter = false,

								jitter_diff = 0,

								jitter_avg = 0,

								freestand_side = 0,

								ml_side = 0,

								ml_diff = 0,

								miss = 0,

								brute_idx = 0,

								hits = 0,

								misses = 0,

								mismatch_streak = 0,

								last_mismatch_tick = 0,

								quarantine_until = 0,

								last_anim_t = 0,

								prev_simtime = 0,

								defensive_until = 0,

								chokes = 0,

								prev_pitch = 0,

								yaw_ring = {},

								yaw_ring_tick = {},

								yaw_ring_idx = 0,

								snap_side = 0,

								snap_until = 0,

								snap_count = 0,

								lby_prev = nil,

								lby_anchor_yaw = nil,

								lby_anchor_tick = 0,

								dt_fires_tick = 0,

								dt_last_fire_tick = 0,

								dt_count = 0,

								is_dt_user = false,

								duck_ring = {},

								duck_ring_idx = 0,

								duck_transitions = 0,

								is_fake_duck = false,

								avoid_overlap = false,

								opposite_misses = 0,

								dt_state = "idle",

								dt_lagcomp_until = 0,

								dt_recharge_start = 0,

								dt_recharge_ticks = 0,

								prev_shotsfired = 0,

								prev_origin_x = 0,

								prev_origin_y = 0,

								dt_hits = 0,

								dt_misses = 0,

								is_defensive_dt = false,

								abs_diff_prev = 0,

								abs_diff_cur = 0,

								should_skip_resolve = false,

								sp_rates = {

									center = nil,

									left = nil,

									right = nil

								},

								confidence = 0,

								applied = 0,

								label = 'init',

								good_angle = 0,

								good_side = 0,

								good_until = 0,

								good_conf = 0,

								good_winner = "none",

								good_weapon = "",

								first_seen = globals.realtime(),

								mem_used = false,

								fingerprint = '',

								weapon = "other"

							};

						end;

						return TK[RK];

					end;

					local function RK(kK, IK, ZK)

						if type(kK) ~= 'table' then

							return;

						end;

						ZK = ZK or 8;

						for yA = ZK, 2, - 1.0 do

							kK[yA] = kK[yA - 1];

						end;

						kK[1] = IK;

						for IK = ZK + 1, ZK + 4 do

							kK[IK] = nil;

						end;

					end;

					local function kK(IK)

						if TK[IK] then

							TK[IK] = nil;

						end;

						Y.clear_player(IK);

					end;

					function D()

						for IK in pairs(TK) do

							Y.clear_player(IK);

						end;

						Y.clear_all();

						TK = {};

					end;

					local IK = {};

					local ZK = {};

					local function yA(jA, QA)

						local bA = globals.realtime();

						local lA = tostring(QA);

						local QA = TK[jA];

						local VA = (QA and QA._stage) or '?';

						local QA = tostring(jA) .. ":" .. VA .. ':' .. lA;

						if (bA - (ZK[QA] or 0)) < 2 then

							return;

						end;

						ZK[QA] = bA;

					end;

					local function ZK(jA)

						local QA = H(jA.m_flFeetSpeedForwardsOrSideWays, 0, 1);

						local bA = (((jA.m_flStopToFullRunningFraction * - 0.3) - 0.2) * QA) + 1;

						local lA = jA.m_fDuckAmount;

						if lA > 0 then

							bA = bA + (lA * QA * (0.5 - bA));

						end;

						return H(bA, 0.5, 1);

					end;

					local function jA(QA, bA)

						local lA = math.max(QA, bA);

						if (QA <= 10) and (bA <= 10) then

							return lA;

						end;

						if (QA <= 35) and (bA <= 35) then

							return math.max(29, lA);

						end;

						return H(lA, 29, 58);

					end;

					local function QA(bA, lA, VA)

						local qA = VA[6];

						RK(bA.records, {

							eye_yaw = lA.m_flEyeYaw,

							goal_feet_yaw = lA.m_flGoalFeetYaw,

							pitch = lA.m_flPitch,

							duck = lA.m_fDuckAmount,

							feet_speed = lA.m_flFeetSpeedForwardsOrSideWays,

							stop_frac = lA.m_flStopToFullRunningFraction,

							l6_weight = ((qA and qA.m_flWeight) or 0),

							l6_pbr = ((qA and qA.m_flPlaybackRate) or 0),

							l6_seq = ((qA and qA.m_nSequence) or 0),

							eye_feet_diff = A(lA.m_flEyeYaw, lA.m_flGoalFeetYaw)

						}, 4);

					end;

					local function bA(lA, VA, qA)

						local OA = lA.yaw_cache;

						local EA = lA.jitter_idx % 6;

						OA[EA] = VA;

						lA.jitter_idx = lA.jitter_idx + 1;

						local VA = (lA.jitter_idx - 2) % 6;

						local EA = (lA.jitter_idx - 1) % 6;

						if (OA[VA] == nil) or (OA[EA] == nil) then

							lA.is_jitter = false;

							return 0, 0, 0;

						end;

						local aA = math.abs(A(OA[EA], OA[VA]));

						lA.jitter_diff = aA;

						local sA = 45 * qA;

						local zA = aA >= sA;

						local sA = (not zA) and (aA >= 10);

						lA.is_jitter = zA or sA;

						if not lA.is_jitter then

							return 0, 0, 0;

						end;

						local sA, hA = OA[VA] * s, OA[EA] * s;

						local s = (math.sin(sA) + math.sin(hA)) * 0.5;

						local VA = (math.cos(sA) + math.cos(hA)) * 0.5;

						lA.jitter_avg = n(math.atan2(s, VA) * p);

						local s = ((A(OA[EA], lA.jitter_avg) > 0) and 1) or - 1.0;

						if zA then

							return s, H(aA * qA, 20, 58), 0.75;

						else

							return s, H(lA.desync or 29, 20, 45), 0.5;

						end;

					end;

					local function s(n)

						if # n.records < 2 then

							return;

						end;

						local lA, VA = n.records[1], n.records[2];

						n.abs_diff_prev = n.abs_diff_cur;

						n.abs_diff_cur = math.abs(lA.eye_feet_diff);

						n.should_skip_resolve = (n.abs_diff_prev > 5) and (n.abs_diff_cur < n.abs_diff_prev);

					end;

					local function n(lA, VA)

						if # lA.records < 1 then

							return;

						end;

						local qA = lA.records[1].l6_pbr * 100000;

						if VA == 0 then

							lA.sp_rates.center = qA;

						elseif VA == - 1.0 then

							lA.sp_rates.left = qA;

						elseif VA == 1 then

							lA.sp_rates.right = qA;

						end;

					end;

					local function lA(VA)

						if # VA.records < 1 then

							return 0, 0, 0;

						end;

						local qA = VA.sp_rates;

						local OA, EA, aA = qA.left ~= nil, qA.right ~= nil, qA.center ~= nil;

						local sA = ((OA and 1) or 0) + ((EA and 1) or 0) + ((aA and 1) or 0);

						if sA < 2 then

							return 0, 0, 0;

						end;

						local sA = VA.records[1].l6_pbr * 100000;

						local VA = (OA and math.abs(sA - qA.left)) or math.huge;

						local OA = (EA and math.abs(sA - qA.right)) or math.huge;

						local EA = (aA and math.abs(sA - qA.center)) or math.huge;

						local qA, aA = VA, - 1.0;

						if OA < qA then

							qA, aA = OA, 1;

						end;

						if EA < qA then

							qA, aA = EA, 0;

						end;

						if aA == 0 then

							return 0, 0, 0;

						end;

						local qA = {

							VA,

							OA,

							EA

						};

						table.sort(qA);

						local VA = qA[2] - qA[1];

						local qA = H(0.45 + (VA / 5), 0.45, 0.85);

						return aA, 45, qA;

					end;

					local function VA(qA, OA)

						if # qA.records < 3 then

							return 0, 0, 0;

						end;

						local EA, aA, sA = qA.records[1], qA.records[2], qA.records[3];

						local qA, zA, hA = EA.l6_pbr * 100000, aA.l6_pbr * 100000, sA.l6_pbr * 100000;

						local sA = qA - zA;

						local qA = zA - hA;

						local zA = sA;

						if math.abs(sA) <= 0.05 then

							if math.abs(qA) <= 0.05 then

								return 0, 0, 0;

							end;

							zA = qA;

						end;

						local qA = ((zA > 0) and 1) or - 1.0;

						local sA = 0.55;

						local zA = entity.get_prop(OA, "m_flLowerBodyYawTarget");

						if zA then

							local OA = A(zA, EA.goal_feet_yaw);

							if math.abs(OA) > 5 then

								local zA = ((OA > 0) and - 1.0) or 1;

								if zA == qA then

									sA = 0.85;

								else

									qA = zA;

									sA = 0.75;

								end;

							end;

						end;

						local OA, zA = math.abs(EA.eye_feet_diff), math.abs(aA.eye_feet_diff);

						if (OA > 2) and (zA > 2) then

							sA = math.min(sA + 0.1, 0.95);

						end;

						return qA, jA(OA, zA), sA;

					end;

					local function jA(qA, OA)

						local EA, aA, sA, zA = OA[0], OA[1], OA[2], OA[3];

						if not (EA and aA and sA and zA) then

							return 0, 0, 0;

						end;

						local OA = EA.m_flPlaybackRate;

						local EA = math.abs(aA.m_flPlaybackRate - OA);

						local aA = math.abs(sA.m_flPlaybackRate - OA);

						local sA = math.abs(zA.m_flPlaybackRate - OA);

						local OA, zA = EA, 1;

						if aA > OA then

							OA, zA = aA, 2;

						end;

						if sA > OA then

							OA, zA = sA, 3;

						end;

						qA.ml_diff = OA;

						if OA < 0.05 then

							return 0, 0, 0;

						end;

						local EA = (((zA % 2) == 1) and 1) or - 1.0;

						qA.ml_side = EA;

						return EA, 45, H(OA * 2, 0.15, 0.4);

					end;

					local function qA(OA)

						if # OA.records < 1 then

							return 0, 0, 0;

						end;

						local EA = OA.records[1].l6_pbr;

						if EA == 0 then

							return 0, 0, 0;

						end;

						local OA = {};

						for aA = 1, 13 do

							OA[aA] = math.floor(EA * (10 ^ aA)) - (math.floor(EA * (10 ^ (aA - 1))) * 10);

						end;

						local EA = OA[4] + OA[5] + OA[6] + OA[7];

						local aA = OA[6] + OA[7] + OA[8] + OA[9];

						local sA = ((OA[3] == 0) and ((- 3.4117 * aA) + 98.9393)) or ((- 3.4117 * EA) + 98.9393);

						if (sA >= 0) and (sA < 64) then

							return 0, H(math.floor(sA), 0, 60), 0.5;

						end;

						return 0, 0, 0;

					end;

					local function OA(EA)

						local aA = entity.get_local_player();

						if not aA then

							return 0, 0, 0;

						end;

						local sA, zA, hA = client.eye_position();

						if not sA then

							return 0, 0, 0;

						end;

						local _A, cA, PA = entity.hitbox_position(EA, 0);

						if not _A then

							return 0, 0, 0;

						end;

						local EA = math.atan2(zA - cA, sA - _A) * p;

						local function p(oA)

							local mA = math.rad(oA);

							return client.trace_bullet(aA, sA, zA, hA, _A + (40 * math.cos(mA)), cA + (40 * math.sin(mA)), PA);

						end;

						local aA, sA = p(EA - 90), p(EA + 90);

						local p = math.abs(aA - sA);

						if p < 0.05 then

							return 0, 0, 0;

						end;

						local EA = ((aA > sA) and - 1.0) or 1;

						return EA, 50, H(p * 1.5, 0.3, 0.7);

					end;

					local function p(EA, aA)

						local sA = entity.get_prop(aA, 'm_nTickBase') or 0;

						local zA = globals.tickcount();

						if not EA.def_max_tb then

							EA.def_max_tb = 0;

						end;

						if math.abs(sA - EA.def_max_tb) > 64 then

							EA.def_max_tb = 0;

						end;

						local hA = 0;

						if sA > EA.def_max_tb then

							EA.def_max_tb = sA;

						elseif EA.def_max_tb > sA then

							hA = math.min(14, math.max(0, (EA.def_max_tb - sA) - 1));

						end;

						if hA > 0 then

							EA.defensive_type = 'full';

							EA.defensive_active = true;

							EA.defensive_until = zA + hA + 4;

							EA.defensive_state = "post_fire";

							return true, "full";

						end;

						local sA = entity.get_prop(aA, "m_flSimulationTime") or 0;

						local aA = sA - (EA.prev_simtime_def or sA);

						EA.prev_simtime_def = sA;

						EA.prev_simtime = sA;

						EA.last_sim_delta = aA;

						local sA = globals.tickinterval();

						if not EA.silent_stall_count then

							EA.silent_stall_count = 0;

						end;

						if math.abs(aA) < (sA * 0.3) then

							EA.silent_stall_count = EA.silent_stall_count + 1;

						elseif (aA > (sA * 1.5)) and (EA.silent_stall_count >= 2) then

							EA.defensive_type = "silent";

							EA.defensive_active = true;

							EA.defensive_until = zA + 8;

							EA.defensive_state = "firing";

							EA.silent_stall_count = 0;

							return true, 'silent';

						else

							EA.silent_stall_count = 0;

						end;

						if zA >= (EA.defensive_until or 0) then

							EA.defensive_type = "none";

							EA.defensive_active = false;

							EA.defensive_state = 'idle';

						end;

						return EA.defensive_active == true, EA.defensive_type or "none";

					end;

					local function EA(aA, sA)

						local zA = globals.tickcount();

						if zA < aA.dt_lagcomp_until then

							return true, aA.dt_state;

						end;

						local hA = entity.get_prop(sA, "m_iShotsFired") or 0;

						local _A = hA - (aA.prev_shotsfired or 0);

						aA.prev_shotsfired = hA;

						if _A >= 2 then

							aA.dt_state = "shifted";

							aA.dt_lagcomp_until = zA + 14;

							aA.is_dt_user = true;

							nK(aA, "is_dt_user");

							QK('DT_SHIFT', "idx=" .. sA, 'sf_delta=' .. _A);

							return true, "shifted";

						end;

						local hA = entity.get_prop(sA, 'm_vecOrigin[0]') or 0;

						local _A = entity.get_prop(sA, "m_vecOrigin[1]") or 0;

						local cA, PA = aA.prev_origin_x, aA.prev_origin_y;

						local oA = (type(cA) == "number") and (type(PA) == 'number') and ((cA ~= 0) or (PA ~= 0));

						local mA, BA = 0, 0;

						if oA then

							mA, BA = hA - cA, _A - PA;

						end;

						local cA = math.sqrt((mA * mA) + (BA * BA));

						aA.prev_origin_x, aA.prev_origin_y = hA, _A;

						if oA and (cA > 32) then

							aA.dt_state = 'shifted';

							aA.dt_lagcomp_until = zA + 14;

							QK("DT_TELEPORT", "idx=" .. sA, 'dist=' .. math.floor(cA));

							return true, "shifted";

						end;

						local hA;

						if aA.last_sim_delta ~= nil then

							hA = aA.last_sim_delta;

						else

							local _A = entity.get_prop(sA, "m_flSimulationTime") or 0;

							hA = _A - (aA.prev_simtime or _A);

							aA.prev_simtime = _A;

						end;

						local _A = - globals.tickinterval() * 3;

						local cA = globals.tickinterval() * 2;

						if (aA.dt_state == 'idle') and (hA < _A) then

							aA.dt_state = "recharging";

							aA.dt_recharge_start = zA;

							aA.dt_recharge_ticks = math.floor(math.abs(hA) / globals.tickinterval());

							return true, 'recharging';

						end;

						if aA.dt_state == "recharging" then

							if (zA - aA.dt_recharge_start) > 24 then

								aA.dt_state = "idle";

								return false, 'idle';

							end;

							if hA > cA then

								aA.dt_state = 'shifted';

								aA.is_defensive_dt = true;

								aA.dt_lagcomp_until = zA + 14 + aA.dt_recharge_ticks;

								aA.is_dt_user = true;

								nK(aA, "is_dt_user");

								QK("DEFENSIVE_DT", 'idx=' .. sA, 'recharge=' .. aA.dt_recharge_ticks, "lock=14");

								return true, 'shifted';

							end;

							return true, 'recharging';

						end;

						if (aA.dt_state == 'shifted') and (zA >= aA.dt_lagcomp_until) then

							aA.dt_state = 'idle';

							aA.is_defensive_dt = false;

						end;

						return false, "idle";

					end;

					local function aA(sA, zA)

						sA.dj_hist = sA.dj_hist or {};

						RK(sA.dj_hist, zA, 12);

						if # sA.dj_hist < 6 then

							return false, 0;

						end;

						local RK = nil;

						local zA = 0;

						local hA = 0;

						for _A = 2, # sA.dj_hist do

							local cA = A(sA.dj_hist[_A - 1], sA.dj_hist[_A]);

							hA = hA + math.abs(cA);

							if math.abs(cA) > 8 then

								local _A = ((cA > 0) and 1) or - 1.0;

								if (RK ~= nil) and (RK ~= _A) then

									zA = zA + 1;

								end;

								RK = _A;

							end;

						end;

						if (zA >= 2) and (zA <= 5) and (hA > 30) then

							sA.dj_active = true;

							sA.dj_changes = zA;

							return true, zA;

						end;

						sA.dj_active = false;

						return false, 0;

					end;

					local function RK(sA)

						local zA = entity.get_prop(sA, "m_flSimulationTime") or 0;

						local sA = globals.realtime() or 0;

						return math.max(0, math.floor(((globals.curtime() - zA) - sA) / globals.tickinterval()));

					end;

					local function sA(zA, hA)

						local _A = zA.yaw_ring_idx % 64;

						zA.yaw_ring[_A] = hA;

						zA.yaw_ring_tick[_A] = globals.tickcount();

						zA.yaw_ring_idx = (zA.yaw_ring_idx + 1) % 64;

					end;

					local function zA(hA, _A)

						local cA = hA.duck_ring_idx % 8;

						hA.duck_ring[cA] = _A;

						hA.duck_ring_idx = (hA.duck_ring_idx + 1) % 8;

						local _A = 0;

						local cA = nil;

						local PA, oA = 0, 0;

						for mA = 0, 7 do

							local BA = hA.duck_ring[mA];

							if BA ~= nil then

								local mA = ((BA > 0.3) and 1) or 0;

								if (cA ~= nil) and (mA ~= cA) then

									_A = _A + 1;

								end;

								cA = mA;

								PA = PA + BA;

								oA = oA + 1;

							end;

						end;

						hA.duck_transitions = _A;

						local cA = false;

						if oA >= 4 then

							local mA = PA / oA;

							local PA = 0;

							for BA = 0, 7 do

								local MA = hA.duck_ring[BA];

								if MA ~= nil then

									PA = PA + ((MA - mA) ^ 2);

								end;

							end;

							local BA = math.sqrt(PA / oA);

							cA = (BA > 0.08) and (mA > 0.2) and (mA < 0.8);

						end;

						hA.is_fake_duck = (_A >= 3) or cA;

						if hA.is_fake_duck then

							nK(hA, 'is_fake_duck');

						end;

					end;

					local function hA(_A, cA)

						local PA = {};

						for oA = 0, 63 do

							local mA = _A.yaw_ring_tick[oA];

							if mA and (math.abs(mA - cA) <= 3) then

								PA[# PA + 1] = {

									tick = mA,

									yaw = _A.yaw_ring[oA]

								};

							end;

						end;

						if # PA < 3 then

							return false;

						end;

						table.sort(PA, function(cA, oA)

							return cA.tick < oA.tick;

						end);

						local cA, oA = 0, 0;

						for mA = 2, # PA do

							local BA = math.abs(A(PA[mA].yaw, PA[mA - 1].yaw));

							if BA > cA then

								cA = BA;

								oA = mA;

							end;

						end;

						if cA < 90 then

							return false;

						end;

						local cA = PA[oA - 1].yaw;

						local mA = PA[oA].yaw;

						local PA = ((A(mA, cA) > 0) and 1) or - 1.0;

						_A.snap_side = PA;

						_A.snap_until = globals.tickcount() + 32;

						_A.snap_count = (_A.snap_count or 0) + 1;

						return true;

					end;

					local function _A(cA)

						if globals.tickcount() >= cA.snap_until then

							return 0, 0, 0;

						end;

						local PA = cA.snap_side;

						local oA = H(0.45 + (math.min(cA.snap_count, 5) * 0.04), 0.45, 0.65);

						return PA, 58, oA;

					end;

					local cA = {

						checked = false,

						available = false

					};

					local function PA(oA, mA, BA, BA)

						local MA = entity.get_prop(mA, 'm_flLowerBodyYawTarget');

						if not cA.checked then

							cA.checked = true;

							cA.available = MA ~= nil;

							if MA ~= nil then

								B('[infinix] LBY netvar AVAILABLE - anchor detector active');

							else

								B('[infinix] LBY netvar MISSING (CS2 or stripped build) - anchor detector dormant');

							end;

						end;

						if not MA then

							return;

						end;

						local cA = BA and BA.m_bOnGround;

						if cA and (not oA.lby_was_on_ground) then

							oA.lby_land_tick = globals.tickcount();

						end;

						oA.lby_was_on_ground = cA;

						local cA = oA.lby_land_tick and ((globals.tickcount() - oA.lby_land_tick) < 4);

						if oA.lby_prev == nil then

							oA.lby_prev = MA;

							return;

						end;

						if (math.abs(A(MA, oA.lby_prev)) > 5) and (not cA) then

							oA.lby_anchor_yaw = MA;

							oA.lby_anchor_tick = globals.tickcount();

						end;

						oA.lby_prev = MA;

					end;

					local function cA(oA, mA)

						if not oA.lby_anchor_yaw then

							return 0, 0, 0;

						end;

						local BA = globals.tickcount() - oA.lby_anchor_tick;

						local MA = (oA.records and oA.records[1] and H(oA.records[1].feet_speed or 0, 0, 1)) or 0;

						local gA = math.floor(70 - (MA * 62));

						if gA < 8 then

							gA = 8;

						end;

						if BA > gA then

							return 0, 0, 0;

						end;

						local MA = A(mA, oA.lby_anchor_yaw);

						if math.abs(MA) < 5 then

							return 0, 0, 0;

						end;

						local oA = ((MA > 0) and 1) or - 1.0;

						local mA = 1 - (BA / gA);

						local BA = H(0.4 + (0.3 * mA), 0.4, 0.7);

						return oA, math.min(math.abs(MA), 58), BA;

					end;

					local function oA(mA, BA)

						if (not mA.dt_last_fire_tick) or (mA.dt_last_fire_tick == 0) then

							return 0, 0, 0;

						end;

						local MA = globals.tickcount();

						local gA = MA - mA.dt_last_fire_tick;

						if gA > 32 then

							return 0, 0, 0;

						end;

						local MA = mA.dt_last_fire_tick;

						local WA, YA = nil, math.huge;

						for HA = 0, 63 do

							local XA = mA.yaw_ring_tick[HA];

							if XA then

								local pA = math.abs(XA - MA);

								if (pA <= 3) and (pA < YA) then

									WA, YA = mA.yaw_ring[HA], pA;

								end;

							end;

						end;

						if not WA then

							return 0, 0, 0;

						end;

						local mA = A(BA, WA);

						if math.abs(mA) < 5 then

							return 0, 0, 0;

						end;

						local A = ((mA > 0) and 1) or - 1.0;

						local BA = 1 - (gA / 32);

						local MA = H(0.35 + (0.25 * BA), 0.35, 0.6);

						return A, math.min(math.abs(mA), 58), MA;

					end;

					local A = {};

					local function mA(BA, MA)

						return BA .. "_" .. (MA or "other");

					end;

					local function BA(MA, gA, WA)

						local YA = mA(MA, gA);

						local MA = A[YA];

						if not MA then

							MA = {

								hits = 0,

								total = 0,

								ring = {},

								idx = 0

							};

							A[YA] = MA;

						end;

						local gA = MA.ring[MA.idx % 50];

						if gA ~= nil then

							MA.hits = MA.hits - gA;

							MA.total = MA.total - 1;

						end;

						MA.ring[MA.idx % 50] = (WA and 1) or 0;

						MA.idx = MA.idx + 1;

						if WA then

							MA.hits = MA.hits + 1;

						end;

						MA.total = MA.total + 1;

					end;

					local function MA(gA, WA)

						local YA = A[mA(gA, WA)];

						if (not YA) or (YA.total < 8) then

							return 0.88;

						end;

						local A = YA.hits / YA.total;

						return H(0.72 + (A * 0.58), 0.72, 1.3);

					end;

					local A = {

						scout = function(mA, gA)

							return {

								(mA * gA),

								(mA * 29),

								(- mA * gA)

							};

						end,

						awp = function(mA, gA)

							return {

								(mA * gA),

								(mA * 29),

								(- mA * gA),

								0

							};

						end,

						auto = function(mA, gA)

							return {

								(mA * gA),

								(mA * 29),

								(- mA * gA),

								0

							};

						end,

						deagle = function(mA, gA)

							return {

								(mA * gA),

								(- mA * gA),

								(mA * 29),

								(- mA * 29)

							};

						end,

						rifle = function(mA, gA)

							return {

								(mA * gA),

								(- mA * gA),

								(mA * 29),

								(- mA * 29),

								0,

								(mA * 58),

								(- mA * 58)

							};

						end,

						smg = function(mA, gA)

							return {

								(mA * gA),

								(- mA * gA),

								(mA * 29),

								(- mA * 29),

								0,

								(mA * 58),

								(- mA * 58)

							};

						end,

						other = function(mA, gA)

							return {

								(mA * gA),

								(- mA * gA),

								(mA * 29),

								(- mA * 29),

								0,

								(mA * 58),

								(- mA * 58)

							};

						end

					};

					local function mA(gA, WA, YA, HA)

						local XA = ((WA ~= 0) and WA) or 1;

						local WA = H(YA or 29, 20, 58);

						local YA = (A[HA] or A.other)(XA, WA);

						if gA.brute_idx > 100 then

							gA.brute_idx = gA.brute_idx % 100;

						end;

						local A = (gA.brute_idx % # YA) + 1;

						return YA[A], A;

					end;

					local function A(gA, WA)

						local YA = {

							[- 1.0] = 0,

							[1] = 0

						};

						local HA, XA = 0, 0;

						for pA, pA in ipairs(gA) do

							local CA = MA(pA.name, WA);

							local MA = pA.conf * CA;

							pA.conf = MA;

							if (MA > 0) and (pA.side ~= 0) then

								YA[pA.side] = YA[pA.side] + MA;

							end;

							if (MA > 0) and (pA.mag > 0) then

								HA = HA + (pA.mag * MA);

								XA = XA + MA;

							end;

						end;

						local MA = 0;

						local WA = math.abs(YA[1] - YA[- 1.0]);

						if WA >= 0.12 then

							if YA[1] > YA[- 1.0] then

								MA = 1;

							elseif YA[- 1.0] > YA[1] then

								MA = - 1.0;

							end;

						end;

						local WA = ((XA > 0) and (HA / XA)) or 29;

						local HA, XA = 'none', 0;

						for pA, pA in ipairs(gA) do

							if (pA.side == MA) and (pA.conf > XA) then

								HA = pA.name;

								XA = pA.conf;

							end;

						end;

						return MA, WA, math.min(YA[1] + YA[- 1.0], 1), HA;

					end;

					local function MA(gA, WA, YA, HA, XA)

						if XA and (XA > 0) and (# gA < 16) then

							gA[# gA + 1] = {

								name = WA,

								side = YA,

								mag = HA,

								conf = XA

							};

						end;

					end;

					local function gA(WA)

						local YA = N(WA);

						YA._stage = "animstate";

						local N = qK(WA);

						if N == nil then

							return;

						end;

						local qK = N.m_flLastClientSideAnimationUpdateTime;

						if qK == YA.last_anim_t then

							return;

						end;

						YA.last_anim_t = qK;

						YA._stage = 'layers';

						local qK = {};

						for HA = 0, 6 do

							local XA, pA = pcall(oK, WA, HA);

							if (not XA) or (pA == nil) then

								return;

							end;

							qK[HA] = pA;

						end;

						if not qK[6] then

							return;

						end;

						YA._stage = 'record';

						local oK = ZK(N);

						local ZK = N.m_flEyeYaw;

						QA(YA, N, qK);

						sA(YA, ZK);

						PA(YA, WA, ZK, N);

						zA(YA, N.m_fDuckAmount);

						s(YA);

						YA.chokes = RK(WA);

						YA.weapon = MK(WA);

						YA._stage = 'defensive';

						local s, MK = false, "none";

						if not YA.defensive_active then

							YA.last_real_yaw = ZK;

						end;

						s, MK = p(YA, WA);

						local p, RK = false, 'idle';

						YA._stage = "dt";

						p, RK = EA(YA, WA, N);

						local QA = nil;

						local EA = rawget(_G, 'INFINIX_PREDICT_RUNTIME');

						if (EA ~= nil) and (type(EA.get_resolver_context) == 'function') then

							local sA, zA = pcall(EA.get_resolver_context, WA, YA, {

								dt_active = p,

								dt_phase = RK

							});

							if sA and (type(zA) == 'table') then

								QA = zA;

								YA.pred = zA;

							end;

						end;

						local EA = (QA ~= nil) and (QA.active == true) and (QA.untrusted == true);

						YA._stage = "delay_jitter";

						aA(YA, ZK);

						YA._stage = 'detectors';

						local aA = {};

						local sA = YA.chokes > 3;

						if not sA then

							local sA, zA, PA = bA(YA, ZK, oK);

							MA(aA, 'jit', sA, zA, PA);

						else

							YA.is_jitter = false;

						end;

						if YA.dj_active and (YA.side ~= 0) and ((YA.miss or 0) == 0) then

							local oK = ((YA.side ~= 0) and YA.side) or 1;

							MA(aA, "djit", oK, 35, 0.25);

						end;

						local oK, bA, sA = VA(YA, WA);

						if sA > 0 then

							YA.side = oK;

							MA(aA, 'pbr', oK, bA, sA);

						end;

						local oK, bA, VA = lA(YA);

						MA(aA, "tri", oK, bA, VA);

						local oK = jA(YA, qK);

						YA.ml_side = oK;

						do

							local qK, qK = qA(YA);

							if qK > 0 then

								YA.desync = qK;

							end;

						end;

						local qK, oK, jA = OA(WA);

						YA.freestand_side = qK;

						if (YA.miss or 0) >= 2 then

							MA(aA, "fs", qK, oK, math.min(jA or 0, 0.35));

						end;

						YA.prev_pitch = N.m_flPitch;

						do

							local qK, oK, jA = _A(YA);

							MA(aA, 'snap', qK, oK, jA);

						end;

						do

							local qK, oK, jA = cA(YA, ZK);

							MA(aA, "lby", qK, oK, jA);

						end;

						if (YA.miss or 0) >= 1 then

							local qK, oK, jA = oA(YA, ZK);

							MA(aA, "btrace", qK, oK, math.min(jA or 0, 0.45));

						end;

						YA._stage = 'fingerprint';

						local qK = uK(YA, N, WA);

						YA.fingerprint = qK;

						YA.mem_used = false;

						YA._stage = "memory";

						local N, oK, uK, ZK = AK(YA, WA, qK, YA.weapon);

						if uK > 0 then

							MA(aA, ZK, N, oK, uK);

							YA.mem_used = true;

						end;

						local N, qK, oK;

						local uK = "none";

						do

							YA._stage = 'fuse';

							local AK, ZK, jA, bA = A(aA, YA.weapon);

							if AK == 0 then

								N = 0;

								oK = 0;

								qK = "idle";

								uK = 'none';

							else

								YA.side = AK;

								N = ZK * AK * - 1.0;

								oK = jA;

								qK = string.format('%s %+.0f', bA, N);

								uK = bA;

							end;

						end;

						if s then

							N = mA(YA, YA.side, YA.desync, YA.weapon);

							qK = string.format('HDF[%s] %+.0f', string.sub(MK, 1, 4), N);

							oK = math.max(oK or 0, 0.5);

							uK = "hdf";

						end;

						do

							local A = globals.tickcount();

							local AK = ((YA.last_mismatch_tick or 0) > 0) and ((A - (YA.last_mismatch_tick or 0)) < 96);

							local ZK = (not s) and (not p) and (not EA) and (not AK) and ((YA.miss or 0) == 0) and ((YA.good_until or 0) > A) and (math.abs(tonumber(YA.good_angle) or 0) >= 1) and (((YA.good_weapon or '') == '') or ((YA.good_weapon or '') == (YA.weapon or "")));

							if ZK and ((uK == 'none') or ((oK or 0) < math.min(0.86, (YA.good_conf or 0) + 0.1))) then

								N = H(YA.good_angle or N or 0, - 60.0, 60);

								YA.side = ((YA.good_side ~= 0) and YA.good_side) or YA.side;

								oK = math.max(oK or 0, (YA.good_conf or 0) * 0.92);

								uK = ((YA.good_winner ~= "none") and YA.good_winner) or uK;

								qK = string.format("HOLD[%s] %+.0f", tostring(uK or '?'), N);

							end;

						end;

						local A = 2;

						local AK = ((YA.last_mismatch_tick or 0) > 0) and ((globals.tickcount() - (YA.last_mismatch_tick or 0)) < 96);

						local ZK = (YA.quarantine_until or 0) > globals.tickcount();

						if AK then

							A = (((YA.mismatch_streak or 0) >= 2) and 1) or 3;

						elseif YA.mem_used then

							local AK = oK or 0;

							if AK >= 0.8 then

								A = 5;

							elseif AK >= 0.65 then

								A = 3;

							end;

						end;

						if (not s) and (YA.miss >= A) and (not YA.should_skip_resolve) then

							N = mA(YA, YA.side, YA.desync, YA.weapon);

							qK = string.format("BRT[%d] %+.0f", YA.brute_idx, N);

							oK = 0.4;

							uK = 'brute';

						end;

						YA.winning_detector = uK;

						if uK == 'hdf' then

							if YA.prev_winner ~= "hdf" then

								CK('hdf').wins = CK('hdf').wins + 1;

							end;

						elseif uK ~= "none" then

							CK(uK).wins = CK(uK).wins + 1;

						end;

						YA.prev_winner = uK;

						N = H(N, - 60.0, 60);

						YA.applied = N;

						YA.label = qK;

						YA.confidence = oK or 0;

						if YA.side == - 1.0 then

							YA.desync_l_last = math.abs(N);

						elseif YA.side == 1 then

							YA.desync_r_last = math.abs(N);

						end;

						YA._stage = 'plist';

						Y.begin_player(WA, "resolver");

						local A = (uK ~= "none") and ((oK or 0) >= ((ZK and 0.68) or 0.35));

						if p then

							Y.request(WA, "resolver", 'Force Body Yaw', false, 55, "dt shift");

							Y.request(WA, 'resolver', 'Prefer safepoint', false, 55, 'dt shift');

							if RK == 'shifted' then

								YA.label = string.format('DT-SHIFT lock=%d', YA.dt_lagcomp_until - globals.tickcount());

							else

								YA.label = 'DT-RECHARGE';

							end;

							YA.winning_detector = "dt_shift";

							uK = 'dt_shift';

						elseif s then

							Y.request(WA, 'resolver', "Prefer safepoint", true, 60, 'defensive');

							Y.request(WA, "resolver", 'Force Body Yaw', true, 60, "defensive");

							Y.request(WA, 'resolver', "Force Body Yaw Value", N, 60, 'defensive');

							YA.label = string.format('DEF[%s] %+.0f', string.sub(MK, 1, 4), N);

						elseif EA then

							Y.request(WA, "resolver", 'Force Body Yaw', false, 55, "predict");

							Y.request(WA, "resolver", "Prefer safepoint", false, 55, 'predict');

							YA.label = "PRED " .. tostring(QA.reason or QA.prediction_reason or 'untrusted');

						elseif ZK and (not A) then

							Y.request(WA, "resolver", "Force Body Yaw", false, 58, "quarantine");

							Y.request(WA, 'resolver', 'Prefer safepoint', true, 58, 'quarantine');

							YA.label = string.format('QRT %d', math.max(0, (YA.quarantine_until or 0) - globals.tickcount()));

						elseif A then

							Y.request(WA, 'resolver', 'Force Body Yaw', true, 50, 'resolver');

							Y.request(WA, 'resolver', "Force Body Yaw Value", N, 50, 'resolver');

							Y.request(WA, 'resolver', "Prefer safepoint", false, 50, "resolver");

						else

							Y.request(WA, 'resolver', "Force Body Yaw", false, 45, 'idle');

							Y.request(WA, 'resolver', "Prefer safepoint", false, 45, "idle");

							YA.label = "idle";

						end;

						Y.request(WA, 'resolver', "Correction Active", false, 50, 'resolver');

						Y.apply_player(WA);

						if not lK then

							local s = W(WA, "Force Body Yaw Value");

							if s == nil then

								B('[infinix] WARN plist \'Force Body Yaw Value\' returns nil - key may be wrong');

							elseif math.abs((s or 0) - N) > 0.5 then

								B(string.format("[infinix] WARN plist value mismatch: set=%.1f read=%.1f", N, s));

							else

								B('[infinix] plist verified - body yaw forcing active');

							end;

							lK = true;

						end;

						YA._stage = "dmg";

						local s = entity.get_prop(WA, 'm_iHealth') or 100;

						YA.dmg_override = BK(WA, s, YA.confidence);

						Y.apply_player(WA);

						YA._stage = "ok";

					end;

					local s;

					local function W(p, N)

						cK.LAST_ERR = tostring(p) .. ': ' .. tostring(N);

						B("[infinix] DB " .. cK.LAST_ERR);

					end;

					local function p(N, A)

						if s then

							local lK, qK = pcall(s, A);

							if not lK then

								W(N .. " commit failed", qK);

								return false;

							end;

						end;

						if iK.round_dirty then

							fK = true;

							iK.round_dirty = false;

						end;

						local lK = (A and R.save_all) or R.save;

						local A, qK = pcall(lK);

						if not A then

							W(N .. " save failed", qK);

							return false;

						end;

						if qK == false then

							W(N .. " save failed", cK.LAST_ERR);

							return false;

						end;

						return true;

					end;

					local function W(N)

						iK.round_dirty = true;

						if N == 'round_end' then

							iK.round_t = globals.realtime() + iK.round_delay;

						end;

						return true;

					end;

					local function N(A)

						return (A or globals.tickcount()) < (rawget(_G, "INFINIX_DT_RELAX_UNTIL") or 0);

					end;

					local A = {

						by_id = {},

						by_target = {},

						max_ticks = 32,

						target_fallback_ticks = 20

					};

					A.noevent_ticks = 18;

					function A.id(lK)

						if lK == nil then

							return nil;

						end;

						return tostring(lK);

					end;

					function A.prune(lK)

						lK = lK or globals.tickcount();

						for qK, oK in pairs(A.by_id) do

							if (type(oK) ~= 'table') or ((lK - (oK.tick or lK)) > A.max_ticks) then

								A.by_id[qK] = nil;

							end;

						end;

						for qK, oK in pairs(A.by_target) do

							if (type(oK) ~= "table") or ((lK - (oK.tick or lK)) > A.max_ticks) then

								A.by_target[qK] = nil;

							end;

						end;

					end;

					function A.aipeek()

						local lK = rawget(_G, 'INFINIX_AI_PEEK_CONTEXT');

						if (type(lK) ~= 'table') or (type(lK.get) ~= "function") then

							return nil;

						end;

						local qK, oK = pcall(lK.get);

						if qK and (type(oK) == 'table') then

							return oK;

						end;

						return nil;

					end;

					function A.capture(lK)

						if (lK == nil) or (lK.target == nil) then

							return;

						end;

						local qK = false;

						if (z ~= nil) and (type(z.is_double_tap_active) == 'function') and z.is_double_tap_active() then

							rawset(_G, "INFINIX_DT_RELAX_UNTIL", globals.tickcount() + 48);

							qK = true;

						end;

						local oK = TK[lK.target];

						if oK == nil then

							return;

						end;

						local BK = globals.tickcount();

						rawset(_G, "INFINIX_POST_SHOT_THROTTLE_UNTIL", BK + iK.post_shot_throttle_ticks);

						A.prune(BK);

						local MK = ((type(oK.records) == 'table') and oK.records[1]) or nil;

						local uK = ((type(oK.pred) == 'table') and oK.pred) or nil;

						local AK = A.aipeek();

						local RK = rawget(_G, "INFINIX_SHOT_DIRECTOR");

						local ZK = A.id(lK.id);

						local jA = oK.applied or 0;

						local QA = oK.side or 0;

						if math.abs(jA) >= 1 then

							if jA < 0 then

								QA = 1;

							elseif jA > 0 then

								QA = - 1.0;

							end;

						end;

						local bA = oK.fingerprint;

						if (not bA) or (bA == "") then

							local lA = 0;

							if type(MK) == "table" then

								if MK.on_ground == false then

									lA = 3;

								elseif (MK.duck or 0) > 0.5 then

									lA = 2;

								elseif (MK.feet_speed or MK.speed or 0) > 0.4 then

									lA = 1;

								end;

							end;

							bA = string.format('j%dd%ds%dT%dA%dF%d', C(math.abs(oK.jitter_diff or 0)), Z(math.abs(oK.desync or jA or 29)), lA, (oK.is_dt_user and 1) or 0, (oK.avoid_overlap and 1) or 0, (oK.is_fake_duck and 1) or 0);

						end;

						local MK = {

							id = ZK,

							target = lK.target,

							expected_hitgroup = tonumber(lK.hitgroup),

							expected_hitbox = tonumber(lK.hitbox),

							expected_damage = tonumber(lK.damage),

							tick = BK,

							realtime = globals.realtime(),

							fp = bA,

							weapon = (oK.weapon or 'other'),

							side = QA,

							applied = jA,

							angle = math.abs(jA),

							confidence = (oK.confidence or 0),

							winning_detector = oK.winning_detector,

							mem_used = (oK.mem_used == true),

							label = oK.label,

							is_dt_user = (oK.is_dt_user == true),

							is_fake_duck = (oK.is_fake_duck == true),

							avoid_overlap = (oK.avoid_overlap == true),

							defensive_active = (oK.defensive_active == true),

							dt_relax = (qK or N(BK)),

							dt_window = ((oK.dt_state == "shifted") and (BK < (oK.dt_lagcomp_until or 0))),

							pred_untrusted = ((uK ~= nil) and (uK.untrusted == true)),

							pred_reason = ((uK and (uK.reason or uK.prediction_reason)) or nil),

							pred_confidence = ((uK and uK.confidence) or nil),

							ai_peek_active = ((AK ~= nil) and (AK.active == true) and (AK.target == lK.target)),

							ai_peek_target = ((AK and AK.target) or nil),

							ai_peek_point = ((AK and AK.point) or 0),

							ai_peek_bt_state = ((AK and AK.bt_state) or nil),

							ai_peek_bt_risk = ((AK and AK.bt_risk) or 0),

							ai_peek_trace_damage = ((AK and AK.trace_damage) or 0),

							shot_director_active = ((type(RK) == 'table') and (RK.applied == true) and (RK.target == lK.target)),

							shot_director_reason = (((type(RK) == 'table') and RK.reason) or nil),

							shot_director_delay = (((type(RK) == 'table') and RK.delay_ticks) or 0),

							shot_director_hc = (((type(RK) == 'table') and RK.hitchance) or 0),

							impacts = 0,

							hurt = false,

							hurt_damage = 0,

							finished = false,

							steamid = nil

						};

						if ZK ~= nil then

							A.by_id[ZK] = MK;

						end;

						A.by_target[lK.target] = MK;

					end;

					function A.get(lK)

						local qK = globals.tickcount();

						local oK = (lK and A.id(lK.id)) or nil;

						local BK = (oK and A.by_id[oK]) or nil;

						if (BK ~= nil) and (lK ~= nil) and (lK.target ~= nil) and (BK.target ~= lK.target) then

							BK = nil;

						end;

						if (BK == nil) and (lK ~= nil) and (lK.target ~= nil) then

							local oK = A.by_target[lK.target];

							if (oK ~= nil) and ((qK - (oK.tick or qK)) <= A.target_fallback_ticks) then

								BK = oK;

							end;

						end;

						if (BK ~= nil) and ((qK - (BK.tick or qK)) <= A.max_ticks) then

							return BK;

						end;

						return nil;

					end;

					function A.latest(lK, qK)

						local oK = globals.tickcount();

						local BK = tonumber(qK) or A.max_ticks;

						local qK, MK = nil, - 1.0;

						local uK = {};

						local function AK(RK)

							if (type(RK) ~= "table") or (RK.finished == true) or uK[RK] then

								return;

							end;

							uK[RK] = true;

							if (lK ~= nil) and (RK.target ~= lK) then

								return;

							end;

							local lK = tonumber(RK.tick) or oK;

							local uK = oK - lK;

							if (uK >= 0) and (uK <= BK) and (lK > MK) then

								qK = RK;

								MK = lK;

							end;

						end;

						for lK, lK in pairs(A.by_id) do

							AK(lK);

						end;

						for lK, lK in pairs(A.by_target) do

							AK(lK);

						end;

						return qK;

					end;

					function A.clear(lK, qK)

						qK = qK or A.get(lK);

						if qK ~= nil then

							qK.finished = true;

						end;

						local oK = (qK and qK.id) or (lK and A.id(lK.id)) or nil;

						if oK ~= nil then

							A.by_id[oK] = nil;

						end;

						if (qK ~= nil) and (qK.target ~= nil) and (A.by_target[qK.target] == qK) then

							A.by_target[qK.target] = nil;

						end;

					end;

					function A.mark_impact(lK)

						if (lK == nil) or (lK.userid == nil) then

							return;

						end;

						local qK = entity.get_local_player();

						if qK == nil then

							return;

						end;

						local oK = client.userid_to_entindex(lK.userid);

						if oK ~= qK then

							return;

						end;

						local qK = A.latest(nil, 12);

						if qK == nil then

							return;

						end;

						qK.impacts = (tonumber(qK.impacts) or 0) + 1;

						qK.last_impact_tick = globals.tickcount();

						qK.impact_x = tonumber(lK.x);

						qK.impact_y = tonumber(lK.y);

						qK.impact_z = tonumber(lK.z);

					end;

					function A.mark_hurt(lK)

						if (lK == nil) or (lK.attacker == nil) or (lK.userid == nil) then

							return;

						end;

						local qK = entity.get_local_player();

						if qK == nil then

							return;

						end;

						local oK = client.userid_to_entindex(lK.attacker);

						if oK ~= qK then

							return;

						end;

						local oK = client.userid_to_entindex(lK.userid);

						if (oK == nil) or (oK == qK) then

							return;

						end;

						local qK = A.latest(oK, 18);

						if qK == nil then

							return;

						end;

						qK.hurt = true;

						qK.hurt_damage = (tonumber(qK.hurt_damage) or 0) + (tonumber(lK.dmg_health) or 0);

						qK.last_hurt_tick = globals.tickcount();

					end;

					function A.reset()

						for lK in pairs(A.by_id) do

							A.by_id[lK] = nil;

						end;

						for lK in pairs(A.by_target) do

							A.by_target[lK] = nil;

						end;

					end;

					function A.ignore(lK, qK)

						local oK = globals.tickcount();

						if lK ~= nil then

							if lK.dt_relax then

								return "dtrelax";

							end;

							if lK.dt_window then

								return 'dt';

							end;

							if lK.is_fake_duck then

								return 'fakeduck';

							end;

							if lK.pred_untrusted then

								return 'predict';

							end;

							if lK.defensive_active then

								return "defensive";

							end;

							if lK.ai_peek_active and ((tonumber(lK.ai_peek_bt_risk) or 0) >= 24) then

								return "aipeek";

							end;

							return nil;

						end;

						if qK ~= nil then

							if (qK.dt_state == "shifted") and (oK < (qK.dt_lagcomp_until or 0)) then

								return "dt";

							end;

							if qK.is_fake_duck then

								return 'fakeduck';

							end;

						end;

						return nil;

					end;

					local function lK(qK)

						return (qK ~= nil) and (qK ~= '') and (qK ~= 'none') and (qK ~= 'idle') and (qK ~= "dt_shift");

					end;

					rawset(_G, "INFINIX_RESOLVER_SHOT_CONTEXT", {

						get = function(qK)

							return A.get(qK);

						end,

						ignore_reason = function(qK, oK)

							local BK = A.get(qK);

							local qK = (oK and TK[oK]) or (BK and BK.target and TK[BK.target]) or nil;

							return A.ignore(BK, qK);

						end

					});

					local function qK(oK, BK, MK, uK, AK)

						local RK = TK[oK];

						if not RK then

							return;

						end;

						local ZK = (AK and AK.fp) or RK.fingerprint;

						if (not ZK) or (ZK == '') then

							local jA = ((type(RK.records) == 'table') and RK.records[1]) or nil;

							local QA = 0;

							if type(jA) == 'table' then

								if jA.on_ground == false then

									QA = 3;

								elseif (jA.duck or 0) > 0.5 then

									QA = 2;

								elseif (jA.feet_speed or jA.speed or 0) > 0.4 then

									QA = 1;

								end;

							end;

							ZK = string.format("j%dd%ds%dT%dA%dF%d", C(math.abs(RK.jitter_diff or 0)), Z(math.abs(RK.desync or RK.applied or 29)), QA, (RK.is_dt_user and 1) or 0, (RK.avoid_overlap and 1) or 0, (RK.is_fake_duck and 1) or 0);

							RK.fingerprint = ZK;

						end;

						if ((AK and AK.is_fake_duck) or RK.is_fake_duck) and (not BK) then

							return;

						end;

						if (not BK) and (not uK) then

							if A.ignore(AK, RK) ~= nil then

								return;

							end;

						end;

						local C = (AK and AK.winning_detector) or RK.winning_detector;

						local Z = (AK and tonumber(AK.applied)) or RK.applied or 0;

						if (not lK(C)) or (math.abs(Z) < 1) then

							return;

						end;

						local C = JK[oK];

						if (type(C) ~= 'table') or (# C > 128) then

							if type(C) == 'table' then

								KK = math.max(0, KK - # C);

							end;

							C = {};

							JK[oK] = C;

						end;

						local jA = (AK and tonumber(AK.side)) or RK.side or 0;

						if jA == 0 then

							local QA = Z;

							if QA < 0 then

								jA = 1;

							elseif QA > 0 then

								jA = - 1.0;

							else

								jA = 1;

							end;

						end;

						local Z = math.abs((AK and tonumber(AK.angle)) or (AK and tonumber(AK.applied)) or RK.applied or 0);

						if Z < 1 then

							Z = math.abs(RK.desync or 29);

						end;

						C[# C + 1] = {

							fp = ZK,

							weapon = ((AK and AK.weapon) or RK.weapon or 'other'),

							side = jA,

							angle = Z,

							hit = BK,

							wh = (uK or false),

							idx = oK,

							steamid = ((AK and AK.steamid) or nil),

							hp_delta = (MK or 0)

						};

						KK = KK + 1;

					end;

					local C = {

						[0] = 'generic',

						[1] = 'head',

						[2] = "chest",

						[3] = 'stomach',

						[4] = "left arm",

						[5] = "right arm",

						[6] = "left leg",

						[7] = "right leg"

					};

					local function Z(oK)

						return C[tonumber(oK) or - 1.0] or tostring(oK or '?');

					end;

					client.set_event_callback('aim_fire', A.capture);

					client.set_event_callback("bullet_impact", A.mark_impact);

					client.set_event_callback("player_hurt", A.mark_hurt);

					client.set_event_callback('aim_hit', function(C)

						local oK = entity.get_local_player();

						if C.target == nil then

							return;

						end;

						if C.target == oK then

							return;

						end;

						local oK = A.get(C);

						vK.shot_hits = vK.shot_hits + 1;

						vK.shot_dmg = vK.shot_dmg + (C.damage or 0);

						iK.round_dirty = true;

						DK = DK + 1;

						if (oK and oK.dt_relax) or N() then

							QK('HIT_DTRELAX', "idx=" .. tostring(C.target), 'dmg=' .. tostring(C.damage or 0));

							A.clear(C, oK);

							return;

						end;

						local BK = TK[C.target];

						if BK then

							local MK = (oK and oK.winning_detector) or BK.winning_detector;

							local uK = (oK and oK.side) or BK.side;

							local AK = (oK and oK.applied) or BK.applied or 0;

							local RK = (oK and oK.confidence) or BK.confidence or 0;

							local ZK = (oK and oK.weapon) or BK.weapon;

							local jA = (oK and tonumber(oK.expected_hitgroup)) or nil;

							local QA = tonumber(C.hitgroup);

							local bA = (jA ~= nil) and (jA > 0) and (QA ~= nil) and (QA > 0) and (jA ~= QA);

							local lA = (bA and A.ignore(oK, BK)) or nil;

							local VA = (oK and tonumber(oK.expected_damage)) or 0;

							local qA = tonumber(C.damage) or 0;

							local OA = math.max(0, VA - qA);

							local VA = bA and ((jA == 1) or (OA >= 10));

							local EA = lK(MK) and (math.abs(AK) >= 1);

							if bA and (lA ~= nil) then

								QK('MISMATCH_' .. string.upper(lA), "idx=" .. tostring(C.target), "exp=" .. Z(jA), "got=" .. Z(QA), 'dmg=' .. qA, "loss=" .. OA);

							elseif bA then

								if not EA then

									QK('MISMATCH_SKIP', 'idx=' .. tostring(C.target), 'reason=no_resolver', 'exp=' .. Z(jA), 'got=' .. Z(QA), 'dmg=' .. qA);

								elseif VA then

									BK.misses = BK.misses + 1;

									BK.miss = (BK.miss or 0) + 1;

									BK.brute_idx = ((BK.brute_idx or 0) + 1) % 100;

									BK.mismatch_streak = (BK.mismatch_streak or 0) + 1;

									BK.last_mismatch_tick = globals.tickcount();

									BK.good_until = 0;

									BK.quarantine_until = globals.tickcount() + 32;

								end;

								if EA then

									CK(MK).misses = CK(MK).misses + 1;

									BA(MK, ZK, false);

									QK("MISMATCH", 'det=' .. tostring(MK or "?"), 'side=' .. tostring(uK), "angle=" .. math.floor(AK), "conf=" .. math.floor(RK * 100) .. '%', "wpn=" .. (ZK or "?"), 'exp=' .. Z(jA), 'got=' .. Z(QA), 'dmg=' .. qA, "loss=" .. OA, 'strong=' .. ((VA and "Y") or 'N'));

									qK(C.target, false, qA, true, oK);

									W('shot_mismatch');

								end;

							elseif EA then

								BK.hits = BK.hits + 1;

								if (oK and oK.dt_window) or (BK.dt_state == "shifted") then

									BK.dt_hits = BK.dt_hits + 1;

								end;

								BK.miss = 0;

								BK.brute_idx = 0;

								BK.mismatch_streak = 0;

								BK.last_mismatch_tick = 0;

								BK.quarantine_until = 0;

								BK.opposite_misses = 0;

								BK.avoid_overlap = false;

								BK.good_angle = AK;

								BK.good_side = uK or 0;

								BK.good_until = globals.tickcount() + 28;

								BK.good_conf = RK or 0;

								BK.good_winner = MK or 'none';

								BK.good_weapon = ZK or BK.weapon or "";

								n(BK, uK);

								CK(MK).hits = CK(MK).hits + 1;

								BA(MK, ZK, true);

								QK('HIT', 'det=' .. MK, "side=" .. tostring(uK), 'angle=' .. math.floor(AK), "conf=" .. math.floor(RK * 100) .. "%", "wpn=" .. (ZK or '?'), 'dmg=' .. (C.damage or 0), 'dt=' .. ((((oK and oK.dt_window) or (BK.dt_state == 'shifted')) and "Y") or 'N'));

								qK(C.target, true, C.damage, false, oK);

								W('shot_hit');

							else

								QK("HIT_SKIP", 'idx=' .. tostring(C.target), "reason=no_resolver", "dmg=" .. tostring(C.damage or 0));

							end;

						end;

						A.clear(C, oK);

					end);

					client.set_event_callback('aim_miss', function(C)

						local n = entity.get_local_player();

						if C.target == nil then

							return;

						end;

						if C.target == n then

							return;

						end;

						local n = A.get(C);

						local Z = tostring(C.reason or "?");

						vK.shot_misses = vK.shot_misses + 1;

						iK.round_dirty = true;

						NK = NK + 1;

						if (n and n.dt_relax) or N() then

							QK("MISS_DTRELAX", 'idx=' .. tostring(C.target), "reason=" .. Z);

							A.clear(C, n);

							return;

						end;

						if (Z == "spread") or (Z == "prediction_error") then

							QK('MISS_SKIP', 'idx=' .. tostring(C.target), 'reason=' .. Z);

							A.clear(C, n);

							return;

						end;

						if Z == 'wrong_hitbox' then

							local N = TK[C.target];

							local oK = A.ignore(n, N);

							if oK ~= nil then

								QK("MISS_" .. string.upper(oK), "idx=" .. tostring(C.target), 'wh=Y');

								A.clear(C, n);

								return;

							end;

							if not N then

								QK('MISS_SKIP', "idx=" .. tostring(C.target), "reason=no_ps_wh");

								A.clear(C, n);

								return;

							end;

							if N then

								local oK = (n and n.winning_detector) or N.winning_detector;

								local BK = (n and n.weapon) or N.weapon;

								local MK = (n and n.applied) or N.applied or 0;

								if (not lK(oK)) or (math.abs(MK) < 1) then

									QK('MISS_SKIP', 'idx=' .. tostring(C.target), "reason=no_resolver_wh");

									A.clear(C, n);

									return;

								end;

								N.misses = N.misses + 1;

								N.miss = (N.miss or 0) + 1;

								N.brute_idx = ((N.brute_idx or 0) + 1) % 100;

								N.mismatch_streak = (N.mismatch_streak or 0) + 1;

								N.last_mismatch_tick = globals.tickcount();

								N.good_until = 0;

								N.quarantine_until = globals.tickcount() + 32;

								CK(oK).misses = CK(oK).misses + 1;

								BA(oK, BK, false);

							end;

							qK(C.target, false, 0, true, n);

							W("shot_wh");

							A.clear(C, n);

							return;

						end;

						if Z ~= "?" then

							QK("MISS_SKIP", "idx=" .. tostring(C.target), "reason=" .. Z);

							A.clear(C, n);

							return;

						end;

						local N = TK[C.target];

						local Z = A.ignore(n, N);

						if Z ~= nil then

							if N and (Z == 'dt') then

								N.dt_misses = N.dt_misses + 1;

							end;

							QK("MISS_" .. string.upper(Z), "idx=" .. tostring(C.target));

							A.clear(C, n);

							return;

						end;

						if N then

							local Z = (n and n.winning_detector) or N.winning_detector;

							local oK = (n and n.side) or N.side or 0;

							local BK = (n and n.applied) or N.applied or 0;

							local MK = (n and n.confidence) or N.confidence or 0;

							local uK = (n and n.weapon) or N.weapon;

							local AK = (n and n.is_dt_user) or N.is_dt_user;

							local RK = (n and n.is_fake_duck) or N.is_fake_duck;

							if (not lK(Z)) or (math.abs(BK) < 1) then

								QK("MISS_SKIP", 'idx=' .. tostring(C.target), "reason=no_resolver");

								A.clear(C, n);

								return;

							end;

							N.misses = N.misses + 1;

							N.miss = N.miss + 1;

							N.good_until = 0;

							N.quarantine_until = globals.tickcount() + 24;

							local ZK = (n and n.dt_window) or ((N.dt_state == "shifted") and (globals.tickcount() < (N.dt_lagcomp_until or 0)));

							local jA = ZK;

							if ZK then

								N.dt_misses = N.dt_misses + 1;

							end;

							if not jA then

								N.brute_idx = (N.brute_idx + 1) % 100;

								if (Z == "brute") and ((BK * oK) < 0) then

									N.opposite_misses = (N.opposite_misses or 0) + 1;

									local ZK = N.hits + N.misses;

									local jA = ((ZK > 0) and (N.hits / ZK)) or 1;

									if (N.opposite_misses >= 5) and (jA < 0.3) then

										N.avoid_overlap = true;

										nK(N, "avoid_overlap");

									end;

								end;

								CK(Z).misses = CK(Z).misses + 1;

								BA(Z, uK, false);

								QK("MISS", "det=" .. Z, "side=" .. tostring(oK), 'angle=' .. math.floor(BK), "conf=" .. math.floor(MK * 100) .. "%", "wpn=" .. (uK or '?'), 'dt=' .. ((AK and 'Y') or "N"), "fd=" .. ((RK and "Y") or 'N'), 'ao=' .. ((N.avoid_overlap and 'Y') or "N"));

							else

								QK("MISS_DT", 'idx=' .. C.target, "lock_left=" .. (N.dt_lagcomp_until - globals.tickcount()));

							end;

							qK(C.target, false, 0, false, n);

							W("shot_miss");

						end;

						A.clear(C, n);

					end);

					function A.finalize_noevent(C)

						local N = globals.tickcount();

						local n = {};

						local Z = 0;

						C = tonumber(C) or 2;

						local function oK(BK)

							if (C > 0) and (Z >= C) then

								return;

							end;

							if (type(BK) ~= 'table') or (BK.finished == true) or n[BK] then

								return;

							end;

							n[BK] = true;

							if (N - (BK.tick or N)) < A.noevent_ticks then

								return;

							end;

							local C = BK.target;

							if C == nil then

								A.clear(nil, BK);

								return;

							end;

							local N = true;

							if entity.is_alive ~= nil then

								local n, MK = pcall(entity.is_alive, C);

								N = n and (MK == true);

							end;

							if not N then

								A.clear(nil, BK);

								return;

							end;

							Z = Z + 1;

							BK.finished = true;

							vK.shot_misses = vK.shot_misses + 1;

							iK.round_dirty = true;

							NK = NK + 1;

							local N = TK[C];

							local n = A.ignore(BK, N);

							if n ~= nil then

								QK("MISS_NOEVENT_" .. string.upper(n), "idx=" .. tostring(C));

								A.clear(nil, BK);

								return;

							end;

							if N then

								local n = BK.winning_detector or N.winning_detector;

								local Z = tonumber(BK.side) or N.side or 0;

								local MK = tonumber(BK.applied) or N.applied or 0;

								local uK = tonumber(BK.confidence) or N.confidence or 0;

								local AK = BK.weapon or N.weapon;

								if (not lK(n)) or (math.abs(MK) < 1) then

									QK('MISS_NOEVENT_SKIP', "idx=" .. tostring(C), "reason=no_resolver");

									A.clear(nil, BK);

									return;

								end;

								N.misses = N.misses + 1;

								N.miss = N.miss + 1;

								N.good_until = 0;

								N.quarantine_until = globals.tickcount() + 24;

								N.brute_idx = (N.brute_idx + 1) % 100;

								CK(n).misses = CK(n).misses + 1;

								BA(n, AK, false);

								QK('MISS_NOEVENT', "det=" .. tostring(n or "?"), 'side=' .. tostring(Z), 'angle=' .. math.floor(MK), "conf=" .. math.floor(uK * 100) .. '%', 'wpn=' .. tostring(AK or "?"), 'impact=' .. tostring(tonumber(BK.impacts) or 0), "hurt=" .. ((BK.hurt and 'Y') or "N"), "dmg=" .. tostring(tonumber(BK.hurt_damage) or 0));

								qK(C, false, 0, false, BK);

								W('shot_noevent');

							else

								QK('MISS_NOEVENT', "idx=" .. tostring(C), "ps=nil");

							end;

							A.clear(nil, BK);

						end;

						for C, C in pairs(A.by_id) do

							oK(C);

						end;

						for C, C in pairs(A.by_target) do

							oK(C);

						end;

					end;

					local C, N = 0, 0;

					local function n(Z)

						local lK, qK = pcall(gA, Z);

						if not lK then

							yA(Z, qK);

							if tostring(qK):find('table overflow', 1, true) then

								WK = {};

								kK(Z);

							end;

						end;

					end;

					client.set_event_callback('net_update_end', function()

						local Z = globals.mapname() or "";

						if Z ~= LK then

							LK = Z;

							DK = 0;

							NK = 0;

							A.reset();

						end;

						local Z = globals.realtime();

						local lK = globals.tickcount();

						local qK = INFINIX_DT_RELAXING(lK);

						local oK = lK < (rawget(_G, "INFINIX_POST_SHOT_THROTTLE_UNTIL") or 0);

						local BK = lK < (rawget(_G, 'INFINIX_PERF_STRESS_UNTIL') or 0);

						local MK = tonumber(rawget(_G, "INFINIX_PERF_LEVEL")) or (BK and 1) or 0;

						for BK, CK in pairs(IK) do

							if Z >= CK then

								kK(BK);

								IK[BK] = nil;

							end;

						end;

						local BK = entity.get_local_player();

						local CK = (BK ~= nil) and entity.is_alive(BK);

						local BK = nil;

						if CK and (entity.get_local_player ~= nil) then

							local LK, uK = pcall(entity.get_local_player);

							if LK and (uK ~= nil) and entity.is_alive(uK) and entity.is_enemy(uK) then

								BK = uK;

							end;

						end;

						if (not qK) and (not oK) then

							A.finalize_noevent(((MK >= 1) and 1) or 2);

						end;

						if (not qK) and (iK.round_t > 0) and (Z >= iK.round_t) then

							iK.round_t = 0;

							iK.last_t = Z;

							p("round_end flush", false);

						end;

						if (not qK) and (not CK) and fK and (not iK.round_dirty) and (SK() == 0) and ((Z - iK.last_t) > iK.interval) then

							iK.last_t = Z;

							pcall(R.save);

						end;

						local Z = rawget(_G, "INFINIX_PREDICT_RUNTIME");

						if (not qK) and (not oK) and CK and (Z ~= nil) and (type(Z.on_net_update_end) == 'function') then

							if lK >= (rawget(_G, 'INFINIX_PREDICT_NEXT_TICK') or 0) then

								rawset(_G, 'INFINIX_PREDICT_NEXT_TICK', lK + (((MK >= 1) and 3) or 2));

								pcall(Z.on_net_update_end, ((MK >= 2) and 1) or ((MK >= 1) and 2) or 3, BK);

							end;

						end;

						if rawget(_G, "INFINIX_RESOLVER_ON") ~= true then

							return;

						end;

						if not CK then

							return;

						end;

						if qK then

							return;

						end;

						local Z, qK = L();

						if Z == nil then

							return;

						end;

						if qK <= 0 then

							return;

						end;

						local L = 0;

						if BK ~= nil then

							n(BK);

							L = 1;

						end;

						local CK = ((oK or (MK >= 1)) and 1) or 2;

						if L < CK then

							for oK = 1, qK do

								C = (C % qK) + 1;

								local oK = Z[C];

								if (oK ~= nil) and (oK ~= BK) then

									if entity.is_alive(oK) then

										n(oK);

										L = L + 1;

									else

										kK(oK);

									end;

									if L >= CK then

										break;

									end;

								end;

							end;

						end;

						if lK >= N then

							N = lK + 32;

							for C = 1, qK do

								local N = Z[C];

								if (N ~= nil) and (not entity.is_alive(N)) then

									kK(N);

								end;

							end;

						end;

					end);

					local function C(N)

						local function L(n)

							return math.max(math.floor((n or 0) / 2), 0);

						end;

						local function n(Z)

							if not Z then

								return {};

							end;

							local lK = {};

							for qK, oK in pairs(Z) do

								local Z = math.max(math.floor(oK / 2), 0);

								if Z > 0 then

									lK[qK] = Z;

								end;

							end;

							return lK;

						end;

						N.l_hits = math.max(L(N.l_hits), 2);

						N.r_hits = math.max(L(N.r_hits), 2);

						N.l_misses = L(N.l_misses);

						N.r_misses = L(N.r_misses);

						N.l_wh = L(N.l_wh);

						N.r_wh = L(N.r_wh);

						N.l_hist = n(N.l_hist);

						N.r_hist = n(N.r_hist);

						N.l_miss_hist = n(N.l_miss_hist);

						N.r_miss_hist = n(N.r_miss_hist);

						N.l_wh_hist = n(N.l_wh_hist);

						N.r_wh_hist = n(N.r_wh_hist);

						N.samples = math.max(L(N.samples), 1);

						N.last_epoch = vK.epoch;

					end;

					function s()

						local s, N = 0, 0;

						for L, L in pairs(JK) do

							for n, n in ipairs(L) do

								if n.hit then

									s = s + 1;

								else

									N = N + 1;

								end;

							end;

						end;

						local L = s + N;

						if L == 0 then

							JK = {};

							KK = 0;

							return 0;

						end;

						local N = s / L;

						local s = 0;

						for L, L in pairs(JK) do

							for n, n in ipairs(L) do

								if (n.side ~= 0) and n.fp and (n.fp ~= "") and n.weapon then

									local L = n.steamid or (n.idx and tK(n.idx));

									if L then

										local Z = xK(L, n.weapon, n.fp);

										local L = R.read(Z) or R.new_entry();

										if L.last_epoch and ((vK.epoch - L.last_epoch) >= PK) then

											C(L);

										end;

										if n.wh then

											R.record_wrong_hitbox(L, n.side, n.angle);

										elseif n.hit then

											R.record_hit(L, n.side, n.angle);

										else

											R.record_miss(L, n.side, n.angle);

										end;

										L.players = (L.players or 0) + 1;

										R.write(Z, L);

									end;

									local C = UK(n.weapon, n.fp);

									local L = R.read(C) or R.new_entry();

									if n.wh then

										R.record_wrong_hitbox(L, n.side, n.angle);

									elseif n.hit then

										R.record_hit(L, n.side, n.angle);

									else

										R.record_miss(L, n.side, n.angle);

									end;

									L.players = (L.players or 0) + 1;

									R.write(C, L);

									s = s + 1;

								end;

							end;

						end;

						if s > 0 then

							vK.commit_rounds = vK.commit_rounds + 1;

							vK.commit_shots = vK.commit_shots + s;

							R.bump_epoch();

							B(string.format('[infinix] committed %d shots (rate %.0f%%) -> DB', s, N * 100));

						end;

						JK = {};

						KK = 0;

						return s;

					end;

					client.set_event_callback('weapon_fire', function(s)

						local C = entity.get_local_player();

						local N = client.userid_to_entindex(s.userid);

						if (not N) or (N == C) then

							return;

						end;

						local s = TK[N];

						if not s then

							return;

						end;

						local C = globals.tickcount();

						if s.dt_last_fire_tick == C then

							s.dt_fires_tick = s.dt_fires_tick + 1;

							if s.dt_fires_tick >= 2 then

								if not s.is_dt_user then

									s.dt_count = s.dt_count + 1;

									QK('DT_DETECT', 'idx=' .. N, "tick=" .. C);

								end;

								s.is_dt_user = true;

								nK(s, 'is_dt_user');

							end;

						else

							s.dt_fires_tick = 1;

						end;

						s.dt_last_fire_tick = C;

						pcall(hA, s, C);

					end);

					client.set_event_callback('player_death', function(s)

						local C = client.userid_to_entindex(s.userid);

						if C then

							IK[C] = globals.realtime() + 0.5;

						end;

					end);

					client.set_event_callback("round_start", function()

						iK.round_t = 0;

						p('round_start', false);

						WK = {};

						D();

					end);

					client.set_event_callback('round_end', function()

						W("round_end");

					end);

					local s = {

						active = false,

						ox = 0,

						oy = 0,

						lmb_last = false,

						live_x = nil,

						live_y = nil

					};

					local function W()

						return infinix_drag_parse_abs(V(_), 14, 190);

					end;

					local function C(N, L)

						infinix_drag_save_abs(_, N, L);

					end;

					local function _()

						if (s.live_x ~= nil) and (s.live_y ~= nil) then

							C(s.live_x, s.live_y);

							return;

						end;

						local N, L = W();

						C(N, L);

					end;

					XK[# XK + 1] = _;

					hK.pre_config_save[# hK.pre_config_save + 1] = _;

					sK.resolver_debug_pos = _;

					hK[# hK + 1] = function()

						if rawget(_G, 'INFINIX_RESOLVER_ON') ~= true then

							return;

						end;

						if rawget(_G, 'INFINIX_RESOLVER_DEBUG_ON') == true then

							local _, N = W();

							if s.active and (s.live_x ~= nil) then

								_, N = s.live_x, s.live_y;

							end;

							local W = "none";

							local L, n = 0, 0;

							local Z, QK = pcall(function()

								return (entity.get_local_player and entity.get_local_player()) or nil;

							end);

							if Z and (type(QK) == 'number') and (QK ~= 0) then

								local Z, lK = pcall(entity.get_player_name, QK);

								if Z and (type(lK) == "string") then

									W = lK;

								end;

								local Z = TK[QK];

								if Z then

									L = Z.desync_l_last or Z.desync or 0;

									n = Z.desync_r_last or Z.desync or 0;

								end;

							end;

							local Z = DK + NK;

							local QK = ((Z > 0) and math.floor((DK / Z) * 100)) or 0;

							local Z = {

								'~resolver debug panel~',

								string.format('hitrate: %d%% | %d/%d', QK, DK, NK),

								string.format("target: %s", W),

								string.format("desync: -%d %d", L, n)

							};

							local W = 0;

							for L, L in ipairs(Z) do

								local n = infinix_dpi_measure_text('b', L) or 0;

								if n > W then

									W = n;

								end;

							end;

							local L = W + 8;

							local W = # Z * 15;

							local n = ui.is_menu_open() == true;

							local QK = (client.key_state and client.key_state(1) and true) or false;

							local lK = false;

							if n then

								local n, qK = ui.mouse_position();

								local PK, oK = infinix_dpi_mouse_position();

								lK = (PK ~= nil) and (oK ~= nil) and (not q(n, qK)) and (PK >= _) and (PK <= (_ + L)) and (oK >= N) and (oK <= (N + W));

								if lK and QK and (not s.lmb_last) then

									s.active = true;

									s.ox = PK - _;

									s.oy = oK - N;

									s.live_x = _;

									s.live_y = N;

								end;

								if s.active then

									INFINIX_DRAG_BLOCK_ATTACK = true;

									G();

									if QK and (PK ~= nil) and (oK ~= nil) then

										local n, qK = infinix_dpi_screen_size();

										n = n or 1920;

										qK = qK or 1080;

										_ = H(PK - s.ox, 2, math.max(2, (n - L) - 2));

										N = H(oK - s.oy, 2, math.max(2, (qK - W) - 2));

										s.live_x = _;

										s.live_y = N;

									else

										if s.live_x ~= nil then

											_, N = s.live_x, s.live_y;

										end;

										s.active = false;

										C(_, N);

										s.live_x, s.live_y = nil, nil;

									end;

								end;

								s.lmb_last = QK;

							else

								s.active = false;

								s.lmb_last = false;

								s.live_x, s.live_y = nil, nil;

							end;

							local C, n = infinix_drag_anim_xy(s, _, N, (s.active and 11) or 16);

							local _ = infinix_drag_phase(s, 'outline_phase', lK or s.active, (s.active and 24) or 14);

							if _ > 0.01 then

								local N, QK = C - 4, n - 3;

								local lK, qK = L + 8, W + 6;

								local W = math.floor((((s.active and 150) or 95) * _) + 0.5);

								infinix_dpi_rounded_outline(N, QK, lK, qK, 3, 255, 255, 255, W);

							end;

							for s, _ in ipairs(Z) do

								local W, N, L = 255, 255, 255;

								if s == 1 then

									W, N, L = 160, 160, 160;

								end;

								infinix_dpi_text(C, n + ((s - 1) * 15), W, N, L, 220, "b", 0, _);

							end;

						end;

					end;

					client.draw_indicator("RESOLVED", 80, 200, 80, function(s)

						if rawget(_G, "INFINIX_RESOLVER_ON") ~= true then

							return false;

						end;

						if rawget(_G, 'INFINIX_RESOLVER_FLAG_ON') ~= true then

							return false;

						end;

						local _ = TK[s];

						if not _ then

							return false;

						end;

						return wK(_, s) >= 80;

					end);

					client.draw_indicator('RESOLVED', 255, 220, 50, function(s)

						if rawget(_G, 'INFINIX_RESOLVER_ON') ~= true then

							return false;

						end;

						if rawget(_G, 'INFINIX_RESOLVER_FLAG_ON') ~= true then

							return false;

						end;

						local _ = TK[s];

						if not _ then

							return false;

						end;

						local W = wK(_, s);

						return (W >= 75) and (W < 80);

					end);

					local function s()

						local _ = yK.count;

						if _ == 0 then

							B("[infinix] session log empty");

							return;

						end;

						local W = {

							'=== infinix resolver session log ===',

							string.format("events: %d  hits: %d  misses: %d", _, DK, NK),

							'',

							"--- detector attribution ---"

						};

						local C = {};

						for N, L in pairs(YK) do

							local n = L.hits + L.misses;

							local Z = ((n > 0) and math.floor((L.hits / n) * 100)) or 0;

							C[# C + 1] = {

								name = N,

								wins = L.wins,

								hits = L.hits,

								misses = L.misses,

								acc = Z

							};

						end;

						table.sort(C, function(N, L)

							return N.wins > L.wins;

						end);

						for N, N in ipairs(C) do

							W[# W + 1] = string.format('  %-10s wins=%-5d h/m=%d/%d acc=%d%%', N.name, N.wins, N.hits, N.misses, N.acc);

						end;

						W[# W + 1] = "";

						W[# W + 1] = '--- events (oldest first) ---';

						yK.each(function(C)

							W[# W + 1] = yK.line(C);

						end);

						local C = table.concat(W, "\n");

						local W = ((cK.BACKEND == 'database') and "infinix_resolver_log.txt") or cK.PATH_ACTIVE:gsub('%.json$', "_log.txt");

						local N = pcall(writefile, W, C);

						if N then

							B("[infinix] session log -> csgo/" .. rK(W) .. ' (' .. _ .. " events)");

						else

							pcall(writefile, 'infinix_resolver_log.txt', C);

							B('[infinix] session log -> csgo/infinix_resolver_log.txt');

						end;

					end;

					function sK.resolver()

						p('shutdown', true);

						pcall(s);

						A.reset();

						rawset(_G, 'INFINIX_RESOLVER_SHOT_CONTEXT', nil);

						D();

						c(mK.fbyw, true);

						c(mK.fbyv, true);

					end;

					R.load();

					if not cK.FOUND then

						R.save_all();

					end;

					FK();

					dK();

					iK.last_t = globals.realtime();

					do

						local s, _ = 0, 0;

						for W in pairs(GK) do

							if W:sub(1, 2) == "p_" then

								s = s + 1;

							else

								_ = _ + 1;

							end;

						end;

						B(string.format("[infinix v3] resolver loaded - cluster:%d personal:%d (epoch %d) path:%s", _, s, vK.epoch, eK()));

					end;

					INFINIX = INFINIX or {};

					INFINIX.resolver_v2 = {

						version = "2.0.0",

						get_state = function(s)

							return TK[s];

						end,

						db_clear = function()

							R.clear();

						end,

						db_stats = function()

							local s = R.stats();

							s.cluster_entries = s.cluster;

							return s;

						end

					};

				end);

				if not E then

					pcall(client.color_log, 255, 90, 90, "[infinix] resolver disabled: " .. tostring(a));

				else

				end;

			end)();

			(function()

				local E = aK.misc._flat;

				local a, s = pcall(require, 'ffi');

				local _, B = pcall(require, "gamesense/http");

				if (not a) or (not _) then

					M(255, 200, 80, '[revealer] ffi or http unavailable; skipping');

					return;

				end;

				local a = Q(ui.new_checkbox, 'AA', "Anti-aimbot angles", 'cheat revealer' .. b(''));

				local _ = Q(ui.new_multiselect, "AA", 'Anti-aimbot angles', '  a?? revealer display' .. b(''), {

					"scoreboard icon",

					"flag"

				});

				local W = Q(ui.new_multiselect, "AA", 'Anti-aimbot angles', "  a?? revealer icon set" .. b(''), {

					"multicolored",

					"unicolored",

					'nado & ryha',

					"alternative nl icon"

				});

				E.cr_en = a;

				E.cr_disp = _;

				E.cr_iset = W;

				local function E(p)

					local C = p == "misc";

					c(a, C);

					if not C then

						c(_, false);

						c(W, false);

						return;

					end;

					local p = V(a) == true;

					c(_, p);

					c(W, p);

				end;

				EK[# EK + 1] = E;

				pcall(function()

					local E = s.cast(s.typeof('void***'), client.create_interface('filesystem_stdio.dll', "VFileSystem017"));

					local p = s.cast('void (__thiscall*)(void*, const char*, const char*)', E[0][20]);

					local C = s.cast("void (__thiscall*)(void*, const char*, const char*)", E[0][22]);

					local D = s.cast('const char* (__thiscall*)(void*, const char*, int*)', E[0][32]);

					local function N(L)

						local n = s.new("int[1]");

						local A = D(E, L, n);

						if A == s.NULL then

							return nil;

						end;

						return n, s.string(A);

					end;

					local function D(L, n)

						C(E, L, n);

					end;

					local function C(L, n)

						p(E, L, n);

					end;

					if not N("materials\\panorama\\images\\icons\\revealer") then

						D("materials\\panorama\\images\\icons\\revealer", 'GAME');

						D('materials\\panorama\\images\\icons\revealer\\multicolored', 'GAME');

						D('materials\\panorama\\images\\icons\\revealer\\unicolored', "GAME");

						D("materials\\panorama\\images\\icons\\revealeradoryha", 'GAME');

					end;

					local E = {

						"https://cdn.jsdelivr.net/gh/cshhanec2/infinix@main/revealer",

						'https://raw.githubusercontent.com/cshhanec2/infinix/main/revealer',

						'https://gitcdn.link/cdn/cshhanec2/infinix/main/revealer'

					};

					local function p(D)

						if (type(D) ~= 'string') or (# D < 100) then

							return false;

						end;

						return D:sub(1, 8) == "\137\z  PN\71\13\n\z  \26\10";

					end;

					local D, N, L = 0, 0, 0;

					local function n(A, R, Z)

						Z = Z or 1;

						local yK = ('csgo/materials/panorama/images/icons/revealer/%s/%s.png'):format(A, R);

						local QK = E[Z];

						if QK == nil then

							L = L + 1;

							return;

						end;

						local E = ('%s/%s/%s.png'):format(QK, A, R);

						if Z == 1 then

							D = D + 1;

						end;

						B.get(E, function(E, B)

							if E and B and p(B.body) then

								if writefile then

									local E = pcall(writefile, yK, B.body);

									if E then

										N = N + 1;

									else

										L = L + 1;

									end;

								end;

							else

								n(A, R, Z + 1);

							end;

						end);

					end;

					local E = {

						multicolored = {

							'nl1',

							"nl2",

							"gs",

							"ft",

							'nw',

							'ev',

							"ot",

							'pd',

							'pl',

							'r7',

							'af',

							'wh'

						},

						unicolored = {

							"nl1",

							'nl2',

							'gs',

							'ft',

							"nw",

							"ev",

							"ot",

							"pd",

							'pl',

							'r7',

							"af",

							"wh"

						},

						nadoryha = {

							'nl',

							'gs',

							"ft",

							"nw",

							"ev",

							'ot',

							'pd',

							'pl',

							"r7",

							'af',

							'wh'

						}

					};

					for B, A in pairs(E) do

						for E, E in ipairs(A) do

							local A = 'csgo/materials/panorama/images/icons/revealer/' .. B .. "/" .. E .. '.png';

							local R = 'csgo/materials/panorama/images/icons/achievements/' .. B .. "_" .. E .. ".png";

							local Z = readfile and readfile(R);

							local R = readfile and readfile(A);

							local yK = p(R);

							if (not Z) and (not yK) then

								n(B, E);

							elseif Z then

								if writefile then

									pcall(writefile, A, Z);

								end;

								pcall(C, ("materials\\panorama\\images\\icons\\achievements\\%s_%s.png"):format(B, E), '');

							end;

						end;

					end;

					if D > 0 then

						client.delay_call(3, function()

							M(120, 200, 255, ('[revealer] downloaded %d/%d icons (%d failed)'):format(N, D, L));

						end);

					end;

				end);

				local E;


			do
				local B, p = pcall(function()
					return panorama.loadstring([[
                let entity_panels = {}
                let entity_data = {}
                let event_callbacks = {}
                let SLOT_LAYOUT = `
                    <root>
                        <Panel style="min-width: 3px; padding-top: 2px; padding-left: 0px;" scaling='stretch-to-fit-y-preserve-aspect'>
                            <Image id="smaller" textureheight="15" style="horizontal-align: center; opacity: 0.01; transition: opacity 0.1s ease-in-out 0.0s, img-shadow 0.12s ease-in-out 0.0s; overflow: noclip; padding: 3px 5px; margin: -3px -5px;" />
                            <Image id="small" textureheight="17" style="horizontal-align: center; opacity: 0.01; transition: opacity 0.1s ease-in-out 0.0s, img-shadow 0.12s ease-in-out 0.0s; overflow: noclip; padding: 3px 5px; margin: -3px -5px;" />
                            <Image id="image" textureheight="21" style="opacity: 0.01; transition: opacity 0.1s ease-in-out 0.0s, img-shadow 0.12s ease-in-out 0.0s; padding: 3px 5px; margin: -3px -5px; margin-top: -5px;" />
                        </Panel>
                    </root>
                `

                let _DestroyEntityPanel = function (key) {
                    let panel = entity_panels[key]
                    if(panel != null && panel.IsValid()) {
                        var parent = panel.GetParent()
                        let musor = parent.GetChild(0)
                        musor.visible = true
                        if(parent.FindChildTraverse("id-sb-skillgroup-image") != null) {
                            parent.FindChildTraverse("id-sb-skillgroup-image").style.margin = "0px 0px 0px 0px"
                        }
                        panel.DeleteAsync(0.0)
                    }
                    delete entity_panels[key]
                }
                let _DestroyEntityPanels = function() { for(key in entity_panels){ _DestroyEntityPanel(key) } }
                let _GetOrCreateCustomPanel = function(xuid) {
                    if(entity_panels[xuid] == null || !entity_panels[xuid].IsValid()){
                        entity_panels[xuid] = null
                        let scoreboard_context_panel = $.GetContextPanel().FindChildTraverse("ScoreboardContainer").FindChildTraverse("Scoreboard") || $.GetContextPanel().FindChildTraverse("id-eom-scoreboard-container").FindChildTraverse("Scoreboard")
                        if(scoreboard_context_panel == null){ _Clear(); _DestroyEntityPanels(); return }
                        scoreboard_context_panel.FindChildrenWithClassTraverse("sb-row").forEach(function(el){
                            let scoreboard_el
                            if(el.m_xuid == xuid) {
                                el.Children().forEach(function(child_frame){
                                    let stat = child_frame.GetAttributeString("data-stat", "")
                                    if(stat == "rank") scoreboard_el = child_frame.GetChild(0)
                                })
                                if(scoreboard_el) {
                                    let scoreboard_el_parent = scoreboard_el.GetParent()
                                    let custom_icons = $.CreatePanel("Panel", scoreboard_el_parent, "revealer-icon", {})
                                    if(scoreboard_el_parent.FindChildTraverse("id-sb-skillgroup-image") != null) {
                                        scoreboard_el_parent.FindChildTraverse("id-sb-skillgroup-image").style.margin = "0px 0px 0px 0px"
                                    }
                                    scoreboard_el_parent.MoveChildAfter(custom_icons, scoreboard_el_parent.GetChild(1))
                                    let prev_panel = scoreboard_el_parent.GetChild(0)
                                    prev_panel.visible = false
                                    let panel_slot_parent = $.CreatePanel("Panel", custom_icons, `icon`)
                                    panel_slot_parent.visible = false
                                    panel_slot_parent.BLoadLayoutFromString(SLOT_LAYOUT, false, false)
                                    entity_panels[xuid] = custom_icons
                                    return custom_icons
                                }
                            }
                        })
                    }
                    return entity_panels[xuid]
                }
                let _UpdatePlayer = function(entindex, path_to_image) {
                    if(entindex == null || entindex == 0) return
                    entity_data[entindex] = { applied: false, image_path: path_to_image }
                }
                let _ApplyPlayer = function(entindex) {
                    let xuid = GameStateAPI.GetPlayerXuidStringFromEntIndex(entindex)
                    let panel = _GetOrCreateCustomPanel(xuid)
                    if(panel == null) return
                    let panel_slot_parent = panel.FindChild(`icon`)
                    panel_slot_parent.visible = true
                    let panel_slot = panel_slot_parent.FindChild("image")
                    panel_slot.visible = true
                    panel_slot.style.opacity = "1"
                    panel_slot.SetImage(entity_data[entindex].image_path)
                    return true
                }
                let _ApplyData = function() {
                    for(entindex in entity_data) {
                        entindex = parseInt(entindex)
                        let xuid = GameStateAPI.GetPlayerXuidStringFromEntIndex(entindex)
                        if(!entity_data[entindex].applied || entity_panels[xuid] == null || !entity_panels[xuid].IsValid()) {
                            if(_ApplyPlayer(entindex)) { entity_data[entindex].applied = true }
                        }
                    }
                }
                let _Create = function() {
                    event_callbacks["OnOpenScoreboard"] = $.RegisterForUnhandledEvent("OnOpenScoreboard", _ApplyData)
                    event_callbacks["Scoreboard_UpdateEverything"] = $.RegisterForUnhandledEvent("Scoreboard_UpdateEverything", function(){ _ApplyData() })
                    event_callbacks["Scoreboard_UpdateJob"] = $.RegisterForUnhandledEvent("Scoreboard_UpdateJob", _ApplyData)
                }

                let _Clear = function() { entity_data = {} }

                let _Destroy = function() {
                    _Clear()
                    _DestroyEntityPanels()
                    for(event in event_callbacks){
                        $.UnregisterForUnhandledEvent(event, event_callbacks[event])
                        delete event_callbacks[event]
                    }
                }

                return { create: _Create, destroy: _Destroy, clear: _Clear, update: _UpdatePlayer, destroy_panel: _DestroyEntityPanels }
                ]], 'CSGOHud')();
				end);

				if B and p then
					E = p;
				else
					E = {
						create = function() end,
						destroy = function() end,
						clear = function() end,
						update = function() end,
						destroy_panel = function() end
					};
				end;
			end;
				pcall(E.create);
				local B = s.typeof([[
                struct {
                    char     pad_0000[8];
                    int32_t  client;

                    int32_t  audible_mask;
                    uint32_t xuid_low;

                    uint32_t xuid_high;

                    void*    voice_data;
                    bool     proximity;

                    bool     caster;

                    char     pad_001E[2];

                    int32_t  format;
                    int32_t  sequence_bytes;
                    uint32_t section_number;
                    uint32_t uncompressed_sample_offset;

                    char     pad_0030[4];

                    uint32_t has_bits;

                } *
            ]]);
				local p = s.typeof("uint16_t*");
				local C = s.typeof('uintptr_t');
				local D = {
					gs = {
						long = 'gamesense',
						short = 'GS'
					},
					nl = {
						long = 'neverlose',
						short = "NL"
					},
					nw = {
						long = "nixware",
						short = "NW"
					},
					pd = {
						long = 'pandora',
						short = "PD"
					},
					pr = {
						long = 'primordial',
						short = "PR"
					},
					ot = {
						long = "onetap",
						short = "OT"
					},
					ft = {
						long = "fatality",
						short = 'FT'
					},
					pl = {
						long = "plaguecheat",
						short = "PLG"
					},
					ev = {
						long = "ev0lve",
						short = "EV0"
					},
					r7 = {
						long = 'rifk7',
						short = "R7"
					},
					af = {
						long = 'airflow',
						short = "AF"
					},
					wh = {
						long = "unknown",
						short = "WH"
					}
				};
				local N = {};
				local L = "nl1";
				local n = "file://{images}/icons/revealer/multicolored/%s.png";
				local A, R, Z = true, false, false;
				local function yK(QK, lK)
					local qK = {};
					for cK = 1, # QK do
						local PK = QK[cK];
						if not qK[PK] then
							qK[PK] = true;
							for qK = cK + 4, # QK do
								if (cK % lK) == 0 then
									if QK[qK] == PK then
										return true;
									end;
								elseif QK[qK] == PK then
									return false;
								end;
							end;
						end;
					end;
					return false;
				end;
				local QK = {
					nl = {
						sig_count = {},
						found = {}
					},
					nw = {},
					pd = {},
					ot = {},
					ft = {},
					pl = {},
					ev = {},
					r7 = {},
					af = {},
					gs = {}
				};
				local lK = {};
				function lK.nl(qK, cK)
					if qK.xuid_high == 0 then
						return;
					end;
					local PK = ("%.02X"):format(s.cast(p, s.cast(C, qK) + 22)[0]);
					if PK == QK.current_signature then
						QK.nl.sig_count[cK] = (QK.nl.sig_count[cK] or 0) + 1;
						if QK.nl.sig_count[cK] > 24 then
							QK.nl.found[cK] = 1;
							return true;
						else
							QK.nl.sig_count[cK] = nil;
						end;
					end;
					if # QK.nl.found > 3 then
						return false;
					end;
					if not QK.nl[cK] then
						QK.nl[cK] = {};
					end;
					QK.nl[cK][# QK.nl[cK] + 1] = qK.xuid_high;
					if # QK.nl[cK] > 24 then
						if yK(QK.nl[cK], 4) and (qK.xuid_high ~= 0) then
							QK.current_signature = PK;
							QK.nl[cK] = {};
							return true;
						end;
						table.remove(QK.nl[cK], 1);
					end;
					return false;
				end;
				function lK.nw(yK, qK)
					if not QK.nw[qK] then
						QK.nw[qK] = 0;
					end;
					if QK.nw[qK] > 34 then
						QK.nw[qK] = nil;
						return true;
					elseif yK.xuid_high == 0 then
						QK.nw[qK] = QK.nw[qK] + 1;
					else
						QK.nw[qK] = 0;
					end;
					return false;
				end;
				function lK.pd(yK, qK)
					if not QK.pd[qK] then
						QK.pd[qK] = 0;
					end;
					local cK = s.cast(p, s.cast(C, yK) + 16)[0];
					if QK.pd[qK] > 24 then
						return true;
					elseif (cK == 26971) or (cK == 6969) then
						QK.pd[qK] = QK.pd[qK] + 1;
					else
						QK.pd[qK] = 0;
					end;
					return false;
				end;
				function lK.ot(yK, qK)
					if not QK.ot[qK] then
						QK.ot[qK] = {};
					end;
					QK.ot[qK][# QK.ot[qK] + 1] = {
						sequence_bytes = yK.sequence_bytes,
						xuid_low = yK.xuid_low,
						section_number = yK.section_number,
						uncompressed_sample_offset = yK.uncompressed_sample_offset
					};
					if # QK.ot[qK] > 16 then
						local yK = QK.ot[qK][1];
						for cK = 2, # QK.ot[qK] do
							local PK = QK.ot[qK][cK];
							if (PK.xuid_low ~= yK.xuid_low) or (PK.section_number ~= yK.section_number) or (PK.uncompressed_sample_offset ~= yK.uncompressed_sample_offset) then
								table.remove(QK.ot[qK], 1);
								return false;
							end;
						end;
						table.remove(QK.ot[qK], 1);
						return true;
					end;
					return false;
				end;
				function lK.ft(yK, qK)
					if not QK.ft[qK] then
						QK.ft[qK] = 0;
					end;
					local cK = s.cast(p, s.cast(C, yK) + 16)[0];
					if QK.ft[qK] > 36 then
						return true;
					elseif (cK == 32762) or (cK == 32763) then
						QK.ft[qK] = QK.ft[qK] + 1;
					end;
					return false;
				end;
				function lK.pl(yK, qK)
					if not QK.pl[qK] then
						QK.pl[qK] = 0;
					end;
					if QK.pl[qK] > 24 then
						return true;
					elseif s.cast(p, s.cast(C, yK) + 44)[0] == 29301 then
						QK.pl[qK] = QK.pl[qK] + 1;
					else
						QK.pl[qK] = 0;
					end;
					return false;
				end;
				function lK.ev(yK, qK)
					if not QK.ev[qK] then
						QK.ev[qK] = {};
					end;
					QK.ev[qK][# QK.ev[qK] + 1] = yK.xuid_high;
					if # QK.ev[qK] > 44 then
						for yK = 1, # QK.ev[qK] - 4 do
							local cK = QK.ev[qK][yK];
							if ((QK.ev[qK][yK + 1] + QK.ev[qK][yK + 2]) == (QK.ev[qK][yK] * 2)) and (QK.ev[qK][yK + 4] == (cK + 1)) then
								QK.ev[qK] = {};
								return true;
							end;
						end;
						table.remove(QK.ev[qK], 1);
					end;
					return false;
				end;
				function lK.r7(yK, qK)
					if not QK.r7[qK] then
						QK.r7[qK] = 0;
					end;
					local cK = ("%.02X"):format(s.cast(p, s.cast(C, yK) + 16)[0]);
					if QK.r7[qK] > 24 then
						return true;
					elseif (cK == "234") or (cK == '134') then
						QK.r7[qK] = QK.r7[qK] + 1;
					else
						QK.r7[qK] = 0;
					end;
					return false;
				end;
				function lK.af(yK, qK)
					if not QK.af[qK] then
						QK.af[qK] = 0;
					end;
					if QK.af[qK] > 24 then
						return true;
					elseif s.cast(p, s.cast(C, yK) + 16)[0] == 45041 then
						QK.af[qK] = QK.af[qK] + 1;
					else
						QK.af[qK] = 0;
					end;
					return false;
				end;
				function lK.gs(yK, qK)
					local cK = ("%.02X"):format(s.cast(p, s.cast(C, yK) + 22)[0]);
					local p = string.sub(yK.sequence_bytes, 1, 4);
					if not QK.gs[qK] then
						QK.gs[qK] = {
							repeated = 0,
							packet = cK,
							bytes = p
						};
					end;
					if (p ~= QK.gs[qK].bytes) and (cK ~= QK.gs[qK].packet) then
						QK.gs[qK].packet = cK;
						QK.gs[qK].bytes = p;
						QK.gs[qK].repeated = QK.gs[qK].repeated + 1;
					else
						QK.gs[qK].repeated = 0;
					end;
					if QK.gs[qK].repeated >= 36 then
						QK.gs[qK] = {
							repeated = 0,
							packet = cK,
							bytes = p
						};
						return true;
					end;
					return false;
				end;
				local function p(C, yK)
					if type(C) ~= "table" then
						return false;
					end;
					for qK, qK in ipairs(C) do
						if qK == yK then
							return true;
						end;
					end;
					return false;
				end;
				local function C(yK, qK)
					if type(yK) ~= 'table' then
						return yK;
					end;
					for cK = # yK, 1, - 1.0 do
						if yK[cK] == qK then
							table.remove(yK, cK);
						end;
					end;
					return yK;
				end;
				local function yK(qK, cK)
					if type(qK) ~= "table" then
						return qK;
					end;
					for PK, PK in ipairs(qK) do
						if PK == cK then
							return qK;
						end;
					end;
					qK[# qK + 1] = cK;
					return qK;
				end;
				local qK = false;
				local function cK()
					if qK then
						return;
					end;
					local PK, oK = pcall(ui.get, W);
					if (not PK) or (type(oK) ~= 'table') then
						return;
					end;
					local PK = false;
					if p(oK, "unicolored") and (A or Z) then
						C(oK, 'multicolored');
						C(oK, 'nado & ryha');
						PK = true;
					elseif p(oK, "multicolored") and (R or Z) then
						C(oK, 'unicolored');
						C(oK, "nado & ryha");
						PK = true;
					elseif p(oK, "nado & ryha") and (A or R) then
						C(oK, "unicolored");
						C(oK, "multicolored");
						C(oK, 'alternative nl icon');
						PK = true;
					elseif p(oK, "alternative nl icon") and Z then
						C(oK, "alternative nl icon");
						PK = true;
					else
						local C = (A and "multicolored") or (R and 'unicolored') or (Z and "nado & ryha") or 'multicolored';
						if not p(oK, C) then
							yK(oK, C);
							PK = true;
						end;
					end;
					if PK then
						qK = true;
						pcall(ui.set, W, oK);
						qK = false;
					end;
					Z = p(oK, "nado & ryha");
					R = p(oK, "unicolored");
					A = p(oK, 'multicolored');
					local C = p(oK, 'alternative nl icon');
					L = ((not Z) and ((C and 'nl2') or "nl1")) or "nl";
					local p = (A and 'multicolored') or (R and 'unicolored') or (Z and "nadoryha") or "multicolored";
					n = "file://{images}/icons/revealer/" .. p .. "/%s.png";
					for p, p in pairs(N) do
						p.icon_set = false;
					end;
				end;
				o(W, cK);
				pcall(ui.set, W, {
					"multicolored"
				});
				cK();
				local p = false;
				local function C()
					local yK = V(a) == true;
					rawset(_G, 'INFINIX_CR_ON', yK);
					rawset(_G, 'INFINIX_CR_SB_ON', yK and g(_, "scoreboard icon"));
					rawset(_G, 'INFINIX_CR_FLAG_ON', yK and g(_, 'flag'));
					pcall(i);
				end;
				C();
				local function yK()
					local qK = rawget(_G, "INFINIX_CR_SB_ON") == true;
					if qK and (not p) then
						pcall(E.create);
						p = true;
					elseif (not qK) and p then
						for qK, qK in pairs(N) do
							qK.icon_set = false;
						end;
						pcall(E.destroy);
						p = false;
					end;
				end;
				o(_, function()
					C();
					yK();
				end);
				o(a, function()
					C();
					yK();
				end);
				client.draw_indicator('', 220, 220, 220, function(p)
					if rawget(_G, "INFINIX_CR_FLAG_ON") ~= true then
						return false;
					end;
					if (not N[p]) or (not N[p].cheat) then
						return false;
					end;
					local C = N[p].cheat or 'wh';
					if C == 'wh' then
						return false;
					end;
					local yK;
					if entity.is_dormant and entity.is_dormant(p) then
						yK = C:upper();
					else
						yK = ((D[C] and D[C].short) or C):upper();
					end;
					return true, yK;
				end);
				local function p()
					local C = {};
					local yK = entity.get_player_resource();
					if yK == nil then
						return C;
					end;
					for qK = 1, globals.maxplayers() do
						if entity.get_prop(yK, 'm_bConnected', qK) == 0 then
							if N[qK] then
								N[qK] = nil;
							end;
							break;
						else
							local yK = entity.get_prop(qK, 'm_fFlags');
							if not yK then
								break;
							end;
							if bit.band(yK, 512) == 512 then
								break;
							end;
						end;
						C[# C + 1] = qK;
					end;
					return C;
				end;
				hK[# hK + 1] = function()
					if rawget(_G, 'INFINIX_CR_SB_ON') ~= true then
						return;
					end;
					if not (A or R or Z) then
						return;
					end;
					for C, C in ipairs(p()) do
						local p = N[C];
						if p then
							if not p.icon_set then
								local A = p.cheat;
								local R = (A and (((A == "nl") and L) or A)) or ((C == entity.get_local_player()) and "gs") or 'wh';
								pcall(E.update, C, n:format(R));
								p.icon_set = true;
							end;
						else
							N[C] = {};
						end;
					end;
				end;
				client.set_event_callback("voice", function(p)
					if (p == nil) or (p.data == nil) then
						return;
					end;
					local C, L = pcall(s.cast, B, p.data);
					if (not C) or (L == nil) then
						return;
					end;
					local B = (s.cast('char*', L) + 8)[0] + 1;
					if not N[B] then
						N[B] = {};
					end;
					local s = N[B];
					for p, C in pairs(lK) do
						do
							local n = s.cheat;
							if n == p then
								break;
							end;
							if (p == "nl") and ((n == 'ev') or (n == "gs") or (n == 'pl') or (n == "pd") or (n == 'r7') or (n == 'af') or (n == "ft")) then
								break;
							end;
							if (p == "nw") and (n == "nl") then
								break;
							end;
							if (p == "ev") and ((n == "pd") or (n == 'nl') or (n == 'ft')) then
								break;
							end;
							if (p == 'gs') and ((n == "ev") or (n == "ot") or (n == "pl") or (n == "pd") or (n == 'r7') or (n == 'ft')) then
								break;
							end;
							if (p == "ot") and ((n == "nw") or (n == 'ft') or (n == "pd") or (n == "pl")) then
								break;
							end;
							if (p == "ft") and ((n == "nw") or (n == "pd")) then
								break;
							end;
							if C(L, B) then
								s.cheat = p;
								s.icon_set = false;
								if events.emit then
									pcall(events.emit, "cheat_detected", {
										player = B,
										cheat_id = p,
										cheat_long = ((D[p] and D[p].long) or 'unknown')
									});
								end;
							end;
						end;
					end;
				end);
				client.set_event_callback("player_connect_full", function(s)
					local B = client.userid_to_entindex(s.userid);
					if B == entity.get_local_player() then
						N = {};
						pcall(E.clear);
						pcall(E.destroy);
						client.delay_call(0.5, function()
							pcall(E.create);
						end);
					end;
				end);
				client.set_event_callback('game_start', function()
					for s, s in pairs(N) do
						s.icon_set = false;
					end;
				end);
				function sK.revealer()
					pcall(E.clear);
					pcall(E.destroy);
				end;
				package.preload['gamesense/cheat_revealer'] = function()
					return {
						get_cheat = function(E)
							local s = (N[E] and N[E].cheat) or 'wh';
							return {
								cheat_id = s,
								cheat_long = ((D[s] and D[s].long) or "unknown")
							};
						end,
						has_data = function(E)
							return N[E] ~= nil;
						end,
						clear_data = function(E)
							if N[E] == nil then
								return false;
							end;
							N[E] = nil;
							for s, s in pairs(QK) do
								if type(s) == 'table' then
									s[E] = nil;
								end;
							end;
							return true;
						end
					};
				end;
				pK("revealer", "cr_en", a);
				pK('revealer', 'cr_disp', _);
				pK("revealer", 'cr_iset', W);
			end)();
			(function()
				local E = aK.visuals._flat;
				local a = Q(ui.new_checkbox, "AA", "Anti-aimbot angles", "menu accent" .. b(''));
				local s = Q(ui.new_color_picker, "AA", 'Anti-aimbot angles', "accent color" .. b(''), 155, 213, 60, 255);
				local _ = F('AA', 'Anti-aimbot angles');
				local B = l("Misc", 'Settings', "DPI scale") or l('MISC', "Settings", "DPI scale");
				e = a;
				J = s;
				o(a, function()
					VK();
					i();
				end);
				o(s, VK);
				VK();
				infinix_dpi_bind(B);
				rawset(_G, 'INFINIX_DPI_SCALING', true);
				infinix_dpi_refresh();
				E.ac_en = a;
				E.ac_color = s;
				E.ac_line = _;
				local B = nil;
				local W = 0;
				pcall(function()
					if cvar.r_aspectratio then
						B = cvar.r_aspectratio;
						W = B:get_float();
					end;
				end);
				local p = Q(ui.new_checkbox, 'AA', 'Anti-aimbot angles', 'aspect ratio' .. b(""));
				local C = Q(ui.new_slider, 'AA', "Anti-aimbot angles", 'ar value' .. b(''), 50, 250, 178, true, "%");
				local D = Q(ui.new_label, 'AA', 'Anti-aimbot angles', 'ar ratio' .. b(''));
				E.ar_en = p;
				E.ar_sl = C;
				E.ar_label = D;
				local N = {
					{
						max = 107,
						name = '4:3'
					},
					{
						max = 119,
						name = '5:4'
					},
					{
						max = 149,
						name = '4:3 wide'
					},
					{
						max = 161,
						name = '3:2'
					},
					{
						max = 170,
						name = '16:10'
					},
					{
						max = 179,
						name = "16:9"
					},
					{
						max = 199,
						name = "16:9+"
					},
					{
						max = 213,
						name = '18:9'
					},
					{
						max = 250,
						name = "21:9"
					}
				};
				local function L(n)
					for J, J in ipairs(N) do
						if n <= J.max then
							return J.name;
						end;
					end;
					return "21:9";
				end;
				local function N()
					if B == nil then
						return;
					end;
					local n = V(p) == true;
					local J = ((type(V(C)) == "number") and V(C)) or 178;
					if n then
						pcall(function()
							B:set_float(J * 0.01);
						end);
						if D then
							local n = L(J);
							O(D, "\a9BD53CFF" .. n);
						end;
					else
						pcall(function()
							B:set_float(W);
						end);
						if D then
							O(D, '');
						end;
					end;
				end;
				o(p, function()
					i();
					N();
				end);
				o(C, N);
				N();
				if B ~= nil then
					function sK.visuals_aspect()
						pcall(function()
							B:set_float(W);
						end);
					end;
				end;
				local B = Q(ui.new_checkbox, 'AA', 'Anti-aimbot angles', "third person" .. b(""));
				local W = Q(ui.new_slider, 'AA', 'Anti-aimbot angles', 'distance' .. b(''), 0, 180, 100, true, '');
				E.tp_en = B;
				E.tp_dist = W;
				rawset(_G, "INFINIX_TP_ON", V(B) == true);
				local N = cvar.cam_idealdist;
				local L = (N and tonumber(N:get_string())) or nil;
				local n = cvar.c_mindistance;
				local J = (n and tonumber(n:get_string())) or nil;
				local A = 0;
				local function R()
					if n and (J ~= nil) then
						pcall(function()
							n:set_float(J);
						end);
					end;
					if N then
						pcall(function()
							N:set_float(L or 0);
						end);
					end;
				end;
				_K[# _K + 1] = function()
					if rawget(_G, 'INFINIX_TP_ON') ~= true then
						A = 0;
						return;
					end;
					local L = entity.get_local_player();
					if (not L) or (not entity.is_alive(L)) then
						A = 0;
						return;
					end;
					if n then
						pcall(function()
							n:set_raw_float(0);
						end);
					end;
					local L = ((type(V(W)) == "number") and V(W)) or 100;
					local n = (L - A) / 25;
					if L > A then
						A = A + n;
					else
						A = A - n;
					end;
					if L < A then
						A = L;
					end;
					if L > A then
						A = L;
					end;
					if N then
						pcall(function()
							N:set_raw_float(A);
						end);
					end;
				end;
				o(B, function()
					rawset(_G, 'INFINIX_TP_ON', V(B) == true);
					i();
					if rawget(_G, 'INFINIX_TP_ON') == true then
						pcall(function()
							client.exec('thirdperson');
						end);
					else
						R();
						A = 0;
						pcall(function()
							client.exec('firstperson');
						end);
					end;
				end);
				function sK.tp()
					R();
				end;
				local N = Q(ui.new_checkbox, "AA", 'Anti-aimbot angles', "view model" .. b(''));
				local L = Q(ui.new_slider, 'AA', 'Anti-aimbot angles', 'fov' .. b(""), - 1800.0, 1800, 680, true, nil, 0.1);
				local n = Q(ui.new_slider, "AA", 'Anti-aimbot angles', 'offset x' .. b(''), - 1800.0, 1800, 25, true, nil, 0.1);
				local J = Q(ui.new_slider, "AA", "Anti-aimbot angles", 'offset y' .. b(''), - 1800.0, 1800, 0, true, nil, 0.1);
				local A = Q(ui.new_slider, 'AA', "Anti-aimbot angles", "offset z" .. b(""), - 1800.0, 1800, - 15.0, true, nil, 0.1);
				local R = Q(ui.new_checkbox, "AA", "Anti-aimbot angles", '  a?? opposite knife' .. b(''));
				E.vm_en = N;
				E.vm_fov = L;
				E.vm_x = n;
				E.vm_y = J;
				E.vm_z = A;
				E.vm_opp_knife = R;
				local Z = cvar.viewmodel_fov;
				local yK = cvar.viewmodel_offset_x;
				local QK = cvar.viewmodel_offset_y;
				local lK = cvar.viewmodel_offset_z;
				local qK = cvar.cl_righthand;
				local cK, PK = nil, false;
				local function oK(mK, BK, MK, WK)
					if Z then
						pcall(function()
							Z:set_raw_float(mK * 0.1);
						end);
					end;
					if yK then
						pcall(function()
							yK:set_raw_float(BK * 0.1);
						end);
					end;
					if QK then
						pcall(function()
							QK:set_raw_float(MK * 0.1);
						end);
					end;
					if lK then
						pcall(function()
							lK:set_raw_float(WK * 0.1);
						end);
					end;
				end;
				local function Z()
					if qK == nil then
						return nil;
					end;
					local yK, QK = pcall(function()
						return qK:get_int();
					end);
					if yK and (type(QK) == "number") then
						return ((QK ~= 0) and 1) or 0;
					end;
					return nil;
				end;
				local function yK(QK)
					if (qK == nil) or (QK == nil) then
						return;
					end;
					QK = ((QK ~= 0) and 1) or 0;
					pcall(function()
						if qK.set_raw_int then
							qK:set_raw_int(QK);
						else
							qK:set_int(QK);
						end;
					end);
				end;
				local function QK(lK)
					if lK == nil then
						return false;
					end;
					local qK = entity.get_classname(lK) or '';
					return (qK == 'CKnife') or (qK == "CKnifeGG") or (qK:find("Knife", 1, true) ~= nil);
				end;
				local function lK()
					if PK and (cK ~= nil) then
						yK(cK);
					end;
					PK = false;
				end;
				local function qK()
					if V(R) ~= true then
						lK();
						cK = nil;
						return;
					end;
					local mK = entity.get_local_player();
					if (mK == nil) or (not entity.is_alive(mK)) then
						lK();
						return;
					end;
					local BK = entity.get_player_weapon(mK);
					if QK(BK) then
						if cK == nil then
							cK = Z();
						end;
						if cK == nil then
							return;
						end;
						yK(((cK == 1) and 0) or 1);
						PK = true;
						return;
					end;
					lK();
					local yK = Z();
					if yK ~= nil then
						cK = yK;
					end;
				end;
				local function yK()
					local QK = V(N) == true;
					if QK then
						oK(V(L) or 680, V(n) or 25, V(J) or 0, V(A) or - 15.0);
					else
						oK(680, 25, 0, - 15.0);
					end;
				end;
				o(N, function()
					i();
					yK();
				end);
				o(R, function()
					if V(R) == true then
						cK = Z();
					else
						lK();
						cK = nil;
					end;
					pcall(i);
				end);
				o(L, yK);
				o(n, yK);
				o(J, yK);
				o(A, yK);
				hK.pre_render[# hK.pre_render + 1] = qK;
				yK();
				function sK.vm()
					lK();
					oK(680, 25, 0, - 15.0);
				end;
				local Z = Q(ui.new_checkbox, "AA", "Anti-aimbot angles", 'force second zoom' .. b(''));
				local yK = Q(ui.new_slider, 'AA', "Anti-aimbot angles", 'zoom value' .. b(""), 1, 90, 45, true, "");
				E.fz_en = Z;
				E.fz_val = yK;
				rawset(_G, 'INFINIX_FZ_ON', V(Z) == true);
				function r()
				end;
				do
					local r;
					pcall(function()
						r = ui.reference("Misc", "Miscellaneous", 'Override zoom FOV');
					end);
					local QK = {
						awp = true,
						ssg08 = true,
						g3sg1 = true,
						scar20 = true
					};
					local lK = false;
					local function qK()
						if lK and r then
							pcall(h.unset, r);
						end;
						lK = false;
					end;
					local function cK()
						local PK = ((type(V(yK)) == 'number') and V(yK)) or 45;
						if r then
							pcall(h.set, r, PK);
							lK = true;
						end;
					end;
					local function r()
						if rawget(_G, 'INFINIX_FZ_ON') ~= true then
							qK();
							return;
						end;
						local lK = entity.get_local_player();
						if (not lK) or (not entity.is_alive(lK)) then
							qK();
							return;
						end;
						local PK = entity.get_player_weapon(lK);
						if not PK then
							qK();
							return;
						end;
						local lK = entity.get_classname(PK) or '';
						local oK = lK:gsub('^CWeapon', ''):lower();
						if not QK[oK] then
							qK();
							return;
						end;
						local QK = entity.get_prop(PK, "m_zoomLevel") or 0;
						if QK == 2 then
							cK();
						else
							qK();
						end;
					end;
					_K[# _K + 1] = function()
						if (rawget(_G, 'INFINIX_FZ_ON') == true) and ui.is_menu_open and (ui.is_menu_open() == true) then
							qK();
						end;
					end;
					hK.pre_render[# hK.pre_render + 1] = r;
					o(Z, function()
						rawset(_G, "INFINIX_FZ_ON", V(Z) == true);
						if rawget(_G, 'INFINIX_FZ_ON') ~= true then
							qK();
						end;
						pcall(i);
					end);
					sK.fz = qK;
				end;
				local function r(QK)
					local lK = QK == 'visuals';
					rawset(_G, "INFINIX_DPI_SCALING", true);
					infinix_dpi_refresh();
					c(a, lK);
					c(p, lK);
					c(B, lK);
					c(_, lK);
					c(N, lK);
					c(Z, lK);
					c(R, lK);
					if not lK then
						return;
					end;
					c(s, V(a) == true);
					local _ = V(p) == true;
					c(C, _);
					c(D, _);
					local _ = V(B) == true;
					c(W, _);
					local _ = V(N) == true;
					c(L, _);
					c(n, _);
					c(J, _);
					c(A, _);
					c(R, _);
					c(yK, V(Z) == true);
				end;
				EK[# EK + 1] = r;
				do
					local _, D = pcall(function()
						local r = {};
						local QK = 0;
						local function lK(qK)
							QK = QK + 1;
							return (qK or '') .. string.rep(' ', QK);
						end;
						local function QK(qK, ...)
							local cK = Q(qK, ...);
							if cK ~= nil then
								c(cK, false);
							end;
							return cK;
						end;
						local qK = QK(ui.new_checkbox, "AA", "Anti-aimbot angles", "custom scope" .. lK(""));
						local cK = QK(ui.new_combobox, 'AA', 'Anti-aimbot angles', '  scope style' .. lK(''), "classic", "soft", "rotated");
						local PK = QK(ui.new_multiselect, 'AA', "Anti-aimbot angles", "  scope exclude" .. lK(''), "top", "bottom", 'left', 'right');
						local oK = QK(ui.new_color_picker, "AA", 'Anti-aimbot angles', 'scope color' .. lK(''), 155, 213, 60, 235);
						local mK = QK(ui.new_slider, "AA", "Anti-aimbot angles", "  scope length" .. lK(""), 20, 260, 105, true, "px");
						local BK = QK(ui.new_slider, "AA", "Anti-aimbot angles", '  scope gap' .. lK(''), 0, 90, 10, true, "px");
						local MK = QK(ui.new_slider, 'AA', "Anti-aimbot angles", "  scope fade" .. lK(""), 15, 100, 70, true, '%');
						local WK = QK(ui.new_slider, 'AA', 'Anti-aimbot angles', "  scope speed" .. lK(''), 2, 24, 12, true, '');
						local YK = QK(ui.new_slider, 'AA', "Anti-aimbot angles", "  scope thickness" .. lK(""), 1, 4, 1, true, 'px');
						local CK = QK(ui.new_checkbox, "AA", 'Fake lag', "damage indicator" .. lK(''));
						local DK = QK(ui.new_checkbox, 'AA', 'Fake lag', '  a?? damage only active' .. lK(""));
						local NK = QK(ui.new_combobox, 'AA', "Fake lag", '  damage font' .. lK(''), 'small', "default", "bold");
						local LK = QK(ui.new_color_picker, 'AA', "Fake lag", "damage active color" .. lK(''), 155, 213, 60, 255);
						local GK = QK(ui.new_color_picker, "AA", "Fake lag", 'damage inactive color' .. lK(''), 255, 255, 255, 150);
						local vK = Q(j[119], 'infinix_damage_indicator_pos', '26,-30');
						local rK = QK(ui.new_checkbox, "AA", 'Fake lag', 'velocity warning' .. lK(''));
						local QK = Q(j[119], 'infinix_velocity_warning_pos', "center");
						r.scope_en = qK;
						r.scope_style = cK;
						r.scope_exclude = PK;
						r.scope_color = oK;
						r.scope_length = mK;
						r.scope_gap = BK;
						r.scope_fade = MK;
						r.scope_speed = WK;
						r.scope_thick = YK;
						r.dmg_en = CK;
						r.dmg_only = DK;
						r.dmg_font = NK;
						r.dmg_active = LK;
						r.dmg_inactive = GK;
						r.vel_en = rK;
						local lK = l('Visuals', 'Effects', 'Remove scope overlay');
						if lK == nil then
							lK = l("VISUALS", 'Effects', "Remove scope overlay");
						end;
						local TK = nil;
						local wK = false;
						local function nK()
							local uK = cvar and cvar.cl_crosshair_sniper_width;
							if uK == nil then
								return nil;
							end;
							local eK, JK = pcall(function()
								if uK.get_int then
									return uK:get_int();
								end;
								if uK.get_float then
									return uK:get_float();
								end;
								return nil;
							end);
							if eK and (type(JK) == 'number') then
								return JK;
							end;
							return nil;
						end;
						local function uK(eK)
							local JK = cvar and cvar.cl_crosshair_sniper_width;
							if JK == nil then
								return;
							end;
							pcall(function()
								if JK.set_raw_int then
									JK:set_raw_int(eK);
								end;
							end);
							pcall(function()
								if JK.set_int then
									JK:set_int(eK);
								end;
							end);
						end;
						local function eK(JK)
							if JK then
								if not wK then
									TK = nK();
									wK = TK ~= nil;
								end;
								uK(0);
							elseif wK then
								uK(TK or 1);
								TK = nil;
								wK = false;
							end;
						end;
						local TK = l('Rage', "Aimbot", 'Minimum damage');
						local l = {};
						do
							local nK, uK, JK, KK = pcall(ui.reference, 'Rage', "Aimbot", "Minimum damage override");
							if nK then
								if uK ~= nil then
									l[# l + 1] = uK;
								end;
								if JK ~= nil then
									l[# l + 1] = JK;
								end;
								if KK ~= nil then
									l[# l + 1] = KK;
								end;
							end;
						end;
						local nK = 0;
						local uK = {
							active = false,
							ox = 0,
							oy = 0,
							lmb_last = false,
							live_x = nil,
							live_y = nil
						};
						local JK = {
							active = false,
							ox = 0,
							oy = 0,
							lmb_last = false,
							live_x = nil,
							live_y = nil
						};
						local KK = {
							active_until = 0,
							hit_time = 0,
							display = 100,
							alpha = 0
						};
						local fK = 0;
						local function iK()
							local UK = (globals.absoluteframetime and globals.absoluteframetime()) or (globals.frametime and globals.frametime()) or 0.0083333333333333;
							if UK < 0 then
								UK = 0;
							end;
							if UK > 0.1 then
								UK = 0.1;
							end;
							return UK;
						end;
						local function UK(xK, tK, AK)
							return infinix_drag_parse_abs(xK, tK, AK);
						end;
						local function xK(tK, AK, SK)
							infinix_drag_save_abs(tK, AK, SK);
						end;
						local function tK(AK, SK, dK)
							return infinix_drag_parse_center(AK, SK, dK);
						end;
						local function AK(SK, dK, RK)
							infinix_drag_save_center(SK, dK, RK);
						end;
						local function SK(dK, RK)
							local kK, IK = infinix_dpi_screen_size();
							kK = kK or 1920;
							IK = IK or 1080;
							return math.floor(((kK * 0.5) - ((dK or 120) * 0.5)) + 0.5), math.floor(((IK * 0.25) - ((RK or 10) * 0.5)) + 0.5);
						end;
						local function dK(RK, kK, IK, FK, ZK)
							local yA, jA, QA, bA, lA = pcall(ui.get, RK);
							if yA and (type(jA) == 'number') then
								return jA, QA, bA, lA or ZK;
							end;
							return kK, IK, FK, ZK;
						end;
						local function RK()
							return (e ~= nil) and (V(e) == true);
						end;
						local function e(kK, IK, FK)
							local ZK = 1 - math.exp(- iK() * FK);
							local FK = kK + ((IK - kK) * ZK);
							if math.abs(IK - FK) < 0.002 then
								FK = IK;
							end;
							return FK;
						end;
						local function kK()
							if (rawget(_G, "INFINIX_SCOPE_OVERLAY_OWNED") ~= true) and (not wK) then
								return;
							end;
							if lK ~= nil then
								pcall(h.unset, lK);
							end;
							eK(false);
							rawset(_G, "INFINIX_SCOPE_OVERLAY_OWNED", false);
						end;
						local function IK(FK)
							if rawget(_G, "INFINIX_SCOPE_ON") ~= true then
								kK();
								return;
							end;
							rawset(_G, "INFINIX_SCOPE_OVERLAY_OWNED", true);
							if lK ~= nil then
								pcall(h.set, lK, (FK and true) or false);
							end;
							eK(true);
						end;
						local function FK()
							if (rawget(_G, 'INFINIX_SCOPE_ON') ~= true) and (rawget(_G, "INFINIX_SCOPE_OVERLAY_OWNED") ~= true) and (not wK) then
								return;
							end;
							IK(false);
						end;
						local function ZK()
							IK(true);
						end;
						local function IK()
							if rawget(_G, 'INFINIX_SCOPE_ON') ~= true then
								kK();
							end;
						end;
						local function yA(jA, QA, bA, lA, VA, qA, OA, EA, aA, sA, zA)
							if type(renderer.line) ~= "function" then
								return;
							end;
							zA = math.max(0.01, math.min(1, tonumber(zA) or 1));
							local hA, _A = bA - jA, lA - QA;
							local bA = math.sqrt((hA * hA) + (_A * _A));
							local lA = math.max(1, math.floor(bA));
							local cA, PA = 0, 0;
							if bA > 0 then
								cA, PA = - _A / bA, hA / bA;
							end;
							for bA = 0, math.max(0, sA - 1) do
								local oA = bA - ((sA - 1) * 0.5);
								for bA = 0, lA - 1 do
									local sA = bA / lA;
									local mA = (bA + 1) / lA;
									local bA = sA;
									if zA < 0.999 then
										local lA = math.max(0, 1 - zA);
										bA = ((sA <= lA) and 0) or math.min(1, (sA - lA) / zA);
									end;
									local lA = EA + ((aA - EA) * bA);
									infinix_dpi_line(math.floor(jA + (hA * sA) + (cA * oA) + 0.5), math.floor(QA + (_A * sA) + (PA * oA) + 0.5), math.floor(jA + (hA * mA) + (cA * oA) + 0.5), math.floor(QA + (_A * mA) + (PA * oA) + 0.5), VA, qA, OA, lA);
								end;
							end;
						end;
						local function jA()
							local QA = rawget(_G, "INFINIX_SCOPE_ON") == true;
							if (not QA) and (nK <= 0.005) and (rawget(_G, 'INFINIX_SCOPE_OVERLAY_OWNED') ~= true) and (not wK) then
								return;
							end;
							if QA then
								ZK();
							else
								kK();
							end;
							local wK = entity.get_local_player();
							local kK = (wK ~= nil) and entity.is_alive(wK) and (entity.get_prop(wK, 'm_bIsScoped') == 1);
							local wK = (QA and kK and 1) or 0;
							nK = e(nK, wK, tonumber(V(WK)) or 12);
							if nK <= 0.005 then
								return;
							end;
							local wK, kK = infinix_dpi_screen_size();
							if (not wK) or (not kK) then
								return;
							end;
							local QA, bA = math.floor(wK * 0.5), math.floor(kK * 0.5);
							local wK = math.max(1, tonumber(V(mK)) or 230);
							local kK = math.max(0, tonumber(V(BK)) or 8);
							local lA = math.max(0.1, math.min(1, (tonumber(V(MK)) or 70) * 0.01));
							local VA = math.max(1, math.floor(tonumber(V(YK)) or 1));
							local qA = math.max(1, wK - kK);
							local OA, EA, aA, sA = dK(oK, 155, 213, 60, 235);
							local zA = math.floor((sA * nK) + 0.5);
							local nK = tostring(V(cK) or "classic");
							if nK == "rotated" then
								local sA = 1 / math.sqrt(2);
								local hA = {
									{
										- 1.0,
										- 1.0,
										"left",
										'top'
									},
									{
										1,
										- 1.0,
										'right',
										'top'
									},
									{
										- 1.0,
										1,
										"left",
										'bottom'
									},
									{
										1,
										1,
										'right',
										'bottom'
									}
								};
								for _A, _A in ipairs(hA) do
									if (not g(PK, _A[3])) and (not g(PK, _A[4])) then
										local hA, cA = _A[1] * sA, _A[2] * sA;
										yA(QA + (hA * kK), bA + (cA * kK), QA + (hA * wK), bA + (cA * wK), OA, EA, aA, zA, 0, VA, lA);
									end;
								end;
								return;
							end;
							if type(renderer.gradient) ~= 'function' then
								return;
							end;
							local wK = math.max(1, math.min(qA, math.floor((qA * lA) + 0.5)));
							local yA = math.max(0, qA - wK);
							local function lA(qA, sA, hA, _A, cA, PA, oA)
								infinix_dpi_gradient(qA, sA, hA, _A, OA, EA, aA, cA, OA, EA, aA, PA, oA);
							end;
							if not g(PK, 'top') then
								if (nK == "soft") or (nK == "classic") then
									if yA > 0 then
										lA(QA, (bA - kK) - yA, VA, yA, zA, zA, false);
									end;
									lA(QA, ((bA - kK) - yA) - wK, VA, wK, 0, zA, false);
								else
									lA(QA, (bA - kK) - yA, VA, yA, zA, zA, false);
									lA(QA, ((bA - kK) - yA) - wK, VA, wK, 0, zA, false);
								end;
							end;
							if not g(PK, "bottom") then
								if (nK == 'soft') or (nK == "classic") then
									if yA > 0 then
										lA(QA, bA + kK, VA, yA, zA, zA, false);
									end;
									lA(QA, bA + kK + yA, VA, wK, zA, 0, false);
								else
									lA(QA, bA + kK, VA, yA, zA, zA, false);
									lA(QA, bA + kK + yA, VA, wK, zA, 0, false);
								end;
							end;
							if not g(PK, "left") then
								if (nK == "soft") or (nK == "classic") then
									if yA > 0 then
										lA((QA - kK) - yA, bA, yA, VA, zA, zA, true);
									end;
									lA(((QA - kK) - yA) - wK, bA, wK, VA, 0, zA, true);
								else
									lA((QA - kK) - yA, bA, yA, VA, zA, zA, true);
									lA(((QA - kK) - yA) - wK, bA, wK, VA, 0, zA, true);
								end;
							end;
							if not g(PK, "right") then
								if (nK == 'soft') or (nK == 'classic') then
									if yA > 0 then
										lA(QA + kK, bA, yA, VA, zA, zA, true);
									end;
									lA(QA + kK + yA, bA, wK, VA, zA, 0, true);
								else
									lA(QA + kK, bA, yA, VA, zA, zA, true);
									lA(QA + kK + yA, bA, wK, VA, zA, 0, true);
								end;
							end;
						end;
						local wK = {
							small = "-",
							default = '',
							bold = 'b'
						};
						local function nK()
							local kK, yA = true, false;
							for QA, QA in ipairs(l) do
								local bA = V(QA);
								if type(bA) == "boolean" then
									yA = true;
									kK = kK and bA;
								end;
							end;
							return (yA and kK) or false;
						end;
						local function kK(yA)
							local QA = nil;
							if yA then
								for yA, yA in ipairs(l) do
									local l = V(yA);
									if type(l) == 'number' then
										QA = l;
									end;
								end;
							end;
							if QA == nil then
								QA = V(TK);
							end;
							if type(QA) ~= 'number' then
								return "DMG";
							end;
							if QA == 0 then
								return 'AUTO';
							end;
							if QA > 100 then
								return ("+%d"):format(QA - 100);
							end;
							return tostring(QA);
						end;
						local l = {
							target = nil,
							progress = 1,
							current = nil,
							from = 0,
							to = 0,
							plus = false,
							numeric = false
						};
						local function TK(yA)
							if type(yA) ~= "string" then
								return nil, false;
							end;
							local QA, bA = yA:match('^(%+?)(%d+)$');
							if bA == nil then
								return nil, false;
							end;
							return tonumber(bA), QA == '+';
						end;
						local function yA(QA)
							QA = tostring(QA or "DMG");
							local bA, lA = TK(QA);
							if QA ~= l.target then
								l.target = QA;
								l.progress = 0;
								l.numeric = bA ~= nil;
								l.plus = lA;
								if bA ~= nil then
									l.from = l.current or bA;
									l.to = bA;
								end;
							end;
							l.progress = math.min(1, (l.progress or 1) + (iK() * 8.5));
							local TK = 1 - math.pow(1 - l.progress, 3);
							if not l.numeric then
								l.current = nil;
								return QA, TK;
							end;
							local iK = tonumber(l.from) or l.to;
							local QA = tonumber(l.to) or iK;
							local bA = iK + ((QA - iK) * TK);
							if l.progress < 1 then
								local lA = math.max(1, math.abs(QA - iK) * 0.055);
								bA = bA + (math.sin((globals.realtime() or 0) * 46) * lA);
							end;
							bA = math.floor(bA + 0.5);
							if ((iK < QA) and (bA > QA)) or ((iK > QA) and (bA < QA)) then
								bA = QA;
							end;
							l.current = bA;
							return ((l.plus and "+") or '') .. tostring(bA), TK;
						end;
						local function l(TK, iK, QA, bA)
							if not (ui.is_menu_open and (ui.is_menu_open() == true)) then
								return false;
							end;
							local lA, VA = ui.mouse_position();
							if q(lA, VA) then
								return false;
							end;
							local lA, VA = infinix_dpi_mouse_position();
							return (lA ~= nil) and (VA ~= nil) and (lA >= TK) and (lA <= (TK + QA)) and (VA >= iK) and (VA <= (iK + bA));
						end;
						local function TK()
							if rawget(_G, "INFINIX_DMG_ON") ~= true then
								uK.active = false;
								return;
							end;
							local iK = ui.is_menu_open and (ui.is_menu_open() == true);
							if not iK then
								uK.active = false;
								uK.lmb_last = false;
								uK.live_x, uK.live_y = nil, nil;
							end;
							local QA = entity.get_local_player();
							local bA = (QA ~= nil) and entity.is_alive(QA);
							if (not bA) and (not iK) then
								return;
							end;
							local QA = nK();
							if (V(DK) == true) and (not QA) and (not iK) then
								return;
							end;
							local nK, lA = infinix_dpi_screen_size();
							if (not nK) or (not lA) then
								return;
							end;
							local VA, qA = tK(V(vK), 26, - 30.0);
							local tK = math.floor((nK * 0.5) + VA);
							local VA = math.floor((lA * 0.5) + qA);
							if uK.active and uK.live_x then
								tK, VA = uK.live_x, uK.live_y;
							end;
							local qA, OA = yA((iK and (not bA) and 'DMG') or kK(QA));
							local kK = wK[tostring(V(NK) or "small")] or '-';
							local wK, yA = infinix_dpi_measure_text(kK, qA);
							wK = wK or 24;
							yA = yA or 10;
							local bA, EA, aA, sA;
							if QA then
								if RK() then
									bA, EA, aA, sA = U();
								else
									bA, EA, aA, sA = dK(LK, 155, 213, 60, 255);
								end;
							else
								bA, EA, aA, sA = dK(GK, 255, 255, 255, 150);
							end;
							local dK, RK = tK - 4, VA - 3;
							local QA, zA = wK + 8, yA + 6;
							local wK = false;
							if iK then
								local iK = (client.key_state and client.key_state(1)) or false;
								local yA = iK and (not uK.lmb_last);
								uK.lmb_last = iK;
								local hA = l(dK, RK, QA, zA);
								if yA and hA and (not uK.active) then
									local yA, _A = infinix_dpi_mouse_position();
									if (yA ~= nil) and (_A ~= nil) then
										uK.active = true;
										uK.ox = yA - tK;
										uK.oy = _A - VA;
										uK.live_x = tK;
										uK.live_y = VA;
									end;
								end;
								if uK.active then
									INFINIX_DRAG_BLOCK_ATTACK = true;
									G();
									if iK then
										local iK, yA = infinix_dpi_mouse_position();
										if (iK ~= nil) and (yA ~= nil) then
											uK.live_x = iK - uK.ox;
											uK.live_y = yA - uK.oy;
											tK, VA = uK.live_x, uK.live_y;
											dK, RK = tK - 4, VA - 3;
										end;
									else
										AK(vK, tK - (nK * 0.5), VA - (lA * 0.5));
										uK.active = false;
										uK.live_x, uK.live_y = nil, nil;
									end;
								end;
								wK = hA or uK.active;
							end;
							local nK, iK = infinix_drag_anim_xy(uK, tK, VA, (uK.active and 12) or 17);
							local tK = infinix_drag_phase(uK, "outline_phase", wK, (uK.active and 24) or 14);
							if tK > 0.01 then
								local wK = math.floor((140 * tK) + 0.5);
								infinix_dpi_rounded_outline(nK - 4, iK - 3, QA, zA, 3, 255, 255, 255, wK);
							end;
							local wK = iK - math.floor(((1 - OA) * 4) + 0.5);
							local uK = math.floor((sA * (0.72 + (0.28 * OA))) + 0.5);
							infinix_dpi_text(nK, wK, bA, EA, aA, uK, kK, 0, qA);
						end;
						local function wK(nK)
							local uK = tonumber(entity.get_prop(nK, "m_flVelocityModifier"));
							if uK ~= nil then
								return math.max(0, math.min(100, uK * 100));
							end;
							local nK = (globals.realtime() or 0) - (KK.hit_time or 0);
							return math.max(0, math.min(100, 65 + (nK * 32)));
						end;
						local function nK()
							if (JK.live_x ~= nil) and (JK.live_y ~= nil) then
								xK(QK, JK.live_x, JK.live_y);
								return;
							end;
							local uK, iK = UK(V(QK), 14, 230);
							xK(QK, uK, iK);
						end;
						XK[# XK + 1] = nK;
						hK.pre_config_save[# hK.pre_config_save + 1] = nK;
						sK.velocity_warning_pos = nK;
						client.set_event_callback("player_hurt", function(nK)
							if rawget(_G, 'INFINIX_VEL_WARN_ON') ~= true then
								return;
							end;
							local uK = entity.get_local_player();
							if uK == nil then
								return;
							end;
							local iK = client.userid_to_entindex(nK.userid);
							if iK ~= uK then
								return;
							end;
							local nK = globals.realtime() or 0;
							KK.hit_time = nK;
							KK.active_until = nK + 3;
							KK.display = math.min(KK.display or 100, wK(uK));
							KK.alpha = math.max(KK.alpha or 0, 0.25);
						end);
						local function nK()
							if rawget(_G, 'INFINIX_VEL_WARN_ON') ~= true then
								JK.active = false;
								return;
							end;
							local uK = ui.is_menu_open and (ui.is_menu_open() == true);
							if not uK then
								JK.active = false;
								JK.lmb_last = false;
								JK.live_x, JK.live_y = nil, nil;
							end;
							local iK = entity.get_local_player();
							local tK = (iK ~= nil) and entity.is_alive(iK);
							local AK = globals.realtime() or 0;
							local dK = (tK and wK(iK)) or 100;
							local wK = ((uK or (tK and ((AK <= (KK.active_until or 0)) or (dK < 99.5)))) and 1) or 0;
							KK.alpha = e(KK.alpha or 0, wK, ((wK > 0) and 10) or 6);
							if KK.alpha <= 0.01 then
								return;
							end;
							KK.display = e(KK.display or dK, dK, 10);
							if (dK >= 99.5) and (AK > ((KK.hit_time or 0) + 0.35)) then
								KK.active_until = math.min(KK.active_until or 0, AK + 0.18);
							end;
							local wK = math.max(0, math.min(100, math.floor((KK.display or dK) + 0.5)));
							local iK = ("velocity broken ~ %d%%"):format(wK);
							local wK, tK = infinix_dpi_measure_text('b', iK);
							wK = wK or 120;
							tK = tK or 10;
							local AK = V(QK);
							local dK, RK = UK(AK, nil, nil);
							if (dK == nil) or (RK == nil) or (AK == '14,230') then
								dK, RK = SK(wK, tK);
							end;
							if JK.active and (JK.live_x ~= nil) then
								dK, RK = JK.live_x, JK.live_y;
							end;
							local UK, SK = dK - 4, RK - 3;
							local kK, yA = wK + 8, tK + 6;
							do
								local tK, QA = infinix_dpi_screen_size();
								tK = tK or 1920;
								QA = QA or 1080;
								local bA = H(dK, 2, math.max(2, (tK - kK) - 2));
								local tK = H(RK, 2, math.max(2, (QA - yA) - 2));
								if ((bA ~= dK) or (tK ~= RK)) and (not JK.active) and (AK ~= "14,230") then
									xK(QK, bA, tK);
								end;
								dK, RK = bA, tK;
								UK, SK = dK - 4, RK - 3;
							end;
							local tK = false;
							if uK then
								local uK = (client.key_state and client.key_state(1)) or false;
								local AK = uK and (not JK.lmb_last);
								JK.lmb_last = uK;
								local QA = l(UK, SK, kK, yA);
								if AK and QA and (not JK.active) then
									local l, AK = infinix_dpi_mouse_position();
									if (l ~= nil) and (AK ~= nil) then
										JK.active = true;
										JK.ox = l - dK;
										JK.oy = AK - RK;
										JK.live_x = dK;
										JK.live_y = RK;
									end;
								end;
								if JK.active then
									INFINIX_DRAG_BLOCK_ATTACK = true;
									G();
									if uK then
										local l, uK = infinix_dpi_mouse_position();
										if (l ~= nil) and (uK ~= nil) then
											local AK, bA = infinix_dpi_screen_size();
											AK = AK or 1920;
											bA = bA or 1080;
											dK = H(l - JK.ox, 2, math.max(2, (AK - kK) - 2));
											RK = H(uK - JK.oy, 2, math.max(2, (bA - yA) - 2));
											local l = AK * 0.5;
											local uK = dK + (wK * 0.5);
											if math.abs(uK - l) <= 10 then
												dK = H(l - (wK * 0.5), 2, math.max(2, (AK - kK) - 2));
											end;
											JK.live_x, JK.live_y = dK, RK;
											UK, SK = dK - 4, RK - 3;
										end;
									else
										xK(QK, dK, RK);
										JK.active = false;
										JK.live_x, JK.live_y = nil, nil;
									end;
								end;
								tK = QA or JK.active;
							end;
							fK = e(fK, (JK.active and 1) or 0, (JK.active and 14) or 8);
							if fK > 0.01 then
								local l, e = infinix_dpi_screen_size();
								l = l or 1920;
								e = e or 1080;
								local wK = math.floor((150 * fK) + 0.5);
								local uK = math.floor((l * 0.5) + 0.5);
								infinix_dpi_rectangle(uK, 0, 1, e, 255, 255, 255, wK);
							end;
							local l = math.floor((220 * (KK.alpha or 0)) + 0.5);
							local e, wK = infinix_drag_anim_xy(JK, dK, RK, (JK.active and 12) or 17);
							local uK = infinix_drag_phase(JK, "outline_phase", tK, (JK.active and 24) or 14);
							if uK > 0.01 then
								local JK = math.floor((120 * uK) + 0.5);
								infinix_dpi_rounded_outline(e - 4, wK - 3, kK, yA, 3, 255, 255, 255, JK);
							end;
							infinix_dpi_text(e, wK, 235, 238, 232, l, "b", 0, iK);
						end;
						hK[# hK + 1] = FK;
						_K[# _K + 1] = function()
							jA();
							IK();
							TK();
							nK();
						end;
						function sK.visual_scope()
							if lK ~= nil then
								pcall(h.unset, lK);
							end;
							eK(false);
						end;
						local function l()
							rawset(_G, 'INFINIX_SCOPE_ON', V(qK) == true);
							rawset(_G, "INFINIX_DMG_ON", V(CK) == true);
							rawset(_G, "INFINIX_VEL_WARN_ON", V(rK) == true);
							pcall(i);
						end;
						l();
						o(qK, function()
							l();
							ZK();
						end);
						o(CK, l);
						o(rK, l);
						local function l(e)
							local lK = e == "visuals";
							local e = lK and (V(qK) == true);
							local TK = lK and (V(CK) == true);
							c(qK, lK);
							c(CK, lK);
							c(rK, lK);
							c(cK, e);
							c(PK, e);
							c(oK, e);
							c(mK, e);
							c(BK, e);
							c(MK, e);
							c(WK, e);
							c(YK, e);
							c(DK, TK);
							c(NK, TK);
							c(LK, TK);
							c(GK, TK);
						end;
						EK[# EK + 1] = l;
						pK('visuals', 'scope_en', qK);
						pK("visuals", 'scope_style', cK);
						pK("visuals", "scope_exclude", PK);
						pK('visuals', 'scope_color', oK);
						pK('visuals', 'scope_length', mK);
						pK('visuals', "scope_gap", BK);
						pK('visuals', "scope_fade", MK);
						pK('visuals', 'scope_speed', WK);
						pK('visuals', "scope_thick", YK);
						pK("visuals", 'dmg_en', CK);
						pK("visuals", "dmg_only", DK);
						pK('visuals', 'dmg_font', NK);
						pK('visuals', 'dmg_active', LK);
						pK("visuals", 'dmg_inactive', GK);
						pK('visuals', "dmg_pos", vK);
						pK('visuals', 'vel_en', rK);
						pK("visuals", "vel_pos", QK);
						for l, e in pairs(r) do
							E[l] = e;
						end;
					end);
					if not _ then
						pcall(client.color_log, 255, 120, 90, '[infinix recode]' .. " [visuals] add-ons disabled: " .. tostring(D));
					end;
				end;
				do
					local l, E = pcall(function()
						local _ = require('ffi');
						_.new('float[1]');
						_.new('float[1]');
						_.new("float[1]");
						if (type(_G.vtable_bind) == "function") and (type(_G.vtable_thunk) == 'function') then
							_G.vtable_bind("engine.dll", "VEngineClient014", 78, "void*(__thiscall*)(void*)");
							_G.vtable_thunk(10, 'float(__thiscall*)(void*, int flow)');
							_G.vtable_thunk(11, "float(__thiscall*)(void*, int flow)");
							_G.vtable_thunk(25, "void(__thiscall*)(void*, float *pflFrameTime, float *pflFrameTimeStdDeviation, float *pflFrameStartTimeStdDeviation)");
						else
							local D = client.create_interface('engine.dll', "VEngineClient014");
							if D == nil then
								error('no VEngineClient014');
							end;
							local r = _.cast("void***", D);
							local D = _.typeof('void*(__thiscall*)(void*)');
							_.typeof('float(__thiscall*)(void*, int)');
							_.typeof("float(__thiscall*)(void*, int)");
							_.typeof('void(__thiscall*)(void*, float*, float*, float*)');
							_.cast(D, r[0][78]);
						end;
					end);
					if not l then
						M(255, 200, 80, "[wm] FFI failed: " .. tostring(E));
					else
						M(100, 255, 100, "[wm] FFI ok");
					end;
				end;
				pK("visuals", 'accent_en', a);
				pK("visuals", 'accent_color', s);
				pK("visuals", "ar_en", p);
				pK("visuals", 'ar_sl', C);
				pK('visuals', 'tp_en', B);
				pK('visuals', "tp_dist", W);
				pK("visuals", "vm_en", N);
				pK('visuals', "vm_fov", L);
				pK('visuals', "vm_x", n);
				pK('visuals', "vm_y", J);
				pK("visuals", 'vm_z', A);
				pK("visuals", "vm_opp_knife", R);
				pK("visuals", "fz_en", Z);
				pK('visuals', 'fz_val', yK);
			end)();
			(function()
				local l;
				local E, a, s;
				local _, B;
				local W, p, C, D, N, L;
				local r, n, e, J;
				local A;
				local R, Z, yK;
				local QK;
				local lK = {
					target = nil,
					ox = 0,
					oy = 0,
					lmb_last = false,
					lmb_press_edge = false
				};
				local qK, cK, PK = 0, 0, 0;
				local function oK(mK, BK, MK)
					return infinix_drag_parse_abs(mK, BK, MK);
				end;
				local function mK(BK, MK, WK)
					infinix_drag_save_abs(BK, MK, WK);
				end;
				local BK, MK = 1920, 1080;
				local function WK()
					local YK, CK = infinix_dpi_screen_size();
					if (type(YK) == "number") and (type(CK) == "number") and (YK >= 640) and (CK >= 480) then
						BK, MK = YK, CK;
						return YK, CK, true;
					end;
					return BK, MK, false;
				end;
				local function BK(MK, YK, CK, DK)
					if not ui.is_menu_open() then
						return false;
					end;
					local NK, LK = ui.mouse_position();
					if (NK == nil) or (LK == nil) then
						return false;
					end;
					if q(NK, LK) then
						return false;
					end;
					local q, NK = infinix_dpi_mouse_position();
					if (q == nil) or (NK == nil) then
						return false;
					end;
					return (q >= MK) and (q <= (MK + CK)) and (NK >= YK) and (NK <= (YK + DK));
				end;
				local q = globals.absoluteframetime or globals.frametime or function()
					return 0.0083333333333333;
				end;
				local function MK(YK, CK, DK, NK)
					local LK = 1 - math.exp(- (NK or 0) * DK);
					local DK = YK + ((CK - YK) * LK);
					if math.abs(CK - DK) < 0.001 then
						DK = CK;
					end;
					return DK;
				end;
				local function YK(CK)
					CK = 1 - CK;
					return 1 - (CK * CK * CK);
				end;
				local function CK(DK, NK, LK, GK, vK)
					if (LK <= 0) or (GK <= 0) then
						return;
					end;
					vK = vK or 1;
					local rK = math.floor((122 * vK) + 0.5);
					if rK <= 0 then
						return;
					end;
					local TK = math.floor((LK * 0.24) + 0.5);
					local wK = math.floor((LK * 0.27) + 0.5);
					local nK = (LK - TK) - wK;
					if TK > 0 then
						infinix_dpi_gradient(DK, NK, TK, GK, 0, 0, 0, 0, 0, 0, 0, rK, true);
					end;
					if nK > 0 then
						infinix_dpi_rectangle(DK + TK, NK, nK, GK, 0, 0, 0, rK);
					end;
					if wK > 0 then
						infinix_dpi_gradient(DK + TK + nK, NK, wK, GK, 0, 0, 0, rK, 0, 0, 0, 0, true);
					end;
					local GK = math.floor((26 * vK) + 0.5);
					local vK = math.floor((LK / 2) + 0.5);
					infinix_dpi_gradient(DK, NK, vK, 1, 0, 0, 0, 0, 0, 0, 0, GK, true);
					infinix_dpi_gradient(DK + vK, NK, LK - vK, 1, 0, 0, 0, GK, 0, 0, 0, 0, true);
				end;
				local function DK(NK)
					local LK, GK = WK();
					local vK = (NK and NK.w) or 248;
					local rK = (NK and NK.h) or 14;
					local NK = H(math.floor(vK + 16 + 0.5), 170, 320);
					local vK = H(math.floor(rK + 8 + 0.5), 18, 28);
					return {
						{
							name = 'TL',
							x = 3,
							y = 3,
							w = NK,
							h = vK,
							anchor = "left"
						},
						{
							name = "TR",
							x = ((LK - 3) - NK),
							y = 3,
							w = NK,
							h = vK,
							anchor = 'right'
						},
						{
							name = "BL",
							x = 3,
							y = ((GK - 3) - vK),
							w = NK,
							h = vK,
							anchor = "left"
						},
						{
							name = "BR",
							x = ((LK - 3) - NK),
							y = ((GK - 3) - vK),
							w = NK,
							h = vK,
							anchor = 'right'
						},
						{
							name = "BC",
							x = ((LK - NK) / 2),
							y = ((GK - 3) - vK),
							w = NK,
							h = vK,
							anchor = 'center'
						}
					};
				end;
				local function NK()
					return {
						{
							name = "TL",
							x = 3,
							y = 3,
							w = 300,
							h = 60,
							anchor = 'left'
						}
					};
				end;
				local function LK(GK)
					if GK.anchor == "left" then
						return GK.x, GK.y;
					end;
					if GK.anchor == 'right' then
						return GK.x + GK.w, GK.y;
					end;
					if GK.anchor == "center" then
						return GK.x + (GK.w * 0.5), GK.y + GK.h;
					end;
					return GK.x, GK.y;
				end;
				local function GK(vK)
					return vK.x + (vK.w * 0.5), vK.y + (vK.h * 0.5);
				end;
				local function vK(rK, TK, wK)
					local nK, uK = nil, 8100;
					for eK, eK in ipairs(rK) do
						local rK, JK = GK(eK);
						local GK, KK = TK - rK, wK - JK;
						local rK = (GK * GK) + (KK * KK);
						if rK < uK then
							nK, uK = eK, rK;
						end;
					end;
					return nK;
				end;
				local function GK(rK, TK, wK, nK, uK, eK)
					if (wK <= 0) or (nK <= 0) then
						return;
					end;
					rK = math.floor(rK + 0.5);
					TK = math.floor(TK + 0.5);
					wK = math.floor(wK + 0.5);
					nK = math.floor(nK + 0.5);
					uK = H(uK or 0, 0, 255);
					eK = H(eK or 0, 0, 255);
					local H = (eK > 0) or (uK > 160);
					if H then
						infinix_dpi_rectangle(rK + 1, TK + 1, wK - 1, nK - 1, 0, 0, 0, math.floor((34 * (uK / 255)) + 0.5));
					end;
					local eK = (H and math.floor(math.min(190, uK * 0.74) + 0.5)) or math.floor(math.min(95, uK * 0.58) + 0.5);
					infinix_dpi_rounded_outline(rK, TK, wK, nK, 4, 255, 255, 255, eK);
				end;
				do
					local H = aK.visuals._flat;
					local rK, TK;
					do
						local wK, nK = pcall(ui.reference, "Misc", 'Miscellaneous', "Draw console output");
						if wK and nK then
							rK = nK;
							local wK, uK = pcall(ui.get, nK);
							TK = (wK and uK) or false;
							O(nK, false);
						end;
					end;
					function sK.logs_dco()
						if rK and (TK ~= nil) then
							pcall(ui.set, rK, TK);
						end;
					end;
					local rK = {};
					local TK, wK = 1, 0;
					function A(nK)
						if wK < 30 then
							wK = wK + 1;
							rK[wK] = nK;
							return;
						end;
						rK[TK] = nK;
						TK = (TK % 30) + 1;
					end;
					E = Q(ui.new_checkbox, "AA", "Fake lag", "aimbot logs");
					a = Q(ui.new_checkbox, "AA", 'Fake lag', '  a?? console logs');
					s = Q(ui.new_multiselect, "AA", 'Fake lag', '    log types', {
						'hits',
						'misses',
						'mismatch',
						'grenades',
						"death"
					});
					_ = Q(ui.new_checkbox, 'AA', 'Fake lag', '  a?? on-screen logs');
					B = Q(ui.new_slider, "AA", 'Fake lag', "    duration", 1, 10, 4, true, 's');
					W = Q(ui.new_checkbox, 'AA', 'Fake lag', "indicators");
					p = Q(ui.new_checkbox, "AA", "Fake lag", '  watermark');
					C = Q(ui.new_checkbox, 'AA', 'Fake lag', '  a?? force show loss' .. b(''));
					D = Q(ui.new_checkbox, 'AA', "Fake lag", '  a?? force show var' .. b(""));
					pcall(ui.set, C, false);
					pcall(ui.set, D, false);
					N = Q(ui.new_checkbox, 'AA', 'Fake lag', '  cs2 panel indicators');
					L = Q(ui.new_multiselect, "AA", "Fake lag", "    keybinds list", 'force shot', "body aim", 'dt', 'fake duck', "min damage", "ping spike", 'freestanding', "hide shots", 'dormant aimbot');
					r = Q(j[119], "infinix_wm_pos", "");
					n = Q(j[119], 'infinix_kb_pos', "");
					e = Q(j[119], 'infinix_osl_pos', "900,300");
					J = Q(j[119], "infinix_wm_anchor", 'right');
					H.al_en = E;
					H.cl_en = a;
					H.cl_types = s;
					H.osl_en = _;
					H.osl_dur = B;
					H.ind_en = W;
					H.wm_en = p;
					H.wm_fl = C;
					H.wm_fv = D;
					H.kb_en = N;
					H.kb_list = L;
					function l(H)
						local rK = H == "visuals";
						c(E, rK);
						c(W, rK);
						if not rK then
							return;
						end;
						local H = V(E) == true;
						c(a, H);
						c(_, H);
						local rK = H and (V(a) == true);
						local TK = H and (V(_) == true);
						c(s, rK);
						c(B, TK);
						local H = V(W) == true;
						c(p, H);
						c(N, H);
						local rK = H and (V(p) == true);
						c(C, rK);
						c(D, rK);
						local rK = H and (V(N) == true);
						c(L, rK);
					end;
					local c = false;
					local function H()
						return true;
					end;
					local function rK(TK)
						TK = TK == true;
						if c == TK then
							return;
						end;
						local wK = (TK and client.set_event_callback) or client.unset_event_callback;
						if type(wK) ~= 'function' then
							return;
						end;
						local nK = pcall(wK, "indicator", H);
						if nK then
							c = TK;
						end;
					end;
					function sK.indicators_native_restore()
						rK(false);
					end;
					local function c()
						local H = V(W) == true;
						rawset(_G, "INFINIX_AL_ON", V(E) == true);
						rawset(_G, 'INFINIX_CL_ON', V(a) == true);
						rawset(_G, 'INFINIX_OSL_ON', V(_) == true);
						rawset(_G, "INFINIX_IND_ON", H);
						rawset(_G, "INFINIX_WM_ON", H and (V(p) == true));
						rawset(_G, 'INFINIX_KB_ON', H and (V(N) == true));
						local H = rawget(_G, 'INFINIX_KB_ON') == true;
						rK(H);
						if not H then
							rawset(_G, "INFINIX_KB_DRAW_READY", false);
						end;
						pcall(i);
					end;
					c();
					o(E, c);
					o(a, c);
					o(_, c);
					o(W, c);
					o(p, c);
					o(N, c);
					pK("logs", "al_en", E);
					pK('logs', 'cl_en', a);
					pK("logs", 'cl_types', s);
					pK('logs', 'osl_en', _);
					pK("logs", 'osl_dur', B);
					pK('indicators', "ind_en", W);
					pK("indicators", "wm_en", p);
					pK("indicators", "kb_en", N);
					pK("indicators", "kb_list", L);
					pK("indicators", 'wm_pos', r);
					pK("indicators", 'kb_pos', n);
					pK('indicators', "osl_pos", e);
					pK('indicators', 'wm_anchor', J);
				end;
				do
					local E = {
						144,
						144,
						144
					};
					local a = {
						128,
						128,
						128
					};
					local _ = {
						230,
						230,
						230
					};
					local c = {
						166,
						124,
						207
					};
					local W = {
						213,
						154,
						77
					};
					local H = {
						191,
						191,
						191
					};
					local p = {
						211,
						80,
						80
					};
					local N = {
						176,
						198,
						255
					};
					local pK = {
						[0] = "generic",
						[1] = "head",
						[2] = "chest",
						[3] = "stomach",
						[4] = 'l.arm',
						[5] = "r.arm",
						[6] = 'l.leg',
						[7] = "r.leg",
						[10] = "gear"
					};
					local rK = {
						hegrenade = 'HE',
						inferno = "Molotov",
						molotov = 'Molotov',
						flashbang = 'Flashbang',
						decoy = 'Decoy',
						smokegrenade = "Smoke"
					};
					local TK, wK, nK, uK = {}, 1, 0, 0;
					local function eK(JK)
						if # JK == 0 then
							return;
						end;
						for KK, fK in ipairs(JK) do
							local iK = fK[4] or '';
							if KK < # JK then
								iK = iK .. ' ';
							end;
							pcall(client.color_log, fK[1], fK[2], fK[3], iK);
						end;
					end;
					local function JK()
						for KK in pairs(TK) do
							TK[KK] = nil;
						end;
						wK, nK, uK = 1, 0, 0;
					end;
					local function KK(fK)
						if # fK == 0 then
							return;
						end;
						A(fK);
						nK = nK + 1;
						TK[nK] = fK;
						uK = uK + 1;
						while uK > 8 do
							TK[wK] = nil;
							wK = wK + 1;
							uK = uK - 1;
						end;
					end;
					client.set_event_callback("paint", function()
						if (rawget(_G, "INFINIX_AL_ON") ~= true) or (rawget(_G, "INFINIX_CL_ON") ~= true) then
							if uK > 0 then
								JK();
							end;
							return;
						end;
						if uK <= 0 then
							return;
						end;
						local A = TK[wK];
						TK[wK] = nil;
						wK = wK + 1;
						uK = uK - 1;
						if uK <= 0 then
							wK, nK, uK = 1, 0, 0;
						end;
						if A ~= nil then
							eK(A);
						end;
					end);
					local function A(TK)
						local wK, nK, uK = U();
						return {
							wK,
							nK,
							uK,
							TK
						};
					end;
					local function TK(wK, nK)
						return {
							wK[1],
							wK[2],
							wK[3],
							nK
						};
					end;
					do
						local wK = rawget(_G, "INFINIX_ENEMY_MISS_HOOKS");
						if type(wK) == "table" then
							wK[# wK + 1] = function(wK)
								if (rawget(_G, 'INFINIX_AL_ON') ~= true) or (rawget(_G, 'INFINIX_CL_ON') ~= true) then
									return;
								end;
								if not g(s, 'misses') then
									return;
								end;
								local nK = wK and wK.attacker;
								local uK = (nK and entity.get_player_name(nK)) or '?';
								local nK = math.floor(((wK and wK.dist) or 0) + 0.5);
								KK({
									A('infinix  '),
									TK(N, 'a??  '),
									TK(E, 'enemy miss was detected'),
									TK(a, "  ~  attacker: "),
									TK(_, uK),
									(((nK > 0) and TK(a, ', d: ')) or nil),
									(((nK > 0) and TK(N, tostring(nK))) or nil)
								});
							end;
						end;
					end;
					local N, wK = {}, {};
					local function nK(uK)
						if (uK == nil) or (uK.id == nil) then
							return nil;
						end;
						return tostring(uK.id);
					end;
					local function uK(eK)
						eK = eK or globals.tickcount();
						for JK, fK in pairs(N) do
							if (type(fK) ~= 'table') or ((eK - (fK.tick or eK)) > 128) then
								N[JK] = nil;
							end;
						end;
						for JK, fK in pairs(wK) do
							if (type(fK) ~= 'table') or ((eK - (fK.tick or eK)) > 128) then
								wK[JK] = nil;
							end;
						end;
					end;
					local function eK(JK)
						local fK = tonumber(JK and JK.tick);
						if fK == nil then
							return nil;
						end;
						local JK = (globals.tickcount() or 0) - fK;
						if JK ~= JK then
							return nil;
						end;
						return math.floor(JK + 0.5);
					end;
					local function JK(fK)
						if fK == nil then
							return nil;
						end;
						local iK = nK(fK);
						local UK = (iK and N[iK]) or nil;
						if (UK ~= nil) and (fK.target ~= nil) and (UK.target ~= fK.target) then
							UK = nil;
						end;
						if (UK == nil) and (fK.target ~= nil) then
							UK = wK[fK.target];
						end;
						if (UK ~= nil) and ((globals.tickcount() - (UK.tick or globals.tickcount())) <= 128) then
							return UK;
						end;
						return nil;
					end;
					local function fK(iK, UK)
						local xK = nK(iK);
						if xK ~= nil then
							N[xK] = nil;
						end;
						if (UK ~= nil) and (UK.target ~= nil) and (wK[UK.target] == UK) then
							wK[UK.target] = nil;
						end;
					end;
					client.set_event_callback("aim_fire", function(iK)
						if (rawget(_G, 'INFINIX_AL_ON') ~= true) or (rawget(_G, 'INFINIX_CL_ON') ~= true) then
							return;
						end;
						if iK == nil then
							return;
						end;
						local UK = globals.tickcount();
						uK(UK);
						local uK = {
							tick = UK,
							target = iK.target,
							hitgroup = iK.hitgroup,
							damage = iK.damage,
							difference = eK(iK)
						};
						local eK = nK(iK);
						if eK ~= nil then
							N[eK] = uK;
						end;
						if iK.target ~= nil then
							wK[iK.target] = uK;
						end;
					end);
					client.set_event_callback('aim_hit', function(nK)
						if (rawget(_G, 'INFINIX_AL_ON') ~= true) or (rawget(_G, "INFINIX_CL_ON") ~= true) then
							return;
						end;
						if nK == nil then
							return;
						end;
						local uK = JK(nK);
						local eK = pK[nK.hitgroup or 0] or "body";
						local iK = (uK and pK[uK.hitgroup or 0]) or '?';
						local UK = (uK and uK.damage) or 0;
						local xK = (uK and uK.difference) or nil;
						local tK = (nK.target and entity.get_player_name(nK.target)) or '?';
						local AK = uK and (nK.hitgroup ~= uK.hitgroup);
						if AK then
							if not g(s, "mismatch") then
								fK(nK, uK);
								return;
							end;
						elseif not g(s, "hits") then
							fK(nK, uK);
							return;
						end;
						local SK, dK, RK = U();
						local kK = {
							SK,
							dK,
							RK
						};
						local SK = (AK and W) or kK;
						local W = (AK and 'a??') or 'a??';
						local dK = (AK and "mismatch") or 'hit';
						KK({
							A("infinix  "),
							TK(SK, W .. '  '),
							TK(E, dK .. " "),
							TK(_, tK),
							TK(a, "'s "),
							TK(SK, eK),
							TK(E, " for "),
							TK(SK, tostring(nK.damage or 0) .. 'hp'),
							TK(a, "  ~  exp: "),
							TK(SK, iK .. " " .. tostring(UK)),
							((xK and (xK ~= 0) and TK(a, ", delta: ")) or nil),
							((xK and (xK ~= 0) and TK(SK, xK .. "t")) or nil)
						});
						fK(nK, uK);
					end);
					client.set_event_callback("aim_miss", function(W)
						if (rawget(_G, 'INFINIX_AL_ON') ~= true) or (rawget(_G, "INFINIX_CL_ON") ~= true) then
							return;
						end;
						if W == nil then
							return;
						end;
						local nK = JK(W);
						if not g(s, 'misses') then
							fK(W, nK);
							return;
						end;
						local uK = (nK and pK[nK.hitgroup or 0]) or "?";
						local eK = (nK and nK.damage) or 0;
						local JK = (nK and nK.difference) or nil;
						local iK = (W.target and entity.get_player_name(W.target)) or '?';
						local UK = W.reason or 'unknown';
						KK({
							A('infinix  '),
							TK(c, 'a??  '),
							TK(E, "missed "),
							TK(_, iK),
							TK(a, "  ~  exp: "),
							TK(c, uK .. ' ' .. tostring(eK)),
							TK(a, ", reason: "),
							TK(c, UK),
							((JK and (JK ~= 0) and TK(a, ", delta: ")) or nil),
							((JK and (JK ~= 0) and TK(c, JK .. 't')) or nil)
						});
						fK(W, nK);
					end);
					local function W(nK)
						if not g(s, "misses") then
							return;
						end;
						local uK = (nK.target and entity.get_player_name(nK.target)) or "?";
						local eK = pK[nK.hitgroup or 0] or '?';
						local JK = nK.damage or 0;
						local fK = globals.tickcount() - (nK.tick or globals.tickcount());
						KK({
							A('infinix  '),
							TK(c, "a??  "),
							TK(E, 'missed '),
							TK(_, uK),
							TK(a, "  ~  exp: "),
							TK(c, eK .. ' ' .. tostring(JK)),
							TK(a, ", reason: "),
							TK(c, 'no event'),
							(((fK > 0) and TK(a, ', delta: ')) or nil),
							(((fK > 0) and TK(c, tostring(fK) .. "t")) or nil)
						});
					end;
					local function c(nK)
						if (nK == nil) or (entity.is_alive == nil) then
							return true;
						end;
						local uK, eK = pcall(entity.is_alive, nK);
						return uK and (eK == true);
					end;
					client.set_event_callback("paint", function()
						if (rawget(_G, "INFINIX_AL_ON") ~= true) or (rawget(_G, 'INFINIX_CL_ON') ~= true) then
							return;
						end;
						local nK = globals.tickcount();
						local uK = {};
						for eK, JK in pairs(N) do
							if (type(JK) ~= "table") or ((nK - (JK.tick or nK)) > 128) then
								N[eK] = nil;
							elseif not c(JK.target) then
								N[eK] = nil;
								if wK[JK.target] == JK then
									wK[JK.target] = nil;
								end;
							elseif (nK - (JK.tick or nK)) >= 18 then
								uK[JK] = true;
								W(JK);
								N[eK] = nil;
								if (JK.target ~= nil) and (wK[JK.target] == JK) then
									wK[JK.target] = nil;
								end;
							end;
						end;
						for N, eK in pairs(wK) do
							if (type(eK) ~= "table") or ((nK - (eK.tick or nK)) > 128) then
								wK[N] = nil;
							elseif not c(eK.target) then
								wK[N] = nil;
							elseif ((nK - (eK.tick or nK)) >= 18) and (not uK[eK]) then
								W(eK);
								wK[N] = nil;
							end;
						end;
					end);
					client.set_event_callback('player_hurt', function(c)
						if c == nil then
							return;
						end;
						local W = entity.get_local_player();
						if W == nil then
							return;
						end;
						if (rawget(_G, "INFINIX_AL_ON") ~= true) or (rawget(_G, 'INFINIX_CL_ON') ~= true) then
							return;
						end;
						local N = c.attacker and client.userid_to_entindex(c.attacker);
						local wK = c.userid and client.userid_to_entindex(c.userid);
						local nK = c.weapon or "";
						local uK = c.dmg_health or 0;
						local eK = pK[c.hitgroup or 0] or 'body';
						if (N == W) and rK[nK] and g(s, "grenades") then
							local c = (wK and entity.get_player_name(wK)) or '?';
							KK({
								A("infinix  "),
								TK(H, 'a??  '),
								TK(E, rK[nK] .. " hit "),
								TK(_, c),
								TK(E, ' for '),
								TK(H, uK .. "hp")
							});
						end;
					end);
					client.set_event_callback("player_death", function(c)
						if (rawget(_G, 'INFINIX_AL_ON') ~= true) or (rawget(_G, "INFINIX_CL_ON") ~= true) then
							return;
						end;
						if not g(s, 'death') then
							return;
						end;
						if (c == nil) or (c.userid == nil) then
							return;
						end;
						local s = entity.get_local_player();
						if s == nil then
							return;
						end;
						if client.userid_to_entindex(c.userid) ~= s then
							return;
						end;
						local s = c.attacker and client.userid_to_entindex(c.attacker);
						local g = (s and entity.get_player_name(s)) or "world";
						local s = c.weapon or "?";
						local W = (c.headshot and 'head') or 'body';
						local H = c.dmg_health or 100;
						KK({
							A('infinix  '),
							TK(p, "a??  "),
							TK(E, 'killed by '),
							TK(_, g),
							TK(a, "'s "),
							TK(p, s),
							TK(a, "  ~  "),
							TK(p, W),
							TK(a, ', '),
							TK(p, H .. "dmg")
						});
					end);
				end;
				do
					local function E()
						local a = V(B);
						if (type(a) == 'number') and (a >= 1) and (a <= 10) then
							return a;
						end;
						return 4;
					end;
					local a = {
						240,
						240,
						240
					};
					local s = {
						215,
						67,
						70
					};
					local _ = {
						215,
						67,
						70
					};
					local function c()
						local B, g, W = U();
						return {
							B,
							g,
							W
						};
					end;
					c();
					c();
					local B = {
						[0] = "generic",
						[1] = 'head',
						[2] = "chest",
						[3] = 'stomach',
						[4] = 'l.arm',
						[5] = "r.arm",
						[6] = "l.leg",
						[7] = 'r.leg',
						[10] = "gear"
					};
					local g = {};
					function QK(W)
						if (rawget(_G, 'INFINIX_AL_ON') ~= true) or (rawget(_G, "INFINIX_OSL_ON") ~= true) then
							return;
						end;
						local H = globals.realtime();
						W.spawn = H;
						W.expire = H + E();
						g[# g + 1] = W;
						while # g > 5 do
							table.remove(g, 1);
						end;
					end;
					local E = {
						t = 0,
						target = nil
					};
					client.set_event_callback('aim_hit', function(W)
						if (rawget(_G, 'INFINIX_AL_ON') ~= true) or (rawget(_G, "INFINIX_OSL_ON") ~= true) then
							return;
						end;
						if (W == nil) or (W.target == nil) then
							return;
						end;
						E.t = globals.realtime();
						E.target = W.target;
						local H = entity.get_player_name(W.target) or '?';
						local p = B[W.hitgroup or 0] or "body";
						local N = W.damage or 0;
						local A = 0;
						local pK = entity.get_prop(W.target, 'm_iHealth');
						if type(pK) == "number" then
							A = math.max(0, pK);
						end;
						local W = c();
						QK({
							kind = 'hit',
							parts = {
								{
									text = 'Hit ',
									color = a
								},
								{
									text = H,
									color = W
								},
								{
									text = ' in the ',
									color = a
								},
								{
									text = p,
									color = W
								},
								{
									text = ' for ',
									color = a
								},
								{
									text = tostring(N),
									color = W
								},
								{
									text = (" damage (" .. tostring(A) .. ' health remaining)'),
									color = a
								}
							}
						});
					end);
					client.set_event_callback("aim_miss", function(W)
						if (rawget(_G, "INFINIX_AL_ON") ~= true) or (rawget(_G, "INFINIX_OSL_ON") ~= true) then
							return;
						end;
						local H = (W.target and entity.get_player_name(W.target)) or '?';
						local p = B[W.hitgroup or 0] or "body";
						local B = tostring(W.reason or '?');
						QK({
							kind = 'miss',
							parts = {
								{
									text = "Missed shot ",
									color = a
								},
								{
									text = H,
									color = s
								},
								{
									text = ' in the ',
									color = a
								},
								{
									text = p,
									color = s
								},
								{
									text = ' due to ',
									color = a
								},
								{
									text = B,
									color = s
								}
							}
						});
					end);
					client.set_event_callback("player_death", function(B)
						if (rawget(_G, "INFINIX_AL_ON") ~= true) or (rawget(_G, "INFINIX_OSL_ON") ~= true) then
							return;
						end;
						if (B == nil) or (B.userid == nil) then
							return;
						end;
						local W = entity.get_local_player();
						if (W == nil) or (client.userid_to_entindex(B.userid) ~= W) then
							return;
						end;
						local W = B.attacker and client.userid_to_entindex(B.attacker);
						local B = (W and entity.get_player_name(W)) or "world";
						QK({
							kind = 'death',
							parts = {
								{
									text = "Killed by ",
									color = a
								},
								{
									text = B,
									color = _
								}
							}
						});
					end);
					local B = {
						hegrenade = true,
						inferno = true,
						molotov = true
					};
					client.set_event_callback('player_hurt', function(W)
						if (rawget(_G, 'INFINIX_AL_ON') ~= true) or (rawget(_G, "INFINIX_OSL_ON") ~= true) then
							return;
						end;
						local H = entity.get_local_player();
						if (H == nil) or (W == nil) then
							return;
						end;
						local p = W.userid and client.userid_to_entindex(W.userid);
						local N = W.attacker and client.userid_to_entindex(W.attacker);
						local A = tostring(W.weapon or '');
						local pK = W.dmg_health or 0;
						local rK = W.health or 0;
						if (N == H) and p and (p ~= H) then
							local W = (globals.realtime() - E.t) < 0.4;
							if W then
								return;
							end;
							if B[A] then
								local E = entity.get_player_name(p) or "?";
								local B = c();
								QK({
									kind = "harmed",
									parts = {
										{
											text = "Harmed ",
											color = a
										},
										{
											text = E,
											color = B
										},
										{
											text = ' for ',
											color = a
										},
										{
											text = tostring(pK),
											color = B
										},
										{
											text = (" damage (" .. tostring(rK) .. ' health remaining)'),
											color = a
										}
									}
								});
							end;
							return;
						end;
						if (p == H) and N and (N ~= H) then
							local E = entity.get_player_name(N) or '?';
							QK({
								kind = "harmed",
								parts = {
									{
										text = "Harmed by ",
										color = a
									},
									{
										text = E,
										color = _
									},
									{
										text = " for ",
										color = a
									},
									{
										text = tostring(pK),
										color = _
									},
									{
										text = ' damage',
										color = a
									}
								}
							});
						end;
					end);
					local function E(_)
						return _ * _ * _;
					end;
					function yK()
						if (rawget(_G, 'INFINIX_AL_ON') ~= true) or (rawget(_G, "INFINIX_OSL_ON") ~= true) then
							return;
						end;
						local _ = ui.is_menu_open() == true;
						if (# g == 0) and (not _) and (qK < 0.005) then
							return;
						end;
						local B, W = oK(V(e), 900, 300);
						if lK.target == 'osl' then
							if lK.osl_live_x then
								B = lK.osl_live_x;
							end;
							if lK.osl_live_y then
								W = lK.osl_live_y;
							end;
						end;
						lK.osl_anim = lK.osl_anim or {};
						B, W = infinix_drag_anim_xy(lK.osl_anim, B, W, ((lK.target == "osl") and 11) or 15);
						local H = globals.realtime();
						local p = 0;
						for N = # g, 1, - 1.0 do
							if g[N].expire < H then
								table.remove(g, N);
							end;
						end;
						local N = g;
						local g = YK(qK);
						if (# N == 0) and (qK > 0.005) then
							local A = c();
							local QK = c();
							N = {
								{
									_demo = true,
									kind = 'hit',
									spawn = (H - 0.15),
									expire = (H + 999),
									parts = {
										{
											text = 'Hit ',
											color = a
										},
										{
											text = 'shane',
											color = A
										},
										{
											text = ' in the ',
											color = a
										},
										{
											text = "head",
											color = A
										},
										{
											text = " for ",
											color = a
										},
										{
											text = '101',
											color = A
										},
										{
											text = " damage (0 health remaining)",
											color = a
										}
									}
								},
								{
									_demo = true,
									kind = "miss",
									spawn = (H - 0.15),
									expire = (H + 999),
									parts = {
										{
											text = 'Missed shot ',
											color = a
										},
										{
											text = 'shane',
											color = s
										},
										{
											text = " in the ",
											color = a
										},
										{
											text = 'head',
											color = s
										},
										{
											text = ' due to ',
											color = a
										},
										{
											text = "spread",
											color = s
										}
									}
								},
								{
									_demo = true,
									kind = 'harmed',
									spawn = (H - 0.15),
									expire = (H + 999),
									parts = {
										{
											text = "Harmed ",
											color = a
										},
										{
											text = 'shane',
											color = QK
										},
										{
											text = ' for ',
											color = a
										},
										{
											text = "45",
											color = QK
										},
										{
											text = " damage (55 health remaining)",
											color = a
										}
									}
								}
							};
						end;
						local s = W;
						for c, c in ipairs(N) do
							local N = H - c.spawn;
							local A = c.expire - H;
							local H = math.min(1, N / 0.15);
							local N = math.max(0, math.min(1, A / 0.5));
							local A = YK(H);
							local H, QK;
							if N >= 0.4 then
								H = (N - 0.4) / 0.6;
								QK = 1;
							else
								H = 0;
								QK = N / 0.4;
							end;
							H = E(H);
							local E = math.min(A, H);
							if c._demo then
								E = E * g;
							end;
							local g = math.floor((255 * E) + 0.5);
							local H = math.floor((- (1 - A) * 15) + 0.5);
							local N = math.floor((- (1 - QK) * 20) + 0.5);
							local A = math.floor((18 * QK) + 0.5);
							local YK = math.floor((2 * QK) + 0.5);
							local QK = 0;
							local pK = {};
							for rK, TK in ipairs(c.parts) do
								local wK = infinix_dpi_measure_text(nil, TK.text) or 0;
								pK[rK] = wK;
								QK = QK + wK;
							end;
							local rK = math.max(0, # c.parts - 1) * 5;
							local TK = QK + rK + 20;
							if TK > p then
								p = TK;
							end;
							local QK = (B - 10) + H;
							local rK = s + N;
							if A > 0 then
								if type(renderer.blur) == "function" then
									pcall(renderer.blur, infinix_dpi_round(QK), infinix_dpi_round(rK), infinix_dpi_round(TK), infinix_dpi_round(A));
								end;
								infinix_dpi_rectangle(QK, rK, TK, A, 0, 0, 0, math.floor((34 * E) + 0.5));
								CK(QK, rK, TK, A, E);
							end;
							if E > 0.01 then
								local E = B + H;
								local H = rK + 4;
								for N, QK in ipairs(c.parts) do
									local CK = QK.color or a;
									infinix_dpi_text(E, H, CK[1], CK[2], CK[3], g, "", 0, QK.text);
									E = E + pK[N];
									if N < # c.parts then
										E = E + 5;
									end;
								end;
							end;
							s = s + A + YK;
						end;
						local E = math.max(0, s - W);
						local a, s, c, g = B - 10, W, p, E;
						lK.osl_hitbox = {
							x = a,
							y = s,
							w = c,
							h = g
						};
						if _ and (c > 0) then
							local E = BK(a, s, c, g);
							local _ = lK.target == 'osl';
							local H = infinix_drag_phase(lK, 'osl_outline_phase', E or _, (_ and 24) or 14);
							if H > 0.01 then
								local p = math.floor((((_ and 150) or 95) * H) + 0.5);
								infinix_dpi_rounded_outline(a - 2, s - 2, c + 4, g + 4, 4, 255, 255, 255, p);
							end;
							if E and (not _) and lK.lmb_press_edge then
								local E, a = infinix_dpi_mouse_position();
								lK.target = 'osl';
								lK.osl_offset_x = E - B;
								lK.osl_offset_y = a - W;
								lK.osl_live_x = B;
								lK.osl_live_y = W;
							end;
						end;
					end;
				end;
				do
					local E = {
						171,
						210,
						66
					};
					local a = {
						215,
						195,
						70
					};
					local s = {
						215,
						100,
						100
					};
					local function _(c, B, g)
						if c <= 0 then
							return B;
						end;
						if c >= 1 then
							return g;
						end;
						return {
							(B[1] + ((g[1] - B[1]) * c)),
							(B[2] + ((g[2] - B[2]) * c)),
							(B[3] + ((g[3] - B[3]) * c))
						};
					end;
					local function c(B)
						if B <= 1 then
							return E;
						end;
						if B <= 2 then
							return _(B - 1, E, a);
						end;
						if B <= 3 then
							return _(B - 2, a, s);
						end;
						return s;
					end;
					local E, a, s = 0, 0, 0;
					local _ = {};
					local B = 0;
					do
						local g = globals.absoluteframetime() or 0.016666666666667;
						if g <= 0 then
							g = 0.016666666666667;
						end;
						for W = 0, 63 do
							_[W] = g;
						end;
					end;
					local function g()
						local W = globals.absoluteframetime();
						if (not W) or (W <= 0) then
							return;
						end;
						_[B] = W;
						B = (B + 1) % 64;
					end;
					local function W()
						local H = 0;
						local p = 0;
						local N = B;
						for A = 0, 63 do
							N = ((N - 1) + 64) % 64;
							local A = _[N];
							if (not A) or (A <= 0) then
								break;
							end;
							H = H + A;
							p = p + 1;
							if H >= 0.5 then
								break;
							end;
						end;
						if p < 2 then
							return 0;
						end;
						local A = H / p;
						local H = 0;
						N = B;
						local B = 0;
						for QK = 0, 63 do
							N = ((N - 1) + 64) % 64;
							local QK = _[N];
							if (not QK) or (QK <= 0) then
								break;
							end;
							local _ = QK - A;
							H = H + (_ * _);
							B = B + 1;
							if B >= p then
								break;
							end;
						end;
						return math.floor((math.sqrt(H / p) * 1000) + 0.5);
					end;
					local _ = {};
					local B = 0;
					local H = 0;
					for p = 0, 31 do
						_[p] = 0;
					end;
					local function p()
						local N = globals.realtime() or 0;
						if (N - H) < 0.15 then
							return;
						end;
						H = N;
						local H = globals.realtime();
						if (type(H) ~= "number") or (H < 0) or (H > 5) then
							_[B] = 0;
						else
							_[B] = H * 1000;
						end;
						B = (B + 1) % 32;
					end;
					local function B()
						local H = 0;
						local N = nil;
						for A = 0, 31 do
							local QK = _[A];
							if QK and N and (math.abs(QK - N) > 30) then
								H = H + 1;
							end;
							N = QK;
						end;
						return math.floor(((H / 32) * 100) + 0.5);
					end;
					local function _(H)
						if H <= 0 then
							return 0;
						end;
						if H >= 1 then
							return 1;
						end;
						local N = 1 - H;
						return 1 - (N * N * N);
					end;
					local H = {
						fps = {
							phase = 1,
							value_display = 0,
							visible = true
						},
						ping = {
							phase = 1,
							value_display = 0,
							visible = true
						},
						loss = {
							phase = 0,
							value_display = 0,
							visible = false
						},
						var = {
							phase = 0,
							value_display = 0,
							visible = false
						},
						utc = {
							phase = 1,
							value_display = 0,
							visible = true
						}
					};
					local function N(A, QK, YK, pK)
						A.visible = YK;
						local CK = (YK and 1) or 0;
						local YK = 1 - math.exp(- 10.0 * QK);
						A.phase = A.phase + ((CK - A.phase) * YK);
						if math.abs(A.phase - CK) < 0.001 then
							A.phase = CK;
						end;
						if type(pK) == "number" then
							local YK = 1 - math.exp(- 10.0 * QK);
							A.value_display = A.value_display + ((pK - A.value_display) * YK);
						end;
					end;
					local A = (function()
						local QK = {};
						QK.scale = 1;
						QK.scales = {
							brand = 1,
							value = 1,
							label = 1
						};
						QK.root = "csgo/materials/panorama/images/icons/infinix_watermark_native_inter10";
						QK.remote = 'https://raw.githubusercontent.com/cshhanec2/infinix-watermark/main/watermark_native_inter10/';
						QK.layout = {
							h = 20,
							fade = 55,
							pad = 22,
							text_shift = 0,
							brand_y = 0,
							recode_y = 0,
							label_y = 1,
							gap_brand = 11,
							gap_vl = 2,
							gap_pair = 10
						};
						QK.colors = {
							text = {
								216,
								221,
								226,
								219
							},
							label = {
								178,
								184,
								190,
								184
							},
							green = {
								158,
								219,
								67,
								255
							},
							yellow = {
								197,
								194,
								35,
								255
							},
							red = {
								197,
								53,
								55,
								255
							}
						};
						QK.assets = {
							brand = {
								gamesense = {
									path = "brand/gamesense.png",
									w = 55,
									h = 8,
									adv = 55
								},
								infinixrecode = {
									path = 'brand/infinixrecode.png',
									w = 62,
									h = 9,
									adv = 62
								},
								infinix = {
									path = 'brand/infinix.png',
									w = 29,
									h = 9,
									adv = 29
								},
								recode = {
									path = "brand/recode.png",
									w = 33,
									h = 9,
									adv = 33
								}
							},
							glyphs = {
								["0"] = {
									path = "glyphs_main/0.png",
									w = 6,
									h = 8,
									adv = 6
								},
								["1"] = {
									path = "glyphs_main/1.png",
									w = 4,
									h = 8,
									adv = 4
								},
								["2"] = {
									path = 'glyphs_main/2.png',
									w = 6,
									h = 8,
									adv = 6
								},
								["3"] = {
									path = 'glyphs_main/3.png',
									w = 6,
									h = 8,
									adv = 6
								},
								['4'] = {
									path = 'glyphs_main/4.png',
									w = 6,
									h = 8,
									adv = 6
								},
								['5'] = {
									path = 'glyphs_main/5.png',
									w = 6,
									h = 8,
									adv = 6
								},
								["6"] = {
									path = "glyphs_main/6.png",
									w = 6,
									h = 8,
									adv = 6
								},
								["7"] = {
									path = 'glyphs_main/7.png',
									w = 6,
									h = 8,
									adv = 6
								},
								['8'] = {
									path = 'glyphs_main/8.png',
									w = 6,
									h = 8,
									adv = 6
								},
								['9'] = {
									path = "glyphs_main/9.png",
									w = 6,
									h = 8,
									adv = 6
								},
								[':'] = {
									path = 'glyphs_main/colon.png',
									w = 3,
									h = 6,
									adv = 3
								},
								['.'] = {
									path = 'glyphs_main/dot.png',
									w = 3,
									h = 2,
									adv = 3
								},
								['%'] = {
									path = 'glyphs_main/percent.png',
									w = 8,
									h = 8,
									adv = 10
								},
								["-"] = {
									path = 'glyphs_main/minus.png',
									w = 4,
									h = 1,
									adv = 5
								}
							},
							tokens = {
								fps = {
									path = 'tokens/fps.png',
									w = 15,
									h = 6,
									adv = 15
								},
								ping = {
									path = 'tokens/ping.png',
									w = 19,
									h = 6,
									adv = 19
								},
								loss = {
									path = "tokens/loss.png",
									w = 21,
									h = 6,
									adv = 21
								},
								var = {
									path = 'tokens/var.png',
									w = 17,
									h = 6,
									adv = 17
								},
								cpu = {
									path = "tokens/cpu.png",
									w = 17,
									h = 6,
									adv = 17
								},
								ghz = {
									path = "tokens/ghz.png",
									w = 17,
									h = 6,
									adv = 17
								},
								gpu = {
									path = "tokens/gpu.png",
									w = 17,
									h = 6,
									adv = 17
								},
								delay = {
									path = 'tokens/delay.png',
									w = 28,
									h = 6,
									adv = 28
								}
							}
						};
						local YK, pK = {}, false;
						local CK = {
							"brand/gamesense.png",
							"brand/infinixrecode.png",
							'brand/infinix.png',
							'brand/recode.png',
							"glyphs_main/0.png",
							"glyphs_main/1.png",
							'glyphs_main/2.png',
							'glyphs_main/3.png',
							"glyphs_main/4.png",
							'glyphs_main/5.png',
							'glyphs_main/6.png',
							"glyphs_main/7.png",
							"glyphs_main/8.png",
							'glyphs_main/9.png',
							"glyphs_main/colon.png",
							'glyphs_main/dot.png',
							'glyphs_main/percent.png',
							"glyphs_main/minus.png",
							'tokens/fps.png',
							'tokens/ping.png',
							'tokens/loss.png',
							'tokens/var.png',
							"tokens/cpu.png",
							'tokens/ghz.png',
							"tokens/gpu.png",
							'tokens/delay.png'
						};
						local function rK()
							local TK, wK = pcall(require, "ffi");
							if not TK then
								return;
							end;
							pcall(function()
								local TK = wK.cast(wK.typeof('void***'), client.create_interface("filesystem_stdio.dll", 'VFileSystem017'));
								local nK = wK.cast("void (__thiscall*)(void*, const char*, const char*)", TK[0][22]);
								nK(TK, "materials\\panorama\\images\\icons\\infinix_watermark_native_inter10", "GAME");
								nK(TK, "materials\\panorama\\images\\icons\\infinix_watermark_native_inter10\\brand", 'GAME');
								nK(TK, 'materials\\panorama\\images\\icons\\infinix_watermark_native_inter10\\glyphs_main', 'GAME');
								nK(TK, "materials\\panorama\\images\\icons\\infinix_watermark_native_inter10\\tokens", "GAME");
							end);
						end;
						function QK.fetch()
							if pK then
								return;
							end;
							pK = true;
							if writefile == nil then
								return;
							end;
							rK();
							YK = {};
							local pK, rK = pcall(require, "gamesense/http");
							if (not pK) or (rK == nil) then
								return;
							end;
							for pK, pK in ipairs(CK) do
								rK.get(QK.remote .. pK, function(CK, rK)
									local TK = rK and rK.body;
									local wK = rK and rK.status;
									if ((CK == true) or (CK == 200) or (wK == 200)) and (type(TK) == "string") and (# TK > 0) then
										pcall(writefile, QK.root .. '/' .. pK, TK);
										YK = {};
									end;
								end);
							end;
						end;
						local function pK(CK, rK)
							return CK .. ':' .. rK;
						end;
						local function CK(rK)
							if (type(rK) ~= "string") or (# rK < 24) or (rK:sub(1, 8) ~= '\137\80N\71\13\10\26\n') then
								return nil;
							end;
							local TK = string.byte;
							return (TK(rK, 17) * 16777216) + (TK(rK, 18) * 65536) + (TK(rK, 19) * 256) + TK(rK, 20), (TK(rK, 21) * 16777216) + (TK(rK, 22) * 65536) + (TK(rK, 23) * 256) + TK(rK, 24);
						end;
						local function rK(TK, wK, nK)
							local uK = pK(TK, wK);
							if YK[uK] ~= nil then
								return ((YK[uK] ~= false) and YK[uK]) or nil;
							end;
							if (readfile == nil) or (renderer.load_png == nil) then
								return nil;
							end;
							local pK = readfile(QK.root .. "/" .. nK.path);
							if (type(pK) ~= 'string') or (# pK == 0) then
								YK[uK] = false;
								return nil;
							end;
							local TK, wK = CK(pK);
							if TK == nil then
								YK[uK] = false;
								return nil;
							end;
							local CK, nK = pcall(renderer.load_png, pK, TK, wK);
							if CK and nK then
								YK[uK] = {
									id = nK,
									w = TK,
									h = wK
								};
								return YK[uK];
							end;
							YK[uK] = false;
							return nil;
						end;
						local function YK(pK, CK)
							return pK[1], pK[2], pK[3], math.floor(((pK[4] or 255) * (CK or 1)) + 0.5);
						end;
						local function pK(CK, TK, wK, nK, uK, eK, JK, KK)
							KK = KK or QK.scale;
							local fK = rK(CK, TK, wK);
							if fK == nil then
								return (wK.adv or wK.w) * KK, false;
							end;
							local CK = math.floor((wK.w * KK) + 0.5);
							local TK = math.floor((wK.h * KK) + 0.5);
							local iK, UK, xK, tK = YK(eK, JK);
							pcall(infinix_dpi_texture, fK.id, nK, uK, CK, TK, iK, UK, xK, tK, 'f');
							return (wK.adv or wK.w) * KK, true;
						end;
						local function YK(CK, TK)
							local wK = 0;
							TK = TK or QK.scale;
							CK = tostring(CK or '');
							for nK = 1, # CK do
								local uK = QK.assets.glyphs[CK:sub(nK, nK)];
								if uK ~= nil then
									wK = wK + ((uK.adv or uK.w) * TK);
								end;
							end;
							return wK;
						end;
						local function CK(TK)
							if TK.kind == "brand" then
								return QK.scales.brand or QK.scale;
							end;
							if TK.kind == 'label' then
								return QK.scales.label or QK.scale;
							end;
							return QK.scales.value or QK.scale;
						end;
						local function TK(wK)
							local nK = tonumber(wK.space or wK.alpha or 1) or 1;
							if nK < 0 then
								return 0;
							end;
							if nK > 1 then
								return 1;
							end;
							return nK;
						end;
						local function wK(nK)
							if nK.kind == 'brand' then
								local uK = QK.assets.brand[nK.name];
								return (uK and ((uK.adv or uK.w) * CK(nK))) or 0;
							elseif nK.kind == "label" then
								local uK = QK.assets.tokens[nK.name];
								return (uK and ((uK.adv or uK.w) * CK(nK))) or 0;
							end;
							return YK(nK.text, CK(nK));
						end;
						local function YK(nK, uK, eK)
							if uK.tight == true then
								return 0;
							end;
							if nK == "brand" then
								return eK.gap_brand;
							end;
							if nK == "label" then
								return eK.gap_pair;
							end;
							if uK.kind == 'label' then
								return eK.gap_vl;
							end;
							return 0;
						end;
						local function nK(uK, eK, JK, KK)
							local fK = (eK.h or 0) * (KK or QK.scale);
							return math.floor(uK + ((QK.layout.h - fK) * 0.5) + QK.layout.text_shift + (JK or 0) + 0.5);
						end;
						function QK.measure(uK)
							local eK, JK, KK = 0, nil, QK.layout;
							for fK = 1, # uK do
								local iK = uK[fK];
								local uK, fK = TK(iK), YK(JK, iK, KK);
								eK = eK + (fK * uK) + (wK(iK) * uK);
								JK = iK.kind;
							end;
							return math.ceil(eK);
						end;
						function QK.ready(wK)
							for uK = 1, # wK do
								local eK = wK[uK];
								if eK.kind == "brand" then
									local wK = QK.assets.brand[eK.name];
									if wK and (rK('brand', eK.name, wK) == nil) then
										return false;
									end;
									if eK.accent_name ~= nil then
										local wK = QK.assets.brand[eK.accent_name];
										if wK and (rK('brand', eK.accent_name, wK) == nil) then
											return false;
										end;
									end;
								elseif eK.kind == "label" then
									local wK = QK.assets.tokens[eK.name];
									if wK and (rK('tokens', eK.name, wK) == nil) then
										return false;
									end;
								else
									local wK = tostring(eK.text or "");
									for uK = 1, # wK do
										local eK = wK:sub(uK, uK);
										local wK = QK.assets.glyphs[eK];
										if wK and (rK('glyphs', eK, wK) == nil) then
											return false;
										end;
									end;
								end;
							end;
							return true;
						end;
						function QK.draw_bg(rK, wK, uK, eK)
							local JK, KK, fK = QK.layout, QK.layout.h, QK.layout.fade;
							local iK = math.max(uK + (JK.pad * 2), (fK * 2) + 1);
							local uK = math.floor((118 * (eK or 1)) + 0.5);
							local JK = math.floor((70 * (eK or 1)) + 0.5);
							local UK = math.floor((105 * (eK or 1)) + 0.5);
							local eK, xK = rK + fK, iK - (fK * 2);
							infinix_dpi_gradient(rK, wK, fK, KK, 0, 0, 0, 0, 0, 0, 0, uK, true);
							infinix_dpi_rectangle(eK, wK, xK, KK, 0, 0, 0, uK);
							infinix_dpi_gradient(eK + xK, wK, fK, KK, 0, 0, 0, uK, 0, 0, 0, 0, true);
							infinix_dpi_gradient(rK, wK, fK, 1, 0, 0, 0, 0, 0, 0, 0, JK, true);
							infinix_dpi_rectangle(eK, wK, xK, 1, 0, 0, 0, JK);
							infinix_dpi_gradient(eK + xK, wK, fK, 1, 0, 0, 0, JK, 0, 0, 0, 0, true);
							infinix_dpi_gradient(rK, (wK + KK) - 1, fK, 1, 0, 0, 0, 0, 0, 0, 0, UK, true);
							infinix_dpi_rectangle(eK, (wK + KK) - 1, xK, 1, 0, 0, 0, UK);
							infinix_dpi_gradient(eK + xK, (wK + KK) - 1, fK, 1, 0, 0, 0, UK, 0, 0, 0, 0, true);
							return iK, KK;
						end;
						function QK.draw_parts(rK, wK, uK)
							local eK, JK, KK, fK = rK + QK.layout.pad, nil, QK.layout, true;
							for rK = 1, # uK do
								local iK = uK[rK];
								local rK, uK = TK(iK), YK(JK, iK, KK);
								eK = eK + (uK * rK);
								if iK.kind == "brand" then
									local YK = QK.assets.brand[iK.name];
									if YK then
										local TK = CK(iK);
										local uK = ((iK.name == "recode") and (KK.recode_y or KK.brand_y)) or KK.brand_y;
										local UK, xK = pK('brand', iK.name, YK, eK, nK(wK, YK, uK, TK), iK.color or QK.colors.text, iK.alpha, TK);
										if (iK.accent_name ~= nil) and (iK.accent_color ~= nil) then
											local YK = QK.assets.brand[iK.accent_name];
											if YK then
												local tK, tK = pK('brand', iK.accent_name, YK, eK + ((iK.accent_x or 0) * TK), nK(wK, YK, KK.recode_y or uK, TK), iK.accent_color, iK.alpha, TK);
												xK = xK and tK;
											end;
										end;
										eK = eK + (UK * rK);
										fK = fK and xK;
									end;
								elseif iK.kind == "label" then
									local YK = QK.assets.tokens[iK.name];
									if YK then
										local TK = CK(iK);
										local uK, UK = pK('tokens', iK.name, YK, eK, nK(wK, YK, KK.label_y, TK), iK.color or QK.colors.label, iK.alpha, TK);
										eK = eK + (uK * rK);
										fK = fK and UK;
									end;
								else
									local YK, TK, uK, KK = tostring(iK.text or ''), eK, 0, CK(iK);
									for CK = 1, # YK do
										local UK = YK:sub(CK, CK);
										local YK = QK.assets.glyphs[UK];
										if YK then
											local CK, xK = pK("glyphs", UK, YK, TK, nK(wK, YK, nil, KK), iK.color or QK.colors.text, iK.alpha, KK);
											TK = TK + CK;
											uK = uK + CK;
											fK = fK and xK;
										end;
									end;
									eK = eK + (uK * rK);
								end;
								JK = iK.kind;
							end;
							return fK;
						end;
						return QK;
					end)();
					client.delay_call(0.25, function()
						if A then
							A.fetch();
						end;
					end);
					function R()
						if rawget(_G, "INFINIX_WM_ON") ~= true then
							return;
						end;
						local QK = tostring(V(r) or "");
						local YK, pK = oK(QK, 560, 8);
						local CK = globals.frametime() or 0.016666666666667;
						if CK <= 0 then
							CK = 0.016666666666667;
						end;
						E = (E * 0.9) + ((1 / CK) * 0.1);
						local CK = globals.realtime() or 0;
						if ((CK - s) >= 2) or (a == 0) then
							a = E;
							s = CK;
						end;
						local E = math.floor(((globals.realtime() or 0) * 1000) + 0.5);
						local s, CK, rK, TK = pcall(client.system_time);
						if (not s) or (type(CK) ~= "number") then
							CK, rK = 0, 0;
						end;
						local s = string.format("%02d", math.floor(CK));
						local CK = string.format("%02d", math.floor(rK or 0));
						local rK = string.format("%02d", math.floor(((type(TK) == 'number') and TK) or 0));
						local TK = V(C) == true;
						local C = V(D) == true;
						g();
						p();
						local g = W();
						local W = B();
						local B = globals.frametime() or 0.016666666666667;
						if (B <= 0) or (B > 0.5) then
							B = 0.016666666666667;
						end;
						local p = H;
						N(p.fps, B, true, a);
						N(p.ping, B, true, E);
						N(p.loss, B, TK or (W >= 2), W);
						N(p.var, B, C or (g >= 5), g);
						N(p.utc, B, true, 0);
						local E = tostring(math.floor(p.fps.value_display + 0.5));
						local a = tostring(math.floor(p.ping.value_display + 0.5));
						local B = string.format('%d', math.floor(p.loss.value_display + 0.5));
						local W = string.format('%d', math.floor(p.var.value_display + 0.5));
						local H = {};
						local function C(D, N, TK, wK, nK, uK)
							local eK = _(((nK == nil) and 1) or nK);
							if eK > 0.001 then
								H[# H + 1] = {
									kind = D,
									name = N,
									text = TK,
									color = wK,
									alpha = eK,
									space = eK,
									tight = uK
								};
							end;
						end;
						local _, D, N = U();
						local TK = {
							_,
							D,
							N,
							255
						};
						C("brand", "infinix", nil, {
							A.colors.text[1],
							A.colors.text[2],
							A.colors.text[3],
							255
						}, 1);
						C("brand", "recode", nil, TK, 1, true);
						C('value', nil, E, A.colors.text, p.fps.phase);
						C('label', 'fps', nil, A.colors.label, p.fps.phase);
						C('value', nil, a, A.colors.text, p.ping.phase);
						C('label', 'ping', nil, A.colors.label, p.ping.phase);
						C("value", nil, B, A.colors.yellow, p.loss.phase);
						C("label", 'loss', nil, A.colors.label, p.loss.phase);
						local E = c(g);
						C("value", nil, W, {
							E[1],
							E[2],
							E[3],
							255
						}, p.var.phase);
						C("label", "var", nil, A.colors.label, p.var.phase);
						C("value", nil, string.format("%s:%s:%s", s, CK, rK), A.colors.text, p.utc.phase);
						local E = A.layout.h;
						local a = A.measure(H);
						local s = a + (A.layout.pad * 2);
						local _, c = WK();
						local B = V(J) or 'right';
						if (QK == '') or ((QK == "560,8") and (B == "right")) then
							YK, pK = (_ or 1920) - 4, 8;
							O(J, 'right');
							mK(r, YK, pK);
							B = "right";
						end;
						local g;
						if B == 'left' then
							g = YK;
						elseif B == "center" then
							g = YK - (s * 0.5);
						else
							g = YK - s;
						end;
						local W, p = g, pK;
						if W < 2 then
							W = 2;
						end;
						if (W + s) > (_ - 2) then
							W = (_ - 2) - s;
						end;
						if p < 2 then
							p = 2;
						end;
						if (p + E) > (c - 2) then
							p = (c - 2) - E;
						end;
						if (W ~= g) or (p ~= pK) then
							local _;
							if B == "left" then
								_ = W;
							elseif B == 'center' then
								_ = W + (s * 0.5);
							else
								_ = W + s;
							end;
							YK, pK = _, p;
							g = W;
							if lK.target ~= "wm" then
								mK(r, YK, pK);
							end;
						end;
						lK.wm_anim = lK.wm_anim or {};
						local _, c = infinix_drag_anim_xy(lK.wm_anim, g, pK, ((lK.target == "wm") and 12) or 16);
						if s > 8 then
							A.fetch();
							if not A.ready(H) then
								lK.wm_hitbox = nil;
								return;
							end;
							A.draw_bg(_, c, a, 1);
							A.draw_parts(_, c, H);
						end;
						lK.wm_hitbox = {
							x = g,
							y = pK,
							w = s,
							h = E,
							draw_x = _,
							draw_y = c
						};
						local a = (ui.is_menu_open() == true) and BK(_, c, s, E);
						local g = infinix_drag_phase(lK, 'wm_outline_phase', a or (lK.target == 'wm'), ((lK.target == 'wm') and 24) or 14);
						if g > 0.01 then
							local W = math.floor(((((lK.target == 'wm') and 150) or 95) * g) + 0.5);
							infinix_dpi_rounded_outline(_ - 2, c - 2, s + 4, E + 4, 4, 255, 255, 255, W);
						end;
						if a and (lK.target == nil) and lK.lmb_press_edge then
							local E, a = infinix_dpi_mouse_position();
							lK.target = "wm";
							local g;
							if B == 'left' then
								g = _;
							elseif B == 'center' then
								g = _ + (s * 0.5);
							else
								g = _ + s;
							end;
							lK.ox = E - g;
							lK.oy = a - c;
						end;
					end;
				end;
				do
					local E = {
						'forceshot',
						"doubletap",
						"body",
						"fakeduck",
						"pingspike",
						'mindamage',
						"hideshots",
						'dormantaimbot',
						'freestanding'
					};
					do
						local a, s = pcall(require, 'gamesense/http');
						local function _(c)
							return (type(c) == "string") and (c:sub(1, 8) == "\137\80NG\13\n\26\n");
						end;
						if a then
							pcall(function()
								local a, c = pcall(require, "ffi");
								if a then
									pcall(function()
										local a = c.cast(c.typeof("void***"), client.create_interface('filesystem_stdio.dll', 'VFileSystem017'));
										local B = c.cast("void (__thiscall*)(void*, const char*, const char*)", a[0][22]);
										B(a, 'materials\\panorama\\images\\icons\\infinix', "GAME");
									end);
								end;
								for a, a in ipairs(E) do
									local E = "csgo/materials/panorama/images/icons/infinix" .. '/' .. a .. ".png";
									local c = "https://raw.githubusercontent.com/cshhanec2/infinix/main/indicators" .. '/' .. a .. ".png";
									s.get(c, function(a, s)
										if a and s and _(s.body) and writefile then
											pcall(writefile, E, s.body);
										end;
									end);
								end;
							end);
						end;
					end;
					local function E(a)
						if (not a) or (# a < 24) then
							return nil;
						end;
						if a:sub(1, 8) ~= '\137PNG\r\x0A\26\10' then
							return nil;
						end;
						local s = string.byte;
						local _ = (s(a, 17) * 16777216) + (s(a, 18) * 65536) + (s(a, 19) * 256) + s(a, 20);
						local c = (s(a, 21) * 16777216) + (s(a, 22) * 65536) + (s(a, 23) * 256) + s(a, 24);
						return _, c;
					end;
					local a = {};
					local function s(_)
						local c = a[_];
						if c ~= nil then
							return c;
						end;
						if readfile then
							local c = 'csgo/materials/panorama/images/icons/infinix' .. '/' .. _ .. '.png';
							local B = readfile(c);
							if (B ~= nil) and (# B > 0) then
								local c, g = E(B);
								if (not c) or (not g) then
									a[_] = false;
									return false;
								end;
								local E, W = pcall(renderer.load_png, B, c, g);
								if E and W then
									local E = {
										tex = W,
										pw = c,
										ph = g
									};
									a[_] = E;
									return E;
								end;
								a[_] = false;
								return false;
							end;
							a[_] = false;
						end;
						return false;
					end;
					local E = {};
					local a = {};
					local function _(c)
						if c == nil then
							return false;
						end;
						if E[c] then
							return true;
						end;
						local B = (globals.realtime and globals.realtime()) or 0;
						local g = a[c];
						if (g ~= nil) and (B < g) then
							return false;
						end;
						if readfile == nil then
							return false;
						end;
						local g = 'csgo/materials/panorama/images/icons/infinix' .. "/" .. c .. ".png";
						local W = readfile(g);
						if (W ~= nil) and (# W > 0) then
							E[c] = true;
							a[c] = nil;
							return true;
						end;
						a[c] = B + 2;
						return false;
					end;
					local E = {
						doubletap = 47
					};
					local a = {
						255,
						255,
						255,
						70
					};
					local function c()
						local B = (globals.framecount and globals.framecount()) or 0;
						if f.get().shift then
							return 1;
						end;
						return math.min(1, B / 14);
					end;
					local B = 0;
					local function g()
						local W = c();
						local c = (globals.absoluteframetime and globals.absoluteframetime()) or (globals.frametime and globals.frametime()) or 0.0083333333333333;
						if c > 0.1 then
							c = 0.1;
						end;
						if c < 0 then
							c = 0;
						end;
						local H = 1 - math.exp(- c * 6);
						B = B + ((W - B) * H);
						if (W < 0.001) and (B < 0.005) then
							B = 0;
						end;
						if (W > 0.999) and (B > 0.995) then
							B = 1;
						end;
						return B;
					end;
					local c = {};
					local B = {};
					local function W(H, p)
						B[H] = (p and true) or nil;
					end;
					local H = - 1.0;
					local p = 0;
					local C = {};
					local function D(N, f, A)
						local QK = N .. " " .. f .. " " .. A;
						local YK = C[QK];
						if YK ~= nil then
							return YK[1], YK[2], YK[3];
						end;
						local pK, CK, rK, TK = pcall(ui.reference, N, f, A);
						if pK and (CK ~= nil) then
							YK = {
								CK,
								rK,
								TK
							};
							C[QK] = YK;
							return CK, rK, TK;
						end;
						return nil;
					end;
					local function C(N, f, A)
						local QK, YK = D(N, f, A);
						if not QK then
							return false;
						end;
						if V(QK) ~= true then
							return false;
						end;
						if YK then
							return V(YK) == true;
						end;
						return true;
					end;
					local function N(f, A, QK)
						local YK = D(f, A, QK);
						if not YK then
							return false;
						end;
						return V(YK) == true;
					end;
					local f = {
						{
							"Rage",
							"Aimbot",
							'Dormant Aimbot'
						},
						{
							"Rage",
							'Aimbot',
							'Dormant aimbot'
						},
						{
							'RAGE',
							'Aimbot',
							'Dormant Aimbot'
						},
						{
							'Rage',
							"Other",
							'Dormant Aimbot'
						},
						{
							"Rage",
							'Other',
							"Dormant aimbot"
						}
					};
					local function A(QK)
						for YK = 1, # QK do
							local pK = QK[YK];
							if C(pK[1], pK[2], pK[3]) then
								return true;
							end;
						end;
						return false;
					end;
					local function QK()
						local YK = (globals.tickcount and globals.tickcount()) or 0;
						if H == YK then
							return;
						end;
						H = YK;
						W("FST", rawget(_G, 'INFINIX_FORCE_SHOT_ACTIVE') == true);
						W('DT', C('Rage', "Aimbot", "Double tap"));
						W("BODY", N("Rage", "Aimbot", 'Force body aim'));
						W("HS", C('AA', "Other", "On shot anti-aim"));
						W('MIN_DMG', C("Rage", 'Aimbot', 'Minimum damage override'));
						W("PING", C("Misc", "Miscellaneous", 'Ping spike'));
						W('DA', A(f));
						local H = D("Rage", "Other", "Duck peek assist");
						W("DUCK", H and (V(H) == true));
						local H = false;
						if T and T.yt_en and T.yt_fs then
							H = (rawget(_G, "INFINIX_YT_ON") == true) and (rawget(_G, "INFINIX_YT_FS_ACTIVE") == true);
						end;
						if not H then
							H = C('AA', 'Anti-aimbot angles', 'Freestanding');
						end;
						W('FS', H);
					end;
					local W = {
						FST = {
							icon = 'forceshot',
							label = "force shot"
						},
						DT = {
							icon = "doubletap",
							label = "dt",
							ring = true
						},
						BODY = {
							icon = 'body',
							label = "body aim"
						},
						DUCK = {
							icon = 'fakeduck',
							label = 'fake duck'
						},
						MIN_DMG = {
							icon = 'mindamage',
							label = "min damage"
						},
						PING = {
							icon = 'pingspike',
							label = "ping spike"
						},
						DA = {
							icon = 'dormantaimbot',
							label = 'dormant aimbot'
						},
						FS = {
							icon = "freestanding",
							label = "freestanding"
						},
						HS = {
							icon = "hideshots",
							label = "hide shots"
						}
					};
					local H = {
						"FST",
						"DT",
						"BODY",
						'DUCK',
						"PING",
						"MIN_DMG",
						"HS",
						'DA',
						'FS'
					};
					local C = {
						FST = 'force shot',
						BODY = "body aim",
						DT = 'dt',
						DUCK = 'fake duck',
						MIN_DMG = 'min damage',
						PING = 'ping spike',
						FS = "freestanding",
						HS = "hide shots",
						DA = "dormant aimbot"
					};
					client.delay_call(0.4, function()
						local D = V(L);
						if (D == nil) or ((type(D) == 'table') and (# D == 0)) then
							pcall(ui.set, L, "force shot", 'body aim', 'dt', "fake duck", "min damage", 'ping spike', "freestanding", "hide shots", 'dormant aimbot');
						elseif type(D) == 'table' then
							local N = {};
							for T, T in ipairs(D) do
								N[T] = true;
							end;
							local T = false;
							if not N['force shot'] then
								D[# D + 1] = 'force shot';
								T = true;
							end;
							if not N['dormant aimbot'] then
								D[# D + 1] = "dormant aimbot";
								T = true;
							end;
							if T then
								pcall(ui.set, L, y(D));
							end;
						end;
					end);
					local y = {};
					local D = {};
					function Z()
						if rawget(_G, "INFINIX_KB_ON") ~= true then
							rawset(_G, 'INFINIX_KB_DRAW_READY', false);
							return;
						end;
						QK();
						local N = (globals.absoluteframetime and globals.absoluteframetime()) or (globals.frametime and globals.frametime()) or 0.0083333333333333;
						if N > 0.1 then
							N = 0.1;
						end;
						if N < 0 then
							N = 0;
						end;
						local T = 0;
						if rawget(_G, "INFINIX_FORCE_SHOT_APPLIED") == true then
							T = 1;
						elseif rawget(_G, "INFINIX_FORCE_SHOT_READY") == true then
							T = 0.55;
						end;
						p = p + ((T - p) * (1 - math.exp(- N * 12)));
						if (T == 0) and (p < 0.006) then
							p = 0;
						end;
						if (T == 1) and (p > 0.994) then
							p = 1;
						end;
						local T, f, A = U();
						local QK, YK, pK;
						if (f >= T) and (f >= A) then
							QK, YK, pK = 255, 220, 84;
						else
							QK = 255 + ((T - 255) * 0.45);
							YK = 255 + ((f - 255) * 0.45);
							pK = 255 + ((A - 255) * 0.45);
						end;
						local CK, rK, TK = 255, 255, 255;
						if p > 0 then
							if p < 0.55 then
								local wK = p / 0.55;
								CK = 255 + ((QK - 255) * wK);
								rK = 255 + ((YK - 255) * wK);
								TK = 255 + ((pK - 255) * wK);
							else
								local wK = (p - 0.55) / 0.45;
								CK = QK + ((T - QK) * wK);
								rK = YK + ((f - YK) * wK);
								TK = pK + ((A - pK) * wK);
							end;
						end;
						for p in pairs(y) do
							y[p] = nil;
						end;
						local p = V(L);
						if type(p) == 'table' then
							for L, L in ipairs(p) do
								y[L] = true;
							end;
						end;
						local p = ui.is_menu_open() == true;
						for L, L in ipairs(H) do
							local T = W[L];
							local f = B[L];
							local B = C[L];
							local C = (f or p) and T and T.icon and _(T.icon) and (B ~= nil) and (y[B] == true);
							local y = c[L];
							if C and (not y) then
								y = {
									phase = 0,
									target = 1
								};
								c[L] = y;
							end;
							if y then
								y.target = (C and 1) or 0;
								local B = ((y.target == 1) and 12) or 17;
								y.phase = y.phase + ((y.target - y.phase) * (1 - math.exp(- N * B)));
								if (y.target == 1) and (y.phase > 0.998) then
									y.phase = 1;
								end;
								if (y.target == 0) and (y.phase < 0.005) then
									c[L] = nil;
								end;
							end;
						end;
						local y = D;
						local B = 0;
						for C, C in ipairs(H) do
							local H = W[C];
							local W = c[C];
							if W and (W.phase > 0.005) and H and _(H.icon) then
								local _ = s(H.icon);
								if _ then
									B = B + 1;
									local s = y[B];
									if s == nil then
										s = {};
										y[B] = s;
									end;
									s.e = _;
									s.key = C;
									s.info = H;
									s.phase = W.phase;
								end;
							end;
						end;
						if B == 0 then
							rawset(_G, 'INFINIX_KB_DRAW_READY', false);
							return;
						end;
						rawset(_G, 'INFINIX_KB_DRAW_READY', true);
						local s, _ = WK();
						s = s or 1920;
						_ = _ or 1080;
						local s, c = oK(V(n), 12, math.floor(_ * 0.66));
						if (lK.target == 'kb') and lK.kb_live_y then
							c = lK.kb_live_y;
						end;
						lK.kb_anim = lK.kb_anim or {};
						local V, _ = infinix_drag_anim_xy(lK.kb_anim, s, c, ((lK.target == 'kb') and 12) or 16);
						local W = _;
						local H = 0;
						for C = 1, B do
							local B = y[C];
							local y = B.e;
							local C = B.phase;
							local D = ((C < 1) and (1 - ((1 - C) * (1 - C) * (1 - C)))) or 1;
							local C = math.floor((255 * D) + 0.5);
							local N = math.floor((- 20.0 * (1 - D)) + 0.5);
							local L = V + N;
							local N = math.floor((y.pw * 0.6) + 0.5);
							local T = math.floor((y.ph * 0.6) + 0.5);
							local f, A, QK = 255, 255, 255;
							if B.key == 'FST' then
								f = math.floor(CK + 0.5);
								A = math.floor(rK + 0.5);
								QK = math.floor(TK + 0.5);
							end;
							pcall(infinix_dpi_texture, y.tex, L, W, N, T, f, A, QK, C, 'f');
							if B.info.ring and (B.key == "DT") then
								local f = L + math.floor((N * 0.8) + 0.5);
								local L = W + math.floor((T * 0.405) + 0.5);
								local A = math.floor((T * 0.245) + 0.5);
								local T = a;
								infinix_dpi_circle_outline(f, L, T[1], T[2], T[3], math.floor((T[4] * C) / 255), A, 0, 1, 1.5);
								local a = g();
								if a > 0.005 then
									local g, T, QK = U();
									infinix_dpi_circle_outline(f, L, g, T, QK, C, A, - 90.0, a, 2.7);
								end;
							end;
							if N > H then
								H = N;
							end;
							local a = E[B.info.icon] or y.ph;
							local y = math.floor((a * 0.6) + 0.5);
							W = W + math.floor(((y + 3) * D) + 0.5);
						end;
						local y = W - _;
						lK.kb_hitbox = {
							x = s,
							y = c,
							w = H,
							h = y,
							draw_x = V,
							draw_y = _
						};
						if p and (H > 0) then
							local E = BK(V, _, H, y);
							local a = lK.target == 'kb';
							local c = infinix_drag_phase(lK, 'kb_outline_phase', E or a, (a and 24) or 14);
							if c > 0.01 then
								local B = math.floor((((a and 180) or 110) * c) + 0.5);
								infinix_dpi_rounded_outline(V - 2, _ - 2, H + 4, y + 4, 4, 255, 255, 255, B);
							end;
							if E and (not a) and lK.lmb_press_edge then
								local y, y = infinix_dpi_mouse_position();
								lK.target = 'kb';
								lK.kb_offset_y = y - _;
								lK.kb_live_y = _;
								lK.lock_x = s;
							end;
						end;
					end;
				end;
				hK[# hK + 1] = function()
					local y = rawget(_G, 'INFINIX_IND_ON') == true;
					local V = rawget(_G, "INFINIX_AL_ON") == true;
					if (not y) and (not V) then
						return;
					end;
					local E = (client.key_state and client.key_state(1) and true) or false;
					lK.lmb_press_edge = E and (not lK.lmb_last);
					lK.lmb_last = E;
					local E = q();
					if E > 0.1 then
						E = 0.1;
					end;
					if E < 0 then
						E = 0;
					end;
					local q = ui.is_menu_open() == true;
					qK = MK(qK, (q and 1) or 0, 14, E);
					cK = MK(cK, ((lK.target ~= nil) and 1) or 0, 20, E);
					local q = (((lK.target == 'wm') or (lK.target == 'osl')) and 1) or 0;
					PK = MK(PK, q, 22, E);
					if cK > 0.005 then
						G();
					end;
					if y then
						R();
						Z();
					end;
					if V then
						yK();
					end;
					if PK > 0.005 then
						local y = PK;
						local V, q, E;
						if lK.target == 'wm' then
							local a = lK.wm_hitbox;
							V = DK(a);
							if a then
								q = a.x + (a.w * 0.5);
								E = a.y + (a.h * 0.5);
							end;
						elseif lK.target == 'osl' then
							V = NK();
							local a = lK.osl_live_x or (lK.osl_hitbox and lK.osl_hitbox.x) or 0;
							local s = lK.osl_live_y or (lK.osl_hitbox and lK.osl_hitbox.y) or 0;
							local _ = (lK.osl_hitbox and lK.osl_hitbox.w) or 0;
							local c = (lK.osl_hitbox and lK.osl_hitbox.h) or 0;
							q = a + (_ * 0.5);
							E = s + (c * 0.5);
						end;
						local a;
						if V and q and E then
							a = vK(V, q, E);
						end;
						if V then
							for q, q in ipairs(V) do
								local V = q == a;
								local E, a;
								if V then
									E = math.floor((220 * y) + 0.5);
									a = math.floor((30 * y) + 0.5);
								else
									E = math.floor((120 * y) + 0.5);
									a = 0;
								end;
								GK(q.x, q.y, q.w, q.h, E, a);
							end;
						end;
					end;
					if lK.target then
						INFINIX_DRAG_BLOCK_ATTACK = true;
						G();
						local y, V = infinix_dpi_mouse_position();
						local q = client.key_state and client.key_state(1);
						if (y == nil) or (V == nil) then
							q = false;
						end;
						if not q then
							local q, E = WK();
							if lK.target == 'kb' then
								local a = lK.kb_live_y or 0;
								local s = (lK.kb_hitbox and lK.kb_hitbox.h) or 0;
								if a < 10 then
									a = 4;
								elseif (a + s) > (E - 10) then
									a = math.max(4, (E - s) - 4);
								end;
								mK(n, lK.lock_x or 12, a);
								lK.kb_live_y = nil;
								lK.kb_offset_y = nil;
							elseif lK.target == 'osl' then
								local a = lK.osl_live_x or 0;
								local s = lK.osl_live_y or 0;
								local _ = lK.osl_hitbox or {
									w = 0,
									h = 0
								};
								local c = NK();
								local B = a + ((_.w or 0) * 0.5);
								local g = s + ((_.h or 0) * 0.5);
								local W = vK(c, B, g);
								if W then
									a, s = W.x, W.y;
								else
									if a < 10 then
										a = 4;
									elseif (a + _.w) > (q - 10) then
										a = math.max(4, (q - _.w) - 4);
									end;
									if s < 10 then
										s = 4;
									elseif (s + _.h) > (E - 10) then
										s = math.max(4, (E - _.h) - 4);
									end;
								end;
								mK(e, a, s);
								lK.osl_live_x = nil;
								lK.osl_live_y = nil;
								lK.osl_offset_x = nil;
								lK.osl_offset_y = nil;
							elseif lK.target == "wm" then
								local q = lK.wm_hitbox;
								if q then
									local E = q.x + (q.w * 0.5);
									local a = q.y + (q.h * 0.5);
									local s = DK(q);
									local _ = vK(s, E, a);
									if _ then
										local E, a = LK(_);
										O(J, _.anchor);
										local O, s;
										if _.anchor == "center" then
											O = E;
											s = a - q.h;
										else
											O = E;
											s = a;
										end;
										mK(r, math.floor(O + 0.5), math.floor(s + 0.5));
									end;
								end;
							end;
							lK.target = nil;
						elseif lK.target == "kb" then
							lK.kb_live_y = V - (lK.kb_offset_y or 0);
						elseif lK.target == 'osl' then
							local q = y - (lK.osl_offset_x or 0);
							local O = V - (lK.osl_offset_y or 0);
							local E, a = WK();
							local s = lK.osl_hitbox or {
								w = 0,
								h = 0
							};
							if s.w and (s.w > 0) then
								if q < 2 then
									q = 2;
								end;
								if (q + s.w) > (E - 2) then
									q = (E - 2) - s.w;
								end;
							end;
							if s.h and (s.h > 0) then
								if O < 2 then
									O = 2;
								end;
								if (O + s.h) > (a - 2) then
									O = (a - 2) - s.h;
								end;
							end;
							lK.osl_live_x = q;
							lK.osl_live_y = O;
						else
							local q, O = y - lK.ox, V - lK.oy;
							if lK.target == "wm" then
								mK(r, q, O);
							end;
						end;
					end;
				end;
				EK[# EK + 1] = l;
			end)();
			function infinix_resolve_auto_preset()
				local y, l = pcall(require, 'gamesense/cheat_revealer');
				if (not y) or (type(l) ~= "table") or (type(l.get_cheat) ~= 'function') then
					return "default", 'revealer unavailable', 0, 0;
				end;
				local y = entity.get_local_player();
				local V = 64;
				if globals and globals.maxplayers then
					local q, O = pcall(globals.maxplayers);
					if q and (type(O) == "number") and (O > 0) then
						V = O;
					end;
				end;
				local q, O = 0, 0;
				for E = 1, V do
					do
						if E == y then
							break;
						end;
						local y = true;
						if entity.is_enemy then
							local V, a = pcall(entity.is_enemy, E);
							y = V and (a == true);
						end;
						if not y then
							break;
						end;
						local y, V = pcall(l.get_cheat, E);
						if (not y) or (type(V) ~= 'table') then
							break;
						end;
						local y = tostring(V.cheat_id or '');
						if y == "nl" then
							O = O + 1;
						elseif y == 'gs' then
							q = q + 1;
						end;
					end;
				end;
				if (O > q) and (O > 0) then
					return "anti NL", 'neverlose detected', q, O;
				end;
				if (q > O) and (q > 0) then
					return "anti GS", "gamesense detected", q, O;
				end;
				if (q > 0) and (O > 0) then
					return "default", 'mixed cheat data', q, O;
				end;
				return 'default', 'unknown cheat', q, O;
			end;
			function infinix_clone_table(y)
				if type(y) ~= "table" then
					return {};
				end;
				local l = {};
				for V, q in pairs(y) do
					l[V] = ((type(q) == 'table') and infinix_clone_table(q)) or q;
				end;
				return l;
			end;
			function infinix_make_builtin_preset(y, l)
				local V = infinix_clone_table(y);
				V.builder = infinix_clone_table(V.builder);
				V.defensive = infinix_clone_table(V.defensive);
				local y, q = V.builder, V.defensive;
				if l == 1 then
					y.global_yaw_left = - 12.0;
					y.global_yaw_right = 15;
					y.global_yaw_jitter = 'center';
					y.global_jitter_offset = 41;
					y.global_body_yaw = "jitter";
					y.global_delay_from = 4;
					y.global_delay_to = 6;
					y.standing_enabled = true;
					y.standing_yaw_left = - 9.0;
					y.standing_yaw_right = 16;
					y.standing_yaw_jitter = "center";
					y.standing_jitter_offset = 36;
					y.moving_enabled = true;
					y.moving_yaw_left = - 12.0;
					y.moving_yaw_right = 16;
					y.moving_body_yaw = "jitter";
				elseif l == 2 then
					y.global_yaw_left = - 28.0;
					y.global_yaw_right = 30;
					y.global_yaw_jitter = 'center';
					y.global_jitter_offset = 54;
					y.global_body_yaw = "jitter";
					y.global_delay_from = 3;
					y.global_delay_to = 7;
					y.standing_enabled = true;
					y.standing_yaw_left = 5;
					y.standing_yaw_right = - 5.0;
					y.standing_yaw_jitter = 'center';
					y.standing_jitter_offset = 43;
					y.moving_enabled = true;
					y.moving_yaw_left = - 21.0;
					y.moving_yaw_right = 28;
					y.air_enabled = true;
					y.air_yaw_left = - 12.0;
					y.air_yaw_right = 28;
				elseif l == 3 then
					y.global_yaw_left = - 28.0;
					y.global_yaw_right = 30;
					y.global_yaw_jitter = 'center';
					y.global_jitter_offset = 41;
					y.global_body_yaw = 'jitter';
					y.global_delay_from = 6;
					y.global_delay_to = 8;
					y.standing_enabled = true;
					y.standing_yaw_left = 28;
					y.standing_yaw_right = - 5.0;
					y.standing_body_yaw = 'jitter';
					y.air_enabled = true;
					y.air_yaw_left = 0;
					y.air_yaw_right = 15;
					y['air-crouch_enabled'] = true;
					y["air-crouch_yaw_left"] = - 12.0;
					y['air-crouch_yaw_right'] = 39;
					q.master = true;
					q.global_enabled = true;
					q.standing_enabled = true;
					q.air_enabled = true;
					q['air-crouch_enabled'] = true;
					q.global_pitch = 'static';
					q.global_pitch_off_1 = 79;
					q.global_yaw = 'left/right';
					q.global_yaw_left = - 28.0;
					q.global_yaw_right = 30;
					q.global_body_yaw = "jitter";
					q.global_delay_from = 6;
					q.global_delay_to = 8;
					q.global_force_break_lc = true;
				end;
				return {
					builder = V.builder,
					defensive = V.defensive
				};
			end;
			function infinix_make_default_aa_preset(y, l)
				local V = infinix_clone_table(y);
				V.builder = ((type(V.builder) == 'table') and infinix_clone_table(V.builder)) or {};
				V.defensive = ((type(V.defensive) == "table") and infinix_clone_table(V.defensive)) or {};
				local y = ((l == true) and "defensive") or tostring(l or 'default');
				local l = (y == "delay") or (y == 'defensive') or (y == "hidden defensive");
				local q = (y == "defensive") or (y == "hidden defensive");
				local O = y == "hidden defensive";
				local y = V.builder;
				local E = V.defensive;
				y.global_yaw_left = - 28.0;
				y.global_yaw_right = 41;
				y.global_yaw_random = 0;
				y.global_yaw_jitter = 'center';
				y.global_jitter_offset = 43;
				y.global_jitter_random = 0;
				y.global_body_yaw = 'jitter';
				y.global_body_offset = 0;
				y.global_fs_body = false;
				y.global_delay_from = (l and 6) or 1;
				y.global_delay_to = (l and 8) or 1;
				y.global_secret_delay = false;
				y.global_invert_chance = 100;
				y.standing_enabled = true;
				y.standing_yaw_left = 28;
				y.standing_yaw_right = - 5.0;
				y.standing_yaw_random = 0;
				y.standing_yaw_jitter = 'center';
				y.standing_jitter_offset = 43;
				y.standing_jitter_random = 0;
				y.standing_body_yaw = "jitter";
				y.standing_body_offset = 0;
				y.standing_fs_body = false;
				y.standing_delay_from = (l and 2) or 1;
				y.standing_delay_to = (l and 4) or 1;
				y.standing_secret_delay = false;
				y.standing_invert_chance = 50;
				y.moving_enabled = true;
				y.moving_yaw_left = - 21.0;
				y.moving_yaw_right = 25;
				y.moving_yaw_random = 0;
				y.moving_yaw_jitter = 'center';
				y.moving_jitter_offset = 34;
				y.moving_jitter_random = 0;
				y.moving_body_yaw = 'jitter';
				y.moving_body_offset = 0;
				y.moving_fs_body = false;
				y.moving_delay_from = (l and 2) or 1;
				y.moving_delay_to = (l and 3) or 1;
				y.moving_secret_delay = false;
				y.moving_invert_chance = 100;
				y["slow walk_enabled"] = true;
				y['slow walk_yaw_left'] = - 30.0;
				y['slow walk_yaw_right'] = 35;
				y["slow walk_yaw_random"] = 0;
				y["slow walk_yaw_jitter"] = 'center';
				y["slow walk_jitter_offset"] = 87;
				y["slow walk_jitter_random"] = 0;
				y['slow walk_body_yaw'] = 'jitter';
				y["slow walk_body_offset"] = 0;
				y['slow walk_fs_body'] = false;
				y['slow walk_delay_from'] = (l and 3) or 1;
				y["slow walk_delay_to"] = (l and 5) or 1;
				y['slow walk_secret_delay'] = false;
				y['slow walk_invert_chance'] = 100;
				y.crouch_enabled = true;
				y.crouch_yaw_left = - 27.0;
				y.crouch_yaw_right = 41;
				y.crouch_yaw_random = 0;
				y.crouch_yaw_jitter = "center";
				y.crouch_jitter_offset = 54;
				y.crouch_jitter_random = 0;
				y.crouch_body_yaw = 'jitter';
				y.crouch_body_offset = 0;
				y.crouch_fs_body = false;
				y.crouch_delay_from = (l and 4) or 1;
				y.crouch_delay_to = (l and 6) or 1;
				y.crouch_secret_delay = false;
				y.crouch_invert_chance = 100;
				y['move-crouch_enabled'] = true;
				y['move-crouch_yaw_left'] = - 18.0;
				y["move-crouch_yaw_right"] = 30;
				y["move-crouch_yaw_random"] = 0;
				y["move-crouch_yaw_jitter"] = 'center';
				y['move-crouch_jitter_offset'] = 54;
				y["move-crouch_jitter_random"] = 0;
				y["move-crouch_body_yaw"] = "jitter";
				y["move-crouch_body_offset"] = 0;
				y["move-crouch_fs_body"] = false;
				y['move-crouch_delay_from'] = (l and 5) or 1;
				y["move-crouch_delay_to"] = (l and 7) or 1;
				y['move-crouch_secret_delay'] = false;
				y['move-crouch_invert_chance'] = 100;
				y.air_enabled = true;
				y.air_yaw_left = - 19.0;
				y.air_yaw_right = 28;
				y.air_yaw_random = 0;
				y.air_yaw_jitter = 'center';
				y.air_jitter_offset = 41;
				y.air_jitter_random = 0;
				y.air_body_yaw = 'jitter';
				y.air_body_offset = 0;
				y.air_fs_body = false;
				y.air_delay_from = (l and 5) or 1;
				y.air_delay_to = (l and 8) or 1;
				y.air_secret_delay = false;
				y.air_invert_chance = 100;
				y['air-crouch_enabled'] = true;
				y['air-crouch_yaw_left'] = - 24.0;
				y["air-crouch_yaw_right"] = 31;
				y["air-crouch_yaw_random"] = 0;
				y['air-crouch_yaw_jitter'] = "center";
				y["air-crouch_jitter_offset"] = 54;
				y["air-crouch_jitter_random"] = 0;
				y['air-crouch_body_yaw'] = "jitter";
				y["air-crouch_body_offset"] = 0;
				y["air-crouch_fs_body"] = false;
				y["air-crouch_delay_from"] = (l and 4) or 1;
				y["air-crouch_delay_to"] = (l and 7) or 1;
				y['air-crouch_secret_delay'] = false;
				y["air-crouch_invert_chance"] = 100;
				y.shared_enabled = false;
				E.master = q;
				E.global_enabled = q;
				E.global_force_break_lc = q;
				E.global_force_break_lc_key = {
					'__hotkey__',
					'Always on',
					0
				};
				E.global_pitch = (O and 'switch') or "switch";
				E.global_pitch_off_1 = 79;
				E.global_pitch_off_2 = (O and 89) or - 77.0;
				E.global_pitch_speed = 20;
				E.global_yaw = 'left/right';
				E.global_yaw_left = - 28.0;
				E.global_yaw_right = 30;
				E.global_body_yaw = "jitter";
				E.global_body_offset = 0;
				E.global_fs_body = false;
				E.global_delay_from = (l and 6) or 1;
				E.global_delay_to = (l and 8) or 1;
				E.global_secret_delay = false;
				E.global_invert_chance = 100;
				E.standing_enabled = q;
				E.standing_force_break_lc = q;
				E.standing_force_break_lc_key = {
					'__hotkey__',
					'Always on',
					0
				};
				E.standing_pitch = 'switch';
				E.standing_pitch_off_1 = 89;
				E.standing_pitch_off_2 = (O and 79) or - 77.0;
				E.standing_pitch_speed = 20;
				E.standing_yaw = "left/right";
				E.standing_yaw_left = 28;
				E.standing_yaw_right = - 5.0;
				E.standing_body_yaw = 'jitter';
				E.standing_body_offset = 0;
				E.standing_fs_body = false;
				E.standing_delay_from = (l and 2) or 1;
				E.standing_delay_to = (l and 4) or 1;
				E.standing_secret_delay = false;
				E.standing_invert_chance = 50;
				E.moving_enabled = false;
				E.moving_force_break_lc = false;
				E.moving_force_break_lc_key = {
					"__hotkey__",
					"On hotkey",
					0
				};
				E.moving_pitch = "static";
				E.moving_pitch_off_1 = 79;
				E.moving_yaw = 'left/right';
				E.moving_yaw_left = - 21.0;
				E.moving_yaw_right = 25;
				E.moving_body_yaw = "jitter";
				E.moving_body_offset = 0;
				E.moving_fs_body = false;
				E.moving_delay_from = 1;
				E.moving_delay_to = 1;
				E.moving_secret_delay = false;
				E.moving_invert_chance = 100;
				E['slow walk_enabled'] = q;
				E["slow walk_force_break_lc"] = q;
				E['slow walk_force_break_lc_key'] = {
					"__hotkey__",
					"Always on",
					0
				};
				E["slow walk_pitch"] = "switch";
				E["slow walk_pitch_off_1"] = 80;
				E["slow walk_pitch_off_2"] = (O and 89) or - 70.0;
				E['slow walk_yaw'] = "left/right";
				E["slow walk_yaw_left"] = - 30.0;
				E["slow walk_yaw_right"] = 35;
				E['slow walk_body_yaw'] = "jitter";
				E["slow walk_body_offset"] = 0;
				E["slow walk_fs_body"] = false;
				E['slow walk_delay_from'] = (l and 3) or 1;
				E["slow walk_delay_to"] = (l and 5) or 1;
				E["slow walk_secret_delay"] = false;
				E["slow walk_invert_chance"] = 100;
				E.crouch_enabled = q;
				E.crouch_force_break_lc = q;
				E.crouch_force_break_lc_key = {
					"__hotkey__",
					'Always on',
					0
				};
				E.crouch_pitch = (O and "switch") or "static random";
				E.crouch_pitch_off_1 = (O and 81) or - 77.0;
				E.crouch_pitch_off_2 = 89;
				E.crouch_yaw = "left/right";
				E.crouch_yaw_left = - 27.0;
				E.crouch_yaw_right = 41;
				E.crouch_body_yaw = 'jitter';
				E.crouch_body_offset = 0;
				E.crouch_fs_body = false;
				E.crouch_delay_from = (l and 4) or 1;
				E.crouch_delay_to = (l and 6) or 1;
				E.crouch_secret_delay = false;
				E.crouch_invert_chance = 100;
				E["move-crouch_enabled"] = q;
				E["move-crouch_force_break_lc"] = q;
				E["move-crouch_force_break_lc_key"] = {
					"__hotkey__",
					'Always on',
					0
				};
				E["move-crouch_pitch"] = "switch";
				E['move-crouch_pitch_off_1'] = 79;
				E['move-crouch_pitch_off_2'] = (O and 89) or - 70.0;
				E['move-crouch_yaw'] = "left/right";
				E['move-crouch_yaw_left'] = - 18.0;
				E["move-crouch_yaw_right"] = 30;
				E["move-crouch_body_yaw"] = "jitter";
				E["move-crouch_body_offset"] = 0;
				E["move-crouch_fs_body"] = false;
				E["move-crouch_delay_from"] = (l and 5) or 1;
				E["move-crouch_delay_to"] = (l and 7) or 1;
				E['move-crouch_secret_delay'] = false;
				E['move-crouch_invert_chance'] = 100;
				E.air_enabled = q;
				E.air_force_break_lc = q;
				E.air_force_break_lc_key = {
					"__hotkey__",
					"Always on",
					0
				};
				E.air_pitch = (O and 'switch') or "static random";
				E.air_pitch_off_1 = 89;
				E.air_pitch_off_2 = (O and 79) or - 89.0;
				E.air_pitch_speed = 20;
				E.air_yaw = 'left/right';
				E.air_yaw_left = - 19.0;
				E.air_yaw_right = 28;
				E.air_body_yaw = 'jitter';
				E.air_body_offset = 0;
				E.air_fs_body = false;
				E.air_delay_from = (l and 5) or 1;
				E.air_delay_to = (l and 8) or 1;
				E.air_secret_delay = false;
				E.air_invert_chance = 100;
				E['air-crouch_enabled'] = q;
				E['air-crouch_force_break_lc'] = q;
				E["air-crouch_force_break_lc_key"] = {
					"__hotkey__",
					"Always on",
					0
				};
				E['air-crouch_pitch'] = (O and 'switch') or "static random";
				E['air-crouch_pitch_off_1'] = 89;
				E['air-crouch_pitch_off_2'] = (O and 79) or - 89.0;
				E['air-crouch_pitch_speed'] = 20;
				E['air-crouch_yaw'] = "left/right";
				E["air-crouch_yaw_left"] = - 24.0;
				E["air-crouch_yaw_right"] = 31;
				E["air-crouch_body_yaw"] = "jitter";
				E["air-crouch_body_offset"] = 0;
				E["air-crouch_fs_body"] = false;
				E["air-crouch_delay_from"] = (l and 4) or 1;
				E['air-crouch_delay_to'] = (l and 7) or 1;
				E['air-crouch_secret_delay'] = false;
				E["air-crouch_invert_chance"] = 100;
				E.shared_enabled = false;
				return {
					builder = V.builder,
					defensive = V.defensive
				};
			end;
			(function()
				local y = aK.config._flat;
				local l = rawget(_G, "database");
				local V, q = pcall(require, 'gamesense/clipboard');
				if not V then
					q = nil;
				end;
				local V, O = pcall(require, "gamesense/json");
				if not V then
					O = nil;
				end;
				local V, E;
				do
					local a, s = {}, {};
					for _ = 1, 64 do
						local c = string.byte('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/', _);
						a[_ - 1] = c;
						s[c] = _ - 1;
					end;
					function V(_)
						_ = tostring(_);
						local c, B, g = {}, 1, # _;
						local W = g % 3;
						for H = 1, g - W, 3 do
							local p, C, D = string.byte(_, H, H + 2);
							local H = (p * 65536) + (C * 256) + D;
							c[B] = string.char(a[bit.band(bit.rshift(H, 18), 63)], a[bit.band(bit.rshift(H, 12), 63)], a[bit.band(bit.rshift(H, 6), 63)], a[bit.band(H, 63)]);
							B = B + 1;
						end;
						if W == 2 then
							local H, p = string.byte(_, g - 1, g);
							local C = (H * 65536) + (p * 256);
							c[B] = string.char(a[bit.band(bit.rshift(C, 18), 63)], a[bit.band(bit.rshift(C, 12), 63)], a[bit.band(bit.rshift(C, 6), 63)]) .. "=";
						elseif W == 1 then
							local W = string.byte(_, g) * 65536;
							c[B] = string.char(a[bit.band(bit.rshift(W, 18), 63)], a[bit.band(bit.rshift(W, 12), 63)]) .. '==';
						end;
						return table.concat(c);
					end;
					function E(a)
						a = tostring(a):gsub("[^A-Za-z0-9+/=]", "");
						local _ = # a;
						if _ == 0 then
							return '';
						end;
						local c = ((a:sub(- 2.0) == '==') and 2) or ((a:sub(- 1.0) == '=') and 1) or 0;
						local B, g = {}, 1;
						local W = ((c > 0) and (_ - 4)) or _;
						for H = 1, W, 4 do
							local W = s[string.byte(a, H)];
							local p = s[string.byte(a, H + 1)];
							local C = s[string.byte(a, H + 2)];
							local D = s[string.byte(a, H + 3)];
							if (W == nil) or (p == nil) or (C == nil) or (D == nil) then
								return nil;
							end;
							local H = (W * 262144) + (p * 4096) + (C * 64) + D;
							B[g] = string.char(bit.band(bit.rshift(H, 16), 255), bit.band(bit.rshift(H, 8), 255), bit.band(H, 255));
							g = g + 1;
						end;
						if c == 1 then
							local W = s[string.byte(a, _ - 3)];
							local H = s[string.byte(a, _ - 2)];
							local p = s[string.byte(a, _ - 1)];
							if (W == nil) or (H == nil) or (p == nil) then
								return nil;
							end;
							local C = (W * 262144) + (H * 4096) + (p * 64);
							B[g] = string.char(bit.band(bit.rshift(C, 16), 255), bit.band(bit.rshift(C, 8), 255));
						elseif c == 2 then
							local c = s[string.byte(a, _ - 3)];
							local W = s[string.byte(a, _ - 2)];
							if (c == nil) or (W == nil) then
								return nil;
							end;
							local a = (c * 262144) + (W * 4096);
							B[g] = string.char(bit.band(bit.rshift(a, 16), 255));
						end;
						return table.concat(B);
					end;
				end;
				local function a(s)
					local _ = type(s);
					if _ == "string" then
						return "\"" .. s:gsub("\\", "\\\\"):gsub('"', "\\\""):gsub("\n", "\\n"):gsub("\r", "\\r"):gsub("\t", "\\t") .. "\"";
					elseif (_ == 'number') or (_ == "boolean") then
						return tostring(s);
					elseif _ == 'table' then
						local _ = {};
						for c, B in pairs(s) do
							_[# _ + 1] = '[' .. a(c) .. "]=" .. a(B);
						end;
						return '{' .. table.concat(_, ',') .. '}';
					end;
					return 'nil';
				end;
				local function s(_)
					if O then
						local c, B = pcall(O.stringify, _);
						if c and (type(B) == "string") then
							return B;
						end;
					end;
					return a(_);
				end;
				local function a(_)
					if (type(_) ~= 'string') or (_ == '') then
						return nil;
					end;
					if O then
						local c, B = pcall(O.parse, _);
						if c and (type(B) == 'table') then
							return B;
						end;
					end;
					local O = loadstring('return ' .. _);
					if O == nil then
						return nil;
					end;
					if setfenv ~= nil then
						pcall(setfenv, O, {});
					end;
					local _, c = pcall(O);
					if _ and (type(c) == "table") then
						return c;
					end;
					return nil;
				end;
				local function O(_)
					if _ == nil then
						return nil;
					end;
					local c, B = pcall(ui.is_menu_open, _);
					if not c then
						return nil;
					end;
					if B == 'hotkey' then
						local c, g, g, W = pcall(ui.get, _);
						if not c then
							return nil;
						end;
						return {
							'__hotkey__',
							(g or 1),
							(W or 0)
						};
					elseif B == 'color_picker' then
						local c, g, W, H, p = pcall(ui.get, _);
						if not c then
							return nil;
						end;
						return {
							(g or 0),
							(W or 0),
							(H or 0),
							(p or 255)
						};
					elseif B == "multiselect" then
						local c, B = pcall(ui.get, _);
						if (not c) or (type(B) ~= "table") then
							return nil;
						end;
						return B;
					else
						local c, B = pcall(ui.get, _);
						if not c then
							return nil;
						end;
						return B;
					end;
				end;
				local function _(c, B)
					if (c == nil) or (B == nil) then
						return;
					end;
					local g, W = pcall(ui.is_menu_open, c);
					if not g then
						return;
					end;
					if type(B) == 'string' then
						if B == "kangaroo" then
							B = 'chaos';
						elseif B == "pacan4ik" then
							B = "secret";
						end;
					end;
					if (W == 'hotkey') and (type(B) == 'table') and (B[1] == "__hotkey__") then
						local g = B[2];
						local H = g;
						if type(H) == "number" then
							H = ({
								[0] = 'Always on',
								[1] = "On hotkey",
								[2] = 'Toggle',
								[3] = 'Off hotkey'
							})[H] or "On hotkey";
						elseif type(H) ~= 'string' then
							H = 'On hotkey';
						end;
						local g = tonumber(B[3]) or 0;
						if pcall(ui.set, c, H, g) then
							return;
						end;
						if pcall(ui.set, c, H) then
							return;
						end;
						if (H == "Always on") and pcall(ui.set, c, "Always On") then
							return;
						end;
						if H == 'Always on' then
							pcall(ui.set, c, true);
						end;
						return;
					elseif W == "hotkey" then
						return;
					elseif (W == "color_picker") and (type(B) == "table") then
						pcall(ui.set, c, B[1] or 0, B[2] or 0, B[3] or 0, B[4] or 255);
					elseif (W == "multiselect") and (type(B) == "table") then
						local g = {};
						for H = 1, # B do
							if B[H] ~= "peek arrow" then
								g[# g + 1] = B[H];
							end;
						end;
						pcall(ui.set, c, g);
					elseif (W == "slider") and (type(B) == "number") then
						pcall(ui.set, c, math.floor(B + 0.5));
					else
						pcall(ui.set, c, B);
					end;
				end;
				local function c(B)
					for g = 1, # XK do
						pcall(XK[g]);
					end;
					local g = {};
					for W, H in pairs(HK) do
						if (B == nil) or B[W] then
							g[W] = {};
							for B, p in pairs(H) do
								local H = O(p);
								if H ~= nil then
									g[W][B] = H;
								end;
							end;
						end;
					end;
					return g;
				end;
				local function O(B)
					if type(B) ~= 'table' then
						return B;
					end;
					local g = B.defensive;
					if type(g) == "table" then
						local W = g.force_break_lc;
						local H = g.force_break_lc_key;
						if (W ~= nil) or (H ~= nil) then
							for p, p in ipairs(w) do
								local C = p .. "_";
								if (W ~= nil) and (g[C .. "force_break_lc"] == nil) then
									g[C .. "force_break_lc"] = W;
								end;
								if (H ~= nil) and (g[C .. "force_break_lc_key"] == nil) then
									g[C .. 'force_break_lc_key'] = H;
								end;
							end;
							g.force_break_lc = nil;
							g.force_break_lc_key = nil;
						end;
					end;
					return B;
				end;
				local function B(g, W)
					if type(g) ~= 'table' then
						return false;
					end;
					g = O(g);
					for H, p in pairs(g) do
						if (W == nil) or W[H] then
							local g = HK[H];
							if g and (type(p) == 'table') then
								for W, H in pairs(p) do
									_(g[W], H);
								end;
							end;
						end;
					end;
					rawset(_G, 'INFINIX_OVERRIDE_REFRESH_TICK', 0);
					rawset(_G, 'INFINIX_OVERRIDE_FORCE_INVALIDATE', true);
					if aa_clear_runtime_owners ~= nil then
						pcall(aa_clear_runtime_owners);
					end;
					if (NATIVE_DECISION ~= nil) and (NATIVE_DECISION.invalidate ~= nil) then
						pcall(NATIVE_DECISION.invalidate);
					end;
					if (h ~= nil) and (h.invalidate ~= nil) then
						pcall(h.invalidate);
					end;
					if (X ~= nil) and (X.clear ~= nil) then
						pcall(function()
							X:clear();
						end);
					end;
					if (I ~= nil) and (I.reset_inverter ~= nil) then
						pcall(I.reset_inverter);
					end;
					if (d ~= nil) and (d.reset_guard ~= nil) then
						pcall(d.reset_guard);
					end;
					if x ~= nil then
						pcall(x);
					end;
					pcall(VK);
					return true;
				end;
				local _ = {
					configs = {},
					version = 1
				};
				if l ~= nil then
					local g, W = pcall(l.read, 'infinix');
					if g and (type(W) == "table") then
						_ = W;
						if type(_.configs) ~= 'table' then
							_.configs = {};
						end;
						if _.version == nil then
							_.version = 1;
						end;
					end;
				end;
				if (type(_.active) ~= 'string') or (_.active == "") then
					_.active = "default";
				end;
				_.preset_mode = false;
				_.preset_name = nil;
				infinix_set_preset_mode(false);
				local function g()
					if l == nil then
						return;
					end;
					pcall(l.write, "infinix", _);
				end;
				local function W()
					if l == nil then
						return;
					end;
					pcall(l.flush);
				end;
				if (_.infinix_default_version ~= 3) or (type(_.configs.default) ~= 'table') then
					_.configs["infinix default"] = nil;

					local l = [[e1siYnVpbGRlciJdPXtbImFpci1jcm91Y2hfeWF3X3JpZ2h0Il09MTUsWyJnbG9iYWxfYm9keV9vZmZzZXQiXT0wLFsic2xvdyB3YWxrX3lhd19qaXR0ZXIiXT0iY2VudGVyIixbInNsb3cgd2Fsa195YXdfbGVmdCJdPTAsWyJzbG93IHdhbGtfaml0dGVyX3JhbmRvbSJdPTAsWyJtb3ZpbmdfZW5hYmxlZCJdPXRydWUsWyJtb3ZpbmdfeWF3X3JpZ2h0Il09MTYsWyJzbG93IHdhbGtfYm9keV95YXciXT0iaml0dGVyIixbImdsb2JhbF9kZWxheV90byJdPTYsWyJzbG93IHdhbGtfZGVsYXlfZnJvbSJdPTEsWyJzaGFyZWRfeWF3X2xlZnQiXT0wLFsiZ2xvYmFsX2RlbGF5X2Zyb20iXT00LFsibW92ZS1jcm91Y2hfeWF3X2xlZnQiXT0wLFsibW92ZS1jcm91Y2hfYm9keV9vZmZzZXQiXT0wLFsiZ2xvYmFsX2ZzX2JvZHkiXT1mYWxzZSxbIm1vdmluZ19mc19ib2R5Il09ZmFsc2UsWyJtb3Zpbmdfaml0dGVyX29mZnNldCJdPTQxLFsic2xvdyB3YWxrX2ZzX2JvZHkiXT1mYWxzZSxbImdsb2JhbF95YXdfaml0dGVyIl09ImNlbnRlciIsWyJzbG93IHdhbGtfYm9keV9vZmZzZXQiXT0wLFsic2hhcmVkX3lhd19qaXR0ZXIiXT0ib2ZmIixbInN0YW5kaW5nX3NlY3JldF9kZWxheSJdPWZhbHNlLFsiYWlyLWNyb3VjaF9ib2R5X29mZnNldCJdPTAsWyJnbG9iYWxfaml0dGVyX3JhbmRvbSJdPTAsWyJjcm91Y2hfZGVsYXlfdG8iXT00LFsiYWlyLWNyb3VjaF9mc19ib2R5Il09ZmFsc2UsWyJhaXItY3JvdWNoX2ppdHRlcl9vZmZzZXQiXT00MyxbImFpcl95YXdfaml0dGVyIl09ImNlbnRlciIsWyJzdGFuZGluZ19mc19ib2R5Il09ZmFsc2UsWyJtb3ZlLWNyb3VjaF9pbnZlcnRfY2hhbmNlIl09MTAwLFsiZ2xvYmFsX2ludmVydF9jaGFuY2UiXT0xMDAsWyJnbG9iYWxfeWF3X3JpZ2h0Il09MTUsWyJnbG9iYWxfaml0dGVyX29mZnNldCJdPTQxLFsiY3JvdWNoX2ZzX2JvZHkiXT1mYWxzZSxbImFpcl95YXdfbGVmdCJdPS0xMixbIm1vdmluZ195YXdfaml0dGVyIl09ImNlbnRlciIsWyJtb3ZpbmdfYm9keV95YXciXT0iaml0dGVyIixbInNoYXJlZF9ib2R5X3lhdyJdPSJvZmYiLFsibW92aW5nX2RlbGF5X3RvIl09MSxbImNyb3VjaF95YXdfcmlnaHQiXT0wLFsic2hhcmVkX2ZzX2JvZHkiXT1mYWxzZSxbInN0YW5kaW5nX2ppdHRlcl9vZmZzZXQiXT0zNixbInNoYXJlZF9qaXR0ZXJfcmFuZG9tIl09MCxbInN0YW5kaW5nX3lhd19yYW5kb20iXT0wLFsic2xvdyB3YWxrX3lhd19yYW5kb20iXT0wLFsiYWlyX2ppdHRlcl9vZmZzZXQiXT00MSxbImNyb3VjaF9ib2R5X3lhdyJdPSJqaXR0ZXIiLFsic2xvdyB3YWxrX3lhd19yaWdodCJdPTAsWyJtb3Zpbmdfc2VjcmV0X2RlbGF5Il09ZmFsc2UsWyJhaXItY3JvdWNoX3lhd19qaXR0ZXIiXT0iY2VudGVyIixbIm1vdmUtY3JvdWNoX2VuYWJsZWQiXT10cnVlLFsiY3JvdWNoX2JvZHlfb2Zmc2V0Il09MCxbIm1vdmUtY3JvdWNoX2RlbGF5X3RvIl09NixbInNsb3cgd2Fsa19pbnZlcnRfY2hhbmNlIl09MTAwLFsiY3JvdWNoX2ppdHRlcl9yYW5kb20iXT0wLFsiYWlyX2ludmVydF9jaGFuY2UiXT0xMDAsWyJtb3ZpbmdfeWF3X2xlZnQiXT0tMTIsWyJzdGFuZGluZ195YXdfaml0dGVyIl09ImNlbnRlciIsWyJnbG9iYWxfc2VjcmV0X2RlbGF5Il09ZmFsc2UsWyJnbG9iYWxfYm9keV95YXciXT0iaml0dGVyIixbInNoYXJlZF95YXdfcmlnaHQiXT0wLFsiY3JvdWNoX3lhd19yYW5kb20iXT0wLFsiY3JvdWNoX3lhd19qaXR0ZXIiXT0iY2VudGVyIixbImFpcl9mc19ib2R5Il09ZmFsc2UsWyJhaXJfZW5hYmxlZCJdPXRydWUsWyJjcm91Y2hfeWF3X2xlZnQiXT0wLFsibW92aW5nX2RlbGF5X2Zyb20iXT0xLFsic2xvdyB3YWxrX2RlbGF5X3RvIl09MSxbImNyb3VjaF9qaXR0ZXJfb2Zmc2V0Il09NjAsWyJzdGFuZGluZ19kZWxheV90byJdPTEsWyJzdGFuZGluZ19qaXR0ZXJfcmFuZG9tIl09MCxbImFpci1jcm91Y2hfYm9keV95YXciXT0iaml0dGVyIixbImFpci1jcm91Y2hfeWF3X3JhbmRvbSJdPTAsWyJzdGFuZGluZ19ib2R5X29mZnNldCJdPTAsWyJzdGFuZGluZ19lbmFibGVkIl09dHJ1ZSxbImFpci1jcm91Y2hfeWF3X2xlZnQiXT0tMTIsWyJzdGFuZGluZ195YXdfbGVmdCJdPS05LFsiYWlyX2JvZHlfeWF3Il09ImppdHRlciIsWyJjcm91Y2hfZW5hYmxlZCJdPXRydWUsWyJzdGFuZGluZ195YXdfcmlnaHQiXT0xNixbIm1vdmUtY3JvdWNoX2ppdHRlcl9yYW5kb20iXT0wLFsibW92ZS1jcm91Y2hfZnNfYm9keSJdPWZhbHNlLFsic2xvdyB3YWxrX3NlY3JldF9kZWxheSJdPWZhbHNlLFsibW92ZS1jcm91Y2hfYm9keV95YXciXT0iaml0dGVyIixbIm1vdmluZ195YXdfcmFuZG9tIl09MCxbIm1vdmUtY3JvdWNoX3lhd19qaXR0ZXIiXT0iY2VudGVyIixbImdsb2JhbF95YXdfbGVmdCJdPS0xMixbImFpci1jcm91Y2hfZGVsYXlfdG8iXT04LFsic3RhbmRpbmdfaW52ZXJ0X2NoYW5jZSJdPTEwMCxbImFpci1jcm91Y2hfZGVsYXlfZnJvbSJdPTUsWyJzdGFuZGluZ19ib2R5X3lhdyJdPSJqaXR0ZXIiLFsiYWlyX2ppdHRlcl9yYW5kb20iXT0wLFsibW92ZS1jcm91Y2hfZGVsYXlfZnJvbSJdPTQsWyJhaXItY3JvdWNoX2VuYWJsZWQiXT10cnVlLFsiYWlyLWNyb3VjaF9pbnZlcnRfY2hhbmNlIl09MTAwLFsiY3JvdWNoX2ludmVydF9jaGFuY2UiXT0xMDAsWyJzaGFyZWRfYm9keV9vZmZzZXQiXT0wLFsic2hhcmVkX2RlbGF5X2Zyb20iXT0xLFsibW92ZS1jcm91Y2hfc2VjcmV0X2RlbGF5Il09ZmFsc2UsWyJzbG93IHdhbGtfZW5hYmxlZCJdPXRydWUsWyJjcm91Y2hfZGVsYXlfZnJvbSJdPTIsWyJtb3ZpbmdfYm9keV9vZmZzZXQiXT0wLFsiYWlyX3lhd19yYW5kb20iXT0wLFsic2xvdyB3YWxrX2ppdHRlcl9vZmZzZXQiXT04NyxbImFpcl9kZWxheV90byJdPTgsWyJtb3ZlLWNyb3VjaF95YXdfcmlnaHQiXT0wLFsiYWlyX3NlY3JldF9kZWxheSJdPWZhbHNlLFsiZ2xvYmFsX3lhd19yYW5kb20iXT0wLFsic2hhcmVkX3lhd19yYW5kb20iXT0wLFsiYWlyLWNyb3VjaF9qaXR0ZXJfcmFuZG9tIl09MCxbInNoYXJlZF9kZWxheV90byJdPTEsWyJzaGFyZWRfZW5hYmxlZCJdPWZhbHNlLFsic2hhcmVkX2ludmVydF9jaGFuY2UiXT0xMDAsWyJhaXJfZGVsYXlfZnJvbSJdPTUsWyJtb3ZlLWNyb3VjaF95YXdfcmFuZG9tIl09MCxbIm1vdmluZ19pbnZlcnRfY2hhbmNlIl09MTAwLFsiY3JvdWNoX3NlY3JldF9kZWxheSJdPWZhbHNlLFsiYWlyX3lhd19yaWdodCJdPTE1LFsiYWlyLWNyb3VjaF9zZWNyZXRfZGVsYXkiXT1mYWxzZSxbIm1vdmluZ19qaXR0ZXJfcmFuZG9tIl09MCxbInNoYXJlZF9zZWNyZXRfZGVsYXkiXT1mYWxzZSxbInNoYXJlZF9qaXR0ZXJfb2Zmc2V0Il09MCxbInN0YW5kaW5nX2RlbGF5X2Zyb20iXT0xLFsibW92ZS1jcm91Y2hfaml0dGVyX29mZnNldCJdPTU0LFsiYWlyX2JvZHlfb2Zmc2V0Il09MH0sWyJ2aXN1YWxzIl09e1sic2NvcGVfc3BlZWQiXT0xMixbImRtZ19lbiJdPXRydWUsWyJ0cF9lbiJdPXRydWUsWyJkbWdfZm9udCJdPSJzbWFsbCIsWyJhY2NlbnRfZW4iXT1mYWxzZSxbInNjb3BlX2NvbG9yIl09e1sxXT0xNDIsWzJdPTE0OCxbM109MTg1LFs0XT0yNTV9LFsidm1fZW4iXT10cnVlLFsic2NvcGVfbGVuZ3RoIl09MTA1LFsidm1feiJdPS0xNSxbInNjb3BlX2dhcCJdPTEwLFsiZG1nX2luYWN0aXZlIl09e1sxXT0yNTUsWzJdPTI1NSxbM109MjU1LFs0XT0xNTB9LFsiZG1nX3BvcyJdPSI1LC0xMyIsWyJkbWdfYWN0aXZlIl09e1sxXT0xNTUsWzJdPTIxMyxbM109NjAsWzRdPTI1NX0sWyJ2bV95Il09MCxbInZtX29wcF9rbmlmZSJdPXRydWUsWyJzY29wZV9mYWRlIl09NzAsWyJ2bV9mb3YiXT02ODAsWyJzY29wZV9zdHlsZSJdPSJjbGFzc2ljIixbInNjb3BlX3RoaWNrIl09MSxbImZ6X3ZhbCJdPTQ1LFsic2NvcGVfZXhjbHVkZSJdPXt9LFsiYXJfc2wiXT0xNjgsWyJhcl9lbiJdPXRydWUsWyJ2bV94Il09MjUsWyJhY2NlbnRfY29sb3IiXT17WzFdPTE1NSxbMl09MjEzLFszXT02MCxbNF09MjU1fSxbInRwX2Rpc3QiXT04MSxbImRtZ19vbmx5Il09ZmFsc2UsWyJmel9lbiJdPXRydWUsWyJzY29wZV9lbiJdPXRydWV9LFsicmFnZWJvdCJdPXtbImFpbXRvb2xzX2VuYWJsZWQiXT10cnVlLFsiYWltdG9vbHNfYXdwIl09dHJ1ZSxbImFpX3BlZWtfdmlzdWFsIl09Im1pbmltYWwiLFsicHJlZF9lbmFibGVkIl09dHJ1ZSxbImFpbXRvb2xzX21vZGUiXT17WzFdPSJhdXRvIn0sWyJhaW10b29sc19kZWJ1ZyJdPWZhbHNlLFsiYWlfcGVla19lbmFibGUiXT1mYWxzZSxbImFpbXRvb2xzX3BvaW50X3NjYWxlIl09NCxbImFpX3BlZWtfZGlzdGFuY2UiXT0ibWVkaXVtIixbImFpbXRvb2xzX2xldGhhbF9tb2RlIl09ImZvcmNlIixbImFpX3BlZWtfdGFyZ2V0Il09ImN1cnJlbnQgdGhyZWF0IixbImFpX3BlZWtfa2V5Il09e1sxXT0iX19ob3RrZXlfXyIsWzJdPTEsWzNdPTZ9LFsiYWltdG9vbHNfcmVzb2x2ZXJfc3luYyJdPXRydWUsWyJhaV9wZWVrX21vZGUiXT17WzFdPSJhdXRvbWF0aWNhbGx5IHRlbGVwb3J0IGJhY2siLFsyXT0iZm9yY2UgZGVmZW5zaXZlIn0sWyJhaW10b29sc19taXNzX2JvZHlfZGFtYWdlIl09NDUsWyJkZnhfZW4iXT10cnVlLFsiYWltdG9vbHNfc3NnIl09dHJ1ZSxbImFpbXRvb2xzX3NhZmVwb2ludF9ib2R5Il09dHJ1ZSxbImFpbXRvb2xzX2F1dG8iXT10cnVlLFsibmxxc19lbiJdPXRydWUsWyJhaW10b29sc191cGRhdGVfdGlja3MiXT0yLFsiYWltdG9vbHNfaGVhZF9mYWxsYmFjayJdPXRydWUsWyJyYl9vbnNob3QiXT1mYWxzZSxbInVzbGNfZW4iXT1mYWxzZSxbImFpbXRvb2xzX21pc3NfZXNjYWxhdGlvbiJdPXRydWUsWyJhaW10b29sc19taXNzX2xpbWl0Il09MixbInJiX3dlYXBvbnMiXT17fSxbIm9zZl9lbiJdPXRydWUsWyJhaV9wZWVrX3dlYXBvbiJdPXtbMV09InNjb3V0IixbMl09ImF3cCIsWzNdPSJhdXRvIHNuaXBlciIsWzRdPSJwaXN0b2wiLFs1XT0iaGVhdnkgcGlzdG9sIn19LFsic2V0dGluZ3MiXT17WyJmeF9lbiJdPWZhbHNlLFsiYWJfZW4iXT10cnVlLFsiZnhfcGl0Y2giXT0ib2ZmIixbImZsX2VuIl09dHJ1ZSxbImZ4X3Bfc3BlZWQiXT0yMCxbImZ4X3Bfb2ZmMSJdPTAsWyJmeF9zdGF0ZXMiXT17fSxbImViX2VuIl09dHJ1ZSxbInNoX2VuIl09dHJ1ZSxbInNoX2NvbmQiXT17WzFdPSJhaXIgY3JvdWNoIGtuaWZlIixbMl09ImFpciBjcm91Y2ggemV1cyJ9LFsiY2ZfYmFzZSJdPTE0LFsiZnhfcF9vZmYyIl09MCxbImNmX2VuIl09dHJ1ZX0sWyJpbmRpY2F0b3JzIl09e1sia2JfcG9zIl09IjEyLDYxNyIsWyJrYl9saXN0Il09e1sxXT0iYm9keSBhaW0iLFsyXT0iZHQiLFszXT0iZmFrZSBkdWNrIixbNF09Im1pbiBkYW1hZ2UiLFs1XT0icGluZyBzcGlrZSIsWzZdPSJmcmVlc3RhbmRpbmciLFs3XT0iaGlkZSBzaG90cyJ9LFsid21fcG9zIl09IjE5MTcsMyIsWyJ3bV9lbiJdPXRydWUsWyJpbmRfZW4iXT10cnVlLFsid21fYW5jaG9yIl09InJpZ2h0IixbImtiX2VuIl09dHJ1ZSxbIm9zbF9wb3MiXT0iMywzIn0sWyJyZXZlYWxlciJdPXtbImNyX2Rpc3AiXT17WzFdPSJzY29yZWJvYXJkIGljb24iLFsyXT0iZmxhZyJ9LFsiY3JfaXNldCJdPXtbMV09Im11bHRpY29sb3JlZCIsWzJdPSJhbHRlcm5hdGl2ZSBubCBpY29uIn0sWyJjcl9lbiJdPWZhbHNlfSxbIm1pc2MiXT17WyJrZl9lbiJdPXRydWUsWyJiYl8xNmsiXT10cnVlLFsiYmJfYWx0Il09InNjb3V0IixbImRuX3NlbCJdPXt9LFsiZG5fZW4iXT1mYWxzZSxbImJiX2VxIl09e1sxXT0ia2V2bGFyIixbMl09ImtldmxhciArIGhlbG1ldCIsWzNdPSJkZWZ1c2Uga2l0IixbNF09ImhlIixbNV09InNtb2tlIixbNl09Im1vbG90b3YiLFs3XT0idGFzZXIifSxbImJiX2lnIl09dHJ1ZSxbImFiX2p0Il09MixbImZvX2RldHMiXT17WzFdPSJwZWVraW5nIixbMl09ImhpdCBmbGFnIn0sWyJmb19saXN0Il09e1sxXT0iYmxvb2QiLFsyXT0iYmxvb20iLFszXT0iZGVjYWxzIixbNF09InNoYWRvd3MiLFs1XT0ic3ByaXRlcyIsWzZdPSJyb3BlcyIsWzddPSJkeW5hbWljIGxpZ2h0cyIsWzhdPSJtYXAgZGV0YWlscyIsWzldPSJ3ZWFwb24gZWZmZWN0cyJ9LFsiY3RfZW4iXT10cnVlLFsicnN2X2NoYW5jZV9mbGFnIl09dHJ1ZSxbImJiX3NlYyJdPSJkZWFnbGUgLyByOCIsWyJhYl9vZmYyIl09MTAwLFsiYmJfcHJpIl09ImF3cCIsWyJhYl9haXJ3Il09MTAwLFsiZm9fZW4iXT10cnVlLFsiYWJfZ25kIl09ImNoYW9zIixbImJiX2VuIl09ZmFsc2UsWyJyY19lbiJdPXRydWUsWyJhYl9lbiJdPXRydWUsWyJkZmRfZW4iXT10cnVlLFsiYWJfb2ZmMSJdPTI5LFsiYWJfbGVhbiJdPTEwMCxbInJzdl9lbmFibGUiXT10cnVlLFsicnN2X2RlYnVnX3BhbmVsIl09dHJ1ZSxbImFiX2FpciJdPSJzdGF0aWMiLFsiYWJfb3B0cyJdPXtbMV09Im1vdmUgbGVhbiIsWzJdPSJzbW9vdGggYW5pbWZpeCJ9LFsiZm9fYWx3YXlzIl09dHJ1ZSxbInJzdl9wYW5lbF9wb3MiXT0iMjEsNDE5In0sWyJkZWZlbnNpdmUiXT17WyJnbG9iYWxfYm9keV9vZmZzZXQiXT0wLFsic2hhcmVkX3BpdGNoX29mZl8xIl09MCxbIm1vdmUtY3JvdWNoX3NlY3JldF9kZWxheSJdPWZhbHNlLFsibW92ZS1jcm91Y2hfYm9keV95YXciXT0iaml0dGVyIixbIm1vdmluZ195YXciXT0ibGVmdC9yaWdodCIsWyJzaGFyZWRfcGl0Y2hfb2ZmXzIiXT0wLFsic3RhbmRpbmdfZnNfYm9keSJdPWZhbHNlLFsiY3JvdWNoX2RlbGF5X3RvIl09NixbImdsb2JhbF9kZWxheV90byJdPTgsWyJzaGFyZWRfeWF3X2xlZnQiXT0wLFsiYWlyX3lhd3JdPSJsZWZ0L3JpZ2h0IixbImdsb2JhbF9mc19ib2R5Il09ZmFsc2UsWyJzdGFuZGluZ195YXdfc3BlZWQiXT0yMSxbInNoYXJlZF93YXlfNSJdPTAsWyJnbG9iYWxfcGl0Y2hfc3BlZWQiXT0yMCxbImFpci1jcm91Y2hfYm9keV9vZmZzZXQiXT0wLFsiYWlyX3dheV81Il09MCxbInN0YW5kaW5nX2RlbGF5X2Zyb20iXT0xLFsibW92ZS1jcm91Y2hfcGl0Y2hfb2ZmXzIiXT0wLFsic2xvdyB3YWxrX3NlY3JldF9kZWxheSJdPWZhbHNlLFsibW92aW5nX3lhd19vZmZzZXQiXT0wLFsibW92ZS1jcm91Y2hfd2F5XzEiXT0wLFsibW92ZS1jcm91Y2hfaW52ZXJ0X2NoYW5jZSJdPTEwMCxbIm1vdmluZ193YXlfMiJdPTAsWyJjcm91Y2hfcGl0Y2giXT0ic3RhdGljIixbIm1vdmUtY3JvdWNoX2ZzX2JvZHkiXT1mYWxzZSxbImFpcl93YXlfNiJdPTAsWyJzaGFyZWRfcGl0Y2hfc3BlZWQiXT0yMCxbInNsb3cgd2Fsa195YXdfb2Zmc2V0Il09MCxbIm1vdmluZ19ib2R5X3lhdyJdPSJqaXR0ZXIiLFsic3RhbmRpbmdfcGl0Y2hfb2ZmXzIiXT0wLFsibW92aW5nX2RlbGF5X3RvIl09MSxbImdsb2JhbF93YXlfNiJdPTAsWyJnbG9iYWxfeWF3X29mZnNldCJdPTAsWyJzaGFyZWRfc2VjcmV0X2RlbGF5Il09ZmFsc2UsWyJzbG93IHdhbGtfd2F5XzYiXT0wLFsibW92aW5nX3BpdGNoX3NwZWVkIl09MjAsWyJtb3Zpbmdfd2F5XzMiXT0wLFsiZ2xvYmFsX3dheV83Il09MCxbIm1vdmluZ193YXlfNiJdPTAsWyJzbG93IHdhbGtfeWF3X3JpZ2h0Il09MzUsWyJzbG93IHdhbGtfcGl0Y2hfb2ZmXzIiXT0wLFsiYWlyX2RlbGF5X3RvIl09OCxbIm1vdmluZ195YXdfcmlnaHQiXT0yNSxbInN0YW5kaW5nX3BpdGNoX29mZl8xIl09ODksWyJtb3ZlLWNyb3VjaF9kZWxheV90byJdPTgsWyJtb3ZlLWNyb3VjaF93YXlzX2N1c3RvbSJdPWZhbHNlLFsiYWlyLWNyb3VjaF9waXRjaCJdPSJzdGF0aWMiLFsibW92aW5nX3dheV83Il09MCxbInNsb3cgd2Fsa193YXlzX2NvdW50Il09MyxbInNoYXJlZF93YXlfMiJdPTAsWyJnbG9iYWxfc2VjcmV0X2RlbGF5Il09ZmFsc2UsWyJnbG9iYWxfYm9keV95YXciXT0iaml0dGVyIixbInNsb3cgd2Fsa193YXlfNyJdPTAsWyJzaGFyZWRfZGVsYXlfdG8iXT0xLFsic2xvdyB3YWxrX3lhdyJdPSJsZWZ0L3JpZ2h0IixbImFpcl9mc19ib2R5Il09ZmFsc2UsWyJzbG93IHdhbGtfd2F5c19jdXN0b20iXT1mYWxzZSxbImNyb3VjaF95YXdfbGVmdCJdPS0yNyxbIm1vdmluZ19kZWxheV9mcm9tIl09MSxbInN0YW5kaW5nX3BpdGNoX3NwZWVkIl09MjAsWyJtb3ZlLWNyb3VjaF9waXRjaF9zcGVlZCJdPTIwLFsic2hhcmVkX2F1dG9fYm9keSJdPWZhbHNlLFsic2hhcmVkX3dheV83Il09MCxbIm1vdmluZ19zZWNyZXRfZGVsYXkiXT1mYWxzZSxbIm1vdmUtY3JvdWNoX3dheV8zIl09MCxbInNsb3cgd2Fsa19hdXRvX2JvZHkiXT1mYWxzZSxbInNoYXJlZF93YXlfNCJdPTAsWyJhaXItY3JvdWNoX3lhd19sZWZ0Il09LTM0LFsiY3JvdWNoX3dheV81Il09MCxbInN0YW5kaW5nX3BpdGNoIl09InN0YXRpYyIsWyJnbG9iYWxfcGl0Y2giXT0ic3RhdGljIixbIm1vdmUtY3JvdWNoX3BpdGNoIl09InN0YXRpYyIsWyJjcm91Y2hfeWF3Il09ImxlZnQvcmlnaHQiLFsiZ2xvYmFsX3BpdGNoX29mZl8xIl09NzksWyJzaGFyZWRfeWF3Il09Im9mZiIsWyJtb3ZpbmdfYm9keV9vZmZzZXQiXT0wLFsiYWlyLWNyb3VjaF93YXlfMyJdPTAsWyJzaGFyZWRfd2F5XzMiXT0wLFsiYWlyX3lhd19zcGVlZCJdPTIwLFsiZ2xvYmFsX3BpdGNoX29mZl8yIl09MCxbInN0YW5kaW5nX3dheV81Il09LTUsWyJhaXJfZGVsYXlfZnJvbSJdPTUsWyJjcm91Y2hfcGl0Y2hfb2ZmXzIiXT0wLFsiY3JvdWNoX3dheV83Il09MCxbIm1vdmUtY3JvdWNoX3lhd19zcGVlZCJdPTIwLFsiYWlyLWNyb3VjaF9lbmFibGVkIl09dHJ1ZSxbInN0YW5kaW5nX2VuYWJsZWQiXT10cnVlLFsiY3JvdWNoX2ludmVydF9jaGFuY2UiXT0xMDAsWyJjcm91Y2hfd2F5c19jb3VudCJdPTMsWyJzaGFyZWRfZGVsYXlfZnJvbSJdPTEsWyJhaXItY3JvdWNoX3dheV80Il09MCxbInN0YW5kaW5nX3dheV80Il09MTYsWyJzbG93IHdhbGtfd2F5XzEiXT0wLFsiYWlyX2JvZHlfb2Zmc2V0Il09MCxbImdsb2JhbF95YXdfc3BlZWQiXT0yMCxbInN0YW5kaW5nX3NlY3JldF9kZWxheSJdPWZhbHNlLFsiYWlyLWNyb3VjaF93YXlfNSJdPTAsWyJjcm91Y2hfd2F5c19jdXN0b20iXT1mYWxzZSxbImZvcmNlX2JyZWFrX2xjX2tleSJdPXtbMV09Il9faG90a2V5X18iLFsyXT0wLFszXT0wfSxbInN0YW5kaW5nX2F1dG9fYm9keSJdPXRydWUsWyJtb3ZpbmdfYXV0b19ib2R5Il09ZmFsc2UsWyJtb3Zpbmdfd2F5c19jb3VudCJdPTMsWyJtb3ZlLWNyb3VjaF95YXdfb2Zmc2V0Il09MCxbIm1hc3RlciJdPXRydWUsWyJnbG9iYWxfd2F5XzUiXT0wLFsiZ2xvYmFsX2ludmVydF9jaGFuY2UiXT0xMDAsWyJjcm91Y2hfd2F5XzMiXT0wLFsibW92aW5nX2ludmVydF9jaGFuY2UiXT0xMDAsWyJjcm91Y2hfc2VjcmV0X2RlbGF5Il09ZmFsc2UsWyJtb3ZlLWNyb3VjaF9hdXRvX2JvZHkiXT1mYWxzZSxbImFpci1jcm91Y2hfc2VjcmV0X2RlbGF5Il09ZmFsc2UsWyJzdGFuZGluZ193YXlfNiJdPTEyLFsic3RhbmRpbmdfd2F5c19jdXN0b20iXT10cnVlLFsiY3JvdWNoX3dheV82Il09MCxbImdsb2JhbF95YXdfcmlnaHQiXT00MSxbInN0YW5kaW5nX3dheV8zIl09NSxbImdsb2JhbF93YXlfMSJdPTAsWyJzaGFyZWRfaW52ZXJ0X2NoYW5jZSJdPTEwMCxbImdsb2JhbF95YXciXT0ibGVmdC9yaWdodCIsWyJzbG93IHdhbGtfYm9keV9vZmZzZXQiXT0wLFsibW92ZS1jcm91Y2hfd2F5XzciXT0wLFsic2xvdyB3YWxrX3lhd19sZWZ0Il09LTMwLFsiYWlyX3dheV83Il09MCxbIm1vdmluZ19lbmFibGVkIl09ZmFsc2UsWyJnbG9iYWxfd2F5XzQiXT0wLFsibW92aW5nX3dheXNfY3VzdG9tIl09ZmFsc2UsWyJzbG93IHdhbGtfZnNfYm9keSJdPWZhbHNlLFsic2xvdyB3YWxrX2JvZHlfeWF3Il09ImppdHRlciIsWyJhaXItY3JvdWNoX2ludmVydF9jaGFuY2UiXT0xMDAsWyJjcm91Y2hfcGl0Y2hfc3BlZWQiXT0yMCxbImdsb2JhbF9hdXRvX2JvZHkiXT1mYWxzZSxbImdsb2JhbF9kZWxheV9mcm9tIl09NixbImFpcl93YXlfNCJdPTAsWyJtb3ZlLWNyb3VjaF9ib2R5X29mZnNldCJdPTAsWyJzaGFyZWRfd2F5XzYiXT0wLFsibW92aW5nX2ZzX2JvZHkiXT1mYWxzZSxbInNoYXJlZF95YXdfc3BlZWQiXT0yMCxbImFpci1jcm91Y2hfd2F5XzIiXT0wLFsiZ2xvYmFsX3dheV8yIl09MCxbImFpci1jcm91Y2hfd2F5XzEiXT0wLFsic2xvdyB3YWxrX3BpdGNoIl09InN0YXRpYyIsWyJtb3ZlLWNyb3VjaF93YXlfNiJdPTAsWyJnbG9iYWxfd2F5c19jb3VudCJdPTMsWyJzbG93IHdhbGtfd2F5XzIiXT0wLFsiZm9yY2VfYnJlYWtfbGMiXT10cnVlLFsic2xvdyB3YWxrX3lhd19zcGVlZCJdPTIwLFsiYWlyLWNyb3VjaF93YXlzX2NvdW50Il09MyxbIm1vdmluZ193YXlfNCJdPTAsWyJjcm91Y2hfeWF3X3NwZWVkIl09MjAsWyJzdGFuZGluZ195YXdfb2Zmc2V0Il09LTUsWyJhaXJfeWF3X29mZnNldCJdPTAsWyJjcm91Y2hfYm9keV95YXciXT0iaml0dGVyIixbIm1vdmluZ19waXRjaF9vZmZfMSJdPTc5LFsiY3JvdWNoX2ZzX2JvZHkiXT1mYWxzZSxbImFpcl95YXdfbGVmdCJdPS0xOSxbIm1vdmUtY3JvdWNoX2RlbGF5X2Zyb20iXT02LFsic2hhcmVkX3lhd19vZmZzZXQiXT0wLFsibW92aW5nX3lhd19zcGVlZCJdPTIwLFsic3RhbmRpbmdfYm9keV95YXciXT0iaml0dGVyIixbImNyb3VjaF95YXdfcmlnaHQiXT00MSxbIm1vdmluZ19waXRjaCJdPSJzdGF0aWMiLFsibW92ZS1jcm91Y2hfd2F5XzQiXT0wLFsibW92ZS1jcm91Y2hfeWF3Il09ImxlZnQvcmlnaHQiLFsic2xvdyB3YWxrX3BpdGNoX29mZl8xIl09ODAsWyJtb3ZlLWNyb3VjaF93YXlzX2NvdW50Il09MyxbImNyb3VjaF95YXdfb2Zmc2V0Il09MCxbImFpci1jcm91Y2hfeWF3Il09ImxlZnQvcmlnaHQiLFsiY3JvdWNoX3BpdGNoX29mZl8xIl09ODEsWyJhaXItY3JvdWNoX2F1dG9fYm9keSJdPWZhbHNlLFsic2hhcmVkX3dheXNfY291bnQiXT0zLFsibW92ZS1jcm91Y2hfZW5hYmxlZCJdPXRydWUsWyJtb3ZlLWNyb3VjaF95YXdfbGVmdCJdPS0xOCxbInNsb3cgd2Fsa193YXlfMyJdPTAsWyJzaGFyZWRfYm9keV95YXciXT0ib2ZmIixbImFpci1jcm91Y2hfd2F5c19jdXN0b20iXT1mYWxzZSxbImFpcl9pbnZlcnRfY2hhbmNlIl09MTAwLFsic2xvdyB3YWxrX3dheV81Il09MCxbImdsb2JhbF95YXdfbGVmdCJdPS0yOCxbInNoYXJlZF9waXRjaCJdPSJvZmYiLFsibW92aW5nX3lhd19sZWZ0Il09LTIxLFsic2hhcmVkX3lhd19yaWdodCJdPTAsWyJtb3ZlLWNyb3VjaF93YXlfMiJdPTAsWyJzbG93IHdhbGtfd2F5XzQiXT0wLFsic2xvdyB3YWxrX3BpdGNoX3NwZWVkIl09MjAsWyJhaXJfcGl0Y2hfb2ZmXzEiXT03OSxbInN0YW5kaW5nX3dheV8xIl09MjgsWyJzbG93IHdhbGtfaW52ZXJ0X2NoYW5jZSJdPTEwMCxbInN0YW5kaW5nX3lhdyJdPSJsZWZ0L3JpZ2h0IixbImNyb3VjaF93YXlfMiJdPTAsWyJzdGFuZGluZ19kZWxheV90byJdPTEsWyJjcm91Y2hfd2F5XzEiXT0wLFsiYWlyX2VuYWJsZWQiXT10cnVlLFsiYWlyX2F1dG9fYm9keSJdPWZhbHNlLFsic2hhcmVkX2ZzX2JvZHkiXT1mYWxzZSxbImFpcl93YXlfMiJdPTAsWyJhaXJfcGl0Y2hfb2ZmXzIiXT0wLFsic3RhbmRpbmdfeWF3X2xlZnQiXT01LFsiYWlyX2JvZHlfeWF3Il09ImppdHRlciIsWyJnbG9iYWxfZW5hYmxlZCJdPWZhbHNlLFsic3RhbmRpbmdfd2F5XzIiXT00MyxbImdsb2JhbF93YXlzX2N1c3RvbSJdPWZhbHNlLFsibW92aW5nX3BpdGNoX29mZl8yIl09MCxbImNyb3VjaF93YXlfNCJdPTAsWyJtb3ZlLWNyb3VjaF93YXlfNSJdPTAsWyJhaXJfd2F5XzMiXT0wLFsiZ2xvYmFsX3dheV8zIl09MCxbImFpcl93YXlzX2NvdW50Il09MyxbImFpci1jcm91Y2hfZGVsYXlfdG8iXT04LFsic3RhbmRpbmdfaW52ZXJ0X2NoYW5jZSJdPTUwLFsiYWlyLWNyb3VjaF9kZWxheV9mcm9tIl09NSxbInNsb3cgd2Fsa19kZWxheV9mcm9tIl09MSxbImFpci1jcm91Y2hfeWF3X29mZnNldCJdPTAsWyJhaXJfcGl0Y2hfc3BlZWQiXT0yMCxbImNyb3VjaF9lbmFibGVkIl09dHJ1ZSxbImFpcl93YXlzX2N1c3RvbSJdPWZhbHNlLFsic3RhbmRpbmdfYm9keV9vZmZzZXQiXT0wLFsic2hhcmVkX2JvZHlfb2Zmc2V0Il09MCxbInNsb3cgd2Fsa19kZWxheV90byJdPTEsWyJzdGFuZGluZ193YXlfNyJdPS0zNCxbInNsb3cgd2Fsa19lbmFibGVkIl09dHJ1ZSxbImNyb3VjaF9kZWxheV9mcm9tIl09NCxbIm1vdmluZ193YXlfMSJdPTAsWyJzaGFyZWRfd2F5XzEiXT0wLFsiY3JvdWNoX2JvZHlfb2Zmc2V0Il09MCxbImFpcl93YXlfMSJdPTAsWyJtb3ZlLWNyb3VjaF95YXdfcmlnaHQiXT0zMCxbImFpcl9zZWNyZXRfZGVsYXkiXT1mYWxzZSxbInN0YW5kaW5nX3lhd19yaWdodCJdPS01LFsiYWlyLWNyb3VjaF93YXlfNyJdPTAsWyJjcm91Y2hfYXV0b19ib2R5Il09ZmFsc2UsWyJhaXItY3JvdWNoX2JvZHlfeWF3Il09ImppdHRlciIsWyJzaGFyZWRfZW5hYmxlZCJdPWZhbHNlLFsiYWlyLWNyb3VjaF9mc19ib2R5Il09ZmFsc2UsWyJhaXItY3JvdWNoX3BpdGNoX29mZl8xIl09NzcsWyJzdGFuZGluZ193YXlzX2NvdW50Il09MyxbIm1vdmUtY3JvdWNoX3BpdGNoX29mZl8xIl09NzksWyJhaXItY3JvdWNoX3dheV82Il09MCxbImFpcl95YXdfcmlnaHQiXT0yOCxbImFpcl9waXRjaCJdPSJzdGF0aWMiLFsiYWlyLWNyb3VjaF95YXdfc3BlZWQiXT0yMCxbImFpci1jcm91Y2hfeWF3X3JpZ2h0Il09MzksWyJhaXItY3JvdWNoX3BpdGNoX3NwZWVkIl09MjAsWyJzaGFyZWRfd2F5c19jdXN0b20iXT1mYWxzZSxbImFpci1jcm91Y2hfcGl0Y2hfb2ZmXzIiXT0wLFsibW92aW5nX3dheV81Il09MH0sWyJob3RrZXlzIl09e1sieXRfZnMiXT17WzFdPSJfX2hvdGtleV9fIixbMl09MSxbM109Nn0sWyJ5dF9zdGF0aWMiXT10cnVlLFsieXRfbGVmdCJdPXtbMV09Il9faG90a2V5X18iLFsyXT0yLFszXT05MH0sWyJkZF9lbiJdPWZhbHNlLFsieXRfcmlnaHQiXT17WzFdPSJfX2hvdGtleV9fIixbMl09MixbM109ODh9LFsieXRfZnJlZXN0YW5kIl09dHJ1ZSxbInl0X2Fycm93X2Rpc3RhbmNlIl09NzIsWyJ5dF9yZXNldCJdPXtbMV09Il9faG90a2V5X18iLFsyXT0yLFszXT0wfSxbInl0X2Fycm93cyJdPSJjczIiLFsieXRfZW4iXT10cnVlLFsiZGRfaGsiXT17WzFdPSJfX2hvdGtleV9fIixbMl09MSxbM109MH0sWyJ5dF9hcnJvd19jb2xvciJdPXtbMV09MTk1LFsyXT0yMDMsWzNdPTI1NSxbNF09MjU1fX0sWyJsb2dzIl09e1sib3NsX2VuIl09dHJ1ZSxbImFsX2VuIl09dHJ1ZSxbIm9zbF9kdXIiXT00LFsiY2xfdHlwZXMiXT17WzFdPSJoaXRzIixbMl09Im1pc3NlcyIsWzNdPSJtaXNtYXRjaCIsWzRdPSJncmVuYWRlcyIsWzVdPSJkZWF0aCJ9LFsiY2xfZW4iXT10cnVlfX0=]];
					
					local l, H = pcall(E, l);   -- передаём ту же строку
					if l and H then
						local success, X = pcall(a, H);
						if success and (type(X) == 'table') then
							_.configs.default = O(X);
							_.infinix_default_version = 3;
							g();
							W();
							M(100, 200, 255, "[infinix] default preset updated");
						end;
					end;
				end;
				local l = 0;
				for O in pairs(_.configs) do
					l = l + 1;
				end;
				M(100, 200, 255, "[infinix] loaded " .. l .. " preset(s) from database");
				local function l()
					g();
					W();
				end;
				local function O(g)
					infinix_set_preset_mode(g == true);
					_.preset_mode = false;
					_.preset_name = nil;
					if aa_clear_runtime_owners ~= nil then
						pcall(aa_clear_runtime_owners);
					end;
					if (I ~= nil) and (I.reset_inverter ~= nil) then
						pcall(I.reset_inverter);
					end;
					if (d ~= nil) and (d.reset_guard ~= nil) then
						pcall(d.reset_guard);
					end;
					if (NATIVE_DECISION ~= nil) and (NATIVE_DECISION.invalidate ~= nil) then
						pcall(NATIVE_DECISION.invalidate);
					end;
					if x ~= nil then
						pcall(x);
					end;
					l();
				end;
				local function g(W)
					W = ((type(W) == "string") and W:match("^%s*(.-)%s*$")) or "default";
					if W == '' then
						W = "default";
					end;
					_.active = W;
					INFINIX_ACTIVE_CONFIG_NAME = W;
					l();
				end;
				local function W(H)
					local X = s(H);
					if not X then
						return nil;
					end;
					local s = V(X);
					if not s then
						return nil;
					end;
					return '[infinix] ' .. s;
				end;
				local function V(s)
					if type(s) ~= "string" then
						return nil;
					end;
					local H = s:match("^%[infinix%] (.+)$");
					if not H then
						return nil;
					end;
					local s = E(H);
					if not s then
						return nil;
					end;
					return a(s);
				end;
				local function E(a, ...)
					return Q(a, 'AA', "Anti-aimbot angles", ...);
				end;
				local function a(s, H)
					local X = m(s, 34);
					if H ~= nil then
						return H .. X .. '\aFFFFFFFF';
					end;
					return X;
				end;
				local s = {
					'auto',
					'default',
					"delay",
					'defensive',
					'hidden defensive',
					"anti GS",
					"anti NL"
				};
				local m = F("AA", "Fake lag");
				local H = Q(ui.new_label, "AA", "Fake lag", "preset manager" .. b(''));
				local X = Q(ui.new_listbox, "AA", 'Fake lag', "preset list" .. b(''), s);
				local p = Q(ui.new_button, 'AA', 'Fake lag', a('load', "\a9BD53CFF"), function()
				end);
				local Q = E(ui.new_textbox, "cfg name" .. b(""));
				local C = E(ui.new_button, a("create"), function()
				end);
				local D = E(ui.new_listbox, 'cfg list' .. b(""), {
					"-"
				});
				local b = E(ui.new_button, a("load", "\a9BD53CFF"), function()
				end);
				local N = E(ui.new_button, a("load aa"), function()
				end);
				local L = E(ui.new_button, a("save"), function()
				end);
				local G = E(ui.new_button, a("export"), function()
				end);
				local r = E(ui.new_button, a('import'), function()
				end);
				local T = E(ui.new_button, a('delete', '\aD95148FF'), function()
				end);
				y.cfg_name = Q;
				y.cfg_create = C;
				y.cfg_list = D;
				y.cfg_load = b;
				y.cfg_loadaa = N;
				y.cfg_save = L;
				y.cfg_export = G;
				y.cfg_import = r;
				y.cfg_delete = T;
				local E = 0;
				local function a(w)
					if (client == nil) or (client.exec == nil) then
						return;
					end;
					local n = (globals.realtime and globals.realtime()) or 0;
					if (n - E) < 0.08 then
						return;
					end;
					E = n;
					local E = "playvol buttons\button14 0.32";
					if w == "error" then
						E = 'playvol buttons\\button10 0.42';
					elseif w == 'delete' then
						E = "playvol buttons\button11 0.38";
					end;
					pcall(client.exec, E);
				end;
				local function E(w, n, e)
					if n ~= false then
						pcall(client.color_log, 155, 213, 60, '[infinix] cfg: ' .. tostring(w));
						a(e or 'ok');
					else
						pcall(client.color_log, 217, 81, 72, '[infinix] cfg error: ' .. tostring(w));
						a('error');
					end;
				end;
				local a = {};
				local function w()
					a = {
						"default"
					};
					for n in pairs(_.configs) do
						if n ~= 'default' then
							a[# a + 1] = n;
						end;
					end;
					table.sort(a, function(n, e)
						if n == 'default' then
							return true;
						end;
						if e == 'default' then
							return false;
						end;
						return n < e;
					end);
					pcall(ui.update, D, a);
				end;
				local function n()
					local e, J = pcall(ui.get, D);
					if (not e) or (type(J) ~= "number") then
						return nil;
					end;
					return a[J + 1];
				end;
				y.preset_rule = m;
				y.preset_title = H;
				y.preset_list = X;
				y.preset_load = p;
				EK[# EK + 1] = function(y)
					local a = y == 'config';
					P(m, a);
					P(H, a);
					P(X, a);
					P(p, a);
				end;
				local function y()
					return _.configs.default or c({
						builder = true,
						defensive = true
					});
				end;
				local function a(P)
					local m = infinix_make_default_aa_preset(y(), P);
					local function y(P)
						if type(P) ~= 'table' then
							return;
						end;
						for H, e in pairs(P) do
							if (type(e) == "table") and (e[1] == "__hotkey__") then
								P[H] = nil;
							elseif type(e) == "table" then
								y(e);
							end;
						end;
					end;
					y(m);
					return m;
				end;
				local function y(P, m, H)
					local e = a(H);
					if type(e) ~= 'table' then
						E('preset not found', false);
						return;
					end;
					local a = B(e, {
						builder = true,
						defensive = true
					});
					if a == false then
						E("preset load failed", false);
						return;
					end;
					O(true, P);
					pcall(i);
					local a = tostring(P or 'preset') .. " preset loaded";
					if (m ~= nil) and (m ~= "") then
						a = a .. " (" .. tostring(m) .. ")";
					end;
					E(a, true);
				end;
				local function a()
					local P, m = pcall(ui.get, X);
					if P and (type(m) == 'number') then
						return s[m + 1] or "";
					end;
					return (P and tostring(m or "")) or "";
				end;
				local function s()
					local P = a();
					if P == "auto" then
						local a, m, H, X = infinix_resolve_auto_preset();
						if a == 'default' then
							y('auto/default', m, "default");
						else
							E(('auto -> %s (%s; gs=%d, nl=%d) is not configured yet'):format(tostring(a), tostring(m), tonumber(H) or 0, tonumber(X) or 0), false);
						end;
						return;
					end;
					if P == 'default' then
						y('default', nil, "default");
						return;
					end;
					if P == "delay" then
						y("delay", nil, 'delay');
						return;
					end;
					if P == "defensive" then
						y('defensive', nil, 'defensive');
						return;
					end;
					if P == "hidden defensive" then
						y("hidden defensive", nil, "hidden defensive");
						return;
					end;
					E('preset "' .. tostring(P or '-') .. "\" is not configured yet", false);

				end;

				o(p, s);

				local function y()

					local a, s = pcall(ui.get, Q);

					s = (a and (type(s) == "string") and s:match("^%s*(.-)%s*$")) or '';

					if s == '' then

						E('enter a name', false);

						return;

					end;

					if s == "default" then
						E("can't overwrite default", false);
						return;
					end;
					if # s > 32 then
						E("name too long", false);
						return;
					end;
					if _.configs[s] then
						E(s .. ' already exists', false);
						return;
					end;
					_.configs[s] = c();
					l();
					g(s);
					pcall(ui.set, Q, "");
					w();
					E(s .. " created");
				end;
				local function a()
					local s = n();
					if (s == nil) or (s == "") then
						E("select a config", false);
						return;
					end;
					if s == 'default' then
						E('can\'t overwrite default', false);

						return;

					end;

					_.configs[s] = c();

					l();

					g(s);

					E(s .. ' saved');

				end;

				local function s(c)

					local P = n();

					if (P == nil) or (P == '') then

						E("select a config", false);

						return;

					end;

					local m = _.configs[P];

					if m == nil then

						E('config not found', false);

						return;

					end;

					local H = (c and {

						builder = true,

						defensive = true,

						hotkeys = true

					}) or nil;

					O(false);

					B(m, H);

					pcall(i);

					if not c then

						g(P);

					end;

					E(P .. ((c and " (AA only) loaded") or " loaded"));

				end;

				local function O()

					local c = n();

					if (c == nil) or (c == "") then

						E('select a config', false);

						return;

					end;

					if c == "default" then

						E("can't delete default", false);

						return;

					end;

					if _.configs[c] == nil then

						E('config not found', false);

						return;

					end;

					local P = _.active == c;

					_.configs[c] = nil;

					if P then

						g('default');

					else

						l();

					end;

					pcall(ui.set, D, 0);

					w();

					E(c .. " deleted", true, 'delete');

				end;

				local function c()

					local P = n();

					if (P == nil) or (P == '') then

						E('select a config', false);

						return;

					end;

					local m = _.configs[P];

					if m == nil then

						E("config not found", false);

						return;

					end;

					local P = W(m);

					if P == nil then

						E("encode error", false);

						return;

					end;

					if q ~= nil then

						local m = pcall(q.set, P);

						E((m and 'copied to clipboard') or "clipboard error", m);

					else

						E("clipboard module missing", false);

					end;

				end;

				local function P()

					if q == nil then

						E("clipboard module missing", false);

						return;

					end;

					local m, B = pcall(q.get);

					if (not m) or (type(B) ~= "string") or (B == '') then

						E('clipboard empty', false);

						return;

					end;

					local q = V(B);

					if q == nil then

						E("invalid config", false);

						return;

					end;

					local V, m = pcall(ui.get, Q);

					m = (V and (type(m) == 'string') and m:match("^%s*(.-)%s*$")) or '';

					if m == "" then

						local V = 1;

						repeat

							m = "imported " .. V;

							V = V + 1;

						until _.configs[m] == nil;

					end;

					if m == "default" then

						E("can't overwrite default", false);

						return;

					end;

					_.configs[m] = q;

					l();

					pcall(ui.set, Q, "");

					w();

					E(m .. " imported");

				end;

				o(C, y);

				o(L, a);

				o(b, function()

					s(false);

				end);

				o(N, function()

					s(true);

				end);

				o(T, O);

				o(G, c);

				o(r, P);

				w();

				if (_.active ~= "default") and (_.configs[_.active] ~= nil) then

					g(_.active);

				else

					INFINIX_ACTIVE_CONFIG_NAME = 'default';

				end;

				sK.config = l;

				hK.cfg_pre_save_hook = l;

			end)();

			do

				local y = nil;

				local Q = cvar.crosshair;

				local b = nil;

				local l = false;

				local V = false;

				local function q()

					if l then

						return;

					end;

					l = true;

					if Q and (b ~= nil) then

						pcall(function()

							Q:set_int(b);

						end);

					end;

				end;

				sK.splash = q;

				hK[# hK + 1] = function()

					if V then

						return;

					end;

					if y == nil then

						y = globals.realtime();

						if Q then

							local l, O = pcall(function()

								return Q:get_int();

							end);

							if l then

								b = O;

							end;

							pcall(function()

								Q:set_int(0);

							end);

						end;

					end;

					local Q = globals.realtime() - y;

					if Q > 1.8 then

						q();

						V = true;

						return;

					end;

					local y = ((Q < 0.25) and (Q / 0.25)) or ((Q > 1.4) and ((1.8 - Q) / 0.4)) or 1;

					y = math.max(0, math.min(1, y));

					local Q = math.floor(255 * y);

					local b, l = infinix_dpi_screen_size();

					infinix_dpi_rectangle(0, 0, b, l, 0, 0, 0, math.floor(110 * y));

					local V, q, O = U();

					infinix_dpi_text(b / 2, (l / 2) - 6, V, q, O, Q, "c+b", 0, "infinix recode");

					infinix_dpi_text(b / 2, (l / 2) + 10, 140, 140, 140, math.floor(180 * y), "c", 0, "enjoy freedom");

				end;

			end;

			_K[# _K + 1] = function()

				if jK ~= nil then

					jK();

				end;

			end;

			local y = 0;

			local Q = 0;

			local function b()

				local l = (globals.tickcount and globals.tickcount()) or 0;

				if l >= Q then

					Q = l + 32;

					if (Y ~= nil) and (type(Y.prune) == 'function') then

						pcall(Y.prune);

					end;

				end;

				local Q = (z and z.antiaimbot and z.antiaimbot.angles) or nil;

				if Q == nil then

					return;

				end;

				local V = ((d ~= nil) and (d.get ~= nil) and d:get()) or nil;

				local q = (OK == true) or gK(V);

				if q and (Q.freestanding_body_yaw ~= nil) then

					aa_request(AA_OWNER_GUARD, 85, 'fs body isolation', Q.freestanding_body_yaw, false);

				else

					aa_clear_owner(AA_OWNER_GUARD);

				end;

				if rawget(_G, 'INFINIX_AA_BUILDER_ACTIVE') ~= true then

					return;

				end;

				if (l - (tonumber(rawget(_G, "INFINIX_AA_BUILDER_TICK")) or 0)) > 1 then

					return;

				end;

				local V = rawget(_G, 'INFINIX_AA_BUILDER_EXPECTS');

				if (type(V) ~= "table") or (V.enabled ~= true) then

					return;

				end;

				local V = false;

				if Q.enabled ~= nil then

					local q, O = pcall(ui.get, Q.enabled);

					if q and (O ~= true) then

						V = true;

					end;

				end;

				if (not V) and (Q.yaw ~= nil) and (Q.yaw[1] ~= nil) then

					local q, O = pcall(ui.get, Q.yaw[1]);

					if q and (tostring(O or ""):lower() == 'off') then

						V = true;

					end;

				end;

				if V and (l >= y) then

					y = l + 4;

					rawset(_G, 'INFINIX_OVERRIDE_REFRESH_TICK', 0);

					rawset(_G, "INFINIX_OVERRIDE_FORCE_INVALIDATE", true);

					if (h ~= nil) and (h.invalidate ~= nil) then

						pcall(h.invalidate);

					end;

					if (NATIVE_DECISION ~= nil) and (type(NATIVE_DECISION.invalidate) == "function") then

						pcall(NATIVE_DECISION.invalidate);

					end;

					if (NATIVE_DECISION ~= nil) and (type(NATIVE_DECISION.apply_all) == "function") then

						pcall(NATIVE_DECISION.apply_all);

					end;

				end;

			end;

			zK[# zK + 1] = b;

			client.set_event_callback('setup_command', function(y)

				local Q = INFINIX_DRAG_BLOCK_ATTACK;

				INFINIX_DRAG_BLOCK_ATTACK = false;

				local b = (globals.tickcount and globals.tickcount()) or 0;

				if b <= u then

					rawset(_G, 'INFINIX_OVERRIDE_REFRESH_TICK', 0);

					if (h ~= nil) and (h.invalidate ~= nil) then

						pcall(h.invalidate);

					end;

				end;

				if y and (not Q) then

					local l = (y.in_attack == 1) or ((y.buttons ~= nil) and (bit.band(y.buttons, 1) == 1));

					if l and z.is_double_tap_active() then

						rawset(_G, "INFINIX_DT_RELAX_UNTIL", b + 48);

					end;

				end;

				for b, l in ipairs(zK) do

					hK.safe_call1(1000 + b, l, y);

				end;

				if y and bK() then

					y.force_defensive = false;

				end;

				if Q and y then

					y.in_attack = 0;

					y.in_attack2 = 0;

					if y.buttons ~= nil then

						y.buttons = bit.band(y.buttons, bit.bnot(bit.bor(1, 2048)));

					end;

				end;

			end);

			client.set_event_callback("pre_render", function()

				hK.safe_call0('pre_render.native_visibility', k);

				for y, Q in ipairs(hK.pre_render) do

					hK.safe_call0(4000 + y, Q);

				end;

			end);

			client.set_event_callback('paint', function()

				if not infinix_render_surface_ready() then

					return;

				end;

				if globals.frametime ~= nil then

					local y = globals.frametime();

					local Q = (globals.tickcount and globals.tickcount()) or 0;

					if rawget(_G, 'INFINIX_SMOOTH_MODE') == true then

						local b = rawget(_G, 'INFINIX_SMOOTH_STATE');

						if type(b) ~= 'table' then

							b = {

								ema = (y or 0),

								peak = (y or 0)

							};

							rawset(_G, 'INFINIX_SMOOTH_STATE', b);

						end;

						if (y ~= nil) and (y > 0) then

							if (b.ema == nil) or (b.ema <= 0) then

								b.ema = y;

							else

								b.ema = (b.ema * 0.92) + (y * 0.08);

							end;

							b.peak = math.max((b.peak or y) * 0.94, y);

							local l = math.max(b.ema or y, (b.peak or y) * 0.72);

							rawset(_G, "INFINIX_SMOOTH_FRAMETIME", b.ema);

							if (l > 0.0135) or (y > 0.018) then

								rawset(_G, 'INFINIX_PERF_STRESS_UNTIL', Q + 36);

								rawset(_G, "INFINIX_PERF_LEVEL", 2);

							elseif (l > 0.0095) or (y > 0.0125) then

								rawset(_G, "INFINIX_PERF_STRESS_UNTIL", Q + 24);

								if (tonumber(rawget(_G, "INFINIX_PERF_LEVEL")) or 0) < 1 then

									rawset(_G, 'INFINIX_PERF_LEVEL', 1);

								end;

							elseif Q >= (rawget(_G, "INFINIX_PERF_STRESS_UNTIL") or 0) then

								rawset(_G, "INFINIX_PERF_LEVEL", 0);

							end;

						end;

					elseif (y ~= nil) and (y > 0.02) then

						rawset(_G, "INFINIX_PERF_STRESS_UNTIL", Q + 24);

						rawset(_G, 'INFINIX_PERF_LEVEL', 2);

					elseif (y ~= nil) and (y > 0.014) then

						rawset(_G, 'INFINIX_PERF_STRESS_UNTIL', Q + 16);

						if (tonumber(rawget(_G, 'INFINIX_PERF_LEVEL')) or 0) < 1 then

							rawset(_G, "INFINIX_PERF_LEVEL", 1);

						end;

					elseif Q >= (rawget(_G, "INFINIX_PERF_STRESS_UNTIL") or 0) then

						rawset(_G, "INFINIX_PERF_LEVEL", 0);

					end;

				end;

				if ui.is_menu_open and (ui.is_menu_open() == true) then

					t(true);

				elseif K > 0 then

					t(false);

				end;

				v();

				for y, Q in ipairs(hK) do

					hK.safe_call0(5000 + y, Q);

				end;

			end);

			client.set_event_callback('paint_ui', function()

				if not infinix_render_surface_ready() then

					return;

				end;

				if ui.is_menu_open and (ui.is_menu_open() == true) then

					t(true);

					if K > 0 then

						K = K - 1;

					end;

				elseif K > 0 then

					t(false);

					K = K - 1;

				end;

				for y, Q in ipairs(_K) do

					hK.safe_call0(6000 + y, Q);

				end;

			end);

			client.set_event_callback("shutdown", function()

				S(true);

				for y, Q in pairs(sK) do

					hK.safe_call('shutdown.' .. tostring(y), Q);

				end;

			end);

			do

				local y, Q = pcall(i);

				if y then

					local y, b, l = U();

					M(y, b, l, "welcome to infinix recode");

					if type(client.delay_call) == "function" then

						pcall(client.delay_call, 0, i);

					end;

				else

					client.color_log(255, 80, 80, '[infinix] boot error: ' .. tostring(Q));

				end;

			end;

			pcall(function()

				local y = require('ffi');

				local Q = y.cast(y.typeof('void***'), client.create_interface('filesystem_stdio.dll', 'VFileSystem017'));

				local j = y.cast("void (__thiscall*)(void*, const char*, const char*)", Q[0][22]);

				j(Q, "infinix", 'GAME');

				j(Q, "infinix\resolver", "GAME");

			end);
        
