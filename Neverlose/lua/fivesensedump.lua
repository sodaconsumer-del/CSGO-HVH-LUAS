local v0 = require("neverlose/bomb") or error("couldn't find bomb library");
local v1 = require("neverlose/gradient") or error("couldn't find gradient library");
local v2 = require("neverlose/mtools") or error("couldn't find MTools library");
local v3 = require("neverlose/get_lc") or error("couldn't find getlc library");
local v4 = require("neverlose/minterface") or error("couldn't find MI library");
local v5 = require("neverlose/color_print") or error("couldn't find print_color library");
local v6 = require("neverlose/clipboard") or error("couldn't find clipboard library");
if not require("neverlose/base64") then
    local _ = error("couldn't find base64 library");
end;
local v8 = require("neverlose/anti_aim") or error("couldn't find aa_lib library");
if not require("neverlose/discord_webhooks") then
    local _ = error("couldn't find discord_webhooks library");
end;
local v10 = require("ffi") or error("couldn't find ffi library");
local v11 = require("neverlose/get_defensive") or error("couldn't find defensive library");
if not require("neverlose/rich_presence") then
    local _ = error("Couldn't find rich_presence library");
end;
local v13 = "4.1";
local v14 = 0;
local v15 = "debug";
local v16 = {
    [1] = kbx, 
    [2] = kby
};
local v17 = {
    [1] = x, 
    [2] = y
};
local _ = 255;
local _ = 255;
local _ = 255;
local v21 = 255;
local v22 = false;
local _ = 0;
local v24 = 0;
local v25 = 0;
local v26 = 0;
local v27 = 0;
local v28 = 0;
local v29 = 0;
local v30 = 0;
local v31 = 0;
local v32 = 0;
local v33 = 0;
local v34 = 0;
local v35 = common.get_username();
local v36 = common.get_username();
local v37 = render.load_image(network.get("https://i.imgur.com/jVCYFf4.png", vector(20, 20, 0))) or error("Couldnt get texturka.png");
local v38 = render.load_image(network.get("https://i.imgur.com/rmJ9WPy.png"), vector(320, 280)) or error("Couldnt get c4 icon");
local v39 = 0;
local v40 = 0;
if common.get_username() == "coyee" then
    v36 = "admin";
end;
local v41 = {
    doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    spin = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    hideshots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
    fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    peekassist = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    fakeping = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    yawbaseaa = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yaw_o = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    anti_k = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    yawmodifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    yawmodifieroffsetaa = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    autr = ui.find("Miscellaneous", "Main", "Other", "Anti Untrusted"), 
    fake_lag_limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
    ticking = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"), 
    fake_lag_variability = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"), 
    hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    body = {
        invertt = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
        left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
        right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
        fake = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
        fakeoption = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
        fsbodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
    }, 
    freestanding = {
        ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
        ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
        ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding")
    }
};
local v42 = {
    enableaa = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    yawbase = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yawadd = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    yawmodifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    yawmodifier2 = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    yawmodifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    fakeoption = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    fake = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    fsbodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    fsstatic = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    fsbodyfreestand = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
    antibackstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    dtfl = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"), 
    dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    mindmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    baim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    safepoint = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
    fov = ui.find("Visuals", "World", "Main", "Field of View"), 
    legmovement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    ssgbaiming = ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim"), 
    ssgbaimingdisablers = ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim", "Disablers"), 
    ssgsafepoints = ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Ensure Hitbox Safety"), 
    awpbaiming = ui.find("Aimbot", "Ragebot", "Safety", "AWP", "Body Aim"), 
    awpbaimingdisablers = ui.find("Aimbot", "Ragebot", "Safety", "AWP", "Body Aim", "Disablers"), 
    awpsafepoints = ui.find("Aimbot", "Ragebot", "Safety", "AWP", "Ensure Hitbox Safety"), 
    autobaiming = ui.find("Aimbot", "Ragebot", "Safety", "AutoSnipers", "Body Aim"), 
    autobaimingdisablers = ui.find("Aimbot", "Ragebot", "Safety", "AutoSnipers", "Body Aim", "Disablers"), 
    autosafepoints = ui.find("Aimbot", "Ragebot", "Safety", "AutoSnipers", "Ensure Hitbox Safety"), 
    fakeping = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    rollicek = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles")
};
local _ = false;
local v44 = entity.get_local_player();
local v45 = 1;
local _ = function(v46)
    local _ = false;
    return v46.send_packet == false or globals.choked_commands > 1;
end;
local v67 = {
    multiplier = 0, 
    speed = 9.2, 
    stored_values = {}, 
    active_this_frame = {}, 
    prev_realtime = globals.realtime, 
    realtime = globals.realtime, 
    clamp = function(v49, v50, v51)
        return v51 < v49 and v51 or v49 < v50 and v50 or v49;
    end, 
    frame = function(v52)
        v52.prev_realtime = v52.realtime;
        v52.realtime = globals.realtime;
        v52.multiplier = (v52.realtime - v52.prev_realtime) * v52.speed;
        for v53, _ in pairs(v52.stored_values) do
            if v52.active_this_frame[v53] == nil then
                v52.stored_values[v53] = nil;
            end;
        end;
        v52.active_this_frame = {};
    end, 
    reset = function(v55, v56)
        v55.stored_values[v56] = nil;
    end, 
    animate = function(v57, v58, v59, v60)
        if not v60 then
            v60 = 1;
        end;
        if not v59 then
            v59 = false;
        end;
        local v61 = v57.multiplier * (v59 and -1 or 1);
        local v62 = v57.clamp(v57.stored_values[v58] and v57.stored_values[v58] or 0, 0, v60);
        v62 = v57.clamp(v62 + v61, 0, v60);
        v57.stored_values[v58] = v62;
        v57.active_this_frame[v58] = true;
        return v62;
    end, 
    lerp = function(_, v64, v65, v66)
        return v64 + (v65 - v64) * v66;
    end
};
local v86 = {
    multiplier = 0, 
    speed = 9.2, 
    stored_values = {}, 
    active_this_frame = {}, 
    prev_realtime = globals.realtime, 
    realtime = globals.realtime, 
    clamp = function(v68, v69, v70)
        return v70 < v68 and v70 or v68 < v69 and v69 or v68;
    end, 
    frame = function(v71)
        v71.prev_realtime = v71.realtime;
        v71.realtime = globals.realtime;
        v71.multiplier = (v71.realtime - v71.prev_realtime) * v71.speed;
        for v72, _ in pairs(v71.stored_values) do
            if v71.active_this_frame[v72] == nil then
                v71.stored_values[v72] = nil;
            end;
        end;
        v71.active_this_frame = {};
    end, 
    reset = function(v74, v75)
        v74.stored_values[v75] = nil;
    end, 
    animate = function(v76, v77, v78, v79)
        if not v79 then
            v79 = 1;
        end;
        if not v78 then
            v78 = false;
        end;
        local v80 = v76.multiplier * (v78 and -1 or 1);
        local v81 = v76.clamp(v76.stored_values[v77] and v76.stored_values[v77] or 0, 0, v79);
        v81 = v76.clamp(v81 + v80, 0, v79);
        v76.stored_values[v77] = v81;
        v76.active_this_frame[v77] = true;
        return v81;
    end, 
    lerp = function(_, v83, v84, v85)
        return v83 + (v84 - v83) * v85;
    end
};
v10.cdef("    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n    typedef uintptr_t (__thiscall* GetClientEntity_4242425_t)(void*, int);\n\n    int MessageBoxA(void *w, const char *txt, const char *cap, int type);\n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n\n    typedef struct\n    {\n        float x;\n        float y;\n        float z;\n    } Vector_t;\n \n    int VirtualProtect(void* lpAddress, unsigned long dwSize, unsigned long flNewProtect, unsigned long* lpflOldProtect);\n    void* VirtualAlloc(void* lpAddress, unsigned long dwSize, unsigned long  flAllocationType, unsigned long flProtect);\n    int VirtualFree(void* lpAddress, unsigned long dwSize, unsigned long dwFreeType);\n\n    typedef struct\n    {\n        char    pad0[0x60]; // 0x00\n        void* pEntity; // 0x60 //entity\n        void* pActiveWeapon; // 0x64 //weapon\n        void* pLastActiveWeapon; // 0x68 //lastactive weapon\n        float        flLastUpdateTime; // 0x6C\n        int            iLastUpdateFrame; // 0x70\n        float        flLastUpdateIncrement; // 0x74\n        float        flEyeYaw; // 0x78\n        float        flEyePitch; // 0x7C\n        float        flGoalFeetYaw; // 0x80\n        float        flLastFeetYaw; // 0x84\n        float        flMoveYaw; // 0x88\n        float        flLastMoveYaw; // 0x8C // changes when moving/jumping/hitting ground\n        float        flLeanAmount; // 0x90\n        char         pad1[0x4]; // 0x94\n        float        flFeetCycle; // 0x98 0 to 1\n        float        flMoveWeight; // 0x9C 0 to 1\n        float        flMoveWeightSmoothed; // 0xA0\n        float        flDuckAmount; // 0xA4\n        float        flHitGroundCycle; // 0xA8\n        float        flRecrouchWeight; // 0xAC\n        Vector_t        vecOrigin; // 0xB0\n        Vector_t        vecLastOrigin;// 0xBC\n        Vector_t        vecVelocity; // 0xC8\n        Vector_t        vecVelocityNormalized; // 0xD4\n        Vector_t        vecVelocityNormalizedNonZero; // 0xE0\n        float        flVelocityLenght2D; // 0xEC\n        float        flJumpFallVelocity; // 0xF0\n        float        flSpeedNormalized; // 0xF4 // clamped velocity from 0 to 1\n        float        flRunningSpeed; // 0xF8\n        float        flDuckingSpeed; // 0xFC\n        float        flDurationMoving; // 0x100\n        float        flDurationStill; // 0x104\n        bool        bOnGround; // 0x108\n        bool        bHitGroundAnimation; // 0x109\n        char    pad2[0x2]; // 0x10A\n        float        flNextLowerBodyYawUpdateTime; // 0x10C\n        float        flDurationInAir; // 0x110\n        float        flLeftGroundHeight; // 0x114\n        float        flHitGroundWeight; // 0x118 // from 0 to 1, is 1 when standing\n        float        flWalkToRunTransition; // 0x11C // from 0 to 1, doesnt change when walking or crouching, only running\n        char    pad3[0x4]; // 0x120\n        float        flAffectedFraction; // 0x124 // affected while jumping and running, or when just jumping, 0 to 1\n        char    pad4[0x208]; // 0x128\n        float        flMinBodyYaw; // 0x330\n        float        flMaxBodyYaw; // 0x334\n        float        flMinPitch; //0x338\n        float        flMaxPitch; // 0x33C\n        int            iAnimsetVersion; // 0x340\n    } CCSGOPlayerAnimationState_534535_t;\n\n    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder; //0x0014\n        int m_nSequence; //0x0018\n        float m_flPrevCycle; //0x001C\n        float m_flWeight; //0x0020\n        float m_flWeightDeltaRate; //0x0024\n        float m_flPlaybackRate; //0x0028\n        float m_flCycle; //0x002C\n        void *m_pOwner; //0x0030\n        char  pad_0038[4]; //0x0034\n    } CAnimationLayer;\n\n");
local v87 = {
    urlmon = v10.load("UrlMon"), 
    wininet = v10.load("WinInet")
};
v87.download_file_from_url = function(v88, v89)
    -- upvalues: v87 (ref)
    v87.wininet.DeleteUrlCacheEntryA(v88);
    v87.urlmon.URLDownloadToFileA(nil, v88, v89, 0, 0);
end;
utils.console_exec("clear");
utils.execute_after(0.5, function()
    -- upvalues: v5 (ref), v35 (ref), v15 (ref)
    print_raw("\a96dc32ff" .. "DEBUG VERSION\n\n\n                                                    \226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\151   \226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151 \226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\150\136\226\149\151  \226\150\136\226\150\136\226\149\151 \226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\n                                                    \226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\145   \226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151 \226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157\n                                                    \226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151  \226\150\136\226\150\136\226\149\145\226\149\154\226\150\136\226\150\136\226\149\151 \226\150\136\226\150\136\226\149\148\226\149\157\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151  \226\149\154\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151 \226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151  \226\150\136\226\150\136\226\149\148\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\145\226\149\154\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151 \226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\n                                                    \226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\149\157  \226\150\136\226\150\136\226\149\145 \226\149\154\226\150\136\226\150\136\226\150\136\226\150\136\226\149\148\226\149\157 \226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\149\157   \226\149\154\226\149\144\226\149\144\226\149\144\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\149\157  \226\150\136\226\150\136\226\149\145\226\149\154\226\150\136\226\150\136\226\150\136\226\150\136\226\149\145 \226\149\154\226\149\144\226\149\144\226\149\144\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\149\157\n                                                    \226\150\136\226\150\136\226\149\145     \226\150\136\226\150\136\226\149\145  \226\149\154\226\150\136\226\150\136\226\149\148\226\149\157  \226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\148\226\149\157\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\145 \226\149\154\226\150\136\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\148\226\149\157\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\n                                                    \226\149\154\226\149\144\226\149\157     \226\149\154\226\149\144\226\149\157   \226\149\154\226\149\144\226\149\157   \226\149\154\226\149\144\226\149\144\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157\226\149\154\226\149\144\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157 \226\149\154\226\149\144\226\149\144\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157\226\149\154\226\149\144\226\149\157  \226\149\154\226\149\144\226\149\144\226\149\157\226\149\154\226\149\144\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157 \226\149\154\226\149\144\226\149\144\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157\n\n                                                                      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n                                                                       @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n                                                                        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n                                                                     @   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n                                                                    @@@  @@@@@@@@@@            @@@@@@@@\n                                                                    @@@@  @@@@@@@@@@           @@@@@@@@\n                                                                    @@@@@  @@@@@@@@@           @@@@@@@@\n                                                                    @@@@@   @@@@@@@@@           @@@@@@@\n                                                                    @@@@@@  @@@@@@@@@@@@@@@@@@@  @@@@@@\n                                                                    @@@@@@@  @@@@@@@@@@@@@@@@@@@@  @@@@\n                                                                    @@@@@@@@  @@@@@@@@@@@@@@@@@@@@@  @@\n                                                                    @@@@@@@@@  @@@@@@@@@@@@@@@@@@@@@   \n                                                                    @@@@@@@@@@  @@@@@@@@@@@@@@@@@@@@@@ \n                                                                    @@@@@@@@@@@             @@@@@@@@@@@\n                                                                    @@@@@@@@@@@@@@@@@@@@@@@   @@@@@@@@@\n                                                                    @@@@@@@@@@@@@@@@@@@@@@@@@   @@@@@@@\n                                                                    @@@@@@@@@@@@@@@@@@@@@@@@@@@   @@@@@\n                                                                    @@@@@@@@@@@@@@@@@@@@@@@@@@@@    @@@\n                                                                             STAY WITH FIVESENSE" .. "\n\n");
    v5("|fivesense|", color(150, 220, 50));
    print_raw(" " .. v35, " we are happy to see you back!");
    v5("|fivesense|", color(150, 220, 50));
    print_raw(" curent script version : " .. v15);
end);
get_csgo_path = function()
    local v90 = common.get_game_directory();
    if string.find(v90, "migi") then
        return v90:sub(1, -10) .. "csgo";
    else
        return v90;
    end;
end;
get_neverlose_path = function()
    local v91 = common.get_game_directory();
    if string.find(v91, "migi") then
        return v91:sub(1, -10) .. "nl\\";
    else
        return v91:sub(1, -5) .. "nl\\";
    end;
end;
files.create_folder("nl\\scripts\\fivesense");
files.create_folder("csgo\\materials\\models\\player");
files.create_folder("csgo\\materials\\models\\player\\custom_player");
files.create_folder("csgo\\models\\player");
files.create_folder("csgo\\models\\player\\custom_player");
files.create_folder("csgo\\models\\player\\custom_player\\kodua");
file_exists = function(v92, v93)
    -- upvalues: v10 (ref)
    return v10.cast("bool (__thiscall*)(void*, const char*, const char*)", v10.cast(v10.typeof("void***"), utils.create_interface("filesystem_stdio.dll", "VBaseFileSystem011"))[0][10])(v10.cast(v10.typeof("void***"), utils.create_interface("filesystem_stdio.dll", "VBaseFileSystem011")), v92, v93);
end;
if not file_exists(get_csgo_path() .. "\\resource\\ui\\fornite_dances.res", "GAME") then
    v87.download_file_from_url(network.get("https://raw.githubusercontent.com/HowManyNbombsAreInMyStore/FS/main/assets/fndancesres.nl"), "csgo\\resource\\ui\\fornite_dances.res");
end;
if not file_exists(get_csgo_path() .. "\\models\\player\\custom_player\\kodua\\fortnite_emotes_v2.dx90.vtx", "GAME") then
    v87.download_file_from_url(network.get("https://raw.githubusercontent.com/HowManyNbombsAreInMyStore/FS/main/assets/fndancesvtx.nl"), "csgo\\models\\player\\custom_player\\kodua\\fortnite_emotes_v2.dx90.vtx");
end;
if not file_exists(get_csgo_path() .. "\\models\\player\\custom_player\\kodua\\fortnite_emotes_v2.mdl", "GAME") then
    v87.download_file_from_url(network.get("https://raw.githubusercontent.com/HowManyNbombsAreInMyStore/FS/main/assets/fndancesmdl.nl"), "csgo\\models\\player\\custom_player\\kodua\\fortnite_emotes_v2.mdl");
end;
if not file_exists(get_csgo_path() .. "\\models\\player\\custom_player\\kodua\\fortnite_emotes_v2.vvd", "GAME") then
    v87.download_file_from_url(network.get("https://raw.githubusercontent.com/HowManyNbombsAreInMyStore/FS/main/assets/fndancesvvd.nl"), "csgo\\models\\player\\custom_player\\kodua\\fortnite_emotes_v2.vvd");
end;
if not file_exists(get_neverlose_path() .. "\\scripts\\fivesense\\smallest pixel-7.ttf", "GAME") then
    v87.download_file_from_url(network.get("https://raw.githubusercontent.com/HowManyNbombsAreInMyStore/FS/main/fonts/fontpixel7.nl"), "nl\\scripts\\fivesense\\smallest pixel-7.ttf");
end;
if not file_exists(get_neverlose_path() .. "\\scripts\\fivesense\\fivesense.png", "GAME") then
    v87.download_file_from_url(network.get("https://raw.githubusercontent.com/HowManyNbombsAreInMyStore/FS/main/assets/fs_logo.nl"), "nl\\scripts\\fivesense\\fivesense.png");
end;
if not file_exists(get_neverlose_path() .. "\\scripts\\fivesense\\Calibri Bold.ttf", "GAME") then
    v87.download_file_from_url(network.get("https://raw.githubusercontent.com/HowManyNbombsAreInMyStore/FS/main/fonts/calibribold.nl"), "nl\\scripts\\fivesense\\Calibri Bold.ttf");
end;
if not file_exists(get_neverlose_path() .. "\\scripts\\fivesense\\verdana.ttf", "GAME") then
    v87.download_file_from_url(network.get("https://raw.githubusercontent.com/HowManyNbombsAreInMyStore/FS/main/fonts/verdana.nl"), "nl\\scripts\\fivesense\\verdana.ttf");
end;
if not file_exists(get_neverlose_path() .. "\\scripts\\fivesense\\verdanab.ttf", "GAME") then
    v87.download_file_from_url(network.get("https://raw.githubusercontent.com/HowManyNbombsAreInMyStore/FS/main/fonts/verdanabold.nl"), "nl\\scripts\\fivesense\\verdanab.ttf");
end;
if not file_exists(get_neverlose_path() .. "\\scripts\\fivesense\\verdanaz.ttf", "GAME") then
    v87.download_file_from_url(network.get("https://raw.githubusercontent.com/HowManyNbombsAreInMyStore/FS/main/fonts/verdanaz.nl"), "nl\\scripts\\fivesense\\verdanaz.ttf");
end;
if not file_exists(get_neverlose_path() .. "\\scripts\\fivesense\\verdanai.ttf", "GAME") then
    v87.download_file_from_url(network.get("https://raw.githubusercontent.com/HowManyNbombsAreInMyStore/FS/main/fonts/verdanai.nl"), "nl\\scripts\\fivesense\\verdanai.ttf");
end;
local v94 = render.screen_size();
local v95 = render.load_font("nl\\scripts\\fivesense\\smallest pixel-7.ttf", 10, "o");
local v96 = render.load_font("nl\\scripts\\fivesense\\smallest pixel-7.ttf", 9, "o");
local v97 = 1;
local v98 = render.load_font("verdana", 14, "ad");
local v99 = render.load_font("C:/Windows/Fonts/verdanab.ttf", 12, "d");
local _ = {};
local v101 = {
    bold = render.load_font("Calibri", vector(22.1, 22.2, 0), "adb")
};
local _ = v94.x / 2;
local _ = v94.y / 2;
local v104 = 0;
local _ = v94.x / 2;
local _ = v94.y / 2;
local v107 = 0;
local v108 = render.load_font("nl\\scripts\\fivesense\\Calibri Bold.ttf", vector(24, 22), "ad");
local v109 = render.load_font("nl\\scripts\\fivesense\\Calibri Bold.ttf", vector(18, 16.5), "ad");
local v110 = render.load_font("nl\\scripts\\fivesense\\Calibri Bold.ttf", vector(30, 27.5), "ad");
local v111 = render.load_font("nl\\scripts\\fivesense\\Calibri Bold.ttf", vector(36, 33), "ad");
local v112 = render.load_font("nl\\scripts\\fivesense\\Calibri Bold.ttf", vector(42, 38.5), "ad");
local v113 = render.load_font("nl\\scripts\\fivesense\\Calibri Bold.ttf", vector(48, 44), "ad");
local _ = render.load_font("C:/Windows/Fonts/verdanab.ttf", 12, "d");
local _ = render.load_font("C:/Windows/Fonts/verdanab.ttf", 12, "d");
local _ = render.load_font("C:/Windows/Fonts/verdanab.ttf", 12, "d");
local _ = render.load_font("C:/Windows/Fonts/verdanab.ttf", 12, "d");
local _ = render.load_font("C:/Windows/Fonts/verdanab.ttf", 12, "d");
v41.fakeping:disabled(true);
v41.ticking:disabled(true);
local l_cl_ragdoll_physics_enable_0 = cvar.cl_ragdoll_physics_enable;
if l_cl_ragdoll_physics_enable_0 ~= 0 then
    l_cl_ragdoll_physics_enable_0:int(0);
end;
v10.cdef("    typedef unsigned long HANDLE;\n    typedef HANDLE HWND;\n    typedef const char *LPCTSTR;\n    HWND GetForegroundWindow();\n    bool SetWindowTextA(HWND hWnd, LPCTSTR lpString);\n");
local v120 = v10.C.GetForegroundWindow();
v10.C.SetWindowTextA(v120, "FiveSense.pub");
if v44 == nil then
    utils.execute_after(1.5, function()
        panorama.loadstring("            var model = $.GetContextPanel().GetChild(0).FindChildInLayoutFile(\"JsMainmenu_Vanity\");\n            model.visible = true;\n            model.SetScene(\"resource/ui/fornite_dances.res\", \"models/player/custom_player/legacy/ctm_gign_variantB.mdl\", false)\n            model.PlaySequence(\"Emote_FlossDance\", true)\n        ")();
    end);
end;
link_open = function(v121)
    panorama.SteamOverlayAPI.OpenExternalBrowserURL(v121);
end;
events.mouse_input:set(function()
    return ui.get_alpha() <= 0;
end);
gsbox = function(v122, v123, v124, v125, v126)
    render.rect(vector(v122, v123), vector(v122 + v124, v123 + v125), color(18, 18, 18));
    render.rect(vector(v122 + 1, v123 + 1), vector(v122 + v124 - 1, v123 + v125 - 1), color(62, 62, 62));
    render.rect(vector(v122 + 2, v123 + 2), vector(v122 + v124 - 2, v123 + v125 - 2), color(44, 44, 44));
    render.rect(vector(v122 + 4, v123 + 4), vector(v122 + v124 - 4, v123 + v125 - 4), color(62, 62, 62));
    render.rect(vector(v122 + 5, v123 + 5), vector(v122 + v124 - 5, v123 + v125 - 16), color(19, 19, 19));
    render.rect(vector(v122 + 5, v123 + 9), vector(v122 + v124 - 5, v123 + v125 - 5), color(20, 20, 20));
    if v126 then
        render.gradient(vector(v122 + 6, v123 + 6), vector(v122 + v124 / 2, v123 + 8), color(62, 174, 222), color(172, 66, 179), color(49, 87, 111), color(123, 46, 126));
        render.gradient(vector(v122 + v124 / 2, v123 + 6), vector(v122 + v124 - 6, v123 + 8), color(172, 66, 179), color(200, 226, 60), color(123, 46, 126), color(100, 112, 29));
    end;
end;
statefunc = {
    onground_ticks = 0, 
    on_ground = function(v127, v128)
        if bit.band(v127.m_fFlags, 1) == 1 then
            statefunc.onground_ticks = statefunc.onground_ticks + 1;
        else
            statefunc.onground_ticks = 0;
        end;
        return v128 < statefunc.onground_ticks;
    end, 
    velocity = function(v129)
        local l_m_vecVelocity_0 = v129.m_vecVelocity;
        return (math.sqrt(l_m_vecVelocity_0.x * l_m_vecVelocity_0.x + l_m_vecVelocity_0.y * l_m_vecVelocity_0.y));
    end, 
    is_crouching = function(v131)
        return v131.m_flDuckAmount > 0.9;
    end, 
    in_air = function(v132)
        if v132 == nil then
            return;
        elseif entity.get_local_player() == nil then
            return;
        else
            local l_m_fFlags_0 = v132.m_fFlags;
            if bit.band(l_m_fFlags_0, 1) == 0 then
                return true;
            else
                return false;
            end;
        end;
    end
};
antiaim_state_real = "";
get_state = function()
    if not globals.is_in_game then
        return "Loading";
    else
        lp = entity.get_local_player();
        local _ = lp.m_fFlags;
        local _ = lp.m_hGroundEntity == -1;
        local v136 = math.floor(lp["m_vecVelocity[0]"]);
        local v137 = math.floor(lp["m_vecVelocity[1]"]);
        local _ = math.sqrt(v136 ^ 2 + v137 ^ 2);
        local _ = ui.find("Aimbot", "Anti Aim", "Misc", "Slow walk"):get();
        if Antiaim.states() == 7 then
            antiaim_state_real = "Duck";
            return "Duck";
        elseif Antiaim.states() == 6 then
            antiaim_state_real = "Air+Duck";
            return "Air+Duck";
        elseif Antiaim.states() == 5 then
            antiaim_state_real = "Air";
            return "Air";
        elseif Antiaim.states() == 4 then
            antiaim_state_real = "Slow-Walking";
            return "Slow-Walking";
        elseif Antiaim.states() == 3 then
            antiaim_state_real = "Moving";
            return "Moving";
        elseif Antiaim.states() == 2 then
            antiaim_state_real = "Stand";
            return "Stand";
        else
            antiaim_state_real = "Fakelag";
            return "Fakelag";
        end;
    end;
