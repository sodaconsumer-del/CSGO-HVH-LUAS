local l_pui_0 = require("neverlose/pui");
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local l_monylinear_0 = require("neverlose/monylinear");
local l_smoothy_0 = require("neverlose/smoothy");
local l_animations_0 = require("neverlose/animations");
local _ = require("neverlose/get_defensive");
local l_ffi_0 = require("ffi");
local _ = require("neverlose/grenade_prediction");
local l_gradient_0 = require("neverlose/gradient");
local l_x_0 = render.screen_size().x;
local l_y_0 = render.screen_size().y;
local v12 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
local _ = require("neverlose/bomb");
local l_system_0 = require("neverlose/drag_system");
local l_anim_0 = require("neverlose/moon_anim");
local l_mtools_0 = require("neverlose/mtools");
local _ = render.load_font("Calibri", 23, "bda");
local _ = {};
local _ = {};
local _ = render.screen_size();
local v21 = {
    fill = 0, 
    on_plant_time = 0, 
    planting = false, 
    planting_site = ""
};
local v22 = {
    verdana_bold = render.load_font("Verdana Bold", 22, "ab"), 
    verdana_bold2 = render.load_font("Verdana Bold", 18, "ab"), 
    verdana_bold3 = render.load_font("Verdana Bold", 17, "ab"), 
    verdana = render.load_font("Verdana", 20, "ab"), 
    verdana_ind = render.load_font("Verdana", 11, "ab"), 
    verdana_arrows = render.load_font("Verdana", 25, "ab")
};
local v23 = {
    ping = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    da = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    body = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    safe = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
    hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding")
};
print("\v[ w e l c o m e  t o \226\128\149 o v e r s e n s e ]");
cvar.play:call("ui/csgo_ui_contract_type1");
l_ffi_0.cdef("    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n    bool URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n    \n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n    typedef int(__fastcall* clantag_t)(const char*, const char*);\n    void* CloseHandle(void *hFile);\n    typedef int(__fastcall* clantag_t)(const char*, const char*);    \n\n    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder;\n        int m_nSequence;\n        float m_flPrevCycle;\n        float m_flWeight;\n        float m_flWeightDeltaRate;\n        float m_flPlaybackRate;\n        float m_flCycle;\n        void *m_pOwner;\n        char  pad_0038[4];\n    } CAnimationLayer_t;\n");
local _ = {
    last_drop_tick = globals.tickcount
};
local v25 = false;
local v26 = render.screen_size();
local v27 = {};
local v28 = {};
local v29 = {};
local v30 = {};
local v31 = {};
local v32 = {};
local v33 = {};
local v34 = {};
local _ = {};
local v36 = {};
local v37 = {};
local _ = "";
local v39 = "\a{Link Active}";
v37 = {
    [1] = yaw, 
    [2] = invert, 
    [3] = add, 
    [4] = safe, 
    [5] = cond, 
    [6] = cond2
};
local v40 = 0;
local v41 = 0;
local v42 = 0;
local v43 = 0;
v36.hitboxes = {
    [1] = "generic", 
    [2] = "head", 
    [3] = "chest", 
    [4] = "stomach", 
    [5] = "left arm", 
    [6] = "right arm", 
    [7] = "left leg", 
    [8] = "right leg", 
    [9] = "neck", 
    [10] = "generic", 
    [11] = "gear"
};
v36.data = {};
v36.datal = {};
local v44 = 0;
v36.hit = 0;
v36.reg = v44;
v44 = {
    urlmon = l_ffi_0.load("UrlMon"), 
    wininet = l_ffi_0.load("WinInet")
};
v44.download_file_from_url = function(v45, v46)
    -- upvalues: v44 (ref)
    v44.wininet.DeleteUrlCacheEntryA(v45);
    v44.urlmon.URLDownloadToFileA(nil, v45, v46, 0, 0);
end;
local v47 = {
    name = {
        [1] = v39 .. "Default \rPreset"
    }, 
    file = {
        [1] = ""
    }
};
files.create_folder("nl/oversense");
if files.read("nl/oversense/configuration.txt") == nil then
    files.write("nl/oversense/configuration.txt", l_base64_0.encode(json.stringify(delay_cfg)));
    files.write("nl/oversense/configuration.txt", l_base64_0.encode(json.stringify(v47)));
end;
presets_data = json.parse(l_base64_0.decode(files.read("nl/oversense/configuration.txt")));
local l_rect_0 = render.rect;
local l_shadow_0 = render.shadow;
render.rect = function(v50, v51, ...)
    -- upvalues: l_rect_0 (ref)
    local l_v50_0 = v50;
    local v53 = v50 + v51;
    return l_rect_0(l_v50_0, v53, ...);
end;
render.shadow = function(v54, v55, ...)
    -- upvalues: l_shadow_0 (ref)
    local l_v54_0 = v54;
    local v57 = v54 + v55;
    return l_shadow_0(l_v54_0, v57, ...);
end;
lerp = function(v58, v59, v60)
    return v58 + (v59 - v58) * v60;
end;
math.max_lerp_low_fps = 2.2222222222222223;
math.lerp = function(v61, v62, v63)
    if v61 == v62 then
        return v62;
    else
        local v64 = globals.frametime * 170;
        v63 = v63 * math.min(v64, math.max_lerp_low_fps);
        local v65 = v61 + (v62 - v61) * globals.frametime * v63;
        if math.abs(v65 - v62) < 0.01 then
            return v62;
        else
            return v65;
        end;
    end;
end;
local function _(v66, v67)
    local v68 = nil;
    local v69 = nil;
    local v70 = nil;
    local v71 = nil;
    v68 = math.sin(math.rad(v66));
    v69 = math.sin(math.rad(v67));
    v70 = math.cos(math.rad(v66));
    v71 = math.cos(math.rad(v67));
    return vector(v70 * v71, v70 * v69, -v68);
end;
local function v76(v73, v74, v75)
    return v73 + (v74 - v73) * v75 * globals.frametime;
end;
local function v79(v77)
    local _ = v77:gsub("\a.{6}", "");
end;
if files.read("nl/oversense/CheltenhamBoldItalic.otf") == nil then
    v44.download_file_from_url("https://github.com/travmavdrame/fontgloriosa/raw/main/CheltenhamBoldItalic.otf", "nl/oversense/CheltenhamBoldItalic.otf");
end;
if files.read("nl/oversense/WixMadeforDisplayRegular.ttf") == nil then
    v44.download_file_from_url("https://github.com/travmavdrame/fontgloriosa/raw/main/WixMadeforDisplayRegular.ttf", "nl/oversense/WixMadeforDisplayRegular.ttf");
end;
local _ = render.load_font("nl/oversense/CheltenhamBoldItalic.otf", 18, "d, a");
local _ = render.load_font("nl/oversense/WixMadeforDisplayRegular.ttf", 10, "d, a");
local _ = render.load_font("nl/oversense/CheltenhamBoldItalic.otf", 12, "d, a");
local function v89(v83, v84, v85)
    -- upvalues: v43 (ref), v79 (ref)
    return function(...)
        -- upvalues: v85 (ref), v83 (ref), v43 (ref), v84 (ref), v79 (ref)
        local l_status_0, l_result_0 = pcall(v85, ...);
        if not l_status_0 then
            local v88 = v83 .. " : " .. l_result_0:gsub(".{6}", "");
            if v88 == "presets.import : [\"neverlose/base64\"]:98: attempt to perform arithmetic on local 'd' (a nil value)" then
                v43 = globals.realtime;
            end;
            if v84 then
                v79(v88);
            end;
            return false, v88;
        else
            return l_result_0, l_status_0;
        end;
    end;
end;
local function v93(v90, v91, v92)
    -- upvalues: v89 (ref)
    events[v90]:set(v89(v91, true, v92));
end;
local function v97(v94, v95)
    for v96 = 1, #v94 do
        if v94[v96] == v95 then
            return true;
        end;
    end;
    return false;
end;
local function _(v98)
    if v98:get_override() == nil then
        return v98:get();
    else
        return v98:get_override();
    end;
end;
v27 = {
    build = "live", 
    update = "21.10.2024", 
    screen = render.screen_size() * 0.5, 
    fullscreen = render.screen_size(), 
    cond = {
        [1] = "Shared", 
        [2] = "Standing", 
        [3] = "Running", 
        [4] = "Walking", 
        [5] = "Crouch", 
        [6] = "Crouch-move", 
        [7] = "Air", 
        [8] = "Air-Crouch", 
        [9] = "Freestanding"
    }, 
    cond2 = {
        [1] = "SHARED", 
        [2] = "STANDING", 
        [3] = "RUNNING", 
        [4] = "WALKING", 
        [5] = "CROUCH", 
        [6] = "CROUCH-MOVE", 
        [7] = "AIR", 
        [8] = "AIR-CROUCH", 
        [9] = "FREESTANDING"
    }, 
    calibri = render.load_font("Calibri Bold", vector(25, 22, -1), "a, d"), 
    username = common.get_username(), 
    usernamelen = string.len(common.get_username())
};
v28 = {
    enableaanl = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"):visibility(false), 
    disable = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):visibility(false), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):visibility(false), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):visibility(false), 
    base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yawoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):visibility(false), 
    backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"):visibility(false), 
    hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):visibility(false), 
    modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):visibility(false), 
    modoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"):visibility(false), 
    bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):visibility(false), 
    inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"):visibility(false), 
    leftlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):visibility(false), 
    rightlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):visibility(false), 
    options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):visibility(false), 
    bodyyawfs = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    extended = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"):visibility(false), 
    extendedpitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"):visibility(false), 
    extendedroll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"):visibility(false), 
    fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):visibility(false), 
    fss = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    fsb = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
    fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    sw = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    leg = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    pa = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    hslag = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
    dtlag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    scope = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
    fov = ui.find("Visuals", "World", "Main", "Field of View"), 
    weaponact = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"), 
    spike = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    bodyaim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    dormant = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    min_damage_ui = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    dmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"), 
    ragebot_find = ui.find("Aimbot", "Ragebot", "Main"), 
    hc_find = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance")
};
local _ = ui.find("Aimbot", "Anti Aim", "Angles"):label("\a{Link Active}O V E R S E N S E\n~ ChangeLog ~\n\n" .. "- Redesign Lua\n- Fixed Builder Logic\n");
v29 = {
    menu = l_pui_0.create(v39 .. ui.get_icon("house"), "\n\n\n\n\n\n\n\n\n", 1), 
    information = l_pui_0.create(v39 .. ui.get_icon("house"), "Info\n", 1), 
    updateloginfo = l_pui_0.create(v39 .. ui.get_icon("house"), "Changelog\n\n\n\n\n\n\n\n\n\n", 1), 
    personal = l_pui_0.create(v39 .. ui.get_icon("house"), "\n\n\n\n", 1), 
    configuration = l_pui_0.create(v39 .. ui.get_icon("house"), "Configs\n\n\n", 2), 
    watermarkmenu = l_pui_0.create(v39 .. ui.get_icon("house"), "Watermark\n\n\n\n\n\n\n\n\n\n\n", 2), 
    general = l_pui_0.create(v39 .. ui.get_icon("house"), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 2), 
    enable = l_pui_0.create(v39 .. ui.get_icon("shield"), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 1), 
    enable1 = l_pui_0.create(v39 .. ui.get_icon("gear"), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 1), 
    states = l_pui_0.create(v39 .. ui.get_icon("shield"), "Builder\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 2), 
    maincolor = l_pui_0.create(v39 .. ui.get_icon("gear"), "Accent\n\n\n\n\n", 2), 
    antiaim = l_pui_0.create(v39 .. ui.get_icon("gear"), "\n\n\n\n", 1), 
    banner = l_pui_0.create(v39 .. ui.get_icon("shield"), "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n", 1), 
    defensivetab = l_pui_0.create(v39 .. ui.get_icon("shield"), "Addons", 1), 
    builder_tab = l_pui_0.create(v39 .. ui.get_icon("shield"), "Hotkeys\n\n\n\n\n", 1), 
    yaw = l_pui_0.create(v39 .. ui.get_icon("shield"), "\n", 1), 
    settings_ragebot = l_pui_0.create(v39 .. ui.get_icon("gear"), "Ragebot\n", 1), 
    settings_movement = l_pui_0.create(v39 .. ui.get_icon("gear"), "Movement\n\n", 1), 
    settings_misc = l_pui_0.create(v39 .. ui.get_icon("gear"), "Misc\n\n\n\n", 2)
};
v30 = {
    info = {
        infochangelog = v29.updateloginfo:label("\aBD4A6087\f<calendar-lines-pen>  ChangeLog Located Anti-Aim Tab [NL]\n"), 
        user = v29.information:label(v39 .. "\f<circle-user>   \rWelcome Back ~ " .. string.rep("", 0 - v27.usernamelen) .. v39 .. v27.username), 
        version = v29.information:label(v39 .. "\f<code-compare>   \rVersion ~" .. v39 .. " Live"), 
        linked = v29.personal:label(v39 .. "\f<bug-slash>" .. v39 .. " \rReport Bugs"), 
        update = v29.information:label(v39 .. "\f<calendar-lines-pen>" .. v39 .. "   \rLast Update: " .. v39 .. "20.11.24"), 
        bags = v29.personal:button(v39 .. "\f<discord> \rDis" .. v39 .. "cord", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/BSxgQ6FUPy");
        end, true):tooltip("Discord Server"), 
        watermark32 = v29.watermarkmenu:label(v39 .. "\f<rectangle-ad>  \rWatermark" .. v39 .. " Settings", function(v101)
            -- upvalues: v39 (ref)
            return {
                watermarkstyle = v101:combo(v39 .. "\f<pen-swirl>  \rStyle", {
                    [1] = "Default", 
                    [2] = "Custom"
                }), 
                watermarkstylename = v101:input(v39 .. "\f<text>  \rCustom Name"), 
                watermark2 = v101:combo(v39 .. "\f<arrows-up-down-left-right>  \rPosition", {
                    [1] = "Bottom", 
                    [2] = "Left", 
                    [3] = "Right"
                }), 
                watermarkfonts = v101:combo(v39 .. "\f<book-font>   \rFont", {
                    [1] = "Default", 
                    [2] = "Pixel", 
                    [3] = "Tahoma", 
                    [4] = "Bold"
                }), 
                watermarkaccent1 = v101:color_picker(v39 .. "\f<swatchbook>  \rWatermark Color", color(188, 188, 188, 255))
            };
        end), 
        presets_list = v29.configuration:list("", presets_data.name), 
        presets_label = v29.configuration:label(v39 .. "\f<file-signature>  \rName: "), 
        presets_name = v29.configuration:input(""), 
        presets_aa = v29.configuration:button("\f<spinner>", function()
            aa();
            misc();
        end):tooltip("Loading Anti-Aim And Misc"), 
        presets_create = v29.configuration:button(v39 .. "\f<circle-plus>", function()
            create();
        end, true):tooltip("Create Config"), 
        presets_save = v29.configuration:button(v39 .. "\f<floppy-disk>", function()
            save();
        end, true):tooltip("Save Config"), 
        presets_remove = v29.configuration:button(v39 .. "\f<trash>", function()
            remove();
        end, true):tooltip("Delete Config"), 
        presets_export = v29.configuration:button(v39 .. "\f<files>  \rExport", function()
            export();
        end, true), 
        presets_import = v29.configuration:button(v39 .. "\f<file>  \rImport", function()
            import();
        end, true), 
        presets_success_export = v29.configuration:label("\a388539ff\f<file-export>  Successfully Exported: \r"), 
        presets_success_import = v29.configuration:label("\a388539ff\f<file-import>  Successfully Imported: \r"), 
        presets_success_exist = v29.configuration:label("\a853838ff\f<triangle-exclamation>  Preset Already Exist: \r"), 
        presets_success_importfailed = v29.configuration:label("\a853838ff\f<triangle-exclamation>  Invalid Preset \r")
    }, 
    antiaim = {
        enable = v29.enable:list("", {
            [1] = nil, 
            [2] = "builder", 
            [1] = v39 .. "off"
        }), 
        forceinterpolation = v29.defensivetab:switch("\aA8A85EFF\f<code-pull-request-draft>   Force Interpolation", false, "Makes the game feel snoother by disabling specific engine mechanics then make the game reset the interpolation\n\n \aA8A85EFFThis feature can cause unexpected crashes. Use at your own risk."), 
        fs = v29.defensivetab:switch(v39 .. "\f<arrows-turn-to-dots>  \rFreestanding"), 
        manual = v29.defensivetab:combo(v39 .. "\f<arrows-repeat>  \rManual Yaw", {
            [1] = "Disabled", 
            [2] = "Front", 
            [3] = "Left", 
            [4] = "Right"
        }, function(v102)
            return {
                static = v102:switch("static on manual")
            }, true;
        end), 
        nofalldamage = v29.settings_movement:switch(v39 .. "\f<person-falling-burst> \rNo Fall Damage"), 
        ladder_select = v29.settings_movement:switch(v39 .. "\f<water-ladder>  \rFast Ladder"), 
        flickexploit = v29.defensivetab:switch(v39 .. "\f<shuffle>  \rFlick Exploit", false, function(v103)
            -- upvalues: v39 (ref)
            return {
                flicksettings = v103:listable(v39 .. "", {
                    [1] = v39 .. "\f<person>  \rStanding", 
                    [2] = v39 .. "\f<person-walking>  \rWalking", 
                    [3] = v39 .. "\f<person-seat>  \rCrouch", 
                    [4] = v39 .. "\f<person-falling>  \rAir"
                })
            }, true;
        end), 
        safe = v29.defensivetab:switch(v39 .. "\f<square-dashed>  \rSafe Head", false, function(v104)
            return {
                weapons = v104:listable("", {
                    [1] = "Standing", 
                    [2] = "Crouch", 
                    [3] = "Air-Crouch", 
                    [4] = "Distance", 
                    [5] = "Above Enemy", 
                    [6] = "Knife", 
                    [7] = "Taser"
                })
            }, true;
        end), 
        backstab = v29.defensivetab:switch(v39 .. "\f<scalpel-line-dashed>  \rAvoid Backstab"), 
        conditions = v29.states:combo(v39 .. "\f<heat>  \rConditions", v27.cond, function(v105)
            -- upvalues: v39 (ref)
            return {
                base = v105:combo(v39 .. "\f<user-gear>  \rBase", {
                    [1] = "Local view", 
                    [2] = "At target"
                }), 
                pitch = v105:combo(v39 .. "\f<head-side>  \rPitch", {
                    [1] = "Down", 
                    [2] = "Disabled", 
                    [3] = "Fake Down", 
                    [4] = "Fake Up"
                })
            };
        end)
    }, 
    misc = {
        bars = v29.settings_misc:switch(v39 .. "\f<bars>  500$ \aDEFAULTIndicators", false, function(v106)
            -- upvalues: v39 (ref)
            return {
                skeetinropolation = v106:switch(v39 .. "G\rS" .. v39 .. " \r Interpolation"), 
                keep_model_transparency = v106:switch(v39 .. "\f<face-dotted>  \rKeep Model Transparency"), 
                skeetindstyle = v106:combo(v39 .. "\f<pen-swirl>  \rStyle", {
                    [1] = "Old", 
                    [2] = "Modern"
                }), 
                mode = v106:listable(v39 .. "\f<gears>  \rMode", {
                    [1] = "Double Tap", 
                    [2] = "Hide Shots", 
                    [3] = "Dormant Aimbot", 
                    [4] = "Damage Override", 
                    [5] = "Hit/Miss", 
                    [6] = "Hitchance Override", 
                    [7] = "Lag Compensation", 
                    [8] = "Hitbox Override", 
                    [9] = "Fake Latency", 
                    [10] = "Fake Angles", 
                    [11] = "Fake Duck", 
                    [12] = "Body Aim", 
                    [13] = "Safe Points", 
                    [14] = "Freestanding", 
                    [15] = "Bomb Info"
                })
            }, true;
        end), 
        aspect = v29.settings_misc:switch(v39 .. "\f<monitor-waveform>  \rAspect Ratio", false, function(v107)
            -- upvalues: v39 (ref)
            return {
                val = v107:slider(v39 .. "\f<monitor-waveform>  \rValue", 0, 250, 100, 0.01, function(v108)
                    if v108 == 0 then
                        return "Disabled";
                    else
                        return;
                    end;
                end), 
                pre1 = v107:button(v39 .. " 16:10 ", nil, true), 
                pre2 = v107:button(v39 .. " 16:9 ", nil, true), 
                pre3 = v107:button(v39 .. " 5:4 ", nil, true), 
                pre4 = v107:button(v39 .. " 4:3 ", nil, true), 
                pre5 = v107:button(v39 .. " 3:2 ", nil, true)
            }, true;
        end), 
        viewmodel = v29.settings_misc:switch(v39 .. "\f<handshake>  \rViewmodel", false, function(v109)
            -- upvalues: v39 (ref)
            return {
                fov = v109:slider(v39 .. "\f<hands-praying>  \rFov", 0, 150, 68), 
                x_axis = v109:slider(v39 .. "\f<arrows-left-right> \rX", -100, 100, 0, 0.1), 
                y_axis = v109:slider(v39 .. "\f<hands> \rY", -100, 100, 0, 0.1), 
                z_axis = v109:slider(v39 .. " \f<arrows-up-down>  \rZ", -100, 100, 0, 0.1)
            }, true;
        end), 
        scope = v29.settings_misc:switch(v39 .. "\f<crosshairs>  \rScope Overlay", false, function(v110)
            -- upvalues: v39 (ref)
            return {
                color = v110:combo(v39 .. "\f<swatchbook>  \rColor", {
                    [1] = "Default", 
                    [2] = "Reversed"
                }, color(255)), 
                length = v110:slider(v39 .. "\f<arrows-left-right>  \rLength", 0, 200, 75), 
                gap = v110:slider(v39 .. "\f<arrows-up-down-left-right>  \rGap", 0, 100, 10), 
                animatezoom = v110:switch(v39 .. "\f<gif>  \rAnimate Zoom")
            }, true;
        end), 
        mindmg = v29.settings_misc:switch(v39 .. "\f<hundred-points>  \rDamage Indicator", false, function(v111)
            -- upvalues: v39 (ref), l_x_0 (ref), l_y_0 (ref)
            return {
                damage_color = v111:color_picker(v39 .. "\f<swatchbook>  \rColor", color(255)), 
                damage_font = v111:combo(v39 .. "\f<book-font>   \rFonts", {
                    [1] = "Default", 
                    [2] = "Pixel", 
                    [3] = "Tahoma", 
                    [4] = "Bold"
                }), 
                damage_position_x = v111:slider("First", 38, l_x_0, 970), 
                damage_position_y = v111:slider("Second", 14, l_y_0, 515)
            }, true;
        end), 
        dormantaim = v29.settings_ragebot:switch(v39 .. "\f<gun>  \rDormant Aimbot", false, function(v112)
            -- upvalues: v39 (ref)
            return {
                hitboxesda = v112:selectable(v39 .. "\f<person>  \rHitboxes", {
                    [1] = "Head", 
                    [2] = "Chest", 
                    [3] = "Stomach", 
                    [4] = "Legs"
                }), 
                hitchanceda = v112:slider(v39 .. "\f<dice>  \rAccuracy", 30, 85, 60, 1, "%"), 
                autoscopeda = v112:switch(v39 .. "\f<location-crosshairs>  \rAuto Scope", false), 
                autostopda = v112:switch(v39 .. "\f<shoe-prints>  \rAuto Stop", false), 
                logsda = v112:switch(v39 .. "\f<calendar>  \rLogs", false)
            }, true;
        end), 
        grenades = v29.settings_movement:switch(v39 .. "\f<bomb>  \rGrenades Features", false, function(v113)
            -- upvalues: v39 (ref)
            return {
                nades = v113:listable("", {
                    [1] = v39 .. "\f<wrench>  \rNade Throw Fix", 
                    [2] = v39 .. "\f<hand-holding-droplet>  \rDrop Nades", 
                    [3] = v39 .. "\f<bomb>  \rGrenade Release", 
                    [4] = v39 .. "\f<crosshairs>  \rSuper Toss"
                }), 
                selectnades = v113:listable(v39 .. "Select Drop Nades", v39 .. "\f<fire>  \rMolotov", v39 .. "\f<smoke>  \rSmoke", v39 .. "\f<explosion>  \rNade"), 
                nadehotkey = v113:hotkey("Hotkey"), 
                realese32 = v113:slider("Amount", 0, 50, 0)
            }, true;
        end), 
        hitchance = v29.settings_ragebot:switch(v39 .. "\f<gear>  \rOverride Hitchance", false, function(v114)
            -- upvalues: v39 (ref)
            return {
                inair_hc = v114:selectable("Weapons", {
                    [1] = "SSG-08", 
                    [2] = "AWP", 
                    [3] = "SCAR20", 
                    [4] = "G3SG1", 
                    [5] = "R8"
                }), 
                inair_hc_sldeir = v114:slider(v39 .. "\f<paper-plane>  \rIn Air", 0, 100, 35, 1, "%"), 
                noscope_hc_sldeir = v114:slider(v39 .. "\f<crosshairs>  \rNo Scope", 0, 100, 35, 1, "%"), 
                jumpscoutfix = v114:switch(v39 .. "\f<wrench>  \rJump Shot")
            }, true;
        end), 
        pingunlocker = v29.settings_ragebot:switch(v39 .. "\f<chart-simple>  \rPing Unlocker", false, "Fake your ping to the server to shift your backtrack window.\n\nMaximum value for fake latency in neverlose is 100ms this function increases it to 200ms."), 
        aimbotlogs = v29.settings_ragebot:switch(v39 .. "\f<square-kanban>  \rAimbot Logs", false, function(v115)
            -- upvalues: v39 (ref)
            return {
                pos = v115:listable("Position", {
                    [1] = v39 .. "\f<calendar>  \rEvent", 
                    [2] = v39 .. "\f<terminal>  \rConsole", 
                    [3] = v39 .. "\f<screencast>  \rScreen"
                }), 
                color = v115:color_picker(v39 .. "\f<swatchbook>  \rConsole Color"), 
                offset = v115:slider(v39 .. " \f<arrows-up-down>   \rOffset", 0, 500, 200), 
                logsaddons = v115:selectable(v39 .. "\f<gear>  \rAddons", {
                    [1] = v39 .. "\f<keyboard-brightness>  \rGlow", 
                    [2] = v39 .. "\f<window>  \rBackground"
                }), 
                custom_color = v115:switch(v39 .. "\f<swatchbook>  \rCustom Color"), 
                hit_color = v115:color_picker(v39 .. "\f<bullseye-arrow>  \rHit Color", color("52D449FF")), 
                miss_color = v115:color_picker(v39 .. "\f<rectangles-mixed>  \rMiss Color", color("D44949FF")), 
                background_color = v115:color_picker(v39 .. "\f<send-back>  \rBackground Color", color("1E1E1EFF"))
            }, true;
        end), 
        animbreakers = v29.settings_movement:switch(v39 .. "\f<layer-group>   \rAnimations", false, function(v116)
            -- upvalues: v39 (ref)
            return {
                labelbreakers = v116:label("\aFFCD73FF\f<triangle-exclamation>  \r Only Works On The Client Side"), 
                addonsanim = v116:selectable(v39 .. "\f<gears>  \rAddons", {
                    [1] = "Earthquake", 
                    [2] = "Smoothing", 
                    [3] = "Leaning On Standing"
                }), 
                ground = v116:combo(v39 .. "\f<person-running>  \rGround", {
                    [1] = "Disabled", 
                    [2] = "Backward", 
                    [3] = "Moonwalk", 
                    [4] = "Flex", 
                    [5] = "Bsod", 
                    [6] = "Jitter"
                }), 
                jitterspeed = v116:slider(v39 .. "\f<gauge>  \rJitter speed", 0, 100, 100, nil, "%"), 
                jittervalue = v116:slider(v39 .. "\f<angles-right>  \rJitter value", 0, 100, 100, nil, "%"), 
                jittervalue1 = v116:slider(v39 .. "\f<angles-right>  \rJitter value2", 0, 100, 100, nil, "%"), 
                air = v116:combo(v39 .. "\f<person-falling>  \rAir", {
                    [1] = "Disabled", 
                    [2] = "Static", 
                    [3] = "Kangaroo", 
                    [4] = "Moonwalk"
                }), 
                airvalue = v116:slider(v39 .. "\f<angles-right>  \rAir Value", 0, 100, 100, 0.01, function(v117)
                    if v117 == 50 then
                        return "Force";
                    elseif v117 == 100 then
                        return "Max";
                    elseif v117 == 0 then
                        return "Disabled";
                    else
                        return;
                    end;
                end), 
                movelean = v116:slider(v39 .. "\f<person-rays>  \rLean", 0, 100, 0, 1, function(v118)
                    if v118 == 100 then
                        return "Extreme";
                    elseif v118 == 75 then
                        return "High";
                    elseif v118 == 50 then
                        return "Medium";
                    elseif v118 == 25 then
                        return "Low";
                    elseif v118 == 0 then
                        return "Disabled";
                    else
                        return;
                    end;
                end)
            }, true;
        end), 
        crosshair = v29.settings_misc:switch(v39 .. "\f<screencast>  \rCentered Indicators", false, function(v119)
            -- upvalues: v39 (ref)
            return {
                style = v119:combo(v39 .. "\f<pen-swirl>  \rStyle", {
                    [1] = "Default", 
                    [2] = "Pixel", 
                    [3] = "Modern"
                }), 
                fontcrosshair = v119:combo(v39 .. "\f<book-font>  \rFont", {
                    [1] = "Default", 
                    [2] = "Tahoma", 
                    [3] = "Bold"
                }), 
                offset = v119:slider(v39 .. " \f<arrows-up-down>   \rOffset", 0, 100, 200), 
                glowcross = v119:switch(v39 .. "\f<keyboard-brightness>  \rGlow"), 
                crosshaircolor = v119:color_picker(v39 .. "\f<swatchbook>  \rColor", color(188, 188, 188, 255))
            }, true;
        end), 
        solus_ui = v29.settings_misc:switch(v39 .. "\f<window>  \rSolus UI" .. v39 .. " {development}"):disabled(true), 
        grenade_prediction = v29.settings_misc:switch(v39 .. "\f<bomb>  \rGrenade Warning" .. v39 .. " {development}"):disabled(true), 
        hitmarkers = v29.settings_misc:switch(v39 .. "\f<claw-marks>  \rHitmarkers", false, function(v120)
            return {
                hitmarkerselect = v120:listable("", {
                    [1] = "Skeet", 
                    [2] = "Kibit"
                }), 
                kibitcolor = v120:color_picker("Kibit Color", color(88, 255, 209, 255))
            }, true;
        end), 
        ts = v29.settings_misc:switch(v39 .. "\f<arrows-rotate>  \rArrows", false, function(v121)
            -- upvalues: v39 (ref)
            return {
                ts_type = v121:combo(v39 .. "\f<pen-swirl>  \rStyle", "Default", "Modern", "Ambani", "Custom"), 
                left_manual = v121:input("Left"), 
                right_manual = v121:input("Right"), 
                forward_manual = v121:input("Forward"), 
                font_manual = v121:combo("Font Manual", {
                    [1] = "Default", 
                    [2] = "Pixel", 
                    [3] = "Tahoma", 
                    [4] = "Bold"
                }), 
                accent_color = v121:color_picker(v39 .. "\f<swatchbook>  \rColor", color(255, 255, 255, 255))
            }, true;
        end), 
        revolver = v29.settings_ragebot:switch(v39 .. "\f<gun-squirt>  \rRevolver Helper"), 
        clantag = v29.settings_misc:switch(v39 .. "\f<tags>  \rClantag"), 
        trashtalk = v29.settings_misc:switch(v39 .. "\f<trash>   \rTalking Shit", false, function(v122)
            return {
                trashtalkmode = v122:listable("", {
                    [1] = "Kill", 
                    [2] = "Death", 
                    [3] = "Revenge"
                })
            }, true;
        end)
    }
};
v30.misc.aimbotlogs.offset:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v30.misc.aimbotlogs.pos
});
v30.misc.aimbotlogs.custom_color:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v30.misc.aimbotlogs.pos
});
v30.misc.aimbotlogs.hit_color:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v30.misc.aimbotlogs.pos
});
v30.misc.aimbotlogs.miss_color:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v30.misc.aimbotlogs.pos
});
v30.misc.aimbotlogs.background_color:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v30.misc.aimbotlogs.pos
});
v30.misc.hitmarkers.kibitcolor:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v30.misc.hitmarkers.hitmarkerselect
});
v30.misc.ts.left_manual:depend({
    [1] = nil, 
    [2] = "Custom", 
    [1] = v30.misc.ts.ts_type
});
v30.misc.ts.right_manual:depend({
    [1] = nil, 
    [2] = "Custom", 
    [1] = v30.misc.ts.ts_type
});
v30.misc.ts.forward_manual:depend({
    [1] = nil, 
    [2] = "Custom", 
    [1] = v30.misc.ts.ts_type
});
v30.misc.ts.font_manual:depend({
    [1] = nil, 
    [2] = "Custom", 
    [1] = v30.misc.ts.ts_type
});
v30.misc.crosshair.fontcrosshair:depend({
    [1] = nil, 
    [2] = "Default", 
    [1] = v30.misc.crosshair.style
});
v30.misc.crosshair.glowcross:depend({
    [1] = nil, 
    [2] = "Modern", 
    [1] = v30.misc.crosshair.style
});
v30.info.watermark32.watermarkstylename:depend({
    [1] = nil, 
    [2] = "Custom", 
    [1] = v30.info.watermark32.watermarkstyle
});
v30.misc.aimbotlogs.hit_color:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v30.misc.aimbotlogs.custom_color
});
v30.misc.aimbotlogs.miss_color:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v30.misc.aimbotlogs.custom_color
});
v30.misc.aimbotlogs.background_color:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v30.misc.aimbotlogs.custom_color
});
yaw_base_degree = function()
    -- upvalues: v30 (ref), v28 (ref)
    if v30.antiaim.manual:get() == "Left" then
        v28.base:override("Local View");
        yaw = -90;
        v30.antiaim.fs:set(false);
    elseif v30.antiaim.manual:get() == "Right" then
        v28.base:override("Local View");
        yaw = 90;
        v30.antiaim.fs:set(false);
    elseif v30.antiaim.manual:get() == "Front" then
        v28.base:override("Local View");
        yaw = 180;
        v30.antiaim.fs:set(false);
    elseif v30.antiaim.manual:get() == "Disabled" then
        v28.base:override("At Target");
        yaw = 0;
    end;
    return yaw;
