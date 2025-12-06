local v0 = ui.get_style("Link Active");
local v1 = {
    gradient = require("neverlose/gradient"), 
    timer = require("neverlose/timer"), 
    base64 = require("neverlose/base64"), 
    drag_system = require("neverlose/drag_system"), 
    clipboard = require("neverlose/clipboard"), 
    pui = require("neverlose/pui")
};
local _ = {};
local v3 = {};
local v4 = {};
local v5 = {
    yaw_mod_add = "Disabled", 
    yaw_offset_add = 0, 
    options_add = "", 
    right_fake_add = 0, 
    left_fake_add = 0, 
    byaw_add = false, 
    mod_offset_add = 0
};
v3.enableaanl = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled");
v3.disable = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw");
v3.pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch");
v3.yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw");
v3.base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base");
v3.yawoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset");
v3.backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab");
v3.hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden");
v3.modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier");
v3.modoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset");
v3.bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw");
v3.inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter");
v3.leftlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit");
v3.rightlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit");
v3.options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options");
v3.bodyyawfs = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding");
v3.extended = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles");
v3.extendedpitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch");
v3.extendedroll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll");
v3.fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding");
v3.fss = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers");
v3.fsb = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding");
v3.fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
v3.sw = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk");
v3.leg = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement");
v3.pa = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist");
v3.dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
v3.hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
v3.hslag = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options");
v3.dtlag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options");
v3.scope = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay");
v3.fov = ui.find("Visuals", "World", "Main", "Field of View");
v3.weaponact = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions");
v3.spike = ui.find("Miscellaneous", "Main", "Other", "Fake Latency");
v3.bodyaim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim");
v3.safe_points = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points");
v3.dormant = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot");
v3.min_damage_ui = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
v3.dmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
v3.clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag");
v3.ragebot_find = ui.find("Aimbot", "Ragebot", "Main");
v3.hc_find = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance");
local v6 = {
    home = v1.pui.create("Home", {
        [1] = {
            [1] = "m1", 
            [2] = "\n", 
            [3] = 1
        }, 
        [2] = {
            [1] = "config", 
            [2] = "\n\n", 
            [3] = 2
        }, 
        [3] = {
            [1] = "config_make", 
            [2] = "\n\n\n", 
            [3] = 2
        }, 
        [4] = {
            [1] = "links", 
            [2] = "Links", 
            [3] = 1
        }, 
        [5] = {
            [1] = "verify", 
            [2] = "\n\n\n\n\n\n", 
            [3] = 1
        }
    }), 
    antiaim = v1.pui.create("Antiaim", {
        [1] = {
            [1] = "main", 
            [2] = "Main", 
            [3] = 1
        }, 
        [2] = {
            [1] = "mode", 
            [2] = "\n", 
            [3] = 2
        }, 
        [3] = {
            [1] = "defensive", 
            [2] = "Defensive", 
            [3] = 1
        }, 
        [4] = {
            [1] = "builder", 
            [2] = "\n\n", 
            [3] = 2
        }, 
        [5] = {
            [1] = "body", 
            [2] = "\n\n\n", 
            [3] = 2
        }
    }), 
    misc = v1.pui.create("Misc", {
        [1] = {
            [1] = "widgets", 
            [2] = "Widgets", 
            [3] = 1
        }, 
        [2] = {
            [1] = "visuals", 
            [2] = "Visuals", 
            [3] = 2
        }, 
        [3] = {
            [1] = "settings", 
            [2] = "\n", 
            [3] = 1
        }
    })
};
v6.home.m1:label("\f<person-circle-question>    User");
v6.home.m1:button(common.get_username(), 0, true);
v6.home.m1:label("\f<code-compare>     Version");
v6.home.m1:button("VIP", 0, true);
v6.home.links:label("Scripts");
v6.home.links:button("Live", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=NdpjOe");
end, true);
v6.home.links:button("Beta", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=9bQgbH");
end, true);
v6.home.links:button("Secret", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=IkxXNP");
end, true);
v6.home.links:label("Vensense is a premium script of Venture \n\226\128\147 advanced antiaim mods made simple.");
v6.home.verify:button("                               \f<discord>  Join Us!                                 ", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/xUE2k7gmUz");
end, true);
local v7 = {
    [1] = "Standing", 
    [2] = "Moving", 
    [3] = "Slowmode", 
    [4] = "Crouching", 
    [5] = "Crouch Move", 
    [6] = "In Air", 
    [7] = "Air Crouch"
};
local v8 = {
    [1] = "STAND", 
    [2] = "RUN", 
    [3] = "SLOW", 
    [4] = "SNEAK", 
    [5] = "SNEAK", 
    [6] = "AIR", 
    [7] = "AIRC"
};
local v9 = {
    [1] = "OFF", 
    [2] = "T", 
    [3] = "CT"
};
local _ = {
    T = 1, 
    OFF = "Disabled", 
    CT = 2
};
local v11 = {
    [1] = "T", 
    [2] = "CT"
};
local v12 = {
    IN_AIR_DUCKING = 262, 
    IN_AIR = 256, 
    DUCKING = 263, 
    ON_GROUND = 257
};
local v13 = {
    DUCK = 4, 
    SLOW_WALK = 3, 
    WALK = 2, 
    STAND = 1, 
    AIR = 6, 
    AIR_DUCK = 7, 
    DUCK_MOVE = 5
};
local function v20()
    -- upvalues: v12 (ref), v13 (ref)
    local v14 = entity.get_local_player();
    if not v14 then
        return;
    else
        local v15 = v14.m_vecVelocity:length2d();
        local l_m_fFlags_0 = v14.m_fFlags;
        local v17 = ({
            [v12.ON_GROUND] = {
                [v15 < 3] = v13.STAND, 
                [v15 >= 3 and v15 < 81] = v13.SLOW_WALK, 
                [v15 >= 81] = v13.WALK
            }, 
            [v12.DUCKING] = {
                [v15 < 3] = v13.DUCK, 
                [v15 >= 3] = v13.DUCK_MOVE
            }, 
            [v12.IN_AIR] = v13.AIR, 
            [v12.IN_AIR_DUCKING] = v13.AIR_DUCK
        })[l_m_fFlags_0];
        if v17 then
            if type(v17) == "table" then
                for v18, v19 in pairs(v17) do
                    if v18 then
                        return v19;
                    end;
                end;
                return;
            else
                return v17;
            end;
        else
            return v13.WALK;
        end;
    end;
end;
local v35 = {
    antiaim = {
        manuals = v6.antiaim.main:combo("Manual Yaw", "Disabled", "Left", "Right"), 
        freestand = v6.antiaim.main:switch("Freestanding", false, function(v21)
            -- upvalues: v7 (ref)
            return {
                disable = v21:listable("Disable Freestanding", v7)
            }, true;
        end), 
        safe = v6.antiaim.main:switch("Hide Head", false, function(v22)
            return {
                safe_select = v22:listable("Conditions", "Taser", "Knife")
            }, true;
        end), 
        anims = v6.antiaim.main:switch("Animations (in work)", false):disabled(true), 
        tweaks = v6.antiaim.main:selectable("Additions", "Warmup/Win Helicopter", "Evade Backstab"), 
        defensive_setts = v6.antiaim.main:label("Defensive Settings", function(v23)
            -- upvalues: v7 (ref)
            return {
                conditions = v23:selectable("Conditions", v7), 
                hideshots = v23:switch("Force On Hideshots", false)
            };
        end), 
        team_select = v6.antiaim.mode:combo("Team Selection", "Disabled", "Teams"), 
        teams = v6.antiaim.mode:list("", "T", "CT"), 
        state_condition = v6.antiaim.mode:combo("Anti-Aim state", v7)
    }, 
    misc = {
        crosshair_ind = v6.misc.widgets:switch("Center", false, function(v24)
            return {
                ind_select = v24:list("", "Standard", "Alternative"), 
                text_select = v24:combo("Style", "Vensense", "Standard"), 
                gap_add = v24:slider("Space", 1, 5, 1), 
                bind_add = v24:selectable("Keybinds", "DT", "DMG"), 
                accent_col = v24:color_picker("Accent", color(0, 255, 0, 255)), 
                state_col = v24:color_picker("State", color(255, 0, 0, 255)), 
                bind_col = v24:color_picker("Bind", color(255, 0, 0, 255))
            }, true;
        end), 
        notifications = v6.misc.widgets:switch("Notify", false, function(v25)
            return {
                hit_col = v25:color_picker("Hit", color(0, 255, 0, 255)), 
                miss_col = v25:color_picker("Miss", color(255, 0, 0, 255))
            }, true;
        end), 
        warnings = v6.misc.widgets:switch("Alerts", false, function(v26)
            return {
                config_pos = v26:list("Configurate positions", "Velocity", "Defensive"), 
                velocity = v26:switch("Velocity"), 
                defensive = v26:switch("Defensive"), 
                accent = v26:color_picker("Accent", color()), 
                vel_x_pad = v26:slider("X", -880, 880, 1), 
                vel_y_pad = v26:slider("Y", -370, 670, 1), 
                def_x_pad = v26:slider("X", -880, 880, 1), 
                def_y_pad = v26:slider("Y", -370, 670, 1)
            }, true;
        end), 
        watermark = v6.misc.widgets:switch("Brand", false, function(v27)
            -- upvalues: v0 (ref)
            items = {
                accent_col = v27:color_picker("Color", color(v0.r, v0.g, v0.b, v0.a)), 
                pos = v27:combo("Set on", "Right", "Left", "Bottom")
            };
            return items, true;
        end), 
        aspect = v6.misc.visuals:switch("Aspect Ratio", false, function(v28)
            items = {
                slider = v28:slider("Proportion", 0, 200, 0, 0.01), 
                aspect_ratio_169 = v28:button(" 16:9  "), 
                aspect_ratio_1610 = v28:button("16:10 "), 
                aspect_ratio_32 = v28:button("   3:2  "), 
                aspect_ratio_43 = v28:button("  4:3   "), 
                aspect_ratio_54 = v28:button("  5:4   ")
            };
            return items, true;
        end), 
        scope_overlay = v6.misc.visuals:switch("Scope Overlay", false, function(v29)
            items = {
                inverted = v29:switch("Inverted", false), 
                gap = v29:slider("Gap", 0, 500, 5), 
                size = v29:slider("Size", 0, 500, 75), 
                color = v29:color_picker("Color", color(255, 255, 255, 118))
            };
            return items, true;
        end), 
        viewmodel = v6.misc.visuals:switch("Viewmodel", false, function(v30)
            items = {
                fov = v30:slider("Fov", 0, 1000, 680, 0.1), 
                xoff = v30:slider("X", -100, 100, 25, 0.1), 
                yoff = v30:slider("Y", -100, 100, 0, 0.1), 
                zoff = v30:slider("Z", -100, 100, -15, 0.1)
            };
            return items, true;
        end), 
        skeet_indicators = v6.misc.visuals:switch("500$ Indicators", false, function(v31)
            items = {
                indicators_sel = v31:selectable("500$ Indicators:", {
                    [1] = "Double Tap", 
                    [2] = "Hideshots", 
                    [3] = "Minimum Damage", 
                    [4] = "Body Aim", 
                    [5] = "Hitchance", 
                    [6] = "Dormant Aimbot", 
                    [7] = "Safepoint", 
                    [8] = "Freestanding", 
                    [9] = "Fake Duck", 
                    [10] = "Ping"
                }, 0), 
                padding = v31:slider("Padding", -200, 200, 0)
            };
            return items, true;
        end), 
        optimize = v6.misc.visuals:switch("Optimize Cvars", false), 
        console_logs = v6.misc.visuals:switch("Console Events", false), 
        fast_ladder = v6.misc.settings:switch("Fast Ladder", false), 
        fake_latency = v6.misc.settings:switch("Ping Spike", false, function(v32)
            items = {
                amount = v32:slider("Amount", 0, 200, 200)
            };
            return items, true;
        end), 
        trashtalk = v6.misc.settings:switch("Trash Talk", false, function(v33)
            items = {
                death = v33:switch("Enable on Death"), 
                delay = v33:slider("Delay", 0, 10)
            };
            return items, true;
        end), 
        shot_statics = v6.misc.settings:switch("Hit Rate", false, function(v34)
            items = {
                position = v34:combo("Position", {
                    [1] = "Top Left", 
                    [2] = "Top Right", 
                    [3] = "Bottom Left", 
                    [4] = "Bottom Right"
                }), 
                show_ratio = v34:switch("Show Hit Ratio", true), 
                show_damage = v34:switch("Show Total Shots", true), 
                show_headshots = v34:switch("Show Headshots", true), 
                active = v34:selectable("Weapon", {
                    [1] = "Taser", 
                    [2] = "Knife", 
                    [3] = "Scout", 
                    [4] = "AWP", 
                    [5] = "Shotgun", 
                    [6] = "Pistols"
                }, 3)
            };
            return items, true;
        end)
    }
};
local v36 = {
    state_condition = v35.antiaim.state_condition:create()
};
v35.misc.aspect.aspect_ratio_169:set_callback(function()
    -- upvalues: v35 (ref)
    v35.misc.aspect.slider:set(177);
end);
v35.misc.aspect.aspect_ratio_1610:set_callback(function()
    -- upvalues: v35 (ref)
    v35.misc.aspect.slider:set(160);
end);
v35.misc.aspect.aspect_ratio_32:set_callback(function()
    -- upvalues: v35 (ref)
    v35.misc.aspect.slider:set(150);
end);
v35.misc.aspect.aspect_ratio_43:set_callback(function()
    -- upvalues: v35 (ref)
    v35.misc.aspect.slider:set(133);
end);
v35.misc.aspect.aspect_ratio_54:set_callback(function()
    -- upvalues: v35 (ref)
    v35.misc.aspect.slider:set(125);
end);
local v37 = {
    elements = {}, 
    labels = {}
};
for _, v39 in ipairs(v9) do
    v37.elements[v39] = {};
    v37.labels[v39] = {};
    do
        local l_v39_0 = v39;
        for v41, v42 in pairs(v7) do
            local _ = string.format("%s_%s", l_v39_0, v42);
            v37.labels[l_v39_0][v41] = v6.antiaim.builder:label(string.format("Team: %s\nState: %s", l_v39_0, v42));
            v37.elements[l_v39_0][v41] = {
                yaw_method = v6.antiaim.builder:combo("Yaw Mode", "Static", "Left/Right", "Auto"), 
                static = v6.antiaim.builder:slider("\f<arrow-right-from-arc>   Center", -180, 180, 0), 
                left = v6.antiaim.builder:slider("\f<arrow-right-from-arc>   Left", -180, 180, 0), 
                right = v6.antiaim.builder:slider("\f<arrow-right-from-arc>   Right", -180, 180, 0), 
                yawmod_method = v6.antiaim.builder:combo("Yaw Modifier", {
                    [1] = "Disabled", 
                    [2] = "Center", 
                    [3] = "Offset", 
                    [4] = "Random", 
                    [5] = "Spin", 
                    [6] = "3-Way", 
                    [7] = "5-Way"
                }), 
                jitter = v6.antiaim.builder:slider("\f<arrow-right-from-arc>   Jitter", -180, 180, 0), 
                byaw = v6.antiaim.body:switch("Body Yaw", false), 
                delay_ticks = v6.antiaim.body:slider("\f<arrow-right-from-arc>   Speed", 0, 22, 0), 
                left_fake = v6.antiaim.body:slider("\f<arrow-right-from-arc>   Left", 0, 60, 0), 
                right_fake = v6.antiaim.body:slider("\f<arrow-right-from-arc>   Right", 0, 60, 0), 
                options_fake = v6.antiaim.body:selectable("Fake Options", "Avoid Overlap", "Jitter", "Randomize Jitter", "Anti Bruteforce"), 
                hidden_build = v6.antiaim.defensive:switch(v42, false)
            };
            v37.elements[l_v39_0][v41].yaw_gear_items = v37.elements[l_v39_0][v41].yaw_method:create();
            v37.elements[l_v39_0][v41].mod_gear_items = v37.elements[l_v39_0][v41].yawmod_method:create();
            v37.elements[l_v39_0][v41].hidden_builder_gear = v37.elements[l_v39_0][v41].hidden_build:create();
            v37.elements[l_v39_0][v41].delay_ticks_gear = v37.elements[l_v39_0][v41].delay_ticks:create();
            v37.elements[l_v39_0][v41].hidden_pitch = v37.elements[l_v39_0][v41].hidden_builder_gear:combo("Pitch", "Down", "Up", "Custom", "Switch", "Auto");
            v37.elements[l_v39_0][v41].hidden_pitch_custom = v37.elements[l_v39_0][v41].hidden_builder_gear:slider("\f<arrow-right-from-arc>  Custom", -89, 89, 0);
            v37.elements[l_v39_0][v41].hidden_pitch_s1 = v37.elements[l_v39_0][v41].hidden_builder_gear:slider("\f<arrow-right-from-arc>", -89, 89, 0);
            v37.elements[l_v39_0][v41].hidden_pitch_s2 = v37.elements[l_v39_0][v41].hidden_builder_gear:slider("\f<arrow-right-from-arc>", -89, 89, 0);
            v37.elements[l_v39_0][v41].hidden_yaw = v37.elements[l_v39_0][v41].hidden_builder_gear:combo("Yaw", "Static", "Sideways", "Auto");
            v37.elements[l_v39_0][v41].hidden_yaw_static = v37.elements[l_v39_0][v41].hidden_builder_gear:slider("\f<arrow-right-from-arc>", -180, 180, 0);
            v37.elements[l_v39_0][v41].hidden_yaw_sideways = v37.elements[l_v39_0][v41].hidden_builder_gear:slider("\f<arrow-right-from-arc>", -180, 180, 0);
            v37.elements[l_v39_0][v41].randomizer = v37.elements[l_v39_0][v41].yaw_gear_items:slider("Randomize", -180, 180, 0);
            v37.elements[l_v39_0][v41].mod_randomizer = v37.elements[l_v39_0][v41].mod_gear_items:slider("Randomize", -180, 180, 0);
            v37.elements[l_v39_0][v41].brute_toggle = v37.elements[l_v39_0][v41].yaw_gear_items:switch("Anti Bruteforce", false);
            v37.elements[l_v39_0][v41].brute_style = v37.elements[l_v39_0][v41].yaw_gear_items:list("Method", "Center", "Decrease", "Increase");
            v37.elements[l_v39_0][v41].brute_timeout = v37.elements[l_v39_0][v41].yaw_gear_items:slider("Timeout", 0, 30, 0, 1, function(v44)
                if v44 == 0 then
                    return "Infinity";
                else
                    return;
                end;
            end);
            v37.elements[l_v39_0][v41].delay_method = v37.elements[l_v39_0][v41].delay_ticks_gear:combo("Delay Mode", "Default", "Adaptive", "Sequenced", "Random", "Pulse", "Sine");
            v37.elements[l_v39_0][v41].random_delay = v37.elements[l_v39_0][v41].delay_ticks_gear:switch("Snap Delay");
            v37.elements[l_v39_0][v41].delay_sliders_count = v37.elements[l_v39_0][v41].delay_ticks_gear:slider("Sliders", 1, 15, 5);
            v37.elements[l_v39_0][v41].delay_ticks_array = {};
            local function v53(v45, v46)
                -- upvalues: v37 (ref)
                local v47 = v37.elements[v45][v46];
                local v48 = v47.delay_sliders_count:get();
                local v49 = v47.random_delay:get();
                v47.delay_sliders_count:visibility(v49);
                for v50 = 1, 15 do
                    if not v47.delay_ticks_array[v50] then
                        v47.delay_ticks_array[v50] = v47.delay_ticks_gear:slider("Delay " .. v50, 1, 22, 1);
                    end;
                end;
                for v51 = 1, #v47.delay_ticks_array do
                    local v52 = v49 and v51 <= v48;
                    v47.delay_ticks_array[v51]:visibility(v52);
                end;
            end;
            do
                local l_v41_0, l_v42_0 = v41, v42;
                do
                    local l_v53_0 = v53;
                    v37.elements[l_v39_0][l_v41_0].random_delay:set_callback(function()
                        -- upvalues: l_v53_0 (ref), l_v39_0 (ref), l_v41_0 (ref)
                        l_v53_0(l_v39_0, l_v41_0);
                    end);
                    v37.elements[l_v39_0][l_v41_0].delay_sliders_count:set_callback(function()
                        -- upvalues: l_v53_0 (ref), l_v39_0 (ref), l_v41_0 (ref)
                        l_v53_0(l_v39_0, l_v41_0);
                    end);
                    l_v53_0(l_v39_0, l_v41_0);
                    v37.elements[l_v39_0][l_v41_0].copy_button = v6.antiaim.builder:button(string.format("Send to %s", l_v39_0 == "T" and "CT" or "T"), function()
                        -- upvalues: l_v39_0 (ref), l_v41_0 (ref), v37 (ref), l_v42_0 (ref)
                        local l_l_v39_0_0 = l_v39_0;
                        local v58 = l_v39_0 == "T" and "CT" or "T";
                        local l_l_v41_0_0 = l_v41_0;
                        local v60 = {
                            [1] = "yaw_method", 
                            [2] = "static", 
                            [3] = "left", 
                            [4] = "right", 
                            [5] = "yawmod_method", 
                            [6] = "jitter", 
                            [7] = "byaw", 
                            [8] = "delay_ticks", 
                            [9] = "left_fake", 
                            [10] = "right_fake", 
                            [11] = "options_fake"
                        };
                        for _, v62 in ipairs(v60) do
                            local v63 = v37.elements[l_l_v39_0_0][l_l_v41_0_0][v62];
                            local v64 = v37.elements[v58][l_l_v41_0_0][v62];
                            if v63 and v64 and v63.get and v64.set then
                                v64:set(v63:get());
                            end;
                        end;
                        local l_hidden_build_0 = v37.elements[l_l_v39_0_0][l_l_v41_0_0].hidden_build;
                        local l_hidden_build_1 = v37.elements[v58][l_l_v41_0_0].hidden_build;
                        if l_hidden_build_0 and l_hidden_build_1 and l_hidden_build_0.get and l_hidden_build_1.set then
                            l_hidden_build_1:set(l_hidden_build_0:get());
                            local l_hidden_builder_gear_0 = v37.elements[l_l_v39_0_0][l_l_v41_0_0].hidden_builder_gear;
                            local l_hidden_builder_gear_1 = v37.elements[v58][l_l_v41_0_0].hidden_builder_gear;
                            if l_hidden_builder_gear_0 and l_hidden_builder_gear_1 then
                                local v69 = {
                                    [1] = "hidden_pitch", 
                                    [2] = "hidden_pitch_custom", 
                                    [3] = "hidden_pitch_s1", 
                                    [4] = "hidden_pitch_s2", 
                                    [5] = "hidden_yaw", 
                                    [6] = "hidden_yaw_static", 
                                    [7] = "hidden_yaw_sideways"
                                };
                                for _, v71 in ipairs(v69) do
                                    if l_hidden_builder_gear_0[v71] and l_hidden_builder_gear_1[v71] and l_hidden_builder_gear_0[v71].get and l_hidden_builder_gear_1[v71].set then
                                        l_hidden_builder_gear_1[v71]:set(l_hidden_builder_gear_0[v71]:get());
                                    end;
                                end;
                            end;
                        end;
                        local l_yaw_method_0 = v37.elements[l_l_v39_0_0][l_l_v41_0_0].yaw_method;
                        local l_yaw_method_1 = v37.elements[v58][l_l_v41_0_0].yaw_method;
                        if l_yaw_method_0 and l_yaw_method_1 and l_yaw_method_0.get and l_yaw_method_1.set then
                            l_yaw_method_1:set(l_yaw_method_0:get());
                            utils.execute_after(0.05, function()
                                -- upvalues: v37 (ref), l_l_v39_0_0 (ref), l_l_v41_0_0 (ref), v58 (ref)
                                local l_yaw_gear_items_0 = v37.elements[l_l_v39_0_0][l_l_v41_0_0].yaw_gear_items;
                                local l_yaw_gear_items_1 = v37.elements[v58][l_l_v41_0_0].yaw_gear_items;
                                if l_yaw_gear_items_0 and l_yaw_gear_items_1 then
                                    local v76 = {
                                        [1] = "randomizer", 
                                        [2] = "brute_toggle", 
                                        [3] = "brute_style", 
                                        [4] = "brute_timeout"
                                    };
                                    for _, v78 in ipairs(v76) do
                                        if l_yaw_gear_items_0[v78] and l_yaw_gear_items_1[v78] and l_yaw_gear_items_0[v78].get and l_yaw_gear_items_1[v78].set then
                                            l_yaw_gear_items_1[v78]:set(l_yaw_gear_items_0[v78]:get());
                                        end;
                                    end;
                                end;
                            end);
                        end;
                        local l_yawmod_method_0 = v37.elements[l_l_v39_0_0][l_l_v41_0_0].yawmod_method;
                        local l_yawmod_method_1 = v37.elements[v58][l_l_v41_0_0].yawmod_method;
                        if l_yawmod_method_0 and l_yawmod_method_1 and l_yawmod_method_0.get and l_yawmod_method_1.set then
                            l_yawmod_method_1:set(l_yawmod_method_0:get());
                            utils.execute_after(0.05, function()
                                -- upvalues: v37 (ref), l_l_v39_0_0 (ref), l_l_v41_0_0 (ref), v58 (ref)
                                local l_mod_gear_items_0 = v37.elements[l_l_v39_0_0][l_l_v41_0_0].mod_gear_items;
                                local l_mod_gear_items_1 = v37.elements[v58][l_l_v41_0_0].mod_gear_items;
                                if l_mod_gear_items_0 and l_mod_gear_items_1 and l_mod_gear_items_0.mod_randomizer and l_mod_gear_items_1.mod_randomizer and l_mod_gear_items_0.mod_randomizer.get and l_mod_gear_items_1.mod_randomizer.set then
                                    l_mod_gear_items_1.mod_randomizer:set(l_mod_gear_items_0.mod_randomizer:get());
                                end;
                            end);
                        end;
                        local l_delay_ticks_0 = v37.elements[l_l_v39_0_0][l_l_v41_0_0].delay_ticks;
                        local l_delay_ticks_1 = v37.elements[v58][l_l_v41_0_0].delay_ticks;
                        if l_delay_ticks_0 and l_delay_ticks_1 and l_delay_ticks_0.get and l_delay_ticks_1.set then
                            l_delay_ticks_1:set(l_delay_ticks_0:get());
                            utils.execute_after(0.05, function()
                                -- upvalues: v37 (ref), l_l_v39_0_0 (ref), l_l_v41_0_0 (ref), v58 (ref)
                                local l_delay_ticks_gear_0 = v37.elements[l_l_v39_0_0][l_l_v41_0_0].delay_ticks_gear;
                                local l_delay_ticks_gear_1 = v37.elements[v58][l_l_v41_0_0].delay_ticks_gear;
                                if l_delay_ticks_gear_0 and l_delay_ticks_gear_1 and l_delay_ticks_gear_0.delay_method and l_delay_ticks_gear_1.delay_method and l_delay_ticks_gear_0.delay_method.get and l_delay_ticks_gear_1.delay_method.set then
                                    l_delay_ticks_gear_1.delay_method:set(l_delay_ticks_gear_0.delay_method:get());
                                end;
                            end);
                        end;
                        common.add_notify("Copied", "Settings copied from " .. l_l_v39_0_0 .. " to " .. v58 .. " for state: " .. l_v42_0);
                    end);
                    v37.elements[l_v39_0][l_v41_0].copy_button:tooltip("Doesn't copy \226\154\153");
                    v37.elements[l_v39_0][l_v41_0].import_button = v36.state_condition:button("\f<copy>  Copy", function()
                        -- upvalues: v37 (ref), v1 (ref)
                        local v87 = {
                            disabled = {}, 
                            t = {}, 
                            ct = {}
                        };
                        local v88 = {
                            T = "t", 
                            OFF = "disabled", 
                            CT = "ct"
                        };
                        local v89 = {
                            [1] = "yaw_method", 
                            [2] = "static", 
                            [3] = "left", 
                            [4] = "right", 
                            [5] = "yawmod_method", 
                            [6] = "jitter", 
                            [7] = "byaw", 
                            [8] = "delay_ticks", 
                            [9] = "left_fake", 
                            [10] = "right_fake", 
                            [11] = "options_fake", 
                            [12] = "hidden_build"
                        };
                        local v90 = {
                            [1] = {
                                [1] = "hidden_builder_gear", 
                                [2] = {
                                    [1] = "hidden_pitch", 
                                    [2] = "hidden_pitch_custom", 
                                    [3] = "hidden_pitch_s1", 
                                    [4] = "hidden_pitch_s2", 
                                    [5] = "hidden_yaw", 
                                    [6] = "hidden_yaw_static", 
                                    [7] = "hidden_yaw_sideways"
                                }
                            }, 
                            [2] = {
                                [1] = "yaw_gear_items", 
                                [2] = {
                                    [1] = "randomizer", 
                                    [2] = "brute_toggle", 
                                    [3] = "brute_style", 
                                    [4] = "brute_timeout"
                                }
                            }, 
                            [3] = {
                                [1] = "mod_gear_items", 
                                [2] = {
                                    [1] = "mod_randomizer"
                                }
                            }, 
                            [4] = {
                                [1] = "delay_ticks_gear", 
                                [2] = {
                                    [1] = "delay_method"
                                }
                            }
                        };
                        local function v104(v91, v92)
                            -- upvalues: v89 (ref), v37 (ref), v90 (ref)
                            local v93 = {};
                            for _, v95 in ipairs(v89) do
                                local v96 = v37.elements[v91][v92][v95];
                                if v96 and v96.get then
                                    v93[v95] = v96:get();
                                end;
                            end;
                            for _, v98 in ipairs(v90) do
                                local v99 = v98[1];
                                local v100 = v98[2];
                                v93[v99] = {};
                                for _, v102 in ipairs(v100) do
                                    local v103 = v37.elements[v91][v92][v99];
                                    if v103 and v103[v102] and v103[v102].get then
                                        v93[v99][v102] = v103[v102]:get();
                                    end;
                                end;
                            end;
                            return v93;
                        end;
                        for v105, v106 in pairs(v37.elements) do
                            local v107 = v88[v105];
                            if v107 then
                                v87[v107] = {};
                                for v108, _ in pairs(v106) do
                                    v87[v107][tostring(v108)] = v104(v105, v108);
                                end;
                            end;
                        end;
                        local v110 = json.stringify(v87, true);
                        v1.clipboard.set(v110);
                        cvar.play:call("ambient\\tones\\elev1");
                    end);
                    v37.elements[l_v39_0][l_v41_0].export_button = v36.state_condition:button("\f<paste>  Paste", function()
                        -- upvalues: v1 (ref), v37 (ref)
                        local v111 = v1.clipboard.get();
                        local l_status_0, l_result_0 = pcall(json.parse, v111);
                        if not l_status_0 or type(l_result_0) ~= "table" then
                            common.add_notify("Error:", "Invalid config");
                            return;
                        else
                            local v114 = {
                                ct = "CT", 
                                t = "T", 
                                disabled = "OFF"
                            };
                            local function v126(v115, v116, v117)
                                -- upvalues: v37 (ref)
                                for v118, v119 in pairs(v117) do
                                    if type(v119) ~= "table" then
                                        local v120 = v37.elements[v115][v116][v118];
                                        if v120 and v120.set then
                                            v120:set(v119);
                                        end;
                                    end;
                                end;
                                for v121, v122 in pairs(v117) do
                                    if type(v122) == "table" then
                                        local v123 = v37.elements[v115][v116][v121];
                                        if v123 then
                                            for v124, v125 in pairs(v122) do
                                                if v123[v124] and v123[v124].set then
                                                    v123[v124]:set(v125);
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                            for v127, v128 in pairs(l_result_0) do
                                local v129 = v114[v127];
                                if v129 and v37.elements[v129] then
                                    for v130, v131 in pairs(v128) do
                                        local v132 = tonumber(v130);
                                        if v132 and v37.elements[v129][v132] then
                                            v126(v129, v132, v131);
                                        end;
                                    end;
                                end;
                            end;
                            print("Anti-aim builder configuration imported successfully");
                            cvar.play:call("ambient\\tones\\elev1");
                            return;
                        end;
                    end);
                end;
            end;
        end;
    end;