end;
utils.execute_after(0.2, function()
    -- upvalues: v35 (ref)
    common.add_notify("\aDEFAULTFive\a95b806FFSense", "Welcome " .. v35 .. ", enjoy your stay with fivesense debug");
end);
local v140 = ui.create(ui.get_icon("info") .. " \affffffFFi\af4f8e6FFn\aeaf1cdFFf\adfeab4FFo\ad5e39bFFr\acadc82FFm\abfd46aFFa\ab5cd51FFt\aaac638FFi\aa0bf1fFFo\a95b806FFn");
local _ = v140:label("\t\t\t\t\t\affffffFFFive\a95b806FFSense \affffffFF- \affffffFFd\af1f5e6FFe\ae3eaccFFb\ad5e0b3FFu\ac7d599FFg\ab9cb80FF \aabc066FFb\a9db64dFFu\a8fab33FFi\a81a11aFFl\a95b806FFd\n\n");
local _ = v140:label("Registered to: \a95b806FF" .. v35);
local _ = v140:label("Script version: \a95b806FF" .. v13);
local _ = v140:label("Last update: \a95b806FF8/16/2023");
local v145 = v140:switch("Enable loading animation", true);
local v146 = ui.create(ui.get_icon("link") .. " \affffffFFl\ae5edc1FFi\acadc83FFn\ab0ca44FFk\a95b806FFs");
local _ = v146:button("Download RPC dll", function()
    common.add_notify("\aDEFAULTFive\a95b806FFSense", "downloaded dll.");
    link_open(network.get("https://raw.githubusercontent.com/HowManyNbombsAreInMyStore/FS/main/discord-rpc-link.nl"));
end, true);
local _ = v146:button("Config", function()
    link_open("https://en.neverlose.cc/market/item?id=W7ggH5");
end, true);
local _ = v146:button("Discord", function()
    link_open("https://discord.gg/xH8JaGd9jk");
end, true);
local v150 = render.load_image_from_file("nl\\scripts\\fivesense\\fivesense.png", vector(828, 828));
local v151 = ui.create("Ragebot", ui.get_icon("eye") .. " \affffffFFR\af8faeeFFa\af1f6deFFg\aeaf1cdFFe\ae3ecbdFFb\adce7acFFo\ad5e39bFFt\acede8bFF \ac6d97aFFS\abfd46aFFe\ab8d059FFt\ab1cb48FFt\aaac638FFi\aa3c127FFn\a9cbd17FFg\a95b806FFs");
local v152 = v151:switch("Enable ragebot", false);
local v153 = v151:switch("Ideal peek", false);
local v154 = v151:switch("Discharge Exploit", false);
local v155 = v151:switch("Fake Latency", false);
v155:tooltip("\ac2a919FF\226\154\160\239\184\143 Fake Latency is in beta state");
local v156 = v155:create():slider("\226\154\160\239\184\143\ac2a919FF Fake Latency", 0, 300, 145, true, "ms");
v156:tooltip("\ac2a919FFcan make your resolver worse");
local v157 = v151:switch("Logs", false);
local v158 = v157:create():selectable("Logs output", {
    [1] = "Console / Event", 
    [2] = "Under crosshair"
}, 0);
local v159 = v157:create():combo("Style", {
    [1] = "Default", 
    [2] = "Solus", 
    [3] = "\aDEFAULTGame\a5d8100FFS\a5d8100FFe\a5d8100FFn\a5d8100FFs\a5d8100FFe"
}, 0);
v146:texture(v150, vector(266, 250), color(255, 255, 255), "f");
local v160 = ui.create("Visuals", ui.get_icon("eye") .. " \affffffFFV\af7faedFFi\af0f5dbFFs\ae8f0caFFu\ae1ebb8FFa\ad9e6a6FFl\ad2e194FF \acadb83FFs\ac2d671FFe\abbd15fFFt\ab3cc4dFFt\aacc73bFFi\aa4c22aFFn\a9dbd18FFg\a95b806FFs");
local v161 = v160:switch("Enable visuals", false);
local v162 = v160:switch("\aDEFAULTGame\a5d8100FFS\a5d8100FFe\a5d8100FFn\a5d8100FFs\a5d8100FFe \addddddFFUI", false);
v162:tooltip("For better experience use a menu theme that is transparent");
local v163 = v160:switch("Aspect ratio", false);
local v164 = v163:create():slider("Aspect Ratio", 0, 200, 0, 0.01);
local v165 = v163:create():button("16:9", function()
    aspect_ratio(16, 9);
end, true);
local v166 = v163:create():button("16:10", function()
    aspect_ratio(16, 10);
end, true);
local v167 = v163:create():button("3:2", function()
    aspect_ratio(3, 2);
end, true);
local v168 = v163:create():button("4:3", function()
    aspect_ratio(4, 3);
end, true);
local v169 = v163:create():button("5:3", function()
    aspect_ratio(5, 3);
end, true);
local v170 = v160:switch("Crosshair Indicators", false);
local v171 = v170:create():list("Style", {
    [1] = "Original", 
    [2] = "Divine"
});
local v172 = v170:create():listable("To indicate", {
    [1] = "Keybinds", 
    [2] = "Min. DMG", 
    [3] = "Fakelag", 
    [4] = "AA condition", 
    [5] = "Anti-aim arrows"
});
local v173 = v170:create():color_picker("Indicators' color", color(150, 220, 50));
local v174 = v170:create():switch("Kibit DMG on override", false);
local v175 = v160:switch("Custom scope", false);
local v176 = v175:create():color_picker("Scope color", color(255));
local v177 = v175:create():slider("Scope length", -500, 500, 100);
local v178 = v175:create():slider("Scope offset", -250, 250, 40);
local v179 = v160:switch("Information panel", false);
local v180 = v179:create():combo("Style", {
    [1] = "Default", 
    [2] = "Solus", 
    [3] = "Game\a739601FFS\208\181nse"
});
local v181 = v160:selectable("Widgets", {
    [1] = "Watermark", 
    [2] = "Keybinds", 
    [3] = "\aDEFAULTG\a5d8100FFS \aDEFAULTKeybinds", 
    [4] = "Choke & Desync information", 
    [5] = "Frametime", 
    [6] = "Spectator list"
}, false);
local v182 = v181:create():combo("Style", {
    [1] = "Solus", 
    [2] = "\aDEFAULTGame\a5d8100FFS\a5d8100FFe\a5d8100FFn\a5d8100FFs\a5d8100FFe"
});
local v183 = v182:color_picker(color(150, 220, 50));
local v184 = v181:create():combo("Spec. list style", {
    [1] = "Widgets", 
    [2] = "Default"
}, 1);
local v185 = v181:create():selectable("\aDEFAULTG\a5d8100FFS \aDEFAULTKeybinds", {
    [1] = "Dormant aimbot", 
    [2] = "Double tap", 
    [3] = "Hide shots", 
    [4] = "Ideal tick", 
    [5] = "Bomb", 
    [6] = "Freestanding", 
    [7] = "Force body aim", 
    [8] = "Force safe points", 
    [9] = "Damage override", 
    [10] = "Hitchance override", 
    [11] = "Duck peek assist", 
    [12] = "Fake ping", 
    [13] = "Teleport distance", 
    [14] = "Lag compensation", 
    [15] = "Anti exploit", 
    [16] = "Slowdown"
});
local v186 = v181:create():combo("Watermark nick", {
    [1] = "Neverlose", 
    [2] = "Steam", 
    [3] = "Custom"
});
local v187 = v181:create():input("Custom name", v35);
local v188 = v181:create():combo("Watermark text", {
    [1] = "fivesense", 
    [2] = "gamesense", 
    [3] = "sk\208\181et.cc"
}, false);
local v189 = ui.create("Misc", ui.get_icon("wrench") .. " \affffffFFM\af6f9eaFFi\aedf3d6FFs\ae4edc1FFc\adce7acFF \ad3e197FFS\acadc83FFe\ac1d66eFFt\ab8d059FFt\aafca44FFi\aa7c430FFn\a9ebe1bFFg\a95b806FFs");
local v190 = v189:switch("Enable misc", false);
local v191 = v189:switch("Avoid collisions", false);
local v192 = v191:create():slider("Distance", 5, 20, 15, true, "ft");
local v193 = v189:switch("Fast ladder", false);
local v194 = v189:switch("No fall damage", false);
local v195 = v189:switch("Trashtalk", false);
local v196 = v195:create():combo("Trashtalk mode", {
    [1] = "Default", 
    [2] = "Chinese", 
    [3] = "Czech", 
    [4] = "Government", 
    [5] = "One"
}, false);
local v197 = v189:switch("Clantag", false);
local v198 = v197:create():combo("Clan Tags", {
    [1] = "Five\a95b806FFSense", 
    [2] = "\aDEFAULTGame\a5d8100FFS\a5d8100FFe\a5d8100FFn\a5d8100FFs\a5d8100FFe", 
    [3] = "\affffffFFs\ae8eddbFFk\ad1dbb6FFe\abac992FFe\aa2b76dFFt\a8ba549FF.\a749324FFc\a5d8100FFc"
}, false);
aspect_ratio = function(v199, v200)
    -- upvalues: v164 (ref)
    v164:set(math.floor(v199 / v200 * 100));
