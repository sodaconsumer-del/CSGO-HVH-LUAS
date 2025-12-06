local l_get_style_0 = ui.get_style;
local l_get_username_0 = common.get_username;
local l_create_interface_0 = utils.create_interface;
local l_opcode_scan_0 = utils.opcode_scan;
local l_get_0 = network.get;
local l_print_raw_0 = print_raw;
local l_write_0 = files.write;
local l_get_game_directory_0 = common.get_game_directory;
local l_sub_0 = string.sub;
local l_require_0 = require;
local l_error_0 = error;
local l_find_0 = string.find;
local l_gsub_0 = string.gsub;
local l_create_folder_0 = files.create_folder;
local l_load_image_from_file_0 = render.load_image_from_file;
local l_load_font_0 = render.load_font;
local l_vector_0 = vector;
local l_color_0 = color;
local l_panorama_0 = panorama;
local l_get_system_time_0 = common.get_system_time;
local l_get_date_0 = common.get_date;
local l_stringify_0 = json.stringify;
local l_parse_0 = json.parse;
local l_add_notify_0 = common.add_notify;
local l_console_exec_0 = utils.console_exec;
local l_print_dev_0 = print_dev;
local l_print_0 = print;
local l_execute_after_0 = utils.execute_after;
local l_sidebar_0 = ui.sidebar;
local l_create_0 = ui.create;
local l_get_icon_0 = ui.get_icon;
local _ = table.insert;
local l_upper_0 = string.upper;
local l_floor_0 = math.floor;
local l_lower_0 = string.lower;
local l_screen_size_0 = render.screen_size;
local l_random_0 = math.random;
local l_get_alpha_0 = ui.get_alpha;
local l_type_0 = type;
local l_post_0 = network.post;
local l_find_1 = ui.find;
local l_sin_0 = math.sin;
local l_rad_0 = math.rad;
local l_get_local_player_0 = entity.get_local_player;
local l_band_0 = bit.band;
local l_is_button_down_0 = common.is_button_down;
local l_get_threat_0 = entity.get_threat;
local l_antiaim_0 = rage.antiaim;
local l_exploit_0 = rage.exploit;
local l_cast_0 = ffi.cast;
local l_cdef_0 = ffi.cdef;
local l_typeof_0 = ffi.typeof;
local l_new_0 = ffi.new;
local l_get_1 = entity.get;
local l_abs_0 = math.abs;
local l_min_0 = math.min;
local l_measure_text_0 = render.measure_text;
local l_rect_0 = render.rect;
local l_blur_0 = render.blur;
local l_text_0 = render.text;
local l_ipairs_0 = ipairs;
local l_texture_0 = render.texture;
local l_get_game_rules_0 = entity.get_game_rules;
local _ = common.set_clan_tag;
local l_camera_angles_0 = render.camera_angles;
local l_is_in_thirdperson_0 = common.is_in_thirdperson;
local l_trace_line_0 = utils.trace_line;
local l_cos_0 = math.cos;
local l_clamp_0 = math.clamp;
local l_gradient_0 = render.gradient;
local l_push_rotation_0 = render.push_rotation;
local l_pop_rotation_0 = render.pop_rotation;
local l_get_players_0 = entity.get_players;
local l_trace_bullet_0 = utils.trace_bullet;
local l_pairs_0 = pairs;
local _ = string.match;
local l_deg_0 = math.deg;
local l_sqrt_0 = math.sqrt;
local l_atan2_0 = math.atan2;
local l_rep_0 = string.rep;
local l_max_0 = math.max;
local v81 = {
    Dev = false, 
    Api = "omega.moe", 
    Nightly = true, 
    Update = "18.06.2025"
};
local v82 = {
    Main_Color = l_get_style_0("Text"), 
    Accent_Color = l_get_style_0("Link Active"), 
    Tab_Color = l_get_style_0("Small Text")
};
(function()
    -- upvalues: v81 (ref), l_get_username_0 (ref), l_error_0 (ref)
    local v83 = {
        [1] = "gappen", 
        [2] = "NothingHvH", 
        [3] = "k0bix", 
        [4] = "sora", 
        [5] = "Lumin", 
        [6] = "mati2115690", 
        [7] = "yukischatsa", 
        [8] = "inmyhell", 
        [9] = "tekashi", 
        [10] = "ates4bey", 
        [11] = "ziwer", 
        [12] = "bukszpan", 
        [13] = "Chr1s", 
        [14] = "Cheat_tester", 
        [15] = "Kretowiec"
    };
    if v81.Nightly then
        v83 = {
            [1] = "7oyungamer", 
            [2] = "r1kzzyla", 
            [3] = "WebCheater69", 
            [4] = "skywhy"
        };
    end;
    for _, v85 in next, v83 do
        if v85 == l_get_username_0() then
            l_error_0("Access Denied ~ For more information create ticket on our discord.gg/RYfahY7q65");
        end;
    end;
end)();
local v86 = l_require_0("ffi");
local v87 = v86.load("UrlMon");
local v88 = v86.load("WinInet");
l_cdef_0("    typedef uintptr_t (__thiscall* GetClientEntity_4242425_t)(void*, int);\n    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n\n    typedef struct {\n        unsigned char r, g, b;\n        signed char exponent;\n    } Color_t;\n\n    typedef struct\n    {\n        float x;\n        float y;\n        float z;\n    } Vector_t;\n\n    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder; //0x0014\n        int m_nSequence; //0x0018\n        float m_flPrevCycle; //0x001C\n        float m_flWeight; //0x0020\n        float m_flWeightDeltaRate; //0x0024\n        float m_flPlaybackRate; //0x0028\n        float m_flCycle; //0x002C\n        void *m_pOwner; //0x0030\n        char  pad_0038[4]; //0x0034\n    } CAnimationLayer;\n\n    typedef struct\n    {\n        char    pad0[0x60]; // 0x00\n        void* pEntity; // 0x60\n        void* pActiveWeapon; // 0x64\n        void* pLastActiveWeapon; // 0x68\n        float        flLastUpdateTime; // 0x6C\n        int            iLastUpdateFrame; // 0x70\n        float        flLastUpdateIncrement; // 0x74\n        float        flEyeYaw; // 0x78\n        float        flEyePitch; // 0x7C\n        float        flGoalFeetYaw; // 0x80\n        float        flLastFeetYaw; // 0x84\n        float        flMoveYaw; // 0x88\n        float        flLastMoveYaw; // 0x8C // changes when moving/jumping/hitting ground\n        float        flLeanAmount; // 0x90\n        char         pad1[0x4]; // 0x94\n        float        flFeetCycle; // 0x98 0 to 1\n        float        flMoveWeight; // 0x9C 0 to 1\n        float        flMoveWeightSmoothed; // 0xA0\n        float        flDuckAmount; // 0xA4\n        float        flHitGroundCycle; // 0xA8\n        float        flRecrouchWeight; // 0xAC\n        Vector_t        vecOrigin; // 0xB0\n        Vector_t        vecLastOrigin;// 0xBC\n        Vector_t        vecVelocity; // 0xC8\n        Vector_t        vecVelocityNormalized; // 0xD4\n        Vector_t        vecVelocityNormalizedNonZero; // 0xE0\n        float        flVelocityLenght2D; // 0xEC\n        float        flJumpFallVelocity; // 0xF0\n        float        flSpeedNormalized; // 0xF4 // clamped velocity from 0 to 1\n        float        flRunningSpeed; // 0xF8\n        float        flDuckingSpeed; // 0xFC\n        float        flDurationMoving; // 0x100\n        float        flDurationStill; // 0x104\n        bool        bOnGround; // 0x108\n        bool        bHitGroundAnimation; // 0x109\n        char    pad2[0x2]; // 0x10A\n        float        flNextLowerBodyYawUpdateTime; // 0x10C\n        float        flDurationInAir; // 0x110\n        float        flLeftGroundHeight; // 0x114\n        float        flHitGroundWeight; // 0x118 // from 0 to 1, is 1 when standing\n        float        flWalkToRunTransition; // 0x11C // from 0 to 1, doesnt change when walking or crouching, only running\n        char    pad3[0x4]; // 0x120\n        float        flAffectedFraction; // 0x124 // affected while jumping and running, or when just jumping, 0 to 1\n        char    pad4[0x208]; // 0x128\n        float        flMinBodyYaw; // 0x330\n        float        flMaxBodyYaw; // 0x334\n        float        flMinPitch; //0x338\n        float        flMaxPitch; // 0x33C\n        int            iAnimsetVersion; // 0x340\n    } CCSGOPlayerAnimationState_534535_t;\n\n    typedef struct {\n        int flags;\n        Vector_t origin;\n        float radius;\n        Color_t color;\n        float die;\n        float decay;\n        float minlight;\n        int key;\n        int style;\n        Vector_t direction;\n        float innerAngle;\n        float outerAngle;\n    } dlight_t;\n\n    typedef struct{\n        Vector_t\t\t\tm_vPos;\n        Vector_t\t\t\tm_vAngles;\n        int\t\t\t\tm_nEntIndex;\n        const char\t\t*m_pszSpriteName;\n        float\t\t\tm_flBeamWidth;\n        int\t\t\t\tm_nBeams;\n        Vector_t\t\t\tm_vColor;\n        float\t\t\tm_flTimeVisible;\n        float\t\t\tm_flRadius;\n    } CTeslaInfo;\n    typedef void (__thiscall*FX_TeslaFn)(const CTeslaInfo &teslaInfo);\n\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);  \n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n");
local v89 = l_cast_0("void***", l_create_interface_0("filesystem_stdio.dll", "VBaseFileSystem011"));
local v90 = l_cast_0("bool(__thiscall*)(void*, const char*, const char*)", v89[0][10]);
local v91 = l_cast_0("void***", l_create_interface_0("client.dll", "VClientEntityList003"));
local v92 = l_cast_0("get_client_entity_t", v91[0][3]);
local v93 = l_cast_0(l_typeof_0("void***"), l_create_interface_0("engine.dll", "VEngineEffects001"));
local v94 = l_cast_0(l_typeof_0("dlight_t*(__thiscall*)(void*, int)"), v93[0][4]);
local v95 = l_cast_0(l_typeof_0("dlight_t*(__thiscall*)(void*, int)"), v93[0][5]);
local v96 = l_cast_0("FX_TeslaFn", l_opcode_scan_0("client.dll", "55 8B EC 81 ? ? ? ? ? 56 57 8B F9 8B 47 18"));
local v97 = l_new_0("CTeslaInfo");
local function v99(v98)
    -- upvalues: v92 (ref), v91 (ref)
    return (v92(v91, v98));
end;
local function v102(v100, v101)
    -- upvalues: v88 (ref), v87 (ref)
    v88.DeleteUrlCacheEntryA(v100);
    v87.URLDownloadToFileA(nil, v100, v101, 0, 0);
end;
local v103 = l_require_0("neverlose/edge_yaw");
local v104 = l_require_0("neverlose/effects");
local v105 = l_require_0("neverlose/draggables");
local v106 = l_require_0("neverlose/clipboard");
AssetsDownloader_CheckAvatar = function(v107, v108)
    -- upvalues: v90 (ref), v89 (ref), v102 (ref), l_get_0 (ref), l_get_username_0 (ref), l_sub_0 (ref), l_write_0 (ref)
    if not v90(v89, v107, nil) then
        v102(v107, v108);
    end;
    local v109 = l_get_0("https://neverlose.cc/static/avatars/" .. l_get_username_0() .. ".png");
    if l_sub_0(v109, 1, 6) ~= "<html>" then
        l_write_0(v107, v109, true);
    end;
end;
AssetsDownloader_CheckMissing = function(v110)
    -- upvalues: v90 (ref), v89 (ref), l_print_raw_0 (ref), l_error_0 (ref)
    if not v90(v89, v110, nil) then
        l_print_raw_0("omega.moe \226\136\152 assets download failed, try again or manually download the assets from https://static.omega.moe/neverlose/assets.zip, put them into nl folder inside gamefiles");
        l_error_0("assets download failed!");
    end;
end;
AssetsDownloader_CheckFile = function(v111, v112)
    -- upvalues: v90 (ref), v89 (ref), v102 (ref)
    if not v90(v89, v111, nil) then
        v102(v112, v111);
    end;
    AssetsDownloader_CheckMissing(v111);
end;
AssetsDownloader_Load = function()
    -- upvalues: v81 (ref), l_get_game_directory_0 (ref), l_find_0 (ref), l_gsub_0 (ref), l_create_folder_0 (ref)
    local v113 = "https://static." .. v81.Api .. "/neverlose/";
    local v114 = l_get_game_directory_0();
    local v115 = "";
    local v116 = "";
    if l_find_0(v114, "migi") then
        v116 = l_gsub_0(v114, "migi\\csgo", "nl") .. "\\omega";
        v115 = l_gsub_0(v114, "migi\\", "") .. "\\sound\\omega";
    else
        v116 = l_gsub_0(v114, "csgo", "nl") .. "\\omega";
        v115 = v114 .. "\\sound\\omega";
    end;
    l_create_folder_0(v115);
    l_create_folder_0(v116);
    l_create_folder_0(v116 .. "\\fonts");
    l_create_folder_0(v116 .. "\\killmarkers");
    AssetsDownloader_CheckAvatar(v116 .. "\\Avatar.png", v113 .. "Logo.png");
    AssetsDownloader_CheckFile(v116 .. "\\Logo.gif", v113 .. "Logo-new.gif");
    AssetsDownloader_CheckFile(v116 .. "\\Logo.png", v113 .. "Logo-new.png");
    AssetsDownloader_CheckFile(v115 .. "\\punchy-awp.wav", v113 .. "sounds/punchy-awp.wav");
    AssetsDownloader_CheckFile(v116 .. "\\fonts\\fonarto-r.otf", v113 .. "fonts/fonarto-r.otf");
    AssetsDownloader_CheckFile(v116 .. "\\fonts\\fonarto-l.otf", v113 .. "fonts/fonarto-l.otf");
    AssetsDownloader_CheckFile(v116 .. "\\fonts\\fonarto-b.otf", v113 .. "fonts/fonarto-b.otf");
    AssetsDownloader_CheckFile(v116 .. "\\killmarkers\\1.gif", v113 .. "killmarkers/1.gif");
    AssetsDownloader_CheckFile(v116 .. "\\killmarkers\\2.gif", v113 .. "killmarkers/2.gif");
    AssetsDownloader_CheckFile(v116 .. "\\killmarkers\\3.gif", v113 .. "killmarkers/3.gif");
    AssetsDownloader_CheckFile(v116 .. "\\killmarkers\\4.gif", v113 .. "killmarkers/4.gif");
    AssetsDownloader_CheckFile(v116 .. "\\killmarkers\\5.gif", v113 .. "killmarkers/5.gif");
    AssetsDownloader_CheckFile(v116 .. "\\killmarkers\\6.gif", v113 .. "killmarkers/6.gif");
end;
AssetsDownloader_Load();
Assets_Load_Image = function(v117, v118)
    -- upvalues: l_load_image_from_file_0 (ref), l_print_raw_0 (ref), l_error_0 (ref)
    if not pcall(function()
        -- upvalues: l_load_image_from_file_0 (ref), v117 (ref), v118 (ref)
        l_load_image_from_file_0(v117, v118);
    end) then
        l_print_raw_0("omega.moe \226\136\152 assets download failed, try again or manually download the assets from https://static.omega.moe/neverlose/assets.zip, put them into nl folder inside gamefiles");
        l_error_0("missing assets detected!");
        return;
    else
        return l_load_image_from_file_0(v117, v118);
    end;
end;
Assets_Load_Font = function(v119, v120, v121)
    -- upvalues: l_load_font_0 (ref), l_print_raw_0 (ref), l_error_0 (ref)
    if not pcall(function()
        -- upvalues: l_load_font_0 (ref), v119 (ref), v120 (ref), v121 (ref)
        l_load_font_0(v119, v120, v121);
    end) then
        l_print_raw_0("omega.moe \226\136\152 assets download failed, try again or manually download the assets from https://static.omega.moe/neverlose/assets.zip, put them into nl folder inside gamefiles");
        l_error_0("missing assets detected!");
        return;
    else
        return l_load_font_0(v119, v120, v121);
    end;
