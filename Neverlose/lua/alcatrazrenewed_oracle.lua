events.mouse_input:set(function()
    return ui.get_alpha() <= 0;
end);
ffi.cdef("    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n    \n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n    typedef int(__fastcall* clantag_t)(const char*, const char*);\n    void* CloseHandle(void *hFile);\n    typedef int(__fastcall* clantag_t)(const char*, const char*);    \n");
ffi.cdef("    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n\n    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder; //0x0014\n        int m_nSequence; //0x0018\n        float m_flPrevCycle; //0x001C\n        float m_flWeight; //0x0020\n        float m_flWeightDeltaRate; //0x0024\n        float m_flPlaybackRate; //0x0028\n        float m_flCycle; //0x002C\n        void *m_pOwner; //0x0030\n        char  pad_0038[4]; //0x0034\n    } c_animlayers;\n");
local l_clipboard_0 = require("neverlose/clipboard");
local l_base64_0 = require("neverlose/base64");
local l_aim_0 = require("neverlose/anti_aim");
local _ = require("neverlose/vmt_hook");
local _ = require("neverlose/rich_presence");
local l_pui_0 = require("neverlose/pui");
local l_extended_0 = require("neverlose/events_extended");
local l_system_0 = require("neverlose/drag_system");
local l_bomb_0 = require("neverlose/bomb");
local l_gradient_0 = require("neverlose/gradient");
local v10 = {};
local _ = {};
local v12 = {};
local v13 = {};
local v14 = {};
local v15 = {};
local v16 = {};
local v17 = {};
local v18 = {
    urlmon = ffi.load("UrlMon"), 
    wininet = ffi.load("WinInet")
};
v18.download_file_from_url = function(v19, v20)
    -- upvalues: v18 (ref)
    v18.wininet.DeleteUrlCacheEntryA(v19);
    v18.urlmon.URLDownloadToFileA(nil, v19, v20, 0, 0);
end;
v18.open_link = function(v21)
    panorama.SteamOverlayAPI.OpenExternalBrowserURL(v21);
end;
local function v27(v22, v23, v24, v25)
    if ui.get_alpha() <= 0 then
        return;
    else
        local v26 = ui.get_mouse_position();
        return v22 <= v26.x and v26.x <= v23 and v24 <= v26.y and v26.y <= v25;
    end;
end;
get_active_binding_info = function(v28)
    local v29 = false;
    local v30 = 0;
    local v31 = ui.get_binds();
    for v32 = 1, #v31 do
        if v31[v32].name == v28 and v31[v32].active then
            v29 = true;
            v30 = v31[v32].value;
        end;
    end;
    return {
        [1] = v29, 
        [2] = v30
    };
end;
lerp = function(v33, v34, v35)
    return v33 + (v34 - v33) * v35;
end;
local function _(v36, v37, v38)
    if type(v36) == "table" then
        return lerp(v36[1], v37[1], v38), lerp(v36[2], v37[2], v38), lerp(v36[3], v37[3], v38), lerp(v36[4], v37[4], v38);
    else
        local v39 = v37 - v36;
        if type(v39) == "number" then
            return v37;
        else
            return v39 * v38 + v36;
        end;
    end;
end;
get_weapon = function(v41)
    if v41:get_player_weapon() == nil then
        return;
    else
        return (v41:get_player_weapon());
    end;
end;
get_weapon_id = function(v42)
    if v42:get_player_weapon() == nil then
        return;
    elseif v42:get_player_weapon():get_weapon_index() == nil then
        return;
    else
        return (v42:get_player_weapon():get_weapon_index());
    end;
end;
get_weapon_type = function(v43)
    if v43:get_player_weapon() == nil then
        return;
    elseif v43:get_player_weapon():get_weapon_info() == nil then
        return;
    else
        return v43:get_player_weapon():get_weapon_info().weapon_type;
    end;
end;
create_gear = function(v44)
    return v44:create();
end;
files.create_folder("nl/alcatraz");
files.create_folder("nl/alcatraz/fonts");
v18.download_file_from_url("https://github.com/Stranick07/alcatraz_files/raw/main/smallest_pixel-7.ttf", "nl\\alcatraz\\fonts\\smallest_pixel-7.ttf");
l_pui_0.accent = "\a{Link Active}";
v17.link_color = ui.get_style("Link Active");
local _, _, _, _ = ui.get_style("Link Active"):unpack();
local v49 = {
    [1] = "Auto", 
    [2] = "SSG-08", 
    [3] = "AWP", 
    [4] = "R8 Revolver"
};
local v50 = {
    [9] = "AWP", 
    [40] = "SSG-08", 
    [64] = "R8 Revolver", 
    [11] = "Auto", 
    [38] = "Auto"
};
v10 = {
    update = "03.03.25", 
    build = "renewed", 
    username = common.get_username():lower(), 
    screen = render.screen_size(), 
    conditions = {
        [1] = "Shared", 
        [2] = "Standing", 
        [3] = "Moving", 
        [4] = "Walking", 
        [5] = "Crouching", 
        [6] = "Crouch + M", 
        [7] = "Air", 
        [8] = "Air + C", 
        [9] = "Freestanding"
    }, 
    conditions_as_number = {}, 
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
};
for v51, v52 in ipairs(v10.conditions) do
    v10.conditions_as_number[v52] = v51;
end;
v13 = {
    info = l_pui_0.create("\240\159\143\160", "\v\f<circle-info>\r  Information", 0), 
    config = l_pui_0.create("\240\159\143\160", "\v\f<file>\r  Configs", 0), 
    buttons = l_pui_0.create("\240\159\143\160", "\n\v\f<tablet-button>\r", 2), 
    general = l_pui_0.create("\226\154\153\239\184\143", "\v\f<bullseye>\r  GENERAL", 0), 
    visuals = l_pui_0.create("\226\154\153\239\184\143", "\v\f<indian-rupee-sign>\r  VISUALS", 0), 
    misc = l_pui_0.create("\226\154\153\239\184\143", "\v\f<user-gear>\r  MISC", 0), 
    other = l_pui_0.create("\226\154\153\239\184\143", "\v\f<router>\r  OTHER", 0), 
    lower = l_pui_0.create("\226\154\153\239\184\143", "\n \v\f<router>\r  OTHER", 2), 
    anti_aim = l_pui_0.create("\240\159\141\128", "\v\f<user-police>\r Main", 1), 
    anti_aim_builder = l_pui_0.create("\240\159\141\128", "\n Builder", 1), 
    anti_aim_tweaks = l_pui_0.create("\240\159\141\128", "\v\f<badge-sheriff>\r  Tweaks", 2)
};
v14 = {
    info = {
        text = {
            v13.info:label("\v[\194\187]\r User ~ \v" .. v10.username), 
            v13.info:label("\v[\194\187]\r Version ~ \v" .. v10.build), 
            v13.info:label("\v[\194\187]\r Last update ~ \v" .. v10.update)
        }, 
        join_discord = v13.info:button("\v\f<discord>\r         Join our Discord server!        ", function()
            -- upvalues: v18 (ref)
            v18.open_link("https://discord.gg/EhMFRaNKV4");
        end, true)
    }, 
    config = {
        list = v13.config:list("Config list", {}, nil, false), 
        name = v13.config:input("Config Name", "", nil, false), 
        creator = v13.config:label("Creator: \v-"), 
        date = v13.config:label("Created at: \v-"), 
        export = v13.info:button("  \v\f<file-export>\r      Export      ", function()

        end, true), 
        import = v13.info:button("  \v\f<file-import>\r      Import      ", function()

        end, true), 
        create = v13.buttons:button("     \v\f<floppy-disk>\r     ", function()

        end, true, "Create"), 
        load = v13.buttons:button("    \v\f<floppy-disk-circle-arrow-right>\r    ", function()

        end, true, "Load"), 
        update = v13.buttons:button("    \v\f<floppy-disk-pen>\r    ", function()

        end, true, "Update"), 
        delete = v13.buttons:button("    \v\f<trash-can>\r    ", function()

        end, true, "Delete"), 
        refresh = v13.buttons:button("    \v\f<arrows-rotate>\r    ", function()

        end, true, "Refresh")
    }, 
    general = {
        ideal_peek = v13.general:switch("\v\f<ideal>\r  Ideal-Tick", false), 
        rage_improvements = v13.general:switch("\v\f<location-crosshairs>\r  Rage features", false, function(v53, _)
            -- upvalues: v49 (ref)
            local v56 = {
                predict = v53:switch("\v\f<transporter-1>\r  Force predict"), 
                ping_variation = v53:combo("Ping Variations", {
                    [1] = "High", 
                    [2] = "Low"
                }), 
                prediction_type = v53:combo("\nawp setting", {
                    [1] = "Disabled", 
                    [2] = "Balanced", 
                    [3] = "Enhanced", 
                    [4] = "Ascend", 
                    [5] = "Ultimate"
                }), 
                jump_scout = v53:switch("\v\f<up>\r  Jump scout"), 
                better_auto_stop = v53:switch("\v\f<ban>\r  Better auto stop"), 
                baim_improvements = v53:switch("\v\f<person-military-rifle>\r  Force baim if letal"), 
                baim_weapons = v53:selectable("\v\f<swords>\r  Weapons \nbaim", v49), 
                baim_ticks = v53:slider("\v\f<clock>\r   Ticks", 0, 10, 0, 1, function(v55)
                    return v55 == 0 and "Default" or v55 == 10 and "Safest" or v55 .. "t";
                end)
            };
            v56.ping_variation:depend({
                [1] = nil, 
                [2] = true, 
                [1] = v56.predict
            });
            v56.prediction_type:depend({
                [1] = nil, 
                [2] = true, 
                [1] = v56.predict
            }, {
                [1] = nil, 
                [2] = "Low", 
                [1] = v56.ping_variation
            });
            v56.baim_weapons:depend(v56.baim_improvements);
            v56.baim_ticks:depend(v56.baim_improvements);
            v56.better_auto_stop:depend(v56.jump_scout);
            return v56, true;
        end), 
        aimbot_logging = v13.general:switch("\v\f<crosshairs>\r  Aimbot logging", false, function(v57, _)
            local v59 = {
                events = v57:selectable("Events", {
                    [1] = "Hit", 
                    [2] = "Miss", 
                    [3] = "Purchases"
                }), 
                hit_color = v57:color_picker("Hit", color(120, 225, 100)), 
                missmatch_color = v57:color_picker("Missmatch", color(255, 225, 100)), 
                miss_color = v57:color_picker("Miss", color(255, 110, 100)), 
                ct_buy = v57:color_picker("CT buy", color(120, 210, 235)), 
                t_buy = v57:color_picker("T buy", color(255, 175, 75))
            };
            v59.hit_color:depend({
                [1] = nil, 
                [2] = "Hit", 
                [1] = v59.events
            });
            v59.missmatch_color:depend({
                [1] = nil, 
                [2] = "Hit", 
                [1] = v59.events
            });
            v59.miss_color:depend({
                [1] = nil, 
                [2] = "Miss", 
                [1] = v59.events
            });
            v59.ct_buy:depend({
                [1] = nil, 
                [2] = "Purchases", 
                [1] = v59.events
            });
            v59.t_buy:depend({
                [1] = nil, 
                [2] = "Purchases", 
                [1] = v59.events
            });
            return v59, true;
        end), 
        hitchance_override = v13.general:switch("\v\f<bullseye-arrow>\r Override hitchance", false, function(v60, _)
            -- upvalues: v49 (ref)
            return {
                weapon_select = v60:combo("Selection ", v49)
            }, true;
        end), 
        hitchance_elements = {}, 
        better_lc = v13.general:switch("\v\f<seedling>\r  Better lagcomp", false, function(v62, _)
            return {
                zerolag = v62:switch("\v\f<wind-turbine>\r   Turbo")
            }, true;
        end)
    }, 
    visuals = {
        windows = v13.visuals:switch("\v\f<window>\r  Windows", false, function(v64, _)
            -- upvalues: v17 (ref), v10 (ref)
            local v66 = {
                selection = v64:selectable("Window", {
                    [1] = "Watermark", 
                    [2] = "Hotkey list"
                }), 
                style = v64:combo("Style", {
                    [1] = "Solid", 
                    [2] = "Half-Rounded", 
                    [3] = "Fade"
                }, color(v17.link_color.r, v17.link_color.g, v17.link_color.b, 255)), 
                glow = v64:switch("Glow"), 
                alpha = v64:slider("Alpha", 0, 100, 50, 1, "%"), 
                additional = v64:selectable("Additional info", {
                    [1] = "Version", 
                    [2] = "Name", 
                    [3] = "Framerate", 
                    [4] = "Ping", 
                    [5] = "Time"
                }), 
                x_keybind = v64:slider("x_keybind", 0, v10.screen.x, 200), 
                y_keybind = v64:slider("y_keybind", 0, v10.screen.y, 100), 
                x_specs = v64:slider("x_specs", 0, v10.screen.x, 200), 
                y_specs = v64:slider("y_specs", 0, v10.screen.y, 200)
            };
            v66.style:depend({
                [1] = nil, 
                [2] = "Watermark", 
                [3] = "Hotkey list", 
                [4] = "Spectator list", 
                [1] = v66.selection
            });
            v66.glow:depend({
                [1] = nil, 
                [2] = "Watermark", 
                [3] = "Hotkey list", 
                [4] = "Spectator list", 
                [1] = v66.selection
            });
            v66.alpha:depend({
                [1] = nil, 
                [2] = "Watermark", 
                [3] = "Hotkey list", 
                [4] = "Spectator list", 
                [1] = v66.selection
            });
            v66.additional:depend({
                [1] = nil, 
                [2] = "Watermark", 
                [1] = v66.selection
            });
            v66.x_keybind:visibility(false);
            v66.y_keybind:visibility(false);
            v66.x_specs:visibility(false);
            v66.y_specs:visibility(false);
            return v66, true;
        end), 
        screen_indication = v13.visuals:switch("\v\f<desktop>\r  Screen indication", false, function(v67)
            -- upvalues: v17 (ref), v10 (ref)
            local v68 = {
                static_watermark = v67:switch("Static watermark", false, color(v17.link_color.r, v17.link_color.g, v17.link_color.b)), 
                watermark_position = v67:combo("Position \nstatic watermark", {
                    [1] = "Left", 
                    [2] = "Bottom", 
                    [3] = "Right"
                }), 
                on_screen = v67:switch("On-Screen"), 
                additional_settings = v67:selectable("Additional", {
                    [1] = "Target", 
                    [2] = "Player state", 
                    [3] = "Fake latency", 
                    [4] = "Double tap", 
                    [5] = "Hide shot", 
                    [6] = "Damage override", 
                    [7] = "Fake duck", 
                    [8] = "Freestanding", 
                    [9] = "Peek assist"
                }), 
                clr_1 = v67:color_picker("First", color(v17.link_color.r, v17.link_color.g, v17.link_color.b)), 
                clr_2 = v67:color_picker("Second", color(255)), 
                damage_indication = v67:switch("Show damage"), 
                show_always = v67:switch("Show always"), 
                x_damage = v67:slider("x_damage", v10.screen.x / 2 - 50, v10.screen.x / 2 + 50, v10.screen.x / 2), 
                y_damage = v67:slider("y_damage", v10.screen.y / 2 - 50, v10.screen.y / 2 + 50, v10.screen.y / 2), 
                log_events = v67:switch("Logs", false), 
                events = v67:selectable("Events", {
                    [1] = "Hit/Miss", 
                    [2] = "Purchases"
                }), 
                position = v67:selectable("Position", {
                    [1] = "Upper left", 
                    [2] = "Screen middle"
                }), 
                background = v67:switch("Background"), 
                glow = v67:switch("Glow overlay"), 
                logging_color = v67:color_picker("Accent color", color(180, 200, 250, 255)), 
                gamesense_indication = v67:switch("\a85bb65FF500$"), 
                gamesense_selection = v67:selectable("Feature indicators", {
                    [1] = "Force safe point", 
                    [2] = "Force body aim", 
                    [3] = "Ping spike", 
                    [4] = "Double tap", 
                    [5] = "Duck peek assist", 
                    [6] = "Freestanding", 
                    [7] = "On shot anti-aim", 
                    [8] = "Minimum damage", 
                    [9] = "Bomb info", 
                    [10] = "Dormant aimbot", 
                    [11] = "Hitchance", 
                    [12] = "Hit/Miss ratio"
                }), 
                manual_arrows = v67:switch("Manual arrows"), 
                manual_arrows_color = v67:color_picker("Active color", color(255, 255, 255, 255)), 
                x_arrows = v67:slider("x_arrows", v10.screen.y / 2 - 25, v10.screen.y / 2 + 25, v10.screen.y / 2), 
                y_arrows = v67:slider("y_arrows", v10.screen.y / 2 - 25, v10.screen.y / 2 + 25, v10.screen.y / 2)
            };
            v68.watermark_position:depend(v68.static_watermark);
            v68.static_watermark.color:depend(v68.static_watermark);
            v68.additional_settings:depend(v68.on_screen);
            v68.clr_1:depend(v68.on_screen);
            v68.clr_2:depend(v68.on_screen);
            v68.show_always:depend(v68.damage_indication);
            v68.events:depend(v68.log_events);
            v68.position:depend(v68.log_events, {
                [1] = nil, 
                [2] = "Hit/Miss", 
                [3] = "Purchases", 
                [1] = v68.events
            });
            v68.background:depend(v68.log_events, {
                [1] = nil, 
                [2] = "Screen middle", 
                [1] = v68.position
            });
            v68.glow:depend(v68.log_events, {
                [1] = nil, 
                [2] = "Screen middle", 
                [1] = v68.position
            }, v68.background);
            v68.logging_color:depend(v68.log_events, {
                [1] = nil, 
                [2] = "Screen middle", 
                [1] = v68.position
            });
            v68.gamesense_selection:depend(v68.gamesense_indication);
            v68.manual_arrows_color:depend(v68.manual_arrows);
            v68.x_damage:visibility(false);
            v68.y_damage:visibility(false);
            v68.x_arrows:visibility(false);
            v68.y_arrows:visibility(false);
            return v68, true;
        end), 
        custom_scope = v13.visuals:switch("\v\f<location-crosshairs>\r  Custom scope", false, function(v69)
            return {
                offset = v69:slider("Offset", 0, 500, 10), 
                length = v69:slider("Length", 0, 1000, 60), 
                color = v69:color_picker("Color", color(45, 45, 255, 0))
            }, true;
        end), 
        aspect_ratio = v13.visuals:switch("\v\f<arrows-left-right>\r  Aspect Ratio", false, function(v70)
            local v71 = {
                ["16:9"] = 178, 
                ["5:4"] = 125, 
                ["4:3"] = 133, 
                ["16:10"] = 160
            };
            local v72 = {
                value_int = v70:slider("Value", 50, 200, ({
                    r_aspectratio = cvar.r_aspectratio:float() and v71["16:9"] * 0.01
                }).r_aspectratio * 100, 0.01), 
                five_four = v70:button(" 5:4 ", function()

                end, true), 
                four_tree = v70:button(" 4:3 ", function()

                end, true), 
                sixteen_ten = v70:button(" 16:10", function()

                end, true), 
                sixteen_nine = v70:button(" 16:9 ", function()

                end, true), 
                reset_value = v70:button(" Reset ", function()

                end, true)
            };
            v72.five_four:set_callback(function()
                -- upvalues: v72 (ref), v71 (ref)
                v72.value_int:set(v71["5:4"]);
            end);
            v72.four_tree:set_callback(function()
                -- upvalues: v72 (ref), v71 (ref)
                v72.value_int:set(v71["4:3"]);
            end);
            v72.sixteen_ten:set_callback(function()
                -- upvalues: v72 (ref), v71 (ref)
                v72.value_int:set(v71["16:10"]);
            end);
            v72.sixteen_nine:set_callback(function()
                -- upvalues: v72 (ref), v71 (ref)
                v72.value_int:set(v71["16:9"]);
            end);
            v72.reset_value:set_callback(function()
                -- upvalues: v72 (ref)
                v72.value_int:reset();
            end);
            return v72, true;
        end), 
        additional_esp = v13.visuals:switch("\v\f<staff>\r  Additional esp", false)
    }, 
    misc = {
        clantag = v13.misc:switch("\v\f<money-bill-wave>\r  Clantag"), 
        shared_features = v13.misc:switch("\v\f<share-nodes>\r  Shared Features"), 
        trashtalk = v13.misc:selectable("\v\f<trash>\r  Trash Talk", {
            [1] = "Kill", 
            [2] = "Dead", 
            [3] = "Revenge"
        }), 
        increase_fake_latency = v13.misc:switch("\v\f<satellite-dish>\r  Increase fake latency", false, function(v73)
            return {
                val = v73:slider("\v\f<chart-simple>\r   Amount", 0, 1000, 0, 1, "ms")
            }, true;
        end), 
        better_grenades = v13.misc:selectable("\v\f<bomb>\r   Grenades", {
            [1] = "Super toss", 
            [2] = "Grenade release"
        }, function(v74, v75)
            local v76 = {
                simulate_prediction = v74:switch("Simulate grenade prediction"), 
                damage = v74:slider("Damage", 0, 100, 20, 1, "hp")
            };
            v76.simulate_prediction:depend({
                [1] = nil, 
                [2] = "Super toss", 
                [1] = v75
            });
            v76.damage:depend({
                [1] = nil, 
                [2] = "Grenade release", 
                [1] = v75
            });
            return v76;
        end)
    }, 
    other = {
        avoid_collisions = v13.other:switch("\v\f<block-brick>\r  Avoid collisions"), 
        fast_ladder = v13.other:switch("\v\f<water-ladder>\r  Fast ladder"), 
        no_fall = v13.other:switch("\v\f<person-falling-burst>\r  No fall damage"); 
        v13.lower:label("                           \valcatraz ~ \aDEFAULT2025                           ")
    }, 
    anti_aim = {
        enable = v13.anti_aim:switch("Enable anti-aim"), 
        condition = v13.anti_aim:combo("Condition", v10.conditions), 
        yaw_base = v13.anti_aim:combo("Yaw Base", {
            [1] = "Local View", 
            [2] = "At Target"
        }), 
        builder = {
            default = {}, 
            defensive = {}
        }, 
        other = {
            manual_yaw = v13.anti_aim_tweaks:combo("\v\f<arrows-repeat>\r  Manual Yaw", {
                [1] = "Disabled", 
                [2] = "Forward", 
                [3] = "Backward", 
                [4] = "Left", 
                [5] = "Right"
            }, function(v77, _)
                return {
                    static = v77:switch("Static manuals"), 
                    override_freestanding = v77:switch("Override freestanding")
                };
            end), 
            selection = v13.anti_aim_tweaks:selectable("\v\f<wand-magic-sparkles>\r  Tweaks", {
                [1] = "Legit Anti-Aim", 
                [2] = "During Warmup", 
                [3] = "All Enemies Dead", 
                [4] = "Avoid Backstap", 
                [5] = "Safe Head", 
                [6] = "Defensive Anti-Aim"
            }), 
            safe_head_state = v13.anti_aim_tweaks:selectable("\v\f<shield-check>\r  Safe Head", {
                [1] = "Standing", 
                [2] = "Moving", 
                [3] = "Walking", 
                [4] = "Crouching", 
                [5] = "Crouch + M", 
                [6] = "Air", 
                [7] = "Air + C"
            }, function(v79)
                return {
                    weapon = v79:selectable("Weapons", {
                        [1] = "Knife", 
                        [2] = "Zeus", 
                        [3] = "Grenade", 
                        [4] = "Bomb"
                    }), 
                    selection = v79:combo("Defensive type", {
                        [1] = "Default", 
                        [2] = "Disabled", 
                        [3] = "E-Spam"
                    })
                };
            end), 
            defensive_flick = v13.anti_aim_tweaks:switch("\v\f<keycdn>\r  Flick Exploit", false, function(v80, v81)
                local v83 = {
                    state = v80:selectable("States \n defensive flick", {
                        [1] = "Standing", 
                        [2] = "Moving", 
                        [3] = "Walking", 
                        [4] = "Crouching", 
                        [5] = "Crouch + M", 
                        [6] = "Air", 
                        [7] = "Air + C"
                    }), 
                    pitch = v80:combo("Pitch type", {
                        [1] = "Safe", 
                        [2] = "Semi-safe", 
                        [3] = "Dangerous", 
                        [4] = "Drift", 
                        [5] = "Toaster"
                    }), 
                    yaw = v80:combo("Yaw type", {
                        [1] = "Default", 
                        [2] = "Low", 
                        [3] = "Estetic", 
                        [4] = "Full", 
                        [5] = "Elusive", 
                        [6] = "Modulo", 
                        [7] = "Designer"
                    }), 
                    unmatched_mode = v80:switch("Unmatched mode"), 
                    time = v80:slider("Time", 1, 20, 4, 1, function(v82)
                        return v82 .. "t";
                    end), 
                    options = v80:selectable("Yaw options \n defensive flick", {
                        [1] = "Jitter"
                    })
                };
                v83.time:depend({
                    [1] = nil, 
                    [2] = false, 
                    [1] = v83.unmatched_mode
                });
                v81:tooltip("Override selected state to static \nExploit working on selected states");
                return v83, true;
            end), 
            freestanding_anti_aim = v13.anti_aim_tweaks:switch("\v\f<right-left>\r  Freestanding", false, function(v84)
                return {
                    disabled_states = v84:selectable("Disablers", {
                        [1] = "Standing", 
                        [2] = "Moving", 
                        [3] = "Walking", 
                        [4] = "Crouching", 
                        [5] = "Crouch + M", 
                        [6] = "Air", 
                        [7] = "Air + C"
                    }), 
                    yaw_modifiers = v84:switch("Disable Yaw Modifiers"), 
                    body = v84:switch("Body Freestanding")
                };
            end), 
            air_exploit = v13.anti_aim_tweaks:switch("\v\f<rocket>\r  Air Exploit", false, function(v85)
                return {
                    delay = v85:slider("Delay", 2, 14, 2, 1, "t")
                };
            end), 
            enable_animation_breakers = v13.anti_aim_tweaks:switch("\v\f<person>\r  Anim. Breakers", false, function(v86, _)
                local v88 = {
                    anim_breakers = v86:selectable("Selection ", {
                        [1] = "Landing legs", 
                        [2] = "Air legs", 
                        [3] = "Move lean"
                    }), 
                    landing_legs = v86:combo("Landing", {
                        [1] = "Static", 
                        [2] = "Moon walk", 
                        [3] = "Jitter"
                    }), 
                    air_legs = v86:combo("Air", {
                        [1] = "Static", 
                        [2] = "Moon walk", 
                        [3] = "Jitter"
                    }), 
                    move_lean_value = v86:slider("Value", 0, 100, 0, 1, "%"), 
                    adaptive_lean = v86:switch("4000$ lean")
                };
                v88.landing_legs:depend({
                    [1] = nil, 
                    [2] = "Landing legs", 
                    [1] = v88.anim_breakers
                });
                v88.air_legs:depend({
                    [1] = nil, 
                    [2] = "Air legs", 
                    [1] = v88.anim_breakers
                });
                v88.move_lean_value:depend({
                    [1] = nil, 
                    [2] = "Move lean", 
                    [1] = v88.anim_breakers
                });
                v88.adaptive_lean:depend({
                    [1] = nil, 
                    [2] = "Move lean", 
                    [1] = v88.anim_breakers
                });
                return v88, true;
            end), 
            export = v13.anti_aim_tweaks:button("  \v\f<file-export>\r          Export         ", function()

            end, true), 
            import = v13.anti_aim_tweaks:button("  \v\f<file-import>\r         Import          ", function()

            end, true)
        }
    }
};
for v89, v90 in pairs(v10.conditions) do
    v14.anti_aim.builder.default[v89] = {
        override_state = v13.anti_aim_builder:switch("Override " .. v90:lower() .. " setting"), 
        yaw = v13.anti_aim_builder:combo("Yaw", {
            [1] = "Static", 
            [2] = "L/R"
        }, function(v91, v92)
            local v93 = {
                static = v91:slider("Offset", -180, 180, 0), 
                left = v91:slider("Left offset", -180, 180, 0), 
                right = v91:slider("Right offset", -180, 180, 0), 
                randomize = v91:slider("Randomize", 0, 180, 0)
            };
            v93.static:depend({
                [1] = nil, 
                [2] = "Static", 
                [1] = v92
            });
            v93.left:depend({
                [1] = nil, 
                [2] = "L/R", 
                [1] = v92
            });
            v93.right:depend({
                [1] = nil, 
                [2] = "L/R", 
                [1] = v92
            });
            v93.randomize:depend({
                [1] = nil, 
                [2] = "L/R", 
                [1] = v92
            });
            return v93;
        end), 
        yaw_modifier = v13.anti_aim_builder:combo("Yaw Modifier", {
            [1] = "Disabled", 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "Spin", 
            [6] = "3-Way", 
            [7] = "5-Way"
        }, function(v94, v95)
            local v96 = {
                offset = v94:slider("Offset", -180, 180, 0)
            };
            v96.offset:depend({
                [1] = nil, 
                [2] = "Disabled", 
                [3] = true, 
                [1] = v95
            });
            return v96;
        end), 
        body_yaw = v13.anti_aim_builder:combo("Body Yaw", {
            [1] = "Disabled", 
            [2] = "Default", 
            [3] = "Jitter"
        }, function(v97, v98)
            local v101 = {
                left_limit = v97:slider("Left limit", 0, 60, 60, 1, "\194\176"), 
                right_limit = v97:slider("Right limit", 0, 60, 60, 1, "\194\176"), 
                delay = v97:slider("Switch delay", 1, 14, 1, 1, function(v99)
                    return v99 == 1 and "Off" or v99 .. "t";
                end), 
                fluctuate = v97:slider("Fluctuate", 0, 10, 0, 1, function(v100)
                    return v100 == 0 and "Off" or v100 .. "t";
                end)
            };
            v101.left_limit:depend({
                [1] = nil, 
                [2] = "Disabled", 
                [3] = true, 
                [1] = v98
            });
            v101.right_limit:depend({
                [1] = nil, 
                [2] = "Disabled", 
                [3] = true, 
                [1] = v98
            });
            v101.delay:depend({
                [1] = nil, 
                [2] = "Jitter", 
                [1] = v98
            });
            v101.fluctuate:depend({
                [1] = nil, 
                [2] = 2, 
                [3] = 14, 
                [1] = v101.delay
            }, {
                [1] = nil, 
                [2] = "Jitter", 
                [1] = v98
            });
            return v101;
        end), 
        force_lc = v13.anti_aim_builder:switch("Force LC", false, function(v102)
            return {
                onshot = v102:switch("On hideshots", false)
            }, true;
        end)
    };
    v14.anti_aim.builder.defensive[v89] = {
        enable = v13.anti_aim_builder:switch("Enable defensive anti-aim", false, function(v103, _)
            local v106 = {
                pitch = v103:combo("Pitch ", {
                    [1] = "Up", 
                    [2] = "Zero", 
                    [3] = "Down", 
                    [4] = "Random", 
                    [5] = "Staged", 
                    [6] = "Additional", 
                    [7] = "Custom"
                }), 
                pitch_offset = v103:slider("Offset \n #1 pitch", -89, 89, 0, 1, "\194\176"), 
                pitch_offset_2 = v103:slider("Offset \n #2 pitch", 0, 89, 0, 1, "\194\176"), 
                yaw = v103:combo("Yaw", {
                    [1] = "Neverlose", 
                    [2] = "Static", 
                    [3] = "Sideways", 
                    [4] = "Forward", 
                    [5] = "Backward", 
                    [6] = "3-Way", 
                    [7] = "5-Way"
                }), 
                offset = v103:slider("Offset \n #1 yaw", -180, 180, 0, 1, "\194\176"), 
                left = v103:slider("Offset #1 \n defensive yaw", -180, 180, -90), 
                right = v103:slider("Offset #2 \n defensive yaw", -180, 180, 90), 
                randomization = v103:slider("Randomize \n defensive yaw", 0, 180, 0), 
                delay = v103:slider("Delay \n defensive yaw", 1, 14, 1, 1, function(v105)
                    return v105 == 1 and "Off" or v105;
                end)
            };
            v106.pitch_offset:depend({
                [1] = nil, 
                [2] = "Custom", 
                [1] = v106.pitch
            });
            v106.pitch_offset_2:depend({
                [1] = nil, 
                [2] = "Random", 
                [1] = v106.pitch
            });
            v106.offset:depend({
                [1] = nil, 
                [2] = "Static", 
                [3] = false, 
                [1] = v106.yaw
            });
            v106.left:depend({
                [1] = nil, 
                [2] = "Sideways", 
                [1] = v106.yaw
            });
            v106.right:depend({
                [1] = nil, 
                [2] = "Sideways", 
                [1] = v106.yaw
            });
            v106.delay:depend({
                [1] = nil, 
                [2] = "Sideways", 
                [3] = "3-Way", 
                [4] = "5-Way", 
                [1] = v106.yaw
            });
            v106.randomization:depend({
                [1] = nil, 
                [2] = "Sideways", 
                [3] = "3-Way", 
                [4] = "5-Way", 
                [1] = v106.yaw
            });
            return v106, true;
        end)
    };
