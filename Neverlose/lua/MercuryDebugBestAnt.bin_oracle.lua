local v0 = common.get_username and common.get_username() or {
    username = "FiveQe"
};
local v1 = "DEV";
local l_ffi_0 = require("ffi");
l_ffi_0.cdef(" \n    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n");
local l_hook_0 = require("neverlose/vmt_hook");
local v4 = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)");
local l_gradient_0 = require("neverlose/gradient");
local l_clipboard_0 = require("neverlose/clipboard");
local l_base64_0 = require("neverlose/base64");
local l_smoothy_0 = require("neverlose/smoothy");
local l_aim_0 = require("neverlose/anti_aim");
local l_animations_0 = require("neverlose/animations");
http = require("neverlose/http_lib").new({
    task_interval = 0.3, 
    timeout = 15, 
    enable_debug = false
});
hook_function = nil;
is_on_ground = false;
local function v14(v11, v12)
    for v13 = 1, #v11 do
        if v11[v13] == v12 then
            return true;
        end;
    end;
    return false;
end;
local v15 = 1;
local v16 = l_smoothy_0.new(0);
local v17 = {
    [1] = "\a508ce6ff", 
    [2] = "\a4a86e0ff", 
    [3] = "\a3482f7ff", 
    [4] = "\a2475f0ff", 
    [5] = "\a1a6eedff", 
    [6] = "\a156aebff", 
    [7] = "\a0c63e8ff", 
    [8] = "\a005be6ff", 
    [9] = "\a0051ccff"
};
local v18 = false;
local v19 = render.screen_size();
local v20 = {
    maximum_count = 4, 
    callback_registered = false, 
    cache = {}
};
local v21 = {
    enabled = false, 
    brutestate = 0, 
    activestate = 0, 
    lastbrute = 0
};
(function()
    -- upvalues: v0 (ref), v1 (ref)
    print("/$$   ");
    print("| $$        ");
    print(" /$$$$$$/$$$$   /$$$$$$   /$$$$$$   /$$$$$$$ /$$   /$$  /$$$$$$  /$$   /$$    | $$ /$$   /$$  /$$$$$$ ");
    print("| $$_  $$_  $$ /$$__  $$ /$$__  $$ /$$_____/| $$  | $$ /$$__  $$| $$  | $$    | $$| $$  | $$ |____  $$");
    print("| $$ ' $$ ' $$| $$$$$$$$| $$  '__/| $$      | $$  | $$| $$  '__/| $$  | $$    | $$| $$  | $$  /$$$$$$$");
    print("| $$ | $$ | $$| $$_____/| $$      | $$      | $$  | $$| $$      | $$  | $$    | $$| $$  | $$ /$$__  $$");
    print("| $$ | $$ | $$|  $$$$$$$| $$      |  $$$$$$$|  $$$$$$/| $$      |  $$$$$$$ /$$| $$|  $$$$$$/|  $$$$$$$");
    print("|__/ |__/ |__/ '_______/|__/       '_______/ '______/ |__/       '____  $$|__/|__/ '______/_______/");
    print("                                                                 /$$  | $$                           ");
    print("                                                                |  $$$$$$/                            ");
    print("                                                                 '______/                             ");
    print("Welcome " .. v0 .. "! Thank you for using Mercury.LUA(RECODE)!");
    print("Your build type is:  " .. v1 .. "!");
end)();
local v22 = {
    p_state = 1, 
    manual = 0, 
    p_states = {
        [1] = "Stand", 
        [2] = "Run", 
        [3] = "Slowwalk", 
        [4] = "Air", 
        [5] = "Duck", 
        [6] = "Air-Duck"
    }, 
    s_to_int = {
        Slowwalk = 3, 
        Run = 2, 
        Stand = 1, 
        ["Air-Duck"] = 6, 
        Duck = 5, 
        Air = 4
    }, 
    int_to_state = {
        [1] = "Stand", 
        [2] = "Run", 
        [3] = "Slowwalk", 
        [4] = "Air", 
        [5] = "Duck", 
        [6] = "Air-Duck"
    }, 
    player_states = {
        [1] = "Stand", 
        [2] = "Run", 
        [3] = "Slowwalk", 
        [4] = "Air", 
        [5] = "Duck", 
        [6] = "Air-Duck"
    }, 
    state_to_int = {
        Slowwalk = 3, 
        Run = 2, 
        Stand = 1, 
        ["Air-Duck"] = 6, 
        Duck = 5, 
        Air = 4
    }
};
local v23 = {};
local v24 = {
    slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    qp = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    fbaim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    mindmg = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Min. Damage"), 
    airstrafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe"), 
    scopeoverlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
    aa_switch = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    aa_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    aa_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    aa_yawoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    aa_yawbase = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    aa_yawmodifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    aa_yawmodifieroffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    aa_bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    aa_bodyyawleft = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    aa_bodyyawright = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    aa_bodyyawoptions = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    aa_bodyyawfreestand = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    aa_bodyyawonshot = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
};
local v25 = {
    sidebar = ui.sidebar("Mercury.LUA", "planet-ringed"), 
    logo = ui.create(v17[1] .. "M" .. v17[2] .. "a" .. v17[3] .. "i" .. v17[4] .. "n", v17[1] .. "M" .. v17[2] .. "e" .. v17[3] .. "r" .. v17[4] .. "c" .. v17[5] .. "u" .. v17[6] .. "ry" .. v17[7] .. ".LUA" .. v17[8] .. " | DEV"), 
    information = ui.create(v17[1] .. "M" .. v17[2] .. "a" .. v17[3] .. "i" .. v17[4] .. "n", v17[1] .. "I" .. v17[2] .. "n" .. v17[3] .. "f" .. v17[4] .. "o" .. v17[5] .. "r" .. v17[6] .. "m" .. v17[7] .. "a" .. v17[8] .. "tion"), 
    antiaimSettings = ui.create(v17[1] .. "A" .. v17[2] .. "n" .. v17[3] .. "t" .. v17[4] .. "i" .. v17[5] .. "-" .. v17[6] .. "A" .. v17[7] .. "i" .. v17[8] .. "m", "Anti-Aim Condition Settings"), 
    antiaimConfigTab = ui.create(v17[1] .. "A" .. v17[2] .. "n" .. v17[3] .. "t" .. v17[4] .. "i" .. v17[5] .. "-" .. v17[6] .. "A" .. v17[7] .. "i" .. v17[8] .. "m", "Anti-Aim Configuration Tab"), 
    visuals = ui.create(v17[1] .. "V" .. v17[2] .. "i" .. v17[3] .. "s" .. v17[4] .. "u" .. v17[5] .. "a" .. v17[6] .. "l" .. v17[7] .. "s" .. v17[8] .. "/Misc", "Visuals"), 
    misc = ui.create(v17[1] .. "V" .. v17[2] .. "i" .. v17[3] .. "s" .. v17[4] .. "u" .. v17[5] .. "a" .. v17[6] .. "l" .. v17[7] .. "s" .. v17[8] .. "/Misc", "Misc")
};
local _ = {
    v25.information:label("Mercury.LUA | V1.6"), 
    v25.information:label("Hey " .. v17[4] .. v0 .. "\a98AFBCFF!"), 
    v25.information:label("Your build is: " .. v17[4] .. v1 .. "."), 
    v25.information:label(""), 
    v25.information:button("Our discord server", function()
        print("https://discord.gg/5K3rsGEnR5");
    end), 
    v25.information:label(" "), 
    v25.information:label("  ")
};
local _ = {
    http:get("https://i.imgur.com/OGcdIvF.gif", function(v27)
        -- upvalues: v25 (ref)
        if v27:success() and v27.status == 200 and v27.body then
            local v28 = render.load_image(v27.body);
            v25.logo:texture(v28, vector(260, 247), "f");
        end;
    end)
};
local v30 = {
    watermark = v25.visuals:switch("Mercury.LUA | " .. v17[1] .. "W" .. v17[2] .. "a" .. v17[3] .. "t" .. v17[4] .. "e" .. v17[5] .. "r" .. v17[6] .. "m" .. v17[7] .. "a" .. v17[8] .. "rk"), 
    tsaa_arrows = v25.visuals:switch("Mercury.LUA | " .. v17[1] .. "T" .. v17[2] .. "S " .. v17[3] .. "A" .. v17[4] .. "A" .. v17[5] .. " A" .. v17[6] .. "r" .. v17[7] .. "r" .. v17[8] .. "ows"), 
    indicators = v25.visuals:switch("Mercury.LUA | " .. v17[1] .. "I" .. v17[2] .. "n" .. v17[3] .. "d" .. v17[4] .. "i" .. v17[5] .. "c" .. v17[6] .. "a" .. v17[7] .. "t" .. v17[8] .. "ors"), 
    mindmgind = v25.visuals:switch("Mercury.LUA | " .. v17[1] .. "M" .. v17[2] .. "i" .. v17[3] .. "n" .. v17[4] .. " d" .. v17[5] .. "m" .. v17[6] .. "g" .. v17[7] .. " indic" .. v17[8] .. "ator"), 
    infopanel = v25.visuals:switch("Mercury.LUA | " .. v17[1] .. "I" .. v17[2] .. "n" .. v17[3] .. "f" .. v17[4] .. "o " .. v17[5] .. "p" .. v17[6] .. "a" .. v17[7] .. "n" .. v17[8] .. "el"), 
    scopeoverlay = v25.visuals:switch("Mercury.LUA | " .. v17[1] .. "Cu" .. v17[2] .. "st" .. v17[3] .. "o" .. v17[4] .. "m S" .. v17[5] .. "c" .. v17[6] .. "o" .. v17[7] .. "p" .. v17[8] .. "e"), 
    gsLogs = v25.visuals:switch("Mercury.LUA | " .. v17[1] .. "O" .. v17[2] .. "n" .. v17[3] .. "-" .. v17[4] .. "s" .. v17[5] .. "c" .. v17[6] .. "r" .. v17[7] .. "een " .. v17[8] .. "logs", true)
};
local v31 = {
    aspectratio = v25.misc:switch(v17[1] .. "A" .. v17[2] .. "s" .. v17[3] .. "p" .. v17[4] .. "e" .. v17[5] .. "c" .. v17[6] .. "t" .. v17[7] .. " Rat" .. v17[8] .. "io"), 
    trashtalk = v25.misc:switch(v17[1] .. "T" .. v17[2] .. "r" .. v17[3] .. "a" .. v17[4] .. "s" .. v17[5] .. "h" .. v17[6] .. "t" .. v17[7] .. "a" .. v17[8] .. "lk"), 
    fakestats = v25.misc:switch(v17[1] .. "F" .. v17[2] .. "a" .. v17[3] .. "k" .. v17[4] .. "e" .. v17[5] .. "s" .. v17[6] .. "t" .. v17[7] .. "a" .. v17[8] .. "ts"), 
    fastladder = v25.misc:switch(v17[1] .. "F" .. v17[2] .. "a" .. v17[3] .. "s" .. v17[4] .. "t" .. v17[5] .. " L" .. v17[6] .. "a" .. v17[7] .. "dd" .. v17[8] .. "er"), 
    jumpscoutfix = v25.misc:switch("" .. v17[1] .. "J" .. v17[2] .. "u" .. v17[3] .. "m" .. v17[4] .. "p" .. v17[5] .. "s" .. v17[6] .. "c" .. v17[7] .. "out " .. v17[8] .. "FIX", false), 
    aimbotLogs = v25.misc:selectable("" .. v17[1] .. "A" .. v17[2] .. "i" .. v17[3] .. "m" .. v17[4] .. "b" .. v17[5] .. "o" .. v17[6] .. "t " .. v17[7] .. "lo" .. v17[8] .. "gs", {
        [1] = "Console", 
        [2] = "On-Screen"
    }), 
    animBreakers = v25.misc:selectable("" .. v17[1] .. "O" .. v17[2] .. "G" .. v17[3] .. " A" .. v17[4] .. "n" .. v17[5] .. "i" .. v17[6] .. "m" .. v17[7] .. "s", {
        [1] = "Static legs in air", 
        [2] = "Follow direction", 
        [3] = "Zero pitch on land"
    }), 
    manualaa = v25.misc:combo("" .. v17[1] .. "M" .. v17[2] .. "a" .. v17[3] .. "n" .. v17[4] .. "u" .. v17[5] .. "a" .. v17[6] .. "l" .. v17[7] .. " AA ", {
        [1] = "Disabled", 
        [2] = "Left", 
        [3] = "Right", 
        [4] = "Forward"
    })
};
local v32 = v30.gsLogs:create():color_picker("Mercury.LUA | " .. v17[1] .. "C" .. v17[2] .. "o" .. v17[3] .. "l" .. v17[4] .. "o" .. v17[5] .. "r", color(93, 114, 232, 255));
local v33 = v30.watermark:create():combo("Watermark Type", {
    [1] = "Old Gradient", 
    [2] = "Modern", 
    [3] = "Rainbow"
});
local v34 = v30.watermark:create():color_picker("Left gradient", color(93, 114, 232, 0));
local v35 = v30.watermark:create():color_picker("Right gradient", color(90, 114, 232, 125));
local v36 = v30.watermark:create():color_picker("Outline", color(100, 106, 163, 125));
local v37 = v30.watermark:create():input("Custom Nickname");
local v38 = v31.fastladder:create():selectable("Options", {
    [1] = "Ascending", 
    [2] = "Descending"
});
local v39 = v31.fastladder:create():switch("Ladder custom yaw", false);
local v40 = v31.fastladder:create():slider("Ladder yaw", -180, 180, -180);
local v41 = v30.infopanel:create():color_picker("First main color", color(117, 255, 153, 255));
local v42 = v30.infopanel:create():color_picker("Second main color", color(117, 120, 153, 255));
local v43 = v30.infopanel:create():color_picker("First value color", color(255, 255, 255, 255));
local v44 = v30.infopanel:create():color_picker("Second value color", color(255, 255, 255, 255));
local v45 = v30.infopanel:create():slider("M | Rotation speed", -5, 5, 2, 1, " rs");
local v46 = v30.infopanel:create():slider("V | Rotation speed", -5, 5, 2, 1, " rs");
local v47 = v31.aspectratio:create():slider("Ratio:", 0, 50, 13, 0.1);
local v48 = v31.fakestats:create():slider("Kills", 0, 100, 0, 1);
local v49 = v31.fakestats:create():slider("Assists", 0, 100, 0, 1);
local v50 = v31.fakestats:create():slider("Deaths", 0, 100, 0, 1);
local v51 = v31.fakestats:create():slider("Points", 0, 1000, 0, 1);
local v52 = v31.fakestats:create():slider("MVPs", 0, 1000, 0, 1);
local v53 = v30.tsaa_arrows:color_picker(color(176, 189, 255, 255));
local v54 = v30.scopeoverlay:create():color_picker("Color", color(176, 189, 255, 255));
local v55 = v30.scopeoverlay:create():slider("Position", 0, 500, 109);
local v56 = v30.scopeoverlay:create():slider("Offset", 0, 500, 18);
local v57 = v30.scopeoverlay:create():slider("Fade speed", 3, 20, 12, true, "fr");
local v58 = v30.indicators:create():combo("Indicators Type", {
    [1] = "Old", 
    [2] = "Modern"
});
local v59 = v30.indicators:create():color_picker("First Color", color(210, 189, 255, 255));
local v60 = v30.indicators:create():color_picker("Second Color", color(88, 114, 255, 255));
local v61 = {
    condition = v25.antiaimSettings:combo(v17[1] .. "C" .. v17[2] .. "o" .. v17[3] .. "n" .. v17[4] .. "d" .. v17[5] .. "i" .. v17[6] .. "t" .. v17[7] .. "i" .. v17[8] .. "ons:", v22.p_states)
};
local v62 = v25.antiaimConfigTab:switch("Freestanding", false);
local v63 = v25.antiaimConfigTab:switch("Disable FS on Manual", false);
local v64 = v31.trashtalk:create():combo("Language of TT", {
    [1] = "All", 
    [2] = "Polish", 
    [3] = "English", 
    [4] = "Czech", 
    [5] = "Russian"
});
inside_updateCSA = function(v65, v66)
    -- upvalues: l_ffi_0 (ref), v31 (ref)
    if entity.get_local_player() == nil or l_ffi_0.cast("uintptr_t", v65) == nil then
        return;
    else
        local v67 = entity.get_local_player();
        is_on_ground = bit.band(v67.m_fFlags, bit.lshift(1, 0)) == 1;
        if v31.animBreakers:get("Follow direction") then
            v67.m_flPoseParameter[0] = 1;
        end;
        if v31.animBreakers:get("Zero pitch on land") then
            v67.m_flPoseParameter[0] = 0;
        end;
        hook_function(v65, v66);
        if v31.animBreakers:get("Static legs in air") then
            v67.m_flPoseParameter[6] = 1;
        end;
        if v31.animBreakers:get("Zero pitch on land") then
            local v68 = v67:get_anim_state();
            if not v68 then
                return;
            elseif not is_on_ground or not v68.landing then
                return;
            else
                v67.m_flPoseParameter[12] = 0.5;
            end;
        end;
        return;
    end;
