local _ = "Antarctica";
local _ = "Nightly";
local v2 = render.load_font("segoe ui", vector(15, 15.5, 1), "ad");
local v3 = render.screen_size();
cvar.fps_max:int(0);
cvar.r_eyemove:int(0);
cvar.r_eyegloss:int(0);
cvar.r_eyesize:int(0);
cvar.cl_foot_contact_shadows:int(0);
local l_pui_0 = require("neverlose/pui");
local _ = require("neverlose/monylinear");
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local l_weapons_0 = require("neverlose/csgo_weapons");
local v9 = {
    rage = {
        binds = {
            logs = l_pui_0.find("Miscellaneous", "Main", "Other", "Log Events"), 
            doubletap = l_pui_0.find("Aimbot", "Ragebot", "Main", "Double Tap", {
                imit = "Immediate Teleport", 
                limit = "Fake Lag Limit"
            }), 
            onshot_aa = l_pui_0.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
            doubletap_options = l_pui_0.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
            onshot_aa_options = l_pui_0.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
            body_aim = l_pui_0.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
            damage_override = l_pui_0.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
            peek_assist = l_pui_0.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
            extended_backtrack = l_pui_0.find("Aimbot", "Ragebot", "Main", "Enabled", "Extended Backtrack"), 
            dormant_aimbot = l_pui_0.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
            ping = l_pui_0.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
            safe_point = l_pui_0.find("Aimbot", "Ragebot", "Safety", "Safe Points")
        }
    }, 
    antiaim = {
        angles = {
            pitch = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
            yaw_base = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
            backstab = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
            hidden = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
            yaw = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
            yaw_offset = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
            yaw_modifier = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
            yaw_modifier_offset = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
            freestand = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
            fs_yaw = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
            fs_body = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
            body_yaw = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
            body_yaw_options = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
            body_yaw_freestand = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
            body_yaw_left = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
            body_yaw_right = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
            extended_angles = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", {
                pitch = "Extended Pitch", 
                roll = "Extended Roll"
            }), 
            inverter = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter")
        }, 
        fakelag = {
            enabled = l_pui_0.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
            limit = l_pui_0.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
            variability = l_pui_0.find("Aimbot", "Anti Aim", "Fake Lag", "Variability")
        }, 
        other = {
            fake_duck = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
            slide = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
            leg_movement = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
            strafe = l_pui_0.find("Miscellaneous", "Main", "Movement", "Air Strafe")
        }
    }, 
    visuals = {
        world = {
            fov = l_pui_0.find("Visuals", "World", "Main", "Field of View"), 
            thirdperson = l_pui_0.find("Visuals", "World", "Main", "Force Thirdperson"), 
            thirdperson_distance = l_pui_0.find("Visuals", "World", "Main", "Force Thirdperson", "Distance"), 
            override_zoom = l_pui_0.find("Visuals", "World", "Main", "Override Zoom", {
                force_viewmodel = "Force Viewmodel", 
                force_second = "Force Second Zoom", 
                instant_scope = "Instant Scope", 
                scope_overlay = "Scope Overlay"
            }), 
            clantag = l_pui_0.find("Miscellaneous", "Main", "In-Game", "Clan Tag")
        }
    }
};
v9.disable = function()
    -- upvalues: l_pui_0 (ref), v9 (ref)
    l_pui_0.traverse(v9.antiaim.angles, function(v10, _)
        v10:disabled(true);
    end);
end;
v9.disable();
local v12 = {};
ui.sidebar("antarctica", "\239\143\172");
v12.get_bind = function(v13)
    state = false;
    value = 0;
    binds = ui.get_binds();
    for v14 = 1, #binds do
        if binds[v14].name == v13 and binds[v14].active then
            state = true;
            value = binds[v14].value;
        end;
    end;
    return {
        [1] = state, 
        [2] = value
    };
end;
local function v16(v15)
    return v15 == 0 and "NL" or v15 == 15 and "NL" or v15 == 22 and "GS" or v15 == 7 and "FLICK" or v15 == 1 and "BREAK";