end;
for _, v108 in next, v49 do
    v14.general.hitchance_elements[v108] = {};
    hc_gear = v14.general.hitchance_override:create();
    v14.general.hitchance_elements[v108].override = hc_gear:switch("Override " .. v108:lower());
    v14.general.hitchance_elements[v108].condition = hc_gear:selectable("Conditions \n\aFFFFFF00" .. v108:lower(), {
        [1] = "No scope", 
        [2] = "In Air", 
        [3] = "On hotkey"
    });
    v14.general.hitchance_elements[v108].noscope = hc_gear:slider("No scope \n\aFFFFFF00" .. v108:lower(), 0, 100, 50, 1, "%");
    v14.general.hitchance_elements[v108].air = hc_gear:slider("Air \n\aFFFFFF00" .. v108:lower(), 0, 100, 50, 1, "%");
    v14.general.hitchance_elements[v108].force_bind = hc_gear:switch("\v\f<keyboard>\r   Hitchance \n\aFFFFFF00" .. v108:lower());
    v14.general.hitchance_elements[v108].force = hc_gear:slider("On hotkey \n\aFFFFFF00" .. v108:lower(), 0, 100, 50, 1, "%");
end;
local v109 = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg", vector(100, 100));
local v110 = {
    verdanab_10 = render.load_font("verdana bold", 80, "da"), 
    pixel = render.load_font("nl\\alcatraz\\fonts\\smallest_pixel-7.ttf", 10, "da"), 
    verdana_13 = render.load_font("verdana", 13, "da"), 
    pixel_14 = render.load_font("nl\\alcatraz\\fonts\\smallest_pixel-7.ttf", 14, "ad"), 
    gs = render.load_font("Calibri Bold", vector(27, 27, -1), "da")
};
local v111 = {
    dormant_aimbot = ui.find("aimbot", "ragebot", "main", "enabled", "dormant aimbot"), 
    extended_bt = ui.find("aimbot", "ragebot", "main", "enabled", "extended backtrack"), 
    peek_assist = ui.find("aimbot", "ragebot", "main", "peek assist"), 
    doubletap = ui.find("aimbot", "ragebot", "main", "double tap"), 
    lag_option = ui.find("aimbot", "ragebot", "main", "double tap", "lag options"), 
    onshot_lag_option = ui.find("aimbot", "ragebot", "main", "hide shots", "options"), 
    hide_shot = ui.find("aimbot", "ragebot", "main", "hide shots"), 
    hitchance = ui.find("aimbot", "ragebot", "selection", "hit chance"), 
    body_aim = ui.find("aimbot", "ragebot", "safety", "body aim"), 
    safe_point = ui.find("aimbot", "ragebot", "safety", "safe points"), 
    doubletap_fake_lag = ui.find("aimbot", "ragebot", "main", "double tap", "fake lag limit"), 
    damage = ui.find("aimbot", "ragebot", "selection", "min. damage"), 
    fake_duck = ui.find("aimbot", "anti aim", "misc", "fake duck"), 
    yaw_base_freestanding = ui.find("aimbot", "anti aim", "angles", "freestanding"), 
    freestanding_yaw_modifier = ui.find("aimbot", "anti aim", "angles", "freestanding", "disable yaw modifiers"), 
    freestanding_body = ui.find("aimbot", "anti aim", "angles", "freestanding", "body freestanding"), 
    fake_lag_key = ui.find("aimbot", "anti aim", "fake lag", "enabled"), 
    limit = ui.find("aimbot", "anti aim", "fake lag", "limit"), 
    variability = ui.find("aimbot", "anti aim", "fake lag", "variability"), 
    inverter = ui.find("aimbot", "anti aim", "angles", "body yaw", "inverter"), 
    avoid_backstab = ui.find("aimbot", "anti aim", "angles", "yaw", "avoid backstab"), 
    yaw_type = ui.find("aimbot", "anti aim", "angles", "yaw"), 
    base = ui.find("aimbot", "anti aim", "angles", "yaw", "base"), 
    yaw = ui.find("aimbot", "anti aim", "angles", "yaw", "offset"), 
    yaw_modifier = ui.find("aimbot", "anti aim", "angles", "yaw modifier"), 
    yaw_modifier_offset = ui.find("aimbot", "anti aim", "angles", "yaw modifier", "offset"), 
    left_des = ui.find("aimbot", "anti aim", "angles", "body yaw", "left limit"), 
    right_des = ui.find("aimbot", "anti aim", "angles", "body yaw", "right limit"), 
    options = ui.find("aimbot", "anti aim", "angles", "body yaw", "options"), 
    fs_des = ui.find("aimbot", "anti aim", "angles", "body yaw", "freestanding"), 
    pitch = ui.find("aimbot", "anti aim", "angles", "pitch"), 
    hidden = ui.find("aimbot", "anti aim", "angles", "yaw", "hidden"), 
    body_yaw = ui.find("aimbot", "anti aim", "angles", "body yaw"), 
    slow_walk = ui.find("aimbot", "anti aim", "misc", "slow walk"), 
    legmovement = ui.find("aimbot", "anti aim", "misc", "leg movement"), 
    scope_overlay = ui.find("visuals", "world", "main", "override zoom", "scope overlay"), 
    prediction_color = ui.find("visuals", "world", "other", "grenade prediction", "color"), 
    hit_prediction_color = ui.find("visuals", "world", "other", "grenade prediction", "color hit"), 
    air_strafe = ui.find("miscellaneous", "main", "movement", "air strafe"), 
    events = ui.find("miscellaneous", "main", "other", "log events"), 
    weapon_actions = ui.find("miscellaneous", "main", "other", "weapon actions"), 
    fake_latency = ui.find("miscellaneous", "main", "other", "fake latency")
};
other_gui = function()
    -- upvalues: v49 (ref), v14 (ref), l_pui_0 (ref), v10 (ref)
    for _, v113 in next, v49 do
        v14.general.hitchance_elements[v113].override:depend({
            [1] = v14.general.hitchance_override.weapon_select, 
            [2] = v113
        });
        v14.general.hitchance_elements[v113].condition:depend({
            [1] = v14.general.hitchance_override.weapon_select, 
            [2] = v113
        }, v14.general.hitchance_elements[v113].override);
        v14.general.hitchance_elements[v113].noscope:depend({
            [1] = v14.general.hitchance_override.weapon_select, 
            [2] = v113
        }, v14.general.hitchance_elements[v113].override, {
            [1] = nil, 
            [2] = "No scope", 
            [1] = v14.general.hitchance_elements[v113].condition
        });
        v14.general.hitchance_elements[v113].air:depend({
            [1] = v14.general.hitchance_override.weapon_select, 
            [2] = v113
        }, v14.general.hitchance_elements[v113].override, {
            [1] = nil, 
            [2] = "In Air", 
            [1] = v14.general.hitchance_elements[v113].condition
        });
        v14.general.hitchance_elements[v113].force_bind:depend({
            [1] = v14.general.hitchance_override.weapon_select, 
            [2] = v113
        }, v14.general.hitchance_elements[v113].override, {
            [1] = nil, 
            [2] = "On hotkey", 
            [1] = v14.general.hitchance_elements[v113].condition
        });
        v14.general.hitchance_elements[v113].force:depend({
            [1] = v14.general.hitchance_override.weapon_select, 
            [2] = v113
        }, v14.general.hitchance_elements[v113].override, {
            [1] = nil, 
            [2] = "On hotkey", 
            [1] = v14.general.hitchance_elements[v113].condition
        });
    end;
    l_pui_0.traverse(v14.anti_aim, function(v114, v115)
        -- upvalues: v14 (ref)
        if v115[1] ~= "enable" then
            v114:depend(v14.anti_aim.enable);
        end;
    end);
    l_pui_0.traverse(v14.anti_aim.builder.default, function(v116, v117)
        -- upvalues: v14 (ref), v10 (ref)
        v116:depend({
            [1] = v14.anti_aim.condition, 
            [2] = v10.conditions[v117[1]]
        });
    end);
    l_pui_0.traverse(v14.anti_aim.builder.defensive, function(v118, v119)
        -- upvalues: v14 (ref), v10 (ref)
        v118:depend({
            [1] = v14.anti_aim.condition, 
            [2] = v10.conditions[v119[1]]
        });
    end);
    for v120, _ in pairs(v10.conditions) do
        do
            local l_v120_0 = v120;
            l_pui_0.traverse(v14.anti_aim.builder.default[l_v120_0], function(v123, v124)
                -- upvalues: v14 (ref), l_v120_0 (ref)
                if v124[1] ~= "override_state" then
                    v123:depend(v14.anti_aim.builder.default[l_v120_0].override_state);
                end;
            end);
            l_pui_0.traverse(v14.anti_aim.builder.defensive[l_v120_0], function(v125, _)
                -- upvalues: v14 (ref), l_v120_0 (ref)
                v125:depend(v14.anti_aim.builder.default[l_v120_0].override_state, {
                    [1] = nil, 
                    [2] = "Defensive Anti-Aim", 
                    [1] = v14.anti_aim.other.selection
                });
            end);
        end;
    end;
    v14.anti_aim.other.safe_head_state:depend({
        [1] = nil, 
        [2] = "Safe Head", 
        [1] = v14.anti_aim.other.selection
    });
    v14.anti_aim.other.safe_head_state.weapon:depend({
        [1] = nil, 
        [2] = "Safe Head", 
        [1] = v14.anti_aim.other.selection
    });
    v14.anti_aim.other.safe_head_state.selection:depend({
        [1] = nil, 
        [2] = "Defensive Anti-Aim", 
        [1] = v14.anti_aim.other.selection
    });
