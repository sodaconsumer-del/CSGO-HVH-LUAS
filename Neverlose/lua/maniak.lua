local _ = require("neverlose/discord_webhooks");
local l_system_0 = require("neverlose/drag_system");
local l_clipboard_0 = require("neverlose/clipboard");
local l_gradient_0 = require("neverlose/gradient");
local v4 = require("neverlose/sec-base64");
local l_smoothy_0 = require("neverlose/smoothy");
local l_exploits_0 = require("neverlose/exploits");
local l_mtools_0 = require("neverlose/mtools");
local l_timer_0 = require("neverlose/timer");
local l_pui_0 = require("neverlose/pui");
local l_ffi_0 = require("ffi");
_DEBUG = false;
_DEBUG = _DEBUG and common.get_username() == common.get_script_author();
local v11 = false;
l_ffi_0.cdef("    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n    typedef uintptr_t (__thiscall* GetClientEntityHandle_4242425_t)(void*, uintptr_t);\n    typedef int(__fastcall* clantag_t)(const char*, const char*);\n    typedef struct {\n        char pad_0000[20];\n        int m_nOrder;\n        int m_nSequence;\n        float m_flPrevCycle, m_flWeight, m_flWeightDeltaRate, m_flPlaybackRate, m_flCycle;\n        void *m_pOwner;\n        char pad_0038[4];\n    } animstate_layer_t;\n\n    bool CreateDirectoryA(const char* lpPathName, void* lpSecurityAttributes);\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n\n    typedef struct {\n        float x, y, z;\n    } Vector_t;\n\n    int VirtualProtect(void* lpAddress, unsigned long dwSize, unsigned long flNewProtect, unsigned long* lpflOldProtect);\n    void* VirtualAlloc(void* lpAddress, unsigned long dwSize, unsigned long flAllocationType, unsigned long flProtect);\n    int VirtualFree(void* lpAddress, unsigned long dwSize, unsigned long dwFreeType);\n\n    typedef struct {\n        unsigned short wYear, wMonth, wDayOfWeek, wDay, wHour, wMinute, wSecond, wMilliseconds;\n    } SYSTEMTIME, *LPSYSTEMTIME;\n    void GetSystemTime(LPSYSTEMTIME lpSystemTime);\n    void GetLocalTime(LPSYSTEMTIME lpSystemTime);\n\n    typedef struct {\n        float x;\n        float y;\n        float z;\n    } vector_t;\n\n    typedef struct\n    {\n        char    pad0[0x60]; // 0x00\n        void* pEntity; // 0x60\n        void* pActiveWeapon; // 0x64\n        void* pLastActiveWeapon; // 0x68\n        float        flLastUpdateTime; // 0x6C\n        int            iLastUpdateFrame; // 0x70\n        float        flLastUpdateIncrement; // 0x74\n        float        flEyeYaw; // 0x78\n        float        flEyePitch; // 0x7C\n        float        flGoalFeetYaw; // 0x80\n        float        flLastFeetYaw; // 0x84\n        float        flMoveYaw; // 0x88\n        float        flLastMoveYaw; // 0x8C // changes when moving/jumping/hitting ground\n        float        flLeanAmount; // 0x90\n        char    pad1[0x4]; // 0x94\n        float        flFeetCycle; // 0x98 0 to 1\n        float        flMoveWeight; // 0x9C 0 to 1\n        float        flMoveWeightSmoothed; // 0xA0\n        float        flDuckAmount; // 0xA4\n        float        flHitGroundCycle; // 0xA8\n        float        flRecrouchWeight; // 0xAC\n        vector_t        vecOrigin; // 0xB0\n        vector_t        vecLastOrigin;// 0xBC\n        vector_t        vecVelocity; // 0xC8\n        vector_t        vecVelocityNormalized; // 0xD4\n        vector_t        vecVelocityNormalizedNonZero; // 0xE0\n        vector_t        flVelocityLenght2D; // 0xEC\n        float        flJumpFallVelocity; // 0xF0\n        float        flSpeedNormalized; // 0xF4 // clamped velocity from 0 to 1\n        float m_flFeetSpeedForwardsOrSideWays; //0xF8\n        float m_flFeetSpeedUnknownForwardOrSideways; //0xFC\n        float        flRunningSpeed; // 0xF8\n        float        flDuckingSpeed; // 0xFC\n        float        flDurationMoving; // 0x100\n        float        flDurationStill; // 0x104\n        bool        bOnGround; // 0x108\n        bool        bHitGroundAnimation; // 0x109\n        char    pad2[0x2]; // 0x10A\n        float        flNextLowerBodyYawUpdateTime; // 0x10C\n        float        flDurationInAir; // 0x110\n        float        flLeftGroundHeight; // 0x114\n        float m_flStopToFullRunningFraction; //0x116\n        float        flHitGroundWeight; // 0x118 // from 0 to 1, is 1 when standing\n        float        flWalkToRunTransition; // 0x11C // from 0 to 1, doesnt change when walking or crouching, only running\n        char    pad3[0x4]; // 0x120\n        float        flAffectedFraction; // 0x124 // affected while jumping and running, or when just jumping, 0 to 1\n        char    pad4[0x208]; // 0x128\n        float        flMinBodyYaw; // 0x330\n        float        flMaxBodyYaw; // 0x334\n        float        flMinPitch; //0x338\n        float        flMaxPitch; // 0x33C\n        int            iAnimsetVersion; // 0x340\n    } CPlayer_Animation_State;\n\n    typedef struct\n    {\n        float   m_anim_time;\n        float   m_fade_out_time;\n        int     m_flags;\n        int     m_activity;\n        int     m_priority;\n        int     m_order;\n        int     m_sequence;\n        float   m_prev_cycle;\n        float   m_weight;\n        float   m_weight_delta_rate;\n        float   m_playback_rate;\n        float   m_cycle;\n        void* m_owner;\n        int     m_bits;\n    } C_AnimationLayer;\n\n    int MessageBoxA(void *w, const char *txt, const char *cap, int type);\n");
render.window = function(v12, v13, v14, v15, v16)
    if type(v15) == "table" then
        v15 = string.format(v15[1], unpack(v15[2]));
    end;
    if type(v12) == "table" then
        v12 = v12[1] - render.measure_text(1, nil, v15).x;
    end;
    if type(v13) == "table" then
        v13 = v13[1] - render.measure_text(1, nil, v15).y;
    end;
    local function v22(v17, v18, v19, v20, v21)
        if v20 then
            return render.rect(v17, v17 + v18, v19, v21);
        else
            return render.rect_outline(v17, v17 + v18, v19, 1, v21);
        end;
    end;
    local function v29(v23, v24, v25, v26, v27, v28)
        if v27 then
            return render.gradient(v23, v23 + v24, v25, v26, v25, v26, v28);
        else
            return render.gradient(v23, v23 + v24, v26, v25, v26, v25, v28);
        end;
    end;
    local v30 = v16 or {};
    v30.x = v30.x or 0;
    v30.y = v30.y or 0;
    v30.alpha = v30.alpha or 255;
    v30.style = v30.style or 1;
    v30.flags = v30.flags or nil;
    v30.centered_text = v30.centered_text or nil;
    v30.font = v30.font or 1;
    if v30.override_x then
        v12 = v30.override_x;
    end;
    if v30.override_y then
        v13 = v30.override_y;
    end;
    local v31 = v30.alpha or 255;
    local v32 = render.measure_text(1, nil, v15);
    local v33 = 6 + v32.x + v30.x;
    local v34 = v32.y + 3 + v30.y;
    if v30.override_w then
        v33 = v30.override_w;
    end;
    if v30.override_h then
        v34 = v30.override_h;
    end;
    if v30.style == 1 then
        v22(vector(v12 - 6, v13 - 6), vector(v33 + 13, v34 + 14), color(0, 0, 0, v31), true);
        v22(vector(v12 - 6, v13 - 6), vector(v33 + 11, v34 + 12), color(34, 34, 34, v31), true);
        v22(vector(v12 + 1, v13), vector(v33, v34 + 1), color(0, 0, 0, v31), true);
        v22(vector(v12 - 1, v13 - 1), vector(v33 + 3, v34 + 3), color(56, 56, 56, v31));
        v22(vector(v12 - 5, v13 - 5), vector(v33 + 11, v34 + 12), color(56, 56, 56, v31));
        if not v14 then
            v29(vector(v12 + 2, v13 + 1), vector(v33 / 2 - 1, 1), color(59, 175, 222, v31), color(202, 70, 205, v31), true);
            v29(vector(v12 + 1 + v33 / 2, v13 + 1), vector(v33 / 2 - 1, 1), color(202, 70, 205, v31), color(201, 227, 58, v31), true);
            v29(vector(v12 + 1, v13 + 2), vector(v33 / 2 - 1, 1), color(59, 175, 222, math.clamp(v31, 0, 130)), color(202, 70, 205, math.clamp(v31, 0, 130)), true);
            v29(vector(v12 + 1 + v33 / 2, v13 + 2), vector(v33 / 2 - 1, 1), color(202, 70, 205, math.clamp(v31, 0, 130)), color(201, 227, 58, math.clamp(v31, 0, 130)), true);
        else
            v22(vector(v12 + 1, v13 + 1), vector(v33 - 1, 1), color(v14.r, v14.g, v14.b, v31), true);
        end;
    else
        v22(vector(v12, v13), vector(v33 + 3, 2), color(v14.r, v14.g, v14.b, math.clamp(v30.alpha, 0, 255)));
        v22(vector(v12, v13 + 2), vector(v33 + 3, v34 + 5), color(17, 17, 17, math.clamp(v30.alpha, 0, v14.a)), true);
    end;
    if v30.centered_text then
        local v35 = render.measure_text(v30.font, nil, v15);
        v12 = v12 - v35.x / 2 + v33 / 2;
        v13 = v13 - v35.y / 2 + v34 / 2;
    end;
    if v30.override_text_x then
        v12 = v30.override_text_x;
    end;
    if v30.override_text_y then
        v13 = v30.override_text_y;
    end;
    if v30.style == 2 then
        v12 = v12 + 1;
        v13 = v13 + 3;
    end;
    render.text(v30.font, vector(v12 + 4, v13 + 2), color(255, 255, 255, v31), v30.flags, v15);
end;
local v38 = {
    data = {}, 
    hitgroups = {
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
    reasons = {
        ["backtrack failure"] = "backtrack failure", 
        ["prediction error"] = "prediction error", 
        misprediction = "prediction error", 
        spread = "spread", 
        correction = "resolver", 
        death = "death", 
        ["player death"] = "player death", 
        ["unregistered shot"] = "unregistered shot", 
        ["damage rejection"] = "damage rejection"
    }, 
    get_desync = function(v36)
        valid = v36 and v36:is_alive() and true or false;
        if not valid then
            return;
        else
            local v37 = 60;
            return -math.min(v37, math.max(v36.m_flPoseParameter[11] * 120 - v37));
        end;
    end
};
local v39 = "Stable";
local v40 = common.get_username();
local v41 = ui.get_style("Link Active");
v39 = (not (v40 ~= "Mobby") or v11 == true) and "Dev" or "Stable";
local _ = {};
local _ = {};
local v44 = panorama.loadstring("return MyPersonaAPI.GetName()")();
local _ = l_mtools_0.FileSystem.CreateDir("nl\\Maniak");
local v46 = {
    states = {
        builder = {
            [1] = "Global", 
            [2] = "Standing", 
            [3] = "Run", 
            [4] = "Slow Walk", 
            [5] = "Crouch", 
            [6] = "Crouch Moving", 
            [7] = "Air", 
            [8] = "Crouch In Air", 
            [9] = "Peek Standing", 
            [10] = "Peek Moving", 
            [11] = "Safehead"
        }, 
        defensive = {
            [1] = "Global", 
            [2] = "Standing", 
            [3] = "Run", 
            [4] = "Slow Walk", 
            [5] = "Crouch", 
            [6] = "Crouch Moving", 
            [7] = "Air", 
            [8] = "Crouch In Air", 
            [9] = "Peek Standing", 
            [10] = "Peek Moving", 
            [11] = "Safehead"
        }, 
        bs_short = {
            [1] = "G", 
            [2] = "A", 
            [3] = "NS"
        }, 
        safehead_states = {
            [1] = "High Ground", 
            [2] = "Low Ground"
        }, 
        aimtools_states = {
            [1] = "High Ground", 
            [2] = "Same Height", 
            [3] = "Low Ground", 
            [4] = "Air"
        }
    }, 
    phase = {
        [1] = "Phase 1", 
        [2] = "Phase 2"
    }, 
    lp = entity.get_local_player()
};
l_mtools_0.Network.Download("https://fontsforyou.com/downloads/99851-smallestpixel7", "nl\\Maniak\\pixel.ttf", true, 97);
local v47 = {
    hex = v41:to_hex() or color(109, 58, 184):to_hex(), 
    rgb = color(v41.r, v41.g, v41.b)
};
l_pui_0.macros.p = "\a" .. v47.hex .. "\226\128\162\r  ";
math.lerp = function(v48, v49, v50)
    return v48 + (v49 - v48) * globals.frametime * v50;
end;
time_to_ticks = function(v51)
    return math.floor(0.5 + v51 / globals.tickinterval);
end;
render.gradient_box = function(v52, v53, v54, v55, v56, v57)
    render.rect_outline(vector(v52 - 6, v53 - 6), vector(v52 + v54 + 6, v53 + v55 + 6), color(30, 30, 30, v56.a), 1);
    render.rect_outline(vector(v52 - 5, v53 - 5), vector(v52 + v54 + 5, v53 + v55 + 5), color(60, 60, 60, v56.a), 1);
    render.rect_outline(vector(v52 - 4, v53 - 4), vector(v52 + v54 + 4, v53 + v55 + 4), color(40, 40, 40, v56.a), 1);
    render.rect_outline(vector(v52 - 3, v53 - 3), vector(v52 + v54 + 3, v53 + v55 + 3), color(40, 40, 40, v56.a), 3);
    render.rect_outline(vector(v52 - 1, v53 - 1), vector(v52 + v54 + 1, v53 + v55 + 1), color(60, 60, 60, v56.a), 2);
    render.rect(vector(v52, v53), vector(v52 + v54, v53 + v55), color(20, 20, 20, v56.a));
    if not v57 then
        render.gradient(vector(v52, v53), vector(v52 + v54 / 2, v53 + 1), color(55, 177, 218, v56.a), color(201, 84, 205, v56.a), color(55, 177, 218, v56.a), color(201, 84, 205, v56.a));
        render.gradient(vector(v52 + v54 / 2, v53), vector(v52 + v54, v53 + 1), color(201, 84, 205, v56.a), color(204, 207, 53, v56.a), color(201, 84, 205, v56.a), color(204, 207, 53, v56.a));
    else
        render.rect(vector(v52, v53), vector(v52 + v54, v53 + 1), v56);
    end;
end;
local v77 = new_class():struct("database")({
    data = {}, 
    new = function(v58, v59, v60, v61, v62, v63)
        for v64 = 7, 2, -1 do
            v58.database.data[v64] = v58.database.data[v64 - 1];
        end;
        v58.database.data[1] = {
            time = 3, 
            def_time = 3, 
            draw = v59, 
            red = v60.r, 
            blue = v60.b, 
            green = v60.g, 
            style = v61 or false, 
            icon = v62 or false, 
            colored_icon = v63 or false
        };
    end
}):struct("handler")({
    paint = function(v65)
        local v66 = {
            x = render.screen_size().x, 
            y = render.screen_size().y
        };
        local v67 = 5;
        local l_data_0 = v65.database.data;
        for v69 = #l_data_0, 1, -1 do
            v65.database.data[v69].time = v65.database.data[v69].time - globals.frametime;
            local v70 = 200;
            local v71 = 0;
            local v72 = l_data_0[v69];
            if v72.time < 0 then
                table.remove(v65.database.data, v69);
            else
                local v73 = v72.def_time - v72.time;
                local v74 = v73 > 1 and 1 or v73;
                if v72.time < 0.5 or v74 < 0.5 then
                    v71 = (v74 < 1 and v74 or v72.time) / 0.5;
                    v70 = v71 * 200;
                    if v71 < 0.2 then
                        v67 = v67 + 15 * (1 - v71 / 0.2);
                    end;
                end;
                local v75 = {
                    x = render.measure_text(1, nil, v72.draw).x, 
                    y = render.measure_text(1, nil, v72.draw).y
                };
                local v76 = {
                    x = v66.x / 2 - v75.x / 2 + 3, 
                    y = v66.y - v66.y / 100 * 17.4 + v67
                };
                render.gradient_box(v76.x, v76.y - 17 + v75.y / 2, v75.x + 7, 21, color(v72.red, v72.green, v72.blue, v70 + 55), v72.style);
                render.gradient_box(v66.x / 2 + v75.x / 2 + 28, v76.y - 17 + v75.y / 2, 20, 21, color(v72.red, v72.green, v72.blue, v70 + 55), v72.style);
                render.text(1, vector(v76.x + 4, v76.y - 12 + v75.y / 2), color(255, 255, 255, v70 + 55), nil, v72.draw);
                render.circle_outline(vector(v76.x + v75.x + 35, v76.y + v75.y / 2 - 6), color(v72.red, v72.green, v72.blue, v70 + 55), 7, 0, math.clamp(v72.time, 0, 1), 3);
                if v72.icon then
                    render.gradient_box(v76.x - 58, v76.y - 17 + v75.y / 2, 41, 21, color(v72.red, v72.green, v72.blue, v70 + 55), v72.style);
                    render.texture(v72.icon, vector(v76.x - 55, v76.y - 12 + v75.y / 2), vector(35, 14), v72.colored_icon and color(v72.red, v72.green, v72.blue, v70 + 55) or color(255, 255, 255, v70 + 55));
                end;
                v67 = v67 - 50;
            end;
        end;
    end
});
local v78 = {};
local function v86()
    -- upvalues: v78 (ref)
    local v79 = {
        x = render.screen_size().x, 
        y = render.screen_size().y
    };
    local v80 = 0;
    local v81 = v79.x / 2;
    local v82 = v79.y / 1.4;
    for v83, v84 in ipairs(v78) do
        if globals.curtime - v84[3] < 4 and (#v78 <= 5 or v83 >= #v78 - 5) then
            v84[2] = math.lerp(v84[2], 255, 4);
        else
            v84[2] = math.lerp(v84[2], 0, 4);
        end;
        v80 = v80 - 20 * (v84[2] / 255);
        local v85 = render.measure_text(1, s, v84[1]);
        render.shadow(vector(v81 + 13 - v85.x / 2, v82 - v80 + v85.y - 5), vector(v81 + 3 + v85.x / 2, v82 - v80 + v85.y - 5), color(255, 255, 255, v84[2]), 35, -1, 0);
        render.text(1, vector(v81 + 9 - v85.x / 2, v82 - v80), color(255, 255, 255, v84[2] / 255 * 255), "od", v84[1]);
        if v84[2] < 0.1 or not entity.get_local_player() then
            table.remove(v78, v83);
        end;
    end;
end;
render.log = function(v87, v88)
    -- upvalues: v78 (ref)
    table.insert(v78, {
        [1] = nil, 
        [2] = 0, 
        [1] = v87, 
        [3] = globals.curtime, 
        [4] = v88
    });
end;
local v123 = (function()
    local v89 = {};
    local v90 = {};
    local v91 = render.screen_size();
    local v92 = render.load_font("verdana", 30, "adb");
    local function _(v93, v94, v95)
        return v93 / v94 * 100 / 100 * v95;
    end;
    local function v102(v97, v98, v99, v100, v101)
        if not v101 then
            render.rect(vector(v97.x, v97.y), vector(v97.x + v98.x, v97.y + v98.y), v99, v100);
        else
            render.rect_outline(vector(v97.x, v97.y), vector(v97.x + v98.x, v97.y + v98.y), v99, v101, v100);
        end;
    end;
    local function v109(v103, v104, v105, v106, v107, v108)
        render.shadow(v103, v103 + v104, v105, v106, v107, v108);
    end;
    v89.new = function(v110, v111, v112)
        -- upvalues: v90 (ref)
        for v113 = 7, 2, -1 do
            v90[v113] = v90[v113 - 1];
        end;
        v90[1] = {
            def_time = 5, 
            time = 5, 
            text = v111, 
            color = v112, 
            icon = v110
        };
    end;
    events.render:set(function()
        -- upvalues: v90 (ref), v102 (ref), v91 (ref), v109 (ref), v92 (ref)
        local v114 = -30;
        local l_v90_0 = v90;
        for v116 = #l_v90_0, 1, -1 do
            v90[v116].time = v90[v116].time - globals.frametime;
            local v117 = 255;
            local v118 = 0;
            local v119 = l_v90_0[v116];
            if v119.time < 0 then
                table.remove(v90, v116);
            else
                local v120 = v119.def_time - v119.time;
                local v121 = v120 > 1 and 1 or v120;
                if v119.time < 0.5 or v121 < 0.5 then
                    v118 = (v121 < 1 and v121 or v119.time) / 0.5;
                    v117 = v118 * 255;
                    if v118 < 0.2 then
                        v114 = v114 + 15 * (1 - v118 / 0.2);
                    end;
                end;
                local v122 = render.measure_text(1, nil, v119.text);
                v102(vector(v91.x - v122.x - 72 + v114, v91.y - v116 * 70 - 10), vector(60 + v122.x + 20, 60), color(24, 24, 24, v117), 15);
                v102(vector(v91.x - v122.x - 72 + v114, v91.y - v116 * 70 - 10), vector(60 + v122.x + 20, 60), color(v119.color.r, v119.color.g, v119.color.b, v117), 15, 1);
                v102(vector(v91.x - v122.x - 72 + v114, v91.y - v116 * 70 - 10), vector(60, 60), color(30, 30, 30, v117), 15);
                v109(vector(v91.x - v122.x - 72 + v114, v91.y - v116 * 70 - 10), vector(60, 60), color(30, 30, 30, v117), 60, 0, 15);
                render.text(1, vector(v91.x - v122.x - 5 + v114, v91.y + v122.y - v116 * 70), color(255, 255, 255, v117), nil, v119.text);
                render.text(v92, vector(v91.x - v122.x - 40 + v114, v91.y + 20 - v116 * 70), color(255, 255, 255, v117), "c", "\a" .. v119.color:to_hex() .. ui.get_icon(v119.icon));
                v114 = -30;
            end;
        end;
    end);
    return v89;
end)();
local v138 = {
    speed = 0.07, 
    database = {}, 
    lerp = function(v124, v125, v126)
        if v124 == v125 then
            return v125;
        else
            v126 = v126 * (globals.frametime * 170);
            local v127 = v124 + (v125 - v124) * v126;
            if math.abs(v127 - v125) < 0.01 then
                return v125;
            else
                return v127;
            end;
        end;
    end, 
    color_lerp = function(v128, v129, v130)
        return v128:lerp(v129, v130 * (globals.frametime * 100));
    end, 
    new = function(v131, v132, v133, v134, v135)
        if not v134 then
            v134 = v131.speed;
        end;
        local v136 = type(v133) ~= "number";
        if v131.database[v132] == nil then
            v131.database[v132] = v135 and v135 or v136 and color(255, 255, 255, 255) or 0;
        end;
        local v137 = v136 and v131.color_lerp or v131.lerp;
        v131.database[v132] = v137(v131.database[v132], v133, v134);
        return v131.database[v132];
    end
};
local v185 = {
    clamp2 = function(_, v140, v141, v142)
        return v140 < v141 and v141 or v142 < v140 and v142 or v140;
    end, 
    pulsate = function(v143, v144)
        return v143.clamp2(math.sin(math.abs(math.pi + globals.realtime % (-math.pi * 2))) * v144, 75, v144);
    end, 
    jitter_side = function(_, v146)
        local _ = 0;
        local v148 = 0;
        local l_curtime_0 = globals.curtime;
        v148 = math.ceil(l_curtime_0 * v146) % 2;
        math.clamp(v148, 0, 1);
        return v148 > 0.5 and 1 or -1;
    end, 
    print = function(_, ...)
        -- upvalues: v47 (ref)
        local v151 = {
            ...
        };
        local v152 = "\a" .. v47.hex .. "maniak \226\128\162";
        for _, v154 in ipairs(v151) do
            v152 = v152 .. "\aDEFAULT " .. string.gsub(tostring(v154), "\b", "\a" .. v47.hex);
        end;
        print_dev(v152);
        print_raw(v152);
    end, 
    lerp = function(_, v156, v157, v158)
        return v156 + (v157 - v156) * (v158 / 100);
    end, 
    lerpx = function(_, v160, v161, v162)
        return v161 * (1 - v160) + v162 * v160;
    end, 
    upper_to_lower = function(_, v164)
        return v164:sub(1, 1):upper() .. v164:sub(2):lower();
    end, 
    is_scoped = function(_)
        if not entity.get_local_player() or not entity.get_local_player():is_alive() then
            return;
        else
            return entity.get_local_player().m_bIsScoped;
        end;
    end, 
    animations = (function()
        return {
            data = {}, 
            clamp = function(_, v167, v168, v169)
                return math.min(v169, math.max(v168, v167));
            end, 
            animate = function(v170, v171, v172, v173)
                if not v170.data[v171] then
                    v170.data[v171] = 0;
                end;
                if not v173 then
                    v173 = 4;
                end;
                local v174 = globals.frametime * v173 * (v172 and -1 or 1);
                v170.data[v171] = v170:clamp(v170.data[v171] + v174, 0, 1);
                return v170.data[v171];
            end
        };
    end)(), 
    ternary = function(v175, v176, v177)
        if v175 then
            return v176;
        else
            return v177;
        end;
    end, 
    ac = function(v178, v179)
        if not v179 then
            v179 = "failed to load local database.";
        end;
        local l_status_0, _ = pcall(v178);
        if not l_status_0 then
            return error("Something went wrong... " .. v179);
        else
            return;
        end;
    end, 
    lerp = function(v182, v183, v184)
        return v183 * (1 - v182) + v184 * v182;
    end
};
local function v186(v187, v188, v189)
    -- upvalues: v186 (ref)
    if type(v187) == "table" then
        return v186(v187[1], v188[1], v189), v186(v187[2], v188[2], v189), v186(v187[3], v188[3], v189), v186(v187[4], v188[4], v189);
    else
        local v190 = v188 - v187;
        if type(v190) == "number" and math.abs(v190) < 0.005 then
            return v188;
        else
            return v190 * v189 + v187;
        end;
    end;
end;
local v191 = l_smoothy_0.new({
    vel_mod = 0, 
    alpha = 0
});
local _ = l_smoothy_0.new({
    lc_mod = 0, 
    alpha = 0
});
local v193 = false;
local v194 = false;
l_timer_0.create(4000, true, function()
    -- upvalues: v193 (ref)
    v193 = not v193;
end);
l_timer_0.create(5700, function()
    -- upvalues: v194 (ref)
    v194 = true;
end);
local v195 = l_smoothy_0.new(1);
local v196 = l_smoothy_0.new(10);
local v197 = l_smoothy_0.new(0);
local v198 = l_smoothy_0.new(0);
local _ = render.load_font("Verdana", 50, "bad");
local v200 = "https://raw.githubusercontent.com/M0bby/maniak_temp/refs/heads/main/logo2.png";
local _ = panorama.SteamOverlayAPI.OpenExternalBrowserURL;
local v202 = render.load_image(network.get(v200), vector(512, 512));
local _ = render.load_image(network.get(v200), vector(25, 25));
local v204 = render.load_image(network.get(v200), vector(250, 250));
local v205 = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg", vector(100, 100));
events.render:set(function()
    -- upvalues: v194 (ref), v195 (ref), v193 (ref), v196 (ref), v198 (ref), v197 (ref), v202 (ref)
    if v194 then
        return;
    else
        local v206 = render.screen_size();
        local v207 = v195(0.7, v193 and 400 or 0);
        local v208 = v196(0.7, v193 and 255 or 0);
        local v209 = v198(0.7, v193 and 150 or 0);
        local _ = v197(0.7, not v193 and -150 or 96);
        render.rect(vector(0, 0), v206, color(17, 17, 17, v209));
        render.rect_outline(vector(0, 0), v206, color(255, 255, 255, v209));
        render.texture(v202, vector(v206.x / 2 - math.clamp(v207, 0, 350) / 2, v206.y / 2 - math.clamp(v207, 0, 350) / 2), vector(math.clamp(v207, 0, 350), math.clamp(v207, 0, 350)), color(255, 255, 255, v208));
        return;
    end;
end);
local v211 = {
    verdana = render.load_font("Verdana", 12, "a"), 
    verdana_18 = render.load_font("verdana", 18, "a"), 
    verdana_24 = render.load_font("verdana", 24, "a"), 
    verdana_blind = render.load_font("verdana", 30, "a"), 
    pixel = render.load_font("nl\\Maniak\\pixel.ttf", 11, "a"), 
    calibri = render.load_font("Calibri Bold", vector(25, 22, -1), "ad"), 
    pixel_15 = render.load_font("nl\\Maniak\\pixel.ttf", 11, "ad"), 
    calibri_10 = render.load_font("calibri", 10, "oa"), 
    calibri_10_b = render.load_font("calibri", 10, "oba"), 
    calibri_12_b = render.load_font("calibri bold", 12, "da")
};
local function v221(v212, v213, v214, v215, v216, v217)
    -- upvalues: v211 (ref), v205 (ref)
    local v218 = render.screen_size().x / 100 + 9;
    local v219 = render.screen_size().y / 1.47;
    local v220 = render.measure_text(v211.calibri, nil, v212);
    render.gradient(vector(v218 / 1.9, v219 + v213), vector(v218 / 1.9 + v220.x / 2 + 5, v219 + v213 + v220.y + 11), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50));
    render.gradient(vector(v218 / 1.9 + v220.x / 2 + 5, v219 + v213), vector(v218 / 1.9 + v220.x + 40, v219 + v213 + v220.y + 11), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0));
    render.text(v211.calibri, vector(v218, v219 + 8 + v213), v214, nil, v212);
    if v217 == true then
        render.texture(v205, vector(v218, v219 + v213 + 2), vector(32, 30), v214, "f", 1);
    end;
    if v215 and v216 then
        render.circle_outline(vector(v218 + v220.x + 18, v219 + v213 + v220.y / 2 + 8), color(0, 0, 0, 255), 10, 1, 10, 5);
        render.circle_outline(vector(v218 + v220.x + 18, v219 + v213 + v220.y / 2 + 8), v215, 9, 1, v216, 3);
    end;
end;
local v222 = {
    weapon_actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"), 
    dmg_ref = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    mindmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Global", "Body Aim")
};
local _ = ui.find("Aimbot", "Anti Aim", "Angles");
local v224 = {
    enable = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    yaw_mod = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    Freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    Extended_Angles = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
    lag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    hsopt = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
};
local v225 = {
    enable = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    yaw_add = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    body_left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    body_right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    invert = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    fake_op = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden")
};
local function v232(...)
    local v226 = {
        ...
    };
    local v227 = "";
    for _, v229 in pairs(v226) do
        local v230 = v229[1];
        local v231 = "";
        if v230:find("icon_") then
            v230 = ui.get_icon(v230:gsub("icon_", ""));
        end;
        if not v230 then
            v230 = "nil";
        end;
        if v229[2] == nil then
            v229[2] = "DEFAULT";
        end;
        if type(v229[2]) == "userdata" then
            v229[2] = v229[2]:to_hex();
            v231 = ("\a%s"):format(v229[2]);
        else
            v231 = "\a" .. v229[2];
        end;
        v227 = v227 .. v231 .. v230;
    end;
    return v227;
end;
local function _(v233, ...)
    return string.format(v233, unpack({
        ...
    }));