end;
v12.ui = {};
v12.ui.home = l_pui_0.create("a", {
    [1] = {
        [1] = "general", 
        [2] = "\ngnl", 
        [3] = 1
    }, 
    [2] = {
        [1] = "other", 
        [2] = "\netc", 
        [3] = 1
    }, 
    [3] = {
        [1] = "ant", 
        [2] = "\nant", 
        [3] = 1
    }, 
    [4] = {
        [1] = "cfg", 
        [2] = "\nCfg", 
        [3] = 2
    }
});
local v17 = "\a{Small Text}";
v12.ui.visuals_select = v12.ui.home.general:list("\nselect tab", {
    [1] = "\v\239\154\185\r    Ragebot", 
    [2] = "\v\239\136\180\r   Anti-aim", 
    [3] = "\v\239\158\162\r    Visuals", 
    [4] = "\v\239\143\177\r    Misc", 
    [5] = "\v\239\129\187\r    Configs"
});
v12.ui.homie = {
    lua = v12.ui.home.other:label("Creator"):depend({
        [1] = nil, 
        [2] = 1, 
        [3] = 3, 
        [4] = 4, 
        [5] = 5, 
        [1] = v12.ui.visuals_select
    }), 
    creator = v12.ui.home.other:button("\v" .. common.get_script_author(), nil, true):depend({
        [1] = nil, 
        [2] = 1, 
        [3] = 3, 
        [4] = 4, 
        [5] = 5, 
        [1] = v12.ui.visuals_select
    })
};
v12.ui.attachments = {
    community = v12.ui.home.other:label("Community"):depend({
        [1] = nil, 
        [2] = 1, 
        [3] = 3, 
        [4] = 4, 
        [5] = 5, 
        [6] = 6, 
        [1] = v12.ui.visuals_select
    }), 
    telegram = v12.ui.home.other:button("\v\239\135\152", function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://t.me/coldcastles");
    end, true):depend({
        [1] = nil, 
        [2] = 1, 
        [3] = 3, 
        [4] = 4, 
        [5] = 5, 
        [6] = 6, 
        [1] = v12.ui.visuals_select
    }), 
    discorde = v12.ui.home.other:button("\v\239\154\181", function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://dsc.gg/enthusiasm");
    end, true):depend({
        [1] = nil, 
        [2] = 1, 
        [3] = 3, 
        [4] = 4, 
        [5] = 5, 
        [6] = 6, 
        [1] = v12.ui.visuals_select
    }), 
    discorda = v12.ui.home.other:button("\v\239\143\172", function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/uXPqGm34Gw");
    end, true):depend({
        [1] = nil, 
        [2] = 1, 
        [3] = 3, 
        [4] = 4, 
        [5] = 5, 
        [6] = 6, 
        [1] = v12.ui.visuals_select
    }), 
    neverlose = v12.ui.home.other:button("\vNL", function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://ru.neverlose.cc/market/item?id=VPTirg");
    end, true):depend({
        [1] = nil, 
        [2] = 1, 
        [3] = 3, 
        [4] = 4, 
        [5] = 5, 
        [6] = 6, 
        [1] = v12.ui.visuals_select
    })
};
v12.ui.main = l_pui_0.create("a", {
    [1] = {
        [1] = "indicator", 
        [2] = "\nInd", 
        [3] = 2
    }, 
    [2] = {
        [1] = "visual", 
        [2] = "\nVis", 
        [3] = 2
    }
});
do
    local l_v16_0 = v16;
    do
        local l_v17_0 = v17;
        v12.ui.rage = {
            assistance = v12.ui.main.visual:switch("Peek assist helper", false, function(v20)
                -- upvalues: l_v17_0 (ref)
                return {
                    dst = v20:slider(l_v17_0 .. "Distance", 12, 32, 22), 
                    dmg = v20:slider(l_v17_0 .. "Damage", 5, 50, 10), 
                    line = v20:switch(l_v17_0 .. "Draw box", true)
                };
            end):depend({
                [1] = nil, 
                [2] = 1, 
                [1] = v12.ui.visuals_select
            }), 
            fix = v12.ui.main.visual:switch("Teleport fix", true):depend({
                [1] = nil, 
                [2] = 1, 
                [1] = v12.ui.visuals_select
            }), 
            teleport = v12.ui.main.visual:switch("Force teleport", false, function(v21)
                -- upvalues: l_v17_0 (ref)
                return {
                    ticks = v21:slider(l_v17_0 .. "Ticks", 4, 10, 4)
                };
            end):depend({
                [1] = nil, 
                [2] = 1, 
                [1] = v12.ui.visuals_select
            })
        };
        v12.ui.misc = {
            anim = v12.ui.main.visual:switch("Anim breaker", false, function(v22)
                return {
                    air = v22:combo("Aerobic", {
                        [1] = "Disabled", 
                        [2] = "Force", 
                        [3] = "Legacy", 
                        [4] = "Walking", 
                        [5] = "Jitter"
                    }), 
                    grnd = v22:combo("Ground", {
                        [1] = "Disabled", 
                        [2] = "Force", 
                        [3] = "Walking", 
                        [4] = "Jitter"
                    }), 
                    lean = v22:combo("Lean", {
                        [1] = "Disabled", 
                        [2] = "Default", 
                        [3] = "Force", 
                        [4] = "Earthquake", 
                        [5] = "Jitter"
                    })
                };
            end):depend({
                [1] = nil, 
                [2] = 4, 
                [1] = v12.ui.visuals_select
            }), 
            qswitch = v12.ui.main.visual:switch("Quick switch", false):depend({
                [1] = nil, 
                [2] = 4, 
                [1] = v12.ui.visuals_select
            }), 
            circle = v12.ui.main.visual:switch("Adaptive circle strafe", false):depend({
                [1] = nil, 
                [2] = 4, 
                [1] = v12.ui.visuals_select
            }), 
            fd_speed = v12.ui.main.visual:switch("Unlock duck speed", false):depend({
                [1] = nil, 
                [2] = 4, 
                [1] = v12.ui.visuals_select
            }), 
            edge_stop = v12.ui.main.visual:switch("Edge stop", false):depend({
                [1] = nil, 
                [2] = 4, 
                [1] = v12.ui.visuals_select
            }), 
            fall = v12.ui.main.visual:switch("No fall damage", false):depend({
                [1] = nil, 
                [2] = 4, 
                [1] = v12.ui.visuals_select
            }), 
            ladder = v12.ui.main.visual:switch("Fast ladder", false):depend({
                [1] = nil, 
                [2] = 4, 
                [1] = v12.ui.visuals_select
            })
        };
        v12.ui.rage.fix:tooltip("Fix \vTeleport\r when \n\vDoubletap Ticks\r was reset");
        v12.ui.misc.qswitch:tooltip("Override and improve \vQuick Switch\r");
        v12.ui.misc.circle:tooltip("Working only when \vW, A, S, D\r not holded");
        v12.ui.misc.fall:tooltip("Attempt to bypass the \vLoss of Health\r");
        v12.ui.misc.ladder:tooltip("Acceleration of \vMovement\r with \vLadder\r");
        v12.ui.rage.assistance:tooltip("Helps peeking sides\nFunction work at trigger \vPeek Assist\r");
        v12.ui.rage.teleport:tooltip("This function using \vforce_teleport()\r for create lag your model\n\vGamesense\r can`t miss in this feature");
        v12.ui.misc.fd_speed:tooltip("Unlock \vSpeed\r when you using \n\vFake Duck\r feature");
        v12.ui.misc.edge_stop:tooltip("Prevents \vFall\r from a \vHeight\r");
        v12.ui.visuals = {
            logging = v12.ui.main.visual:switch("Hitlogs", false, function(v23)
                -- upvalues: l_v17_0 (ref)
                return {
                    notify = v23:switch(l_v17_0 .. "Notify"), 
                    upper = v23:switch(l_v17_0 .. "Upper \n log", false), 
                    font = v23:slider(l_v17_0 .. "Font \n log", 1, 5, 5), 
                    leftup = v23:selectable(l_v17_0 .. "Left up", {
                        [1] = "Hit / Miss", 
                        [2] = "Nades / Stabs", 
                        [3] = "Purchases"
                    })
                };
            end):depend({
                [1] = nil, 
                [2] = 4, 
                [1] = v12.ui.visuals_select
            }), 
            watermark = v12.ui.main.visual:switch("Watermark", false, function(v24)
                -- upvalues: l_v17_0 (ref), l_pui_0 (ref)
                return {
                    glow = v24:switch(l_v17_0 .. "Glow \nw", false), 
                    upper = v24:switch(l_v17_0 .. "Upper \nw", false), 
                    font = v24:slider(l_v17_0 .. "Font \nw", 1, 5, 5), 
                    color = v24:color_picker(l_v17_0 .. "Color \nw", l_pui_0.accent)
                };
            end):depend({
                [1] = nil, 
                [2] = 3, 
                [1] = v12.ui.visuals_select
            }), 
            manuals = v12.ui.main.visual:switch("Manuals", false, function(v25)
                -- upvalues: l_v17_0 (ref), l_pui_0 (ref)
                return {
                    color = v25:color_picker(l_v17_0 .. "Color", l_pui_0.accent), 
                    color2 = v25:color_picker(l_v17_0 .. "Color disabled", color(255, 0, 0))
                };
            end):depend({
                [1] = nil, 
                [2] = 3, 
                [1] = v12.ui.visuals_select
            }), 
            damage = v12.ui.main.visual:switch("Damage", false, function(v26)
                -- upvalues: l_v17_0 (ref), l_pui_0 (ref)
                return {
                    font = v26:slider(l_v17_0 .. "Font \n dmg", 1, 5, 2), 
                    color = v26:color_picker(l_v17_0 .. "Color", l_pui_0.accent)
                };
            end):depend({
                [1] = nil, 
                [2] = 3, 
                [1] = v12.ui.visuals_select
            }), 
            cscope = v12.ui.main.visual:switch("Custom scope", false, function(v27)
                -- upvalues: l_v17_0 (ref), l_pui_0 (ref)
                return {
                    glow = v27:switch(l_v17_0 .. "Glow \n CS", true), 
                    disabler = v27:selectable(l_v17_0 .. "Disabler \n CS", {
                        [1] = "Up", 
                        [2] = "Down", 
                        [3] = "Left", 
                        [4] = "Right"
                    }), 
                    offset = v27:slider(l_v17_0 .. "Offset \n CS", 0, 350, 70), 
                    size = v27:slider(l_v17_0 .. "Size \n CS", 0, 340, 10), 
                    rotation = v27:slider(l_v17_0 .. "Rotation \n CS", 0, 45, 0), 
                    color = v27:color_picker(l_v17_0 .. "Color \n CS", l_pui_0.accent), 
                    resume = v27:slider(l_v17_0 .. "Resume alpha \n CS", 0, 255, 0)
                };
            end):depend({
                [1] = nil, 
                [2] = 3, 
                [1] = v12.ui.visuals_select
            })
        };
        v12.ui.visuals.logging.notify:depend({
            [1] = nil, 
            [2] = true, 
            [1] = v12.ui.visuals.logging
        });
        v12.ui.visuals.logging.upper:depend({
            [1] = nil, 
            [2] = true, 
            [1] = v12.ui.visuals.logging
        }, {
            [1] = nil, 
            [2] = true, 
            [1] = v12.ui.visuals.logging.notify
        });
        v12.ui.visuals.logging.font:depend({
            [1] = nil, 
            [2] = true, 
            [1] = v12.ui.visuals.logging
        }, {
            [1] = nil, 
            [2] = true, 
            [1] = v12.ui.visuals.logging.notify
        });
        v12.ui.visuals.logging.leftup:depend({
            [1] = nil, 
            [2] = true, 
            [1] = v12.ui.visuals.logging
        });
        v12.ui.visuals.watermark.glow:depend({
            [1] = nil, 
            [2] = true, 
            [1] = v12.ui.visuals.watermark
        });
        v12.ui.visuals.watermark.upper:depend({
            [1] = nil, 
            [2] = true, 
            [1] = v12.ui.visuals.watermark
        });
        v12.ui.visuals.watermark.font:depend({
            [1] = nil, 
            [2] = true, 
            [1] = v12.ui.visuals.watermark
        });
        v12.ui.visuals.watermark.color:depend({
            [1] = nil, 
            [2] = true, 
            [1] = v12.ui.visuals.watermark
        });
        v12.ui.visuals.manuals.color:depend({
            [1] = nil, 
            [2] = true, 
            [1] = v12.ui.visuals.manuals
        });
        v12.ui.visuals.manuals.color2:depend({
            [1] = nil, 
            [2] = true, 
            [1] = v12.ui.visuals.manuals
        });
        v12.ui.visuals.damage.color:depend({
            [1] = nil, 
            [2] = true, 
            [1] = v12.ui.visuals.damage
        });
        v12.ui.visuals.damage.font:depend({
            [1] = nil, 
            [2] = true, 
            [1] = v12.ui.visuals.damage
        });
        v12.ui.world = {
            mystery = v12.ui.main.visual:switch("Mystery hitbox", false, function(v28)
                -- upvalues: l_v17_0 (ref)
                return {
                    indicate_when = v28:selectable(l_v17_0 .. "Indicate when", {
                        [1] = "Defensive", 
                        [2] = "Charge"
                    }), 
                    defensive = v28:color_picker(l_v17_0 .. "Defensive", color(0, 255, 215, 60)), 
                    charge = v28:color_picker(l_v17_0 .. "Charge", color(105, 255, 0, 60))
                };
            end):depend({
                [1] = nil, 
                [2] = 3, 
                [1] = v12.ui.visuals_select
            }), 
            nade = v12.ui.main.visual:selectable("Nade radius", {
                [1] = "Smoke", 
                [2] = "Molotov"
            }, function(v29)
                -- upvalues: l_v17_0 (ref)
                return {
                    smoke = v29:color_picker(l_v17_0 .. "Smoke", color(200, 200, 200)), 
                    molotov = v29:color_picker(l_v17_0 .. "Molotov", color(255, 110, 75))
                };
            end):depend({
                [1] = nil, 
                [2] = 3, 
                [1] = v12.ui.visuals_select
            }), 
            zoom = v12.ui.main.visual:switch("Animated zoom", false):depend({
                [1] = nil, 
                [2] = 3, 
                [1] = v12.ui.visuals_select
            }), 
            viewmodel = v12.ui.main.visual:switch("Viewmodel", false, function(v30)
                -- upvalues: l_v17_0 (ref)
                return {
                    fov = v30:slider(l_v17_0 .. "Fov", 20, 100, 0, nil, "\194\176"), 
                    x = v30:slider(l_v17_0 .. "X", -100, 100, 0, 0.1, "\194\176"), 
                    y = v30:slider(l_v17_0 .. "Y", -100, 100, 0, 0.1, "\194\176"), 
                    z = v30:slider(l_v17_0 .. "Z", -100, 100, 0, 0.1, "\194\176")
                };
            end):depend({
                [1] = nil, 
                [2] = 3, 
                [1] = v12.ui.visuals_select
            }), 
            aspectratio = v12.ui.main.visual:switch("Aspectratio", false, function(v31)
                -- upvalues: l_v17_0 (ref)
                return {
                    ratio = v31:slider(l_v17_0 .. "Ratio", 30, 200, 130, 0.01, "\194\176")
                };
            end):depend({
                [1] = nil, 
                [2] = 3, 
                [1] = v12.ui.visuals_select
            })
        };
        v12.ui.world.nade.smoke:depend({
            [1] = nil, 
            [2] = "Smoke", 
            [1] = v12.ui.world.nade
        });
        v12.ui.world.nade.molotov:depend({
            [1] = nil, 
            [2] = "Molotov", 
            [1] = v12.ui.world.nade
        });
        v12.ui.world.mystery.defensive:depend({
            [1] = nil, 
            [2] = "Defensive", 
            [1] = v12.ui.world.mystery.indicate_when
        });
        v12.ui.world.mystery.charge:depend({
            [1] = nil, 
            [2] = "Charge", 
            [1] = v12.ui.world.mystery.indicate_when
        });
        v12.ui.world.mystery:tooltip("Overriding \vHighlight Hitbox\r\nwhen trigger working");
        v12.ui.world.zoom:tooltip("Animate values:\n~  \vField of View\r\n~  \vOverride Zoom\r\n~  \vForce Second Zoom\r");
        v12.state = "Shared";
        v12.condition_names = {
            [1] = "Shared", 
            [2] = "Stand", 
            [3] = "Move", 
            [4] = "Walk", 
            [5] = "Duck", 
            [6] = "Duck+", 
            [7] = "Aerobic", 
            [8] = "Aerobic+", 
            [9] = "Using"
        };
        v12.ui.building = {};
        for _, v33 in pairs(v12.condition_names) do
            v12.ui.builder = l_pui_0.create("a", {
                [1] = {
                    [1] = "pitch2", 
                    [2] = "\nPitch2", 
                    [3] = 2
                }, 
                [2] = {
                    [1] = "main", 
                    [2] = nil, 
                    [3] = 2, 
                    [2] = "\nMain" .. v33
                }, 
                [3] = {
                    [1] = "yaw", 
                    [2] = nil, 
                    [3] = 2, 
                    [2] = "\nYaw" .. v33
                }, 
                [4] = {
                    [1] = "del", 
                    [2] = nil, 
                    [3] = 2, 
                    [2] = "\nDel" .. v33
                }, 
                [5] = {
                    [1] = "antiaim", 
                    [2] = "\nAA", 
                    [3] = 1
                }, 
                [6] = {
                    [1] = "additive", 
                    [2] = "\nAdd", 
                    [3] = 1
                }, 
                [7] = {
                    [1] = "brut", 
                    [2] = "\nBrt", 
                    [3] = 2
                }, 
                [8] = {
                    [1] = "brute", 
                    [2] = "\nBrute", 
                    [3] = 2
                }
            });
            v12.ui.building[v33] = {};
            if v33 ~= "Shared" then
                v12.ui.building[v33].override = v12.ui.builder.main:switch("Enable \v" .. v33, false, function(v34)
                    -- upvalues: l_v17_0 (ref)
                    return {
                        visible = v34:switch(l_v17_0 .. "Hide", false)
                    };
                end);
            end;
            v12.ui.building[v33].yaw = v12.ui.builder.yaw:combo("Yaw ~ \vmode", {
                [1] = "Backward", 
                [2] = "Left & Right", 
                [3] = "Backward + Left & Right"
            }, function(v35)
                -- upvalues: l_v17_0 (ref)
                return {
                    sel = v35:combo(l_v17_0 .. "Base", {
                        [1] = "At target", 
                        [2] = "Local view"
                    }), 
                    y180 = v35:slider(l_v17_0 .. "Backward", -180, 180, 0, nil, "\194\176"), 
                    l = v35:slider(l_v17_0 .. "Left", -90, 90, 0, nil, "\194\176"), 
                    r = v35:slider(l_v17_0 .. "Right", -90, 90, 0, nil, "\194\176")
                };
            end);
            v12.ui.building[v33].modifier = v12.ui.builder.yaw:selectable("Yaw ~ \vmodifier", {
                [1] = "Center", 
                [2] = "Spin", 
                [3] = "Randomize"
            }, function(v36)
                -- upvalues: l_v17_0 (ref)
                return {
                    way = v36:slider(l_v17_0 .. "Center", -90, 90, 0, nil, "\194\176"), 
                    way2 = v36:slider(l_v17_0 .. "Spin", -30, 30, 0, nil, "\194\176"), 
                    way3 = v36:slider(l_v17_0 .. "Randomize", -60, 60, 0, nil, "\194\176")
                };
            end);
            v12.ui.building[v33].dsy = v12.ui.builder.yaw:combo("Body yaw", {
                [1] = "Disabled", 
                [2] = "Static", 
                [3] = "Jitter", 
                [4] = "Random"
            }, function(v37)
                -- upvalues: l_v17_0 (ref)
                return {
                    inv = v37:switch(l_v17_0 .. "Invert"), 
                    jit = v37:combo(l_v17_0 .. "Type", {
                        [1] = "Default", 
                        [2] = "Spin", 
                        [3] = "Random", 
                        [4] = "Nightly"
                    }), 
                    l = v37:slider(l_v17_0 .. "Left", -30, 60, 30, nil, "\194\176"), 
                    r = v37:slider(l_v17_0 .. "Right", -30, 60, 30, nil, "\194\176")
                };
            end);
            v12.ui.building[v33].delay = v12.ui.builder.del:label("Delay", function(v38)
                -- upvalues: l_v17_0 (ref)
                return {
                    tick = v38:slider(l_v17_0 .. "Tick", 1, 10), 
                    hold = v38:switch(l_v17_0 .. "Hold packets")
                };
            end);
            v12.ui.building[v33].defensive = v12.ui.builder.del:combo("Defensive", {
                [1] = "On peek", 
                [2] = "Pre peek", 
                [3] = "On hit", 
                [4] = "Always on"
            }, function(v39)
                -- upvalues: l_v17_0 (ref), l_v16_0 (ref)
                return {
                    twork = v39:combo(l_v17_0 .. "Based on", {
                        [1] = "Command number", 
                        [2] = "Tick count"
                    }), 
                    base = v39:combo(l_v17_0 .. "Mode", {
                        [1] = "Default", 
                        [2] = "Random", 
                        [3] = "Sway", 
                        [4] = "Flick"
                    }), 
                    ticks = v39:slider(l_v17_0 .. "Ticks", 0, 22, 0, 1, l_v16_0), 
                    switch = v39:switch(l_v17_0 .. "Enable anti-aims")
                };
            end);
            v12.ui.building[v33].dmode = v12.ui.builder.del:combo("Activation", {
                [1] = "On peek", 
                [2] = "Pre peek", 
                [3] = "On hit", 
                [4] = "Always on"
            }, function(v40)
                -- upvalues: l_v17_0 (ref)
                return {
                    ymode = v40:selectable(l_v17_0 .. "Disabler", {
                        [1] = "Body yaw"
                    })
                };
            end);
            v12.ui.building[v33].dpitch = v12.ui.builder.del:combo("Pitch ~ \vmode", {
                [1] = "Static"
            }, function(v41)
                -- upvalues: l_v17_0 (ref)
                return {
                    degree = v41:slider(l_v17_0 .. "Degree", -89, 89, 89, nil, "\194\176"), 
                    degree2 = v41:slider(l_v17_0 .. "Randomize", 0, 69, 0, nil, "\194\176")
                };
            end);
            v12.ui.building[v33].dyaw = v12.ui.builder.del:combo("Yaw ~ \vmode\ndef", {
                [1] = "Static", 
                [2] = "Sideways", 
                [3] = "Randomize", 
                [4] = "Spin", 
                [5] = "Nightly"
            }, function(v42)
                -- upvalues: l_v17_0 (ref)
                return {
                    degree = v42:slider(l_v17_0 .. "Degree", -180, 180, 0, nil, "\194\176")
                };
            end);
        end;
        v12.ui.building.dsettings = v12.ui.builder.pitch2:combo("Mode", {
            [1] = "Builder", 
            [2] = "Defensive", 
            [3] = "Anti-bruteforce"
        }):depend({
            [1] = nil, 
            [2] = 2, 
            [1] = v12.ui.visuals_select
        });
        v12.ui.aafeat = {
            disabler = v12.ui.builder.pitch2:selectable("Disable when", {
                [1] = "Warmup period", 
                [2] = "Round end", 
                [3] = "Back stab"
            }):depend({
                [1] = nil, 
                [2] = 2, 
                [1] = v12.ui.visuals_select
            }), 
            safe_head = v12.ui.builder.additive:switch("Safe head", false, function(v43)
                -- upvalues: l_v17_0 (ref)
                return {
                    enable = v43:selectable(l_v17_0 .. "Enable when", {
                        [1] = "Knife", 
                        [2] = "Zeus", 
                        [3] = "Height"
                    }), 
                    defe = v43:switch(l_v17_0 .. "Hidden on use", false), 
                    state = v43:selectable(l_v17_0 .. "States", {
                        [1] = "Duck", 
                        [2] = "Duck+", 
                        [3] = "Aerobic+"
                    })
                };
            end):depend({
                [1] = nil, 
                [2] = 2, 
                [1] = v12.ui.visuals_select
            }), 
            fakeflick = v12.ui.builder.additive:switch("Fake flick", false, function(v44)
                -- upvalues: l_v17_0 (ref)
                return {
                    invert = v44:switch(l_v17_0 .. "Invert"), 
                    pitch = v44:slider(l_v17_0 .. "Pitch", -89, 89, 0), 
                    yaw = v44:slider(l_v17_0 .. "Yaw", 0, 120, 70)
                };
            end):depend({
                [1] = nil, 
                [2] = 2, 
                [1] = v12.ui.visuals_select
            }), 
            extend = v12.ui.builder.additive:switch("Extended angles", false, function(v45)
                -- upvalues: l_v17_0 (ref)
                return {
                    pitch = v45:slider(l_v17_0 .. "Pitch", 0, 180, 150), 
                    yaw = v45:slider(l_v17_0 .. "Roll", 0, 90, 90)
                };
            end):depend({
                [1] = nil, 
                [2] = 2, 
                [1] = v12.ui.visuals_select
            }), 
            slide = v12.ui.builder.additive:switch("Defensive sliding exploit", true):depend({
                [1] = nil, 
                [2] = 2, 
                [1] = v12.ui.visuals_select
            }), 
            epeek = v12.ui.builder.additive:switch("Reduce on shot"):depend({
                [1] = nil, 
                [2] = 2, 
                [1] = v12.ui.visuals_select
            }), 
            state = v12.ui.builder.pitch2:combo("Condition", v12.condition_names):depend({
                [1] = nil, 
                [2] = "Builder", 
                [3] = "Defensive", 
                [1] = v12.ui.building.dsettings
            }, {
                [1] = nil, 
                [2] = 2, 
                [1] = v12.ui.visuals_select
            }), 
            brute = v12.ui.builder.brut:switch("Activate", false):depend({
                [1] = nil, 
                [2] = 2, 
                [1] = v12.ui.visuals_select
            }), 
            bmode = v12.ui.builder.brute:selectable("Selection\nbrute", {
                [1] = "Yaw", 
                [2] = "Desync"
            }):depend({
                [1] = nil, 
                [2] = 2, 
                [1] = v12.ui.visuals_select
            }), 
            btime = v12.ui.builder.brute:slider("Time\nbrute", 1, 5, 1):depend({
                [1] = nil, 
                [2] = 2, 
                [1] = v12.ui.visuals_select
            })
        };
        v12.ui.aafeat.epeek:tooltip("Overriding \vFake Lag\r when you \vShooting\r");
        v12.ui.aafeat.safe_head:tooltip("Prevents \vBack Shooting\r your \vAngles\r \nWhen you switch weapon on \n\vKnife\r, \vZeus\r or \vEnemy\r\ncan kill you from \vHigh Ground\r");
        v12.ui.aafeat.brute:depend({
            [1] = nil, 
            [2] = "Anti-bruteforce", 
            [1] = v12.ui.building.dsettings
        });
        local v46 = {
            [1] = nil, 
            [2] = true, 
            [1] = v12.ui.aafeat.brute
        };
        v12.ui.aafeat.bmode:depend({
            [1] = nil, 
            [2] = "Anti-bruteforce", 
            [1] = v12.ui.building.dsettings
        }, v46);
        v12.ui.aafeat.btime:depend({
            [1] = nil, 
            [2] = "Anti-bruteforce", 
            [1] = v12.ui.building.dsettings
        }, v46);
        for _, v48 in pairs(v12.condition_names) do
            local v49 = {
                [1] = nil, 
                [2] = 2, 
                [1] = v12.ui.visuals_select
            };
            local v50 = {
                [1] = nil, 
                [2] = "Builder", 
                [1] = v12.ui.building.dsettings
            };
            local v51 = {
                [1] = nil, 
                [2] = "Defensive", 
                [1] = v12.ui.building.dsettings
            };
            if v48 ~= "Shared" then
                v12.ui.building[v48].override:depend({
                    [1] = v12.ui.aafeat.state, 
                    [2] = v48
                }, {
                    [1] = nil, 
                    [2] = "Builder", 
                    [3] = "Defensive", 
                    [1] = v12.ui.building.dsettings
                }, v49);
            end;
            local v52 = v48 ~= "Shared" and {
                [1] = nil, 
                [2] = true, 
                [1] = v12.ui.building[v48].override
            } or nil;
            local v53 = v48 ~= "Shared" and {
                [1] = nil, 
                [2] = false, 
                [1] = v12.ui.building[v48].override.visible
            } or nil;
            v12.ui.building[v48].yaw:depend({
                [1] = v12.ui.aafeat.state, 
                [2] = v48
            }, v52, v53, v50, v49);
            local v54 = {
                [1] = nil, 
                [2] = "Backward", 
                [3] = "Backward + Left & Right", 
                [1] = v12.ui.building[v48].yaw
            };
            local v55 = {
                [1] = nil, 
                [2] = "Left & Right", 
                [3] = "Backward + Left & Right", 
                [1] = v12.ui.building[v48].yaw
            };
            v12.ui.building[v48].yaw.y180:depend(v54);
            v12.ui.building[v48].yaw.l:depend(v55);
            v12.ui.building[v48].yaw.r:depend(v55);
            v12.ui.building[v48].modifier:depend({
                [1] = v12.ui.aafeat.state, 
                [2] = v48
            }, v52, v53, v50, v49);
            v12.ui.building[v48].modifier.way:depend({
                [1] = nil, 
                [2] = "Center", 
                [1] = v12.ui.building[v48].modifier
            });
            v12.ui.building[v48].modifier.way2:depend({
                [1] = nil, 
                [2] = "Spin", 
                [1] = v12.ui.building[v48].modifier
            });
            v12.ui.building[v48].modifier.way3:depend({
                [1] = nil, 
                [2] = "Randomize", 
                [1] = v12.ui.building[v48].modifier
            });
            v12.ui.building[v48].dsy:depend({
                [1] = v12.ui.aafeat.state, 
                [2] = v48
            }, v52, v53, v50, v49);
            local v56 = {
                [1] = nil, 
                [2] = "Static", 
                [3] = "Jitter", 
                [4] = "Random", 
                [1] = v12.ui.building[v48].dsy
            };
            local v57 = {
                [1] = nil, 
                [2] = "Static", 
                [1] = v12.ui.building[v48].dsy
            };
            v12.ui.building[v48].dsy.inv:depend(v57);
            v12.ui.building[v48].dsy.jit:depend(v56);
            v12.ui.building[v48].dsy.l:depend(v56);
            v12.ui.building[v48].dsy.r:depend(v56);
            v12.ui.building[v48].delay:depend({
                [1] = v12.ui.aafeat.state, 
                [2] = v48
            }, v52, v53, v50, v49);
            v12.ui.building[v48].defensive:depend({
                [1] = v12.ui.aafeat.state, 
                [2] = v48
            }, v52, v53, {
                [1] = nil, 
                [2] = "Builder", 
                [3] = "Defensive", 
                [1] = v12.ui.building.dsettings
            }, v49);
            local v58 = {
                [1] = nil, 
                [2] = true, 
                [1] = v12.ui.building[v48].defensive.switch
            };
            v12.ui.building[v48].dpitch:depend({
                [1] = v12.ui.aafeat.state, 
                [2] = v48
            }, v52, v53, v51, v58, v49);
            v12.ui.building[v48].dpitch.degree2:depend({
                [1] = v12.ui.aafeat.state, 
                [2] = v48
            }, v52, v53, v51, v58, v49);
            v12.ui.building[v48].dyaw:depend({
                [1] = v12.ui.aafeat.state, 
                [2] = v48
            }, v52, v53, v51, v58, v49);
            local v59 = {
                [1] = nil, 
                [2] = "Static", 
                [3] = "Sideways", 
                [4] = "Random", 
                [1] = v12.ui.building[v48].dyaw
            };
            v12.ui.building[v48].dyaw.degree:depend({
                [1] = v12.ui.aafeat.state, 
                [2] = v48
            }, v52, v53, v51, v58, v59, v49);
            v12.ui.building[v48].dmode:depend({
                [1] = v12.ui.aafeat.state, 
                [2] = v48
            }, v52, v53, v51, v58, v49);
        end;
        v12.ui.antiaim = {
            offset = v12.ui.builder.antiaim:slider("Manual offset", -120, 120, 0, nil, "\194\176", function(v60)
                -- upvalues: l_v17_0 (ref)
                return {
                    target = v60:combo(l_v17_0 .. "Base", {
                        [1] = "Local view", 
                        [2] = "At target"
                    }), 
                    limit = v60:slider(l_v17_0 .. "Desync limit", 0, 60, 60, nil, "\194\176"), 
                    over = v60:switch(l_v17_0 .. "Hidden on active"), 
                    off = v60:switch(l_v17_0 .. "Disable freestanding", true)
                };
            end):depend({
                [1] = nil, 
                [2] = 2, 
                [1] = v12.ui.visuals_select
            }), 
            freestand = v12.ui.builder.antiaim:switch("Freestanding", false, function(v61)
                -- upvalues: l_v17_0 (ref)
                return {
                    target = v61:combo(l_v17_0 .. "Base", {
                        [1] = "At target", 
                        [2] = "Local view"
                    }), 
                    limit = v61:slider(l_v17_0 .. "Desync limit", 0, 60, 60, nil, "\194\176"), 
                    over = v61:switch(l_v17_0 .. "Hidden on active"), 
                    yaw = v61:switch(l_v17_0 .. "Disable yaw modifiers"), 
                    body = v61:switch(l_v17_0 .. "Body freestanding")
                };
            end):depend({
                [1] = nil, 
                [2] = 2, 
                [1] = v12.ui.visuals_select
            })
        };
        v12.ui.antiaim.offset:tooltip("\vSet value at using the button\r\nEnable \vVisible Checkbox\r for correct bind working");
        local v62 = {};
        local v63 = "enthukey";
        local v64 = "enthu";
        local v65 = db[v63] or {};
        do
            local l_v63_0, l_v64_0, l_v65_0 = v63, v64, v65;
            local function v72(v69)
                -- upvalues: l_base64_0 (ref), l_v64_0 (ref)
                local v70 = msgpack.pack(v69);
                local v71 = l_base64_0.encode(v70);
                return table.concat({
                    [1] = l_v64_0, 
                    [2] = v71
                }, "::");
            end;
            local function v76(v73)
                -- upvalues: l_v64_0 (ref), l_base64_0 (ref)
                local v74 = v73:match(l_v64_0 .. "::(.+)");
                if not v74 then
                    return nil;
                else
                    local v75 = l_base64_0.decode(v74);
                    return msgpack.unpack(v75);
                end;
            end;
            v62.export = function(_, v78)
                -- upvalues: l_pui_0 (ref), v72 (ref)
                local v79 = {
                    name = v78 or "Untitled", 
                    settings = l_pui_0.save()
                };
                return v72(v79);
            end;
            v62.import = function(_, v81, ...)
                -- upvalues: v76 (ref), l_pui_0 (ref)
                local v82 = v76(v81);
                if not v82 then
                    return nil;
                else
                    l_pui_0.load(v82.settings, ...);
                    return v82;
                end;
            end;
            v62.get_configs = function(_)
                -- upvalues: l_v65_0 (ref)
                local v84 = {};
                for v85, v86 in ipairs(l_v65_0) do
                    v84[v85] = v86.name;
                end;
                return v84;
            end;
            v62.get = function(_, v88)
                -- upvalues: l_v65_0 (ref)
                return l_v65_0[v88];
            end;
            v62.delete = function(_, v90)
                -- upvalues: l_v65_0 (ref)
                table.remove(l_v65_0, v90);
            end;
            v62.create = function(_, v92, v93)
                -- upvalues: l_v65_0 (ref)
                table.insert(l_v65_0, {
                    name = v92, 
                    code = v93
                });
            end;
            v62.create_from_encoded_data = function(v94, v95)
                -- upvalues: v76 (ref)
                local v96 = v76(v95);
                if not v96 then
                    error("Invalid config data.");
                    return;
                else
                    v94:create(v96.name, v95);
                    return;
                end;
            end;
            v62.save = function(_, v98, v99)
                -- upvalues: l_v65_0 (ref)
                if l_v65_0[v98] then
                    l_v65_0[v98].code = v99;
                end;
            end;
            v62.shutdown = function(_)
                -- upvalues: l_v63_0 (ref), l_v65_0 (ref)
                db[l_v63_0] = l_v65_0;
            end;
            events.shutdown(v62.shutdown);
        end;
        v63 = "enthu::gqhzZXR0aW5nc4ikcmFnZYWodGVsZXBvcnTCqmFzc2lzdGFuY2XDq35hc3Npc3RhbmNlg6RsaW5lw6Nkc3QMo2RtZwWjZml4w6l+dGVsZXBvcnSBpXRpY2tzBKhidWlsZGluZ4qmU2hhcmVkj6R+eWF3hKR5MTgwAKFsAKFyAKNzZWypQXQgdGFyZ2V0pWRlbGF5gqRob2xkwqR0aWNrAahtb2RpZmllcpKmQ2VudGVyoX6lZG1vZGWnT24gcGVla6l+bW9kaWZpZXKDpHdheTIApHdheTMAo3dheQCjZHN5pkppdHRlcqZkcGl0Y2imU3RhdGljpGR5YXemU3RhdGljqWRlZmVuc2l2ZadPbiBwZWVrp35kcGl0Y2iCp2RlZ3JlZTIApmRlZ3JlZVmkfmRzeYShcjyhbDyjaW52wqNqaXSnRGVmYXVsdKZ+ZG1vZGWBpXltb2RlkaF+pX5keWF3gaZkZWdyZWUAqn5kZWZlbnNpdmWEpnN3aXRjaMKldGlja3MApGJhc2WnRGVmYXVsdKV0d29ya65Db21tYW5kIG51bWJlcqN5YXeoQmFja3dhcmSlU3RhbmTeABGlZGVsYXmCpGhvbGTCpHRpY2sCqG92ZXJyaWRlw6R+ZHN5hKFyPKFsPKNpbnbCo2ppdKRTcGlupn5kbW9kZYGleW1vZGWRoX6lfmR5YXeBpmRlZ3JlZQCqfmRlZmVuc2l2ZYSmc3dpdGNowqV0aWNrcwCkYmFzZadEZWZhdWx0pXR3b3JrrkNvbW1hbmQgbnVtYmVyqX5tb2RpZmllcoOkd2F5Mgqkd2F5M/ajd2F5CaR+eWF3hKR5MTgwAKFs66FyJ6NzZWypQXQgdGFyZ2V0qX5vdmVycmlkZYGndmlzaWJsZcKobW9kaWZpZXKRoX6lZG1vZGWnT24gcGVla6ZkcGl0Y2imU3RhdGljqWRlZmVuc2l2ZadPbiBwZWVro2RzeaZSYW5kb22kZHlhd6ZTdGF0aWOnfmRwaXRjaIKnZGVncmVlMgCmZGVncmVlWaN5YXesTGVmdCAmIFJpZ2h0pE1vdmXeABGlZGVsYXmCpGhvbGTCpHRpY2sBqG92ZXJyaWRlw6R+ZHN5hKFyPKFsPKNpbnbCo2ppdKdEZWZhdWx0pn5kbW9kZYGleW1vZGWRoX6lfmR5YXeBpmRlZ3JlZcy0qn5kZWZlbnNpdmWEpnN3aXRjaMKldGlja3MApGJhc2WnRGVmYXVsdKV0d29ya65Db21tYW5kIG51bWJlcql+bW9kaWZpZXKDpHdheTILpHdheTPvo3dheQ+kfnlhd4SkeTE4MAChbOChciWjc2VsqUF0IHRhcmdldKl+b3ZlcnJpZGWBp3Zpc2libGXCqG1vZGlmaWVykaF+pWRtb2RlqFByZSBwZWVrpmRwaXRjaKZTdGF0aWOpZGVmZW5zaXZlqFByZSBwZWVro2RzeaZSYW5kb22kZHlhd6dOaWdodGx5p35kcGl0Y2iCp2RlZ3JlZTIApmRlZ3JlZdCno3lhd6xMZWZ0ICYgUmlnaHSkV2Fsa94AEaVkZWxheYKkaG9sZMOkdGljawGob3ZlcnJpZGXDpH5kc3mEoXI8oWw8o2ludsKjaml0p0RlZmF1bHSmfmRtb2RlgaV5bW9kZZKoQm9keSB5YXehfqV+ZHlhd4GmZGVncmVl0LqqfmRlZmVuc2l2ZYSmc3dpdGNow6V0aWNrcwekYmFzZadEZWZhdWx0pXR3b3JrrkNvbW1hbmQgbnVtYmVyqX5tb2RpZmllcoOkd2F5Mgakd2F5M/ajd2F5E6R+eWF3hKR5MTgw/aFsAKFyAKNzZWypQXQgdGFyZ2V0qX5vdmVycmlkZYGndmlzaWJsZcKobW9kaWZpZXKSpkNlbnRlcqF+pWRtb2RlqUFsd2F5cyBvbqZkcGl0Y2imU3RhdGljqWRlZmVuc2l2ZalBbHdheXMgb26jZHN5pkppdHRlcqRkeWF3plN0YXRpY6d+ZHBpdGNogqdkZWdyZWUyAKZkZWdyZWVZo3lhd6hCYWNrd2FyZKREdWNr3gARpWRlbGF5gqRob2xkwqR0aWNrAqhvdmVycmlkZcOkfmRzeYShcjyhbDyjaW52wqNqaXSnRGVmYXVsdKZ+ZG1vZGWBpXltb2RlkaF+pX5keWF3gaZkZWdyZWUAqn5kZWZlbnNpdmWEpnN3aXRjaMKldGlja3MApGJhc2WnRGVmYXVsdKV0d29ya65Db21tYW5kIG51bWJlcql+bW9kaWZpZXKDpHdheTIepHdheTMNo3dheQCkfnlhd4SkeTE4MAChbOChcjKjc2VsqUF0IHRhcmdldKl+b3ZlcnJpZGWBp3Zpc2libGXCqG1vZGlmaWVykaF+pWRtb2Rlp09uIHBlZWumZHBpdGNoplN0YXRpY6lkZWZlbnNpdmWnT24gcGVla6Nkc3mmSml0dGVypGR5YXemU3RhdGljp35kcGl0Y2iCp2RlZ3JlZTIApmRlZ3JlZVmjeWF3rExlZnQgJiBSaWdodKVEdWNrK94AEaVkZWxheYKkaG9sZMKkdGljawOob3ZlcnJpZGXCpH5kc3mEoXIUoWw8o2ludsKjaml0p0RlZmF1bHSmfmRtb2RlgaV5bW9kZZGhfqV+ZHlhd4GmZGVncmVlAKp+ZGVmZW5zaXZlhKZzd2l0Y2jCpXRpY2tzAKRiYXNlp0RlZmF1bHSldHdvcmuuQ29tbWFuZCBudW1iZXKpfm1vZGlmaWVyg6R3YXkyAKR3YXkzAKN3YXkPpH55YXeEpHkxODAAoWzpoXIio3NlbKlBdCB0YXJnZXSpfm92ZXJyaWRlgad2aXNpYmxlwqhtb2RpZmllcpKmQ2VudGVyoX6lZG1vZGWnT24gcGVla6ZkcGl0Y2imU3RhdGljqWRlZmVuc2l2ZadPbiBwZWVro2RzeaZKaXR0ZXKkZHlhd6ZTdGF0aWOnfmRwaXRjaIKnZGVncmVlMgCmZGVncmVlWaN5YXesTGVmdCAmIFJpZ2h0qEFlcm9iaWMr3gARpWRlbGF5gqRob2xkwqR0aWNrA6hvdmVycmlkZcOkfmRzeYShch6hbB6jaW52wqNqaXSnRGVmYXVsdKZ+ZG1vZGWBpXltb2RlkaF+pX5keWF3gaZkZWdyZWUAqn5kZWZlbnNpdmWEpnN3aXRjaMKldGlja3MApGJhc2WlRmxpY2uldHdvcmuuQ29tbWFuZCBudW1iZXKpfm1vZGlmaWVyg6R3YXky+aR3YXkzD6N3YXkkpH55YXeEpHkxODAAoWzQ3aFyL6NzZWypQXQgdGFyZ2V0qX5vdmVycmlkZYGndmlzaWJsZcKobW9kaWZpZXKRoX6lZG1vZGWpQWx3YXlzIG9upmRwaXRjaKZTdGF0aWOpZGVmZW5zaXZlqUFsd2F5cyBvbqNkc3mmSml0dGVypGR5YXemU3RhdGljp35kcGl0Y2iCp2RlZ3JlZTIApmRlZ3JlZdCno3lhd6xMZWZ0ICYgUmlnaHSnQWVyb2JpY94AEaVkZWxheYKkaG9sZMKkdGljawSob3ZlcnJpZGXDpH5kc3mEoXIeoWwho2ludsKjaml0p0RlZmF1bHSmfmRtb2RlgaV5bW9kZZKoQm9keSB5YXehfqV+ZHlhd4GmZGVncmVlXap+ZGVmZW5zaXZlhKZzd2l0Y2jCpXRpY2tzAKRiYXNlpUZsaWNrpXR3b3JrrkNvbW1hbmQgbnVtYmVyqX5tb2RpZmllcoOkd2F5MgCkd2F5MwCjd2F5JqR+eWF3hKR5MTgwBaFsAKFyAKNzZWypQXQgdGFyZ2V0qX5vdmVycmlkZYGndmlzaWJsZcKobW9kaWZpZXKSpkNlbnRlcqF+pWRtb2RlqUFsd2F5cyBvbqZkcGl0Y2igqWRlZmVuc2l2ZalBbHdheXMgb26jZHN5pkppdHRlcqRkeWF3qFNpZGV3YXlzp35kcGl0Y2iCp2RlZ3JlZTIepmRlZ3JlZVmjeWF3qEJhY2t3YXJkpVVzaW5n3gARpWRlbGF5gqRob2xkwqR0aWNrAahvdmVycmlkZcOkfmRzeYShcjyhbDyjaW52wqNqaXSnRGVmYXVsdKZ+ZG1vZGWBpXltb2RlkaF+pX5keWF3gaZkZWdyZWUAqn5kZWZlbnNpdmWEpnN3aXRjaMKldGlja3MApGJhc2WnRGVmYXVsdKV0d29ya65Db21tYW5kIG51bWJlcql+bW9kaWZpZXKDpHdheTIApHdheTMAo3dheRSkfnlhd4SkeTE4MAChbAChcgCjc2VsqUF0IHRhcmdldKl+b3ZlcnJpZGWBp3Zpc2libGXCqG1vZGlmaWVykqZDZW50ZXKhfqVkbW9kZadPbiBwZWVrpmRwaXRjaKZTdGF0aWOpZGVmZW5zaXZlqFByZSBwZWVro2RzeaZSYW5kb22kZHlhd6ZTdGF0aWOnfmRwaXRjaIKnZGVncmVlMgCmZGVncmVlWaN5YXeoQmFja3dhcmSpZHNldHRpbmdzp0J1aWxkZXKmYWFmZWF0jaVzdGF0ZaVVc2luZ6VzbGlkZcOoZGlzYWJsZXKUrVdhcm11cCBwZXJpb2SpUm91bmQgZW5kqUJhY2sgc3RhYqF+pWJydXRlw6VidGltZQWmZXh0ZW5kwqd+ZXh0ZW5kgqVwaXRjaACjeWF3AKp+c2FmZV9oZWFkg6VzdGF0ZZKoQWVyb2JpYyuhfqZlbmFibGWTpUtuaWZlpFpldXOhfqRkZWZlwqp+ZmFrZWZsaWNrg6VwaXRjaACjeWF3RqZpbnZlcnTDpWVwZWVrw6VibW9kZZKjWWF3oX6pZmFrZWZsaWNrwqlzYWZlX2hlYWTDpXdvcmxkiaR6b29tw6l2aWV3bW9kZWzDrH5hc3BlY3RyYXRpb4GlcmF0aW/Mp6p+dmlld21vZGVshKF4AKNmb3Y9oXr8oXnQ3aV+bmFkZYKnbW9sb3RvdqkjRkY2RTRCRkalc21va2WpI0M4QzhDOEZGqH5teXN0ZXJ5g6lkZWZlbnNpdmWpIzAwRkZENzNDpmNoYXJnZakjNjlGRjAwM0OtaW5kaWNhdGVfd2hlbpOpRGVmZW5zaXZlpkNoYXJnZaF+q2FzcGVjdHJhdGlvw6RuYWRlkaF+p215c3RlcnnDpG1pc2OIp3Fzd2l0Y2jDqWVkZ2Vfc3RvcMKmbGFkZGVyw6RmYWxswqV+YW5pbYOkbGVhbqhEaXNhYmxlZKRncm5kqERpc2FibGVko2FpcqhEaXNhYmxlZKRhbmltw6ZjaXJjbGXCqGZkX3NwZWVkw6d2aXN1YWxziqh+bG9nZ2luZ4SldXBwZXLCpGZvbnQBpm5vdGlmecKmbGVmdHVwlKpIaXQgLyBNaXNzrU5hZGVzIC8gU3RhYnOpUHVyY2hhc2VzoX6mY3Njb3Blw6h+bWFudWFsc4KmY29sb3IyqSNGRjAwMDBGRqVjb2xvcqkjMDBGMEZGRkanfmNzY29wZYelY29sb3KpI0ZGRkZGRkZGpnJlc3VtZQCmb2Zmc2V0S6hkaXNhYmxlcpGhfqRzaXplBaRnbG93wqhyb3RhdGlvbgCqfndhdGVybWFya4SldXBwZXLDpGZvbnQCpGdsb3fCpWNvbG9yqSNGRkZGRkZGRqdsb2dnaW5nw6ZkYW1hZ2XCp21hbnVhbHPCp35kYW1hZ2WCpWNvbG9yqSNGRkZGRkZGRqRmb250Aql3YXRlcm1hcmvDrnZpc3VhbHNfc2VsZWN0BadhbnRpYWlthKlmcmVlc3RhbmTCqn5mcmVlc3RhbmSFpnRhcmdldKlBdCB0YXJnZXSlbGltaXQ8pGJvZHnDpG92ZXLCo3lhd8Onfm9mZnNldISmdGFyZ2V0qkxvY2FsIHZpZXelbGltaXQ8o29mZsKkb3ZlcsKmb2Zmc2V0AKRuYW1lp0RlZmF1bHQ=";
        v64 = {
            id = 0, 
            list = {}
        };
        v65 = v12.ui.home.cfg:selectable("Selection", {
            [1] = "Ragebot features", 
            [2] = "Anti-aim builder", 
            [3] = "Anti-aim features", 
            [4] = "Visual features", 
            [5] = "Misc features"
        }):depend({
            [1] = nil, 
            [2] = 5, 
            [1] = v12.ui.visuals_select
        });
        local v101 = v12.ui.home.cfg:list("", #v62:get_configs() > 0 and v62:get_configs() or {
            [1] = "No configs here! Create one."
        }):depend({
            [1] = nil, 
            [2] = 5, 
            [1] = v12.ui.visuals_select
        });
        local v102 = v12.ui.home.cfg:input(""):depend({
            [1] = nil, 
            [2] = 5, 
            [1] = v12.ui.visuals_select
        });
        v101:set_callback(function(v103)
            -- upvalues: v62 (ref), v102 (ref)
            local l_value_0 = v103.value;
            local v105 = v62:get(l_value_0);
            if not v105 then
                return;
            else
                v102:set(v105.name);
                return;
            end;
        end);
        events.render:set(function()
            -- upvalues: v62 (ref), v64 (ref), v101 (ref)
            local v106 = v62:get_configs();
            if #v106 ~= #v64.list then
                v64.list = v106;
                v101:update(#v106 > 0 and v106 or {
                    [1] = "No configs here! Create one."
                });
            end;
            local l_value_1 = v101.value;
            if l_value_1 ~= v64.id then
                v64.id = l_value_1;
            end;
        end);
        (function()
            -- upvalues: v102 (ref), v62 (ref), v101 (ref), v65 (ref), v63 (ref), l_clipboard_0 (ref), v12 (ref)
            local function v109()
                -- upvalues: v102 (ref)
                local v108 = v102.value:gsub(" ", "");
                if v108 == "" then
                    print_raw("Config name is empty");
                    common.add_notify("Config", "Name is empty");
                    return false;
                else
                    return true, v108;
                end;
            end;
            local function v112(v110)
                -- upvalues: v62 (ref)
                if #v62:get_configs() == 0 then
                    print_raw("No configs available");
                    common.add_notify("Config", "No available");
                    return false;
                else
                    local v111 = v62:get(v110);
                    if not v111 then
                        print_raw("Config not found");
                        common.add_notify("Config", "Not found");
                        return false;
                    else
                        return true, v111;
                    end;
                end;
            end;
            local function v117()
                -- upvalues: v112 (ref), v101 (ref), v65 (ref), v62 (ref)
                local v113, v114 = v112(v101.value);
                if not v113 then
                    return;
                else
                    for _, v116 in ipairs(v65.value) do
                        if v116 == "Ragebot features" then
                            v62:import(v114.code, "rage");
                            print_dev("Loaded Ragebot features");
                        end;
                        if v116 == "Anti-aim builder" then
                            v62:import(v114.code, "building");
                            print_dev("Loaded Anti-aim builder");
                        end;
                        if v116 == "Anti-aim features" then
                            v62:import(v114.code, "aafeat");
                            v62:import(v114.code, "antiaim");
                            print_dev("Loaded Anti-aim features");
                        end;
                        if v116 == "Visual features" then
                            v62:import(v114.code, "visuals");
                            v62:import(v114.code, "world");
                            print_dev("Loaded Visual features");
                        end;
                        if v116 == "Misc features" then
                            v62:import(v114.code, "misc");
                            print_dev("Loaded Misc features");
                        end;
                    end;
                    print_raw("Config loaded successfully");
                    common.add_notify("Config", "Loaded successfully");
                    return;
                end;
            end;
            local function v120()
                -- upvalues: v63 (ref), v62 (ref)
                local l_v63_1 = v63;
                if not l_v63_1 then
                    print_raw("Clipboard is empty");
                    common.add_notify("Config", "Clipboard is empty");
                    return;
                else
                    local _ = pcall(v62.create_from_encoded_data, v62, l_v63_1);
                    print_raw("Default config loaded successfully");
                    common.add_notify("Config", "Default loaded successfully");
                    return;
                end;
            end;
            local function v125()
                -- upvalues: v109 (ref), v62 (ref), v101 (ref)
                local v121, v122 = v109();
                if not v121 then
                    return;
                else
                    local v123 = v62:export(v122);
                    local v124 = v62:get(v101.value);
                    if not v124 or v122 ~= v124.name then
                        v62:create(v122, v123);
                    else
                        v62:save(v101.value, v123);
                    end;
                    print_raw("Config saved successfully");
                    common.add_notify("Config", "Saved successfully");
                    return;
                end;
            end;
            local function v126()
                -- upvalues: v112 (ref), v101 (ref), v62 (ref)
                if not v112(v101.value) then
                    return;
                else
                    v62:delete(v101.value);
                    print_raw("Config removed successfully");
                    common.add_notify("Config", "Removed successfully");
                    return;
                end;
            end;
            local function v129()
                -- upvalues: v109 (ref), l_clipboard_0 (ref), v62 (ref)
                local v127, v128 = v109();
                if not v127 then
                    return;
                else
                    l_clipboard_0.set(v62:export(v128));
                    print_raw("Copied to clipboard");
                    common.add_notify("Config", "Copied to clipboard");
                    return;
                end;
            end;
            local function v132()
                -- upvalues: l_clipboard_0 (ref), v62 (ref)
                local v130 = l_clipboard_0.get();
                if not v130 then
                    print_raw("Clipboard is empty");
                    common.add_notify("Config", "Clipboard is empty");
                    return;
                else
                    local v131 = pcall(v62.create_from_encoded_data, v62, v130);
                    print_raw(v131 and "Config imported successfully" or "Invalid config data");
                    common.add_notify("Config", v131 and "Config imported successfully" or "Invalid config data");
                    return;
                end;
            end;
            v12.ui.home.cfg:label("Main"):depend({
                [1] = nil, 
                [2] = 5, 
                [1] = v12.ui.visuals_select
            });
            v12.ui.home.cfg:button("\v\f<download>", v117, true, "Load config"):depend({
                [1] = nil, 
                [2] = 5, 
                [1] = v12.ui.visuals_select
            });
            v12.ui.home.cfg:button("\v\f<upload>", v125, true, "Save config"):depend({
                [1] = nil, 
                [2] = 5, 
                [1] = v12.ui.visuals_select
            });
            v12.ui.home.cfg:button("\v\f<trash>", v126, true, "Delete config"):depend({
                [1] = nil, 
                [2] = 5, 
                [1] = v12.ui.visuals_select
            });
            v12.ui.home.cfg:button("\v\f<shield>", v120, true, "Load default config"):depend({
                [1] = nil, 
                [2] = 5, 
                [1] = v12.ui.visuals_select
            });
            v12.ui.home.cfg:label("Clipboard"):depend({
                [1] = nil, 
                [2] = 5, 
                [1] = v12.ui.visuals_select
            });
            v12.ui.home.cfg:button("\v\f<file-export>", v129, true, "Export config to clipboard"):depend({
                [1] = nil, 
                [2] = 5, 
                [1] = v12.ui.visuals_select
            });
            v12.ui.home.cfg:button("\v\f<file-import>", v132, true, "Import config from clipboard"):depend({
                [1] = nil, 
                [2] = 5, 
                [1] = v12.ui.visuals_select
            });
        end)();
    end;
    v17 = v12.ui;
    utils.execute_after(0.1, l_pui_0.setup, v17);