end;
settings_tbl = {};
v4.menu_visibility = function()
    -- upvalues: v35 (ref), v11 (ref), v37 (ref), v7 (ref)
    local v133 = v35.antiaim.team_select:get();
    local v134 = v11[v35.antiaim.teams:get()];
    local v135 = v35.antiaim.state_condition:get();
    v35.antiaim.teams:visibility(v133 == "Teams");
    for v136, v137 in pairs(v37.labels) do
        local v138 = false;
        if v133 == "Disabled" and v136 == "OFF" then
            v138 = true;
        elseif v133 == "Teams" and v136 == v134 then
            v138 = true;
        end;
        for v139, v140 in pairs(v137) do
            local v141;
            if v138 then
                v141 = v7[v139] == v135;
            else
                v141 = v138;
            end;
            v140:visibility(false);
            local v142 = v37.elements[v136][v139];
            v142.yaw_method:visibility(v141);
            v142.yawmod_method:visibility(v141);
            v142.byaw:visibility(v141);
            v142.left_fake:visibility(v141);
            v142.right_fake:visibility(v141);
            v142.options_fake:visibility(v141);
            v142.delay_method:visibility(v141);
            v142.random_delay:visibility(v141);
            v142.delay_ticks:visibility(v141);
            v142.hidden_build:visibility(v141);
            v142.export_button:visibility(v141);
            v142.import_button:visibility(v141);
            if v142.copy_button then
                local v143;
                if v141 then
                    v143 = v136 == "T" or v136 == "CT";
                else
                    v143 = v141;
                end;
                v142.copy_button:visibility(v143);
            end;
            local v144 = v142.yawmod_method:get() == "Center" or not (v142.yawmod_method:get() ~= "Offset") or not (v142.yawmod_method:get() ~= "Random") or not (v142.yawmod_method:get() ~= "Spin") or not (v142.yawmod_method:get() ~= "3-Way") or v142.yawmod_method:get() == "5-Way";
            if v141 then
                v142.static:visibility(v142.yaw_method:get() == "Static");
                v142.left:visibility(v142.yaw_method:get() == "Left/Right");
                v142.right:visibility(v142.yaw_method:get() == "Left/Right");
                v142.jitter:visibility(v144);
                v142.delay_sliders_count:visibility(v142.random_delay:get());
                v142.brute_toggle:visibility(v142.yaw_method:get() == "Left/Right");
                v142.brute_style:visibility(v142.yaw_method:get() == "Left/Right" and v142.brute_toggle:get());
                v142.brute_timeout:visibility(v142.yaw_method:get() == "Left/Right" and v142.brute_toggle:get());
                v142.hidden_pitch:visibility(v142.hidden_build:get());
                v142.hidden_pitch_custom:visibility(v142.hidden_build:get() and v142.hidden_pitch:get() == "Custom");
                v142.hidden_pitch_s1:visibility(v142.hidden_build:get() and v142.hidden_pitch:get() == "Switch");
                v142.hidden_pitch_s2:visibility(v142.hidden_build:get() and v142.hidden_pitch:get() == "Switch");
                v142.hidden_yaw:visibility(v142.hidden_build:get());
                v142.hidden_yaw_static:visibility(v142.hidden_build:get() and v142.hidden_yaw:get() == "Static");
                v142.hidden_yaw_sideways:visibility(v142.hidden_build:get() and v142.hidden_yaw:get() == "Sideways");
            else
                v142.static:visibility(false);
                v142.left:visibility(false);
                v142.right:visibility(false);
                v142.brute_toggle:visibility(false);
                v142.brute_style:visibility(false);
                v142.brute_timeout:visibility(false);
                v142.jitter:visibility(false);
                v142.byaw:visibility(false);
                v142.left_fake:visibility(false);
                v142.right_fake:visibility(false);
                v142.options_fake:visibility(false);
                v142.delay_ticks:visibility(false);
                v142.delay_method:visibility(false);
                v142.random_delay:visibility(false);
                v142.delay_sliders_count:visibility(false);
                v142.export_button:visibility(false);
                v142.import_button:visibility(false);
            end;
        end;
    end;
end;
local function _()
    -- upvalues: v35 (ref), v11 (ref)
    local v145 = v35.antiaim.team_select:get();
    if v145 == "Disabled" then
        return "OFF";
    elseif v145 == "Teams" then
        return v11[v35.antiaim.teams:get()];
    else
        return "OFF";
    end;
end;
local function v148()
    local v147 = entity.get_local_player();
    if not v147 then
        return nil;
    elseif v147.m_iTeamNum == 2 then
        return "T";
    elseif v147.m_iTeamNum == 3 then
        return "CT";
    else
        return nil;
    end;
end;
local function v150()
    -- upvalues: v35 (ref), v148 (ref)
    local v149 = v35.antiaim.team_select:get();
    if v149 == "Disabled" then
        return "OFF";
    elseif v149 == "Teams" then
        return v148();
    else
        return "OFF";
    end;
end;
local v151 = {
    round_start_time = 0, 
    active = false, 
    start_time = 0
};
local v152 = {};
local v153 = 1;
local v154 = 1;
local v155 = render.screen_size().x / 2 - 105;
local v156 = render.screen_size().x / 2 - 120;
local v157 = 25;
local v158 = 240;
local function v165(v159, v160)
    -- upvalues: v150 (ref), v20 (ref), v37 (ref), v152 (ref), v153 (ref), v154 (ref)
    local v161 = v150();
    local v162 = v20();
    local v163 = v161 and v37.elements[v161][v162];
    if v163 and v163.brute_toggle:get() then
        local v164 = {
            message = v159, 
            notification = {
                alpha = 500, 
                current_x = 0, 
                target_y = 890, 
                current_y = 920, 
                is_active = v160, 
                original_team = v161, 
                original_state = v162, 
                original_timeout = v163.brute_timeout:get()
            }
        };
        if #v152 < v153 then
            table.insert(v152, v164);
        else
            v152[v154] = v164;
            v154 = v154 % v153 + 1;
        end;
    end;
end;
local v166 = 0;
local v167 = 100;
local function v171()
    -- upvalues: v167 (ref)
    local v168 = entity.get_local_player();
    if not v168 then
        return false;
    else
        local l_m_iHealth_0 = v168.m_iHealth;
        if not l_m_iHealth_0 then
            return false;
        elseif l_m_iHealth_0 < v167 then
            local _ = v167 - l_m_iHealth_0;
            v167 = l_m_iHealth_0;
            return true;
        else
            if v167 < l_m_iHealth_0 then
                v167 = l_m_iHealth_0;
            end;
            return false;
        end;
    end;
