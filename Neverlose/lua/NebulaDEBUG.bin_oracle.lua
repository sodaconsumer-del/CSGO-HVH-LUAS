local l_clipboard_0 = require("neverlose/clipboard");
local l_weapons_0 = require("neverlose/csgo_weapons");
local l_base64_0 = require("neverlose/base64");
local _ = require("neverlose/vmt_hook");
local v4 = ui.create("Home", "NEBULA", nil);
local v5 = ui.create("Home", "Information", nil);
local _ = ui.create("Home", "Config System", nil);
local v7 = ui.create("AntiAim", "Config", nil);
local v8 = ui.create("AntiAim", "AntiAim", nil);
local v9 = ui.create("AntiAim", "Misc", nil);
local v10 = ui.create("Misc", "Misc", nil);
local v11 = ui.create("Misc", "Visual", nil);
v5:label(ui.get_icon("user-tie") .. "  \a686197FFUsername\aFFFFFFFF: " .. common.get_username());
v5:label(ui.get_icon("dollar-sign") .. "   \a686197FFBuild\aFFFFFFFF: Debug");
v5:label(ui.get_icon("dollar-sign") .. "   \a686197FFUpdated\aFFFFFFFF: 2025-03-01");
v5:label(ui.get_icon("code-branch") .. "   \a686197FFVersion\aFFFFFFFF: 1.2.0");
local _ = v4:label("Welcome," .. "\a686197FF " .. common.get_username() .. "\aFFFFFFFF to NEBULA!");
local _ = v4:label("Configs");
local v14 = v4:button("Lakk");
local v15 = v4:button("Juse");
local _ = v4:label("Links");
v4:button("Discord"):set_callback(function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/VhUFqNS2Xc");
end);
v14:set_callback(function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=XdhCVd");
end);
v15:set_callback(function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=2n3atu");
end);
local v17 = v10:selectable("\a686197FF" .. ui.get_icon("clipboard-list") .. "\aFFFFFFFF" .. "  Aimbot Logs", {
    [1] = "Console", 
    [2] = "Top-Left"
});
local v18 = v17:create();
local v19 = v18:label("Base Color"):color_picker(color(0, 0, 0, 255));
local v20 = v18:label("- Color"):color_picker(color(0, 0, 0, 255));
local v21 = v18:label("+ Color"):color_picker(color(0, 0, 0, 255));
local v22 = v11:switch("\a686197FF" .. ui.get_icon("crosshairs") .. "\aFFFFFFFF" .. " Custom Scope");
local v23 = v22:create();
local v24 = v23:label("Scope Color"):color_picker(color(0, 0, 0, 255));
local v25 = v23:slider("Scope Gap", 0, 100, 0);
local v26 = v23:slider("Scope Length", 0, 400, 0);
local v27 = v11:switch("\a686197FF" .. ui.get_icon("bullseye") .. "\aFFFFFFFF" .. " Min. Damage", false);
local v28 = v27:create():label("Color"):color_picker(color(255, 255, 255, 255));
local v29 = v27:create();
local v30 = v29:switch("Always On", false);
local v31 = v29:combo("Style", {
    [1] = "Console", 
    [2] = "Clean"
});
local v32 = v11:switch("\a686197FF" .. ui.get_icon("person-running") .. "\aFFFFFFFF" .. " Velocity Indicator", false);
local v33 = v11:combo("\a686197FF" .. ui.get_icon("paint-roller") .. "\aFFFFFFFF" .. " Watermark", {
    [1] = "Left", 
    [2] = "Right", 
    [3] = "Down"
});
local v34 = v33:create();
local v35 = v34:switch("Display Build");
local v36 = v34:combo("Style", {
    [1] = "Static", 
    [2] = "Wave", 
    [3] = "Pulse", 
    [4] = "Middle Wave"
});
local v37 = v35:color_picker(color(0, 0, 0, 255));
local v38 = v11:switch("\a686197FF" .. ui.get_icon("crosshairs") .. "\aFFFFFFFF" .. " Hitmarker", false);
local v39 = v11:switch("\a686197FF" .. ui.get_icon("bell") .. "\aFFFFFFFF" .. " Notifications", false);
local v40 = v39:create();
local v41 = v40:label("Glow Color"):color_picker(color(104, 97, 151, 255));
local v42 = v40:label("Text Color"):color_picker(color(255, 255, 255, 255));
local v43 = v40:label("Accent Color"):color_picker(color(104, 97, 151, 255));
local v44 = v38:create():label("Color"):color_picker(color(0, 0, 0, 255));
local v45 = v10:switch("\a686197FF" .. ui.get_icon("person-running") .. "\aFFFFFFFF" .. " Animations", false);
local v46 = v10:switch("\a686197FF" .. ui.get_icon("gauge-high") .. "\aFFFFFFFF" .. " Fast Ladder", false);
local v47 = v10:switch("\a686197FF" .. ui.get_icon("comment-dots") .. "\aFFFFFFFF" .. " KillSay", false);
local v48 = v10:switch("\a686197FF" .. ui.get_icon("tag") .. "\aFFFFFFFF" .. " Clantag", false);
local v49 = v45:create():selectable(ui.get_icon("person-running") .. "  Animations", {
    [1] = "Break Legs", 
    [2] = "Body Lean", 
    [3] = "Static Legs"
});
local v50 = v10:switch("\a686197FF" .. ui.get_icon("eye") .. "\aFFFFFFFF" .. " Custom Viewmodel", false);
local v51 = v50:create();
local v52 = v51:slider("FOV", 0, 100, 68);
local v53 = v51:slider("X", -10, 10, 0);
local v54 = v51:slider("Y", -10, 10, 0);
local v55 = v51:slider("Z", -10, 10, 0);
local v56 = ui.create("Misc", "Extra", nil);
local v57 = v56:slider("\a686197FF" .. ui.get_icon("display") .. "\aFFFFFFFF" .. " Aspect Ratio", 0, 200, 0, 0.01);
local v58 = v56:switch("\a686197FF" .. ui.get_icon("eye") .. "\aFFFFFFFF" .. " Disable Cvars", false);
local v59 = v56:switch("\a686197FF" .. ui.get_icon("shield-exclamation") .. "\aFFFFFFFF" .. " Log AntiAim", false);
local v60 = v7:switch("\aD8A900FFOverride AA", false);
local v61 = v7:button("Export Config");
local v62 = v7:button("Import Config");
local v63 = v7:list("Preset List", "Default", "Lakk", "Juse");
local v64 = v7:button("+ Load Preset");
local function v78()
    -- upvalues: v37 (ref)
    local _ = 0.3;
    local v66 = "NEBULA [DEBUG]";
    local v67 = globals.realtime * 3;
    local v68 = v37:get();
    local v69 = #v66;
    local v70 = "";
    for v71 = 1, v69 do
        local v72 = v66:sub(v71, v71);
        if v72 == " " then
            v70 = v70 .. v72;
        else
            local v73 = v71 / v69 * math.pi * 2 - v67;
            local v74 = 0.5 - 0.5 * math.sin(v73);
            local v75 = math.floor(math.max(v68.r * v74, v68.r * 0.2));
            local v76 = math.floor(math.max(v68.g * v74, v68.g * 0.2));
            local v77 = math.floor(math.max(v68.b * v74, v68.b * 0.2));
            v70 = v70 .. "\a" .. color(v75, v76, v77):to_hex() .. v72;
        end;
    end;
    ui.sidebar(v70, "sparkles");
end;
local v79 = {
    [1] = "Global", 
    [2] = "Stand", 
    [3] = "Slow", 
    [4] = "Move", 
    [5] = "Duck", 
    [6] = "Duck+", 
    [7] = "Air", 
    [8] = "Air+"
};
local v80 = v8:combo("AA State", v79);
AAData = {};
for _, v82 in next, v79 do
    AAData["On " .. v82] = v8:switch("On " .. v82);
    AAData["Pitch " .. v82] = v8:combo("Pitch ", "Disabled", "Down");
    AAData["Yaw " .. v82] = v8:combo("Yaw ", "Disabled", "Backward", "L-R Add");
    local v83 = AAData["Yaw " .. v82]:create();
    AAData["Yaw Base " .. v82] = v83:combo("Yaw Base", "Local View", "At Target");
    AAData["Yaw Left " .. v82] = v83:slider(ui.get_icon("rotate-left") .. " Left", -180, 180, 0);
    AAData["Yaw Right " .. v82] = v83:slider(ui.get_icon("rotate-right") .. " Right", -180, 180, 0);
    AAData["Yaw Offset " .. v82] = v83:slider("Yaw Offset", -180, 180, 0);
    AAData["Yaw Options " .. v82] = v83:combo("Custom Options", "Off", "Modify Tick", "Randomize");
    AAData["Modify Tick Delay " .. v82] = v83:slider("Delay Between Modification", 1, 25, 1);
    AAData["Custom L-R Right " .. v82] = v83:slider("Right Amount", -50, 50, 0);
    AAData["Custom L-R Left " .. v82] = v83:slider("Left Amount", -50, 50, 0);
    AAData["Custom L-R Offset " .. v82] = v83:slider("Randomize Amount", 0, 25, 0);
    AAData["Yaw Jitter " .. v82] = v8:combo("Yaw Jitter ", "Disabled", "Center", "Offset", "Tick Jitter", "3-Way");
    local v84 = AAData["Yaw Jitter " .. v82]:create();
    AAData["Skip Ticks " .. v82] = v84:slider("Skip Tick", 1, 10, 1);
    AAData["Yaw Jitter Offset " .. v82] = v84:slider("Jitter Offset", -180, 180, 0);
    AAData["Tick Modes " .. v82] = v84:combo("Tick Modes", "Off", "Randomize Ticks", "Switch Ticks");
    AAData["Delay Ticks " .. v82] = v84:slider("Delay Between Switch", 1, 25, 1);
    AAData["Switch One " .. v82] = v84:slider("Mode 1 (Speed)", 1, 10, 1);
    AAData["Switch Two " .. v82] = v84:slider("Mode 2 (Speed)", 1, 10, 1);
    AAData["Body Yaw " .. v82] = v8:switch("Body Yaw");
    local v85 = AAData["Body Yaw " .. v82]:create();
    AAData["Inverter " .. v82] = v85:switch("Inverter");
    AAData["Fake Left " .. v82] = v85:slider("Left Limit", 0, 60, 60);
    AAData["Fake Right " .. v82] = v85:slider("Right Limit", 0, 60, 60);
    AAData["Body Yaw Options " .. v82] = v85:selectable("Options", "Avoid Overlap", "Jitter", "Randomize Jitter", "Anti Bruteforce");
    AAData["Fake Freestanding " .. v82] = v85:combo("Freestanding", "Off", "Peek Fake", "Peek Real");
    AAData["Custom Body Yaw Options " .. v82] = v8:combo("Custom Body Yaw Options", "Off");