end;
local v235 = {
    fill = 0, 
    on_plant_time = 0, 
    planting = false, 
    planting_site = ""
};
local v236 = "maniak";
local v237 = "neverlose";
local v238 = db.maniak_configs_reworked or {};
v238.loaded_cfg = v238.loaded_config or "unknown";
v238.local_cfg = v238.local_cfg or {
    [1] = "None"
};
local v239 = {
    [1] = "\226\152\160 ", 
    [2] = "\226\152\160M", 
    [3] = "\226\152\160Ma", 
    [4] = "\226\152\160Man", 
    [5] = "\226\152\160Mani", 
    [6] = "\226\152\160Mania", 
    [7] = "\226\152\160Maniak", 
    [8] = "\226\152\160Maniak.", 
    [9] = "\226\152\160Maniak.l", 
    [10] = "\226\152\160Maniak.lu", 
    [11] = "\226\152\160Maniak.lua", 
    [12] = "\226\152\160Maniak.lua", 
    [13] = "\226\152\160Maniak.lua", 
    [14] = "\226\152\160Maniak.lua", 
    [15] = "\226\152\160Maniak.lu", 
    [16] = "\226\152\160Maniak.l", 
    [17] = "\226\152\160Maniak.", 
    [18] = "\226\152\160Maniak", 
    [19] = "\226\152\160Mania", 
    [20] = "\226\152\160Mani", 
    [21] = "\226\152\160Man", 
    [22] = "\226\152\160Ma", 
    [23] = "\226\152\160M", 
    [24] = "\226\152\160 "
};
local v240 = {
    [1] = "\240\157\144\140\240\157\144\154\240\157\144\167\240\157\144\162\240\157\144\154\240\157\144\164.\240\157\144\165\240\157\144\174\240\157\144\154, \240\157\144\173\240\157\144\161\240\157\144\158 \240\157\144\168\240\157\144\167\240\157\144\165\240\157\144\178 \240\157\144\160\240\157\144\168\240\157\144\168\240\157\144\157 \240\157\144\165\240\157\144\174\240\157\144\154 ", 
    [2] = "\240\157\153\136\240\157\153\150\240\157\153\163\240\157\153\158\240\157\153\150\240\157\153\160.\240\157\153\161\240\157\153\170\240\157\153\150, \240\157\153\159\240\157\153\170\240\157\153\168\240\157\153\169 \240\157\153\169\240\157\153\157\240\157\153\154 \240\157\153\151\240\157\153\154\240\157\153\168\240\157\153\169!", 
    [3] = "16-0 \240\157\147\148-\240\157\147\169 \240\157\147\156\240\157\147\144\240\157\147\159 by \240\157\144\140\240\157\144\154\240\157\144\167\240\157\144\162\240\157\144\154\240\157\144\164.\240\157\144\165\240\157\144\174\240\157\144\154 ", 
    [4] = "\240\157\149\132\240\157\149\146\240\157\149\159\240\157\149\154\240\157\149\146\240\157\149\156.\240\157\149\157\240\157\149\166\240\157\149\146, \240\157\149\160\240\157\149\168\240\157\149\159\240\157\149\164 \240\157\149\158\240\157\149\150 \240\157\149\146\240\157\149\159\240\157\149\149 \240\157\149\146\240\157\149\157\240\157\149\157", 
    [5] = "\240\157\149\132\240\157\149\146\240\157\149\159\240\157\149\154\240\157\149\146\240\157\149\156.\240\157\149\157\240\157\149\166\240\157\149\146>\240\157\149\146\240\157\149\159\240\157\149\170 \240\157\149\160\240\157\149\165\240\157\149\153\240\157\149\150\240\157\149\163 \240\157\149\157\240\157\149\166\240\157\149\146", 
    [6] = "\240\157\151\167\240\157\151\181\240\157\151\178 \240\157\151\188\240\157\151\187\240\157\151\185\240\157\152\134 \240\157\151\180\240\157\151\188\240\157\151\188\240\157\151\177 \240\157\151\185\240\157\152\130\240\157\151\174, Maniak.lua ", 
    [7] = "\240\157\151\167\240\157\151\181\240\157\151\182\240\157\152\128 \240\157\151\184\240\157\151\182\240\157\151\185\240\157\151\185 \240\157\152\132\240\157\151\174\240\157\152\128 \240\157\152\128\240\157\151\189\240\157\151\188\240\157\151\187\240\157\152\128\240\157\151\188\240\157\151\191\240\157\151\178\240\157\151\177 \240\157\151\175\240\157\152\134 Maniak.lua", 
    [8] = "\240\157\148\190\240\157\149\150\240\157\149\165 \240\157\148\190\240\157\149\160\240\157\149\160\240\157\149\149. \240\157\148\190\240\157\149\150\240\157\149\165 \240\157\149\132\240\157\149\146\240\157\149\159\240\157\149\154\240\157\149\146\240\157\149\156.\240\157\149\157\240\157\149\166\240\157\149\146", 
    [9] = "\240\157\151\149\240\157\151\185\240\157\151\188\240\157\151\176\240\157\151\184 \240\157\151\181\240\157\151\174\240\157\152\129\240\157\151\178\240\157\151\191\240\157\152\128 \240\157\151\181\240\157\152\130\240\157\151\181? \240\157\151\161\240\157\151\174\240\157\151\181. You are gonna see me win bitch", 
    [10] = "\226\132\157\240\157\149\150\240\157\149\164\240\157\149\165 \240\157\149\154\240\157\149\159 \240\157\149\161\240\157\149\154\240\157\149\164\240\157\149\164", 
    [11] = "\240\157\148\190 \240\157\149\134 \240\157\148\187 \240\157\149\132 \240\157\149\134 \240\157\148\187 \240\157\148\188", 
    [12] = "\240\157\149\139\240\157\149\163\240\157\149\170 \240\157\149\165\240\157\149\160 \240\157\149\159\240\157\149\160\240\157\149\165 \240\157\149\158\240\157\149\154\240\157\149\164\240\157\149\164 \240\157\149\158\240\157\149\150 \240\157\149\159\240\157\149\150\240\157\149\169\240\157\149\165 \240\157\149\165\240\157\149\154\240\157\149\158\240\157\149\150", 
    [13] = "\240\157\149\155\240\157\149\166\240\157\149\164\240\157\149\165 \240\157\149\166\240\157\149\164\240\157\149\150 \240\157\149\158\240\157\149\146\240\157\149\159\240\157\149\154\240\157\149\146\240\157\149\156", 
    [14] = "\240\157\150\139\240\157\150\138\240\157\150\138\240\157\150\145 \240\157\150\153\240\157\150\141\240\157\150\138 \240\157\150\149\240\157\150\148\240\157\150\156\240\157\150\138\240\157\150\151 \240\157\150\148\240\157\150\139 \240\157\150\146\240\157\150\134\240\157\150\147\240\157\150\142\240\157\150\134\240\157\150\144.\240\157\150\145\240\157\150\154\240\157\150\134"
};
local v241 = {
    [1] = "\240\157\149\149\240\157\149\154\240\157\149\164\240\157\149\148\240\157\149\160\240\157\149\163\240\157\149\149.\240\157\149\152\240\157\149\152/\240\157\149\158\240\157\149\146\240\157\149\159\240\157\149\154\240\157\149\146\240\157\149\156", 
    [2] = ".gg/maniak", 
    [3] = "discord.gg/maniak", 
    [4] = ".\240\157\149\152\240\157\149\152/\240\157\149\158\240\157\149\146\240\157\149\159\240\157\149\154\240\157\149\146\240\157\149\156"
};
local v242 = nil;
local v243 = false;
local v244 = {};
local v245 = {};
local v246 = {};
local v247 = {};
local v248 = {};
local v249 = {};
local v250 = {};
local v251 = {};
local v252 = {};
local v253 = {};
local v254 = {};
local v255 = {
    home_image = l_pui_0.create("\a" .. v47.hex .. "\f<house>  ", "", 1), 
    home_profile = l_pui_0.create("\a" .. v47.hex .. "\f<house>  ", "", 1), 
    home_cfg = l_pui_0.create("\a" .. v47.hex .. "\f<house>  ", "\n\b\r\b", 2), 
    home_cfg_create = l_pui_0.create("\a" .. v47.hex .. "\f<house>  ", "\b\v\n", 2), 
    antiaim_main = l_pui_0.create("\a" .. v47.hex .. "\f<layer-group>  ", "", 1), 
    antiaim_tweaks = l_pui_0.create("\a" .. v47.hex .. "\f<layer-group>  ", "\v\v", 2), 
    antiaim_builder = l_pui_0.create("\a" .. v47.hex .. "\f<layer-group>  ", "\b\b", 2), 
    antiaim_defensive = l_pui_0.create("\a" .. v47.hex .. "\f<layer-group>  ", "\r", 2), 
    antiaim_builder_state = l_pui_0.create("\a" .. v47.hex .. "\f<layer-group>  ", "\n", 1), 
    rage_main = l_pui_0.create("\a" .. v47.hex .. "\f<layer-group>  ", "\n\n", 2), 
    visuals_main = l_pui_0.create("\a" .. v47.hex .. "\f<gears>  ", "\n", 1), 
    misc_main = l_pui_0.create("\a" .. v47.hex .. "\f<gears>  ", "\v\v", 2), 
    widgets_main = l_pui_0.create("\a" .. v47.hex .. "\f<gears>  ", "\v\v\n", 2), 
    style_tab = l_pui_0.create("\a" .. v47.hex .. "\f<gears>  ", "\v\v\n\n", 1)
};
v250.keybinds_x = v255.misc_main:slider("", 1, render.screen_size().x, render.screen_size().x / 2 - 250):visibility(false);
v250.keybinds_y = v255.misc_main:slider("", 1, render.screen_size().y, render.screen_size().y / 2 - 50):visibility(false);
v250.exploits_x = v255.misc_main:slider("", 1, render.screen_size().x, render.screen_size().x / 2 - 250):visibility(false);
v250.exploits_y = v255.misc_main:slider("", 1, render.screen_size().y, render.screen_size().y / 2 - 50):visibility(false);
v250.slow_x = v255.misc_main:slider("", 1, render.screen_size().x, render.screen_size().x / 2 - 250):visibility(false);
v250.slow_y = v255.misc_main:slider("", 1, render.screen_size().y, render.screen_size().y / 2 - 50):visibility(false);
v250.lc_x = v255.misc_main:slider("", 1, render.screen_size().x, render.screen_size().x / 2 - 250):visibility(false);
v250.lc_y = v255.misc_main:slider("", 1, render.screen_size().y, render.screen_size().y / 2 - 50):visibility(false);
local _ = {
    [1] = "Ground", 
    [2] = "Air", 
    [3] = "No-Scope"
};
local _ = v255.home_image:texture(v204);
local _ = v255.home_profile:label("\a" .. v47.hex .. "\f<user>  " .. "   \aDEFAULT\226\128\162   " .. common.get_username());
local _ = v255.home_profile:label("\a" .. v47.hex .. "\f<code-branch>  " .. "   \aDEFAULT\226\128\162   " .. v39);
v245.enable = v255.antiaim_main:switch("\a" .. v47.hex .. "\f<square>" .. "   \aDEFAULTEnable");
local v260 = v255.antiaim_main:list("", {
    [1] = "\a" .. v47.hex .. "\f<gear>" .. "   \aDEFAULTTweaks", 
    [2] = "\a" .. v47.hex .. "\f<layer-group>" .. "   \aDEFAULTBuilder", 
    [3] = "\a" .. v47.hex .. "\f<gears>" .. "   \aDEFAULTRage"
}):depend(v245.enable);
v245.aa_tweaks_backstab = v255.antiaim_tweaks:switch("\a" .. v47.hex .. "\f<chevron-right>" .. "  \aDEFAULTAnti-Backstab", false, function(v261)
    return {
        mode = v261:combo("\b<p>Type", {
            [1] = "Cheat Base", 
            [2] = "Custom"
        })
    };
end):depend(v245.enable, {
    [1] = nil, 
    [2] = 1, 
    [1] = v260
});
v245.advanced_lag_peek = v255.antiaim_tweaks:switch("\a" .. v47.hex .. "\f<chevron-right>" .. "  \aDEFAULTAdvanced Lag Peek", false, function(v262)
    return {
        when = v262:selectable("\b<p>While", {
            [1] = "Hittable", 
            [2] = "Peeking", 
            [3] = "Shooting"
        }), 
        options = v262:selectable("\b<p>Options", {
            [1] = "FakeLag", 
            [2] = "Defensive"
        })
    };
end):depend(v245.enable, {
    [1] = nil, 
    [2] = 1, 
    [1] = v260
});
v245.defensive_flick = v255.antiaim_tweaks:switch("\a" .. v47.hex .. "\f<chevron-right>" .. "  \aDEFAULTDefensive Flick", false, function(v263)
    return {
        flick_type = v263:combo("\b<p>Flick Type", {
            [1] = "Maniak", 
            [2] = "Maniak V2", 
            [3] = "Leak"
        }), 
        safe_pitch = v263:combo("\b<p>Safe Pitch", {
            [1] = "Up", 
            [2] = "Zero", 
            [3] = "Down", 
            [4] = "Custom", 
            [5] = "Random"
        }), 
        reverse_defensive = v263:switch("\b<p>Reverse Defensive"), 
        static = v263:switch("\b<p>Static AA"), 
        safe_yaw = v263:slider("\b<p>Safe Yaw", -180, 180, 0), 
        pitch_s1 = v263:slider("\b<p>Custom Pitch 1", -89, 89, 0), 
        pitch_s2 = v263:slider("\b<p>Custom Pitch 2", -89, 89, 0)
    };
end):depend(v245.enable, {
    [1] = nil, 
    [2] = 1, 
    [1] = v260
});
v245.aa_tweaks_head = v255.antiaim_tweaks:switch("\a" .. v47.hex .. "\f<chevron-right>" .. "   \aDEFAULTSafe head", false, function(v264)
    return {
        mode = v264:selectable("\b<p>Options", {
            [1] = "Knife", 
            [2] = "Zeus", 
            [3] = "Height Difference"
        }), 
        hittable = v264:switch("\b<p>Hittable"), 
        height_diff = v264:selectable("\b<p>Height Difference Options", {
            [1] = "High Ground", 
            [2] = "Low Ground"
        })
    };
end):depend(v245.enable, {
    [1] = nil, 
    [2] = 1, 
    [1] = v260
});
v245.bruteforce_options = v255.antiaim_tweaks:switch("\a" .. v47.hex .. "\f<chevron-right>" .. "   \aDEFAULTAnti-Bruteforce Options", false, function(v265)
    return {
        reset_aa = v265:selectable("\b<p>Reset AA", {
            [1] = "Round End", 
            [2] = "Every x seconds", 
            [3] = "Edge Bait", 
            [4] = "Not Edge Bait"
        }), 
        reset_options_normal = v265:combo("\b<p>Reset Options", {
            [1] = "Active Phase-1", 
            [2] = "Active Phase=0"
        }), 
        reset_options_defensive = v265:combo("\b<p>Reset Options (Defensive)", {
            [1] = "Active Phase-1", 
            [2] = "Active Phase=0"
        }), 
        reset_time = v265:slider("\b<p>Reset Time", 1, 10, 1), 
        activate = v265:selectable("\b<p>Activate", {
            [1] = "On Miss", 
            [2] = "On Hit", 
            [3] = "Edge Bait", 
            [4] = "Not Edge Bait"
        })
    };
end):depend(v245.enable, {
    [1] = nil, 
    [2] = 1, 
    [1] = v260
});
v245.freestanding = v255.antiaim_tweaks:switch("\a" .. v47.hex .. "\f<chevron-right>" .. "   \aDEFAULTFreestanding", false, function(v266)
    return {
        disablers = v266:selectable("\b<p>Disablers", {
            [1] = "Air", 
            [2] = "Crouch", 
            [3] = "Slowwalk", 
            [4] = "Safehead"
        })
    };
end):depend(v245.enable, {
    [1] = nil, 
    [2] = 1, 
    [1] = v260
});
local v267 = v255.antiaim_builder_state:list("\a" .. v47.hex .. "\f<list>   \aDEFAULTBuilders", {
    [1] = "Builder", 
    [2] = "Defensive Builder", 
    [3] = "Anti-Bruteforce Builder", 
    [4] = "Anti-Bruteforce Defensive"
}):depend(v245.enable, {
    [1] = nil, 
    [2] = 2, 
    [1] = v260
});
local v268 = v255.antiaim_builder_state:combo("\a" .. v47.hex .. "\f<person>" .. "\aDEFAULT   \226\128\162   State", v46.states.builder):depend(v245.enable, {
    [1] = nil, 
    [2] = 2, 
    [1] = v260
}, {
    [1] = nil, 
    [2] = nil, 
    [3] = 3, 
    [1] = v267, 
    [2] = 1
});
local v269 = v255.antiaim_builder_state:combo("\a" .. v47.hex .. "\f<person>" .. "\aDEFAULT   \226\128\162   Defensive State", v46.states.defensive):depend(v245.enable, {
    [1] = nil, 
    [2] = 2, 
    [1] = v260
}, {
    [1] = nil, 
    [2] = nil, 
    [3] = 4, 
    [1] = v267, 
    [2] = 2
});
v244.adaptive_baim = v255.rage_main:switch("\a" .. v47.hex .. "\f<scarecrow> " .. " \aDEFAULTAdaptive Baim"):depend(v245.enable, {
    [1] = nil, 
    [2] = 3, 
    [1] = v260
});
v244.better_doubletap = v255.rage_main:switch("\a" .. v47.hex .. "\f<accessible-icon> " .. " \aDEFAULTBetter DoubleTap"):depend(v245.enable, {
    [1] = nil, 
    [2] = 3, 
    [1] = v260
});
v244.ideal_lc = v244.better_doubletap:create():switch("Fast Recharge");
v244.unsafe_charge = v244.better_doubletap:create():switch("Unsafe Charge");
v244.imd_on_peek = v244.better_doubletap:create():combo("DT Teleport On Peek", {
    [1] = "Immediate", 
    [2] = "Delayed"
});
v244.dt_sett = v244.better_doubletap:create():combo("DT Teleport", {
    [1] = "Immediate", 
    [2] = "Delayed"
});
v244.anti_os = v255.rage_main:switch("\a" .. v47.hex .. "\f<shield-halved> " .. " \aDEFAULTAnti OS"):depend(v245.enable, {
    [1] = nil, 
    [2] = 3, 
    [1] = v260
});
v244.interpolation_fix = v255.rage_main:switch("\a" .. v47.hex .. "\f<sparkles> " .. " \aDEFAULTInterpolation Fix"):depend(v245.enable, {
    [1] = nil, 
    [2] = 3, 
    [1] = v260
});
v244.aimtools = v255.rage_main:switch("\a" .. v47.hex .. "\f<gun> " .. " \aDEFAULTAimtools"):depend(v245.enable, {
    [1] = nil, 
    [2] = 3, 
    [1] = v260
});
local v270 = v244.aimtools:create():combo("States", v46.states.aimtools_states);
for v271 = 1, #v46.states.aimtools_states do
    v253[v271] = {};
    local v272 = v253[v271];
    v272.hitchance = v244.aimtools:create():slider("Hitchance", 0, 100, 0);
    v272.headscale = v244.aimtools:create():slider("Headscale", 0, 100, 0);
    v272.bodyscale = v244.aimtools:create():slider("Bodyscale", 0, 100, 0);
    v272.minimum_dmg = v244.aimtools:create():slider("Minimum Damage", 0, 125, 0);
end;
for v273 = 1, #v46.states.aimtools_states do
    local v274 = {
        [1] = v270, 
        [2] = v46.states.aimtools_states[v273]
    };
    v253[v273].hitchance:depend(v274);
    v253[v273].headscale:depend(v274);
    v253[v273].bodyscale:depend(v274);
    v253[v273].minimum_dmg:depend(v274);
end;
v247.viewmodel = v255.visuals_main:switch("\a" .. v47.hex .. "\f<gun>  " .. "\aDEFAULT Viewmodel", false, function(v275)
    return {
        fov = v275:slider("\b<p>Fov", 0, 120, 68), 
        x = v275:slider("\b<p>X", -10, 10, 0), 
        y = v275:slider("\b<p>Y", -10, 10, 0), 
        z = v275:slider("\b<p>Z", -10, 10, 0)
    };
end);
v247.aspect_ratio = v255.visuals_main:switch("\a" .. v47.hex .. "\f<expand-wide>  " .. "\aDEFAULT Aspect Ratio", false, function(v276)
    return {
        aspect = v276:slider("\b<p>Value", 0, 200, 0, 0.01)
    };
end);
v247.side_indicators = v255.visuals_main:switch("\a" .. v47.hex .. "\f<sidebar>  " .. "\aDEFAULT Side Indicators", false, function(v277)
    return {
        show_value = v277:selectable("\b<p>Show Values", {
            [1] = "Override damage value", 
            [2] = "Override hitchance value"
        })
    };
end);
v247.crosshair_indicators = v255.visuals_main:switch("\a" .. v47.hex .. "\f<crosshairs>  " .. "\aDEFAULT Screen Indicators", false, function(v278)
    return {
        font = v278:combo("\b<p>Font", {
            [1] = "Bold", 
            [2] = "Pixel", 
            [3] = "Blind"
        }), 
        damage_ind = v278:combo("\b<p>DMG Apear type", {
            [1] = "Always On", 
            [2] = "Damage override"
        }), 
        color = v278:color_picker("\b<p>Crosshair Color"), 
        dmg_color = v278:color_picker("\b<p>Damage Color")
    };
end);
v247.hitlogs = v255.visuals_main:switch("\a" .. v47.hex .. "\f<list>  " .. "\aDEFAULT Hitlogs", false, function(v279)
    return {
        style = v279:combo("\b<p>Style", {
            [1] = "Simple", 
            [2] = "Modern"
        }), 
        custom_color = v279:color_picker("\b<p>Color"), 
        weapon_icon = v279:switch("\b<p>Weapon Icon ")
    };
end);
v247.widets = v255.widgets_main:listable("\a" .. v47.hex .. "\f<keyboard>  " .. "\aDEFAULT Widgets", {
    [1] = "Keybinds", 
    [2] = "Watermark", 
    [3] = "Slowdown", 
    [4] = "Exploits", 
    [5] = "LC Indicator"
});
v247.keybinds = v255.style_tab:label("\b<p>Keybinds", false, function(v280)
    return {
        style = v280:combo("\b<p>Keybinds Type", {
            [1] = "Sense", 
            [2] = "Solus"
        }), 
        animated_text = v280:switch("\b<p>Animated Text"), 
        gradient = v280:switch("\b<p>Gradient Bar"), 
        color = v280:color_picker("\b<p>Color")
    };
end):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v247.widets
});
v247.watermark = v255.style_tab:label("\b<p>Watermark", false, function(v281)
    return {
        style = v281:combo("\b<p>Watermark Type", {
            [1] = "Sense", 
            [2] = "Solus"
        }), 
        animated_text = v281:switch("\b<p>Animated Text"), 
        gradient = v281:switch("\b<p>Gradient Bar"), 
        color = v281:color_picker("\b<p>Color")
    };
end):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v247.widets
});
v247.slowdown = v255.style_tab:label("\b<p>Slowdown", false, function(v282)
    return {
        color = v282:color_picker("\b<p>Color")
    };
end):depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v247.widets
});
v247.exploits = v255.style_tab:label("\b<p>Exploits", false, function(v283)
    return {
        style = v283:combo("\b<p>Exploits Type", {
            [1] = "Sense", 
            [2] = "Solus"
        }), 
        gradient = v283:switch("\b<p>Gradient Bar"), 
        color = v283:color_picker("\b<p>Color")
    };
end):depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v247.widets
});
v247.lc_ind = v255.style_tab:label("\b<p>LC Indicator ", false, function(v284)
    return {
        while_air = v284:switch("\b<p>While In Air"), 
        while_ground = v284:switch("\b<p>While On Ground"), 
        while_tp = v284:switch("\b<p>While Teleporting"), 
        one_color = v284:switch("\b<p>One Color")
    };
end):depend({
    [1] = nil, 
    [2] = 5, 
    [1] = v247.widets
});
v247.watermark.gradient:depend({
    [1] = nil, 
    [2] = "Sense", 
    [1] = v247.watermark.style
});
v247.keybinds.gradient:depend({
    [1] = nil, 
    [2] = "Sense", 
    [1] = v247.keybinds.style
});
v247.exploits.gradient:depend({
    [1] = nil, 
    [2] = "Sense", 
    [1] = v247.exploits.style
});
v248.auto_tp = v255.misc_main:switch("\a" .. v47.hex .. "\f<person-ski-jumping>  " .. "\aDEFAULT Auto TP");
v248.ideal_lc = v248.auto_tp:create():switch("Ideal LC");
v248.fast_recharge = v248.auto_tp:create():switch("Fast Recharge");
v248.supertoss = v255.misc_main:switch("\a" .. v47.hex .. "\f<superpowers>  " .. "\aDEFAULT Super Toss");
v248.nofall = v255.misc_main:switch("\a" .. v47.hex .. "\f<person-falling>  " .. "\aDEFAULT No Fall Damage");
v248.fastladder = v255.misc_main:switch("\a" .. v47.hex .. "\f<water-ladder>  " .. "\aDEFAULT Fast Ladder");
v248.follow_bot = v255.misc_main:switch("\a" .. v47.hex .. "\f<location-dot>  " .. "\aDEFAULT Follow Bot");
v248.follow_player_list = v248.follow_bot:create():combo("Follow Player", {});
v248.avoid_collisions = v255.misc_main:switch("\a" .. v47.hex .. "\f<rotate-right>  " .. "\aDEFAULT Avoid Collisions");
v248.avoid_collisions_range = v248.avoid_collisions:create():slider("Range", 5, 25, 15);
v248.air_lag = v255.misc_main:switch("\a" .. v47.hex .. "\f<paper-plane>  " .. "\aDEFAULT Airlag");
v248.hittable = v248.air_lag:create():switch("Hittable");
v248.optimization = v255.misc_main:switch("\a" .. v47.hex .. "\f<wand-magic-sparkles>  " .. "\aDEFAULT FPS Optimization");
v248.clantag = v255.misc_main:switch("\a" .. v47.hex .. "\f<tags>  " .. "\aDEFAULT Clantag");
v248.killsay = v255.misc_main:switch("\a" .. v47.hex .. "\f<person-harassing>  " .. "\aDEFAULT Trash Talk");
v248.shared_icon = v255.misc_main:switch("\a" .. v47.hex .. "\f<waveform-lines>  " .. "\aDEFAULT Shared Icon");
v248.animbreaker = v255.misc_main:switch("\a" .. v47.hex .. "\f<person-running>  " .. "\aDEFAULT Anim Breaker");
v248.legs_ground = v248.animbreaker:create():combo("Legs", {
    [1] = "Moonwalk", 
    [2] = "Jitter", 
    [3] = "Static", 
    [4] = "Slide"
});
v248.legs_air = v248.animbreaker:create():combo("Air", {
    [1] = "Moonwalk", 
    [2] = "Jitter", 
    [3] = "Static"
});
v248.lean = v248.animbreaker:create():slider("Lean", 0, 100, 0);
local v285 = {};
local v286 = {};
events.render:set(function()
    -- upvalues: v285 (ref), v286 (ref), v248 (ref)
    v285 = {};
    v286 = {};
    for _, v288 in ipairs(entity.get_players()) do
        table.insert(v286, {
            v288:get_name(), 
            v288:get_player_info()
        });
        table.insert(v285, v288:get_name());
    end;
    v248.follow_player_list:update(v285);
end);
for v289 = 1, #v46.states.builder do
    v246[v289] = {};
    local v290 = v246[v289];
    v290.override = v255.antiaim_builder:switch("\f<check> Override\a" .. v47.hex .. " " .. v46.states.builder[v289]);
    v290.pitch = v255.antiaim_builder:combo("Pitch", {
        [1] = "None", 
        [2] = "Down", 
        [3] = "Up", 
        [4] = "Zero", 
        [5] = "Random", 
        [6] = "Custom", 
        [7] = "Sway", 
        [8] = "Progressive Pitch", 
        [9] = "Jitter"
    });
    v290.customP = v290.pitch:create():slider("Custom Pitch", -89, 89, 0);
    v290.customP2 = v290.pitch:create():slider("Custom Pitch 2", -89, 89, 0);
    v290.customS = v290.pitch:create():slider("Pitch Speed", 0, 50, 0);
    v290.yaw_base = v255.antiaim_builder:combo("Yaw Base", {
        [1] = "Local View", 
        [2] = "At Target"
    });
    v290.jittertype = v255.antiaim_builder:combo("Jitter Type", {
        [1] = "Center", 
        [2] = "Offset", 
        [3] = "Delayed", 
        [4] = "Delayed V2", 
        [5] = "X-Ways", 
        [6] = "Spin", 
        [7] = "180"
    });
    v290.jitter_new = v290.jittertype:create():switch("New Jitter");
    v290.continuity = v290.jittertype:create():switch("Continuity");
    v290.jitspeed = v290.jittertype:create():slider("Jitter Speed", 0, 100, 0);
    v290.spin_value = v290.jittertype:create():slider("Spin Amount", 0, 360, 1);
    v290.spin_speed = v290.jittertype:create():slider("Spin Speed", 0, 360, 1);
    v290.LandR = v290.jittertype:create():switch("L&R");
    v290.jitteramount = v290.jittertype:create():slider("Jitter Range", -360, 360, 0);
    v290.jitteramount_l = v290.jittertype:create():slider("Jitter Range L", 0, 360, 0);
    v290.jitteramount_r = v290.jittertype:create():slider("Jitter Range R", 0, 360, 0);
    v290.ways = v290.jittertype:create():slider("Ways", 2, 40, 2);
    v290.ways_range = v290.jittertype:create():slider("Ways Range", -360, 360, 0);
    v290.ways_invert = v290.jittertype:create():switch("Ways Invert");
    v290.fake = v255.antiaim_builder:combo("Desync", {
        [1] = "Off", 
        [2] = "Static", 
        [3] = "Jitter", 
        [4] = "Random"
    });
    v290.fake_options = v290.fake:create():selectable("Fake Options", {
        [1] = "Avoid Overlap", 
        [2] = "Jitter", 
        [3] = "Randomize Jitter", 
        [4] = "Anti Bruteforce"
    });
    v290.diff_fake = v290.fake:create():switch("L&R Desync");
    v290.fake_angle_l = v290.fake:create():slider("Desync Left", 0, 60, 0);
    v290.fake_angle_r = v290.fake:create():slider("Desync Right", 0, 60, 0);
    v290.invert_fake = v290.fake:create():switch("Invert Fake");
    v290.sync = v290.fake:create():switch("Sync Desync with Jitter");
    v290.allow_defensive = v255.antiaim_builder:switch("Allow Defensive");
end;
local v291 = v255.antiaim_builder:slider("Phase", 1, 5, 1):depend(v245.enable, {
    [1] = nil, 
    [2] = 2, 
    [1] = v260
}, {
    [1] = nil, 
    [2] = nil, 
    [3] = 3, 
    [1] = v267, 
    [2] = 4
});
for v292 = 1, 5 do
    v254[v292] = {};
    v254[v292].phase = v255.antiaim_builder:switch("Enable Phase " .. v292):depend(v245.enable, {
        [1] = nil, 
        [2] = 2, 
        [1] = v260
    }, {
        [1] = nil, 
        [2] = nil, 
        [3] = 3, 
        [1] = v267, 
        [2] = 4
    }, {
        [1] = v291, 
        [2] = v292
    });