end;
update_hooked_function = function(_)
    -- upvalues: v4 (ref), l_hook_0 (ref)
    local v70 = entity.get_local_player();
    if not v70 or not v70:is_alive() then
        return;
    else
        is_on_ground = bit.band(v70.m_fFlags, bit.lshift(1, 0)) == 1;
        local v71 = v70:get_index();
        local v72 = v4(v71);
        if not v72 or hook_function then
            return;
        else
            hook_function = l_hook_0.new(v72).hook("void(__fastcall*)(void*, void*)", inside_updateCSA, 224);
            return;
        end;
    end;
end;
events.createmove_run:set(update_hooked_function);
local function v73()
    -- upvalues: v23 (ref), v22 (ref)
    if v23[v22.active_i].phase:get() >= 5 then
        return;
    else
        v23[v22.active_i].phase:set(v23[v22.active_i].phase:get() + 1);
        return;
    end;
end;
local function v74()
    -- upvalues: v23 (ref), v22 (ref)
    if v23[v22.active_i].phase:get() <= 1 then
        v23[v22.active_i].phase:set(1);
    else
        v23[v22.active_i].phase:set(v23[v22.active_i].phase:get() - 1);
    end;
end;
for v75 = 1, 6 do
    v23[v75] = {
        yawadd_left = v25.antiaimSettings:slider("Yaw add left\n" .. v22.p_states[v75], -180, 180, 0), 
        yawadd_right = v25.antiaimSettings:slider("Yaw add right\n" .. v22.p_states[v75], -180, 180, 0), 
        yawjitter = v25.antiaimSettings:combo("Yaw jitter\n" .. v22.p_states[v75], {
            [1] = "Disabled", 
            [2] = "Offset", 
            [3] = "Center", 
            [4] = "Random", 
            [5] = "Left&Right Center"
        }), 
        yawjitter_value = v25.antiaimSettings:slider("Yaw jitter value\n" .. v22.p_states[v75], -180, 180, 0), 
        yawjitter_valueleft = v25.antiaimSettings:slider("Yaw jitter left value\n" .. v22.p_states[v75], -180, 180, 0), 
        yawjitter_valueright = v25.antiaimSettings:slider("Yaw jitter right value\n" .. v22.p_states[v75], -180, 180, 0), 
        bodyyaw = v25.antiaimSettings:combo("Body options\n" .. v22.p_states[v75], {
            [1] = "Off", 
            [2] = "Opposite", 
            [3] = "Jitter", 
            [4] = "Static"
        }), 
        fakeyawlimit = v25.antiaimSettings:slider("Fake-yaw limit\n" .. v22.p_states[v75], 0, 60, 60, true, "\194\176"), 
        anti_bf = v25.antiaimSettings:switch("\ae60edbFFAnti-Bruteforce \a0ee6dfFF[JITTER]\n" .. v22.p_states[v75]), 
        phase = v25.antiaimSettings:slider("Phases\n" .. v22.p_states[v75], 0, 5, 5), 
        add_phase = v25.antiaimSettings:button("   Add BF phase   \n" .. v22.p_states[v75], v73), 
        remove_phase = v25.antiaimSettings:button("   Remove BF phase   \n" .. v22.p_states[v75], v74), 
        anti_bf_s1 = v25.antiaimSettings:slider("Anti-BF Phase #1\n" .. v22.p_states[v75], -180, 180, 60), 
        anti_bf_s2 = v25.antiaimSettings:slider("Anti-BF Phase #2\n" .. v22.p_states[v75], -180, 180, 60), 
        anti_bf_s3 = v25.antiaimSettings:slider("Anti-BF Phase #3\n" .. v22.p_states[v75], -180, 180, 60), 
        anti_bf_s4 = v25.antiaimSettings:slider("Anti-BF Phase #4\n" .. v22.p_states[v75], -180, 180, 60), 
        anti_bf_s5 = v25.antiaimSettings:slider("Anti-BF Phase #5\n" .. v22.p_states[v75], -180, 180, 60), 
        dynamic_freestand = v25.antiaimSettings:switch("Dynamic Freestand\n" .. v22.p_states[v75])
    };
end;
local function v77()
    -- upvalues: v22 (ref), v61 (ref), v23 (ref)
    v22.active_i = v22.s_to_int[v61.condition:get()];
    for v76 = 1, 6 do
        v23[v76].yawadd_left:visibility(v22.active_i == v76);
        v23[v76].yawadd_right:visibility(v22.active_i == v76);
        v23[v76].yawjitter:visibility(v22.active_i == v76);
        v23[v76].yawjitter_value:visibility(v22.active_i == v76 and v23[v22.active_i].yawjitter:get() ~= "Left&Right Center");
        v23[v76].yawjitter_valueleft:visibility(v22.active_i == v76 and v23[v22.active_i].yawjitter:get() == "Left&Right Center");
        v23[v76].yawjitter_valueright:visibility(v22.active_i == v76 and v23[v22.active_i].yawjitter:get() == "Left&Right Center");
        v23[v76].bodyyaw:visibility(v22.active_i == v76);
        v23[v76].fakeyawlimit:visibility(v22.active_i == v76);
        v23[v76].anti_bf:visibility(v22.active_i == v76);
        v23[v76].phase:visibility(false);
        v23[v76].add_phase:visibility(v22.active_i == v76 and v23[v22.active_i].anti_bf:get());
        v23[v76].remove_phase:visibility(v22.active_i == v76 and v23[v22.active_i].anti_bf:get());
        v23[v76].anti_bf_s1:visibility(v22.active_i == v76 and v23[v22.active_i].phase:get() >= 1 and v23[v22.active_i].anti_bf:get());
        v23[v76].anti_bf_s2:visibility(v22.active_i == v76 and v23[v22.active_i].phase:get() >= 2 and v23[v22.active_i].anti_bf:get());
        v23[v76].anti_bf_s3:visibility(v22.active_i == v76 and v23[v22.active_i].phase:get() >= 3 and v23[v22.active_i].anti_bf:get());
        v23[v76].anti_bf_s4:visibility(v22.active_i == v76 and v23[v22.active_i].phase:get() >= 4 and v23[v22.active_i].anti_bf:get());
        v23[v76].anti_bf_s5:visibility(v22.active_i == v76 and v23[v22.active_i].phase:get() >= 5 and v23[v22.active_i].anti_bf:get());
        v23[v76].dynamic_freestand:visibility(v22.active_i == v76);
    end;