end;
events.round_start:set(function()
    -- upvalues: v167 (ref)
    v167 = 100;
end);
events.player_spawn:set(function(v172)
    -- upvalues: v167 (ref)
    local v173 = entity.get_local_player();
    if not v173 then
        return;
    else
        if v172.userid == v173:get_player_info().userid then
            v167 = 100;
        end;
        return;
    end;
end);
events.bullet_impact:set(function(v174)
    -- upvalues: v166 (ref), v171 (ref), v151 (ref), v165 (ref)
    local v175 = entity.get_local_player();
    if not v175 or not v175:is_alive() then
        return;
    else
        local v176 = entity.get(v174.userid, true);
        if not v176 or not v176:is_enemy() then
            return;
        else
            local l_tickcount_0 = globals.tickcount;
            if l_tickcount_0 == v166 then
                return;
            else
                local v178 = vector(v174.x, v174.y, v174.z);
                local v179 = v176:get_origin();
                local v180 = v175:get_origin();
                local v181 = v175:get_hitbox_position(0);
                local v182 = v175.m_flDuckAmount > 0 and 54 or 72;
                local v183 = v180.z + v182;
                local v184 = (v178 - v179):normalized();
                local v185 = v180 - v179;
                local v186 = v181 - v179;
                local v187 = v185:dot(v184);
                local v188 = v186:dot(v184);
                local v189 = math.abs((v185 - v184 * v187):length());
                local v190 = math.abs((v186 - v184 * v188):length());
                local v191 = math.min(v189, v190);
                local _, v193 = utils.trace_bullet(v176, v179, v178);
                local v194 = v171();
                if not v193 then
                    return;
                else
                    if v193:did_hit() then
                        local l_z_0 = v178.z;
                        local v196 = v180.z <= l_z_0 and l_z_0 <= v183;
                        if v193.entity == v175 and v196 and v194 then
                            v166 = l_tickcount_0;
                            miss_state = false;
                            return;
                        elseif v191 <= 65 then
                            v166 = l_tickcount_0;
                            miss_state = true;
                            v151.active = true;
                            v151.start_time = globals.curtime;
                            v165("Anti-bruteforce activated", true);
                        end;
                    end;
                    return;
                end;
            end;
        end;
    end;
end);
events.round_start(function()
    -- upvalues: v151 (ref), v165 (ref)
    v151.active = false;
    v151.round_start_time = globals.curtime;
    v165("Anti-bruteforce reseted due to round start", false);
end);
local v197 = 0;
local _ = false;
local v199 = false;
local v200 = 0;
localplayer = {};
localplayer.sent_packets = 0;
v4.time_to_ticks = function(v201)
    return math.floor(0.5 + v201 / globals.tickinterval);
end;
v4.get_desync_delta = function()
    -- upvalues: v200 (ref)
    local v202 = entity.get_local_player();
    if v202 == nil then
        return;
    else
        v200 = math.normalize_yaw(v202.m_flPoseParameter[11] * 120 - 60) / 2;
        return;
    end;
end;
v4.get_desync_side = function()
    -- upvalues: v199 (ref), v200 (ref)
    v199 = v200 < 0;
end;
local v203 = 0;
local v204 = false;
local v205 = 0;
local v206 = 0;
local function v212()
    -- upvalues: v150 (ref), v20 (ref), v37 (ref), v5 (ref), v204 (ref), v205 (ref)
    local v207 = v150();
    if not v207 then
        return rage.antiaim:inverter(), false;
    else
        local v208 = v20();
        local v209 = v37.elements[v207][v208];
        if not v209 then
            return rage.antiaim:inverter(), false;
        else
            local v210 = v209.options_fake:get("Jitter");
            local _ = v209.delay_method:get();
            if v209.delay_ticks:get() ~= nil and v209.options_fake:get() ~= nil and v209.delay_ticks:get() > 0 and v210 and v5.body_add then
                return v204, true;
            else
                if globals.choked_commands == 0 then
                    v205 = v205 + 1;
                end;
                if v210 and not v209.options_fake:get("Randomize Jitter") then
                    return bit.band(v205, 1) ~= 0, true;
                else
                    return rage.antiaim:inverter(), false;
                end;
            end;
        end;
    end;
end;
local function v232()
    -- upvalues: v150 (ref), v20 (ref), v37 (ref), v5 (ref), v203 (ref), v206 (ref), v204 (ref)
    local v213 = v150();
    if not v213 then
        return false;
    else
        local v214 = v20();
        local v215 = v37.elements[v213][v214];
        if not v215 then
            return false;
        elseif globals.choked_commands ~= 0 then
            return false;
        else
            local v216 = entity.get_local_player();
            if v216 == nil then
                return false;
            else
                local v217 = v215.delay_method:get();
                local v218 = v215.delay_ticks:get();
                if v215.random_delay:get() and v215.delay_ticks_array then
                    local v219 = 0;
                    local v220 = {};
                    for v221 = 1, #v215.delay_ticks_array do
                        if v215.delay_ticks_array[v221]:visibility() then
                            v219 = v219 + 1;
                            v220[v219] = v215.delay_ticks_array[v221]:get();
                        end;
                    end;
                    if v219 > 0 then
                        v218 = v220[utils.random_int(1, v219)];
                    end;
                end;
                if v5.body_add ~= nil and v218 ~= nil and v218 > 0 and v215.options_fake:get("Jitter") then
                    v203 = v203 + 1;
                    local v222 = false;
                    if v217 == "Default" then
                        v222 = v218 < v203;
                    elseif v217 == "Adaptive" then
                        local v223 = v216.m_vecVelocity:length();
                        v222 = math.max(1, v218 - math.floor(v223 / 50)) < v203;
                    elseif v217 == "Sequenced" then
                        local v224 = {
                            [1] = v218, 
                            [2] = v218 * 2, 
                            [3] = v218 / 2
                        };
                        local v225 = v206 % 3 + 1;
                        v222 = v203 > v224[v225];
                    elseif v217 == "Random" then
                        v222 = utils.random_int(1, v218 * 2) == 1;
                    elseif v217 == "Pulse" then
                        v222 = math.floor(globals.tickcount / v218) % 10 < 3 and not (v203 <= 3) or v203 > v218 * 2;
                    elseif v217 == "Sine" then
                        local v226 = math.abs(math.sin(globals.realtime * 0.5));
                        v222 = math.max(1, math.floor(v218 * (0.5 + v226 * 0.5))) < v203;
                    end;
                    if v222 then
                        v203 = 0;
                        v204 = not v204;
                        v206 = v206 + 1;
                        if v215.options_fake:get("Randomize Jitter") and utils.random_int(0, 1) == 1 then
                            v204 = not v204;
                        end;
                    end;
                    if v215.options_fake:get("Avoid Overlap") then
                        local v227 = rage.antiaim:get_max_desync();
                        local v228 = rage.antiaim:get_rotation(false);
                        local v229 = rage.antiaim:get_rotation(true);
                        local v230 = math.normalize_yaw(v229 - v228);
                        local v231 = math.abs(v230);
                        if 1 - math.clamp(v231, 0, v227) / v227 > 0.3 then
                            v204 = not v204;
                        end;
                    end;
                end;
                return true;
            end;
        end;
    end;
end;
v4.defensive_force = function()
    -- upvalues: v35 (ref), v20 (ref), v7 (ref), v3 (ref)
    local v233 = v35.antiaim.defensive_setts.conditions:get(v20(v7[id]));
    if v35.antiaim.defensive_setts.hideshots:get() and v3.hs:get() then
        v3.hslag:override("Break LC");
    else
        v3.hslag:override(v3.hslag:get());
    end;
    if v233 then
        v3.dtlag:override("Always On");
        return true;
    else
        v3.dtlag:override(v3.dtlag:get());
        return false;
    end;
end;
local function v238()
    -- upvalues: v150 (ref), v20 (ref), v37 (ref), v151 (ref), v165 (ref)
    local v234 = v150();
    if not v234 then
        return;
    else
        local v235 = v20();
        local v236 = v37.elements[v234][v235];
        if not v236 then
            return;
        elseif not v236.brute_toggle:get() then
            return false;
        elseif v236.brute_timeout:get() == 0 then
            return v151.active and globals.curtime >= v151.round_start_time;
        elseif v151.active then
            local v237 = globals.curtime - v151.start_time <= v236.brute_timeout:get();
            if not v237 and v151.active then
                v165("Anti-bruteforce timed out", false);
                v151.active = false;
            end;
            return v237;
        else
            return false;
        end;
    end;
end;
local function v253(_, v240, v241, v242)
    -- upvalues: v150 (ref), v20 (ref), v37 (ref)
    local l_tickcount_1 = globals.tickcount;
    local v244 = math.sin(l_tickcount_1 * 0.1);
    local v245 = globals.realtime % 3;
    local v246 = v150();
    if not v246 then
        return;
    else
        local v247 = v20();
        local v248 = v37.elements[v246][v247];
        if not v248 then
            return;
        else
            local v249 = v242 and v248.right:get() or v248.left:get();
            if v241 == "decrease" then
                local v250 = v240 * (0.3 + 0.7 * math.abs(v244));
                return v249 - (v242 and v250 or -v250);
            elseif v241 == "increase" then
                local v251 = v240 * (0.3 + 0.7 * math.abs(v244));
                return v249 + (v242 and v251 or -v251);
            else
                local v252 = v240 * v244 * math.cos(v245);
                return v249 + (v242 and v252 or -v252);
            end;
        end;
    end;
end;
local l_realtime_0 = globals.realtime;
local function v256()
    -- upvalues: l_realtime_0 (ref)
    local v255 = globals.realtime - l_realtime_0;
    return math.sin(v255 * math.pi * 3 * 2) * 180;
end;
local function v258()
    -- upvalues: l_realtime_0 (ref)
    local v257 = globals.realtime - l_realtime_0;
    return math.sin(v257 * math.pi * 0.5 * 2) * 89;
end;
local v259 = {
    left = {
        [1] = -10, 
        [2] = -12, 
        [3] = -14, 
        [4] = -16, 
        [5] = -18, 
        [6] = -20, 
        [7] = -20, 
        [8] = -18, 
        [9] = -16, 
        [10] = -14, 
        [11] = -12, 
        [12] = -10
    }, 
    right = {
        [1] = 37, 
        [2] = 39, 
        [3] = 36, 
        [4] = 38, 
        [5] = 40, 
        [6] = 42, 
        [7] = 47, 
        [8] = 45, 
        [9] = 43, 
        [10] = 41, 
        [11] = 39, 
        [12] = 37
    }
};
local v260 = 1;
local v261 = 1;
local _ = 0;
local _ = "Normal";
v4.antiaim_func = function(_)
    -- upvalues: v3 (ref), v4 (ref), v232 (ref), v212 (ref), v150 (ref), v20 (ref), v37 (ref), v197 (ref), v199 (ref), v5 (ref), v238 (ref), v253 (ref), v259 (ref), v260 (ref), v261 (ref), v258 (ref), v256 (ref), v35 (ref)
    v3.base:override("At Target");
    v4.get_desync_delta();
    v4.get_desync_side();
    v232();
    local v265, v266 = v212();
    if v266 then
        rage.antiaim:inverter(v265);
    end;
    local v267 = v150();
    if not v267 then
        return;
    else
        local v268 = v20();
        local v269 = v37.elements[v267][v268];
        if not v269 then
            return;
        else
            local l_tickcount_2 = globals.tickcount;
            if l_tickcount_2 ~= last_tick then
                v197 = v197 + 1;
                last_tick = l_tickcount_2;
            end;
            desync_side = v199;
            local v271 = v269.yawmod_method:get();
            if v271 ~= "Disabled" then
                v5.yaw_mod_add = v271;
                v5.mod_offset_add = utils.random_int(v269.jitter:get(), v269.jitter:get() + v269.mod_randomizer:get());
            else
                v5.yaw_mod_add = v271;
                v5.mod_offset_add = v269.jitter:get();
            end;
            local v272 = math.random(-5, 5);
            local v273 = v269.yaw_method:get();
            if v273 == "Static" then
                v5.yaw_offset_add = utils.random_int(v269.static:get(), v269.static:get() + v269.randomizer:get()) + v272;
            elseif v273 == "Left/Right" then
                local v274 = v238();
                local v275 = v274 and 10 or 0;
                if v274 then
                    if desync_side then
                        local v276 = v269.brute_style:get();
                        if v276 == 1 then
                            local v277 = math.floor(v275 * 0.7);
                            v5.yaw_offset_add = v253(v269.right:get(), v277, "center", true) + v272;
                        elseif v276 == 2 then
                            v5.yaw_offset_add = v253(v269.right:get(), v275, "decrease", true) + v272;
                        elseif v276 == 3 then
                            v5.yaw_offset_add = v253(v269.right:get(), v275, "increase", true) + v272;
                        end;
                    else
                        local v278 = v269.brute_style:get();
                        if v278 == 1 then
                            local v279 = math.floor(v275 * 0.7);
                            v5.yaw_offset_add = v253(v269.left:get(), v279, "center", false) + v272;
                        elseif v278 == 2 then
                            v5.yaw_offset_add = v253(v269.left:get(), v275, "decrease", false) + v272;
                        elseif v278 == 3 then
                            v5.yaw_offset_add = v253(v269.left:get(), v275, "increase", false) + v272;
                        end;
                    end;
                elseif desync_side then
                    v5.yaw_offset_add = utils.random_int(v269.right:get(), v269.right:get() + v269.randomizer:get());
                else
                    v5.yaw_offset_add = utils.random_int(v269.left:get() - v269.randomizer:get(), v269.left:get());
                end;
            elseif v273 == "Auto" then
                v5.yaw_offset_add = desync_side and utils.random_int(v259.right[v260], v259.right[v260] + v269.randomizer:get()) or utils.random_int(v259.left[v260], v259.left[v260] - v269.randomizer:get());
                v260 = v260 + v261;
                if v260 >= #v259.left or v260 <= 1 then
                    v261 = -v261;
                end;
            end;
            v5.body_add = v269.byaw:get();
            v5.options_add = v269.options_fake:get();
            v5.right_fake_add = v269.left_fake:get();
            v5.left_fake_add = v269.right_fake:get();
            if v4.defensive_force(true) and v269.hidden_build:get() then
                v3.hidden:override(true);
                if v269.hidden_pitch:get() == "Down" then
                    rage.antiaim:override_hidden_pitch(89);
                elseif v269.hidden_pitch:get() == "Up" then
                    rage.antiaim:override_hidden_pitch(-89);
                elseif v269.hidden_pitch:get() == "Custom" then
                    rage.antiaim:override_hidden_pitch(v269.hidden_pitch_custom:get());
                elseif v269.hidden_pitch:get() == "Switch" then
                    rage.antiaim:override_hidden_pitch(utils.random_int(v269.hidden_pitch_s1:get(), v269.hidden_pitch_s2:get()));
                elseif v269.hidden_pitch:get() == "Auto" then
                    rage.antiaim:override_hidden_pitch(v258());
                end;
                if v269.hidden_yaw:get() == "Auto" then
                    rage.antiaim:override_hidden_yaw_offset(v256());
                elseif v269.hidden_yaw:get() == "Static" then
                    rage.antiaim:override_hidden_yaw_offset(-v269.hidden_yaw_static:get());
                elseif v269.hidden_yaw:get() == "Sideways" then
                    rage.antiaim:override_hidden_yaw_offset(utils.random_int(-v269.hidden_yaw_sideways:get(), v269.hidden_yaw_sideways:get()));
                end;
            else
                v3.hidden:override(false);
            end;
            v3.fs:override(v35.antiaim.freestand:get());
            if v35.antiaim.tweaks:get("Warmup/Win Helicopter") then
                local v280 = entity.get_players(true);
                local v281 = entity.get_local_player();
                local v282 = 0;
                local v283 = entity.get_game_rules();
                local v284 = v283 and v283.m_bWarmupPeriod;
                local v285 = v283 and v283.m_bHasMatchStarted and not v283.m_bMatchWaitingForResume and not v283.m_bGameRestart;
                for v286 = 1, #v280 do
                    local v287 = v280[v286];
                    if v287 and v287:is_alive() then
                        v282 = v282 + 1;
                    end;
                end;
                local v288 = globals.curtime * 2;
                local v289 = globals.tickcount * 10 % 360 + math.sin(v288 * 5) * 25;
                local _ = globals.tickcount * 20 % 360 - 360;
                if v282 == 0 and v281:is_alive() or v284 or not v285 then
                    v5.yaw_offset_add = v289;
                    v5.yaw_mod_add = "";
                    v5.mod_offset_add = 0;
                    v5.body_add = false;
                    v5.options_add = "";
                    v3.inverter:override(false);
                    v3.hidden:override(false);
                    v3.pitch:override("Disabled");
                else
                    v3.pitch:override("Down");
                end;
            else
                v3.pitch:override("Down");
            end;
            if v35.antiaim.safe:get() and v35.antiaim.safe.safe_select:get(2) then
                local v291 = entity.get_local_player();
                if v291 == nil then
                    return;
                else
                    local v292 = v291:get_player_weapon();
                    if not v292 then
                        return;
                    else
                        local v293 = v292:get_classname();
                        if v20() == 7 and string.match(v293, "Knife") then
                            v3.hidden:override(false);
                            v5.right_fake_add = 60;
                            v5.left_fake_add = 60;
                            v5.options_add = "";
                            v5.yaw_mod_add = "Disabled";
                            v5.yaw_offset_add = 0;
                            v3.inverter:override(true);
                        end;
                    end;
                end;
            end;
            if v35.antiaim.safe:get() and v35.antiaim.safe.safe_select:get(1) then
                local v294 = entity.get_local_player();
                if v294 == nil then
                    return;
                else
                    local v295 = v294:get_player_weapon();
                    if not v295 then
                        return;
                    else
                        local v296 = v295:get_classname();
                        if v20() == 7 and string.match(v296, "Taser") then
                            v3.hidden:override(false);
                            v5.right_fake_add = 60;
                            v5.left_fake_add = 60;
                            v5.options_add = "";
                            v5.yaw_mod_add = "Disabled";
                            v5.yaw_offset_add = 0;
                            v3.inverter:override(true);
                        end;
                    end;
                end;
            end;
            if v35.antiaim.tweaks:get("Evade Backstab") then
                v3.backstab:override(true);
            else
                v3.backstab:override(false);
            end;
            if v35.antiaim.manuals:get() == "Left" then
                v5.yaw_offset_add = -90;
            elseif v35.antiaim.manuals:get() == "Right" then
                v5.yaw_offset_add = 90;
            else
                return;
            end;
            return;
        end;
    end;
end;
v4.set_values = function()
    -- upvalues: v3 (ref), v5 (ref)
    v3.yawoffset:override(v5.yaw_offset_add);
    v3.modifier:override(v5.yaw_mod_add);
    v3.modoffset:override(v5.mod_offset_add);
    v3.bodyyaw:override(v5.body_add);
    v3.leftlimit:override(v5.right_fake_add);
    v3.rightlimit:override(v5.left_fake_add);
    v3.options:override(v5.options_add);
end;
aspect_ratio_handler = function()
    -- upvalues: v35 (ref)
    if not v35.misc.aspect:get() then
        return;
    else
        local v297 = v35.misc.aspect.slider:get();
        if v297 ~= previous_aspect_ratio then
            previous_aspect_ratio = v297;
            cvar.r_aspectratio:float(v297 / 100);
        end;
        return;
    end;
end;
scope_overlay = function()
    -- upvalues: v35 (ref), v3 (ref)
    local l_r_0 = v35.misc.scope_overlay.color:get().r;
    local l_b_0 = v35.misc.scope_overlay.color:get().b;
    local l_g_0 = v35.misc.scope_overlay.color:get().g;
    local l_a_0 = v35.misc.scope_overlay.color:get().a;
    local v302 = v35.misc.scope_overlay.inverted:get();
    local l_x_0 = render.screen_size().x;
    local l_y_0 = render.screen_size().y;
    lp = entity.get_local_player();
    if not lp then
        return;
    elseif not lp:is_alive() then
        return;
    elseif not v35.misc.scope_overlay:get() then
        return;
    else
        v3.scope:set("Remove All");
        if entity.get_local_player().m_bIsScoped then
            render.gradient(vector(l_x_0 / 2 + v35.misc.scope_overlay.gap:get() + 1, l_y_0 / 2), vector(l_x_0 / 2 + v35.misc.scope_overlay.gap:get() + v35.misc.scope_overlay.size:get() + 1, l_y_0 / 2 + 1), color(l_r_0, l_b_0, l_g_0, not v302 and l_a_0 or 0), color(l_r_0, l_b_0, l_g_0, v302 and l_a_0 or 0), color(l_r_0, l_b_0, l_g_0, not v302 and l_a_0 or 0), color(l_r_0, l_b_0, l_g_0, v302 and l_a_0 or 0));
            render.gradient(vector(l_x_0 / 2 - v35.misc.scope_overlay.gap:get(), l_y_0 / 2), vector(l_x_0 / 2 - v35.misc.scope_overlay.gap:get() - v35.misc.scope_overlay.size:get(), l_y_0 / 2 + 1), color(l_r_0, l_b_0, l_g_0, not v302 and l_a_0 or 0), color(l_r_0, l_b_0, l_g_0, v302 and l_a_0 or 0), color(l_r_0, l_b_0, l_g_0, not v302 and l_a_0 or 0), color(l_r_0, l_b_0, l_g_0, v302 and l_a_0 or 0));
            render.gradient(vector(l_x_0 / 2, l_y_0 / 2 - v35.misc.scope_overlay.gap:get()), vector(l_x_0 / 2 + 1, l_y_0 / 2 - v35.misc.scope_overlay.gap:get() - v35.misc.scope_overlay.size:get()), color(l_r_0, l_b_0, l_g_0, not v302 and l_a_0 or 0), color(l_r_0, l_b_0, l_g_0, not v302 and l_a_0 or 0), color(l_r_0, l_b_0, l_g_0, v302 and l_a_0 or 0), color(l_r_0, l_b_0, l_g_0, v302 and l_a_0 or 0));
            render.gradient(vector(l_x_0 / 2, l_y_0 / 2 + v35.misc.scope_overlay.gap:get() + 1), vector(l_x_0 / 2 + 1, l_y_0 / 2 + v35.misc.scope_overlay.gap:get() + v35.misc.scope_overlay.size:get() + 1), color(l_r_0, l_b_0, l_g_0, not v302 and l_a_0 or 0), color(l_r_0, l_b_0, l_g_0, not v302 and l_a_0 or 0), color(l_r_0, l_b_0, l_g_0, v302 and l_a_0 or 0), color(l_r_0, l_b_0, l_g_0, v302 and l_a_0 or 0));
        end;
        return;
    end;