end;
local v123 = {};
local v124 = {};
v123.font = render.load_font("Calibri Bold", 24, "ad");
v123.shots = 0;
v123.percentage = 0;
v123.sm1_is_dormant = false;
v123.bomb_image = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg", vector(30, 30));
draw_500_ = function(v125, v126, v127, v128, v129, v130, v131, v132)
    -- upvalues: v123 (ref)
    if v132 == nil then
        v132 = 255;
    end;
    local _ = render.screen_size().x;
    local l_y_1 = render.screen_size().y;
    local v135 = render.measure_text(v123.font, nil, v126);
    if v127 == nil and v128 == nil then
        render.gradient(vector(0, l_y_1 - 351 - v125), vector(29 + v135.x / 2, l_y_1 - 317 - v125), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.gradient(vector(58 + v135.x, l_y_1 - 351 - v125), vector(29 + v135.x / 2, l_y_1 - 317 - v125), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.text(v123.font, vector(29, l_y_1 - 343 - v125), color(v129, v130, v131, v132), nil, v126);
    elseif v127 ~= nil and v128 ~= nil then
        render.gradient(vector(0, l_y_1 - 351 - v125), vector(29 + v135.x / 2, l_y_1 - 317 - v125), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.gradient(vector(58 + v135.x, l_y_1 - 351 - v125), vector(29 + v135.x / 2, l_y_1 - 317 - v125), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.text(v123.font, vector(67, l_y_1 - 343 - v125), color(v129, v130, v131, v132), nil, v126);
        render.texture(v127, vector(29, l_y_1 - 347 - v125), vector(32, 28), color(v129, v130, v131, 255), f, 0);
        render.circle_outline(vector(99, l_y_1 - 334 - v125), color(10, 10, 10, 255), 10, 0, 1, 5);
        render.circle_outline(vector(99, l_y_1 - 334 - v125), color(255, 255, 255, 200), 9, 0, v128, 3);
    elseif v127 ~= nil and v128 == nil then
        render.gradient(vector(0, l_y_1 - 351 - v125), vector(29 + v135.x / 2, l_y_1 - 317 - v125), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.gradient(vector(58 + v135.x, l_y_1 - 351 - v125), vector(29 + v135.x / 2, l_y_1 - 317 - v125), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.text(v123.font, vector(67, l_y_1 - 343 - v125), color(v129, v130, v131, v132), nil, v126);
        render.texture(v127, vector(29, l_y_1 - 347 - v125), vector(32, 28), color(v129, v130, v131, 255), f, 0);
    end;
end;
v123.real_yaw = 0;
v123.positions = {};
v123.lc = false;
events.createmove:set(function(v136)
    -- upvalues: v123 (ref)
    local v137 = entity.get_local_player();
    local v138 = v137:get_origin();
    local v139 = 1 / globals.tickinterval;
    if v136.choked_commands == 0 then
        v123.positions[#v123.positions + 1] = v138;
        if v139 <= #v123.positions then
            v123.lc = (v138 - v123.positions[v139]):lengthsqr() > 4096;
        end;
    end;
    if v139 < #v123.positions then
        table.remove(v123.positions, 1);
    end;
    v123.is_jumping = v136.in_jump;
    if v136.choked_commands > 0 then
        return;
    else
        v123.real_yaw = v137.m_flPoseParameter[11] * 120 - 60;
        return;
    end;
end);
v124.screen_size = render.screen_size();
v124.dpi_scale = v124.screen_size / vector(1920, 1080);
v123.handle = function()
    -- upvalues: v30 (ref), v124 (ref), v21 (ref), v123 (ref), v23 (ref)
    if not v30.misc.bars:get() then
        return;
    else
        local l_mode_0 = v30.misc.bars.mode;
        local v141 = entity.get_local_player();
        if v141 == nil then
            return;
        else
            local v142 = entity.get_entities("CPlantedC4", true)[1];
            local v143 = "";
            local v144 = 0;
            local v145 = false;
            local v146 = 0;
            local v147 = 0;
            local v148 = false;
            if v142 ~= nil then
                v144 = v142.m_flC4Blow - globals.curtime;
                v145 = v142.m_bBombDefused;
                if v144 > 0 and not v145 then
                    local v149 = v142.m_hBombDefuser ~= 4294967295;
                    local l_m_flDefuseLength_0 = v142.m_flDefuseLength;
                    local v151 = v142.m_hBombDefuser and v142.m_hBombDefuser.m_bIsDefusing or false;
                    local v152 = v149 and v151 and v142.m_flDefuseCountDown - globals.curtime or -1;
                    if v152 > 0 then
                        local v153 = v152 < v144 and color(58, 191, 54, 160) or color(252, 18, 19, 125);
                        local v154 = (v124.screen_size.y - 50) / l_m_flDefuseLength_0 * v152;
                        render.rect(vector(0, 0), vector(16, v124.screen_size.y), color(25, 25, 25, 160));
                        render.rect_outline(vector(0, 0), vector(16, v124.screen_size.y), color(25, 25, 25, 160));
                        render.rect(vector(0, v124.screen_size.y - v154), vector(16, v124.screen_size.y), v153);
                    end;
                    v143 = v142.m_nBombSite == 0 and "A" or "B";
                    local l_m_iHealth_0 = v141.m_iHealth;
                    local l_m_ArmorValue_0 = v141.m_ArmorValue;
                    local v157 = v142.m_vecOrigin:dist(v141.m_vecOrigin);
                    local v158 = 450.7;
                    local v159 = (v157 - 75.68) / 789.2;
                    v146 = v158 * math.exp(-v159 * v159);
                    if l_m_ArmorValue_0 > 0 then
                        local v160 = v146 * 0.5;
                        local v161 = (v146 - v160) * 0.5;
                        if l_m_ArmorValue_0 < v161 then
                            l_m_ArmorValue_0 = l_m_ArmorValue_0 * 2;
                            v160 = v146 - v161;
                        end;
                        v146 = v160;
                    end;
                    v147 = math.ceil(v146);
                    v148 = l_m_iHealth_0 <= v147;
                end;
            end;
            if v21.planting then
                v21.fill = 3.125 - (3.125 + v21.on_plant_time - globals.curtime);
                if v21.fill > 3.125 then
                    v21.fill = 3.125;
                end;
            end;
            v123.sm1_is_dormant = false;
            local v162 = entity.get_players(true, true);
            if not v162 then
                return;
            else
                for _, v164 in ipairs(v162) do
                    if v164:is_dormant() then
                        v123.sm1_is_dormant = true;
                    end;
                end;
                if not v30.misc.bars:get() then
                    return;
                else
                    local v165 = entity.get_local_player();
                    if v165 == nil then
                        return;
                    else
                        v124.get_bind = function(v166)
                            local v167 = false;
                            local v168 = 0;
                            local v169 = ui.get_binds();
                            for v170 = 1, #v169 do
                                if v169[v170].name == v166 and v169[v170].active then
                                    v167 = true;
                                    v168 = v169[v170].value;
                                end;
                            end;
                            return {
                                [1] = v167, 
                                [2] = v168
                            };
                        end;
                        v123.sm1_is_dormant = false;
                        local v171 = entity.get_players(true, true);
                        if not v171 then
                            return;
                        else
                            for _, v173 in ipairs(v171) do
                                if v173:is_dormant() then
                                    v123.sm1_is_dormant = true;
                                end;
                            end;
                            local v174 = entity.get_local_player();
                            if globals.is_connected == false or v174 == nil or v174:is_alive() == false then
                                return;
                            else
                                local l_m_iPing_0 = v174:get_resource().m_iPing;
                                local v176 = math.abs(l_m_iPing_0 % 360);
                                if v176 > 1 then
                                    v176 = 1;
                                end;
                                local v177 = 132 * v176 + 255 * (1 - v176);
                                local v178 = 196 * v176 + 255 * (1 - v176);
                                local v179 = 20 * v176 + 255 * (1 - v176);
                                local v180 = math.min(60, math.abs(v123.real_yaw)) / 60;
                                local v181 = 132 * v180 + 250 * (1 - v180);
                                local v182 = 196 * v180 + 15 * (1 - v180);
                                local v183 = 20 * v180 + 15 * (1 - v180);
                                local v184 = 0;
                                local _ = render.screen_size().x;
                                local _ = render.screen_size().y;
                                if v30.misc.bars.skeetindstyle:get() == "Old" and l_mode_0:get("Fake Latency") and v23.ping:get() > 0 then
                                    draw_500_(v184, "PING", nil, nil, v177, v178, v179, 255);
                                    v184 = v184 + 42;
                                end;
                                if v30.misc.bars.skeetindstyle:get() == "Old" and l_mode_0:get("Hide Shots") and v23.hs:get() and not v23.dt:get() then
                                    draw_500_(v184, "OSAA", nil, nil, 255, 255, 255, 200);
                                    v184 = v184 + 42;
                                end;
                                if v30.misc.bars.skeetindstyle:get() == "Old" and l_mode_0:get("Double Tap") and v23.dt:get() and not v23.fd:get() then
                                    if rage.exploit:get() == 1 then
                                        draw_500_(v184, "DT", nil, nil, 255, 255, 255, 200);
                                        v184 = v184 + 42;
                                    else
                                        draw_500_(v184, "DT", nil, nil, 255, 0, 50, 255);
                                        v184 = v184 + 42;
                                    end;
                                end;
                                if v30.misc.bars.skeetindstyle:get() == "Old" and l_mode_0:get("Dormant Aimbot") and v30.misc.dormantaim:get() then
                                    if v123.sm1_is_dormant then
                                        draw_500_(v184, "DA", nil, nil, 255, 255, 255, 200);
                                        v184 = v184 + 42;
                                    else
                                        draw_500_(v184, "DA", nil, nil, 255, 0, 50, 255);
                                        v184 = v184 + 42;
                                    end;
                                end;
                                if v30.misc.bars.skeetindstyle:get() == "Old" and l_mode_0:get("Lag Compensation") then
                                    local l_v123_0 = v123;
                                    local l_v123_1 = v123;
                                    local l_v123_2 = v123;
                                    local l_v123_3 = v123;
                                    local v191 = 240;
                                    local v192 = 15;
                                    local v193 = 15;
                                    l_v123_3.a = 240;
                                    l_v123_2.b = v193;
                                    l_v123_1.g = v192;
                                    l_v123_0.r = v191;
                                    l_v123_0 = bit.band(v174.m_fFlags, bit.lshift(1, 0)) == 0 or v123.is_jumping;
                                    if v123.lc then
                                        l_v123_1 = v123;
                                        l_v123_2 = v123;
                                        l_v123_3 = v123;
                                        v191 = 132;
                                        v192 = 196;
                                        l_v123_3.b = 20;
                                        l_v123_2.g = v192;
                                        l_v123_1.r = v191;
                                    end;
                                    if l_v123_0 and math.sqrt(v174.m_vecVelocity.x ^ 2 + v174.m_vecVelocity.y ^ 2) > 230 then
                                        draw_500_(v184, "LC", nil, nil, v123.r, v123.g, v123.b, v123.a);
                                        v184 = v184 + 42;
                                    end;
                                end;
                                if v30.misc.bars.skeetindstyle:get() == "Old" and l_mode_0:get("Fake Angles") then
                                    draw_500_(v184, "FAKE", nil, nil, v181, v182, v183, 255);
                                    v184 = v184 + 42;
                                end;
                                if v30.misc.bars.skeetindstyle:get() == "Old" and l_mode_0:get("Safe Points") and v23.safe:get() == "Force" then
                                    draw_500_(v184, "SAFE", nil, nil, 255, 255, 255, 200);
                                    v184 = v184 + 42;
                                end;
                                if v30.misc.bars.skeetindstyle:get() == "Old" and l_mode_0:get("Body Aim") and v23.body:get() == "Force" then
                                    draw_500_(v184, "BODY", nil, nil, 255, 255, 255, 200);
                                    v184 = v184 + 42;
                                end;
                                if v30.misc.bars.skeetindstyle:get() == "Old" and l_mode_0:get("Fake Duck") and v23.fd:get() then
                                    draw_500_(v184, "DUCK", nil, nil, 255, 255, 255, 200);
                                    v184 = v184 + 42;
                                end;
                                if v30.misc.bars.skeetindstyle:get() == "Old" and l_mode_0:get("Damage Override") and v124.get_bind("Min. Damage")[1] then
                                    draw_500_(v184, "MD", nil, nil, 255, 255, 255, 200);
                                    v184 = v184 + 42;
                                end;
                                if v30.misc.bars.skeetindstyle:get() == "Old" and l_mode_0:get("Freestanding") and v23.fs:get_override() then
                                    draw_500_(v184, "FS", nil, nil, 255, 255, 255, 200);
                                    v184 = v184 + 42;
                                end;
                                if v30.misc.bars.skeetindstyle:get() == "Old" and l_mode_0:get("Hit/Miss") then
                                    draw_500_(v184, tostring(v123.percentage) .. "%", nil, nil, 255, 255, 255, 200);
                                    v184 = v184 + 42;
                                end;
                                if v30.misc.bars.skeetindstyle:get() == "Old" and l_mode_0:get("Bomb Info") and v144 > 0 and not v145 then
                                    draw_500_(v184, v143 .. " - " .. string.format("%.1f", v144) .. "s              ", v123.bomb_image, nil, 255, 255, 255, 200);
                                    v184 = v184 + 42;
                                end;
                                if v30.misc.bars.skeetindstyle:get() == "Old" and l_mode_0:get("Bomb Info") and v21.planting then
                                    draw_500_(v184, v21.planting_site .. "              ", v123.bomb_image, v21.fill / 3.125, 252, 243, 105, 255);
                                    v184 = v184 + 42;
                                end;
                                if v30.misc.bars.skeetindstyle:get() == "Old" and l_mode_0:get("Bomb Info") and v165:is_alive() and v148 then
                                    draw_500_(v184, "FATAL", nil, nil, 255, 0, 50, 255);
                                    v184 = v184 + 42;
                                end;
                                if v30.misc.bars.skeetindstyle:get() == "Old" and l_mode_0:get("Bomb Info") and v165:is_alive() and not v148 and v146 > 0.5 then
                                    draw_500_(v184, "-" .. v147 .. " HP", nil, nil, 252, 243, 105, 255);
                                    v184 = v184 + 42;
                                end;
                                if v30.misc.bars.skeetindstyle:get() == "Old" and l_mode_0:get("Hitchance Override") and v124.get_bind("Hit Chance")[1] then
                                    draw_500_(v184, "HITCHANCE OVR", nil, nil, 255, 255, 255, 200);
                                    v184 = v184 + 42;
                                end;
                                if v30.misc.bars.skeetindstyle:get() == "Old" and l_mode_0:get("Hitbox Override") and v124.get_bind("Hitboxes")[1] then
                                    draw_500_(v184, "HITBOX OVR", nil, nil, 255, 255, 255, 200);
                                    v184 = v184 + 42;
                                end;
                                if v30.misc.bars.skeetindstyle:get() == "Modern" then
                                    if v30.misc.bars.skeetindstyle:get() == "Modern" and l_mode_0:get("Fake Latency") and v23.ping:get() > 0 then
                                        draw_500_(v184, ui.get_icon("signal") .. " PING", nil, nil, v177, v178, v179, 255);
                                        v184 = v184 + 42;
                                    end;
                                    if v30.misc.bars.skeetindstyle:get() == "Modern" and l_mode_0:get("Hide Shots") and v23.hs:get() and not v23.dt:get() then
                                        draw_500_(v184, ui.get_icon("shield") .. " OSAA", nil, nil, 255, 255, 255, 200);
                                        v184 = v184 + 42;
                                    end;
                                    if v30.misc.bars.skeetindstyle:get() == "Modern" and l_mode_0:get("Double Tap") and v23.dt:get() and not v23.fd:get() then
                                        if rage.exploit:get() == 1 then
                                            draw_500_(v184, ui.get_icon("bars") .. " DT", nil, nil, 255, 255, 255, 200);
                                            v184 = v184 + 42;
                                        else
                                            draw_500_(v184, ui.get_icon("bars") .. " DT", nil, nil, 255, 0, 50, 255);
                                            v184 = v184 + 42;
                                        end;
                                    end;
                                    if v30.misc.bars.skeetindstyle:get() == "Modern" and l_mode_0:get("Dormant Aimbot") and v30.misc.dormantaim:get() then
                                        if v123.sm1_is_dormant then
                                            draw_500_(v184, ui.get_icon("block-brick") .. " DA", nil, nil, 255, 255, 255, 200);
                                            v184 = v184 + 42;
                                        else
                                            draw_500_(v184, ui.get_icon("block-brick") .. " DA", nil, nil, 255, 0, 50, 255);
                                            v184 = v184 + 42;
                                        end;
                                    end;
                                    if v30.misc.bars.skeetindstyle:get() == "Modern" and l_mode_0:get("Lag Compensation") then
                                        local l_v123_4 = v123;
                                        local l_v123_5 = v123;
                                        local l_v123_6 = v123;
                                        local l_v123_7 = v123;
                                        local v198 = 240;
                                        local v199 = 15;
                                        local v200 = 15;
                                        l_v123_7.a = 240;
                                        l_v123_6.b = v200;
                                        l_v123_5.g = v199;
                                        l_v123_4.r = v198;
                                        l_v123_4 = bit.band(v174.m_fFlags, bit.lshift(1, 0)) == 0 or v123.is_jumping;
                                        if v123.lc then
                                            l_v123_5 = v123;
                                            l_v123_6 = v123;
                                            l_v123_7 = v123;
                                            v198 = 132;
                                            v199 = 196;
                                            l_v123_7.b = 20;
                                            l_v123_6.g = v199;
                                            l_v123_5.r = v198;
                                        end;
                                        if l_v123_4 and math.sqrt(v174.m_vecVelocity.x ^ 2 + v174.m_vecVelocity.y ^ 2) > 230 then
                                            draw_500_(v184, ui.get_icon("signal-bars") .. " LC", nil, nil, v123.r, v123.g, v123.b, v123.a);
                                            v184 = v184 + 42;
                                        end;
                                    end;
                                    if v30.misc.bars.skeetindstyle:get() == "Modern" and l_mode_0:get("Fake Angles") then
                                        draw_500_(v184, ui.get_icon("face-viewfinder") .. " FAKE", nil, nil, v181, v182, v183, 255);
                                        v184 = v184 + 42;
                                    end;
                                    if v30.misc.bars.skeetindstyle:get() == "Modern" and l_mode_0:get("Safe Points") and v23.safe:get() == "Force" then
                                        draw_500_(v184, ui.get_icon("shield") .. " SAFE", nil, nil, 255, 255, 255, 200);
                                        v184 = v184 + 42;
                                    end;
                                    if v30.misc.bars.skeetindstyle:get() == "Modern" and l_mode_0:get("Body Aim") and v23.body:get() == "Force" then
                                        draw_500_(v184, ui.get_icon("person") .. " BODY", nil, nil, 255, 255, 255, 200);
                                        v184 = v184 + 42;
                                    end;
                                    if v30.misc.bars.skeetindstyle:get() == "Modern" and l_mode_0:get("Fake Duck") and v23.fd:get() then
                                        draw_500_(v184, ui.get_icon("circle") .. " DUCK", nil, nil, 255, 255, 255, 200);
                                        v184 = v184 + 42;
                                    end;
                                    if v30.misc.bars.skeetindstyle:get() == "Modern" and l_mode_0:get("Damage Override") and v124.get_bind("Min. Damage")[1] then
                                        draw_500_(v184, ui.get_icon("crosshairs-simple") .. " MD", nil, nil, 255, 255, 255, 200);
                                        v184 = v184 + 42;
                                    end;
                                    if v30.misc.bars.skeetindstyle:get() == "Modern" and l_mode_0:get("Freestanding") and v23.fs:get_override() then
                                        draw_500_(v184, ui.get_icon("head-side-brain") .. " FS", nil, nil, 255, 255, 255, 200);
                                        v184 = v184 + 42;
                                    end;
                                    if v30.misc.bars.skeetindstyle:get() == "Modern" and l_mode_0:get("Hit/Miss") then
                                        draw_500_(v184, tostring(v123.percentage) .. "%", nil, nil, 255, 255, 255, 200);
                                        v184 = v184 + 42;
                                    end;
                                    if v30.misc.bars.skeetindstyle:get() == "Modern" and l_mode_0:get("Bomb Info") and v144 > 0 and not v145 then
                                        draw_500_(v184, v143 .. " - " .. string.format("%.1f", v144) .. "s              ", v123.bomb_image, nil, 255, 255, 255, 200);
                                        v184 = v184 + 42;
                                    end;
                                    if v30.misc.bars.skeetindstyle:get() == "Modern" and l_mode_0:get("Bomb Info") and v21.planting then
                                        draw_500_(v184, v21.planting_site .. "              ", v123.bomb_image, v21.fill / 3.125, 252, 243, 105, 255);
                                        v184 = v184 + 42;
                                    end;
                                    if v30.misc.bars.skeetindstyle:get() == "Modern" and l_mode_0:get("Bomb Info") and v165:is_alive() and v148 then
                                        draw_500_(v184, "FATAL", nil, nil, 255, 0, 50, 255);
                                        v184 = v184 + 42;
                                    end;
                                    if v30.misc.bars.skeetindstyle:get() == "Modern" and l_mode_0:get("Bomb Info") and v165:is_alive() and not v148 and v146 > 0.5 then
                                        draw_500_(v184, "-" .. v147 .. " HP", nil, nil, 252, 243, 105, 255);
                                        v184 = v184 + 42;
                                    end;
                                    if v30.misc.bars.skeetindstyle:get() == "Modern" and l_mode_0:get("Hitchance Override") and v124.get_bind("Hit Chance")[1] then
                                        draw_500_(v184, ui.get_icon("location-crosshairs-slash") .. " HC", nil, nil, 255, 255, 255, 200);
                                        v184 = v184 + 42;
                                    end;
                                    if v30.misc.bars.skeetindstyle:get() == "Modern" and l_mode_0:get("Hitbox Override") and v124.get_bind("Hitboxes")[1] then
                                        draw_500_(v184, ui.get_icon("person") .. " HITBOX OVR", nil, nil, 255, 255, 255, 200);
                                        v184 = v184 + 42;
                                    end;
                                end;
                                return;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v21 = {};
v21.reset = function()
    -- upvalues: v21 (ref)
    v21.planting = false;
    v21.fill = 0;
    v21.on_plant_time = 0;
    v21.planting_site = "";
end;
v21.bomb_beginplant = function(v201)
    -- upvalues: v21 (ref)
    local v202 = entity.get_player_resource();
    if v202 == nil then
        return;
    else
        v21.on_plant_time = globals.curtime;
        v21.planting = true;
        local l_m_bombsiteCenterA_0 = v202.m_bombsiteCenterA;
        local l_m_bombsiteCenterB_0 = v202.m_bombsiteCenterB;
        local v205 = entity.get(v201.userid, true):get_origin();
        v21.planting_site = v205:dist(l_m_bombsiteCenterA_0) < v205:dist(l_m_bombsiteCenterB_0) and "A" or "B";
        return;
    end;
end;
local l_mtools_1 = require("neverlose/mtools");
local l_aim_0 = require("neverlose/anti_aim");
local v208 = render.screen_size();
local v209 = {
    DT = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    DMG = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    PEEK = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    OSAA = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    SAFE = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
    BODY = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    FS = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding")
};
DesyncGet = function()
    local v210 = rage.antiaim:get_rotation(true);
    local v211 = rage.antiaim:get_rotation();
    local v212 = math.min(math.abs(v211 - v210) / 2, 60);
    return string.format("%.1f", v212);
end;
DrawIndicators = function(v213)
    -- upvalues: l_aim_0 (ref), v30 (ref), l_mtools_1 (ref), v208 (ref), v209 (ref)
    local v214 = entity.get_local_player();
    if v214 == nil or not v214:is_alive() then
        return;
    else
        local _ = {
            Inverter = l_aim_0.get_inverter_state()
        };
        local v216 = v30.misc.crosshair.crosshaircolor:get();
        local v217 = l_mtools_1.Animation:Lerp("Indicators", "Vector", v214.m_bIsScoped, vector(v208.x / 2, v208.y / 2 + 24 + v213), vector(v208.x / 2 + 39, v208.y / 2 + 24 + v213));
        render.text(2, v217, v216, "c", "OVERSENSE");
        local v218 = {
            IDEALTICK = l_mtools_1.Animation:Lerp("Indicators", "Anim.IDEALTICK", not v209.DT:get() or not v209.PEEK:get())
        };
        v218.DT = l_mtools_1.Animation:Lerp("Indicators", "Anim.DT", not v209.DT:get() or v218.IDEALTICK ~= 0);
        v218.PEEK = l_mtools_1.Animation:Lerp("Indicators", "Anim.PEEK", not v209.PEEK:get() or v218.IDEALTICK ~= 0);
        v218.OSAA = l_mtools_1.Animation:Lerp("Indicators", "Anim.HS", not v209.OSAA:get());
        render.text(2, v217 + vector(0, 5 + 4 * v218.IDEALTICK), color(255, 255, 255, 255 * v218.IDEALTICK), "c", "IDEALTICK");
        render.text(2, v217 + vector(0, 5 + 4 * v218.DT), color(255, 255, 255, 255 * v218.DT), "c", "DT");
        render.text(2, v217 + vector(0, 5 + 4 * v218.PEEK), color(255, 255, 255, 255 * v218.PEEK), "c", "PEEK");
        local v219 = l_mtools_1.Animation:Lerp("Indicators", "Anim.UP1", v218.IDEALTICK + v218.DT + v218.PEEK <= 0);
        render.text(2, v217 + vector(0, 5 + 9 * v219 + 4 * v218.OSAA), color(255, 255, 255, 255 * v218.OSAA), "c", "HIDE");
        local _ = v219 + v218.OSAA;
        return;
    end;
end;
events.render:set(function()
    -- upvalues: v30 (ref), l_mtools_1 (ref)
    local v221 = v30.misc.crosshair.style:get();
    local v222 = v30.misc.crosshair:get();
    local v223 = 0;
    if v222 then
        v223 = v30.misc.crosshair.offset:get() or 0;
    else
        v30.misc.crosshair.offset:set(0);
    end;
    if v222 and v221 == "Pixel" then
        l_mtools_1.Animation:Register("Indicators");
        l_mtools_1.Animation:Update("Indicators", 7.5);
        DrawIndicators(v223);
    end;
end);
calculate_distance = function(v224, v225, v226, v227, v228, v229)
    return math.ceil(math.sqrt(math.pow(v224 - v227, 2) + math.pow(v225 - v228, 2) + math.pow(v226 - v229, 2)));
end;
helper_get_dist = function(v230, v231)
    if not globals.is_in_game then
        return;
    elseif v230 == nil then
        return;
    elseif v231 == nil then
        return;
    else
        local v232 = v230:get_player_weapon();
        if v232 == nil then
            return;
        else
            local v233 = v232:get_weapon_index();
            if v233 == nil then
                return;
            else
                local l_m_vecOrigin_0 = v230.m_vecOrigin;
                local l_m_vecOrigin_1 = v231.m_vecOrigin;
                local v236 = calculate_distance(l_m_vecOrigin_0.x, l_m_vecOrigin_0.y, l_m_vecOrigin_0.z, l_m_vecOrigin_1.x, l_m_vecOrigin_1.y, l_m_vecOrigin_1.z);
                local v237 = v231.m_ArmorValue == 0;
                if v233 ~= 64 or not v237 then
                    return 0;
                elseif v236 < 585 and v236 > 511 then
                    return 1;
                elseif v236 < 511 then
                    return 2;
                else
                    return 0;
                end;
            end;
        end;
    end;
end;
helper_create_flag = esp.enemy:new_text("R8 Helper", "DMG+", function(v238)
    local v239 = entity.get_local_player();
    if not v239:is_alive() then
        return;
    else
        if v238 ~= nil and v238 ~= v239 then
            local v240 = helper_get_dist(v239, v238);
            local _ = helper_get_dist(v238, v239);
            if v240 ~= 0 and v240 ~= nil then
                if v240 == 1 then
                    return "DMG";
                else
                    return "DMG+";
                end;
            end;
        end;
        return;
    end;
end);
helper_create_line = function()
    if not globals.is_in_game then
        return;
    else
        local v242 = entity.get_local_player();
        if not v242:is_alive() then
            return;
        else
            local v243 = entity.get_players(true, false);
            for v244 = 1, #v243 do
                local v245 = v243[v244];
                if v245 ~= v242 and v245:is_alive() and v245 ~= nil and v245 ~= v242 then
                    local v246 = helper_get_dist(v245, v242);
                    if v246 ~= 0 and v246 ~= nil then
                        local v247 = render.world_to_screen(v245:get_hitbox_position(4));
                        if v247 == nil then
                            return;
                        else
                            render.line(v247, vector(render.screen_size().x / 2, render.screen_size().y), color(255, 11, 11, 255));
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
helper_setup = function()
    -- upvalues: v30 (ref)
    if v30.misc.revolver:get() then
        helper_create_flag:set(true);
        helper_create_line();
    end;
end;
events.render:set(helper_setup);
localplayer_transparency = function()
    -- upvalues: v30 (ref)
    local v248 = entity.get_local_player();
    if v248 == nil or not v248:is_alive() then
        return;
    elseif v30.misc.bars.keep_model_transparency:get() then
        return (not not v248.m_bIsScoped or v248.m_bResumeZoom) and 100 or 255;
    else
        return;
    end;
end;
events.localplayer_transparency:set(localplayer_transparency);
local _ = {
    head = 0, 
    neck = 1, 
    pelvis = 2, 
    stomach = 3, 
    lower_chest = 4, 
    chest = 5, 
    upper_chest = 6, 
    left_thigh = 7, 
    right_thigh = 8, 
    left_calf = 9, 
    right_calf = 10, 
    left_foot = 11, 
    right_foot = 12, 
    left_hand = 13, 
    right_hand = 14, 
    left_upper_arm = 15, 
    left_forearm = 16, 
    right_upper_arm = 17, 
    right_forearm = 18
};
local v342 = new_class():struct("consts")({
    WEAPONTYPE_HEALTHSHOT = 11, 
    WEAPONTYPE_GRENADE = 9, 
    WEAPONTYPE_TASER = 8, 
    WEAPONTYPE_C4 = 7, 
    WEAPONTYPE_MACHINEGUN = 6, 
    WEAPONTYPE_SNIPER_RIFLE = 5, 
    WEAPONTYPE_SHOTGUN = 4, 
    WEAPONTYPE_RIFLE = 3, 
    WEAPONTYPE_SUBMACHINEGUN = 2, 
    WEAPONTYPE_PISTOL = 1, 
    WEAPONTYPE_KNIFE = 0, 
    WEAPONTYPE_UNKNOWN = -1, 
    hbox_radius = {
        [1] = 4.2, 
        [2] = 3.5, 
        [3] = 6, 
        [4] = 6, 
        [5] = 6.5, 
        [6] = 6.2, 
        [7] = 5, 
        [8] = 5, 
        [9] = 5, 
        [10] = 4, 
        [11] = 4, 
        [12] = 3.6, 
        [13] = 3.7, 
        [14] = 4, 
        [15] = 4, 
        [16] = 3.3, 
        [17] = 3, 
        [18] = 3.3, 
        [19] = 3
    }, 
    hbox_factor = {
        [1] = 0.5, 
        [2] = 0.1, 
        [3] = 0.8, 
        [4] = 0.8, 
        [5] = 0.7, 
        [6] = 0.7, 
        [7] = 0.7, 
        [8] = 0.5, 
        [9] = 0.5, 
        [10] = 0.5, 
        [11] = 0.5, 
        [12] = 0.4, 
        [13] = 0.4, 
        [14] = 0.4, 
        [15] = 0.4, 
        [16] = 0.5, 
        [17] = 0.5, 
        [18] = 0.5, 
        [19] = 0.5
    }, 
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
    }
}):struct("aimbot_shot")({}):struct("variables")({
    hbox_state = {
        [1] = false, 
        [2] = false, 
        [3] = false, 
        [4] = false, 
        [5] = false, 
        [6] = false, 
        [7] = false, 
        [8] = false, 
        [9] = false, 
        [10] = false, 
        [11] = false, 
        [12] = false, 
        [13] = false, 
        [14] = false, 
        [15] = false, 
        [16] = false, 
        [17] = false, 
        [18] = false, 
        [19] = false
    }, 
    is_reachable = {}, 
    initialize = function(v250, v251)
        -- upvalues: v28 (ref), v30 (ref)
        v250.cmd = v251;
        v250.lp = entity.get_local_player();
        v250.eyepos = v250.lp:get_eye_position();
        v250.weapon = v250.lp:get_player_weapon();
        v250.weapon_info = v250.weapon:get_weapon_info();
        v250.weapon_type = v250.weapon_info.weapon_type;
        v250.range_modifier = v250.weapon_info.range_modifier;
        v250.armor_resist = 1 - v250.weapon_info.armor_ratio * 0.5;
        v250.camera_position = render.camera_position();
        v250.camera_direction = vector():angles(render.camera_angles());
        v250.mindmg = v28.min_damage_ui:get();
        v250.minhc = v30.misc.dormantaim.hitchanceda:get();
        v250.dmg_is_wrong = false;
    end
}):struct("aimbot")({
    get_hitgroup_index = function(_, v253)
        if v253 == 1 then
            return 1;
        elseif v253 == 2 then
            return 8;
        elseif v253 >= 3 and v253 <= 4 then
            return 3;
        elseif v253 >= 5 and v253 <= 7 then
            return 2;
        elseif v253 >= 8 and v253 <= 13 then
            if v253 % 2 == 0 then
                return 6;
            else
                return 7;
            end;
        elseif v253 >= 14 and v253 <= 19 then
            if v253 % 2 == 1 then
                return 4;
            else
                return 5;
            end;
        else
            return 0;
        end;
    end, 
    get_hitgroup_name = function(v254, v255)
        return v254.consts.hitgroup_str[v254:get_hitgroup_index(v255)];
    end, 
    get_damage_multiplier = function(v256, v257)
        local v258 = v256:get_hitgroup_name(v257);
        if v258 == "head" then
            return 4;
        elseif v258 == "stomach" then
            return 1.25;
        elseif v258 == "left leg" or v258 == "right leg" then
            return 0.75;
        else
            return 1;
        end;
    end, 
    get_weighted_damage = function(v259, v260, v261)
        local v262 = v259:get_hitgroup_name(v260);
        if v262 == "head" or v262 == "neck" then
            return v261 * 0.125;
        elseif v262 == "legs" then
            return v261 * 0.25;
        elseif v262 == "chest" then
            return v261 * 0.67;
        elseif v262 == "stomach" then
            return v261;
        else
            return 0;
        end;
    end, 
    get_hbox_radius = function(v263, v264)
        if v264 == nil then
            return 0;
        else
            return v263.consts.hbox_radius[v264] * v263.consts.hbox_factor[v264];
        end;
    end, 
    calculate_hc = function(v265, v266, v267, v268)
        if v266 < 1.0E-6 then
            return 1;
        else
            local v269 = v265.variables.eyepos:dist(v267) * math.tan(v266 * 0.5);
            return math.min(v268 * v268 / (v269 * v269), 1);
        end;
    end, 
    max_hc = function(v270, v271, v272)
        -- upvalues: v30 (ref)
        if v270.variables.weapon_type == v270.consts.WEAPONTYPE_SNIPER_RIFLE and (v30.misc.dormantaim.autoscopeda:get() or v270.variables.lp.m_bIsScoped) then
            if v270.variables.cmd.in_duck == 1 then
                return v270:calculate_hc(v270.variables.weapon_info.inaccuracy_crouch_alt, v271, v272);
            else
                return v270:calculate_hc(v270.variables.weapon_info.inaccuracy_stand_alt, v271, v272);
            end;
        elseif v270.variables.cmd.in_duck == 1 then
            return v270:calculate_hc(v270.variables.weapon_info.inaccuracy_crouch, v271, v272);
        else
            return v270:calculate_hc(v270.variables.weapon_info.inaccuracy_stand, v271, v272);
        end;
    end, 
    sign = function(_, v274)
        return v274 >= 0 and 1 or -1;
    end, 
    vector_ratio = function(v275, v276, v277)
        local v278 = nil;
        if v275:sign(v276.x) == v275:sign(v277.x) and v275:sign(v276.y) == v275:sign(v277.y) and v275:sign(v276.z) == v275:sign(v277.z) then
            v278 = false;
        elseif v275:sign(v276.x) ~= v275:sign(v277.x) and v275:sign(v276.y) ~= v275:sign(v277.y) and v275:sign(v276.z) ~= v275:sign(v277.z) then
            v278 = true;
        else
            return nil;
        end;
        v276 = vector(math.abs(v276.x), math.abs(v276.y), math.abs(v276.z));
        v277 = vector(math.abs(v277.x), math.abs(v277.y), math.abs(v277.z));
        local v279 = (v276.x - 0.05) / (v277.x + 0.05);
        local v280 = (v276.x + 0.05) / (v277.x - 0.05);
        local v281 = (v276.y - 0.05) / (v277.y + 0.05);
        local v282 = (v276.y + 0.05) / (v277.y - 0.05);
        local v283 = (v276.z - 0.05) / (v277.z + 0.05);
        local v284 = (v276.z + 0.05) / (v277.z - 0.05);
        local v285 = math.max(v279, v281, v283);
        local v286 = math.min(v280, v282, v284);
        if v285 <= v286 then
            local v287 = v285 + (v286 - v285) * 0.5;
            local v288;
            if not -v287 or not v278 then
                v288 = v287;
            else
                v288 = v278;
            end;
            return v288;
        else
            return nil;
        end;
    end, 
    calc_true_damage = function(v289, v290, v291, v292, v293)
        local v294, v295 = utils.trace_bullet(v289.variables.lp, v289.variables.eyepos, v291);
        if v294 == 0 then
            local v296 = v289:vector_ratio(v291 - v289.variables.eyepos, v295.end_pos - v289.variables.eyepos);
            if v296 ~= nil and v296 < 1 then
                return -1;
            end;
        end;
        if v295.hitgroup == 0 and v294 > 0 then
            local v297 = v291:dist(v295.end_pos);
            v294 = v294 * v289:get_damage_multiplier(v290) / math.pow(v289.variables.range_modifier, v297 / 500);
            if v293 and v290 == 1 or v292 > 0 and (v290 <= 7 or v290 >= 14) then
                local v298 = v294 * v289.variables.armor_resist;
                v294 = v294 - math.min(v298, 2 * v292);
            end;
        end;
        return v294;
    end, 
    choose_hbox = function(v299, v300)
        local v301 = v300:get_index();
        v299.variables.is_reachable[v301] = false;
        local v302 = nil;
        local v303 = 0;
        for v304 = 1, #v299.variables.hbox_state do
            if v299.variables.hbox_state[v304] then
                local v305 = v300:get_hitbox_position(v304 - 1);
                dmg = v299:calc_true_damage(v304, v305, v300.m_ArmorValue, v300.m_bHasHelmet);
                local v306 = dmg == -1;
                if v306 then
                    dmg = v299.variables.weapon_info.damage;
                end;
                if dmg > 0 then
                    v299.variables.is_reachable[v301] = true;
                end;
                local v307 = v299:max_hc(v305, v299:get_hbox_radius(v304));
                if dmg >= v299.variables.mindmg and 100 * v307 >= v299.variables.minhc then
                    local v308 = v299:get_weighted_damage(v304, dmg);
                    if v303 < v308 then
                        v302 = v304;
                        v303 = v308;
                        v299.variables.dmg = dmg;
                        v299.variables.dmg_is_wrong = v306;
                    end;
                end;
            end;
        end;
        return v302;
    end, 
    lp_check = function(_)
        if not globals.is_connected then
            return false;
        elseif not globals.is_in_game then
            return false;
        else
            return true;
        end;
    end, 
    target_check = function(v310, v311)
        if v311 == nil then
            return false;
        elseif not v311.m_bConnected == 1 then
            return false;
        elseif not v311:is_alive() then
            return false;
        elseif v311:get_network_state() == 0 then
            return false;
        elseif v311:get_bbox().alpha < 0.4 then
            return false;
        elseif v310:choose_hbox(v311) == nil then
            return false;
        else
            return true;
        end;
    end, 
    weapon_check = function(v312, v313)
        if v312.variables.weapon == nil then
            return false;
        elseif v312.variables.weapon_type == nil or v312.variables.weapon_type == v312.consts.WEAPONTYPE_KNIFE or v312.variables.weapon_type >= v312.consts.WEAPONTYPE_C4 then
            return false;
        elseif v312.variables.weapon:get_weapon_reload() ~= -1 then
            return false;
        elseif v312.variables.lp:get_origin():dist(v313:get_origin()) > v312.variables.weapon_info.range then
            return false;
        elseif v312.variables.weapon.m_flNextPrimaryAttack > globals.curtime then
            return false;
        else
            return true;
        end;
    end, 
    choose_target = function(v314)
        local v315 = entity.get_players(true);
        local v316 = nil;
        local l_huge_0 = math.huge;
        for _, v319 in ipairs(v315) do
            if v314:lp_check() and v314:weapon_check(v319) and v314:target_check(v319) then
                local v320 = v319:get_origin():dist_to_ray(v314.variables.camera_position, v314.variables.camera_direction);
                if v320 < l_huge_0 then
                    l_huge_0 = v320;
                    v316 = v319;
                end;
            end;
        end;
        return v316;
    end, 
    autostop = function(v321)
        local v322 = math.sqrt(v321.variables.cmd.forwardmove * v321.variables.cmd.forwardmove + v321.variables.cmd.sidemove * v321.variables.cmd.sidemove);
        local v323 = v321.variables.lp.m_bIsScoped and v321.variables.weapon_info.max_player_speed_alt or v321.variables.weapon_info.max_player_speed;
        if v323 > 0 and v322 > 0 then
            if not v321.variables.cmd.in_duck then
                v323 = v323 * 0.33;
            end;
            if v323 < v322 then
                local v324 = v323 / v322;
                v321.variables.cmd.forwardmove = v321.variables.cmd.forwardmove * v324;
                v321.variables.cmd.sidemove = v321.variables.cmd.sidemove * v324;
            end;
        end;
    end, 
    autoscope = function(v325)
        if not v325.variables.lp.m_bIsScoped then
            v325.variables.cmd.in_attack2 = true;
        end;
    end, 
    run = function(v326, v327)
        -- upvalues: v30 (ref), v39 (ref)
        if not v30.misc.dormantaim:get() then
            return;
        elseif not v326:lp_check() then
            return;
        else
            if v326.aimbot_shot.tickcount ~= nil and globals.tickcount - v326.aimbot_shot.tickcount > 1 and not v326.aimbot_shot.handled then
                if v30.misc.dormantaim.logsda:get() then
                    print_raw((v39 .. "[Dormant Aimbot]" .. v39 .. " Missed %s(%d%s) in %s for %d damage"):format(v326.aimbot_shot.victim:get_name(), v326.aimbot_shot.hitchance, "%", v326.aimbot_shot.hitgroup, v326.aimbot_shot.damage));
                    print_dev((v39 .. "[Dormant Aimbot]" .. v39 .. " Missed %s(%d%s) in %s for %d damage"):format(v326.aimbot_shot.victim:get_name(), v326.aimbot_shot.hitchance, "%", v326.aimbot_shot.hitgroup, v326.aimbot_shot.damage));
                end;
                v326.aimbot_shot.handled = true;
            end;
            v326.variables:initialize(v327);
            local v328 = v326:choose_target();
            if v328 == nil then
                return;
            else
                local v329 = v326:choose_hbox(v328);
                local v330 = v328:get_hitbox_position(v329 - 1);
                local v331 = v326.variables.eyepos:to(v330):angles();
                if v30.misc.dormantaim.autostopda:get() then
                    v326:autostop();
                end;
                if v30.misc.dormantaim.autoscopeda:get() then
                    v326:autoscope();
                end;
                local v332 = nil;
                if v326.variables.weapon_info.is_revolver then
                    if v326.variables.cmd.in_duck == 1 then
                        v332 = v326:calculate_hc(v326.variables.weapon:get_inaccuracy() * 0.2, v330, v326:get_hbox_radius(v329));
                    else
                        v332 = v326:calculate_hc(v326.variables.weapon:get_inaccuracy() * 0.166, v330, v326:get_hbox_radius(v329));
                    end;
                else
                    v332 = v326:calculate_hc(v326.variables.weapon:get_inaccuracy(), v330, v326:get_hbox_radius(v329));
                end;
                if 100 * v332 >= v326.variables.minhc then
                    v326.variables.cmd.view_angles = v331;
                    v326.variables.cmd.in_attack = true;
                    v326.aimbot_shot.tickcount = globals.tickcount;
                    v326.aimbot_shot.victim = v328;
                    v326.aimbot_shot.hitchance = 100 * v332;
                    v326.aimbot_shot.hitgroup = v326:get_hitgroup_name(v329);
                    v326.aimbot_shot.damage = v326.variables.dmg_is_wrong and -1 or v326.variables.dmg;
                    v326.aimbot_shot.handled = false;
                end;
                return;
            end;
        end;
    end, 
    update_hboxes = function(v333)
        -- upvalues: v30 (ref)
        local v334 = v30.misc.dormantaim.hitboxesda:get();
        local v335 = {
            Head = false, 
            Chest = false, 
            Stomach = false, 
            Legs = false
        };
        for _, v337 in ipairs(v334) do
            v335[v337] = true;
        end;
        for _ = 1, 1 do
            v333.variables.hbox_state[1] = v335.Head;
        end;
        for v339 = 5, 7 do
            v333.variables.hbox_state[v339] = v335.Chest;
        end;
        for v340 = 3, 4 do
            v333.variables.hbox_state[v340] = v335.Stomach;
        end;
        for v341 = 8, 11 do
            v333.variables.hbox_state[v341] = v335.Legs;
        end;
    end
});
v342.aimbot:update_hboxes();
events.createmove:set(function(v343)
    -- upvalues: v342 (ref)
    v342.aimbot:run(v343);
end);
v30.misc.dormantaim.hitboxesda:set_callback(function()
    -- upvalues: v342 (ref)
    v342.aimbot:update_hboxes();
end);
local _ = esp.enemy:new_text("Dormant Aimbot", "DA", function(v344)
    -- upvalues: v30 (ref), v342 (ref)
    if v30.misc.dormantaim:get() and v342.variables.is_reachable[v344:get_index()] and v344:get_network_state() ~= 0 and v344:get_network_state() ~= 5 then
        return "DA";
    else
        return;
    end;
end);
events.player_hurt:set(function(v346)
    -- upvalues: v342 (ref), v30 (ref), v39 (ref)
    local l_tickcount_0 = v342.aimbot_shot.tickcount;
    if l_tickcount_0 == nil then
        return;
    else
        if globals.tickcount - l_tickcount_0 == 1 and entity.get(v346.attacker, true) == v342.variables.lp then
            local v348 = entity.get(v346.userid, true);
            local v349 = v342.consts.hitgroup_str[v346.hitgroup];
            if v30.misc.dormantaim.logsda:get() then
                print_raw((v39 .. "[Dormant Aimbot]" .. v39 .. " Hit %s(%d%s) in %s(%s) for %d(%d) damage (%d health remaining)"):format(v348:get_name(), v342.aimbot_shot.hitchance, "%", v349, v342.aimbot_shot.hitgroup, v346.dmg_health, v342.aimbot_shot.damage, v346.health));
                print_dev((v39 .. "[Dormant Aimbot]" .. v39 .. " Hit %s(%d%s) in %s(%s) for %d(%d) damage (%d health remaining)"):format(v348:get_name(), v342.aimbot_shot.hitchance, "%", v349, v342.aimbot_shot.hitgroup, v346.dmg_health, v342.aimbot_shot.damage, v346.health));
            end;
            v342.aimbot_shot.handled = true;
        end;
        return;
    end;
end);
local v353 = {
    handel = function(v350)
        -- upvalues: v30 (ref)
        local v351 = entity.get_local_player();
        if v351 == nil then
            return;
        elseif not v30.antiaim.ladder_select:get() then
            return;
        else
            local _ = render.camera_angles();
            if v351.m_MoveType == 9 and common.is_button_down(87) and v30.antiaim.ladder_select:get() then
                v350.view_angles.y = math.floor(v350.view_angles.y + 0.5);
                v350.roll = 0;
                if v350.view_angles.x < 45 then
                    v350.view_angles.x = 89;
                    v350.in_moveright = 1;
                    v350.in_moveleft = 0;
                    v350.in_forward = 0;
                    v350.in_back = 1;
                    if v350.sidemove == 0 then
                        v350.view_angles.y = v350.view_angles.y + 90;
                    end;
                    if v350.sidemove < 0 then
                        v350.view_angles.y = v350.view_angles.y + 150;
                    end;
                    if v350.sidemove > 0 then
                        v350.view_angles.y = v350.view_angles.y + 30;
                    end;
                end;
            end;
            if v351.m_MoveType == 9 and common.is_button_down(83) and v30.antiaim.ladder_select:get() then
                v350.view_angles.y = math.floor(v350.view_angles.y - 0.5);
                v350.roll = 0;
                if v350.view_angles.x < 45 then
                    v350.view_angles.x = 89;
                    v350.in_moveleft = 1;
                    v350.in_moveright = 0;
                    v350.in_forward = 1;
                    v350.in_back = 0;
                    if v350.sidemove == 0 then
                        v350.view_angles.y = v350.view_angles.y + 90;
                    end;
                    if v350.sidemove > 0 then
                        v350.view_angles.y = v350.view_angles.y + 150;
                    end;
                    if v350.sidemove < 0 then
                        v350.view_angles.y = v350.view_angles.y + 30;
                    end;
                end;
            end;
            return;
        end;
    end
};
events.createmove:set(function(v354)
    -- upvalues: v353 (ref)
    v353.handel(v354);
end);
nofalldamage = function(v355)
    -- upvalues: v30 (ref)
    if not v30.antiaim.nofalldamage:get() then
        return;
    else
        local v356 = entity.get_local_player();
        local v357 = v356:get_origin();
        if v356.m_vecVelocity.z <= -500 then
            if utils.trace_line(vector(v357.x, v357.y, v357.z), vector(v357.x, v357.y, v357.z - 15)).fraction ~= 1 then
                v355.in_duck = 0;
            elseif utils.trace_line(vector(v357.x, v357.y, v357.z), vector(v357.x, v357.y, v357.z - 50)).fraction ~= 1 then
                v355.in_duck = 1;
            end;
        end;
        return;
    end;
end;
events.createmove:set(function(v358)
    -- upvalues: v30 (ref)
    local v359 = entity.get_local_player();
    if not v359 then
        return;
    elseif not v359:is_alive() then
        return;
    else
        if v30.antiaim.nofalldamage:get() then
            nofalldamage(v358);
        end;
        return;
    end;
end);
local function v361(_)
    -- upvalues: v30 (ref)
    v30.misc.mindmg.damage_position_x:visibility(false);
    v30.misc.mindmg.damage_position_y:visibility(false);
    v30.misc.animbreakers.jittervalue1:visibility(false);
end;
v361(true);
events.createmove:set(function(_)
    -- upvalues: v361 (ref)
    v361(some_logic_here);
end);
calculate_distance = function(v363, v364, v365, v366, v367, v368)
    return math.ceil(math.sqrt(math.pow(v363 - v366, 2) + math.pow(v364 - v367, 2) + math.pow(v365 - v368, 2)));
end;
local v369 = {
    Default = 1, 
    Pixel = 2, 
    Tahoma = 3, 
    Bold = 4
};
local v373 = l_system_0.register({
    [1] = v30.misc.mindmg.damage_position_x, 
    [2] = v30.misc.mindmg.damage_position_y
}, vector(15, 15), "drag", function(v370)
    -- upvalues: v30 (ref), v12 (ref), v369 (ref)
    local v371 = entity.get_local_player();
    if not v371 or not v371:is_alive() then
        return;
    elseif not v30.misc.mindmg:get() then
        return;
    else
        local v372 = v12:get() == 0 and "AUTO" or v12:get();
        if ui.get_alpha() > 0.1 then
            render.text(v369[v30.misc.mindmg.damage_font:get()], vector(v370.position.x, v370.position.y), color(v30.misc.mindmg.damage_color:get().r, v30.misc.mindmg.damage_color:get().g, v30.misc.mindmg.damage_color:get().b, 255), "ac", v372);
            render.rect_outline(vector(v370.position.x - 10, v370.position.y - 8), vector(v370.position.x + 10, v370.position.y + 10), color(255, 255, 255, 150), 1, 5, false);
        else
            render.text(v369[v30.misc.mindmg.damage_font:get()], vector(v370.position.x, v370.position.y), color(v30.misc.mindmg.damage_color:get().r, v30.misc.mindmg.damage_color:get().g, v30.misc.mindmg.damage_color:get().b, 255), "ac", v372);
        end;
        return;
    end;
end);
events.render:set(function()
    -- upvalues: v373 (ref)
    v373:update();
end);
local function v379()
    -- upvalues: v30 (ref)
    local v374 = entity.get_local_player();
    if not v374 or not v374:is_alive() then
        return;
    else
        local v375 = v374:get_player_weapon(true);
        for _, v377 in ipairs(v375) do
            local v378 = v377:get_classname();
            if (v378 == "CMolotovGrenade" or v378 == "CIncendiaryGrenade") and v30.misc.grenades.selectnades:get(1) then
                utils.execute_after(0.23, function()
                    utils.console_exec("use weapon_molotov; use weapon_incgrenade;drop");
                end);
            end;
            if v378 == "CSmokeGrenade" and v30.misc.grenades.selectnades:get(2) then
                utils.execute_after(0.25, function()
                    utils.console_exec("use weapon_smokegrenade;drop");
                end);
            end;
            if v378 == "CHEGrenade" and v30.misc.grenades.selectnades:get(3) then
                utils.execute_after(0.27, function()
                    utils.console_exec("use weapon_hegrenade;drop");
                end);
            end;
        end;
        return;
    end;
end;
events.render:set(function()
    -- upvalues: v30 (ref), v379 (ref)
    if v30.misc.grenades.nadehotkey:get() and not key_click_cache then
        v379();
    end;
    key_click_cache = v30.misc.grenades.nadehotkey:get();
end);
local v380 = 9;
local v381 = 0.3;
local function v388(v382, v383, v384, v385)
    -- upvalues: v381 (ref)
    local v386 = math.clamp(v383, 15, 750);
    local v387 = math.clamp(v384, 0, 1);
    v386 = v386 * lerp(v381, 1, v387);
    return (vector():angles(v382) * v386 - v385):angles();
end;
local function v393(_)
    -- upvalues: v30 (ref), v380 (ref), v388 (ref)
    if v30.misc.grenades.nades:get(4) then
        if render.camera_angles() ~= cmd.view_angles:clone() then
            return;
        else
            local v390 = entity.get_local_player();
            if v390 == nil then
                return;
            else
                local v391 = v390:get_player_weapon();
                if v391 == nil then
                    return;
                else
                    local v392 = v391:get_weapon_info();
                    if v392 == nil then
                        return;
                    elseif v392.weapon_type == v380 and globals.curtime - to_time(globals.clock_offset) < v391.m_fThrowTime then
                        cmd.in_speed = true;
                        cmd.view_angles = v388(render.camera_angles(), v392.throw_velocity, v391.m_flThrowStrength, v390.m_vecVelocity);
                    end;
                end;
            end;
        end;
    end;
end;
local function v398(v394)
    -- upvalues: v30 (ref), v388 (ref)
    local v395 = entity.get_local_player();
    if v395 == nil then
        return;
    elseif not v30.misc.grenades.nades:get(4) then
        return;
    else
        local v396 = v395:get_player_weapon();
        if v396 == nil then
            return;
        else
            local v397 = v396:get_weapon_info();
            if v397 == nil then
                return;
            else
                v394.angles = v388(v394.angles, v397.throw_velocity, v396.m_flThrowStrength, v394.velocity);
                return;
            end;
        end;
    end;
end;
events.grenade_override_view:set(function(v399)
    -- upvalues: v398 (ref)
    v398(v399);
end);
events.super_toss:set(function(v400)
    -- upvalues: v393 (ref)
    v393(v400);
end);
local function v405(v401)
    -- upvalues: v30 (ref)
    local v402 = entity.get_local_player();
    if v402 == nil or not v402:is_alive() then
        return;
    else
        local v403 = v402:get_player_weapon();
        if v403 == nil then
            return;
        else
            local v404 = v403:get_weapon_index();
            if not v404 == 44 or not v404 == 46 then
                return;
            else
                if v30.misc.grenades.nades:get(3) and v403.m_bPinPulled and v401.damage > v30.misc.grenades.realese32:get() then
                    utils.console_exec("+attack");
                    utils.execute_after(0.1, function()
                        utils.console_exec("-attack");
                    end);
                end;
                return;
            end;
        end;
    end;
end;
events.grenade_prediction:set(function(v406)
    -- upvalues: v405 (ref)
    v405(v406);
end);
sosali_hui = function()
    -- upvalues: v30 (ref)
    local v407, _ = v30.misc.pingunlocker:get();
    if v407 then
        cvar.sv_maxunlag:float(0.4);
    else
        cvar.sv_maxunlag:float(0.2);
    end;
end;
events.render:set(function()
    sosali_hui();
end);
interpolations = function()
    -- upvalues: v30 (ref)
    local v409, _ = v30.antiaim.forceinterpolation:get();
    if v409 then
        cvar.cl_interp:float(0.015625);
    else
        cvar.cl_interp:float(0);
    end;
end;
events.render:set(function()
    interpolations();
end);
aspectratio = function()
    -- upvalues: v30 (ref), l_anim_0 (ref)
    if v30.misc.aspect:get() then
        cvar.r_aspectratio:float(v30.misc.aspect:get() and l_anim_0 and v30.misc.aspect.val:get() / 100 or 0);
    else
        cvar.r_aspectratio:float(0);
    end;
end;
v30.misc.aspect:set_callback(aspectratio);
aspectratio();
v30.misc.aspect.val:set_callback(function(v411)
    -- upvalues: v30 (ref)
    if v30.misc.aspect:get() then
        cvar.r_aspectratio:float(v411:get(10) / 100);
    end;
end);
v30.misc.aspect.pre1:set_callback(function()
    -- upvalues: v30 (ref)
    v30.misc.aspect.val:set(160);
end);
v30.misc.aspect.pre2:set_callback(function()
    -- upvalues: v30 (ref)
    v30.misc.aspect.val:set(178);
end);
v30.misc.aspect.pre3:set_callback(function()
    -- upvalues: v30 (ref)
    v30.misc.aspect.val:set(125);
end);
v30.misc.aspect.pre4:set_callback(function()
    -- upvalues: v30 (ref)
    v30.misc.aspect.val:set(133);
end);
v30.misc.aspect.pre5:set_callback(function()
    -- upvalues: v30 (ref)
    v30.misc.aspect.val:set(150);
end);
viewmodelm = function()
    -- upvalues: v30 (ref)
    if v30.misc.viewmodel:get(11) then
        cvar.viewmodel_fov:float(v30.misc.viewmodel.fov:get(11) and v30.misc.viewmodel.fov:get(11) or 68, true);
        cvar.viewmodel_offset_x:float(v30.misc.viewmodel.x_axis:get() and v30.misc.viewmodel.x_axis:get(11) / 10 or 2.5, true);
        cvar.viewmodel_offset_y:float(v30.misc.viewmodel.y_axis:get() and v30.misc.viewmodel.y_axis:get(11) / 10 or 0, true);
        cvar.viewmodel_offset_z:float(v30.misc.viewmodel.z_axis:get() and v30.misc.viewmodel.z_axis:get(11) / 10 or -1.5, true);
    end;
end;
v30.misc.viewmodel:set_callback(viewmodelm);
viewmodelm();
v30.misc.viewmodel.fov:set_callback(function(v412)
    -- upvalues: v30 (ref)
    if v30.misc.viewmodel:get() then
        cvar.viewmodel_fov:float(v412:get(), true);
    end;
end);
v30.misc.viewmodel.x_axis:set_callback(function(v413)
    -- upvalues: v30 (ref)
    if v30.misc.viewmodel:get() then
        cvar.viewmodel_offset_x:float(v413:get() / 10, true);
    end;
end);
v30.misc.viewmodel.y_axis:set_callback(function(v414)
    -- upvalues: v30 (ref)
    if v30.misc.viewmodel:get() then
        cvar.viewmodel_offset_y:float(v414:get() / 10, true);
    end;
end);
v30.misc.viewmodel.z_axis:set_callback(function(v415)
    -- upvalues: v30 (ref)
    if v30.misc.viewmodel:get() then
        cvar.viewmodel_offset_z:float(v415:get() / 10, true);
    end;
end);
v30.misc.viewmodel:set_callback(function(v416)
    -- upvalues: v30 (ref)
    if not v416:get() then
        cvar.viewmodel_fov:float(68, true);
        cvar.viewmodel_offset_x:float(2.5, true);
        cvar.viewmodel_offset_y:float(0, true);
        cvar.viewmodel_offset_z:float(-1.5, true);
    else
        cvar.r_aspectratio:float(v30.misc.aspect:get() and v30.misc.aspect.val:get() / 100 or 0);
        cvar.viewmodel_fov:float(v30.misc.viewmodel:get() and v30.misc.viewmodel.fov:get() or 68, true);
        cvar.viewmodel_offset_x:float(v30.misc.viewmodel:get() and v30.misc.viewmodel.x_axis:get() / 10 or 2.5, true);
        cvar.viewmodel_offset_y:float(v30.misc.viewmodel:get() and v30.misc.viewmodel.y_axis:get() / 10 or 0, true);
        cvar.viewmodel_offset_z:float(v30.misc.viewmodel:get() and v30.misc.viewmodel.z_axis:get() / 10 or -1.5, true);
    end;
end);
builder = function(_)
    -- upvalues: v31 (ref), v30 (ref), v27 (ref), v32 (ref), l_pui_0 (ref), v39 (ref), v33 (ref), v29 (ref), v34 (ref)
    v31.enable = v30.antiaim.enable:depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v30.antiaim.enable
    });
    v31.conditions = v30.antiaim.conditions;
    for v418 = 1, #v27.cond do
        v32[v418] = {
            yaw = l_pui_0.create(v39 .. ui.get_icon("shield"), "General / " .. v39 .. v27.cond[v418], 2), 
            sliders = l_pui_0.create(v39 .. ui.get_icon("shield"), "Yaw / " .. v39 .. v27.cond[v418], 2), 
            bodyyaw = l_pui_0.create(v39 .. ui.get_icon("shield"), "Body yaw / " .. v39 .. v27.cond[v418], 2), 
            defensivetab = l_pui_0.create(v39 .. ui.get_icon("shield"), "\n\n  " .. v39 .. v27.cond[v418], 1)
        };
        v33[v418] = {
            enable = v29.states:switch(v39 .. "\rOverride " .. v39 .. v27.cond[v418]), 
            yaw = v32[v418].yaw:combo(v39 .. "\f<arrow-right-arrow-left>  \rYaw", {
                [1] = "Backward"
            }), 
            modifier = v32[v418].yaw:combo(v39 .. "\f<arrows-spin>  \rModifier", {
                [1] = "Disabled", 
                [2] = "Center", 
                [3] = "Offset", 
                [4] = "Random", 
                [5] = "3-Way", 
                [6] = "5-Way"
            }), 
            bodyyaw = v32[v418].bodyyaw:switch(v39 .. "\f<arrows-to-eye>  \rBody Yaw"), 
            defensive = v32[v418].defensivetab:switch(v39 .. "\f<eye-low-vision>  \rDefensive Anti-Aim"), 
            breaklc = v32[v418].defensivetab:switch(v39 .. "\f<chart-mixed>  \rForce LC")
        };
        local v419 = {
            yaw = v33[v418].yaw:create(), 
            modifier = v33[v418].modifier:create(), 
            bodyyaw = v33[v418].bodyyaw:create(), 
            defensive = v33[v418].defensive:create()
        };
        v34[v418] = {
            mode = v419.yaw:combo(v39 .. "Mode", {
                [1] = "Static", 
                [2] = "Left & Right"
            }), 
            static = v32[v418].sliders:slider(v39 .. "Static", -180, 180, 0, nil, "\194\176"), 
            left = v32[v418].sliders:slider(v39 .. "\226\136\188  \rLeft", -180, 180, 0, nil, "\194\176"), 
            right = v32[v418].sliders:slider(v39 .. "\226\136\188  \rRight", -180, 180, 0, nil, "\194\176"), 
            modmode = v419.modifier:combo(v39 .. "Mode", {
                [1] = "Static", 
                [2] = "Left & Right"
            }), 
            modstatic = v419.modifier:slider(v39 .. "Static", -180, 180, 0, nil, "\194\176"), 
            modleft = v419.modifier:slider(v39 .. "\226\136\188  \rLeft", -180, 180, 0, nil, "\194\176"), 
            modright = v419.modifier:slider(v39 .. "\226\136\188  \rRight", -180, 180, 0, nil, "\194\176"), 
            modrandom3way = v419.modifier:slider(v39 .. "\f<bolt>  \rRandomization", 0, 180, 0, nil, "\194\176"), 
            modrandom5way = v419.modifier:slider(v39 .. "\f<bolt>  \rRandomization", 0, 180, 0, nil, "\194\176"), 
            options = v419.bodyyaw:selectable("Options", {
                [1] = "Avoid Overlap", 
                [2] = "Jitter", 
                [3] = "Anti Bruteforce"
            }), 
            fs = v419.bodyyaw:combo("Freestanding", {
                [1] = "Off", 
                [2] = "Peek Fake", 
                [3] = "Peek Real"
            }), 
            limitmode = v419.bodyyaw:combo("Limit Mode", {
                [1] = "Static", 
                [2] = "Random", 
                [3] = "From ~ To", 
                [4] = "Progressive"
            }), 
            leftlimit = v32[v418].bodyyaw:slider(v39 .. "\226\136\188  \rLeft", 0, 60, 60, nil, "\194\176"), 
            rightlimit = v32[v418].bodyyaw:slider(v39 .. "\226\136\188  \rRight", 0, 60, 60, nil, "\194\176"), 
            leftlimit_random = v32[v418].bodyyaw:slider("Min", 0, 60, 60, nil, "\194\176"), 
            rightlimit_random = v32[v418].bodyyaw:slider("Max", 0, 60, 60, nil, "\194\176"), 
            leftlimit_fromto = v32[v418].bodyyaw:slider("From", 0, 60, 60, nil, "\194\176"), 
            rightlimit_fromto = v32[v418].bodyyaw:slider("To", 0, 60, 60, nil, "\194\176"), 
            leftlimit_progressive = v32[v418].bodyyaw:slider("Prog from", 0, 60, 60, nil, "\194\176"), 
            rightlimit_progressive = v32[v418].bodyyaw:slider("Prog to", 0, 60, 60, nil, "\194\176"), 
            delay = v419.bodyyaw:slider(v39 .. "\f<timer>  \rDelay", 1, 14, 1, nil, "t"), 
            delay_random = v419.bodyyaw:switch(v39 .. "\f<bolt>  \rDelay Radomization" .. v39 .. " {soon}"):disabled(true), 
            bodyyawrandom = v32[v418].bodyyaw:slider(v39 .. "\f<bolt> \rRandomization", 0, 100, 0, 1, "%"), 
            dselect = v419.defensive:listable("", {
                [1] = v39 .. "\f<arrow-up-from-square>  \rPitch", 
                [2] = v39 .. "\f<arrows-up-down-left-right>  \rYaw"
            }), 
            pitch = v419.defensive:combo("Pitch", {
                [1] = "Disabled", 
                [2] = "Static", 
                [3] = "Random", 
                [4] = "Offset"
            }), 
            pitchvalue1 = v419.defensive:slider("Pitch #1", -89, 89, 0, nil, "\194\176"), 
            pitchvalue2 = v419.defensive:slider("Pitch #2", -89, 89, 0, nil, "\194\176"), 
            yaw = v419.defensive:combo("Yaw", {
                [1] = "Disabled", 
                [2] = "Neverlose", 
                [3] = "Static", 
                [4] = "Random", 
                [5] = "Offset", 
                [6] = "Spin", 
                [7] = "3-Way", 
                [8] = "5-Way", 
                [9] = "Sideways"
            }), 
            yawvalue1 = v419.defensive:slider("Yaw #1", -360, 360, 0, nil, "\194\176"), 
            yawvalue2 = v419.defensive:slider("Yaw #2", -360, 360, 0, nil, "\194\176"), 
            yawspeed = v419.defensive:slider("Spin Speed", 1, 50, 10, 0.1), 
            yawway1 = v419.defensive:slider("Way #1", -360, 360, 0, nil, "\194\176"), 
            yawway2 = v419.defensive:slider("Way #2", -360, 360, 0, nil, "\194\176"), 
            yawway3 = v419.defensive:slider("Way #3", -360, 360, 0, nil, "\194\176"), 
            yawway4 = v419.defensive:slider("Way #4", -360, 360, 0, nil, "\194\176"), 
            yawway5 = v419.defensive:slider("Way #5", -360, 360, 0, nil, "\194\176")
        };
    end;
    visibility = function()
        -- upvalues: v27 (ref), v30 (ref), v33 (ref), v32 (ref), v34 (ref)
        for v420 = 1, #v27.cond do
            local v421 = v30.antiaim.conditions:get() == v27.cond[v420] and v30.antiaim.enable:get() == 1;
            v33[v420].enable:visibility(v421 and v30.antiaim.conditions:get() ~= "Shared");
            v32[v420].yaw:visibility(v421 and (v33[v420].enable:get() or v30.antiaim.conditions:get() == "Shared"));
            v32[v420].bodyyaw:visibility(v421 and (v33[v420].enable:get() or v30.antiaim.conditions:get() == "Shared"));
            v32[v420].defensivetab:visibility(v421 and (v33[v420].enable:get() or v30.antiaim.conditions:get() == "Shared"));
            v32[v420].sliders:visibility(v421 and (v33[v420].enable:get() or v30.antiaim.conditions:get() == "Shared"));
            v33[v420].modifier:visibility(v421 and v33[v420].yaw:get() ~= "Disabled");
            if v33[v420].defensive:get() then
                v33[v420].breaklc:visibility(true);
            else
                v33[v420].breaklc:visibility(false);
            end;
            v34[v420].mode:visibility(v33[v420].yaw:get() ~= "Disabled");
            v34[v420].delay:visibility(v33[v420].yaw:get() ~= "Disabled");
            v34[v420].static:visibility(v33[v420].yaw:get() ~= "Disabled" and v34[v420].mode:get() == "Static");
            v34[v420].left:visibility(v33[v420].yaw:get() ~= "Disabled" and v34[v420].mode:get() ~= "Static");
            v34[v420].right:visibility(v33[v420].yaw:get() ~= "Disabled" and v34[v420].mode:get() ~= "Static");
            v34[v420].modmode:visibility(v33[v420].modifier:get() ~= "Disabled");
            v34[v420].modrandom3way:visibility(v33[v420].modifier:get() ~= "Disabled" and v33[v420].modifier:get() == "3-Way");
            v34[v420].modrandom5way:visibility(v33[v420].modifier:get() ~= "Disabled" and v33[v420].modifier:get() == "5-Way");
            v34[v420].modstatic:visibility(v33[v420].modifier:get() ~= "Disabled" and v34[v420].modmode:get() == "Static");
            v34[v420].modleft:visibility(v33[v420].modifier:get() ~= "Disabled" and v34[v420].modmode:get() ~= "Static");
            v34[v420].modright:visibility(v33[v420].modifier:get() ~= "Disabled" and v34[v420].modmode:get() ~= "Static");
            v34[v420].options:visibility(v33[v420].bodyyaw:get());
            v34[v420].fs:visibility(v33[v420].bodyyaw:get());
            v34[v420].delay:visibility(v34[v420].options:get("Jitter"));
            v34[v420].delay:visibility(v33[v420].bodyyaw:get());
            v34[v420].delay_random:visibility(v33[v420].bodyyaw:get());
            v34[v420].limitmode:visibility(v33[v420].bodyyaw:get());
            v34[v420].bodyyawrandom:visibility(v34[v420].limitmode:get() == "Static");
            v34[v420].leftlimit:visibility(v34[v420].limitmode:get() == "Static");
            v34[v420].rightlimit:visibility(v34[v420].limitmode:get() == "Static");
            v34[v420].leftlimit_random:visibility(v34[v420].limitmode:get() == "Random");
            v34[v420].rightlimit_random:visibility(v34[v420].limitmode:get() == "Random");
            v34[v420].leftlimit_progressive:visibility(v34[v420].limitmode:get() == "Progressive");
            v34[v420].rightlimit_progressive:visibility(v34[v420].limitmode:get() == "Progressive");
            v34[v420].leftlimit_fromto:visibility(v34[v420].limitmode:get() == "From ~ To");
            v34[v420].rightlimit_fromto:visibility(v34[v420].limitmode:get() == "From ~ To");
            v34[v420].dselect:visibility(v33[v420].defensive:get());
            v34[v420].pitch:visibility(v33[v420].defensive:get() and v34[v420].dselect:get(1));
            v34[v420].pitchvalue1:visibility(v33[v420].defensive:get() and v34[v420].dselect:get(1) and v34[v420].pitch:get() ~= "Disabled");
            v34[v420].pitchvalue2:visibility(v33[v420].defensive:get() and v34[v420].dselect:get(1) and (v34[v420].pitch:get() == "Offset" or v34[v420].pitch:get() == "Random"));
            v34[v420].yaw:visibility(v33[v420].defensive:get() and v34[v420].dselect:get(2));
            v34[v420].yawvalue1:visibility(v33[v420].defensive:get() and v34[v420].dselect:get(2) and v34[v420].yaw:get() ~= "Disabled" and v34[v420].yaw:get() ~= "Neverlose" and v34[v420].yaw:get() ~= "3-Way" and v34[v420].yaw:get() ~= "5-Way");
            v34[v420].yawvalue2:visibility(v33[v420].defensive:get() and v34[v420].dselect:get(2) and v34[v420].yaw:get() ~= "3-Way" and v34[v420].yaw:get() ~= "5-Way" and (not (v34[v420].yaw:get() ~= "Offset") or v34[v420].yaw:get() == "Random"));
            v34[v420].yawspeed:visibility(v33[v420].defensive:get() and v34[v420].dselect:get(2) and v34[v420].yaw:get() == "Spin");
            v34[v420].yawway1:visibility(v33[v420].defensive:get() and v34[v420].dselect:get(2) and (v34[v420].yaw:get() == "3-Way" or v34[v420].yaw:get() == "5-Way"));
            v34[v420].yawway2:visibility(v33[v420].defensive:get() and v34[v420].dselect:get(2) and (v34[v420].yaw:get() == "3-Way" or v34[v420].yaw:get() == "5-Way"));
            v34[v420].yawway3:visibility(v33[v420].defensive:get() and v34[v420].dselect:get(2) and (v34[v420].yaw:get() == "3-Way" or v34[v420].yaw:get() == "5-Way"));
            v34[v420].yawway4:visibility(v33[v420].defensive:get() and v34[v420].dselect:get(2) and v34[v420].yaw:get() == "5-Way");
            v34[v420].yawway5:visibility(v33[v420].defensive:get() and v34[v420].dselect:get(2) and v34[v420].yaw:get() == "5-Way");
        end;
    end;
    set_callback = function()
        -- upvalues: v31 (ref), v33 (ref), v34 (ref)
        for _, v423 in pairs(v31) do
            v423:set_callback(visibility);
        end;
        for v424, _ in pairs(v33) do
            for _, v427 in pairs(v33[v424]) do
                v427:set_callback(visibility);
            end;
        end;
        for v428, _ in pairs(v34) do
            for _, v431 in pairs(v34[v428]) do
                v431:set_callback(visibility);
            end;
        end;
    end;
    visibility();
    set_callback();
end;
builder();
v30.misc.grenades.selectnades:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v30.misc.grenades.nades
});
v30.misc.grenades.nadehotkey:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v30.misc.grenades.nades
});
v30.misc.grenades.realese32:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v30.misc.grenades.nades
});
local function v445(v432)
    -- upvalues: v30 (ref), v33 (ref), v28 (ref)
    local v433 = entity.get_local_player();
    if v433 == nil or not v433:is_alive() then
        return;
    else
        local l_m_fFlags_0 = v433.m_fFlags;
        local v435 = bit.band(l_m_fFlags_0, bit.lshift(1, 0)) == 0;
        local v436 = bit.band(l_m_fFlags_0, bit.lshift(1, 1)) ~= 0;
        if v30.antiaim.fs:get() then
            local v437;
            if v432 then
                v437 = v33[9].enable:get() and 9 or 1;
            else
                v437 = 9;
            end;
            return v437;
        elseif v435 and v436 then
            local v438;
            if v432 then
                v438 = v33[8].enable:get() and 8 or 1;
            else
                v438 = 8;
            end;
            return v438;
        elseif v435 then
            local v439;
            if v432 then
                v439 = v33[7].enable:get() and 7 or 1;
            else
                v439 = 7;
            end;
            return v439;
        elseif v433.m_vecVelocity:length2d() > 5 and v436 then
            local v440;
            if v432 then
                v440 = v33[6].enable:get() and 6 or 1;
            else
                v440 = 6;
            end;
            return v440;
        elseif v433.m_vecVelocity:length2d() < 5 and v436 then
            local v441;
            if v432 then
                v441 = v33[5].enable:get() and 5 or 1;
            else
                v441 = 5;
            end;
            return v441;
        elseif v433.m_vecVelocity:length2d() > 5 and v28.sw:get() then
            local v442;
            if v432 then
                v442 = v33[4].enable:get() and 4 or 1;
            else
                v442 = 4;
            end;
            return v442;
        elseif v433.m_vecVelocity:length2d() > 5 then
            local v443;
            if v432 then
                v443 = v33[3].enable:get() and 3 or 1;
            else
                v443 = 3;
            end;
            return v443;
        else
            local v444;
            if v432 then
                v444 = v33[2].enable:get() and 2 or 1;
            else
                v444 = 2;
            end;
            return v444;
        end;
    end;
