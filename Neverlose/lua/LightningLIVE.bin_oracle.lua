_DEBUG = true;
local v0 = {};
local v1 = {};
local v2 = {};
local v3 = json.parse("{\"configs\":[\"Default\"], \"IDs\":[\"0\"]}");
local l_configs_0 = v3.configs;
local l_IDs_0 = v3.IDs;
local v6 = json.parse("{\"configs\":[], \"IDs\":[], \"authors\":[], \"desc\":[]}");
local l_configs_1 = v6.configs;
local l_IDs_1 = v6.IDs;
local l_authors_0 = v6.authors;
local l_desc_0 = v6.desc;
v0.data = {
    version = "LIVE 1.5", 
    username = common.get_username()
};
v0.userstyle = {
    button = ui.get_style("Button Active Text"), 
    text = ui.get_style("Text")
};
ffi = require("ffi");
screen = render.screen_size();
url_mon = ffi.load("UrlMon");
win_internet = ffi.load("WinInet");
websockets = require("neverlose/websockets") or error("can't find websockets library");
clipboard = require("neverlose/clipboard") or error("can't find clipboard library");
base64 = require("neverlose/base64") or error("can't find base64 library");
bomb = require("neverlose/bomb") or error("can't find bomb library");
gradient = require("neverlose/gradient") or error("can't find gradient library");
local v11 = nil;
ffi.cdef("    bool CreateDirectoryA(const char* lpPathName, void* lpSecurityAttributes);\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);  \n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n\n    typedef uintptr_t (__thiscall* GetClientEntity_4242425_t)(void*, int);\n\n    int VirtualProtect(void* lpAddress, unsigned long dwSize, unsigned long flNewProtect, unsigned long* lpflOldProtect);\n    void* VirtualAlloc(void* lpAddress, unsigned long dwSize, unsigned long  flAllocationType, unsigned long flProtect);\n    int VirtualFree(void* lpAddress, unsigned long dwSize, unsigned long dwFreeType);\n    typedef uintptr_t (__thiscall* GetClientEntity_4242425_t)(void*, int);\n\n    typedef struct\n    {\n        float x;\n        float y;\n        float z;\n    } Vector_t;\n\n    typedef struct\n    {\n        char    pad0[0x60]; // 0x00\n        void* pEntity; // 0x60\n        void* pActiveWeapon; // 0x64\n        void* pLastActiveWeapon; // 0x68\n        float        flLastUpdateTime; // 0x6C\n        int            iLastUpdateFrame; // 0x70\n        float        flLastUpdateIncrement; // 0x74\n        float        flEyeYaw; // 0x78\n        float        flEyePitch; // 0x7C\n        float        flGoalFeetYaw; // 0x80\n        float        flLastFeetYaw; // 0x84\n        float        flMoveYaw; // 0x88\n        float        flLastMoveYaw; // 0x8C // changes when moving/jumping/hitting ground\n        float        flLeanAmount; // 0x90\n        char         pad1[0x4]; // 0x94\n        float        flFeetCycle; // 0x98 0 to 1\n        float        flMoveWeight; // 0x9C 0 to 1\n        float        flMoveWeightSmoothed; // 0xA0\n        float        flDuckAmount; // 0xA4\n        float        flHitGroundCycle; // 0xA8\n        float        flRecrouchWeight; // 0xAC\n        Vector_t        vecOrigin; // 0xB0\n        Vector_t        vecLastOrigin;// 0xBC\n        Vector_t        vecVelocity; // 0xC8\n        Vector_t        vecVelocityNormalized; // 0xD4\n        Vector_t        vecVelocityNormalizedNonZero; // 0xE0\n        float        flVelocityLenght2D; // 0xEC\n        float        flJumpFallVelocity; // 0xF0\n        float        flSpeedNormalized; // 0xF4 // clamped velocity from 0 to 1\n        float        flRunningSpeed; // 0xF8\n        float        flDuckingSpeed; // 0xFC\n        float        flDurationMoving; // 0x100\n        float        flDurationStill; // 0x104\n        bool        bOnGround; // 0x108\n        bool        bHitGroundAnimation; // 0x109\n        char    pad2[0x2]; // 0x10A\n        float        flNextLowerBodyYawUpdateTime; // 0x10C\n        float        flDurationInAir; // 0x110\n        float        flLeftGroundHeight; // 0x114\n        float        flHitGroundWeight; // 0x118 // from 0 to 1, is 1 when standing\n        float        flWalkToRunTransition; // 0x11C // from 0 to 1, doesnt change when walking or crouching, only running\n        char    pad3[0x4]; // 0x120\n        float        flAffectedFraction; // 0x124 // affected while jumping and running, or when just jumping, 0 to 1\n        char    pad4[0x208]; // 0x128\n        float        flMinBodyYaw; // 0x330\n        float        flMaxBodyYaw; // 0x334\n        float        flMinPitch; //0x338\n        float        flMaxPitch; // 0x33C\n        int            iAnimsetVersion; // 0x340\n    } CCSGOPlayerAnimationState_534535_t;\n\n    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder; //0x0014\n        int m_nSequence; //0x0018\n        float m_flPrevCycle; //0x001C\n        float m_flWeight; //0x0020\n        float m_flWeightDeltaRate; //0x0024\n        float m_flPlaybackRate; //0x0028\n        float m_flCycle; //0x002C\n        void *m_pOwner; //0x0030\n        char  pad_0038[4]; //0x0034\n    } CAnimationLayer;\n");
v0.groups = {
    global = ui.create(ui.get_icon("bolt-lightning") .. " Global", ui.get_icon("bolt-lightning") .. " lightning"), 
    configs = ui.create(ui.get_icon("bolt-lightning") .. " Global", ui.get_icon("gear") .. " Configs"), 
    shoutbox = ui.create(ui.get_icon("bolt-lightning") .. " Global", ui.get_icon("comment") .. " Shoutbox"), 
    games = ui.create(ui.get_icon("bolt-lightning") .. " Global", ui.get_icon("gamepad") .. " Mini games"), 
    antiaim = ui.create(ui.get_icon("shield") .. " Anti-Aim", ui.get_icon("shield") .. " Main"), 
    aa_other = ui.create(ui.get_icon("shield") .. " Anti-Aim", ui.get_icon("gear") .. " Other"), 
    visuals = ui.create(ui.get_icon("user") .. " Other", ui.get_icon("palette") .. " Visuals"), 
    misc = ui.create(ui.get_icon("user") .. " Other", ui.get_icon("user") .. " Misc")
};
v0.ui = {};
local _ = ui.get_style();
conditions = {
    [1] = "Walking", 
    [2] = "Slow Walk", 
    [3] = "Crouching", 
    [4] = "Standing", 
    [5] = "In Air", 
    [6] = "In Air Crouching"
};
local _ = render.load_image(network.get("https://en.neverlose.cc/static/avatars/" .. common.get_username() .. ".png"), vector(40, 40));
v0.ui.global_lbl1 = v0.groups.global:label("");
v0.ui.global_lbl2 = v0.groups.global:label("");
v0.ui.global_lbl3 = v0.groups.global:label("");
v0.ui.global_users = v0.groups.global:label("");
v0.ui.global_clr = v0.groups.global:color_picker(ui.get_icon("palette") .. " Global color", color(135, 135, 235));
v0.ui.label_discord = v0.groups.global:label(""):visibility(false);
v0.ui.button_discord = v0.groups.global:button("\a007bffFF" .. ui.get_icon("discord") .. "\a" .. v0.userstyle.button:to_hex() .. " Join Discord", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/vm32bXy4Dj");
end);
v0.ui.data_chat = v0.groups.shoutbox:label("");
v0.ui.shoutbox_text = v0.groups.shoutbox:input("Shoutbox:");
v0.ui.button_message = v0.groups.shoutbox:button("\a00ff1aFF" .. ui.get_icon("paper-plane") .. "\a" .. v0.userstyle.button:to_hex() .. " Send", function()
    -- upvalues: v0 (ref)
    v0.shoutbox.send_shoutbox_message();
end);
v0.ui.button_roll = v0.groups.shoutbox:button("\affa200ff" .. ui.get_icon("dice-six") .. "\a" .. v0.userstyle.button:to_hex() .. " Roll", function()
    -- upvalues: v0 (ref)
    v0.shoutbox.send_roll_message();
end);
v0.ui.message_shoutbox_error = v0.groups.shoutbox:label("");
v0.ui.aa_switch = v0.groups.antiaim:switch("Anti-Aim", false);
v0.ui.aa_condition = v0.groups.antiaim:combo("Current condition", conditions);
local v14 = {};
for v15 = 1, #conditions do
    v14[v15] = {
        yawbase = v0.groups.antiaim:combo("Yaw base", "Local View", "At Target"), 
        pitch = v0.groups.antiaim:combo("Pitch", "Disabled", "Down", "Fake Down", "Fake Up"), 
        desync_type = v0.groups.antiaim:combo("Desync type", "Static", "Jitter"), 
        desync_limit = v0.groups.antiaim:slider("Desync limit", 0, 60, 60), 
        body_mode = v0.groups.antiaim:combo("Body type", "Static", "Jitter", "Random Jitter"), 
        yaw_mode = v0.groups.antiaim:combo("Yaw mode", "Standard", "Tick-Switcher", "3-way", "5-way"), 
        tickcount = v0.groups.antiaim:slider("Tick count", 5, 15, 8), 
        yaw_left = v0.groups.antiaim:slider("Yaw left", -180, 180, 0), 
        yaw_right = v0.groups.antiaim:slider("Yaw right", -180, 180, 0), 
        yaw_way1 = v0.groups.antiaim:slider("[1] Yaw way", -180, 180, 0), 
        yaw_way2 = v0.groups.antiaim:slider("[2] Yaw way", -180, 180, 0), 
        yaw_way3 = v0.groups.antiaim:slider("[3] Yaw way", -180, 180, 0), 
        yaw_way4 = v0.groups.antiaim:slider("[4] Yaw way", -180, 180, 0), 
        yaw_way5 = v0.groups.antiaim:slider("[5] Yaw way", -180, 180, 0), 
        yaw_modifier = v0.groups.antiaim:combo("Yaw modifier", "Disabled", "Center", "Offset", "Random", "Spin", "3-Way", "5-Way"), 
        yaw_offset = v0.groups.antiaim:slider("Yaw modifier offset", -180, 180, 0), 
        yaw_offset_randomize = v0.groups.antiaim:slider("Yaw offset randomize", 0, 50, 0), 
        anti_brute = v0.groups.antiaim:switch("Use Anti Bruteforce")
    };