end;
for v293 = 1, #v46.states.defensive do
    v249[v293] = {};
    local v294 = v249[v293];
    v294.override = v255.antiaim_builder:switch("\f<check> Override\a" .. v47.hex .. " " .. v46.states.defensive[v293] .. " \aDEFAULTDefensive ");
    v294.def_type = v255.antiaim_builder:combo("Trigger", {
        [1] = "Tick Based", 
        [2] = "Predicted", 
        [3] = "Edge Bait"
    });
    v294.hittable = v294.def_type:create():switch("Hittable");
    v294.def_speed = v294.def_type:create():slider("Speed", 0, 100, 0);
    v294.pitch = v255.antiaim_builder:combo("Pitch", {
        [1] = "None", 
        [2] = "Down", 
        [3] = "Up", 
        [4] = "Zero", 
        [5] = "Random", 
        [6] = "Custom", 
        [7] = "Sway", 
        [8] = "Progressive Pitch", 
        [9] = "Jitter"
    });
    v294.customP = v294.pitch:create():slider("Custom Pitch", -89, 89, 0);
    v294.customP2 = v294.pitch:create():slider("Custom Pitch 2", -89, 89, 0);
    v294.customS = v294.pitch:create():slider("Pitch Speed", 0, 50, 0);
    v294.yaw_base = v255.antiaim_builder:combo("Yaw Base", {
        [1] = "Local View", 
        [2] = "At Target"
    });
    v294.jittertype = v255.antiaim_builder:combo("Jitter Type", {
        [1] = "Center", 
        [2] = "Offset", 
        [3] = "Delayed", 
        [4] = "Delayed V2", 
        [5] = "X-Ways", 
        [6] = "Spin", 
        [7] = "180"
    });
    v294.jitter_new = v294.jittertype:create():switch("New Jitter");
    v294.jitspeed = v294.jittertype:create():slider("Jitter Speed", 0, 100, 0);
    v294.spin_value = v294.jittertype:create():slider("Spin Amount", 0, 360, 1);
    v294.spin_speed = v294.jittertype:create():slider("Spin Speed", 0, 360, 1);
    v294.LandR = v294.jittertype:create():switch("L&R");
    v294.jitteramount = v294.jittertype:create():slider("Jitter Range", -360, 360, 0);
    v294.jitteramount_l = v294.jittertype:create():slider("Jitter Range L", 0, 360, 0);
    v294.jitteramount_r = v294.jittertype:create():slider("Jitter Range R", 0, 360, 0);
    v294.ways = v294.jittertype:create():slider("Ways", 2, 40, 2);
    v294.ways_range = v294.jittertype:create():slider("Ways Range", -360, 360, 0);
    v294.ways_invert = v294.jittertype:create():switch("Ways Invert");
    v294.fake = v255.antiaim_builder:combo("Desync", {
        [1] = "Off", 
        [2] = "Static", 
        [3] = "Jitter", 
        [4] = "Random"
    });
    v294.fake_options = v294.fake:create():selectable("Fake Options", {
        [1] = "Avoid Overlap", 
        [2] = "Jitter", 
        [3] = "Randomize Jitter", 
        [4] = "Anti Bruteforce"
    });
    v294.diff_fake = v294.fake:create():switch("L&R Desync");
    v294.sway_desync = v294.fake:create():switch("Sway Desync");
    v294.fake_angle_l = v294.fake:create():slider("Desync Left", 0, 60, 0);
    v294.fake_angle_r = v294.fake:create():slider("Desync Right", 0, 60, 0);
    v294.sync = v294.fake:create():switch("Sync Desync with Jitter");
    v294.break_lc = v255.antiaim_builder:switch("Break LC");
    v294.disable_aa = v255.antiaim_builder:switch("Disable Anti-Aim");
end;
for v295 = 1, 5 do
    v251[v295] = {};
    for v296 = 1, #v46.states.builder do
        v251[v295][v296] = {};
        local v297 = v251[v295][v296];
        v297.override = v255.antiaim_builder:switch("\f<check> Override\a" .. v47.hex .. " " .. v46.states.builder[v296]);
        v297.pitch = v255.antiaim_builder:combo("Pitch", {
            [1] = "None", 
            [2] = "Down", 
            [3] = "Up", 
            [4] = "Zero", 
            [5] = "Random", 
            [6] = "Custom", 
            [7] = "Sway", 
            [8] = "Progressive Pitch", 
            [9] = "Jitter"
        });
        v297.customP = v297.pitch:create():slider("Custom Pitch", -89, 89, 0);
        v297.customP2 = v297.pitch:create():slider("Custom Pitch 2", -89, 89, 0);
        v297.customS = v297.pitch:create():slider("Pitch Speed", 0, 50, 0);
        v297.yaw_base = v255.antiaim_builder:combo("Yaw Base", {
            [1] = "Local View", 
            [2] = "At Target"
        });
        v297.jittertype = v255.antiaim_builder:combo("Jitter Type", {
            [1] = "Center", 
            [2] = "Offset", 
            [3] = "Delayed", 
            [4] = "Delayed V2", 
            [5] = "X-Ways", 
            [6] = "Spin", 
            [7] = "180"
        });
        v297.jitter_new = v297.jittertype:create():switch("New Jitter");
        v297.continuity = v297.jittertype:create():switch("Continuity");
        v297.jitspeed = v297.jittertype:create():slider("Jitter Speed", 0, 100, 0);
        v297.spin_value = v297.jittertype:create():slider("Spin Amount", 0, 360, 1);
        v297.spin_speed = v297.jittertype:create():slider("Spin Speed", 0, 360, 1);
        v297.LandR = v297.jittertype:create():switch("L&R");
        v297.jitteramount = v297.jittertype:create():slider("Jitter Range", -360, 360, 0);
        v297.jitteramount_l = v297.jittertype:create():slider("Jitter Range L", 0, 360, 0);
        v297.jitteramount_r = v297.jittertype:create():slider("Jitter Range R", 0, 360, 0);
        v297.ways = v297.jittertype:create():slider("Ways", 2, 40, 2);
        v297.ways_range = v297.jittertype:create():slider("Ways Range", -360, 360, 0);
        v297.ways_invert = v297.jittertype:create():switch("Ways Invert");
        v297.fake = v255.antiaim_builder:combo("Desync", {
            [1] = "Off", 
            [2] = "Static", 
            [3] = "Jitter", 
            [4] = "Random"
        });
        v297.fake_options = v297.fake:create():selectable("Fake Options", {
            [1] = "Avoid Overlap", 
            [2] = "Jitter", 
            [3] = "Randomize Jitter", 
            [4] = "Anti Bruteforce"
        });
        v297.diff_fake = v297.fake:create():switch("L&R Desync");
        v297.fake_angle_l = v297.fake:create():slider("Desync Left", 0, 60, 0);
        v297.fake_angle_r = v297.fake:create():slider("Desync Right", 0, 60, 0);
        v297.invert_fake = v297.fake:create():switch("Invert Fake");
        v297.sync = v297.fake:create():switch("Sync Desync with Jitter");
        v297.allow_defensive = v255.antiaim_builder:switch("Allow Defensive");
    end;
end;
for v298 = 1, 5 do
    for v299 = 1, #v46.states.builder do
        local v300 = v251[v298][v299];
        local v301 = {
            [1] = nil, 
            [2] = 2, 
            [1] = v260
        };
        local v302 = {
            [1] = v268, 
            [2] = v46.states.builder[v299]
        };
        local v303 = {
            [1] = nil, 
            [2] = 3, 
            [1] = v267
        };
        local v304 = {
            [1] = nil, 
            [2] = true, 
            [1] = v300.override
        };
        local v305 = {
            [1] = v291, 
            [2] = v298
        };
        local v306 = {
            [1] = nil, 
            [2] = true, 
            [1] = v254[v298].phase
        };
        v251[v298][1].override:set(true);
        v300.override:depend(v245.enable, v301, v302, v303, v305, v306);
        v300.pitch:depend(v245.enable, v301, v302, v303, v304, v305, v306);
        v300.customP:depend(v245.enable, v301, v302, v303, v304, v305, v306, {
            [1] = nil, 
            [2] = "Custom", 
            [3] = nil, 
            [4] = "Progressive Pitch", 
            [5] = nil, 
            [6] = "Sway", 
            [7] = nil, 
            [8] = "Jitter", 
            [9] = nil, 
            [10] = "Random", 
            [1] = v300.pitch, 
            [3] = v300.pitch, 
            [5] = v300.pitch, 
            [7] = v300.pitch, 
            [9] = v300.pitch
        });
        v300.customP2:depend(v245.enable, v301, v302, v303, v304, v305, v306, {
            [1] = nil, 
            [2] = "Jitter", 
            [3] = nil, 
            [4] = "Random", 
            [1] = v300.pitch, 
            [3] = v300.pitch
        });
        v300.customS:depend(v245.enable, v301, v302, v303, v304, v305, v306, {
            [1] = nil, 
            [2] = "Progressive Pitch", 
            [3] = nil, 
            [4] = "Sway", 
            [5] = nil, 
            [6] = "Jitter", 
            [1] = v300.pitch, 
            [3] = v300.pitch, 
            [5] = v300.pitch
        });
        v300.jittertype:depend(v245.enable, v301, v302, v303, v304, v305, v306);
        v300.yaw_base:depend(v245.enable, v301, v302, v303, v304, v305, v306);
        v300.jitspeed:depend(v245.enable, v301, v302, v303, v304, v305, v306, {
            [1] = nil, 
            [2] = "Delayed", 
            [3] = nil, 
            [4] = "Delayed V2", 
            [1] = v300.jittertype, 
            [3] = v300.jittertype
        });
        v300.spin_value:depend(v245.enable, v301, v302, v303, v304, v305, v306, {
            [1] = nil, 
            [2] = "Spin", 
            [1] = v300.jittertype
        });
        v300.spin_speed:depend(v245.enable, v301, v302, v303, v304, v305, v306, {
            [1] = nil, 
            [2] = "Spin", 
            [1] = v300.jittertype
        });
        v300.LandR:depend(v245.enable, v301, v302, v303, v304, v305, v306, {
            [1] = nil, 
            [2] = "Center", 
            [3] = nil, 
            [4] = "Delayed", 
            [5] = nil, 
            [6] = "Offset", 
            [7] = nil, 
            [8] = "Delayed V2", 
            [1] = v300.jittertype, 
            [3] = v300.jittertype, 
            [5] = v300.jittertype, 
            [7] = v300.jittertype
        });
        v300.jitter_new:depend(v245.enable, v301, v302, v303, v304, v305, v306);
        v300.continuity:depend(v245.enable, v301, v302, v303, v304, v305, v306);
        v300.jitteramount:depend(v245.enable, v301, v302, v303, v304, v305, v306, {
            [1] = nil, 
            [2] = false, 
            [1] = v300.LandR
        }, {
            [1] = nil, 
            [2] = "Center", 
            [3] = nil, 
            [4] = "Delayed", 
            [5] = nil, 
            [6] = "Offset", 
            [7] = nil, 
            [8] = "180", 
            [1] = v300.jittertype, 
            [3] = v300.jittertype, 
            [5] = v300.jittertype, 
            [7] = v300.jittertype
        });
        v300.jitteramount_l:depend(v245.enable, v301, v302, v303, v304, v305, v306, {
            [1] = nil, 
            [2] = true, 
            [1] = v300.LandR
        }, {
            [1] = nil, 
            [2] = "Center", 
            [3] = nil, 
            [4] = "Delayed", 
            [5] = nil, 
            [6] = "Delayed V2", 
            [1] = v300.jittertype, 
            [3] = v300.jittertype, 
            [5] = v300.jittertype
        });
        v300.jitteramount_r:depend(v245.enable, v301, v302, v303, v304, v305, v306, {
            [1] = nil, 
            [2] = true, 
            [1] = v300.LandR
        }, {
            [1] = nil, 
            [2] = "Center", 
            [3] = nil, 
            [4] = "Delayed", 
            [5] = nil, 
            [6] = "Delayed V2", 
            [1] = v300.jittertype, 
            [3] = v300.jittertype, 
            [5] = v300.jittertype
        });
        v300.ways:depend(v245.enable, v301, v302, v303, v304, v305, v306, {
            [1] = nil, 
            [2] = "X-Ways", 
            [1] = v300.jittertype
        });
        v300.ways_range:depend(v245.enable, v301, v302, v303, v304, v305, v306, {
            [1] = nil, 
            [2] = "X-Ways", 
            [1] = v300.jittertype
        });
        v300.ways_invert:depend(v245.enable, v301, v302, v303, v304, v305, v306, {
            [1] = nil, 
            [2] = "X-Ways", 
            [1] = v300.jittertype
        });
        v300.fake:depend(v245.enable, v301, v302, v303, v304, v305, v306);
        v300.fake_angle_l:depend(v245.enable, v301, v302, v303, v304, v305, v306, {
            [1] = nil, 
            [2] = "Static", 
            [3] = nil, 
            [4] = "Jitter", 
            [1] = v300.fake, 
            [3] = v300.fake
        });
        v300.fake_angle_r:depend(v245.enable, v301, v302, v303, v304, v305, v306, {
            [1] = nil, 
            [2] = "Static", 
            [3] = nil, 
            [4] = "Jitter", 
            [1] = v300.fake, 
            [3] = v300.fake
        });
        v300.sync:depend(v245.enable, v301, v302, v303, v304, v305, v306, {
            [1] = nil, 
            [2] = "Static", 
            [3] = nil, 
            [4] = "Jitter", 
            [1] = v300.fake, 
            [3] = v300.fake
        });
        v300.invert_fake:depend(v245.enable, v301, v302, v303, v304, v305, v306, {
            [1] = nil, 
            [2] = "Static", 
            [3] = nil, 
            [4] = "Jitter", 
            [1] = v300.fake, 
            [3] = v300.fake
        });
        v300.diff_fake:depend(v245.enable, v301, v302, v303, v304, v305, v306, {
            [1] = nil, 
            [2] = "Static", 
            [1] = v300.fake
        });
        v300.allow_defensive:depend(v245.enable, v301, v302, v303, v304, v305, v306);
    end;
end;
for v307 = 1, 5 do
    v252[v307] = {};
    for v308 = 1, #v46.states.defensive do
        v252[v307][v308] = {};
        local v309 = v252[v307][v308];
        v309.override = v255.antiaim_builder:switch("\f<check> Override\a" .. v47.hex .. " " .. v46.states.defensive[v308] .. " \aDEFAULTDefensive ");
        v309.def_type = v255.antiaim_builder:combo("Trigger", {
            [1] = "Tick Based", 
            [2] = "Predicted", 
            [3] = "Edge Bait"
        });
        v309.hittable = v309.def_type:create():switch("Hittable");
        v309.def_speed = v309.def_type:create():slider("Speed", 0, 100, 0);
        v309.pitch = v255.antiaim_builder:combo("Pitch", {
            [1] = "None", 
            [2] = "Down", 
            [3] = "Up", 
            [4] = "Zero", 
            [5] = "Random", 
            [6] = "Custom", 
            [7] = "Sway", 
            [8] = "Progressive Pitch", 
            [9] = "Jitter"
        });
        v309.customP = v309.pitch:create():slider("Custom Pitch", -89, 89, 0);
        v309.customP2 = v309.pitch:create():slider("Custom Pitch 2", -89, 89, 0);
        v309.customS = v309.pitch:create():slider("Pitch Speed", 0, 50, 0);
        v309.yaw_base = v255.antiaim_builder:combo("Yaw Base", {
            [1] = "Local View", 
            [2] = "At Target"
        });
        v309.jittertype = v255.antiaim_builder:combo("Jitter Type", {
            [1] = "Center", 
            [2] = "Offset", 
            [3] = "Delayed", 
            [4] = "Delayed V2", 
            [5] = "X-Ways", 
            [6] = "Spin", 
            [7] = "180"
        });
        v309.jitter_new = v309.jittertype:create():switch("New Jitter");
        v309.jitspeed = v309.jittertype:create():slider("Jitter Speed", 0, 100, 0);
        v309.spin_value = v309.jittertype:create():slider("Spin Amount", 0, 360, 1);
        v309.spin_speed = v309.jittertype:create():slider("Spin Speed", 0, 360, 1);
        v309.LandR = v309.jittertype:create():switch("L&R");
        v309.jitteramount = v309.jittertype:create():slider("Jitter Range", -360, 360, 0);
        v309.jitteramount_l = v309.jittertype:create():slider("Jitter Range L", 0, 360, 0);
        v309.jitteramount_r = v309.jittertype:create():slider("Jitter Range R", 0, 360, 0);
        v309.ways = v309.jittertype:create():slider("Ways", 2, 40, 2);
        v309.ways_range = v309.jittertype:create():slider("Ways Range", -360, 360, 0);
        v309.ways_invert = v309.jittertype:create():switch("Ways Invert");
        v309.fake = v255.antiaim_builder:combo("Desync", {
            [1] = "Off", 
            [2] = "Static", 
            [3] = "Jitter", 
            [4] = "Random"
        });
        v309.fake_options = v309.fake:create():selectable("Fake Options", {
            [1] = "Avoid Overlap", 
            [2] = "Jitter", 
            [3] = "Randomize Jitter", 
            [4] = "Anti Bruteforce"
        });
        v309.diff_fake = v309.fake:create():switch("L&R Desync");
        v309.sway_desync = v309.fake:create():switch("Sway Desync");
        v309.fake_angle_l = v309.fake:create():slider("Desync Left", 0, 60, 0);
        v309.fake_angle_r = v309.fake:create():slider("Desync Right", 0, 60, 0);
        v309.sync = v309.fake:create():switch("Sync Desync with Jitter");
        v309.break_lc = v255.antiaim_builder:switch("Break LC");
        v309.disable_aa = v255.antiaim_builder:switch("Disable Anti-Aim");
    end;
end;
for v310 = 1, 5 do
    for v311 = 1, #v46.states.defensive do
        local v312 = v252[v310][v311];
        local v313 = {
            [1] = nil, 
            [2] = 2, 
            [1] = v260
        };
        local v314 = {
            [1] = v269, 
            [2] = v46.states.defensive[v311]
        };
        local v315 = {
            [1] = nil, 
            [2] = 4, 
            [1] = v267
        };
        local v316 = {
            [1] = nil, 
            [2] = true, 
            [1] = v312.override
        };
        local v317 = {
            [1] = v291, 
            [2] = v310
        };
        local v318 = {
            [1] = nil, 
            [2] = true, 
            [1] = v254[v310].phase
        };
        v252[v310][1].override:depend({
            [1] = nil, 
            [2] = "OFF", 
            [1] = v268
        });
        v252[v310][1].override:set(true);
        v312.override:depend(v245.enable, v313, v314, v315, v317, v318);
        v312.pitch:depend(v245.enable, v313, v314, v315, v316, v317, v318);
        v312.def_speed:depend(v245.enable, v313, v314, v315, v316, v317, v318);
        v312.def_type:depend(v245.enable, v313, v314, v315, v316, v317, v318);
        v312.customP:depend(v245.enable, v313, v314, v315, v316, v317, v318, {
            [1] = nil, 
            [2] = nil, 
            [3] = nil, 
            [4] = nil, 
            [5] = nil, 
            [6] = "Random", 
            [1] = v312.pitch, 
            [2] = "Custom", 
            [3] = "Progressive Pitch", 
            [4] = "Sway", 
            [5] = "Jitter"
        });
        v312.customP2:depend(v245.enable, v313, v314, v315, v316, v317, v318, {
            [1] = nil, 
            [2] = nil, 
            [3] = "Random", 
            [1] = v312.pitch, 
            [2] = "Jitter"
        });
        v312.customS:depend(v245.enable, v313, v314, v315, v316, v317, v318, {
            [1] = nil, 
            [2] = nil, 
            [3] = nil, 
            [4] = "Jitter", 
            [1] = v312.pitch, 
            [2] = "Progressive Pitch", 
            [3] = "Sway"
        });
        v312.jittertype:depend(v245.enable, v313, v314, v315, v316, v317, v318);
        v312.yaw_base:depend(v245.enable, v313, v314, v315, v316, v317, v318);
        v312.spin_value:depend(v245.enable, v313, v314, v315, v316, v317, v318, {
            [1] = nil, 
            [2] = nil, 
            [3] = "Sway", 
            [1] = v312.jittertype, 
            [2] = "Spin"
        });
        v312.spin_speed:depend(v245.enable, v313, v314, v315, v316, v317, v318, {
            [1] = nil, 
            [2] = nil, 
            [3] = "Sway", 
            [1] = v312.jittertype, 
            [2] = "Spin"
        });
        v312.jitspeed:depend(v245.enable, v313, v314, v315, v316, v317, v318, {
            [1] = nil, 
            [2] = "Delayed", 
            [3] = nil, 
            [4] = "Delayed V2", 
            [1] = v312.jittertype, 
            [3] = v312.jittertype
        });
        v312.LandR:depend(v245.enable, v313, v314, v315, v316, v317, v318, {
            [1] = nil, 
            [2] = nil, 
            [3] = "Delayed", 
            [1] = v312.jittertype, 
            [2] = "Center"
        });
        v312.jitteramount:depend(v245.enable, v313, v314, v315, v316, v317, v318, {
            [1] = nil, 
            [2] = false, 
            [1] = v312.LandR
        }, {
            [1] = nil, 
            [2] = nil, 
            [3] = nil, 
            [4] = nil, 
            [5] = "180", 
            [1] = v312.jittertype, 
            [2] = "Center", 
            [3] = "Delayed", 
            [4] = "Offset"
        });
        v312.jitteramount_l:depend(v245.enable, v313, v314, v315, v316, v317, v318, {
            [1] = nil, 
            [2] = true, 
            [1] = v312.LandR
        }, {
            [1] = nil, 
            [2] = nil, 
            [3] = nil, 
            [4] = nil, 
            [5] = "Delayed V2", 
            [1] = v312.jittertype, 
            [2] = "Center", 
            [3] = "Delayed", 
            [4] = "Random"
        });
        v312.jitteramount_r:depend(v245.enable, v313, v314, v315, v316, v317, v318, {
            [1] = nil, 
            [2] = true, 
            [1] = v312.LandR
        }, {
            [1] = nil, 
            [2] = nil, 
            [3] = nil, 
            [4] = nil, 
            [5] = "Delayed V2", 
            [1] = v312.jittertype, 
            [2] = "Center", 
            [3] = "Delayed", 
            [4] = "Random"
        });
        v312.ways:depend(v245.enable, v313, v314, v315, v316, v317, v318, {
            [1] = nil, 
            [2] = "X-Ways", 
            [1] = v312.jittertype
        });
        v312.ways_range:depend(v245.enable, v313, v314, v315, v316, v317, v318, {
            [1] = nil, 
            [2] = "X-Ways", 
            [1] = v312.jittertype
        });
        v312.ways_invert:depend(v245.enable, v313, v314, v315, v316, v317, v318, {
            [1] = nil, 
            [2] = "X-Ways", 
            [1] = v312.jittertype
        });
        v312.fake:depend(v245.enable, v313, v314, v315, v316, v317, v318);
        v312.fake_angle_l:depend(v245.enable, v313, v314, v315, v316, v317, v318, {
            [1] = nil, 
            [2] = nil, 
            [3] = "Jitter", 
            [1] = v312.fake, 
            [2] = "Static"
        });
        v312.fake_angle_r:depend(v245.enable, v313, v314, v315, v316, v317, v318, {
            [1] = nil, 
            [2] = nil, 
            [3] = "Jitter", 
            [1] = v312.fake, 
            [2] = "Static"
        });
        v312.sync:depend(v245.enable, v313, v314, v315, v316, v317, v318, {
            [1] = nil, 
            [2] = nil, 
            [3] = "Jitter", 
            [1] = v312.fake, 
            [2] = "Static"
        });
        v312.sway_desync:depend(v245.enable, v313, v314, v315, v316, v317, v318);
        v312.break_lc:depend(v245.enable, v313, v314, v315, v316, v317, v318);
        v312.disable_aa:depend(v245.enable, v313, v314, v315, v316, v317, v318);
        v312.diff_fake:depend(v245.enable, v313, v314, v315, v316, v317, v318, {
            [1] = nil, 
            [2] = "Static", 
            [1] = v312.fake
        });
    end;
end;
for v319 = 1, #v46.states.defensive do
    local v320 = v249[v319];
    local v321 = {
        [1] = nil, 
        [2] = 2, 
        [1] = v260
    };
    local v322 = {
        [1] = v269, 
        [2] = v46.states.defensive[v319]
    };
    local v323 = {
        [1] = nil, 
        [2] = 2, 
        [1] = v267
    };
    local v324 = {
        [1] = nil, 
        [2] = true, 
        [1] = v320.override
    };
    v249[1].override:depend({
        [1] = nil, 
        [2] = "OFF", 
        [1] = v268
    });
    v249[1].override:set(true);
    v320.override:depend(v245.enable, v321, v322, v323);
    v320.pitch:depend(v245.enable, v321, v322, v323, v324);
    v320.def_speed:depend(v245.enable, v321, v322, v323, v324);
    v320.def_type:depend(v245.enable, v321, v322, v323, v324);
    v320.customP:depend(v245.enable, v321, v322, v323, v324, {
        [1] = nil, 
        [2] = nil, 
        [3] = nil, 
        [4] = nil, 
        [5] = nil, 
        [6] = "Random", 
        [1] = v320.pitch, 
        [2] = "Custom", 
        [3] = "Progressive Pitch", 
        [4] = "Sway", 
        [5] = "Jitter"
    });
    v320.customP2:depend(v245.enable, v321, v322, v323, v324, {
        [1] = nil, 
        [2] = nil, 
        [3] = "Random", 
        [1] = v320.pitch, 
        [2] = "Jitter"
    });
    v320.customS:depend(v245.enable, v321, v322, v323, v324, {
        [1] = nil, 
        [2] = nil, 
        [3] = nil, 
        [4] = "Jitter", 
        [1] = v320.pitch, 
        [2] = "Progressive Pitch", 
        [3] = "Sway"
    });
    v320.jittertype:depend(v245.enable, v321, v322, v323, v324);
    v320.yaw_base:depend(v245.enable, v321, v322, v323, v324);
    v320.spin_value:depend(v245.enable, v321, v322, v323, v324, {
        [1] = nil, 
        [2] = nil, 
        [3] = "Sway", 
        [1] = v320.jittertype, 
        [2] = "Spin"
    });
    v320.spin_speed:depend(v245.enable, v321, v322, v323, v324, {
        [1] = nil, 
        [2] = nil, 
        [3] = "Sway", 
        [1] = v320.jittertype, 
        [2] = "Spin"
    });
    v320.jitspeed:depend(v245.enable, v321, v322, v323, v324, {
        [1] = nil, 
        [2] = "Delayed", 
        [3] = nil, 
        [4] = "Delayed V2", 
        [1] = v320.jittertype, 
        [3] = v320.jittertype
    });
    v320.LandR:depend(v245.enable, v321, v322, v323, v324, {
        [1] = nil, 
        [2] = nil, 
        [3] = "Delayed", 
        [1] = v320.jittertype, 
        [2] = "Center"
    });
    v320.jitteramount:depend(v245.enable, v321, v322, v323, v324, {
        [1] = nil, 
        [2] = false, 
        [1] = v320.LandR
    }, {
        [1] = nil, 
        [2] = nil, 
        [3] = nil, 
        [4] = nil, 
        [5] = "180", 
        [1] = v320.jittertype, 
        [2] = "Center", 
        [3] = "Delayed", 
        [4] = "Offset"
    });
    v320.jitteramount_l:depend(v245.enable, v321, v322, v323, v324, {
        [1] = nil, 
        [2] = true, 
        [1] = v320.LandR
    }, {
        [1] = nil, 
        [2] = nil, 
        [3] = nil, 
        [4] = nil, 
        [5] = "Delayed V2", 
        [1] = v320.jittertype, 
        [2] = "Center", 
        [3] = "Delayed", 
        [4] = "Random"
    });
    v320.jitteramount_r:depend(v245.enable, v321, v322, v323, v324, {
        [1] = nil, 
        [2] = true, 
        [1] = v320.LandR
    }, {
        [1] = nil, 
        [2] = nil, 
        [3] = nil, 
        [4] = nil, 
        [5] = "Delayed V2", 
        [1] = v320.jittertype, 
        [2] = "Center", 
        [3] = "Delayed", 
        [4] = "Random"
    });
    v320.ways:depend(v245.enable, v321, v322, v323, v324, {
        [1] = nil, 
        [2] = "X-Ways", 
        [1] = v320.jittertype
    });
    v320.ways_range:depend(v245.enable, v321, v322, v323, v324, {
        [1] = nil, 
        [2] = "X-Ways", 
        [1] = v320.jittertype
    });
    v320.ways_invert:depend(v245.enable, v321, v322, v323, v324, {
        [1] = nil, 
        [2] = "X-Ways", 
        [1] = v320.jittertype
    });
    v320.fake:depend(v245.enable, v321, v322, v323, v324);
    v320.fake_angle_l:depend(v245.enable, v321, v322, v323, v324, {
        [1] = nil, 
        [2] = nil, 
        [3] = "Jitter", 
        [1] = v320.fake, 
        [2] = "Static"
    });
    v320.fake_angle_r:depend(v245.enable, v321, v322, v323, v324, {
        [1] = nil, 
        [2] = nil, 
        [3] = "Jitter", 
        [1] = v320.fake, 
        [2] = "Static"
    });
    v320.sync:depend(v245.enable, v321, v322, v323, v324, {
        [1] = nil, 
        [2] = nil, 
        [3] = "Jitter", 
        [1] = v320.fake, 
        [2] = "Static"
    });
    v320.sway_desync:depend(v245.enable, v321, v322, v323, v324);
    v320.break_lc:depend(v245.enable, v321, v322, v323, v324);
    v320.disable_aa:depend(v245.enable, v321, v322, v323, v324);
    v320.diff_fake:depend(v245.enable, v321, v322, v323, v324, {
        [1] = nil, 
        [2] = "Static", 
        [1] = v320.fake
    });