end;
local v446 = nil;
v446 = {
    sides = {}, 
    delay = {}
};
v446.calculate = function(v447, v448, v449)
    -- upvalues: v446 (ref)
    if not v446.sides[v447] then
        v446.sides[v447] = 0;
    end;
    if not v446.delay[v447] then
        v446.delay[v447] = 0;
    end;
    if globals.choked_commands == 0 then
        v446.delay[v447] = v446.delay[v447] + 1;
        if v446.delay[v447] > v449 - 1 then
            v446.delay[v447] = 0;
            v446.sides[v447] = v446.sides[v447] + 1;
            if v446.sides[v447] > #v448 then
                v446.sides[v447] = 1;
            end;
        end;
    end;
    return v448[v446.sides[v447]];
end;
local _ = {
    Right = 90, 
    Left = -90, 
    Front = 180, 
    Disabled = 0
};
local function v464(v451)
    -- upvalues: v30 (ref), v28 (ref), v37 (ref), v445 (ref), v33 (ref), v446 (ref), v34 (ref), l_animations_0 (ref)
    local v452 = entity.get_local_player();
    if v452 == nil or not v452:is_alive() or not v30.antiaim.enable:get() then
        return;
    else
        v28.fs:override(v30.antiaim.fs:get());
        local v453 = false;
        v37.cond = v445(true);
        v37.cond2 = v445(true);
        v28.base:override(v30.antiaim.conditions.base:get());
        v28.pitch:override(v30.antiaim.conditions.pitch:get());
        v28.backstab:override(v30.antiaim.backstab:get(3));
        v28.modifier:override("Disabled");
        if v30.antiaim.manual:get() ~= "Disabled" and v30.antiaim.manual.static:get() then
            v453 = true;
            v30.antiaim.fs:set(false);
        end;
        local v454 = 0;
        local v455 = false;
        local v456 = v452:get_player_weapon();
        if entity.get_threat() ~= nil then
            local v457 = (entity.get_threat():get_origin() - v452:get_origin()):length2dsqr();
            if v30.antiaim.safe:get() and v30.antiaim.safe.weapons:get() and v456 ~= nil and v37.cond2 == 8 then
                v454 = v30.antiaim.safe.weapons:get(string.sub(v456:get_weapon_info(1).weapon_name, 8)) and 15 or 0;
                if v454 == 15 then
                    v455 = true;
                end;
            end;
            if v30.antiaim.safe:get(1) and v30.antiaim.safe.weapons:get() and v37.cond2 == 2 then
                v454 = v30.antiaim.safe.weapons:get(1) and 15 or 0;
                if v454 == 15 then
                    v455 = true;
                end;
            end;
            if v30.antiaim.safe:get(2) and v30.antiaim.safe.weapons:get() and v37.cond2 == 5 then
                v454 = v30.antiaim.safe.weapons:get(2) and 15 or 0;
                if v454 == 15 then
                    v455 = true;
                end;
            end;
            if v30.antiaim.safe:get(3) and v30.antiaim.safe.weapons:get() and v37.cond2 == 8 then
                v454 = v30.antiaim.safe.weapons:get(3) and 15 or 0;
                if v454 == 15 then
                    v455 = true;
                end;
            end;
            if v30.antiaim.safe:get(4) and v30.antiaim.safe.weapons:get() and v457 > 1000000 then
                v454 = v30.antiaim.safe.weapons:get(4) and 15 or 0;
                if v454 == 15 then
                    v455 = true;
                end;
            end;
            if v30.antiaim.safe:get(5) and v30.antiaim.safe.weapons:get() then
                v454 = v30.antiaim.safe.weapons:get(5) and v452:get_origin().z - entity.get_threat():get_origin().z > 55 and 15 or 0;
                if v454 == 15 then
                    v455 = true;
                end;
            end;
        end;
        if v33[v37.cond].modifier:get() == "Disabled" then
            v37.invert = v446.calculate("invert_disabled_" .. v37.cond, {
                [1] = true, 
                [2] = false
            }, v34[v37.cond].delay:get());
            v37.yaw = 0;
        elseif v33[v37.cond].modifier:get() == "Center" then
            v37.invert = v446.calculate("invert_center_" .. v37.cond, {
                [1] = true, 
                [2] = false
            }, v34[v37.cond].delay:get());
            v37.yaw = v34[v37.cond].modmode:get() == "Static" and (not v37.invert and -v34[v37.cond].modstatic:get() or v34[v37.cond].modstatic:get()) or v37.invert and -v34[v37.cond].modright:get() or v34[v37.cond].modleft:get();
        elseif v33[v37.cond].modifier:get() == "Offset" then
            v37.invert = v446.calculate("invert_offset_" .. v37.cond, {
                [1] = true, 
                [2] = false
            }, v34[v37.cond].delay:get());
            local l_v37_0 = v37;
            local v459;
            if v34[v37.cond].modmode:get() == "Static" then
                if not v37.invert then
                    v459 = 0;
                    goto label0 --[[  true, true  ]];
                else
                    v459 = v34[v37.cond].modstatic:get();
                    if v459 then
                        goto label0;
                    end;
                end;
            end;
            v459 = not v37.invert and 0 or v34[v37.cond].modleft:get();
            ::label0::;
            l_v37_0.yaw = v459;
        elseif v33[v37.cond].modifier:get() == "Random" then
            v37.invert = v446.calculate("invert_random_" .. v37.cond, {
                [1] = true, 
                [2] = false
            }, v34[v37.cond].delay:get());
            v37.yaw = v34[v37.cond].modmode:get() == "Static" and math.random(-v34[v37.cond].modstatic:get(), v34[v37.cond].modstatic:get()) or math.random(-v34[v37.cond].modright:get(), v34[v37.cond].modleft:get());
        elseif v33[v37.cond].modifier:get() == "3-Way" then
            v37.invert = v446.calculate("invert_3-way_" .. v37.cond, {
                [1] = true, 
                [2] = false, 
                [3] = true
            }, v34[v37.cond].delay:get());
            v37.yaw = v446.calculate("3way_" .. v37.cond, v34[v37.cond].modmode:get() == "Static" and {
                nil, 
                0, 
                [1] = -v34[v37.cond].modstatic:get(), 
                v34[v37.cond].modstatic:get()
            } or {
                nil, 
                0, 
                [1] = v34[v37.cond].modleft:get(), 
                v34[v37.cond].modright:get()
            }, v34[v37.cond].delay:get());
        elseif v33[v37.cond].modifier:get() == "5-Way" then
            v37.invert = v446.calculate("invert_5-way_" .. v37.cond, {
                [1] = true, 
                [2] = false, 
                [3] = true
            }, v34[v37.cond].delay:get());
            v37.yaw = v446.calculate("5way_" .. v37.cond, v34[v37.cond].modmode:get() == "Static" and {
                nil, 
                nil, 
                0, 
                [1] = -v34[v37.cond].modstatic:get(), 
                [2] = -v34[v37.cond].modstatic:get() * 0.5, 
                v34[v37.cond].modstatic:get() * 0.5, 
                v34[v37.cond].modstatic:get()
            } or {
                nil, 
                nil, 
                0, 
                [1] = v34[v37.cond].modleft:get(), 
                [2] = v34[v37.cond].modleft:get() * 0.5, 
                v34[v37.cond].modright:get() * 0.5, 
                v34[v37.cond].modright:get()
            }, v34[v37.cond].delay:get());
        end;
        v37.add = v34[v37.cond].mode:get() == "Static" and v34[v37.cond].static:get() or v37.invert and v34[v37.cond].right:get() or v34[v37.cond].left:get();
        v28.yaw:override(v33[v37.cond].yaw:get());
        v28.yawoffset:override((v455 and 0 or v37.yaw / 2 + v37.add) + v454 + yaw_base_degree());
        v28.bodyyaw:override(v33[v37.cond].bodyyaw:get());
        local l_inverter_0 = v28.inverter;
        local l_l_inverter_0_0 = l_inverter_0;
        l_inverter_0 = l_inverter_0.override;
        local v462;
        if v34[v37.cond].options:get("Jitter") and not v455 and not v37.invert then
            v462 = true;
        else
            v462 = false;
        end;
        l_inverter_0(l_l_inverter_0_0, v462);
        if v34[v37.cond].limitmode:get() == "Static" then
            v28.leftlimit:override(v34[v37.cond].leftlimit:get());
            v28.rightlimit:override(v34[v37.cond].rightlimit:get());
            v28.leftlimit:override(v34[v37.cond].bodyyawrandom:get() > 0 and utils.random_int(v34[v37.cond].leftlimit:get() - v34[v37.cond].bodyyawrandom:get() / 100 * v34[v37.cond].leftlimit:get(), v34[v37.cond].leftlimit:get()) or v34[v37.cond].leftlimit:get());
            v28.rightlimit:override(v34[v37.cond].bodyyawrandom:get() > 0 and utils.random_int(v34[v37.cond].rightlimit:get() - v34[v37.cond].bodyyawrandom:get() / 100 * v34[v37.cond].rightlimit:get(), v34[v37.cond].rightlimit:get()) or v34[v37.cond].rightlimit:get());
        end;
        if v34[v37.cond].limitmode:get() == "Random" then
            v28.leftlimit:override(v34[v37.cond].leftlimit_random:get() > 0 and utils.random_int(v34[v37.cond].leftlimit_random:get() - -v34[v37.cond].rightlimit_random:get() / 60 * v34[v37.cond].leftlimit_random:get(), v34[v37.cond].leftlimit_random:get() or -v34[v37.cond].rightlimit_random:get()));
            v28.rightlimit:override(v34[v37.cond].rightlimit_random:get() > 0 and utils.random_int(v34[v37.cond].rightlimit_random:get() + -v34[v37.cond].leftlimit_random:get() / 60 * v34[v37.cond].rightlimit_random:get(), v34[v37.cond].rightlimit_random:get() or -v34[v37.cond].leftlimit_random:get()));
        end;
        if v34[v37.cond].limitmode:get() == "From ~ To" then
            v28.leftlimit:override(v34[v37.cond].leftlimit_fromto:get() > 0 and v446.calculate(v34[v37.cond].leftlimit_fromto:get() - -v34[v37.cond].rightlimit_fromto:get() / 60 * v34[v37.cond].leftlimit_fromto:get(), v34[v37.cond].leftlimit_fromto:get() or -v34[v37.cond].rightlimit_fromto:get()));
            v28.rightlimit:override(v34[v37.cond].rightlimit_fromto:get() > 0 and v446.calculate(v34[v37.cond].rightlimit_fromto:get() + -v34[v37.cond].leftlimit_fromto:get() / 60 * v34[v37.cond].rightlimit_fromto:get(), v34[v37.cond].rightlimit_fromto:get() or -v34[v37.cond].leftlimit_fromto:get()));
        end;
        if v34[v37.cond].limitmode:get() == "Progressive" then
            l_inverter_0 = globals.curtime;
            v28.leftlimit:override(v34[v37.cond].leftlimit_progressive:get() > 0 and math.fmod(l_inverter_0 * v34[v37.cond].leftlimit_progressive:get() - -v34[v37.cond].rightlimit_progressive:get() / 60 * v34[v37.cond].leftlimit_progressive:get(), v34[v37.cond].leftlimit_progressive:get() or -v34[v37.cond].rightlimit_progressive:get()));
            v28.rightlimit:override(v34[v37.cond].rightlimit_progressive:get() > 0 and math.fmod(l_inverter_0 * v34[v37.cond].rightlimit_progressive:get() + -v34[v37.cond].leftlimit_progressive:get() / 60 * v34[v37.cond].rightlimit_progressive:get(), v34[v37.cond].rightlimit_progressive:get() or -v34[v37.cond].leftlimit_progressive:get()));
        end;
        v28.options:override({
            [1] = v34[v37.cond].options:get("Avoid Overlap") and "Avoid Overlap" or "", 
            [2] = v34[v37.cond].options:get("Randomize Jitter") and "Randomize Jitter" or "", 
            [3] = v34[v37.cond].options:get("Anti Bruteforce") and "Anti Bruteforce" or ""
        });
        v28.bodyyawfs:override(v34[v37.cond].fs:get());
        v28.dtlag:override(v33[v37.cond].breaklc:get() and "Always on" or nil);
        v28.hslag:override(v33[v37.cond].breaklc:get() and "Break lc" or nil);
        if v33[v37.cond].defensive:get() and not v455 then
            l_inverter_0 = globals.curtime;
            v28.hidden:override(true);
            v28.dtlag:override(v33[v37.cond].breaklc:get() and "Always on" or nil);
            v28.hslag:override(v33[v37.cond].breaklc:get() and "Break lc" or nil);
            v451.force_defensive = v451.command_number % 16 == 0;
            if rage.exploit:get() < 1 then
                return;
            else
                if v34[v37.cond].dselect:get(1) then
                    if v34[v37.cond].pitch:get() == "Static" then
                        rage.antiaim:override_hidden_pitch(v34[v37.cond].pitchvalue1:get());
                    elseif v34[v37.cond].pitch:get() == "Random" then
                        rage.antiaim:override_hidden_pitch(math.random(v34[v37.cond].pitchvalue1:get(), v34[v37.cond].pitchvalue2:get()));
                    elseif v34[v37.cond].pitch:get() == "Offset" then
                        rage.antiaim:override_hidden_pitch(v446.calculate("defensivepitch_" .. v37.cond, {
                            v34[v37.cond].pitchvalue1:get(), 
                            v34[v37.cond].pitchvalue2:get()
                        }, 1) or 89);
                    end;
                end;
                if v34[v37.cond].dselect:get(2) then
                    if v34[v37.cond].yaw:get(1) == "Disabled" then
                        rage.antiaim:override_hidden_yaw_offset(0);
                    elseif v34[v37.cond].yaw:get(2) == "Neverlose" then
                        rage.antiaim:override_hidden_yaw_offset();
                    elseif v34[v37.cond].yaw:get(3) == "Static" then
                        rage.antiaim:override_hidden_yaw_offset(v34[v37.cond].yawvalue1:get());
                    elseif v34[v37.cond].yaw:get(4) == "Random" then
                        rage.antiaim:override_hidden_yaw_offset(math.random(v34[v37.cond].yawvalue1:get(), v34[v37.cond].yawvalue2:get()));
                    elseif v34[v37.cond].yaw:get(5) == "Offset" then
                        rage.antiaim:override_hidden_yaw_offset(v446.calculate("defensiveyaw_" .. v37.cond, {
                            v34[v37.cond].yawvalue1:get(), 
                            v34[v37.cond].yawvalue2:get()
                        }, 1) or 0);
                    elseif v34[v37.cond].yaw:get(6) == "Spin" then
                        v462 = math.clamp(math.ceil(globals.curtime * (v34[v37.cond].yawspeed:get() / 5)) % 2, 0, 1) > 0.5;
                        local v463 = l_animations_0.new("defensiveyaw_" .. v37.cond, 0):update(l_animations_0.types.LERP, v462 and -v34[v37.cond].yawvalue1:get() or v34[v37.cond].yawvalue1:get());
                        rage.antiaim:override_hidden_yaw_offset(v463 == nil and 0 or v463);
                    elseif v34[v37.cond].yaw:get(7) == "3-Way" then
                        rage.antiaim:override_hidden_yaw_offset(v446.calculate("defensiveyaw_" .. v37.cond, {
                            v34[v37.cond].yawway1:get(), 
                            v34[v37.cond].yawway2:get(), 
                            v34[v37.cond].yawway3:get()
                        }, 1) or 0);
                    elseif v34[v37.cond].yaw:get(8) == "5-Way" then
                        rage.antiaim:override_hidden_yaw_offset(v446.calculate("defensiveyaw_" .. v37.cond, {
                            v34[v37.cond].yawway1:get(), 
                            v34[v37.cond].yawway2:get(), 
                            v34[v37.cond].yawway3:get(), 
                            v34[v37.cond].yawway4:get(), 
                            v34[v37.cond].yawway5:get()
                        }, 1) or 0);
                    elseif v34[v37.cond].yaw:get(9) == "Sideways" then
                        rage.antiaim:override_hidden_yaw_offset(v446.calculate("defensiveyaw_" .. v37.cond, {
                            nil, 
                            nil, 
                            nil, 
                            nil, 
                            0, 
                            [1] = -v34[v37.cond].yawvalue1:get(), 
                            [2] = -v34[v37.cond].yawvalue1:get() * 0.75, 
                            [3] = -v34[v37.cond].yawvalue1:get() * 0.5, 
                            [4] = -v34[v37.cond].yawvalue1:get() * 0.25, 
                            v34[v37.cond].yawvalue1:get() * 0.25, 
                            v34[v37.cond].yawvalue1:get() * 0.5, 
                            v34[v37.cond].yawvalue1:get() * 0.75, 
                            v34[v37.cond].yawvalue1:get()
                        }, 1) or 0);
                    end;
                end;
            end;
        else
            v28.hidden:override(false);
        end;
        l_inverter_0 = v30.antiaim.flickexploit:get();
        l_l_inverter_0_0 = v30.antiaim.flickexploit.flicksettings:get();
        if not l_inverter_0 or l_l_inverter_0_0.len == 0 then
            return;
        elseif rage.exploit:get() < 1 then
            return;
        else
            if v30.antiaim.flickexploit:get() and v30.antiaim.flickexploit.flicksettings:get(1) and v37.cond2 == 2 then
                rage.antiaim:inverter(false);
                v28.yawoffset:override(5);
                v28.modifier:override("Disabled");
                v28.bodyyaw:override(true);
                v28.options:override("");
                v28.leftlimit:override(42);
                v28.rightlimit:override(42);
                v28.fs:override(false);
                v28.hidden:override(true);
                rage.antiaim:override_hidden_pitch(89);
                rage.antiaim:override_hidden_yaw_offset(-70);
                v28.hslag:override("Break LC");
                v28.dtlag:override("Always On");
                v451.force_defensive = v451.command_number % 16 == 0;
            elseif v30.antiaim.flickexploit:get() and v30.antiaim.flickexploit.flicksettings:get(2) and v37.cond2 == 4 then
                rage.antiaim:inverter(false);
                v28.yawoffset:override(5);
                v28.modifier:override("Offset");
                v28.modoffset:override(1);
                v28.bodyyaw:override(true);
                v28.options:override("");
                v28.leftlimit:override(48);
                v28.rightlimit:override(48);
                v28.fs:override(false);
                v28.hidden:override(true);
                rage.antiaim:override_hidden_pitch(89);
                rage.antiaim:override_hidden_yaw_offset(-70);
                v28.hslag:override("Break LC");
                v28.dtlag:override("Always On");
                v451.force_defensive = v451.command_number % 16 == 0;
            elseif v30.antiaim.flickexploit:get() and v30.antiaim.flickexploit.flicksettings:get(3) and v37.cond2 == 5 then
                rage.antiaim:inverter(false);
                v28.yawoffset:override(5);
                v28.modifier:override("Disabled");
                v28.bodyyaw:override(true);
                v28.options:override("");
                v28.leftlimit:override(42);
                v28.rightlimit:override(42);
                v28.fs:override(false);
                v28.hidden:override(true);
                rage.antiaim:override_hidden_pitch(89);
                rage.antiaim:override_hidden_yaw_offset(-70);
                v28.hslag:override("Break LC");
                v28.dtlag:override("Always On");
                v451.force_defensive = v451.command_number % 16 == 0;
            elseif v30.antiaim.flickexploit:get() and v30.antiaim.flickexploit.flicksettings:get(4) and v37.cond2 == 7 then
                rage.antiaim:inverter(false);
                v28.yawoffset:override(5);
                v28.modifier:override("Disabled");
                v28.bodyyaw:override(true);
                v28.options:override("");
                v28.leftlimit:override(42);
                v28.rightlimit:override(42);
                v28.fs:override(false);
                v28.hidden:override(true);
                rage.antiaim:override_hidden_pitch(89);
                rage.antiaim:override_hidden_yaw_offset(-70);
                v28.hslag:override("Break LC");
                v28.dtlag:override("Always On");
                v451.force_defensive = v451.command_number % 16 == 0;
            end;
            return;
        end;
    end;
