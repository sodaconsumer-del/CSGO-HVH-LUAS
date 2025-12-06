ui.sidebar("Fragment", ui.get_icon("sparkles"));
local v0 = "2.0";
local v1 = "[Recode]";
files.create_folder("nl\\fragment");
files.first_config = "nl\\fragment" .. "\\1.txt";
files.second_config = "nl\\fragment" .. "\\2.txt";
files.third_config = "nl\\fragment" .. "\\3.txt";
files.safe_head = "nl\\fragment" .. "\\safe_head.txt";
files.aggressive = "nl\\fragment" .. "\\aggressive.txt";
files.lua_owner = "nl\\fragment" .. "\\ausserkontrolle.txt";
local l_gradient_0 = require("neverlose/gradient");
local l_mtools_0 = require("neverlose/mtools");
local _ = require("neverlose/animations");
local l_exploits_0 = require("neverlose/exploits");
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
l_mtools_0.Network.Download("https://github.com/739ausserkontrolle/fragment/raw/refs/heads/main/smallest_pixel-7.ttf", "nl\\fragment\\Smallest Pixel-7.ttf", true, 97);
l_mtools_0.Network.Download("https://github.com/739ausserkontrolle/fragment/raw/refs/heads/main/verdanab.ttf", "nl\\fragment\\Verdana Bold.ttf", true, 97);
common.add_notify("Fragment.lua " .. v0 .. " " .. v1, "Welcome, " .. common.get_username());
local v8 = {
    colors = {
        main = "\a{Link Active}", 
        default = "\aDEFAULT"
    }, 
    antiaim = {
        pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
        yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
        yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
        yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
        yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
        modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
        body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
        inventer = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
        left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
        right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
        options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
        body_yaw_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
    }, 
    binds = {
        doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
        hideshots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
        fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
        slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
        bodyaim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
        safepoint = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
        slowmotion = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
        autopeek = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
        override_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
    }, 
    other = {
        legs = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
        avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
        hidden_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
        lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
        fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency")
    }, 
    killsay_phrases = {
        [1] = "hdf u are dead", 
        [2] = "Time to uninstall bot", 
        [3] = "1 hhhh", 
        [4] = "\216\167\216\181\217\133\216\170\216\140 \216\167\217\132\216\163\216\180\216\168\216\167\216\173 \217\132\216\167 \216\170\216\170\216\173\216\175\216\171", 
        [5] = "l2p", 
        [6] = "'settings > game > TurnOnInstructorMessages' This might help you", 
        [7] = "\217\135\217\132 \217\129\217\131\216\177\216\170 \217\129\217\138 \216\165\216\178\216\167\217\132\216\169 \217\135\216\176\217\135 \216\167\217\132\217\132\216\185\216\168\216\169\216\159", 
        [8] = "if you want play against your level then click in menu 'Play offline with bots'", 
        [9] = "\216\163\217\131\216\177\217\135 \216\167\217\132\216\177\217\136\216\168\217\136\216\170\216\167\216\170 \216\167\217\132\217\133\216\170\216\173\216\177\217\131\216\169 \217\129\217\138 \217\132\216\185\216\168\216\170\217\138", 
        [10] = "Always *dead*? Just buy Fragment.lua", 
        [11] = "Maybe next time, you will have more luck", 
        [12] = "Free hvh tutorial 2025 - www.youtube.com/@739ausserkontrolle", 
        [13] = "2025 \217\131\216\167\216\177\216\168\217\134\216\170\216\177 \216\173\216\167\217\136\217\132 \217\130\216\170\217\132\217\138\216\159 \217\133\216\182\216\173\217\131", 
        [14] = "gs crack user dominated", 
        [15] = "You can`t kill hvh king $$", 
        [16] = "\216\177\217\136\216\168\217\136\216\170 \217\132\216\185\217\138\217\134", 
        [17] = "By Fragment.lua technologies"
    }, 
    on_death_phrases = {
        [1] = "lucky bot hhhh", 
        [2] = "You`re so bad", 
        [3] = "\217\138\216\167 \217\132\217\135 \217\133\217\134 \216\177\217\136\216\168\217\136\216\170 \217\133\216\172\217\134\217\136\217\134 \217\133\216\173\216\184\217\136\216\184.", 
        [4] = "Delete this game please", 
        [5] = "\217\132\216\167 \216\170\217\132\216\185\216\168 \217\135\216\176\217\135 \216\167\217\132\217\132\216\185\216\168\216\169 \217\133\216\177\216\169 \216\163\216\174\216\177\217\137 \217\129\216\163\217\134\216\170 \216\177\217\136\216\168\217\136\216\170 \216\179\217\138\216\161 \217\132\217\132\216\186\216\167\217\138\216\169 \217\136\216\185\216\175\217\138\217\133 \216\167\217\132\217\129\216\167\216\166\216\175\216\169", 
        [6] = "In the end you killed me, but I forgot that we were playing", 
        [7] = "Good job walkbots are getting better and better", 
        [8] = "200 hours in the last two weeks hhh", 
        [9] = "\217\132\217\130\216\175 \217\130\216\170\217\132\216\170\217\134\217\138 \217\129\217\138 \216\167\217\132\217\133\216\177\216\169 \216\167\217\132\216\163\217\136\217\132\217\137. \216\163\216\173\216\179\217\134\216\170 \216\181\217\134\216\185\216\167\217\139 \216\163\217\138\217\135\216\167 \216\167\217\132\217\133\216\185\216\172\216\168", 
        [10] = "Never play this game again fucking walkbot", 
        [11] = "\217\135\216\167\217\135\216\167\217\135\216\167\217\135\216\167\217\135\216\167\217\135\216\167\217\135\216\167\217\135\216\167\217\135\216\167\217\135\216\167\217\135\216\167\217\135\216\167\217\135\216\167\217\135\216\167", 
        [12] = "You are playing this game for 3 years and still praying and peeking hhhh"
    }
};
local v9 = {
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
local v10 = {
    ["backtrack failure"] = "lagcomp failure", 
    ["player death"] = "target death", 
    correction = "resolver"
};
icons = {};
local _ = {};
local v12 = nil;
v12 = {};
local v13 = {};
do
    local l_v13_0 = v13;
    v12.get = function(v15)
        -- upvalues: l_v13_0 (ref), v8 (ref)
        local v16 = l_v13_0[v15];
        if v16 == nil then
            v16 = v8.colors.main .. ui.get_icon(v15) .. v8.colors.default;
            l_v13_0[v15] = v16;
        end;
        return v16;
    end;
end;
local v17 = ui.create(v12.get("sparkles") .. "  Fragment.lua"):list("", v12.get("user-gear") .. "  Information", v12.get("shield") .. "   Anti-Aim", v12.get("screwdriver-wrench") .. "   Miscellaneous", v12.get("folder") .. "   Config System");
local v18 = ui.create(v12.get("house-blank") .. "  Information");
local v19 = ui.create(v12.get("user-plus") .. "  Anti-Aim Additions");
local v20 = ui.create(v12.get("shield") .. "  Anti-Aim Builder");
local v21 = ui.create(v12.get("user-shield") .. "  Defensive Anti-Aim");
local v22 = ui.create(v12.get("image") .. "  Render");
local v23 = ui.create(v12.get("screwdriver-wrench") .. "  Miscellaneous");
local v24 = ui.create(v12.get("paint-roller") .. "  Visuals");
local v25 = ui.create(v12.get("folder") .. "  Config System");
local _ = v18:label(v12.get("user") .. "   " .. common.get_username() .. "");
local _ = v18:label(v12.get("code-merge") .. "   " .. v0 .. " " .. v1 .. " Early Version");
local _ = v18:label(v12.get("folder") .. "   Configs");
local _ = v18:button(v12.get("file") .. " Config", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=0CYNeg");
end, true);
local _ = v18:button(v12.get("palette") .. " Theme", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/getitem?c=L4qI98g55rgdPypa-uQmMJf2UU_");
end, true);
local _ = v18:label(v12.get("sparkles") .. "   Fragment");
local _ = v18:button(v12.get("discord") .. " Discord", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/9CpRBQ37Vw");
end, true);
local _ = v18:button(v12.get("youtube") .. " Youtube", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@739ausserkontrolle");
end, true);
local v34 = v19:combo(v12.get("rocket") .. "  Jump Animation", {
    [1] = "Select", 
    [2] = "Static", 
    [3] = "Jitter"
});
local v35 = v19:combo(v12.get("person-running") .. "  Move Animation", {
    [1] = "Select", 
    [2] = "Static", 
    [3] = "Jitter", 
    [4] = "Allah"
});
local v36 = v19:selectable(v12.get("plane-arrival") .. "  Other Anims", {
    [1] = "Pitch 0", 
    [2] = "Freeze On Duck", 
    [3] = "Freeze On Slowmotion"
});
local v37 = v19:combo(v12.get("knife-kitchen") .. "  Avoid Backstab", {
    [1] = "Off", 
    [2] = "On"
});
anti_aim_defensive_on = v21:switch(v12.get("shield-plus") .. "  Defensive Anti-Aim");
anti_aim_defensive_on_gear = anti_aim_defensive_on:create();
anti_aim_defensive_always_on = anti_aim_defensive_on_gear:switch(v12.get("squarespace") .. "  Always On");
anti_aim_defensive_stand = v21:switch(v12.get("person") .. "  Stand");
anti_aim_defensive_stand_gear = anti_aim_defensive_stand:create();
anti_aim_defensive_stand_selection = anti_aim_defensive_stand_gear:combo(v12.get("sliders") .. "  Selection", {
    [1] = "Pitch", 
    [2] = "Yaw"
});
anti_aim_defensive_stand_selection_pitch = anti_aim_defensive_stand_gear:combo(v12.get("arrows-to-line") .. "  Pitch Mode", {
    [1] = "Switch", 
    [2] = "Random"
});
anti_aim_defensive_stand_selection_pitch_sideways_pitch = anti_aim_defensive_stand_gear:slider(v12.get("arrows-left-right") .. "  Value:", -89, 89, 0);
anti_aim_defensive_stand_selection_pitch_switch_pitch_first = anti_aim_defensive_stand_gear:slider(v12.get("arrows-repeat") .. "  First Value:", -89, 89, 0);
anti_aim_defensive_stand_selection_pitch_switch_pitch_second = anti_aim_defensive_stand_gear:slider(v12.get("arrows-repeat-1") .. "  Second Value:", -89, 89, 0);
anti_aim_defensive_stand_selection_pitch_switch_pitch_delay = anti_aim_defensive_stand_gear:slider(v12.get("clock") .. "  Speed:", 7, 13, 7);
anti_aim_defensive_stand_selection_pitch_random_from = anti_aim_defensive_stand_gear:slider(v12.get("arrow-rotate-left") .. "  From:", -89, 89, 0);
anti_aim_defensive_stand_selection_pitch_random_to = anti_aim_defensive_stand_gear:slider(v12.get("arrow-rotate-right") .. "  To:", -89, 89, 0);
anti_aim_defensive_stand_selection_yaw = anti_aim_defensive_stand_gear:combo(v12.get("arrows-turn-to-dots") .. "  Yaw Mode", {
    [1] = "Sideways", 
    [2] = "Spin", 
    [3] = "Random", 
    [4] = "Neverlose", 
    [5] = "Static"
});
anti_aim_defensive_stand_selection_yaw_sideways = anti_aim_defensive_stand_gear:slider(v12.get("arrows-left-right") .. "  Value:", -180, 180, 0);
anti_aim_defensive_stand_selection_yaw_spin_range = anti_aim_defensive_stand_gear:slider(v12.get("arrows-rotate") .. "  Range:", 1, 180, 0);
anti_aim_defensive_stand_selection_yaw_spin_speed = anti_aim_defensive_stand_gear:slider(v12.get("gauge-simple-high") .. "  Speed:", 1, 5, 1);
anti_aim_defensive_stand_selection_yaw_random_from = anti_aim_defensive_stand_gear:slider(v12.get("arrow-rotate-left") .. "  From:", -180, 180, 0);
anti_aim_defensive_stand_selection_yaw_random_to = anti_aim_defensive_stand_gear:slider(v12.get("arrow-rotate-right") .. "  To:", -180, 180, 0);
anti_aim_defensive_stand_selection_yaw_static = anti_aim_defensive_stand_gear:slider(v12.get("arrows-spin") .. "  Static Value:", -180, 180, 0);
anti_aim_defensive_move = v21:switch(v12.get("person-running") .. "  Move");
anti_aim_defensive_move_gear = anti_aim_defensive_move:create();
anti_aim_defensive_move_selection = anti_aim_defensive_move_gear:combo(v12.get("sliders") .. "  Selection", {
    [1] = "Pitch", 
    [2] = "Yaw"
});
anti_aim_defensive_move_selection_pitch = anti_aim_defensive_move_gear:combo(v12.get("arrows-to-line") .. "  Pitch Mode", {
    [1] = "Switch", 
    [2] = "Random"
});
anti_aim_defensive_move_selection_pitch_sideways_pitch = anti_aim_defensive_move_gear:slider(v12.get("arrows-left-right") .. "  Value:", -89, 89, 0);
anti_aim_defensive_move_selection_pitch_switch_pitch_first = anti_aim_defensive_move_gear:slider(v12.get("arrows-repeat") .. "  First Value:", -89, 89, 0);
anti_aim_defensive_move_selection_pitch_switch_pitch_second = anti_aim_defensive_move_gear:slider(v12.get("arrows-repeat-1") .. "  Second Value:", -89, 89, 0);
anti_aim_defensive_move_selection_pitch_switch_pitch_delay = anti_aim_defensive_move_gear:slider(v12.get("clock") .. "  Speed:", 7, 13, 7);
anti_aim_defensive_move_selection_pitch_random_from = anti_aim_defensive_move_gear:slider(v12.get("arrow-rotate-left") .. "  From:", -89, 89, 0);
anti_aim_defensive_move_selection_pitch_random_to = anti_aim_defensive_move_gear:slider(v12.get("arrow-rotate-right") .. "  To:", -89, 89, 0);
anti_aim_defensive_move_selection_yaw = anti_aim_defensive_move_gear:combo(v12.get("arrows-turn-to-dots") .. "  Yaw Mode", {
    [1] = "Sideways", 
    [2] = "Spin", 
    [3] = "Random", 
    [4] = "Neverlose", 
    [5] = "Static"
});
anti_aim_defensive_move_selection_yaw_sideways = anti_aim_defensive_move_gear:slider(v12.get("arrows-left-right") .. "  Value:", -180, 180, 0);
anti_aim_defensive_move_selection_yaw_spin_range = anti_aim_defensive_move_gear:slider(v12.get("arrows-rotate") .. "  Range:", 1, 180, 0);
anti_aim_defensive_move_selection_yaw_spin_speed = anti_aim_defensive_move_gear:slider(v12.get("gauge-simple-high") .. "  Speed:", 1, 5, 1);
anti_aim_defensive_move_selection_yaw_random_from = anti_aim_defensive_move_gear:slider(v12.get("arrow-rotate-left") .. "  From:", -180, 180, 0);
anti_aim_defensive_move_selection_yaw_random_to = anti_aim_defensive_move_gear:slider(v12.get("arrow-rotate-right") .. "  To:", -180, 180, 0);
anti_aim_defensive_move_selection_yaw_static = anti_aim_defensive_move_gear:slider(v12.get("arrows-spin") .. "  Static Value:", -180, 180, 0);
anti_aim_defensive_slowmotion = v21:switch(v12.get("person-walking") .. "  Slowmotion");
anti_aim_defensive_slowmotion_gear = anti_aim_defensive_slowmotion:create();
anti_aim_defensive_slowmotion_selection = anti_aim_defensive_slowmotion_gear:combo(v12.get("sliders") .. "  Selection", {
    [1] = "Pitch", 
    [2] = "Yaw"
});
anti_aim_defensive_slowmotion_selection_pitch = anti_aim_defensive_slowmotion_gear:combo(v12.get("arrows-to-line") .. "  Pitch Mode", {
    [1] = "Switch", 
    [2] = "Random"
});
anti_aim_defensive_slowmotion_selection_pitch_sideways_pitch = anti_aim_defensive_slowmotion_gear:slider(v12.get("arrows-left-right") .. "  Value:", -89, 89, 0);
anti_aim_defensive_slowmotion_selection_pitch_switch_pitch_first = anti_aim_defensive_slowmotion_gear:slider(v12.get("arrows-repeat") .. "  First Value:", -89, 89, 0);
anti_aim_defensive_slowmotion_selection_pitch_switch_pitch_second = anti_aim_defensive_slowmotion_gear:slider(v12.get("arrows-repeat-1") .. "  Second Value:", -89, 89, 0);
anti_aim_defensive_slowmotion_selection_pitch_switch_pitch_delay = anti_aim_defensive_slowmotion_gear:slider(v12.get("clock") .. "  Speed:", 7, 13, 7);
anti_aim_defensive_slowmotion_selection_pitch_random_from = anti_aim_defensive_slowmotion_gear:slider(v12.get("arrow-rotate-left") .. "  From:", -89, 89, 0);
anti_aim_defensive_slowmotion_selection_pitch_random_to = anti_aim_defensive_slowmotion_gear:slider(v12.get("arrow-rotate-right") .. "  To:", -89, 89, 0);
anti_aim_defensive_slowmotion_selection_yaw = anti_aim_defensive_slowmotion_gear:combo(v12.get("arrows-turn-to-dots") .. "  Yaw Mode", {
    [1] = "Sideways", 
    [2] = "Spin", 
    [3] = "Random", 
    [4] = "Neverlose", 
    [5] = "Static"
});
anti_aim_defensive_slowmotion_selection_yaw_sideways = anti_aim_defensive_slowmotion_gear:slider(v12.get("arrows-left-right") .. "  Value:", -180, 180, 0);
anti_aim_defensive_slowmotion_selection_yaw_spin_range = anti_aim_defensive_slowmotion_gear:slider(v12.get("arrows-rotate") .. "  Range:", 1, 180, 0);
anti_aim_defensive_slowmotion_selection_yaw_spin_speed = anti_aim_defensive_slowmotion_gear:slider(v12.get("gauge-simple-high") .. "  Speed:", 1, 5, 1);
anti_aim_defensive_slowmotion_selection_yaw_random_from = anti_aim_defensive_slowmotion_gear:slider(v12.get("arrow-rotate-left") .. "  From:", -180, 180, 0);
anti_aim_defensive_slowmotion_selection_yaw_random_to = anti_aim_defensive_slowmotion_gear:slider(v12.get("arrow-rotate-right") .. "  To:", -180, 180, 0);
anti_aim_defensive_slowmotion_selection_yaw_static = anti_aim_defensive_slowmotion_gear:slider(v12.get("arrows-spin") .. "  Static Value:", -180, 180, 0);
anti_aim_defensive_crouch = v21:switch(v12.get("person-praying") .. "  Crouch");
anti_aim_defensive_crouch_gear = anti_aim_defensive_crouch:create();
anti_aim_defensive_crouch_selection = anti_aim_defensive_crouch_gear:combo(v12.get("sliders") .. "  Selection", {
    [1] = "Pitch", 
    [2] = "Yaw"
});
anti_aim_defensive_crouch_selection_pitch = anti_aim_defensive_crouch_gear:combo(v12.get("arrows-to-line") .. "  Pitch Mode", {
    [1] = "Switch", 
    [2] = "Random"
});
anti_aim_defensive_crouch_selection_pitch_sideways_pitch = anti_aim_defensive_crouch_gear:slider(v12.get("arrows-left-right") .. "  Value:", -89, 89, 0);
anti_aim_defensive_crouch_selection_pitch_switch_pitch_first = anti_aim_defensive_crouch_gear:slider(v12.get("arrows-repeat") .. "  First Value:", -89, 89, 0);
anti_aim_defensive_crouch_selection_pitch_switch_pitch_second = anti_aim_defensive_crouch_gear:slider(v12.get("arrows-repeat-1") .. "  Second Value:", -89, 89, 0);
anti_aim_defensive_crouch_selection_pitch_switch_pitch_delay = anti_aim_defensive_crouch_gear:slider(v12.get("clock") .. "  Speed:", 7, 13, 7);
anti_aim_defensive_crouch_selection_pitch_random_from = anti_aim_defensive_crouch_gear:slider(v12.get("arrow-rotate-left") .. "  From:", -89, 89, 0);
anti_aim_defensive_crouch_selection_pitch_random_to = anti_aim_defensive_crouch_gear:slider(v12.get("arrow-rotate-right") .. "  To:", -89, 89, 0);
anti_aim_defensive_crouch_selection_yaw = anti_aim_defensive_crouch_gear:combo(v12.get("arrows-turn-to-dots") .. "  Yaw Mode", {
    [1] = "Sideways", 
    [2] = "Spin", 
    [3] = "Random", 
    [4] = "Neverlose", 
    [5] = "Static"
});
anti_aim_defensive_crouch_selection_yaw_sideways = anti_aim_defensive_crouch_gear:slider(v12.get("arrows-left-right") .. "  Value:", -180, 180, 0);
anti_aim_defensive_crouch_selection_yaw_spin_range = anti_aim_defensive_crouch_gear:slider(v12.get("arrows-rotate") .. "  Range:", 1, 180, 0);
anti_aim_defensive_crouch_selection_yaw_spin_speed = anti_aim_defensive_crouch_gear:slider(v12.get("gauge-simple-high") .. "  Speed:", 1, 5, 1);
anti_aim_defensive_crouch_selection_yaw_random_from = anti_aim_defensive_crouch_gear:slider(v12.get("arrow-rotate-left") .. "  From:", -180, 180, 0);
anti_aim_defensive_crouch_selection_yaw_random_to = anti_aim_defensive_crouch_gear:slider(v12.get("arrow-rotate-right") .. "  To:", -180, 180, 0);
anti_aim_defensive_crouch_selection_yaw_static = anti_aim_defensive_crouch_gear:slider(v12.get("arrows-spin") .. "  Static Value:", -180, 180, 0);
anti_aim_defensive_sneak = v21:switch(v12.get("person-sledding") .. "  Sneak");
anti_aim_defensive_sneak_gear = anti_aim_defensive_sneak:create();
anti_aim_defensive_sneak_selection = anti_aim_defensive_sneak_gear:combo(v12.get("sliders") .. "  Selection", {
    [1] = "Pitch", 
    [2] = "Yaw"
});
anti_aim_defensive_sneak_selection_pitch = anti_aim_defensive_sneak_gear:combo(v12.get("arrows-to-line") .. "  Pitch Mode", {
    [1] = "Switch", 
    [2] = "Random"
});
anti_aim_defensive_sneak_selection_pitch_sideways_pitch = anti_aim_defensive_sneak_gear:slider(v12.get("arrows-left-right") .. "  Value:", -89, 89, 0);
anti_aim_defensive_sneak_selection_pitch_switch_pitch_first = anti_aim_defensive_sneak_gear:slider(v12.get("arrows-repeat") .. "  First Value:", -89, 89, 0);
anti_aim_defensive_sneak_selection_pitch_switch_pitch_second = anti_aim_defensive_sneak_gear:slider(v12.get("arrows-repeat-1") .. "  Second Value:", -89, 89, 0);
anti_aim_defensive_sneak_selection_pitch_switch_pitch_delay = anti_aim_defensive_sneak_gear:slider(v12.get("clock") .. "  Speed:", 7, 13, 7);
anti_aim_defensive_sneak_selection_pitch_random_from = anti_aim_defensive_sneak_gear:slider(v12.get("arrow-rotate-left") .. "  From:", -89, 89, 0);
anti_aim_defensive_sneak_selection_pitch_random_to = anti_aim_defensive_sneak_gear:slider(v12.get("arrow-rotate-right") .. "  To:", -89, 89, 0);
anti_aim_defensive_sneak_selection_yaw = anti_aim_defensive_sneak_gear:combo(v12.get("arrows-turn-to-dots") .. "  Yaw Mode", {
    [1] = "Sideways", 
    [2] = "Spin", 
    [3] = "Random", 
    [4] = "Neverlose", 
    [5] = "Static"
});
anti_aim_defensive_sneak_selection_yaw_sideways = anti_aim_defensive_sneak_gear:slider(v12.get("arrows-left-right") .. "  Value:", -180, 180, 0);
anti_aim_defensive_sneak_selection_yaw_spin_range = anti_aim_defensive_sneak_gear:slider(v12.get("arrows-rotate") .. "  Range:", 1, 180, 0);
anti_aim_defensive_sneak_selection_yaw_spin_speed = anti_aim_defensive_sneak_gear:slider(v12.get("gauge-simple-high") .. "  Speed:", 1, 5, 1);
anti_aim_defensive_sneak_selection_yaw_random_from = anti_aim_defensive_sneak_gear:slider(v12.get("arrow-rotate-left") .. "  From:", -180, 180, 0);
anti_aim_defensive_sneak_selection_yaw_random_to = anti_aim_defensive_sneak_gear:slider(v12.get("arrow-rotate-right") .. "  To:", -180, 180, 0);
anti_aim_defensive_sneak_selection_yaw_static = anti_aim_defensive_sneak_gear:slider(v12.get("arrows-spin") .. "  Static Value:", -180, 180, 0);
anti_aim_defensive_inair = v21:switch(v12.get("person-ski-jumping") .. "  In-Air");
anti_aim_defensive_inair_gear = anti_aim_defensive_inair:create();
anti_aim_defensive_inair_selection = anti_aim_defensive_inair_gear:combo(v12.get("sliders") .. "  Selection", {
    [1] = "Pitch", 
    [2] = "Yaw"
});
anti_aim_defensive_inair_selection_pitch = anti_aim_defensive_inair_gear:combo(v12.get("arrows-to-line") .. "  Pitch Mode", {
    [1] = "Switch", 
    [2] = "Random"
});
anti_aim_defensive_inair_selection_pitch_sideways_pitch = anti_aim_defensive_inair_gear:slider(v12.get("arrows-left-right") .. "  Value:", -89, 89, 0);
anti_aim_defensive_inair_selection_pitch_switch_pitch_first = anti_aim_defensive_inair_gear:slider(v12.get("arrows-repeat") .. "  First Value:", -89, 89, 0);
anti_aim_defensive_inair_selection_pitch_switch_pitch_second = anti_aim_defensive_inair_gear:slider(v12.get("arrows-repeat-1") .. "  Second Value:", -89, 89, 0);
anti_aim_defensive_inair_selection_pitch_switch_pitch_delay = anti_aim_defensive_inair_gear:slider(v12.get("clock") .. "  Speed:", 7, 13, 7);
anti_aim_defensive_inair_selection_pitch_random_from = anti_aim_defensive_inair_gear:slider(v12.get("arrow-rotate-left") .. "  From:", -89, 89, 0);
anti_aim_defensive_inair_selection_pitch_random_to = anti_aim_defensive_inair_gear:slider(v12.get("arrow-rotate-right") .. "  To:", -89, 89, 0);
anti_aim_defensive_inair_selection_yaw = anti_aim_defensive_inair_gear:combo(v12.get("arrows-turn-to-dots") .. "  Yaw Mode", {
    [1] = "Sideways", 
    [2] = "Spin", 
    [3] = "Random", 
    [4] = "Neverlose", 
    [5] = "Static"
});
anti_aim_defensive_inair_selection_yaw_sideways = anti_aim_defensive_inair_gear:slider(v12.get("arrows-left-right") .. "  Value:", -180, 180, 0);
anti_aim_defensive_inair_selection_yaw_spin_range = anti_aim_defensive_inair_gear:slider(v12.get("arrows-rotate") .. "  Range:", 1, 180, 0);
anti_aim_defensive_inair_selection_yaw_spin_speed = anti_aim_defensive_inair_gear:slider(v12.get("gauge-simple-high") .. "  Speed:", 1, 5, 1);
anti_aim_defensive_inair_selection_yaw_random_from = anti_aim_defensive_inair_gear:slider(v12.get("arrow-rotate-left") .. "  From:", -180, 180, 0);
anti_aim_defensive_inair_selection_yaw_random_to = anti_aim_defensive_inair_gear:slider(v12.get("arrow-rotate-right") .. "  To:", -180, 180, 0);
anti_aim_defensive_inair_selection_yaw_static = anti_aim_defensive_inair_gear:slider(v12.get("arrows-spin") .. "  Static Value:", -180, 180, 0);
anti_aim_defensive_aircrouch = v21:switch(v12.get("person-skiing") .. "  Air-Crouch");
anti_aim_defensive_aircrouch_gear = anti_aim_defensive_aircrouch:create();
anti_aim_defensive_aircrouch_selection = anti_aim_defensive_aircrouch_gear:combo(v12.get("sliders") .. "  Selection", {
    [1] = "Pitch", 
    [2] = "Yaw"
});
anti_aim_defensive_aircrouch_selection_pitch = anti_aim_defensive_aircrouch_gear:combo(v12.get("arrows-to-line") .. "  Pitch Mode", {
    [1] = "Switch", 
    [2] = "Random"
});
anti_aim_defensive_aircrouch_selection_pitch_sideways_pitch = anti_aim_defensive_aircrouch_gear:slider(v12.get("arrows-left-right") .. "  Value:", -89, 89, 0);
anti_aim_defensive_aircrouch_selection_pitch_switch_pitch_first = anti_aim_defensive_aircrouch_gear:slider(v12.get("arrows-repeat") .. "  First Value:", -89, 89, 0);
anti_aim_defensive_aircrouch_selection_pitch_switch_pitch_second = anti_aim_defensive_aircrouch_gear:slider(v12.get("arrows-repeat-1") .. "  Second Value:", -89, 89, 0);
anti_aim_defensive_aircrouch_selection_pitch_switch_pitch_delay = anti_aim_defensive_aircrouch_gear:slider(v12.get("clock") .. "  Speed:", 7, 13, 7);
anti_aim_defensive_aircrouch_selection_pitch_random_from = anti_aim_defensive_aircrouch_gear:slider(v12.get("arrow-rotate-left") .. "  From:", -89, 89, 0);
anti_aim_defensive_aircrouch_selection_pitch_random_to = anti_aim_defensive_aircrouch_gear:slider(v12.get("arrow-rotate-right") .. "  To:", -89, 89, 0);
anti_aim_defensive_aircrouch_selection_yaw = anti_aim_defensive_aircrouch_gear:combo(v12.get("arrows-turn-to-dots") .. "  Yaw Mode", {
    [1] = "Sideways", 
    [2] = "Spin", 
    [3] = "Random", 
    [4] = "Neverlose", 
    [5] = "Static"
});
anti_aim_defensive_aircrouch_selection_yaw_sideways = anti_aim_defensive_aircrouch_gear:slider(v12.get("arrows-left-right") .. "  Value:", -180, 180, 0);
anti_aim_defensive_aircrouch_selection_yaw_spin_range = anti_aim_defensive_aircrouch_gear:slider(v12.get("arrows-rotate") .. "  Range:", 1, 180, 0);
anti_aim_defensive_aircrouch_selection_yaw_spin_speed = anti_aim_defensive_aircrouch_gear:slider(v12.get("gauge-simple-high") .. "  Speed:", 1, 5, 1);
anti_aim_defensive_aircrouch_selection_yaw_random_from = anti_aim_defensive_aircrouch_gear:slider(v12.get("arrow-rotate-left") .. "  From:", -180, 180, 0);
anti_aim_defensive_aircrouch_selection_yaw_random_to = anti_aim_defensive_aircrouch_gear:slider(v12.get("arrow-rotate-right") .. "  To:", -180, 180, 0);
anti_aim_defensive_aircrouch_selection_yaw_static = anti_aim_defensive_aircrouch_gear:slider(v12.get("arrows-spin") .. "  Static Value:", -180, 180, 0);
anti_aim_on = v20:switch(v12.get("user-shield") .. "  Anti-Aim Builder");
anti_aim_on_gear = anti_aim_on:create();
anti_aim_on_manual = anti_aim_on_gear:combo(v12.get("arrows-left-right") .. "  Manual", {
    [1] = "Disabled", 
    [2] = "Left", 
    [3] = "Right"
});
anti_aim_stand = v20:switch(v12.get("person") .. "  Stand");
anti_aim_stand_gear = anti_aim_stand:create();
anti_aim_stand_selection = anti_aim_stand_gear:combo(v12.get("sliders") .. "  Selection", {
    [1] = "Main", 
    [2] = "Yaw Modifier", 
    [3] = "Body Yaw"
});
anti_aim_move = v20:switch(v12.get("person-running") .. "  Move");
anti_aim_move_gear = anti_aim_move:create();
anti_aim_move_selection = anti_aim_move_gear:combo(v12.get("sliders") .. "  Selection", {
    [1] = "Main", 
    [2] = "Yaw Modifier", 
    [3] = "Body Yaw"
});
anti_aim_slowmotion = v20:switch(v12.get("person-walking") .. "  Slowmotion");
anti_aim_slowmotion_gear = anti_aim_slowmotion:create();
anti_aim_slowmotion_selection = anti_aim_slowmotion_gear:combo(v12.get("sliders") .. "  Selection", {
    [1] = "Main", 
    [2] = "Yaw Modifier", 
    [3] = "Body Yaw"
});
anti_aim_crouch = v20:switch(v12.get("person-praying") .. "  Crouch");
anti_aim_crouch_gear = anti_aim_crouch:create();
anti_aim_crouch_selection = anti_aim_crouch_gear:combo(v12.get("sliders") .. "  Selection", {
    [1] = "Main", 
    [2] = "Yaw Modifier", 
    [3] = "Body Yaw"
});
anti_aim_sneak = v20:switch(v12.get("person-sledding") .. "  Sneak");
anti_aim_sneak_gear = anti_aim_sneak:create();
anti_aim_sneak_selection = anti_aim_sneak_gear:combo(v12.get("sliders") .. "  Selection", {
    [1] = "Main", 
    [2] = "Yaw Modifier", 
    [3] = "Body Yaw"
});
anti_aim_inair = v20:switch(v12.get("person-ski-jumping") .. "  In-Air");
anti_aim_inair_gear = anti_aim_inair:create();
anti_aim_inair_selection = anti_aim_inair_gear:combo(v12.get("sliders") .. "  Selection", {
    [1] = "Main", 
    [2] = "Yaw Modifier", 
    [3] = "Body Yaw"
});
anti_aim_aircrouch = v20:switch(v12.get("person-skiing") .. "  Air-Crouch");
anti_aim_aircrouch_gear = anti_aim_aircrouch:create();
anti_aim_aircrouch_selection = anti_aim_aircrouch_gear:combo(v12.get("sliders") .. "  Selection", {
    [1] = "Main", 
    [2] = "Yaw Modifier", 
    [3] = "Body Yaw"
});
pitch_stand = anti_aim_stand_gear:combo(v12.get("arrows-to-line") .. "  Pitch", {
    [1] = "Disabled", 
    [2] = "Down", 
    [3] = "Fake Down", 
    [4] = "Fake Up"
});
yaw_stand = anti_aim_stand_gear:combo(v12.get("arrows-spin") .. "  Yaw", {
    [1] = "Disabled", 
    [2] = "Backward", 
    [3] = "Static"
});
base_stand = anti_aim_stand_gear:combo(v12.get("users") .. "  Base", {
    [1] = "Local View", 
    [2] = "At Target"
});
offset_stand = anti_aim_stand_gear:slider(v12.get("arrows-left-right") .. "  Offset", -180, 180, 0);
yaw_modifier_stand = anti_aim_stand_gear:combo(v12.get("user-gear") .. " Yaw Modifier", {
    [1] = "Disabled", 
    [2] = "Center", 
    [3] = "Offset", 
    [4] = "Random", 
    [5] = "Spin", 
    [6] = "3-Way", 
    [7] = "5-Way"
});
modifier_offset_stand = anti_aim_stand_gear:slider(v12.get("arrows-rotate") .. "  Modifier Offset", -180, 180, 0);
body_yaw_stand = anti_aim_stand_gear:switch(v12.get("arrows-repeat") .. "  Body Yaw");
inverter_stand = anti_aim_stand_gear:switch(v12.get("arrow-rotate-right") .. "  Inverter");
left_limit_stand = anti_aim_stand_gear:slider(v12.get("arrow-left-long") .. "  Left Limit", 0, 60);
right_limit_stand = anti_aim_stand_gear:slider(v12.get("arrow-right-long") .. "  Right Limit", 0, 60);
options_stand = anti_aim_stand_gear:selectable(v12.get("arrow-pointer") .. "  Options", {
    [1] = "Avoid Overlap", 
    [2] = "Jitter", 
    [3] = "Randomize Jitter", 
    [4] = "Anti Bruteforce"
});
body_yaw_freestanding_stand = anti_aim_stand_gear:combo(v12.get("arrows-up-down-left-right") .. "  Freestanding", {
    [1] = "Off", 
    [2] = "Peek Fake", 
    [3] = "Peek Real"
});
pitch_move = anti_aim_move_gear:combo(v12.get("arrows-to-line") .. "  Pitch", {
    [1] = "Disabled", 
    [2] = "Down", 
    [3] = "Fake Down", 
    [4] = "Fake Up"
});
yaw_move = anti_aim_move_gear:combo(v12.get("arrows-spin") .. "  Yaw", {
    [1] = "Disabled", 
    [2] = "Backward", 
    [3] = "Static"
});
base_move = anti_aim_move_gear:combo(v12.get("users") .. "  Base", {
    [1] = "Local View", 
    [2] = "At Target"
});
offset_move = anti_aim_move_gear:slider(v12.get("arrows-left-right") .. "  Offset", -180, 180, 0);
yaw_modifier_move = anti_aim_move_gear:combo(v12.get("user-gear") .. " Yaw Modifier", {
    [1] = "Disabled", 
    [2] = "Center", 
    [3] = "Offset", 
    [4] = "Random", 
    [5] = "Spin", 
    [6] = "3-Way", 
    [7] = "5-Way"
});
modifier_offset_move = anti_aim_move_gear:slider(v12.get("arrows-rotate") .. "  Modifier Offset", -180, 180, 0);
body_yaw_move = anti_aim_move_gear:switch(v12.get("arrows-repeat") .. "  Body Yaw");
inverter_move = anti_aim_move_gear:switch(v12.get("arrow-rotate-right") .. "  Inverter");
left_limit_move = anti_aim_move_gear:slider(v12.get("arrow-left-long") .. "  Left Limit", 0, 60);
right_limit_move = anti_aim_move_gear:slider(v12.get("arrow-right-long") .. "  Right Limit", 0, 60);
options_move = anti_aim_move_gear:selectable(v12.get("arrow-pointer") .. "  Options", {
    [1] = "Avoid Overlap", 
    [2] = "Jitter", 
    [3] = "Randomize Jitter", 
    [4] = "Anti Bruteforce"
});
body_yaw_freestanding_move = anti_aim_move_gear:combo(v12.get("arrows-up-down-left-right") .. "  Freestanding", {
    [1] = "Off", 
    [2] = "Peek Fake", 
    [3] = "Peek Real"
});
pitch_slowmotion = anti_aim_slowmotion_gear:combo(v12.get("arrows-to-line") .. "  Pitch", {
    [1] = "Disabled", 
    [2] = "Down", 
    [3] = "Fake Down", 
    [4] = "Fake Up"
});
yaw_slowmotion = anti_aim_slowmotion_gear:combo(v12.get("arrows-spin") .. "  Yaw", {
    [1] = "Disabled", 
    [2] = "Backward", 
    [3] = "Static"
});
base_slowmotion = anti_aim_slowmotion_gear:combo(v12.get("users") .. "  Base", {
    [1] = "Local View", 
    [2] = "At Target"
});
offset_slowmotion = anti_aim_slowmotion_gear:slider(v12.get("arrows-left-right") .. "  Offset", -180, 180, 0);
yaw_modifier_slowmotion = anti_aim_slowmotion_gear:combo(v12.get("user-gear") .. " Yaw Modifier", {
    [1] = "Disabled", 
    [2] = "Center", 
    [3] = "Offset", 
    [4] = "Random", 
    [5] = "Spin", 
    [6] = "3-Way", 
    [7] = "5-Way"
});
modifier_offset_slowmotion = anti_aim_slowmotion_gear:slider(v12.get("arrows-rotate") .. "  Modifier Offset", -180, 180, 0);
body_yaw_slowmotion = anti_aim_slowmotion_gear:switch(v12.get("arrows-repeat") .. "  Body Yaw");
inverter_slowmotion = anti_aim_slowmotion_gear:switch(v12.get("arrow-rotate-right") .. "  Inverter");
left_limit_slowmotion = anti_aim_slowmotion_gear:slider(v12.get("arrow-left-long") .. "  Left Limit", 0, 60);
right_limit_slowmotion = anti_aim_slowmotion_gear:slider(v12.get("arrow-right-long") .. "  Right Limit", 0, 60);
options_slowmotion = anti_aim_slowmotion_gear:selectable(v12.get("arrow-pointer") .. "  Options", {
    [1] = "Avoid Overlap", 
    [2] = "Jitter", 
    [3] = "Randomize Jitter", 
    [4] = "Anti Bruteforce"
});
body_yaw_freestanding_slowmotion = anti_aim_slowmotion_gear:combo(v12.get("arrows-up-down-left-right") .. "  Freestanding", {
    [1] = "Off", 
    [2] = "Peek Fake", 
    [3] = "Peek Real"
});
pitch_crouch = anti_aim_crouch_gear:combo(v12.get("arrows-to-line") .. "  Pitch", {
    [1] = "Disabled", 
    [2] = "Down", 
    [3] = "Fake Down", 
    [4] = "Fake Up"
});
yaw_crouch = anti_aim_crouch_gear:combo(v12.get("arrows-spin") .. "  Yaw", {
    [1] = "Disabled", 
    [2] = "Backward", 
    [3] = "Static"
});
base_crouch = anti_aim_crouch_gear:combo(v12.get("users") .. "  Base", {
    [1] = "Local View", 
    [2] = "At Target"
});
offset_crouch = anti_aim_crouch_gear:slider(v12.get("arrows-left-right") .. "  Offset", -180, 180, 0);
yaw_modifier_crouch = anti_aim_crouch_gear:combo(v12.get("user-gear") .. " Yaw Modifier", {
    [1] = "Disabled", 
    [2] = "Center", 
    [3] = "Offset", 
    [4] = "Random", 
    [5] = "Spin", 
    [6] = "3-Way", 
    [7] = "5-Way"
});
modifier_offset_crouch = anti_aim_crouch_gear:slider(v12.get("arrows-rotate") .. "  Modifier Offset", -180, 180, 0);
body_yaw_crouch = anti_aim_crouch_gear:switch(v12.get("arrows-repeat") .. "  Body Yaw");
inverter_crouch = anti_aim_crouch_gear:switch(v12.get("arrow-rotate-right") .. "  Inverter");
left_limit_crouch = anti_aim_crouch_gear:slider(v12.get("arrow-left-long") .. "  Left Limit", 0, 60);
right_limit_crouch = anti_aim_crouch_gear:slider(v12.get("arrow-right-long") .. "  Right Limit", 0, 60);
options_crouch = anti_aim_crouch_gear:selectable(v12.get("arrow-pointer") .. "  Options", {
    [1] = "Avoid Overlap", 
    [2] = "Jitter", 
    [3] = "Randomize Jitter", 
    [4] = "Anti Bruteforce"
});
body_yaw_freestanding_crouch = anti_aim_crouch_gear:combo(v12.get("arrows-up-down-left-right") .. "  Freestanding", {
    [1] = "Off", 
    [2] = "Peek Fake", 
    [3] = "Peek Real"
});
pitch_sneak = anti_aim_sneak_gear:combo(v12.get("arrows-to-line") .. "  Pitch", {
    [1] = "Disabled", 
    [2] = "Down", 
    [3] = "Fake Down", 
    [4] = "Fake Up"
});
yaw_sneak = anti_aim_sneak_gear:combo(v12.get("arrows-spin") .. "  Yaw", {
    [1] = "Disabled", 
    [2] = "Backward", 
    [3] = "Static"
});
base_sneak = anti_aim_sneak_gear:combo(v12.get("users") .. "  Base", {
    [1] = "Local View", 
    [2] = "At Target"
});
offset_sneak = anti_aim_sneak_gear:slider(v12.get("arrows-left-right") .. "  Offset", -180, 180, 0);
yaw_modifier_sneak = anti_aim_sneak_gear:combo(v12.get("user-gear") .. " Yaw Modifier", {
    [1] = "Disabled", 
    [2] = "Center", 
    [3] = "Offset", 
    [4] = "Random", 
    [5] = "Spin", 
    [6] = "3-Way", 
    [7] = "5-Way"
});
modifier_offset_sneak = anti_aim_sneak_gear:slider(v12.get("arrows-rotate") .. "  Modifier Offset", -180, 180, 0);
body_yaw_sneak = anti_aim_sneak_gear:switch(v12.get("arrows-repeat") .. "  Body Yaw");
inverter_sneak = anti_aim_sneak_gear:switch(v12.get("arrow-rotate-right") .. "  Inverter");
left_limit_sneak = anti_aim_sneak_gear:slider(v12.get("arrow-left-long") .. "  Left Limit", 0, 60);
right_limit_sneak = anti_aim_sneak_gear:slider(v12.get("arrow-right-long") .. "  Right Limit", 0, 60);
options_sneak = anti_aim_sneak_gear:selectable(v12.get("arrow-pointer") .. "  Options", {
    [1] = "Avoid Overlap", 
    [2] = "Jitter", 
    [3] = "Randomize Jitter", 
    [4] = "Anti Bruteforce"
});
body_yaw_freestanding_sneak = anti_aim_sneak_gear:combo(v12.get("arrows-up-down-left-right") .. "  Freestanding", {
    [1] = "Off", 
    [2] = "Peek Fake", 
    [3] = "Peek Real"
});
pitch_inair = anti_aim_inair_gear:combo(v12.get("arrows-to-line") .. "  Pitch", {
    [1] = "Disabled", 
    [2] = "Down", 
    [3] = "Fake Down", 
    [4] = "Fake Up"
});
yaw_inair = anti_aim_inair_gear:combo(v12.get("arrows-spin") .. "  Yaw", {
    [1] = "Disabled", 
    [2] = "Backward", 
    [3] = "Static"
});
base_inair = anti_aim_inair_gear:combo(v12.get("users") .. "  Base", {
    [1] = "Local View", 
    [2] = "At Target"
});
offset_inair = anti_aim_inair_gear:slider(v12.get("arrows-left-right") .. "  Offset", -180, 180, 0);
yaw_modifier_inair = anti_aim_inair_gear:combo(v12.get("user-gear") .. " Yaw Modifier", {
    [1] = "Disabled", 
    [2] = "Center", 
    [3] = "Offset", 
    [4] = "Random", 
    [5] = "Spin", 
    [6] = "3-Way", 
    [7] = "5-Way"
});
modifier_offset_inair = anti_aim_inair_gear:slider(v12.get("arrows-rotate") .. "  Modifier Offset", -180, 180, 0);
body_yaw_inair = anti_aim_inair_gear:switch(v12.get("arrows-repeat") .. "  Body Yaw");
inverter_inair = anti_aim_inair_gear:switch(v12.get("arrow-rotate-right") .. "  Inverter");
left_limit_inair = anti_aim_inair_gear:slider(v12.get("arrow-left-long") .. "  Left Limit", 0, 60);
right_limit_inair = anti_aim_inair_gear:slider(v12.get("arrow-right-long") .. "  Right Limit", 0, 60);
options_inair = anti_aim_inair_gear:selectable(v12.get("arrow-pointer") .. "  Options", {
    [1] = "Avoid Overlap", 
    [2] = "Jitter", 
    [3] = "Randomize Jitter", 
    [4] = "Anti Bruteforce"
});
body_yaw_freestanding_inair = anti_aim_inair_gear:combo(v12.get("arrows-up-down-left-right") .. "  Freestanding", {
    [1] = "Off", 
    [2] = "Peek Fake", 
    [3] = "Peek Real"
});
pitch_aircrouch = anti_aim_aircrouch_gear:combo(v12.get("arrows-to-line") .. "  Pitch", {
    [1] = "Disabled", 
    [2] = "Down", 
    [3] = "Fake Down", 
    [4] = "Fake Up"
});
yaw_aircrouch = anti_aim_aircrouch_gear:combo(v12.get("arrows-spin") .. "  Yaw", {
    [1] = "Disabled", 
    [2] = "Backward", 
    [3] = "Static"
});
base_aircrouch = anti_aim_aircrouch_gear:combo(v12.get("users") .. "  Base", {
    [1] = "Local View", 
    [2] = "At Target"
});
offset_aircrouch = anti_aim_aircrouch_gear:slider(v12.get("arrows-left-right") .. "  Offset", -180, 180, 0);
yaw_modifier_aircrouch = anti_aim_aircrouch_gear:combo(v12.get("user-gear") .. " Yaw Modifier", {
    [1] = "Disabled", 
    [2] = "Center", 
    [3] = "Offset", 
    [4] = "Random", 
    [5] = "Spin", 
    [6] = "3-Way", 
    [7] = "5-Way"
});
modifier_offset_aircrouch = anti_aim_aircrouch_gear:slider(v12.get("arrows-rotate") .. "  Modifier Offset", -180, 180, 0);
body_yaw_aircrouch = anti_aim_aircrouch_gear:switch(v12.get("arrows-repeat") .. "  Body Yaw");
inverter_aircrouch = anti_aim_aircrouch_gear:switch(v12.get("arrow-rotate-right") .. "  Inverter");
left_limit_aircrouch = anti_aim_aircrouch_gear:slider(v12.get("arrow-left-long") .. "  Left Limit", 0, 60);
right_limit_aircrouch = anti_aim_aircrouch_gear:slider(v12.get("arrow-right-long") .. "  Right Limit", 0, 60);
options_aircrouch = anti_aim_aircrouch_gear:selectable(v12.get("arrow-pointer") .. "  Options", {
    [1] = "Avoid Overlap", 
    [2] = "Jitter", 
    [3] = "Randomize Jitter", 
    [4] = "Anti Bruteforce"
});
body_yaw_freestanding_aircrouch = anti_aim_aircrouch_gear:combo(v12.get("arrows-up-down-left-right") .. "  Freestanding", {
    [1] = "Off", 
    [2] = "Peek Fake", 
    [3] = "Peek Real"
});
local v38 = v22:switch(v12.get("marker") .. "  Indicators");
local v39 = v38:create();
local v40 = v39:slider(v12.get("arrow-down-right") .. "  Offset", 0, 20, 5);
local v41 = v39:color_picker(v12.get("paint-roller") .. "  Color", color(255, 255, 255, 255));
local v42 = v39:color_picker(v12.get("paint-roller") .. "  Gradient", color(255, 255, 255, 255));
local v43 = v22:switch(v12.get("claw-marks") .. "  Dmg. Indicator");
local v44 = v43:create();
local v45 = v44:combo(v12.get("pen-swirl") .. "  Font", {
    [1] = "Verdana", 
    [2] = "Pixel"
});
local v46 = v44:color_picker(v12.get("paint-roller") .. "  Color", color(255, 255, 255, 255));
local v47 = v22:switch(v12.get("image") .. "  Watermark");
local v48 = v47:create();
local v49 = v48:combo(v12.get("brush") .. "  Style", "Bottom", "Left");
local v50 = v48:color_picker(v12.get("paint-roller") .. "  Color", color(255, 255, 255, 255));
local v51 = v48:color_picker(v12.get("paint-roller") .. "  Gradient", color(255, 255, 255, 255));
local v52 = v22:switch(v12.get("grip-lines") .. "  Snaplines");
local v53 = v52:create();
local v54 = v53:switch(v12.get("person-rifle") .. "  Current Target");
local v55 = v53:color_picker(v12.get("paint-roller") .. "  Color", color(255, 255, 255, 255));
local v56 = v24:switch(v12.get("hand") .. "  Viewmodel");
local v57 = v56:create();
local v58 = v57:slider(v12.get("arrow-up") .. "  Fov", 0, 100, 68);
local v59 = v57:slider(v12.get("arrows-left-right") .. "  X", -15, 15, 0);
local v60 = v57:slider(v12.get("arrows-to-dotted-line") .. "  Y", -15, 15, 0);
local v61 = v57:slider(v12.get("arrows-up-down") .. "   Z", -15, 15, 0);
local v62 = v24:switch(v12.get("marker") .. "  Custom Scope");
local v63 = v62:create();
local v64 = v63:switch(v12.get("diaspora") .. "  Disappearing Alpha");
local v65 = v63:color_picker(v12.get("paint-roller") .. "  Color", color(255, 255, 255, 255));
local v66 = v63:slider(v12.get("arrows-up-down-left-right") .. "  Line", 10, 500);
local v67 = v63:slider(v12.get("arrows-minimize") .. "  Gap", 0, 100);
local v68 = v24:switch(v12.get("arrows-left-right") .. "  Aspect Ratio");
local v69 = v68:create():slider(v12.get("arrows-left-right-to-line") .. "  Value", 0, 250, 0, 0.01);
local v70 = v24:switch(v12.get("knife-kitchen") .. "  Knife In Other Hand");
local v71 = v70:create():combo(v12.get("hand") .. "  Hand", "Left", "Right");
local v72 = v24:switch(v12.get("radar") .. "  Hide Radar");
local v73 = v23:switch(v12.get("gun") .. "  Ragebot Logs");
local v74 = v73:create():combo(v12.get("pen-swirl") .. "  Logs Style", {
    [1] = "Short", 
    [2] = "Full"
});
local v75 = v23:switch(v12.get("chart-line") .. "  Fps Boost");
local v76 = v75:create();
local v77 = v76:switch(v12.get("claw-marks") .. "  Clear Decals");
local v78 = v76:switch(v12.get("shoe-prints") .. "  Delete Foots Shadow");
local v79 = v76:switch(v12.get("merge") .. "  Overall Boost");
local v80 = v23:switch(v12.get("turtle") .. "  Slowmotion Modifier");
local v81 = v80:create():slider(v12.get("gauge-simple-min") .. "  Speed", 5, 80, 5);
local v82 = v23:switch(v12.get("wifi-exclamation") .. "  Unlock Fake Latency"):tooltip("This function takes effect every time a round begins.");
local v83 = v82:create():slider(v12.get("signal-stream-slash") .. "  Amount", 0, 200, 0);
local v84 = v23:selectable(v12.get("gear") .. "  Additions", {
    [1] = "Auto Disconnect", 
    [2] = "Kill/Death Say", 
    [3] = "Clear Console", 
    [4] = "Clantag"
});
local v85 = v25:list("", "User Settings #1", "User Settings #2", "User Settings #3", "Safe-Head Preset", "Aggressive Preset", "Lua Owner Preset");
events.render:set(function()
    -- upvalues: v18 (ref), v17 (ref), v19 (ref), v20 (ref), v21 (ref), v22 (ref), v23 (ref), v24 (ref), v25 (ref)
    v18:visibility(v17:get() == 1);
    v19:visibility(v17:get() == 2);
    v20:visibility(v17:get() == 2);
    v21:visibility(v17:get() == 2);
    v22:visibility(v17:get() == 3);
    v23:visibility(v17:get() == 3);
    v24:visibility(v17:get() == 3);
    v25:visibility(v17:get() == 4);
    anti_aim_defensive_on_gear:visibility(anti_aim_defensive_on:get());
    anti_aim_on_gear:visibility(anti_aim_on:get());
    anti_aim_stand_gear:visibility(anti_aim_stand:get());
    anti_aim_move_gear:visibility(anti_aim_move:get());
    anti_aim_slowmotion_gear:visibility(anti_aim_slowmotion:get());
    anti_aim_crouch_gear:visibility(anti_aim_crouch:get());
    anti_aim_sneak_gear:visibility(anti_aim_sneak:get());
    anti_aim_inair_gear:visibility(anti_aim_inair:get());
    anti_aim_aircrouch_gear:visibility(anti_aim_aircrouch:get());
end);
local v86 = {};
events.render:set(function()
    -- upvalues: v8 (ref), v86 (ref)
    local v87 = entity.get_local_player();
    if globals.is_in_game and v87:is_alive() then
        if v87.m_fFlags == 263 and v87.m_vecVelocity:length2d() < 4 and not v8.binds.fakeduck:get() then
            v86 = 1;
        elseif v87.m_fFlags == 263 and v87.m_vecVelocity:length2d() > 5 and not v8.binds.fakeduck:get() then
            v86 = 2;
        elseif v87.m_vecVelocity:length2d() < 5 and not v8.binds.fakeduck:get() then
            v86 = 3;
        elseif v87.m_fFlags == 256 then
            v86 = 4;
        elseif v87.m_fFlags == 262 then
            v86 = 5;
        elseif v8.binds.slowmotion:get() and not v8.binds.fakeduck:get() then
            v86 = 6;
        elseif v87.m_vecVelocity:length2d() > 5 and not v8.binds.slowmotion:get() and not v8.binds.fakeduck:get() then
            v86 = 7;
        elseif v8.binds.fakeduck:get() and v87.m_vecVelocity:length2d() < 4 then
            v86 = 1;
        elseif v8.binds.fakeduck:get() and v87.m_vecVelocity:length2d() > 5 then
            v86 = 2;
        end;
    end;
end);
events.render:set(function()
    -- upvalues: v86 (ref), v8 (ref)
    anti_aim_stand:visibility(anti_aim_on:get());
    pitch_stand:visibility(anti_aim_stand_selection:get() == "Main");
    yaw_stand:visibility(anti_aim_stand_selection:get() == "Main");
    base_stand:visibility(anti_aim_stand_selection:get() == "Main" and yaw_stand:get() ~= "Disabled");
    offset_stand:visibility(anti_aim_stand_selection:get() == "Main" and yaw_stand:get() ~= "Disabled");
    yaw_modifier_stand:visibility(anti_aim_stand_selection:get() == "Yaw Modifier");
    modifier_offset_stand:visibility(anti_aim_stand_selection:get() == "Yaw Modifier" and yaw_modifier_stand:get() ~= "Disabled");
    body_yaw_stand:visibility(anti_aim_stand_selection:get() == "Body Yaw");
    inverter_stand:visibility(anti_aim_stand_selection:get() == "Body Yaw" and body_yaw_stand:get());
    left_limit_stand:visibility(anti_aim_stand_selection:get() == "Body Yaw" and body_yaw_stand:get());
    right_limit_stand:visibility(anti_aim_stand_selection:get() == "Body Yaw" and body_yaw_stand:get());
    options_stand:visibility(anti_aim_stand_selection:get() == "Body Yaw" and body_yaw_stand:get());
    body_yaw_freestanding_stand:visibility(anti_aim_stand_selection:get() == "Body Yaw" and body_yaw_stand:get());
    local v88 = entity.get_local_player();
    if globals.is_in_game and v88:is_alive() and v86 == 3 and anti_aim_on:get() then
        if anti_aim_on_manual:get() == "Right" then
            v8.antiaim.yaw:override("Backward");
            v8.antiaim.yaw_base:override("Local View");
            v8.antiaim.yaw_offset:override(90);
            v8.antiaim.yaw_modifier:override("Disabled");
            v8.other.hidden_yaw:override(false);
        elseif anti_aim_on_manual:get() == "Left" then
            v8.antiaim.yaw:override("Backward");
            v8.antiaim.yaw_base:override("Local View");
            v8.antiaim.yaw_offset:override(-90);
            v8.antiaim.yaw_modifier:override("Disabled");
            v8.other.hidden_yaw:override(false);
        elseif anti_aim_on_manual:get() == "Disabled" then
            v8.antiaim.pitch:override(pitch_stand:get());
            v8.antiaim.yaw:override(yaw_stand:get());
            v8.antiaim.yaw_base:override(base_stand:get());
            v8.antiaim.yaw_offset:override(offset_stand:get());
            v8.antiaim.yaw_modifier:override(yaw_modifier_stand:get());
            v8.antiaim.modifier_offset:override(modifier_offset_stand:get());
            v8.other.hidden_yaw:override(anti_aim_defensive_stand:get() and anti_aim_defensive_on:get());
        end;
        v8.antiaim.body_yaw:override(body_yaw_stand:get());
        v8.antiaim.inventer:override(inverter_stand:get());
        v8.antiaim.left_limit:override(left_limit_stand:get());
        v8.antiaim.right_limit:override(right_limit_stand:get());
        v8.antiaim.options:override(options_stand:get());
        v8.antiaim.body_yaw_freestanding:override(body_yaw_freestanding_stand:get());
    end;
end);
events.render:set(function()
    -- upvalues: v86 (ref), v8 (ref)
    anti_aim_move:visibility(anti_aim_on:get());
    pitch_move:visibility(anti_aim_move_selection:get() == "Main");
    yaw_move:visibility(anti_aim_move_selection:get() == "Main");
    base_move:visibility(anti_aim_move_selection:get() == "Main" and yaw_move:get() ~= "Disabled");
    offset_move:visibility(anti_aim_move_selection:get() == "Main" and yaw_move:get() ~= "Disabled");
    yaw_modifier_move:visibility(anti_aim_move_selection:get() == "Yaw Modifier");
    modifier_offset_move:visibility(anti_aim_move_selection:get() == "Yaw Modifier" and yaw_modifier_move:get() ~= "Disabled");
    body_yaw_move:visibility(anti_aim_move_selection:get() == "Body Yaw");
    inverter_move:visibility(anti_aim_move_selection:get() == "Body Yaw" and body_yaw_move:get());
    left_limit_move:visibility(anti_aim_move_selection:get() == "Body Yaw" and body_yaw_move:get());
    right_limit_move:visibility(anti_aim_move_selection:get() == "Body Yaw" and body_yaw_move:get());
    options_move:visibility(anti_aim_move_selection:get() == "Body Yaw" and body_yaw_move:get());
    body_yaw_freestanding_move:visibility(anti_aim_move_selection:get() == "Body Yaw" and body_yaw_move:get());
    local v89 = entity.get_local_player();
    if globals.is_in_game and v89:is_alive() and v86 == 7 and anti_aim_on:get() then
        if anti_aim_on_manual:get() == "Right" then
            v8.antiaim.yaw:override("Backward");
            v8.antiaim.yaw_base:override("Local View");
            v8.antiaim.yaw_offset:override(90);
            v8.antiaim.yaw_modifier:override("Disabled");
            v8.other.hidden_yaw:override(false);
        elseif anti_aim_on_manual:get() == "Left" then
            v8.antiaim.yaw:override("Backward");
            v8.antiaim.yaw_base:override("Local View");
            v8.antiaim.yaw_offset:override(-90);
            v8.antiaim.yaw_modifier:override("Disabled");
            v8.other.hidden_yaw:override(false);
        elseif anti_aim_on_manual:get() == "Disabled" then
            v8.antiaim.pitch:override(pitch_move:get());
            v8.antiaim.yaw:override(yaw_move:get());
            v8.antiaim.yaw_base:override(base_move:get());
            v8.antiaim.yaw_offset:override(offset_move:get());
            v8.antiaim.yaw_modifier:override(yaw_modifier_move:get());
            v8.antiaim.modifier_offset:override(modifier_offset_move:get());
            v8.other.hidden_yaw:override(anti_aim_defensive_move:get() and anti_aim_defensive_on:get());
        end;
        v8.antiaim.body_yaw:override(body_yaw_move:get());
        v8.antiaim.inventer:override(inverter_move:get());
        v8.antiaim.left_limit:override(left_limit_move:get());
        v8.antiaim.right_limit:override(right_limit_move:get());
        v8.antiaim.options:override(options_move:get());
        v8.antiaim.body_yaw_freestanding:override(body_yaw_freestanding_move:get());
    end;
end);
events.render:set(function()
    -- upvalues: v86 (ref), v8 (ref)
    anti_aim_slowmotion:visibility(anti_aim_on:get());
    pitch_slowmotion:visibility(anti_aim_slowmotion_selection:get() == "Main");
    yaw_slowmotion:visibility(anti_aim_slowmotion_selection:get() == "Main");
    base_slowmotion:visibility(anti_aim_slowmotion_selection:get() == "Main" and yaw_slowmotion:get() ~= "Disabled");
    offset_slowmotion:visibility(anti_aim_slowmotion_selection:get() == "Main" and yaw_slowmotion:get() ~= "Disabled");
    yaw_modifier_slowmotion:visibility(anti_aim_slowmotion_selection:get() == "Yaw Modifier");
    modifier_offset_slowmotion:visibility(anti_aim_slowmotion_selection:get() == "Yaw Modifier" and yaw_modifier_slowmotion:get() ~= "Disabled");
    body_yaw_slowmotion:visibility(anti_aim_slowmotion_selection:get() == "Body Yaw");
    inverter_slowmotion:visibility(anti_aim_slowmotion_selection:get() == "Body Yaw" and body_yaw_slowmotion:get());
    left_limit_slowmotion:visibility(anti_aim_slowmotion_selection:get() == "Body Yaw" and body_yaw_slowmotion:get());
    right_limit_slowmotion:visibility(anti_aim_slowmotion_selection:get() == "Body Yaw" and body_yaw_slowmotion:get());
    options_slowmotion:visibility(anti_aim_slowmotion_selection:get() == "Body Yaw" and body_yaw_slowmotion:get());
    body_yaw_freestanding_slowmotion:visibility(anti_aim_slowmotion_selection:get() == "Body Yaw" and body_yaw_slowmotion:get());
    local v90 = entity.get_local_player();
    if globals.is_in_game and v90:is_alive() and v86 == 6 and anti_aim_on:get() then
        if anti_aim_on_manual:get() == "Right" then
            v8.antiaim.yaw:override("Backward");
            v8.antiaim.yaw_base:override("Local View");
            v8.antiaim.yaw_offset:override(90);
            v8.antiaim.yaw_modifier:override("Disabled");
            v8.other.hidden_yaw:override(false);
        elseif anti_aim_on_manual:get() == "Left" then
            v8.antiaim.yaw:override("Backward");
            v8.antiaim.yaw_base:override("Local View");
            v8.antiaim.yaw_offset:override(-90);
            v8.antiaim.yaw_modifier:override("Disabled");
            v8.other.hidden_yaw:override(false);
        elseif anti_aim_on_manual:get() == "Disabled" then
            v8.antiaim.pitch:override(pitch_slowmotion:get());
            v8.antiaim.yaw:override(yaw_slowmotion:get());
            v8.antiaim.yaw_base:override(base_slowmotion:get());
            v8.antiaim.yaw_offset:override(offset_slowmotion:get());
            v8.antiaim.yaw_modifier:override(yaw_modifier_slowmotion:get());
            v8.antiaim.modifier_offset:override(modifier_offset_slowmotion:get());
            v8.other.hidden_yaw:override(anti_aim_defensive_slowmotion:get() and anti_aim_defensive_on:get());
        end;
        v8.antiaim.body_yaw:override(body_yaw_slowmotion:get());
        v8.antiaim.inventer:override(inverter_slowmotion:get());
        v8.antiaim.left_limit:override(left_limit_slowmotion:get());
        v8.antiaim.right_limit:override(right_limit_slowmotion:get());
        v8.antiaim.options:override(options_slowmotion:get());
        v8.antiaim.body_yaw_freestanding:override(body_yaw_freestanding_slowmotion:get());
    end;
end);
events.render:set(function()
    -- upvalues: v86 (ref), v8 (ref)
    anti_aim_crouch:visibility(anti_aim_on:get());
    pitch_crouch:visibility(anti_aim_crouch_selection:get() == "Main");
    yaw_crouch:visibility(anti_aim_crouch_selection:get() == "Main");
    base_crouch:visibility(anti_aim_crouch_selection:get() == "Main" and yaw_crouch:get() ~= "Disabled");
    offset_crouch:visibility(anti_aim_crouch_selection:get() == "Main" and yaw_crouch:get() ~= "Disabled");
    yaw_modifier_crouch:visibility(anti_aim_crouch_selection:get() == "Yaw Modifier");
    modifier_offset_crouch:visibility(anti_aim_crouch_selection:get() == "Yaw Modifier" and yaw_modifier_crouch:get() ~= "Disabled");
    body_yaw_crouch:visibility(anti_aim_crouch_selection:get() == "Body Yaw");
    inverter_crouch:visibility(anti_aim_crouch_selection:get() == "Body Yaw" and body_yaw_crouch:get());
    left_limit_crouch:visibility(anti_aim_crouch_selection:get() == "Body Yaw" and body_yaw_crouch:get());
    right_limit_crouch:visibility(anti_aim_crouch_selection:get() == "Body Yaw" and body_yaw_crouch:get());
    options_crouch:visibility(anti_aim_crouch_selection:get() == "Body Yaw" and body_yaw_crouch:get());
    body_yaw_freestanding_crouch:visibility(anti_aim_crouch_selection:get() == "Body Yaw" and body_yaw_crouch:get());
    local v91 = entity.get_local_player();
    if globals.is_in_game and v91:is_alive() and v86 == 1 and anti_aim_on:get() then
        if anti_aim_on_manual:get() == "Right" then
            v8.antiaim.yaw:override("Backward");
            v8.antiaim.yaw_base:override("Local View");
            v8.antiaim.yaw_offset:override(90);
            v8.antiaim.yaw_modifier:override("Disabled");
            v8.other.hidden_yaw:override(false);
        elseif anti_aim_on_manual:get() == "Left" then
            v8.antiaim.yaw:override("Backward");
            v8.antiaim.yaw_base:override("Local View");
            v8.antiaim.yaw_offset:override(-90);
            v8.antiaim.yaw_modifier:override("Disabled");
            v8.other.hidden_yaw:override(false);
        elseif anti_aim_on_manual:get() == "Disabled" then
            v8.antiaim.pitch:override(pitch_crouch:get());
            v8.antiaim.yaw:override(yaw_crouch:get());
            v8.antiaim.yaw_base:override(base_crouch:get());
            v8.antiaim.yaw_offset:override(offset_crouch:get());
            v8.antiaim.yaw_modifier:override(yaw_modifier_crouch:get());
            v8.antiaim.modifier_offset:override(modifier_offset_crouch:get());
            v8.other.hidden_yaw:override(anti_aim_defensive_crouch:get() and anti_aim_defensive_on:get());
        end;
        v8.antiaim.body_yaw:override(body_yaw_crouch:get());
        v8.antiaim.inventer:override(inverter_crouch:get());
        v8.antiaim.left_limit:override(left_limit_crouch:get());
        v8.antiaim.right_limit:override(right_limit_crouch:get());
        v8.antiaim.options:override(options_crouch:get());
        v8.antiaim.body_yaw_freestanding:override(body_yaw_freestanding_crouch:get());
    end;
end);
events.render:set(function()
    -- upvalues: v86 (ref), v8 (ref)
    anti_aim_sneak:visibility(anti_aim_on:get());
    pitch_sneak:visibility(anti_aim_sneak_selection:get() == "Main");
    yaw_sneak:visibility(anti_aim_sneak_selection:get() == "Main");
    base_sneak:visibility(anti_aim_sneak_selection:get() == "Main" and yaw_sneak:get() ~= "Disabled");
    offset_sneak:visibility(anti_aim_sneak_selection:get() == "Main" and yaw_sneak:get() ~= "Disabled");
    yaw_modifier_sneak:visibility(anti_aim_sneak_selection:get() == "Yaw Modifier");
    modifier_offset_sneak:visibility(anti_aim_sneak_selection:get() == "Yaw Modifier" and yaw_modifier_sneak:get() ~= "Disabled");
    body_yaw_sneak:visibility(anti_aim_sneak_selection:get() == "Body Yaw");
    inverter_sneak:visibility(anti_aim_sneak_selection:get() == "Body Yaw" and body_yaw_sneak:get());
    left_limit_sneak:visibility(anti_aim_sneak_selection:get() == "Body Yaw" and body_yaw_sneak:get());
    right_limit_sneak:visibility(anti_aim_sneak_selection:get() == "Body Yaw" and body_yaw_sneak:get());
    options_sneak:visibility(anti_aim_sneak_selection:get() == "Body Yaw" and body_yaw_sneak:get());
    body_yaw_freestanding_sneak:visibility(anti_aim_sneak_selection:get() == "Body Yaw" and body_yaw_sneak:get());
    local v92 = entity.get_local_player();
    if globals.is_in_game and v92:is_alive() and v86 == 2 and anti_aim_on:get() then
        if anti_aim_on_manual:get() == "Right" then
            v8.antiaim.yaw:override("Backward");
            v8.antiaim.yaw_base:override("Local View");
            v8.antiaim.yaw_offset:override(90);
            v8.antiaim.yaw_modifier:override("Disabled");
            v8.other.hidden_yaw:override(false);
        elseif anti_aim_on_manual:get() == "Left" then
            v8.antiaim.yaw:override("Backward");
            v8.antiaim.yaw_base:override("Local View");
            v8.antiaim.yaw_offset:override(-90);
            v8.antiaim.yaw_modifier:override("Disabled");
            v8.other.hidden_yaw:override(false);
        elseif anti_aim_on_manual:get() == "Disabled" then
            v8.antiaim.pitch:override(pitch_sneak:get());
            v8.antiaim.yaw:override(yaw_sneak:get());
            v8.antiaim.yaw_base:override(base_sneak:get());
            v8.antiaim.yaw_offset:override(offset_sneak:get());
            v8.antiaim.yaw_modifier:override(yaw_modifier_sneak:get());
            v8.antiaim.modifier_offset:override(modifier_offset_sneak:get());
            v8.other.hidden_yaw:override(anti_aim_defensive_sneak:get() and anti_aim_defensive_on:get());
        end;
        v8.antiaim.body_yaw:override(body_yaw_sneak:get());
        v8.antiaim.inventer:override(inverter_sneak:get());
        v8.antiaim.left_limit:override(left_limit_sneak:get());
        v8.antiaim.right_limit:override(right_limit_sneak:get());
        v8.antiaim.options:override(options_sneak:get());
        v8.antiaim.body_yaw_freestanding:override(body_yaw_freestanding_sneak:get());
    end;
end);
events.render:set(function()
    -- upvalues: v86 (ref), v8 (ref)
    anti_aim_inair:visibility(anti_aim_on:get());
    pitch_inair:visibility(anti_aim_inair_selection:get() == "Main");
    yaw_inair:visibility(anti_aim_inair_selection:get() == "Main");
    base_inair:visibility(anti_aim_inair_selection:get() == "Main" and yaw_inair:get() ~= "Disabled");
    offset_inair:visibility(anti_aim_inair_selection:get() == "Main" and yaw_inair:get() ~= "Disabled");
    yaw_modifier_inair:visibility(anti_aim_inair_selection:get() == "Yaw Modifier");
    modifier_offset_inair:visibility(anti_aim_inair_selection:get() == "Yaw Modifier" and yaw_modifier_inair:get() ~= "Disabled");
    body_yaw_inair:visibility(anti_aim_inair_selection:get() == "Body Yaw");
    inverter_inair:visibility(anti_aim_inair_selection:get() == "Body Yaw" and body_yaw_inair:get());
    left_limit_inair:visibility(anti_aim_inair_selection:get() == "Body Yaw" and body_yaw_inair:get());
    right_limit_inair:visibility(anti_aim_inair_selection:get() == "Body Yaw" and body_yaw_inair:get());
    options_inair:visibility(anti_aim_inair_selection:get() == "Body Yaw" and body_yaw_inair:get());
    body_yaw_freestanding_inair:visibility(anti_aim_inair_selection:get() == "Body Yaw" and body_yaw_inair:get());
    local v93 = entity.get_local_player();
    if globals.is_in_game and v93:is_alive() and v86 == 4 and anti_aim_on:get() then
        if anti_aim_on_manual:get() == "Right" then
            v8.antiaim.yaw:override("Backward");
            v8.antiaim.yaw_base:override("Local View");
            v8.antiaim.yaw_offset:override(90);
            v8.antiaim.yaw_modifier:override("Disabled");
            v8.other.hidden_yaw:override(false);
        elseif anti_aim_on_manual:get() == "Left" then
            v8.antiaim.yaw:override("Backward");
            v8.antiaim.yaw_base:override("Local View");
            v8.antiaim.yaw_offset:override(-90);
            v8.antiaim.yaw_modifier:override("Disabled");
            v8.other.hidden_yaw:override(false);
        elseif anti_aim_on_manual:get() == "Disabled" then
            v8.antiaim.pitch:override(pitch_inair:get());
            v8.antiaim.yaw:override(yaw_inair:get());
            v8.antiaim.yaw_base:override(base_inair:get());
            v8.antiaim.yaw_offset:override(offset_inair:get());
            v8.antiaim.yaw_modifier:override(yaw_modifier_inair:get());
            v8.antiaim.modifier_offset:override(modifier_offset_inair:get());
            v8.other.hidden_yaw:override(anti_aim_defensive_inair:get() and anti_aim_defensive_on:get());
        end;
        v8.antiaim.body_yaw:override(body_yaw_inair:get());
        v8.antiaim.inventer:override(inverter_inair:get());
        v8.antiaim.left_limit:override(left_limit_inair:get());
        v8.antiaim.right_limit:override(right_limit_inair:get());
        v8.antiaim.options:override(options_inair:get());
        v8.antiaim.body_yaw_freestanding:override(body_yaw_freestanding_inair:get());
    end;
end);
events.render:set(function()
    -- upvalues: v86 (ref), v8 (ref)
    anti_aim_aircrouch:visibility(anti_aim_on:get());
    pitch_aircrouch:visibility(anti_aim_aircrouch_selection:get() == "Main");
    yaw_aircrouch:visibility(anti_aim_aircrouch_selection:get() == "Main");
    base_aircrouch:visibility(anti_aim_aircrouch_selection:get() == "Main" and yaw_aircrouch:get() ~= "Disabled");
    offset_aircrouch:visibility(anti_aim_aircrouch_selection:get() == "Main" and yaw_aircrouch:get() ~= "Disabled");
    yaw_modifier_aircrouch:visibility(anti_aim_aircrouch_selection:get() == "Yaw Modifier");
    modifier_offset_aircrouch:visibility(anti_aim_aircrouch_selection:get() == "Yaw Modifier" and yaw_modifier_aircrouch:get() ~= "Disabled");
    body_yaw_aircrouch:visibility(anti_aim_aircrouch_selection:get() == "Body Yaw");
    inverter_aircrouch:visibility(anti_aim_aircrouch_selection:get() == "Body Yaw" and body_yaw_aircrouch:get());
    left_limit_aircrouch:visibility(anti_aim_aircrouch_selection:get() == "Body Yaw" and body_yaw_aircrouch:get());
    right_limit_aircrouch:visibility(anti_aim_aircrouch_selection:get() == "Body Yaw" and body_yaw_aircrouch:get());
    options_aircrouch:visibility(anti_aim_aircrouch_selection:get() == "Body Yaw" and body_yaw_aircrouch:get());
    body_yaw_freestanding_aircrouch:visibility(anti_aim_aircrouch_selection:get() == "Body Yaw" and body_yaw_aircrouch:get());
    local v94 = entity.get_local_player();
    if globals.is_in_game and v94:is_alive() and v86 == 5 and anti_aim_on:get() then
        if anti_aim_on_manual:get() == "Right" then
            v8.antiaim.yaw:override("Backward");
            v8.antiaim.yaw_base:override("Local View");
            v8.antiaim.yaw_offset:override(90);
            v8.antiaim.yaw_modifier:override("Disabled");
            v8.other.hidden_yaw:override(false);
        elseif anti_aim_on_manual:get() == "Left" then
            v8.antiaim.yaw:override("Backward");
            v8.antiaim.yaw_base:override("Local View");
            v8.antiaim.yaw_offset:override(-90);
            v8.antiaim.yaw_modifier:override("Disabled");
            v8.other.hidden_yaw:override(false);
        elseif anti_aim_on_manual:get() == "Disabled" then
            v8.antiaim.pitch:override(pitch_aircrouch:get());
            v8.antiaim.yaw:override(yaw_aircrouch:get());
            v8.antiaim.yaw_base:override(base_aircrouch:get());
            v8.antiaim.yaw_offset:override(offset_aircrouch:get());
            v8.antiaim.yaw_modifier:override(yaw_modifier_aircrouch:get());
            v8.antiaim.modifier_offset:override(modifier_offset_aircrouch:get());
            v8.other.hidden_yaw:override(anti_aim_defensive_aircrouch:get() and anti_aim_defensive_on:get());
        end;
        v8.antiaim.body_yaw:override(body_yaw_aircrouch:get());
        v8.antiaim.inventer:override(inverter_aircrouch:get());
        v8.antiaim.left_limit:override(left_limit_aircrouch:get());
        v8.antiaim.right_limit:override(right_limit_aircrouch:get());
        v8.antiaim.options:override(options_aircrouch:get());
        v8.antiaim.body_yaw_freestanding:override(body_yaw_freestanding_aircrouch:get());
    end;
end);
events.render:set(function()
    -- upvalues: v86 (ref)
    anti_aim_defensive_stand:visibility(anti_aim_defensive_on:get());
    anti_aim_defensive_stand_gear:visibility(anti_aim_defensive_stand:get());
    anti_aim_defensive_stand_selection_pitch:visibility(anti_aim_defensive_stand_selection:get() == "Pitch");
    anti_aim_defensive_stand_selection_pitch_sideways_pitch:visibility(anti_aim_defensive_stand_selection:get() == "Pitch" and anti_aim_defensive_stand_selection_pitch:get() == "Sideways");
    anti_aim_defensive_stand_selection_pitch_switch_pitch_first:visibility(anti_aim_defensive_stand_selection:get() == "Pitch" and anti_aim_defensive_stand_selection_pitch:get() == "Switch");
    anti_aim_defensive_stand_selection_pitch_switch_pitch_second:visibility(anti_aim_defensive_stand_selection:get() == "Pitch" and anti_aim_defensive_stand_selection_pitch:get() == "Switch");
    anti_aim_defensive_stand_selection_pitch_switch_pitch_delay:visibility(anti_aim_defensive_stand_selection:get() == "Pitch" and anti_aim_defensive_stand_selection_pitch:get() == "Switch");
    anti_aim_defensive_stand_selection_pitch_random_from:visibility(anti_aim_defensive_stand_selection:get() == "Pitch" and anti_aim_defensive_stand_selection_pitch:get() == "Random");
    anti_aim_defensive_stand_selection_pitch_random_to:visibility(anti_aim_defensive_stand_selection:get() == "Pitch" and anti_aim_defensive_stand_selection_pitch:get() == "Random");
    anti_aim_defensive_stand_selection_yaw:visibility(anti_aim_defensive_stand_selection:get() == "Yaw");
    anti_aim_defensive_stand_selection_yaw_sideways:visibility(anti_aim_defensive_stand_selection:get() == "Yaw" and anti_aim_defensive_stand_selection_yaw:get() == "Sideways");
    anti_aim_defensive_stand_selection_yaw_spin_range:visibility(anti_aim_defensive_stand_selection:get() == "Yaw" and anti_aim_defensive_stand_selection_yaw:get() == "Spin");
    anti_aim_defensive_stand_selection_yaw_spin_speed:visibility(anti_aim_defensive_stand_selection:get() == "Yaw" and anti_aim_defensive_stand_selection_yaw:get() == "Spin");
    anti_aim_defensive_stand_selection_yaw_random_from:visibility(anti_aim_defensive_stand_selection:get() == "Yaw" and anti_aim_defensive_stand_selection_yaw:get() == "Random");
    anti_aim_defensive_stand_selection_yaw_random_to:visibility(anti_aim_defensive_stand_selection:get() == "Yaw" and anti_aim_defensive_stand_selection_yaw:get() == "Random");
    anti_aim_defensive_stand_selection_yaw_static:visibility(anti_aim_defensive_stand_selection:get() == "Yaw" and anti_aim_defensive_stand_selection_yaw:get() == "Static");
    local v95 = entity.get_local_player();
    local v96 = anti_aim_defensive_on:get() and rage.exploit:get() and anti_aim_on_manual:get() == "Disabled";
    if globals.is_in_game and v95:is_alive() and v86 == 3 and v96 then
        if anti_aim_defensive_stand_selection_pitch:get() == "Switch" then
            if globals.tickcount % anti_aim_defensive_stand_selection_pitch_switch_pitch_delay:get() > 5 then
                rage.antiaim:override_hidden_pitch(anti_aim_defensive_stand_selection_pitch_switch_pitch_first:get());
            else
                rage.antiaim:override_hidden_pitch(anti_aim_defensive_stand_selection_pitch_switch_pitch_second:get());
            end;
        end;
        if anti_aim_defensive_stand_selection_pitch:get() == "Random" then
            rage.antiaim:override_hidden_pitch(math.random(anti_aim_defensive_stand_selection_pitch_random_from:get(), anti_aim_defensive_stand_selection_pitch_random_to:get()));
        end;
        if anti_aim_defensive_stand_selection_yaw:get() == "Sideways" then
            if globals.tickcount % 3 == 0 then
                rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_stand_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 1 then
                rage.antiaim:override_hidden_yaw_offset(-anti_aim_defensive_stand_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 2 then
                rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_stand_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 3 then
                rage.antiaim:override_hidden_yaw_offset(-anti_aim_defensive_stand_selection_yaw_sideways:get());
            end;
        end;
        if anti_aim_defensive_stand_selection_yaw:get() == "Spin" then
            rage.antiaim:override_hidden_yaw_offset(-math.fmod(globals.curtime * (anti_aim_defensive_stand_selection_yaw_spin_speed:get() * 180), anti_aim_defensive_stand_selection_yaw_spin_range:get() * 2) + anti_aim_defensive_stand_selection_yaw_spin_range:get());
        end;
        if anti_aim_defensive_stand_selection_yaw:get() == "Random" then
            rage.antiaim:override_hidden_yaw_offset(math.random(anti_aim_defensive_stand_selection_yaw_random_from:get(), anti_aim_defensive_stand_selection_yaw_random_to:get()));
        end;
        if anti_aim_defensive_stand_selection_yaw:get() == "Neverlose" then

        end;
        if anti_aim_defensive_stand_selection_yaw:get() == "Static" then
            rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_stand_selection_yaw_static:get());
        end;
    end;
end);
events.render:set(function()
    -- upvalues: v86 (ref)
    anti_aim_defensive_move:visibility(anti_aim_defensive_on:get());
    anti_aim_defensive_move_gear:visibility(anti_aim_defensive_move:get());
    anti_aim_defensive_move_selection_pitch:visibility(anti_aim_defensive_move_selection:get() == "Pitch");
    anti_aim_defensive_move_selection_pitch_sideways_pitch:visibility(anti_aim_defensive_move_selection:get() == "Pitch" and anti_aim_defensive_move_selection_pitch:get() == "Sideways");
    anti_aim_defensive_move_selection_pitch_switch_pitch_first:visibility(anti_aim_defensive_move_selection:get() == "Pitch" and anti_aim_defensive_move_selection_pitch:get() == "Switch");
    anti_aim_defensive_move_selection_pitch_switch_pitch_second:visibility(anti_aim_defensive_move_selection:get() == "Pitch" and anti_aim_defensive_move_selection_pitch:get() == "Switch");
    anti_aim_defensive_move_selection_pitch_switch_pitch_delay:visibility(anti_aim_defensive_move_selection:get() == "Pitch" and anti_aim_defensive_move_selection_pitch:get() == "Switch");
    anti_aim_defensive_move_selection_pitch_random_from:visibility(anti_aim_defensive_move_selection:get() == "Pitch" and anti_aim_defensive_move_selection_pitch:get() == "Random");
    anti_aim_defensive_move_selection_pitch_random_to:visibility(anti_aim_defensive_move_selection:get() == "Pitch" and anti_aim_defensive_move_selection_pitch:get() == "Random");
    anti_aim_defensive_move_selection_yaw:visibility(anti_aim_defensive_move_selection:get() == "Yaw");
    anti_aim_defensive_move_selection_yaw_sideways:visibility(anti_aim_defensive_move_selection:get() == "Yaw" and anti_aim_defensive_move_selection_yaw:get() == "Sideways");
    anti_aim_defensive_move_selection_yaw_spin_range:visibility(anti_aim_defensive_move_selection:get() == "Yaw" and anti_aim_defensive_move_selection_yaw:get() == "Spin");
    anti_aim_defensive_move_selection_yaw_spin_speed:visibility(anti_aim_defensive_move_selection:get() == "Yaw" and anti_aim_defensive_move_selection_yaw:get() == "Spin");
    anti_aim_defensive_move_selection_yaw_random_from:visibility(anti_aim_defensive_move_selection:get() == "Yaw" and anti_aim_defensive_move_selection_yaw:get() == "Random");
    anti_aim_defensive_move_selection_yaw_random_to:visibility(anti_aim_defensive_move_selection:get() == "Yaw" and anti_aim_defensive_move_selection_yaw:get() == "Random");
    anti_aim_defensive_move_selection_yaw_static:visibility(anti_aim_defensive_move_selection:get() == "Yaw" and anti_aim_defensive_move_selection_yaw:get() == "Static");
    local v97 = entity.get_local_player();
    local v98 = anti_aim_defensive_on:get() and rage.exploit:get() and anti_aim_on_manual:get() == "Disabled";
    if globals.is_in_game and v97:is_alive() and v86 == 7 and v98 then
        if anti_aim_defensive_move_selection_pitch:get() == "Switch" then
            if globals.tickcount % anti_aim_defensive_move_selection_pitch_switch_pitch_delay:get() > 5 then
                rage.antiaim:override_hidden_pitch(anti_aim_defensive_move_selection_pitch_switch_pitch_first:get());
            else
                rage.antiaim:override_hidden_pitch(anti_aim_defensive_move_selection_pitch_switch_pitch_second:get());
            end;
        end;
        if anti_aim_defensive_move_selection_pitch:get() == "Random" then
            rage.antiaim:override_hidden_pitch(math.random(anti_aim_defensive_move_selection_pitch_random_from:get(), anti_aim_defensive_move_selection_pitch_random_to:get()));
        end;
        if anti_aim_defensive_move_selection_yaw:get() == "Sideways" then
            if globals.tickcount % 3 == 0 then
                rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_move_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 1 then
                rage.antiaim:override_hidden_yaw_offset(-anti_aim_defensive_move_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 2 then
                rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_move_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 3 then
                rage.antiaim:override_hidden_yaw_offset(-anti_aim_defensive_move_selection_yaw_sideways:get());
            end;
        end;
        if anti_aim_defensive_move_selection_yaw:get() == "Spin" then
            rage.antiaim:override_hidden_yaw_offset(-math.fmod(globals.curtime * (anti_aim_defensive_move_selection_yaw_spin_speed:get() * 180), anti_aim_defensive_move_selection_yaw_spin_range:get() * 2) + anti_aim_defensive_move_selection_yaw_spin_range:get());
        end;
        if anti_aim_defensive_move_selection_yaw:get() == "Random" then
            rage.antiaim:override_hidden_yaw_offset(math.random(anti_aim_defensive_move_selection_yaw_random_from:get(), anti_aim_defensive_move_selection_yaw_random_to:get()));
        end;
        if anti_aim_defensive_move_selection_yaw:get() == "Neverlose" then

        end;
        if anti_aim_defensive_move_selection_yaw:get() == "Static" then
            rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_move_selection_yaw_static:get());
        end;
    end;
end);
events.render:set(function()
    -- upvalues: v86 (ref)
    anti_aim_defensive_slowmotion:visibility(anti_aim_defensive_on:get());
    anti_aim_defensive_slowmotion_gear:visibility(anti_aim_defensive_slowmotion:get());
    anti_aim_defensive_slowmotion_selection_pitch:visibility(anti_aim_defensive_slowmotion_selection:get() == "Pitch");
    anti_aim_defensive_slowmotion_selection_pitch_sideways_pitch:visibility(anti_aim_defensive_slowmotion_selection:get() == "Pitch" and anti_aim_defensive_slowmotion_selection_pitch:get() == "Sideways");
    anti_aim_defensive_slowmotion_selection_pitch_switch_pitch_first:visibility(anti_aim_defensive_slowmotion_selection:get() == "Pitch" and anti_aim_defensive_slowmotion_selection_pitch:get() == "Switch");
    anti_aim_defensive_slowmotion_selection_pitch_switch_pitch_second:visibility(anti_aim_defensive_slowmotion_selection:get() == "Pitch" and anti_aim_defensive_slowmotion_selection_pitch:get() == "Switch");
    anti_aim_defensive_slowmotion_selection_pitch_switch_pitch_delay:visibility(anti_aim_defensive_slowmotion_selection:get() == "Pitch" and anti_aim_defensive_slowmotion_selection_pitch:get() == "Switch");
    anti_aim_defensive_slowmotion_selection_pitch_random_from:visibility(anti_aim_defensive_slowmotion_selection:get() == "Pitch" and anti_aim_defensive_slowmotion_selection_pitch:get() == "Random");
    anti_aim_defensive_slowmotion_selection_pitch_random_to:visibility(anti_aim_defensive_slowmotion_selection:get() == "Pitch" and anti_aim_defensive_slowmotion_selection_pitch:get() == "Random");
    anti_aim_defensive_slowmotion_selection_yaw:visibility(anti_aim_defensive_slowmotion_selection:get() == "Yaw");
    anti_aim_defensive_slowmotion_selection_yaw_sideways:visibility(anti_aim_defensive_slowmotion_selection:get() == "Yaw" and anti_aim_defensive_slowmotion_selection_yaw:get() == "Sideways");
    anti_aim_defensive_slowmotion_selection_yaw_spin_range:visibility(anti_aim_defensive_slowmotion_selection:get() == "Yaw" and anti_aim_defensive_slowmotion_selection_yaw:get() == "Spin");
    anti_aim_defensive_slowmotion_selection_yaw_spin_speed:visibility(anti_aim_defensive_slowmotion_selection:get() == "Yaw" and anti_aim_defensive_slowmotion_selection_yaw:get() == "Spin");
    anti_aim_defensive_slowmotion_selection_yaw_random_from:visibility(anti_aim_defensive_slowmotion_selection:get() == "Yaw" and anti_aim_defensive_slowmotion_selection_yaw:get() == "Random");
    anti_aim_defensive_slowmotion_selection_yaw_random_to:visibility(anti_aim_defensive_slowmotion_selection:get() == "Yaw" and anti_aim_defensive_slowmotion_selection_yaw:get() == "Random");
    anti_aim_defensive_slowmotion_selection_yaw_static:visibility(anti_aim_defensive_slowmotion_selection:get() == "Yaw" and anti_aim_defensive_slowmotion_selection_yaw:get() == "Static");
    local v99 = entity.get_local_player();
    local v100 = anti_aim_defensive_on:get() and rage.exploit:get() and anti_aim_on_manual:get() == "Disabled";
    if globals.is_in_game and v99:is_alive() and v86 == 6 and v100 then
        if anti_aim_defensive_slowmotion_selection_pitch:get() == "Switch" then
            if globals.tickcount % anti_aim_defensive_slowmotion_selection_pitch_switch_pitch_delay:get() > 5 then
                rage.antiaim:override_hidden_pitch(anti_aim_defensive_slowmotion_selection_pitch_switch_pitch_first:get());
            else
                rage.antiaim:override_hidden_pitch(anti_aim_defensive_slowmotion_selection_pitch_switch_pitch_second:get());
            end;
        end;
        if anti_aim_defensive_slowmotion_selection_pitch:get() == "Random" then
            rage.antiaim:override_hidden_pitch(math.random(anti_aim_defensive_slowmotion_selection_pitch_random_from:get(), anti_aim_defensive_slowmotion_selection_pitch_random_to:get()));
        end;
        if anti_aim_defensive_slowmotion_selection_yaw:get() == "Sideways" then
            if globals.tickcount % 3 == 0 then
                rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_slowmotion_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 1 then
                rage.antiaim:override_hidden_yaw_offset(-anti_aim_defensive_slowmotion_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 2 then
                rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_slowmotion_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 3 then
                rage.antiaim:override_hidden_yaw_offset(-anti_aim_defensive_slowmotion_selection_yaw_sideways:get());
            end;
        end;
        if anti_aim_defensive_slowmotion_selection_yaw:get() == "Spin" then
            rage.antiaim:override_hidden_yaw_offset(-math.fmod(globals.curtime * (anti_aim_defensive_slowmotion_selection_yaw_spin_speed:get() * 180), anti_aim_defensive_slowmotion_selection_yaw_spin_range:get() * 2) + anti_aim_defensive_slowmotion_selection_yaw_spin_range:get());
        end;
        if anti_aim_defensive_slowmotion_selection_yaw:get() == "Random" then
            rage.antiaim:override_hidden_yaw_offset(math.random(anti_aim_defensive_slowmotion_selection_yaw_random_from:get(), anti_aim_defensive_slowmotion_selection_yaw_random_to:get()));
        end;
        if anti_aim_defensive_slowmotion_selection_yaw:get() == "Neverlose" then

        end;
        if anti_aim_defensive_slowmotion_selection_yaw:get() == "Static" then
            rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_slowmotion_selection_yaw_static:get());
        end;
    end;
end);
events.render:set(function()
    -- upvalues: v86 (ref)
    anti_aim_defensive_crouch:visibility(anti_aim_defensive_on:get());
    anti_aim_defensive_crouch_gear:visibility(anti_aim_defensive_crouch:get());
    anti_aim_defensive_crouch_selection_pitch:visibility(anti_aim_defensive_crouch_selection:get() == "Pitch");
    anti_aim_defensive_crouch_selection_pitch_sideways_pitch:visibility(anti_aim_defensive_crouch_selection:get() == "Pitch" and anti_aim_defensive_crouch_selection_pitch:get() == "Sideways");
    anti_aim_defensive_crouch_selection_pitch_switch_pitch_first:visibility(anti_aim_defensive_crouch_selection:get() == "Pitch" and anti_aim_defensive_crouch_selection_pitch:get() == "Switch");
    anti_aim_defensive_crouch_selection_pitch_switch_pitch_second:visibility(anti_aim_defensive_crouch_selection:get() == "Pitch" and anti_aim_defensive_crouch_selection_pitch:get() == "Switch");
    anti_aim_defensive_crouch_selection_pitch_switch_pitch_delay:visibility(anti_aim_defensive_crouch_selection:get() == "Pitch" and anti_aim_defensive_crouch_selection_pitch:get() == "Switch");
    anti_aim_defensive_crouch_selection_pitch_random_from:visibility(anti_aim_defensive_crouch_selection:get() == "Pitch" and anti_aim_defensive_crouch_selection_pitch:get() == "Random");
    anti_aim_defensive_crouch_selection_pitch_random_to:visibility(anti_aim_defensive_crouch_selection:get() == "Pitch" and anti_aim_defensive_crouch_selection_pitch:get() == "Random");
    anti_aim_defensive_crouch_selection_yaw:visibility(anti_aim_defensive_crouch_selection:get() == "Yaw");
    anti_aim_defensive_crouch_selection_yaw_sideways:visibility(anti_aim_defensive_crouch_selection:get() == "Yaw" and anti_aim_defensive_crouch_selection_yaw:get() == "Sideways");
    anti_aim_defensive_crouch_selection_yaw_spin_range:visibility(anti_aim_defensive_crouch_selection:get() == "Yaw" and anti_aim_defensive_crouch_selection_yaw:get() == "Spin");
    anti_aim_defensive_crouch_selection_yaw_spin_speed:visibility(anti_aim_defensive_crouch_selection:get() == "Yaw" and anti_aim_defensive_crouch_selection_yaw:get() == "Spin");
    anti_aim_defensive_crouch_selection_yaw_random_from:visibility(anti_aim_defensive_crouch_selection:get() == "Yaw" and anti_aim_defensive_crouch_selection_yaw:get() == "Random");
    anti_aim_defensive_crouch_selection_yaw_random_to:visibility(anti_aim_defensive_crouch_selection:get() == "Yaw" and anti_aim_defensive_crouch_selection_yaw:get() == "Random");
    anti_aim_defensive_crouch_selection_yaw_static:visibility(anti_aim_defensive_crouch_selection:get() == "Yaw" and anti_aim_defensive_crouch_selection_yaw:get() == "Static");
    local v101 = entity.get_local_player();
    local v102 = anti_aim_defensive_on:get() and rage.exploit:get() and anti_aim_on_manual:get() == "Disabled";
    if globals.is_in_game and v101:is_alive() and v86 == 1 and v102 then
        if anti_aim_defensive_crouch_selection_pitch:get() == "Switch" then
            if globals.tickcount % anti_aim_defensive_crouch_selection_pitch_switch_pitch_delay:get() > 5 then
                rage.antiaim:override_hidden_pitch(anti_aim_defensive_crouch_selection_pitch_switch_pitch_first:get());
            else
                rage.antiaim:override_hidden_pitch(anti_aim_defensive_crouch_selection_pitch_switch_pitch_second:get());
            end;
        end;
        if anti_aim_defensive_crouch_selection_pitch:get() == "Random" then
            rage.antiaim:override_hidden_pitch(math.random(anti_aim_defensive_crouch_selection_pitch_random_from:get(), anti_aim_defensive_crouch_selection_pitch_random_to:get()));
        end;
        if anti_aim_defensive_crouch_selection_yaw:get() == "Sideways" then
            if globals.tickcount % 3 == 0 then
                rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_crouch_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 1 then
                rage.antiaim:override_hidden_yaw_offset(-anti_aim_defensive_crouch_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 2 then
                rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_crouch_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 3 then
                rage.antiaim:override_hidden_yaw_offset(-anti_aim_defensive_crouch_selection_yaw_sideways:get());
            end;
        end;
        if anti_aim_defensive_crouch_selection_yaw:get() == "Spin" then
            rage.antiaim:override_hidden_yaw_offset(-math.fmod(globals.curtime * (anti_aim_defensive_crouch_selection_yaw_spin_speed:get() * 180), anti_aim_defensive_crouch_selection_yaw_spin_range:get() * 2) + anti_aim_defensive_crouch_selection_yaw_spin_range:get());
        end;
        if anti_aim_defensive_crouch_selection_yaw:get() == "Random" then
            rage.antiaim:override_hidden_yaw_offset(math.random(anti_aim_defensive_crouch_selection_yaw_random_from:get(), anti_aim_defensive_crouch_selection_yaw_random_to:get()));
        end;
        if anti_aim_defensive_crouch_selection_yaw:get() == "Neverlose" then

        end;
        if anti_aim_defensive_crouch_selection_yaw:get() == "Static" then
            rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_crouch_selection_yaw_static:get());
        end;
    end;
end);
events.render:set(function()
    -- upvalues: v86 (ref)
    anti_aim_defensive_sneak:visibility(anti_aim_defensive_on:get());
    anti_aim_defensive_sneak_gear:visibility(anti_aim_defensive_sneak:get());
    anti_aim_defensive_sneak_selection_pitch:visibility(anti_aim_defensive_sneak_selection:get() == "Pitch");
    anti_aim_defensive_sneak_selection_pitch_sideways_pitch:visibility(anti_aim_defensive_sneak_selection:get() == "Pitch" and anti_aim_defensive_sneak_selection_pitch:get() == "Sideways");
    anti_aim_defensive_sneak_selection_pitch_switch_pitch_first:visibility(anti_aim_defensive_sneak_selection:get() == "Pitch" and anti_aim_defensive_sneak_selection_pitch:get() == "Switch");
    anti_aim_defensive_sneak_selection_pitch_switch_pitch_second:visibility(anti_aim_defensive_sneak_selection:get() == "Pitch" and anti_aim_defensive_sneak_selection_pitch:get() == "Switch");
    anti_aim_defensive_sneak_selection_pitch_switch_pitch_delay:visibility(anti_aim_defensive_sneak_selection:get() == "Pitch" and anti_aim_defensive_sneak_selection_pitch:get() == "Switch");
    anti_aim_defensive_sneak_selection_pitch_random_from:visibility(anti_aim_defensive_sneak_selection:get() == "Pitch" and anti_aim_defensive_sneak_selection_pitch:get() == "Random");
    anti_aim_defensive_sneak_selection_pitch_random_to:visibility(anti_aim_defensive_sneak_selection:get() == "Pitch" and anti_aim_defensive_sneak_selection_pitch:get() == "Random");
    anti_aim_defensive_sneak_selection_yaw:visibility(anti_aim_defensive_sneak_selection:get() == "Yaw");
    anti_aim_defensive_sneak_selection_yaw_sideways:visibility(anti_aim_defensive_sneak_selection:get() == "Yaw" and anti_aim_defensive_sneak_selection_yaw:get() == "Sideways");
    anti_aim_defensive_sneak_selection_yaw_spin_range:visibility(anti_aim_defensive_sneak_selection:get() == "Yaw" and anti_aim_defensive_sneak_selection_yaw:get() == "Spin");
    anti_aim_defensive_sneak_selection_yaw_spin_speed:visibility(anti_aim_defensive_sneak_selection:get() == "Yaw" and anti_aim_defensive_sneak_selection_yaw:get() == "Spin");
    anti_aim_defensive_sneak_selection_yaw_random_from:visibility(anti_aim_defensive_sneak_selection:get() == "Yaw" and anti_aim_defensive_sneak_selection_yaw:get() == "Random");
    anti_aim_defensive_sneak_selection_yaw_random_to:visibility(anti_aim_defensive_sneak_selection:get() == "Yaw" and anti_aim_defensive_sneak_selection_yaw:get() == "Random");
    anti_aim_defensive_sneak_selection_yaw_static:visibility(anti_aim_defensive_sneak_selection:get() == "Yaw" and anti_aim_defensive_sneak_selection_yaw:get() == "Static");
    local v103 = entity.get_local_player();
    local v104 = anti_aim_defensive_on:get() and rage.exploit:get() and anti_aim_on_manual:get() == "Disabled";
    if globals.is_in_game and v103:is_alive() and v86 == 2 and v104 then
        if anti_aim_defensive_sneak_selection_pitch:get() == "Switch" then
            if globals.tickcount % anti_aim_defensive_sneak_selection_pitch_switch_pitch_delay:get() > 5 then
                rage.antiaim:override_hidden_pitch(anti_aim_defensive_sneak_selection_pitch_switch_pitch_first:get());
            else
                rage.antiaim:override_hidden_pitch(anti_aim_defensive_sneak_selection_pitch_switch_pitch_second:get());
            end;
        end;
        if anti_aim_defensive_sneak_selection_pitch:get() == "Random" then
            rage.antiaim:override_hidden_pitch(math.random(anti_aim_defensive_sneak_selection_pitch_random_from:get(), anti_aim_defensive_sneak_selection_pitch_random_to:get()));
        end;
        if anti_aim_defensive_sneak_selection_yaw:get() == "Sideways" then
            if globals.tickcount % 3 == 0 then
                rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_sneak_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 1 then
                rage.antiaim:override_hidden_yaw_offset(-anti_aim_defensive_sneak_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 2 then
                rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_sneak_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 3 then
                rage.antiaim:override_hidden_yaw_offset(-anti_aim_defensive_sneak_selection_yaw_sideways:get());
            end;
        end;
        if anti_aim_defensive_sneak_selection_yaw:get() == "Spin" then
            rage.antiaim:override_hidden_yaw_offset(-math.fmod(globals.curtime * (anti_aim_defensive_sneak_selection_yaw_spin_speed:get() * 180), anti_aim_defensive_sneak_selection_yaw_spin_range:get() * 2) + anti_aim_defensive_sneak_selection_yaw_spin_range:get());
        end;
        if anti_aim_defensive_sneak_selection_yaw:get() == "Random" then
            rage.antiaim:override_hidden_yaw_offset(math.random(anti_aim_defensive_sneak_selection_yaw_random_from:get(), anti_aim_defensive_sneak_selection_yaw_random_to:get()));
        end;
        if anti_aim_defensive_sneak_selection_yaw:get() == "Neverlose" then

        end;
        if anti_aim_defensive_sneak_selection_yaw:get() == "Static" then
            rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_sneak_selection_yaw_static:get());
        end;
    end;
end);
events.render:set(function()
    -- upvalues: v86 (ref)
    anti_aim_defensive_inair:visibility(anti_aim_defensive_on:get());
    anti_aim_defensive_inair_gear:visibility(anti_aim_defensive_inair:get());
    anti_aim_defensive_inair_selection_pitch:visibility(anti_aim_defensive_inair_selection:get() == "Pitch");
    anti_aim_defensive_inair_selection_pitch_sideways_pitch:visibility(anti_aim_defensive_inair_selection:get() == "Pitch" and anti_aim_defensive_inair_selection_pitch:get() == "Sideways");
    anti_aim_defensive_inair_selection_pitch_switch_pitch_first:visibility(anti_aim_defensive_inair_selection:get() == "Pitch" and anti_aim_defensive_inair_selection_pitch:get() == "Switch");
    anti_aim_defensive_inair_selection_pitch_switch_pitch_second:visibility(anti_aim_defensive_inair_selection:get() == "Pitch" and anti_aim_defensive_inair_selection_pitch:get() == "Switch");
    anti_aim_defensive_inair_selection_pitch_switch_pitch_delay:visibility(anti_aim_defensive_inair_selection:get() == "Pitch" and anti_aim_defensive_inair_selection_pitch:get() == "Switch");
    anti_aim_defensive_inair_selection_pitch_random_from:visibility(anti_aim_defensive_inair_selection:get() == "Pitch" and anti_aim_defensive_inair_selection_pitch:get() == "Random");
    anti_aim_defensive_inair_selection_pitch_random_to:visibility(anti_aim_defensive_inair_selection:get() == "Pitch" and anti_aim_defensive_inair_selection_pitch:get() == "Random");
    anti_aim_defensive_inair_selection_yaw:visibility(anti_aim_defensive_inair_selection:get() == "Yaw");
    anti_aim_defensive_inair_selection_yaw_sideways:visibility(anti_aim_defensive_inair_selection:get() == "Yaw" and anti_aim_defensive_inair_selection_yaw:get() == "Sideways");
    anti_aim_defensive_inair_selection_yaw_spin_range:visibility(anti_aim_defensive_inair_selection:get() == "Yaw" and anti_aim_defensive_inair_selection_yaw:get() == "Spin");
    anti_aim_defensive_inair_selection_yaw_spin_speed:visibility(anti_aim_defensive_inair_selection:get() == "Yaw" and anti_aim_defensive_inair_selection_yaw:get() == "Spin");
    anti_aim_defensive_inair_selection_yaw_random_from:visibility(anti_aim_defensive_inair_selection:get() == "Yaw" and anti_aim_defensive_inair_selection_yaw:get() == "Random");
    anti_aim_defensive_inair_selection_yaw_random_to:visibility(anti_aim_defensive_inair_selection:get() == "Yaw" and anti_aim_defensive_inair_selection_yaw:get() == "Random");
    anti_aim_defensive_inair_selection_yaw_static:visibility(anti_aim_defensive_inair_selection:get() == "Yaw" and anti_aim_defensive_inair_selection_yaw:get() == "Static");
    local v105 = entity.get_local_player();
    local v106 = anti_aim_defensive_on:get() and rage.exploit:get() and anti_aim_on_manual:get() == "Disabled";
    if globals.is_in_game and v105:is_alive() and v86 == 4 and v106 then
        if anti_aim_defensive_inair_selection_pitch:get() == "Switch" then
            if globals.tickcount % anti_aim_defensive_inair_selection_pitch_switch_pitch_delay:get() > 5 then
                rage.antiaim:override_hidden_pitch(anti_aim_defensive_inair_selection_pitch_switch_pitch_first:get());
            else
                rage.antiaim:override_hidden_pitch(anti_aim_defensive_inair_selection_pitch_switch_pitch_second:get());
            end;
        end;
        if anti_aim_defensive_inair_selection_pitch:get() == "Random" then
            rage.antiaim:override_hidden_pitch(math.random(anti_aim_defensive_inair_selection_pitch_random_from:get(), anti_aim_defensive_inair_selection_pitch_random_to:get()));
        end;
        if anti_aim_defensive_inair_selection_yaw:get() == "Sideways" then
            if globals.tickcount % 3 == 0 then
                rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_inair_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 1 then
                rage.antiaim:override_hidden_yaw_offset(-anti_aim_defensive_inair_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 2 then
                rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_inair_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 3 then
                rage.antiaim:override_hidden_yaw_offset(-anti_aim_defensive_inair_selection_yaw_sideways:get());
            end;
        end;
        if anti_aim_defensive_inair_selection_yaw:get() == "Spin" then
            rage.antiaim:override_hidden_yaw_offset(-math.fmod(globals.curtime * (anti_aim_defensive_inair_selection_yaw_spin_speed:get() * 180), anti_aim_defensive_inair_selection_yaw_spin_range:get() * 2) + anti_aim_defensive_inair_selection_yaw_spin_range:get());
        end;
        if anti_aim_defensive_inair_selection_yaw:get() == "Random" then
            rage.antiaim:override_hidden_yaw_offset(math.random(anti_aim_defensive_inair_selection_yaw_random_from:get(), anti_aim_defensive_inair_selection_yaw_random_to:get()));
        end;
        if anti_aim_defensive_inair_selection_yaw:get() == "Neverlose" then

        end;
        if anti_aim_defensive_inair_selection_yaw:get() == "Static" then
            rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_inair_selection_yaw_static:get());
        end;
    end;
end);
events.render:set(function()
    -- upvalues: v86 (ref)
    anti_aim_defensive_aircrouch:visibility(anti_aim_defensive_on:get());
    anti_aim_defensive_aircrouch_gear:visibility(anti_aim_defensive_aircrouch:get());
    anti_aim_defensive_aircrouch_selection_pitch:visibility(anti_aim_defensive_aircrouch_selection:get() == "Pitch");
    anti_aim_defensive_aircrouch_selection_pitch_sideways_pitch:visibility(anti_aim_defensive_aircrouch_selection:get() == "Pitch" and anti_aim_defensive_aircrouch_selection_pitch:get() == "Sideways");
    anti_aim_defensive_aircrouch_selection_pitch_switch_pitch_first:visibility(anti_aim_defensive_aircrouch_selection:get() == "Pitch" and anti_aim_defensive_aircrouch_selection_pitch:get() == "Switch");
    anti_aim_defensive_aircrouch_selection_pitch_switch_pitch_second:visibility(anti_aim_defensive_aircrouch_selection:get() == "Pitch" and anti_aim_defensive_aircrouch_selection_pitch:get() == "Switch");
    anti_aim_defensive_aircrouch_selection_pitch_switch_pitch_delay:visibility(anti_aim_defensive_aircrouch_selection:get() == "Pitch" and anti_aim_defensive_aircrouch_selection_pitch:get() == "Switch");
    anti_aim_defensive_aircrouch_selection_pitch_random_from:visibility(anti_aim_defensive_aircrouch_selection:get() == "Pitch" and anti_aim_defensive_aircrouch_selection_pitch:get() == "Random");
    anti_aim_defensive_aircrouch_selection_pitch_random_to:visibility(anti_aim_defensive_aircrouch_selection:get() == "Pitch" and anti_aim_defensive_aircrouch_selection_pitch:get() == "Random");
    anti_aim_defensive_aircrouch_selection_yaw:visibility(anti_aim_defensive_aircrouch_selection:get() == "Yaw");
    anti_aim_defensive_aircrouch_selection_yaw_sideways:visibility(anti_aim_defensive_aircrouch_selection:get() == "Yaw" and anti_aim_defensive_aircrouch_selection_yaw:get() == "Sideways");
    anti_aim_defensive_aircrouch_selection_yaw_spin_range:visibility(anti_aim_defensive_aircrouch_selection:get() == "Yaw" and anti_aim_defensive_aircrouch_selection_yaw:get() == "Spin");
    anti_aim_defensive_aircrouch_selection_yaw_spin_speed:visibility(anti_aim_defensive_aircrouch_selection:get() == "Yaw" and anti_aim_defensive_aircrouch_selection_yaw:get() == "Spin");
    anti_aim_defensive_aircrouch_selection_yaw_random_from:visibility(anti_aim_defensive_aircrouch_selection:get() == "Yaw" and anti_aim_defensive_aircrouch_selection_yaw:get() == "Random");
    anti_aim_defensive_aircrouch_selection_yaw_random_to:visibility(anti_aim_defensive_aircrouch_selection:get() == "Yaw" and anti_aim_defensive_aircrouch_selection_yaw:get() == "Random");
    anti_aim_defensive_aircrouch_selection_yaw_static:visibility(anti_aim_defensive_aircrouch_selection:get() == "Yaw" and anti_aim_defensive_aircrouch_selection_yaw:get() == "Static");
    local v107 = entity.get_local_player();
    local v108 = anti_aim_defensive_on:get() and rage.exploit:get() and anti_aim_on_manual:get() == "Disabled";
    if globals.is_in_game and v107:is_alive() and v86 == 5 and v108 then
        if anti_aim_defensive_aircrouch_selection_pitch:get() == "Switch" then
            if globals.tickcount % anti_aim_defensive_aircrouch_selection_pitch_switch_pitch_delay:get() > 5 then
                rage.antiaim:override_hidden_pitch(anti_aim_defensive_aircrouch_selection_pitch_switch_pitch_first:get());
            else
                rage.antiaim:override_hidden_pitch(anti_aim_defensive_aircrouch_selection_pitch_switch_pitch_second:get());
            end;
        end;
        if anti_aim_defensive_aircrouch_selection_pitch:get() == "Random" then
            rage.antiaim:override_hidden_pitch(math.random(anti_aim_defensive_aircrouch_selection_pitch_random_from:get(), anti_aim_defensive_aircrouch_selection_pitch_random_to:get()));
        end;
        if anti_aim_defensive_aircrouch_selection_yaw:get() == "Sideways" then
            if globals.tickcount % 3 == 0 then
                rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_aircrouch_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 1 then
                rage.antiaim:override_hidden_yaw_offset(-anti_aim_defensive_aircrouch_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 2 then
                rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_aircrouch_selection_yaw_sideways:get());
            elseif globals.tickcount % 3 == 3 then
                rage.antiaim:override_hidden_yaw_offset(-anti_aim_defensive_aircrouch_selection_yaw_sideways:get());
            end;
        end;
        if anti_aim_defensive_aircrouch_selection_yaw:get() == "Spin" then
            rage.antiaim:override_hidden_yaw_offset(-math.fmod(globals.curtime * (anti_aim_defensive_aircrouch_selection_yaw_spin_speed:get() * 180), anti_aim_defensive_aircrouch_selection_yaw_spin_range:get() * 2) + anti_aim_defensive_aircrouch_selection_yaw_spin_range:get());
        end;
        if anti_aim_defensive_aircrouch_selection_yaw:get() == "Random" then
            rage.antiaim:override_hidden_yaw_offset(math.random(anti_aim_defensive_aircrouch_selection_yaw_random_from:get(), anti_aim_defensive_aircrouch_selection_yaw_random_to:get()));
        end;
        if anti_aim_defensive_aircrouch_selection_yaw:get() == "Neverlose" then

        end;
        if anti_aim_defensive_aircrouch_selection_yaw:get() == "Static" then
            rage.antiaim:override_hidden_yaw_offset(anti_aim_defensive_aircrouch_selection_yaw_static:get());
        end;
    end;
end);
events.render:set(function()
    -- upvalues: v37 (ref), v8 (ref)
    local v109 = entity.get_local_player();
    if globals.is_in_game and v109:is_alive() then
        if v37:get() == "On" then
            v8.other.avoid_backstab:override(true);
        else
            v8.other.avoid_backstab:override(false);
        end;
        if anti_aim_defensive_always_on:get() then
            v8.other.lag_options:override("Always On");
        else
            v8.other.lag_options:override();
        end;
    end;
end);
local v110 = 1;
local v111 = 0;
events.post_update_clientside_animation:set(function()
    -- upvalues: v35 (ref), v8 (ref), v34 (ref), v36 (ref), v110 (ref), v111 (ref)
    local v112 = entity.get_local_player();
    local v113 = bit.band(v112.m_fFlags, bit.lshift(1, 0)) ~= 0;
    if globals.is_in_game and v112:is_alive() then
        if v35:get() == "Off" then
            v8.other.legs:override();
        end;
        if v35:get() == "Static" then
            v112.m_flPoseParameter[0] = 1;
            v8.other.legs:override("Sliding");
        end;
        if v35:get() == "Jitter" then
            v112.m_flPoseParameter[0] = globals.tickcount % 3 > 1 and 0.5 or 1;
            v8.other.legs:override("Sliding");
        end;
        if v35:get() == "Allah" then
            v112.m_flPoseParameter[7] = 1;
            v8.other.legs:override("Walking");
        end;
        if v34:get() == "Static" then
            v112.m_flPoseParameter[6] = 1;
        end;
        if v34:get() == "Jitter" then
            v112.m_flPoseParameter[6] = globals.tickcount % 3 > 1 and 0.3 or 1;
        end;
        if v36:get(1) then
            if v113 == true then
                v110 = v110 + 1;
            else
                v110 = 0;
                v111 = globals.curtime + 0.9;
            end;
            if v110 > 1 and v111 > globals.curtime then
                v112.m_flPoseParameter[12] = 0.5;
            end;
        end;
        if v36:get(2) then
            v112.m_flPoseParameter[8] = 0;
        end;
        if v36:get(3) then
            v112.m_flPoseParameter[9] = 0;
        end;
    end;
end);
local v114 = render.load_font("nl\\fragment\\Verdana Bold.ttf", 12, "a");
local v115 = render.load_font("nl\\fragment\\Smallest Pixel-7.ttf", 10, "o");
local function v119(v116, v117, v118)
    return v117 * (1 - v116) + v118 * v116;
end;
local v120 = 0;
local v121 = 0;
events.render:set(function()
    -- upvalues: v40 (ref), v38 (ref), v121 (ref), v120 (ref), v119 (ref), l_gradient_0 (ref), v41 (ref), v42 (ref), v114 (ref), v86 (ref), v115 (ref), v8 (ref), l_exploits_0 (ref)
    local v122 = entity.get_local_player();
    local v123 = render.screen_size().x / 2;
    local v124 = render.screen_size().y / 2;
    local v125 = v40:get();
    local v126 = 0;
    local _ = 0;
    if v38:get() and globals.is_in_game and v122:is_alive() then
        if v122.m_bIsScoped then
            v121 = 28 + v125;
        else
            v121 = 0;
        end;
        v120 = v119(0.12, v120, v121);
        local v128 = l_gradient_0.text_animate("fragment", -1, {
            v41:get(), 
            v42:get()
        });
        v128:animate();
        render.text(v114, vector(v123 - 27 + v120, v124 + v125 + v126), color(255, 255, 255), nil, v128:get_animated_text());
        v126 = v126 + 10;
        if v86 == 1 then
            render.text(v115, vector(v123 - 16 + v120, v124 + v125 + v126), color(220, 220, 220, 255), nil, "CROUCH");
            v126 = v126 + 9;
        end;
        if v86 == 2 then
            render.text(v115, vector(v123 - 14 + v120, v124 + v125 + v126), color(220, 220, 220, 255), nil, "SNEAK");
            v126 = v126 + 9;
        end;
        if v86 == 3 then
            render.text(v115, vector(v123 - 12 + v120, v124 + v125 + v126), color(220, 220, 220, 255), nil, "STAND");
            v126 = v126 + 9;
        end;
        if v86 == 4 then
            render.text(v115, vector(v123 - 14 + v120, v124 + v125 + v126), color(220, 220, 220, 255), nil, "IN-AIR");
            v126 = v126 + 9;
        end;
        if v86 == 5 then
            render.text(v115, vector(v123 - 12 + v120, v124 + v125 + v126), color(220, 220, 220, 255), nil, "AIR-C");
            v126 = v126 + 9;
        end;
        if v86 == 6 then
            render.text(v115, vector(v123 - 11 + v120, v124 + v125 + v126), color(220, 220, 220, 255), nil, "SLOW");
            v126 = v126 + 9;
        end;
        if v86 == 7 then
            render.text(v115, vector(v123 - 11 + v120, v124 + v125 + v126), color(220, 220, 220, 255), nil, "MOVE");
            v126 = v126 + 9;
        end;
        if v8.binds.doubletap:get() and l_exploits_0.Ready() then
            render.text(v115, vector(v123 - 4 + v120, v124 + v125 + v126), color(0, 160, 0, 255), nil, "DT");
            v126 = v126 + 9;
        elseif v8.binds.doubletap:get() and l_exploits_0.InRecharge() then
            render.text(v115, vector(v123 - 4 + v120, v124 + v125 + v126), color(160, 0, 0, 255), nil, "DT");
            v126 = v126 + 9;
        end;
        if v8.binds.hideshots:get() and not v8.binds.doubletap:get() then
            render.text(v115, vector(v123 - 5 + v120, v124 + v125 + v126), color(0, 160, 0, 255), nil, "OS");
            v126 = v126 + 9;
        end;
    end;
end);
events.render:set(function()
    -- upvalues: v43 (ref), v45 (ref), v46 (ref), v8 (ref), v115 (ref)
    local v129 = entity.get_local_player();
    local v130 = render.screen_size().x / 2;
    local v131 = render.screen_size().y / 2;
    if v43:get() and globals.is_in_game and v129:is_alive() then
        if v45:get() == "Verdana" then
            render.text(1, vector(v130 + 5, v131 - 15), v46:get(), nil, tostring(v8.binds.override_damage:get()));
        end;
        if v45:get() == "Pixel" then
            render.text(v115, vector(v130 + 5, v131 - 15), v46:get(), nil, tostring(v8.binds.override_damage:get()));
        end;
    end;
end);
events.round_start:set(function()
    -- upvalues: v84 (ref)
    if v84:get(4) and globals.is_in_game then
        common.set_clan_tag("\226\156\168 Fragment");
    end;
    if not v84:get(4) and globals.is_in_game then
        common.set_clan_tag("");
    end;
end);
events.render:set(function()
    -- upvalues: v75 (ref), v77 (ref), v78 (ref), v79 (ref)
    if v75:get() then
        if v77:get() then
            utils.console_exec("r_cleardecals");
        end;
        if v78:get() then
            cvar.cl_foot_contact_shadows:int(0);
        else
            cvar.cl_foot_contact_shadows:int(1);
        end;
        if v79:get() and v75:get() then
            cvar.r_shadows:int(0);
            cvar.cl_csm_static_prop_shadows:int(0);
            cvar.cl_csm_shadows:int(0);
            cvar.cl_csm_world_shadows:int(0);
            cvar.cl_csm_viewmodel_shadows:int(0);
            cvar.cl_csm_rope_shadows:int(0);
            cvar.cl_csm_sprite_shadows:int(0);
            cvar.r_dynamic:int(0);
            cvar.cl_autohelp:int(0);
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
            cvar.cl_bob_lower_amt:int(0);
            cvar.cl_detail_multiplier:int(0);
            cvar.mat_drawwater:int(0);
        else
            cvar.r_shadows:int(1);
            cvar.cl_csm_static_prop_shadows:int(1);
            cvar.cl_csm_shadows:int(1);
            cvar.cl_csm_world_shadows:int(1);
            cvar.cl_csm_viewmodel_shadows:int(1);
            cvar.cl_csm_rope_shadows:int(1);
            cvar.cl_csm_sprite_shadows:int(1);
            cvar.r_dynamic:int(1);
            cvar.cl_autohelp:int(1);
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
            cvar.cl_bob_lower_amt:int(1);
            cvar.cl_detail_multiplier:int(1);
            cvar.mat_drawwater:int(1);
        end;
    end;
end);
events.round_start:set(function()
    -- upvalues: v84 (ref)
    if v84:get(3) then
        utils.console_exec("clear");
    end;
end);
events.cs_win_panel_match:set(function()
    -- upvalues: v84 (ref)
    if v84:get(1) then
        utils.console_exec("disconnect");
    end;
end);
events.render:set(function()
    -- upvalues: v52 (ref), v54 (ref), v55 (ref)
    local v132 = entity.get_local_player();
    local v133 = entity.get_threat();
    local v134 = render.screen_size().x / 2;
    local v135 = render.screen_size().y / 2;
    if v52:get() and not v54:get() and globals.is_in_game and v132:is_alive() then
        for _, v137 in ipairs(entity.get_players(true, false)) do
            if v137:is_alive() then
                render.line(vector(v134, v135), render.world_to_screen(v137:get_hitbox_position(1)), v55:get());
            end;
        end;
    end;
    if v52:get() and v54:get() and globals.is_in_game and v132:is_alive() and v133 then
        render.line(vector(v134, v135), render.world_to_screen(v133:get_hitbox_position(1)), v55:get());
    end;
end);
events.render:set(function()
    -- upvalues: v56 (ref), v58 (ref), v59 (ref), v60 (ref), v61 (ref)
    if v56:get() then
        cvar.viewmodel_fov:int(v58:get(), true);
        cvar.viewmodel_offset_x:float(v59:get(), true);
        cvar.viewmodel_offset_y:float(v60:get(), true);
        cvar.viewmodel_offset_z:float(v61:get(), true);
    else
        cvar.viewmodel_fov:int(68);
        cvar.viewmodel_offset_x:float(2.5);
        cvar.viewmodel_offset_y:float(0);
        cvar.viewmodel_offset_z:float(-1.5);
    end;
end);
local v138 = 0;
local v139 = 0;
events.render:set(function()
    -- upvalues: v62 (ref), v138 (ref), v119 (ref), v66 (ref), v139 (ref), v67 (ref), v65 (ref), v64 (ref)
    local v140 = render.screen_size().x / 2;
    local v141 = render.screen_size().y / 2;
    local v142 = entity.get_local_player();
    if not v62:get() and globals.is_in_game then
        ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):set("Remove Overlay");
    end;
    if v62:get() and globals.is_in_game and v142:is_alive() then
        ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):set("Remove All");
        v138 = v119(0.1, v138, v142.m_bIsScoped and v66:get() or 0);
        v139 = v119(0.1, v139, v142.m_bIsScoped and v67:get() or 0);
        local v143 = color(v65:get().r, v65:get().g, v65:get().b, v65:get().a);
        if v64:get() then
            custom_scope_color_y = color(v65:get().r, v65:get().g, v65:get().b, 0);
        else
            custom_scope_color_y = color(v65:get().r, v65:get().g, v65:get().b, v65:get().a);
        end;
        render.gradient(vector(v140 - v139, v141), vector(v140 - v139 - v138, v141 + 1), v143, custom_scope_color_y, v143, custom_scope_color_y);
        render.gradient(vector(v140 + v139, v141), vector(v140 + v139 + v138, v141 + 1), v143, custom_scope_color_y, v143, custom_scope_color_y);
        render.gradient(vector(v140, v141 + v139), vector(v140 + 1, v141 + v139 + v138), v143, v143, custom_scope_color_y, custom_scope_color_y);
        render.gradient(vector(v140, v141 - v139), vector(v140 + 1, v141 - v139 - v138), v143, v143, custom_scope_color_y, custom_scope_color_y);
    end;