end;
aa_system = {
    menu = {
        player_states = {
            [1] = "Fakelag", 
            [2] = "Standing", 
            [3] = "Moving", 
            [4] = "Slowwalking", 
            [5] = "In-Air", 
            [6] = "In-Air (Duck)", 
            [7] = "Ducking"
        }, 
        pstates = {
            [1] = "[F] ", 
            [2] = "[S] ", 
            [3] = "[M] ", 
            [4] = "[SW] ", 
            [5] = "[A] ", 
            [6] = "[A+D] ", 
            [7] = "[D] "
        }, 
        create = function()
            Antiaim_options = ui.create("Anti-Aim", ui.get_icon("shield-halved") .. " \affffffFFA\af7faedFFn\af0f5dbFFt\ae8f0caFFi\ae1ebb8FF-\ad9e6a6FFA\ad2e194FFi\acadb83FFm\ac2d671FF \abbd15fFFC\ab3cc4dFFo\aacc73bFFn\aa4c22aFFf\a9dbd18FFi\a95b806FFg");
            Antiaim_builder = ui.create("Anti-Aim", ui.get_icon("shield-halved") .. " \affffffFFA\af0f5dbFFn\ae1ebb8FFt\ad2e194FFi\ac2d671FF-\ab3cc4dFFA\aa4c22aFFi\a95b806FFm");
            Antiaim_misc = ui.create("Anti-Aim", ui.get_icon("shield-halved") .. " \affffffFFA\af6f9eaFFN\aedf3d6FFT\ae4edc1FFI\adce7acFF-\ad3e197FFA\acadc83FFI\ac1d66eFFM\ab8d059FF \aafca44FFM\aa7c430FFI\a9ebe1bFFS\a95b806FFC");
            aa_system.Antiaim = {};
            aa_system.condition = {};
            aa_system.condition2 = {};
            aa_system.Antiaim.enable_antiaim_system = Antiaim_options:switch("Enable Five\a95b806FFSense\aDEFAULT AA system", false);
            aa_system.Antiaim.config_type = Antiaim_options:combo("AA Config type", {
                [1] = "Preset", 
                [2] = "Builder"
            });
            aa_system.Antiaim.condition_state = Antiaim_options:combo("Current Condition", aa_system.menu.player_states);
            aa_system.Antiaim.presets = Antiaim_options:combo("AA preset", {
                [1] = "Static", 
                [2] = "Low jitter", 
                [3] = "Tank-AA", 
                [4] = "3Way jitter", 
                [5] = "5Way jitter"
            });
            aa_system.Antiaim.export_config = Antiaim_options:button("Export AA settings", function()
                export();
            end, true);
            aa_system.Antiaim.load_config = Antiaim_options:button("Import AA settings", function()
                import();
            end, true);
            aa_system.Antiaim.preset_config = Antiaim_options:button("  Load default cfg  ", function()
                importDefault();
            end, true);
            aa_system.Antiaim.enable_animbreakers = Antiaim_misc:switch("\226\154\160\239\184\143\ac2a919FF Animation breaker", false);
            aa_system.Antiaim.enable_airexploit = Antiaim_misc:switch("Defensive Exploit", false);
            aa_system.Antiaim.enable_animbreakers:tooltip("\ac2a919FFcan make your resolver worse");
            aa_system.Antiaim.animation_breakers = aa_system.Antiaim.enable_animbreakers:create():selectable("Anim. breaker", {
                [1] = "Pitch 0 on land", 
                [2] = "MoonWalk", 
                [3] = "Static legs in air", 
                [4] = "Move lean"
            });
            aa_system.Antiaim.enable_animbreakers:disabled(false);
            aa_system.Antiaim.freestanding = Antiaim_misc:switch("Freestanding");
            aa_system.Antiaim.freestanding_mode = aa_system.Antiaim.freestanding:create():list("Mode", {
                [1] = "Default", 
                [2] = "Edge"
            });
            aa_system.Antiaim.freestanding_disable = aa_system.Antiaim.freestanding:create():switch("Disable body yaw modifiers", false);
            aa_system.Antiaim.freestanding_type = aa_system.Antiaim.freestanding:create():list("Type", {
                [1] = "Static", 
                [2] = "Jitter"
            });
            aa_system.Antiaim.freestanding_edge_distance = aa_system.Antiaim.freestanding:create():slider("Distance from wall", 10, 150, 20, "ft");
            aa_system.Antiaim.manualyaw = Antiaim_misc:combo("Manual yaw", {
                [1] = "Disabled", 
                [2] = "Forward", 
                [3] = "Left", 
                [4] = "Right"
            });
            for v201, _ in ipairs(aa_system.menu.player_states) do
                aa_system.condition[v201] = {
                    yaw_modifier_real = Antiaim_builder:combo(aa_system.menu.pstates[v201] .. "Yaw\n" .. aa_system.menu.player_states[v201], {
                        [1] = "Disabled", 
                        [2] = "Backward", 
                        [3] = "Static", 
                        [4] = "L&R"
                    }), 
                    yaw_modifier = Antiaim_builder:combo(aa_system.menu.pstates[v201] .. "Jitter Modifier\n" .. aa_system.menu.player_states[v201], {
                        [1] = "Disabled", 
                        [2] = "Center", 
                        [3] = "Offset", 
                        [4] = "Random", 
                        [5] = "Spin", 
                        [6] = "3-Way", 
                        [7] = "5-Way"
                    }), 
                    yawmodifieroffsetaaa = Antiaim_builder:slider(aa_system.menu.pstates[v201] .. "Jitter Offset\n" .. aa_system.menu.player_states[v201], -180, 180, 0), 
                    body = Antiaim_builder:switch(aa_system.menu.pstates[v201] .. "Body Yaw\n" .. aa_system.menu.player_states[v201]), 
                    defensive_aa = Antiaim_builder:switch(aa_system.menu.pstates[v201] .. "Defensive AA\n" .. aa_system.menu.player_states[v201])
                };
            end;
            for v203, _ in ipairs(aa_system.menu.player_states) do
                local v205 = aa_system.condition[v203].body:create();
                local v206 = aa_system.condition[v203].defensive_aa:create();
                local v207 = aa_system.condition[v203].yaw_modifier_real:create();
                local _ = aa_system.condition[v203].yaw_modifier:create();
                aa_system.condition2[v203] = {
                    fake_left_limit = v205:slider("Limit Left\n" .. aa_system.menu.player_states[v203], 0, 60, 0), 
                    fake_right_limit = v205:slider("Limit Right\n" .. aa_system.menu.player_states[v203], 0, 60, 0), 
                    yaw_base = v207:combo("Base", {
                        [1] = "Local view", 
                        [2] = "At Target"
                    }), 
                    yaw_offset = v207:slider("Offset\n" .. aa_system.menu.player_states[v203], -180, 180, 0), 
                    yaw_offset_left = v207:slider("Left offset\n" .. aa_system.menu.player_states[v203], -180, 180, 0), 
                    yaw_offset_right = v207:slider("Right offset\n" .. aa_system.menu.player_states[v203], -180, 180, 0), 
                    yaw_offset_delay = v207:slider("Delay\n" .. aa_system.menu.player_states[v203], 0, 100, 0, true, "ms"), 
                    yaw_hidden = v207:switch("Hidden", false), 
                    jitter_options = v205:selectable("Options\n" .. aa_system.menu.player_states[v203], {
                        [1] = "Avoid Overlap", 
                        [2] = "Jitter", 
                        [3] = "Randomize Jitter", 
                        [4] = "Anti Bruteforce"
                    }), 
                    freestanding_by = v205:combo("Freestand Desync\n" .. aa_system.menu.player_states[v203], {
                        [1] = "Off", 
                        [2] = "Peek Fake", 
                        [3] = "Peek Real"
                    }), 
                    defensive_aa_pitch = v206:combo(aa_system.menu.pstates[v203] .. "Pitch type\n" .. aa_system.menu.player_states[v203], {
                        [1] = "Default", 
                        [2] = "DT Based", 
                        [3] = "Random", 
                        [4] = "Fake up", 
                        [5] = "Fake down", 
                        [6] = "Zero pitch"
                    }), 
                    defensive_aa_yaw = v206:combo(aa_system.menu.pstates[v203] .. "Yaw type\n" .. aa_system.menu.player_states[v203], {
                        [1] = "Spin", 
                        [2] = "DT Based", 
                        [3] = "SideWays", 
                        [4] = "3-WAY", 
                        [5] = "5-WAY", 
                        [6] = "Jitter", 
                        [7] = "Static"
                    })
                };
            end;
        end, 
        visible = function()
            local v209 = aa_system.Antiaim.condition_state:get();
            local v210 = aa_system.Antiaim.config_type:get() == "Builder" and aa_system.Antiaim.enable_antiaim_system:get();
            aa_system.Antiaim.config_type:visibility(aa_system.Antiaim.enable_antiaim_system:get());
            aa_system.Antiaim.condition_state:visibility(v210);
            aa_system.Antiaim.presets:visibility(aa_system.Antiaim.config_type:get() == "Preset" and aa_system.Antiaim.enable_antiaim_system:get());
            aa_system.Antiaim.enable_animbreakers:visibility(aa_system.Antiaim.enable_antiaim_system:get());
            aa_system.Antiaim.enable_airexploit:visibility(aa_system.Antiaim.enable_antiaim_system:get());
            aa_system.Antiaim.animation_breakers:visibility(aa_system.Antiaim.enable_antiaim_system:get() and aa_system.Antiaim.enable_animbreakers:get());
            aa_system.Antiaim.freestanding_mode:visibility(aa_system.Antiaim.freestanding:get() and aa_system.Antiaim.enable_antiaim_system:get());
            aa_system.Antiaim.freestanding_edge_distance:visibility(aa_system.Antiaim.freestanding_mode:get() == 2 and aa_system.Antiaim.freestanding:get());
            aa_system.Antiaim.freestanding_type:visibility(aa_system.Antiaim.freestanding_mode:get() == 2 and aa_system.Antiaim.freestanding:get());
            aa_system.Antiaim.freestanding_disable:visibility(aa_system.Antiaim.freestanding_mode:get() == 1 and aa_system.Antiaim.freestanding:get());
            aa_system.Antiaim.manualyaw:visibility(aa_system.Antiaim.enable_antiaim_system:get());
            aa_system.Antiaim.freestanding:visibility(aa_system.Antiaim.enable_antiaim_system:get());
            aa_system.Antiaim.export_config:visibility(aa_system.Antiaim.enable_antiaim_system:get());
            aa_system.Antiaim.load_config:visibility(aa_system.Antiaim.enable_antiaim_system:get());
            aa_system.Antiaim.preset_config:visibility(aa_system.Antiaim.enable_antiaim_system:get());
            for v211, _ in pairs(aa_system.menu.player_states) do
                local v213 = v209 == aa_system.menu.player_states[v211];
                local l_defensive_aa_0 = aa_system.condition[v211].defensive_aa;
                local l_yaw_modifier_real_0 = aa_system.condition[v211].yaw_modifier_real;
                aa_system.condition[v211].yaw_modifier:visibility(v210 and v213);
                aa_system.condition[v211].yaw_modifier_real:visibility(v210 and v213);
                aa_system.condition[v211].yawmodifieroffsetaaa:visibility(v210 and v213);
                aa_system.condition[v211].body:visibility(v210 and v213);
                aa_system.condition[v211].defensive_aa:visibility(v210 and v213);
                aa_system.condition2[v211].defensive_aa_pitch:visibility(v210 and v213 and l_defensive_aa_0:get());
                aa_system.condition2[v211].defensive_aa_yaw:visibility(v210 and v213 and l_defensive_aa_0:get());
                aa_system.condition2[v211].yaw_offset:visibility(v210 and v213 and l_yaw_modifier_real_0:get() ~= "L&R");
                aa_system.condition2[v211].yaw_offset_left:visibility(v210 and v213 and l_yaw_modifier_real_0:get() == "L&R");
                aa_system.condition2[v211].yaw_offset_right:visibility(v210 and v213 and l_yaw_modifier_real_0:get() == "L&R");
                aa_system.condition2[v211].yaw_offset_delay:visibility(v210 and v213 and l_yaw_modifier_real_0:get() == "L&R");
            end;
        end, 
        set_callback = function()
            for _, v217 in pairs(aa_system.Antiaim) do
                v217:set_callback(aa_system.menu.visible);
            end;
            for v218, _ in pairs(aa_system.condition) do
                for _, v221 in pairs(aa_system.condition[v218]) do
                    v221:set_callback(aa_system.menu.visible);
                end;
            end;
        end
    }, 
    menufunc = function()
        aa_system.menu.create();
        aa_system.menu.visible();
        aa_system.menu.set_callback();
    end
};
aa_system.menufunc();
local v222 = {
    is_edging = false, 
    angle = 0, 
    vecTraceStart = vector(0, 0, 0)
};
v222.on_edge = function(v223)
    -- upvalues: v222 (ref)
    v222.is_edging = false;
    if antiaim_state_real == "Air" or antiaim_state_real == "Air+Duck" or not aa_system.Antiaim.freestanding:get() or aa_system.Antiaim.freestanding_mode:get() ~= 2 or aa_system.Antiaim.manualyaw:get() ~= "Disabled" then
        return;
    else
        local v224 = entity.get_local_player();
        if v224 == nil then
            return;
        else
            if v223.send_packet then
                v222.vecTraceStart = v224:get_eye_position();
            end;
            local v225 = {};
            local v226 = render.camera_angles();
            local v227 = {};
            for v228 = 18, 360, 18 do
                v228 = math.normalize_yaw(v228);
                local v229 = v222.vecTraceStart + vector():angles(0, v228) * 198;
                local v230 = utils.trace_line(v222.vecTraceStart, v229, v224, 1174421507);
                table.insert(v227, v222.vecTraceStart:dist(v230.end_pos));
                local l_fraction_0 = v230.fraction;
                local l_entity_0 = v230.entity;
                if l_entity_0 and l_entity_0:get_classname() == "CWorld" and l_fraction_0 < 0.3 then
                    v225[#v225 + 1] = {
                        vecTraceEnd = v229, 
                        flYaw = v228
                    };
                end;
            end;
            table.sort(v227);
            if v227[1] > aa_system.Antiaim.freestanding_edge_distance:get() then
                v222.is_edging = false;
                return;
            else
                table.sort(v225, function(v233, v234)
                    return v233.flYaw < v234.flYaw;
                end);
                table.remove(v225, #v225);
                local v235 = nil;
                if #v225 >= 3 then
                    local v236 = v225[1].vecTraceEnd:lerp(v225[#v225].vecTraceEnd, 0.5);
                    v235 = (v222.vecTraceStart - v236):angles();
                end;
                if v235 then
                    local l_y_0 = v226.y;
                    local l_y_1 = v235.y;
                    local v239 = math.normalize_yaw(l_y_1 - l_y_0);
                    if math.abs(v239) < 90 then
                        v239 = 0;
                        l_y_0 = math.normalize_yaw(l_y_1 + 180);
                    end;
                    local v240 = -l_y_0;
                    v222.angle = math.normalize_yaw(v240 + l_y_1 + v239 + 180);
                    v222.is_edging = true;
                end;
                return;
            end;
        end;
    end;
end;
Antiaim = {
    values = {
        pitch = "Down", 
        yaw_o = 0, 
        right_limit = 0, 
        freestanding_by = "Off", 
        left_limit = 0, 
        condition = 1, 
        yawmodifier = "Disabled", 
        body = "", 
        yaw_modifier_value = 0, 
        yawbaseaa = "At Target", 
        yaw = "Backward", 
        fakeoption = {
            avoidoverlap = false, 
            anti_bruteforce = false, 
            randomjitter = false, 
            jitter = false
        }
    }, 
    SettingValues = function()
        -- upvalues: v41 (ref)
        local v241 = Antiaim.states();
        local _ = math.floor(math.min(entity.get_local_player().m_flPoseParameter[11] * (v41.body.left_limit:get() * 2) - v41.body.left_limit:get())) > 0;
        local v243 = aa_system.condition[v241].yaw_modifier_real:get() == "L&R";
        local v244 = aa_system.condition2[v241].yaw_offset_delay:get();
        if v243 then
            if tick == nil then
                tick = 0;
            end;
            tick = tick + 1;
            if v244 <= tick then
                tick = 0;
                if flick == nil then
                    flick = true;
                    Antiaim.values.yaw_o = aa_system.condition2[v241].yaw_offset_left:get();
                else
                    flick = nil;
                    Antiaim.values.yaw_o = aa_system.condition2[v241].yaw_offset_right:get();
                end;
            end;
        else
            Antiaim.values.yaw_o = aa_system.condition2[v241].yaw_offset:get();
        end;
        Antiaim.values.pitch = "Down";
        Antiaim.values.left_offset = aa_system.condition2[v241].yaw_offset_left:get();
        Antiaim.values.right_offset = aa_system.condition2[v241].yaw_offset_right:get();
        Antiaim.values.hidden = aa_system.condition2[v241].yaw_hidden:get();
        Antiaim.values.yaw = aa_system.condition[v241].yaw_modifier_real:get() == "L&R" and "Backward" or aa_system.condition[v241].yaw_modifier_real:get();
        Antiaim.values.yawbaseaa = aa_system.condition2[v241].yaw_base:get();
        local l_values_0 = Antiaim.values;
        if aa_system.Antiaim.freestanding_mode:get() ~= 2 or not aa_system.Antiaim.freestanding:get() or aa_system.Antiaim.freestanding_type:get() == 2 then

        end;
        l_values_0.yawmodifier = aa_system.condition[v241].yaw_modifier:get();
        Antiaim.values.yaw_modifier_value = aa_system.condition[v241].yawmodifieroffsetaaa:get();
        Antiaim.values.fakeoption.avoidoverlap = aa_system.condition2[v241].jitter_options:get("Avoid Overlap");
        l_values_0 = Antiaim.values.fakeoption;
        if aa_system.Antiaim.freestanding_mode:get() ~= 2 or not aa_system.Antiaim.freestanding:get() or aa_system.Antiaim.freestanding_type:get() == 2 then

        end;
        l_values_0.jitter = aa_system.condition2[v241].jitter_options:get("Jitter");
        Antiaim.values.fakeoption.randomjitter = aa_system.condition2[v241].jitter_options:get("Randomize Jitter");
        Antiaim.values.fakeoption.anti_bruteforce = aa_system.condition2[v241].jitter_options:get("Anti Bruteforce");
        Antiaim.values.fsbodyyaw = aa_system.condition2[v241].freestanding_by:get();
        Antiaim.values.left_limit = aa_system.condition2[v241].fake_left_limit:get();
        Antiaim.values.right_limit = aa_system.condition2[v241].fake_right_limit:get();
        Antiaim.values.defensive_aa = aa_system.condition[v241].defensive_aa:get();
        Antiaim.values.defensive_aa_pitch = aa_system.condition2[v241].defensive_aa_pitch:get();
        Antiaim.values.defensive_aa_yaw = aa_system.condition2[v241].defensive_aa_yaw:get();
        Antiaim.values.freestanding = aa_system.Antiaim.freestanding:get();
    end, 
    states = function()
        -- upvalues: v42 (ref)
        local v246 = entity.get_local_player();
        if rage.exploit:get() == 1 and statefunc.on_ground(v246, 8) and statefunc.is_crouching(v246) then
            Antiaim.values.condition = 7;
        elseif rage.exploit:get() == 1 and (statefunc.in_air(v246) or v246.in_jump) and statefunc.is_crouching(v246) and not statefunc.on_ground(v246, 8) then
            Antiaim.values.condition = 6;
        elseif rage.exploit:get() == 1 and (statefunc.in_air(v246) or v246.in_jump) and not statefunc.on_ground(v246, 8) then
            Antiaim.values.condition = 5;
        elseif rage.exploit:get() == 1 and v42.slowwalk:get() and (not statefunc.in_air(v246) or not v246.in_jump) and statefunc.on_ground(v246, 8) and statefunc.velocity(v246) < 85 then
            Antiaim.values.condition = 4;
        elseif rage.exploit:get() == 1 and statefunc.on_ground(v246, 8) and statefunc.velocity(v246) > 3 and not v42.slowwalk:get() then
            Antiaim.values.condition = 3;
        elseif rage.exploit:get() == 1 and statefunc.on_ground(v246, 8) and statefunc.velocity(v246) < 3 and not v42.slowwalk:get() then
            Antiaim.values.condition = 2;
        elseif rage.exploit:get() < 1 and statefunc.velocity(v246) > 3 and not v42.slowwalk:get() then
            Antiaim.values.condition = 1;
        end;
        return Antiaim.values.condition;
    end, 
    setup = function()
        -- upvalues: v42 (ref), v41 (ref), v11 (ref), v39 (ref), v222 (ref), v40 (ref), v45 (ref)
        if not aa_system.Antiaim.enable_antiaim_system:get() then
            v42.enableaa:disabled(false);
            v41.pitch:disabled(false);
            v41.yaw:disabled(false);
            v41.yawmodifier:disabled(false);
            v42.fake:disabled(false);
            v42.freestanding:disabled(false);
            v42.rollicek:disabled(false);
            v41.pitch:set("Down");
            v41.dt:set("On Peek");
            v41.yaw:override();
            v41.yawbaseaa:override();
            v41.yaw_o:override();
            v41.yawmodifier:override();
            v41.yawmodifieroffsetaa:override();
            v41.body.fake:override();
            v41.body.fakeoption:override(" ", " ", " ", " ");
            v41.body.fsbodyyaw:override();
            v41.body.left_limit:override();
            v41.body.right_limit:override();
        else
            v42.enableaa:disabled(true);
            v41.pitch:disabled(true);
            v41.yaw:disabled(true);
            v41.yawmodifier:disabled(true);
            v42.fake:disabled(true);
            v42.freestanding:disabled(true);
            v42.rollicek:disabled(true);
            Antiaim.SettingValues();
            if aa_system.Antiaim.config_type:get() == "Builder" then
                v41.yawbaseaa:override(Antiaim.values.yawbaseaa);
                if Antiaim.values.defensive_aa and v41.fakeduck:get() == false and aa_system.Antiaim.manualyaw:get() == "Disabled" then
                    pitch = math.random(1, 8);
                    if Antiaim.values.defensive_aa_pitch == "Default" then
                        v41.dt:set("Always On");
                        if pitch == 1 then
                            v41.pitch:set("Down");
                        elseif pitch == 2 then
                            v41.pitch:set("Fake Up");
                        elseif pitch == 3 then
                            v41.pitch:set("Down");
                        elseif pitch == 4 then
                            v41.pitch:set("Fake Up");
                        end;
                    elseif Antiaim.values.defensive_aa_pitch == "DT Based" then
                        v41.dt:set("Always On");
                        if v11() == true then
                            v41.pitch:set("Fake Up");
                        elseif v11() == false then
                            v41.pitch:set("Down");
                        end;
                    elseif Antiaim.values.defensive_aa_pitch == "Random" then
                        v41.dt:set("Always On");
                        if pitch == 1 then
                            v41.pitch:set("Down");
                        elseif pitch == 2 then
                            v41.pitch:set("Fake Up");
                        elseif pitch == 3 then
                            v41.pitch:set("Disabled");
                        elseif pitch == 4 then
                            v41.pitch:set("Down");
                        elseif pitch == 5 then
                            v41.pitch:set("Fake Up");
                        elseif pitch == 6 then
                            v41.pitch:set("Disabled");
                        end;
                    elseif Antiaim.values.defensive_aa_pitch == "Fake up" then
                        v41.dt:set("Always On");
                        if pitch == 1 then
                            v41.pitch:set("Fake Up");
                        end;
                    elseif Antiaim.values.defensive_aa_pitch == "Fake down" then
                        v41.dt:set("Always On");
                        if pitch == 1 then
                            v41.pitch:set("Fake Down");
                        end;
                    elseif Antiaim.values.defensive_aa_pitch == "Zero pitch" then
                        v41.dt:set("Always On");
                        if pitch == 1 then
                            v41.pitch:set("Disabled");
                        end;
                    end;
                    if Antiaim.values.defensive_aa_yaw == "Spin" then
                        v41.yawmodifieroffsetaa:override(1);
                        v41.yawmodifier:override("Disabled");
                        v41.yaw_o:override(0);
                        if v39 < 180 then
                            v39 = v39 + 30;
                            v41.yaw_o:override(v39);
                            if v39 == 180 then
                                v39 = -v39;
                            end;
                        end;
                    elseif Antiaim.values.defensive_aa_yaw == "DT Based" then
                        v41.dt:set("Always On");
                        if v11() == true then
                            v41.spin:override(-175);
                            v41.yawmodifier:override("Center");
                            v41.yawmodifieroffsetaa:override(95);
                        else
                            v41.yaw_o:override(-15);
                        end;
                    elseif Antiaim.values.defensive_aa_yaw == "SideWays" then
                        v41.dt:set("Always On");
                        if v11() == true then
                            v41.spin:override(-165);
                            v41.yawmodifier:override("Center");
                            v41.yawmodifieroffsetaa:override(180);
                        else
                            v41.spin:override(-1);
                            v41.yawmodifieroffsetaa:override(0);
                            v41.yaw_o:override(20);
                        end;
                    elseif Antiaim.values.defensive_aa_yaw == "Jitter" then
                        v41.yaw_o:override();
                        v41.yawmodifier:override("Center");
                        v41.yawmodifieroffsetaa:override(30);
                        v41.yaw_o:override(0);
                    elseif Antiaim.values.defensive_aa_yaw == "3-WAY" then
                        v41.yaw_o:override();
                        v41.yawmodifieroffsetaa:override(60);
                        v41.yawmodifier:override("3-WAY");
                        v41.yaw_o:override(0);
                    elseif Antiaim.values.defensive_aa_yaw == "5-WAY" then
                        v41.yaw_o:override();
                        v41.yawmodifieroffsetaa:override(80);
                        v41.yawmodifier:override("5-WAY");
                        v41.yaw_o:override(0);
                    elseif Antiaim.values.defensive_aa_yaw == "Static" then
                        v41.yaw_o:override(0);
                        v41.yawmodifieroffsetaa:override(1);
                        v41.yawmodifier:override("Disabled");
                    end;
                else
                    if aa_system.Antiaim.freestanding:get() and aa_system.Antiaim.freestanding_mode:get() == 1 and aa_system.Antiaim.manualyaw:get() == "Disabled" then
                        v42.freestanding:set(Antiaim.values.freestanding);
                        v41.yawmodifieroffsetaa:override(Antiaim.values.yaw_modifier_value);
                        v41.yawmodifier:override(Antiaim.values.yawmodifier);
                        v41.yaw_o:override(Antiaim.values.yaw_o);
                        ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"):override(aa_system.Antiaim.freestanding_disable:get());
                    elseif aa_system.Antiaim.freestanding:get() and v222.is_edging and aa_system.Antiaim.freestanding_mode:get() == 2 and aa_system.Antiaim.manualyaw:get() == "Disabled" then
                        v42.freestanding:set(false);
                        v41.yawmodifieroffsetaa:override(Antiaim.values.yaw_modifier_value);
                        v41.yawmodifier:override(aa_system.Antiaim.freestanding_type:get() == 1 and "Disabled" or Antiaim.values.yawmodifier);
                        v41.yaw_o:override(v222.angle);
                        ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"):override();
                    else
                        v42.freestanding:set(false);
                        ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"):override();
                        if Antiaim.values.is_slow then
                            v41.yaw:override("Backwards");
                            v41.yawmodifieroffsetaa:override(Antiaim.values.yaw_modifier_value);
                            v41.yawmodifier:override(Antiaim.values.yawmodifier);
                            if v40 < Antiaim.values.slow_offset then
                                v40 = v40 + 4;
                                if v40 > Antiaim.values.slow_offset - 4 then
                                    v40 = -v40;
                                end;
                            end;
                        else
                            v41.yaw:override(Antiaim.values.yaw);
                            if aa_system.Antiaim.manualyaw:get() == "Disabled" then
                                v41.yaw_o:override(Antiaim.values.yaw_o);
                            elseif aa_system.Antiaim.manualyaw:get() == "Forward" then
                                v41.yaw:override("Backward");
                                v41.yaw_o:override(180);
                            elseif aa_system.Antiaim.manualyaw:get() == "Left" then
                                v41.yaw:override("Backward");
                                v41.yaw_o:override(-90);
                            elseif aa_system.Antiaim.manualyaw:get() == "Right" then
                                v41.yaw:override("Backward");
                                v41.yaw_o:override(90);
                            end;
                            v41.yawmodifieroffsetaa:override(Antiaim.values.yaw_modifier_value);
                            v41.yawmodifier:override(Antiaim.values.yawmodifier);
                        end;
                    end;
                    if aa_system.Antiaim.enable_airexploit:get() == false then
                        v41.dt:set("On Peek");
                    end;
                    v41.pitch:set(Antiaim.values.pitch);
                    v41.hidden:set(Antiaim.values.hidden);
                end;
                v41.body.fake:override(Antiaim.values.fake);
                v41.body.fakeoption:override(Antiaim.values.fakeoption.avoidoverlap and "Avoid Overlap" or " ", not aa_system.Antiaim.freestanding_type:get() == 2 and Antiaim.values.fakeoption.jitter and "Jitter" or " ", Antiaim.values.fakeoption.randomjitter and "Randomize Jitter" or " ", Antiaim.values.fakeoption.anti_bruteforce and "Anti Bruteforce" or " ");
                v41.body.fsbodyyaw:override(Antiaim.values.fsbodyyaw);
                v41.body.left_limit:override(Antiaim.values.left_limit);
                v41.body.right_limit:override(Antiaim.values.right_limit);
            elseif aa_system.Antiaim.config_type:get() == "Preset" then
                if aa_system.Antiaim.presets:get() == "Tank-AA" then
                    v42.pitch:set(Antiaim.values.pitch);
                    v42.yaw:set("Backward");
                    v42.yawbase:set(Antiaim.values.yawbaseaa);
                    v42.yawadd:set(0);
                    v42.yawmodifier:set("Center");
                    v41.hidden:set(true);
                    v42.yawmodifier_offset:set(35);
                    v42.fake:set(true);
                    v42.fakeoption:set(" ", "Jitter", " ", "Anti Bruteforce");
                    v42.fsbodyyaw:override("None");
                    v42.left_limit:override(60);
                    v42.right_limit:override(60);
                elseif aa_system.Antiaim.presets:get() == "Low jitter" then
                    v42.pitch:set(Antiaim.values.pitch);
                    v42.yaw:set("Backward");
                    v42.yawbase:set(Antiaim.values.yawbaseaa);
                    v42.yawadd:set(0);
                    v42.yawmodifier:set("Center");
                    v41.hidden:set(true);
                    v42.yawmodifier_offset:set(10);
                    v42.fake:set(true);
                    v42.fakeoption:set(" ", "Jitter", " ", "Anti Bruteforce");
                    v42.fsbodyyaw:override("None");
                    v42.left_limit:override(25);
                    v42.right_limit:override(25);
                elseif aa_system.Antiaim.presets:get() == "Static" then
                    v42.pitch:set(Antiaim.values.pitch);
                    v42.yaw:set("Backward");
                    v42.yawbase:set(Antiaim.values.yawbaseaa);
                    v42.yawadd:set(0);
                    v42.yawmodifier:set("Disabled");
                    v41.hidden:set(true);
                    v42.yawmodifier_offset:set(0);
                    v42.fake:set(true);
                    v42.fakeoption:set("Avoid Overlap", " ", " ", "Anti Bruteforce");
                    v42.fsbodyyaw:override("Off");
                    v42.left_limit:override(48);
                    v42.right_limit:override(48);
                elseif aa_system.Antiaim.presets:get() == "3Way jitter" then
                    if v45 > 3 then
                        v45 = 1;
                    end;
                    v42.pitch:set(Antiaim.values.pitch);
                    v42.yaw:set("Backward");
                    v42.yawbase:set(Antiaim.values.yawbaseaa);
                    v42.yawadd:set(5);
                    v42.yawmodifier:set("3-Way");
                    v42.yawmodifier_offset:set(55);
                    v42.fake:set(true);
                    v42.fakeoption:set(" ", " ", " ", "Anti Bruteforce");
                    v42.fsbodyyaw:override("Off");
                    v42.left_limit:override(45);
                    v42.right_limit:override(45);
                elseif aa_system.Antiaim.presets:get() == "5Way jitter" then
                    if v45 == 5 then
                        v45 = 1;
                    end;
                    v42.pitch:set(Antiaim.values.pitch);
                    v42.yaw:set("Backward");
                    v42.yawbase:set(Antiaim.values.yawbaseaa);
                    v42.yawadd:set(5);
                    v42.yawmodifier:set("5-Way");
                    v42.yawmodifier_offset:set(65);
                    v42.fake:set(true);
                    v42.fakeoption:set(" ", " ", " ", "Anti Bruteforce");
                    v42.fsbodyyaw:override("Off");
                    v42.left_limit:override(45);
                    v42.right_limit:override(45);
                end;
            end;
        end;
    end
};
callback = {
    createmove = function()
        Antiaim.setup();
    end, 
    setup = function()
        events.createmove:set(function()
            callback.createmove();
        end);
    end
};
callback.setup();
local v247 = panorama.loadstring(" return { parse: JSON.parse, stringify: JSON.stringify }; ")();
local v248 = {
    cfg_data = {
        ints = {}, 
        strings = {}, 
        bools = {}, 
        funny_menustuff = {}
    }
};
table.insert(v248.cfg_data.strings, aa_system.Antiaim.config_type);
table.insert(v248.cfg_data.strings, aa_system.Antiaim.presets);
table.insert(v248.cfg_data.bools, aa_system.Antiaim.enable_animbreakers);
table.insert(v248.cfg_data.bools, aa_system.Antiaim.enable_airexploit);
table.insert(v248.cfg_data.ints, aa_system.Antiaim.animation_breakers);
for v249, _ in ipairs(aa_system.menu.player_states) do
    table.insert(v248.cfg_data.ints, aa_system.condition2[v249].yaw_offset);
    table.insert(v248.cfg_data.strings, aa_system.condition[v249].yaw_modifier);
    table.insert(v248.cfg_data.ints, aa_system.condition[v249].yawmodifieroffsetaaa);
    table.insert(v248.cfg_data.bools, aa_system.condition[v249].body);
    table.insert(v248.cfg_data.ints, aa_system.condition2[v249].jitter_options);
    table.insert(v248.cfg_data.strings, aa_system.condition2[v249].freestanding_by);
    table.insert(v248.cfg_data.ints, aa_system.condition2[v249].fake_left_limit);
    table.insert(v248.cfg_data.ints, aa_system.condition2[v249].fake_right_limit);
    table.insert(v248.cfg_data.bools, aa_system.condition[v249].defensive_aa);
    table.insert(v248.cfg_data.ints, aa_system.condition2[v249].defensive_aa_pitch);
    table.insert(v248.cfg_data.ints, aa_system.condition2[v249].defensive_aa_yaw);
    table.insert(v248.cfg_data.ints, aa_system.condition2[v249].yaw_offset_left);
    table.insert(v248.cfg_data.ints, aa_system.condition2[v249].yaw_offset_right);
    table.insert(v248.cfg_data.strings, aa_system.condition[v249].yaw_modifier_real);
    table.insert(v248.cfg_data.strings, aa_system.condition2[v249].yaw_base);
    table.insert(v248.cfg_data.ints, aa_system.condition2[v249].yaw_offset_delay);
    table.insert(v248.cfg_data.bools, aa_system.Antiaim.freestanding_disable);
    table.insert(v248.cfg_data.bools, aa_system.Antiaim.freestanding);
    table.insert(v248.cfg_data.ints, aa_system.Antiaim.freestanding_type);
    table.insert(v248.cfg_data.ints, aa_system.Antiaim.freestanding_mode);
    table.insert(v248.cfg_data.ints, aa_system.Antiaim.freestanding_edge_distance);
end;
local v251 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
v248.encrypt = function(v252)
    -- upvalues: v251 (ref)
    return (v252:gsub(".", function(v253)
        local v254 = "";
        local v255 = v253:byte();
        for v256 = 8, 1, -1 do
            v254 = v254 .. (v255 % 2 ^ v256 - v255 % 2 ^ (v256 - 1) > 0 and "1" or "0");
        end;
        return v254;
    end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(v257)
        -- upvalues: v251 (ref)
        if #v257 < 6 then
            return "";
        else
            local v258 = 0;
            for v259 = 1, 6 do
                v258 = v258 + (v257:sub(v259, v259) == "1" and 2 ^ (6 - v259) or 0);
            end;
            return v251:sub(v258 + 1, v258 + 1);
        end;
    end) .. ({
        [1] = "", 
        [2] = "==", 
        [3] = "="
    })[#v252 % 3 + 1];
end;
v248.decrypt = function(v260)
    -- upvalues: v251 (ref)
    return (string.gsub(v260, "[^" .. v251 .. "=]", ""):gsub(".", function(v261)
        -- upvalues: v251 (ref)
        if v261 == "=" then
            return "";
        else
            local v262 = "";
            local v263 = v251:find(v261) - 1;
            for v264 = 6, 1, -1 do
                v262 = v262 .. (v263 % 2 ^ v264 - v263 % 2 ^ (v264 - 1) > 0 and "1" or "0");
            end;
            return v262;
        end;
    end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(v265)
        if #v265 ~= 8 then
            return "";
        else
            local v266 = 0;
            for v267 = 1, 8 do
                v266 = v266 + (v265:sub(v267, v267) == "1" and 2 ^ (8 - v267) or 0);
            end;
            return string.char(v266);
        end;
    end));
end;
export = function()
    -- upvalues: v248 (ref), v6 (ref), v247 (ref)
    local v268 = {
        [1] = {}, 
        [2] = {}, 
        [3] = {}, 
        [4] = {}
    };
    for _, v270 in pairs(v248.cfg_data.ints) do
        table.insert(v268[1], v270:get());
    end;
    for _, v272 in pairs(v248.cfg_data.strings) do
        table.insert(v268[2], v272:get());
    end;
    for _, v274 in pairs(v248.cfg_data.bools) do
        table.insert(v268[3], v274:get());
    end;
    v6.set("[fivesense]_" .. v248.encrypt(v247.stringify(v268)));
    common.add_notify("\aDEFAULTFive\a95b806FFSense", "Config has been exported successfully");
end;
import = function(v275)
    -- upvalues: v6 (ref), v247 (ref), v248 (ref)
    local l_status_0, _ = pcall(function()
        -- upvalues: v275 (ref), v6 (ref), v247 (ref), v248 (ref)
        local v276 = false;
        if v275 == nil then
            v275 = v6.get();
        else
            v276 = true;
        end;
        v275 = string.sub(v275, 12);
        local v277 = v247.parse(v248.decrypt(v275));
        if v277 == nil then
            if v276 == true then
                common.add_notify("\aDEFAULTFive\a95b806FFSense", "Failed to import default config");
            else
                common.add_notify("\aDEFAULTFive\a95b806FFSense", "Failed to import config");
            end;
        else
            for v278, v279 in pairs(v277) do
                v278 = ({
                    [1] = "ints", 
                    [2] = "strings", 
                    [3] = "bools"
                })[v278];
                for v280, v281 in pairs(v279) do
                    if v278 == "ints" then
                        v248.cfg_data[v278][v280]:set(v281);
                    end;
                    if v278 == "strings" then
                        v248.cfg_data[v278][v280]:set(v281);
                    end;
                    if v278 == "bools" then
                        v248.cfg_data[v278][v280]:set(v281);
                    end;
                end;
            end;
        end;
    end);
    if not l_status_0 then
        common.add_notify("\aDEFAULTFive\a95b806FFSense", "Failed to import config");
        return;
    else
        common.add_notify("\aDEFAULTFive\a95b806FFSense", "Config has been imported successfully");
        return;
    end;
end;
importDefault = function(_)
    local function v285()
        import("[fivesense]_eyIxIjp7IjEiOnsiMSI6IlBpdGNoIDAgb24gbGFuZCIsIjIiOiJNb29uV2FsayIsIjMiOiJTdGF0aWMgbGVncyBpbiBhaXIiLCI0IjoiTW92ZSBsZWFuIn0sIjIiOjEwLCIzIjoxNywiNCI6eyIxIjoiQXZvaWQgT3ZlcmxhcCIsIjIiOiJBbnRpIEJydXRlZm9yY2UifSwiNSI6NjAsIjYiOjYwLCI3IjoiRGVmYXVsdCIsIjgiOiJEVCBCYXNlZCIsIjkiOi0yNSwiMTAiOjI4LCIxMSI6MjAsIjEyIjoyMSwiMTMiOjEsIjE0IjoxMCwiMTUiOjIwLCIxNiI6MiwiMTciOnsiMSI6IkF2b2lkIE92ZXJsYXAiLCIyIjoiQW50aSBCcnV0ZWZvcmNlIn0sIjE4Ijo2MCwiMTkiOjYwLCIyMCI6IkRlZmF1bHQiLCIyMSI6IlNwaW4iLCIyMiI6MjQsIjIzIjotMTcsIjI0IjozLCIyNSI6MjEsIjI2IjoxLCIyNyI6MTAsIjI4IjowLCIyOSI6MjYsIjMwIjp7IjEiOiJBdm9pZCBPdmVybGFwIiwiMiI6IkFudGkgQnJ1dGVmb3JjZSJ9LCIzMSI6NjAsIjMyIjo2MCwiMzMiOiJEZWZhdWx0IiwiMzQiOiJTcGluIiwiMzUiOjM3LCIzNiI6LTI0LCIzNyI6OSwiMzgiOjIxLCIzOSI6MSwiNDAiOjEwLCI0MSI6MCwiNDIiOjI2LCI0MyI6eyIxIjoiQXZvaWQgT3ZlcmxhcCIsIjIiOiJBbnRpIEJydXRlZm9yY2UifSwiNDQiOjYwLCI0NSI6NjAsIjQ2IjoiRGVmYXVsdCIsIjQ3IjoiU3BpbiIsIjQ4IjoyNCwiNDkiOi0xNywiNTAiOjIxLCI1MSI6MjEsIjUyIjoxLCI1MyI6MTAsIjU0IjowLCI1NSI6MjUsIjU2Ijp7IjEiOiJBdm9pZCBPdmVybGFwIiwiMiI6IkppdHRlciIsIjMiOiJBbnRpIEJydXRlZm9yY2UifSwiNTciOjYwLCI1OCI6NjAsIjU5IjoiRGVmYXVsdCIsIjYwIjoiU3BpbiIsIjYxIjowLCI2MiI6MCwiNjMiOjAsIjY0IjoyMSwiNjUiOjEsIjY2IjoxMCwiNjciOjAsIjY4Ijo3LCI2OSI6eyIxIjoiQXZvaWQgT3ZlcmxhcCIsIjIiOiJBbnRpIEJydXRlZm9yY2UifSwiNzAiOjYwLCI3MSI6NjAsIjcyIjoiRFQgQmFzZWQiLCI3MyI6IlNwaW4iLCI3NCI6MTksIjc1IjotMjQsIjc2IjozLCI3NyI6MjEsIjc4IjoxLCI3OSI6MTAsIjgwIjowLCI4MSI6MTcsIjgyIjp7IjEiOiJBdm9pZCBPdmVybGFwIiwiMiI6IkppdHRlciIsIjMiOiJBbnRpIEJydXRlZm9yY2UifSwiODMiOjYwLCI4NCI6NjAsIjg1IjoiRGVmYXVsdCIsIjg2IjoiU3BpbiIsIjg3IjoxMiwiODgiOi0xMCwiODkiOjEyLCI5MCI6MjEsIjkxIjoxLCI5MiI6MTB9LCIyIjp7IjEiOiJCdWlsZGVyIiwiMiI6IlN0YXRpYyIsIjMiOiJDZW50ZXIiLCI0IjoiUGVlayBGYWtlIiwiNSI6IkJhY2t3YXJkIiwiNiI6IkF0IFRhcmdldCIsIjciOiJDZW50ZXIiLCI4IjoiUGVlayBSZWFsIiwiOSI6IkwmUiIsIjEwIjoiQXQgVGFyZ2V0IiwiMTEiOiIzLVdheSIsIjEyIjoiUGVlayBGYWtlIiwiMTMiOiJMJlIiLCIxNCI6IkF0IFRhcmdldCIsIjE1IjoiNS1XYXkiLCIxNiI6IlBlZWsgUmVhbCIsIjE3IjoiTCZSIiwiMTgiOiJBdCBUYXJnZXQiLCIxOSI6Ik9mZnNldCIsIjIwIjoiUGVlayBGYWtlIiwiMjEiOiJCYWNrd2FyZCIsIjIyIjoiQXQgVGFyZ2V0IiwiMjMiOiJDZW50ZXIiLCIyNCI6IlBlZWsgRmFrZSIsIjI1IjoiTCZSIiwiMjYiOiJBdCBUYXJnZXQiLCIyNyI6IlJhbmRvbSIsIjI4IjoiUGVlayBSZWFsIiwiMjkiOiJMJlIiLCIzMCI6IkF0IFRhcmdldCJ9LCIzIjp7IjEiOnRydWUsIjIiOnRydWUsIjMiOmZhbHNlLCI0IjpmYWxzZSwiNSI6ZmFsc2UsIjYiOmZhbHNlLCI3Ijp0cnVlLCI4Ijp0cnVlLCI5IjpmYWxzZSwiMTAiOmZhbHNlLCIxMSI6ZmFsc2UsIjEyIjpmYWxzZSwiMTMiOnRydWUsIjE0Ijp0cnVlLCIxNSI6ZmFsc2UsIjE2IjpmYWxzZSwiMTciOmZhbHNlLCIxOCI6ZmFsc2UsIjE5Ijp0cnVlLCIyMCI6dHJ1ZSwiMjEiOmZhbHNlLCIyMiI6ZmFsc2UsIjIzIjpmYWxzZSwiMjQiOmZhbHNlLCIyNSI6dHJ1ZSwiMjYiOnRydWUsIjI3IjpmYWxzZSwiMjgiOmZhbHNlLCIyOSI6ZmFsc2UsIjMwIjpmYWxzZSwiMzEiOnRydWUsIjMyIjp0cnVlLCIzMyI6ZmFsc2UsIjM0IjpmYWxzZSwiMzUiOmZhbHNlLCIzNiI6ZmFsc2UsIjM3Ijp0cnVlLCIzOCI6dHJ1ZSwiMzkiOmZhbHNlLCI0MCI6ZmFsc2UsIjQxIjpmYWxzZSwiNDIiOmZhbHNlLCI0MyI6dHJ1ZX0sIjQiOnt9fQ==");
    end;
    aa_system.Antiaim.config_type:set("Builder");
    local l_status_1, _ = pcall(v285);
    if not l_status_1 then
        common.add_notify("\aDEFAULTFive\a95b806FFSense", "Failed to import default config");
        return;
    else
        return;
    end;
end;
local v288 = {
    Installed = true
};
local v289 = {
    Settings = {
        [1] = "Main", 
        [2] = ui.get_icon("info") .. " \affffffFFi\af4f8e6FFn\aeaf1cdFFf\adfeab4FFo\ad5e39bFFr\acadc82FFm\abfd46aFFa\ab5cd51FFt\aaac638FFi\aa0bf1fFFo\a95b806FFn"
    }
};
local v292 = {
    Settings = {
        Enable = v4.Switch(v289.Settings, "Enable Status", {
            [1] = true
        }, nil, nil), 
        Large = v4.Text(v289.Settings, "Large Image", {}, nil, function(v290)
            -- upvalues: v4 (ref)
            return {
                Image = v4.Combo(v290, "Image", {
                    [1] = {
                        [1] = "Auto", 
                        [2] = "CS:GO Logo", 
                        [3] = "CS 2", 
                        [4] = "NL Logo", 
                        [5] = "CS:GO NL Logo", 
                        [6] = "Custom"
                    }
                }, nil, nil), 
                ImageCustom = v4.TextBox(v290, "Custom link", {}, nil, nil), 
                Text = v4.Combo(v290, "Text", {
                    [1] = {
                        [1] = "CS:GO", 
                        [2] = "CS 2", 
                        [3] = "neverlose.cc", 
                        [4] = "gamesense", 
                        [5] = "Custom"
                    }
                }, nil, nil), 
                TextCustom = v4.TextBox(v290, "Custom text", {}, nil, nil)
            };
        end), 
        Small = v4.Text(v289.Settings, "Small Image", {}, nil, function(v291)
            -- upvalues: v4 (ref)
            return {
                Image = v4.Combo(v291, "Image", {
                    [1] = {
                        [1] = "gamesense", 
                        [2] = "skeet", 
                        [3] = "neverlose.cc", 
                        [4] = "fivesense", 
                        [5] = "fatality", 
                        [6] = "primordial", 
                        [7] = "onetap", 
                        [8] = "aimware", 
                        [9] = "monolith", 
                        [10] = "nemesis", 
                        [11] = "pandora", 
                        [12] = "unmatched", 
                        [13] = "spirthack", 
                        [14] = "getrekt", 
                        [15] = "nixware", 
                        [16] = "Custom"
                    }
                }, nil, nil), 
                ImageCustom = v4.TextBox(v291, "Custom link", {}, nil, nil), 
                Text = v4.Combo(v291, "Text", {
                    [1] = {
                        [1] = "gamesense", 
                        [2] = "skeet", 
                        [3] = "neverlose.cc", 
                        [4] = "fivesense", 
                        [5] = "fatality", 
                        [6] = "primordial", 
                        [7] = "onetap", 
                        [8] = "aimware", 
                        [9] = "monolith", 
                        [10] = "nemesis", 
                        [11] = "pandora", 
                        [12] = "unmatched", 
                        [13] = "spirthack", 
                        [14] = "getrekt", 
                        [15] = "nixware", 
                        [16] = "CS:GO", 
                        [17] = "Custom"
                    }
                }, nil, nil), 
                TextCustom = v4.TextBox(v291, "Custom text", {}, nil, nil)
            };
        end)
    }
};
FixMenu = function()
    -- upvalues: v292 (ref), v288 (ref)
    v292.Settings.Enable:visibility(v288.Installed);
    v292.Settings.Large:visibility(v288.Installed and v292.Settings.Enable:get());
    v292.Settings.Large[0].ImageCustom:visibility(v292.Settings.Large[0].Image:get("Custom") and v292.Settings.Enable:get());
    v292.Settings.Large[0].TextCustom:visibility(v292.Settings.Large[0].Text:get("Custom") and v292.Settings.Enable:get());
    v292.Settings.Small:visibility(v288.Installed and v292.Settings.Enable:get());
    v292.Settings.Small[0].ImageCustom:visibility(v292.Settings.Small[0].Image:get("Custom") and v292.Settings.Enable:get());
    v292.Settings.Small[0].TextCustom:visibility(v292.Settings.Small[0].Text:get("Custom") and v292.Settings.Enable:get());
end;
firstToUpper = function(v293)
    return (v293:gsub("^%l", string.upper));
end;
local v294 = {
    Large = {
        Image = {
            Auto = "Auto", 
            ["CS:GO NL Logo"] = "nl_logo_csgo", 
            ["NL Logo"] = "nl_logo_ico", 
            ["CS 2"] = "https://i.imgur.com/z3DbQBA.png", 
            ["CS:GO Logo"] = "csgo_logo"
        }, 
        Text = {
            ["CS:GO"] = "Counter-Strike: Global Offensive", 
            Disabled = "", 
            gamesense = "Using gamesense.pub", 
            ["CS 2"] = "Counter-Strike 2", 
            ["neverlose.cc"] = "Using neverlose.cc"
        }
    }, 
    Small = {
        Image = {
            primordial = "https://i.imgur.com/p5pPZSG.png", 
            fatality = "https://i.imgur.com/EMXwDoo.jpg", 
            skeet = "https://i.imgur.com/lmxympHh.jpg", 
            nixware = "https://i.imgur.com/4j4dHHL.png", 
            monolith = "https://i.imgur.com/9FrSif0.png", 
            aimware = "https://i.imgur.com/6hMzTip.png", 
            ["neverlose.cc"] = "https://i.imgur.com/ciG5vRJ.jpg", 
            getrekt = "https://i.imgur.com/kAvwgfo.png", 
            spirthack = "https://i.imgur.com/G8Hs3lK.png", 
            unmatched = "https://i.imgur.com/TFsNsx6.png", 
            pandora = "https://i.imgur.com/0ONDVek.jpg", 
            nemesis = "https://i.imgur.com/3gK7zoa.png", 
            gamesense = "https://i.imgur.com/5iXnzLO.png", 
            fivesense = "https://i.imgur.com/dGJzWcK.png", 
            onetap = "https://i.imgur.com/8pxGdW2.png"
        }, 
        Text = {
            primordial = "Using primordial.dev", 
            fatality = "Using fatality.win", 
            skeet = "Using skeet.cc", 
            pandora = "Using pandora.gg", 
            ["neverlose.cc"] = "Using neverlose.cc", 
            ["CS:GO"] = "Counter-Strike: Global Offensive", 
            gamesense = "Using gamesense.pub", 
            fivesense = "Using fivesense.pub", 
            nixware = "Using nixware.cc", 
            getrekt = "Using getrekt.io", 
            spirthack = "Using spirthack.me", 
            unmatched = "Playing on unmatched.gg", 
            Disabled = "", 
            nemesis = "Using nemesis.technology", 
            monolith = "Using monolith.club", 
            aimware = "Using aimware.net", 
            onetap = "Using onetap.com"
        }
    }
};
local v295 = common.get_unixtime();
RenderDiscordRPC = function()
    -- upvalues: v288 (ref), v292 (ref), v2 (ref), v294 (ref), v295 (ref)
    if not v288.Installed then
        return;
    else
        if not v292.Settings.Enable:get() then
            pcall(function()
                -- upvalues: v2 (ref)
                v2.DiscordRPC:Destroy();
            end);
        end;
        local v296 = entity.get_local_player();
        pcall(function()
            -- upvalues: v2 (ref)
            v2.DiscordRPC:Register();
        end);
        local v297 = {
            Map = "Menu", 
            MapName = "Loading...", 
            Presence = {}, 
            Maps = {
                [1] = "mirage", 
                [2] = "inferno", 
                [3] = "cache", 
                [4] = "cbble", 
                [5] = "cobblestone", 
                [6] = "aztec", 
                [7] = "canals", 
                [8] = "dust", 
                [9] = "italy", 
                [10] = "nuke", 
                [11] = "vertigo", 
                [12] = "bank", 
                [13] = "lake", 
                [14] = "office", 
                [15] = "safehouse", 
                [16] = "bot_aimtrain_v4c", 
                [17] = "train", 
                [18] = "overpass", 
                [19] = "agency", 
                [20] = "assault", 
                [21] = "zoo", 
                [22] = "milita", 
                [23] = "mocha", 
                [24] = "pitstop", 
                [25] = "calavera"
            }
        };
        if v296 == nil then
            v297.Map = "Menu";
        elseif common.get_map_data() == nil then
            v297.Map = "Menu";
        else
            v297.Map = string.sub(common.get_map_data().shortname, 4, 100);
        end;
        v297.Map = v297.Map == "dust2" and "dust" or v297.Map;
        v297.MapName = v297.Map;
        if v294.Large.Image[v292.Settings.Large[0].Image:get()] == "Auto" then
            if v296 == nil then
                v297.Map = "csgo_logo";
            elseif v297.Map == "shortnuke" then
                v297.Map = "https://i.imgur.com/HYDrCpZ.jpg";
            elseif v297.Map == "nuke" then
                v297.Map = "https://i.imgur.com/2GRwSwC.png";
            elseif v297.Map == "shortdust" then
                v297.Map = "https://i.imgur.com/4qgOJpZ.png";
            elseif v297.Map == "militia" then
                v297.Map = "https://i.imgur.com/mYJMcA5.png";
            elseif v297.Map == "italy" then
                v297.Map = "https://i.imgur.com/XuQfBLn.jpg";
            elseif v297.Map == "italy" then
                v297.Map = "https://i.imgur.com/XuQfBLn.jpg";
            elseif v297.Map == "lake" then
                v297.Map = "https://i.imgur.com/L7kzSDX.png";
            elseif v297.Map == "chalice" then
                v297.Map = "https://i.imgur.com/FBR78PA.png";
            elseif v297.Map == "boyard" then
                v297.Map = "https://i.imgur.com/dlFwjF1.png";
            elseif v2.Table.Find(v297.Maps, v297.Map) == 0 then
                v297.Map = v294.Large.Image[v292.Settings.Large[0].Image:get()];
            else
                v297.Map = "https://i.imgur.com/5u1j3hU.png";
            end;
        else
            v297.Map = v294.Large.Image[v292.Settings.Large[0].Image:get()];
        end;
        local v298 = {
            LI = v297.Map, 
            LT = v294.Large.Text[v292.Settings.Large[0].Text:get()], 
            SI = v294.Small.Image[v292.Settings.Small[0].Image:get()], 
            ST = v294.Small.Text[v292.Settings.Small[0].Text:get()]
        };
        if v298.LI == nil then
            v298.LI = v292.Settings.Large[0].ImageCustom:get();
        end;
        if v298.LT == nil then
            v298.LT = v292.Settings.Large[0].TextCustom:get();
        end;
        if v298.SI == nil then
            v298.SI = v292.Settings.Small[0].ImageCustom:get();
        end;
        if v298.ST == nil then
            v298.ST = v292.Settings.Small[0].TextCustom:get();
        end;
        v297.Presence.largeImageKey = v298.LI;
        v297.Presence.largeImageText = v298.LT;
        v297.Presence.smallImageKey = v298.SI;
        v297.Presence.smallImageText = v298.ST;
        if v296 == nil then
            v297.Presence.details = "Status: In Main Menu";
            v297.Presence.state = "Waiting";
        else
            v297.Presence.details = "Status: Playing";
            v297.Presence.state = "Map: " .. firstToUpper(v297.MapName);
        end;
        v297.Presence.startTimestamp = v295;
        pcall(function()
            -- upvalues: v2 (ref), v297 (ref)
            v2.DiscordRPC:Update(v297.Presence);
        end);
        return;
    end;
end;
events.render:set(function()
    FixMenu();
    pcall(function()
        RenderDiscordRPC();
    end);
end);
visibility_function = function()
    -- upvalues: v152 (ref), v153 (ref), v154 (ref), v155 (ref), v156 (ref), v157 (ref), v158 (ref), v159 (ref), v161 (ref), v170 (ref), v171 (ref), v172 (ref), v173 (ref), v174 (ref), v163 (ref), v164 (ref), v165 (ref), v166 (ref), v167 (ref), v168 (ref), v169 (ref), v162 (ref), v181 (ref), v186 (ref), v187 (ref), v184 (ref), v175 (ref), v176 (ref), v178 (ref), v177 (ref), v179 (ref), v180 (ref), v188 (ref), v190 (ref), v191 (ref), v192 (ref), v193 (ref), v195 (ref), v196 (ref), v194 (ref), v197 (ref), v198 (ref)
    ragebot = v152:get();
    v153:visibility(ragebot);
    v154:visibility(ragebot);
    v155:visibility(ragebot);
    v156:visibility(ragebot and v155:get());
    v157:visibility(ragebot);
    v158:visibility(ragebot and v157:get());
    v159:visibility(ragebot and v157:get());
    visuals = v161:get();
    v170:visibility(visuals);
    v171:visibility(visuals and v170:get());
    v172:visibility(visuals and v170:get());
    v173:visibility(visuals and v170:get());
    v174:visibility(visuals and v170:get());
    v163:visibility(visuals);
    v164:visibility(visuals and v163:get());
    v165:visibility(visuals and v163:get());
    v166:visibility(visuals and v163:get());
    v167:visibility(visuals and v163:get());
    v168:visibility(visuals and v163:get());
    v169:visibility(visuals and v163:get());
    v162:visibility(visuals);
    v181:visibility(visuals);
    v186:visibility(visuals and v181:get("Watermark"));
    v187:visibility(visuals and v181:get("Watermark") and v186:get() == "Custom");
    v184:visibility(visuals and v181:get("Spectator list"));
    v175:visibility(visuals);
    v176:visibility(visuals and v175:get());
    v178:visibility(visuals and v175:get());
    v177:visibility(visuals and v175:get());
    v179:visibility(visuals);
    v180:visibility(visuals and v179:get());
    v188:visibility(visuals and v181:get("Watermark"));
    misc = v190:get();
    v191:visibility(misc);
    v192:visibility(misc and v191:get());
    v193:visibility(misc);
    v195:visibility(misc);
    v196:visibility(misc and v195:get());
    v194:visibility(misc);
    v197:visibility(misc);
    v198:visibility(misc and v197:get());
end;
local v299 = {
    x_slider = v160:slider("SpecXpos", 0, v94.x, 50, 0.01), 
    y_slider = v160:slider("SpecYpos", 0, v94.y, 50, 0.01), 
    keybinds_x_slider = v160:slider("X position", 0, v94.x, 150, 0.01), 
    keybinds_y_slider = v160:slider("Y position", 0, v94.y, 50, 0.01)
};
v299.x_slider:visibility(false);
v299.y_slider:visibility(false);
v299.keybinds_x_slider:visibility(false);
v299.keybinds_y_slider:visibility(false);
flashingcolor = function(v300, v301, v302)
    -- upvalues: v21 (ref), v22 (ref)
    if v21 == 255 then
        v22 = true;
    elseif v21 == 25 then
        v22 = false;
    end;
    if v22 then
        v21 = v21 - 5;
    elseif not v22 then
        v21 = v21 + 5;
    end;
    return color(v300, v301, v302, v21);
end;
local function v307(v303, v304, v305, v306)
    if v303 then
        return math.max(v304 + (v305 - v304) * globals.frametime * v306, 0);
    else
        return math.max(v304 - (v305 + v304) * globals.frametime * v306 / 2, 0);
    end;
end;
local v308 = v10.cast("int(__fastcall*)(const char*, const char*)", utils.opcode_scan("engine.dll", "53 56 57 8B DA 8B F9 FF 15"));
local function v310(v309)
    return math.floor(v309 / globals.tickinterval + 0.5);
end;
gamesense_anim = function(v311, v312)
    -- upvalues: v310 (ref)
    local _ = entity.get_local_player();
    if not globals.is_connected then
        return;
    else
        local v314 = "               " .. v311 .. "                      ";
        local l_tickinterval_0 = globals.tickinterval;
        local v316 = (globals.tickcount + math.floor(utils.net_channel().latency[0] + 0.1 / l_tickinterval_0 + 0.5)) / v310(0.3);
        v316 = v312[math.floor(v316 % #v312) + 1] + 1;
        return string.sub(v314, v316, v316 + 15);
    end;
end;
enabled_prev = true;
v308("\000", "\000");
local function v325(v317, v318, v319, v320, v321, v322)
    -- upvalues: v16 (ref)
    local v323 = common.is_button_down(1);
    local v324 = ui.get_mouse_position();
    if v317 <= v324.x and v324.x <= v317 + v319 and v318 <= v324.y and v324.y <= v318 + v320 and v323 and drag == false then
        drag = true;
        v16.kbx = v317 - v324.x;
        v16.kby = v318 - v324.y;
    end;
    if not v323 then
        drag = false;
    end;
    if drag == true and ui.get_alpha() == 1 then
        v321:set(v324.x + v16.kbx);
        v322:set(v324.y + v16.kby);
    end;
end;
local function v334(v326, v327, v328, v329, v330, v331)
    -- upvalues: v17 (ref)
    local v332 = common.is_button_down(1);
    local v333 = ui.get_mouse_position();
    if v326 <= v333.x and v333.x <= v326 + v328 and v327 <= v333.y and v333.y <= v327 + v329 and v332 and eldrag == false then
        eldrag = true;
        v17.x = v326 - v333.x;
        v17.y = v327 - v333.y;
    end;
    if not v332 then
        eldrag = false;
    end;
    if eldrag == true and ui.get_alpha() == 1 then
        v330:set(v333.x + v17.x);
        v331:set(v333.y + v17.y);
    end;
end;
jmp_ecx = utils.opcode_scan("engine.dll", "FF E1");
fnGetModuleHandle = v10.cast("uint32_t(__fastcall*)(unsigned int, unsigned int, const char*)", jmp_ecx);
fnGetProcAddress = v10.cast("uint32_t(__fastcall*)(unsigned int, unsigned int, uint32_t, const char*)", jmp_ecx);
pGetProcAddress = v10.cast("uint32_t**", v10.cast("uint32_t", utils.opcode_scan("engine.dll", "FF 15 ? ? ? ? A3 ? ? ? ? EB 05")) + 2)[0][0];
pGetModuleHandle = v10.cast("uint32_t**", v10.cast("uint32_t", utils.opcode_scan("engine.dll", "FF 15 ? ? ? ? 85 C0 74 0B")) + 2)[0][0];
BindExports = function(v335, v336, v337)
    -- upvalues: v10 (ref)
    local v338 = v10.typeof(v337);
    return function(...)
        -- upvalues: v10 (ref), v338 (ref), v335 (ref), v336 (ref)
        return v10.cast(v338, jmp_ecx)(fnGetProcAddress(pGetProcAddress, 0, fnGetModuleHandle(pGetModuleHandle, 0, v335), v336), 0, ...);
    end;
end;
fnEnumDisplaySettingsA = BindExports("user32.dll", "EnumDisplaySettingsA", "int(__fastcall*)(unsigned int, unsigned int, unsigned int, unsigned long, void*)");
pLpDevMode = v10.new("struct { char pad_0[120]; unsigned long dmDisplayFrequency; char pad_2[32]; }[1]");
fnEnumDisplaySettingsA(0, 4294967295, pLpDevMode[0]);
getspectators = function()
    local v339 = {};
    local v340, v341 = entity.get_local_player();
    if v340 ~= nil then
        if v340.m_hObserverTarget and (v340.m_iObserverMode == 4 or v340.m_iObserverMode == 5) then
            v341 = v340.m_hObserverTarget;
        else
            v341 = v340;
        end;
        entity.get_players(false, false, function(v342)
            -- upvalues: v341 (ref), v340 (ref), v339 (ref)
            if v342:is_alive() then
                return;
            else
                local l_m_hObserverTarget_0 = v342.m_hObserverTarget;
                local l_m_iObserverMode_0 = v342.m_iObserverMode;
                if l_m_hObserverTarget_0 and l_m_hObserverTarget_0 == v341 and v342 ~= v340 and (l_m_iObserverMode_0 == 4 or l_m_iObserverMode_0 == 5) then
                    v339[#v339 + 1] = v342;
                end;
                return;
            end;
        end);
    end;
    return v339;
end;
desync_normalize = function(v345)
    return v345 > 0 and v345 or -v345;
end;
local _ = 0;
local v347 = 0;
local _ = 0;
local _ = 0;
local _ = 0;
morerefs = {
    spike = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    body = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    sp = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
    dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    da = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    pa = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    dmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
    fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding")
};
local v351 = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding");
local v352 = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist");
local v353 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
local v354 = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit");
local v355 = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability");
local v356 = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Extended Backtrack");
local v357 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit");
local _ = ui.find("Miscellaneous", "Main", "Other", "Fake Latency");
ereksploit = function()
    -- upvalues: v41 (ref), v354 (ref), v11 (ref)
    if aa_system.Antiaim.enable_airexploit:get() == false or not aa_system.Antiaim.enable_antiaim_system:get() then
        cvar.sv_maxusrcmdprocessticks:int(16);
        v41.dt:override();
        v354:override();
        return;
    else
        v41.dt:override("Always On");
        v41.yaw_o:override(0);
        if v11() == true then
            v41.yaw_o:override(90);
            rage.exploit:force_teleport();
            cvar.sv_maxusrcmdprocessticks:int(16);
            v41.yaw_o:override(-90);
            v354:override(14);
            v41.yaw_o:override(0);
        elseif v11() == false then
            v41.yaw_o:override(-90);
            rage.exploit:force_charge();
            cvar.sv_maxusrcmdprocessticks:int(22);
            v41.yaw_o:override(90);
            v354:override(20);
            v41.yaw_o:override(0);
        end;
        return;
    end;
end;
events.createmove:set(ereksploit);
kokotik = function()
    -- upvalues: v152 (ref), v153 (ref), v357 (ref), v351 (ref), v352 (ref), v353 (ref), v354 (ref), v356 (ref), v355 (ref)
    if not v152:get() then
        v153:set(false);
    end;
    if v153:get() == false then
        cvar.sv_maxusrcmdprocessticks:int(16);
        v357:override();
        v351:override();
        v352:override();
        v353:override();
        v354:override();
        v356:override();
        v355:override();
        return;
    else
        cvar.sv_maxusrcmdprocessticks:int(32);
        v351:override(true);
        v352:override(true);
        v353:override(true);
        v354:override(30);
        v355:override(1);
        v356:override(true);
        v357:override(-1.0E17);
        return;
    end;
end;
events.createmove:set(kokotik);
pingos = function()
    -- upvalues: v152 (ref), v155 (ref), v41 (ref), v156 (ref)
    if not v152:get() then
        v155:set(false);
        v41.fakeping:set(0);
    end;
    if v155:get() == false then
        v41.fakeping:set(0);
        return;
    else
        utils.console_exec("sv_maxunlag 0.600");
        v41.fakeping:set(v156:get());
        return;
    end;
end;
events.createmove:set(pingos);
draw_indicator = function(v359, v360, v361, v362, v363, v364, v365)
    -- upvalues: v109 (ref), v108 (ref), v110 (ref), v111 (ref), v112 (ref), v113 (ref)
    local v366 = ui.find("Settings", "Menu Scale"):get();
    local l_x_0 = render.screen_size().x;
    local l_y_2 = render.screen_size().y;
    local v369 = render.measure_text(v109, "c", v360);
    if v361 == nil and v362 == nil then
        if v366 == "75%" then
            v369 = render.measure_text(v109, "c", v360);
            render.gradient(vector(l_x_0 / 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40 + v369.x, l_y_2 / 1.43 + 22.5 - v359), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_0 / 40 - 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40, l_y_2 / 1.43 + 22.5 - v359), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), 0);
            render.text(v109, vector(l_x_0 / 62, l_y_2 / 1.43 - v359 + 1), color(v363, v364, v365, 255), nil, v360);
        elseif v366 == "100%" then
            v369 = render.measure_text(v108, "c", v360);
            render.gradient(vector(l_x_0 / 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40 + v369.x, l_y_2 / 1.43 + 30 - v359), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_0 / 40 - 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40, l_y_2 / 1.43 + 30 - v359), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), 0);
            render.text(v108, vector(l_x_0 / 62, l_y_2 / 1.43 + 4 - v359), color(v363, v364, v365, 255), nil, v360);
        elseif v366 == "125%" then
            v369 = render.measure_text(v110, "c", v360);
            render.gradient(vector(l_x_0 / 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40 + v369.x, l_y_2 / 1.43 + 37.5 - v359), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_0 / 40 - 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40, l_y_2 / 1.43 + 37.5 - v359), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), 0);
            render.text(v110, vector(l_x_0 / 62, l_y_2 / 1.43 + 4 - v359), color(v363, v364, v365, 255), nil, v360);
        elseif v366 == "150%" then
            v369 = render.measure_text(v111, "c", v360);
            render.gradient(vector(l_x_0 / 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40 + v369.x, l_y_2 / 1.43 + 45 - v359), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_0 / 40 - 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40, l_y_2 / 1.43 + 45 - v359), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), 0);
            render.text(v111, vector(l_x_0 / 62, l_y_2 / 1.43 + 4 - v359), color(v363, v364, v365, 255), nil, v360);
        elseif v366 == "175%" then
            v369 = render.measure_text(v111, "c", v360);
            render.gradient(vector(l_x_0 / 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40 + v369.x, l_y_2 / 1.43 + 52.5 - v359), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_0 / 40 - 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40, l_y_2 / 1.43 + 52.5 - v359), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), 0);
            render.text(v112, vector(l_x_0 / 62, l_y_2 / 1.43 + 4 - v359), color(v363, v364, v365, 255), nil, v360);
        elseif v366 == "200%" then
            v369 = render.measure_text(v111, "c", v360);
            render.gradient(vector(l_x_0 / 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40 + v369.x, l_y_2 / 1.43 + 60 - v359), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_0 / 40 - 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40, l_y_2 / 1.43 + 60 - v359), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), 0);
            render.text(v113, vector(l_x_0 / 62, l_y_2 / 1.43 + 4 - v359), color(v363, v364, v365, 255), nil, v360);
        end;
    elseif v361 ~= nil and v362 ~= nil then
        if v366 == "75%" then
            v369 = render.measure_text(v109, "c", v360);
            render.gradient(vector(l_x_0 / 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40 + v369.x, l_y_2 / 1.43 + 22.5 - v359), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_0 / 40 - 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40, l_y_2 / 1.43 + 22.5 - v359), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), 0);
            render.text(v109, vector(l_x_0 / 62 + 38, l_y_2 / 1.43 + 4 - v359), color(v363, v364, v365, 255), nil, v360);
            render.texture(v361, vector(l_x_0 / 62 + 5, l_y_2 / 1.43 - v359), vector(24, 21), color(v363, v364, v365, 255), f, 0);
            render.circle_outline(vector(l_x_0 / 62 + render.measure_text(v109, nil, v360).x, l_y_2 / 1.43 + 10.5 - v359), color(10, 10, 10, 255), 10, 0, 1, 5);
            render.circle_outline(vector(l_x_0 / 62 + render.measure_text(v109, nil, v360).x, l_y_2 / 1.43 + 10.5 - v359), color(205, 205, 205), 9, 0, v362, 3);
        elseif v366 == "100%" then
            v369 = render.measure_text(v108, "c", v360);
            render.gradient(vector(l_x_0 / 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40 + v369.x, l_y_2 / 1.43 + 30 - v359), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_0 / 40 - 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40, l_y_2 / 1.43 + 30 - v359), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), 0);
            render.text(v108, vector(l_x_0 / 62 + 38, l_y_2 / 1.43 + 4 - v359), color(v363, v364, v365, 255), nil, v360);
            render.texture(v361, vector(l_x_0 / 62, l_y_2 / 1.43 - v359), vector(32, 28), color(v363, v364, v365, 255), f, 0);
            render.circle_outline(vector(l_x_0 / 62 + render.measure_text(v108, nil, v360).x - 10, l_y_2 / 1.43 + 14 - v359), color(10, 10, 10, 255), 10, 0, 1, 5);
            render.circle_outline(vector(l_x_0 / 62 + render.measure_text(v108, nil, v360).x - 10, l_y_2 / 1.43 + 14 - v359), color(205, 205, 205), 9, 0, v362, 3);
        elseif v366 == "125%" then
            v369 = render.measure_text(v110, "c", v360);
            render.gradient(vector(l_x_0 / 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40 + v369.x, l_y_2 / 1.43 + 37.5 - v359), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_0 / 40 - 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40, l_y_2 / 1.43 + 37.5 - v359), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), 0);
            render.text(v110, vector(l_x_0 / 62 + 38 + 10, l_y_2 / 1.43 + 4 - v359), color(v363, v364, v365, 255), nil, v360);
            render.texture(v361, vector(l_x_0 / 62, l_y_2 / 1.43 - v359), vector(40, 35), color(v363, v364, v365, 255), f, 0);
            render.circle_outline(vector(l_x_0 / 62 + render.measure_text(v110, nil, v360).x - 25, l_y_2 / 1.43 + 17.5 - v359), color(10, 10, 10, 255), 10, 0, 1, 5);
            render.circle_outline(vector(l_x_0 / 62 + render.measure_text(v110, nil, v360).x - 25, l_y_2 / 1.43 + 17.5 - v359), color(205, 205, 205), 9, 0, v362, 3);
        elseif v366 == "150%" then
            v369 = render.measure_text(v111, "c", v360);
            render.gradient(vector(l_x_0 / 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40 + v369.x, l_y_2 / 1.43 + 45 - v359), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_0 / 40 - 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40, l_y_2 / 1.43 + 45 - v359), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), 0);
            render.text(v111, vector(l_x_0 / 62 + 38 + 15, l_y_2 / 1.43 + 4 - v359), color(v363, v364, v365, 255), nil, v360);
            render.texture(v361, vector(l_x_0 / 62, l_y_2 / 1.43 - v359), vector(48, 42), color(v363, v364, v365, 255), f, 0);
            render.circle_outline(vector(l_x_0 / 62 + render.measure_text(v111, nil, v360).x - 30, l_y_2 / 1.43 + 21 - v359), color(10, 10, 10, 255), 15, 0, 1, 5);
            render.circle_outline(vector(l_x_0 / 62 + render.measure_text(v111, nil, v360).x - 30, l_y_2 / 1.43 + 21 - v359), color(205, 205, 205), 14, 0, v362, 3);
        elseif v366 == "175%" then
            v369 = render.measure_text(v112, "c", v360);
            render.gradient(vector(l_x_0 / 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40 + v369.x, l_y_2 / 1.43 + 52.5 - v359), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_0 / 40 - 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40, l_y_2 / 1.43 + 52.5 - v359), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), 0);
            render.text(v112, vector(l_x_0 / 62 + 55, l_y_2 / 1.43 + 8 - v359), color(v363, v364, v365, 255), nil, v360);
            render.texture(v361, vector(l_x_0 / 62, l_y_2 / 1.43 - v359 + 5), vector(48, 42), color(v363, v364, v365, 255), f, 0);
            render.circle_outline(vector(l_x_0 / 62 + render.measure_text(v112, nil, v360).x - 50, l_y_2 / 1.43 + 24.5 - v359), color(10, 10, 10, 255), 16, 0, 1, 5);
            render.circle_outline(vector(l_x_0 / 62 + render.measure_text(v112, nil, v360).x - 50, l_y_2 / 1.43 + 24.5 - v359), color(205, 205, 205), 15, 0, v362, 3);
        elseif v366 == "200%" then
            v369 = render.measure_text(v113, "c", v360);
            render.gradient(vector(l_x_0 / 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40 + v369.x, l_y_2 / 1.43 + 60 - v359), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_0 / 40 - 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40, l_y_2 / 1.43 + 60 - v359), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), 0);
            render.text(v113, vector(l_x_0 / 62 + 70, l_y_2 / 1.43 + 8 - v359), color(v363, v364, v365, 255), nil, v360);
            render.texture(v361, vector(l_x_0 / 62, l_y_2 / 1.43 - v359), vector(64, 56), color(v363, v364, v365, 255), f, 0);
            render.circle_outline(vector(l_x_0 / 62 + render.measure_text(v113, nil, v360).x - 50, l_y_2 / 1.43 + 28 - v359), color(10, 10, 10, 255), 20, 0, 1, 5);
            render.circle_outline(vector(l_x_0 / 62 + render.measure_text(v113, nil, v360).x - 50, l_y_2 / 1.43 + 28 - v359), color(205, 205, 205), 19, 0, v362, 3);
        end;
    elseif v361 ~= nil and v362 == nil then
        if v366 == "75%" then
            v369 = render.measure_text(v109, "c", v360);
            render.gradient(vector(l_x_0 / 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40 + v369.x, l_y_2 / 1.43 + 22.5 - v359), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_0 / 40 - 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40, l_y_2 / 1.43 + 22.5 - v359), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), 0);
            render.text(v109, vector(l_x_0 / 62 + 38, l_y_2 / 1.43 + 4 - v359), color(v363, v364, v365, 255), nil, v360);
            render.texture(v361, vector(l_x_0 / 62, l_y_2 / 1.43 - v359), vector(24, 21), color(v363, v364, v365, 255), f, 0);
        elseif v366 == "100%" then
            v369 = render.measure_text(v108, "c", v360);
            render.gradient(vector(l_x_0 / 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40 + v369.x, l_y_2 / 1.43 + 30 - v359), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_0 / 40 - 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40, l_y_2 / 1.43 + 30 - v359), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), 0);
            render.text(v108, vector(l_x_0 / 62 + 38, l_y_2 / 1.43 + 4 - v359), color(v363, v364, v365, 255), nil, v360);
            render.texture(v361, vector(l_x_0 / 62, l_y_2 / 1.43 - v359), vector(32, 28), color(v363, v364, v365, 255), f, 0);
        elseif v366 == "125%" then
            v369 = render.measure_text(v110, "c", v360);
            render.gradient(vector(l_x_0 / 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40 + v369.x, l_y_2 / 1.43 + 37.5 - v359), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_0 / 40 - 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40, l_y_2 / 1.43 + 37.5 - v359), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), 0);
            render.text(v110, vector(l_x_0 / 62 + 48, l_y_2 / 1.43 + 4 - v359), color(v363, v364, v365, 255), nil, v360);
            render.texture(v361, vector(l_x_0 / 62, l_y_2 / 1.43 - v359), vector(40, 35), color(v363, v364, v365, 255), f, 0);
        elseif v366 == "150%" then
            v369 = render.measure_text(v111, "c", v360);
            render.gradient(vector(l_x_0 / 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40 + v369.x, l_y_2 / 1.43 + 45 - v359), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_0 / 40 - 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40, l_y_2 / 1.43 + 45 - v359), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), 0);
            render.text(v111, vector(l_x_0 / 62 + 54, l_y_2 / 1.43 + 4 - v359), color(v363, v364, v365, 255), nil, v360);
            render.texture(v361, vector(l_x_0 / 62, l_y_2 / 1.43 - v359), vector(48, 42), color(v363, v364, v365, 255), f, 0);
        elseif v366 == "175%" then
            v369 = render.measure_text(v112, "c", v360);
            render.gradient(vector(l_x_0 / 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40 + v369.x, l_y_2 / 1.43 + 52.5 - v359), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_0 / 40 - 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40, l_y_2 / 1.43 + 52.5 - v359), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), 0);
            render.text(v112, vector(l_x_0 / 62 + 38, l_y_2 / 1.43 + 4 - v359), color(v363, v364, v365, 255), nil, v360);
            render.texture(v361, vector(l_x_0 / 62, l_y_2 / 1.43 - v359), vector(48, 42), color(v363, v364, v365, 255), f, 0);
        elseif v366 == "200%" then
            v369 = render.measure_text(v113, "c", v360);
            render.gradient(vector(l_x_0 / 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40 + v369.x, l_y_2 / 1.43 + 60 - v359), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), 0);
            render.gradient(vector(l_x_0 / 40 - 40, l_y_2 / 1.43 - 4 - v359), vector(l_x_0 / 40, l_y_2 / 1.43 + 60 - v359), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), 0);
            render.text(v113, vector(l_x_0 / 62 + 38, l_y_2 / 1.43 + 4 - v359), color(v363, v364, v365, 255), nil, v360);
            render.texture(v361, vector(l_x_0 / 62, l_y_2 / 1.43 - v359), vector(32, 28), color(v363, v364, v365, 255), f, 0);
        end;
    end;