end;
local v474 = {
    handle = function()
        -- upvalues: l_mtools_0 (ref), v28 (ref), v30 (ref)
        local v465 = entity.get_local_player();
        if not v465 then
            return;
        else
            local v466 = v465:get_player_weapon();
            if v466 == nil then
                return;
            else
                local l_weapon_name_0 = v466:get_weapon_info().weapon_name;
                local _ = v466:get_weapon_info().weapon_type;
                local l_console_name_0 = v466:get_weapon_info().console_name;
                l_mtools_0.AntiAims.Condition:Update();
                is_scout = l_weapon_name_0 == "weapon_ssg08";
                is_awp = l_weapon_name_0 == "weapon_awp";
                is_scar = l_weapon_name_0 == "weapon_scar20";
                is_g3sg1 = l_weapon_name_0 == "weapon_g3sg1";
                is_revolver = l_console_name_0 == "weapon_revolver";
                if v465.m_bIsScoped or not l_mtools_0.AntiAims.Condition:GetDev("Air") then
                    v28.hc_find:override();
                end;
                if v30.misc.hitchance:get() and v30.misc.hitchance.inair_hc:get() ~= 0 then
                    for v470, v471 in pairs({
                        [1] = is_scout, 
                        [2] = is_awp, 
                        [3] = is_scar, 
                        [4] = is_g3sg1, 
                        [5] = is_revolver, 
                        [6] = not is_scout and not is_awp and not is_scar and not is_g3sg1 and not is_revolver
                    }) do
                        if v30.misc.hitchance.inair_hc:get(v470) and v471 and l_mtools_0.AntiAims.Condition:GetDev("Air") then
                            v28.hc_find:override(v30.misc.hitchance.inair_hc_sldeir:get());
                        end;
                    end;
                end;
                if v30.misc.hitchance:get() and v30.misc.hitchance.inair_hc:get() ~= 0 then
                    for v472, v473 in pairs({
                        [1] = is_scout, 
                        [2] = is_awp, 
                        [3] = is_scar, 
                        [4] = is_g3sg1, 
                        [5] = not is_scout and not is_awp and not is_scar and not is_g3sg1
                    }) do
                        if v30.misc.hitchance.inair_hc:get(v472) and v473 and not v465.m_bIsScoped then
                            v28.hc_find:override(v30.misc.hitchance.noscope_hc_sldeir:get());
                        end;
                    end;
                end;
                return;
            end;
        end;
    end
};
events.createmove:set(function()
    -- upvalues: v474 (ref)
    v474.handle();
end);
events.shutdown:set(function()
    -- upvalues: v28 (ref)
    v28.hc_find:override();
end);
local function v477(_)
    -- upvalues: v30 (ref), v28 (ref), v446 (ref), l_ffi_0 (ref)
    local v476 = entity.get_local_player();
    if v476 == nil or not v476:is_alive() or not v30.misc.animbreakers:get() then
        return;
    else
        v28.leg:override();
        move = math.sqrt(v476.m_vecVelocity.x ^ 2 + v476.m_vecVelocity.y ^ 2) > 5;
        jump = bit.band(v476.m_fFlags, 1) == 0;
        if v30.misc.animbreakers.ground:get() ~= "Disabled" then
            if v30.misc.animbreakers.ground:get() == "Backward" then
                v476.m_flPoseParameter[0] = 1;
                v28.leg:override("sliding");
            elseif v30.misc.animbreakers.ground:get() == "Moonwalk" then
                v476.m_flPoseParameter[7] = 0;
                v28.leg:override("walking");
            elseif v30.misc.animbreakers.ground:get() == "Flex" then
                v28.leg:override("walking");
                v476.m_flPoseParameter[7] = utils.random_float(0.5, 1);
            elseif v30.misc.animbreakers.ground:get() == "Bsod" then
                v476.m_flPoseParameter[0] = utils.random_float(0, 1);
            else
                v476.m_flPoseParameter[0] = v446.calculate("ground_jitter", {
                    [1] = -v30.misc.animbreakers.jittervalue:get() / 200 + 1, 
                    [2] = v30.misc.animbreakers.jittervalue1:get() / 200 + 1
                }, -(v30.misc.animbreakers.jitterspeed:get() - 100)) or 0;
                v28.leg:override("sliding");
            end;
        end;
        if v30.misc.animbreakers.movelean:get() and jump and move ~= 0 then
            l_ffi_0.cast("CAnimationLayer_t**", l_ffi_0.cast("uintptr_t", v476[0]) + 10640)[0][12].m_flWeight = v30.misc.animbreakers.movelean:get() / 100;
        elseif v30.misc.animbreakers.addonsanim:get(3) and move ~= 0 then
            l_ffi_0.cast("CAnimationLayer_t**", l_ffi_0.cast("uintptr_t", v476[0]) + 10640)[0][12].m_flWeight = v30.misc.animbreakers.movelean:get() / 100;
        end;
        if v30.misc.animbreakers.addonsanim:get(1) and jump and move then
            l_ffi_0.cast("CAnimationLayer_t**", l_ffi_0.cast("uintptr_t", v476[0]) + 10640)[0][12].m_flWeight = utils.random_float(0, 1, 10);
        elseif v30.misc.animbreakers.addonsanim:get(2) and jump and move then
            l_ffi_0.cast("CAnimationLayer_t**", l_ffi_0.cast("uintptr_t", v476[0]) + 10640)[0][12].m_flWeight = utils.random_float(10, 0);
        end;
        if v30.misc.animbreakers.air:get() ~= "Disabled" then
            if v30.misc.animbreakers.air:get() == "Static" then
                v476.m_flPoseParameter[6] = v30.misc.animbreakers.airvalue:get() / 100;
            elseif v30.misc.animbreakers.air:get() == "Kangaroo" then
                v476.m_flPoseParameter[6] = utils.random_float(0, 1) and utils.random_float(1, 0);
                v476.m_flPoseParameter[6] = utils.random_float(1, 0) and utils.random_float(0, 1);
            elseif v30.misc.animbreakers.air:get() == "Moonwalk" and jump and move then
                l_ffi_0.cast("CAnimationLayer_t**", l_ffi_0.cast("uintptr_t", v476[0]) + 10640)[0][6].m_flWeight = 1;
            else
                v476.m_flPoseParameter[6] = 0;
            end;
        end;
        return;
    end;