end);
events.render:set(function()
    -- upvalues: v68 (ref), v69 (ref)
    if v68:get() then
        cvar.r_aspectratio:float(v69:get() / 100);
    else
        cvar.r_aspectratio:float(0);
    end;
end);
events.render:set(function()
    -- upvalues: v72 (ref)
    if v72:get() then
        utils.console_exec("cl_drawhud_force_radar -1");
    else
        utils.console_exec("cl_drawhud_force_radar 1");
    end;
end);
local function v147(v144)
    -- upvalues: v10 (ref), v73 (ref), v74 (ref), v9 (ref)
    local v145 = entity.get_local_player();
    local v146 = v10[v144.state] or v144.state;
    if v73:get() and v74:get() == "Short" and globals.is_in_game and v145:is_alive() then
        print_dev("\ac2c2c20 Fragment \226\151\143 \ac489890 missed \ac2c2c20 '" .. v144.target:get_name() .. "' due to \ac489890 " .. v146 .. " \ac2c2c20 (hitbox: \ac489890 " .. v9[v144.wanted_hitgroup] .. " \ac2c2c20 | backtrack: \ac489890 " .. v144.backtrack .. "t\ac2c2c20 )");
        print_raw("\ac2c2c20 Fragment \226\151\143 \ac489890 missed \ac2c2c20 '" .. v144.target:get_name() .. "' due to \ac489890 " .. v146 .. " \ac2c2c20 (hitbox: \ac489890 " .. v9[v144.wanted_hitgroup] .. " \ac2c2c20 | backtrack: \ac489890 " .. v144.backtrack .. "t\ac2c2c20 )");
    end;
    if v73:get() and v74:get() == "Full" and globals.is_in_game and v145:is_alive() then
        print_dev("\ac2c2c20 Fragment \226\151\143 \ac489890 missed \ac2c2c20 '" .. v144.target:get_name() .. "' due to \ac489890 " .. v146 .. " \ac2c2c20 (expected: \ac489890 " .. v9[v144.wanted_hitgroup] .. " \ac2c2c20 and \ac489890 " .. v144.wanted_damage .. " \ac2c2c20 damage | backtrack: \ac489890 " .. v144.backtrack .. "t\ac2c2c20 )");
        print_raw("\ac2c2c20 Fragment \226\151\143 \ac489890 missed \ac2c2c20 '" .. v144.target:get_name() .. "' due to \ac489890 " .. v146 .. " \ac2c2c20 (expected: \ac489890 " .. v9[v144.wanted_hitgroup] .. " \ac2c2c20 and \ac489890 " .. v144.wanted_damage .. " \ac2c2c20 damage | backtrack: \ac489890 " .. v144.backtrack .. "t\ac2c2c20 )");
    end;