end;
events.render:set(function()
    -- upvalues: v77 (ref)
    v77();
end);
local function v79(v78)
    -- upvalues: v22 (ref)
    v22.p_state = v78;
end;
local function v80()
    -- upvalues: v22 (ref)
    return v22.p_state;
end;
_G.notifications = (function()
    -- upvalues: v20 (ref), v30 (ref), v19 (ref), v32 (ref)
    v20.register_callback = function(_)
        -- upvalues: v20 (ref), v30 (ref), v19 (ref), v32 (ref)
        if v20.callback_registered then
            return;
        else
            events.render:set(function()
                -- upvalues: v30 (ref), v20 (ref), v19 (ref), v32 (ref)
                if not v30.gsLogs:get() then
                    return;
                else
                    local v82 = 1;
                    local l_cache_0 = v20.cache;
                    for v84 = #l_cache_0, 1, -1 do
                        v20.cache[v84].time = v20.cache[v84].time - globals.frametime;
                        local v85 = 255;
                        local v86 = 0;
                        local v87 = 150;
                        local v88 = 0.5;
                        local v89 = l_cache_0[v84];
                        if v89.time < 0 then
                            table.remove(v20.cache, v84);
                        else
                            local v90 = v89.def_time - v89.time;
                            local v91 = v90 > 1 and 1 or v90;
                            if v89.time < 1 or v91 < 1 then
                                v86 = (v91 < 1 and v91 or v89.time) / 1;
                                i2 = (v91 < 1 and v91 or v89.time) / 1;
                                v85 = v86 * 255;
                                v88 = v86 * 0.5;
                                v87 = v86 * 150;
                                if v86 < 0.2 then
                                    v82 = v82 + 8 * (1 - v86 / 0.2);
                                end;
                            end;
                            local v92 = {
                                math.floor(render.measure_text(1, "", "[Mercury]  " .. v89.draw).x * 1.15)
                            };
                            local l_x_0 = render.measure_text(1, "[Mercury]  ").x;
                            local v94 = {
                                [1] = v19.x / 2 - v92[1] / 2 + 3, 
                                [2] = v19.y - v19.y / 100 * 13.4 + v82
                            };
                            local v95 = v32:get();
                            render.rect(vector(v94[1] - 1, v94[2] - 20), vector(v94[1] - 1 + v92[1] + 2, v94[2] - 20 + 22), color(6, 6, 6, 55));
                            render.circle(vector(v94[1] - 1, v94[2] - 8), color(6, 6, 6, 55), 12, 90, 0.5);
                            render.circle(vector(v94[1] + v92[1] + 1, v94[2] - 8), color(6, 6, 6, 55), 12, -90, 0.5);
                            render.circle_outline(vector(v94[1] - 1, v94[2] - 9), color(v95.r, v95.g, v95.b, v85 > 240 and 240 or v85), 13, 90, v88, 3);
                            render.circle_outline(vector(v94[1] + v92[1] + 1, v94[2] - 9), color(v95.r, v95.g, v95.b, v85 > 240 and 240 or v85), 13, -90, v88, 3);
                            render.rect(vector(v94[1] + v92[1] + 1, v94[2] + 4), vector(v94[1] + 149 - v87, v94[2] + 1), color(v95.r, v95.g, v95.b, v85 > 190 and 190 or v85), 0, true);
                            render.rect(vector(v94[1] + v92[1] + 1, v94[2] + 4), vector(v94[1] + 149 - v87, v94[2] + 3), color(v95.r, v95.g, v95.b, v85 > 190 and 190 or v85), 0, true);
                            render.rect(vector(v94[1] - 1, v94[2] - 22), vector(v94[1] - 149 + v92[1] + v87, v94[2] - 19), color(v95.r, v95.g, v95.b, v85 > 190 and 190 or v85), 0, true);
                            render.rect(vector(v94[1] - 1, v94[2] - 22), vector(v94[1] - 149 + v92[1] + v87, v94[2] - 19), color(v95.r, v95.g, v95.b, v85 > 190 and 190 or v85), 0, true);
                            render.text(1, vector(v94[1] + v92[1] / 2 + l_x_0 / 2, v94[2] - 9), color(255, 255, 255, 255), "c", "\a" .. color(v95.r, v95.g, v95.b, 255):to_hex() .. "[Mercury]  \affffffff" .. v89.draw);
                            v82 = v82 - 33;
                        end;
                    end;
                    v20.callback_registered = true;
                    return;
                end;
            end);
            return;
        end;
    end;
    v20.paint = function(v96, v97, v98)
        -- upvalues: v20 (ref)
        local v99 = tonumber(v97) + 1;
        for v100 = v20.maximum_count, 2, -1 do
            v20.cache[v100] = v20.cache[v100 - 1];
        end;
        v20.cache[1] = {
            time = v99, 
            def_time = v99, 
            draw = v98
        };
        v96:register_callback();
    end;
    return v20;
end)();
v20:paint(4, "Welcome - " .. v0 .. " to Mercury.lua - build: " .. v1);
local v101 = {
    [1] = "generic", 
    [2] = "head", 
    [3] = "chest", 
    [4] = "stomach", 
    [5] = "left arm", 
    [6] = "right arm", 
    [7] = "left leg", 
    [8] = "right leg", 
    [9] = "gear"
};
local v102 = {
    logId = 0
};
local function v104(v103)
    print_raw("\a2475f0[mercury.lua] " .. v103);