end;
v16 = nil;
v17 = nil;
local v133 = nil;
local v134 = false;
local v135 = -1;
local function v137(v136)
    if not v136 then
        speed = 0;
        return;
    else
        speed = math.sqrt(v136.m_vecVelocity.x ^ 2 + v136.m_vecVelocity.y ^ 2);
        return speed;
    end;
end;
do
    local l_v134_0, l_v135_0, l_v137_0 = v134, v135, v137;
    local function v142(v141)
        -- upvalues: l_v135_0 (ref), l_v134_0 (ref)
        if not v141 then
            l_v135_0 = 0;
            l_v134_0 = false;
            return;
        else
            if v141.m_hGroundEntity then
                l_v135_0 = l_v135_0 + 1;
            else
                l_v135_0 = 0;
            end;
            l_v134_0 = l_v135_0 >= 8;
            return l_v135_0, l_v134_0;
        end;
    end;
    local l_realtime_0 = globals.realtime;
    v133 = false;
    v17 = function(v144)
        -- upvalues: v133 (ref), v12 (ref), l_realtime_0 (ref)
        local v145 = entity.get_local_player();
        if not v145 then
            return;
        else
            v133 = false;
            if not v12.ui.building.Using.override.value then
                return;
            elseif not v144.in_use then
                l_realtime_0 = globals.realtime;
                return;
            else
                for _, v147 in pairs({
                    entity.get_entities("CPlantedC4"), 
                    entity.get_entities("CHostage")
                }) do
                    for _, v149 in pairs(v147) do
                        local v150 = v145:get_origin():dist((v149:get_origin()));
                        if v150 < 65 and v150 > 1 and v145.m_iTeamNum == 3 then
                            return;
                        end;
                    end;
                end;
                if v145.m_iTeamNum == 2 and v145.m_bInBombZone then
                    return;
                elseif v144.in_use and globals.realtime - l_realtime_0 < 0.02 then
                    return;
                else
                    v144.in_use = false;
                    v133 = true;
                    return;
                end;
            end;
        end;
    end;
    local function v157(v151)
        -- upvalues: l_v137_0 (ref), v142 (ref), v12 (ref), v133 (ref), v9 (ref)
        local v152 = entity.get_local_player();
        local v153 = l_v137_0(v152);
        local _, v155 = v142(v152);
        local l_m_flDuckAmount_0 = v152.m_flDuckAmount;
        if not v152 then
            return "Stay";
        elseif v12.ui.building.Using.override.value and v151.in_use and v133 then
            return "Using";
        elseif not v155 then
            if l_m_flDuckAmount_0 == 1 and v12.ui.building["Aerobic+"].override.value then
                return "Aerobic+";
            else
                return "Aerobic";
            end;
        elseif l_m_flDuckAmount_0 == 1 or v9.antiaim.other.fake_duck.value then
            if v153 > 2 and v12.ui.building["Duck+"].override.value then
                return "Duck+";
            else
                return "Duck";
            end;
        elseif v153 > 2 then
            if v9.antiaim.other.slide.value and v12.ui.building.Walk.override.value then
                return "Walk";
            else
                return "Move";
            end;
        else
            return "Stand";
        end;
    end;
    v16 = function(v158)
        -- upvalues: v157 (ref), v12 (ref)
        local v159 = v157(v158);
        if not v12.ui.building[v159].override.value then
            v159 = "Shared";
        end;
        return v159;
    end;