end;
other_gui();
animated_sidebar = function()
    -- upvalues: l_gradient_0 (ref), l_pui_0 (ref)
    local v127 = l_gradient_0.text_animate("alcatraz.lua", 3, {
        ui.get_style("Link Active"), 
        color(50)
    });
    l_pui_0.sidebar(v127:get_animated_text(), "\240\159\143\155\239\184\143");
    v127:animate();
end;
v17.on_ground_ticks = 0;
get_state_builder = function()
    -- upvalues: v17 (ref), v111 (ref), v14 (ref)
    local v128 = entity.get_local_player();
    if not v128 or not v128:is_alive() then
        return;
    else
        local v129 = vector(v128["m_vecVelocity[0]"], v128["m_vecVelocity[1]"], v128["m_vecVelocity[2]"]):length2d();
        local l_m_fFlags_0 = v128.m_fFlags;
        local v131 = bit.band(l_m_fFlags_0, 1) == 1;
        local _ = bit.band(l_m_fFlags_0, 1) == 0;
        local v133 = bit.band(l_m_fFlags_0, 4) == 4;
        if v131 then
            v17.on_ground_ticks = v17.on_ground_ticks + 1;
        else
            v17.on_ground_ticks = 0;
        end;
        if (v111.yaw_base_freestanding:get() or v111.yaw_base_freestanding:get_override()) and rage.antiaim:get_target(true) ~= nil and v14.anti_aim.builder.default[9].override_state:get() then
            return 9;
        else
            if v17.on_ground_ticks > 10 then
                if v129 < 10 then
                    if not v133 and not v111.fake_duck:get() and v14.anti_aim.builder.default[2].override_state:get() then
                        return 2;
                    elseif (v133 or v111.fake_duck:get()) and v14.anti_aim.builder.default[5].override_state:get() then
                        return 5;
                    end;
                elseif v111.slow_walk:get() and not v133 and v14.anti_aim.builder.default[4].override_state:get() then
                    return 4;
                elseif not v133 and not v111.fake_duck:get() and not v111.slow_walk:get() and v14.anti_aim.builder.default[3].override_state:get() then
                    return 3;
                elseif (v133 or v111.fake_duck:get()) and v14.anti_aim.builder.default[6].override_state:get() then
                    return 6;
                end;
            elseif v17.on_ground_ticks < 10 then
                if v133 and v14.anti_aim.builder.default[8].override_state:get() then
                    return 8;
                elseif not v133 and v14.anti_aim.builder.default[7].override_state:get() then
                    return 7;
                end;
            end;
            return 1;
        end;
    end;
end;
get_state = function()
    -- upvalues: v17 (ref), v111 (ref)
    local v134 = entity.get_local_player();
    if not v134 or not v134:is_alive() then
        return;
    else
        local v135 = vector(v134["m_vecVelocity[0]"], v134["m_vecVelocity[1]"], v134["m_vecVelocity[2]"]):length2d();
        local l_m_fFlags_1 = v134.m_fFlags;
        local v137 = bit.band(l_m_fFlags_1, 1) == 1;
        local _ = bit.band(l_m_fFlags_1, 1) == 0;
        local v139 = bit.band(l_m_fFlags_1, 4) == 4;
        if v137 then
            v17.on_ground_ticks = v17.on_ground_ticks + 1;
        else
            v17.on_ground_ticks = 0;
        end;
        if v17.on_ground_ticks > 15 then
            if v135 < 10 then
                if not v139 and not v111.fake_duck:get() then
                    return 2;
                elseif v139 or v111.fake_duck:get() then
                    return 5;
                end;
            elseif v111.slow_walk:get() and not v139 then
                return 4;
            elseif not v139 and not v111.fake_duck:get() and not v111.slow_walk:get() then
                return 3;
            elseif v139 or v111.fake_duck:get() then
                return 6;
            end;
        elseif v17.on_ground_ticks < 15 then
            if v139 then
                return 8;
            elseif not v139 then
                return 7;
            end;
        end;
        return 1;
    end;
end;
logs_push = function(v140, v141)
    -- upvalues: v12 (ref)
    table.insert(v12, {
        alpha = 0, 
        icon = v140, 
        text = v141, 
        time = globals.curtime
    });
end;
ideal_peek = function()
    -- upvalues: v111 (ref), v14 (ref)
    v111.doubletap:override(v14.general.ideal_peek:get() and v111.peek_assist:get() and true or nil);
end;
aimbot_logging = function(v142)
    -- upvalues: v14 (ref), v10 (ref)
    local v143 = v14.visuals.screen_indication.logging_color:get():to_hex();
    local v144 = v14.general.aimbot_logging.hit_color:get():to_hex();
    local v145 = v14.general.aimbot_logging.missmatch_color:get():to_hex();
    local v146 = v14.general.aimbot_logging.miss_color:get():to_hex();
    local v147 = "DEFAULT";
    local v148 = entity.get(v142.target);
    local l_state_0 = v142.state;
    if v148 == nil then
        return;
    else
        local l_m_iHealth_0 = v148.m_iHealth;
        local v151 = false;
        if l_state_0 == nil then
            v151 = v142.damage < v142.wanted_damage or v10.hitgroup_str[v142.hitgroup] ~= v10.hitgroup_str[v142.wanted_hitgroup];
        end;
        if v14.general.aimbot_logging:get() then
            if v14.general.aimbot_logging.events:get("Hit") and l_state_0 == nil then
                if v151 then
                    print_raw(("\a%salcatraz\a%s \194\183 Hit \a%s%s\a%s`s \a%s%s\a%s for \a%s%s\a%s(\a%s%s\a%s) aimed = (\a%s%s\a%s) (history: \a%s%s\a%s) (spread: \a%s%.1f\194\176\a%s) (\a%s%s\a%s remaining)"):format(v145, v147, v145, v148:get_name(), v147, v145, v10.hitgroup_str[v142.hitgroup], v147, v145, v142.damage, v147, v145, v142.wanted_damage, v147, v145, v10.hitgroup_str[v142.wanted_hitgroup], v147, v145, v142.backtrack, v147, v145, v142.spread, v147, v145, l_m_iHealth_0, v147));
                else
                    print_raw(("\a%salcatraz\a%s \194\183 Hit \a%s%s\a%s`s \a%s%s\a%s(\a%s%s%s\a%s) for \a%s%s\a%s (history: \a%s%s\a%s) (spread: \a%s%.1f\194\176\a%s) (\a%s%s\a%s remaining)"):format(v144, v147, v144, v148:get_name(), v147, v144, v10.hitgroup_str[v142.hitgroup], v147, v144, v142.hitchance, "%", v147, v144, v142.damage, v147, v144, v142.backtrack, v147, v144, v142.spread, v147, v144, l_m_iHealth_0, v147));
                end;
            end;
            if v14.general.aimbot_logging.events:get("Miss") and l_state_0 ~= nil then
                print_raw(("\a%salcatraz\a%s \194\183 Missed shot at \a%s%s\a%s`s \a%s%s\a%s(\a%s%s%s\a%s) due to \a%s%s\a%s (dmg: \a%s%s\a%s | history: \a%s%s\a%s)"):format(v146, v147, v146, v148:get_name(), v147, v146, v10.hitgroup_str[v142.wanted_hitgroup], v147, v146, v142.hitchance, "%", v147, v146, l_state_0, v147, v146, v142.wanted_damage, v147, v146, v142.backtrack, v147));
            end;
        end;
        if l_state_0 == nil then
            if v151 then
                if v14.visuals.screen_indication.events:get("Hit/Miss") then
                    logs_push("bolt", ("Hit \a%s%s\a%s's \a%s%s\a%s(\a%s%s%s\a%s) for\a%s %s\a%s(\a%s%s\a%s) damage health remaining: \a%s%shp"):format(v143, v142.target:get_name(), v147, v143, v10.hitgroup_str[v142.hitgroup], v147, v143, v142.hitchance, "%", v147, v143, v142.damage, v147, v143, v142.wanted_damage, v147, v143, l_m_iHealth_0));
                    if v14.visuals.screen_indication.position:get(1) and v14.visuals.screen_indication.log_events:get() and v14.visuals.screen_indication:get() then
                        print_dev(("Hit \a%s%s\a%s's \a%s%s\a%s(\a%s%s%s\a%s) for\a%s %s\a%s(\a%s%s\a%s) damage health remaining: \a%s%shp\a%s"):format(v143, v142.target:get_name(), v147, v143, v10.hitgroup_str[v142.hitgroup], v147, v143, v142.hitchance, "%", v147, v143, v142.damage, v147, v143, v142.wanted_damage, v147, v143, l_m_iHealth_0, v147));
                    end;
                end;
            elseif v14.visuals.screen_indication.events:get("Hit/Miss") then
                logs_push("check", ("Hit \a%s%s\a%s's \a%s%s\a%s(\a%s%s%s\a%s) for\a%s %s\a%s damage health remaining: \a%s%shp"):format(v143, v142.target:get_name(), v147, v143, v10.hitgroup_str[v142.hitgroup], v147, v143, v142.hitchance, "%", v147, v143, v142.damage, v147, v143, l_m_iHealth_0));
                if v14.visuals.screen_indication.position:get(1) and v14.visuals.screen_indication.log_events:get() and v14.visuals.screen_indication:get() then
                    print_dev(("Hit \a%s%s\a%s's \a%s%s\a%s(\a%s%s%s\a%s) for\a%s %s\a%s damage health remaining: \a%s%shp\a%s"):format(v143, v142.target:get_name(), v147, v143, v10.hitgroup_str[v142.hitgroup], v147, v143, v142.hitchance, "%", v147, v143, v142.damage, v147, v143, l_m_iHealth_0, v147));
                end;
            end;
        elseif v14.visuals.screen_indication.events:get("Hit/Miss") then
            logs_push("xmark", ("Missed \a%s%s\a%s's \a%s%s \a%s(\a%sdmg:%s, %s%s\a%s) due to \a%s%s\a%s bt: \a%s%s"):format(v143, v142.target:get_name(), v147, v143, v10.hitgroup_str[v142.wanted_hitgroup], v147, v143, v142.wanted_damage, v142.hitchance, "%", v147, v143, l_state_0, v147, v143, v142.backtrack));
            if v14.visuals.screen_indication.position:get(1) and v14.visuals.screen_indication.log_events:get() and v14.visuals.screen_indication:get() then
                print_dev(("Missed \a%s%s\a%s's \a%s%s \a%s(\a%sdmg:%s, %s%s\a%s) due to \a%s%s\a%s bt: \a%s%s\a%s"):format(v143, v142.target:get_name(), v147, v143, v10.hitgroup_str[v142.wanted_hitgroup], v147, v143, v142.wanted_damage, v142.hitchance, "%", v147, v143, l_state_0, v147, v143, v142.backtrack, v147));
            end;
        end;
        return;
    end;
end;
logging_handle = function()
    -- upvalues: v14 (ref), v111 (ref)
    if v14.general.aimbot_logging:get() then
        v111.events:override({});
        v111.events:disabled(true);
    else
        v111.events:disabled(false);
        v111.events:override();
    end;
end;
logging_handle();
v14.general.aimbot_logging:set_callback(logging_handle);
nade_logging = function(v152)
    -- upvalues: v14 (ref)
    local v153 = entity.get_local_player();
    local v154 = entity.get(v152.attacker, true);
    local v155 = entity.get(v152.userid, true);
    local l_weapon_0 = v152.weapon;
    local l_health_0 = v152.health;
    local v158 = v14.general.aimbot_logging.hit_color:get():to_hex();
    local v159 = v14.visuals.screen_indication.logging_color:get():to_hex();
    local v160 = "DEFAULT";
    local v161 = {
        hegrenade = l_health_0 > 0 and "Explode" or "Exploded", 
        inferno = l_health_0 > 0 and "Burn" or "Burned", 
        knife = l_health_0 > 0 and "Hit" or "Knifed"
    };
    local v162 = {
        hegrenade = "bomb", 
        inferno = "fire-flame-simple", 
        knife = "knife"
    };
    local v163 = v161[l_weapon_0];
    local v164 = v162[l_weapon_0];
    if v155 == v153 or v154 ~= v153 then
        return;
    elseif v163 == nil then
        return;
    else
        if v14.visuals.screen_indication.events:get("Hit/Miss") then
            logs_push(v164, ("%s \a%s%s\a%s for \a%s%s\a%s (\a%s%s\a%s remaining)"):format(v163, v159, v155:get_name(), v160, v159, v152.dmg_health, v160, v159, v152.health, v160));
            if v14.visuals.screen_indication.position:get(1) and v14.visuals.screen_indication.log_events:get() then
                print_dev(("%s \a%s%s\a%s for \a%s%s\a%s (\a%s%s\a%s remaining)\a%s"):format(v163, v159, v155:get_name(), v160, v159, v152.dmg_health, v160, v159, v152.health, v160, v160));
            end;
        end;
        if not v14.general.aimbot_logging:get() then
            return;
        elseif not v14.general.aimbot_logging.events:get("Hit") then
            return;
        else
            print_raw(("\a%salcatraz\a%s \194\183 %s \a%s%s\a%s for \a%s%s\a%s (\a%s%s\a%s remaining)"):format(v158, v160, v163, v158, v155:get_name(), v160, v158, v152.dmg_health, v160, v158, v152.health, v160));
            return;
        end;
    end;
end;
item_purchase_logging = function(v165)
    -- upvalues: v14 (ref)
    local v166 = v14.visuals.screen_indication.logging_color:get():to_hex();
    local v167 = entity.get(v165.userid, true);
    if v167 == nil then
        return;
    else
        local l_team_0 = v165.team;
        local l_weapon_1 = v165.weapon;
        if l_weapon_1 == "weapon_unknown" or l_weapon_1 == nil then
            return;
        else
            local v170 = l_team_0 == 3 and v14.general.aimbot_logging.ct_buy:get():to_hex() or v14.general.aimbot_logging.t_buy:get():to_hex();
            local v171 = "DEFAULT";
            if v14.visuals.screen_indication.events:get("Purchases") then
                logs_push("cart-shopping", ("\a%s%s\a%s bought \a%s%s\a%s"):format(v166, v167:get_name(), v171, v166, l_weapon_1, v171));
                if v14.visuals.screen_indication.position:get(1) and v14.visuals.screen_indication.log_events:get() and v14.visuals.screen_indication:get() then
                    print_dev(("\a%s%s\a%s bought \a%s%s\a%s"):format(v166, v167:get_name(), v171, v166, l_weapon_1, v171));
                end;
            end;
            if not v14.general.aimbot_logging:get() then
                return;
            elseif not v14.general.aimbot_logging.events:get("Purchases") then
                return;
            else
                print_raw(("\a%salcatraz\a%s \194\183 \a%s%s\a%s bought \a%s%s\a%s"):format(v170, v171, v170, v167:get_name(), v171, v170, l_weapon_1, v171));
                return;
            end;
        end;
    end;
end;
override_hitchance = function()
    -- upvalues: v14 (ref), v111 (ref), v50 (ref)
    local v172 = entity.get_local_player();
    local v173 = get_state();
    if not v14.general.hitchance_override:get() then
        return;
    else
        local v174 = v172:get_player_weapon();
        if v174 == nil then
            return v111.hitchance:override();
        else
            local _ = v174:get_weapon_index();
            local v176 = v50[get_weapon_id(v172)];
            if v176 == nil then
                return v111.hitchance:override();
            elseif not v14.general.hitchance_elements[v176].override:get() then
                return v111.hitchance:override();
            else
                if v14.general.hitchance_elements[v176].condition:get("On hotkey") and v14.general.hitchance_elements[v176].force_bind:get() then
                    v111.hitchance:override(v14.general.hitchance_elements[v176].force:get());
                elseif v14.general.hitchance_elements[v176].condition:get("No scope") and not v172.m_bIsScoped then
                    v111.hitchance:override(v14.general.hitchance_elements[v176].noscope:get());
                elseif v14.general.hitchance_elements[v176].condition:get("In air") and (v173 == 7 or v173 == 8) then
                    v111.hitchance:override(v14.general.hitchance_elements[v176].air:get());
                else
                    v111.hitchance:override();
                end;
                return;
            end;
        end;
    end;
end;
is_breaking = function()
    return rage.exploit:get() > 0.05 and rage.exploit:get() < 0.99;
