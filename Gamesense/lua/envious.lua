local bit = require("bit")
local ffi = require("ffi")
local vector = require("vector")
local antiaim_funcs = require("gamesense/antiaim_funcs")
local c_entity = require("gamesense/entity")
local http = require("gamesense/http")
local csgo_weapons = require("gamesense/csgo_weapons")
local tween=(function()local a={}local b,c,d,e,f,g,h=math.pow,math.sin,math.cos,math.pi,math.sqrt,math.abs,math.asin;local function i(j,k,l,m)return l*j/m+k end;local function n(j,k,l,m)return l*b(j/m,2)+k end;local function o(j,k,l,m)j=j/m;return-l*j*(j-2)+k end;local function p(j,k,l,m)j=j/m*2;if j<1 then return l/2*b(j,2)+k end;return-l/2*((j-1)*(j-3)-1)+k end;local function q(j,k,l,m)if j<m/2 then return o(j*2,k,l/2,m)end;return n(j*2-m,k+l/2,l/2,m)end;local function r(j,k,l,m)return l*b(j/m,3)+k end;local function s(j,k,l,m)return l*(b(j/m-1,3)+1)+k end;local function t(j,k,l,m)j=j/m*2;if j<1 then return l/2*j*j*j+k end;j=j-2;return l/2*(j*j*j+2)+k end;local function u(j,k,l,m)if j<m/2 then return s(j*2,k,l/2,m)end;return r(j*2-m,k+l/2,l/2,m)end;local function v(j,k,l,m)return l*b(j/m,4)+k end;local function w(j,k,l,m)return-l*(b(j/m-1,4)-1)+k end;local function x(j,k,l,m)j=j/m*2;if j<1 then return l/2*b(j,4)+k end;return-l/2*(b(j-2,4)-2)+k end;local function y(j,k,l,m)if j<m/2 then return w(j*2,k,l/2,m)end;return v(j*2-m,k+l/2,l/2,m)end;local function z(j,k,l,m)return l*b(j/m,5)+k end;local function A(j,k,l,m)return l*(b(j/m-1,5)+1)+k end;local function B(j,k,l,m)j=j/m*2;if j<1 then return l/2*b(j,5)+k end;return l/2*(b(j-2,5)+2)+k end;local function C(j,k,l,m)if j<m/2 then return A(j*2,k,l/2,m)end;return z(j*2-m,k+l/2,l/2,m)end;local function D(j,k,l,m)return-l*d(j/m*e/2)+l+k end;local function E(j,k,l,m)return l*c(j/m*e/2)+k end;local function F(j,k,l,m)return-l/2*(d(e*j/m)-1)+k end;local function G(j,k,l,m)if j<m/2 then return E(j*2,k,l/2,m)end;return D(j*2-m,k+l/2,l/2,m)end;local function H(j,k,l,m)if j==0 then return k end;return l*b(2,10*(j/m-1))+k-l*0.001 end;local function I(j,k,l,m)if j==m then return k+l end;return l*1.001*(-b(2,-10*j/m)+1)+k end;local function J(j,k,l,m)if j==0 then return k end;if j==m then return k+l end;j=j/m*2;if j<1 then return l/2*b(2,10*(j-1))+k-l*0.0005 end;return l/2*1.0005*(-b(2,-10*(j-1))+2)+k end;local function K(j,k,l,m)if j<m/2 then return I(j*2,k,l/2,m)end;return H(j*2-m,k+l/2,l/2,m)end;local function L(j,k,l,m)return-l*(f(1-b(j/m,2))-1)+k end;local function M(j,k,l,m)return l*f(1-b(j/m-1,2))+k end;local function N(j,k,l,m)j=j/m*2;if j<1 then return-l/2*(f(1-j*j)-1)+k end;j=j-2;return l/2*(f(1-j*j)+1)+k end;local function O(j,k,l,m)if j<m/2 then return M(j*2,k,l/2,m)end;return L(j*2-m,k+l/2,l/2,m)end;local function P(Q,R,l,m)Q,R=Q or m*0.3,R or 0;if R<g(l)then return Q,l,Q/4 end;return Q,R,Q/(2*e)*h(l/R)end;local function S(j,k,l,m,R,Q)local T;if j==0 then return k end;j=j/m;if j==1 then return k+l end;Q,R,T=P(Q,R,l,m)j=j-1;return-(R*b(2,10*j)*c((j*m-T)*2*e/Q))+k end;local function U(j,k,l,m,R,Q)local T;if j==0 then return k end;j=j/m;if j==1 then return k+l end;Q,R,T=P(Q,R,l,m)return R*b(2,-10*j)*c((j*m-T)*2*e/Q)+l+k end;local function V(j,k,l,m,R,Q)local T;if j==0 then return k end;j=j/m*2;if j==2 then return k+l end;Q,R,T=P(Q,R,l,m)j=j-1;if j<0 then return-0.5*R*b(2,10*j)*c((j*m-T)*2*e/Q)+k end;return R*b(2,-10*j)*c((j*m-T)*2*e/Q)*0.5+l+k end;local function W(j,k,l,m,R,Q)if j<m/2 then return U(j*2,k,l/2,m,R,Q)end;return S(j*2-m,k+l/2,l/2,m,R,Q)end;local function X(j,k,l,m,T)T=T or 1.70158;j=j/m;return l*j*j*((T+1)*j-T)+k end;local function Y(j,k,l,m,T)T=T or 1.70158;j=j/m-1;return l*(j*j*((T+1)*j+T)+1)+k end;local function Z(j,k,l,m,T)T=(T or 1.70158)*1.525;j=j/m*2;if j<1 then return l/2*j*j*((T+1)*j-T)+k end;j=j-2;return l/2*(j*j*((T+1)*j+T)+2)+k end;local function _(j,k,l,m,T)if j<m/2 then return Y(j*2,k,l/2,m,T)end;return X(j*2-m,k+l/2,l/2,m,T)end;local function a0(j,k,l,m)j=j/m;if j<1/2.75 then return l*7.5625*j*j+k end;if j<2/2.75 then j=j-1.5/2.75;return l*(7.5625*j*j+0.75)+k elseif j<2.5/2.75 then j=j-2.25/2.75;return l*(7.5625*j*j+0.9375)+k end;j=j-2.625/2.75;return l*(7.5625*j*j+0.984375)+k end;local function a1(j,k,l,m)return l-a0(m-j,0,l,m)+k end;local function a2(j,k,l,m)if j<m/2 then return a1(j*2,0,l,m)*0.5+k end;return a0(j*2-m,0,l,m)*0.5+l*.5+k end;local function a3(j,k,l,m)if j<m/2 then return a0(j*2,k,l/2,m)end;return a1(j*2-m,k+l/2,l/2,m)end;a.easing={linear=i,inQuad=n,outQuad=o,inOutQuad=p,outInQuad=q,inCubic=r,outCubic=s,inOutCubic=t,outInCubic=u,inQuart=v,outQuart=w,inOutQuart=x,outInQuart=y,inQuint=z,outQuint=A,inOutQuint=B,outInQuint=C,inSine=D,outSine=E,inOutSine=F,outInSine=G,inExpo=H,outExpo=I,inOutExpo=J,outInExpo=K,inCirc=L,outCirc=M,inOutCirc=N,outInCirc=O,inElastic=S,outElastic=U,inOutElastic=V,outInElastic=W,inBack=X,outBack=Y,inOutBack=Z,outInBack=_,inBounce=a1,outBounce=a0,inOutBounce=a2,outInBounce=a3}local function a4(a5,a6,a7)a7=a7 or a6;local a8=getmetatable(a6)if a8 and getmetatable(a5)==nil then setmetatable(a5,a8)end;for a9,aa in pairs(a6)do if type(aa)=="table"then a5[a9]=a4({},aa,a7[a9])else a5[a9]=a7[a9]end end;return a5 end;local function ab(ac,ad,ae)ae=ae or{}local af,ag;for a9,ah in pairs(ad)do af,ag=type(ah),a4({},ae)table.insert(ag,tostring(a9))if af=="number"then assert(type(ac[a9])=="number","Parameter '"..table.concat(ag,"/").."' is missing from subject or isn't a number")elseif af=="table"then ab(ac[a9],ah,ag)else assert(af=="number","Parameter '"..table.concat(ag,"/").."' must be a number or table of numbers")end end end;local function ai(aj,ac,ad,ak)assert(type(aj)=="number"and aj>0,"duration must be a positive number. Was "..tostring(aj))local al=type(ac)assert(al=="table"or al=="userdata","subject must be a table or userdata. Was "..tostring(ac))assert(type(ad)=="table","target must be a table. Was "..tostring(ad))assert(type(ak)=="function","easing must be a function. Was "..tostring(ak))ab(ac,ad)end;local function am(ak)ak=ak or"linear"if type(ak)=="string"then local an=ak;ak=a.easing[an]if type(ak)~="function"then error("The easing function name '"..an.."' is invalid")end end;return ak end;local function ao(ac,ad,ap,aq,aj,ak)local j,k,l,m;for a9,aa in pairs(ad)do if type(aa)=="table"then ao(ac[a9],aa,ap[a9],aq,aj,ak)else j,k,l,m=aq,ap[a9],aa-ap[a9],aj;ac[a9]=ak(j,k,l,m)end end end;local ar={}local as={__index=ar}function ar:set(aq)assert(type(aq)=="number","clock must be a positive number or 0")self.initial=self.initial or a4({},self.target,self.subject)self.clock=aq;if self.clock<=0 then self.clock=0;a4(self.subject,self.initial)elseif self.clock>=self.duration then self.clock=self.duration;a4(self.subject,self.target)else ao(self.subject,self.target,self.initial,self.clock,self.duration,self.easing)end;return self.clock>=self.duration end;function ar:reset()return self:set(0)end;function ar:update(at)assert(type(at)=="number","dt must be a number")return self:set(self.clock+at)end;function a.new(aj,ac,ad,ak)ak=am(ak)ai(aj,ac,ad,ak)return setmetatable({duration=aj,subject=ac,target=ad,easing=ak,clock=0},as)end;return a end)()

local tween_table = {}
local tween_data = {
    fake_amount = 0,
}