end;
for v325 = 1, #v46.states.builder do
    local _ = v246[v325];
    local v327 = {
        [1] = nil, 
        [2] = 2, 
        [1] = v260
    };
    local v328 = {
        [1] = v268, 
        [2] = v46.states.builder[v325]
    };
    local v329 = {
        [1] = nil, 
        [2] = 1, 
        [1] = v267
    };
    local v330 = v246[v325];
    local v331 = {
        [1] = nil, 
        [2] = true, 
        [1] = v330.override
    };
    v246[1].override:depend({
        [1] = nil, 
        [2] = "OFF", 
        [1] = v268
    });
    v246[1].override:set(true);
    v330.override:depend(v245.enable, v327, v328, v329);
    v330.pitch:depend(v245.enable, v327, v328, v329, v331);
    v330.customP:depend(v245.enable, v327, v328, v329, v331, {
        [1] = nil, 
        [2] = nil, 
        [3] = nil, 
        [4] = nil, 
        [5] = nil, 
        [6] = "Random", 
        [1] = v330.pitch, 
        [2] = "Custom", 
        [3] = "Progressive Pitch", 
        [4] = "Sway", 
        [5] = "Jitter"
    });
    v330.customP2:depend(v245.enable, v327, v328, v329, v331, {
        [1] = nil, 
        [2] = nil, 
        [3] = "Random", 
        [1] = v330.pitch, 
        [2] = "Jitter"
    });
    v330.customS:depend(v245.enable, v327, v328, v329, v331, {
        [1] = nil, 
        [2] = nil, 
        [3] = nil, 
        [4] = "Jitter", 
        [1] = v330.pitch, 
        [2] = "Progressive Pitch", 
        [3] = "Sway"
    });
    v330.jittertype:depend(v245.enable, v327, v328, v329, v331);
    v330.yaw_base:depend(v245.enable, v327, v328, v329, v331);
    v330.jitspeed:depend(v245.enable, v327, v328, v329, v331, {
        [1] = nil, 
        [2] = "Delayed", 
        [3] = nil, 
        [4] = "Delayed V2", 
        [1] = v330.jittertype, 
        [3] = v330.jittertype
    });
    v330.spin_value:depend(v245.enable, v327, v328, v329, v331, {
        [1] = nil, 
        [2] = "Spin", 
        [1] = v330.jittertype
    });
    v330.spin_speed:depend(v245.enable, v327, v328, v329, v331, {
        [1] = nil, 
        [2] = "Spin", 
        [1] = v330.jittertype
    });
    v330.LandR:depend(v245.enable, v327, v328, v329, v331, {
        [1] = nil, 
        [2] = nil, 
        [3] = nil, 
        [4] = nil, 
        [5] = "Delayed V2", 
        [1] = v330.jittertype, 
        [2] = "Center", 
        [3] = "Delayed", 
        [4] = "Offset"
    });
    v330.jitter_new:depend(v245.enable, v327, v328, v329, v331);
    v330.continuity:depend(v245.enable, v327, v328, v329, v331);
    v330.jitteramount:depend(v245.enable, v327, v328, v329, v331, {
        [1] = nil, 
        [2] = false, 
        [1] = v330.LandR
    }, {
        [1] = nil, 
        [2] = nil, 
        [3] = nil, 
        [4] = nil, 
        [5] = "180", 
        [1] = v330.jittertype, 
        [2] = "Center", 
        [3] = "Delayed", 
        [4] = "Offset"
    });
    v330.jitteramount_l:depend(v245.enable, v327, v328, v329, v331, {
        [1] = nil, 
        [2] = true, 
        [1] = v330.LandR
    }, {
        [1] = nil, 
        [2] = nil, 
        [3] = nil, 
        [4] = "Delayed V2", 
        [1] = v330.jittertype, 
        [2] = "Center", 
        [3] = "Delayed"
    });
    v330.jitteramount_r:depend(v245.enable, v327, v328, v329, v331, {
        [1] = nil, 
        [2] = true, 
        [1] = v330.LandR
    }, {
        [1] = nil, 
        [2] = nil, 
        [3] = nil, 
        [4] = "Delayed V2", 
        [1] = v330.jittertype, 
        [2] = "Center", 
        [3] = "Delayed"
    });
    v330.ways:depend(v245.enable, v327, v328, v329, v331, {
        [1] = nil, 
        [2] = "X-Ways", 
        [1] = v330.jittertype
    });
    v330.ways_range:depend(v245.enable, v327, v328, v329, v331, {
        [1] = nil, 
        [2] = "X-Ways", 
        [1] = v330.jittertype
    });
    v330.ways_invert:depend(v245.enable, v327, v328, v329, v331, {
        [1] = nil, 
        [2] = "X-Ways", 
        [1] = v330.jittertype
    });
    v330.fake:depend(v245.enable, v327, v328, v329, v331);
    v330.fake_angle_l:depend(v245.enable, v327, v328, v329, v331, {
        [1] = nil, 
        [2] = nil, 
        [3] = "Jitter", 
        [1] = v330.fake, 
        [2] = "Static"
    });
    v330.fake_angle_r:depend(v245.enable, v327, v328, v329, v331, {
        [1] = nil, 
        [2] = nil, 
        [3] = "Jitter", 
        [1] = v330.fake, 
        [2] = "Static"
    });
    v330.sync:depend(v245.enable, v327, v328, v329, v331, {
        [1] = nil, 
        [2] = nil, 
        [3] = "Jitter", 
        [1] = v330.fake, 
        [2] = "Static"
    });
    v330.invert_fake:depend(v245.enable, v327, v328, v329, v331, {
        [1] = nil, 
        [2] = nil, 
        [3] = "Jitter", 
        [1] = v330.fake, 
        [2] = "Static"
    });
    v330.diff_fake:depend(v245.enable, v327, v328, v329, v331, {
        [1] = nil, 
        [2] = "Static", 
        [1] = v330.fake
    });
    v330.allow_defensive:depend(v245.enable, v327, v328, v329, v331);
end;
local v332 = {
    Hitchance = "Hitchance", 
    ["Hide Shots"] = "On shot anti-aim", 
    ["Force Thirdperson"] = "Thirdperson", 
    ["Double Tap"] = "Double tap", 
    ["Safe Points"] = "Safe points", 
    ["Yaw Base"] = "Yaw base", 
    ["Peek Assist"] = "Auto Peek", 
    ["Fake Duck"] = "Fake Duck", 
    ["Body Aim"] = "Force body aim", 
    ["Fake Latency"] = "Ping spike", 
    ["Slow Walk"] = "Slow motion", 
    ["Edge Jump"] = "Jump at edge", 
    ["Min. Damage"] = "Damage override"
};
v185.get_velocity = function(v333)
    local l_m_vecVelocity_0 = entity.get(v333).m_vecVelocity;
    local l_x_0 = l_m_vecVelocity_0.x;
    local l_y_0 = l_m_vecVelocity_0.y;
    local l_z_0 = l_m_vecVelocity_0.z;
    return (vector(l_x_0, l_y_0, l_z_0):length2d());
end;
local v338 = {
    dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    ap = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist")
};
local v339 = {
    trigger = false, 
    breaklc = false, 
    act = false, 
    iteration_count = 0, 
    toggle_var = false, 
    freestanding = false, 
    height_diff = false, 
    pitch = 0, 
    abs = false, 
    flicking = false, 
    desync = false, 
    desync_value = 0, 
    roundstart = false, 
    antibackstab = false, 
    active_phase = 0, 
    left = false, 
    right = false, 
    unsafehead = false, 
    airstop = false, 
    while_def = false
};
local v340 = 1;
local v341 = 1;
local function v350()
    -- upvalues: v338 (ref), v185 (ref), v339 (ref), v340 (ref)
    local v342 = entity.get_local_player();
    if not v342 then
        return;
    elseif not v342:is_alive() then
        return;
    else
        local l_m_fFlags_0 = v342.m_fFlags;
        local v344 = v338.fd:get();
        local _ = v338.dt:get();
        local _ = v338.hs:get();
        local v347 = v338.ap:get();
        local v348 = bit.lshift(1, 1);
        local v349 = bit.lshift(1, 0);
        if bit.band(l_m_fFlags_0, v349) == 1 and v185.get_velocity(v342) >= 10 and v185.get_velocity(v342) <= 80 and bit.band(l_m_fFlags_0, v348) == 0 and not v344 and not v347 and not v339.unsafehead then
            v340 = 4;
        elseif bit.band(l_m_fFlags_0, v349) == 1 and v185.get_velocity(v342) > 80 and bit.band(l_m_fFlags_0, v348) == 0 and not v344 and not v347 and not v339.unsafehead then
            v340 = 3;
        elseif bit.band(l_m_fFlags_0, v349) == 1 and v185.get_velocity(v342) < 3 and bit.band(l_m_fFlags_0, v348) == 0 and not v344 and not v347 and not v339.unsafehead then
            v340 = 2;
        elseif bit.band(l_m_fFlags_0, v349) == 0 and bit.band(l_m_fFlags_0, v348) > 0.9 and not v344 and not v347 and not v339.unsafehead then
            v340 = 8;
        elseif (bit.band(l_m_fFlags_0, v349) == 1 and bit.band(l_m_fFlags_0, v348) > 0.9 and v185.get_velocity(v342) < 3 or v344) and not v347 and not v339.unsafehead then
            v340 = 5;
        elseif (bit.band(l_m_fFlags_0, v349) == 1 and bit.band(l_m_fFlags_0, v348) > 0.9 and v185.get_velocity(v342) > 3 or v344) and not v347 and not v339.unsafehead then
            v340 = 6;
        elseif bit.band(l_m_fFlags_0, v349) == 0 and bit.band(l_m_fFlags_0, v348) == 0 and not v344 and not v347 and not v339.unsafehead then
            v340 = 7;
        elseif v185.get_velocity(v342) < 3 and bit.band(l_m_fFlags_0, v348) == 0 and not v344 and v347 and not v339.unsafehead then
            v340 = 9;
        elseif v185.get_velocity(v342) > 3 and bit.band(l_m_fFlags_0, v348) == 0 and not v344 and v347 and not v339.unsafehead then
            v340 = 10;
        elseif v339.unsafehead and not v347 and not v344 then
            v340 = 11;
        else
            v340 = 1;
        end;
        return;
    end;
end;
local function v359()
    -- upvalues: v338 (ref), v185 (ref), v339 (ref), v341 (ref)
    local v351 = entity.get_local_player();
    if not v351 then
        return;
    elseif not v351:is_alive() then
        return;
    else
        local l_m_fFlags_1 = v351.m_fFlags;
        local v353 = v338.fd:get();
        local _ = v338.dt:get();
        local _ = v338.hs:get();
        local _ = v338.ap:get();
        local v357 = bit.lshift(1, 1);
        local v358 = bit.lshift(1, 0);
        if bit.band(l_m_fFlags_1, v358) == 1 and v185.get_velocity(v351) >= 10 and v185.get_velocity(v351) <= 80 and bit.band(l_m_fFlags_1, v357) == 0 and not v353 and not v339.unsafehead then
            v341 = 4;
        elseif bit.band(l_m_fFlags_1, v358) == 1 and v185.get_velocity(v351) > 80 and bit.band(l_m_fFlags_1, v357) == 0 and not v353 and not v339.unsafehead then
            v341 = 3;
        elseif bit.band(l_m_fFlags_1, v358) == 1 and v185.get_velocity(v351) < 3 and bit.band(l_m_fFlags_1, v357) == 0 and not v353 and not v339.unsafehead then
            v341 = 2;
        elseif bit.band(l_m_fFlags_1, v358) == 0 and bit.band(l_m_fFlags_1, v357) > 0.9 and not v353 and not v339.unsafehead then
            v341 = 8;
        elseif (bit.band(l_m_fFlags_1, v358) == 1 and bit.band(l_m_fFlags_1, v357) > 0.9 and v185.get_velocity(v351) < 3 or v353) and not v339.unsafehead then
            v341 = 5;
        elseif (bit.band(l_m_fFlags_1, v358) == 1 and bit.band(l_m_fFlags_1, v357) > 0.9 and v185.get_velocity(v351) > 3 or v353) and not v339.unsafehead then
            v341 = 6;
        elseif bit.band(l_m_fFlags_1, v358) == 0 and bit.band(l_m_fFlags_1, v357) == 0 and not v353 and not v339.unsafehead then
            v341 = 7;
        elseif v339.unsafehead and not v353 then
            v341 = 11;
        end;
        return;
    end;
end;
pitch = function(v360, v361)
    -- upvalues: v339 (ref)
    local v362 = entity.get_game_rules();
    local v363 = entity.get_local_player();
    local v364 = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch");
    local v365 = v363:get_player_weapon(false);
    if not v365 then
        return;
    else
        local v366 = v365:get_weapon_info().weapon_name:gsub("weapon_", "");
        local v367 = v366 == nil or not (v360.in_attack ~= 1) or not (v360.in_use == false) or not (v366 ~= "incgrenade") or not (v366 ~= "molotov") or not (v366 ~= "smokegrenade") or not (v366 ~= "hegrenade") or v339.act or v339.roundstart;
        if v362.m_bFreezePeriod then
            v364:override("down");
            return;
        elseif v363.m_MoveType == 8 then
            v364:override("down");
            return;
        elseif v363.m_MoveType == 9 then
            v364:override("down");
            return;
        elseif v367 then
            v364:override("down");
            return;
        elseif v360.in_use or v360.in_attack then
            v364:override("down");
            return;
        else
            local v368 = v363:get_player_weapon():get_weapon_index();
            local v369 = v363:get_player_weapon();
            if v368 == nil then
                v364:override("down");
                return;
            else
                local l_m_fThrowTime_0 = v369.m_fThrowTime;
                if l_m_fThrowTime_0 ~= nil and l_m_fThrowTime_0 > 0 then
                    v364:override("down");
                    return;
                else
                    v360.view_angles.x = v361;
                    v364:override("disabled");
                    return;
                end;
            end;
        end;
    end;
end;
local v371 = false;
local v372 = false;
defensive_trigger = function()
    -- upvalues: v185 (ref), v372 (ref)
    local v373 = entity.get_local_player();
    if not (v373 and v373:is_alive() and true or false) then
        return;
    else
        local v374 = v373:get_origin();
        if not v373:get_player_weapon(false) then
            return;
        else
            local v375 = v185.get_velocity(v373);
            entity.get_players(true, false, function(v376)
                -- upvalues: v373 (ref), v374 (ref), v375 (ref), v372 (ref)
                local v377 = v376:get_origin();
                local v378 = v376:get_hitbox_position(0);
                local v379 = v376:get_hitbox_position(3);
                if not v377 or not v378 and not v379 then
                    return;
                else
                    local v380, v381 = utils.trace_bullet(v373, v374, v377);
                    local v382 = v374 + v375;
                    local v383, v384 = utils.trace_bullet(v373, v382, v378);
                    local v385, _ = utils.trace_bullet(v373, v382, v379);
                    if v380 <= 20 and ((v383 or v385) <= 20 or (not v381.entity or v381.entity ~= v373) and (not v384.entity or v384.entity ~= v376)) then
                        v372 = false;
                    else
                        v372 = true;
                    end;
                    return;
                end;
            end);
            return;
        end;
    end;
end;
get_distance = function(v387, v388)
    if v387 == nil or v388 == nil then
        return nil;
    else
        local v389 = v387:get_origin();
        local v390 = v388:get_origin();
        if v389 == nil or v390 == nil then
            return nil;
        else
            local v391 = v390.x - v389.x;
            local v392 = v390.y - v389.y;
            local v393 = v390.z - v389.z;
            return (math.sqrt(v391 * v391 + v392 * v392 + v393 * v393));
        end;
    end;
end;
can_hit = function(v394)
    local v395 = entity.get_local_player();
    local v396, _ = utils.trace_bullet(v394, v394:get_hitbox_position(3), v395:get_hitbox_position(3));
    local v398, _ = utils.trace_bullet(v394, v395:get_hitbox_position(3), v394:get_hitbox_position(3));
    if v396 > 1 or v398 > 1 then
        return true;
    else
        return false;
    end;