end;
local v370 = "";
local v371 = "";
local v372 = "";
watermark_system = function()
    -- upvalues: v186 (ref), v35 (ref), v187 (ref), v36 (ref), v188 (ref), v370 (ref), v371 (ref), v372 (ref), v162 (ref), v98 (ref), v15 (ref), v13 (ref), v37 (ref), v161 (ref), v104 (ref), v181 (ref), v182 (ref), v347 (ref), v183 (ref), v97 (ref), v185 (ref), v3 (ref), v0 (ref), v38 (ref), v153 (ref), v152 (ref), v11 (ref), v86 (ref), v41 (ref), v184 (ref), v107 (ref)
    if v186:get() == "Custom" then
        v35 = v187:get();
        if #v35 > 16 then
            v35 = v35:sub(0, 16) .. "...";
        end;
    elseif v186:get() == "Steam" then
        v35 = panorama.MyPersonaAPI.GetName();
    else
        v35 = v36;
    end;
    local l_dmDisplayFrequency_0 = pLpDevMode[0].dmDisplayFrequency;
    local v374 = render.screen_size();
    local v375;
    if 1 / globals.frametime < 100 then
        v375 = string.format("0" .. "%i", 1 / globals.frametime);
    else
        v375 = string.format("%i", 1 / globals.frametime);
    end;
    niggatime = common.get_system_time();
    local v376 = render.measure_text(1, nil, v188:get() .. " | " .. v35 .. " | 100 fps | " .. string.format("%i ms", get_ping()));
    gstext_sel1 = "game";
    gstext_sel2 = "sense";
    widthfix = 46;
    if v188:get() == "fivesense" then
        v376 = render.measure_text(1, nil, "fivesense | " .. v35 .. " | 100 fps | " .. string.format("%i ms", get_ping()));
        gstext_sel1 = "five";
        gstext_sel2 = "sense";
        widthfix = 32;
    elseif v188:get() == "sk\208\181et.cc" then
        v376 = render.measure_text(1, nil, v188:get() .. " | " .. v35 .. " | 100 fps | " .. string.format("%i ms", get_ping()));
        gstext_sel1 = "skeet";
        gstext_sel2 = ".cc";
        widthfix = 49;
    end;
    if niggatime.seconds < 10 then
        v370 = string.format("0" .. "%i", niggatime.seconds);
    else
        v370 = niggatime.seconds;
    end;
    if niggatime.minutes < 10 then
        v371 = string.format("0" .. "%i", niggatime.minutes);
    else
        v371 = niggatime.minutes;
    end;
    if niggatime.hours < 10 then
        v372 = string.format("0" .. "%i", niggatime.hours);
    else
        v372 = niggatime.hours;
    end;
    gstext = gstext_sel1 .. gstext_sel2 .. " | " .. v35 .. " | " .. v375 .. "fps | " .. string.format("%i ms | ", get_ping()) .. string.format("%i:%s:%s", v372, v371, v370);
    local v377 = render.measure_text(1, nil, gstext);
    if not v162:get() then
        render.blur(vector(ui.get_position().x, ui.get_position().y - 5), vector(ui.get_position().x + 245, ui.get_position().y - 35), 20, 255 * ui.get_alpha(), 7.5);
        render.text(v98, vector(ui.get_position().x + 35, ui.get_position().y - 29), color(255, 255, 255, 255 * ui.get_alpha()), "", "\aDEFAULTFive\a95b806FFSense\affffffFF [" .. v15 .. "] - version " .. v13);
        if ui.get_alpha() > 0 then
            render.texture(v37, vector(ui.get_position().x + 8.5, ui.get_position().y - 30), vector(20, 20, 0));
        end;
    end;
    if not v161:get() then
        return;
    else
        v104 = 0;
        if v181:get("Watermark") then
            if v182:get() == "Solus" then
                local l_r_0 = v183:get().r;
                local l_g_0 = v183:get().g;
                v347 = v183:get().b;
                g = l_g_0;
                r = l_r_0;
                render.gradient(vector(v374.x - v376.x - 21, 9), vector(v374.x - 9, 31), color(r, g, v347, tonumber(255)), color(r, g, v347, tonumber(255)), color(r, g, v347, 25), color(r, g, v347, 25), 5);
                for v380 = 1, 5 do
                    render.rect_outline(vector(v374.x - v376.x - 20 - v380, 10 - v380), vector(v374.x - 10 + v380, 30 + v380), color(r, g, v347, 0.15 * (1 - v380 / 5) * 255), 1, 5);
                end;
                render.rect(vector(v374.x - v376.x - 20, 10), vector(v374.x - 10, 30), color(10, 225), 5);
                if v188:get() == "fivesense" then
                    render.text(1, vector(v374.x - v376.x / 2 - 14.5, 19.5), color(255, 255, 255), "c", "fivesense | " .. v35 .. " | " .. v375 .. " fps | " .. string.format("%i ms", get_ping()));
                    render.text(1, vector(v374.x - v376.x + render.measure_text(1, nil, "five").x - 1, 19.5), color(v183:get().r, v183:get().g, v183:get().b, 255), "c", "sense");
                elseif v188:get() == "gamesense" then
                    render.text(1, vector(v374.x - v376.x / 2 - 14.5, 19.5), color(255, 255, 255), "c", v188:get() .. " | " .. v35 .. " | " .. v375 .. " fps | " .. string.format("%i ms", get_ping()));
                    render.text(1, vector(v374.x - v376.x + render.measure_text(1, nil, "game").x - 1, 19.5), color(v183:get().r, v183:get().g, v183:get().b, 255), "c", "sense");
                elseif v188:get() == "sk\208\181et.cc" then
                    render.text(1, vector(v374.x - v376.x / 2 - 14.5, 19.5), color(255, 255, 255), "c", v188:get() .. " | " .. v35 .. " | " .. v375 .. " fps | " .. string.format("%i ms", get_ping()));
                    render.text(1, vector(v374.x - v376.x + render.measure_text(1, nil, "skeet").x - 9, 19.5), color(v183:get().r, v183:get().g, v183:get().b, 255), "c", ".cc");
                end;
                v104 = v104 + 35;
            elseif v182:get() == "\aDEFAULTGame\a5d8100FFS\a5d8100FFe\a5d8100FFn\a5d8100FFs\a5d8100FFe" then
                render.rect(vector(v374.x - v377.x - 30, 15), vector(v374.x - 10, 45), color(18, 18, 18));
                render.rect(vector(v374.x - v377.x - 29, 16), vector(v374.x - 11, 44), color(62, 62, 62));
                render.rect(vector(v374.x - v377.x - 28, 17), vector(v374.x - 12, 43), color(44, 44, 44));
                render.rect(vector(v374.x - v377.x - 26, 19), vector(v374.x - 14, 41), color(62, 62, 62));
                render.rect(vector(v374.x - v377.x - 25, 20), vector(v374.x - 15, 29), color(19, 19, 19));
                render.rect(vector(v374.x - v377.x - 25, 24), vector(v374.x - 15, 40), color(20, 20, 20));
                render.gradient(vector(v374.x - v377.x - 24, 21), vector(v374.x - v377.x / 2 - 22, 23), color(62, 174, 222), color(172, 66, 179), color(49, 87, 111), color(123, 46, 126));
                render.gradient(vector(v374.x - v377.x / 2 - 22, 21), vector(v374.x - 16, 23), color(172, 66, 179), color(200, 226, 60), color(123, 46, 126), color(100, 112, 29));
                render.text(v97, vector(v374.x - v377.x - 20, 25), color(255, 255, 255), "", gstext);
                render.text(v97, vector(v374.x - v377.x - render.measure_text(1, nil, gstext_sel1).x - 14 + widthfix, 25, 0), color(149, 184, 6, 255), "nil", gstext_sel2);
                v104 = v104 + 40;
            end;
        end;
        if v181:get("\aDEFAULTG\a5d8100FFS \aDEFAULTKeybinds") then
            local v381 = {
                doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
                doubletap2 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
                dormantaim = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
                onshot = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
                freestand = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
                bodyaim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
                safepoint = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
                fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
                pingspike = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
                damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
                fakelag = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
                lagcomp = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit")
            };
            local v382 = entity.get_local_player();
            if not v382 then
                return;
            else
                local v383 = v382:get_resource();
                if globals.is_connected == false then
                    return;
                else
                    local l_m_iPing_0 = v383.m_iPing;
                    local v385 = math.abs(l_m_iPing_0 % 200) / (v381.pingspike:get() / 4);
                    if v385 > 1 then
                        v385 = 1;
                    end;
                    local v386 = {
                        r = 169 * v385 + 234 * (1 - v385), 
                        g = 213 * v385 + 221 * (1 - v385), 
                        b = 43 * v385 + 131 * (1 - v385)
                    };
                    local _ = render.screen_size().x;
                    local _ = render.screen_size().y;
                    local v389 = 0;
                    GAP = 42;
                    local v390 = ui.find("Settings", "Menu Scale"):get();
                    GAP = 42;
                    if v390 == "75%" then
                        GAP = 31.5;
                    elseif v390 == "100%" then
                        GAP = 42;
                    elseif v390 == "125%" then
                        GAP = 52.5;
                    elseif v390 == "150%" then
                        GAP = 63;
                    elseif v390 == "175%" then
                        GAP = 73.5;
                    elseif v390 == "200%" then
                        GAP = 84;
                    end;
                    if cvar.cl_lagcompensation:int() == 0 and v382:is_alive() and v185:get("Anti exploit") then
                        draw_indicator(v389, "AX", nil, nil, 205, 205, 205);
                        v389 = v389 + GAP;
                    end;
                    if v3() == 0 and v382:is_alive() and v185:get("Lag compensation") then
                        draw_indicator(v389, "LC", nil, nil, 229, 26, 55);
                        v389 = v389 + GAP;
                    elseif v3() == 1 and v382:is_alive() and v185:get("Lag compensation") then
                        draw_indicator(v389, "LC", nil, nil, 150, 200, 60);
                        v389 = v389 + GAP;
                    end;
                    if v3() == 0 and v381.fakeduck:get() == false and v185:get("Teleport distance") and v382:is_alive() then
                        if rage.exploit:get() == 1 then
                            draw_indicator(v389, "+/- MAXIMIZING TELEPORT DISTANCE", nil, nil, 150, 200, 60);
                        else
                            draw_indicator(v389, "+/- MAXIMIZING TELEPORT DISTANCE", nil, nil, 229, 26, 55);
                        end;
                        v389 = v389 + GAP;
                    end;
                    if v381.pingspike:get() > 0 and v382:is_alive() and v185:get("Fake ping") then
                        draw_indicator(v389, "PING", nil, nil, v386.r, v386.g, v386.b);
                        v389 = v389 + GAP;
                    end;
                    if v381.fakeduck:get() and v382:is_alive() and v185:get("Duck peek assist") then
                        draw_indicator(v389, "DUCK", nil, nil, 205, 205, 205);
                        v389 = v389 + GAP;
                    end;
                    for v391 in pairs(ui.get_binds()) do
                        if ui.get_binds()[v391].name == "Min. Damage" and v382:is_alive() and v185:get("Damage override") and ui.get_binds()[v391].active then
                            draw_indicator(v389, ui.get_binds()[v391].value, nil, nil, 205, 205, 205);
                            v389 = v389 + GAP;
                        end;
                        if ui.get_binds()[v391].name == "Hit Chance" and v382:is_alive() and v185:get("Hitchance override") and ui.get_binds()[v391].active then
                            draw_indicator(v389, "HC OVERRIDE", nil, nil, 205, 205, 205);
                            v389 = v389 + GAP;
                        end;
                    end;
                    if v381.safepoint:get() == "Force" and v382:is_alive() and v185:get("Force safe points") then
                        draw_indicator(v389, "SAFE", nil, nil, 205, 205, 205);
                        v389 = v389 + GAP;
                    end;
                    if v381.bodyaim:get() == "Force" and v382:is_alive() and v185:get("Force body aim") then
                        draw_indicator(v389, "BODY", nil, nil, 205, 205, 205);
                        v389 = v389 + GAP;
                    end;
                    if v381.freestand:get() and v382:is_alive() and v185:get("Freestanding") then
                        draw_indicator(v389, "FS", nil, nil, 205, 205, 205);
                        v389 = v389 + GAP;
                    end;
                    if v0.state == false and v185:get("Bomb") then
                        if v0.plant_time == nil then
                            return;
                        elseif v0.plant_time > 0 then
                            draw_indicator(v389, "Bombsite " .. v0.site .. "              ", v38, v0.plant_percentage, 251, 240, 138);
                            v389 = v389 + GAP;
                        end;
                    end;
                    if v0.state == true and v0.c4time > 0.0999 and v185:get("Bomb") then
                        if v0.c4time == nil then
                            return;
                        else
                            draw_indicator(v389, string.format(v0.site .. " - %.2fs              ", v0.c4time), v38, nil, 205, 205, 205);
                            v389 = v389 + GAP;
                        end;
                    end;
                    if v0.state == true and v382:is_alive() and v185:get("Bomb") then
                        if v0.dmg == nil then
                            return;
                        elseif v0.dmg == "FATAL" then
                            draw_indicator(v389, v0.dmg, nil, nil, 229, 26, 55);
                            v389 = v389 + GAP;
                            if v0.dmg == nil then
                                return;
                            end;
                        elseif v0.dmg ~= "-0 HP" and v0.dmg ~= "FATAL" then
                            draw_indicator(v389, v0.dmg, nil, nil, 251, 240, 138);
                            v389 = v389 + GAP;
                        end;
                    end;
                    if v153:get() and v382:is_alive() and v381.fakeduck:get() == false and v152:get() and v185:get("Ideal tick") then
                        if rage.exploit:get() == 1 then
                            draw_indicator(v389, "+/- IDEAL TICK", nil, nil, 150, 200, 60);
                        else
                            draw_indicator(v389, "+/- IDEAL TICK", nil, nil, 229, 26, 55);
                        end;
                        v389 = v389 + GAP;
                    end;
                    if v185:get("Hide shots") and v381.onshot:get() and v153:get() == false and v381.fakeduck:get() == false and v381.doubletap:get() == false and v382:is_alive() then
                        draw_indicator(v389, "HS", nil, nil, 150, 200, 60);
                        v389 = v389 + GAP;
                    end;
                    if v185:get("Double tap") and v381.doubletap:get() and v153:get() == false and v381.fakeduck:get() == false and v382:is_alive() then
                        if rage.exploit:get() == 1 then
                            draw_indicator(v389, "DT", nil, nil, v11() == true and 150 or 215, v11() == true and 200 or 215, v11() == true and 60 or 215);
                        else
                            draw_indicator(v389, "DT", nil, nil, 229, 26, 55);
                        end;
                        v389 = v389 + GAP;
                    end;
                    local v392 = entity.get_threat();
                    local _ = entity.get_players(true, true);
                    if v381.dormantaim:get() and v382:is_alive() and v185:get("Dormant aimbot") then
                        if v392 and v392:is_dormant() then
                            draw_indicator(v389, "DA", nil, nil, 205, 205, 205);
                            v389 = v389 + GAP;
                        elseif v392 and not v392:is_dormant() then
                            draw_indicator(v389, "DA", nil, nil, 229, 26, 55);
                            v389 = v389 + GAP;
                        else
                            draw_indicator(v389, "DA", nil, nil, 205, 205, 205);
                            v389 = v389 + GAP;
                        end;
                    end;
                    if v382:is_alive() and v185:get("Slowdown") then
                        local l_m_flVelocityModifier_0 = v382.m_flVelocityModifier;
                        v86:frame();
                        if l_m_flVelocityModifier_0 < 1 then
                            draw_indicator(v389, "SLOW", nil, nil, 250 - l_m_flVelocityModifier_0 * 100, 30 + l_m_flVelocityModifier_0 * 150, 20 + l_m_flVelocityModifier_0 * 40);
                            v389 = v389 + GAP;
                        end;
                    end;
                end;
            end;
        end;
        if v181:get("Choke & Desync information") then
            choketext = "FL: " .. globals.choked_commands;
            if v41.doubletap:get() or v41.hideshots:get() then
                choketext = "FL: " .. globals.choked_commands .. " | SHIFTING";
            elseif globals.choked_commands < 10 then
                choketext = "FL: " .. globals.choked_commands;
            else
                choketext = "FL: " .. globals.choked_commands .. "";
            end;
            choketext_size = render.measure_text(1, "", choketext);
            if globals.is_in_game then
                des_val = entity.get_local_player().m_flPoseParameter[11] * 120 - 60;
            else
                des_val = 0;
            end;
            if des_val <= -1 then
                angle = des_val * -1;
            else
                angle = des_val;
            end;
            if v182:get() == "\aDEFAULTGame\a5d8100FFS\a5d8100FFe\a5d8100FFn\a5d8100FFs\a5d8100FFe" then
                render.rect(vector(v374.x - 90, 15 + v104), vector(v374.x - 10, 45 + v104), color(18, 18, 18));
                render.rect(vector(v374.x - 89, 16 + v104), vector(v374.x - 11, 44 + v104), color(62, 62, 62));
                render.rect(vector(v374.x - 88, 17 + v104), vector(v374.x - 12, 43 + v104), color(44, 44, 44));
                render.rect(vector(v374.x - 86, 19 + v104), vector(v374.x - 14, 41 + v104), color(62, 62, 62));
                render.rect(vector(v374.x - 85, 20 + v104), vector(v374.x - 15, 29 + v104), color(19, 19, 19));
                render.rect(vector(v374.x - 85, 24 + v104), vector(v374.x - 15, 40 + v104), color(20, 20, 20));
                render.gradient(vector(v374.x - 84, 21 + v104), vector(v374.x - 58, 23 + v104), color(62, 174, 222), color(172, 66, 179), color(49, 87, 111), color(123, 46, 126));
                render.gradient(vector(v374.x - 58, 21 + v104), vector(v374.x - 16, 23 + v104), color(172, 66, 179), color(200, 226, 60), color(123, 46, 126), color(100, 112, 29));
                render.text(1, vector(v374.x - 50, 31 + v104), color(255, 255, 255), "c", "FAKE (" .. math.floor(des_val) .. "\194\176)");
                render.rect(vector(v374.x - (90 + choketext_size.x + 35), 15 + v104), vector(v374.x - 103, 45 + v104), color(18, 18, 18));
                render.rect(vector(v374.x - (89 + choketext_size.x + 35), 16 + v104), vector(v374.x - 104, 44 + v104), color(62, 62, 62));
                render.rect(vector(v374.x - (88 + choketext_size.x + 35), 17 + v104), vector(v374.x - 105, 43 + v104), color(44, 44, 44));
                render.rect(vector(v374.x - (86 + choketext_size.x + 35), 19 + v104), vector(v374.x - 107, 41 + v104), color(62, 62, 62));
                render.rect(vector(v374.x - (85 + choketext_size.x + 35), 20 + v104), vector(v374.x - 108, 29 + v104), color(19, 19, 19));
                render.rect(vector(v374.x - (85 + choketext_size.x + 35), 24 + v104), vector(v374.x - 108, 40 + v104), color(20, 20, 20));
                render.gradient(vector(v374.x - (84 + choketext_size.x + 35), 21 + v104), vector(v374.x - (58 + choketext_size.x + 30), 23 + v104), color(62, 174, 222), color(172, 66, 179), color(49, 87, 111), color(123, 46, 126));
                render.gradient(vector(v374.x - (58 + choketext_size.x + 30), 21 + v104), vector(v374.x - 109, 23 + v104), color(172, 66, 179), color(200, 226, 60), color(123, 46, 126), color(100, 112, 29));
                render.text(1, vector(v374.x - (74 + choketext_size.x + 40), 25 + v104), color(255, 255, 255), "", choketext);
                v104 = v104 + 40;
            else
                local v395 = 200;
                local v396 = 50;
                v347 = 50;
                g = v396;
                r = v395;
                render.gradient(vector(v374.x - 81, 9 + v104), vector(v374.x - 9, v104 + 31), color(r, g, v347, tonumber(255)), color(r, g, v347, 25), color(r, g, v347, tonumber(255)), color(r, g, v347, 25), 5);
                render.rect(vector(v374.x - 80, 10 + v104), vector(v374.x - 10, 30 + v104), color(10, 220), 5);
                render.text(1, vector(v374.x - 72, 13.5 + v104), color(255, 255, 255), "", "FAKE (" .. desync_normalize(math.floor(des_val)) .. "\194\176)");
                for v397 = 1, 5 do
                    render.rect_outline(vector(v374.x - 81 - v397, 10 + v104 - v397), vector(v374.x - 10 + v397, 30 + v104 + v397), color(r, g, v347, 0.15 * (1 - v397 / 5) * 255), 1, 5);
                end;
                render.gradient(vector(v374.x - (86 + choketext_size.x + 30), 9 + v104), vector(v374.x - 98, v104 + 31), color(r, g, v347, tonumber(255)), color(r, g, v347, 25), color(r, g, v347, tonumber(255)), color(r, g, v347, 25), 5);
                render.rect(vector(v374.x - (85 + choketext_size.x + 30), 10 + v104), vector(v374.x - 99, 30 + v104), color(10, 220), 5);
                render.text(1, vector(v374.x - (77 + choketext_size.x + 30), 13.5 + v104), color(255, 255, 255), "", choketext);
                for v398 = 1, 5 do
                    render.rect_outline(vector(v374.x - (86 + choketext_size.x + 30) - v398, 10 + v104 - v398), vector(v374.x - 99 + v398, 30 + v104 + v398), color(r, g, v347, 0.15 * (1 - v398 / 5) * 255), 1, 5);
                end;
                v104 = v104 + 35;
            end;
        end;
        if v181:get("Frametime") then
            if v182:get() == "\aDEFAULTGame\a5d8100FFS\a5d8100FFe\a5d8100FFn\a5d8100FFs\a5d8100FFe" then
                render.rect(vector(v374.x - 90, 15 + v104), vector(v374.x - 10, 45 + v104), color(18, 18, 18));
                render.rect(vector(v374.x - 89, 16 + v104), vector(v374.x - 11, 44 + v104), color(62, 62, 62));
                render.rect(vector(v374.x - 88, 17 + v104), vector(v374.x - 12, 43 + v104), color(44, 44, 44));
                render.rect(vector(v374.x - 86, 19 + v104), vector(v374.x - 14, 41 + v104), color(62, 62, 62));
                render.rect(vector(v374.x - 85, 20 + v104), vector(v374.x - 15, 29 + v104), color(19, 19, 19));
                render.rect(vector(v374.x - 85, 24 + v104), vector(v374.x - 15, 40 + v104), color(20, 20, 20));
                render.gradient(vector(v374.x - 84, 21 + v104), vector(v374.x - 58, 23 + v104), color(62, 174, 222), color(172, 66, 179), color(49, 87, 111), color(123, 46, 126));
                render.gradient(vector(v374.x - 58, 21 + v104), vector(v374.x - 16, 23 + v104), color(172, 66, 179), color(200, 226, 60), color(123, 46, 126), color(100, 112, 29));
                render.text(1, vector(v374.x - 50, 31 + v104), color(255, 255, 255), "c", string.format("%i", globals.frametime * 500) .. "ms | " .. l_dmDisplayFrequency_0 .. "Hz");
                v104 = v104 + 50;
            else
                local l_r_1 = v183:get().r;
                local l_g_1 = v183:get().g;
                v347 = v183:get().b;
                g = l_g_1;
                r = l_r_1;
                render.gradient(vector(v374.x - 86, 9 + v104), vector(v374.x - 9, v104 + 31), color(r, g, v347, tonumber(255)), color(r, g, v347, 25), color(r, g, v347, tonumber(255)), color(r, g, v347, 25), 5);
                for v401 = 1, 5 do
                    render.rect_outline(vector(v374.x - 86 - v401, 10 + v104 - v401), vector(v374.x - 10 + v401, 25 + v104 + v401), color(r, g, v347, 0.15 * (1 - v401 / 5) * 255), 1, 5);
                end;
                render.rect(vector(v374.x - 85, 10 + v104), vector(v374.x - 10, 30 + v104), color(10, 220), 5);
                render.text(1, vector(v374.x - 46, 19.5 + v104), color(255, 255, 255), "c", string.format("%i", globals.frametime * 500) .. "ms | " .. l_dmDisplayFrequency_0 .. "Hz");
                v104 = v104 + 35;
            end;
        end;
        if v181:get("Spectator list") and v184:get() == "Default" then
            v107 = 4;
            specheight = v107;
            for v402, v403 in pairs(getspectators()) do
                local v404 = v403:get_name();
                if #v404 > 30 then
                    v404 = v404:sub(0, 30) .. "...";
                end;
                render.text(1, vector(v374.x - render.measure_text(1, nil, v402).x - 3, specheight), color(255, 255, 255), "r", v404);
                specheight = specheight + 20;
            end;
        end;
        return;
    end;