end;
local _ = v8:label("\aD8A900FFA Competitive AntiAim Lua.");
local v87 = v9:selectable("Meme AntiAim", "On Warmup", "On Round End");
local v88 = v9:selectable("Force Defensive", "Stand", "Slow", "Move", "Duck", "Duck+", "Air", "Air+");
local v89 = v9:combo("Manual AntiAim", "Disabled", "Left", "Right");
local v90 = v9:switch("Safe Head", false);
local v91 = v9:switch("No Fall Damage", false);
local v92 = v9:switch("Freestanding", false);
local v93 = v92:create();
local v94 = v93:switch("Disable Yaw Mod", false);
local v95 = v93:switch("Body Freestanding", false);
local v96 = v93:switch("Manual Antiaim Preference", false);
local v97 = {
    DoubleTap = ui.find("Aimbot", "Ragebot", "MAIN", "Double Tap"), 
    DoubleTapLag = ui.find("Aimbot", "Ragebot", "MAIN", "Double Tap", "Fake Lag Limit"), 
    LagOptions = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    HideShots = ui.find("Aimbot", "Ragebot", "MAIN", "Hide Shots"), 
    LegMovement = ui.find("Aimbot", "Anti Aim", "MISC", "Leg Movement"), 
    BodyAim = ui.find("Aimbot", "Ragebot", "SAFETY", "Body Aim"), 
    RemoveScope = ui.find("Visuals", "World", "MAIN", "Override Zoom", "Scope Overlay"), 
    FakeDuck = ui.find("Aimbot", "Anti Aim", "MISC", "Fake Duck"), 
    ForceThirdPerson = ui.find("Visuals", "World", "MAIN", "Force Thirdperson"), 
    SlowWalk = ui.find("Aimbot", "Anti Aim", "MISC", "Slow Walk"), 
    Pitch = ui.find("Aimbot", "Anti Aim", "ANGLES", "Pitch"), 
    FakeLagLimit = ui.find("Aimbot", "Anti Aim", "FAKE LAG", "Limit"), 
    AAOn = ui.find("Aimbot", "Anti Aim", "ANGLES", "Enabled"), 
    Yaw = ui.find("Aimbot", "Anti Aim", "ANGLES", "Yaw"), 
    YawBase = ui.find("Aimbot", "Anti Aim", "ANGLES", "Yaw", "Base"), 
    YawOffset = ui.find("Aimbot", "Anti Aim", "ANGLES", "Yaw", "Offset"), 
    YawModifier = ui.find("Aimbot", "Anti Aim", "ANGLES", "Yaw Modifier"), 
    YawModifierValue = ui.find("Aimbot", "Anti Aim", "ANGLES", "Yaw Modifier", "Offset"), 
    Desync = ui.find("Aimbot", "Anti Aim", "ANGLES", "Body Yaw"), 
    DesyncInverter = ui.find("Aimbot", "Anti Aim", "ANGLES", "Body Yaw", "Inverter"), 
    DesyncLeftLimit = ui.find("Aimbot", "Anti Aim", "ANGLES", "Body Yaw", "Left Limit"), 
    DesyncRightLimit = ui.find("Aimbot", "Anti Aim", "ANGLES", "Body Yaw", "Right Limit"), 
    FakeOptions = ui.find("Aimbot", "Anti Aim", "ANGLES", "Body Yaw", "Options"), 
    DesyncFreestanding = ui.find("Aimbot", "Anti Aim", "ANGLES", "Body Yaw", "Freestanding"), 
    FreestandingYawMod = ui.find("Aimbot", "Anti Aim", "ANGLES", "Freestanding", "Disable Yaw Modifiers"), 
    FreestandingBody = ui.find("Aimbot", "Anti Aim", "ANGLES", "Freestanding", "Body Freestanding"), 
    Freestanding = ui.find("Aimbot", "Anti Aim", "ANGLES", "Freestanding"), 
    MinDmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
};
local v98 = {
    [0] = "Generic", 
    [1] = "Head", 
    [2] = "Chest", 
    [3] = "Stomach", 
    [4] = "Left Arm", 
    [5] = "Right Arm", 
    [6] = "Left Leg", 
    [7] = "Right Leg", 
    [8] = "Neck", 
    [9] = "Generic", 
    [10] = "Gear"
};
local v99 = render.screen_size();
local v100 = {
    [1] = "you just died faster than your dad ran from child support", 
    [2] = "imagine being this shit even with a cheat", 
    [3] = "your resolver is about as useful as your existence", 
    [4] = "your config is so bad it made me laugh mid-fight", 
    [5] = "i can literally close my eyes and still kill you", 
    [6] = "bro got deleted so fast his PC thought it was a crash", 
    [7] = "your aim is more lost than your mom at a parent-teacher meeting", 
    [8] = "quit the game before you embarrass yourself any further", 
    [9] = "you're so bad you make silvers look like prime cheaters", 
    [10] = "pack watch, your config just got put in a coffin", 
    [11] = "why do you even queue up if you're gonna be this useless", 
    [12] = "ur movement is so predictable I could prefire you in my sleep", 
    [13] = "get a refund on your cheat, it clearly doesn't work", 
    [14] = "you're playing like your mouse is covered in oil", 
    [15] = "bro's bullets have worse tracking than his stepdad", 
    [16] = "you're so bad I thought you were playing on a trackpad", 
    [17] = "your reaction time is slower than a discord mod touching grass", 
    [18] = "i've seen bots with better pathfinding than you", 
    [19] = "you peaked like you had a death wish and I granted it", 
    [20] = "every shot you take just proves you're mentally handicapped", 
    [21] = "your cheat just committed suicide after seeing NEBULA", 
    [22] = "ur resolver vs NEBULA is like a toddler fighting a heavyweight", 
    [23] = "your config just ragequit after getting packed by NEBULA", 
    [24] = "NEBULA makes your bullets go missing like your dad", 
    [25] = "imagine thinking you could hit me when I'm using NEBULA", 
    [26] = "ur cheat dev should be arrested for scamming you out of money", 
    [27] = "your resolver is struggling harder than your parents\226\128\153 marriage", 
    [28] = "your aim is having a mental breakdown thanks to NEBULA", 
    [29] = "no matter how much you rage, you still won\226\128\153t hit NEBULA", 
    [30] = "watching your cheat fail is the most entertaining part of this match", 
    [31] = "NEBULA has your entire config in a chokehold", 
    [32] = "you're playing on easy mode and still losing to NEBULA", 
    [33] = "the only thing you're hitting is rock bottom", 
    [34] = "NEBULA turned your cheat into a powerpoint presentation", 
    [35] = "your shots are playing hide and seek while NEBULA just dodges", 
    [36] = "NEBULA made your whole team useless", 
    [37] = "ur KD looking like a depression hotline after fighting NEBULA", 
    [38] = "your bullets are more lost than your career prospects", 
    [39] = "give up now, NEBULA already ruined your night", 
    [40] = "playing against NEBULA is the worst decision you've made since birth"
};
ffi.cdef("    typedef uintptr_t (__thiscall* GetClientEntity_4242425_t)(void*, int);\n    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n\ttypedef int(__fastcall* clantag_t)(const char*, const char*);\n\n    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder; //0x0014\n        int m_nSequence; //0x0018\n        float m_flPrevCycle; //0x001C\n        float m_flWeight; //0x0020\n        float m_flWeightDeltaRate; //0x0024\n        float m_flPlaybackRate; //0x0028\n        float m_flCycle; //0x002C\n        void *m_pOwner; //0x0030\n        char  pad_0038[4]; //0x0034\n    } CAnimationLayer;\n\n    typedef struct {\n        unsigned short wYear;\n        unsigned short wMonth;\n        unsigned short wDayOfWeek;\n        unsigned short wDay;\n        unsigned short wHour;\n        unsigned short wMinute;\n        unsigned short wMilliseconds;\n    } SYSTEMTIME, *LPSYSTEMTIME;\n    \n    void GetSystemTime(LPSYSTEMTIME lpSystemTime);\n    void GetLocalTime(LPSYSTEMTIME lpSystemTime);\n\n    bool CreateDirectoryA(const char* lpPathName, void* lpSecurityAttributes);\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);  \n\n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n");
valueToIndex = function(v101, v102)
    for v103, v104 in ipairs(v101) do
        if v104 == v102 then
            return v103;
        end;
    end;
    return -1;
end;
local function v106()
    local l_m_fFlags_0 = entity.get_local_player().m_fFlags;
    if l_m_fFlags_0 == nil then
        return;
    elseif bit.band(l_m_fFlags_0, 1) == 0 then
        return true;
    else
        return false;
    end;
end;
local function v107()
    if entity.get_local_player().m_flDuckAmount > 0 then
        return true;
    else
        return false;
    end;
end;
local function v108()
    return entity.get_local_player().m_vecVelocity:length2d();
end;
local v109 = ffi.typeof("uintptr_t**");
local function v112(v110, v111)
    return function(...)
        -- upvalues: v110 (ref), v111 (ref)
        return v110(v111, ...);
    end;
end;
local v113 = ffi.cast(v109, utils.create_interface("client.dll", "VClientEntityList003"));
local v114 = v112(ffi.cast("get_client_entity_t", v113[0][3]), v113);
local function v119(_, _)
    -- upvalues: v114 (ref), v45 (ref), v49 (ref)
    local v117 = entity.get_local_player();
    local v118 = v114(entity.get_local_player():get_index());
    if not v117 or not v117:is_alive() then
        return;
    else
        if v45:get() then
            if v49:get("Body Lean") then
                ffi.cast("CAnimationLayer**", ffi.cast("uintptr_t", v118) + 10640)[0][12].m_flWeight = 1;
            end;
            if v49:get("Static Legs") then
                v117.m_flPoseParameter[6] = 1;
            end;
        end;
        return;
    end;
end;
local function v122()
    -- upvalues: v114 (ref), v119 (ref)
    local v120 = entity.get_local_player();
    if not v120 or not v120:is_alive() then
        return;
    else
        local v121 = v120:get_index();
        if not v114(v121) then
            return;
        else
            v119();
            return;
        end;
    end;
end;
local function v124()
    -- upvalues: v45 (ref), v49 (ref), v97 (ref)
    if v45:get() and v49:get("Break Legs") then
        LegAnimItems = {
            [1] = "Default", 
            [2] = "Sliding", 
            [3] = "Walking"
        };
        local v123 = globals.tickcount % 3 + 1;
        v97.LegMovement:override(LegAnimItems[v123]);
    end;
end;
local function v130()
    -- upvalues: v108 (ref), v106 (ref), v107 (ref), v97 (ref)
    if entity.get_local_player() then
        local v125 = v108();
        local v126 = v106();
        local v127 = v107();
        local v128 = v97.SlowWalk:get();
        local v129 = "nil";
        if v125 <= 2 and not v126 and not v127 and not v128 then
            v129 = "Stand";
        elseif v128 and not v126 and not v127 then
            v129 = "Slow";
        elseif v125 > 2 and not v126 and not v127 and not v128 then
            v129 = "Move";
        elseif v127 and not v126 and v125 > 2 then
            v129 = "Duck+";
        elseif v127 and not v126 then
            v129 = "Duck";
        elseif v126 and not v127 then
            v129 = "Air";
        elseif v126 and v127 then
            v129 = "Air+";
        end;
        return v129;
    else
        return;
    end;
end;
local function v136(v131, v132)
    if not v132 then
        return;
    else
        local v133 = v132:get_eye_position();
        local v134 = v133:dist2d(v131);
        local v135 = v133.z - v131.z;
        return math.tan(v135 / v134);
    end;