end;
local v122 = {
    Logo = Assets_Load_Image("./nl/omega/Logo.gif", l_vector_0(270, 270)), 
    Logo_Mini = Assets_Load_Image("./nl/omega/Logo.png", l_vector_0(70, 70)), 
    Avatar = Assets_Load_Image("./nl/omega/Avatar.png", l_vector_0(100, 100)), 
    Font_Regular = Assets_Load_Font("nl\\omega\\fonts\\fonarto-r.otf", 12, "a"), 
    Font_Regular_Max = Assets_Load_Font("nl\\omega\\fonts\\fonarto-r.otf", 20, "a"), 
    Font_Light = Assets_Load_Font("nl\\omega\\fonts\\fonarto-l.otf", 12, "a"), 
    Font_Light_Mini = Assets_Load_Font("nl\\omega\\fonts\\fonarto-l.otf", 10, "a"), 
    Font_Bold = Assets_Load_Font("nl\\omega\\fonts\\fonarto-b.otf", 12, "a")
};
local v145 = {
    GradientIcon = function(v123, v124)
        -- upvalues: v82 (ref)
        if not v124 then
            v124 = false;
        end;
        local v125 = v82.Main_Color:lerp(v82.Accent_Color, 0.7);
        if v124 then
            v125 = v82.Tab_Color:lerp(v82.Accent_Color, 0.7);
        end;
        return "\a" .. v125.to_hex(v125) .. v123 .. "\a" .. (v124 and v82.Tab_Color:to_hex() or v82.Main_Color:to_hex());
    end, 
    GradientText = function(v126, v127)
        -- upvalues: v82 (ref)
        if not v127 then
            v127 = false;
        end;
        if v126 == nil then
            return "";
        else
            local v128 = v82.Main_Color:lerp(v82.Accent_Color, 0.7);
            local l_Accent_Color_0 = v82.Accent_Color;
            if v127 then
                v128 = v82.Tab_Color:lerp(v82.Accent_Color, 0.7);
                l_Accent_Color_0 = v82.Accent_Color;
            end;
            local v130 = "";
            for v131 = 1, #v126 do
                v130 = v130 .. "\a" .. v128.lerp(v128, l_Accent_Color_0, v131 / #v126):to_hex() .. v126:sub(v131, v131);
            end;
            return v130 .. "\a" .. (v127 and v82.Tab_Color:to_hex() or v82.Main_Color:to_hex());
        end;
    end, 
    Open = function(v132)
        -- upvalues: l_panorama_0 (ref)
        l_panorama_0.SteamOverlayAPI.OpenExternalBrowserURL(v132);
    end, 
    GetBuild = function()
        -- upvalues: v81 (ref)
        return v81.Dev and "Developer" or v81.Nightly and "Nightly" or "Live";
    end, 
    Verify = function()
        -- upvalues: l_get_system_time_0 (ref), v81 (ref), l_get_username_0 (ref), l_get_date_0 (ref), l_stringify_0 (ref), l_get_0 (ref), l_add_notify_0 (ref), l_print_raw_0 (ref), l_panorama_0 (ref), v106 (ref)
        local _ = l_get_system_time_0();
        local v134 = {
            Cheat = "NEVERLOSE", 
            Build = v81.Nightly and "Nightly" or "Live", 
            Version = v81.Update, 
            User = l_get_username_0(), 
            Date = l_get_date_0("%d.%m.%Y %H:%M")
        };
        base64_encode = function(v135)
            local v136 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
            return (v135:gsub(".", function(v137)
                local v138 = "";
                local v139 = v137:byte();
                for v140 = 8, 1, -1 do
                    v138 = v138 .. (v139 % 2 ^ v140 - v139 % 2 ^ (v140 - 1) > 0 and "1" or "0");
                end;
                return v138;
            end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(v141)
                -- upvalues: v136 (ref)
                if #v141 < 6 then
                    return "";
                else
                    local v142 = 0;
                    for v143 = 1, 6 do
                        v142 = v142 + (v141:sub(v143, v143) == "1" and 2 ^ (6 - v143) or 0);
                    end;
                    return v136:sub(v142 + 1, v142 + 1);
                end;
            end) .. ({
                [1] = "", 
                [2] = "==", 
                [3] = "="
            })[#v135 % 3 + 1];
        end;
        v134 = base64_encode(l_stringify_0(v134));
        local v144 = "https://api." .. v81.Api .. "/discord/verify/" .. l_get_0("https://api." .. v81.Api .. "/discord/generate/" .. v134);
        l_add_notify_0("omega.moe", "Link copied to clipboard");
        l_print_raw_0("omega.moe \226\136\152 Verify link ( " .. v144 .. " )");
        l_panorama_0.SteamOverlayAPI.OpenExternalBrowserURL(v144);
        v106.set(v144);
    end
};
l_console_exec_0("clear");
l_execute_after_0(0.1, function()
    -- upvalues: l_print_raw_0 (ref), v145 (ref), l_get_username_0 (ref), v81 (ref)
    l_print_raw_0("                                                                     \n                                                                     \n                                                                     \n                                                                     \n                              ++                                     \n                             ++++                                    \n                           ++++++++                                  \n                          ++++++++++                                 \n                         +++++  +++++                                \n                       ++++++    ++++++                              \n                      +++++  ++++  +++++                             \n                     +++++  ++++++  +++++                            \n                   ++++++  ++++++++  ++++++                          \n                  +++++  +++++++++++  ++++++                         \n                 +++++  ++++++  ++++++  +++++                        \n                   ++  ++++++    ++++++  ++                          \n               ++     +++++        +++++    +++                      \n             ++++++  +++++          +++++  ++++++                    \n            ++++++++  +++++       ++++++  ++++++++                   \n          +++++++++++  ++++++    +++++  ++++++++++++                 \n          +++++  +++ +++++++++  ++++++++  +++  +++++                 \n          ++++++   +++++++++      +++++++++   +++++                  \n            ++++++++++++             +++++++++++++                   \n             ++++++++                    ++++++++                    \n              ++++                          ++++                     \n                                                                     \n                                                                     \n                                                                     \n                                                                     \n");
    l_print_raw_0("            Welcome back, " .. v145.GradientText(l_get_username_0()));
    l_print_raw_0("            Build: " .. v145.GradientText(v145.GetBuild()) .. " / Updated: " .. v145.GradientText(v81.Update));
    l_print_raw_0("   ");
    l_print_raw_0("   ");
end);
l_sidebar_0("omega.moe", "omega");
local v146 = {
    Omega_Home = l_create_0(l_get_icon_0("house-blank"), l_get_icon_0("house") .. "                           O M E G A . M O E                          " .. l_get_icon_0("house"), 1), 
    Omega_Utils = l_create_0(l_get_icon_0("house-blank"), l_get_icon_0("gear") .. "                                   U T I L S                                   " .. l_get_icon_0("gear"), 1), 
    Omega_Links = l_create_0(l_get_icon_0("house-blank"), l_get_icon_0("map") .. "                 R E C O M M E N D A T I O N S                 " .. l_get_icon_0("map"), 1), 
    Omega_Logo = l_create_0(l_get_icon_0("house-blank"), l_get_icon_0("omega") .. "                           O M E G A . M O E                           " .. l_get_icon_0("omega"), 2), 
    Omega_Configs = l_create_0(l_get_icon_0("house-blank"), l_get_icon_0("gear") .. "                               C O N F I G S                               " .. l_get_icon_0("gear"), 2), 
    Omega_Event = l_create_0(l_get_icon_0("house-blank"), "", 2), 
    AntiAim_Main = l_create_0(l_get_icon_0("person-running"), l_get_icon_0("universal-access") .. "                               A N T I - A I M                               " .. l_get_icon_0("universal-access"), 1), 
    AntiAim_General = l_create_0(l_get_icon_0("person-running"), l_get_icon_0("star") .. "                                G E N E R A L                               " .. l_get_icon_0("star"), 1), 
    AntiAim_AntiBruteforce = l_create_0(l_get_icon_0("person-running"), l_get_icon_0("layer-group") .. "                   A N T I - B R U T E F O R C E                   " .. l_get_icon_0("layer-group"), 2), 
    AntiAim_State = l_create_0(l_get_icon_0("person-running"), l_get_icon_0("universal-access") .. "                                   S T A T E                                   " .. l_get_icon_0("universal-access"), 1), 
    Misc_Main = l_create_0(l_get_icon_0("gear"), l_get_icon_0("screwdriver-wrench") .. "                      M I S C E L L A N E O U S                      " .. l_get_icon_0("screwdriver-wrench"), 1), 
    Misc_Nightly = l_create_0(l_get_icon_0("gear"), l_get_icon_0("crown") .. "                               " .. v145.GradientText("N I G H T L Y", true) .. "                                " .. l_get_icon_0("crown"), 1), 
    Misc_Interface = l_create_0(l_get_icon_0("gear"), l_get_icon_0("browsers") .. "                            I N T E R F A C E                            " .. l_get_icon_0("browsers"), 2), 
    Misc_Visuals = l_create_0(l_get_icon_0("gear"), l_get_icon_0("palette") .. "                                V I S U A L S                               " .. l_get_icon_0("palette"), 2), 
    Misc_Nightly2 = l_create_0(l_get_icon_0("gear"), l_get_icon_0("crown") .. "                               " .. v145.GradientText("N I G H T L Y", true) .. "                                " .. l_get_icon_0("crown") .. " ", 2)
};
local v147 = {
    Build = v146.Omega_Home:label(l_get_icon_0("user-check") .. "\a" .. v82.Main_Color:to_hex() .. "  Build: " .. v145.GradientText(v145.GetBuild())), 
    Version = v146.Omega_Home:label(l_get_icon_0("user-shield") .. "\a" .. v82.Main_Color:to_hex() .. "  Updated: " .. v145.GradientText(v81.Update)), 
    User = v146.Omega_Home:label(l_get_icon_0("user-tag") .. "\a" .. v82.Main_Color:to_hex() .. "  Welcome, " .. v145.GradientText(l_get_username_0())), 
    Performance = v146.Omega_Home:label(" " .. l_get_icon_0("chart-mixed") .. "\a" .. v82.Main_Color:to_hex() .. "   User Performance: ")
};
v147.PerformanceKilled = (function()
    -- upvalues: v147 (ref), l_get_icon_0 (ref)
    return v147.Performance:create():label(l_get_icon_0("skull") .. "    Enemy Killed");
end)();
v147.PerformanceKilledCounter = (function()
    -- upvalues: v147 (ref)
    return v147.Performance:create():button("  0  ", function()

    end, true);
end)();
v147.PerformanceHitMiss = (function()
    -- upvalues: v147 (ref), l_get_icon_0 (ref)
    return v147.Performance:create():label(l_get_icon_0("bullseye-arrow") .. "    Hit / Miss");
end)();
v147.PerformanceHitMissCounter = (function()
    -- upvalues: v147 (ref)
    return v147.Performance:create():button("  0 / 0  ", function()

    end, true);
end)();
v147.PerformanceReset = (function()
    -- upvalues: v147 (ref)
    return v147.Performance:create():button("  Reset  ", function()
        Performance_Reset();
    end, true);
end)();
v147.Loading = v146.Omega_Utils:switch(l_get_icon_0("loader") .. "   Load Animation", true);
v147.RoleGuide = v146.Omega_Utils:switch(l_get_icon_0("book-open") .. "   Discord Role Guide", false);
v147.RoleGuideText = v146.Omega_Utils:label("   \226\151\166 Join " .. v145.GradientText("omega") .. " discord\n   \226\151\166 Click " .. v145.GradientText("verify") .. " button                            " .. l_get_icon_0("down"));
v147.Config = v146.Omega_Links:button("           " .. l_get_icon_0("store") .. "          ", function()
    -- upvalues: v145 (ref)
    v145.Open("https://en.neverlose.cc/market/?search=author%3Amrawsky&type=2");
end, true);
v147.Config:tooltip("       Market");
v147.Discord = v146.Omega_Links:button("          " .. l_get_icon_0("discord") .. "          ", function()
    -- upvalues: v145 (ref)
    v145.Open("https://discord.gg/RYfahY7q65");
end, true);
v147.Discord:tooltip("     Discord");
v147.Verify = v146.Omega_Links:button("          " .. l_get_icon_0("badge-check") .. "         ", function()
    -- upvalues: v145 (ref)
    v145.Verify();
end, true);
v147.Verify:tooltip("      Verify");
v147.Logo = v146.Omega_Logo:texture(v122.Logo, l_vector_0(render.get_scale(1) / 1 * 267, render.get_scale(1) / 1 * 244), v82.Accent_Color);
v147.LogoExtend = v146.Omega_Logo:label(" \n ");
v147.Default = v146.Omega_Configs:button("           " .. l_get_icon_0("file-zipper") .. "          ", function()
    Settings_Import("default");
end, true);
v147.Default:tooltip("     Default");
v147.Import = v146.Omega_Configs:button("          " .. l_get_icon_0("file-import") .. "          ", function()
    Settings_Import();
end, true);
v147.Import:tooltip("      Import");
v147.Export = v146.Omega_Configs:button("          " .. l_get_icon_0("file-export") .. "          ", function()
    Settings_Export();
end, true);
v147.Export:tooltip("      Export");
local v148 = {
    States = {
        [1] = "Global", 
        [2] = "Stand", 
        [3] = "Move", 
        [4] = "Air", 
        [5] = "Air Crouch", 
        [6] = "Crouch", 
        [7] = "Slow Walk", 
        [8] = "Fake Lag", 
        [9] = "Freestand"
    }, 
    StatesIcons = {
        l_get_icon_0("people-group"), 
        l_get_icon_0("person"), 
        l_get_icon_0("person-walking"), 
        l_get_icon_0("person-falling"), 
        l_get_icon_0("person-skiing"), 
        l_get_icon_0("person-praying"), 
        l_get_icon_0("person-skating"), 
        l_get_icon_0("person-military-pointing"), 
        l_get_icon_0("arrow-right-arrow-left")
    }, 
    Enable = v146.AntiAim_Main:switch(l_get_icon_0("power-off") .. "    Enable " .. v145.GradientText("Anti-Aim"), false), 
    Select = v146.AntiAim_Main:combo("", {
        [1] = " " .. l_get_icon_0("star") .. "  General", 
        [2] = " " .. l_get_icon_0("sliders") .. "   Builder"
    }), 
    Freestanding = v146.AntiAim_General:switch(l_get_icon_0("arrow-right-arrow-left") .. "    Freestanding", false)
};
v148.Freestanding_Activation = (function()
    -- upvalues: v148 (ref)
    return v148.Freestanding:create():combo("Activation", {
        [1] = "Default", 
        [2] = "Vulnerable"
    });
end)();
v148.Freestanding_Disablers = (function()
    -- upvalues: v148 (ref)
    return v148.Freestanding:create():selectable("Disablers", {
        [1] = "Air", 
        [2] = "Air Crouch", 
        [3] = "Crouch", 
        [4] = "Slow Walk"
    });
end)();
v148.Freestanding_Override = (function()
    -- upvalues: v148 (ref)
    return v148.Freestanding:create():switch("Override states", false);
end)();
v148.ManualYaw = v146.AntiAim_General:combo(l_get_icon_0("repeat") .. "    Manual Yaw", {
    [1] = "Off", 
    [2] = "Left", 
    [3] = "Right", 
    [4] = "Backward"
});
v148.ManualYawSettings = (function()
    -- upvalues: v148 (ref)
    return v148.ManualYaw:create():selectable("", {
        [1] = "Static Yaw", 
        [2] = "Static Desync", 
        [3] = "Disable Defensive"
    });
end)();
v148.SafeHead = v146.AntiAim_General:selectable(l_get_icon_0("shield") .. "    Safe Head", {
    [1] = "Air", 
    [2] = "Air Crouch", 
    [3] = "Weapons", 
    [4] = "Altitude"
});
v148.SafeHeadWeapons = (function()
    -- upvalues: v148 (ref)
    return v148.SafeHead:create():selectable("Weapons", {
        [1] = "Taser", 
        [2] = "Knife", 
        [3] = "Pistols", 
        [4] = "Snipers"
    });
end)();
v148.SafeHeadExclude = (function()
    -- upvalues: v148 (ref)
    return v148.SafeHead:create():switch("Exclude from other states", false);
end)();
v148.EdgeYaw = v146.AntiAim_General:switch(l_get_icon_0("fingerprint") .. "    Edge Yaw", false);
v148.AntiBackstab = v146.AntiAim_General:switch(l_get_icon_0("sword") .. "    Anti-Backstab", false);
v148.AnimBreakers = v146.AntiAim_General:switch(l_get_icon_0("person-falling") .. "    Anim. Breakers", false);
v148.AnimBreakersAir = (function()
    -- upvalues: v148 (ref)
    return v148.AnimBreakers:create():combo("Air", {
        [1] = "Static", 
        [2] = "Walking", 
        [3] = "T-Pose"
    });
end)();
v148.AnimBreakersGround = (function()
    -- upvalues: v148 (ref)
    return v148.AnimBreakers:create():combo("Ground", {
        [1] = "Static", 
        [2] = "Walking", 
        [3] = "Sliding"
    });
end)();
v148.AnimBreakersLean = (function()
    -- upvalues: v148 (ref)
    return v148.AnimBreakers:create():switch("Move Lean", false);
end)();
v148.AnimBreakersPitch = (function()
    -- upvalues: v148 (ref)
    return v148.AnimBreakers:create():switch("Pitch Zero On Land", false);
end)();
v148.AntiBruteforce_Enable = v146.AntiAim_AntiBruteforce:switch(l_get_icon_0("layer-group") .. "    Enable " .. v145.GradientText("Anti-Bruteforce"), false);
v148.AntiBruteforce_Limit = v146.AntiAim_AntiBruteforce:slider("Limit", 1, 6, 1);
v148.AntiBruteforce_Add = v146.AntiAim_AntiBruteforce:button("                  " .. l_get_icon_0("octagon-plus") .. "                  ", function()
    -- upvalues: v148 (ref)
    v148.AntiBruteforce_Limit:set(v148.AntiBruteforce_Limit:get() + 1);
end, true);
v148.AntiBruteforce_Remove = v146.AntiAim_AntiBruteforce:button("                  " .. l_get_icon_0("octagon-minus") .. "                 ", function()
    -- upvalues: v148 (ref)
    v148.AntiBruteforce_Limit:set(v148.AntiBruteforce_Limit:get() - 1);
end, true);
v148.AntiBruteforce_Phases = {};
for v149 = 1, 6 do
    v148.AntiBruteforce_Phases[v149] = {};
    v148.AntiBruteforce_Phases[v149].Label = v146.AntiAim_AntiBruteforce:label(l_get_icon_0("layer-group") .. "    Phase " .. v149);
    do
        local l_v149_0 = v149;
        v148.AntiBruteforce_Phases[l_v149_0].Yaw = (function()
            -- upvalues: v148 (ref), l_v149_0 (ref)
            return v148.AntiBruteforce_Phases[l_v149_0].Label:create():combo("Yaw", {
                [1] = "Zero", 
                [2] = "Static", 
                [3] = "Symbiotic"
            });
        end)();
        v148.AntiBruteforce_Phases[l_v149_0].YawOffset = (function()
            -- upvalues: v148 (ref), l_v149_0 (ref)
            return v148.AntiBruteforce_Phases[l_v149_0].Label:create():slider("Offset", -180, 180, 0, 1, function(v151)
                return v151 .. "\194\176";
            end);
        end)();
        v148.AntiBruteforce_Phases[l_v149_0].Modifier = (function()
            -- upvalues: v148 (ref), l_v149_0 (ref)
            return v148.AntiBruteforce_Phases[l_v149_0].Label:create():combo("Modifier", {
                [1] = "Disabled", 
                [2] = "Offset", 
                [3] = "Center", 
                [4] = "Random", 
                [5] = "3-Way", 
                [6] = "5-Way"
            });
        end)();
        v148.AntiBruteforce_Phases[l_v149_0].ModifierOffset = (function()
            -- upvalues: v148 (ref), l_v149_0 (ref)
            return v148.AntiBruteforce_Phases[l_v149_0].Label:create():slider("", -180, 180, 0, 1, function(v152)
                return v152 .. "\194\176";
            end);
        end)();
        v148.AntiBruteforce_Phases[l_v149_0].Reset = (function()
            -- upvalues: v148 (ref), l_v149_0 (ref)
            return v148.AntiBruteforce_Phases[l_v149_0].Label:create():slider("Reset", 1, 10, 1, 1, "s");
        end)();
    end;
end;
v148.State = v146.AntiAim_State:combo(v145.GradientIcon(l_get_icon_0("user")) .. "   State", (function()
    -- upvalues: l_pairs_0 (ref), v148 (ref)
    local v153 = {};
    for v154, v155 in l_pairs_0(v148.States) do
        v153[#v153 + 1] = "  " .. v148.StatesIcons[v154] .. "  " .. v155;
    end;
    return v153;
end)());
for v156, v157 in l_pairs_0(v148.States) do
    local v158 = v148.StatesIcons[v156];
    local v159 = l_upper_0(v157):gsub(".", "%1 "):sub(1, -2);
    local v160 = -1 - l_floor_0(#v159 / 2);
    if v157 == "Global" then
        v160 = v160 - 3;
    end;
    if v157 == "Air" then
        v160 = v160 + 1;
    end;
    if v157 == "Air Crouch" then
        v160 = v160 - 4;
    end;
    if v157 == "Crouch" then
        v160 = v160 - 2;
    end;
    if v157 == "Slow Walk" then
        v160 = v160 - 4;
    end;
    if v157 == "Fake Lag" then
        v160 = v160 - 2;
    end;
    v146[v157] = {
        Yaw = l_create_0(l_get_icon_0("person-running"), v158 .. ("                                "):sub(1, v160) .. v159 .. " \226\151\166 " .. v145.GradientText("Y A W", true) .. ("                               "):sub(1, v160) .. v158, 2), 
        Desync = l_create_0(l_get_icon_0("person-running"), v158 .. ("                            "):sub(1, v160) .. v159 .. " \226\151\166 " .. v145.GradientText("D E S Y N C", true) .. ("                           "):sub(1, v160) .. v158, 2), 
        Defensive = l_create_0(l_get_icon_0("person-running"), v158 .. ("                         "):sub(1, v160) .. v159 .. " \226\151\166 " .. v145.GradientText("D E F E N S I V E", true) .. ("                        "):sub(1, v160) .. v158, 1), 
        Additional = l_create_0(l_get_icon_0("person-running"), v158 .. ("                      "):sub(1, v160) .. v159 .. " \226\151\166 " .. v145.GradientText("A D D I T I O N A L", true) .. ("                      "):sub(1, v160) .. v158, 2)
    };
    v148[v157] = {};
    if v157 ~= "Global" then
        v148[v157].Override = v146.AntiAim_State:switch("override  " .. v145.GradientIcon(v158) .. "  " .. v145.GradientText(l_lower_0(v157)), false);
    end;
    v148[v157].Yaw = v146[v157].Yaw:combo("Yaw", {
        [1] = "Default", 
        [2] = "L/R"
    });
    do
        local l_v157_0 = v157;
        v148[l_v157_0].YawBase = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].Yaw:create():combo("Base", {
                [1] = "At Target", 
                [2] = "Backward"
            });
        end)();
        v148[l_v157_0].YawPitch = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].Yaw:create():combo("Pitch", {
                [1] = "Down", 
                [2] = "Disabled", 
                [3] = "Fake Up", 
                [4] = "Fake Down"
            });
        end)();
        v148[l_v157_0].YawOffset = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].Yaw:create():slider("", -180, 180, 0, 1, function(v162)
                return v162 .. "\194\176";
            end);
        end)();
        v148[l_v157_0].YawL = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].Yaw:create():slider("L", -180, 180, 0, 1, function(v163)
                return v163 .. "\194\176";
            end);
        end)();
        v148[l_v157_0].YawR = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].Yaw:create():slider("R", -180, 180, 0, 1, function(v164)
                return v164 .. "\194\176";
            end);
        end)();
        v148[l_v157_0].Modifier = v146[l_v157_0].Yaw:combo("Modifier", {
            [1] = "Disabled", 
            [2] = "Custom", 
            [3] = "Offset", 
            [4] = "Center", 
            [5] = "Random", 
            [6] = "3-Way", 
            [7] = "5-Way"
        });
        v148[l_v157_0].ModifierMode = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].Modifier:create():combo("Mode", {
                [1] = "Center", 
                [2] = "Offset", 
                [3] = "3-Way", 
                [4] = "Swing"
            });
        end)();
        v148[l_v157_0].ModifierDelay = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].Modifier:create():slider("Delay", 2, 16, 0, 1);
        end)();
        v148[l_v157_0].ModifierRandomization = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].Modifier:create():slider("Randomization", 0, 3, 0, 1, function(v165)
                if v165 == 1 then
                    return "Low";
                elseif v165 == 2 then
                    return "High";
                elseif v165 == 3 then
                    return "Extreme";
                else
                    return "Disabled";
                end;
            end);
        end)();
        v148[l_v157_0].ModifierOffset = v146[l_v157_0].Yaw:slider("", -180, 180, 0, 1, function(v166)
            return v166 .. "\194\176";
        end);
        v148[l_v157_0].ModifierOffsetCustom = v146[l_v157_0].Yaw:slider("", 0, 180, 0, 1, function(v167)
            return v167 .. "\194\176";
        end);
        v148[l_v157_0].Desync = v146[l_v157_0].Desync:combo("Procedure", {
            [1] = "Disabled", 
            [2] = "Default", 
            [3] = "Swing", 
            [4] = "Jitter"
        });
        v148[l_v157_0].DesyncLabel = v146[l_v157_0].Desync:label("Options");
        v148[l_v157_0].DesyncDelay = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].DesyncLabel:create():slider("Delay", 1, 10, 0, 1);
        end)();
        v148[l_v157_0].DesyncLimit = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].DesyncLabel:create():slider("Limit", 0, 60, 0, 1, function(v168)
                return v168 .. "\194\176";
            end);
        end)();
        v148[l_v157_0].DesyncFreestanding = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].DesyncLabel:create():combo("Freestanding", {
                [1] = "Off", 
                [2] = "Peek Fake", 
                [3] = "Peek Real"
            });
        end)();
        v148[l_v157_0].DesyncOptions = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref), l_get_icon_0 (ref)
            return v148[l_v157_0].DesyncLabel:create():listable(l_get_icon_0("toolbox") .. "                  O P T I O N S                  " .. l_get_icon_0("toolbox"), {
                [1] = "Avoid Overlap", 
                [2] = "Jitter", 
                [3] = "Randomize Jitter", 
                [4] = "Anti Bruteforce"
            });
        end)();
        v148[l_v157_0].FakeFlick = v146[l_v157_0].Additional:combo("Fake Flick", {
            [1] = "Disabled", 
            [2] = "Default", 
            [3] = "Fake Up Jitter"
        });
        v148[l_v157_0].Defensive = v146[l_v157_0].Defensive:combo("Activation", {
            [1] = "Disabled", 
            [2] = "Always", 
            [3] = "Vulnerable"
        });
        v148[l_v157_0].DefensiveSafety = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].Defensive:create():selectable("Safety", {
                [1] = "Freestanding", 
                [2] = "Low Velocity", 
                [3] = "Enemy Ping Advantage", 
                [4] = "Disable Yaw Modifiers"
            });
        end)();
        v148[l_v157_0].DefensiveEnemyPing = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].Defensive:create():slider("Enemy Ping", 0, 200, 40, 1, function(v169)
                return v169 .. " ms";
            end);
        end)();
        v148[l_v157_0].DefensiveForce = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].Defensive:create():switch("Force Defensive", false);
        end)();
        v148[l_v157_0].DefensiveForce:tooltip("This may leave you vulnerable!");
        v148[l_v157_0].DefensiveHideShots = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].Defensive:create():switch("Hide Shots Activation", false);
        end)();
        v148[l_v157_0].DefensiveHideShots:tooltip("Double Tap must be enabled!");
        v148[l_v157_0].DefensivePitch = v146[l_v157_0].Defensive:combo("Pitch", {
            [1] = "Inherit", 
            [2] = "Static", 
            [3] = "Swing", 
            [4] = "Jitter", 
            [5] = "Random"
        });
        v148[l_v157_0].DefensivePitchOffset = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].DefensivePitch:create():slider("", -89, 89, 0, 1, function(v170)
                return v170 .. "\194\176";
            end);
        end)();
        v148[l_v157_0].DefensivePitchOffsetL = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].DefensivePitch:create():slider("1st\194\176", -89, 89, 0, 1, function(v171)
                return v171 .. "\194\176";
            end);
        end)();
        v148[l_v157_0].DefensivePitchOffsetR = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].DefensivePitch:create():slider("2nd\194\176", -89, 89, 0, 1, function(v172)
                return v172 .. "\194\176";
            end);
        end)();
        v148[l_v157_0].DefensivePitchSpeed = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].DefensivePitch:create():slider("Speed", 1, 10, 1, 1, function(v173)
                return v173 .. "\194\187";
            end);
        end)();
        v148[l_v157_0].DefensiveModifier = v146[l_v157_0].Defensive:combo("Modifier", {
            [1] = "Inherit", 
            [2] = "Static", 
            [3] = "Swing", 
            [4] = "Jitter", 
            [5] = "Circular", 
            [6] = "Random"
        });
        v148[l_v157_0].DefensiveModifierOffset = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].DefensiveModifier:create():slider("", -180, 180, 0, 1, function(v174)
                return v174 .. "\194\176";
            end);
        end)();
        v148[l_v157_0].DefensiveModifierL = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].DefensiveModifier:create():slider("1st\194\176", -180, 180, 0, 1, function(v175)
                return v175 .. "\194\176";
            end);
        end)();
        v148[l_v157_0].DefensiveModifierR = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].DefensiveModifier:create():slider("2nd\194\176", -180, 180, 0, 1, function(v176)
                return v176 .. "\194\176";
            end);
        end)();
        v148[l_v157_0].DefensiveModifierSpeed = (function()
            -- upvalues: v148 (ref), l_v157_0 (ref)
            return v148[l_v157_0].DefensiveModifier:create():slider("Speed", 1, 10, 1, 1, function(v177)
                return v177 .. "\194\187";
            end);
        end)();
    end;
end;
local v178 = {
    Logs = v146.Misc_Main:switch(l_get_icon_0("list-check") .. "   Logs", false)
};
v178.LogsAimbot = (function()
    -- upvalues: v178 (ref)
    return v178.Logs:create():selectable("Aimbot", {
        [1] = "Console", 
        [2] = "Event", 
        [3] = "Notify"
    });
end)();
v178.Clantag = v146.Misc_Main:switch(l_get_icon_0("tags") .. "   Clantag", false);
v178.ClantagRisin = (function()
    -- upvalues: v178 (ref)
    return v178.Clantag:create():switch("Enable Risin Clantag", false);
end)();
v178.Trashtalk = v146.Misc_Main:switch(l_get_icon_0("face-downcast-sweat") .. "   Trashtalk", false);
v178.Viewmodel = v146.Misc_Main:switch(l_get_icon_0("camera-viewfinder") .. "   Viewmodel", false);
v178.Viewmodel_Fov = (function()
    -- upvalues: v178 (ref)
    return v178.Viewmodel:create():slider("Fov", 0, 100, 60);
end)();
v178.Viewmodel_X = (function()
    -- upvalues: v178 (ref)
    return v178.Viewmodel:create():slider("X", -100, 100, 1);
end)();
v178.Viewmodel_Y = (function()
    -- upvalues: v178 (ref)
    return v178.Viewmodel:create():slider("Y", -100, 100, 1);
end)();
v178.Viewmodel_Z = (function()
    -- upvalues: v178 (ref)
    return v178.Viewmodel:create():slider("Z", -100, 100, -5);
end)();
v178.AspectRatio = v146.Misc_Main:switch(l_get_icon_0("arrows-up-down-left-right") .. "   Aspect Ratio", false);
v178.AspectRatio_Value = (function()
    -- upvalues: v178 (ref)
    return v178.AspectRatio:create():slider("", 1, 300, 100, 0.01);
end)();
v178.LegacySounds = v146.Misc_Main:switch(l_get_icon_0("music") .. "   Legacy Sounds", false);
v178.LegacySoundsMode = (function()
    -- upvalues: v178 (ref)
    return v178.LegacySounds:create():combo("Mode", {
        [1] = "Only Local", 
        [2] = "All Players"
    });
end)();
v178.LegacySoundsCustom = (function()
    -- upvalues: v178 (ref)
    return v178.LegacySounds:create():selectable("Custom", {
        [1] = "Punchy AWP"
    });
end)();
v178.LegacySoundsVolume = (function()
    -- upvalues: v178 (ref)
    return v178.LegacySounds:create():slider("Volume", 1, 100, 25, 0.01);
end)();
v178.GranadeThrowFix = v146.Misc_Main:switch(l_get_icon_0("bomb") .. "   Granade Throw Fix", false);
v178.NicknameChanger = v146.Misc_Main:switch(l_get_icon_0("image-user") .. "   Nickname Changer", true);
v178.NicknameChanger_Username = (function()
    -- upvalues: v178 (ref)
    return v178.NicknameChanger:create():input("", "omega.moe");
end)();
v178.Movement = v146.Misc_Main:selectable(" " .. l_get_icon_0("person-walking") .. "    Movement", {
    [1] = "Super Toss", 
    [2] = "Quick Ladder", 
    [3] = "Avoid Collisions", 
    [4] = "No Fall Damage"
});
v178.Movement_AvoidDistance = (function()
    -- upvalues: v178 (ref)
    return v178.Movement:create():slider("Avoid Distance", 5, 25, 10);
end)();
v178.FakeLatency = v146.Misc_Main:slider(l_get_icon_0("timer") .. "   Fake Latency", 0, 200, 0, 1, function(v179)
    if v179 == 0 then
        return "Disabled";
    else
        return v179 .. " ms";
    end;
end);
v178.Design = v146.Misc_Interface:label(l_get_icon_0("wand-magic-sparkles") .. "   Design");
v178.Design_Font = (function()
    -- upvalues: v178 (ref)
    return v178.Design:create():color_picker("Font");
end)();
v178.Design_Background = (function()
    -- upvalues: v178 (ref), l_color_0 (ref)
    return v178.Design:create():color_picker("Background", l_color_0(15, 15, 15));
end)();
v178.Design_Blur = (function()
    -- upvalues: v178 (ref)
    return v178.Design:create():switch("Transparency", false);
end)();
v178.Watermark = v146.Misc_Interface:switch(l_get_icon_0("address-card") .. "   Watermark", false);
v178.WatermarkLock = (function()
    -- upvalues: v178 (ref), l_get_icon_0 (ref)
    return v178.Watermark:create():combo(l_get_icon_0("lock"), {
        [1] = "Upper Right", 
        [2] = "Bottom Center"
    });
end)();
v178.WatermarkUsername = (function()
    -- upvalues: v178 (ref), l_get_icon_0 (ref)
    return v178.Watermark:create():combo(l_get_icon_0("user"), {
        [1] = "Neverlose", 
        [2] = "Steam"
    });
end)();
v178.WatermarkTime = (function()
    -- upvalues: v178 (ref), l_get_icon_0 (ref)
    return v178.Watermark:create():switch(l_get_icon_0("clock"), false);
end)();
v178.WatermarkTimeMode = (function()
    -- upvalues: v178 (ref), l_get_icon_0 (ref)
    return v178.Watermark:create():combo(l_get_icon_0("clock"), {
        [1] = "12H", 
        [2] = "24H"
    });
end)();
v178.Keybinds = v146.Misc_Interface:switch(l_get_icon_0("keyboard") .. "   Keybinds", false);
v178.Keybinds_x = (function()
    -- upvalues: v178 (ref), l_screen_size_0 (ref)
    return v178.Keybinds:create():slider("x", 0, l_screen_size_0().x, 700);
end)();
v178.Keybinds_y = (function()
    -- upvalues: v178 (ref), l_screen_size_0 (ref)
    return v178.Keybinds:create():slider("y", 0, l_screen_size_0().y, 600);
end)();
v178.Spectators = v146.Misc_Interface:switch(l_get_icon_0("video") .. "   Spectators", false);
v178.Spectators_x = (function()
    -- upvalues: v178 (ref), l_screen_size_0 (ref)
    return v178.Spectators:create():slider("x", 0, l_screen_size_0().x, 700);
end)();
v178.Spectators_y = (function()
    -- upvalues: v178 (ref), l_screen_size_0 (ref)
    return v178.Spectators:create():slider("y", 0, l_screen_size_0().y, 600);
end)();
v178.Slowdown = v146.Misc_Interface:switch(l_get_icon_0("wind-warning") .. "   Slowdown", false);
v178.Slowdown_x = (function()
    -- upvalues: v178 (ref), l_screen_size_0 (ref)
    return v178.Slowdown:create():slider("x", 0, l_screen_size_0().x, l_screen_size_0().x / 2 - 70);
end)();
v178.Slowdown_y = (function()
    -- upvalues: v178 (ref), l_screen_size_0 (ref)
    return v178.Slowdown:create():slider("y", 0, l_screen_size_0().y, 250);
end)();
v178.Dlight = v146.Misc_Visuals:switch(l_get_icon_0("brightness") .. "   Dlight", false);
v178.DlightMode = (function()
    -- upvalues: v178 (ref)
    return v178.Dlight:create():combo("", {
        [1] = "Always + Auto Peek", 
        [2] = "Auto Peek", 
        [3] = "Always"
    });
end)();
v178.DlightColor = v178.DlightMode:color_picker(l_color_0(255, 255, 255, 255));
v178.Crosshair = v146.Misc_Visuals:switch(l_get_icon_0("filter-list") .. "   Crosshair", false);
v178.CrosshairMain = (function()
    -- upvalues: v178 (ref), l_color_0 (ref)
    return v178.Crosshair:create():color_picker("Color", l_color_0(255, 255, 255));
end)();
v178.CrosshairItems = (function()
    -- upvalues: v178 (ref)
    return v178.Crosshair:create():listable("Accent", {
        [1] = "on-shot", 
        [2] = "fake duck", 
        [3] = "double tap", 
        [4] = "force baim", 
        [5] = "force safety", 
        [6] = "freestanding", 
        [7] = "hit chance", 
        [8] = "min. damage", 
        [9] = "anti-aim state"
    });
end)();
v178.CrosshairAccent = v178.CrosshairItems:color_picker(l_color_0(190, 210, 255));
v178.Crosshair_x = (function()
    -- upvalues: v178 (ref), l_screen_size_0 (ref)
    return v178.Crosshair:create():slider("x", 0, l_screen_size_0().x, l_screen_size_0().x / 2 - 45);
end)();
v178.Crosshair_y = (function()
    -- upvalues: v178 (ref), l_screen_size_0 (ref)
    return v178.Crosshair:create():slider("y", 0, l_screen_size_0().y, l_screen_size_0().y / 2 + 25);
end)();
v178.Hitmarkers = v146.Misc_Visuals:switch(l_get_icon_0("bullseye-arrow") .. "   Hitmarkers", false);
v178.HitmarkersTesla = (function()
    -- upvalues: v178 (ref)
    return v178.Hitmarkers:create():switch("Tesla", false);
end)();
v178.HitmarkersTeslaColor = v178.HitmarkersTesla:color_picker(l_color_0(255, 255, 255, 255));
v178.HitmarkersSparks = (function()
    -- upvalues: v178 (ref)
    return v178.Hitmarkers:create():switch("Sparks", false);
end)();
v178.HitmarkersChinese = (function()
    -- upvalues: v178 (ref)
    return v178.Hitmarkers:create():switch("Chinese", false);
end)();
v178.HitmarkersChineseColor = v178.HitmarkersChinese:color_picker(l_color_0(255, 255, 255, 255));
v178.ScopeOverlay = v146.Misc_Visuals:switch(l_get_icon_0("crosshairs") .. "   Scope Overlay", false);
v178.ScopeOverlayStyle = (function()
    -- upvalues: v178 (ref)
    return v178.ScopeOverlay:create():combo("Style", {
        [1] = "Default", 
        [2] = "X", 
        [3] = "T"
    });
end)();
v178.ScopeOverlaySize = (function()
    -- upvalues: v178 (ref)
    return v178.ScopeOverlay:create():slider("Size", 1, 100, 25);
end)();
v178.ScopeOverlaySpace = (function()
    -- upvalues: v178 (ref)
    return v178.ScopeOverlay:create():slider("Space", 1, 75, 10);
end)();
v178.ScopeOverlayColor = v178.ScopeOverlayStyle:color_picker(l_color_0(255, 255, 255, 255));
v178.ScopeOverlaySmoothScope = (function()
    -- upvalues: v178 (ref)
    return v178.ScopeOverlay:create():switch("Smooth Scope", true);
end)();
v178.AirLag = v146.Misc_Nightly:switch(l_get_icon_0("wind") .. "   Air-Lag", false);
v178.Teleport = v146.Misc_Nightly:switch(l_get_icon_0("hexagon-exclamation") .. "   Teleport", false);
v178.TeleportTriggers = (function()
    -- upvalues: v178 (ref)
    return v178.Teleport:create():selectable("Triggers", {
        [1] = "On-Key", 
        [2] = "Vulnerable", 
        [3] = "Vulnerable Prediction"
    });
end)();
v178.TeleportKey = (function()
    -- upvalues: v178 (ref)
    return v178.Teleport:create():hotkey("Teleport");
end)();
v178.TeleportHold = (function()
    -- upvalues: v178 (ref)
    return v178.Teleport:create():slider("Lag-Detain", 1, 32, 6, 1, function(v180)
        return v180 .. "t";
    end);
end)();
v178.TeleportRecharge = (function()
    -- upvalues: v178 (ref)
    return v178.Teleport:create():switch("Force Re-Charge", false);
end)();
v178.TeleportDisablers = (function()
    -- upvalues: v178 (ref)
    return v178.Teleport:create():selectable("Disablers", {
        [1] = "Ground", 
        [2] = "Knife / Zeus", 
        [3] = "Low Velocity"
    });
end)();
v178.AiPeek = v146.Misc_Nightly2:switch(l_get_icon_0("code-compare") .. "   Ai Peek", false);
v178.AiPeek_Bind = (function()
    -- upvalues: v178 (ref), l_get_icon_0 (ref)
    return v178.AiPeek:create():switch(l_get_icon_0("keyboard") .. "   Bind", false);
end)();
v178.AiPeek_Debug = (function()
    -- upvalues: v178 (ref), l_get_icon_0 (ref)
    return v178.AiPeek:create():switch(l_get_icon_0("bug") .. "  Debug", false);
end)();
v178.AiPeek_Radius = (function()
    -- upvalues: v178 (ref), l_get_icon_0 (ref)
    return v178.AiPeek:create():slider(l_get_icon_0("brackets-round") .. "  Radius", 50, 250, 50);
end)();
v178.AiPeek_Segments = (function()
    -- upvalues: v178 (ref), l_get_icon_0 (ref)
    return v178.AiPeek:create():slider(l_get_icon_0("split") .. "  Segments", 8, 36, 16);
end)();
v178.AiPeek_Prediction = (function()
    -- upvalues: v178 (ref), l_get_icon_0 (ref)
    return v178.AiPeek:create():switch(l_get_icon_0("forward") .. "  Prediction", false);
end)();
v178.AiPeek_PredictionTicks = (function()
    -- upvalues: v178 (ref), l_get_icon_0 (ref)
    return v178.AiPeek:create():slider(l_get_icon_0("turn-down-right") .. " ", 1, 24, 1, 1, function(v181)
        return v181 .. "t";
    end);
end)();
v178.AimTools = v146.Misc_Nightly2:switch(l_get_icon_0("gun") .. "   Aim Tools", false);
v178.AimTools_Weapon = (function()
    -- upvalues: v178 (ref)
    return v178.AimTools:create():combo("", {
        [1] = "SSG-08", 
        [2] = "AWP", 
        [3] = "Pistols", 
        [4] = "Heavy Pistols", 
        [5] = "Auto Snipers"
    });
end)();
v178.AimTools_Weapons = {};
for v182, v183 in l_pairs_0({
    [1] = "SSG-08", 
    [2] = "AWP", 
    [3] = "Pistols", 
    [4] = "Heavy Pistols", 
    [5] = "Auto Snipers"
}) do
    v178.AimTools_Weapons[v183] = {};
    do
        local l_v182_0 = v182;
        v178.AimTools_Weapons[v183].Enable = (function()
            -- upvalues: v178 (ref), l_get_icon_0 (ref), l_rep_0 (ref), l_v182_0 (ref)
            return v178.AimTools:create():switch(l_get_icon_0("power-off") .. "   Enable" .. l_rep_0(" ", l_v182_0), false);
        end)();
        v178.AimTools_Weapons[v183].Safety = (function()
            -- upvalues: v178 (ref), l_get_icon_0 (ref), l_rep_0 (ref), l_v182_0 (ref)
            return v178.AimTools:create():selectable(l_get_icon_0("shield") .. "   Safety Features" .. l_rep_0(" ", l_v182_0), {
                [1] = "Lethal", 
                [2] = "Height Advantage"
            });
        end)();
        v178.AimTools_Weapons[v183].Conditionals = (function()
            -- upvalues: v178 (ref), l_get_icon_0 (ref), l_rep_0 (ref), l_v182_0 (ref)
            return v178.AimTools:create():switch(l_get_icon_0("toolbox") .. "   Conditonal Multipoints" .. l_rep_0(" ", l_v182_0), false);
        end)();
        v178.AimTools_Weapons[v183].Conditionals:tooltip("Based on enemy conditions");
        v178.AimTools_Weapons[v183].Condition = (function()
            -- upvalues: v178 (ref), l_get_icon_0 (ref), l_rep_0 (ref), l_v182_0 (ref)
            return v178.AimTools:create():combo(l_get_icon_0("layer-group") .. "   Condtion" .. l_rep_0(" ", l_v182_0), {
                [1] = "General", 
                [2] = "Crouch", 
                [3] = "Air", 
                [4] = "Air Crouch"
            });
        end)();
        v178.AimTools_Weapons[v183].Conditions = {};
        for v185, v186 in l_pairs_0({
            [1] = "General", 
            [2] = "Crouch", 
            [3] = "Air", 
            [4] = "Air Crouch"
        }) do
            v178.AimTools_Weapons[v183].Conditions[v186] = {};
            do
                local l_v185_0 = v185;
                v178.AimTools_Weapons[v183].Conditions[v186].Head = (function()
                    -- upvalues: v178 (ref), l_rep_0 (ref), l_v182_0 (ref), l_v185_0 (ref)
                    return v178.AimTools:create():slider("Head" .. l_rep_0(" ", l_v182_0 * l_v185_0), 0, 100, 0, 1, function(v188)
                        if v188 == 0 then
                            return "Auto";
                        else
                            return v188;
                        end;
                    end);
                end)();
                v178.AimTools_Weapons[v183].Conditions[v186].Body = (function()
                    -- upvalues: v178 (ref), l_rep_0 (ref), l_v182_0 (ref), l_v185_0 (ref)
                    return v178.AimTools:create():slider("Body" .. l_rep_0(" ", l_v182_0 * l_v185_0), 0, 100, 0, 1, function(v189)
                        if v189 == 0 then
                            return "Auto";
                        else
                            return v189;
                        end;
                    end);
                end)();
            end;
        end;
    end;