end;
v134 = nil;
v135 = nil;
v137 = 0;
local v160 = false;
do
    local l_v137_1, l_v160_0 = v137, v160;
    local function v169(v163, v164, v165)
        -- upvalues: l_v137_1 (ref), l_v160_0 (ref)
        local l_v164_0 = v164;
        local l_v165_0 = v165;
        if globals.choked_commands == 0 then
            l_v137_1 = l_v137_1 + 1;
        end;
        local v168 = l_v165_0 and globals.tickcount % 50 > 10 and 1 or rage.exploit:get() < 1 and 1 or l_v164_0;
        l_v164_0 = v163 == "Random" and math.random(math.min(1, v168), math.max(3, v168)) or v168;
        if l_v137_1 % l_v164_0 == 0 and globals.choked_commands == 0 then
            l_v160_0 = not l_v160_0;
            l_v137_1 = 0;
        end;
    end;
    local function v173(v170, v171, v172)
        return v170 + (v171 - v170) * v172;
    end;
    local v174 = 0;
    local v175 = false;
    local function v182(v176)
        -- upvalues: v174 (ref), v175 (ref)
        local v177 = entity.get_local_player();
        if not v177 or not v177:is_alive() or v174 == globals.tickcount then
            return;
        else
            local v178 = entity.get(v176.userid, true);
            if not v178 or not v178:is_enemy() or v178:is_dormant() then
                return;
            else
                local v179 = vector(v176.x, v176.y, v176.z);
                local v180 = v178:get_origin();
                local v181 = v177:get_hitbox_position(0);
                if v181:dist((v181:closest_ray_point(v180, v179))) > 80 then
                    return;
                else
                    v175 = true;
                    return;
                end;
            end;
        end;
    end;
    local function v184(v183)
        -- upvalues: v174 (ref)
        if entity.get(v183.userid, true):get_index() == entity.get_local_player():get_index() then
            v174 = globals.tickcount;
        end;
    end;
    v12.ui.aafeat.brute:set_event("bullet_impact", v182);
    v12.ui.aafeat.brute:set_event("player_hurt", v184);
    local function v198(v185)
        -- upvalues: v16 (ref), v12 (ref)
        local v186 = entity.get_local_player();
        if not v186 then
            return;
        else
            local v187 = v16(v185);
            local v188 = entity.get_threat(false);
            local v189 = v186:get_eye_position();
            local v190 = v186:get_eye_position();
            if v188 then
                v190 = v188:get_eye_position();
            end;
            local v191 = v186:get_player_weapon();
            if not v191 then
                return;
            else
                local v192 = (v189 - v190).z >= 50 or (v189 - v190).z <= -40;
                local v193 = false;
                if v187 == "Aerobic+" and v12.ui.aafeat.safe_head.state:get("Aerobic+") then
                    v193 = true;
                elseif v187 == "Duck+" and v12.ui.aafeat.safe_head.state:get("Duck+") then
                    v193 = true;
                elseif v187 == "Duck" and v12.ui.aafeat.safe_head.state:get("Duck") then
                    v193 = true;
                end;
                local v194 = v191:get_classname() == "CKnife" and v12.ui.aafeat.safe_head.enable:get("Knife");
                local v195 = v191:get_classname() == "CWeaponTaser" and v12.ui.aafeat.safe_head.enable:get("Zeus");
                local v196 = v12.ui.aafeat.safe_head.enable:get("Height") and v192 or nil;
                local v197 = v193 and v12.ui.aafeat.safe_head.value and (v194 or v195) or nil;
                if v196 or v197 then
                    return true;
                else
                    return false;
                end;
            end;
        end;
    end;
    local v199 = 0;
    v135 = function()
        -- upvalues: v199 (ref)
        local l_m_nTickBase_0 = entity.get_local_player().m_nTickBase;
        if math.abs(l_m_nTickBase_0 - v199) > 64 then
            v199 = 0;
        end;
        local v201 = 0;
        if v199 < l_m_nTickBase_0 then
            v199 = l_m_nTickBase_0;
        elseif l_m_nTickBase_0 < v199 then
            v201 = math.min(14, math.max(0, v199 - l_m_nTickBase_0 - 1));
        end;
        return v201;
    end;
    local function v207()
        -- upvalues: v9 (ref), v135 (ref), v12 (ref)
        local l_leg_movement_0 = v9.antiaim.other.leg_movement;
        local v203 = v135();
        local v204 = nil;
        v204 = (not (v9.antiaim.other.leg_movement.value ~= "Walking") or v9.antiaim.other.leg_movement.value == "Default") and "Sliding" or "Walking";
        local l_value_2 = v9.antiaim.other.leg_movement.value;
        if v12.ui.misc.anim.grnd.value == "Force" then
            l_value_2 = "Sliding";
            v204 = "Walking";
        end;
        if v12.ui.misc.anim.grnd.value == "Walking" then
            l_value_2 = "Walking";
            v204 = "Sliding";
        end;
        local v206;
        if v203 <= 0 or not v204 then
            v206 = l_value_2;
        else
            v206 = v204;
        end;
        l_leg_movement_0:override(v206);
    end;
    local function v210()
        if globals.curtime < entity.get_game_rules().m_flRestartRoundTime then
            local v208 = false;
            entity.get_players(true, true, function(v209)
                -- upvalues: v208 (ref)
                if v209:is_alive() then
                    v208 = false;
                else
                    v208 = true;
                end;
            end);
            return v208;
        else
            return;
        end;
    end;
    local v211 = 0;
    v134 = function(v212)
        -- upvalues: l_weapons_0 (ref), v135 (ref), v16 (ref), v12 (ref), v198 (ref), v169 (ref), v133 (ref), v9 (ref), l_v160_0 (ref), v175 (ref), v211 (ref), v173 (ref)
        local v213 = entity.get_local_player();
        if not v213 then
            return;
        else
            local v214 = v213:get_player_weapon();
            if not v214 then
                return;
            else
                local v215 = l_weapons_0(v214);
                local v216 = v135();
                local v217 = v16(v212);
                local v218 = v12.ui.building[v217];
                local v219 = rage.exploit:get();
                local v220 = v12.get_bind("Manual offset");
                if v220[1] then

                end;
                local v221 = v198(v212);
                local v222 = {
                    base = v218.yaw.sel.value, 
                    yaw = {
                        val = v218.yaw.value, 
                        y180 = v218.yaw.y180.value, 
                        l = v218.yaw.l.value, 
                        r = v218.yaw.r.value
                    }, 
                    modifier = {
                        val = v218.modifier, 
                        way = v218.modifier.way.value, 
                        way2 = v218.modifier.way2.value, 
                        way3 = v218.modifier.way3.value
                    }, 
                    dsy = {
                        val = v218.dsy.value, 
                        inv = v218.dsy.inv.value, 
                        j = v218.dsy.jit.value, 
                        l = v218.dsy.l.value, 
                        r = v218.dsy.r.value
                    }, 
                    brt = {
                        val = v12.ui.aafeat.brute.value, 
                        mode = v12.ui.aafeat.bmode, 
                        time = v12.ui.aafeat.btime.value
                    }, 
                    delay = {
                        tick = v218.delay.tick.value, 
                        hold = v218.delay.hold.value
                    }, 
                    defensive = {
                        val = {
                            c = v218.defensive.value, 
                            work = v218.defensive.twork.value, 
                            base = v218.defensive.base.value, 
                            ticks = v218.defensive.ticks.value, 
                            onaa = v218.defensive.switch.value
                        }, 
                        pitch = {
                            select = v218.dpitch.value, 
                            degree = v218.dpitch.degree.value, 
                            degree2 = v218.dpitch.degree2.value
                        }, 
                        yaw = {
                            select = v218.dyaw.value, 
                            degree = v218.dyaw.degree.value
                        }, 
                        disabler = v218.dmode.ymode, 
                        activation = v218.dmode.value
                    }
                };
                v169(v222.dsy.val, v222.delay.tick, v222.delay.hold);
                local v223 = rage.antiaim:get_target(true);
                local v224 = entity.get_threat(true);
                local l_freestand_0 = v12.ui.antiaim.freestand;
                local v226 = nil;
                v226 = (not v220[1] or not v12.ui.antiaim.offset.off.value) and not v133 and (l_freestand_0.value or false);
                v9.antiaim.angles.freestand:override(v226);
                v9.antiaim.angles.fs_yaw:override(l_freestand_0.yaw.value);
                v9.antiaim.angles.fs_body:override(l_freestand_0.body.value);
                v226 = "Down";
                if v133 then
                    v226 = "Disabled";
                end;
                v9.antiaim.angles.pitch:override(v226);
                local v227 = v12.ui.aafeat.fakeflick.value and v219 == 1;
                if v220[1] then
                    v227 = false;
                elseif l_freestand_0.value then
                    v227 = false;
                elseif v221 then
                    v227 = false;
                elseif v133 then
                    v227 = false;
                elseif v215.is_revolver then
                    v227 = false;
                end;
                local v228 = false;
                if v220[1] and not v133 then
                    v228 = false;
                elseif v227 then
                    v228 = v12.ui.aafeat.fakeflick.invert.value;
                elseif v222.dsy.val == "Static" then
                    v228 = v222.dsy.inv;
                elseif v222.dsy.val == "Jitter" then
                    v228 = l_v160_0;
                else
                    v228 = v222.dsy.val == "Random" and l_v160_0;
                end;
                local v229 = 0;
                local v230 = 0;
                if v175 and v222.brt.val then
                    if globals.curtime - v211 >= v222.brt.time then
                        v175 = false;
                        v211 = globals.curtime;
                    end;
                    if v222.brt.mode:get("Yaw") then
                        v229 = v228 and -5 or 10;
                    else
                        v229 = 0;
                    end;
                    v230 = v222.brt.mode:get("Desync") and 30 or 0;
                end;
                local v231 = false;
                local v232 = false;
                local v233 = false;
                local v234 = false;
                if v222.defensive.val.c == "Pre peek" then
                    v233 = v223;
                elseif v222.defensive.val.c == "On hit" then
                    v233 = v224;
                elseif v222.defensive.val.c == "Always on" then
                    v233 = true;
                else
                    v233 = v227 and true or false;
                    v231 = true;
                end;
                v232 = v222.defensive.val.ticks == 0;
                if v233 and not v232 then
                    local l_ticks_0 = v222.defensive.val.ticks;
                    if v222.defensive.val.base == "Random" then
                        l_ticks_0 = math.random(v222.defensive.val.ticks, 16);
                    elseif v222.defensive.val.base == "Sway" then
                        l_ticks_0 = math.abs(math.sin(globals.curtime * 10)) * v222.defensive.val.ticks;
                    elseif v222.defensive.val.base == "Flick" then
                        l_ticks_0 = v212.command_number % 7 == 0 and 7 or v222.defensive.val.ticks;
                    end;
                    local l_work_0 = v222.defensive.val.work;
                    local v237 = v212.command_number % l_ticks_0 == 0;
                    if l_work_0 == "Tick count" then
                        v237 = globals.tickcount % l_ticks_0 == 0;
                    end;
                    v234 = v237 and true or false;
                else
                    v234 = false;
                end;
                if v233 or v227 then
                    v9.rage.binds.onshot_aa_options:override("Break LC");
                else
                    v9.rage.binds.onshot_aa_options:override();
                end;
                if v232 and v233 or v227 then
                    v9.rage.binds.doubletap_options:override("Always on");
                else
                    v9.rage.binds.doubletap_options:override();
                end;
                local v238;
                if not v227 or v212.command_number % 7 ~= 0 then
                    if v219 ~= 1 or not v234 then
                        v238 = false;
                    else
                        v238 = v234;
                    end;
                else
                    v238 = true;
                end;
                v212.force_defensive = v238;
                if v219 == 1 then
                    v212.send_packet = v216 <= 0 and false;
                    if v231 and v216 == 0 then
                        v231 = true;
                    else
                        v231 = false;
                    end;
                end;
                v232 = false;
                v233 = false;
                v234 = 0;
                v238 = 0;
                if v222.defensive.val.onaa and v219 == 1 then
                    if v222.defensive.activation == "Pre peek" then
                        v232 = v223 and true or false;
                    elseif v222.defensive.activation == "On hit" then
                        v232 = v224 and true or false;
                    elseif v222.defensive.activation == "Always on" then
                        v232 = true;
                    elseif v222.defensive.activation == "On peek" then
                        v232 = (v223 and v224) ~= nil;
                    end;
                else
                    v232 = v227 and true or false;
                    v231 = true;
                end;
                local l_degree_0 = v222.defensive.pitch.degree;
                local l_degree2_0 = v222.defensive.pitch.degree2;
                local v241 = math.random(0, l_degree2_0, 0.1);
                if v222.defensive.pitch.select == "Static" then
                    v238 = l_degree_0 + (l_degree_0 > 0 and -v241 or v241);
                end;
                if v222.defensive.yaw.select == "Randomize" then
                    v234 = math.normalize_yaw(globals.tickcount * 30 * math.random(-30, 30));
                elseif v222.defensive.yaw.select == "Static" then
                    v234 = v222.defensive.yaw.degree;
                elseif v222.defensive.yaw.select == "Sideways" then
                    v234 = l_v160_0 and v222.defensive.yaw.degree - v222.modifier.way or -v222.defensive.yaw.degree + v222.modifier.way;
                elseif v222.defensive.yaw.select == "Nightly" then
                    v234 = v212.command_number % 8 > 1 and v228 and 95 - v222.modifier.way or -95 + v222.modifier.way;
                end;
                v233 = v232;
                local l_value_3 = v12.ui.antiaim.offset.over.value;
                if v220[1] and l_value_3 and not v133 then
                    v233 = true;
                elseif l_freestand_0.value and l_freestand_0.over.value and not v133 then
                    v233 = true;
                elseif v221 then
                    v233 = v12.ui.aafeat.safe_head.defe.value;
                end;
                v9.antiaim.angles.hidden:override(v227 and true or v233);
                local v243 = v227 and v12.ui.aafeat.fakeflick.pitch.value or v238;
                if v220[1] and l_value_3 and not v133 then
                    v243 = math.abs(math.sin(globals.curtime * 10)) * 20 * math.random(-1, 1);
                elseif l_freestand_0.value and l_freestand_0.over.value and not v133 then
                    v243 = math.abs(math.sin(globals.curtime * 10)) * 20 * math.random(-1, 1);
                elseif v12.ui.aafeat.safe_head.defe.value and v221 and not v133 then
                    v243 = math.abs(math.sin(globals.curtime * 10)) * 20 * math.random(-1, 1);
                end;
                if v220[1] and l_value_3 and not v133 then
                    manyaw = 180;
                elseif l_freestand_0.value and l_freestand_0.over.value and not v133 then
                    manyaw = 180;
                elseif v12.ui.aafeat.safe_head.defe.value and v221 and not v133 then
                    manyaw = 180;
                else
                    local v244 = v12.ui.aafeat.fakeflick.yaw.value == 70 and 120 or v12.ui.aafeat.fakeflick.yaw.value;
                    manyaw = v227 and (v12.ui.aafeat.fakeflick.invert.value and v244 or -v12.ui.aafeat.fakeflick.yaw.value) or v234;
                end;
                if v12.ui.aafeat.safe_head.defe.value and v221 or not v221 then
                    rage.antiaim:override_hidden_pitch(v243);
                    if v222.defensive.yaw.select ~= "Spin" then
                        rage.antiaim:override_hidden_yaw_offset(manyaw);
                    end;
                end;
                v233 = "At Target";
                v234 = 0;
                v238 = 0;
                if v222.yaw.val == "Backward" or v222.yaw.val == "Backward + Left & Right" then
                    v233 = v222.yaw.y180;
                end;
                if v222.yaw.val == "Left & Right" or v222.yaw.val == "Backward + Left & Right" then
                    v233 = v228 and v222.yaw.l or v222.yaw.r;
                end;
                if v222.modifier.val:get("Center") then
                    v234 = v234 + (l_v160_0 and -v222.modifier.way or v222.modifier.way);
                end;
                if v222.modifier.val:get("Spin") then
                    v234 = v234 + (l_v160_0 and v173(-v222.modifier.way2, 0, globals.curtime * 4 % 2 - 1) or v173(v222.modifier.way2, 0, globals.curtime * 4 % 2 - 1));
                end;
                if v222.modifier.val:get("Randomize") then
                    v234 = v234 + (l_v160_0 and math.random(0, v222.modifier.way3 * 0.7, 0.2) or -math.random(0, v222.modifier.way3 * 0.7, 0.2));
                end;
                v238 = v222.base;
                l_degree_0 = v227 and 5 or v221 and 25 or (v133 and 180 or 0) + v233 + v234 + v229;
                v12.ui.antiaim.offset:override(0);
                if v220[1] and not v133 then
                    v12.ui.antiaim.offset:override();
                    v238 = v12.ui.antiaim.offset.target.value;
                    l_degree_0 = v12.ui.antiaim.offset.value;
                elseif l_freestand_0.value then
                    v238 = v12.ui.antiaim.freestand.target.value;
                end;
                v9.antiaim.angles.yaw_base:override(v238);
                v9.antiaim.angles.yaw:override("Backward");
                v9.antiaim.angles.yaw_offset:override(l_degree_0);
                v9.antiaim.angles.yaw_modifier:override("Disabled");
                v9.antiaim.angles.yaw_modifier_offset:override(0);
                v233 = false;
                if v223 and l_freestand_0.value and l_freestand_0.body.value and not v133 then
                    v233 = false;
                elseif v221 and not v133 then
                    v233 = false;
                else
                    v233 = v228;
                end;
                rage.antiaim:inverter(v233);
                v234 = 1;
                if v222.dsy.j == "Spin" then
                    v234 = math.abs(math.sin(globals.curtime * 5));
                elseif v222.dsy.j == "Random" then
                    v234 = utils.random_float(0, 1);
                elseif v222.dsy.j == "Nightly" then
                    v234 = math.abs(math.sin(globals.curtime * 5)) * utils.random_float(0, 1);
                end;
                v238 = v221 and 60 or v222.dsy.l * v234 - v230;
                l_degree_0 = v221 and 60 or v222.dsy.r * v234 - v230;
                if v220[1] and not v133 then
                    v238 = v12.ui.antiaim.offset.limit.value;
                    l_degree_0 = v12.ui.antiaim.offset.limit.value;
                elseif l_freestand_0.value and not v133 then
                    v238 = l_freestand_0.limit.value;
                    l_degree_0 = l_freestand_0.limit.value;
                end;
                v9.antiaim.angles.body_yaw_left:override(v238);
                v9.antiaim.angles.body_yaw_right:override(l_degree_0);
                l_degree2_0 = false;
                if v222.defensive.disabler:get("Body yaw") and v216 > 0 and v232 and v222.defensive.val.onaa and v219 == 1 then
                    l_degree2_0 = false;
                elseif v222.dsy.val ~= "Disabled" then
                    l_degree2_0 = true;
                end;
                v9.antiaim.angles.body_yaw:override(l_degree2_0);
                v9.antiaim.angles.body_yaw_options:override("codeined");
                v9.antiaim.angles.body_yaw_freestand:override("Off");
                v233 = v12.ui.aafeat.disabler:get("Back stab");
                v9.antiaim.angles.backstab:override(v233);
                v233 = v12.ui.aafeat.extend.value;
                v234 = v12.ui.aafeat.extend.pitch.value;
                v238 = v12.ui.aafeat.extend.yaw.value;
                v9.antiaim.angles.extended_angles:override(v233);
                v9.antiaim.angles.extended_angles.pitch:override(v234);
                v9.antiaim.angles.extended_angles.roll:override(v238);
                return;
            end;
        end;
    end;
    local function v246(v245)
        -- upvalues: v12 (ref), v210 (ref), v9 (ref), v134 (ref), v17 (ref), v207 (ref)
        if v12.ui.aafeat.disabler:get("Warmup period") and entity.get_game_rules().m_bWarmupPeriod or v12.ui.aafeat.disabler:get("Round end") and v210() then
            v9.antiaim.angles.pitch:override("Disabled");
            v9.antiaim.angles.yaw_base:override("Local View");
            v9.antiaim.angles.yaw:override("Backward");
            v9.antiaim.angles.yaw_offset:override(globals.tickcount % 18 * 20);
            v9.antiaim.angles.yaw_modifier:override("Disabled");
            v9.antiaim.angles.yaw_modifier_offset:override(0);
            v9.antiaim.angles.body_yaw:override(false);
            v9.antiaim.fakelag.limit:override(0);
        else
            v134(v245);
            v17(v245);
            v9.antiaim.fakelag.limit:override();
        end;
        if v12.ui.rage.fix.value then
            if not v9.rage.binds.peek_assist.value then
                v9.rage.binds.doubletap.imit:override(true);
            else
                v9.rage.binds.doubletap.imit:override();
            end;
        else
            v9.rage.binds.doubletap.imit:override();
        end;
        if v12.ui.aafeat.slide.value then
            v207();
        end;
    end;
    events.createmove(v246);
    v12.ui.aafeat.brute:set_event("round_end", function()
        -- upvalues: v175 (ref)
        v175 = false;
    end);