end;
local function v140(v137)
    -- upvalues: l_weapons_0 (ref), v136 (ref)
    flags = v137.m_fFlags;
    if flags == 262 or flags == 263 then
        if l_weapons_0(v137:get_player_weapon()).type == "knife" then
            return true;
        else
            local v138 = v136(v137:get_eye_position(), entity.get_threat());
            local l_m_iHealth_0 = v137.m_iHealth;
            if not v138 or not l_m_iHealth_0 then
                return;
            else
                return l_m_iHealth_0 > 88 and v138 < (flags == 263 and -0.075 or -0.2) and v138 > -1;
            end;
        end;
    else
        return;
    end;
end;
local v141 = 0;
local v142 = false;
local v143 = true;
yawAddOptionL = 0;
yawAddOptionR = 0;
local function v154(_)
    -- upvalues: v130 (ref), v97 (ref), v89 (ref), v141 (ref), v142 (ref), v143 (ref)
    local v145 = v130();
    if not AAData["On " .. v145] then
        v145 = "Global";
    end;
    if AAData["Yaw Jitter " .. v145]:get() ~= "Tick Jitter" then
        return;
    else
        v97.YawModifier:override("Disabled");
        local v146 = AAData["Yaw Jitter Offset " .. v145]:get();
        local v147 = AAData["Yaw Offset " .. v145]:get();
        if v89:get() == "Left" then
            v147 = v147 - 90;
        elseif v89:get() == "Right" then
            v147 = v147 + 90;
        end;
        if globals.choked_commands ~= 0 then
            return;
        else
            v141 = v141 + 1;
            local v148 = AAData["Tick Modes " .. v145]:get();
            local function v151()
                -- upvalues: v142 (ref), v146 (ref), v147 (ref), v145 (ref), v97 (ref)
                local v149 = v142 and -v146 + v147 or v146 + v147;
                local v150 = 0;
                if AAData["Yaw " .. v145]:get() == "L-R Add" then
                    if v142 then
                        v150 = v149 + AAData["Yaw Right " .. v145]:get() + yawAddOptionR;
                    else
                        v150 = v149 + AAData["Yaw Left " .. v145]:get() + yawAddOptionL;
                    end;
                else
                    v150 = v149 + v150;
                end;
                v97.YawOffset:override(v150);
                v142 = not v142;
                if AAData["Body Yaw Options " .. v145]:get("Jitter") and AAData["Body Yaw Options " .. v145]:get("Randomize Jitter") ~= true then
                    v97.DesyncInverter:override(v142);
                elseif AAData["Body Yaw Options " .. v145]:get("Randomize Jitter") and AAData["Body Yaw Options " .. v145]:get("Jitter") then
                    v97.DesyncInverter:override(math.random(0, 1) == 1);
                else
                    v97.DesyncInverter:override(AAData["Inverter " .. v145]:get());
                end;
            end;
            if v148 == "Randomize Ticks" then
                if v141 % math.random(1, AAData["Skip Ticks " .. v145]:get()) == 0 then
                    v151();
                end;
            elseif v148 == "Switch Ticks" then
                local v152 = AAData["Delay Ticks " .. v145]:get();
                if v141 % v152 == v152 - 1 then
                    v143 = not v143;
                end;
                local v153 = v143 and AAData["Switch One " .. v145]:get() or AAData["Switch Two " .. v145]:get();
                if v141 % v153 == 0 then
                    v151();
                end;
            elseif v141 % AAData["Skip Ticks " .. v145]:get() == 0 then
                v151();
            end;
            return;
        end;
    end;
end;
local v155 = 0;
local v156 = false;
local function v158()
    -- upvalues: v155 (ref), v130 (ref), v156 (ref)
    v155 = v155 + 1;
    local v157 = v130();
    if AAData["Yaw Options " .. v157]:get() == "Off" then
        yawAddOptionL = 0;
        yawAddOptionR = 0;
    end;
    if AAData["Yaw Options " .. v157]:get() == "Modify Tick" then
        if v155 % AAData["Modify Tick Delay " .. v157]:get() == 0 then
            v156 = not v156;
        end;
        if v156 then
            yawAddOptionL = AAData["Custom L-R Left " .. v157]:get();
            yawAddOptionR = AAData["Custom L-R Right " .. v157]:get();
        else
            yawAddOptionL = 0;
            yawAddOptionR = 0;
        end;
    elseif AAData["Yaw Options " .. v157]:get() == "Randomize" and v155 % AAData["Modify Tick Delay " .. v157]:get() == 0 then
        yawAddOptionL = math.random(-AAData["Custom L-R Offset " .. v157]:get(), 0);
        yawAddOptionR = math.random(0, AAData["Custom L-R Offset " .. v157]:get());
    end;
end;
local function v162(v159)
    -- upvalues: v46 (ref)
    if v46:get() then
        local v160 = entity.get_local_player();
        if v160 == nil then
            return;
        elseif v160.m_MoveType ~= 9 then
            return;
        else
            local l_x_0 = render.camera_angles().x;
            if v159.forwardmove > 0 then
                if l_x_0 < 45 then
                    v159.view_angles.x = 89;
                    v159.in_moveright = 1;
                    v159.in_moveleft = 0;
                    v159.in_forward = 0;
                    v159.in_back = 1;
                    if v159.sidemove == 0 then
                        v159.view_angles.y = v159.view_angles.y + 90;
                    elseif v159.sidemove < 0 then
                        v159.view_angles.y = v159.view_angles.y + 150;
                    elseif v159.sidemove > 0 then
                        v159.view_angles.y = v159.view_angles.y + 30;
                    end;
                end;
            elseif v159.forwardmove < 0 then
                v159.view_angles.x = 89;
                v159.in_moveleft = 1;
                v159.in_moveright = 0;
                v159.in_forward = 1;
                v159.in_back = 0;
                if v159.sidemove == 0 then
                    v159.view_angles.y = v159.view_angles.y + 90;
                elseif v159.sidemove > 0 then
                    v159.view_angles.y = v159.view_angles.y + 150;
                elseif v159.sidemove < 0 then
                    v159.view_angles.y = v159.view_angles.y + 30;
                end;
            end;
        end;
    end;
end;
nadeThrowFix = function(v163)
    local v164 = entity.get_local_player();
    if not v164 then
        return;
    elseif not v164:is_alive() then
        return;
    else
        local v165 = v164:get_player_weapon();
        if v165 == nil then
            return;
        else
            local v166 = v165:get_classname();
            local l_m_fThrowTime_0 = v165.m_fThrowTime;
            if l_m_fThrowTime_0 ~= nil and l_m_fThrowTime_0 ~= 0 then
                rage.exploit:allow_defensive(false);
            elseif v163.in_attack and string.match(v166, "Grenade") then
                rage.exploit:allow_defensive(false);
            end;
            return;
        end;
    end;
end;
local function v184(v168, v169, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180, v181, v182)
    -- upvalues: v97 (ref), v89 (ref), v96 (ref), v95 (ref), v94 (ref)
    LocalPlayer = entity.get_local_player();
    local v183 = LocalPlayer.m_flPoseParameter[11] * 120 - 64 <= 0;
    v97.Pitch:override(v168);
    v97.YawBase:override(v169);
    if v89:get() == "Left" then
        YawValue = -90;
    elseif v89:get() == "Right" then
        YawValue = 90;
    else
        YawValue = 0;
    end;
    if v172 ~= "Tick Jitter" then
        if v170 == "L-R Add" then
            if v183 then
                v97.Yaw:override("Backward");
                v97.YawOffset:override(v171 + v180 + yawAddOptionR + YawValue);
            else
                v97.Yaw:override("Backward");
                v97.YawOffset:override(v171 + v181 + yawAddOptionL + YawValue);
            end;
        else
            v97.Yaw:override(v170);
            v97.YawOffset:override(v171);
            v97.DesyncInverter:override(v178);
        end;
    else
        v97.Yaw:override(v170);
    end;
    if v172 == "Tick Jitter" then
        v97.FakeOptions:override("");
    else
        v97.FakeOptions:override(v175);
        v97.YawModifier:override(v172);
        v97.YawModifierValue:override(v173);
    end;
    v97.Desync:override(v174);
    v97.DesyncRightLimit:override(v177);
    v97.DesyncLeftLimit:override(v176);
    v97.DesyncFreestanding:override(v179);
    if v182 then
        if v89:get() == "Left" or v89:get() == "Right" and v96:get() then
            v97.Freestanding:override();
            v97.FreestandingBody:override();
            v97.FreestandingYawMod:override();
        else
            v97.Freestanding:override(v182);
            v97.FreestandingBody:override(v95:get());
            v97.FreestandingYawMod:override(v94:get());
        end;
    else
        v97.Freestanding:override();
        v97.FreestandingBody:override();
        v97.FreestandingYawMod:override();
    end;
end;
local function v186()
    -- upvalues: v60 (ref), v97 (ref), v130 (ref), v184 (ref), v92 (ref)
    if v60:get() then
        v97.AAOn:override(true);
        local v185 = v130();
        if AAData["On " .. v185]:get() then
            v184(AAData["Pitch " .. v185]:get(), AAData["Yaw Base " .. v185]:get(), AAData["Yaw " .. v185]:get(), AAData["Yaw Offset " .. v185]:get(), AAData["Yaw Jitter " .. v185]:get(), AAData["Yaw Jitter Offset " .. v185]:get(), AAData["Body Yaw " .. v185]:get(), AAData["Body Yaw Options " .. v185]:get(), AAData["Fake Left " .. v185]:get(), AAData["Fake Right " .. v185]:get(), AAData["Inverter " .. v185]:get(), AAData["Fake Freestanding " .. v185]:get(), AAData["Yaw Right " .. v185]:get(), AAData["Yaw Left " .. v185]:get(), v92:get());
        elseif AAData["On " .. "Global"]:get() then
            v184(AAData["Pitch Global"]:get(), AAData["Yaw Base Global"]:get(), AAData["Yaw Global"]:get(), AAData["Yaw Offset Global"]:get(), AAData["Yaw Jitter Global"]:get(), AAData["Yaw Jitter Offset Global"]:get(), AAData["Body Yaw Global"]:get(), AAData["Body Yaw Options Global"]:get(), AAData["Fake Left Global"]:get(), AAData["Fake Right Global"]:get(), AAData["Inverter Global"]:get(), AAData["Fake Freestanding Global"]:get(), AAData["Yaw Right Global"]:get(), AAData["Yaw Left Global"]:get(), v92:get());
        end;
    end;
end;
local function v191()
    -- upvalues: v184 (ref)
    local v187 = {
        [1] = "Disabled", 
        [2] = "Down"
    };
    local l_curtime_0 = globals.curtime;
    local v189 = 1500;
    local v190 = l_curtime_0 % (360 / v189) * v189;
    v184(v187[1], "Local View", "Backwards", v190, "Off", 0, false, AAData["Body Yaw Options Global"]:get(), 0, 0, false, "Off", 0, 0);
end;
forceDefensive = function()
    -- upvalues: v88 (ref), v130 (ref), v97 (ref)
    if v88:get(v130()) then
        v97.LagOptions:override("Always On");
    else
        v97.LagOptions:override();
    end;
end;
local function v193()
    -- upvalues: v57 (ref)
    local v192 = v57:get();
    cvar.r_aspectratio:float(v192 / 100);