end;
if not v81.Nightly then
    v178.AirLag:name(l_get_icon_0("lock") .. "   Air-Lag");
    v178.AirLag:disabled(true);
    l_execute_after_0(0.5, function()
        -- upvalues: v178 (ref)
        v178.AirLag:set(false);
    end);
    v178.Teleport:name(l_get_icon_0("lock") .. "   Teleport");
    v178.Teleport:disabled(true);
    l_execute_after_0(0.5, function()
        -- upvalues: v178 (ref)
        v178.Teleport:set(false);
    end);
    v178.AiPeek:name(l_get_icon_0("lock") .. "   Ai Peek");
    v178.AiPeek:disabled(true);
    l_execute_after_0(0.5, function()
        -- upvalues: v178 (ref)
        v178.AiPeek:set(false);
    end);
    v178.AimTools:name(l_get_icon_0("lock") .. "   Aim Tools");
    v178.AimTools:disabled(true);
    l_execute_after_0(0.5, function()
        -- upvalues: v178 (ref)
        v178.AimTools:set(false);
    end);
end;
local v190 = {
    LogoSize = 1150, 
    Opacity = 0, 
    Loaded = false, 
    Time = globals.realtime
};
if v147.Loading:get() then
    l_console_exec_0("playvol ambient/ambience/rainscapes/thunder_close02.wav 1");
end;
Menu_Load_Animation = function()
    -- upvalues: v190 (ref), l_screen_size_0 (ref), l_rect_0 (ref), l_vector_0 (ref), l_color_0 (ref), l_random_0 (ref), l_blur_0 (ref), l_texture_0 (ref), v122 (ref)
    if v190.LogoSize > 350 then
        v190.LogoSize = v190.LogoSize - 1.5;
    end;
    if v190.Time + 4 >= globals.realtime then
        if v190.Opacity < 1 then
            v190.Opacity = v190.Opacity + 0.02;
        end;
    else
        if v190.Opacity <= 0 then
            v190.Loaded = true;
        end;
        v190.Opacity = v190.Opacity - 0.02;
    end;
    local l_Opacity_0 = v190.Opacity;
    local l_LogoSize_0 = v190.LogoSize;
    local v193 = l_screen_size_0();
    l_rect_0(l_vector_0(0, 0), v193, l_color_0(255, 255, 255, l_Opacity_0 * (l_random_0(-15, 2) * 15)));
    l_blur_0(l_vector_0(0, 0), v193, 1, l_Opacity_0);
    l_rect_0(l_vector_0(0, 0), v193, l_color_0(11, 11, 11, l_Opacity_0 * 175));
    l_texture_0(v122.Logo, l_vector_0(v193.x / 2 - l_LogoSize_0 / 2, v193.y / 2 - l_LogoSize_0 / 2), l_vector_0(l_LogoSize_0, l_LogoSize_0), l_color_0(255, 255, 255, 255 * l_Opacity_0));
end;
Menu_Animate = function()
    -- upvalues: v147 (ref), v190 (ref), l_get_alpha_0 (ref), v148 (ref), l_get_icon_0 (ref), l_pairs_0 (ref), v178 (ref), v81 (ref)
    if v147.Loading:get() and not v190.Loaded then
        Menu_Load_Animation();
    end;
    if l_get_alpha_0() == 0 then
        return;
    else
        v147.RoleGuideText:visibility(v147.RoleGuide:get());
        v147.LogoExtend:visibility(v147.RoleGuide:get());
        local v194 = v148.Enable:get();
        v148.Select:visibility(v194);
        local v195 = v194 and v148.Select:get() == " " .. l_get_icon_0("star") .. "  General";
        v148.Freestanding:visibility(v195);
        v148.Freestanding_Disablers:visibility(v195);
        v148.Freestanding_Override:visibility(v195);
        v148.ManualYaw:visibility(v195);
        v148.SafeHead:visibility(v195);
        local v196 = v195 and v148.SafeHead:get({
            [1] = "Weapons"
        });
        v148.SafeHeadWeapons:visibility(v196);
        v148.SafeHeadExclude:visibility(v196);
        v148.EdgeYaw:visibility(v195);
        v148.AntiBackstab:visibility(v195);
        v148.AnimBreakers:visibility(v195);
        local v197 = v195 and v148.AnimBreakers:get();
        v148.AnimBreakersAir:visibility(v197);
        v148.AnimBreakersGround:visibility(v197);
        v148.AnimBreakersLean:visibility(v197);
        v148.AnimBreakersPitch:visibility(v197);
        v148.AntiBruteforce_Enable:visibility(v195);
        v148.AntiBruteforce_Limit:visibility(false);
        local v198 = v195 and v148.AntiBruteforce_Enable:get();
        v148.AntiBruteforce_Add:visibility(v198);
        v148.AntiBruteforce_Remove:visibility(v198);
        local v199 = v148.AntiBruteforce_Limit:get();
        for v200 = 1, 6 do
            v148.AntiBruteforce_Phases[v200].Label:visibility(v198 and v200 <= v199);
            v148.AntiBruteforce_Phases[v200].YawOffset:visibility(v198 and v148.AntiBruteforce_Phases[v200].Yaw:get() == "Static");
            v148.AntiBruteforce_Phases[v200].ModifierOffset:visibility(v198 and v148.AntiBruteforce_Phases[v200].Modifier:get() ~= "Disabled");
        end;
        local v201 = v194 and v148.Select:get() == " " .. l_get_icon_0("sliders") .. "   Builder";
        v148.State:visibility(v201);
        for v202, v203 in l_pairs_0(v148.States) do
            local v204 = v201 and v148.State:get() == "  " .. v148.StatesIcons[v202] .. "  " .. v203;
            if v203 ~= "Global" then
                v148[v203].Override:visibility(v204);
                if v204 then
                    v204 = v148[v203].Override:get();
                end;
            end;
            v148[v203].Yaw:visibility(v204);
            local l_YawOffset_0 = v148[v203].YawOffset;
            local l_l_YawOffset_0_0 = l_YawOffset_0;
            l_YawOffset_0 = l_YawOffset_0.visibility;
            local v207;
            if v204 then
                v207 = v148[v203].Yaw:get() == "Default";
            else
                v207 = v204;
            end;
            l_YawOffset_0(l_l_YawOffset_0_0, v207);
            l_YawOffset_0 = v148[v203].YawL;
            l_l_YawOffset_0_0 = l_YawOffset_0;
            l_YawOffset_0 = l_YawOffset_0.visibility;
            if v204 then
                v207 = v148[v203].Yaw:get() ~= "Default";
            else
                v207 = v204;
            end;
            l_YawOffset_0(l_l_YawOffset_0_0, v207);
            l_YawOffset_0 = v148[v203].YawR;
            l_l_YawOffset_0_0 = l_YawOffset_0;
            l_YawOffset_0 = l_YawOffset_0.visibility;
            if v204 then
                v207 = v148[v203].Yaw:get() ~= "Default";
            else
                v207 = v204;
            end;
            l_YawOffset_0(l_l_YawOffset_0_0, v207);
            v148[v203].Modifier:visibility(v204);
            l_YawOffset_0 = v148[v203].ModifierMode;
            l_l_YawOffset_0_0 = l_YawOffset_0;
            l_YawOffset_0 = l_YawOffset_0.visibility;
            if v204 then
                v207 = v148[v203].Modifier:get() == "Custom";
            else
                v207 = v204;
            end;
            l_YawOffset_0(l_l_YawOffset_0_0, v207);
            l_YawOffset_0 = v148[v203].ModifierDelay;
            l_l_YawOffset_0_0 = l_YawOffset_0;
            l_YawOffset_0 = l_YawOffset_0.visibility;
            if v204 then
                v207 = v148[v203].Modifier:get() == "Custom";
            else
                v207 = v204;
            end;
            l_YawOffset_0(l_l_YawOffset_0_0, v207);
            l_YawOffset_0 = v148[v203].ModifierRandomization;
            l_l_YawOffset_0_0 = l_YawOffset_0;
            l_YawOffset_0 = l_YawOffset_0.visibility;
            if v204 then
                v207 = v148[v203].Modifier:get() == "Custom";
            else
                v207 = v204;
            end;
            l_YawOffset_0(l_l_YawOffset_0_0, v207);
            l_YawOffset_0 = v148[v203].ModifierOffset;
            l_l_YawOffset_0_0 = l_YawOffset_0;
            l_YawOffset_0 = l_YawOffset_0.visibility;
            if v204 then
                v207 = v148[v203].Modifier:get() ~= "Disabled" and v148[v203].Modifier:get() ~= "Custom";
            else
                v207 = v204;
            end;
            l_YawOffset_0(l_l_YawOffset_0_0, v207);
            l_YawOffset_0 = v148[v203].ModifierOffsetCustom;
            l_l_YawOffset_0_0 = l_YawOffset_0;
            l_YawOffset_0 = l_YawOffset_0.visibility;
            if v204 then
                v207 = v148[v203].Modifier:get() == "Custom";
            else
                v207 = v204;
            end;
            l_YawOffset_0(l_l_YawOffset_0_0, v207);
            v148[v203].Desync:visibility(v204);
            if v204 then
                l_YawOffset_0 = v148[v203].Desync:get() ~= "Disabled";
            else
                l_YawOffset_0 = v204;
            end;
            l_l_YawOffset_0_0 = v148[v203].DesyncDelay;
            v207 = l_l_YawOffset_0_0;
            l_l_YawOffset_0_0 = l_l_YawOffset_0_0.visibility;
            local v208;
            if l_YawOffset_0 then
                v208 = v148[v203].Desync:get() == "Jitter";
            else
                v208 = l_YawOffset_0;
            end;
            l_l_YawOffset_0_0(v207, v208);
            v148[v203].DesyncLabel:visibility(l_YawOffset_0);
            v148[v203].FakeFlick:visibility(v204);
            v148[v203].Defensive:visibility(v204);
            if v204 then
                v204 = v148[v203].Defensive:get() ~= "Disabled";
            end;
            v148[v203].DefensiveSafety:visibility(v204);
            l_l_YawOffset_0_0 = v148[v203].DefensiveEnemyPing;
            v207 = l_l_YawOffset_0_0;
            l_l_YawOffset_0_0 = l_l_YawOffset_0_0.visibility;
            if v204 then
                v208 = v148[v203].DefensiveSafety:get({
                    [1] = "Enemy Ping Advantage"
                });
            else
                v208 = v204;
            end;
            l_l_YawOffset_0_0(v207, v208);
            v148[v203].DefensiveForce:visibility(v204);
            v148[v203].DefensivePitch:visibility(v204);
            l_l_YawOffset_0_0 = v148[v203].DefensivePitch:get();
            v207 = v148[v203].DefensivePitchOffset;
            v208 = v207;
            v207 = v207.visibility;
            local v209;
            if v204 then
                v209 = l_l_YawOffset_0_0 == "Static";
            else
                v209 = v204;
            end;
            v207(v208, v209);
            v207 = v148[v203].DefensivePitchOffsetL;
            v208 = v207;
            v207 = v207.visibility;
            if v204 then
                v209 = l_l_YawOffset_0_0 == "Swing" or l_l_YawOffset_0_0 == "Jitter";
            else
                v209 = v204;
            end;
            v207(v208, v209);
            v207 = v148[v203].DefensivePitchOffsetR;
            v208 = v207;
            v207 = v207.visibility;
            if v204 then
                v209 = l_l_YawOffset_0_0 == "Swing" or l_l_YawOffset_0_0 == "Jitter";
            else
                v209 = v204;
            end;
            v207(v208, v209);
            v207 = v148[v203].DefensivePitchSpeed;
            v208 = v207;
            v207 = v207.visibility;
            if v204 then
                v209 = l_l_YawOffset_0_0 == "Swing" or l_l_YawOffset_0_0 == "Jitter";
            else
                v209 = v204;
            end;
            v207(v208, v209);
            v207 = v148[v203].DefensiveModifier:get();
            v148[v203].DefensiveModifier:visibility(v204);
            v208 = v148[v203].DefensiveModifierOffset;
            v209 = v208;
            v208 = v208.visibility;
            local v210;
            if v204 then
                v210 = v207 == "Static";
            else
                v210 = v204;
            end;
            v208(v209, v210);
            v208 = v148[v203].DefensiveModifierL;
            v209 = v208;
            v208 = v208.visibility;
            if v204 then
                v210 = v207 == "Swing" or v207 == "Jitter";
            else
                v210 = v204;
            end;
            v208(v209, v210);
            v208 = v148[v203].DefensiveModifierR;
            v209 = v208;
            v208 = v208.visibility;
            if v204 then
                v210 = v207 == "Swing" or v207 == "Jitter";
            else
                v210 = v204;
            end;
            v208(v209, v210);
            v208 = v148[v203].DefensiveModifierSpeed;
            v209 = v208;
            v208 = v208.visibility;
            if v204 then
                v210 = v207 == "Swing" or not (v207 ~= "Jitter") or v207 == "Circular";
            else
                v210 = v204;
            end;
            v208(v209, v210);
            v148[v203].DefensiveHideShots:visibility(v204);
        end;
        v178.LogsAimbot:visibility(v178.Logs:get());
        local v211 = v178.LegacySounds:get();
        v178.LegacySoundsMode:visibility(v211);
        v178.LegacySoundsCustom:visibility(v211);
        v178.LegacySoundsVolume:visibility(v211);
        local v212 = v178.Viewmodel:get();
        v178.Viewmodel_Fov:visibility(v212);
        v178.Viewmodel_X:visibility(v212);
        v178.Viewmodel_Y:visibility(v212);
        v178.Viewmodel_Z:visibility(v212);
        v178.AspectRatio_Value:visibility(v178.AspectRatio:get());
        v178.Movement_AvoidDistance:visibility(v178.Movement:get({
            [1] = "Avoid Collisions"
        }));
        local v213 = v178.Teleport:get();
        v178.TeleportTriggers:visibility(v213);
        v178.TeleportKey:visibility(v213 and v178.TeleportTriggers:get({
            [1] = "On-Key"
        }));
        v178.TeleportHold:visibility(v213);
        v178.TeleportRecharge:visibility(v213);
        v178.TeleportDisablers:visibility(v213);
        local v214 = v178.Watermark:get();
        v178.WatermarkLock:visibility(v214);
        v178.WatermarkUsername:visibility(v214);
        v178.WatermarkTime:visibility(v214);
        v178.WatermarkTimeMode:visibility(v178.WatermarkTime:get() and v214);
        v178.DlightMode:visibility(v178.Dlight:get());
        local v215 = v178.Hitmarkers:get();
        v178.HitmarkersTesla:visibility(v215);
        v178.HitmarkersSparks:visibility(v215);
        v178.HitmarkersChinese:visibility(v215);
        local v216 = v178.ScopeOverlay:get();
        v178.ScopeOverlayStyle:visibility(v216);
        v178.ScopeOverlaySize:visibility(v216);
        v178.ScopeOverlaySpace:visibility(v216);
        local v217 = v178.Crosshair:get();
        v178.CrosshairMain:visibility(v217);
        v178.CrosshairItems:visibility(v217);
        v178.Keybinds_x:visibility(false);
        v178.Keybinds_y:visibility(false);
        v178.Spectators_x:visibility(false);
        v178.Spectators_y:visibility(false);
        v178.Slowdown_x:visibility(false);
        v178.Slowdown_y:visibility(false);
        v178.Crosshair_x:visibility(false);
        v178.Crosshair_y:visibility(false);
        v178.ClantagRisin:visibility(v81.Dev);
        local v218 = v178.AiPeek:get() and v81.Nightly;
        v178.AiPeek_Bind:visibility(v218);
        v178.AiPeek_Debug:visibility(v218);
        v178.AiPeek_Radius:visibility(v218);
        v178.AiPeek_Segments:visibility(v218);
        v178.AiPeek_Prediction:visibility(v218);
        local v219 = v178.AiPeek_Prediction:get();
        v178.AiPeek_PredictionTicks:visibility(v218 and v219);
        local v220 = v178.AimTools:get() and v81.Nightly;
        v178.AimTools_Weapon:visibility(v220);
        for _, v222 in l_pairs_0({
            [1] = "SSG-08", 
            [2] = "AWP", 
            [3] = "Pistols", 
            [4] = "Heavy Pistols", 
            [5] = "Auto Snipers"
        }) do
            local v223 = v220 and v178.AimTools_Weapon:get() == v222;
            v178.AimTools_Weapons[v222].Enable:visibility(v220 and v178.AimTools_Weapon:get() == v222);
            local v224 = v223 and v178.AimTools_Weapons[v222].Enable:get();
            v178.AimTools_Weapons[v222].Safety:visibility(v224);
            v178.AimTools_Weapons[v222].Conditionals:visibility(v224);
            local v225 = v224 and v178.AimTools_Weapons[v222].Conditionals:get();
            v178.AimTools_Weapons[v222].Condition:visibility(v225);
            for _, v227 in l_pairs_0({
                [1] = "General", 
                [2] = "Crouch", 
                [3] = "Air", 
                [4] = "Air Crouch"
            }) do
                local v228 = v225 and v178.AimTools_Weapons[v222].Condition:get() == v227;
                v178.AimTools_Weapons[v222].Conditions[v227].Head:visibility(v228);
                v178.AimTools_Weapons[v222].Conditions[v227].Body:visibility(v228);
            end;
        end;
        return;
    end;
end;
local v229 = db.omega_performance or {};
Performance_Update = function()
    -- upvalues: v229 (ref), v147 (ref)
    db.omega_performance = v229;
    v147.PerformanceKilledCounter:name("  " .. db.omega_performance.Kills .. "  ");
    v147.PerformanceHitMissCounter:name("  " .. db.omega_performance.Hits .. " / " .. db.omega_performance.Misses .. "  ");
end;
Performance_Reset = function()
    -- upvalues: v229 (ref)
    v229 = {
        Hits = 0, 
        Kills = 0, 
        Misses = 0
    };
    db.omega_performance = v229;
    Performance_Update();
end;
if db.omega_performance == nil then
    Performance_Reset();
end;
Performance_Update();
Performance_Aim = function(v230)
    -- upvalues: v229 (ref)
    if not v230.target then
        return;
    else
        if v230.state == nil then
            v229.Hits = v229.Hits + 1;
            if not v230.target:is_alive() then
                v229.Kills = v229.Kills + 1;
            end;
        else
            v229.Misses = v229.Misses + 1;
        end;
        Performance_Update();
        return;
    end;
end;
local v231 = {};
Notify_New = function(v232)
    -- upvalues: v231 (ref)
    v231[#v231 + 1] = {
        slide = 15, 
        opacity = 0, 
        message = v232, 
        time = globals.realtime
    };
end;
l_execute_after_0(2, function()
    -- upvalues: l_get_username_0 (ref), l_execute_after_0 (ref), l_lower_0 (ref), v145 (ref), v81 (ref)
    Notify_New("Welcome back, " .. l_get_username_0());
    l_execute_after_0(1, function()
        -- upvalues: l_lower_0 (ref), v145 (ref), v81 (ref)
        Notify_New("Build: " .. l_lower_0(v145.GetBuild()) .. " / Updated: " .. v81.Update);
    end);
end);
Notify_Render = function()
    -- upvalues: l_screen_size_0 (ref), v231 (ref), l_ipairs_0 (ref), v178 (ref), v122 (ref), l_measure_text_0 (ref), l_vector_0 (ref), l_rect_0 (ref), l_blur_0 (ref), l_text_0 (ref)
    local v233 = l_screen_size_0();
    local l_v231_0 = v231;
    for v235, v236 in l_ipairs_0(l_v231_0) do
        if v236.time + 4 > globals.realtime then
            if v236.slide > 0 then
                l_v231_0[v235].slide = v236.slide - 0.5;
            end;
            if v236.opacity <= 1 then
                l_v231_0[v235].opacity = v236.opacity + 0.01;
            end;
        elseif v236.opacity > 0 then
            l_v231_0[v235].opacity = v236.opacity - 0.01;
        else
            table.remove(l_v231_0, v235);
        end;
    end;
    v231 = l_v231_0;
    local v237 = v178.Design_Background:get();
    local v238 = v178.Design_Font:get();
    local l_Font_Light_0 = v122.Font_Light;
    local l_Font_Regular_0 = v122.Font_Regular;
    local function v242(v241)
        -- upvalues: l_measure_text_0 (ref), l_Font_Light_0 (ref)
        return l_measure_text_0(l_Font_Light_0, nil, v241).x;
    end;
    local function v244(v243)
        -- upvalues: l_measure_text_0 (ref), l_Font_Regular_0 (ref)
        return l_measure_text_0(l_Font_Regular_0, nil, v243).x;
    end;
    for v245, v246 in l_ipairs_0(l_v231_0) do
        local v247 = v244("omega");
        local v248 = v242(v246.message);
        local v249 = 8 + v247 + 14 + v248 + 6;
        local v250 = l_vector_0(v233.x / 2 - v249 / 2, v233.y / 2 + v233.y / 4 + (v245 - 1) * 30 + v246.slide);
        local v251 = l_vector_0(v250.x + v249, v250.y + 25);
        l_rect_0(v250, v251, v237:alpha_modulate(v246.opacity * 255), 5);
        l_blur_0(l_vector_0(v250.x + (8 + v247 + 8), v250.y + 1), v251, 8, v246.opacity, 4);
        l_text_0(l_Font_Regular_0, l_vector_0(v250.x + 8, v250.y + 7), v238:alpha_modulate(v246.opacity * 255), nil, "omega");
        l_text_0(l_Font_Light_0, l_vector_0(v250.x + (8 + v247 + 8) + 6, v250.y + 7), v238:alpha_modulate(v246.opacity * 255), nil, v246.message);
    end;