end;
local function v150(v148)
    -- upvalues: v73 (ref), v74 (ref), v9 (ref)
    local v149 = entity.get_local_player();
    if v73:get() and v74:get() == "Short" and globals.is_in_game and v149:is_alive() then
        print_dev("\ac2c2c20 Fragment \226\151\143 \a8fc4890 hitted \ac2c2c20 '" .. v148.target:get_name() .. "' for \a8fc4890 " .. v148.damage .. " \ac2c2c20 damage (hitbox: \a8fc4890 " .. v9[v148.hitgroup] .. " \ac2c2c20 | backtrack: \a8fc4890 " .. v148.backtrack .. "t\ac2c2c20 )");
        print_raw("\ac2c2c20 Fragment \226\151\143 \a8fc4890 hitted \ac2c2c20 '" .. v148.target:get_name() .. "' for \a8fc4890 " .. v148.damage .. " \ac2c2c20 damage (hitbox: \a8fc4890 " .. v9[v148.hitgroup] .. " \ac2c2c20 | backtrack: \a8fc4890 " .. v148.backtrack .. "t\ac2c2c20 )");
    end;
    if v73:get() and v74:get() == "Full" and globals.is_in_game and v149:is_alive() then
        print_dev("\ac2c2c20 Fragment \226\151\143 \a8fc4890 hitted \ac2c2c20 '" .. v148.target:get_name() .. "' for \a8fc4890 " .. v148.damage .. " \ac2c2c20 damage (hitbox: \a8fc4890 " .. v9[v148.hitgroup] .. "\ac2c2c20 /\a8fc4890 " .. v9[v148.wanted_hitgroup] .. " \ac2c2c20 | expected: \a8fc4890 " .. v148.wanted_damage .. " \ac2c2c20 damage | backtrack: \a8fc4890 " .. v148.backtrack .. "t\ac2c2c20 )");
        print_raw("\ac2c2c20 Fragment \226\151\143 \a8fc4890 hitted \ac2c2c20 '" .. v148.target:get_name() .. "' for \a8fc4890 " .. v148.damage .. " \ac2c2c20 damage (hitbox: \a8fc4890 " .. v9[v148.hitgroup] .. "\ac2c2c20 /\a8fc4890 " .. v9[v148.wanted_hitgroup] .. " \ac2c2c20 | expected: \a8fc4890 " .. v148.wanted_damage .. " \ac2c2c20 damage | backtrack: \a8fc4890 " .. v148.backtrack .. "t\ac2c2c20 )");
    end;