local lua_refs = {
    username = (database.read('enviousbase_wtf^^') ~= nil) and database.read('enviousbase_wtf^^').username or "unnamed",
    symbols = { "A", "a", "B", "b", "C", "c", "D", "d", "E", "e", "F", "f", "G", "g", "H", "h", "I", "i", "J", "j", "K", "k", "L", "l", "M", "m", "N", "n", "O", "o", "P", "p", "Q", "q", "R", "r", "S", "s", "T", "t", "U", "u", "V", "v", "W", "w", "X", "x", "Y", "y", "Z", "z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "`", "~", ";", ":", "{", "}", "'", "/", "?", ".", ">", ",", "<" },
    states_names = { "Stand", "Move", "Walk", "Air", "Air duck", "Duck", "Crawl" },
    states_spaces = { "", " ", "  ", "   ", "    ", "     ", "      " },
    way_tooltip = { },
    tick_tooltip = { },
    yaw_tooltip = { },
    fake_tooltip = { },
}
for a=3, 12 do lua_refs.way_tooltip[a] = a.."-Way" end
for a=0, 128 do lua_refs.tick_tooltip[a] = a.."t" end
for a=-180, 180 do lua_refs.yaw_tooltip[a] = a.."°" end
for a=0, 60 do lua_refs.fake_tooltip[a] = a.."°" end

local refs = {
    aa = {
        pitch = ui.reference("AA","Anti-aimbot angles","Pitch"),
        yaw_target = ui.reference("AA","Anti-aimbot angles","Yaw Base"),
        yaw = { ui.reference("AA","Anti-aimbot angles","Yaw") },
        jyaw = { ui.reference("AA","Anti-aimbot angles","Yaw Jitter") },
        byaw = { ui.reference("AA","Anti-aimbot angles","Body yaw") },
        fs_body_yaw = ui.reference("AA","Anti-aimbot angles","Freestanding body yaw"),
        edge_yaw = ui.reference("AA","Anti-aimbot angles","Edge yaw"),
        fs = { ui.reference("AA","Anti-aimbot angles","Freestanding") },
        roll_aa = ui.reference("AA","Anti-aimbot angles","Roll"),
        leg_move = ui.reference("AA","Other","Leg movement"),
        fake_peek = { ui.reference("AA","Other","Fake peek") },
    },
    g = {
        rage_box = { ui.reference("RAGE", "Aimbot", "Enabled") },
        dt = { ui.reference("RAGE", "Aimbot", "Double tap") },
        os_aa = { ui.reference("AA","Other","On shot anti-aim") },
        fl_limit = ui.reference("AA","Fake lag","Limit"),
        fake_duck = ui.reference("RAGE","Other","Duck peek assist"),
        slowwalk = { ui.reference("AA","Other","Slow motion") },
        menu_color = ui.reference("MISC","Settings","Menu color"),
    },
}

local cmd_debug = { }

local vars = {
    last_press = 0,
    m1_time = 0,
    dt_time = 0,
    jitter_bool = true,
    jitter_value = 1,
    fake_amount = 0,
    was_charged = false,
    view_yaw = 0,
    air_ticks = 0,
    sidemove = 0,
    forwardmove = 0,
    classnames = { "CWorld", "CCSPlayer", "CFuncBrush" },
    mapname = "unknown",
    aa = {
        antiaim_ticks = 1,
        pervious_randomize = 1,
        randomize = 1,
        yaw_amount = 0,
        safe_head_amount = 0,
        pervious_yaw = 0,
        body_amount = 0,
        default_side = 1,
    },
    breaker = {
        yaw = 0,
        side = 1,
        cmd = 0,
        defensive = 0,
        defensive_check = 0,
        last_sim_time = 0,
        defensive_until = 0,
        lag_record = { },
    },
}

local rgb_to_hex = (function(r, g, b, a)
    return ('\a%02X%02X%02X%02X'):format(r, g, b, a or 255)
end)

local envious = { 
    tab = ui.new_combobox("AA", "Anti-aimbot angles", "Tab", "Anti-Aim", "Visuals", "Other", "Config"),
    start = { },
    anti_aim = { },
    visual = { },
    other = { },
    config = { }
}
envious.start.a = ui.new_label("AA", "Anti-aimbot angles", "Welcome to "..rgb_to_hex(ui.get(refs.g.menu_color)).."Envious")
envious.start.b = ui.new_label("AA", "Anti-aimbot angles", "Logged as "..rgb_to_hex(ui.get(refs.g.menu_color))..lua_refs.username)
envious.start.c = ui.new_label("AA", "Anti-aimbot angles", "Loading"..rgb_to_hex(ui.get(refs.g.menu_color))..".")
envious.start.d = ui.new_label("AA", "Anti-aimbot angles", "Loading"..rgb_to_hex(ui.get(refs.g.menu_color)).."..")
envious.start.e = ui.new_label("AA", "Anti-aimbot angles", "Loading"..rgb_to_hex(ui.get(refs.g.menu_color)).."...")
envious.start.f = globals.curtime()

envious.anti_aim.aa_state = ui.new_combobox("AA", "Anti-aimbot angles", "Preset", lua_refs.states_names)
envious.anti_aim.aa = { }
for a=1, 7 do
    envious.anti_aim.aa[lua_refs.states_names[a]] = {
        yaw_base = ui.new_combobox("AA", "Anti-aimbot angles", "Yaw base"..lua_refs.states_spaces[a], "Default", "Slow"),
        yaw_left = ui.new_slider("AA", "Anti-aimbot angles", "Yaw [left]"..lua_refs.states_spaces[a], -180, 180, 0, true, "", 1, lua_refs.yaw_tooltip),
        yaw_right = ui.new_slider("AA", "Anti-aimbot angles", "Yaw [right]"..lua_refs.states_spaces[a], -180, 180, 0, true, "", 1, lua_refs.yaw_tooltip),
        yaw_center = ui.new_slider("AA", "Anti-aimbot angles", "Yaw [center]"..lua_refs.states_spaces[a], -180, 180, 0, true, "", 1, lua_refs.yaw_tooltip),
        jyaw = ui.new_combobox("AA", "Anti-aimbot angles", "Jitter yaw"..lua_refs.states_spaces[a], "Center", "N-Way", "New-Era", "S-Mode", "Blade"),
        n_way = ui.new_slider("AA", "Anti-aimbot angles", "\nWay amount"..lua_refs.states_spaces[a], 3, 12, 5, true, "", 1, lua_refs.way_tooltip),
        jyaw_add = ui.new_slider("AA", "Anti-aimbot angles", "\nJitter yaw amount"..lua_refs.states_spaces[a], -180, 180, 0, true, "", 1, lua_refs.yaw_tooltip),
        byaw = ui.new_combobox("AA", "Anti-aimbot angles", "Body yaw"..lua_refs.states_spaces[a], "Default", "Dynamic", "Hybrid"),
        fake_left = ui.new_slider("AA", "Anti-aimbot angles", "Fake yaw limit [left]"..lua_refs.states_spaces[a], 0, 60, 58, true, "", 1, lua_refs.fake_tooltip),
        fake_right = ui.new_slider("AA", "Anti-aimbot angles", "Fake yaw limit [right]"..lua_refs.states_spaces[a], 0, 60, 58, true, "", 1, lua_refs.fake_tooltip),
        defensive = ui.new_checkbox("AA", "Anti-aimbot angles", "Force defensive"..lua_refs.states_spaces[a]),
    } 
end
envious.anti_aim.defensive_aa = ui.new_hotkey("AA", "Anti-aimbot angles", "Defensive options")
for a=1, 7 do
    envious.anti_aim.aa[lua_refs.states_names[a]].defensive_options = ui.new_multiselect("AA", "Anti-aimbot angles", "\nBreakers"..lua_refs.states_spaces[a], "Lag flick", "Pitch breaker", "Yaw breaker")
end
envious.anti_aim.g_aa_space = ui.new_label("AA", "Anti-aimbot angles", "\nSpace label")
envious.anti_aim.avoid_backstab = ui.new_checkbox("AA", "Anti-aimbot angles", "Anti backstab")
envious.anti_aim.legit_key = ui.new_hotkey("AA", "Anti-aimbot angles", "Legit aa")
envious.anti_aim.left_key = ui.new_hotkey("AA", "Anti-aimbot angles", "Left")
envious.anti_aim.right_key = ui.new_hotkey("AA", "Anti-aimbot angles", "Right")
envious.anti_aim.back_key = ui.new_hotkey("AA", "Anti-aimbot angles", "Back")
envious.anti_aim.forward_key = ui.new_hotkey("AA", "Anti-aimbot angles", "Forward")
envious.anti_aim.freestand_key = ui.new_hotkey("AA", "Anti-aimbot angles", "Freestanding")
envious.anti_aim.edge_yaw_key = ui.new_hotkey("AA", "Anti-aimbot angles", "Edge yaw")

envious.visual.crosshair_ind = ui.new_combobox("AA", "Anti-aimbot angles", "Crosshair indicators", "Disabled", "Envious", "Team skeet")
envious.visual.color_1 = ui.new_color_picker("AA", "Anti-aimbot angles", "Color_picker1", 175, 255, 0, 255)
envious.visual.color_2 = ui.new_color_picker("AA", "Anti-aimbot angles", "Color_picker2", 0, 200, 255, 255)
envious.visual.local_anims = ui.new_multiselect("AA", "Anti-aimbot angles", "Local animations", "Body lean in air", "Pitch zero on land", "Static legs in air", "Static move yaw", "Broken animations", "Air move", "Restate on fd")
envious.visual.lean_amount = ui.new_slider("AA", "Anti-aimbot angles", "\nBody lean amount", 0, 100, 100, true, "%")
envious.visual.color_name = ui.new_label("AA", "Anti-aimbot angles", "Color")
envious.visual.color = ui.new_color_picker("AA", "Anti-aimbot angles", "Color_picker", 255, 204, 153, 255)

envious.other.exp_tweaks = ui.new_multiselect("AA", "Anti-aimbot angles", "Exploit tweaks", "Charge dt in unsafe position", "Os-aa without fakelag")
envious.other.break_extrapolation = ui.new_checkbox("AA", "Anti-aimbot angles", "Break extrapolation")
envious.other.auto_tp = ui.new_hotkey("AA", "Anti-aimbot angles", "Automatic discharge dt in unsafe position")
envious.other.leg_move = ui.new_combobox("AA", "Anti-aimbot angles", "Leg movement", "Default", "Slide", "Broken")
envious.other.slowwalk_speed = ui.new_slider("AA", "Anti-aimbot angles", "Slow motion accuracy", 0, 100, 50, true, "%")

local angle3d_struct = ffi.typeof("struct { float pitch; float yaw; float roll; }")
local vec_struct = ffi.typeof("struct { float x; float y; float z; }")

local cUserCmd =
    ffi.typeof(
    [[
    struct
    {
        uintptr_t vfptr;
        int command_number;
        int tick_count;
        $ viewangles;
        $ aimdirection;
        float forwardmove;
        float sidemove;
        float upmove;
        int buttons;
        uint8_t impulse;
        int weaponselect;
        int weaponsubtype;
        int random_seed;
        short mousedx;
        short mousedy;
        bool hasbeenpredicted;
        $ headangles;
        $ headoffset;
        bool send_packet; 
    }
    ]],
    angle3d_struct,
    vec_struct,
    angle3d_struct,
    vec_struct
)

ffi.cdef [[
	typedef int(__thiscall* get_clipboard_text_count)(void*);
	typedef void(__thiscall* set_clipboard_text)(void*, const char*, int);
	typedef void(__thiscall* get_clipboard_text)(void*, int, const char*, int);
]]

local VGUI_System010 =  client.create_interface("vgui2.dll", "VGUI_System010") or print( "Error finding VGUI_System010")
local VGUI_System = ffi.cast(ffi.typeof('void***'), VGUI_System010 )

local get_clipboard_text_count = ffi.cast("get_clipboard_text_count", VGUI_System[ 0 ][ 7 ] ) or print( "get_clipboard_text_count Invalid")
local set_clipboard_text = ffi.cast( "set_clipboard_text", VGUI_System[ 0 ][ 9 ] ) or print( "set_clipboard_text Invalid")
local get_clipboard_text = ffi.cast( "get_clipboard_text", VGUI_System[ 0 ][ 11 ] ) or print( "get_clipboard_text Invalid")

local client_sig = client.find_signature("client.dll", "\xB9\xCC\xCC\xCC\xCC\x8B\x40\x38\xFF\xD0\x84\xC0\x0F\x85") or error("client.dll!:input not found.")
local get_cUserCmd = ffi.typeof("$* (__thiscall*)(uintptr_t ecx, int nSlot, int sequence_number)", cUserCmd)
local input_vtbl = ffi.typeof([[struct{uintptr_t padding[8];$ GetUserCmd;}]],get_cUserCmd)
local input = ffi.typeof([[struct{$* vfptr;}*]], input_vtbl)
local get_input = ffi.cast(input,ffi.cast("uintptr_t**",tonumber(ffi.cast("uintptr_t", client_sig)) + 1)[0])
local get_client_entity_bind = vtable_bind("client_panorama.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*,int)")
local get_inaccuracy = vtable_thunk(483, "float(__thiscall*)(void*)")

local functions = { }
functions.normalize_string = (function(string)
    return string.sub(string, 10)
end)
functions.is_nan = (function(v)
    return tostring(v) == tostring(0/0) 
end)
functions.vec_add = (function(a, b)
    return {
        a[1] + b[1],
        a[2] + b[2],
        a[3] + b[3]
    }
end)
functions.contains = (function(table, value)
    if table == nil then
        return false
    end
    table = ui.get(table)
    for i=0, #table do
        if table[i] == value then
            return true
        end
    end
    return false
end)
functions.normalize_yaw = (function(yaw)
    while yaw > 180 do yaw = yaw - 360 end
    while yaw < -180 do yaw = yaw + 360 end
    return yaw
end)
functions.distance3d = (function(x1, y1, z1, x2, y2, z2)
    return math.sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1) + (z2-z1)*(z2-z1))
end)
functions.extrapolate_position = (function(xpos,ypos,zpos,ticks,player)
	local x,y,z = entity.get_prop(player, "m_vecVelocity")
    if x == nil or y == nil or z == nil then return end
	for i=0, ticks do
		xpos =  xpos + (x*globals.tickinterval())
		ypos =  ypos + (y*globals.tickinterval())
		zpos =  zpos + (z*globals.tickinterval())
	end
	return xpos,ypos,zpos
end)

functions.entity_has_c4 = (function(ent)
    local bomb = entity.get_all("CC4")[1]
    return bomb ~= nil and entity.get_prop(bomb, "m_hOwnerEntity") == ent
end)
functions.get_velocity = (function(player)
    local x,y,z = entity.get_prop(player, "m_vecVelocity")
    if x == nil then return end
    return math.sqrt(x*x + y*y + z*z)
end)
functions.is_crouching = (function(player)
    if player == nil then return end
    local flags = entity.get_prop(player, "m_fFlags")
    if flags == nil then return end
    if bit.band(flags, 4) == 4 then
        return true
    end
    return false
end)
functions.in_air = (function(player)
    if player == nil then return end
    local flags = entity.get_prop(player, "m_fFlags")
    if flags == nil then return end
    if bit.band(flags, 1) == 0 then
        return true
    end
    return false
end)
functions.get_state = (function(velocity, cmd)
    local in_jump = functions.in_air(entity.get_local_player()) or cmd.in_jump == 1
    local in_duck = functions.is_crouching(entity.get_local_player()) or cmd.in_duck == 1 or ui.get(refs.g.fake_duck)
    local in_walk = (ui.get(refs.g.slowwalk[1]) and ui.get(refs.g.slowwalk[2])) or cmd.in_speed == 1
    if velocity < 5 and not (in_jump or in_duck) then
        cnds = 1
    elseif in_jump and not in_duck then
        cnds = 4
    elseif in_jump and in_duck then
        cnds = 5
    elseif in_duck and not in_jump then
        if velocity < 5 then
            cnds = 6
        else
            cnds = 7
        end
    else
        if in_walk then
            cnds = 3
        else
            cnds = 2 
        end
    end
    return cnds
end)
functions.get_fakelag = (function(cmd)
    if cmd.chokedcommands ~= 0 then
        last_choke_packet = cmd.chokedcommands
    else
        last_send_packet = last_choke_packet
    end
    if last_send_packet == nil then
        return 1
    else
        return last_send_packet
    end
end)
functions.get_entities = (function(enemy_only, alive_only)
    local enemy_only = enemy_only ~= nil and enemy_only or false
    local alive_only = alive_only ~= nil and alive_only or true
    local result = {}
    local me = entity.get_local_player()
    local player_resource = entity.get_player_resource()
    for player = 1, globals.maxplayers() do
        local is_enemy, is_alive = true, true

        if enemy_only and not entity.is_enemy(player) then is_enemy = false end
        if is_enemy then
            if alive_only and entity.get_prop(player_resource, 'm_bAlive', player) ~= 1 then is_alive = false end
            if is_alive then table.insert(result, player) end
        end
    end
    return result
end)
functions.max_angle = (function(player)
    local player_index = c_entity.new(player)
    local player_animstate = player_index:get_anim_state()
    local max_yaw = player_animstate.max_yaw
    local min_yaw = player_animstate.min_yaw
    --local duck_amount = player_animstate.duck_amount
    local feet_speed_forwards_or_sideways = math.max(0, math.min(1, player_animstate.feet_speed_forwards_or_sideways))
    local feet_speed_unknown_forwards_or_sideways = math.max(1, player_animstate.feet_speed_unknown_forwards_or_sideways)
    local value = ((player_animstate.stop_to_full_running_fraction * -0.30000001 - 0.19999999) * feet_speed_forwards_or_sideways + 1)
    --[[if duck_amount > 0 then
        value = value + duck_amount * feet_speed_unknown_forwards_or_sideways * (0.5 - value)
    end]]
    local delta_yaw = math.abs(player_animstate.max_yaw) * value
    return math.max(27, math.min(math.abs(max_yaw), delta_yaw))
end)

functions.get_flag_names = (function(flags_amount)
    local flags = {
        [1] = "Helmet",
        [2] = "Kevlar",
        [4] = "Helmet + Kevlar",
        [8] = "Zoom",
        [16] = "Blind",
        [32] = "Reload",
        [64] = "Bomb",
        [128] = "Vip",
        [256] = "Defuse",
        [512] = "Fakeduck",
        [1024] = "Pin pulled",
        [2048] = "Hit",
        [4096] = "Occluded",
        [8192] = "Exploiter",
        [131072] = "Defensive dt"
    }
    local indices = {}
    for i, name in pairs(flags) do
        if bit.band(flags_amount, i) == i then
            table.insert(indices, name)
        end
    end
    return indices
end)
functions.entity_have_flag = (function(player, flag_search)
    if player == nil then return false end
    local result = false
    local esp_data = entity.get_esp_data(player)
    local flags = functions.get_flag_names(esp_data.flags)
    for _, flag_name in pairs(flags) do
        if (flag_name ~= flag_search) then goto skip end
        result = true
        ::skip::
    end
    return result
end)
functions.can_desync = (function(cmd)
    if entity.get_prop(entity.get_local_player(), "m_MoveType") == 9 then
        return false
    end
    local client_weapon = entity.get_player_weapon(entity.get_local_player())
    if client_weapon == nil then
        return false
    end
    local weapon_classname = entity.get_classname(client_weapon)
    local in_use = cmd.in_use == 1
    local in_attack = cmd.in_attack == 1
    local in_attack2 = cmd.in_attack2 == 1
    if in_use then
        return false
    end
    if in_attack or in_attack2 then
        if weapon_classname:find("Grenade") then
            vars.m1_time = globals.curtime() + 0.15
        end
    end
    if vars.m1_time > globals.curtime() then
        return false
    end
    if in_attack then
        if client_weapon == nil then
            return false
        end
        if weapon_classname then
            return false
        end
        return false
    end
    return true
end)

functions.manual_direction = (function()
    if ui.get(envious.anti_aim.back_key) or back_dir == nil then
        back_dir = true
        right_dir = false
        left_dir = false
        forward_dir = false
        manual_dir = 0
        vars.last_press = globals.realtime()
    elseif ui.get(envious.anti_aim.right_key) then
        if right_dir == true and vars.last_press + 0.07 < globals.realtime() then
            back_dir = true
            right_dir = false
            left_dir = false
            forward_dir = false
            manual_dir = 0
        elseif right_dir == false and vars.last_press + 0.07 < globals.realtime() then
            right_dir = true
            back_dir = false
            left_dir = false
            forward_dir = false
            manual_dir = 90
        end
        vars.last_press = globals.realtime()
    elseif ui.get(envious.anti_aim.left_key) then
        if left_dir == true and vars.last_press + 0.07 < globals.realtime() then
            back_dir = true
            right_dir = false
            left_dir = false
            forward_dir = false
            manual_dir = 0
        elseif left_dir == false and vars.last_press + 0.07 < globals.realtime() then
            left_dir = true
            back_dir = false
            right_dir = false
            forward_dir = false
            manual_dir = -90
        end
        vars.last_press = globals.realtime()
    elseif ui.get(envious.anti_aim.forward_key) then
        if forward_dir == true and vars.last_press + 0.07 < globals.realtime() then
            back_dir = true
            right_dir = false
            left_dir = false
            forward_dir = false
            manual_dir = 0
        elseif forward_dir == false and vars.last_press + 0.07 < globals.realtime() then
            left_dir = false
            back_dir = false
            right_dir = false
            forward_dir = true
            manual_dir = 180

        end
        vars.last_press = globals.realtime()
    end
    return back_dir, right_dir, left_dir, forward_dir, manual_dir
end)
functions.modify_velocity = (function(cmd, goalspeed)
	if goalspeed <= 0 then
		return
	end
	local minimalspeed = math.sqrt((cmd.forwardmove * cmd.forwardmove) + (cmd.sidemove * cmd.sidemove))
	if minimalspeed <= 0 then
		return
	end
	if cmd.in_duck == 1 then
		goalspeed = goalspeed * 2.94117647
	end
	if minimalspeed <= goalspeed then
		return
	end
	local speedfactor = goalspeed / minimalspeed
	cmd.forwardmove = cmd.forwardmove * speedfactor
	cmd.sidemove = cmd.sidemove * speedfactor
end)
functions.aa_on_use = (function(cmd)
    local plocal = entity.get_local_player()
    local distance = 100
    local bomb = entity.get_all("CPlantedC4")[1]
    local bomb_x, bomb_y, bomb_z = entity.get_prop(bomb, "m_vecOrigin")
    if bomb_x ~= nil then
        local player_x, player_y, player_z = entity.get_prop(plocal, "m_vecOrigin")
        distance = functions.distance3d(bomb_x, bomb_y, bomb_z, player_x, player_y, player_z)
    end
    local team_num = entity.get_prop(plocal, "m_iTeamNum")
    local defusing = team_num == 3 and distance < 62
    local on_bombsite = entity.get_prop(plocal, "m_bInBombZone")
    local has_bomb = functions.entity_has_c4(plocal)
    local px, py, pz = client.eye_position()
    local pitch, yaw = client.camera_angles()
    local sin_pitch = math.sin(math.rad(pitch))
    local cos_pitch = math.cos(math.rad(pitch))
    local sin_yaw = math.sin(math.rad(yaw))
    local cos_yaw = math.cos(math.rad(yaw))
    local dir_vec = { cos_pitch * cos_yaw, cos_pitch * sin_yaw, -sin_pitch }
    local fraction, entindex = client.trace_line(plocal, px, py, pz, px + (dir_vec[1] * 8192), py + (dir_vec[2] * 8192), pz + (dir_vec[3] * 8192))
    local using = true
    if entindex ~= nil then
        if vars.classnames == nil then return end
        for i=0, #vars.classnames do
            if entindex == nil then return end
            if entity.get_classname(entindex) == vars.classnames[i] then
                using = false
            end
        end
    end
    if not using and not defusing then
        cmd.in_use = 0
    end
end)
functions.avoid_backstab = (function(target)
    if target == nil then return false end
    local players = functions.get_entities(true, true)
    local is_dangerous = false
    for _, player in pairs(players) do
        if player == nil then goto skip end
        if entity.is_dormant(player) then goto skip end
        local weapon_ent = entity.get_player_weapon(player)
        if weapon_ent == nil then goto skip end
        local weapon_idx = entity.get_prop(weapon_ent, "m_iItemDefinitionIndex")
        if weapon_idx == nil then goto skip end
        local weapon = csgo_weapons[weapon_idx]
        if weapon == nil then goto skip end
        if weapon.type == "knife" or weapon.type == "taser" then goto skip end
        if not functions.entity_have_flag(player, "Hit") then goto skip end
        is_dangerous = true
        ::skip::
    end
    local client_origin = vector(entity.get_origin(entity.get_local_player()))
    local target_origin = vector(entity.get_origin(target))
    local distance = functions.distance3d(client_origin.x, client_origin.y, client_origin.z, target_origin.x, target_origin.y, target_origin.z)
    if distance > 250 then return false end
    if is_dangerous then return false end
    local weapon_ent = entity.get_player_weapon(target)
    if weapon_ent == nil then return false end
    local weapon_idx = entity.get_prop(weapon_ent, "m_iItemDefinitionIndex")
    if weapon_idx == nil then return false end
    local weapon = csgo_weapons[weapon_idx]
    if weapon == nil then return false end
    return (weapon.type == "knife")
end)
functions.get_yaw_base = (function(target, yaw_base)
    if (target == nil) or (yaw_base == "Local view") then
        local pitch, yaw = client.camera_angles()
        return pitch, yaw
    else
        local eye_pos = vector(client.eye_position())
        local origin = vector(entity.get_origin(target))
        local aim_pos = origin + vector(0, 0, 40)
        local pitch, yaw = eye_pos:to(aim_pos):angles()
        return pitch, yaw
    end
end)
functions.apply_desync = (function(cmd, fake)
    local fake = math.min(fake, functions.max_angle(entity.get_local_player()))
    local target = client.current_threat()
    local usrcmd = get_input.vfptr.GetUserCmd(ffi.cast("uintptr_t", get_input), 0, cmd.command_number)
    local pitch, yaw = functions.get_yaw_base(target, ui.get(refs.aa.yaw_target))
    local can_desync = functions.can_desync(cmd)
    if can_desync then
        cmd.allow_send_packet = false
        if cmd.chokedcommands == 0 then
            cmd.yaw = functions.normalize_yaw(yaw + (180 + ui.get(refs.aa.yaw[2]))) - (fake*2)*ui.get(refs.aa.byaw[2]);
        end
    end
end)

functions.generate_wayjitter_tbl = (function(variant, val)
    local variants = {
        {
            {
                { 
                    [-1] = { -val, val, 0 }, 
                    [1] = { val, -val, 0 }, 
                },
            },
            {
                { 
                    [-1] = { -1, 1, 0 }, 
                    [1] = { 1, -1, 0 }, 
                },
            },
        },
        {
            {
                { 
                    [-1] = { -val, val, val*0.50, -val*0.50 },
                    [1] = { val, -val, -val*0.50, val*0.50 },
                },
            },
            {
                { 
                    [-1] = { -1, 1, -1, 1 },
                    [1] = { 1, -1, 1, -1 },
                },
            },
        },
        {
            {
                { 
                    [-1] = { -val, val, val*0.50, -val*0.50, 0 },
                    [1] = { val, -val, -val*0.50, val*0.50, 0 },
                },
            },
            {
                { 
                    [-1] = { -1, 1, -1, 1, 0 },
                    [1] = { 1, -1, 1, -1, 0 },
                },
            },
        },
        {
            {
                { 
                    [-1] = { -val, val, val*0.67, -val*0.67, -val*0.33, val*0.33 },
                    [1] = { val, -val, -val*0.67, val*0.67, val*0.33, -val*0.33 },
                },
            },
            {
                { 
                    [-1] = { -1, 1, -1, 1, -1, 1 },
                    [1] = { 1, -1, 1, -1, 1, -1 },
                },
            },
        },
        {
            {
                { 
                    [-1] = { -val, val, val*0.67, -val*0.67, -val*0.33, val*0.33, 0 },
                    [1] = { val, -val, -val*0.67, val*0.67, val*0.33, -val*0.33, 0 },
                },
            },
            {
                { 
                    [-1] = { -1, 1, -1, 1, -1, 1, 0 },
                    [1] = { 1, -1, 1, -1, 1, -1, 0 },
                },
            },
        },
        {
            {
                {
                    [-1] = { -val, val, val*0.75, -val*0.75, -val*0.50, val*0.50, val*0.25, -val*0.25 },
                    [1] = { val, -val, -val*0.75, val*0.75, val*0.50, -val*0.50, -val*0.25, val*0.25 },
                },  
            },
            {
                { 
                    [-1] = { -1, 1, -1, 1, -1, 1, -1, 1 },
                    [1] = { 1, -1, 1, -1, 1, -1, 1, -1 },
                }, 
            },
        },
        {
            {
                { 
                    [-1] = { -val, val, val*0.75, -val*0.75, -val*0.50, val*0.50, val*0.25, -val*0.25, 0 },
                    [1] = { val, -val, -val*0.75, val*0.75, val*0.50, -val*0.50, -val*0.25, val*0.25, 0 },
                },
            },
            {
                { 
                    [-1] = { -1, 1, -1, 1, -1, 1, -1, 1, 0 },
                    [1] = { 1, -1, 1, -1, 1, -1, 1, -1, 0 },
                },
            },
        },
        {
            {
                { 
                    [-1] = { -val, val, val*0.80, -val*0.80, -val*0.60, val*0.60, val*0.40, -val*0.40, -val*0.20, val*0.20 },
                    [1] = { val, -val, -val*0.80, val*0.80, val*0.60, -val*0.60, -val*0.40, val*0.40, val*0.20, -val*0.20 },
                },   
            },
            {
                { 
                    [-1] = { -1, 1, -1, 1, -1, 1, -1, 1, -1, 1 },
                    [1] = { 1, -1, 1, -1, 1, -1, 1, -1, 1, -1 },
                },
            },
        },
        {
            {
                { 
                    [-1] = { -val, val, val*0.80, -val*0.80, -val*0.60, val*0.60, val*0.40, -val*0.40, -val*0.20, val*0.20, 0 },
                    [1] = { val, -val, -val*0.80, val*0.80, val*0.60, -val*0.60, -val*0.40, val*0.40, val*0.20, -val*0.20, 0 },
                }, 
            },
            {
                { 
                    [-1] = { -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, 0 },
                    [1] = { 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 0 },
                },
            },
        },
        {
            {
                { 
                    [-1] = { -val, val, val*0.83, -val*0.83, -val*0.67, val*0.67, val*0.50, -val*0.50, -val*0.33, val*0.33, val*0.17, -val*0.17 },
                    [1] = { val, -val, -val*0.83, val*0.83, val*0.67, -val*0.67, -val*0.50, val*0.50, val*0.33, -val*0.33, -val*0.17, val*0.17 },
                },
            },
            {
                {
                    [-1] = { -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1 },
                    [1] = { 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1 },
                }, 
            },
        },
    }
    return variants[variant]
end)
functions.get_freestand_direction = (function()
    local data = {
        side = 1,
        last_side = 0,
    
        last_hit = 0,
        hit_side = 0
    }
    local me = entity.get_local_player()
    if (not me or entity.get_prop(me, "m_lifeState") ~= 0) then
        return
    end
    if data.hit_side ~= 0 and globals.curtime() - data.last_hit > 5 then
        data.last_side = 0
        data.last_hit = 0
        data.hit_side = 0
    end
    local x, y, z = client.eye_position()
    local _, yaw = client.camera_angles()
    local trace_data = {left = 0, right = 0}
    for i = yaw - 120, yaw + 120, 30 do
        if i ~= yaw then

            local rad = math.rad(i)

            local px, py, pz = x + 256 * math.cos(rad), y + 256 * math.sin(rad), z

            local fraction = client.trace_line(me, x, y, z, px, py, pz)
            local side = i < yaw and "left" or "right"

            trace_data[side] = trace_data[side] + fraction
        end
    end
    data.side = trace_data.left < trace_data.right and -1 or 1
    if data.side == data.last_side then
        return
    end
    data.last_side = data.side
    if data.hit_side ~= 0 then
        data.side = data.hit_side
    end
    local result = data.side
    return result
end)
functions.get_defensive_state = (function()
    local sim_time = toticks(entity.get_prop(entity.get_local_player(), "m_flSimulationTime"))
    local sim_diff = sim_time - vars.breaker.last_sim_time
    if sim_diff < 0 then
        vars.breaker.defensive_until = globals.tickcount() + math.abs(sim_diff) + toticks(client.latency())
    end
    vars.breaker.last_sim_time = sim_time
    return vars.breaker.defensive_until >= globals.tickcount()
end)
functions.get_simulation = (function(defensive_state)
    if vars.breaker.lag_record[globals.tickcount()] == nil then
        vars.breaker.lag_record[globals.tickcount()] = defensive_state
    end
    local send_p = true
    local simtime = toticks(entity.get_prop(entity.get_local_player(), "m_flSimulationTime"))
    if simtime >= globals.tickcount() then return true end
    for a=simtime, globals.tickcount() do
        if vars.breaker.lag_record[a] ~= nil then
            if vars.breaker.lag_record[a] == false then
                send_p = false
            end
        end
    end
    return send_p
end)

functions.gradient_text = (function(r1, g1, b1, a1, r2, g2, b2, a2, text)
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
end)
functions.pulse_animation = (function()
    if cur_alpha == nil then
        cur_alpha = 255
        target_alpha = 0
        max_alpha = 255
        min_alpha = 0
        speed = 0.04
    end
    if (cur_alpha < min_alpha + 2) then
        target_alpha = max_alpha
    elseif (cur_alpha > max_alpha - 2) then
        target_alpha = min_alpha
    end
    cur_alpha = cur_alpha + (target_alpha - cur_alpha) * speed * (globals.absoluteframetime() * 100)
    return cur_alpha
end)
functions.fade_animation = (function()
    if interval == nil then
        interval = 0
        modifier = 1.65
    end
    interval = interval + (1-modifier) * 0.7 + 0.3
    local textPulsate = math.abs(interval*0.0175 % 2 - 1) * 255
    local fraction = (textPulsate/255)
    local disfraction = math.abs(1-fraction)
    return textPulsate, fraction, disfraction
end)
functions.faded_shadow = (function(x, y, w, h, r, g, b, a, offset, a_offset)
    renderer.rectangle(x, y, w, h, r, g, b, a)
    renderer.circle(x, y+h/2, r, g, b, a, h/2, 180, 0.5)
    renderer.circle(x+w, y+h/2, r, g, b, a, h/2, 0, 0.5)
    for i = 1, offset do
        local i_mod = i*(a_offset/offset)
        local alpha = (a/a_offset)*(a_offset-i_mod)
        renderer.rectangle(x, y-i, w, 1, r, g, b, alpha)
        renderer.rectangle(x, y-1+h+i, w, 1, r, g, b, alpha)
        renderer.circle_outline(x, y+h/2, r, g, b, alpha, h/2+i, 90, 0.5, 1)
        renderer.circle_outline(x+w, y+h/2, r, g, b, alpha, h/2+i, 270, 0.5, 1)
    end
end)
functions.renderer_box = (function(c, vec_min, vec_max, origin, r, g, b, a)
    if type(vec_min) ~= "table" or type(vec_max) ~= "table" or type(origin) ~= "table" then return end
    local min = functions.vec_add(vec_min, origin)
    local max = functions.vec_add(vec_max, origin)
    local points =
    {
        {min[1], min[2], min[3]},
        {min[1], max[2], min[3]},
        {max[1], max[2], min[3]},
        {max[1], min[2], min[3]},
        {min[1], min[2], max[3]},
        {min[1], max[2], max[3]},
        {max[1], max[2], max[3]},
        {max[1], min[2], max[3]},
    }
    local edges = {
        {0, 1}, {1, 2}, {2, 3}, {3, 0},
        {5, 6}, {6, 7}, {1, 4}, {4, 8},
        {0, 4}, {1, 5}, {2, 6}, {3, 7},
        {5, 8}, {7, 8}, {3, 4}
    }
    for i = 1, #edges do
        if points[edges[i][1]] ~= nil and points[edges[i][2]] ~= nil then
            local p1 = { client.world_to_screen(c, points[edges[i][1]][1], points[edges[i][1]][2], points[edges[i][1]][3]) }
            local p2 = { client.world_to_screen(c, points[edges[i][2]][1], points[edges[i][2]][2], points[edges[i][2]][3]) }

            renderer.line(p1[1], p1[2], p2[1], p2[2], r, g, b, a)
        end
    end
end)

functions.clipboard_import = (function()
    local clipboard_text_length = get_clipboard_text_count( VGUI_System )
    local clipboard_data = ""
    if clipboard_text_length > 0 then
        buffer = ffi.new("char[?]", clipboard_text_length)
        size = clipboard_text_length * ffi.sizeof("char[?]", clipboard_text_length)
  
        get_clipboard_text( VGUI_System, 0, buffer, size )
  
        clipboard_data = ffi.string( buffer, clipboard_text_length-1 )
    end
    return clipboard_data
end)
functions.clipboard_export = (function(string)
    if string then
        set_clipboard_text(VGUI_System, string, string:len())
    end
end)
functions.arr_to_string = (function(arr)
    arr = ui.get(arr)
    local str = ""
    for i=1, #arr do
        str = str .. arr[i] .. (i == #arr and "" or ",")
    end
    if str == "" then
        str = "-"
    end
    return str
end)
functions.str_to_sub = (function(input, sep)
    local t = {}
    for str in string.gmatch(input, "([^"..sep.."]+)") do
        t[#t + 1] = string.gsub(str, "\n", "")
    end
    return t
end)
functions.to_boolean = (function(str)
    if str == "true" then
        return true
    else
        return false
    end
end)
functions.import_cfg = (function(input)
	local tbl = functions.str_to_sub(input, "|")
    for i=1, 7 do
        ui.set(envious.anti_aim.aa[lua_refs.states_names[i]].yaw_base, tbl[1 + (12 * (i-1))])
        ui.set(envious.anti_aim.aa[lua_refs.states_names[i]].yaw_left, tonumber(tbl[2 + (12 * (i-1))]))
        ui.set(envious.anti_aim.aa[lua_refs.states_names[i]].yaw_right, tonumber(tbl[3 + (12 * (i-1))]))
        ui.set(envious.anti_aim.aa[lua_refs.states_names[i]].yaw_center, tonumber(tbl[4 + (12 * (i-1))]))
        ui.set(envious.anti_aim.aa[lua_refs.states_names[i]].jyaw, tbl[5 + (12 * (i-1))])
        ui.set(envious.anti_aim.aa[lua_refs.states_names[i]].n_way, tonumber(tbl[6 + (12 * (i-1))]))
        ui.set(envious.anti_aim.aa[lua_refs.states_names[i]].jyaw_add, tonumber(tbl[7 + (12 * (i-1))]))
        ui.set(envious.anti_aim.aa[lua_refs.states_names[i]].byaw, tbl[8 + (12 * (i-1))])
        ui.set(envious.anti_aim.aa[lua_refs.states_names[i]].fake_left, tonumber(tbl[9 + (12 * (i-1))]))
        ui.set(envious.anti_aim.aa[lua_refs.states_names[i]].fake_right, tonumber(tbl[10 + (12 * (i-1))]))
        ui.set(envious.anti_aim.aa[lua_refs.states_names[i]].defensive, functions.to_boolean(tbl[11 + (12 * (i-1))]))
        ui.set(envious.anti_aim.aa[lua_refs.states_names[i]].defensive_options, functions.str_to_sub(tbl[12 + (12 * (i-1))], ","))
    end
end)
functions.export_cfg = (function()
	local str = ""
	for i=1, 7 do
		str = str .. tostring(ui.get(envious.anti_aim.aa[lua_refs.states_names[i]].yaw_base)) .. "|"
        .. tostring(ui.get(envious.anti_aim.aa[lua_refs.states_names[i]].yaw_left)) .. "|"
        .. tostring(ui.get(envious.anti_aim.aa[lua_refs.states_names[i]].yaw_right)) .. "|"
        .. tostring(ui.get(envious.anti_aim.aa[lua_refs.states_names[i]].yaw_center)) .. "|"
        .. tostring(ui.get(envious.anti_aim.aa[lua_refs.states_names[i]].jyaw)) .. "|"
        .. tostring(ui.get(envious.anti_aim.aa[lua_refs.states_names[i]].n_way)) .. "|"
        .. tostring(ui.get(envious.anti_aim.aa[lua_refs.states_names[i]].jyaw_add)) .. "|"
        .. tostring(ui.get(envious.anti_aim.aa[lua_refs.states_names[i]].byaw)) .. "|"
        .. tostring(ui.get(envious.anti_aim.aa[lua_refs.states_names[i]].fake_left)) .. "|"
        .. tostring(ui.get(envious.anti_aim.aa[lua_refs.states_names[i]].fake_right)) .. "|"
        .. tostring(ui.get(envious.anti_aim.aa[lua_refs.states_names[i]].defensive)) .. "|"
        .. functions.arr_to_string(envious.anti_aim.aa[lua_refs.states_names[i]].defensive_options) .. "|"
	end
	return str
end)

if database.read("[envious] preset list") == nil then
    database.write("[envious] preset list", { "Envious" })
end
http.get("https://pastebin.com/raw/4Eb7nmMY", function(success, response)
    if not success or response.status ~= 200 then
        return
    end

    database.write("[envious] Envious preset", response.body)
end)
local preset_table = database.read("[envious] preset list")
envious.config.preset_list_menu = ui.new_listbox("AA", "Anti-aimbot angles", "Preset list", preset_table)
ui.set(envious.config.preset_list_menu, 0)
envious.config.load_preset_but = ui.new_button("AA", "Anti-aimbot angles", "Load preset", function()
    local r, g, b, a = ui.get(envious.visual.color)
    local preset_amount = preset_table[ui.get(envious.config.preset_list_menu) + 1]
    if preset_amount == nil then
        local preset_txt = database.read("[envious] Envious preset")
        functions.import_cfg(preset_txt)
        client.color_log(r, g, b, "Envious preset from cloud was imported")
        return 
    end
    local preset_txt = database.read("[envious] "..preset_amount.." preset")
    functions.import_cfg(preset_txt)
    if preset_amount == "Envious" then
        client.color_log(r, g, b, "Envious preset from cloud was imported")
    else
        client.color_log(r, g, b, "Your custom preset from database was imported")
    end
end)
envious.config.delete_preset_but = ui.new_button("AA", "Anti-aimbot angles", "Delete preset", function()
    local r, g, b, a = ui.get(envious.visual.color)
    if ui.get(envious.config.preset_list_menu) == nil then 
        error("Got an error while trying to delete a preset")
        return 
    end
    local preset_amount = (ui.get(envious.config.preset_list_menu) + 1)
    local pname = preset_table[preset_amount]
    if pname == nil or pname == "Envious" then 
        error("Got an error while trying to delete a preset")
        return
    end
    local tbl_rem = preset_table
    table.remove(tbl_rem, preset_amount)
    database.write("[envious] preset list", tbl_rem)
    ui.update(envious.config.preset_list_menu, database.read("[envious] preset list"))
    client.color_log(r, g, b, "Your custom preset from database was deleted")
end)
envious.config.export_database_cfg_to_clip_but = ui.new_button("AA", "Anti-aimbot angles", "Export preset to clipboard", function()
    local r, g, b, a = ui.get(envious.visual.color)
    local preset_amount = preset_table[ui.get(envious.config.preset_list_menu) + 1]
    if preset_amount == nil or preset_amount == "Envious" then
        error("Got an error while trying to load a preset")
        return 
    end
    local preset_txt = database.read("[envious] "..preset_amount.." preset")
    functions.clipboard_export(preset_txt)
    client.color_log(r, g, b, "Your custom preset from database was exported to clipboard")
end)
envious.config.presetname = ui.new_textbox("AA", "Anti-aimbot angles", "Please enter preset name")
envious.config.save_preset_but = ui.new_button("AA", "Anti-aimbot angles", "Save preset", function()
    local r, g, b, a = ui.get(envious.visual.color)
    local pname = ui.get(envious.config.presetname)
    local name_is_space = true
    for a=1, #lua_refs.symbols do
        local symbol = lua_refs.symbols[a]
        if string.find(ui.get(envious.config.presetname), tostring(symbol)) == nil then goto skip end
        name_is_space = false
        ::skip::
    end
    if name_is_space then
        local preset_amount = (ui.get(envious.config.preset_list_menu) + 1)
        local pname = preset_table[preset_amount]
        if pname == nil or pname == "Envious" then
            error("Got an error while trying to save a preset")
            return
        end
        local export = functions.export_cfg()
        database.write("[envious] "..pname.." preset", export)
        client.color_log(r, g, b, "Your custom preset was exported to database")
        return
    end
    if ui.get(envious.config.presetname) == "Envious" then
        error("Got an error while trying to save a preset")
        return
    end
    for p=1, #preset_table do
        local pname2 = preset_table[p]
        if pname2 == pname then
            table.remove(preset_table, p)
        end
    end
    local tbl_rem = preset_table
    tbl_rem[#tbl_rem + 1] = pname
    local export = functions.export_cfg()
    database.write("[envious] "..pname.." preset", export)
    database.write("[envious] preset list", tbl_rem)
    ui.update(envious.config.preset_list_menu, database.read("[envious] preset list"))
    client.color_log(r, g, b, "Your custom preset was exported to database")
end)
envious.config.import_cfg_from_clip_but = ui.new_button("AA", "Anti-aimbot angles", "Import preset from clipboard", function()
    local r, g, b, a = ui.get(envious.visual.color)
    functions.import_cfg(functions.clipboard_import())
    client.color_log(r, g, b, "Your preset from clipboard was imported")
end)
envious.config.export_cfg_to_clip_but = ui.new_button("AA", "Anti-aimbot angles", "Export preset to clipboard", function()
    local r, g, b, a = ui.get(envious.visual.color)
    functions.clipboard_export(functions.export_cfg())
    client.color_log(r, g, b, "Your preset was exported to clipboard")
end)
envious.config.cmd_label_a = ui.new_label("AA", "Anti-aimbot angles", "[commands]")
envious.config.cmd_label_b = ui.new_label("AA", "Anti-aimbot angles", "     >> //import")
envious.config.cmd_label_c = ui.new_label("AA", "Anti-aimbot angles", "     >> //load")
envious.config.cmd_label_d = ui.new_label("AA", "Anti-aimbot angles", "     >> //export")
envious.config.cmd_label_e = ui.new_label("AA", "Anti-aimbot angles", "     >> //save")

client.set_event_callback("console_input", function(input)
    if input == "//export" or input == "//save" then
        local r, g, b, a = ui.get(envious.visual.color)
        functions.clipboard_export(functions.export_cfg())
        client.color_log(r, g, b, "Your preset was exported to clipboard")
    end
    if input == "//import" or input == "//load" then
        local r, g, b, a = ui.get(envious.visual.color)
        functions.import_cfg(functions.clipboard_import())
        client.color_log(r, g, b, "Your preset from clipboard was imported")
    end
end)

local lua_functional = {
    create_move = (function(cmd)
        local target = client.current_threat()
        local self_index = c_entity.new(entity.get_local_player())
        local usrcmd = get_input.vfptr.GetUserCmd(ffi.cast("uintptr_t", get_input), 0, cmd.command_number)
        local anim_state = self_index:get_anim_state()
        local freestand_dir = functions.get_freestand_direction()
        local back_dir, right_dir, left_dir, forward_dir, manual_dir = functions.manual_direction()
        local velocity = functions.get_velocity(entity.get_local_player())
        local state = lua_refs.states_names[functions.get_state(velocity, cmd)]
        local fakelag_amount = functions.get_fakelag(cmd)

        local doubletap_ref = (ui.get(refs.g.dt[1]) and ui.get(refs.g.dt[2])) and not ui.get(refs.g.fake_duck)
        local osaa_ref = (ui.get(refs.g.os_aa[1]) and ui.get(refs.g.os_aa[2])) and not (ui.get(refs.g.fake_duck) or doubletap_ref)
        local is_fakelag = (fakelag_amount ~= 1) or (cmd.chokedcommands > 1)
        
        local jitter_amount = ui.get(envious.anti_aim.aa[state].jyaw_add)
        local breaker_amount = (functions.contains(envious.anti_aim.aa[state].defensive_options, "Pitch breaker") or functions.contains(envious.anti_aim.aa[state].defensive_options, "Yaw breaker")) and ui.get(envious.anti_aim.aa[state].defensive) and ui.get(envious.anti_aim.defensive_aa)

        local en_ticks_modifier = (ui.get(envious.anti_aim.aa[state].yaw_base) == "Slow") and 2 or 1
        local en_antiaim_ticks = { ["Center"] = 2, ["N-Way"] = ui.get(envious.anti_aim.aa[state].n_way), ["New-Era"] = 12, ["S-Mode"] = 12, ["Blade"] = 6 }
        local en_randomize = { ["Center"] = 1, ["N-Way"] = 1, ["New-Era"] = 4, ["S-Mode"] = 4, ["Blade"] = 4 }
        local en_freestand = { ["Default"] = (vars.aa.default_side), ["Dynamic"] = freestand_dir, ["Hybrid"] = (functions.entity_have_flag(target, "Hit") and -freestand_dir or freestand_dir)}
        local en_jitter = { 
            ["Center"] = { 
                { 
                    [-1] = { -jitter_amount*0.50, jitter_amount*0.50 }, 
                    [1] = { jitter_amount*0.50, -jitter_amount*0.50 },
                } 
            },
            ["N-Way"] = functions.generate_wayjitter_tbl(ui.get(envious.anti_aim.aa[state].n_way)-2, jitter_amount*0.50)[1], 
            ["New-Era"] = {
                {
                    [-1] = { -jitter_amount*0.50, jitter_amount*0.25, 0, jitter_amount*0.50, -jitter_amount*0.25, 0, -jitter_amount*0.50, jitter_amount*0.25, 0, jitter_amount*0.50, -jitter_amount*0.25, 0 },
                    [1] = { jitter_amount*0.50, -jitter_amount*0.25, 0, -jitter_amount*0.50, jitter_amount*0.25, 0, jitter_amount*0.50, -jitter_amount*0.25, 0, -jitter_amount*0.50, jitter_amount*0.25, 0 },
                },
                { 
                    [-1] = { -jitter_amount*0.50, jitter_amount*0.25, 0, jitter_amount*0.50, -jitter_amount*0.25, 0, jitter_amount*0.50, -jitter_amount*0.25, 0, -jitter_amount*0.50, jitter_amount*0.25, 0 },
                    [1] = { jitter_amount*0.50, -jitter_amount*0.25, 0, -jitter_amount*0.50, jitter_amount*0.25, 0, -jitter_amount*0.50, jitter_amount*0.25, 0, jitter_amount*0.50, -jitter_amount*0.25, 0 },
                },
                { 
                    [-1] = { -jitter_amount*0.50, jitter_amount*0.25, 0, jitter_amount*0.50, -jitter_amount*0.25, 0, -jitter_amount*0.25, jitter_amount*0.50, 0, jitter_amount*0.25, -jitter_amount*0.50, 0 },
                    [1] = { jitter_amount*0.50, -jitter_amount*0.25, 0, -jitter_amount*0.50, jitter_amount*0.25, 0, jitter_amount*0.25, -jitter_amount*0.50, 0, -jitter_amount*0.25, jitter_amount*0.50, 0 },
                },
                { 
                    [-1] = { -jitter_amount*0.50, jitter_amount*0.25, 0, jitter_amount*0.50, -jitter_amount*0.25, 0, jitter_amount*0.25, -jitter_amount*0.50, 0, -jitter_amount*0.25, jitter_amount*0.50, 0 },
                    [1] = { jitter_amount*0.50, -jitter_amount*0.25, 0, -jitter_amount*0.50, jitter_amount*0.25, 0, -jitter_amount*0.25, jitter_amount*0.50, 0, jitter_amount*0.25, -jitter_amount*0.50, 0 },
                },
            },
            ["S-Mode"] = { 
                {
                    [-1] = { -jitter_amount*0.50, 0, jitter_amount*0.50, -jitter_amount*0.25, 0, jitter_amount*0.25, -jitter_amount*0.50, 0, jitter_amount*0.50, -jitter_amount*0.25, 0, jitter_amount*0.25 },
                    [1] = { jitter_amount*0.50, 0, -jitter_amount*0.50, jitter_amount*0.25, 0, -jitter_amount*0.25, jitter_amount*0.50, 0, -jitter_amount*0.50, jitter_amount*0.25, 0, -jitter_amount*0.25 },
                },
                { 
                    [-1] = { -jitter_amount*0.50, 0, jitter_amount*0.50, -jitter_amount*0.25, 0, jitter_amount*0.25, jitter_amount*0.50, 0, -jitter_amount*0.50, jitter_amount*0.25, 0, -jitter_amount*0.25 },
                    [1] = { jitter_amount*0.50, 0, -jitter_amount*0.50, jitter_amount*0.25, 0, -jitter_amount*0.25, -jitter_amount*0.50, 0, jitter_amount*0.50, -jitter_amount*0.25, 0, jitter_amount*0.25 },
                },
                { 
                    [-1] = { -jitter_amount*0.50, 0, jitter_amount*0.50, -jitter_amount*0.25, 0, jitter_amount*0.25, -jitter_amount*0.25, 0, jitter_amount*0.25, -jitter_amount*0.50, 0, jitter_amount*0.50 }, 
                    [1] = { jitter_amount*0.50, 0, -jitter_amount*0.50, jitter_amount*0.25, 0, -jitter_amount*0.25, jitter_amount*0.25, 0, -jitter_amount*0.25, jitter_amount*0.50, 0, -jitter_amount*0.50 }, 
                },
                { 
                    [-1] = { -jitter_amount*0.50, 0, jitter_amount*0.50, -jitter_amount*0.25, 0, jitter_amount*0.25, jitter_amount*0.25, 0, -jitter_amount*0.25, jitter_amount*0.50, 0, -jitter_amount*0.50 }, 
                    [1] = { jitter_amount*0.50, 0, -jitter_amount*0.50, jitter_amount*0.25, 0, -jitter_amount*0.25, -jitter_amount*0.25, 0, jitter_amount*0.25, -jitter_amount*0.50, 0, jitter_amount*0.50 }, 
                },
            },
            ["Blade"] = {
                {
                    [-1] = { -jitter_amount*0.50, jitter_amount*0.50, 0, -jitter_amount*0.50, jitter_amount*0.50, 0 },
                    [1] = { jitter_amount*0.50, -jitter_amount*0.50, 0, jitter_amount*0.50, -jitter_amount*0.50, 0 },
                },
                { 
                    [-1] = { -jitter_amount*0.50, jitter_amount*0.50, 0, jitter_amount*0.50, -jitter_amount*0.50, 0 }, 
                    [1] = { jitter_amount*0.50, -jitter_amount*0.50, 0, -jitter_amount*0.50, jitter_amount*0.50, 0 }, 
                },
                { 
                    [-1] = { -jitter_amount*0.50, jitter_amount*0.50, 0, -jitter_amount*0.50, 0, jitter_amount*0.50 },
                    [1] = { jitter_amount*0.50, -jitter_amount*0.50, 0, jitter_amount*0.50, 0, -jitter_amount*0.50 }, 
                },
                { 
                    [-1] = { -jitter_amount*0.50, jitter_amount*0.50, 0, jitter_amount*0.50, 0, -jitter_amount*0.50 },
                    [1] = { jitter_amount*0.50, -jitter_amount*0.50, 0, -jitter_amount*0.50, 0, jitter_amount*0.50 }, 
                },
            },
        }
        local en_body = {
            ["Center"] = {
                { 
                    [-1] = { -1, 1 }, 
                    [1] = { 1, -1 },
                }
            },
            ["N-Way"] = functions.generate_wayjitter_tbl(ui.get(envious.anti_aim.aa[state].n_way)-2, jitter_amount*0.50)[2],
            ["New-Era"] = {
                {
                    [-1] = { -1, -1, 0, 1, 1, 0, -1, -1, 0, 1, 1, 0 },
                    [1] = { 1, 1, 0, -1, -1, 0, 1, 1, 0, -1, -1, 0 },
                },
                { 
                    [-1] = { -1, -1, 0, 1, 1, 0, 1, 1, 0, -1, -1, 0 },
                    [1] = { 1, 1, 0, -1, -1, 0, -1, -1, 0, 1, 1, 0 },
                },
                { 
                    [-1] = { -1, -1, 0, 1, 1, 0, 1, 1, 0, -1, -1, 0 },
                    [1] = { 1, 1, 0, -1, -1, 0, -1, -1, 0, 1, 1, 0 },
                },
                { 
                    [-1] = { -1, -1, 0, 1, 1, 0, -1, -1, 0, 1, 1, 0 },
                    [1] = { 1, 1, 0, -1, -1, 0, 1, 1, 0, -1, -1, 0 },
                },
            },
            ["S-Mode"] = {
                {
                    [-1] = { -1, 0, 1, 1, 0, -1, -1, 0, 1, 1, 0, -1 },
                    [1] = { 1, 0, -1, -1, 0, 1, 1, 0, -1, -1, 0, 1 },
                },
                { 
                    [-1] = { -1, 0, 1, 1, 0, -1, 1, 0, -1, -1, 0, 1 },
                    [1] = { 1, 0, -1, -1, 0, 1, -1, 0, 1, 1, 0, -1 },
                },
                { 
                    [-1] = { -1, 0, 1, 1, 0, -1, 1, 0, -1, -1, 0, 1 },
                    [1] = { 1, 0, -1, -1, 0, 1, -1, 0, 1, 1, 0, -1 },
                },
                { 
                    [-1] = { -1, 0, 1, 1, 0, -1, -1, 0, 1, 1, 0, -1 },
                    [1] = { 1, 0, -1, -1, 0, 1, 1, 0, -1, -1, 0, 1 },
                },
            },
            ["Blade"] ={ 
                {
                    [-1] = { -1, 1, 0, -1, 1, 0 },
                    [1] = { 1, -1, 0, 1, -1, 0 },
                },
                { 
                    [-1] = { -1, 1, 0, 1, -1, 0 },
                    [1] = { 1, -1, 0, -1, 1, 0 },
                },
                { 
                    [-1] = { -1, 1, 0, -1, 0, 1 },
                    [1] = { 1, -1, 0, 1, 0, -1 },
                },
                { 
                    [-1] = { -1, 1, 0, 1, 0, -1 },
                    [1] = { 1, -1, 0, -1, 0, 1 },
                },
            },
        }
        local en_yaw = { [-1] = ui.get(envious.anti_aim.aa[state].yaw_left), [0] = ui.get(envious.anti_aim.aa[state].yaw_center), [1] = ui.get(envious.anti_aim.aa[state].yaw_right) }
        local en_fake = { [-1] = ui.get(envious.anti_aim.aa[state].fake_left), [0] = 0, [1] = ui.get(envious.anti_aim.aa[state].fake_right) }
        local en_safe_head = { { [1] = 10, [0] = 3, [-1] = 0 }, { [1] = 10, [0] = 1, [-1] = -3 }, { [1] = 10, [0] = 1, [-1] = 0 }, { [1] = 10, [0] = 4, [-1] = -3 }, { [1] = 15, [0] = 7, [-1] = 0 }, { [1] = 14, [0] = 7, [-1] = -10 }, { [1] = 14, [0] = 7, [-1] = -10 } }
        local en_leg_move = { ["Default"] = "Never slide", ["Slide"] = "Always slide", ["Broken"] = (vars.jitter_bool and "Always slide" or "Never slide") }
        local en_slow_ticks = { 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12 }

        if cmd.chokedcommands == 0 then 
            if ((vars.aa.antiaim_ticks + 1) > en_antiaim_ticks[ui.get(envious.anti_aim.aa[state].jyaw)]*en_ticks_modifier) then
                vars.aa.antiaim_ticks = 1
                vars.aa.randomize = math.random(1, en_randomize[ui.get(envious.anti_aim.aa[state].jyaw)])
                if vars.aa.randomize == vars.aa.pervious_randomize then
                    vars.aa.randomize = math.random(1, en_randomize[ui.get(envious.anti_aim.aa[state].jyaw)])
                end
            else
                vars.aa.pervious_randomize = vars.aa.randomize
                vars.aa.antiaim_ticks = (vars.aa.antiaim_ticks + 1)
            end
        end
        if ui.get(envious.anti_aim.legit_key) then functions.aa_on_use(cmd) end
        if state == "Walk" then functions.modify_velocity(cmd, 76 - 75*(ui.get(envious.other.slowwalk_speed)/100)) end

        local is_defensive = (vars.breaker.defensive > 1) and (vars.breaker.defensive < (12 + toticks(client.latency()/4)))
        local defensive_state = functions.get_defensive_state()
        local is_lag = (is_defensive and defensive_state) and ((globals.tickcount() - toticks(entity.get_prop(entity.get_local_player(), "m_flSimulationTime"))) >= 0)
        local is_avoid_backstab = ui.get(envious.anti_aim.avoid_backstab) and functions.avoid_backstab(target)
        local lag_simulation = functions.get_simulation(is_lag)
        local antiaim_ticks = (en_ticks_modifier == 1) and math.min(en_antiaim_ticks[ui.get(envious.anti_aim.aa[state].jyaw)]*en_ticks_modifier, vars.aa.antiaim_ticks) or en_slow_ticks[math.min(en_antiaim_ticks[ui.get(envious.anti_aim.aa[state].jyaw)]*en_ticks_modifier, vars.aa.antiaim_ticks)]
        local randomize = math.min(en_randomize[ui.get(envious.anti_aim.aa[state].jyaw)], vars.aa.randomize)
        local freestand = en_freestand[ui.get(envious.anti_aim.aa[state].byaw)]

        local n_jitter = en_jitter[ui.get(envious.anti_aim.aa[state].jyaw)][randomize][freestand][antiaim_ticks]
        local n_body = en_body[ui.get(envious.anti_aim.aa[state].jyaw)][randomize][freestand][antiaim_ticks]
        local n_safe_head = en_safe_head[functions.get_state(velocity, cmd)][freestand_dir]
        local n_yaw = en_yaw[n_body]
        local n_fake = en_fake[n_body]

        if cmd.chokedcommands == 0 then
            vars.aa.yaw_amount = (n_yaw + n_jitter)
            vars.aa.safe_head_amount = n_safe_head
            vars.aa.body_amount = n_body
        end

        local body_amount = functions.normalize_yaw(vars.aa.body_amount)
        local yaw_amount = functions.normalize_yaw(manual_dir + vars.aa.yaw_amount)
        local safe_head_amount = functions.normalize_yaw(manual_dir + vars.aa.safe_head_amount)

        ui.set(refs.aa.yaw[1], "180")
        ui.set(refs.aa.roll_aa, 0)
        ui.set(refs.aa.fake_peek[1], false)
        ui.set(refs.aa.jyaw[1], "Off")
        ui.set(refs.aa.jyaw[2], 0)
        ui.set(refs.aa.yaw_target, ((back_dir or is_avoid_backstab) and not (ui.get(envious.anti_aim.legit_key) or ui.is_menu_open())) and "At targets" or "Local view")
        ui.set(refs.aa.fs[2], "Always On")
        ui.set(refs.g.fl_limit, (functions.contains(envious.other.exp_tweaks, "Os-aa without fakelag") and osaa_ref) and 1 or 14)
        ui.set(refs.g.dt[3], "Defensive")
        ui.set(refs.aa.leg_move, en_leg_move[ui.get(envious.other.leg_move)])
        if functions.contains(envious.other.exp_tweaks, "Charge dt in unsafe position") then
            local doubletap_ref = ui.get(refs.g.dt[1]) and ui.get(refs.g.dt[2])
            local tickbase = globals.tickcount() - entity.get_prop(entity.get_local_player(), "m_nTickBase")
            if not doubletap_ref then vars.was_charged = false end
            if (vars.was_charged == nil) and (tickbase > 0) and doubletap_ref then vars.was_charged = true end
            if (tickbase < 0) and doubletap_ref and not vars.was_charged then
                ui.set(refs.g.rage_box[2], "On hotkey")
                vars.was_charged = nil
            else
                ui.set(refs.g.rage_box[2], "Always on")
            end
        end

        if (ui.get(envious.other.auto_tp) and functions.entity_have_flag(target, "Hit")) and target ~= nil then 
            local weapon = entity.get_player_weapon(target)
            local hitchance = 100 - get_inaccuracy(get_client_entity_bind(weapon))*100
            local nextattack_time = math.max(entity.get_prop(weapon, "m_flNextPrimaryAttack"), entity.get_prop(weapon, "m_flNextSecondaryAttack"))
            local can_fire = nextattack_time <= globals.curtime()
            if hitchance > 85 and can_fire then
                local def_lag = (vars.breaker.defensive > 1) and (vars.breaker.defensive < 14)
                local delay_time = (def_lag and 0.019 or 0.009)
                if (globals.curtime() - vars.dt_time) > delay_time then
                    ui.set(refs.g.dt[1], false)
                end
            else
                vars.dt_time = globals.curtime()
            end
        else
            vars.dt_time = globals.curtime()
            ui.set(refs.g.dt[1], true)
        end

        if ui.get(envious.anti_aim.aa[state].defensive) and doubletap_ref and not is_fakelag then
            cmd.force_defensive = true
            cmd.allow_send_packet = (breaker_amount and back_dir) and lag_simulation or false
        end

        if ui.get(envious.anti_aim.legit_key) then
            ui.set(refs.aa.pitch, "Off")
            ui.set(refs.aa.yaw[2], 180)
            ui.set(refs.aa.byaw[1], is_fakelag and "Static" or "Jitter")
            ui.set(refs.aa.byaw[2], is_fakelag and -freestand_dir or 0)
            ui.set(refs.aa.fs[1], false)
            ui.set(refs.aa.edge_yaw, false)
            vars.aa.pervious_yaw = 180
        elseif is_avoid_backstab and not ui.is_menu_open() then
            ui.set(refs.aa.pitch, "Minimal")
            ui.set(refs.aa.yaw[2], functions.normalize_yaw(180 + (is_fakelag and safe_head_amount or yaw_amount)))
            ui.set(refs.aa.byaw[1], "Static")
            ui.set(refs.aa.byaw[2], body_amount)
            ui.set(refs.aa.fs[1], false)
            ui.set(refs.aa.edge_yaw, false)
            vars.aa.pervious_yaw = 180
        elseif doubletap_ref and functions.contains(envious.anti_aim.aa[state].defensive_options, "Lag flick") and ui.get(envious.anti_aim.aa[state].defensive) and ui.get(envious.anti_aim.defensive_aa) and (vars.breaker.defensive > 9) and defensive_state and not is_fakelag then
            ui.set(refs.aa.pitch, "Minimal")
            ui.set(refs.aa.yaw[2], 90*freestand_dir)
            ui.set(refs.aa.byaw[2], 180)
            ui.set(refs.aa.fs[1], false)
            ui.set(refs.aa.edge_yaw, false)
        elseif breaker_amount and back_dir and doubletap_ref and is_lag and not is_fakelag  then
            local abs_lag_yaw = math.abs(functions.normalize_yaw(110 + vars.breaker.yaw)*vars.breaker.side)
            local abs_main_yaw = math.abs(vars.aa.pervious_yaw)
            local max_main_yaw_90 = abs_main_yaw > 90 and math.abs(180 - abs_main_yaw) or abs_main_yaw
            local max_lag_yaw_90 = abs_lag_yaw > 90 and math.abs(180 - abs_lag_yaw) or abs_lag_yaw
            ui.set(refs.aa.yaw[2], functions.contains(envious.anti_aim.aa[state].defensive_options, "Yaw breaker") and  (((max_main_yaw_90 - 20) < max_lag_yaw_90 and (max_main_yaw_90 + 20) > max_lag_yaw_90) and ((yaw_amount < 0) and math.abs(functions.normalize_yaw(110 + vars.breaker.yaw)) or -math.abs(functions.normalize_yaw(110 + vars.breaker.yaw))) or functions.normalize_yaw(110 + vars.breaker.yaw)*vars.breaker.side) or yaw_amount)
            ui.set(refs.aa.pitch, functions.contains(envious.anti_aim.aa[state].defensive_options, "Pitch breaker") and "Up" or "Minimal")
            ui.set(refs.aa.byaw[1], "Jitter")
            ui.set(refs.aa.byaw[2], 0)
            ui.set(refs.aa.fs[1], false)
            ui.set(refs.aa.edge_yaw, false)
        elseif functions.entity_have_flag(target, "Hit") and ((not back_dir) or ui.get(envious.anti_aim.freestand_key)) then
            ui.set(refs.aa.pitch, "Minimal")
            ui.set(refs.aa.yaw[2], manual_dir)
            ui.set(refs.aa.byaw[1], "Static")
            ui.set(refs.aa.byaw[2], 180)
            ui.set(refs.aa.fs[1], (back_dir and ui.get(envious.anti_aim.freestand_key)))
            ui.set(refs.aa.edge_yaw, (back_dir and ui.get(envious.anti_aim.edge_yaw_key)))
            vars.aa.pervious_yaw = manual_dir
        else
            ui.set(refs.aa.pitch, "Minimal")
            ui.set(refs.aa.yaw[2], is_fakelag and safe_head_amount or yaw_amount)
            ui.set(refs.aa.byaw[1], (cmd.chokedcommands ~= 0 and not is_fakelag) and "Off" or "Static")
            ui.set(refs.aa.byaw[2], is_fakelag and freestand_dir or body_amount)
            ui.set(refs.aa.fs[1], (back_dir and ui.get(envious.anti_aim.freestand_key)))
            ui.set(refs.aa.edge_yaw, (back_dir and ui.get(envious.anti_aim.edge_yaw_key)))
            if not is_fakelag then
                functions.apply_desync(cmd, n_fake)
            end
            vars.aa.pervious_yaw = is_fakelag and safe_head_amount or yaw_amount
        end

        if ui.get(envious.other.break_extrapolation) then
            local sim_time = toticks(entity.get_prop(entity.get_local_player(), "m_flSimulationTime"))
            local last_tick = globals.tickcount() - sim_time
            if last_tick < 0 then
                if usrcmd.hasbeenpredicted then
                    ui.set(refs.g.dt[3], "Offensive")
                end
                usrcmd.hasbeenpredicted = false
            end
        end
    end),
    render = (function(ctx)
        local scrsize_x, scrsize_y = client.screen_size()
        local center_x, center_y = scrsize_x / 2, scrsize_y / 2
        local r, g, b, a = ui.get(envious.visual.color)
        local r1, g1, b1, a1 = ui.get(envious.visual.color_1)
        local r2, g2, b2, a2 = ui.get(envious.visual.color_2)
        local target = client.current_threat()
        local velocity = functions.get_velocity(entity.get_local_player())
        local state = lua_refs.states_names[functions.get_state(velocity, cmd_debug)]
        local back_dir, right_dir, left_dir, forward_dir, manual_dir = functions.manual_direction()
        local freestand_dir = functions.get_freestand_direction()
    
        for _, t in pairs(tween_table) do
            t:update(globals.frametime())
        end
    
        local fade, fraction, disfraction = functions.fade_animation()
        local pulse_alpha = functions.pulse_animation()

        local water_shadow = math.max((fade/255), (math.abs(fade-255)/255))
        local water_text = functions.gradient_text(r*fraction, g*fraction, b*fraction, fade, r*disfraction, g*disfraction, b*disfraction, math.abs(fade-255), "envious")
        local water_measure = renderer.measure_text("b", "envious")

        if entity.is_alive(entity.get_local_player()) then
            local en_freestand = { ["Default"] = 1, ["Dynamic"] = freestand_dir, ["Hybrid"] = (functions.entity_have_flag(target, "Hit") and -freestand_dir or freestand_dir)}
            local freestand = en_freestand[ui.get(envious.anti_aim.aa[state].byaw)]
            if ui.get(envious.visual.crosshair_ind) == "Envious" then
                local water_text = functions.gradient_text(r1*fraction, g1*fraction, b1*fraction, fade, r1*disfraction, g1*disfraction, b1*disfraction, math.abs(fade-255), "envious")
    
                local left_arrow_measure = renderer.measure_text("+", "<")
                local right_arrow_measure = renderer.measure_text("+", ">")
    
                if ui.get(envious.anti_aim.aa[state].byaw) ~= "Default" then
                    renderer.text(center_x - 50 - left_arrow_measure, center_y - 16, (freestand == 1) and r1 or 170, (freestand == 1) and g1 or 170, (freestand == 1) and b1 or 170, (freestand == 1) and 255 or 100, "+", 0, "<")
                    renderer.text(center_x + 50, center_y - 16, (freestand == -1) and r1 or 170, (freestand == -1) and g1 or 170, (freestand == -1) and b1 or 170, (freestand == -1) and 255 or 100, "+", 0, ">")
                    if freestand ~= freestand_dir then
                        if freestand == 1 then
                            renderer.text(center_x - 50 - left_arrow_measure*2, center_y - 16, r1, g1, b1, 255, "+", 0, "<")
                        else
                            renderer.text(center_x + 50 + right_arrow_measure, center_y - 16, r1, g1, b1, 255, "+", 0, ">")
                        end
                    end
                end
    
                local fake_amount = math.abs(vars.fake_amount)
                tween_table.fake_amount = tween.new(1, tween_data, {fake_amount = fake_amount}, "linear")
                local fake_amount = tween_data.fake_amount
                
                local desync_str_measure = renderer.measure_text("b", tostring(math.floor(fake_amount*10)/10))
                
                renderer.text(center_x - desync_str_measure/2, center_y + 25, r2, g2, b2, 255, "b", 0, tostring(math.floor(fake_amount*10)/10).."°")
                renderer.gradient(center_x, center_y + 43, -fake_amount, 2, r1, g1, b1, 255, r1, g1, b1, 0, true)
                renderer.gradient(center_x, center_y + 43, fake_amount, 2, r1, g1, b1, 255, r1, g1, b1, 0, true)
                functions.faded_shadow(center_x + 3 - water_measure/2, center_y + 51, water_measure-6, 8, r1, g1, b1, 20*water_shadow, 6, 6)
                renderer.text(center_x - water_measure/2, center_y + 48, 35, 35, 35, 255, "b", 0, "envious")
                renderer.text(center_x - water_measure/2, center_y + 48, 255, 255, 255, 255, "b", 0, water_text)
            elseif ui.get(envious.visual.crosshair_ind) == "Team skeet" then
                renderer.triangle(center_x + 55, center_y + 2, center_x + 42, center_y - 7, center_x + 42, center_y + 11, 
                right_dir and r1 or 35, 
                right_dir and g1 or 35, 
                right_dir and b1 or 35, 
                right_dir and 255 or 150)
    
                renderer.triangle(center_x - 55, center_y + 2, center_x - 42, center_y - 7, center_x - 42, center_y + 11, 
                left_dir and r1 or 35, 
                left_dir and g1 or 35, 
                left_dir and b1 or 35, 
                left_dir and 255 or 150)
                
                renderer.rectangle(center_x + 38, center_y - 7, 2, 18, 
                ((freestand == -1) and ui.get(envious.anti_aim.aa[state].byaw) ~= "Default") and r2 or 35,
                ((freestand == -1) and ui.get(envious.anti_aim.aa[state].byaw) ~= "Default") and g2 or 35,
                ((freestand == -1) and ui.get(envious.anti_aim.aa[state].byaw) ~= "Default") and b2 or 35,
                ((freestand == -1) and ui.get(envious.anti_aim.aa[state].byaw) ~= "Default") and 255 or 150)
                renderer.rectangle(center_x - 40, center_y - 7, 2, 18,			
                ((freestand == 1) and ui.get(envious.anti_aim.aa[state].byaw) ~= "Default") and r2 or 35,
                ((freestand == 1) and ui.get(envious.anti_aim.aa[state].byaw) ~= "Default") and g2 or 35,
                ((freestand == 1) and ui.get(envious.anti_aim.aa[state].byaw) ~= "Default") and b2 or 35,
                ((freestand == 1) and ui.get(envious.anti_aim.aa[state].byaw) ~= "Default") and 255 or 150)
            end
        end

        functions.faded_shadow(center_x + 3 - water_measure/2, scrsize_y - 17, water_measure-6, 8, r, g, b, 20*water_shadow, 6, 6)
        renderer.text(center_x - water_measure/2, scrsize_y - 20, 35, 35, 35, 255, "b", 0, "envious")
        renderer.text(center_x - water_measure/2, scrsize_y - 20, 255, 255, 255, 255, "b", 0, water_text)
    end),
    animation = (function()
        if entity.get_local_player() == nil then return end
        if functions.in_air(entity.get_local_player()) then
            vars.air_ticks = globals.tickcount()
        end

        local self_index = c_entity.new(entity.get_local_player())

        local animlayer_6 = self_index:get_anim_overlay(6)
        local animlayer_12 = self_index:get_anim_overlay(12)

        local vel_x, vel_y, vel_z = entity.get_prop(entity.get_local_player(), "m_vecVelocity")

        if functions.contains(envious.visual.local_anims, "Body lean in air") then
            if ((math.abs(vel_x) > 1.1) or (math.abs(vel_y) > 1.1)) and (vars.sidemove ~= 0) and functions.in_air(entity.get_local_player()) then
                animlayer_12.weight = ui.get(envious.visual.lean_amount) / 100
            end
        end

        if functions.contains(envious.visual.local_anims, "Pitch zero on land") then
            local on_ground = bit.band(entity.get_prop(entity.get_local_player(), "m_fFlags"), 1)

            if on_ground and ((vars.air_ticks + 5) < globals.tickcount()) and ((vars.air_ticks + toticks(1)) > globals.tickcount()) and not functions.in_air(entity.get_local_player()) then
                entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0.5, 12)
            end
        end

        if functions.contains(envious.visual.local_anims, "Static legs in air") then
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 6) 
        end

        if functions.contains(envious.visual.local_anims, "Static move yaw") then
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 7)
        end

        if functions.contains(envious.visual.local_anims, "Broken animations") then
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", math.random(0, 10)/10, 3)
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", math.random(0, 10)/10, 7)
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", math.random(0, 10)/10, 6)  
        end

        if functions.contains(envious.visual.local_anims, "Air move") then
            if functions.in_air(entity.get_local_player()) then
                animlayer_6.weight = 1
            end
        end

        if functions.contains(envious.visual.local_anims, "Restate on fd") then
            if ui.get(refs.g.fake_duck) then
                entity.set_prop(entity.get_local_player(), "m_flPoseParameter", (globals.tickcount() % 6) > 2 and 1 or 0, 16)
                entity.set_prop(entity.get_local_player(), "m_flPoseParameter", (globals.tickcount() % 6) > 2 and 1 or 0, 17)
            end
        end
    end)
}

client.set_event_callback("run_command", function(cmd)
    local player_index = c_entity.new(entity.get_local_player())
    local anim_state = player_index:get_anim_state()
    local pitch, yaw = client.camera_angles()

    vars.breaker.cmd = cmd.command_number
    if cmd.chokedcommands == 0 then
        vars.jitter_bool = not vars.jitter_bool
        vars.jitter_value = vars.jitter_bool and 1 or -1
        vars.view_yaw = functions.normalize_yaw((anim_state.eye_angles_y - yaw) + 180)
        vars.fake_amount = entity.get_prop(entity.get_local_player(), "m_flPoseParameter", 11) * 120 - 60
    end
end)

client.set_event_callback("predict_command", function(cmd)
    if cmd.command_number == vars.breaker.cmd then
        local tickbase = entity.get_prop(entity.get_local_player(), "m_nTickBase")
        vars.breaker.defensive = math.abs(tickbase - vars.breaker.defensive_check)
        vars.breaker.defensive_check = math.max(tickbase, vars.breaker.defensive_check)
        vars.breaker.cmd = 0
    end
end)

client.set_event_callback("setup_command", function(cmd)
    cmd_debug = cmd

    lua_functional.create_move(cmd)

    if (math.abs(cmd.move_yaw - vars.view_yaw) >= 45) and (math.abs(cmd.move_yaw - vars.view_yaw) <= 135) then
        vars.sidemove = cmd.forwardmove
        vars.forwardmove = cmd.sidemove
    else
        vars.sidemove = cmd.sidemove
        vars.forwardmove = cmd.forwardmove
    end
end)

client.set_event_callback("paint", function(ctx)
    lua_functional.render(ctx)
end)

client.set_event_callback("pre_render", function(ctx)
    lua_functional.animation()
end)

local elements_hiding = {
    ["yaw_center"] = (function(state) return ui.get(envious.anti_aim.aa[state].jyaw) ~= "Center" end),
    ["n_way"] = (function(state) return ui.get(envious.anti_aim.aa[state].jyaw) == "N-Way" end),
    ["defensive_aa"] = (function(state) return ui.get(envious.anti_aim.aa[state].defensive) end),
    ["defensive_options"] = (function(state) return ui.get(envious.anti_aim.aa[state].defensive) end),
    ["color_1"] = (function() return ui.get(envious.visual.crosshair_ind) ~= "Disabled" end),
    ["color_2"] = (function() return ui.get(envious.visual.crosshair_ind) ~= "Disabled" end),
    ["lean_amount"] = (function() return functions.contains(envious.visual.local_anims, "Body lean in air") end),
}

local elements_functions = {

}

local visualize = {
    skeet_builder = (function(value)
        for k, v in pairs(refs.aa) do
            if type(v) == "table" then
                for a, b in pairs(v) do
                    ui.set_visible(b, value)
                end
            else
                ui.set_visible(v, value)
            end
        end
    end),
    aa_tab = (function(value)
        for _, c in pairs(envious.anti_aim) do
            if type(c) == "table" then
                for a=1, 7 do
                    for k, v in pairs(envious.anti_aim.aa[lua_refs.states_names[a]]) do
                        local is_cur_tab = lua_refs.states_names[a] == ui.get(envious.anti_aim.aa_state)
                        if elements_hiding[tostring(k)] ~= nil then
                            ui.set_visible(v, (elements_hiding[tostring(k)](lua_refs.states_names[a]) and is_cur_tab) and value or false)
                        else
                            ui.set_visible(v, is_cur_tab and value or false)
                        end
                        if elements_functions[tostring(k)] ~= nil then elements_functions[tostring(k)](lua_refs.states_names[a]) end
                    end
                end
            else
                if elements_hiding[tostring(_)] ~= nil then
                    ui.set_visible(c, elements_hiding[tostring(_)](ui.get(envious.anti_aim.aa_state)) and value or false)
                else
                    ui.set_visible(c, value)
                end
            end
        end
    end),
    vis_tab = (function(value)
        for _, c in pairs(envious.visual) do
            if elements_hiding[tostring(_)] ~= nil then
                ui.set_visible(c, elements_hiding[tostring(_)]() and value or false)
            else
                ui.set_visible(c, value)
            end
        end
    end),
    add_tab = (function(value)
        for _, c in pairs(envious.other) do
            ui.set_visible(c, value)
        end
    end),
    cfg_tab = (function(value)
        for _, c in pairs(envious.config) do
            ui.set_visible(c, value)
        end
    end),
}

client.set_event_callback("paint_ui", function()
    vars.breaker.yaw = (vars.breaker.yaw == 140) and 0 or (vars.breaker.yaw + 4)
    if vars.breaker.yaw == 0 then vars.breaker.side = -vars.breaker.side end
    if envious.start.f > globals.curtime() then envious.start.f = -10; vars.breaker.defensive_check = 0; end

    ui.set_visible(envious.start.a, ((globals.curtime() - envious.start.f) >= 3 and (globals.curtime() - envious.start.f) < 4))
    ui.set_visible(envious.start.b, ((globals.curtime() - envious.start.f) >= 3 and (globals.curtime() - envious.start.f) < 4))
    ui.set_visible(envious.start.c, ((globals.curtime() - envious.start.f) >= 0 and (globals.curtime() - envious.start.f) < 1))
    ui.set_visible(envious.start.d, ((globals.curtime() - envious.start.f) >= 1 and (globals.curtime() - envious.start.f) < 2))
    ui.set_visible(envious.start.e, ((globals.curtime() - envious.start.f) >= 2 and (globals.curtime() - envious.start.f) < 3))

    if (globals.curtime() - envious.start.f) < 4 then
        ui.set_visible(envious.tab, false)
        visualize.skeet_builder((globals.curtime() - envious.start.f) < 3)
        visualize.aa_tab(false)
        visualize.vis_tab(false)
        visualize.add_tab(false)
        visualize.cfg_tab(false)
    else
        ui.set_visible(envious.tab, true)
        visualize.skeet_builder(false)
        visualize.aa_tab(ui.get(envious.tab) == "Anti-Aim")
        visualize.vis_tab(ui.get(envious.tab) == "Visuals")
        visualize.add_tab(ui.get(envious.tab) == "Other")
        visualize.cfg_tab(ui.get(envious.tab) == "Config")
    end

    if (globals.mapname() ~= vars.mapname) then
        vars.aa.default_side = (vars.aa.default_side == 1) and -1 or 1
        vars.breaker.cmd = 0
        vars.breaker.defensive = 0
        vars.breaker.defensive_check = 0
        vars.breaker.last_sim_time = 0
        vars.breaker.defensive_until = 0
        vars.breaker.lag_record = { }
        vars.mapname = globals.mapname()
    end
end)

client.set_event_callback("round_start", function()
    vars.aa.default_side = (vars.aa.default_side == 1) and -1 or 1
    vars.breaker.cmd = 0
    vars.breaker.defensive = 0
    vars.breaker.defensive_check = 0
    vars.breaker.last_sim_time = 0
    vars.breaker.defensive_until = 0
    vars.breaker.lag_record = { }
end)

client.set_event_callback("player_connect_full", function(e)
    local ent = client.userid_to_entindex(e.userid)
    if ent == entity.get_local_player() then
        vars.aa.default_side = (vars.aa.default_side == 1) and -1 or 1
        vars.breaker.cmd = 0
        vars.breaker.defensive = 0
        vars.breaker.defensive_check = 0
        vars.breaker.last_sim_time = 0
        vars.breaker.defensive_until = 0
        vars.breaker.lag_record = { }
    end
end)