end;
v137 = {
    measure = function(v247, v248, v249)
        return (render.measure_text(v247, nil, v248 and v249:upper() or v249));
    end, 
    text = function(v250, v251, v252, v253, ...)
        local v254 = ...;
        render.text(v250, v251, v252, nil, v253 and v254:upper() or v254);
    end
};
v160 = nil;
local v255 = 0;
do
    local l_v255_0 = v255;
    local function v258(v257)
        -- upvalues: l_v255_0 (ref)
        if entity.get(v257.userid, true) ~= entity.get_local_player() then
            return;
        else
            l_v255_0 = globals.tickcount + 1;
            return;
        end;
    end;
    local function v260(v259)
        -- upvalues: l_v255_0 (ref), v9 (ref)
        if l_v255_0 <= globals.tickcount then
            v9.antiaim.fakelag.enabled:override();
            return;
        else
            v259.force_defensive = false;
            v9.antiaim.fakelag.enabled:override(false);
            return;
        end;
    end;
    local function v261()
        -- upvalues: l_v255_0 (ref)
        l_v255_0 = 0;
    end;
    v160 = function(v262)
        -- upvalues: v258 (ref), v261 (ref), v260 (ref), v9 (ref)
        local l_value_4 = v262.value;
        events.weapon_fire(v258, l_value_4);
        events.level_init(v261, l_value_4);
        events.createmove(v260, l_value_4);
        if not l_value_4 then
            v9.antiaim.fakelag.enabled:override();
        end;
    end;
    v12.ui.aafeat.epeek:set_callback(v160);