end;
local function v197(v194, v195, v196)
    return v194 - (v194 - v195) * v196;
end;
local v198 = 0;
start_x = v99.x / 2;
start_y = v99.y / 2;
local function v204()
    -- upvalues: v32 (ref), v198 (ref), v197 (ref)
    if not v32:get() then
        return;
    else
        local v199 = entity.get_local_player();
        if not v199 then
            return;
        else
            local l_m_flVelocityModifier_0 = v199.m_flVelocityModifier;
            local v201 = math.floor(l_m_flVelocityModifier_0 * (render.screen_size().x / 15));
            local v202 = math.floor(l_m_flVelocityModifier_0 * 100);
            local v203 = render.measure_text(1, nil, "Velocity " .. v202 .. "%");
            if ui.get_alpha() > 0.5 then
                v198 = v197(v198, ui.get_alpha() > 0.5 and 1 or 0, 10 * globals.frametime);
            elseif v202 ~= 100 and ui.get_alpha() < 0.5 then
                v198 = v197(v198, v202 ~= 100 and ui.get_alpha() < 0.5 and 1 or 0, 10 * globals.frametime);
            elseif v202 == 100 and ui.get_alpha() < 0.5 then
                v198 = v197(v198, v202 == 100 and 0 or 1, 10 * globals.frametime);
            elseif not v199:is_alive() and ui.get_alpha() < 0.5 then
                v198 = v197(v198, v199:is_alive() and 1 or 0, 10 * globals.frametime);
            end;
            position = {
                [1] = render.screen_size().x - render.screen_size().x / 15, 
                [2] = render.screen_size().y + render.screen_size().y
            };
            render.text(4, vector(start_x - v203.x / 2, start_y - 16 - 200), color(255, 255, 255, 255 * v198), nil, "Velocity " .. v202 .. "%");
            render.shadow(vector(start_x - 64, start_y - 2 - 200), vector(start_x - 64 + v201, start_y + 2 - 200), color(255, 255, 255, 255 * v198), render.screen_size().y / 20 / 2, 3);
            render.rect(vector(start_x - 64, start_y - 2 - 200), vector(start_x - 64 + v201, start_y + 2 - 200), color(255, 255, 255, 255 * v198), 3);
            return;
        end;
    end;
end;
local v205 = render.load_font("Bahnschrift", 10, "ad");
local function v217()
    -- upvalues: v27 (ref), v97 (ref), v28 (ref), v31 (ref), v30 (ref), v205 (ref)
    if v27:get() then
        if entity.get_local_player() == nil then
            return;
        else
            local v206 = ui.get_binds();
            local v207 = v97.MinDmg:get();
            local v208 = render.screen_size().x / 2;
            local v209 = render.screen_size().y / 2;
            local _ = render.measure_text(2, nil, v207);
            local v211 = v208 + 5;
            local v212 = v209 - 16;
            local v213 = v28:get();
            local v214 = color(v213.r, v213.g, v213.b, v213.a);
            if v31:get() == "Clean" then
                if v30:get() then
                    render.text(v205, vector(v211, v212), v214, nil, v207);
                else
                    for v215 in pairs(v206) do
                        if v206[v215].name == "Min. Damage" and v206[v215].active then
                            render.text(v205, vector(v211, v212), v214, nil, v207);
                            break;
                        end;
                    end;
                end;
            elseif v30:get() then
                render.text(2, vector(v211, v212), v214, nil, v207);
            else
                for v216 in pairs(v206) do
                    if v206[v216].name == "Min. Damage" and v206[v216].active then
                        render.text(2, vector(v211, v212), v214, nil, v207);
                        break;
                    end;
                end;
            end;
        end;
    end;
end;
local function v218()
    -- upvalues: v50 (ref), v52 (ref), v53 (ref), v54 (ref), v55 (ref)
    if v50:get() then
        cvar.viewmodel_fov:int(v52:get(), true);
        cvar.viewmodel_offset_x:float(v53:get(), true);
        cvar.viewmodel_offset_y:float(v54:get(), true);
        cvar.viewmodel_offset_z:float(v55:get(), true);
    else
        cvar.viewmodel_fov:int(68);
        cvar.viewmodel_offset_x:float(2.5);
        cvar.viewmodel_offset_y:float(0);
        cvar.viewmodel_offset_z:float(-1.5);
    end;
end;
local function v225()
    -- upvalues: v22 (ref), v97 (ref), v25 (ref), v26 (ref), v24 (ref), v99 (ref)
    if v22:get() then
        if entity.get_local_player() == nil then
            return;
        elseif entity.get_local_player().m_bIsScoped then
            v97.RemoveScope:set("Remove All");
            local v219 = v25:get();
            local v220 = v26:get();
            local v221 = v24:get();
            local v222 = 1;
            local v223 = v99.x / 2;
            local v224 = v99.y / 2;
            render.gradient(vector(v223 - v219, v224), vector(v223 - v220 + -v219, v224 + v222), v221, color(v221.r, v221.g, v221.b, v221.a - 200), v221, color(v221.r, v221.g, v221.b, v221.a - 250));
            render.gradient(vector(v223 + v219, v224), vector(v223 + v220 + v219, v224 + v222), v221, color(v221.r, v221.g, v221.b, v221.a - 200), v221, color(v221.r, v221.g, v221.b, v221.a - 250));
            render.gradient(vector(v223, v224 + v219), vector(v223 + v222, v224 + v220 + v219), v221, v221, color(v221.r, v221.g, v221.b, v221.a - 200), color(v221.r, v221.g, v221.b, v221.a - 250));
            render.gradient(vector(v223, v224 - v219), vector(v223 + v222, v224 - v220 + -v219), v221, v221, color(v221.r, v221.g, v221.b, v221.a - 200), color(v221.r, v221.g, v221.b, v221.a - 250));
        end;
    end;
end;
local v226 = render.load_font("Verdana", 12, "abd");
local _ = 127;
local v228 = 0.15;
local _ = 8;
local _ = render.measure_text(v226, " ");
local function v278()
    -- upvalues: v35 (ref), v37 (ref), v226 (ref), v33 (ref), v36 (ref), v228 (ref)
    local v231 = "N E B U L A" .. (v35:get() and " [Debug]" or "");
    local v232 = v37:get();
    local v233 = #v231;
    local l_realtime_0 = globals.realtime;
    local v235 = render.screen_size().x or 1920;
    local v236 = render.screen_size().y or 1080;
    local v237 = 0;
    for v238 = 1, v233 do
        local v239 = v231:sub(v238, v238);
        v237 = v237 + render.measure_text(v226, nil, v239).x + 1;
    end;
    local v240 = nil;
    local v241 = nil;
    if v33:get() == "Left" then
        v240 = 19;
        v241 = v236 / 2;
    elseif v33:get() == "Right" then
        v240 = v235 - v237 - 19;
        v241 = v236 / 2;
    else
        v240 = (v235 - v237) / 2;
        v241 = v236 - 25;
    end;
    local l_v240_0 = v240;
    if v36:get() == "Static" then
        for v243 = 1, v233 do
            local v244 = v231:sub(v243, v243);
            local v245 = render.measure_text(v226, nil, v244);
            local v246 = vector(l_v240_0, v241);
            render.text(v226, v246, v232, nil, v244);
            l_v240_0 = l_v240_0 + v245.x + 1;
        end;
    elseif v36:get() == "Wave" then
        for v247 = 1, v233 do
            local v248 = v231:sub(v247, v247);
            local v249 = render.measure_text(v226, nil, v248);
            local v250 = vector(l_v240_0, v241);
            local v251 = v247 * v228 + l_realtime_0 * 2;
            local v252 = 0.6 + 0.5 * math.sin(v251);
            local v253 = v232.r * v252;
            local v254 = v232.g * v252;
            local v255 = v232.b * v252;
            render.text(v226, v250, color(v253, v254, v255, 255), nil, v248);
            l_v240_0 = l_v240_0 + v249.x + 1;
        end;
    elseif v36:get() == "Pulse" then
        local v256 = 2;
        local v257 = 0.3;
        local v258 = 1;
        for v259 = 1, v233 do
            local v260 = v231:sub(v259, v259);
            local v261 = render.measure_text(v226, nil, v260);
            local v262 = vector(l_v240_0, v241);
            local v263 = (math.sin(l_realtime_0 * v256) + 1) / 2;
            v263 = v257 + (v258 - v257) * v263;
            local v264 = math.floor(v232.r * v263);
            local v265 = math.floor(v232.g * v263);
            local v266 = math.floor(v232.b * v263);
            render.text(v226, v262, color(v264, v265, v266, 255), nil, v260);
            l_v240_0 = l_v240_0 + v261.x + 1;
        end;
    elseif v36:get() == "Middle Wave" then
        local v267 = #v231;
        local v268 = math.floor(v267 / 2);
        for v269 = 1, v267 do
            local v270 = v231:sub(v269, v269);
            local v271 = render.measure_text(v226, nil, v270);
            local v272 = vector(l_v240_0, v241);
            local v273 = math.abs(v269 - v268) * v228 + l_realtime_0 * 2;
            local v274 = 0.6 + 0.5 * math.sin(v273);
            local v275 = math.floor(math.max(v232.r * v274, v232.r * 0.2));
            local v276 = math.floor(math.max(v232.g * v274, v232.g * 0.2));
            local v277 = math.floor(math.max(v232.b * v274, v232.b * 0.2));
            render.text(v226, v272, color(v275, v276, v277, 255), nil, v270);
            l_v240_0 = l_v240_0 + v271.x + 1;
        end;
    end;
end;
local v279 = {};
local v280 = 3;
local v281 = 0.5;
local v282 = 38;
local function v285(v283, v284)
    -- upvalues: v279 (ref)
    table.insert(v279, {
        alpha = 1, 
        text = v283, 
        color = v284, 
        time = globals.realtime
    });
end;
local function v303()
    -- upvalues: v39 (ref), v279 (ref), v280 (ref), v281 (ref), v282 (ref), v41 (ref), v42 (ref)
    if not v39:get() then
        return;
    else
        local v286 = render.screen_size();
        local v287 = v286.y - 100;
        local l_realtime_1 = globals.realtime;
        for v289 = #v279, 1, -1 do
            local v290 = v279[v289];
            local v291 = l_realtime_1 - v290.time;
            if v280 < v291 then
                table.remove(v279, v289);
            else
                if v280 - v281 < v291 then
                    v290.alpha = 1 - (v291 - (v280 - v281)) / v281;
                end;
                local v292 = render.measure_text(4, nil, v290.text);
                local v293 = v286.x / 2 - v292.x / 2;
                local v294 = v287 + (v289 - 1) * v282;
                local v295 = v41:get();
                local v296 = v42:get();
                local v297 = v295.a * v290.alpha;
                local v298 = 10;
                local v299 = v292.x + v298 * 2;
                local v300 = 25;
                local v301 = v293 - v298;
                local v302 = v294 - 5;
                render.shadow(vector(v301, v302), vector(v301 + v299, v302 + v300), color(v295.r, v295.g, v295.b, v297), 25, 0, 5);
                render.rect(vector(v301, v302), vector(v301 + v299, v302 + v300), color(40, 40, 40, 200 * v290.alpha), 5);
                render.text(1, vector(v293, v294), color(v296.r, v296.g, v296.b, 50 * v290.alpha), nil, v290.text);
                render.text(1, vector(v293, v294), color(v296.r, v296.g, v296.b, v296.a * v290.alpha), nil, v290.text);
            end;
        end;
        return;
    end;