end;
unset_viewmodel = function()
    cvar.viewmodel_fov:float(tonumber(cvar.viewmodel_fov:string()));
    cvar.viewmodel_offset_x:float(tonumber(cvar.viewmodel_offset_x:string()));
    cvar.viewmodel_offset_y:float(tonumber(cvar.viewmodel_offset_y:string()));
    cvar.viewmodel_offset_z:float(tonumber(cvar.viewmodel_offset_z:string()));
end;
set_viewmodel = function()
    -- upvalues: v35 (ref)
    if not v35.misc.viewmodel:get() then
        return unset_viewmodel();
    else
        cvar.viewmodel_fov:float(v35.misc.viewmodel.fov:get() / 10, true);
        cvar.viewmodel_offset_x:float(v35.misc.viewmodel.xoff:get() / 10, true);
        cvar.viewmodel_offset_y:float(v35.misc.viewmodel.yoff:get() / 10, true);
        cvar.viewmodel_offset_z:float(v35.misc.viewmodel.zoff:get() / 10, true);
        return;
    end;
end;
local v305 = {
    headshots = 0, 
    hit_rate = 0, 
    misses = 0, 
    hits = 0, 
    total_shots = 0
};
local function v306()
    -- upvalues: v305 (ref)
    v305.total_shots = 0;
    v305.hits = 0;
    v305.misses = 0;
    v305.hit_rate = 0;
    v305.headshots = 0;
end;
local function v310()
    -- upvalues: v35 (ref)
    local v307 = entity.get_local_player();
    if v307 == nil then
        return false;
    else
        local v308 = v307:get_player_weapon();
        if not v308 then
            return false;
        else
            local v309 = v308:get_classname();
            if v35.misc.shot_statics.active:get("Scout") and string.match(v309, "SSG08") then
                return true;
            elseif v35.misc.shot_statics.active:get("Taser") and string.match(v309, "Taser") then
                return true;
            elseif v35.misc.shot_statics.active:get("Knife") and string.match(v309, "Knife") then
                return true;
            elseif v35.misc.shot_statics.active:get("AWP") and string.match(v309, "AWP") then
                return true;
            elseif v35.misc.shot_statics.active:get("Shotgun") and (string.match(v309, "Mag7") or string.match(v309, "Sawedoff") or string.match(v309, "NOVA") or string.match(v309, "XM1014")) then
                return true;
            elseif shot_statics.active:get("Pistols") and (string.match(v309, "Glock") or string.match(v309, "P250") or string.match(v309, "FiveSeven") or string.match(v309, "DEagle") or string.match(v309, "Elite") or string.match(v309, "Tec9") or string.match(v309, "HKP2000")) then
                return true;
            else
                return false;
            end;
        end;
    end;
end;
events.aim_fire(function()
    -- upvalues: v35 (ref), v310 (ref), v305 (ref)
    if v35.misc.shot_statics:get() and v310() then
        v305.total_shots = v305.total_shots + 1;
    end;
end);
events.aim_ack(function(v311)
    -- upvalues: v35 (ref), v310 (ref), v305 (ref)
    if not v35.misc.shot_statics:get() or not v310() then
        return;
    else
        if v311.state == nil then
            v305.hits = v305.hits + 1;
        else
            v305.misses = v305.misses + 1;
        end;
        if v311.hitgroup == 1 then
            v305.headshots = v305.headshots + 1;
        end;
        v305.hit_rate = v305.total_shots > 0 and v305.hits / v305.total_shots * 100 or 0;
        return;
    end;
end);
events.render(function()
    -- upvalues: v306 (ref)
    if not globals.is_connected then
        v306();
    end;
end);
local function v322()
    -- upvalues: v35 (ref), v305 (ref)
    if not v35.misc.shot_statics:get() then
        return;
    else
        local v312 = render.screen_size();
        local v313 = v35.misc.shot_statics.position:get();
        local v314 = nil;
        local v315 = nil;
        if v313 == "Top Left" then
            local v316 = 10;
            v315 = 10;
            v314 = v316;
        elseif v313 == "Top Right" then
            local v317 = v312.x - 150;
            v315 = 10;
            v314 = v317;
        elseif v313 == "Bottom Left" then
            local v318 = 10;
            v315 = v312.y - 100;
            v314 = v318;
        else
            local v319 = v312.x - 150;
            v315 = v312.y - 100;
            v314 = v319;
        end;
        local v320 = color(255, 255, 255, 255);
        local v321 = 0;
        if v35.misc.shot_statics.show_ratio:get() then
            render.text(1, vector(v314, v315 + v321), v320, "", string.format("Hit Ratio: %.1f%%", v305.hit_rate));
            v321 = v321 + 15;
        end;
        if v35.misc.shot_statics.show_damage:get() then
            render.text(1, vector(v314, v315 + v321), v320, "", string.format("Shots: %d", v305.total_shots));
            v321 = v321 + 15;
        end;
        if v35.misc.shot_statics.show_headshots:get() then
            render.text(1, vector(v314, v315 + v321), v320, "", string.format("Headshots: %d", v305.headshots));
        end;
        return;
    end;
end;
events.createmove(function(v323)
    -- upvalues: v4 (ref)
    v4.antiaim_func(v323);
    v4.set_values();
    v4.defensive_force();
end);
performance_mode = function()
    -- upvalues: v35 (ref)
    if v35.misc.optimize:get() then
        cvar.r_shadows:int(0);
        cvar.cl_csm_static_prop_shadows:int(0);
        cvar.cl_csm_shadows:int(0);
        cvar.cl_csm_world_shadows:int(0);
        cvar.cl_foot_contact_shadows:int(0);
        cvar.cl_csm_viewmodel_shadows:int(0);
        cvar.cl_csm_rope_shadows:int(0);
        cvar.cl_csm_sprite_shadows:int(0);
        cvar.r_dynamic:int(0);
        cvar.cl_autohelp:int(0);
        cvar.r_drawparticles:int(1);
        cvar.r_eyesize:int(0);
        cvar.r_eyeshift_z:int(0);
        cvar.r_eyeshift_y:int(0);
        cvar.r_eyeshift_x:int(0);
        cvar.r_eyemove:int(0);
        cvar.r_eyegloss:int(0);
        cvar.r_drawtracers_firstperson:int(0);
        cvar.r_drawtracers:int(0);
        cvar.fog_enable_water_fog:int(0);
        cvar.mat_postprocess_enable:int(0);
        cvar.cl_disablefreezecam:int(0);
        cvar.cl_freezecampanel_position_dynamic:int(0);
        cvar.r_drawdecals:int(0);
        cvar.muzzleflash_light:int(0);
        cvar.r_drawropes:int(0);
        cvar.r_drawsprites:int(0);
        cvar.cl_disablehtmlmotd:int(0);
        cvar.cl_freezecameffects_showholiday:int(0);
        cvar.m_rawinput:int(0);
        cvar.cl_bob_lower_amt:int(0);
        cvar.cl_detail_multiplier:int(0);
        cvar.mat_drawwater:int(0);
        cvar.cl_foot_contact_shadows:int(0);
        cvar.func_break_max_pieces:int(0);
    else
        cvar.r_shadows:int(1);
        cvar.cl_csm_static_prop_shadows:int(1);
        cvar.cl_csm_shadows:int(1);
        cvar.cl_csm_world_shadows:int(1);
        cvar.cl_foot_contact_shadows:int(1);
        cvar.cl_csm_viewmodel_shadows:int(1);
        cvar.cl_csm_rope_shadows:int(1);
        cvar.cl_csm_sprite_shadows:int(1);
        cvar.r_dynamic:int(1);
        cvar.cl_autohelp:int(1);
        cvar.r_drawparticles:int(1);
        cvar.r_eyesize:int(1);
        cvar.r_eyeshift_z:int(1);
        cvar.r_eyeshift_y:int(1);
        cvar.r_eyeshift_x:int(1);
        cvar.r_eyemove:int(1);
        cvar.r_eyegloss:int(1);
        cvar.r_drawtracers_firstperson:int(1);
        cvar.r_drawtracers:int(1);
        cvar.fog_enable_water_fog:int(1);
        cvar.mat_postprocess_enable:int(1);
        cvar.cl_disablefreezecam:int(1);
        cvar.cl_freezecampanel_position_dynamic:int(1);
        cvar.r_drawdecals:int(1);
        cvar.muzzleflash_light:int(1);
        cvar.r_drawropes:int(1);
        cvar.r_drawsprites:int(1);
        cvar.cl_disablehtmlmotd:int(1);
        cvar.cl_freezecameffects_showholiday:int(1);
        cvar.m_rawinput:int(1);
        cvar.cl_bob_lower_amt:int(1);
        cvar.cl_detail_multiplier:int(1);
        cvar.mat_drawwater:int(1);
        cvar.cl_foot_contact_shadows:int(1);
        cvar.func_break_max_pieces:int(1);
    end;
end;
local v324 = render.load_font("Calibri", vector(23, 23.5), "adb");
local _ = {
    hits = 0, 
    total_shots = 0
};
skeet_indicator = function()
    -- upvalues: v35 (ref), v324 (ref), v3 (ref)
    if not v35.misc.skeet_indicators:get() then
        return;
    else
        local v326 = ui.get_binds();
        local v327 = entity.get_local_player();
        if not globals.is_in_game then
            return;
        elseif not v327:is_alive() then
            return;
        else
            local v328 = render.screen_size();
            local v329 = 0;
            local v330 = 40;
            local v331 = render.measure_text(v324, "c", "DT");
            local v332 = nil;
            if not v35.misc.skeet_indicators.indicators_sel:get("Double Tap") then
                v332 = color(225, 57, 57, 0);
            elseif v35.misc.skeet_indicators.indicators_sel:get("Double Tap") and rage.exploit:get() < 1 then
                v332 = color(220, 21, 21);
            else
                v332 = color(225, 255, 255);
            end;
            for v333 = 1, #v326 do
                if v326[v333].name == "Min. Damage" and v326[v333].active then
                    b = 1;
                    c = v326[v333].value;
                end;
            end;
            if c ~= v3.dmg:get() then
                b = 0;
            end;
            for v334 = 1, #v326 do
                if v326[v334].name == "Hit Chance" and v326[v334].active then
                    d = 1;
                    e = v326[v334].value;
                end;
            end;
            if e ~= v3.hc_find:get() then
                d = 0;
            end;
            if v35.misc.skeet_indicators.indicators_sel:get("Double Tap") and v3.dt:get() then
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 - 2), vector(27 - v331.x + 10, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 + v331.y), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 - 2), vector(27 - v331.x + 50, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 + v331.y), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.text(v324, vector(17, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100), v332, "\209\129", "DT");
                v329 = v329 + v330;
            end;
            if v35.misc.skeet_indicators.indicators_sel:get("Hideshots") and v3.hs:get() then
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 - 5 + 100 - 2), vector(27 - v331.x + 10, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 + v331.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 - 5 + 100 - 2), vector(27 - v331.x + 50, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 + v331.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.text(v324, vector(17, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 - 5 + 100), color(136, 207, 52), "\209\129", "ONSHOT");
                v329 = v329 + v330;
            end;
            if v35.misc.skeet_indicators.indicators_sel:get("Dormant Aimbot") and v3.dormant:get() then
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 - 2 - 5), vector(27 - v331.x + 10, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 + v331.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 - 2 - 5), vector(27 - v331.x + 50, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 + v331.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.text(v324, vector(17, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 - 5 + 100), color(136, 207, 52), "\209\129", "DA");
                v329 = v329 + v330;
            end;
            if v35.misc.skeet_indicators.indicators_sel:get("Safepoint") and v3.safe_points:get() == "Force" then
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 - 2 - 5), vector(27 - v331.x + 10, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 + v331.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 - 2 - 5), vector(27 - v331.x + 50, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 + v331.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.text(v324, vector(17, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 - 5 + 100), color(136, 207, 52), "\209\129", "SAFE");
                v329 = v329 + v330;
            end;
            if v35.misc.skeet_indicators.indicators_sel:get("Body Aim") and v3.bodyaim:get() == "Force" then
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 - 2 - 5), vector(27 - v331.x + 10, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 + v331.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 - 2 - 5), vector(27 - v331.x + 50, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 + v331.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.text(v324, vector(17, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 - 5 + 100), color(136, 207, 52), "\209\129", "BAIM");
                v329 = v329 + v330;
            end;
            if v35.misc.skeet_indicators.indicators_sel:get("Freestanding") and v3.fs:get() then
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 - 2 - 5), vector(27 - v331.x + 10, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 + v331.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 - 2 - 5), vector(27 - v331.x + 50, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 + v331.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.text(v324, vector(17, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 - 5 + 100), color(136, 207, 52), "\209\129", "Freestanding");
                v329 = v329 + v330;
            end;
            if v35.misc.skeet_indicators.indicators_sel:get("Fake Duck") and v3.fakeduck:get() then
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 - 5 + 100 - 2), vector(27 - v331.x + 10, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 + v331.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 - 5 + 100 - 2), vector(27 - v331.x + 50, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 100 + v331.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.text(v324, vector(17, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 - 5 + 100), color(136, 207, 52), "\209\129", "FD");
                v329 = v329 + v330;
            end;
            if v35.misc.skeet_indicators.indicators_sel:get("Minimum Damage") and b == 1 then
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 95 - 2 - 5), vector(27 - v331.x + 10, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 95 + v331.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 95 - 2 - 5), vector(27 - v331.x + 50, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 95 + v331.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.text(v324, vector(17, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 - 5 + 95), color(255, 255, 255), "\209\129", "DMG: ", v3.dmg:get());
                v329 = v329 + v330;
            end;
            if v35.misc.skeet_indicators.indicators_sel:get("Hitchance") and d == 1 then
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 95 - 2 - 10), vector(27 - v331.x + 10, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 95 + v331.y - 10), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 95 - 2 - 10), vector(27 - v331.x + 50, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 95 + v331.y - 10), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.text(v324, vector(17, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 90), color(255, 255, 255), "\209\129", "HC: ", v3.hc_find:get());
                v329 = v329 + v330;
            end;
            if v35.misc.skeet_indicators.indicators_sel:get("Ping") and v3.spike:get() ~= 0 then
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 90 - 2), vector(27 - v331.x + 10, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 90 + v331.y), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.gradient(vector(48 - v331.x, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 90 - 2), vector(27 - v331.x + 50, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 90 + v331.y), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.text(v324, vector(17, v35.misc.skeet_indicators.padding:get() + v328.y / 1.75 + v329 + 92), color(300 - v3.spike:get(), 207, 52), "\209\129", "PING");
                v329 = v329 + v330;
            end;
            return;
        end;
    end;
end;
fake_latency = function()
    -- upvalues: v35 (ref)
    if v35.misc.fake_latency:get() then
        ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):override(v35.misc.fake_latency.amount:get());
    else
        ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):override(ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):get());
    end;