end;
v255 = {
    base_speed = 0.095, 
    _list = {}
};
local function v267(v264, v265, v266)
    return v264 + (v265 - v264) * v266;
end;
do
    local l_v267_0 = v267;
    v255.lerp = function(v269, v270, v271)
        -- upvalues: l_v267_0 (ref)
        if not v271 then
            v271 = 0.005;
        end;
        v271 = math.clamp(globals.absoluteframetime * v271 * 175, 0.01, 1);
        local v272 = l_v267_0(v269, v270, v271);
        if v270 == 0 and v272 < 0.02 and v272 > -0.02 then
            v272 = 0;
        elseif v270 == 1 and v272 < 1.01 and v272 > 0.99 then
            v272 = 1;
        end;
        return v272;
    end;
    v255.lerp_color = function(v273, v274, v275)
        -- upvalues: l_v267_0 (ref)
        return color(l_v267_0(v273.r, v274.r, v275), l_v267_0(v273.g, v274.g, v275), l_v267_0(v273.b, v274.b, v275), l_v267_0(v273.a, v274.a, v275));
    end;
    v255.new = function(v276, v277, v278, v279)
        -- upvalues: v255 (ref)
        if not v278 then
            v278 = v255.base_speed;
        end;
        if v255._list[v276] == nil then
            v255._list[v276] = v279 and v279 or 0;
        end;
        v255._list[v276] = v255.lerp(v255._list[v276], v277, v278);
        return v255._list[v276];
    end;
end;
v267 = nil;
local function v284()
    -- upvalues: v255 (ref), v12 (ref)
    if not entity.get_local_player() then
        return;
    else
        local v280 = v255.new("fov", v12.ui.world.viewmodel.fov.value or 68, 0.1);
        local v281 = v255.new("x", v12.ui.world.viewmodel.x.value * 0.1 or 2.5, 0.1);
        local v282 = v255.new("y", v12.ui.world.viewmodel.y.value * 0.1 or 1, 0.1);
        local v283 = v255.new("z", v12.ui.world.viewmodel.z.value * 0.1 or -1, 0.1);
        cvar.viewmodel_fov:float(v280, true);
        if v281 ~= v12.ui.world.viewmodel.x.value then
            cvar.viewmodel_offset_x:float(v281, true);
        end;
        if v282 ~= v12.ui.world.viewmodel.y.value then
            cvar.viewmodel_offset_y:float(v282, true);
        end;
        if v283 ~= v12.ui.world.viewmodel.z.value then
            cvar.viewmodel_offset_z:float(v283, true);
        end;
        return;
    end;
end;
v12.ui.world.viewmodel:set_event("render", v284);
local function v286()
    -- upvalues: v12 (ref)
    local v285 = v12.ui.world.aspectratio.ratio.value * 0.01;
    if not v12.ui.world.aspectratio.value then
        v285 = 0;
    end;
    cvar.r_aspectratio:float(v285, true);
end;
v12.ui.world.aspectratio.ratio:set_event("render", v286, function(v287)
    return v287.value;
end);
v284 = nil;
v284 = function()
    -- upvalues: v255 (ref), v12 (ref), v3 (ref)
    local v288 = v255.new("man.enabled", (not (v12.ui.antiaim.offset.value ~= 0) or entity.get_game_rules().m_bFreezePeriod) and 0 or 1);
    if v288 == 0 then
        return;
    else
        local v289 = v12.get_bind("Manual offset");
        local v290 = v289[1];
        local v291 = v255.new("man.switch_color", v290 and 1 or 0);
        local v292 = v255.new("man.radius", v288 == 1 and v289[2] or v12.ui.antiaim.offset.value);
        local v293 = v255.new("man.color", v12.ui.visuals.manuals.color.value);
        local v294 = v255.new("man.color2", v12.ui.visuals.manuals.color2.value);
        local v295 = v255.lerp_color(v294, v293, v291);
        render.circle_gradient(vector(v3.x * 0.5 + v292, v3.y * 0.5), v295:alpha_modulate(0), v295:alpha_modulate(255 * v288), 13, 0, 1);
        return;
    end;
end;
v12.ui.visuals.manuals:set_event("render", v284);
v286 = nil;
local function v302(v296, v297)
    -- upvalues: v2 (ref), v137 (ref), v12 (ref), v255 (ref)
    local v298 = entity.get_local_player();
    if not v298 then
        return;
    else
        if v296 == 5 then
            v296 = v2;
        end;
        local v299 = v137.measure(v296, v12.ui.visuals.watermark.upper.value, v297);
        local l_value_5 = v12.ui.visuals.watermark.value;
        local v301 = v255.new("color_watermark", v12.ui.visuals.watermark.color.value);
        return v298, v299, v255.new("draw_watermark", (not l_value_5 or entity.get_game_rules().m_bFreezePeriod) and 0 or 1), v301, (v255.new("draw_glow", l_value_5 and v12.ui.visuals.watermark.glow.value and 1 or 0));
    end;
end;
do
    local l_v302_0 = v302;
    v286 = function()
        -- upvalues: l_v302_0 (ref), v12 (ref), v3 (ref), v2 (ref), v137 (ref)
        local v304, v305, v306, v307, v308 = l_v302_0(v12.ui.visuals.watermark.font.value, "antarctica nightly");
        if v306 == 0 then
            return;
        elseif not v304 then
            return;
        else
            if v308 > 0 then
                render.shadow(vector(v3.x / 2 - v305.x / 2 - 2, v3.y - 8), vector(v3.x / 2 + v305.x / 2, v3.y - 8), v307:alpha_modulate(255 * v308));
            end;
            local l_value_6 = v12.ui.visuals.watermark.font.value;
            local v310 = 16;
            if v12.ui.visuals.watermark.font.value == 5 then
                l_value_6 = v2;
                v310 = 20;
            end;
            if l_value_6 == 2 then
                v310 = 15;
            end;
            local v311 = ui.get_style("Link Active"):to_hex();
            v137.text(l_value_6, vector(v3.x / 2 - v305.x * 0.5, v3.y - v310 + 3), v307:alpha_modulate(200 * v306), v12.ui.visuals.watermark.upper.value, "antarctica \a" .. v311 .. "nightly");
            return;
        end;
    end;
    v12.ui.visuals.watermark:set_event("render", v286);
end;
v302 = function(v312)
    -- upvalues: v9 (ref)
    if not entity.get_local_player() then
        return;
    elseif not v9.antiaim.other.fake_duck.value then
        return;
    else
        local v313 = 5;
        local l_forwardmove_0 = v312.forwardmove;
        local l_sidemove_0 = v312.sidemove;
        if v313 < math.abs(l_forwardmove_0) or v313 < math.abs(l_sidemove_0) then
            local v316 = 450 / (l_forwardmove_0 * l_forwardmove_0 + l_sidemove_0 * l_sidemove_0) ^ 0.5;
            v312.forwardmove = l_forwardmove_0 * v316;
            v312.sidemove = l_sidemove_0 * v316;
        end;
        return;
    end;