end;
local v304 = 0;
local v305 = 3;
local v306 = 0;
local v307 = nil;
local v308 = render.load_font("Segoe UI", 19, "d");
local function v312()
    -- upvalues: v38 (ref), v304 (ref), v307 (ref), v44 (ref), v308 (ref), v306 (ref), v305 (ref)
    if v38:get() then
        if v304 <= 0 or not v307 then
            return;
        else
            local v309 = v44:get();
            local v310 = color(v309.r, v309.g, v309.b, v304);
            render.text(v308, render.world_to_screen(v307), v310, "c", "+");
            local v311 = globals.curtime - v306;
            if v305 < v311 then
                v304 = 0;
            else
                v304 = 255 * (1 - v311 / v305);
            end;
        end;
    end;
end;
local function v319(v313)
    -- upvalues: v19 (ref), v20 (ref), v21 (ref), v43 (ref), v42 (ref), v17 (ref), v98 (ref), v39 (ref), v285 (ref)
    local v314 = v19:get():to_hex();
    local v315 = v20:get():to_hex();
    local v316 = v21:get():to_hex();
    local v317 = v43:get():to_hex();
    local v318 = v42:get():to_hex();
    if v17:get("Console") then
        if v313.state == nil then
            if v98[v313.hitgroup] ~= v98[v313.wanted_hitgroup] and v313.damage < v313.wanted_damage then
                print_raw("\a" .. v314 .. "[NEBULA]\aFFFFFFFF Missmatched Shot At " .. entity.get(v313.target):get_name() .. "'s " .. "\a" .. v315 .. v98[v313.hitgroup] .. "(" .. v98[v313.wanted_hitgroup] .. ")" .. "\aFFFFFFFF" .. " For " .. "\a" .. v315 .. v313.damage .. "(" .. v313.wanted_damage .. ")" .. "\aFFFFFFFF" .. " Bt: " .. "\a" .. v315 .. v313.backtrack);
            elseif v98[v313.hitgroup] == v98[v313.wanted_hitgroup] and v313.damage < v313.wanted_damage then
                print_raw("\a" .. v314 .. "[NEBULA]\aFFFFFFFF Missmatched Shot At " .. entity.get(v313.target):get_name() .. "'s " .. "\a" .. v316 .. v98[v313.hitgroup] .. "(" .. v98[v313.wanted_hitgroup] .. ")" .. "\aFFFFFFFF" .. " For " .. "\a" .. v315 .. v313.damage .. "(" .. v313.wanted_damage .. ")" .. "\aFFFFFFFF" .. " Bt: " .. "\a" .. v316 .. v313.backtrack);
            elseif v98[v313.hitgroup] ~= v98[v313.wanted_hitgroup] and v313.damage >= v313.wanted_damage then
                print_raw("\a" .. v314 .. "[NEBULA]\aFFFFFFFF Missmatched Shot At " .. entity.get(v313.target):get_name() .. "'s " .. "\a" .. v315 .. v98[v313.hitgroup] .. "(" .. v98[v313.wanted_hitgroup] .. ")" .. "\aFFFFFFFF" .. " For " .. "\a" .. v316 .. v313.damage .. "(" .. v313.wanted_damage .. ")" .. "\aFFFFFFFF" .. " Bt: " .. "\a" .. v316 .. v313.backtrack);
            else
                print_raw("\a" .. v314 .. "[NEBULA]\aFFFFFFFF Registered Shot At " .. entity.get(v313.target):get_name() .. "'s " .. "\a" .. v316 .. v98[v313.hitgroup] .. "(" .. v98[v313.wanted_hitgroup] .. ")" .. "\aFFFFFFFF" .. " For " .. "\a" .. v316 .. v313.damage .. "(" .. v313.wanted_damage .. ")" .. "\aFFFFFFFF" .. " Bt: " .. "\a" .. v316 .. v313.backtrack);
            end;
        else
            print_raw("\a" .. v314 .. "[NEBULA]\aFFFFFFFF Missed Shot At " .. entity.get(v313.target):get_name() .. "'s " .. "\a" .. v315 .. v98[v313.wanted_hitgroup] .. "\aFFFFFFFF" .. " For " .. "\a" .. v315 .. v313.wanted_damage .. "\aFFFFFFFF" .. " Bt: " .. "\a" .. v315 .. v313.backtrack .. "\aFFFFFFFF" .. " Due To \a" .. v315 .. v313.state);
        end;
    end;
    if v17:get("Top-Left") then
        if v313.state == nil then
            if v98[v313.hitgroup] ~= v98[v313.wanted_hitgroup] and v313.damage < v313.wanted_damage then
                print_dev("\a" .. v314 .. "[NEBULA]\aFFFFFFFF Missmatched Shot At " .. entity.get(v313.target):get_name() .. "'s " .. "\a" .. v315 .. v98[v313.hitgroup] .. "(" .. v98[v313.wanted_hitgroup] .. ")" .. "\aFFFFFFFF" .. " For " .. "\a" .. v315 .. v313.damage .. "(" .. v313.wanted_damage .. ")" .. "\aFFFFFFFF" .. " Bt: " .. "\a" .. v315 .. v313.backtrack);
            elseif v98[v313.hitgroup] == v98[v313.wanted_hitgroup] and v313.damage < v313.wanted_damage then
                print_dev("\a" .. v314 .. "[NEBULA]\aFFFFFFFF Missmatched Shot At " .. entity.get(v313.target):get_name() .. "'s " .. "\a" .. v316 .. v98[v313.hitgroup] .. "(" .. v98[v313.wanted_hitgroup] .. ")" .. "\aFFFFFFFF" .. " For " .. "\a" .. v315 .. v313.damage .. "(" .. v313.wanted_damage .. ")" .. "\aFFFFFFFF" .. " Bt: " .. "\a" .. v316 .. v313.backtrack);
            elseif v98[v313.hitgroup] ~= v98[v313.wanted_hitgroup] and v313.damage >= v313.wanted_damage then
                print_dev("\a" .. v314 .. "[NEBULA]\aFFFFFFFF Missmatched Shot At " .. entity.get(v313.target):get_name() .. "'s " .. "\a" .. v315 .. v98[v313.hitgroup] .. "(" .. v98[v313.wanted_hitgroup] .. ")" .. "\aFFFFFFFF" .. " For " .. "\a" .. v316 .. v313.damage .. "(" .. v313.wanted_damage .. ")" .. "\aFFFFFFFF" .. " Bt: " .. "\a" .. v316 .. v313.backtrack);
            else
                print_dev("\a" .. v314 .. "[NEBULA]\aFFFFFFFF Registered Shot At " .. entity.get(v313.target):get_name() .. "'s " .. "\a" .. v316 .. v98[v313.hitgroup] .. "(" .. v98[v313.wanted_hitgroup] .. ")" .. "\aFFFFFFFF" .. " For " .. "\a" .. v316 .. v313.damage .. "(" .. v313.wanted_damage .. ")" .. "\aFFFFFFFF" .. " Bt: " .. "\a" .. v316 .. v313.backtrack);
            end;
        else
            print_dev("\a" .. v314 .. "[NEBULA]\aFFFFFFFF Missed Shot At " .. entity.get(v313.target):get_name() .. "'s " .. "\a" .. v315 .. v98[v313.wanted_hitgroup] .. "\aFFFFFFFF" .. " For " .. "\a" .. v315 .. v313.wanted_damage .. "\aFFFFFFFF" .. " Bt: " .. "\a" .. v315 .. v313.backtrack .. "\aFFFFFFFF" .. " Due To \a" .. v315 .. v313.state);
        end;
    end;
    if v39:get() then
        if v313.state == nil then
            if v98[v313.hitgroup] ~= v98[v313.wanted_hitgroup] or v313.damage < v313.wanted_damage then
                v285("\a" .. v317 .. "[NEBULA]" .. "\a" .. v318 .. " Missmatched Shot At " .. entity.get(v313.target):get_name() .. "'s " .. "\a" .. v317 .. v98[v313.hitgroup] .. "(" .. v98[v313.wanted_hitgroup] .. ")" .. "\a" .. v318 .. " For " .. "\a" .. v317 .. v313.damage .. "(" .. v313.wanted_damage .. ")" .. "\a" .. v318 .. " Bt: " .. "\a" .. v317 .. v313.backtrack);
            else
                v285("\a" .. v317 .. "[NEBULA]" .. "\a" .. v318 .. " Registered Shot At " .. entity.get(v313.target):get_name() .. "'s " .. "\a" .. v317 .. v98[v313.hitgroup] .. "(" .. v98[v313.wanted_hitgroup] .. ")" .. "\a" .. v318 .. " For " .. "\a" .. v317 .. v313.damage .. "(" .. v313.wanted_damage .. ")" .. "\a" .. v318 .. " Bt: " .. "\a" .. v317 .. v313.backtrack);
            end;
        else
            v285("\a" .. v317 .. "[NEBULA]" .. "\a" .. v318 .. " Missed Shot At " .. entity.get(v313.target):get_name() .. "'s " .. "\a" .. v317 .. v98[v313.wanted_hitgroup] .. "\a" .. v318 .. " For " .. "\a" .. v317 .. v313.wanted_damage .. "\a" .. v318 .. " Bt: " .. "\a" .. v317 .. v313.backtrack .. "\a" .. v318 .. " Due To \a" .. v317 .. v313.state);
        end;
    end;
end;
local function v332(v320)
    local v321 = math.pi * 2;
    local v322 = v321 / 8;
    local l_x_1 = entity.get_local_player().m_vecOrigin.x;
    local l_y_0 = entity.get_local_player().m_vecOrigin.y;
    local l_z_0 = entity.get_local_player().m_vecOrigin.z;
    for v326 = 0, v321, v322 do
        local v327 = 10 * math.cos(v326) + l_x_1;
        local v328 = 10 * math.sin(v326) + l_y_0;
        local v329 = utils.trace_line(vector(v327, v328, l_z_0), vector(v327, v328, l_z_0 - v320), entity.get_local_player());
        local l_fraction_0 = v329.fraction;
        local _ = v329.entity;
        if l_fraction_0 ~= 1 then
            return true;
        end;
    end;
    return false;
end;
local function v334(v333)
    -- upvalues: v91 (ref), v332 (ref)
    if not v91:get() then
        return;
    else
        self = entity.get_local_player();
        if self == nil then
            return;
        else
            if self.m_vecVelocity.z >= -500 then
                no_fall_damage = false;
            elseif v332(15) then
                no_fall_damage = false;
            elseif v332(75) then
                no_fall_damage = true;
            end;
            if v91:get() and self.m_vecVelocity.z < -500 then
                if no_fall_damage then
                    v333.in_duck = 1;
                else
                    v333.in_duck = 0;
                end;
            end;
            return;
        end;
    end;
