math.randomseed(math.floor(globals.realtime * 1000) + globals.framecount);
local l_pui_0 = require("neverlose/pui");
local _ = require("neverlose/wapi");
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
l_pui_0.colors.warn = color("#BABD5B");
ffi.cdef("    typedef struct {\n        char pad_0000[20];\n        int m_nOrder;\n        int m_nSequence;\n        float m_flPrevCycle;\n        float m_flWeight;\n        float m_flWeightDeltaRate;\n        float m_flPlaybackRate;\n        float m_flCycle;\n        void* m_pOwner;\n        char pad_0038[4];\n    } CAnimationLayer;\n");
local v722 = new_class():struct("references")({
    rage = {
        main = {
            dt = l_pui_0.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
            dt_lag = l_pui_0.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
            hs_lag = l_pui_0.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
            hs = l_pui_0.find("Aimbot", "Ragebot", "Main", "Hide Shots")
        }
    }, 
    antiaim = {
        enabled = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
        angles = {
            pitch = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
            extract_yaw = {
                yaw = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "yaw"), 
                offset = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "yaw", "Offset"), 
                base = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "yaw", "Base"), 
                snap = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "yaw", "Hidden"), 
                avoid_backstab = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "yaw", "Avoid Backstab"), 
                roll = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Extended Angles")
            }, 
            extract_modifier = {
                mode = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "yaw Modifier"), 
                offset = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "yaw Modifier", "Offset")
            }, 
            extract_desync = {
                switch = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body yaw"), 
                left_limit = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body yaw", "left Limit"), 
                right_limit = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body yaw", "right Limit"), 
                tweaks = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body yaw", "Options"), 
                inverter = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
                freestanding = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
            }, 
            extract_freestanding = {
                switch = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
                disable_jitter = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable yaw Modifiers"), 
                body = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding")
            }
        }, 
        misc = {
            fake_duck = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
            slow_walk = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
            slidewalk_directory = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
        }
    }, 
    visuals = {
        world = {
            main = {
                zoom_scope = l_pui_0.find("Visuals", "World", "Main", "Override Zoom"), 
                scope_overlay = l_pui_0.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
            }
        }
    }, 
    misc = {
        main = {
            other = {
                ping_spike = l_pui_0.find("Miscellaneous", "Main", "Other", "Fake Latency")
            }
        }
    }
}):struct("localplayer")({
    flags = 0, 
    pre_predict_command = function(v4, v5)
        v4.flags = entity.get_local_player().m_fFlags;
        v4.is_in_air = v5.in_jump or bit.band(v4.flags, bit.lshift(1, 0)) == 0;
    end, 
    is_in_duck = function(_, v7)
        local l_m_fFlags_0 = v7.m_fFlags;
        return bit.band(l_m_fFlags_0, 4) == 4;
    end, 
    side = function(_)
        return rage.antiaim:inverter();
    end, 
    state = function(v10, _)
        local v12 = entity.get_local_player();
        if not v12 or not v12:is_alive() then
            return;
        else
            local v13 = v12.m_vecVelocity:length();
            local v14 = v12.m_iTeamNum == 2 and 1 or 2;
            local v15 = 1;
            if v10.is_in_air then
                v15 = v10:is_in_duck(v12) and 7 or 6;
            elseif v13 > 3 then
                v15 = v10:is_in_duck(v12) and 5 or v10.references.antiaim.misc.slow_walk:get() and 3 or 2;
            else
                v15 = v10:is_in_duck(v12) and 4 or 1;
            end;
            if v10.antiaim.elements.freestanding:get() and v10.antiaim.elements.freestanding_allowed:get() and v10.references.antiaim.angles.extract_freestanding.switch:get() then
                v15 = 8;
            end;
            if v10.antiaim.elements.manual_yaw:get() ~= "Disabled" then
                v15 = 9;
            end;
            return v15, v14;
        end;
    end, 
    disabler_state = function(v16, _)
        local v18 = entity.get_local_player();
        if not v18 or not v18:is_alive() then
            return;
        else
            local v19 = v18.m_vecVelocity:length();
            local v20 = 1;
            if v16.is_in_air then
                v20 = v16:is_in_duck(v18) and 7 or 6;
            elseif v19 > 3 then
                v20 = v16:is_in_duck(v18) and 5 or v16.references.antiaim.misc.slow_walk:get() and 3 or 2;
            else
                v20 = v16:is_in_duck(v18) and 4 or 1;
            end;
            return v20;
        end;
    end, 
    init = function(v21)
        local function v23(v22)
            -- upvalues: v21 (ref)
            v21:pre_predict_command(v22);
        end;
        events.createmove(v23);
    end
}):struct("home")({
    init = function(v24)
        -- upvalues: l_pui_0 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
        v24.groups = {
            main = l_pui_0.create("\v\239\138\189", " ", 1), 
            info = l_pui_0.create("\v\239\138\189", "Information", 2), 
            discord = l_pui_0.create("\v\239\138\189", ""), 
            products = l_pui_0.create("\v\239\138\189", "Our Products"), 
            presets = l_pui_0.create("\v\239\138\189", "Presets"), 
            watermark = l_pui_0.create("\v\239\138\189", "Watermark")
        };
        v24.elements = {
            warning = v24.groups.main:label("\a[warn]\239\129\177   \rThe script is a work in progress and some features may not work as intended."), 
            about = v24.groups.main:list("", "\v\239\128\135       \r" .. common.get_username(), "\v\239\130\133     \rOther"), 
            report_bugs = v24.groups.discord:label("\239\134\136  Report Bugs"), 
            join_discord = v24.groups.discord:button("\v\239\142\146 \rDiscord Server", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/BfV7xXxFNS");
            end, true), 
            progress_version_bar = v24.groups.info:slider("\v\226\128\162    \a{Small Text}Versions", 1, 81, 1, nil, function(v25)
                local v26 = {};
                for v27 = 1, 81 do
                    if v27 > 0 then
                        v26[v27] = string.format("V%03d", v27);
                    end;
                end;
                return v26[v25];
            end), 
            config_name = v24.groups.info:label("\v\226\128\162    \a{Small Text}Config Name: \v" .. common.get_config_name() .. "  \a{Small Text}\238\136\145"), 
            config_author = v24.groups.info:label("    \v\226\164\183  \a{Small Text}Author: \a{Small Text}@\v" .. common.get_config_author()), 
            active_scripts = v24.groups.info:list("\v\226\128\162    \a{Small Text}Loaded Scripts  \a{Small Text}\239\160\168", common.get_active_scripts()), 
            configs = v24.groups.products:label("\v\226\128\162    \a{Small Text}Configs"), 
            config_button = v24.groups.products:button("\a{Active Text}Rxdxyxz", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://market.neverlose.cc/tDOIP4");
            end, true), 
            config_button_beta = v24.groups.products:button("\a{Active Text}Rxdxyxz Beta  \a{Small Text}\239\129\173", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://market.neverlose.cc/aeE0HG");
            end, true), 
            scripts = v24.groups.products:label("\v\226\128\162    \a{Small Text}Scripts"), 
            script_button_nyanza = v24.groups.products:button("\a{Active Text}Nyanza", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://market.neverlose.cc/s9V6D3");
            end, true), 
            script_button_nyanza_beta = v24.groups.products:button("\a{Active Text}Nyanza Beta", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://market.neverlose.cc/nmPxrV");
            end, true), 
            watermark_gear = v24.groups.watermark:label("\v\238\134\149  \rOptions"), 
            watermark_options = {}
        };
        v24.elements.preset_buttons = {};
        v24.elements.preset_list = v24.groups.presets:list("", {});
        v24.elements.preset_input = v24.groups.presets:input("", "my new p fig!");
        v24.elements.preset_buttons.create = v24.groups.presets:button("\v\239\153\158", nil, true, "Create\n\n\a{Small Text}Creates a new preset with the name you enter in the input.");
        v24.elements.preset_buttons.load = v24.groups.presets:button("\v\239\136\133", nil, true, "Load\n\n\a{Small Text}Loads the selected preset.");
        v24.elements.preset_buttons.import = v24.groups.presets:button("\v\239\149\175", nil, true, "Import\n\n\a{Small Text}Imports settings from the clipboard and immediately saves them to the selected preset \226\128\148 no need to press the save button afterward.");
        v24.elements.preset_buttons.export = v24.groups.presets:button("\v\239\149\174", nil, true, "Export\n\n\a{Small Text}Exports settings from the selected preset to the clipboard.");
        v24.elements.preset_buttons.save = v24.groups.presets:button("\a4CAF50FF\239\131\135", nil, true, "Save\n\n\a{Small Text}Saves your current settings into the selected preset.");
        v24.elements.preset_buttons.delete = v24.groups.presets:button("               \aF44336FF\239\139\173                 ", nil, false, "Delete\n\n\a{Small Text}Deletes the selected preset permanently with no way to recover it.");
        local v28 = v24.elements.watermark_gear:create();
        v24.elements.watermark_options = {
            master = v28:slider("Master Gear", 0, 2, 0), 
            pos_x = v28:slider("x", 0, render.screen_size().x, render.screen_size().x / 2), 
            pos_y = v28:slider("y", 0, render.screen_size().y, render.screen_size().y - 20), 
            separator_back = v28:label("\a{Small Text}\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128"), 
            font = v28:combo("\v\226\128\162  \rFont", "Default", "Pixel", "Console", "Bold"), 
            label = v28:input("\v\226\128\162  \rLabel", "snapshot"), 
            button = v28:button("   \v\238\136\134  \rPrint the Instruction to the Chat    ", function(_)
                print_chat("\004 \002Watermark Commands\001: ");
                print_chat("\004 \015pre=\001 \226\128\148 Set prefix text");
                print_chat("\004 \015m=\001 \226\128\148 Main text");
                print_chat("\004 \015post=\001 \226\128\148 Set postfix text");
                print_chat("\004 \015nb\001 \226\128\148 Remove brackets");
                print_chat("\004 \015np\001 \226\128\148 Disable prefix");
                print_chat("\004 \016Example\001 (\bCopy!\001): pre=L U A m= S E N S E  post= [BETA]");
                print_chat("   ");
                print_chat("\004 \002Icon Commands\001 (\bFontAwesome.com icons\001)\001: ");
                print_chat("\004 \015icon_pre=\001 \226\128\148 Icon before prefix");
                print_chat("\004 \015icon_post=\001 \226\128\148 Icon after postfix");
                print_chat("\004 \016Example\001 (\bCopy!\001): pre=D E S icon_pre=moon-stars m= Y N C post= icon_post=sparkles");
                print_chat("\004 \016Example #2\001 (\bCopy!\001): pre= icon_pre=star m=DESYNC");
                print_chat("   ");
                print_chat("\004 \002Important:\001: ");
                print_chat("\004 \0151.\001 Commands must be in this order: pre > icon_pre > m > post > icon_post");
                print_chat("\004 \0152.\001 You can use just text without commands: NYANZA.MEOW or desync.max");
                print_chat("\004 \0153.\001 Find icons at: fontawesome.com/icons or click the button in Options.");
            end, true), 
            icons_button = v28:button(" \v\239\138\180 \rIcons ", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://fontawesome.com/search?ip=classic&s=solid&o=r");
            end, true), 
            reset_button = v28:button(" \aF44336FF\239\128\145 Reset Position ", function()
                -- upvalues: v24 (ref)
                v24.elements.watermark_options.pos_x:set(render.screen_size().x / 2);
                v24.elements.watermark_options.pos_y:set(render.screen_size().y - 20);
                cvar.play:call("ui\\csgo_ui_contract_type1");
            end, true), 
            copy = v28:button("\v\239\131\133", function()
                -- upvalues: l_pui_0 (ref), v24 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
                local v30 = l_pui_0.setup({
                    [1] = v24.elements.watermark_options
                }, true);
                local v31 = l_base64_0.encode(msgpack.pack(v30:save()));
                l_clipboard_0.set(v31);
                common.add_event("Settings copied to clipboard successfully", "gear");
                cvar.playvol:call("ui\\beepclear", 1);
            end, true), 
            paste = v28:button("\v\239\131\170", function()
                -- upvalues: l_pui_0 (ref), v24 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
                local v32 = l_pui_0.setup({
                    [1] = v24.elements.watermark_options
                }, true);
                local v33 = l_base64_0.decode(l_clipboard_0.get());
                v32:load((msgpack.unpack(v33)));
                common.add_event("Settings pasted from clipboard successfully", "gear");
                cvar.playvol:call("ui\\beepclear", 1);
            end, true), 
            back_button = v28:button("\v\239\129\162  \a{Small Text}Back", function()
                -- upvalues: v24 (ref)
                cvar.play:call("ui\\csgo_ui_contract_type1");
                v24.elements.watermark_options.master:set(0);
            end, true), 
            separator_etc = v28:label("\a{Small Text}\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128"), 
            main_accent = v28:color_picker("\v\226\128\162  \rMain Accent", color(255, 255, 255, 255)), 
            prefix_accent = v28:color_picker("    \v\226\164\183  \rPrefix", color(150, 200, 60, 255)), 
            postfix_accent = v28:color_picker("    \v\226\164\183  \rPostfix", color(235, 97, 97, 255)), 
            colors_button = v28:button("\v\239\148\191  \a{Small Text}Colors", function()
                -- upvalues: v24 (ref)
                cvar.play:call("ui\\csgo_ui_contract_type1");
                v24.elements.watermark_options.master:set(2);
            end, true), 
            gradient_button = v28:button("\v\239\151\131  \a{Small Text}Gradient", function()
                -- upvalues: v24 (ref)
                cvar.play:call("ui\\csgo_ui_contract_type1");
                v24.elements.watermark_options.master:set(1);
            end, true), 
            gradient_switch = v28:switch("\v\226\128\162  \rRun Animation"), 
            gradient_saturation = v28:slider("    \v\226\164\183  \rSaturation", 0, 10, 5), 
            gradient_rainbow = v28:switch("            \v\226\164\183  \rRainbow"), 
            gradient_hue = v28:slider("    \v\226\164\183  \rHue", 0, 9, 0, nil, function(v34)
                return ({
                    [1] = "Red", 
                    [2] = "Orange", 
                    [3] = "Salad", 
                    [4] = "Green", 
                    [5] = "Cyan", 
                    [6] = "Turquoise", 
                    [7] = "Blue", 
                    [8] = "Indigo", 
                    [9] = "Purple", 
                    [10] = "Pink"
                })[v34 + 1];
            end), 
            gradient_speed = v28:slider("    \v\226\164\183  \rSpeed", 1, 10, 2)
        };
        v24.elements.watermark_options.copy:depend({
            [1] = nil, 
            [2] = 0, 
            [1] = v24.elements.watermark_options.master
        }):tooltip("Copy\n\n\a{Small Text}Copies all watermark settings, including colors and gradient, to the clipboard.");
        v24.elements.watermark_options.paste:depend({
            [1] = nil, 
            [2] = 0, 
            [1] = v24.elements.watermark_options.master
        }):tooltip("Paste\n\n\a{Small Text}Pastes watermark settings from the clipboard.");
        v24.elements.watermark_options.gradient_switch:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v24.elements.watermark_options.master
        });
        v24.elements.watermark_options.gradient_saturation:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v24.elements.watermark_options.master
        }, v24.elements.watermark_options.gradient_switch);
        v24.elements.watermark_options.gradient_rainbow:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v24.elements.watermark_options.master
        }, {
            [1] = nil, 
            [2] = 1, 
            [3] = 10, 
            [1] = v24.elements.watermark_options.gradient_saturation
        }, v24.elements.watermark_options.gradient_switch);
        v24.elements.watermark_options.gradient_hue:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v24.elements.watermark_options.master
        }, {
            [1] = nil, 
            [2] = 1, 
            [3] = 10, 
            [1] = v24.elements.watermark_options.gradient_saturation
        }, {
            [1] = nil, 
            [2] = false, 
            [1] = v24.elements.watermark_options.gradient_rainbow
        }, v24.elements.watermark_options.gradient_switch);
        v24.elements.watermark_options.gradient_speed:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v24.elements.watermark_options.master
        }, v24.elements.watermark_options.gradient_switch);
        v24.elements.watermark_options.font:depend({
            [1] = nil, 
            [2] = 0, 
            [1] = v24.elements.watermark_options.master
        });
        v24.elements.watermark_options.master:depend({
            [1] = nil, 
            [2] = 100, 
            [1] = v24.elements.progress_version_bar
        });
        v24.elements.watermark_options.pos_x:depend({
            [1] = nil, 
            [2] = 100, 
            [1] = v24.elements.progress_version_bar
        });
        v24.elements.watermark_options.pos_y:depend({
            [1] = nil, 
            [2] = 100, 
            [1] = v24.elements.progress_version_bar
        });
        v24.elements.watermark_options.separator_back:depend({
            [1] = nil, 
            [2] = 1, 
            [3] = 2, 
            [1] = v24.elements.watermark_options.master
        });
        v24.elements.watermark_options.back_button:depend({
            [1] = nil, 
            [2] = 1, 
            [3] = 2, 
            [1] = v24.elements.watermark_options.master
        });
        v24.elements.watermark_options.separator_etc:depend({
            [1] = nil, 
            [2] = 0, 
            [1] = v24.elements.watermark_options.master
        });
        v24.elements.watermark_options.label:depend({
            [1] = nil, 
            [2] = 0, 
            [1] = v24.elements.watermark_options.master
        }):tooltip("Enter a word you want to show as a watermark. You can just type a simple word here.\n\n\a{Small Text}If you want to use icons, prefix, postfix, or get more options, click \"Print the Instruction to the Chat\"");
        v24.elements.watermark_options.button:depend({
            [1] = nil, 
            [2] = 0, 
            [1] = v24.elements.watermark_options.master
        });
        v24.elements.watermark_options.icons_button:depend({
            [1] = nil, 
            [2] = 0, 
            [1] = v24.elements.watermark_options.master
        }):tooltip("Opens a website in your browser where you can find icon names for the watermark.");
        v24.elements.watermark_options.reset_button:depend({
            [1] = nil, 
            [2] = 0, 
            [1] = v24.elements.watermark_options.master
        });
        v24.elements.watermark_options.colors_button:depend({
            [1] = nil, 
            [2] = 0, 
            [1] = v24.elements.watermark_options.master
        });
        v24.elements.watermark_options.gradient_button:depend({
            [1] = nil, 
            [2] = 0, 
            [1] = v24.elements.watermark_options.master
        });
        v24.elements.watermark_options.main_accent:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = v24.elements.watermark_options.master
        });
        v24.elements.watermark_options.prefix_accent:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = v24.elements.watermark_options.master
        });
        v24.elements.watermark_options.postfix_accent:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = v24.elements.watermark_options.master
        });
        v24.elements.report_bugs:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v24.elements.about
        });
        v24.elements.join_discord:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v24.elements.about
        });
        v24.elements.progress_version_bar:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v24.elements.about
        });
        v24.elements.config_name:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v24.elements.about
        });
        v24.elements.config_author:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v24.elements.about
        });
        v24.elements.active_scripts:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v24.elements.about
        });
        v24.elements.configs:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v24.elements.about
        });
        v24.elements.config_button:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v24.elements.about
        });
        v24.elements.config_button_beta:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v24.elements.about
        });
        v24.elements.scripts:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v24.elements.about
        });
        v24.elements.script_button_nyanza:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v24.elements.about
        });
        v24.elements.script_button_nyanza_beta:depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v24.elements.about
        });
        v24.elements.preset_buttons.save:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = v24.elements.about
        });
        v24.elements.preset_buttons.load:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = v24.elements.about
        });
        v24.elements.preset_buttons.export:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = v24.elements.about
        });
        v24.elements.preset_buttons.import:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = v24.elements.about
        });
        v24.elements.preset_buttons.delete:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = v24.elements.about
        });
        v24.elements.preset_buttons.create:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = v24.elements.about
        });
        v24.elements.preset_list:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = v24.elements.about
        });
        v24.elements.preset_input:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = v24.elements.about
        });
        v24.elements.watermark_gear:depend({
            [1] = nil, 
            [2] = 2, 
            [1] = v24.elements.about
        });
    end
}):struct("presets")({
    init = function(v35)
        -- upvalues: l_pui_0 (ref)
        v35.database = db.snapshot555_555 or {};
        v35.system_presets = {
            l_pui_0.string("\v\226\128\162  \rSnappy  \v\226\156\166"), 
            l_pui_0.string("\v\226\128\162  \rSnapper"), 
            l_pui_0.string("\v\226\128\162  \rDefault"), 
            l_pui_0.string("\v\226\128\162  \rDelayed  \a{Small Text}(Empty!)"), 
            l_pui_0.string("\v\226\128\162  \rAggressive"), 
            l_pui_0.string("\a{Small Text}\226\128\162  Test  (Improving soon)")
        };
        v35.separator = l_pui_0.string("\a{Small Text}\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128");
        if not v35.database[l_pui_0.string("\v\226\128\162  \rSnappy  \v\226\156\166")] or #v35.database == 0 then
            v35.database[l_pui_0.string("\v\226\128\162  \rSnappy  \v\226\156\166")] = "lIaxd2F0ZXJtYXJrX29wdGlvbnONr2dyYWRpZW50X3N3aXRjaMKlcG9zX3jNA8CuZ3JhZGllbnRfc3BlZWQBsGdyYWRpZW50X3JhaW5ib3fCq21haW5fYWNjZW50qSNGRkZGRkY1RaxncmFkaWVudF9odWUArXByZWZpeF9hY2NlbnSpI0NCQ0JGNkZGrnBvc3RmaXhfYWNjZW50qSNGRkZGRkZGRqRmb250p0RlZmF1bHSzZ3JhZGllbnRfc2F0dXJhdGlvbgClcG9zX3nNBCSlbGFiZWyoc25hcHNob3SmbWFzdGVyAKVhYm91dAKrcHJlc2V0X2xpc3QItHByb2dyZXNzX3ZlcnNpb25fYmFyUK5hY3RpdmVfc2NyaXB0cwGscHJlc2V0X2lucHV0p1NuYXBwZXKLsmRpc2FibGVfbGNfZ3JlbmFkZcOqbWFudWFsX3lhd6hEaXNhYmxlZKdib2R5X2Zzw6lkaXNhYmxlcnORoX6mc3RhdGVzB6V0ZWFtcwGuZm9yY2VfYnJlYWtfbGOZ2SQHe0xpbmsgQWN0aXZlfe+cjCAgICAHREVGQVVMVFJ1bm5pbmfZJQd7TGluayBBY3RpdmV975WUICAgICAHREVGQVVMVFNsb3dpbmfZJQd7TGluayBBY3RpdmV974aTICAgB0RFRkFVTFRDcm91Y2hpbmfZJQd7TGluayBBY3RpdmV97ouOICAgIAdERUZBVUxUU25lYWtpbmfZIAd7TGluayBBY3RpdmV97pWGICAgIAdERUZBVUxUQWly2SgHe0xpbmsgQWN0aXZlfe6VhyAgB0RFRkFVTFRBaXIgQ3JvdWNoaW5n2SgHe0xpbmsgQWN0aXZlfe6TgSAgIAdERUZBVUxURnJlZXN0YW5kaW5n2SIHe0xpbmsgQWN0aXZlfe+BuSAgB0RFRkFVTFRNYW51YWxzoX6sZnJlZXN0YW5kaW5nwqpoaWRlX3Nob3RzqEJyZWFrIExDrW9wdGlvbnNfdGFibGWLr3R3ZWFrc195YXdfdHlwZaRTcGluqGZha2VfbGFnwq1mYWtlX2xhZ190eXBlqUFsd2F5cyBvbqx0d2Vha3NfcmFuZ2XMtKx0d2Vha3Nfc3BlZWQDpnR3ZWFrc5Ghfq5hdm9pZF9iYWNrc3RhYsOydHdlYWtzX2xlZnRfb2Zmc2V04qx0d2Vha3NfcGl0Y2iiVXCzdHdlYWtzX3JpZ2h0X29mZnNldB6pc2FmZV9oZWFklNkmB3tMaW5rIEFjdGl2ZX3vhoMgICAgIAdERUZBVUxUU3RhbmRpbmfZWgd7TGluayBBY3RpdmV974aTICAgB0RFRkFVTFRDcm91Y2hpbmcgIAd7U21hbGwgVGV4dH0rICAHe0xpbmsgQWN0aXZlfe6LjiAgB0RFRkFVTFRTbmVha2luZ9lNB3tMaW5rIEFjdGl2ZX3ulYcgIAdERUZBVUxUQWlyIENyb3VjaGluZyAgB3tTbWFsbCBUZXh0fSsgIAdERUZBVUxUS25pZmUvVGFzZXKhfrRmcmVlc3RhbmRpbmdfYWxsb3dlZMOZkt4AJ6xib2R5X29wdGlvbnOPqmxpbWl0X3R5cGWlVGlja3OxdHlwZV9yYW5kb21fdmFsdWUEqGludmVydGVywqlsaW1pdF9taW46qmxlZnRfbGltaXQ8pmppdHRlcsOrcmlnaHRfbGltaXQ8rGxpbWl0X3RpbWluZwGsZnJlZXN0YW5kaW5nqERpc2FibGVkrGxpbWl0X3RpY2tfbDqkdHlwZaZTdGF0aWOsbGltaXRfdGlja19yOrB0eXBlX3RpY2tzX3ZhbHVlBKlsaW1pdF9tYXg6pm1hc3RlcgCodGlja2Jhc2WpTmV2ZXJsb3Nlp2RlbGF5XzEBp2RlbGF5XzIUpGJvZHnDp2RlbGF5XzQCp2RlbGF5XzUCp2RlbGF5XzYCp2RlbGF5XzcCrnRpY2tiYXNlX2Nob2tlELJ0aWNrYmFzZV9ybmRtX3R5cGWnRGVmYXVsdKptb2RpZmllcl8xAK10aWNrYmFzZV9ybmRtD690aWNrYmFzZV9ybmRtXzIQqm1vZGlmaWVyXzIAqnRpY2tiYXNlXzEPrnlhd19vcHRpb25zX2V4haVkZWxhecKsb2Zmc2V0X3JpZ2h0IatvZmZzZXRfbGVmdOWtZGVsYXlfc2xpZGVycwGmbWFzdGVyAKp0aWNrYmFzZV8zEKptb2RpZmllcl80AKp0aWNrYmFzZV80EKp5YXdfb2Zmc2V0AKp0aWNrYmFzZV81EKhtb2RpZmllcqZPZmZzZXSqdGlja2Jhc2VfNhCqbW9kaWZpZXJfNgCnZGVsYXlfMwKqdGlja2Jhc2VfNxCvbW9kaWZpZXJfb2Zmc2V0/6dkZWxheV84Aqptb2RpZmllcl83ALBtb2RpZmllcl9vcHRpb25zgqlyYW5kb21pemXCp3NsaWRlcnMDqm1vZGlmaWVyXzMAsHRpY2tiYXNlX3NsaWRlcnMDqm1vZGlmaWVyXzUAqm1vZGlmaWVyXzgAqHlhd19tb2RlAqp0aWNrYmFzZV8yELJ0aWNrYmFzZV9yYW5kb21pemXDqnRpY2tiYXNlXzgP3gAnrGJvZHlfb3B0aW9uc4+qbGltaXRfdHlwZaVUaWNrc7F0eXBlX3JhbmRvbV92YWx1ZQSoaW52ZXJ0ZXLCqWxpbWl0X21pbjqqbGVmdF9saW1pdDymaml0dGVyw6tyaWdodF9saW1pdDysbGltaXRfdGltaW5nAaxmcmVlc3RhbmRpbmeoRGlzYWJsZWSsbGltaXRfdGlja19sJqR0eXBlplN0YXRpY6xsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUEqWxpbWl0X21heDqmbWFzdGVyAah0aWNrYmFzZalOZXZlcmxvc2WnZGVsYXlfMQGnZGVsYXlfMhSkYm9kecOnZGVsYXlfNAKnZGVsYXlfNQKnZGVsYXlfNgKnZGVsYXlfNwKudGlja2Jhc2VfY2hva2UQsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0qm1vZGlmaWVyXzEArXRpY2tiYXNlX3JuZG0Pr3RpY2tiYXNlX3JuZG1fMhCqbW9kaWZpZXJfMgCqdGlja2Jhc2VfMQ+ueWF3X29wdGlvbnNfZXiFpWRlbGF5wqxvZmZzZXRfcmlnaHQhq29mZnNldF9sZWZ05a1kZWxheV9zbGlkZXJzAaZtYXN0ZXIAqnRpY2tiYXNlXzMPqm1vZGlmaWVyXzQAqnRpY2tiYXNlXzQPqnlhd19vZmZzZXQAqnRpY2tiYXNlXzUPqG1vZGlmaWVypk9mZnNldKp0aWNrYmFzZV82D6ptb2RpZmllcl82AKdkZWxheV8zAqp0aWNrYmFzZV83EK9tb2RpZmllcl9vZmZzZXT/p2RlbGF5XzgCqm1vZGlmaWVyXzcAsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcKnc2xpZGVycwOqbW9kaWZpZXJfMwCwdGlja2Jhc2Vfc2xpZGVycwOqbW9kaWZpZXJfNQCqbW9kaWZpZXJfOACoeWF3X21vZGUCqnRpY2tiYXNlXzIQsnRpY2tiYXNlX3JhbmRvbWl6ZcOqdGlja2Jhc2VfOBCS3gAnrGJvZHlfb3B0aW9uc4+qbGltaXRfdHlwZaVUaWNrc7F0eXBlX3JhbmRvbV92YWx1ZQSoaW52ZXJ0ZXLCqWxpbWl0X21pbhyqbGVmdF9saW1pdDqmaml0dGVyw6tyaWdodF9saW1pdDqsbGltaXRfdGltaW5nAqxmcmVlc3RhbmRpbmeoRGlzYWJsZWSsbGltaXRfdGlja19sOqR0eXBlplN0YXRpY6xsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUEqWxpbWl0X21heDqmbWFzdGVyAah0aWNrYmFzZalOZXZlcmxvc2WnZGVsYXlfMQKnZGVsYXlfMgSkYm9kecOnZGVsYXlfNAKnZGVsYXlfNQKnZGVsYXlfNgKnZGVsYXlfNwKudGlja2Jhc2VfY2hva2UQsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0qm1vZGlmaWVyXzH/rXRpY2tiYXNlX3JuZG0Pr3RpY2tiYXNlX3JuZG1fMhCqbW9kaWZpZXJfMv2qdGlja2Jhc2VfMQ+ueWF3X29wdGlvbnNfZXiFpWRlbGF5wqxvZmZzZXRfcmlnaHQmq29mZnNldF9sZWZ04K1kZWxheV9zbGlkZXJzAaZtYXN0ZXIBqnRpY2tiYXNlXzMQqm1vZGlmaWVyXzQAqnRpY2tiYXNlXzQQqnlhd19vZmZzZXQAqnRpY2tiYXNlXzUQqG1vZGlmaWVypTMtV2F5qnRpY2tiYXNlXzYPqm1vZGlmaWVyXzYAp2RlbGF5XzMBqnRpY2tiYXNlXzcPr21vZGlmaWVyX29mZnNldAqnZGVsYXlfOAKqbW9kaWZpZXJfNwCwbW9kaWZpZXJfb3B0aW9uc4KpcmFuZG9taXplwqdzbGlkZXJzBaptb2RpZmllcl8zALB0aWNrYmFzZV9zbGlkZXJzA6ptb2RpZmllcl81AKptb2RpZmllcl84AKh5YXdfbW9kZQKqdGlja2Jhc2VfMhCydGlja2Jhc2VfcmFuZG9taXplw6p0aWNrYmFzZV84EN4AJ6xib2R5X29wdGlvbnOPqmxpbWl0X3R5cGWlVGlja3OxdHlwZV9yYW5kb21fdmFsdWUEqGludmVydGVywqlsaW1pdF9taW4cqmxlZnRfbGltaXQ6pmppdHRlcsOrcmlnaHRfbGltaXQ6rGxpbWl0X3RpbWluZwKsZnJlZXN0YW5kaW5nqERpc2FibGVkrGxpbWl0X3RpY2tfbBykdHlwZaZTdGF0aWOsbGltaXRfdGlja19yOrB0eXBlX3RpY2tzX3ZhbHVlBKlsaW1pdF9tYXg6pm1hc3RlcgGodGlja2Jhc2WpTmV2ZXJsb3Nlp2RlbGF5XzECp2RlbGF5XzIEpGJvZHnDp2RlbGF5XzQCp2RlbGF5XzUCp2RlbGF5XzYCp2RlbGF5XzcCrnRpY2tiYXNlX2Nob2tlELJ0aWNrYmFzZV9ybmRtX3R5cGWnRGVmYXVsdKptb2RpZmllcl8x/610aWNrYmFzZV9ybmRtD690aWNrYmFzZV9ybmRtXzIQqm1vZGlmaWVyXzL9qnRpY2tiYXNlXzEPrnlhd19vcHRpb25zX2V4haVkZWxhecKsb2Zmc2V0X3JpZ2h0JqtvZmZzZXRfbGVmdOCtZGVsYXlfc2xpZGVycwGmbWFzdGVyAap0aWNrYmFzZV8zEKptb2RpZmllcl80AKp0aWNrYmFzZV80D6p5YXdfb2Zmc2V0AKp0aWNrYmFzZV81EKhtb2RpZmllcqhEaXNhYmxlZKp0aWNrYmFzZV82EKptb2RpZmllcl82AKdkZWxheV8zAap0aWNrYmFzZV83EK9tb2RpZmllcl9vZmZzZXQBp2RlbGF5XzgCqm1vZGlmaWVyXzcAsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcKnc2xpZGVycwWqbW9kaWZpZXJfMwCwdGlja2Jhc2Vfc2xpZGVycwOqbW9kaWZpZXJfNQCqbW9kaWZpZXJfOACoeWF3X21vZGUCqnRpY2tiYXNlXzIQsnRpY2tiYXNlX3JhbmRvbWl6ZcOqdGlja2Jhc2VfOA+S3gAnrGJvZHlfb3B0aW9uc4+qbGltaXRfdHlwZaVUaWNrc7F0eXBlX3JhbmRvbV92YWx1ZQaoaW52ZXJ0ZXLCqWxpbWl0X21pbjqqbGVmdF9saW1pdDqmaml0dGVyw6tyaWdodF9saW1pdDqsbGltaXRfdGltaW5nCaxmcmVlc3RhbmRpbmeoRGlzYWJsZWSsbGltaXRfdGlja19sOqR0eXBlpVRpY2tzrGxpbWl0X3RpY2tfcjqwdHlwZV90aWNrc192YWx1ZQapbGltaXRfbWF4OqZtYXN0ZXIAqHRpY2tiYXNlpk55YW56YadkZWxheV8xD6dkZWxheV8yFKRib2R5w6dkZWxheV80AqdkZWxheV81AqdkZWxheV82AqdkZWxheV83Aq50aWNrYmFzZV9jaG9rZRCydGlja2Jhc2Vfcm5kbV90eXBlpFdheXOqbW9kaWZpZXJfMQKtdGlja2Jhc2Vfcm5kbQ+vdGlja2Jhc2Vfcm5kbV8yEKptb2RpZmllcl8yG6p0aWNrYmFzZV8xC655YXdfb3B0aW9uc19leIWlZGVsYXnDrG9mZnNldF9yaWdodCyrb2Zmc2V0X2xlZnTQ2q1kZWxheV9zbGlkZXJzAaZtYXN0ZXIBqnRpY2tiYXNlXzMSqm1vZGlmaWVyXzQAqnRpY2tiYXNlXzQCqnlhd19vZmZzZXQAqnRpY2tiYXNlXzUJqG1vZGlmaWVypTMtV2F5qnRpY2tiYXNlXzYQqm1vZGlmaWVyXzYAp2RlbGF5XzMCqnRpY2tiYXNlXzcGr21vZGlmaWVyX29mZnNldAGnZGVsYXlfOAKqbW9kaWZpZXJfNwCwbW9kaWZpZXJfb3B0aW9uc4KpcmFuZG9taXplw6dzbGlkZXJzAqptb2RpZmllcl8zALB0aWNrYmFzZV9zbGlkZXJzCKptb2RpZmllcl81AKptb2RpZmllcl84AKh5YXdfbW9kZQKqdGlja2Jhc2VfMg+ydGlja2Jhc2VfcmFuZG9taXplw6p0aWNrYmFzZV84C94AJ6xib2R5X29wdGlvbnOPqmxpbWl0X3R5cGWlVGlja3OxdHlwZV9yYW5kb21fdmFsdWUGqGludmVydGVywqlsaW1pdF9taW46qmxlZnRfbGltaXQ6pmppdHRlcsOrcmlnaHRfbGltaXQ6rGxpbWl0X3RpbWluZwmsZnJlZXN0YW5kaW5nqERpc2FibGVkrGxpbWl0X3RpY2tfbDqkdHlwZaVUaWNrc6xsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUGqWxpbWl0X21heDqmbWFzdGVyAKh0aWNrYmFzZalOZXZlcmxvc2WnZGVsYXlfMQ+nZGVsYXlfMhSkYm9kecOnZGVsYXlfNAKnZGVsYXlfNQKnZGVsYXlfNgKnZGVsYXlfNwKudGlja2Jhc2VfY2hva2UQsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0qm1vZGlmaWVyXzECrXRpY2tiYXNlX3JuZG0Pr3RpY2tiYXNlX3JuZG1fMhCqbW9kaWZpZXJfMhuqdGlja2Jhc2VfMQ+ueWF3X29wdGlvbnNfZXiFpWRlbGF5w6xvZmZzZXRfcmlnaHQsq29mZnNldF9sZWZ00NqtZGVsYXlfc2xpZGVycwGmbWFzdGVyAap0aWNrYmFzZV8zEKptb2RpZmllcl80AKp0aWNrYmFzZV80D6p5YXdfb2Zmc2V0AKp0aWNrYmFzZV81D6htb2RpZmllcqUzLVdheap0aWNrYmFzZV82D6ptb2RpZmllcl82AKdkZWxheV8zAqp0aWNrYmFzZV83D69tb2RpZmllcl9vZmZzZXQBp2RlbGF5XzgCqm1vZGlmaWVyXzcAsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcOnc2xpZGVycwKqbW9kaWZpZXJfMwCwdGlja2Jhc2Vfc2xpZGVycwOqbW9kaWZpZXJfNQCqbW9kaWZpZXJfOACoeWF3X21vZGUCqnRpY2tiYXNlXzIQsnRpY2tiYXNlX3JhbmRvbWl6ZcOqdGlja2Jhc2VfOBCS3gAnrGJvZHlfb3B0aW9uc4+qbGltaXRfdHlwZaVUaWNrc7F0eXBlX3JhbmRvbV92YWx1ZRCoaW52ZXJ0ZXLCqWxpbWl0X21pbjCqbGVmdF9saW1pdDumaml0dGVyw6tyaWdodF9saW1pdDusbGltaXRfdGltaW5nA6xmcmVlc3RhbmRpbmeoRGlzYWJsZWSsbGltaXRfdGlja19sOqR0eXBlplN0YXRpY6xsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUQqWxpbWl0X21heDqmbWFzdGVyAah0aWNrYmFzZaZOeWFuemGnZGVsYXlfMQmnZGVsYXlfMgqkYm9kecOnZGVsYXlfNA6nZGVsYXlfNRSnZGVsYXlfNgynZGVsYXlfNwKudGlja2Jhc2VfY2hva2UQsnRpY2tiYXNlX3JuZG1fdHlwZaRXYXlzqm1vZGlmaWVyXzHQzq10aWNrYmFzZV9ybmRtAq90aWNrYmFzZV9ybmRtXzIWqm1vZGlmaWVyXzLqqnRpY2tiYXNlXzEDrnlhd19vcHRpb25zX2V4haVkZWxhecOsb2Zmc2V0X3JpZ2h0JKtvZmZzZXRfbGVmdOatZGVsYXlfc2xpZGVycwambWFzdGVyAap0aWNrYmFzZV8zD6ptb2RpZmllcl805Kp0aWNrYmFzZV80Aqp5YXdfb2Zmc2V0AKp0aWNrYmFzZV81BKhtb2RpZmllcqU1LVdheap0aWNrYmFzZV82B6ptb2RpZmllcl82EKdkZWxheV8zEap0aWNrYmFzZV83CK9tb2RpZmllcl9vZmZzZXQKp2RlbGF5XzgCqm1vZGlmaWVyXzcssG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcKnc2xpZGVycwKqbW9kaWZpZXJfM+ywdGlja2Jhc2Vfc2xpZGVycwaqbW9kaWZpZXJfNfyqbW9kaWZpZXJfOOqoeWF3X21vZGUCqnRpY2tiYXNlXzICsnRpY2tiYXNlX3JhbmRvbWl6ZcOqdGlja2Jhc2VfOAfeACesYm9keV9vcHRpb25zj6psaW1pdF90eXBlpVRpY2tzsXR5cGVfcmFuZG9tX3ZhbHVlEKhpbnZlcnRlcsKpbGltaXRfbWluMKpsZWZ0X2xpbWl0O6ZqaXR0ZXLDq3JpZ2h0X2xpbWl0O6xsaW1pdF90aW1pbmcDrGZyZWVzdGFuZGluZ6hEaXNhYmxlZKxsaW1pdF90aWNrX2wcpHR5cGWmU3RhdGljrGxpbWl0X3RpY2tfcjqwdHlwZV90aWNrc192YWx1ZRCpbGltaXRfbWF4OqZtYXN0ZXIBqHRpY2tiYXNlpk55YW56YadkZWxheV8xBadkZWxheV8yCqRib2R5w6dkZWxheV80DqdkZWxheV81CqdkZWxheV82DKdkZWxheV83Aq50aWNrYmFzZV9jaG9rZRCydGlja2Jhc2Vfcm5kbV90eXBlpFdheXOqbW9kaWZpZXJfMdDOrXRpY2tiYXNlX3JuZG0Cr3RpY2tiYXNlX3JuZG1fMhaqbW9kaWZpZXJfMuqqdGlja2Jhc2VfMQOueWF3X29wdGlvbnNfZXiFpWRlbGF5w6xvZmZzZXRfcmlnaHQrq29mZnNldF9sZWZ04q1kZWxheV9zbGlkZXJzBqZtYXN0ZXIAqnRpY2tiYXNlXzMPqm1vZGlmaWVyXzTkqnRpY2tiYXNlXzQCqnlhd19vZmZzZXQAqnRpY2tiYXNlXzUEqG1vZGlmaWVypTUtV2F5qnRpY2tiYXNlXzYHqm1vZGlmaWVyXzYQp2RlbGF5XzMIqnRpY2tiYXNlXzcPr21vZGlmaWVyX29mZnNldAqnZGVsYXlfOAKqbW9kaWZpZXJfNyywbW9kaWZpZXJfb3B0aW9uc4KpcmFuZG9taXplwqdzbGlkZXJzAqptb2RpZmllcl8z7LB0aWNrYmFzZV9zbGlkZXJzBqptb2RpZmllcl81/Kptb2RpZmllcl846qh5YXdfbW9kZQKqdGlja2Jhc2VfMgKydGlja2Jhc2VfcmFuZG9taXplw6p0aWNrYmFzZV84D5LeACesYm9keV9vcHRpb25zj6psaW1pdF90eXBlpVRpY2tzsXR5cGVfcmFuZG9tX3ZhbHVlEKhpbnZlcnRlcsKpbGltaXRfbWluOqpsZWZ0X2xpbWl0O6ZqaXR0ZXLDq3JpZ2h0X2xpbWl0O6xsaW1pdF90aW1pbmcDrGZyZWVzdGFuZGluZ6hEaXNhYmxlZKxsaW1pdF90aWNrX2w6pHR5cGWmU3RhdGljrGxpbWl0X3RpY2tfcjqwdHlwZV90aWNrc192YWx1ZRCpbGltaXRfbWF4OqZtYXN0ZXIBqHRpY2tiYXNlpk55YW56YadkZWxheV8xBqdkZWxheV8yA6Rib2R5w6dkZWxheV80CKdkZWxheV81DadkZWxheV82E6dkZWxheV83Aq50aWNrYmFzZV9jaG9rZRCydGlja2Jhc2Vfcm5kbV90eXBlpFdheXOqbW9kaWZpZXJfMfutdGlja2Jhc2Vfcm5kbQKvdGlja2Jhc2Vfcm5kbV8yFqptb2RpZmllcl8yBap0aWNrYmFzZV8xD655YXdfb3B0aW9uc19leIWlZGVsYXnDrG9mZnNldF9yaWdodCOrb2Zmc2V0X2xlZnTqrWRlbGF5X3NsaWRlcnMBpm1hc3RlcgCqdGlja2Jhc2VfMwKqbW9kaWZpZXJfNP+qdGlja2Jhc2VfNASqeWF3X29mZnNldACqdGlja2Jhc2VfNQ6obW9kaWZpZXKkU3Bpbqp0aWNrYmFzZV82D6ptb2RpZmllcl82+adkZWxheV8zAap0aWNrYmFzZV83Da9tb2RpZmllcl9vZmZzZXQFp2RlbGF5XzgCqm1vZGlmaWVyXzcAsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcKnc2xpZGVycwKqbW9kaWZpZXJfM/6wdGlja2Jhc2Vfc2xpZGVycwaqbW9kaWZpZXJfNQKqbW9kaWZpZXJfOACoeWF3X21vZGUCqnRpY2tiYXNlXzICsnRpY2tiYXNlX3JhbmRvbWl6ZcOqdGlja2Jhc2VfOAreACesYm9keV9vcHRpb25zj6psaW1pdF90eXBlpVRpY2tzsXR5cGVfcmFuZG9tX3ZhbHVlEKhpbnZlcnRlcsKpbGltaXRfbWluOqpsZWZ0X2xpbWl0O6ZqaXR0ZXLDq3JpZ2h0X2xpbWl0O6xsaW1pdF90aW1pbmcDrGZyZWVzdGFuZGluZ6hEaXNhYmxlZKxsaW1pdF90aWNrX2wcpHR5cGWmU3RhdGljrGxpbWl0X3RpY2tfcjqwdHlwZV90aWNrc192YWx1ZRCpbGltaXRfbWF4OqZtYXN0ZXIBqHRpY2tiYXNlpk55YW56YadkZWxheV8xBqdkZWxheV8yA6Rib2R5w6dkZWxheV80CKdkZWxheV81DadkZWxheV82E6dkZWxheV83Aq50aWNrYmFzZV9jaG9rZRCydGlja2Jhc2Vfcm5kbV90eXBlpFdheXOqbW9kaWZpZXJfMfutdGlja2Jhc2Vfcm5kbQKvdGlja2Jhc2Vfcm5kbV8yFqptb2RpZmllcl8yBap0aWNrYmFzZV8xD655YXdfb3B0aW9uc19leIWlZGVsYXnDrG9mZnNldF9yaWdodCOrb2Zmc2V0X2xlZnT1rWRlbGF5X3NsaWRlcnMBpm1hc3RlcgCqdGlja2Jhc2VfMwKqbW9kaWZpZXJfNP+qdGlja2Jhc2VfNASqeWF3X29mZnNldACqdGlja2Jhc2VfNQ6obW9kaWZpZXKkU3Bpbqp0aWNrYmFzZV82C6ptb2RpZmllcl82+adkZWxheV8zAap0aWNrYmFzZV83A69tb2RpZmllcl9vZmZzZXQFp2RlbGF5XzgCqm1vZGlmaWVyXzcAsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcKnc2xpZGVycwKqbW9kaWZpZXJfM/6wdGlja2Jhc2Vfc2xpZGVycweqbW9kaWZpZXJfNQKqbW9kaWZpZXJfOACoeWF3X21vZGUCqnRpY2tiYXNlXzICsnRpY2tiYXNlX3JhbmRvbWl6ZcOqdGlja2Jhc2VfOA+S3gAnrGJvZHlfb3B0aW9uc4+qbGltaXRfdHlwZaVUaWNrc7F0eXBlX3JhbmRvbV92YWx1ZQSoaW52ZXJ0ZXLCqWxpbWl0X21pbhyqbGVmdF9saW1pdDymaml0dGVyw6tyaWdodF9saW1pdDysbGltaXRfdGltaW5nCKxmcmVlc3RhbmRpbmeoRGlzYWJsZWSsbGltaXRfdGlja19sOqR0eXBlplN0YXRpY6xsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUEqWxpbWl0X21heDqmbWFzdGVyAah0aWNrYmFzZaZOeWFuemGnZGVsYXlfMQSnZGVsYXlfMgWkYm9kecOnZGVsYXlfNA2nZGVsYXlfNQinZGVsYXlfNginZGVsYXlfNwSudGlja2Jhc2VfY2hva2UQsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0qm1vZGlmaWVyXzEArXRpY2tiYXNlX3JuZG0Cr3RpY2tiYXNlX3JuZG1fMhaqbW9kaWZpZXJfMgaqdGlja2Jhc2VfMQ+ueWF3X29wdGlvbnNfZXiFpWRlbGF5wqxvZmZzZXRfcmlnaHQbq29mZnNldF9sZWZ0561kZWxheV9zbGlkZXJzAqZtYXN0ZXIAqnRpY2tiYXNlXzMCqm1vZGlmaWVyXzQAqnRpY2tiYXNlXzQDqnlhd19vZmZzZXQAqnRpY2tiYXNlXzUFqG1vZGlmaWVypTMtV2F5qnRpY2tiYXNlXzYOqm1vZGlmaWVyXzYAp2RlbGF5XzMOqnRpY2tiYXNlXzcFr21vZGlmaWVyX29mZnNldAqnZGVsYXlfOBGqbW9kaWZpZXJfNwCwbW9kaWZpZXJfb3B0aW9uc4KpcmFuZG9taXplwqdzbGlkZXJzAqptb2RpZmllcl8zALB0aWNrYmFzZV9zbGlkZXJzBqptb2RpZmllcl81AKptb2RpZmllcl84AKh5YXdfbW9kZQKqdGlja2Jhc2VfMgeydGlja2Jhc2VfcmFuZG9taXplw6p0aWNrYmFzZV84At4AJ6xib2R5X29wdGlvbnOPqmxpbWl0X3R5cGWlVGlja3OxdHlwZV9yYW5kb21fdmFsdWUQqGludmVydGVywqlsaW1pdF9taW4cqmxlZnRfbGltaXQ8pmppdHRlcsOrcmlnaHRfbGltaXQ8rGxpbWl0X3RpbWluZw6sZnJlZXN0YW5kaW5np0RlZmF1bHSsbGltaXRfdGlja19sHKR0eXBlplN0YXRpY6xsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUQqWxpbWl0X21heDqmbWFzdGVyAah0aWNrYmFzZalOZXZlcmxvc2WnZGVsYXlfMQKnZGVsYXlfMhSkYm9kecOnZGVsYXlfNAOnZGVsYXlfNQqnZGVsYXlfNgWnZGVsYXlfNwKudGlja2Jhc2VfY2hva2UQsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0qm1vZGlmaWVyXzEArXRpY2tiYXNlX3JuZG0Cr3RpY2tiYXNlX3JuZG1fMhaqbW9kaWZpZXJfMgCqdGlja2Jhc2VfMQKueWF3X29wdGlvbnNfZXiFpWRlbGF5w6xvZmZzZXRfcmlnaHQAq29mZnNldF9sZWZ0AK1kZWxheV9zbGlkZXJzAaZtYXN0ZXIBqnRpY2tiYXNlXzMPqm1vZGlmaWVyXzQAqnRpY2tiYXNlXzQQqnlhd19vZmZzZXQAqnRpY2tiYXNlXzUQqG1vZGlmaWVyqERpc2FibGVkqnRpY2tiYXNlXzYPqm1vZGlmaWVyXzYAp2RlbGF5XzMCqnRpY2tiYXNlXzcQr21vZGlmaWVyX29mZnNldP+nZGVsYXlfOAKqbW9kaWZpZXJfNwCwbW9kaWZpZXJfb3B0aW9uc4KpcmFuZG9taXplwqdzbGlkZXJzA6ptb2RpZmllcl8zALB0aWNrYmFzZV9zbGlkZXJzA6ptb2RpZmllcl81AKptb2RpZmllcl84AKh5YXdfbW9kZQGqdGlja2Jhc2VfMhaydGlja2Jhc2VfcmFuZG9taXplw6p0aWNrYmFzZV84D5LeACesYm9keV9vcHRpb25zj6psaW1pdF90eXBlpVRpY2tzsXR5cGVfcmFuZG9tX3ZhbHVlBKhpbnZlcnRlcsKpbGltaXRfbWluOqpsZWZ0X2xpbWl0PKZqaXR0ZXLDq3JpZ2h0X2xpbWl0PKxsaW1pdF90aW1pbmcOrGZyZWVzdGFuZGluZ6hEaXNhYmxlZKxsaW1pdF90aWNrX2wcpHR5cGWmU3RhdGljrGxpbWl0X3RpY2tfcjqwdHlwZV90aWNrc192YWx1ZQSpbGltaXRfbWF4OqZtYXN0ZXIBqHRpY2tiYXNlpk55YW56YadkZWxheV8xBqdkZWxheV8yDKRib2R5w6dkZWxheV80AadkZWxheV81BadkZWxheV82A6dkZWxheV83Aq50aWNrYmFzZV9jaG9rZRCydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSqbW9kaWZpZXJfMf6tdGlja2Jhc2Vfcm5kbQKvdGlja2Jhc2Vfcm5kbV8yFqptb2RpZmllcl8yBap0aWNrYmFzZV8xBK55YXdfb3B0aW9uc19leIWlZGVsYXnDrG9mZnNldF9yaWdodDGrb2Zmc2V0X2xlZnTqrWRlbGF5X3NsaWRlcnMCpm1hc3RlcgGqdGlja2Jhc2VfMwaqbW9kaWZpZXJfNACqdGlja2Jhc2VfNAKqeWF3X29mZnNldACqdGlja2Jhc2VfNQyobW9kaWZpZXKlNS1XYXmqdGlja2Jhc2VfNgeqbW9kaWZpZXJfNgCnZGVsYXlfMxSqdGlja2Jhc2VfNwKvbW9kaWZpZXJfb2Zmc2V0+qdkZWxheV84Aqptb2RpZmllcl83ALBtb2RpZmllcl9vcHRpb25zgqlyYW5kb21pemXCp3NsaWRlcnMDqm1vZGlmaWVyXzMAsHRpY2tiYXNlX3NsaWRlcnMIqm1vZGlmaWVyXzUAqm1vZGlmaWVyXzgAqHlhd19tb2RlAqp0aWNrYmFzZV8yCbJ0aWNrYmFzZV9yYW5kb21pemXDqnRpY2tiYXNlXzgJ3gAnrGJvZHlfb3B0aW9uc4+qbGltaXRfdHlwZaVUaWNrc7F0eXBlX3JhbmRvbV92YWx1ZQSoaW52ZXJ0ZXLCqWxpbWl0X21pbjqqbGVmdF9saW1pdDymaml0dGVyw6tyaWdodF9saW1pdDysbGltaXRfdGltaW5nAaxmcmVlc3RhbmRpbmeoRGlzYWJsZWSsbGltaXRfdGlja19sHKR0eXBlplN0YXRpY6xsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUEqWxpbWl0X21heDqmbWFzdGVyAah0aWNrYmFzZalOZXZlcmxvc2WnZGVsYXlfMQKnZGVsYXlfMhSkYm9kecOnZGVsYXlfNAGnZGVsYXlfNQWnZGVsYXlfNgOnZGVsYXlfNwKudGlja2Jhc2VfY2hva2UQsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0qm1vZGlmaWVyXzH/rXRpY2tiYXNlX3JuZG0Cr3RpY2tiYXNlX3JuZG1fMhaqbW9kaWZpZXJfMgGqdGlja2Jhc2VfMQKueWF3X29wdGlvbnNfZXiFpWRlbGF5wqxvZmZzZXRfcmlnaHQoq29mZnNldF9sZWZ08K1kZWxheV9zbGlkZXJzBqZtYXN0ZXIAqnRpY2tiYXNlXzMQqm1vZGlmaWVyXzT7qnRpY2tiYXNlXzQPqnlhd19vZmZzZXQAqnRpY2tiYXNlXzUPqG1vZGlmaWVyqERpc2FibGVkqnRpY2tiYXNlXzYQqm1vZGlmaWVyXzYbp2RlbGF5XzMUqnRpY2tiYXNlXzcQr21vZGlmaWVyX29mZnNldACnZGVsYXlfOAKqbW9kaWZpZXJfNwCwbW9kaWZpZXJfb3B0aW9uc4KpcmFuZG9taXplwqdzbGlkZXJzA6ptb2RpZmllcl8z0M+wdGlja2Jhc2Vfc2xpZGVycwOqbW9kaWZpZXJfNRqqbW9kaWZpZXJfOACoeWF3X21vZGUCqnRpY2tiYXNlXzIWsnRpY2tiYXNlX3JhbmRvbWl6ZcOqdGlja2Jhc2VfOBCS3gAnrGJvZHlfb3B0aW9uc4+qbGltaXRfdHlwZaZTdGF0aWOxdHlwZV9yYW5kb21fdmFsdWUEqGludmVydGVywqlsaW1pdF9taW4AqmxlZnRfbGltaXQ8pmppdHRlcsOrcmlnaHRfbGltaXQ8rGxpbWl0X3RpbWluZwKsZnJlZXN0YW5kaW5np0RlZmF1bHSsbGltaXRfdGlja19sOqR0eXBlplN0YXRpY6xsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUEqWxpbWl0X21heDymbWFzdGVyAKh0aWNrYmFzZalOZXZlcmxvc2WnZGVsYXlfMRCnZGVsYXlfMgekYm9kecOnZGVsYXlfNAKnZGVsYXlfNQKnZGVsYXlfNgKnZGVsYXlfNwKudGlja2Jhc2VfY2hva2UQsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0qm1vZGlmaWVyXzEErXRpY2tiYXNlX3JuZG0Pr3RpY2tiYXNlX3JuZG1fMhCqbW9kaWZpZXJfMvyqdGlja2Jhc2VfMQ+ueWF3X29wdGlvbnNfZXiFpWRlbGF5wqxvZmZzZXRfcmlnaHQAq29mZnNldF9sZWZ0AK1kZWxheV9zbGlkZXJzBaZtYXN0ZXIAqnRpY2tiYXNlXzMPqm1vZGlmaWVyXzQAqnRpY2tiYXNlXzQQqnlhd19vZmZzZXQAqnRpY2tiYXNlXzUQqG1vZGlmaWVyqERpc2FibGVkqnRpY2tiYXNlXzYPqm1vZGlmaWVyXzYAp2RlbGF5XzMCqnRpY2tiYXNlXzcQr21vZGlmaWVyX29mZnNldP+nZGVsYXlfOAKqbW9kaWZpZXJfNwCwbW9kaWZpZXJfb3B0aW9uc4KpcmFuZG9taXplwqdzbGlkZXJzBaptb2RpZmllcl8zALB0aWNrYmFzZV9zbGlkZXJzA6ptb2RpZmllcl81AKptb2RpZmllcl84AKh5YXdfbW9kZQKqdGlja2Jhc2VfMhCydGlja2Jhc2VfcmFuZG9taXplw6p0aWNrYmFzZV84D94AJ6xib2R5X29wdGlvbnOPqmxpbWl0X3R5cGWmU3RhdGljsXR5cGVfcmFuZG9tX3ZhbHVlBKhpbnZlcnRlcsKpbGltaXRfbWluAKpsZWZ0X2xpbWl0PKZqaXR0ZXLDq3JpZ2h0X2xpbWl0PKxsaW1pdF90aW1pbmcCrGZyZWVzdGFuZGluZ6dEZWZhdWx0rGxpbWl0X3RpY2tfbDqkdHlwZaZTdGF0aWOsbGltaXRfdGlja19yOrB0eXBlX3RpY2tzX3ZhbHVlBKlsaW1pdF9tYXg8pm1hc3RlcgCodGlja2Jhc2WpTmV2ZXJsb3Nlp2RlbGF5XzEQp2RlbGF5XzIHpGJvZHnDp2RlbGF5XzQCp2RlbGF5XzUCp2RlbGF5XzYCp2RlbGF5XzcCrnRpY2tiYXNlX2Nob2tlELJ0aWNrYmFzZV9ybmRtX3R5cGWnRGVmYXVsdKptb2RpZmllcl8xBK10aWNrYmFzZV9ybmRtD690aWNrYmFzZV9ybmRtXzIQqm1vZGlmaWVyXzL8qnRpY2tiYXNlXzEPrnlhd19vcHRpb25zX2V4haVkZWxhecKsb2Zmc2V0X3JpZ2h0AKtvZmZzZXRfbGVmdACtZGVsYXlfc2xpZGVycwWmbWFzdGVyAKp0aWNrYmFzZV8zD6ptb2RpZmllcl80AKp0aWNrYmFzZV80D6p5YXdfb2Zmc2V0AKp0aWNrYmFzZV81EKhtb2RpZmllcqhEaXNhYmxlZKp0aWNrYmFzZV82D6ptb2RpZmllcl82AKdkZWxheV8zAqp0aWNrYmFzZV83EK9tb2RpZmllcl9vZmZzZXT/p2RlbGF5XzgCqm1vZGlmaWVyXzcAsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcKnc2xpZGVycwWqbW9kaWZpZXJfMwCwdGlja2Jhc2Vfc2xpZGVycwOqbW9kaWZpZXJfNQCqbW9kaWZpZXJfOACoeWF3X21vZGUCqnRpY2tiYXNlXzIQsnRpY2tiYXNlX3JhbmRvbWl6ZcOqdGlja2Jhc2VfOA+S3gAnrGJvZHlfb3B0aW9uc4+qbGltaXRfdHlwZaZTdGF0aWOxdHlwZV9yYW5kb21fdmFsdWUEqGludmVydGVywqlsaW1pdF9taW46qmxlZnRfbGltaXQ8pmppdHRlcsOrcmlnaHRfbGltaXQ8rGxpbWl0X3RpbWluZwKsZnJlZXN0YW5kaW5np0RlZmF1bHSsbGltaXRfdGlja19sOqR0eXBlplN0YXRpY6xsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUEqWxpbWl0X21heDqmbWFzdGVyAah0aWNrYmFzZalOZXZlcmxvc2WnZGVsYXlfMQKnZGVsYXlfMhSkYm9kecOnZGVsYXlfNAKnZGVsYXlfNQKnZGVsYXlfNgKnZGVsYXlfNwKudGlja2Jhc2VfY2hva2UQsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0qm1vZGlmaWVyXzEArXRpY2tiYXNlX3JuZG0Pr3RpY2tiYXNlX3JuZG1fMhCqbW9kaWZpZXJfMgCqdGlja2Jhc2VfMQ+ueWF3X29wdGlvbnNfZXiFpWRlbGF5wqxvZmZzZXRfcmlnaHQAq29mZnNldF9sZWZ0AK1kZWxheV9zbGlkZXJzA6ZtYXN0ZXIAqnRpY2tiYXNlXzMPqm1vZGlmaWVyXzQAqnRpY2tiYXNlXzQPqnlhd19vZmZzZXQAqnRpY2tiYXNlXzUPqG1vZGlmaWVyqERpc2FibGVkqnRpY2tiYXNlXzYQqm1vZGlmaWVyXzYAp2RlbGF5XzMCqnRpY2tiYXNlXzcPr21vZGlmaWVyX29mZnNldACnZGVsYXlfOAKqbW9kaWZpZXJfNwCwbW9kaWZpZXJfb3B0aW9uc4KpcmFuZG9taXplwqdzbGlkZXJzA6ptb2RpZmllcl8zALB0aWNrYmFzZV9zbGlkZXJzA6ptb2RpZmllcl81AKptb2RpZmllcl84AKh5YXdfbW9kZQGqdGlja2Jhc2VfMhCydGlja2Jhc2VfcmFuZG9taXplw6p0aWNrYmFzZV84EN4AJ6xib2R5X29wdGlvbnOPqmxpbWl0X3R5cGWmU3RhdGljsXR5cGVfcmFuZG9tX3ZhbHVlBKhpbnZlcnRlcsKpbGltaXRfbWluOqpsZWZ0X2xpbWl0PKZqaXR0ZXLDq3JpZ2h0X2xpbWl0PKxsaW1pdF90aW1pbmcCrGZyZWVzdGFuZGluZ6dEZWZhdWx0rGxpbWl0X3RpY2tfbDqkdHlwZaZTdGF0aWOsbGltaXRfdGlja19yOrB0eXBlX3RpY2tzX3ZhbHVlBKlsaW1pdF9tYXg6pm1hc3RlcgGodGlja2Jhc2WpTmV2ZXJsb3Nlp2RlbGF5XzECp2RlbGF5XzIUpGJvZHnDp2RlbGF5XzQCp2RlbGF5XzUCp2RlbGF5XzYCp2RlbGF5XzcCrnRpY2tiYXNlX2Nob2tlELJ0aWNrYmFzZV9ybmRtX3R5cGWnRGVmYXVsdKptb2RpZmllcl8xAK10aWNrYmFzZV9ybmRtD690aWNrYmFzZV9ybmRtXzIQqm1vZGlmaWVyXzIAqnRpY2tiYXNlXzEPrnlhd19vcHRpb25zX2V4haVkZWxhecKsb2Zmc2V0X3JpZ2h0AKtvZmZzZXRfbGVmdACtZGVsYXlfc2xpZGVycwOmbWFzdGVyAKp0aWNrYmFzZV8zD6ptb2RpZmllcl80AKp0aWNrYmFzZV80D6p5YXdfb2Zmc2V0AKp0aWNrYmFzZV81D6htb2RpZmllcqhEaXNhYmxlZKp0aWNrYmFzZV82D6ptb2RpZmllcl82AKdkZWxheV8zAqp0aWNrYmFzZV83D69tb2RpZmllcl9vZmZzZXQAp2RlbGF5XzgCqm1vZGlmaWVyXzcAsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcKnc2xpZGVycwOqbW9kaWZpZXJfMwCwdGlja2Jhc2Vfc2xpZGVycwOqbW9kaWZpZXJfNQCqbW9kaWZpZXJfOACoeWF3X21vZGUBqnRpY2tiYXNlXzIQsnRpY2tiYXNlX3JhbmRvbWl6ZcOqdGlja2Jhc2VfOA/eACenbGVhbmluZwCnZmFsbGluZwCoY2xhbl90YWfDp3dhbGtpbmcAs2NsaWVudHNpZGVfbmlja25hbWXCrm5vX2ZhbGxfZGFtYWdlw7xhbGxvd19sZWFuaW5nX3doaWxlX3N0YW5kaW5nwqtmYXN0X2xhZGRlcsOqZWFydGhxdWFrZcKydW5sb2NrX2Zha2VsYXRlbmN5w61hcnJvd3NfYWNjZW50qSNFM0I3RDlFNLBmb3JjZV90ZWFtYWltYm90wqthcnJvd3NfZm9udKRCb2xks2ZyZWV6ZXRpbWVfZmFrZWR1Y2vDrmFycm93c19mb3J3YXJkoV6wZGFtYWdlX2luZGljYXRvcsOrYXJyb3dzX2xlZnShPKpoaXRtYXJrZXJzk6lTY3JlZW4gMkSoV29ybGQgM0ShfrB+Y3VzdG9tX2Zha2VkdWNrgaVzY2FsZcyWrX5jdXN0b21fc2NvcGWFp3JvdGF0ZWTCpHNpemXNASyrbWFpbl9hY2NlbnSpI0ZGRkZGRjhGo2dhcAqrZWRnZV9hY2NlbnSpI0ZGRkZGRjAwuH5rZWVwX21vZGVsX3RyYW5zcGFyZW5jeYGlc2NhbGUKpmFkZG9uc5a0RGlzYWJsZSBmb290IHNoYWRvd3O6RGlzYWJsZSB1c2Ugb3BlbnMgYnV5IG1lbnW8Q2xlYXIgY29uc29sZSBvbiByb3VuZCBzdGFydK1Qcm9wZXIgc2t5Ym94t0Rpc2FibGUgcmFnZG9sbCBwaHlzaWNzoX6pdmlld21vZGVsiKlsZWZ0X2hhbmTCpmF4aXNfefCjZm92QqZheGlzX3oCqnJpZ2h0X2hhbmTCqW1haW5faGFuZKRMZWZ0qWNzY29fcm9sbMKmYXhpc1947KxzY3JlZW5fY29sb3KpI0ZGRkZGRkZGr3NjcmVlbl9kdXJhdGlvbgerd29ybGRfY29sb3KTplNpbXBsZakjRkZGRkZGOUKhfq53b3JsZF9kdXJhdGlvbgqrd2Fsa2luZ19kaXIyrXdhbGtpbmdfZGlyXzIAr2N1c3RvbV9mYWtlZHVja8Omc2t5Ym94pU5pZ2h0tH5jbGllbnRzaWRlX25pY2tuYW1lgaVpbnB1dKhsYWdzaWdodKpsb2dfZXZlbnRzha1wcmVmaXhfYWNjZW50qSNGRkZGRkZGRqlwdXJjaGFzZXPDpnByZWZpeKJucKttYWluX2FjY2VudKkjRkZGRkZGRkasZGFtYWdlX2RlYWx0w61tYW51YWxfYXJyb3dzw6thc3BlY3RyYXRpb4Glc2NhbGV9rGN1c3RvbV9zY29wZcOtaW50ZXJwb2xhdGluZwmsYXJyb3dzX3JpZ2h0oT63a2VlcF9tb2RlbF90cmFuc3BhcmVuY3nD";
        end;
        if not v35.database[l_pui_0.string("\v\226\128\162  \rSnapper")] or #v35.database == 0 then
            v35.database[l_pui_0.string("\v\226\128\162  \rSnapper")] = "lIalYWJvdXQCsXdhdGVybWFya19vcHRpb25zjattYWluX2FjY2VudKkjRkZGRkZGNDmvZ3JhZGllbnRfc3dpdGNowqVsYWJlbKhzbmFwc2hvdLNncmFkaWVudF9zYXR1cmF0aW9uAKVwb3Nfec0EJLBncmFkaWVudF9yYWluYm93wqVwb3NfeM0DwKxncmFkaWVudF9odWUArmdyYWRpZW50X3NwZWVkAa1wcmVmaXhfYWNjZW50qSNDQkNCRjZGRqRmb250pEJvbGSucG9zdGZpeF9hY2NlbnSpI0ZGRkZGRkZGpm1hc3RlcgCrcHJlc2V0X2xpc3QItHByb2dyZXNzX3ZlcnNpb25fYmFyAaxwcmVzZXRfaW5wdXSnU25hcHBlcq5hY3RpdmVfc2NyaXB0cwGLrmZvcmNlX2JyZWFrX2xjmtkmB3tMaW5rIEFjdGl2ZX3vhoMgICAgIAdERUZBVUxUU3RhbmRpbmfZJAd7TGluayBBY3RpdmV975yMICAgIAdERUZBVUxUUnVubmluZ9klB3tMaW5rIEFjdGl2ZX3vlZQgICAgIAdERUZBVUxUU2xvd2luZ9klB3tMaW5rIEFjdGl2ZX3vhpMgICAHREVGQVVMVENyb3VjaGluZ9klB3tMaW5rIEFjdGl2ZX3ui44gICAgB0RFRkFVTFRTbmVha2luZ9kgB3tMaW5rIEFjdGl2ZX3ulYYgICAgB0RFRkFVTFRBaXLZKAd7TGluayBBY3RpdmV97pWHICAHREVGQVVMVEFpciBDcm91Y2hpbmfZKAd7TGluayBBY3RpdmV97pOBICAgB0RFRkFVTFRGcmVlc3RhbmRpbmfZIgd7TGluayBBY3RpdmV974G5ICAHREVGQVVMVE1hbnVhbHOhfqpoaWRlX3Nob3RzqEJyZWFrIExDrGZyZWVzdGFuZGluZ8Ktb3B0aW9uc190YWJsZYutZmFrZV9sYWdfdHlwZalBbHdheXMgb26mdHdlYWtzkaF+rHR3ZWFrc19zcGVlZAGuYXZvaWRfYmFja3N0YWLDrHR3ZWFrc19waXRjaKhEaXNhYmxlZKlzYWZlX2hlYWSU2SYHe0xpbmsgQWN0aXZlfe+GgyAgICAgB0RFRkFVTFRTdGFuZGluZ9laB3tMaW5rIEFjdGl2ZX3vhpMgICAHREVGQVVMVENyb3VjaGluZyAgB3tTbWFsbCBUZXh0fSsgIAd7TGluayBBY3RpdmV97ouOICAHREVGQVVMVFNuZWFraW5n2U0He0xpbmsgQWN0aXZlfe6VhyAgB0RFRkFVTFRBaXIgQ3JvdWNoaW5nICAHe1NtYWxsIFRleHR9KyAgB0RFRkFVTFRLbmlmZS9UYXNlcqF+r3R3ZWFrc195YXdfdHlwZaRTcGlus3R3ZWFrc19yaWdodF9vZmZzZXQesnR3ZWFrc19sZWZ0X29mZnNldOKoZmFrZV9sYWfCrHR3ZWFrc19yYW5nZcy0p2JvZHlfZnPDpnN0YXRlcwepZGlzYWJsZXJzkaF+tGZyZWVzdGFuZGluZ19hbGxvd2Vkw6ptYW51YWxfeWF3qERpc2FibGVksmRpc2FibGVfbGNfZ3JlbmFkZcOldGVhbXMBmZLeACeqbW9kaWZpZXJfMdC4qHRpY2tiYXNlqU5ldmVybG9zZap0aWNrYmFzZV8zEKptb2RpZmllcl8y0LeydGlja2Jhc2VfcmFuZG9taXplw650aWNrYmFzZV9jaG9rZRCqbW9kaWZpZXJfM9C2snRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0qm1vZGlmaWVyXzQArXRpY2tiYXNlX3JuZG0Pqm1vZGlmaWVyXzUAqnRpY2tiYXNlXzgPsHRpY2tiYXNlX3NsaWRlcnMDqm1vZGlmaWVyXzYAqm1vZGlmaWVyXzcArnlhd19vcHRpb25zX2V4hatvZmZzZXRfbGVmdOesb2Zmc2V0X3JpZ2h0KKVkZWxhecOmbWFzdGVyAa1kZWxheV9zbGlkZXJzBah5YXdfbW9kZQKqeWF3X29mZnNldAqkYm9kecOnZGVsYXlfMQWnZGVsYXlfMgWnZGVsYXlfMwGnZGVsYXlfNAGnZGVsYXlfNRSnZGVsYXlfNgKvbW9kaWZpZXJfb2Zmc2V0+6dkZWxheV84ArBtb2RpZmllcl9vcHRpb25zgqlyYW5kb21pemXDp3NsaWRlcnMDqnRpY2tiYXNlXzIQqnRpY2tiYXNlXzUQr3RpY2tiYXNlX3JuZG1fMhCqbW9kaWZpZXJfOACqdGlja2Jhc2VfNBCqdGlja2Jhc2VfNhCqdGlja2Jhc2VfNxCqdGlja2Jhc2VfMQ+nZGVsYXlfNwKobW9kaWZpZXKoRGlzYWJsZWSsYm9keV9vcHRpb25zj6ZqaXR0ZXLDqWxpbWl0X21pbh2sbGltaXRfdGltaW5nBKZtYXN0ZXIBrGxpbWl0X3RpY2tfbDqpbGltaXRfbWF4OqxsaW1pdF90aWNrX3I8sHR5cGVfdGlja3NfdmFsdWUPqmxpbWl0X3R5cGWlVGlja3OxdHlwZV9yYW5kb21fdmFsdWUPpHR5cGWmU3RhdGljqGludmVydGVywqpsZWZ0X2xpbWl0PKxmcmVlc3RhbmRpbmeoRGlzYWJsZWSrcmlnaHRfbGltaXQ83gAnqm1vZGlmaWVyXzHQuKh0aWNrYmFzZalOZXZlcmxvc2WqdGlja2Jhc2VfMw+qbW9kaWZpZXJfMtC3snRpY2tiYXNlX3JhbmRvbWl6ZcOudGlja2Jhc2VfY2hva2UQqm1vZGlmaWVyXzPQtrJ0aWNrYmFzZV9ybmRtX3R5cGWnRGVmYXVsdKptb2RpZmllcl80AK10aWNrYmFzZV9ybmRtD6ptb2RpZmllcl81AKp0aWNrYmFzZV84ELB0aWNrYmFzZV9zbGlkZXJzA6ptb2RpZmllcl82AKptb2RpZmllcl83AK55YXdfb3B0aW9uc19leIWrb2Zmc2V0X2xlZnTnrG9mZnNldF9yaWdodCilZGVsYXnDpm1hc3RlcgGtZGVsYXlfc2xpZGVycwWoeWF3X21vZGUCqnlhd19vZmZzZXQKpGJvZHnDp2RlbGF5XzEFp2RlbGF5XzIFp2RlbGF5XzMBp2RlbGF5XzQBp2RlbGF5XzUUp2RlbGF5XzYCr21vZGlmaWVyX29mZnNldPunZGVsYXlfOAKwbW9kaWZpZXJfb3B0aW9uc4KpcmFuZG9taXplw6dzbGlkZXJzA6p0aWNrYmFzZV8yEKp0aWNrYmFzZV81D690aWNrYmFzZV9ybmRtXzIQqm1vZGlmaWVyXzgAqnRpY2tiYXNlXzQPqnRpY2tiYXNlXzYPqnRpY2tiYXNlXzcQqnRpY2tiYXNlXzEPp2RlbGF5XzcCqG1vZGlmaWVyqERpc2FibGVkrGJvZHlfb3B0aW9uc4+maml0dGVyw6lsaW1pdF9taW4drGxpbWl0X3RpbWluZwSmbWFzdGVyAaxsaW1pdF90aWNrX2w6qWxpbWl0X21heDqsbGltaXRfdGlja19yPLB0eXBlX3RpY2tzX3ZhbHVlD6psaW1pdF90eXBlpVRpY2tzsXR5cGVfcmFuZG9tX3ZhbHVlD6R0eXBlplN0YXRpY6hpbnZlcnRlcsKqbGVmdF9saW1pdDysZnJlZXN0YW5kaW5nqERpc2FibGVkq3JpZ2h0X2xpbWl0PJLeACeqbW9kaWZpZXJfMdC1qHRpY2tiYXNlqU5ldmVybG9zZap0aWNrYmFzZV8zEKptb2RpZmllcl8y0LSydGlja2Jhc2VfcmFuZG9taXplw650aWNrYmFzZV9jaG9rZRCqbW9kaWZpZXJfM9CzsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0qm1vZGlmaWVyXzQArXRpY2tiYXNlX3JuZG0Pqm1vZGlmaWVyXzUAqnRpY2tiYXNlXzgQsHRpY2tiYXNlX3NsaWRlcnMDqm1vZGlmaWVyXzYAqm1vZGlmaWVyXzcArnlhd19vcHRpb25zX2V4hatvZmZzZXRfbGVmdOesb2Zmc2V0X3JpZ2h0KKVkZWxhecOmbWFzdGVyAK1kZWxheV9zbGlkZXJzBah5YXdfbW9kZQKqeWF3X29mZnNldASkYm9kecOnZGVsYXlfMQWnZGVsYXlfMgWnZGVsYXlfMwGnZGVsYXlfNAGnZGVsYXlfNQqnZGVsYXlfNgKvbW9kaWZpZXJfb2Zmc2V00K2nZGVsYXlfOAKwbW9kaWZpZXJfb3B0aW9uc4KpcmFuZG9taXplw6dzbGlkZXJzA6p0aWNrYmFzZV8yEKp0aWNrYmFzZV81EK90aWNrYmFzZV9ybmRtXzIQqm1vZGlmaWVyXzgAqnRpY2tiYXNlXzQQqnRpY2tiYXNlXzYPqnRpY2tiYXNlXzcPqnRpY2tiYXNlXzEPp2RlbGF5XzcCqG1vZGlmaWVyqERpc2FibGVkrGJvZHlfb3B0aW9uc4+maml0dGVyw6lsaW1pdF9taW4crGxpbWl0X3RpbWluZw6mbWFzdGVyAKxsaW1pdF90aWNrX2w6qWxpbWl0X21heDqsbGltaXRfdGlja19yPLB0eXBlX3RpY2tzX3ZhbHVlBKpsaW1pdF90eXBlpVRpY2tzsXR5cGVfcmFuZG9tX3ZhbHVlBKR0eXBlplN0YXRpY6hpbnZlcnRlcsKqbGVmdF9saW1pdDysZnJlZXN0YW5kaW5nqERpc2FibGVkq3JpZ2h0X2xpbWl0Ot4AJ6ptb2RpZmllcl8x0LWodGlja2Jhc2WpTmV2ZXJsb3NlqnRpY2tiYXNlXzMQqm1vZGlmaWVyXzLQtLJ0aWNrYmFzZV9yYW5kb21pemXDrnRpY2tiYXNlX2Nob2tlEKptb2RpZmllcl8z0LOydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSqbW9kaWZpZXJfNACtdGlja2Jhc2Vfcm5kbQ+qbW9kaWZpZXJfNQCqdGlja2Jhc2VfOA+wdGlja2Jhc2Vfc2xpZGVycwOqbW9kaWZpZXJfNgCqbW9kaWZpZXJfNwCueWF3X29wdGlvbnNfZXiFq29mZnNldF9sZWZ056xvZmZzZXRfcmlnaHQopWRlbGF5w6ZtYXN0ZXIArWRlbGF5X3NsaWRlcnMFqHlhd19tb2RlAqp5YXdfb2Zmc2V0BKRib2R5w6dkZWxheV8xBadkZWxheV8yBadkZWxheV8zAadkZWxheV80AadkZWxheV81CqdkZWxheV82Aq9tb2RpZmllcl9vZmZzZXTQradkZWxheV84ArBtb2RpZmllcl9vcHRpb25zgqlyYW5kb21pemXDp3NsaWRlcnMDqnRpY2tiYXNlXzIQqnRpY2tiYXNlXzUQr3RpY2tiYXNlX3JuZG1fMhCqbW9kaWZpZXJfOACqdGlja2Jhc2VfNA+qdGlja2Jhc2VfNhCqdGlja2Jhc2VfNxCqdGlja2Jhc2VfMQ+nZGVsYXlfNwKobW9kaWZpZXKoRGlzYWJsZWSsYm9keV9vcHRpb25zj6ZqaXR0ZXLDqWxpbWl0X21pbhysbGltaXRfdGltaW5nDqZtYXN0ZXIArGxpbWl0X3RpY2tfbDqpbGltaXRfbWF4OqxsaW1pdF90aWNrX3I8sHR5cGVfdGlja3NfdmFsdWUEqmxpbWl0X3R5cGWlVGlja3OxdHlwZV9yYW5kb21fdmFsdWUEpHR5cGWmU3RhdGljqGludmVydGVywqpsZWZ0X2xpbWl0PKxmcmVlc3RhbmRpbmeoRGlzYWJsZWSrcmlnaHRfbGltaXQ6kt4AJ6ptb2RpZmllcl8xAqh0aWNrYmFzZaZOeWFuemGqdGlja2Jhc2VfMxKqbW9kaWZpZXJfMhuydGlja2Jhc2VfcmFuZG9taXplw650aWNrYmFzZV9jaG9rZRCqbW9kaWZpZXJfMwCydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSqbW9kaWZpZXJfNACtdGlja2Jhc2Vfcm5kbQKqbW9kaWZpZXJfNQCqdGlja2Jhc2VfOAuwdGlja2Jhc2Vfc2xpZGVycwiqbW9kaWZpZXJfNgCqbW9kaWZpZXJfNwCueWF3X29wdGlvbnNfZXiFq29mZnNldF9sZWZ00N2sb2Zmc2V0X3JpZ2h0MqVkZWxhecOmbWFzdGVyAa1kZWxheV9zbGlkZXJzBah5YXdfbW9kZQKqeWF3X29mZnNldACkYm9kecOnZGVsYXlfMQqnZGVsYXlfMgqnZGVsYXlfMwKnZGVsYXlfNAKnZGVsYXlfNRSnZGVsYXlfNgKvbW9kaWZpZXJfb2Zmc2V0AadkZWxheV84ArBtb2RpZmllcl9vcHRpb25zgqlyYW5kb21pemXDp3NsaWRlcnMCqnRpY2tiYXNlXzIPqnRpY2tiYXNlXzUJr3RpY2tiYXNlX3JuZG1fMhaqbW9kaWZpZXJfOACqdGlja2Jhc2VfNAKqdGlja2Jhc2VfNhCqdGlja2Jhc2VfNwaqdGlja2Jhc2VfMQunZGVsYXlfNwKobW9kaWZpZXKoRGlzYWJsZWSsYm9keV9vcHRpb25zj6ZqaXR0ZXLDqWxpbWl0X21pbjqsbGltaXRfdGltaW5nCaZtYXN0ZXIArGxpbWl0X3RpY2tfbDqpbGltaXRfbWF4OqxsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUGqmxpbWl0X3R5cGWlVGlja3OxdHlwZV9yYW5kb21fdmFsdWUGpHR5cGWlVGlja3OoaW52ZXJ0ZXLCqmxlZnRfbGltaXQ6rGZyZWVzdGFuZGluZ6hEaXNhYmxlZKtyaWdodF9saW1pdDreACeqbW9kaWZpZXJfMQKodGlja2Jhc2WpTmV2ZXJsb3NlqnRpY2tiYXNlXzMQqm1vZGlmaWVyXzIbsnRpY2tiYXNlX3JhbmRvbWl6ZcOudGlja2Jhc2VfY2hva2UQqm1vZGlmaWVyXzMAsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0qm1vZGlmaWVyXzQArXRpY2tiYXNlX3JuZG0Pqm1vZGlmaWVyXzUAqnRpY2tiYXNlXzgQsHRpY2tiYXNlX3NsaWRlcnMDqm1vZGlmaWVyXzYAqm1vZGlmaWVyXzcArnlhd19vcHRpb25zX2V4hatvZmZzZXRfbGVmdNDdrG9mZnNldF9yaWdodDKlZGVsYXnDpm1hc3RlcgGtZGVsYXlfc2xpZGVycwWoeWF3X21vZGUCqnlhd19vZmZzZXQApGJvZHnDp2RlbGF5XzEKp2RlbGF5XzIKp2RlbGF5XzMCp2RlbGF5XzQCp2RlbGF5XzUUp2RlbGF5XzYCr21vZGlmaWVyX29mZnNldAGnZGVsYXlfOAKwbW9kaWZpZXJfb3B0aW9uc4KpcmFuZG9taXplw6dzbGlkZXJzAqp0aWNrYmFzZV8yEKp0aWNrYmFzZV81D690aWNrYmFzZV9ybmRtXzIQqm1vZGlmaWVyXzgAqnRpY2tiYXNlXzQPqnRpY2tiYXNlXzYPqnRpY2tiYXNlXzcPqnRpY2tiYXNlXzEPp2RlbGF5XzcCqG1vZGlmaWVyqERpc2FibGVkrGJvZHlfb3B0aW9uc4+maml0dGVyw6lsaW1pdF9taW46rGxpbWl0X3RpbWluZwmmbWFzdGVyAKxsaW1pdF90aWNrX2w6qWxpbWl0X21heDqsbGltaXRfdGlja19yOrB0eXBlX3RpY2tzX3ZhbHVlBqpsaW1pdF90eXBlpVRpY2tzsXR5cGVfcmFuZG9tX3ZhbHVlBqR0eXBlpVRpY2tzqGludmVydGVywqpsZWZ0X2xpbWl0OqxmcmVlc3RhbmRpbmeoRGlzYWJsZWSrcmlnaHRfbGltaXQ6kt4AJ6ptb2RpZmllcl8x0MGodGlja2Jhc2WpTmV2ZXJsb3NlqnRpY2tiYXNlXzMPqm1vZGlmaWVyXzLQwLJ0aWNrYmFzZV9yYW5kb21pemXDrnRpY2tiYXNlX2Nob2tlEKptb2RpZmllcl8z0L+ydGlja2Jhc2Vfcm5kbV90eXBlpFdheXOqbW9kaWZpZXJfNOStdGlja2Jhc2Vfcm5kbQKqbW9kaWZpZXJfNfyqdGlja2Jhc2VfOAewdGlja2Jhc2Vfc2xpZGVycwaqbW9kaWZpZXJfNhCqbW9kaWZpZXJfNyyueWF3X29wdGlvbnNfZXiFq29mZnNldF9sZWZ056xvZmZzZXRfcmlnaHQopWRlbGF5w6ZtYXN0ZXIBrWRlbGF5X3NsaWRlcnMFqHlhd19tb2RlAqp5YXdfb2Zmc2V0CaRib2R5w6dkZWxheV8xBadkZWxheV8yBadkZWxheV8zAadkZWxheV80AadkZWxheV81D6dkZWxheV82DK9tb2RpZmllcl9vZmZzZXQKp2RlbGF5XzgCsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcOnc2xpZGVycwOqdGlja2Jhc2VfMgKqdGlja2Jhc2VfNQSvdGlja2Jhc2Vfcm5kbV8yFqptb2RpZmllcl846qp0aWNrYmFzZV80Aqp0aWNrYmFzZV82B6p0aWNrYmFzZV83CKp0aWNrYmFzZV8xA6dkZWxheV83Aqhtb2RpZmllcqhEaXNhYmxlZKxib2R5X29wdGlvbnOPpmppdHRlcsOpbGltaXRfbWluOqxsaW1pdF90aW1pbmcBpm1hc3RlcgGsbGltaXRfdGlja19sHqlsaW1pdF9tYXg8rGxpbWl0X3RpY2tfciGwdHlwZV90aWNrc192YWx1ZRCqbGltaXRfdHlwZaZSYW5kb22xdHlwZV9yYW5kb21fdmFsdWUQpHR5cGWmU3RhdGljqGludmVydGVywqpsZWZ0X2xpbWl0PKxmcmVlc3RhbmRpbmeoRGlzYWJsZWSrcmlnaHRfbGltaXQ83gAnqm1vZGlmaWVyXzHQwah0aWNrYmFzZaZOeWFuemGqdGlja2Jhc2VfMw+qbW9kaWZpZXJfMtDAsnRpY2tiYXNlX3JhbmRvbWl6ZcOudGlja2Jhc2VfY2hva2UQqm1vZGlmaWVyXzPQv7J0aWNrYmFzZV9ybmRtX3R5cGWkV2F5c6ptb2RpZmllcl805K10aWNrYmFzZV9ybmRtAqptb2RpZmllcl81/Kp0aWNrYmFzZV84D7B0aWNrYmFzZV9zbGlkZXJzBqptb2RpZmllcl82EKptb2RpZmllcl83LK55YXdfb3B0aW9uc19leIWrb2Zmc2V0X2xlZnTnrG9mZnNldF9yaWdodCilZGVsYXnDpm1hc3RlcgGtZGVsYXlfc2xpZGVycwWoeWF3X21vZGUCqnlhd19vZmZzZXQJpGJvZHnDp2RlbGF5XzEFp2RlbGF5XzIFp2RlbGF5XzMBp2RlbGF5XzQBp2RlbGF5XzUPp2RlbGF5XzYMr21vZGlmaWVyX29mZnNldAqnZGVsYXlfOAKwbW9kaWZpZXJfb3B0aW9uc4KpcmFuZG9taXplw6dzbGlkZXJzA6p0aWNrYmFzZV8yAqp0aWNrYmFzZV81BK90aWNrYmFzZV9ybmRtXzIWqm1vZGlmaWVyXzjqqnRpY2tiYXNlXzQCqnRpY2tiYXNlXzYHqnRpY2tiYXNlXzcPqnRpY2tiYXNlXzEDp2RlbGF5XzcCqG1vZGlmaWVyqERpc2FibGVkrGJvZHlfb3B0aW9uc4+maml0dGVyw6lsaW1pdF9taW46rGxpbWl0X3RpbWluZwGmbWFzdGVyAaxsaW1pdF90aWNrX2weqWxpbWl0X21heDysbGltaXRfdGlja19yIbB0eXBlX3RpY2tzX3ZhbHVlEKpsaW1pdF90eXBlplJhbmRvbbF0eXBlX3JhbmRvbV92YWx1ZRCkdHlwZaZTdGF0aWOoaW52ZXJ0ZXLCqmxlZnRfbGltaXQ8rGZyZWVzdGFuZGluZ6hEaXNhYmxlZKtyaWdodF9saW1pdDyS3gAnqm1vZGlmaWVyXzHQwah0aWNrYmFzZalOZXZlcmxvc2WqdGlja2Jhc2VfMwKqbW9kaWZpZXJfMtDAsnRpY2tiYXNlX3JhbmRvbWl6ZcOudGlja2Jhc2VfY2hva2UQqm1vZGlmaWVyXzPQv7J0aWNrYmFzZV9ybmRtX3R5cGWkV2F5c6ptb2RpZmllcl80/610aWNrYmFzZV9ybmRtAqptb2RpZmllcl81Aqp0aWNrYmFzZV84CrB0aWNrYmFzZV9zbGlkZXJzBqptb2RpZmllcl82+aptb2RpZmllcl83AK55YXdfb3B0aW9uc19leIWrb2Zmc2V0X2xlZnTnrG9mZnNldF9yaWdodCilZGVsYXnDpm1hc3RlcgGtZGVsYXlfc2xpZGVycwWoeWF3X21vZGUCqnlhd19vZmZzZXQJpGJvZHnDp2RlbGF5XzEFp2RlbGF5XzIFp2RlbGF5XzMBp2RlbGF5XzQBp2RlbGF5XzUUp2RlbGF5XzYTr21vZGlmaWVyX29mZnNldAKnZGVsYXlfOAKwbW9kaWZpZXJfb3B0aW9uc4KpcmFuZG9taXplw6dzbGlkZXJzA6p0aWNrYmFzZV8yAqp0aWNrYmFzZV81Dq90aWNrYmFzZV9ybmRtXzIWqm1vZGlmaWVyXzgAqnRpY2tiYXNlXzQEqnRpY2tiYXNlXzYPqnRpY2tiYXNlXzcNqnRpY2tiYXNlXzEPp2RlbGF5XzcCqG1vZGlmaWVyqERpc2FibGVkrGJvZHlfb3B0aW9uc4+maml0dGVyw6lsaW1pdF9taW46rGxpbWl0X3RpbWluZwOmbWFzdGVyAaxsaW1pdF90aWNrX2w3qWxpbWl0X21heDqsbGltaXRfdGlja19yPLB0eXBlX3RpY2tzX3ZhbHVlEKpsaW1pdF90eXBlpVRpY2tzsXR5cGVfcmFuZG9tX3ZhbHVlEKR0eXBlplN0YXRpY6hpbnZlcnRlcsKqbGVmdF9saW1pdDysZnJlZXN0YW5kaW5nqERpc2FibGVkq3JpZ2h0X2xpbWl0PN4AJ6ptb2RpZmllcl8x0MGodGlja2Jhc2WmTnlhbnphqnRpY2tiYXNlXzMCqm1vZGlmaWVyXzLQwLJ0aWNrYmFzZV9yYW5kb21pemXDrnRpY2tiYXNlX2Nob2tlEKptb2RpZmllcl8z0L+ydGlja2Jhc2Vfcm5kbV90eXBlpFdheXOqbW9kaWZpZXJfNP+tdGlja2Jhc2Vfcm5kbQKqbW9kaWZpZXJfNQKqdGlja2Jhc2VfOA+wdGlja2Jhc2Vfc2xpZGVycweqbW9kaWZpZXJfNvmqbW9kaWZpZXJfNwCueWF3X29wdGlvbnNfZXiFq29mZnNldF9sZWZ056xvZmZzZXRfcmlnaHQopWRlbGF5w6ZtYXN0ZXIBrWRlbGF5X3NsaWRlcnMFqHlhd19tb2RlAqp5YXdfb2Zmc2V0CaRib2R5w6dkZWxheV8xBadkZWxheV8yBadkZWxheV8zAadkZWxheV80AadkZWxheV81FKdkZWxheV82E69tb2RpZmllcl9vZmZzZXQCp2RlbGF5XzgCsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcOnc2xpZGVycwOqdGlja2Jhc2VfMgKqdGlja2Jhc2VfNQ6vdGlja2Jhc2Vfcm5kbV8yFqptb2RpZmllcl84AKp0aWNrYmFzZV80BKp0aWNrYmFzZV82C6p0aWNrYmFzZV83A6p0aWNrYmFzZV8xD6dkZWxheV83Aqhtb2RpZmllcqhEaXNhYmxlZKxib2R5X29wdGlvbnOPpmppdHRlcsOpbGltaXRfbWluOqxsaW1pdF90aW1pbmcDpm1hc3RlcgGsbGltaXRfdGlja19sN6lsaW1pdF9tYXg6rGxpbWl0X3RpY2tfcjywdHlwZV90aWNrc192YWx1ZRCqbGltaXRfdHlwZaVUaWNrc7F0eXBlX3JhbmRvbV92YWx1ZRCkdHlwZaZTdGF0aWOoaW52ZXJ0ZXLCqmxlZnRfbGltaXQ8rGZyZWVzdGFuZGluZ6hEaXNhYmxlZKtyaWdodF9saW1pdDyS3gAnqm1vZGlmaWVyXzHQtah0aWNrYmFzZalOZXZlcmxvc2WqdGlja2Jhc2VfMwKqbW9kaWZpZXJfMtC0snRpY2tiYXNlX3JhbmRvbWl6ZcOudGlja2Jhc2VfY2hva2UQqm1vZGlmaWVyXzPQs7J0aWNrYmFzZV9ybmRtX3R5cGWnRGVmYXVsdKptb2RpZmllcl80AK10aWNrYmFzZV9ybmRtAqptb2RpZmllcl81AKp0aWNrYmFzZV84ArB0aWNrYmFzZV9zbGlkZXJzBqptb2RpZmllcl82AKptb2RpZmllcl83AK55YXdfb3B0aW9uc19leIWrb2Zmc2V0X2xlZnQArG9mZnNldF9yaWdodAClZGVsYXnCpm1hc3RlcgCtZGVsYXlfc2xpZGVycwKoeWF3X21vZGUBqnlhd19vZmZzZXQApGJvZHnDp2RlbGF5XzECp2RlbGF5XzIFp2RlbGF5XzMOp2RlbGF5XzQNp2RlbGF5XzUIp2RlbGF5XzYIr21vZGlmaWVyX29mZnNldAqnZGVsYXlfOBGwbW9kaWZpZXJfb3B0aW9uc4KpcmFuZG9taXplw6dzbGlkZXJzA6p0aWNrYmFzZV8yB6p0aWNrYmFzZV81Ba90aWNrYmFzZV9ybmRtXzIQqm1vZGlmaWVyXzgAqnRpY2tiYXNlXzQDqnRpY2tiYXNlXzYOqnRpY2tiYXNlXzcFqnRpY2tiYXNlXzEPp2RlbGF5XzcEqG1vZGlmaWVyqERpc2FibGVkrGJvZHlfb3B0aW9uc4+maml0dGVyw6lsaW1pdF9taW4crGxpbWl0X3RpbWluZwGmbWFzdGVyAKxsaW1pdF90aWNrX2wwqWxpbWl0X21heDqsbGltaXRfdGlja19yOrB0eXBlX3RpY2tzX3ZhbHVlBKpsaW1pdF90eXBlplN0YXRpY7F0eXBlX3JhbmRvbV92YWx1ZQSkdHlwZaZTdGF0aWOoaW52ZXJ0ZXLCqmxlZnRfbGltaXQ8rGZyZWVzdGFuZGluZ6hSZXZlcnNlZKtyaWdodF9saW1pdDzeACeqbW9kaWZpZXJfMdC1qHRpY2tiYXNlqU5ldmVybG9zZap0aWNrYmFzZV8zD6ptb2RpZmllcl8y0LSydGlja2Jhc2VfcmFuZG9taXplw650aWNrYmFzZV9jaG9rZRCqbW9kaWZpZXJfM9CzsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0qm1vZGlmaWVyXzQArXRpY2tiYXNlX3JuZG0Cqm1vZGlmaWVyXzUAqnRpY2tiYXNlXzgPsHRpY2tiYXNlX3NsaWRlcnMDqm1vZGlmaWVyXzYAqm1vZGlmaWVyXzcArnlhd19vcHRpb25zX2V4hatvZmZzZXRfbGVmdACsb2Zmc2V0X3JpZ2h0AKVkZWxhecKmbWFzdGVyAK1kZWxheV9zbGlkZXJzAqh5YXdfbW9kZQGqeWF3X29mZnNldACkYm9kecOnZGVsYXlfMQKnZGVsYXlfMgWnZGVsYXlfMw6nZGVsYXlfNA2nZGVsYXlfNQinZGVsYXlfNgivbW9kaWZpZXJfb2Zmc2V0CqdkZWxheV84EbBtb2RpZmllcl9vcHRpb25zgqlyYW5kb21pemXDp3NsaWRlcnMDqnRpY2tiYXNlXzIWqnRpY2tiYXNlXzUQr3RpY2tiYXNlX3JuZG1fMhaqbW9kaWZpZXJfOACqdGlja2Jhc2VfNBCqdGlja2Jhc2VfNg+qdGlja2Jhc2VfNxCqdGlja2Jhc2VfMQKnZGVsYXlfNwSobW9kaWZpZXKoRGlzYWJsZWSsYm9keV9vcHRpb25zj6ZqaXR0ZXLDqWxpbWl0X21pbhysbGltaXRfdGltaW5nAaZtYXN0ZXIArGxpbWl0X3RpY2tfbDCpbGltaXRfbWF4OqxsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUEqmxpbWl0X3R5cGWmU3RhdGljsXR5cGVfcmFuZG9tX3ZhbHVlBKR0eXBlplN0YXRpY6hpbnZlcnRlcsKqbGVmdF9saW1pdDysZnJlZXN0YW5kaW5nqFJldmVyc2Vkq3JpZ2h0X2xpbWl0PJLeACeqbW9kaWZpZXJfMdC8qHRpY2tiYXNlqU5ldmVybG9zZap0aWNrYmFzZV8zBqptb2RpZmllcl8y0LuydGlja2Jhc2VfcmFuZG9taXplw650aWNrYmFzZV9jaG9rZRCqbW9kaWZpZXJfM9C6snRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0qm1vZGlmaWVyXzQArXRpY2tiYXNlX3JuZG0Cqm1vZGlmaWVyXzUAqnRpY2tiYXNlXzgJsHRpY2tiYXNlX3NsaWRlcnMIqm1vZGlmaWVyXzYAqm1vZGlmaWVyXzcArnlhd19vcHRpb25zX2V4hatvZmZzZXRfbGVmdOesb2Zmc2V0X3JpZ2h0KKVkZWxhecOmbWFzdGVyAa1kZWxheV9zbGlkZXJzBah5YXdfbW9kZQKqeWF3X29mZnNldAmkYm9kecOnZGVsYXlfMQWnZGVsYXlfMgWnZGVsYXlfMwGnZGVsYXlfNAGnZGVsYXlfNQ+nZGVsYXlfNgOvbW9kaWZpZXJfb2Zmc2V0+qdkZWxheV84ArBtb2RpZmllcl9vcHRpb25zgqlyYW5kb21pemXDp3NsaWRlcnMDqnRpY2tiYXNlXzIJqnRpY2tiYXNlXzUMr3RpY2tiYXNlX3JuZG1fMhaqbW9kaWZpZXJfOACqdGlja2Jhc2VfNAKqdGlja2Jhc2VfNgeqdGlja2Jhc2VfNwKqdGlja2Jhc2VfMQSnZGVsYXlfNwKobW9kaWZpZXKoRGlzYWJsZWSsYm9keV9vcHRpb25zj6ZqaXR0ZXLDqWxpbWl0X21pbjqsbGltaXRfdGltaW5nDqZtYXN0ZXIArGxpbWl0X3RpY2tfbBypbGltaXRfbWF4OqxsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUEqmxpbWl0X3R5cGWmU3RhdGljsXR5cGVfcmFuZG9tX3ZhbHVlBKR0eXBlplN0YXRpY6hpbnZlcnRlcsKqbGVmdF9saW1pdDysZnJlZXN0YW5kaW5nqERpc2FibGVkq3JpZ2h0X2xpbWl0PN4AJ6ptb2RpZmllcl8x0LyodGlja2Jhc2WpTmV2ZXJsb3NlqnRpY2tiYXNlXzMQqm1vZGlmaWVyXzLQu7J0aWNrYmFzZV9yYW5kb21pemXDrnRpY2tiYXNlX2Nob2tlEKptb2RpZmllcl8z0LqydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSqbW9kaWZpZXJfNACtdGlja2Jhc2Vfcm5kbQKqbW9kaWZpZXJfNQCqdGlja2Jhc2VfOBCwdGlja2Jhc2Vfc2xpZGVycwOqbW9kaWZpZXJfNgCqbW9kaWZpZXJfNwCueWF3X29wdGlvbnNfZXiFq29mZnNldF9sZWZ056xvZmZzZXRfcmlnaHQopWRlbGF5w6ZtYXN0ZXIBrWRlbGF5X3NsaWRlcnMFqHlhd19tb2RlAqp5YXdfb2Zmc2V0CaRib2R5w6dkZWxheV8xBadkZWxheV8yBadkZWxheV8zAadkZWxheV80AadkZWxheV81D6dkZWxheV82A69tb2RpZmllcl9vZmZzZXT6p2RlbGF5XzgCsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcOnc2xpZGVycwOqdGlja2Jhc2VfMhaqdGlja2Jhc2VfNQ+vdGlja2Jhc2Vfcm5kbV8yFqptb2RpZmllcl84AKp0aWNrYmFzZV80D6p0aWNrYmFzZV82EKp0aWNrYmFzZV83EKp0aWNrYmFzZV8xAqdkZWxheV83Aqhtb2RpZmllcqhEaXNhYmxlZKxib2R5X29wdGlvbnOPpmppdHRlcsOpbGltaXRfbWluOqxsaW1pdF90aW1pbmcOpm1hc3RlcgCsbGltaXRfdGlja19sHKlsaW1pdF9tYXg6rGxpbWl0X3RpY2tfcjqwdHlwZV90aWNrc192YWx1ZQSqbGltaXRfdHlwZaZTdGF0aWOxdHlwZV9yYW5kb21fdmFsdWUEpHR5cGWmU3RhdGljqGludmVydGVywqpsZWZ0X2xpbWl0PKxmcmVlc3RhbmRpbmeoRGlzYWJsZWSrcmlnaHRfbGltaXQ8kt4AJ6ptb2RpZmllcl8xBKh0aWNrYmFzZalOZXZlcmxvc2WqdGlja2Jhc2VfMw+qbW9kaWZpZXJfMvyydGlja2Jhc2VfcmFuZG9taXplw650aWNrYmFzZV9jaG9rZRCqbW9kaWZpZXJfMwCydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSqbW9kaWZpZXJfNACtdGlja2Jhc2Vfcm5kbQ+qbW9kaWZpZXJfNQCqdGlja2Jhc2VfOA+wdGlja2Jhc2Vfc2xpZGVycwOqbW9kaWZpZXJfNgCqbW9kaWZpZXJfNwCueWF3X29wdGlvbnNfZXiFq29mZnNldF9sZWZ0AKxvZmZzZXRfcmlnaHQApWRlbGF5wqZtYXN0ZXIArWRlbGF5X3NsaWRlcnMFqHlhd19tb2RlAap5YXdfb2Zmc2V0AKRib2R5w6dkZWxheV8xEKdkZWxheV8yB6dkZWxheV8zAqdkZWxheV80AqdkZWxheV81AqdkZWxheV82Aq9tb2RpZmllcl9vZmZzZXT/p2RlbGF5XzgCsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcKnc2xpZGVycwWqdGlja2Jhc2VfMhCqdGlja2Jhc2VfNRCvdGlja2Jhc2Vfcm5kbV8yEKptb2RpZmllcl84AKp0aWNrYmFzZV80EKp0aWNrYmFzZV82D6p0aWNrYmFzZV83EKp0aWNrYmFzZV8xD6dkZWxheV83Aqhtb2RpZmllcqhEaXNhYmxlZKxib2R5X29wdGlvbnOPpmppdHRlcsOpbGltaXRfbWluAKxsaW1pdF90aW1pbmcCpm1hc3RlcgGsbGltaXRfdGlja19sOqlsaW1pdF9tYXg8rGxpbWl0X3RpY2tfcjqwdHlwZV90aWNrc192YWx1ZQSqbGltaXRfdHlwZaZTdGF0aWOxdHlwZV9yYW5kb21fdmFsdWUEpHR5cGWmU3RhdGljqGludmVydGVywqpsZWZ0X2xpbWl0PKxmcmVlc3RhbmRpbmenRGVmYXVsdKtyaWdodF9saW1pdDzeACeqbW9kaWZpZXJfMQSodGlja2Jhc2WpTmV2ZXJsb3NlqnRpY2tiYXNlXzMPqm1vZGlmaWVyXzL8snRpY2tiYXNlX3JhbmRvbWl6ZcOudGlja2Jhc2VfY2hva2UQqm1vZGlmaWVyXzMAsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0qm1vZGlmaWVyXzQArXRpY2tiYXNlX3JuZG0Pqm1vZGlmaWVyXzUAqnRpY2tiYXNlXzgPsHRpY2tiYXNlX3NsaWRlcnMDqm1vZGlmaWVyXzYAqm1vZGlmaWVyXzcArnlhd19vcHRpb25zX2V4hatvZmZzZXRfbGVmdACsb2Zmc2V0X3JpZ2h0AKVkZWxhecKmbWFzdGVyAK1kZWxheV9zbGlkZXJzBah5YXdfbW9kZQGqeWF3X29mZnNldACkYm9kecOnZGVsYXlfMRCnZGVsYXlfMgenZGVsYXlfMwKnZGVsYXlfNAKnZGVsYXlfNQKnZGVsYXlfNgKvbW9kaWZpZXJfb2Zmc2V0/6dkZWxheV84ArBtb2RpZmllcl9vcHRpb25zgqlyYW5kb21pemXCp3NsaWRlcnMFqnRpY2tiYXNlXzIQqnRpY2tiYXNlXzUQr3RpY2tiYXNlX3JuZG1fMhCqbW9kaWZpZXJfOACqdGlja2Jhc2VfNA+qdGlja2Jhc2VfNg+qdGlja2Jhc2VfNxCqdGlja2Jhc2VfMQ+nZGVsYXlfNwKobW9kaWZpZXKoRGlzYWJsZWSsYm9keV9vcHRpb25zj6ZqaXR0ZXLDqWxpbWl0X21pbgCsbGltaXRfdGltaW5nAqZtYXN0ZXIBrGxpbWl0X3RpY2tfbDqpbGltaXRfbWF4PKxsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUEqmxpbWl0X3R5cGWmU3RhdGljsXR5cGVfcmFuZG9tX3ZhbHVlBKR0eXBlplN0YXRpY6hpbnZlcnRlcsKqbGVmdF9saW1pdDysZnJlZXN0YW5kaW5np0RlZmF1bHSrcmlnaHRfbGltaXQ8kt4AJ6ptb2RpZmllcl8xAKh0aWNrYmFzZalOZXZlcmxvc2WqdGlja2Jhc2VfMw+qbW9kaWZpZXJfMgCydGlja2Jhc2VfcmFuZG9taXplw650aWNrYmFzZV9jaG9rZRCqbW9kaWZpZXJfMwCydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSqbW9kaWZpZXJfNACtdGlja2Jhc2Vfcm5kbQ+qbW9kaWZpZXJfNQCqdGlja2Jhc2VfOBCwdGlja2Jhc2Vfc2xpZGVycwOqbW9kaWZpZXJfNgCqbW9kaWZpZXJfNwCueWF3X29wdGlvbnNfZXiFq29mZnNldF9sZWZ0AKxvZmZzZXRfcmlnaHQApWRlbGF5wqZtYXN0ZXIArWRlbGF5X3NsaWRlcnMDqHlhd19tb2RlAap5YXdfb2Zmc2V0AKRib2R5w6dkZWxheV8xAqdkZWxheV8yFKdkZWxheV8zAqdkZWxheV80AqdkZWxheV81AqdkZWxheV82Aq9tb2RpZmllcl9vZmZzZXQAp2RlbGF5XzgCsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcKnc2xpZGVycwOqdGlja2Jhc2VfMhCqdGlja2Jhc2VfNQ+vdGlja2Jhc2Vfcm5kbV8yEKptb2RpZmllcl84AKp0aWNrYmFzZV80D6p0aWNrYmFzZV82EKp0aWNrYmFzZV83D6p0aWNrYmFzZV8xD6dkZWxheV83Aqhtb2RpZmllcqhEaXNhYmxlZKxib2R5X29wdGlvbnOPpmppdHRlcsOpbGltaXRfbWluOqxsaW1pdF90aW1pbmcCpm1hc3RlcgGsbGltaXRfdGlja19sOqlsaW1pdF9tYXg6rGxpbWl0X3RpY2tfcjqwdHlwZV90aWNrc192YWx1ZQSqbGltaXRfdHlwZaZTdGF0aWOxdHlwZV9yYW5kb21fdmFsdWUEpHR5cGWmU3RhdGljqGludmVydGVywqpsZWZ0X2xpbWl0PKxmcmVlc3RhbmRpbmenRGVmYXVsdKtyaWdodF9saW1pdDzeACeqbW9kaWZpZXJfMQCodGlja2Jhc2WpTmV2ZXJsb3NlqnRpY2tiYXNlXzMPqm1vZGlmaWVyXzIAsnRpY2tiYXNlX3JhbmRvbWl6ZcOudGlja2Jhc2VfY2hva2UQqm1vZGlmaWVyXzMAsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0qm1vZGlmaWVyXzQArXRpY2tiYXNlX3JuZG0Pqm1vZGlmaWVyXzUAqnRpY2tiYXNlXzgPsHRpY2tiYXNlX3NsaWRlcnMDqm1vZGlmaWVyXzYAqm1vZGlmaWVyXzcArnlhd19vcHRpb25zX2V4hatvZmZzZXRfbGVmdACsb2Zmc2V0X3JpZ2h0AKVkZWxhecKmbWFzdGVyAK1kZWxheV9zbGlkZXJzA6h5YXdfbW9kZQGqeWF3X29mZnNldACkYm9kecOnZGVsYXlfMQKnZGVsYXlfMhSnZGVsYXlfMwKnZGVsYXlfNAKnZGVsYXlfNQKnZGVsYXlfNgKvbW9kaWZpZXJfb2Zmc2V0AKdkZWxheV84ArBtb2RpZmllcl9vcHRpb25zgqlyYW5kb21pemXCp3NsaWRlcnMDqnRpY2tiYXNlXzIQqnRpY2tiYXNlXzUPr3RpY2tiYXNlX3JuZG1fMhCqbW9kaWZpZXJfOACqdGlja2Jhc2VfNA+qdGlja2Jhc2VfNg+qdGlja2Jhc2VfNw+qdGlja2Jhc2VfMQ+nZGVsYXlfNwKobW9kaWZpZXKoRGlzYWJsZWSsYm9keV9vcHRpb25zj6ZqaXR0ZXLDqWxpbWl0X21pbjqsbGltaXRfdGltaW5nAqZtYXN0ZXIBrGxpbWl0X3RpY2tfbDqpbGltaXRfbWF4OqxsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUEqmxpbWl0X3R5cGWmU3RhdGljsXR5cGVfcmFuZG9tX3ZhbHVlBKR0eXBlplN0YXRpY6hpbnZlcnRlcsKqbGVmdF9saW1pdDysZnJlZXN0YW5kaW5np0RlZmF1bHSrcmlnaHRfbGltaXQ83gAnr2N1c3RvbV9mYWtlZHVja8OoY2xhbl90YWfCs2NsaWVudHNpZGVfbmlja25hbWXCvGFsbG93X2xlYW5pbmdfd2hpbGVfc3RhbmRpbmfCrGN1c3RvbV9zY29wZcOqZWFydGhxdWFrZcKtYXJyb3dzX2FjY2VudKkjRTNCN0Q5RTSrYXJyb3dzX2ZvbnSkQm9sZK5hcnJvd3NfZm9yd2FyZKFesGRhbWFnZV9pbmRpY2F0b3LDq2Fycm93c19sZWZ0oTyqaGl0bWFya2Vyc5OpU2NyZWVuIDJEqFdvcmxkIDNEoX6rYXNwZWN0cmF0aW+BpXNjYWxlfaxhcnJvd3NfcmlnaHShPrB+Y3VzdG9tX2Zha2VkdWNrgaVzY2FsZcyWtH5jbGllbnRzaWRlX25pY2tuYW1lgaVpbnB1dKhsYWdzaWdodK1+Y3VzdG9tX3Njb3BlhaRzaXplzQEsq21haW5fYWNjZW50qSNGRkZGRkY4RqtlZGdlX2FjY2VudKkjRkZGRkZGMDCncm90YXRlZMKjZ2FwCrh+a2VlcF9tb2RlbF90cmFuc3BhcmVuY3mBpXNjYWxlCql2aWV3bW9kZWyIpmF4aXNfegKpY3Njb19yb2xswqltYWluX2hhbmSkTGVmdKpyaWdodF9oYW5kwqZheGlzX3jsqWxlZnRfaGFuZMKmYXhpc1958KNmb3ZCrHNjcmVlbl9jb2xvcqkjQkY0NzQ3Rkavc2NyZWVuX2R1cmF0aW9uB6t3b3JsZF9jb2xvcpOmU2ltcGxlqSNCRjQ3NDdGRqF+p2xlYW5pbmcArndvcmxkX2R1cmF0aW9uCqdmYWxsaW5nAKt3YWxraW5nX2Rpcgqtd2Fsa2luZ19kaXJfMgCnd2Fsa2luZwCmc2t5Ym94pU5pZ2h0rm5vX2ZhbGxfZGFtYWdlw6ZhZGRvbnOWtERpc2FibGUgZm9vdCBzaGFkb3dzukRpc2FibGUgdXNlIG9wZW5zIGJ1eSBtZW51vENsZWFyIGNvbnNvbGUgb24gcm91bmQgc3RhcnStUHJvcGVyIHNreWJveLdEaXNhYmxlIHJhZ2RvbGwgcGh5c2ljc6F+q2Zhc3RfbGFkZGVyw61tYW51YWxfYXJyb3dzw7J1bmxvY2tfZmFrZWxhdGVuY3nDqmxvZ19ldmVudHOFpnByZWZpeKJucKttYWluX2FjY2VudKkjRkZGRkZGRkatcHJlZml4X2FjY2VudKkjRkZGRkZGRkapcHVyY2hhc2Vzw6xkYW1hZ2VfZGVhbHTDsGZvcmNlX3RlYW1haW1ib3TCt2tlZXBfbW9kZWxfdHJhbnNwYXJlbmN5w7NmcmVlemV0aW1lX2Zha2VkdWNrw61pbnRlcnBvbGF0aW5nDg==";
        end;
        if not v35.database[l_pui_0.string("\v\226\128\162  \rDefault")] or #v35.database == 0 then
            v35.database[l_pui_0.string("\v\226\128\162  \rDefault")] = "lIaxd2F0ZXJtYXJrX29wdGlvbnONq21haW5fYWNjZW50qSNGRkZGRkY0Oa1wcmVmaXhfYWNjZW50qSNDQkNCRjZGRq5wb3N0Zml4X2FjY2VudKkjRkZGRkZGRkalbGFiZWysc25hcHNob3QubHVhr2dyYWRpZW50X3N3aXRjaMKkZm9udKRCb2xks2dyYWRpZW50X3NhdHVyYXRpb24Apm1hc3RlcgCwZ3JhZGllbnRfcmFpbmJvd8KlcG9zX3jNA8ClcG9zX3nNBCSuZ3JhZGllbnRfc3BlZWQBrGdyYWRpZW50X2h1ZQC0cHJvZ3Jlc3NfdmVyc2lvbl9iYXIBrHByZXNldF9pbnB1dKdTbmFwcGVyrmFjdGl2ZV9zY3JpcHRzAaVhYm91dAKrcHJlc2V0X2xpc3QIi6poaWRlX3Nob3RzqEJyZWFrIExDtGZyZWVzdGFuZGluZ19hbGxvd2Vkw6dib2R5X2Zzw6xmcmVlc3RhbmRpbmfCqWRpc2FibGVyc5Ghfq1vcHRpb25zX3RhYmxli6x0d2Vha3Nfc3BlZWQBpnR3ZWFrc5OmV2FybXVwqk5vIEVuZW1pZXOhfrJ0d2Vha3NfbGVmdF9vZmZzZXTirHR3ZWFrc19waXRjaKhEaXNhYmxlZK5hdm9pZF9iYWNrc3RhYsOpc2FmZV9oZWFklNkmB3tMaW5rIEFjdGl2ZX3vhoMgICAgIAdERUZBVUxUU3RhbmRpbmfZWgd7TGluayBBY3RpdmV974aTICAgB0RFRkFVTFRDcm91Y2hpbmcgIAd7U21hbGwgVGV4dH0rICAHe0xpbmsgQWN0aXZlfe6LjiAgB0RFRkFVTFRTbmVha2luZ9lNB3tMaW5rIEFjdGl2ZX3ulYcgIAdERUZBVUxUQWlyIENyb3VjaGluZyAgB3tTbWFsbCBUZXh0fSsgIAdERUZBVUxUS25pZmUvVGFzZXKhfq90d2Vha3NfeWF3X3R5cGWkU3BpbqhmYWtlX2xhZ8KsdHdlYWtzX3JhbmdlzLStZmFrZV9sYWdfdHlwZalBbHdheXMgb26zdHdlYWtzX3JpZ2h0X29mZnNldB6yZGlzYWJsZV9sY19ncmVuYWRlw6ZzdGF0ZXMIpXRlYW1zAaptYW51YWxfeWF3qERpc2FibGVkrmZvcmNlX2JyZWFrX2xjmtkmB3tMaW5rIEFjdGl2ZX3vhoMgICAgIAdERUZBVUxUU3RhbmRpbmfZJAd7TGluayBBY3RpdmV975yMICAgIAdERUZBVUxUUnVubmluZ9klB3tMaW5rIEFjdGl2ZX3vlZQgICAgIAdERUZBVUxUU2xvd2luZ9klB3tMaW5rIEFjdGl2ZX3vhpMgICAHREVGQVVMVENyb3VjaGluZ9klB3tMaW5rIEFjdGl2ZX3ui44gICAgB0RFRkFVTFRTbmVha2luZ9kgB3tMaW5rIEFjdGl2ZX3ulYYgICAgB0RFRkFVTFRBaXLZKAd7TGluayBBY3RpdmV97pWHICAHREVGQVVMVEFpciBDcm91Y2hpbmfZKAd7TGluayBBY3RpdmV97pOBICAgB0RFRkFVTFRGcmVlc3RhbmRpbmfZIgd7TGluayBBY3RpdmV974G5ICAHREVGQVVMVE1hbnVhbHOhfpmS3gAnrnRpY2tiYXNlX2Nob2tlEKp0aWNrYmFzZV83EK10aWNrYmFzZV9ybmRtD6ptb2RpZmllcl8z0LavdGlja2Jhc2Vfcm5kbV8yELB0aWNrYmFzZV9zbGlkZXJzA6ptb2RpZmllcl80AKptb2RpZmllcl81AKptb2RpZmllcl82AKptb2RpZmllcl83AK55YXdfb3B0aW9uc19leIWtZGVsYXlfc2xpZGVycwGrb2Zmc2V0X2xlZnQKpm1hc3RlcgClZGVsYXnCrG9mZnNldF9yaWdodAqqbW9kaWZpZXJfOACoeWF3X21vZGUBp2RlbGF5XzQCp2RlbGF5XzUCp2RlbGF5XzYCqG1vZGlmaWVypkNlbnRlcqdkZWxheV84Aq9tb2RpZmllcl9vZmZzZXT7sG1vZGlmaWVyX29wdGlvbnOCp3NsaWRlcnMDqXJhbmRvbWl6ZcOydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSnZGVsYXlfMQKnZGVsYXlfMhSnZGVsYXlfMwKqdGlja2Jhc2VfNhCqdGlja2Jhc2VfMhCqdGlja2Jhc2VfOA+qeWF3X29mZnNldAqqdGlja2Jhc2VfMxCqdGlja2Jhc2VfNRCsYm9keV9vcHRpb25zj6xsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUPsXR5cGVfcmFuZG9tX3ZhbHVlD6psaW1pdF90eXBlplN0YXRpY6hpbnZlcnRlcsKmbWFzdGVyAKxmcmVlc3RhbmRpbmeoRGlzYWJsZWSpbGltaXRfbWluHalsaW1pdF9tYXg6pmppdHRlcsOkdHlwZaZTdGF0aWOsbGltaXRfdGltaW5nAapsZWZ0X2xpbWl0OqxsaW1pdF90aWNrX2wvq3JpZ2h0X2xpbWl0Oqp0aWNrYmFzZV80EKRib2R5w6h0aWNrYmFzZalOZXZlcmxvc2WqbW9kaWZpZXJfMdC4qnRpY2tiYXNlXzEPp2RlbGF5XzcCsnRpY2tiYXNlX3JhbmRvbWl6ZcOqbW9kaWZpZXJfMtC33gAnrnRpY2tiYXNlX2Nob2tlEKp0aWNrYmFzZV83EK10aWNrYmFzZV9ybmRtD6ptb2RpZmllcl8z0LavdGlja2Jhc2Vfcm5kbV8yELB0aWNrYmFzZV9zbGlkZXJzA6ptb2RpZmllcl80AKptb2RpZmllcl81AKptb2RpZmllcl82AKptb2RpZmllcl83AK55YXdfb3B0aW9uc19leIWtZGVsYXlfc2xpZGVycwGrb2Zmc2V0X2xlZnQKpm1hc3RlcgClZGVsYXnCrG9mZnNldF9yaWdodAqqbW9kaWZpZXJfOACoeWF3X21vZGUBp2RlbGF5XzQCp2RlbGF5XzUCp2RlbGF5XzYCqG1vZGlmaWVypkNlbnRlcqdkZWxheV84Aq9tb2RpZmllcl9vZmZzZXT7sG1vZGlmaWVyX29wdGlvbnOCp3NsaWRlcnMDqXJhbmRvbWl6ZcOydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSnZGVsYXlfMQKnZGVsYXlfMhSnZGVsYXlfMwKqdGlja2Jhc2VfNg+qdGlja2Jhc2VfMhCqdGlja2Jhc2VfOBCqeWF3X29mZnNldAqqdGlja2Jhc2VfMw+qdGlja2Jhc2VfNQ+sYm9keV9vcHRpb25zj6xsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUPsXR5cGVfcmFuZG9tX3ZhbHVlD6psaW1pdF90eXBlplN0YXRpY6hpbnZlcnRlcsKmbWFzdGVyAKxmcmVlc3RhbmRpbmeoRGlzYWJsZWSpbGltaXRfbWluHalsaW1pdF9tYXg6pmppdHRlcsOkdHlwZaZTdGF0aWOsbGltaXRfdGltaW5nAapsZWZ0X2xpbWl0OqxsaW1pdF90aWNrX2wvq3JpZ2h0X2xpbWl0Oqp0aWNrYmFzZV80D6Rib2R5w6h0aWNrYmFzZalOZXZlcmxvc2WqbW9kaWZpZXJfMdC4qnRpY2tiYXNlXzEPp2RlbGF5XzcCsnRpY2tiYXNlX3JhbmRvbWl6ZcOqbW9kaWZpZXJfMtC3kt4AJ650aWNrYmFzZV9jaG9rZRCqdGlja2Jhc2VfNw+tdGlja2Jhc2Vfcm5kbQ+qbW9kaWZpZXJfM9Czr3RpY2tiYXNlX3JuZG1fMhCwdGlja2Jhc2Vfc2xpZGVycwOqbW9kaWZpZXJfNACqbW9kaWZpZXJfNQCqbW9kaWZpZXJfNgCqbW9kaWZpZXJfNwCueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMCq29mZnNldF9sZWZ0/KZtYXN0ZXIApWRlbGF5wqxvZmZzZXRfcmlnaHQEqm1vZGlmaWVyXzgAqHlhd19tb2RlAadkZWxheV80AqdkZWxheV81AqdkZWxheV82Aqhtb2RpZmllcqZDZW50ZXKnZGVsYXlfOAKvbW9kaWZpZXJfb2Zmc2V00K2wbW9kaWZpZXJfb3B0aW9uc4Knc2xpZGVycwOpcmFuZG9taXplw7J0aWNrYmFzZV9ybmRtX3R5cGWnRGVmYXVsdKdkZWxheV8xFKdkZWxheV8yAadkZWxheV8zAap0aWNrYmFzZV82D6p0aWNrYmFzZV8yEKp0aWNrYmFzZV84EKp5YXdfb2Zmc2V0BKp0aWNrYmFzZV8zEKp0aWNrYmFzZV81EKxib2R5X29wdGlvbnOPrGxpbWl0X3RpY2tfcjqwdHlwZV90aWNrc192YWx1ZQSxdHlwZV9yYW5kb21fdmFsdWUEqmxpbWl0X3R5cGWmU3RhdGljqGludmVydGVywqZtYXN0ZXIBrGZyZWVzdGFuZGluZ6hEaXNhYmxlZKlsaW1pdF9taW4cqWxpbWl0X21heDqmaml0dGVyw6R0eXBlplN0YXRpY6xsaW1pdF90aW1pbmcOqmxlZnRfbGltaXQ6rGxpbWl0X3RpY2tfbByrcmlnaHRfbGltaXQ6qnRpY2tiYXNlXzQQpGJvZHnDqHRpY2tiYXNlqU5ldmVybG9zZaptb2RpZmllcl8x0LWqdGlja2Jhc2VfMQ+nZGVsYXlfNwKydGlja2Jhc2VfcmFuZG9taXplw6ptb2RpZmllcl8y0LTeACeudGlja2Jhc2VfY2hva2UQqnRpY2tiYXNlXzcQrXRpY2tiYXNlX3JuZG0Pqm1vZGlmaWVyXzPQs690aWNrYmFzZV9ybmRtXzIQsHRpY2tiYXNlX3NsaWRlcnMDqm1vZGlmaWVyXzQAqm1vZGlmaWVyXzUAqm1vZGlmaWVyXzYAqm1vZGlmaWVyXzcArnlhd19vcHRpb25zX2V4ha1kZWxheV9zbGlkZXJzAqtvZmZzZXRfbGVmdPymbWFzdGVyAKVkZWxhecKsb2Zmc2V0X3JpZ2h0BKptb2RpZmllcl84AKh5YXdfbW9kZQGnZGVsYXlfNAKnZGVsYXlfNQKnZGVsYXlfNgKobW9kaWZpZXKmQ2VudGVyp2RlbGF5XzgCr21vZGlmaWVyX29mZnNldNCtsG1vZGlmaWVyX29wdGlvbnOCp3NsaWRlcnMDqXJhbmRvbWl6ZcOydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSnZGVsYXlfMRSnZGVsYXlfMgGnZGVsYXlfMwGqdGlja2Jhc2VfNhCqdGlja2Jhc2VfMhCqdGlja2Jhc2VfOA+qeWF3X29mZnNldASqdGlja2Jhc2VfMxCqdGlja2Jhc2VfNRCsYm9keV9vcHRpb25zj6xsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUEsXR5cGVfcmFuZG9tX3ZhbHVlBKpsaW1pdF90eXBlplN0YXRpY6hpbnZlcnRlcsKmbWFzdGVyAaxmcmVlc3RhbmRpbmeoRGlzYWJsZWSpbGltaXRfbWluHKlsaW1pdF9tYXg6pmppdHRlcsOkdHlwZaZTdGF0aWOsbGltaXRfdGltaW5nDqpsZWZ0X2xpbWl0OqxsaW1pdF90aWNrX2wcq3JpZ2h0X2xpbWl0Oqp0aWNrYmFzZV80D6Rib2R5w6h0aWNrYmFzZalOZXZlcmxvc2WqbW9kaWZpZXJfMdC1qnRpY2tiYXNlXzEPp2RlbGF5XzcCsnRpY2tiYXNlX3JhbmRvbWl6ZcOqbW9kaWZpZXJfMtC0kt4AJ650aWNrYmFzZV9jaG9rZRCqdGlja2Jhc2VfNwatdGlja2Jhc2Vfcm5kbQ+qbW9kaWZpZXJfMwCvdGlja2Jhc2Vfcm5kbV8yELB0aWNrYmFzZV9zbGlkZXJzCKptb2RpZmllcl80AKptb2RpZmllcl81AKptb2RpZmllcl82AKptb2RpZmllcl83AK55YXdfb3B0aW9uc19leIWtZGVsYXlfc2xpZGVycwGrb2Zmc2V0X2xlZnTQ2qZtYXN0ZXIBpWRlbGF5w6xvZmZzZXRfcmlnaHQsqm1vZGlmaWVyXzgAqHlhd19tb2RlAqdkZWxheV80AqdkZWxheV81AqdkZWxheV82Aqhtb2RpZmllcqUzLVdheadkZWxheV84Aq9tb2RpZmllcl9vZmZzZXQBsG1vZGlmaWVyX29wdGlvbnOCp3NsaWRlcnMCqXJhbmRvbWl6ZcOydGlja2Jhc2Vfcm5kbV90eXBlpFdheXOnZGVsYXlfMQ+nZGVsYXlfMhSnZGVsYXlfMwKqdGlja2Jhc2VfNhCqdGlja2Jhc2VfMg+qdGlja2Jhc2VfOAuqeWF3X29mZnNldACqdGlja2Jhc2VfMxKqdGlja2Jhc2VfNQmsYm9keV9vcHRpb25zj6xsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUGsXR5cGVfcmFuZG9tX3ZhbHVlBqpsaW1pdF90eXBlpVRpY2tzqGludmVydGVywqZtYXN0ZXIArGZyZWVzdGFuZGluZ6hEaXNhYmxlZKlsaW1pdF9taW46qWxpbWl0X21heDqmaml0dGVyw6R0eXBlpVRpY2tzrGxpbWl0X3RpbWluZwmqbGVmdF9saW1pdDqsbGltaXRfdGlja19sOqtyaWdodF9saW1pdDqqdGlja2Jhc2VfNAKkYm9kecOodGlja2Jhc2WmTnlhbnphqm1vZGlmaWVyXzECqnRpY2tiYXNlXzELp2RlbGF5XzcCsnRpY2tiYXNlX3JhbmRvbWl6ZcOqbW9kaWZpZXJfMhveACeudGlja2Jhc2VfY2hva2UQqnRpY2tiYXNlXzcPrXRpY2tiYXNlX3JuZG0Pqm1vZGlmaWVyXzMAr3RpY2tiYXNlX3JuZG1fMhCwdGlja2Jhc2Vfc2xpZGVycwOqbW9kaWZpZXJfNACqbW9kaWZpZXJfNQCqbW9kaWZpZXJfNgCqbW9kaWZpZXJfNwCueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMBq29mZnNldF9sZWZ00NqmbWFzdGVyAaVkZWxhecOsb2Zmc2V0X3JpZ2h0LKptb2RpZmllcl84AKh5YXdfbW9kZQKnZGVsYXlfNAKnZGVsYXlfNQKnZGVsYXlfNgKobW9kaWZpZXKlMy1XYXmnZGVsYXlfOAKvbW9kaWZpZXJfb2Zmc2V0AbBtb2RpZmllcl9vcHRpb25zgqdzbGlkZXJzAqlyYW5kb21pemXDsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0p2RlbGF5XzEPp2RlbGF5XzIUp2RlbGF5XzMCqnRpY2tiYXNlXzYPqnRpY2tiYXNlXzIQqnRpY2tiYXNlXzgQqnlhd19vZmZzZXQAqnRpY2tiYXNlXzMQqnRpY2tiYXNlXzUPrGJvZHlfb3B0aW9uc4+sbGltaXRfdGlja19yOrB0eXBlX3RpY2tzX3ZhbHVlBrF0eXBlX3JhbmRvbV92YWx1ZQaqbGltaXRfdHlwZaVUaWNrc6hpbnZlcnRlcsKmbWFzdGVyAKxmcmVlc3RhbmRpbmeoRGlzYWJsZWSpbGltaXRfbWluOqlsaW1pdF9tYXg6pmppdHRlcsOkdHlwZaVUaWNrc6xsaW1pdF90aW1pbmcJqmxlZnRfbGltaXQ6rGxpbWl0X3RpY2tfbDqrcmlnaHRfbGltaXQ6qnRpY2tiYXNlXzQPpGJvZHnDqHRpY2tiYXNlqU5ldmVybG9zZaptb2RpZmllcl8xAqp0aWNrYmFzZV8xD6dkZWxheV83ArJ0aWNrYmFzZV9yYW5kb21pemXDqm1vZGlmaWVyXzIbkt4AJ650aWNrYmFzZV9jaG9rZRCqdGlja2Jhc2VfNwitdGlja2Jhc2Vfcm5kbQKqbW9kaWZpZXJfM9C/r3RpY2tiYXNlX3JuZG1fMhawdGlja2Jhc2Vfc2xpZGVycwaqbW9kaWZpZXJfNOSqbW9kaWZpZXJfNfyqbW9kaWZpZXJfNhCqbW9kaWZpZXJfNyyueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMGq29mZnNldF9sZWZ0CaZtYXN0ZXIApWRlbGF5wqxvZmZzZXRfcmlnaHQJqm1vZGlmaWVyXzjqqHlhd19tb2RlAadkZWxheV80DqdkZWxheV81FKdkZWxheV82DKhtb2RpZmllcqZDZW50ZXKnZGVsYXlfOAKvbW9kaWZpZXJfb2Zmc2V0CrBtb2RpZmllcl9vcHRpb25zgqdzbGlkZXJzA6lyYW5kb21pemXDsnRpY2tiYXNlX3JuZG1fdHlwZaRXYXlzp2RlbGF5XzEJp2RlbGF5XzIKp2RlbGF5XzMRqnRpY2tiYXNlXzYHqnRpY2tiYXNlXzICqnRpY2tiYXNlXzgHqnlhd19vZmZzZXQJqnRpY2tiYXNlXzMPqnRpY2tiYXNlXzUErGJvZHlfb3B0aW9uc4+sbGltaXRfdGlja19yIbB0eXBlX3RpY2tzX3ZhbHVlELF0eXBlX3JhbmRvbV92YWx1ZRCqbGltaXRfdHlwZaZTdGF0aWOoaW52ZXJ0ZXLCpm1hc3RlcgGsZnJlZXN0YW5kaW5nqERpc2FibGVkqWxpbWl0X21pbjCpbGltaXRfbWF4OqZqaXR0ZXLDpHR5cGWmU3RhdGljrGxpbWl0X3RpbWluZwGqbGVmdF9saW1pdB6sbGltaXRfdGlja19sHqtyaWdodF9saW1pdB6qdGlja2Jhc2VfNAKkYm9kecOodGlja2Jhc2WpTmV2ZXJsb3Nlqm1vZGlmaWVyXzHQwap0aWNrYmFzZV8xA6dkZWxheV83ArJ0aWNrYmFzZV9yYW5kb21pemXDqm1vZGlmaWVyXzLQwN4AJ650aWNrYmFzZV9jaG9rZRCqdGlja2Jhc2VfNw+tdGlja2Jhc2Vfcm5kbQKqbW9kaWZpZXJfM9C/r3RpY2tiYXNlX3JuZG1fMhawdGlja2Jhc2Vfc2xpZGVycwaqbW9kaWZpZXJfNOSqbW9kaWZpZXJfNfyqbW9kaWZpZXJfNhCqbW9kaWZpZXJfNyyueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMGq29mZnNldF9sZWZ0CaZtYXN0ZXIApWRlbGF5wqxvZmZzZXRfcmlnaHQJqm1vZGlmaWVyXzjqqHlhd19tb2RlAadkZWxheV80DqdkZWxheV81FKdkZWxheV82DKhtb2RpZmllcqZDZW50ZXKnZGVsYXlfOAKvbW9kaWZpZXJfb2Zmc2V0CrBtb2RpZmllcl9vcHRpb25zgqdzbGlkZXJzA6lyYW5kb21pemXDsnRpY2tiYXNlX3JuZG1fdHlwZaRXYXlzp2RlbGF5XzEJp2RlbGF5XzIKp2RlbGF5XzMRqnRpY2tiYXNlXzYHqnRpY2tiYXNlXzICqnRpY2tiYXNlXzgPqnlhd19vZmZzZXQJqnRpY2tiYXNlXzMPqnRpY2tiYXNlXzUErGJvZHlfb3B0aW9uc4+sbGltaXRfdGlja19yIbB0eXBlX3RpY2tzX3ZhbHVlELF0eXBlX3JhbmRvbV92YWx1ZRCqbGltaXRfdHlwZaZTdGF0aWOoaW52ZXJ0ZXLCpm1hc3RlcgGsZnJlZXN0YW5kaW5nqERpc2FibGVkqWxpbWl0X21pbjCpbGltaXRfbWF4OqZqaXR0ZXLDpHR5cGWmU3RhdGljrGxpbWl0X3RpbWluZwGqbGVmdF9saW1pdB6sbGltaXRfdGlja19sHqtyaWdodF9saW1pdB6qdGlja2Jhc2VfNAKkYm9kecOodGlja2Jhc2WmTnlhbnphqm1vZGlmaWVyXzHQwap0aWNrYmFzZV8xA6dkZWxheV83ArJ0aWNrYmFzZV9yYW5kb21pemXDqm1vZGlmaWVyXzLQwJLeACeudGlja2Jhc2VfY2hva2UQqnRpY2tiYXNlXzcNrXRpY2tiYXNlX3JuZG0Cqm1vZGlmaWVyXzPQv690aWNrYmFzZV9ybmRtXzIWsHRpY2tiYXNlX3NsaWRlcnMGqm1vZGlmaWVyXzT/qm1vZGlmaWVyXzUCqm1vZGlmaWVyXzb5qm1vZGlmaWVyXzcArnlhd19vcHRpb25zX2V4ha1kZWxheV9zbGlkZXJzAatvZmZzZXRfbGVmdAmmbWFzdGVyAKVkZWxhecKsb2Zmc2V0X3JpZ2h0Captb2RpZmllcl84AKh5YXdfbW9kZQGnZGVsYXlfNAinZGVsYXlfNQ2nZGVsYXlfNhOobW9kaWZpZXKmQ2VudGVyp2RlbGF5XzgCr21vZGlmaWVyX29mZnNldAKwbW9kaWZpZXJfb3B0aW9uc4Knc2xpZGVycwOpcmFuZG9taXplw7J0aWNrYmFzZV9ybmRtX3R5cGWkV2F5c6dkZWxheV8xBqdkZWxheV8yA6dkZWxheV8zAap0aWNrYmFzZV82D6p0aWNrYmFzZV8yAqp0aWNrYmFzZV84Cqp5YXdfb2Zmc2V0Cap0aWNrYmFzZV8zAqp0aWNrYmFzZV81Dqxib2R5X29wdGlvbnOPrGxpbWl0X3RpY2tfcjqwdHlwZV90aWNrc192YWx1ZRCxdHlwZV9yYW5kb21fdmFsdWUQqmxpbWl0X3R5cGWmU3RhdGljqGludmVydGVywqZtYXN0ZXIBrGZyZWVzdGFuZGluZ6hEaXNhYmxlZKlsaW1pdF9taW46qWxpbWl0X21heDqmaml0dGVyw6R0eXBlplN0YXRpY6xsaW1pdF90aW1pbmcDqmxlZnRfbGltaXQerGxpbWl0X3RpY2tfbCarcmlnaHRfbGltaXQeqnRpY2tiYXNlXzQEpGJvZHnDqHRpY2tiYXNlqU5ldmVybG9zZaptb2RpZmllcl8x0MGqdGlja2Jhc2VfMQ+nZGVsYXlfNwKydGlja2Jhc2VfcmFuZG9taXplw6ptb2RpZmllcl8y0MDeACeudGlja2Jhc2VfY2hva2UQqnRpY2tiYXNlXzcDrXRpY2tiYXNlX3JuZG0Cqm1vZGlmaWVyXzPQv690aWNrYmFzZV9ybmRtXzIWsHRpY2tiYXNlX3NsaWRlcnMHqm1vZGlmaWVyXzT/qm1vZGlmaWVyXzUCqm1vZGlmaWVyXzb5qm1vZGlmaWVyXzcArnlhd19vcHRpb25zX2V4ha1kZWxheV9zbGlkZXJzAatvZmZzZXRfbGVmdAmmbWFzdGVyAKVkZWxhecKsb2Zmc2V0X3JpZ2h0Captb2RpZmllcl84AKh5YXdfbW9kZQGnZGVsYXlfNAinZGVsYXlfNQ2nZGVsYXlfNhOobW9kaWZpZXKmQ2VudGVyp2RlbGF5XzgCr21vZGlmaWVyX29mZnNldAKwbW9kaWZpZXJfb3B0aW9uc4Knc2xpZGVycwOpcmFuZG9taXplw7J0aWNrYmFzZV9ybmRtX3R5cGWkV2F5c6dkZWxheV8xBqdkZWxheV8yA6dkZWxheV8zAap0aWNrYmFzZV82C6p0aWNrYmFzZV8yAqp0aWNrYmFzZV84D6p5YXdfb2Zmc2V0Cap0aWNrYmFzZV8zAqp0aWNrYmFzZV81Dqxib2R5X29wdGlvbnOPrGxpbWl0X3RpY2tfcjqwdHlwZV90aWNrc192YWx1ZRCxdHlwZV9yYW5kb21fdmFsdWUQqmxpbWl0X3R5cGWmU3RhdGljqGludmVydGVywqZtYXN0ZXIBrGZyZWVzdGFuZGluZ6hEaXNhYmxlZKlsaW1pdF9taW46qWxpbWl0X21heDqmaml0dGVyw6R0eXBlplN0YXRpY6xsaW1pdF90aW1pbmcDqmxlZnRfbGltaXQerGxpbWl0X3RpY2tfbCarcmlnaHRfbGltaXQeqnRpY2tiYXNlXzQEpGJvZHnDqHRpY2tiYXNlpk55YW56Yaptb2RpZmllcl8x0MGqdGlja2Jhc2VfMQ+nZGVsYXlfNwKydGlja2Jhc2VfcmFuZG9taXplw6ptb2RpZmllcl8y0MCS3gAnrnRpY2tiYXNlX2Nob2tlEKp0aWNrYmFzZV83Ba10aWNrYmFzZV9ybmRtAqptb2RpZmllcl8z0LOvdGlja2Jhc2Vfcm5kbV8yELB0aWNrYmFzZV9zbGlkZXJzBqptb2RpZmllcl80AKptb2RpZmllcl81AKptb2RpZmllcl82AKptb2RpZmllcl83AK55YXdfb3B0aW9uc19leIWtZGVsYXlfc2xpZGVycwKrb2Zmc2V0X2xlZnQApm1hc3RlcgClZGVsYXnCrG9mZnNldF9yaWdodACqbW9kaWZpZXJfOACoeWF3X21vZGUBp2RlbGF5XzQNp2RlbGF5XzUIp2RlbGF5XzYIqG1vZGlmaWVypkNlbnRlcqdkZWxheV84Ea9tb2RpZmllcl9vZmZzZXQKsG1vZGlmaWVyX29wdGlvbnOCp3NsaWRlcnMDqXJhbmRvbWl6ZcOydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSnZGVsYXlfMQKnZGVsYXlfMgWnZGVsYXlfMw6qdGlja2Jhc2VfNg6qdGlja2Jhc2VfMgeqdGlja2Jhc2VfOAKqeWF3X29mZnNldA2qdGlja2Jhc2VfMwKqdGlja2Jhc2VfNQWsYm9keV9vcHRpb25zj6xsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUEsXR5cGVfcmFuZG9tX3ZhbHVlBKpsaW1pdF90eXBlplN0YXRpY6hpbnZlcnRlcsKmbWFzdGVyAaxmcmVlc3RhbmRpbmeoRGlzYWJsZWSpbGltaXRfbWluHKlsaW1pdF9tYXg6pmppdHRlcsOkdHlwZaZTdGF0aWOsbGltaXRfdGltaW5nAapsZWZ0X2xpbWl0OqxsaW1pdF90aWNrX2wwq3JpZ2h0X2xpbWl0Oqp0aWNrYmFzZV80A6Rib2R5w6h0aWNrYmFzZalOZXZlcmxvc2WqbW9kaWZpZXJfMdC1qnRpY2tiYXNlXzEPp2RlbGF5XzcEsnRpY2tiYXNlX3JhbmRvbWl6ZcOqbW9kaWZpZXJfMtC03gAnrnRpY2tiYXNlX2Nob2tlEKp0aWNrYmFzZV83EK10aWNrYmFzZV9ybmRtAqptb2RpZmllcl8z0LOvdGlja2Jhc2Vfcm5kbV8yFrB0aWNrYmFzZV9zbGlkZXJzA6ptb2RpZmllcl80AKptb2RpZmllcl81AKptb2RpZmllcl82AKptb2RpZmllcl83AK55YXdfb3B0aW9uc19leIWtZGVsYXlfc2xpZGVycwKrb2Zmc2V0X2xlZnQApm1hc3RlcgClZGVsYXnCrG9mZnNldF9yaWdodACqbW9kaWZpZXJfOACoeWF3X21vZGUBp2RlbGF5XzQNp2RlbGF5XzUIp2RlbGF5XzYIqG1vZGlmaWVypkNlbnRlcqdkZWxheV84Ea9tb2RpZmllcl9vZmZzZXQKsG1vZGlmaWVyX29wdGlvbnOCp3NsaWRlcnMDqXJhbmRvbWl6ZcOydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSnZGVsYXlfMQKnZGVsYXlfMgWnZGVsYXlfMw6qdGlja2Jhc2VfNg+qdGlja2Jhc2VfMhaqdGlja2Jhc2VfOA+qeWF3X29mZnNldA2qdGlja2Jhc2VfMw+qdGlja2Jhc2VfNRCsYm9keV9vcHRpb25zj6xsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUEsXR5cGVfcmFuZG9tX3ZhbHVlBKpsaW1pdF90eXBlplN0YXRpY6hpbnZlcnRlcsKmbWFzdGVyAaxmcmVlc3RhbmRpbmeoRGlzYWJsZWSpbGltaXRfbWluHKlsaW1pdF9tYXg6pmppdHRlcsOkdHlwZaZTdGF0aWOsbGltaXRfdGltaW5nAapsZWZ0X2xpbWl0OqxsaW1pdF90aWNrX2wwq3JpZ2h0X2xpbWl0Oqp0aWNrYmFzZV80EKRib2R5w6h0aWNrYmFzZalOZXZlcmxvc2WqbW9kaWZpZXJfMdC1qnRpY2tiYXNlXzECp2RlbGF5XzcEsnRpY2tiYXNlX3JhbmRvbWl6ZcOqbW9kaWZpZXJfMtC0kt4AJ650aWNrYmFzZV9jaG9rZRCqdGlja2Jhc2VfNwKtdGlja2Jhc2Vfcm5kbQKqbW9kaWZpZXJfM9C6r3RpY2tiYXNlX3JuZG1fMhawdGlja2Jhc2Vfc2xpZGVycwiqbW9kaWZpZXJfNACqbW9kaWZpZXJfNQCqbW9kaWZpZXJfNgCqbW9kaWZpZXJfNwCueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMCq29mZnNldF9sZWZ05aZtYXN0ZXIApWRlbGF5wqxvZmZzZXRfcmlnaHQvqm1vZGlmaWVyXzgAqHlhd19tb2RlAadkZWxheV80AadkZWxheV81BadkZWxheV82A6htb2RpZmllcqZDZW50ZXKnZGVsYXlfOAKvbW9kaWZpZXJfb2Zmc2V0+rBtb2RpZmllcl9vcHRpb25zgqdzbGlkZXJzA6lyYW5kb21pemXDsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0p2RlbGF5XzEGp2RlbGF5XzIMp2RlbGF5XzMUqnRpY2tiYXNlXzYHqnRpY2tiYXNlXzIJqnRpY2tiYXNlXzgJqnlhd19vZmZzZXQJqnRpY2tiYXNlXzMGqnRpY2tiYXNlXzUMrGJvZHlfb3B0aW9uc4+sbGltaXRfdGlja19yOrB0eXBlX3RpY2tzX3ZhbHVlBLF0eXBlX3JhbmRvbV92YWx1ZQSqbGltaXRfdHlwZaZTdGF0aWOoaW52ZXJ0ZXLCpm1hc3RlcgGsZnJlZXN0YW5kaW5nqERpc2FibGVkqWxpbWl0X21pbjqpbGltaXRfbWF4OqZqaXR0ZXLDpHR5cGWmU3RhdGljrGxpbWl0X3RpbWluZw6qbGVmdF9saW1pdDqsbGltaXRfdGlja19sHKtyaWdodF9saW1pdDqqdGlja2Jhc2VfNAKkYm9kecOodGlja2Jhc2WpTmV2ZXJsb3Nlqm1vZGlmaWVyXzHQvKp0aWNrYmFzZV8xBKdkZWxheV83ArJ0aWNrYmFzZV9yYW5kb21pemXDqm1vZGlmaWVyXzLQu94AJ650aWNrYmFzZV9jaG9rZRCqdGlja2Jhc2VfNxCtdGlja2Jhc2Vfcm5kbQKqbW9kaWZpZXJfM9C6r3RpY2tiYXNlX3JuZG1fMhawdGlja2Jhc2Vfc2xpZGVycwOqbW9kaWZpZXJfNACqbW9kaWZpZXJfNQCqbW9kaWZpZXJfNgCqbW9kaWZpZXJfNwCueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMCq29mZnNldF9sZWZ05aZtYXN0ZXIApWRlbGF5wqxvZmZzZXRfcmlnaHQvqm1vZGlmaWVyXzgAqHlhd19tb2RlAadkZWxheV80AadkZWxheV81BadkZWxheV82A6htb2RpZmllcqZDZW50ZXKnZGVsYXlfOAKvbW9kaWZpZXJfb2Zmc2V0+rBtb2RpZmllcl9vcHRpb25zgqdzbGlkZXJzA6lyYW5kb21pemXDsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0p2RlbGF5XzEGp2RlbGF5XzIMp2RlbGF5XzMUqnRpY2tiYXNlXzYQqnRpY2tiYXNlXzIWqnRpY2tiYXNlXzgQqnlhd19vZmZzZXQJqnRpY2tiYXNlXzMQqnRpY2tiYXNlXzUPrGJvZHlfb3B0aW9uc4+sbGltaXRfdGlja19yOrB0eXBlX3RpY2tzX3ZhbHVlBLF0eXBlX3JhbmRvbV92YWx1ZQSqbGltaXRfdHlwZaZTdGF0aWOoaW52ZXJ0ZXLCpm1hc3RlcgGsZnJlZXN0YW5kaW5nqERpc2FibGVkqWxpbWl0X21pbjqpbGltaXRfbWF4OqZqaXR0ZXLDpHR5cGWmU3RhdGljrGxpbWl0X3RpbWluZw6qbGVmdF9saW1pdDqsbGltaXRfdGlja19sHKtyaWdodF9saW1pdDqqdGlja2Jhc2VfNA+kYm9kecOodGlja2Jhc2WpTmV2ZXJsb3Nlqm1vZGlmaWVyXzHQvKp0aWNrYmFzZV8xAqdkZWxheV83ArJ0aWNrYmFzZV9yYW5kb21pemXDqm1vZGlmaWVyXzLQu5LeACeudGlja2Jhc2VfY2hva2UQqnRpY2tiYXNlXzcQrXRpY2tiYXNlX3JuZG0Pqm1vZGlmaWVyXzMAr3RpY2tiYXNlX3JuZG1fMhCwdGlja2Jhc2Vfc2xpZGVycwOqbW9kaWZpZXJfNACqbW9kaWZpZXJfNQCqbW9kaWZpZXJfNgCqbW9kaWZpZXJfNwCueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMFq29mZnNldF9sZWZ0AKZtYXN0ZXIApWRlbGF5wqxvZmZzZXRfcmlnaHQAqm1vZGlmaWVyXzgAqHlhd19tb2RlAadkZWxheV80AqdkZWxheV81AqdkZWxheV82Aqhtb2RpZmllcqhEaXNhYmxlZKdkZWxheV84Aq9tb2RpZmllcl9vZmZzZXT/sG1vZGlmaWVyX29wdGlvbnOCp3NsaWRlcnMFqXJhbmRvbWl6ZcKydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSnZGVsYXlfMRCnZGVsYXlfMgenZGVsYXlfMwKqdGlja2Jhc2VfNg+qdGlja2Jhc2VfMhCqdGlja2Jhc2VfOA+qeWF3X29mZnNldAOqdGlja2Jhc2VfMw+qdGlja2Jhc2VfNRCsYm9keV9vcHRpb25zj6xsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUEsXR5cGVfcmFuZG9tX3ZhbHVlBKpsaW1pdF90eXBlplN0YXRpY6hpbnZlcnRlcsKmbWFzdGVyAKxmcmVlc3RhbmRpbmenRGVmYXVsdKlsaW1pdF9taW4AqWxpbWl0X21heDymaml0dGVyw6R0eXBlplN0YXRpY6xsaW1pdF90aW1pbmcCqmxlZnRfbGltaXQBrGxpbWl0X3RpY2tfbDqrcmlnaHRfbGltaXQBqnRpY2tiYXNlXzQQpGJvZHnDqHRpY2tiYXNlqU5ldmVybG9zZaptb2RpZmllcl8xBKp0aWNrYmFzZV8xD6dkZWxheV83ArJ0aWNrYmFzZV9yYW5kb21pemXDqm1vZGlmaWVyXzL83gAnrnRpY2tiYXNlX2Nob2tlEKp0aWNrYmFzZV83EK10aWNrYmFzZV9ybmRtD6ptb2RpZmllcl8zAK90aWNrYmFzZV9ybmRtXzIQsHRpY2tiYXNlX3NsaWRlcnMDqm1vZGlmaWVyXzQAqm1vZGlmaWVyXzUAqm1vZGlmaWVyXzYAqm1vZGlmaWVyXzcArnlhd19vcHRpb25zX2V4ha1kZWxheV9zbGlkZXJzBatvZmZzZXRfbGVmdACmbWFzdGVyAKVkZWxhecKsb2Zmc2V0X3JpZ2h0AKptb2RpZmllcl84AKh5YXdfbW9kZQKnZGVsYXlfNAKnZGVsYXlfNQKnZGVsYXlfNgKobW9kaWZpZXKoRGlzYWJsZWSnZGVsYXlfOAKvbW9kaWZpZXJfb2Zmc2V0/7Btb2RpZmllcl9vcHRpb25zgqdzbGlkZXJzBalyYW5kb21pemXCsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0p2RlbGF5XzEQp2RlbGF5XzIHp2RlbGF5XzMCqnRpY2tiYXNlXzYPqnRpY2tiYXNlXzIQqnRpY2tiYXNlXzgPqnlhd19vZmZzZXQAqnRpY2tiYXNlXzMPqnRpY2tiYXNlXzUQrGJvZHlfb3B0aW9uc4+sbGltaXRfdGlja19yOrB0eXBlX3RpY2tzX3ZhbHVlBLF0eXBlX3JhbmRvbV92YWx1ZQSqbGltaXRfdHlwZaZTdGF0aWOoaW52ZXJ0ZXLCpm1hc3RlcgCsZnJlZXN0YW5kaW5np0RlZmF1bHSpbGltaXRfbWluAKlsaW1pdF9tYXg8pmppdHRlcsOkdHlwZaZTdGF0aWOsbGltaXRfdGltaW5nAqpsZWZ0X2xpbWl0PKxsaW1pdF90aWNrX2w6q3JpZ2h0X2xpbWl0PKp0aWNrYmFzZV80D6Rib2R5w6h0aWNrYmFzZalOZXZlcmxvc2WqbW9kaWZpZXJfMQSqdGlja2Jhc2VfMQ+nZGVsYXlfNwKydGlja2Jhc2VfcmFuZG9taXplw6ptb2RpZmllcl8y/JLeACeudGlja2Jhc2VfY2hva2UQqnRpY2tiYXNlXzcPrXRpY2tiYXNlX3JuZG0Pqm1vZGlmaWVyXzMAr3RpY2tiYXNlX3JuZG1fMhCwdGlja2Jhc2Vfc2xpZGVycwOqbW9kaWZpZXJfNACqbW9kaWZpZXJfNQCqbW9kaWZpZXJfNgCqbW9kaWZpZXJfNwCueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMDq29mZnNldF9sZWZ0AKZtYXN0ZXIApWRlbGF5wqxvZmZzZXRfcmlnaHQAqm1vZGlmaWVyXzgAqHlhd19tb2RlAadkZWxheV80AqdkZWxheV81AqdkZWxheV82Aqhtb2RpZmllcqhEaXNhYmxlZKdkZWxheV84Aq9tb2RpZmllcl9vZmZzZXQAsG1vZGlmaWVyX29wdGlvbnOCp3NsaWRlcnMDqXJhbmRvbWl6ZcKydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSnZGVsYXlfMQKnZGVsYXlfMhSnZGVsYXlfMwKqdGlja2Jhc2VfNhCqdGlja2Jhc2VfMhCqdGlja2Jhc2VfOBCqeWF3X29mZnNldACqdGlja2Jhc2VfMw+qdGlja2Jhc2VfNQ+sYm9keV9vcHRpb25zj6xsaW1pdF90aWNrX3I6sHR5cGVfdGlja3NfdmFsdWUEsXR5cGVfcmFuZG9tX3ZhbHVlBKpsaW1pdF90eXBlplN0YXRpY6hpbnZlcnRlcsKmbWFzdGVyAaxmcmVlc3RhbmRpbmenRGVmYXVsdKlsaW1pdF9taW46qWxpbWl0X21heDqmaml0dGVyw6R0eXBlplN0YXRpY6xsaW1pdF90aW1pbmcCqmxlZnRfbGltaXQ8rGxpbWl0X3RpY2tfbDqrcmlnaHRfbGltaXQ8qnRpY2tiYXNlXzQPpGJvZHnDqHRpY2tiYXNlqU5ldmVybG9zZaptb2RpZmllcl8xAKp0aWNrYmFzZV8xD6dkZWxheV83ArJ0aWNrYmFzZV9yYW5kb21pemXDqm1vZGlmaWVyXzIA3gAnrnRpY2tiYXNlX2Nob2tlEKp0aWNrYmFzZV83D610aWNrYmFzZV9ybmRtD6ptb2RpZmllcl8zAK90aWNrYmFzZV9ybmRtXzIQsHRpY2tiYXNlX3NsaWRlcnMDqm1vZGlmaWVyXzQAqm1vZGlmaWVyXzUAqm1vZGlmaWVyXzYAqm1vZGlmaWVyXzcArnlhd19vcHRpb25zX2V4ha1kZWxheV9zbGlkZXJzA6tvZmZzZXRfbGVmdACmbWFzdGVyAKVkZWxhecKsb2Zmc2V0X3JpZ2h0AKptb2RpZmllcl84AKh5YXdfbW9kZQGnZGVsYXlfNAKnZGVsYXlfNQKnZGVsYXlfNgKobW9kaWZpZXKoRGlzYWJsZWSnZGVsYXlfOAKvbW9kaWZpZXJfb2Zmc2V0ALBtb2RpZmllcl9vcHRpb25zgqdzbGlkZXJzA6lyYW5kb21pemXCsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0p2RlbGF5XzECp2RlbGF5XzIUp2RlbGF5XzMCqnRpY2tiYXNlXzYPqnRpY2tiYXNlXzIQqnRpY2tiYXNlXzgPqnlhd19vZmZzZXQAqnRpY2tiYXNlXzMPqnRpY2tiYXNlXzUPrGJvZHlfb3B0aW9uc4+sbGltaXRfdGlja19yOrB0eXBlX3RpY2tzX3ZhbHVlBLF0eXBlX3JhbmRvbV92YWx1ZQSqbGltaXRfdHlwZaZTdGF0aWOoaW52ZXJ0ZXLCpm1hc3RlcgGsZnJlZXN0YW5kaW5np0RlZmF1bHSpbGltaXRfbWluOqlsaW1pdF9tYXg6pmppdHRlcsOkdHlwZaZTdGF0aWOsbGltaXRfdGltaW5nAqpsZWZ0X2xpbWl0PKxsaW1pdF90aWNrX2w6q3JpZ2h0X2xpbWl0PKp0aWNrYmFzZV80D6Rib2R5w6h0aWNrYmFzZalOZXZlcmxvc2WqbW9kaWZpZXJfMQCqdGlja2Jhc2VfMQ+nZGVsYXlfNwKydGlja2Jhc2VfcmFuZG9taXplw6ptb2RpZmllcl8yAN4AJ6l2aWV3bW9kZWyIpmF4aXNfegKpY3Njb19yb2xswqltYWluX2hhbmSkTGVmdKpyaWdodF9oYW5kwqZheGlzX3jsqWxlZnRfaGFuZMKmYXhpc1958KNmb3ZCrHNjcmVlbl9jb2xvcqkjQkY0NzQ3Rkavc2NyZWVuX2R1cmF0aW9uB6t3b3JsZF9jb2xvcpOmU2ltcGxlqSNCRjQ3NDdGRqF+rndvcmxkX2R1cmF0aW9uCqt3YWxraW5nX2Rpcgqtd2Fsa2luZ19kaXJfMgC3a2VlcF9tb2RlbF90cmFuc3BhcmVuY3nDqmxvZ19ldmVudHOFpnByZWZpeKJucK1wcmVmaXhfYWNjZW50qSNGRkZGRkZGRqxkYW1hZ2VfZGVhbHTDqXB1cmNoYXNlc8OrbWFpbl9hY2NlbnSpI0ZGRkZGRkZGrWludGVycG9sYXRpbmcOp2xlYW5pbmcyp2ZhbGxpbmcAsH5jdXN0b21fZmFrZWR1Y2uBpXNjYWxlzJaoY2xhbl90YWfCp3dhbGtpbmcCs2NsaWVudHNpZGVfbmlja25hbWXCqmVhcnRocXVha2XCrm5vX2ZhbGxfZGFtYWdlw7xhbGxvd19sZWFuaW5nX3doaWxlX3N0YW5kaW5nwqxjdXN0b21fc2NvcGXDtH5jbGllbnRzaWRlX25pY2tuYW1lgaVpbnB1dKhsYWdzaWdodLJ1bmxvY2tfZmFrZWxhdGVuY3nDrWFycm93c19hY2NlbnSpI0UzQjdEOUU0sGZvcmNlX3RlYW1haW1ib3TCq2Fycm93c19mb250pUxhcmdls2ZyZWV6ZXRpbWVfZmFrZWR1Y2vDrmFycm93c19mb3J3YXJkoV6vY3VzdG9tX2Zha2VkdWNrw61+Y3VzdG9tX3Njb3BlhaRzaXplzQEso2dhcAqrZWRnZV9hY2NlbnSpI0ZGRkZGRjAwp3JvdGF0ZWTCq21haW5fYWNjZW50qSNGRkZGRkY4RrBkYW1hZ2VfaW5kaWNhdG9yw6thcnJvd3NfbGVmdKE8qmhpdG1hcmtlcnOTqVNjcmVlbiAyRKhXb3JsZCAzRKF+q2FzcGVjdHJhdGlvgaVzY2FsZX2sYXJyb3dzX3JpZ2h0oT6tbWFudWFsX2Fycm93c8OmYWRkb25zlrREaXNhYmxlIGZvb3Qgc2hhZG93c7pEaXNhYmxlIHVzZSBvcGVucyBidXkgbWVudbxDbGVhciBjb25zb2xlIG9uIHJvdW5kIHN0YXJ0rVByb3BlciBza3lib3i3RGlzYWJsZSByYWdkb2xsIHBoeXNpY3OhfqtmYXN0X2xhZGRlcsO4fmtlZXBfbW9kZWxfdHJhbnNwYXJlbmN5gaVzY2FsZQqmc2t5Ym94pU5pZ2h0";
        end;
        if not v35.database[l_pui_0.string("\v\226\128\162  \rDelayed  \a{Small Text}(Empty!)")] or #v35.database == 0 then
            v35.database[l_pui_0.string("\v\226\128\162  \rDelayed  \a{Small Text}(Empty!)")] = "";
        end;
        if not v35.database[l_pui_0.string("\v\226\128\162  \rAggressive")] or #v35.database == 0 then
            v35.database[l_pui_0.string("\v\226\128\162  \rAggressive")] = "lIa0cHJvZ3Jlc3NfdmVyc2lvbl9iYXIBrHByZXNldF9pbnB1dKdTbmFwcGVyrmFjdGl2ZV9zY3JpcHRzAaVhYm91dAKxd2F0ZXJtYXJrX29wdGlvbnONpXBvc194zQPApXBvc195zQQksGdyYWRpZW50X3JhaW5ib3fCpGZvbnSnRGVmYXVsdK1wcmVmaXhfYWNjZW50qSNDQkNCRjZGRqZtYXN0ZXIArnBvc3RmaXhfYWNjZW50qSNGRkZGRkZGRqttYWluX2FjY2VudKkjRkZGRkZGNUWuZ3JhZGllbnRfc3BlZWQBrGdyYWRpZW50X2h1ZQCzZ3JhZGllbnRfc2F0dXJhdGlvbgClbGFiZWysc25hcHNob3QubWF4r2dyYWRpZW50X3N3aXRjaMKrcHJlc2V0X2xpc3QIi6ZzdGF0ZXMHrGZyZWVzdGFuZGluZ8KqbWFudWFsX3lhd6hEaXNhYmxlZK5mb3JjZV9icmVha19sY5fZJQd7TGluayBBY3RpdmV975WUICAgICAHREVGQVVMVFNsb3dpbmfZJQd7TGluayBBY3RpdmV974aTICAgB0RFRkFVTFRDcm91Y2hpbmfZJQd7TGluayBBY3RpdmV97ouOICAgIAdERUZBVUxUU25lYWtpbmfZKAd7TGluayBBY3RpdmV97pWHICAHREVGQVVMVEFpciBDcm91Y2hpbmfZKAd7TGluayBBY3RpdmV97pOBICAgB0RFRkFVTFRGcmVlc3RhbmRpbmfZIgd7TGluayBBY3RpdmV974G5ICAHREVGQVVMVE1hbnVhbHOhfqlkaXNhYmxlcnORoX6qaGlkZV9zaG90c6hCcmVhayBMQ61vcHRpb25zX3RhYmxli6hmYWtlX2xhZ8KsdHdlYWtzX3JhbmdlzLStZmFrZV9sYWdfdHlwZalBbHdheXMgb26sdHdlYWtzX3NwZWVkAbJ0d2Vha3NfbGVmdF9vZmZzZXTirHR3ZWFrc19waXRjaKhEaXNhYmxlZLN0d2Vha3NfcmlnaHRfb2Zmc2V0HqlzYWZlX2hlYWSU2SYHe0xpbmsgQWN0aXZlfe+GgyAgICAgB0RFRkFVTFRTdGFuZGluZ9laB3tMaW5rIEFjdGl2ZX3vhpMgICAHREVGQVVMVENyb3VjaGluZyAgB3tTbWFsbCBUZXh0fSsgIAd7TGluayBBY3RpdmV97ouOICAHREVGQVVMVFNuZWFraW5n2U0He0xpbmsgQWN0aXZlfe6VhyAgB0RFRkFVTFRBaXIgQ3JvdWNoaW5nICAHe1NtYWxsIFRleHR9KyAgB0RFRkFVTFRLbmlmZS9UYXNlcqF+r3R3ZWFrc195YXdfdHlwZaRTcGlurmF2b2lkX2JhY2tzdGFiw6Z0d2Vha3ORoX6yZGlzYWJsZV9sY19ncmVuYWRlw7RmcmVlc3RhbmRpbmdfYWxsb3dlZMOnYm9keV9mc8OldGVhbXMBmZLeACewbW9kaWZpZXJfb3B0aW9uc4KpcmFuZG9taXplwqdzbGlkZXJzA610aWNrYmFzZV9ybmRtD6ptb2RpZmllcl8xAK90aWNrYmFzZV9ybmRtXzIQsHRpY2tiYXNlX3NsaWRlcnMDqm1vZGlmaWVyXzIAqnRpY2tiYXNlXzEPqm1vZGlmaWVyXzMAqnRpY2tiYXNlXzMQqm1vZGlmaWVyXzQAqnRpY2tiYXNlXzQQqm1vZGlmaWVyXzUAqnRpY2tiYXNlXzUQqnRpY2tiYXNlXzYQqm1vZGlmaWVyXzYAqnRpY2tiYXNlXzcQqnRpY2tiYXNlXzgPqm1vZGlmaWVyXzgAqnRpY2tiYXNlXzIQrnlhd19vcHRpb25zX2V4ha1kZWxheV9zbGlkZXJzAatvZmZzZXRfbGVmdOWlZGVsYXnCrG9mZnNldF9yaWdodCGmbWFzdGVyAKp5YXdfb2Zmc2V0AKRib2R5w650aWNrYmFzZV9jaG9rZRCqbW9kaWZpZXJfNwCydGlja2Jhc2VfcmFuZG9taXplw6h5YXdfbW9kZQGsYm9keV9vcHRpb25zj6ZtYXN0ZXIBrGZyZWVzdGFuZGluZ6hEaXNhYmxlZKlsaW1pdF9taW46pmppdHRlcsOoaW52ZXJ0ZXLCqWxpbWl0X21heDqsbGltaXRfdGltaW5nAaR0eXBlplN0YXRpY6xsaW1pdF90aWNrX2wcrGxpbWl0X3RpY2tfcjqqbGVmdF9saW1pdDywdHlwZV90aWNrc192YWx1ZQSrcmlnaHRfbGltaXQ8sXR5cGVfcmFuZG9tX3ZhbHVlBKpsaW1pdF90eXBlpVRpY2tzqG1vZGlmaWVyqERpc2FibGVkqHRpY2tiYXNlqU5ldmVybG9zZadkZWxheV8xAadkZWxheV8yFKdkZWxheV8zAqdkZWxheV80AqdkZWxheV81AqdkZWxheV82AqdkZWxheV83AqdkZWxheV84Aq9tb2RpZmllcl9vZmZzZXT/snRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx03gAnsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcKnc2xpZGVycwOtdGlja2Jhc2Vfcm5kbQ+qbW9kaWZpZXJfMQCvdGlja2Jhc2Vfcm5kbV8yELB0aWNrYmFzZV9zbGlkZXJzA6ptb2RpZmllcl8yAKp0aWNrYmFzZV8xD6ptb2RpZmllcl8zAKp0aWNrYmFzZV8zD6ptb2RpZmllcl80AKp0aWNrYmFzZV80D6ptb2RpZmllcl81AKp0aWNrYmFzZV81D6p0aWNrYmFzZV82D6ptb2RpZmllcl82AKp0aWNrYmFzZV83EKp0aWNrYmFzZV84EKptb2RpZmllcl84AKp0aWNrYmFzZV8yEK55YXdfb3B0aW9uc19leIWtZGVsYXlfc2xpZGVycwGrb2Zmc2V0X2xlZnTlpWRlbGF5wqxvZmZzZXRfcmlnaHQhpm1hc3RlcgCqeWF3X29mZnNldACkYm9kecOudGlja2Jhc2VfY2hva2UQqm1vZGlmaWVyXzcAsnRpY2tiYXNlX3JhbmRvbWl6ZcOoeWF3X21vZGUBrGJvZHlfb3B0aW9uc4+mbWFzdGVyAaxmcmVlc3RhbmRpbmeoRGlzYWJsZWSpbGltaXRfbWluOqZqaXR0ZXLDqGludmVydGVywqlsaW1pdF9tYXg6rGxpbWl0X3RpbWluZwGkdHlwZaZTdGF0aWOsbGltaXRfdGlja19sHKxsaW1pdF90aWNrX3I6qmxlZnRfbGltaXQ8sHR5cGVfdGlja3NfdmFsdWUEq3JpZ2h0X2xpbWl0PLF0eXBlX3JhbmRvbV92YWx1ZQSqbGltaXRfdHlwZaVUaWNrc6htb2RpZmllcqhEaXNhYmxlZKh0aWNrYmFzZalOZXZlcmxvc2WnZGVsYXlfMQGnZGVsYXlfMhSnZGVsYXlfMwKnZGVsYXlfNAKnZGVsYXlfNQKnZGVsYXlfNgKnZGVsYXlfNwKnZGVsYXlfOAKvbW9kaWZpZXJfb2Zmc2V0/7J0aWNrYmFzZV9ybmRtX3R5cGWnRGVmYXVsdJLeACewbW9kaWZpZXJfb3B0aW9uc4KpcmFuZG9taXplwqdzbGlkZXJzBa10aWNrYmFzZV9ybmRtD6ptb2RpZmllcl8x/690aWNrYmFzZV9ybmRtXzIQsHRpY2tiYXNlX3NsaWRlcnMDqm1vZGlmaWVyXzL9qnRpY2tiYXNlXzEPqm1vZGlmaWVyXzMAqnRpY2tiYXNlXzMQqm1vZGlmaWVyXzQAqnRpY2tiYXNlXzQQqm1vZGlmaWVyXzUAqnRpY2tiYXNlXzUQqnRpY2tiYXNlXzYPqm1vZGlmaWVyXzYAqnRpY2tiYXNlXzcPqnRpY2tiYXNlXzgQqm1vZGlmaWVyXzgAqnRpY2tiYXNlXzIQrnlhd19vcHRpb25zX2V4ha1kZWxheV9zbGlkZXJzAatvZmZzZXRfbGVmdOClZGVsYXnCrG9mZnNldF9yaWdodCambWFzdGVyAap5YXdfb2Zmc2V0AKRib2R5w650aWNrYmFzZV9jaG9rZRCqbW9kaWZpZXJfNwCydGlja2Jhc2VfcmFuZG9taXplw6h5YXdfbW9kZQGsYm9keV9vcHRpb25zj6ZtYXN0ZXIArGZyZWVzdGFuZGluZ6hEaXNhYmxlZKlsaW1pdF9taW4cpmppdHRlcsOoaW52ZXJ0ZXLCqWxpbWl0X21heDqsbGltaXRfdGltaW5nDqR0eXBlplN0YXRpY6xsaW1pdF90aWNrX2werGxpbWl0X3RpY2tfcjyqbGVmdF9saW1pdDqwdHlwZV90aWNrc192YWx1ZQSrcmlnaHRfbGltaXQ6sXR5cGVfcmFuZG9tX3ZhbHVlBKpsaW1pdF90eXBlpVRpY2tzqG1vZGlmaWVypk9mZnNldKh0aWNrYmFzZalOZXZlcmxvc2WnZGVsYXlfMQKnZGVsYXlfMgSnZGVsYXlfMwGnZGVsYXlfNAKnZGVsYXlfNQKnZGVsYXlfNgKnZGVsYXlfNwKnZGVsYXlfOAKvbW9kaWZpZXJfb2Zmc2V0/7J0aWNrYmFzZV9ybmRtX3R5cGWnRGVmYXVsdN4AJ7Btb2RpZmllcl9vcHRpb25zgqlyYW5kb21pemXCp3NsaWRlcnMFrXRpY2tiYXNlX3JuZG0Pqm1vZGlmaWVyXzH/r3RpY2tiYXNlX3JuZG1fMhCwdGlja2Jhc2Vfc2xpZGVycwOqbW9kaWZpZXJfMv2qdGlja2Jhc2VfMQ+qbW9kaWZpZXJfMwCqdGlja2Jhc2VfMxCqbW9kaWZpZXJfNACqdGlja2Jhc2VfNA+qbW9kaWZpZXJfNQCqdGlja2Jhc2VfNRCqdGlja2Jhc2VfNhCqbW9kaWZpZXJfNgCqdGlja2Jhc2VfNxCqdGlja2Jhc2VfOA+qbW9kaWZpZXJfOACqdGlja2Jhc2VfMhCueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMBq29mZnNldF9sZWZ04KVkZWxhecKsb2Zmc2V0X3JpZ2h0JqZtYXN0ZXIBqnlhd19vZmZzZXQApGJvZHnDrnRpY2tiYXNlX2Nob2tlEKptb2RpZmllcl83ALJ0aWNrYmFzZV9yYW5kb21pemXDqHlhd19tb2RlAaxib2R5X29wdGlvbnOPpm1hc3RlcgCsZnJlZXN0YW5kaW5nqERpc2FibGVkqWxpbWl0X21pbhymaml0dGVyw6hpbnZlcnRlcsKpbGltaXRfbWF4OqxsaW1pdF90aW1pbmcOpHR5cGWmU3RhdGljrGxpbWl0X3RpY2tfbB6sbGltaXRfdGlja19yPKpsZWZ0X2xpbWl0OrB0eXBlX3RpY2tzX3ZhbHVlBKtyaWdodF9saW1pdDqxdHlwZV9yYW5kb21fdmFsdWUEqmxpbWl0X3R5cGWlVGlja3OobW9kaWZpZXKmT2Zmc2V0qHRpY2tiYXNlqU5ldmVybG9zZadkZWxheV8xAqdkZWxheV8yBKdkZWxheV8zAadkZWxheV80AqdkZWxheV81AqdkZWxheV82AqdkZWxheV83AqdkZWxheV84Aq9tb2RpZmllcl9vZmZzZXT/snRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0kt4AJ7Btb2RpZmllcl9vcHRpb25zgqlyYW5kb21pemXDp3NsaWRlcnMCrXRpY2tiYXNlX3JuZG0Cqm1vZGlmaWVyXzHQya90aWNrYmFzZV9ybmRtXzIJsHRpY2tiYXNlX3NsaWRlcnMIqm1vZGlmaWVyXzIbqnRpY2tiYXNlXzELqm1vZGlmaWVyXzMAqnRpY2tiYXNlXzMSqm1vZGlmaWVyXzQAqnRpY2tiYXNlXzQCqm1vZGlmaWVyXzUAqnRpY2tiYXNlXzUJqnRpY2tiYXNlXzYQqm1vZGlmaWVyXzYAqnRpY2tiYXNlXzcGqnRpY2tiYXNlXzgLqm1vZGlmaWVyXzgAqnRpY2tiYXNlXzIPrnlhd19vcHRpb25zX2V4ha1kZWxheV9zbGlkZXJzAatvZmZzZXRfbGVmdNDapWRlbGF5w6xvZmZzZXRfcmlnaHQspm1hc3RlcgGqeWF3X29mZnNldACkYm9kecOudGlja2Jhc2VfY2hva2UQqm1vZGlmaWVyXzcAsnRpY2tiYXNlX3JhbmRvbWl6ZcOoeWF3X21vZGUBrGJvZHlfb3B0aW9uc4+mbWFzdGVyAaxmcmVlc3RhbmRpbmeoRGlzYWJsZWSpbGltaXRfbWluOqZqaXR0ZXLDqGludmVydGVywqlsaW1pdF9tYXg6rGxpbWl0X3RpbWluZwmkdHlwZaVUaWNrc6xsaW1pdF90aWNrX2wirGxpbWl0X3RpY2tfcjqqbGVmdF9saW1pdDqwdHlwZV90aWNrc192YWx1ZQarcmlnaHRfbGltaXQ6sXR5cGVfcmFuZG9tX3ZhbHVlBqpsaW1pdF90eXBlpVRpY2tzqG1vZGlmaWVypTMtV2F5qHRpY2tiYXNlpk55YW56YadkZWxheV8xC6dkZWxheV8yFKdkZWxheV8zAqdkZWxheV80AqdkZWxheV81AqdkZWxheV82AqdkZWxheV83AqdkZWxheV84Aq9tb2RpZmllcl9vZmZzZXQBsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx03gAnsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcOnc2xpZGVycwKtdGlja2Jhc2Vfcm5kbQKqbW9kaWZpZXJfMdDJr3RpY2tiYXNlX3JuZG1fMgmwdGlja2Jhc2Vfc2xpZGVycwOqbW9kaWZpZXJfMhuqdGlja2Jhc2VfMQ+qbW9kaWZpZXJfMwCqdGlja2Jhc2VfMxCqbW9kaWZpZXJfNACqdGlja2Jhc2VfNA+qbW9kaWZpZXJfNQCqdGlja2Jhc2VfNQ+qdGlja2Jhc2VfNg+qbW9kaWZpZXJfNgCqdGlja2Jhc2VfNw+qdGlja2Jhc2VfOBCqbW9kaWZpZXJfOACqdGlja2Jhc2VfMhCueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMBq29mZnNldF9sZWZ00NqlZGVsYXnDrG9mZnNldF9yaWdodCymbWFzdGVyAap5YXdfb2Zmc2V0AKRib2R5w650aWNrYmFzZV9jaG9rZRCqbW9kaWZpZXJfNwCydGlja2Jhc2VfcmFuZG9taXplw6h5YXdfbW9kZQGsYm9keV9vcHRpb25zj6ZtYXN0ZXIBrGZyZWVzdGFuZGluZ6hEaXNhYmxlZKlsaW1pdF9taW46pmppdHRlcsOoaW52ZXJ0ZXLCqWxpbWl0X21heDqsbGltaXRfdGltaW5nCaR0eXBlpVRpY2tzrGxpbWl0X3RpY2tfbCKsbGltaXRfdGlja19yOqpsZWZ0X2xpbWl0OrB0eXBlX3RpY2tzX3ZhbHVlBqtyaWdodF9saW1pdDqxdHlwZV9yYW5kb21fdmFsdWUGqmxpbWl0X3R5cGWlVGlja3OobW9kaWZpZXKlMy1XYXmodGlja2Jhc2WmTnlhbnphp2RlbGF5XzELp2RlbGF5XzIUp2RlbGF5XzMCp2RlbGF5XzQCp2RlbGF5XzUCp2RlbGF5XzYCp2RlbGF5XzcCp2RlbGF5XzgCr21vZGlmaWVyX29mZnNldAGydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSS3gAnsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcKnc2xpZGVycwKtdGlja2Jhc2Vfcm5kbQKqbW9kaWZpZXJfMdDOr3RpY2tiYXNlX3JuZG1fMhawdGlja2Jhc2Vfc2xpZGVycwaqbW9kaWZpZXJfMuqqdGlja2Jhc2VfMQOqbW9kaWZpZXJfM+yqdGlja2Jhc2VfMw+qbW9kaWZpZXJfNOSqdGlja2Jhc2VfNAKqbW9kaWZpZXJfNfyqdGlja2Jhc2VfNQSqdGlja2Jhc2VfNgeqbW9kaWZpZXJfNhCqdGlja2Jhc2VfNwiqdGlja2Jhc2VfOAeqbW9kaWZpZXJfOOqqdGlja2Jhc2VfMgKueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMGq29mZnNldF9sZWZ05aVkZWxhecKsb2Zmc2V0X3JpZ2h0I6ZtYXN0ZXIAqnlhd19vZmZzZXQApGJvZHnDrnRpY2tiYXNlX2Nob2tlEKptb2RpZmllcl83LLJ0aWNrYmFzZV9yYW5kb21pemXDqHlhd19tb2RlAqxib2R5X29wdGlvbnOPpm1hc3RlcgGsZnJlZXN0YW5kaW5nqERpc2FibGVkqWxpbWl0X21pbjCmaml0dGVyw6hpbnZlcnRlcsKpbGltaXRfbWF4OqxsaW1pdF90aW1pbmcBpHR5cGWmU3RhdGljrGxpbWl0X3RpY2tfbDCsbGltaXRfdGlja19yPKpsZWZ0X2xpbWl0ALB0eXBlX3RpY2tzX3ZhbHVlEKtyaWdodF9saW1pdACxdHlwZV9yYW5kb21fdmFsdWUQqmxpbWl0X3R5cGWlVGlja3OobW9kaWZpZXKkU3Bpbqh0aWNrYmFzZalOZXZlcmxvc2WnZGVsYXlfMQWnZGVsYXlfMgqnZGVsYXlfMwinZGVsYXlfNA6nZGVsYXlfNQqnZGVsYXlfNgynZGVsYXlfNwKnZGVsYXlfOAKvbW9kaWZpZXJfb2Zmc2V0/7J0aWNrYmFzZV9ybmRtX3R5cGWkV2F5c94AJ7Btb2RpZmllcl9vcHRpb25zgqlyYW5kb21pemXCp3NsaWRlcnMCrXRpY2tiYXNlX3JuZG0Cqm1vZGlmaWVyXzHQzq90aWNrYmFzZV9ybmRtXzIWsHRpY2tiYXNlX3NsaWRlcnMGqm1vZGlmaWVyXzLqqnRpY2tiYXNlXzEDqm1vZGlmaWVyXzPsqnRpY2tiYXNlXzMPqm1vZGlmaWVyXzTkqnRpY2tiYXNlXzQCqm1vZGlmaWVyXzX8qnRpY2tiYXNlXzUEqnRpY2tiYXNlXzYHqm1vZGlmaWVyXzYQqnRpY2tiYXNlXzcPqnRpY2tiYXNlXzgPqm1vZGlmaWVyXzjqqnRpY2tiYXNlXzICrnlhd19vcHRpb25zX2V4ha1kZWxheV9zbGlkZXJzBqtvZmZzZXRfbGVmdOylZGVsYXnCrG9mZnNldF9yaWdodCOmbWFzdGVyAKp5YXdfb2Zmc2V0AKRib2R5w650aWNrYmFzZV9jaG9rZRCqbW9kaWZpZXJfNyyydGlja2Jhc2VfcmFuZG9taXplw6h5YXdfbW9kZQKsYm9keV9vcHRpb25zj6ZtYXN0ZXIBrGZyZWVzdGFuZGluZ6hEaXNhYmxlZKlsaW1pdF9taW4wpmppdHRlcsOoaW52ZXJ0ZXLCqWxpbWl0X21heDqsbGltaXRfdGltaW5nAaR0eXBlplN0YXRpY6xsaW1pdF90aWNrX2wwrGxpbWl0X3RpY2tfcjyqbGVmdF9saW1pdACwdHlwZV90aWNrc192YWx1ZRCrcmlnaHRfbGltaXQAsXR5cGVfcmFuZG9tX3ZhbHVlEKpsaW1pdF90eXBlpVRpY2tzqG1vZGlmaWVypFNwaW6odGlja2Jhc2WpTmV2ZXJsb3Nlp2RlbGF5XzEFp2RlbGF5XzIKp2RlbGF5XzMIp2RlbGF5XzQOp2RlbGF5XzUKp2RlbGF5XzYMp2RlbGF5XzcCp2RlbGF5XzgCr21vZGlmaWVyX29mZnNldP+ydGlja2Jhc2Vfcm5kbV90eXBlpFdheXOS3gAnsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcOnc2xpZGVycwatdGlja2Jhc2Vfcm5kbQKqbW9kaWZpZXJfMfuvdGlja2Jhc2Vfcm5kbV8yFrB0aWNrYmFzZV9zbGlkZXJzBqptb2RpZmllcl8yBap0aWNrYmFzZV8xD6ptb2RpZmllcl8z/qp0aWNrYmFzZV8zAqptb2RpZmllcl80/6p0aWNrYmFzZV80BKptb2RpZmllcl81Aqp0aWNrYmFzZV81Dqp0aWNrYmFzZV82D6ptb2RpZmllcl82+ap0aWNrYmFzZV83Dap0aWNrYmFzZV84Cqptb2RpZmllcl84AKp0aWNrYmFzZV8yAq55YXdfb3B0aW9uc19leIWtZGVsYXlfc2xpZGVycwGrb2Zmc2V0X2xlZnTlpWRlbGF5wqxvZmZzZXRfcmlnaHQjpm1hc3RlcgCqeWF3X29mZnNldACkYm9kecOudGlja2Jhc2VfY2hva2UQqm1vZGlmaWVyXzcAsnRpY2tiYXNlX3JhbmRvbWl6ZcOoeWF3X21vZGUCrGJvZHlfb3B0aW9uc4+mbWFzdGVyAaxmcmVlc3RhbmRpbmeoRGlzYWJsZWSpbGltaXRfbWluOqZqaXR0ZXLDqGludmVydGVywqlsaW1pdF9tYXg6rGxpbWl0X3RpbWluZwSkdHlwZaZTdGF0aWOsbGltaXRfdGlja19sHKxsaW1pdF90aWNrX3I6qmxlZnRfbGltaXQ7sHR5cGVfdGlja3NfdmFsdWUQq3JpZ2h0X2xpbWl0O7F0eXBlX3JhbmRvbV92YWx1ZRCqbGltaXRfdHlwZaVUaWNrc6htb2RpZmllcqRTcGluqHRpY2tiYXNlqU5ldmVybG9zZadkZWxheV8xBKdkZWxheV8yA6dkZWxheV8zAadkZWxheV80CKdkZWxheV81DadkZWxheV82E6dkZWxheV83AqdkZWxheV84Aq9tb2RpZmllcl9vZmZzZXQFsnRpY2tiYXNlX3JuZG1fdHlwZaRXYXlz3gAnsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcOnc2xpZGVycwatdGlja2Jhc2Vfcm5kbQKqbW9kaWZpZXJfMfuvdGlja2Jhc2Vfcm5kbV8yFrB0aWNrYmFzZV9zbGlkZXJzB6ptb2RpZmllcl8yBap0aWNrYmFzZV8xD6ptb2RpZmllcl8z/qp0aWNrYmFzZV8zAqptb2RpZmllcl80/6p0aWNrYmFzZV80BKptb2RpZmllcl81Aqp0aWNrYmFzZV81Dqp0aWNrYmFzZV82C6ptb2RpZmllcl82+ap0aWNrYmFzZV83A6p0aWNrYmFzZV84D6ptb2RpZmllcl84AKp0aWNrYmFzZV8yAq55YXdfb3B0aW9uc19leIWtZGVsYXlfc2xpZGVycwGrb2Zmc2V0X2xlZnTlpWRlbGF5wqxvZmZzZXRfcmlnaHQjpm1hc3RlcgCqeWF3X29mZnNldACkYm9kecOudGlja2Jhc2VfY2hva2UQqm1vZGlmaWVyXzcAsnRpY2tiYXNlX3JhbmRvbWl6ZcOoeWF3X21vZGUCrGJvZHlfb3B0aW9uc4+mbWFzdGVyAaxmcmVlc3RhbmRpbmeoRGlzYWJsZWSpbGltaXRfbWluOqZqaXR0ZXLDqGludmVydGVywqlsaW1pdF9tYXg6rGxpbWl0X3RpbWluZwSkdHlwZaZTdGF0aWOsbGltaXRfdGlja19sHKxsaW1pdF90aWNrX3I6qmxlZnRfbGltaXQ7sHR5cGVfdGlja3NfdmFsdWUQq3JpZ2h0X2xpbWl0O7F0eXBlX3JhbmRvbV92YWx1ZRCqbGltaXRfdHlwZaVUaWNrc6htb2RpZmllcqRTcGluqHRpY2tiYXNlqU5ldmVybG9zZadkZWxheV8xBKdkZWxheV8yA6dkZWxheV8zAadkZWxheV80CKdkZWxheV81DadkZWxheV82E6dkZWxheV83AqdkZWxheV84Aq9tb2RpZmllcl9vZmZzZXQFsnRpY2tiYXNlX3JuZG1fdHlwZaRXYXlzkt4AJ7Btb2RpZmllcl9vcHRpb25zgqlyYW5kb21pemXCp3NsaWRlcnMDrXRpY2tiYXNlX3JuZG0Cqm1vZGlmaWVyXzEAr3RpY2tiYXNlX3JuZG1fMhCwdGlja2Jhc2Vfc2xpZGVycwaqbW9kaWZpZXJfMgCqdGlja2Jhc2VfMQ+qbW9kaWZpZXJfMwCqdGlja2Jhc2VfMwKqbW9kaWZpZXJfNACqdGlja2Jhc2VfNAOqbW9kaWZpZXJfNQCqdGlja2Jhc2VfNQWqdGlja2Jhc2VfNg6qbW9kaWZpZXJfNgCqdGlja2Jhc2VfNwWqdGlja2Jhc2VfOAKqbW9kaWZpZXJfOACqdGlja2Jhc2VfMgeueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMBq29mZnNldF9sZWZ0AKVkZWxhecOsb2Zmc2V0X3JpZ2h0AKZtYXN0ZXIBqnlhd19vZmZzZXQApGJvZHnDrnRpY2tiYXNlX2Nob2tlEKptb2RpZmllcl83ALJ0aWNrYmFzZV9yYW5kb21pemXDqHlhd19tb2RlAaxib2R5X29wdGlvbnOPpm1hc3RlcgGsZnJlZXN0YW5kaW5np0RlZmF1bHSpbGltaXRfbWluHKZqaXR0ZXLDqGludmVydGVywqlsaW1pdF9tYXg6rGxpbWl0X3RpbWluZwKkdHlwZaZTdGF0aWOsbGltaXRfdGlja19sOqxsaW1pdF90aWNrX3I8qmxlZnRfbGltaXQ8sHR5cGVfdGlja3NfdmFsdWUQq3JpZ2h0X2xpbWl0PLF0eXBlX3JhbmRvbV92YWx1ZRCqbGltaXRfdHlwZaVUaWNrc6htb2RpZmllcqhEaXNhYmxlZKh0aWNrYmFzZalOZXZlcmxvc2WnZGVsYXlfMQKnZGVsYXlfMhSnZGVsYXlfMwKnZGVsYXlfNAOnZGVsYXlfNQqnZGVsYXlfNgWnZGVsYXlfNwKnZGVsYXlfOAKvbW9kaWZpZXJfb2Zmc2V0/7J0aWNrYmFzZV9ybmRtX3R5cGWkV2F5c94AJ7Btb2RpZmllcl9vcHRpb25zgqlyYW5kb21pemXCp3NsaWRlcnMDrXRpY2tiYXNlX3JuZG0Cqm1vZGlmaWVyXzEAr3RpY2tiYXNlX3JuZG1fMhawdGlja2Jhc2Vfc2xpZGVycwOqbW9kaWZpZXJfMgCqdGlja2Jhc2VfMQKqbW9kaWZpZXJfMwCqdGlja2Jhc2VfMw+qbW9kaWZpZXJfNACqdGlja2Jhc2VfNBCqbW9kaWZpZXJfNQCqdGlja2Jhc2VfNRCqdGlja2Jhc2VfNg+qbW9kaWZpZXJfNgCqdGlja2Jhc2VfNxCqdGlja2Jhc2VfOA+qbW9kaWZpZXJfOACqdGlja2Jhc2VfMhaueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMBq29mZnNldF9sZWZ0AKVkZWxhecOsb2Zmc2V0X3JpZ2h0AKZtYXN0ZXIBqnlhd19vZmZzZXQApGJvZHnDrnRpY2tiYXNlX2Nob2tlEKptb2RpZmllcl83ALJ0aWNrYmFzZV9yYW5kb21pemXDqHlhd19tb2RlAaxib2R5X29wdGlvbnOPpm1hc3RlcgGsZnJlZXN0YW5kaW5np0RlZmF1bHSpbGltaXRfbWluHKZqaXR0ZXLDqGludmVydGVywqlsaW1pdF9tYXg6rGxpbWl0X3RpbWluZwKkdHlwZaZTdGF0aWOsbGltaXRfdGlja19sOqxsaW1pdF90aWNrX3I8qmxlZnRfbGltaXQ8sHR5cGVfdGlja3NfdmFsdWUQq3JpZ2h0X2xpbWl0PLF0eXBlX3JhbmRvbV92YWx1ZRCqbGltaXRfdHlwZaVUaWNrc6htb2RpZmllcqhEaXNhYmxlZKh0aWNrYmFzZalOZXZlcmxvc2WnZGVsYXlfMQKnZGVsYXlfMhSnZGVsYXlfMwKnZGVsYXlfNAOnZGVsYXlfNQqnZGVsYXlfNgWnZGVsYXlfNwKnZGVsYXlfOAKvbW9kaWZpZXJfb2Zmc2V0/7J0aWNrYmFzZV9ybmRtX3R5cGWnRGVmYXVsdJLeACewbW9kaWZpZXJfb3B0aW9uc4KpcmFuZG9taXplwqdzbGlkZXJzA610aWNrYmFzZV9ybmRtAqptb2RpZmllcl8x/690aWNrYmFzZV9ybmRtXzIQsHRpY2tiYXNlX3NsaWRlcnMDqm1vZGlmaWVyXzIBqnRpY2tiYXNlXzECqm1vZGlmaWVyXzPQz6p0aWNrYmFzZV8zD6ptb2RpZmllcl80+6p0aWNrYmFzZV80EKptb2RpZmllcl81Gqp0aWNrYmFzZV81EKp0aWNrYmFzZV82D6ptb2RpZmllcl82G6p0aWNrYmFzZV83EKp0aWNrYmFzZV84EKptb2RpZmllcl84AKp0aWNrYmFzZV8yFq55YXdfb3B0aW9uc19leIWtZGVsYXlfc2xpZGVycwarb2Zmc2V0X2xlZnTqpWRlbGF5wqxvZmZzZXRfcmlnaHQopm1hc3RlcgCqeWF3X29mZnNldACkYm9kecOudGlja2Jhc2VfY2hva2UQqm1vZGlmaWVyXzcAsnRpY2tiYXNlX3JhbmRvbWl6ZcOoeWF3X21vZGUCrGJvZHlfb3B0aW9uc4+mbWFzdGVyAaxmcmVlc3RhbmRpbmeoRGlzYWJsZWSpbGltaXRfbWluOqZqaXR0ZXLDqGludmVydGVywqlsaW1pdF9tYXg6rGxpbWl0X3RpbWluZwSkdHlwZaZTdGF0aWOsbGltaXRfdGlja19sMKxsaW1pdF90aWNrX3I6qmxlZnRfbGltaXQ8sHR5cGVfdGlja3NfdmFsdWUEq3JpZ2h0X2xpbWl0PLF0eXBlX3JhbmRvbV92YWx1ZQSqbGltaXRfdHlwZaVUaWNrc6htb2RpZmllcqRTcGluqHRpY2tiYXNlqU5ldmVybG9zZadkZWxheV8xAqdkZWxheV8yFKdkZWxheV8zFKdkZWxheV80AadkZWxheV81BadkZWxheV82A6dkZWxheV83AqdkZWxheV84Aq9tb2RpZmllcl9vZmZzZXT7snRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx03gAnsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcKnc2xpZGVycwOtdGlja2Jhc2Vfcm5kbQKqbW9kaWZpZXJfMf+vdGlja2Jhc2Vfcm5kbV8yFrB0aWNrYmFzZV9zbGlkZXJzA6ptb2RpZmllcl8yAap0aWNrYmFzZV8xAqptb2RpZmllcl8z0M+qdGlja2Jhc2VfMxCqbW9kaWZpZXJfNPuqdGlja2Jhc2VfNA+qbW9kaWZpZXJfNRqqdGlja2Jhc2VfNQ+qdGlja2Jhc2VfNhCqbW9kaWZpZXJfNhuqdGlja2Jhc2VfNxCqdGlja2Jhc2VfOBCqbW9kaWZpZXJfOACqdGlja2Jhc2VfMhaueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMGq29mZnNldF9sZWZ06qVkZWxhecKsb2Zmc2V0X3JpZ2h0KKZtYXN0ZXIBqnlhd19vZmZzZXQApGJvZHnDrnRpY2tiYXNlX2Nob2tlEKptb2RpZmllcl83ALJ0aWNrYmFzZV9yYW5kb21pemXDqHlhd19tb2RlAqxib2R5X29wdGlvbnOPpm1hc3RlcgGsZnJlZXN0YW5kaW5nqERpc2FibGVkqWxpbWl0X21pbjqmaml0dGVyw6hpbnZlcnRlcsKpbGltaXRfbWF4OqxsaW1pdF90aW1pbmcCpHR5cGWmU3RhdGljrGxpbWl0X3RpY2tfbBysbGltaXRfdGlja19yOqpsZWZ0X2xpbWl0PLB0eXBlX3RpY2tzX3ZhbHVlBKtyaWdodF9saW1pdDyxdHlwZV9yYW5kb21fdmFsdWUEqmxpbWl0X3R5cGWlVGlja3OobW9kaWZpZXKkU3Bpbqh0aWNrYmFzZalOZXZlcmxvc2WnZGVsYXlfMQKnZGVsYXlfMhSnZGVsYXlfMxSnZGVsYXlfNAGnZGVsYXlfNQWnZGVsYXlfNgOnZGVsYXlfNwKnZGVsYXlfOAKvbW9kaWZpZXJfb2Zmc2V0+7J0aWNrYmFzZV9ybmRtX3R5cGWnRGVmYXVsdJLeACewbW9kaWZpZXJfb3B0aW9uc4KpcmFuZG9taXplwqdzbGlkZXJzBa10aWNrYmFzZV9ybmRtD6ptb2RpZmllcl8xBK90aWNrYmFzZV9ybmRtXzIQsHRpY2tiYXNlX3NsaWRlcnMDqm1vZGlmaWVyXzL8qnRpY2tiYXNlXzEPqm1vZGlmaWVyXzMAqnRpY2tiYXNlXzMPqm1vZGlmaWVyXzQAqnRpY2tiYXNlXzQQqm1vZGlmaWVyXzUAqnRpY2tiYXNlXzUQqnRpY2tiYXNlXzYPqm1vZGlmaWVyXzYAqnRpY2tiYXNlXzcQqnRpY2tiYXNlXzgPqm1vZGlmaWVyXzgAqnRpY2tiYXNlXzIQrnlhd19vcHRpb25zX2V4ha1kZWxheV9zbGlkZXJzBatvZmZzZXRfbGVmdAClZGVsYXnCrG9mZnNldF9yaWdodACmbWFzdGVyAKp5YXdfb2Zmc2V0AKRib2R5w650aWNrYmFzZV9jaG9rZRCqbW9kaWZpZXJfNwCydGlja2Jhc2VfcmFuZG9taXplw6h5YXdfbW9kZQKsYm9keV9vcHRpb25zj6ZtYXN0ZXIArGZyZWVzdGFuZGluZ6dEZWZhdWx0qWxpbWl0X21pbgCmaml0dGVyw6hpbnZlcnRlcsKpbGltaXRfbWF4PKxsaW1pdF90aW1pbmcCpHR5cGWmU3RhdGljrGxpbWl0X3RpY2tfbACsbGltaXRfdGlja19yPKpsZWZ0X2xpbWl0PLB0eXBlX3RpY2tzX3ZhbHVlBKtyaWdodF9saW1pdDyxdHlwZV9yYW5kb21fdmFsdWUEqmxpbWl0X3R5cGWmU3RhdGljqG1vZGlmaWVyqERpc2FibGVkqHRpY2tiYXNlqU5ldmVybG9zZadkZWxheV8xEKdkZWxheV8yB6dkZWxheV8zAqdkZWxheV80AqdkZWxheV81AqdkZWxheV82AqdkZWxheV83AqdkZWxheV84Aq9tb2RpZmllcl9vZmZzZXT/snRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx03gAnsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcKnc2xpZGVycwWtdGlja2Jhc2Vfcm5kbQ+qbW9kaWZpZXJfMQSvdGlja2Jhc2Vfcm5kbV8yELB0aWNrYmFzZV9zbGlkZXJzA6ptb2RpZmllcl8y/Kp0aWNrYmFzZV8xD6ptb2RpZmllcl8zAKp0aWNrYmFzZV8zD6ptb2RpZmllcl80AKp0aWNrYmFzZV80D6ptb2RpZmllcl81AKp0aWNrYmFzZV81EKp0aWNrYmFzZV82D6ptb2RpZmllcl82AKp0aWNrYmFzZV83EKp0aWNrYmFzZV84D6ptb2RpZmllcl84AKp0aWNrYmFzZV8yEK55YXdfb3B0aW9uc19leIWtZGVsYXlfc2xpZGVycwWrb2Zmc2V0X2xlZnQApWRlbGF5wqxvZmZzZXRfcmlnaHQApm1hc3RlcgCqeWF3X29mZnNldACkYm9kecOudGlja2Jhc2VfY2hva2UQqm1vZGlmaWVyXzcAsnRpY2tiYXNlX3JhbmRvbWl6ZcOoeWF3X21vZGUCrGJvZHlfb3B0aW9uc4+mbWFzdGVyAKxmcmVlc3RhbmRpbmenRGVmYXVsdKlsaW1pdF9taW4ApmppdHRlcsOoaW52ZXJ0ZXLCqWxpbWl0X21heDysbGltaXRfdGltaW5nAqR0eXBlplN0YXRpY6xsaW1pdF90aWNrX2wArGxpbWl0X3RpY2tfcjyqbGVmdF9saW1pdDywdHlwZV90aWNrc192YWx1ZQSrcmlnaHRfbGltaXQ8sXR5cGVfcmFuZG9tX3ZhbHVlBKpsaW1pdF90eXBlplN0YXRpY6htb2RpZmllcqhEaXNhYmxlZKh0aWNrYmFzZalOZXZlcmxvc2WnZGVsYXlfMRCnZGVsYXlfMgenZGVsYXlfMwKnZGVsYXlfNAKnZGVsYXlfNQKnZGVsYXlfNgKnZGVsYXlfNwKnZGVsYXlfOAKvbW9kaWZpZXJfb2Zmc2V0/7J0aWNrYmFzZV9ybmRtX3R5cGWnRGVmYXVsdJLeACewbW9kaWZpZXJfb3B0aW9uc4KpcmFuZG9taXplwqdzbGlkZXJzA610aWNrYmFzZV9ybmRtD6ptb2RpZmllcl8xAK90aWNrYmFzZV9ybmRtXzIQsHRpY2tiYXNlX3NsaWRlcnMDqm1vZGlmaWVyXzIAqnRpY2tiYXNlXzEPqm1vZGlmaWVyXzMAqnRpY2tiYXNlXzMPqm1vZGlmaWVyXzQAqnRpY2tiYXNlXzQPqm1vZGlmaWVyXzUAqnRpY2tiYXNlXzUPqnRpY2tiYXNlXzYQqm1vZGlmaWVyXzYAqnRpY2tiYXNlXzcPqnRpY2tiYXNlXzgQqm1vZGlmaWVyXzgAqnRpY2tiYXNlXzIQrnlhd19vcHRpb25zX2V4ha1kZWxheV9zbGlkZXJzA6tvZmZzZXRfbGVmdAClZGVsYXnCrG9mZnNldF9yaWdodACmbWFzdGVyAKp5YXdfb2Zmc2V0AKRib2R5w650aWNrYmFzZV9jaG9rZRCqbW9kaWZpZXJfNwCydGlja2Jhc2VfcmFuZG9taXplw6h5YXdfbW9kZQGsYm9keV9vcHRpb25zj6ZtYXN0ZXIBrGZyZWVzdGFuZGluZ6dEZWZhdWx0qWxpbWl0X21pbjqmaml0dGVyw6hpbnZlcnRlcsKpbGltaXRfbWF4OqxsaW1pdF90aW1pbmcCpHR5cGWmU3RhdGljrGxpbWl0X3RpY2tfbDqsbGltaXRfdGlja19yOqpsZWZ0X2xpbWl0PLB0eXBlX3RpY2tzX3ZhbHVlBKtyaWdodF9saW1pdDyxdHlwZV9yYW5kb21fdmFsdWUEqmxpbWl0X3R5cGWmU3RhdGljqG1vZGlmaWVyqERpc2FibGVkqHRpY2tiYXNlqU5ldmVybG9zZadkZWxheV8xAqdkZWxheV8yFKdkZWxheV8zAqdkZWxheV80AqdkZWxheV81AqdkZWxheV82AqdkZWxheV83AqdkZWxheV84Aq9tb2RpZmllcl9vZmZzZXQAsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx03gAnsG1vZGlmaWVyX29wdGlvbnOCqXJhbmRvbWl6ZcKnc2xpZGVycwOtdGlja2Jhc2Vfcm5kbQ+qbW9kaWZpZXJfMQCvdGlja2Jhc2Vfcm5kbV8yELB0aWNrYmFzZV9zbGlkZXJzA6ptb2RpZmllcl8yAKp0aWNrYmFzZV8xD6ptb2RpZmllcl8zAKp0aWNrYmFzZV8zD6ptb2RpZmllcl80AKp0aWNrYmFzZV80D6ptb2RpZmllcl81AKp0aWNrYmFzZV81D6p0aWNrYmFzZV82D6ptb2RpZmllcl82AKp0aWNrYmFzZV83D6p0aWNrYmFzZV84D6ptb2RpZmllcl84AKp0aWNrYmFzZV8yEK55YXdfb3B0aW9uc19leIWtZGVsYXlfc2xpZGVycwOrb2Zmc2V0X2xlZnQApWRlbGF5wqxvZmZzZXRfcmlnaHQApm1hc3RlcgCqeWF3X29mZnNldACkYm9kecOudGlja2Jhc2VfY2hva2UQqm1vZGlmaWVyXzcAsnRpY2tiYXNlX3JhbmRvbWl6ZcOoeWF3X21vZGUBrGJvZHlfb3B0aW9uc4+mbWFzdGVyAaxmcmVlc3RhbmRpbmenRGVmYXVsdKlsaW1pdF9taW46pmppdHRlcsOoaW52ZXJ0ZXLCqWxpbWl0X21heDqsbGltaXRfdGltaW5nAqR0eXBlplN0YXRpY6xsaW1pdF90aWNrX2w6rGxpbWl0X3RpY2tfcjqqbGVmdF9saW1pdDywdHlwZV90aWNrc192YWx1ZQSrcmlnaHRfbGltaXQ8sXR5cGVfcmFuZG9tX3ZhbHVlBKpsaW1pdF90eXBlplN0YXRpY6htb2RpZmllcqhEaXNhYmxlZKh0aWNrYmFzZalOZXZlcmxvc2WnZGVsYXlfMQKnZGVsYXlfMhSnZGVsYXlfMwKnZGVsYXlfNAKnZGVsYXlfNQKnZGVsYXlfNgKnZGVsYXlfNwKnZGVsYXlfOAKvbW9kaWZpZXJfb2Zmc2V0ALJ0aWNrYmFzZV9ybmRtX3R5cGWnRGVmYXVsdN4AJ6xhcnJvd3NfcmlnaHShPql2aWV3bW9kZWyIpmF4aXNfegKpY3Njb19yb2xswqltYWluX2hhbmSkTGVmdKpyaWdodF9oYW5kwqZheGlzX3jsqWxlZnRfaGFuZMKmYXhpc1958KNmb3ZCrHNjcmVlbl9jb2xvcqkjRkZGRkZGRkavc2NyZWVuX2R1cmF0aW9uB6t3b3JsZF9jb2xvcpOmU2ltcGxlqSNGRkZGRkY5QqF+rndvcmxkX2R1cmF0aW9uCqt3YWxraW5nX2RpcjKtd2Fsa2luZ19kaXJfMgCmc2t5Ym94pU5pZ2h0qmxvZ19ldmVudHOFpnByZWZpeKJucKxkYW1hZ2VfZGVhbHTDq21haW5fYWNjZW50qSNGRkZGRkZGRqlwdXJjaGFzZXPDrXByZWZpeF9hY2NlbnSpI0ZGRkZGRkZGrWludGVycG9sYXRpbmcOp2xlYW5pbmcAp2ZhbGxpbmcAqGNsYW5fdGFnwqd3YWxraW5nALNjbGllbnRzaWRlX25pY2tuYW1lwq1+Y3VzdG9tX3Njb3BlhaRzaXplzQEso2dhcAqrZWRnZV9hY2NlbnSpI0ZGRkZGRjAwq21haW5fYWNjZW50qSNGRkZGRkY4Rqdyb3RhdGVkwq5ub19mYWxsX2RhbWFnZcOtbWFudWFsX2Fycm93c8OrZmFzdF9sYWRkZXLDtH5jbGllbnRzaWRlX25pY2tuYW1lgaVpbnB1dKhsYWdzaWdodLJ1bmxvY2tfZmFrZWxhdGVuY3nDsH5jdXN0b21fZmFrZWR1Y2uBpXNjYWxlzJawZm9yY2VfdGVhbWFpbWJvdMK8YWxsb3dfbGVhbmluZ193aGlsZV9zdGFuZGluZ8KzZnJlZXpldGltZV9mYWtlZHVja8OqZWFydGhxdWFrZcKvY3VzdG9tX2Zha2VkdWNrw61hcnJvd3NfYWNjZW50qSNCN0JDRTNFNLBkYW1hZ2VfaW5kaWNhdG9yw6thcnJvd3NfZm9udKVMYXJnZapoaXRtYXJrZXJzk6lTY3JlZW4gMkSoV29ybGQgM0Shfqthc3BlY3RyYXRpb4Glc2NhbGV9rmFycm93c19mb3J3YXJkoV63a2VlcF9tb2RlbF90cmFuc3BhcmVuY3nDpmFkZG9uc5a0RGlzYWJsZSBmb290IHNoYWRvd3O6RGlzYWJsZSB1c2Ugb3BlbnMgYnV5IG1lbnW8Q2xlYXIgY29uc29sZSBvbiByb3VuZCBzdGFydK1Qcm9wZXIgc2t5Ym94t0Rpc2FibGUgcmFnZG9sbCBwaHlzaWNzoX6rYXJyb3dzX2xlZnShPLh+a2VlcF9tb2RlbF90cmFuc3BhcmVuY3mBpXNjYWxlCqxjdXN0b21fc2NvcGXD";
        end;
        if not v35.database[l_pui_0.string("\a{Small Text}\226\128\162  Test  (Improving soon)")] or #v35.database == 0 then
            v35.database[l_pui_0.string("\a{Small Text}\226\128\162  Test  (Improving soon)")] = "lIaxd2F0ZXJtYXJrX29wdGlvbnONr2dyYWRpZW50X3N3aXRjaMKzZ3JhZGllbnRfc2F0dXJhdGlvbgClcG9zX3nNAZ2lbGFiZWyoa3VrdXdhc3OsZ3JhZGllbnRfaHVlAK5ncmFkaWVudF9zcGVlZAGtcHJlZml4X2FjY2VudKkjQ0JDQkY2RkalcG9zX3jNAaGucG9zdGZpeF9hY2NlbnSpI0ZGRkZGRkZGpGZvbnSnRGVmYXVsdKttYWluX2FjY2VudKkjRkYwMDAwRkambWFzdGVyALBncmFkaWVudF9yYWluYm93wrRwcm9ncmVzc192ZXJzaW9uX2JhckSscHJlc2V0X2lucHV0p1NuYXBwZXKuYWN0aXZlX3NjcmlwdHMBpWFib3V0AqtwcmVzZXRfbGlzdAiLpXRlYW1zAalkaXNhYmxlcnORoX6qaGlkZV9zaG90c6hCcmVhayBMQ65mb3JjZV9icmVha19sY5rZJgd7TGluayBBY3RpdmV974aDICAgICAHREVGQVVMVFN0YW5kaW5n2SQHe0xpbmsgQWN0aXZlfe+cjCAgICAHREVGQVVMVFJ1bm5pbmfZJQd7TGluayBBY3RpdmV975WUICAgICAHREVGQVVMVFNsb3dpbmfZJQd7TGluayBBY3RpdmV974aTICAgB0RFRkFVTFRDcm91Y2hpbmfZJQd7TGluayBBY3RpdmV97ouOICAgIAdERUZBVUxUU25lYWtpbmfZIAd7TGluayBBY3RpdmV97pWGICAgIAdERUZBVUxUQWly2SgHe0xpbmsgQWN0aXZlfe6VhyAgB0RFRkFVTFRBaXIgQ3JvdWNoaW5n2SgHe0xpbmsgQWN0aXZlfe6TgSAgIAdERUZBVUxURnJlZXN0YW5kaW5n2SIHe0xpbmsgQWN0aXZlfe+BuSAgB0RFRkFVTFRNYW51YWxzoX6tb3B0aW9uc190YWJsZYutZmFrZV9sYWdfdHlwZalBbHdheXMgb26sdHdlYWtzX3JhbmdlzLSsdHdlYWtzX3NwZWVkAax0d2Vha3NfcGl0Y2ioRGlzYWJsZWSydHdlYWtzX2xlZnRfb2Zmc2V04qlzYWZlX2hlYWSS2U0He0xpbmsgQWN0aXZlfe6VhyAgB0RFRkFVTFRBaXIgQ3JvdWNoaW5nICAHe1NtYWxsIFRleHR9KyAgB0RFRkFVTFRLbmlmZS9UYXNlcqF+pnR3ZWFrc5Ghfq90d2Vha3NfeWF3X3R5cGWkU3BpbqhmYWtlX2xhZ8OzdHdlYWtzX3JpZ2h0X29mZnNldB6uYXZvaWRfYmFja3N0YWLDqm1hbnVhbF95YXeoRGlzYWJsZWSnYm9keV9mc8O0ZnJlZXN0YW5kaW5nX2FsbG93ZWTDsmRpc2FibGVfbGNfZ3JlbmFkZcOsZnJlZXN0YW5kaW5nwqZzdGF0ZXMImZLeACevdGlja2Jhc2Vfcm5kbV8yFrB0aWNrYmFzZV9zbGlkZXJzBqp0aWNrYmFzZV82B6p0aWNrYmFzZV83EKp0aWNrYmFzZV84D6dkZWxheV8xCqdkZWxheV8yC6dkZWxheV8zDK55YXdfb3B0aW9uc19leIWtZGVsYXlfc2xpZGVycwerb2Zmc2V0X2xlZnTppWRlbGF5w6xvZmZzZXRfcmlnaHQtpm1hc3RlcgCoeWF3X21vZGUCqnlhd19vZmZzZXQKqm1vZGlmaWVyXzEsqG1vZGlmaWVypTUtV2F5qm1vZGlmaWVyXzImr21vZGlmaWVyX29mZnNldPuqbW9kaWZpZXJfM+WwbW9kaWZpZXJfb3B0aW9uc4Knc2xpZGVycwSpcmFuZG9taXplw6ptb2RpZmllcl80JqdkZWxheV80DadkZWxheV81Dqptb2RpZmllcl81AKdkZWxheV83B6dkZWxheV84Aqptb2RpZmllcl82AKxib2R5X29wdGlvbnOPqWxpbWl0X21pbh2mbWFzdGVyAKlsaW1pdF9tYXg6rGxpbWl0X3RpbWluZwmoaW52ZXJ0ZXLCrGxpbWl0X3RpY2tfbCiwdHlwZV90aWNrc192YWx1ZQ6sbGltaXRfdGlja19yPLF0eXBlX3JhbmRvbV92YWx1ZQ6qbGltaXRfdHlwZaVUaWNrc6R0eXBlplJhbmRvbaZqaXR0ZXLCqmxlZnRfbGltaXQ8rGZyZWVzdGFuZGluZ6dEZWZhdWx0q3JpZ2h0X2xpbWl0PKptb2RpZmllcl83AKp0aWNrYmFzZV81BLJ0aWNrYmFzZV9yYW5kb21pemXCqnRpY2tiYXNlXzEDpGJvZHnDqm1vZGlmaWVyXzgAqnRpY2tiYXNlXzICrnRpY2tiYXNlX2Nob2tlCah0aWNrYmFzZaZOeWFuemGqdGlja2Jhc2VfMw+ydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSnZGVsYXlfNgaqdGlja2Jhc2VfNAKtdGlja2Jhc2Vfcm5kbQLeACevdGlja2Jhc2Vfcm5kbV8yELB0aWNrYmFzZV9zbGlkZXJzA6p0aWNrYmFzZV82D6p0aWNrYmFzZV83EKp0aWNrYmFzZV84EKdkZWxheV8xCqdkZWxheV8yC6dkZWxheV8zDK55YXdfb3B0aW9uc19leIWtZGVsYXlfc2xpZGVycwerb2Zmc2V0X2xlZnTppWRlbGF5w6xvZmZzZXRfcmlnaHQtpm1hc3RlcgCoeWF3X21vZGUCqnlhd19vZmZzZXQKqm1vZGlmaWVyXzEsqG1vZGlmaWVypTUtV2F5qm1vZGlmaWVyXzImr21vZGlmaWVyX29mZnNldPuqbW9kaWZpZXJfM+WwbW9kaWZpZXJfb3B0aW9uc4Knc2xpZGVycwSpcmFuZG9taXplw6ptb2RpZmllcl80JqdkZWxheV80DadkZWxheV81Dqptb2RpZmllcl81AKdkZWxheV83B6dkZWxheV84Aqptb2RpZmllcl82AKxib2R5X29wdGlvbnOPqWxpbWl0X21pbh2mbWFzdGVyAKlsaW1pdF9tYXg6rGxpbWl0X3RpbWluZwmoaW52ZXJ0ZXLCrGxpbWl0X3RpY2tfbCiwdHlwZV90aWNrc192YWx1ZQ6sbGltaXRfdGlja19yPLF0eXBlX3JhbmRvbV92YWx1ZQ6qbGltaXRfdHlwZaVUaWNrc6R0eXBlplJhbmRvbaZqaXR0ZXLCqmxlZnRfbGltaXQ8rGZyZWVzdGFuZGluZ6dEZWZhdWx0q3JpZ2h0X2xpbWl0PKptb2RpZmllcl83AKp0aWNrYmFzZV81D7J0aWNrYmFzZV9yYW5kb21pemXDqnRpY2tiYXNlXzEPpGJvZHnDqm1vZGlmaWVyXzgAqnRpY2tiYXNlXzIQrnRpY2tiYXNlX2Nob2tlEKh0aWNrYmFzZalOZXZlcmxvc2WqdGlja2Jhc2VfMw+ydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSnZGVsYXlfNgaqdGlja2Jhc2VfNA+tdGlja2Jhc2Vfcm5kbQ+S3gAnr3RpY2tiYXNlX3JuZG1fMhawdGlja2Jhc2Vfc2xpZGVycwOqdGlja2Jhc2VfNg+qdGlja2Jhc2VfNw+qdGlja2Jhc2VfOBCnZGVsYXlfMQqnZGVsYXlfMgunZGVsYXlfMwyueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMHq29mZnNldF9sZWZ06aVkZWxhecOsb2Zmc2V0X3JpZ2h0LaZtYXN0ZXIBqHlhd19tb2RlAqp5YXdfb2Zmc2V0BKptb2RpZmllcl8xLKhtb2RpZmllcqU1LVdheaptb2RpZmllcl8yJq9tb2RpZmllcl9vZmZzZXQDqm1vZGlmaWVyXzPlsG1vZGlmaWVyX29wdGlvbnOCp3NsaWRlcnMEqXJhbmRvbWl6ZcOqbW9kaWZpZXJfNCWnZGVsYXlfNA2nZGVsYXlfNQ6qbW9kaWZpZXJfNQCnZGVsYXlfNwenZGVsYXlfOAKqbW9kaWZpZXJfNgCsYm9keV9vcHRpb25zj6lsaW1pdF9taW4wpm1hc3RlcgGpbGltaXRfbWF4OqxsaW1pdF90aW1pbmcOqGludmVydGVywqxsaW1pdF90aWNrX2wcsHR5cGVfdGlja3NfdmFsdWUJrGxpbWl0X3RpY2tfcjqxdHlwZV9yYW5kb21fdmFsdWUJqmxpbWl0X3R5cGWmUmFuZG9tpHR5cGWmUmFuZG9tpmppdHRlcsKqbGVmdF9saW1pdDysZnJlZXN0YW5kaW5np0RlZmF1bHSrcmlnaHRfbGltaXQ8qm1vZGlmaWVyXzcAqnRpY2tiYXNlXzUQsnRpY2tiYXNlX3JhbmRvbWl6ZcOqdGlja2Jhc2VfMQ+kYm9kecOqbW9kaWZpZXJfOACqdGlja2Jhc2VfMhCudGlja2Jhc2VfY2hva2UQqHRpY2tiYXNlpk55YW56Yap0aWNrYmFzZV8zELJ0aWNrYmFzZV9ybmRtX3R5cGWnRGVmYXVsdKdkZWxheV82Bqp0aWNrYmFzZV80EK10aWNrYmFzZV9ybmRtAt4AJ690aWNrYmFzZV9ybmRtXzIQsHRpY2tiYXNlX3NsaWRlcnMDqnRpY2tiYXNlXzYQqnRpY2tiYXNlXzcQqnRpY2tiYXNlXzgPp2RlbGF5XzEKp2RlbGF5XzILp2RlbGF5XzMMrnlhd19vcHRpb25zX2V4ha1kZWxheV9zbGlkZXJzB6tvZmZzZXRfbGVmdOmlZGVsYXnDrG9mZnNldF9yaWdodC2mbWFzdGVyAah5YXdfbW9kZQKqeWF3X29mZnNldASqbW9kaWZpZXJfMSyobW9kaWZpZXKlNS1XYXmqbW9kaWZpZXJfMiavbW9kaWZpZXJfb2Zmc2V0A6ptb2RpZmllcl8z5bBtb2RpZmllcl9vcHRpb25zgqdzbGlkZXJzBKlyYW5kb21pemXDqm1vZGlmaWVyXzQlp2RlbGF5XzQNp2RlbGF5XzUOqm1vZGlmaWVyXzUAp2RlbGF5XzcHp2RlbGF5XzgCqm1vZGlmaWVyXzYArGJvZHlfb3B0aW9uc4+pbGltaXRfbWluMKZtYXN0ZXIBqWxpbWl0X21heDqsbGltaXRfdGltaW5nDqhpbnZlcnRlcsKsbGltaXRfdGlja19sHLB0eXBlX3RpY2tzX3ZhbHVlCaxsaW1pdF90aWNrX3I6sXR5cGVfcmFuZG9tX3ZhbHVlCapsaW1pdF90eXBlplJhbmRvbaR0eXBlplJhbmRvbaZqaXR0ZXLCqmxlZnRfbGltaXQ8rGZyZWVzdGFuZGluZ6dEZWZhdWx0q3JpZ2h0X2xpbWl0PKptb2RpZmllcl83AKp0aWNrYmFzZV81ELJ0aWNrYmFzZV9yYW5kb21pemXDqnRpY2tiYXNlXzEPpGJvZHnDqm1vZGlmaWVyXzgAqnRpY2tiYXNlXzIQrnRpY2tiYXNlX2Nob2tlEKh0aWNrYmFzZalOZXZlcmxvc2WqdGlja2Jhc2VfMxCydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSnZGVsYXlfNgaqdGlja2Jhc2VfNA+tdGlja2Jhc2Vfcm5kbQ+S3gAnr3RpY2tiYXNlX3JuZG1fMhCwdGlja2Jhc2Vfc2xpZGVycwiqdGlja2Jhc2VfNhCqdGlja2Jhc2VfNwaqdGlja2Jhc2VfOAunZGVsYXlfMQ+nZGVsYXlfMhSnZGVsYXlfMwKueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMBq29mZnNldF9sZWZ00NqlZGVsYXnDrG9mZnNldF9yaWdodCymbWFzdGVyAah5YXdfbW9kZQKqeWF3X29mZnNldACqbW9kaWZpZXJfMQKobW9kaWZpZXKlMy1XYXmqbW9kaWZpZXJfMhuvbW9kaWZpZXJfb2Zmc2V0Aaptb2RpZmllcl8zALBtb2RpZmllcl9vcHRpb25zgqdzbGlkZXJzAqlyYW5kb21pemXDqm1vZGlmaWVyXzQAp2RlbGF5XzQCp2RlbGF5XzUCqm1vZGlmaWVyXzUAp2RlbGF5XzcCp2RlbGF5XzgCqm1vZGlmaWVyXzYArGJvZHlfb3B0aW9uc4+pbGltaXRfbWluOqZtYXN0ZXIAqWxpbWl0X21heDqsbGltaXRfdGltaW5nCahpbnZlcnRlcsKsbGltaXRfdGlja19sOrB0eXBlX3RpY2tzX3ZhbHVlBqxsaW1pdF90aWNrX3I6sXR5cGVfcmFuZG9tX3ZhbHVlBqpsaW1pdF90eXBlpVRpY2tzpHR5cGWlVGlja3Omaml0dGVyw6psZWZ0X2xpbWl0OqxmcmVlc3RhbmRpbmeoRGlzYWJsZWSrcmlnaHRfbGltaXQ6qm1vZGlmaWVyXzcAqnRpY2tiYXNlXzUJsnRpY2tiYXNlX3JhbmRvbWl6ZcOqdGlja2Jhc2VfMQukYm9kecOqbW9kaWZpZXJfOACqdGlja2Jhc2VfMg+udGlja2Jhc2VfY2hva2UQqHRpY2tiYXNlpk55YW56Yap0aWNrYmFzZV8zErJ0aWNrYmFzZV9ybmRtX3R5cGWkV2F5c6dkZWxheV82Aqp0aWNrYmFzZV80Aq10aWNrYmFzZV9ybmRtD94AJ690aWNrYmFzZV9ybmRtXzIQsHRpY2tiYXNlX3NsaWRlcnMDqnRpY2tiYXNlXzYPqnRpY2tiYXNlXzcPqnRpY2tiYXNlXzgQp2RlbGF5XzEPp2RlbGF5XzIUp2RlbGF5XzMCrnlhd19vcHRpb25zX2V4ha1kZWxheV9zbGlkZXJzAatvZmZzZXRfbGVmdNDapWRlbGF5w6xvZmZzZXRfcmlnaHQspm1hc3RlcgGoeWF3X21vZGUCqnlhd19vZmZzZXQAqm1vZGlmaWVyXzECqG1vZGlmaWVypTMtV2F5qm1vZGlmaWVyXzIbr21vZGlmaWVyX29mZnNldAGqbW9kaWZpZXJfMwCwbW9kaWZpZXJfb3B0aW9uc4Knc2xpZGVycwKpcmFuZG9taXplw6ptb2RpZmllcl80AKdkZWxheV80AqdkZWxheV81Aqptb2RpZmllcl81AKdkZWxheV83AqdkZWxheV84Aqptb2RpZmllcl82AKxib2R5X29wdGlvbnOPqWxpbWl0X21pbjqmbWFzdGVyAKlsaW1pdF9tYXg6rGxpbWl0X3RpbWluZwmoaW52ZXJ0ZXLCrGxpbWl0X3RpY2tfbDqwdHlwZV90aWNrc192YWx1ZQasbGltaXRfdGlja19yOrF0eXBlX3JhbmRvbV92YWx1ZQaqbGltaXRfdHlwZaVUaWNrc6R0eXBlpVRpY2tzpmppdHRlcsOqbGVmdF9saW1pdDqsZnJlZXN0YW5kaW5nqERpc2FibGVkq3JpZ2h0X2xpbWl0Oqptb2RpZmllcl83AKp0aWNrYmFzZV81D7J0aWNrYmFzZV9yYW5kb21pemXDqnRpY2tiYXNlXzEPpGJvZHnDqm1vZGlmaWVyXzgAqnRpY2tiYXNlXzIQrnRpY2tiYXNlX2Nob2tlEKh0aWNrYmFzZalOZXZlcmxvc2WqdGlja2Jhc2VfMxCydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSnZGVsYXlfNgKqdGlja2Jhc2VfNA+tdGlja2Jhc2Vfcm5kbQ+S3gAnr3RpY2tiYXNlX3JuZG1fMhawdGlja2Jhc2Vfc2xpZGVycwaqdGlja2Jhc2VfNgeqdGlja2Jhc2VfNwiqdGlja2Jhc2VfOAenZGVsYXlfMQqnZGVsYXlfMgunZGVsYXlfMwyueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMHq29mZnNldF9sZWZ06aVkZWxhecOsb2Zmc2V0X3JpZ2h0LaZtYXN0ZXIBqHlhd19tb2RlAqp5YXdfb2Zmc2V0Captb2RpZmllcl8xLKhtb2RpZmllcqU1LVdheaptb2RpZmllcl8yJq9tb2RpZmllcl9vZmZzZXQKqm1vZGlmaWVyXzPlsG1vZGlmaWVyX29wdGlvbnOCp3NsaWRlcnMEqXJhbmRvbWl6ZcOqbW9kaWZpZXJfNCanZGVsYXlfNA2nZGVsYXlfNQ6qbW9kaWZpZXJfNfynZGVsYXlfNwenZGVsYXlfOAKqbW9kaWZpZXJfNhCsYm9keV9vcHRpb25zj6lsaW1pdF9taW4wpm1hc3RlcgCpbGltaXRfbWF4OqxsaW1pdF90aW1pbmcJqGludmVydGVywqxsaW1pdF90aWNrX2wosHR5cGVfdGlja3NfdmFsdWUQrGxpbWl0X3RpY2tfcjyxdHlwZV9yYW5kb21fdmFsdWUQqmxpbWl0X3R5cGWlVGlja3OkdHlwZaZSYW5kb22maml0dGVyw6psZWZ0X2xpbWl0HqxmcmVlc3RhbmRpbmeoRGlzYWJsZWSrcmlnaHRfbGltaXQeqm1vZGlmaWVyXzcsqnRpY2tiYXNlXzUEsnRpY2tiYXNlX3JhbmRvbWl6ZcKqdGlja2Jhc2VfMQOkYm9kecOqbW9kaWZpZXJfOOqqdGlja2Jhc2VfMgKudGlja2Jhc2VfY2hva2UJqHRpY2tiYXNlpk55YW56Yap0aWNrYmFzZV8zD7J0aWNrYmFzZV9ybmRtX3R5cGWnRGVmYXVsdKdkZWxheV82Bqp0aWNrYmFzZV80Aq10aWNrYmFzZV9ybmRtAt4AJ690aWNrYmFzZV9ybmRtXzIWsHRpY2tiYXNlX3NsaWRlcnMGqnRpY2tiYXNlXzYHqnRpY2tiYXNlXzcPqnRpY2tiYXNlXzgPp2RlbGF5XzEKp2RlbGF5XzILp2RlbGF5XzMMrnlhd19vcHRpb25zX2V4ha1kZWxheV9zbGlkZXJzB6tvZmZzZXRfbGVmdOmlZGVsYXnDrG9mZnNldF9yaWdodC2mbWFzdGVyAah5YXdfbW9kZQKqeWF3X29mZnNldAmqbW9kaWZpZXJfMSyobW9kaWZpZXKlNS1XYXmqbW9kaWZpZXJfMiavbW9kaWZpZXJfb2Zmc2V0Cqptb2RpZmllcl8z5bBtb2RpZmllcl9vcHRpb25zgqdzbGlkZXJzBKlyYW5kb21pemXDqm1vZGlmaWVyXzQmp2RlbGF5XzQNp2RlbGF5XzUOqm1vZGlmaWVyXzX8p2RlbGF5XzcHp2RlbGF5XzgCqm1vZGlmaWVyXzYQrGJvZHlfb3B0aW9uc4+pbGltaXRfbWluMKZtYXN0ZXIAqWxpbWl0X21heDqsbGltaXRfdGltaW5nCahpbnZlcnRlcsKsbGltaXRfdGlja19sKLB0eXBlX3RpY2tzX3ZhbHVlEKxsaW1pdF90aWNrX3I8sXR5cGVfcmFuZG9tX3ZhbHVlEKpsaW1pdF90eXBlpVRpY2tzpHR5cGWmUmFuZG9tpmppdHRlcsOqbGVmdF9saW1pdB6sZnJlZXN0YW5kaW5nqERpc2FibGVkq3JpZ2h0X2xpbWl0Hqptb2RpZmllcl83LKp0aWNrYmFzZV81BLJ0aWNrYmFzZV9yYW5kb21pemXDqnRpY2tiYXNlXzEDpGJvZHnDqm1vZGlmaWVyXzjqqnRpY2tiYXNlXzICrnRpY2tiYXNlX2Nob2tlEKh0aWNrYmFzZaZOeWFuemGqdGlja2Jhc2VfMw+ydGlja2Jhc2Vfcm5kbV90eXBlpFdheXOnZGVsYXlfNgaqdGlja2Jhc2VfNAKtdGlja2Jhc2Vfcm5kbQKS3gAnr3RpY2tiYXNlX3JuZG1fMhawdGlja2Jhc2Vfc2xpZGVycweqdGlja2Jhc2VfNg+qdGlja2Jhc2VfNw2qdGlja2Jhc2VfOAqnZGVsYXlfMQqnZGVsYXlfMgunZGVsYXlfMwyueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMGq29mZnNldF9sZWZ06aVkZWxhecOsb2Zmc2V0X3JpZ2h0LaZtYXN0ZXIBqHlhd19tb2RlAqp5YXdfb2Zmc2V0Captb2RpZmllcl8xLKhtb2RpZmllcqUzLVdheaptb2RpZmllcl8yJq9tb2RpZmllcl9vZmZzZXQCqm1vZGlmaWVyXzPlsG1vZGlmaWVyX29wdGlvbnOCp3NsaWRlcnMEqXJhbmRvbWl6ZcOqbW9kaWZpZXJfNCWnZGVsYXlfNA2nZGVsYXlfNQ6qbW9kaWZpZXJfNQKnZGVsYXlfNwKnZGVsYXlfOAKqbW9kaWZpZXJfNvmsYm9keV9vcHRpb25zj6lsaW1pdF9taW46pm1hc3RlcgGpbGltaXRfbWF4OqxsaW1pdF90aW1pbmcJqGludmVydGVywqxsaW1pdF90aWNrX2wesHR5cGVfdGlja3NfdmFsdWUJrGxpbWl0X3RpY2tfcjyxdHlwZV9yYW5kb21fdmFsdWUJqmxpbWl0X3R5cGWlVGlja3OkdHlwZaZSYW5kb22maml0dGVyw6psZWZ0X2xpbWl0HaxmcmVlc3RhbmRpbmeoRGlzYWJsZWSrcmlnaHRfbGltaXQ8qm1vZGlmaWVyXzcAqnRpY2tiYXNlXzUOsnRpY2tiYXNlX3JhbmRvbWl6ZcOqdGlja2Jhc2VfMQ+kYm9kecOqbW9kaWZpZXJfOACqdGlja2Jhc2VfMgKudGlja2Jhc2VfY2hva2UQqHRpY2tiYXNlpk55YW56Yap0aWNrYmFzZV8zArJ0aWNrYmFzZV9ybmRtX3R5cGWnRGVmYXVsdKdkZWxheV82Bqp0aWNrYmFzZV80BK10aWNrYmFzZV9ybmRtAt4AJ690aWNrYmFzZV9ybmRtXzIWsHRpY2tiYXNlX3NsaWRlcnMHqnRpY2tiYXNlXzYPqnRpY2tiYXNlXzcNqnRpY2tiYXNlXzgPp2RlbGF5XzEKp2RlbGF5XzILp2RlbGF5XzMMrnlhd19vcHRpb25zX2V4ha1kZWxheV9zbGlkZXJzBqtvZmZzZXRfbGVmdOmlZGVsYXnDrG9mZnNldF9yaWdodC2mbWFzdGVyAah5YXdfbW9kZQKqeWF3X29mZnNldAmqbW9kaWZpZXJfMSyobW9kaWZpZXKlMy1XYXmqbW9kaWZpZXJfMiavbW9kaWZpZXJfb2Zmc2V0Aqptb2RpZmllcl8z5bBtb2RpZmllcl9vcHRpb25zgqdzbGlkZXJzBKlyYW5kb21pemXDqm1vZGlmaWVyXzQlp2RlbGF5XzQNp2RlbGF5XzUOqm1vZGlmaWVyXzUCp2RlbGF5XzcCp2RlbGF5XzgCqm1vZGlmaWVyXzb5rGJvZHlfb3B0aW9uc4+pbGltaXRfbWluOqZtYXN0ZXIBqWxpbWl0X21heDqsbGltaXRfdGltaW5nCahpbnZlcnRlcsKsbGltaXRfdGlja19sHrB0eXBlX3RpY2tzX3ZhbHVlCaxsaW1pdF90aWNrX3I8sXR5cGVfcmFuZG9tX3ZhbHVlCapsaW1pdF90eXBlpVRpY2tzpHR5cGWmUmFuZG9tpmppdHRlcsOqbGVmdF9saW1pdB2sZnJlZXN0YW5kaW5nqERpc2FibGVkq3JpZ2h0X2xpbWl0PKptb2RpZmllcl83AKp0aWNrYmFzZV81DrJ0aWNrYmFzZV9yYW5kb21pemXDqnRpY2tiYXNlXzEPpGJvZHnDqm1vZGlmaWVyXzgAqnRpY2tiYXNlXzICrnRpY2tiYXNlX2Nob2tlEKh0aWNrYmFzZaZOeWFuemGqdGlja2Jhc2VfMwKydGlja2Jhc2Vfcm5kbV90eXBlpFdheXOnZGVsYXlfNgaqdGlja2Jhc2VfNAStdGlja2Jhc2Vfcm5kbQKS3gAnr3RpY2tiYXNlX3JuZG1fMhawdGlja2Jhc2Vfc2xpZGVycwaqdGlja2Jhc2VfNg6qdGlja2Jhc2VfNwWqdGlja2Jhc2VfOAKnZGVsYXlfMQqnZGVsYXlfMgunZGVsYXlfMwyueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMHq29mZnNldF9sZWZ056VkZWxhecOsb2Zmc2V0X3JpZ2h0LaZtYXN0ZXIAqHlhd19tb2RlAqp5YXdfb2Zmc2V0AKptb2RpZmllcl8xLKhtb2RpZmllcqU1LVdheaptb2RpZmllcl8yJq9tb2RpZmllcl9vZmZzZXQAqm1vZGlmaWVyXzPlsG1vZGlmaWVyX29wdGlvbnOCp3NsaWRlcnMFqXJhbmRvbWl6ZcOqbW9kaWZpZXJfNCSnZGVsYXlfNA2nZGVsYXlfNQ6qbW9kaWZpZXJfNSWnZGVsYXlfNwenZGVsYXlfOBGqbW9kaWZpZXJfNv2sYm9keV9vcHRpb25zj6lsaW1pdF9taW4cpm1hc3RlcgCpbGltaXRfbWF4OqxsaW1pdF90aW1pbmcOqGludmVydGVywqxsaW1pdF90aWNrX2wwsHR5cGVfdGlja3NfdmFsdWUJrGxpbWl0X3RpY2tfcjqxdHlwZV9yYW5kb21fdmFsdWUJqmxpbWl0X3R5cGWlVGlja3OkdHlwZaVUaWNrc6ZqaXR0ZXLDqmxlZnRfbGltaXQ6rGZyZWVzdGFuZGluZ6dEZWZhdWx0q3JpZ2h0X2xpbWl0Oqptb2RpZmllcl8346p0aWNrYmFzZV81BbJ0aWNrYmFzZV9yYW5kb21pemXDqnRpY2tiYXNlXzEPpGJvZHnDqm1vZGlmaWVyXzj6qnRpY2tiYXNlXzIHrnRpY2tiYXNlX2Nob2tlEKh0aWNrYmFzZaZOeWFuemGqdGlja2Jhc2VfMwKydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSnZGVsYXlfNgaqdGlja2Jhc2VfNAOtdGlja2Jhc2Vfcm5kbQLeACevdGlja2Jhc2Vfcm5kbV8yFrB0aWNrYmFzZV9zbGlkZXJzA6p0aWNrYmFzZV82D6p0aWNrYmFzZV83EKp0aWNrYmFzZV84D6dkZWxheV8xCqdkZWxheV8yC6dkZWxheV8zDK55YXdfb3B0aW9uc19leIWtZGVsYXlfc2xpZGVycwerb2Zmc2V0X2xlZnTnpWRlbGF5w6xvZmZzZXRfcmlnaHQtpm1hc3RlcgCoeWF3X21vZGUCqnlhd19vZmZzZXQAqm1vZGlmaWVyXzEsqG1vZGlmaWVypTUtV2F5qm1vZGlmaWVyXzImr21vZGlmaWVyX29mZnNldACqbW9kaWZpZXJfM+WwbW9kaWZpZXJfb3B0aW9uc4Knc2xpZGVycwWpcmFuZG9taXplw6ptb2RpZmllcl80JKdkZWxheV80DadkZWxheV81Dqptb2RpZmllcl81JadkZWxheV83B6dkZWxheV84Eaptb2RpZmllcl82/axib2R5X29wdGlvbnOPqWxpbWl0X21pbhymbWFzdGVyAalsaW1pdF9tYXg6rGxpbWl0X3RpbWluZw6oaW52ZXJ0ZXLCrGxpbWl0X3RpY2tfbDCwdHlwZV90aWNrc192YWx1ZQmsbGltaXRfdGlja19yOrF0eXBlX3JhbmRvbV92YWx1ZQmqbGltaXRfdHlwZaVUaWNrc6R0eXBlplJhbmRvbaZqaXR0ZXLDqmxlZnRfbGltaXQ6rGZyZWVzdGFuZGluZ6dEZWZhdWx0q3JpZ2h0X2xpbWl0Oqptb2RpZmllcl8346p0aWNrYmFzZV81ELJ0aWNrYmFzZV9yYW5kb21pemXDqnRpY2tiYXNlXzECpGJvZHnDqm1vZGlmaWVyXzj6qnRpY2tiYXNlXzIWrnRpY2tiYXNlX2Nob2tlEKh0aWNrYmFzZalOZXZlcmxvc2WqdGlja2Jhc2VfMw+ydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSnZGVsYXlfNgaqdGlja2Jhc2VfNBCtdGlja2Jhc2Vfcm5kbQKS3gAnr3RpY2tiYXNlX3JuZG1fMhawdGlja2Jhc2Vfc2xpZGVycweqdGlja2Jhc2VfNgWqdGlja2Jhc2VfNwaqdGlja2Jhc2VfOAKnZGVsYXlfMQqnZGVsYXlfMgunZGVsYXlfMwyueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMGq29mZnNldF9sZWZ06aVkZWxhecOsb2Zmc2V0X3JpZ2h0LaZtYXN0ZXIAqHlhd19tb2RlAqp5YXdfb2Zmc2V0Captb2RpZmllcl8xLKhtb2RpZmllcqU1LVdheaptb2RpZmllcl8yJq9tb2RpZmllcl9vZmZzZXQKqm1vZGlmaWVyXzPlsG1vZGlmaWVyX29wdGlvbnOCp3NsaWRlcnMEqXJhbmRvbWl6ZcOqbW9kaWZpZXJfNNDap2RlbGF5XzQNp2RlbGF5XzUOqm1vZGlmaWVyXzXR/0ynZGVsYXlfNw+nZGVsYXlfOAKqbW9kaWZpZXJfNiesYm9keV9vcHRpb25zj6lsaW1pdF9taW4Cpm1hc3RlcgGpbGltaXRfbWF4OqxsaW1pdF90aW1pbmcJqGludmVydGVywqxsaW1pdF90aWNrX2wnsHR5cGVfdGlja3NfdmFsdWULrGxpbWl0X3RpY2tfcjuxdHlwZV9yYW5kb21fdmFsdWULqmxpbWl0X3R5cGWlVGlja3OkdHlwZaZSYW5kb22maml0dGVyw6psZWZ0X2xpbWl0HqxmcmVlc3RhbmRpbmenRGVmYXVsdKtyaWdodF9saW1pdB6qbW9kaWZpZXJfN9DOqnRpY2tiYXNlXzUDsnRpY2tiYXNlX3JhbmRvbWl6ZcOqdGlja2Jhc2VfMQ+kYm9kecOqbW9kaWZpZXJfOPGqdGlja2Jhc2VfMgKudGlja2Jhc2VfY2hva2UQqHRpY2tiYXNlpk55YW56Yap0aWNrYmFzZV8zArJ0aWNrYmFzZV9ybmRtX3R5cGWnRGVmYXVsdKdkZWxheV82Bqp0aWNrYmFzZV80BK10aWNrYmFzZV9ybmRtAt4AJ690aWNrYmFzZV9ybmRtXzIWsHRpY2tiYXNlX3NsaWRlcnMDqnRpY2tiYXNlXzYQqnRpY2tiYXNlXzcQqnRpY2tiYXNlXzgQp2RlbGF5XzEKp2RlbGF5XzILp2RlbGF5XzMMrnlhd19vcHRpb25zX2V4ha1kZWxheV9zbGlkZXJzBqtvZmZzZXRfbGVmdOmlZGVsYXnDrG9mZnNldF9yaWdodC2mbWFzdGVyAKh5YXdfbW9kZQKqeWF3X29mZnNldAmqbW9kaWZpZXJfMSyobW9kaWZpZXKlNS1XYXmqbW9kaWZpZXJfMiavbW9kaWZpZXJfb2Zmc2V0Cqptb2RpZmllcl8z5bBtb2RpZmllcl9vcHRpb25zgqdzbGlkZXJzBKlyYW5kb21pemXDqm1vZGlmaWVyXzTQ2qdkZWxheV80DadkZWxheV81Dqptb2RpZmllcl810f9Mp2RlbGF5XzcPp2RlbGF5XzgCqm1vZGlmaWVyXzYnrGJvZHlfb3B0aW9uc4+pbGltaXRfbWluAqZtYXN0ZXIBqWxpbWl0X21heDqsbGltaXRfdGltaW5nCahpbnZlcnRlcsKsbGltaXRfdGlja19sJ7B0eXBlX3RpY2tzX3ZhbHVlC6xsaW1pdF90aWNrX3I7sXR5cGVfcmFuZG9tX3ZhbHVlC6psaW1pdF90eXBlpVRpY2tzpHR5cGWmUmFuZG9tpmppdHRlcsOqbGVmdF9saW1pdB6sZnJlZXN0YW5kaW5np0RlZmF1bHSrcmlnaHRfbGltaXQeqm1vZGlmaWVyXzfQzqp0aWNrYmFzZV81D7J0aWNrYmFzZV9yYW5kb21pemXDqnRpY2tiYXNlXzECpGJvZHnDqm1vZGlmaWVyXzjxqnRpY2tiYXNlXzIWrnRpY2tiYXNlX2Nob2tlEKh0aWNrYmFzZalOZXZlcmxvc2WqdGlja2Jhc2VfMxCydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSnZGVsYXlfNgaqdGlja2Jhc2VfNA+tdGlja2Jhc2Vfcm5kbQKS3gAnr3RpY2tiYXNlX3JuZG1fMhCwdGlja2Jhc2Vfc2xpZGVycwOqdGlja2Jhc2VfNg+qdGlja2Jhc2VfNxCqdGlja2Jhc2VfOA+nZGVsYXlfMRCnZGVsYXlfMgenZGVsYXlfMwKueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMFq29mZnNldF9sZWZ0AKVkZWxhecKsb2Zmc2V0X3JpZ2h0AKZtYXN0ZXIAqHlhd19tb2RlAap5YXdfb2Zmc2V0AKptb2RpZmllcl8xBKhtb2RpZmllcqhEaXNhYmxlZKptb2RpZmllcl8y/K9tb2RpZmllcl9vZmZzZXT/qm1vZGlmaWVyXzMAsG1vZGlmaWVyX29wdGlvbnOCp3NsaWRlcnMFqXJhbmRvbWl6ZcKqbW9kaWZpZXJfNACnZGVsYXlfNAKnZGVsYXlfNQKqbW9kaWZpZXJfNQCnZGVsYXlfNwKnZGVsYXlfOAKqbW9kaWZpZXJfNgCsYm9keV9vcHRpb25zj6lsaW1pdF9taW4Bpm1hc3RlcgCpbGltaXRfbWF4PKxsaW1pdF90aW1pbmcBqGludmVydGVywqxsaW1pdF90aWNrX2wBsHR5cGVfdGlja3NfdmFsdWUErGxpbWl0X3RpY2tfcjqxdHlwZV9yYW5kb21fdmFsdWUEqmxpbWl0X3R5cGWmU3RhdGljpHR5cGWmU3RhdGljpmppdHRlcsOqbGVmdF9saW1pdDysZnJlZXN0YW5kaW5nqFJldmVyc2Vkq3JpZ2h0X2xpbWl0PKptb2RpZmllcl83AKp0aWNrYmFzZV81ELJ0aWNrYmFzZV9yYW5kb21pemXDqnRpY2tiYXNlXzEPpGJvZHnDqm1vZGlmaWVyXzgAqnRpY2tiYXNlXzIQrnRpY2tiYXNlX2Nob2tlEKh0aWNrYmFzZalOZXZlcmxvc2WqdGlja2Jhc2VfMw+ydGlja2Jhc2Vfcm5kbV90eXBlp0RlZmF1bHSnZGVsYXlfNgKqdGlja2Jhc2VfNBCtdGlja2Jhc2Vfcm5kbQ/eACevdGlja2Jhc2Vfcm5kbV8yELB0aWNrYmFzZV9zbGlkZXJzA6p0aWNrYmFzZV82D6p0aWNrYmFzZV83EKp0aWNrYmFzZV84D6dkZWxheV8xEKdkZWxheV8yB6dkZWxheV8zAq55YXdfb3B0aW9uc19leIWtZGVsYXlfc2xpZGVycwWrb2Zmc2V0X2xlZnQApWRlbGF5wqxvZmZzZXRfcmlnaHQApm1hc3RlcgCoeWF3X21vZGUBqnlhd19vZmZzZXQAqm1vZGlmaWVyXzEEqG1vZGlmaWVyqERpc2FibGVkqm1vZGlmaWVyXzL8r21vZGlmaWVyX29mZnNldP+qbW9kaWZpZXJfMwCwbW9kaWZpZXJfb3B0aW9uc4Knc2xpZGVycwWpcmFuZG9taXplwqptb2RpZmllcl80AKdkZWxheV80AqdkZWxheV81Aqptb2RpZmllcl81AKdkZWxheV83AqdkZWxheV84Aqptb2RpZmllcl82AKxib2R5X29wdGlvbnOPqWxpbWl0X21pbgGmbWFzdGVyAKlsaW1pdF9tYXg8rGxpbWl0X3RpbWluZwGoaW52ZXJ0ZXLCrGxpbWl0X3RpY2tfbAGwdHlwZV90aWNrc192YWx1ZQSsbGltaXRfdGlja19yOrF0eXBlX3JhbmRvbV92YWx1ZQSqbGltaXRfdHlwZaZTdGF0aWOkdHlwZaZTdGF0aWOmaml0dGVyw6psZWZ0X2xpbWl0PKxmcmVlc3RhbmRpbmeoUmV2ZXJzZWSrcmlnaHRfbGltaXQ8qm1vZGlmaWVyXzcAqnRpY2tiYXNlXzUQsnRpY2tiYXNlX3JhbmRvbWl6ZcOqdGlja2Jhc2VfMQ+kYm9kecOqbW9kaWZpZXJfOACqdGlja2Jhc2VfMhCudGlja2Jhc2VfY2hva2UQqHRpY2tiYXNlqU5ldmVybG9zZap0aWNrYmFzZV8zD7J0aWNrYmFzZV9ybmRtX3R5cGWnRGVmYXVsdKdkZWxheV82Aqp0aWNrYmFzZV80D610aWNrYmFzZV9ybmRtD5LeACevdGlja2Jhc2Vfcm5kbV8yELB0aWNrYmFzZV9zbGlkZXJzA6p0aWNrYmFzZV82EKp0aWNrYmFzZV83D6p0aWNrYmFzZV84EKdkZWxheV8xAqdkZWxheV8yFKdkZWxheV8zAq55YXdfb3B0aW9uc19leIWtZGVsYXlfc2xpZGVycwOrb2Zmc2V0X2xlZnQApWRlbGF5wqxvZmZzZXRfcmlnaHQApm1hc3RlcgCoeWF3X21vZGUBqnlhd19vZmZzZXQAqm1vZGlmaWVyXzEAqG1vZGlmaWVyqERpc2FibGVkqm1vZGlmaWVyXzIAr21vZGlmaWVyX29mZnNldACqbW9kaWZpZXJfMwCwbW9kaWZpZXJfb3B0aW9uc4Knc2xpZGVycwOpcmFuZG9taXplwqptb2RpZmllcl80AKdkZWxheV80AqdkZWxheV81Aqptb2RpZmllcl81AKdkZWxheV83AqdkZWxheV84Aqptb2RpZmllcl82AKxib2R5X29wdGlvbnOPqWxpbWl0X21pbjqmbWFzdGVyAalsaW1pdF9tYXg6rGxpbWl0X3RpbWluZwKoaW52ZXJ0ZXLCrGxpbWl0X3RpY2tfbDqwdHlwZV90aWNrc192YWx1ZQSsbGltaXRfdGlja19yOrF0eXBlX3JhbmRvbV92YWx1ZQSqbGltaXRfdHlwZaZTdGF0aWOkdHlwZaZTdGF0aWOmaml0dGVyw6psZWZ0X2xpbWl0PKxmcmVlc3RhbmRpbmenRGVmYXVsdKtyaWdodF9saW1pdDyqbW9kaWZpZXJfNwCqdGlja2Jhc2VfNQ+ydGlja2Jhc2VfcmFuZG9taXplw6p0aWNrYmFzZV8xD6Rib2R5w6ptb2RpZmllcl84AKp0aWNrYmFzZV8yEK50aWNrYmFzZV9jaG9rZRCodGlja2Jhc2WpTmV2ZXJsb3NlqnRpY2tiYXNlXzMPsnRpY2tiYXNlX3JuZG1fdHlwZadEZWZhdWx0p2RlbGF5XzYCqnRpY2tiYXNlXzQPrXRpY2tiYXNlX3JuZG0P3gAnr3RpY2tiYXNlX3JuZG1fMhCwdGlja2Jhc2Vfc2xpZGVycwOqdGlja2Jhc2VfNg+qdGlja2Jhc2VfNw+qdGlja2Jhc2VfOA+nZGVsYXlfMQKnZGVsYXlfMhSnZGVsYXlfMwKueWF3X29wdGlvbnNfZXiFrWRlbGF5X3NsaWRlcnMDq29mZnNldF9sZWZ0AKVkZWxhecKsb2Zmc2V0X3JpZ2h0AKZtYXN0ZXIAqHlhd19tb2RlAap5YXdfb2Zmc2V0AKptb2RpZmllcl8xAKhtb2RpZmllcqhEaXNhYmxlZKptb2RpZmllcl8yAK9tb2RpZmllcl9vZmZzZXQAqm1vZGlmaWVyXzMAsG1vZGlmaWVyX29wdGlvbnOCp3NsaWRlcnMDqXJhbmRvbWl6ZcKqbW9kaWZpZXJfNACnZGVsYXlfNAKnZGVsYXlfNQKqbW9kaWZpZXJfNQCnZGVsYXlfNwKnZGVsYXlfOAKqbW9kaWZpZXJfNgCsYm9keV9vcHRpb25zj6lsaW1pdF9taW46pm1hc3RlcgGpbGltaXRfbWF4OqxsaW1pdF90aW1pbmcCqGludmVydGVywqxsaW1pdF90aWNrX2w6sHR5cGVfdGlja3NfdmFsdWUErGxpbWl0X3RpY2tfcjqxdHlwZV9yYW5kb21fdmFsdWUEqmxpbWl0X3R5cGWmU3RhdGljpHR5cGWmU3RhdGljpmppdHRlcsOqbGVmdF9saW1pdDysZnJlZXN0YW5kaW5np0RlZmF1bHSrcmlnaHRfbGltaXQ8qm1vZGlmaWVyXzcAqnRpY2tiYXNlXzUPsnRpY2tiYXNlX3JhbmRvbWl6ZcOqdGlja2Jhc2VfMQ+kYm9kecOqbW9kaWZpZXJfOACqdGlja2Jhc2VfMhCudGlja2Jhc2VfY2hva2UQqHRpY2tiYXNlqU5ldmVybG9zZap0aWNrYmFzZV8zD7J0aWNrYmFzZV9ybmRtX3R5cGWnRGVmYXVsdKdkZWxheV82Aqp0aWNrYmFzZV80D610aWNrYmFzZV9ybmRtD94AJ6xzY3JlZW5fY29sb3KpI0JGNDc0N0ZGr3NjcmVlbl9kdXJhdGlvbgerd29ybGRfY29sb3KTplNpbXBsZakjQkY0NzQ3Rkahfq53b3JsZF9kdXJhdGlvbgqrd2Fsa2luZ19kaXIyrXdhbGtpbmdfZGlyXzIApnNreWJveKVOaWdodLB+Y3VzdG9tX2Zha2VkdWNrgaVzY2FsZcyWuH5rZWVwX21vZGVsX3RyYW5zcGFyZW5jeYGlc2NhbGUKrX5jdXN0b21fc2NvcGWFq2VkZ2VfYWNjZW50qSNGRkZGRkYwMKdyb3RhdGVkwqRzaXplzQEso2dhcAqrbWFpbl9hY2NlbnSpI0ZGRkZGRjhGqmxvZ19ldmVudHOFrXByZWZpeF9hY2NlbnSpI0ZGRkZGRkZGqXB1cmNoYXNlc8OmcHJlZml4om5wrGRhbWFnZV9kZWFsdMOrbWFpbl9hY2NlbnSpI0ZGRkZGRkZGrWludGVycG9sYXRpbmcOp2xlYW5pbmcAp2ZhbGxpbmcAqGNsYW5fdGFnw6d3YWxraW5nArNjbGllbnRzaWRlX25pY2tuYW1lwq5ub19mYWxsX2RhbWFnZcO8YWxsb3dfbGVhbmluZ193aGlsZV9zdGFuZGluZ8KrZmFzdF9sYWRkZXLDqmVhcnRocXVha2XCsnVubG9ja19mYWtlbGF0ZW5jecOtYXJyb3dzX2FjY2VudKkjQ0VFMUZGRTSwZm9yY2VfdGVhbWFpbWJvdMKrYXJyb3dzX2ZvbnSlTGFyZ2WzZnJlZXpldGltZV9mYWtlZHVja8OvY3VzdG9tX2Zha2VkdWNrw7BkYW1hZ2VfaW5kaWNhdG9yw6thcnJvd3NfbGVmdKE8qmhpdG1hcmtlcnOTqVNjcmVlbiAyRKhXb3JsZCAzRKF+q2FzcGVjdHJhdGlvgaVzY2FsZXisYXJyb3dzX3JpZ2h0oT6mYWRkb25zl7REaXNhYmxlIGZvb3Qgc2hhZG93c7pEaXNhYmxlIHVzZSBvcGVucyBidXkgbWVudbxDbGVhciBjb25zb2xlIG9uIHJvdW5kIHN0YXJ0rVByb3BlciBza3lib3i3RGlzYWJsZSByYWdkb2xsIHBoeXNpY3O9RGlzYWJsZSBzZXJ2ZXIgZmlsZSBkb3dubG9hZHOhfrR+Y2xpZW50c2lkZV9uaWNrbmFtZYGlaW5wdXSobGFnc2lnaHSuYXJyb3dzX2ZvcndhcmShXrdrZWVwX21vZGVsX3RyYW5zcGFyZW5jecOsY3VzdG9tX3Njb3Blw6l2aWV3bW9kZWyIqnJpZ2h0X2hhbmTCpmF4aXNfeOyjZm92SaZheGlzX3nwpmF4aXNfevmpY3Njb19yb2xswqlsZWZ0X2hhbmTCqW1haW5faGFuZKRMZWZ0rW1hbnVhbF9hcnJvd3PD";
        end;
        v35.home.elements.preset_input:set("");
        v35:update();
        v35.home.elements.preset_buttons.save:set_callback(function()
            -- upvalues: v35 (ref)
            v35:save();
        end);
        v35.home.elements.preset_buttons.load:set_callback(function()
            -- upvalues: v35 (ref)
            v35:load();
        end);
        v35.home.elements.preset_buttons.delete:set_callback(function()
            -- upvalues: v35 (ref)
            v35:delete();
        end);
        v35.home.elements.preset_buttons.export:set_callback(function()
            -- upvalues: v35 (ref)
            v35:export();
        end);
        v35.home.elements.preset_buttons.import:set_callback(function()
            -- upvalues: v35 (ref)
            v35:import();
        end);
        v35.home.elements.preset_buttons.create:set_callback(function()
            -- upvalues: v35 (ref)
            v35:create();
        end);
        local function v37(v36)
            return (v36:gsub("[%z\001-\031]", ""):gsub("{.-}", ""):gsub("[\226\128\162\226\156\166]", ""):match("^%s*(.-)%s*$"):gsub("^DEFAULT", ""):gsub("%(Improving soon%)", ""):gsub("%s*$", ""));
        end;
        v35.home.elements.preset_list:set_callback(function(v38)
            -- upvalues: v35 (ref), v37 (ref)
            v35:disabler();
            cvar.playvol:call("ui\\csgo_ui_contract_type1", 1);
            local v39 = v38:get();
            local v40 = v38:list()[v39];
            if v40 and v40 ~= "" and not v35:is_separator(v40) then
                local v41 = v37(v40);
                v35.home.elements.preset_input:set(v41);
            end;
        end);
        local function v42()
            -- upvalues: v35 (ref)
            db.snapshot555_555 = v35.database;
        end;
        events.shutdown(v42);
    end, 
    update = function(v43)
        local v44 = {};
        for _, v46 in ipairs(v43.system_presets) do
            v44[v46] = v46;
        end;
        for v47, _ in pairs(v43.database) do
            if not v44[v47] then
                v44[v47] = v47;
            end;
        end;
        local v49 = {};
        for v50 in pairs(v44) do
            table.insert(v49, v50);
        end;
        table.sort(v49);
        local v51 = {};
        for _, v53 in ipairs(v43.system_presets) do
            table.insert(v51, v53);
        end;
        local v54 = false;
        for _, v56 in ipairs(v49) do
            if not v43:is_system_preset(v56) then
                v54 = true;
                break;
            end;
        end;
        if v54 then
            table.insert(v51, v43.separator);
        end;
        for _, v58 in ipairs(v49) do
            if not v43:is_system_preset(v58) then
                table.insert(v51, v58);
            end;
        end;
        v43.home.elements.preset_list:update(v51);
    end, 
    is_system_preset = function(v59, v60)
        for _, v62 in ipairs(v59.system_presets) do
            if v60 == v62 then
                return true;
            end;
        end;
        return false;
    end, 
    is_separator = function(v63, v64)
        return v64 == v63.separator;
    end, 
    save = function(v65)
        -- upvalues: l_pui_0 (ref), l_base64_0 (ref)
        local v66 = v65.home.elements.preset_list:get();
        local v67 = v65.home.elements.preset_list:list()[v66];
        if not v67 or v67 == "" then
            common.add_event("Invalid preset name", "triangle-exclamation");
            cvar.playvol:call("ui\\weapon_cant_buy", 1);
            return;
        elseif not v65.database[v67] then
            common.add_event("Preset doesnt exist", "triangle-exclamation");
            cvar.playvol:call("ui\\weapon_cant_buy", 1);
            return;
        else
            local v68 = l_pui_0.setup({
                [1] = v65.home.elements, 
                [2] = v65.antiaim.elements, 
                [3] = v65.antiaim.data, 
                [4] = v65.other.elements
            }, true);
            local v69 = l_base64_0.encode(msgpack.pack(v68:save()));
            v65.database[v67] = v69;
            db.snapshot555_555 = v65.database;
            common.add_event("Preset saved successfully", "gear");
            cvar.playvol:call("ui\\beepclear", 1);
            v65:update();
            return;
        end;
    end, 
    load = function(v70)
        -- upvalues: l_pui_0 (ref), l_base64_0 (ref)
        local v71 = v70.home.elements.preset_list:get();
        local v72 = v70.home.elements.preset_list:list()[v71];
        if not v72 or not v70.database[v72] then
            common.add_event("Failed to load", "triangle-exclamation");
            cvar.playvol:call("ui\\weapon_cant_buy", 1);
            return;
        else
            local v73 = l_pui_0.setup({
                [1] = v70.home.elements, 
                [2] = v70.antiaim.elements, 
                [3] = v70.antiaim.data, 
                [4] = v70.other.elements
            }, true);
            local v74 = l_base64_0.decode(v70.database[v72]);
            v73:load((msgpack.unpack(v74)));
            common.add_event("Preset loaded successfully", "gear");
            cvar.playvol:call("ui\\beepclear", 1);
            return;
        end;
    end, 
    delete = function(v75)
        local v76 = v75.home.elements.preset_list:get();
        local v77 = v75.home.elements.preset_list:list()[v76];
        if not v77 or v77 == "" then
            common.add_event("Invalid name", "triangle-exclamation");
            cvar.playvol:call("ui\\weapon_cant_buy", 1);
            return;
        elseif not v75.database[v77] then
            common.add_event("Preset doesnt exist", "triangle-exclamation");
            cvar.playvol:call("ui\\weapon_cant_buy", 1);
            return;
        else
            v75.database[v77] = nil;
            db.snapshot555_555 = v75.database;
            common.add_event("Preset has been deleted", "gear");
            cvar.playvol:call("ui\\beepclear", 1);
            v75:update();
            return;
        end;
    end, 
    export = function(v78)
        -- upvalues: l_clipboard_0 (ref)
        local v79 = v78.home.elements.preset_list:get();
        local v80 = v78.home.elements.preset_list:list()[v79];
        if not v80 or not v78.database[v80] then
            common.add_event("Preset doesnt exist", "triangle-exclamation");
            cvar.playvol:call("ui\\weapon_cant_buy", 1);
            return;
        else
            l_clipboard_0.set(v78.database[v80]);
            common.add_event("Preset has been exported to clipboard", "gear");
            cvar.playvol:call("ui\\beepclear", 1);
            return;
        end;
    end, 
    import = function(v81)
        -- upvalues: l_clipboard_0 (ref)
        if l_clipboard_0.get() == nil then
            common.add_event("Clipboard is empty", "triangle-exclamation");
            cvar.playvol:call("ui\\weapon_cant_buy", 1);
            return;
        else
            local v82 = v81.home.elements.preset_list:get();
            local v83 = v81.home.elements.preset_list:list()[v82];
            v81.database[v83] = l_clipboard_0.get();
            db.snapshot555_555 = v81.database;
            common.add_event("Imported successfully", "gear");
            cvar.playvol:call("ui\\beepclear", 1);
            v81:update();
            return;
        end;
    end, 
    create = function(v84)
        -- upvalues: l_pui_0 (ref), l_base64_0 (ref)
        local v85 = v84.home.elements.preset_input:get();
        local v86 = v84.home.elements.preset_list:get();
        local v87 = v84.home.elements.preset_list:list()[v86];
        if string.match(v85, "^%s*$") or v85 == v87 then
            common.add_event("Invalid name", "triangle-exclamation");
            cvar.playvol:call("ui\\weapon_cant_buy", 1);
            return;
        elseif #v85 > 16 then
            common.add_event("Preset name cannot exceed 16 characters", "triangle-exclamation");
            cvar.playvol:call("ui\\weapon_cant_buy", 1);
            return;
        else
            local v88 = l_pui_0.setup({
                [1] = v84.home.elements, 
                [2] = v84.antiaim.elements, 
                [3] = v84.antiaim.data, 
                [4] = v84.other.elements
            }, true);
            local v89 = l_base64_0.encode(msgpack.pack(v88:save()));
            v84.database[v85] = v89;
            db.snapshot555_555 = v84.database;
            common.add_event("Preset has been created", "gear");
            cvar.playvol:call("ui\\beepclear", 1);
            v84:update();
            return;
        end;
    end, 
    disabler = function(v90)
        local v91 = v90.home.elements.preset_list:list()[v90.home.elements.preset_list:get()];
        local v92 = {};
        for _, v94 in ipairs(v90.system_presets) do
            v92[v94] = true;
        end;
        local v95 = v92[v91];
        local v96 = v91 == v90.separator;
        local v97 = v95 or v96;
        local l_v96_0 = v96;
        local l_preset_buttons_0 = v90.home.elements.preset_buttons;
        l_preset_buttons_0.save:disabled(v97);
        l_preset_buttons_0.delete:disabled(v97);
        l_preset_buttons_0.import:disabled(v97);
        l_preset_buttons_0.export:disabled(v97);
        l_preset_buttons_0.load:disabled(l_v96_0);
    end
}):struct("antiaim")({
    init = function(v100)
        -- upvalues: l_pui_0 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
        v100.groups = {
            states = l_pui_0.create("\v\238\147\162", " ", 1), 
            builder = l_pui_0.create("\v\238\147\162", "builder", 2), 
            options = l_pui_0.create("\v\238\147\162", ""), 
            snap_builder = l_pui_0.create("\v\238\147\162", "snap builder")
        };
        v100.e_teams = {
            [1] = "\v\226\128\162  \rTerrorists", 
            [2] = "\v\226\128\162  \rCounter-Terrorists"
        };
        v100.e_states = {
            [1] = "\v\239\134\131     \rStanding", 
            [2] = "\v\239\156\140    \rRunning", 
            [3] = "\v\239\149\148     \rSlowing", 
            [4] = "\v\239\134\147   \rCrouching", 
            [5] = "\v\238\139\142    \rSneaking", 
            [6] = "\v\238\149\134    \rAir", 
            [7] = "\v\238\149\135  \rAir Crouching", 
            [8] = "\v\238\147\129   \rFreestanding", 
            [9] = "\v\239\129\185  \rManuals"
        };
        v100.elements = {
            teams = v100.groups.states:list("\v\239\131\128  \rSelect the state you want to configure.", v100.e_teams), 
            states = v100.groups.states:list("", v100.e_states), 
            force_break_lc = v100.groups.snap_builder:selectable("\a{Small Text}\226\128\162  \rForce Break LC", v100.e_states), 
            hide_shots = v100.groups.snap_builder:combo("    \a{Small Text}\226\164\183  \rHide Shots", "Favor Fire Rate", "Favor Fake Lag", "Break LC"), 
            options_gear = v100.groups.options:label("\v\226\128\162  \rOptions  \v\239\134\178"), 
            options_table = {}
        };
        local v101 = v100.elements.options_gear:create();
        v100.elements.options_table = {
            safe_head = v101:selectable("\v\226\128\162  \rSafe Head  \v\238\141\186", "\v\239\134\131     \rStanding", "\v\239\134\147   \rCrouching  \a{Small Text}+  \v\238\139\142  \rSneaking", "\v\238\149\135  \rAir Crouching  \a{Small Text}+  \rKnife/Taser"), 
            avoid_backstab = v101:switch("\v\226\128\162  \rAvoid Backstab  \v\239\155\181"), 
            fake_lag = v101:switch("\v\226\128\162  \rFluctuate Fake Lag  \v\239\131\133"), 
            fake_lag_type = v101:combo("    \v\226\164\183  \rType", "Always on", "R8 Revolver"), 
            tweaks = v101:selectable("\v\226\128\162  \rTweaks  \v\239\128\147", "Warmup", "No Enemies"), 
            tweaks_pitch = v101:combo("    \v\226\164\183  \rPitch", "Disabled", "Down", "Up"), 
            tweaks_yaw_type = v101:combo("    \v\226\164\183  \rYaw", "Spin", "Distortion", "L&R"), 
            tweaks_range = v101:slider("            \v\226\164\183  \rRange", 1, 180, 180, nil, "\194\176"), 
            tweaks_speed = v101:slider("            \v\226\164\183  \rSpeed", 1, 10, 2, nil, "t"), 
            tweaks_left_offset = v101:slider("            \v\226\164\183  \rLeft", -180, 180, -30, nil, "\194\176"), 
            tweaks_right_offset = v101:slider("            \v\226\164\183  \rRight", -180, 180, 30, nil, "\194\176")
        };
        v100.elements.options_table.fake_lag_type:depend(v100.elements.options_table.fake_lag);
        v100.elements.options_table.safe_head:tooltip("Works only when the local player is hittable and positioned above the enemy.");
        v100.elements.options_table.avoid_backstab:tooltip("Faces knife enemies when they are close to avoid one hit backstabs.");
        v100.elements.options_table.fake_lag:tooltip("Don\226\128\153t use this if you throw nades with fake lag \226\128\148 it can break grenade helper lineups.");
        v100.elements.options_table.tweaks:tooltip("Select a condition to view and configure anti aim settings that will only apply during that condition.");
        local l_builder_0 = v100.groups.builder;
        v100.elements.disable_lc_grenade = v100.groups.snap_builder:switch("    \a{Small Text}\226\164\183  \rDisable on Grenade");
        v100.elements.disable_lc_grenade:tooltip("Disables defensive when holding a grenade, so you can throw it without issues.");
        v100.elements.options_table.tweaks_pitch:depend({
            [1] = nil, 
            [2] = "Warmup", 
            [3] = "No Enemies", 
            [1] = v100.elements.options_table.tweaks
        });
        v100.elements.options_table.tweaks_yaw_type:depend({
            [1] = nil, 
            [2] = "Warmup", 
            [3] = "No Enemies", 
            [1] = v100.elements.options_table.tweaks
        });
        v100.elements.options_table.tweaks_range:depend({
            [1] = nil, 
            [2] = "Warmup", 
            [3] = "No Enemies", 
            [1] = v100.elements.options_table.tweaks
        }, {
            [1] = nil, 
            [2] = "L&R", 
            [3] = true, 
            [1] = v100.elements.options_table.tweaks_yaw_type
        });
        v100.elements.options_table.tweaks_speed:depend({
            [1] = nil, 
            [2] = "Warmup", 
            [3] = "No Enemies", 
            [1] = v100.elements.options_table.tweaks
        }, {
            [1] = nil, 
            [2] = "L&R", 
            [3] = true, 
            [1] = v100.elements.options_table.tweaks_yaw_type
        });
        v100.elements.options_table.tweaks_left_offset:depend({
            [1] = nil, 
            [2] = "Warmup", 
            [3] = "No Enemies", 
            [1] = v100.elements.options_table.tweaks
        }, {
            [1] = nil, 
            [2] = "L&R", 
            [1] = v100.elements.options_table.tweaks_yaw_type
        });
        v100.elements.options_table.tweaks_right_offset:depend({
            [1] = nil, 
            [2] = "Warmup", 
            [3] = "No Enemies", 
            [1] = v100.elements.options_table.tweaks
        }, {
            [1] = nil, 
            [2] = "L&R", 
            [1] = v100.elements.options_table.tweaks_yaw_type
        });
        v100.elements.freestanding_allowed = v100.groups.builder:switch("\v\226\128\162  \rAllow  \v\238\147\129");
        v100.data = {};
        for v103, _ in ipairs(v100.e_states) do
            v100.data[v103] = {};
            do
                local l_v103_0 = v103;
                for v106, _ in ipairs(v100.e_teams) do
                    local l_states_0 = v100.elements.states;
                    local l_teams_0 = v100.elements.teams;
                    v100.data[l_v103_0][v106] = {
                        yaw_mode = l_builder_0:slider("\v\226\128\162  \rMode  \v\239\151\189", 1, 2, 1, nil, function(v110)
                            return ({
                                [1] = "1-Way", 
                                [2] = "2-Way"
                            })[v110];
                        end):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = v106
                        }), 
                        yaw_offset = l_builder_0:slider("    \v\226\164\183  \rOffset", -180, 180, 0, nil, "\194\176"), 
                        modifier = l_builder_0:combo("\v\226\128\162  \rJitter  \v\239\151\189", "Disabled", "Offset", "Center", "Random", "Spin", "3-Way", "5-Way"):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = v106
                        }), 
                        modifier_offset = l_builder_0:slider("    \v\226\164\183  \rOffset", -180, 180, 0, nil, "\194\176"), 
                        body = l_builder_0:switch("\v\226\128\162  \rDesync  \v\239\151\189"):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = v106
                        })
                    };
                    local v111 = v100.data[l_v103_0][v106].modifier:create();
                    v100.data[l_v103_0][v106].modifier_options = {
                        randomize = v111:switch("\v\226\128\162  \rRandomize  \a{Small Text}\239\148\162"), 
                        sliders = v111:slider("\v\226\128\162  \rSliders", 2, 8, 2)
                    };
                    do
                        local l_v106_0 = v106;
                        for v113 = 1, 8 do
                            do
                                local l_v113_0 = v113;
                                local v115 = v111:slider(string.format("    \v\226\164\183  \r[%d] \aFFFFFF00(%d:%d)", l_v113_0, l_v103_0, l_v106_0), -180, 180, 0, nil, "\194\176"):depend({
                                    [1] = l_states_0, 
                                    [2] = l_v103_0
                                }, {
                                    [1] = l_teams_0, 
                                    [2] = l_v106_0
                                }, {
                                    [1] = nil, 
                                    [2] = "Disabled", 
                                    [3] = true, 
                                    [1] = v100.data[l_v103_0][l_v106_0].modifier
                                }, {
                                    [1] = v100.data[l_v103_0][l_v106_0].modifier_options.sliders, 
                                    [2] = function()
                                        -- upvalues: l_v113_0 (ref), v100 (ref), l_v103_0 (ref), l_v106_0 (ref)
                                        return l_v113_0 <= v100.data[l_v103_0][l_v106_0].modifier_options.sliders:get();
                                    end
                                }, v100.data[l_v103_0][l_v106_0].modifier_options.randomize);
                                v100.data[l_v103_0][l_v106_0]["modifier_" .. l_v113_0] = v115;
                            end;
                        end;
                        v100.data[l_v103_0][l_v106_0].modifier_reset = v111:button("\aF44336FF\239\128\145 Reset", function()
                            -- upvalues: v100 (ref), l_v103_0 (ref), l_v106_0 (ref)
                            for v116 = 1, 8 do
                                v100.data[l_v103_0][l_v106_0]["modifier_" .. v116]:reset();
                                v100.data[l_v103_0][l_v106_0].modifier_options.sliders:reset();
                            end;
                        end, true):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = "Disabled", 
                            [3] = true, 
                            [1] = v100.data[l_v103_0][l_v106_0].modifier
                        }, v100.data[l_v103_0][l_v106_0].modifier_options.randomize);
                        v100.data[l_v103_0][l_v106_0].modifier_randomize = v111:button("\v\239\148\162 \rRandomize", function()
                            -- upvalues: v100 (ref), l_v103_0 (ref), l_v106_0 (ref)
                            for v117 = 1, 8 do
                                v100.data[l_v103_0][l_v106_0]["modifier_" .. v117]:set(math.random(-50, 50));
                                v100.data[l_v103_0][l_v106_0].modifier_options.sliders:set(math.random(2, 8));
                            end;
                        end, true):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = "Disabled", 
                            [3] = true, 
                            [1] = v100.data[l_v103_0][l_v106_0].modifier
                        }, v100.data[l_v103_0][l_v106_0].modifier_options.randomize);
                        local v118 = v100.data[l_v103_0][l_v106_0].body:create();
                        v100.data[l_v103_0][l_v106_0].body_options = {
                            separator = v118:label("\a{Small Text}\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128"), 
                            back_button = v118:button("\v\239\129\162  \a{Small Text}Back", function()
                                -- upvalues: v100 (ref), l_v103_0 (ref), l_v106_0 (ref)
                                cvar.play:call("ui\\csgo_ui_contract_type1");
                                v100.data[l_v103_0][l_v106_0].body_options.master:set(0);
                            end, true), 
                            inverter = v118:switch("\v\226\128\162  \rSide"), 
                            jitter = v118:switch("\v\226\128\162  \rJitter"), 
                            freestanding = v118:combo("\v\226\128\162  \rFreestanding", "Disabled", "Default", "Reversed"), 
                            type = v118:combo("\v\226\128\162  \rType", "Static", "Ticks", "Random"), 
                            type_ticks_value = v118:slider("    \v\226\164\183  \rValue", 3, 16, 4, nil, "t"), 
                            type_random_value = v118:slider("    \v\226\164\183  \rValue", 4, 16, 4), 
                            limit_type = v118:combo("\v\226\128\162  \rLimit Type", "Static", "Random", "Ticks"), 
                            left_limit = v118:slider("    \v\226\164\183  \rLeft", 0, 60, 58, nil, "\194\176"), 
                            right_limit = v118:slider("    \v\226\164\183  \rRight", 0, 60, 58, nil, "\194\176"), 
                            limit_min = v118:slider("    \v\226\164\183  \r[1]", 0, 60, 58, nil, "\194\176"), 
                            limit_max = v118:slider("    \v\226\164\183  \r[2]", 0, 60, 58, nil, "\194\176"), 
                            limit_timing = v118:slider("\v\226\128\162  \rTiming  \a{Small Text}\238\138\158", 1, 20, 2, nil, "t"), 
                            limit_tick_l = v118:slider("    \v\226\164\183  \r[1] ", 0, 60, 58, nil, "\194\176"), 
                            limit_tick_r = v118:slider("    \v\226\164\183  \r[2] ", 0, 60, 58, nil, "\194\176"), 
                            master = v118:slider("Master", 0, 2, 0), 
                            separator_2 = v118:label("\a{Small Text}\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128"), 
                            body_button = v118:button("\v\239\130\133  \a{Small Text}Other", function()
                                -- upvalues: v100 (ref), l_v103_0 (ref), l_v106_0 (ref)
                                cvar.play:call("ui\\csgo_ui_contract_type1");
                                v100.data[l_v103_0][l_v106_0].body_options.master:set(1);
                            end, true)
                        };
                        local v119 = v100.data[l_v103_0][l_v106_0].yaw_mode:create();
                        v100.data[l_v103_0][l_v106_0].yaw_options_ex = {
                            offset_left = v119:slider("\v\226\128\162  \rLeft Offset", -180, 180, 0, nil, "\194\176"), 
                            offset_right = v119:slider("\v\226\128\162  \rRight Offset", -180, 180, 0, nil, "\194\176"), 
                            master = v119:slider("Master", 0, 2, 0), 
                            separator = v119:label("\a{Small Text}\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128"), 
                            back_button = v119:button("\v\239\129\162  \a{Small Text}Back", function()
                                -- upvalues: v100 (ref), l_v103_0 (ref), l_v106_0 (ref)
                                cvar.play:call("ui\\csgo_ui_contract_type1");
                                v100.data[l_v103_0][l_v106_0].yaw_options_ex.master:set(0);
                            end, true), 
                            separator_2 = v119:label("\a{Small Text}\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128"), 
                            delay_button = v119:button("\v\238\144\155  \a{Small Text}Delay", function()
                                -- upvalues: v100 (ref), l_v103_0 (ref), l_v106_0 (ref)
                                cvar.play:call("ui\\csgo_ui_contract_type1");
                                v100.data[l_v103_0][l_v106_0].yaw_options_ex.master:set(1);
                            end, true), 
                            delay = v119:switch("\v\226\128\162  \rApply"), 
                            delay_sliders = v119:slider("\v\226\128\162  \rSliders", 1, 8, 1)
                        };
                        for v120 = 1, 8 do
                            local v121 = string.format("    \v\226\164\183  \r[%d] \aFFFFFF00(%d:%d)", v120, l_v103_0, l_v106_0);
                            do
                                local l_v120_0 = v120;
                                v100.data[l_v103_0][l_v106_0]["delay_" .. l_v120_0] = v119:slider(v121, 1, 20, 2, nil, "t"):depend({
                                    [1] = l_states_0, 
                                    [2] = l_v103_0
                                }, {
                                    [1] = l_teams_0, 
                                    [2] = l_v106_0
                                }, {
                                    [1] = nil, 
                                    [2] = 2, 
                                    [1] = v100.data[l_v103_0][l_v106_0].yaw_mode
                                }, {
                                    [1] = nil, 
                                    [2] = 1, 
                                    [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.master
                                }, {
                                    [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay_sliders, 
                                    [2] = function()
                                        -- upvalues: l_v120_0 (ref), v100 (ref), l_v103_0 (ref), l_v106_0 (ref)
                                        return l_v120_0 <= v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay_sliders:get();
                                    end
                                }, v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay);
                            end;
                        end;
                        v100.data[l_v103_0][l_v106_0].static_label = v119:label("\a{Small Text}\226\128\162  Static"):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_mode
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.master
                        }, {
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay_sliders, 
                            [2] = function()
                                -- upvalues: v100 (ref), l_v103_0 (ref), l_v106_0 (ref)
                                return v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay_sliders:get() == 1;
                            end
                        }, v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay);
                        v100.data[l_v103_0][l_v106_0].random_label = v119:label("\a{Small Text}\226\128\162  Random"):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_mode
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.master
                        }, {
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay_sliders, 
                            [2] = function()
                                -- upvalues: v100 (ref), l_v103_0 (ref), l_v106_0 (ref)
                                return v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay_sliders:get() == 2;
                            end
                        }, v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay);
                        v100.data[l_v103_0][l_v106_0].ways_label = v119:label("\a{Small Text}\226\128\162  Ways"):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_mode
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.master
                        }, {
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay_sliders, 
                            [2] = function()
                                -- upvalues: v100 (ref), l_v103_0 (ref), l_v106_0 (ref)
                                return v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay_sliders:get() > 2;
                            end
                        }, v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay);
                        v100.data[l_v103_0][l_v106_0].delay_reset = v119:button("\aF44336FF\239\128\145 Reset", function()
                            -- upvalues: v100 (ref), l_v103_0 (ref), l_v106_0 (ref)
                            for v123 = 1, 8 do
                                v100.data[l_v103_0][l_v106_0]["delay_" .. v123]:reset();
                                v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay_sliders:reset();
                            end;
                        end, true):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_mode
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.master
                        }, {
                            [1] = nil, 
                            [2] = 3, 
                            [3] = 8, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay_sliders
                        }, v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay);
                        v100.data[l_v103_0][l_v106_0].delay_randomize = v119:button("\v\239\148\162 \rRandomize", function()
                            -- upvalues: v100 (ref), l_v103_0 (ref), l_v106_0 (ref)
                            for v124 = 1, 8 do
                                v100.data[l_v103_0][l_v106_0]["delay_" .. v124]:set(math.random(1, 20));
                                v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay_sliders:set(math.random(3, 8));
                            end;
                        end, true):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_mode
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.master
                        }, {
                            [1] = nil, 
                            [2] = 3, 
                            [3] = 8, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay_sliders
                        }, v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay);
                        v100.data[l_v103_0][l_v106_0].forward_state = l_builder_0:button("\v\239\133\141  \rForward to the opposite side", function()
                            -- upvalues: l_v106_0 (ref), v100 (ref), l_v103_0 (ref)
                            local v125 = l_v106_0 == 1 and 2 or 1;
                            local v126 = {
                                [1] = "yaw_mode", 
                                [2] = "yaw_offset", 
                                [3] = "modifier", 
                                [4] = "modifier_offset", 
                                [5] = "body"
                            };
                            local v127 = {
                                yaw_options_ex = {
                                    [1] = "offset_left", 
                                    [2] = "offset_right", 
                                    [3] = "delay", 
                                    [4] = "delay_sliders", 
                                    [5] = "master"
                                }, 
                                modifier_options = {
                                    [1] = "randomize", 
                                    [2] = "sliders"
                                }, 
                                body_options = {
                                    [1] = "inverter", 
                                    [2] = "jitter", 
                                    [3] = "freestanding", 
                                    [4] = "type", 
                                    [5] = "type_ticks_value", 
                                    [6] = "type_random_value", 
                                    [7] = "limit_type", 
                                    [8] = "left_limit", 
                                    [9] = "right_limit", 
                                    [10] = "limit_min", 
                                    [11] = "limit_max", 
                                    [12] = "limit_timing", 
                                    [13] = "limit_tick_l", 
                                    [14] = "limit_tick_r", 
                                    [15] = "master"
                                }
                            };
                            local v128 = {};
                            for v129 = 1, 8 do
                                table.insert(v128, "modifier_" .. v129);
                                table.insert(v128, "delay_" .. v129);
                            end;
                            for _, v131 in ipairs(v126) do
                                local v132 = v100.data[l_v103_0][l_v106_0][v131];
                                local v133 = v100.data[l_v103_0][v125][v131];
                                if v132 and v133 then
                                    v133:set(v132:get());
                                end;
                            end;
                            for v134, v135 in pairs(v127) do
                                for _, v137 in ipairs(v135) do
                                    local v138 = v100.data[l_v103_0][l_v106_0][v134];
                                    local v139 = v100.data[l_v103_0][v125][v134];
                                    if v138 and v139 and v138[v137] and v139[v137] then
                                        v139[v137]:set(v138[v137]:get());
                                    end;
                                end;
                            end;
                            for _, v141 in ipairs(v128) do
                                local v142 = v100.data[l_v103_0][l_v106_0][v141];
                                local v143 = v100.data[l_v103_0][v125][v141];
                                if v142 and v143 then
                                    v143:set(v142:get());
                                end;
                            end;
                            local v144 = {
                                [1] = "tickbase", 
                                [2] = "tickbase_randomize", 
                                [3] = "tickbase_choke", 
                                [4] = "tickbase_rndm_type", 
                                [5] = "tickbase_rndm", 
                                [6] = "tickbase_rndm_2", 
                                [7] = "tickbase_sliders"
                            };
                            for _, v146 in ipairs(v144) do
                                local v147 = v100.data[l_v103_0][l_v106_0][v146];
                                local v148 = v100.data[l_v103_0][v125][v146];
                                if v147 and v148 then
                                    v148:set(v147:get());
                                end;
                            end;
                            for v149 = 1, 8 do
                                local v150 = v100.data[l_v103_0][l_v106_0]["tickbase_" .. v149];
                                local v151 = v100.data[l_v103_0][v125]["tickbase_" .. v149];
                                if v150 and v151 then
                                    v151:set(v150:get());
                                end;
                            end;
                            common.add_event("Settings forwarded to the opposite side successfully", "gear");
                            cvar.playvol:call("ui\\beepclear", 1);
                        end, true):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }):tooltip("Forwards the builder settings, including tickbase options to the same state on the opposite team.");
                        v100.data[l_v103_0][l_v106_0].copy = l_builder_0:button("\v\239\131\133", function()
                            -- upvalues: l_pui_0 (ref), v100 (ref), l_v103_0 (ref), l_v106_0 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
                            local v152 = l_pui_0.setup({
                                [1] = v100.data[l_v103_0][l_v106_0]
                            }, true);
                            local v153 = l_base64_0.encode(msgpack.pack(v152:save()));
                            l_clipboard_0.set(v153);
                            common.add_event("Settings copied to clipboard successfully", "gear");
                            cvar.playvol:call("ui\\beepclear", 1);
                        end, true):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }):tooltip("Copy\n\n\a{Small Text}Copies builder settings, including tickbase options, to the clipboard.");
                        v100.data[l_v103_0][l_v106_0].paste = l_builder_0:button("\v\239\131\170", function()
                            -- upvalues: l_pui_0 (ref), v100 (ref), l_v103_0 (ref), l_v106_0 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
                            local v154 = l_pui_0.setup({
                                [1] = v100.data[l_v103_0][l_v106_0]
                            }, true);
                            local v155 = l_base64_0.decode(l_clipboard_0.get());
                            v154:load((msgpack.unpack(v155)));
                            common.add_event("Settings pasted from clipboard successfully", "gear");
                            cvar.playvol:call("ui\\beepclear", 1);
                        end, true):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }):tooltip("Paste\n\n\a{Small Text}Pastes builder and tickbase settings from the clipboard.");
                        v100.data[l_v103_0][l_v106_0].tickbase = v100.groups.snap_builder:combo("\a{Small Text}\226\128\162  \rTickbase", "Neverlose", "Nyanza"):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        });
                        v100.data[l_v103_0][l_v106_0].tickbase_randomize = v100.data[l_v103_0][l_v106_0].tickbase:create():switch("\a{Small Text}\226\128\162  \rRandomize  \a{Small Text}\239\148\162", true):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = "Nyanza", 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase
                        });
                        v100.data[l_v103_0][l_v106_0].tickbase_choke = v100.data[l_v103_0][l_v106_0].tickbase:create():slider("    \a{Small Text}\226\164\183  \rChoke", 2, 22, 16, nil, function(v156)
                            return ({
                                [1] = nil, 
                                [2] = "Sharp", 
                                [16] = "Default", 
                                [22] = "Smooth"
                            })[v156] or v156 .. "t";
                        end):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = "Nyanza", 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase
                        }, {
                            [1] = nil, 
                            [2] = false, 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase_randomize
                        });
                        v100.data[l_v103_0][l_v106_0].tickbase_rndm_type = v100.data[l_v103_0][l_v106_0].tickbase:create():combo("\a{Small Text}\226\128\162  \rType", "Default", "Ways"):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = "Nyanza", 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase
                        }, {
                            [1] = nil, 
                            [2] = true, 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase_randomize
                        });
                        v100.data[l_v103_0][l_v106_0].tickbase_rndm = v100.data[l_v103_0][l_v106_0].tickbase:create():slider("    \a{Small Text}\226\164\183  \r[1]", 2, 22, 15, nil, function(v157)
                            return ({
                                [1] = nil, 
                                [2] = "Sharp", 
                                [22] = "Smooth", 
                                [15] = "Default"
                            })[v157] or v157 .. "t";
                        end):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = "Nyanza", 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase
                        }, {
                            [1] = nil, 
                            [2] = true, 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase_randomize
                        }, {
                            [1] = nil, 
                            [2] = "Default", 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase_rndm_type
                        });
                        v100.data[l_v103_0][l_v106_0].tickbase_rndm_2 = v100.data[l_v103_0][l_v106_0].tickbase:create():slider("    \a{Small Text}\226\164\183  \r[2]", 2, 22, 16, nil, function(v158)
                            return ({
                                [1] = nil, 
                                [2] = "Sharp", 
                                [16] = "Default", 
                                [22] = "Smooth"
                            })[v158] or v158 .. "t";
                        end):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = "Nyanza", 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase
                        }, {
                            [1] = nil, 
                            [2] = true, 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase_randomize
                        }, {
                            [1] = nil, 
                            [2] = "Default", 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase_rndm_type
                        });
                        v100.data[l_v103_0][l_v106_0].tickbase_sliders = v100.data[l_v103_0][l_v106_0].tickbase:create():slider("\a{Small Text}\226\128\162  \rSliders", 2, 8, 3):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = "Nyanza", 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase
                        }, {
                            [1] = nil, 
                            [2] = true, 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase_randomize
                        }, {
                            [1] = nil, 
                            [2] = "Ways", 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase_rndm_type
                        });
                        for v159 = 1, 8 do
                            local v160 = string.format("    \a{Small Text}\226\164\183  \r[%d] \aFFFFFF00(%d:%d)", v159, l_v103_0, l_v106_0);
                            do
                                local l_v159_0 = v159;
                                local v162 = v100.data[l_v103_0][l_v106_0].tickbase:create():slider(v160, 2, 22, math.random(15, 16), nil, "t"):depend({
                                    [1] = l_states_0, 
                                    [2] = l_v103_0
                                }, {
                                    [1] = l_teams_0, 
                                    [2] = l_v106_0
                                }, {
                                    [1] = nil, 
                                    [2] = "Nyanza", 
                                    [1] = v100.data[l_v103_0][l_v106_0].tickbase
                                }, {
                                    [1] = nil, 
                                    [2] = true, 
                                    [1] = v100.data[l_v103_0][l_v106_0].tickbase_randomize
                                }, {
                                    [1] = nil, 
                                    [2] = "Ways", 
                                    [1] = v100.data[l_v103_0][l_v106_0].tickbase_rndm_type
                                }, {
                                    [1] = v100.data[l_v103_0][l_v106_0].tickbase_sliders, 
                                    [2] = function()
                                        -- upvalues: l_v159_0 (ref), v100 (ref), l_v103_0 (ref), l_v106_0 (ref)
                                        return l_v159_0 <= v100.data[l_v103_0][l_v106_0].tickbase_sliders:get();
                                    end
                                });
                                v100.data[l_v103_0][l_v106_0]["tickbase_" .. l_v159_0] = v162;
                            end;
                        end;
                        v100.data[l_v103_0][l_v106_0].tickbase_reset = v100.data[l_v103_0][l_v106_0].tickbase:create():button("\aF44336FF\239\128\145 Reset", function()
                            -- upvalues: v100 (ref), l_v103_0 (ref), l_v106_0 (ref)
                            for v163 = 1, 8 do
                                v100.data[l_v103_0][l_v106_0]["tickbase_" .. v163]:set(math.random(2, 22));
                                v100.data[l_v103_0][l_v106_0].tickbase_sliders:set(3);
                            end;
                        end, true):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = "Nyanza", 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase
                        }, {
                            [1] = nil, 
                            [2] = true, 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase_randomize
                        }, {
                            [1] = nil, 
                            [2] = "Ways", 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase_rndm_type
                        });
                        v100.data[l_v103_0][l_v106_0].tickbase_randomize_x = v100.data[l_v103_0][l_v106_0].tickbase:create():button("\a{Small Text}\239\148\162  \rRandomize", function()
                            -- upvalues: v100 (ref), l_v103_0 (ref), l_v106_0 (ref)
                            for v164 = 1, 8 do
                                v100.data[l_v103_0][l_v106_0]["tickbase_" .. v164]:set(math.random(1, 20));
                                v100.data[l_v103_0][l_v106_0].tickbase_sliders:set(math.random(3, 6));
                            end;
                        end, true):depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = "Nyanza", 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase
                        }, {
                            [1] = nil, 
                            [2] = true, 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase_randomize
                        }, {
                            [1] = nil, 
                            [2] = "Ways", 
                            [1] = v100.data[l_v103_0][l_v106_0].tickbase_rndm_type
                        });
                        v100.data[l_v103_0][l_v106_0].yaw_mode:depend({
                            [1] = v100.elements.states, 
                            [2] = function(v165)
                                return v165.value ~= 9;
                            end
                        });
                        v100.data[l_v103_0][l_v106_0].modifier_options.sliders:depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = "Disabled", 
                            [3] = true, 
                            [1] = v100.data[l_v103_0][l_v106_0].modifier
                        }, v100.data[l_v103_0][l_v106_0].modifier_options.randomize);
                        v100.data[l_v103_0][l_v106_0].modifier_options.randomize:depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = "Disabled", 
                            [3] = true, 
                            [1] = v100.data[l_v103_0][l_v106_0].modifier
                        });
                        v100.data[l_v103_0][l_v106_0].modifier_offset:depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = "Disabled", 
                            [3] = true, 
                            [1] = v100.data[l_v103_0][l_v106_0].modifier
                        }, {
                            [1] = nil, 
                            [2] = false, 
                            [1] = v100.data[l_v103_0][l_v106_0].modifier_options.randomize
                        });
                        v100.data[l_v103_0][l_v106_0].yaw_options_ex.offset_left:depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_mode
                        }, {
                            [1] = nil, 
                            [2] = 0, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.master
                        });
                        v100.data[l_v103_0][l_v106_0].yaw_options_ex.offset_right:depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_mode
                        }, {
                            [1] = nil, 
                            [2] = 0, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.master
                        });
                        v100.data[l_v103_0][l_v106_0].yaw_options_ex.separator:depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_mode
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [3] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.master
                        });
                        v100.data[l_v103_0][l_v106_0].yaw_options_ex.back_button:depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_mode
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [3] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.master
                        });
                        v100.data[l_v103_0][l_v106_0].yaw_options_ex.separator_2:depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_mode
                        }, {
                            [1] = nil, 
                            [2] = 0, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.master
                        });
                        v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay_button:depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_mode
                        }, {
                            [1] = nil, 
                            [2] = 0, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.master
                        });
                        v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay:depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_mode
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.master
                        });
                        v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay_sliders:depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_mode
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_options_ex.master
                        }, v100.data[l_v103_0][l_v106_0].yaw_options_ex.delay);
                        v100.data[l_v103_0][l_v106_0].body_options.type:depend({
                            [1] = nil, 
                            [2] = 0, 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.master
                        }, v100.data[l_v103_0][l_v106_0].body);
                        v100.data[l_v103_0][l_v106_0].body_options.type_ticks_value:depend({
                            [1] = nil, 
                            [2] = 0, 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.master
                        }, {
                            [1] = nil, 
                            [2] = "Ticks", 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.type
                        }, v100.data[l_v103_0][l_v106_0].body);
                        v100.data[l_v103_0][l_v106_0].body_options.type_random_value:depend({
                            [1] = nil, 
                            [2] = 0, 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.master
                        }, {
                            [1] = nil, 
                            [2] = "Random", 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.type
                        }, v100.data[l_v103_0][l_v106_0].body);
                        v100.data[l_v103_0][l_v106_0].body_options.freestanding:depend({
                            [1] = nil, 
                            [2] = 1, 
                            [3] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.master
                        }, v100.data[l_v103_0][l_v106_0].body);
                        v100.data[l_v103_0][l_v106_0].body_options.limit_type:depend({
                            [1] = nil, 
                            [2] = 1, 
                            [3] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.master
                        }, v100.data[l_v103_0][l_v106_0].body);
                        v100.data[l_v103_0][l_v106_0].body_options.left_limit:depend({
                            [1] = nil, 
                            [2] = 1, 
                            [3] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.master
                        }, {
                            [1] = nil, 
                            [2] = "Static", 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.limit_type
                        }, v100.data[l_v103_0][l_v106_0].body);
                        v100.data[l_v103_0][l_v106_0].body_options.right_limit:depend({
                            [1] = nil, 
                            [2] = 1, 
                            [3] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.master
                        }, {
                            [1] = nil, 
                            [2] = "Static", 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.limit_type
                        }, v100.data[l_v103_0][l_v106_0].body);
                        v100.data[l_v103_0][l_v106_0].body_options.limit_min:depend({
                            [1] = nil, 
                            [2] = 1, 
                            [3] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.master
                        }, {
                            [1] = nil, 
                            [2] = "Random", 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.limit_type
                        }, v100.data[l_v103_0][l_v106_0].body);
                        v100.data[l_v103_0][l_v106_0].body_options.limit_max:depend({
                            [1] = nil, 
                            [2] = 1, 
                            [3] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.master
                        }, {
                            [1] = nil, 
                            [2] = "Random", 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.limit_type
                        }, v100.data[l_v103_0][l_v106_0].body);
                        v100.data[l_v103_0][l_v106_0].body_options.limit_timing:depend({
                            [1] = nil, 
                            [2] = 1, 
                            [3] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.master
                        }, {
                            [1] = nil, 
                            [2] = "Ticks", 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.limit_type
                        }, v100.data[l_v103_0][l_v106_0].body);
                        v100.data[l_v103_0][l_v106_0].body_options.limit_tick_l:depend({
                            [1] = nil, 
                            [2] = 1, 
                            [3] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.master
                        }, {
                            [1] = nil, 
                            [2] = "Ticks", 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.limit_type
                        }, v100.data[l_v103_0][l_v106_0].body);
                        v100.data[l_v103_0][l_v106_0].body_options.limit_tick_r:depend({
                            [1] = nil, 
                            [2] = 1, 
                            [3] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.master
                        }, {
                            [1] = nil, 
                            [2] = "Ticks", 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.limit_type
                        }, v100.data[l_v103_0][l_v106_0].body);
                        v100.data[l_v103_0][l_v106_0].body_options.jitter:depend({
                            [1] = nil, 
                            [2] = 0, 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.master
                        }, v100.data[l_v103_0][l_v106_0].body);
                        v100.data[l_v103_0][l_v106_0].body_options.inverter:depend({
                            [1] = nil, 
                            [2] = 1, 
                            [3] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.master
                        }, v100.data[l_v103_0][l_v106_0].body);
                        v100.data[l_v103_0][l_v106_0].body_options.separator:depend({
                            [1] = nil, 
                            [2] = 1, 
                            [3] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.master
                        }, v100.data[l_v103_0][l_v106_0].body);
                        v100.data[l_v103_0][l_v106_0].body_options.back_button:depend({
                            [1] = nil, 
                            [2] = 1, 
                            [3] = 2, 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.master
                        }, v100.data[l_v103_0][l_v106_0].body);
                        v100.data[l_v103_0][l_v106_0].body_options.separator_2:depend({
                            [1] = nil, 
                            [2] = 0, 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.master
                        }, v100.data[l_v103_0][l_v106_0].body);
                        v100.data[l_v103_0][l_v106_0].body_options.body_button:depend({
                            [1] = nil, 
                            [2] = 0, 
                            [1] = v100.data[l_v103_0][l_v106_0].body_options.master
                        }, v100.data[l_v103_0][l_v106_0].body);
                        v100.data[l_v103_0][l_v106_0].body_options.master:depend({
                            [1] = nil, 
                            [2] = 100, 
                            [1] = v100.home.elements.progress_version_bar
                        });
                        v100.data[l_v103_0][l_v106_0].yaw_offset:depend({
                            [1] = l_states_0, 
                            [2] = l_v103_0
                        }, {
                            [1] = l_teams_0, 
                            [2] = l_v106_0
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v100.data[l_v103_0][l_v106_0].yaw_mode
                        }, {
                            [1] = v100.elements.states, 
                            [2] = function(v166)
                                return v166.value ~= 9;
                            end
                        });
                        v100.data[l_v103_0][l_v106_0].yaw_options_ex.master:depend({
                            [1] = nil, 
                            [2] = 100, 
                            [1] = v100.home.elements.progress_version_bar
                        });
                        v100.elements.freestanding_allowed:depend({
                            [1] = nil, 
                            [2] = 8, 
                            [1] = l_states_0
                        });
                    end;
                end;
            end;
        end;
        v100.elements.builder_separator = v100.groups.builder:label("\a{Small Text}\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128\226\148\128");
        v100.elements.hotkeys = v100.groups.builder:label("\v\226\128\162  \rHotkeys  \a{Small Text}\239\159\153");
        v100.elements.manual_yaw = v100.elements.hotkeys:create():combo("\v\226\128\162  \rManuals  \v\239\129\185", "Disabled", "Left", "Right", "Forward");
        v100.elements.freestanding = v100.elements.hotkeys:create():switch("\v\226\128\162  \rFreestanding  \v\238\147\129");
        v100.elements.body_fs = v100.elements.hotkeys:create():switch("    \v\226\164\183  \rBody Freestanding");
        v100.elements.disablers = v100.elements.hotkeys:create():selectable("    \v\226\164\183  \rDisablers  \v\239\131\128", {
            [1] = "\v\239\134\131     \rStanding", 
            [2] = "\v\239\156\140    \rRunning", 
            [3] = "\v\239\149\148     \rSlowing", 
            [4] = "\v\239\134\147   \rCrouching", 
            [5] = "\v\238\139\142    \rSneaking", 
            [6] = "\v\238\149\134    \rAir", 
            [7] = "\v\238\149\135  \rAir Crouching"
        });
        v100.elements.disablers:tooltip("Disables freestanding on the selected states.");
    end
}):struct("other")({
    init = function(v167)
        -- upvalues: l_pui_0 (ref)
        v167.groups = {
            animations_movement = l_pui_0.create("\v\239\139\155", "Player Animations"), 
            visuals = l_pui_0.create("\v\239\139\155", "Visuals", 2), 
            aimbot = l_pui_0.create("\v\239\139\155", "Aimbot"), 
            other_visuals = l_pui_0.create("\v\239\139\155", ""), 
            other = l_pui_0.create("\v\239\139\155", "Other"), 
            movement = l_pui_0.create("\v\239\139\155", "Movement")
        };
        v167.elements = {
            interpolating = v167.groups.animations_movement:slider("\v\238\146\157  \rInterpolating", 0, 14, 9, nil, function(v168)
                if v168 == 0 then
                    return "Default";
                elseif v168 == 9 then
                    return "Medium";
                elseif v168 == 14 then
                    return "High";
                else
                    return v168 .. "t";
                end;
            end), 
            leaning = v167.groups.animations_movement:slider("\v\239\134\131   \rLeaning", 0, 100, 0, 0.01, function(v169)
                if v169 == 0 then
                    return "Default";
                elseif v169 == 35 then
                    return "Small";
                elseif v169 == 50 then
                    return "Medium";
                elseif v169 == 75 then
                    return "High";
                elseif v169 == 100 then
                    return "Extreme";
                else
                    return v169 .. "%";
                end;
            end), 
            falling = v167.groups.animations_movement:slider("\v\238\149\134  \rFalling", 0, 10, 0, 0.1, function(v170)
                if v170 == 0 then
                    return "Default";
                elseif v170 == 5 then
                    return "Force";
                elseif v170 == 10 then
                    return "Maximum";
                else
                    return v170 .. "x";
                end;
            end), 
            walking = v167.groups.animations_movement:slider("\v\239\149\148   \rWalking", 0, 2, 0, nil, function(v171)
                if v171 == 0 then
                    return "Default";
                elseif v171 == 1 then
                    return "Force";
                elseif v171 == 2 then
                    return "Jitter";
                else
                    return nil;
                end;
            end), 
            no_fall_damage = v167.groups.movement:switch("\v\238\149\135   \rNo Fall Damage"), 
            fast_ladder = v167.groups.movement:switch("\v\239\151\133    \rFast Ladder"), 
            unlock_fakelatency = v167.groups.aimbot:switch("\v\239\163\157   \rUnlock Fake Latency"), 
            force_teamaimbot = v167.groups.aimbot:switch("\v\239\129\173    \rForce Teammate Aimbot"), 
            freezetime_fakeduck = v167.groups.aimbot:switch("\v\239\155\152    \rFreezetime Fakeduck"), 
            custom_fakeduck = v167.groups.aimbot:switch("\v\238\146\150  \rCustom Fakeduck Speed", false, function(v172)
                return {
                    scale = v172:slider("\v\226\164\183  \rScale", 15, 150, 150, nil, function(v173)
                        if v173 == 15 then
                            return "Slow";
                        elseif v173 == 80 then
                            return "Default";
                        elseif v173 == 150 then
                            return "Fast";
                        else
                            return nil;
                        end;
                    end)
                };
            end), 
            aspectratio = v167.groups.visuals:label("\v\238\134\181  \rAspect Ratio", function(v174)
                return {
                    scale = v174:slider("\v\226\164\183  \rValue", 50, 300, 177, 0.01, function(v175)
                        if v175 == 177 then
                            return "16:9";
                        elseif v175 == 161 then
                            return "16:10";
                        elseif v175 == 150 then
                            return "3:2";
                        elseif v175 == 133 then
                            return "4:3";
                        elseif v175 == 125 then
                            return "5:4";
                        else
                            return nil;
                        end;
                    end)
                };
            end), 
            viewmodel = v167.groups.visuals:label("\v\238\149\142  \rViewmodel", function(v176)
                return {
                    fov = v176:slider("\v\226\128\162  \rField of View", -100, 100, 68, 1), 
                    axis_x = v176:slider("    \v\226\164\183  \rX Axis", -150, 150, 0, 0.1), 
                    axis_y = v176:slider("    \v\226\164\183  \rY Axis", -150, 150, 0, 0.1), 
                    axis_z = v176:slider("    \v\226\164\183  \rZ Axis", -150, 150, 0, 0.1), 
                    main_hand = v176:combo("\v\226\128\162  \rMain Hand", "Left", "Right"), 
                    left_hand = v176:switch("    \v\226\164\183  \rKnife Left Hand"), 
                    right_hand = v176:switch("    \v\226\164\183  \rKnife Right Hand"), 
                    csco_roll = v176:switch("\v\226\128\162  \rCS:CO Roll")
                };
            end), 
            manual_arrows = v167.groups.visuals:switch("\v\239\129\185 \rManual Arrows"), 
            keep_model_transparency = v167.groups.visuals:switch("\v\238\145\191   \rKeep Model Transparency", false, function(v177)
                return {
                    scale = v177:slider("\v\226\164\183  \rFade Duration", 1, 20, 10, nil, function(v178)
                        return v178 == 1 and "Smooth" or v178 == 10 and "GS" or v178 == 20 and "Default";
                    end)
                };
            end, ""), 
            debug_text = v167.groups.visuals:switch("\v\239\159\185   \rDebug Text"):disabled(true), 
            log_events = v167.groups.other:label("\v\238\145\178   \rLog Events", function(v179)
                return {
                    damage_dealt = v179:switch("\v\226\128\162  \rDamage Dealt"), 
                    purchases = v179:switch("\v\226\128\162  \rPurchases"), 
                    prefix = v179:input("    \v\226\164\183  \rPrefix", "snapshot"), 
                    button = v179:button("   \v\238\136\134  \rPrint the Instruction to the Chat    ", function(_)
                        print_chat("\004 \002Prefix Commands\001: ");
                        print_chat("\004 \015p=\001 \226\128\148 Set custom prefix");
                        print_chat("\004 \015nh\001 \226\128\148 Disable color");
                        print_chat("\004 \015b=( )\001 \226\128\148 Use round brackets");
                        print_chat("\004 \015nb\001 \226\128\148 Remove brackets");
                        print_chat("\004 \015np\001 \226\128\148 Disable prefix");
                        print_chat("\004 \016Example\001 (\bCopy!\001): p=lagsight b=||");
                    end, true), 
                    main_accent = v179:color_picker("\v\226\128\162  \rMain Accent", color(255, 255, 255, 255)), 
                    prefix_accent = v179:color_picker("    \v\226\164\183  \rPrefix", color(255, 255, 255, 255))
                };
            end), 
            clan_tag = v167.groups.other:switch("\v\239\159\170   \rClan Tag Spammer"), 
            clientside_nickname = v167.groups.other:switch("\v\239\138\187   \rClient Side Nickname", false, function(v181)
                return {
                    input = v181:input("\v\226\128\162  \rEnter Nickname", "lagsight")
                };
            end, ""), 
            custom_scope = v167.groups.visuals:switch("\v\239\129\155   \rCustom Scope Overlay", false, function(v182)
                return {
                    rotated = v182:switch(" \v\226\128\162  \rRotated"), 
                    size = v182:slider("    \v\226\164\183  \rSize", 10, 300, 200), 
                    gap = v182:slider("    \v\226\164\183  \rGap", 1, 300, 10), 
                    main_accent = v182:color_picker("\v\226\128\162  \rMain Accent", color(255, 255, 255, 160)), 
                    edge_accent = v182:color_picker("    \v\226\164\183  \rEdge", color(0, 0, 0, 0))
                };
            end), 
            damage_indicator = v167.groups.visuals:switch("\v\239\155\130  \rDamage Override Indicator"), 
            hitmarkers = v167.groups.visuals:selectable("\v\239\153\136   \rHitmarkers", "Screen 2D", "World 3D"), 
            addons = v167.groups.visuals:selectable("\v\239\151\189   \rAddons", "Disable foot shadows", "Disable use opens buy menu", "No sleeves", "Clear console on round start", "Proper skybox", "Disable ragdoll physics")
        };
        v167.elements.screen_color = v167.elements.hitmarkers:create():color_picker("\v\226\128\162  \r2D Color", color(255, 255, 255, 255));
        v167.elements.screen_duration = v167.elements.hitmarkers:create():slider("    \v\226\164\183  \rDuration", 1, 20, 1, nil, function(v183)
            return v183 * 0.5 .. "s";
        end);
        v167.elements.world_color = v167.elements.hitmarkers:create():color_picker("\v\226\128\162  \r3D Color", {
            Simple = {
                color(255, 0, 0, 155)
            }, 
            Double = {
                color(0, 255, 255, 255), 
                color(0, 255, 0, 255)
            }
        });
        v167.elements.world_duration = v167.elements.hitmarkers:create():slider("    \v\226\164\183  \rDuration ", 1, 20, 10, nil, function(v184)
            return v184 * 0.5 .. "s";
        end);
        v167.elements.unlock_fakelatency:tooltip("Unlocks the fake latency setting from 100ms to 200ms.\n\nPreviously capped at 100ms by the Neverlose developer in older updates.\n\n\a{Small Text}Fun fact: If fake latency is set to 200ms, you can still backtrack an enemy up to 400ms.");
        v167.elements.force_teamaimbot:tooltip("Forces the cheat to see teammates as enemies, making the aimbot shoot at them.");
        v167.elements.freezetime_fakeduck:tooltip("Allows you to use fake duck at the start of the round during freeze time, since the Neverlose developer disabled fakeduck during that phase.");
        v167.elements.custom_fakeduck:tooltip("Allows you to change the speed of fake duck.\n\n\a{Small Text}By default, the speed is set to a medium value by the Neverlose developer, but you can increase it to the maximum without affecting gameplay.");
        v167.elements.interpolating:tooltip("Smooths all local player animations by mimicking one of the \a{Active Text}game\a96C83CFFsense \ranimation logics.");
        v167.elements.leaning:tooltip("Increases the lean angle of the local player. Makes the player\226\128\153s model tilt more visibly.");
        v167.elements.falling:tooltip("The higher the value, the less visible the normal jump animation will be \226\128\148 only the falling animation will be noticeable.");
        v167.elements.walking:tooltip("\227\131\187\"Default\" won\226\128\153t affect the local player\226\128\153s leg animation.\n\n\227\131\187\"Force\" makes the walking animation play at any speed or condition while on the ground.\n\n\227\131\187\"Jitter\" enables slide walk and makes the legs rapidly switch between different positions.");
        v167.elements.no_fall_damage:tooltip("Prevents you from taking fall damage.\n\n\a{Small Text}Works only on flat surfaces, since the first version of the Source engine doesn\226\128\153t allow accurate calculation of the remaining distance to the ground.");
        v167.elements.fast_ladder:tooltip("Abuses the ladder climbing mechanic for you, doubling the speed of vertical movement on ladders.");
        v167.elements.aspectratio:tooltip("Allows you to visually change the screen aspect ratio without modifying it in the game settings.");
        v167.elements.viewmodel:tooltip("Allows you to set the viewmodel position freely.");
        v167.elements.custom_fakeduck.scale:depend(v167.elements.custom_fakeduck);
        v167.elements.screen_color:depend({
            [1] = nil, 
            [2] = "Screen 2D", 
            [1] = v167.elements.hitmarkers
        });
        v167.elements.screen_duration:depend({
            [1] = nil, 
            [2] = "Screen 2D", 
            [1] = v167.elements.hitmarkers
        });
        v167.elements.world_color:depend({
            [1] = nil, 
            [2] = "World 3D", 
            [1] = v167.elements.hitmarkers
        });
        v167.elements.world_duration:depend({
            [1] = nil, 
            [2] = "World 3D", 
            [1] = v167.elements.hitmarkers
        });
        v167.elements.custom_scope.rotated:depend(v167.elements.custom_scope);
        v167.elements.custom_scope.size:depend(v167.elements.custom_scope);
        v167.elements.custom_scope.gap:depend(v167.elements.custom_scope);
        v167.elements.custom_scope.main_accent:depend(v167.elements.custom_scope);
        v167.elements.custom_scope.edge_accent:depend(v167.elements.custom_scope);
        v167.elements.skybox = v167.elements.addons:create():combo("\v\226\128\162  \rSkybox", "Night", "Night (2)", "Night (Flat)", "Clouds", "Clouds (2)", "Clouds (Dark)", "Daylight", "Daylight (2)", "Baggage", "Tibet", "Canals", "Assault", "Vertigo", "Italy", "Aztec", "Monastery", "Gray", "Clear", "Cobblestone", "Rainy", "Dusty"):depend({
            [1] = nil, 
            [2] = "Proper skybox", 
            [1] = v167.elements.addons
        });
        v167.elements.allow_leaning_while_standing = v167.elements.leaning:create():switch("\v\226\164\183  \rAllow Standing Leaning");
        v167.elements.allow_leaning_while_standing:tooltip("Allows the cheat to play lean animations while you\226\128\153re standing still.");
        v167.elements.earthquake = v167.elements.leaning:create():switch("\v\226\164\183  \rEarthquake");
        v167.elements.earthquake:tooltip("Shakes the local player\226\128\153s model based on the Leaning slider value.\n\n\a{Small Text}Higher values make the shake more noticeable.");
        v167.elements.keep_model_transparency.scale:depend(v167.elements.keep_model_transparency);
        v167.elements.arrows_accent = v167.elements.manual_arrows:create():color_picker("\v\226\128\162  \rAccent", color(255, 0, 0, 255)):depend(v167.elements.manual_arrows);
        v167.elements.arrows_font = v167.elements.manual_arrows:create():combo("    \v\226\164\183  \rFont", "Default", "Pixel", "Console", "Bold", "Large"):depend(v167.elements.manual_arrows);
        v167.elements.arrows_forward = v167.elements.manual_arrows:create():input("\v\226\128\162  \rForward", "^"):depend(v167.elements.manual_arrows);
        v167.elements.arrows_left = v167.elements.manual_arrows:create():input("\v\226\128\162  \rLeft", "<"):depend(v167.elements.manual_arrows);
        v167.elements.arrows_right = v167.elements.manual_arrows:create():input("\v\226\128\162  \rRight", ">"):depend(v167.elements.manual_arrows);
        v167.elements.allow_leaning_while_standing:depend({
            [1] = nil, 
            [2] = false, 
            [1] = v167.elements.earthquake
        });
        v167.elements.viewmodel.left_hand:depend({
            [1] = nil, 
            [2] = "Right", 
            [1] = v167.elements.viewmodel.main_hand
        }):tooltip("Knife will be in left hand when you take it out.");
        v167.elements.viewmodel.right_hand:depend({
            [1] = nil, 
            [2] = "Left", 
            [1] = v167.elements.viewmodel.main_hand
        }):tooltip("Knife will be in right hand when you take it out.");
        v167.elements.viewmodel.main_hand:tooltip("Allows you to choose your hand side \226\128\148 right-handed or left-handed.");
        v167.elements.viewmodel.csco_roll:tooltip("Enables first-person screen leaning animation, similar to the one in the Classic Offensive mod for CS:GO.");
        v167.elements.manual_arrows:tooltip("Shows arrows for your selected\nAnti Aim manual direction.");
        v167.elements.keep_model_transparency:tooltip("Smoothly fades the local player\226\128\153s model when scoping in, out, and between shots \226\128\148 mimicking the \a{Active Text}game\a96C83CFFsense \reffect.");
        v167.elements.custom_scope:tooltip("Changes black scope lines to custom ones with your accent color, size, and gap.");
        v167.elements.damage_indicator:tooltip("Displays min. damage indicator near the crosshair when overridden.\n\n\a{Small Text}Requires 'Show in Hotkeys' to be turned on.");
        v167.elements.hitmarkers:tooltip("Shows hit markers either on the screen (2D) or at the hit location (3D), depending on the selected type.\n\n\a{Small Text}You can enable both types at the same time.");
        v167.elements.screen_duration:tooltip("Controls how many seconds the hit marker stays visible on the screen.");
        v167.elements.world_duration:tooltip("Controls how many seconds the hit marker stays visible on the screen.");
        v167.elements.addons:tooltip("\227\131\187\"Disable foot shadows\" turns off foot shadows under the local player.\n\n\227\131\187\"Disable use opens buy menu\" disables the use key (E) from opening the buy menu in the buy zone.\n\n\227\131\187\"No sleeves\" removes first-person sleeves on agents that have them.\n\n\227\131\187\"Clear console on round start\" clears the console at round start so you don\226\128\153t have to manually do it.\n\n\227\131\187\"Proper skybox\" restores props to the skybox, making the game look nicer. \a{Small Text}(May reduce FPS by 50\226\128\147150 due to extra prop rendering.)\r\n\n\227\131\187\"Disable ragdoll physics\" turns off ragdoll physics; dead players show a ghost-like animation instead.");
        v167.elements.clan_tag:tooltip("Enables an animated clan tag to show off your Lua.\n\n\a{Small Text}Synchronizes with other users running the same Lua and clan tag.");
        v167.elements.clientside_nickname:tooltip("Allows you to hide your real nickname on your screen when recording video.");
        v167.aspect_ratio_ratios = {
            [161] = "  16:10  ", 
            [177] = "  16:9  ", 
            [125] = "  5:4  ", 
            [150] = "  3:2  ", 
            [133] = "  4:3  "
        };
        v167.itter = 0;
        for v185, v186 in pairs(v167.aspect_ratio_ratios) do
            v167.itter = v167.itter + 1;
            do
                local l_v185_0 = v185;
                v167.but = v167.elements.aspectratio:create():button(v186, function()
                    -- upvalues: v167 (ref), l_v185_0 (ref)
                    v167.other.elements.aspectratio.scale:set(l_v185_0);
                end);
            end;
        end;
    end
}):struct("avoid_backstab")({
    reference = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    invoke = function(v188)
        local function v190(v189)
            -- upvalues: v188 (ref)
            v188.reference:override(v189:get());
        end;
        v188.antiaim.elements.options_table.avoid_backstab:set_callback(v190, true);
    end
}):struct("csco_roll")({
    current_roll = 0, 
    target_roll = 0, 
    on_createmove = function(v191, v192)
        v191.target_roll = 0;
        if v192.in_moveleft and not v192.in_moveright then
            v191.target_roll = -0.5;
        elseif v192.in_moveright and not v192.in_moveleft then
            v191.target_roll = 0.5;
        end;
        local v193 = 6 * globals.frametime;
        v191.current_roll = v191.current_roll + (v191.target_roll - v191.current_roll) * v193;
    end, 
    on_override_view = function(v194, v195)
        v195.view.z = v194.current_roll;
    end, 
    init = function(v196)
        local function v198(v197)
            -- upvalues: v196 (ref)
            v196:on_createmove(v197);
        end;
        local function v200(v199)
            -- upvalues: v196 (ref)
            v196:on_override_view(v199);
        end;
        local function v202(v201)
            -- upvalues: v198 (ref), v200 (ref)
            events.createmove(v198, v201:get());
            events.override_view(v200, v201:get());
        end;
        v196.other.elements.viewmodel.csco_roll:set_callback(v202, true);
    end
}):struct("tweaks")({
    fs_ref = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    lag_option_ref = l_pui_0.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    get_aimbot_targets = function(_)
        local v204 = {};
        local v205 = entity.get_player_resource();
        for v206 = 1, globals.max_players do
            local v207 = entity.get(v206);
            if v207 ~= nil and v205.m_bConnected[v206] and v207:is_enemy() and v207:is_alive() then
                table.insert(v204, v207);
            end;
        end;
        return v204;
    end, 
    should_activate = function(_, v209, v210, v211)
        if v209 == 1 then
            return v210;
        elseif v209 == 2 then
            return #v211 == 0;
        else
            return false;
        end;
    end, 
    calculate_offset = function(_, v213, v214, v215, v216, v217)
        if v213 == "Spin" then
            return -math.fmod(globals.curtime * (v214 * 360), v215 * 2) + v215;
        elseif v213 == "Distortion" then
            return math.sin(globals.curtime * v214) * v215;
        else
            return globals.realtime % 0.2 >= 0.1 and v216 or v217;
        end;
    end, 
    createmove = function(v218, v219)
        local v220 = entity.get_local_player();
        if not v220 or not v220:is_alive() then
            return;
        else
            local v221 = v218.antiaim.elements.options_table.tweaks:get() or {};
            local l_m_bWarmupPeriod_0 = entity.get_game_rules().m_bWarmupPeriod;
            local v223 = v218:get_aimbot_targets();
            local v224 = false;
            for _, v226 in ipairs(v221) do
                if v226 == "Warmup" then
                    if not v224 then
                        v224 = l_m_bWarmupPeriod_0;
                    end;
                elseif v226 == "No Enemies" and not v224 then
                    if #v223 ~= 0 then
                        v224 = false;
                    else
                        v224 = true;
                    end;
                end;
            end;
            if v224 then
                v218.lag_option_ref:override("On Peek");
                v219.force_defensive = false;
                local v227 = ({
                    Up = "Fake Up", 
                    Down = "Down", 
                    Disabled = "Disabled"
                })[v218.antiaim.elements.options_table.tweaks_pitch:get()];
                v218.references.antiaim.angles.pitch:override(v227);
                local v228 = v218:calculate_offset(v218.antiaim.elements.options_table.tweaks_yaw_type:get(), v218.antiaim.elements.options_table.tweaks_speed:get(), v218.antiaim.elements.options_table.tweaks_range:get(), v218.antiaim.elements.options_table.tweaks_left_offset:get(), (v218.antiaim.elements.options_table.tweaks_right_offset:get()));
                v218.references.antiaim.angles.extract_yaw.offset:override(v228);
                v218.references.antiaim.angles.extract_modifier.mode:override("Disabled");
                v218.references.antiaim.angles.extract_desync.switch:override(false);
                v218.fs_ref:override(false);
            end;
            return;
        end;
    end, 
    init = function(v229)
        local function v231(v230)
            -- upvalues: v229 (ref)
            v229:createmove(v230);
        end;
        local function v233(v232)
            -- upvalues: v231 (ref)
            if #v232:get() > 0 then
                events.createmove:set(v231);
            else
                events.createmove:unset(v231);
            end;
        end;
        v229.antiaim.elements.options_table.tweaks:set_callback(v233, true);
    end
}):struct("safe_head")({
    height = function(_)
        local v235 = entity.get_local_player();
        local v236 = entity.get_threat(false);
        local v237 = v236 ~= nil and v236:get_origin() or vector();
        return v235:get_origin().z - 35 > v237.z + 0;
    end, 
    check = function(v238)
        if v238.antiaim.elements.manual_yaw:get() ~= "Disabled" or v238.antiaim.elements.freestanding:get() then
            return;
        else
            local v239 = entity.get_local_player();
            if not v239 or not v239:is_alive() then
                return;
            elseif entity.get_threat(true) == nil then
                return;
            else
                local v240 = v239:get_player_weapon();
                if v240 == nil then
                    return;
                else
                    local v241 = v240:get_classname();
                    if v238.antiaim.elements.options_table.safe_head:get(1) and v238:height() and v238.localplayer:state() == 1 or v238.antiaim.elements.options_table.safe_head:get(2) and v238:height() and (v238.localplayer:state() == 4 or v238.localplayer:state() == 5) or v238.antiaim.elements.options_table.safe_head:get(3) and v238.localplayer:state() == 7 and (v241 == "CKnife" or v241 == "CWeaponTaser") then
                        v238.references.antiaim.angles.extract_yaw.offset:override(30);
                        v238.references.antiaim.angles.extract_modifier.offset:override(0);
                        v238.references.antiaim.angles.extract_desync.switch:override(true);
                        v238.references.antiaim.angles.extract_desync.left_limit:override(60);
                        v238.references.antiaim.angles.extract_desync.right_limit:override(60);
                        rage.antiaim:inverter(false);
                    end;
                    return;
                end;
            end;
        end;
    end, 
    init = function(v242)
        local function v243()
            -- upvalues: v242 (ref)
            v242:check();
        end;
        local function v245(v244)
            -- upvalues: v243 (ref)
            if #v244:get() > 0 then
                events.createmove:set(v243);
            else
                events.createmove:unset(v243);
            end;
        end;
        v242.antiaim.elements.options_table.safe_head:set_callback(v245, true);
    end
}):struct("log_events")({
    aim_fire = 0, 
    logs_ref = l_pui_0.find("Miscellaneous", "Main", "Other", "Log Events"), 
    nade_type = {
        knife = "Knifed", 
        inferno = "Burned", 
        hegrenade = "Naded"
    }, 
    console_print = function(v246, v247)
        local _ = v246.other.elements.log_events.main_accent:get();
        local v249 = v246.other.elements.log_events.prefix_accent:get():to_hex();
        local v250 = v246.other.elements.log_events.prefix:get();
        local v251 = {};
        local v252 = {};
        for v253 in v250:gmatch("%S+") do
            if v253 == "nh" then
                v251.use_hex = false;
            elseif v253 == "nb" then
                v251.use_brackets = false;
            elseif v253 == "np" then
                v251.use_prefix = false;
            elseif v253:match("p=") then
                v251.custom_prefix = v253:match("p=(.+)");
            elseif v253:match("b=") then
                v251.bracket_type = v253:match("b=(.+)");
            else
                table.insert(v252, v253);
            end;
        end;
        if not v251.custom_prefix and #v252 > 0 then
            v251.custom_prefix = table.concat(v252, " ");
        end;
        local v254 = {
            use_prefix = true, 
            use_brackets = true, 
            bracket_type = "[]", 
            use_hex = true, 
            custom_prefix = "Nyanza"
        };
        for v255, v256 in pairs(v254) do
            if v251[v255] == nil then
                v251[v255] = v256;
            end;
        end;
        local v257 = "";
        if v251.use_prefix then
            local l_custom_prefix_0 = v251.custom_prefix;
            if v251.use_hex then
                l_custom_prefix_0 = "\a" .. v249 .. l_custom_prefix_0 .. "\aDEFAULT";
            end;
            if v251.use_brackets then
                v257 = v251.bracket_type:sub(1, 1) .. l_custom_prefix_0 .. v251.bracket_type:sub(2, 2);
            else
                v257 = l_custom_prefix_0;
            end;
        end;
        if v257 ~= "" then
            print_raw(string.format("%s %s", v257, v247));
            print_dev(string.format("%s %s", v257, v247));
        else
            print_raw(v247);
            print_dev(v247);
        end;
    end, 
    on_aim_fire = function(v259, _)
        v259.aim_fire = globals.server_tick;
    end, 
    aim_ack = function(v261, v262)
        local v263 = math.max(globals.server_tick - v261.aim_fire - 1, 0);
        local l_target_0 = v262.target;
        local v265 = {
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
        local l_state_0 = v262.state;
        local v267 = l_target_0:get_name();
        local l_m_iHealth_0 = l_target_0.m_iHealth;
        local _ = v262.spread;
        local l_backtrack_0 = v262.backtrack;
        local l_hitchance_0 = v262.hitchance;
        local l_damage_0 = v262.damage;
        local l_wanted_damage_0 = v262.wanted_damage;
        local v274 = v265[v262.hitgroup] or "body";
        local v275 = v265[v262.wanted_hitgroup] or "body";
        local v276 = v261.other.elements.log_events.main_accent:get():to_hex();
        if not l_target_0 then
            return;
        else
            if l_state_0 == "correction" or l_state_0 == "backtrack failure" then
                l_state_0 = "?";
            end;
            if not l_state_0 then
                v261:console_print(string.format("Hit \a%s%s%s \aDEFAULTin the \a%s%s\aDEFAULT%s for \a%s%d\aDEFAULT%s damage (hc: \a%s%d%%\aDEFAULT \a898989FF\194\183\aDEFAULT bt: \a%s%st\aDEFAULT)%s", v276, v267, l_m_iHealth_0 ~= 0 and string.format("\aDEFAULT(\aC6CBD1FF%shp\aDEFAULT)", l_m_iHealth_0) or "", v276, v274, v275 ~= v274 and string.format("(\aC6CBD1FF%s\aDEFAULT)", v275) or "", v276, l_damage_0, l_wanted_damage_0 ~= l_damage_0 and string.format("(\aC6CBD1FF%d\aDEFAULT)", l_wanted_damage_0) or "", v276, l_hitchance_0, v276, l_backtrack_0, v263 ~= 0 and string.format(" \aDEFAULT(delay=\a%s%.0fms\aDEFAULT)", v276, to_time(v263) * 1000) or ""));
            else
                v261:console_print(string.format("\aC6CBD1FFMissed \a%s%s\aDEFAULT's \a%s%s \aDEFAULTdue to \a%s%s\aDEFAULT (hc: \a%s%d%% \a898989FF\194\183\aDEFAULT bt: \a%s%dt\aDEFAULT) (damage: \a%s%shp\aDEFAULT)", v276, v267, v276, v275, v276, l_state_0, v276, l_hitchance_0, v276, l_backtrack_0, v276, l_wanted_damage_0));
            end;
            return;
        end;
    end, 
    player_hurt = function(v277, v278)
        local v279 = entity.get_local_player();
        local v280 = entity.get(v278.userid, true);
        local v281 = entity.get(v278.attacker, true);
        local v282 = v277.other.elements.log_events.main_accent:get():to_hex();
        if v280 == v279 or v281 ~= v279 or v277.nade_type[v278.weapon] == nil then
            return;
        else
            v277:console_print(string.format("\aC6CBD1FF%s \a%s%s%s \aDEFAULTfor \a" .. v282 .. "%s \aDEFAULTdamage", v277.nade_type[v278.weapon], v282, v280:get_name(), v278.health > 0 and string.format("\aDEFAULT(\aC6CBD1FF%shp\aDEFAULT)", v278.health) or "", v278.dmg_health));
            return;
        end;
    end, 
    item_purchase = function(v283, v284)
        local v285 = entity.get(v284.userid, true);
        local v286 = v283.other.elements.log_events.main_accent:get():to_hex();
        if v285 == nil or not v285:is_enemy() then
            return;
        else
            local l_weapon_0 = v284.weapon;
            if l_weapon_0 == "weapon_unknown" then
                return;
            else
                local v288 = {
                    item_assaultsuit = "Kevlar + Helmet", 
                    weapon_c4 = "C4", 
                    weapon_tablet = "Tablet", 
                    weapon_knife_butterfly = "Butterfly Knife", 
                    weapon_healthshot = "Medi-Shot", 
                    weapon_knife_tactical = "Huntsman Knife", 
                    weapon_bumpmine = "Bump Mine", 
                    weapon_knife_gut = "Gut Knife", 
                    weapon_breachcharge = "Breach Charge", 
                    weapon_knife_flip = "Flip Knife", 
                    weapon_taser = "Zeus X27", 
                    weapon_knife_karambit = "Karambit", 
                    weapon_snowball = "Snowball", 
                    weapon_knife_m9_bayonet = "M9 Bayonet", 
                    weapon_hammer = "Hammer", 
                    weapon_bayonet = "Bayonet", 
                    weapon_spanner = "Wrench", 
                    weapon_shield = "Ballistic Shield", 
                    weapon_axe = "Axe", 
                    weapon_knife_ghost = "Spectral Shiv", 
                    weapon_fists = "Fists", 
                    weapon_knifegg = "Golden Knife", 
                    weapon_knife_ursus = "Ursus Knife", 
                    weapon_knife_t = "T Knife", 
                    weapon_knife_gypsy_jackknife = "Navaja Knife", 
                    weapon_knife = "Ct Knife", 
                    weapon_knife_stiletto = "Stiletto Knife", 
                    weapon_negev = "Negev", 
                    weapon_knife_widowmaker = "Talon Knife", 
                    weapon_m249 = "M249", 
                    weapon_knife_survival_bowie = "Bowie Knife", 
                    weapon_scar20 = "Scar-20", 
                    weapon_knife_push = "Shadow Daggers", 
                    weapon_g3sg1 = "G3sg1", 
                    weapon_knife_falchion = "Falchion Knife", 
                    weapon_awp = "Awp", 
                    weapon_ssg08 = "Ssg 08", 
                    weapon_aug = "Aug", 
                    weapon_m4a4 = "M4a4", 
                    weapon_m4a1_silencer = "M4a1-s", 
                    weapon_famas = "Famas", 
                    weapon_sg556 = "Sg 553", 
                    weapon_ak47 = "Ak-47", 
                    weapon_galilar = "Galil Ar", 
                    weapon_mp5sd = "Mp5-SD", 
                    weapon_mp9 = "Mp9", 
                    weapon_bizon = "PP-Bizon", 
                    weapon_p90 = "P90", 
                    weapon_ump45 = "Ump-45", 
                    weapon_mp7 = "Mp7", 
                    weapon_mac10 = "Mac-10", 
                    weapon_mag7 = "Mag-7", 
                    weapon_sawedoff = "Sawed-Off", 
                    weapon_xm1014 = "Xm1014", 
                    weapon_nova = "Nova", 
                    weapon_fiveseven = "Five-Seven", 
                    weapon_hkp2000 = "P2000", 
                    weapon_usp_silencer = "Usp-s", 
                    weapon_revolver = "R8 Revolver", 
                    weapon_deagle = "Desert Eagle", 
                    weapon_cz75a = "Cz75-auto", 
                    weapon_tec9 = "Tec-9", 
                    weapon_p250 = "P250", 
                    weapon_elite = "Dual Berettas", 
                    weapon_glock = "Glock-18", 
                    weapon_diversion = "Diversion Device", 
                    weapon_tagrenade = "Tag", 
                    weapon_incgrenade = "Molotov", 
                    weapon_molotov = "Molotov", 
                    weapon_smokegrenade = "Smoke", 
                    weapon_flashbang = "Flashbang", 
                    weapon_decoy = "Decoy", 
                    weapon_hegrenade = "HE", 
                    item_heavyassaultsuit = "Heavy Assault Suit", 
                    item_cutters = "Rescue Kit", 
                    item_defuser = "Defuse Kit", 
                    item_kevlar = "Kevlar"
                };
                local function v290(v289)
                    -- upvalues: v288 (ref)
                    return v288[v289] or v289:gsub("^weapon_", ""):gsub("^item_", ""):gsub("_", " "):gsub(" ar$", ""):gsub(" m4a1", "m4a1");
                end;
                local v291 = v285:get_name();
                v283:console_print(string.format("\a%s%s \aDEFAULTbought \a%s%s\aDEFAULT", v286, v291, v286, v290(l_weapon_0)));
                return;
            end;
        end;
    end, 
    init = function(v292)
        v292.logs_ref:override("");
        local function v293()
            -- upvalues: v292 (ref)
            v292:on_aim_fire();
        end;
        local function v295(v294)
            -- upvalues: v292 (ref)
            v292:aim_ack(v294);
        end;
        local function v297(v296)
            -- upvalues: v292 (ref)
            v292:player_hurt(v296);
        end;
        local function v299(v298)
            -- upvalues: v292 (ref)
            v292:item_purchase(v298);
        end;
        local function v301(v300)
            -- upvalues: v293 (ref), v295 (ref), v297 (ref)
            events.aim_fire(v293, v300:get());
            events.aim_ack(v295, v300:get());
            events.player_hurt(v297, v300:get());
        end;
        local function v303(v302)
            -- upvalues: v299 (ref)
            events.item_purchase(v299, v302:get());
        end;
        v292.other.elements.log_events.damage_dealt:set_callback(v301, true);
        v292.other.elements.log_events.purchases:set_callback(v303, true);
    end
}):struct("clantag")({
    step = 1, 
    speed = 10, 
    ref = l_pui_0.find("Miscellaneous", "Main", "In-Game", "Clan Tag"), 
    list = {
        [1] = "5", 
        [2] = "55", 
        [3] = "5 55", 
        [4] = "5 5 5", 
        [5] = "55 5", 
        [6] = "555", 
        [7] = "555", 
        [8] = "55", 
        [9] = "5", 
        [10] = "", 
        [11] = "ko", 
        [12] = "kop", 
        [13] = "kopf", 
        [14] = "kopfs", 
        [15] = "kopfsc", 
        [16] = "kopfsch", 
        [17] = "kopfschu", 
        [18] = "kopfschuss", 
        [19] = "kopfschuss", 
        [20] = "kopfschuss", 
        [21] = "kopfschuss", 
        [22] = "kopfschuss", 
        [23] = "kopfschuss", 
        [24] = "kopfschuss", 
        [25] = "kopfschuss", 
        [26] = "kopfschuss", 
        [27] = "kopfschuss", 
        [28] = "kopfschuss", 
        [29] = "kopfschuss", 
        [30] = "pfschuss", 
        [31] = "fschuss", 
        [32] = "schuss", 
        [33] = "chuss", 
        [34] = "uss", 
        [35] = "ss", 
        [36] = ""
    }, 
    run = function(v304)
        local function v306()
            -- upvalues: v304 (ref)
            local v305 = math.floor(globals.tickcount / v304.speed) % #v304.list + 1;
            if v305 == v304.step then
                return;
            else
                v304.step = v305;
                v304.ref:override(false);
                common.set_clan_tag(v304.list[v305]);
                return;
            end;
        end;
        local function v307()
            -- upvalues: v304 (ref)
            common.set_clan_tag("");
            v304.ref:override();
        end;
        local function v309(v308)
            -- upvalues: v306 (ref), v307 (ref)
            if v308:get() then
                events.net_update_end:set(v306);
                events.shutdown:set(v307);
            else
                events.net_update_end:unset(v306);
                events.shutdown:unset(v307);
                common.set_clan_tag("");
            end;
        end;
        v304.other.elements.clan_tag:set_callback(v309, true);
    end
}):struct("manual_arrows")({
    padding = 40, 
    color_disabled = color(0, 0, 0, 127), 
    screen = render.screen_size(), 
    center = vector(0, 0), 
    big_font = render.load_font("museo900", 20, "ad"), 
    render = function(v310)
        local v311 = entity.get_local_player();
        if not v311 or not v311:is_alive() then
            return;
        else
            local v312 = v310.antiaim.elements.manual_yaw:get();
            local v313 = v310.other.elements.arrows_accent:get() or color(255, 255, 255, 255);
            local v314 = ({
                Default = 1, 
                Bold = 4, 
                Console = 3, 
                Pixel = 2, 
                Large = v310.big_font
            })[v310.other.elements.arrows_font:get()] or "Custom";
            local v315 = nil;
            local v316 = nil;
            if v312 == "Left" then
                v315 = v310.other.elements.arrows_left:get();
                local v317 = render.measure_text(v314, "", v315);
                v316 = vector(v310.center.x - v310.padding - v317.x, v310.center.y - v317.y * 0.5);
            elseif v312 == "Right" then
                v315 = v310.other.elements.arrows_right:get();
                local v318 = render.measure_text(v314, "", v315);
                v316 = vector(v310.center.x + v310.padding, v310.center.y - v318.y * 0.5);
            elseif v312 == "Forward" then
                v315 = v310.other.elements.arrows_forward:get();
                local v319 = render.measure_text(v314, "", v315);
                v316 = vector(v310.center.x - v319.x * 0.5, v310.center.y - v310.padding - v319.y);
            else
                return;
            end;
            local v320 = math.abs(math.sin(globals.realtime * 1));
            local v321, v322, v323, v324 = v313:unpack();
            local v325 = 0.5 + 0.5 * v320;
            local v326 = color(v321, v322, v323, v324 * v325);
            render.text(v314, v316, v326, "a", v315);
            return;
        end;
    end, 
    init = function(v327)
        v327.center = vector(v327.screen.x * 0.5, v327.screen.y * 0.5);
        local function v328()
            -- upvalues: v327 (ref)
            v327:render();
        end;
        local function v330(v329)
            -- upvalues: v328 (ref)
            events.render(v328, v329:get());
        end;
        v327.other.elements.manual_arrows:set_callback(v330, true);
    end
}):struct("fast_ladder")({
    createmove = function(_, v332)
        local v333 = entity.get_local_player();
        if not v333 or not v333:is_alive() then
            return;
        elseif v333.m_MoveType ~= 9 then
            return;
        else
            local _ = render.camera_angles();
            v332.view_angles.y = math.floor(0.5 + v332.view_angles.y);
            v332.view_angles.z = 0;
            if v332.forwardmove > 0 then
                v332.view_angles.x = 89;
                v332.in_moveright = 1;
                v332.in_moveleft = 0;
                v332.in_forward = 0;
                v332.in_back = 1;
                if v332.sidemove == 0 then
                    v332.view_angles.y = v332.view_angles.y + 90;
                end;
                if v332.sidemove < 0 then
                    v332.view_angles.y = v332.view_angles.y + 150;
                end;
                if v332.sidemove > 0 then
                    v332.view_angles.y = v332.view_angles.y + 30;
                end;
            elseif v332.forwardmove < 0 then
                v332.view_angles.x = 89;
                v332.in_moveleft = 1;
                v332.in_moveright = 0;
                v332.in_forward = 1;
                v332.in_back = 0;
                if v332.sidemove == 0 then
                    v332.view_angles.y = v332.view_angles.y + 90;
                end;
                if v332.sidemove > 0 then
                    v332.view_angles.y = v332.view_angles.y + 150;
                end;
                if v332.sidemove < 0 then
                    v332.view_angles.y = v332.view_angles.y + 30;
                end;
            end;
            return;
        end;
    end, 
    init = function(v335)
        local function v337(v336)
            -- upvalues: v335 (ref)
            v335:createmove(v336);
        end;
        local function v339(v338)
            -- upvalues: v337 (ref)
            events.createmove(v337, v338:get());
        end;
        v335.other.elements.fast_ladder:set_callback(v339, true);
    end
}):struct("no_fall_damage")({
    last_no_fall_damage_state = false, 
    should_jump = false, 
    no_fall_damage = false, 
    trace = function(_, v341)
        local v342 = entity.get_local_player();
        return utils.trace_line(v342:get_origin(), v342:get_origin() + vector(0, 0, -v341), v342).fraction < 1;
    end, 
    createmove = function(v343, v344)
        local v345 = entity.get_local_player();
        if not v345 or not v345:is_alive() then
            return;
        else
            v343.velocity_z = v345.m_vecVelocity.z;
            if v343.velocity_z > -580 then
                return;
            else
                v343.new_state = v343.velocity_z < -580 and not v343:trace(15);
                if v343.new_state ~= v343.last_no_fall_damage_state then
                    v343.no_fall_damage = v343.new_state;
                    v343.last_no_fall_damage_state = v343.new_state;
                end;
                if v343.velocity_z < -580 then
                    v344.in_duck = v343.no_fall_damage and 1 or 0;
                end;
                return;
            end;
        end;
    end, 
    init = function(v346)
        local function v348(v347)
            -- upvalues: v346 (ref)
            v346:createmove(v347);
        end;
        local function v350(v349)
            -- upvalues: v348 (ref)
            events.createmove(v348, v349:get());
        end;
        v346.other.elements.no_fall_damage:set_callback(v350, true);
    end
}):struct("force_break_lc")({
    lag_option_ref = l_pui_0.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    hide_shots_ref = l_pui_0.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
    update = function(v351, v352)
        local v353 = entity.get_local_player();
        if not v353 or not v353:is_alive() then
            return;
        else
            local v354 = v353:get_player_weapon();
            if not v354 then
                return;
            else
                local v355 = v354:get_classname();
                if v351.antiaim.elements.disable_lc_grenade:get() and v355:find("Grenade") then
                    v351.lag_option_ref:override("On Peek");
                    v351.hide_shots_ref:set("Favor Fire Rate");
                    return;
                else
                    v351.hide_shots_ref:override(v351.antiaim.elements.hide_shots:get());
                    local v356, v357 = v351.localplayer:state(v352);
                    local v358 = v351.antiaim.data[v356] and v351.antiaim.data[v356][v357];
                    if not v358 then
                        v351.lag_option_ref:override("On Peek");
                        return;
                    else
                        if v351.antiaim.elements.force_break_lc:get(v356) then
                            if v358.tickbase:get() ~= "Neverlose" then
                                v351.lag_option_ref:override("On Peek");
                                if v358.tickbase_randomize:get() then
                                    if v358.tickbase_rndm_type:get() == "Default" then
                                        local v359 = v358.tickbase_rndm:get();
                                        local v360 = v358.tickbase_rndm_2:get();
                                        v352.force_defensive = v352.command_number % math.random(v359, v360) == 0;
                                    else
                                        local v361 = v358.tickbase_sliders:get();
                                        if v361 > 0 then
                                            local v362 = v358["tickbase_" .. math.random(1, v361)]:get();
                                            v352.force_defensive = v352.command_number % v362 == 0;
                                        end;
                                    end;
                                else
                                    v352.force_defensive = v352.command_number % v358.tickbase_choke:get() == 0;
                                end;
                            else
                                v351.lag_option_ref:override("Always on");
                            end;
                        else
                            v351.lag_option_ref:override("On Peek");
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end, 
    init = function(v363)
        local function v365(v364)
            -- upvalues: v363 (ref)
            v363:update(v364);
        end;
        events.createmove(v365);
    end
}):struct("player_animations")({
    walk_directory_ref = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    smoothed_pose_p = {}, 
    smoothed_layers = {}, 
    update = function(v366)
        for v367 = 0, 12 do
            v366.smoothed_pose_p[v367] = 0;
            v366.smoothed_layers[v367] = 0;
        end;
        v366.override_animations = function()
            -- upvalues: v366 (ref)
            local v368 = entity.get_local_player();
            if not v368 or not v368:is_alive() then
                return;
            else
                v366.leaning_layer = ffi.cast("CAnimationLayer**", ffi.cast("uintptr_t", v368[0]) + 10640)[0][12];
                v366.velocity = v368.m_vecVelocity:length();
                if v366.other.elements.leaning:get() ~= 0 then
                    if not v366.other.elements.earthquake:get() then
                        if v366.other.elements.allow_leaning_while_standing:get() then
                            v366.leaning_layer.m_flWeight = v366.other.elements.leaning:get() / 100;
                        elseif not v366.other.elements.allow_leaning_while_standing:get() and v366.velocity > 3 then
                            v366.leaning_layer.m_flWeight = v366.other.elements.leaning:get() / 100;
                        end;
                    else
                        v366.leaning_layer.m_flWeight = math.random(0, 10) / 10;
                    end;
                end;
                if v366.other.elements.falling:get() ~= 0 then
                    v368.m_flPoseParameter[6] = v366.other.elements.falling:get() / 10;
                end;
                if v366.other.elements.walking:get() == 1 then
                    v366.walk_directory_ref:override("Walking");
                    v368.m_flPoseParameter[7] = 0;
                elseif v366.other.elements.walking:get() == 2 then
                    v366.walk_directory_ref:override("Sliding");
                    if globals.tickcount % 4 > 1 then
                        v368.m_flPoseParameter[0] = 1;
                        v368.m_flPoseParameter[1] = 1;
                        v368.m_flPoseParameter[7] = 1;
                    end;
                else
                    v366.walk_directory_ref:override();
                end;
                if v366.other.elements.interpolating:get() > 0 then
                    local v369 = globals.tickinterval * v366.other.elements.interpolating:get();
                    for v370 = 0, 12 do
                        v366.smoothed_pose_p[v370] = v369 * v366.smoothed_pose_p[v370] + (1 - v369) * v368.m_flPoseParameter[v370];
                        v368.m_flPoseParameter[v370] = v366.smoothed_pose_p[v370];
                    end;
                    for v371 = 0, 12 do
                        local v372 = ffi.cast("CAnimationLayer**", ffi.cast("uintptr_t", v368[0]) + 10640)[0][v371];
                        v366.smoothed_layers[v371] = v369 * v366.smoothed_layers[v371] + (1 - v369) * v372.m_flWeight;
                        v372.m_flWeight = v366.smoothed_layers[v371];
                    end;
                end;
                return;
            end;
        end;
        events.post_update_clientside_animation(v366.override_animations);
    end
}):struct("freezetime_fakeduck")({
    ready = false, 
    cnt = 0, 
    fakeduck_ref = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    dt_ref = l_pui_0.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    hs_ref = l_pui_0.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    createmove = function(v373, v374)
        local v375 = entity.get_local_player();
        if not v375 or not v375:is_alive() then
            return;
        else
            local v376 = entity.get_game_rules();
            if not v376.m_bFreezePeriod == true then
                v373.dt_ref:override();
                v373.hs_ref:override();
                return;
            else
                if v376.m_bFreezePeriod == true and v373.fakeduck_ref:get() then
                    v373.dt_ref:override(false);
                    v373.hs_ref:override(false);
                    v374.send_packet = false;
                    should = false;
                    if v373.cnt % 14 == 0 then
                        v373.ready = true;
                    elseif v373.cnt % 14 == 6 then
                        v374.send_packet = true;
                    elseif v373.cnt % 14 == 7 then
                        v373.ready = false;
                    end;
                    if v373.ready then
                        v374.in_duck = true;
                    else
                        v374.in_duck = false;
                    end;
                    v373.cnt = v373.cnt + 1;
                else
                    v373.dt_ref:override();
                    v373.hs_ref:override();
                    v373.ready = false;
                    v373.cnt = 0;
                    should = true;
                end;
                return;
            end;
        end;
    end, 
    override_view = function(v377, v378)
        local v379 = entity.get_local_player();
        if not v379 or not v379:is_alive() then
            return;
        else
            local v380 = entity.get_game_rules();
            if not v380.m_bFreezePeriod == true then
                return;
            else
                if v380.m_bFreezePeriod == true and v377.fakeduck_ref:get() then
                    v378.camera.z = v379:get_origin().z + 64;
                end;
                return;
            end;
        end;
    end, 
    init = function(v381)
        local function v383(v382)
            -- upvalues: v381 (ref)
            v381:createmove(v382);
        end;
        local function v385(v384)
            -- upvalues: v381 (ref)
            v381:override_view(v384);
        end;
        local function v387(v386)
            -- upvalues: v383 (ref), v385 (ref)
            events.createmove(v383, v386:get());
            events.override_view(v385, v386:get());
        end;
        v381.other.elements.freezetime_fakeduck:set_callback(v387, true);
    end
}):struct("fakeduck_speed")({
    fakeduck_ref = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    createmove_run = function(v388, v389)
        if not v388.fakeduck_ref:get() then
            return;
        else
            local v390 = entity.get_local_player();
            if not v390 or not v390:is_alive() then
                return;
            else
                local l_m_vecVelocity_0 = v390.m_vecVelocity;
                if math.abs(l_m_vecVelocity_0.y) > 10 or math.abs(l_m_vecVelocity_0.x) > 10 then
                    local v392 = vector(v389.forwardmove, v389.sidemove);
                    if v392:length() > 0 then
                        v392:normalize();
                        local v393 = v388.other.elements.custom_fakeduck.scale:get();
                        v389.forwardmove = v392.x * v393;
                        v389.sidemove = v392.y * v393;
                    end;
                end;
                return;
            end;
        end;
    end, 
    init = function(v394)
        local function v396(v395)
            -- upvalues: v394 (ref)
            v394:createmove_run(v395);
        end;
        local function v398(v397)
            -- upvalues: v396 (ref)
            events.createmove_run(v396, v397:get());
        end;
        v394.other.elements.custom_fakeduck:set_callback(v398, true);
    end
}):struct("hitmarkers")({
    center_y = 0, 
    center_x = 0, 
    screen_duration = 1, 
    world_fade_time = 0.25, 
    world_wait_time = 5, 
    screen_fade_time = 0.25, 
    screen_wait_time = 0.25, 
    screen_active = false, 
    hit_markers = {}, 
    screen = render.screen_size(), 
    init = function(v399)
        local v400 = v399.screen.x / 2;
        v399.center_y = v399.screen.y / 2;
        v399.center_x = v400;
        v400 = function()
            -- upvalues: v399 (ref)
            v399:draw_hit_indicator();
        end;
        local function v401()
            -- upvalues: v399 (ref)
            v399:draw_hit_markers();
        end;
        local function v403(v402)
            -- upvalues: v400 (ref), v401 (ref)
            events.render(v400, v402:get(1) and true or false);
            events.render(v401, v402:get(2) and true or false);
        end;
        v399.other.elements.hitmarkers:set_callback(v403, true);
        events.round_start(function()
            -- upvalues: v399 (ref)
            v399.hit_markers = {};
            v399.screen_active = false;
        end);
        events.player_spawned(function(v404)
            -- upvalues: v399 (ref)
            if entity.get_local_player() == entity.get(v404.userid, true) then
                v399.screen_active = false;
            end;
        end);
        events.aim_ack(function(v405)
            -- upvalues: v399 (ref)
            v399.hit_markers[#v399.hit_markers + 1] = {
                fade_time = 1, 
                position = v405.aim, 
                wait_time = v399.other.elements.world_duration:get() * 0.5, 
                reason = v405.state
            };
        end);
        events.player_hurt(function(v406)
            -- upvalues: v399 (ref)
            if entity.get_local_player() == entity.get(v406.attacker, true) then
                v399.screen_active = true;
                v399.screen_duration = 1;
                v399.screen_wait_time = v399.other.elements.screen_duration:get() * 0.5;
            end;
        end);
    end, 
    draw_hit_indicator = function(v407)
        if not v407.screen_active or not globals.is_in_game then
            return;
        else
            v407.screen_wait_time = v407.screen_wait_time - globals.frametime;
            if v407.screen_wait_time <= 0 then
                v407.screen_duration = v407.screen_duration - globals.frametime / v407.screen_fade_time;
            end;
            local v408 = v407.other.elements.screen_color:get() * v407.screen_duration;
            for _, v410 in ipairs({
                [1] = {
                    [1] = 5, 
                    [2] = 5, 
                    [3] = 10, 
                    [4] = 10
                }, 
                [2] = {
                    [1] = -5, 
                    [2] = 5, 
                    [3] = -10, 
                    [4] = 10
                }, 
                [3] = {
                    [1] = -5, 
                    [2] = -5, 
                    [3] = -10, 
                    [4] = -10
                }, 
                [4] = {
                    [1] = 5, 
                    [2] = -5, 
                    [3] = 10, 
                    [4] = -10
                }
            }) do
                render.line(vector(v407.center_x + v410[1], v407.center_y + v410[2]), vector(v407.center_x + v410[3], v407.center_y + v410[4]), v408);
            end;
            if v407.screen_duration <= 0 then
                v407.screen_active = false;
            end;
            return;
        end;
    end, 
    draw_hit_markers = function(v411)
        for v412 = #v411.hit_markers, 1, -1 do
            local v413 = v411.hit_markers[v412];
            if v413.fade_time <= 0 then
                table.remove(v411.hit_markers, v412);
            else
                v413.wait_time = v413.wait_time - globals.frametime;
                if v413.wait_time <= 0 then
                    v413.fade_time = v413.fade_time - globals.frametime / v411.world_fade_time;
                end;
                if v413.position and not v413.reason then
                    local v414 = render.world_to_screen(v413.position);
                    if v414 then
                        local v415, v416 = v411.other.elements.world_color:get();
                        local v417 = nil;
                        local v418 = nil;
                        if v415 == "Double" then
                            v417 = v416[1];
                            v418 = v416[2];
                        else
                            v417 = v411.other.elements.world_color:get("Simple")[1];
                            v418 = v417;
                        end;
                        local v419 = v413.fade_time * 255;
                        render.rect(vector(v414.x - 1, v414.y - 5), vector(v414.x + 1, v414.y + 5), color(v418.r, v418.g, v418.b, v419), 0, true);
                        render.rect(vector(v414.x - 5, v414.y - 1), vector(v414.x + 5, v414.y + 1), color(v417.r, v417.g, v417.b, v419), 0, true);
                    end;
                end;
            end;
        end;
    end
}):struct("keep_transparency")({
    transparency = 255, 
    override = function(v420, v421)
        local v422 = entity.get_local_player();
        if not v422 or not v422:is_alive() then
            return v421;
        else
            local v423 = v422:get_player_weapon();
            if not v423 then
                return v421;
            else
                local v424 = v423:get_classname();
                if v424:find("Grenade") or v424:find("Flashbang") then
                    return v421;
                else
                    local v425 = v420.other.elements.keep_model_transparency.scale:get();
                    local v426 = (v422.m_bIsScoped or v422.m_bResumeZoom) and 59 or 255;
                    if v420.transparency < v426 then
                        v420.transparency = math.min(v420.transparency + v425, v426);
                    elseif v426 < v420.transparency then
                        v420.transparency = math.max(v420.transparency - v425, v426);
                    end;
                    return v420.transparency;
                end;
            end;
        end;
    end, 
    invoke = function(v427)
        v427.call_transparency_change = function(v428)
            -- upvalues: v427 (ref)
            return v427:override(v428);
        end;
        local function v430(v429)
            -- upvalues: v427 (ref)
            events.localplayer_transparency(v427.call_transparency_change, v429:get());
        end;
        v427.other.elements.keep_model_transparency:set_callback(v430, true);
    end
}):struct("scope_overlay")({
    animated_gap = 0, 
    animation_speed = 16, 
    animated_size = 0, 
    overlay_ref = l_pui_0.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
    screen = render.screen_size(), 
    center = vector(0, 0), 
    lerp = function(_, v432, v433, v434)
        return v432 + (v433 - v432) * math.min(v434, 1);
    end, 
    render = function(v435)
        v435.overlay_ref:override("Remove All");
        v435.enabled = v435.other.elements.custom_scope:get();
        v435.rotated = v435.other.elements.custom_scope.rotated:get();
        v435.size = v435.other.elements.custom_scope.size:get();
        v435.gap = v435.other.elements.custom_scope.gap:get();
        v435.color = {
            main = v435.other.elements.custom_scope.main_accent:get(), 
            edge = v435.other.elements.custom_scope.edge_accent:get()
        };
        local v436 = globals.frametime * v435.animation_speed;
        v435.animated_gap = v435:lerp(v435.animated_gap, v435.gap, v436);
        v435.animated_size = v435:lerp(v435.animated_size, v435.size, v436);
        if not v435.enabled then
            return v435.overlay_ref:override();
        else
            local v437 = entity.get_local_player();
            if not v437 or not v437.m_bIsScoped then
                return;
            else
                local v438 = 1;
                if v435.rotated then
                    render.push_rotation(45, v435.screen / 2 + 1);
                end;
                render.gradient(vector(v435.center.x, v435.center.y - v435.animated_gap - v435.animated_size), vector(v435.center.x + v438, v435.center.y - v435.animated_gap), v435.color.edge, v435.color.edge, v435.color.main, v435.color.main);
                render.gradient(vector(v435.center.x, v435.center.y + v435.animated_gap + 1), vector(v435.center.x + v438, v435.center.y + v435.animated_gap + v435.animated_size), v435.color.main, v435.color.main, v435.color.edge, v435.color.edge);
                render.gradient(vector(v435.center.x - v435.animated_gap - v435.animated_size, v435.center.y), vector(v435.center.x - v435.animated_gap, v435.center.y + v438), v435.color.edge, v435.color.main, v435.color.edge, v435.color.main);
                render.gradient(vector(v435.center.x + v435.animated_gap + 1, v435.center.y), vector(v435.center.x + v435.animated_gap + v435.animated_size, v435.center.y + v438), v435.color.main, v435.color.edge, v435.color.main, v435.color.edge);
                if v435.rotated then
                    render.pop_rotation();
                end;
                return;
            end;
        end;
    end, 
    init = function(v439)
        v439.center = vector(math.floor(v439.screen.x / 2 + 0.5), math.floor(v439.screen.y / 2 + 0.5));
        local function v440()
            -- upvalues: v439 (ref)
            v439:render();
        end;
        local function v441()
            -- upvalues: v439 (ref)
            v439.overlay_ref:override();
        end;
        local function v443(v442)
            -- upvalues: v439 (ref), v440 (ref), v441 (ref)
            v439.overlay_ref:override(v442:get() and "Remove All" or "Remove Overlay");
            events.render(v440, v442:get());
            events.shutdown(v441, v442:get());
        end;
        v439.other.elements.custom_scope:set_callback(v443, true);
    end
}):struct("damage_indicator")({
    ref_dmg_override = l_pui_0.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    screen = render.screen_size(), 
    render = function(v444)
        -- upvalues: l_pui_0 (ref)
        local v445 = entity.get_local_player();
        if not v445 or not v445:is_alive() then
            return;
        else
            for _, v447 in pairs(l_pui_0.get_binds()) do
                if v447.name == "Min. Damage" and v447.active then
                    render.text(1, vector(v444.screen.x / 2 + 4, v444.screen.y / 2 - 15), color(), "", v447.value);
                    break;
                end;
            end;
            return;
        end;
    end, 
    init = function(v448)
        local function v449()
            -- upvalues: v448 (ref)
            v448:render();
        end;
        local function v451(v450)
            -- upvalues: v449 (ref)
            events.render(v449, v450:get());
        end;
        v448.other.elements.damage_indicator:set_callback(v451, true);
    end
}):struct("clientside_nickname")({
    native_BaseLocalClient_base = ffi.cast("uintptr_t**", utils.opcode_scan("engine.dll", "A1 ? ? ? ? 0F 28 C1 F3 0F 5C 80 ? ? ? ? F3 0F 11 45 ? A1 ? ? ? ? 56 85 C0 75 04 33 F6 EB 26 80 78 14 00 74 F6 8B 4D 08 33 D2 E8 ? ? ? ? 8B F0 85 F6", 1)), 
    player_info_t = ffi.typeof("            struct {\n                int64_t         unknown;\n                int64_t         steamID64;\n                char            szName[128];\n                int             userId;\n                char            szSteamID[20];\n                char            pad_0x00A8[0x10];\n                unsigned long   iSteamID;\n                char            szFriendsName[128];\n                bool            fakeplayer;\n                bool            ishltv;\n                unsigned int    customfiles[4];\n                unsigned char   filesdownloaded;\n            }\n        "), 
    run = function(v452)
        v452.native_GetStringUserData = utils.get_vfunc(11, ffi.typeof("$*(__thiscall*)(void*, int, int*)", v452.player_info_t));
        v452.apply = function(v453)
            -- upvalues: v452 (ref)
            local v454 = entity.get_local_player();
            if not v454 or not v454:is_alive() then
                return;
            else
                v452.native_BaseLocalClient = v452.native_BaseLocalClient_base[0][0];
                if not v452.native_BaseLocalClient then
                    return;
                else
                    v452.native_UserInfoTable = ffi.cast("void***", v452.native_BaseLocalClient + 21184)[0];
                    if not v452.native_UserInfoTable then
                        return;
                    else
                        v452.data = v452.native_GetStringUserData(v452.native_UserInfoTable, v454:get_index() - 1, nil);
                        if not v452.data then
                            return;
                        else
                            v452.this_name = ffi.string(v452.data[0].szName);
                            if v453 ~= v452.this_name and v452.previous_name == nil then
                                v452.previous_name = v452.this_name;
                            end;
                            ffi.copy(v452.data[0].szName, v453, #v453 + 1);
                            return;
                        end;
                    end;
                end;
            end;
        end;
        v452.was_applied = false;
        v452.callback = function()
            -- upvalues: v452 (ref)
            v452.chosen_nick = v452.other.elements.clientside_nickname.input:get():sub(1, 32);
            if #v452.chosen_nick == 0 then
                if v452.was_applied then
                    v452.was_applied = false;
                    v452.apply_nickname(v452.previous_name or panorama.MyPersonaAPI.GetName());
                    previous_name = nil;
                end;
                return;
            else
                v452.was_applied = true;
                v452.apply(v452.chosen_nick);
                return;
            end;
        end;
        local function v455()
            -- upvalues: v452 (ref)
            v452.apply(panorama.MyPersonaAPI.GetName());
        end;
        v452.other.elements.clientside_nickname:set_callback(function(v456)
            -- upvalues: v452 (ref), v455 (ref)
            if v456:get() then
                events.net_update_start:set(v452.callback);
                events.net_update_end:set(v452.callback);
                events.shutdown:set(v455);
            else
                events.net_update_start:unset(v452.callback);
                events.net_update_end:unset(v452.callback);
                events.shutdown:unset(v455);
                v452.apply(panorama.MyPersonaAPI.GetName());
            end;
        end);
    end
}):struct("cvars")({
    maxunlag = cvar.sv_maxunlag, 
    teammates_enemies = cvar.mp_teammates_are_enemies, 
    foot_shadows = cvar.cl_foot_contact_shadows, 
    use_buy = cvar.cl_use_opens_buy_menu, 
    legacy_desync = cvar.sv_legacy_desync, 
    clear = cvar.clear, 
    skybox_ref = l_pui_0.find("Visuals", "World", "Ambient", "Skybox Changer"), 
    skybox_name = cvar.sv_skyname, 
    ragdoll_physics = cvar.cl_ragdoll_physics_enable, 
    dt_ref = l_pui_0.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    autopeek_ref = l_pui_0.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    force_teammate_aimbot = function(v457)
        local function v458()
            -- upvalues: v457 (ref)
            v457.teammates_enemies:int(0);
        end;
        local function v460(v459)
            -- upvalues: v457 (ref), v458 (ref)
            v457.teammates_enemies:int(v459:get() and 1 or 0);
            events.shutdown(v458, v459:get());
        end;
        v457.other.elements.force_teamaimbot:set_callback(v460, true);
    end, 
    unlock_fake_latency = function(v461)
        local function v462()
            -- upvalues: v461 (ref)
            v461.maxunlag:float(0.2);
        end;
        local function v464(v463)
            -- upvalues: v461 (ref), v462 (ref)
            v461.maxunlag:float(v463:get() and 0.4 or 0.2);
            events.shutdown(v462, v463:get());
        end;
        v461.other.elements.unlock_fakelatency:set_callback(v464, true);
    end, 
    no_sleeves = function(_, v466)
        if entity.get_local_player() ~= nil then
            return not v466.name:match("sleeve");
        else
            return true;
        end;
    end, 
    addons = function(v467)
        local function v468()
            -- upvalues: v467 (ref)
            v467.maxunlag:float(0.2);
            v467.teammates_enemies:int(0);
            v467.legacy_desync:int(0);
            v467.foot_shadows:int(1);
            v467.use_buy:int(1);
            v467.ragdoll_physics:int(1);
        end;
        v467.no_sleeves_callback = function(v469)
            -- upvalues: v467 (ref)
            return v467:no_sleeves(v469);
        end;
        v467.clear_on_round_start = function()
            -- upvalues: v467 (ref)
            v467.clear:call();
        end;
        v467.level_init = function()
            -- upvalues: v467 (ref)
            return v467:on_level_init();
        end;
        local function v471(v470)
            -- upvalues: v468 (ref), v467 (ref)
            events.shutdown:set(v468);
            v467.foot_shadows:int(v470:get(1) and 0 or 1);
            v467.use_buy:int(v470:get(2) and 0 or 1);
            if v470:get(3) then
                events.draw_model:set(v467.no_sleeves_callback);
            else
                events.draw_model:unset(v467.no_sleeves_callback);
            end;
            if v470:get(4) then
                events.round_start:set(v467.clear_on_round_start);
            else
                events.round_start:unset(v467.clear_on_round_start);
            end;
            v467.skybox_ref:disabled(v470:get(5));
            v467.skybox_ref:override(v470:get(5) and "Off" or nil);
            events.level_init(v467.level_init, v470:get(5) and true or false);
            v467.ragdoll_physics:int(v470:get(6) and 0 or 1);
        end;
        v467.other.elements.addons:set_callback(v471, true);
    end, 
    on_level_init = function(v472)
        local v473 = ({
            Italy = "italy", 
            Vertigo = "office", 
            Assault = "sky_cs15_daylight04_hdr", 
            Canals = "sky_venice", 
            Tibet = "cs_tibet", 
            Baggage = "cs_baggage_skybox_", 
            ["Daylight (2)"] = "vertigoblue_hdr", 
            Daylight = "sky_cs15_daylight01_hdr", 
            ["Clouds (Dark)"] = "sky_csgo_cloudy01", 
            ["Clouds (2)"] = "vertigo", 
            Clouds = "sky_cs15_daylight02_hdr", 
            ["Night (Flat)"] = "sky_csgo_night_flat", 
            ["Night (2)"] = "sky_csgo_night02b", 
            Night = "sky_csgo_night02", 
            Dusty = "sky_dust", 
            Rainy = "vietnam", 
            Cobblestone = "sky_cs15_daylight03_hdr", 
            Clear = "nukeblank", 
            Gray = "sky_day02_05_hdr", 
            Monastery = "embassy", 
            Aztec = "jungle"
        })[v472.other.elements.skybox:get()];
        v472.skybox_name:string(v473);
    end, 
    skybox = function(v474)
        local function v477(v475)
            -- upvalues: v474 (ref)
            local v476 = ({
                Italy = "italy", 
                Vertigo = "office", 
                Assault = "sky_cs15_daylight04_hdr", 
                Canals = "sky_venice", 
                Tibet = "cs_tibet", 
                Baggage = "cs_baggage_skybox_", 
                ["Daylight (2)"] = "vertigoblue_hdr", 
                Daylight = "sky_cs15_daylight01_hdr", 
                ["Clouds (Dark)"] = "sky_csgo_cloudy01", 
                ["Clouds (2)"] = "vertigo", 
                Clouds = "sky_cs15_daylight02_hdr", 
                ["Night (Flat)"] = "sky_csgo_night_flat", 
                ["Night (2)"] = "sky_csgo_night02b", 
                Night = "sky_csgo_night02", 
                Dusty = "sky_dust", 
                Rainy = "vietnam", 
                Cobblestone = "sky_cs15_daylight03_hdr", 
                Clear = "nukeblank", 
                Gray = "sky_day02_05_hdr", 
                Monastery = "embassy", 
                Aztec = "jungle"
            })[v475:get()];
            v474.skybox_name:string(v476);
        end;
        v474.other.elements.skybox:set_callback(v477, true);
    end, 
    run_callbacks = function(v478)
        v478:force_teammate_aimbot();
        v478:unlock_fake_latency();
        v478:addons();
        v478:skybox();
    end
}):struct("viewmodel")({
    lerp_speed = 0.05, 
    current_z = 68, 
    current_y = 68, 
    current_x = 68, 
    current_fov = 68, 
    target_z = 0, 
    target_y = 0, 
    target_x = 0, 
    target_fov = 68, 
    cvar_fov = cvar.viewmodel_fov, 
    cvar_axis_x = cvar.viewmodel_offset_x, 
    cvar_axis_y = cvar.viewmodel_offset_y, 
    cvar_axis_z = cvar.viewmodel_offset_z, 
    raw_hand = cvar.cl_righthand:int(), 
    lerp = function(_, v480, v481, v482)
        return v480 + (v481 - v480) * v482;
    end, 
    update = function(v483)
        local v484 = entity.get_local_player();
        if not v484 or not v484:is_alive() then
            return;
        else
            v483.target_fov = v483.other.elements.viewmodel.fov:get();
            v483.target_x = v483.other.elements.viewmodel.axis_x:get() / 10;
            v483.target_y = v483.other.elements.viewmodel.axis_y:get() / 10;
            v483.target_z = v483.other.elements.viewmodel.axis_z:get() / 10;
            return;
        end;
    end, 
    apply_value = function(v485)
        local v486 = entity.get_local_player();
        if not v486 or not v486:is_alive() then
            return;
        else
            v485.current_fov = v485:lerp(v485.current_fov, v485.target_fov, v485.lerp_speed);
            v485.current_x = v485:lerp(v485.current_x, v485.target_x, v485.lerp_speed);
            v485.current_y = v485:lerp(v485.current_y, v485.target_y, v485.lerp_speed);
            v485.current_z = v485:lerp(v485.current_z, v485.target_z, v485.lerp_speed);
            v485.cvar_fov:float(v485.current_fov, true);
            v485.cvar_axis_x:float(v485.current_x, true);
            v485.cvar_axis_y:float(v485.current_y, true);
            v485.cvar_axis_z:float(v485.current_z, true);
            return;
        end;
    end, 
    apply_hand = function(v487)
        local v488 = entity.get_local_player();
        if not v488 or not v488:get_player_weapon() then
            return;
        else
            local v489 = v487.other.elements.viewmodel.main_hand:get();
            local v490 = v488:get_player_weapon():get_classname() == "CKnife";
            local l_cl_righthand_0 = cvar.cl_righthand;
            local l_l_cl_righthand_0_0 = l_cl_righthand_0;
            l_cl_righthand_0 = l_cl_righthand_0.int;
            local v493;
            if v490 then
                v493 = v489 == "Right" and v487.other.elements.viewmodel.left_hand:get() and 0 or v489 == "Left" and v487.other.elements.viewmodel.right_hand:get() and 1 or v489 == "Right" and 1 or 0;
            else
                v493 = v489 == "Right" and 1 or 0;
            end;
            l_cl_righthand_0(l_l_cl_righthand_0_0, v493);
            return;
        end;
    end, 
    init = function(v494)
        local function v495()
            -- upvalues: v494 (ref)
            v494:update();
            v494:apply_value();
            v494:apply_hand();
        end;
        events.pre_render(v495);
    end
}):struct("aspectratio")({
    current_value = 100, 
    cvar_aspectratio = cvar.r_aspectratio, 
    apply_value = function(v496, v497)
        v496.current_value = v497;
        v496.cvar_aspectratio:float(v497 / 100);
    end, 
    init = function(v498)
        local function v500(v499)
            -- upvalues: v498 (ref)
            v498:apply_value(v499:get());
        end;
        v498.other.elements.aspectratio.scale:set_callback(v500, true);
        local function v502(v501)
            -- upvalues: v498 (ref)
            if v498.other.elements.aspectratio.scale:get() / 100 ~= v501:float() then
                v498:apply_value(v498.other.elements.aspectratio.scale:get());
            end;
        end;
        v498.cvar_aspectratio:set_callback(v502);
        local function v503()
            -- upvalues: v498 (ref), v502 (ref)
            v498.cvar_aspectratio:unset_callback(v502);
            v498.cvar_aspectratio:float(0);
        end;
        events.shutdown(v503);
    end
}):struct("antiaim_data")({
    last_flick_at_lim = 0, 
    flicker_lim = false, 
    packets_lim = 0, 
    last_flick_at = 0, 
    flicker = false, 
    packets = 0, 
    freestanding_ref = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    freestanding_fs_ref = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
    update = function(v504)
        local v505 = entity.get_local_player();
        if not v505 or not v505:is_alive() then
            return;
        else
            local l_antiaim_0 = v504.references.antiaim;
            local l_angles_0 = l_antiaim_0.angles;
            local l_extract_yaw_0 = l_angles_0.extract_yaw;
            local _ = l_angles_0.extract_desync;
            local _ = l_angles_0.extract_modifier;
            l_antiaim_0.enabled:override(true);
            l_extract_yaw_0.roll:override(false);
            l_extract_yaw_0.yaw:override("Backward");
            l_angles_0.pitch:override("Down");
            l_extract_yaw_0.base:override("At Target");
            l_extract_yaw_0.snap:override(false);
            local v511, v512 = v504.localplayer:state(cmd);
            local v513 = v504.localplayer:disabler_state(cmd);
            local v514 = v504.antiaim.data[v511] and v504.antiaim.data[v511][v512];
            local _ = v504.localplayer:side();
            local v516 = nil;
            local v517 = math.random(1, v514.yaw_options_ex.delay_sliders:get());
            if v514.yaw_options_ex.delay:get() then
                v504.delay_method = v514["delay_" .. v517]:get();
            else
                v504.delay_method = 1;
            end;
            if globals.choked_commands == 0 then
                v504.packets = v504.packets + 1;
                if v504.packets - v504.last_flick_at >= v504.delay_method then
                    v504.flicker = not v504.flicker;
                    v504.last_flick_at = v504.packets;
                end;
            end;
            if v514.yaw_mode:get() == 2 then
                if v514.yaw_options_ex.delay:get() then
                    rage.antiaim:inverter(v504.flicker);
                    v516 = v504.flicker and v514.yaw_options_ex.offset_left:get() or v514.yaw_options_ex.offset_right:get();
                else
                    rage.antiaim:inverter(v504.flicker);
                    v516 = v504.flicker and v514.yaw_options_ex.offset_left:get() or v514.yaw_options_ex.offset_right:get();
                end;
            else
                v516 = v514.yaw_offset:get();
            end;
            local l_modifier_options_0 = v514.modifier_options;
            local v519 = l_modifier_options_0.randomize:get();
            v504.references.antiaim.angles.extract_modifier.mode:override(v514.modifier:get());
            local v520 = v514.modifier_offset:get();
            if v519 then
                local v521 = l_modifier_options_0.sliders:get();
                v520 = v514["modifier_" .. math.random(v521)]:get();
            end;
            v504.references.antiaim.angles.extract_modifier.offset:override(v520);
            local v522 = v514.body:get();
            local l_body_options_0 = v514.body_options;
            local l_extract_desync_1 = v504.references.antiaim.angles.extract_desync;
            local v525 = l_body_options_0.limit_type:get();
            l_extract_desync_1.inverter:override(v522 and l_body_options_0.inverter:get() or false);
            l_extract_desync_1.tweaks:override(v522 and l_body_options_0.jitter:get() and "Jitter" or "");
            local v526 = false;
            local v527 = "Off";
            if v522 then
                local v528 = l_body_options_0.type:get();
                local v529 = l_body_options_0.type_ticks_value:get();
                local v530 = l_body_options_0.type_random_value:get();
                v526 = v528 == "Static" and v514.body:get() or v528 == "Ticks" and not (globals.tickcount % v529 <= 1) or utils.random_int(0, v530) == v530;
                v527 = ({
                    Default = "Peek Fake", 
                    Reversed = "Peek Real", 
                    Disabled = "Off"
                })[l_body_options_0.freestanding:get()];
                local v531 = l_body_options_0.limit_min:get();
                local v532 = l_body_options_0.limit_max:get();
                local v533 = l_body_options_0.left_limit:get();
                local v534 = l_body_options_0.right_limit:get();
                if v525 == "Ticks" and globals.choked_commands == 0 then
                    v504.packets_lim = v504.packets_lim + 1;
                    v504.delay_method_lim = l_body_options_0.limit_timing:get();
                    if v504.packets_lim - v504.last_flick_at_lim >= v504.delay_method_lim then
                        v504.flicker_lim = not v504.flicker_lim;
                        v504.last_flick_at_lim = v504.packets_lim;
                    end;
                end;
                l_extract_desync_1.left_limit:override(v525 == "Static" and v533 or v525 == "Random" and math.random(v531, v532) or v504.flicker_lim and l_body_options_0.limit_tick_l:get() or l_body_options_0.limit_tick_r:get());
                l_extract_desync_1.right_limit:override(v525 == "Static" and v534 or v525 == "Random" and math.random(v531, v532) or v504.flicker_lim and l_body_options_0.limit_tick_l:get() or l_body_options_0.limit_tick_r:get());
            end;
            l_extract_desync_1.switch:override(v526);
            l_extract_desync_1.freestanding:override(v527);
            local v535 = v504.antiaim.elements.freestanding:get();
            local v536 = v504.antiaim.elements.disablers:get(v513);
            if v535 and not v536 then
                v504.freestanding_fs_ref:set(v504.antiaim.elements.body_fs:get());
                v504.freestanding_ref:set(true);
            else
                v504.freestanding_ref:set(false);
            end;
            local v537 = v504.antiaim.elements.manual_yaw:get();
            if v537 ~= "Off" then
                local v538 = {
                    Forward = 180, 
                    Right = 90, 
                    Left = -90
                };
                if v538[v537] then
                    v516 = v538[v537];
                    l_extract_yaw_0.base:override("Local View");
                    v504.freestanding_ref:override(false);
                end;
            end;
            v504.references.antiaim.angles.extract_yaw.offset:override(v516);
            return;
        end;
    end, 
    init = function(v539)
        local function v540()
            -- upvalues: v539 (ref)
            v539:update(cmd);
        end;
        events.createmove(v540);
    end
}):struct("fake_lag")({
    choked_ticks = -1, 
    fake_lag_ticks = 16, 
    fake_lag_ref = l_pui_0.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
    hs_ref = l_pui_0.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    dt_ref = l_pui_0.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    fd_ref = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    run = function(v541, v542)
        local v543 = entity.get_local_player();
        if not v543 or not v543:is_alive() then
            return;
        else
            local v544 = v543:get_player_weapon();
            if not v544 or v544 == nil then
                return;
            else
                local v545 = v544:get_classname() == "CDEagle";
                local v546 = entity.get_game_rules().m_bFreezePeriod == true;
                if v543.m_iShotsFired > 0 or v541.dt_ref:get() or v541.hs_ref:get() or v541.fd_ref:get() or v546 then
                    v541.fake_lag_ref:override();
                    return;
                else
                    if v541.antiaim.elements.options_table.fake_lag_type:get() == "Always on" then
                        if v541.choked_ticks < v541.fake_lag_ticks then
                            v542.send_packet = false;
                        else
                            v542.send_packet = true;
                            v541.choked_ticks = -1;
                        end;
                        v541.choked_ticks = v541.choked_ticks + 1;
                        v541.fake_lag_ref:override(false);
                    elseif v545 then
                        if v541.choked_ticks < v541.fake_lag_ticks then
                            v542.send_packet = false;
                        else
                            v542.send_packet = true;
                            v541.choked_ticks = -1;
                        end;
                        v541.choked_ticks = v541.choked_ticks + 1;
                        v541.fake_lag_ref:override(false);
                    else
                        v541.fake_lag_ref:override(true);
                    end;
                    return;
                end;
            end;
        end;
    end, 
    init = function(v547)
        local function v549(v548)
            -- upvalues: v547 (ref)
            v547:run(v548);
        end;
        local function v553(v550)
            -- upvalues: v549 (ref), v547 (ref)
            events.createmove(v549, v550:get());
            local l_fake_lag_ref_0 = v547.fake_lag_ref;
            local l_l_fake_lag_ref_0_0 = l_fake_lag_ref_0;
            l_fake_lag_ref_0 = l_fake_lag_ref_0.override;
            if v550:get() then

            end;
            l_fake_lag_ref_0(l_l_fake_lag_ref_0_0, nil);
        end;
        v547.antiaim.elements.options_table.fake_lag:set_callback(v553, true);
    end
}):struct("watermark")({
    screen = render.screen_size(), 
    setup = function(v554)
        v554.position = vector(0, 0);
        v554.dragging = false;
        v554.drag_offset = vector(0, 0);
        v554.drag_start_time = globals.realtime;
    end, 
    calculate_pulse = function(_, v556, v557)
        return math.abs(math.sin(globals.realtime * v557 % math.pi + v556));
    end, 
    on_mouse_input = function(v558)
        return not v558.dragging;
    end, 
    update_watermark_position = function(v559, v560, v561, v562)
        local v563 = v559.screen.x / 2;
        local v564 = v559.screen.y / 2;
        local v565 = 10;
        local v566 = vector(v560.x - v559.drag_offset.x, v560.y - v559.drag_offset.y);
        if math.abs(v566.x - v563) < v565 then
            v566.x = v563;
        end;
        if math.abs(v566.y - v564) < v565 then
            v566.y = v564;
        end;
        v566.x = math.max(v561.x / 2, math.min(v562.x - v561.x / 2, v566.x));
        v566.y = math.max(v561.y / 2, math.min(v562.y - v561.y / 2, v566.y));
        v559.home.elements.watermark_options.pos_x:set(v566.x);
        v559.home.elements.watermark_options.pos_y:set(v566.y);
        v559.position = v566;
    end, 
    parse_watermark_text = function(_, v568)
        -- upvalues: l_pui_0 (ref)
        local v569 = {
            postfix = "", 
            postfix_icon = "", 
            prefix_icon = "", 
            text = "", 
            prefix = ""
        };
        local v570, v571 = v568:find("icon_pre=");
        if v570 then
            local v572 = math.min(v568:find("pre=", v571 + 1) or math.huge, v568:find("m=", v571 + 1) or math.huge, v568:find("post=", v571 + 1) or math.huge, v568:find("icon_post=", v571 + 1) or math.huge);
            if v572 ~= math.huge then
                v569.prefix_icon = l_pui_0.get_icon(v568:sub(v571 + 1, v572 - 1):gsub("%s+$", ""));
            else
                v569.prefix_icon = l_pui_0.get_icon(v568:sub(v571 + 1));
            end;
        end;
        local v573, v574 = v568:find("icon_post=");
        if v573 then
            local v575 = math.min(v568:find("pre=", v574 + 1) or math.huge, v568:find("m=", v574 + 1) or math.huge, v568:find("post=", v574 + 1) or math.huge, v568:find("icon_pre=", v574 + 1) or math.huge);
            if v575 ~= math.huge then
                v569.postfix_icon = l_pui_0.get_icon(v568:sub(v574 + 1, v575 - 1):gsub("%s+$", ""));
            else
                v569.postfix_icon = l_pui_0.get_icon(v568:sub(v574 + 1));
            end;
        end;
        local v576, v577 = v568:find("pre=");
        if v576 then
            local v578 = math.min(v568:find("m=", v577 + 1) or math.huge, v568:find("post=", v577 + 1) or math.huge, v568:find("icon_pre=", v577 + 1) or math.huge, v568:find("icon_post=", v577 + 1) or math.huge);
            if v578 ~= math.huge then
                v569.prefix = v568:sub(v577 + 1, v578 - 1):gsub("%s+$", "");
            else
                v569.prefix = v568:sub(v577 + 1);
            end;
        end;
        local v579, v580 = v568:find("m=");
        if v579 then
            local v581 = math.min(v568:find("pre=", v580 + 1) or math.huge, v568:find("post=", v580 + 1) or math.huge, v568:find("icon_pre=", v580 + 1) or math.huge, v568:find("icon_post=", v580 + 1) or math.huge);
            if v581 ~= math.huge then
                v569.text = v568:sub(v580 + 1, v581 - 1):gsub("%s+$", "");
            else
                v569.text = v568:sub(v580 + 1);
            end;
        end;
        local v582, v583 = v568:find("post=");
        if v582 then
            local v584 = math.min(v568:find("pre=", v583 + 1) or math.huge, v568:find("m=", v583 + 1) or math.huge, v568:find("icon_pre=", v583 + 1) or math.huge, v568:find("icon_post=", v583 + 1) or math.huge);
            if v584 ~= math.huge then
                v569.postfix = v568:sub(v583 + 1, v584 - 1):gsub("%s+$", "");
            else
                v569.postfix = v568:sub(v583 + 1);
            end;
        end;
        if not v576 and not v582 and not v579 and not v570 and not v573 then
            v569.text = v568;
        end;
        return v569;
    end, 
    split_utf8 = function(_, v586)
        local v587 = {};
        local v588 = 1;
        while v588 <= #v586 do
            local v589 = string.byte(v586, v588);
            local v590 = 1;
            if v589 >= 240 then
                v590 = 4;
            elseif v589 >= 224 then
                v590 = 3;
            elseif v589 >= 192 then
                v590 = 2;
            end;
            table.insert(v587, v586:sub(v588, v588 + v590 - 1));
            v588 = v588 + v590;
        end;
        return v587;
    end, 
    render_gradient_text_with_parts = function(v591, v592, v593, v594, v595, v596, v597, v598, v599, v600, v601, v602, v603, v604, v605)
        local v606 = {};
        if v597 ~= "" then
            table.insert(v606, string.format("\a%s%s ", v603:to_hex(), v597));
        end;
        if v594 ~= "" then
            table.insert(v606, string.format("\a%s%s", v603:to_hex(), v594));
        end;
        local v607 = v591:split_utf8(v595);
        local v608 = #v607;
        local _, _, v611 = color(255, 255, 255, 255):to_hsv();
        for v612 = 1, v608 do
            local v613 = v607[v612];
            local v614 = v591:calculate_pulse((v612 - 1) / v608 * 2, v599);
            local v615 = 0.5;
            local v616 = v600 == 1 and (v612 - 1) / v608 or v601 / 10;
            local v617 = v602 / 10;
            local v618 = color():as_hsv(v616, v617, v611 * (v615 + (1 - v615) * (1 - v614))):to_hex();
            table.insert(v606, string.format("\a%s%s", v618, v613));
        end;
        if v596 ~= "" then
            table.insert(v606, string.format("\a%s%s", v604:to_hex(), v596));
        end;
        if v598 ~= "" then
            table.insert(v606, string.format(" \a%s%s", v604:to_hex(), v598));
        end;
        local v619 = table.concat(v606);
        render.text(v592, v593, color(), v605, v619);
    end, 
    render_colored_text = function(_, v621, v622, v623, v624, v625, v626, v627, v628, v629, v630, v631)
        local v632 = {};
        if v626 ~= "" then
            table.insert(v632, string.format("\a%s%s ", v628:to_hex(), v626));
        end;
        if v623 ~= "" then
            table.insert(v632, string.format("\a%s%s", v628:to_hex(), v623));
        end;
        table.insert(v632, string.format("\a%s%s", v629:to_hex(), v624));
        if v625 ~= "" then
            table.insert(v632, string.format("\a%s%s", v630:to_hex(), v625));
        end;
        if v627 ~= "" then
            table.insert(v632, string.format(" \a%s%s", v630:to_hex(), v627));
        end;
        local v633 = table.concat(v632);
        render.text(v621, v622, v629, v631, v633);
    end, 
    is_point_in_rect = function(_, v635, v636)
        return v635.x >= v636.x1 and v635.x <= v636.x2 and v635.y >= v636.y1 and v635.y <= v636.y2;
    end, 
    render_center_lines = function(_, v638, v639, v640)
        local v641 = v638.x / 2;
        local v642 = v638.y / 2;
        local v643 = math.abs(v639.x - v641);
        local v644 = math.abs(v639.y - v642);
        local v645 = 100;
        local v646 = math.max(0, 255 - v643 / v645 * 255);
        local v647 = math.max(0, 255 - v644 / v645 * 255);
        local v648 = color(255, 255, 255, v646);
        local v649 = color(255, 255, 255, v647);
        if v644 < v645 then
            render.line(vector(v639.x - v640.x / 2, v642), vector(v639.x + v640.x / 2, v642), v649);
        end;
        if v643 < v645 then
            render.line(vector(v641, v639.y - v640.y / 2), vector(v641, v639.y + v640.y / 2), v648);
        end;
    end, 
    render = function(v650)
        -- upvalues: l_pui_0 (ref)
        if not globals.is_in_game then
            return;
        else
            local v651 = v650:parse_watermark_text((v650.home.elements.watermark_options.label:get()));
            local l_prefix_0 = v651.prefix;
            local l_text_0 = v651.text;
            local l_postfix_0 = v651.postfix;
            local l_prefix_icon_0 = v651.prefix_icon;
            local l_postfix_icon_0 = v651.postfix_icon;
            local v657 = ({
                Default = 1, 
                Bold = 4, 
                Console = 3, 
                Pixel = 2
            })[v650.home.elements.watermark_options.font:get()] or "Custom";
            local v658 = "c";
            local v659 = v650.home.elements.watermark_options.main_accent:get();
            local v660 = v650.home.elements.watermark_options.prefix_accent:get();
            local v661 = v650.home.elements.watermark_options.postfix_accent:get();
            if v657 == 2 then
                l_text_0 = l_text_0:upper();
                if l_prefix_0 ~= "" then
                    l_prefix_0 = l_prefix_0:upper();
                end;
                if l_postfix_0 ~= "" then
                    l_postfix_0 = l_postfix_0:upper();
                end;
            end;
            v650.position = vector(v650.home.elements.watermark_options.pos_x:get(), v650.home.elements.watermark_options.pos_y:get());
            local v662 = l_prefix_icon_0 ~= "" and l_prefix_icon_0 .. " " or "";
            local v663;
            if l_prefix_0 == "" or not l_prefix_0 then
                v663 = "";
            else
                v663 = l_prefix_0;
            end;
            local l_l_text_0_0 = l_text_0;
            local v665;
            if l_postfix_0 == "" or not l_postfix_0 then
                v665 = "";
            else
                v665 = l_postfix_0;
            end;
            v662 = v662 .. v663 .. l_l_text_0_0 .. v665 .. (l_postfix_icon_0 ~= "" and " " .. l_postfix_icon_0 or "");
            v663 = l_pui_0.get_mouse_position();
            l_l_text_0_0 = render.measure_text(v657, v658, v662);
            local v666 = v650:is_point_in_rect(v663, {
                x1 = v650.position.x - l_l_text_0_0.x / 2, 
                y1 = v650.position.y - l_l_text_0_0.y / 2, 
                x2 = v650.position.x + l_l_text_0_0.x / 2, 
                y2 = v650.position.y + l_l_text_0_0.y / 2
            });
            local v667 = l_pui_0.get_alpha() > 0;
            if common.is_button_down(1) then
                if v666 and not v650.dragging and v667 then
                    v650.dragging = true;
                    v650.drag_offset = vector(v663.x - v650.position.x, v663.y - v650.position.y);
                end;
            elseif v650.dragging and common.is_button_released(1) then
                v650.dragging = false;
            end;
            if v650.dragging and v667 then
                v650:render_center_lines(v650.screen, v650.position, l_l_text_0_0);
                v650:update_watermark_position(v663, l_l_text_0_0, v650.screen);
            end;
            if v650.home.elements.watermark_options.gradient_switch:get() then
                v650:render_gradient_text_with_parts(v657, v650.position, l_prefix_0, l_text_0, l_postfix_0, l_prefix_icon_0, l_postfix_icon_0, v650.home.elements.watermark_options.gradient_speed:get(), v650.home.elements.watermark_options.gradient_rainbow:get() == true and 1 or 0, v650.home.elements.watermark_options.gradient_hue:get(), v650.home.elements.watermark_options.gradient_saturation:get(), v660, v661, v658);
            else
                v650:render_colored_text(v657, v650.position, l_prefix_0, l_text_0, l_postfix_0, l_prefix_icon_0, l_postfix_icon_0, v660, v659, v661, v658);
            end;
            return;
        end;
    end, 
    init = function(v668)
        v668:setup();
        local function v669()
            -- upvalues: v668 (ref)
            v668:render();
        end;
        local function v671(v670)
            -- upvalues: v669 (ref)
            if v670:get() ~= "" then
                events.render:set(v669);
            else
                events.render:unset(v669);
            end;
        end;
        v668.home.elements.watermark_options.label:set_callback(v671, true);
    end
}):struct("sidebar")({
    setup = function(v672)
        v672.script_name = "Nyanza Beta";
        v672.script_icon = "paw";
        v672.text_length = #v672.script_name;
        v672.start_time = globals.realtime;
        v672.icon_fade_duration = 1;
        v672.wave_delay = 0.3;
        v672.wave_duration = 1.5;
        v672.char_spawn_duration = 0.1;
        v672.gradient_fade_duration = 1.5;
    end, 
    pulse = function(_, v674, v675)
        return math.abs(math.sin(globals.realtime * (v675 or 1) + (v674 or 0)));
    end, 
    render = function(v676)
        -- upvalues: l_pui_0 (ref)
        if l_pui_0.get_alpha() == 0 then
            return;
        else
            local _ = math.sin(globals.curtime) * 25;
            local v678 = math.sin(globals.curtime) * 100;
            v676.home.elements.progress_version_bar:set(v678);
            local v679 = globals.realtime - v676.start_time;
            local v680, v681, v682 = l_pui_0.get_style("Link Active"):to_hsv();
            local v683 = l_pui_0.get_style("Active Text");
            local v684 = v679 < v676.icon_fade_duration;
            local v685 = v676.icon_fade_duration <= v679 and v679 < v676.icon_fade_duration + v676.wave_delay;
            local v686 = v676.icon_fade_duration + v676.wave_delay <= v679 and v679 < v676.icon_fade_duration + v676.wave_delay + v676.wave_duration;
            local v687 = v676.icon_fade_duration + v676.wave_delay + v676.wave_duration <= v679 and v679 < v676.icon_fade_duration + v676.wave_delay + v676.wave_duration + v676.gradient_fade_duration;
            local v688 = v676.icon_fade_duration + v676.wave_delay + v676.wave_duration + v676.gradient_fade_duration <= v679;
            local v689 = v684 and v679 / v676.icon_fade_duration or 1;
            local v690 = v686 and (v679 - v676.icon_fade_duration - v676.wave_delay) / v676.wave_duration or 0;
            local v691 = v687 and (v679 - v676.icon_fade_duration - v676.wave_delay - v676.wave_duration) / v676.gradient_fade_duration or v688 and 1 or 0;
            local v692 = "";
            local v693 = {};
            for v694 = 1, v676.text_length do
                local v695 = v694 / v676.text_length;
                local _ = (v694 - 1) * v676.char_spawn_duration;
                if v686 then
                    v693[v694] = v695 - 0.05 <= v690 and v690 <= v695 + 0.05;
                else
                    v693[v694] = true;
                end;
            end;
            for v697 = 1, v676.text_length do
                local v698 = v676.script_name:sub(v697, v697);
                local _ = v697 / v676.text_length;
                local v700 = 0;
                if v686 then
                    local v701 = (v697 - 1) * v676.char_spawn_duration / v676.wave_duration;
                    local v702 = v701 + v676.char_spawn_duration * 2 / v676.wave_duration;
                    if v701 <= v690 and v690 <= v702 then
                        v700 = (v690 - v701) / (v702 - v701);
                    elseif v702 < v690 then
                        v700 = 1;
                    end;
                elseif v687 or v688 then
                    v700 = 1;
                end;
                local l_v683_0 = v683;
                if (v687 or v688) and v700 > 0 then
                    local v704 = 0.5 + 0.5 * v676:pulse((v697 - 1) / v676.text_length * 2, 2);
                    local v705 = color():as_hsv(v680, v681, v682 * v704);
                    local v706, v707, v708 = v683:unpack();
                    local v709, v710, v711 = v705:unpack();
                    l_v683_0 = color(v706 + (v709 - v706) * v691, v707 + (v710 - v707) * v691, v708 + (v711 - v708) * v691);
                end;
                l_v683_0 = color(l_v683_0.r, l_v683_0.g, l_v683_0.b, l_v683_0.a * v700);
                v692 = v692 .. string.format("\a%s%s", l_v683_0:to_hex(), v698);
            end;
            local v712 = v683:clone();
            if v684 then
                v712 = color(v712.r, v712.g, v712.b, v712.a * v689);
            elseif v685 then
                v712 = v683;
            elseif v686 or v687 or v688 then
                local v713 = color():as_hsv(v680, v681, v682 * 0.8);
                local v714, v715, v716 = v683:unpack();
                local v717, v718, v719 = v713:unpack();
                v712 = color(v714 + (v717 - v714) * v691, v715 + (v718 - v715) * v691, v716 + (v719 - v716) * v691);
            end;
            l_pui_0.sidebar(v692, string.format("\a%s%s", v712.to_hex(v712), l_pui_0.get_icon(v676.script_icon)));
            return;
        end;
    end, 
    init = function(v720)
        v720:setup();
        local function v721()
            -- upvalues: v720 (ref)
            v720:render();
        end;
        events.render(v721);
    end
});
v722.home:init();
v722.antiaim:init();
v722.other:init();
v722.watermark:init();
v722.sidebar:init();
v722.localplayer:init();
v722.antiaim_data:init();
v722.force_break_lc:init();
v722.player_animations:update();
v722.fake_lag:init();
v722.tweaks:init();
v722.safe_head:init();
v722.avoid_backstab:invoke();
v722.presets:init();
v722.log_events:init();
v722.fast_ladder:init();
v722.no_fall_damage:init();
v722.freezetime_fakeduck:init();
v722.fakeduck_speed:init();
v722.hitmarkers:init();
v722.csco_roll:init();
v722.manual_arrows:init();
v722.keep_transparency:invoke();
v722.scope_overlay:init();
v722.damage_indicator:init();
v722.cvars:run_callbacks();
v722.viewmodel:init();
v722.aspectratio:init();
v722.clantag:run();
v722.clientside_nickname:run();