end;
events.aim_ack:set(function(v151)
    -- upvalues: v147 (ref), v150 (ref)
    (v151.state and v147 or v150)(v151);
end);
events.player_death:set(function(v152)
    -- upvalues: v84 (ref), v8 (ref)
    local v153 = entity.get_local_player();
    if v84:get(2) and globals.is_in_game and v153:is_alive() then
        local v154 = entity.get(v152.attacker, true);
        local v155 = entity.get(v152.userid, true);
        if v153 == v154 and v155 ~= v153 then
            utils.execute_after(2, utils.console_exec, "say " .. v8.killsay_phrases[math.random(1, #v8.killsay_phrases)]);
        end;
        if v155 == v153 and v154:get_name() ~= "CWorld" then
            utils.execute_after(2, utils.console_exec, "say " .. v8.on_death_phrases[math.random(1, #v8.on_death_phrases)]);
        end;
    end;
end);
events.render:set(function()
    -- upvalues: v47 (ref), l_gradient_0 (ref), v50 (ref), v51 (ref), v49 (ref), v115 (ref), v86 (ref), v1 (ref)
    local v156 = entity.get_local_player();
    local v157 = render.screen_size().x / 2;
    local v158 = render.screen_size().y / 2;
    if v47:get() and globals.is_in_game then
        local v159 = l_gradient_0.text_animate("Fragment.lua", -1, {
            v50:get(), 
            v51:get()
        });
        v159:animate();
        if v49:get() == "Bottom" then
            render.text(v115, vector(v157 - 28, v158 * 1.97), color(255, 255, 255), nil, v159:get_animated_text());
        end;
        if v49:get() == "Left" then
            local v160 = {};
            if v86 == 1 then
                v160 = "Crouch";
            end;
            if v86 == 2 then
                v160 = "Sneak";
            end;
            if v86 == 3 then
                v160 = "Stand";
            end;
            if v86 == 4 then
                v160 = "In-Air";
            end;
            if v86 == 5 then
                v160 = "Air-C";
            end;
            if v86 == 6 then
                v160 = "Slow";
            end;
            if v86 == 7 then
                v160 = "Move";
            end;
            if not v156:is_alive() then
                v160 = "Nil";
            end;
            render.blur(vector(15, v158 / 1.2 - 4), vector(172, v158 / 1.2 + 35), 5, 0.7, 4);
            render.texture(v156:get_steam_avatar(), vector(20, v158 / 1.2), vector(30, 30), color(), 4);
            render.text(1, vector(55, v158 / 1.2 + 2), color(255, 255, 255, 255), "", v159:get_animated_text());
            render.text(1, vector(123, v158 / 1.2 + 2), color(255, 255, 255), "", v1);
            render.text(1, vector(56, v158 / 1.2 + 14), color(255, 255, 255), "", "Condition - " .. v160);
        end;
    end;
end);
events.createmove:set(function(v161)
    -- upvalues: v81 (ref), v80 (ref), v8 (ref)
    if entity.get_local_player() and globals.is_in_game then
        local v162 = vector(v161.forwardmove, 0, v161.sidemove);
        v162:normalize();
        v162 = v162:scale(v81:get());
        if v80:get() and v8.binds.slowmotion:get() then
            v161.forwardmove = v162.x;
            v161.sidemove = v162.z;
        end;
    end;
end);
events.render:set(function()
    -- upvalues: v70 (ref), v71 (ref)
    local v163 = entity.get_local_player();
    if v163 and globals.is_in_game and v70:get() then
        local v164 = v163:get_player_weapon();
        if not v164 then
            return;
        else
            local v165 = v164:get_weapon_info();
            local v166 = v165.weapon_type == 0;
            local v167 = v165.weapon_type ~= 0;
            if v71:get() == "Left" then
                if v167 then
                    utils.console_exec("cl_righthand 1");
                end;
                if v166 then
                    utils.console_exec("cl_righthand 0");
                end;
            end;
            if v71:get() == "Right" then
                if v167 then
                    utils.console_exec("cl_righthand 0");
                end;
                if v166 then
                    utils.console_exec("cl_righthand 1");
                end;
            end;
        end;
    end;
end);
events.round_start:set(function()
    -- upvalues: v82 (ref), v83 (ref), v8 (ref)
    if v82:get() and globals.is_in_game then
        if v83:get() <= 100 then
            utils.console_exec("sv_maxunlag 0.2");
            v8.other.fake_latency:set(v83:get());
        end;
        if v83:get() >= 101 and v83:get() <= 150 then
            utils.console_exec("sv_maxunlag 0.3");
            v8.other.fake_latency:set(v83:get());
        end;
        if v83:get() >= 151 and v83:get() <= 200 then
            utils.console_exec("sv_maxunlag 0.4");
            v8.other.fake_latency:set(v83:get());
        end;
    end;
    if not v82:get() then
        v8.other.fake_latency:override();
    end;
end);
local v168 = {
    everything = {
        [1] = v34, 
        [2] = v35, 
        [3] = v36, 
        [4] = v37, 
        [5] = anti_aim_defensive_on, 
        [6] = anti_aim_defensive_always_on, 
        [7] = anti_aim_defensive_stand, 
        [8] = anti_aim_defensive_stand_selection, 
        [9] = anti_aim_defensive_stand_selection_pitch, 
        [10] = anti_aim_defensive_stand_selection_pitch_sideways_pitch, 
        [11] = anti_aim_defensive_stand_selection_pitch_switch_pitch_first, 
        [12] = anti_aim_defensive_stand_selection_pitch_switch_pitch_second, 
        [13] = anti_aim_defensive_stand_selection_pitch_switch_pitch_delay, 
        [14] = anti_aim_defensive_stand_selection_pitch_random_from, 
        [15] = anti_aim_defensive_stand_selection_pitch_random_to, 
        [16] = anti_aim_defensive_stand_selection_yaw, 
        [17] = anti_aim_defensive_stand_selection_yaw_sideways, 
        [18] = anti_aim_defensive_stand_selection_yaw_spin_range, 
        [19] = anti_aim_defensive_stand_selection_yaw_spin_speed, 
        [20] = anti_aim_defensive_stand_selection_yaw_random_from, 
        [21] = anti_aim_defensive_stand_selection_yaw_random_to, 
        [22] = anti_aim_defensive_stand_selection_yaw_static, 
        [23] = anti_aim_defensive_move, 
        [24] = anti_aim_defensive_move_selection, 
        [25] = anti_aim_defensive_move_selection_pitch, 
        [26] = anti_aim_defensive_move_selection_pitch_sideways_pitch, 
        [27] = anti_aim_defensive_move_selection_pitch_switch_pitch_first, 
        [28] = anti_aim_defensive_move_selection_pitch_switch_pitch_second, 
        [29] = anti_aim_defensive_move_selection_pitch_switch_pitch_delay, 
        [30] = anti_aim_defensive_move_selection_pitch_random_from, 
        [31] = anti_aim_defensive_move_selection_pitch_random_to, 
        [32] = anti_aim_defensive_move_selection_yaw, 
        [33] = anti_aim_defensive_move_selection_yaw_sideways, 
        [34] = anti_aim_defensive_move_selection_yaw_spin_range, 
        [35] = anti_aim_defensive_move_selection_yaw_spin_speed, 
        [36] = anti_aim_defensive_move_selection_yaw_random_from, 
        [37] = anti_aim_defensive_move_selection_yaw_random_to, 
        [38] = anti_aim_defensive_move_selection_yaw_static, 
        [39] = anti_aim_defensive_slowmotion, 
        [40] = anti_aim_defensive_slowmotion_selection, 
        [41] = anti_aim_defensive_slowmotion_selection_pitch, 
        [42] = anti_aim_defensive_slowmotion_selection_pitch_sideways_pitch, 
        [43] = anti_aim_defensive_slowmotion_selection_pitch_switch_pitch_first, 
        [44] = anti_aim_defensive_slowmotion_selection_pitch_switch_pitch_second, 
        [45] = anti_aim_defensive_slowmotion_selection_pitch_switch_pitch_delay, 
        [46] = anti_aim_defensive_slowmotion_selection_pitch_random_from, 
        [47] = anti_aim_defensive_slowmotion_selection_pitch_random_to, 
        [48] = anti_aim_defensive_slowmotion_selection_yaw, 
        [49] = anti_aim_defensive_slowmotion_selection_yaw_sideways, 
        [50] = anti_aim_defensive_slowmotion_selection_yaw_spin_range, 
        [51] = anti_aim_defensive_slowmotion_selection_yaw_spin_speed, 
        [52] = anti_aim_defensive_slowmotion_selection_yaw_random_from, 
        [53] = anti_aim_defensive_slowmotion_selection_yaw_random_to, 
        [54] = anti_aim_defensive_slowmotion_selection_yaw_static, 
        [55] = anti_aim_defensive_crouch, 
        [56] = anti_aim_defensive_crouch_selection, 
        [57] = anti_aim_defensive_crouch_selection_pitch, 
        [58] = anti_aim_defensive_crouch_selection_pitch_sideways_pitch, 
        [59] = anti_aim_defensive_crouch_selection_pitch_switch_pitch_first, 
        [60] = anti_aim_defensive_crouch_selection_pitch_switch_pitch_second, 
        [61] = anti_aim_defensive_crouch_selection_pitch_switch_pitch_delay, 
        [62] = anti_aim_defensive_crouch_selection_pitch_random_from, 
        [63] = anti_aim_defensive_crouch_selection_pitch_random_to, 
        [64] = anti_aim_defensive_crouch_selection_yaw, 
        [65] = anti_aim_defensive_crouch_selection_yaw_sideways, 
        [66] = anti_aim_defensive_crouch_selection_yaw_spin_range, 
        [67] = anti_aim_defensive_crouch_selection_yaw_spin_speed, 
        [68] = anti_aim_defensive_crouch_selection_yaw_random_from, 
        [69] = anti_aim_defensive_crouch_selection_yaw_random_to, 
        [70] = anti_aim_defensive_crouch_selection_yaw_static, 
        [71] = anti_aim_defensive_sneak, 
        [72] = anti_aim_defensive_sneak_selection, 
        [73] = anti_aim_defensive_sneak_selection_pitch, 
        [74] = anti_aim_defensive_sneak_selection_pitch_sideways_pitch, 
        [75] = anti_aim_defensive_sneak_selection_pitch_switch_pitch_first, 
        [76] = anti_aim_defensive_sneak_selection_pitch_switch_pitch_second, 
        [77] = anti_aim_defensive_sneak_selection_pitch_switch_pitch_delay, 
        [78] = anti_aim_defensive_sneak_selection_pitch_random_from, 
        [79] = anti_aim_defensive_sneak_selection_pitch_random_to, 
        [80] = anti_aim_defensive_sneak_selection_yaw, 
        [81] = anti_aim_defensive_sneak_selection_yaw_sideways, 
        [82] = anti_aim_defensive_sneak_selection_yaw_spin_range, 
        [83] = anti_aim_defensive_sneak_selection_yaw_spin_speed, 
        [84] = anti_aim_defensive_sneak_selection_yaw_random_from, 
        [85] = anti_aim_defensive_sneak_selection_yaw_random_to, 
        [86] = anti_aim_defensive_sneak_selection_yaw_static, 
        [87] = anti_aim_defensive_inair, 
        [88] = anti_aim_defensive_inair_selection, 
        [89] = anti_aim_defensive_inair_selection_pitch, 
        [90] = anti_aim_defensive_inair_selection_pitch_sideways_pitch, 
        [91] = anti_aim_defensive_inair_selection_pitch_switch_pitch_first, 
        [92] = anti_aim_defensive_inair_selection_pitch_switch_pitch_second, 
        [93] = anti_aim_defensive_inair_selection_pitch_switch_pitch_delay, 
        [94] = anti_aim_defensive_inair_selection_pitch_random_from, 
        [95] = anti_aim_defensive_inair_selection_pitch_random_to, 
        [96] = anti_aim_defensive_inair_selection_yaw, 
        [97] = anti_aim_defensive_inair_selection_yaw_sideways, 
        [98] = anti_aim_defensive_inair_selection_yaw_spin_range, 
        [99] = anti_aim_defensive_inair_selection_yaw_spin_speed, 
        [100] = anti_aim_defensive_inair_selection_yaw_random_from, 
        [101] = anti_aim_defensive_inair_selection_yaw_random_to, 
        [102] = anti_aim_defensive_inair_selection_yaw_static, 
        [103] = anti_aim_defensive_aircrouch, 
        [104] = anti_aim_defensive_aircrouch_selection, 
        [105] = anti_aim_defensive_aircrouch_selection_pitch, 
        [106] = anti_aim_defensive_aircrouch_selection_pitch_sideways_pitch, 
        [107] = anti_aim_defensive_aircrouch_selection_pitch_switch_pitch_first, 
        [108] = anti_aim_defensive_aircrouch_selection_pitch_switch_pitch_second, 
        [109] = anti_aim_defensive_aircrouch_selection_pitch_switch_pitch_delay, 
        [110] = anti_aim_defensive_aircrouch_selection_pitch_random_from, 
        [111] = anti_aim_defensive_aircrouch_selection_pitch_random_to, 
        [112] = anti_aim_defensive_aircrouch_selection_yaw, 
        [113] = anti_aim_defensive_aircrouch_selection_yaw_sideways, 
        [114] = anti_aim_defensive_aircrouch_selection_yaw_spin_range, 
        [115] = anti_aim_defensive_aircrouch_selection_yaw_spin_speed, 
        [116] = anti_aim_defensive_aircrouch_selection_yaw_random_from, 
        [117] = anti_aim_defensive_aircrouch_selection_yaw_random_to, 
        [118] = anti_aim_defensive_aircrouch_selection_yaw_static, 
        [119] = anti_aim_on, 
        [120] = anti_aim_stand, 
        [121] = anti_aim_move, 
        [122] = anti_aim_slowmotion, 
        [123] = anti_aim_crouch, 
        [124] = anti_aim_sneak, 
        [125] = anti_aim_inair, 
        [126] = anti_aim_aircrouch, 
        [127] = pitch_stand, 
        [128] = yaw_stand, 
        [129] = base_stand, 
        [130] = offset_stand, 
        [131] = yaw_modifier_stand, 
        [132] = modifier_offset_stand, 
        [133] = body_yaw_stand, 
        [134] = inverter_stand, 
        [135] = left_limit_stand, 
        [136] = right_limit_stand, 
        [137] = options_stand, 
        [138] = body_yaw_freestanding_stand, 
        [139] = pitch_move, 
        [140] = yaw_move, 
        [141] = base_move, 
        [142] = offset_move, 
        [143] = yaw_modifier_move, 
        [144] = modifier_offset_move, 
        [145] = body_yaw_move, 
        [146] = inverter_move, 
        [147] = left_limit_move, 
        [148] = right_limit_move, 
        [149] = options_move, 
        [150] = body_yaw_freestanding_move, 
        [151] = pitch_slowmotion, 
        [152] = yaw_slowmotion, 
        [153] = base_slowmotion, 
        [154] = offset_slowmotion, 
        [155] = yaw_modifier_slowmotion, 
        [156] = modifier_offset_slowmotion, 
        [157] = body_yaw_slowmotion, 
        [158] = inverter_slowmotion, 
        [159] = left_limit_slowmotion, 
        [160] = right_limit_slowmotion, 
        [161] = options_slowmotion, 
        [162] = body_yaw_freestanding_slowmotion, 
        [163] = pitch_crouch, 
        [164] = yaw_crouch, 
        [165] = base_crouch, 
        [166] = offset_crouch, 
        [167] = yaw_modifier_crouch, 
        [168] = modifier_offset_crouch, 
        [169] = body_yaw_crouch, 
        [170] = inverter_crouch, 
        [171] = left_limit_crouch, 
        [172] = right_limit_crouch, 
        [173] = options_crouch, 
        [174] = body_yaw_freestanding_crouch, 
        [175] = pitch_sneak, 
        [176] = yaw_sneak, 
        [177] = base_sneak, 
        [178] = offset_sneak, 
        [179] = yaw_modifier_sneak, 
        [180] = modifier_offset_sneak, 
        [181] = body_yaw_sneak, 
        [182] = inverter_sneak, 
        [183] = left_limit_sneak, 
        [184] = right_limit_sneak, 
        [185] = options_sneak, 
        [186] = body_yaw_freestanding_sneak, 
        [187] = pitch_inair, 
        [188] = yaw_inair, 
        [189] = base_inair, 
        [190] = offset_inair, 
        [191] = yaw_modifier_inair, 
        [192] = modifier_offset_inair, 
        [193] = body_yaw_inair, 
        [194] = inverter_inair, 
        [195] = left_limit_inair, 
        [196] = right_limit_inair, 
        [197] = options_inair, 
        [198] = body_yaw_freestanding_inair, 
        [199] = pitch_aircrouch, 
        [200] = yaw_aircrouch, 
        [201] = base_aircrouch, 
        [202] = offset_aircrouch, 
        [203] = yaw_modifier_aircrouch, 
        [204] = modifier_offset_aircrouch, 
        [205] = body_yaw_aircrouch, 
        [206] = inverter_aircrouch, 
        [207] = left_limit_aircrouch, 
        [208] = right_limit_aircrouch, 
        [209] = options_aircrouch, 
        [210] = body_yaw_freestanding_aircrouch, 
        [211] = v38, 
        [212] = v40, 
        [213] = v42, 
        [214] = v43, 
        [215] = v45, 
        [216] = v47, 
        [217] = v49, 
        [218] = v51, 
        [219] = v52, 
        [220] = v54, 
        [221] = v56, 
        [222] = v58, 
        [223] = v59, 
        [224] = v60, 
        [225] = v61, 
        [226] = v62, 
        [227] = v64, 
        [228] = v66, 
        [229] = v67, 
        [230] = v68, 
        [231] = v69, 
        [232] = v70, 
        [233] = v71, 
        [234] = v72, 
        [235] = v73, 
        [236] = v74, 
        [237] = v75, 
        [238] = v77, 
        [239] = v78, 
        [240] = v79, 
        [241] = v80, 
        [242] = v81, 
        [243] = v82, 
        [244] = v83, 
        [245] = v84
    }, 
    colors = {
        [1] = v41, 
        [2] = v46, 
        [3] = v50, 
        [4] = v55, 
        [5] = v65, 
        [6] = v51, 
        [7] = v42
    }
};
(function()
    -- upvalues: l_mtools_0 (ref)
    if files.read(files.first_config) == nil then
        files.write(files.first_config, json.stringify(""));
    end;
    if files.read(files.second_config) == nil then
        files.write(files.second_config, json.stringify(""));
    end;
    if files.read(files.third_config) == nil then
        files.write(files.third_config, json.stringify(""));
    end;
    if files.read(files.safe_head) == nil then
        l_mtools_0.Network.Download("https://raw.githubusercontent.com/739ausserkontrolle/fragment/refs/heads/main/head.txt", "nl\\fragment\\safe_head.txt", true, 97);
    end;
    if files.read(files.aggressive) == nil then
        l_mtools_0.Network.Download("https://raw.githubusercontent.com/739ausserkontrolle/fragment/refs/heads/main/agg.txt", "nl\\fragment\\aggressive.txt", true, 97);
    end;
    if files.read(files.lua_owner) == nil then
        l_mtools_0.Network.Download("https://raw.githubusercontent.com/739ausserkontrolle/fragment/refs/heads/main/auser.txt", "nl\\fragment\\ausserkontrolle.txt", true, 97);
    end;
end)();
v25:button(v12.get("file-circle-plus") .. " Load", function()
    -- upvalues: v85 (ref), l_base64_0 (ref), v168 (ref), v0 (ref), v1 (ref)
    local v169 = {};
    if v85:get() == 1 then
        v169 = files.read(files.first_config);
    elseif v85:get() == 2 then
        v169 = files.read(files.second_config);
    elseif v85:get() == 3 then
        v169 = files.read(files.third_config);
    elseif v85:get() == 4 then
        v169 = files.read(files.safe_head);
    elseif v85:get() == 5 then
        v169 = files.read(files.aggressive);
    elseif v85:get() == 6 then
        v169 = files.read(files.lua_owner);
    end;
    local v170 = json.parse(l_base64_0.decode(v169));
    for v171, v172 in pairs(v170) do
        v171 = ({
            [1] = "colors", 
            [2] = "everything"
        })[v171];
        for v173, v174 in pairs(v172) do
            if v171 == "colors" then
                v168[v171][v173]:set(color(unpack(v174)));
            end;
            if v171 == "everything" then
                v168[v171][v173]:set(v174);
            end;
        end;
    end;
    common.add_notify("Fragment.lua " .. v0 .. " " .. v1, "Config Loaded Successful");
end, true);
v25:button(v12.get("file-circle-check") .. "Save", function()
    -- upvalues: v85 (ref), v168 (ref), l_base64_0 (ref), v0 (ref), v1 (ref)
    local v175 = {
        [1] = {}, 
        [2] = {}
    };
    local v176 = {};
    if v85:get() == 1 then
        v176 = files.first_config;
    elseif v85:get() == 2 then
        v176 = files.second_config;
    elseif v85:get() == 3 then
        v176 = files.third_config;
    elseif v85:get() == 4 then
        v176 = files.safe_head;
    elseif v85:get() == 5 then
        v176 = files.aggressive;
    elseif v85:get() == 6 then
        v176 = files.lua_owner;
    end;
    for _, v178 in pairs(v168.colors) do
        table.insert(v175[1], {
            [1] = v178:get().r, 
            [2] = v178:get().g, 
            [3] = v178:get().b, 
            [4] = v178:get().a
        });
    end;
    for _, v180 in pairs(v168.everything) do
        table.insert(v175[2], v180:get());
    end;
    files.write(v176, l_base64_0.encode(json.stringify(v175)));
    common.add_notify("Fragment.lua " .. v0 .. " " .. v1, "Config Saved Successful");
end, true);
v25:button(v12.get("file-import") .. " Import", function()
    -- upvalues: v85 (ref), l_base64_0 (ref), v168 (ref), v0 (ref), v1 (ref)
    local v181 = {};
    if v85:get() == 1 then
        v181 = files.read(files.first_config);
    elseif v85:get() == 2 then
        v181 = files.read(files.second_config);
    elseif v85:get() == 3 then
        v181 = files.read(files.third_config);
    elseif v85:get() == 4 then
        v181 = files.read(files.safe_head);
    elseif v85:get() == 5 then
        v181 = files.read(files.aggressive);
    elseif v85:get() == 6 then
        v181 = files.read(files.lua_owner);
    end;
    for v182, v183 in pairs(json.parse(l_base64_0.decode(v181))) do
        v182 = ({
            [1] = "colors", 
            [2] = "everything"
        })[v182];
        for v184, v185 in pairs(v183) do
            if v182 == "colors" then
                v168[v182][v184]:set(color(unpack(v185)));
            end;
            if v182 == "everything" then
                v168[v182][v184]:set(v185);
            end;
        end;
    end;
    common.add_notify("Fragment.lua " .. v0 .. " " .. v1, "Config Imported Successful");
end, true);
v25:button(v12.get("file-export") .. "Export", function()
    -- upvalues: v85 (ref), l_clipboard_0 (ref), l_base64_0 (ref), v0 (ref), v1 (ref)
    local v186 = {};
    if v85:get() == 1 then
        v186 = files.first_config;
    elseif v85:get() == 2 then
        v186 = files.second_config;
    elseif v85:get() == 3 then
        v186 = files.third_config;
    elseif v85:get() == 4 then
        v186 = files.safe_head;
    elseif v85:get() == 5 then
        v186 = files.aggressive;
    elseif v85:get() == 6 then
        v186 = files.lua_owner;
    end;
    l_clipboard_0.set(l_base64_0.encode(json.stringify(files.read(v186))));
    common.add_notify("Fragment.lua " .. v0 .. " " .. v1, "Config Exported Successful");
end, true);