end;
local v335 = {
    [1] = "n", 
    [2] = "ne", 
    [3] = "neb", 
    [4] = "neb\195\187", 
    [5] = "nebul", 
    [6] = "nebula", 
    [7] = "nebula", 
    [8] = "nebula", 
    [9] = "nebul", 
    [10] = "neb\195\187", 
    [11] = "neb", 
    [12] = "ne", 
    [13] = "n", 
    [14] = " ", 
    [15] = " ", 
    [16] = " "
};
clanTag = function()
    -- upvalues: v48 (ref), v335 (ref)
    if v48:get() then
        if entity.get_local_player() == nil then
            return;
        else
            local v336 = math.floor((globals.tickcount + utils.net_channel().latency[0]) / 20) % #v335 + 1;
            if v336 ~= last then
                common.set_clan_tag(v335[v336]);
                last = v336;
            end;
        end;
    end;
end;
v64:set_callback(function()
    -- upvalues: v63 (ref), l_base64_0 (ref)
    local v337 = v63:get();
    print_dev(v337);
    if v337 == 1 then
        loadConfig(l_base64_0.decode("IGZhbHNlIERpc2FibGVkIEJhY2t3YXJkIExvY2FsLVZpZXcgMCAwIDAgRGlzYWJsZWQgMCB0cnVlIGZhbHNlIDYwIDYwIHRydWUgZmFsc2UgZmFsc2UgdHJ1ZSBPZmYgMSBPZmYgMSAxIDEgT2ZmIDEgMCAwIDAgdHJ1ZSBEb3duIEwtUi1BZGQgQXQtVGFyZ2V0IC0zNSAzNSAzIFRpY2stSml0dGVyIDQgdHJ1ZSBmYWxzZSA2MCA2MCBmYWxzZSB0cnVlIGZhbHNlIGZhbHNlIE9mZiA1IFN3aXRjaC1UaWNrcyA1IDEgNiBPZmYgMSAwIDAgMCB0cnVlIERvd24gTC1SLUFkZCBMb2NhbC1WaWV3IC0yMSA0MSAwIFRpY2stSml0dGVyIC01IHRydWUgZmFsc2UgNjAgNjAgZmFsc2UgdHJ1ZSBmYWxzZSBmYWxzZSBPZmYgMSBTd2l0Y2gtVGlja3MgNiA2IDIgUmFuZG9taXplIDEgMCAwIDcgdHJ1ZSBEb3duIEwtUi1BZGQgQXQtVGFyZ2V0IC0yMSA0MiAwIFRpY2stSml0dGVyIC0zIHRydWUgdHJ1ZSA2MCA2MCBmYWxzZSB0cnVlIGZhbHNlIHRydWUgT2ZmIDUgU3dpdGNoLVRpY2tzIDggNSAxIFJhbmRvbWl6ZSA0IDggLTUgNCB0cnVlIERvd24gTC1SLUFkZCBBdC1UYXJnZXQgLTE5IDQxIDAgVGljay1KaXR0ZXIgLTIgdHJ1ZSBmYWxzZSA2MCA2MCBmYWxzZSB0cnVlIGZhbHNlIGZhbHNlIE9mZiA0IFN3aXRjaC1UaWNrcyA1IDMgMSBSYW5kb21pemUgNiA0IC0yIDMgdHJ1ZSBEb3duIEwtUi1BZGQgQXQtVGFyZ2V0IC0xOSA0MiAwIFRpY2stSml0dGVyIC0yIHRydWUgZmFsc2UgNjAgNjAgZmFsc2UgdHJ1ZSBmYWxzZSBmYWxzZSBPZmYgMyBTd2l0Y2gtVGlja3MgNSA0IDEgUmFuZG9taXplIDcgLTEwIDExIDIgdHJ1ZSBEb3duIEwtUi1BZGQgQXQtVGFyZ2V0IC0yMyAyNiAyIFRpY2stSml0dGVyIC0zIHRydWUgdHJ1ZSA2MCA2MCBmYWxzZSB0cnVlIGZhbHNlIGZhbHNlIE9mZiAyIFN3aXRjaC1UaWNrcyA1IDEgMyBPZmYgMSAwIDAgMCB0cnVlIERvd24gTC1SLUFkZCBBdC1UYXJnZXQgLTIyIDM4IDAgVGljay1KaXR0ZXIgLTMgdHJ1ZSBmYWxzZSA1OCA1OSBmYWxzZSB0cnVlIGZhbHNlIGZhbHNlIE9mZiA0IFN3aXRjaC1UaWNrcyA0IDMgMiBSYW5kb21pemUgOCAtOCAxMCAy"));
    elseif v337 == 2 then
        loadConfig(l_base64_0.decode("IGZhbHNlIERpc2FibGVkIEJhY2t3YXJkIExvY2FsLVZpZXcgMCAwIDAgRGlzYWJsZWQgMCB0cnVlIGZhbHNlIDYwIDYwIHRydWUgZmFsc2UgZmFsc2UgdHJ1ZSBPZmYgMSBPZmYgMSAxIDEgT2ZmIDEgMCAwIDAgdHJ1ZSBEb3duIEwtUi1BZGQgQXQtVGFyZ2V0IC0zNSAzNSAzIFRpY2stSml0dGVyIDQgdHJ1ZSBmYWxzZSA2MCA2MCBmYWxzZSB0cnVlIGZhbHNlIGZhbHNlIE9mZiA1IFN3aXRjaC1UaWNrcyA1IDEgMyBPZmYgMSAwIDAgMCB0cnVlIERvd24gTC1SLUFkZCBMb2NhbC1WaWV3IC0yMSA2MiAwIFRpY2stSml0dGVyIC01IHRydWUgZmFsc2UgNjAgNjAgZmFsc2UgdHJ1ZSBmYWxzZSBmYWxzZSBPZmYgMSBTd2l0Y2gtVGlja3MgNiA2IDIgT2ZmIDEgMCAwIDAgdHJ1ZSBEb3duIEwtUi1BZGQgQXQtVGFyZ2V0IC0yMSA0MiAwIFRpY2stSml0dGVyIC0zIHRydWUgdHJ1ZSA2MCA2MCBmYWxzZSB0cnVlIGZhbHNlIGZhbHNlIE9mZiA1IFN3aXRjaC1UaWNrcyA4IDUgMSBSYW5kb21pemUgNCAtMTcgMjMgNCB0cnVlIERvd24gTC1SLUFkZCBBdC1UYXJnZXQgLTE5IDQzIDAgVGljay1KaXR0ZXIgLTEgdHJ1ZSBmYWxzZSA2MCA2MCBmYWxzZSB0cnVlIGZhbHNlIGZhbHNlIE9mZiAyIFJhbmRvbWl6ZS1UaWNrcyA1IDQgMSBPZmYgNiA0IC0yIDIgdHJ1ZSBEb3duIEwtUi1BZGQgQXQtVGFyZ2V0IC0yNiAzNiAzIFRpY2stSml0dGVyIC0yIHRydWUgdHJ1ZSA2MCA2MCBmYWxzZSB0cnVlIGZhbHNlIGZhbHNlIE9mZiAyIFJhbmRvbWl6ZS1UaWNrcyA1IDIgNSBSYW5kb21pemUgNyAtMTAgMTEgNSB0cnVlIERvd24gTC1SLUFkZCBBdC1UYXJnZXQgLTIzIDI2IDIgVGljay1KaXR0ZXIgLTMgdHJ1ZSB0cnVlIDYwIDYwIGZhbHNlIHRydWUgZmFsc2UgZmFsc2UgT2ZmIDIgU3dpdGNoLVRpY2tzIDcgMSAzIE9mZiAxIDAgMCAwIHRydWUgRG93biBMLVItQWRkIEF0LVRhcmdldCAtMzIgMzUgMTQgVGljay1KaXR0ZXIgLTIgdHJ1ZSBmYWxzZSA2MCA2MCBmYWxzZSB0cnVlIGZhbHNlIGZhbHNlIE9mZiAzIFJhbmRvbWl6ZS1UaWNrcyA4IDQgMSBSYW5kb21pemUgOCAtOCAxMCA1"));
    elseif v337 == 3 then
        loadConfig(l_base64_0.decode("IGZhbHNlIERpc2FibGVkIEJhY2t3YXJkIExvY2FsLVZpZXcgMCAwIDAgRGlzYWJsZWQgMCB0cnVlIGZhbHNlIDYwIDYwIHRydWUgZmFsc2UgZmFsc2UgdHJ1ZSBPZmYgMSBPZmYgMSAxIDEgT2ZmIDEgMCAwIDAgdHJ1ZSBEb3duIEwtUi1BZGQgQXQtVGFyZ2V0IC0zNSAzNSAzIFRpY2stSml0dGVyIDQgdHJ1ZSBmYWxzZSA2MCA2MCBmYWxzZSB0cnVlIGZhbHNlIGZhbHNlIE9mZiA1IFN3aXRjaC1UaWNrcyA1IDEgMyBPZmYgMSAwIDAgMCB0cnVlIERvd24gTC1SLUFkZCBMb2NhbC1WaWV3IC0yMSA0MSAwIDMtV2F5IC01IHRydWUgZmFsc2UgNjAgNjAgZmFsc2UgdHJ1ZSBmYWxzZSBmYWxzZSBPZmYgMSBTd2l0Y2gtVGlja3MgNiA2IDIgUmFuZG9taXplIDEgMCAwIDcgdHJ1ZSBEb3duIEwtUi1BZGQgQXQtVGFyZ2V0IC0yMSA0MSAwIFRpY2stSml0dGVyIC0zIHRydWUgdHJ1ZSA2MCA2MCBmYWxzZSB0cnVlIGZhbHNlIHRydWUgT2ZmIDUgU3dpdGNoLVRpY2tzIDggNCAxIFJhbmRvbWl6ZSA0IDggLTUgMiB0cnVlIERvd24gTC1SLUFkZCBBdC1UYXJnZXQgLTIxIDQ0IDAgVGljay1KaXR0ZXIgLTQgdHJ1ZSBmYWxzZSA2MCA2MCBmYWxzZSB0cnVlIGZhbHNlIGZhbHNlIE9mZiA0IFN3aXRjaC1UaWNrcyA2IDQgMSBSYW5kb21pemUgNiA0IC0yIDIgdHJ1ZSBEb3duIEwtUi1BZGQgQXQtVGFyZ2V0IC0xOSA0MiAwIFRpY2stSml0dGVyIC0yIHRydWUgZmFsc2UgNjAgNjAgZmFsc2UgdHJ1ZSBmYWxzZSBmYWxzZSBPZmYgMyBTd2l0Y2gtVGlja3MgNSA0IDEgUmFuZG9taXplIDcgLTEwIDExIDIgdHJ1ZSBEb3duIEwtUi1BZGQgQXQtVGFyZ2V0IC0yMSAyNiAyIFRpY2stSml0dGVyIC0zIHRydWUgdHJ1ZSA2MCA2MCBmYWxzZSB0cnVlIGZhbHNlIGZhbHNlIE9mZiAyIFN3aXRjaC1UaWNrcyA1IDEgMyBPZmYgMSAwIDAgMCB0cnVlIERvd24gTC1SLUFkZCBBdC1UYXJnZXQgLTIyIDQxIDAgVGljay1KaXR0ZXIgLTMgdHJ1ZSBmYWxzZSA1OCA1OSBmYWxzZSB0cnVlIGZhbHNlIGZhbHNlIE9mZiA0IFN3aXRjaC1UaWNrcyA0IDQgMiBSYW5kb21pemUgOCAtOCAxMCAz"));
    end;
end);
uiAntiAimYawOptionsB = function(v338)
    local v339 = AAData["Yaw Options " .. v338]:get();
    AAData["Modify Tick Delay " .. v338]:visibility(v339 == "Modify Tick");
    AAData["Custom L-R Right " .. v338]:visibility(v339 == "Modify Tick");
    AAData["Custom L-R Left " .. v338]:visibility(v339 == "Modify Tick");
    AAData["Custom L-R Offset " .. v338]:visibility(v339 == "Randomize");