end;
better_lagcomp = function()
    -- upvalues: v14 (ref), v111 (ref)
    if not v14.general.better_lc:get() then
        return;
    else
        local l_doubletap_fake_lag_0 = v111.doubletap_fake_lag;
        local l_l_doubletap_fake_lag_0_0 = l_doubletap_fake_lag_0;
        l_doubletap_fake_lag_0 = l_doubletap_fake_lag_0.override;
        local v179;
        if is_breaking() then
            v179 = v14.general.better_lc.zerolag:get() and 0 or 3;
        else
            v179 = nil;
        end;
        l_doubletap_fake_lag_0(l_l_doubletap_fake_lag_0_0, v179);
        return;
    end;
end;
extrapolate_position = function(v180, v181, v182)
    local l_m_vecVelocity_0 = v180.m_vecVelocity;
    for _ = 0, v182 do
        v181.x = v181.x + l_m_vecVelocity_0.x * globals.tickinterval;
        v181.y = v181.y + l_m_vecVelocity_0.y * globals.tickinterval;
        v181.z = v181.z + l_m_vecVelocity_0.z * globals.tickinterval;
    end;
    return vector(v181.x, v181.y, v181.z);
end;
predict = function()
    -- upvalues: v14 (ref)
    local v185 = entity.get_local_player();
    if not v185 then
        return;
    elseif v185:get_player_weapon() == nil then
        return;
    else
        local v186 = {
            Ultimate = 0.031, 
            Ascend = 0.029125, 
            Enhanced = 0.27525, 
            Balanced = 0.025626, 
            Disabled = 0.015625
        };
        if v14.general.rage_improvements:get() and v14.general.rage_improvements.predict:get() then
            if v14.general.rage_improvements.ping_variation:get() == "Low" then
                cvar.cl_interpolate:int(0);
                cvar.cl_interp_ratio:int(v14.general.rage_improvements.prediction_type:get() == "Ultimate" and 0 or 1);
                cvar.cl_interp:float(v186[v14.general.rage_improvements.prediction_type:get()]);
            elseif v14.general.rage_improvements.ping_variation:get() == "High" then
                cvar.cl_interp:float(0.02);
                cvar.cl_interp_ratio:int(0);
                cvar.cl_interpolate:int(0);
            end;
        else
            cvar.cl_interp:float(0.015625);
            cvar.cl_interp_ratio:int(2);
            cvar.cl_interpolate:int(1);
        end;
        return;
    end;
end;
jumpscout_fix = function(v187)
    -- upvalues: v14 (ref), v111 (ref)
    local v188 = entity.get_local_player();
    if not v188 or not v188:is_alive() then
        return;
    else
        speed = vector(v188["m_vecVelocity[0]"], v188["m_vecVelocity[1]"], v188["m_vecVelocity[2]"]):length2d();
        flags = v188.m_fFlags;
        local v189 = bit.band(flags, 1) == 0;
        if v14.general.rage_improvements:get() then
            if v14.general.rage_improvements.jump_scout:get() then
                if get_weapon_id(v188) == 40 then
                    if speed < 10 then
                        v111.air_strafe:override(false);
                    else
                        v111.air_strafe:override();
                    end;
                    if v14.general.rage_improvements.better_auto_stop:get() then
                        local v190 = entity.get_threat(true);
                        if not v190 then
                            return;
                        else
                            local v191 = extrapolate_position(v188, v188:get_eye_position(), 20);
                            local v192, _ = utils.trace_bullet(v188, v191, v190:get_hitbox_position(3));
                            if v189 and v192 > 1 then
                                v187.sidemove = v187.sidemove * -1;
                                v187.forwardmove = v187.forwardmove * -1;
                                v111.air_strafe:override(false);
                            else
                                v111.air_strafe:override();
                            end;
                        end;
                    end;
                else
                    v111.air_strafe:override();
                end;
            else
                v111.air_strafe:override();
            end;
        else
            v111.air_strafe:override();
        end;
        return;
    end;
end;
get_best_body_damage = function(v194, v195, v196)
    local v197 = {
        [1] = 3, 
        [2] = 4, 
        [3] = 5, 
        [4] = 6
    };
    local v198 = 0;
    local v199 = extrapolate_position(v194, v194:get_eye_position(), v196);
    for _, v201 in pairs(v197) do
        local v202 = v195:get_hitbox_position(v201);
        local v203, _ = utils.trace_bullet(v194, v199, v202);
        if v198 < v203 then
            v198 = v203;
        end;
    end;
    return v198;
end;
baim_if_letal = function()
    -- upvalues: v14 (ref), v111 (ref), v50 (ref)
    if not v14.general.rage_improvements:get() then
        return v111.body_aim:override();
    elseif not v14.general.rage_improvements.baim_improvements:get() then
        return v111.body_aim:override();
    else
        local v205 = entity.get_local_player();
        if not v205 then
            return;
        elseif not v205:is_alive() then
            return;
        else
            local v206 = v205:get_player_weapon();
            if v206 == nil then
                return v111.body_aim:override();
            else
                local _ = v206:get_weapon_index();
                local v208 = v50[get_weapon_id(v205)];
                if v208 == nil then
                    return v111.body_aim:override();
                elseif not v14.general.rage_improvements.baim_weapons:get(v208) then
                    return v111.body_aim:override();
                else
                    local v209 = entity.get_threat(true);
                    if v209 == nil then
                        return v111.body_aim:override();
                    else
                        if v209.m_iHealth < get_best_body_damage(v205, v209, 30 + v14.general.rage_improvements.baim_ticks:get()) then
                            v111.body_aim:override("Force");
                        else
                            v111.body_aim:override();
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end;
end;
esp.enemy:new_text("BAIM", "BAIM", function(_)
    -- upvalues: v14 (ref), v111 (ref)
    if not v14.general.rage_improvements:get() then
        return;
    elseif not v14.general.rage_improvements.baim_improvements:get() then
        return;
    else
        local v211 = entity.get_local_player();
        if not v211 then
            return;
        elseif not v211:is_alive() then
            return;
        elseif v111.body_aim:get() ~= "Force" and v111.body_aim:get_override() ~= "Force" then
            return;
        else
            return "\aFF0000FFBAIM";
        end;
    end;
end);
local v212 = {
    watermark_data = {
        width = 0
    }, 
    keybinds_data = {
        accent_alpha = 0, 
        m_alpha = 0, 
        m_active = {}, 
        names = {
            ["Edge Jump"] = "Jump at edge", 
            ["Peek Assist"] = "Quick peek", 
            ["Slow Walk"] = "Slow motion", 
            ["Body Aim"] = "Body aim", 
            ["Safe Points"] = "Safe point", 
            ["Fake Duck"] = "Duck peek assist", 
            ["Fake Latency"] = "Ping spike", 
            ["Min. Damage"] = "Damage override", 
            ["Hide Shots"] = "Hide shots"
        }
    }, 
    damage_data = {
        text_width = 0, 
        blinking_alpha = 0, 
        full_alpha = 0
    }, 
    on_screen_data = {
        name_move = 0, 
        binds = {}
    }, 
    manual_arrows_data = {
        alpha = 0
    }, 
    aspect_ratio_data = {
        value = 0
    }
};
create_window = function(v213, v214, v215, v216, v217, v218, v219, v220)
    -- upvalues: v14 (ref)
    local v221 = v14.visuals.windows.style:get();
    local v222 = v14.visuals.windows.glow:get();
    local v223, v224, v225, _ = v219:unpack();
    if v222 then
        render.shadow(vector(v213, v214), vector(v213 + v215, v214 + v216), color(v223, v224, v225, v217), 24, 0, 10);
    end;
    if v221 == "Solid" then
        render.rect(vector(v213, v214 + 2), vector(v213 + v215, v214 + v216), color(0, 0, 0, v218), 0, false);
        render.rect(vector(v213, v214), vector(v213 + v215, v214 + 2), color(v223, v224, v225, v217), 0, false);
    elseif v221 == "Half-Rounded" then
        render.rect(vector(v213, v214), vector(v213 + v215, v214 + v216), color(0, 0, 0, v218), 6);
        render.push_clip_rect(vector(v213, v214), vector(v213 + v215, v214 + v216 / 1.75), true);
        render.rect_outline(vector(v213 - 1, v214), vector(v213 + v215 + 1, v214 + v216), color(v223, v224, v225, v217), 2.5, 6, false);
        render.pop_clip_rect();
    elseif v221 == "Fade" then
        render.rect(vector(v213, v214), vector(v213 + v215, v214 + v216), color(0, 0, 0, v218), 6);
        render.push_clip_rect(vector(v213, v214), vector(v213 + v215, v214 + v216 / 2), true);
        render.rect_outline(vector(v213 - 1, v214), vector(v213 + v215 + 1, v214 + v216 + 2), color(v223, v224, v225, v217), 2.25, 6, false);
        render.pop_clip_rect();
        render.push_clip_rect(vector(v213, v214 + v216 / 2), vector(v213 + v215, v214 + v216), true);
        render.rect_outline(vector(v213 - 1, v214), vector(v213 + v215 + 1, v214 + v216), color(v223 / 1.11, v224 / 1.11, v225 / 1.11, v217 / 1.75), 1.75, 6, false);
        render.pop_clip_rect();
    end;
    render.text(1, vector(v213 + v215 / 2, v214 + v216 / 2), color(255, 255, 255, v217), "c", v220);