end;
events.aim_ack:set(function(v105)
    -- upvalues: v102 (ref), v14 (ref), v31 (ref), v104 (ref), v101 (ref), v20 (ref)
    v102.logId = v102.logId + 1;
    local v106 = v105.target:get_name() or "?";
    if v14(v31.aimbotLogs:get(), "Console") then
        if v105.state == nil and v105.damage ~= -1 then
            v104(string.format("\a4CBB17[%d] \affffffHit %s's %s for %d(%d) (%d remaining) aimed=%s(%s), bt=%d", v102.logId, v106 or nil, v101[v105.hitgroup + 1] or "?", v105.damage or "?", v105.wanted_damage or "?", v105.target.m_iHealth or "?", v101[v105.wanted_hitgroup + 1] or "?", v105.hitchance .. "%" or "?", v105.backtrack or "?"));
        elseif v105.damage == -1 and v105.state == nil then
            v104(string.format("\aFF4433[%d] \affffffMissed %s's %s(%d)(%s) due to %s, bt=%d", v102.logId, v106 or "?", v101[v105.wanted_hitgroup + 1] or "?", v105.wanted_damage or "?", v105.hitchance .. "%" or "?", "death", v105.backtrack or "?"));
        else
            v104(string.format("\aFF4433[%d] \affffffMissed %s's %s(%d)(%s) due to %s, bt=%d", v102.logId, v106 or "?", v101[v105.wanted_hitgroup + 1] or "?", v105.wanted_damage or "?", v105.hitchance .. "%" or "?", v105.state or "?", v105.backtrack or "?"));
        end;
    end;
    if v14(v31.aimbotLogs:get(), "On-Screen") then
        if v105.state == nil and v105.damage ~= -1 then
            v20:paint(4, string.format("\a4CBB17FF[%d] \affffffffHit %s's %s for %d(%d) (%d remaining) aimed=%s(%s), bt=%d", v102.logId, v106 or nil, v101[v105.hitgroup + 1] or "?", v105.damage or "?", v105.wanted_damage or "?", v105.target.m_iHealth or "?", v101[v105.wanted_hitgroup + 1] or "?", v105.hitchance .. "%" or "?", v105.backtrack or "?"));
        elseif v105.damage == -1 and v105.state == nil then
            v20:paint(4, string.format("\aFF4433FF[%d] \affffffffMissed %s's %s(%d)(%s) due to %s, bt=%d", v102.logId, v106 or "?", v101[v105.wanted_hitgroup + 1] or "?", v105.wanted_damage or "?", v105.hitchance .. "%" or "?", "death", v105.backtrack or "?"));
        else
            v20:paint(4, string.format("\aFF4433FF[%d] \affffffffMissed %s's %s(%d)(%s) due to %s, bt=%d", v102.logId, v106 or "?", v101[v105.wanted_hitgroup + 1] or "?", v105.wanted_damage or "?", v105.hitchance .. "%" or "?", v105.state or "?", v105.backtrack or "?"));
        end;
    end;
end);
events.bullet_impact:set(function(v107)
    -- upvalues: v23 (ref), v22 (ref), v21 (ref), v20 (ref)
    local v108 = entity.get_local_player();
    if not v108:is_alive() then
        return;
    elseif not v23[v22.p_state].anti_bf:get() then
        return;
    else
        local v109 = entity.get(v107.userid, true);
        if not v109:is_enemy() or v109:is_dormant() then
            return;
        else
            local v110, v111, _ = v108:get_hitbox_position(0):unpack();
            local _, _, _ = v108.m_vecOrigin:unpack();
            local v116, v117, _ = v109.m_vecOrigin:unpack();
            local v119 = ((v107.y - v117) * v110 - (v107.x - v116) * v111 + v107.x * v117 - v107.y * v116) / math.sqrt((v107.y - v117) ^ 2 + (v107.x - v116) ^ 2);
            if math.abs(v119) <= 35 and globals.curtime - v21.lastbrute > 0.5 then
                v21.lastbrute = globals.curtime;
                if v21.brutestate >= v23[v22.p_state].phase:get() then
                    v21.brutestate = 0;
                else
                    v21.brutestate = v21.brutestate + 1;
                end;
                v20:paint(4, "Switched anti-brute due to enemy shot at you");
            end;
            return;
        end;
    end;
end);
local v120 = {
    [1] = "stare powiedzenie mowi, ze trening czyni mistrza. Ty grasz 20h dziennie i dalej jestes chvjowy.", 
    [2] = "bym cie kurwa zabil, przysiegam", 
    [3] = "zostales stapowany bo nie masz mercury.lua", 
    [4] = "wez ty kurw0 kup mercury, hs", 
    [5] = "bez problemu tapik ez", 
    [6] = "juz boty na mirage sa lepszym przeciwnikiem, hs 1", 
    [7] = "wiesz, ze nic nie wiesz i dostajesz hs", 
    [8] = "mozesz mi wylizac stopy", 
    [9] = "jestes takim gownem ze ja pierd00le", 
    [10] = "MICHAEL BAGIETKA CIE ROOOCHA W DUPE"
};
local v121 = {
    [1] = "to si zabil brooo XDDDDDDd", 
    [2] = "\208\157\208\176 \208\189\208\176\209\133\209\131\208\185 \209\130\208\176\208\191\208\189\209\131\209\130 \208\180\208\190\208\187\208\177\208\176\208\181\208\177", 
    [3] = "\208\157\208\184\209\133\209\131\208\181\208\178\208\190 \209\130\209\131\208\176\208\187\208\181\209\130 \208\191\208\190\208\188\209\139\208\187\208\176 \209\136\208\187\209\142\209\133\208\176", 
    [4] = "\208\158\208\185 \208\177\208\187\209\143 \208\191\208\190\209\136\208\181\208\187 \208\189\208\176\209\133\209\131\208\185 \208\189\208\181 \208\184\208\179\209\128\208\190\208\186 \208\181\208\177\208\176\208\189\209\139\208\185", 
    [5] = "\208\158\208\185 \209\129\208\190\209\128\209\128\208\184 \208\189\208\181 \209\131\208\178\208\184\208\180\208\181\208\187 \208\186\208\187\208\190\208\191\208\176", 
    [6] = "\208\189\208\184\209\133\209\131\209\143 \209\130\209\139 \209\130\209\131\208\191\208\190\208\185 \208\181\208\177\208\176\209\130\209\140 \209\143 \209\130\209\143 \209\133\209\129\208\189\209\131\208\187", 
    [7] = "\208\158\208\153 \208\147\208\155\208\152\208\161\208\162\208\144 \208\162\208\171 \208\154\208\163\208\148\208\144 \208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144", 
    [8] = "\208\184\208\183\208\184 \208\180\208\190\208\187\208\177\208\176\208\181\208\177", 
    [9] = "\208\176\209\133\208\176\209\133\208\176 \208\181\208\177\208\176\209\130\209\140 \209\130\209\139 \209\133\209\131\208\181\208\178\209\139\208\185", 
    [10] = "\209\129\208\186\208\176\208\182\208\184 \209\135\209\130\208\190 \208\191\208\190\208\178\208\181\208\183\208\187\208\190", 
    [11] = "\209\133\209\131\208\181\208\178\208\190 \208\184\208\179\209\128\208\176\208\181\209\136\209\140", 
    [12] = "\208\189\208\176\209\131\209\135\208\184\209\130\209\140\209\129\209\143 \208\184\208\179\209\128\208\176\209\130\209\140", 
    [13] = "for u? this hs. for me? this ones.", 
    [14] = "Good luck today! I know you\226\128\153ll do great.", 
    [15] = "\208\158\208\191\208\176 \208\191\208\184\208\180\208\176\209\128\208\176\209\129 \208\178\208\176\208\189\209\130\208\176\208\191 \208\189\208\176\209\133\209\131\208\185", 
    [16] = "\208\145\208\187\209\143 \209\143 \208\186\208\176\208\186 \208\188\208\190\209\128\209\130\208\184\209\129 \208\181\208\177\208\176\208\189\209\131\208\187 \209\130\208\181\208\177\209\143 \208\186\208\176\208\186 \208\180\208\184\208\189\208\190\208\188\208\176\208\185\208\186\208\176", 
    [17] = "bym cie kurwa zabil, przysiegam", 
    [18] = "\240\157\150\142\240\157\150\139 \240\157\150\158\240\157\150\148\240\157\150\154 \240\157\150\156\240\157\150\134\240\157\150\147\240\157\150\153 \240\157\150\154\240\157\150\147\240\157\150\141\240\157\150\142\240\157\150\153\240\157\150\153\240\157\150\134\240\157\150\135\240\157\150\145\240\157\150\138 \240\157\150\134\240\157\150\134 \240\157\150\143\240\157\150\154\240\157\150\152\240\157\150\153 \240\157\150\145\240\157\150\142\240\157\150\144\240\157\150\138 \240\157\150\146\240\157\150\138 \240\157\150\140\240\157\150\148 \240\157\150\135\240\157\150\154\240\157\150\158 \240\157\150\146\240\157\150\138\240\157\150\151\240\157\150\136\240\157\150\154\240\157\150\151\240\157\150\158.\240\157\150\145\240\157\150\154\240\157\150\134", 
    [19] = "\239\189\151\239\189\133\239\189\129\239\189\139 \239\189\130\239\189\143\239\189\148 \239\189\146\239\189\129\239\189\144\239\189\133\239\189\132", 
    [20] = "\240\157\145\187\240\157\145\168\240\157\145\178\240\157\145\172 \240\157\145\187\240\157\145\175\240\157\145\176\240\157\145\186 \"1\" \240\157\145\168\240\157\145\181\240\157\145\171 \240\157\145\169\240\157\145\168\240\157\145\181 \240\157\145\173\240\157\145\185\240\157\145\182\240\157\145\180 \240\157\145\175\240\157\145\172\240\157\145\168\240\157\145\189\240\157\145\172\240\157\145\181", 
    [21] = "Sending major good vibes your way.", 
    [22] = "I know this won\226\128\153t be easy, but I also know you\226\128\153ve got what it takes to get through it.", 
    [23] = "This is tough, but you\226\128\153re tougher.", 
    [24] = "\240\157\147\182\240\157\147\174\240\157\147\187\240\157\147\172\240\157\147\190\240\157\147\187\240\157\148\130 \240\157\147\170\240\157\147\183\240\157\147\189\240\157\147\178 \240\157\147\170\240\157\147\178\240\157\147\182 \240\157\147\188\240\157\147\184\240\157\147\175\240\157\147\189\240\157\148\128\240\157\147\170\240\157\147\187\240\157\147\174\240\157\147\188 \240\157\147\173\240\157\147\184\240\157\147\182\240\157\147\178\240\157\147\183\240\157\147\170\240\157\147\189\240\157\147\174 \240\157\147\170\240\157\147\181\240\157\147\181", 
    [25] = "stay calm and enjoy the \226\156\150 1 \226\157\164", 
    [26] = "Sending you good thoughts\226\128\148and hoping you believe in yourself just as much as I believe in you.", 
    [27] = "Hope you\226\128\153re doing awesome!", 
    [28] = "zostales stapowany bo nie masz mercury.lua", 
    [29] = "ja > ty lol", 
    [30] = "\197\189il si stejn\196\155 jako tv\197\175j otec, kr\195\161tce", 
    [31] = "wez ty kurw0 kup mercury, hs", 
    [32] = "bez problemu tapik ez", 
    [33] = "I believe in you! And unicorns. But mostly you!", 
    [34] = "juz boty na mirage sa lepszym przeciwnikiem, hs 1", 
    [35] = "ez baimik randomie ft. mercury.lua", 
    [36] = "\239\189\130\239\189\143\239\189\148 \239\189\142\239\189\133\239\189\133\239\189\132 \239\189\136\239\189\150\239\189\136 \239\189\140\239\189\133\239\189\147\239\189\147\239\189\143\239\189\142\239\189\147", 
    [37] = "\240\157\149\128\240\157\148\189 \240\157\149\128 \240\157\149\134\226\132\153\240\157\148\188\226\132\149 \240\157\149\138\226\132\153\240\157\149\128\226\132\149\240\157\148\185\240\157\149\134\240\157\149\139 \240\157\148\184\240\157\149\131\240\157\149\131 \240\157\148\187\240\157\149\134\240\157\148\190\240\157\149\138 \240\157\148\187\240\157\149\128\240\157\148\188", 
    [38] = "Snad sis nemyslel \197\190e m\196\155 zabije\197\161 lol", 
    [39] = "\240\157\144\178\240\157\144\168\240\157\144\174 \240\157\144\154\240\157\144\171\240\157\144\158 \240\157\144\154 \240\157\144\176\240\157\144\158\240\157\144\154\240\157\144\164 \240\157\144\157\240\157\144\168\240\157\144\160 \240\157\144\154\240\157\144\167\240\157\144\157 \240\157\144\178\240\157\144\168\240\157\144\174\240\157\144\171 \240\157\144\159\240\157\144\171\240\157\144\162\240\157\144\158\240\157\144\167\240\157\144\157\240\157\144\172 \240\157\144\176\240\157\144\162\240\157\144\165\240\157\144\165 \240\157\144\155\240\157\144\158 \240\157\144\164\240\157\144\162\240\157\144\165\240\157\144\165\240\157\144\158\240\157\144\157 \240\157\144\162\240\157\144\167 \240\157\144\173\240\157\144\161\240\157\144\162\240\157\144\172 \240\157\144\175\240\157\144\162\240\157\144\157\240\157\144\158\240\157\144\168", 
    [40] = "Jetzt bin ich - Stewie2k (\226\151\163\226\151\162)", 
    [41] = "nie masz podjazdu nn", 
    [42] = "ez baim kill so ez"
};
local v122 = {
    [1] = "a m\195\161\197\161 to ty zkurvysyne", 
    [2] = "\197\189\195\173l si stejn\196\155 jako tv\197\175j otec, kr\195\161tce", 
    [3] = "Za 1 ty kokote", 
    [4] = "Snad si nemyslel \197\190e m\196\155 zabije\197\161 lol", 
    [5] = "umrels lolooll", 
    [6] = "owned by top1 czech", 
    [7] = "Ch\195\173pls mrdko", 
    [8] = "Snad sis nemyslel \197\190e m\196\155 zabije\197\161 lol :DDDD", 
    [9] = "je\197\190\195\173\197\161\195\173 ty si tak pomalej xddd", 
    [10] = "$$ ZEMREL SI VELICE RYCHLE $$", 
    [11] = "ja > ty lol", 
    [12] = "chc\195\173pl si tak rychle jak tv\197\175j fotr mrdko", 
    [13] = "to si zabil broo XDDDDddd", 
    [14] = "hs blbecku"
};
local v123 = {
    [1] = "for u? this hs. for me? this ones.", 
    [2] = "Good luck today! I know you\226\128\153ll do great.", 
    [3] = "\208\184\208\183\208\184 \208\180\208\190\208\187\208\177\208\176\208\181\208\177", 
    [4] = "\208\176\209\133\208\176\209\133\208\176 \208\181\208\177\208\176\209\130\209\140 \209\130\209\139 \209\133\209\131\208\181\208\178\209\139\208\185", 
    [5] = "\209\129\208\186\208\176\208\182\208\184 \209\135\209\130\208\190 \208\191\208\190\208\178\208\181\208\183\208\187\208\190", 
    [6] = "\209\133\209\131\208\181\208\178\208\190 \208\184\208\179\209\128\208\176\208\181\209\136\209\140", 
    [7] = "\208\189\208\176\209\131\209\135\208\184\209\130\209\140\209\129\209\143 \208\184\208\179\209\128\208\176\209\130\209\140", 
    [8] = "\240\157\149\159\240\157\149\160 \240\157\149\149\240\157\149\146\240\157\149\165\240\157\149\146\240\157\149\147\240\157\149\146\240\157\149\164\240\157\149\150 \240\157\149\168\240\157\149\154\240\157\149\157\240\157\149\157 \240\157\149\164\240\157\149\146\240\157\149\167\240\157\149\150 \240\157\149\170\240\157\149\160\240\157\149\166 \240\157\149\151\240\157\149\163\240\157\149\160\240\157\149\158 \240\157\149\165\240\157\149\153\240\157\149\150\240\157\149\164\240\157\149\150 \240\157\149\153\240\157\149\164", 
    [9] = "\240\157\150\146\240\157\150\158 \240\157\150\151\240\157\150\138\240\157\150\152\240\157\150\148\240\157\150\145\240\157\150\155\240\157\150\138\240\157\150\151 \240\157\150\145\240\157\150\148\240\157\150\155\240\157\150\138\240\157\150\152 \240\157\150\153\240\157\150\134\240\157\150\149\240\157\150\149\240\157\150\142\240\157\150\147\240\157\150\140 \240\157\150\147\240\157\150\148 \240\157\150\147\240\157\150\134\240\157\150\146\240\157\150\138\240\157\150\152", 
    [10] = "\240\157\149\158\240\157\149\146\240\157\149\170 \240\157\149\152\240\157\149\160\240\157\149\149 \240\157\149\151\240\157\149\160\240\157\149\163\240\157\149\152\240\157\149\154\240\157\149\167\240\157\149\150 \240\157\149\170\240\157\149\160\240\157\149\166 \240\157\149\147\240\157\149\166\240\157\149\165 \240\157\149\152\240\157\149\146\240\157\149\158\240\157\149\150\240\157\149\164\240\157\149\150\240\157\149\159\240\157\149\164\240\157\149\150 \240\157\149\163\240\157\149\150\240\157\149\164\240\157\149\160\240\157\149\157\240\157\149\167\240\157\149\150\240\157\149\163 \240\157\149\168\240\157\149\160\240\157\149\159\240\157\149\165", 
    [11] = "\240\157\148\177\240\157\148\165\240\157\148\166\240\157\148\176 \240\157\148\161\240\157\148\172\240\157\148\164\240\157\148\176 \240\157\148\161\240\157\148\162\240\157\148\160\240\157\148\166\240\157\148\161\240\157\148\162 \240\157\148\177\240\157\148\172 \240\157\148\160\240\157\148\172\240\157\148\170\240\157\148\162 \240\157\148\170\240\157\148\182 \240\157\148\173\240\157\148\166\240\157\148\171\240\157\148\164 \240\157\148\158\240\157\148\171\240\157\148\161 \240\157\148\161\240\157\148\166\240\157\148\162 \240\157\148\173\240\157\148\158\240\157\148\166\240\157\148\171\240\157\148\163\240\157\148\178\240\157\148\169", 
    [12] = "\240\157\149\128\240\157\148\189 \240\157\149\128 \240\157\149\134\226\132\153\240\157\148\188\226\132\149 \240\157\149\138\226\132\153\240\157\149\128\226\132\149\240\157\148\185\240\157\149\134\240\157\149\139 \240\157\148\184\240\157\149\131\240\157\149\131 \240\157\148\187\240\157\149\134\240\157\148\190\240\157\149\138 \240\157\148\187\240\157\149\128\240\157\148\188", 
    [13] = "\240\157\148\151\240\157\148\172 \240\157\148\158\240\157\148\169\240\157\148\169 \240\157\148\161\240\157\148\172\240\157\148\164\240\157\148\176 \240\157\148\160\240\157\148\172\240\157\148\173\240\157\148\182\240\157\148\166\240\157\148\171\240\157\148\164 \240\157\148\170\240\157\148\162 \240\157\148\176\240\157\148\177\240\157\148\172\240\157\148\173 \240\157\148\160\240\157\148\172\240\157\148\173\240\157\148\182\240\157\148\166\240\157\148\171\240\157\148\164 \240\157\148\170\240\157\148\162", 
    [14] = "\240\157\146\180\240\157\145\156\240\157\147\138\240\157\147\135 \240\157\145\148\240\157\146\182\240\157\147\131\240\157\145\148 \240\157\146\190\240\157\147\136 \240\157\146\182\240\157\147\129\240\157\147\129 \240\157\147\128\240\157\146\190\240\157\147\129\240\157\147\129\240\157\145\146\240\157\146\185 \240\157\146\183\240\157\147\142 \240\157\146\165\240\157\146\174 \240\157\145\133\240\157\144\184\240\157\146\174\240\157\146\170\240\157\144\191\240\157\146\177\240\157\144\184\240\157\145\133", 
    [15] = "\240\157\149\168\240\157\149\146\240\157\149\167\240\157\149\150\240\157\149\164, \240\157\149\170\240\157\149\160\240\157\149\166 \240\157\149\168\240\157\149\154\240\157\149\157\240\157\149\157 \240\157\149\159\240\157\149\160\240\157\149\165 \240\157\149\157\240\157\149\154\240\157\149\167\240\157\149\150 \240\157\149\151\240\157\149\160\240\157\149\163 \240\157\149\170\240\157\149\160\240\157\149\166\240\157\149\163 \240\157\159\153\240\157\159\156\240\157\149\165\240\157\149\153 \240\157\149\147\240\157\149\154\240\157\149\163\240\157\149\165\240\157\149\153\240\157\149\149\240\157\149\146\240\157\149\170", 
    [16] = "\240\157\149\166 \240\157\149\158\240\157\149\160\240\157\149\165\240\157\149\153\240\157\149\150\240\157\149\163 \240\157\149\153\240\157\149\146\240\157\149\164 \240\157\149\166\240\157\149\154\240\157\149\149 \240\157\149\128\240\157\149\164\240\157\149\164\240\157\149\166\240\157\149\150 \240\157\149\149\240\157\149\160\240\157\149\152, \240\157\148\190\240\157\149\160 \240\157\159\153 \240\157\149\167\240\157\149\164 \240\157\159\153 \240\157\149\132\240\157\149\170 \240\157\149\164\240\157\149\165\240\157\149\146\240\157\149\148\240\157\149\156 ?", 
    [17] = "\226\132\149\240\157\149\134\226\132\157\240\157\149\139\226\132\141 \240\157\148\184\240\157\149\132\240\157\148\188\226\132\157\240\157\149\128\226\132\130\240\157\148\184 \240\157\149\138\240\157\149\131\240\157\148\184\240\157\149\141\240\157\148\188 \240\157\149\138\240\157\148\188\226\132\149\240\157\149\139 \240\157\148\185\240\157\148\184\226\132\130\240\157\149\130 \240\157\149\139\240\157\149\134 \226\132\149\240\157\148\184 \240\157\148\185\240\157\149\144 \240\157\148\188\240\157\149\140 \240\157\149\134\240\157\149\141\240\157\148\188\226\132\157\240\157\149\131\240\157\149\134\226\132\157\240\157\148\187 \226\132\157\226\132\154", 
    [18] = "\240\157\148\187\240\157\149\160\240\157\149\159\226\128\153\240\157\149\165 \240\157\149\161\240\157\149\157\240\157\149\146\240\157\149\170 \240\157\149\147\240\157\149\146\240\157\149\159\240\157\149\156 \240\157\149\167\240\157\149\164 \240\157\149\158\240\157\149\150, \240\157\149\154\240\157\149\158 \240\157\149\157\240\157\149\154\240\157\149\167\240\157\149\150 \240\157\149\165\240\157\149\153\240\157\149\150\240\157\149\163\240\157\149\150.", 
    [19] = "Talent wins games, but teamwork and intelligence win championships.", 
    [20] = "Teamwork begins by building trust. And the only way to do that is to overcome our need for invulnerability.", 
    [21] = "It is literally true that you can succeed best and quickest by helping others to succeed.", 
    [22] = "If everyone is moving forward together, then success takes care of itself.", 
    [23] = "It is literally true that you can succeed best and quickest by helping others to succeed.", 
    [24] = "The whole is other than the sum of the parts.", 
    [25] = "The ratio of We\226\128\153s to I\226\128\153s is the best indicator of the development of a team.", 
    [26] = "Individually, we are one drop. Together, we are an ocean.", 
    [27] = "Dirty secrets.", 
    [28] = "\240\157\150\142\240\157\150\139 \240\157\150\158\240\157\150\148\240\157\150\154 \240\157\150\156\240\157\150\134\240\157\150\147\240\157\150\153 \240\157\150\154\240\157\150\147\240\157\150\141\240\157\150\142\240\157\150\153\240\157\150\153\240\157\150\134\240\157\150\135\240\157\150\145\240\157\150\138 \240\157\150\134\240\157\150\134 \240\157\150\143\240\157\150\154\240\157\150\152\240\157\150\153 \240\157\150\145\240\157\150\142\240\157\150\144\240\157\150\138 \240\157\150\146\240\157\150\138 \240\157\150\140\240\157\150\148 \240\157\150\135\240\157\150\154\240\157\150\158 \240\157\150\146\240\157\150\138\240\157\150\151\240\157\150\136\240\157\150\154\240\157\150\151\240\157\150\158.\240\157\150\145\240\157\150\154\240\157\150\134", 
    [29] = "\239\189\151\239\189\133\239\189\129\239\189\139 \239\189\130\239\189\143\239\189\148 \239\189\146\239\189\129\239\189\144\239\189\133\239\189\132", 
    [30] = "\240\157\145\187\240\157\145\168\240\157\145\178\240\157\145\172 \240\157\145\187\240\157\145\175\240\157\145\176\240\157\145\186 \"1\" \240\157\145\168\240\157\145\181\240\157\145\171 \240\157\145\169\240\157\145\168\240\157\145\181 \240\157\145\173\240\157\145\185\240\157\145\182\240\157\145\180 \240\157\145\175\240\157\145\172\240\157\145\168\240\157\145\189\240\157\145\172\240\157\145\181", 
    [31] = "Sending major good vibes your way.", 
    [32] = "I know this won\226\128\153t be easy, but I also know you\226\128\153ve got what it takes to get through it.", 
    [33] = "This is tough, but you\226\128\153re tougher.", 
    [34] = "\240\157\147\182\240\157\147\174\240\157\147\187\240\157\147\172\240\157\147\190\240\157\147\187\240\157\148\130 \240\157\147\170\240\157\147\183\240\157\147\189\240\157\147\178 \240\157\147\170\240\157\147\178\240\157\147\182 \240\157\147\188\240\157\147\184\240\157\147\175\240\157\147\189\240\157\148\128\240\157\147\170\240\157\147\187\240\157\147\174\240\157\147\188 \240\157\147\173\240\157\147\184\240\157\147\182\240\157\147\178\240\157\147\183\240\157\147\170\240\157\147\189\240\157\147\174 \240\157\147\170\240\157\147\181\240\157\147\181", 
    [35] = "stay calm and enjoy the \226\156\150 1 \226\157\164", 
    [36] = "Sending you good thoughts\226\128\148and hoping you believe in yourself just as much as I believe in you.", 
    [37] = "Hope you\226\128\153re doing awesome!"
};
local v124 = {
    [1] = "\208\157\208\176 \208\189\208\176\209\133\209\131\208\185 \209\130\208\176\208\191\208\189\209\131\209\130 \208\180\208\190\208\187\208\177\208\176\208\181\208\177", 
    [2] = "\208\157\208\184\209\133\209\131\208\181\208\178\208\190 \209\130\209\131\208\176\208\187\208\181\209\130 \208\191\208\190\208\188\209\139\208\187\208\176 \209\136\208\187\209\142\209\133\208\176", 
    [3] = "\208\158\208\191\208\176 \208\191\208\184\208\180\208\176\209\128\208\176\209\129 \208\178\208\176\208\189\209\130\208\176\208\191 \208\189\208\176\209\133\209\131\208\185", 
    [4] = "\208\145\208\187\209\143 \209\143 \208\186\208\176\208\186 \208\188\208\190\209\128\209\130\208\184\209\129 \208\181\208\177\208\176\208\189\209\131\208\187 \209\130\208\181\208\177\209\143 \208\186\208\176\208\186 \208\180\208\184\208\189\208\190\208\188\208\176\208\185\208\186\208\176", 
    [5] = "\208\158\208\185 \208\177\208\187\209\143 \208\191\208\190\209\136\208\181\208\187 \208\189\208\176\209\133\209\131\208\185 \208\189\208\181 \208\184\208\179\209\128\208\190\208\186 \208\181\208\177\208\176\208\189\209\139\208\185", 
    [6] = "\208\158\208\185 \209\129\208\190\209\128\209\128\208\184 \208\189\208\181 \209\131\208\178\208\184\208\180\208\181\208\187 \208\186\208\187\208\190\208\191\208\176", 
    [7] = "\208\189\208\184\209\133\209\131\209\143 \209\130\209\139 \209\130\209\131\208\191\208\190\208\185 \208\181\208\177\208\176\209\130\209\140 \209\143 \209\130\209\143 \209\133\209\129\208\189\209\131\208\187", 
    [8] = "\208\158\208\153 \208\147\208\155\208\152\208\161\208\162\208\144 \208\162\208\171 \208\154\208\163\208\148\208\144 \208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144", 
    [9] = "\208\184\208\183\208\184 \208\180\208\190\208\187\208\177\208\176\208\181\208\177", 
    [10] = "\208\176\209\133\208\176\209\133\208\176 \208\181\208\177\208\176\209\130\209\140 \209\130\209\139 \209\133\209\131\208\181\208\178\209\139\208\185", 
    [11] = "\209\129\208\186\208\176\208\182\208\184 \209\135\209\130\208\190 \208\191\208\190\208\178\208\181\208\183\208\187\208\190", 
    [12] = "\209\133\209\131\208\181\208\178\208\190 \208\184\208\179\209\128\208\176\208\181\209\136\209\140", 
    [13] = "\208\189\208\176\209\131\209\135\208\184\209\130\209\140\209\129\209\143 \208\184\208\179\209\128\208\176\209\130\209\140"
};
events.player_death:set(function(v125)
    -- upvalues: v20 (ref), v21 (ref), v31 (ref), v64 (ref), v123 (ref), v120 (ref), v121 (ref), v122 (ref), v124 (ref)
    if entity.get(v125.userid, true) == entity.get_local_player() then
        v20:paint(5, "Anti-bruteforce data got reset due to player death.");
        v21.brutestate = 0;
    end;
    if v31.trashtalk:get() then
        if v125.attacker == nil then
            return;
        elseif entity.get_local_player() == entity.get(v125.attacker, true) then
            utils.console_exec(v64:get() == "English" and "say " .. v123[math.random(1, #v123)] or v64:get() == "Polish" and "say " .. v120[math.random(1, #v120)] or v64:get() == "All" and "say " .. v121[math.random(1, #v121)] or v64:get() == "Czech" and "say " .. v122[math.random(1, #v122)] or v64:get() == "Russian" and "say " .. v124[math.random(1, #v124)]);
        end;
    end;
end);
events.round_start:set(function(_)
    -- upvalues: v20 (ref), v21 (ref)
    v20:paint(5, "Anti-bruteforce data got reset due to new round.");
    v21.brutestate = 0;
end);
local v127 = false;
events.createmove:set(function(v128)
    -- upvalues: v24 (ref), v31 (ref), v39 (ref), v40 (ref), v14 (ref), v38 (ref), v79 (ref), v22 (ref), v23 (ref), v21 (ref), v62 (ref), v63 (ref), v127 (ref)
    local v129 = entity.get_local_player();
    local v130 = v129.m_vecVelocity:length2d() < 5;
    local v131 = v24.slowwalk:get();
    local _ = v24.hs:get();
    local _ = v24.fd:get();
    local _ = v24.dt:get();
    if v129.m_MoveType == 9 and v31.fastladder:get() then
        v128.view_angles.y = math.floor(v128.view_angles.y + 0.5);
        v128.view_angles.z = 0;
        if v39:get() and v128.forwardmove == 0 then
            v128.view_angles.x = 89;
            v128.view_angles.y = v128.view_angles.y + v40:get();
            if math.abs(v40:get()) > 0 and math.abs(v40:get()) < 180 and v128.sidemove ~= 0 then
                v128.view_angles.y = v128.view_angles.y - v40:get();
            end;
            if math.abs(v40:get()) == 180 then
                if v128.sidemove < 0 then
                    v128.in_moveleft = 0;
                    v128.in_moveright = 1;
                end;
                if v128.sidemove > 0 then
                    v128.in_moveleft = 1;
                    v128.in_moveright = 0;
                end;
            end;
        end;
        if v14(v38:get(), "Ascending") and v128.forwardmove > 0 and v128.view_angles.x < 45 then
            v128.view_angles.x = 89;
            v128.in_moveright = 1;
            v128.in_moveleft = 0;
            v128.in_forward = 0;
            v128.in_back = 1;
            if v128.sidemove == 0 then
                v128.view_angles.y = v128.view_angles.y + 90;
            elseif v128.sidemove < 0 then
                v128.view_angles.y = v128.view_angles.y + 150;
            elseif v128.sidemove > 0 then
                v128.view_angles.y = v128.view_angles.y + 30;
            end;
        end;
        if v14(v38:get(), "Descending") and v128.forwardmove < 0 then
            v128.view_angles.x = 89;
            v128.in_moveleft = 1;
            v128.in_moveright = 0;
            v128.in_forward = 1;
            v128.in_back = 0;
            if v128.sidemove == 0 then
                v128.view_angles.y = v128.view_angles.y + 90;
            elseif v128.sidemove > 0 then
                v128.view_angles.y = v128.view_angles.y + 150;
            elseif v128.sidemove < 0 then
                v128.view_angles.y = v128.view_angles.y + 30;
            end;
        end;
    end;
    local v135 = bit.band(v129.m_fFlags, 1) == 1 and not v128.in_jump;
    if not v129:is_alive() then
        return;
    else
        if v128.in_duck and v135 then
            v79(5);
        elseif v128.in_duck and not v135 then
            v79(6);
        elseif not v135 then
            v79(4);
        elseif v131 then
            v79(3);
        elseif v130 then
            v79(1);
        elseif not v130 then
            v79(2);
        end;
        local v136 = v129.m_flPoseParameter[11] * 120 - 60 > 0 and 1 or -1;
        v24.aa_switch:set(true);
        if v31.manualaa:get() == "Disabled" then
            v24.aa_yaw:set("Backward");
            v24.aa_yawbase:set("At Target");
            v22.manual = 0;
        elseif v31.manualaa:get() == "Right" then
            v24.aa_yaw:set("Backward");
            v24.aa_yawbase:set("Local View");
            v24.aa_yawoffset:set(90);
            v22.manual = 2;
        elseif v31.manualaa:get() == "Left" then
            v24.aa_yaw:set("Backward");
            v24.aa_yawbase:set("Local View");
            v24.aa_yawoffset:set(-90);
            v22.manual = 1;
        elseif v31.manualaa:get() == "Forward" then
            v24.aa_yaw:set("Backward");
            v24.aa_yawbase:set("Local View");
            v24.aa_yawoffset:set(180);
            v22.manual = 3;
        end;
        v24.aa_pitch:set("Down");
        v24.aa_yawmodifier:set(v23[v22.p_state].yawjitter:get() == "Left&Right Center" and "Center" or v23[v22.p_state].yawjitter:get());
        local v137 = v23[v22.p_state].yawjitter_value:get();
        if v23[v22.p_state].yawjitter:get() == "Left&Right Center" then
            local v138 = v23[v22.p_state].yawjitter_valueleft:get();
            local v139 = v23[v22.p_state].yawjitter_valueright:get();
            v137 = v136 == -1 and v138 or v136 == 1 and v139;
        end;
        if v23[v22.p_state].anti_bf:get() and v23[v22.p_state].phase:get() >= 1 then
            if v21.brutestate == 1 and v23[v22.p_state].phase:get() >= 1 then
                v21.activestate = 1;
                v137 = v23[v22.p_state].anti_bf_s1:get();
            elseif v21.brutestate == 2 and v23[v22.p_state].phase:get() >= 2 then
                v21.activestate = 2;
                v137 = v23[v22.p_state].anti_bf_s2:get();
            elseif v21.brutestate == 3 and v23[v22.p_state].phase:get() >= 3 then
                v21.activestate = 3;
                v137 = v23[v22.p_state].anti_bf_s3:get();
            elseif v21.brutestate == 4 and v23[v22.p_state].phase:get() >= 4 then
                v21.activestate = 4;
                v137 = v23[v22.p_state].anti_bf_s4:get();
            elseif v21.brutestate == 5 and v23[v22.p_state].phase:get() >= 5 then
                v21.activestate = 5;
                v137 = v23[v22.p_state].anti_bf_s5:get();
            else
                v21.activestate = 0;
            end;
        end;
        v24.aa_bodyyawleft:override(v23[v22.p_state].fakeyawlimit:get());
        v24.aa_bodyyawright:override(v23[v22.p_state].fakeyawlimit:get());
        if v23[v22.p_state].bodyyaw:get() == "Jitter" then
            v24.aa_bodyyaw:override(true);
            v24.aa_bodyyawoptions:override("Jitter");
        elseif v23[v22.p_state].bodyyaw:get() == "Opposite" then
            v24.aa_bodyyaw:override(true);
            v24.aa_bodyyawoptions:override("Jitter");
        elseif v23[v22.p_state].bodyyaw:get() == "Static" then
            v24.aa_bodyyaw:override(true);
            v24.aa_bodyyawoptions:override({});
        elseif v23[v22.p_state].bodyyaw:get() == "Off" then
            v24.aa_bodyyaw:override(false);
            v24.aa_bodyyawoptions:override({});
        end;
        if v137 > 0 then
            v137 = -v137;
        end;
        v24.aa_yawmodifieroffset:override(v137);
        if v128.choked_commands == 0 and v22.manual == 0 then
            v24.aa_yawoffset:override(v136 == 1 and v23[v22.p_state].yawadd_left:get() or v23[v22.p_state].yawadd_right:get());
        end;
        if v62:get() then
            if v63:get() and v22.manual ~= 0 then
                v24.freestanding:set(false);
            else
                v24.freestanding:set(true);
            end;
        else
            v24.freestanding:set(false);
        end;
        if v31.jumpscoutfix:get() then
            if v129:get_player_weapon() == nil then
                return;
            elseif v129:get_player_weapon():get_classid() == 267 then
                v127 = false;
                local v140 = v129.m_vecVelocity:length2d();
                v24.airstrafe:set(not v128.in_jump or v140 >= 15);
            elseif not v127 then
                v24.airstrafe:set(true);
                v127 = true;
            end;
        end;
        return;
    end;
end);
local function v146(v141, v142, v143)
    -- upvalues: v22 (ref)
    local v144, v145 = v141:unpack();
    render.poly(v22.manual == 2 and v142 or color(35, 35, 35, 150), vector(v144 + 55, v145 + 2), vector(v144 + 42, v145 - 7), vector(v144 + 42, v145 + 11));
    render.poly(v22.manual == 1 and v142 or color(35, 35, 35, 150), vector(v144 - 55, v145 + 2), vector(v144 - 42, v145 - 7), vector(v144 - 42, v145 + 11));
    if v22.manual == 3 then
        render.poly(v22.manual == 3 and v142, vector(v144, v145 - 40), vector(v144 + 10, v145 - 26), vector(v144 - 10, v145 - 26));
    end;
    render.rect(vector(v144 + 38, v145 - 7), vector(v144 + 40, v145 + 11), v143 < -10 and v142 or color(35, 35, 35, 150));
    render.rect(vector(v144 - 40, v145 - 7), vector(v144 - 38, v145 + 11), v143 > -10 and v142 or color(35, 35, 35, 150));
end;
local function v151(v147)
    local v148, _, _ = render.measure_text(2, "", string.upper(v147)):unpack();
    return v148;
end;
events.render:set(function()
    -- upvalues: v19 (ref), v30 (ref), v24 (ref), v0 (ref), v37 (ref), v34 (ref), v35 (ref), v36 (ref), v33 (ref), v1 (ref), l_gradient_0 (ref), v45 (ref), v41 (ref), v42 (ref), v46 (ref), v43 (ref), v44 (ref), v21 (ref), v31 (ref), v48 (ref), v49 (ref), v50 (ref), v52 (ref), v51 (ref), v146 (ref), v53 (ref), v58 (ref), v22 (ref), v80 (ref), v151 (ref), v59 (ref), v60 (ref), l_aim_0 (ref), l_animations_0 (ref), v15 (ref), v56 (ref), v55 (ref), v57 (ref), v54 (ref), v16 (ref), v39 (ref), v40 (ref), v47 (ref), v18 (ref)
    v19 = render.screen_size();
    local v152 = entity.get_local_player();
    if v152 ~= nil then
        if v30.mindmgind:get() then
            render.text(1, vector(v19.x / 2 + 4, v19.y / 2 - 14), color(255), nil, v24.mindmg:get());
        end;
        local v153, _, _ = render.measure_text(1, "", "MERCURY [DEV]"):unpack();
        render.text(1, vector(v19.x / 2 - v153 / 2, v19.y - 20), color(255, 255, 255, 255), nil, "MERCURY [DEV]");
        local v156 = entity.get_local_player():get_steam_avatar();
        local l_v0_0 = v0;
        if v37:get() ~= "" then
            l_v0_0 = v37:get();
        end;
        if v30.watermark:get() then
            local v158, _, _ = render.measure_text(2, "", string.upper(l_v0_0)):unpack();
            local v161 = v34:get();
            local v162 = v35:get();
            local v163 = v36:get();
            if v33:get() == "Old Gradient" then
                render.texture(v156, vector(v19.x - 92 - v158 / 4, 23), vector(25, 25));
                render.gradient(vector(v19.x - 100 - v158 / 4, 15), vector(v19.x - 12 + v158 / 4, 18), color(v163.r, v163.g, v163.b, 0), color(v163.r, v163.g, v163.b, 255), color(v163.r, v163.g, v163.b, 0), color(v163.r, v163.g, v163.b, 255));
                render.gradient(vector(v19.x - 100 - v158 / 4, 52), vector(v19.x - 12 + v158 / 4, 55), color(v163.r, v163.g, v163.b, 0), color(v163.r, v163.g, v163.b, 255), color(v163.r, v163.g, v163.b, 0), color(v163.r, v163.g, v163.b, 255));
                render.gradient(vector(v19.x - 9 + v158 / 5, 15), vector(v19.x - 12 + v158 / 5, 55), color(v163.r, v163.g, v163.b, 255), color(v163.r, v163.g, v163.b, 255), color(v163.r, v163.g, v163.b, 255), color(v163.r, v163.g, v163.b, 255));
                render.gradient(vector(v19.x - 100 - v158 / 5, 18), vector(v19.x - 12 + v158 / 5, 52), color(v161.r, v161.g, v161.b, 0), color(v162.r, v162.g, v162.b, 125), color(v161.r, v161.g, v161.b, 0), color(v162.r, v162.g, v162.b, 125));
                render.text(1, vector(v19.x - 62 - v158 / 4, 25), color(255), nil, "MERCURY");
                render.text(2, vector(v19.x - 63 - v158 / 4, 35), color(255), nil, string.upper(l_v0_0));
                render.text(2, vector(v19.x - 63 - v158 / 4 + v158 + 2, 35), color(255), nil, "[" .. string.upper(v1) .. "]");
            elseif v33:get() == "Modern" then
                render.gradient(vector(v19.x - 100 - v158 / 5, 18), vector(v19.x - 15 + v158 / 3, 52), v34:get(), v35:get(), v34:get(), v35:get(), 5);
                render.texture(v156, vector(v19.x - 94 - v158 / 4, 23), vector(25, 25), 20);
                render.circle_outline(vector(v19.x - 94 - v158 / 4 + 13, 36), v36:get(), 15, 0, 1, 2);
                render.text(1, vector(v19.x - 62 - v158 / 4, 25), color(255), nil, "MERCURY");
                render.text(2, vector(v19.x - 62 - v158 / 4, 35), color(255, 255, 255, 200), nil, string.upper(l_v0_0));
                render.text(2, vector(v19.x - 62 - v158 / 4 + v158 + 2, 35), color(255, 255, 255, 200), nil, "[" .. string.upper(v1) .. "]");
            elseif v33:get() == "Rainbow" then
                local v164 = math.floor(globals.realtime * 50 % 100);
                local v165 = math.floor((globals.realtime + 1.5) * 50 % 100);
                local v166 = color():as_hsv(v164 * 0.01, 1, 1, 1);
                local v167 = color():as_hsv(v165 * 0.01, 1, 1, 1);
                render.gradient(vector(v19.x - 100 - v158 / 5, 18), vector(v19.x - 15 + v158 / 3, 52), color(v166.r, v166.g, v166.b, 90), color(v167.r, v167.g, v167.b, 90), color(v166.r, v166.g, v166.b, 90), color(v167.r, v167.g, v167.b, 90), 5);
                render.texture(v156, vector(v19.x - 94 - v158 / 4, 23), vector(25, 25), 20);
                render.circle_outline(vector(v19.x - 94 - v158 / 4 + 13, 36), v36:get(), 15, 0, 1, 2);
                render.text(1, vector(v19.x - 62 - v158 / 4, 25), color(255), nil, "MERCURY");
                render.text(2, vector(v19.x - 62 - v158 / 4, 35), color(255, 255, 255, 200), nil, string.upper(l_v0_0));
                render.text(2, vector(v19.x - 62 - v158 / 4 + v158 + 2, 35), color(255, 255, 255, 200), nil, "[" .. string.upper(v1) .. "]");
            end;
        end;
    end;
    if v152 == nil or not v152:is_alive() then
        return;
    else
        local l_m_bIsScoped_0 = v152.m_bIsScoped;
        if v30.infopanel:get() then
            local v169 = l_gradient_0.text_animate(">\\ mercury anti-aim technology", v45:get(), {
                v41:get(), 
                v42:get()
            });
            local v170 = l_gradient_0.text_animate(v1:lower(), v46:get(), {
                v43:get(), 
                v44:get()
            });
            local v171 = l_gradient_0.text_animate(">\\ anti-bruteforce phase: ", v45:get(), {
                v41:get(), 
                v42:get()
            });
            local v172 = l_gradient_0.text_animate(tostring(v21.activestate), v45:get(), {
                v43:get(), 
                v44:get()
            });
            local v173 = v169:get_animated_text();
            local v174 = v170:get_animated_text();
            local v175 = v171:get_animated_text();
            local v176 = v172:get_animated_text();
            local v177 = render.measure_text(3, nil, ">\\ mercury anti-aim technology ");
            local v178 = render.measure_text(3, nil, ">\\ anti-bruteforce phase: ");
            render.text(3, vector(20, v19.y / 2), color(0, 0, 0, 255), nil, v173);
            render.text(3, vector(20 + v177.x, v19.y / 2), color(0, 0, 0, 255), nil, v174);
            render.text(3, vector(20, v19.y / 2 + v177.y + 2), color(0, 0, 0, 255), nil, v175);
            render.text(3, vector(20 + v178.x, v19.y / 2 + v177.y + 2), color(0, 0, 0, 255), nil, v176);
            v169:animate();
            v170:animate();
            v171:animate();
            v172:animate();
        end;
        if v31.fakestats:get() then
            v152:get_resource().m_iKills = v48:get();
            v152:get_resource().m_iAssists = v49:get();
            v152:get_resource().m_iDeaths = v50:get();
            v152:get_resource().m_iMVPs = v52:get();
            v152:get_resource().m_iScore = v51:get();
        end;
        if v30.tsaa_arrows:get() then
            local v179 = entity.get_local_player().m_flPoseParameter[11] * 120 - 60;
            local v180 = v19.x / 2;
            local v181 = v19.y / 2;
            local v182 = vector(v180, v181);
            v146(v182, v53:get(), v179);
        end;
        if v30.indicators:get() then
            if v58:get() == "Old" then
                local v183 = v22.player_states[v80()];
                local v184 = v151("MERCURY");
                local v185 = v151(v183);
                local v186 = v151(v1);
                render.text(2, vector(v19.x / 2 - v185 / 2, v19.y / 2 + 35), color(255, 255, 255, 255), nil, string.upper(v183));
                local v187 = math.sin(math.abs(-3.14 + globals.curtime * 2 % 6.28)) * 255;
                render.text(2, vector(v19.x / 2 - v184 / 2 - v186 + 5, v19.y / 2 + 27), v59:get(), nil, string.upper("MERCURY"));
                render.text(2, vector(v19.x / 2 + 10, v19.y / 2 + 27), color(v60:get().r, v60:get().g, v60:get().b, v187), nil, string.upper(v1));
                if v24.dt:get() then
                    if l_aim_0.get_exploit_charge() then
                        render.text(2, vector(v19.x / 2 - v151("DT") / 2 - 3, v19.y / 2 + 44), color(255, 255, 255, 255), nil, " DT");
                    else
                        render.text(2, vector(v19.x / 2 - v151("DT") / 2 - 3, v19.y / 2 + 44), color(255, 0, 0, 240), nil, " DT");
                    end;
                elseif v24.hs:get() then
                    render.text(2, vector(v19.x / 2 - v151("HS") / 2 - 3, v19.y / 2 + 44), color(255, 255, 255, 255), nil, " HS");
                else
                    render.text(2, vector(v19.x / 2 - v151("DT") / 2 - 3, v19.y / 2 + 44), color(150, 150, 150, 240), nil, " DT");
                end;
                if v24.fbaim:get() == "Force" then
                    render.text(2, vector(v19.x / 2 - v151("BAIM") - v151("HS") / 2 - 4, v19.y / 2 + 44), color(255, 255, 255, 255), nil, "BAIM");
                else
                    render.text(2, vector(v19.x / 2 - v151("BAIM") - v151("HS") / 2 - 4, v19.y / 2 + 44), color(150, 150, 150, 240), nil, "BAIM");
                end;
                if v24.freestanding:get() then
                    render.text(2, vector(v19.x / 2 + v151("HS") / 2 - 2, v19.y / 2 + 44), color(255, 255, 255, 255), nil, "FS");
                else
                    render.text(2, vector(v19.x / 2 + v151("HS") / 2 - 2, v19.y / 2 + 44), color(150, 150, 150, 240), nil, "FS");
                end;
                if v24.qp:get() then
                    render.text(2, vector(v19.x / 2 + v151("HS") / 2 + v151("FS") - 2, v19.y / 2 + 44), color(255, 255, 255, 255), nil, "QP");
                else
                    render.text(2, vector(v19.x / 2 + v151("HS") / 2 + v151("FS") - 2, v19.y / 2 + 44), color(150, 150, 150, 240), nil, "QP");
                end;
            elseif v58:get() == "Modern" then
                local v188 = v19 / 2;
                local v189 = l_gradient_0.text("mercury", false, {
                    v59:get(), 
                    v60:get()
                });
                local v190 = l_gradient_0.text("mercury", false, {
                    v60:get(), 
                    v59:get()
                });
                local v191 = l_animations_0.new("alpha", 255);
                local v192 = v191:update(l_animations_0.types.SINE3, 255);
                local _ = l_animations_0.new("alpha2", 255);
                local v194 = rage.exploit:get();
                local v195 = l_animations_0.new("First scope x-value", v188.x);
                local v196 = l_animations_0.new("First scope x-value 2", v188.x);
                local v197 = l_animations_0.new("DT x", v188.x);
                local _ = l_animations_0.new("DT x2", v188.x);
                local v199 = v195:update(l_animations_0.types.LERP, l_m_bIsScoped_0 and v188.x + 30 or v188.x);
                local _ = v196:update(l_animations_0.types.LERP, l_m_bIsScoped_0 and v188.x + 30 or v188.x);
                local v201 = l_animations_0.new("Third scope y-value", v188.y + 30);
                local _ = l_animations_0.new("Third scope y-value 2", v188.y + 40);
                local v203 = v201:update(l_animations_0.types.SINE3, l_m_bIsScoped_0 and v188.y + 27 or v188.y + 27);
                local l_v195_0 = v195;
                v203 = v201:update(l_animations_0.types.SINE3, l_m_bIsScoped_0 and v188.y - 2 or v188.y - 2);
                if l_aim_0.get_desync_delta() < 0 then
                    test = v190;
                elseif l_aim_0.get_desync_delta() > 0 then
                    test = v189;
                else
                    test = v189;
                end;
                render.text(3, vector(v199, v188.y + 29), color(), "c", test);
                render.text(3, vector(v199, v188.y + 20), color(220, 220, 220, 150), "c", v22.p_states[v22.p_state]:lower());
                if v24.dt:get() then
                    v203 = v201:update(l_animations_0.types.SINE3, l_m_bIsScoped_0 and v188.y + 90 or v188.y + 90);
                    v15 = 1;
                    if v194 == 1 then
                        l_v195_0 = v197:update(l_animations_0.types.LERP, l_m_bIsScoped_0 and v188.x + 30 or v188.x);
                        render.text(2, vector(l_v195_0, v203), color(0, 255, 0, 255), "c", "DT");
                    else
                        l_v195_0 = v197:update(l_animations_0.types.LERP, l_m_bIsScoped_0 and v188.x + 22 or v188.x - 8);
                        render.circle_outline(vector(l_v195_0 + 9, v203), color(50, 50, 50, 100), 5, 0, 1, 2);
                        render.circle_outline(vector(l_v195_0 + 9, v203), color(255, 255, 255, 200), 5, 0, v194, 2);
                        render.text(2, vector(l_v195_0, v203), color(255, 255, 255, 255), "c", "DT");
                    end;
                elseif v24.hs:get() and not v24.dt:get() then
                    v15 = 2;
                    v203 = v201:update(l_animations_0.types.SINE3, l_m_bIsScoped_0 and v188.y + 90 or v188.y + 90);
                    render.text(2, vector(v199, v203), color(0, 255, 0, 255), "c", "HS");
                else
                    v191:update(l_animations_0.types.SINE3, -273);
                    v203 = v201:update(l_animations_0.types.SINE3, l_m_bIsScoped_0 and v188.y + 100 or v188.y + 100);
                    render.text(2, vector(v199, v203), color(0, 255, 0, v192), "c", v15 == 1 and "DT" or "HS");
                end;
            end;
        end;
        if v30.scopeoverlay:get() then
            v24.scopeoverlay:set("Remove All");
            local l_x_1 = v19.x;
            local l_y_0 = v19.y;
            local v207 = v56:get() * l_y_0 / 1080;
            local v208 = v55:get() * l_y_0 / 1080;
            local v209 = v57:get();
            local v210 = v54:get();
            local l_m_zoomLevel_0 = v152:get_player_weapon().m_zoomLevel;
            local l_m_bResumeZoom_0 = v152.m_bResumeZoom;
            local v213 = v152:get_player_weapon() ~= nil and l_m_zoomLevel_0 ~= nil and l_m_zoomLevel_0 > 0 and l_m_bIsScoped_0 and not l_m_bResumeZoom_0;
            local v214 = v209 > 3 and globals.frametime * v209 or 1;
            local v215 = v16(1, 1);
            render.gradient(vector(l_x_1 / 2 - v208 + 2, l_y_0 / 2), vector(l_x_1 / 2 - v208 + 2 + v208 - v207, l_y_0 / 2 + 1), color(v210.r, v210.g, v210.b, 0), color(v210.r, v210.g, v210.b, v215 * v210.a), color(v210.r, v210.g, v210.b, 0), color(v210.r, v210.g, v210.b, v215 * v210.a));
            render.gradient(vector(l_x_1 / 2 + v207, l_y_0 / 2), vector(l_x_1 / 2 + v207 + v208 - v207, l_y_0 / 2 + 1), color(v210.r, v210.g, v210.b, v215 * v210.a), color(v210.r, v210.g, v210.b, 0), color(v210.r, v210.g, v210.b, v215 * v210.a), color(v210.r, v210.g, v210.b, 0));
            render.gradient(vector(l_x_1 / 2, l_y_0 / 2 - v208 + 2), vector(l_x_1 / 2 + 1, l_y_0 / 2 - v208 + 2 + v208 - v207), color(v210.r, v210.g, v210.b, 0), color(v210.r, v210.g, v210.b, 0), color(v210.r, v210.g, v210.b, v215 * v210.a), color(v210.r, v210.g, v210.b, v215 * v210.a));
            render.gradient(vector(l_x_1 / 2, l_y_0 / 2 + v207), vector(l_x_1 / 2 + 1, l_y_0 / 2 + v207 + v208 - v207), color(v210.r, v210.g, v210.b, v215 * v210.a), color(v210.r, v210.g, v210.b, v215 * v210.a), color(v210.r, v210.g, v210.b, 0), color(v210.r, v210.g, v210.b, 0));
            v16.value = math.clamp(v16.value + (v213 and v214 or -v214), 0, 1);
        end;
        if v39:get() then
            v40:visibility(true);
        else
            v40:visibility(false);
        end;
        if v31.aspectratio:get() then
            cvar.r_aspectratio:float(v47:get() / 10 or 0);
            v18 = false;
        elseif not v18 then
            cvar.r_aspectratio:float(0);
            v18 = true;
        end;
        return;
    end;
end);
local function v217(v216)
    return v216:gsub("\n", "\r\n?");
end;
local function v223()
    -- upvalues: v22 (ref), v23 (ref), l_clipboard_0 (ref), l_base64_0 (ref)
    local v218 = {};
    for v219, v220 in pairs(v22.player_states) do
        v218[tostring(v220)] = {};
        for v221, v222 in pairs(v23[v219]) do
            if type(v222) == "number" then
                v218[v220][v221] = v222;
            else
                v218[v220][v221] = v222:get();
            end;
        end;
    end;
    l_clipboard_0.set(l_base64_0.encode((json.stringify(v218))));
    print("Anti-aimbot angles settings exported to ur clipboard!");
end;
local function v232(v224)
    -- upvalues: l_base64_0 (ref), v217 (ref), l_clipboard_0 (ref), v22 (ref), v23 (ref)
    local v225 = "";
    if v224 ~= nil then
        v225 = json.parse((l_base64_0.decode(v224)));
    else
        local v226 = v217(l_clipboard_0.get());
        v225 = json.parse((l_base64_0.decode(v226)));
    end;
    for v227, v228 in pairs(v22.player_states) do
        for v229, v230 in pairs(v23[v227]) do
            local v231 = v225[v228][v229];
            if type(v230) == "number" and v231 ~= nil then
                v23[v227].phase = v231;
            elseif v231 ~= nil then
                v230:set(v231);
            end;
        end;
    end;
    print("Anti-aimbot angles settings imported from ur clipboard!");
end;
v25.antiaimConfigTab:button("Import config from clipboard", function()
    -- upvalues: v232 (ref)
    v232();
end);
v25.antiaimConfigTab:button("Export config to clipboard", function()
    -- upvalues: v223 (ref)
    v223();
end);
v25.antiaimConfigTab:button("Import default settings", function()
    -- upvalues: v232 (ref), v217 (ref)
    v232(v217("eyJSdW4iOnsieWF3YWRkX3JpZ2h0IjowLCJib2R5dmFsIjowLCJ5YXdhZGRfbGVmdCI6NCwiZHluYW1pY19mcmVlc3RhbmQiOnRydWUsInlhd2ppdHRlcl92YWx1ZSI6MTIsImFudGlfYmYiOmZhbHNlLCJ5YXdfcmFuZG9taXplciI6MCwiZW5hYmxlX3N0YXRlIjp0cnVlLCJmYWtleWF3bGltaXQiOjU2LCJib2R5eWF3IjoiSml0dGVyIiwieWF3aml0dGVyIjoiQ2VudGVyIn0sIkFpciI6eyJ5YXdhZGRfcmlnaHQiOi00LCJib2R5dmFsIjowLCJ5YXdhZGRfbGVmdCI6LTQsImR5bmFtaWNfZnJlZXN0YW5kIjp0cnVlLCJ5YXdqaXR0ZXJfdmFsdWUiOjEyLCJhbnRpX2JmIjpmYWxzZSwieWF3X3JhbmRvbWl6ZXIiOjAsImVuYWJsZV9zdGF0ZSI6dHJ1ZSwiZmFrZXlhd2xpbWl0Ijo2MCwiYm9keXlhdyI6IkppdHRlciIsInlhd2ppdHRlciI6IkNlbnRlciJ9LCJGYWtlTGFnIjp7Inlhd2FkZF9yaWdodCI6LTQsImJvZHl2YWwiOjAsInlhd2FkZF9sZWZ0IjotNCwiZHluYW1pY19mcmVlc3RhbmQiOnRydWUsInlhd2ppdHRlcl92YWx1ZSI6MTIsImFudGlfYmYiOmZhbHNlLCJ5YXdfcmFuZG9taXplciI6MCwiZW5hYmxlX3N0YXRlIjp0cnVlLCJmYWtleWF3bGltaXQiOjU2LCJib2R5eWF3IjoiSml0dGVyIiwieWF3aml0dGVyIjoiQ2VudGVyIn0sIlN0YW5kIjp7Inlhd2FkZF9yaWdodCI6NCwiYm9keXZhbCI6MCwieWF3YWRkX2xlZnQiOi00LCJkeW5hbWljX2ZyZWVzdGFuZCI6dHJ1ZSwieWF3aml0dGVyX3ZhbHVlIjoxOSwiYW50aV9iZiI6ZmFsc2UsInlhd19yYW5kb21pemVyIjowLCJlbmFibGVfc3RhdGUiOnRydWUsImZha2V5YXdsaW1pdCI6NTYsImJvZHl5YXciOiJKaXR0ZXIiLCJ5YXdqaXR0ZXIiOiJDZW50ZXIifSwiQWlyLUR1Y2siOnsieWF3YWRkX3JpZ2h0IjotNCwiYm9keXZhbCI6MCwieWF3YWRkX2xlZnQiOi00LCJkeW5hbWljX2ZyZWVzdGFuZCI6dHJ1ZSwieWF3aml0dGVyX3ZhbHVlIjoxMiwiYW50aV9iZiI6ZmFsc2UsInlhd19yYW5kb21pemVyIjowLCJlbmFibGVfc3RhdGUiOnRydWUsImZha2V5YXdsaW1pdCI6NjAsImJvZHl5YXciOiJKaXR0ZXIiLCJ5YXdqaXR0ZXIiOiJDZW50ZXIifSwiU2xvd3dhbGsiOnsieWF3YWRkX3JpZ2h0IjowLCJib2R5dmFsIjowLCJ5YXdhZGRfbGVmdCI6MCwiZHluYW1pY19mcmVlc3RhbmQiOnRydWUsInlhd2ppdHRlcl92YWx1ZSI6MCwiYW50aV9iZiI6ZmFsc2UsInlhd19yYW5kb21pemVyIjowLCJlbmFibGVfc3RhdGUiOmZhbHNlLCJmYWtleWF3bGltaXQiOjYwLCJib2R5eWF3IjoiT2ZmIiwieWF3aml0dGVyIjoiT2ZmIn0sIkR1Y2siOnsieWF3YWRkX3JpZ2h0Ijo0LCJib2R5dmFsIjowLCJ5YXdhZGRfbGVmdCI6NCwiZHluYW1pY19mcmVlc3RhbmQiOnRydWUsInlhd2ppdHRlcl92YWx1ZSI6MTgsImFudGlfYmYiOmZhbHNlLCJ5YXdfcmFuZG9taXplciI6MCwiZW5hYmxlX3N0YXRlIjp0cnVlLCJmYWtleWF3bGltaXQiOjYwLCJib2R5eWF3IjoiSml0dGVyIiwieWF3aml0dGVyIjoiQ2VudGVyIn19"));
end);