end;
for _, v341 in next, v79 do
    uiAntiAimYawOptionsB(v341);
    do
        local l_v341_0 = v341;
        AAData["Yaw Options " .. l_v341_0]:set_callback(function()
            -- upvalues: l_v341_0 (ref)
            uiAntiAimYawOptionsB(l_v341_0);
        end);
    end;
end;
uiAntiAimYawOptions = function(v343)
    local v344 = AAData["Yaw " .. v343]:get();
    local v345 = AAData["Yaw Options " .. v343]:get();
    AAData["Yaw Base " .. v343]:visibility(v344 ~= "Off");
    AAData["Yaw Left " .. v343]:visibility(v344 == "L-R Add");
    AAData["Yaw Right " .. v343]:visibility(v344 == "L-R Add");
    AAData["Yaw Offset " .. v343]:visibility(v344 == "Backward" or v344 == "L-R Add");
    AAData["Yaw Options " .. v343]:visibility(v344 == "L-R Add");
    AAData["Modify Tick Delay " .. v343]:visibility(v345 == "Modify Tick" and v344 == "L-R Add");
    AAData["Custom L-R Right " .. v343]:visibility(v345 == "Modify Tick" and v344 == "L-R Add");
    AAData["Custom L-R Left " .. v343]:visibility(v345 == "Modify Tick" and v344 == "L-R Add");
    AAData["Custom L-R Offset " .. v343]:visibility(v345 == "Randomize" and v344 == "L-R Add");
end;
for _, v347 in next, v79 do
    uiAntiAimYawOptions(v347);
    do
        local l_v347_0 = v347;
        AAData["Yaw " .. l_v347_0]:set_callback(function()
            -- upvalues: l_v347_0 (ref)
            uiAntiAimYawOptions(l_v347_0);
        end);
    end;
end;
uiAntiAimJitterOptions = function(v349)
    local v350 = AAData["Yaw Jitter " .. v349]:get();
    local v351 = AAData["Tick Modes " .. v349]:get();
    AAData["Yaw Jitter Offset " .. v349]:visibility(v350 == "Center" or not (v350 ~= "Offset") or not (v350 ~= "3-Way") or v350 == "Tick Jitter");
    AAData["Skip Ticks " .. v349]:visibility(v350 == "Tick Jitter" and v351 ~= "Switch Ticks");
    AAData["Tick Modes " .. v349]:visibility(v350 == "Tick Jitter");
    AAData["Delay Ticks " .. v349]:visibility(v350 == "Tick Jitter" and v351 == "Switch Ticks");
    AAData["Switch One " .. v349]:visibility(v350 == "Tick Jitter" and v351 == "Switch Ticks");
    AAData["Switch Two " .. v349]:visibility(v350 == "Tick Jitter" and v351 == "Switch Ticks");
end;
for _, v353 in next, v79 do
    uiAntiAimJitterOptions(v353);
    do
        local l_v353_0 = v353;
        AAData["Yaw Jitter " .. l_v353_0]:set_callback(function()
            -- upvalues: l_v353_0 (ref)
            uiAntiAimJitterOptions(l_v353_0);
        end);
    end;
end;
uiTickOptions = function(v355)
    local v356 = AAData["Tick Modes " .. v355]:get();
    AAData["Delay Ticks " .. v355]:visibility(v356 == "Switch Ticks");
    AAData["Switch One " .. v355]:visibility(v356 == "Switch Ticks");
    AAData["Switch Two " .. v355]:visibility(v356 == "Switch Ticks");
    AAData["Skip Ticks " .. v355]:visibility(v356 ~= "Switch Ticks");
end;
for _, v358 in next, v79 do
    uiTickOptions(v358);
    do
        local l_v358_0 = v358;
        AAData["Tick Modes " .. l_v358_0]:set_callback(function()
            -- upvalues: l_v358_0 (ref)
            uiTickOptions(l_v358_0);
        end);
    end;
end;
uiAntiAimBodyYawOptions = function(v360)
    local v361 = AAData["Body Yaw " .. v360]:get();
    AAData["Inverter " .. v360]:visibility(v361);
    AAData["Fake Left " .. v360]:visibility(v361);
    AAData["Fake Right " .. v360]:visibility(v361);
    AAData["Body Yaw Options " .. v360]:visibility(v361);
    AAData["Fake Freestanding " .. v360]:visibility(v361);
end;
for _, v363 in next, v79 do
    uiAntiAimBodyYawOptions(v363);
    do
        local l_v363_0 = v363;
        AAData["Body Yaw " .. l_v363_0]:set_callback(function()
            -- upvalues: l_v363_0 (ref)
            uiAntiAimBodyYawOptions(l_v363_0);
        end);
    end;
end;
local function v368(v365)
    -- upvalues: v80 (ref), v79 (ref)
    if v365 == 0 then
        for _, v367 in next, AAData do
            v367:visibility(false);
        end;
        v80:visibility(false);
    else
        uiAntiAimYawOptions(v79[v365]);
        uiAntiAimJitterOptions(v79[v365]);
        uiAntiAimBodyYawOptions(v79[v365]);
        v80:visibility(true);
        AAData["On " .. v79[v365]]:visibility(true);
        AAData["Pitch " .. v79[v365]]:visibility(true);
        AAData["Yaw " .. v79[v365]]:visibility(true);
        AAData["Yaw Jitter " .. v79[v365]]:visibility(true);
        AAData["Body Yaw " .. v79[v365]]:visibility(true);
    end;
end;
v368(0);
if v60:get() then
    v368(valueToIndex(v79, v80:get()));
end;
v80:set_callback(function()
    -- upvalues: v368 (ref), v60 (ref), v79 (ref), v80 (ref)
    v368(0);
    if v60:get() then
        v368(valueToIndex(v79, v80:get()));
    end;
end);
v60:set_callback(function()
    -- upvalues: v60 (ref), v368 (ref), v79 (ref), v80 (ref)
    if v60:get() then
        v368(valueToIndex(v79, v80:get()));
    else
        v368(0);
    end;
    v80:visibility(v60:get());
end);
v61:set_callback(function()
    -- upvalues: v79 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
    OutputCfg = "";
    for _, v370 in pairs(v79) do
        OutputCfg = OutputCfg .. " " .. tostring(AAData["On " .. v370]:get());
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Pitch " .. v370]:get());
        if AAData["Yaw " .. v370]:get() == "L-R Add" then
            OutputCfg = OutputCfg .. " " .. "L-R-Add";
        else
            OutputCfg = OutputCfg .. " " .. tostring(AAData["Yaw " .. v370]:get());
        end;
        if AAData["Yaw Base " .. v370]:get() == "Local View" then
            OutputCfg = OutputCfg .. " " .. "Local-View";
        else
            OutputCfg = OutputCfg .. " " .. "At-Target";
        end;
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Yaw Left " .. v370]:get());
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Yaw Right " .. v370]:get());
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Yaw Offset " .. v370]:get());
        if AAData["Yaw Jitter " .. v370]:get() == "Tick Jitter" then
            OutputCfg = OutputCfg .. " " .. "Tick-Jitter";
        else
            OutputCfg = OutputCfg .. " " .. tostring(AAData["Yaw Jitter " .. v370]:get());
        end;
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Yaw Jitter Offset " .. v370]:get());
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Body Yaw " .. v370]:get());
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Inverter " .. v370]:get());
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Fake Left " .. v370]:get());
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Fake Right " .. v370]:get());
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Body Yaw Options " .. v370]:get("Avoid Overlap"));
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Body Yaw Options " .. v370]:get("Jitter"));
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Body Yaw Options " .. v370]:get("Randomize Jitter"));
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Body Yaw Options " .. v370]:get("Anti Bruteforce"));
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Fake Freestanding " .. v370]:get());
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Skip Ticks " .. v370]:get());
        if AAData["Tick Modes " .. v370]:get() == "Randomize Ticks" then
            OutputCfg = OutputCfg .. " " .. "Randomize-Ticks";
        elseif AAData["Tick Modes " .. v370]:get() == "Switch Ticks" then
            OutputCfg = OutputCfg .. " " .. "Switch-Ticks";
        else
            OutputCfg = OutputCfg .. " " .. tostring(AAData["Tick Modes " .. v370]:get());
        end;
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Delay Ticks " .. v370]:get());
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Switch One " .. v370]:get());
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Switch Two " .. v370]:get());
        if AAData["Yaw Options " .. v370]:get() == "Modify Tick" then
            OutputCfg = OutputCfg .. " " .. "Modify-Tick";
        else
            OutputCfg = OutputCfg .. " " .. tostring(AAData["Yaw Options " .. v370]:get());
        end;
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Modify Tick Delay " .. v370]:get());
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Custom L-R Right " .. v370]:get());
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Custom L-R Left " .. v370]:get());
        OutputCfg = OutputCfg .. " " .. tostring(AAData["Custom L-R Offset " .. v370]:get());
    end;
    OutputCfg = l_base64_0.encode(OutputCfg);
    l_clipboard_0.set(OutputCfg);
end);
loadConfig = function(v371)
    -- upvalues: v79 (ref)
    local v372 = 1;
    local v373 = {};
    for v374 in v371:gmatch("%S+") do
        if v374:sub(-1) == "-" then
            v374 = v374:sub(1, -2);
        end;
        table.insert(v373, v374);
    end;
    local function v376(v375)
        if type(v375) == "string" then
            if v375 == "true" then
                return true;
            elseif v375 == "false" then
                return false;
            end;
        end;
    end;
    for _, v378 in pairs(v79) do
        local v379 = {};
        AAData["On " .. v378]:set(v376(v373[v372]));
        AAData["Pitch " .. v378]:set(v373[v372 + 1]);
        if v373[v372 + 2] == "L-R-Add" then
            v373[v372 + 2] = "L-R Add";
        end;
        AAData["Yaw " .. v378]:set(v373[v372 + 2]);
        if v373[v372 + 3] == "At-Target" then
            AAData["Yaw Base " .. v378]:set("At Target");
        else
            AAData["Yaw Base " .. v378]:set("Local View");
        end;
        AAData["Yaw Left " .. v378]:set(tonumber(v373[v372 + 4]));
        AAData["Yaw Right " .. v378]:set(tonumber(v373[v372 + 5]));
        AAData["Yaw Offset " .. v378]:set(tonumber(v373[v372 + 6]));
        if v373[v372 + 7] == "Tick-Jitter" then
            v373[v372 + 7] = "Tick Jitter";
        end;
        AAData["Yaw Jitter " .. v378]:set(v373[v372 + 7]);
        AAData["Yaw Jitter Offset " .. v378]:set(tonumber(v373[v372 + 8]));
        AAData["Body Yaw " .. v378]:set(v376(v373[v372 + 9]));
        AAData["Inverter " .. v378]:set(v376(v373[v372 + 10]));
        AAData["Fake Left " .. v378]:set(tonumber(v373[v372 + 11]));
        AAData["Fake Right " .. v378]:set(tonumber(v373[v372 + 12]));
        if v376(v373[v372 + 13]) then
            table.insert(v379, "Avoid Overlap");
        end;
        if v376(v373[v372 + 14]) then
            table.insert(v379, "Jitter");
        end;
        if v376(v373[v372 + 15]) then
            table.insert(v379, "Randomize Jitter");
        end;
        if v376(v373[v372 + 16]) then
            table.insert(v379, "Anti Bruteforce");
        end;
        AAData["Body Yaw Options " .. v378]:set(v379);
        AAData["Fake Freestanding " .. v378]:set(v376(v373[v372 + 17]));
        AAData["Skip Ticks " .. v378]:set(tonumber(v373[v372 + 18]));
        if v373[v372 + 19] == "Randomize-Ticks" then
            v373[v372 + 19] = "Randomize Ticks";
        elseif v373[v372 + 19] == "Switch-Ticks" then
            v373[v372 + 19] = "Switch Ticks";
        end;
        AAData["Tick Modes " .. v378]:set(v373[v372 + 19]);
        AAData["Delay Ticks " .. v378]:set(tonumber(v373[v372 + 20]));
        AAData["Switch One " .. v378]:set(tonumber(v373[v372 + 21]));
        AAData["Switch Two " .. v378]:set(tonumber(v373[v372 + 22]));
        if v373[v372 + 23] == "Modify-Tick" then
            v373[v372 + 23] = "Modify Tick";
        end;
        AAData["Yaw Options " .. v378]:set(v373[v372 + 23]);
        AAData["Modify Tick Delay " .. v378]:set(tonumber(v373[v372 + 24]));
        AAData["Custom L-R Right " .. v378]:set(tonumber(v373[v372 + 25]));
        AAData["Custom L-R Left " .. v378]:set(tonumber(v373[v372 + 26]));
        AAData["Custom L-R Offset " .. v378]:set(tonumber(v373[v372 + 27]));
        v372 = v372 + 28;
    end;