end;
local v400 = 0;
local v401 = 0;
local v456 = {
    builder = function(v402)
        -- upvalues: v245 (ref), v339 (ref), v340 (ref), v400 (ref), v401 (ref), v254 (ref), v246 (ref), v341 (ref), v251 (ref), v225 (ref), v185 (ref), v224 (ref)
        local v403 = entity.get_local_player();
        if not v403 and v403:is_alive() then
            return;
        else
            local v404 = v403:get_player_weapon(false);
            if not v404 then
                return;
            else
                local v405 = v404:get_weapon_info();
                local v406 = 0;
                if v245.defensive_flick:get() then
                    return;
                else
                    local _ = false;
                    local v408 = v405.weapon_name:gsub("weapon_", "");
                    local v409 = v403.m_MoveType == 9;
                    if v408 ~= nil and v402.in_attack ~= 1 and v402.in_use == false and v408 ~= "incgrenade" and v408 ~= "molotov" and v408 ~= "smokegrenade" and v408 ~= "hegrenade" then
                        if not v409 then
                            if not v339.act then
                                local _ = v339.roundstart;
                            end;
                        else
                            local _ = v409;
                        end;
                    else
                        local _ = true;
                    end;
                    local l_v340_0 = v340;
                    v402.send_packet = true;
                    local v414 = false;
                    local v415 = entity.get_local_player().m_flPoseParameter[11] * 120 - 60 > 0;
                    local v416 = false;
                    local l_m_fFlags_2 = v403.m_fFlags;
                    local v418 = bit.lshift(1, 0);
                    if v400 == nil then
                        v400 = 0;
                    end;
                    if v401 == nil then
                        v401 = 0;
                    end;
                    if not v400 == 0 and (v400 > 5 or v254[v400] and not v254[v400].phase:get()) then
                        v400 = 0;
                    end;
                    if not v246[v340].override:get() and v340 ~= 9 then
                        l_v340_0 = 1;
                    end;
                    if v340 == 9 then
                        if not v246[9].override:get() or v246[9].override:get() and bit.band(l_m_fFlags_2, v418) == 0 then
                            l_v340_0 = v341;
                        end;
                    elseif v340 == 10 and (not v246[10].override:get() or v246[10].override:get() and bit.band(l_m_fFlags_2, v418) == 0) then
                        l_v340_0 = v341;
                    end;
                    local v419 = v246[l_v340_0];
                    if v400 == 0 then
                        v419 = v246[l_v340_0];
                    else
                        v419 = v251[v400][l_v340_0];
                    end;
                    local _ = v419.pitch:get();
                    local v421 = v419.jittertype:get();
                    local v422 = v419.fake:get();
                    v402.jitter_move = true;
                    if v339.antibackstab then
                        v339.pitch = 0;
                        v225.yaw_add:override(180);
                        v225.yaw:override("Backward");
                        return;
                    else
                        rage.exploit:allow_defensive(v419.allow_defensive:get());
                        local function v424(v423)
                            -- upvalues: v225 (ref)
                            return v225.body_left_limit:set(v423), v225.body_right_limit:set(v423);
                        end;
                        if v419.pitch:get() == "None" then
                            v339.pitch = 0;
                        elseif v419.pitch:get() == "Down" then
                            v339.pitch = 89;
                        elseif v419.pitch:get() == "Up" then
                            v339.pitch = -89;
                        elseif v419.pitch:get() == "Zero" then
                            v339.pitch = 0;
                        elseif v419.pitch:get() == "Random" then
                            v339.pitch = math.random(v419.customP:get(), v419.customP2:get());
                        elseif v419.pitch:get() == "Custom" then
                            v339.pitch = v419.customP:get();
                        elseif v419.pitch:get() == "Sway" then
                            v339.pitch = -math.fmod(globals.curtime * v419.customS:get() * 6, v419.customP:get());
                        elseif v419.pitch:get() == "Progressive Pitch" then
                            v339.pitch = math.sin(globals.realtime * v419.customS:get()) * v419.customP:get();
                        elseif v419.pitch:get() == "Jitter" then
                            v339.pitch = v185:jitter_side(v419.customS:get()) == 1 and v419.customP:get() or v419.customP2:get();
                        end;
                        if v421 == "Center" then
                            if v419.LandR:get() then
                                if not v419.jitter_new:get() then
                                    if v185:jitter_side(32) == -1 then
                                        v406 = v406 + v419.jitteramount_l:get() / 2;
                                        v339.left = false;
                                        v339.right = true;
                                    else
                                        v406 = v406 - v419.jitteramount_r:get() / 2;
                                        v339.left = true;
                                        v339.right = false;
                                    end;
                                else
                                    v406 = v415 and v406 - v419.jitteramount_r:get() / 2 or v406 + v419.jitteramount_l:get() / 2;
                                end;
                            elseif not v419.LandR:get() and v185:jitter_side(32) == -1 and not v419.jitter_new:get() then
                                v406 = v406 + v419.jitteramount:get() / 2;
                                v339.left = false;
                                v339.right = true;
                            elseif not v419.LandR:get() and v185:jitter_side(32) == 1 and not v419.jitter_new:get() then
                                v406 = v406 - v419.jitteramount:get() / 2;
                                v339.left = true;
                                v339.right = false;
                            elseif not v419.LandR:get() and v419.jitter_new:get() then
                                v406 = v415 and v406 - v419.jitteramount:get() / 2 or v406 + v419.jitteramount:get() / 2;
                            end;
                        elseif v421 == "Offset" then
                            if v185:jitter_side(30) == 1 then
                                v406 = v406 - v419.jitteramount:get() / 2;
                            else
                                v406 = 0;
                            end;
                        elseif v421 == "180" then
                            v406 = v406 + v419.jitteramount:get();
                        elseif v421 == "Delayed" then
                            if v419.LandR:get() then
                                if not v419.jitter_new:get() then
                                    if v185:jitter_side(v419.jitspeed:get()) == 1 then
                                        v406 = (v406 + v419.jitteramount_r:get() / 2) * 1;
                                        v339.left = false;
                                        v339.right = true;
                                    else
                                        v406 = (v406 + v419.jitteramount_l:get() / 2) * -1;
                                        v339.left = true;
                                        v339.right = false;
                                    end;
                                else
                                    rage.antiaim:inverter(v185:jitter_side(v419.jitspeed:get()) == 1);
                                    v406 = v415 and v406 + v419.jitteramount_r:get() / 2 * -1 or (v406 + v419.jitteramount_l:get() / 2) * 1;
                                end;
                            elseif not v419.LandR:get() then
                                if v185:jitter_side(v419.jitspeed:get()) == -1 then
                                    v339.left = false;
                                    v339.right = true;
                                else
                                    v339.left = true;
                                    v339.right = false;
                                end;
                                if not v419.jitter_new:get() then
                                    v406 = (v406 + v419.jitteramount:get() / 2) * v185:jitter_side(v419.jitspeed:get());
                                else
                                    if v416 and v185:jitter_side(v419.jitspeed:get()) == 1 then
                                        rage.antiaim:inverter(false);
                                        v416 = false;
                                    elseif not v416 and v185:jitter_side(v419.jitspeed:get()) == -1 then
                                        rage.antiaim:inverter(true);
                                        v416 = true;
                                    end;
                                    v406 = v416 and v406 + v419.jitteramount:get() / 2 * 1 or (v406 + v419.jitteramount:get() / 2) * -1;
                                end;
                            end;
                        elseif v421 == "Delayed V2" then
                            if not v419.jitter_new:get() then
                                if globals.tickcount % (v419.jitspeed:get() * 2) == 0 then
                                    v414 = not v414;
                                end;
                                v406 = v414 and v406 + v419.jitteramount_l:get() / 2 or v406 - v419.jitteramount_r:get() / 2;
                            else
                                if v416 and globals.tickcount % (v419.jitspeed:get() * 2) == 0 then
                                    rage.antiaim:inverter(false);
                                    v416 = false;
                                elseif not v416 and globals.tickcount % (v419.jitspeed:get() * 2) ~= 0 then
                                    rage.antiaim:inverter(true);
                                    v416 = true;
                                end;
                                v406 = v416 and v406 + v419.jitteramount_l:get() / 2 or v406 - v419.jitteramount_r:get() / 2;
                            end;
                        elseif v421 == "X-Ways" then
                            local v425 = v419.ways:get();
                            local v426 = v419.ways_range:get();
                            v339.iteration_count = v339.iteration_count + 1;
                            if v425 <= v339.iteration_count then
                                v339.iteration_count = 0;
                            end;
                            local v427 = v426 / (v425 - 1);
                            if not v419.ways_invert:get() then
                                v406 = v406 - (v426 / 2 - v339.iteration_count * v427);
                            else
                                v406 = v406 - (v426 / 2 - v339.iteration_count * v427) + 180;
                            end;
                        elseif v421 == "Spin" then
                            v406 = -math.fmod(globals.curtime * v419.spin_speed:get() * 6, v419.spin_value:get());
                        end;
                        if not v419.sync:get() then
                            if v422 == "Off" then
                                v339.desync = false;
                                v339.desync_value = 0;
                            elseif v422 == "Static" then
                                v339.desync = true;
                                v339.desync_value = v419.fake_angle_r:get();
                                if not v419.diff_fake:get() then
                                    v424(v339.desync_value);
                                else
                                    v225.body_right_limit:set(v419.fake_angle_r:get());
                                    v225.body_left_limit:set(v419.fake_angle_l:get());
                                end;
                            elseif v422 == "Jitter" then
                                v339.desync = true;
                                if v185:jitter_side(100) == 1 then
                                    v339.desync_value = v419.fake_angle_r:get();
                                    if not v419.diff_fake:get() then
                                        v424(v339.desync_value);
                                    else
                                        v225.body_right_limit:set(v419.fake_angle_r:get());
                                        v225.body_left_limit:set(v419.fake_angle_l:get());
                                    end;
                                else
                                    v339.desync_value = v419.fake_angle_l:get();
                                    if not v419.diff_fake:get() then
                                        v424(v339.desync_value);
                                    else
                                        v225.body_right_limit:set(v419.fake_angle_r:get() * -1);
                                        v225.body_left_limit:set(v419.fake_angle_l:get() * -1);
                                    end;
                                end;
                            elseif v422 == "Random" then
                                v339.desync = true;
                                v225.body_right_limit:set(math.random(0, 60));
                                v225.body_left_limit:set(math.random(0, 60));
                            end;
                        elseif v422 == "Off" then
                            v339.desync = true;
                            v339.desync_value = 0;
                        elseif v422 == "Static" then
                            v339.desync = true;
                            v339.desync_value = v419.fake_angle_r:get();
                            if not v419.diff_fake:get() then
                                v424(v339.desync_value);
                            else
                                v225.body_right_limit:set(v419.fake_angle_r:get());
                                v225.body_left_limit:set(v419.fake_angle_l:get());
                            end;
                        elseif v422 == "Jitter" then
                            v339.desync = true;
                            if v339.right == true then
                                v225.body_left_limit:set(not v339.right and v419.fake_angle_l:get() or 0);
                                v225.body_right_limit:set(v339.right and v419.fake_angle_r:get() or 0);
                                v225.invert:set(v339.right);
                            else
                                v225.body_left_limit:set(not v339.right and v419.fake_angle_l:get() or 0);
                                v225.body_right_limit:set(v339.right and v419.fake_angle_r:get() or 0);
                                v225.invert:set(v339.right);
                            end;
                        elseif v422 == "Random" then
                            v339.desync = true;
                            if v339.right then
                                v339.desync_value = math.random(0, 60);
                                v424(v339.desync_value);
                            else
                                v339.desync_value = math.random(0, 60);
                                v424(v339.desync_value);
                            end;
                        end;
                        if not v419.continuity:get() then
                            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):set("Disabled");
                            v225.fake_op:set(v419.fake_options:get());
                            v224.body_yaw:set(v339.desync);
                            v225.yaw_base:set(v419.yaw_base:get());
                            v225.yaw_add:set(v406);
                            if not v421 == "Delayed V2" and not v422 == "Jitter" then
                                v225.invert:set(v339.left or v419.invert_fake:get());
                            else
                                v225.invert:set(v419.invert_fake:get());
                            end;
                            v225.enable:set(true);
                            v225.yaw:set("Backward");
                            pitch(v402, v339.pitch);
                        else
                            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):set("Disabled");
                            v225.fake_op:set(v419.fake_options:get());
                            v224.body_yaw:set(v339.desync);
                            v225.yaw_base:set(v419.yaw_base:get());
                            if not v421 == "Delayed V2" and not v422 == "Jitter" then
                                v225.invert:set(v339.left or v419.invert_fake:get());
                            else
                                v225.invert:set(v419.invert_fake:get());
                            end;
                            v225.enable:set(true);
                            v225.yaw:set("Backward");
                            v225.yaw_add:set(v406);
                            v225.hidden:set(true);
                            pitch(v402, v339.pitch);
                            rage.antiaim:override_hidden_pitch(v339.pitch);
                            rage.antiaim:override_hidden_yaw_offset(v406);
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end, 
    defensive = function(v428)
        -- upvalues: v245 (ref), v340 (ref), v249 (ref), v341 (ref), v401 (ref), v254 (ref), v252 (ref), v371 (ref), v225 (ref), l_exploits_0 (ref), v372 (ref), v339 (ref), v185 (ref), v224 (ref)
        local v429 = entity.get_local_player();
        if not v429 and v429:is_alive() then
            return;
        elseif v245.defensive_flick:get() then
            return;
        elseif globals.choked_commands > 1 then
            return;
        else
            local l_v340_1 = v340;
            local l_m_fFlags_3 = v429.m_fFlags;
            local v432 = bit.lshift(1, 0);
            if v340 == 9 then
                if not v249[9].override:get() or v249[9].override:get() and bit.band(l_m_fFlags_3, v432) == 0 then
                    l_v340_1 = v341;
                end;
            elseif v340 == 10 and (not v249[10].override:get() or v249[10].override:get() and bit.band(l_m_fFlags_3, v432) == 0) then
                l_v340_1 = v341;
            end;
            local v433 = v249[v340];
            if v401 == nil then
                v401 = 0;
            end;
            if not v401 == 0 and (v401 > 5 or v254[v401] and not v254[v401].phase:get()) then
                v401 = 0;
            end;
            if v401 == 0 then
                v433 = v249[v340];
            else
                v433 = v252[v401][v340];
            end;
            local v434 = globals.tickcount % v433.def_speed:get() <= 10;
            if v401 == 0 then
                for v435 = 1, 11 do
                    if v249[v435].jittertype:get() == "Delayed V2" then
                        v249[v435].LandR:set(true);
                    end;
                    if v249[v435].jittertype:get() == "Offset" then
                        v249[v435].LandR:set(false);
                    end;
                end;
            end;
            local v436 = false;
            local _ = 0;
            local v438 = 0;
            if not v433.override:get() then
                v371 = false;
                v225.hidden:set(false);
                return;
            else
                if v433.def_type:get() == "Tick Based" and v434 and l_exploits_0.InDefensive() or v434 and v372 and v433.def_type:get() == "Predicted" and l_exploits_0.InDefensive() or v434 and rage.antiaim:get_target(true) ~= nil and v433.def_type:get() == "Edge Bait" then
                    v371 = true;
                else
                    v371 = false;
                end;
                if v433.hittable:get() and entity.get_threat(true) then
                    v371 = v371;
                elseif v433.hittable:get() and not entity.get_threat(true) then
                    v371 = false;
                else
                    v371 = v371;
                end;
                if v371 then
                    v225.hidden:set(true);
                else
                    v225.hidden:set(false);
                end;
                if v371 and v433.break_lc:get() then
                    v428.force_defensive = true;
                    v428.send_packet = false;
                else
                    v428.send_packet = true;
                    v428.force_defensive = false;
                end;
                if v339.antibackstab then
                    v339.pitch = 0;
                    v225.yaw_add:override(180);
                    v225.yaw:override("Backward");
                    return;
                elseif not v371 then
                    return;
                else
                    if v433.pitch:get() == "None" then
                        v339.pitch = 0;
                    elseif v433.pitch:get() == "Down" then
                        v339.pitch = 89;
                    elseif v433.pitch:get() == "Up" then
                        v339.pitch = -89;
                    elseif v433.pitch:get() == "Zero" then
                        v339.pitch = 0;
                    elseif v433.pitch:get() == "Random" then
                        v339.pitch = math.random(v433.customP:get(), v433.customP2:get());
                    elseif v433.pitch:get() == "Custom" then
                        v339.pitch = v433.customP:get();
                    elseif v433.pitch:get() == "Progressive Pitch" then
                        v339.pitch = -math.fmod(globals.curtime * v433.customS:get() * 6, v433.customP:get());
                    elseif v433.pitch:get() == "Sway" then
                        v339.pitch = math.sin(globals.realtime * v433.customS:get()) * v433.customP:get();
                    elseif v433.pitch:get() == "Jitter" then
                        v339.pitch = v185:jitter_side(v433.customS:get()) == 1 and v433.customP:get() or v433.customP2:get();
                    end;
                    local function v440(v439)
                        -- upvalues: v225 (ref)
                        return v225.body_left_limit:set(v439), v225.body_right_limit:set(v439);
                    end;
                    local v441 = entity.get_local_player().m_flPoseParameter[11] * 120 - 60 > 0;
                    local v442 = false;
                    local v443 = v433.jittertype:get();
                    local v444 = v433.fake:get();
                    local v445 = false;
                    if v443 == "Center" then
                        if v433.LandR:get() then
                            if not v433.jitter_new:get() then
                                if v185:jitter_side(32) == -1 then
                                    v438 = v438 + v433.jitteramount_l:get() / 2;
                                    v339.left = false;
                                    v339.right = true;
                                else
                                    v438 = v438 - v433.jitteramount_r:get() / 2;
                                    v339.left = true;
                                    v339.right = false;
                                end;
                            else
                                v438 = v441 and v438 - v433.jitteramount_r:get() / 2 or v438 + v433.jitteramount_l:get() / 2;
                            end;
                        elseif not v433.LandR:get() and v185:jitter_side(32) == -1 and not v433.jitter_new:get() then
                            v438 = v438 + v433.jitteramount:get() / 2;
                            v339.left = false;
                            v339.right = true;
                        elseif not v433.LandR:get() and v185:jitter_side(32) == 1 and not v433.jitter_new:get() then
                            v438 = v438 - v433.jitteramount:get() / 2;
                            v339.left = true;
                            v339.right = false;
                        elseif not v433.LandR:get() and v433.jitter_new:get() then
                            v438 = v441 and v438 - v433.jitteramount:get() / 2 or v438 + v433.jitteramount:get() / 2;
                        end;
                    elseif v443 == "Offset" then
                        if v185:jitter_side(30) == 1 then
                            v438 = v438 - v433.jitteramount:get() / 2;
                        else
                            v438 = 0;
                        end;
                    elseif v443 == "180" then
                        v438 = v438 + v433.jitteramount:get();
                    elseif v443 == "Delayed" then
                        if v433.LandR:get() then
                            if not v433.jitter_new:get() then
                                if v185:jitter_side(v433.jitspeed:get()) == 1 then
                                    v438 = (v438 + v433.jitteramount_r:get() / 2) * 1;
                                    v339.left = false;
                                    v339.right = true;
                                else
                                    v438 = (v438 + v433.jitteramount_l:get() / 2) * -1;
                                    v339.left = true;
                                    v339.right = false;
                                end;
                            else
                                rage.antiaim:inverter(v185:jitter_side(v433.jitspeed:get()) == 1);
                                v438 = v441 and v438 + v433.jitteramount_r:get() / 2 * -1 or (v438 + v433.jitteramount_l:get() / 2) * 1;
                            end;
                        elseif not v433.LandR:get() then
                            if v185:jitter_side(v433.jitspeed:get()) == -1 then
                                v339.left = false;
                                v339.right = true;
                            else
                                v339.left = true;
                                v339.right = false;
                            end;
                            if not v433.jitter_new:get() then
                                v438 = (v438 + v433.jitteramount:get() / 2) * v185:jitter_side(v433.jitspeed:get());
                            else
                                if v442 and v185:jitter_side(v433.jitspeed:get()) == 1 then
                                    rage.antiaim:inverter(false);
                                    v442 = false;
                                elseif not v442 and v185:jitter_side(v433.jitspeed:get()) == -1 then
                                    rage.antiaim:inverter(true);
                                    v442 = true;
                                end;
                                v438 = v442 and v438 + v433.jitteramount:get() / 2 * 1 or (v438 + v433.jitteramount:get() / 2) * -1;
                            end;
                        end;
                    elseif v443 == "Delayed V2" then
                        if not v433.jitter_new:get() then
                            if globals.tickcount % (v433.jitspeed:get() * 2) == 0 then
                                v445 = not v445;
                            end;
                            v438 = v445 and v438 + v433.jitteramount_l:get() / 2 or v438 - v433.jitteramount_r:get() / 2;
                        else
                            if v442 and globals.tickcount % (v433.jitspeed:get() * 2) == 0 then
                                rage.antiaim:inverter(false);
                                v442 = false;
                            elseif not v442 and globals.tickcount % (v433.jitspeed:get() * 2) ~= 0 then
                                rage.antiaim:inverter(true);
                                v442 = true;
                            end;
                            v438 = v442 and v438 + v433.jitteramount_l:get() / 2 or v438 - v433.jitteramount_r:get() / 2;
                        end;
                    elseif v443 == "X-Ways" then
                        local v446 = v433.ways:get();
                        local v447 = v433.ways_range:get();
                        v339.iteration_count = v339.iteration_count + 1;
                        if v446 <= v339.iteration_count then
                            v339.iteration_count = 0;
                        end;
                        local v448 = v447 / (v446 - 1);
                        if not v433.ways_invert:get() then
                            v438 = v438 - (v447 / 2 - v339.iteration_count * v448);
                        else
                            v438 = v438 - (v447 / 2 - v339.iteration_count * v448) + 180;
                        end;
                    elseif v443 == "Spin" then
                        v438 = -math.fmod(globals.curtime * v433.spin_speed:get() * 6, v433.spin_value:get());
                    end;
                    local _ = render.camera_angles();
                    v224.lag:set("Always On");
                    v224.hsopt:set("Break LC");
                    if v433.def_type:get() == "Tick Based" and not v339.antibackstab then
                        if v434 then
                            if not v433.sync:get() then
                                if v444 == "Off" then
                                    v339.desync = false;
                                    v339.desync_value = 0;
                                elseif v444 == "Static" then
                                    v339.desync = true;
                                    v339.desync_value = v433.fake_angle_r:get();
                                    if not v433.diff_fake:get() then
                                        v440(v339.desync_value);
                                    else
                                        v225.body_right_limit:set(v433.fake_angle_r:get());
                                        v225.body_left_limit:set(v433.fake_angle_l:get());
                                    end;
                                elseif v444 == "Jitter" then
                                    v339.desync = true;
                                    if v185:jitter_side(100) == 1 then
                                        v339.desync_value = v433.fake_angle_r:get();
                                        if not v433.diff_fake:get() then
                                            v440(v339.desync_value);
                                        else
                                            v225.body_right_limit:set(v433.fake_angle_r:get());
                                            v225.body_left_limit:set(v433.fake_angle_l:get());
                                        end;
                                    else
                                        v339.desync_value = v433.fake_angle_l:get();
                                        if not v433.diff_fake:get() then
                                            v440(v339.desync_value);
                                        else
                                            v225.body_right_limit:set(v433.fake_angle_r:get() * -1);
                                            v225.body_left_limit:set(v433.fake_angle_l:get() * -1);
                                        end;
                                    end;
                                elseif v444 == "Random" then
                                    v339.desync = true;
                                    v225.body_right_limit:set(math.random(0, 60));
                                    v225.body_left_limit:set(math.random(0, 60));
                                end;
                            elseif v444 == "Off" then
                                v339.desync = true;
                                v339.desync_value = 0;
                            elseif v444 == "Static" then
                                v339.desync = true;
                                v339.desync_value = v433.fake_angle_r:get();
                                if not v433.diff_fake:get() then
                                    v440(v339.desync_value);
                                else
                                    v225.body_right_limit:set(v433.fake_angle_r:get());
                                    v225.body_left_limit:set(v433.fake_angle_l:get());
                                end;
                            elseif v444 == "Jitter" then
                                v339.desync = true;
                                if v339.right == true then
                                    v225.body_left_limit:set(not v339.right and v433.fake_angle_l:get() or 0);
                                    v225.body_right_limit:set(v339.right and v433.fake_angle_r:get() or 0);
                                    v225.invert:set(v339.right);
                                else
                                    v225.body_left_limit:set(not v339.right and v433.fake_angle_l:get() or 0);
                                    v225.body_right_limit:set(v339.right and v433.fake_angle_r:get() or 0);
                                    v225.invert:set(v339.right);
                                end;
                            elseif v444 == "Random" then
                                v339.desync = true;
                                if v339.right then
                                    v339.desync_value = math.random(0, 60);
                                    v440(v339.desync_value);
                                else
                                    v339.desync_value = math.random(0, 60);
                                    v440(v339.desync_value);
                                end;
                            end;
                            v224.body_yaw:set(v433.sway_desync:get() and v436 or v339.desync);
                            v225.yaw_base:set(v249[l_v340_1].yaw_base:get());
                            if v433.disable_aa:get() and l_exploits_0.InDefensive() then
                                v225.yaw_add:set(0);
                            end;
                            rage.antiaim:override_hidden_pitch(v339.pitch);
                            rage.antiaim:override_hidden_yaw_offset(v438);
                        end;
                    elseif v433.def_type:get() == "Predicted" then
                        if v434 and v372 and not v339.antibackstab then
                            if not v433.sync:get() then
                                if v444 == "Off" then
                                    v339.desync = false;
                                    v339.desync_value = 0;
                                elseif v444 == "Static" then
                                    v339.desync = true;
                                    v339.desync_value = v433.fake_angle_r:get();
                                    if not v433.diff_fake:get() then
                                        v440(v339.desync_value);
                                    else
                                        v225.body_right_limit:set(v433.fake_angle_r:get());
                                        v225.body_left_limit:set(v433.fake_angle_l:get());
                                    end;
                                elseif v444 == "Jitter" then
                                    v339.desync = true;
                                    if v185:jitter_side(100) == 1 then
                                        v339.desync_value = v433.fake_angle_r:get();
                                        if not v433.diff_fake:get() then
                                            v440(v339.desync_value);
                                        else
                                            v225.body_right_limit:set(v433.fake_angle_r:get());
                                            v225.body_left_limit:set(v433.fake_angle_l:get());
                                        end;
                                    else
                                        v339.desync_value = v433.fake_angle_l:get();
                                        if not v433.diff_fake:get() then
                                            v440(v339.desync_value);
                                        else
                                            v225.body_right_limit:set(v433.fake_angle_r:get() * -1);
                                            v225.body_left_limit:set(v433.fake_angle_l:get() * -1);
                                        end;
                                    end;
                                elseif v444 == "Random" then
                                    v339.desync = true;
                                    v225.body_right_limit:set(math.random(0, 60));
                                    v225.body_left_limit:set(math.random(0, 60));
                                end;
                            elseif v444 == "Off" then
                                v339.desync = true;
                                v339.desync_value = 0;
                            elseif v444 == "Static" then
                                v339.desync = true;
                                v339.desync_value = v433.fake_angle_r:get();
                                if not v433.diff_fake:get() then
                                    v440(v339.desync_value);
                                else
                                    v225.body_right_limit:set(v433.fake_angle_r:get());
                                    v225.body_left_limit:set(v433.fake_angle_l:get());
                                end;
                            elseif v444 == "Jitter" then
                                v339.desync = true;
                                if v339.right == true then
                                    v225.body_left_limit:set(not v339.right and v433.fake_angle_l:get() or 0);
                                    v225.body_right_limit:set(v339.right and v433.fake_angle_r:get() or 0);
                                    v225.invert:set(v339.right);
                                else
                                    v225.body_left_limit:set(not v339.right and v433.fake_angle_l:get() or 0);
                                    v225.body_right_limit:set(v339.right and v433.fake_angle_r:get() or 0);
                                    v225.invert:set(v339.right);
                                end;
                            elseif v444 == "Random" then
                                v339.desync = true;
                                if v339.right then
                                    v339.desync_value = math.random(0, 60);
                                    v440(v339.desync_value);
                                else
                                    v339.desync_value = math.random(0, 60);
                                    v440(v339.desync_value);
                                end;
                            end;
                            v224.body_yaw:set(v433.sway_desync:get() and v436 or v339.desync);
                            v225.yaw_base:set(v249[l_v340_1].yaw_base:get());
                            if v433.disable_aa:get() and l_exploits_0.InDefensive() then
                                v225.yaw_add:set(0);
                            end;
                            rage.antiaim:override_hidden_pitch(v339.pitch);
                            rage.antiaim:override_hidden_yaw_offset(v438);
                        end;
                    elseif v433.def_type:get() == "Edge Bait" and v434 and rage.antiaim:get_target(true) ~= nil and not v339.antibackstab then
                        if not v433.sync:get() then
                            if v444 == "Off" then
                                v339.desync = false;
                                v339.desync_value = 0;
                            elseif v444 == "Static" then
                                v339.desync = true;
                                v339.desync_value = v433.fake_angle_r:get();
                                if not v433.diff_fake:get() then
                                    v440(v339.desync_value);
                                else
                                    v225.body_right_limit:set(v433.fake_angle_r:get());
                                    v225.body_left_limit:set(v433.fake_angle_l:get());
                                end;
                            elseif v444 == "Jitter" then
                                v339.desync = true;
                                if v185:jitter_side(100) == 1 then
                                    v339.desync_value = v433.fake_angle_r:get();
                                    if not v433.diff_fake:get() then
                                        v440(v339.desync_value);
                                    else
                                        v225.body_right_limit:set(v433.fake_angle_r:get());
                                        v225.body_left_limit:set(v433.fake_angle_l:get());
                                    end;
                                else
                                    v339.desync_value = v433.fake_angle_l:get();
                                    if not v433.diff_fake:get() then
                                        v440(v339.desync_value);
                                    else
                                        v225.body_right_limit:set(v433.fake_angle_r:get() * -1);
                                        v225.body_left_limit:set(v433.fake_angle_l:get() * -1);
                                    end;
                                end;
                            elseif v444 == "Random" then
                                v339.desync = true;
                                v225.body_right_limit:set(math.random(0, 60));
                                v225.body_left_limit:set(math.random(0, 60));
                            end;
                        elseif v444 == "Off" then
                            v339.desync = true;
                            v339.desync_value = 0;
                        elseif v444 == "Static" then
                            v339.desync = true;
                            v339.desync_value = v433.fake_angle_r:get();
                            if not v433.diff_fake:get() then
                                v440(v339.desync_value);
                            else
                                v225.body_right_limit:set(v433.fake_angle_r:get());
                                v225.body_left_limit:set(v433.fake_angle_l:get());
                            end;
                        elseif v444 == "Jitter" then
                            v339.desync = true;
                            if v339.right == true then
                                v225.body_left_limit:set(not v339.right and v433.fake_angle_l:get() or 0);
                                v225.body_right_limit:set(v339.right and v433.fake_angle_r:get() or 0);
                                v225.invert:set(v339.right);
                            else
                                v225.body_left_limit:set(not v339.right and v433.fake_angle_l:get() or 0);
                                v225.body_right_limit:set(v339.right and v433.fake_angle_r:get() or 0);
                                v225.invert:set(v339.right);
                            end;
                        elseif v444 == "Random" then
                            v339.desync = true;
                            if v339.right then
                                v339.desync_value = math.random(0, 60);
                                v440(v339.desync_value);
                            else
                                v339.desync_value = math.random(0, 60);
                                v440(v339.desync_value);
                            end;
                        end;
                        v224.body_yaw:set(v433.sway_desync:get() and v436 or v339.desync);
                        v225.yaw_base:set(v249[l_v340_1].yaw_base:get());
                        if v433.disable_aa:get() and l_exploits_0.InDefensive() then
                            v225.yaw_add:set(0);
                        end;
                        rage.antiaim:override_hidden_pitch(v339.pitch);
                        rage.antiaim:override_hidden_yaw_offset(v438);
                    end;
                    return;
                end;
            end;
        end;
    end, 
    defensive_flick = function(v450)
        -- upvalues: v245 (ref), l_exploits_0 (ref)
        local v451 = {
            yawoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
            hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
            modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
            modoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
            bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
            leftlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
            rightlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
            options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
            fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
            dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
            hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
            hslag = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
            dtlag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options")
        };
        if not v245.defensive_flick:get() then
            return;
        else
            local v452 = v245.defensive_flick.safe_pitch:get() == "Up" and -89 or v245.defensive_flick.safe_pitch:get() == "Zero" and 0 or v245.defensive_flick.safe_pitch:get() == "Down" and 89 or v245.defensive_flick.safe_pitch:get() == "Random" and math.random(v245.defensive_flick.pitch_s1:get(), v245.defensive_flick.pitch_s2:get()) or v245.defensive_flick.safe_pitch:get() == "Custom" and v245.defensive_flick.pitch_s1:get();
            pitch(v450, 89);
            if v245.defensive_flick.flick_type:get() == "Maniak" then
                if rage.exploit:get() < 1 then
                    return;
                else
                    local _ = v450.command_number % 15 >= 10;
                    v451.hidden:override(false);
                    if not v245.defensive_flick.reverse_defensive:get() then
                        v451.modoffset:set(180);
                    else
                        v451.modoffset:set(180);
                    end;
                    v451.leftlimit:override(55);
                    v451.rightlimit:override(55);
                    if l_exploits_0.InDefensive() and v245.defensive_flick.static:get() then
                        v451.modoffset:set(0);
                    else
                        v451.modoffset:set(v245.defensive_flick.safe_yaw:get());
                    end;
                    if l_exploits_0.InDefensive() then
                        v451.dtlag:set("Always On");
                        v451.hslag:set("Break LC");
                        v451.leftlimit:override(math.random(10, 60));
                        v451.rightlimit:override(math.random(10, 60));
                        rage.antiaim:inverter(v451.rightlimit:get() > v451.leftlimit:get());
                        v451.hidden:override(true);
                        rage.antiaim:override_hidden_pitch(v452);
                        if not v245.defensive_flick.reverse_defensive:get() then
                            rage.antiaim:override_hidden_yaw_offset(v245.defensive_flick.safe_yaw:get() * -1);
                        else
                            rage.antiaim:override_hidden_yaw_offset(v245.defensive_flick.safe_yaw:get());
                        end;
                        v450.send_packet = false;
                    end;
                end;
            elseif v245.defensive_flick.flick_type:get() == "Maniak V2" then
                if rage.exploit:get() < 1 then
                    return;
                else
                    local _ = math.random(0, 89);
                    local _ = math.random(-89, 0);
                    rage.antiaim:inverter(true);
                    v451.yawoffset:override(5);
                    v451.modifier:override("Random");
                    if not v245.defensive_flick.reverse_defensive:get() then
                        v451.modoffset:set(v245.defensive_flick.safe_yaw:get());
                    else
                        v451.modoffset:set(utils.random_int(-50, -60) or 90);
                        v451.modoffset:set(-90);
                    end;
                    v451.bodyyaw:override(true);
                    v451.options:override("");
                    v451.leftlimit:override(50);
                    v451.rightlimit:override(50);
                    v451.fs:override(false);
                    v451.hidden:override(true);
                    if l_exploits_0.InDefensive() and v245.defensive_flick.static:get() then
                        v451.modoffset:set(0);
                    else
                        v451.modoffset:set(v245.defensive_flick.safe_yaw:get());
                    end;
                    rage.antiaim:override_hidden_pitch(v452);
                    if not v245.defensive_flick.reverse_defensive:get() then
                        rage.antiaim:override_hidden_yaw_offset(utils.random_int(-50, -60) or 90);
                        rage.antiaim:override_hidden_yaw_offset(-90);
                    else
                        rage.antiaim:override_hidden_yaw_offset(v245.defensive_flick.safe_yaw:get());
                    end;
                    v451.hslag:override("Break LC");
                    v451.dtlag:override("Always On");
                    v450.force_defensive = v450.command_number % 15 == 0 or v450.random_seed % 20 == 15;
                end;
            elseif v245.defensive_flick.flick_type:get() == "Leak" then
                rage.antiaim:inverter(false);
                v451.yawoffset:override(5);
                v451.modifier:override("Random");
                if not v245.defensive_flick.reverse_defensive:get() then
                    v451.modoffset:override(v245.defensive_flick.safe_yaw:get());
                else
                    v451.modoffset:override(-90);
                end;
                if l_exploits_0.InDefensive() and v245.defensive_flick.static:get() then
                    v451.modoffset:set(0);
                else
                    v451.modoffset:set(v245.defensive_flick.safe_yaw:get());
                end;
                v451.bodyyaw:override(true);
                v451.options:override("");
                v451.leftlimit:override(60);
                v451.rightlimit:override(60);
                v451.fs:override(false);
                v451.hidden:override(true);
                rage.antiaim:override_hidden_pitch(v452);
                if not v245.defensive_flick.reverse_defensive:get() then
                    rage.antiaim:override_hidden_yaw_offset(-90);
                else
                    rage.antiaim:override_hidden_yaw_offset(v245.defensive_flick.safe_yaw:get());
                end;
                v451.hslag:override("Break LC");
                v451.dtlag:override("Always On");
                v450.force_defensive = v450.command_number % 7 == 0;
            end;
            return;
        end;
    end
};
local v483 = {
    backstab = function()
        -- upvalues: v245 (ref), v339 (ref)
        local v457 = entity.get_local_player();
        if not (v457 and v457:is_alive() and true or false) then
            return;
        elseif not v245.aa_tweaks_backstab:get() then
            v339.antibackstab = false;
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"):override(false);
            return;
        else
            if v245.aa_tweaks_backstab.mode:get() == "Cheat Base" then
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"):override(true);
                v339.antibackstab = false;
            elseif v245.aa_tweaks_backstab.mode:get() == "Custom" then
                entity.get_players(true, false, function(v458)
                    -- upvalues: v457 (ref), v339 (ref)
                    local v459 = v457:get_origin():dist(v458:get_origin());
                    if v457:get_player_weapon():get_classname() == "CKnife" and v459 <= 256 then
                        v339.antibackstab = true;
                    else
                        v339.antibackstab = false;
                    end;
                    if not v458 or v458:is_dormant() then
                        v339.antibackstab = false;
                    end;
                end);
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"):override(false);
            end;
            return;
        end;
    end, 
    safehead = function()
        -- upvalues: v339 (ref), v245 (ref)
        local v460 = entity.get_local_player();
        if not (v460 and v460:is_alive() and true or false) then
            return;
        else
            local v461 = v460:get_player_weapon(false);
            if not v461 then
                return;
            else
                local v462 = v461:get_weapon_info().weapon_name:gsub("weapon_", "");
                local v463 = v460.m_fFlags == 262;
                if not entity.get_threat() then
                    v339.unsafehead = false;
                    v339.height_diff = false;
                end;
                local v464 = v245.aa_tweaks_head.hittable:get();
                local v465 = entity.get_threat();
                if v464 and entity.get_threat() then
                    v465 = entity.get_threat(true);
                else
                    v465 = entity.get_threat();
                end;
                if not v465 then
                    v339.height_diff = false;
                    v339.unsafehead = false;
                end;
                if v465 ~= nil then
                    local v466 = v465.get_origin(v465).z + 64 < v460:get_origin().z;
                    local v467 = v465.get_origin(v465).z - 64 > v460:get_origin().z;
                    if v466 and v245.aa_tweaks_head.height_diff:get("Up") or v467 and v245.aa_tweaks_head.height_diff:get("Down") then
                        v339.height_diff = true;
                    else
                        v339.height_diff = false;
                    end;
                    if v245.aa_tweaks_head:get() and (v245.aa_tweaks_head.mode:get("Knife") and v462 == "knife" or v245.aa_tweaks_head.mode:get("Zeus") and v462 == "taser" or v245.aa_tweaks_head.mode:get("Height Difference") and v339.height_diff) and not v339.antibackstab then
                        if v463 or v339.height_diff then
                            v339.unsafehead = true;
                        else
                            v339.unsafehead = false;
                        end;
                    else
                        v339.unsafehead = false;
                    end;
                end;
                return;
            end;
        end;
    end, 
    freestanding_custom = function()
        -- upvalues: v245 (ref), v185 (ref), v339 (ref), v224 (ref)
        local v468 = entity.get_local_player();
        if not v468 then
            return;
        elseif not v468:is_alive() then
            return;
        else
            local l_m_fFlags_4 = v468.m_fFlags;
            local v470 = bit.lshift(1, 1);
            local v471 = bit.lshift(1, 0);
            if v245.freestanding.disablers:get("Slowwalk") and bit.band(l_m_fFlags_4, v471) == 1 and v185.get_velocity(v468) >= 10 and v185.get_velocity(v468) <= 80 and not v339.unsafehead or v245.freestanding.disablers:get("Air") and bit.band(l_m_fFlags_4, v471) == 0 and not v339.unsafehead or v245.freestanding.disablers:get("Crouch") and bit.band(l_m_fFlags_4, v470) > 0.9 and not v339.unsafehead or v245.freestanding.disablers:get("Safehead") and v339.unsafehead then
                v339.freestanding = false;
            else
                v339.freestanding = true;
            end;
            if v245.freestanding:get() and v339.freestanding then
                v224.Freestanding:set(true);
            else
                v224.Freestanding:set(false);
            end;
            return;
        end;
    end, 
    advanced_lag_peek = function(v472)
        -- upvalues: v245 (ref)
        local v473 = entity.get_local_player();
        if not v473 or not v473:is_alive() then
            return;
        else
            local v474 = v473:get_player_weapon(false);
            if not v474 then
                return;
            else
                local l_m_fLastShotTime_0 = v474.m_fLastShotTime;
                local v476 = globals.curtime - l_m_fLastShotTime_0;
                local _ = 0;
                local v478 = false;
                if v245.advanced_lag_peek:get() then
                    if v245.advanced_lag_peek.when:get("Peeking") and rage.antiaim:get_target(true) ~= nil or v245.advanced_lag_peek.when:get("Hittable") and entity.get_threat(true) or v245.advanced_lag_peek.when:get("Shooting") and v476 <= 0.025 then
                        if v245.advanced_lag_peek.options:get("Defensive") then
                            v472.force_defensive = true;
                        end;
                        if v245.advanced_lag_peek.options:get("FakeLag") then
                            ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override(14);
                            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override(7);
                        end;
                        rage.exploit:allow_charge(true);
                        rage.exploit:allow_defensive(true);
                        rage.exploit:force_charge();
                        v478 = true;
                    else
                        ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):override();
                        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override();
                    end;
                end;
                return;
            end;
        end;
    end, 
    bruteforce_advanced = function()
        -- upvalues: v400 (ref), v401 (ref), v254 (ref), v245 (ref)
        local v479 = false;
        local v480 = false;
        local v481 = false;
        local v482 = false;
        if not v400 or v400 < 0 then
            v400 = 0;
        end;
        if not v401 or v401 < 0 then
            v401 = 0;
        end;
        if v400 > 5 or not v254[v400] or not v254[v400].phase:get() then
            v400 = 0;
        end;
        if v401 > 5 or not v254[v401] or not v254[v401].phase:get() then
            v401 = 0;
        end;
        if v245.bruteforce_options:get() then
            if v245.bruteforce_options.reset_aa:get("Every x seconds") then
                utils.execute_after(v245.bruteforce_options.reset_time:get(), function()
                    -- upvalues: v400 (ref), v245 (ref)
                    v400 = v245.bruteforce_options.reset_options_normal:get("Active Phase=0") and 0 or v400 - 1;
                    if v400 < 0 then
                        v400 = 0;
                    end;
                end);
            end;
            if v245.bruteforce_options.reset_aa:get("Edge Bait") then
                if rage.antiaim:get_target(true) ~= nil and not v479 then
                    v479 = true;
                    v401 = v245.bruteforce_options.reset_options_defensive:get("Active Phase=0") and 0 or v401 - 1;
                    v400 = v245.bruteforce_options.reset_options_normal:get("Active Phase=0") and 0 or v400 - 1;
                    if v401 < 0 then
                        v401 = 0;
                    end;
                    if v401 > 5 then
                        v401 = 0;
                    end;
                    if v400 < 0 then
                        v400 = 0;
                    end;
                    if v400 > 5 then
                        v400 = 0;
                    end;
                end;
                if v479 and rage.antiaim:get_target(true) == nil then
                    v479 = false;
                end;
            end;
            if v245.bruteforce_options.reset_aa:get("Not Edge Bait") then
                if rage.antiaim:get_target(true) == nil and not v480 then
                    v480 = true;
                    v401 = v245.bruteforce_options.reset_options_defensive:get("Active Phase=0") and 0 or v401 - 1;
                    v400 = v245.bruteforce_options.reset_options_normal:get("Active Phase=0") and 0 or v400 - 1;
                    if v401 < 0 then
                        v401 = 0;
                    end;
                    if v401 > 5 then
                        v401 = 0;
                    end;
                    if v400 < 0 then
                        v400 = 0;
                    end;
                    if v400 > 5 then
                        v400 = 0;
                    end;
                end;
                if v480 and rage.antiaim:get_target(true) ~= nil then
                    v480 = false;
                end;
            end;
            if v245.bruteforce_options.activate:get("Edge Bait") then
                if rage.antiaim:get_target(true) ~= nil and not v481 then
                    v481 = true;
                    v400 = v400 + 1;
                    v401 = v401 + 1;
                    if v401 < 0 then
                        v401 = 0;
                    end;
                    if v401 > 5 then
                        v401 = 0;
                    end;
                    if v400 < 0 then
                        v400 = 0;
                    end;
                    if v400 > 5 then
                        v400 = 0;
                    end;
                end;
                if v481 and rage.antiaim:get_target(true) == nil then
                    v481 = false;
                end;
            end;
            if v245.bruteforce_options.activate:get("Not Edge Bait") then
                if rage.antiaim:get_target(true) == nil and not v482 and v481 then
                    v482 = true;
                    v481 = false;
                    v400 = v400 + 1;
                    v401 = v401 + 1;
                    if v401 < 0 then
                        v401 = 0;
                    end;
                    if v401 > 5 then
                        v401 = 0;
                    end;
                    if v400 < 0 then
                        v400 = 0;
                    end;
                    if v400 > 5 then
                        v400 = 0;
                    end;
                end;
                if v481 and rage.antiaim:get_target(true) ~= nil then
                    v482 = false;
                end;
            end;
        end;
    end
};
events.round_end:set(function()
    -- upvalues: v245 (ref), v400 (ref), v401 (ref)
    if v245.bruteforce_options:get() and v245.bruteforce_options.reset_aa:get("Round End") then
        v400 = v245.bruteforce_options.reset_options_normal:get("Active Phase=0") and 0 or v400 - 1;
        v401 = v245.bruteforce_options.reset_options_normal:get("Active Phase=0") and 0 or v400 - 1;
        if v400 < 0 then
            v400 = 0;
        end;
        if v401 < 0 then
            v401 = 0;
        end;
    end;
end);
events.aim_ack:set(function(v484)
    -- upvalues: v400 (ref), v401 (ref), v245 (ref)
    if not v400 then
        v400 = 0;
        v401 = 0;
    end;
    if v484.state and v245.bruteforce_options.activate:get("On Miss") then
        v400 = v400 + 1;
        v401 = v401 + 1;
    end;
    if not v484.state and v245.bruteforce_options.activate:get("On Hit") then
        v400 = v400 + 1;
        v401 = v401 + 1;
    end;
end);
events.bullet_fire:set(function(v485)
    -- upvalues: v400 (ref), v401 (ref), v254 (ref)
    local v486 = entity.get_local_player();
    if not v486 or not v486:is_alive() then
        return;
    else
        local v487 = entity.get(v485.entity);
        if not v487 or not v487:is_player() then
            return;
        else
            local v488 = v487:get_eye_position();
            local v489 = v486:get_eye_position();
            local l_origin_0 = v485.origin;
            local v491 = (v489 - v488):angles();
            local v492 = (l_origin_0 - v488):angles();
            local v493 = 30;
            local v494 = 30;
            if math.abs(v491.y - v492.y) <= v493 and math.abs(v491.x - v492.x) <= v494 then
                v400 = v400 + 1;
                v401 = v401 + 1;
                while v400 > 5 or v254[v400].phase and not v254[v400].phase:get() do
                    v400 = v400 + 1;
                    if v400 > 5 then
                        v400 = 0;
                        break;
                    end;
                end;
                while v401 > 5 or v254[v401].phase and not v254[v401].phase:get() do
                    v401 = v401 + 1;
                    if v401 > 5 then
                        v401 = 0;
                        break;
                    end;
                end;
            end;
            return;
        end;
    end;
end);
events.createmove:set(function(v495)
    -- upvalues: v483 (ref), v245 (ref), v456 (ref)
    v483.backstab();
    v483.safehead();
    v483.freestanding_custom();
    v483.advanced_lag_peek(v495);
    v483.bruteforce_advanced();
    defensive_trigger();
    if v245.enable:get() then
        v456.builder(v495);
        v456.defensive(v495);
        v456.defensive_flick(v495);
    end;
end);
viewaspect = function()
    -- upvalues: v247 (ref), v138 (ref)
    cvar.viewmodel_fov:float(v247.viewmodel:get() and v138:new("fov", v247.viewmodel.fov:get()) or 68, true);
    cvar.viewmodel_offset_x:float(v247.viewmodel:get() and v138:new("fovx", v247.viewmodel.x:get()) or 0, true);
    cvar.viewmodel_offset_y:float(v247.viewmodel:get() and v138:new("fovy", v247.viewmodel.y:get()) or 0, true);
    cvar.viewmodel_offset_z:float(v247.viewmodel:get() and v138:new("fovz", v247.viewmodel.z:get()) or 0, true);
    cvar.r_aspectratio:float(v247.aspect_ratio:get() and v138:new("aspect_ratio", v247.aspect_ratio.aspect:get() / 100) or 1.5);