end;
local function v319(v317)
    local v318 = entity.get_local_player();
    sim = v318:simulate_movement((v318:get_origin()));
    sim:think(5);
    if sim.velocity.z < 0 then
        v317.block_movement = 2;
    end;
end;
local function v323(v320)
    local v321 = entity.get_local_player();
    if not v321 then
        return;
    else
        local v322 = v321:simulate_movement();
        v322:think(5);
        if v322.velocity.z > -500 then
            return;
        else
            if v322.velocity.z < -150 then
                v320.in_duck = 1;
            end;
            return;
        end;
    end;
end;
local function v331(v324)
    local v325 = entity.get_local_player();
    if v325.m_MoveType ~= 9 then
        return;
    else
        local v326 = v325:get_player_weapon();
        if not v326 then
            return;
        else
            local l_m_fThrowTime_0 = v326.m_fThrowTime;
            if l_m_fThrowTime_0 ~= nil then
                return;
            elseif l_m_fThrowTime_0 == 0 then
                return;
            elseif v325.m_vecLadderNormal == 0 then
                return;
            else
                local v328 = v325.m_vecLadderNormal:angles();
                local v329 = v324.forwardmove > 0;
                local v330 = math.normalize_yaw(v324.view_angles.y - v328.y) <= 0;
                if v324.view_angles.x - v328.x > 45 then
                    v329 = not v329;
                end;
                v324.in_back = v329 and 1 or 0;
                v324.in_forward = v329 and 0 or 1;
                if v330 then
                    v324.in_moveleft = v329 and 1 or 0;
                    v324.in_moveright = v329 and 0 or 1;
                else
                    v324.in_moveleft = v329 and 0 or 1;
                    v324.in_moveright = v329 and 1 or 0;
                end;
                v324.view_angles.x = 89;
                v324.view_angles.y = v328.y + (v330 and 90 or -90);
                return;
            end;
        end;
    end;
end;
local v332 = l_pui_0.find("Miscellaneous", "Main", "Movement", "Air Strafe", "Circle Strafe");
do
    local l_v332_0 = v332;
    local function v335(v334)
        -- upvalues: l_v332_0 (ref)
        if bit.band(v334.buttons, 1560) == 0 then
            l_v332_0:override(true);
        else
            l_v332_0:override();
        end;
    end;
    v12.ui.misc.circle:set_event("createmove", v335);
    v12.ui.misc.ladder:set_event("createmove", v331);
    v12.ui.misc.fall:set_event("createmove", v323);
    v12.ui.misc.edge_stop:set_event("createmove", v319);
    v12.ui.misc.fd_speed:set_event("createmove_run", v302);
end;
v302 = nil;
v319 = function(v336)
    if entity.get_local_player() ~= entity.get(v336.userid, true) then
        return;
    else
        utils.console_exec("slot3");
        utils.console_exec("slot2");
        utils.console_exec("slot1");
        return;
    end;
end;
v323 = function(v337)
    if entity.get_local_player() ~= entity.get(v337.userid, true) then
        return;
    else
        if v337.weapon == "weapon_taser" and cvar.sv_infinite_ammo:int() ~= 1 and cvar.mp_taser_recharge_time:int() < 0 then
            utils.console_exec("slot3");
            utils.console_exec("slot2");
            utils.console_exec("slot1");
        end;
        return;
    end;
end;
v12.ui.misc.qswitch:set_event("grenade_thrown", v319);
v12.ui.misc.qswitch:set_event("weapon_fire", v323);
v331 = l_pui_0.find("Miscellaneous", "Main", "Other", "Weapon Actions");
do
    local l_v331_0 = v331;
    v332 = function()
        -- upvalues: v12 (ref), l_v331_0 (ref)
        if v12.ui.misc.qswitch.value then
            local v339 = l_v331_0:get_override() or l_v331_0:get();
            for v340 = 1, #v339 do
                if v339[v340] == "Quick Switch" then
                    table.remove(v339, v340);
                end;
            end;
            l_v331_0:override(v339);
        else
            l_v331_0:override();
        end;
    end;
    v332();
    v12.ui.misc.qswitch:set_callback(v332, true);
end;
v319 = nil;
ffi.cdef("\t\ttypedef void*(__thiscall* get_client_entity_t)(void*, int);\n\t\ttypedef struct {\n\t\t\tchar pad_0000[20];\n\t\t\tint m_nOrder;\n\t\t\tint m_nSequence;\n\t\t\tfloat m_flPrevCycle;\n\t\t\tfloat m_flWeight;\n\t\t\tfloat m_flWeightDeltaRate;\n\t\t\tfloat m_flPlaybackRate;\n\t\t\tfloat m_flCycle;\n\t\t\tvoid *m_pOwner;\n\t\t\tchar pad_0038[4];\n\t\t} animation_layer;\n    ");
v323 = function(v341, v342)
    return function(...)
        -- upvalues: v341 (ref), v342 (ref)
        return v341(v342, ...);
    end;
end;
v331 = ffi.cast(ffi.typeof("uintptr_t**"), utils.create_interface("client.dll", "VClientEntityList003"));
v332 = v323(ffi.cast("get_client_entity_t", v331[0][3]), v331);
do
    local l_v332_1 = v332;
    local function v345(v344)
        -- upvalues: l_v332_1 (ref)
        return ffi.cast("animation_layer**", ffi.cast("char*", l_v332_1(ffi.cast(ffi.typeof("int"), v344:get_index()))) + 10640)[0];
    end;
    v319 = function(_)
        -- upvalues: v345 (ref), v12 (ref)
        local v347 = entity.get_local_player();
        if not v347 then
            return;
        else
            local l_m_vecVelocity_0 = v347.m_vecVelocity;
            local v349 = math.sqrt(l_m_vecVelocity_0.x ^ 2 + l_m_vecVelocity_0.y ^ 2);
            local l_m_fFlags_0 = v347.m_fFlags;
            local v351 = bit.band(l_m_fFlags_0, 1) ~= 0;
            (function()
                -- upvalues: v345 (ref), v347 (ref), v12 (ref), v349 (ref), v351 (ref)
                local v352 = v345(v347);
                if v12.ui.misc.anim.lean.value == "Disabled" then
                    v352[12].m_flWeight = 0;
                end;
                if v12.ui.misc.anim.lean.value == "Force" and v349 > 2 then
                    v352[12].m_flWeight = 1;
                end;
                if v12.ui.misc.anim.lean.value == "Earthquake" then
                    v352[12].m_flWeight = math.abs(math.sin(globals.realtime * 10)) * 1;
                end;
                if v12.ui.misc.anim.lean.value == "Jitter" then
                    v352[12].m_flWeight = globals.tickcount % 7;
                end;
                if v12.ui.misc.anim.air.value == "Walking" and not v351 then
                    v352[6].m_flWeight = 1;
                end;
            end)();
            if v12.ui.misc.anim.air.value == "Legacy" then
                local v353 = 0;
                if v349 > 2 then
                    if v351 then
                        v353 = 0.5 + math.min(v349 / 260, 1) * 0.5;
                    else
                        v353 = math.min(v349 / 360, 1) * 0.5;
                    end;
                end;
                v347.m_flPoseParameter[6] = v353;
            end;
            if v12.ui.misc.anim.air.value == "Force" then
                v347.m_flPoseParameter[6] = 1;
            end;
            if v12.ui.misc.anim.air.value == "Jitter" then
                v347.m_flPoseParameter[6] = utils.random_float(0.1, 1);
            end;
            if v12.ui.misc.anim.grnd.value == "Force" then
                v347.m_flPoseParameter[0] = 1;
            end;
            if v12.ui.misc.anim.grnd.value == "Jitter" then
                v347.m_flPoseParameter[7] = utils.random_float(0.1, 1);
                v347.m_flPoseParameter[0] = utils.random_float(0.1, 1);
                v347.m_flPoseParameter[1] = utils.random_float(0.1, 1);
            end;
            if v12.ui.misc.anim.grnd.value == "Walking" then
                v347.m_flPoseParameter[7] = 1;
            end;
            return;
        end;
    end;
    v12.ui.misc.anim:set_event("post_update_clientside_animation", v319);
end;
v323 = nil;
v331 = function(v354)
    -- upvalues: v12 (ref)
    local v355 = v354:get_origin();
    local v356 = v354:get_bbox();
    local l_value_7 = v12.ui.world.nade.molotov.value;
    render.circle_3d_outline(v355, l_value_7:alpha_modulate(255 * v356.alpha), 155, 0, 1, 1);
end;
do
    local l_v331_1 = v331;
    v332 = function()
        -- upvalues: l_v331_1 (ref)
        entity.get_entities("CInferno", nil, l_v331_1);
    end;
    local function v363(v359)
        -- upvalues: v12 (ref)
        if not v359.m_bDidSmokeEffect then
            return;
        else
            local v360 = v359:get_origin();
            local v361 = v359:get_bbox();
            local l_value_8 = v12.ui.world.nade.smoke.value;
            render.circle_3d_outline(v360, l_value_8:alpha_modulate(255 * v361.alpha), 155, 0, 1, 1);
            return;
        end;
    end;
    local function v364()
        -- upvalues: v363 (ref)
        entity.get_entities("CSmokeGrenadeProjectile", nil, v363);
    end;
    v12.ui.world.nade:set_event("render", v364, function(v365)
        return v365:get("Smoke");
    end);
    v12.ui.world.nade:set_event("render", v332, function(v366)
        return v366:get("Molotov");
    end);
end;
v331 = nil;
v331 = function()
    -- upvalues: v135 (ref), v255 (ref), v12 (ref)
    local v367 = entity.get_local_player();
    if not v367 then
        return;
    elseif not common.is_in_thirdperson() then
        return;
    else
        local v368 = v135() > 0;
        local v369 = rage.exploit:get() ~= 0 and rage.exploit:get() ~= 1;
        local v370 = v255.new("mistery.animate.colord", v12.ui.world.mystery.indicate_when:get("Defensive") and v368 and v12.ui.world.mystery.defensive.value or color(0, 0, 0, 0));
        local v371 = v255.new("mistery.animate.colorc", v12.ui.world.mystery.indicate_when:get("Charge") and v369 and v12.ui.world.mystery.charge.value or color(0, 0, 0, 0));
        render.highlight_hitbox(v367, 19, v370);
        render.highlight_hitbox(v367, 19, v371);
        return;
    end;
end;
v12.ui.world.mystery:set_event("render", v331);
v332 = {};
v332.below_crosshair_push = function(v372, v373)
    -- upvalues: v332 (ref)
    table.insert(v332, {
        alpha = 0, 
        text = v372, 
        realtime = globals.realtime, 
        time = v373
    });
end;
v332.below_crosshair_render = function()
    -- upvalues: v332 (ref), v255 (ref), v3 (ref), v12 (ref), v2 (ref)
    if not v332 or #v332 <= 0 then
        return;
    else
        while #v332 > 15 do
            table.remove(v332, 1);
        end;
        for v374 = #v332, 1, -1 do
            local v375 = v332[v374];
            if not v375 then
                table.remove(v332, v374);
            end;
            v375.alpha = v255.lerp(v375.alpha, globals.realtime - v375.realtime < v375.time and 1 or 0, 0.1);
            if v375.alpha <= 0 then
                table.remove(v332, v374);
            end;
        end;
        local v376 = vector(v3.x * 0.5, v3.y * 0.5 + 240);
        for _, v378 in ipairs(v332) do
            local v379 = v12.ui.visuals.logging.upper.value and v378.text:upper() or v378.text;
            local v380 = v12.ui.visuals.logging.font.value == 5 and v2 or v12.ui.visuals.logging.font.value;
            render.text(v380, v376, color(255, 255, 255):alpha_modulate(255 * v378.alpha), "c", v379);
            v376.y = v376.y + 16 * v378.alpha;
        end;
        return;
    end;
end;
local v381 = {
    [0] = "generic", 
    [1] = "head", 
    [2] = "chest", 
    [3] = "stomach", 
    [4] = "left arm", 
    [5] = "right arm", 
    [6] = "left leg", 
    [7] = "right leg", 
    [8] = "neck", 
    [9] = "gear"
};
local function v383(v382)
    if v382 == "hegrenade" then
        return "Naded";
    elseif v382 == "inferno" then
        return "Burned";
    elseif v382 == "knife" then
        return "Knifed";
    else
        return false;
    end;
end;
local function v390(v384)
    -- upvalues: v12 (ref), v332 (ref)
    if not v12.ui.visuals.logging.value then
        return;
    else
        local v385 = entity.get_local_player();
        if v385.m_iTeamNum == v384.team then
            return;
        else
            local v386 = entity.get(v384.userid, true);
            if v385 == v386 then
                return;
            else
                local v387 = v384.weapon:gsub("weapon_", ""):gsub("item_", ""):gsub("assaultsuit", "kevlar + helmet"):gsub("hkp2000", "p2000"):gsub("incgrenade", "molotov"):gsub("molotov", "molly"):gsub("grenade", "");
                if v387 == "unknown" then
                    return;
                else
                    local v388 = ui.get_style("Link Active"):to_hex();
                    local v389 = string.format("\a%s%s\aDEFAULT buy \a%s%s", v388, v386:get_name(), v388, v387);
                    print_dev(v389);
                    print_raw("\a" .. v388 .. "at\aDEFAULT \194\183 " .. v389);
                    v332.below_crosshair_push(v389, 5);
                    return;
                end;
            end;
        end;
    end;
end;
do
    local l_v381_0, l_v383_0 = v381, v383;
    local function v402(v393)
        -- upvalues: v12 (ref), l_v383_0 (ref), v332 (ref)
        if not v12.ui.visuals.logging.value then
            return;
        else
            local v394 = entity.get_local_player();
            local v395 = entity.get(v393.userid, true);
            if v394 ~= entity.get(v393.attacker, true) then
                return;
            elseif v394 == v395 then
                return;
            else
                local v396 = l_v383_0(v393.weapon);
                if v396 == false then
                    return;
                else
                    local l_dmg_health_0 = v393.dmg_health;
                    local l_health_0 = v393.health;
                    local v399 = ui.get_style("Link Active"):to_hex();
                    local l_v399_0 = v399;
                    local v401 = string.format("\a%s%s\aDEFAULT for \a%s%s\aDEFAULT \194\183 \a%s%s\aDEFAULT [ hp:\a%s%s\aDEFAULT ]", l_v399_0, v396, l_v399_0, v395:get_name(), l_v399_0, l_dmg_health_0, l_v399_0, l_health_0);
                    print_dev(v401);
                    print_raw("\a" .. v399 .. "at\aDEFAULT \194\183 " .. v401);
                    v332.below_crosshair_push(v401, 5);
                    return;
                end;
            end;
        end;
    end;
    local function v423(v403)
        -- upvalues: v12 (ref), l_v381_0 (ref), v332 (ref)
        if not v12.ui.visuals.logging.value then
            return;
        else
            local l_state_0 = v403.state;
            local l_target_0 = v403.target;
            local v406 = l_state_0 == nil and v403.damage or 0;
            local l_hitchance_0 = v403.hitchance;
            local v408 = l_v381_0[v403.hitgroup];
            local l_backtrack_0 = v403.backtrack;
            local l_wanted_damage_0 = v403.wanted_damage;
            local v411 = l_v381_0[v403.wanted_hitgroup];
            local v412 = v406 > 99 and "Killed" or "Hit";
            local v413 = (not (v406 <= 99) or l_state_0 ~= nil) and "" or " \194\183 ";
            local v414 = (not (v406 <= 99) or l_state_0 ~= nil) and "" or v406 .. "d";
            local l_l_wanted_damage_0_0 = l_wanted_damage_0;
            local v416 = l_state_0 == nil and v412 or "Miss";
            local v417 = ui.get_style("Link Active"):to_hex();
            local l_v417_0 = v417;
            local _ = color(255, 255, 255):to_hex();
            local v420 = l_state_0 == nil and " " or " " .. l_state_0 .. " ";
            local v421 = l_state_0 == nil and v408 .. "\aDEFAULT" or l_state_0 == nil and v408 == v411 and v408 .. "(" .. v411 .. ")\aDEFAULT" or v411 .. "\aDEFAULT \194\183";
            local v422 = string.format("%s \a%s%s\aDEFAULT due to \a%s%s%s\a%s%s\a%s%s\aDEFAULT[ hc:\a%s%s\aDEFAULT \194\183 bt:\a%s%s\aDEFAULT \194\183 dmg:\a%s%s\aDEFAULT ]", v416, l_v417_0, l_target_0:get_name(), l_v417_0, v421, v413, l_v417_0, v414, l_v417_0, v420, l_v417_0, l_hitchance_0, l_v417_0, l_backtrack_0, l_v417_0, l_l_wanted_damage_0_0);
            print_dev(v422);
            print_raw("\a" .. v417 .. "at\aDEFAULT \194\183 " .. v422);
            v332.below_crosshair_push(v422, 5);
            return;
        end;
    end;
    v12.ui.visuals.logging.leftup:set_event("item_purchase", v390, function(v424)
        return v424:get("Purchases");
    end);
    v12.ui.visuals.logging.leftup:set_event("player_hurt", v402, function(v425)
        return v425:get("Nades / Stabs");
    end);
    v12.ui.visuals.logging.leftup:set_event("aim_ack", v423, function(v426)
        return v426:get("Hit / Miss");
    end);
    v12.ui.visuals.logging.notify:set_event("render", v332.below_crosshair_render);