end;
local function v380()
    -- upvalues: v58 (ref)
    if v58:get() then
        cvar.r_drawdecals:int(0);
        cvar.r_drawtracers_firstperson:int(0);
        cvar.r_cheapwaterend:int(1);
        cvar.r_WaterDrawReflection:int(0);
        cvar.r_WaterDrawRefraction:int(0);
        cvar.mat_disable_bloom:int(1);
        cvar.mat_disable_fancy_blending:int(1);
        cvar.mat_bloom_scalefactor_scalar:int(0);
        cvar.mat_bumpmap:int(0);
        cvar.mat_hdr_level:int(0);
        cvar.fog_override:int(1);
        cvar.fog_enable:int(0);
        cvar.fog_enableskybox:int(0);
        cvar.mat_motion_blur_enabled:int(0);
        cvar.mat_postprocess_enable:int(0);
        cvar.mat_reducefillrate:int(1);
        cvar.r_farz:int(-1);
        cvar.r_ambientboost:int(0);
        cvar.r_ambientmin:int(0);
        cvar.r_ambientfactor:int(0);
        cvar.mat_drawwater:int(0);
        cvar.cl_ragdoll_gravity:int(10000);
        cvar.cl_ragdoll_physics_enable:int(0);
        cvar.func_break_max_pieces:int(0);
        cvar.r_dynamic:int(0);
        cvar.r_lod:int(2);
    else
        cvar.r_drawdecals:int(1);
        cvar.r_drawtracers_firstperson:int(1);
        cvar.r_cheapwaterend:int(0);
        cvar.r_WaterDrawReflection:int(1);
        cvar.r_WaterDrawRefraction:int(1);
        cvar.mat_disable_bloom:int(0);
        cvar.mat_disable_fancy_blending:int(0);
        cvar.mat_bloom_scalefactor_scalar:int(1);
        cvar.mat_bumpmap:int(1);
        cvar.mat_hdr_level:int(2);
        cvar.fog_override:int(0);
        cvar.fog_enable:int(1);
        cvar.fog_enableskybox:int(1);
        cvar.mat_motion_blur_enabled:int(1);
        cvar.mat_postprocess_enable:int(1);
        cvar.mat_reducefillrate:int(0);
        cvar.r_farz:int(0);
        cvar.r_ambientboost:int(1);
        cvar.r_ambientmin:int(1);
        cvar.r_ambientfactor:int(5);
        cvar.mat_drawwater:int(1);
        cvar.cl_ragdoll_gravity:int(600);
        cvar.cl_ragdoll_physics_enable:int(1);
        cvar.func_break_max_pieces:int(15);
        cvar.r_dynamic:int(1);
        cvar.r_lod:int(0);
    end;
end;
v58:set_callback(v380);
events.round_start:set(function()
    -- upvalues: v380 (ref)
    v380();
end);
events.player_connect_full:set(function()
    -- upvalues: v380 (ref)
    v380();
end);
v62:set_callback(function()
    -- upvalues: l_base64_0 (ref), l_clipboard_0 (ref)
    local v381 = l_base64_0.decode(l_clipboard_0.get());
    loadConfig(v381);
end);
local v382 = nil;
events.round_end:set(function()
    -- upvalues: v382 (ref)
    v382 = true;
end);
events.round_start:set(function()
    -- upvalues: v382 (ref)
    v382 = false;
end);
local v383 = nil;
events.createmove:set(function(v384)
    -- upvalues: v334 (ref), v383 (ref), v130 (ref), v162 (ref), v87 (ref), v191 (ref), v382 (ref), v90 (ref), v140 (ref), v184 (ref), v154 (ref), v186 (ref), v158 (ref)
    v334(v384);
    v383 = v130();
    forceDefensive();
    nadeThrowFix(v384);
    v162(v384);
    if v87:get("On Warmup") and entity.get_game_rules().m_bWarmupPeriod then
        v191();
    elseif v87:get("On Round End") and v382 then
        v191();
    elseif v90:get() and v140(entity.get_local_player()) then
        v184("Down", "At Target", "Backward", 0, "Off");
    else
        v154(v384);
        v186();
        v158();
    end;
end);
v48:set_callback(function()
    -- upvalues: v48 (ref)
    if not v48:get() then
        common.set_clan_tag("");
    end;
end);
events.post_update_clientside_animation:set(function()
    -- upvalues: v124 (ref), v122 (ref)
    v124();
    v122();
end);
events.render:set(function()
    -- upvalues: v193 (ref), v225 (ref), v217 (ref), v204 (ref), v278 (ref), v218 (ref), v78 (ref), v312 (ref), v303 (ref)
    v193();
    v225();
    v217();
    v204();
    v278();
    v218();
    clanTag();
    v78();
    v312();
    v303();
end);
events.aim_ack:set(function(v385)
    -- upvalues: v319 (ref), v307 (ref)
    v319(v385);
    v307 = v385.aim;
end);
old_msg = "";
events.player_death(function(v386)
    -- upvalues: v19 (ref), v43 (ref), v42 (ref), v59 (ref), v383 (ref), v108 (ref), v39 (ref), v285 (ref), v47 (ref), v100 (ref)
    local v387 = v19:get():to_hex();
    local v388 = v43:get():to_hex();
    local v389 = v42:get():to_hex();
    local v390 = entity.get_local_player();
    local v391 = entity.get(v386.userid, true);
    local v392 = entity.get(v386.attacker, true);
    if v59:get() and v390 == v391 then
        local v393 = math.floor(v390.m_flPoseParameter[11] * 120 - 64);
        print_raw("\a" .. v387 .. "[NEBULA]\aFFFFFFFF Killed By " .. v392:get_name() .. " In \a" .. v387 .. v383 .. " \aFFFFFFFF(Hs: " .. tostring(v386.headshot) .. ", Desync: " .. v393 .. ", Velocity: " .. math.floor(v108()) .. ")");
    end;
    if v39:get() and v390 == v391 then
        local v394 = math.floor(v390.m_flPoseParameter[11] * 120 - 64);
        v285("\a" .. v388 .. "[NEBULA]" .. "\a" .. v389 .. " Killed By " .. v392:get_name() .. " In \a" .. v388 .. v383 .. " \a" .. v389 .. "(Hs: " .. tostring(v386.headshot) .. ", Desync: " .. v394 .. ", Velocity: " .. math.floor(v108()) .. ")");
    end;
    if v47:get() and v390 == v392 then
        msg = "say " .. v100[utils.random_int(1, #v100)];
        while old_msg == msg do
            msg = "say " .. v100[utils.random_int(1, #v100)];
        end;
        utils.execute_after(1.7, function()
            utils.console_exec(msg);
        end);
        old_msg = msg;
    end;
end);
events.player_hurt:set(function(v395)
    -- upvalues: v304 (ref), v306 (ref), v19 (ref), v20 (ref), v21 (ref), v17 (ref)
    local v396 = entity.get_local_player();
    if not v396 then
        return;
    else
        if entity.get(v395.attacker, true) == v396 then
            if entity.get(v395.userid, true) then

            end;
            v304 = 255;
            v306 = globals.curtime;
        end;
        local v397 = v19:get():to_hex();
        local _ = v20:get():to_hex();
        local v399 = v21:get():to_hex();
        local v400 = entity.get_local_player();
        if not v400 then
            return;
        else
            local v401 = entity.get(v395.attacker, true);
            local l_weapon_0 = v395.weapon;
            local _ = "";
            message = "";
            if v400 == v401 and (l_weapon_0 == "hegrenade" or l_weapon_0 == "inferno" or l_weapon_0 == "knife") then
                local v404 = entity.get(v395.userid, true);
                if l_weapon_0 == "hegrenade" then
                    message = "\a" .. v397 .. "[NEBULA]\aFFFFFFFF Naded " .. v404:get_name() .. " For " .. "\a" .. v399 .. v395.dmg_health .. "\aFFFFFFFF" .. " Damage " .. "(" .. "\a" .. v399 .. v395.health .. "\aFFFFFFFF" .. " Health Remaining) ";
                end;
                if l_weapon_0 == "inferno" then
                    message = "\a" .. v397 .. "[NEBULA]\aFFFFFFFF Burned " .. v404:get_name() .. " For " .. "\a" .. v399 .. v395.dmg_health .. "\aFFFFFFFF" .. " Damage " .. "(" .. "\a" .. v399 .. v395.health .. "\aFFFFFFFF" .. " Health Remaining) ";
                end;
                if l_weapon_0 == "knife" then
                    message = "\a" .. v397 .. "[NEBULA]\aFFFFFFFF Knifed " .. v404:get_name() .. " For " .. "\a" .. v399 .. v395.dmg_health .. "\aFFFFFFFF" .. " Damage " .. "(" .. "\a" .. v399 .. v395.health .. "\aFFFFFFFF" .. " Health Remaining) ";
                end;
                if v17:get("Console") then
                    print_raw(message);
                end;
                if v17:get("Top-Left") then
                    print_dev(message);
                end;
            end;
            return;
        end;
    end;
end);