end;
watermark = function()
    -- upvalues: v14 (ref), v10 (ref), v212 (ref)
    if not v14.visuals.windows:get() or not v14.visuals.windows.selection:get("Watermark") then
        return;
    else
        time_text = common.get_date("%I:%M");
        text = " alcatraz ";
        net = utils.net_channel();
        local v227;
        if globals.is_connected == true then
            if math.floor(net.avg_latency[1] * 1000) <= 5 then
                v227 = "local server ";
                goto label0 --[[  true, true  ]];
            else
                v227 = math.floor(net.avg_latency[1] * 1000) .. "ms ";
                if v227 then
                    goto label0;
                end;
            end;
        end;
        v227 = "loopback ";
        ::label0::;
        ping = v227;
        fps = math.floor(1 / globals.frametime);
        username = common.get_username():lower() == "frozyflame" and "admin" or common.get_username():lower();
        text = text .. (v14.visuals.windows.additional:get(1) and "[" .. v10.build .. "] " or "");
        text = text .. (v14.visuals.windows.additional:get(2) and "| " .. username .. " " or "");
        text = text .. (v14.visuals.windows.additional:get(3) and "| " .. fps .. " fps " or "");
        text = text .. (v14.visuals.windows.additional:get(4) and "| " .. ping or "");
        text = text .. (v14.visuals.windows.additional:get(5) and "| " .. time_text .. " " or "");
        text_s = render.measure_text(1, nil, text);
        v212.watermark_data.width = lerp(v212.watermark_data.width, text_s.x, 24 * globals.frametime);
        text_str = string.sub(text, 1, 1 + #text * (v212.watermark_data.width / text_s.x));
        create_window(v10.screen.x - math.floor(v212.watermark_data.width) - 5, 12, math.floor(v212.watermark_data.width), 20, 255, v14.visuals.windows.alpha:get() * 2.55, v14.visuals.windows.style.color:get(), text_str);
        return;
    end;
end;
local function v230()
    for _, v229 in pairs(ui.get_binds()) do
        if v229.active then
            return true;
        end;
    end;
    return false;
end;
keybinds = l_system_0.register({
    [1] = v14.visuals.windows.x_keybind, 
    [2] = v14.visuals.windows.y_keybind
}, vector(150, 20), "keybinds", function(v231)
    -- upvalues: v14 (ref), v212 (ref), v230 (ref)
    if not v14.visuals.windows:get() or not v14.visuals.windows.selection:get("Hotkey list") then
        return;
    else
        local l_x_0 = v231.position.x;
        local l_y_0 = v231.position.y;
        local _ = v231.size.x;
        local _ = v231.size.y;
        local v236 = ui.get_binds();
        local v237 = 120;
        local l_y_2 = v231.size.y;
        v212.keybinds_data.accent_alpha = lerp(v212.keybinds_data.accent_alpha, (not not v230() or ui.get_alpha() > 0.5) and v14.visuals.windows.alpha:get() * 2.55 or 0, 15 * globals.frametime);
        v212.keybinds_data.m_alpha = lerp(v212.keybinds_data.m_alpha, (not not v230() or ui.get_alpha() > 0.5) and 255 or 0, 15 * globals.frametime);
        create_window(v231.position.x, v231.position.y, math.floor(v231.size.x), v231.size.y, v212.keybinds_data.m_alpha, v212.keybinds_data.accent_alpha, v14.visuals.windows.style.color:get(), "keybinds");
        for v239, v240 in pairs(v236) do
            local l_name_0 = v240.name;
            local l_name_1 = v240.name;
            local v243 = v240.mode == 1 and "[holding]" or v240.mode == 2 and "[toggled]" or "[?]";
            local l_value_0 = v240.value;
            local v245 = v212.keybinds_data.names[l_name_0] or l_name_0;
            local _ = render.measure_text(1, nil, v245).x + 75;
            if v240.active then
                if v212.keybinds_data.m_active[l_name_1] == nil then
                    v212.keybinds_data.m_active[l_name_1] = {
                        alpha = 0, 
                        offset = 0
                    };
                end;
                v212.keybinds_data.m_active[l_name_1].offset = render.measure_text(1, nil, v245).x + 60;
                if v212.keybinds_data.m_active[l_name_1].alpha then
                    v212.keybinds_data.m_active[l_name_1].alpha = lerp(v212.keybinds_data.m_active[l_name_1].alpha, 255, 12 * globals.frametime);
                end;
            else
                if v212.keybinds_data.m_active[l_name_1] == nil then
                    v212.keybinds_data.m_active[l_name_1] = {
                        alpha = 0, 
                        offset = 0
                    };
                end;
                v212.keybinds_data.m_active[l_name_1].alpha = lerp(v212.keybinds_data.m_active[l_name_1].alpha, 0, 18 * globals.frametime);
            end;
            if v236[v239].active and v237 < v212.keybinds_data.m_active[l_name_1].offset then
                local l_offset_0 = v212.keybinds_data.m_active[l_name_1].offset;
                if l_offset_0 then
                    v237 = l_offset_0;
                end;
            end;
            if type(l_value_0) == "boolean" then
                render.text(1, vector(l_x_0 + 2, l_y_0 + l_y_2), color(255, 255, 255, math.floor(v212.keybinds_data.m_active[l_name_1].alpha)), nil, v245);
                render.text(1, vector(l_x_0 + math.floor(v231.size.x) - math.floor(render.measure_text(1, nil, v243).x - 1), l_y_0 + l_y_2), color(255, 255, 255, math.floor(v212.keybinds_data.m_active[l_name_1].alpha)), nil, v243);
            elseif type(l_value_0) == "table" then
                local v248 = {};
                render.text(1, vector(l_x_0 + 2, l_y_0 + l_y_2), color(255, 255, 255, math.floor(v212.keybinds_data.m_active[l_name_1].alpha)), nil, v245);
                if type(l_value_0) == "table" then
                    for _, v250 in pairs(l_value_0) do
                        table.insert(v248, string.sub(v250, 1, 1));
                    end;
                    local v251 = "[" .. table.concat(v248, ", ") .. "]";
                    local l_x_2 = render.measure_text(1, nil, v251).x;
                    local v253 = v245 .. "   " .. v251;
                    local l_x_3 = render.measure_text(1, nil, v253).x;
                    render.text(1, vector(l_x_0 + math.floor(v231.size.x) - math.floor(l_x_2), l_y_0 + l_y_2), color(255, 255, 255, math.floor(v212.keybinds_data.m_active[l_name_1].alpha)), nil, v251);
                    v237 = math.max(v237, l_x_3);
                end;
            else
                render.text(1, vector(l_x_0 + 2, l_y_0 + l_y_2), color(255, 255, 255, math.floor(v212.keybinds_data.m_active[l_name_1].alpha)), nil, v245);
                render.text(1, vector(l_x_0 + math.floor(v231.size.x) - math.floor(render.measure_text(1, nil, "[" .. l_value_0 .. "]").x - 1), l_y_0 + l_y_2), color(255, 255, 255, math.floor(v212.keybinds_data.m_active[l_name_1].alpha)), nil, "[" .. l_value_0 .. "]");
            end;
            l_y_2 = math.floor(l_y_2 + 15 * (v212.keybinds_data.m_active[l_name_1].alpha / 255));
        end;
        v231.size.x = lerp(v231.size.x, v237, 12 * globals.frametime);
        v14.visuals.windows.x_keybind:set(l_x_0);
        v14.visuals.windows.y_keybind:set(l_y_0);
        return;
    end;
end);
static_watermark = function()
    -- upvalues: v14 (ref), l_gradient_0 (ref), v10 (ref)
    if not v14.visuals.screen_indication:get() then
        return;
    elseif not v14.visuals.screen_indication.static_watermark:get() then
        return;
    else
        local v255, v256, v257, _ = v14.visuals.screen_indication.static_watermark.color:get():unpack();
        local v259 = l_gradient_0.text_animate("A L C A T R A Z", -2, {
            color(v255, v256, v257, 255), 
            color(25, 25, 25, 255)
        });
        local v260 = render.measure_text(1, "c", "A L C A T R A Z");
        if v14.visuals.screen_indication.watermark_position:get() == "Left" then
            render.text(1, vector(v10.screen.x / 30, v10.screen.y / 2.5), color(), "c", v259:get_animated_text());
        elseif v14.visuals.screen_indication.watermark_position:get() == "Bottom" then
            render.text(1, vector(v10.screen.x / 2, v10.screen.y - v260.y), color(), "c", v259:get_animated_text());
        elseif v14.visuals.screen_indication.watermark_position:get() == "Right" then
            render.text(1, vector(v10.screen.x / 1.033, v10.screen.y / 2.5), color(), "c", v259:get_animated_text());
        end;
        v259:animate();
        return;
    end;
end;
on_screen_indication = function()
    -- upvalues: v14 (ref), v10 (ref), v111 (ref), l_gradient_0 (ref), v212 (ref), v110 (ref)
    local v261 = entity.get_local_player();
    if not v261 then
        return;
    elseif not v261:is_alive() then
        return;
    elseif not v14.visuals.screen_indication:get() then
        return;
    elseif not v14.visuals.screen_indication.on_screen:get() then
        return;
    else
        local v262 = entity.get_threat(true);
        local v263 = v262 == nil and "nil" or v262:get_name();
        local l_m_bIsScoped_0 = v261.m_bIsScoped;
        local v265 = get_state();
        local v266 = 8;
        local v267 = get_active_binding_info("Fake Latency")[1];
        local v268 = get_active_binding_info("Min. Damage")[1];
        local v269 = {
            [1] = {
                value = v263 ~= "nil", 
                text = v263, 
                clr = color(255, 255, 255, 0)
            }, 
            [2] = {
                value = v10.conditions[v265], 
                text = v10.conditions[v265], 
                clr = color(255, 255, 255, 0)
            }, 
            [3] = {
                text = "ping", 
                value = v267, 
                clr = color(255, 255, 255, 0)
            }, 
            [4] = {
                text = "dt", 
                value = v111.doubletap:get(), 
                clr = color(255, 255, 255, 0)
            }, 
            [5] = {
                text = "hs", 
                value = v111.hide_shot:get(), 
                clr = color(255, 255, 255, 0)
            }, 
            [6] = {
                text = "dmg", 
                value = v268, 
                clr = color(255, 255, 255, 0)
            }, 
            [7] = {
                text = "duck", 
                value = v111.fake_duck:get(), 
                clr = color(255, 255, 255, 0)
            }, 
            [8] = {
                text = "freestand", 
                value = v111.yaw_base_freestanding:get(), 
                clr = color(255, 255, 255, 0)
            }, 
            [9] = {
                text = "peek", 
                value = v111.peek_assist:get(), 
                clr = color(255, 255, 255, 0)
            }
        };
        local v270 = v14.visuals.screen_indication.clr_1:get();
        local v271 = v14.visuals.screen_indication.clr_2:get();
        local v272 = l_gradient_0.text_animate("alcatraz", -1, {
            [1] = v270, 
            [2] = v271
        });
        v212.on_screen_data.name_move = lerp(v212.on_screen_data.name_move, l_m_bIsScoped_0 and 50 or 0, 0.05);
        render.text(v110.pixel, vector(math.floor(v10.screen.x / 2 + v212.on_screen_data.name_move), v10.screen.y / 1.97 + v266), color(255), "c", v272:get_animated_text());
        v272:animate();
        v266 = v266 + 8;
        for v273, v274 in pairs(v269) do
            active = v274.value and v14.visuals.screen_indication.additional_settings:get(v273);
            if active then
                if v212.on_screen_data.binds[v274.text] == nil then
                    v212.on_screen_data.binds[v274.text] = {
                        alpha = 0, 
                        padding = 0
                    };
                end;
                if v212.on_screen_data.binds[v274.text].alpha then
                    v212.on_screen_data.binds[v274.text].alpha = lerp(v212.on_screen_data.binds[v274.text].alpha, 255, 12 * globals.frametime);
                end;
            else
                if v212.on_screen_data.binds[v274.text] == nil then
                    v212.on_screen_data.binds[v274.text] = {
                        alpha = 0, 
                        padding = 0
                    };
                end;
                v212.on_screen_data.binds[v274.text].alpha = lerp(v212.on_screen_data.binds[v274.text].alpha, 0, 18 * globals.frametime);
            end;
            if v274.text == "ping" then
                local v275 = 255 - math.floor(v111.fake_latency:get() / cvar.sv_maxunlag:float() / 500 * 255);
                v274.clr = color(v275, 255, v275);
            elseif v274.text == "dt" then
                v274.clr = rage.exploit:get() == 1 and color(255) or color(255, 100, 100);
            end;
            v274.clr.a = v212.on_screen_data.binds[v274.text].alpha;
            render.text(v110.pixel, vector(math.floor(v10.screen.x / 2 + v212.on_screen_data.name_move), v10.screen.y / 1.97 + math.floor(v266)), v274.clr, "c", v274.text);
            v266 = v266 + 10 * v212.on_screen_data.binds[v274.text].alpha / 255;
        end;
        return;
    end;
end;
v17.scope_animation = 0;
scope_overlay = function()
    -- upvalues: v17 (ref), v14 (ref), v111 (ref), v10 (ref)
    local v276 = entity.get_local_player();
    if not v276 or not v276:is_alive() or not v276.m_bIsScoped then
        v17.scope_animation = lerp(v17.scope_animation, 0, 40 * globals.frametime);
    else
        v17.scope_animation = lerp(v17.scope_animation, 1, 40 * globals.frametime);
    end;
    offset = v14.visuals.custom_scope.offset:get() * v17.scope_animation;
    length = v14.visuals.custom_scope.length:get() * v17.scope_animation;
    col = v14.visuals.custom_scope.color:get();
    col.a = 255 * v17.scope_animation;
    if v14.visuals.custom_scope:get() then
        v111.scope_overlay:override("Remove All");
        render.gradient(vector(v10.screen.x / 2 - offset, v10.screen.y / 2), vector(v10.screen.x / 2 - offset - length, v10.screen.y / 2 + 1), color(col.r, col.g, col.b, col.a), color(col.r, col.g, col.b, 0 * col.a), color(col.r, col.g, col.b, col.a), color(col.r, col.g, col.b, 0 * col.a));
        render.gradient(vector(v10.screen.x / 2 + offset + 1, v10.screen.y / 2), vector(v10.screen.x / 2 + offset + length, v10.screen.y / 2 + 1), color(col.r, col.g, col.b, col.a), color(col.r, col.g, col.b, 0 * col.a), color(col.r, col.g, col.b, col.a), color(col.r, col.g, col.b, 0 * col.a));
        render.gradient(vector(v10.screen.x / 2, v10.screen.y / 2 + offset), vector(v10.screen.x / 2 + 1, v10.screen.y / 2 + offset + length), color(col.r, col.g, col.b, col.a), color(col.r, col.g, col.b, col.a), color(col.r, col.g, col.b, 0 * col.a), color(col.r, col.g, col.b, 0 * col.a));
        render.gradient(vector(v10.screen.x / 2, v10.screen.y / 2 - offset), vector(v10.screen.x / 2 + 1, v10.screen.y / 2 - offset - length), color(col.r, col.g, col.b, col.a), color(col.r, col.g, col.b, col.a), color(col.r, col.g, col.b, 0 * col.a), color(col.r, col.g, col.b, 0 * col.a));
    else
        v111.scope_overlay:override();
    end;
end;
damage_indication = l_system_0.register({
    [1] = v14.visuals.screen_indication.x_damage, 
    [2] = v14.visuals.screen_indication.y_damage
}, vector(20, 20), "damage_indication", function(v277)
    -- upvalues: v14 (ref), v111 (ref), v10 (ref), v212 (ref)
    if not v14.visuals.screen_indication:get() then
        return;
    elseif not v14.visuals.screen_indication.damage_indication:get() then
        return;
    else
        local v278 = get_active_binding_info("Min. Damage")[1];
        local v279 = v111.damage:get() == 0 and "AUTO" or tostring(v111.damage:get());
        v277.size.x = render.measure_text(1, "d", v279).x + 2;
        v277.size.y = render.measure_text(1, "d", v279).y + 2;
        if not globals.is_connected then
            return;
        else
            local v280 = entity.get_local_player();
            if not v280 then
                return;
            elseif not v280:is_alive() then
                return;
            else
                if v277.position.x >= v10.screen.x / 2 + 50 - v277.size.x then
                    v277.position.x = v10.screen.x / 2 + 50 - v277.size.x;
                end;
                if v277.position.x <= v10.screen.x / 2 - 45 then
                    v277.position.x = v10.screen.x / 2 - 45;
                end;
                if v277.position.y >= v10.screen.y / 2 + 35 then
                    v277.position.y = v10.screen.y / 2 + 35;
                end;
                if v277.position.y <= v10.screen.y / 2 - 50 then
                    v277.position.y = v10.screen.y / 2 - 50;
                end;
                if v14.visuals.screen_indication.show_always:get() then
                    v212.damage_data.full_alpha = lerp(v212.damage_data.full_alpha, 255, 18 * globals.frametime);
                elseif v278 or ui.get_alpha() > 0 then
                    v212.damage_data.full_alpha = lerp(v212.damage_data.full_alpha, 255, 18 * globals.frametime);
                else
                    v212.damage_data.full_alpha = lerp(v212.damage_data.full_alpha, 0, 18 * globals.frametime);
                end;
                if v277.is_dragging then
                    render.rect(vector(v10.screen.x / 2 - 50, v10.screen.y / 2 - 50), vector(v10.screen.x / 2 + 50, v10.screen.y / 2 + 50), color(255, 25), 5, true);
                end;
                v212.damage_data.text_width = lerp(v212.damage_data.text_width, v277.size.x, 1);
                render.text(1, vector(v277.position.x, v277.position.y), color(255, 255, 255, v212.damage_data.full_alpha), "d", v279);
                return;
            end;
        end;
    end;
end);
logs_window = function(v281, v282, v283, v284, v285, v286, v287)
    local v288 = render.measure_text(1, "ad", v286);
    local v289 = ui.get_icon(v281);
    local v290 = render.measure_text(1, "ad", v289);
    v290.x = v290.x + 10;
    if v287 then
        render.shadow(vector(v282.x - v288.x / 2 - v290.x - 7, v282.y - 5), vector(v282.x - v288.x / 2 - 2, v282.y + v283.y + 5), color(v284.r, v284.g, v284.b, v285), 20, 0, 4);
        render.shadow(vector(v282.x - v288.x / 2 + v290.x / 2 - 5, v282.y - 5), vector(v282.x + v288.x / 2 + (v290.x / 2 + 5), v282.y + v283.y + 5), color(v284.r, v284.g, v284.b, v285), 20, 0, 5);
    end;
    render.rect(vector(v282.x - v288.x / 2 - v290.x - 7, v282.y - 5), vector(v282.x - v288.x / 2 - 2, v282.y + v283.y + 5), color(0, 0, 0, math.floor(v285 / 1.5)), 5);
    render.rect_outline(vector(v282.x - v288.x / 2 - v290.x - 7, v282.y - 5), vector(v282.x - v288.x / 2 - 2, v282.y + v283.y + 5), color(20, 20, 20, math.floor(v285 / 1.5)), 1, 5);
    render.rect(vector(v282.x - v288.x / 2 + v290.x / 2 - 5, v282.y - 5), vector(v282.x + v288.x / 2 + (v290.x / 2 + 5), v282.y + v283.y + 5), color(0, 0, 0, math.floor(v285 / 1.5)), 5);
    render.rect_outline(vector(v282.x - v288.x / 2 + v290.x / 2 - 5, v282.y - 5), vector(v282.x + v288.x / 2 + (v290.x / 2 + 5), v282.y + v283.y + 5), color(20, 20, 20, math.floor(v285 / 1.5)), 1, 5);
    render.text(1, vector(v282.x - v288.x / 2 - v290.x, v282.y), color(255, 255, 255, v285), "ad", v289);
    render.text(1, vector(v282.x - v288.x / 2 + v290.x / 2, v282.y), color(255, 255, 255, v285), "ad", v286);
end;
render_logs = function()
    -- upvalues: v12 (ref), v14 (ref), v10 (ref)
    local v291 = 0;
    for v292, v293 in ipairs(v12) do
        if globals.curtime - v293.time < 3.5 and (#v12 <= 7 or v292 >= #v12 - 7) then
            v293.alpha = lerp(v293.alpha, 255, globals.frametime * 14);
        else
            v293.alpha = lerp(v293.alpha, 0, globals.frametime * 18);
        end;
        local l_text_0 = v293.text;
        local v295 = render.measure_text(1, "ad", l_text_0);
        if v293.alpha < 0.1 then
            table.remove(v12, v292);
        end;
        if v14.visuals.screen_indication.position:get(2) and v14.visuals.screen_indication.log_events:get() and v14.visuals.screen_indication:get() then
            if v14.visuals.screen_indication.background:get() then
                logs_window(v293.icon, vector(v10.screen.x / 2, v10.screen.y / 1.5 + v291), vector(v295.x, v295.y), v14.visuals.screen_indication.logging_color:get(), v293.alpha, v293.text, v14.visuals.screen_indication.glow:get());
            else
                render.text(1, vector(v10.screen.x / 2 - v295.x / 2, v10.screen.y / 1.5 + v291), color(255, 255, 255, v293.alpha), "ad", string.sub(v293.text, 1, 3 + #v293.text * (v293.alpha / 255)));
            end;
        end;
        v291 = v291 + (v14.visuals.screen_indication.background:get() and 28 or 17) * (v293.alpha / 255);
    end;
end;
gamesense_indicator_render = function(v296, v297, v298, v299, v300, v301)
    -- upvalues: v10 (ref), v110 (ref), v109 (ref)
    local v302 = v10.screen.x / 100 + 10;
    local v303 = v10.screen.y / 1.5;
    ts = render.measure_text(v110.gs, nil, v296);
    render.gradient(vector(v302 / 1.9, v303 + v297), vector(v302 / 1.9 + ts.x / 2 + 5, v303 + v297 + ts.y + 11), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50));
    render.gradient(vector(v302 / 1.9 + ts.x / 2 + 5, v303 + v297), vector(v302 / 1.9 + ts.x + 40, v303 + v297 + ts.y + 11), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0));
    render.text(v110.gs, vector(v302, v303 + 8 + v297), v298, nil, v296);
    if v301 == true then
        render.texture(v109, vector(v302, v303 + v297 + 2), vector(32, 30), v298, "f", 1);
    end;
    if v299 and v300 then
        render.circle_outline(vector(v302 + ts.x + 18, v303 + v297 + ts.y / 2 + 8), color(0, 0, 0, 255), 10, 1, 10, 5);
        render.circle_outline(vector(v302 + ts.x + 18, v303 + v297 + ts.y / 2 + 8), v299, 9, 1, v300, 3);
    end;
end;
local v304 = {
    filled_circle = 0
};
v17.hit = 0;
v17.miss = 0;
hit_miss_ratio = function(v305)
    -- upvalues: v14 (ref), v17 (ref)
    if v14.visuals.screen_indication.gamesense_selection:get("Hit/Miss ratio") then
        if v305.state == nil then
            v17.hit = v17.hit + 1;
        else
            v17.miss = v17.miss + 1;
        end;
    end;
end;
gs_indication = function()
    -- upvalues: v14 (ref), v17 (ref), l_bomb_0 (ref), v304 (ref), v111 (ref)
    if not v14.visuals.screen_indication:get() then
        return;
    elseif not v14.visuals.screen_indication.gamesense_indication:get() then
        return;
    elseif not globals.is_connected then
        if v17.hit ~= 0 or v17.miss ~= 0 then
            v17.hit = 0;
            v17.miss = 0;
        end;
        return;
    else
        local v306 = entity.get_local_player();
        if not v306 then
            return;
        else
            local v307 = entity.get_entities("CPlantedC4", true)[1];
            local _ = l_bomb_0.state;
            local v309 = l_bomb_0.state == false;
            local v310 = l_bomb_0.state == true and v307 ~= nil;
            local v311 = (not not v310 or v309) and l_bomb_0.site or "";
            local v312 = v310 and l_bomb_0.c4time or 0;
            local v313 = false;
            local v314;
            if v310 then
                if bomb_fatal then
                    v314 = 0;
                    goto label1 --[[  true, true  ]];
                elseif l_bomb_0.dmg == nil then
                    v314 = 0;
                    goto label1 --[[  true, true  ]];
                else
                    v314 = tonumber(string.match(l_bomb_0.dmg, "%d+"));
                    if v314 then
                        goto label1;
                    end;
                end;
            end;
            v314 = 0;
            ::label1::;
            local v315 = v310 and l_bomb_0.lethal or false;
            local l_plant_percentage_0 = l_bomb_0.plant_percentage;
            local v317 = get_active_binding_info("Min. Damage")[1];
            local v318 = get_active_binding_info("Hit Chance")[1];
            if v309 then
                v304.filled_circle = 3.125 * l_plant_percentage_0;
                if v304.filled_circle > 3.125 then
                    v304.filled_circle = 3.125;
                end;
            else
                v304.filled_circle = 0;
            end;
            local v319 = 40;
            local v320 = 0;
            for _, v322 in ipairs(entity.get_players(true)) do
                if v322 == nil then
                    dormant_triggered = false;
                end;
                if v322 ~= nil and v322:is_enemy() and v322:is_dormant() then
                    dormant_triggered = true;
                else
                    dormant_triggered = false;
                end;
            end;
            hit_percentage = v17.hit == 0 and v17.miss == 0 and 0 or v17.hit / (v17.miss + v17.hit) * 100;
            local v323 = {
                [1] = {
                    string.format("%d / %d (%d%%)", v17.hit, v17.miss, math.floor(hit_percentage)), 
                    v14.visuals.screen_indication.gamesense_selection:get("Hit/Miss ratio") and v306:is_alive(), 
                    color(200, 199, 197)
                }, 
                [2] = {
                    "PING", 
                    v14.visuals.screen_indication.gamesense_selection:get("Ping spike") and v306:is_alive() and v111.fake_latency:get_override() ~= nil and (not (v111.fake_latency:get() <= 0) or v111.fake_latency:get_override() > 0) and v306:is_alive(), 
                    color(163, 194, 43)
                }, 
                [3] = {
                    "OSAA", 
                    v14.visuals.screen_indication.gamesense_selection:get("On shot anti-aim") and v306:is_alive() and v111.hide_shot:get() and not v111.doubletap:get() and not v111.fake_duck:get(), 
                    color(200, 199, 197)
                }, 
                [4] = {
                    [1] = "DT", 
                    [2] = v14.visuals.screen_indication.gamesense_selection:get("Double tap") and v306:is_alive() and v111.doubletap:get() and not v111.fake_duck:get(), 
                    [3] = rage.exploit:get() == 1 and color(200, 199, 197) or color(255, 0, 50)
                }, 
                [5] = {
                    [1] = "DA", 
                    [2] = v14.visuals.screen_indication.gamesense_selection:get("Dormant aimbot") and v306:is_alive() and v111.dormant_aimbot:get(), 
                    [3] = dormant_triggered == true and color(200, 199, 197) or color(255, 0, 50)
                }, 
                [6] = {
                    "DUCK", 
                    v14.visuals.screen_indication.gamesense_selection:get("Duck peek assist") and v306:is_alive() and v111.fake_duck:get(), 
                    color(200, 199, 197)
                }, 
                [7] = {
                    "SAFE", 
                    v14.visuals.screen_indication.gamesense_selection:get("Force safe point") and v306:is_alive() and (v111.safe_point:get() == "Force" or v111.safe_point:get_override() == "Force"), 
                    color(200, 199, 197)
                }, 
                [8] = {
                    "BODY", 
                    v14.visuals.screen_indication.gamesense_selection:get("Force body aim") and v306:is_alive() and (v111.body_aim:get() == "Force" or v111.body_aim:get_override() == "Force"), 
                    color(200, 199, 197)
                }, 
                [9] = {
                    "HC", 
                    v14.visuals.screen_indication.gamesense_selection:get("Hitchance") and v306:is_alive() and (v111.hitchance:get_override() ~= nil or v318 == true), 
                    color(200, 199, 197)
                }, 
                [10] = {
                    "MD", 
                    v14.visuals.screen_indication.gamesense_selection:get("Minimum damage") and v306:is_alive() and v317 == true, 
                    color(200, 199, 197)
                }, 
                [11] = {
                    "FS", 
                    v14.visuals.screen_indication.gamesense_selection:get("Freestanding") and v306:is_alive() and (v111.yaw_base_freestanding:get() or v111.yaw_base_freestanding:get_override()), 
                    color(200, 199, 197)
                }, 
                [12] = {
                    [1] = nil, 
                    [2] = nil, 
                    [3] = nil, 
                    [4] = nil, 
                    [5] = nil, 
                    [6] = true, 
                    [1] = "        " .. v311 .. " - " .. string.format("%.1f", v312) .. "s", 
                    [2] = v14.visuals.screen_indication.gamesense_selection:get("Bomb info") and v312 > 0 and not v313, 
                    [3] = color(200, 199, 197)
                }, 
                [13] = {
                    "FATAL", 
                    v14.visuals.screen_indication.gamesense_selection:get("Bomb info") and v315, 
                    color(255, 0, 50, 255)
                }, 
                [14] = {
                    "-" .. v314 .. " HP", 
                    v14.visuals.screen_indication.gamesense_selection:get("Bomb info") and not v315 and v314 ~= nil and v314 > 0.5, 
                    color(210, 216, 112, 255)
                }, 
                [15] = {
                    [1] = nil, 
                    [2] = nil, 
                    [3] = nil, 
                    [4] = nil, 
                    [5] = nil, 
                    [6] = true, 
                    [1] = "        " .. v311, 
                    [2] = v14.visuals.screen_indication.gamesense_selection:get("Bomb info") and v309, 
                    [3] = color(210, 216, 112, 255), 
                    [4] = color(255, 255), 
                    [5] = v304.filled_circle / 3.2
                }
            };
            for _, v325 in pairs(v323) do
                if v325[2] then
                    gamesense_indicator_render(v325[1], v320, v325[3], v325[4], v325[5], v325[6]);
                    v320 = v320 - v319;
                end;
            end;
            return;
        end;
    end;
end;
l_extended_0.cs_win_panel_match:set(function()
    -- upvalues: v17 (ref)
    v17.hit = 0;
    v17.miss = 0;
end);
manual_arrows = l_system_0.register({
    [1] = v14.visuals.screen_indication.x_arrows, 
    [2] = v14.visuals.screen_indication.y_arrows
}, vector(50, 10), "manual_arrows", function(v326)
    -- upvalues: v14 (ref), v10 (ref), v212 (ref), v27 (ref), v110 (ref)
    if not v14.visuals.screen_indication:get() then
        return;
    elseif not v14.visuals.screen_indication.manual_arrows:get() then
        return;
    elseif not globals.is_connected then
        return;
    elseif not entity.get_local_player() then
        return;
    else
        v326.position.x = v10.screen.x / 2 - 25;
        v212.manual_arrows_data.alpha = lerp(v212.manual_arrows_data.alpha, (not (ui.get_alpha() <= 0 and v14.anti_aim.other.manual_yaw:get() ~= "Left") or v14.anti_aim.other.manual_yaw:get() == "Right") and 255 or 0, globals.frametime * 14);
        is_left_active = v14.anti_aim.other.manual_yaw:get() == "Left" and v14.visuals.screen_indication.manual_arrows_color:get() or color(255, 255, 255, v212.manual_arrows_data.alpha);
        is_right_active = v14.anti_aim.other.manual_yaw:get() == "Right" and v14.visuals.screen_indication.manual_arrows_color:get() or color(255, 255, 255, v212.manual_arrows_data.alpha);
        is_left_active.a = v212.manual_arrows_data.alpha;
        is_right_active.a = v212.manual_arrows_data.alpha;
        if v326.position.y >= v10.screen.y / 2 + 15 then
            v326.position.y = v10.screen.y / 2 + 15;
        end;
        if v326.position.y <= v10.screen.y / 2 - 25 then
            v326.position.y = v10.screen.y / 2 - 25;
        end;
        if v326.is_dragging then
            render.rect(vector(v326.position.x - 10, v10.screen.y / 2 - 30), vector(v326.position.x + 57, v10.screen.y / 2 + 30), color(255, 25), 5, true);
        end;
        if v27(v326.position.x - 5, v326.position.x + 50, v326.position.y - 6, v326.position.y + 10) then
            render.text(1, vector(v326.position.x - 8, v326.position.y - 25), color(), "", "m2 to center");
            if common.is_button_down(2) then
                v326.position.y = v10.screen.y / 2 - 5;
            end;
        end;
        render.text(v110.gs, vector(v326.position.x, v326.position.y + 5), is_left_active, "c", "\226\157\176");
        render.text(v110.gs, vector(v326.position.x + 47, v326.position.y + 5), is_right_active, "c", "\226\157\177");
        return;
    end;
end);
v212.aspect_ratio_data.value = v14.visuals.aspect_ratio.value_int:get() / 100;
aspect_ratio = function()
    -- upvalues: v14 (ref), v212 (ref)
    if not v14.visuals.aspect_ratio:get() or ("%.2f"):format(v212.aspect_ratio_data.value) == ("%.2f"):format(v14.visuals.aspect_ratio.value_int:get() / 100) then
        return;
    else
        v212.aspect_ratio_data.value = lerp(v212.aspect_ratio_data.value, v14.visuals.aspect_ratio.value_int:get() / 100, 0.05);
        cvar.r_aspectratio:float(v212.aspect_ratio_data.value);
        return;
    end;
end;
aspect_ratio_setup = function()
    -- upvalues: v14 (ref), v212 (ref)
    if v14.visuals.aspect_ratio:get() then
        cvar.r_aspectratio:float(v212.aspect_ratio_data.value);
        return;
    else
        cvar.r_aspectratio:float(0);
        v212.aspect_ratio_data.value = v14.visuals.aspect_ratio.value_int:get() / 100;
        return;
    end;
end;
v14.visuals.aspect_ratio:set_callback(aspect_ratio_setup);
aspect_ratio_setup();
r8_helper = esp.enemy:new_text("R8 Helper", "\a2FD500FFDMG+", function(v327)
    local v328 = entity.get_local_player();
    if not v328 then
        return;
    elseif not v328:is_alive() then
        return;
    else
        local v329 = v328:get_origin():dist((v327:get_origin()));
        if get_weapon_id(v328) ~= 64 then
            return;
        elseif v327.m_ArmorValue > 0 then
            return;
        elseif v329 < 585 then
            return "\a2FD500FFDMG+";
        else
            return;
        end;
    end;
end);
get_highest_damage = function(v330, v331)
    local v332 = {
        [1] = 1, 
        [2] = 2, 
        [3] = 3, 
        [4] = 4, 
        [5] = 5, 
        [6] = 6, 
        [7] = 7, 
        [8] = 8, 
        [9] = 9, 
        [10] = 10, 
        [11] = 11, 
        [12] = 12, 
        [13] = 13, 
        [14] = 14
    };
    local v333 = 0;
    local v334 = false;
    local v335 = extrapolate_position(v330, v330:get_eye_position(), 12);
    for _, v337 in pairs(v332) do
        local v338 = v331:get_hitbox_position(v337);
        local v339, v340 = utils.trace_bullet(v330, v335, v338);
        if v333 < v339 then
            v333 = v339;
        end;
        if v333 > 0 and v340.entity and v340.entity ~= v330 and v340.did_hit then
            v334 = true;
        else
            v334 = false;
        end;
    end;
    return v333, v334;
end;
predicted_damage = esp.enemy:new_text("Pred. Damage", "DAMAGE", function(v341)
    local v342 = entity.get_local_player();
    if not v342 then
        return;
    elseif not v342:is_alive() then
        return;
    else
        local v343, _ = get_highest_damage(v342, v341);
        if v343 > 0 then
            return tostring(v343);
        else
            return;
        end;
    end;
end);
v14.visuals.additional_esp:set_callback(function(_)
    -- upvalues: v14 (ref)
    if v14.visuals.additional_esp:get() then
        r8_helper:set(true);
        predicted_damage:set(true);
    end;
    if not v14.visuals.additional_esp:get() then
        r8_helper:set(false);
        predicted_damage:set(false);
    end;
end);
clan_anim = function(v346, v347)
    if not globals.is_connected then
        return;
    else
        local v348 = "               " .. v346 .. "                      ";
        local _ = globals.tickinterval;
        local v350 = (globals.tickcount + math.floor(utils.net_channel().avg_latency[0] + 0.22 / globals.tickinterval + 0.5)) / math.floor(0.3 / globals.tickinterval + 0.5);
        v350 = v347[math.floor(v350 % #v347) + 1] + 1;
        return string.sub(v348, v350, v350 + 15);
    end;
end;
clantag_spammer = function()
    -- upvalues: v14 (ref)
    if not globals.is_connected then
        return;
    else
        local v351 = entity.get_local_player();
        if v14.misc.clantag:get() then
            if v351 ~= nil and globals.is_connected and globals.choked_commands then
                clan_tag = clan_anim("alcatraz", {
                    [1] = 0, 
                    [2] = 1, 
                    [3] = 2, 
                    [4] = 3, 
                    [5] = 4, 
                    [6] = 5, 
                    [7] = 6, 
                    [8] = 7, 
                    [9] = 8, 
                    [10] = 7, 
                    [11] = 6, 
                    [12] = 5, 
                    [13] = 4, 
                    [14] = 3, 
                    [15] = 2, 
                    [16] = 1, 
                    [17] = 0
                });
                if entity.get_game_rules().m_gamePhase == 5 or entity.get_game_rules().m_gamePhase == 4 then
                    clan_tag = clan_anim("alcatraz", {
                        [1] = 9
                    });
                    common.set_clan_tag(clan_tag);
                elseif clan_tag ~= clan_tag_prev then
                    common.set_clan_tag(clan_tag);
                end;
                clan_tag_prev = clan_tag;
            end;
            enabled_prev = false;
        elseif not v14.misc.clantag:get() and enabled_prev == false then
            common.set_clan_tag("");
            enabled_prev = true;
        end;
        return;
    end;
end;
local v352 = 14451;
local v353 = "https://raw.githubusercontent.com/solieperones/useles-logotips/refs/heads/main/fotor-ai-2024042417543.png";
v14.misc.shared_features:set_callback(function(v354)
    -- upvalues: v353 (ref)
    local v355 = entity.get_local_player();
    if v355 == nil then
        return;
    else
        if v354:get() then
            v355:set_icon(v353);
        else
            v355:set_icon();
        end;
        entity.get_players(false, true, function(v356)
            -- upvalues: v354 (ref)
            if not v354:get() then
                v356:set_icon();
            end;
        end);
        return;
    end;
end);
l_extended_0.voice_message(function(v357)
    -- upvalues: v352 (ref), v14 (ref), v353 (ref)
    if v357.buffer:read_bits(16) == v352 then
        if v14.misc.shared_features:get() then
            v357.entity:set_icon(v353);
        else
            v357.entity:set_icon();
        end;
    end;
end);
l_extended_0.voice_message:call(function(v358)
    -- upvalues: v14 (ref), v352 (ref)
    if v14.misc.shared_features:get() then
        v358:write_bits(v352, 16);
    end;
end);
local v359 = {
    kill = {
        [1] = "1", 
        [2] = "???"
    }, 
    dead = {
        [1] = "\208\189\208\181 \208\178\209\139\209\133\208\190\208\180\208\184", 
        [2] = "\208\178 \209\129\208\187\208\181\208\180\209\131\209\142\209\137\208\181\208\188 \209\128\208\176\209\131\208\189\208\180\208\181 \208\178\209\129\209\130\209\128\208\181\209\130\208\184\208\188\209\129\209\143"
    }, 
    revenge = {
        [1] = "1", 
        [2] = "1"
    }
};
v17.kill = {
    last_phrase = 0, 
    new_phrase = 0
};
v17.dead = {
    last_phrase = 0, 
    new_phrase = 0
};
v17.revenge = {
    last_phrase = 0, 
    new_phrase = 0
};
trash_talk = function(v360)
    -- upvalues: v14 (ref), v17 (ref), v359 (ref)
    local v361 = entity.get(v360.attacker, true);
    local v362 = entity.get(v360.userid, true);
    if v361 == nil or v362 == nil then
        return;
    else
        if v14.misc.trashtalk:get("Kill") and v361 == entity.get_local_player() and v362:is_enemy() then
            v17.kill.new_phrase = math.random(1, #v359.kill);
            while v17.kill.new_phrase == v17.kill.last_phrase do
                v17.kill.new_phrase = math.random(1, #v359.kill);
            end;
            utils.console_exec("say " .. v359.kill[v17.kill.new_phrase]);
            v17.kill.last_phrase = v17.kill.new_phrase;
        end;
        if v14.misc.trashtalk:get("Dead") and v361:is_enemy() and v362 == entity.get_local_player() then
            v17.dead.new_phrase = math.random(1, #v359.dead);
            while v17.dead.new_phrase == v17.dead.last_phrase do
                v17.dead.new_phrase = math.random(1, #v359.dead);
            end;
            utils.console_exec("say " .. v359.dead[v17.dead.new_phrase]);
            v17.dead.last_phrase = v17.dead.new_phrase;
        end;
        if v14.misc.trashtalk:get("Revenge") then
            if v361:is_enemy() and v362 == entity.get_local_player() then
                v17.revenge.attacker = v361;
            end;
            if v362 == v17.revenge.attacker then
                v17.revenge.new_phrase = math.random(1, #v359.revenge);
                while v17.revenge.new_phrase == v17.revenge.last_phrase do
                    v17.revenge.new_phrase = math.random(1, #v359.revenge);
                end;
                utils.console_exec("say " .. v359.revenge[v17.revenge.new_phrase]);
                v17.revenge.attacker = nil;
                v17.revenge.last_phrase = v17.revenge.new_phrase;
            end;
        end;
        return;
    end;
end;
latency_unlock = function()
    -- upvalues: v14 (ref), v111 (ref)
    local l_sv_maxunlag_0 = cvar.sv_maxunlag;
    local v364 = v14.misc.increase_fake_latency.val:get();
    if not v14.misc.increase_fake_latency:get() then
        if l_sv_maxunlag_0:float() ~= 0.2 then
            l_sv_maxunlag_0:float(0.2);
        end;
        v111.fake_latency:disabled(false);
        return;
    else
        v111.fake_latency:disabled(true);
        v111.fake_latency:override(v364);
        if v364 > 100 then
            if l_sv_maxunlag_0:float() ~= v364 / 500 then
                l_sv_maxunlag_0:float(v364 / 500);
            end;
        elseif l_sv_maxunlag_0:float() ~= 0.2 then
            l_sv_maxunlag_0:float(0.2);
        end;
        return;
    end;
end;
local v365 = vector() or vector(0, 0, 0);
local v366 = vector() or vector(0, 0, 0);
intersect_ray_with_circle = function(v367, v368, v369)
    if math.abs(v367.x) > math.abs(v367.y) then
        local v370 = v367.y / v367.x;
        local v371 = 1 + v370 * v370;
        local v372 = -2 * v368.x - 2 * v370 * v368.y;
        local v373 = v368:length2dsqr() - v369 * v369;
        local v374 = v372 * v372 - 4 * v371 * v373;
        if v374 < 0 then
            return v368 + (v367 * v368:dot(v367) - v368):normalized() * v369;
        elseif v374 < 0.001 then
            local v375 = -v372 / (2 * v371);
            local v376 = v370 * v375;
            return vector(v375, v376);
        else
            local v377 = math.sqrt(v374);
            local v378 = (-v372 + v377) / (2 * v371);
            local v379 = v370 * v378;
            local v380 = vector(v378, v379);
            v378 = (-v372 - v377) / (2 * v371);
            v379 = v370 * v378;
            local v381 = vector(v378, v379);
            if v367:dot(v380) > v367:dot(v381) then
                return v380;
            else
                return v381;
            end;
        end;
    else
        local v382 = v367.x / v367.y;
        local v383 = 1 + v382 * v382;
        local v384 = -2 * v368.y - 2 * v382 * v368.x;
        local v385 = v368:length2dsqr() - v369 * v369;
        local v386 = v384 * v384 - 4 * v383 * v385;
        if v386 < 0 then
            return v368 + (v367 * v368:dot(v367) - v368):normalized() * v369;
        elseif v386 < 0.001 then
            local v387 = -v384 / (2 * v383);
            local v388 = v382 * v387;
            return vector(v388, v387);
        else
            local v389 = math.sqrt(v386);
            local v390 = (-v384 + v389) / (2 * v383);
            local v391 = v382 * v390;
            local v392 = vector(v391, v390);
            v390 = (-v384 - v389) / (2 * v383);
            v391 = v382 * v390;
            local v393 = vector(v391, v390);
            if v367:dot(v392) > v367:dot(v393) then
                return v392;
            else
                return v393;
            end;
        end;
    end;
end;
calculate_throw_yaw = function(v394, v395, v396, v397)
    local v398 = v394:clone();
    v398.z = 0;
    v398:normalize();
    local v399 = v398:dot(v394) / v394:length();
    return (intersect_ray_with_circle(v398, v395 * 1.25, math.clamp(v396 * 0.9, 15, 750) * (math.clamp(v397, 0, 1) * 0.7 + 0.3) * v399) - v395 * 1.25):angles().y;
end;
calculate_throw_pitch = function(v400, v401, v402, v403, v404)
    local v405 = math.clamp(v403 * 0.9, 15, 750) * (math.clamp(v404, 0, 1) * 0.7 + 0.3);
    local v406 = v402 * 1.25 + v400 * v405;
    local _ = vector(v402.x, v402.y, v401) * 1.25 + v400 * v405;
    local v408 = v406:angles();
    local v409 = v400:angles().x - v408.x;
    return v409 * (math.cos(math.rad(v409)) + 1) * 0.5;
end;
compensate_prediction = function(v410)
    -- upvalues: v14 (ref)
    if not v14.misc.better_grenades:get("Super toss") then
        return;
    elseif not v14.misc.better_grenades.simulate_prediction:get() then
        return;
    else
        local v411 = entity.get_local_player();
        if v411 == nil then
            return;
        else
            local v412 = v411:get_player_weapon();
            if v412 == nil then
                return;
            else
                local v413 = v412:get_weapon_info();
                if v413 == nil then
                    return;
                else
                    local l_velocity_0 = v410.velocity;
                    local v415 = v410.angles:clone();
                    local v416 = math.clamp(v412.m_flThrowStrength, 0, 1);
                    v415.x = v415.x + calculate_throw_pitch(vector():angles(v415), math.clamp(-l_velocity_0.z, -120, 120), l_velocity_0, v413.throw_velocity, v416);
                    local v417 = vector():angles(v415);
                    local v418 = v417 * (math.clamp(v413.throw_velocity * 0.9, 15, 750) * (v416 * 0.7 + 0.3));
                    if (l_velocity_0 * 1.25 + v418):dot(v417) > 0 then
                        v415.y = calculate_throw_yaw(v417, l_velocity_0, v413.throw_velocity, v416);
                    end;
                    v410.angles = v415;
                    return;
                end;
            end;
        end;
    end;
end;
compensate_throwable = function(v419, v420)
    -- upvalues: v365 (ref), v366 (ref)
    if render.camera_angles() ~= v419.view_angles:clone() then
        return;
    else
        local v421 = v420:get_player_weapon();
        if v421 == nil then
            return;
        else
            local v422 = v421:get_weapon_info();
            if v422 == nil or v422.weapon_type ~= 9 then
                return;
            elseif v421.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
                return;
            else
                local v423 = v419.view_angles:clone();
                local v424 = vector():angles(v423);
                local v425 = (v365 + v366) * 0.5;
                local v426 = v424 * (math.clamp(v422.throw_velocity * 0.9, 15, 750) * (v421.m_flThrowStrength * 0.7 + 0.3));
                local v427 = v365 * 1.25 + v426;
                local v428 = (v426 + v425 * 1.25):normalized();
                if v427:dot(v424) > 0 then
                    v428 = v424;
                end;
                v419.view_angles.x = v419.view_angles.x + calculate_throw_pitch(vector():angles(v419.view_angles), 0, v425, v422.throw_velocity, v421.m_flThrowStrength);
                v419.view_angles.y = calculate_throw_yaw(v428, v366, v422.throw_velocity, v421.m_flThrowStrength);
                return;
            end;
        end;
    end;
end;
setup_super_toss = function(v429)
    -- upvalues: v14 (ref), v365 (ref), v366 (ref)
    if not v14.misc.better_grenades:get("Super toss") then
        return;
    else
        local v430 = entity.get_local_player();
        if not v430 then
            return;
        else
            local v431 = v430:simulate_movement();
            if not v431 then
                return;
            else
                v365 = v431.velocity;
                v366 = v365;
                compensate_throwable(v429, v430);
                return;
            end;
        end;
    end;
end;
strafe_fix = function(v432)
    -- upvalues: v14 (ref)
    if not v14.misc.better_grenades:get("Super toss") then
        return;
    else
        local v433 = entity.get_local_player();
        if v433 == nil then
            return;
        else
            local v434 = v433:get_player_weapon();
            if v434 == nil then
                return;
            else
                local v435 = v434:get_weapon_info();
                if v435 == nil or v435.weapon_type ~= 9 then
                    return;
                elseif v434.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
                    return;
                else
                    local l_m_vecVelocity_1 = v433.m_vecVelocity;
                    local v437 = math.rad(math.atan2(l_m_vecVelocity_1.y, l_m_vecVelocity_1.x));
                    if v437 < 0 then
                        v437 = v437 + 360;
                    end;
                    v437 = v437 - math.floor(v437 / 360 + 0.5) * 360;
                    local _ = math.normalize_yaw(v432.view_angles.y - v437);
                    return;
                end;
            end;
        end;
    end;
end;
grenade_release = function(v439)
    -- upvalues: v14 (ref)
    if not v14.misc.better_grenades:get("Grenade release") then
        return;
    else
        local v440 = entity.get_local_player();
        if v440 == nil then
            return;
        else
            local v441 = v440:get_player_weapon();
            if v441 == nil then
                return;
            elseif v439.type ~= "Frag" and v439.type ~= "Molly" then
                return;
            else
                if v441.m_bPinPulled and v439.damage >= v14.misc.better_grenades.damage:get() then
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
math_vec = function(v442, v443)
    local v444 = nil;
    local v445 = nil;
    local v446 = nil;
    local v447 = nil;
    v444 = math.sin(math.rad(v442));
    v445 = math.sin(math.rad(v443));
    v446 = math.cos(math.rad(v442));
    v447 = math.cos(math.rad(v443));
    return vector(v446 * v447, v446 * v445, -v444);
end;
avoid_collisions = function(v448)
    -- upvalues: v14 (ref)
    if not v14.other.avoid_collisions:get() then
        return;
    else
        local v449 = entity.get_local_player();
        if not v449 then
            return;
        else
            local l_y_3 = render.camera_angles().y;
            local l_m_vecOrigin_0 = v449.m_vecOrigin;
            local v452 = v449.m_vecVelocity:length();
            local l_huge_0 = math.huge;
            local l_huge_1 = math.huge;
            for v455 = 1, 180 do
                local l_x_4 = math_vec(0, l_y_3 + v455 - 90).x;
                local l_y_4 = math_vec(0, l_y_3 + v455 - 90).y;
                local _ = math_vec(0, l_y_3).z;
                local v459 = l_m_vecOrigin_0.x + l_x_4 * 70;
                local v460 = l_m_vecOrigin_0.y + l_y_4 * 70;
                local v461 = l_m_vecOrigin_0.z + 60;
                local v462 = utils.trace_line(l_m_vecOrigin_0, vector(v459, v460, v461), nil, nil, 1);
                if l_m_vecOrigin_0:dist(v462.end_pos) < l_huge_0 then
                    l_huge_0 = l_m_vecOrigin_0:dist(v462.end_pos);
                    l_huge_1 = v455;
                end;
            end;
            if l_huge_0 < 25 and v448.in_jump and not v448.in_moveright and not v448.in_moveleft and not v448.in_back then
                forward_velo = math.abs(v452 * math.cos(math.rad(l_huge_1)));
                if math.abs(l_huge_1 - 90) < 40 then
                    side_velo = v452 * math.sin(math.rad(l_huge_1)) * (25 - l_huge_0) / 15;
                else
                    side_velo = v452 * math.sin(math.rad(l_huge_1));
                end;
                v448.forwardmove = forward_velo;
                if l_huge_1 >= 90 then
                    v448.sidemove = side_velo;
                else
                    v448.sidemove = side_velo * -1;
                end;
            end;
            return;
        end;
    end;
end;
accelerated_ladder = function(v463)
    -- upvalues: v14 (ref)
    if not v14.other.fast_ladder:get() then
        return;
    else
        local v464 = entity.get_local_player();
        if not v464 then
            return;
        else
            if v464.m_MoveType == 9 then
                v463.view_angles.y = math.floor(v463.view_angles.y + 0.5);
                if v463.forwardmove > 0 then
                    if v463.view_angles.x < 45 then
                        v463.view_angles.x = 89;
                        v463.in_moveright = 1;
                        v463.in_moveleft = 0;
                        v463.in_forward = 0;
                        v463.in_back = 1;
                        if v463.sidemove == 0 then
                            v463.view_angles.y = v463.view_angles.y + 90;
                        end;
                        if v463.sidemove < 0 then
                            v463.view_angles.y = v463.view_angles.y + 180;
                        end;
                        if v463.sidemove > 0 then
                            v463.view_angles.y = v463.view_angles.y + 90;
                        end;
                    end;
                elseif v463.forwardmove < 0 then
                    v463.view_angles.x = 89;
                    v463.in_moveleft = 1;
                    v463.in_moveright = 0;
                    v463.in_forward = 1;
                    v463.in_back = 0;
                    if v463.sidemove == 0 then
                        v463.view_angles.y = v463.view_angles.y + 90;
                    end;
                    if v463.sidemove > 0 then
                        v463.view_angles.y = v463.view_angles.y + 180;
                    end;
                    if v463.sidemove < 0 then
                        v463.view_angles.y = v463.view_angles.y + 90;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
no_fall_damage = function(v465)
    -- upvalues: v14 (ref)
    if not v14.other.no_fall:get() then
        return;
    else
        local v466 = entity.get_local_player();
        local v467 = bit.band(v466.m_fFlags, 1) == 1 and v465.in_jump == false;
        local l_m_vecVelocity_2 = v466.m_vecVelocity;
        local l_m_vecOrigin_1 = v466.m_vecOrigin;
        local v470 = utils.trace_line(l_m_vecOrigin_1, vector(l_m_vecOrigin_1.x, l_m_vecOrigin_1.y, l_m_vecOrigin_1.z - 500), nil, nil, 1);
        if l_m_vecOrigin_1.z - v470.end_pos.z <= 70 and l_m_vecOrigin_1.z - v470.end_pos.z >= 12 and not v467 and l_m_vecVelocity_2.z < -450 then
            v465.in_duck = true;
        end;
        return;
    end;
end;
local v471 = {
    start_curtime = 0, 
    pitch_modifier = 0, 
    should_legit_aa_override = false, 
    defensive_switch = false, 
    delay_time = 0, 
    delayed_switch = false, 
    yaw_modifier = -180, 
    manual_yaw = {
        Right = 90, 
        Backward = 0, 
        Left = -90, 
        Forward = 180
    }
};
is_safe_head = function()
    -- upvalues: v14 (ref)
    if not v14.anti_aim.other.selection:get("Safe head") then
        return false;
    else
        local v472 = entity.get_local_player();
        if v472 == nil then
            return false;
        else
            local v473 = get_state();
            local v474 = v472:get_player_weapon();
            if v474 == nil then
                return false;
            elseif v474:get_weapon_index() == nil then
                return false;
            else
                local v475 = v474:get_weapon_info();
                if v475 == nil then
                    return false;
                elseif not v14.anti_aim.other.safe_head_state:get(v473 - 1) then
                    return false;
                elseif (not v14.anti_aim.other.safe_head_state.weapon:get("Knife") or v475.weapon_name ~= "weapon_knife") and (not v14.anti_aim.other.safe_head_state.weapon:get("Zeus") or v475.weapon_name ~= "weapon_taser") and (not v14.anti_aim.other.safe_head_state.weapon:get("Grenade") or v475.weapon_type ~= 9) and (not v14.anti_aim.other.safe_head_state.weapon:get("Bomb") or v475.weapon_name ~= "weapon_c4") then
                    return false;
                else
                    return true;
                end;
            end;
        end;
    end;
end;
is_warmup = function()
    -- upvalues: v14 (ref)
    if not v14.anti_aim.other.selection:get("During Warmup") then
        return false;
    elseif entity.get_local_player() == nil then
        return false;
    elseif not entity.get_game_rules().m_bWarmupPeriod then
        return false;
    else
        return true;
    end;
end;
is_all_enemies_die = function()
    -- upvalues: v14 (ref)
    if not v14.anti_aim.other.selection:get("All Enemies Dead") then
        return false;
    elseif entity.get_local_player() == nil then
        return false;
    else
        local v476 = entity.get_players(true);
        if #v476 == 0 then
            return true;
        else
            for _, v478 in ipairs(v476) do
                if v478:is_alive() then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v17.warmup_yaw = 0;
l_aim_0 = function(_)
    -- upvalues: v14 (ref), v471 (ref), v111 (ref), v17 (ref)
    if not v14.anti_aim.enable:get() then
        return;
    else
        local v480 = get_state_builder();
        local v481 = get_state();
        if globals.choked_commands == 0 and globals.tickcount > v471.delay_time then
            v471.delayed_switch = not v471.delayed_switch;
            v471.delay_time = globals.tickcount + v14.anti_aim.builder.default[v480].body_yaw.delay:get() + math.random(-v14.anti_aim.builder.default[v480].body_yaw.fluctuate:get(), v14.anti_aim.builder.default[v480].body_yaw.fluctuate:get());
        end;
        local v482 = v14.anti_aim.builder.default[v480].yaw.randomize:get();
        v111.base:override(v14.anti_aim.yaw_base:get());
        if v14.anti_aim.builder.default[v480].yaw:get() == "Static" then
            v111.yaw:override(v14.anti_aim.builder.default[v480].yaw.static:get());
        else
            v111.yaw:override(rage.antiaim:inverter() == true and v14.anti_aim.builder.default[v480].yaw.left:get() + math.random(-v482, v482) or v14.anti_aim.builder.default[v480].yaw.right:get() + math.random(-v482, v482));
        end;
        v111.yaw_modifier:override(v14.anti_aim.builder.default[v480].yaw_modifier:get());
        v111.yaw_modifier_offset:override(v14.anti_aim.builder.default[v480].yaw_modifier.offset:get());
        if v14.anti_aim.builder.default[v480].body_yaw:get() == "Disabled" then
            v111.body_yaw:override(false);
            v111.left_des:override(0);
            v111.right_des:override(0);
        else
            v111.body_yaw:override(true);
            v111.left_des:override(v14.anti_aim.builder.default[v480].body_yaw.left_limit:get());
            v111.right_des:override(v14.anti_aim.builder.default[v480].body_yaw.right_limit:get());
            if v14.anti_aim.builder.default[v480].body_yaw:get() == "Jitter" then
                if v14.anti_aim.builder.default[v480].body_yaw.delay:get() ~= 1 then
                    v111.options:override("");
                    v111.inverter:override(v471.delayed_switch and true or false);
                else
                    v111.options:override("Jitter");
                    v111.inverter:override();
                end;
            else
                v111.options:override("");
                v111.inverter:override();
            end;
        end;
        v111.lag_option:override(v14.anti_aim.builder.default[v480].force_lc:get() and "Always on" or "On Peek");
        local l_onshot_lag_option_0 = v111.onshot_lag_option;
        local l_l_onshot_lag_option_0_0 = l_onshot_lag_option_0;
        l_onshot_lag_option_0 = l_onshot_lag_option_0.override;
        local v485;
        if v14.anti_aim.builder.default[v480].force_lc:get() then
            v485 = v14.anti_aim.builder.default[v480].force_lc.onshot:get() and "Break LC" or "Favor Fire Rate";
        else
            v485 = nil;
        end;
        l_onshot_lag_option_0(l_l_onshot_lag_option_0_0, v485);
        if v14.anti_aim.other.defensive_flick:get() and v14.anti_aim.other.defensive_flick.state:get(v481 - 1) and rage.exploit:get() > 0 then
            v111.yaw:override(0);
            v111.yaw_modifier:override("Disabled");
            v111.yaw_modifier_offset:override(0);
            v111.body_yaw:override(true);
            v111.left_des:override(60);
            v111.right_des:override(60);
            if v14.anti_aim.other.defensive_flick.options:get("Jitter") then
                v111.options:override("Jitter");
                v111.inverter:override();
                v111.fs_des:override("Off");
            else
                v111.options:override("");
                v111.inverter:override();
                v111.fs_des:override("Peek fake");
            end;
        end;
        if is_safe_head() then
            v111.yaw:override(0);
            v111.yaw_modifier:override("Disabled");
            v111.body_yaw:override(true);
            v111.left_des:override(0);
            v111.right_des:override(0);
            v111.options:override("");
            if not v14.anti_aim.other.defensive_flick:get() or not v14.anti_aim.other.defensive_flick.state:get(v481 - 1) then
                v111.inverter:override();
            end;
        end;
        if is_all_enemies_die() or is_warmup() then
            v17.warmup_yaw = math.normalize_yaw(globals.curtime * 900);
            v111.pitch:override("Disabled");
            v111.yaw:override(v17.warmup_yaw);
            v111.yaw_modifier:override("Disabled");
            v111.yaw_modifier_offset:override(0);
            v111.body_yaw:override(true);
            v111.left_des:override(60);
            v111.right_des:override(60);
            v111.options:override("");
            v111.fs_des:override("Off");
            v111.inverter:override();
        else
            v111.pitch:override();
        end;
        if v14.anti_aim.other.manual_yaw:get() ~= "Disabled" then
            v111.yaw:override(v471.manual_yaw[v14.anti_aim.other.manual_yaw:get()]);
            v111.base:override("Local View");
            if v14.anti_aim.other.manual_yaw.static:get() then
                v111.yaw_modifier:override("Disabled");
                v111.body_yaw:override(true);
                v111.left_des:override(60);
                v111.right_des:override(60);
                v111.options:override("");
                v111.inverter:override();
            end;
        end;
        v111.avoid_backstab:override(v14.anti_aim.other.selection:get("Avoid Backstap") and true or nil);
        if v14.anti_aim.other.freestanding_anti_aim.disabled_states:get(v481 - 1) or v14.anti_aim.other.manual_yaw:get() ~= "Disabled" and v14.anti_aim.other.manual_yaw.override_freestanding:get() then
            v111.yaw_base_freestanding:override(false);
        else
            v111.yaw_base_freestanding:override(v14.anti_aim.other.freestanding_anti_aim:get());
        end;
        v111.freestanding_yaw_modifier:override(v14.anti_aim.other.freestanding_anti_aim.yaw_modifiers:get());
        v111.freestanding_body:override(v14.anti_aim.other.freestanding_anti_aim.body:get());
        return;
    end;
end;
defensive_anti_aim = function(v486)
    -- upvalues: v14 (ref), v471 (ref), v111 (ref)
    local v487 = get_state_builder();
    local v488 = get_state();
    if v14.anti_aim.enable:get() then
        if v14.anti_aim.other.selection:get("Defensive Anti-Aim") then
            v471.pitch_modifier = v471.pitch_modifier + 6 * (v471.pitch_modifier < 89 and 1 or -1);
            if v471.pitch_modifier >= 89 or v471.pitch_modifier <= -89 then
                v471.pitch_modifier = -89;
            end;
            if globals.tickcount % (v14.anti_aim.builder.defensive[v487].enable.delay:get() + 1) == v14.anti_aim.builder.defensive[v487].enable.delay:get() then
                v471.defensive_switch = not v471.defensive_switch;
            end;
            if not is_all_enemies_die() and not is_warmup() and (not is_safe_head() or v14.anti_aim.other.safe_head_state.selection:get() ~= "Disabled") then
                v111.hidden:override(v14.anti_aim.builder.defensive[v487].enable:get());
                if v14.anti_aim.builder.defensive[v487].enable.pitch:get() == "Up" then
                    rage.antiaim:override_hidden_pitch(-89);
                elseif v14.anti_aim.builder.defensive[v487].enable.pitch:get() == "Zero" then
                    rage.antiaim:override_hidden_pitch(0);
                elseif v14.anti_aim.builder.defensive[v487].enable.pitch:get() == "Down" then
                    rage.antiaim:override_hidden_pitch(89);
                elseif v14.anti_aim.builder.defensive[v487].enable.pitch:get() == "Random" then
                    rage.antiaim:override_hidden_pitch(math.random(-v14.anti_aim.builder.defensive[v487].enable.pitch_offset_2:get(), v14.anti_aim.builder.defensive[v487].enable.pitch_offset_2:get()));
                elseif v14.anti_aim.builder.defensive[v487].enable.pitch:get() == "Staged" then
                    local v489 = math.floor(globals.tickcount / 4) % 5;
                    if v489 == 0 then
                        rage.antiaim:override_hidden_pitch(-89);
                    elseif v489 == 1 then
                        rage.antiaim:override_hidden_pitch(-45);
                    elseif v489 == 2 then
                        rage.antiaim:override_hidden_pitch(0);
                    elseif v489 == 3 then
                        rage.antiaim:override_hidden_pitch(45);
                    elseif v489 == 4 then
                        rage.antiaim:override_hidden_pitch(89);
                    end;
                elseif v14.anti_aim.builder.defensive[v487].enable.pitch:get() == "Additional" then
                    rage.antiaim:override_hidden_pitch(math.clamp(v471.pitch_modifier, -89, 89));
                elseif v14.anti_aim.builder.defensive[v487].enable.pitch:get() == "Custom" then
                    rage.antiaim:override_hidden_pitch(v14.anti_aim.builder.defensive[v487].enable.pitch_offset:get());
                end;
                if v14.anti_aim.builder.defensive[v487].enable.yaw:get() == "Static" then
                    rage.antiaim:override_hidden_yaw_offset(v14.anti_aim.builder.defensive[v487].enable.offset:get());
                elseif v14.anti_aim.builder.defensive[v487].enable.yaw:get() == "Sideways" then
                    local v490 = math.random(-v14.anti_aim.builder.defensive[v487].enable.randomization:get(), v14.anti_aim.builder.defensive[v487].enable.randomization:get());
                    local v491 = (v471.defensive_switch == true and v14.anti_aim.builder.defensive[v487].enable.right:get() or v14.anti_aim.builder.defensive[v487].enable.left:get()) + v490;
                    rage.antiaim:override_hidden_yaw_offset(v491);
                elseif v14.anti_aim.builder.defensive[v487].enable.yaw:get() == "Forward" then
                    rage.antiaim:override_hidden_yaw_offset(-180);
                elseif v14.anti_aim.builder.defensive[v487].enable.yaw:get() == "Backward" then
                    rage.antiaim:override_hidden_yaw_offset(0);
                elseif v14.anti_aim.builder.defensive[v487].enable.yaw:get() == "3-Way" then
                    local v492 = math.floor(globals.tickcount / v14.anti_aim.builder.defensive[v487].enable.delay:get()) % 3;
                    local v493 = {
                        [1] = -90, 
                        [2] = -180, 
                        [3] = 90
                    };
                    local v494 = math.random(-v14.anti_aim.builder.defensive[v487].enable.randomization:get(), v14.anti_aim.builder.defensive[v487].enable.randomization:get());
                    rage.antiaim:override_hidden_yaw_offset(v493[v492 + 1] + v494 or -180);
                elseif v14.anti_aim.builder.defensive[v487].enable.yaw:get() == "5-Way" then
                    local v495 = math.floor(globals.tickcount / v14.anti_aim.builder.defensive[v487].enable.delay:get()) % 5;
                    local v496 = {
                        [1] = -90, 
                        [2] = -45, 
                        [3] = -180, 
                        [4] = 45, 
                        [5] = 90
                    };
                    local v497 = math.random(-v14.anti_aim.builder.defensive[v487].enable.randomization:get(), v14.anti_aim.builder.defensive[v487].enable.randomization:get());
                    rage.antiaim:override_hidden_yaw_offset(v496[v495 + 1] + v497 or -180);
                end;
                if is_safe_head() and v14.anti_aim.other.safe_head_state.selection:get() == "E-Spam" and not is_all_enemies_die() and not is_warmup() then
                    v111.hidden:override(true);
                    rage.antiaim:override_hidden_pitch(0);
                    rage.antiaim:override_hidden_yaw_offset(180);
                    v111.lag_option:override("Always on");
                    v111.onshot_lag_option:override("Break LC");
                end;
            else
                v111.hidden:override();
            end;
        else
            v111.hidden:override();
        end;
    else
        v111.hidden:override();
    end;
    if v14.anti_aim.other.defensive_flick:get() and rage.exploit:get() > 0 then
        if v14.anti_aim.other.defensive_flick.state:get(v488 - 1) then
            if not v14.anti_aim.other.selection:get("Defensive Anti-Aim") or (not is_safe_head() or v14.anti_aim.other.safe_head_state.selection:get() ~= "E-Spam") and (not is_safe_head() or v14.anti_aim.other.safe_head_state.selection:get() ~= "Disabled") then
                v111.lag_option:override("Always on");
                v111.onshot_lag_option:override("Break LC");
                if v14.anti_aim.other.defensive_flick.pitch:get() == "Safe" then
                    rage.antiaim:override_hidden_pitch(89);
                elseif v14.anti_aim.other.defensive_flick.pitch:get() == "Semi-safe" then
                    rage.antiaim:override_hidden_pitch(0);
                elseif v14.anti_aim.other.defensive_flick.pitch:get() == "Dangerous" then
                    rage.antiaim:override_hidden_pitch(-89);
                elseif v14.anti_aim.other.defensive_flick.pitch:get() == "Drift" then
                    rage.antiaim:override_hidden_pitch(math.random(-45, 45));
                elseif v14.anti_aim.other.defensive_flick.pitch:get() == "Toaster" then
                    rage.antiaim:override_hidden_pitch(globals.tickcount % 5 == 2 and -89 or 0);
                end;
                if v14.anti_aim.other.defensive_flick.yaw:get() == "Default" then
                    rage.antiaim:override_hidden_yaw_offset(rage.antiaim:inverter() == true and 79 or -79);
                elseif v14.anti_aim.other.defensive_flick.yaw:get() == "Low" then
                    rage.antiaim:override_hidden_yaw_offset(rage.antiaim:inverter() == true and 60 or -60);
                elseif v14.anti_aim.other.defensive_flick.yaw:get() == "Estetic" then
                    rage.antiaim:override_hidden_yaw_offset(rage.antiaim:inverter() == true and 84 or -84);
                elseif v14.anti_aim.other.defensive_flick.yaw:get() == "Full" then
                    rage.antiaim:override_hidden_yaw_offset(rage.antiaim:inverter() == true and 90 or -90);
                elseif v14.anti_aim.other.defensive_flick.yaw:get() == "Elusive" then
                    rage.antiaim:override_hidden_yaw_offset(rage.antiaim:inverter() == true and math.random(79, 104) or math.random(-104, -79));
                elseif v14.anti_aim.other.defensive_flick.yaw:get() == "Modulo" then
                    rage.antiaim:override_hidden_yaw_offset(rage.antiaim:inverter() == true and math.random(60, 114) or math.random(-114, -60));
                elseif v14.anti_aim.other.defensive_flick.yaw:get() == "Designer" then
                    local l_tickcount_0 = globals.tickcount;
                    local v499 = math.sin(l_tickcount_0 * 0.15) * 90;
                    rage.antiaim:override_hidden_yaw_offset(rage.antiaim:inverter() == true and v499 or -v499);
                end;
                v111.hidden:override(true);
                if not v14.anti_aim.other.defensive_flick.unmatched_mode:get() then
                    v486.force_defensive = v486.command_number % (3 + v14.anti_aim.other.defensive_flick.time:get()) == 0;
                end;
            end;
        elseif not v14.anti_aim.other.selection:get("Defensive Anti-Aim") then
            v111.hidden:override(false);
        end;
    end;
end;
legit_aa = function(v500)
    -- upvalues: v14 (ref), v111 (ref)
    local v501 = true;
    if v14.anti_aim.other.selection:get("Legit Anti-Aim") then
        local v502 = entity.get_local_player();
        if not v502 then
            return;
        else
            local l_m_iTeamNum_0 = v502.m_iTeamNum;
            for _, v505 in pairs({
                entity.get_entities("CPlantedC4"), 
                entity.get_entities("CHostage")
            }) do
                for _, v507 in pairs(v505) do
                    local v508 = v502:get_origin():dist((v507:get_origin()));
                    if v508 < 65 and v508 > 1 and l_m_iTeamNum_0 == 3 then
                        v501 = false;
                    end;
                end;
            end;
            if get_weapon(v502) ~= nil and l_m_iTeamNum_0 == 2 and v502.m_bInBombZone and (v502:get_weapon_index() == 49 or v502:get_player_weapon():get_weapon_info().weapon_type == 9) then
                v501 = false;
            end;
            if bit.band(v500.buttons, 32) == 32 and v501 then
                if globals.curtime - start_curtime > 0.02 then
                    v500.buttons = bit.band(v500.buttons, bit.bnot(32));
                    if should_legit_aa_override then
                        should_legit_aa_override = false;
                    end;
                    v111.base:override("Local View");
                    v111.yaw_modifier:override("Disabled");
                    v111.pitch:override("Disabled");
                    v111.yaw:override(180);
                    v111.yaw_base_freestanding:override(false);
                    v111.hidden:override(false);
                end;
            else
                if not should_legit_aa_override then
                    v111.yaw_modifier:override();
                    v111.pitch:override();
                    v111.yaw:override();
                    v111.yaw_base_freestanding:override();
                    v111.hidden:override();
                    should_legit_aa_override = true;
                end;
                start_curtime = globals.curtime;
            end;
        end;
    end;
end;
air_exploit = function()
    -- upvalues: v14 (ref), v111 (ref)
    if not v14.anti_aim.enable:get() then
        return;
    else
        local v509 = get_state();
        if not v14.anti_aim.other.air_exploit:get() then
            return;
        elseif v509 ~= 7 and v509 ~= 8 then
            return;
        else
            if v111.doubletap:get() or v111.doubletap:get_override() then
                if globals.tickcount % (v14.anti_aim.other.air_exploit.delay:get() * 2) == v14.anti_aim.other.air_exploit.delay:get() then
                    v111.doubletap_fake_lag:override(math.random(10));
                    rage.exploit:force_teleport();
                else
                    rage.exploit:force_charge();
                end;
            end;
            return;
        end;
    end;
end;
local function v511(v510)
    return ffi.cast("c_animlayers**", ffi.cast("char*", v510[0]) + 10640)[0];
end;
update_animation = function()
    -- upvalues: v14 (ref), v111 (ref), v511 (ref)
    if not v14.anti_aim.enable:get() then
        return;
    elseif not v14.anti_aim.other.enable_animation_breakers:get() then
        return;
    else
        local v512 = entity.get_local_player();
        if not v512 or not v512:is_alive() then
            return;
        else
            local v513 = bit.band(v512.m_fFlags, 1) == 1;
            speed = vector(v512["m_vecVelocity[0]"], v512["m_vecVelocity[1]"], v512["m_vecVelocity[2]"]):length2d();
            if v513 then
                if v14.anti_aim.other.enable_animation_breakers.anim_breakers:get(1) then
                    if v14.anti_aim.other.enable_animation_breakers.landing_legs:get() == "Static" then
                        v111.legmovement:override("Sliding");
                        v512.m_flPoseParameter[0] = 1;
                    elseif v14.anti_aim.other.enable_animation_breakers.landing_legs:get() == "Moon walk" then
                        v111.legmovement:override("Walking");
                        v512.m_flPoseParameter[7] = 1;
                    elseif v14.anti_aim.other.enable_animation_breakers.landing_legs:get() == "Jitter" then
                        v111.legmovement:override("Walking");
                        v512.m_flPoseParameter[7] = math.random(0, 10) / 10;
                    end;
                end;
            elseif v14.anti_aim.other.enable_animation_breakers.anim_breakers:get(2) then
                if v14.anti_aim.other.enable_animation_breakers.air_legs:get() == "Static" then
                    v512.m_flPoseParameter[6] = 1;
                elseif v14.anti_aim.other.enable_animation_breakers.air_legs:get() == "Moon walk" then
                    v511(v512)[6].m_flWeight = 1;
                    v512.m_flPoseParameter[7] = 1;
                elseif v14.anti_aim.other.enable_animation_breakers.air_legs:get() == "Jitter" then
                    v512.m_flPoseParameter[6] = math.random(0, 10) / 10;
                end;
            end;
            if v14.anti_aim.other.enable_animation_breakers.anim_breakers:get(3) and (v14.anti_aim.other.enable_animation_breakers.adaptive_lean:get() or speed > 10) then
                v511(v512)[12].m_flWeight = v14.anti_aim.other.enable_animation_breakers.move_lean_value:get() / 10;
            end;
            return;
        end;
    end;
end;
local v514 = l_pui_0.setup(v14, true);
l_extended_0.render:set(function()
    -- upvalues: v14 (ref)
    animated_sidebar();
    watermark();
    keybinds:update();
    static_watermark();
    on_screen_indication();
    scope_overlay();
    damage_indication:update();
    render_logs();
    gs_indication();
    manual_arrows:update();
    aspect_ratio();
    clantag_spammer();
    v14.anti_aim.builder.default[1].override_state:visibility(false);
    v14.anti_aim.builder.default[1].override_state:set(true);
end);
l_extended_0.render_glow:set(function(_)

end);
l_extended_0.createmove:set(function(v516)
    -- upvalues: l_aim_0 (ref)
    ideal_peek();
    override_hitchance();
    better_lagcomp();
    predict(v516);
    jumpscout_fix(v516);
    baim_if_letal();
    latency_unlock();
    l_aim_0(v516);
    defensive_anti_aim(v516);
    legit_aa(v516);
    air_exploit();
    setup_super_toss(v516);
    strafe_fix(v516);
    avoid_collisions(v516);
    accelerated_ladder(v516);
    no_fall_damage(v516);
end);
l_extended_0.grenade_override_view:set(function(v517)
    compensate_prediction(v517);
end);
l_extended_0.grenade_prediction:set(function(v518)
    grenade_release(v518);
end);
l_extended_0.override_view:set(function(_)

end);
l_extended_0.aim_ack:set(function(v520)
    aimbot_logging(v520);
    hit_miss_ratio(v520);
end);
l_extended_0.player_hurt:set(function(v521)
    nade_logging(v521);
end);
l_extended_0.item_purchase:set(function(v522)
    item_purchase_logging(v522);
end);
l_extended_0.round_end:set(function(_)

end);
l_extended_0.player_death:set(function(v524)
    trash_talk(v524);
end);
l_extended_0.level_init:set(function()

end);
l_extended_0.post_update_clientside_animation:set(function()
    update_animation();
end);
l_extended_0.round_start:set(function()
    -- upvalues: v471 (ref), v17 (ref), l_extended_0 (ref), v352 (ref)
    v471.delay_time = globals.tickcount;
    v17.revenge.attacker = nil;
    l_extended_0.voice_message:call(function(v525)
        -- upvalues: v352 (ref)
        v525:write_bits(v352, 16);
    end);
end);
l_extended_0.pre_render:set(function()
    -- upvalues: v17 (ref)
    active_color = ui.get_style("Link Active");
    if active_color ~= v17.link_color then
        active_color = ui.get_style("Link Active");
    end;
    v17.link_color = active_color;
end);
local v526 = {
    UPDATE_URL = "https://neverlose-cloud.vercel.app/config/update/", 
    CREATE_URL = "https://neverlose-cloud.vercel.app/config/create", 
    DELETE_URL = "https://neverlose-cloud.vercel.app/config/delete/", 
    REFRESH_URL = "https://neverlose-cloud.vercel.app/config/get_list", 
    LOAD_URL = "https://neverlose-cloud.vercel.app/config/get/"
};
local v527 = {};
local v528 = {};
config_database = db.additional_configs or {};
config_database.config_list = config_database.config_list or {};
v15 = {
    export = function()
        -- upvalues: v514 (ref), l_base64_0 (ref)
        local v529 = v514:save();
        return (l_base64_0.encode(json.stringify(v529)));
    end, 
    export_anti_aim = function()
        -- upvalues: v10 (ref), v14 (ref), l_pui_0 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
        local v530 = v10.conditions_as_number[v14.anti_aim.condition:get()];
        local v531 = l_pui_0.setup({
            [1] = v14.anti_aim.builder.default[v530], 
            [2] = v14.anti_aim.builder.defensive[v530]
        }, true):save();
        local v532 = l_base64_0.encode(json.stringify(v531));
        l_clipboard_0.set(v532);
        print("Exported config");
        utils.console_exec("play ui\\beepclear");
    end, 
    import_config = function(v533)
        -- upvalues: l_base64_0 (ref), v514 (ref)
        local _ = nil;
        local _ = nil;
        local l_status_0, l_result_0 = pcall(function()
            -- upvalues: l_base64_0 (ref), v533 (ref)
            local v536 = l_base64_0.decode(v533);
            return json.parse(v536);
        end);
        if l_status_0 then
            v514:load(l_result_0);
            print("Imported Config");
            utils.console_exec("play ui\\beepclear");
        else
            print("You can't load this config.");
            utils.console_exec("play resource\\warning.wav");
        end;
    end, 
    import_anti_aim_config = function(v539)
        -- upvalues: v10 (ref), v14 (ref), l_pui_0 (ref), l_base64_0 (ref)
        local v540 = v10.conditions_as_number[v14.anti_aim.condition:get()];
        local v541 = l_pui_0.setup({
            [1] = v14.anti_aim.builder.default[v540], 
            [2] = v14.anti_aim.builder.defensive[v540]
        }, true);
        local _ = nil;
        local _ = nil;
        local l_status_1, l_result_1 = pcall(function()
            -- upvalues: l_base64_0 (ref), v539 (ref)
            local v544 = l_base64_0.decode(v539);
            return json.parse(v544);
        end);
        if l_status_1 then
            v541:load(l_result_1);
            print("Imported Config");
            utils.console_exec("play ui\\beepclear");
        else
            print("You can't load this config.");
            utils.console_exec("play resource\\warning.wav");
        end;
    end
};
v16 = {
    manage_list = function(v547)
        -- upvalues: v14 (ref)
        v14.config.list:update(v547);
    end, 
    update_list = function()
        -- upvalues: v16 (ref), v527 (ref)
        self = v16;
        local v548 = {};
        for v549 = 1, #v527 do
            table.insert(v548, v527[v549] .. "  \226\152\129");
        end;
        for v550 = 1, #config_database.config_list do
            table.insert(v548, config_database.config_list[v550].title .. "  \226\140\168");
        end;
        self.manage_list(v548);
    end, 
    update_data = function(v551, v552)
        -- upvalues: v14 (ref)
        v14.config.creator:name("Creator:  \a{Link Active}" .. v551 or "-");
        v14.config.date:name("Created at:  \a{Link Active}" .. v552 or "-");
    end, 
    update_data_handle = function(v553)
        -- upvalues: v16 (ref), v14 (ref), v528 (ref)
        self = v16;
        local v554 = v14.config.list:get();
        if v14.config.list:get() - 1 >= 1 or not v14.config.list:get() then
            local _ = v14.config.list:get() - 1;
        end;
        utils.execute_after(v553, function()
            -- upvalues: v528 (ref), v554 (ref)
            if v528[v554] then
                self.update_data(v528[v554].creator, v528[v554].date);
            else
                self.update_data("-", "-");
            end;
        end);
    end, 
    refresh = function()
        -- upvalues: v16 (ref), v14 (ref), v526 (ref), v528 (ref), v527 (ref)
        self = v16;
        local _ = v14.config.list:get();
        common.add_notify("alcatraz.lua", "Connecting to server...");
        network.get(v526.REFRESH_URL, nil, function(v557)
            -- upvalues: v528 (ref), v527 (ref)
            common.add_notify("alcatraz.lua", "Connected! Fetching data...");
            v528 = {};
            local v558 = {};
            for v559 = 1, #v527 do
                v527[v559] = nil;
            end;
            for v560 = 1, #v528 do
                v528[v560] = nil;
            end;
            local l_message_0 = json.parse(v557).message;
            if #l_message_0 ~= 0 then
                for v562, _ in pairs(l_message_0) do
                    table.insert(v558, {
                        id = l_message_0[v562].id, 
                        title = l_message_0[v562].title, 
                        creator = l_message_0[v562].creator, 
                        date = l_message_0[v562].date
                    });
                end;
            else
                table.insert(v558, {
                    title = "No config has been created", 
                    id = 0, 
                    creator = "-", 
                    date = "-"
                });
            end;
            for v564, v565 in pairs(v558) do
                v527[v564] = v565.title;
                v528[v564] = v565;
            end;
            self.update_list();
            self.update_data_handle(1.5);
        end);
    end, 
    create = function()
        -- upvalues: v16 (ref), v14 (ref), v10 (ref), v15 (ref), v526 (ref)
        self = v16;
        local v566 = v14.config.name:get();
        if v566 == "" or v566:match("^%s*$") or v566:match("^%s") then
            print("Invalid config name");
            return;
        else
            local v567 = {
                creator = v10.username, 
                title = v566, 
                value = v15.export()
            };
            network.post(v526.CREATE_URL, v567, {
                ["Content-Type"] = "application/json"
            }, function(v568)
                local l_message_1 = json.parse(v568).message;
                if l_message_1 then
                    common.add_notify("alcatraz.lua", l_message_1);
                end;
                self.refresh();
            end);
            utils.console_exec("play ui\\beepclear");
            return;
        end;
    end, 
    load = function()
        -- upvalues: v14 (ref), v528 (ref), v526 (ref), v15 (ref)
        local l_id_0 = v528[v14.config.list:get()].id;
        network.get(v526.LOAD_URL .. l_id_0, nil, function(v571)
            -- upvalues: v15 (ref)
            local l_message_2 = json.parse(v571).message;
            if l_message_2 then
                local l_status_2, _ = pcall(function()
                    -- upvalues: v15 (ref), l_message_2 (ref)
                    v15.import_config(l_message_2);
                end);
                if l_status_2 then
                    common.add_notify("alcatraz.lua", "Config successfully loaded!");
                else
                    common.add_notify("alcatraz.lua", "Failed to load config!");
                end;
            end;
        end);
    end, 
    update = function()
        -- upvalues: v14 (ref), v528 (ref), v10 (ref), v15 (ref), v526 (ref)
        local l_id_1 = v528[v14.config.list:get()].id;
        local v576 = {
            username = v10.username, 
            value = v15.export()
        };
        network.post(v526.UPDATE_URL .. l_id_1, v576, {
            ["Content-Type"] = "application/json"
        }, function(v577)
            local l_message_3 = json.parse(v577).message;
            if l_message_3 then
                common.add_notify("alcatraz.lua", l_message_3);
            end;
        end);
        utils.console_exec("play ui\\beepclear");
    end, 
    delete = function()
        -- upvalues: v14 (ref), v528 (ref), v10 (ref), v526 (ref)
        local l_id_2 = v528[v14.config.list:get()].id;
        local v580 = {
            username = v10.username
        };
        network.post(v526.DELETE_URL .. l_id_2, v580, {
            ["Content-Type"] = "application/json"
        }, function(v581)
            local l_message_4 = json.parse(v581).message;
            if l_message_4 then
                common.add_notify("alcatraz.lua", l_message_4);
            end;
            self.refresh();
        end);
        utils.console_exec("play ui\\beepclear");
    end
};
v16.refresh();
v14.config.list:set_callback(function()
    -- upvalues: v16 (ref)
    v16.update_data_handle(0);
end);
v14.config.export:set_callback(function()
    -- upvalues: l_clipboard_0 (ref), v15 (ref)
    l_clipboard_0.set(v15.export());
    print("Exported config");
    utils.console_exec("play ui\\beepclear");
end);
v14.config.import:set_callback(function()
    -- upvalues: v15 (ref), l_clipboard_0 (ref)
    v15.import_config(l_clipboard_0.get());
end);
v14.anti_aim.other.export:set_callback(v15.export_anti_aim);
v14.anti_aim.other.import:set_callback(function()
    -- upvalues: v15 (ref), l_clipboard_0 (ref)
    v15.import_anti_aim_config(l_clipboard_0.get());
end);
v14.config.create:set_callback(v16.create);
v14.config.load:set_callback(v16.load);
v14.config.update:set_callback(v16.update);
v14.config.delete:set_callback(v16.delete);
v14.config.refresh:set_callback(v16.refresh);
l_extended_0.shutdown:set(function(_)
    -- upvalues: v111 (ref)
    v111.scope_overlay:override();
    common.set_clan_tag("");
    db.additional_configs = config_data;
    entity.get_players(false, true, function(v584)
        v584:set_icon();
    end);
end);