end;
indicator = function(v405, v406, v407, v408, v409, v410, v411, v412, v413)
    -- upvalues: v101 (ref)
    if v409 == nil or v409 == "" or v409 == " " then
        return;
    else
        if v411 and v413 == nil and v412 ~= nil then
            render.gradient(vector(10, render.screen_size().y - 350 - v410 * 37), vector(13 + render.measure_text(v101.bold, "", v409).x / 2, render.screen_size().y - 345 - v410 * 37 + 28), color(0, 0, 0, 0.2), color(0, 0, 0, 41), color(0, 0, 0, 11), color(0, 0, 0, 40), 0);
            render.gradient(vector(10 + render.measure_text(v101.bold, "", v409).x, render.screen_size().y - 350 - v410 * 37), vector(13 + render.measure_text(v101.bold, "", v409).x / 2, render.screen_size().y - 345 - v410 * 37 + 28), color(0, 0, 0, 11), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 49), 0);
            render.circle_outline(vector(10 + render.measure_text(v101.bold, "", v409).x + 7, render.screen_size().y - 332.5 - v410 * 37), color(10, 10, 10, 255), 10, 0, 1, 5);
            render.circle_outline(vector(10 + render.measure_text(v101.bold, "", v409).x + 7, render.screen_size().y - 332.5 - v410 * 37), color(205, 205, 205), 9, 0, v412, 3);
            render.text(v101.bold, vector(20, render.screen_size().y - 343 - v410 * 37), color(0, 0, 0, 145), "", v409);
            render.text(v101.bold, vector(19, render.screen_size().y - 344 - v410 * 37), color(v405, v406, v407, v408), "", v409);
        elseif not v411 and v413 ~= nil and v412 == nil then
            render.gradient(vector(10, render.screen_size().y - 350 - v410 * 37), vector(13 + render.measure_text(v101.bold, "", v409).x / 2 - 15, render.screen_size().y - 345 - v410 * 37 + 28), color(0, 0, 0, 0.2), color(0, 0, 0, 41), color(0, 0, 0, 11), color(0, 0, 0, 40), 0);
            render.gradient(vector(10 + render.measure_text(v101.bold, "", v409).x - 15, render.screen_size().y - 350 - v410 * 37), vector(13 + render.measure_text(v101.bold, "", v409).x / 2 - 15, render.screen_size().y - 345 - v410 * 37 + 28), color(0, 0, 0, 11), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 49), 0);
            render.texture(v413, vector(20, render.screen_size().y - 345 - v410 * 37), vector(32, 28), color(v405, v406, v407, 255), f, 0);
            render.text(v101.bold, vector(60, render.screen_size().y - 343 - v410 * 37), color(0, 0, 0, 145), "", v409);
            render.text(v101.bold, vector(59, render.screen_size().y - 344 - v410 * 37), color(v405, v406, v407, v408), "", v409);
        elseif v411 and v413 ~= nil and v412 ~= nil then
            render.gradient(vector(10, render.screen_size().y - 350 - v410 * 37), vector(13 + render.measure_text(v101.bold, "", v409).x / 2 + 10, render.screen_size().y - 345 - v410 * 37 + 28), color(0, 0, 0, 0.2), color(0, 0, 0, 41), color(0, 0, 0, 11), color(0, 0, 0, 40), 0);
            render.gradient(vector(10 + render.measure_text(v101.bold, "", v409).x + 10, render.screen_size().y - 350 - v410 * 37), vector(13 + render.measure_text(v101.bold, "", v409).x / 2 + 10, render.screen_size().y - 345 - v410 * 37 + 28), color(0, 0, 0, 11), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 49), 0);
            render.circle_outline(vector(10 + render.measure_text(v101.bold, "", v409).x - 15, render.screen_size().y - 332.5 - v410 * 37), color(10, 10, 10, 255), 10, 0, 1, 5);
            render.circle_outline(vector(10 + render.measure_text(v101.bold, "", v409).x - 15, render.screen_size().y - 332.5 - v410 * 37), color(205, 205, 205), 9, 0, v412, 3);
            render.texture(v413, vector(20, render.screen_size().y - 345 - v410 * 37), vector(32, 28), color(v405, v406, v407, 255), f, 0);
            render.text(v101.bold, vector(60, render.screen_size().y - 340 - v410 * 37), color(0, 0, 0, 145), "", v409);
            render.text(v101.bold, vector(59, render.screen_size().y - 341 - v410 * 37), color(v405, v406, v407, v408), "", v409);
        else
            render.gradient(vector(10, render.screen_size().y - 350 - v410 * 37), vector(13 + render.measure_text(v101.bold, "", v409).x / 2, render.screen_size().y - 345 - v410 * 37 + 28), color(0, 0, 0, 0.2), color(0, 0, 0, 41), color(0, 0, 0, 11), color(0, 0, 0, 40), 0);
            render.gradient(vector(10 + render.measure_text(v101.bold, "", v409).x, render.screen_size().y - 350 - v410 * 37), vector(13 + render.measure_text(v101.bold, "", v409).x / 2, render.screen_size().y - 345 - v410 * 37 + 28), color(0, 0, 0, 11), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 49), 0);
            render.text(v101.bold, vector(20, render.screen_size().y - 343 - v410 * 37), color(0, 0, 0, 145), "", v409);
            render.text(v101.bold, vector(19, render.screen_size().y - 344 - v410 * 37), color(v405, v406, v407, v408), "", v409);
        end;
        return;
    end;