end;
local function _()
    local v478 = entity.get_local_player();
    if not v478 then
        return false, nil;
    elseif not globals.is_in_game and not globals.is_connected then
        return false, nil;
    elseif not v478:is_alive() then
        return false, nil;
    else
        return true, v478;
    end;
end;
local _ = {
    CSensorGrenade = true, 
    CDecoyGrenade = true, 
    CFlashbang = true, 
    CHEGrenade = true, 
    CC4 = true, 
    CWeaponTaser = true, 
    CKnife = true, 
    CSmokeGrenade = true, 
    CIncendiaryGrenade = true, 
    CMolotovGrenade = true
};
render_bar = function(v481, v482, v483)
    -- upvalues: v27 (ref)
    if v482 == nil or v482 == "" or v482 == " " then
        return;
    else
        render.gradient(vector(13, v27.fullscreen.y - 350 - v483 * 37), vector(13 + render.measure_text(v27.calibri, nil, v482).x / 2, v27.fullscreen.y - 345 - v483 * 37 + 28), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.gradient(vector(13 + render.measure_text(v27.calibri, nil, v482).x, v27.fullscreen.y - 350 - v483 * 37), vector(13 + render.measure_text(v27.calibri, nil, v482).x / 2, v27.fullscreen.y - 345 - v483 * 37 + 28), color(0, 0, 0, 0), color(0, 0, 0, 60), color(0, 0, 0, 0), color(0, 0, 0, 60), 0);
        render.text(v27.calibri, vector(20, v27.fullscreen.y - 343 - v483 * 37), color(0, 0, 0, 150), nil, v482);
        render.text(v27.calibri, vector(19, v27.fullscreen.y - 345 - v483 * 37), v481, nil, v482);
        return;
    end;
end;
AirStrafeFix = function(v484)
    -- upvalues: v30 (ref)
    if not v30.misc.hitchance.jumpscoutfix:get() then
        return;
    elseif v484.in_moveleft or v484.in_moveright or v484.in_back or v484.in_forward then
        return;
    else
        if (entity.get_local_player().m_vecVelocity * vector(1, 1, 0)):length() <= 3 then
            v484.in_speed = true;
        end;
        return;
    end;
end;
events.createmove:set(function(v485)
    AirStrafeFix(v485);
end);
SkeetCamera = function(v486)
    -- upvalues: v30 (ref), l_mtools_1 (ref)
    local v487 = entity.get_local_player();
    if v487 == nil or not v30.misc.bars.skeetinropolation:get() or not common.is_in_thirdperson() then
        return;
    else
        if v487.m_flDuckAmount > 0 and l_mtools_1.AntiAims.Condition:GetDev("Air") then
            v486.camera.z = v487:get_origin().z + 44.5;
        end;
        return;
    end;
end;
events.override_view:set(function(v488)
    SkeetCamera(v488);
end);
if v30.misc.grenades.nades:get(1) and lp ~= nil and lp:is_alive() then
    local v489 = lp:get_player_weapon();
    if v489 ~= nil then
        local v490 = v489:get_weapon_index();
        if v490 ~= nil and (v490 == 43 or v490 == 44 or v490 == 45 or v490 == 46 or v490 == 47 or v490 == 48) then
            v28.weaponact:override({
                [1] = "", 
                [2] = v28.weaponact:get("Auto Pistols") and "Auto Pistols" or ""
            });
        end;
    end;
end;
local v491 = {
    Default = 1, 
    Pixel = 2, 
    Tahoma = 3, 
    Bold = 4
};
local v492 = 255;
events.render:set(function()
    -- upvalues: v30 (ref), v492 (ref), v22 (ref), v26 (ref), v491 (ref)
    if not globals.is_in_game then
        return;
    else
        local v493 = entity.get_local_player();
        if not v493:is_alive() then
            return;
        else
            local _ = vector(v493["m_vecVelocity[0]"], v493["m_vecVelocity[1]"], v493["m_vecVelocity[2]"]):length2d();
            if v30.misc.ts:get() then
                if v30.misc.ts.ts_type:get() == "Modern" then
                    local l_r_0 = v30.misc.ts.accent_color:get().r;
                    local l_g_0 = v30.misc.ts.accent_color:get().g;
                    local l_b_0 = v30.misc.ts.accent_color:get().b;
                    act = {
                        [1] = l_r_0, 
                        [2] = l_g_0, 
                        [3] = l_b_0, 
                        [4] = v492
                    };
                    off = {
                        [1] = 0, 
                        [2] = 0, 
                        [3] = 0, 
                        [4] = 0
                    };
                    local v498 = v30.antiaim.manual:get() == "Front" and act or off;
                    local v499 = v30.antiaim.manual:get() == "Left" and act or off;
                    local v500 = v30.antiaim.manual:get() == "Right" and act or off;
                    if v30.antiaim.manual:get() ~= "Disabled" or not act then
                        local _ = off;
                    end;
                    render.text(v22.verdana_bold, vector(v26.x / 2, v26.y / 2 - 55), color(v498[1], v498[2], v498[3], v498[4]), "c", "\226\174\153");
                    render.text(v22.verdana_bold, vector(v26.x / 2 - 55, v26.y / 2), color(v499[1], v499[2], v499[3], v499[4]), "c", "\226\174\152");
                    render.text(v22.verdana_bold, vector(v26.x / 2 + 55, v26.y / 2), color(v500[1], v500[2], v500[3], v500[4]), "c", "\226\174\154");
                elseif v30.misc.ts.ts_type:get() == "Default" then
                    local l_r_1 = v30.misc.ts.accent_color:get().r;
                    local l_g_1 = v30.misc.ts.accent_color:get().g;
                    local l_b_1 = v30.misc.ts.accent_color:get().b;
                    local l_b_2 = v30.misc.ts.accent_color:get().b;
                    act = {
                        [1] = l_r_1, 
                        [2] = l_g_1, 
                        [3] = l_b_1, 
                        [4] = v492
                    };
                    off = {
                        [1] = 0, 
                        [2] = 0, 
                        [3] = 0, 
                        [4] = 0
                    };
                    l_b_2 = v30.antiaim.manual:get() == "Front" and act or off;
                    local v506 = v30.antiaim.manual:get() == "Left" and act or off;
                    local v507 = v30.antiaim.manual:get() == "Right" and act or off;
                    if v30.antiaim.manual:get() ~= "Disabled" or not act then
                        local _ = off;
                    end;
                    render.text(v22.verdana_bold, vector(v26.x / 2 + 1, v26.y / 2 - 55), color(l_b_2[1], l_b_2[2], l_b_2[3], l_b_2[4]), "c", "\226\174\157");
                    render.text(v22.verdana_bold, vector(v26.x / 2 - 55, v26.y / 2), color(v506[1], v506[2], v506[3], v506[4]), "c", "\226\174\156");
                    render.text(v22.verdana_bold, vector(v26.x / 2 + 55, v26.y / 2), color(v507[1], v507[2], v507[3], v507[4]), "c", "\226\174\158");
                elseif v30.misc.ts.ts_type:get() == "Ambani" then
                    local l_r_2 = v30.misc.ts.accent_color:get().r;
                    local l_g_2 = v30.misc.ts.accent_color:get().g;
                    local l_b_3 = v30.misc.ts.accent_color:get().b;
                    local l_b_4 = v30.misc.ts.accent_color:get().b;
                    act = {
                        [1] = l_r_2, 
                        [2] = l_g_2, 
                        [3] = l_b_3, 
                        [4] = v492
                    };
                    off = {
                        [1] = 0, 
                        [2] = 0, 
                        [3] = 0, 
                        [4] = 0
                    };
                    l_b_4 = v30.antiaim.manual:get() == "Front" and act or off;
                    local v513 = v30.antiaim.manual:get() == "Left" and act or off;
                    local v514 = v30.antiaim.manual:get() == "Right" and act or off;
                    if v30.antiaim.manual:get() ~= "Disabled" or not act then
                        local _ = off;
                    end;
                    render.text(v22.verdana_bold, vector(v26.x / 2 + 1, v26.y / 2 - 55), color(l_b_4[1], l_b_4[2], l_b_4[3], l_b_4[4]), "c", "^");
                    render.text(v22.verdana_bold, vector(v26.x / 2 - 55, v26.y / 2), color(v513[1], v513[2], v513[3], v513[4]), "c", "\226\157\176");
                    render.text(v22.verdana_bold, vector(v26.x / 2 + 55, v26.y / 2), color(v514[1], v514[2], v514[3], v514[4]), "c", "\226\157\177");
                elseif v30.misc.ts.ts_type:get() == "Custom" then
                    local l_r_3 = v30.misc.ts.accent_color:get().r;
                    local l_g_3 = v30.misc.ts.accent_color:get().g;
                    local l_b_5 = v30.misc.ts.accent_color:get().b;
                    local l_b_6 = v30.misc.ts.accent_color:get().b;
                    act = {
                        [1] = l_r_3, 
                        [2] = l_g_3, 
                        [3] = l_b_5, 
                        [4] = v492
                    };
                    off = {
                        [1] = 0, 
                        [2] = 0, 
                        [3] = 0, 
                        [4] = 0
                    };
                    l_b_6 = v30.antiaim.manual:get() == "Front" and act or off;
                    local v520 = v30.antiaim.manual:get() == "Left" and act or off;
                    local v521 = v30.antiaim.manual:get() == "Right" and act or off;
                    if v30.antiaim.manual:get() ~= "Disabled" or not act then
                        local _ = off;
                    end;
                    render.text(v491[v30.misc.ts.font_manual:get()], vector(v26.x / 2 + 1, v26.y / 2 - 55), color(l_b_6[1], l_b_6[2], l_b_6[3], l_b_6[4]), "c", v30.misc.ts.forward_manual:get());
                    render.text(v491[v30.misc.ts.font_manual:get()], vector(v26.x / 2 - 55, v26.y / 2), color(v520[1], v520[2], v520[3], v520[4]), "c", v30.misc.ts.left_manual:get());
                    render.text(v491[v30.misc.ts.font_manual:get()], vector(v26.x / 2 + 55, v26.y / 2), color(v521[1], v521[2], v521[3], v521[4]), "c", v30.misc.ts.right_manual:get());
                end;
            end;
            return;
        end;
    end;
end);
local v523 = {
    scopebool = l_smoothy_0.new(1), 
    dt = l_smoothy_0.new(1), 
    hs = l_smoothy_0.new(1), 
    pa = l_smoothy_0.new(1), 
    fs = l_smoothy_0.new(1), 
    minmd = l_smoothy_0.new(1), 
    daind = l_smoothy_0.new(1), 
    ready = l_smoothy_0.new(1)
};
local function v562(v524)
    -- upvalues: v30 (ref), v36 (ref), v123 (ref)
    if not v30.misc.aimbotlogs:get() then
        return;
    else
        v36.reg = v36.reg + 1;
        if v524.state == nil then
            v36.hit = v36.hit + 1;
        end;
        v123.shots = math.max(v123.shots, 1);
        v123.percentage = math.floor(100 - v123.shots / v36.hit * 100);
        if v30.misc.aimbotlogs:get() then
            local v525 = "\aFFFFFFFF";
            local v526 = "\a" .. v30.misc.aimbotlogs.color:get():to_hex();
            if v524.state == nil then
                local v527 = v36.hitboxes[v524.hitgroup + 1];
                local l_damage_0 = v524.damage;
                local l_hitchance_0 = v524.hitchance;
                local l_wanted_damage_0 = v524.wanted_damage;
                local l_m_iHealth_1 = v524.target.m_iHealth;
                local l_backtrack_0 = v524.backtrack;
                local v533 = v524.target:get_name();
                local v534 = v526 .. "[OVERSENSE] " .. v525 .. "hit " .. v526 .. v533 .. v525 .. " in " .. v527 .. " for " .. v526 .. l_damage_0 .. v525 .. " (" .. l_wanted_damage_0 .. ") " .. "[" .. "history: " .. v526 .. l_backtrack_0 .. v525 .. " - " .. "hp: " .. v526 .. l_m_iHealth_1 .. v525 .. "]";
                local v535 = v526 .. "[OVERSENSE] " .. v525 .. "hit " .. v526 .. v533 .. v525 .. " in the " .. v526 .. v527 .. v525 .. " for " .. v526 .. l_damage_0 .. v525 .. " (" .. v526 .. l_m_iHealth_1 .. v525 .. " health remaining" .. ") " .. "[" .. "history: " .. v526 .. l_backtrack_0 .. v525 .. " | " .. "hc: " .. v526 .. l_hitchance_0 .. v525 .. "%" .. "]";
                if v30.misc.aimbotlogs.pos:get(1) then
                    print_dev(v535);
                end;
                if v30.misc.aimbotlogs.pos:get(2) then
                    print_raw(v534);
                end;
            end;
            if v524.state ~= nil then
                local v536 = v36.hitboxes[v524.wanted_hitgroup + 1];
                local l_state_0 = v524.state;
                local l_hitchance_1 = v524.hitchance;
                local v539 = v524.spread == nil and "max" or math.ceil(v524.spread * 10) / 10;
                local l_wanted_damage_1 = v524.wanted_damage;
                local l_m_iHealth_2 = v524.target.m_iHealth;
                local l_backtrack_1 = v524.backtrack;
                local v543 = v524.target:get_name();
                local v544 = v526 .. "" .. v526 .. "[OVERSENSE] " .. v525 .. "missed " .. v525 .. "shot at " .. v526 .. v543 .. v525 .. " in " .. v536 .. " due to " .. v526 .. l_state_0 .. v525 .. " (" .. l_hitchance_1 .. "%" .. ") " .. "[" .. "damage: " .. v526 .. l_wanted_damage_1 .. v525 .. " - " .. "history: " .. v526 .. l_backtrack_1 .. v525 .. " - " .. "spread: " .. v526 .. v539 .. v525 .. "]";
                local v545 = v526 .. "" .. v526 .. "[OVERSENSE] " .. v525 .. "missed " .. v526 .. v543 .. v525 .. " in the " .. v526 .. v536 .. v525 .. " due to " .. v526 .. l_state_0 .. v525 .. " (" .. v526 .. l_m_iHealth_2 .. v525 .. " health remaining" .. ") " .. "[" .. "history: " .. v526 .. l_backtrack_1 .. v525 .. " | " .. "hc: " .. v526 .. l_hitchance_1 .. v525 .. "%" .. "]";
                if v30.misc.aimbotlogs.pos:get(1) then
                    print_dev(v545);
                end;
                if v30.misc.aimbotlogs.pos:get(2) then
                    print_raw(v544);
                end;
            end;
        end;
        if v30.misc.aimbotlogs:get() then
            local v546 = "\aFFFFFFFF";
            local v547 = "\a" .. string.sub(v30.misc.aimbotlogs.color1:get():to_hex(), 1, 6) .. "FF";
            if v524.state == nil then
                local v548 = v36.hitboxes[v524.hitgroup + 1];
                local l_damage_1 = v524.damage;
                local l_hitchance_2 = v524.hitchance;
                local _ = v524.wanted_damage;
                local l_m_iHealth_3 = v524.target.m_iHealth;
                local l_backtrack_2 = v524.backtrack;
                local v554 = v524.target:get_name();
                table.insert(v36.data, 1, {
                    alpha = 0, 
                    text = "" .. v547 .. "" .. v546 .. "hit " .. v547 .. v554 .. v546 .. " in " .. v548 .. " for " .. v547 .. l_damage_1 .. v546 .. " (" .. l_hitchance_2 .. "%" .. ") " .. "[" .. "history: " .. v547 .. l_backtrack_2 .. v546 .. " - " .. "hp: " .. v547 .. l_m_iHealth_3 .. v546 .. "]", 
                    time = globals.realtime
                });
            end;
            if v524.state ~= nil then
                local v555 = v36.hitboxes[v524.wanted_hitgroup + 1];
                local l_state_1 = v524.state;
                local l_hitchance_3 = v524.hitchance;
                local v558 = v524.spread == nil and "max" or math.ceil(v524.spread * 10) / 10;
                local l_wanted_damage_3 = v524.wanted_damage;
                local l_backtrack_3 = v524.backtrack;
                local v561 = v524.target:get_name();
                table.insert(v36.data, 1, {
                    alpha = 0, 
                    text = "" .. v547 .. "" .. "missed " .. v546 .. "shot at " .. v547 .. v561 .. v546 .. " in " .. v555 .. " due to " .. v547 .. l_state_1 .. v546 .. " (" .. l_hitchance_3 .. "%" .. ") " .. "[" .. "damage: " .. v547 .. l_wanted_damage_3 .. v546 .. " - " .. "history: " .. v547 .. l_backtrack_3 .. v546 .. " - " .. "spread: " .. v547 .. v558 .. v546 .. "]", 
                    time = globals.realtime
                });
            end;
        end;
        return;
    end;
end;
hurt = function(v563)
    -- upvalues: v30 (ref)
    local v564 = entity.get_local_player();
    local v565 = entity.get(v563.attacker, true);
    local v566 = entity.get(v563.userid, true);
    local l_weapon_0 = v563.weapon;
    local l_health_0 = v563.health;
    local v569 = v30.misc.aimbotlogs.color:get():to_hex();
    local v570 = "DEFAULT";
    local v571 = ({
        hegrenade = l_health_0 > 0 and "Explode" or "Exploded", 
        inferno = l_health_0 > 0 and "Burn" or "Burned", 
        knife = l_health_0 > 0 and "Hit" or "Knifed"
    })[l_weapon_0];
    if v566 == v564 or v565 ~= v564 then
        return;
    elseif v571 == nil then
        return;
    else
        print_raw(("\a%s\a%s ~ " .. v571 .. " \a%s%s\a%s for \a%s%s\a%s (\a%s%s\a%s remaining)"):format(v569, v570, v569, v566:get_name(), v570, v569, v563.dmg_health, v570, v569, v563.health, v570));
        return;
    end;
end;
local v572 = {
    Default = 1, 
    Pixel = 2, 
    Tahoma = 3, 
    Bold = 4
};
local v573 = {
    Tahoma = 3, 
    Default = 1, 
    Bold = 4
};
local v574 = {
    Left = 60, 
    Bottom = v27.screen.x + 15, 
    Right = v27.fullscreen.x - 60
};
local v575 = {
    Bottom = v27.fullscreen.y - 10, 
    Left = v27.screen.y + 18, 
    Right = v27.screen.y + 18
};
local _ = {
    Bottom = v27.fullscreen.y - 3.5, 
    Left = v27.screen.y + 18, 
    Right = v27.screen.y + 18
};
local _ = {
    Left = 90, 
    Bottom = v27.screen.x + 2, 
    Right = v27.fullscreen.x - 90
};
local _ = {
    [1] = v27.screen.x + 2
};
local function v605()
    -- upvalues: v30 (ref), v124 (ref), l_monylinear_0 (ref), v523 (ref), v28 (ref), v573 (ref), v27 (ref), v445 (ref), v572 (ref), v574 (ref), v575 (ref)
    local v579 = entity.get_local_player();
    local v580 = v30.misc.crosshair.style:get();
    local v581 = v30.misc.crosshair:get();
    local v582 = v30.misc.crosshair.crosshaircolor:get();
    v124.get_bind = function(v583)
        local v584 = false;
        local v585 = 0;
        local v586 = ui.get_binds();
        for v587 = 1, #v586 do
            if v586[v587].name == v583 and v586[v587].active then
                v584 = true;
                v585 = v586[v587].value;
            end;
        end;
        return {
            [1] = v584, 
            [2] = v585
        };
    end;
    local v588 = 0;
    if v581 then
        v588 = v30.misc.crosshair.offset:get() or 0;
    else
        v30.misc.crosshair.offset:set(0);
    end;
    if v581 and v580 == "Default" then
        if v579 == nil or not v579:is_alive() then
            return;
        else
            local v589 = l_monylinear_0:Animate("oversense", {
                color(v582.r * 1.2, v582.g * 1.2, v582.b * 1.2, 255), 
                color(v582.r * 0.8, v582.g * 0.8, v582.b * 0.8, 155)
            }, 4, 2);
            v523.scopebool(0.1, v579.m_bIsScoped and 1 or 0);
            v523.dt(0.1, v28.dt:get() and 1 or 0);
            v523.hs(0.1, v28.hs:get() and 1 or 0);
            v523.daind(0.1, v30.misc.dormantaim:get() and 1 or 0);
            v523.fs(0.1, (not not v28.fs:get_override() or v28.fs:get()) and 1 or 0);
            v523.ready(0.1, rage.exploit:get() == 1 and 1 or 0);
            render.text(v573[v30.misc.crosshair.fontcrosshair:get()], vector(v27.screen.x + 40 * v523.scopebool.value, v27.screen.y + 20 + v588), color(255), "c", v589);
            render.text(v573[v30.misc.crosshair.fontcrosshair:get()], vector(v27.screen.x + 40 * v523.scopebool.value, v27.screen.y + 30 + v588), color(255, 255 * v523.ready.value + 100 * -(v523.ready.value - 1), 255 * v523.ready.value + 100 * -(v523.ready.value - 1), 255 * v523.dt.value), "c", "doubletap");
            render.text(v573[v30.misc.crosshair.fontcrosshair:get()], vector(v27.screen.x + 37 * v523.scopebool.value, v27.screen.y + 31 + 10 * v523.dt.value + 10 * v523.hs.value + v588), color(255, 255, 255, 255 * v523.daind.value), "c", "dormant");
            render.text(v573[v30.misc.crosshair.fontcrosshair:get()], vector(v27.screen.x + 26 * v523.scopebool.value, v27.screen.y + 31 + 10 * v523.dt.value + v588), color(255, 255, 255, 255 * v523.hs.value), "c", "hide");
            render.text(v573[v30.misc.crosshair.fontcrosshair:get()], vector(v27.screen.x + 20 * v523.scopebool.value, v27.screen.y + 31 + 10 * v523.dt.value + 10 * v523.hs.value + 10 * v523.daind.value + v588), color(255, 255, 255, 255 * v523.fs.value), "c", "fs");
        end;
    elseif v581 and v580 == "Modern" then
        if v579 == nil or not v579:is_alive() then
            return;
        else
            local v590 = l_monylinear_0:Animate("oversense", {
                color(v582.r * 1.2, v582.g * 1.2, v582.b * 1.2, 255), 
                color(v582.r * 0.8, v582.g * 0.8, v582.b * 0.8, 200)
            }, 4, 2);
            v523.scopebool(0.1, v579.m_bIsScoped and 1 or 0);
            v523.dt(0.1, v28.dt:get() and 1 or 0);
            v523.hs(0.1, v28.hs:get() and 1 or 0);
            v523.daind(0.1, v30.misc.dormantaim:get() and 1 or 0);
            v523.minmd(0.1, v124.get_bind("Min. Damage")[1] and 1 or 0);
            v523.fs(0.1, (not not v28.fs:get_override() or v28.fs:get()) and 1 or 0);
            v523.ready(0.1, rage.exploit:get());
            render.text(4, vector(v27.screen.x + 30 * v523.scopebool.value, v27.screen.y + 20 + v588), color(255), "c", v590);
            render.text(2, vector(v27.screen.x + 30 * v523.scopebool.value, v27.screen.y + 31 + v588), color(255), "c", v27.cond2[v445(false)]);
            render.text(2, vector(v27.screen.x + 30 * v523.scopebool.value, v27.screen.y + 41 + v588), color(255, 255 * v523.ready.value + 100 * -(v523.ready.value - 1), 255 * v523.ready.value + 100 * -(v523.ready.value - 1), 255 * v523.dt.value), "c", "DT");
            render.circle_outline(vector(v27.screen.x + 30 * v523.scopebool.value + 8, v27.screen.y + 41 + v588), color(255, 255 * v523.ready.value + 100 * -(v523.ready.value - 1), 255 * v523.ready.value + 100 * -(v523.ready.value - 1), 255 * v523.dt.value), 4, 0, rage.exploit:get(), 2);
            render.text(2, vector(v27.screen.x + 30 * v523.scopebool.value, v27.screen.y + 41 + 10 * v523.dt.value + v588), color(v582.r, v582.g, v582.b, 255 * v523.hs.value), "c", "OSAA");
            render.text(2, vector(v27.screen.x + 30 * v523.scopebool.value, v27.screen.y + 41 + 10 * v523.dt.value + 10 * v523.hs.value + v588), color(v582.r, v582.g, v582.b, 255 * v523.minmd.value), "c", "DMG");
            render.text(2, vector(v27.screen.x + 30 * v523.scopebool.value, v27.screen.y + 41 + 10 * v523.dt.value + 10 * v523.hs.value + 10 * v523.minmd.value + v588), color(v582.r, v582.g, v582.b, 255 * v523.daind.value), "c", "DA");
            if v30.misc.crosshair.glowcross:get() then
                render.shadow(vector(v27.screen.x + 30 * v523.scopebool.value - 61, v27.screen.y + v588 - 14), vector(50), color(v582.r, v582.g, v582.b, 255), 20, 50, 5);
            end;
        end;
    end;
    local v591 = entity.get_local_player();
    local v592 = v30.info.watermark32.watermarkaccent1:get();
    v28.weaponact:override();
    v28.scope:override();
    local _ = render.screen_size();
    if not v30.misc.crosshair:get() and not tab_enabled then
        local v594 = l_monylinear_0:Animate("O V E R S E N S E", {
            color(v592.r * 1.2, v592.g * 1.2, v592.b * 1.2, 255), 
            color(v592.r * 0.8, v592.g * 0.8, v592.b * 0.8, 155)
        }, 4, 3);
        if v30.info.watermark32.watermarkstyle:get() == "Default" then
            render.text(v572[v30.info.watermark32.watermarkfonts:get()], vector(v574[v30.info.watermark32.watermark2:get()], v575[v30.info.watermark32.watermark2:get()]), color(v592.r, v592.g, v592.b), "c", v594 .. "\n");
        elseif v30.info.watermark32.watermarkstyle:get() == "Custom" then
            render.text(v572[v30.info.watermark32.watermarkfonts:get()], vector(v574[v30.info.watermark32.watermark2:get()], v575[v30.info.watermark32.watermark2:get()]), color(v592.r, v592.g, v592.b), "c", v30.info.watermark32.watermarkstylename:get());
        end;
    end;
    if ui.get_alpha() > 0.1 then
        local v595 = l_monylinear_0:Animate("O V E R S E N S E", {
            color(200), 
            color(100)
        }, 5, 10);
        ui.sidebar(v595, ui.get_icon("bolt"));
    end;
    if v30.misc.scope:get() and v591 ~= nil and v591:is_alive() then
        v28.scope:override("Remove All");
        v523.scopebool(0, v591.m_bIsScoped and 1 or 0);
        local l_x_3 = render.screen_size().x;
        local l_y_3 = render.screen_size().y;
        local v598 = v30.misc.scope.color.color:get();
        local v599 = v30.misc.scope.color:get() == "default" and color(v598.r, v598.g, v598.b, 0 * v523.scopebool.value) or color(v598.r, v598.g, v598.b, v598.a);
        local v600 = v30.misc.scope.color:get() == "default" and color(v598.r, v598.g, v598.b, v598.a) or color(v598.r, v598.g, v598.b, 0 * v523.scopebool.value);
        local v601 = v30.misc.scope.length:get() * v523.scopebool.value;
        local v602 = v30.misc.scope.gap:get();
        local v603 = color(v30.misc.scope.color.color:get().r, v30.misc.scope.color.color:get().g, v30.misc.scope.color.color:get().b, v30.misc.scope.color.color:get().a);
        local v604 = color(v30.misc.scope.color.color:get().r, v30.misc.scope.color.color:get().g, v30.misc.scope.color.color:get().b, 0);
        if v30.misc.scope.color:get() == "Default" then
            render.gradient(vector(v27.screen.x, v27.screen.y - v602 + 1), vector(v27.screen.x + 1, v27.screen.y - v602 - v601 + 1), v599, v599, v600, v600);
            render.gradient(vector(v27.screen.x, v27.screen.y + v602), vector(v27.screen.x + 1, v27.screen.y + v602 + v601), v599, v599, v600, v600);
            render.gradient(vector(v27.screen.x - v602 + 1, v27.screen.y), vector(v27.screen.x - v602 - v601 + 1, v27.screen.y + 1), v599, v600, v599, v600);
            render.gradient(vector(v27.screen.x + v602, v27.screen.y), vector(v27.screen.x + v602 + v601, v27.screen.y + 1), v599, v600, v599, v600);
        elseif v30.misc.scope.color:get() == "Reversed" then
            render.gradient(vector(l_x_3 / 2 - v602 - v601, l_y_3 / 2 + 1), vector(l_x_3 / 2 - v602, l_y_3 / 2), v603, v604, v603, v604);
            render.gradient(vector(l_x_3 / 2 + v602 + v601, l_y_3 / 2 + 1), vector(l_x_3 / 2 + v602, l_y_3 / 2), v603, v604, v603, v604);
            render.gradient(vector(l_x_3 / 2 + 1, l_y_3 / 2 + v602 + v601), vector(l_x_3 / 2, l_y_3 / 2 + v602), v603, v604, v603, v604);
            render.gradient(vector(l_x_3 / 2 + 1, l_y_3 / 2 - v602 - v601), vector(l_x_3 / 2, l_y_3 / 2 - v602), v603, v604, v603, v604);
        end;
    end;
end;
local v606 = 0;
events.override_view:set(function(v607)
    -- upvalues: v30 (ref), v606 (ref), v76 (ref), v28 (ref)
    if v30.misc.scope.animatezoom:get() then
        local v608 = entity.get_local_player();
        if v608 == nil then
            return;
        else
            local v609 = v608:get_player_weapon();
            if v609 == nil then
                return;
            else
                local v610 = 0;
                if v608.m_bIsScoped then
                    if v609.m_zoomLevel == 1 then
                        v610 = 10;
                    elseif v609.m_zoomLevel == 2 then
                        v610 = 20;
                    end;
                end;
                if v608.m_bIsScoped then
                    v606 = v76(v606, v28.fov:get() - v610, 12);
                else
                    v606 = v76(v606, v28.fov:get(), 12);
                end;
                v607.fov = v606;
            end;
        end;
    end;
end);
local v615 = {
    speed = 3, 
    step = 1, 
    list = {
        [1] = " ", 
        [2] = "o ", 
        [3] = "ov ", 
        [4] = "ove ", 
        [5] = "over ", 
        [6] = "overs ", 
        [7] = "overse ", 
        [8] = "oversen ", 
        [9] = "oversens ", 
        [10] = "oversense ", 
        [11] = "oversense ", 
        [12] = "oversense ", 
        [13] = "oversens ", 
        [14] = "oversen", 
        [15] = "overse ", 
        [16] = "overs ", 
        [17] = "over ", 
        [18] = "ove ", 
        [19] = "ov ", 
        [20] = "o ", 
        [21] = " "
    }, 
    run = function(v611)
        -- upvalues: v28 (ref), v30 (ref)
        local function v613()
            -- upvalues: v611 (ref), v28 (ref)
            local v612 = math.floor(globals.curtime * v611.speed + 0.5) % #v611.list + 1;
            if v612 == v611.step then
                return;
            else
                v611.step = v612;
                v28.clantag:override(false);
                common.set_clan_tag(v611.list[v612]);
                return;
            end;
        end;
        v30.misc.clantag:set_callback(function(v614)
            -- upvalues: v613 (ref)
            if v614:get(3) then
                events.net_update_end:set(v613);
            else
                events.net_update_end:unset(v613);
                common.set_clan_tag("");
            end;
        end, true);
    end
};
local function v616()
    -- upvalues: v28 (ref)
    cvar.r_aspectratio:float(0);
    cvar.viewmodel_fov:float(68, true);
    cvar.viewmodel_offset_x:float(2.5, true);
    cvar.viewmodel_offset_y:float(0, true);
    cvar.viewmodel_offset_z:float(-1.5, true);
    common.set_clan_tag("");
    v28.clantag:override();
end;
trashtalk = {
    phrases = {
        kill = {
            [1] = {
                text = {
                    [1] = {
                        delay = 1, 
                        text = "\209\135\209\145 \208\190\209\130\209\129\208\190\209\129\208\176\208\187"
                    }, 
                    [2] = {
                        delay = 3, 
                        text = "\208\191\208\184\208\180\208\190\209\128\208\176\209\129 \209\133\209\131\209\145\208\178\209\139\208\185"
                    }
                }
            }, 
            [2] = {
                text = {
                    [1] = {
                        delay = 1, 
                        text = "\208\186\208\176\208\191\208\181\209\134 \209\130\209\139 \208\180\208\176\208\187\208\177\208\176\209\145\208\177 \208\177\208\187\209\143"
                    }, 
                    [2] = {
                        delay = 2, 
                        text = "\208\189\208\176 \209\136\208\176\208\188\208\191\209\131\209\128 \209\130\208\181\208\177\209\143 \209\129\208\176\208\180\208\184\208\187"
                    }
                }
            }, 
            [3] = {
                text = {
                    [1] = {
                        delay = 1, 
                        text = "1"
                    }, 
                    [2] = {
                        delay = 3, 
                        text = "\208\191\208\184\208\180\208\190\209\128\208\176\209\129"
                    }
                }
            }, 
            [4] = {
                text = {
                    [1] = {
                        delay = 1, 
                        text = "\209\129 \208\188\208\176\208\188\208\190\208\185 \209\130\208\178\208\190\208\181\208\185"
                    }, 
                    [2] = {
                        delay = 4, 
                        text = "\208\180\208\182\208\176\208\179\208\176 \208\180\208\182\208\176\208\179\208\176 \208\178\209\129\209\142 \208\189\208\190\209\135\209\140 \208\180\208\181\208\187\208\176\208\187\208\184"
                    }
                }
            }, 
            [5] = {
                text = {
                    [1] = {
                        delay = 1, 
                        text = "\208\177\208\187\209\143 \209\129\208\187\208\190\209\131\208\191\208\190\208\186 \208\181\208\177\208\176\208\189\209\139\208\185"
                    }, 
                    [2] = {
                        delay = 4, 
                        text = "\208\187\208\184\208\178\208\189\208\184 \209\131\208\182\208\181"
                    }
                }
            }, 
            [6] = {
                text = {
                    [1] = {
                        delay = 2, 
                        text = "\208\177\208\187\209\143\209\130\209\140 \208\189\209\131 \208\186\208\176\208\186\208\190\208\185 \208\182\208\181 \209\130\209\139"
                    }, 
                    [2] = {
                        delay = 4, 
                        text = "\209\129\208\187\208\176\208\177\209\139\208\185 \208\180\208\176\209\131\208\189 \208\177\208\187\209\143"
                    }
                }
            }, 
            [7] = {
                text = {
                    [1] = {
                        delay = 1, 
                        text = "\208\181\209\137\209\145 \208\190\208\180\208\184\208\189 \208\191\208\184\208\180\208\190\209\128\208\176\209\129 \208\191\208\190\208\180\209\131\208\188\208\176\208\187 \209\135\209\130\208\190 \209\131\208\177\209\140\209\145\209\130 \209\133\208\176\209\133"
                    }, 
                    [2] = {
                        delay = 3, 
                        text = "\209\143 \208\188\208\176\209\130\209\140 \209\130\208\178\208\190\209\142 \208\181\208\177\208\176\208\187"
                    }
                }
            }, 
            [8] = {
                text = {
                    [1] = {
                        delay = 1, 
                        text = "\208\157 \208\149 \208\159 \208\158 \208\145 \208\149 \208\148 \208\152 \208\156 \208\171 \208\153  \208\161"
                    }, 
                    [2] = {
                        delay = 2, 
                        text = "O V E R S E N S E"
                    }
                }
            }, 
            [9] = {
                text = {
                    [1] = {
                        delay = 1, 
                        text = "\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165 \208\189\208\176 \208\184\208\188\208\179\209\131\209\128 \209\130\208\181\208\177\209\143 \208\183\208\176\208\187\209\140\209\142 \208\180\208\176\208\187\208\177\208\176\209\145\208\177\208\176"
                    }, 
                    [2] = {
                        delay = 3, 
                        text = "\209\135\209\130\208\190\208\177\209\139 \208\188\208\176\209\130\209\140 \209\131\208\183\208\189\208\176\208\187\208\176 \208\186\208\176\208\186\208\190\208\185 \209\133\209\131\209\145\208\178\209\139\208\185 \209\129\209\139\208\189 \209\131 \208\189\208\181\209\145"
                    }
                }
            }, 
            [10] = {
                text = {
                    [1] = {
                        delay = 1, 
                        text = "\208\158 \208\161 \208\162 \208\144 \208\146 \208\144 \208\162 \208\161 \208\175  \208\157 \208\149  \208\159 \208\158 \208\145 \208\149 \208\148 \208\152 \208\156 \208\171 \208\156"
                    }, 
                    [2] = {
                        delay = 1, 
                        text = ""
                    }
                }
            }
        }, 
        death = {
            [1] = {
                text = {
                    [1] = {
                        delay = 1, 
                        text = "\208\189\209\131 \208\178\208\190\209\130 \208\181\209\137\208\181 \208\190\208\180\208\184\208\189 \208\191\208\184\208\180\208\190\209\128\208\176\209\129 \208\190\208\189\208\187\208\184 \208\189\208\176 \209\131\208\180\208\176\209\135\209\131 \208\189\208\176\208\180\208\181\208\181\209\130\209\129\209\143"
                    }, 
                    [2] = {
                        delay = 4, 
                        text = "\209\143 \208\188\208\176\209\130\209\140 \209\130\208\178\208\190\209\142 \208\181\208\177\208\176\208\187 \209\133\208\176\209\135 \209\130\209\131\208\191\208\190\208\185"
                    }
                }
            }, 
            [2] = {
                text = {
                    [1] = {
                        delay = 1, 
                        text = "\209\131\208\182\208\176\209\129 \208\181\208\177\208\176\208\189\209\139\208\185"
                    }, 
                    [2] = {
                        delay = 4, 
                        text = "\208\178\208\190\209\130 \208\186\208\176\208\186 \208\188\208\181\208\189\209\143 \209\130\208\176\208\186\208\184\208\181 \209\129\209\139\208\189\208\190\208\178\209\140\209\143 \209\136\208\187\209\142\209\133 \209\131\208\177\208\184\208\178\208\176\209\142\209\130"
                    }
                }
            }, 
            [3] = {
                text = {
                    [1] = {
                        delay = 1, 
                        text = "\208\177\208\187\209\143\209\130\209\140"
                    }, 
                    [2] = {
                        delay = 3, 
                        text = "\208\180\208\176\208\187\208\177\208\176\209\145\208\177 \209\130\209\131\208\191\208\190\208\185 \209\131\208\177\208\184\208\187 \208\190\208\191\209\143\209\130\209\140"
                    }
                }
            }, 
            [4] = {
                text = {
                    [1] = {
                        delay = 1, 
                        text = "\208\144\208\165\208\144\208\165\208\144\208\165\208\144\208\165\208\165\208\144\208\165\208\144\208\165\208\144"
                    }, 
                    [2] = {
                        delay = 4, 
                        text = "\208\152 \208\162\208\171 \208\147\208\158\208\146\208\158\208\160\208\152\208\168\208\172 \208\167\208\162\208\158 \208\162\208\149\208\145\208\149 \208\157\208\149 \208\146\208\149\208\151\208\129\208\162 \208\161\208\171\208\157 \208\168\208\155\208\174\208\165\208\152"
                    }
                }
            }, 
            [5] = {
                text = {
                    [1] = {
                        delay = 3, 
                        text = "\208\149\208\169\208\129 \208\160\208\144\208\151 \208\156\208\149\208\157\208\175 \208\163\208\145\208\172\208\129\208\168\208\172 \208\152 \208\175"
                    }, 
                    [2] = {
                        delay = 4, 
                        text = "\208\162\208\149\208\145\208\149 \208\151\208\163\208\145\208\171 \208\146\208\171\208\160\208\146\208\163"
                    }, 
                    [3] = {
                        delay = 5, 
                        text = "\208\156\208\144\208\162\208\172 \208\162\208\146\208\158\208\174 \208\146\208\171\208\159\208\158\208\162\208\160\208\158\208\168\208\163"
                    }, 
                    [4] = {
                        delay = 6, 
                        text = "\208\152 \208\145\208\144\208\145\208\154\208\163 \208\151\208\144\208\160\208\149\208\150\208\163 \208\157\208\144\208\165\208\163\208\153"
                    }
                }
            }, 
            [6] = {
                text = {
                    [1] = {
                        delay = 1, 
                        text = "\208\177\208\187\209\143\209\130\209\140 \208\186\208\176\208\186\208\190\208\185 \208\182\208\181 \209\130\209\139 \209\133\209\131\209\145\208\178\209\139\208\185"
                    }, 
                    [2] = {
                        delay = 4, 
                        text = "\208\191\209\128\208\190\209\129\209\130\208\190 \208\189\208\176 \209\135\208\184\209\130 \208\189\208\176\208\180\208\181\208\181\209\136\209\129\209\143 \208\186\208\176\208\186 \208\178\209\129\208\181\208\179\208\180\208\176"
                    }, 
                    [3] = {
                        delay = 6, 
                        text = "\208\177\208\181\208\183\208\188\208\176\208\188\208\189\208\190\208\181 \209\135\209\131\209\135\208\181\208\187\208\190 \208\188\208\176\209\130\209\140 \209\130\208\178\208\190\209\142 \208\181\208\177\208\176\208\187"
                    }, 
                    [4] = {
                        delay = 8, 
                        text = "\209\131\209\145\208\177\208\184\209\137\208\181 \208\187\208\176\208\186\208\181\209\128\208\189\208\190\208\181 \209\130\209\131\208\191\208\190\208\181"
                    }
                }
            }
        }, 
        revenge = {
            [1] = {
                text = {
                    [1] = {
                        delay = 1.5, 
                        text = "1"
                    }, 
                    [2] = {
                        delay = 2.5, 
                        text = "\208\190\209\130\209\129\208\190\209\129\208\176\208\187 \208\178\209\129\209\145 \209\130\208\176\208\186\208\184"
                    }
                }
            }, 
            [2] = {
                text = {
                    [1] = {
                        delay = 1.5, 
                        text = "1"
                    }, 
                    [2] = {
                        delay = 2.5, 
                        text = "\208\184 \209\130\208\176\208\186\208\190\208\181 \209\131\208\177\208\184\208\178\208\176\208\181\209\130 \208\188\208\181\208\189\209\143 \209\143 \208\178 \208\176\209\133\209\131\208\181"
                    }
                }
            }
        }
    }
};
previous_number = nil;
local function v622(v617)
    local v618 = nil;
    if v617 == "kill" then
        v618 = trashtalk.phrases.kill;
    elseif v617 == "death" then
        v618 = trashtalk.phrases.death;
    elseif v617 == "revenge" then
        v618 = trashtalk.phrases.revenge;
    else
        return;
    end;
    if #v618 ~= 1 then
        repeat
            number = math.random(#v618);
        until number ~= previous_number;
    else
        number = math.random(#v618);
    end;
    previous_number = number;
    local v619 = v618[number];
    for v620 = 1, #v619.text do
        do
            local l_v620_0 = v620;
            utils.execute_after(v619.text[l_v620_0].delay, function()
                -- upvalues: v619 (ref), l_v620_0 (ref)
                utils.console_exec("say \"" .. v619.text[l_v620_0].text .. "\"");
            end);
        end;
    end;
end;
revenge_guy = nil;
events.player_death:set(function(v623)
    -- upvalues: v30 (ref), v622 (ref)
    if not v30.misc.trashtalk:get() then
        return;
    else
        local v624 = entity.get_local_player();
        local v625 = entity.get(v623.userid, true);
        local v626 = entity.get(v623.attacker, true);
        if v30.misc.trashtalk.trashtalkmode:get(1) and v625 ~= v626 and v626 == v624 then
            v622("kill");
        elseif v30.misc.trashtalk.trashtalkmode:get(2) and v625 == v624 and v624 ~= v626 then
            v622("death");
            revenge_guy = v626;
        elseif v30.misc.trashtalk.trashtalkmode:get(3) and v625 == revenge_guy then
            v622("revenge");
        end;
        return;
    end;
end);
events.round_start:set(function()
    revenge_guy = nil;
end);
local v627 = {
    SCREEN = render.screen_size()
};
local v628 = {
    groups = {
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
    list = {}
};
v628.push = function(v629, v630, v631, ...)
    -- upvalues: v628 (ref), l_smoothy_0 (ref)
    table.insert(v628.list, 1, {
        alpha = l_smoothy_0.new(0), 
        type = v631 or "none", 
        time = v630, 
        animation = l_smoothy_0.new(-90), 
        text = v629, 
        args = {
            ...
        }
    });
end;
v628.shot_event = function(v632)
    -- upvalues: v30 (ref), l_gradient_0 (ref), v628 (ref)
    if not v30.misc.aimbotlogs:get() then
        return;
    else
        local v633 = 3;
        local v634 = "";
        local v635 = string.format("\f%s", v634);
        if prefix_style == "Gradient" then
            v635 = l_gradient_0.text(v634, false, {
                first_color:alpha_modulate(255), 
                second_color:alpha_modulate(255)
            });
        end;
        local v636 = prefix_custom and string.format("[%s\aDEFAULT] ", v635) or "";
        if v632.state == nil then
            local v637 = string.format("%sHit \f%s\aDEFAULT in the \f%s\aDEFAULT for \f%s\aDEFAULT damage", v636, v632.target:get_name(), v628.groups[v632.hitgroup], v632.damage);
            v628.push(v637, v633, "hit", v632.target:get_steam_avatar());
            return;
        else
            local v638 = string.format("%sMissed \f%s\aDEFAULT in the \f%s\aDEFAULT due to \f%s", v636, v632.target:get_name(), v628.groups[v632.wanted_hitgroup], v632.state);
            v628.push(v638, v633, "miss", v632.target:get_steam_avatar());
            return;
        end;
    end;
end;
v628.handle = function()
    -- upvalues: v30 (ref), v627 (ref), v628 (ref)
    if not v30.misc.aimbotlogs.pos:get(3) then
        return;
    else
        local v639 = v30.misc.aimbotlogs.custom_color:get();
        local v640 = v30.misc.aimbotlogs.background_color:get();
        local v641 = v30.misc.aimbotlogs.logsaddons:get(2);
        local _ = v30.misc.aimbotlogs.logsaddons:get(1);
        local v643 = 3;
        local v644 = v30.misc.aimbotlogs.offset:get();
        local v645 = v627.SCREEN / 2 + vector(0, v644);
        local v646 = 0;
        for v647, v648 in ipairs(v628.list) do
            local v649 = ({
                hit = v639 and v30.misc.aimbotlogs.hit_color:get() or color("52D449FF"), 
                miss = v639 and v30.misc.aimbotlogs.miss_color:get() or color("D44949FF")
            })[v648.type];
            if string.find(v648.text, "\f") then
                v648.text = string.gsub(v648.text, "\f", string.format("\a%s", v649:to_hex()));
            end;
            v648.time = v648.time - globals.frametime;
            local v650 = v648.alpha(0.08, v648.time <= 0 and 0 or 1);
            local v651 = v648.animation(0.08, v648.time <= 0.1 and 90 or 0);
            local v652 = 25;
            local v653 = " | ";
            local v654 = render.measure_text(1, "", v648.text);
            local v655 = v641 and v645.y + v652 / 2 - v654.y / 2 + v646 or v645.y + v646;
            if v641 then
                local v656 = 15;
                local v657 = vector(13, 13);
                local v658 = v645 + vector(-(v654.x / 2) + v651 - v656 / 2, v646);
                local v659 = v654.x + v657.x + 7 + v656;
                render.rect(v658 - vector(v657.x, 0), vector(v659, v652), color(v640.r, v640.g, v640.b, v640.a * v650), 10);
                if v30.misc.aimbotlogs.logsaddons:get(1) then
                    render.shadow(v658 - vector(v657.x, 0), vector(v659, v652), v649:alpha_modulate(150 * v650), 30, nil, 10);
                end;
            end;
            render.text(1, vector(v645.x - (v654.x / 2 - 7) + v651 + (v641 and 3 or 0), v655), color(255, 255 * v650), "", v648.text);
            render.text(4, vector(v645.x - (v654.x / 2 + 15) + v651 + (v641 and 3 or 0), v655), color(168, 168, 94 * v650), "", ui.get_icon("triangle-exclamation") .. v653);
            if v643 < v647 or v650 < 0.01 then
                table.remove(v628.list, v647);
            end;
            v646 = v646 + (v641 and v652 + 5 or 13) * v650;
        end;
        return;
    end;
end;
events.render(v628.handle);
events.aim_ack(v628.shot_event);
local l_get_local_player_0 = entity.get_local_player;
local l_get_0 = entity.get;
local _ = table.insert;
local _ = table.remove;
local l_screen_size_0 = render.screen_size;
local _ = math.floor;
local l_line_0 = render.line;
local v667 = false;
local v668 = 1;
local v669 = 0.25;
local v670 = 0.25;
local function v672(v671)
    -- upvalues: l_get_local_player_0 (ref), l_get_0 (ref), v667 (ref), v669 (ref), v670 (ref), v668 (ref)
    if l_get_local_player_0() == l_get_0(v671.attacker, true) then
        v667 = true;
        v669 = 0.25;
        v670 = 0.25;
        v668 = 1;
    end;
end;
local function v674(v673)
    -- upvalues: l_get_local_player_0 (ref), l_get_0 (ref), v669 (ref), v670 (ref), v668 (ref), v667 (ref)
    if l_get_local_player_0() == l_get_0(v673.userid, true) then
        v669 = 0.25;
        v670 = 0.5;
        v668 = 1;
        v667 = false;
    end;
end;
local function v676()
    -- upvalues: v30 (ref), v667 (ref), l_screen_size_0 (ref), v670 (ref), v668 (ref), v669 (ref), l_line_0 (ref)
    if v30.misc.hitmarkers:get() then
        if globals.is_in_game == false then
            return;
        elseif v667 then
            local v675 = l_screen_size_0();
            v670 = v670 - globals.frametime;
            if v670 <= 0 then
                v668 = v668 - 1 / v669 * globals.frametime;
            end;
            l_line_0(vector(v675.x / 2 + 5, v675.y / 2 + 5), vector(v675.x / 2 + 10 / v675.x * v675.x, v675.y / 2 + 10 / v675.y * v675.y), color(255, 255, 255, 255 * v668));
            l_line_0(vector(v675.x / 2 - 5, v675.y / 2 + 5), vector(v675.x / 2 - 10 / v675.x * v675.x, v675.y / 2 + 10 / v675.y * v675.y), color(255, 255, 255, 255 * v668));
            l_line_0(vector(v675.x / 2 - 5, v675.y / 2 - 5), vector(v675.x / 2 - 10 / v675.x * v675.x, v675.y / 2 - 10 / v675.y * v675.y), color(255, 255, 255, 255 * v668));
            l_line_0(vector(v675.x / 2 + 5, v675.y / 2 - 5), vector(v675.x / 2 + 10 / v675.x * v675.x, v675.y / 2 - 10 / v675.y * v675.y), color(255, 255, 255, 255 * v668));
        end;
    end;
end;
events.round_start:set(function()
    -- upvalues: v667 (ref), v668 (ref), v669 (ref), v670 (ref)
    v667 = false;
    v668 = 1;
    v669 = 0.25;
    v670 = 0.25;
end);
events.render:set(function(_)
    -- upvalues: v676 (ref)
    v676();
end);
events.player_spawned:set(function(v678)
    -- upvalues: v674 (ref)
    v674(v678);
end);
events.player_hurt:set(function(v679)
    -- upvalues: v672 (ref)
    v672(v679);
end);
local l_world_to_screen_0 = render.world_to_screen;
local _ = render.rect;
local l_screen_size_1 = render.screen_size;
local _ = ui.find;
local v684 = 0.5;
local v685 = 1;
local v686 = {};
local function v694()
    -- upvalues: v30 (ref), v686 (ref), v684 (ref), l_world_to_screen_0 (ref), l_screen_size_1 (ref)
    if not v30.misc.hitmarkers.hitmarkerselect:get(2) then
        return;
    else
        for v687, v688 in pairs(v686) do
            if v688.FadeTime <= 0 then
                v686[v687] = nil;
            else
                v688.WaitTime = v688.WaitTime - globals.frametime;
                if v688.WaitTime <= 0 then
                    v688.FadeTime = v688.FadeTime - 1 / v684 * globals.frametime;
                end;
                local v689 = v30.misc.hitmarkers.kibitcolor:get();
                if v688.Position.x ~= nil and v688.Position.y ~= nil and v688.Position.z ~= nil and v688.Reason == nil then
                    local v690 = l_world_to_screen_0(vector(v688.Position.x, v688.Position.y, v688.Position.z));
                    if v690 ~= nil then
                        local l_x_4 = v690.x;
                        local l_y_4 = v690.y;
                        local v693 = l_screen_size_1();
                        render.rect_outline(vector(l_x_4 - 1 / v693.x * v693.x, l_y_4 - 5 / v693.y * v693.y), vector(l_x_4 + 1 / v693.x * v693.x, l_y_4 + 5 / v693.y * v693.y), color(v689.r, v689.g, v689.b, 255 * v688.FadeTime), 0, true);
                        render.rect_outline(vector(l_x_4 - 5 / v693.x * v693.x, l_y_4 - 1 / v693.y * v693.y), vector(l_x_4 + 5 / v693.x * v693.x, l_y_4 + 1 / v693.y * v693.y), color(v689.r, v689.g, v689.b, 255 * v688.FadeTime), 0, true);
                    end;
                end;
            end;
        end;
        return;
    end;
end;
local function v696(v695)
    -- upvalues: v686 (ref), v685 (ref)
    v686[v695.id] = {
        FadeTime = 1, 
        Position = v695.aim, 
        WaitTime = v685, 
        Reason = v695.state
    };
end;
events.render:set(function(_)
    -- upvalues: v694 (ref)
    v694();
end);
events.aim_ack:set(function(v698)
    -- upvalues: v696 (ref)
    v696(v698);
end);
events.round_start:set(function()
    -- upvalues: v686 (ref)
    v686 = {};
end);
events.player_spawned:set(function(_)
    -- upvalues: v686 (ref)
    v686 = {};
end);
l_pui_0.setup({
    [1] = v30.antiaim, 
    [2] = v33, 
    [3] = v34, 
    [4] = v30.misc
});
export = v89("presets.export", v25, function()
    -- upvalues: v30 (ref), l_pui_0 (ref), l_clipboard_0 (ref), l_base64_0 (ref), v41 (ref)
    if v30.info.presets_list:get() ~= 1 then
        local v700 = l_pui_0.save();
        local v701 = presets_data.name[v30.info.presets_list:get()];
        local v702 = {
            name = v701, 
            file = v700
        };
        l_clipboard_0.set(l_base64_0.encode(json.stringify(v702)));
        v41 = globals.realtime;
        v30.info.presets_success_export:name("\affe8dbff\f<file-import>  successfully exported: \r" .. v701);
    end;
end);
import = v89("presets.import", v25, function()
    -- upvalues: l_base64_0 (ref), l_clipboard_0 (ref), v97 (ref), v42 (ref), v30 (ref), v40 (ref)
    local v703 = json.parse(l_base64_0.decode(l_clipboard_0.get()));
    if v97(presets_data.name, v703.name) then
        v42 = globals.realtime;
        v30.info.presets_success_exist:name("\affdbe3ff\f<triangle-exclamation>  this preset already exist: \r" .. v703.name);
        return;
    else
        table.insert(presets_data.name, v703.name);
        table.insert(presets_data.file, v703.file);
        v30.info.presets_list:update(presets_data.name);
        files.write("nl/oversense/configuration.txt", l_base64_0.encode(json.stringify(presets_data)));
        v40 = globals.realtime;
        v30.info.presets_success_import:name("\affe8dbff\f<file-import>  successfully imported: \r" .. v703.name);
        return;
    end;
end);
create = v89("presets.save", v25, function()
    -- upvalues: v30 (ref), l_pui_0 (ref), v97 (ref), l_base64_0 (ref), v42 (ref)
    local v704 = v30.info.presets_name:get();
    local v705 = l_pui_0.save();
    if not v97(presets_data.name, v704) and v30.info.presets_name:get() ~= "" then
        table.insert(presets_data.name, v704);
        table.insert(presets_data.file, v705);
        files.write("nl/oversense/configuration.txt", l_base64_0.encode(json.stringify(presets_data)));
        v30.info.presets_list:update(presets_data.name);
    elseif v97(presets_data.name, v704) then
        v42 = globals.realtime;
        v30.info.presets_success_exist:name("\affdbe3ff\f<triangle-exclamation>  this preset already exist: \r" .. v704);
    end;
end);
save = v89("presets.save", v25, function()
    -- upvalues: v30 (ref), l_pui_0 (ref), l_base64_0 (ref)
    if v30.info.presets_list:get() ~= 1 then
        presets_data.file[v30.info.presets_list:get()] = l_pui_0.save();
        files.write("nl/oversense/configuration.txt", l_base64_0.encode(json.stringify(presets_data)));
    end;
end);
remove = v89("presets.remove", v25, function()
    -- upvalues: v30 (ref), l_base64_0 (ref)
    if v30.info.presets_list:get() ~= 1 then
        table.remove(presets_data.name, v30.info.presets_list:get());
        table.remove(presets_data.file, v30.info.presets_list:get());
        files.write("nl/oversense/configuration.txt", l_base64_0.encode(json.stringify(presets_data)));
        v30.info.presets_list:update(presets_data.name);
    end;
end);
aa = v89("presets.aa", v25, function()
    -- upvalues: v30 (ref), l_pui_0 (ref), l_base64_0 (ref)
    if v30.info.presets_list:get() ~= 1 then
        l_pui_0.load(presets_data.file[v30.info.presets_list:get()], 1);
        l_pui_0.load(presets_data.file[v30.info.presets_list:get()], 2);
        l_pui_0.load(presets_data.file[v30.info.presets_list:get()], 3);
    else
        local v706 = json.parse(l_base64_0.decode("eyJmaWxlIjpbeyJiYWNrc3RhYiI6dHJ1ZSwiY29uZGl0aW9ucyI6IlNoYXJlZCIsImVuYWJsZSI6MS4wLCJmbGlja2V4cGxvaXQiOmZhbHNlLCJmb3JjZWludGVycG9sYXRpb24iOmZhbHNlLCJmcyI6ZmFsc2UsImxhZGRlcl9zZWxlY3QiOnRydWUsIm1hbnVhbCI6IkRpc2FibGVkIiwibm9mYWxsZGFtYWdlIjp0cnVlLCJzYWZlIjp0cnVlLCJ+Y29uZGl0aW9ucyI6eyJiYXNlIjoiQXQgdGFyZ2V0IiwicGl0Y2giOiJEb3duIn0sIn5mbGlja2V4cGxvaXQiOnsiZmxpY2tzZXR0aW5ncyI6WzIuMCwzLjAsIn4iXX0sIn5tYW51YWwiOnsic3RhdGljIjpmYWxzZX0sIn5zYWZlIjp7IndlYXBvbnMiOls1LjAsNi4wLDcuMCwifiJdfX0sW3siYm9keXlhdyI6dHJ1ZSwiYnJlYWtsYyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6ZmFsc2UsIm1vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXciOiJCYWNrd2FyZCJ9LHsiYm9keXlhdyI6dHJ1ZSwiYnJlYWtsYyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6dHJ1ZSwibW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXciOiJCYWNrd2FyZCJ9LHsiYm9keXlhdyI6dHJ1ZSwiYnJlYWtsYyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6dHJ1ZSwibW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXciOiJCYWNrd2FyZCJ9LHsiYm9keXlhdyI6dHJ1ZSwiYnJlYWtsYyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6dHJ1ZSwibW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXciOiJCYWNrd2FyZCJ9LHsiYm9keXlhdyI6dHJ1ZSwiYnJlYWtsYyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6dHJ1ZSwibW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXciOiJCYWNrd2FyZCJ9LHsiYm9keXlhdyI6dHJ1ZSwiYnJlYWtsYyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6dHJ1ZSwibW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXciOiJCYWNrd2FyZCJ9LHsiYm9keXlhdyI6dHJ1ZSwiYnJlYWtsYyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6dHJ1ZSwibW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhdyI6IkJhY2t3YXJkIn0seyJib2R5eWF3Ijp0cnVlLCJicmVha2xjIjpmYWxzZSwiZGVmZW5zaXZlIjpmYWxzZSwiZW5hYmxlIjp0cnVlLCJtb2RpZmllciI6IkNlbnRlciIsInlhdyI6IkJhY2t3YXJkIn0seyJib2R5eWF3Ijp0cnVlLCJicmVha2xjIjpmYWxzZSwiZGVmZW5zaXZlIjpmYWxzZSwiZW5hYmxlIjp0cnVlLCJtb2RpZmllciI6IkRpc2FibGVkIiwieWF3IjoiQmFja3dhcmQifV0sW3siYm9keXlhd3JhbmRvbSI6MC4wLCJkZWxheSI6MS4wLCJkZWxheXJyYW5kb20iOmZhbHNlLCJkc2VsZWN0IjpbIn4iXSwiZnMiOiJPZmYiLCJsZWZ0IjowLjAsImxlZnRsaW1pdCI6NjAuMCwibW9kZSI6IlN0YXRpYyIsIm1vZGxlZnQiOjAuMCwibW9kbW9kZSI6IlN0YXRpYyIsIm1vZHJhbmRvbTN3YXkiOjAuMCwibW9kcmFuZG9tNXdheSI6MC4wLCJtb2RyaWdodCI6MC4wLCJtb2RzdGF0aWMiOjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInBpdGNoIjoiRGlzYWJsZWQiLCJwaXRjaHZhbHVlMSI6MC4wLCJwaXRjaHZhbHVlMiI6MC4wLCJyaWdodCI6MC4wLCJyaWdodGxpbWl0Ijo2MC4wLCJzdGF0aWMiOjAuMCwieWF3IjoiRGlzYWJsZWQiLCJ5YXdzcGVlZCI6MTAuMCwieWF3dmFsdWUxIjowLjAsInlhd3ZhbHVlMiI6MC4wLCJ5YXd3YXkxIjowLjAsInlhd3dheTIiOjAuMCwieWF3d2F5MyI6MC4wLCJ5YXd3YXk0IjowLjAsInlhd3dheTUiOjAuMH0seyJib2R5eWF3cmFuZG9tIjoyLjAsImRlbGF5IjoxLjAsImRlbGF5cnJhbmRvbSI6ZmFsc2UsImRzZWxlY3QiOlsifiJdLCJmcyI6Ik9mZiIsImxlZnQiOi0xNS4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJMZWZ0ICYgUmlnaHQiLCJtb2RsZWZ0IjowLjAsIm1vZG1vZGUiOiJTdGF0aWMiLCJtb2RyYW5kb20zd2F5IjowLjAsIm1vZHJhbmRvbTV3YXkiOjAuMCwibW9kcmlnaHQiOjAuMCwibW9kc3RhdGljIjoxNS4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicGl0Y2giOiJEaXNhYmxlZCIsInBpdGNodmFsdWUxIjowLjAsInBpdGNodmFsdWUyIjowLjAsInJpZ2h0IjoyNS4wLCJyaWdodGxpbWl0Ijo2MC4wLCJzdGF0aWMiOjAuMCwieWF3IjoiRGlzYWJsZWQiLCJ5YXdzcGVlZCI6MTAuMCwieWF3dmFsdWUxIjowLjAsInlhd3ZhbHVlMiI6MC4wLCJ5YXd3YXkxIjowLjAsInlhd3dheTIiOjAuMCwieWF3d2F5MyI6MC4wLCJ5YXd3YXk0IjowLjAsInlhd3dheTUiOjAuMH0seyJib2R5eWF3cmFuZG9tIjowLjAsImRlbGF5IjozLjAsImRlbGF5cnJhbmRvbSI6ZmFsc2UsImRzZWxlY3QiOlsifiJdLCJmcyI6Ik9mZiIsImxlZnQiOi0xOS4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJMZWZ0ICYgUmlnaHQiLCJtb2RsZWZ0IjowLjAsIm1vZG1vZGUiOiJTdGF0aWMiLCJtb2RyYW5kb20zd2F5IjowLjAsIm1vZHJhbmRvbTV3YXkiOjAuMCwibW9kcmlnaHQiOjAuMCwibW9kc3RhdGljIjoxMC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicGl0Y2giOiJEaXNhYmxlZCIsInBpdGNodmFsdWUxIjowLjAsInBpdGNodmFsdWUyIjowLjAsInJpZ2h0IjoyOS4wLCJyaWdodGxpbWl0Ijo2MC4wLCJzdGF0aWMiOjAuMCwieWF3IjoiRGlzYWJsZWQiLCJ5YXdzcGVlZCI6MTAuMCwieWF3dmFsdWUxIjowLjAsInlhd3ZhbHVlMiI6MC4wLCJ5YXd3YXkxIjowLjAsInlhd3dheTIiOjAuMCwieWF3d2F5MyI6MC4wLCJ5YXd3YXk0IjowLjAsInlhd3dheTUiOjAuMH0seyJib2R5eWF3cmFuZG9tIjowLjAsImRlbGF5IjoxLjAsImRlbGF5cnJhbmRvbSI6ZmFsc2UsImRzZWxlY3QiOlsifiJdLCJmcyI6Ik9mZiIsImxlZnQiOi0yOS4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJMZWZ0ICYgUmlnaHQiLCJtb2RsZWZ0IjowLjAsIm1vZG1vZGUiOiJTdGF0aWMiLCJtb2RyYW5kb20zd2F5IjowLjAsIm1vZHJhbmRvbTV3YXkiOjAuMCwibW9kcmlnaHQiOjAuMCwibW9kc3RhdGljIjoxMC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicGl0Y2giOiJEaXNhYmxlZCIsInBpdGNodmFsdWUxIjowLjAsInBpdGNodmFsdWUyIjowLjAsInJpZ2h0IjozMS4wLCJyaWdodGxpbWl0Ijo2MC4wLCJzdGF0aWMiOjAuMCwieWF3IjoiRGlzYWJsZWQiLCJ5YXdzcGVlZCI6MTAuMCwieWF3dmFsdWUxIjowLjAsInlhd3ZhbHVlMiI6MC4wLCJ5YXd3YXkxIjowLjAsInlhd3dheTIiOjAuMCwieWF3d2F5MyI6MC4wLCJ5YXd3YXk0IjowLjAsInlhd3dheTUiOjAuMH0seyJib2R5eWF3cmFuZG9tIjowLjAsImRlbGF5IjoyLjAsImRlbGF5cnJhbmRvbSI6ZmFsc2UsImRzZWxlY3QiOlsifiJdLCJmcyI6Ik9mZiIsImxlZnQiOi0xNC4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJMZWZ0ICYgUmlnaHQiLCJtb2RsZWZ0IjowLjAsIm1vZG1vZGUiOiJTdGF0aWMiLCJtb2RyYW5kb20zd2F5IjowLjAsIm1vZHJhbmRvbTV3YXkiOjAuMCwibW9kcmlnaHQiOjAuMCwibW9kc3RhdGljIjoxNC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicGl0Y2giOiJEaXNhYmxlZCIsInBpdGNodmFsdWUxIjowLjAsInBpdGNodmFsdWUyIjowLjAsInJpZ2h0IjoyNC4wLCJyaWdodGxpbWl0Ijo2MC4wLCJzdGF0aWMiOjAuMCwieWF3IjoiRGlzYWJsZWQiLCJ5YXdzcGVlZCI6MTAuMCwieWF3dmFsdWUxIjowLjAsInlhd3ZhbHVlMiI6MC4wLCJ5YXd3YXkxIjowLjAsInlhd3dheTIiOjAuMCwieWF3d2F5MyI6MC4wLCJ5YXd3YXk0IjowLjAsInlhd3dheTUiOjAuMH0seyJib2R5eWF3cmFuZG9tIjowLjAsImRlbGF5IjoxLjAsImRlbGF5cnJhbmRvbSI6ZmFsc2UsImRzZWxlY3QiOlsifiJdLCJmcyI6Ik9mZiIsImxlZnQiOi0xNi4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJMZWZ0ICYgUmlnaHQiLCJtb2RsZWZ0IjowLjAsIm1vZG1vZGUiOiJTdGF0aWMiLCJtb2RyYW5kb20zd2F5IjowLjAsIm1vZHJhbmRvbTV3YXkiOjAuMCwibW9kcmlnaHQiOjAuMCwibW9kc3RhdGljIjo2LjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJwaXRjaCI6IkRpc2FibGVkIiwicGl0Y2h2YWx1ZTEiOjAuMCwicGl0Y2h2YWx1ZTIiOjAuMCwicmlnaHQiOjM2LjAsInJpZ2h0bGltaXQiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXciOiJEaXNhYmxlZCIsInlhd3NwZWVkIjoxMC4wLCJ5YXd2YWx1ZTEiOjAuMCwieWF3dmFsdWUyIjowLjAsInlhd3dheTEiOjAuMCwieWF3d2F5MiI6MC4wLCJ5YXd3YXkzIjowLjAsInlhd3dheTQiOjAuMCwieWF3d2F5NSI6MC4wfSx7ImJvZHl5YXdyYW5kb20iOjAuMCwiZGVsYXkiOjEuMCwiZGVsYXlycmFuZG9tIjpmYWxzZSwiZHNlbGVjdCI6WyJ+Il0sImZzIjoiT2ZmIiwibGVmdCI6MC4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJTdGF0aWMiLCJtb2RsZWZ0IjowLjAsIm1vZG1vZGUiOiJTdGF0aWMiLCJtb2RyYW5kb20zd2F5IjowLjAsIm1vZHJhbmRvbTV3YXkiOjAuMCwibW9kcmlnaHQiOjAuMCwibW9kc3RhdGljIjowLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJwaXRjaCI6IkRpc2FibGVkIiwicGl0Y2h2YWx1ZTEiOjAuMCwicGl0Y2h2YWx1ZTIiOjAuMCwicmlnaHQiOjAuMCwicmlnaHRsaW1pdCI6NjAuMCwic3RhdGljIjowLjAsInlhdyI6IkRpc2FibGVkIiwieWF3c3BlZWQiOjEwLjAsInlhd3ZhbHVlMSI6MC4wLCJ5YXd2YWx1ZTIiOjAuMCwieWF3d2F5MSI6MC4wLCJ5YXd3YXkyIjowLjAsInlhd3dheTMiOjAuMCwieWF3d2F5NCI6MC4wLCJ5YXd3YXk1IjowLjB9LHsiYm9keXlhd3JhbmRvbSI6MC4wLCJkZWxheSI6MS4wLCJkZWxheXJyYW5kb20iOmZhbHNlLCJkc2VsZWN0IjpbIn4iXSwiZnMiOiJPZmYiLCJsZWZ0IjotMTIuMCwibGVmdGxpbWl0Ijo2MC4wLCJtb2RlIjoiTGVmdCAmIFJpZ2h0IiwibW9kbGVmdCI6MC4wLCJtb2Rtb2RlIjoiU3RhdGljIiwibW9kcmFuZG9tM3dheSI6MC4wLCJtb2RyYW5kb201d2F5IjowLjAsIm1vZHJpZ2h0IjowLjAsIm1vZHN0YXRpYyI6MjIuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInBpdGNoIjoiRGlzYWJsZWQiLCJwaXRjaHZhbHVlMSI6MC4wLCJwaXRjaHZhbHVlMiI6MC4wLCJyaWdodCI6MjIuMCwicmlnaHRsaW1pdCI6NjAuMCwic3RhdGljIjowLjAsInlhdyI6IkRpc2FibGVkIiwieWF3c3BlZWQiOjEwLjAsInlhd3ZhbHVlMSI6MC4wLCJ5YXd2YWx1ZTIiOjAuMCwieWF3d2F5MSI6MC4wLCJ5YXd3YXkyIjowLjAsInlhd3dheTMiOjAuMCwieWF3d2F5NCI6MC4wLCJ5YXd3YXk1IjowLjB9LHsiYm9keXlhd3JhbmRvbSI6MC4wLCJkZWxheSI6MS4wLCJkZWxheXJyYW5kb20iOmZhbHNlLCJkc2VsZWN0IjpbIn4iXSwiZnMiOiJPZmYiLCJsZWZ0IjowLjAsImxlZnRsaW1pdCI6NjAuMCwibW9kZSI6IlN0YXRpYyIsIm1vZGxlZnQiOjAuMCwibW9kbW9kZSI6IlN0YXRpYyIsIm1vZHJhbmRvbTN3YXkiOjAuMCwibW9kcmFuZG9tNXdheSI6MC4wLCJtb2RyaWdodCI6MC4wLCJtb2RzdGF0aWMiOjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInBpdGNoIjoiRGlzYWJsZWQiLCJwaXRjaHZhbHVlMSI6MC4wLCJwaXRjaHZhbHVlMiI6MC4wLCJyaWdodCI6MC4wLCJyaWdodGxpbWl0Ijo2MC4wLCJzdGF0aWMiOjAuMCwieWF3IjoiRGlzYWJsZWQiLCJ5YXdzcGVlZCI6MTAuMCwieWF3dmFsdWUxIjowLjAsInlhd3ZhbHVlMiI6MC4wLCJ5YXd3YXkxIjowLjAsInlhd3dheTIiOjAuMCwieWF3d2F5MyI6MC4wLCJ5YXd3YXk0IjowLjAsInlhd3dheTUiOjAuMH1dLHsiYWltYm90bG9ncyI6dHJ1ZSwiYW5pbWJyZWFrZXJzIjp0cnVlLCJhc3BlY3QiOnRydWUsImJhcnMiOnRydWUsImNsYW50YWciOmZhbHNlLCJjcm9zc2hhaXIiOnRydWUsImRvcm1hbnRhaW0iOmZhbHNlLCJncmVuYWRlcyI6dHJ1ZSwiaGl0Y2hhbmNlIjpmYWxzZSwiaGl0bWFya2VycyI6dHJ1ZSwibWluZG1nIjpmYWxzZSwicGluZ3VubG9ja2VyIjpmYWxzZSwicmV2b2x2ZXIiOnRydWUsInNjb3BlIjp0cnVlLCJ0cmFzaHRhbGsiOmZhbHNlLCJ0cyI6dHJ1ZSwidmlld21vZGVsIjp0cnVlLCJ+YWltYm90bG9ncyI6eyJiYWNrZ3JvdW5kX2NvbG9yIjoiIzFFMUUxRUZGIiwiY29sb3IiOiIjOURDN0M2RkYiLCJjdXN0b21fY29sb3IiOnRydWUsImhpdF9jb2xvciI6IiM5REM3QzZGRiIsImxvZ3NhZGRvbnMiOlsiXHUwMDA3e0xpbmsgQWN0aXZlfe+QjiAgXHUwMDA3REVGQVVMVEJhY2tncm91bmQiLCJ+Il0sIm1pc3NfY29sb3IiOiIjNjQ2NDY0RkYiLCJvZmZzZXQiOjMwMC4wLCJwb3MiOlsxLjAsMi4wLDMuMCwifiJdfSwifmFuaW1icmVha2VycyI6eyJhZGRvbnNhbmltIjpbIkxlYW5pbmcgT24gU3RhbmRpbmciLCJ+Il0sImFpciI6Ikthbmdhcm9vIiwiYWlydmFsdWUiOjEwMC4wLCJncm91bmQiOiJCYWNrd2FyZCIsImppdHRlcnNwZWVkIjoxMDAuMCwiaml0dGVydmFsdWUiOjEwMC4wLCJqaXR0ZXJ2YWx1ZTEiOjEwMC4wLCJtb3ZlbGVhbiI6MTAwLjB9LCJ+YXNwZWN0Ijp7InZhbCI6MTMzLjB9LCJ+YmFycyI6eyJrZWVwX21vZGVsX3RyYW5zcGFyZW5jeSI6dHJ1ZSwibW9kZSI6WzEuMCwyLjAsMy4wLDQuMCw2LjAsOC4wLDkuMCwxMS4wLDEyLjAsMTMuMCwxNC4wLDE1LjAsIn4iXSwic2tlZXRpbmRzdHlsZSI6Ik9sZCIsInNrZWV0aW5yb3BvbGF0aW9uIjp0cnVlfSwifmNyb3NzaGFpciI6eyJjcm9zc2hhaXJjb2xvciI6IiM5REM3QzZGRiIsImZvbnRjcm9zc2hhaXIiOiJEZWZhdWx0IiwiZ2xvd2Nyb3NzIjp0cnVlLCJvZmZzZXQiOjAuMCwic3R5bGUiOiJNb2Rlcm4ifSwifmRvcm1hbnRhaW0iOnsiYXV0b3Njb3BlZGEiOmZhbHNlLCJhdXRvc3RvcGRhIjpmYWxzZSwiaGl0Ym94ZXNkYSI6WyJ+Il0sImhpdGNoYW5jZWRhIjo2MC4wLCJsb2dzZGEiOmZhbHNlfSwifmdyZW5hZGVzIjp7Im5hZGVob3RrZXkiOjExMy4wLCJuYWRlcyI6WzEuMCwyLjAsMy4wLDQuMCwifiJdLCJyZWFsZXNlMzIiOjUwLjAsInNlbGVjdG5hZGVzIjpbMS4wLDMuMCwifiJdfSwifmhpdGNoYW5jZSI6eyJpbmFpcl9oYyI6WyJ+Il0sImluYWlyX2hjX3NsZGVpciI6MzUuMCwianVtcHNjb3V0Zml4IjpmYWxzZSwibm9zY29wZV9oY19zbGRlaXIiOjM1LjB9LCJ+aGl0bWFya2VycyI6eyJoaXRtYXJrZXJzZWxlY3QiOlsxLjAsMi4wLCJ+Il0sImtpYml0Y29sb3IiOiIjOURDN0M2RkYifSwifm1pbmRtZyI6eyJkYW1hZ2VfY29sb3IiOiIjRkZGRkZGRkYiLCJkYW1hZ2VfZm9udCI6IkRlZmF1bHQiLCJkYW1hZ2VfcG9zaXRpb25feCI6OTcwLjAsImRhbWFnZV9wb3NpdGlvbl95Ijo1MTUuMH0sIn5zY29wZSI6eyIqY29sb3IiOiIjOURDN0M2RkYiLCJhbmltYXRlem9vbSI6ZmFsc2UsImNvbG9yIjoiRGVmYXVsdCIsImdhcCI6NS4wLCJsZW5ndGgiOjEwNS4wfSwifnRyYXNodGFsayI6eyJ0cmFzaHRhbGttb2RlIjpbIn4iXX0sIn50cyI6eyJhY2NlbnRfY29sb3IiOiIjOURDN0M2RkYiLCJmb250X21hbnVhbCI6IkRlZmF1bHQiLCJmb3J3YXJkX21hbnVhbCI6IiIsImxlZnRfbWFudWFsIjoiIiwicmlnaHRfbWFudWFsIjoiIiwidHNfdHlwZSI6Ik1vZGVybiJ9LCJ+dmlld21vZGVsIjp7ImZvdiI6NDAuMCwieF9heGlzIjoxMC4wLCJ5X2F4aXMiOi00MC4wLCJ6X2F4aXMiOjEwLjB9fV0sIm5hbWUiOiIxMjMifQ=="));
        l_pui_0.load(v706.file, 1);
        l_pui_0.load(v706.file, 2);
        l_pui_0.load(v706.file, 3);
    end;
end);
misc = v89("presets.misc", v25, function()
    -- upvalues: v30 (ref), l_pui_0 (ref), l_base64_0 (ref)
    if v30.info.presets_list:get() ~= 1 then
        l_pui_0.load(presets_data.file[v30.info.presets_list:get()], 4);
    else
        local v707 = json.parse(l_base64_0.decode("eyJmaWxlIjpbeyJiYWNrc3RhYiI6dHJ1ZSwiY29uZGl0aW9ucyI6IlNoYXJlZCIsImVuYWJsZSI6MS4wLCJmbGlja2V4cGxvaXQiOmZhbHNlLCJmb3JjZWludGVycG9sYXRpb24iOmZhbHNlLCJmcyI6ZmFsc2UsImxhZGRlcl9zZWxlY3QiOnRydWUsIm1hbnVhbCI6IkRpc2FibGVkIiwibm9mYWxsZGFtYWdlIjp0cnVlLCJzYWZlIjp0cnVlLCJ+Y29uZGl0aW9ucyI6eyJiYXNlIjoiQXQgdGFyZ2V0IiwicGl0Y2giOiJEb3duIn0sIn5mbGlja2V4cGxvaXQiOnsiZmxpY2tzZXR0aW5ncyI6WzIuMCwzLjAsIn4iXX0sIn5tYW51YWwiOnsic3RhdGljIjpmYWxzZX0sIn5zYWZlIjp7IndlYXBvbnMiOls1LjAsNi4wLDcuMCwifiJdfX0sW3siYm9keXlhdyI6dHJ1ZSwiYnJlYWtsYyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6ZmFsc2UsIm1vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXciOiJCYWNrd2FyZCJ9LHsiYm9keXlhdyI6dHJ1ZSwiYnJlYWtsYyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6dHJ1ZSwibW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXciOiJCYWNrd2FyZCJ9LHsiYm9keXlhdyI6dHJ1ZSwiYnJlYWtsYyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6dHJ1ZSwibW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXciOiJCYWNrd2FyZCJ9LHsiYm9keXlhdyI6dHJ1ZSwiYnJlYWtsYyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6dHJ1ZSwibW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXciOiJCYWNrd2FyZCJ9LHsiYm9keXlhdyI6dHJ1ZSwiYnJlYWtsYyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6dHJ1ZSwibW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXciOiJCYWNrd2FyZCJ9LHsiYm9keXlhdyI6dHJ1ZSwiYnJlYWtsYyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6dHJ1ZSwibW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXciOiJCYWNrd2FyZCJ9LHsiYm9keXlhdyI6dHJ1ZSwiYnJlYWtsYyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImVuYWJsZSI6dHJ1ZSwibW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhdyI6IkJhY2t3YXJkIn0seyJib2R5eWF3Ijp0cnVlLCJicmVha2xjIjpmYWxzZSwiZGVmZW5zaXZlIjpmYWxzZSwiZW5hYmxlIjp0cnVlLCJtb2RpZmllciI6IkNlbnRlciIsInlhdyI6IkJhY2t3YXJkIn0seyJib2R5eWF3Ijp0cnVlLCJicmVha2xjIjpmYWxzZSwiZGVmZW5zaXZlIjpmYWxzZSwiZW5hYmxlIjp0cnVlLCJtb2RpZmllciI6IkRpc2FibGVkIiwieWF3IjoiQmFja3dhcmQifV0sW3siYm9keXlhd3JhbmRvbSI6MC4wLCJkZWxheSI6MS4wLCJkZWxheXJyYW5kb20iOmZhbHNlLCJkc2VsZWN0IjpbIn4iXSwiZnMiOiJPZmYiLCJsZWZ0IjowLjAsImxlZnRsaW1pdCI6NjAuMCwibW9kZSI6IlN0YXRpYyIsIm1vZGxlZnQiOjAuMCwibW9kbW9kZSI6IlN0YXRpYyIsIm1vZHJhbmRvbTN3YXkiOjAuMCwibW9kcmFuZG9tNXdheSI6MC4wLCJtb2RyaWdodCI6MC4wLCJtb2RzdGF0aWMiOjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInBpdGNoIjoiRGlzYWJsZWQiLCJwaXRjaHZhbHVlMSI6MC4wLCJwaXRjaHZhbHVlMiI6MC4wLCJyaWdodCI6MC4wLCJyaWdodGxpbWl0Ijo2MC4wLCJzdGF0aWMiOjAuMCwieWF3IjoiRGlzYWJsZWQiLCJ5YXdzcGVlZCI6MTAuMCwieWF3dmFsdWUxIjowLjAsInlhd3ZhbHVlMiI6MC4wLCJ5YXd3YXkxIjowLjAsInlhd3dheTIiOjAuMCwieWF3d2F5MyI6MC4wLCJ5YXd3YXk0IjowLjAsInlhd3dheTUiOjAuMH0seyJib2R5eWF3cmFuZG9tIjoyLjAsImRlbGF5IjoxLjAsImRlbGF5cnJhbmRvbSI6ZmFsc2UsImRzZWxlY3QiOlsifiJdLCJmcyI6Ik9mZiIsImxlZnQiOi0xNS4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJMZWZ0ICYgUmlnaHQiLCJtb2RsZWZ0IjowLjAsIm1vZG1vZGUiOiJTdGF0aWMiLCJtb2RyYW5kb20zd2F5IjowLjAsIm1vZHJhbmRvbTV3YXkiOjAuMCwibW9kcmlnaHQiOjAuMCwibW9kc3RhdGljIjoxNS4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicGl0Y2giOiJEaXNhYmxlZCIsInBpdGNodmFsdWUxIjowLjAsInBpdGNodmFsdWUyIjowLjAsInJpZ2h0IjoyNS4wLCJyaWdodGxpbWl0Ijo2MC4wLCJzdGF0aWMiOjAuMCwieWF3IjoiRGlzYWJsZWQiLCJ5YXdzcGVlZCI6MTAuMCwieWF3dmFsdWUxIjowLjAsInlhd3ZhbHVlMiI6MC4wLCJ5YXd3YXkxIjowLjAsInlhd3dheTIiOjAuMCwieWF3d2F5MyI6MC4wLCJ5YXd3YXk0IjowLjAsInlhd3dheTUiOjAuMH0seyJib2R5eWF3cmFuZG9tIjowLjAsImRlbGF5IjozLjAsImRlbGF5cnJhbmRvbSI6ZmFsc2UsImRzZWxlY3QiOlsifiJdLCJmcyI6Ik9mZiIsImxlZnQiOi0xOS4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJMZWZ0ICYgUmlnaHQiLCJtb2RsZWZ0IjowLjAsIm1vZG1vZGUiOiJTdGF0aWMiLCJtb2RyYW5kb20zd2F5IjowLjAsIm1vZHJhbmRvbTV3YXkiOjAuMCwibW9kcmlnaHQiOjAuMCwibW9kc3RhdGljIjoxMC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicGl0Y2giOiJEaXNhYmxlZCIsInBpdGNodmFsdWUxIjowLjAsInBpdGNodmFsdWUyIjowLjAsInJpZ2h0IjoyOS4wLCJyaWdodGxpbWl0Ijo2MC4wLCJzdGF0aWMiOjAuMCwieWF3IjoiRGlzYWJsZWQiLCJ5YXdzcGVlZCI6MTAuMCwieWF3dmFsdWUxIjowLjAsInlhd3ZhbHVlMiI6MC4wLCJ5YXd3YXkxIjowLjAsInlhd3dheTIiOjAuMCwieWF3d2F5MyI6MC4wLCJ5YXd3YXk0IjowLjAsInlhd3dheTUiOjAuMH0seyJib2R5eWF3cmFuZG9tIjowLjAsImRlbGF5IjoxLjAsImRlbGF5cnJhbmRvbSI6ZmFsc2UsImRzZWxlY3QiOlsifiJdLCJmcyI6Ik9mZiIsImxlZnQiOi0yOS4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJMZWZ0ICYgUmlnaHQiLCJtb2RsZWZ0IjowLjAsIm1vZG1vZGUiOiJTdGF0aWMiLCJtb2RyYW5kb20zd2F5IjowLjAsIm1vZHJhbmRvbTV3YXkiOjAuMCwibW9kcmlnaHQiOjAuMCwibW9kc3RhdGljIjoxMC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicGl0Y2giOiJEaXNhYmxlZCIsInBpdGNodmFsdWUxIjowLjAsInBpdGNodmFsdWUyIjowLjAsInJpZ2h0IjozMS4wLCJyaWdodGxpbWl0Ijo2MC4wLCJzdGF0aWMiOjAuMCwieWF3IjoiRGlzYWJsZWQiLCJ5YXdzcGVlZCI6MTAuMCwieWF3dmFsdWUxIjowLjAsInlhd3ZhbHVlMiI6MC4wLCJ5YXd3YXkxIjowLjAsInlhd3dheTIiOjAuMCwieWF3d2F5MyI6MC4wLCJ5YXd3YXk0IjowLjAsInlhd3dheTUiOjAuMH0seyJib2R5eWF3cmFuZG9tIjowLjAsImRlbGF5IjoyLjAsImRlbGF5cnJhbmRvbSI6ZmFsc2UsImRzZWxlY3QiOlsifiJdLCJmcyI6Ik9mZiIsImxlZnQiOi0xNC4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJMZWZ0ICYgUmlnaHQiLCJtb2RsZWZ0IjowLjAsIm1vZG1vZGUiOiJTdGF0aWMiLCJtb2RyYW5kb20zd2F5IjowLjAsIm1vZHJhbmRvbTV3YXkiOjAuMCwibW9kcmlnaHQiOjAuMCwibW9kc3RhdGljIjoxNC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicGl0Y2giOiJEaXNhYmxlZCIsInBpdGNodmFsdWUxIjowLjAsInBpdGNodmFsdWUyIjowLjAsInJpZ2h0IjoyNC4wLCJyaWdodGxpbWl0Ijo2MC4wLCJzdGF0aWMiOjAuMCwieWF3IjoiRGlzYWJsZWQiLCJ5YXdzcGVlZCI6MTAuMCwieWF3dmFsdWUxIjowLjAsInlhd3ZhbHVlMiI6MC4wLCJ5YXd3YXkxIjowLjAsInlhd3dheTIiOjAuMCwieWF3d2F5MyI6MC4wLCJ5YXd3YXk0IjowLjAsInlhd3dheTUiOjAuMH0seyJib2R5eWF3cmFuZG9tIjowLjAsImRlbGF5IjoxLjAsImRlbGF5cnJhbmRvbSI6ZmFsc2UsImRzZWxlY3QiOlsifiJdLCJmcyI6Ik9mZiIsImxlZnQiOi0xNi4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJMZWZ0ICYgUmlnaHQiLCJtb2RsZWZ0IjowLjAsIm1vZG1vZGUiOiJTdGF0aWMiLCJtb2RyYW5kb20zd2F5IjowLjAsIm1vZHJhbmRvbTV3YXkiOjAuMCwibW9kcmlnaHQiOjAuMCwibW9kc3RhdGljIjo2LjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJwaXRjaCI6IkRpc2FibGVkIiwicGl0Y2h2YWx1ZTEiOjAuMCwicGl0Y2h2YWx1ZTIiOjAuMCwicmlnaHQiOjM2LjAsInJpZ2h0bGltaXQiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXciOiJEaXNhYmxlZCIsInlhd3NwZWVkIjoxMC4wLCJ5YXd2YWx1ZTEiOjAuMCwieWF3dmFsdWUyIjowLjAsInlhd3dheTEiOjAuMCwieWF3d2F5MiI6MC4wLCJ5YXd3YXkzIjowLjAsInlhd3dheTQiOjAuMCwieWF3d2F5NSI6MC4wfSx7ImJvZHl5YXdyYW5kb20iOjAuMCwiZGVsYXkiOjEuMCwiZGVsYXlycmFuZG9tIjpmYWxzZSwiZHNlbGVjdCI6WyJ+Il0sImZzIjoiT2ZmIiwibGVmdCI6MC4wLCJsZWZ0bGltaXQiOjYwLjAsIm1vZGUiOiJTdGF0aWMiLCJtb2RsZWZ0IjowLjAsIm1vZG1vZGUiOiJTdGF0aWMiLCJtb2RyYW5kb20zd2F5IjowLjAsIm1vZHJhbmRvbTV3YXkiOjAuMCwibW9kcmlnaHQiOjAuMCwibW9kc3RhdGljIjowLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJwaXRjaCI6IkRpc2FibGVkIiwicGl0Y2h2YWx1ZTEiOjAuMCwicGl0Y2h2YWx1ZTIiOjAuMCwicmlnaHQiOjAuMCwicmlnaHRsaW1pdCI6NjAuMCwic3RhdGljIjowLjAsInlhdyI6IkRpc2FibGVkIiwieWF3c3BlZWQiOjEwLjAsInlhd3ZhbHVlMSI6MC4wLCJ5YXd2YWx1ZTIiOjAuMCwieWF3d2F5MSI6MC4wLCJ5YXd3YXkyIjowLjAsInlhd3dheTMiOjAuMCwieWF3d2F5NCI6MC4wLCJ5YXd3YXk1IjowLjB9LHsiYm9keXlhd3JhbmRvbSI6MC4wLCJkZWxheSI6MS4wLCJkZWxheXJyYW5kb20iOmZhbHNlLCJkc2VsZWN0IjpbIn4iXSwiZnMiOiJPZmYiLCJsZWZ0IjotMTIuMCwibGVmdGxpbWl0Ijo2MC4wLCJtb2RlIjoiTGVmdCAmIFJpZ2h0IiwibW9kbGVmdCI6MC4wLCJtb2Rtb2RlIjoiU3RhdGljIiwibW9kcmFuZG9tM3dheSI6MC4wLCJtb2RyYW5kb201d2F5IjowLjAsIm1vZHJpZ2h0IjowLjAsIm1vZHN0YXRpYyI6MjIuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInBpdGNoIjoiRGlzYWJsZWQiLCJwaXRjaHZhbHVlMSI6MC4wLCJwaXRjaHZhbHVlMiI6MC4wLCJyaWdodCI6MjIuMCwicmlnaHRsaW1pdCI6NjAuMCwic3RhdGljIjowLjAsInlhdyI6IkRpc2FibGVkIiwieWF3c3BlZWQiOjEwLjAsInlhd3ZhbHVlMSI6MC4wLCJ5YXd2YWx1ZTIiOjAuMCwieWF3d2F5MSI6MC4wLCJ5YXd3YXkyIjowLjAsInlhd3dheTMiOjAuMCwieWF3d2F5NCI6MC4wLCJ5YXd3YXk1IjowLjB9LHsiYm9keXlhd3JhbmRvbSI6MC4wLCJkZWxheSI6MS4wLCJkZWxheXJyYW5kb20iOmZhbHNlLCJkc2VsZWN0IjpbIn4iXSwiZnMiOiJPZmYiLCJsZWZ0IjowLjAsImxlZnRsaW1pdCI6NjAuMCwibW9kZSI6IlN0YXRpYyIsIm1vZGxlZnQiOjAuMCwibW9kbW9kZSI6IlN0YXRpYyIsIm1vZHJhbmRvbTN3YXkiOjAuMCwibW9kcmFuZG9tNXdheSI6MC4wLCJtb2RyaWdodCI6MC4wLCJtb2RzdGF0aWMiOjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInBpdGNoIjoiRGlzYWJsZWQiLCJwaXRjaHZhbHVlMSI6MC4wLCJwaXRjaHZhbHVlMiI6MC4wLCJyaWdodCI6MC4wLCJyaWdodGxpbWl0Ijo2MC4wLCJzdGF0aWMiOjAuMCwieWF3IjoiRGlzYWJsZWQiLCJ5YXdzcGVlZCI6MTAuMCwieWF3dmFsdWUxIjowLjAsInlhd3ZhbHVlMiI6MC4wLCJ5YXd3YXkxIjowLjAsInlhd3dheTIiOjAuMCwieWF3d2F5MyI6MC4wLCJ5YXd3YXk0IjowLjAsInlhd3dheTUiOjAuMH1dLHsiYWltYm90bG9ncyI6dHJ1ZSwiYW5pbWJyZWFrZXJzIjp0cnVlLCJhc3BlY3QiOnRydWUsImJhcnMiOnRydWUsImNsYW50YWciOmZhbHNlLCJjcm9zc2hhaXIiOnRydWUsImRvcm1hbnRhaW0iOmZhbHNlLCJncmVuYWRlcyI6dHJ1ZSwiaGl0Y2hhbmNlIjpmYWxzZSwiaGl0bWFya2VycyI6dHJ1ZSwibWluZG1nIjpmYWxzZSwicGluZ3VubG9ja2VyIjpmYWxzZSwicmV2b2x2ZXIiOnRydWUsInNjb3BlIjp0cnVlLCJ0cmFzaHRhbGsiOmZhbHNlLCJ0cyI6dHJ1ZSwidmlld21vZGVsIjp0cnVlLCJ+YWltYm90bG9ncyI6eyJiYWNrZ3JvdW5kX2NvbG9yIjoiIzFFMUUxRUZGIiwiY29sb3IiOiIjOURDN0M2RkYiLCJjdXN0b21fY29sb3IiOnRydWUsImhpdF9jb2xvciI6IiM5REM3QzZGRiIsImxvZ3NhZGRvbnMiOlsiXHUwMDA3e0xpbmsgQWN0aXZlfe+QjiAgXHUwMDA3REVGQVVMVEJhY2tncm91bmQiLCJ+Il0sIm1pc3NfY29sb3IiOiIjNjQ2NDY0RkYiLCJvZmZzZXQiOjMwMC4wLCJwb3MiOlsxLjAsMi4wLDMuMCwifiJdfSwifmFuaW1icmVha2VycyI6eyJhZGRvbnNhbmltIjpbIkxlYW5pbmcgT24gU3RhbmRpbmciLCJ+Il0sImFpciI6Ikthbmdhcm9vIiwiYWlydmFsdWUiOjEwMC4wLCJncm91bmQiOiJCYWNrd2FyZCIsImppdHRlcnNwZWVkIjoxMDAuMCwiaml0dGVydmFsdWUiOjEwMC4wLCJqaXR0ZXJ2YWx1ZTEiOjEwMC4wLCJtb3ZlbGVhbiI6MTAwLjB9LCJ+YXNwZWN0Ijp7InZhbCI6MTMzLjB9LCJ+YmFycyI6eyJrZWVwX21vZGVsX3RyYW5zcGFyZW5jeSI6dHJ1ZSwibW9kZSI6WzEuMCwyLjAsMy4wLDQuMCw2LjAsOC4wLDkuMCwxMS4wLDEyLjAsMTMuMCwxNC4wLDE1LjAsIn4iXSwic2tlZXRpbmRzdHlsZSI6Ik9sZCIsInNrZWV0aW5yb3BvbGF0aW9uIjp0cnVlfSwifmNyb3NzaGFpciI6eyJjcm9zc2hhaXJjb2xvciI6IiM5REM3QzZGRiIsImZvbnRjcm9zc2hhaXIiOiJEZWZhdWx0IiwiZ2xvd2Nyb3NzIjp0cnVlLCJvZmZzZXQiOjAuMCwic3R5bGUiOiJNb2Rlcm4ifSwifmRvcm1hbnRhaW0iOnsiYXV0b3Njb3BlZGEiOmZhbHNlLCJhdXRvc3RvcGRhIjpmYWxzZSwiaGl0Ym94ZXNkYSI6WyJ+Il0sImhpdGNoYW5jZWRhIjo2MC4wLCJsb2dzZGEiOmZhbHNlfSwifmdyZW5hZGVzIjp7Im5hZGVob3RrZXkiOjExMy4wLCJuYWRlcyI6WzEuMCwyLjAsMy4wLDQuMCwifiJdLCJyZWFsZXNlMzIiOjUwLjAsInNlbGVjdG5hZGVzIjpbMS4wLDMuMCwifiJdfSwifmhpdGNoYW5jZSI6eyJpbmFpcl9oYyI6WyJ+Il0sImluYWlyX2hjX3NsZGVpciI6MzUuMCwianVtcHNjb3V0Zml4IjpmYWxzZSwibm9zY29wZV9oY19zbGRlaXIiOjM1LjB9LCJ+aGl0bWFya2VycyI6eyJoaXRtYXJrZXJzZWxlY3QiOlsxLjAsMi4wLCJ+Il0sImtpYml0Y29sb3IiOiIjOURDN0M2RkYifSwifm1pbmRtZyI6eyJkYW1hZ2VfY29sb3IiOiIjRkZGRkZGRkYiLCJkYW1hZ2VfZm9udCI6IkRlZmF1bHQiLCJkYW1hZ2VfcG9zaXRpb25feCI6OTcwLjAsImRhbWFnZV9wb3NpdGlvbl95Ijo1MTUuMH0sIn5zY29wZSI6eyIqY29sb3IiOiIjOURDN0M2RkYiLCJhbmltYXRlem9vbSI6ZmFsc2UsImNvbG9yIjoiRGVmYXVsdCIsImdhcCI6NS4wLCJsZW5ndGgiOjEwNS4wfSwifnRyYXNodGFsayI6eyJ0cmFzaHRhbGttb2RlIjpbIn4iXX0sIn50cyI6eyJhY2NlbnRfY29sb3IiOiIjOURDN0M2RkYiLCJmb250X21hbnVhbCI6IkRlZmF1bHQiLCJmb3J3YXJkX21hbnVhbCI6IiIsImxlZnRfbWFudWFsIjoiIiwicmlnaHRfbWFudWFsIjoiIiwidHNfdHlwZSI6Ik1vZGVybiJ9LCJ+dmlld21vZGVsIjp7ImZvdiI6NDAuMCwieF9heGlzIjoxMC4wLCJ5X2F4aXMiOi00MC4wLCJ6X2F4aXMiOjEwLjB9fV0sIm5hbWUiOiIxMjMifQ=="));
        l_pui_0.load(v707.file, 4);
    end;
end);
v30.info.presets_success_export:visibility(false);
v30.info.presets_success_import:visibility(false);
v30.info.presets_success_exist:visibility(false);
v30.info.presets_success_importfailed:visibility(false);
updatevisdata = function()
    -- upvalues: v30 (ref), v41 (ref), v40 (ref), v42 (ref), v43 (ref)
    if ui.get_alpha() ~= 0 then
        v30.info.presets_success_export:visibility(globals.realtime - v41 <= 2);
        v30.info.presets_success_import:visibility(globals.realtime - v40 <= 2);
        v30.info.presets_success_exist:visibility(globals.realtime - v42 <= 2);
        v30.info.presets_success_importfailed:visibility(globals.realtime - v43 <= 2);
    end;
end;
v30.antiaim.conditions:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v30.antiaim.enable
});
v30.antiaim.fs:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v30.antiaim.enable
});
v30.antiaim.manual:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v30.antiaim.enable
});
v30.antiaim.safe:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v30.antiaim.enable
});
v30.antiaim.backstab:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v30.antiaim.enable
});
v30.antiaim.nofalldamage:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v30.antiaim.enable
});
v30.misc.animbreakers.jitterspeed:depend({
    [1] = nil, 
    [2] = "Jitter", 
    [1] = v30.misc.animbreakers.ground
});
v30.misc.animbreakers.jittervalue:depend({
    [1] = nil, 
    [2] = "Jitter", 
    [1] = v30.misc.animbreakers.ground
});
v30.misc.animbreakers.airvalue:depend({
    [1] = nil, 
    [2] = "Static", 
    [1] = v30.misc.animbreakers.air
});
v30.misc.aimbotlogs.color:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v30.misc.aimbotlogs.pos
});
events.render(v123.handle);
v93("shutdown", "shutdown", v616);
v93("render", "render", render);
v93("render", "updatevisdata", updatevisdata);
v93("createmove", "antiaim", v464);
v93("createmove", "onmove", onmove);
v93("post_update_clientside_animation", "animbreaker", v477);
v93("aim_ack", "shot", v562);
v93("player_death", "death", death);
v615:run();
events.render:set(function()
    -- upvalues: v605 (ref)
    sosali_hui();
    v605();
end);
local v708 = {};
l_ffi_0.cdef("        typedef void* HCURSOR;\n        typedef void* HINSTANCE;\n    \n        HCURSOR LoadCursorA(HINSTANCE hInstance, int lpCursorName);\n        HCURSOR SetCursor(HCURSOR hCursor);\n        HCURSOR GetCursor();\n    ");
local v709 = l_ffi_0.load("user32.dll");
do
    local l_v709_0 = v709;
    v708.set_pointer = function()
        -- upvalues: l_v709_0 (ref), l_ffi_0 (ref)
        local v711 = l_v709_0.LoadCursorA(l_ffi_0.cast("HINSTANCE", 0), 32649);
        if v711 and l_v709_0.GetCursor() ~= v711 then
            l_v709_0.SetCursor(v711);
        end;
    end;
end;
events.mouse_input:set(function()
    return ui.get_alpha() <= 0;
end);