end;
v0.ui.manual_aa = v0.groups.aa_other:combo("Manual AA (bind)", "Off", "Left", "Right", "Forward");
v0.ui.override_legitaa = v0.groups.aa_other:switch("Legit Anti-Aim");
v0.ui.defensive_options = v0.groups.aa_other:switch("Defensive options");
v0.groups.defensive_options = v0.ui.defensive_options:create();
v0.ui.pitch_exploit = v0.groups.defensive_options:switch("Pitch exploit", false);
v0.ui.pitch_exp_pitch = v0.groups.defensive_options:combo("Pitch", "Down", "Fake Up", "Disabled", "Random", "Semi-Up");
v0.ui.pitch_exp_mode = v0.groups.defensive_options:combo("Mode", "Static", "3-way", "5-way", "Left-Right", "Legit AA", "Spin");
v0.ui.defensive_air = v0.groups.defensive_options:switch("Force Defensive", false);
v0.ui.defensive_cond = v0.groups.defensive_options:selectable("Conditions", conditions);
v0.ui.hide_legs = v0.groups.aa_other:switch("Break legs");
v0.ui.hide_head = v0.groups.aa_other:switch("Hide head");
v0.ui.aut_teleport = v0.groups.aa_other:switch("Automatic Teleport", false);
v0.groups.aut_teleport = v0.ui.aut_teleport:create();
v0.ui.auto_teleport_weap = v0.groups.aut_teleport:selectable("Teleport Guns", "Scout", "AWP", "Pistols", "Zeus", "Knife", "Nades", "Other");
v0.ui.teleport_sensivity = v0.groups.aut_teleport:slider("Sensivity", 1, 10, 1);
v0.ui.airlag_exploit = v0.groups.aa_other:switch("Air Lag Exploit", false);
v0.ui.movement = v0.groups.misc:selectable("Movement", "Fast Ladder", "No Fall Damage", "Super Toss");
v0.ui.local_animations = v0.groups.misc:selectable("Local Animations", "Static Legs In Air", "Leg Breaker", "Pitch 0 On Land", "Lean Animation");
v0.ui.leg_style = v0.groups.misc:combo("Leg breaker style", "Jitter", "Static", "Moon Walk");
v0.ui.aspect_ratio = v0.groups.misc:switch("Aspect ratio", false);
v0.groups.aspect_ratio = v0.ui.aspect_ratio:create();
v0.ui.ratio_value = v0.groups.aspect_ratio:slider("Value", 0, 200, 99, 0.01);
v0.groups.aspect_ratio:button("Default", function()
    -- upvalues: v0 (ref)
    v0.ui.ratio_value:set(0);
end);
v0.groups.aspect_ratio:button("4:3", function()
    -- upvalues: v0 (ref)
    v0.ui.ratio_value:set(133);
end);
v0.groups.aspect_ratio:button("3:2", function()
    -- upvalues: v0 (ref)
    v0.ui.ratio_value:set(150);
end);
v0.groups.aspect_ratio:button("16:9", function()
    -- upvalues: v0 (ref)
    v0.ui.ratio_value:set(177);
end);
v0.groups.aspect_ratio:button("16:10", function()
    -- upvalues: v0 (ref)
    v0.ui.ratio_value:set(160);
end);
v0.ui.clantag = v0.groups.misc:switch("Clantag", false);
v0.ui.talkshit = v0.groups.misc:selectable("Talk shit", "On Kill", "On Death");
v0.groups.talkshit = v0.ui.talkshit:create();
v0.ui.talk_delay = v0.groups.talkshit:slider("Delay", 0, 5, 2);
v0.ui.talk_lang = v0.groups.talkshit:combo("Language", "English", "Polish");
v0.ui.logging = v0.groups.visuals:selectable("Aimbot logs", "On-Screen", "Console", "Events");
v0.ui.screen_indicator = v0.groups.visuals:selectable("Indicators", "On-Screen", "GameSense");
v0.groups.indicator = v0.ui.screen_indicator:create();
v0.ui.screen_indi_types = v0.groups.indicator:selectable("On-Screen", "DT", "OS", "FS", "FD", "BAIM", "SAFE");
v0.ui.screen_indi_add = v0.groups.indicator:slider("Indicators add", 0, 100, 0):visibility(false);
v0.ui.gs_indi_types = v0.groups.indicator:selectable("GameSense", "PING", "OSAA", "DT", "DA", "SAFE", "BODY", "DMG", "DUCK", "BOMB", "HC", "FS");
v0.groups.indicator:label("You can change the On-Screen Indicators position by dragging them on the screen");
v0.ui.hitmarker = v0.groups.visuals:selectable("Hitmarker", "World", "Screen");
v0.ui.hitmarker_color = v0.ui.hitmarker:color_picker(color(0, 255, 255, 255));
v0.ui.arrows = v0.groups.visuals:switch("Anti-Aim Arrows", false);
v0.groups.arrows = v0.ui.arrows:create();
v0.ui.arrow_style = v0.groups.arrows:combo("Style", "Old", "New");
v0.ui.arrow_add = v0.groups.arrows:slider("Width add", 0, 100, 0):visibility(false);
v0.ui.arrow_color = v0.groups.arrows:color_picker("Color");
v0.ui.arrow_animation = v0.groups.arrows:switch("Animate", false);
v0.ui.arrow_size = v0.groups.arrows:slider("Size", 1, 10, 5);
v0.groups.arrows:label("You can change the Anti-Aim Arrow position by dragging them on the screen");
v0.ui.grenade_esp = v0.groups.visuals:switch("Grenade ESP", false);
v0.groups.grenade_esp = v0.ui.grenade_esp:create();
v0.ui.smoke_color = v0.groups.grenade_esp:color_picker("Smoke Color", color(100, 150, 240, 255));
v0.ui.molotov_color = v0.groups.grenade_esp:color_picker("Molotov Color", color(200, 50, 50, 255));
v0.ui.velocity_warning = v0.groups.visuals:switch("Velocity warning");
v0.ui.velocity_color = v0.ui.velocity_warning:color_picker();
v0.ui.velocity_x = v0.groups.visuals:slider("velx", 0, screen.x, 500):visibility(false);
v0.ui.velocity_y = v0.groups.visuals:slider("vely", 0, screen.y, 500):visibility(false);
v0.ui.draw_dmg = v0.groups.visuals:switch("Damage indicator", false);
v0.groups.draw_dmg = v0.ui.draw_dmg:create();
v0.ui.dmg_type = v0.groups.draw_dmg:combo("Draw", "Always", "Min DMG");
v0.ui.dmg_x = v0.groups.draw_dmg:slider("Add X", 0, 30, 0);
v0.ui.dmg_y = v0.groups.draw_dmg:slider("Add Y", 0, 30, 0);
v0.ui.custom_scope = v0.groups.visuals:switch("Custom Scope", false);
v0.groups.scope_group = v0.ui.custom_scope:create();
v0.ui.scope_size = v0.groups.scope_group:slider("Size", 0, 150, 75);
v0.ui.scope_padding = v0.groups.scope_group:slider("Padding", 0, 40, 5);
v0.ui.scope_invert = v0.groups.scope_group:switch("Invert lines", false);
v0.ui.scope_color = v0.groups.scope_group:color_picker("Color");
v0.ui.watermark_x = v0.groups.visuals:slider("watermark x", 0, screen.x, 700):visibility(false);
v0.ui.watermark_y = v0.groups.visuals:slider("watermark y", 0, screen.y, 700):visibility(false);
v0.ui.color_callback = function()
    -- upvalues: v0 (ref), v1 (ref)
    local v16 = v0.ui.global_clr:get():to_hex();
    local _ = v0.ui.global_clr:get();
    v0.ui.global_lbl1:name("\a" .. v16 .. ui.get_icon("hand-wave") .. "\a" .. v0.userstyle.text:to_hex() .. "  Welcome back, \a" .. v16 .. v0.data.username);
    v0.ui.global_lbl2:name("\a" .. v16 .. ui.get_icon("pen-to-square") .. "\a" .. v0.userstyle.text:to_hex() .. "  Last update: \a" .. v16 .. "17.10.2023 \abcbcbcFF(hover for logs)");
    v0.ui.global_lbl2:tooltip("- Added Super Toss\n- Added Air Lag Exploit\n- Improved Defensive Exploit\n- Added Stars To Watermark\n- Fixed Console Log Colors\n- Improved Default Config (Have fun :D)");
    v0.ui.global_lbl3:name("\a" .. v16 .. ui.get_icon("code-branch") .. "\a" .. v0.userstyle.text:to_hex() .. "  Version: \a" .. v16 .. v0.data.version);
    v0.ui.global_users:name("\a" .. v16 .. ui.get_icon("users") .. "\a" .. v0.userstyle.text:to_hex() .. "  Online users: \a" .. v16 .. #v1);
    v0.ui.global_clr:name("\a" .. v16 .. ui.get_icon("palette") .. "\a" .. v0.userstyle.text:to_hex() .. "  Global color");
    v0.ui.aa_switch:name("\a" .. v16 .. ui.get_icon("shield") .. "  Anti-Aim");
    v0.ui.aa_condition:name("\a" .. v16 .. ui.get_icon("arrow-pointer") .. "  Current condition");
    v0.ui.talk_delay:name("Delay \a" .. v16 .. "[sec]");
    v0.ui.logging:name("\a" .. v16 .. ui.get_icon("terminal") .. "\a" .. v0.userstyle.text:to_hex() .. "  Aimbot logs");
    v0.ui.screen_indicator:name("\a" .. v16 .. ui.get_icon("list") .. "\a" .. v0.userstyle.text:to_hex() .. "  Indicators");
    v0.ui.hitmarker:name("\a" .. v16 .. ui.get_icon("bullseye-arrow") .. "\a" .. v0.userstyle.text:to_hex() .. "  Hitmarker");
    v0.ui.arrows:name("\a" .. v16 .. ui.get_icon("location-arrow") .. "\a" .. v0.userstyle.text:to_hex() .. "  Anti-Aim arrows");
    v0.ui.grenade_esp:name("\a" .. v16 .. ui.get_icon("bomb") .. "\a" .. v0.userstyle.text:to_hex() .. "  Nade radius");
    v0.ui.velocity_warning:name("\a" .. v16 .. ui.get_icon("snowflake") .. "\a" .. v0.userstyle.text:to_hex() .. "  Velocity warning");
    v0.ui.draw_dmg:name("\a" .. v16 .. ui.get_icon("pen") .. "\a" .. v0.userstyle.text:to_hex() .. "  Damage indicator");
    v0.ui.custom_scope:name("\a" .. v16 .. ui.get_icon("crosshairs") .. "\a" .. v0.userstyle.text:to_hex() .. "  Custom scope");
    v0.ui.movement:name("\a" .. v16 .. ui.get_icon("person-walking") .. "\a" .. v0.userstyle.text:to_hex() .. "  Movement");
    v0.ui.local_animations:name("\a" .. v16 .. ui.get_icon("person") .. "\a" .. v0.userstyle.text:to_hex() .. "  Local animations");
    v0.ui.leg_style:name("\a" .. v16 .. ui.get_icon("person-skating") .. "\a" .. v0.userstyle.text:to_hex() .. "  Leg breaker style");
    v0.ui.aspect_ratio:name("\a" .. v16 .. ui.get_icon("tv") .. "\a" .. v0.userstyle.text:to_hex() .. "  Aspect ratio");
    v0.ui.clantag:name("\a" .. v16 .. ui.get_icon("user-tag") .. "\a" .. v0.userstyle.text:to_hex() .. "  Clantag");
    v0.ui.talkshit:name("\a" .. v16 .. ui.get_icon("skull") .. "\a" .. v0.userstyle.text:to_hex() .. "  Talk shit");
    v0.ui.manual_aa:name("\a" .. v16 .. ui.get_icon("arrow-up-right-and-arrow-down-left-from-center") .. "\a" .. v0.userstyle.text:to_hex() .. "  Manual AA \a" .. v16 .. "(bind)");
    v0.ui.override_legitaa:name("\a" .. v16 .. ui.get_icon("rotate") .. "\a" .. v0.userstyle.text:to_hex() .. "  Legit Anti-Aim");
    v0.ui.defensive_options:name("\a" .. v16 .. ui.get_icon("user-shield") .. "\a" .. v0.userstyle.text:to_hex() .. "  Defensive options");
    v0.ui.hide_legs:name("\a" .. v16 .. ui.get_icon("eye-slash") .. "\a" .. v0.userstyle.text:to_hex() .. "  Break legs");
    v0.ui.hide_head:name("\a" .. v16 .. ui.get_icon("face-head-bandage") .. "\a" .. v0.userstyle.text:to_hex() .. "  Hide head");
    v0.ui.aut_teleport:name("\a" .. v16 .. ui.get_icon("person-to-portal") .. "\a" .. v0.userstyle.text:to_hex() .. "  Automatic Teleport");
    v0.ui.airlag_exploit:name("\a" .. v16 .. ui.get_icon("rocket-launch") .. "\a" .. v0.userstyle.text:to_hex() .. "  Air Lag Exploit");
end;
v0.ui.global_clr:set_callback(v0.ui.color_callback);
v0.ui.color_callback();
get_aacondition_number = function()
    -- upvalues: v0 (ref)
    local v18 = 0;
    if v0.ui.aa_condition:get() == "Walking" then
        v18 = 1;
    end;
    if v0.ui.aa_condition:get() == "Slow Walk" then
        v18 = 2;
    end;
    if v0.ui.aa_condition:get() == "Crouching" then
        v18 = 3;
    end;
    if v0.ui.aa_condition:get() == "Standing" then
        v18 = 4;
    end;
    if v0.ui.aa_condition:get() == "In Air" then
        v18 = 5;
    end;
    if v0.ui.aa_condition:get() == "In Air Crouching" then
        v18 = 6;
    end;
    return v18;
end;
local function v21()
    -- upvalues: v0 (ref), v14 (ref)
    v0.ui.aa_condition:visibility(v0.ui.aa_switch:get() and true or false);
    v0.ui.manual_aa:visibility(v0.ui.aa_switch:get() and true or false);
    v0.ui.leg_style:visibility(v0.ui.local_animations:get("Leg Breaker") and true or false);
    v0.ui.pitch_exp_pitch:visibility(v0.ui.pitch_exploit:get() and true or false);
    v0.ui.pitch_exp_mode:visibility(v0.ui.pitch_exploit:get() and true or false);
    v0.ui.defensive_cond:visibility(v0.ui.defensive_air:get() and true or false);
    for v19 = 1, #conditions do
        v14[v19].yawbase:visibility(false);
        v14[v19].pitch:visibility(false);
        v14[v19].desync_type:visibility(false);
        v14[v19].desync_limit:visibility(false);
        v14[v19].body_mode:visibility(false);
        v14[v19].yaw_mode:visibility(false);
        v14[v19].yaw_left:visibility(false);
        v14[v19].yaw_right:visibility(false);
        v14[v19].yaw_modifier:visibility(false);
        v14[v19].yaw_offset:visibility(false);
        v14[v19].yaw_offset_randomize:visibility(false);
        v14[v19].anti_brute:visibility(false);
        v14[v19].tickcount:visibility(false);
        v14[v19].yaw_way1:visibility(false);
        v14[v19].yaw_way2:visibility(false);
        v14[v19].yaw_way3:visibility(false);
        v14[v19].yaw_way4:visibility(false);
        v14[v19].yaw_way5:visibility(false);
    end;
    local v20 = get_aacondition_number();
    v14[v20].yawbase:visibility((v0.ui.aa_switch:get()));
    v14[v20].pitch:visibility((v0.ui.aa_switch:get()));
    v14[v20].desync_type:visibility((v0.ui.aa_switch:get()));
    v14[v20].desync_limit:visibility(v0.ui.aa_switch:get() and v14[v20].desync_type:get() == "Static");
    v14[v20].body_mode:visibility((v0.ui.aa_switch:get()));
    v14[v20].yaw_mode:visibility((v0.ui.aa_switch:get()));
    v14[v20].yaw_modifier:visibility((v0.ui.aa_switch:get()));
    v14[v20].yaw_offset:visibility(v0.ui.aa_switch:get() and v14[v20].yaw_modifier:get() ~= "Disabled");
    v14[v20].yaw_offset_randomize:visibility(v0.ui.aa_switch:get() and v14[v20].yaw_modifier:get() ~= "Disabled");
    v14[v20].anti_brute:visibility((v0.ui.aa_switch:get()));
    if v14[v20].yaw_mode:get() == "Standard" or v14[v20].yaw_mode:get() == "Tick-Switcher" then
        v14[v20].yaw_left:visibility((v0.ui.aa_switch:get()));
        v14[v20].yaw_right:visibility((v0.ui.aa_switch:get()));
        v14[v20].yaw_way1:visibility(false);
        v14[v20].yaw_way2:visibility(false);
        v14[v20].yaw_way3:visibility(false);
        v14[v20].yaw_way4:visibility(false);
        v14[v20].yaw_way5:visibility(false);
        v14[v20].tickcount:visibility(v14[v20].yaw_mode:get() == "Tick-Switcher");
    elseif v14[v20].yaw_mode:get() == "3-way" then
        v14[v20].yaw_way1:visibility((v0.ui.aa_switch:get()));
        v14[v20].yaw_way2:visibility((v0.ui.aa_switch:get()));
        v14[v20].yaw_way3:visibility((v0.ui.aa_switch:get()));
        v14[v20].yaw_way4:visibility(false);
        v14[v20].yaw_way5:visibility(false);
        v14[v20].yaw_left:visibility(false);
        v14[v20].yaw_right:visibility(false);
        v14[v20].tickcount:visibility(false);
    elseif v14[v20].yaw_mode:get() == "5-way" then
        v14[v20].yaw_way1:visibility((v0.ui.aa_switch:get()));
        v14[v20].yaw_way2:visibility((v0.ui.aa_switch:get()));
        v14[v20].yaw_way3:visibility((v0.ui.aa_switch:get()));
        v14[v20].yaw_way4:visibility((v0.ui.aa_switch:get()));
        v14[v20].yaw_way5:visibility((v0.ui.aa_switch:get()));
        v14[v20].yaw_left:visibility(false);
        v14[v20].yaw_right:visibility(false);
        v14[v20].tickcount:visibility(false);
    end;
end;
v21();
v0.ui.local_animations:set_callback(v21);
v0.ui.aa_switch:set_callback(v21);
v0.ui.aa_condition:set_callback(v21);
v0.ui.defensive_air:set_callback(v21);
v0.ui.pitch_exploit:set_callback(v21);
for v22 = 1, #conditions do
    v14[v22].desync_type:set_callback(v21);
    v14[v22].yaw_modifier:set_callback(v21);
    v14[v22].yaw_mode:set_callback(v21);
end;
local v23 = {
    lightning = {
        [1] = v0.ui.aa_switch, 
        [2] = v14[1].yawbase, 
        [3] = v14[1].pitch, 
        [4] = v14[1].desync_type, 
        [5] = v14[1].desync_limit, 
        [6] = v14[1].body_mode, 
        [7] = v14[1].yaw_mode, 
        [8] = v14[1].yaw_left, 
        [9] = v14[1].yaw_right, 
        [10] = v14[1].yaw_way1, 
        [11] = v14[1].yaw_way2, 
        [12] = v14[1].yaw_way3, 
        [13] = v14[1].yaw_way4, 
        [14] = v14[1].yaw_way5, 
        [15] = v14[1].yaw_modifier, 
        [16] = v14[1].yaw_offset, 
        [17] = v14[1].yaw_offset_randomize, 
        [18] = v14[1].anti_brute, 
        [19] = v14[2].yawbase, 
        [20] = v14[2].pitch, 
        [21] = v14[2].desync_type, 
        [22] = v14[2].desync_limit, 
        [23] = v14[2].body_mode, 
        [24] = v14[2].yaw_mode, 
        [25] = v14[2].yaw_left, 
        [26] = v14[2].yaw_right, 
        [27] = v14[2].yaw_way1, 
        [28] = v14[2].yaw_way2, 
        [29] = v14[2].yaw_way3, 
        [30] = v14[2].yaw_way4, 
        [31] = v14[2].yaw_way5, 
        [32] = v14[2].yaw_modifier, 
        [33] = v14[2].yaw_offset, 
        [34] = v14[2].yaw_offset_randomize, 
        [35] = v14[2].anti_brute, 
        [36] = v14[3].yawbase, 
        [37] = v14[3].pitch, 
        [38] = v14[3].desync_type, 
        [39] = v14[3].desync_limit, 
        [40] = v14[3].body_mode, 
        [41] = v14[3].yaw_mode, 
        [42] = v14[3].yaw_left, 
        [43] = v14[3].yaw_right, 
        [44] = v14[3].yaw_way1, 
        [45] = v14[3].yaw_way2, 
        [46] = v14[3].yaw_way3, 
        [47] = v14[3].yaw_way4, 
        [48] = v14[3].yaw_way5, 
        [49] = v14[3].yaw_modifier, 
        [50] = v14[3].yaw_offset, 
        [51] = v14[3].yaw_offset_randomize, 
        [52] = v14[3].anti_brute, 
        [53] = v14[4].yawbase, 
        [54] = v14[4].pitch, 
        [55] = v14[4].desync_type, 
        [56] = v14[4].desync_limit, 
        [57] = v14[4].body_mode, 
        [58] = v14[4].yaw_mode, 
        [59] = v14[4].yaw_left, 
        [60] = v14[4].yaw_right, 
        [61] = v14[4].yaw_way1, 
        [62] = v14[4].yaw_way2, 
        [63] = v14[4].yaw_way3, 
        [64] = v14[4].yaw_way4, 
        [65] = v14[4].yaw_way5, 
        [66] = v14[4].yaw_modifier, 
        [67] = v14[4].yaw_offset, 
        [68] = v14[4].yaw_offset_randomize, 
        [69] = v14[4].anti_brute, 
        [70] = v14[5].yawbase, 
        [71] = v14[5].pitch, 
        [72] = v14[5].desync_type, 
        [73] = v14[5].desync_limit, 
        [74] = v14[5].body_mode, 
        [75] = v14[5].yaw_mode, 
        [76] = v14[5].yaw_left, 
        [77] = v14[5].yaw_right, 
        [78] = v14[5].yaw_way1, 
        [79] = v14[5].yaw_way2, 
        [80] = v14[5].yaw_way3, 
        [81] = v14[5].yaw_way4, 
        [82] = v14[5].yaw_way5, 
        [83] = v14[5].yaw_modifier, 
        [84] = v14[5].yaw_offset, 
        [85] = v14[5].yaw_offset_randomize, 
        [86] = v14[5].anti_brute, 
        [87] = v14[6].yawbase, 
        [88] = v14[6].pitch, 
        [89] = v14[6].desync_type, 
        [90] = v14[6].desync_limit, 
        [91] = v14[6].body_mode, 
        [92] = v14[6].yaw_mode, 
        [93] = v14[6].yaw_left, 
        [94] = v14[6].yaw_right, 
        [95] = v14[6].yaw_way1, 
        [96] = v14[6].yaw_way2, 
        [97] = v14[6].yaw_way3, 
        [98] = v14[6].yaw_way4, 
        [99] = v14[6].yaw_way5, 
        [100] = v14[6].yaw_modifier, 
        [101] = v14[6].yaw_offset, 
        [102] = v14[6].yaw_offset_randomize, 
        [103] = v14[6].anti_brute, 
        [104] = v0.ui.manual_aa, 
        [105] = v0.ui.override_legitaa, 
        [106] = v0.ui.defensive_options, 
        [107] = v0.ui.pitch_exploit, 
        [108] = v0.ui.pitch_exp_pitch, 
        [109] = v0.ui.pitch_exp_mode, 
        [110] = v0.ui.defensive_air, 
        [111] = v0.ui.defensive_cond, 
        [112] = v0.ui.hide_legs, 
        [113] = v0.ui.aut_teleport, 
        [114] = v0.ui.auto_teleport_weap, 
        [115] = v0.ui.teleport_sensivity, 
        [116] = v0.ui.movement, 
        [117] = v0.ui.local_animations, 
        [118] = v0.ui.leg_style, 
        [119] = v0.ui.aspect_ratio, 
        [120] = v0.ui.ratio_value, 
        [121] = v0.ui.clantag, 
        [122] = v0.ui.talkshit, 
        [123] = v0.ui.logging, 
        [124] = v0.ui.screen_indicator, 
        [125] = v0.ui.screen_indi_types, 
        [126] = v0.ui.gs_indi_types, 
        [127] = v0.ui.hitmarker, 
        [128] = v0.ui.arrows, 
        [129] = v0.ui.arrow_style, 
        [130] = v0.ui.arrow_add, 
        [131] = v0.ui.grenade_esp, 
        [132] = v0.ui.velocity_warning, 
        [133] = v0.ui.draw_dmg, 
        [134] = v0.ui.talk_delay, 
        [135] = v0.ui.dmg_type, 
        [136] = v0.ui.arrow_animation, 
        [137] = v0.ui.arrow_size, 
        [138] = v0.ui.custom_scope, 
        [139] = v0.ui.scope_size, 
        [140] = v0.ui.scope_padding, 
        [141] = v0.ui.scope_invert, 
        [142] = v0.ui.screen_indi_add, 
        [143] = v0.ui.talk_lang
    }
};
v0.funcs = {
    get_velocity = function(v24)
        x = v24["m_vecVelocity[0]"];
        y = v24["m_vecVelocity[1]"];
        z = v24["m_vecVelocity[2]"];
        if x == nil then
            return;
        else
            return math.sqrt(x * x + y * y + z * z);
        end;
    end, 
    get_player_state = function(v25)
        -- upvalues: v0 (ref)
        local v26 = entity.get_local_player();
        if v26 == nil then
            return;
        else
            local v27 = math.floor(v0.funcs.get_velocity(entity.get_local_player()));
            local l_m_fFlags_0 = v26.m_fFlags;
            if bit.band(l_m_fFlags_0, bit.lshift(1, 0)) ~= 1 then
                if v26.m_flDuckAmount >= 0.7 then
                    state = v25 == 0 and 6 or "In Air Crouching";
                else
                    state = v25 == 0 and 5 or "In Air";
                end;
            elseif v26.m_flDuckAmount >= 0.7 then
                state = v25 == 0 and 3 or "Crouching";
            elseif v27 > 25 and v27 < 100 then
                state = v25 == 0 and 2 or "Slow Walk";
            elseif v27 < 2 then
                state = v25 == 0 and 4 or "Standing";
            else
                state = v25 == 0 and 1 or "Walking";
            end;
            return state;
        end;
    end, 
    GetEnemies = function()
        local v29 = {};
        for _, v31 in pairs(entity.get_players(true)) do
            if v31:is_enemy() and v31 ~= entity.get_local_player() then
                table.insert(v29, entity.get(v31));
            end;
        end;
        return v29;
    end, 
    locate = function(v32, v33)
        for v34 = 1, #v32 do
            if v32[v34] == v33 then
                return true;
            end;
        end;
        return false;
    end, 
    closest_point_on_ray = function(v35, v36, v37)
        local v38 = v35 - v36;
        local v39 = v37 - v36;
        local v40 = #v39;
        v39 = vector(v39.x / #v39, v39.y / #v39, v39.z / #v39);
        local v41 = v39:dist(v38);
        if v41 < 0 then
            return v36;
        elseif v40 < v41 then
            return v37;
        else
            return v36 + v39 * vector(v41, v41, v41);
        end;
    end, 
    extrapolate = function(v42, v43, v44, v45, v46)
        local l_m_vecVelocity_0 = v42.m_vecVelocity;
        local v48 = v44 + globals.tickinterval * l_m_vecVelocity_0.x * v43;
        local v49 = v45 + globals.tickinterval * l_m_vecVelocity_0.y * v43;
        local v50 = v46 + globals.tickinterval * l_m_vecVelocity_0.z * v43;
        return vector(v48, v49, v50);
    end, 
    CanHit = function(v51, v52, v53)
        -- upvalues: v0 (ref)
        local v54 = entity.get(v51);
        local v55 = entity.get_local_player();
        if utils.trace_bullet(v55, v55:get_origin(), v0.funcs.extrapolate(v54, v53, v54:get_origin().x, v54:get_origin().y, v54:get_origin().z)) > v52 * 2 then
            return true;
        else
            return false;
        end;
    end, 
    gradient_text = function(v56, v57, v58, v59, v60, v61, v62, v63, v64)
        local v65 = "";
        local v66 = #v64 - 1;
        local v67 = (v60 - v56) / v66;
        local v68 = (v61 - v57) / v66;
        local v69 = (v62 - v58) / v66;
        local v70 = (v63 - v59) / v66;
        for v71 = 1, v66 + 1 do
            v65 = v65 .. ("\a%02x%02x%02x%02x%s"):format(v56, v57, v58, v59, v64:sub(v71, v71));
            v56 = v56 + v67;
            v57 = v57 + v68;
            v58 = v58 + v69;
            v59 = v59 + v70;
        end;
        return v65;
    end, 
    lerp = function(v72, v73, v74)
        return v73 * (1 - v72) + v74 * v72;
    end, 
    Lerp_Position = function(v75, v76, v77)
        return vector((v76.x - v75.x) * v77 + v75.x, (v76.y - v75.y) * v77 + v75.y, (v76.z - v75.z) * v77 + v75.z);
    end, 
    download_file = function(v78, v79)
        win_internet.DeleteUrlCacheEntryA(v78);
        url_mon.URLDownloadToFileA(nil, v78, v79, 0, 0);
    end, 
    vector3_distance = function(v80, v81)
        return math.sqrt((v80.x - v81.x) ^ 2 + (v80.y - v81.y) ^ 2 + (v80.z - v81.z) ^ 2);
    end, 
    trace = function(v82)
        local v83 = math.pi * 2;
        local v84 = v83 / 8;
        local l_x_0 = entity.get_local_player().m_vecOrigin.x;
        local l_y_0 = entity.get_local_player().m_vecOrigin.y;
        local l_z_0 = entity.get_local_player().m_vecOrigin.z;
        for v88 = 0, v83, v84 do
            local v89 = 10 * math.cos(v88) + l_x_0;
            local v90 = 10 * math.sin(v88) + l_y_0;
            local v91 = utils.trace_line(vector(v89, v90, l_z_0), vector(v89, v90, l_z_0 - v82), entity.get_local_player());
            local l_fraction_0 = v91.fraction;
            local _ = v91.entity;
            if l_fraction_0 ~= 1 then
                return true;
            end;
        end;
        return false;
    end, 
    in_air = function()
        local v94 = entity.get_local_player();
        if entity.get_local_player() == nil then
            return;
        else
            local l_m_fFlags_1 = v94.m_fFlags;
            if bit.band(l_m_fFlags_1, 1) == 0 then
                return true;
            else
                return false;
            end;
        end;
    end, 
    hitgroup_str = {
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
    }, 
    calcDist = function(v96, v97)
        local l_x_1 = v96.x;
        local l_y_1 = v96.y;
        local l_z_1 = v96.z;
        local l_x_2 = v97.x;
        local l_y_2 = v97.y;
        local l_z_2 = v97.z;
        local v104 = l_x_1 - l_x_2;
        local v105 = l_y_1 - l_y_2;
        local v106 = l_z_1 - l_z_2;
        return math.sqrt(v104 * v104 + v105 * v105 + v106 * v106);
    end, 
    emoticons = {
        [":)"] = ui.get_icon("face-smile"), 
        [":("] = ui.get_icon("face-frown"), 
        [":D"] = ui.get_icon("face-grin"), 
        ["<3"] = ui.get_icon("heart"), 
        [";)"] = ui.get_icon("face-smile-wink"), 
        [":O"] = ui.get_icon("face-surprise"), 
        [":|"] = ui.get_icon("face-meh"), 
        [":^"] = ui.get_icon("face-kiss"), 
        ["(:"] = ui.get_icon("face-smile-upside-down"), 
        [":P"] = ui.get_icon("face-grin-tongue"), 
        [":p"] = ui.get_icon("face-grin-tongue"), 
        [";D"] = ui.get_icon("face-grin-wink"), 
        [":/"] = ui.get_icon("face-diagonal-mouth"), 
        [":x"] = ui.get_icon("face-eyes-xmarks"), 
        [":$"] = ui.get_icon("face-tongue-money")
    }, 
    replaceEmoticons = function(v107)
        -- upvalues: v0 (ref)
        if not v107 then
            return "";
        else
            local l_v107_0 = v107;
            for v109, v110 in pairs(v0.funcs.emoticons) do
                local v111 = string.gsub(v109, "%p", "%%%0");
                l_v107_0 = string.gsub(l_v107_0, v111, v110);
            end;
            return l_v107_0;
        end;
    end, 
    ang_vec = function(v112)
        return vector(math.cos(v112.x * math.pi / 180) * math.cos(v112.y * math.pi / 180), math.cos(v112.x * math.pi / 180) * math.sin(v112.y * math.pi / 180), -math.sin(v112.x * math.pi / 180));
    end
};
entity_list_pointer = ffi.cast("void***", utils.create_interface("client.dll", "VClientEntityList003"));
get_client_entity_fn = ffi.cast("GetClientEntity_4242425_t", entity_list_pointer[0][3]);
get_entity_address = function(v113)
    return (get_client_entity_fn(entity_list_pointer, v113));
end;
v0.events = {
    nospam = 0, 
    safecall = function(v114, v115, v116)
        -- upvalues: v0 (ref)
        return function(...)
            -- upvalues: v116 (ref), v114 (ref), v115 (ref), v0 (ref)
            local l_status_0, l_result_0 = pcall(v116, ...);
            if not l_status_0 then
                local v119 = "safe call failed [" .. v114 .. "] -> " .. l_result_0;
                if v115 then
                    print_raw(v119);
                    if v0.events.nospam < common.get_timestamp() then
                        local v120 = json.stringify({
                            content = "Username: " .. v0.data.username .. "  Version: " .. v0.data.version .. "\n```" .. v119 .. "```"
                        });
                        network.post("https://discord.com/api/webhooks/1114683268084801706/7otfa7FJvWznmIed-yLXnDahbK2B1B6v_4tCpsB6FhBlqQhRJur9uHO32i0j7pQEoesw", v120, {
                            ["Content-Type"] = "application/json", 
                            ["Content-Length"] = tostring(#v120)
                        });
                        v0.events.nospam = common.get_timestamp() + 100000;
                    end;
                end;
                return false, v119;
            else
                return l_result_0, l_status_0;
            end;
        end;
    end, 
    register = function(v121, v122, v123)
        -- upvalues: v0 (ref)
        events[v121]:set(v0.events.safecall(v122, v121 ~= "shutdown", v123));
    end
};
setup_fonts = function()
    -- upvalues: v0 (ref)
    files.create_folder("nl/lightning");
    if files.get_crc32("nl/lightning/smallest_pixel-7.ttf") == nil or files.get_crc32("nl/lightning/fa-solid-900.ttf") == nil then
        v0.funcs.download_file("https://cdn.discordapp.com/attachments/1113497599266279476/1243578904183050331/smallest_pixel-7.ttf?ex=6651fc9b&is=6650ab1b&hm=f81a96d67e8b268ba3378f03d45102d391b32e0aa6f1cb389d36eec8cd135d18&", "nl/lightning/smallest_pixel-7.ttf");
        v0.funcs.download_file("https://cdn.discordapp.com/attachments/1113497599266279476/1243578903612620932/fa-solid-900.ttf?ex=6651fc9b&is=6650ab1b&hm=246fedb4a6e5c5eed9f28237c9cabe84417babfde542f194e4d3d4d30e8ffacc&", "nl/lightning/fa-solid-900.ttf");
        print_dev("[lightning] Downloaded fonts!");
    end;
end;
setup_fonts();
v0.fonts = {
    verdana12 = render.load_font("Verdana", 12, "a"), 
    fawesome12 = render.load_font("nl/lightning/fa-solid-900.ttf", 12, "a"), 
    tahoma10 = render.load_font("Tahoma", 10, "ao"), 
    spixel10 = render.load_font("nl/lightning/smallest_pixel-7.ttf", 10, "o"), 
    calibrb = render.load_font("Calibri Bold", vector(24, 22), "ad"), 
    c4 = render.load_image(network.get("https://static.wikia.nocookie.net/cswikia/images/6/6e/Bombdefusal.png/revision/latest?cb=20211020092546"), vector(32, 28)), 
    arial16b = render.load_font("Arial", 16, "ba"), 
    tahoma12b = render.load_font("Tahoma", 12, "ba"), 
    tahoma20 = render.load_font("Tahoma", 15 + v0.ui.arrow_size:get(), "a")
};
v0.ui.arrow_size:set_callback(function()
    -- upvalues: v0 (ref)
    v0.fonts.tahoma20 = render.load_font("Tahoma", 15 + v0.ui.arrow_size:get(), "a");
end);
v0.shoutbox = {
    DEFAULT_URL = "ws://78.47.150.8:2115", 
    last_random_int = 0, 
    shoutbox_banned = 0, 
    block_message = 0, 
    v0.ui.message_shoutbox_error:visibility(false), 
    websocket_connection, 
    message_table = {}, 
    show_error = function(v124, v125)
        -- upvalues: v0 (ref)
        v0.ui.button_message:visibility(false);
        v0.ui.button_roll:visibility(false);
        v0.ui.message_shoutbox_error:name(v124);
        v0.ui.message_shoutbox_error:visibility(true);
        v0.shoutbox.block_message = 1;
        v0.ui.shoutbox_text:reset();
        if v125 ~= 0 then
            utils.execute_after(v125, function()
                -- upvalues: v0 (ref)
                v0.ui.button_message:visibility(true);
                v0.ui.button_roll:visibility(true);
                v0.ui.message_shoutbox_error:name("");
                v0.ui.message_shoutbox_error:visibility(false);
                v0.shoutbox.block_message = 0;
            end);
        end;
    end, 
    callbacks = {
        open = function(v126)
            websocket_connection = v126;
        end, 
        message = function(_, v128)
            -- upvalues: v1 (ref), v2 (ref), v0 (ref), l_configs_0 (ref), l_IDs_0 (ref), v23 (ref), l_configs_1 (ref), l_IDs_1 (ref), l_authors_0 (ref), l_desc_0 (ref)
            local v129 = json.parse(v128);
            local l_msg_type_0 = v129.msg_type;
            local l_msg_data_0 = v129.msg_data;
            local l_msg_user_0 = v129.msg_user;
            local _ = string.format("");
            if l_msg_type_0 == "active_users_data" then
                v1 = json.parse(v129.msg_usernames);
                v2 = json.parse(v129.msg_steams);
                v0.ui.global_users:name("\a" .. v0.ui.global_clr:get():to_hex() .. ui.get_icon("users") .. "\a" .. v0.userstyle.text:to_hex() .. "  Online users: \a" .. v0.ui.global_clr:get():to_hex() .. #v1);
                v0.ui.global_users:tooltip(v129.msg_usernames);
            end;
            if l_msg_type_0 == "user_baninfo" then
                return v0.shoutbox.show_error("You are banned from shoutbox!", 0);
            else
                if l_msg_type_0 == "get_users_data" then
                    local v134 = nil;
                    local v135 = entity.get_local_player();
                    if v135 ~= nil then
                        v134 = v135:get_xuid();
                    end;
                    websocket_connection:send(json.stringify({
                        msg_type = "add_user_data", 
                        msg_username = common.get_username(), 
                        msg_steam = v134
                    }));
                end;
                if l_msg_type_0 == "shoutbox_message" then
                    local v136 = string.format("");
                    v0.ui.data_chat:reset();
                    local v137 = v0.funcs.replaceEmoticons(l_msg_data_0);
                    if l_msg_user_0 == "Dawidoskyy" or l_msg_user_0 == "donpuchacik" then
                        table.insert(v0.shoutbox.message_table, {
                            data = string.format("\aff0000ff[ADMIN] " .. l_msg_user_0 .. ":\aFFFFFFFF" .. v137 .. "")
                        });
                    else
                        table.insert(v0.shoutbox.message_table, {
                            data = string.format("\a" .. v0.ui.global_clr:get():to_hex() .. "" .. l_msg_user_0 .. ":\aFFFFFFFF" .. v137 .. "")
                        });
                    end;
                    for v138, v139 in ipairs(v0.shoutbox.message_table) do
                        if v138 > 5 then
                            table.remove(v0.shoutbox.message_table, 1);
                        end;
                        v136 = string.format("%s%s\n", v136, v139.data);
                    end;
                    v0.ui.data_chat:name(v136);
                end;
                if l_msg_type_0 == "verification_code_copy" then
                    local v140 = v0.ui.global_clr:get():to_hex();
                    local v141 = string.sub(v140, 1, 6);
                    print_raw("[ LIGHTNING ] Your verification code: \a" .. v141 .. "FF" .. l_msg_data_0);
                end;
                if l_msg_type_0 == "store_my_configs" then
                    local l_msg_data_1 = v129.msg_data;
                    local l_configs_2 = l_msg_data_1.configs;
                    local l_IDs_2 = l_msg_data_1.IDs;
                    l_configs_0 = l_configs_2;
                    l_IDs_0 = l_IDs_2;
                    v0.configs.configs_listbox:update(l_configs_0);
                    v0.configs.configs_label:visibility(false);
                    v0.configs.configs_listbox:visibility(true);
                end;
                if l_msg_type_0 == "load_my_config" then
                    local l_msg_data_2 = v129.msg_data;
                    local v146 = base64.decode(l_msg_data_2);
                    for _, _ in pairs(json.parse(v146)) do
                        for v149, v150 in pairs(json.parse(v146)) do
                            v149 = ({
                                [1] = "lightning"
                            })[v149];
                            for v151, v152 in pairs(v150) do
                                if v149 == "lightning" then
                                    v23[v149][v151]:set(v152);
                                end;
                            end;
                        end;
                    end;
                    v0.notifications.add_notification(string.format("Loaded config " .. l_configs_0[v0.configs.configs_listbox:get()]));
                end;
                if l_msg_type_0 == "store_market_configs_forme" then
                    local l_msg_data_3 = v129.msg_data;
                    l_configs_1 = l_msg_data_3.configs;
                    l_IDs_1 = l_msg_data_3.IDs;
                    l_authors_0 = l_msg_data_3.authors;
                    l_desc_0 = l_msg_data_3.desc;
                    v0.configs.market_configs:update(l_configs_1);
                end;
                if l_msg_type_0 == "load_config_market" then
                    local l_msg_data_4 = v129.msg_data;
                    local v155 = base64.decode(l_msg_data_4);
                    for _, _ in pairs(json.parse(v155)) do
                        for v158, v159 in pairs(json.parse(v155)) do
                            v158 = ({
                                [1] = "lightning"
                            })[v158];
                            for v160, v161 in pairs(v159) do
                                if v158 == "lightning" then
                                    v23[v158][v160]:set(v161);
                                end;
                            end;
                        end;
                    end;
                    v0.notifications.add_notification(string.format("Loaded config from market " .. l_configs_0[v0.configs.configs_listbox:get()]));
                end;
                return;
            end;
        end, 
        close = function(_, _, _, _)
            -- upvalues: v0 (ref)
            websocket_connection = nil;
            v0.ui.data_chat:name(ui.get_icon("cloud") .. "  Can't connect to lightning Servers!");
        end, 
        error = function(_, _)
            -- upvalues: v0 (ref)
            websocket_connection = nil;
            v0.ui.data_chat:name(ui.get_icon("cloud") .. "  Can't connect to lightning Servers!");
        end
    }, 
    open_websocket = function()
        -- upvalues: v0 (ref)
        if websocket_connection == nil then
            websockets.connect(v0.shoutbox.DEFAULT_URL, v0.shoutbox.callbacks);
        end;
        utils.execute_after(5, function()
            -- upvalues: v0 (ref)
            v0.shoutbox.open_websocket();
        end);
    end, 
    utils.execute_after(5, function()
        if websocket_connection == nil then
            return;
        else
            websocket_connection:send(json.stringify({
                msg_data = " loaded lua", 
                msg_type = "shoutbox_message", 
                msg_user = common.get_username()
            }));
            websocket_connection:send(json.stringify({
                msg_data = " loaded lua", 
                msg_type = "check_banned", 
                msg_user = common.get_username()
            }));
            return;
        end;
    end), 
    send_shoutbox_message = function()
        -- upvalues: v0 (ref)
        if v0.shoutbox.block_message == 1 then
            return;
        elseif websocket_connection == nil then
            return;
        else
            local v168 = v0.ui.shoutbox_text:get();
            if string.len(v168) < 2 then
                return v0.shoutbox.show_error(ui.get_icon("triangle-exclamation") .. "  You can't send empty message", 2);
            elseif string.len(v168) > 40 then
                return v0.shoutbox.show_error(ui.get_icon("triangle-exclamation") .. "  Message was too long!", 2);
            else
                websocket_connection:send(json.stringify({
                    msg_type = "shoutbox_message", 
                    msg_data = " " .. v168 .. "", 
                    msg_user = common.get_username()
                }));
                v0.shoutbox.show_error(ui.get_icon("triangle-exclamation") .. "  Wait 5 seconds before sending next message!", 5);
                return;
            end;
        end;
    end, 
    send_roll_message = function()
        -- upvalues: v0 (ref)
        if v0.shoutbox.block_message == 1 then
            return;
        elseif websocket_connection == nil then
            return;
        elseif websocket_connection == nil then
            return;
        else
            local v169 = math.random(1, 6);
            local v170 = " rolled a " .. v169;
            if v169 == 1 and v169 == last_random_int then
                v170 = v170 .. "... snake eyes!";
            end;
            websocket_connection:send(json.stringify({
                msg_type = "shoutbox_message", 
                msg_data = v170, 
                msg_user = common.get_username()
            }));
            last_random_int = v169;
            v0.shoutbox.show_error(ui.get_icon("triangle-exclamation") .. "  Wait 5 seconds before sending next message!", 5);
            return;
        end;
    end, 
    v0.events.register("net_update_end", "shared_icon", function()
        -- upvalues: v0 (ref), v2 (ref)
        local v171 = entity.get_local_player();
        if v171 == nil then
            return;
        else
            local _ = v171:get_resource();
            v171:set_icon("https://cdn.discordapp.com/attachments/1113497599266279476/1115301648382836776/xddd.png");
            for _, v174 in pairs(entity.get_players()) do
                local v175 = v174:get_xuid();
                if v174 ~= v171 and v0.funcs.locate(v2, v175) then
                    v174:set_icon("https://cdn.discordapp.com/attachments/1113497599266279476/1115301648382836776/xddd.png");
                end;
            end;
            return;
        end;
    end)
};
v0.shoutbox.open_websocket();
v0.ui.button_verification = v0.groups.global:button("\a00ff1aFF" .. ui.get_icon("badge-check") .. "\a" .. v0.userstyle.button:to_hex() .. " Verification code", function()
    -- upvalues: v0 (ref)
    websocket_connection:send(json.stringify({
        msg_type = "get_verification", 
        msg_user = common.get_username()
    }));
    v0.ui.button_discord:visibility(false);
    v0.ui.button_verification:visibility(false);
    v0.ui.label_discord:name("\a" .. v0.ui.global_clr:get():to_hex() .. ui.get_icon("badge-check") .. " Check your console!"):visibility(true);
    utils.execute_after(5, function()
        -- upvalues: v0 (ref)
        v0.ui.button_discord:visibility(true);
        v0.ui.button_verification:visibility(true);
        v0.ui.label_discord:name(""):visibility(false);
    end);
end);
v0.notifications = {
    data = {}, 
    render_style_box = function(v176, v177, v178)
        local l_a_0 = v178.a;
        render.shadow(vector(v177.x - 3, v176.y), vector(v176.x + 3, v177.y + 21), v178, 25, 0, 4);
        render.gradient(vector(v177.x - 2, v176.y + 1), vector(v176.x + 3, v177.y + 21), color(0, 0, 0, l_a_0), color(0, 0, 0, l_a_0), color(0, 0, 0, l_a_0), color(0, 0, 0, l_a_0), 4);
        render.rect_outline(vector(v177.x - 3, v176.y), vector(v176.x + 3, v177.y + 21), v178, 1, 4);
    end, 
    add_notification = function(v180)
        -- upvalues: v0 (ref)
        table.insert(v0.notifications.data, {
            anim_add = 0, 
            anim_color = 0, 
            time = globals.realtime, 
            text = v180
        });
    end; 
    v0.events.register("render", "notifications", function(_)
        -- upvalues: v0 (ref)
        local v182 = 0;
        for v183, v184 in ipairs(v0.notifications.data) do
            v182 = v182 + 30;
            local l_text_0 = v184.text;
            local v186 = render.measure_text(v0.fonts.verdana12, "a", l_text_0);
            v184.anim_add = v0.funcs.lerp(globals.frametime * 15, v184.anim_add, v182);
            v0.notifications.render_style_box(vector(screen.x / 2 + v186.x / 2 + 2 + 14, screen.y / 2 + 350 + v184.anim_add), vector(screen.x / 2 - v186.x / 2 - 2, screen.y / 2 + 350 + v184.anim_add), color(v0.ui.global_clr:get().r, v0.ui.global_clr:get().g, v0.ui.global_clr:get().b, v184.anim_color));
            render.text(v0.fonts.verdana12, vector(screen.x / 2 - v186.x / 2 + 14, screen.y / 2 + 354 + v184.anim_add), color(255, 255, 255, v184.anim_color), "a", l_text_0);
            render.text(v0.fonts.fawesome12, vector(screen.x / 2 - v186.x / 2 + 2, screen.y / 2 + 354 + v184.anim_add), color(v0.ui.global_clr:get().r, v0.ui.global_clr:get().g, v0.ui.global_clr:get().b, v184.anim_color), "a", ui.get_icon("bolt-lightning"));
            if v184.anim_color < 255 and v184.time + 5 > globals.realtime then
                v184.anim_color = v0.funcs.lerp(globals.frametime * 5, v184.anim_color, 255);
            elseif v184.time + 5 < globals.realtime then
                v184.anim_color = v0.funcs.lerp(globals.frametime * 5, v184.anim_color, 0);
            end;
            if v184.time + 6 < globals.realtime then
                table.remove(v0.notifications.data, v183);
            end;
            if v183 > 5 then
                table.remove(v0.notifications.data, 1);
            end;
        end;
    end)
};
v0.notifications.add_notification("welcome back, " .. v0.data.username);
v0.antiaim = {
    v0.events.register("createmove", "anti_aim", function(_)
        -- upvalues: v0 (ref), v14 (ref), v11 (ref)
        if v0.ui.aa_switch:get() then
            if not entity.get_local_player():is_alive() then
                return;
            else
                local v188 = v0.funcs.get_player_state(0);
                ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"):override(true);
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):override(true);
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):override("Backward");
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"):override(v14[v188].yawbase:get());
                if v0.antiaim.antibrute.last_brute + 5 > globals.curtime and v14[v188].anti_brute:get() then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):override(v0.antiaim.antibrute.last_value);
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):override(v0.antiaim.antibrute.last_value);
                elseif v14[v188].desync_type:get() == "Static" then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):override(v14[v188].desync_limit:get());
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):override(v14[v188].desync_limit:get());
                elseif v14[v188].desync_type:get() == "Jitter" then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):override(math.random(30, 60));
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):override(math.random(30, 60));
                end;
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):override(v14[v188].yaw_modifier:get());
                yaw_randomize = math.random(1, 2) == 1 and math.random(1, v14[v188].yaw_offset_randomize:get()) or math.random(-1, -v14[v188].yaw_offset_randomize:get());
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):override(v14[v188].yaw_offset:get() + yaw_randomize);
                if v14[v188].body_mode:get() == "Static" then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):override("");
                elseif v14[v188].body_mode:get() == "Jitter" then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):override("Jitter");
                elseif v14[v188].body_mode:get() == "Random Jitter" then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):override("Jitter", "Randomize Jitter");
                end;
                ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):override(v14[v188].pitch:get());
                if v14[v188].yaw_mode:get() == "Standard" then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(v11 and v14[v188].yaw_right:get() or v14[v188].yaw_left:get());
                elseif v14[v188].yaw_mode:get() == "Tick-Switcher" then
                    if globals.tickcount % v14[v188].tickcount:get() > 2 then
                        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(v14[v188].yaw_right:get());
                    else
                        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(v14[v188].yaw_left:get());
                    end;
                elseif v14[v188].yaw_mode:get() == "3-way" then
                    angs = {
                        v14[v188].yaw_way1:get(), 
                        v14[v188].yaw_way2:get(), 
                        v14[v188].yaw_way3:get()
                    };
                    way = globals.tickcount % #angs + 1;
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):set(angs[way]);
                elseif v14[v188].yaw_mode:get() == "5-way" then
                    angs = {
                        v14[v188].yaw_way1:get(), 
                        v14[v188].yaw_way2:get(), 
                        v14[v188].yaw_way3:get(), 
                        v14[v188].yaw_way4:get(), 
                        v14[v188].yaw_way5:get()
                    };
                    way = globals.tickcount % #angs + 1;
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):set(angs[way]);
                end;
                if v0.ui.manual_aa:get() ~= "Off" then
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):override("Backward");
                    ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):override("Disabled");
                    if v0.ui.manual_aa:get() == "Left" then
                        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(-90);
                    elseif v0.ui.manual_aa:get() == "Right" then
                        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(90);
                    elseif v0.ui.manual_aa:get() == "Forward" then
                        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(180);
                    end;
                end;
            end;
        end;
    end), 
    antibrute = {
        last_value = 0, 
        last_brute = 0; 
        v0.events.register("bullet_impact", "detect_antibrute", function(v189)
            -- upvalues: v0 (ref), v14 (ref)
            local v190 = entity.get_local_player();
            if v190 == nil then
                return;
            elseif not v190:is_alive() then
                return;
            else
                local v191 = v0.funcs.get_player_state(0);
                local v192 = entity.get(v189.userid, true);
                if v192 == nil then
                    return;
                else
                    if not v192:is_dormant() and v192:is_enemy() then
                        local v193 = vector(v189.x, v189.y, v189.z);
                        local v194 = entity.get_local_player():get_hitbox_position(0);
                        local v195 = v192:get_origin();
                        v195.z = v195.z + 64;
                        local v196 = v0.funcs.closest_point_on_ray(v194, v195, v193);
                        if v0.funcs.vector3_distance(v196, v194) < 80 and v0.antiaim.antibrute.last_brute < globals.curtime - 0.5 and v14[v191].anti_brute:get() then
                            v0.antiaim.antibrute.last_brute = globals.curtime;
                            v0.antiaim.antibrute.last_value = math.random(10, 60);
                            v0.notifications.add_notification(string.format("\a" .. v0.ui.global_clr:get():to_hex() .. "Antibrute \aFFFFFFFFswitched angle to \a" .. v0.ui.global_clr:get():to_hex() .. v0.antiaim.antibrute.last_value .. "\aFFFFFFFF\194\176 due to enemy shot"));
                        end;
                    end;
                    return;
                end;
            end;
        end)
    }, 
    v0.events.register("createmove", "anti_aim", function(_)
        -- upvalues: v0 (ref)
        if v0.ui.hide_legs:get() then
            if v0.ui.leg_style:get() == "Moon Walk" and v0.ui.local_animations:get("Leg Breaker") then
                return;
            else
                ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):set(globals.choked_commands == 0 and "Sliding" or "Walking");
            end;
        end;
    end), 
    v0.events.register("createmove", "hide_head", function(_)
        -- upvalues: v0 (ref)
        if v0.ui.hide_head:get() then
            local v199 = entity.get_local_player();
            if v199 == nil then
                return;
            else
                local v200 = v199:get_player_weapon();
                if v200 == nil then
                    return;
                else
                    local v201 = v200:get_weapon_index();
                    if (v201 == 500 or not (v201 ~= 503) or not (v201 ~= 505) or not (v201 ~= 506) or not (v201 ~= 507) or not (v201 ~= 508) or not (v201 ~= 509) or not (v201 ~= 510) or not (v201 ~= 511) or not (v201 ~= 512) or not (v201 ~= 513) or not (v201 ~= 514) or not (v201 ~= 515) or not (v201 ~= 516) or not (v201 ~= 517) or not (v201 ~= 518) or not (v201 ~= 519) or not (v201 ~= 520) or not (v201 ~= 521) or not (v201 ~= 522) or not (v201 ~= 523) or not (v201 ~= 524) or v201 == 525) and v0.funcs.in_air() then
                        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):override("Disabled");
                        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(22);
                        ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):override("");
                        ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):override(false);
                        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override(false);
                    end;
                end;
            end;
        end;
    end), 
    legitaa = {
        override_legitAA = true; 
        v0.events.register("createmove", "legit_aa", function(v202)
            -- upvalues: v0 (ref)
            if not v0.ui.override_legitaa:get() then
                return;
            else
                local v203 = entity.get_local_player();
                local v204 = true;
                if not v203 then
                    return;
                else
                    local l_m_iTeamNum_0 = v203.m_iTeamNum;
                    local v206 = {
                        entity.get_entities("CPlantedC4"), 
                        entity.get_entities("CHostage")
                    };
                    for v207 in pairs(v206) do
                        for v208 in pairs(v206[v207]) do
                            local v209 = v203:get_origin():dist((v206[v207][v208]:get_origin()));
                            if v209 < 65 and v209 > 1 and l_m_iTeamNum_0 == 3 then
                                v204 = false;
                            end;
                        end;
                    end;
                    if l_m_iTeamNum_0 == 2 and v203.m_bInBombZone and v203:get_player_weapon():get_classname() == "CC4" then
                        v204 = false;
                    end;
                    if bit.band(v202.buttons, 32) == 32 and v204 then
                        if globals.curtime - start_curtime > 0.02 then
                            v202.buttons = bit.band(v202.buttons, bit.bnot(32));
                            if v0.antiaim.legitaa.override_legitAA then
                                old_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):get();
                                old_yawbase = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):get();
                                old_yawvalue = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):get();
                                v0.antiaim.legitaa.override_legitAA = false;
                            end;
                            ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):override("Disabled");
                            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):override("Disabled");
                            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(180);
                            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"):override("Local View");
                        end;
                    else
                        if not v0.antiaim.legitaa.override_legitAA then
                            ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):override(old_pitch);
                            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):override(old_yawbase);
                            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(old_yawvalue);
                            v0.antiaim.legitaa.override_legitAA = true;
                        end;
                        start_curtime = globals.curtime;
                    end;
                    return;
                end;
            end;
        end)
    }, 
    pitch_exploit = {
        prev_simulation_time = 0, 
        active_def = 0, 
        spinvalue = 0, 
        time_to_ticks = function(v210)
            return math.floor(0.4 + v210 / globals.tickinterval);
        end, 
        sim_diff = function()
            -- upvalues: v0 (ref)
            local v211 = v0.antiaim.pitch_exploit.time_to_ticks(entity.get_local_player().m_flSimulationTime);
            local v212 = v211 - v0.antiaim.pitch_exploit.prev_simulation_time;
            v0.antiaim.pitch_exploit.prev_simulation_time = v211;
            diff_sim = v212;
            return diff_sim;
        end, 
        is_defensive_active = function()
            -- upvalues: v0 (ref)
            local l_tickcount_0 = globals.tickcount;
            local v214 = entity.get_local_player();
            local v215 = v0.antiaim.pitch_exploit.time_to_ticks(v214.m_flSimulationTime);
            local v216 = v215 - v0.antiaim.pitch_exploit.prev_simulation_time;
            if v216 < 0 then
                v0.antiaim.pitch_exploit.active_def = l_tickcount_0 + math.abs(v216);
            end;
            v0.antiaim.pitch_exploit.prev_simulation_time = v215;
            return l_tickcount_0 < v0.antiaim.pitch_exploit.active_def;
        end; 
        v0.events.register("createmove_run", "pitch_exploit", function(_)
            -- upvalues: v0 (ref)
            if v0.ui.pitch_exploit:get() and v0.ui.defensive_options:get() then
                local v218 = entity.get_local_player();
                if v218 == nil then
                    return;
                elseif not v218:is_alive() then
                    return;
                else
                    if v0.antiaim.pitch_exploit.sim_diff() < -0.13 then
                        v0.antiaim.pitch_exploit.active_def = globals.realtime;
                    end;
                    if v0.antiaim.pitch_exploit.active_def > 0 and globals.realtime - v0.antiaim.pitch_exploit.active_def < 0.15625 then
                        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override(true);
                        if v0.ui.pitch_exp_mode:get() == "Static" then
                            rage.antiaim:override_hidden_yaw_offset(0);
                        elseif v0.ui.pitch_exp_mode:get() == "Left-Right" then
                            rage.antiaim:override_hidden_yaw_offset(math.random(1, 2) == 1 and -89 or 89);
                        elseif v0.ui.pitch_exp_mode:get() == "Legit AA" then
                            rage.antiaim:override_hidden_yaw_offset(180);
                        elseif v0.ui.pitch_exp_mode:get() == "Spin" then
                            if v0.antiaim.pitch_exploit.spinvalue > 180 then
                                v0.antiaim.pitch_exploit.spinvalue = -180;
                            else
                                v0.antiaim.pitch_exploit.spinvalue = v0.antiaim.pitch_exploit.spinvalue + 15;
                            end;
                            rage.antiaim:override_hidden_yaw_offset(v0.antiaim.pitch_exploit.spinvalue);
                        elseif v0.ui.pitch_exp_mode:get() == "3-way" then
                            angs = {
                                [1] = -89, 
                                [2] = 0, 
                                [3] = 89
                            };
                            way = globals.tickcount % #angs + 1;
                            rage.antiaim:override_hidden_yaw_offset(angs[way]);
                        elseif v0.ui.pitch_exp_mode:get() == "5-way" then
                            angs = {
                                [1] = -89, 
                                [2] = 0, 
                                [3] = 89, 
                                [4] = -140, 
                                [5] = 140
                            };
                            way = globals.tickcount % #angs + 1;
                            rage.antiaim:override_hidden_yaw_offset(angs[way]);
                        end;
                        if v0.ui.pitch_exp_pitch:get() == "Fake Up" then
                            rage.antiaim:override_hidden_pitch(-89);
                        elseif v0.ui.pitch_exp_pitch:get() == "Down" then
                            rage.antiaim:override_hidden_pitch(89);
                        elseif v0.ui.pitch_exp_pitch:get() == "Disabled" then
                            rage.antiaim:override_hidden_pitch(0);
                        elseif v0.ui.pitch_exp_pitch:get() == "Random" then
                            rage.antiaim:override_hidden_pitch(math.random(1, 2) == 1 and 0 or -80);
                        elseif v0.ui.pitch_exp_pitch:get() == "Semi-Up" then
                            rage.antiaim:override_hidden_pitch(-40);
                        end;
                    else
                        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override(false);
                    end;
                end;
            else
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override(false);
            end;
        end)
    }, 
    v0.events.register("createmove", "force_defensive", function(_)
        -- upvalues: v0 (ref)
        if v0.ui.defensive_air:get() and v0.ui.defensive_options:get() then
            local v220 = v0.funcs.get_player_state(1);
            if v0.ui.defensive_cond:get(v220) then
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):set("Always On");
            else
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):set("On Peek");
            end;
        end;
    end), 
    v0.events.register("createmove", "auto_teleport", function(_)
        -- upvalues: v0 (ref)
        if v0.ui.aut_teleport:get() and ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() then
            local v222 = false;
            local v223 = false;
            local v224 = entity.get_local_player();
            if v224 == nil then
                return;
            else
                local v225 = v224:get_player_weapon();
                if v225 == nil then
                    return;
                else
                    local v226 = v225:get_weapon_index();
                    local v227 = v226 == 40;
                    local v228 = v226 == 9;
                    local v229 = v226 == 1 or not (v226 ~= 2) or not (v226 ~= 3) or not (v226 ~= 4) or not (v226 ~= 30) or not (v226 ~= 32) or not (v226 ~= 36) or not (v226 ~= 61) or not (v226 ~= 63) or v226 == 64;
                    local v230 = v226 == 31;
                    local v231 = v226 == 500 or not (v226 ~= 503) or not (v226 ~= 505) or not (v226 ~= 506) or not (v226 ~= 507) or not (v226 ~= 508) or not (v226 ~= 509) or not (v226 ~= 510) or not (v226 ~= 511) or not (v226 ~= 512) or not (v226 ~= 513) or not (v226 ~= 514) or not (v226 ~= 515) or not (v226 ~= 516) or not (v226 ~= 517) or not (v226 ~= 518) or not (v226 ~= 519) or not (v226 ~= 520) or not (v226 ~= 521) or not (v226 ~= 522) or not (v226 ~= 523) or not (v226 ~= 524) or v226 == 525;
                    local v232 = v226 == 81 or not (v226 ~= 82) or v226 == 83;
                    local l_m_fFlags_2 = entity.get_local_player().m_fFlags;
                    for _, v235 in pairs({
                        [1] = {
                            Value = "Scout", 
                            Weapon = v227
                        }, 
                        [2] = {
                            Value = "AWP", 
                            Weapon = v228
                        }, 
                        [3] = {
                            Value = "Pistols", 
                            Weapon = v229
                        }, 
                        [4] = {
                            Value = "Zeus", 
                            Weapon = v230
                        }, 
                        [5] = {
                            Value = "Knife", 
                            Weapon = v231
                        }, 
                        [6] = {
                            Value = "Nades", 
                            Weapon = v232
                        }, 
                        [7] = {
                            Value = "Other", 
                            Weapon = not v227 and not v228 and not v229 and not v230 and not v231 and not v232
                        }
                    }) do
                        if v0.ui.auto_teleport_weap:get(v235.Value) and v235.Weapon then
                            v222 = true;
                        end;
                    end;
                    if v222 then
                        for _, v237 in pairs(v0.funcs.GetEnemies()) do
                            if v237:get_player_weapon() == nil then
                                return;
                            elseif v237:is_dormant() == nil or v237:get_player_weapon():get_weapon_index() == nil then
                                return;
                            elseif not v237:is_dormant() and v0.funcs.CanHit(v237, v0.ui.teleport_sensivity:get(), 0) and v237:get_player_weapon():get_weapon_index() ~= v231 then
                                v223 = true;
                            end;
                        end;
                    end;
                    if v223 and bit.band(l_m_fFlags_2, bit.lshift(1, 0)) ~= 1 then
                        rage.exploit:force_teleport();
                    end;
                end;
            end;
        end;
    end), 
    v0.events.register("createmove", "airlag_exploit", function(v238)
        -- upvalues: v0 (ref)
        if not v0.ui.airlag_exploit:get() then
            return;
        else
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override();
            local v239 = entity.get_local_player();
            if not v239 then
                return;
            else
                if bit.band(v239.m_fFlags, bit.lshift(1, 0)) == 0 then
                    if globals.tickcount % 10 == 0 and v238.in_jump then
                        v238.force_defensive = true;
                        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override(math.random(10));
                        rage.exploit:force_teleport();
                        rage.exploit:allow_charge(false);
                    else
                        rage.exploit:allow_charge(true);
                        rage.exploit:force_charge();
                    end;
                end;
                return;
            end;
        end;
    end)
};
v0.Drag = {
    velwarning = {
        drag_two = false, 
        drag_check = function()
            -- upvalues: v0 (ref)
            local v240 = ui.get_mouse_position();
            if common.is_button_down(1) and ui.get_alpha() == 1 and v0.ui.velocity_warning:get() then
                if v240.x + 40 >= v0.ui.velocity_x:get() and v240.y + 70 <= v0.ui.velocity_y:get() and v240.x <= v0.ui.velocity_x:get() + 100 and v240.y >= v0.ui.velocity_y:get() - 120 or v0.Drag.velwarning.drag_two then
                    if not v0.Drag.velwarning.drag_two then
                        v0.Drag.velwarning.drag_two = true;
                    else
                        v0.ui.velocity_x:set(v240.x - 20);
                        v0.ui.velocity_y:set(v240.y + 90);
                    end;
                end;
            else
                v0.Drag.velwarning.drag_two = false;
            end;
        end
    }, 
    watermark = {
        drag_two = false, 
        drag_check = function()
            -- upvalues: v0 (ref)
            local v241 = ui.get_mouse_position();
            if common.is_button_down(1) and ui.get_alpha() == 1 then
                if v241.x + 20 >= v0.ui.watermark_x:get() and v241.y - 20 <= v0.ui.watermark_y:get() and v241.x <= v0.ui.watermark_x:get() + 80 and v241.y >= v0.ui.watermark_y:get() - 20 or v0.Drag.watermark.drag_two then
                    if not v0.Drag.watermark.drag_two then
                        v0.Drag.watermark.drag_two = true;
                    else
                        v0.ui.watermark_x:set(v241.x - 20);
                        v0.ui.watermark_y:set(v241.y);
                        render.blur(vector(0, 0), vector(screen.x, screen.y), 0, 0.5);
                        render.rect_outline(vector(v0.ui.watermark_x:get() - 8, v0.ui.watermark_y:get() - 10), vector(v0.ui.watermark_x:get() + 97, v0.ui.watermark_y:get() + 23), color(255, 255, 255, 240), 1, 6, false);
                    end;
                end;
            else
                v0.Drag.watermark.drag_two = false;
            end;
        end
    }, 
    aa_arrows = {
        drag_two1 = false, 
        drag_two2 = false, 
        drag_check = function()
            -- upvalues: v0 (ref)
            local v242 = ui.get_mouse_position();
            if common.is_button_down(1) and ui.get_alpha() == 1 and v0.ui.arrows:get() then
                if v242.x - v0.ui.arrow_add:get() >= screen.x / 2 + 40 and v242.y - 10 <= screen.y / 2 and v242.x <= screen.x / 2 + v0.ui.arrow_add:get() + 50 and v242.y >= screen.y / 2 - 15 or v0.Drag.aa_arrows.drag_two1 then
                    if not v0.Drag.aa_arrows.drag_two1 then
                        v0.Drag.aa_arrows.drag_two1 = true;
                    else
                        v0.ui.arrow_add:set(v242.x - screen.x / 2 - 45);
                        render.blur(vector(0, 0), vector(screen.x, screen.y), 0, 0.5);
                        render.line(vector(screen.x / 2 + 35, screen.y / 2), vector(screen.x / 2 + 140, screen.y / 2), color(255, 255, 255, 100));
                    end;
                elseif v242.x + v0.ui.arrow_add:get() <= screen.x / 2 - 40 and v242.y - 10 <= screen.y / 2 and v242.x >= screen.x / 2 - v0.ui.arrow_add:get() - 50 and v242.y >= screen.y / 2 - 15 or v0.Drag.aa_arrows.drag_two2 then
                    if not v0.Drag.aa_arrows.drag_two2 then
                        v0.Drag.aa_arrows.drag_two2 = true;
                    else
                        v0.ui.arrow_add:set(screen.x / 2 - v242.x - 45);
                        render.blur(vector(0, 0), vector(screen.x, screen.y), 0, 0.5);
                        render.line(vector(screen.x / 2 - 35, screen.y / 2), vector(screen.x / 2 - 140, screen.y / 2), color(255, 255, 255, 100));
                    end;
                end;
            else
                v0.Drag.aa_arrows.drag_two1 = false;
                v0.Drag.aa_arrows.drag_two2 = false;
            end;
        end
    }, 
    indicators = {
        drag_two = false, 
        drag_check = function()
            -- upvalues: v0 (ref)
            local v243 = ui.get_mouse_position();
            if common.is_button_down(1) and ui.get_alpha() == 1 and v0.ui.screen_indicator:get("On-Screen") then
                if v243.x + 35 >= screen.x / 2 + 15 and v243.y - v0.ui.screen_indi_add:get() <= screen.y / 2 + 35 and v243.x <= screen.x / 2 + 20 and v243.y >= screen.y / 2 + v0.ui.screen_indi_add:get() + 25 or v0.Drag.indicators.drag_two then
                    if not v0.Drag.indicators.drag_two then
                        v0.Drag.indicators.drag_two = true;
                    else
                        v0.ui.screen_indi_add:set(v243.y - screen.y / 2 - 30);
                        render.blur(vector(0, 0), vector(screen.x, screen.y), 0, 0.5);
                        render.line(vector(screen.x / 2, screen.y / 2 + 30), vector(screen.x / 2, screen.y / 2 + 130), color(255, 255, 255, 100));
                    end;
                end;
            else
                v0.Drag.indicators.drag_two = false;
            end;
        end
    }
};
v0.events.register("render", "drags_init", function(_)
    -- upvalues: v0 (ref)
    v0.Drag.velwarning.drag_check();
    v0.Drag.watermark.drag_check();
    v0.Drag.aa_arrows.drag_check();
    v0.Drag.indicators.drag_check();
end);
v0.other = {
    velcolor = 0, 
    velocity_anim = 0, 
    regret = 0, 
    v0.events.register("createmove", "no_fall_damage", function(v245)
        -- upvalues: v0 (ref)
        if not v0.ui.movement:get("No Fall Damage") then
            return;
        else
            self = entity.get_local_player();
            if self == nil then
                return;
            else
                if self.m_vecVelocity.z >= -500 then
                    no_fall_damage = false;
                elseif v0.funcs.trace(15) then
                    no_fall_damage = false;
                elseif v0.funcs.trace(75) then
                    no_fall_damage = true;
                end;
                if self.m_vecVelocity.z < -500 then
                    if no_fall_damage then
                        v245.in_duck = 1;
                    else
                        v245.in_duck = 0;
                    end;
                end;
                return;
            end;
        end;
    end), 
    v0.events.register("createmove", "fast_ladder", function(v246)
        -- upvalues: v0 (ref)
        if not v0.ui.movement:get("Fast Ladder") then
            return;
        else
            local v247 = entity.get_local_player();
            if v247 == nil then
                return;
            else
                local v248 = render.camera_angles();
                if v247.m_MoveType == 9 then
                    if v246.forwardmove > 0 and v248.x < 45 then
                        v246.view_angles.x = 89;
                        v246.view_angles.y = v246.view_angles.y + 89;
                        v246.in_moveright = 1;
                        v246.in_moveleft = 0;
                        v246.in_forward = 0;
                        v246.in_back = 1;
                        if v246.sidemove == 0 then
                            v246.move_yaw = v246.move_yaw + 90;
                        end;
                        if v246.sidemove < 0 then
                            v246.move_yaw = v246.move_yaw + 150;
                        end;
                        if v246.sidemove > 0 then
                            v246.move_yaw = v246.move_yaw + 30;
                        end;
                    end;
                    if v246.forwardmove < 0 then
                        v246.view_angles.x = 89;
                        v246.view_angles.y = v246.view_angles.y + 89;
                        v246.in_moveleft = 1;
                        v246.in_moveright = 0;
                        v246.in_forward = 1;
                        v246.in_back = 0;
                        if v246.sidemove == 0 then
                            v246.move_yaw = v246.move_yaw + 90;
                        end;
                        if v246.sidemove > 0 then
                            v246.move_yaw = v246.move_yaw + 150;
                        end;
                        if v246.sidemove < 0 then
                            v246.move_yaw = v246.move_yaw + 30;
                        end;
                    end;
                end;
                return;
            end;
        end;
    end), 
    supertoss = {
        active = false, 
        check_active = function()
            -- upvalues: v0 (ref)
            v0.other.supertoss.active = false;
            if not v0.ui.movement:get("Super Toss") then
                return;
            else
                local v249 = entity.get_local_player();
                if v249 == nil then
                    return;
                elseif v249:is_alive() == false then
                    return;
                elseif v249.m_MoveType == 8 then
                    return;
                else
                    local v250 = v249:get_player_weapon();
                    if v250 == nil then
                        return;
                    else
                        local v251 = v250:get_weapon_info();
                        if v251 == nil then
                            return;
                        elseif v251.weapon_type ~= 9 then
                            return;
                        else
                            v0.other.supertoss.active = true;
                            return;
                        end;
                    end;
                end;
            end;
        end, 
        last_angles = vector(0, 0, 0), 
        target_angles = vector(0, 0, 0); 
        v0.events.register("pre_render", "super_toss_render", function()
            -- upvalues: v0 (ref)
            v0.other.supertoss.check_active();
            v0.other.supertoss.last_angles = render.camera_angles();
            if v0.other.supertoss.active == true and common.is_in_thirdperson() == false then
                render.camera_angles(v0.other.supertoss.target_angles);
            end;
        end), 
        v0.events.register("override_view", "super_toss_view", function(v252)
            -- upvalues: v0 (ref)
            if v0.other.supertoss.active == true then
                v252.view = v0.other.supertoss.last_angles;
                render.camera_angles(v0.other.supertoss.last_angles);
            end;
        end), 
        v0.events.register("createmove", "super_toss_createmove", function(v253)
            -- upvalues: v0 (ref)
            if v0.other.supertoss.active ~= true then
                return;
            else
                local v254 = entity.get_local_player();
                if v254 == nil then
                    return;
                elseif v254:is_alive() == false then
                    return;
                else
                    local v255 = v254:get_player_weapon();
                    if v255 == nil then
                        return;
                    else
                        local v256 = v255:get_weapon_info();
                        if v256 == nil then
                            return;
                        else
                            local v257 = ffi.cast("uintptr_t", v254[0]);
                            local v258 = vector(v253.view_angles.x, v253.view_angles.y, 0);
                            v258.x = v258.x - (90 - math.abs(v258.x)) * 10 / 90;
                            v258 = v0.funcs.ang_vec(v258);
                            local v259 = math.clamp(v255.m_flThrowStrength, 0, 1);
                            local v260 = math.clamp(v256.throw_velocity * 0.9, 15, 750) * (v259 * 0.7 + 0.3);
                            local v261 = ffi.cast("vector_t*", v257 + 148)[0];
                            v261 = vector(v261.x, v261.y, v261.z);
                            local v262 = (v258 * v260 + v261 * 1.45):angles();
                            local v263 = v253.view_angles.y - v262.y;
                            while v263 > 180 do
                                v263 = v263 - 360;
                            end;
                            while v263 < -180 do
                                v263 = v263 + 360;
                            end;
                            local v264 = v253.view_angles.x - v262.x - 10;
                            while v264 > 90 do
                                v264 = v264 - 45;
                            end;
                            while v264 < -90 do
                                v264 = v264 + 45;
                            end;
                            v0.other.supertoss.target_angles.y = v253.view_angles.y + v263;
                            v253.view_angles.y = v253.view_angles.y + v263;
                            v0.other.supertoss.target_angles.x = math.clamp(v253.view_angles.x + v264, -89, 89);
                            v253.view_angles.x = math.clamp(v253.view_angles.x + v264, -89, 89);
                            return;
                        end;
                    end;
                end;
            end;
        end)
    }, 
    v0.events.register("aim_ack", "aimbot_logs", function(v265)
        -- upvalues: v0 (ref)
        if v0.ui.logging:get("On-Screen") then
            local v266 = v0.ui.global_clr:get():to_hex();
            if v265.state == nil then
                v0.notifications.add_notification(string.format("Hit \a" .. v266 .. "%s\aFFFFFFFF's \a" .. v266 .. "%s\aFFFFFFFF for \a" .. v266 .. "%d\aFFFFFFFF hp (\a" .. v266 .. "%d\aFFFFFFFF health remaining)", entity.get(v265.target):get_name(), v0.funcs.hitgroup_str[v265.hitgroup], v265.damage, math.max(entity.get(v265.target).m_iHealth)));
            else
                v0.notifications.add_notification(string.format("Missed \a" .. v266 .. "%s\aFFFFFFFF's \a" .. v266 .. "%s\aFFFFFFFF due to \a" .. v266 .. "%s", entity.get(v265.target):get_name(), v0.funcs.hitgroup_str[v265.wanted_hitgroup], v265.state));
            end;
        end;
        if v0.ui.logging:get("Console") then
            local v267 = v0.ui.global_clr:get():to_hex();
            local v268 = string.sub(v267, 1, 6);
            if v265.state == nil then
                print_raw(string.format("\a" .. v268 .. "FF" .. "[ \aA6D735FFLIGHTNING \a" .. v268 .. "FF" .. "]\aE0E0E0FF Hit \a" .. v268 .. "FF" .. "%s\aE0E0E0FF's \a" .. v268 .. "FF" .. "%s\aE0E0E0FF for \a" .. v268 .. "FF" .. "%d\aE0E0E0FF (\a" .. v268 .. "FF" .. "%s\aE0E0E0FF health remaining) [bt=\a" .. v268 .. "FF" .. "%d\aE0E0E0FF | hc=\a" .. v268 .. "FF" .. "%d\aE0E0E0FF%% | sp=\a" .. v268 .. "%f\aE0E0E0FF\194\176]", entity.get(v265.target):get_name(), v0.funcs.hitgroup_str[v265.hitgroup], v265.damage, math.max(entity.get(v265.target).m_iHealth), v265.backtrack, v265.hitchance, v265.spread));
            elseif entity.get(v265.target):get_name() == nil or v0.funcs.hitgroup_str[v265.wanted_hitgroup] == nil or v265.state == nil or v265.backtrack == nil or v265.hitchance == nil or v265.spread == nil then
                return;
            else
                print_raw(string.format("\a" .. v268 .. "FF" .. "[ \aEB0000FFLIGHTNING \a" .. v268 .. "FF" .. "]\aE0E0E0FF Missed \a" .. v268 .. "FF" .. "%s\aE0E0E0FF's \a" .. v268 .. "FF" .. "%s\aE0E0E0FF due to \a" .. v268 .. "FF" .. "%s\aE0E0E0FF [bt=\a" .. v268 .. "FF" .. "%d\aE0E0E0FF | hc=\a" .. v268 .. "FF" .. "%d\aE0E0E0FF%% | sp=\a" .. v268 .. "FF" .. "%f\aE0E0E0FF\194\176]", entity.get(v265.target):get_name(), v0.funcs.hitgroup_str[v265.wanted_hitgroup], v265.state, v265.backtrack, v265.hitchance, v265.spread));
            end;
        end;
        if v0.ui.logging:get("Events") then
            if v265.state == nil then
                print_dev(string.format("[ LIGHTNING ] Hit %s's %s for %d (%s health remaining) [bt=%d | hc=%d%% | sp=%f\194\176]", entity.get(v265.target):get_name(), v0.funcs.hitgroup_str[v265.hitgroup], v265.damage, math.max(entity.get(v265.target).m_iHealth), v265.backtrack, v265.hitchance, v265.spread));
            elseif entity.get(v265.target):get_name() == nil or v0.funcs.hitgroup_str[v265.wanted_hitgroup] == nil or v265.state == nil or v265.backtrack == nil or v265.hitchance == nil or v265.spread == nil then
                return;
            else
                print_dev(string.format("[ LIGHTNING ] Missed %s's %s due to %s [bt=%d | hc=%d | sp=%f\194\176]", entity.get(v265.target):get_name(), v0.funcs.hitgroup_str[v265.wanted_hitgroup], v265.state, v265.backtrack, v265.hitchance, v265.spread));
            end;
        end;
    end), 
    v0.events.register("render", "aspect_ratio", function(_)
        -- upvalues: v0 (ref)
        if v0.ui.aspect_ratio:get() then
            cvar.r_aspectratio:float(v0.ui.ratio_value:get() / 100);
        end;
    end), 
    v0.events.register("render", "draw_min_dmg", function(_)
        -- upvalues: v0 (ref)
        if entity.get_local_player() == nil then
            return;
        else
            if v0.ui.draw_dmg:get() and globals.is_in_game then
                if v0.ui.dmg_type:get() == "Always" then
                    render.text(1, vector(screen.x / 2 + 10 + v0.ui.dmg_x:get(), screen.y / 2 - 20 - v0.ui.dmg_y:get()), color(), "", ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get());
                elseif v0.ui.dmg_type:get() == "Min DMG" then
                    local v271 = ui.get_binds();
                    for v272 = 1, #v271 do
                        local v273 = v271[v272];
                        if v273.name == "Min. Damage" and v273.active == true then
                            render.text(1, vector(screen.x / 2 + 10 + v0.ui.dmg_x:get(), screen.y / 2 - 20 - v0.ui.dmg_y:get()), color(), "", v273.value);
                        end;
                    end;
                end;
            end;
            return;
        end;
    end), 
    customscope = {
        animscope_2 = 0; 
        v0.events.register("render", "custom_scope", function(_)
            -- upvalues: v0 (ref)
            colors = v0.ui.scope_color:get();
            local _ = 8.333333333333334 * globals.frametime;
            local v276 = entity.get_local_player();
            if v276 == nil then
                return;
            else
                if v276.m_bIsScoped then
                    v0.other.customscope.animscope_2 = v0.funcs.lerp(globals.frametime * 20, v0.other.customscope.animscope_2, v0.ui.scope_size:get() + 5);
                elseif v0.other.customscope.animscope_2 ~= 0 then
                    v0.other.customscope.animscope_2 = v0.funcs.lerp(globals.frametime * 20, v0.other.customscope.animscope_2, 0);
                else
                    v0.other.customscope.animscope_2 = 0;
                end;
                if v0.ui.custom_scope:get() and v0.other.customscope.animscope_2 >= 1 then
                    ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):set("Remove All");
                    if v0.ui.scope_invert:get() then
                        render.gradient(vector(screen.x / 2 - v0.ui.scope_padding:get(), screen.y / 2 - 1), vector(screen.x / 2 - v0.other.customscope.animscope_2 - 15, screen.y / 2), color(colors.r, colors.g, colors.b, 0), colors, color(colors.r, colors.g, colors.b, 0), colors);
                        render.gradient(vector(screen.x / 2 + v0.ui.scope_padding:get(), screen.y / 2 - 1), vector(screen.x / 2 + v0.other.customscope.animscope_2 + 15, screen.y / 2), color(colors.r, colors.g, colors.b, 0), colors, color(colors.r, colors.g, colors.b, 0), colors);
                        render.gradient(vector(screen.x / 2 - 1, screen.y / 2 - v0.ui.scope_padding:get()), vector(screen.x / 2, screen.y / 2 - v0.other.customscope.animscope_2 - 15), color(colors.r, colors.g, colors.b, 0), color(colors.r, colors.g, colors.b, 0), colors, colors);
                        render.gradient(vector(screen.x / 2 - 1, screen.y / 2 + v0.ui.scope_padding:get()), vector(screen.x / 2, screen.y / 2 + v0.other.customscope.animscope_2 + 15), color(colors.r, colors.g, colors.b, 0), color(colors.r, colors.g, colors.b, 0), colors, colors);
                    else
                        render.gradient(vector(screen.x / 2 - v0.ui.scope_padding:get(), screen.y / 2 - 1), vector(screen.x / 2 - v0.other.customscope.animscope_2 - 15, screen.y / 2), colors, color(colors.r, colors.g, colors.b, 0), colors, color(colors.r, colors.g, colors.b, 0));
                        render.gradient(vector(screen.x / 2 + v0.ui.scope_padding:get(), screen.y / 2 - 1), vector(screen.x / 2 + v0.other.customscope.animscope_2 + 15, screen.y / 2), colors, color(colors.r, colors.g, colors.b, 0), colors, color(colors.r, colors.g, colors.b, 0));
                        render.gradient(vector(screen.x / 2 - 1, screen.y / 2 - v0.ui.scope_padding:get()), vector(screen.x / 2, screen.y / 2 - v0.other.customscope.animscope_2 - 15), colors, colors, color(colors.r, colors.g, colors.b, 0), color(colors.r, colors.g, colors.b, 0));
                        render.gradient(vector(screen.x / 2 - 1, screen.y / 2 + v0.ui.scope_padding:get()), vector(screen.x / 2, screen.y / 2 + v0.other.customscope.animscope_2 + 15), colors, colors, color(colors.r, colors.g, colors.b, 0), color(colors.r, colors.g, colors.b, 0));
                    end;
                end;
                return;
            end;
        end)
    }, 
    v0.events.register("render", "grenade_esp", function(_)
        -- upvalues: v0 (ref)
        if not v0.ui.grenade_esp:get() then
            return;
        else
            local v278 = entity.get_entities("CSmokeGrenadeProjectile");
            for v279 = 1, #v278 do
                local v280 = v278[v279];
                if v280.m_bDidSmokeEffect == true then
                    render.circle_3d_outline(v280:get_origin(), v0.ui.smoke_color:get(), 125, 0, 1, 0);
                end;
            end;
            local v281 = entity.get_entities("CInferno");
            for v282 = 1, #v281 do
                local v283 = v281[v282];
                local v284 = v283:get_origin();
                local v285 = 40;
                local _ = 0;
                local v287 = {};
                local v288 = 0;
                local v289 = nil;
                local v290 = nil;
                for v291 = 1, 64 do
                    if v283.m_bFireIsBurning[v291] == true then
                        table.insert(v287, vector(v283.m_fireXDelta[v291], v283.m_fireYDelta[v291], v283.m_fireZDelta[v291]));
                    end;
                end;
                for v292 = 1, #v287 do
                    for v293 = 1, #v287 do
                        local v294 = v287[v292]:dist2d(v287[v293]);
                        if v288 < v294 then
                            v288 = v294;
                            v289 = v287[v292];
                            v290 = v287[v293];
                        end;
                    end;
                end;
                if v289 ~= nil and v290 ~= nil then
                    local v295 = v284 + v0.funcs.Lerp_Position(v289, v290, 0.5);
                    render.circle_3d_outline(v295, v0.ui.molotov_color:get(), v288 / 2 + v285, 0, 1, 0);
                    render.text(1, render.world_to_screen(v295), v0.ui.molotov_color:get(), "ba", "X");
                end;
            end;
            return;
        end;
    end), 
    v0.events.register("render", "velocity_warning", function(_)
        -- upvalues: v0 (ref)
        if v0.ui.velocity_warning:get() then
            local v297 = entity.get_local_player();
            if v297 == nil then
                return;
            else
                local l_m_flVelocityModifier_0 = v297.m_flVelocityModifier;
                local v299 = v0.ui.velocity_x:get();
                local v300 = v0.ui.velocity_y:get();
                if v0.other.velcolor < 255 and v0.other.regret == 0 then
                    v0.other.velcolor = v0.funcs.lerp(globals.frametime * 5, v0.other.velcolor, 255);
                    if v0.other.velcolor > 250 then
                        v0.other.regret = 1;
                    end;
                else
                    v0.other.velcolor = v0.funcs.lerp(globals.frametime * 5, v0.other.velcolor, 0);
                    if v0.other.velcolor < 5 then
                        v0.other.regret = 0;
                    end;
                end;
                if l_m_flVelocityModifier_0 * 80 < 80 and v297:is_alive() or ui.get_alpha() == 1 then
                    render.poly(color(v0.ui.velocity_color:get().r, v0.ui.velocity_color:get().g, v0.ui.velocity_color:get().b, v0.other.velcolor), vector(v299, v300 - 108), vector(v299 - 19, v300 - 78), vector(v299 + 20, v300 - 78));
                    render.line(vector(v299 - 20, v300 - 79), vector(v299 + 20, v300 - 79), color(0, 0, 0, v0.other.velcolor));
                    render.line(vector(v299 - 20, v300 - 79), vector(v299, v300 - 109), color(0, 0, 0, v0.other.velcolor));
                    render.line(vector(v299 + 20, v300 - 79), vector(v299, v300 - 109), color(0, 0, 0, v0.other.velcolor));
                    render.text(v0.fonts.arial16b, vector(v0.ui.velocity_x:get() - 2, v0.ui.velocity_y:get() - 97), color(0, 0, 0, v0.other.velcolor), "", "!");
                    render.text(v0.fonts.tahoma12b, vector(v0.ui.velocity_x:get() + 24, v0.ui.velocity_y:get() - 107), color(255, 255, 255, 255), "ba", "VELOCITY: " .. 100 - math.floor(l_m_flVelocityModifier_0 * 100) .. "%");
                    render.rect(vector(v0.ui.velocity_x:get() + 25, v0.ui.velocity_y:get() - 89), vector(v0.ui.velocity_x:get() + 25 + 80, v0.ui.velocity_y:get() - 78), color(0, 0, 0, 70), 4);
                    render.rect(vector(v0.ui.velocity_x:get() + 26, v0.ui.velocity_y:get() - 89), vector(v0.ui.velocity_x:get() + 109 - l_m_flVelocityModifier_0 * 80, v0.ui.velocity_y:get() - 79), v0.ui.velocity_color:get(), 4);
                    render.rect_outline(vector(v0.ui.velocity_x:get() + 25, v0.ui.velocity_y:get() - 89), vector(v0.ui.velocity_x:get() + 25 + 80, v0.ui.velocity_y:get() - 78), color(0, 0, 0, 255), 0, 4);
                end;
            end;
        end;
    end), 
    watermark = {
        stars = {
            [1] = {
                [1] = nil, 
                [2] = 0, 
                [3] = 0, 
                [4] = 0, 
                [1] = vector(0, 0)
            }, 
            [2] = {
                [1] = nil, 
                [2] = 0, 
                [3] = 0, 
                [4] = 0, 
                [1] = vector(0, 0)
            }, 
            [3] = {
                [1] = nil, 
                [2] = 0, 
                [3] = 0, 
                [4] = 0, 
                [1] = vector(0, 0)
            }, 
            [4] = {
                [1] = nil, 
                [2] = 0, 
                [3] = 0, 
                [4] = 0, 
                [1] = vector(0, 0)
            }, 
            [5] = {
                [1] = nil, 
                [2] = 0, 
                [3] = 0, 
                [4] = 0, 
                [1] = vector(0, 0)
            }
        }; 
        v0.events.register("render", "watermark", function(_)
            -- upvalues: v0 (ref)
            local v302 = entity.get_local_player();
            local v303 = gradient.text_animate("T N I N G", -2.5, {
                color(255, 255, 255), 
                v0.ui.global_clr:get()
            });
            if globals.is_connected or v302 then
                render.text(1, vector(v0.ui.watermark_x:get(), v0.ui.watermark_y:get()), color(121, 116, 121, 255), nil, "L I G H");
                render.text(1, vector(v0.ui.watermark_x:get() + 42, v0.ui.watermark_y:get()), color(0, 0, 0), nil, v303:get_animated_text());
            end;
            v303:animate();
            ui.sidebar("\a797479FFL I G H " .. v303:get_animated_text(), "bolt");
            for _, v305 in pairs(v0.other.watermark.stars) do
                if math.random(0, 100) == 100 then
                    v305[4] = 1;
                end;
                if v305[1] == vector(0, 0) and v305[4] == 1 then
                    v305[1] = vector(v0.ui.watermark_x:get() + math.random(-10, 110), v0.ui.watermark_y:get() + math.random(-25, 25));
                end;
                if v305[2] > 250 and v305[3] == 0 and v305[4] == 1 then
                    v305[2] = 249;
                    v305[3] = 1;
                end;
                if v305[2] < 5 and v305[3] == 1 and v305[4] == 1 then
                    v305[2] = 0;
                    v305[3] = 0;
                    v305[1] = vector(0, 0);
                    v305[4] = 0;
                end;
                if v305[3] == 0 and v305[2] < 255 and v305[4] == 1 then
                    v305[2] = v0.funcs.lerp(globals.frametime * 3, v305[2], 255);
                end;
                if v305[3] == 1 and v305[2] > 5 and v305[4] == 1 then
                    v305[2] = v0.funcs.lerp(globals.frametime * 3, v305[2], 0);
                end;
                render.shadow(v305[1], v305[1], color(v0.ui.global_clr:get().r, v0.ui.global_clr:get().g, v0.ui.global_clr:get().b, v305[2]), 10);
            end;
        end)
    }, 
    indicators = {
        addposyaw_1 = 0, 
        anim = {}; 
        v0.events.register("render", "screen_indicator", function(_)
            -- upvalues: v0 (ref), v11 (ref)
            if not v0.ui.screen_indicator:get("On-Screen") then
                return;
            else
                local v307 = entity.get_local_player();
                if v307 == nil or not v307:is_alive() then
                    return;
                else
                    if v307.m_bIsScoped then
                        v0.other.indicators.addposyaw_1 = v0.funcs.lerp(globals.frametime * 24, v0.other.indicators.addposyaw_1, 25);
                    else
                        v0.other.indicators.addposyaw_1 = v0.funcs.lerp(globals.frametime * 24, v0.other.indicators.addposyaw_1, 0);
                    end;
                    local v308 = rage.antiaim:get_max_desync();
                    local v309 = "lightning";
                    local v310 = "";
                    for v311 = 1, #v309 do
                        local v312 = v311 ~= #v309 and " " or "";
                        v310 = v310 .. v309:sub(v311, v311) .. v312;
                    end;
                    local v313 = v11 and {
                        [1] = v0.ui.global_clr:get().r, 
                        [2] = v0.ui.global_clr:get().g, 
                        [3] = v0.ui.global_clr:get().b
                    } or {
                        [1] = 255, 
                        [2] = 255, 
                        [3] = 255
                    };
                    local v314 = not v11 and {
                        [1] = v0.ui.global_clr:get().r, 
                        [2] = v0.ui.global_clr:get().g, 
                        [3] = v0.ui.global_clr:get().b
                    } or {
                        [1] = 255, 
                        [2] = 255, 
                        [3] = 255
                    };
                    local v315 = v0.funcs.gradient_text(v313[1], v313[2], v313[3], 255, v314[1], v314[2], v314[3], 255, v310);
                    local v316 = string.format("%1.0f", v308);
                    local v317 = render.measure_text(v0.fonts.tahoma10, "", "Li g h t n i n g");
                    render.text(v0.fonts.spixel10, vector(screen.x / 2 - render.measure_text(v0.fonts.spixel10, "o", v316 .. "%").x / 2 + 1 + v0.other.indicators.addposyaw_1, screen.y / 2 + 15 + v0.ui.screen_indi_add:get()), color(255, 255, 255, 100), "o", v316 .. "%");
                    render.text(v0.fonts.tahoma10, vector(screen.x / 2 - v317.x / 2 + v0.other.indicators.addposyaw_1, screen.y / 2 + 23 + v0.ui.screen_indi_add:get()), color(255, 255, 255, 255), "", v315);
                    local v318 = 0;
                    local v319 = {
                        [1] = {
                            [1] = "DT", 
                            [2] = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() and v0.ui.screen_indi_types:get("DT"), 
                            [3] = rage.exploit:get() == 1 and color(191, 136, 58) or color(255, 0, 0)
                        }, 
                        [2] = {
                            "OS", 
                            ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() and v0.ui.screen_indi_types:get("OS"), 
                            color(165, 165, 230)
                        }, 
                        [3] = {
                            "FS", 
                            ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):get() and v0.ui.screen_indi_types:get("FS"), 
                            color(200, 235, 145)
                        }, 
                        [4] = {
                            "FD", 
                            ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get() and v0.ui.screen_indi_types:get("FD"), 
                            color(215, 165, 230)
                        }, 
                        [5] = {
                            "BAIM", 
                            ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"):get() == "Force" and v0.ui.screen_indi_types:get("BAIM"), 
                            color(235, 185, 195)
                        }, 
                        [6] = {
                            "SAFE", 
                            ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"):get() == "Force" and v0.ui.screen_indi_types:get("SAFE"), 
                            color(255, 255, 255)
                        }
                    };
                    for _, v321 in pairs(v319) do
                        if v0.other.indicators.anim[v321[1]] == nil then
                            v0.other.indicators.anim[v321[1]] = {};
                            v0.other.indicators.anim[v321[1]].move = 0;
                            v0.other.indicators.anim[v321[1]].alpha = 0;
                        end;
                        if v321[2] then
                            v318 = v318 + 9;
                            v0.other.indicators.anim[v321[1]].alpha = v0.funcs.lerp(globals.frametime * 17, v0.other.indicators.anim[v321[1]].alpha, 255);
                            v0.other.indicators.anim[v321[1]].move = v0.funcs.lerp(globals.frametime * 17, v0.other.indicators.anim[v321[1]].move, v318);
                            render.text(v0.fonts.spixel10, vector(screen.x / 2 - render.measure_text(v0.fonts.spixel10, "o", v321[1]).x / 2 + v0.other.indicators.addposyaw_1, screen.y / 2 + 24 + v0.ui.screen_indi_add:get() + v0.other.indicators.anim[v321[1]].move), color(v321[3].r, v321[3].g, v321[3].b, v0.other.indicators.anim[v321[1]].alpha), "o", v321[1]);
                        elseif v0.other.indicators.anim[v321[1]].alpha > 10 then
                            v318 = v318 + 9;
                            v0.other.indicators.anim[v321[1]].alpha = v0.funcs.lerp(globals.frametime * 17, v0.other.indicators.anim[v321[1]].alpha, 0);
                            v0.other.indicators.anim[v321[1]].move = v0.funcs.lerp(globals.frametime * 17, v0.other.indicators.anim[v321[1]].move, v318);
                            render.text(v0.fonts.spixel10, vector(screen.x / 2 - render.measure_text(v0.fonts.spixel10, "o", v321[1]).x / 2 + v0.other.indicators.addposyaw_1, screen.y / 2 + 24 + v0.ui.screen_indi_add:get() + v0.other.indicators.anim[v321[1]].move), color(v321[3].r, v321[3].g, v321[3].b, v0.other.indicators.anim[v321[1]].alpha), "o", v321[1]);
                        else
                            v0.other.indicators.anim[v321[1]].alpha = 0;
                            v0.other.indicators.anim[v321[1]].move = 0;
                        end;
                    end;
                    return;
                end;
            end;
        end)
    }, 
    v0.events.register("render", "screen_indicator", function(_)
        -- upvalues: v0 (ref)
        if not v0.ui.screen_indicator:get("GameSense") then
            return;
        elseif entity.get_local_player() == nil then
            return;
        else
            drawgs_ = function(v323, v324, v325, v326, v327, v328, v329)
                -- upvalues: v0 (ref)
                local l_x_3 = screen.x;
                local l_y_3 = screen.y;
                local v332 = render.measure_text(v0.fonts.calibrb, "c", v324);
                if v325 == nil and v326 == nil then
                    render.gradient(vector(l_x_3 / 40, l_y_3 / 1.43 - 4 - v323), vector(l_x_3 / 40 + v332.x + 5, l_y_3 / 1.43 + 30 - v323), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), 0);
                    render.gradient(vector(l_x_3 / 40 - 45, l_y_3 / 1.43 - 4 - v323), vector(l_x_3 / 40, l_y_3 / 1.43 + 30 - v323), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), 0);
                    render.text(v0.fonts.calibrb, vector(l_x_3 / 62, l_y_3 / 1.43 + 4 - v323), color(v327, v328, v329, 255), nil, v324);
                elseif v325 ~= nil and v326 ~= nil then
                    render.gradient(vector(l_x_3 / 40, l_y_3 / 1.43 - 4 - v323), vector(l_x_3 / 40 + v332.x, l_y_3 / 1.43 + 30 - v323), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), 0);
                    render.gradient(vector(l_x_3 / 40 - 45, l_y_3 / 1.43 - 4 - v323), vector(l_x_3 / 40, l_y_3 / 1.43 + 30 - v323), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), 0);
                    render.text(v0.fonts.calibrb, vector(l_x_3 / 62 + 38, l_y_3 / 1.43 + 4 - v323), color(v327, v328, v329, 255), nil, v324);
                    render.texture(v325, vector(l_x_3 / 62, l_y_3 / 1.43 - v323), vector(32, 28), color(v327, v328, v329, 255), f, 0);
                    render.circle_outline(vector(l_x_3 / 62 + 70, l_y_3 / 1.43 + 14 - v323), color(10, 10, 10, 255), 10, 0, 1, 5);
                    render.circle_outline(vector(l_x_3 / 62 + 70, l_y_3 / 1.43 + 14 - v323), color(200, 200, 200), 9, 0, v326, 3);
                elseif v325 ~= nil and v326 == nil then
                    render.gradient(vector(l_x_3 / 40, l_y_3 / 1.43 - 4 - v323), vector(l_x_3 / 40 + v332.x, l_y_3 / 1.43 + 30 - v323), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), 0);
                    render.gradient(vector(l_x_3 / 40 - 45, l_y_3 / 1.43 - 4 - v323), vector(l_x_3 / 40, l_y_3 / 1.43 + 30 - v323), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), 0);
                    render.text(v0.fonts.calibrb, vector(l_x_3 / 62 + 38, l_y_3 / 1.43 + 4 - v323), color(v327, v328, v329, 255), nil, v324);
                    render.texture(v325, vector(l_x_3 / 62, l_y_3 / 1.43 - v323), vector(32, 28), color(v327, v328, v329, 255), f, 0);
                end;
            end;
            local v333 = 0;
            if ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):get() > 0 and v0.ui.gs_indi_types:get("PING") then
                local v334 = utils.net_channel().latency[0];
                incoming = utils.net_channel().latency[1];
                outgoing = v334;
                incoming_latency = math.max(0, (outgoing - incoming) * 1000);
                ping = incoming_latency;
                v334 = math.floor(255 - ping / 189 * 60 * 1.79824561404);
                local v335 = math.floor(ping / 189 * 60 * 2.42105263158);
                local v336 = math.floor(ping / 189 * 60 * 0.20807017543);
                drawgs_(v333, "PING", nil, nil, v334, v335, v336);
                v333 = v333 + 42;
            end;
            if ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() and v0.ui.gs_indi_types:get("OSAA") then
                drawgs_(v333, "OSAA", nil, nil, 200, 200, 200);
                v333 = v333 + 42;
            end;
            if ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() and v0.ui.gs_indi_types:get("DT") then
                if rage.exploit:get() == 1 then
                    drawgs_(v333, "DT", nil, nil, 200, 200, 200);
                    v333 = v333 + 42;
                else
                    drawgs_(v333, "DT", nil, nil, 229, 26, 55);
                    v333 = v333 + 42;
                end;
            end;
            if ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"):get() and v0.ui.gs_indi_types:get("DA") then
                for _, v338 in ipairs(entity.get_players(true, true)) do
                    if v338:is_dormant() then
                        drawgs_(v333, "DA", nil, nil, 200, 200, 200);
                        v333 = v333 + 42;
                        break;
                    elseif not v338:is_dormant() then
                        drawgs_(v333, "DA", nil, nil, 229, 26, 55);
                        v333 = v333 + 42;
                        break;
                    end;
                end;
            end;
            if ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"):get() == "Force" and v0.ui.gs_indi_types:get("SAFE") then
                drawgs_(v333, "SAFE", nil, nil, 200, 200, 200);
                v333 = v333 + 42;
            end;
            if ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"):get() == "Force" and v0.ui.gs_indi_types:get("BODY") then
                drawgs_(v333, "BODY", nil, nil, 200, 200, 200);
                v333 = v333 + 42;
            end;
            if ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get() and v0.ui.gs_indi_types:get("DUCK") then
                drawgs_(v333, "DUCK", nil, nil, 200, 200, 200);
                v333 = v333 + 42;
            end;
            local v339 = ui.get_binds();
            for v340 = 1, #v339 do
                local v341 = v339[v340];
                if v341.name == "Min. Damage" and v0.ui.gs_indi_types:get("DMG") and v341.active == true then
                    drawgs_(v333, "DMG: " .. v341.value, nil, nil, 164, 164, 164);
                    v333 = v333 + 42;
                end;
                if v341.name == "Hit Chance" and v0.ui.gs_indi_types:get("HC") and v341.active == true then
                    drawgs_(v333, "HC: " .. v341.value, nil, nil, 164, 164, 164);
                    v333 = v333 + 42;
                end;
            end;
            if ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):get() and v0.ui.gs_indi_types:get("FS") then
                drawgs_(v333, "FS", nil, nil, 200, 200, 200);
                v333 = v333 + 42;
            end;
            if v0.ui.gs_indi_types:get("BOMB") then
                if bomb.state ~= true and bomb.plant_time > 0 then
                    drawgs_(v333, bomb.site .. "              ", v0.fonts.c4, bomb.plant_percentage, 251, 240, 138);
                    v333 = v333 + 42;
                end;
                if bomb.state == true and bomb.c4time > 0.0199 then
                    drawgs_(v333, string.format(bomb.site .. " - %.2fs              ", bomb.c4time), v0.fonts.c4, nil, 200, 200, 200);
                    v333 = v333 + 42;
                end;
                if bomb.state == true then
                    if bomb.dmg == "FATAL" then
                        drawgs_(v333, bomb.dmg, nil, nil, 229, 26, 55);
                        v333 = v333 + 42;
                    elseif bomb.dmg ~= "-0 HP" and bomb.dmg ~= "FATAL" then
                        drawgs_(v333, bomb.dmg, nil, nil, 251, 240, 138);
                        v333 = v333 + 42;
                    end;
                end;
            end;
            return;
        end;
    end), 
    markers = {}, 
    v0.events.register("render", "hitmarker", function(_)
        -- upvalues: v0 (ref)
        local v343 = v0.ui.hitmarker_color:get();
        if entity.get_local_player() == nil then
            return;
        else
            for v344, v345 in ipairs(v0.other.markers) do
                local v346 = render.world_to_screen(v345.pos2);
                if v346 ~= nil and v0.ui.hitmarker:get("World") then
                    if v345.color < 255 and v345.time + 4.5 > globals.realtime then
                        v345.color = v0.funcs.lerp(globals.frametime * 17, v345.color, 255);
                    else
                        v345.color = v0.funcs.lerp(globals.frametime * 17, v345.color, 0);
                    end;
                    render.line(vector(v346.x, v346.y - 5), vector(v346.x, v346.y + 6), color(v343.r, v343.g, v343.b, v345.color));
                    render.line(vector(v346.x + 0.6, v346.y - 5), vector(v346.x + 0.6, v346.y + 6), color(v343.r, v343.g, v343.b, v345.color));
                    render.line(vector(v346.x - 5, v346.y), vector(v346.x + 6, v346.y), color(v343.r, v343.g, v343.b, v345.color));
                    render.line(vector(v346.x - 5, v346.y + 0.6), vector(v346.x + 6, v346.y + 0.6), color(v343.r, v343.g, v343.b, v345.color));
                end;
                if v0.ui.hitmarker:get("Screen") and v345.time + 1.5 > globals.realtime then
                    if v345.color2 < 255 and v345.time + 1 > globals.realtime then
                        v345.color2 = v0.funcs.lerp(globals.frametime * 17, v345.color2, 255);
                    else
                        v345.color2 = v0.funcs.lerp(globals.frametime * 17, v345.color2, 0);
                    end;
                    render.line(vector(screen.x / 2 + 5, screen.y / 2 - 5), vector(screen.x / 2 + 10, screen.y / 2 - 10), color(255, 255, 255, v345.color2));
                    render.line(vector(screen.x / 2 + 5, screen.y / 2 + 5), vector(screen.x / 2 + 10, screen.y / 2 + 10), color(255, 255, 255, v345.color2));
                    render.line(vector(screen.x / 2 - 5, screen.y / 2 - 5), vector(screen.x / 2 - 10, screen.y / 2 - 10), color(255, 255, 255, v345.color2));
                    render.line(vector(screen.x / 2 - 5, screen.y / 2 + 5), vector(screen.x / 2 - 10, screen.y / 2 + 10), color(255, 255, 255, v345.color2));
                    render.line(vector(screen.x / 2 + 5, screen.y / 2 - 5), vector(screen.x / 2 + 10, screen.y / 2 - 10), color(255, 255, 255, v345.color2));
                    render.line(vector(screen.x / 2 + 5, screen.y / 2 + 5), vector(screen.x / 2 + 10, screen.y / 2 + 10), color(255, 255, 255, v345.color2));
                    render.line(vector(screen.x / 2 - 5, screen.y / 2 - 5), vector(screen.x / 2 - 10, screen.y / 2 - 10), color(255, 255, 255, v345.color2));
                    render.line(vector(screen.x / 2 - 5, screen.y / 2 + 5), vector(screen.x / 2 - 10, screen.y / 2 + 10), color(255, 255, 255, v345.color2));
                end;
                if v345.time + 5 < globals.realtime then
                    table.remove(v0.other.markers, v344);
                end;
            end;
            return;
        end;
    end), 
    v0.events.register("aim_ack", "hitmarker_shot", function(v347)
        -- upvalues: v0 (ref)
        if v347.state == nil then
            table.insert(v0.other.markers, {
                color2 = 0, 
                color = 0, 
                pos2 = v347.aim, 
                time = globals.realtime
            });
        end;
    end), 
    v0.events.register("render", "aa_arrows", function(_)
        -- upvalues: v0 (ref), v11 (ref)
        if not v0.ui.arrows:get() then
            return;
        else
            local v349 = entity.get_local_player();
            if v349 == nil then
                return;
            else
                local v350 = v0.ui.arrow_color:get();
                local v351 = 0;
                local v352 = math.floor(v0.funcs.get_velocity(entity.get_local_player())) / 15;
                if v349 == nil or not v349:is_alive() then
                    return;
                else
                    if v0.ui.arrow_animation:get() then
                        v351 = v352 > 300 and 300 or v352;
                    else
                        v351 = 0;
                    end;
                    v0.other.velocity_anim = v0.funcs.lerp(globals.frametime * 12, v0.other.velocity_anim, v351);
                    if v0.ui.arrow_style:get() == "Old" then
                        render.text(v0.fonts.tahoma20, vector(screen.x / 2 + 35 + v0.other.velocity_anim + v0.ui.arrow_add:get(), screen.y / 2 - 8 - v0.ui.arrow_size:get() / 2), v11 and color(0, 0, 0, 100) or v350, "a", ">");
                        render.text(v0.fonts.tahoma20, vector(screen.x / 2 - 48 - v0.other.velocity_anim - v0.ui.arrow_add:get(), screen.y / 2 - 8 - v0.ui.arrow_size:get() / 2), v11 and v350 or color(0, 0, 0, 100), "a", "<");
                    end;
                    if v0.ui.arrow_style:get() == "New" then
                        render.poly(v0.ui.manual_aa:get() == "Right" and v350 or color(35, 35, 35, 150), vector(screen.x / 2 + 50 + v0.other.velocity_anim + v0.ui.arrow_add:get() + v0.ui.arrow_size:get(), screen.y / 2 - 2 + 2), vector(screen.x / 2 + 42 + v0.other.velocity_anim + v0.ui.arrow_add:get(), screen.y / 2 - 2 - 2 - v0.ui.arrow_size:get()), vector(screen.x / 2 + 42 + v0.other.velocity_anim + v0.ui.arrow_add:get(), screen.y / 2 - 2 + 6 + v0.ui.arrow_size:get()));
                        render.poly(v0.ui.manual_aa:get() == "Left" and v350 or color(35, 35, 35, 150), vector(screen.x / 2 - 50 - v0.other.velocity_anim - v0.ui.arrow_add:get() - v0.ui.arrow_size:get(), screen.y / 2 - 2 + 2), vector(screen.x / 2 - 42 - v0.other.velocity_anim - v0.ui.arrow_add:get(), screen.y / 2 - 2 - 2 - v0.ui.arrow_size:get()), vector(screen.x / 2 - 42 - v0.other.velocity_anim - v0.ui.arrow_add:get(), screen.y / 2 - 2 + 6 + v0.ui.arrow_size:get()));
                        if not v11 then
                            render.rect(vector(screen.x / 2 + 38 + v0.other.velocity_anim + v0.ui.arrow_add:get(), screen.y / 2 - 2 - 2 - v0.ui.arrow_size:get()), vector(screen.x / 2 + 38 + v0.other.velocity_anim + 2 + v0.ui.arrow_add:get(), screen.y / 2 - 2 - 7 + 13 + v0.ui.arrow_size:get()), v350);
                            render.rect(vector(screen.x / 2 - 40 - v0.other.velocity_anim - v0.ui.arrow_add:get(), screen.y / 2 - 2 - 2 - v0.ui.arrow_size:get()), vector(screen.x / 2 - 38 - v0.other.velocity_anim - v0.ui.arrow_add:get(), screen.y / 2 - 2 - 7 + 13 + v0.ui.arrow_size:get()), color(35, 35, 35, 150));
                        else
                            render.rect(vector(screen.x / 2 + 38 + v0.other.velocity_anim + v0.ui.arrow_add:get(), screen.y / 2 - 2 - 2 - v0.ui.arrow_size:get()), vector(screen.x / 2 + 38 + v0.other.velocity_anim + 2 + v0.ui.arrow_add:get(), screen.y / 2 - 2 - 7 + 13 + v0.ui.arrow_size:get()), color(35, 35, 35, 150));
                            render.rect(vector(screen.x / 2 - 40 - v0.other.velocity_anim - v0.ui.arrow_add:get(), screen.y / 2 - 2 - 2 - v0.ui.arrow_size:get()), vector(screen.x / 2 - 38 - v0.other.velocity_anim - v0.ui.arrow_add:get(), screen.y / 2 - 2 - 7 + 13 + v0.ui.arrow_size:get()), v350);
                        end;
                    end;
                    return;
                end;
            end;
        end;
    end), 
    clantag = {
        old_time = 0, 
        _set_clantag = ffi.cast("int(__fastcall*)(const char*, const char*)", utils.opcode_scan("engine.dll", "53 56 57 8B DA 8B F9 FF 15")), 
        set_clantag = function(v353)
            -- upvalues: v0 (ref)
            if v353 == v0.other.clantag._last_clantag then
                return;
            else
                v0.other.clantag._set_clantag(v353, v353);
                v0.other.clantag._last_clantag = v353;
                return;
            end;
        end, 
        animation = {
            [1] = "                  ", 
            [2] = "                 L", 
            [3] = "                Li", 
            [4] = "               Lig", 
            [5] = "              Ligh", 
            [6] = "             Light", 
            [7] = "            Lightn", 
            [8] = "           Lightni", 
            [9] = "          Lightnin", 
            [10] = "         Lightning", 
            [11] = "        Lightning ", 
            [12] = "       Lightning  ", 
            [13] = "      Lightning   ", 
            [14] = "     Lightning    ", 
            [15] = "    Lightning     ", 
            [16] = "   Lightning      ", 
            [17] = "  Lightning       ", 
            [18] = " Lightning        ", 
            [19] = "Lightning         ", 
            [20] = "ightning          ", 
            [21] = "ghtning           ", 
            [22] = "htning            ", 
            [23] = "tning             ", 
            [24] = "ning              ", 
            [25] = "ing               ", 
            [26] = "ng                ", 
            [27] = "g                 ", 
            [28] = "                  "
        }; 
        v0.events.register("render", "clantag", function(_)
            -- upvalues: v0 (ref)
            if not v0.ui.clantag:get() then
                return;
            elseif not globals.is_connected then
                return;
            else
                local v355 = math.floor(globals.curtime * 2);
                if v0.other.clantag.old_time ~= v355 then
                    v0.other.clantag.set_clantag(v0.other.clantag.animation[v355 % #v0.other.clantag.animation + 1], v0.other.clantag.animation[v355 % #v0.other.clantag.animation + 1]);
                end;
                ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"):set(false);
                v0.other.clantag.old_time = v355;
                return;
            end;
        end), 
        v0.ui.clantag:set_callback(function()
            -- upvalues: v0 (ref)
            if not v0.ui.clantag:get() then
                v0.other.clantag.set_clantag("", "");
            end;
        end)
    }, 
    v0.events.register("player_death", "talk_shit", function(v356)
        -- upvalues: v0 (ref)
        local v357 = entity.get_local_player();
        local v358 = entity.get(v356.userid, true);
        local v359 = entity.get(v356.attacker, true);
        if v0.ui.talkshit:get("On Death") and v358 == v357 then
            local v360 = {
                [1] = "How you can be that lucky monkey?", 
                [2] = "my console always says stomach due to ?", 
                [3] = "oh fuck I've never seen so much happiness in 1 kill", 
                [4] = "1st headshot?", 
                [5] = "congratulations on such a pathetic kill on your part", 
                [6] = "fucking armless bot", 
                [7] = "go 1v1 or 2v2 fucking luckbot", 
                [8] = "killed by a fucking random I can't"
            };
            local v361 = {
                [1] = "CO ZA PIERDOLONY BOT", 
                [2] = "wiecej farta niz skilla", 
                [3] = "Jebac ci matke menelice jebana", 
                [4] = "TY PIERDOLONA KURWO Z FARTEM", 
                [5] = "fajnie biegasz +w gownie", 
                [6] = "jebany random"
            };
            do
                local l_v360_0, l_v361_0 = v360, v361;
                utils.execute_after(v0.ui.talk_delay:get(), function()
                    -- upvalues: v0 (ref), l_v360_0 (ref), l_v361_0 (ref)
                    if v0.ui.talk_lang:get() == "English" then
                        phase = math.random(1, #l_v360_0);
                        utils.console_exec("say " .. l_v360_0[phase]);
                    elseif v0.ui.talk_lang:get() == "Polish" then
                        phase = math.random(1, #l_v361_0);
                        utils.console_exec("say " .. l_v361_0[phase]);
                    end;
                end);
            end;
        end;
        if v0.ui.talkshit:get("On Kill") and (not v358 == v359 or v359 == v357) then
            local v364 = {
                [1] = "Is Lightning too much for you, clown?", 
                [2] = "sry lc", 
                [3] = "so fucking shit dude", 
                [4] = "so slow dude", 
                [5] = "haters gonna hate", 
                [6] = "l2p dogshit dumbfuck?=?=??==?", 
                [7] = "you fkn botik ur wr is lower than 30", 
                [8] = "never think ur good!??", 
                [9] = "THUG LIFEEEEEEEEEEEEE", 
                [10] = "if u want, go to a loterry, lets see if u win, if u dont come and play 1v1", 
                [11] = "i like to do doggy style with ur mother"
            };
            local v365 = {
                [1] = "Moze warto trafic tego lightninga obciagaczu jebany", 
                [2] = "Lezec stara kurwo", 
                [3] = "dobry piesek daje mi killa", 
                [4] = "wykladasz sie jak najgorszy bot", 
                [5] = "JAKI TY KURWA JESTES SLOW AHHAHSHASHA", 
                [6] = "TY PIERDOLONY BOCIE 1", 
                [7] = "zastanow sie co ty jeszcze robisz w tym hvh", 
                [8] = "head bocie jebany", 
                [9] = "wypierdalaj do spania gownie 1", 
                [10] = "BUM HEADSHOT ROJO ROJEWSKI", 
                [11] = "dzieki bociku jebany za fraga", 
                [12] = "oko ci spierdolilo?"
            };
            do
                local l_v364_0, l_v365_0 = v364, v365;
                utils.execute_after(v0.ui.talk_delay:get(), function()
                    -- upvalues: v0 (ref), l_v364_0 (ref), l_v365_0 (ref)
                    if v0.ui.talk_lang:get() == "English" then
                        phase = math.random(1, #l_v364_0);
                        utils.console_exec("say " .. l_v364_0[phase]);
                    elseif v0.ui.talk_lang:get() == "Polish" then
                        phase = math.random(1, #l_v365_0);
                        utils.console_exec("say " .. l_v365_0[phase]);
                    end;
                end);
            end;
        end;
    end)
};
local v368 = 1;
end_time = 0;
ground_ticks = v368;
v0.legs = {
    rand = 0, 
    loopleg = 4, 
    values = {
        [0] = 0.85, 
        [1] = 0.15
    }
};
updateCSA_hk = function(v369)
    -- upvalues: v0 (ref)
    if entity.get_local_player() == nil or ffi.cast("uintptr_t", v369) == nil then
        return;
    else
        local v370 = entity.get_local_player();
        local v371 = get_entity_address(v370:get_index());
        if v371 == nil then
            return;
        else
            if v0.ui.local_animations:get("Pitch 0 On Land") then
                ffi.cast("float*", v371 + 10104)[12] = 0;
            end;
            if v0.ui.local_animations:get("Static Legs In Air") then
                ffi.cast("float*", v371 + 10104)[6] = 1;
            end;
            if v0.ui.local_animations:get("Pitch 0 On Land") then
                if bit.band(entity.get_local_player().m_fFlags, 1) == 1 then
                    ground_ticks = ground_ticks + 1;
                else
                    ground_ticks = 0;
                    end_time = globals.curtime + 1;
                end;
                if not v0.funcs.in_air() and ground_ticks > 1 and end_time > globals.curtime then
                    ffi.cast("float*", v371 + 10104)[12] = 0.5;
                end;
            end;
            if v0.ui.local_animations:get("Lean Animation") then
                ffi.cast("CAnimationLayer**", ffi.cast("uintptr_t", v371) + 10640)[0][12].m_flWeight = 1;
            end;
            if v0.ui.local_animations:get("Leg Breaker") then
                if v0.ui.leg_style:get() == "Jitter" then
                    if globals.tickcount % 2 == 0 then
                        v0.legs.loopleg = 1;
                    end;
                    if globals.tickcount % 4 == 0 then
                        v0.legs.loopleg = 0;
                    end;
                    if globals.tickcount % 3 == 0 then
                        v0.legs.rand = 1;
                    end;
                    if globals.tickcount % 6 == 0 then
                        v0.legs.rand = 0;
                    end;
                    ffi.cast("float*", v371 + 10104)[0] = v0.legs.loopleg == 0 and v0.legs.values[v0.legs.rand] or 1;
                    if not v0.ui.hide_legs:get() then
                        ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):set("Sliding");
                    end;
                elseif v0.ui.leg_style:get() == "Static" then
                    ffi.cast("float*", v371 + 10104)[0] = 1;
                    if not v0.ui.hide_legs:get() then
                        ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):set("Sliding");
                    end;
                elseif v0.ui.leg_style:get() == "Moon Walk" then
                    ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):set("Walking");
                    if v0.funcs.in_air() then
                        ffi.cast("CAnimationLayer**", ffi.cast("uintptr_t", v371) + 10640)[0][6].m_flWeight = 1;
                    end;
                    ffi.cast("float*", ffi.cast("uintptr_t", v371) + 10104)[7] = 0;
                end;
            end;
            return;
        end;
    end;
end;
v0.events.register("post_update_clientside_animation", "anim_state_hook", function(_)
    local v373 = entity.get_local_player();
    if not v373 then
        return;
    else
        updateCSA_hk(v373);
        return;
    end;
end);
v0.events.register("createmove", "lean_anim_cmd", function(v374)
    -- upvalues: v0 (ref)
    if v0.ui.local_animations:get("Lean Animation") then
        v374.animate_move_lean = true;
    end;
end);
events.createmove_run:set(function(_)
    -- upvalues: v11 (ref)
    if globals.choked_commands == 0 then
        local v376 = entity.get_local_player();
        if v376 == nil then
            return;
        else
            v11 = v376.m_flPoseParameter[11] * 120 - 60 <= 0;
        end;
    end;
end);
v0.configs = {
    delete_id = 0, 
    delete_state = 0, 
    create_state_create = 0, 
    configs_label = v0.groups.configs:label(ui.get_icon("cloud") .. " Connecting to cloud, please wait..."), 
    configs_listbox = v0.groups.configs:list("Configs", l_configs_0, function()

    end):visibility(false), 
    config_name = v0.groups.configs:input("Config name"):visibility(false), 
    config_delete_name = v0.groups.configs:label(""):visibility(false), 
    config_create = v0.groups.configs:button("\affea00FF" .. ui.get_icon("file-plus") .. "\a" .. v0.userstyle.button:to_hex() .. " Create", function()
        -- upvalues: v0 (ref)
        if websocket_connection == nil then
            v0.configs.configs_label:name(ui.get_icon("cloud") .. "  Can't connect to lightning Servers!"):visibility(true);
            v0.configs.configs_listbox:visibility(false);
            return;
        else
            if v0.configs.create_state_create == 0 then
                v0.configs.config_name:visibility(true);
                v0.configs.config_cancel:visibility(true);
                v0.configs.config_save:visibility(false);
                v0.configs.config_load:visibility(false);
                v0.configs.config_remove:visibility(false);
                v0.configs.config_import:visibility(false);
                v0.configs.config_export:visibility(false);
                v0.configs.create_state_create = 1;
                v0.configs.config_create:name("\a00ff1aFF" .. ui.get_icon("check") .. "\a" .. v0.userstyle.button:to_hex() .. " Create");
            elseif v0.configs.create_state_create == 1 then
                v0.configs.config_name:visibility(false);
                v0.configs.config_cancel:visibility(false);
                v0.configs.config_save:visibility(true);
                v0.configs.config_load:visibility(true);
                v0.configs.config_remove:visibility(true);
                v0.configs.config_remove:visibility(true);
                v0.configs.config_import:visibility(true);
                v0.configs.config_export:visibility(true);
                v0.configs.create_state_create = 0;
                v0.configs.config_create:name("\affea00FF" .. ui.get_icon("file-plus") .. "\a" .. v0.userstyle.button:to_hex() .. " Create");
                if v0.configs.config_name:get() == "" then
                    v0.notifications.add_notification(string.format("Config name cant be empty!"));
                    return;
                else
                    websocket_connection:send(json.stringify({
                        msg_data = "", 
                        msg_type = "create_new_config", 
                        msg_name = v0.configs.config_name:get(), 
                        msg_user = v0.data.username
                    }));
                    v0.notifications.add_notification(string.format("Created config " .. v0.configs.config_name:get()));
                    utils.execute_after(1, v0.configs.refresh_configs_data);
                end;
            end;
            return;
        end;
    end), 
    config_save = v0.groups.configs:button("\affa200ff" .. ui.get_icon("file-check") .. "\a" .. v0.userstyle.button:to_hex() .. " Save", function()
        -- upvalues: v0 (ref), v23 (ref), l_configs_0 (ref), l_IDs_0 (ref)
        if websocket_connection == nil then
            v0.configs.configs_label:name(ui.get_icon("cloud") .. "  Can't connect to lightning Servers!"):visibility(true);
            v0.configs.configs_listbox:visibility(false);
            return;
        elseif v0.configs.configs_listbox:get() == 1 then
            v0.notifications.add_notification(string.format("You cant override default config!"));
            return;
        else
            Code = {
                [1] = {}
            };
            for _, v378 in pairs(v23.lightning) do
                table.insert(Code[1], v378:get());
            end;
            v0.notifications.add_notification(string.format("Saved config " .. l_configs_0[v0.configs.configs_listbox:get()]));
            websocket_connection:send(json.stringify({
                msg_type = "save_config", 
                ids_temp = l_IDs_0[v0.configs.configs_listbox:get()], 
                data_temp = base64.encode(json.stringify(Code))
            }));
            return;
        end;
    end), 
    config_load = v0.groups.configs:button("\a00ff1aFF" .. ui.get_icon("file-import") .. "\a" .. v0.userstyle.button:to_hex() .. " Load", function()
        -- upvalues: v0 (ref), l_configs_0 (ref), v23 (ref), l_IDs_0 (ref)
        if websocket_connection == nil then
            v0.configs.configs_label:name(ui.get_icon("cloud") .. "  Can't connect to lightning Servers!"):visibility(true);
            v0.configs.configs_listbox:visibility(false);
            return;
        else
            if v0.configs.configs_listbox:get() == 1 then
                v0.notifications.add_notification(string.format("Loaded config " .. l_configs_0[v0.configs.configs_listbox:get()]));
                kfg = base64.decode("W1t0cnVlLCJBdCBUYXJnZXQiLCJEb3duIiwiSml0dGVyIiw0LjAsIkppdHRlciIsIlN0YW5kYXJkIiw3LjAsNy4wLC0yMy4wLDIzLjAsMzcuMCwwLjAsMC4wLCJDZW50ZXIiLC03MC4wLDAuMCx0cnVlLCJBdCBUYXJnZXQiLCJEb3duIiwiU3RhdGljIiw2MC4wLCJKaXR0ZXIiLCJTdGFuZGFyZCIsNy4wLDcuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLCJDZW50ZXIiLC03MC4wLDIwLjAsZmFsc2UsIkF0IFRhcmdldCIsIkRvd24iLCJKaXR0ZXIiLDQ1LjAsIkppdHRlciIsIlN0YW5kYXJkIiwxMi4wLDEyLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwiQ2VudGVyIiwtNjAuMCwwLjAsdHJ1ZSwiQXQgVGFyZ2V0IiwiRG93biIsIlN0YXRpYyIsNjAuMCwiSml0dGVyIiwiU3RhbmRhcmQiLDcuMCw3LjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwiQ2VudGVyIiwtNjAuMCwwLjAsZmFsc2UsIkF0IFRhcmdldCIsIkRvd24iLCJKaXR0ZXIiLDYwLjAsIkppdHRlciIsIlN0YW5kYXJkIiwxNC4wLDE0LjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwiQ2VudGVyIiwtNDUuMCwzLjAsdHJ1ZSwiQXQgVGFyZ2V0IiwiRG93biIsIkppdHRlciIsMzIuMCwiSml0dGVyIiwiU3RhbmRhcmQiLDcuMCw3LjAsLTIwLjAsMjAuMCwzNS4wLDAuMCwwLjAsIkNlbnRlciIsLTcwLjAsMjAuMCx0cnVlLCJPZmYiLHRydWUsdHJ1ZSx0cnVlLCJEaXNhYmxlZCIsIjMtd2F5Iix0cnVlLFsiV2Fsa2luZyIsIlNsb3cgV2FsayIsIkNyb3VjaGluZyIsIkluIEFpciIsIkluIEFpciBDcm91Y2hpbmciXSx0cnVlLGZhbHNlLFsiU2NvdXQiLCJLbmlmZSJdLDEuMCxbIkZhc3QgTGFkZGVyIiwiTm8gRmFsbCBEYW1hZ2UiXSxbIlN0YXRpYyBMZWdzIEluIEFpciIsIkxlZyBCcmVha2VyIiwiTGVhbiBBbmltYXRpb24iXSwiSml0dGVyIix0cnVlLDE0MC4wLGZhbHNlLFsiT24gS2lsbCIsIk9uIERlYXRoIl0sWyJPbi1TY3JlZW4iLCJDb25zb2xlIiwiRXZlbnRzIl0sWyJHYW1lU2Vuc2UiXSxbIkRUIiwiT1MiLCJGUyJdLFsiT1NBQSIsIkRUIiwiREEiLCJTQUZFIiwiQk9EWSIsIkRNRyIsIkRVQ0siLCJCT01CIiwiSEMiLCJGUyJdLFsiV29ybGQiLCJTY3JlZW4iXSxmYWxzZSwiTmV3IiwyNC4wLHRydWUsdHJ1ZSx0cnVlLDIuMCwiTWluIERNRyIsZmFsc2UsNC4wLGZhbHNlLDE0NS4wLDIuMCxmYWxzZSwxNS4wLCJQb2xpc2giXV0=");
                for _, _ in pairs(json.parse(kfg)) do
                    for v381, v382 in pairs(json.parse(kfg)) do
                        v381 = ({
                            [1] = "lightning"
                        })[v381];
                        for v383, v384 in pairs(v382) do
                            if v381 == "lightning" then
                                v23[v381][v383]:set(v384);
                            end;
                        end;
                    end;
                end;
            else
                websocket_connection:send(json.stringify({
                    msg_type = "load_config", 
                    ids_temp = l_IDs_0[v0.configs.configs_listbox:get()]
                }));
            end;
            return;
        end;
    end), 
    config_remove = v0.groups.configs:button("\aff000dFF" .. ui.get_icon("trash") .. "\a" .. v0.userstyle.button:to_hex() .. " Delete", function()
        -- upvalues: v0 (ref), l_configs_0 (ref), l_IDs_0 (ref)
        if websocket_connection == nil then
            v0.configs.configs_label:name(ui.get_icon("cloud") .. "  Can't connect to lightning Servers!"):visibility(true);
            v0.configs.configs_listbox:visibility(false);
            return;
        else
            if v0.configs.delete_state == 0 then
                v0.configs.config_cancel:visibility(true);
                v0.configs.config_save:visibility(false);
                v0.configs.config_load:visibility(false);
                v0.configs.config_create:visibility(false);
                v0.configs.config_import:visibility(false);
                v0.configs.config_export:visibility(false);
                v0.configs.delete_state = 1;
                v0.configs.delete_id = v0.configs.configs_listbox:get();
                v0.configs.config_remove:name("\a00ff1aFF" .. ui.get_icon("check") .. "\a" .. v0.userstyle.button:to_hex() .. " Delete");
                v0.configs.config_delete_name:name("\affea00FF" .. ui.get_icon("triangle-exclamation") .. "\a" .. v0.userstyle.button:to_hex() .. " Are you sure you want to delete config: \affea00FF" .. l_configs_0[v0.configs.delete_id]):visibility(true);
            elseif v0.configs.delete_state == 1 then
                v0.configs.config_cancel:visibility(false);
                v0.configs.config_delete_name:visibility(false);
                v0.configs.config_save:visibility(true);
                v0.configs.config_load:visibility(true);
                v0.configs.config_create:visibility(true);
                v0.configs.config_import:visibility(true);
                v0.configs.config_export:visibility(true);
                v0.configs.config_remove:name("\aff000dFF" .. ui.get_icon("trash") .. "\a" .. v0.userstyle.button:to_hex() .. " Delete");
                v0.configs.delete_state = 0;
                if v0.configs.delete_id == 1 then
                    v0.notifications.add_notification(string.format("You cant remove default config!"));
                    return;
                else
                    v0.notifications.add_notification(string.format("Removed config " .. l_configs_0[v0.configs.delete_id]));
                    websocket_connection:send(json.stringify({
                        msg_type = "delete_config", 
                        ids_temp = l_IDs_0[v0.configs.delete_id]
                    }));
                    utils.execute_after(1, v0.configs.refresh_configs_data);
                end;
            end;
            return;
        end;
    end), 
    config_cancel = v0.groups.configs:button("\aff000dFF" .. ui.get_icon("xmark") .. "\a" .. v0.userstyle.button:to_hex() .. " Cancel", function()
        -- upvalues: v0 (ref)
        v0.configs.config_cancel:visibility(false);
        v0.configs.config_name:visibility(false);
        v0.configs.config_delete_name:visibility(false);
        v0.configs.config_create:visibility(true);
        v0.configs.config_save:visibility(true);
        v0.configs.config_load:visibility(true);
        v0.configs.config_remove:visibility(true);
        v0.configs.config_remove:visibility(true);
        v0.configs.config_import:visibility(true);
        v0.configs.config_export:visibility(true);
        v0.configs.config_create:name("\affea00FF" .. ui.get_icon("file-plus") .. "\a" .. v0.userstyle.button:to_hex() .. " Create");
        v0.configs.config_remove:name("\aff000dFF" .. ui.get_icon("trash") .. "\a" .. v0.userstyle.button:to_hex() .. " Delete");
        v0.configs.create_state_create = 0;
        v0.configs.delete_state = 0;
        v0.configs.delete_id = 0;
    end):visibility(false), 
    config_import = v0.groups.configs:button("\a00ff1aFF" .. ui.get_icon("download") .. "\a" .. v0.userstyle.button:to_hex() .. " Import config", function()
        -- upvalues: v23 (ref), v0 (ref)
        kfg = base64.decode(clipboard.get());
        for v385, v386 in pairs(json.parse(kfg)) do
            v385 = ({
                [1] = "lightning"
            })[v385];
            for v387, v388 in pairs(v386) do
                if v385 == "lightning" then
                    v23[v385][v387]:set(v388);
                end;
            end;
        end;
        v0.notifications.add_notification(string.format("Config imported"));
    end), 
    config_export = v0.groups.configs:button("\aff000dFF" .. ui.get_icon("upload") .. "\a" .. v0.userstyle.button:to_hex() .. " Export config", function()
        -- upvalues: v23 (ref), v0 (ref)
        Code = {
            [1] = {}
        };
        for _, v390 in pairs(v23.lightning) do
            table.insert(Code[1], v390:get());
        end;
        clipboard.set(base64.encode(json.stringify(Code)));
        v0.notifications.add_notification(string.format("Config exported"));
    end), 
    refresh_configs_data = function()
        -- upvalues: v0 (ref)
        if websocket_connection == nil then
            v0.configs.configs_label:name(ui.get_icon("cloud") .. "  Can't connect to lightning Servers!"):visibility(true);
            v0.configs.configs_listbox:visibility(false);
            return;
        else
            websocket_connection:send(json.stringify({
                msg_data = "", 
                msg_type = "store_configs", 
                msg_name = v0.configs.config_name:get(), 
                msg_user = v0.data.username
            }));
            utils.execute_after(10, v0.configs.refresh_configs_data);
            return;
        end;
    end
};
utils.execute_after(5, v0.configs.refresh_configs_data);
v368 = {
    buttons = {}
};
for v391 = 1, 9 do
    do
        local l_v391_0 = v391;
        v368.buttons[l_v391_0] = {
            field = v0.groups.games:button("                   ", function()
                -- upvalues: v0 (ref), l_v391_0 (ref)
                v0.minigames.tictactoe.field_interact(l_v391_0);
            end):visibility(false)
        };
    end;
end;
local v393 = {};
for v394 = 1, 81 do
    do
        local l_v394_0 = v394;
        v393[l_v394_0] = {
            revealed = false, 
            mine = false, 
            field = v0.groups.games:button("    ", function()
                -- upvalues: v0 (ref), l_v394_0 (ref)
                if v0.minigames.game_state == 1 then
                    v0.minigames.minesweeper.handleButtonClick(l_v394_0);
                end;
            end):visibility(false)
        };
    end;
end;
v0.minigames = {
    NUM_MINES = 10, 
    game_state = 0, 
    game_turn = 0, 
    game_label = v0.groups.games:label(""):visibility(false), 
    game_type = v0.groups.games:combo("\a00ff1aFF" .. ui.get_icon("gamepad") .. "\a" .. v0.userstyle.button:to_hex() .. "  Select game", "Tic-Tac-Toe", "Minesweeper"), 
    main_button = v0.groups.games:button("\a00ff1aFF" .. ui.get_icon("play") .. "\a" .. v0.userstyle.button:to_hex() .. "  Start game", function()
        -- upvalues: v0 (ref), v368 (ref), v393 (ref)
        if v0.minigames.game_type:get() == "Tic-Tac-Toe" then
            if v0.minigames.game_state == 0 then
                v0.minigames.main_button:name("\aff000dFF" .. ui.get_icon("stop") .. "\a" .. v0.userstyle.button:to_hex() .. "  Stop");
                v0.minigames.game_state = 1;
                v0.minigames.game_type:visibility(false);
                for v396 = 1, 9 do
                    v368.buttons[v396].field:visibility(true);
                    v368.buttons[v396].field:name("                   ");
                end;
                if math.random(1, 2) == 1 then
                    v0.minigames.game_turn = 1;
                    v0.minigames.game_label:name("You make the first move!"):visibility(true);
                else
                    v0.minigames.game_turn = 0;
                    v0.minigames.tictactoe.bot_make_move();
                    v0.minigames.game_label:name("Bot maked first move, your turn"):visibility(true);
                end;
            elseif v0.minigames.game_state == 1 then
                v0.minigames.main_button:name("\a00ff1aFF" .. ui.get_icon("play") .. "\a" .. v0.userstyle.button:to_hex() .. "  Start game");
                v0.minigames.game_state = 0;
                v0.minigames.game_label:name(""):visibility(false);
                v0.minigames.game_type:visibility(true);
                for v397 = 1, 9 do
                    v368.buttons[v397].field:visibility(false);
                end;
            elseif v0.minigames.game_state == 2 then
                v0.minigames.main_button:name("\aff000dFF" .. ui.get_icon("stop") .. "\a" .. v0.userstyle.button:to_hex() .. "  Stop");
                v0.minigames.game_state = 1;
                for v398 = 1, 9 do
                    v368.buttons[v398].field:name("                   ");
                end;
                if math.random(1, 2) == 1 then
                    v0.minigames.game_turn = 1;
                    v0.minigames.game_label:name("You make the first move!"):visibility(true);
                else
                    v0.minigames.game_turn = 0;
                    v0.minigames.tictactoe.bot_make_move();
                    v0.minigames.game_label:name("Bot maked first move, your turn"):visibility(true);
                end;
            end;
        end;
        if v0.minigames.game_type:get() == "Minesweeper" then
            if v0.minigames.game_state == 0 then
                v0.minigames.main_button:name("\aff000dFF" .. ui.get_icon("stop") .. "\a" .. v0.userstyle.button:to_hex() .. "  Stop");
                v0.minigames.game_state = 1;
                v0.minigames.game_label:name(ui.get_icon("face-smile") .. "  Select a field"):visibility(true);
                v0.minigames.game_type:visibility(false);
                for v399 = 1, 81 do
                    v393[v399].field:name("    "):visibility(true);
                    v393[v399].mine = false;
                    v393[v399].revealed = false;
                end;
                v0.minigames.minesweeper.generateMines();
            elseif v0.minigames.game_state == 1 then
                v0.minigames.main_button:name("\a00ff1aFF" .. ui.get_icon("play") .. "\a" .. v0.userstyle.button:to_hex() .. "  Start game");
                v0.minigames.game_state = 0;
                v0.minigames.game_label:name(""):visibility(false);
                v0.minigames.game_type:visibility(true);
                for v400 = 1, 81 do
                    v393[v400].field:visibility(false);
                end;
            elseif v0.minigames.game_state == 2 then
                v0.minigames.main_button:name("\aff000dFF" .. ui.get_icon("stop") .. "\a" .. v0.userstyle.button:to_hex() .. "  Stop");
                v0.minigames.game_state = 1;
                v0.minigames.game_label:name(ui.get_icon("face-smile") .. "  Select a field"):visibility(true);
                for v401 = 1, 81 do
                    v393[v401].field:name("    ");
                    v393[v401].mine = false;
                    v393[v401].revealed = false;
                end;
                v0.minigames.minesweeper.generateMines();
            end;
        end;
    end), 
    tictactoe = {
        field_interact = function(v402)
            -- upvalues: v0 (ref), v368 (ref)
            if v0.minigames.game_turn == 1 and v0.minigames.game_state == 1 and v368.buttons[v402].field:name() == "                   " then
                v368.buttons[v402].field:name("        X        ");
                if v0.minigames.tictactoe.check_win("X") then
                    v0.minigames.game_label:name("\a00ff1aFFCongratulations, You win!"):visibility(true);
                    v0.minigames.main_button:name("\affa200ff" .. ui.get_icon("rotate-right") .. "\a" .. v0.userstyle.button:to_hex() .. "  Restart");
                    v0.minigames.game_state = 2;
                elseif v0.minigames.tictactoe.check_draw() then
                    v0.minigames.game_label:name("\affa200ffGame ended in a draw!"):visibility(true);
                    v0.minigames.main_button:name("\affa200ff" .. ui.get_icon("rotate-right") .. "\a" .. v0.userstyle.button:to_hex() .. "  Restart");
                    v0.minigames.game_state = 2;
                else
                    v0.minigames.game_turn = 0;
                    v0.minigames.tictactoe.bot_make_move();
                    if v0.minigames.tictactoe.check_win("O") then
                        v0.minigames.game_label:name("\aff000dFFUnfortunately, bot won!"):visibility(true);
                        v0.minigames.main_button:name("\affa200ff" .. ui.get_icon("rotate-right") .. "\a" .. v0.userstyle.button:to_hex() .. "  Restart");
                        v0.minigames.game_state = 2;
                    elseif v0.minigames.tictactoe.check_draw() then
                        v0.minigames.game_label:name("\affa200ffGame ended in a draw!"):visibility(true);
                        v0.minigames.main_button:name("\affa200ff" .. ui.get_icon("rotate-right") .. "\a" .. v0.userstyle.button:to_hex() .. "  Restart");
                        v0.minigames.game_state = 2;
                    end;
                end;
            end;
        end, 
        check_draw = function()
            -- upvalues: v368 (ref)
            for v403 = 1, 9 do
                if v368.buttons[v403].field:name() == "                   " then
                    return false;
                end;
            end;
            return true;
        end, 
        check_win = function(v404)
            -- upvalues: v368 (ref)
            local v405 = "";
            v405 = v404 == "X" and "        X        " or "       O        ";
            for v406 = 1, 7, 3 do
                if v368.buttons[v406].field:name() == v405 and v368.buttons[v406 + 1].field:name() == v405 and v368.buttons[v406 + 2].field:name() == v405 then
                    return true;
                end;
            end;
            for v407 = 1, 3 do
                if v368.buttons[v407].field:name() == v405 and v368.buttons[v407 + 3].field:name() == v405 and v368.buttons[v407 + 6].field:name() == v405 then
                    return true;
                end;
            end;
            if v368.buttons[1].field:name() == v405 and v368.buttons[5].field:name() == v405 and v368.buttons[9].field:name() == v405 then
                return true;
            elseif v368.buttons[3].field:name() == v405 and v368.buttons[5].field:name() == v405 and v368.buttons[7].field:name() == v405 then
                return true;
            else
                return false;
            end;
        end, 
        bot_make_move = function()
            -- upvalues: v368 (ref), v0 (ref)
            for v408 = 1, 9 do
                if v368.buttons[v408].field:name() == "                   " then
                    v368.buttons[v408].field:name("       O        ");
                    if v0.minigames.tictactoe.check_win("O") then
                        return;
                    else
                        v368.buttons[v408].field:name("                   ");
                    end;
                end;
            end;
            for v409 = 1, 9 do
                if v368.buttons[v409].field:name() == "                   " then
                    v368.buttons[v409].field:name("        X        ");
                    if v0.minigames.tictactoe.check_win("X") then
                        v368.buttons[v409].field:name("       O        ");
                        v0.minigames.game_label:name("Bot selected field, your turn"):visibility(true);
                        v0.minigames.game_turn = 1;
                        return;
                    else
                        v368.buttons[v409].field:name("                   ");
                    end;
                end;
            end;
            local v410 = {};
            for v411 = 1, 9 do
                if v368.buttons[v411].field:name() == "                   " then
                    table.insert(v410, v411);
                end;
            end;
            if #v410 > 0 then
                local v412 = v410[math.random(1, #v410)];
                v368.buttons[v412].field:name("       O        ");
                v0.minigames.game_label:name("Bot selected field, your turn"):visibility(true);
                v0.minigames.game_turn = 1;
            end;
        end
    }, 
    minesweeper = {
        NUM_MINES = 10, 
        game_over = false, 
        generateMines = function()
            -- upvalues: v393 (ref)
            local v413 = 0;
            while v413 < 10 do
                local v414 = math.random(1, 81);
                if not v393[v414].mine then
                    v393[v414].mine = true;
                    v413 = v413 + 1;
                end;
            end;
        end, 
        calculateCellState = function(v415)
            -- upvalues: v393 (ref), v0 (ref)
            local v416 = v393[v415];
            if not v416.revealed then
                v416.revealed = true;
                if v416.mine then
                    v0.minigames.game_state = 2;
                    v416.field:name(" B ");
                else
                    local v417 = 0;
                    local v418 = math.ceil(v415 / 9);
                    local v419 = (v415 - 1) % 9 + 1;
                    for v420 = -1, 1 do
                        for v421 = -1, 1 do
                            local v422 = v418 + v420;
                            local v423 = v419 + v421;
                            local v424 = (v422 - 1) * 9 + v423;
                            if v422 >= 1 and v422 <= 9 and v423 >= 1 and v423 <= 9 and v393[v424].mine then
                                v417 = v417 + 1;
                            end;
                        end;
                    end;
                    if v417 > 0 then
                        v416.field:name(" " .. tostring(v417) .. " ");
                    else
                        for v425 = -1, 1 do
                            for v426 = -1, 1 do
                                local v427 = v418 + v425;
                                local v428 = v419 + v426;
                                local v429 = (v427 - 1) * 9 + v428;
                                if v427 >= 1 and v427 <= 9 and v428 >= 1 and v428 <= 9 then
                                    v0.minigames.minesweeper.calculateCellState(v429);
                                end;
                            end;
                        end;
                    end;
                    if v416.field:name() == "    " and v416.revealed then
                        v416.field:name(" * ");
                    end;
                end;
            end;
        end, 
        handleButtonClick = function(v430)
            -- upvalues: v393 (ref), v0 (ref)
            local v431 = v393[v430];
            if not v431.revealed then
                v0.minigames.minesweeper.calculateCellState(v430);
                if v431.mine then
                    v0.minigames.game_state = 2;
                    for v432 = 1, 81 do
                        if v393[v432].mine then
                            v393[v432].field:name("\aff000dFF B ");
                        end;
                    end;
                    v0.minigames.game_label:name("\aff000dFFGame over! You hit a mine."):visibility(true);
                    v0.minigames.main_button:name("\affa200ff" .. ui.get_icon("rotate-right") .. "\a" .. v0.userstyle.button:to_hex() .. "  Restart");
                    v0.minigames.game_state = 2;
                else
                    local v433 = true;
                    for v434 = 1, 81 do
                        if not v393[v434].revealed and not v393[v434].mine then
                            v433 = false;
                            break;
                        end;
                    end;
                    if v433 then
                        v0.minigames.game_label:name("\a00ff1aFFCongratulations! You won the game."):visibility(true);
                        v0.minigames.main_button:name("\affa200ff" .. ui.get_icon("rotate-right") .. "\a" .. v0.userstyle.button:to_hex() .. "  Restart");
                        v0.minigames.game_state = 2;
                    else
                        v0.minigames.game_label:name(ui.get_icon("face-surprise") .. "  Select next field"):visibility(true);
                    end;
                end;
            end;
        end
    }
};