end;
solus_xd = function(v414, v415, v416, v417, _, _, v420)
    -- upvalues: v183 (ref)
    render.gradient(vector(v414 + 1 - 2, v415 - 4 - 2), vector(v414 + v416 + 1 + 2, v415 + v417 + 2), color(v183:get().r, v183:get().g, v183:get().b, v420), color(v183:get().r, v183:get().g, v183:get().b, v420), color(0, 0, 0, v420 * 0), color(0, 0, 0, v420 * 0), 7);
    render.rect(vector(v414 + 1, v415 - 4), vector(v414 + v416 + 1, v415 + v417 - 1.5), color(0, 0, 0, v420 / 1.4), 7);
    render.text(1, vector(v414 - 1 + v416 / 2 + 1 - name_size.x / 2, v415 - 1.5), color(255, 255, 255, v420), nil, name);
end;
local v421 = 20;
keybind_system = function()
    -- upvalues: v161 (ref), v181 (ref), v183 (ref), v299 (ref), v67 (ref), v421 (ref), v182 (ref), v347 (ref), v325 (ref)
    if not v161:get() then
        return;
    elseif not v181:get("Keybinds") then
        return;
    else
        maincolor = v183;
        local v422 = 20;
        local _ = 2;
        local v424 = ui.get_binds();
        local v425 = 0;
        local v426 = 0;
        local v427 = 28;
        local v428 = false;
        local v429 = v299.keybinds_x_slider:get();
        local v430 = v299.keybinds_y_slider:get();
        v67:frame();
        for v431 = 1, #v424 do
            local l_name_0 = v424[v431].name;
            if l_name_0 == "Double Tap" then
                l_name_0 = "Double tap";
            end;
            if l_name_0 == "Peek Assist" then
                l_name_0 = "Quick peek";
            end;
            if l_name_0 == "Edge Jump" then
                l_name_0 = "Jump at edge";
            end;
            if l_name_0 == "Hide Shots" then
                l_name_0 = "Hide shots";
            end;
            if l_name_0 == "Min. Damage" then
                l_name_0 = "Damage override";
            end;
            if l_name_0 == "Fake Latency" then
                l_name_0 = "Ping spike";
            end;
            if l_name_0 == "Fake Duck" then
                l_name_0 = "Duck peek assist";
            end;
            if l_name_0 == "Safe Points" then
                l_name_0 = "Safe point";
            end;
            if l_name_0 == "Body Aim" then
                l_name_0 = "Body aim";
            end;
            if l_name_0 == "Yaw Base" then
                l_name_0 = "Manual override";
            end;
            if l_name_0 == "Slow Walk" then
                l_name_0 = "Slow motion";
            end;
            if l_name_0 == "Ideal peek" then
                l_name_0 = "\affffffFF~\af3f9ffFF \ae7f3ffFFI\adcedffFFd\ad0e7ffFFe\ac4e1ffFFa\ab8dbffFFl\aadd6ffFF \aa1d0ffFFp\a95caffFFe\a89c4ffFFe\a7ebeffFFk\a72b8ffFF \a66b2ffFF~";
            end;
            local v433 = render.measure_text(1, nil, l_name_0).x - 20;
            if v424[v431].active then
                v428 = true;
                if v427 < v433 and v433 then
                    v427 = v433;
                end;
            end;
        end;
        v421 = v67:lerp(v421, v427 + 90, 0.1);
        v426 = v67:animate("state", not v428 and ui.get_alpha() ~= 1);
        if v182:get() == "Solus" then
            local l_r_2 = maincolor:get().r;
            local l_g_2 = maincolor:get().g;
            v347 = maincolor:get().b;
            g = l_g_2;
            r = l_r_2;
            render.gradient(vector(v429 - 1, v430 - 1), vector(v429 + v421 + 1, v430 + v422 + 1), color(r, g, v347, tonumber(v426 * 255)), color(r, g, v347, tonumber(v426 * 255)), color(r, g, v347, v426 * 30), color(r, g, v347, v426 * 30), 5);
            for v436 = 1, 5 do
                render.rect_outline(vector(v429 - v436, v430 - v436), vector(v429 + v421 + v436, v430 + v422 + v436), color(r, g, v347, v426 * 0.15 * (1 - v436 / 5) * 255), 1, 5);
            end;
            render.rect(vector(v429, v430), vector(v429 + v421, v430 + v422), color(10, tonumber(v426 * 220)), 5);
        elseif v182:get() == "\aDEFAULTGame\a5d8100FFS\a5d8100FFe\a5d8100FFn\a5d8100FFs\a5d8100FFe" then
            render.rect(vector(v429, v430 - 6), vector(v429 + v421, v430 + v422 + 4), color(18, 18, 18, tonumber(v426 * 255)));
            render.rect(vector(v429 + 1, v430 - 5), vector(v429 + v421 - 1, v430 + v422 + 3), color(62, 62, 62, tonumber(v426 * 255)));
            render.rect(vector(v429 + 2, v430 - 4), vector(v429 + v421 - 2, v430 + v422 + 2), color(44, 44, 44, tonumber(v426 * 255)));
            render.rect(vector(v429 + 4, v430 - 2), vector(v429 + v421 - 4, v430 + v422), color(62, 62, 62, tonumber(v426 * 255)));
            render.rect(vector(v429 + 5, v430 - 1), vector(v429 + v421 - 5, v430 + v422 - 1), color(19, 19, 19, tonumber(v426 * 255)));
            render.rect(vector(v429 + 6, v430), vector(v429 + v421 - 6, v430 + v422 - 6), color(20, 20, 20, tonumber(v426 * 255)));
            render.gradient(vector(v429 + 6, v430), vector(v429 + 6 + v421 / 2, v430 + 2), color(62, 174, 222, tonumber(v426 * 255)), color(172, 66, 179, tonumber(v426 * 255)), color(49, 87, 111, tonumber(v426 * 255)), color(123, 46, 126, tonumber(v426 * 255)));
            render.gradient(vector(v429 + 6 + v421 / 2, v430), vector(v429 + v421 - 6, v430 + 2), color(172, 66, 179, tonumber(v426 * 255)), color(200, 226, 60, tonumber(v426 * 255)), color(123, 46, 126, tonumber(v426 * 255)), color(100, 112, 29, tonumber(v426 * 255)));
            v425 = v425 + 4;
        end;
        render.text(1, vector(v429 + v421 / 2 - render.measure_text(1, nil, "keybinds").x / 2, v430 + v422 / 6), color(255, 255, 255, tonumber(v426 * 255)), "", "keybinds");
        for v437 = 1, #v424 do
            local v438 = v424[v437].mode == 1 and "[holding]" or v424[v437].mode == 2 and "[toggled]" or "[?]";
            local l_name_1 = v424[v437].name;
            local v440 = v67:animate(l_name_1, not v424[v437].active);
            if l_name_1 == "Double Tap" then
                l_name_1 = "Double tap";
            end;
            if l_name_1 == "Peek Assist" then
                l_name_1 = "Quick peek";
            end;
            if l_name_1 == "Edge Jump" then
                l_name_1 = "Jump at edge";
            end;
            if l_name_1 == "Hide Shots" then
                l_name_1 = "Hide shots";
            end;
            if l_name_1 == "Min. Damage" then
                l_name_1 = "Damage override";
            end;
            if l_name_1 == "Fake Latency" then
                l_name_1 = "Ping spike";
            end;
            if l_name_1 == "Fake Duck" then
                l_name_1 = "Duck peek assist";
            end;
            if l_name_1 == "Safe Points" then
                l_name_1 = "Safe point";
            end;
            if l_name_1 == "Body Aim" then
                l_name_1 = "Body aim";
            end;
            if l_name_1 == "Yaw Base" then
                l_name_1 = "Manual override";
            end;
            if l_name_1 == "Slow Walk" then
                l_name_1 = "Slow motion";
            end;
            if l_name_1 == "Ideal peek" then
                l_name_1 = "\affffffFF~\af3f9ffFF \ae7f3ffFFI\adcedffFFd\ad0e7ffFFe\ac4e1ffFFa\ab8dbffFFl\aadd6ffFF \aa1d0ffFFp\a95caffFFe\a89c4ffFFe\a7ebeffFFk\a72b8ffFF \a66b2ffFF~";
            end;
            local l_value_0 = v424[v437].value;
            if l_name_1 == "Damage override" or l_name_1 == "Ping spike" or l_name_1 == "Manual yaw" then
                render.text(1, vector(v429 + 2, v430 + 22 + v425), color(255, 255, 255, v440 * 255), nil, l_name_1);
                render.text(1, vector(v429 - 12 + v421 - render.measure_text(1, nil, l_value_0).x, v430 + 22 + v425), color(255, 255, 255, v440 * 255), nil, "[" .. l_value_0 .. "]");
            else
                render.text(1, vector(v429 + 2, v430 + 22 + v425), color(255, 255, 255, v440 * 255), nil, l_name_1);
                render.text(1, vector(v429 - 2 + v421 - render.measure_text(1, nil, v438).x, v430 + 22 + v425), color(255, 255, 255, v440 * 255), nil, "" .. v438);
            end;
            v425 = v425 + 12.5 * v440;
        end;
        v325(v429, v430, v421, 20, v299.keybinds_x_slider, v299.keybinds_y_slider);
        return;
    end;
end;
local v442 = 20;
spectatorlist_system = function()
    -- upvalues: v181 (ref), v184 (ref), v161 (ref), v299 (ref), v442 (ref), v67 (ref), v347 (ref), v183 (ref), v182 (ref), v107 (ref), v37 (ref), v334 (ref)
    if not v181:get("Spectator list") then
        return;
    elseif v184:get() == "Default" then
        return;
    elseif not v161:get() then
        return;
    else
        local v443 = v299.x_slider:get();
        local v444 = v299.y_slider:get();
        local v445 = false;
        local v446 = 35;
        local v447 = 0;
        local v448 = render.measure_text(1, nil, c_name).x - 20;
        for _, v450 in pairs(getspectators()) do
            local v451 = v450:get_name();
            if #v451 > 16 then
                v451 = v451:sub(0, 16) .. "...";
            end;
            if v451 then
                v445 = true;
                if v446 < v448 and v448 then
                    v446 = v448;
                end;
            end;
        end;
        v442 = v67:lerp(v442, v446 + 90, 0.1);
        v447 = v67:animate("spec_state", not v445 and ui.get_alpha() ~= 1);
        local l_r_3 = v183:get().r;
        local l_g_3 = v183:get().g;
        v347 = v183:get().b;
        g = l_g_3;
        r = l_r_3;
        if v182:get() == "Solus" then
            render.gradient(vector(v443 - 1, v444 - 1), vector(v443 + v442 + 1, v444 + 21), color(r, g, v347, tonumber(255 * v447)), color(r, g, v347, tonumber(255 * v447)), color(r, g, v347, 25 * v447), color(r, g, v347, 25 * v447), 5);
            for v454 = 1, 5 do
                render.rect_outline(vector(v443 - v454 + 1, v444 - v454 + 1), vector(v443 + v442 + 1 + v454, v444 + 21 + v454), color(r, g, v347, 0.15 * (1 - v454 / 5) * (255 * v447)), 1, 5);
            end;
            render.rect(vector(v443, v444), vector(v443 + v442, v444 + 20), color(10, 220 * v447), 5);
            render.text(1, vector(v443 + v442 / 2, v444 + 9), color(255, 255 * v447), "c", "spectators");
        elseif v182:get() == "\aDEFAULTGame\a5d8100FFS\a5d8100FFe\a5d8100FFn\a5d8100FFs\a5d8100FFe" then
            if v447 > 0 then
                gsbox(v443, v444 - 10, v442, 30, true);
            end;
            render.text(1, vector(v443 + v442 / 2, v444 + 5), color(255, 255 * v447), "c", "spectators");
        end;
        v107 = 4;
        specheight = v107;
        for _, v456 in pairs(getspectators()) do
            local v457 = v456:get_name();
            local v458 = v456:get_steam_avatar();
            if #v457 > 15 then
                v457 = v457:sub(0, 15) .. "...";
            end;
            if v458 then
                render.texture(v458, vector(v443 + v442 - 16, v444 + 20 + specheight), vector(15, 15), color(255, 255 * v447), "f", 0);
            else
                render.texture(v37, vector(v443 + v442 - 16, v444 + 20 + specheight), vector(15, 15), color(255, 255 * v447), "f", 0);
            end;
            render.text(1, vector(v443 + 2, v444 + 20 + specheight), color(255, 255 * v447), "", v457);
            specheight = specheight + 20;
        end;
        v334(v443, v444, v442, 21, v299.x_slider, v299.y_slider);
        return;
    end;
end;
luatag = function()
    -- upvalues: v190 (ref), v197 (ref), v14 (ref), v198 (ref), v308 (ref)
    local _ = math.floor(globals.curtime * 3.4);
    if v190:get() and v197:get() then
        v14 = 0;
        if v198:get() == "\aDEFAULTGame\a5d8100FFS\a5d8100FFe\a5d8100FFn\a5d8100FFs\a5d8100FFe" then
            if entity.get_local_player() ~= nil and globals.is_connected and globals.choked_commands == 0 then
                local v460 = entity.get_game_rules();
                clan_tag = gamesense_anim("gamesense ", {
                    [1] = 2, 
                    [2] = 3, 
                    [3] = 4, 
                    [4] = 5, 
                    [5] = 6, 
                    [6] = 7, 
                    [7] = 8, 
                    [8] = 9, 
                    [9] = 10, 
                    [10] = 11, 
                    [11] = 12, 
                    [12] = 13, 
                    [13] = 14, 
                    [14] = 14, 
                    [15] = 14, 
                    [16] = 14, 
                    [17] = 14, 
                    [18] = 14, 
                    [19] = 14, 
                    [20] = 14, 
                    [21] = 15, 
                    [22] = 16, 
                    [23] = 17, 
                    [24] = 18, 
                    [25] = 19, 
                    [26] = 20, 
                    [27] = 21, 
                    [28] = 22, 
                    [29] = 23, 
                    [30] = 24
                });
                if v460.m_gamePhase == 5 then
                    clan_tag = gamesense_anim("gamesense", {
                        [1] = 14
                    });
                    v308(clan_tag, clan_tag);
                elseif v460.m_timeUntilNextPhaseStarts ~= 0 then
                    clan_tag = gamesense_anim("gamesense", {
                        [1] = 14
                    });
                    v308(clan_tag, clan_tag);
                elseif clan_tag ~= clan_tag_prev then
                    v308(clan_tag, clan_tag);
                end;
                clan_tag_prev = clan_tag;
            end;
            enabled_prev = false;
        elseif v198:get() == "\affffffFFs\ae8eddbFFk\ad1dbb6FFe\abac992FFe\aa2b76dFFt\a8ba549FF.\a749324FFc\a5d8100FFc" then
            if entity.get_local_player() ~= nil and globals.is_connected and globals.choked_commands == 0 then
                local v461 = entity.get_game_rules();
                clan_tag = gamesense_anim("skeet.cc", {
                    [1] = 0, 
                    [2] = 1, 
                    [3] = 2, 
                    [4] = 3, 
                    [5] = 4, 
                    [6] = 5, 
                    [7] = 6, 
                    [8] = 7, 
                    [9] = 8, 
                    [10] = 9, 
                    [11] = 10, 
                    [12] = 11, 
                    [13] = 11, 
                    [14] = 11, 
                    [15] = 11, 
                    [16] = 11, 
                    [17] = 11, 
                    [18] = 11, 
                    [19] = 11, 
                    [20] = 12, 
                    [21] = 13, 
                    [22] = 14, 
                    [23] = 15, 
                    [24] = 16, 
                    [25] = 17, 
                    [26] = 18, 
                    [27] = 19, 
                    [28] = 20, 
                    [29] = 21, 
                    [30] = 22
                });
                if v461.m_gamePhase == 5 then
                    clan_tag = gamesense_anim("skeet.cc", {
                        [1] = 14
                    });
                    v308(clan_tag, clan_tag);
                elseif v461.m_timeUntilNextPhaseStarts ~= 0 then
                    clan_tag = gamesense_anim("skeet.cc", {
                        [1] = 14
                    });
                    v308(clan_tag, clan_tag);
                elseif clan_tag ~= clan_tag_prev then
                    v308(clan_tag, clan_tag);
                end;
                clan_tag_prev = clan_tag;
            end;
            enabled_prev = false;
        else
            if entity.get_local_player() ~= nil and globals.is_connected and globals.choked_commands == 0 then
                local v462 = entity.get_game_rules();
                clan_tag = gamesense_anim("fivesense ", {
                    [1] = 2, 
                    [2] = 3, 
                    [3] = 4, 
                    [4] = 5, 
                    [5] = 6, 
                    [6] = 7, 
                    [7] = 8, 
                    [8] = 9, 
                    [9] = 10, 
                    [10] = 11, 
                    [11] = 12, 
                    [12] = 13, 
                    [13] = 14, 
                    [14] = 14, 
                    [15] = 14, 
                    [16] = 14, 
                    [17] = 14, 
                    [18] = 14, 
                    [19] = 14, 
                    [20] = 14, 
                    [21] = 15, 
                    [22] = 16, 
                    [23] = 17, 
                    [24] = 18, 
                    [25] = 19, 
                    [26] = 20, 
                    [27] = 21, 
                    [28] = 22, 
                    [29] = 23, 
                    [30] = 24
                });
                if v462.m_gamePhase == 5 then
                    clan_tag = gamesense_anim("fivesense ", {
                        [1] = 14
                    });
                    v308(clan_tag, clan_tag);
                elseif v462.m_timeUntilNextPhaseStarts ~= 0 then
                    clan_tag = gamesense_anim("fivesense ", {
                        [1] = 14
                    });
                    v308(clan_tag, clan_tag);
                elseif clan_tag ~= clan_tag_prev then
                    v308(clan_tag, clan_tag);
                end;
                clan_tag_prev = clan_tag;
            end;
            enabled_prev = false;
        end;
    end;
    if not v197:get() or not v190:get() then
        if v14 <= 50 then
            v308("\000", "\000");
        end;
        v14 = v14 + 1;
    end;
end;
gsui = function()
    render.rect(vector(ui.get_position().x - 7, ui.get_position().y - 10), vector(ui.get_position().x + ui.get_size().x + 6, ui.get_position().y + ui.get_size().y + 6), color(18, 255 * ui.get_alpha()));
    render.rect(vector(ui.get_position().x - 6, ui.get_position().y - 9), vector(ui.get_position().x + ui.get_size().x + 5, ui.get_position().y + ui.get_size().y + 5), color(62, 255 * ui.get_alpha()));
    render.rect(vector(ui.get_position().x - 5, ui.get_position().y - 8), vector(ui.get_position().x + ui.get_size().x + 4, ui.get_position().y + ui.get_size().y + 4), color(44, 255 * ui.get_alpha()));
    render.rect(vector(ui.get_position().x - 3, ui.get_position().y - 6), vector(ui.get_position().x + ui.get_size().x + 2, ui.get_position().y + ui.get_size().y + 2), color(62, 255 * ui.get_alpha()));
    render.rect(vector(ui.get_position().x - 2, ui.get_position().y - 5), vector(ui.get_position().x + ui.get_size().x + 1, ui.get_position().y + ui.get_size().y + 1), color(19, 255 * ui.get_alpha()));
    render.rect(vector(ui.get_position().x - 1, ui.get_position().y - 4), vector(ui.get_position().x + ui.get_size().x, ui.get_position().y + ui.get_size().y), color(20, 255 * ui.get_alpha()));
    render.gradient(vector(ui.get_position().x - 1, ui.get_position().y - 2), vector(ui.get_position().x + ui.get_size().x / 2, ui.get_position().y - 4), color(60, 174, 222, 255 * ui.get_alpha()), color(255, 35, 206, 255 * ui.get_alpha()), color(49, 87, 111, 255 * ui.get_alpha()), color(156, 6, 98, 255 * ui.get_alpha()));
    render.gradient(vector(ui.get_position().x + ui.get_size().x / 2 - 1, ui.get_position().y - 2), vector(ui.get_position().x + ui.get_size().x, ui.get_position().y - 4), color(256, 5, 206, 255 * ui.get_alpha()), color(200, 226, 60, 255 * ui.get_alpha()), color(170, 0, 100, 255 * ui.get_alpha()), color(100, 112, 29, 255 * ui.get_alpha()));