end;
local v496 = 0;
local v497 = 1;
damage_indicator = function()
    -- upvalues: v247 (ref), v497 (ref), v211 (ref), v496 (ref), v186 (ref), v222 (ref), v185 (ref)
    local v498 = {
        x = render.screen_size().x, 
        y = render.screen_size().y
    };
    if entity.get_local_player() == nil then
        return;
    else
        local v499 = false;
        local v500 = 0;
        local v501 = v247.crosshair_indicators:get();
        local v502 = v247.crosshair_indicators.damage_ind:get();
        local v503 = v247.crosshair_indicators.dmg_color:get();
        local v504 = ui.get_binds();
        for _, v506 in pairs(v504) do
            if v506.active and v506.name == "Min. Damage" then
                v499 = v506.active;
                v500 = v506.value;
            end;
        end;
        if v247.crosshair_indicators.font:get() == "Bold" then
            v497 = 4;
        elseif v247.crosshair_indicators.font:get() == "Pixel" then
            v497 = 2;
        elseif v247.crosshair_indicators.font:get() == "Blind" then
            v497 = v211.verdana_blind;
        end;
        v496 = v186(v496, tostring(v222.mindmg:get()), 0.04);
        local v507 = tostring(v222.mindmg:get()) == 0 and "AUTO" or tostring(math.floor(v496 + 0.5));
        local v508 = v185.animations:animate("damage_ind", not v501, 12);
        local v509 = v185.animations:animate("damage_ind_style1", v502 ~= "Always On", 12);
        local v510 = v185.animations:animate("damage_ind_style2", v502 ~= "Damage override" or not v499, 12);
        render.text(v497, vector(v498.x / 2 + 5, v498.y / 2 - 15), color(v503.r, v503.g, v503.b, 255 * v508 * v509), nil, v507);
        local v511 = v185.animations:animate("damage_ind_ena", not v499, 12);
        render.text(v497, vector(v498.x / 2 + 5, v498.y / 2 - 15), color(v503.r, v503.g, v503.b, 255 * v508 * v511 * v510), nil, v500);
        return;
    end;
end;
side_ind = function()
    -- upvalues: v247 (ref), v235 (ref), v222 (ref), v221 (ref)
    if not v247.side_indicators:get() then
        return;
    else
        local v512 = entity.get_local_player();
        if v512 == nil then
            return;
        else
            local v513 = entity.get_entities("CPlantedC4", true)[1];
            local v514 = "";
            local v515 = 0;
            local v516 = false;
            local v517 = 0;
            local v518 = 0;
            local v519 = false;
            if v513 ~= nil then
                v515 = v513.m_flC4Blow - globals.curtime;
                v516 = v513.m_bBombDefused;
                if v515 > 0 and not v516 then
                    local v520 = v513.m_hBombDefuser ~= 4294967295;
                    local l_m_flDefuseLength_0 = v513.m_flDefuseLength;
                    local v522 = v520 and v513.m_flDefuseCountDown - globals.curtime or -1;
                    if v522 > 0 then
                        local v523 = v522 < v515 and color(58, 191, 54, 160) or color(252, 18, 19, 125);
                        local v524 = (render.screen_size().y - 50) / l_m_flDefuseLength_0 * v522;
                        render.rect(vector(0, 0), vector(16, render.screen_size().y), color(25, 25, 25, 160));
                        render.rect_outline(vector(0, 0), vector(16, render.screen_size().y), color(25, 25, 25, 160));
                        render.rect(vector(0, render.screen_size().y - v524), vector(16, render.screen_size().y), v523);
                    end;
                    v514 = v513.m_nBombSite == 0 and "A" or "B";
                    local l_m_vecOrigin_0 = v513.m_vecOrigin;
                    if v512.m_hObserverTarget and (v512.m_iObserverMode == 4 or v512.m_iObserverMode == 5) then
                        lLoc = v512.m_hObserverTarget.m_vecOrigin;
                        health = v512.m_hObserverTarget.m_iHealth;
                        armor = v512.m_hObserverTarget.m_ArmorValue;
                    else
                        lLoc = v512.m_vecOrigin;
                        health = v512.m_iHealth;
                        armor = v512.m_ArmorValue;
                    end;
                    if armor == nil then
                        return;
                    elseif health == nil then
                        return;
                    elseif lLoc == nil then
                        return;
                    else
                        local v526 = l_m_vecOrigin_0:dist(lLoc);
                        local v527 = 450.7;
                        local v528 = (v526 - 75.68) / 789.2;
                        v517 = v527 * math.exp(-v528 * v528);
                        if armor > 0 then
                            local v529 = v517 * 0.5;
                            local v530 = (v517 - v529) * 0.5;
                            if armor < v530 then
                                armor = armor * 2;
                                v529 = v517 - v530;
                            end;
                            v517 = v529;
                        end;
                        v518 = math.ceil(v517);
                        v519 = health <= v518;
                    end;
                end;
            end;
            if v235.planting then
                v235.fill = 3.125 - (3.125 + v235.on_plant_time - globals.curtime);
                if v235.fill > 3.125 then
                    v235.fill = 3.125;
                end;
            end;
            local v531 = 40;
            local v532 = 0;
            local v533 = false;
            for _, v535 in ipairs(entity.get_players(true)) do
                if v535 == nil then
                    v533 = false;
                end;
                if v535 ~= nil and v535:is_enemy() and v535:is_dormant() then
                    v533 = true;
                else
                    v533 = false;
                end;
            end;
            local v536 = false;
            local v537 = false;
            local v538 = 0;
            local v539 = 0;
            local v540 = ui.get_binds();
            for _, v542 in pairs(v540) do
                if v542.active and v542.name == "Min. Damage" then
                    v536 = true;
                    if v247.side_indicators.show_value:get("Override damage value") then
                        v539 = v542.value;
                    end;
                end;
                if v542.active and v542.name == "Hit Chance" then
                    v537 = true;
                    if v247.side_indicators.show_value:get("Override hitchance value") then
                        v538 = v542.value;
                    end;
                end;
            end;
            local v543 = "MD";
            local v544 = "Hitchance";
            if v247.side_indicators.show_value:get("Override damage value") then
                v543 = "MD : " .. v539;
            else
                v543 = "MD";
            end;
            if v247.side_indicators.show_value:get("Override hitchance value") then
                v544 = "HC : " .. v538;
            else
                v544 = "HC";
            end;
            local v545 = {
                [1] = {
                    "PING", 
                    v512:is_alive() and ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):get() > 0 and v512:is_alive(), 
                    color(163, 194, 43)
                }, 
                [2] = {
                    "BODY", 
                    v512:is_alive() and v222.body_aim:get() == "Force", 
                    color(200, 199, 197)
                }, 
                [3] = {
                    [1] = "DT", 
                    [2] = v512:is_alive() and ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() and not ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get(), 
                    [3] = rage.exploit:get() == 1 and color(200, 199, 197) or color(255, 0, 50)
                }, 
                [4] = {
                    [1] = "DA", 
                    [2] = v512:is_alive() and ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"):get(), 
                    [3] = v533 == true and color(200, 199, 197) or color(255, 0, 50)
                }, 
                [5] = {
                    "DUCK", 
                    v512:is_alive() and ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get(), 
                    color(200, 199, 197)
                }, 
                [6] = {
                    v544, 
                    v512:is_alive() and v537 == true, 
                    color(200, 199, 197)
                }, 
                [7] = {
                    v543, 
                    v512:is_alive() and v536 == true, 
                    color(200, 199, 197)
                }, 
                [8] = {
                    "FS", 
                    v512:is_alive() and ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):get(), 
                    color(200, 199, 197)
                }, 
                [9] = {
                    [1] = nil, 
                    [2] = nil, 
                    [3] = nil, 
                    [4] = nil, 
                    [5] = nil, 
                    [6] = true, 
                    [1] = "        " .. v514 .. " - " .. string.format("%.1f", v515) .. "s", 
                    [2] = v515 > 0 and not v516, 
                    [3] = color(200, 199, 197)
                }, 
                [10] = {
                    "FATAL", 
                    v519, 
                    color(255, 0, 50, 255)
                }, 
                [11] = {
                    "-" .. v518 .. " HP", 
                    not v519 and v517 > 0.5, 
                    color(210, 216, 112, 255)
                }, 
                [12] = {
                    [1] = nil, 
                    [2] = nil, 
                    [3] = nil, 
                    [4] = nil, 
                    [5] = nil, 
                    [6] = true, 
                    [1] = "        " .. v235.planting_site, 
                    [2] = v235.planting, 
                    [3] = color(210, 216, 112, 255), 
                    [4] = color(255, 255), 
                    [5] = v235.fill / 3.2
                }, 
                [13] = {
                    "OSAA", 
                    v512:is_alive() and ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() and not ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() and not ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get(), 
                    color(200, 199, 197)
                }
            };
            for _, v547 in pairs(v545) do
                if v547[2] then
                    v221(v547[1], v532, v547[3], v547[4], v547[5], v547[6]);
                    v532 = v532 - v531;
                end;
            end;
            return;
        end;
    end;
end;
local v548 = 0;
local v549 = 1;
local _ = 0;
local v551 = 0;
local v552 = {
    [""] = {
        alpha_k = 0
    }
};
local _ = 1;
local v577 = l_system_0.register({
    [1] = v250.keybinds_x, 
    [2] = v250.keybinds_y
}, vector(120, 60), "Keybinds", function(v554)
    -- upvalues: v138 (ref), v247 (ref), v332 (ref), v185 (ref), v552 (ref), l_gradient_0 (ref), v551 (ref), v549 (ref), v548 (ref)
    if not entity.get_local_player() then
        return;
    else
        local v555 = v138:new("keybinds_alpha", v247.widets:get(1) and 255 or 0);
        local v556 = v247.keybinds.color:get();
        local v557 = false;
        local v558 = v247.keybinds.animated_text:get();
        local v559 = 0;
        local v560 = globals.frametime * 16;
        local v561 = 5;
        local _ = 123;
        local v563 = {};
        local v564 = ui.get_binds();
        local l_v556_0 = v556;
        v557 = not v247.keybinds.gradient:get() and v556;
        if v247.keybinds.style:get() == "Solus" then
            l_v556_0 = v556;
        elseif v247.keybinds.style:get() == "Sense" then
            l_v556_0 = v557;
        end;
        for v566 = 1, #v564 do
            local v567 = v564[v566];
            local v568 = v564[v566].mode == 1 and "holding" or v564[v566].mode == 2 and "toggled" or "[?]";
            local _ = v564[v566].value;
            local v570 = v332[v564[v566].name] == nil and v185:upper_to_lower(v564[v566].name) or v332[v564[v566].name];
            local v571 = render.measure_text(1, "", v568);
            local v572 = render.measure_text(1, "", v570);
            if v552[v567.name] == nil then
                v552[v567.name] = {
                    alpha_k = 0
                };
            end;
            v552[v567.name].alpha_k = v185.lerp(v560, v552[v567.name].alpha_k, v567.active and 255 or 0);
            render.text(1, vector(v554.position.x + 5, v554.position.y + 19 + v561), color(255, math.clamp(v552[v567.name].alpha_k, 0, v555)), "", v570);
            local v573 = l_gradient_0.text_animate(v568, 1, {
                color(v556.r, v556.g, v556.b, 255), 
                color(v556.r * 0.6, v556.g * 0.6, v556.b * 0.6, 255)
            });
            local v574 = v558 and v573:get_animated_text() .. "\aDEFAULT" or v568;
            render.text(1, vector(v554.position.x + (v551 - v571.x - 6), v554.position.y + 19 + v561), color(255, math.clamp(v552[v567.name].alpha_k, 0, v555)), "", "[" .. v574 .. "]");
            v561 = v561 + 16 * v552[v567.name].alpha_k / 255;
            local v575 = v571.x + v572.x + 40;
            if v575 > 123 and v559 < v575 then
                v559 = v575;
            end;
            if v564.active then
                table.insert(v563, v564);
            end;
            v573:animate();
            v549 = v185.lerp(v560, v549, (not (ui.get_alpha() <= 0) or v561 > 0) and 1 or 0);
            v551 = v185.lerp(v560, v551, math.max(v559, 123));
            if ui.get_alpha() > 0 or v561 > 6 then
                v548 = v185.lerp(v560, v548, math.max(ui.get_alpha() * 255, v561 > 1 and 255 or 0));
            elseif v561 < 15.99 and ui.get_alpha() == 0 then
                v548 = v185.lerp(v560, v548, 0);
            end;
            v548 = math.clamp(v548, 0, v555);
            local _ = render.measure_text(1, "keybinds", name);
        end;
        if ui.get_alpha() or #v563 > 0 then
            render.window(v554.position.x, v554.position.y, l_v556_0, "keybinds", {
                centered_text = true, 
                alpha = math.clamp(v548, 0, 255), 
                override_w = v551 + 3, 
                style = v247.keybinds.style:get() == "Sense" and 1 or 2
            });
        end;
        return;
    end;
end);
local function v588()
    -- upvalues: v247 (ref), v138 (ref), l_gradient_0 (ref), v39 (ref), v44 (ref)
    if not entity.get_local_player() then
        return;
    elseif not v247.widets:get(2) then
        return;
    else
        local v578 = v138:new("watermark_alpha", 255);
        local v579 = render.screen_size();
        local v580 = v247.watermark.color:get();
        local v581 = false;
        local v582 = entity.get_local_player();
        local l_v580_0 = v580;
        v581 = not v247.keybinds.gradient:get() and v580;
        if v247.watermark.style:get() == "Solus" then
            l_v580_0 = v580;
        elseif v247.watermark.style:get() == "Sense" then
            l_v580_0 = v581;
        end;
        local v584 = 0;
        v584 = v582 == nil and 0 or string.format("%1.f", math.max(0, utils.net_channel():get_packet_response_latency(0, 0)));
        if v584 == nil then
            v584 = 0;
        end;
        local v585 = l_gradient_0.text_animate("maniak", -0.7, {
            v580, 
            color(255, 255, 255, 255)
        });
        local v586 = v247.watermark.animated_text:get() and v585:get_animated_text() or "maniak";
        local v587 = "unknown";
        if globals.is_connected then
            v587 = {
                [1] = "%s %s | %s | %sms delay", 
                [2] = {
                    [1] = v586, 
                    [2] = v39 ~= "stable" and "\aFFFFFFFF[" .. v39 .. "]" or "\aFFFFFFFF", 
                    [3] = v44, 
                    [4] = v584
                }
            };
        else
            v587 = {
                [1] = "%s %s | %s", 
                [2] = {
                    [1] = v586, 
                    [2] = v39 ~= "stable" and "\aFFFFFFFF[" .. v39 .. "]" or "\aFFFFFFFF", 
                    [3] = v44
                }
            };
        end;
        if v247.watermark.style:get() == "Sense" then
            render.window({
                [1] = v579.x - 15
            }, {
                [1] = 22
            }, v581, v587, {
                alpha = v578
            });
        else
            render.window({
                [1] = v579.x - 12
            }, {
                [1] = 18
            }, v580, v587, {
                style = 2, 
                alpha = v578
            });
        end;
        v585:animate();
        return;
    end;
end;
local v601 = {
    alpha = 255, 
    time = 4, 
    database = {}, 
    pos = vector(0, 0), 
    set_location = function(v589, v590, v591)
        v589.pos = v590;
        v589.alpha = v591 or 255;
    end, 
    new = function(v592, ...)
        local v593 = {
            ...
        };
        table.insert(v592.database, {
            time = globals.realtime, 
            text = v593[1], 
            color = v593[2]
        });
    end, 
    paint = function(v594)
        for v595, v596 in pairs(v594.database) do
            if globals.realtime <= v596.time + v594.time then
                local v597 = v596.time + v594.time - 0.5 - globals.realtime;
                local v598 = math.clamp(math.clamp(v597 / 0.5 * 255, 0, 255), 0, v594.alpha);
                local v599 = render.measure_text(1, nil, v596.text);
                local v600 = math.clamp(v597 / 0.5, 0, 1);
                render.text(1, vector(v594.pos.x + 100 - v600 * 100, v594.pos.y + v595 * (v599.y + 2)), color(v596.color.r, v596.color.g, v596.color.b, v598), nil, v596.text);
                if v598 < 30 then
                    table.remove(v594.database, v595);
                end;
            end;
        end;
    end
};
local v602 = {};
local function v607(v603, v604, v605)
    -- upvalues: v602 (ref), v601 (ref)
    if not v602[v603] then
        v602[v603] = {
            latest_time = 0
        };
    end;
    local v606 = v602[v603];
    if v606.latest_time + 15 <= v605 then
        v601:new("\194\187 " .. tostring(v604), color(255, 255, 255, 255));
        v606.latest_time = v605;
    end;
end;
local function v613(v608)
    local v609 = {
        var = v608
    };
    setmetatable(v609, {
        __call = function(v610, v611)
            local v612 = nil;
            if v610.var then
                v612 = v611[v610.var] or v611.default;
            else
                v612 = v611.missing or v611.default;
            end;
            if v612 then
                if type(v612) == "function" then
                    return v612(v610.var, v610);
                else
                    print("case ", "\b" .. tostring(v610.var), " is not a valid function");
                end;
            end;
        end
    });
    return v609;
end;
local v633 = l_system_0.register({
    [1] = v250.exploits_x, 
    [2] = v250.exploits_y
}, vector(120, 60), "Exploits", function(v614)
    -- upvalues: v247 (ref), v338 (ref), v138 (ref), v185 (ref), v601 (ref), v607 (ref), v613 (ref), v232 (ref)
    local v615 = rage.exploit:get();
    local v616 = v615 == 1 and "charged" or "charging";
    local v617 = v247.exploits.color:get();
    local v618 = false;
    local v619 = math.sin(math.abs(-3.14 + globals.curtime * 1.3333333333333333 % 6.28)) * 255;
    local l_v617_0 = v617;
    local _ = nil;
    local v622 = "unknown";
    v622 = v338.dt:get() and "double tap" or v338.hs:get() and "hide shots" or v338.fd:get() and "fake duck" or "none";
    v618 = not v247.exploits.gradient:get() and v617;
    if v247.exploits.style:get() == "Solus" then
        l_v617_0 = v617;
    elseif v247.exploits.style:get() == "Sense" then
        l_v617_0 = v618;
    end;
    local v623 = entity.get_local_player();
    if not v623 then
        return;
    elseif not v623:is_alive() then
        return;
    else
        local v624 = v138:new("exploits_alpha", v247.widets:get(4) and v622 ~= "none" and 255 or 0);
        local v625 = v623:get_player_weapon();
        if v625 == nil then
            return;
        else
            local v626 = v625:get_weapon_info();
            if v626 == nil then
                return;
            else
                local v627 = v626.weapon_name:gsub("weapon_", "");
                local v628 = v625:get_inaccuracy();
                local _ = v625:get_spread();
                local _ = v185.get_velocity(v623);
                local v631 = entity.get_threat(true);
                v631 = v631 ~= nil and (v631:is_alive() or false);
                v601:set_location(vector(v614.position.x + 5, v614.position.y + v614.size.y), v624);
                if not v631 and v615 == 0 then
                    v607("tickbase", "Restroying tickbase shift", globals.realtime);
                end;
                v613(v627)({
                    awp = function()
                        -- upvalues: v628 (ref), v631 (ref), v607 (ref)
                        if v628 > 0.41 and v631 then
                            v607("safety", "Forcing safety (inaccurate)", globals.realtime);
                        end;
                    end, 
                    ssg08 = function()
                        -- upvalues: v628 (ref), v631 (ref), v607 (ref)
                        if v628 > 0.2 and v631 then
                            v607("safety", "Forcing safety (inaccurate)", globals.realtime);
                        end;
                    end, 
                    g3sg1 = function()
                        -- upvalues: v628 (ref), v631 (ref), v607 (ref)
                        if v628 > 0.31 and v631 then
                            v607("safety", "Forcing safety (inaccurate)", globals.realtime);
                        end;
                    end, 
                    scar20 = function()
                        -- upvalues: v628 (ref), v631 (ref), v607 (ref)
                        if v628 > 0.31 and v631 then
                            v607("safety", "Forcing safety (inaccurate)", globals.realtime);
                        end;
                    end, 
                    default = function()
                        -- upvalues: v628 (ref), v631 (ref), v607 (ref)
                        if v628 > 0.15 and v631 then
                            v607("safety", "Forcing safety (inaccurate)", globals.realtime);
                        end;
                    end
                });
                local v632 = v232({
                    [1] = v622
                }, {
                    [1] = " ["
                }, {
                    v616, 
                    v138:new("charged_color", v615 == 1 and color(0, 255, 0, v619) or color(255, 0, 0, 255))
                }, {
                    [1] = "] | "
                }, {
                    [1] = v615 == 1 and "\226\158\138\226\158\139" or "\226\158\138"
                }, {
                    [1] = " | weapon \194\187 " .. v627
                });
                v614.size = render.measure_text(1, nil, v632);
                render.window(v614.position.x, v614.position.y, l_v617_0, v632, {
                    alpha = v624, 
                    style = v247.exploits.style:get() == "Sense" and 1 or 2
                });
                v601:paint();
                return;
            end;
        end;
    end;
end);
local v646 = l_system_0.register({
    [1] = v250.slow_x, 
    [2] = v250.slow_x
}, vector(185, 50), "Slowdown", function(v634)
    -- upvalues: v191 (ref), v247 (ref), v211 (ref)
    local v635 = entity.get_local_player();
    local _ = render.screen_size();
    local l_vel_mod_0 = v191.value.vel_mod;
    local v638 = math.floor((1 - l_vel_mod_0) * 100);
    local v639 = color(v247.slowdown.color:get().r, v247.slowdown.color:get().g, v247.slowdown.color:get().b);
    local v640 = string.format("Velocity Modifier Reduced by %d %%", v638);
    local _ = render.measure_text(1, nil, v640).x;
    local v642 = color("EA6868FF"):lerp(v639, l_vel_mod_0);
    local l_alpha_0 = v191.value.alpha;
    v191(0.05, {
        vel_mod = not v635 and 0.34 or v635.m_flVelocityModifier, 
        alpha = v247.widets:get(3) and (v638 ~= 0 and v635 or ui.get_alpha() > 0.3) and 255 or 0
    });
    local l_status_1, l_result_1 = pcall(function()
        -- upvalues: v635 (ref)
        return not v635:is_alive() and ui.get_alpha() ~= 1;
    end);
    if l_status_1 and l_result_1 then
        return;
    elseif not v247.widets:get(3) then
        return;
    else
        render.text(v211.verdana_24, vector(v634.position.x + 94, v634.position.y + v634.size.y - 40), v642:alpha_modulate(l_alpha_0), "c", ui.get_icon("triangle-exclamation"));
        render.text(1, vector(v634.position.x + 94, v634.position.y + v634.size.y - 21), color(255, l_alpha_0), "c", v640);
        render.shadow(vector(v634.position.x + 7, v634.position.y + v634.size.y - 10), vector(v634.position.x + v634.size.x - 7, v634.position.y + v634.size.y - 7), v642:alpha_modulate(l_alpha_0), 14, 0, 3);
        render.rect(vector(v634.position.x + 7, v634.position.y + v634.size.y - 10), vector(v634.position.x + v634.size.x - 7, v634.position.y + v634.size.y - 7), color(0, l_alpha_0), 3);
        render.rect(vector(v634.position.x + 7, v634.position.y + v634.size.y - 10), vector(v634.position.x + v634.size.x * l_vel_mod_0 - 7, v634.position.y - 7 + v634.size.y), v642:alpha_modulate(l_alpha_0), 3);
        return;
    end;
end);
local v647 = {
    how = {
        text = "HOW DID YOU GET HERE?", 
        color = color(142, 99, 222, 255)
    }, 
    god_like = {
        text = "LC God", 
        color = color(99, 222, 200, 255)
    }, 
    perfect = {
        text = "Perfect", 
        color = color(138, 254, 112, 255)
    }, 
    ok = {
        text = "Good", 
        color = color(222, 245, 118, 255)
    }, 
    decent = {
        text = "Decent", 
        color = color(255, 151, 0, 255)
    }, 
    bad = {
        text = "Bad", 
        color = color(222, 99, 99, 255)
    }, 
    worst = {
        text = "Worst", 
        color = color(222, 99, 99, 255)
    }
};
local v648 = {
    how = color(142, 99, 222, 155), 
    god_like = color(99, 222, 200, 155), 
    perfect = color(138, 254, 112, 155), 
    ok = color(222, 245, 118, 155), 
    decent = color(255, 151, 0, 155), 
    bad = color(222, 99, 99, 155), 
    worst = color(222, 129, 129, 155)
};
local v649 = {
    ticks = 0, 
    max_tickbase = 0, 
    current_cmd = 0, 
    dif = 0
};
events.createmove:set(function(v650)
    -- upvalues: v649 (ref)
    v649.current_cmd = v650.command_number;
end);
events.createmove:set(function(_)
    -- upvalues: v649 (ref)
    local v652 = entity.get_local_player();
    if not v652 or not v652:is_alive() then
        return 0;
    else
        local l_tickcount_0 = globals.tickcount;
        local v654 = v652.m_nTickBase or 0;
        local v655 = v654 < l_tickcount_0;
        if math.abs(v654 - v649.max_tickbase) > 64 and v655 then
            v649.max_tickbase = 0;
        end;
        if v649.max_tickbase < v654 then
            v649.max_tickbase = v654;
        elseif v654 < v649.max_tickbase then
            v649.ticks = v655 and math.min(14, math.max(0, v649.max_tickbase - v654 - 1)) or 0;
        end;
        return v654 and v649.ticks or 0;
    end;
end);
local _ = {
    last_tick = 0, 
    last_text = "unknown", 
    last_color = color(255, 255, 255, 255)
};
local v657 = 255;
local v658 = 0;
local v659 = 0.4;
local l_curtime_1 = globals.curtime;
local function v664(v661)
    -- upvalues: l_curtime_1 (ref), v658 (ref), v657 (ref), v659 (ref)
    local l_curtime_2 = globals.curtime;
    local v663 = l_curtime_2 - l_curtime_1;
    l_curtime_1 = l_curtime_2;
    if v661 then
        v658 = 0;
        v657 = 255;
    else
        v658 = v658 + v663;
        v657 = math.max(0, 255 - 255 * (v658 / v659));
    end;
end;
local function v668(v665)
    -- upvalues: v648 (ref), v657 (ref)
    for v666, v667 in pairs(v648) do
        if v666 == v665 then
            v648[v666] = color(v667.r, v667.g, v667.b, v657);
        else
            v648[v666] = color(v667.r, v667.g, v667.b, math.min(v657, 155));
        end;
    end;
end;
local v669 = 0;
local v687 = l_system_0.register({
    [1] = v250.lc_x, 
    [2] = v250.lc_y
}, vector(150, 100), "LC Indicator", function(v670)
    -- upvalues: v247 (ref), v664 (ref), v669 (ref), v649 (ref), v647 (ref), v668 (ref), v657 (ref), v648 (ref)
    local v671 = entity.get_local_player();
    if not v671 or not v671:is_alive() or not v247.widets:get(5) then
        return;
    else
        local l_m_fFlags_5 = v671.m_fFlags;
        local v673 = bit.lshift(1, 0);
        local v674 = v247.lc_ind.while_air:get() and bit.band(l_m_fFlags_5, v673) == 0;
        local v675 = v247.lc_ind.while_ground:get() and bit.band(l_m_fFlags_5, v673) == 1;
        local v676 = v247.lc_ind.while_tp:get() and rage.exploit:get() == 0;
        v664(v674 or v676 or v675);
        if rage.exploit:get() == 1 then
            v669 = v649.ticks;
        end;
        if v669 == 14 then
            local l_text_0 = v647.how.text;
            color_ = v647.how.color;
            text = l_text_0;
            v668("how");
        elseif v669 == 13 then
            local l_text_1 = v647.god_like.text;
            color_ = v647.god_like.color;
            text = l_text_1;
            v668("god_like");
        elseif v669 >= 10 and v669 <= 12 then
            local l_text_2 = v647.perfect.text;
            color_ = v647.perfect.color;
            text = l_text_2;
            v668("perfect");
        elseif v669 >= 7 and v669 <= 9 then
            local l_text_3 = v647.ok.text;
            color_ = v647.ok.color;
            text = l_text_3;
            v668("ok");
        elseif v669 >= 4 and v669 <= 6 then
            local l_text_4 = v647.decent.text;
            color_ = v647.decent.color;
            text = l_text_4;
            v668("decent");
        elseif v669 >= 2 and v669 <= 3 then
            local l_text_5 = v647.bad.text;
            color_ = v647.bad.color;
            text = l_text_5;
            v668("bad");
        elseif v669 >= 0 and v669 <= 2 then
            local l_text_6 = v647.worst.text;
            color_ = v647.worst.color;
            text = l_text_6;
            v668("worst");
        end;
        if v657 <= 0 then
            return;
        else
            local v684 = v657 / 255 * 3;
            render.blur(vector(v670.position.x + 7, v670.position.y + v670.size.y - 10), vector(v670.position.x + v670.size.x - 15, v670.position.y + v670.size.y + 15), 10, v684, 3);
            local l_x_2 = render.measure_text(1, nil, text).x;
            local v686 = v670.position.x + (v670.size.x - l_x_2) / 2;
            render.text(1, vector(v686, v670.position.y + v670.size.y - 10), color(color_.r, color_.g, color_.b, v657), nil, text);
            render.rect(vector(v670.position.x + 8, v670.position.y + v670.size.y + 5), vector(v670.position.x + v670.size.x - 135, v670.position.y + v670.size.y + 10), not v247.lc_ind.one_color:get() and v648.god_like or color(color_.r, color_.g, color_.b, v657));
            render.rect(vector(v670.position.x + 15, v670.position.y + v670.size.y + 5), vector(v670.position.x + v670.size.x - 125, v670.position.y + v670.size.y + 10), not v247.lc_ind.one_color:get() and v648.perfect or color(color_.r, color_.g, color_.b, v657));
            render.rect(vector(v670.position.x + 25, v670.position.y + v670.size.y + 5), vector(v670.position.x + v670.size.x - 105, v670.position.y + v670.size.y + 10), not v247.lc_ind.one_color:get() and v648.ok or color(color_.r, color_.g, color_.b, v657));
            render.rect(vector(v670.position.x + 45, v670.position.y + v670.size.y + 5), vector(v670.position.x + v670.size.x - 75, v670.position.y + v670.size.y + 10), not v247.lc_ind.one_color:get() and v648.decent or color(color_.r, color_.g, color_.b, v657));
            render.rect(vector(v670.position.x + 75, v670.position.y + v670.size.y + 5), vector(v670.position.x + v670.size.x - 44, v670.position.y + v670.size.y + 10), not v247.lc_ind.one_color:get() and v648.bad or color(color_.r, color_.g, color_.b, v657));
            render.rect(vector(v670.position.x + 106, v670.position.y + v670.size.y + 5), vector(v670.position.x + v670.size.x - 17, v670.position.y + v670.size.y + 10), not v247.lc_ind.one_color:get() and v648.worst or color(color_.r, color_.g, color_.b, v657));
            return;
        end;
    end;
end);
local function v688()
    -- upvalues: v633 (ref), v577 (ref), v646 (ref), v687 (ref), v588 (ref)
    v633:update();
    v577:update();
    v646:update();
    v687:update();
    v588();