end;
local v335 = {
    [1] = "1"
};
local v336 = {
    [1] = "wow", 
    [2] = "wp", 
    [3] = "skilled", 
    [4] = "10wr", 
    [5] = "luck only retard", 
    [6] = "worse player of all"
};
events.player_death:set(function(v337)
    -- upvalues: v35 (ref), v335 (ref), v336 (ref)
    if not v35.misc.trashtalk:get() then
        return;
    else
        local v338 = entity.get_local_player();
        local v339 = entity.get(v337.attacker, true);
        local v340 = entity.get(v337.userid, true);
        if v338 == v339 and v340 ~= v338 then
            utils.execute_after(v35.misc.trashtalk.delay:get(), utils.console_exec, "say " .. v335[math.random(1, #v335)]);
        end;
        if v340 == v338 and v339:get_name() ~= "CWorld" and v35.misc.trashtalk.death:get() then
            utils.execute_after(v35.misc.trashtalk.delay:get(), utils.console_exec, "say " .. v336[math.random(1, #v336)]);
        end;
        return;
    end;
end);
fast_ladder = function(v341)
    -- upvalues: v35 (ref)
    local v342 = entity.get_local_player();
    if not v342 or not v342:is_alive() then
        return;
    elseif not v35.misc.fast_ladder:get() then
        return;
    else
        if entity.get_local_player().m_MoveType == 9 then
            if v341.forwardmove > 0 and render.camera_angles().x < 45 then
                v341.view_angles.x = 89;
                v341.in_moveright = 1;
                v341.in_moveleft = 0;
                v341.in_forward = 0;
                v341.in_back = 1;
                if v341.sidemove == 0 then
                    v341.view_angles.y = v341.view_angles.y + 90;
                end;
                if v341.sidemove < 0 then
                    v341.view_angles.y = v341.view_angles.y + 150;
                end;
                if v341.sidemove > 0 then
                    v341.view_angles.y = v341.view_angles.y + 30;
                end;
            end;
            if v341.forwardmove < 0 then
                v341.view_angles.x = 89;
                v341.in_moveleft = 1;
                v341.in_moveright = 0;
                v341.in_forward = 1;
                v341.in_back = 0;
                if v341.sidemove == 0 then
                    v341.view_angles.y = v341.view_angles.y + 90;
                end;
                if v341.sidemove > 0 then
                    v341.view_angles.y = v341.view_angles.y + 150;
                end;
                if v341.sidemove < 0 then
                    v341.view_angles.y = v341.view_angles.y + 30;
                end;
            end;
        end;
        return;
    end;
end;
local v343 = 0;
local v344 = 0;
local v345 = 0;
local v346 = 0;
scope_animation = function(v347, v348, v349, v350)
    if v347 then
        return math.max(v348 + (v349 - v348) * globals.frametime * v350, 0);
    else
        return math.max(v348 - (v349 + v348) * globals.frametime * v350 / 2, 0);
    end;
end;
local v351 = {
    venture = {
        target = 0, 
        current = 0
    }, 
    dt = {
        target = 0, 
        current = 0
    }, 
    dmg = {
        target = 0, 
        current = 0
    }, 
    aa_state = {
        target = 0, 
        current = 0
    }
};
local v352 = {};
local v353 = 1;
local v354 = render.screen_size().x / 2 - 105;
local v355 = render.screen_size().x / 2 - 120;
local _ = 9;
local v357 = 25;
local _ = 5;
local _ = 300;
local v360 = 240;
local v361 = 3;
local v362 = {
    [0] = "generic", 
    [1] = "head", 
    [2] = "chest", 
    [3] = "stomach", 
    [4] = "left arm", 
    [5] = "right arm", 
    [6] = "left leg", 
    [7] = "right leg", 
    [8] = "head", 
    [9] = "generic", 
    [10] = "gear"
};
local function v365(v363)
    -- upvalues: v352 (ref), v361 (ref), v353 (ref)
    local v364 = {
        event = v363, 
        aimbot_log = {
            alpha = 500, 
            current_x = 0, 
            current_y = 890, 
            moving_up = true, 
            target_y = 860 - (#v352 < v361 and #v352 or v361) * 30
        }
    };
    if #v352 < v361 then
        table.insert(v352, v364);
    else
        v352[v353] = v364;
        v353 = v353 % v361 + 1;
    end;
end;
local function v369(v366, v367, v368)
    return v366 + (v367 - v366) * v368;
end;
local function v379()
    -- upvalues: v152 (ref), v369 (ref), v156 (ref), v158 (ref), v157 (ref), v35 (ref), v155 (ref)
    for v370 = #v152, 1, -1 do
        local v371 = v152[v370];
        if v371 then
            local l_notification_0 = v371.notification;
            l_notification_0.current_y = v369(l_notification_0.current_y, l_notification_0.target_y, 0.05);
            if l_notification_0.alpha > 0 then
                l_notification_0.alpha = l_notification_0.alpha - 2;
            end;
            if l_notification_0.alpha <= 0 then
                table.remove(v152, v370);
            else
                local v373 = math.floor(l_notification_0.alpha / 200 * 2000);
                local v374 = render.measure_text(1, "", "" .. ui.get_icon("shield-halved") .. "  " .. v371.message);
                local v375 = vector(v156 - v374.x / 2 + 110 + l_notification_0.current_x, l_notification_0.current_y + 2);
                local v376 = vector(v156 + v158 + v374.x / 2 - 110 + l_notification_0.current_x, l_notification_0.current_y + v157 + 1);
                render.rect(v375, v376, color(20, 20, 20, v373), 12);
                local v377 = l_notification_0.is_active and v35.misc.notifications.hit_col:get() or color(255, 140, 0);
                render.shadow(v375, v376, color(v377.r, v377.g, v377.b, v373), 50, 0, 12);
                local v378 = vector(v155 - v374.x / 2 + 105 + l_notification_0.current_x, l_notification_0.current_y + 8);
                render.text(1, v378, color(255, 255, 255, v373 * 2), "", "\a" .. v377:to_hex() .. ui.get_icon("shield-halved") .. " \aFFFFFFFF" .. v371.message);
            end;
        end;
    end;
end;
local function v441(_)
    -- upvalues: v35 (ref), v1 (ref), v343 (ref), v344 (ref), v345 (ref), v346 (ref), v351 (ref), v369 (ref), v3 (ref), v8 (ref), v20 (ref), v355 (ref), v360 (ref), v357 (ref), v354 (ref), v352 (ref), v362 (ref)
    local v381 = entity.get_local_player();
    if not v381 then
        return;
    elseif not v381:is_alive() then
        return;
    else
        local v382 = rage.exploit:get();
        local l_m_bIsScoped_0 = v381.m_bIsScoped;
        local _ = math.sin(globals.realtime * 3) * 127 + 127.5;
        local v385 = render.screen_size() / 2;
        local l_x_1 = v385.x;
        local l_y_1 = v385.y;
        if v35.misc.warnings:get() then
            local v388 = render.screen_size() / 2;
            local l_x_2 = v388.x;
            local l_y_2 = v388.y;
            if v35.misc.warnings.defensive:get() then
                local v391 = math.floor(v382 * 100);
                if v391 > 0 and v391 < 100 or ui.get_alpha() == 1 then
                    local v392 = l_x_2 + v35.misc.warnings.def_x_pad:get();
                    local v393 = l_y_2 + v35.misc.warnings.def_y_pad:get();
                    render.rect(vector(v392, v393), vector(v392 + 200, v393 + 5), color(0, 0, 0, 100), 3);
                    render.shadow(vector(v392, v393), vector(v392 + 200, v393 + 8), v35.misc.warnings.accent:get(), 50, 0, 12);
                    local v394 = math.floor(200 * v391 / 100);
                    render.rect(vector(v392, v393), vector(v392 + v394, v393 + 8), v35.misc.warnings.accent:get(), 3);
                    render.text(1, vector(v392 + 2, v393 - 15), color(255, 255, 255, 255), "", "Defensive Charge: " .. v391 .. "%");
                end;
            end;
            if v35.misc.warnings.velocity:get() then
                local v395 = math.floor(v381.m_flVelocityModifier * 100);
                if v395 < 100 or ui.get_alpha() == 1 then
                    local v396 = l_x_2 + v35.misc.warnings.vel_x_pad:get();
                    local v397 = l_y_2 + v35.misc.warnings.vel_y_pad:get();
                    render.shadow(vector(v396, v397), vector(v396 + 200, v397 + 8), v35.misc.warnings.accent:get(), 50, 0, 12);
                    render.rect(vector(v396, v397), vector(v396 + 200, v397 + 8), color(0, 0, 0, 100), 3);
                    local v398 = math.floor(200 * v395 / 100);
                    render.rect(vector(v396, v397), vector(v396 + v398, v397 + 8), v35.misc.warnings.accent:get(), 3);
                    render.text(1, vector(v396 + 2, v397 - 15), color(255, 255, 255, 255), "", "Max Velocity Reduced By " .. v395 .. "%");
                end;
            end;
        end;
        if v35.misc.crosshair_ind:get() then
            local v399 = v1.gradient.text_animate("VENSENSE", -0.9, {
                color(75, 75, 75, 255), 
                color(v35.misc.crosshair_ind.accent_col:get().r, v35.misc.crosshair_ind.accent_col:get().g, v35.misc.crosshair_ind.accent_col:get().b, v35.misc.crosshair_ind.accent_col:get().a)
            });
            if v35.misc.crosshair_ind.ind_select:get() == 1 then
                v343 = scope_animation(l_m_bIsScoped_0, v343, 23, 10) or 0;
                v344 = scope_animation(l_m_bIsScoped_0, v344, 15, 10) or 0;
                v345 = scope_animation(l_m_bIsScoped_0, v345, 12, 10) or 0;
                v346 = scope_animation(l_m_bIsScoped_0, v346, 16, 10) or 0;
                local v400 = 8 + v35.misc.crosshair_ind.gap_add:get();
                local v401 = false;
                local v402 = ui.get_binds();
                for _, v404 in pairs(v402) do
                    if v404.name == "Min. Damage" then
                        v401 = true;
                        break;
                    end;
                end;
                if v35.misc.crosshair_ind.bind_add:get("DMG") then
                    if v401 then
                        v351.dmg.target = v400;
                        v351.dmg.current = v369(v351.dmg.current, v351.dmg.target, 0.1);
                        v400 = v400 + 8 + v35.misc.crosshair_ind.gap_add:get();
                    else
                        v351.dmg.current = v369(v351.dmg.current, -8, 0.1);
                    end;
                end;
                if v35.misc.crosshair_ind.bind_add:get("DT") then
                    if v3.dt:get() then
                        v351.dt.target = v400;
                        v351.dt.current = v369(v351.dt.current, v351.dt.target, 0.1);
                        v400 = v400 + 8 + v35.misc.crosshair_ind.gap_add:get();
                    else
                        v351.dt.current = v369(v351.dt.current, -8, 0.1);
                    end;
                end;
                v351.aa_state.target = v400;
                v351.aa_state.current = v369(v351.aa_state.current, v351.aa_state.target, 0.1);
                if v35.misc.crosshair_ind.bind_add:get("DT") and v3.dt:get() then
                    if v382 == 1 then
                        render.text(2, vector(l_x_1 + v343, l_y_1 + 18 + v351.dt.current), v35.misc.crosshair_ind.bind_col:get(), "c", "DT");
                    else
                        render.text(2, vector(l_x_1 + v343, l_y_1 + 18 + v351.dt.current), color(220, 91, 91, 255), "c", "DT");
                    end;
                end;
                if v35.misc.crosshair_ind.bind_add:get("DMG") and v401 then
                    render.text(2, vector(l_x_1 + v343, l_y_1 + 18 + v351.dmg.current), v35.misc.crosshair_ind.bind_col:get(), "c", "DMG");
                end;
                render.text(2, vector(l_x_1 + v343, l_y_1 + 18 + v351.aa_state.current), v35.misc.crosshair_ind.state_col:get(), "c", v8[v20()]);
                if v35.misc.crosshair_ind.text_select:get() == "Vensense" then
                    render.text(2, vector(l_x_1 + v343, l_y_1 + 18), v35.misc.crosshair_ind.accent_col:get(), "c", v399:get_animated_text());
                else
                    render.text(2, vector(l_x_1 + v343, l_y_1 + 18), v35.misc.crosshair_ind.accent_col:get(), "c", "VENSENSE");
                end;
            elseif v35.misc.crosshair_ind.ind_select:get() == 2 then
                v343 = scope_animation(l_m_bIsScoped_0, v343, 23, 10) or 0;
                v344 = scope_animation(l_m_bIsScoped_0, v344, 24, 10) or 0;
                v345 = scope_animation(l_m_bIsScoped_0, v345, 24, 10) or 0;
                v346 = scope_animation(l_m_bIsScoped_0, v346, 24, 10) or 0;
                local v405 = 8 + v35.misc.crosshair_ind.gap_add:get();
                local v406 = false;
                local v407 = ui.get_binds();
                for _, v409 in pairs(v407) do
                    if v409.name == "Min. Damage" then
                        v406 = true;
                        break;
                    end;
                end;
                if v35.misc.crosshair_ind.bind_add:get("DMG") then
                    if v406 then
                        v351.dmg.target = v405;
                        v351.dmg.current = v369(v351.dmg.current, v351.dmg.target, 0.1);
                        v405 = v405 + 8 + v35.misc.crosshair_ind.gap_add:get();
                    else
                        v351.dmg.current = v369(v351.dmg.current, -8, 0.1);
                    end;
                end;
                if v35.misc.crosshair_ind.bind_add:get("DT") then
                    if v3.dt:get() then
                        v351.dt.target = v405;
                        v351.dt.current = v369(v351.dt.current, v351.dt.target, 0.1);
                        v405 = v405 + 8 + v35.misc.crosshair_ind.gap_add:get();
                    else
                        v351.dt.current = v369(v351.dt.current, -8, 0.1);
                    end;
                end;
                v351.aa_state.target = v405;
                v351.aa_state.current = v369(v351.aa_state.current, v351.aa_state.target, 0.1);
                if v35.misc.crosshair_ind.bind_add:get("DT") and v3.dt:get() then
                    if v382 == 1 then
                        render.text(2, vector(l_x_1 - 13 + v345, l_y_1 + 18 + v351.dt.current), v35.misc.crosshair_ind.bind_col:get(), "c", "DT");
                    else
                        render.text(2, vector(l_x_1 - 13 + v345, l_y_1 + 18 + v351.dt.current), color(220, 91, 91, 251), "c", "DT");
                    end;
                end;
                local v410 = render.measure_text(2, "", v8[v20()]);
                if v35.misc.crosshair_ind.bind_add:get("DMG") and v406 then
                    render.text(2, vector(l_x_1 - 10 + v344, l_y_1 + 18 + v351.dmg.current), v35.misc.crosshair_ind.bind_col:get(), "c", "DMG");
                end;
                render.text(2, vector(l_x_1 - 19 + v410.x / 2 + v346, l_y_1 + 18 + v351.aa_state.current), v35.misc.crosshair_ind.state_col:get(), "c", v8[v20()]);
                if v35.misc.crosshair_ind.text_select:get() == "Vensense" then
                    render.text(2, vector(l_x_1 + v343, l_y_1 + 18), v35.misc.crosshair_ind.accent_col:get(), "c", v399:get_animated_text());
                else
                    render.text(2, vector(l_x_1 + v343, l_y_1 + 18), v35.misc.crosshair_ind.accent_col:get(), "c", "VENSENSE");
                end;
            end;
            v399:animate();
        end;
        if v35.misc.notifications:get() then
            if ui.get_alpha() == 1 then
                local v411 = {
                    current_x = 0, 
                    current_y = 860
                };
                local v412 = "" .. ui.get_icon("triangle-exclamation") .. "  hit Player for 91 damage in stomach";
                local v413 = render.measure_text(1, "", v412);
                local v414 = vector(v355 - v413.x / 2 + 110, v411.current_y + 2);
                local v415 = vector(v355 + v360 + v413.x / 2 - 110, v411.current_y + v357 + 1);
                render.rect(v414, v415, color(20, 20, 20, 255), 12);
                render.shadow(v414, v415, color(v35.misc.notifications.hit_col:get().r, v35.misc.notifications.hit_col:get().g, v35.misc.notifications.hit_col:get().b, 255), 50, 0, 12);
                local v416 = vector(v354 - v413.x / 2 + 105, v411.current_y + 8);
                render.text(1, v416, color(255, 255, 255, 255), "", "\a" .. v35.misc.notifications.hit_col:get():to_hex() .. ui.get_icon("triangle-exclamation") .. " \aFFFFFFFFhit \a" .. v35.misc.notifications.hit_col:get():to_hex() .. "Player" .. " \aFFFFFFFFfor \a" .. v35.misc.notifications.hit_col:get():to_hex() .. "91" .. " \aFFFFFFFFdamage in \a" .. v35.misc.notifications.hit_col:get():to_hex() .. "stomach" .. "!");
            end;
            for v417 = #v352, 1, -1 do
                local v418 = v352[v417];
                if v418 then
                    local l_aimbot_log_0 = v418.aimbot_log;
                    if not l_aimbot_log_0 then
                        return;
                    else
                        l_aimbot_log_0.current_y = v369(l_aimbot_log_0.current_y, l_aimbot_log_0.target_y, 0.05);
                        if l_aimbot_log_0.alpha > 0 then
                            l_aimbot_log_0.alpha = l_aimbot_log_0.alpha - 1.5;
                        end;
                        if l_aimbot_log_0.alpha <= 0 then
                            table.remove(v352, v417);
                        elseif v418.event then
                            local l_target_0 = v418.event.target;
                            local v421 = l_target_0 and l_target_0:is_alive() and l_target_0:get_name() or "Unknown";
                            local v422 = v418.event.damage or 0;
                            if not v418.event.wanted_damage then
                                local _ = 0;
                            end;
                            local v424 = v362[v418.event.hitgroup];
                            if not v418.event.backtrack then
                                local _ = 0;
                            end;
                            local _ = l_aimbot_log_0.alpha / 500 * (v360 - v355);
                            if not v418.event.state then
                                local v427 = render.measure_text(1, "", "" .. ui.get_icon("triangle-exclamation") .. "  hit " .. v421 .. " for " .. v422 .. " damage in " .. v424);
                                local v428 = vector(v355 - v427.x / 2 + 110 + l_aimbot_log_0.current_x, l_aimbot_log_0.current_y + 2);
                                local v429 = vector(v355 + v360 + v427.x / 2 - 110 + l_aimbot_log_0.current_x, l_aimbot_log_0.current_y + v357 + 1);
                                local v430 = math.floor(l_aimbot_log_0.alpha / 200 * 2000);
                                render.rect(v428, v429, color(20, 20, 20, v430), 12);
                                render.shadow(v428, v429, color(v35.misc.notifications.hit_col:get().r, v35.misc.notifications.hit_col:get().g, v35.misc.notifications.hit_col:get().b, v430), 50, 0, 12);
                                local v431 = vector(v354 - v427.x / 2 + 105 + l_aimbot_log_0.current_x, l_aimbot_log_0.current_y + 8);
                                render.text(1, v431, color(255, 255, 255, v430 * 2), "", "\a" .. v35.misc.notifications.hit_col:get():to_hex() .. ui.get_icon("triangle-exclamation") .. " \aFFFFFFFFhit \a" .. v35.misc.notifications.hit_col:get():to_hex() .. v421 .. " \aFFFFFFFFfor \a" .. v35.misc.notifications.hit_col:get():to_hex() .. v422 .. " \aFFFFFFFFdamage in \a" .. v35.misc.notifications.hit_col:get():to_hex() .. v424 .. "!");
                            elseif v418 then
                                local v432 = v418.event.state or "unknown";
                                local v433 = v362[v418.event.wanted_hitgroup] or "unknown";
                                local v434 = render.measure_text(1, "", "" .. ui.get_icon("triangle-exclamation") .. "  missed " .. v421 .. " due to " .. v432 .. " in " .. v433);
                                local v435 = vector(v355 - v434.x / 2 + 110 + l_aimbot_log_0.current_x, l_aimbot_log_0.current_y + 2);
                                local v436 = vector(v355 + v360 + v434.x / 2 - 110 + l_aimbot_log_0.current_x, l_aimbot_log_0.current_y + v357 + 1);
                                local v437 = math.floor(l_aimbot_log_0.alpha / 200 * 2000);
                                render.rect(v435, v436, color(20, 20, 20, v437), 12);
                                render.shadow(v435, v436, color(v35.misc.notifications.miss_col:get().r, v35.misc.notifications.miss_col:get().g, v35.misc.notifications.miss_col:get().b, v437), 50, 0, 12);
                                local v438 = vector(v354 - v434.x / 2 + 105 + l_aimbot_log_0.current_x, l_aimbot_log_0.current_y + 8);
                                render.text(1, v438, color(255, 255, 255, v437 * 2), "", "\a" .. v35.misc.notifications.miss_col:get():to_hex() .. ui.get_icon("triangle-exclamation") .. " \aFFFFFFFFmissed \a" .. v35.misc.notifications.miss_col:get():to_hex() .. v421 .. " \aFFFFFFFFdue to \a" .. v35.misc.notifications.miss_col:get():to_hex() .. v432 .. " \aFFFFFFFFin \a" .. v35.misc.notifications.miss_col:get():to_hex() .. v433 .. "!");
                            end;
                            local function _(v439)
                                if v439.alpha > 50 then
                                    v439.alpha = v439.alpha - 1;
                                else
                                    v439.alpha = v439.alpha - 5;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
local v442 = render.load_font("Verdana", vector(10.5, 11.5, 5), "ad");
aimbot_logs = function(v443)
    -- upvalues: v362 (ref), v35 (ref)
    if not entity.get_local_player() then
        return;
    else
        hitbox = v362[v443.hitgroup];
        damage = v443.damage or 0;
        hitchance = v443.hitchance;
        backtrack = v443.backtrack;
        wanted_damage = v443.wanted_damage;
        wanted_hitbox = v362[v443.wanted_hitgroup];
        reason = v443.state;
        target = entity.get(v443.target);
        name = target:get_name();
        mismatch_damage = " (+0)";
        if wanted_damage < damage then
            mismatch_damage = " (+" .. damage - wanted_damage .. ")";
        end;
        if damage < wanted_damage then
            mismatch_damage = " (-" .. wanted_damage - damage .. ")";
        end;
        if hitbox ~= wanted_hitbox then
            mismatch_hitbox = "(-" .. wanted_hitbox .. ")";
        else
            mismatch_hitbox = "";
        end;
        hit = false;
        unregistered = false;
        missed = false;
        if reason == nil then
            if damage > -1 then
                hit = true;
            elseif damage < 0 then
                unregistered = true;
            end;
        end;
        if reason ~= nil then
            missed = true;
        end;
        if v35.misc.console_logs:get() then
            local v444 = render.screen_size() / 2;
            local l_x_3 = v444.x;
            local l_y_3 = v444.y;
            local v447 = 240;
            local v448 = 10;
            local v449 = l_x_3 - v447 / 2;
            local v450 = l_y_3 - 125;
            render.rect(vector(v449, v450), vector(v449 + v447, v450 + v448), color(255, 255, 255, 255), 2);
            if hit == true then
                print_raw(("\a" .. v35.misc.notifications.hit_col:get():to_hex() .. "Vensense \aFFFFFFF | Hit %s's %s%s for %s%s damage (%s%s) | (%s ticks)"):format(name, hitbox, mismatch_hitbox, damage, mismatch_damage, hitchance, "hc", backtrack));
            end;
            if missed == true then
                print_raw(("\a" .. v35.misc.notifications.miss_col:get():to_hex() .. "Vensense \aFFFFFFF | Missed %s's %s for %s damage (%s%s) due to %s | (%s ticks)"):format(name, wanted_hitbox, wanted_damage, hitchance, "hc", reason, backtrack));
            end;
            if unregistered == true then
                print_raw(("\a" .. v35.misc.notifications.miss_col:get():to_hex() .. "Vensense \aFFFFFFF | Missed %s's %s for %s damage (%s%s) due to unregistered shot | (%s ticks)"):format(name, wanted_hitbox, wanted_damage, hitchance, "hc", backtrack));
            end;
        end;
        return;
    end;
end;
local v451 = v1.gradient.text_animate("VenSense", -1.5, {
    ui.get_style("Link Active"), 
    color(45, 45, 45, 255)
});
events.render:set(function(v452, _)
    -- upvalues: v35 (ref), v441 (ref), v322 (ref), v379 (ref), v451 (ref), v1 (ref), v442 (ref), v4 (ref)
    v35.misc.warnings.vel_x_pad:visibility(v35.misc.warnings.config_pos:get() == 1);
    v35.misc.warnings.vel_y_pad:visibility(v35.misc.warnings.config_pos:get() == 1);
    v35.misc.warnings.def_x_pad:visibility(v35.misc.warnings.config_pos:get() == 2);
    v35.misc.warnings.def_y_pad:visibility(v35.misc.warnings.config_pos:get() == 2);
    v35.misc.watermark:set(true);
    v441(v452);
    v322();
    aspect_ratio_handler();
    scope_overlay();
    set_viewmodel();
    performance_mode();
    skeet_indicator();
    fake_latency();
    v379();
    ui.sidebar(v451:get_animated_text(), "plane-up");
    v451:animate();
    if v35.misc.watermark:get() then
        local _ = v1.gradient.text_animate("vensense", -1.9, {
            color(75, 75, 75, 255), 
            color(255, 255, 255, 255)
        });
        local v455 = render.screen_size();
        local _ = entity.get_local_player();
        local v457 = "LUASENSE";
        local v458 = v1.gradient.text_animate("SENSE", -1, {
            color(255, 255, 255, 80), 
            color(255, 255, 255, 240)
        });
        v458:animate();
        local v459 = render.measure_text(v442, nil, v457);
        local v460 = vector(0, 0);
        local v461 = v35.misc.watermark.pos:get();
        if v461 == "Right" then
            v460 = vector(v455.x - 12 - v459.x, v455.y * 0.5 - 2 - v459.y);
        elseif v461 == "Left" then
            v460 = vector(12, v455.y * 0.5 - 2 - v459.y);
        elseif v461 == "Bottom" then
            v460 = vector(v455.x * 0.5 - v459.x * 0.5, v455.y - 12 - v459.y);
        end;
        render.text(v442, v460, color(), nil, "\a" .. color(v35.misc.watermark.accent_col:get().r, v35.misc.watermark.accent_col:get().g, v35.misc.watermark.accent_col:get().b, 255):to_hex() .. "VEN" .. v458:get_animated_text());
    end;
    if v4 and v4.menu_visibility then
        v4.menu_visibility();
    end;
end);
events.aim_ack:set(function(v462)
    -- upvalues: v365 (ref)
    v365(v462);
    aimbot_logs(v462);
end);
local v463 = {
    state_builder = v37
};
local v464 = {};
local v465 = {
    [1] = {
        settings = "W3siYW50aWFpbSI6eyJhbmltcyI6ZmFsc2UsImRlZmVuc2l2ZV9zZXR0cyI6eyJjb25kaXRpb25zIjpbIkluIEFpciIsIkFpciBDcm91Y2giLCJ+Il0sImhpZGVzaG90cyI6dHJ1ZX0sImZyZWVzdGFuZCI6ZmFsc2UsIm1hbnVhbHMiOiJEaXNhYmxlZCIsInNhZmUiOnRydWUsInN0YXRlX2NvbmRpdGlvbiI6IkFpciBDcm91Y2giLCJ0ZWFtX3NlbGVjdCI6IlRlYW1zIiwidGVhbXMiOjEuMCwidHdlYWtzIjpbIkV2YWRlIEJhY2tzdGFiIiwifiJdLCJ+ZnJlZXN0YW5kIjp7ImRpc2FibGUiOlsifiJdfSwifnNhZmUiOnsic2FmZV9zZWxlY3QiOlsxLjAsMi4wLCJ+Il19fSwibWlzYyI6eyJhc3BlY3QiOnRydWUsImNvbnNvbGVfbG9ncyI6dHJ1ZSwiY3Jvc3NoYWlyX2luZCI6dHJ1ZSwiZmFrZV9sYXRlbmN5Ijp0cnVlLCJmYXN0X2xhZGRlciI6ZmFsc2UsIm5vdGlmaWNhdGlvbnMiOnRydWUsIm9wdGltaXplIjpmYWxzZSwic2NvcGVfb3ZlcmxheSI6dHJ1ZSwic2hvdF9zdGF0aWNzIjp0cnVlLCJza2VldF9pbmRpY2F0b3JzIjp0cnVlLCJ0cmFzaHRhbGsiOnRydWUsInZpZXdtb2RlbCI6dHJ1ZSwid2FybmluZ3MiOnRydWUsIndhdGVybWFyayI6dHJ1ZSwifmFzcGVjdCI6eyJzbGlkZXIiOjEzMC4wfSwifmNyb3NzaGFpcl9pbmQiOnsiYWNjZW50X2NvbCI6IiNCRUE4QThGRiIsImJpbmRfYWRkIjpbIkRUIiwiRE1HIiwifiJdLCJiaW5kX2NvbCI6IiNGRkZGRkZGRiIsImdhcF9hZGQiOjIuMCwiaW5kX3NlbGVjdCI6Mi4wLCJzdGF0ZV9jb2wiOiIjQUJBQkFCRkYiLCJ0ZXh0X3NlbGVjdCI6IlZlbnNlbnNlIn0sIn5mYWtlX2xhdGVuY3kiOnsiYW1vdW50IjoxMTAuMH0sIn5ub3RpZmljYXRpb25zIjp7ImhpdF9jb2wiOiIjMDBGRjAwRkYiLCJtaXNzX2NvbCI6IiNGRjAwMDBGRiJ9LCJ+c2NvcGVfb3ZlcmxheSI6eyJjb2xvciI6IiNGRkZGRkY3NiIsImdhcCI6NS4wLCJpbnZlcnRlZCI6ZmFsc2UsInNpemUiOjc1LjB9LCJ+c2hvdF9zdGF0aWNzIjp7ImFjdGl2ZSI6WyJ+Il0sInBvc2l0aW9uIjoiVG9wIFJpZ2h0Iiwic2hvd19kYW1hZ2UiOnRydWUsInNob3dfaGVhZHNob3RzIjp0cnVlLCJzaG93X3JhdGlvIjp0cnVlfSwifnNrZWV0X2luZGljYXRvcnMiOnsiaW5kaWNhdG9yc19zZWwiOlsiRG91YmxlIFRhcCIsIkhpZGVzaG90cyIsIk1pbmltdW0gRGFtYWdlIiwiQm9keSBBaW0iLCJIaXRjaGFuY2UiLCJEb3JtYW50IEFpbWJvdCIsIlNhZmVwb2ludCIsIkZyZWVzdGFuZGluZyIsIkZha2UgRHVjayIsIlBpbmciLCJ+Il0sInBhZGRpbmciOjAuMH0sIn50cmFzaHRhbGsiOnsiZGVhdGgiOmZhbHNlLCJkZWxheSI6Mi4wfSwifnZpZXdtb2RlbCI6eyJmb3YiOjY4MC4wLCJ4b2ZmIjoyNS4wLCJ5b2ZmIjowLjAsInpvZmYiOi0xNS4wfSwifndhcm5pbmdzIjp7ImFjY2VudCI6IiNBQ0E1REFGRiIsImNvbmZpZ19wb3MiOjIuMCwiZGVmX3hfcGFkIjotOTIuMCwiZGVmX3lfcGFkIjotMjQ2LjAsImRlZmVuc2l2ZSI6dHJ1ZSwidmVsX3hfcGFkIjotOTIuMCwidmVsX3lfcGFkIjotMjkyLjAsInZlbG9jaXR5Ijp0cnVlfSwifndhdGVybWFyayI6eyJhY2NlbnRfY29sIjoiI0ZGNEY2NEZGIiwicG9zIjoiUmlnaHQifX19LHsic3RhdGVfYnVpbGRlciI6eyJlbGVtZW50cyI6eyJDVCI6W3siYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6MC4wLCJkZWxheV90aWNrc19hcnJheSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTMzLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6NDEuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjoyLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6MC4wLCJsZWZ0IjotMjUuMCwibGVmdF9mYWtlIjo2MC4wLCJtb2RfcmFuZG9taXplciI6MC4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwifiJdLCJyYW5kb21fZGVsYXkiOmZhbHNlLCJyYW5kb21pemVyIjowLjAsInJpZ2h0IjozMy4wLCJyaWdodF9mYWtlIjo2MC4wLCJzdGF0aWMiOjAuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjAuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0yNC4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjMwLjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6Mi4wLCJkZWxheV90aWNrc19hcnJheSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTMwLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6MzUuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjotMzIuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjIuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0yMC4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjI4LjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJBZGFwdGl2ZSIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjAuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0xMy4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjE5LjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6Mi4wLCJkZWxheV90aWNrc19hcnJheSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTE5LjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6NDUuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn1dLCJPRkYiOlt7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjIuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0xOC4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjQ1LjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6Ni4wLCJkZWxheV90aWNrc19hcnJheSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTI1LjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6NTIuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjo0LjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6LTYuMCwibGVmdCI6LTE0LjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6MzcuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IlJhbmRvbSJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6MC4wLCJkZWxheV90aWNrc19hcnJheSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTEyLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6NDIuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjowLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6LTcuMCwibGVmdCI6LTEyLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjMyLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjM4LjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6Ny4wLCJicnV0ZV90b2dnbGUiOnRydWUsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjo0LjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6MC4wLCJsZWZ0IjotMTkuMCwibGVmdF9mYWtlIjo2MC4wLCJtb2RfcmFuZG9taXplciI6MC4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwifiJdLCJyYW5kb21fZGVsYXkiOmZhbHNlLCJyYW5kb21pemVyIjowLjAsInJpZ2h0Ijo0Ny4wLCJyaWdodF9mYWtlIjo2MC4wLCJzdGF0aWMiOi03LjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6Mi4wLCJicnV0ZV90aW1lb3V0Ijo4LjAsImJydXRlX3RvZ2dsZSI6dHJ1ZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjEuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImhpZGRlbl9idWlsZCI6dHJ1ZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTIzLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6NTAuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn1dLCJUIjpbeyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjowLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6MC4wLCJsZWZ0IjotMzMuMCwibGVmdF9mYWtlIjo2MC4wLCJtb2RfcmFuZG9taXplciI6MC4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwifiJdLCJyYW5kb21fZGVsYXkiOmZhbHNlLCJyYW5kb21pemVyIjoxLjAsInJpZ2h0Ijo0MS4wLCJyaWdodF9mYWtlIjo2MC4wLCJzdGF0aWMiOjAuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjIuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0yNS4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjMzLjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJBZGFwdGl2ZSIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjAuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0yNC4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOi0zMC4wLCJyaWdodCI6MzAuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IlNlcXVlbmNlZCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjIuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0zMC4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjM1LjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6LTMyLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjoyLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6MC4wLCJsZWZ0IjotMjAuMCwibGVmdF9mYWtlIjo2MC4wLCJtb2RfcmFuZG9taXplciI6MC4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwifiJdLCJyYW5kb21fZGVsYXkiOmZhbHNlLCJyYW5kb21pemVyIjo4LjAsInJpZ2h0IjoyOC4wLCJyaWdodF9mYWtlIjo2MC4wLCJzdGF0aWMiOjAuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjAuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0xMy4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjMwLjAsInJpZ2h0IjoxOS4wLCJyaWdodF9mYWtlIjo2MC4wLCJzdGF0aWMiOjAuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoyLjAsImJydXRlX3RpbWVvdXQiOjMuMCwiYnJ1dGVfdG9nZ2xlIjp0cnVlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6Mi4wLCJkZWxheV90aWNrc19hcnJheSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTE5LjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6OC4wLCJyaWdodCI6NDUuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn1dfX19XQ==", 
        name = "Meta"
    }, 
    [2] = {
        settings = "W3siYW50aWFpbSI6eyJhbmltcyI6ZmFsc2UsImRlZmVuc2l2ZV9zZXR0cyI6eyJjb25kaXRpb25zIjpbIkluIEFpciIsIkFpciBDcm91Y2giLCJ+Il0sImhpZGVzaG90cyI6dHJ1ZX0sImZyZWVzdGFuZCI6ZmFsc2UsIm1hbnVhbHMiOiJEaXNhYmxlZCIsInNhZmUiOnRydWUsInN0YXRlX2NvbmRpdGlvbiI6IkluIEFpciIsInRlYW1fc2VsZWN0IjoiRGlzYWJsZWQiLCJ0ZWFtcyI6MS4wLCJ0d2Vha3MiOlsiRXZhZGUgQmFja3N0YWIiLCJ+Il0sIn5mcmVlc3RhbmQiOnsiZGlzYWJsZSI6WyJ+Il19LCJ+c2FmZSI6eyJzYWZlX3NlbGVjdCI6WzEuMCwyLjAsIn4iXX19LCJtaXNjIjp7ImFzcGVjdCI6dHJ1ZSwiY29uc29sZV9sb2dzIjp0cnVlLCJjcm9zc2hhaXJfaW5kIjp0cnVlLCJmYWtlX2xhdGVuY3kiOnRydWUsImZhc3RfbGFkZGVyIjpmYWxzZSwibm90aWZpY2F0aW9ucyI6dHJ1ZSwib3B0aW1pemUiOmZhbHNlLCJzY29wZV9vdmVybGF5Ijp0cnVlLCJzaG90X3N0YXRpY3MiOnRydWUsInNrZWV0X2luZGljYXRvcnMiOnRydWUsInRyYXNodGFsayI6ZmFsc2UsInZpZXdtb2RlbCI6dHJ1ZSwid2FybmluZ3MiOnRydWUsIndhdGVybWFyayI6dHJ1ZSwifmFzcGVjdCI6eyJzbGlkZXIiOjEzMC4wfSwifmNyb3NzaGFpcl9pbmQiOnsiYWNjZW50X2NvbCI6IiNCRUE4QThGRiIsImJpbmRfYWRkIjpbIkRUIiwiRE1HIiwifiJdLCJiaW5kX2NvbCI6IiNGRkZGRkZGRiIsImdhcF9hZGQiOjIuMCwiaW5kX3NlbGVjdCI6Mi4wLCJzdGF0ZV9jb2wiOiIjQUJBQkFCRkYiLCJ0ZXh0X3NlbGVjdCI6IlZlbnNlbnNlIn0sIn5mYWtlX2xhdGVuY3kiOnsiYW1vdW50IjoxMTAuMH0sIn5ub3RpZmljYXRpb25zIjp7ImhpdF9jb2wiOiIjMDBGRjAwRkYiLCJtaXNzX2NvbCI6IiNGRjAwMDBGRiJ9LCJ+c2NvcGVfb3ZlcmxheSI6eyJjb2xvciI6IiNGRkZGRkY3NiIsImdhcCI6NS4wLCJpbnZlcnRlZCI6ZmFsc2UsInNpemUiOjc1LjB9LCJ+c2hvdF9zdGF0aWNzIjp7ImFjdGl2ZSI6WyJ+Il0sInBvc2l0aW9uIjoiVG9wIFJpZ2h0Iiwic2hvd19kYW1hZ2UiOnRydWUsInNob3dfaGVhZHNob3RzIjp0cnVlLCJzaG93X3JhdGlvIjp0cnVlfSwifnNrZWV0X2luZGljYXRvcnMiOnsiaW5kaWNhdG9yc19zZWwiOlsiRG91YmxlIFRhcCIsIkhpZGVzaG90cyIsIk1pbmltdW0gRGFtYWdlIiwiQm9keSBBaW0iLCJIaXRjaGFuY2UiLCJEb3JtYW50IEFpbWJvdCIsIlNhZmVwb2ludCIsIkZyZWVzdGFuZGluZyIsIkZha2UgRHVjayIsIlBpbmciLCJ+Il0sInBhZGRpbmciOjAuMH0sIn50cmFzaHRhbGsiOnsiZGVhdGgiOmZhbHNlLCJkZWxheSI6Mi4wfSwifnZpZXdtb2RlbCI6eyJmb3YiOjY4MC4wLCJ4b2ZmIjoyNS4wLCJ5b2ZmIjowLjAsInpvZmYiOi0xNS4wfSwifndhcm5pbmdzIjp7ImFjY2VudCI6IiNBQ0E1REFGRiIsImNvbmZpZ19wb3MiOjIuMCwiZGVmX3hfcGFkIjotOTIuMCwiZGVmX3lfcGFkIjotMjQ2LjAsImRlZmVuc2l2ZSI6dHJ1ZSwidmVsX3hfcGFkIjotOTIuMCwidmVsX3lfcGFkIjotMjkyLjAsInZlbG9jaXR5Ijp0cnVlfSwifndhdGVybWFyayI6eyJhY2NlbnRfY29sIjoiI0ZGNEY2NEZGIiwicG9zIjoiUmlnaHQifX19LHsic3RhdGVfYnVpbGRlciI6eyJlbGVtZW50cyI6eyJDVCI6W3siYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6MC4wLCJkZWxheV90aWNrc19hcnJheSI6WzMuMCw2LjAsNi4wLDUuMCw0LjAsMS4wLDUuMCw3LjAsMy4wLDIuMCw2LjAsMi4wLDMuMCw1LjAsNS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTMzLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6NDEuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjoyLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbOC4wLDIuMCw1LjAsMTAuMCw3LjAsOS4wLDIuMCwxMC4wLDkuMCwyLjAsMi4wLDUuMCwxMC4wLDEwLjAsMi4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTI1LjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6MzMuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjowLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMi4wLDcuMCw5LjAsMi4wLDMuMCw1LjAsOC4wLDcuMCw5LjAsMy4wLDYuMCwxLjAsOC4wLDkuMCwxLjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6MC4wLCJsZWZ0IjotMjQuMCwibGVmdF9mYWtlIjo2MC4wLCJtb2RfcmFuZG9taXplciI6MC4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwifiJdLCJyYW5kb21fZGVsYXkiOmZhbHNlLCJyYW5kb21pemVyIjowLjAsInJpZ2h0IjozMC4wLCJyaWdodF9mYWtlIjo2MC4wLCJzdGF0aWMiOjAuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjIuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsOC4wLDkuMCwzLjAsNy4wLDcuMCw4LjAsMTAuMCwyLjAsNy4wLDcuMCw2LjAsNS4wLDkuMCwxMC4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTMwLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6MzUuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjotMzIuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjIuMCwiZGVsYXlfdGlja3NfYXJyYXkiOls3LjAsMi4wLDMuMCw3LjAsNS4wLDcuMCw1LjAsNi4wLDguMCw5LjAsMS4wLDEwLjAsMy4wLDEwLjAsOC4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTIwLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6MjguMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkFkYXB0aXZlIiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6MC4wLCJkZWxheV90aWNrc19hcnJheSI6WzEuMCwyLjAsNi4wLDIuMCwxLjAsNy4wLDYuMCw1LjAsNy4wLDIuMCw3LjAsOC4wLDMuMCw0LjAsNS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTEzLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6MTkuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjoyLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMTAuMCw0LjAsNy4wLDIuMCw0LjAsNC4wLDQuMCw5LjAsMTAuMCw4LjAsMi4wLDEuMCwxLjAsMi4wLDguMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0xOS4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjQ1LjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9XSwiT0ZGIjpbeyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjoyLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbNi4wLDMuMCwxMC4wLDcuMCw0LjAsMS4wLDQuMCw5LjAsMy4wLDEuMCw0LjAsMi4wLDguMCw3LjAsNi4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTE4LjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6NDUuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo2LjAsImRlbGF5X3RpY2tzIjoxLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMS4wLDEuMCwzLjAsMi4wLDMuMCwyLjAsNS4wLDMuMCwxMC4wLDkuMCwyLjAsNS4wLDYuMCwyLjAsMi4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTI4LjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5Ijp0cnVlLCJyYW5kb21pemVyIjowLjAsInJpZ2h0Ijo0MS4wLCJyaWdodF9mYWtlIjo2MC4wLCJzdGF0aWMiOjAuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjQuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxMC4wLDcuMCw2LjAsOC4wLDIuMCw1LjAsNC4wLDIuMCwyLjAsMy4wLDYuMCwzLjAsOC4wLDcuMCw3LjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6LTYuMCwibGVmdCI6LTE0LjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6MzcuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IlJhbmRvbSJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NC4wLCJkZWxheV90aWNrcyI6Mi4wLCJkZWxheV90aWNrc19hcnJheSI6WzEuMCwzLjAsMi4wLDQuMCwxMC4wLDEuMCw5LjAsOC4wLDkuMCwzLjAsMi4wLDEwLjAsNy4wLDUuMCw4LjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6MC4wLCJsZWZ0IjotMjUuMCwibGVmdF9mYWtlIjo2MC4wLCJtb2RfcmFuZG9taXplciI6MC4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwifiJdLCJyYW5kb21fZGVsYXkiOnRydWUsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjQzLjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6Ni4wLCJkZWxheV90aWNrcyI6MS4wLCJkZWxheV90aWNrc19hcnJheSI6WzIuMCwzLjAsMi4wLDIuMCwxLjAsMS4wLDkuMCw4LjAsMi4wLDMuMCw2LjAsMS4wLDIuMCw4LjAsNS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOi03LjAsImxlZnQiOi0yMC4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjozMi4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwifiJdLCJyYW5kb21fZGVsYXkiOnRydWUsInJhbmRvbWl6ZXIiOjUuMCwicmlnaHQiOjQzLjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6Ny4wLCJicnV0ZV90b2dnbGUiOnRydWUsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50IjozLjAsImRlbGF5X3RpY2tzIjoxLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMi4wLDMuMCwxLjAsNy4wLDguMCwxMC4wLDcuMCwzLjAsNi4wLDYuMCwxLjAsOS4wLDkuMCw3LjAsMTAuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOjEwLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5Ijp0cnVlLCJyYW5kb21pemVyIjowLjAsInJpZ2h0Ijo3LjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6LTcuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoyLjAsImJydXRlX3RpbWVvdXQiOjguMCwiYnJ1dGVfdG9nZ2xlIjp0cnVlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJQdWxzZSIsImRlbGF5X3NsaWRlcnNfY291bnQiOjYuMCwiZGVsYXlfdGlja3MiOjIuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsNC4wLDMuMCwyLjAsNC4wLDMuMCw2LjAsNC4wLDEuMCw5LjAsMTAuMCw4LjAsMy4wLDguMCw3LjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6MC4wLCJsZWZ0IjotMTkuMCwibGVmdF9mYWtlIjo2MC4wLCJtb2RfcmFuZG9taXplciI6MC4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwifiJdLCJyYW5kb21fZGVsYXkiOnRydWUsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjQzLjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9XSwiVCI6W3siYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6MC4wLCJkZWxheV90aWNrc19hcnJheSI6WzEuMCw1LjAsNi4wLDguMCw3LjAsMy4wLDcuMCw5LjAsNC4wLDEwLjAsMTAuMCwyLjAsMS4wLDkuMCw2LjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6MC4wLCJsZWZ0IjotMzMuMCwibGVmdF9mYWtlIjo2MC4wLCJtb2RfcmFuZG9taXplciI6MC4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwifiJdLCJyYW5kb21fZGVsYXkiOmZhbHNlLCJyYW5kb21pemVyIjoxLjAsInJpZ2h0Ijo0MS4wLCJyaWdodF9mYWtlIjo2MC4wLCJzdGF0aWMiOjAuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjIuMCwiZGVsYXlfdGlja3NfYXJyYXkiOls4LjAsOC4wLDcuMCwxMC4wLDQuMCwzLjAsMy4wLDkuMCwxMC4wLDEwLjAsOC4wLDQuMCw0LjAsNC4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0yNS4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjMzLjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJBZGFwdGl2ZSIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjAuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsyLjAsNC4wLDQuMCw1LjAsNC4wLDcuMCw3LjAsMi4wLDYuMCw1LjAsNC4wLDEwLjAsMi4wLDMuMCw3LjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6MC4wLCJsZWZ0IjotMjQuMCwibGVmdF9mYWtlIjo2MC4wLCJtb2RfcmFuZG9taXplciI6MC4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwifiJdLCJyYW5kb21fZGVsYXkiOmZhbHNlLCJyYW5kb21pemVyIjotMzAuMCwicmlnaHQiOjMwLjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJTZXF1ZW5jZWQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjoyLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMTAuMCw0LjAsOS4wLDUuMCw4LjAsMy4wLDguMCw1LjAsMS4wLDkuMCwxLjAsOS4wLDEuMCwxLjAsNS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTMwLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6MzUuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjotMzIuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjIuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlszLjAsMS4wLDQuMCwxMC4wLDkuMCwxLjAsMTAuMCwxLjAsMy4wLDIuMCw2LjAsNS4wLDcuMCwxLjAsMS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTIwLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6OC4wLCJyaWdodCI6MjguMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjowLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbOC4wLDYuMCwxLjAsMy4wLDEwLjAsOC4wLDQuMCw3LjAsOC4wLDIuMCw0LjAsMTAuMCw1LjAsMS4wLDkuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0xMy4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjMwLjAsInJpZ2h0IjoxOS4wLCJyaWdodF9mYWtlIjo2MC4wLCJzdGF0aWMiOjAuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoyLjAsImJydXRlX3RpbWVvdXQiOjMuMCwiYnJ1dGVfdG9nZ2xlIjp0cnVlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6Mi4wLCJkZWxheV90aWNrc19hcnJheSI6WzQuMCwzLjAsMi4wLDMuMCwzLjAsMTAuMCw3LjAsMi4wLDguMCw5LjAsOC4wLDYuMCwzLjAsMi4wLDguMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0xOS4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjguMCwicmlnaHQiOjQ1LjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9XX19fV0=", 
        name = "Snap Delay"
    }, 
    [3] = {
        settings = "W3siYW50aWFpbSI6eyJhbmltcyI6ZmFsc2UsImRlZmVuc2l2ZV9zZXR0cyI6eyJjb25kaXRpb25zIjpbIkluIEFpciIsIkFpciBDcm91Y2giLCJ+Il0sImhpZGVzaG90cyI6dHJ1ZX0sImZyZWVzdGFuZCI6ZmFsc2UsIm1hbnVhbHMiOiJEaXNhYmxlZCIsInNhZmUiOnRydWUsInN0YXRlX2NvbmRpdGlvbiI6IkNyb3VjaGluZyIsInRlYW1fc2VsZWN0IjoiRGlzYWJsZWQiLCJ0ZWFtcyI6MS4wLCJ0d2Vha3MiOlsiRXZhZGUgQmFja3N0YWIiLCJ+Il0sIn5mcmVlc3RhbmQiOnsiZGlzYWJsZSI6WyJ+Il19LCJ+c2FmZSI6eyJzYWZlX3NlbGVjdCI6WzEuMCwyLjAsIn4iXX19LCJtaXNjIjp7ImFzcGVjdCI6dHJ1ZSwiY29uc29sZV9sb2dzIjp0cnVlLCJjcm9zc2hhaXJfaW5kIjp0cnVlLCJmYWtlX2xhdGVuY3kiOnRydWUsImZhc3RfbGFkZGVyIjpmYWxzZSwibm90aWZpY2F0aW9ucyI6dHJ1ZSwib3B0aW1pemUiOmZhbHNlLCJzY29wZV9vdmVybGF5Ijp0cnVlLCJzaG90X3N0YXRpY3MiOnRydWUsInNrZWV0X2luZGljYXRvcnMiOnRydWUsInRyYXNodGFsayI6ZmFsc2UsInZpZXdtb2RlbCI6dHJ1ZSwid2FybmluZ3MiOnRydWUsIndhdGVybWFyayI6dHJ1ZSwifmFzcGVjdCI6eyJzbGlkZXIiOjEzMC4wfSwifmNyb3NzaGFpcl9pbmQiOnsiYWNjZW50X2NvbCI6IiNCRUE4QThGRiIsImJpbmRfYWRkIjpbIkRUIiwiRE1HIiwifiJdLCJiaW5kX2NvbCI6IiNGRkZGRkZGRiIsImdhcF9hZGQiOjIuMCwiaW5kX3NlbGVjdCI6Mi4wLCJzdGF0ZV9jb2wiOiIjQUJBQkFCRkYiLCJ0ZXh0X3NlbGVjdCI6IlZlbnNlbnNlIn0sIn5mYWtlX2xhdGVuY3kiOnsiYW1vdW50IjoxMTAuMH0sIn5ub3RpZmljYXRpb25zIjp7ImhpdF9jb2wiOiIjMDBGRjAwRkYiLCJtaXNzX2NvbCI6IiNGRjAwMDBGRiJ9LCJ+c2NvcGVfb3ZlcmxheSI6eyJjb2xvciI6IiNGRkZGRkY3NiIsImdhcCI6NS4wLCJpbnZlcnRlZCI6ZmFsc2UsInNpemUiOjc1LjB9LCJ+c2hvdF9zdGF0aWNzIjp7ImFjdGl2ZSI6WyJ+Il0sInBvc2l0aW9uIjoiVG9wIFJpZ2h0Iiwic2hvd19kYW1hZ2UiOnRydWUsInNob3dfaGVhZHNob3RzIjp0cnVlLCJzaG93X3JhdGlvIjp0cnVlfSwifnNrZWV0X2luZGljYXRvcnMiOnsiaW5kaWNhdG9yc19zZWwiOlsiRG91YmxlIFRhcCIsIkhpZGVzaG90cyIsIk1pbmltdW0gRGFtYWdlIiwiQm9keSBBaW0iLCJIaXRjaGFuY2UiLCJEb3JtYW50IEFpbWJvdCIsIlNhZmVwb2ludCIsIkZyZWVzdGFuZGluZyIsIkZha2UgRHVjayIsIlBpbmciLCJ+Il0sInBhZGRpbmciOjAuMH0sIn50cmFzaHRhbGsiOnsiZGVhdGgiOmZhbHNlLCJkZWxheSI6Mi4wfSwifnZpZXdtb2RlbCI6eyJmb3YiOjY4MC4wLCJ4b2ZmIjoyNS4wLCJ5b2ZmIjowLjAsInpvZmYiOi0xNS4wfSwifndhcm5pbmdzIjp7ImFjY2VudCI6IiNBQ0E1REFGRiIsImNvbmZpZ19wb3MiOjIuMCwiZGVmX3hfcGFkIjotOTIuMCwiZGVmX3lfcGFkIjotMjQ2LjAsImRlZmVuc2l2ZSI6dHJ1ZSwidmVsX3hfcGFkIjotOTIuMCwidmVsX3lfcGFkIjotMjkyLjAsInZlbG9jaXR5Ijp0cnVlfSwifndhdGVybWFyayI6eyJhY2NlbnRfY29sIjoiI0ZGNEY2NEZGIiwicG9zIjoiUmlnaHQifX19LHsic3RhdGVfYnVpbGRlciI6eyJlbGVtZW50cyI6eyJDVCI6W3siYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6MC4wLCJkZWxheV90aWNrc19hcnJheSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTMzLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6NDEuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjoyLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6MC4wLCJsZWZ0IjotMjUuMCwibGVmdF9mYWtlIjo2MC4wLCJtb2RfcmFuZG9taXplciI6MC4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwifiJdLCJyYW5kb21fZGVsYXkiOmZhbHNlLCJyYW5kb21pemVyIjowLjAsInJpZ2h0IjozMy4wLCJyaWdodF9mYWtlIjo2MC4wLCJzdGF0aWMiOjAuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjAuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0yNC4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjMwLjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6Mi4wLCJkZWxheV90aWNrc19hcnJheSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTMwLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6MzUuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjotMzIuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjIuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0yMC4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjI4LjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJBZGFwdGl2ZSIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjAuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0xMy4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjE5LjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6Mi4wLCJkZWxheV90aWNrc19hcnJheSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTE5LjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6NDUuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn1dLCJPRkYiOlt7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjIuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0xOC4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjQ1LjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6MC4wLCJkZWxheV90aWNrc19hcnJheSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTI1LjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6NDIuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjo0LjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6LTYuMCwibGVmdCI6LTE0LjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6MzcuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IlJhbmRvbSJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6Mi4wLCJkZWxheV90aWNrc19hcnJheSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTIyLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6MzMuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IlJhbmRvbSIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjEuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjotNy4wLCJsZWZ0IjotMjAuMCwibGVmdF9mYWtlIjo2MC4wLCJtb2RfcmFuZG9taXplciI6MzIuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6NS4wLCJyaWdodCI6MzMuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0Ijo3LjAsImJydXRlX3RvZ2dsZSI6dHJ1ZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjEuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOjEwLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIlJhbmRvbWl6ZSBKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjcuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjotNy4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjIuMCwiYnJ1dGVfdGltZW91dCI6OC4wLCJicnV0ZV90b2dnbGUiOnRydWUsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjoxLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6MC4wLCJsZWZ0IjotMTkuMCwibGVmdF9mYWtlIjo2MC4wLCJtb2RfcmFuZG9taXplciI6MC4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwiUmFuZG9taXplIEppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6NDMuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn1dLCJUIjpbeyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjowLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6MC4wLCJsZWZ0IjotMzMuMCwibGVmdF9mYWtlIjo2MC4wLCJtb2RfcmFuZG9taXplciI6MC4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwifiJdLCJyYW5kb21fZGVsYXkiOmZhbHNlLCJyYW5kb21pemVyIjoxLjAsInJpZ2h0Ijo0MS4wLCJyaWdodF9mYWtlIjo2MC4wLCJzdGF0aWMiOjAuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjIuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0yNS4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjMzLjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJBZGFwdGl2ZSIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjAuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0yNC4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOi0zMC4wLCJyaWdodCI6MzAuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IlNlcXVlbmNlZCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjIuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0zMC4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjM1LjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6LTMyLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjoyLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6MC4wLCJsZWZ0IjotMjAuMCwibGVmdF9mYWtlIjo2MC4wLCJtb2RfcmFuZG9taXplciI6MC4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwifiJdLCJyYW5kb21fZGVsYXkiOmZhbHNlLCJyYW5kb21pemVyIjo4LjAsInJpZ2h0IjoyOC4wLCJyaWdodF9mYWtlIjo2MC4wLCJzdGF0aWMiOjAuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjAuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0xMy4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjMwLjAsInJpZ2h0IjoxOS4wLCJyaWdodF9mYWtlIjo2MC4wLCJzdGF0aWMiOjAuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoyLjAsImJydXRlX3RpbWVvdXQiOjMuMCwiYnJ1dGVfdG9nZ2xlIjp0cnVlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6Mi4wLCJkZWxheV90aWNrc19hcnJheSI6WzEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTE5LjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6OC4wLCJyaWdodCI6NDUuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn1dfX19XQ==", 
        name = "Experimental"
    }, 
    [4] = {
        settings = "W3siYW50aWFpbSI6eyJhbmltcyI6ZmFsc2UsImRlZmVuc2l2ZV9zZXR0cyI6eyJjb25kaXRpb25zIjpbIkluIEFpciIsIkFpciBDcm91Y2giLCJ+Il0sImhpZGVzaG90cyI6dHJ1ZX0sImZyZWVzdGFuZCI6ZmFsc2UsIm1hbnVhbHMiOiJEaXNhYmxlZCIsInNhZmUiOnRydWUsInN0YXRlX2NvbmRpdGlvbiI6IkFpciBDcm91Y2giLCJ0ZWFtX3NlbGVjdCI6IkRpc2FibGVkIiwidGVhbXMiOjEuMCwidHdlYWtzIjpbIkV2YWRlIEJhY2tzdGFiIiwifiJdLCJ+ZnJlZXN0YW5kIjp7ImRpc2FibGUiOlsifiJdfSwifnNhZmUiOnsic2FmZV9zZWxlY3QiOlsxLjAsMi4wLCJ+Il19fSwibWlzYyI6eyJhc3BlY3QiOnRydWUsImNvbnNvbGVfbG9ncyI6dHJ1ZSwiY3Jvc3NoYWlyX2luZCI6dHJ1ZSwiZmFrZV9sYXRlbmN5Ijp0cnVlLCJmYXN0X2xhZGRlciI6ZmFsc2UsIm5vdGlmaWNhdGlvbnMiOnRydWUsIm9wdGltaXplIjp0cnVlLCJzY29wZV9vdmVybGF5Ijp0cnVlLCJzaG90X3N0YXRpY3MiOnRydWUsInNrZWV0X2luZGljYXRvcnMiOnRydWUsInRyYXNodGFsayI6ZmFsc2UsInZpZXdtb2RlbCI6dHJ1ZSwid2FybmluZ3MiOnRydWUsIndhdGVybWFyayI6dHJ1ZSwifmFzcGVjdCI6eyJzbGlkZXIiOjEzMC4wfSwifmNyb3NzaGFpcl9pbmQiOnsiYWNjZW50X2NvbCI6IiNCRUE4QThGRiIsImJpbmRfYWRkIjpbIkRUIiwiRE1HIiwifiJdLCJiaW5kX2NvbCI6IiNGRkZGRkZGRiIsImdhcF9hZGQiOjIuMCwiaW5kX3NlbGVjdCI6Mi4wLCJzdGF0ZV9jb2wiOiIjQUJBQkFCRkYiLCJ0ZXh0X3NlbGVjdCI6IlZlbnNlbnNlIn0sIn5mYWtlX2xhdGVuY3kiOnsiYW1vdW50IjoxMTAuMH0sIn5ub3RpZmljYXRpb25zIjp7ImhpdF9jb2wiOiIjMDBGRjAwRkYiLCJtaXNzX2NvbCI6IiNGRjAwMDBGRiJ9LCJ+c2NvcGVfb3ZlcmxheSI6eyJjb2xvciI6IiNGRkZGRkY3NiIsImdhcCI6NS4wLCJpbnZlcnRlZCI6ZmFsc2UsInNpemUiOjc1LjB9LCJ+c2hvdF9zdGF0aWNzIjp7ImFjdGl2ZSI6WyJ+Il0sInBvc2l0aW9uIjoiVG9wIFJpZ2h0Iiwic2hvd19kYW1hZ2UiOnRydWUsInNob3dfaGVhZHNob3RzIjp0cnVlLCJzaG93X3JhdGlvIjp0cnVlfSwifnNrZWV0X2luZGljYXRvcnMiOnsiaW5kaWNhdG9yc19zZWwiOlsiRG91YmxlIFRhcCIsIkhpZGVzaG90cyIsIk1pbmltdW0gRGFtYWdlIiwiQm9keSBBaW0iLCJIaXRjaGFuY2UiLCJEb3JtYW50IEFpbWJvdCIsIlNhZmVwb2ludCIsIkZyZWVzdGFuZGluZyIsIkZha2UgRHVjayIsIlBpbmciLCJ+Il0sInBhZGRpbmciOjAuMH0sIn50cmFzaHRhbGsiOnsiZGVhdGgiOmZhbHNlLCJkZWxheSI6Mi4wfSwifnZpZXdtb2RlbCI6eyJmb3YiOjY4MC4wLCJ4b2ZmIjoyNS4wLCJ5b2ZmIjowLjAsInpvZmYiOi0xNS4wfSwifndhcm5pbmdzIjp7ImFjY2VudCI6IiNBQ0E1REFGRiIsImNvbmZpZ19wb3MiOjIuMCwiZGVmX3hfcGFkIjotOTIuMCwiZGVmX3lfcGFkIjotMjkyLjAsImRlZmVuc2l2ZSI6dHJ1ZSwidmVsX3hfcGFkIjotOTIuMCwidmVsX3lfcGFkIjotMjkyLjAsInZlbG9jaXR5Ijp0cnVlfSwifndhdGVybWFyayI6eyJhY2NlbnRfY29sIjoiI0ZGNEY2NEZGIiwicG9zIjoiUmlnaHQifX19LHsic3RhdGVfYnVpbGRlciI6eyJlbGVtZW50cyI6eyJDVCI6W3siYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6MC4wLCJkZWxheV90aWNrc19hcnJheSI6WzMuMCw2LjAsNi4wLDUuMCw0LjAsMS4wLDUuMCw3LjAsMy4wLDIuMCw2LjAsMi4wLDMuMCw1LjAsNS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTMzLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6NDEuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjoyLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbOC4wLDIuMCw1LjAsMTAuMCw3LjAsOS4wLDIuMCwxMC4wLDkuMCwyLjAsMi4wLDUuMCwxMC4wLDEwLjAsMi4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTI1LjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6MzMuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjowLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMi4wLDcuMCw5LjAsMi4wLDMuMCw1LjAsOC4wLDcuMCw5LjAsMy4wLDYuMCwxLjAsOC4wLDkuMCwxLjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6MC4wLCJsZWZ0IjotMjQuMCwibGVmdF9mYWtlIjo2MC4wLCJtb2RfcmFuZG9taXplciI6MC4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwifiJdLCJyYW5kb21fZGVsYXkiOmZhbHNlLCJyYW5kb21pemVyIjowLjAsInJpZ2h0IjozMC4wLCJyaWdodF9mYWtlIjo2MC4wLCJzdGF0aWMiOjAuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjIuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsOC4wLDkuMCwzLjAsNy4wLDcuMCw4LjAsMTAuMCwyLjAsNy4wLDcuMCw2LjAsNS4wLDkuMCwxMC4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTMwLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6MzUuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjotMzIuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjIuMCwiZGVsYXlfdGlja3NfYXJyYXkiOls3LjAsMi4wLDMuMCw3LjAsNS4wLDcuMCw1LjAsNi4wLDguMCw5LjAsMS4wLDEwLjAsMy4wLDEwLjAsOC4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTIwLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6MjguMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkFkYXB0aXZlIiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6MC4wLCJkZWxheV90aWNrc19hcnJheSI6WzEuMCwyLjAsNi4wLDIuMCwxLjAsNy4wLDYuMCw1LjAsNy4wLDIuMCw3LjAsOC4wLDMuMCw0LjAsNS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTEzLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6MTkuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjoyLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMTAuMCw0LjAsNy4wLDIuMCw0LjAsNC4wLDQuMCw5LjAsMTAuMCw4LjAsMi4wLDEuMCwxLjAsMi4wLDguMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0xOS4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjQ1LjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9XSwiT0ZGIjpbeyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjoyLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbNi4wLDMuMCwxMC4wLDcuMCw0LjAsMS4wLDQuMCw5LjAsMy4wLDEuMCw0LjAsMi4wLDguMCw3LjAsNi4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTE4LjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6NDUuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo2LjAsImRlbGF5X3RpY2tzIjoxLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMS4wLDEuMCwzLjAsMi4wLDMuMCwyLjAsNS4wLDMuMCwxMC4wLDkuMCwyLjAsNS4wLDYuMCwyLjAsMi4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTI4LjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5Ijp0cnVlLCJyYW5kb21pemVyIjowLjAsInJpZ2h0Ijo0MS4wLCJyaWdodF9mYWtlIjo2MC4wLCJzdGF0aWMiOjAuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjQuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxMC4wLDcuMCw2LjAsOC4wLDIuMCw1LjAsNC4wLDIuMCwyLjAsMy4wLDYuMCwzLjAsOC4wLDcuMCw3LjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6LTYuMCwibGVmdCI6LTE0LjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6MzcuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IlJhbmRvbSJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NC4wLCJkZWxheV90aWNrcyI6Mi4wLCJkZWxheV90aWNrc19hcnJheSI6WzEuMCwzLjAsMi4wLDQuMCwxMC4wLDEuMCw5LjAsOC4wLDkuMCwzLjAsMi4wLDEwLjAsNy4wLDUuMCw4LjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6MC4wLCJsZWZ0IjotMjUuMCwibGVmdF9mYWtlIjo2MC4wLCJtb2RfcmFuZG9taXplciI6MC4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwifiJdLCJyYW5kb21fZGVsYXkiOnRydWUsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjQzLjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6Ni4wLCJkZWxheV90aWNrcyI6MS4wLCJkZWxheV90aWNrc19hcnJheSI6WzIuMCwzLjAsMi4wLDIuMCwxLjAsMS4wLDkuMCw4LjAsMi4wLDMuMCw2LjAsMS4wLDIuMCw4LjAsNS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOi03LjAsImxlZnQiOi0yMC4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjozMi4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwifiJdLCJyYW5kb21fZGVsYXkiOnRydWUsInJhbmRvbWl6ZXIiOjUuMCwicmlnaHQiOjQzLjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6Ny4wLCJicnV0ZV90b2dnbGUiOnRydWUsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50IjozLjAsImRlbGF5X3RpY2tzIjoxLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMi4wLDMuMCwxLjAsNy4wLDguMCwxMC4wLDcuMCwzLjAsNi4wLDYuMCwxLjAsOS4wLDkuMCw3LjAsMTAuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOjEwLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5Ijp0cnVlLCJyYW5kb21pemVyIjowLjAsInJpZ2h0Ijo3LjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6LTcuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoyLjAsImJydXRlX3RpbWVvdXQiOjguMCwiYnJ1dGVfdG9nZ2xlIjp0cnVlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJQdWxzZSIsImRlbGF5X3NsaWRlcnNfY291bnQiOjMuMCwiZGVsYXlfdGlja3MiOjEuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsxLjAsMi4wLDMuMCwyLjAsNC4wLDMuMCw2LjAsNC4wLDEuMCw5LjAsMTAuMCw4LjAsMy4wLDguMCw3LjBdLCJoaWRkZW5fYnVpbGQiOnRydWUsImhpZGRlbl9waXRjaCI6IlN3aXRjaCIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjo4OS4wLCJoaWRkZW5fcGl0Y2hfczIiOjM2LjAsImhpZGRlbl95YXciOiJBdXRvIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6ODkuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjg5LjAsImppdHRlciI6MC4wLCJsZWZ0IjotMTkuMCwibGVmdF9mYWtlIjo2MC4wLCJtb2RfcmFuZG9taXplciI6MC4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwifiJdLCJyYW5kb21fZGVsYXkiOnRydWUsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjQzLjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9XSwiVCI6W3siYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6MC4wLCJkZWxheV90aWNrc19hcnJheSI6WzEuMCw1LjAsNi4wLDguMCw3LjAsMy4wLDcuMCw5LjAsNC4wLDEwLjAsMTAuMCwyLjAsMS4wLDkuMCw2LjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6MC4wLCJsZWZ0IjotMzMuMCwibGVmdF9mYWtlIjo2MC4wLCJtb2RfcmFuZG9taXplciI6MC4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwifiJdLCJyYW5kb21fZGVsYXkiOmZhbHNlLCJyYW5kb21pemVyIjoxLjAsInJpZ2h0Ijo0MS4wLCJyaWdodF9mYWtlIjo2MC4wLCJzdGF0aWMiOjAuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjIuMCwiZGVsYXlfdGlja3NfYXJyYXkiOls4LjAsOC4wLDcuMCwxMC4wLDQuMCwzLjAsMy4wLDkuMCwxMC4wLDEwLjAsOC4wLDQuMCw0LjAsNC4wLDEuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0yNS4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjAuMCwicmlnaHQiOjMzLjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJBZGFwdGl2ZSIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjAuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlsyLjAsNC4wLDQuMCw1LjAsNC4wLDcuMCw3LjAsMi4wLDYuMCw1LjAsNC4wLDEwLjAsMi4wLDMuMCw3LjBdLCJoaWRkZW5fYnVpbGQiOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEb3duIiwiaGlkZGVuX3BpdGNoX2N1c3RvbSI6MC4wLCJoaWRkZW5fcGl0Y2hfczEiOjAuMCwiaGlkZGVuX3BpdGNoX3MyIjowLjAsImhpZGRlbl95YXciOiJTdGF0aWMiLCJoaWRkZW5feWF3X3NpZGV3YXlzIjowLjAsImhpZGRlbl95YXdfc3RhdGljIjowLjAsImppdHRlciI6MC4wLCJsZWZ0IjotMjQuMCwibGVmdF9mYWtlIjo2MC4wLCJtb2RfcmFuZG9taXplciI6MC4wLCJvcHRpb25zX2Zha2UiOlsiSml0dGVyIiwifiJdLCJyYW5kb21fZGVsYXkiOmZhbHNlLCJyYW5kb21pemVyIjotMzAuMCwicmlnaHQiOjMwLjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9LHsiYnJ1dGVfc3R5bGUiOjEuMCwiYnJ1dGVfdGltZW91dCI6MC4wLCJicnV0ZV90b2dnbGUiOmZhbHNlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJTZXF1ZW5jZWQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjoyLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbMTAuMCw0LjAsOS4wLDUuMCw4LjAsMy4wLDguMCw1LjAsMS4wLDkuMCwxLjAsOS4wLDEuMCwxLjAsNS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTMwLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6MC4wLCJyaWdodCI6MzUuMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjotMzIuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoxLjAsImJydXRlX3RpbWVvdXQiOjAuMCwiYnJ1dGVfdG9nZ2xlIjpmYWxzZSwiYnlhdyI6dHJ1ZSwiZGVsYXlfbWV0aG9kIjoiRGVmYXVsdCIsImRlbGF5X3NsaWRlcnNfY291bnQiOjUuMCwiZGVsYXlfdGlja3MiOjIuMCwiZGVsYXlfdGlja3NfYXJyYXkiOlszLjAsMS4wLDQuMCwxMC4wLDkuMCwxLjAsMTAuMCwxLjAsMy4wLDIuMCw2LjAsNS4wLDcuMCwxLjAsMS4wXSwiaGlkZGVuX2J1aWxkIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRG93biIsImhpZGRlbl9waXRjaF9jdXN0b20iOjAuMCwiaGlkZGVuX3BpdGNoX3MxIjowLjAsImhpZGRlbl9waXRjaF9zMiI6MC4wLCJoaWRkZW5feWF3IjoiU3RhdGljIiwiaGlkZGVuX3lhd19zaWRld2F5cyI6MC4wLCJoaWRkZW5feWF3X3N0YXRpYyI6MC4wLCJqaXR0ZXIiOjAuMCwibGVmdCI6LTIwLjAsImxlZnRfZmFrZSI6NjAuMCwibW9kX3JhbmRvbWl6ZXIiOjAuMCwib3B0aW9uc19mYWtlIjpbIkppdHRlciIsIn4iXSwicmFuZG9tX2RlbGF5IjpmYWxzZSwicmFuZG9taXplciI6OC4wLCJyaWdodCI6MjguMCwicmlnaHRfZmFrZSI6NjAuMCwic3RhdGljIjowLjAsInlhd19tZXRob2QiOiJMZWZ0L1JpZ2h0IiwieWF3bW9kX21ldGhvZCI6IkRpc2FibGVkIn0seyJicnV0ZV9zdHlsZSI6MS4wLCJicnV0ZV90aW1lb3V0IjowLjAsImJydXRlX3RvZ2dsZSI6ZmFsc2UsImJ5YXciOnRydWUsImRlbGF5X21ldGhvZCI6IkRlZmF1bHQiLCJkZWxheV9zbGlkZXJzX2NvdW50Ijo1LjAsImRlbGF5X3RpY2tzIjowLjAsImRlbGF5X3RpY2tzX2FycmF5IjpbOC4wLDYuMCwxLjAsMy4wLDEwLjAsOC4wLDQuMCw3LjAsOC4wLDIuMCw0LjAsMTAuMCw1LjAsMS4wLDkuMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0xMy4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjMwLjAsInJpZ2h0IjoxOS4wLCJyaWdodF9mYWtlIjo2MC4wLCJzdGF0aWMiOjAuMCwieWF3X21ldGhvZCI6IkxlZnQvUmlnaHQiLCJ5YXdtb2RfbWV0aG9kIjoiRGlzYWJsZWQifSx7ImJydXRlX3N0eWxlIjoyLjAsImJydXRlX3RpbWVvdXQiOjMuMCwiYnJ1dGVfdG9nZ2xlIjp0cnVlLCJieWF3Ijp0cnVlLCJkZWxheV9tZXRob2QiOiJEZWZhdWx0IiwiZGVsYXlfc2xpZGVyc19jb3VudCI6NS4wLCJkZWxheV90aWNrcyI6Mi4wLCJkZWxheV90aWNrc19hcnJheSI6WzQuMCwzLjAsMi4wLDMuMCwzLjAsMTAuMCw3LjAsMi4wLDguMCw5LjAsOC4wLDYuMCwzLjAsMi4wLDguMF0sImhpZGRlbl9idWlsZCI6ZmFsc2UsImhpZGRlbl9waXRjaCI6IkRvd24iLCJoaWRkZW5fcGl0Y2hfY3VzdG9tIjowLjAsImhpZGRlbl9waXRjaF9zMSI6MC4wLCJoaWRkZW5fcGl0Y2hfczIiOjAuMCwiaGlkZGVuX3lhdyI6IlN0YXRpYyIsImhpZGRlbl95YXdfc2lkZXdheXMiOjAuMCwiaGlkZGVuX3lhd19zdGF0aWMiOjAuMCwiaml0dGVyIjowLjAsImxlZnQiOi0xOS4wLCJsZWZ0X2Zha2UiOjYwLjAsIm1vZF9yYW5kb21pemVyIjowLjAsIm9wdGlvbnNfZmFrZSI6WyJKaXR0ZXIiLCJ+Il0sInJhbmRvbV9kZWxheSI6ZmFsc2UsInJhbmRvbWl6ZXIiOjguMCwicmlnaHQiOjQ1LjAsInJpZ2h0X2Zha2UiOjYwLjAsInN0YXRpYyI6MC4wLCJ5YXdfbWV0aG9kIjoiTGVmdC9SaWdodCIsInlhd21vZF9tZXRob2QiOiJEaXNhYmxlZCJ9XX19fV0=", 
        name = "Breaker"
    }, 
    [5] = {
        settings = "", 
        name = "---------------------------------------"
    }
};
configs_db = db.stormzconfigs5 or {};
configs_db.cfg_list = configs_db.cfg_list or {};
configs_db.menu_list = configs_db.menu_list or {};
(function()
    -- upvalues: v465 (ref)
    if #configs_db.cfg_list == 0 then
        for _, v467 in ipairs(v465) do
            table.insert(configs_db.cfg_list, {
                [1] = v467.name, 
                [2] = v467.settings
            });
            table.insert(configs_db.menu_list, v467.name);
        end;
    end;
end)();
local v468 = v6.home.config:list("", configs_db.menu_list);
local v469 = v1.pui.setup({
    [1] = v35, 
    [2] = v463
}, true);
v464.save_config = function(v470)
    -- upvalues: v469 (ref), v1 (ref)
    cvar.play:call("ambient\\tones\\elev1");
    local v471 = v469:save();
    configs_db.cfg_list[v470][2] = v1.base64.encode(json.stringify(v471));
    db.stormzconfigs5 = configs_db;
end;
v464.update_values = function(v472)
    local v473 = configs_db.cfg_list[v472][1] .. "\a" .. ui.get_style("Link Active"):to_hex() .. " - Active";
    for v474, v475 in ipairs(configs_db.cfg_list) do
        configs_db.menu_list[v474] = v475[1];
    end;
    configs_db.menu_list[v472] = v473;
end;
v464.create_config = function(v476)
    -- upvalues: v469 (ref), v1 (ref)
    if type(v476) ~= "string" then
        return;
    elseif v476 == nil or v476 == "" or v476 == " " then
        return;
    else
        for v477 = #configs_db.menu_list, 1, -1 do
            if configs_db.menu_list[v477] == v476 then
                return;
            end;
        end;
        if #configs_db.cfg_list > 15 then
            return;
        else
            local v478 = v469:save();
            local v479 = {
                v476, 
                v1.base64.encode(json.stringify(v478))
            };
            table.insert(configs_db.cfg_list, v479);
            table.insert(configs_db.menu_list, v476);
            db.stormzconfigs5 = configs_db;
            cvar.play:call("ambient\\tones\\elev1");
            return;
        end;
    end;
end;
v464.remove_config = function(v480)
    -- upvalues: v465 (ref)
    local v481 = false;
    for _, v483 in ipairs(v465) do
        if configs_db.cfg_list[v480][1] == v483.name then
            v481 = true;
            break;
        end;
    end;
    if v481 then
        return;
    else
        local v484 = configs_db.cfg_list[v480][1];
        for v485 = #configs_db.cfg_list, 1, -1 do
            if configs_db.cfg_list[v485][1] == v484 then
                table.remove(configs_db.cfg_list, v485);
                table.remove(configs_db.menu_list, v485);
            end;
        end;
        db.stormzconfigs5 = configs_db;
        return;
    end;
end;
v464.load_config = function(v486)
    -- upvalues: v469 (ref), v1 (ref)
    if configs_db.cfg_list[v486][2] == nil or configs_db.cfg_list[v486][2] == "" then
        common.add_notify("Vensense", "Please save the config");
        print(string.format("Error[data_base[%s]]", v486));
        return;
    elseif #configs_db.cfg_list < v486 then
        print(string.format("Error[data_base[%s]]", v486));
        return;
    else
        v469:load(json.parse(v1.base64.decode(configs_db.cfg_list[v486][2])));
        cvar.play:call("ambient\\tones\\elev1");
        return;
    end;
end;
configs = {
    load = v6.home.config:button("\f<check> Load ", function()
        -- upvalues: v464 (ref), v468 (ref), v165 (ref)
        v464.update_values(v468:get());
        v464.load_config(v468:get());
        v468:update(configs_db.menu_list);
        v165("Loaded " .. tostring(v468:get()), false);
    end, true), 
    save = v6.home.config:button("\f<floppy-disk> Save", function()
        -- upvalues: v464 (ref), v468 (ref)
        v464.save_config(v468:get());
    end, true), 
    remove = v6.home.config:button("\f<trash-xmark> Delete", function()
        -- upvalues: v464 (ref), v468 (ref)
        v464.remove_config(v468:get());
        v468:update(configs_db.menu_list);
    end, true), 
    export = v6.home.config:button("\f<share-nodes> Export", function()
        -- upvalues: v1 (ref), v469 (ref)
        v1.clipboard.set(v1.base64.encode(json.stringify(v469:save())));
        cvar.play:call("ambient\\tones\\elev1");
    end, true), 
    name = v6.home.config_make:input("Preset Name", "New Config"), 
    create = v6.home.config_make:button("     \f<layer-group> Create New      ", function()
        -- upvalues: v464 (ref), v468 (ref)
        v464.create_config(configs.name:get());
        v468:update(configs_db.menu_list);
    end, true), 
    import = v6.home.config_make:button("   \f<download>  Import   ", function()
        -- upvalues: v469 (ref), v1 (ref)
        v469:load(json.parse(v1.base64.decode(v1.clipboard.get())));
        cvar.play:call("ambient\\tones\\elev1");
    end, true)
};
events.render(function()
    -- upvalues: v468 (ref)
    if v468:get() == 1 or v468:get() == 2 or v468:get() == 3 or v468:get() == 4 then
        configs.load:disabled(false);
        configs.save:disabled(true);
        configs.remove:disabled(true);
        configs.export:disabled(true);
    elseif v468:get() == 5 then
        configs.load:disabled(true);
        configs.save:disabled(true);
        configs.remove:disabled(true);
        configs.export:disabled(true);
    else
        configs.load:disabled(false);
        configs.save:disabled(false);
        configs.remove:disabled(false);
        configs.export:disabled(false);
    end;
end);