end;
get_ping = function()
    if not globals.is_in_game then
        return 0;
    else
        return utils.net_channel().latency[1] * 1000;
    end;
end;
local v463 = 0;
local v464 = 0;
local v465 = 0;
indicators_function = function()
    -- upvalues: v8 (ref), v94 (ref), v25 (ref), v307 (ref), v26 (ref), v24 (ref), v30 (ref), v27 (ref), v28 (ref), v29 (ref), v31 (ref), v32 (ref), v33 (ref), v34 (ref), v95 (ref), v179 (ref), v183 (ref), v464 (ref), v35 (ref), v180 (ref), v99 (ref), v15 (ref), v13 (ref), v170 (ref), v172 (ref), v174 (ref), v96 (ref), v463 (ref), v173 (ref), v171 (ref), v41 (ref), v465 (ref), v1 (ref)
    mindmgval = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get();
    if not entity.get_local_player() or not entity.get_local_player():is_alive() then
        return;
    else
        local v466 = math.floor(v8.get_desync_delta());
        local v467 = entity.get_local_player();
        if not v467 then
            return;
        else
            local v468 = v94.x / 2;
            local v469 = v94.y / 2;
            local l_mindmgval_0 = mindmgval;
            if l_mindmgval_0 == 0 then
                l_mindmgval_0 = "auto";
            end;
            local v471 = rage.exploit:get();
            local l_m_bIsScoped_0 = v467.m_bIsScoped;
            local v473 = 5;
            v25 = v307(l_m_bIsScoped_0, v25, 34, 10) or 0;
            v26 = v307(l_m_bIsScoped_0, v26, 36, 10) or 0;
            v24 = v307(l_m_bIsScoped_0, v24, 36, 10) or 0;
            v30 = v307(l_m_bIsScoped_0, v30, 33, 10) or 0;
            v27 = v307(l_m_bIsScoped_0, v27, 29, 10) or 0;
            v28 = v307(l_m_bIsScoped_0, v28, 23, 10) or 0;
            v29 = v307(l_m_bIsScoped_0, v29, 37, 10) or 0;
            v31 = v307(l_m_bIsScoped_0, v31, 37, 10) or 0;
            v32 = v307(l_m_bIsScoped_0, v32, 23, 10) or 0;
            v33 = v307(l_m_bIsScoped_0, v33, 31, 10) or 0;
            v34 = v307(l_m_bIsScoped_0, v34, render.measure_text(v95, nil, antiaim_state_real).x - 10, 10) or 0;
            if v179:get() then
                local l_r_4 = v183:get().r;
                local l_g_4 = v183:get().g;
                local l_b_0 = v183:get().b;
                local v477 = v183:get():to_hex();
                v464 = v307(antiaim_state_real == "Slow-Walking", v464, 15, 20) or 0;
                if #v35 > 12 then
                    v35:sub(0, 12);
                end;
                if v180:get() == "Game\a739601FFS\208\181nse" then
                    gsbox(22, v469 - 39, 155, 75, true);
                    render.text(v99, vector(97, v469 - 22.5), color(), "c", "\a5bb3f4FFF\a63b0f4FFi\a6baef3FFv\a72abf3FFe\a7aa9f2FFS\a82a6f2FFe\a8aa3f1FFn\a91a1f1FFs\a999ef0FFe\aa19bf0FF.\aa999f0FFp\ab196efFFu\ab894efFFb\ac091eeFF \ac88eeeFFd\ad08cedFFe\ad789edFFb\adf87ecFFu\ae784ecFFg");
                    render.text(1, vector(32, v469 - 15), color(), "", "user: \a95b806FF" .. v35);
                    render.text(1, vector(33, v469), color(), "", "desync delta: \a95b806FF " .. math.floor(v466) .. "\194\176");
                    render.text(1, vector(32, v469 + 15), color(), "", "player state: \a95b806FF" .. string.lower(antiaim_state_real));
                elseif v180:get() == "Default" then
                    render.text(1, vector(22, v469 - 30), color(), "", "fivesense \a95b806FF" .. v15 .. "\affffffFF v" .. v13);
                    render.text(1, vector(22, v469 - 15), color(), "", "registered to: \a95b806FF" .. v35);
                    render.text(1, vector(22, v469), color(), "", "desync delta: \a95b806FF " .. math.floor(v466) .. "\194\176");
                    render.text(1, vector(22, v469 + 15), color(), "", "player state: \a95b806FF" .. string.lower(antiaim_state_real));
                else
                    render.gradient(vector(17, v469 - 35), vector(146 + v464, v469 + 33), color(l_r_4, l_g_4, l_b_0, 220), color(l_r_4, l_g_4, l_b_0, 10), color(l_r_4, l_g_4, l_b_0, 220), color(l_r_4, l_g_4, l_b_0, 10), 5);
                    for v478 = 1, 5 do
                        render.rect(vector(17 - v478, v469 - 35 - v478), vector(146 + v464 + v478, v469 + 33 + v478), color(l_r_4, l_g_4, l_b_0, 0.15 * (1 - v478 / 5) * 255), 5);
                    end;
                    render.rect(vector(18, v469 - 34), vector(145 + v464, v469 + 32), color(10, 220), 5);
                    render.text(1, vector(22, v469 - 30), color(), "", "fivesense \a" .. v477 .. v15 .. "\affffffFF v" .. v13);
                    render.text(1, vector(22, v469 - 15), color(), "", "registered to: \a" .. v477 .. v35);
                    render.text(1, vector(22, v469), color(), "", "desync delta: \a" .. v477 .. math.floor(v466) .. "\194\176");
                    render.text(1, vector(22, v469 + 15), color(), "", "player state: \a" .. v477 .. string.lower(antiaim_state_real));
                end;
            end;
            if not v170:get() then
                return;
            else
                if v172:get("Min. DMG") then
                    if not v174:get() then
                        render.text(v96, vector(v468 + 20, v469 - 10), color(), "c", l_mindmgval_0);
                    elseif v174:get() then
                        local v479 = ui.get_binds();
                        for _, v481 in ipairs(v479) do
                            if v481.name == "Min. Damage" and v481.active then
                                render.text(v96, vector(v468 + 20, v469 - 10), color(), "c", l_mindmgval_0);
                            end;
                        end;
                    end;
                end;
                if v172:get("Anti-aim arrows") then
                    local v482 = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset");
                    realaaoffset = v482:get();
                    realaaoffset_ = v482:get_override();
                    v463 = v307(l_m_bIsScoped_0, v463, 15, 10) or 0;
                    if realaaoffset == nil or realaaoffset_ == nil then
                        realaaoffset = 0;
                        realaaoffset_ = 0;
                    end;
                    render.poly((not (not (realaaoffset < -45) or realaaoffset <= -135) or realaaoffset_ < -45 and realaaoffset_ > -135) and v173:get() or color(60, 175), vector(v468 - 75, v469 - v463), vector(v468 - 65, v469 + 7.5 - v463), vector(v468 - 65, v469 - 7.5 - v463));
                    render.poly((not (not (realaaoffset > 45) or realaaoffset >= 135) or realaaoffset_ > 45 and realaaoffset_ < 135) and v173:get() or color(60, 175), vector(v468 + 75, v469 - v463), vector(v468 + 65, v469 + 7.5 - v463), vector(v468 + 65, v469 - 7.5 - v463));
                    render.poly(math.floor(v466) < 0 and v173:get() or color(60, 175), vector(v468 - 62, v469 + 7.5 - v463), vector(v468 - 60, v469 + 7.5 - v463), vector(v468 - 60, v469 - 7.5 - v463), vector(v468 - 62, v469 - 7.5 - v463));
                    render.poly(math.floor(v466) > 0 and v173:get() or color(60, 175), vector(v468 + 62.5, v469 + 7.5 - v463), vector(v468 + 60, v469 + 7.5 - v463), vector(v468 + 60, v469 - 7.5 - v463), vector(v468 + 62.5, v469 - 7.5 - v463));
                end;
                if v171:get() == 1 and v170:get() then
                    render.text(v95, vector(v468 + v25 - 12, v469 + 14 + v473), color(), "c", "Five");
                    render.text(v95, vector(v468 + v25 + 11, v469 + 14 + v473), flashingcolor(v173:get().r, v173:get().g, v173:get().b), "c", "Sense");
                    v473 = v473 + 10;
                    if v172:get("Fakelag") then
                        render.rect(vector(v468 - 25 + v31, v469 + 11 + v473), vector(v468 + 25 + v31, v469 + 15 + v473), color(50, 50, 50, 150));
                        render.rect_outline(vector(v468 - 25 + v31, v469 + 11 + v473), vector(v468 + 25 + v31, v469 + 15 + v473), color(10), 1);
                        render.push_clip_rect(vector(v468 - 24 + v31, v469 + 11 + v473), vector(v468 + 24 + v31, v469 + 15 + v473), false);
                        render.gradient(vector(v468 - 25 + v31, v469 + 12 + v473), vector(v468 - 25 + v31 + globals.choked_commands * 6, v469 + 14 + v473), v173:get(), color(60, 150), v173:get(), color(60, 150));
                        render.pop_clip_rect();
                        v473 = v473 + 7.5;
                    end;
                    if v172:get("AA condition") then
                        if not l_m_bIsScoped_0 then
                            render.text(v95, vector(v468 + v34, v469 + 14 + v473), v173:get(), "c", "-" .. antiaim_state_real .. "-");
                        else
                            render.text(v95, vector(v468 + v26 - 24, v469 + 8 + v473), v173:get(), "", "-" .. antiaim_state_real .. "-");
                        end;
                        v473 = v473 + 10;
                    end;
                    if v172:get("Keybinds") then
                        if v41.doubletap:get() and v41.fakeduck:get() == false then
                            if v471 == 1 then
                                render.text(v95, vector(v468 + 0.2 + v26, v469 + 14 + v473), color(255, 255, 255), "c", "double   ");
                                render.text(v95, vector(v468 + 0.2 + v26, v469 + 14 + v473), v173:get(), "c", "       tap");
                            else
                                render.text(v95, vector(v468 + v30, v469 + 14 + v473), color(255, 70, 70, 255), "c", "charging");
                            end;
                            v473 = v473 + 10;
                        end;
                        if v41.hideshots:get() and v41.doubletap:get() == false and v41.fakeduck:get() == false then
                            render.text(v95, vector(v468 - 0.7 + v27, v469 + 14 + v473), color(255, 255, 255), "c", " ON     ");
                            render.text(v95, vector(v468 - 1 + v27, v469 + 14 + v473), v173:get(), "c", "   SHOT");
                            v473 = v473 + 10;
                        end;
                        if cvar.cl_lagcompensation:int() == 0 then
                            render.text(v95, vector(v468 - 3 + v24, v469 + 14 + v473), color(255, 255, 255), "c", " defen    ");
                            render.text(v95, vector(v468 - 1 + v24, v469 + 14 + v473), v173:get(), "c", "      sive");
                            v473 = v473 + 10;
                        end;
                        if v41.peekassist:get() then
                            render.text(v95, vector(v468 - 1.9 + v29, v469 + 14 + v473), color(255, 255, 255), "c", "quick    ");
                            render.text(v95, vector(v468 - 1 + v29, v469 + 14 + v473), v173:get(), "c", "      peek");
                            v473 = v473 + 10;
                        end;
                        if v41.fakeduck:get() then
                            render.text(v95, vector(v468 + 0.8 + v28, v469 + 14 + v473), color(255, 255, 255), "c", "du  ");
                            render.text(v95, vector(v468 + 0.8 + v28, v469 + 14 + v473), v173:get(), "c", "  ck");
                            v473 = v473 + 10;
                        end;
                        if ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant aimbot"):get() then
                            render.text(v95, vector(v468 + 0 + v33, v469 + 14 + v473), color(255, 255, 255), "c", " dorm    ");
                            render.text(v95, vector(v468 + 1 + v33, v469 + 14 + v473), v173:get(), "c", "    ant");
                            v473 = v473 + 10;
                        end;
                        if v41.fakeping:get() > 0 then
                            render.text(v95, vector(v468 + v32, v469 + 14 + v473), color(255, 255, 255), "c", "  PI    ");
                            render.text(v95, vector(v468 + v32, v469 + 14 + v473), v173:get(), "c", "  NG");
                            v473 = v473 + 10;
                        end;
                    end;
                elseif v171:get() == 2 then
                    v465 = v307(l_m_bIsScoped_0, v465, 40, 7.5) or 0;
                    local v483 = v1.text_animate("fivesense", 1.5, {
                        color(40), 
                        color(v173:get().r, v173:get().g, v173:get().b, 255)
                    });
                    v483:animate();
                    render.text(v99, vector(v468 + v465, v469 + 14 + v473), color(), "c", v483:get_animated_text());
                    v473 = v473 + 10;
                    if v172:get("Fakelag") then
                        render.rect(vector(v468 - 25 + v465, v469 + 11 + v473), vector(v468 + 25 + v465, v469 + 16 + v473), color(50, 50, 50, 150));
                        render.rect_outline(vector(v468 - 25 + v465, v469 + 11 + v473), vector(v468 + 25 + v465, v469 + 16 + v473), color(10), 1);
                        render.push_clip_rect(vector(v468 - 24 + v465, v469 + 11 + v473), vector(v468 + 24 + v465, v469 + 16 + v473), false);
                        render.gradient(vector(v468 - 25 + v465, v469 + 12 + v473), vector(v468 - 25 + v465 + globals.choked_commands * 6, v469 + 15 + v473), v173:get(), color(60, 150), v173:get(), color(60, 150));
                        render.pop_clip_rect();
                        v473 = v473 + 5.5;
                    end;
                    if v172:get("AA condition") then
                        render.text(v95, vector(v468 + v465, v469 + 17 + v473), color(255), "c", "-" .. antiaim_state_real .. "-");
                        v473 = v473 + 10;
                    end;
                    if v172:get("Keybinds") then
                        if v41.doubletap:get() and v41.fakeduck:get() == false then
                            render.text(v95, vector(v468 + 2 + v465, v469 + 12 + v473), color(255, 255, 255), "r", "dt");
                            render.circle_outline(vector(v468 + 5 + v465, v469 + 17 + v473), v173:get(), 3, 0, v471);
                            v473 = v473 + 10;
                        end;
                        if v41.hideshots:get() and v41.doubletap:get() == false and v41.fakeduck:get() == false then
                            render.text(v95, vector(v468 + 3 + v465, v469 + 12 + v473), color(255, 255, 255), "r", "hs");
                            render.circle_outline(vector(v468 + 6 + v465, v469 + 17 + v473), v173:get(), 3, 0, v471);
                            v473 = v473 + 10;
                        end;
                        if cvar.cl_lagcompensation:int() == 0 then
                            render.text(v95, vector(v468 - 3 + v465, v469 + 17 + v473), color(255, 255, 255), "c", "ax");
                            v473 = v473 + 10;
                        end;
                        if v41.peekassist:get() then
                            render.text(v95, vector(v468 - 1.9 + v465, v469 + 17 + v473), color(255, 255, 255), "c", "qp");
                            v473 = v473 + 10;
                        end;
                        if v41.fakeduck:get() then
                            render.text(v95, vector(v468 + 0.8 + v465, v469 + 17 + v473), color(255, 255, 255), "c", "fd");
                            v473 = v473 + 10;
                        end;
                        if ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant aimbot"):get() then
                            render.text(v95, vector(v468 + v465, v469 + 17 + v473), color(255, 255, 255), "c", "da");
                            v473 = v473 + 10;
                        end;
                        if v41.fakeping:get() > 0 then
                            render.text(v95, vector(v468 + v465, v469 + 17 + v473), color(255, 255, 255), "c", "ping");
                            v473 = v473 + 10;
                        end;
                    end;
                end;
                return;
            end;
        end;
    end;