end;
events.mouse_input:set(function()
    return ui.get_alpha() <= 0;
end);
local v689 = {
    [1] = -8, 
    [2] = 0, 
    [3] = 8, 
    [4] = 16
};
local v690 = {
    alpha_k = 0
};
local v691 = {
    ["Peek Assist"] = "AP", 
    ["Hide Shots"] = "OSAA", 
    ["Double Tap"] = "DT", 
    ["Safe Points"] = "SAFE", 
    Freestanding = "FS", 
    ["Fake Duck"] = "FD", 
    ["Body Aim"] = "BAIM", 
    ["Slow Walk"] = "SW", 
    ["Min. Damage"] = "DMG"
};
events.player_death:set(function(v692)
    -- upvalues: v248 (ref), v240 (ref), v241 (ref)
    if not v248.killsay:get() then
        return;
    else
        local v693 = entity.get_local_player();
        if not (v693 and v693:is_alive() and true or false) then
            return;
        else
            local v694 = entity.get(v692.userid, true);
            local v695 = entity.get(v692.attacker, true);
            if v694 == v695 or v695 ~= v693 then
                return;
            else
                utils.console_exec("say " .. v240[math.random(1, #v240)] .. " | " .. v241[math.random(1, #v241)] .. "");
                return;
            end;
        end;
    end;
end);
crosshair_indicator = function()
    -- upvalues: v247 (ref), v211 (ref), v138 (ref), l_gradient_0 (ref), v689 (ref), v691 (ref), v185 (ref), v690 (ref)
    local v696 = {
        x = render.screen_size().x, 
        y = render.screen_size().y
    };
    local v697 = "";
    local v698 = v247.crosshair_indicators.color:get();
    local v699 = 1;
    if v247.crosshair_indicators.font:get() == "Bold" then
        v699 = 4;
        v697 = string.upper("maniak");
    elseif v247.crosshair_indicators.font:get() == "Pixel" then
        v699 = 2;
        v697 = string.upper("maniak");
    elseif v247.crosshair_indicators.font:get() == "Blind" then
        v699 = v211.verdana_blind;
        v697 = string.upper("maniak");
    end;
    local v700 = false;
    local v701 = false;
    for _, v703 in pairs(ui.get_binds()) do
        if v703.name == "Min. Damage" then
            v700 = v703.active;
        end;
        if v703.name == "Freestanding" then
            v701 = v703.active;
        end;
    end;
    local _ = {};
    local v705 = ui.get_binds();
    local v706 = globals.frametime * 16;
    local v707 = 10;
    if v247.crosshair_indicators:get() then
        local v708 = entity.get_local_player();
        if not v708 or not v708:is_alive() then
            return;
        else
            local l_m_bIsScoped_0 = v708.m_bIsScoped;
            local v710 = v138:new("offset_ind", l_m_bIsScoped_0 and 20 or 0);
            local _ = v138:new("offset_ind_binds", l_m_bIsScoped_0 and 8 or 0);
            local _ = 0;
            local v713 = 15;
            local v714 = 1;
            local v715 = l_gradient_0.text_animate(v697, -0.7, {
                color(55, 55, 55), 
                color(v698.r, v698.g, v698.b)
            });
            v715:animate();
            render.text(v699, vector(v696.x / 2 + v710 - 15, v696.y / 2 + v713 + v689[v714]), color(255, 255, 255, 255), nil, v715:get_animated_text());
            for v716 = 1, #v705 do
                local v717 = v705[v716];
                if v717.name ~= "Force Thirdperson" and v717.name ~= "Override Resolver" and v717.name ~= "Hit Chance" then
                    local v718 = v691[v705[v716].name] == nil and v185:upper_to_lower(v705[v716].name) or v691[v705[v716].name];
                    if v690[v717.name] == nil then
                        v690[v717.name] = {
                            alpha_k = 0
                        };
                    end;
                    v690[v717.name].alpha_k = v185:lerpx(v706, v690[v717.name].alpha_k, v717.active and 255 or 0);
                    render.text(v699, vector(v696.x / 2 + v710 - 15, v696.y / 2 + v713 + v689[v714] + v707), color(255, math.clamp(v690[v717.name].alpha_k, 0, 255)), "", v718);
                    v707 = v707 + 10 * v690[v717.name].alpha_k / 255;
                end;
            end;
        end;
    end;
end;
local v719 = l_ffi_0.cast("int(__fastcall*)(const char*, const char*)", utils.opcode_scan("engine.dll", "53 56 57 8B DA 8B F9 FF 15"));
local v720 = nil;
local function v722(v721)
    -- upvalues: v720 (ref), v719 (ref)
    if v721 ~= v720 then
        v719(v721, v721);
        v720 = v721;
    end;
end;
local function v723()
    -- upvalues: v722 (ref)
    v722("");
end;
clantag_func = function()
    -- upvalues: v248 (ref), v239 (ref), v242 (ref), v722 (ref), v243 (ref), v723 (ref)
    if v248.clantag:get() then
        local v724 = v239[math.floor(globals.curtime * 2.5) % #v239 + 1];
        if v724 ~= v242 then
            v722(v724);
            v242 = v724;
            v243 = true;
        end;
    elseif v243 then
        v723(" ");
        v243 = false;
    end;
end;
get_flag = function(v725, v726)
    return bit.band(v725.m_fFlags, bit.lshift(1, v726)) ~= 0;
end;
can_hitap = function(v727)
    local v728 = entity.get_local_player();
    local v729, _ = utils.trace_bullet(v727, v727:get_hitbox_position(3), v728:get_hitbox_position(3));
    local _, _ = utils.trace_bullet(v727, v728:get_hitbox_position(3), v727:get_hitbox_position(3));
    if v729 > 20 then
        return true;
    else
        return false;
    end;
end;
local v733 = false;
auto_tp = function()
    -- upvalues: v733 (ref), v248 (ref), v649 (ref)
    v733 = false;
    local _ = ui.find("Aimbot", "Ragebot", "Main", "Enabled");
    if v248.auto_tp:get() then
        local v735 = entity.get_local_player();
        if not v735 then
            return;
        else
            local v736 = v735:get_player_weapon();
            if v736 == nil then
                return;
            else
                local _ = v736:get_classname() == "CKnife";
                if entity.get_threat ~= nil then
                    if entity.get_threat(true) then
                        v733 = true;
                    else
                        v733 = false;
                    end;
                else
                    v733 = false;
                end;
                if v733 and not get_flag(v735, 0) then
                    if v649.ticks >= 7 and v248.ideal_lc:get() then
                        if v248.fast_recharge:get() then
                            rage.exploit:force_teleport();
                        else
                            rage.exploit:allow_charge(true);
                            rage.exploit:force_teleport();
                            rage.exploit:force_charge();
                        end;
                    elseif not v248.ideal_lc:get() then
                        if v248.fast_recharge:get() then
                            rage.exploit:force_teleport();
                        else
                            rage.exploit:allow_charge(true);
                            rage.exploit:force_teleport();
                            rage.exploit:force_charge();
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
air_lag = function()
    -- upvalues: v248 (ref), v649 (ref)
    local _ = ui.find("Aimbot", "Ragebot", "Main", "Enabled");
    local v739 = entity.get_local_player();
    if not v739 then
        return;
    else
        if v248.air_lag:get() and not get_flag(v739, 0) and v649.ticks >= 7 then
            if v248.hittable:get() and entity.get_threat(true) then
                rage.exploit:force_teleport();
                rage.exploit:allow_charge(true);
                rage.exploit:force_charge();
            elseif not v248.hittable:get() then
                rage.exploit:force_teleport();
                rage.exploit:allow_charge(true);
                rage.exploit:force_charge();
            end;
        end;
        return;
    end;
end;
local v740 = l_ffi_0.cast("void***", utils.create_interface("client.dll", "VClientEntityList003"));
local v741 = l_ffi_0.cast("GetClientEntityHandle_4242425_t", v740[0][3]);
local function v743(v742)
    -- upvalues: v741 (ref), v740 (ref)
    return v741(v740, v742);
end;
anim_fix = function()
    -- upvalues: v248 (ref), l_ffi_0 (ref), v743 (ref), v185 (ref)
    local v744 = entity.get_local_player();
    if not v744 or not v744:is_alive() then
        return;
    else
        local l_m_fFlags_6 = v744.m_fFlags;
        local v746 = bit.lshift(1, 0);
        local v747 = bit.band(l_m_fFlags_6, v746) == 0;
        local v748 = bit.band(l_m_fFlags_6, v746) == 1;
        local v749 = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement");
        if v248.animbreaker:get() then
            l_ffi_0.cast("C_AnimationLayer**", l_ffi_0.cast("uintptr_t", v743(v744:get_index())) + 10640)[0][12].m_weight = v248.lean:get() / 100;
        end;
        if v248.animbreaker:get() and (v248.legs_ground:get() == "Jitter" and v748 or v248.legs_air:get() == "Jitter" and v747) then
            v749:override("Default");
            v744.m_flPoseParameter[3] = math.random(0, 10) / 10;
            v744.m_flPoseParameter[7] = math.random(0, 10) / 10;
            v744.m_flPoseParameter[6] = math.random(0, 10) / 10;
        elseif v248.animbreaker:get() and v248.legs_ground:get() == "Static" and v748 then
            if v185.get_velocity(v744) > 10 then
                l_ffi_0.cast("float*", v743(v744:get_index()) + 10104)[7] = 0;
                l_ffi_0.cast("C_AnimationLayer**", l_ffi_0.cast("uintptr_t", v743(v744:get_index())) + 10640)[0][7].m_weight = 1;
            end;
        elseif v248.animbreaker:get() and v248.legs_air:get() == "Static" and v747 then
            l_ffi_0.cast("float*", v743(v744:get_index()) + 10104)[6] = 1;
        elseif v248.animbreaker:get() and v248.legs_ground:get() == "Slide" and v748 then
            v749:override("Sliding");
        elseif v248.animbreaker:get() and v248.legs_ground:get() == "Moonwalk" and v748 then
            if v185.get_velocity(v744) > 10 then
                l_ffi_0.cast("float*", v743(v744:get_index()) + 10104)[7] = 0;
                l_ffi_0.cast("C_AnimationLayer**", l_ffi_0.cast("uintptr_t", v743(v744:get_index())) + 10640)[0][7].m_weight = 0;
            end;
        elseif v248.animbreaker:get() and v248.legs_air:get() == "Moonwalk" and v747 then
            l_ffi_0.cast("float*", v743(v744:get_index()) + 10104)[6] = 0;
            l_ffi_0.cast("C_AnimationLayer**", l_ffi_0.cast("uintptr_t", v743(v744:get_index())) + 10640)[0][6].m_weight = 1;
        end;
        return;
    end;
end;
events.post_update_clientside_animation:set(function()
    anim_fix();
end);
local v750 = {};
local v751 = false;
local function v760(...)
    local v752 = {
        ...
    };
    local v753 = #v752;
    if v753 == 0 then
        return;
    else
        local v754 = "";
        local v755 = false;
        for v756, v757 in ipairs(v752) do
            if v753 > 1 and v756 == v753 then
                if type(v757) == "boolean" then
                    v755 = v757;
                else
                    v754 = v754 .. tostring(v757);
                end;
            else
                v754 = v754 .. tostring(v757);
            end;
        end;
        local v759 = string.gsub(v754, "\a(%x%x%x%x%x%x%x%x)", function(v758)
            return "\a" .. (v758 == "FFFFFFFF" and "C5CAD0FF" or v758);
        end);
        if not v755 then
            print_dev(string.format("\aC5CAD0FF%s\aC5CAD0FF", v754));
        end;
        print_raw(string.format("\a9EB3DEFF%s \a888888FF\194\183 \aC5CAD0FF%s\aC5CAD0FF", string.lower("Maniak"), v759));
        return;
    end;
end;
local function v762(...)
    -- upvalues: v760 (ref)
    if not _DEBUG then
        return;
    else
        local v761 = {
            ...
        };
        if #v761 == 1 and v761[1] == "" then
            print_raw(" ");
            return;
        else
            v760(...);
            return;
        end;
    end;
end;
local function _(v763, v764, v765, v766, ...)
    -- upvalues: v762 (ref), v751 (ref), v750 (ref)
    local v767 = v765 == nil or v765 or true;
    assert(type(v763) == "userdata", "Invalid userdata");
    assert(type(v764) == "function", "Invalid callback type");
    assert(type(v767) == "boolean", "Invalid state type");
    local v768 = {};
    if v767 then
        if type(v763.set_callback) == "function" then
            v768 = {
                v763:set_callback(v764, ...)
            };
        elseif type(v763.set) == "function" then
            v768 = {
                v763:set(v764, ...)
            };
        end;
    elseif type(v763.unset_callback) == "function" then
        v768 = {
            v763:unset_callback(v764, ...)
        };
    elseif type(v763.unset) == "function" then
        v768 = {
            v763:unset(v764, ...)
        };
    end;
    v762(string.format("%s callback: \a99FF99FF%s %s", v767 and "enabled" or "disabled", v763, v766 and "\aFF3E3EFF[override]" or ""));
    if not v751 then
        local v769 = tostring(v763);
        if v769:sub(1, 6) == "event(" then
            local v770 = string.match(v769, "event%((.*)%)");
            local v771 = nil;
            for v772, v773 in pairs(v750) do
                if v773.callback == v764 then
                    v771 = v772;
                    break;
                end;
            end;
            if v767 and v766 then
                if v771 then
                    v750[v771] = nil;
                end;
                table.insert(v750, {
                    event = v763, 
                    event_name = v770, 
                    callback = v764, 
                    current_index = #v763
                });
            end;
            if v771 and not v767 then
                v750[v771] = nil;
            end;
        end;
    end;
    return unpack(v768);
end;
l_ffi_0.cdef("    void* GetProcAddress(void*, const char*);\n    void* GetModuleHandleA(const char*);\n\n    void* GetCurrentProcess();\n    void* GetCurrentThread();\n\n    bool SetThreadPriority(void*, int);\n");
local v775 = 0;
local v776 = l_ffi_0.C.GetCurrentProcess();
local v777 = l_ffi_0.C.GetCurrentThread();
local v778 = l_ffi_0.C.GetModuleHandleA("ntdll.dll");
local v779 = l_ffi_0.cast("long(__stdcall*)(void*, unsigned long, void*, unsigned long)", l_ffi_0.C.GetProcAddress(v778, "NtSetInformationProcess"));
local v780 = l_ffi_0.typeof("unsigned long[1]");
local v781 = v780(5);
local v782 = v780(2);
local function v783()
    -- upvalues: v779 (ref), v776 (ref), v781 (ref), l_ffi_0 (ref), v780 (ref), v782 (ref)
    v779(v776, 39, v781, l_ffi_0.sizeof(v780));
    v779(v776, 33, v782, l_ffi_0.sizeof(v780));
end;
local function v785()
    -- upvalues: v775 (ref), l_ffi_0 (ref), v777 (ref)
    local l_realtime_0 = globals.realtime;
    if math.abs(l_realtime_0 - v775) <= 0.5 then
        return;
    else
        v775 = l_realtime_0;
        l_ffi_0.C.SetThreadPriority(v777, 2);
        return;
    end;
end;
local function v786()
    -- upvalues: l_ffi_0 (ref), v777 (ref)
    l_ffi_0.C.SetThreadPriority(v777, 0);
end;
events.shutdown:set(function()
    -- upvalues: v786 (ref)
    v786();
end);
events.render:set(function(_)
    -- upvalues: v248 (ref), v783 (ref), v785 (ref), v786 (ref)
    if v248.optimization:get() then
        v783();
        v785();
    else
        v786();
    end;
end);
local function _(v788, v789, v790, v791, v792, v793)
    if v793 then
        v788 = math.clamp(v788, v789, v790);
    end;
    return v791 + (v788 - v789) * (v792 - v791) / (v790 - v789);
end;
local v795 = {
    hooks = {}, 
    all_hooks = {}
};
local function _(v796)
    if not v796 then
        v796 = 1;
    end;
    return globals.server_tick % (1 / globals.tickinterval * v796) > 0;
end;
v795.get_rel_jump = function(v798, v799)
    -- upvalues: l_ffi_0 (ref)
    if v799 then
        v798 = utils.opcode_scan(v798, v799);
    end;
    local v800 = l_ffi_0.cast("uint8_t*", v798);
    local v801 = l_ffi_0.cast("uintptr_t", v800);
    local v802 = l_ffi_0.cast("int32_t*", v801 + 1)[0];
    return l_ffi_0.cast("uintptr_t", v801 + 5 + v802);
end;
local v803 = l_ffi_0.cast("int(__cdecl*)(void*, void*, void*, int)", utils.opcode_scan("gameoverlayrenderer.dll", "55 8B EC 51 8B 45 10 C7"));
local v804 = l_ffi_0.cast("void(__cdecl*)(void*, bool)", v795.get_rel_jump(utils.opcode_scan("gameoverlayrenderer.dll", "E8 ? ? ? ? 83 C4 08 FF 15 ? ? ? ?")));
v795.set = function(v805, v806, v807, v808)
    -- upvalues: l_ffi_0 (ref), v795 (ref), v803 (ref)
    local v809 = l_ffi_0.cast("void*", v806);
    v795.all_hooks[v805] = v809;
    local v810 = l_ffi_0.typeof(v807);
    local v811 = l_ffi_0.cast(v810, v808);
    local v812 = l_ffi_0.typeof("$[1]", v811)();
    local function v816(...)
        -- upvalues: v812 (ref), v808 (ref)
        local v813 = v812[0];
        local l_status_2, l_result_2 = pcall(v808, v813, ...);
        return l_status_2 and l_result_2 or v813(...);
    end;
    local v817 = l_ffi_0.cast(v810, v816);
    local v818 = v803(v809, v817, v812, 0);
    if v818 == 0 then
        local v819 = type(v806) ~= "number" and "Failed [error: 100]" or "Failed [error: 102]";
        print(v819);
    end;
    return v818;
end;
v795.remove = function(v820)
    -- upvalues: v795 (ref), v804 (ref)
    local v821 = v795.all_hooks[v820];
    if v821 then
        v804(v821, false);
    end;
end;
events.shutdown:set(function()
    -- upvalues: v795 (ref), v804 (ref)
    for _, v823 in pairs(v795.all_hooks) do
        if v823 then
            v804(v823, false);
        end;
    end;
end);
hook_prediction = function()
    -- upvalues: v244 (ref)
    local l_cl_predictweapons_0 = cvar.cl_predictweapons;
    local l_cl_interpolate_0 = cvar.cl_interpolate;
    local l_cl_interp_0 = cvar.cl_interp;
    local l_cl_interp_ratio_0 = cvar.cl_interp_ratio;
    if not entity.get_local_player() then
        return;
    else
        local function v831(v828, v829, v830)
            -- upvalues: l_cl_interpolate_0 (ref), l_cl_predictweapons_0 (ref), l_cl_interp_ratio_0 (ref), l_cl_interp_0 (ref)
            l_cl_interpolate_0:int(v828, true);
            l_cl_predictweapons_0:int(v829, true);
            l_cl_interp_ratio_0:int(v830);
            l_cl_interp_0:float(0.234375);
        end;
        local function v832()
            -- upvalues: l_cl_interpolate_0 (ref), l_cl_predictweapons_0 (ref), l_cl_interp_ratio_0 (ref), l_cl_interp_0 (ref)
            l_cl_interpolate_0:int(1, true);
            l_cl_predictweapons_0:int(1, true);
            l_cl_interp_ratio_0:int(2);
            l_cl_interp_0:float(0.015625);
        end;
        if v244.interpolation_fix:get() then
            events.net_update_end:set(function()
                -- upvalues: v831 (ref)
                v831(0, 0, 5);
            end);
            events.shutdown:set(v832);
        else
            v832();
        end;
        return;
    end;
end;
trace = function(v833)
    local v834 = math.pi * 2;
    local v835 = v834 / 8;
    local v836 = entity.get_local_player();
    if not v836 then
        return;
    else
        local l_x_3 = v836.m_vecOrigin.x;
        local l_y_1 = v836.m_vecOrigin.y;
        local l_z_1 = v836.m_vecOrigin.z;
        for v840 = 0, v834, v835 do
            local v841 = 10 * math.cos(v840) + l_x_3;
            local v842 = 10 * math.sin(v840) + l_y_1;
            local v843 = utils.trace_line(vector(v841, v842, l_z_1), vector(v841, v842, l_z_1 - v833), v836);
            local l_fraction_0 = v843.fraction;
            local _ = v843.entity;
            if l_fraction_0 ~= 1 then
                return true;
            end;
        end;
        return false;
    end;
end;
nofalldamage = function(v846)
    -- upvalues: v248 (ref)
    local v847 = false;
    if v248.nofall:get() then
        local v848 = entity.get_local_player();
        if not v848 then
            return;
        else
            if v848.m_vecVelocity.z >= -500 then
                v847 = false;
            elseif trace(15) then
                v847 = false;
            elseif trace(75) then
                v847 = true;
            end;
            if v848.m_vecVelocity.z < -500 then
                if v847 then
                    v846.in_duck = 1;
                else
                    v846.in_duck = 0;
                end;
            end;
        end;
    end;
end;
fastladder = function(v849)
    -- upvalues: v248 (ref)
    if v248.fastladder:get() then
        local v850 = entity.get_local_player();
        if not v850 then
            return;
        else
            local v851 = render.camera_angles();
            if v850.m_MoveType == 9 then
                if v849.forwardmove > 0 and v851.x < 45 then
                    v849.view_angles.x = 89;
                    v849.view_angles.y = v849.view_angles.y + 89;
                    v849.in_moveright = 1;
                    v849.in_moveleft = 0;
                    v849.in_forward = 0;
                    v849.in_back = 1;
                    if v849.sidemove == 0 then
                        v849.move_yaw = v849.move_yaw + 90;
                    end;
                    if v849.sidemove < 0 then
                        v849.move_yaw = v849.move_yaw + 150;
                    end;
                    if v849.sidemove > 0 then
                        v849.move_yaw = v849.move_yaw + 30;
                    end;
                end;
                if v849.forwardmove < 0 then
                    v849.view_angles.x = 89;
                    v849.view_angles.y = v849.view_angles.y + 89;
                    v849.in_moveright = 1;
                    v849.in_moveleft = 0;
                    v849.in_forward = 1;
                    v849.in_back = 0;
                    if v849.sidemove == 0 then
                        v849.move_yaw = v849.move_yaw + 90;
                    end;
                    if v849.sidemove > 0 then
                        v849.move_yaw = v849.move_yaw + 150;
                    end;
                    if v849.sidemove < 0 then
                        v849.move_yaw = v849.move_yaw + 30;
                    end;
                end;
            end;
        end;
    end;
end;
events.createmove:set(function(v852)
    nofalldamage(v852);
    fastladder(v852);
end);
v245.enable:set_callback(function(v853)
    -- upvalues: v47 (ref)
    if v853:get() then
        v853:name("\a" .. v47.hex .. ui.get_icon("square-check") .. "   \aDEFAULTEnable");
    else
        v853:name("\a" .. v47.hex .. ui.get_icon("square") .. "   \aDEFAULTEnable");
    end;
end);
math.round = function(v854, v855)
    local v856 = 10 ^ (v855 or 0);
    return math.floor(v854 * v856 + 0.5) / v856;
end;
local v857 = {
    layers = {}, 
    safepoints = {}, 
    type = {}, 
    cache = {}
};
math.anglemod = function(v858)
    return 0.0054931640625 * bit.band(math.floor(v858 * 182.04444444444445, 65535));
end;
math.approach_angle = function(v859, v860, v861)
    v859 = math.anglemod(v859);
    v860 = math.anglemod(v860);
    local v862 = v859 - v860;
    if v861 < 0 then
        v861 = -v861;
    end;
    if v862 < -180 then
        v862 = v862 + 360;
    elseif v862 > 180 then
        v862 = v862 - 360;
    end;
    if v861 < v862 then
        v860 = v860 + v861;
    elseif v862 < -v861 then
        v860 = v860 - v861;
    else
        v860 = v859;
    end;
    return v860;
end;
fmod = function(v863, v864)
    return v863 - math.floor(v863 / v864) * v864;
end;
angle_diff = function(v865, v866)
    local v867 = 0;
    v867 = fmod(v865 - v866, 360);
    if v866 < v865 then
        if v867 >= 180 then
            v867 = v867 - 360;
        end;
    elseif v867 <= -180 then
        v867 = v867 + 360;
    end;
    return v867;
end;
math.angle_normalize = function(v868)
    local v869 = 0;
    v869 = math.fmod(v868, 360);
    if v869 < 0 then
        v869 = v869 + 360;
    end;
    return v869;
end;
v857.get_desync_delta = function(v870)
    -- upvalues: l_ffi_0 (ref), v743 (ref)
    local v871 = 57.295779513082;
    if not v870 or not v870:is_alive() or not v870:is_enemy() then
        return 0;
    else
        local v872 = l_ffi_0.cast("CPlayer_Animation_State**", v743(v870:get_index()) + 39264)[0];
        if not v872 then
            return 0;
        else
            local l_flEyeYaw_0 = v872.flEyeYaw;
            local l_flGoalFeetYaw_0 = v872.flGoalFeetYaw;
            local v875 = math.clamp(v872.m_flFeetSpeedForwardsOrSideWays, 0, 1);
            local l_flDuckAmount_0 = v872.flDuckAmount;
            local v877 = l_flEyeYaw_0 - l_flGoalFeetYaw_0;
            if v877 > 180 then
                v877 = v877 - 360;
            elseif v877 < -180 then
                v877 = v877 + 360;
            end;
            local v878 = math.clamp(1 - v875 * 0.5, 0, 1);
            local v879 = l_flDuckAmount_0 > 0 and 0.5 * l_flDuckAmount_0 or 0;
            local v880 = v877 * v878 + v879 * v877;
            return math.clamp(math.round(v880, 1), -v871, v871) or 0;
        end;
    end;
end;
v857.get_desync = function(v881)
    -- upvalues: l_ffi_0 (ref), v743 (ref), v857 (ref)
    local v882 = 57.295779513082;
    local _ = math.floor(v881.m_flPoseParameter[11] * 120 - v882);
    local _ = 0;
    local _ = l_ffi_0.cast("CPlayer_Animation_State**", v743(v881:get_index()) + 39264)[0];
    if not v881:is_alive() or not v881:is_enemy() then
        return;
    else
        return math.clamp(v857.get_desync_delta(v881), -v882, v882);
    end;
end;
toticks = function(v886)
    return math.floor(0.5 + v886 / globals.tickinterval);
end;
local v887 = false;
hitlogs_func = function(v888)
    -- upvalues: v38 (ref), v247 (ref), v185 (ref), v887 (ref), v857 (ref), v77 (ref)
    local v889 = entity.get_local_player():get_player_weapon(false);
    if v889 == nil then
        return;
    else
        local v890 = v889:get_weapon_icon();
        local l_weapon_0 = v888.weapon;
        local v892 = v38.hitgroups[v888.hitgroup or 1];
        local l_damage_0 = v888.damage;
        local v894 = entity.get(v888.target);
        local v895 = "hit";
        local _ = "error occured";
        local v897 = v247.hitlogs.custom_color:get();
        local _ = v897.r;
        local _ = v897.g;
        local _ = v897.b;
        if not v247.hitlogs:get() then
            return;
        else
            if l_weapon_0 == "hegrenade" then
                v895 = "bombed";
            end;
            if l_weapon_0 == "inferno" then
                v895 = "burned";
            end;
            if l_weapon_0 == "knife" then
                v895 = "knifed";
            end;
            local v901 = math.max(0, v894.m_iHealth);
            local v902 = v38.hitgroups[v888.wanted_hitgroup];
            local v903 = math.max(0, v894.m_iHealth) > 0;
            local v904 = v892 ~= v902 and string.format("%s(%s)", v892, v902) or v892;
            local v905 = l_damage_0 ~= v888.wanted_damage and string.format("%s(%s)", l_damage_0, v888.wanted_damage) or l_damage_0;
            local v906 = v903 and string.format("remaining %s | ", v901) or "";
            local v907 = math.floor(v888.hitchance);
            local v908 = v247.hitlogs.custom_color:get();
            local v909 = math.floor(to_time(v888.backtrack) * 1000);
            local v910 = false;
            local v911 = l_weapon_0 == "hegrenade" or l_weapon_0 == "inferno";
            if v247.hitlogs.weapon_icon:get() then
                v910 = v185.ternary(v911, false, v890);
            else
                v910 = false;
            end;
            v887 = true;
            if not v888.state then
                local v912 = math.floor(v857.get_desync(v894));
                local v913 = math.clamp(v912, -58, 58);
                local v914 = ("%s %s in the %s %s %s damage [%shc: %s%% | desync: %s\194\176 | history(\206\148): %s (%sms)]"):format(v903 and "Harmed" or "Killed", v894:get_name(), v904, v903 and "for" or "with", v905, v906, v907, v913, v888.backtrack, v909);
                if v247.hitlogs.style:get() == "Modern" then
                    v77.database:new(v914, color(v908.r, v908.g, v908.b, 255), true, v910, false);
                else
                    render.log(v914);
                end;
                v185:print(v914);
            else
                local v915 = v38.reasons[v888.state] or v888.state;
                if v892 == v902 or not string.format("%s(%s)", v892, v902) then
                    local _ = v892;
                end;
                local v917 = math.floor(v857.get_desync(v894));
                local v918 = math.clamp(v917, -58, 58);
                local v919 = ("Missed shot to %s in the %s due to %s [dmg: %s | hc: %s%% | desync: %s\194\176 | history(\206\148): %s (%sms)]"):format(v894:get_name(), v902, v915, v888.wanted_damage, v907, v918, v888.backtrack, v909);
                if v247.hitlogs.style:get() == "Modern" then
                    v77.database:new(v919, color(v908.r, v908.g, v908.b, 255), true, v910, false);
                else
                    render.log(v919);
                end;
                v185:print(v919);
            end;
            return;
        end;
    end;
end;
better_dt = function()
    -- upvalues: v244 (ref), v733 (ref), v887 (ref)
    local v920 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
    local v921 = ui.find("Aimbot", "Ragebot", "Main", "Enabled");
    local v922 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
    local v923 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport");
    local v924 = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist");
    if v244.better_doubletap:get() then
        if v244.ideal_lc:get() and not v733 then
            v887 = false;
            rage.exploit:allow_charge(true);
            rage.exploit:force_charge();
        end;
        if v244.unsafe_charge:get() and v920:get() and rage.exploit:get() == 0 and not v922:get() then
            v921:override(false);
            rage.exploit:allow_charge(true);
        elseif v244.unsafe_charge:get() and v920:get() and rage.exploit:get() == 1 or v922:get() then
            v921:override(true);
        end;
        if (v244.imd_on_peek:get() == "Immediate" and v924:get() or v244.dt_sett:get() == "Immediate" and not v924:get()) and v920:get() then
            v923:override(true);
        end;
        if (v244.imd_on_peek:get() == "Delayed" and v924:get() or v244.dt_sett:get() == "Delayed" and not v924:get()) and v920:get() then
            v923:override(false);
        end;
    end;
end;
adaptive_baim = function()
    -- upvalues: v244 (ref)
    local v925 = entity.get_local_player();
    if not v925 or not v925:is_alive() then
        return;
    else
        local v926 = ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim");
        if v244.adaptive_baim:get() then
            entity.get_players(true, false, function(v927)
                -- upvalues: v926 (ref)
                local v928 = v927:is_enemy() and v927:is_alive() and (entity.get_threat(true) or entity.get_threat(false)) == v927;
                if v928 and v927.m_iHealth < 80 then
                    v926:override("Prefer");
                elseif v928 and v927.m_iHealth < 50 then
                    v926:override("Force");
                else
                    v926:override("Default");
                end;
            end);
        end;
        return;
    end;
end;
anti_os = function(v929)
    -- upvalues: v244 (ref)
    local v930 = entity.get_local_player();
    if not v930 or not v930:is_alive() then
        return;
    else
        local v931 = v930:get_player_weapon(false);
        if not v931 then
            return;
        else
            if v244.anti_os:get() then
                local l_m_fLastShotTime_1 = v931.m_fLastShotTime;
                if globals.curtime - l_m_fLastShotTime_1 <= 0.025 then
                    v929.no_choke = true;
                end;
            end;
            return;
        end;
    end;
end;
local _ = bit.lshift(1, 0);
local v934 = 9;
local function v938(v935, v936, v937)
    return math.max(v936, math.min(v935, v937));
end;
local v939 = {
    settings = {
        auto_strafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe")
    }, 
    state = {
        view_angle = vector(), 
        velocity_current = vector(), 
        velocity_previous = vector()
    }
};
local function v941(v940)
    -- upvalues: v934 (ref)
    return v940.weapon_type == v934;
end;
local function _()
    -- upvalues: v939 (ref)
    return v939.settings.auto_strafe:get();
end;
local function v958(v943, v944, v945)
    local v946 = v943.y / v943.x;
    local v947 = 1 + v946 * v946;
    local v948 = -2 * v944.x - 2 * v946 * v944.y;
    local v949 = v944:length2dsqr() - v945 * v945;
    local v950 = v948 * v948 - 4 * v947 * v949;
    if v950 < 0 then
        return v944 + (v943 * v944:dot(v943) - v944):normalized() * v945;
    else
        local v951 = math.sqrt(v950);
        local v952 = (-v948 + v951) / (2 * v947);
        local v953 = v946 * v952;
        local v954 = (-v948 - v951) / (2 * v947);
        local v955 = v946 * v954;
        local v956 = vector(v952, v953);
        local v957 = vector(v954, v955);
        return v943:dot(v956) > v943:dot(v957) and v956 or v957;
    end;
end;
local function v965(v959, v960, v961, v962)
    -- upvalues: v938 (ref), v958 (ref)
    local v963 = v959:clone();
    v963.z = 0;
    v963:normalize();
    local v964 = v938(v961 * 0.9, 15, 750) * (v938(v962, 0, 1) * 0.7 + 0.3);
    return (v958(v963, v960 * 1.25, v964) - v960 * 1.25):angles().y;
end;
local function v976(v966, v967, v968, v969, v970)
    -- upvalues: v938 (ref)
    local v971 = v938(v969 * 0.9, 15, 750) * (v938(v970, 0, 1) * 0.7 + 0.3);
    local v972 = v968 * 1.25 + v966 * v971;
    local _ = vector(v968.x, v968.y, v967) * 1.25 + v966 * v971;
    local v974 = v972:angles();
    local v975 = v966:angles().x - v974.x;
    return v975 * (math.cos(math.rad(v975)) + 1) * 0.5;
end;
local function v985(v977)
    -- upvalues: v938 (ref), v976 (ref), v965 (ref)
    local v978 = entity.get_local_player();
    if not v978 then
        return;
    else
        local v979 = v978:get_player_weapon();
        if not v979 then
            return;
        else
            local v980 = v979:get_weapon_info();
            if not v980 then
                return;
            else
                local l_velocity_0 = v977.velocity;
                local v982 = v977.angles:clone();
                local v983 = v938(v979.m_flThrowStrength, 0, 1);
                v982.x = v982.x + v976(vector():angles(v982), v938(-l_velocity_0.z, -120, 120), l_velocity_0, v980.throw_velocity, v983);
                local v984 = vector():angles(v982);
                if (l_velocity_0 * 1.25 + v984 * (v938(v980.throw_velocity * 0.9, 15, 750) * (v983 * 0.7 + 0.3))):dot(v984) > 0 then
                    v982.y = v965(v984, l_velocity_0, v980.throw_velocity, v983);
                end;
                v977.angles = v982;
                return;
            end;
        end;
    end;
end;
local function v992(v986, v987)
    -- upvalues: v941 (ref), v939 (ref), v976 (ref), v965 (ref)
    if render.camera_angles() ~= v986.view_angles then
        return;
    else
        local v988 = v987:get_player_weapon();
        if not v988 then
            return;
        else
            local v989 = v988:get_weapon_info();
            if not v989 or not v941(v989) then
                return;
            elseif not (v988.m_fThrowTime >= globals.curtime - to_time(globals.clock_offset)) then
                return;
            else
                local v990 = vector():angles(v986.view_angles);
                local v991 = (v939.state.velocity_current + v939.state.velocity_previous) * 0.5;
                v986.view_angles.x = v986.view_angles.x + v976(vector():angles(v986.view_angles), 0, v991, v989.throw_velocity, v988.m_flThrowStrength);
                v986.view_angles.y = v965(v990, v991, v989.throw_velocity, v988.m_flThrowStrength);
                return;
            end;
        end;
    end;
end;
local function v996(v993)
    -- upvalues: v939 (ref), v992 (ref)
    local v994 = entity.get_local_player();
    local v995 = v994:simulate_movement();
    v995:think(1);
    v939.state.velocity_current = v995.velocity;
    v939.state.velocity_previous = v939.state.velocity_current;
    v992(v993, v994);
end;
aimtools_func = function()
    -- upvalues: v244 (ref), v253 (ref)
    local v997 = entity.get_local_player();
    if not (v997 and v997:is_alive() and true or false) then
        return;
    else
        local v998 = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance");
        local v999 = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Multipoint", "Head Scale");
        local v1000 = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Multipoint", "Body Scale");
        local v1001 = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Min. Damage");
        if v244.aimtools:get() then
            local v1002 = entity.get_threat();
            if not entity.get_threat() then
                v998:override(v253[2].hitchance:get());
                v999:override(v253[2].headscale:get());
                v1000:override(v253[2].bodyscale:get());
                v1001:override(v253[2].minimum_dmg:get());
                return;
            else
                local v1003 = v1002:get_origin().z + 64 < v997:get_origin().z;
                local v1004 = v1002:get_origin().z - 64 > v997:get_origin().z;
                local l_m_fFlags_7 = v997.m_fFlags;
                local v1006 = bit.lshift(1, 0);
                if v1003 and bit.band(l_m_fFlags_7, v1006) ~= 0 then
                    v998:override(v253[1].hitchance:get());
                    v999:override(v253[1].headscale:get());
                    v1000:override(v253[1].bodyscale:get());
                    v1001:override(v253[1].minimum_dmg:get());
                elseif v1004 and bit.band(l_m_fFlags_7, v1006) ~= 0 then
                    v998:override(v253[3].hitchance:get());
                    v999:override(v253[3].headscale:get());
                    v1000:override(v253[3].bodyscale:get());
                    v1001:override(v253[3].minimum_dmg:get());
                elseif not v1004 and not v1003 and bit.band(l_m_fFlags_7, v1006) ~= 0 then
                    v998:override(v253[2].hitchance:get());
                    v999:override(v253[2].headscale:get());
                    v1000:override(v253[2].bodyscale:get());
                    v1001:override(v253[2].minimum_dmg:get());
                elseif bit.band(l_m_fFlags_7, v1006) == 0 then
                    v998:override(v253[4].hitchance:get());
                    v999:override(v253[4].headscale:get());
                    v1000:override(v253[4].bodyscale:get());
                    v1001:override(v253[4].minimum_dmg:get());
                else
                    v998:override(v253[2].hitchance:get());
                    v999:override(v253[2].headscale:get());
                    v1000:override(v253[2].bodyscale:get());
                    v1001:override(v253[2].minimum_dmg:get());
                end;
            end;
        else
            v998:override();
            v999:override();
            v1000:override();
            v1001:override();
        end;
        return;
    end;
end;
states_enemy = function(v1007)
    -- upvalues: v185 (ref)
    local v1008 = entity.get_local_player();
    if not (v1008 and v1008:is_alive() and true or false) then
        return;
    else
        local l_v1007_0 = v1007;
        if not l_v1007_0 then
            return;
        else
            local l_m_fFlags_8 = l_v1007_0.m_fFlags;
            local _ = l_v1007_0.m_hGroundEntity;
            local _ = l_m_fFlags_8 == 256 or l_m_fFlags_8 == 262;
            local _ = v185.get_velocity(l_v1007_0) > 3;
            local v1014 = bit.lshift(1, 1);
            local v1015 = bit.lshift(1, 0);
            if bit.band(l_m_fFlags_8, v1015) == 1 and v185.get_velocity(l_v1007_0) > 5 and v185.get_velocity(l_v1007_0) < 80 and bit.band(l_m_fFlags_8, v1014) == 0 then
                return "slowmotion";
            elseif bit.band(l_m_fFlags_8, v1015) == 1 and (v185.get_velocity(l_v1007_0) > 100 or v185.get_velocity(l_v1007_0) < 4) and bit.band(l_m_fFlags_8, v1014) == 0 then
                return "moving/standing";
            elseif bit.band(l_m_fFlags_8, v1015) == 0 and bit.band(l_m_fFlags_8, v1014) > 0.9 then
                return "air + c";
            elseif bit.band(l_m_fFlags_8, v1015) == 1 and bit.band(l_m_fFlags_8, v1014) > 0.9 then
                return "crouch";
            elseif bit.band(l_m_fFlags_8, v1015) == 0 and bit.band(l_m_fFlags_8, v1014) == 0 then
                return "air";
            else
                return;
            end;
        end;
    end;
end;
local v1034 = {
    wall_detection_distance = 50, 
    distance_threshold = 1, 
    slowmotion_speed_factor = 0.5, 
    set_target = function(v1016, v1017)
        v1016.target = v1017;
    end, 
    update = function(v1018, v1019)
        local v1020 = entity.get_local_player();
        if not (v1020 and v1020:is_alive() and true or false) then
            return;
        elseif not v1018.target then
            return;
        else
            local v1021 = v1020:get_origin();
            local v1022 = v1018.target:get_origin();
            if not v1021 or not v1022 then
                return;
            else
                local v1023 = math.sqrt((v1022.x - v1021.x) ^ 2 + (v1022.y - v1021.y) ^ 2 + (v1022.z - v1021.z) ^ 2);
                local v1024 = render.camera_angles();
                if v1024.y == nil then
                    v1024.y = 0;
                end;
                if v1023 > 0 then
                    local v1025 = {
                        x = v1022.x - v1021.x, 
                        y = v1022.y - v1021.y
                    };
                    if not v1025.x or not v1025.y then
                        return;
                    else
                        local v1026 = math.atan2(v1025.y, v1025.x) * (180 / math.pi);
                        local v1027 = false;
                        if not v1018:is_path_clear(v1021, {
                            x = v1021.x + v1025.x * v1018.wall_detection_distance, 
                            y = v1021.y + v1025.y * v1018.wall_detection_distance, 
                            z = v1021.z
                        }) then
                            v1027 = true;
                        end;
                        local v1028 = states_enemy(v1018.target);
                        local v1029 = (v1025.x * math.cos(math.rad(v1024.y)) + v1025.y * math.sin(math.rad(v1024.y))) * 450;
                        local v1030 = (v1025.y * math.cos(math.rad(v1024.y)) - v1025.x * math.sin(math.rad(v1024.y))) * 450;
                        if v1028 == "slowmotion" then
                            v1029 = v1029 * v1018.slowmotion_speed_factor;
                            v1030 = v1030 * v1018.slowmotion_speed_factor;
                            v1019.block_movement = 1;
                        else
                            v1019.block_movement = 0;
                        end;
                        if v1027 then
                            v1030 = v1025.y > 0 and -450 or 450;
                            v1029 = 0;
                        end;
                        if v1018.target and v1018.target:is_alive() then
                            if v1018.distance_threshold < v1023 then
                                v1019.forwardmove = v1029;
                                v1019.sidemove = v1030;
                                render.camera_angles(vector(v1024.x, v1026, 0));
                            end;
                            if v1028 == "air + c" then
                                v1019.in_jump = 1;
                                v1019.in_duck = 1;
                            elseif v1028 == "crouch" then
                                v1019.in_jump = 0;
                                v1019.in_duck = 1;
                            elseif v1028 == "air" then
                                v1019.in_jump = 1;
                                v1019.in_duck = 0;
                            elseif v1028 == "moving/standing" then
                                v1019.in_jump = 0;
                                v1019.in_duck = 0;
                            else
                                v1019.in_jump = 0;
                                v1019.in_duck = 0;
                            end;
                        end;
                    end;
                else
                    v1019.in_jump = 0;
                    v1019.in_duck = 0;
                    v1019.block_movement = 0;
                    v1019.forwardmove = 0;
                    v1019.sidemove = 0;
                end;
                return;
            end;
        end;
    end, 
    is_path_clear = function(v1031, v1032, v1033)
        return math.sqrt((v1033.x - v1032.x) ^ 2 + (v1033.y - v1032.y) ^ 2 + (v1033.z - v1032.z) ^ 2) > v1031.wall_detection_distance;
    end
};
local v1042 = {
    vector = function(v1035, v1036)
        local v1037 = nil;
        local v1038 = nil;
        local v1039 = nil;
        local v1040 = nil;
        v1037 = math.sin(math.rad(v1035));
        v1038 = math.sin(math.rad(v1036));
        v1039 = math.cos(math.rad(v1035));
        v1040 = math.cos(math.rad(v1036));
        return vector(v1039 * v1040, v1039 * v1038, -v1037);
    end, 
    velocity = function(v1041)
        if v1041 == nil then
            return;
        else
            return (v1041.m_vecVelocity:length());
        end;
    end
};
v1042.handle = function(v1043)
    -- upvalues: v248 (ref), v1042 (ref)
    local v1044 = entity.get_local_player();
    if not v1044 then
        return;
    elseif not v248.avoid_collisions:get() then
        return;
    else
        local v1045 = v248.avoid_collisions_range:get();
        local l_y_2 = render.camera_angles().y;
        local l_m_vecOrigin_1 = v1044.m_vecOrigin;
        local l_huge_0 = math.huge;
        local l_huge_1 = math.huge;
        for v1050 = 1, 180 do
            local l_x_4 = v1042.vector(0, l_y_2 + v1050 - 90).x;
            local l_y_3 = v1042.vector(0, l_y_2 + v1050 - 90).y;
            local _ = v1042.vector(0, l_y_2).z;
            local v1054 = l_m_vecOrigin_1.x + l_x_4 * 70;
            local v1055 = l_m_vecOrigin_1.y + l_y_3 * 70;
            local v1056 = l_m_vecOrigin_1.z + 60;
            local v1057 = utils.trace_line(l_m_vecOrigin_1, vector(v1054, v1055, v1056), nil, nil, 1);
            if l_m_vecOrigin_1:dist(v1057.end_pos) < l_huge_0 then
                l_huge_0 = l_m_vecOrigin_1:dist(v1057.end_pos);
                l_huge_1 = v1050;
            end;
        end;
        if l_huge_0 < 25 + v1045 and v1043.in_jump and not v1043.in_moveright and not v1043.in_moveleft and not v1043.in_back then
            forward_velo = math.abs(v1042.velocity(v1044) * math.cos(math.rad(l_huge_1)));
            if math.abs(l_huge_1 - 90) < 40 then
                side_velo = v1042.velocity(v1044) * math.sin(math.rad(l_huge_1)) * (25 + v1045 - l_huge_0) / 15;
            else
                side_velo = v1042.velocity(v1044) * math.sin(math.rad(l_huge_1));
            end;
            v1043.forwardmove = forward_velo;
            if l_huge_1 >= 90 then
                v1043.sidemove = side_velo;
            else
                v1043.sidemove = side_velo * -1;
            end;
        end;
        return;
    end;
end;
events.createmove:set(function(v1058)
    -- upvalues: v248 (ref), v285 (ref), v1034 (ref), v1042 (ref)
    if v248.follow_bot:get() then
        local v1059 = v248.follow_player_list:get();
        if v285 and type(v285) == "table" then
            local v1060 = nil;
            for v1061, v1062 in pairs(v285) do
                if v1062 == v1059 then
                    v1060 = v1061;
                    break;
                end;
            end;
            if v1060 then
                local v1063 = entity.get(v1060);
                if v1063 and v1063:is_alive() then
                    v1034:set_target(v1063);
                    v1034:update(v1058);
                else
                    v1034:set_target(nil);
                end;
            else
                v1034:set_target(nil);
            end;
        else
            v1034:set_target(nil);
        end;
    end;
    v1042.handle(v1058);
end);
events.console_input:set(function(v1064)
    -- upvalues: v248 (ref), v245 (ref)
    local v1065 = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist");
    if v248.follow_bot:get() then
        if v1064 == "/autopeek true" or v1064 == "/ap true" then
            v1065:override(true);
        elseif v1064 == "/autopeek false" or v1064 == "/ap false" then
            v1065:override(false);
        end;
        if v1064 == "/defensive true" or v1064 == "/def true" then
            v245.defensive_flick:override(true);
        elseif v1064 == "/defensive false" or v1064 == "/def false" then
            v245.defensive_flick:override(false);
        end;
    end;
end);
events.createmove:set(function(v1066)
    -- upvalues: v248 (ref), v996 (ref)
    if v248.supertoss:get() then
        v996(v1066);
    end;
end);
events.grenade_override_view:set(function(v1067)
    -- upvalues: v248 (ref), v985 (ref)
    if v248.supertoss:get() then
        v985(v1067);
    end;
end);
events.render:set(function()
    -- upvalues: v77 (ref), v350 (ref), v359 (ref), v688 (ref), v247 (ref), v86 (ref)
    viewaspect();
    v77.handler:paint();
    damage_indicator();
    side_ind();
    crosshair_indicator();
    clantag_func();
    v350();
    v359();
    v688();
    auto_tp();
    air_lag();
    adaptive_baim();
    better_dt();
    aimtools_func();
    if v247.hitlogs:get() and v247.hitlogs.style:get() == "Simple" then
        v86();
    end;
end);
events.createmove:set(function(v1068)
    anti_os(v1068);
end);
events.aim_ack:set(function(v1069)
    hitlogs_func(v1069);
end);
events.render:set(function()
    -- upvalues: l_gradient_0 (ref)
    local v1070 = ui.get_style("Link Active");
    local v1071 = l_gradient_0.text_animate("Maniak.lua", -0.7, {
        v1070, 
        color(v1070.r * 0.5, v1070.g * 0.5, v1070.b * 0.5, 255)
    });
    ui.sidebar(v1071:get_animated_text(), ui.get_icon("biohazard"));
    v1071:animate();
end);
v247.hitlogs.custom_color:depend({
    [1] = nil, 
    [2] = "Modern", 
    [1] = v247.hitlogs.style
});
v247.hitlogs.weapon_icon:depend({
    [1] = nil, 
    [2] = "Modern", 
    [1] = v247.hitlogs.style
});
local v1072 = l_pui_0.setup({
    [1] = v251, 
    [2] = v252, 
    [3] = v253, 
    [4] = v254, 
    [5] = v244, 
    [6] = v245, 
    [7] = v246, 
    [8] = v247, 
    [9] = v248, 
    [10] = v249, 
    [11] = v250
}, true);
local v1086 = {
    save = function(_)
        -- upvalues: v185 (ref), v238 (ref)
        v185.ac(function()
            -- upvalues: v238 (ref)
            return v238.local_cfg == v238.local_cfg;
        end);
    end, 
    load = function(v1074, v1075)
        -- upvalues: v238 (ref), v185 (ref), v1072 (ref)
        for v1076, v1077 in ipairs(v238.local_cfg) do
            if v1077.name == v1075 then
                v1074.loaded = v1076;
                v185.ac(function()
                    -- upvalues: v238 (ref)
                    return v238.loaded_config == v238.loaded_cfg;
                end);
                v185.ac(function()
                    -- upvalues: v1072 (ref), v1077 (ref)
                    return v1072:load(v1077.config);
                end, "failed to load config data (maybe outdated?)");
                return true;
            else
                --[[ close >= 5 ]]
            end;
        end;
        return false;
    end, 
    find = function(v1078, v1079)
        -- upvalues: v238 (ref)
        if not v1078 then
            return nil;
        else
            for _, v1081 in ipairs(v238.local_cfg) do
                if v1081.name == v1079 then
                    return v1081;
                end;
            end;
            return nil;
        end;
    end, 
    delete = function(v1082, v1083)
        -- upvalues: v238 (ref)
        if not v1082 then
            return false;
        else
            for v1084, v1085 in ipairs(v238.local_cfg) do
                if v1085.name == v1083 then
                    table.remove(v238.local_cfg, v1084);
                    v1082:save();
                    return true;
                end;
            end;
            return false;
        end;
    end
};
local function v1090()
    -- upvalues: v238 (ref), v47 (ref)
    local v1087 = {};
    for _, v1089 in ipairs(v238.local_cfg) do
        if type(v1089) == "table" and v1089.name then
            if v238.local_cfg[v238.loaded_cfg] and v238.local_cfg[v238.loaded_cfg].name == v1089.name then
                table.insert(v1087, ("\a" .. v47.hex .. "\226\128\162 \aCACACAFF %s"):format(v1089.name));
            else
                table.insert(v1087, v1089.name);
            end;
        end;
    end;
    return v1087;
end;
local v1091 = v255.home_cfg:list("Config List", (function()
    -- upvalues: v238 (ref), v1090 (ref)
    return #v238.local_cfg > 0 and v1090() or {
        [1] = "None"
    };
end)());
local v1092 = v255.home_cfg:input("");
local v1093 = v255.home_cfg:button("\a" .. v47.hex .. "\f<circle-plus> " .. "  \aDEFAULTCreate", function()

end, true);
local v1094 = v255.home_cfg:button("\a" .. v47.hex .. "\f<spinner> " .. "  \aDEFAULTLoad", function()

end, true);
local v1095 = v255.home_cfg:button("\a" .. v47.hex .. "\f<floppy-disk> " .. "  \aDEFAULTSave", function()

end, true);
local v1096 = v255.home_cfg:button("\a" .. v47.hex .. "\f<trash> " .. "  \aDEFAULTDelete", function()

end, true);
local v1097 = v255.home_cfg:button("\a" .. v47.hex .. "\f<file-export> " .. "  \aDEFAULTExport", function()

end, true);
local v1098 = v255.home_cfg:button("\a" .. v47.hex .. "\f<file-import> " .. "  \aDEFAULTImport", function()

end, true);
create_default_cfg = function()
    -- upvalues: v236 (ref), v237 (ref), v4 (ref), v1086 (ref), v238 (ref), v1091 (ref)
    local v1099 = network.get("https://raw.githubusercontent.com/JustManiak/Maniak.lua/refs/heads/main/default.txt"):gsub(("%s:%s:"):format(v236, v237), "");
    local v1100 = json.parse(v4.decode(v1099));
    local v1101 = "Default";
    if v1086:find(v1101) ~= nil then
        return;
    else
        table.insert(v238.local_cfg, {
            name = v1101, 
            config = v1100.config
        });
        local v1102 = {};
        for _, v1104 in pairs(v238.local_cfg) do
            table.insert(v1102, v1104.name);
        end;
        v1086:save();
        v1091:update(v1102);
        return;
    end;
end;
v1093:set_callback(function()
    -- upvalues: v1092 (ref), v185 (ref), v1086 (ref), v238 (ref), v1090 (ref), v1091 (ref)
    if v1092:get() == "" then
        v185:print("Config name cannot be empty!");
        return;
    elseif v1086:find(v1092:get()) ~= nil then
        v185:print("Config already exists!");
        utils.console_exec("play resource\\warning.wav");
        return;
    else
        table.insert(v238.local_cfg, {
            name = v1092:get(), 
            config = v1086:save()
        });
        v185:print("Added config: " .. v1092:get());
        utils.console_exec("play survival\\buy_item_01.wav");
        local v1105 = v1090();
        v1086:save();
        v1091:update(v1105);
        return;
    end;
end);
v1094:set_callback(function()
    -- upvalues: v1091 (ref), v238 (ref), v1086 (ref), v1090 (ref)
    local v1106 = v1091:get();
    local v1107 = v238.local_cfg[v1106];
    if not v1107 or not v1107.name then
        print("Error: Invalid config selected.");
        return;
    else
        if v1086:load(v1107.name) then
            print("Loaded config: " .. v1107.name);
            utils.console_exec("play survival\\buy_item_01.wav");
        else
            print("Failed to load config: " .. v1107.name);
            utils.console_exec("play resource\\warning.wav");
        end;
        local v1108 = v1090();
        if type(v1108) ~= "table" then
            print("Error: `get_configs_names` did not return a table.");
            v1108 = {
                [1] = "None"
            };
        end;
        v1091:update(v1108);
        return;
    end;
end);
v1095:set_callback(function()
    -- upvalues: v238 (ref), v1091 (ref), v185 (ref), v1072 (ref), v1086 (ref), v123 (ref)
    if v238.local_cfg[v1091:get()] then
        v185.ac(function()
            -- upvalues: v238 (ref), v1091 (ref), v1072 (ref), v1086 (ref)
            v238.local_cfg[v1091:get()].config = v1072:save();
            return v1086:save();
        end, "error 801");
        v185:print("Config", "\b", v238.local_cfg[v1091:get()].name .. " saved successfully!");
        v123.new("square-check", "Config " .. v238.local_cfg[v1091:get()].name .. " saved successfully!", ui.get_style("Link Active"));
        utils.console_exec("play survival\\buy_item_01.wav");
    else
        v185:print("There was an error saving your config.");
        utils.console_exec("play resource\\warning.wav");
    end;
end);
v1096:set_callback(function()
    -- upvalues: v1091 (ref), v238 (ref), v1086 (ref)
    local v1109 = v1091:get();
    local v1110 = v238.local_cfg[v1109];
    if not v1110 or v1110.name == "None" then
        print("Invalid or non-deletable config selected.");
        return;
    else
        if v1086:delete(v1110.name) then
            print("Deleted config: " .. v1110.name);
        else
            print("Failed to delete the config. Ensure it exists.");
        end;
        local v1111 = {};
        for _, v1113 in ipairs(v238.local_cfg) do
            table.insert(v1111, v1113.name);
        end;
        v1091:update(#v1111 > 0 and v1111 or {
            [1] = "None"
        });
        return;
    end;
end);
v1097:set_callback(function()
    -- upvalues: v238 (ref), v1091 (ref), v1086 (ref), v236 (ref), v237 (ref), v4 (ref), l_clipboard_0 (ref)
    local l_name_0 = v238.local_cfg[v1091:get()].name;
    if l_name_0 then
        local v1115 = v1086:find(l_name_0);
        if not v1115 then
            print("Config not found!");
            utils.console_exec("play resource\\warning.wav");
            return;
        else
            local v1116 = ("%s%s"):format(("%s:%s:"):format(v236, v237), (v4.encode(json.stringify(v1115))));
            l_clipboard_0.set(v1116);
            print("Exported to clipboard: " .. l_name_0);
            utils.console_exec("play survival\\buy_item_01.wav");
        end;
    else
        print("Couldn't Export");
    end;
end);
v1098:set_callback(function()
    -- upvalues: l_clipboard_0 (ref), v236 (ref), v237 (ref), v4 (ref), v1086 (ref), v238 (ref), v1091 (ref)
    local v1117 = l_clipboard_0.get():gsub(("%s:%s:"):format(v236, v237), "");
    local v1118 = json.parse(v4.decode(v1117));
    local l_name_1 = v1118.name;
    if v1086:find(l_name_1) ~= nil then
        l_name_1 = ("%s_%s"):format(l_name_1, math.random(0, 1000));
    end;
    table.insert(v238.local_cfg, {
        name = l_name_1, 
        config = v1118.config
    });
    print("Imported config: " .. l_name_1);
    local v1120 = {};
    for _, v1122 in pairs(v238.local_cfg) do
        table.insert(v1120, v1122.name);
    end;
    v1086:save();
    v1091:update(v1120);
end);
events.shutdown:set(function()
    -- upvalues: v224 (ref), v238 (ref)
    for _, v1124 in pairs(v224) do
        v1124:disabled(false);
    end;
    db.maniak_configs_reworked = v238;
end);
local v1125 = "0858dcffabb19cf27bcae1865f8530c5";
local v1126 = "https://raw.githubusercontent.com/M0bby/maniak_temp/refs/heads/main/mnk_.png";
local function v1128()
    -- upvalues: v1125 (ref)
    events.voice_message:call(function(v1127)
        -- upvalues: v1125 (ref)
        v1127:write_bits(33409, 128);
        v1127:crypt(v1125);
    end);
end;
local function v1132()
    -- upvalues: v1125 (ref)
    local v1129 = entity.get_local_player();
    if v1129 == nil then
        return;
    else
        v1129:set_icon();
        events.voice_message:call(function(v1130)
            -- upvalues: v1125 (ref)
            v1130:write_bits(5473, 128);
            v1130:crypt(v1125);
        end);
        entity.get_players(false, false, function(v1131)
            v1131:set_icon();
        end);
        return;
    end;
end;
local function v1136()
    -- upvalues: v248 (ref), v1126 (ref), v1125 (ref)
    if v248.shared_icon:get() then
        local v1133 = entity.get_local_player();
        if v1133 == nil then
            return;
        else
            do
                local l_v1133_0 = v1133;
                utils.execute_after(0.5, function()
                    -- upvalues: l_v1133_0 (ref), v1126 (ref)
                    l_v1133_0:set_icon(v1126);
                end);
                events.voice_message:call(function(v1135)
                    -- upvalues: v1125 (ref)
                    v1135:write_bits(33409, 128);
                    v1135:crypt(v1125);
                end);
            end;
        end;
    end;
end;
events.voice_message(function(v1137)
    -- upvalues: v248 (ref), v1125 (ref), v1128 (ref), v1126 (ref)
    if v248.shared_icon:get() then
        local l_buffer_0 = v1137.buffer;
        local v1139 = entity.get_local_player();
        if v1139 == nil then
            return;
        elseif v1137.entity == v1139 then
            return;
        else
            l_buffer_0:crypt(v1125);
            local v1140 = l_buffer_0:read_bits(128);
            if v1137.entity == nil then
                return;
            elseif v1137.entity:is_bot() then
                return;
            elseif v1140 == 33409 then
                utils.execute_after(0.3, v1128);
                v1137.entity:set_icon(v1126);
            elseif v1140 == 5473 then
                v1137.entity:set_icon();
            end;
        end;
    end;
end);
v248.shared_icon:set_callback(function(v1141)
    -- upvalues: v1128 (ref), v1136 (ref), v1132 (ref)
    if v1141:get() then
        utils.execute_after(0.5, v1128);
        utils.execute_after(1, v1136);
    end;
    if not v1141:get() then
        v1132();
    end;
end, true);
v244.interpolation_fix:set_callback(function(v1142)
    if v1142:get() then
        hook_prediction();
    end;
end);
events.round_start:set(function()
    -- upvalues: v248 (ref)
    if not v248.shared_icon:get() then
        local v1143 = entity.get_local_player();
        if v1143 == nil then
            return;
        else
            v1143:set_icon();
        end;
    end;
end);
events.level_init:set(v1136);
events.shutdown:set(v1132);
create_default_cfg();
v123.new("square-check", "Welcome to Maniak.lua " .. v40, ui.get_style("Link Active"));