end;
Setting_Get = function()
    -- upvalues: v148 (ref), l_type_0 (ref), v178 (ref)
    local v252 = {
        AntiAim = {}
    };
    for v253, v254 in next, v148 do
        if l_type_0(v254) == "table" then
            if v253 ~= "States" and v253 ~= "StatesIcons" then
                v252.AntiAim[v253] = {};
                for v255, v256 in next, v254 do
                    if l_type_0(v256) == "table" then
                        v252.AntiAim[v253][v255] = {};
                        for v257, v258 in next, v256 do
                            if v257 ~= "Label" then
                                v252.AntiAim[v253][v255][v257] = v258:get();
                            end;
                        end;
                    elseif v255 ~= "DesyncLabel" then
                        v252.AntiAim[v253][v255] = v256:get();
                    end;
                end;
            end;
        elseif v253 ~= "Select" and v253 ~= "AntiBruteforce_Add" and v253 ~= "AntiBruteforce_Remove" and v253 ~= "State" then
            v252.AntiAim[v253] = v254:get();
        end;
    end;
    v252.Misc = {};
    for v259, v260 in next, v178 do
        if v259 ~= "Design" and v259 ~= "TeleportKey" and v259 ~= "AimTools_Weapons" then
            if v259 == "Design_Font" or v259 == "Design_Background" or v259 == "DlightColor" or v259 == "CrosshairMain" or v259 == "CrosshairAccent" or v259 == "HitmarkersTeslaColor" or v259 == "HitmarkersChineseColor" or v259 == "ScopeOverlayColor" then
                v252.Misc[v259] = v260:get():to_hex();
            else
                v252.Misc[v259] = v260:get();
            end;
        end;
    end;
    return v252;
end;
Settings_Set = function(v261)
    -- upvalues: v148 (ref), l_type_0 (ref), v178 (ref), v81 (ref), l_get_icon_0 (ref), l_execute_after_0 (ref)
    for v262, v263 in next, v148 do
        if v261.AntiAim[v262] ~= nil then
            if l_type_0(v263) == "table" then
                for v264, v265 in next, v263 do
                    if v261.AntiAim[v262][v264] ~= nil then
                        if l_type_0(v265) == "table" then
                            for v266, v267 in next, v265 do
                                if v261.AntiAim[v262][v264][v266] ~= nil then
                                    v267:set(v261.AntiAim[v262][v264][v266]);
                                end;
                            end;
                        else
                            v265:set(v261.AntiAim[v262][v264]);
                        end;
                    end;
                end;
            else
                v263:set(v261.AntiAim[v262]);
            end;
        end;
    end;
    for v268, v269 in next, v178 do
        if v261.Misc[v268] ~= nil then
            v269:set(v261.Misc[v268]);
        end;
    end;
    if not v81.Nightly then
        v178.AirLag:name(l_get_icon_0("lock") .. "   Air-Lag");
        v178.AirLag:disabled(true);
        l_execute_after_0(0.5, function()
            -- upvalues: v178 (ref)
            v178.AirLag:set(false);
        end);
        v178.Teleport:name(l_get_icon_0("lock") .. "   Teleport");
        v178.Teleport:disabled(true);
        l_execute_after_0(0.5, function()
            -- upvalues: v178 (ref)
            v178.Teleport:set(false);
        end);
        v178.AiPeek:name(l_get_icon_0("lock") .. "   Ai Peek");
        v178.AiPeek:disabled(true);
        l_execute_after_0(0.5, function()
            -- upvalues: v178 (ref)
            v178.AiPeek:set(false);
        end);
        v178.AimTools:name(l_get_icon_0("lock") .. "   Aim Tools");
        v178.AimTools:disabled(true);
        l_execute_after_0(0.5, function()
            -- upvalues: v178 (ref)
            v178.AimTools:set(false);
        end);
    end;
end;
Settings_Import = function(v270)
    -- upvalues: v106 (ref), l_get_0 (ref), v81 (ref), l_parse_0 (ref)
    if not v270 then
        v270 = v106.get();
    end;
    local v271 = l_get_0("https://api." .. v81.Api .. "/neverlose/cloud/import/" .. v270);
    if v271 == nil then
        Notify_New("Cloud error detected, please try again later");
        return;
    elseif v271 == "{}" then
        Notify_New("Invalid configuration in clipboard");
        return;
    else
        Settings_Set(l_parse_0(v271));
        Notify_New(v270 == "default" and "Loaded default configuration" or "Config imported from clipboard");
        return;
    end;
end;
Settings_Export = function()
    -- upvalues: l_post_0 (ref), v81 (ref), l_get_username_0 (ref), l_stringify_0 (ref), v106 (ref)
    local v272 = l_post_0("https://api." .. v81.Api .. "/neverlose/cloud/export", {
        username = l_get_username_0(), 
        config = l_stringify_0(Setting_Get())
    });
    v106.set(v272);
    Notify_New("Config copied to clipboard");
