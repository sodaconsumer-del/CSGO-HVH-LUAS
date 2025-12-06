_DEBUG = true;
local _ = require("neverlose/inspect");
local l_smoothy_0 = require("neverlose/smoothy");
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local l_lambotruck_0 = require("neverlose/lambotruck");
local v5 = assert(require("neverlose/pui"), "Error with PUI");
local v6 = assert(require("neverlose/shoutout_salvatore"), "Error with [2] Library");
local v297 = new_class():struct("data")({
    player_team = {
        [1] = "terrorist", 
        [2] = "counter-terrorist"
    }, 
    states = {
        [1] = "standing", 
        [2] = "running", 
        [3] = "walking", 
        [4] = "crouching", 
        [5] = "crouch moving", 
        [6] = "jumping", 
        [7] = "crouch jumping"
    }, 
    menu = {}
}):struct("ref")({
    antiaim = {
        enable = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
        pitch = ui.find("Aimbot", "Anti aim", "Angles", "Pitch"), 
        yaw = ui.find("Aimbot", "Anti aim", "Angles", "Yaw"), 
        hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
        yawoffset = ui.find("Aimbot", "Anti aim", "Angles", "Yaw", "Offset"), 
        yawmodifier = ui.find("Aimbot", "Anti aim", "Angles", "Yaw Modifier"), 
        yawmodifieramount = ui.find("Aimbot", "Anti aim", "Angles", "Yaw Modifier", "Offset"), 
        bodyyawopt = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
        leftfake = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
        rightfake = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
        slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
        bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
        legmovement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
        freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
        freestanding_static = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
        yawtarget = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
        inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
        fbyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
        legs = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
        antibackstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab")
    }, 
    rage = {
        dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
        hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
        hs2 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
        fb = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
        dmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
        fakelag = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
        fakelag_enabled = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
        dtlag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
        fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
        ping = ui.find("Miscellaneous", "Main", "Other", "Fake Latency")
    }, 
    visuals = {
        scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
        force_thirdperson = ui.find("Visuals", "World", "Main", "Force Thirdperson")
    }
}):struct("colors")({
    accent = v5.accent, 
    gradient = "\b" .. v5.accent:to_hex() .. "\bFFFFFFFF"
}):struct("menu")({
    render = function(v7)
        -- upvalues: v5 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
        local v8 = "\f<house>";
        local v9 = "\f<gear>";
        local v10 = "\f<face-smile>";
        local v11 = {
            user = v5.label({
                [1] = nil, 
                [2] = "user", 
                [3] = 1, 
                [1] = v8
            }, v7.colors.gradient .. "[user : " .. common.get_username():lower() .. "]"), 
            build = v5.label({
                [1] = nil, 
                [2] = "user", 
                [3] = 1, 
                [1] = v8
            }, v7.colors.gradient .. "[build : dev ]"), 
            update = v5.label({
                [1] = nil, 
                [2] = "user", 
                [3] = 1, 
                [1] = v8
            }, v7.colors.gradient .. "[update : date]"), 
            youtube = v5.button({
                [1] = nil, 
                [2] = "info", 
                [3] = 1, 
                [1] = v8
            }, "\v\f<youtube>  " .. v7.colors.gradient .. "[youtube]", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("");
            end, true), 
            config = v5.button({
                [1] = nil, 
                [2] = "info", 
                [3] = 1, 
                [1] = v8
            }, "\v\f<file>  " .. v7.colors.gradient .. "[config]", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("");
            end, true), 
            discord = v5.button({
                [1] = nil, 
                [2] = "info", 
                [3] = 1, 
                [1] = v8
            }, "\v\f<discord>  " .. v7.colors.gradient .. "[discord]", function()
                panorama.SteamOverlayAPI.OpenExternalBrowserURL("");
            end, true), 
            select_team = v5.combo({
                [1] = nil, 
                [2] = "builder ", 
                [3] = 1, 
                [1] = v9
            }, v7.colors.gradient .. "[team]", v7.data.player_team), 
            select_state = v5.combo({
                [1] = nil, 
                [2] = "builder ", 
                [3] = 1, 
                [1] = v9
            }, v7.colors.gradient .. "[state]", v7.data.states)
        };
        v7.data.menu.label = v5.label({
            [1] = nil, 
            [2] = "builder ", 
            [3] = 1, 
            [1] = v9
        }, "                                      ");
        v7.data.menu.manual = v5.combo({
            [1] = nil, 
            [2] = "builder ", 
            [3] = 1, 
            [1] = v9
        }, v7.colors.gradient .. "[manual]", {
            [1] = "backward", 
            [2] = "left", 
            [3] = "right", 
            [4] = "forward"
        });
        v7.data.freestanding = v5.switch({
            [1] = nil, 
            [2] = "builder ", 
            [3] = 1, 
            [1] = v9
        }, v7.colors.gradient .. "[freestanding]", false, function(v12)
            -- upvalues: v7 (ref)
            return {
                disablers = v12:selectable("disablers", v7.data.states)
            };
        end);
        v7.data.airlag = v5.switch({
            [1] = nil, 
            [2] = "builder ", 
            [3] = 1, 
            [1] = v9
        }, v7.colors.gradient .. "[airlag]", false, function(v13)
            return {
                key = v13:hotkey("double tap keybind")
            };
        end);
        v7.data.addons = v5.selectable({
            [1] = nil, 
            [2] = "builder ", 
            [3] = 1, 
            [1] = v9
        }, v7.colors.gradient .. "[addons]", {
            [1] = "warmup aa", 
            [2] = "round end aa", 
            [3] = "safe head"
        }, function(_)

        end);
        for _, v16 in pairs(v7.data.player_team) do
            v7.data.menu[v16] = {};
            do
                local l_v16_0 = v16;
                for _, v19 in pairs(v7.data.states) do
                    v7.data.menu[l_v16_0][v19] = {};
                    local v20 = v7.data.menu[l_v16_0][v19];
                    v20.yaw_base = v5.combo({
                        [1] = nil, 
                        [2] = "YAW", 
                        [3] = 2, 
                        [1] = v9
                    }, "\v\f<person-walking-arrow-loop-left>   " .. v7.colors.gradient .. "[yaw base]", {
                        [1] = "at target", 
                        [2] = "local view"
                    }, function(v21)
                        return {
                            randomizer = v21:slider("randomization", 0, 90, 0, 1, function(v22)
                                return v22 .. "%";
                            end)
                        };
                    end);
                    v20.yaw_left = v5.slider({
                        [1] = nil, 
                        [2] = "YAW", 
                        [3] = 2, 
                        [1] = v9
                    }, "          \v\f<chevron-left>   " .. v7.colors.gradient .. "[left]", -180, 180, 0, 1);
                    v20.yaw_right = v5.slider({
                        [1] = nil, 
                        [2] = "YAW", 
                        [3] = 2, 
                        [1] = v9
                    }, "          \v\f<chevron-right>   " .. v7.colors.gradient .. "[right]", -180, 180, 0, 1);
                    v20.jitter = v5.combo({
                        [1] = nil, 
                        [2] = "YAW", 
                        [3] = 2, 
                        [1] = v9
                    }, "\v\f<gears>   " .. v7.colors.gradient .. "[jitter]", {
                        [1] = "off", 
                        [2] = "offset", 
                        [3] = "center", 
                        [4] = "random", 
                        [5] = "spin", 
                        [6] = "sanya"
                    }, function(v23, _)
                        local v25 = {
                            jitter_value = v23:slider("offset", -90, 90, 0, 1), 
                            delay_options = v23:combo("delay options", {
                                [1] = "normal", 
                                [2] = "cheat based", 
                                [3] = "algorithm"
                            })
                        };
                        v25.delay_type = v23:combo("delay type", {
                            [1] = "random", 
                            [2] = "fixed"
                        }):depend({
                            [1] = nil, 
                            [2] = "normal", 
                            [3] = "cheat based", 
                            [1] = v25.delay_options
                        });
                        v25.normal_min = v23:slider("min ticks\nnormal", 1, 24, 4, 1);
                        v25.normal_min:depend({
                            [1] = nil, 
                            [2] = "normal", 
                            [1] = v25.delay_options
                        });
                        v25.normal_min:depend({
                            [1] = nil, 
                            [2] = "random", 
                            [1] = v25.delay_type
                        });
                        v25.normal_max = v23:slider("max ticks\nnormal", 1, 24, 12, 1);
                        v25.normal_max:depend({
                            [1] = nil, 
                            [2] = "normal", 
                            [1] = v25.delay_options
                        });
                        v25.normal_max:depend({
                            [1] = nil, 
                            [2] = "random", 
                            [1] = v25.delay_type
                        });
                        v25.normal_fixed = v23:slider("fixed ticks\nnormal", 1, 24, 8, 1);
                        v25.normal_fixed:depend({
                            [1] = nil, 
                            [2] = "normal", 
                            [1] = v25.delay_options
                        });
                        v25.normal_fixed:depend({
                            [1] = nil, 
                            [2] = "fixed", 
                            [1] = v25.delay_type
                        });
                        v25.cheat_preset = v23:combo("cheat preset", {
                            [1] = "gamesense", 
                            [2] = "neverlose"
                        });
                        v25.cheat_preset:depend({
                            [1] = nil, 
                            [2] = "cheat based", 
                            [1] = v25.delay_options
                        });
                        for _, v27 in ipairs({
                            [1] = "gamesense", 
                            [2] = "neverlose"
                        }) do
                            local v28 = "\n" .. v27;
                            v25["min_" .. v27] = v23:slider("min ticks" .. v28, 1, 24, 4, 1);
                            v25["min_" .. v27]:depend({
                                [1] = nil, 
                                [2] = "cheat based", 
                                [1] = v25.delay_options
                            });
                            v25["min_" .. v27]:depend({
                                [1] = nil, 
                                [2] = "random", 
                                [1] = v25.delay_type
                            });
                            v25["min_" .. v27]:depend({
                                [1] = v25.cheat_preset, 
                                [2] = v27
                            });
                            v25["max_" .. v27] = v23:slider("max ticks" .. v28, 1, 24, 12, 1);
                            v25["max_" .. v27]:depend({
                                [1] = nil, 
                                [2] = "cheat based", 
                                [1] = v25.delay_options
                            });
                            v25["max_" .. v27]:depend({
                                [1] = nil, 
                                [2] = "random", 
                                [1] = v25.delay_type
                            });
                            v25["max_" .. v27]:depend({
                                [1] = v25.cheat_preset, 
                                [2] = v27
                            });
                            v25["fixed_" .. v27] = v23:slider("fixed ticks" .. v28, 1, 24, 8, 1);
                            v25["fixed_" .. v27]:depend({
                                [1] = nil, 
                                [2] = "cheat based", 
                                [1] = v25.delay_options
                            });
                            v25["fixed_" .. v27]:depend({
                                [1] = nil, 
                                [2] = "fixed", 
                                [1] = v25.delay_type
                            });
                            v25["fixed_" .. v27]:depend({
                                [1] = v25.cheat_preset, 
                                [2] = v27
                            });
                        end;
                        return v25;
                    end);
                    v20.body_yaw = v5.combo({
                        [1] = nil, 
                        [2] = "body", 
                        [3] = 2, 
                        [1] = v9
                    }, "\v\f<child-dress>     " .. v7.colors.gradient .. "[body yaw]", {
                        [1] = "off", 
                        [2] = "normal", 
                        [3] = "tick", 
                        [4] = "beast"
                    });
                    v20.tick_speed_1 = v5.slider({
                        [1] = nil, 
                        [2] = "body", 
                        [3] = 2, 
                        [1] = v9
                    }, "            \v\f<turn-down-right>   " .. v7.colors.gradient .. "[speed 1]", 0, 16, 8, 1):depend({
                        [1] = nil, 
                        [2] = "tick", 
                        [3] = false, 
                        [1] = v20.body_yaw
                    });
                    v20.tick_speed_2 = v5.slider({
                        [1] = nil, 
                        [2] = "body", 
                        [3] = 2, 
                        [1] = v9
                    }, "            \v\f<turn-down-right>   " .. v7.colors.gradient .. "[speed 2]", 0, 16, 8, 1):depend({
                        [1] = nil, 
                        [2] = "tick", 
                        [3] = false, 
                        [1] = v20.body_yaw
                    });
                    v20.limit = v5.slider({
                        [1] = nil, 
                        [2] = "body", 
                        [3] = 2, 
                        [1] = v9
                    }, "\v\f<angle>   " .. v7.colors.gradient .. "[fake limit]", 0, 61, 60, 1, function(v29)
                        if v29 == 61 then
                            return "random";
                        else
                            return v29;
                        end;
                    end):depend({
                        [1] = nil, 
                        [2] = "off", 
                        [3] = true, 
                        [1] = v20.body_yaw
                    });
                    v20.randomize_limit_value = v5.slider({
                        [1] = nil, 
                        [2] = "body", 
                        [3] = 2, 
                        [1] = v9
                    }, "            \v\f<turn-down-right>   " .. v7.colors.gradient .. "[limit 1]", 0, 60, 60, 1):depend({
                        [1] = nil, 
                        [2] = 61, 
                        [1] = v20.limit
                    }):depend({
                        [1] = nil, 
                        [2] = "off", 
                        [3] = true, 
                        [1] = v20.body_yaw
                    });
                    v20.randomize_limit_value2 = v5.slider({
                        [1] = nil, 
                        [2] = "body", 
                        [3] = 2, 
                        [1] = v9
                    }, "            \v\f<turn-down-right>   " .. v7.colors.gradient .. "[limit 2]", 0, 60, 60, 1):depend({
                        [1] = nil, 
                        [2] = 61, 
                        [1] = v20.limit
                    }):depend({
                        [1] = nil, 
                        [2] = "off", 
                        [3] = true, 
                        [1] = v20.body_yaw
                    });
                    v20.defensive_handler = v5.switch({
                        [1] = nil, 
                        [2] = "defensive handler", 
                        [3] = 2, 
                        [1] = v9
                    }, "\v\f<shield>   " .. v7.colors.gradient .. "[force defensive]", false);
                    do
                        local l_v19_0 = v19;
                        v7.data.menu.send_to_another_team = v5.button({
                            [1] = nil, 
                            [2] = "builder ", 
                            [3] = 1, 
                            [1] = v9
                        }, "                      send to " .. v7.colors.gradient .. "[opposite] team                   ", function()
                            -- upvalues: v11 (ref), v5 (ref), v7 (ref), l_v19_0 (ref), l_base64_0 (ref)
                            local v31 = v11.select_team:get();
                            local v32 = v11.select_state:get();
                            local _ = "state";
                            local v34 = v5.setup({
                                [1] = v7.data.menu[v31][l_v19_0]
                            }, true):save();
                            local v35 = l_base64_0.encode(json.stringify(v34));
                            local v36 = v31 == "counter-terrorist" and "terrorist" or "counter-terrorist";
                            local v37 = l_base64_0.decode(v35);
                            local v38 = json.parse(v37);
                            v5.setup({
                                [1] = v7.data.menu[v36][v32]
                            }, true):load(v38);
                        end, true):depend({
                            [1] = v11.select_state, 
                            [2] = l_v19_0
                        }):depend({
                            [1] = v11.select_team, 
                            [2] = l_v16_0
                        });
                        v5.traverse(v20, function(v39, _)
                            -- upvalues: v11 (ref), l_v19_0 (ref), l_v16_0 (ref)
                            v39:depend({
                                [1] = v11.select_state, 
                                [2] = l_v19_0
                            });
                            v39:depend({
                                [1] = v11.select_team, 
                                [2] = l_v16_0
                            });
                        end);
                    end;
                end;
            end;
        end;
        v7.data.menu.aspect_ratio = v5.switch({
            [1] = nil, 
            [2] = "visual", 
            [3] = 1, 
            [1] = v10
        }, "\v\f<image-landscape>     " .. v7.colors.gradient .. "[aspect ratio]", false, function(v41, v42)
            return {
                amount = v41:slider("aspect ratio", 0, 200, 0, 0.01):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v42
                })
            };
        end);
        v7.data.menu.viewmodel = v5.switch({
            [1] = nil, 
            [2] = "visual", 
            [3] = 1, 
            [1] = v10
        }, "\v\f<person-rifle>     " .. v7.colors.gradient .. "[viewmodel]", false, function(v43, v44)
            return {
                fov = v43:slider("fov", 0, 1000, 690, 0.1):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v44
                }), 
                x = v43:slider("x", -150, 150, 25, 0.1):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v44
                }), 
                y = v43:slider("y", -150, 150, 25, 0.1):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v44
                }), 
                z = v43:slider("z", -150, 150, 25, 0.1):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v44
                })
            };
        end);
        v7.data.menu.customscope = v5.switch({
            [1] = nil, 
            [2] = "visual", 
            [3] = 1, 
            [1] = v10
        }, "\v\f<gun>     " .. v7.colors.gradient .. "[scope overlay]", false, function(v45, v46)
            return {
                color = v45:label("color", color(255, 255, 255, 255)):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v46
                }), 
                line = v45:slider("line", 0, 200, 50, 1):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v46
                }), 
                gap = v45:slider("gap", 0, 200, 50, 1):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v46
                }), 
                rotate = v45:switch("rotate", false):depend({
                    [1] = nil, 
                    [2] = true, 
                    [1] = v46
                })
            };
        end);
        v7.data.menu.no_fall_damage = v5.switch({
            [1] = nil, 
            [2] = "movement", 
            [3] = 1, 
            [1] = v10
        }, "\v\f<person-falling>     " .. v7.colors.gradient .. "[no fall damage]", false);
        v7.data.menu.fast_ladder = v5.switch({
            [1] = nil, 
            [2] = "movement", 
            [3] = 1, 
            [1] = v10
        }, "\v\f<water-ladder>     " .. v7.colors.gradient .. "[fast ladder]", false);
        v7.data.menu.list = v5.list({
            [1] = nil, 
            [2] = "configs", 
            [3] = 2, 
            [1] = v8
        }, "\nsaved_configs", {});
        v7.data.menu.list:set_callback(function()
            -- upvalues: v7 (ref)
            v7.config:select_current_config();
        end);
        v7.data.menu.name = v5.input({
            [1] = nil, 
            [2] = "configs", 
            [3] = 2, 
            [1] = v8
        }, "Config name -");
        v7.data.menu.save = v5.button({
            [1] = nil, 
            [2] = "configs", 
            [3] = 2, 
            [1] = v8
        }, "Save", function()
            -- upvalues: v7 (ref)
            v7.config:save();
        end, true);
        v7.data.menu.load = v5.button({
            [1] = nil, 
            [2] = "configs", 
            [3] = 2, 
            [1] = v8
        }, "Load", function()
            -- upvalues: v7 (ref)
            v7.config:load();
        end, true);
        v7.data.menu.delete = v5.button({
            [1] = nil, 
            [2] = "configs", 
            [3] = 2, 
            [1] = v8
        }, "Remove", function()
            -- upvalues: v7 (ref)
            v7.config:delete();
        end, true);
        v7.data.menu.export = v5.button({
            [1] = nil, 
            [2] = "configs", 
            [3] = 2, 
            [1] = v8
        }, "Export", function()
            -- upvalues: l_clipboard_0 (ref), v7 (ref)
            l_clipboard_0.set(v7.config:export("config"));
        end, true);
        v7.data.menu.import = v5.button({
            [1] = nil, 
            [2] = "configs", 
            [3] = 2, 
            [1] = v8
        }, "Import", function()
            -- upvalues: l_clipboard_0 (ref), v7 (ref)
            local v47 = l_clipboard_0.get();
            if v47 and v47 ~= "" then
                v7.config:import(v47, "config");
            end;
        end, true);
        v7.data.menu.jitter_legs = v5.switch({
            [1] = nil, 
            [2] = "anims", 
            [3] = 2, 
            [1] = v10
        }, "\v\f<person-walking-with-cane>\r Jitter legs", false);
        local v48 = v7.data.menu.jitter_legs:create();
        v7.data.menu.jitter_legs_from = v48:slider("From\n", 1, 100, 0, 1, function(v49)
            return v49 / 100 .. "x";
        end):depend({
            [1] = nil, 
            [2] = true, 
            [1] = v7.data.menu.jitter_legs
        });
        v7.data.menu.jitter_legs_to = v48:slider("To\n", 1, 100, 0, 1, function(v50)
            return v50 / 100 .. "x";
        end):depend({
            [1] = nil, 
            [2] = true, 
            [1] = v7.data.menu.jitter_legs
        });
        v7.data.menu.animations_fall_amount = v5.slider({
            [1] = nil, 
            [2] = "anims", 
            [3] = 2, 
            [1] = v10
        }, "\v\f<person-falling>\r Falling", 1, 100, 50, 1, function(v51)
            return v51 .. "%";
        end);
        v7.data.menu.animations_lean_amount = v5.slider({
            [1] = nil, 
            [2] = "anims", 
            [3] = 2, 
            [1] = v10
        }, "\v\f<person>\r Leaning", 1, 100, 0, 1, function(v52)
            return v52 .. "%";
        end);
        v7.data.menu.animations_slide_amount = v5.slider({
            [1] = nil, 
            [2] = "anims", 
            [3] = 2, 
            [1] = v10
        }, "\v\f<person-walking>\r Sliding", 1, 100, 50, 1, function(v53)
            return v53 .. "%";
        end):depend({
            [1] = nil, 
            [2] = false, 
            [1] = v7.data.menu.jitter_legs
        });
    end
}):struct("config")({
    config_file = "ambani.txt", 
    storage = {}, 
    default_configs = {
        hawiz = "{ambani:config}:W3sic2lkZWJhcl9jb2xvciI6IiM5RTlCQjJGRiIsInNpZGViYXJfdGV4dCI6IlRSQUpZUsOEIiwid2F0ZXJtYXJrX2NvbG9yIjoiIzRBM0FDMkZGIiwid2F0ZXJtYXJrX2ZvbnQiOjIuMCwid2F0ZXJtYXJrX2dyYWRpZW50IjoyLjAsIndhdGVybWFya19zdHlsZSI6IkN1c3RvbSIsIndhdGVybWFya190ZXh0Ijoi0LLRgdC1INGA0YPRgdGB0LrQuNC1INGD0LzRgNGD0YIg0LzRg9GH0LjRgtC10LvRjNC90L7QuSDRgdC80LXRgNGC0YzRjiJ9LHsiZnJlZXN0YW5kaW5nIjpmYWxzZSwiZnJlZXN0YW5kaW5nX2Rpc2FibGVycyI6WyJ+Il0sImhpZGVoZWFkX29wdGlvbnMiOlsifiJdLCJtYW51YWxfYWEiOiJPZmYiLCJvcHRpb25zIjpbIldhcm11cCBBQSIsIlJvdW5kIGVuZCBBQSIsIkF2b2lkIEJhY2tzdGFiIiwifiJdLCJzdGF0ZSI6InJ1biIsInN0YXRlcyI6eyJkdWNrIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6ZmFsc2UsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJ+Il0sImJvZHlfeWF3IjoiSml0dGVyIiwiYm9keV95YXdfdGlja3MiOjEyLjAsImNsZWFucmVjb3JkcyI6ZmFsc2UsImNsZWFucmVjb3Jkc19yYW5kb21fZmxpY2siOmZhbHNlLCJjbGVhbnJlY29yZHNfdXNlZmFrZWxhZyI6ZmFsc2UsImRlZmVuc2l2ZV9hY3RpdmF0aW9uX29wdGlvbnMiOlsiQWx3YXlzIiwifiJdLCJkZWxheSI6dHJ1ZSwiZGVsYXlfaW50ZXJhY3Rpb25fdHlwZSI6Ik5ldF91cGRhdGUiLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVycyI6MS4wLCJmYWtlbGltaXRfbCI6NjAuMCwiZmFrZWxpbWl0X3IiOjYwLjAsInJhbmRvbV9kZWxheV92YWx1ZV8xIjo0LjAsInJhbmRvbV9kZWxheV92YWx1ZV8yIjo0LjAsInJhbmRvbWl6YXRpb24iOjIwLjAsInN3aXRjaF9kZWxheSI6NC4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczEiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMyIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMyI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczQiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM1IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNiI6MS4wLCJ5YXdfYWRkIjotNDQuMCwieWF3X2FkZF9yIjoyOC4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0IjpmYWxzZSwieWF3X2ppdHRlciI6IkdpbmdlcmJvbWJlciIsInlhd19qaXR0ZXJfYWRkIjozMC4wLCJ5YXdfaml0dGVyX21vZGUiOiJDdXN0b20iLCJ5YXdfaml0dGVyX293bjEiOjM2LjAsInlhd19qaXR0ZXJfb3duMiI6LTI2LjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6NzguMCwieWF3X2ppdHRlcl9zbGlkZXIyIjozNS4wLCJ5YXdfaml0dGVyX3NsaWRlcjMiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjYiOjUwLjAsInlhd19zbGlkZXJzIjoyLjB9LCJkdWNrIGp1bXAiOnsiYW50aWJydXRlZm9yY2VfZW5hYmxlIjp0cnVlLCJhbnRpYnJ1dGVmb3JjZV9tb2RpZmllcnMiOlsiRmFrZSBsaW1pdCIsIkRlbGF5IiwiTW9kaWZpZXIiLCJ+Il0sImJvZHlfeWF3IjoiSml0dGVyIiwiYm9keV95YXdfdGlja3MiOjEyLjAsImNsZWFucmVjb3JkcyI6ZmFsc2UsImNsZWFucmVjb3Jkc19yYW5kb21fZmxpY2siOmZhbHNlLCJjbGVhbnJlY29yZHNfdXNlZmFrZWxhZyI6ZmFsc2UsImRlZmVuc2l2ZV9hY3RpdmF0aW9uX29wdGlvbnMiOlsiQWx3YXlzIiwifiJdLCJkZWxheSI6dHJ1ZSwiZGVsYXlfaW50ZXJhY3Rpb25fdHlwZSI6IkNyZWF0ZW1vdmUiLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVycyI6MS4wLCJmYWtlbGltaXRfbCI6NjAuMCwiZmFrZWxpbWl0X3IiOjYwLjAsInJhbmRvbV9kZWxheV92YWx1ZV8xIjo1LjAsInJhbmRvbV9kZWxheV92YWx1ZV8yIjo4LjAsInJhbmRvbWl6YXRpb24iOjEwLjAsInN3aXRjaF9kZWxheSI6Ni4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczEiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMyIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMyI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczQiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM1IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNiI6MS4wLCJ5YXdfYWRkIjotMjcuMCwieWF3X2FkZF9yIjozNS4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0Ijp0cnVlLCJ5YXdfaml0dGVyIjoiR2luZ2VyYm9tYmVyIiwieWF3X2ppdHRlcl9hZGQiOi0zLjAsInlhd19qaXR0ZXJfbW9kZSI6IkRlZmF1bHQiLCJ5YXdfaml0dGVyX293bjEiOi0zNi4wLCJ5YXdfaml0dGVyX293bjIiOjMwLjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIyIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjMiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjYiOjUwLjAsInlhd19zbGlkZXJzIjoxLjB9LCJkdWNrIG1vdmUiOnsiYW50aWJydXRlZm9yY2VfZW5hYmxlIjpmYWxzZSwiYW50aWJydXRlZm9yY2VfbW9kaWZpZXJzIjpbIn4iXSwiYm9keV95YXciOiJKaXR0ZXIiLCJib2R5X3lhd190aWNrcyI6MTIuMCwiY2xlYW5yZWNvcmRzIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3JhbmRvbV9mbGljayI6ZmFsc2UsImNsZWFucmVjb3Jkc191c2VmYWtlbGFnIjpmYWxzZSwiZGVmZW5zaXZlX2FjdGl2YXRpb25fb3B0aW9ucyI6WyJ+Il0sImRlbGF5Ijp0cnVlLCJkZWxheV9pbnRlcmFjdGlvbl90eXBlIjoiQ3JlYXRlbW92ZSIsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzIjoxLjAsImZha2VsaW1pdF9sIjo2MC4wLCJmYWtlbGltaXRfciI6NjAuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzEiOjEuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzIiOjEuMCwicmFuZG9taXphdGlvbiI6MC4wLCJzd2l0Y2hfZGVsYXkiOjQuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMxIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMiI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczMiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM0IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczYiOjEuMCwieWF3X2FkZCI6LTMyLjAsInlhd19hZGRfciI6NDEuMCwieWF3X2hlYWRiZWhpbmRjaGVzdCI6ZmFsc2UsInlhd19qaXR0ZXIiOiJDZW50ZXIiLCJ5YXdfaml0dGVyX2FkZCI6LTguMCwieWF3X2ppdHRlcl9tb2RlIjoiRGVmYXVsdCIsInlhd19qaXR0ZXJfb3duMSI6LTI1LjAsInlhd19qaXR0ZXJfb3duMiI6MzAuMCwieWF3X2ppdHRlcl9zbGlkZXIxIjotMTkuMCwieWF3X2ppdHRlcl9zbGlkZXIyIjo0MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjMiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjYiOjUwLjAsInlhd19zbGlkZXJzIjoyLjB9LCJqdW1wIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6ZmFsc2UsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJ+Il0sImJvZHlfeWF3IjoiSml0dGVyIiwiYm9keV95YXdfdGlja3MiOjEyLjAsImNsZWFucmVjb3JkcyI6dHJ1ZSwiY2xlYW5yZWNvcmRzX3JhbmRvbV9mbGljayI6ZmFsc2UsImNsZWFucmVjb3Jkc191c2VmYWtlbGFnIjpmYWxzZSwiZGVmZW5zaXZlX2FjdGl2YXRpb25fb3B0aW9ucyI6WyJBbHdheXMiLCJ+Il0sImRlbGF5Ijp0cnVlLCJkZWxheV9pbnRlcmFjdGlvbl90eXBlIjoiTmV0X3VwZGF0ZSIsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzIjoxLjAsImZha2VsaW1pdF9sIjo2MC4wLCJmYWtlbGltaXRfciI6NjAuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzEiOjEuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzIiOjEuMCwicmFuZG9taXphdGlvbiI6Ny4wLCJzd2l0Y2hfZGVsYXkiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMxIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMiI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczMiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM0IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczYiOjEuMCwieWF3X2FkZCI6LTEzLjAsInlhd19hZGRfciI6MjguMCwieWF3X2hlYWRiZWhpbmRjaGVzdCI6ZmFsc2UsInlhd19qaXR0ZXIiOiJDZW50ZXIiLCJ5YXdfaml0dGVyX2FkZCI6LTcuMCwieWF3X2ppdHRlcl9tb2RlIjoiRGVmYXVsdCIsInlhd19qaXR0ZXJfb3duMSI6MC4wLCJ5YXdfaml0dGVyX293bjIiOjAuMCwieWF3X2ppdHRlcl9zbGlkZXIxIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjIiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyMyI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI0Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjUiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNiI6NTAuMCwieWF3X3NsaWRlcnMiOjEuMH0sInJ1biI6eyJhbnRpYnJ1dGVmb3JjZV9lbmFibGUiOnRydWUsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJGYWtlIGxpbWl0IiwiRGVsYXkiLCJNb2RpZmllciIsIn4iXSwiYm9keV95YXciOiJKaXR0ZXIiLCJib2R5X3lhd190aWNrcyI6MTIuMCwiY2xlYW5yZWNvcmRzIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3JhbmRvbV9mbGljayI6ZmFsc2UsImNsZWFucmVjb3Jkc191c2VmYWtlbGFnIjpmYWxzZSwiZGVmZW5zaXZlX2FjdGl2YXRpb25fb3B0aW9ucyI6WyJ+Il0sImRlbGF5Ijp0cnVlLCJkZWxheV9pbnRlcmFjdGlvbl90eXBlIjoiQ3JlYXRlbW92ZSIsImRlbGF5X21ldGhvZCI6IlJhbmRvbSIsImRlbGF5X3NsaWRlcnMiOjEuMCwiZmFrZWxpbWl0X2wiOjYwLjAsImZha2VsaW1pdF9yIjo2MC4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMSI6Ni4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMiI6Ni4wLCJyYW5kb21pemF0aW9uIjo5LjAsInN3aXRjaF9kZWxheSI6NC4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczEiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMyIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMyI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczQiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM1IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNiI6MS4wLCJ5YXdfYWRkIjotMzEuMCwieWF3X2FkZF9yIjozMS4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0IjpmYWxzZSwieWF3X2ppdHRlciI6IkdpbmdlcmJvbWJlciIsInlhd19qaXR0ZXJfYWRkIjozNi4wLCJ5YXdfaml0dGVyX21vZGUiOiJEZWZhdWx0IiwieWF3X2ppdHRlcl9vd24xIjoyLjAsInlhd19qaXR0ZXJfb3duMiI6LTE3LjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIyIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjMiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjYiOjUwLjAsInlhd19zbGlkZXJzIjoxLjB9LCJzbG93IHdhbGsiOnsiYW50aWJydXRlZm9yY2VfZW5hYmxlIjpmYWxzZSwiYW50aWJydXRlZm9yY2VfbW9kaWZpZXJzIjpbIn4iXSwiYm9keV95YXciOiJPZmYiLCJib2R5X3lhd190aWNrcyI6MTIuMCwiY2xlYW5yZWNvcmRzIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3JhbmRvbV9mbGljayI6ZmFsc2UsImNsZWFucmVjb3Jkc191c2VmYWtlbGFnIjpmYWxzZSwiZGVmZW5zaXZlX2FjdGl2YXRpb25fb3B0aW9ucyI6WyJ+Il0sImRlbGF5IjpmYWxzZSwiZGVsYXlfaW50ZXJhY3Rpb25fdHlwZSI6IkNyZWF0ZW1vdmUiLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVycyI6MS4wLCJmYWtlbGltaXRfbCI6MzIuMCwiZmFrZWxpbWl0X3IiOjMyLjAsInJhbmRvbV9kZWxheV92YWx1ZV8xIjoxLjAsInJhbmRvbV9kZWxheV92YWx1ZV8yIjoxLjAsInJhbmRvbWl6YXRpb24iOjAuMCwic3dpdGNoX2RlbGF5IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczIiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMzIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNCI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczUiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM2IjoxLjAsInlhd19hZGQiOi0zNS4wLCJ5YXdfYWRkX3IiOjM1LjAsInlhd19oZWFkYmVoaW5kY2hlc3QiOmZhbHNlLCJ5YXdfaml0dGVyIjoiT2ZmIiwieWF3X2ppdHRlcl9hZGQiOjAuMCwieWF3X2ppdHRlcl9tb2RlIjoiRGVmYXVsdCIsInlhd19qaXR0ZXJfb3duMSI6MC4wLCJ5YXdfaml0dGVyX293bjIiOjAuMCwieWF3X2ppdHRlcl9zbGlkZXIxIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjIiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyMyI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI0Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjUiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNiI6NTAuMCwieWF3X3NsaWRlcnMiOjEuMH0sInN0YW5kIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6ZmFsc2UsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJ+Il0sImJvZHlfeWF3IjoiSml0dGVyIiwiYm9keV95YXdfdGlja3MiOjEyLjAsImNsZWFucmVjb3JkcyI6dHJ1ZSwiY2xlYW5yZWNvcmRzX3JhbmRvbV9mbGljayI6ZmFsc2UsImNsZWFucmVjb3Jkc191c2VmYWtlbGFnIjpmYWxzZSwiZGVmZW5zaXZlX2FjdGl2YXRpb25fb3B0aW9ucyI6WyJ+Il0sImRlbGF5Ijp0cnVlLCJkZWxheV9pbnRlcmFjdGlvbl90eXBlIjoiTmV0X3VwZGF0ZSIsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzIjoxLjAsImZha2VsaW1pdF9sIjo2MC4wLCJmYWtlbGltaXRfciI6NjAuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzEiOjEuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzIiOjEuMCwicmFuZG9taXphdGlvbiI6MC4wLCJzd2l0Y2hfZGVsYXkiOjUuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMxIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMiI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczMiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM0IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczYiOjEuMCwieWF3X2FkZCI6LTI0LjAsInlhd19hZGRfciI6NDEuMCwieWF3X2hlYWRiZWhpbmRjaGVzdCI6ZmFsc2UsInlhd19qaXR0ZXIiOiJPZmYiLCJ5YXdfaml0dGVyX2FkZCI6MC4wLCJ5YXdfaml0dGVyX21vZGUiOiJEZWZhdWx0IiwieWF3X2ppdHRlcl9vd24xIjowLjAsInlhd19qaXR0ZXJfb3duMiI6MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjEiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyMiI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIzIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjQiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI2Ijo1MC4wLCJ5YXdfc2xpZGVycyI6MS4wfX0sInRyb2xsX2FhX29wdGlvbnMiOiJTcGluIiwidHJvbGxfYWFfc3BlZWQiOjUuMCwieWF3bW9kaWZpZXIiOlsiRm9yY2Ugc3RhdGljIiwifiJdfSx7ImRpc2FibGVfY3ZhcnMiOnRydWUsImV4dGVuZGVkX3BpbmdfYW1vdW50IjowLjAsImV4dHJhX25vdGlmaWNhdGlvbl9vcHRpb25zIjpbIkFudGktYnJ1dGVmb3JjZSIsIn4iXSwiZmFzdF9sYWRkZXIiOnRydWUsImZyZWV6ZXRpbWVfZmFrZWR1Y2siOnRydWUsImhpdGxvZ19jb2xvciI6IiNDQkIxQzNGRiIsImhpdGxvZ3MiOlsiT24gc2NyZWVuIiwiQ29uc29sZSIsIkNlbnRlciBzY3JlZW4iLCJ+Il0sIm5vX2ZhbGwiOmZhbHNlLCJ0cmFzaHRhbGtfc3RhdGVzIjpbIn4iXSwidW5sb2NrX2Zha2VkdWNrX3NwZWVkIjpmYWxzZX0seyIqaGl0X21hcmtlciI6IiNCM0IzQjNGRiIsIiptYW51YWxfYXJyb3dzIjoiIzc0NkZCRUZGIiwiKm5ldGdyYXBoX2VuYWJsZSI6IiM5RTlCQjJGRiIsImFuaW1hdGlvbnNfZmFsbF9hbW91bnQiOjEuMCwiYW5pbWF0aW9uc19sZWFuX2Ftb3VudCI6MS4wLCJhbmltYXRpb25zX3NsaWRlX2Ftb3VudCI6MS4wLCJhc3BlY3RfcmF0aW9fZW5hYmxlIjp0cnVlLCJhc3BlY3RyYXRpbyI6MTMwLjAsImRpc2FibGVfc2xlZXZlcyI6dHJ1ZSwiZG1naW5kaWNhdG9yIjpmYWxzZSwiZ2luZ2VyaW5kaWNhdG9ycyI6ZmFsc2UsImhpdF9tYXJrZXIiOnRydWUsImppdHRlcl9sZWdzIjp0cnVlLCJqaXR0ZXJfbGVnc19mcm9tIjoxLjAsImppdHRlcl9sZWdzX3RvIjo3My4wLCJraWJpdF9tYXJrZXIiOnRydWUsIm1hbnVhbF9hcnJvd3MiOnRydWUsIm5ldGdyYXBoX2VuYWJsZSI6dHJ1ZSwic2NvcGVfb3ZlcmxheSI6dHJ1ZSwic2NvcGVfb3ZlcmxheV9jb2xvciI6IiM4NTg1ODVGRiIsInNjb3BlX292ZXJsYXlfZ2FwIjo2OS4wLCJzY29wZV9vdmVybGF5X2xpbmUiOjE3LjAsInNjb3BlX292ZXJsYXlfcm90YXRlIjp0cnVlLCJ2aWV3bW9kZWxfZm92Ijo2OTcuMCwidmlld21vZGVsX2tuaWZlaGFuZCI6ZmFsc2UsInZpZXdtb2RlbF94IjoxMC4wLCJ2aWV3bW9kZWxfeSI6OS4wLCJ2aWV3bW9kZWxfeiI6MjMuMH1d", 
        leka = "{ambani:config}:W3sic2lkZWJhcl9jb2xvciI6IiNCNkJBRTZGRiIsInNpZGViYXJfc3BlZWQiOjQuMCwic2lkZWJhcl90ZXh0IjoiZ2luZ2lzZW5zZSA6MyBeX14iLCJ3YXRlcm1hcmtfY29sb3IiOiIjNDUzM0I4RkYiLCJ3YXRlcm1hcmtfZm9udCI6Mi4wLCJ3YXRlcm1hcmtfZ3JhZGllbnQiOjIuMCwid2F0ZXJtYXJrX3NwZWVkIjozLjAsIndhdGVybWFya19zdHlsZSI6IkN1c3RvbSIsIndhdGVybWFya190ZXh0IjoiR0lOR0FOR1VMSUdBTElHVUxJQlVNQlVNIn0seyJmcmVlc3RhbmRpbmciOmZhbHNlLCJmcmVlc3RhbmRpbmdfZGlzYWJsZXJzIjpbIn4iXSwiaGlkZWhlYWRfb3B0aW9ucyI6WyJ+Il0sIm1hbnVhbF9hYSI6Ik9mZiIsIm9wdGlvbnMiOlsiUm91bmQgZW5kIEFBIiwiQXZvaWQgQmFja3N0YWIiLCJ+Il0sInN0YXRlIjoicnVuIiwic3RhdGVzIjp7ImR1Y2siOnsiYW50aWJydXRlZm9yY2VfZW5hYmxlIjpmYWxzZSwiYW50aWJydXRlZm9yY2VfbW9kaWZpZXJzIjpbIn4iXSwiYm9keV95YXciOiJKaXR0ZXIiLCJib2R5X3lhd190aWNrcyI6MTIuMCwiY2xlYW5yZWNvcmRzIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3JhbmRvbV9mbGljayI6ZmFsc2UsImNsZWFucmVjb3Jkc191c2VmYWtlbGFnIjpmYWxzZSwiZGVmZW5zaXZlX2FjdGl2YXRpb25fb3B0aW9ucyI6WyJBbHdheXMiLCJ+Il0sImRlZmVuc2l2ZV9kaXNhYmxlX29wdGlvbiI6dHJ1ZSwiZGVsYXkiOnRydWUsImRlbGF5X2ludGVyYWN0aW9uX3R5cGUiOiJDcmVhdGVtb3ZlIiwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnMiOjEuMCwiZmFrZWxpbWl0X2wiOjYwLjAsImZha2VsaW1pdF9sMiI6MzIuMCwiZmFrZWxpbWl0X29wdGlvbnMiOiJEZWZhdWx0IiwiZmFrZWxpbWl0X3IiOjYwLjAsImZha2VsaW1pdF9yMiI6MzIuMCwiZmFrZWxpbWl0X3NwZWVkIjo1LjAsInJhbmRvbV9kZWxheV92YWx1ZV8xIjo0LjAsInJhbmRvbV9kZWxheV92YWx1ZV8yIjo0LjAsInJhbmRvbWl6YXRpb24iOjIwLjAsInN3aXRjaF9kZWxheSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczEiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMyIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMyI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczQiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM1IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNiI6MS4wLCJ5YXdfYWRkIjotMTYuMCwieWF3X2FkZF9yIjoyMS4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0IjpmYWxzZSwieWF3X2ppdHRlciI6Ik9mZiIsInlhd19qaXR0ZXJfYWRkIjozMC4wLCJ5YXdfaml0dGVyX21vZGUiOiJDdXN0b20iLCJ5YXdfaml0dGVyX293bjEiOjM2LjAsInlhd19qaXR0ZXJfb3duMiI6LTI2LjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6NzguMCwieWF3X2ppdHRlcl9zbGlkZXIyIjozNS4wLCJ5YXdfaml0dGVyX3NsaWRlcjMiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjYiOjUwLjAsInlhd19zbGlkZXJzIjoyLjB9LCJkdWNrIGp1bXAiOnsiYW50aWJydXRlZm9yY2VfZW5hYmxlIjp0cnVlLCJhbnRpYnJ1dGVmb3JjZV9tb2RpZmllcnMiOlsiTW9kaWZpZXIiLCJ+Il0sImJvZHlfeWF3IjoiRXhwZXJpbWVudGFsIiwiYm9keV95YXdfdGlja3MiOjMuMCwiY2xlYW5yZWNvcmRzIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3JhbmRvbV9mbGljayI6ZmFsc2UsImNsZWFucmVjb3Jkc191c2VmYWtlbGFnIjpmYWxzZSwiZGVmZW5zaXZlX2FjdGl2YXRpb25fb3B0aW9ucyI6WyJXZWFwb24gc3dpdGNoIiwiV2VhcG9uIHJlbG9hZCIsIkFsd2F5cyIsIn4iXSwiZGVmZW5zaXZlX2Rpc2FibGVfb3B0aW9uIjp0cnVlLCJkZWxheSI6ZmFsc2UsImRlbGF5X2ludGVyYWN0aW9uX3R5cGUiOiJDcmVhdGVtb3ZlIiwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnMiOjEuMCwiZmFrZWxpbWl0X2wiOjYwLjAsImZha2VsaW1pdF9sMiI6MzIuMCwiZmFrZWxpbWl0X29wdGlvbnMiOiJEZWZhdWx0IiwiZmFrZWxpbWl0X3IiOjYwLjAsImZha2VsaW1pdF9yMiI6MzIuMCwiZmFrZWxpbWl0X3NwZWVkIjo1LjAsInJhbmRvbV9kZWxheV92YWx1ZV8xIjoxLjAsInJhbmRvbV9kZWxheV92YWx1ZV8yIjoxLjAsInJhbmRvbWl6YXRpb24iOjAuMCwic3dpdGNoX2RlbGF5IjoxMS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczEiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMyIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMyI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczQiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM1IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNiI6MS4wLCJ5YXdfYWRkIjotMjAuMCwieWF3X2FkZF9yIjoyNC4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0IjpmYWxzZSwieWF3X2ppdHRlciI6Ik9mZiIsInlhd19qaXR0ZXJfYWRkIjo4LjAsInlhd19qaXR0ZXJfbW9kZSI6IkRlZmF1bHQiLCJ5YXdfaml0dGVyX293bjEiOi0xNS4wLCJ5YXdfaml0dGVyX293bjIiOjIyLjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIyIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjMiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjYiOjUwLjAsInlhd19zbGlkZXJzIjoxLjB9LCJkdWNrIG1vdmUiOnsiYW50aWJydXRlZm9yY2VfZW5hYmxlIjpmYWxzZSwiYW50aWJydXRlZm9yY2VfbW9kaWZpZXJzIjpbIn4iXSwiYm9keV95YXciOiJFeHBlcmltZW50YWwiLCJib2R5X3lhd190aWNrcyI6MTIuMCwiY2xlYW5yZWNvcmRzIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3JhbmRvbV9mbGljayI6ZmFsc2UsImNsZWFucmVjb3Jkc191c2VmYWtlbGFnIjpmYWxzZSwiZGVmZW5zaXZlX2FjdGl2YXRpb25fb3B0aW9ucyI6WyJBbHdheXMiLCJ+Il0sImRlZmVuc2l2ZV9kaXNhYmxlX29wdGlvbiI6dHJ1ZSwiZGVsYXkiOnRydWUsImRlbGF5X2ludGVyYWN0aW9uX3R5cGUiOiJDcmVhdGVtb3ZlIiwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnMiOjEuMCwiZmFrZWxpbWl0X2wiOjYwLjAsImZha2VsaW1pdF9sMiI6MzIuMCwiZmFrZWxpbWl0X29wdGlvbnMiOiJEZWZhdWx0IiwiZmFrZWxpbWl0X3IiOjYwLjAsImZha2VsaW1pdF9yMiI6MzIuMCwiZmFrZWxpbWl0X3NwZWVkIjo1LjAsInJhbmRvbV9kZWxheV92YWx1ZV8xIjoxLjAsInJhbmRvbV9kZWxheV92YWx1ZV8yIjoxLjAsInJhbmRvbWl6YXRpb24iOjAuMCwic3dpdGNoX2RlbGF5Ijo3LjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczIiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMzIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNCI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczUiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM2IjoxLjAsInlhd19hZGQiOi0zMC4wLCJ5YXdfYWRkX3IiOjQwLjAsInlhd19oZWFkYmVoaW5kY2hlc3QiOmZhbHNlLCJ5YXdfaml0dGVyIjoiU3BpbiIsInlhd19qaXR0ZXJfYWRkIjotOC4wLCJ5YXdfaml0dGVyX21vZGUiOiJDdXN0b20iLCJ5YXdfaml0dGVyX293bjEiOi0yNC4wLCJ5YXdfaml0dGVyX293bjIiOjM1LjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6My4wLCJ5YXdfaml0dGVyX3NsaWRlcjIiOjguMCwieWF3X2ppdHRlcl9zbGlkZXIzIjozLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjYiOjUwLjAsInlhd19zbGlkZXJzIjozLjB9LCJqdW1wIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6ZmFsc2UsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJ+Il0sImJvZHlfeWF3IjoiSml0dGVyIiwiYm9keV95YXdfdGlja3MiOjYuMCwiY2xlYW5yZWNvcmRzIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3JhbmRvbV9mbGljayI6ZmFsc2UsImNsZWFucmVjb3Jkc191c2VmYWtlbGFnIjpmYWxzZSwiZGVmZW5zaXZlX2FjdGl2YXRpb25fb3B0aW9ucyI6WyJBbHdheXMiLCJ+Il0sImRlZmVuc2l2ZV9kaXNhYmxlX29wdGlvbiI6dHJ1ZSwiZGVsYXkiOmZhbHNlLCJkZWxheV9pbnRlcmFjdGlvbl90eXBlIjoiTmV0X3VwZGF0ZSIsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzIjoxLjAsImZha2VsaW1pdF9sIjo2MC4wLCJmYWtlbGltaXRfbDIiOjMyLjAsImZha2VsaW1pdF9vcHRpb25zIjoiRGVmYXVsdCIsImZha2VsaW1pdF9yIjo2MC4wLCJmYWtlbGltaXRfcjIiOjMyLjAsImZha2VsaW1pdF9zcGVlZCI6NS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMSI6MS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMiI6MS4wLCJyYW5kb21pemF0aW9uIjowLjAsInN3aXRjaF9kZWxheSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczEiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMyIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMyI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczQiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM1IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNiI6MS4wLCJ5YXdfYWRkIjo3LjAsInlhd19hZGRfciI6Ny4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0IjpmYWxzZSwieWF3X2ppdHRlciI6Ik9mZiIsInlhd19qaXR0ZXJfYWRkIjo3LjAsInlhd19qaXR0ZXJfbW9kZSI6IkRlZmF1bHQiLCJ5YXdfaml0dGVyX293bjEiOi0xNy4wLCJ5YXdfaml0dGVyX293bjIiOi02LjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIyIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjMiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjYiOjUwLjAsInlhd19zbGlkZXJzIjoxLjB9LCJydW4iOnsiYW50aWJydXRlZm9yY2VfZW5hYmxlIjp0cnVlLCJhbnRpYnJ1dGVmb3JjZV9tb2RpZmllcnMiOlsiRGVsYXkiLCJ+Il0sImJvZHlfeWF3IjoiRXhwZXJpbWVudGFsIiwiYm9keV95YXdfdGlja3MiOjEyLjAsImNsZWFucmVjb3JkcyI6dHJ1ZSwiY2xlYW5yZWNvcmRzX3JhbmRvbV9mbGljayI6dHJ1ZSwiY2xlYW5yZWNvcmRzX3VzZWZha2VsYWciOmZhbHNlLCJkZWZlbnNpdmVfYWN0aXZhdGlvbl9vcHRpb25zIjpbIkFsd2F5cyIsIn4iXSwiZGVmZW5zaXZlX2Rpc2FibGVfb3B0aW9uIjp0cnVlLCJkZWxheSI6dHJ1ZSwiZGVsYXlfaW50ZXJhY3Rpb25fdHlwZSI6IkNyZWF0ZW1vdmUiLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVycyI6Ni4wLCJmYWtlbGltaXRfbCI6NjAuMCwiZmFrZWxpbWl0X2wyIjo1Mi4wLCJmYWtlbGltaXRfb3B0aW9ucyI6Ik1pbi1NYXgiLCJmYWtlbGltaXRfciI6NjAuMCwiZmFrZWxpbWl0X3IyIjo2MC4wLCJmYWtlbGltaXRfc3BlZWQiOjcuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzEiOjYuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzIiOjYuMCwicmFuZG9taXphdGlvbiI6MC4wLCJzd2l0Y2hfZGVsYXkiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMxIjo3LjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMiI6OS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczMiOjQuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM0IjoyLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNSI6NS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczYiOjkuMCwieWF3X2FkZCI6LTE2LjAsInlhd19hZGRfciI6MzAuMCwieWF3X2hlYWRiZWhpbmRjaGVzdCI6ZmFsc2UsInlhd19qaXR0ZXIiOiJPZmYiLCJ5YXdfaml0dGVyX2FkZCI6OC4wLCJ5YXdfaml0dGVyX21vZGUiOiJEZWZhdWx0IiwieWF3X2ppdHRlcl9vd24xIjoyNC4wLCJ5YXdfaml0dGVyX293bjIiOi0xOS4wLCJ5YXdfaml0dGVyX3NsaWRlcjEiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyMiI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIzIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjQiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI2Ijo1MC4wLCJ5YXdfc2xpZGVycyI6MS4wfSwic2xvdyB3YWxrIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6ZmFsc2UsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJ+Il0sImJvZHlfeWF3IjoiSml0dGVyIiwiYm9keV95YXdfdGlja3MiOjEyLjAsImNsZWFucmVjb3JkcyI6ZmFsc2UsImNsZWFucmVjb3Jkc19yYW5kb21fZmxpY2siOmZhbHNlLCJjbGVhbnJlY29yZHNfdXNlZmFrZWxhZyI6ZmFsc2UsImRlZmVuc2l2ZV9hY3RpdmF0aW9uX29wdGlvbnMiOlsifiJdLCJkZWZlbnNpdmVfZGlzYWJsZV9vcHRpb24iOmZhbHNlLCJkZWxheSI6dHJ1ZSwiZGVsYXlfaW50ZXJhY3Rpb25fdHlwZSI6IkNyZWF0ZW1vdmUiLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVycyI6MS4wLCJmYWtlbGltaXRfbCI6NjAuMCwiZmFrZWxpbWl0X2wyIjozMi4wLCJmYWtlbGltaXRfb3B0aW9ucyI6IkRlZmF1bHQiLCJmYWtlbGltaXRfciI6NjAuMCwiZmFrZWxpbWl0X3IyIjozMi4wLCJmYWtlbGltaXRfc3BlZWQiOjUuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzEiOjEuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzIiOjEuMCwicmFuZG9taXphdGlvbiI6MTIuMCwic3dpdGNoX2RlbGF5Ijo0LjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczIiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMzIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNCI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczUiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM2IjoxLjAsInlhd19hZGQiOi0yNi4wLCJ5YXdfYWRkX3IiOjMwLjAsInlhd19oZWFkYmVoaW5kY2hlc3QiOmZhbHNlLCJ5YXdfaml0dGVyIjoiQ2VudGVyIiwieWF3X2ppdHRlcl9hZGQiOjguMCwieWF3X2ppdHRlcl9tb2RlIjoiQ3VzdG9tIiwieWF3X2ppdHRlcl9vd24xIjotMTMuMCwieWF3X2ppdHRlcl9vd24yIjozNS4wLCJ5YXdfaml0dGVyX3NsaWRlcjEiOi0xMy4wLCJ5YXdfaml0dGVyX3NsaWRlcjIiOjQwLjAsInlhd19qaXR0ZXJfc2xpZGVyMyI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI0Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjUiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNiI6NTAuMCwieWF3X3NsaWRlcnMiOjIuMH0sInN0YW5kIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6ZmFsc2UsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJ+Il0sImJvZHlfeWF3IjoiRXhwZXJpbWVudGFsIiwiYm9keV95YXdfdGlja3MiOjEzLjAsImNsZWFucmVjb3JkcyI6ZmFsc2UsImNsZWFucmVjb3Jkc19yYW5kb21fZmxpY2siOmZhbHNlLCJjbGVhbnJlY29yZHNfdXNlZmFrZWxhZyI6ZmFsc2UsImRlZmVuc2l2ZV9hY3RpdmF0aW9uX29wdGlvbnMiOlsifiJdLCJkZWZlbnNpdmVfZGlzYWJsZV9vcHRpb24iOmZhbHNlLCJkZWxheSI6dHJ1ZSwiZGVsYXlfaW50ZXJhY3Rpb25fdHlwZSI6IkNyZWF0ZW1vdmUiLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVycyI6MS4wLCJmYWtlbGltaXRfbCI6NjAuMCwiZmFrZWxpbWl0X2wyIjozMi4wLCJmYWtlbGltaXRfb3B0aW9ucyI6IkRlZmF1bHQiLCJmYWtlbGltaXRfciI6NjAuMCwiZmFrZWxpbWl0X3IyIjozMi4wLCJmYWtlbGltaXRfc3BlZWQiOjUuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzEiOjQuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzIiOjYuMCwicmFuZG9taXphdGlvbiI6MTAuMCwic3dpdGNoX2RlbGF5IjoxMi4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczEiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMyIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMyI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczQiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM1IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNiI6MS4wLCJ5YXdfYWRkIjotNDAuMCwieWF3X2FkZF9yIjoxOS4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0IjpmYWxzZSwieWF3X2ppdHRlciI6Ik9mZiIsInlhd19qaXR0ZXJfYWRkIjowLjAsInlhd19qaXR0ZXJfbW9kZSI6IkRlZmF1bHQiLCJ5YXdfaml0dGVyX293bjEiOjI0LjAsInlhd19qaXR0ZXJfb3duMiI6NDYuMCwieWF3X2ppdHRlcl9zbGlkZXIxIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjIiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyMyI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI0Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjUiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNiI6NTAuMCwieWF3X3NsaWRlcnMiOjEuMH19LCJ0cm9sbF9hYV9vcHRpb25zIjoiU3BpbiIsInRyb2xsX2FhX3NwZWVkIjo2LjAsInlhd21vZGlmaWVyIjpbIkZvcmNlIHN0YXRpYyIsIn4iXX0seyJkaXNhYmxlX2N2YXJzIjp0cnVlLCJleHRlbmRlZF9waW5nX2Ftb3VudCI6ODQuMCwiZXh0cmFfbm90aWZpY2F0aW9uX29wdGlvbnMiOlsiQW50aS1CcnV0ZWZvcmNlIiwifiJdLCJmYXN0X2xhZGRlciI6dHJ1ZSwiZnJlZXpldGltZV9mYWtlZHVjayI6dHJ1ZSwiaGl0bG9nX2NvbG9yIjoiI0NCQjFDM0ZGIiwiaGl0bG9nX29wdGlvbnMiOlsiUHVyY2hhc2VzIiwiU2hvdHMiLCJOYWRlcyIsIn4iXSwiaGl0bG9ncyI6WyJPbiBzY3JlZW4iLCJDb25zb2xlIiwifiJdLCJub19mYWxsIjp0cnVlLCJ0cmFzaHRhbGtfc3RhdGVzIjpbIktpbGwiLCJ+Il0sInVubG9ja19mYWtlZHVja19zcGVlZCI6dHJ1ZX0seyIqaGl0X21hcmtlciI6IiNCM0IzQjNGRiIsIiptYW51YWxfYXJyb3dzIjoiIzc0NkZCRUZGIiwiKm5ldGdyYXBoX2VuYWJsZSI6IiM5RTlCQjJGRiIsImFuaW1hdGlvbnNfZmFsbF9hbW91bnQiOjcwLjAsImFuaW1hdGlvbnNfbGVhbl9hbW91bnQiOjUxLjAsImFuaW1hdGlvbnNfc2xpZGVfYW1vdW50Ijo1LjAsImFzcGVjdF9yYXRpb19lbmFibGUiOnRydWUsImFzcGVjdHJhdGlvIjoxMzUuMCwiY2xhbnRhZyI6ZmFsc2UsImRpc2FibGVfc2xlZXZlcyI6dHJ1ZSwiZG1naW5kaWNhdG9yIjp0cnVlLCJkbWdpbmRpY2F0b3Jfc2hvdyI6dHJ1ZSwiZ2luZ2VyaW5kaWNhdG9ycyI6dHJ1ZSwiaGl0X21hcmtlciI6dHJ1ZSwiaml0dGVyX2xlZ3MiOmZhbHNlLCJqaXR0ZXJfbGVnc19mcm9tIjozMS4wLCJqaXR0ZXJfbGVnc190byI6NzkuMCwia2liaXRfbWFya2VyIjp0cnVlLCJsYWdjb21wX2RlYnVnIjp0cnVlLCJtYW51YWxfYXJyb3dzIjp0cnVlLCJuZXRncmFwaF9lbmFibGUiOmZhbHNlLCJzY29wZV9vdmVybGF5Ijp0cnVlLCJzY29wZV9vdmVybGF5X2NvbG9yIjoiIzg1ODU4NUZGIiwic2NvcGVfb3ZlcmxheV9nYXAiOjYuMCwic2NvcGVfb3ZlcmxheV9saW5lIjozMy4wLCJzY29wZV9vdmVybGF5X3JvdGF0ZSI6ZmFsc2UsInZpZXdtb2RlbF9mb3YiOjY5Ny4wLCJ2aWV3bW9kZWxfa25pZmVoYW5kIjpmYWxzZSwidmlld21vZGVsX3giOjEwLjAsInZpZXdtb2RlbF95Ijo5LjAsInZpZXdtb2RlbF96IjoyMy4wfV0=", 
        cola = "{ambani:config}:W3sic2lkZWJhcl9jb2xvciI6IiM5RTlCQjJGRiIsInNpZGViYXJfc3BlZWQiOjEuMCwic2lkZWJhcl90ZXh0IjoiZzFOZ+KCrFIkZU4kRSIsIndhdGVybWFya19jb2xvciI6IiNBMjlGQjZGRiIsIndhdGVybWFya19mb250IjozLjAsIndhdGVybWFya19ncmFkaWVudCI6Mi4wLCJ3YXRlcm1hcmtfc3BlZWQiOjEuMCwid2F0ZXJtYXJrX3N0eWxlIjoiQ3VzdG9tIiwid2F0ZXJtYXJrX3RleHQiOiJnMU5n4oKsUiRlTiRFIPCfmIggTkVXIEVSQSRfJCJ9LHsiZnJlZXN0YW5kaW5nIjpmYWxzZSwiZnJlZXN0YW5kaW5nX2Rpc2FibGVycyI6WyJ+Il0sImhpZGVoZWFkX29wdGlvbnMiOlsifiJdLCJtYW51YWxfYWEiOiJPZmYiLCJvcHRpb25zIjpbIkF2b2lkIEJhY2tzdGFiIiwifiJdLCJzdGF0ZSI6ImR1Y2sganVtcCIsInN0YXRlcyI6eyJkdWNrIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6ZmFsc2UsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJ+Il0sImJvZHlfeWF3IjoiSml0dGVyIiwiYm9keV95YXdfdGlja3MiOjEyLjAsImNsZWFucmVjb3JkcyI6ZmFsc2UsImNsZWFucmVjb3Jkc19yYW5kb21fZmxpY2siOmZhbHNlLCJjbGVhbnJlY29yZHNfdXNlZmFrZWxhZyI6ZmFsc2UsImRlZmVuc2l2ZV9hY3RpdmF0aW9uX29wdGlvbnMiOlsiQWx3YXlzIiwifiJdLCJkZWZlbnNpdmVfZGlzYWJsZV9vcHRpb24iOmZhbHNlLCJkZWxheSI6dHJ1ZSwiZGVsYXlfaW50ZXJhY3Rpb25fdHlwZSI6Ik5ldF91cGRhdGUiLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVycyI6MS4wLCJmYWtlbGltaXRfbCI6NjAuMCwiZmFrZWxpbWl0X3IiOjYwLjAsInJhbmRvbV9kZWxheV92YWx1ZV8xIjo0LjAsInJhbmRvbV9kZWxheV92YWx1ZV8yIjo0LjAsInJhbmRvbWl6YXRpb24iOjIwLjAsInN3aXRjaF9kZWxheSI6NC4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczEiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMyIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMyI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczQiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM1IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNiI6MS4wLCJ5YXdfYWRkIjotNDQuMCwieWF3X2FkZF9yIjoyOC4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0IjpmYWxzZSwieWF3X2ppdHRlciI6IkdpbmdlcmJvbWJlciIsInlhd19qaXR0ZXJfYWRkIjozMC4wLCJ5YXdfaml0dGVyX21vZGUiOiJDdXN0b20iLCJ5YXdfaml0dGVyX293bjEiOjM2LjAsInlhd19qaXR0ZXJfb3duMiI6LTI2LjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6NzguMCwieWF3X2ppdHRlcl9zbGlkZXIyIjozNS4wLCJ5YXdfaml0dGVyX3NsaWRlcjMiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjYiOjUwLjAsInlhd19zbGlkZXJzIjoyLjB9LCJkdWNrIGp1bXAiOnsiYW50aWJydXRlZm9yY2VfZW5hYmxlIjp0cnVlLCJhbnRpYnJ1dGVmb3JjZV9tb2RpZmllcnMiOlsiRmFrZSBsaW1pdCIsIkRlbGF5IiwiTW9kaWZpZXIiLCJ+Il0sImJvZHlfeWF3IjoiSml0dGVyIiwiYm9keV95YXdfdGlja3MiOjEyLjAsImNsZWFucmVjb3JkcyI6ZmFsc2UsImNsZWFucmVjb3Jkc19yYW5kb21fZmxpY2siOmZhbHNlLCJjbGVhbnJlY29yZHNfdXNlZmFrZWxhZyI6dHJ1ZSwiZGVmZW5zaXZlX2FjdGl2YXRpb25fb3B0aW9ucyI6WyJBbHdheXMiLCJ+Il0sImRlZmVuc2l2ZV9kaXNhYmxlX29wdGlvbiI6dHJ1ZSwiZGVsYXkiOnRydWUsImRlbGF5X2ludGVyYWN0aW9uX3R5cGUiOiJDcmVhdGVtb3ZlIiwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnMiOjEuMCwiZmFrZWxpbWl0X2wiOjYwLjAsImZha2VsaW1pdF9yIjo2MC4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMSI6NS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMiI6OC4wLCJyYW5kb21pemF0aW9uIjoxMC4wLCJzd2l0Y2hfZGVsYXkiOjYuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMxIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMiI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczMiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM0IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczYiOjEuMCwieWF3X2FkZCI6LTI3LjAsInlhd19hZGRfciI6MzUuMCwieWF3X2hlYWRiZWhpbmRjaGVzdCI6dHJ1ZSwieWF3X2ppdHRlciI6IkdpbmdlcmJvbWJlciIsInlhd19qaXR0ZXJfYWRkIjotMy4wLCJ5YXdfaml0dGVyX21vZGUiOiJEZWZhdWx0IiwieWF3X2ppdHRlcl9vd24xIjotMzYuMCwieWF3X2ppdHRlcl9vd24yIjozMC4wLCJ5YXdfaml0dGVyX3NsaWRlcjEiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyMiI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIzIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjQiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI2Ijo1MC4wLCJ5YXdfc2xpZGVycyI6MS4wfSwiZHVjayBtb3ZlIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6ZmFsc2UsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJ+Il0sImJvZHlfeWF3IjoiSml0dGVyIiwiYm9keV95YXdfdGlja3MiOjEyLjAsImNsZWFucmVjb3JkcyI6ZmFsc2UsImNsZWFucmVjb3Jkc19yYW5kb21fZmxpY2siOmZhbHNlLCJjbGVhbnJlY29yZHNfdXNlZmFrZWxhZyI6ZmFsc2UsImRlZmVuc2l2ZV9hY3RpdmF0aW9uX29wdGlvbnMiOlsifiJdLCJkZWZlbnNpdmVfZGlzYWJsZV9vcHRpb24iOmZhbHNlLCJkZWxheSI6dHJ1ZSwiZGVsYXlfaW50ZXJhY3Rpb25fdHlwZSI6IkNyZWF0ZW1vdmUiLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVycyI6MS4wLCJmYWtlbGltaXRfbCI6NjAuMCwiZmFrZWxpbWl0X3IiOjYwLjAsInJhbmRvbV9kZWxheV92YWx1ZV8xIjoxLjAsInJhbmRvbV9kZWxheV92YWx1ZV8yIjoxLjAsInJhbmRvbWl6YXRpb24iOjAuMCwic3dpdGNoX2RlbGF5Ijo0LjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczIiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMzIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNCI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczUiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM2IjoxLjAsInlhd19hZGQiOi0zMi4wLCJ5YXdfYWRkX3IiOjQxLjAsInlhd19oZWFkYmVoaW5kY2hlc3QiOmZhbHNlLCJ5YXdfaml0dGVyIjoiQ2VudGVyIiwieWF3X2ppdHRlcl9hZGQiOi04LjAsInlhd19qaXR0ZXJfbW9kZSI6IkRlZmF1bHQiLCJ5YXdfaml0dGVyX293bjEiOi0yNS4wLCJ5YXdfaml0dGVyX293bjIiOjMwLjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6LTE5LjAsInlhd19qaXR0ZXJfc2xpZGVyMiI6NDAuMCwieWF3X2ppdHRlcl9zbGlkZXIzIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjQiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI2Ijo1MC4wLCJ5YXdfc2xpZGVycyI6Mi4wfSwianVtcCI6eyJhbnRpYnJ1dGVmb3JjZV9lbmFibGUiOmZhbHNlLCJhbnRpYnJ1dGVmb3JjZV9tb2RpZmllcnMiOlsifiJdLCJib2R5X3lhdyI6IkppdHRlciIsImJvZHlfeWF3X3RpY2tzIjoxMi4wLCJjbGVhbnJlY29yZHMiOmZhbHNlLCJjbGVhbnJlY29yZHNfcmFuZG9tX2ZsaWNrIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3VzZWZha2VsYWciOmZhbHNlLCJkZWZlbnNpdmVfYWN0aXZhdGlvbl9vcHRpb25zIjpbIkFsd2F5cyIsIn4iXSwiZGVmZW5zaXZlX2Rpc2FibGVfb3B0aW9uIjpmYWxzZSwiZGVsYXkiOnRydWUsImRlbGF5X2ludGVyYWN0aW9uX3R5cGUiOiJOZXRfdXBkYXRlIiwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnMiOjEuMCwiZmFrZWxpbWl0X2wiOjYwLjAsImZha2VsaW1pdF9yIjo2MC4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMSI6MS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMiI6MS4wLCJyYW5kb21pemF0aW9uIjo3LjAsInN3aXRjaF9kZWxheSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczEiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMyIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMyI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczQiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM1IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNiI6MS4wLCJ5YXdfYWRkIjotMTMuMCwieWF3X2FkZF9yIjoyOC4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0IjpmYWxzZSwieWF3X2ppdHRlciI6IkNlbnRlciIsInlhd19qaXR0ZXJfYWRkIjotNy4wLCJ5YXdfaml0dGVyX21vZGUiOiJEZWZhdWx0IiwieWF3X2ppdHRlcl9vd24xIjowLjAsInlhd19qaXR0ZXJfb3duMiI6MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjEiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyMiI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIzIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjQiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI2Ijo1MC4wLCJ5YXdfc2xpZGVycyI6MS4wfSwicnVuIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6ZmFsc2UsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJ+Il0sImJvZHlfeWF3IjoiSml0dGVyIiwiYm9keV95YXdfdGlja3MiOjEyLjAsImNsZWFucmVjb3JkcyI6ZmFsc2UsImNsZWFucmVjb3Jkc19yYW5kb21fZmxpY2siOmZhbHNlLCJjbGVhbnJlY29yZHNfdXNlZmFrZWxhZyI6ZmFsc2UsImRlZmVuc2l2ZV9hY3RpdmF0aW9uX29wdGlvbnMiOlsiQWx3YXlzIiwifiJdLCJkZWZlbnNpdmVfZGlzYWJsZV9vcHRpb24iOmZhbHNlLCJkZWxheSI6dHJ1ZSwiZGVsYXlfaW50ZXJhY3Rpb25fdHlwZSI6IkNyZWF0ZW1vdmUiLCJkZWxheV9tZXRob2QiOiJSYW5kb20iLCJkZWxheV9zbGlkZXJzIjoxLjAsImZha2VsaW1pdF9sIjo2MC4wLCJmYWtlbGltaXRfciI6NjAuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzEiOjYuMCwicmFuZG9tX2RlbGF5X3ZhbHVlXzIiOjYuMCwicmFuZG9taXphdGlvbiI6OS4wLCJzd2l0Y2hfZGVsYXkiOjQuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMxIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMiI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczMiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM0IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczYiOjEuMCwieWF3X2FkZCI6LTMxLjAsInlhd19hZGRfciI6MzEuMCwieWF3X2hlYWRiZWhpbmRjaGVzdCI6ZmFsc2UsInlhd19qaXR0ZXIiOiJHaW5nZXJib21iZXIiLCJ5YXdfaml0dGVyX2FkZCI6MzYuMCwieWF3X2ppdHRlcl9tb2RlIjoiRGVmYXVsdCIsInlhd19qaXR0ZXJfb3duMSI6Mi4wLCJ5YXdfaml0dGVyX293bjIiOi0xNy4wLCJ5YXdfaml0dGVyX3NsaWRlcjEiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyMiI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIzIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjQiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI2Ijo1MC4wLCJ5YXdfc2xpZGVycyI6MS4wfSwic2xvdyB3YWxrIjp7ImFudGlicnV0ZWZvcmNlX2VuYWJsZSI6ZmFsc2UsImFudGlicnV0ZWZvcmNlX21vZGlmaWVycyI6WyJ+Il0sImJvZHlfeWF3IjoiT2ZmIiwiYm9keV95YXdfdGlja3MiOjEyLjAsImNsZWFucmVjb3JkcyI6ZmFsc2UsImNsZWFucmVjb3Jkc19yYW5kb21fZmxpY2siOmZhbHNlLCJjbGVhbnJlY29yZHNfdXNlZmFrZWxhZyI6ZmFsc2UsImRlZmVuc2l2ZV9hY3RpdmF0aW9uX29wdGlvbnMiOlsifiJdLCJkZWZlbnNpdmVfZGlzYWJsZV9vcHRpb24iOmZhbHNlLCJkZWxheSI6ZmFsc2UsImRlbGF5X2ludGVyYWN0aW9uX3R5cGUiOiJDcmVhdGVtb3ZlIiwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnMiOjEuMCwiZmFrZWxpbWl0X2wiOjMyLjAsImZha2VsaW1pdF9yIjozMi4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMSI6MS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMiI6MS4wLCJyYW5kb21pemF0aW9uIjowLjAsInN3aXRjaF9kZWxheSI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczEiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMyIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMyI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczQiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM1IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNiI6MS4wLCJ5YXdfYWRkIjotMzUuMCwieWF3X2FkZF9yIjozNS4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0IjpmYWxzZSwieWF3X2ppdHRlciI6Ik9mZiIsInlhd19qaXR0ZXJfYWRkIjowLjAsInlhd19qaXR0ZXJfbW9kZSI6IkRlZmF1bHQiLCJ5YXdfaml0dGVyX293bjEiOjAuMCwieWF3X2ppdHRlcl9vd24yIjowLjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIyIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjMiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjYiOjUwLjAsInlhd19zbGlkZXJzIjoxLjB9LCJzdGFuZCI6eyJhbnRpYnJ1dGVmb3JjZV9lbmFibGUiOmZhbHNlLCJhbnRpYnJ1dGVmb3JjZV9tb2RpZmllcnMiOlsifiJdLCJib2R5X3lhdyI6IkppdHRlciIsImJvZHlfeWF3X3RpY2tzIjoxMi4wLCJjbGVhbnJlY29yZHMiOmZhbHNlLCJjbGVhbnJlY29yZHNfcmFuZG9tX2ZsaWNrIjpmYWxzZSwiY2xlYW5yZWNvcmRzX3VzZWZha2VsYWciOmZhbHNlLCJkZWZlbnNpdmVfYWN0aXZhdGlvbl9vcHRpb25zIjpbIn4iXSwiZGVmZW5zaXZlX2Rpc2FibGVfb3B0aW9uIjpmYWxzZSwiZGVsYXkiOnRydWUsImRlbGF5X2ludGVyYWN0aW9uX3R5cGUiOiJOZXRfdXBkYXRlIiwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnMiOjEuMCwiZmFrZWxpbWl0X2wiOjYwLjAsImZha2VsaW1pdF9yIjo2MC4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMSI6MS4wLCJyYW5kb21fZGVsYXlfdmFsdWVfMiI6MS4wLCJyYW5kb21pemF0aW9uIjowLjAsInN3aXRjaF9kZWxheSI6NS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczEiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnMyIjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzMyI6MS4wLCJzd2l0Y2hfZGVsYXlfc2xpZGVyczQiOjEuMCwic3dpdGNoX2RlbGF5X3NsaWRlcnM1IjoxLjAsInN3aXRjaF9kZWxheV9zbGlkZXJzNiI6MS4wLCJ5YXdfYWRkIjotMjQuMCwieWF3X2FkZF9yIjo0MS4wLCJ5YXdfaGVhZGJlaGluZGNoZXN0IjpmYWxzZSwieWF3X2ppdHRlciI6Ik9mZiIsInlhd19qaXR0ZXJfYWRkIjowLjAsInlhd19qaXR0ZXJfbW9kZSI6IkRlZmF1bHQiLCJ5YXdfaml0dGVyX293bjEiOjAuMCwieWF3X2ppdHRlcl9vd24yIjowLjAsInlhd19qaXR0ZXJfc2xpZGVyMSI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXIyIjo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjMiOjUwLjAsInlhd19qaXR0ZXJfc2xpZGVyNCI6NTAuMCwieWF3X2ppdHRlcl9zbGlkZXI1Ijo1MC4wLCJ5YXdfaml0dGVyX3NsaWRlcjYiOjUwLjAsInlhd19zbGlkZXJzIjoxLjB9fSwidHJvbGxfYWFfb3B0aW9ucyI6IkhhbGYgU3BpbiIsInRyb2xsX2FhX3NwZWVkIjoyLjAsInlhd21vZGlmaWVyIjpbIkZvcmNlIHN0YXRpYyIsIn4iXX0seyJkaXNhYmxlX2N2YXJzIjp0cnVlLCJleHRlbmRlZF9waW5nX2Ftb3VudCI6NzIuMCwiZXh0cmFfbm90aWZpY2F0aW9uX29wdGlvbnMiOlsifiJdLCJmYXN0X2xhZGRlciI6dHJ1ZSwiZnJlZXpldGltZV9mYWtlZHVjayI6dHJ1ZSwiaGl0bG9nX2NvbG9yIjoiI0NCQjFDM0ZGIiwiaGl0bG9ncyI6WyJPbiBzY3JlZW4iLCJDb25zb2xlIiwifiJdLCJub19mYWxsIjp0cnVlLCJ0cmFzaHRhbGtfc3RhdGVzIjpbIkRlYXRoIiwiS2lsbCIsIn4iXSwidW5sb2NrX2Zha2VkdWNrX3NwZWVkIjp0cnVlfSx7IipoaXRfbWFya2VyIjoiIzgwODA4MEZGIiwiKm1hbnVhbF9hcnJvd3MiOiIjODY3Q0U3RkYiLCIqbmV0Z3JhcGhfZW5hYmxlIjoiIzlFOUJCMkZGIiwiYW5pbWF0aW9uc19mYWxsX2Ftb3VudCI6MS4wLCJhbmltYXRpb25zX2xlYW5fYW1vdW50Ijo1MC4wLCJhbmltYXRpb25zX3NsaWRlX2Ftb3VudCI6MS4wLCJhc3BlY3RfcmF0aW9fZW5hYmxlIjp0cnVlLCJhc3BlY3RyYXRpbyI6MTQwLjAsImRpc2FibGVfc2xlZXZlcyI6dHJ1ZSwiZG1naW5kaWNhdG9yIjp0cnVlLCJnaW5nZXJpbmRpY2F0b3JzIjp0cnVlLCJoaXRfbWFya2VyIjp0cnVlLCJqaXR0ZXJfbGVncyI6dHJ1ZSwiaml0dGVyX2xlZ3NfZnJvbSI6MzEuMCwiaml0dGVyX2xlZ3NfdG8iOjEuMCwia2liaXRfbWFya2VyIjp0cnVlLCJtYW51YWxfYXJyb3dzIjp0cnVlLCJuZXRncmFwaF9lbmFibGUiOmZhbHNlLCJzY29wZV9vdmVybGF5Ijp0cnVlLCJzY29wZV9vdmVybGF5X2NvbG9yIjoiI0JGQkJDRkFGIiwic2NvcGVfb3ZlcmxheV9nYXAiOjkuMCwic2NvcGVfb3ZlcmxheV9saW5lIjoxOS4wLCJzY29wZV9vdmVybGF5X3JvdGF0ZSI6ZmFsc2UsInZpZXdtb2RlbF9mb3YiOjY5My4wLCJ2aWV3bW9kZWxfa25pZmVoYW5kIjpmYWxzZSwidmlld21vZGVsX3giOjkuMCwidmlld21vZGVsX3kiOjE1LjAsInZpZXdtb2RlbF96IjoxMy4wfV0="
    }, 
    display_name_map = {}, 
    persist_data = function(_, v55, v56)
        if not v56 or type(v55) ~= "string" then
            return false;
        else
            return files.write(v55, json.stringify(v56));
        end;
    end, 
    retrieve_data = function(_, v58)
        local v59 = files.read(v58);
        return v59 and json.parse(v59) or {};
    end, 
    select_current_config = function(v60)
        local v61 = v60.data.menu.list();
        local v62 = 1;
        for v63 in pairs(v60.default_configs) do
            if v61 == v62 or v61 == 0 then
                return v60.data.menu.name(v63);
            else
                v62 = v62 + 1;
            end;
        end;
        if next(v60.storage) ~= nil then
            if v61 == v62 then
                return nil;
            else
                v62 = v62 + 1;
            end;
        end;
        for v64 in pairs(v60.storage) do
            if v61 == v62 then
                return v60.data.menu.name(v64);
            else
                v62 = v62 + 1;
            end;
        end;
        return nil;
    end, 
    refresh_ui = function(v65)
        local v66 = {};
        v65.display_name_map = {};
        for v67 in pairs(v65.default_configs) do
            local v68 = "\a" .. ui.get_style()["Link Active"]:to_hex() .. "\226\128\162  \aDEFAULT" .. v67;
            table.insert(v66, v68);
            v65.display_name_map[v68] = v67;
        end;
        if next(v65.storage) ~= nil then
            table.insert(v66, "\a" .. ui.get_style()["Link Active"]:to_hex() .. "---------------------");
        end;
        for v69 in pairs(v65.storage) do
            table.insert(v66, v69);
            v65.display_name_map[v69] = v69;
        end;
        v65.data.menu.list:update(v66);
        v65:persist_data(v65.config_file, v65.storage);
        v65:select_current_config();
        return v65;
    end, 
    initialize = function(v70)
        v70.storage = v70:retrieve_data(v70.config_file) or {};
        v70:refresh_ui();
        return v70;
    end, 
    encode = function(_, v72)
        -- upvalues: l_base64_0 (ref)
        return l_base64_0.encode(json.stringify(v72));
    end, 
    decode = function(_, v74)
        -- upvalues: l_base64_0 (ref)
        return json.parse(l_base64_0.decode(v74));
    end, 
    export_config = function(v75)
        -- upvalues: v5 (ref)
        return v75:encode((v5.setup({
            [1] = v75.data.menu
        }, true):save()));
    end, 
    export = function(v76, v77, ...)
        local v78 = "export_" .. v77;
        if not v76[v78] then
            return nil, "Invalid export type";
        else
            local l_status_0, l_result_0 = pcall(v76[v78], v76, ...);
            if not l_status_0 then
                print("Export error:", l_result_0);
                return nil;
            else
                return "{ambani:" .. v77 .. "}:" .. l_result_0;
            end;
        end;
    end, 
    import_config = function(v81, v82)
        -- upvalues: v5 (ref)
        local v83 = v81:decode(v82);
        v5.setup({
            [1] = v81.data.menu
        }, true):load(v83);
    end, 
    validate_import = function(_, v85, v86)
        local v87 = v85:match("{ambani:(.+)}");
        return v87 and v87 == v86;
    end, 
    import = function(v88, v89, v90, ...)
        if not v88:validate_import(v89, v90) then
            return error("This is not valid ambani data. 1");
        else
            local v91 = v89:gsub("{ambani:" .. v90 .. "}:", "");
            local v92 = "import_" .. v90;
            local l_status_1, l_result_1 = pcall(v88[v92], v88, v91, ...);
            if not l_status_1 then
                print(l_result_1);
                return error("This is not valid ambani data. 2");
            else
                return true;
            end;
        end;
    end, 
    save = function(v95)
        local v96 = v95.data.menu.name();
        if not v96:match("%w") then
            return print("Invalid config name");
        elseif v95.default_configs[v96] then
            return print("Cannot overwrite default config: " .. v96);
        else
            local v97 = v95:export("config");
            v95.storage[v96] = v97;
            v95:refresh_ui();
            return true;
        end;
    end, 
    load = function(v98)
        local v99 = v98.data.menu.name();
        local v100 = v98.storage[v99] or v98.default_configs[v99];
        if not v100 then
            return print("Invalid config name");
        else
            return v98:import(v100, "config");
        end;
    end, 
    delete = function(v101)
        local v102 = v101.data.menu.name();
        if v101.default_configs[v102] then
            return print("Cannot delete default config: " .. v102);
        elseif not v101.storage[v102] then
            return print("Invalid config name");
        else
            v101.storage[v102] = nil;
            v101:refresh_ui();
            return true;
        end;
    end
}):struct("helpers")({
    last_tick = 0, 
    last_cheat = "neverlose", 
    contains = function(_, v104, v105)
        for _, v107 in pairs(v104) do
            if v107 == v105 then
                return true;
            end;
        end;
        return false;
    end, 
    easeInOut = function(_, v109)
        return v109 > 0.5 and 4 * (v109 - 1) ^ 3 + 1 or 4 * v109 ^ 3;
    end, 
    clamp = function(_, v111, v112, v113)
        assert(v111 and v112 and v113, "not very useful error message here");
        if v113 < v112 then
            local l_v113_0 = v113;
            v113 = v112;
            v112 = l_v113_0;
        end;
        return math.max(v112, math.min(v113, v111));
    end, 
    in_air = function(_, v116)
        local l_m_fFlags_0 = v116.m_fFlags;
        return bit.band(l_m_fFlags_0, 1) == 0;
    end, 
    in_duck = function(_, v119)
        local l_m_fFlags_1 = v119.m_fFlags;
        return bit.band(l_m_fFlags_1, 4) == 4;
    end, 
    get_state = function(v121)
        local v122 = entity.get_local_player();
        local v123 = v122.m_vecVelocity:length2d();
        if v121:in_air(v122) or v121.antiaim.state.air then
            return v121:in_duck(v122) and "crouch jumping" or "jumping";
        elseif v123 > 3 and (v121:in_duck(v122) or v121.ref.rage.fd:get()) then
            return "crouch moving";
        elseif v121.ref.antiaim.slowwalk:get() then
            return "walking";
        elseif v121:in_duck(v122) or v121.ref.rage.fd:get() then
            return "crouching";
        else
            return v123 > 1.5 and "running" or "standing";
        end;
    end, 
    vec_closest_point_on_ray = function(_, v125, v126, v127)
        local v128 = v125 - v126;
        local v129 = v127 - v126;
        local v130 = #v129;
        v129.x = v129.x / v130;
        v129.y = v129.y / v130;
        v129.z = v129.z / v130;
        local v131 = v129.x * v128.x + v129.y * v128.y + v129.z * v128.z;
        if v131 < 0 then
            return v126;
        elseif v130 < v131 then
            return v127;
        else
            return vector(v126.x + v129.x * v131, v126.y + v129.y * v131, v126.z + v129.z * v131);
        end;
    end, 
    bullet_impact = function(v132, v133, v134, v135)
        v132.distance = v132:vec_closest_point_on_ray(v133, v134, v135):dist(v133);
        if v132.distance > 55 then
            return;
        else
            v132.tick_work = globals.tickcount;
            return;
        end;
    end, 
    gradienttext = function(_, _, v138, v139, v140, v141, v142, v143, v144, v145, v146)
        local v147 = "";
        local v148 = globals.realtime / 2 % 1.2 * 2 - 1.2;
        for v149 = 0, #v138 do
            local v150 = v138:sub(v149, v149);
            local v151 = v149 / #v138;
            local l_v139_0 = v139;
            local l_v140_0 = v140;
            local l_v141_0 = v141;
            local l_v142_0 = v142;
            local v156 = v151 - v148;
            if v156 >= 0 and v156 <= 1.4 then
                if v156 > 0.7 then
                    v156 = 1.4 - v156;
                end;
                local v157 = v143 - l_v139_0;
                local v158 = v144 - l_v140_0;
                local v159 = v145 - l_v141_0;
                local v160 = v146 - l_v142_0;
                l_v139_0 = l_v139_0 + v157 * v156 / 0.8;
                l_v140_0 = l_v140_0 + v158 * v156 / 0.8;
                l_v141_0 = l_v141_0 + v159 * v156 / 0.8;
                l_v142_0 = l_v142_0 + v160 * v156 / 0.8;
            end;
            v147 = v147 .. "\a" .. color(l_v139_0, l_v140_0, l_v141_0, l_v142_0):to_hex() .. v150;
        end;
        return v147;
    end, 
    get_team = function(_)
        return entity.get_local_player().m_iTeamNum == 2 and "terrorist" or "counter-terrorist";
    end, 
    get_charge = function()
        local _ = entity.get_local_player();
        local l_m_flSimulationTime_0 = entity.get_local_player().m_flSimulationTime;
        return globals.tickcount - l_m_flSimulationTime_0 / globals.tickinterval;
    end, 
    normalize = function(_, v165)
        v165 = (v165 % 360 + 360) % 360;
        if v165 > 180 then
            v165 = v165 - 360;
        end;
        return v165;
    end, 
    detection = function(v166)
        -- upvalues: v6 (ref)
        local l_tickcount_0 = globals.tickcount;
        local v168 = entity.get_threat();
        v166.last_tick = l_tickcount_0;
        v166.last_threat = v168;
        local v169 = v6.get_software(v168);
        local v170 = v169 and tostring(v169.signature) or nil;
        if v170 == "GS" then
            v166.last_cheat = "gamesense";
        elseif v170 == "NL" then
            v166.last_cheat = "neverlose";
        else
            v166.last_cheat = "neverlose";
        end;
        return v166.last_cheat;
    end
}):struct("antiaim")({
    state = {
        force_side = 0, 
        counter2 = 0, 
        defensive_after = 0, 
        last_simtime = 0, 
        defensive_state = false, 
        activation_delay = 0, 
        current_safe_yaw = 0, 
        yaw_hold_ticks = 0, 
        current_slider = 1, 
        counter = 0, 
        round_ended = false, 
        last_rand = 0, 
        inverter_override_ticks = 0, 
        body_yaw_false_ticks = 0, 
        defensive_switch = false, 
        body_yaw_switch = false, 
        body_yaw_side = 0, 
        side = 0, 
        body_yaw_switch_delay = 0, 
        modifier_switch_delay = 0, 
        switch_delay = 0, 
        hold_delay = 0, 
        hold_time = 0, 
        in_air = false, 
        was_defensive_last_tick = false, 
        spam_fd_state = false, 
        spam_fd_tick = 0, 
        want_fd_true = false, 
        landed = globals.tickcount, 
        ab = {
            bruted_last_time = 0, 
            should_swap = {}, 
            time = {}, 
            jitteralgo = {}, 
            fakelimit = {}, 
            delay = {}
        }
    }, 
    run = function(v171, v172)
        v171:apply_anti_aim(v172);
    end, 
    airlag = function(_, v174)
        if not entity.get_local_player():is_alive() or not globals.is_in_game then
            return;
        else
            if globals.tickcount % 10 == 0 then
                v174.force_defensive = true;
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override(math.random(10));
                rage.exploit:force_teleport();
                rage.exploit:allow_charge(false);
            else
                rage.exploit:allow_charge(true);
                rage.exploit:force_charge();
            end;
            return;
        end;
    end, 
    apply_anti_aim = function(v175, v176, _)
        if not entity.get_local_player():is_alive() or not globals.is_in_game then
            return;
        else
            v175.state.in_air = v176.in_jump;
            if v175.data.airlag:get() then
                v175:airlag(v176);
            end;
            local v178 = v175.helpers:get_state();
            local v179 = v175.helpers:get_team();
            local v180 = v175.data.menu[v179][v178];
            if v175:handle_special_modes(v180) then
                return;
            else
                v175:handle_side_switching(v176, v180);
                local v181, _ = v175:calculate_offsets(v180);
                v175.ref.antiaim.inverter:override(v175.state.side == 0);
                v175.ref.antiaim.yawoffset:override(v181);
                if v180.limit:get() == 61 then
                    v175.ref.antiaim.leftfake:override(utils.random_int(v180.randomize_limit_value:get(), v180.randomize_limit_value2:get()));
                    v175.ref.antiaim.rightfake:override(utils.random_int(v180.randomize_limit_value:get(), v180.randomize_limit_value2:get()));
                else
                    v175.ref.antiaim.leftfake:override(v180.limit:get());
                    v175.ref.antiaim.rightfake:override(v180.limit:get());
                end;
                v175.ref.antiaim.bodyyawopt:override({});
                if v180.body_yaw:get() == "tick" then
                    local v183 = math.random(1, 8);
                    if globals.tickcount % math.random(v180.tick_speed_1:get(), v180.tick_speed_2:get()) == 0 then
                        v175.state.body_yaw_switch = not v175.state.body_yaw_switch;
                        v175.state.body_yaw_false_ticks = 0;
                    end;
                    if not v175.state.body_yaw_switch then
                        v175.state.body_yaw_false_ticks = v175.state.body_yaw_false_ticks + 1;
                    end;
                    if v175.state.body_yaw_switch then
                        v175.state.inverter_override_ticks = v175.state.inverter_override_ticks + 1;
                    end;
                    if v175.state.body_yaw_false_ticks >= math.random(2, 5) then
                        v175.state.body_yaw_switch = true;
                        v175.state.body_yaw_false_ticks = 0;
                    end;
                    v183 = (not (v183 ~= 1) or v183 == 2) and 9 or v183 + 1;
                    if v175.state.body_yaw_switch and v175.state.inverter_override_ticks < math.random(5, 9) and v175.state.inverter_override_ticks > 4 then
                        v175.ref.antiaim.inverter:override(v176.command_number % v183 == 0);
                        v175.state.inverter_override_ticks = 0;
                    end;
                    v175.ref.antiaim.bodyyaw:override(v175.state.body_yaw_switch);
                elseif v180.body_yaw:get() == "beast" then
                    local v184 = v175.state.side == 0;
                    if v175.state.counter2 % math.random(6, 8) == 0 then
                        v184 = not v184;
                    end;
                    v175.ref.antiaim.inverter:override(v184);
                    v175.ref.antiaim.bodyyaw:override(true);
                else
                    v175.ref.antiaim.bodyyaw:override(true);
                end;
                if v180.defensive_handler:get() then
                    local v185 = entity.get_local_player():get_player_weapon();
                    if v185 ~= nil then
                        v175.ref.rage.dtlag:override("disabled");
                        if math.max(v185.m_flNextPrimaryAttack, entity.get_local_player().m_flNextAttack) - globals.tickinterval - globals.curtime < 0 or entity.get_local_player().m_flNextAttack > globals.curtime then
                            v175.ref.rage.dtlag:override("always on");
                        else
                            v175.ref.rage.dtlag:override("disabled");
                        end;
                    end;
                end;
                v175.ref.antiaim.enable:override(true);
                v175.ref.antiaim.pitch:override("down");
                v175.ref.antiaim.yawtarget:override("At Target");
                v175.ref.antiaim.yaw:override("Backward");
                v175:handle_safehead();
                v175:handle_manual_aa();
                v175:handle_freestanding();
                return;
            end;
        end;
    end, 
    get_algorithmic_delay = function(v186, v187)
        local v188 = entity.get_local_player();
        if not v188 then
            return 14;
        else
            local l_m_fFlags_2 = v188.m_fFlags;
            local v190 = bit.band(l_m_fFlags_2, 1) == 0 and 2 or 0;
            local v191 = math.abs(globals.curtime - (v186.state.ab.bruted_last_time or 0)) < 0.4 and 6 or 0;
            local v192 = math.abs(rage.antiaim:get_max_desync()) / 60 * 6;
            local v193 = v187.command_number % 3 == 0 and 2 or 0;
            local v194 = v186.defensive.defensive > 0;
            local v195 = v194 and 4 or 0;
            local v196 = 0;
            if v186.state.was_defensive_last_tick and not v194 then
                v196 = math.random(-3, 3);
            end;
            v186.state.was_defensive_last_tick = v194;
            local v197 = 0;
            local v198 = 0;
            local v199 = 0;
            local v200 = v188.m_flSimulationTime or 0;
            if v186.state.last_simtime ~= v200 then
                v186.state.last_simtime = v200;
                v186.state.last_angle_update = globals.curtime;
                v199 = math.random(1, 3);
            end;
            local v201 = utils.net_channel();
            local _ = globals.curtime - (v186.state.last_angle_update or 0);
            if not math.clamp(v201.latency[0] + v201.latency[1], 0.001, 0.2) then
                local _ = 0.03;
            end;
            local v204 = v199 + v192 + v193 + v190 + v191 + v195 + v196 + v197 + v198;
            return math.floor(v204);
        end;
    end, 
    reset_antibruteforce = function(v205)
        v205.state.ab.bruted_last_time = 0;
        v205.state.ab.time = {};
        v205.state.ab.jitteralgo = {};
        v205.state.ab.delay = {};
        v205.state.ab.fakelimit = {};
        v205.state.ab.should_swap = {};
    end, 
    shot_detection = function(v206, v207)
        if tick_work == globals.tickcount then
            return;
        elseif not globals.is_connected then
            return;
        elseif not entity.get_local_player():is_alive() then
            return;
        elseif not entity.get(v207.userid, true) then
            return;
        elseif not v207.userid then
            return;
        elseif entity.get(v207.userid, true):is_alive() == false then
            return;
        elseif entity.get(v207.userid, true):is_dormant() then
            return;
        elseif not entity.get(v207.userid, true):is_enemy() then
            return;
        else
            if math.abs(v206.state.ab.bruted_last_time - globals.curtime) > 0.25 then
                local v208 = vector(v207.x, v207.y, v207.z);
                local v209 = entity.get(v207.userid, true):get_eye_position();
                local v210 = entity.get_local_player():get_eye_position();
                local _ = v206.helpers:bullet_impact(v210, v209, v208);
                local v212 = entity.get(v207.userid, true);
                if v206.helpers.distance < 70 then
                    v206.state.ab.bruted_last_time = globals.curtime;
                    v206.state.ab.time[v212] = globals.curtime + 5;
                    v206.state.ab.jitteralgo[v212] = math.random(-12, 14);
                    v206.state.ab.delay[v212] = math.random(-2, 4);
                    v206.state.ab.fakelimit[v212] = math.random(10, 60);
                    v206.state.ab.should_swap[v212] = true;
                end;
            end;
            return;
        end;
    end, 
    handle_side_switching = function(v213, v214, v215)
        if v214.choked_commands ~= 0 then
            return;
        else
            v213.state.switch_delay = v213.state.switch_delay + 1;
            if v215.jitter.delay_options:get() == "cheat based" then
                local v216 = v213.helpers:detection();
                if v215.jitter.delay_type:get() == "fixed" then
                    if v213.state.switch_delay >= v215.jitter["fixed_" .. v216]:get() then
                        v213.state.switch_delay = 0;
                        v213.state.side = 1 - v213.state.side;
                    end;
                elseif v215.jitter.delay_type:get() == "random" and v213.state.switch_delay >= utils.random_int(v215.jitter["min_" .. v216]:get(), v215.jitter["max_" .. v216]:get()) then
                    v213.state.switch_delay = 0;
                    v213.state.side = 1 - v213.state.side;
                end;
            elseif v215.jitter.delay_options:get() == "algorithm" then
                if v213:get_algorithmic_delay(v214) <= v213.state.switch_delay then
                    v213.state.switch_delay = 0;
                    v213.state.side = 1 - v213.state.side;
                end;
            elseif v215.jitter.delay_type:get() == "fixed" then
                if v213.state.switch_delay >= v215.jitter.normal_fixed:get() then
                    v213.state.switch_delay = 0;
                    v213.state.side = 1 - v213.state.side;
                end;
            elseif v215.jitter.delay_type:get() == "random" and v213.state.switch_delay >= utils.random_int(v215.jitter.normal_min:get(), v215.jitter.normal_max:get()) then
                v213.state.switch_delay = 0;
                v213.state.side = 1 - v213.state.side;
            end;
            return;
        end;
    end, 
    calculate_offsets = function(v217, v218)
        local v219 = 0;
        local v220 = 0;
        if globals.choked_commands == 0 then
            v217.state.counter2 = v217.state.counter2 + 1;
        end;
        if v218.jitter:get() == "offset" then
            v217.ref.antiaim.yawmodifier:override("off");
            v217.ref.antiaim.yawmodifieramount:override(0);
            v219 = v219 + (v217.state.side == 1 and v218.jitter.jitter_value:get() or 0);
        elseif v218.jitter:get() == "center" then
            v217.ref.antiaim.yawmodifier:override("off");
            v217.ref.antiaim.yawmodifieramount:override(0);
            v219 = v219 + (v217.state.side == 1 and v218.jitter.jitter_value:get() / 2 or -v218.jitter.jitter_value:get() / 2);
        elseif v218.jitter:get() == "random" then
            v217.ref.antiaim.yawmodifier:override("off");
            v217.ref.antiaim.yawmodifieramount:override(0);
            local v221 = math.random(0, v218.jitter.jitter_value:get()) - v218.jitter.jitter_value:get() / 1.5;
            v219 = v219 + v221;
            v217.state.last_rand = v221;
        elseif v218.jitter:get() == "sanya" then
            v217.ref.antiaim.yawmodifier:override(v217.state.counter2 % 4 == 0 and "Center" or math.random(0, 1) == 0 and "5-Way" or "3-Way");
            v217.ref.antiaim.yawmodifieramount:override(v218.jitter.jitter_value:get() + math.random(-1, 3) or v218.jitter.jitter_value:get());
            v219 = v219 + (v217.state.side == 1 and v218.jitter.jitter_value:get() / 10 or -v218.jitter.jitter_value:get() / 10);
        elseif v218.jitter:get() == "spin" then
            v217.ref.antiaim.yawmodifier:override("spin");
            v217.ref.antiaim.yawmodifieramount:override(v218.jitter.jitter_value:get());
        else
            v217.ref.antiaim.yawmodifier:override("off");
            v217.ref.antiaim.yawmodifieramount:override(0);
        end;
        local v222 = utils.random_int(-v218.yaw_base.randomizer:get(), v218.yaw_base.randomizer:get());
        v219 = v219 + (v217.state.side == 0 and v218.yaw_left.value + v222 or v218.yaw_right.value + v222);
        if v218.fakelimit_options == "jitter" then
            v220 = v217.state.side == 0 and v218.fakelimit or v218.fakelimit / 2;
        elseif v218.fakelimit_options == "L&R" then
            v220 = v217.state.side == 0 and v218.fakelimit_l or v218.fakelimit_r;
        else
            v220 = v218.fakelimit;
        end;
        return v219, v220;
    end, 
    handle_special_modes = function(v223, _)
        if not entity.get_local_player() then
            return;
        else
            local v225 = entity.get_game_rules();
            if v223.helpers:contains(v223.data.addons:get(), "warmup aa") and v225 and v225.m_bWarmupPeriod then
                v223.ref.antiaim.pitch:override("Disabled");
                local v226 = globals.tickcount * 32 % 360;
                v223.ref.antiaim.yawoffset:override(v226);
                v223.ref.antiaim.leftfake:override(0);
                v223.ref.antiaim.rightfake:override(0);
                v223.ref.antiaim.bodyyaw:override(false);
                v223.ref.antiaim.inverter:override(false);
                v223.ref.antiaim.hidden:override(false);
                v223.ref.antiaim.yawmodifier:override("Offset");
                v223.ref.antiaim.yawmodifieramount:override(0);
                return true;
            elseif v223.state.round_ended and not entity.get_threat(true) and v223.helpers:contains(v223.data.addons:get(), "round end aa") and not v225.m_bWarmupPeriod then
                v223.ref.antiaim.pitch:override("Disabled");
                local v227 = globals.tickcount * 32 % 360;
                v223.ref.antiaim.yawoffset:override(v227);
                v223.ref.antiaim.leftfake:override(0);
                v223.ref.antiaim.rightfake:override(0);
                v223.ref.antiaim.inverter:override(false);
                v223.ref.antiaim.hidden:override(false);
                v223.ref.antiaim.bodyyaw:override(false);
                v223.ref.antiaim.yawmodifier:override("Offset");
                v223.ref.antiaim.yawmodifieramount:override(0);
                return true;
            else
                return false;
            end;
        end;
    end, 
    handle_manual_aa = function(v228)
        local v229 = v228.data.menu.manual:get();
        if v229 == "left" then
            v228.ref.antiaim.yawoffset:override(-90);
            v228.ref.antiaim.freestanding:override(false);
            v228.ref.antiaim.yawtarget:override("Local view");
        elseif v229 == "right" then
            v228.ref.antiaim.yawoffset:override(90);
            v228.ref.antiaim.freestanding:override(false);
            v228.ref.antiaim.yawtarget:override("Local view");
        elseif v229 == "forward" then
            v228.ref.antiaim.yawoffset:override(180);
            v228.ref.antiaim.freestanding:override(false);
            v228.ref.antiaim.yawtarget:override("Local view");
        end;
    end, 
    handle_freestanding = function(v230)
        local v231 = v230.helpers:get_state();
        if v230.data.freestanding:get() and not v230.helpers:contains(v230.data.freestanding.disablers:get(), v231) and v230.data.menu.manual:get() == "backward" then
            v230.ref.antiaim.freestanding:override(true);
            v230.ref.antiaim.yawoffset:override(5);
            v230.ref.antiaim.yawmodifier:override("Offset");
            v230.ref.antiaim.yawmodifieramount:override(0);
            v230.ref.antiaim.leftfake:override(60);
            v230.ref.antiaim.rightfake:override(60);
            v230.ref.antiaim.inverter:override(math.random(0, 1) == 0);
            v230.ref.antiaim.hidden:override(false);
        else
            v230.ref.antiaim.freestanding:override(false);
        end;
    end, 
    handle_safehead = function(v232)
        local v233 = entity.get_local_player():get_player_weapon();
        local v234 = "";
        if v233 ~= nil then
            v234 = v233:get_classname();
        end;
        if v232.helpers:contains(v232.data.addons:get(), "safe head") and (v234 == "CKnife" or v234 == "CWeaponTaser") then
            v232.ref.antiaim.yawoffset:override(5);
            v232.ref.antiaim.yawmodifier:override("Offset");
            v232.ref.antiaim.yawmodifieramount:override(0);
            v232.ref.antiaim.leftfake:override(0);
            v232.ref.antiaim.rightfake:override(0);
            v232.ref.antiaim.inverter:override(false);
            v232.ref.antiaim.hidden:override(false);
        end;
    end
}):struct("hitlogs")({
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
    main = function(v235, v236)
        local _ = entity.get_local_player();
        local v238 = entity.get(v236.target);
        local l_damage_0 = v236.damage;
        local l_wanted_damage_0 = v236.wanted_damage;
        local v241 = v235.hitgroup_str[v236.wanted_hitgroup];
        local l_hitchance_0 = v236.hitchance;
        local l_state_0 = v236.state;
        local l_backtrack_0 = v236.backtrack;
        local v245 = v236.spread or 0;
        if not v238 then
            return;
        else
            local l_m_iHealth_0 = v238.m_iHealth;
            local v247 = v235.hitgroup_str[v236.hitgroup];
            local v248 = "708ee0ff";
            local v249 = "d65151ff";
            if l_state_0 == nil then
                local _ = string.format("\a9994ffff" .. ui.get_icon("crosshairs") .. "\affffffff Hit \a9994ffff%s\affffffff in the \a9994ffff%s\affffffff for \a9994ffff%d\affffffff(%.f) damage (hp: \a9994ffff%d\affffffff) (bt: \a9994ffff%s\affffffff)", v238:get_name(), v247, l_damage_0, l_wanted_damage_0, l_m_iHealth_0, l_backtrack_0);
                print_dev(("\affffffff\a" .. v248 .. "ambani bita\affffffff Hit \a" .. v248 .. "%s\affffffff's \a" .. v248 .. "%s\affffffff for \a" .. v248 .. "%d\affffffff(%.f) damage (hp: %d) (bt: \a" .. v248 .. "%s\affffffff) (spread: \a" .. v248 .. "%.2f\194\176\affffffff)"):format(v238:get_name(), v247, l_damage_0, l_wanted_damage_0, l_m_iHealth_0, l_backtrack_0, v245));
                print_raw(("\affffffff\a" .. v248 .. "ambani bita\affffffff Hit \a" .. v248 .. "%s\affffffff's \a" .. v248 .. "%s\affffffff for \a" .. v248 .. "%d\affffffff(%.f) damage (hp: %d) (bt: \a" .. v248 .. "%s\affffffff) (spread: \a" .. v248 .. "%.2f\194\176\affffffff)"):format(v238:get_name(), v247, l_damage_0, l_wanted_damage_0, l_m_iHealth_0, l_backtrack_0, v245));
            else
                local _ = string.format("\aff9494ff" .. ui.get_icon("circle-xmark") .. " \affffffffMissed \aff9494ff%s\affffffff in the \aff9494ff%s\affffffff due to \aff9494ff%s\affffffff (hc: \aff9494ff%.f\affffffff) (damage: \aff9494ff%.f\affffffff) (bt: \aff9494ff%.f\affffffff)", v238:get_name(), v241, l_state_0, l_hitchance_0, l_wanted_damage_0, l_backtrack_0);
                print_dev(("\affffffff\a" .. v249 .. "ambani bita\affffffff Missed \a" .. v249 .. "%s\affffffff's \a" .. v249 .. "%s\affffffff due to \a" .. v249 .. "%s\affffffff (hc: \a" .. v249 .. "%.f\affffffff) (damage: \a" .. v249 .. "%.f\affffffff) (bt: \a" .. v249 .. "%.f\affffffff) (spread: \a" .. v249 .. "%.2f\194\176\affffffff)"):format(v238:get_name(), v241, l_state_0, l_hitchance_0, l_wanted_damage_0, l_backtrack_0, v245));
                print_raw(("\affffffff\a" .. v249 .. "ambani bita\affffffff Missed \a" .. v249 .. "%s\affffffff's \a" .. v249 .. "%s\affffffff due to \a" .. v249 .. "%s\affffffff (hc: \a" .. v249 .. "%.f\affffffff) (damage: \a" .. v249 .. "%.f\affffffff) (bt: \a" .. v249 .. "%.f\affffffff) (spread: \a" .. v249 .. "%.2f\194\176\affffffff)"):format(v238:get_name(), v241, l_state_0, l_hitchance_0, l_wanted_damage_0, l_backtrack_0, v245));
            end;
            return;
        end;
    end, 
    on_item_purchase = function(v252, v253)
        local v254 = entity.get(v253.userid, true);
        if not v254:is_enemy() then
            return;
        else
            local v255 = v254:get_name();
            local l_weapon_0 = v253.weapon;
            local v257 = v252.ui.menu.misc.hitlog_color:get_color():to_hex();
            if l_weapon_0 == "weapon_unknown" then
                l_weapon_0 = "weapon_revolver";
            end;
            print_dev(string.format("\affffffff\a" .. v257 .. "ambani bita\affffffff \a" .. v257 .. "%s\a" .. "\affffffff bought \a" .. v257 .. "%s", v255, l_weapon_0));
            print_raw(string.format("\affffffff\a" .. v257 .. "ambani bita\affffffff \a" .. v257 .. "%s\a" .. "\affffffff bought \a" .. v257 .. "%s", v255, l_weapon_0));
            return;
        end;
    end
}):struct("visual")({
    alpha_smoother = l_smoothy_0.new(0), 
    aspectratio_viewmodel = function(v258)
        cvar.sv_competitive_minspec:int(0);
        cvar.viewmodel_fov:float(v258.data.menu.viewmodel.fov:get() * 0.1);
        cvar.viewmodel_offset_x:float(v258.data.menu.viewmodel.x:get() * 0.1);
        cvar.viewmodel_offset_y:float(v258.data.menu.viewmodel.y:get() * 0.1);
        cvar.viewmodel_offset_z:float(v258.data.menu.viewmodel.z:get() * 0.1);
        cvar.r_aspectratio:float(v258.data.menu.aspect_ratio.amount:get() * 0.01);
    end, 
    scope_overlay = function(v259)
        if v259.data.menu.customscope:get() then
            local v260 = v259.data.menu.customscope.color:get_color();
            local v261 = entity.get_local_player();
            if not v261 or not v261:is_alive() then
                return;
            elseif not v261.m_bIsScoped then
                return;
            else
                local v262 = v259.alpha_smoother(0.05, v261.m_bIsScoped);
                if v262 == 0 then
                    return;
                else
                    local v263 = v259.data.menu.customscope.gap:get();
                    if v259.data.menu.customscope.rotate:get() then
                        v263 = math.max(v263, 20);
                    end;
                    local v264 = v259.data.menu.customscope.line:get() * 5;
                    local l_v263_0 = v263;
                    local v266 = render.screen_size();
                    local v267 = v266 * 0.5;
                    local v268 = math.floor(v264 * v266.y / 1080);
                    local v269 = math.floor(l_v263_0 * v266.y / 1080);
                    local v270 = v260:clone();
                    local v271 = v260:clone();
                    v270.a = v270.a * v262;
                    v271.a = 0;
                    if v259.data.menu.customscope.rotate:get() then
                        render.push_rotation(45);
                    end;
                    render.gradient(vector(v267.x, v267.y - v269 + 1), vector(v267.x + 1, v267.y - (v268 - v269)), v270, v270, v271, v271);
                    render.gradient(vector(v267.x, v267.y + v269), vector(v267.x + 1, v267.y + (v268 - v269)), v270, v270, v271, v271);
                    render.gradient(vector(v267.x - v269 + 1, v267.y), vector(v267.x - (v268 - v269), v267.y + 1), v270, v271, v270, v271);
                    render.gradient(vector(v267.x + v269, v267.y), vector(v267.x + (v268 - v269), v267.y + 1), v270, v271, v270, v271);
                    if v259.data.menu.customscope.rotate:get() then
                        render.pop_rotation();
                    end;
                end;
            end;
        end;
    end
}):struct("defensive")({
    cmd = 0, 
    defensive = 0, 
    max_tickbase = 0, 
    on_createmove = function(v272, _)
        local l_m_nTickBase_0 = entity.get_local_player().m_nTickBase;
        if math.abs(l_m_nTickBase_0 - v272.max_tickbase) > 64 then
            v272.max_tickbase = 0;
        end;
        local v275 = 0;
        if v272.max_tickbase < l_m_nTickBase_0 then
            v272.max_tickbase = l_m_nTickBase_0;
        elseif l_m_nTickBase_0 < v272.max_tickbase then
            v275 = math.min(14, math.max(0, v272.max_tickbase - l_m_nTickBase_0 - 1));
        end;
        v272.defensive = v275;
    end
}):struct("animations")({
    animations = function(v276)
        -- upvalues: l_lambotruck_0 (ref)
        local v277 = entity.get_local_player();
        if v277 == nil then
            return;
        else
            v277.m_flPoseParameter[6] = v276.data.menu.animations_fall_amount:get() / 100;
            v277.m_flPoseParameter[0] = v276.data.menu.animations_slide_amount:get() / 40;
            if v276.data.menu.jitter_legs:get() then
                v277.m_flPoseParameter[0] = globals.tickcount % 4 >= 2 and v276.data.menu.jitter_legs_from:get() or v276.data.menu.jitter_legs_to:get() * 3 / (globals.tickcount % 8 >= 4 and 400 or 200);
                v276.ref.antiaim.legs:override(math.random(0, 1) == 0 and "default" or "sliding");
            else
                v276.ref.antiaim.legs:override();
            end;
            l_lambotruck_0.animation.overlay(v277[0], 12).m_flWeight = v276.data.menu.animations_lean_amount:get() / 100;
            return;
        end;
    end
}):struct("no_fall_damage")({
    trace_fall = function(_, v279, v280)
        local v281 = math.pi * 2;
        local v282 = v281 / 8;
        if entity.get_local_player() ~= nil then
            local v283 = entity.get_local_player():get_origin();
            for v284 = 0, v281, v282 do
                local v285 = math.sin(v284);
                local v286 = math.cos(v284);
                local v287 = v283.x + v286 * 10;
                local v288 = v283.y + v285 * 10;
                local v289 = vector(v287, v288, v283.z);
                local v290 = v289:clone();
                v290.z = v290.z - v280;
                if utils.trace_line(v289, v290, v279).fraction ~= 1 then
                    return true;
                end;
            end;
        end;
        return false;
    end, 
    no_fall_damage = function(v291, v292)
        local v293 = entity.get_local_player();
        if v291.data.menu.no_fall_damage:get() then
            if v293 == nil then
                return;
            elseif v293.m_vecVelocity.z >= -500 then
                state = false;
                return;
            else
                if v291:trace_fall(v293, 15) then
                    state = false;
                elseif v291:trace_fall(v293, 75) then
                    state = true;
                end;
                v292.in_duck = state;
            end;
        end;
    end
}):struct("fast_ladder")({
    ladder_status = false, 
    fast_ladder = function(v294, v295)
        local v296 = entity.get_local_player();
        if (v296.m_MoveType == 9 and common.is_button_down(87) or v294.ladder_status) and v294.data.menu.fast_ladder:get() then
            v295.view_angles.y = math.floor(v295.view_angles.y + 0.5);
            v295.roll = 0;
            if v295.view_angles.x < 45 then
                v295.view_angles.x = 89;
                v295.in_moveright = 1;
                v295.in_moveleft = 0;
                v295.in_forward = 0;
                v295.in_back = 1;
                if v295.sidemove == 0 then
                    v295.view_angles.y = v295.view_angles.y + 90;
                elseif v295.sidemove < 0 then
                    v295.view_angles.y = v295.view_angles.y + 150;
                elseif v295.sidemove > 0 then
                    v295.view_angles.y = v295.view_angles.y + 30;
                end;
            end;
        elseif (v296.m_MoveType == 9 and common.is_button_down(83) or v294.ladder_status) and v294.data.menu.fast_ladder:get() then
            v295.view_angles.y = math.floor(v295.view_angles.y + 0.5);
            v295.roll = 0;
            if v295.view_angles.x < 45 then
                v295.view_angles.x = 89;
                v295.in_moveright = 0;
                v295.in_moveleft = 1;
                v295.in_forward = 1;
                v295.in_back = 0;
                if v295.sidemove == 0 then
                    v295.view_angles.y = v295.view_angles.y + 90;
                elseif v295.sidemove < 0 then
                    v295.view_angles.y = v295.view_angles.y + 150;
                elseif v295.sidemove > 0 then
                    v295.view_angles.y = v295.view_angles.y + 30;
                end;
            end;
        end;
    end
});
for _, v306 in ipairs({
    [1] = {
        [1] = "load", 
        [2] = function()
            -- upvalues: v297 (ref)
            v297.menu:render();
            v297.config:initialize();
        end
    }, 
    [2] = {
        [1] = "level_init", 
        [2] = function()
            -- upvalues: v297 (ref)
            v297.antiaim.state.defensive_after = false;
            v297.antiaim.state.defensive_after = 0;
        end
    }, 
    [3] = {
        [1] = "bullet_impact", 
        [2] = function(v298)
            -- upvalues: v297 (ref)
            v297.antiaim:shot_detection(v298);
        end
    }, 
    [4] = {
        [1] = "createmove", 
        [2] = function(v299)
            -- upvalues: v297 (ref)
            v297.ref.rage.dtlag:override();
            v297.ref.rage.fd:override();
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override();
            v297.defensive:on_createmove(v299);
            v297.antiaim:run(v299);
            v297.no_fall_damage:no_fall_damage(v299);
            v297.fast_ladder:fast_ladder(v299);
        end
    }, 
    [5] = {
        [1] = "createmove_run", 
        [2] = function(_)
            -- upvalues: v297 (ref)
            local v301 = entity.get_local_player();
            if v301:is_alive() then
                if v301.m_MoveType == 9 and common.is_button_down(87) then
                    v297.fast_ladder.ladder_status = true;
                else
                    v297.fast_ladder.ladder_status = false;
                end;
            else
                v297.fast_ladder.ladder_status = false;
            end;
        end
    }, 
    [6] = {
        [1] = "post_update_clientside_animation", 
        [2] = function()
            -- upvalues: v297 (ref)
            if not entity.get_local_player():is_alive() then
                return;
            else
                v297.animations:animations();
                return;
            end;
        end
    }, 
    [7] = {
        [1] = "render", 
        [2] = function(_)
            -- upvalues: v297 (ref)
            v297.visual:aspectratio_viewmodel();
            v297.visual:scope_overlay();
            local v303 = render.screen_size();
            v303.x = v303.x * 0.5;
            v303.y = v303.y * 0.9785;
            render.text(2, v303, color(255, 255, 255, globals.tickcount * 4 % 255), "cs", string.upper("bita test"));
        end
    }, 
    [8] = {
        [1] = "round_end", 
        [2] = function()
            -- upvalues: v297 (ref)
            v297.antiaim.state.round_ended = true;
            v297.antiaim.state.defensive_after = 0;
        end
    }, 
    [9] = {
        [1] = "aim_ack", 
        [2] = function(v304)
            -- upvalues: v297 (ref)
            v297.hitlogs:main(v304);
        end
    }, 
    [10] = {
        [1] = "round_start", 
        [2] = function()
            -- upvalues: v297 (ref)
            v297.antiaim.state.round_ended = false;
            v297.antiaim.state.defensive_after = 0;
        end
    }
}) do
    if v306[1] == "load" then
        v306[2]();
    else
        events[v306[1]]:set(v306[2]);
    end;
end;