end;
v381 = nil;
v383 = 0;
do
    local l_v383_1 = v383;
    v381 = function()
        -- upvalues: l_v383_1 (ref), v12 (ref)
        if not entity.get_local_player() then
            l_v383_1 = 0;
            return;
        else
            l_v383_1 = l_v383_1 + 1;
            if rage.exploit:get() ~= 1 then
                l_v383_1 = 0;
                rage.exploit:force_charge();
                rage.exploit:allow_charge(true);
                return;
            else
                if l_v383_1 > v12.ui.rage.teleport.ticks.value then
                    rage.exploit:allow_defensive(false);
                    rage.exploit:force_teleport();
                end;
                return;
            end;
        end;
    end;
    v12.ui.rage.teleport:set_event("createmove", v381);
end;
v383 = {};
v390 = function(v428)
    -- upvalues: l_weapons_0 (ref)
    if not v428 then
        return;
    else
        local v429 = v428:get_player_weapon();
        local v430 = false;
        local l_m_flSimulationTime_0 = v428.m_flSimulationTime;
        if l_weapons_0(v429).is_revolver then
            v430 = v429.m_flNextPrimaryAttack < l_m_flSimulationTime_0;
        else
            v430 = not l_weapons_0(v429).is_melee_weapon and math.max(v428.m_flNextAttack, v429.m_flNextPrimaryAttack, v429.m_flNextSecondaryAttack) < l_m_flSimulationTime_0;
        end;
        return v430;
    end;
end;
render.box_3d = function(v432, v433, v434)
    local v435 = {
        v432, 
        vector(v432.x, v433.y, v432.z), 
        vector(v433.x, v433.y, v432.z), 
        vector(v433.x, v432.y, v432.z), 
        vector(v432.x, v432.y, v433.z), 
        vector(v432.x, v433.y, v433.z), 
        v433, 
        vector(v433.x, v432.y, v433.z)
    };
    local v436 = {};
    for v437, v438 in ipairs(v435) do
        local v439 = v438:to_screen();
        if v439 ~= nil then
            v436[v437] = v439;
        else
            return;
        end;
    end;
    render.poly_line(v434, v436[1], v436[2], v436[3], v436[4], v436[1]);
    render.poly_line(v434, v436[5], v436[6], v436[7], v436[8], v436[5]);
    render.line(v436[1], v436[5], v434);
    render.line(v436[2], v436[6], v434);
    render.line(v436[3], v436[7], v434);
    render.line(v436[4], v436[8], v434);
end;
v383.scanning = false;
v383.scan_origins = {};
v383.active = false;
v383.strafe_back = {};
v383.strafe_back.on = false;
v383.strafe_back.ticks = 0;
v383.last_peek = 0;
v383.peek_data = {
    start_tick = 0, 
    origin = vector(), 
    eye_pos = vector(), 
    scanned = vector(), 
    start_pos = vector()
};
do
    local l_v390_0 = v390;
    v383.createmove = function(v441)
        -- upvalues: v383 (ref), v12 (ref), v9 (ref), l_v390_0 (ref)
        local v442 = entity.get_local_player();
        if not v442 then
            return;
        else
            v383.scanning = false;
            v383.scan_origins = {};
            if not v12.ui.rage.assistance.value or not v9.rage.binds.peek_assist.value or not v442:is_alive() or l_v390_0(v442) == false or bit.band(v442.m_fFlags, 1) == 0 then
                v383.active = false;
                v383.strafe_back.on = false;
                v383.strafe_back.ticks = 0;
                return;
            else
                local v443 = v442:get_origin();
                local l_y_0 = render.camera_angles().y;
                local v445 = vector():angles(vector(0, l_y_0 - 90));
                local v446 = {
                    [1] = v443 + v445 * v12.ui.rage.assistance.dst.value + vector(0, 0, 16), 
                    [2] = v443 - v445 * v12.ui.rage.assistance.dst.value + vector(0, 0, 16)
                };
                v383.scanning = true;
                if not v383.active and globals.realtime - v383.last_peek > 0.5 then
                    for _, v448 in ipairs(v446) do
                        local v449 = utils.trace_hull(v448, v448 - vector(0, 0, 32), vector(-16, -16, 0), vector(16, 16, 72), 65545, 2);
                        if not v449.start_solid and not v449.all_solid and v449.start_pos ~= v449.end_pos then
                            local v450 = vector(v449.end_pos.x, v449.end_pos.y, v449.end_pos.z);
                            table.insert(v383.scan_origins, v450);
                            for v451 = 0, 64 do
                                local v452 = entity.get(v451);
                                if v452 ~= nil and v452:is_player() and not v383.active and v452:is_alive() and not v452:is_dormant() and v452:is_enemy() and not v452.m_bGunGameImmunity then
                                    local v453 = {
                                        v452:get_hitbox_position(0), 
                                        v452:get_hitbox_position(2)
                                    };
                                    for _, v455 in ipairs(v453) do
                                        if not v383.active and utils.trace_bullet(v442, v450 + vector(0, 0, 64), v455) > v12.ui.rage.assistance.dmg.value then
                                            v383.active = true;
                                            v383.peek_data.origin = v450;
                                            v383.peek_data.eye_pos = v450 + vector(0, 0, 64);
                                            v383.peek_data.scanned = v455;
                                            v383.peek_data.start_pos = v443;
                                            v383.peek_data.start_tick = v441.command_number;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
                if not v383.active or bit.band(v441.buttons, 1560) ~= 0 then
                    v383.strafe_back.on = false;
                    v383.strafe_back.ticks = 0;
                    return;
                else
                    v383.last_peek = globals.realtime;
                    local v456 = (v443 - v383.peek_data.origin):length2dsqr();
                    local l_y_1 = (v383.peek_data.origin - v443):angles().y;
                    if v456 < 50 or v441.command_number - v383.peek_data.start_tick > 48 then
                        v383.strafe_back.on = true;
                    end;
                    if v383.strafe_back.on then
                        l_y_1 = (v383.peek_data.start_pos - v443):angles().y;
                        v383.strafe_back.ticks = v383.strafe_back.ticks + 1;
                    end;
                    v441.forwardmove = 800;
                    v441.move_yaw = l_y_1;
                    if v383.strafe_back.ticks > 4 then
                        rage.exploit:force_teleport();
                    end;
                    if (v383.peek_data.start_pos - v443):length2dsqr() < 40 and v383.strafe_back.on then
                        v383.active = false;
                        v383.strafe_back.on = false;
                        v383.strafe_back.ticks = 0;
                    end;
                    return;
                end;
            end;
        end;
    end;
    v383.draw = function()
        -- upvalues: v12 (ref), v383 (ref)
        if not v12.ui.rage.assistance.line.value or not v383.scanning or not globals.is_connected or not globals.is_in_game then
            return;
        else
            if v383.active then
                render.box_3d(v383.peek_data.origin - vector(16, 16, -10), v383.peek_data.origin + vector(16, 16, 90), color(230, 230, 230));
                local v458 = v383.peek_data.eye_pos:to_screen();
                local v459 = v383.peek_data.scanned:to_screen();
                if v458 ~= nil and v459 ~= nil then
                    render.line(v458, v459, color(230, 230, 230):alpha_modulate(111));
                end;
            end;
            return;
        end;
    end;
    v383.on_aim_fire = function()
        -- upvalues: v383 (ref)
        v383.active = false;
        v383.strafe_back.ticks = 0;
        v383.strafe_back.on = false;
    end;
    v12.ui.rage.assistance:set_event("createmove", v383.createmove);
    v12.ui.rage.assistance:set_event("aim_fire", v383.on_aim_fire);
    v12.ui.rage.assistance:set_event("render", v383.draw);
end;
v390 = nil;
v390 = function(v460)
    -- upvalues: v9 (ref), v255 (ref)
    local v461 = entity.get_local_player();
    if not v461 then
        return;
    else
        local v462 = v461:get_player_weapon();
        if not v462 then
            return;
        else
            local l_m_bIsScoped_0 = v461.m_bIsScoped;
            local l_m_zoomLevel_0 = v462.m_zoomLevel;
            local v465 = l_m_bIsScoped_0 and l_m_zoomLevel_0 == 2 and v9.visuals.world.override_zoom.force_second.value and -30 or 0;
            local v466 = 0;
            v466 = l_m_zoomLevel_0 == 1 and 1 or 1.5;
            local l_value_9 = v9.visuals.world.fov.value;
            local v468 = v9.visuals.world.override_zoom.value * 0.5;
            local v469 = v255.new("action_sc", l_m_bIsScoped_0 and v466 or 0);
            v460.fov = v255.new("fov_sc", l_value_9 + v465) - v468 * v469;
            return;
        end;
    end;
end;
v12.ui.world.zoom:set_event("override_view", v390);
local v470 = nil;
v470 = function()
    -- upvalues: v12 (ref), v255 (ref), v2 (ref), v3 (ref)
    if not entity.get_local_player() then
        return;
    else
        local v471 = v12.get_bind("Min. Damage");
        local v472 = v255.new("damage.a", (not v471[1] or common.is_button_down(9) or entity.get_game_rules().m_bFreezePeriod) and 0 or 1);
        if v472 == 0 then
            return;
        else
            if v471[1] then
                local v473 = v255.new("damage.c", v12.ui.visuals.damage.color.value);
                local l_value_10 = v12.ui.visuals.damage.font.value;
                if v12.ui.visuals.damage.font.value == 5 then
                    l_value_10 = v2;
                end;
                local v475 = math.floor(v255.new("damage.d", v471[2]) + 0.5);
                if v471[2] == 0 then
                    v475 = l_value_10 == 2 and "AUTO" or "auto";
                end;
                render.text(l_value_10, vector(v3.x * 0.5 + 8, v3.y * 0.5 - 25), v473:alpha_modulate(255 * v472), nil, v475);
            end;
            return;
        end;
    end;
end;
v12.ui.visuals.damage:set_event("render", v470);
local v476 = nil;
v476 = function()
    -- upvalues: v255 (ref), v12 (ref), v3 (ref)
    local v477 = entity.get_local_player();
    if not v477 then
        return;
    else
        local v478 = math.floor(v255.new("cscope.pr", v12.ui.visuals.cscope.rotation.value) + 0.5);
        local l_value_11 = v12.ui.visuals.cscope.rotation.value;
        local v480 = v255.new("cscope.a", l_value_11 == v478 and v477.m_bIsScoped and 1 or l_value_11 == v478 and v477.m_bResumeZoom and v12.ui.visuals.cscope.resume.value / 255 or 0);
        if v480 == 0 then
            return;
        else
            local v481 = v3.x * 0.5;
            local v482 = v3.y * 0.5;
            local v483 = v255.new("cscope.s", v12.ui.visuals.cscope.offset.value * v480) + 0.5;
            local v484 = v255.new("cscope.o", v12.ui.visuals.cscope.size.value * v480) + 0.5;
            local v485 = v255.new("cscope.c", v12.ui.visuals.cscope.color.value);
            local l_a_0 = v485.a;
            local v487 = v255.new("cscope.d", not v12.ui.visuals.cscope.disabler:get("Up") and v480 or 0);
            local v488 = v255.new("cscope.u", not v12.ui.visuals.cscope.disabler:get("Down") and v480 or 0);
            local v489 = v255.new("cscope.l", not v12.ui.visuals.cscope.disabler:get("Left") and v480 or 0);
            local v490 = v255.new("cscope.r", not v12.ui.visuals.cscope.disabler:get("Right") and v480 or 0);
            if v12.ui.visuals.cscope.rotation.value ~= 0 then
                render.push_rotation(-v478);
            end;
            render.gradient(vector(v481, v482 + v483), vector(v481 + 1, v482 + v484), v485:alpha_modulate(l_a_0 * v488), v485:alpha_modulate(0), v485:alpha_modulate(0), v485:alpha_modulate(0), 0);
            render.gradient(vector(v481 + v483, v482), vector(v481 + v484, v482 + 1), v485:alpha_modulate(l_a_0 * v490), v485:alpha_modulate(0), v485:alpha_modulate(0), v485:alpha_modulate(0), 0);
            render.gradient(vector(v481, v482 - v483), vector(v481 + 1, v482 + 1 - v484), v485:alpha_modulate(l_a_0 * v487), v485:alpha_modulate(0), v485:alpha_modulate(0), v485:alpha_modulate(0), 0);
            render.gradient(vector(v481 - v483, v482), vector(v481 - v484, v482 + 1), v485:alpha_modulate(l_a_0 * v489), v485:alpha_modulate(0), v485:alpha_modulate(0), v485:alpha_modulate(0), 0);
            local v491 = v483 < v484 and v484 or v483;
            local v492 = v483 < v484 and v483 or v484;
            local v493 = v255.new("cscope.gd", v12.ui.visuals.cscope.glow.value and v487 or 0);
            local v494 = v255.new("cscope.gu", v12.ui.visuals.cscope.glow.value and v488 or 0);
            local v495 = v255.new("cscope.gl", v12.ui.visuals.cscope.glow.value and v489 or 0);
            local v496 = v255.new("cscope.gr", v12.ui.visuals.cscope.glow.value and v490 or 0);
            render.shadow(vector(v481, v482 - v491), vector(v481 + 1, v482 - v492), v485:alpha_modulate(l_a_0 * v493));
            render.shadow(vector(v481, v482 + v492), vector(v481 + 1, v482 + v491), v485:alpha_modulate(l_a_0 * v494));
            render.shadow(vector(v481 - v491, v482), vector(v481 - v492, v482 + 1), v485:alpha_modulate(l_a_0 * v495));
            render.shadow(vector(v481 + v492, v482), vector(v481 + v491, v482 + 1), v485:alpha_modulate(l_a_0 * v496));
            if v12.ui.visuals.cscope.rotation.value ~= 0 then
                render.pop_rotation();
            end;
            return;
        end;
    end;
end;
v12.ui.visuals.cscope:set_event("render", v476);
v12.ui.visuals.cscope:set_callback(function(v497)
    -- upvalues: v9 (ref)
    if v497.value then
        v9.visuals.world.override_zoom.scope_overlay:override("Remove All");
    else
        v9.visuals.world.override_zoom.scope_overlay:override();
    end;
end, true);