end;
local v273 = {
    DoubleTap = l_find_1("Aimbot", "Ragebot", "Main", "Double Tap"), 
    DoubleTapLag = l_find_1("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    DoubleTapLimit = l_find_1("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"), 
    HideShots = l_find_1("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    PeekAssist = l_find_1("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    FakeDuck = l_find_1("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    SlowWalk = l_find_1("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    LegMovement = l_find_1("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    FakeLag = l_find_1("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
    FakeLagLimit = l_find_1("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
    FakeLagVariability = l_find_1("Aimbot", "Anti Aim", "Fake Lag", "Variability"), 
    AntiAimEnabled = l_find_1("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    Pitch = l_find_1("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    Freestanding = l_find_1("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    FreestandingYaw = l_find_1("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    Yaw = l_find_1("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    YawBase = l_find_1("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    YawOffset = l_find_1("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    YawHidden = l_find_1("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    YawAvoidBackstab = l_find_1("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    YawModifier = l_find_1("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    YawModifierOffset = l_find_1("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    BodyYaw = l_find_1("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    BodyYawInverter = l_find_1("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    BodyYawLeft = l_find_1("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    BodyYawRight = l_find_1("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    BodyYawOptions = l_find_1("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    BodyYawFreestanding = l_find_1("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    FieldOfView = l_find_1("Visuals", "World", "Main", "Field Of View"), 
    OverrideZoom = l_find_1("Visuals", "World", "Main", "Override Zoom"), 
    ForceThirdperson = l_find_1("Visuals", "World", "Main", "Force Thirdperson"), 
    ScopeOverlay = l_find_1("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
    AirStrafe = l_find_1("Miscellaneous", "Main", "Movement", "Air Strafe"), 
    FakeLatency = l_find_1("Miscellaneous", "Main", "Other", "Fake Latency"), 
    WeaponActions = l_find_1("Miscellaneous", "Main", "Other", "Weapon Actions")
};
cvar.sv_maxunlag:float(0.2);
local v288 = {
    DistFrom3DLine = function(v274, v275, v276)
        local v277 = v276 - v275;
        local v278 = v274 - v275;
        if v278:dot(v277) <= 0 then
            return v278:length();
        else
            local v279 = v274 - v276;
            if v279:dot(v277) >= 0 then
                return v279:length();
            else
                return v277:cross(v278):length() / v277:length();
            end;
        end;
    end, 
    angle_vec = function(v280, v281)
        -- upvalues: l_sin_0 (ref), l_rad_0 (ref), l_cos_0 (ref), l_vector_0 (ref)
        local v282 = nil;
        local v283 = nil;
        local v284 = nil;
        local v285 = nil;
        v282 = l_sin_0(l_rad_0(v280));
        v283 = l_sin_0(l_rad_0(v281));
        v284 = l_cos_0(l_rad_0(v280));
        v285 = l_cos_0(l_rad_0(v281));
        return l_vector_0(v284 * v285, v284 * v283, -v282);
    end, 
    is_grenade = function()
        -- upvalues: l_get_local_player_0 (ref)
        local v286 = l_get_local_player_0();
        if not v286 then
            return false;
        else
            local v287 = v286:get_player_weapon();
            if not v287 then
                return false;
            elseif v287:get_weapon_info().weapon_type == 9 then
                return true;
            else
                return false;
            end;
        end;
    end, 
    Last_Local_Shot = globals.realtime
};
local v289 = {
    is_freestanding = false, 
    condition_time = 0, 
    condition = "Global", 
    desync = {
        jitter = false, 
        value = 0
    }, 
    modifier = {
        swing_value = 0, 
        swing = false, 
        segment = 0, 
        invert = false
    }, 
    defensive = {
        max_tickbase = 0, 
        active = false, 
        pitch = {
            swing = false, 
            jitter = false, 
            value = 0
        }, 
        modifier = {
            swing = false, 
            jitter = false, 
            value = 0, 
            circular = 0
        }
    }, 
    anti_brute = {
        phase = 1, 
        time = 0
    }
};
v273.Pitch:disabled(false);
v273.Yaw:disabled(false);
v273.YawModifier:disabled(false);
v273.BodyYaw:disabled(false);
v289.update_condition = function(v290, v291)
    -- upvalues: l_band_0 (ref), v273 (ref)
    local l_realtime_0 = globals.realtime;
    if not v291 or l_realtime_0 < v290.condition_time then
        return;
    elseif not v291.m_fFlags then
        return;
    else
        local l_m_fFlags_0 = v291.m_fFlags;
        local v294 = l_band_0(l_m_fFlags_0, 1) ~= 0;
        local v295 = l_band_0(l_m_fFlags_0, 2) ~= 0;
        local v296 = v291.m_vecVelocity:length();
        local _ = "Global";
        v290.condition = (not not v273.Freestanding:get() or v273.Freestanding:get_override() or v290.is_freestanding) and "Freestand" or not v294 and v295 and "Air Crouch" or not v294 and "Air" or v295 and "Crouch" or v273.SlowWalk:get() and "Slow Walk" or v296 > 2 and "Move" or "Stand";
        v290.condition_time = l_realtime_0 + 0.25;
        return;
    end;
end;
v273.Pitch:disabled(true);
v273.Yaw:disabled(true);
v273.YawModifier:disabled(true);
v273.BodyYaw:disabled(true);
v289.security = function(_)
    -- upvalues: v273 (ref)
    v273.Pitch:disabled(false);
    v273.Yaw:disabled(false);
    v273.YawModifier:disabled(false);
    v273.BodyYaw:disabled(false);
    v273.AntiAimEnabled:override();
    v273.Pitch:override();
    v273.Freestanding:override();
    v273.FreestandingYaw:override();
    v273.Yaw:override();
    v273.YawBase:override();
    v273.YawOffset:override();
    v273.YawHidden:override();
    v273.YawAvoidBackstab:override();
    v273.YawModifier:override();
    v273.YawModifierOffset:override();
    v273.BodyYaw:override();
    v273.BodyYawInverter:override();
    v273.BodyYawLeft:override();
    v273.BodyYawRight:override();
    v273.BodyYawOptions:override();
    v273.BodyYawFreestanding:override();
end;
v289.round_start = function(v299)
    -- upvalues: v148 (ref)
    if not v148.Enable:get() then
        return;
    else
        v299.modifier.invert = false;
        return;
    end;
end;
v289.handler = function(v300, v301)
    -- upvalues: v148 (ref), v273 (ref), l_get_local_player_0 (ref), l_exploit_0 (ref)
    if not v148.Enable:get() or not globals.is_in_game then
        v273.FakeLagLimit:override();
        return;
    else
        local v302 = l_get_local_player_0();
        v273.DoubleTapLimit:override();
        v273.DoubleTapLag:override();
        v273.FakeLagLimit:override();
        v273.AntiAimEnabled:override(true);
        v300:update_condition(v302);
        v300:simulation(v302, v301);
        local l_condition_0 = v300.condition;
        v273.Pitch:disabled(true);
        v273.Yaw:disabled(true);
        v273.YawModifier:disabled(true);
        v273.BodyYaw:disabled(true);
        v300:builder(v302, v301, l_condition_0);
        v300:freestanding(l_condition_0);
        v300:manual_yaw();
        v300:edge_yaw();
        v300:anti_bruteforce();
        v300:anim_breakers_lean(v301);
        local v304 = l_exploit_0:get() == 1;
        local v305 = v300.condition == "Stand";
        local v306 = v273.FakeDuck:get();
        if v304 then
            v273.FakeLagLimit:override(1);
        elseif v305 and not v306 then
            v273.FakeLagLimit:override(1);
        end;
        return;
    end;
end;
v289.simulation = function(v307, v308, _)
    -- upvalues: l_abs_0 (ref), l_min_0 (ref), l_max_0 (ref)
    if not v308 then
        return;
    else
        local l_m_nTickBase_0 = v308.m_nTickBase;
        if l_abs_0(l_m_nTickBase_0 - v307.defensive.max_tickbase) > 64 then
            v307.defensive.max_tickbase = 0;
        end;
        local v311 = 0;
        if v307.defensive.max_tickbase < l_m_nTickBase_0 then
            v307.defensive.max_tickbase = l_m_nTickBase_0;
        elseif l_m_nTickBase_0 < v307.defensive.max_tickbase then
            v311 = l_min_0(14, l_max_0(0, v307.defensive.max_tickbase - l_m_nTickBase_0 - 1));
        end;
        v307.defensive.active = v311 > 1;
        return;
    end;
end;
v289.builder = function(v312, v313, v314, v315)
    -- upvalues: v148 (ref), l_exploit_0 (ref), l_print_0 (ref), l_stringify_0 (ref), v273 (ref)
    if not v313 then
        return;
    else
        if v148["Fake Lag"].Override:get() and l_exploit_0:get() < 1 then
            v315 = "Fake Lag";
        elseif not v148[v315] or not v148[v315].Override or not v148[v315].Override:get() then
            v315 = "Global";
        end;
        local v316 = v148[v315];
        local l_tickcount_0 = globals.tickcount;
        local v318 = v313.m_flPoseParameter[11] * 120 - 60 > 0;
        local v319 = l_exploit_0:get() == 1;
        local v320 = {
            desync_inverter = false, 
            yaw_modifier_offset = 0, 
            yaw_modifier = "Disabled", 
            yaw_hidden = false, 
            yaw_base = "Local View", 
            yaw = "Disabled", 
            desync_limit = 0, 
            desync = false, 
            pitch = v316.YawPitch:get(), 
            yaw_offset = v316.YawOffset:get(), 
            desync_options = {}, 
            desync_freestanding = v316.DesyncFreestanding:get()
        };
        l_print_0(l_stringify_0(v320.desync_options));
        v312:process_yaw(v316, v320, v318);
        v312:process_modifier(v316, v320, l_tickcount_0, v319);
        v312:process_desync(v316, v320, l_tickcount_0);
        v312:process_defensive(v316, v320, v313, v314, v319, l_tickcount_0);
        v312:fake_flick(v316, v320, v314, v315, l_tickcount_0);
        v273.YawBase:override(v316.YawBase:get() == "At Target" and "At Target" or "Local View");
        v273.Pitch:override(v320.pitch);
        v273.Yaw:override(v320.yaw);
        v273.YawOffset:override(v320.yaw_offset);
        v273.YawModifier:override(v320.yaw_modifier);
        v273.YawModifierOffset:override(v320.yaw_modifier_offset);
        v273.YawHidden:override(v320.yaw_hidden);
        v273.BodyYawInverter:override(v320.desync_inverter);
        v273.BodyYaw:override(v320.desync);
        v273.BodyYawOptions:override(v320.desync_options);
        v273.BodyYawFreestanding:override(v320.desync_freestanding);
        v273.BodyYawLeft:override(v320.desync_limit);
        v273.BodyYawRight:override(v320.desync_limit);
        return;
    end;
end;
v289.process_desync = function(v321, v322, v323, v324)
    local v325 = v322.Desync:get();
    v323.desync = v325 ~= "Disabled";
    if not v323.desync then
        return;
    else
        local v326 = {
            [1] = "Avoid Overlap", 
            [2] = "Jitter", 
            [3] = "Randomize Jitter", 
            [4] = "Anti Bruteforce"
        };
        local v327 = {};
        for v328 = 1, 4 do
            if v322.DesyncOptions:get(v328) then
                v327[#v327 + 1] = v326[v328];
            end;
        end;
        v323.desync_options = v327;
        v323.desync_limit = v322.DesyncLimit:get();
        if v325 == "Swing" then
            local v329 = v321.desync.value + (v321.desync.jitter and 1 or -1);
            if v323.desync_limit <= v329 or v329 <= 0 then
                v321.desync.jitter = v329 <= 0;
            end;
            v321.desync.value = v329;
            v323.desync_limit = v329;
            v323.desync_inverter = v321.desync.jitter;
        elseif v325 == "Jitter" then
            if v324 % v322.DesyncDelay:get() == 1 then
                v321.desync.jitter = not v321.desync.jitter;
            end;
            v323.desync_inverter = v321.desync.jitter;
        end;
        return;
    end;
end;
v289.process_yaw = function(_, v331, v332, v333)
    local v334 = v331.Yaw:get();
    v332.yaw = v334 ~= "Disabled" and "Backward" or "Disabled";
    if v334 == "L/R" then
        v332.yaw_offset = v333 and v331.YawL:get() or v331.YawR:get();
    end;
end;
v289.process_modifier = function(v335, v336, v337, v338, v339)
    -- upvalues: l_random_0 (ref), l_floor_0 (ref)
    local v340 = v336.Modifier:get();
    if v340 ~= "Custom" then
        v337.yaw_modifier = v340;
        v337.yaw_modifier_offset = v336.ModifierOffset:get();
        return;
    else
        local v341 = v336.ModifierOffsetCustom:get();
        local v342 = v336.ModifierMode:get();
        local v343 = v336.ModifierDelay:get();
        local v344 = v336.ModifierRandomization:get();
        local l_v341_0 = v341;
        if v344 > 0 then
            local v346 = l_v341_0 / ({
                [1] = 10, 
                [2] = 5, 
                [3] = 3
            })[v344];
            l_v341_0 = l_random_0(l_v341_0 - v346, l_v341_0 + v346);
        end;
        local v347 = l_floor_0(l_v341_0 * 0.5);
        local l_yaw_offset_0 = v337.yaw_offset;
        local v349 = {
            [1] = l_yaw_offset_0 - v347, 
            [2] = l_yaw_offset_0, 
            [3] = l_yaw_offset_0 + v347
        };
        if v342 == "Center" then
            if v338 % v343 == 1 then
                v335.modifier.invert = not v335.modifier.invert;
            end;
            v337.yaw_offset = v349[v335.modifier.invert and 1 or 3];
        elseif v342 == "Offset" then
            if v338 % v343 == 1 then
                v335.modifier.invert = not v335.modifier.invert;
            end;
            local v350;
            if not v335.modifier.invert or not l_v341_0 then
                v350 = l_yaw_offset_0;
            else
                v350 = l_v341_0;
            end;
            v337.yaw_offset = v350;
        elseif v342 == "3-Way" then
            if v338 % v343 == 1 then
                v335.modifier.segment = v335.modifier.segment % 3 + 1;
            end;
            v337.yaw_offset = v349[v335.modifier.segment];
        elseif v342 == "Swing" then
            local v351 = 2.5 * (14 / v343);
            local l_swing_value_0 = v335.modifier.swing_value;
            local l_swing_0 = v335.modifier.swing;
            if not l_swing_0 and v349[3] < l_swing_value_0 or l_swing_0 and l_swing_value_0 < v349[1] then
                v335.modifier.swing = not l_swing_0;
                l_swing_0 = not l_swing_0;
            end;
            l_swing_value_0 = l_swing_value_0 + (l_swing_0 and -v351 or v351);
            v335.modifier.swing_value = l_swing_value_0;
            v337.yaw_offset = l_swing_value_0;
        end;
        v337.yaw_modifier = "Disabled";
        v337.yaw_modifier_offset = 0;
        if v339 then
            v337.desync = false;
        end;
        rage.antiaim:inverter(v335.modifier.invert);
        return;
    end;
end;
v289.process_defensive = function(v354, v355, v356, v357, v358, v359, v360)
    -- upvalues: l_get_threat_0 (ref), v273 (ref), l_antiaim_0 (ref)
    local v361 = v355.Defensive:get();
    if v361 == "Disabled" or not v359 then
        return;
    elseif v361 == "Vulnerable" and not l_get_threat_0(true) then
        return;
    elseif v354:should_skip_defensive(v355, v357) then
        return;
    else
        if v355.DefensiveForce:get() then
            v358.force_defensive = true;
        end;
        local v362 = v354:process_defensive_pitch(v355, v360);
        local v363 = v354:process_defensive_modifier(v355, v360);
        v273.DoubleTapLimit:override(1);
        v273.DoubleTapLag:override("Always On");
        v356.yaw_hidden = true;
        local v364 = v355.DefensiveHideShots:get() and v273.HideShots:get();
        if v362 then
            if v364 then
                v356.pitch = "Disabled";
                v358.view_angles.x = v362;
            else
                l_antiaim_0:override_hidden_pitch(v362);
            end;
        end;
        if v363 then
            if v364 then
                v356.yaw_modifier = "Disabled";
                v356.yaw_modifier_offset = 0;
                v356.yaw_offset = v363;
            else
                l_antiaim_0:override_hidden_yaw_offset(v363);
            end;
        end;
        if v355.DefensiveSafety:get({
            [1] = "Disable Yaw Modifiers"
        }) and v354.defensive.active then
            v356.yaw_offset = 0;
            v356.yaw_modifier = "Disabled";
        end;
        return;
    end;
end;
v289.should_skip_defensive = function(v365, v366, v367)
    -- upvalues: v273 (ref), l_is_button_down_0 (ref), v148 (ref), l_get_threat_0 (ref)
    if not v366.DefensiveHideShots:get() and v273.HideShots:get() or l_is_button_down_0(69) or v148.ManualYaw:get() ~= "Off" and v148.ManualYawSettings:get({
        [1] = "Disable Defensive"
    }) then
        return true;
    elseif v366.DefensiveSafety:get({
        [1] = "Freestanding"
    }) and (v273.Freestanding:get() or v365.is_freestanding) then
        return true;
    elseif v366.DefensiveSafety:get({
        [1] = "Low Velocity"
    }) and v367.m_vecVelocity:length() < 50 then
        return true;
    else
        if v366.DefensiveSafety:get({
            [1] = "Enemy Ping Advantage"
        }) then
            local v368 = l_get_threat_0();
            if v368 and v368:is_player() and v368:is_alive() and v368:get_resource().m_iPing < v366.DefensiveEnemyPing:get() then
                return true;
            end;
        end;
        return false;
    end;
end;
v289.process_defensive_pitch = function(v369, v370, v371)
    -- upvalues: l_random_0 (ref)
    local v372 = v370.DefensivePitch:get();
    if v372 == "Disabled" then
        return nil;
    elseif v372 == "Static" then
        return v370.DefensivePitchOffset:get();
    elseif v372 == "Random" then
        return l_random_0(-89, 89);
    else
        local v373 = v370.DefensivePitchSpeed:get();
        local l_pitch_0 = v369.defensive.pitch;
        if v372 == "Swing" then
            local v375 = v370.DefensivePitchOffsetL:get();
            local v376 = v370.DefensivePitchOffsetR:get();
            local l_value_0 = l_pitch_0.value;
            if not l_pitch_0.swing and v376 < l_value_0 or l_pitch_0.swing and l_value_0 < v375 then
                l_pitch_0.swing = not l_pitch_0.swing;
            end;
            l_value_0 = l_value_0 + (l_pitch_0.swing and -1 or 1) * v373;
            l_pitch_0.value = l_value_0;
            return l_value_0;
        elseif v372 == "Jitter" then
            if v371 % v373 == 1 then
                l_pitch_0.jitter = not l_pitch_0.jitter;
            end;
            return l_pitch_0.jitter and v370.DefensivePitchOffsetL:get() or v370.DefensivePitchOffsetR:get();
        else
            return nil;
        end;
    end;
end;
v289.process_defensive_modifier = function(v378, v379, v380)
    -- upvalues: l_random_0 (ref)
    local v381 = v379.DefensiveModifier:get();
    if v381 == "Disabled" then
        return nil;
    elseif v381 == "Static" then
        return v379.DefensiveModifierOffset:get();
    elseif v381 == "Random" then
        return l_random_0(-180, 180);
    else
        local v382 = v379.DefensiveModifierSpeed:get();
        local l_modifier_0 = v378.defensive.modifier;
        local v384 = v379.DefensiveModifierL:get();
        local v385 = v379.DefensiveModifierR:get();
        if v381 == "Swing" then
            local l_value_1 = l_modifier_0.value;
            if not l_modifier_0.swing and v385 < l_value_1 or l_modifier_0.swing and l_value_1 < v384 then
                l_modifier_0.swing = not l_modifier_0.swing;
            end;
            l_value_1 = l_value_1 + (l_modifier_0.swing and -2.5 or 2.5) * v382;
            l_modifier_0.value = l_value_1;
            return l_value_1;
        elseif v381 == "Jitter" then
            if v380 % v382 == 1 then
                l_modifier_0.jitter = not l_modifier_0.jitter;
            end;
            return l_modifier_0.jitter and v384 or v385;
        elseif v381 == "Circular" then
            local v387 = (l_modifier_0.circular + 3.5 * v382) % 360;
            l_modifier_0.circular = v387;
            return v387;
        else
            return nil;
        end;
    end;
end;
v289.fake_flick = function(_, v389, v390, v391, _, v393)
    -- upvalues: l_random_0 (ref), v273 (ref), l_antiaim_0 (ref)
    local v394 = v389.FakeFlick:get();
    if v394 == "Disabled" then
        return;
    else
        v390.desync = true;
        v390.desync_inverter = false;
        v390.desync_options = {};
        v390.desync_freestanding = "Off";
        v390.desync_limit = 42;
        v390.yaw_hidden = true;
        local v395 = (v393 + l_random_0(-1, 1)) % 2 == 1;
        v391.force_defensive = true;
        v273.DoubleTapLimit:override(1);
        v273.DoubleTapLag:override("Always On");
        v390.yaw_hidden = true;
        v390.yaw_offset = 5;
        if v394 == "Fake Up Jitter" then
            l_antiaim_0:override_hidden_pitch(v395 and -89 or 89);
            local l_l_antiaim_0_0 = l_antiaim_0;
            local l_l_l_antiaim_0_0_0 = l_l_antiaim_0_0;
            l_l_antiaim_0_0 = l_l_antiaim_0_0.override_hidden_yaw_offset;
            local v398;
            if v395 then
                v398 = v393 % 3 == 1 and -50 or -80;
            else
                v398 = 0;
            end;
            l_l_antiaim_0_0(l_l_l_antiaim_0_0_0, v398);
        else
            l_antiaim_0:override_hidden_pitch(89);
            l_antiaim_0:override_hidden_yaw_offset(v395 and -80 or 0);
        end;
        return;
    end;
end;
v289.freestanding = function(v399, v400)
    -- upvalues: v148 (ref), v273 (ref)
    if not v148.Freestanding:get() then
        if v399.is_freestanding then
            v399.is_freestanding = false;
            v273.Freestanding:override();
            v273.FreestandingYaw:override();
        end;
        return;
    else
        v399.is_freestanding = false;
        local v401 = rage.antiaim:get_target(true);
        if v148.Freestanding_Activation:get() == "Vulnerable" and not v401 then
            v273.Freestanding:override();
            return;
        else
            local l_Freestanding_Disablers_0 = v148.Freestanding_Disablers;
            if l_Freestanding_Disablers_0:get({
                [1] = "Air"
            }) and v400 == "Air" or l_Freestanding_Disablers_0:get({
                [1] = "Air Crouch"
            }) and v400 == "Air Crouch" or l_Freestanding_Disablers_0:get({
                [1] = "Crouch"
            }) and v400 == "Crouch" or l_Freestanding_Disablers_0:get({
                [1] = "Slow Walk"
            }) and v400 == "Slow Walk" then
                v273.Freestanding:override();
                return;
            else
                v399.is_freestanding = true;
                v273.YawOffset:override(v401);
                if v148.Freestanding_Override:get() then
                    v273.FreestandingYaw:override(true);
                end;
                return;
            end;
        end;
    end;
end;
v289.manual_yaw = function(_)
    -- upvalues: v148 (ref), v273 (ref)
    local v404 = v148.ManualYaw:get();
    if v404 == "Off" then
        return;
    else
        local l_ManualYawSettings_0 = v148.ManualYawSettings;
        if l_ManualYawSettings_0:get({
            [1] = "Static Yaw"
        }) then
            v273.YawModifier:override("Disabled");
        end;
        if l_ManualYawSettings_0:get({
            [1] = "Static Desync"
        }) then
            v273.BodyYawOptions:override({});
            v273.BodyYawLeft:override(60);
            v273.BodyYawRight:override(60);
        end;
        local v406 = {
            Left = -90, 
            Backward = 0, 
            Right = 90
        };
        v273.YawOffset:override(v406[v404] or 0);
        return;
    end;
end;
v289.edge_yaw = function(_)
    -- upvalues: v148 (ref), v103 (ref), v273 (ref)
    if not v148.EdgeYaw:get() then
        return;
    else
        local v408 = v103:get();
        if v408 == nil then
            return;
        else
            v273.Pitch:override("Down");
            v273.Yaw:override("Backward");
            v273.YawBase:override("At Target");
            v273.YawHidden:override(false);
            v273.YawOffset:override(v408);
            return;
        end;
    end;
end;
v289.anim_breakers = function(v409, v410)
    -- upvalues: v148 (ref), v99 (ref), l_cast_0 (ref), v273 (ref)
    if not v148.Enable:get() or not v148.AnimBreakers:get() or not v410 or not v410:is_alive() then
        return;
    else
        local l_condition_1 = v409.condition;
        local v412 = l_condition_1 == "Air" or l_condition_1 == "Air Crouch";
        local v413 = v99(v410:get_index());
        local v414 = l_cast_0("CAnimationLayer**", l_cast_0("uintptr_t", v413) + 10640)[0];
        if v412 then
            local v415 = v148.AnimBreakersAir:get();
            local v416 = ({
                Static = function()
                    -- upvalues: v410 (ref)
                    v410.m_flPoseParameter[6] = 1;
                end, 
                Walking = function()
                    -- upvalues: v414 (ref)
                    v414[6].m_flWeight = 1;
                end, 
                ["T-Pose"] = function()
                    -- upvalues: v414 (ref)
                    v414[4].m_flCycle = 0.4;
                    v414[4].m_nSequence = 11;
                end
            })[v415];
            if v416 then
                v416();
            end;
        else
            local v417 = v148.AnimBreakersGround:get();
            local v418 = ({
                Static = function()
                    -- upvalues: v273 (ref), v410 (ref)
                    v273.LegMovement:override("Sliding");
                    v410.m_flPoseParameter[0] = 1;
                end, 
                Walking = function()
                    -- upvalues: v273 (ref), v410 (ref)
                    v273.LegMovement:override("Walking");
                    v410.m_flPoseParameter[7] = 0;
                end, 
                Sliding = function()
                    -- upvalues: v273 (ref), v410 (ref)
                    v273.LegMovement:override("Sliding");
                    v410.m_flPoseParameter[10] = 0;
                end
            })[v417];
            if v418 then
                v418();
            end;
        end;
        if v148.AnimBreakersPitch:get() and not v412 and l_cast_0("CCSGOPlayerAnimationState_534535_t**", l_cast_0("uintptr_t", v413) + 39264)[0].bHitGroundAnimation then
            v410.m_flPoseParameter[12] = 0.5;
        end;
        return;
    end;
end;
v289.anim_breakers_lean = function(_, v420)
    -- upvalues: v148 (ref)
    if v148.AnimBreakers:get() then
        v420.animate_move_lean = v148.AnimBreakersLean:get();
    end;
end;
v289.anti_bruteforce_impact = function(v421, v422)
    -- upvalues: v148 (ref), l_get_1 (ref), l_get_local_player_0 (ref), l_vector_0 (ref), v288 (ref), l_abs_0 (ref), l_min_0 (ref)
    if not v148.Enable:get() or not globals.is_in_game or not v148.AntiBruteforce_Enable:get() then
        return;
    else
        local v423 = l_get_1(v422.userid, true);
        local v424 = l_get_local_player_0();
        if not v423 or not v424 or not v423:is_enemy() or v423 == v424 or not v424:is_alive() then
            return;
        else
            local v425 = v423:get_eye_position();
            local v426 = l_vector_0(v422.x, v422.y, v422.z);
            local v427 = v424:get_eye_position();
            local v428 = v424:get_hitbox_position(2);
            local v429 = v288.DistFrom3DLine(v427, v425, v426);
            local v430 = v288.DistFrom3DLine(v428, v425, v426);
            if l_abs_0(l_min_0(v430, v429)) > 80 then
                return;
            else
                local v431 = v148.AntiBruteforce_Limit:get();
                v421.anti_brute.phase = v421.anti_brute.phase % v431 + 1;
                local l_phase_0 = v421.anti_brute.phase;
                v421.anti_brute.time = globals.realtime + v148.AntiBruteforce_Phases[l_phase_0].Reset:get();
                return;
            end;
        end;
    end;
end;
v289.anti_bruteforce = function(v433)
    -- upvalues: v148 (ref), v273 (ref)
    if not v148.AntiBruteforce_Enable:get() or v433.anti_brute.time < globals.realtime then
        return;
    else
        local l_phase_1 = v433.anti_brute.phase;
        local v435 = v148.AntiBruteforce_Phases[l_phase_1];
        local v436 = v435.Yaw:get();
        if v436 == "Zero" then
            v273.YawOffset:override(0);
        elseif v436 == "Symbiotic" then
            v273.YawOffset:override(globals.tickcount % 12 <= 5 and -2 or 13);
        else
            v273.YawOffset:override(v435.YawOffset:get());
        end;
        v273.YawModifier:override(v435.Modifier:get());
        v273.YawModifierOffset:override(v435.ModifierOffset:get());
        return;
    end;
end;
v289.anti_backstab = function(_)
    -- upvalues: v273 (ref), v148 (ref)
    v273.YawAvoidBackstab:override(v148.AntiBackstab:get());
end;
v289:anti_backstab();
v148.AntiBackstab:set_callback(function()
    -- upvalues: v289 (ref)
    v289:anti_backstab();
end, true);
local v438 = false;
Interface_Disable = function(v439)
    -- upvalues: v438 (ref)
    if v438 then
        v439.in_attack = false;
        v438 = false;
    end;
end;
local v440 = {
    time_opacity2 = 0, 
    time_opacity = 0, 
    time_size = 100, 
    user_opacity2 = 0, 
    user_opacity = 0, 
    user_size = 100
};
Interface_Watermark = function()
    -- upvalues: v178 (ref), v440 (ref), l_screen_size_0 (ref), l_vector_0 (ref), v122 (ref), l_measure_text_0 (ref), l_get_username_0 (ref), l_panorama_0 (ref), l_get_local_player_0 (ref), v145 (ref), l_get_icon_0 (ref), l_get_date_0 (ref), l_blur_0 (ref), l_rect_0 (ref), l_text_0 (ref), l_texture_0 (ref), l_color_0 (ref)
    if not v178.Watermark:get() and v440.user_opacity <= 0 and v440.time_opacity <= 0 then
        return;
    else
        local v441 = l_screen_size_0();
        local v442 = l_vector_0(v441.x - 10, 10);
        local v443 = v178.Design_Background:get();
        local v444 = v178.Design_Font:get();
        local v445 = v178.WatermarkTime:get();
        local l_Font_Light_1 = v122.Font_Light;
        local l_Font_Light_Mini_0 = v122.Font_Light_Mini;
        local l_Font_Regular_1 = v122.Font_Regular;
        local v449 = v178.Design_Blur:get();
        local function v451(v450)
            -- upvalues: l_measure_text_0 (ref), l_Font_Light_1 (ref)
            return l_measure_text_0(l_Font_Light_1, nil, v450).x;
        end;
        local function v453(v452)
            -- upvalues: l_measure_text_0 (ref), l_Font_Regular_1 (ref)
            return l_measure_text_0(l_Font_Regular_1, nil, v452).x;
        end;
        local v454 = l_get_username_0():lower();
        local l_Avatar_0 = v122.Avatar;
        if v178.WatermarkUsername:get() == "Steam" then
            v454 = l_panorama_0.MyPersonaAPI.GetName():lower();
            l_Avatar_0 = l_get_local_player_0() == nil and "not_found" or l_get_local_player_0():get_steam_avatar();
        end;
        local v456 = v451(v454);
        local v457 = v453("omega");
        local v458 = v145.GetBuild():lower();
        local v459 = v451(v458);
        local v460 = 8 + v457 + 15 + 40 + v456 + 7 + v459 + 7;
        local v461 = l_get_icon_0("clock");
        local v462 = v453(v461);
        local v463 = v178.WatermarkTimeMode:get() == "12H" and l_get_date_0("%I:%M %p") or l_get_date_0("%H:%M");
        local v464 = v453(v463);
        local v465 = l_get_date_0("%A");
        local v466 = v451(v465);
        local v467 = 8 + v462 + 15 + v464 + 5 + v466 + 6;
        if v178.WatermarkLock:get() == "Bottom Center" then
            v442 = l_vector_0((v441.x + v460 + (v445 and 7 + v467 or 6)) / 2, v441.y - 35);
        end;
        if v178.Watermark:get() then
            if v440.user_size < v460 then
                v440.user_size = v440.user_size + 4;
            elseif v460 < v440.user_size then
                v440.user_size = v440.user_size - 1;
            end;
            if v440.user_opacity < 1 then
                v440.user_opacity = v440.user_opacity + 0.03;
            elseif v440.user_opacity2 < 1 then
                v440.user_opacity2 = v440.user_opacity2 + 0.01;
            end;
        else
            if v440.user_opacity2 > 0 then
                v440.user_opacity2 = v440.user_opacity2 - 0.02;
            else
                if v440.user_opacity > 0 then
                    v440.user_opacity = v440.user_opacity - 0.03;
                end;
                if v440.user_size > 0 then
                    v440.user_size = v440.user_size - 3;
                end;
            end;
            v445 = false;
        end;
        if v445 then
            if v440.time_size < v467 then
                v440.time_size = v440.time_size + 4;
            end;
            if v440.time_opacity < 1 then
                v440.time_opacity = v440.time_opacity + 0.03;
            elseif v440.time_opacity2 < 1 then
                v440.time_opacity2 = v440.time_opacity2 + 0.01;
            end;
        elseif v440.time_opacity2 > 0 then
            v440.time_opacity2 = v440.time_opacity2 - 0.02;
        else
            if v440.time_opacity > 0 then
                v440.time_opacity = v440.time_opacity - 0.03;
            end;
            if v440.time_size > 0 then
                v440.time_size = v440.time_size - 3;
            end;
        end;
        v442.x = v442.x - v467;
        if v440.time_opacity > 0 then
            local v468 = v440.time_opacity * 255;
            local v469 = v440.time_opacity2 * 255;
            local v470 = (v440.time_size / v467 - 1) * v467 * -1 / 2;
            local v471 = l_vector_0(v442.x + v470, v442.y);
            local v472 = l_vector_0(v471.x + v440.time_size, v471.y + 25);
            if v449 then
                l_blur_0(v471, v472, 5, v468, 5);
            else
                l_rect_0(v471, v472, v443:alpha_modulate(v468), 5);
            end;
            l_blur_0(l_vector_0(v471.x + (8 + v462 + 8), v471.y + 1), v472, 8, v468 / 255, 4);
            v471.x = v471.x + 8;
            l_text_0(l_Font_Regular_1, l_vector_0(v471.x, v471.y + 7), v444:alpha_modulate(v469), nil, v461);
            v471.x = v471.x + v462 + 8 + 7;
            l_text_0(l_Font_Regular_1, l_vector_0(v471.x, v471.y + 7), v444:alpha_modulate(v469), nil, v463);
            v471.x = v471.x + v464 + 4;
            l_text_0(l_Font_Light_1, l_vector_0(v471.x, v471.y + 7), v444:alpha_modulate(v469), nil, v465);
        end;
        v442.x = v442.x - 7 - v460;
        local v473 = v440.user_opacity * 255;
        local v474 = v440.user_opacity2 * 255;
        local v475 = (v440.user_size / v460 - 1) * v460 * -1 / 2 + (v467 - v440.time_size) + (v467 - v440.time_size) / 137 * 6;
        local v476 = l_vector_0(v442.x + v475, v442.y);
        local v477 = l_vector_0(v476.x + v440.user_size, v476.y + 25);
        if v449 then
            l_blur_0(v476, v477, 5, v473, 5);
        else
            l_rect_0(v476, v477, v443:alpha_modulate(v473), 5);
        end;
        l_blur_0(l_vector_0(v476.x + (8 + v457 + 8), v476.y + 1), v477, 8, v473 / 255, 4);
        v476.x = v476.x + 8;
        l_text_0(l_Font_Regular_1, l_vector_0(v476.x, v476.y + 7), v444:alpha_modulate(v474), nil, "omega");
        v476.x = v476.x + v457 + 8 + 7;
        if l_Avatar_0 == "not_found" then
            l_rect_0(l_vector_0(v476.x, v476.y + 5), l_vector_0(v476.x + 15, v476.y + 20), v443:alpha_modulate(v473), 10);
            l_text_0(l_Font_Light_Mini_0, l_vector_0(v476.x + 4, v476.y + 8), v444:alpha_modulate(v474), nil, l_get_icon_0("user"));
        else
            l_texture_0(l_Avatar_0, l_vector_0(v476.x, v476.y + 5), l_vector_0(15, 15), l_color_0(255, 255, 255, v474), nil, 15);
        end;
        v476.x = v476.x + 15 + 7;
        l_text_0(l_Font_Light_1, l_vector_0(v476.x, v476.y + 7), v444:alpha_modulate(v474), nil, v454);
        v476.x = v476.x + v456 + 7;
        l_text_0(l_Font_Regular_1, l_vector_0(v476.x, v476.y + 7), v444:alpha_modulate(0.3 * v474), nil, "/");
        v476.x = v476.x + 3;
        l_text_0(l_Font_Regular_1, l_vector_0(v476.x, v476.y + 7), v444:alpha_modulate(0.6 * v474), nil, "/");
        v476.x = v476.x + 3;
        l_text_0(l_Font_Regular_1, l_vector_0(v476.x, v476.y + 7), v444:alpha_modulate(v474), nil, "/");
        v476.x = v476.x + 10;
        l_text_0(l_Font_Light_1, l_vector_0(v476.x, v476.y + 7), v444:alpha_modulate(v474), nil, v458);
        return;
    end;
end;
local v478 = {
    Opacity = 0, 
    Size = 88, 
    Binds = {}
};
Interface_Keybinds = function()
    -- upvalues: v178 (ref), v478 (ref), l_measure_text_0 (ref), v122 (ref), l_vector_0 (ref), l_blur_0 (ref), l_rect_0 (ref), l_text_0 (ref), l_get_icon_0 (ref), l_ipairs_0 (ref), l_get_alpha_0 (ref), l_pairs_0 (ref), v105 (ref), v438 (ref)
    if not v178.Keybinds:get() then
        if v478.Opacity > 0 then
            v478.Opacity = v478.Opacity - 0.04;
        else
            return;
        end;
    end;
    local v479 = v178.Design_Background:get();
    local v480 = v178.Design_Font:get();
    local v481 = v178.Design_Blur:get();
    local function v483(v482)
        -- upvalues: l_measure_text_0 (ref), v122 (ref)
        return l_measure_text_0(v122.Font_Light_Mini, nil, v482).x;
    end;
    local function v485(v484)
        -- upvalues: l_measure_text_0 (ref), v122 (ref)
        return l_measure_text_0(v122.Font_Regular, nil, v484).x;
    end;
    local v486 = l_vector_0(v178.Keybinds_x:get(), v178.Keybinds_y:get());
    local v487 = l_vector_0(v486.x + v478.Size, v486.y + 25);
    if v481 then
        l_blur_0(v486, v487, 5, v478.Opacity, 5);
    else
        l_rect_0(v486, v487, v479:alpha_modulate(v478.Opacity * 255), 5);
    end;
    l_text_0(v122.Font_Regular, l_vector_0(v486.x + 8, v486.y + 8), v480:alpha_modulate(v478.Opacity * 255), nil, l_get_icon_0("keyboard"));
    local v488 = v485("Keybinds");
    l_text_0(v122.Font_Regular, l_vector_0(v487.x - v488 - 8, v486.y + 8), v480:alpha_modulate(v478.Opacity * 255), nil, "Keybinds");
    local v489 = ui.get_binds();
    for _, v491 in l_ipairs_0(v489) do
        if v478.Binds[v491.name] == nil and v491.active then
            v478.Binds[v491.name] = {
                state = 0, 
                opacity = 0, 
                alt_mode = v491.value ~= true and v491.value ~= false, 
                value = v491.value
            };
        elseif v478.Binds[v491.name] ~= nil then
            v478.Binds[v491.name].value = v491.value;
            if not v491.active and v478.Binds[v491.name].state < 2 then
                v478.Binds[v491.name].state = 2;
            end;
        end;
    end;
    local v492 = "";
    local v493 = 0;
    for v494, v495 in next, v478.Binds do
        if v495.state == 0 and v495.opacity < 1 then
            v478.Binds[v494].opacity = v495.opacity + 0.01;
        elseif v495.state == 0 and v495.opacity >= 1 then
            v478.Binds[v494].state = 1;
        end;
        if v495.state == 2 and v495.opacity > 0 then
            v478.Binds[v494].opacity = v495.opacity - 0.02;
        elseif v495.state == 2 and v495.opacity <= 0 then
            v478.Binds[v494] = nil;
        end;
        if v483(v494) > v483(v492) then
            v492 = v494;
        end;
        v493 = v493 + 1;
    end;
    if v493 > 0 then
        if v478.Size < v483(v492) + 50 then
            v478.Size = v478.Size + 1;
        elseif v478.Size > v483(v492) + 50 then
            v478.Size = v478.Size - 1;
        end;
        if v478.Opacity < 1 then
            v478.Opacity = v478.Opacity + 0.01;
        end;
    else
        if v478.Size > 88 then
            v478.Size = v478.Size - 1;
        end;
        if v478.Opacity < 1 and l_get_alpha_0() == 1 then
            v478.Opacity = v478.Opacity + 0.01;
        elseif v478.Opacity > 0 then
            v478.Opacity = v478.Opacity - 0.04;
        end;
    end;
    local v496 = 2;
    for v497, v498 in l_pairs_0(v478.Binds) do
        l_blur_0(l_vector_0(v486.x, v487.y + v496), l_vector_0(v487.x, v487.y + v496 + 20), 8, v498.opacity * 255, 4);
        l_text_0(v122.Font_Light_Mini, l_vector_0(v486.x + 8, v487.y + v496 + 6), v480:alpha_modulate(v498.opacity * 255), nil, v497);
        if v498.alt_mode then
            local v499 = v483(v498.value);
            l_text_0(v122.Font_Light_Mini, l_vector_0(v487.x - v499 - 8, v487.y + v496 + 6), v480:alpha_modulate(v498.opacity * 255), nil, v498.value);
        else
            local v500 = v483(v498.value and l_get_icon_0("toggle-on") or l_get_icon_0("toggle-off"));
            l_text_0(v122.Font_Light_Mini, l_vector_0(v487.x - v500 - 8, v487.y + v496 + 6), v480:alpha_modulate(v498.opacity * 255), nil, v498.value and l_get_icon_0("toggle-on") or l_get_icon_0("toggle-off"));
        end;
        v496 = v496 + 1 + 20;
    end;
    v105.create(v178.Keybinds_x, v178.Keybinds_y, v478.Size, 25, "Keybinds", false);
    if v105.in_bounds(l_vector_0(v178.Keybinds_x:get(), v178.Keybinds_y:get()), l_vector_0(v178.Keybinds_x:get() + v478.Size, v178.Keybinds_y:get() + 25)) then
        if v478.Opacity > 0.7 and l_get_alpha_0() == 1 then
            v478.Opacity = v478.Opacity - 0.04;
        end;
        v438 = true;
    end;
end;
local v501 = {
    Opacity = 0, 
    Size = 99, 
    Spects = {}
};
Interface_Spectators = function()
    -- upvalues: v178 (ref), v501 (ref), l_measure_text_0 (ref), v122 (ref), l_vector_0 (ref), l_blur_0 (ref), l_rect_0 (ref), l_text_0 (ref), l_get_icon_0 (ref), l_get_local_player_0 (ref), l_get_1 (ref), l_get_alpha_0 (ref), l_pairs_0 (ref), l_texture_0 (ref), l_color_0 (ref), v105 (ref), v478 (ref), v438 (ref)
    if not v178.Spectators:get() then
        if v501.Opacity > 0 then
            v501.Opacity = v501.Opacity - 0.04;
        else
            return;
        end;
    end;
    local v502 = v178.Design_Background:get();
    local v503 = v178.Design_Font:get();
    local v504 = v178.Design_Blur:get();
    local function v506(v505)
        -- upvalues: l_measure_text_0 (ref), v122 (ref)
        return l_measure_text_0(v122.Font_Light_Mini, nil, v505).x;
    end;
    local function v508(v507)
        -- upvalues: l_measure_text_0 (ref), v122 (ref)
        return l_measure_text_0(v122.Font_Regular, nil, v507).x;
    end;
    local v509 = l_vector_0(v178.Spectators_x:get(), v178.Spectators_y:get());
    local v510 = l_vector_0(v509.x + v501.Size, v509.y + 25);
    if v504 then
        l_blur_0(v509, v510, 5, v501.Opacity, 5);
    else
        l_rect_0(v509, v510, v502:alpha_modulate(v501.Opacity * 255), 5);
    end;
    l_text_0(v122.Font_Regular, l_vector_0(v509.x + 8, v509.y + 8), v503:alpha_modulate(v501.Opacity * 255), nil, l_get_icon_0("video"));
    local v511 = v508("Spectators");
    l_text_0(v122.Font_Regular, l_vector_0(v510.x - v511 - 8, v509.y + 8), v503:alpha_modulate(v501.Opacity * 255), nil, "Spectators");
    local v512 = l_get_local_player_0();
    local v513 = {};
    if v512 ~= nil and v512:is_alive() then
        v513 = v512:get_spectators();
    elseif v512 ~= nil then
        local v514 = l_get_1(v512.m_hObserverTarget, true);
        if v514 ~= nil then
            v513 = v514:get_spectators();
        end;
    end;
    local v515 = {};
    if v513 == nil then
        v513 = {};
    end;
    for _, v517 in next, v513 do
        local v518 = v517:get_index();
        v515[v518] = true;
        if v501.Spects[v518] == nil then
            v501.Spects[v518] = {
                state = 0, 
                opacity = 0, 
                name = v517:get_name(), 
                image = v517:get_steam_avatar()
            };
        end;
    end;
    local v519 = "";
    local v520 = 0;
    for v521, v522 in next, v501.Spects do
        if v522.state == 0 and v522.opacity < 1 then
            v501.Spects[v521].opacity = v522.opacity + 0.01;
        elseif v522.state == 0 and v522.opacity >= 1 then
            v501.Spects[v521].state = 1;
        end;
        if v522.state == 1 and v515[v521] == nil then
            v501.Spects[v521].state = 2;
        end;
        if v522.state == 2 and v522.opacity > 0 then
            v501.Spects[v521].opacity = v522.opacity - 0.02;
        elseif v522.state == 2 and v522.opacity <= 0 then
            v501.Spects[v521] = nil;
        end;
        if v506(v522.name) > v506(v519) then
            v519 = v522.name;
        end;
        v520 = v520 + 1;
    end;
    if v520 > 0 then
        local v523 = v506(v519) + 34;
        if v523 < 99 then
            v523 = 99;
        end;
        if v501.Size < v523 then
            v501.Size = v501.Size + 1;
        elseif v523 < v501.Size then
            v501.Size = v501.Size - 1;
        end;
        if v501.Opacity < 1 then
            v501.Opacity = v501.Opacity + 0.01;
        end;
    else
        if v501.Size > 99 then
            v501.Size = v501.Size - 1;
        end;
        if v501.Opacity < 1 and l_get_alpha_0() == 1 then
            v501.Opacity = v501.Opacity + 0.01;
        elseif v501.Opacity > 0 then
            v501.Opacity = v501.Opacity - 0.04;
        end;
    end;
    local v524 = 2;
    for _, v526 in l_pairs_0(v501.Spects) do
        l_blur_0(l_vector_0(v509.x, v510.y + v524), l_vector_0(v510.x, v510.y + v524 + 20), 8, v526.opacity * 255, 4);
        l_texture_0(v526.image, l_vector_0(v509.x + 8, v510.y + v524 + 5), l_vector_0(10, 10), l_color_0(255, 255, 255, v526.opacity * 255), "f", 5);
        l_text_0(v122.Font_Light_Mini, l_vector_0(v509.x + 26, v510.y + v524 + 6), v503:alpha_modulate(v526.opacity * 255), nil, v526.name);
        v524 = v524 + 1 + 20;
    end;
    v105.create(v178.Spectators_x, v178.Spectators_y, v501.Size, 25, "Spectators", false);
    if v105.in_bounds(l_vector_0(v178.Spectators_x:get(), v178.Spectators_y:get()), l_vector_0(v178.Spectators_x:get() + v478.Size, v178.Spectators_y:get() + 25)) then
        if v501.Opacity > 0.7 and l_get_alpha_0() == 1 then
            v501.Opacity = v501.Opacity - 0.04;
        end;
        v438 = true;
    end;
end;
local v527 = {
    Opacity2 = 0, 
    Opacity = 0, 
    Size = 0
};
Interface_Slowdown = function()
    -- upvalues: l_get_local_player_0 (ref), v178 (ref), l_get_alpha_0 (ref), v527 (ref), l_measure_text_0 (ref), v122 (ref), l_vector_0 (ref), l_blur_0 (ref), l_rect_0 (ref), l_text_0 (ref), l_get_icon_0 (ref), l_floor_0 (ref), v105 (ref), v438 (ref)
    local v528 = l_get_local_player_0();
    local v529 = 1;
    if v528 ~= nil and v528:is_alive() then
        v529 = v528:is_alive() and v528.m_flVelocityModifier or 1;
    end;
    if v178.Slowdown:get() and (v529 < 1 or l_get_alpha_0() == 1) then
        if v527.Size < 70 then
            v527.Size = v527.Size + 2;
        end;
        if v527.Opacity < 1 then
            v527.Opacity = v527.Opacity + 0.02;
        elseif v527.Opacity2 < 1 then
            v527.Opacity2 = v527.Opacity2 + 0.02;
        end;
    elseif v527.Opacity2 > 0 then
        v527.Opacity2 = v527.Opacity2 - 0.02;
    else
        if v527.Opacity > 0 then
            v527.Opacity = v527.Opacity - 0.02;
        end;
        if v527.Size > 0 then
            v527.Size = v527.Size - 2;
        end;
    end;
    if not v178.Slowdown:get() and v527.Opacity <= 0 then
        return;
    else
        local v530 = v178.Design_Background:get();
        local v531 = v178.Design_Font:get();
        local v532 = v178.Design_Blur:get();
        local function _(v533)
            -- upvalues: l_measure_text_0 (ref), v122 (ref)
            return l_measure_text_0(v122.Font_Regular, nil, v533).x;
        end;
        local function v536(v535)
            -- upvalues: l_measure_text_0 (ref), v122 (ref)
            return l_measure_text_0(v122.Font_Light, nil, v535).x;
        end;
        local v537 = l_vector_0(v178.Slowdown_x:get() + 70, v178.Slowdown_y:get());
        if v532 then
            l_blur_0(l_vector_0(v537.x - v527.Size, v537.y), l_vector_0(v537.x + v527.Size - 1, v537.y + 40), 5, v527.Opacity, 5);
        else
            l_rect_0(l_vector_0(v537.x - v527.Size, v537.y), l_vector_0(v537.x + v527.Size - 1, v537.y + 40), v530:alpha_modulate(v527.Opacity * 255), 5);
        end;
        l_blur_0(l_vector_0(v537.x - v527.Size * 0.4, v537.y + 1), l_vector_0(v537.x + v527.Size, v537.y + 40), 8, v527.Opacity * 255, 4);
        l_text_0(v122.Font_Regular_Max, l_vector_0(v537.x - 60, v537.y + 13), v531:alpha_modulate(v527.Opacity2 * 255), nil, l_get_icon_0("wind-warning"));
        l_text_0(v122.Font_Regular, l_vector_0(v537.x - 20, v537.y + 9), v531:alpha_modulate(v527.Opacity2 * 255), nil, "slowed");
        local v538 = l_floor_0(v529 * 100) .. "%";
        local v539 = v536(v538);
        l_text_0(v122.Font_Light, l_vector_0(v537.x + (70 - v539 - 8), v537.y + 9), v531:alpha_modulate(v527.Opacity2 * 255), nil, v538);
        l_rect_0(l_vector_0(v537.x - 20, v537.y + 28), l_vector_0(v537.x - 20 + 82 * v529, v537.y + 32), v531:alpha_modulate(v527.Opacity2 * 255), 5);
        v105.create(v178.Slowdown_x, v178.Slowdown_y, 140, 40, "Slowdown");
        if v105.in_bounds(l_vector_0(v178.Slowdown_x:get(), v178.Slowdown_y:get()), l_vector_0(v178.Slowdown_x:get() + 140, v178.Slowdown_y:get() + 40)) then
            if v527.Opacity > 0.7 and l_get_alpha_0() == 1 then
                v527.Opacity = v527.Opacity - 0.04;
            end;
            v438 = true;
        end;
        return;
    end;
end;
local v540 = 0;
local v541 = 0.01;
local v542 = 0.04;
local v543 = 0.02;
local v544 = 0.105;
local v545 = 5;
local v546 = 1;
local v547 = 11;
local v548 = 10;
local v549 = {
    animation_time = 0, 
    animation = -10, 
    Opacity = 0, 
    binds = {}
};
local v550 = {
    bind_info = {}, 
    colors = {}, 
    lerp_values = {}
};
local v551 = {};
for v552 = -10, 10 do
    v551[v552] = {};
    for v553 = 1, v545 do
        local v554 = math.abs(v553 - v552);
        if v554 == 0 then
            v551[v552][v553] = 0;
        elseif v554 == 1 then
            v551[v552][v553] = 0.85;
        elseif v554 == 2 then
            v551[v552][v553] = 0.65;
        elseif v554 == 3 then
            v551[v552][v553] = 0.35;
        else
            v551[v552][v553] = 1;
        end;
    end;
end;
local v555 = {
    DoubleTap = v273.DoubleTap, 
    HideShots = v273.HideShots, 
    Freestanding = v273.Freestanding, 
    FakeDuck = v273.FakeDuck, 
    BodyAim = l_find_1("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    SafePoints = l_find_1("Aimbot", "Ragebot", "Safety", "Safe Points")
};
local function v559(v556, v557)
    -- upvalues: v550 (ref)
    local v558 = v556:to_hex() .. v557:to_hex();
    if not v550.lerp_values[v558] then
        v550.lerp_values[v558] = {
            [0.85] = v556:lerp(v557, 0.85), 
            [0.65] = v556:lerp(v557, 0.65), 
            [0.35] = v556:lerp(v557, 0.35)
        };
    end;
    return v550.lerp_values[v558];
end;
Visuals_Crosshair = function()
    -- upvalues: v178 (ref), v549 (ref), v542 (ref), v559 (ref), v540 (ref), l_screen_size_0 (ref), l_vector_0 (ref), v122 (ref), l_measure_text_0 (ref), v541 (ref), v544 (ref), v551 (ref), v545 (ref), l_text_0 (ref), v548 (ref), l_exploit_0 (ref), l_get_icon_0 (ref), v555 (ref), l_ipairs_0 (ref), v289 (ref), v546 (ref), v543 (ref), v547 (ref), v105 (ref), l_get_alpha_0 (ref), v438 (ref)
    if not v178.Crosshair:get() then
        if v549.Opacity > 0 then
            v549.Opacity = math.max(0, v549.Opacity - v542);
        else
            return;
        end;
    end;
    local v560 = v178.CrosshairMain:get();
    local v561 = v178.CrosshairAccent:get();
    local v562 = v559(v560, v561);
    local v563 = v178.ScopeOverlaySize:get() + v178.ScopeOverlaySpace:get();
    local v564 = v178.ScopeOverlayStyle:get();
    local v565 = v564 ~= "X" and v540 * (v563 + 15) or 0;
    local v566 = v564 == "X" and v540 * (v563 / 2) or 0;
    local v567 = l_screen_size_0().x / 2 - 45 + v565;
    local v568 = l_vector_0(v567 + 45, v178.Crosshair_y:get() + v566);
    local l_Font_Light_Mini_1 = v122.Font_Light_Mini;
    local l_Font_Regular_2 = v122.Font_Regular;
    local function v572(v571)
        -- upvalues: l_measure_text_0 (ref), l_Font_Regular_2 (ref)
        return l_measure_text_0(l_Font_Regular_2, nil, v571).x;
    end;
    local function v574(v573)
        -- upvalues: l_measure_text_0 (ref), l_Font_Light_Mini_1 (ref)
        return l_measure_text_0(l_Font_Light_Mini_1, nil, v573).x;
    end;
    if v549.Opacity < 1 then
        v549.Opacity = math.min(1, v549.Opacity + v541);
    end;
    local l_realtime_1 = globals.realtime;
    if v549.animation_time < l_realtime_1 then
        v549.animation_time = l_realtime_1 + v544;
        v549.animation = v549.animation >= 10 and -10 or v549.animation + 1;
    end;
    local l_animation_0 = v549.animation;
    local v577 = "omega";
    local v578 = {};
    local v579 = v551[l_animation_0];
    local v580 = v561:to_hex();
    local v581 = v560:to_hex();
    for v582 = 1, v545 do
        local v583 = v579[v582];
        local v584 = nil;
        if v583 == 0 then
            v584 = v580;
        elseif v583 == 1 then
            v584 = v581;
        else
            v584 = v562[v583]:to_hex();
        end;
        v578[v582] = "\a" .. v584 .. v577:sub(v582, v582);
    end;
    local v585 = table.concat(v578);
    local l_Opacity_1 = v549.Opacity;
    l_text_0(l_Font_Regular_2, l_vector_0(v568.x - v572("omega") / 2, v568.y), v561:alpha_modulate(l_Opacity_1 * 255), nil, v585);
    local function v590(v587, v588, v589)
        -- upvalues: v549 (ref), v548 (ref)
        if v587 then
            if v549.binds[v588] == nil then
                v549.binds[v588] = {
                    state = 0, 
                    opacity = 0, 
                    margin = v548, 
                    name = v589
                };
            else
                v549.binds[v588].name = v589;
            end;
        elseif v549.binds[v588] ~= nil then
            v549.binds[v588].state = 2;
        end;
    end;
    local v591 = l_exploit_0:get();
    local v592 = "dt";
    if v591 > 0.99 then
        v592 = "dt \a" .. v561:to_hex() .. l_get_icon_0("wave-sine") .. l_get_icon_0("wave-sine") .. l_get_icon_0("wave-sine");
    elseif v591 > 0.66 then
        v592 = "dt \a" .. v561:to_hex() .. l_get_icon_0("wave-sine") .. l_get_icon_0("wave-sine");
    elseif v591 > 0.33 then
        v592 = "dt \a" .. v561:to_hex() .. l_get_icon_0("wave-sine");
    end;
    local l_CrosshairItems_0 = v178.CrosshairItems;
    v590(l_CrosshairItems_0:get(3) and v555.DoubleTap:get(), "dt", v592);
    v590(l_CrosshairItems_0:get(1) and v555.HideShots:get(), "os", "on-shot");
    local v594 = ui.get_binds();
    if l_CrosshairItems_0:get(7) then
        local v595 = nil;
        for _, v597 in l_ipairs_0(v594) do
            if v597.name == "Hit Chance" and v597.active then
                v595 = "hc " .. v597.value;
                break;
            end;
        end;
        v590(v595 ~= nil, "hc", v595);
    end;
    if l_CrosshairItems_0:get(8) then
        local v598 = nil;
        for _, v600 in l_ipairs_0(v594) do
            if v600.name == "Min. Damage" and v600.active then
                v598 = "dmg " .. v600.value;
                break;
            end;
        end;
        v590(v598 ~= nil, "dmg", v598);
    end;
    v590(l_CrosshairItems_0:get(6) and (v555.Freestanding:get() or v289.is_freestanding), "fs", "freestanding");
    local v601 = v555.BodyAim:get() == "Force";
    v590(l_CrosshairItems_0:get(4) and v601, "force_baim", "force baim");
    local v602 = v555.SafePoints:get() == "Force";
    v590(l_CrosshairItems_0:get(5) and v602, "force_safety", "force safety");
    v590(l_CrosshairItems_0:get(2) and v555.FakeDuck:get(), "fd", "fake duck");
    v590(l_CrosshairItems_0:get(9), "aa", v289.condition:lower());
    for v603, v604 in next, v549.binds do
        if v604.state == 0 and v604.opacity < 1 then
            v549.binds[v603].opacity = math.min(1, v604.opacity + v541);
        elseif v604.state == 0 and v604.opacity >= 1 then
            v549.binds[v603].state = 1;
        end;
        if v604.state == 0 and v604.margin > 0 then
            v549.binds[v603].margin = math.max(0, v604.margin - v546);
        elseif v604.state == 2 and v604.margin < v548 then
            v549.binds[v603].margin = math.min(v548, v604.margin + v546);
        end;
        if v604.state == 2 and v604.opacity > 0 then
            v549.binds[v603].opacity = math.max(0, v604.opacity - v543);
        elseif v604.state == 2 and v604.opacity <= 0 then
            v549.binds[v603] = nil;
        end;
    end;
    local v605 = 0;
    local v606 = 14;
    for _, v608 in next, v549.binds do
        local v609 = l_Opacity_1 * v608.opacity;
        l_text_0(l_Font_Light_Mini_1, l_vector_0(v568.x - v574(v608.name) / 2, v568.y + v606 + v608.margin - v605), v560:alpha_modulate(v609 * 255), nil, v608.name);
        v605 = v605 + v608.margin;
        v606 = v606 + v547;
    end;
    v178.Crosshair_x:set(v567);
    v105.create(v178.Crosshair_x, v178.Crosshair_y, 90, v606, "Crosshair", true);
    if v105.in_bounds(l_vector_0(v567, v568.y), l_vector_0(v567 + 90, v568.y + v606)) then
        if v549.Opacity > 0.7 and l_get_alpha_0() == 1 then
            v549.Opacity = math.max(0.7, v549.Opacity - v542);
        end;
        v438 = true;
    end;
end;
Misc_Logs_Aimbot = function(v610)
    -- upvalues: v288 (ref), v178 (ref), v82 (ref), l_color_0 (ref), l_print_raw_0 (ref), l_print_dev_0 (ref)
    if v610.target == nil then
        return;
    else
        v288.Last_Local_Shot = globals.realtime + 0.1;
        if not v178.Logs:get() then
            return;
        else
            local v611 = {
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
            local v612 = v610.target:get_name();
            if #v612 <= 1 then
                v612 = "?";
            end;
            local function v619(v613, v614)
                -- upvalues: v82 (ref), l_color_0 (ref)
                if not v614 then
                    v614 = false;
                end;
                if v613 == nil then
                    return "";
                else
                    local v615 = v82.Main_Color:lerp(v82.Accent_Color, 0.7);
                    local l_Accent_Color_1 = v82.Accent_Color;
                    if v614 then
                        v615 = v82.Tab_Color:lerp(l_color_0(242, 58, 58), 0.7);
                        l_Accent_Color_1 = l_color_0(209, 38, 38);
                    end;
                    local v617 = "";
                    for v618 = 1, #v613 do
                        v617 = v617 .. "\a" .. v615.lerp(v615, l_Accent_Color_1, v618 / #v613):to_hex() .. v613:sub(v618, v618);
                    end;
                    return v617 .. "\a" .. l_color_0(255, 255, 255):to_hex();
                end;
            end;
            if v610.state == nil then
                if v178.LogsAimbot:get({
                    [1] = "Console"
                }) then
                    l_print_raw_0(v619("omega.moe") .. " \226\136\152 hit " .. v612 .. "'s " .. v611[v610.hitgroup] .. " for " .. v610.damage .. " damage [" .. v610.backtrack .. " bt | " .. v610.hitchance .. "% | aimed: " .. v611[v610.wanted_hitgroup] .. "]");
                end;
                if v178.LogsAimbot:get({
                    [1] = "Event"
                }) then
                    l_print_dev_0("hit " .. v612 .. "'s " .. v611[v610.hitgroup] .. " for " .. v610.damage .. " damage [" .. v610.backtrack .. " bt | " .. v610.hitchance .. "% | aimed: " .. v611[v610.wanted_hitgroup] .. "]");
                end;
                if v178.LogsAimbot:get({
                    [1] = "Notify"
                }) then
                    Notify_New("Hit " .. v612 .. "'s " .. v611[v610.hitgroup] .. " for " .. v610.damage .. " damage (" .. v610.hitchance .. "% / " .. v610.backtrack .. " bt)");
                end;
            else
                if v178.LogsAimbot:get({
                    [1] = "Console"
                }) then
                    l_print_raw_0(v619("omega.moe", true) .. " \226\136\152 missed " .. v612 .. "'s " .. v619(v611[v610.wanted_hitgroup], true) .. " due to " .. v619(v610.state, true) .. " [" .. v610.hitchance .. "%]");
                end;
                if v178.LogsAimbot:get({
                    [1] = "Event"
                }) then
                    l_print_dev_0("missed " .. v612 .. "'s " .. v611[v610.wanted_hitgroup] .. " due to " .. v610.state .. " [" .. v610.hitchance .. "%]");
                end;
                if v178.LogsAimbot:get({
                    [1] = "Notify"
                }) then
                    Notify_New("Missed " .. v612 .. "'s " .. v611[v610.wanted_hitgroup] .. " due to " .. v610.state .. " (" .. v610.hitchance .. "%)");
                end;
            end;
            return;
        end;
    end;
end;
Misc_GranadeThrowFix = function(_)
    -- upvalues: v178 (ref), l_get_local_player_0 (ref), l_exploit_0 (ref)
    if not v178.GranadeThrowFix:get() or not globals.is_in_game then
        return;
    else
        local v621 = false;
        local v622 = l_get_local_player_0();
        if v622 ~= nil and v622:is_alive() then
            local v623 = v622:get_player_weapon();
            if v623 ~= nil then
                local v624 = v623:get_weapon_info();
                if v624 ~= nil and v624.weapon_type == 9 then
                    v621 = true;
                end;
            end;
        end;
        if v621 then
            l_exploit_0:allow_defensive(false);
        else
            l_exploit_0:allow_defensive(true);
        end;
        return;
    end;
end;
v178.FakeLatency:set_callback(function(v625)
    -- upvalues: v273 (ref)
    local v626 = v625:get();
    if v626 > 100 then
        cvar.sv_maxunlag:float(0.4);
        v273.FakeLatency:set(v626);
    else
        cvar.sv_maxunlag:float(0.2);
        v273.FakeLatency:set(v626);
    end;
end, true);
Misc_FakeLatency = function()
    -- upvalues: v178 (ref), v273 (ref)
    local v627 = v178.FakeLatency:get();
    if v627 > 100 then
        cvar.sv_maxunlag:float(0.4);
        v273.FakeLatency:set(v627);
    else
        cvar.sv_maxunlag:float(0.2);
        v273.FakeLatency:set(v627);
    end;
end;
Misc_FakeLatency();
local v628 = {
    cache = nil
};
v628.set = function(v629)
    -- upvalues: v628 (ref)
    if v629 ~= v628.cache then
        common.set_clan_tag(v629);
        v628.cache = v629;
    end;
end;
v628.clear = function()
    -- upvalues: v628 (ref)
    if v628.cache ~= nil then
        v628.set("");
    end;
end;
Misc_Clantag = function()
    -- upvalues: v178 (ref), v628 (ref), l_get_local_player_0 (ref), v81 (ref), l_floor_0 (ref), l_sub_0 (ref), l_get_game_rules_0 (ref)
    if not v178.Clantag:get() then
        v628.clear();
        return;
    elseif not l_get_local_player_0() or not globals.is_connected or not globals.is_in_game then
        return;
    elseif v178.ClantagRisin:get() and v81.Dev then
        v628.set("   \208\175i\197\161i\205\183   ");
        return;
    else
        local function v635(v630, v631)
            -- upvalues: l_floor_0 (ref), l_sub_0 (ref)
            local v632 = "               " .. v631 .. "                      ";
            local l_tickinterval_0 = globals.tickinterval;
            local v634 = (globals.tickcount + l_floor_0(utils.net_channel().latency[0] + 0.22 / l_tickinterval_0 + 0.5)) / l_floor_0(0.3 / l_tickinterval_0 + 0.5);
            v634 = v630[l_floor_0(v634 % #v630) + 1] + 1;
            return l_sub_0(v632, v634, v634 + 15);
        end;
        if globals.choked_commands == 0 then
            local v636 = l_get_game_rules_0();
            if v636.m_gamePhase == 5 or v636.m_timeUntilNextPhaseStarts ~= 0 then
                v628.set(v635({
                    [1] = 11
                }, "omega.moe"));
            else
                v628.set(v635({
                    [1] = 0, 
                    [2] = 2, 
                    [3] = 3, 
                    [4] = 4, 
                    [5] = 5, 
                    [6] = 6, 
                    [7] = 7, 
                    [8] = 8, 
                    [9] = 9, 
                    [10] = 9, 
                    [11] = 10, 
                    [12] = 11, 
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
                }, "omega.moe"));
            end;
        end;
        return;
    end;
end;
v178.Clantag:set_callback(Misc_Clantag);
Misc_Trashtalk = function(v637)
    -- upvalues: v178 (ref), l_get_local_player_0 (ref), l_get_1 (ref), v229 (ref), l_execute_after_0 (ref), l_console_exec_0 (ref), l_random_0 (ref)
    if not v178.Trashtalk:get() then
        return;
    else
        local v638 = {
            [1] = "\203\156\226\128\157\194\176\226\128\162.\203\156\226\128\157\194\176\226\128\162 cosinus hvh tutorials at dsc.gg/getomega \226\128\162\194\176\226\128\157\203\156.\226\128\162\194\176\226\128\157\203\156", 
            [2] = "\240\157\150\135\240\157\150\138\240\157\150\153\240\157\150\153\240\157\150\138\240\157\150\151 \240\157\150\136\240\157\150\141\240\157\150\134\240\157\150\147\240\157\150\140\240\157\150\138 \240\157\150\149\240\157\150\145\240\157\150\134\240\157\150\158\240\157\150\152\240\157\150\153\240\157\150\158\240\157\150\145\240\157\150\138 \240\157\150\155\240\157\150\138\240\157\150\151\240\157\150\152\240\157\150\154\240\157\150\152 \240\157\150\146\240\157\150\138 \240\157\150\137\240\157\150\154\240\157\150\146\240\157\150\135\240\157\150\134\240\157\150\152\240\157\150\152", 
            [3] = "1 ~ \240\157\150\152\240\157\150\149\240\157\150\148\240\157\150\147\240\157\150\152\240\157\150\148\240\157\150\151\240\157\150\138\240\157\150\137 \240\157\150\135\240\157\150\158 \240\157\150\148\240\157\150\146\240\157\150\138\240\157\150\140\240\157\150\134.\240\157\150\146\240\157\150\148\240\157\150\138", 
            [4] = "\203\156\" \194\176 \226\128\162 .\203\156 \"\194\176 \226\128\162 1 \226\128\162 \194\176\" \203\156. \226\128\162 \194\176 \"\203\156", 
            [5] = "\240\157\151\176\240\157\152\134\240\157\151\174@\240\157\151\186\240\157\151\178\240\157\151\177\240\157\151\182\240\157\151\174", 
            [6] = "\240\157\149\161\240\157\149\160\240\157\149\168\240\157\149\150\240\157\149\163\240\157\149\150\240\157\149\149 \240\157\149\147\240\157\149\170 \240\157\149\160\240\157\149\158\240\157\149\150\240\157\149\152\240\157\149\146.\240\157\149\158\240\157\149\160\240\157\149\150", 
            [7] = "lemme guess correction miss ahahhaha --> \240\157\147\184\240\157\147\182\240\157\147\174\240\157\147\176\240\157\147\170.\240\157\147\182\240\157\147\184\240\157\147\174", 
            [8] = "\226\153\155 \240\157\149\154 \240\157\149\165\240\157\149\153\240\157\149\154\240\157\149\159\240\157\149\156 \240\157\149\165\240\157\149\153\240\157\149\146\240\157\149\165 \240\157\149\168\240\157\149\146\240\157\149\164 \240\157\149\147\240\157\149\146\240\157\149\149 \240\157\149\149\240\157\149\150\240\157\149\148\240\157\149\154\240\157\149\164\240\157\149\154\240\157\149\160\240\157\149\159", 
            [9] = "\239\188\175\239\189\151\239\189\142\239\189\133\239\189\132 \240\157\147\171\240\157\148\130 \240\157\147\184\240\157\147\182\240\157\147\174\240\157\147\176\240\157\147\170.\240\157\147\182\240\157\147\184\240\157\147\174", 
            [10] = "\240\157\150\151\240\157\150\138\240\157\150\152\240\157\150\148\240\157\150\145\240\157\150\155\240\157\150\138\240\157\150\137 \240\157\150\145\240\157\150\142\240\157\150\144\240\157\150\138 \240\157\150\153\240\157\150\141\240\157\150\134\240\157\150\153??", 
            [11] = "(\227\129\163\226\151\148\226\151\161\226\151\148)\227\129\163 \226\153\165 LMAO you wanna say you paid for that \226\153\165??", 
            [12] = "\240\157\153\157\240\157\153\154\240\157\153\150\240\157\153\153\240\157\153\168\240\157\153\157\240\157\153\164\240\157\153\169 \240\157\153\154\240\157\153\175 \240\157\153\151\240\157\153\164\240\157\153\169", 
            [13] = "\240\157\144\128\240\157\144\135\240\157\144\128\240\157\144\135\240\157\144\128\240\157\144\135\240\157\144\135\240\157\144\128\240\157\144\135\240\157\144\128\240\157\144\135 \240\157\144\171\240\157\144\158\240\157\144\173\240\157\144\154\240\157\144\171\240\157\144\157", 
            [14] = "\226\128\139\240\159\135\174\226\128\139\226\128\139\240\159\135\191\226\128\139\226\128\139\240\159\135\174\226\128\139 \226\128\139\240\159\135\167\226\128\139\226\128\139\240\159\135\180\226\128\139\226\128\139\240\159\135\185\226\128\139", 
            [15] = "\226\153\165 Overwhelmed by the colossal might of omega.moe \226\153\165", 
            [16] = "A wild guess, correction miss: \240\157\147\184\240\157\147\182\240\157\147\174\240\157\147\176\240\157\147\170.\240\157\147\182\240\157\147\184\240\157\147\174", 
            [17] = "\203\156\226\128\157\194\176\226\128\162.\203\156\226\128\157\194\176\226\128\162 Delve into the enigmatic omega.moe world at dsc.gg/getomega \226\128\162\194\176\226\128\157\203\156.\226\128\162\194\176\226\128\157\203\156", 
            [18] = "lemme guess, omega.moe is the solution.", 
            [19] = "\240\157\149\174\240\157\150\134\240\157\150\147 \240\157\150\158\240\157\150\148\240\157\150\154 \240\157\150\135\240\157\150\138\240\157\150\145\240\157\150\142\240\157\150\138\240\157\150\155\240\157\150\138 \240\157\150\158\240\157\150\148\240\157\150\154 \240\157\150\149\240\157\150\134\240\157\150\142\240\157\150\137 \240\157\150\139\240\157\150\148\240\157\150\151 \240\157\150\153\240\157\150\141\240\157\150\134\240\157\150\153?", 
            [20] = "\240\157\149\141\240\157\149\146\240\157\149\159\240\157\149\162\240\157\149\166\240\157\149\154\240\157\149\164\240\157\149\153\240\157\149\150\240\157\149\149 \240\157\149\147\240\157\149\170 \240\157\149\165\240\157\149\153\240\157\149\150 \240\157\149\154\240\157\149\158\240\157\149\158\240\157\149\150\240\157\149\159\240\157\149\164\240\157\149\150 \240\157\149\161\240\157\149\160\240\157\149\168\240\157\149\150\240\157\149\163 \240\157\149\160\240\157\149\151 \240\157\149\160\240\157\149\158\240\157\149\150\240\157\149\152\240\157\149\146.\240\157\149\158\240\157\149\160\240\157\149\150", 
            [21] = "\226\128\139\240\159\135\188\226\128\139\226\128\139\240\159\135\173\226\128\139\226\128\139\240\159\135\190\226\128\139 \226\128\139\240\159\135\179\226\128\139\226\128\139\240\159\135\180\226\128\139 \226\128\139\240\159\135\173\226\128\139\226\128\139\240\159\135\170\226\128\139\226\128\139\240\159\135\166\226\128\139\226\128\139\240\159\135\169\226\128\139\226\128\139\240\159\135\184\226\128\139\226\128\139\240\159\135\173\226\128\139\226\128\139\240\159\135\180\226\128\139\226\128\139\240\159\135\185\226\128\139 \226\128\139\240\159\135\167\226\128\139\226\128\139\240\159\135\183\226\128\139\226\128\139\240\159\135\180\226\128\139 \226\128\139\240\159\135\178\226\128\139\226\128\139\240\159\135\166\226\128\139\226\128\139\240\159\135\190\226\128\139\226\128\139\240\159\135\167\226\128\139\226\128\139\240\159\135\170\226\128\139 \226\128\139\240\159\135\184\226\128\139\226\128\139\240\159\135\188\226\128\139\226\128\139\240\159\135\174\226\128\139\226\128\139\240\159\135\185\226\128\139\226\128\139\240\159\135\168\226\128\139\226\128\139\240\159\135\173\226\128\139 \226\128\139\240\159\135\185\226\128\139\226\128\139\240\159\135\180\226\128\139 \226\128\139\240\159\135\180\226\128\139\226\128\139\240\159\135\178\226\128\139\226\128\139\240\159\135\170\226\128\139\226\128\139\240\159\135\172\226\128\139\226\128\139\240\159\135\166\226\128\139", 
            [22] = "\240\157\152\180\240\157\152\170\240\157\152\181... \240\157\152\176\240\157\152\174\240\157\152\166\240\157\152\168\240\157\152\162'\240\157\152\180 \240\157\152\181\240\157\152\170\240\157\152\174\240\157\152\166 \240\157\152\181\240\157\152\176 \240\157\152\177\240\157\152\173\240\157\152\162\240\157\152\186", 
            [23] = "\239\189\130\239\189\129\239\189\146\239\189\139 \239\189\134\239\189\143\239\189\146 \239\189\141\239\189\133 \239\189\140\239\189\143\239\189\147\239\189\133\239\189\146", 
            [24] = "\240\157\148\161\240\157\148\172\240\157\148\171'\240\157\148\177 \240\157\148\177\240\157\148\175\240\157\148\182 \240\157\148\177\240\157\148\172 \240\157\148\160\240\157\148\172\240\157\148\173\240\157\148\182 \240\157\148\170\240\157\148\182 \240\157\148\173\240\157\148\169\240\157\148\158\240\157\148\182\240\157\148\176\240\157\148\177\240\157\148\182\240\157\148\169\240\157\148\162 \240\157\148\166\240\157\148\170 \240\157\148\178\240\157\148\176\240\157\148\166\240\157\148\171\240\157\148\164 \240\157\148\172\240\157\148\170\240\157\148\162\240\157\148\164\240\157\148\158.\240\157\148\170\240\157\148\172\240\157\148\162", 
            [25] = "\225\180\190\225\180\188\225\181\130\225\180\177\225\180\191\225\180\177\225\180\176 \225\180\174\202\184 \225\180\188\225\180\185\225\180\177\225\180\179\225\180\172.\225\180\185\225\180\188\225\180\177", 
            [26] = "\240\157\144\160\240\157\144\168\240\157\144\157 \240\157\144\155\240\157\144\165\240\157\144\158\240\157\144\172\240\157\144\172 \240\157\144\168\240\157\144\166\240\157\144\158\240\157\144\160\240\157\144\154.\240\157\144\166\240\157\144\168\240\157\144\158 \240\157\144\159\240\157\144\168\240\157\144\171 \240\157\144\160\240\157\144\162\240\157\144\175\240\157\144\162\240\157\144\167\240\157\144\160 \240\157\144\166\240\157\144\158 \240\157\144\169\240\157\144\168\240\157\144\176\240\157\144\158\240\157\144\171 \240\157\144\173\240\157\144\168 \240\157\144\159\240\157\144\174\240\157\144\156\240\157\144\164 \240\157\144\178\240\157\144\168\240\157\144\174 \240\157\144\165\240\157\144\162\240\157\144\164\240\157\144\158 \240\157\144\173\240\157\144\161\240\157\144\154\240\157\144\173", 
            [27] = "\240\159\132\188\240\159\132\184\240\159\133\130\240\159\133\130\240\159\132\180\240\159\132\179 \240\159\132\179\240\159\133\132\240\159\132\180 \240\159\133\131\240\159\132\190 \240\159\132\190\240\159\132\188\240\159\132\180\240\159\132\182\240\159\132\176", 
            [28] = "\239\188\145 \239\189\143\239\189\141\239\189\133\239\189\135\239\189\129\239\189\147\239\189\148\239\189\153\239\189\140\239\189\133", 
            [29] = "\240\157\151\186\240\157\151\174\240\157\151\184\240\157\151\178 \240\157\151\185\240\157\151\174\240\157\152\128\240\157\152\129 \240\157\152\132\240\157\151\182\240\157\152\128\240\157\151\181 \240\157\151\175\240\157\151\178\240\157\151\176\240\157\151\174\240\157\152\130\240\157\152\128\240\157\151\178 \240\157\151\187\240\157\151\178\240\157\152\133\240\157\152\129 \240\157\151\191\240\157\151\188\240\157\152\130\240\157\151\187\240\157\151\177 \240\157\152\134\240\157\151\188\240\157\152\130 \240\157\152\132\240\157\151\182\240\157\151\185\240\157\151\185 \240\157\151\179\240\157\151\174\240\157\151\185\240\157\151\185 \240\157\152\128\240\157\151\174\240\157\151\186\240\157\151\178 \240\157\152\132\240\157\151\174\240\157\152\134", 
            [30] = "\240\157\147\155\240\157\147\156\240\157\147\144\240\157\147\158", 
            [31] = "\239\188\175\239\189\141\239\189\133\239\189\135\239\189\129 \239\189\137\239\189\142 \239\189\141\239\189\153 \239\189\130\239\189\140\239\189\143\239\189\143\239\189\132 \239\188\158\239\185\143\239\188\156", 
            [32] = "\240\157\149\134\240\157\149\168\226\132\149\226\132\149\240\157\149\150\240\157\149\149 \240\157\149\147\240\157\149\170 \240\157\149\153\240\157\149\167\240\157\149\153 \240\157\149\158\240\157\149\146\240\157\149\164\240\157\149\165\240\157\149\150\240\157\149\163", 
            [33] = "\225\180\133\225\180\143\201\180'\225\180\155 \225\180\132\202\128\202\143 \201\162\225\180\135\225\180\155 \225\180\143\225\180\141\225\180\135\201\162\225\180\128 \201\170\201\180\234\156\177\225\180\155\225\180\135\225\180\128\225\180\133", 
            [34] = "\239\188\162\239\188\175\239\188\173\239\188\162\239\188\169\239\188\174\239\188\167 \239\188\179\239\188\180\239\188\161\239\188\178\239\188\180\239\188\165\239\188\164", 
            [35] = "wAiT WhAt HoW i MiSs ThaT \240\159\164\147 <-- is that you right now???", 
            [36] = "\239\188\174\239\189\137\239\189\131\239\189\133 \239\188\180\239\189\146\239\189\153\239\188\140 \239\188\175\239\189\141\239\189\133\239\189\135\239\189\129 \239\189\147\239\189\148\239\189\137\239\189\140\239\189\140 \239\189\130\239\189\133\239\189\148\239\189\148\239\189\133\239\189\146", 
            [37] = "\208\165\208\190\209\128\208\190\209\136\208\176\209\143 \208\191\208\190\208\191\209\139\209\130\208\186\208\176, \208\189\208\176\209\135\208\189\208\184 \209\129\208\189\208\176\209\135\208\176\208\187\208\176 - omega.moe", 
            [38] = "\208\187\208\181\208\182\208\176\209\130\209\140 \208\189\208\176 \208\183\208\181\208\188\208\187\208\181 \209\129\208\190\208\177\208\176\208\186\208\176", 
            [39] = "sit the fuck down bitch", 
            [40] = "\208\145\209\131\208\185\208\189\208\190 \208\147\208\190\208\187\208\190\208\178\208\176", 
            [41] = "\240\157\147\178\240\157\147\182\240\157\147\170\240\157\147\176\240\157\147\178\240\157\147\183\240\157\147\174 \240\157\147\190\240\157\147\188\240\157\147\178\240\157\147\183\240\157\147\176 \240\157\147\183\240\157\147\174\240\157\147\191\240\157\147\174\240\157\147\187\240\157\147\181\240\157\147\184\240\157\147\188\240\157\147\174 \240\157\148\128\240\157\147\178\240\157\147\189\240\157\147\177\240\157\147\184\240\157\147\190\240\157\147\189 \240\157\147\184\240\157\147\182\240\157\147\174\240\157\147\176\240\157\147\170.\240\157\147\182\240\157\147\184\240\157\147\174", 
            [42] = "\226\128\139\240\159\135\184\226\128\139\226\128\139\240\159\135\185\226\128\139\226\128\139\240\159\135\171\226\128\139\226\128\139\240\159\135\186\226\128\139 \226\128\139\240\159\135\183\226\128\139\226\128\139\240\159\135\170\226\128\139\226\128\139\240\159\135\185\226\128\139\226\128\139\240\159\135\166\226\128\139\226\128\139\240\159\135\183\226\128\139\226\128\139\240\159\135\169\226\128\139 \226\128\139\240\159\135\180\226\128\139\226\128\139\240\159\135\178\226\128\139\226\128\139\240\159\135\170\226\128\139\226\128\139\240\159\135\172\226\128\139\226\128\139\240\159\135\166\226\128\139.\226\128\139\240\159\135\178\226\128\139\226\128\139\240\159\135\180\226\128\139\226\128\139\240\159\135\170\226\128\139 \226\128\139\240\159\135\180\226\128\139\226\128\139\240\159\135\188\226\128\139\226\128\139\240\159\135\179\226\128\139\226\128\139\240\159\135\169\226\128\139 \226\128\139\240\159\135\190\226\128\139\226\128\139\240\159\135\180\226\128\139\226\128\139\240\159\135\186\226\128\139 \226\128\139\240\159\135\177\226\128\139\226\128\139\240\159\135\180\226\128\139\226\128\139\240\159\135\184\226\128\139\226\128\139\240\159\135\170\226\128\139\226\128\139\240\159\135\183\226\128\139", 
            [43] = "AHAHAHHAHAH retard", 
            [44] = "wanna be like me\226\128\139? get omega.moe", 
            [45] = "custom resolver\226\128\139? nooo its omega bro", 
            [46] = "every time i see you DEAD your aa so shit <--- OMEGA.MOE is the fix", 
            [47] = "there is no such a thing as luck when playing against me with omega.moe", 
            [48] = "need help? omega therapy is the solution for you dumbass", 
            [49] = "I love O.. not Olivia but OMEGA.MOE"
        };
        local v639 = l_get_local_player_0();
        local v640 = l_get_1(v637.userid, true);
        local v641 = l_get_1(v637.attacker, true);
        if v639 == nil or v640 == nil or v641 == nil or v641 ~= v639 or v640 == v639 then
            return;
        else
            if v229.Kills == 777 then
                l_execute_after_0(1, function()
                    -- upvalues: l_console_exec_0 (ref)
                    l_console_exec_0("say X0IxRy0w");
                end);
            end;
            l_execute_after_0(1, function()
                -- upvalues: l_console_exec_0 (ref), v638 (ref), l_random_0 (ref)
                l_console_exec_0("say " .. v638[l_random_0(1, #v638)]);
            end);
            return;
        end;
    end;
end;
Misc_Viewmodel = function()
    -- upvalues: v178 (ref)
    if v178.Viewmodel:get() then
        cvar.viewmodel_fov:float(v178.Viewmodel_Fov:get(), true);
        cvar.viewmodel_offset_x:float(v178.Viewmodel_X:get(), true);
        cvar.viewmodel_offset_y:float(v178.Viewmodel_Y:get(), true);
        cvar.viewmodel_offset_z:float(v178.Viewmodel_Z:get(), true);
    else
        cvar.viewmodel_fov:float(60);
        cvar.viewmodel_offset_x:float(1);
        cvar.viewmodel_offset_y:float(1);
        cvar.viewmodel_offset_z:float(-1.7);
    end;
end;
Misc_Viewmodel_Destroy = function()
    cvar.viewmodel_fov:float(60);
    cvar.viewmodel_offset_x:float(1);
    cvar.viewmodel_offset_y:float(1);
    cvar.viewmodel_offset_z:float(-1.7);
end;
Misc_Viewmodel();
v178.Viewmodel:set_callback(Misc_Viewmodel);
v178.Viewmodel_Fov:set_callback(Misc_Viewmodel);
v178.Viewmodel_X:set_callback(Misc_Viewmodel);
v178.Viewmodel_Y:set_callback(Misc_Viewmodel);
v178.Viewmodel_Z:set_callback(Misc_Viewmodel);
Misc_AspectRatio = function()
    -- upvalues: v178 (ref)
    if v178.AspectRatio:get() then
        cvar.r_aspectratio:float(v178.AspectRatio_Value:get() / 100);
    else
        cvar.r_aspectratio:float(0);
    end;
end;
Misc_AspectRatio_Destroy = function()
    cvar.r_aspectratio:float(0);
end;
Misc_AspectRatio();
v178.AspectRatio:set_callback(Misc_AspectRatio);
v178.AspectRatio_Value:set_callback(Misc_AspectRatio);
local v642 = {
    active = false
};
v642.is_active = function()
    -- upvalues: v642 (ref), v178 (ref), l_get_local_player_0 (ref)
    v642.active = false;
    if not v178.Movement:get({
        [1] = "Super Toss"
    }) then
        return;
    else
        local v643 = l_get_local_player_0();
        if v643 == nil or not v643:is_alive() or v643.m_MoveType == 8 then
            return;
        else
            local v644 = v643:get_player_weapon();
            if v644 == nil then
                return;
            else
                local v645 = v644:get_weapon_info();
                if v645 == nil or v645.weapon_type ~= 9 then
                    return;
                else
                    v642.active = true;
                    return;
                end;
            end;
        end;
    end;
end;
v642.last_angles = l_vector_0(0, 0, 0);
v642.target_angles = l_vector_0(0, 0, 0);
v642.pre_render = function()
    -- upvalues: v642 (ref), l_camera_angles_0 (ref), l_is_in_thirdperson_0 (ref)
    v642.is_active();
    v642.last_angles = l_camera_angles_0();
    if v642.active and not l_is_in_thirdperson_0() then
        l_camera_angles_0(v642.target_angles);
    end;
end;
v642.override_view = function(v646)
    -- upvalues: v642 (ref), l_camera_angles_0 (ref)
    if v642.active then
        v646.view = v642.last_angles;
        l_camera_angles_0(v642.last_angles);
    end;
end;
Movement_QuickLadder = function(v647)
    -- upvalues: v178 (ref), l_get_local_player_0 (ref), l_camera_angles_0 (ref)
    if not v178.Movement:get({
        [1] = "Quick Ladder"
    }) then
        return;
    else
        local v648 = l_get_local_player_0();
        if not v648 then
            return;
        elseif not v648:get_anim_state().on_ladder then
            return;
        else
            local v649 = l_camera_angles_0();
            if v647.forwardmove > 0 then
                if v649.x < 45 then
                    v647.view_angles.x = 89;
                    v647.view_angles.y = v647.view_angles.y + 89;
                    v647.in_moveright = 1;
                    v647.in_moveleft = 0;
                    v647.in_forward = 0;
                    v647.in_back = 1;
                    if v647.sidemove == 0 then
                        v647.move_yaw = v647.move_yaw + 90;
                    end;
                    if v647.sidemove < 0 then
                        v647.move_yaw = v647.move_yaw + 150;
                    end;
                    if v647.sidemove > 0 then
                        v647.move_yaw = v647.move_yaw + 30;
                    end;
                end;
            else
                v647.view_angles.x = 89;
                v647.view_angles.y = v647.view_angles.y + 89;
                v647.in_moveright = 1;
                v647.in_moveleft = 0;
                v647.in_forward = 1;
                v647.in_back = 0;
                if v647.sidemove == 0 then
                    v647.move_yaw = v647.move_yaw + 90;
                end;
                if v647.sidemove > 0 then
                    v647.move_yaw = v647.move_yaw + 150;
                end;
                if v647.sidemove < 0 then
                    v647.move_yaw = v647.move_yaw + 30;
                end;
            end;
            return;
        end;
    end;
end;
local v650 = {};
local v651 = {};
for v652 = 0, 360 do
    local v653 = math.rad(v652);
    v650[v652] = math.sin(v653);
    v651[v652] = math.cos(v653);
end;
Movement_AvoidCollisions = function(v654)
    -- upvalues: v178 (ref), l_get_local_player_0 (ref), l_camera_angles_0 (ref), v651 (ref), v650 (ref), l_trace_line_0 (ref), l_vector_0 (ref)
    if not v178.Movement:get({
        [1] = "Avoid Collisions"
    }) then
        return;
    else
        local v655 = l_get_local_player_0();
        if not v655 then
            return;
        elseif v655.m_vecVelocity:length() < 5 then
            return;
        else
            local v656 = v178.Movement_AvoidDistance:get();
            local l_y_0 = l_camera_angles_0().y;
            local l_m_vecOrigin_0 = v655.m_vecOrigin;
            local l_x_0 = l_m_vecOrigin_0.x;
            local l_y_1 = l_m_vecOrigin_0.y;
            local v661 = l_m_vecOrigin_0.z + 60;
            local v662 = l_y_0 - 90;
            local v663 = 25 + v656;
            local l_huge_0 = math.huge;
            local v665 = 90;
            local v666 = 70;
            local v667 = 10;
            local l_huge_1 = math.huge;
            local v669 = 90;
            for v670 = 0, 180, v667 do
                local v671 = (v662 + v670) % 360;
                v671 = math.floor(v671);
                if v671 < 0 then
                    local v672 = v671 + 360;
                    if v672 then
                        v671 = v672;
                    end;
                end;
                local v673 = l_x_0 + v651[v671] * v666;
                local v674 = l_y_1 + v650[v671] * v666;
                local v675 = l_m_vecOrigin_0:dist(l_trace_line_0(l_m_vecOrigin_0, l_vector_0(v673, v674, v661), nil, nil, 1).end_pos);
                if v675 < l_huge_1 then
                    l_huge_1 = v675;
                    v669 = v670;
                end;
            end;
            if l_huge_1 < v663 + 20 then
                for v676 = math.max(0, v669 - v667), math.min(180, v669 + v667), 2 do
                    local v677 = (v662 + v676) % 360;
                    v677 = math.floor(v677);
                    if v677 < 0 then
                        local v678 = v677 + 360;
                        if v678 then
                            v677 = v678;
                        end;
                    end;
                    local v679 = l_x_0 + v651[v677] * v666;
                    local v680 = l_y_1 + v650[v677] * v666;
                    local v681 = l_m_vecOrigin_0:dist(l_trace_line_0(l_m_vecOrigin_0, l_vector_0(v679, v680, v661), nil, nil, 1).end_pos);
                    if v681 < l_huge_0 then
                        l_huge_0 = v681;
                        v665 = v676;
                    end;
                end;
            else
                l_huge_0 = l_huge_1;
                v665 = v669;
            end;
            if l_huge_0 < v663 and v654.in_jump and not v654.in_moveright and not v654.in_moveleft and not v654.in_back then
                local v682 = v655.m_vecVelocity:length();
                local v683 = math.rad(v665);
                local v684 = math.cos(v683);
                local v685 = math.sin(v683);
                local v686 = math.abs(v682 * v684);
                local v687 = nil;
                if math.abs(v665 - 90) < 40 then
                    v687 = v682 * v685 * (v663 - l_huge_0) / 15;
                else
                    v687 = v682 * v685;
                end;
                v654.forwardmove = v686;
                local v688;
                if v665 < 90 or not v687 then
                    v688 = -v687;
                else
                    v688 = v687;
                end;
                v654.sidemove = v688;
            end;
            return;
        end;
    end;
end;
Movement_NoFallDamage = function(v689)
    -- upvalues: v178 (ref), l_get_local_player_0 (ref), l_trace_line_0 (ref), l_vector_0 (ref), l_band_0 (ref)
    if not v178.Movement:get({
        [1] = "No Fall Damage"
    }) then
        return;
    else
        local v690 = l_get_local_player_0();
        if not v690 then
            return;
        else
            local l_m_vecVelocity_0 = v690.m_vecVelocity;
            local l_m_vecOrigin_1 = v690.m_vecOrigin;
            local v693 = l_trace_line_0(l_m_vecOrigin_1, l_vector_0(l_m_vecOrigin_1.x, l_m_vecOrigin_1.y, l_m_vecOrigin_1.z - 500), nil, nil, 1);
            if l_m_vecOrigin_1.z - v693.end_pos.z <= 70 and l_m_vecOrigin_1.z - v693.end_pos.z >= 12 and l_band_0(v690.m_fFlags, 1) == 0 and l_m_vecVelocity_0.z < -450 then
                v689.in_duck = true;
            end;
            return;
        end;
    end;
end;
Movement_SuperToss = function(v694)
    -- upvalues: v642 (ref), l_get_local_player_0 (ref), l_cast_0 (ref), l_vector_0 (ref), l_cos_0 (ref), l_sin_0 (ref), l_abs_0 (ref), l_clamp_0 (ref)
    if not v642.active then
        return;
    else
        local v695 = l_get_local_player_0();
        if not v695 then
            return;
        else
            local v696 = v695:get_player_weapon();
            if not v696 then
                return;
            else
                local v697 = v696:get_weapon_info();
                if not v697 or not v696.m_flThrowStrength then
                    return;
                else
                    local v698 = l_cast_0("uintptr_t", v695[0]);
                    local function v700(v699)
                        -- upvalues: l_vector_0 (ref), l_cos_0 (ref), l_sin_0 (ref)
                        return l_vector_0(l_cos_0(v699.x * math.pi / 180) * l_cos_0(v699.y * math.pi / 180), l_cos_0(v699.x * math.pi / 180) * l_sin_0(v699.y * math.pi / 180), -l_sin_0(v699.x * math.pi / 180));
                    end;
                    local v701 = l_vector_0(v694.view_angles.x, v694.view_angles.y, 0);
                    v701.x = v701.x - (90 - l_abs_0(v701.x)) * 10 / 90;
                    v701 = v700(v701);
                    local v702 = l_clamp_0(v696.m_flThrowStrength, 0, 1);
                    local v703 = l_clamp_0(v697.throw_velocity * 0.9, 15, 750) * (v702 * 0.7 + 0.3);
                    local v704 = l_cast_0("Vector_t*", v698 + 148)[0];
                    v704 = l_vector_0(v704.x, v704.y, v704.z);
                    local v705 = (v701 * v703 + v704 * 1.45):angles();
                    local v706 = v694.view_angles.y - v705.y;
                    while v706 > 180 do
                        v706 = v706 - 360;
                    end;
                    while v706 < -180 do
                        v706 = v706 + 360;
                    end;
                    local v707 = v694.view_angles.x - v705.x - 10;
                    while v707 > 90 do
                        v707 = v707 - 45;
                    end;
                    while v707 < -90 do
                        v707 = v707 + 45;
                    end;
                    v642.target_angles.y = v694.view_angles.y + v706;
                    v694.view_angles.y = v694.view_angles.y + v706;
                    v642.target_angles.x = l_clamp_0(v694.view_angles.x + v707, -89, 89);
                    v694.view_angles.x = l_clamp_0(v694.view_angles.x + v707, -89, 89);
                    return;
                end;
            end;
        end;
    end;
end;
Misc_LegacySounds = function(v708)
    -- upvalues: v178 (ref), l_get_local_player_0 (ref), l_get_1 (ref), l_gsub_0 (ref), l_console_exec_0 (ref)
    if not v178.LegacySounds:get() or l_get_local_player_0() == nil or l_get_1(v708.userid, true) == nil then
        return;
    else
        cvar.snd_setmixer:call("AllWeapons", "vol", 0);
        local v709 = l_get_local_player_0();
        local v710 = l_get_1(v708.userid, true);
        if v710:get_player_weapon() == nil then
            return;
        else
            local l_weapon_name_0 = v710:get_player_weapon():get_weapon_info().weapon_name;
            if l_weapon_name_0 == nil then
                return;
            else
                l_weapon_name_0 = l_gsub_0(l_weapon_name_0, "weapon_", "");
                local v712 = v178.LegacySoundsMode:get();
                local v713 = v178.LegacySoundsVolume:get() / 100;
                if v710 == v709 then
                    if l_weapon_name_0 == "awp" and v178.LegacySoundsCustom:get({
                        [1] = "Punchy AWP"
                    }) then
                        v713 = v713 + 0.1;
                        l_console_exec_0("playvol /omega/punchy-awp.wav " .. v713);
                    elseif l_weapon_name_0 == "awp" then
                        l_console_exec_0("playvol weapons/" .. l_weapon_name_0 .. "/" .. l_weapon_name_0 .. "1.wav " .. v713);
                    elseif l_weapon_name_0 == "scar20" or l_weapon_name_0 == "usp" then
                        l_console_exec_0("playvol weapons/" .. l_weapon_name_0 .. "/" .. l_weapon_name_0 .. "_unsil-1.wav " .. v713);
                    else
                        l_console_exec_0("playvol weapons/" .. l_weapon_name_0 .. "/" .. l_weapon_name_0 .. "-1.wav " .. v713);
                    end;
                elseif v712 == "All Players" then
                    local v714 = v713 - 0.1;
                    if l_weapon_name_0 == "awp" then
                        l_console_exec_0("playvol weapons/" .. l_weapon_name_0 .. "/" .. l_weapon_name_0 .. "1-distant.wav " .. v714);
                    elseif l_weapon_name_0 == "scar20" or l_weapon_name_0 == "usp" then
                        l_console_exec_0("playvol weapons/" .. l_weapon_name_0 .. "/" .. l_weapon_name_0 .. "_unsil-1-distant.wav " .. v714);
                    else
                        l_console_exec_0("playvol weapons/" .. l_weapon_name_0 .. "/" .. l_weapon_name_0 .. "-1-distant.wav " .. v714);
                    end;
                end;
                cvar.snd_setmixer:call("AllWeapons", "vol", 1);
                return;
            end;
        end;
    end;
end;
local v715 = {
    backup = false, 
    origin = l_vector_0(0, 0, 0)
};
Visuals_Dlight = function()
    -- upvalues: v178 (ref), l_get_local_player_0 (ref), v273 (ref), v715 (ref), l_floor_0 (ref), v94 (ref), v93 (ref), v95 (ref)
    if not v178.Dlight:get() then
        return;
    else
        local v716 = l_get_local_player_0();
        if v716 == nil or not v716:is_alive() then
            return;
        else
            local v717 = v716:get_origin();
            local v718 = v178.DlightMode:get();
            if v718 == "Auto Peek" and v273.PeekAssist:get() then
                if not v715.backup then
                    v715.backup = true;
                    v715.origin = {
                        x = l_floor_0(v717.x), 
                        y = l_floor_0(v717.y), 
                        z = l_floor_0(v717.z)
                    };
                end;
                if v715.backup then
                    v717 = v715.origin;
                end;
            elseif v718 == "Auto Peek" and not v273.PeekAssist:get() then
                if v715.backup then
                    v715.backup = false;
                end;
                return;
            elseif v718 == "Always + Auto Peek" and v273.PeekAssist:get() then
                if not v715.backup then
                    v715.backup = true;
                    v715.origin = {
                        x = l_floor_0(v717.x), 
                        y = l_floor_0(v717.y), 
                        z = l_floor_0(v717.z)
                    };
                end;
                if v715.backup then
                    v717 = v715.origin;
                end;
            elseif v718 == "Always + Auto Peek" and not v273.PeekAssist:get() and v715.backup then
                v715.backup = false;
            end;
            local v719 = v178.DlightColor:get();
            v719 = {
                r = v719.r, 
                g = v719.g, 
                b = v719.b
            };
            local v720 = {
                RadiusD = 125, 
                PosZ = 5, 
                RadiusE = 155
            };
            v717 = {
                x = l_floor_0(v717.x), 
                y = l_floor_0(v717.y), 
                z = l_floor_0(v717.z) + v720.PosZ
            };
            local v721 = v94(v93, v716:get_index());
            v721.key = v716:get_index();
            v721.color = v719;
            v721.color.exponent = 5;
            v721.flags = 2;
            v721.style = 1;
            v721.direction = v717;
            v721.origin = v717;
            v721.radius = v720.RadiusD;
            v721.die = globals.curtime + 0.1;
            v721.decay = 10;
            local v722 = v95(v93, v716:get_index());
            v722.key = v716:get_index();
            v722.color = v719;
            v722.color.exponent = 5;
            v722.flags = 0;
            v722.style = 1;
            v722.direction = v717;
            v722.origin = v717;
            v722.radius = v720.RadiusE;
            v722.die = globals.curtime + 0.1;
            v722.decay = 10;
            return;
        end;
    end;
end;
local v723 = {
    kill = 0, 
    opacity = 0, 
    kill_tick = globals.tickcount, 
    Ssequence = Assets_Load_Image("./nl/omega/killmarkers/1.gif", l_vector_0(100, 100))
};
Visuals_Hitmarkers = function(v724)
    -- upvalues: v178 (ref), v97 (ref), v96 (ref), v104 (ref), v723 (ref), l_vector_0 (ref)
    if not v178.Hitmarkers:get() or v724.target == nil or v724.state ~= nil then
        return;
    else
        if v178.HitmarkersTesla:get() then
            local v725 = v178.HitmarkersTeslaColor:get();
            v97.m_vPos.x = v724.aim.x;
            v97.m_vPos.y = v724.aim.y;
            v97.m_vPos.z = v724.aim.z;
            v97.m_vAngles.x = 1;
            v97.m_vAngles.y = 1;
            v97.m_vAngles.z = 1;
            v97.m_nEntIndex = 0;
            v97.m_pszSpriteName = "sprites/bubble.vmt";
            v97.m_flBeamWidth = 1;
            v97.m_vColor.x = v725.r / 255;
            v97.m_vColor.y = v725.g / 255;
            v97.m_vColor.z = v725.b / 255;
            v97.m_flTimeVisible = 1;
            v97.m_flRadius = 100;
            v97.m_nBeams = 6;
            v96(v97);
        end;
        if v178.HitmarkersSparks:get() then
            v104.sparks(v724.aim, 5, 5);
        end;
        if v178.HitmarkersChinese:get() and not v724.target:is_alive() then
            v723.kill = v723.kill + 1 > 6 and 6 or v723.kill + 1;
            v723.kill_tick = globals.tickcount + 256;
            v723.opacity = 0;
            v723.sequence = Assets_Load_Image("./nl/omega/killmarkers/" .. v723.kill .. ".gif", l_vector_0(100, 100));
        end;
        return;
    end;
end;
Visuals_Hitmarkers_Render = function()
    -- upvalues: v178 (ref), v723 (ref), l_floor_0 (ref), l_screen_size_0 (ref), l_color_0 (ref), l_texture_0 (ref), l_vector_0 (ref)
    if not v178.Hitmarkers:get() or not v178.HitmarkersChinese:get() then
        return;
    elseif v723.kill == 0 or v723.kill_tick < globals.tickcount then
        return;
    else
        local v726 = v723.kill_tick - globals.tickcount;
        local l_opacity_0 = v723.opacity;
        if v726 > 43 then
            if l_opacity_0 < 1 then
                v723.opacity = l_opacity_0 + 0.01;
            end;
        elseif l_opacity_0 > 0 then
            v723.opacity = l_opacity_0 - 0.01;
        end;
        local v728 = l_floor_0((256 - v726) * 0.75);
        local v729 = l_screen_size_0();
        local v730 = 45 + v728;
        local v731 = v178.HitmarkersChineseColor:get();
        local v732 = l_color_0(v731.r, v731.g, v731.b, v731.a * l_opacity_0);
        l_texture_0(v723.sequence, l_vector_0(v729.x / 2 - v730 / 2, v729.y / 3 - v730 / 2), l_vector_0(v730, v730), v732);
        return;
    end;
end;
Visuals_Hitmarkers_Reset = function()
    -- upvalues: v723 (ref)
    v723.kill = 0;
    v723.kill_tick = globals.tickcount;
end;
Visuals_ScopeOverlay = function()
    -- upvalues: v178 (ref), v273 (ref), l_get_local_player_0 (ref), v540 (ref), l_screen_size_0 (ref), l_color_0 (ref), l_gradient_0 (ref), l_vector_0 (ref), l_push_rotation_0 (ref), l_pop_rotation_0 (ref)
    if not v178.ScopeOverlay:get() then
        return;
    else
        v273.ScopeOverlay:override("Remove All");
        local v733 = l_get_local_player_0();
        if v733 == nil or not v733:is_alive() then
            return;
        else
            local l_m_bIsScoped_0 = v733.m_bIsScoped;
            if l_m_bIsScoped_0 and v540 < 1 then
                if v540 < 0.5 then
                    v540 = v540 + (0.05 - 0.04 * (1 - v540 / 0.5));
                else
                    v540 = v540 + (0.01 + 0.04 * ((v540 - 0.5) / 0.5));
                end;
            elseif not l_m_bIsScoped_0 and v540 > 0 then
                if v540 < 0.5 then
                    v540 = v540 - (0.05 - 0.04 * (1 - v540 / 0.5));
                else
                    v540 = v540 - (0.01 + 0.04 * ((v540 - 0.5) / 0.5));
                end;
            end;
            if v540 <= 0 then
                return;
            else
                local v735 = l_screen_size_0();
                local v736 = v178.ScopeOverlayColor:get();
                local v737 = l_color_0(v736.r, v736.g, v736.b, v540 * v736.a);
                local v738 = l_color_0(v736.r, v736.g, v736.b, 0);
                local v739 = v178.ScopeOverlaySize:get();
                local v740 = v178.ScopeOverlaySpace:get();
                local v741 = v178.ScopeOverlayStyle:get();
                if v741 == "Default" then
                    local v742 = v735.x / 2;
                    local v743 = v735.y / 2;
                    l_gradient_0(l_vector_0(v742 - v740, v743 - 0.75), l_vector_0(v742 - v739, v743 + 0.75), v737, v738, v737, v738);
                    l_gradient_0(l_vector_0(v742 + v740, v743 - 0.75), l_vector_0(v742 + v739, v743 + 0.75), v737, v738, v737, v738);
                    l_gradient_0(l_vector_0(v742 - 0.75, v743 - v740), l_vector_0(v742 + 0.75, v743 - v739), v737, v737, v738, v738);
                    l_gradient_0(l_vector_0(v742 - 0.75, v743 + v740), l_vector_0(v742 + 0.75, v743 + v739), v737, v737, v738, v738);
                elseif v741 == "T" then
                    local v744 = v735.x / 2;
                    local v745 = v735.y / 2;
                    l_gradient_0(l_vector_0(v744 - v740, v745 - 0.75), l_vector_0(v744 - v739, v745 + 0.75), v737, v738, v737, v738);
                    l_gradient_0(l_vector_0(v744 + v740, v745 - 0.75), l_vector_0(v744 + v739, v745 + 0.75), v737, v738, v737, v738);
                    l_gradient_0(l_vector_0(v744 - 0.75, v745 + v740), l_vector_0(v744 + 0.75, v745 + v739), v737, v737, v738, v738);
                elseif v741 == "X" then
                    local v746 = v735.x / 2;
                    local v747 = v735.y / 2;
                    l_push_rotation_0(45);
                    l_gradient_0(l_vector_0(v746 - v740, v747 - 0.25), l_vector_0(v746 - v739, v747 + 0.25), v737, v738, v737, v738);
                    l_gradient_0(l_vector_0(v746 + v740, v747 - 0.25), l_vector_0(v746 + v739, v747 + 0.25), v737, v738, v737, v738);
                    l_gradient_0(l_vector_0(v746 - 0.75, v747 - v740), l_vector_0(v746 + 0.75, v747 - v739), v737, v737, v738, v738);
                    l_gradient_0(l_vector_0(v746 - 0.75, v747 + v740), l_vector_0(v746 + 0.75, v747 + v739), v737, v737, v738, v738);
                    l_pop_rotation_0();
                end;
                return;
            end;
        end;
    end;
end;
Visuals_ScopeOverlay_Smooth = function(v748)
    -- upvalues: v178 (ref), v273 (ref), v540 (ref)
    if not v178.ScopeOverlay:get() or not v178.ScopeOverlaySmoothScope:get() then
        return;
    else
        local v749 = v273.FieldOfView:get();
        local v750 = v273.OverrideZoom:get() / 100;
        local v751 = v540 < 0 and 0 or v540;
        local l_v749_0 = v749;
        if v751 > 0 then
            l_v749_0 = l_v749_0 - l_v749_0 * v751 * v750;
        end;
        v748.fov = l_v749_0;
        return;
    end;
end;
local v753 = nil;
Misc_NicknameChangerDestroy = function()
    -- upvalues: v753 (ref)
    if v753 ~= nil then
        common.set_name(v753);
        v753 = nil;
    end;
end;
Misc_NicknameChanger = function()
    -- upvalues: v178 (ref), v753 (ref), l_panorama_0 (ref)
    local v754 = v178.NicknameChanger:get();
    local v755 = v178.NicknameChanger_Username:get();
    if not v754 or v755 == "" then
        Misc_NicknameChangerDestroy();
        return;
    else
        v753 = l_panorama_0.MyPersonaAPI.GetName();
        common.set_name(v755);
        return;
    end;
end;
v178.NicknameChanger:set_callback(Misc_NicknameChanger, true);
local l_realtime_2 = globals.realtime;
Shared_Send = function()
    -- upvalues: l_get_local_player_0 (ref), l_realtime_2 (ref), v81 (ref)
    local v757 = l_get_local_player_0();
    if not v757 or not globals.is_in_game then
        return;
    elseif l_realtime_2 > globals.realtime then
        return;
    else
        l_realtime_2 = globals.realtime + 2.5;
        if v81.Dev then
            v757:set_icon("https://static." .. v81.Api .. "/neverlose/icon/dev.png");
        elseif v81.Nightly then
            v757:set_icon("https://static." .. v81.Api .. "/neverlose/icon/nightly.png");
        else
            v757:set_icon("https://static." .. v81.Api .. "/neverlose/icon/live.png");
        end;
        events.voice_message:call(function(v758)
            -- upvalues: v81 (ref)
            v758:write_bits(33153, 16);
            if v81.Dev then
                v758:write_bits(1000000001, 32);
            elseif v81.Nightly then
                v758:write_bits(1000110001, 32);
            else
                v758:write_bits(1010110101, 32);
            end;
        end);
        return;
    end;
end;
Shared_Receive = function(v759)
    -- upvalues: v81 (ref)
    if v759.buffer:read_bits(16) ~= 33153 or v759.entity == nil then
        return;
    else
        local v760 = v759.buffer:read_bits(32);
        if v760 == 101 then
            v759.entity:set_icon("");
        elseif v760 == 1000000001 then
            v759.entity:set_icon("https://static." .. v81.Api .. "/neverlose/icon/dev.png");
        elseif v760 == 1000110001 then
            v759.entity:set_icon("https://static." .. v81.Api .. "/neverlose/icon/nightly.png");
        elseif v760 == 1010110101 then
            v759.entity:set_icon("https://static." .. v81.Api .. "/neverlose/icon/live.png");
        end;
        return;
    end;
end;
Shared_Destroy = function()
    -- upvalues: l_get_local_player_0 (ref), l_get_players_0 (ref), l_ipairs_0 (ref)
    local v761 = l_get_local_player_0();
    if not v761 then
        return;
    else
        v761:set_icon("");
        events.voice_message:call(function(v762)
            v762:write_bits(33153, 16);
            v762:write_bits(101, 32);
        end);
        local v763 = l_get_players_0();
        for _, v765 in l_ipairs_0(v763) do
            if v765:is_player() then
                v765:set_icon("");
            end;
        end;
        return;
    end;
end;
Nightly_AirLag = function()
    -- upvalues: v178 (ref), v273 (ref), l_exploit_0 (ref), l_get_local_player_0 (ref), l_band_0 (ref), l_random_0 (ref)
    if not v178.AirLag:get() then
        return;
    elseif not v273.DoubleTap:get() or l_exploit_0:get() ~= 1 or not l_get_local_player_0() or l_band_0(l_get_local_player_0().m_fFlags, 1) ~= 0 then
        return;
    else
        v273.DoubleTapLag:override(l_random_0(0, 1) == 1 and "Disabled" or "Always On");
        return;
    end;
end;
local v766 = 32;
Nightly_Teleport = function()
    -- upvalues: v178 (ref), l_get_local_player_0 (ref), v273 (ref), l_band_0 (ref), v766 (ref), l_get_threat_0 (ref), l_trace_bullet_0 (ref), l_exploit_0 (ref)
    if not v178.Teleport:get() then
        return;
    else
        local v767 = l_get_local_player_0();
        if not v767 or not v273.DoubleTap:get() or v273.HideShots:get() then
            return;
        elseif v178.TeleportDisablers:get({
            [1] = "Ground"
        }) and l_band_0(v767.m_fFlags, 1) ~= 0 then
            v766 = 32;
            return;
        else
            if v178.TeleportDisablers:get({
                [1] = "Knife / Zeus"
            }) then
                local l_weapon_name_1 = v767:get_player_weapon():get_weapon_info().weapon_name;
                if l_weapon_name_1 ~= nil and (l_weapon_name_1 == "weapon_knife" or l_weapon_name_1 == "weapon_taser") then
                    v766 = 32;
                    return;
                end;
            end;
            if v178.TeleportDisablers:get({
                [1] = "Low Velocity"
            }) and v767.m_vecVelocity:length() < 50 then
                v766 = 32;
                return;
            else
                if v178.TeleportTriggers:get({
                    [1] = "On-Key"
                }) and v178.TeleportKey:get() then
                    v766 = 0;
                end;
                if v178.TeleportTriggers:get({
                    [1] = "Vulnerable"
                }) then
                    local v769 = l_get_threat_0();
                    if v767:is_alive() and v769 ~= nil and not v769:is_dormant() then
                        local v770, v771 = l_trace_bullet_0(v769, v769:get_eye_position(), v767:get_eye_position());
                        if v770 > 0 and v771.entity == v767 then
                            v766 = 0;
                        end;
                    end;
                end;
                local v772 = v178.TeleportHold:get();
                if v178.TeleportTriggers:get({
                    [1] = "Vulnerable Prediction"
                }) then
                    local v773 = l_get_threat_0();
                    if v767:is_alive() and v773 ~= nil and not v773:is_dormant() then
                        local v774 = v767:simulate_movement();
                        local v775 = v773:simulate_movement();
                        v774:think(v772);
                        v775:think(v772);
                        local v776, v777 = l_trace_bullet_0(v773, v775.origin, v774.origin);
                        if v776 > 0 and v777.entity == v767 then
                            v766 = 0;
                        end;
                    end;
                end;
                if v766 < v772 then
                    v766 = v766 + 1;
                    l_exploit_0:force_teleport();
                    if v766 > v772 - 2 and v178.TeleportRecharge:get() then
                        l_exploit_0:force_charge();
                    end;
                end;
                return;
            end;
        end;
    end;
end;
local function v786(v778, v779)
    -- upvalues: l_get_local_player_0 (ref), l_vector_0 (ref), l_deg_0 (ref), l_atan2_0 (ref), l_sqrt_0 (ref)
    local v780 = l_get_local_player_0();
    if not v780 then
        return;
    else
        local v781 = l_vector_0(0, 0, 0);
        local v782 = l_vector_0(0, 0, 0);
        if not v779.x then
            v782 = v778;
            v781 = v780:get_eye_position();
            if not v781 then
                return;
            end;
        else
            v781 = v778;
            v782 = v779;
        end;
        local v783 = v782 - v781;
        if v783.x == 0 and v783.y == 0 then
            return v783.z > 0 and 270 or 90, 0;
        else
            local v784 = l_deg_0(l_atan2_0(v783.y, v783.x));
            local v785 = l_sqrt_0(v783.x * v783.x + v783.y * v783.y);
            return l_deg_0(l_atan2_0(-v783.z, v785)), v784;
        end;
    end;
end;
local v787 = {
    found = false, 
    move = false, 
    segments_debug = {}
};
local function v807()
    -- upvalues: v178 (ref), v787 (ref), l_get_local_player_0 (ref), l_find_1 (ref), l_get_threat_0 (ref), l_camera_angles_0 (ref), l_vector_0 (ref), l_trace_line_0 (ref), l_trace_bullet_0 (ref), l_min_0 (ref)
    if not v178.AiPeek:get() or not v178.AiPeek_Bind:get() then
        v787.found = false;
        v787.target_vec = nil;
        return;
    else
        local v788 = l_get_local_player_0();
        if not v788 or not v788:is_alive() then
            return;
        elseif v787.found or v787.move then
            return;
        else
            local v789 = l_find_1("Aimbot", "Ragebot", "Selection", "Min. Damage"):get();
            if v789 > 50 then
                v789 = 50;
            end;
            local v790 = v178.AiPeek_Prediction:get();
            local v791 = v178.AiPeek_PredictionTicks:get();
            local _ = v178.AiPeek_Debug:get();
            local v793 = v178.AiPeek_Radius:get();
            local v794 = v178.AiPeek_Segments:get();
            local v795 = l_get_threat_0();
            if not v795 or v795:is_dormant() or not v795:is_alive() or v795.m_iHealth <= 0 then
                return;
            else
                local v796 = l_camera_angles_0();
                local l_start_vec_0 = v787.start_vec;
                local v798 = v795:get_origin();
                if v790 then
                    local v799 = v795:simulate_movement();
                    v799:think(v791);
                    v798 = v799.origin;
                end;
                local v800 = {
                    damage = 0
                };
                local v801 = {};
                for v802 = 0, 360, 360 / v794 do
                    local v803 = l_start_vec_0 + l_vector_0(0, 0, 0):angles(l_vector_0(0, 90 + v796.y + v802, 0)) * v793;
                    local v804 = l_trace_line_0(l_start_vec_0, v803, v788, 1174421507);
                    if not v804.entity or not v804.entity:get_classname() == "CWorld" then
                        v801[#v801 + 1] = v803;
                        local v805, _ = l_trace_bullet_0(v788, v803, v798);
                        if v800.damage < v805 then
                            v800.damage = v805;
                            v800.enemy = v795;
                            v800.enemy_origin = v803;
                        end;
                    end;
                end;
                v787.segments_debug = v801;
                if not v800.enemy or v800.damage == 0 then
                    return;
                elseif v800.damage < l_min_0(v789, v800.enemy.m_iHealth) then
                    return;
                else
                    v787.found = true;
                    v787.target_vec = v800.enemy_origin;
                    return;
                end;
            end;
        end;
    end;
end;
local function v808()
    -- upvalues: v787 (ref)
    v787.found = false;
    v787.target_vec = nil;
end;
local function v814(v809, v810)
    -- upvalues: l_get_local_player_0 (ref), v786 (ref)
    local l_m_vecAbsOrigin_0 = l_get_local_player_0().m_vecAbsOrigin;
    local _, v813 = v786(l_m_vecAbsOrigin_0, v810);
    v809.in_forward = 1;
    v809.in_back = 0;
    v809.in_moveleft = 0;
    v809.in_moveright = 0;
    v809.in_speed = 0;
    v809.forwardmove = 800;
    v809.sidemove = 0;
    v809.move_yaw = v813;
end;
Nightly_AiPeekMove = function(v815)
    -- upvalues: v178 (ref), l_get_local_player_0 (ref), v273 (ref), v787 (ref), l_abs_0 (ref), l_band_0 (ref), v814 (ref)
    if not v178.AiPeek:get() then
        return;
    else
        local v816 = l_get_local_player_0();
        if not v816 then
            return;
        else
            v273.PeekAssist:override();
            v273.Freestanding:override();
            if not v816:is_alive() then
                return;
            else
                local _ = v815.in_forward == 1;
                local _ = v815.in_back == 1;
                local _ = v815.in_moveleft == 1;
                local _ = v815.in_moveright == 1;
                if v178.AiPeek_Bind:get() then
                    local v821 = v816:get_player_weapon();
                    if not v821 then
                        return;
                    else
                        local l_curtime_0 = globals.curtime;
                        local v823 = v816.m_flNextAttack <= l_curtime_0 and v821.m_flNextPrimaryAttack <= l_curtime_0;
                        local v824 = v816:get_origin();
                        if not v787.start_vec then
                            v787.start_vec = v824;
                        end;
                        v273.PeekAssist:override(true);
                        v273.Freestanding:override(true);
                        if not v787.found then
                            v787.move = false;
                            return;
                        else
                            if l_abs_0(v824.x - v787.start_vec.x) <= 10 then
                                v787.move = true;
                            end;
                            if not v823 or l_band_0(v816.m_fFlags, 1) == 0 then
                                v787.move = false;
                                v787.found = false;
                                v787.target_vec = false;
                            end;
                            if v787.move then
                                v814(v815, v787.target_vec);
                            end;
                            return;
                        end;
                    end;
                else
                    v787.move = false;
                    v787.found = false;
                    v787.target_vec = false;
                    v787.start_vec = nil;
                    return;
                end;
            end;
        end;
    end;
end;
Nightly_AiPeekRender = function()
    -- upvalues: v178 (ref), v787 (ref), l_color_0 (ref)
    if not v178.AiPeek:get() or not v178.AiPeek_Bind:get() or not v178.AiPeek_Debug:get() then
        return;
    else
        local l_segments_debug_0 = v787.segments_debug;
        if #l_segments_debug_0 > 0 then
            for v826 = 0, #l_segments_debug_0 do
                render.circle_3d(l_segments_debug_0[v826], l_color_0(255, 255, 255), 5, 0, 1, 1);
            end;
        end;
        if v787.target_vec then
            render.circle_3d(v787.target_vec, l_color_0(255, 0, 0), 5, 0, 1, 1);
        end;
        return;
    end;
end;
Nightly_AimTools = function()
    -- upvalues: v178 (ref), l_find_1 (ref), l_get_local_player_0 (ref), l_get_threat_0 (ref), l_band_0 (ref)
    if not v178.AimTools:get() then
        return;
    else
        local v827 = l_find_1("Aimbot", "Ragebot", "Safety", "Body Aim");
        local v828 = l_find_1("Aimbot", "Ragebot", "Safety", "Safe Points");
        local v829 = l_find_1("Aimbot", "Ragebot", "Selection", "Multipoint", "Head Scale");
        local v830 = l_find_1("Aimbot", "Ragebot", "Selection", "Multipoint", "Body Scale");
        v827:override();
        v828:override();
        v829:override();
        v830:override();
        local v831 = l_get_local_player_0();
        if not v831 or not v831:is_alive() then
            return;
        else
            local v832 = l_get_threat_0();
            if not v832 or not v832:is_alive() or v832.m_iHealth <= 0 then
                return;
            else
                local v833 = v831:get_player_weapon();
                if not v833 then
                    return;
                else
                    local v834 = v833:get_weapon_info();
                    if not v834 then
                        return;
                    else
                        local v835 = {
                            weapon_glock = "Pistols", 
                            weapon_p250 = "Pistols", 
                            weapon_elite = "Pistols", 
                            weapon_hkp2000 = "Pistols", 
                            weapon_fiveseven = "Pistols", 
                            weapon_scar20 = "Auto Snipers", 
                            weapon_g3sg1 = "Auto Snipers", 
                            weapon_awp = "AWP", 
                            weapon_ssg08 = "SSG-08", 
                            weapon_deagle = "Heavy Pistols", 
                            weapon_tec9 = "Pistols"
                        };
                        if v835[v834.weapon_name] == nil or not v178.AimTools_Weapons[v835[v834.weapon_name]].Enable:get() then
                            return;
                        else
                            local v836 = v178.AimTools_Weapons[v835[v834.weapon_name]];
                            if v836.Safety:get({
                                [1] = "Lethal"
                            }) and v834.damage > v832.m_iHealth then
                                if v834.damage / 2 > v832.m_iHealth then
                                    v827:override("Force");
                                    v828:override("Prefer");
                                else
                                    v827:override("Prefer");
                                    v828:override("Prefer");
                                end;
                            end;
                            local v837 = v831:get_origin().z - v832:get_origin().z;
                            if v836.Safety:get({
                                [1] = "Height Advantage"
                            }) and v837 <= -10 then
                                v828:override("Prefer");
                            end;
                            if v836.Safety:get({
                                [1] = "Height Advantage"
                            }) and v837 >= 40 then
                                if v834.damage > v832.m_iHealth then
                                    v827:override("Prefer");
                                    v828:override("Default");
                                else
                                    v827:override("Default");
                                    v828:override("Default");
                                end;
                            end;
                            if v836.Conditionals:get() then
                                local v838 = "General";
                                local l_m_fFlags_1 = v832.m_fFlags;
                                local v840 = l_band_0(l_m_fFlags_1, 1);
                                local v841 = l_band_0(l_m_fFlags_1, 2);
                                if v840 == 0 and v841 ~= 0 then
                                    v838 = "Air Crouch";
                                elseif v840 == 0 then
                                    v838 = "Air";
                                elseif v841 ~= 0 then
                                    v838 = "Crouch";
                                end;
                                local v842 = v836.Conditions[v838];
                                v829:override(v842.Head:get());
                                v830:override(v842.Body:get());
                            end;
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
local v843 = {
    discord_error = false, 
    error_logged = false, 
    last_error_log = -1, 
    network_ratelimit = 5
};
v843.error_logger = function()
    -- upvalues: l_floor_0 (ref), v843 (ref)
    local v844 = l_floor_0(globals.realtime);
    if v843.error_logged and v843.last_error_log + v843.network_ratelimit < v844 then
        v843.error_logged = false;
    end;
end;
v843.log_error = function(v845)
    -- upvalues: v843 (ref), l_print_raw_0 (ref), l_print_dev_0 (ref), l_console_exec_0 (ref)
    local v846 = v845:gsub("\a.{6}", "");
    if not v843.discord_error then
        v843.discord_error = true;
    end;
    if not v843.error_logged then
        v843.error_logged = true;
        v843.last_error_log = globals.realtime;
        l_print_raw_0(v846);
        l_print_dev_0(v846);
        l_console_exec_0("play resource\\warning.wav");
    end;
end;
local function v853(v847, v848, v849)
    -- upvalues: v843 (ref)
    return function(...)
        -- upvalues: v849 (ref), v847 (ref), v848 (ref), v843 (ref)
        local l_status_0, l_result_0 = pcall(v849, ...);
        if not l_status_0 then
            local v852 = v847 .. " : " .. l_result_0:gsub(".{6}", "");
            if v848 then
                v843.log_error(v852);
            end;
            return false, v852;
        else
            return l_result_0, l_status_0;
        end;
    end;
end;
v843.register = function(v854, v855, v856)
    -- upvalues: v853 (ref)
    events[v854]:set(v853(v855, true, v856));
end;
v843.register("render", "menu_animate", Menu_Animate);
v843.register("render", "notify", Notify_Render);
v843.register("shutdown", "antiaim_sec", function()
    -- upvalues: v289 (ref)
    v289:security();
end);
v843.register("round_start", "antiaim_roundstart", function()
    -- upvalues: v289 (ref)
    v289:round_start();
end);
v843.register("createmove", "antiaim_handler", function(v857)
    -- upvalues: v289 (ref)
    v289:handler(v857);
end);
v843.register("post_update_clientside_animation", "antiaim_anim_breakers", function(v858)
    -- upvalues: v289 (ref)
    v289:anim_breakers(v858);
end);
v843.register("bullet_impact", "antiaim_antibruteforce_impact", function(v859)
    -- upvalues: v289 (ref)
    v289:anti_bruteforce_impact(v859);
end);
v843.register("createmove", "misc_granade_throw_fix", Misc_GranadeThrowFix);
v843.register("aim_ack", "misc_logs_aimbot", Misc_Logs_Aimbot);
v843.register("render", "misc_clantag", Misc_Clantag);
v843.register("shutdown", "misc_clantag_destroy", v628.clear);
v843.register("round_prestart", "misc_clantag_destroy", v628.clear);
v843.register("start_halftime", "misc_clantag_destroy", v628.clear);
v843.register("player_death", "misc_trashtalk", Misc_Trashtalk);
v843.register("shutdown", "misc_viewmodel", Misc_Viewmodel_Destroy);
v843.register("shutdown", "misc_aspectratio", Misc_AspectRatio_Destroy);
v843.register("createmove", "movement_quickladder", Movement_QuickLadder);
v843.register("createmove", "movement_avoidcollisions", Movement_AvoidCollisions);
v843.register("createmove", "movement_nofalldamage", Movement_NoFallDamage);
v843.register("createmove", "movement_supertoss", Movement_SuperToss);
v843.register("pre_render", "movement_st_pre", v642.pre_render);
v843.register("override_view", "movement_st_view", v642.override_view);
v843.register("bullet_impact", "misc_legacysounds", Misc_LegacySounds);
v843.register("level_init", "misc_nicknamechanger", Misc_NicknameChanger);
v843.register("shutdown", "misc_nicknamechanger", Misc_NicknameChangerDestroy);
v843.register("level_init", "misc_fakelatency", Misc_FakeLatency);
v843.register("render", "interface_watermark", Interface_Watermark);
v843.register("render", "interface_keybinds", Interface_Keybinds);
v843.register("render", "interface_spectators", Interface_Spectators);
v843.register("render", "interface_slowdown", Interface_Slowdown);
v843.register("createmove", "visuals_interface_disable", Interface_Disable);
v843.register("render", "visuals_crosshair", Visuals_Crosshair);
v843.register("render", "visuals_dlight", Visuals_Dlight);
v843.register("aim_ack", "visuals_hitmarkers", Visuals_Hitmarkers);
v843.register("render", "visuals_hitmarkers_render", Visuals_Hitmarkers_Render);
v843.register("round_start", "visuals_hitmarkers_reset", Visuals_Hitmarkers_Reset);
v843.register("render", "visuals_scopeoverlay", Visuals_ScopeOverlay);
v843.register("override_view", "visuals_scopeoverlay_smoothscope", Visuals_ScopeOverlay_Smooth);
v843.register("render", "nightly_airlag", Nightly_AirLag);
v843.register("createmove", "nightly_teleport", Nightly_Teleport);
v843.register("render", "shared_send", Shared_Send);
v843.register("voice_message", "shared_receive", Shared_Receive);
v843.register("shutdown", "shared_destroy", Shared_Destroy);
v843.register("aim_ack", "performance_aim", Performance_Aim);
v843.register("render", "nightly_aipeek_render", Nightly_AiPeekRender);
v843.register("createmove", "nightly_aipeek_move", Nightly_AiPeekMove);
v843.register("createmove_run", "nightly_aipeek_select", v807);
v843.register("aim_fire", "nightly_aipeek_fire", v808);
v843.register("createmove", "nightly_aimtools", Nightly_AimTools);