end;
local function v495(v484)
    -- upvalues: v190 (ref), v195 (ref), v196 (ref)
    if not v190:get() then
        return;
    elseif not v195:get() then
        return;
    else
        local v485 = entity.get_local_player();
        local v486 = entity.get(v484.attacker, true);
        local _ = entity.get(v484.target, true);
        local v488 = entity.get(v484.userid, true):get_name();
        local v489 = entity.get_local_player():get_name();
        if string.find(v488, "unbindall") or string.find(v488, "quit") or string.find(v488, "disconnect") or string.find(v488, "kill") then
            return;
        elseif string.find(v489, v488) then
            return;
        else
            local v490 = {
                [1] = "@" .. v488, 
                [2] = v488 .. " get good get fivesense poor dog ", 
                [3] = v488 .. " Get Good Get fivesense \230\157\177 ", 
                [4] = v488 .. " nice lachflip dog, period haram. ", 
                [5] = v488 .. " Get Good Get fivesense.pub lua! ", 
                [6] = v488 .. ", LAFF visit fivesense.pub to make your mother proud ", 
                [7] = v488 .. ", uff 1tap dog ", 
                [8] = v488 .. " du unbekannter hurensohn. ", 
                [9] = v488 .. ", 1 uff yaa bot ", 
                [10] = v488 .. ", HEADSHOT lachflip ", 
                [11] = v488 .. ", owned du LACHGRANATE ", 
                [12] = v488 .. ", eins lachkick ", 
                [13] = v488 .. " nice iq. ", 
                [14] = v488 .. " wait... who are you again? ", 
                [15] = v488 .. " dead again? are you cosplaying your dad?", 
                [16] = v488 .. " dont be like BObi, He lost every match.", 
                [17] = v488 .. " destroyed. ", 
                [18] = v488 .. " absolutely owned. ", 
                [19] = v488 .. " maybe buy fivesense so you can hit something? ", 
                [20] = v488 .. " try to hit me at least once. ", 
                [21] = v488 .. " I got an idea, open the console and type quit. ", 
                [22] = v488 .. " dont be like \196\140\195\161\196\143a, buy neverlose sub with your own money. ", 
                [23] = v488 .. " Get good with fivesense.pub lua", 
                [24] = v488 .. " get on yo \240\157\153\160\240\157\153\163\240\157\153\154\240\157\153\154\240\157\153\168", 
                [25] = v488 .. " :rofl:", 
                [26] = v488 .. " :joy:", 
                [27] = v488 .. " is *DEAD* just like Karel Meloun. ", 
                [28] = v488 .. " press F to pay respect for Karel Meloun. ", 
                [29] = v488 .. " you should turn the game off. Just walk outside and find the nearest tree, then apologise to it for wasting oxygen ", 
                [30] = v488 .. " got his iq tested. ", 
                [31] = v488 .. " dead? just like the tro1pi guy. "
            };
            local v491 = {
                [1] = v488 .. " \232\175\182\229\188\128\232\137\190\232\191\170\229\168\156\229\176\186\229\147\166 GO LEAVE HVH \229\188\128\229\139\146\229\147\166\229\168\156 IM \229\147\166\229\139\146\229\139\146 G0D", 
                [2] = v488 .. " \232\137\190\229\139\146\230\157\176\230\157\176\229\188\128\229\139\146\232\137\190\229\168\156 NO GUD, \232\175\182\229\144\190\232\137\190\229\176\186\232\137\190\229\168\156\232\191\170 BUY FIVESENSE", 
                [3] = v488 .. " \232\175\182\229\176\186\232\137\190\229\168\156\229\139\146\232\191\170 HVH LEAGUE \229\188\128\229\139\146\232\137\190\229\168\156\229\168\156 WITH \232\137\190\229\139\146\229\139\146 FIVESENSE", 
                [4] = v488 .. " \232\175\182\229\168\156\229\176\186\229\147\166 GET \232\175\182\229\188\128\232\137\190\229\168\156 THE \229\188\128\229\139\146\229\147\166\229\168\156 FUCK \232\137\190\232\191\170\229\168\156\229\176\186\229\147\166 OUT \230\157\176\229\188\128\232\137\190\229\168\156 HURENSOHN. ", 
                [5] = v488 .. " \230\157\176\229\188\128\232\137\190\229\168\156 GTFO \232\175\182\229\168\156\229\176\186\229\147\166 QUIT \232\137\190\232\191\170\229\168\156\229\176\186\229\147\166 THIS \229\188\128\229\139\146\229\147\166\229\168\156 GAME \232\175\182\229\188\128\232\137\190\229\168\156 BITCH. ", 
                [6] = v488 .. " \229\139\146\232\137\190\232\191\170\229\139\146\229\176\186\229\147\166 2k23 JOINER \229\176\186\229\139\146\229\188\128\229\168\156 :JOY: \229\147\166\229\139\146\229\176\186 LEAVE \229\188\128\229\139\146\229\176\186\229\168\156 HVH", 
                [7] = v488 .. " \229\176\186\229\188\128\232\137\190\229\139\146 WHY PEEK \229\188\128\232\137\190\229\139\146\229\168\156 NICE \229\147\166\229\188\128\229\139\146\229\176\186 IQ \229\147\166\229\139\146\229\188\128\229\168\156 DOG!"
            };
            local v492 = {
                [1] = nil, 
                [2] = nil, 
                [3] = nil, 
                [4] = nil, 
                [5] = " 420daniel smoking in the forest", 
                [6] = nil, 
                [7] = nil, 
                [8] = nil, 
                [9] = nil, 
                [10] = " $$ ckgang.lua abuser $$", 
                [11] = " $$ kde jsi bote $$", 
                [12] = nil, 
                [13] = nil, 
                [14] = nil, 
                [15] = nil, 
                [16] = nil, 
                [17] = nil, 
                [18] = nil, 
                [19] = nil, 
                [20] = nil, 
                [21] = nil, 
                [22] = nil, 
                [23] = nil, 
                [24] = nil, 
                [25] = " tady zase nejakej sasek si hraje s autama (\226\151\163_\226\151\162)", 
                [26] = " 18:16 9:3 9:0? fav cisla? (\226\151\163_\226\151\162)", 
                [27] = " We know who you are...", 
                [1] = "@" .. v488 .. " podivej se do killfeedu", 
                [2] = "@" .. v488 .. " cus hele... tak snad priste!", 
                [3] = v488 .. " zmrd se chtel van vi vanovat (\226\151\163_\226\151\162)", 
                [4] = v488 .. " kde jsi?", 
                [6] = v488 .. " missujes botiku", 
                [7] = v488 .. " prodavas nastaveni?!#%&$", 
                [8] = v488 .. " zec mi kar kripelko", 
                [9] = v488 .. " uzivas si luckycharms?", 
                [12] = v488 .. " zase dead? (\226\151\163_\226\151\162)", 
                [13] = v488 .. " fivesense nepotrebuje update (\226\151\163_\226\151\162)", 
                [14] = " videl nekdo " .. v488 .. "? aha, to je tim ze je porad dead...", 
                [15] = " nejakej " .. v488 .. ", tohle jmeno slysim prvne.", 
                [16] = " uz vidim ten nazev videa '" .. v488 .. " owned by " .. v489 .. "'", 
                [17] = " pico zmen to jmeno protoze " .. v488 .. " je fakt hrozne :(", 
                [18] = " prosim jeden HvH tutorial pro " .. v488 .. " protoze mu to fakt nejde.", 
                [19] = v488 .. " trollis nebo jsi tak spatny?", 
                [20] = " tak " .. v488 .. " je vic dead nez jeho fotr :joy:", 
                [21] = v488 .. " pozdravuj tatu", 
                [22] = v488 .. " dostal za 1, uzivas si byt owned by " .. v489 .. "?", 
                [23] = v488 .. " zastekej pejsku.", 
                [24] = v489 .. " > " .. v488, 
                [28] = v488 .. " dostal za \240\157\159\143", 
                [29] = v488 .. " ano pouzivam fivesense debug, jak si to poznal?"
            };
            local v493 = {
                [1] = " California dreamin (California dreamin), On such a winter's day", 
                [2] = " Rothschild family is financing wars since Napoleonic Wars!", 
                [3] = " Don't trust the government.", 
                [4] = " The Tro1pi guy has been taken by the government for living and smoking in the forest.", 
                [5] = " have you ever seen the plane that crashed into Pentagon? Where is the fucking plane?!?!", 
                [6] = " Use Tor browser to learn about project Mk Ultra.", 
                [7] = " Mind control is real thing.", 
                [8] = " The new world order is real shit.", 
                [9] = " Freedom is just our blindness", 
                [10] = " CIA paid Mk Ultra indirectly, why?"
            };
            local v494 = {
                [1] = "1", 
                [2] = "\240\157\159\143", 
                [3] = "\226\130\129", 
                [4] = "\226\145\160", 
                [5] = "\226\158\138", 
                [6] = "\240\157\159\153", 
                [7] = "\226\135\130", 
                [8] = "\227\128\1441\227\128\145", 
                [9] = "\227\128\1421\227\128\143", 
                [10] = "\226\137\1391\226\137\139", 
                [11] = "..\240\157\159\143", 
                [12] = "..\226\130\129.."
            };
            if v485 == v486 then
                if v196:get() == "Chinese" then
                    utils.execute_after(1, function()
                        -- upvalues: v491 (ref)
                        utils.console_exec("say  " .. v491[utils.random_int(1, #v491)]:gsub("\"", "") .. "");
                    end);
                elseif v196:get() == "Czech" then
                    utils.execute_after(1, function()
                        -- upvalues: v492 (ref)
                        utils.console_exec("say  " .. v492[utils.random_int(1, #v492)]:gsub("\"", "") .. "");
                    end);
                elseif v196:get() == "Government" then
                    utils.execute_after(1, function()
                        -- upvalues: v493 (ref)
                        utils.console_exec("say  " .. v493[utils.random_int(1, #v493)]:gsub("\"", "") .. "");
                    end);
                elseif v196:get() == "One" then
                    utils.execute_after(1, function()
                        -- upvalues: v494 (ref)
                        utils.console_exec("say  " .. v494[utils.random_int(1, #v494)]:gsub("\"", "") .. "");
                    end);
                else
                    utils.execute_after(1, function()
                        -- upvalues: v490 (ref)
                        utils.console_exec("say  " .. v490[utils.random_int(1, #v490)]:gsub("\"", "") .. "");
                    end);
                end;
            end;
            return;
        end;
    end;
end;
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
};
events.aim_ack:set(function(v496)
    -- upvalues: v152 (ref), v158 (ref), v157 (ref), v159 (ref)
    if not v152:get() then
        return;
    else
        if v158:get("Console / Event") and v157:get() then
            local _ = entity.get_local_player();
            local v498 = entity.get(v496.target);
            local _ = v496.damage;
            local l_wanted_damage_0 = v496.wanted_damage;
            local v501 = hitgroup_str[v496.wanted_hitgroup];
            local l_hitchance_0 = v496.hitchance;
            local l_state_0 = v496.state;
            local l_state_1 = v496.state;
            local l_backtrack_0 = v496.backtrack;
            if not v498 then
                return;
            elseif v498 == nil then
                return;
            else
                local l_m_iHealth_0 = v498.m_iHealth;
                if l_state_1 == "spread" then
                    l_state_1 = "\aFEEA7DFFspread";
                end;
                if l_state_1 == "prediction error" then
                    l_state_1 = "\aFEEA7DFFpred. error";
                end;
                if l_state_1 == "correction" then
                    l_state_1 = "\aFF5959FFcorrection";
                end;
                if l_state_1 == "misprediction" then
                    l_state_1 = "\aFEEA7DFFmisprediction";
                end;
                if l_state_1 == "lagcomp failure" then
                    l_state_1 = "\aFF5959FFlagcomp failure";
                end;
                if l_state_0 == "correction" then
                    l_state_0 = "resolver";
                end;
                local v507 = hitgroup_str[v496.hitgroup];
                if l_state_0 == nil then
                    if v159:get() == "\aDEFAULTGame\a5d8100FFS\a5d8100FFe\a5d8100FFn\a5d8100FFs\a5d8100FFe" then
                        print_dev(("Hit %s in the %s for %d(" .. string.format("%.f", l_wanted_damage_0) .. ") damage (hp: " .. l_m_iHealth_0 .. ") (aimed: " .. v501 .. ") (bt: %s)"):format(v498:get_name(), v507, v496.damage, l_backtrack_0));
                        print_raw(("\a95b806ff[gamesense] \aD5D5D5ffHit %s in the %s for %d(" .. string.format("%.f", l_wanted_damage_0) .. ") damage (hp: " .. l_m_iHealth_0 .. ") (aimed: " .. v501 .. ") (bt: %s)"):format(v498:get_name(), v507, v496.damage, l_backtrack_0));
                    else
                        print_dev(("Hit %s in the %s for %d(" .. string.format("%.f", l_wanted_damage_0) .. ") damage (hp: " .. l_m_iHealth_0 .. ") (aimed: " .. v501 .. ") (bt: %s)"):format(v498:get_name(), v507, v496.damage, l_backtrack_0));
                        print_raw(("\a95b806ff|fivesense| \aD5D5D5ffHit %s in the %s for %d(" .. string.format("%.f", l_wanted_damage_0) .. ") damage (hp: " .. l_m_iHealth_0 .. ") (aimed: " .. v501 .. ") (bt: %s)"):format(v498:get_name(), v507, v496.damage, l_backtrack_0));
                    end;
                elseif v159:get() == "\aDEFAULTGame\a5d8100FFS\a5d8100FFe\a5d8100FFn\a5d8100FFs\a5d8100FFe" then
                    print_dev(("Missed shot in %s' %s due to " .. l_state_0 .. " (hc:" .. string.format("%.f", l_hitchance_0) .. ") (damage: " .. string.format("%.f", l_wanted_damage_0) .. ")"):format(v498:get_name(), v501));
                    print_raw(("\a95b806ff[gamesense] \aD5D5D5ffMissed shot in %s in the %s due to " .. l_state_1 .. "\aD5D5D5ff (hc: " .. string.format("%.f", l_hitchance_0) .. ") (damage: " .. string.format("%.f", l_wanted_damage_0) .. ")"):format(v498:get_name(), v501));
                else
                    print_dev(("Missed shot in %s' %s due to " .. l_state_0 .. " (hc:" .. string.format("%.f", l_hitchance_0) .. ") (damage: " .. string.format("%.f", l_wanted_damage_0) .. ")"):format(v498:get_name(), v501));
                    print_raw(("\a95b806ff|fivesense| \aD5D5D5ffMissed shot in %s in the %s due to " .. l_state_1 .. "\aD5D5D5ff (hc: " .. string.format("%.f", l_hitchance_0) .. ") (damage: " .. string.format("%.f", l_wanted_damage_0) .. ")"):format(v498:get_name(), v501));
                end;
            end;
        end;
        return;
    end;
end);
events.player_hurt:set(function(v508)
    -- upvalues: v152 (ref), v158 (ref), v157 (ref), v159 (ref)
    if not v152:get() then
        return;
    else
        if v158:get("Console / Event") and v157:get() then
            local v509 = entity.get_local_player();
            local v510 = entity.get(v508.attacker, true);
            local l_weapon_0 = v508.weapon;
            local v512 = "Hit";
            if l_weapon_0 == "hegrenade" then
                v512 = "Naded";
            end;
            if l_weapon_0 == "inferno" then
                v512 = "Burned";
            end;
            if l_weapon_0 == "knife" then
                v512 = "Knifed";
            end;
            if (l_weapon_0 == "hegrenade" or l_weapon_0 == "inferno" or l_weapon_0 == "knife") and v509 == v510 and v509 ~= v508 then
                local v513 = entity.get(v508.userid, true);
                if v159:get() == "\aDEFAULTGame\a5d8100FFS\a5d8100FFe\a5d8100FFn\a5d8100FFs\a5d8100FFe" then
                    print_raw(("\a95b806ff[gamesense] \aD5D5D5ff" .. v512 .. " %s for %d damage (%d health remaining)"):format(v513:get_name(), v508.dmg_health, v508.health));
                    print_dev(("" .. v512 .. " %s for %d damage (%d health remaining)"):format(v513:get_name(), v508.dmg_health, v508.health));
                else
                    print_raw(("\a95b806ff|fivesense| \aD5D5D5ff" .. v512 .. " %s for %d damage (%d health remaining)"):format(v513:get_name(), v508.dmg_health, v508.health));
                    print_dev(("" .. v512 .. " %s for %d damage (%d health remaining)"):format(v513:get_name(), v508.dmg_health, v508.health));
                end;
            end;
        end;
        return;
    end;
end);
local v514 = render.screen_size();
local v515 = {
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
local v516 = {};
local v517 = 1;
local _ = {
    inferno = "Burned", 
    hegrenade = "Naded", 
    knife = "Knifed"
};
events.aim_ack:set(function(v519)
    -- upvalues: v152 (ref), v183 (ref), v158 (ref), v157 (ref), v515 (ref), v159 (ref), v516 (ref), v517 (ref)
    if not v152:get() then
        return;
    else
        local v520 = v183:get():to_hex();
        if v158:get("Under crosshair") and v157:get() then
            local l_damage_1 = v519.damage;
            local v522 = v515[v519.hitgroup];
            local v523 = entity.get(v519.target);
            local l_m_iHealth_1 = v523.m_iHealth;
            local l_backtrack_1 = v519.backtrack;
            local v526 = entity.get_local_player();
            if result == nil and l_damage_1 ~= nil and v526 ~= v519 then
                if v159:get() == "\aDEFAULTGame\a5d8100FFS\a5d8100FFe\a5d8100FFn\a5d8100FFs\a5d8100FFe" then
                    v516[#v516 + 1] = {
                        [1] = nil, 
                        [2] = nil, 
                        [3] = 0, 
                        [1] = "F\a95b806ffS \aFFFFFFC8Hit \a95b806FF" .. v523:get_name() .. "\aFFFFFFC8's " .. v522 .. " for \a95b806FF" .. l_damage_1 .. "\aFFFFFFC8 (" .. v519.wanted_damage .. ") [bt: \a95b806FF" .. l_backtrack_1 .. "\aFFFFFFC8 - hp \a95b806FF" .. l_m_iHealth_1 .. "\aFFFFFFC8]", 
                        [2] = globals.tickcount + 250
                    };
                else
                    v516[#v516 + 1] = {
                        [1] = nil, 
                        [2] = nil, 
                        [3] = 0, 
                        [1] = "F\a" .. v520 .. "S \aFFFFFFC8Hit \a" .. v520 .. v523:get_name() .. "\aFFFFFFC8's " .. v522 .. " for \a" .. v520 .. l_damage_1 .. "\aFFFFFFC8 (" .. v519.wanted_damage .. ") [bt: \a" .. v520 .. l_backtrack_1 .. "\aFFFFFFC8 - hp \a" .. v520 .. l_m_iHealth_1 .. "\aFFFFFFC8]", 
                        [2] = globals.tickcount + 250
                    };
                end;
            end;
            v517 = v517 == 999 and 1 or v517 + 1;
        end;
        return;
    end;
end);
events.player_hurt:set(function(v527)
    -- upvalues: v152 (ref), v183 (ref), v158 (ref), v157 (ref), v159 (ref), v516 (ref)
    if not v152:get() then
        return;
    else
        local v528 = v183:get():to_hex();
        if v158:get("Under crosshair") and v157:get() then
            local v529 = entity.get_local_player();
            local v530 = entity.get(v527.attacker, true);
            local l_weapon_1 = v527.weapon;
            local v532 = "Hit";
            if l_weapon_1 == "hegrenade" then
                v532 = "Naded";
            end;
            if l_weapon_1 == "inferno" then
                v532 = "Burned";
            end;
            if l_weapon_1 == "knife" then
                v532 = "Knifed";
            end;
            if (l_weapon_1 == "hegrenade" or l_weapon_1 == "inferno" or l_weapon_1 == "knife") and v529 == v530 and v529 ~= v527 then
                local v533 = entity.get(v527.userid, true);
                if v159:get() == "\aDEFAULTGame\a5d8100FFS\a5d8100FFe\a5d8100FFn\a5d8100FFs\a5d8100FFe" then
                    v516[#v516 + 1] = {
                        [1] = nil, 
                        [2] = nil, 
                        [3] = 0, 
                        [1] = ("F\a95b806ffS \aFFFFFFC8" .. v532 .. " \a95b806FF%s \aFFFFFFC8for \a95b806FF%s \aFFFFFFC8[hp: \a95b806FF%s\aFFFFFFC8]"):format(v533:get_name(), v527.dmg_health, v527.health), 
                        [2] = globals.tickcount + 250
                    };
                else
                    v516[#v516 + 1] = {
                        [1] = nil, 
                        [2] = nil, 
                        [3] = 0, 
                        [1] = ("F\a" .. v528 .. "S \aFFFFFFC8" .. v532 .. " \a" .. v528 .. "%s \aFFFFFFC8for \a" .. v528 .. "%s \aFFFFFFC8[hp: \a" .. v528 .. "%s\aFFFFFFC8]"):format(v533:get_name(), v527.dmg_health, v527.health), 
                        [2] = globals.tickcount + 250
                    };
                end;
            end;
        end;
        return;
    end;
end);
events.aim_ack:set(function(v534)
    -- upvalues: v152 (ref), v183 (ref), v158 (ref), v157 (ref), v515 (ref), v159 (ref), v516 (ref), v517 (ref)
    if not v152:get() then
        return;
    else
        local v535 = v183:get():to_hex();
        if v158:get("Under crosshair") and v157:get() then
            player_name = v534.target:get_name();
            damage = v534.damage;
            hitchance = v534.hitchance;
            hitgroup = v515[v534.hitgroup];
            backtrack = v534.backtrack;
            wanted_damage = v534.wanted_damage;
            hitchance = v534.hitchance;
            wanted_hitgroup = v515[v534.wanted_hitgroup];
            state = v534.state;
            if state ~= nil then
                if v159:get() == "\aDEFAULTGame\a5d8100FFS\a5d8100FFe\a5d8100FFn\a5d8100FFs\a5d8100FFe" then
                    v516[#v516 + 1] = {
                        [1] = nil, 
                        [2] = nil, 
                        [3] = 0, 
                        [1] = "F\a95b806ffS \aFFFFFFC8Missed shot in \aFF3434C8" .. player_name .. "\aFFFFFFC8's \aFF3434C8" .. wanted_hitgroup .. " \aFFFFFFC8due to \aFF3434C8" .. state .. " \aFFFFFFC8(\aFF3434C8" .. hitchance .. "%" .. "\aFFFFFFC8 HC)", 
                        [2] = globals.tickcount + 250
                    };
                else
                    v516[#v516 + 1] = {
                        [1] = nil, 
                        [2] = nil, 
                        [3] = 0, 
                        [1] = "F\a" .. v535 .. "S \aFFFFFFC8Missed shot in \aFF3434C8" .. player_name .. "\aFFFFFFC8's \aFF3434C8" .. wanted_hitgroup .. " \aFFFFFFC8due to \aFF3434C8" .. state .. " \aFFFFFFC8(\aFF3434C8" .. hitchance .. "%" .. "\aFFFFFFC8 HC)", 
                        [2] = globals.tickcount + 250
                    };
                end;
            end;
            v517 = v517 == 999 and 1 or v517 + 1;
        end;
        return;
    end;
end);
events.render:set(function()
    -- upvalues: v152 (ref), v516 (ref), v347 (ref), v183 (ref), v158 (ref), v157 (ref), v159 (ref), v514 (ref)
    if not v152:get() then
        return;
    else
        if #v516 > 0 then
            if globals.tickcount >= v516[1][2] then
                if v516[1][3] > 0 then
                    v516[1][3] = v516[1][3] - 40;
                elseif v516[1][3] <= 0 then
                    table.remove(v516, 1);
                end;
            end;
            if #v516 > 6 then
                table.remove(v516, 1);
            end;
            if globals.is_connected == false then
                table.remove(v516, #v516);
            end;
            for v536 = 1, #v516 do
                text_size = render.measure_text(1, nil, v516[v536][1]).x;
                if v516[v536][3] < 255 then
                    v516[v536][3] = v516[v536][3] + 10;
                end;
                local l_r_5 = v183:get().r;
                local l_g_5 = v183:get().g;
                v347 = v183:get().b;
                g = l_g_5;
                r = l_r_5;
                if v158:get("Under crosshair") and v157:get() then
                    if v159:get() == "\aDEFAULTGame\a5d8100FFS\a5d8100FFe\a5d8100FFn\a5d8100FFs\a5d8100FFe" then
                        gsbox(v514.x / 2 - text_size / 2 + v516[v536][3] / 35 / 2 - 8, v514.y / 1.3 + 30 * v536 - 8, (text_size / 2 + v516[v536][3] / 35) * 2 + 6, 27, true);
                        render.text(1, vector(v514.x / 2 - text_size / 2 + v516[v536][3] / 35, v514.y / 1.3 + 30 * v536), color(255, 255, 255, v516[v536][3]), nil, v516[v536][1]);
                    elseif v159:get() == "Default" then
                        render.text(1, vector(v514.x / 2 - text_size / 2 + v516[v536][3] / 35, v514.y / 1.3 + 16 * v536), color(255, 255, 255, v516[v536][3]), nil, v516[v536][1]);
                    elseif v159:get() == "Solus" then
                        render.gradient(vector(v514.x / 2 - text_size / 2 + v516[v536][3] / 35 / 2 - 3, v514.y / 1.3 + 30 * v536 - 6), vector(v514.x / 2 - text_size / 2 + v516[v536][3] / 35 / 2 + (text_size / 2 + v516[v536][3] / 35) * 2, v514.y / 1.3 + 30 * v536 + 18), color(r, g, v347, 255), color(r, g, v347, 255), color(r, g, v347, 25), color(r, g, v347, 25), 5);
                        for v539 = 1, 5 do
                            render.rect_outline(vector(v514.x / 2 - text_size / 2 + v516[v536][3] / 35 / 2 - 3 - v539, v514.y / 1.3 + 30 * v536 - 6 - v539), vector(v514.x / 2 - text_size / 2 + v516[v536][3] / 35 / 2 + (text_size / 2 + v516[v536][3] / 35) * 2 + v539, v514.y / 1.3 + 30 * v536 + 18 + v539), color(r, g, v347, 0.15 * (1 - v539 / 5) * 255), 1, 5);
                        end;
                        render.rect(vector(v514.x / 2 - text_size / 2 + v516[v536][3] / 35 / 2 - 2, v514.y / 1.3 + 30 * v536 - 5), vector(v514.x / 2 - text_size / 2 + v516[v536][3] / 35 / 2 + (text_size / 2 + v516[v536][3] / 35) * 2 - 1, v514.y / 1.3 + 30 * v536 + 17), color(10, 220), 5);
                        render.text(1, vector(v514.x / 2 - text_size / 2 + v516[v536][3] / 35 + 3, v514.y / 1.3 + 30 * v536), color(255, 255, 255, v516[v536][3]), nil, v516[v536][1]);
                    end;
                end;
            end;
        end;
        return;
    end;
end);
local v540 = 5;
local v541 = 5;
custom_scope = function()
    -- upvalues: v175 (ref), v161 (ref), v177 (ref), v178 (ref), v540 (ref), v67 (ref), v541 (ref), v176 (ref)
    if not entity.get_local_player() then
        return;
    elseif not v175:get() or not v161:get() then
        return;
    else
        local v542 = render.screen_size();
        local v543 = v177:get();
        local v544 = v178:get();
        v540 = v67:lerp(entity.get_local_player().m_bIsScoped and v540 or 0, v544, 0.05);
        v541 = v67:lerp(entity.get_local_player().m_bIsScoped and v541 or 0, v543, 0.05);
        if entity.get_local_player().m_bIsScoped then
            render.gradient(vector(v542.x / 2 - v541, v542.y / 2 - 1), vector(v542.x / 2 - v540, v542.y / 2 + 0), color(v176:get().r, v176:get().g, v176:get().b, 0), color(v176:get().r, v176:get().g, v176:get().b, 255), color(v176:get().r, v176:get().g, v176:get().b, 0), color(v176:get().r, v176:get().g, v176:get().b, 255));
            render.gradient(vector(v542.x / 2 + v541, v542.y / 2 - 1), vector(v542.x / 2 + v540, v542.y / 2 + 0), color(v176:get().r, v176:get().g, v176:get().b, 0), color(v176:get().r, v176:get().g, v176:get().b, 255), color(v176:get().r, v176:get().g, v176:get().b, 0), color(v176:get().r, v176:get().g, v176:get().b, 255));
            render.gradient(vector(v542.x / 2 - 0, v542.y / 2 - v541), vector(v542.x / 2 + 1, v542.y / 2 - v540), color(v176:get().r, v176:get().g, v176:get().b, 0), color(v176:get().r, v176:get().g, v176:get().b, 0), color(v176:get().r, v176:get().g, v176:get().b, 255), color(v176:get().r, v176:get().g, v176:get().b, 255));
            render.gradient(vector(v542.x / 2 + 1, v542.y / 2 + v541), vector(v542.x / 2 - 0, v542.y / 2 + v540), color(v176:get().r, v176:get().g, v176:get().b, 0), color(v176:get().r, v176:get().g, v176:get().b, 0), color(v176:get().r, v176:get().g, v176:get().b, 255), color(v176:get().r, v176:get().g, v176:get().b, 255));
        end;
        return;
    end;
end;
rbot_automatic_teleport = function()
    -- upvalues: v152 (ref), v154 (ref), v41 (ref)
    if not v152:get() or not v154:get() or not v41.doubletap:get() or aa_system.Antiaim.enable_airexploit:get() then
        return;
    else
        local v545 = false;
        local v546 = entity.get_local_player();
        local v547 = v546:get_player_weapon();
        if v547 == nil then
            return;
        else
            local v548 = v547:get_classname() == "CKnife";
            local function v552(v549)
                -- upvalues: v546 (ref)
                local v550, v551 = utils.trace_bullet(v549, v549:get_hitbox_position(3), v546:get_hitbox_position(3));
                if v550 == 0 or v550 >= 20 or not v551.entity or v551.entity ~= v546 then
                    return false;
                else
                    return true;
                end;
            end;
            if not v548 then
                for _, v554 in pairs(entity.get_players(true)) do
                    if v554 ~= v546 and v552(v554) then
                        v545 = true;
                    end;
                end;
            end;
            local function v557(v555, v556)
                return bit.band(v555.m_fFlags, bit.lshift(1, v556)) ~= 0;
            end;
            if v545 and not v557(v546, 0) then
                rage.exploit:force_teleport();
            end;
            return;
        end;
    end;
end;
Angle_Vector = function(v558, v559)
    local v560 = nil;
    local v561 = nil;
    local v562 = nil;
    local v563 = nil;
    v560 = math.sin(math.rad(v558));
    v561 = math.sin(math.rad(v559));
    v562 = math.cos(math.rad(v558));
    v563 = math.cos(math.rad(v559));
    return vector(v562 * v563, v562 * v561, -v560);
end;
get_velocity = function(v564)
    if v564 == nil then
        return;
    else
        return (v564.m_vecVelocity:length());
    end;
end;
rbot_avoid_collisions = function(v565)
    -- upvalues: v191 (ref), v190 (ref), v192 (ref)
    if not v191:get() and not v190:get() then
        return;
    else
        local v566 = v192:get();
        local l_y_4 = render.camera_angles().y;
        local v568 = entity.get_local_player();
        local l_m_vecOrigin_0 = v568.m_vecOrigin;
        local l_huge_0 = math.huge;
        local l_huge_1 = math.huge;
        for v572 = 1, 180 do
            local l_x_2 = Angle_Vector(0, l_y_4 + v572 - 90).x;
            local l_y_5 = Angle_Vector(0, l_y_4 + v572 - 90).y;
            local _ = Angle_Vector(0, l_y_4).z;
            local v576 = l_m_vecOrigin_0.x + l_x_2 * 70;
            local v577 = l_m_vecOrigin_0.y + l_y_5 * 70;
            local v578 = l_m_vecOrigin_0.z + 60;
            local v579 = utils.trace_line(l_m_vecOrigin_0, vector(v576, v577, v578), nil, nil, 1);
            if l_m_vecOrigin_0:dist(v579.end_pos) < l_huge_0 then
                l_huge_0 = l_m_vecOrigin_0:dist(v579.end_pos);
                l_huge_1 = v572;
            end;
        end;
        if l_huge_0 < 25 + v566 and v565.in_jump and not v565.in_moveright and not v565.in_moveleft and not v565.in_back then
            forward_velo = math.abs(get_velocity(v568) * math.cos(math.rad(l_huge_1)));
            if math.abs(l_huge_1 - 90) < 40 then
                side_velo = get_velocity(v568) * math.sin(math.rad(l_huge_1)) * (25 + v566 - l_huge_0) / 15;
            else
                side_velo = get_velocity(v568) * math.sin(math.rad(l_huge_1));
            end;
            v565.forwardmove = forward_velo;
            if l_huge_1 >= 90 then
                v565.sidemove = side_velo;
            else
                v565.sidemove = side_velo * -1;
            end;
        end;
        return;
    end;
end;
events.createmove:set(function(v580)
    -- upvalues: v193 (ref), v190 (ref)
    if entity.get_local_player().m_MoveType == 9 and common.is_button_down(87) and v193:get() and v190:get() then
        v580.view_angles.y = math.floor(v580.view_angles.y + 0.5);
        v580.roll = 0;
        if v580.view_angles.x < 45 then
            v580.view_angles.x = 89;
            v580.in_moveright = 1;
            v580.in_moveleft = 0;
            v580.in_forward = 0;
            v580.in_back = 1;
            if v580.sidemove == 0 then
                v580.view_angles.y = v580.view_angles.y + 90;
            end;
            if v580.sidemove < 0 then
                v580.view_angles.y = v580.view_angles.y + 150;
            end;
            if v580.sidemove > 0 then
                v580.view_angles.y = v580.view_angles.y + 30;
            end;
        end;
    end;
end);
v164:set_callback(function()
    -- upvalues: v161 (ref), v164 (ref)
    cvar.r_aspectratio:float(v161:get() and v164:get() / 100 or 0);
end, false);
v163:set_callback(function()
    -- upvalues: v164 (ref), v163 (ref)
    v164:visibility(v163:get());
end, true);
v163:set_callback(function()
    -- upvalues: v163 (ref), v161 (ref), v164 (ref)
    cvar.r_aspectratio:float(v163:get() and v161:get() and v164:get() / 100 or 0);
end, true);
local function _()
    local v581 = entity.get_local_player();
    if entity.get_local_player() == nil then
        return;
    else
        local l_m_fFlags_2 = v581.m_fFlags;
        if bit.band(l_m_fFlags_2, 1) == 0 then
            return true;
        else
            return false;
        end;
    end;
end;
trace = function(v584)
    local v585 = math.pi * 2;
    local v586 = v585 / 8;
    local l_x_3 = entity.get_local_player().m_vecOrigin.x;
    local l_y_6 = entity.get_local_player().m_vecOrigin.y;
    local l_z_1 = entity.get_local_player().m_vecOrigin.z;
    for v590 = 0, v585, v586 do
        local v591 = 10 * math.cos(v590) + l_x_3;
        local v592 = 10 * math.sin(v590) + l_y_6;
        local v593 = utils.trace_line(vector(v591, v592, l_z_1), vector(v591, v592, l_z_1 - v584), entity.get_local_player());
        local l_fraction_1 = v593.fraction;
        local _ = v593.entity;
        if l_fraction_1 ~= 1 then
            return true;
        end;
    end;
    return false;
end;
no_fall_damagee = function(v596)
    -- upvalues: v194 (ref), v190 (ref)
    if not v194:get() and not v190:get() then
        return;
    else
        self = entity.get_local_player();
        if self == nil then
            return;
        else
            if self.m_vecVelocity.z >= -500 then
                no_fall_damage = false;
            elseif trace(15) then
                no_fall_damage = false;
            elseif trace(75) then
                no_fall_damage = true;
            end;
            if self.m_vecVelocity.z < -500 then
                if no_fall_damage then
                    v596.in_duck = 1;
                else
                    v596.in_duck = 0;
                end;
            end;
            return;
        end;
    end;
end;
ground_ticks = 1;
end_time = 0;
animation_breakerss = function()
    local v597 = entity.get_local_player();
    if aa_system.Antiaim.animation_breakers:get("Static legs in air") and aa_system.Antiaim.enable_animbreakers:get() then
        v597.m_flPoseParameter[6] = 1;
    end;
    if aa_system.Antiaim.animation_breakers:get("Moonwalk") and aa_system.Antiaim.enable_animbreakers:get() then
        v597.m_flPoseParameter[7] = -1;
        ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):set("Walking");
    end;
    if aa_system.Antiaim.animation_breakers:get("Pitch 0 on land") and aa_system.Antiaim.enable_animbreakers:get() then
        if bit.band(entity.get_local_player().m_fFlags, 1) == 1 then
            ground_ticks = ground_ticks + 1;
        else
            ground_ticks = 0;
            end_time = globals.curtime + 1;
        end;
        if ground_ticks > 1 and end_time > globals.curtime then
            v597.m_flPoseParameter[12] = 0.5;
        end;
    end;
end;
local v598 = 0;
local v599 = v145:get() and math.floor(globals.realtime) or 0;
loadinganim = function()
    -- upvalues: v599 (ref), v145 (ref), v598 (ref), v37 (ref)
    local v600 = render.screen_size();
    if math.floor(globals.realtime) - v599 > 8 or not v145:get() then
        return;
    else
        if globals.realtime - v599 > 5 then
            v598 = math.clamp(v598 - 1, 0, 50);
        else
            v598 = math.clamp(v598 + 1, 0, 50);
        end;
        render.blur(vector(0, 0), vector(v600.x, v600.y), 1, v598 * 5.5);
        render.texture(v37, vector(v600.x / 2 - 200, v600.y / 2 - 150), vector(350, 300), color(255, 255, 255, v598 * 5.5));
        return;
    end;
end;
events.createmove:set(function(v601)
    -- upvalues: v222 (ref)
    no_fall_damagee(v601);
    rbot_avoid_collisions(v601);
    v222.on_edge(v601);
    if aa_system.Antiaim.animation_breakers:get("Move lean") and aa_system.Antiaim.enable_animbreakers:get() then
        v601.animate_move_lean = true;
    else
        v601.animate_move_lean = false;
    end;
end);
events.post_update_clientside_animation:set(animation_breakerss);
on_paint = function()
    -- upvalues: v161 (ref), v162 (ref)
    if v161:get() then
        indicators_function();
    end;
    luatag();
    custom_scope();
    keybind_system();
    spectatorlist_system();
    watermark_system();
    if globals.realtime > 60 then
        loadinganim();
    end;
    visibility_function();
    get_state();
    if v162:get() and v161:get() then
        gsui();
    end;
end;
events.shutdown:set(function()
    -- upvalues: v308 (ref), v175 (ref), v2 (ref), v10 (ref)
    v308("\000", "\000");
    cvar.r_aspectratio:float(0);
    if globals.is_connected == false then
        panorama.loadstring("            var model = $.GetContextPanel().GetChild(0).FindChildInLayoutFile(\"JsMainmenu_Vanity\");\n            model.visible = true;\n            model.SetScene(\"resource/ui/econ/ItemModelPanelCharMainMenu.res\", \"models/player/custom_player/legacy/ctm_gign_variantB.mdl\", false)\n            model.PlaySequence(\"Emote_Bring_It_On\", true)\n        ")();
    end;
    local v602 = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay");
    if v175:get() then
        v602:override("Remove All");
    else
        v602:override();
    end;
    pcall(function()
        -- upvalues: v2 (ref)
        v2.DiscordRPC:Destroy();
    end);
    local l_cl_ragdoll_physics_enable_1 = cvar.cl_ragdoll_physics_enable;
    if l_cl_ragdoll_physics_enable_1 ~= 1 then
        l_cl_ragdoll_physics_enable_1:int(1);
    end;
    utils.console_exec("sv_maxunlag 0.200");
    local v604 = v10.C.GetForegroundWindow();
    v10.C.SetWindowTextA(v604, "Counter-Strike Global Offensive");
end);
events.createmove_run:set(function()
    rbot_automatic_teleport();
end);
events.render:set(function()
    -- upvalues: v1 (ref)
    local v605 = v1.text_animate("Debug ", -0.9, {
        color(255, 255, 255), 
        color(149, 184, 6)
    });
    ui.sidebar("F\a95b806FFS " .. v605:get_animated_text(), "\a95b806FF" .. ui.get_icon("bars-staggered"));
    v605:animate();
end);
events.player_death:set(v495);
events.render:set(on_paint);