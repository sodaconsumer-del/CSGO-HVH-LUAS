local _ = {};
local _ = {};
local l_pui_0 = require("neverlose/pui");
local _ = require("neverlose/gradient");
local l_clipboard_0 = require("neverlose/clipboard");
local l_base64_0 = require("neverlose/base64");
local l_system_0 = require("neverlose/drag_system");
local l_mtools_0 = require("neverlose/mtools");
local l_indicator_0 = require("neverlose/side_indicator");
local l_gradient_1 = require("neverlose/gradient");
local _ = require("neverlose/smoothy");
local _ = require("neverlose/bomb");
print_raw("                    \226\149\148\226\149\151\226\150\145\226\150\145\226\149\148\226\149\144\226\149\144\226\149\144\226\149\166\226\149\151\226\150\145\226\150\145\226\149\148\226\149\166\226\149\144\226\149\144\226\149\144\226\149\166\226\149\144\226\149\151\226\150\145\226\149\148\226\149\166\226\149\144\226\149\144\226\149\144\226\149\166\226\149\144\226\149\144\226\149\144\226\149\151\n                    \226\149\145\226\149\145\226\150\145\226\150\145\226\149\145\226\149\148\226\149\144\226\149\151\226\149\145\226\149\154\226\149\151\226\149\148\226\149\157\226\149\145\226\149\148\226\149\144\226\149\144\226\149\163\226\149\145\226\149\154\226\149\151\226\149\145\226\149\160\226\149\151\226\149\148\226\149\151\226\149\145\226\149\148\226\149\144\226\149\151\226\149\145\n                    \226\149\145\226\150\145\226\150\145\226\149\145\226\149\145\226\150\145\226\149\145\226\149\160\226\149\151\226\149\145\226\149\145\226\149\148\226\149\163\226\149\154\226\149\144\226\149\144\226\149\163\226\149\148\226\149\151\226\149\154\226\149\157\226\149\145\226\149\145\226\149\145\226\149\145\226\149\145\226\149\145\226\150\145\226\149\145\226\149\145\n                    \226\149\145\226\149\145\226\150\145\226\149\148\226\149\163\226\149\154\226\149\144\226\149\157\226\149\145\226\149\145\226\149\154\226\149\157\226\149\145\226\149\145\226\149\148\226\149\144\226\149\144\226\149\163\226\149\145\226\149\154\226\149\151\226\149\145\226\149\145\226\149\145\226\149\145\226\149\145\226\149\145\226\149\154\226\149\144\226\149\157\226\149\145\n                    \226\149\145\226\149\154\226\149\144\226\149\157\226\149\145\226\149\148\226\149\144\226\149\151\226\149\145\226\149\154\226\149\151\226\149\148\226\149\157\226\149\145\226\149\154\226\149\144\226\149\144\226\149\163\226\149\145\226\150\145\226\149\145\226\149\145\226\149\160\226\149\157\226\149\154\226\149\157\226\149\145\226\149\148\226\149\144\226\149\151\226\149\145\n                    \226\149\154\226\149\144\226\149\144\226\149\144\226\149\169\226\149\157\226\150\145\226\149\154\226\149\157\226\150\145\226\149\154\226\149\157\226\150\145\226\149\154\226\149\144\226\149\144\226\149\144\226\149\169\226\149\157\226\150\145\226\149\154\226\149\144\226\149\169\226\149\144\226\149\144\226\149\144\226\149\169\226\149\157\226\150\145\226\149\154\226\149\157\n\n                    \197\187yczymy mi\197\130ej gry  \n                    -----------------\n                    We wish you pleasant playing  \n                                        \n                ");
local v12 = l_gradient_1.text_animate(ui.get_icon("face-icicles"), 1, {
    ui.get_style("Link Active"), 
    color(150, 150, 150), 
    color(100, 100, 100)
});
local v13 = l_gradient_1.text_animate(" Lavenda", 1, {
    ui.get_style("Link Active"), 
    color(150, 150, 150), 
    color(100, 100, 100)
});
local function v14()
    -- upvalues: v12 (ref), v13 (ref)
    v12:animate();
    v13:animate();
    ui.sidebar(v13:get_animated_text(), v12:get_animated_text());
end;
ascii_to_hex = function(v15)
    local v16 = "";
    for v17 = 1, #v15 do
        local v18 = string.byte(v15, v17);
        v16 = v16 .. string.format("%02X", v18);
    end;
    return v16;
end;
local function v20()
    -- upvalues: l_base64_0 (ref)
    local v19 = {
        lua = "lavenda", 
        username = common.get_username()
    };
    return ascii_to_hex(l_base64_0.encode(json.stringify(v19)));
end;
local v21 = {
    antiaim = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    yawbase = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yawoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    avoidbackstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    yawmodifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    yawmodofsset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    bodyfs = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    hsoptions = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
    dtoptions = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"), 
    scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
    hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance")
};
local v22 = {
    main = l_pui_0.create("\f<house-night> Main", "\f<house-night>", 1), 
    main1 = l_pui_0.create("\f<house-night> Main", "\f<share> Config ", 1), 
    cfg = l_pui_0.create("\f<house-night> Main", "\f<rss> Config", 1), 
    main3 = l_pui_0.create("\f<house-night> Main", "\f<crown> Owner", 2), 
    main_tab = l_pui_0.create("\f<house-night> Main", "\f<arrows-left-right-to-line> : ", 2), 
    maine = l_pui_0.create("\f<house-night> Main", "\f<dog> Info Player", 1), 
    verify = l_pui_0.create("\f<house-night> Main", "\f<palette> Verify", 2), 
    maine1 = l_pui_0.create("\f<house-night> Main", "\f<discord> Discord", 1), 
    antiaim = l_pui_0.create("\f<gear> AntiAim", "\f<slider> Main", 1), 
    builder = l_pui_0.create("\f<gear> AntiAim", "\f<sliders> Builder", 2), 
    brute = l_pui_0.create("\f<gear> AntiAim", "\f<sliders> Anti~Bruteforce", 1), 
    tab = l_pui_0.create("\f<flower-tulip> Other", "\f<arrows-left-right-to-line>", 1), 
    misc = l_pui_0.create("\f<flower-tulip> Other", "  ", 2), 
    visuals = l_pui_0.create("\f<flower-tulip> Other", "\f<circle-half-stroke> ", 2), 
    solus = l_pui_0.create("\f<flower-tulip> Other", "", 1), 
    rageui = l_pui_0.create("\f<flower-tulip> Other", "", 1), 
    bombui = l_pui_0.create("\f<flower-tulip> Other", "", 1)
};
local v23 = db.lavenda_info or {
    [1] = 0, 
    [2] = 0, 
    [3] = 0
};
local l_curtime_0 = globals.curtime;
seconds_to_hours = function(v25)
    if v25 == 0 then
        return 0;
    else
        return (math.floor(v25 / 3600));
    end;
end;
local v26 = v22.main_tab:list("", {
    [1] = "                                  \v\f<house>                                   ", 
    [2] = "                                  \v\f<folders>                                  ", 
    [3] = "                                  \v\f<discord>\r                                  "
});
v22.main:label(" \v\f<bolt>\r  Welcome to : ");
v22.main:button(" Lav\venda\r", function()

end, true);
v22.main:label("\v\f<star>\r Version :");
v22.main:button(" Be\vta\r", function()

end, true);
v22.main:label(" \v\f<calendar>\r  Last Update : ");
v22.main:button(" \v14.04.2025 ", function()

end, true);
v22.main:label(" \v\f<rectangle-terminal>\r  Author : ");
v22.main:button(" \vVeksur", function()

end, true);
v22.main:label(" \v\f<user>\r  User :  ");
v22.main:button(" \v" .. common.get_username() .. " ", function()

end, true);
v22.maine:label("  \v\f<flower-daffodil>\r                   \aBD8A8FFF \226\135\169 I n f o   U S E R  \226\135\169     \r             \v\f<flower-daffodil> "):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v26
});
local v27 = seconds_to_hours(v23[3]) > 0 and seconds_to_hours(v23[3]) or 0;
v22.maine:label("\v\f<clock>\r   Hours \vplayed : "):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v26
});
v22.maine:button(" \v" .. v27 .. " ", function()

end, true):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v26
});
v22.maine:label("\v\f<skull>\r  Missed shots at \vyou : "):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v26
});
v22.maine:button(" \v" .. v23[2] .. " ", function()

end, true):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v26
});
v22.maine:label("\v\f<skull>\r   Enemies \veliminated : "):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v26
});
v22.maine:button(" \v" .. v23[1] .. " ", function()

end, true):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v26
});
v22.main3:button("\vConfig | Veksur\r", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/item?id=uetylo");
end, true):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v26
});
v22.main3:button("\aed6666FF\f<youtube>\r", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@V.V.V-u7x");
end, true):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v26
});
v22.maine1:button("             \v\f<discord>             ", function()
    -- upvalues: v20 (ref), l_clipboard_0 (ref)
    print(v20());
    l_clipboard_0.set(v20());
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/B9vzCKkD5d");
end, true):depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v26
});
v22.verify:label("\v  \194\187\r   How To Get \vRole?"):depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v26
});
v22.verify:label("\v  \194\187\r   Send Proof \vBuy"):depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v26
});
local v28 = {
    conditions = {
        [1] = "Share", 
        [2] = "Stand", 
        [3] = "Run", 
        [4] = "Walking", 
        [5] = "Crouch", 
        [6] = "Air", 
        [7] = "Air+C", 
        [8] = "Freestanding"
    }
};
local v29 = {
    switch = v22.antiaim:switch("Enable AntiAim")
};
v29.yaw = v22.antiaim:combo("\f<code-compare> Yaw Base", {
    [1] = "Local View", 
    [2] = "At Target", 
    [3] = "Left", 
    [4] = "Right"
}):depend(v29.switch);
v29.pitch = v22.antiaim:combo("\f<arrows-repeat-1> Pitch", v21.pitch:list()):depend(v29.switch);
v29.freestanding = v22.antiaim:switch("\f<arrows-turn-to-dots> Freestanding"):depend(v29.switch);
v29.avoid_backstab = v22.antiaim:switch("\f<knife-kitchen>Avoid Backstab"):depend(v29.switch);
v29.safe_head = v22.antiaim:selectable("\f<user-helmet-safety> Safe head", {
    [1] = "Stand", 
    [2] = "Crouch", 
    [3] = "Air+C", 
    [4] = "Air+C Knife", 
    [5] = "Air+C Taser", 
    [6] = "High Distance"
}):depend(v29.switch);
v29.anim_breaker = v22.antiaim:switch("\f<person-running> Animation Breakers"):depend(v29.switch);
v29.anim_breaker_create = v29.anim_breaker:create();
v29.anim_breaker_ground = v29.anim_breaker_create:combo("Ground Anims", {
    [1] = "Disabled", 
    [2] = "Static", 
    [3] = "Moonwalk", 
    [4] = "Jitter"
}):depend(v29.switch, v29.anim_breaker);
v29.anim_breaker_air = v29.anim_breaker_create:combo("Air Anims", {
    [1] = "Disabled", 
    [2] = "Static Legs", 
    [3] = "Flying", 
    [4] = "Moonwalk"
}):depend(v29.switch, v29.anim_breaker);
v29.anim_breaker_other = v29.anim_breaker_create:selectable("Other", {
    [1] = "Move Lean", 
    [2] = "Static", 
    [3] = "Zero Pitch On Land", 
    [4] = "Earthquake", 
    [5] = "Kangaroo"
}):depend(v29.switch, v29.anim_breaker);
v29.anim_breaker_lean = v29.anim_breaker_create:slider("Lean Amount", 0, 100, 100):depend(v29.switch, v29.anim_breaker, {
    [1] = nil, 
    [2] = "Move Lean", 
    [1] = v29.anim_breaker_other
});
v29.state = v22.builder:combo("Current State", v28.conditions):depend(v29.switch);
local v30 = {
    switch = v22.brute:switch("Enable Anti Bruteforce"):depend(v29.switch)
};
v30.phases = v22.brute:slider("slider zalupa", 0, 10, 1):depend({
    [1] = v30.switch, 
    [2] = function()
        return false;
    end
});
v30.add = v22.brute:button(ui.get_icon("layer-plus") .. "      Add Phase      ", function()
    -- upvalues: v30 (ref)
    v30.phases:set(v30.phases:get() + 1);
end, true):depend(v30.switch, v29.switch);
v30.remove = v22.brute:button(ui.get_icon("layer-minus") .. "   Remove Phase   ", function()
    -- upvalues: v30 (ref)
    v30.phases:set(v30.phases:get() - 1);
end, true):depend(v30.switch, v29.switch);
local v31 = {};
for v32 = 1, 10 do
    v31[v32] = {};
    do
        local l_v32_0 = v32;
        v31[l_v32_0].label = v22.brute:label("Stage: " .. l_v32_0):depend(v29.switch, v30.switch, {
            [1] = v30.phases, 
            [2] = function()
                -- upvalues: l_v32_0 (ref), v30 (ref)
                return l_v32_0 <= v30.phases:get();
            end
        });
        v31[l_v32_0].create = v31[l_v32_0].label:create();
        v31[l_v32_0].timer = v31[l_v32_0].create:slider("Timer", 0, 13, 4, 1, "ms");
        v31[l_v32_0].yaw_l = v31[l_v32_0].create:slider("Yaw Left", -180, 180, 0);
        v31[l_v32_0].yaw_r = v31[l_v32_0].create:slider("Yaw Right", -180, 180, 0);
        v31[l_v32_0].modifier = v31[l_v32_0].create:combo("Modifier Type", v21.yawmodifier:list());
        v31[l_v32_0].modifier_offset = v31[l_v32_0].create:slider("Modifier Offset", -180, 180, 0):depend({
            [1] = v31[l_v32_0].modifier, 
            [2] = function()
                -- upvalues: v31 (ref), l_v32_0 (ref)
                return v31[l_v32_0].modifier:get() ~= "Disabled";
            end
        });
        v31[l_v32_0].left_limit = v31[l_v32_0].create:slider("Desync Left", 0, 60, 60);
        v31[l_v32_0].right_limit = v31[l_v32_0].create:slider("Desync Right", 0, 60, 60);
    end;
end;
local v34 = v22.tab:list("", {
    [1] = ui.get_icon("circle-half-stroke") .. "  ~ Visuals ", 
    [2] = ui.get_icon("sliders") .. "  ~ Misc"
});
local v35 = {
    fast_ladder = v22.misc:switch(ui.get_icon("water-ladder") .. "   Fast Ladder"):depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v34
    }), 
    aspect_ratio = v22.visuals:switch(ui.get_icon("panorama") .. "  Aspect ratio"):depend({
        [1] = nil, 
        [2] = 1, 
        [1] = v34
    })
};
v35.aspect_ratio_create = v35.aspect_ratio:create();
v35.aspect_ratio_offset = v35.aspect_ratio_create:slider("Offset", 0, 20, 18, 0.1):depend(v35.aspect_ratio);
v35.view_model = v22.visuals:switch(ui.get_icon("hands-holding") .. "  Viewmodel"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v34
});
v35.view_model_create = v35.view_model:create();
v35.view_model_fov = v35.view_model_create:slider("Fov", 0, 100, 60):depend(v35.view_model);
v35.view_model_x = v35.view_model_create:slider("X", -10, 10, 0):depend(v35.view_model);
v35.view_model_y = v35.view_model_create:slider("Y", -10, 10, 0):depend(v35.view_model);
v35.view_model_z = v35.view_model_create:slider("Z", -10, 10, 0):depend(v35.view_model);
v35.trashtalk = v22.misc:switch("\f<face-swear> TrashTalk"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v34
});
v35.trashtalk_create = v35.trashtalk:create();
v35.trashtalk_triggers = v35.trashtalk_create:selectable("Triggers", {
    [1] = "On Kill", 
    [2] = "On Death"
}):depend(v35.trashtalk);
v35.clantag = v22.misc:switch(ui.get_icon("tag") .. "   Clantag"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v34
});
v35.teleport = v22.misc:switch("\f<transporter-1>  Auto Teleport In Air"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v34
});
v35.jumpscout = v22.misc:switch("\f<person-falling>   HitChance Override"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v34
});
v35.jumpscout_create = v35.jumpscout:create();
v35.jumpscout_weapon = v35.jumpscout_create:listable("Weapon", {
    [1] = "Scout", 
    [2] = "Auto", 
    [3] = "Revolver", 
    [4] = "Pistols", 
    [5] = "AWP"
}):depend(v35.jumpscout);
v35.jumpscout_weapon_type = v35.jumpscout_create:selectable("Hitchance Type", {
    [1] = "In Air", 
    [2] = "No Scope"
}):depend(v35.jumpscout);
v35.jumpscout_hitchance = v35.jumpscout_create:slider("Scout Hitchance", 0, 100, 35):depend(v35.jumpscout, {
    [1] = nil, 
    [2] = 1, 
    [1] = v35.jumpscout_weapon
});
v35.jumpscout_hitchance_auto = v35.jumpscout_create:slider("Auto Hitchance", 0, 100, 35):depend(v35.jumpscout, {
    [1] = nil, 
    [2] = 2, 
    [1] = v35.jumpscout_weapon
});
v35.jumpscout_hitchance_r8 = v35.jumpscout_create:slider("Revolver Hitchance", 0, 100, 35):depend(v35.jumpscout, {
    [1] = nil, 
    [2] = 3, 
    [1] = v35.jumpscout_weapon
});
v35.jumpscout_hitchance_pistols = v35.jumpscout_create:slider("Pistols Hitchance", 0, 100, 35):depend(v35.jumpscout, {
    [1] = nil, 
    [2] = 4, 
    [1] = v35.jumpscout_weapon
});
v35.jumpscout_hitchance_awp = v35.jumpscout_create:slider("AWP Hitchance", 0, 100, 35):depend(v35.jumpscout, {
    [1] = nil, 
    [2] = 5, 
    [1] = v35.jumpscout_weapon
});
v35.logs = v22.misc:switch(ui.get_icon("blog") .. "   Ragebot logs"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v34
});
v35.logs_create = v35.logs:create();
v35.logs_type = v35.logs_create:selectable("Logs Type", {
    [1] = "Console", 
    [2] = "Event", 
    [3] = "Screen"
}):depend(v35.logs);
v35.logs_type_style = v35.logs_create:combo("Logs Style", {
    [1] = "Default", 
    [2] = "Modern"
}):depend({
    [1] = nil, 
    [2] = "Screen", 
    [1] = v35.logs_type
});
v35.logs_rounding = v35.logs_create:slider("Rounding", 0, 10, 3):depend({
    [1] = nil, 
    [2] = "Screen", 
    [1] = v35.logs_type
}, {
    [1] = nil, 
    [2] = "Modern", 
    [1] = v35.logs_type_style
});
v35.logs_hit = v35.logs_create:color_picker("Hit Color", color(186, 196, 249)):depend({
    [1] = nil, 
    [2] = "Screen", 
    [1] = v35.logs_type
});
v35.logs_miss = v35.logs_create:color_picker("Miss Color", color(186, 90, 90)):depend({
    [1] = nil, 
    [2] = "Screen", 
    [1] = v35.logs_type
});
v35.nofall = v22.misc:switch(ui.get_icon("person-falling") .. "   No Fall Damage"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v34
});
v35.fakeping = v22.misc:switch(ui.get_icon("satellite-dish") .. "   Unlock Fake Ping"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v34
});
v35.fakeping_create = v35.fakeping:create();
v35.fakeping_amount = v35.fakeping_create:slider("Fake Ping Amount", 0, 250, 150):depend(v35.fakeping);
v35.fps_boost = v22.misc:switch(ui.get_icon("star") .. "   FPS Boost"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v34
});
v35.freezetime_fd = v22.misc:switch("\f<cube>  Freezetime Fakeduck"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v34
});
v35.nickname_generator = v22.misc:button("                Nickname Generator                ", function()

end, true):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v34
});
local v36 = {
    crosshair_ind = v22.visuals:switch(ui.get_icon("comet") .. "   Crosshair Indicator"):depend({
        [1] = nil, 
        [2] = 1, 
        [1] = v34
    })
};
v36.crosshair_ind_create = v36.crosshair_ind:create();
v36.crosshair_ind_type = v36.crosshair_ind_create:combo("Type", {
    [1] = "Default", 
    [2] = "Modern", 
    [3] = "Alternative"
}):depend(v36.crosshair_ind);
v36.crosshair_ind_color1 = v36.crosshair_ind_create:color_picker("First Color", color(220, 220, 220)):depend(v36.crosshair_ind);
v36.crosshair_ind_color2 = v36.crosshair_ind_create:color_picker("Second Color", color(170, 170, 170)):depend(v36.crosshair_ind);
v36.crosshair_ind_color3 = v36.crosshair_ind_create:color_picker("Thirst Color", color(120, 120, 120)):depend(v36.crosshair_ind);
v36.crosshair_ind_key = v36.crosshair_ind_create:listable("", {
    [1] = "Min. Damage", 
    [2] = "Double Tap", 
    [3] = "Hide Shots", 
    [4] = "Force Baim", 
    [5] = "Force Safe", 
    [6] = "Freestanding", 
    [7] = "Hit Chance", 
    [8] = "Anti-Aim State"
}):depend(v36.crosshair_ind);
v36.custom_scope = v22.visuals:switch(ui.get_icon("crosshairs") .. "   Custom Scope"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v34
});
v36.custom_scope_create = v36.custom_scope:create();
v36.custom_scope_length = v36.custom_scope_create:slider("Length", 10, 300, 55):depend(v36.custom_scope);
v36.custom_scope_offset = v36.custom_scope_create:slider("Offset", 1, 60, 15):depend(v36.custom_scope);
v36.custom_scope_color = v36.custom_scope_create:color_picker("Color"):depend(v36.custom_scope);
v36.windows_ui = v22.visuals:switch(ui.get_icon("palette") .. "   Solus UI"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v34
});
v36.windows_ui_create = v36.windows_ui:create();
v36.windows_ui_type = v36.windows_ui_create:combo("Solus Style", {
    [1] = "Default", 
    [2] = "Modern"
}):depend(v36.windows_ui);
v36.windows_ui_select = v36.windows_ui_create:listable("", {
    [1] = "Watermark", 
    [2] = "Keybinds", 
    [3] = "Spectator List"
}):depend(v36.windows_ui);
v36.windows_ui_round = v36.windows_ui_create:slider("Rounding", 0, 7, 3):depend(v36.windows_ui, {
    [1] = nil, 
    [2] = "Modern", 
    [1] = v36.windows_ui_type
});
v36.windows_ui_color = v36.windows_ui_create:color_picker("Color", color(120, 120, 120)):depend(v36.windows_ui);
v36.world_damage = v22.visuals:switch(ui.get_icon("crosshairs") .. "   World Damage"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v34
});
v36.world_damage_create = v36.world_damage:create();
v36.world_damage_font = v36.world_damage_create:list("Font", {
    [1] = "Default", 
    [2] = "Pixel", 
    [3] = "Console", 
    [4] = "Modern"
});
v36.world_damage_color = v36.world_damage_create:color_picker("Color");
v36.aa_arrows = v22.visuals:switch(ui.get_icon("arrows-left-right") .. "   Anti-Aim Arrows"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v34
});
v36.aa_arrows_create = v36.aa_arrows:create();
v36.aa_arrows_color = v36.aa_arrows_create:color_picker("Color", color(200)):depend(v36.aa_arrows);
v36.aa_arrows_color2 = v36.aa_arrows_create:color_picker("Color Active", color(255)):depend(v36.aa_arrows);
v36.gs_indicators = v22.visuals:switch(ui.get_icon("palette") .. "   500$ Indicators"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v34
});
v36.world_hitmarker = v22.visuals:switch(ui.get_icon("square-xmark") .. "   World Hitmarker"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v34
});
v36.world_hitmarker_create = v36.world_hitmarker:create();
v36.world_hitmarker_size = v36.world_hitmarker_create:slider("Size", 1, 5, 5):depend(v36.world_hitmarker);
v36.world_hitmarker_type = v36.world_hitmarker_create:combo("Style", {
    [1] = "Default", 
    [2] = "Kibit", 
    [3] = "Circle"
}):depend(v36.world_hitmarker);
v36.world_hitmarker_color = v36.world_hitmarker_create:color_picker("Color", color(65, 225, 140)):depend(v36.world_hitmarker);
local v37 = {
    watermark = v22.solus:label(ui.get_icon("palette") .. "   Watermark"):depend({
        [1] = nil, 
        [2] = 1, 
        [1] = v34
    })
};
v37.watermark_create = v37.watermark:create();
v37.watermark_position = v37.watermark_create:combo("Watermark", {
    [1] = "Left", 
    [2] = "Right", 
    [3] = "Down"
}):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v34
});
local v38 = {
    teleport = v22.rageui:switch("\f<user-robot>    Auto Teleport"):depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v34
    })
};
v38.teleport_create = v38.teleport:create();
v38.teleport_weapon = v38.teleport_create:selectable("Weapon", {
    [1] = "Scout", 
    [2] = "Taser"
}):depend(v38.teleport);
v38.teleport_air = v38.teleport_create:switch("Only In Air"):depend(v38.teleport);
v38.dormant = v22.rageui:switch("\f<eye>   Dormant Aimbot"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v34
});
v38.dormant_create = v38.dormant:create();
v38.dormant_hitboxes = v38.dormant_create:selectable("Hitboxes", {
    [1] = "Head", 
    [2] = "Chest", 
    [3] = "Stomach", 
    [4] = "Pelvis", 
    [5] = "Arms", 
    [6] = "Legs"
}):depend(v38.dormant);
v38.dormant_accuracy = v38.dormant_create:slider("Accuracy", 0, 100, 60):depend(v38.dormant);
v38.dormant_min_dmg = v38.dormant_create:slider("Minimum damage", 0, 130, 10):depend(v38.dormant);
v38.dormant_autoscope = v38.dormant_create:switch("Auto Scope"):depend(v38.dormant);
v38.r8_helper = v22.rageui:switch(ui.get_icon("gun") .. "   R8 Helper"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v34
});
v38.super_toss = v22.rageui:switch("\f<calculator-simple>   Super Toss"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v34
});
v38.super_toss_create = v38.super_toss:create();
v38.super_toss_mode = v38.super_toss_create:selectable("Throw Mode", {
    [1] = "Hold", 
    [2] = "Quick", 
    [3] = "Smart"
}):depend(v38.super_toss);
v38.super_toss_only_flash = v38.super_toss_create:switch("Only Flash"):depend(v38.super_toss);
local v39 = {
    grenade_visuals = v22.bombui:switch("\f<bomb>  Grenade Visuals"):depend({
        [1] = nil, 
        [2] = 1, 
        [1] = v34
    })
};
v39.grenade_visuals_create = v39.grenade_visuals:create();
v39.grenade_warning = v39.grenade_visuals_create:switch("Warning"):depend(v39.grenade_visuals);
v39.grenade_trajectory = v39.grenade_visuals_create:switch("Trajectory"):depend(v39.grenade_visuals);
v39.grenade_warning_color = v39.grenade_visuals_create:color_picker("Warning Color"):depend(v39.grenade_warning);
v39.grenade_visuals = v22.bombui:switch("\f<bomb> Grenade Radius"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v34
});
v39.grenade_visuals_create = v39.grenade_visuals:create();
v39.smoke_radius = v39.grenade_visuals_create:switch("Smoke"):depend(v39.grenade_visuals);
v39.smoke_color = v39.grenade_visuals_create:color_picker("Smoke Color", color(150, 150, 255)):depend(v39.smoke_radius);
v39.molotov_radius = v39.grenade_visuals_create:switch("Molotov"):depend(v39.grenade_visuals);
v39.molotov_color = v39.grenade_visuals_create:color_picker("Molotov Color", color(255, 100, 100)):depend(v39.molotov_radius);
v39.lc_debug = v22.bombui:switch("\f<box>  LC Box"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v34
});
v39.lc_debug_create = v39.lc_debug:create();
v39.lc_debug_box_color = v39.lc_debug_create:color_picker("Box Color", color(100, 150, 255)):depend(v39.lc_debug);
v39.lc_debug_text_color = v39.lc_debug_create:color_picker("Text Color", color(255, 100, 100)):depend(v39.lc_debug);
local v40 = {};
for v41 = 1, #v28.conditions do
    v40[v41] = {};
    v40[v41].state = v22.builder:switch("\v\f<square-check>\r Enable \v" .. v28.conditions[v41] .. "\r State");
    v40[v41].yaw_type = v22.builder:combo("\v\f<arrows-to-dot>\r Yaw Type", {
        [1] = "Default", 
        [2] = "L&R", 
        [3] = "Slow ~ jitter"
    });
    v40[v41].yaw = v22.builder:slider("\v\f<angle>\r Yaw", -180, 180, 0);
    v40[v41].yaw_l = v22.builder:slider("\v\f<angle>\r Yaw Left", -180, 180, 0);
    v40[v41].yaw_r = v22.builder:slider("\v\f<angle>\r Yaw Right", -180, 180, 0);
    v40[v41].modifier = v22.builder:combo("\v\f<gitter>\r Modifier Type", v21.yawmodifier:list());
    v40[v41].modifier_offset = v22.builder:slider("\v\f<arrow-up-short-wide>\r Modifier Offset", -180, 180, 0);
    v40[v41].body_yaw = v22.builder:switch("\v\f<eye>\r Body Yaw");
    v40[v41].body_yaw_create = v40[v41].body_yaw:create();
    v40[v41].left_limit = v40[v41].body_yaw_create:slider("Left Limit", 0, 70, 70);
    v40[v41].right_limit = v40[v41].body_yaw_create:slider("Right Limit", 0, 70, 70);
    v40[v41].options = v40[v41].body_yaw_create:selectable("Options", v21.options:list());
    v40[v41].bodyfs = v40[v41].body_yaw_create:combo("Freestanding", v21.bodyfs:list());
    v40[v41].force_defensive = v22.builder:selectable("\v\f<angle>\r Force Defensive", {
        [1] = "Hide Shots", 
        [2] = "DT"
    });
    v40[v41].defensive = v22.builder:switch("\v\f<angle>\r Defensive AntiAim");
    v40[v41].defensive_yaw = v22.builder:combo("\v\f<arrows-spin>\r Defensive Yaw", {
        [1] = "( no using )", 
        [2] = "Default", 
        [3] = "Offset", 
        [4] = "Meta-Way", 
        [5] = "Random", 
        [6] = "Switch", 
        [7] = "Center", 
        [8] = "3-Way"
    });
    v40[v41].defensive_yaw_create = v40[v41].defensive_yaw:create();
    v40[v41].defensive_yaw_offset = v40[v41].defensive_yaw_create:slider("Yaw Offset", -180, 180, 0);
    v40[v41].defensive_pitch = v22.builder:combo(" \v\f<arrows-up-down>\r  Defensive Pitch", {
        [1] = "> OFF", 
        [2] = "Custom", 
        [3] = "Random", 
        [4] = "Meta-Way", 
        [5] = "Switch", 
        [6] = "Corner"
    });
    v40[v41].defensive_pitch_create = v40[v41].defensive_pitch:create();
    v40[v41].defensive_pitch_offset = v40[v41].defensive_pitch_create:slider("Pitch Offset", -89, 89, 0);
end;
for v42 = 1, #v28.conditions do
    local v43 = {
        [1] = v29.state, 
        [2] = v28.conditions[v42]
    };
    do
        local l_v42_0 = v42;
        local v45 = {
            [1] = v29.state, 
            [2] = function()
                -- upvalues: l_v42_0 (ref)
                return l_v42_0 ~= 1;
            end
        };
        local v46 = {
            [1] = v40[l_v42_0].modifier, 
            [2] = function()
                -- upvalues: v40 (ref), l_v42_0 (ref)
                return v40[l_v42_0].modifier:get() ~= "> OFF";
            end
        };
        local v47 = {
            [1] = v40[l_v42_0].state, 
            [2] = function()
                -- upvalues: l_v42_0 (ref), v40 (ref)
                if l_v42_0 == 1 then
                    return true;
                else
                    return v40[l_v42_0].state:get();
                end;
            end
        };
        v40[l_v42_0].state:depend(v43, v45, v29.switch);
        v40[l_v42_0].yaw_type:depend(v43, v47, v29.switch);
        v40[l_v42_0].yaw:depend(v43, v47, v29.switch, {
            [1] = nil, 
            [2] = "Default", 
            [1] = v40[l_v42_0].yaw_type
        });
        v40[l_v42_0].yaw_l:depend(v43, v47, v29.switch, {
            [1] = v40[l_v42_0].yaw_type, 
            [2] = function()
                -- upvalues: v40 (ref), l_v42_0 (ref)
                return v40[l_v42_0].yaw_type:get() ~= "Default";
            end
        });
        v40[l_v42_0].yaw_r:depend(v43, v47, v29.switch, {
            [1] = v40[l_v42_0].yaw_type, 
            [2] = function()
                -- upvalues: v40 (ref), l_v42_0 (ref)
                return v40[l_v42_0].yaw_type:get() ~= "Default";
            end
        });
        v40[l_v42_0].modifier:depend(v43, v47, v29.switch);
        v40[l_v42_0].modifier_offset:depend(v43, v47, v46, v29.switch);
        v40[l_v42_0].body_yaw:depend(v43, v47, v29.switch);
        v40[l_v42_0].left_limit:depend(v43, v47, v40[l_v42_0].body_yaw, v29.switch);
        v40[l_v42_0].right_limit:depend(v43, v47, v40[l_v42_0].body_yaw, v29.switch);
        v40[l_v42_0].options:depend(v43, v47, v40[l_v42_0].body_yaw, v29.switch);
        v40[l_v42_0].bodyfs:depend(v43, v47, v40[l_v42_0].body_yaw, v29.switch);
        v40[l_v42_0].force_defensive:depend(v43, v47, v29.switch);
        v40[l_v42_0].defensive:depend(v43, v47, v29.switch);
        v40[l_v42_0].defensive_yaw:depend(v43, v47, v40[l_v42_0].defensive, v29.switch);
        v40[l_v42_0].defensive_yaw_offset:depend(v43, v47, v40[l_v42_0].defensive, v29.switch, {
            [1] = v40[l_v42_0].defensive_yaw, 
            [2] = function()
                -- upvalues: v40 (ref), l_v42_0 (ref)
                return v40[l_v42_0].defensive_yaw:get() ~= "Random" and v40[l_v42_0].defensive_yaw:get() ~= "Disabled" and v40[l_v42_0].defensive_yaw:get() ~= "Default" and v40[l_v42_0].defensive_yaw:get() ~= "Switch";
            end
        });
        v40[l_v42_0].defensive_pitch:depend(v43, v47, v40[l_v42_0].defensive, v29.switch);
        v40[l_v42_0].defensive_pitch_offset:depend(v43, v47, v40[l_v42_0].defensive, v29.switch, {
            [1] = v40[l_v42_0].defensive_pitch, 
            [2] = function()
                -- upvalues: v40 (ref), l_v42_0 (ref)
                return v40[l_v42_0].defensive_pitch:get() == "Custom" or v40[l_v42_0].defensive_pitch:get() == "Meta-Way";
            end
        });
    end;
end;
local v48 = 0;
local v49 = false;
local v50 = 0;
local l_realtime_0 = globals.realtime;
local l_realtime_1 = globals.realtime;
events.bullet_impact:set(function(v53)
    -- upvalues: l_realtime_1 (ref), v23 (ref), v29 (ref), v30 (ref), l_realtime_0 (ref), v50 (ref), v35 (ref)
    local v54 = entity.get_local_player();
    if not v54 then
        return;
    elseif not v54:is_alive() then
        return;
    else
        local v55 = entity.get(v53.userid, true);
        if not v55:is_enemy() then
            return;
        elseif entity.get_threat(true) == nil then
            return;
        else
            local v56 = (vector(v53.x, v53.y, v53.z) - v55:get_hitbox_position(0)):angles();
            local v57 = (v54:get_hitbox_position(3) - v55:get_hitbox_position(0)):angles() - v56;
            v57.y = math.clamp(v57.y, -180, 180);
            if math.sqrt(v57.y * v57.y + v57.x * v57.x) < 10 and l_realtime_1 + 0.1 < globals.realtime then
                v23[2] = v23[2] + 1;
                if not v29.switch:get() then
                    return;
                elseif not v30.switch:get() then
                    return;
                else
                    l_realtime_0 = globals.realtime;
                    l_realtime_1 = globals.realtime + 0.1;
                    v50 = v50 + 1;
                    if v50 > v30.phases:get() then
                        v50 = 0;
                    end;
                    if v35.logs_type:get("Screen") and v35.logs:get() then
                        if v35.logs_type_style:get() == "Default" then
                            render.notify("\aBAC4F9F7LaVenda\aFFFFFFFF \194\187 anti-aim data changed due to \aBAC4F9F7" .. v55:get_name() .. " \aFFFFFFFFshot. Phase:" .. v50);
                        else
                            render.notify("\aBAC4F9F7" .. ui.get_icon("flower-tulip") .. "\aFFFFFFFF anti-aim data changed due to \aBAC4F9F7" .. v55:get_name() .. " \aFFFFFFFFshot. Phase:" .. v50);
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end);
local v58 = false;
local v59 = false;
local function v73(v60)
    -- upvalues: v21 (ref), v29 (ref), v40 (ref), v48 (ref), v49 (ref), v50 (ref), l_realtime_0 (ref), v31 (ref), v59 (ref), v58 (ref)
    local v61 = entity.get_local_player();
    if v61 == nil then
        return;
    else
        local v62 = bit.band(v61.m_fFlags, 1) == 0 or v60.in_jump;
        local v63 = bit.band(v61.m_fFlags, 1) == 1;
        local v64 = v61.m_flDuckAmount > 0.7 or v21.fd:get();
        local v65 = math.sqrt(v61.m_vecVelocity.x ^ 2 + v61.m_vecVelocity.y ^ 2) > 10;
        if v29.freestanding:get() and v40[8].state:get() then
            v48 = 8;
        elseif v62 and v64 and v40[7].state:get() then
            v48 = 7;
        elseif v62 and v40[6].state:get() then
            v48 = 6;
        elseif v64 and v40[5].state:get() then
            v48 = 5;
        elseif v63 and v65 and v21.slowwalk:get() and v40[4].state:get() then
            v48 = 4;
        elseif v63 and v65 and v40[3].state:get() then
            v48 = 3;
        elseif v63 and not v65 and v40[2].state:get() then
            v48 = 2;
        else
            v48 = 1;
        end;
        v21.antiaim:override(v29.switch:get());
        if not v29.switch:get() then
            return;
        else
            v21.yaw:override("Backward");
            v21.avoidbackstab:override(v29.avoid_backstab:get());
            v21.pitch:override(v29.pitch:get());
            v21.freestanding:override(v29.freestanding:get());
            if v40[v48].yaw_type:get() == "Default" then
                v21.yawoffset:override(v40[v48].yaw:get());
            else
                v21.yawoffset:override(rage.antiaim:inverter() and v40[v48].yaw_l:get() or v40[v48].yaw_r:get());
            end;
            v21.yawmodifier:override(v40[v48].modifier:get());
            v21.yawmodofsset:override(v40[v48].modifier_offset:get());
            v21.bodyyaw:override(v40[v48].body_yaw:get());
            v21.left_limit:override(v40[v48].left_limit:get());
            v21.right_limit:override(v40[v48].right_limit:get());
            if v60.choked_commands == 0 and v60.send_packet == true then
                v49 = v60.command_number % 11 > 5;
            end;
            if v40[v48].yaw_type:get() == "Slow ~ jitter" then
                v21.options:override("");
                v21.inverter:override(v49);
            else
                v21.options:override(v40[v48].options:get());
                v21.inverter:override(false);
            end;
            v21.bodyfs:override(v40[v48].bodyfs:get());
            v21.hidden:override(v40[v48].defensive:get());
            v21.hsoptions:override(v40[v48].force_defensive:get("Hide Shots") and "Break LC" or "Favor Fire Rate");
            v21.dtoptions:override(v40[v48].force_defensive:get("DT") and "Always On" or "On Peek");
            if v40[v48].defensive_yaw:get() == "> OFF" then
                rage.antiaim:override_hidden_yaw_offset(v21.yawoffset:get());
            elseif v40[v48].defensive_yaw:get() == "Offset" then
                rage.antiaim:override_hidden_yaw_offset(v40[v48].defensive_yaw_offset:get());
            elseif v40[v48].defensive_yaw:get() == "Meta-Way" then
                rage.antiaim:override_hidden_yaw_offset(rage.antiaim:inverter() and v40[v48].defensive_yaw_offset:get() or -v40[v48].defensive_yaw_offset:get());
            elseif v40[v48].defensive_yaw:get() == "Random" then
                rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
            elseif v40[v48].defensive_yaw:get() == "Switch" then
                rage.antiaim:override_hidden_yaw_offset(globals.tickcount % 4 == 1 and 180 or math.random(-180, 180));
            elseif v40[v48].defensive_yaw:get() == "Center" then
                rage.antiaim:override_hidden_yaw_offset(globals.tickcount % 4 > 1 and v40[v48].defensive_yaw_offset:get() or -v40[v48].defensive_yaw_offset:get());
            elseif v40[v48].defensive_yaw:get() == "3-Way" then
                if globals.tickcount % 3 == 0 then
                    rage.antiaim:override_hidden_yaw_offset(v40[v48].defensive_yaw_offset:get() - v21.yawoffset:get());
                elseif globals.tickcount % 3 == 1 then
                    rage.antiaim:override_hidden_yaw_offset(v21.yawoffset:get());
                elseif globals.tickcount % 3 == 2 then
                    rage.antiaim:override_hidden_yaw_offset(-v40[v48].defensive_yaw_offset:get() + v21.yawoffset:get());
                end;
            end;
            if v40[v48].defensive_pitch:get() == "Custom" then
                rage.antiaim:override_hidden_pitch(v40[v48].defensive_pitch_offset:get());
            elseif v40[v48].defensive_pitch:get() == "Random" then
                rage.antiaim:override_hidden_pitch(math.random(-89, 89));
            elseif v40[v48].defensive_pitch:get() == "Meta-Way" then
                rage.antiaim:override_hidden_pitch(rage.antiaim:inverter() and v40[v48].defensive_pitch_offset:get() or -v40[v48].defensive_pitch_offset:get());
            elseif v40[v48].defensive_pitch:get() == "Switch" then
                rage.antiaim:override_hidden_pitch(globals.tickcount % 4 == 1 and 0 or math.random(-89, 89));
            elseif v40[v48].defensive_pitch:get() == "Corner" then
                rage.antiaim:override_hidden_pitch(globals.tickcount % 3 == 1 and -89 or 0);
            end;
            if v50 ~= 0 and l_realtime_0 + v31[v50].timer:get() > globals.realtime then
                v21.yawoffset:override(rage.antiaim:inverter() and v31[v50].yaw_l:get() or v31[v50].yaw_r:get());
                v21.yawmodifier:override(v31[v50].modifier:get());
                v21.yawmodofsset:override(v31[v50].modifier_offset:get());
                v21.left_limit:override(v31[v50].left_limit:get());
                v21.right_limit:override(v31[v50].right_limit:get());
            end;
            if v29.yaw:get() == "Local View" or v29.yaw:get() == "At Target" then
                v21.yawbase:override(v29.yaw:get());
                v59 = false;
                v58 = false;
            elseif v29.yaw:get() == "Left" then
                v21.yawbase:override("Local View");
                v21.yawoffset:override(-90);
                v59 = false;
                v58 = true;
            elseif v29.yaw:get() == "Right" then
                v21.yawbase:override("Local View");
                v21.yawoffset:override(90);
                v59 = true;
                v58 = false;
            end;
            local v66 = false;
            local v67 = v61:get_player_weapon();
            if v67 == nil then
                return;
            else
                local v68 = v67:get_classname();
                local v69 = entity.get_threat(true);
                local v70 = vector(0, 0, 0);
                local v71 = 0;
                if v69 then
                    v70 = v69:get_origin();
                end;
                local v72 = v61:get_origin();
                if v70 ~= vector(0, 0, 0) then
                    v71 = v70.dist(v70, v72);
                end;
                if v29.safe_head:get("Stand") and v63 and not v65 and not v64 then
                    v66 = true;
                end;
                if v29.safe_head:get("Crouch") and v64 and not v62 then
                    v66 = true;
                end;
                if v29.safe_head:get("Air+C") and v64 and v62 then
                    v66 = true;
                end;
                if v29.safe_head:get("Air~C Knife") and v64 and v62 and v68 == "CKnife" then
                    v66 = true;
                end;
                if v29.safe_head:get("Air~C Taser") and v64 and v62 and v68 == "CWeaponTaser" then
                    v66 = true;
                end;
                if v29.safe_head:get("High Distance") and v71 > 800 then
                    v66 = true;
                end;
                if v66 then
                    v21.inverter:override(false);
                    v21.options:override("");
                    v21.yawoffset:override(18);
                    v21.yawmodifier:override("> OFF");
                    v21.hidden:override(false);
                end;
                return;
            end;
        end;
    end;
end;
local _ = ffi.typeof("uintptr_t**");
local v75 = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)");
ffi.cdef("                    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n                    typedef struct {\n                        char  pad_0000[20];\n                        int m_nOrder;\n                        int m_nSequence;\n                        float m_flPrevCycle;\n                        float m_flWeight;\n                        float m_flWeightDeltaRate;\n                        float m_flPlaybackRate;\n                        float m_flCycle;\n                        void *m_pOwner;\n                        char  pad_0038[4];\n                    } animstate_layer_t;\n                ");
local v76 = 0;
local v77 = 0;
local function v79()
    -- upvalues: v76 (ref), v77 (ref)
    local v78 = entity.get_local_player();
    if not v78 then
        return;
    else
        if bit.band(v78.m_fFlags, 1) == 1 then
            v76 = v76 + 1;
        else
            v76 = 0;
            v77 = globals.curtime + 1;
        end;
        return v76 > 1 and v77 > globals.curtime;
    end;
end;
events.post_update_clientside_animation:set(function()
    -- upvalues: v75 (ref), v29 (ref), v79 (ref)
    local v80 = entity.get_local_player();
    if not v80 then
        return;
    elseif not v80:is_alive() then
        return;
    else
        local v81 = math.sqrt(v80.m_vecVelocity.x ^ 2 + v80.m_vecVelocity.y ^ 2) > 10;
        local v82 = bit.band(v80.m_fFlags, 1) == 0;
        if v80:get_index() == nil then
            return;
        else
            local v83 = v75(v80:get_index());
            if not v29.anim_breaker:get() then
                return;
            else
                if v29.anim_breaker_ground:get() == "Static" then
                    v80.m_flPoseParameter[0] = 1;
                    ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Sliding");
                elseif v29.anim_breaker_ground:get() == "Moonwalk" then
                    v80.m_flPoseParameter[7] = 0;
                    ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Walking");
                elseif v29.anim_breaker_ground:get() == "Jitter" then
                    v80.m_flPoseParameter[0] = globals.tickcount % 4 > 1 and 0.8 or 1;
                    ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Sliding");
                end;
                if v29.anim_breaker_other:get("Zero Pitch On Land") and v79() then
                    v80.m_flPoseParameter[12] = 0.5;
                end;
                if v29.anim_breaker_air:get() == "Static Legs" then
                    v80.m_flPoseParameter[6] = 1;
                elseif v29.anim_breaker_air:get() == "Moonwalk" then
                    if v82 and v81 then
                        ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v83) + 10640)[0][6].m_flWeight = 1;
                    end;
                elseif v29.anim_breaker_air:get() == "Flying" then
                    ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v83) + 10640)[0][5].m_flWeight = 1;
                end;
                if v29.anim_breaker_other:get("Move Lean") and not v29.anim_breaker_other:get("Earthquake") and v81 then
                    ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v83) + 10640)[0][12].m_flWeight = v29.anim_breaker_lean:get();
                end;
                if v29.anim_breaker_other:get("Static") then
                    ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v83) + 10640)[0][7].m_flWeight = 1;
                end;
                if v29.anim_breaker_other:get("Earthquake") then
                    ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v83) + 10640)[0][12].m_flWeight = math.random(0, 10) / 10;
                end;
                if v29.anim_breaker_other:get("Kangaroo") then
                    v80.m_flPoseParameter[3] = math.random(0, 10) / 10;
                    v80.m_flPoseParameter[6] = math.random(0, 10) / 10;
                    v80.m_flPoseParameter[7] = math.random(0, 10) / 10;
                end;
                return;
            end;
        end;
    end;
end);
local v84 = {
    view_model = function()
        -- upvalues: v35 (ref)
        cvar.sv_competitive_minspec:int(0);
        cvar.viewmodel_fov:int(v35.view_model:get() and v35.view_model_fov:get() or 68);
        cvar.viewmodel_offset_x:float(v35.view_model:get() and v35.view_model_x:get() or 2.5);
        cvar.viewmodel_offset_y:float(v35.view_model:get() and v35.view_model_y:get() or 0);
        cvar.viewmodel_offset_z:float(v35.view_model:get() and v35.view_model_z:get() or -1.5);
    end
};
v84.view_model();
v35.view_model:set_callback(function()
    -- upvalues: v84 (ref)
    v84.view_model();
end);
v35.view_model_fov:set_callback(function()
    -- upvalues: v84 (ref)
    v84.view_model();
end);
v35.view_model_x:set_callback(function()
    -- upvalues: v84 (ref)
    v84.view_model();
end);
v35.view_model_y:set_callback(function()
    -- upvalues: v84 (ref)
    v84.view_model();
end);
v35.view_model_z:set_callback(function()
    -- upvalues: v84 (ref)
    v84.view_model();
end);
v84.aspect_ratio = function()
    -- upvalues: v35 (ref)
    cvar.r_aspectratio:float(v35.aspect_ratio:get() and v35.aspect_ratio_offset:get() / 10 or 0);
end;
v84.aspect_ratio();
v35.aspect_ratio:set_callback(function()
    -- upvalues: v84 (ref)
    v84.aspect_ratio();
end);
v35.aspect_ratio_offset:set_callback(function()
    -- upvalues: v84 (ref)
    v84.aspect_ratio();
end);
v84.fast_ladder = function(v85)
    -- upvalues: v35 (ref)
    if not v35.fast_ladder:get() then
        return;
    else
        local v86 = entity.get_local_player();
        if v86 == nil then
            return;
        else
            if v86.m_MoveType == 9 then
                if v85.sidemove == 0 then
                    v85.view_angles.y = v85.view_angles.y + 45;
                end;
                if v85.sidemove < 0 and v85.in_forward then
                    v85.view_angles.y = v85.view_angles.y + 90;
                end;
                if v85.sidemove > 0 and v85.in_back then
                    v85.view_angles.y = v85.view_angles.y + 90;
                end;
                v85.in_moveleft = v85.in_back;
                v85.in_moveright = v85.in_forward;
                if v85.view_angles.x < 0 then
                    v85.view_angles.x = -45;
                end;
            end;
            return;
        end;
    end;
end;
v84.teleport = function(v87)
    -- upvalues: v35 (ref)
    if not v35.teleport:get() then
        return;
    else
        local v88 = entity.get_local_player();
        if not v88 then
            return;
        else
            local v89 = v88:get_player_weapon();
            if v89 == nil then
                return;
            else
                local v90 = v89:get_classname();
                local v91 = false;
                if v35.teleport_weapon:get("Scout") and v90 == "CWeaponSSG08" then
                    v91 = true;
                end;
                if v35.teleport_weapon:get("Taser") and v90 == "CWeaponTaser" then
                    v91 = true;
                end;
                if v35.teleport_weapon:get("MAC-10") and v90 == "CWeaponMAC10" then
                    v91 = true;
                end;
                if not v91 then
                    return;
                else
                    if entity.get_threat(true) then
                        if v35.teleport_air:get() and not v87.in_jump then
                            return;
                        else
                            rage.exploit:force_teleport();
                        end;
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
v84.jumpscout = function(_)
    -- upvalues: v35 (ref), v21 (ref)
    local v93 = entity.get_local_player();
    if not v93 then
        return;
    else
        local v94 = bit.band(v93.m_fFlags, 1) == 0;
        local v95 = v93.m_bIsScoped == false;
        local v96 = v93:get_player_weapon();
        if v96 == nil then
            return;
        else
            local v97 = v96:get_classname();
            local v98 = v97 == "CWeaponSSG08";
            local v99 = v97 == "CWeaponAWP";
            local v100 = v97 == "CWeaponSCAR20";
            local v101 = v97 == "CWeaponG3SG1";
            local v102 = v97 == "CDEagle";
            local v103 = v97 == " CWeaponHKP2000";
            local v104 = v97 == "CWeaponTec9";
            local v105 = v97 == "CWeaponElite";
            local v106 = v97 == "CWeaponFiveSeven";
            local v107 = v97 == "CWeaponP250";
            local v108 = v97 == "CWeaponGlock";
            local v109 = v103 or v104 or v105 or v106 or v107 or v108;
            local v110 = v100 or v101;
            if v35.jumpscout_weapon:get("Scout") and v98 then
                jump_hc = true;
            elseif v35.jumpscout_weapon:get("Auto") and v110 then
                jump_hc = true;
            elseif v35.jumpscout_weapon:get("Revolver") and v102 then
                jump_hc = true;
            elseif v35.jumpscout_weapon:get("Pistols") and v109 then
                jump_hc = true;
            elseif v35.jumpscout_weapon:get("AWP") and v99 then
                jump_hc = true;
            else
                jump_hc = false;
            end;
            if v35.jumpscout_weapon_type:get("In Air") and v94 and v109 then
                cond_hc = true;
            elseif v35.jumpscout_weapon_type:get("In Air") and v94 and v102 then
                cond_hc = true;
            elseif v98 and (v35.jumpscout_weapon_type:get("In Air") and v94 or v35.jumpscout_weapon_type:get("No Scope") and v95) then
                cond_hc = true;
            elseif v99 and (v35.jumpscout_weapon_type:get("In Air") and v94 or v35.jumpscout_weapon_type:get("No Scope") and v95) then
                cond_hc = true;
            elseif (v35.jumpscout_weapon_type:get("In Air") and v94 or v35.jumpscout_weapon_type:get("No Scope") and v95) and v110 then
                cond_hc = true;
            else
                cond_hc = false;
            end;
            if v35.jumpscout:get() and cond_hc and jump_hc then
                if v109 then
                    v21.hitchance:override(v35.jumpscout_hitchance_pistols:get());
                elseif v110 then
                    v21.hitchance:override(v35.jumpscout_hitchance_auto:get());
                elseif v98 then
                    v21.hitchance:override(v35.jumpscout_hitchance:get());
                elseif v99 then
                    v21.hitchance:override(v35.jumpscout_hitchance_awp:get());
                elseif v102 then
                    v21.hitchance:override(v35.jumpscout_hitchance_r8:get());
                else
                    v21.hitchance:override();
                end;
            else
                v21.hitchance:override();
            end;
            return;
        end;
    end;
end;
v84.nofall = function(v111)
    -- upvalues: v35 (ref)
    if not v35.nofall:get() then
        return;
    else
        local v112 = entity.get_local_player();
        if not v112 then
            return;
        else
            local v113 = v112:get_origin();
            if v112.m_vecVelocity.z > -500 then
                return;
            else
                local v114 = vector(v113.x, v113.y, v113.z);
                local v115 = vector(v113.x, v113.y, v113.z - 50);
                local v116 = vector(v113.x, v113.y, v113.z - 15);
                if utils.trace_line(v114, v116).fraction ~= 1 then
                    v111.in_duck = 0;
                elseif utils.trace_line(v114, v115).fraction ~= 1 then
                    v111.in_duck = 1;
                end;
                return;
            end;
        end;
    end;
end;
v84.autostop_func = function(v117, v118)
    local v119 = math.sqrt(v117.forwardmove * v117.forwardmove + v117.sidemove * v117.sidemove);
    if v118 <= 0 or v119 <= 0 then
        return;
    else
        if v117.in_duck == 1 then
            v118 = v118 * 2.94117647;
        end;
        if v119 <= v118 then
            return;
        else
            local v120 = v118 / v119;
            v117.forwardmove = v117.forwardmove * v120;
            v117.sidemove = v117.sidemove * v120;
            return;
        end;
    end;
end;
v84.daimbot = function(v121)
    -- upvalues: v38 (ref), v84 (ref)
    if not v38.dormant:get() then
        return;
    else
        local v122 = entity.get_local_player();
        if not v122 then
            return;
        else
            local v123 = v122:get_player_weapon();
            if not v123 then
                return;
            else
                local v124 = v123:get_inaccuracy();
                if not v124 then
                    return;
                else
                    local v125 = v123:get_weapon_info();
                    local _ = bit.band(v122.m_fFlags, 1) == 1;
                    local v127 = v122:get_eye_position();
                    local l_m_bIsScoped_0 = v122.m_bIsScoped;
                    local v129 = v123.m_flNextPrimaryAttack < globals.curtime;
                    local v130 = entity.get_players(true, true);
                    for v131 = 1, #v130 do
                        local v132 = v130[v131];
                        if v132:is_dormant() then
                            origin = v132:get_origin();
                            local v133 = v132:get_bbox();
                            if origin.x ~= 0 and v133.alpha ~= 0 and (v132:get_network_state() == 1 or not (v132:get_network_state() ~= 2) or not (v132:get_network_state() ~= 3) or v132:get_network_state() == 4) then
                                local v134 = origin + vector(0, 0, 30);
                                local v135 = v127:to(v134):angles();
                                local v136, v137 = utils.trace_bullet(v122, vector(v127.x, v127.y, v127.z), vector(v134.x, v134.y, v134.z), true);
                                if v137 then
                                    if not v137:did_hit_world() then
                                        return;
                                    elseif (v137.fraction < 1 or v137.fraction_left_solid == 1) and ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get() < v136 and not v132:is_visible() and v129 then
                                        v84.autostop_func(v121, (l_m_bIsScoped_0 and v125.max_player_speed_alt or v125.max_player_speed) * 0.33);
                                        if v125.weapon_class == "primary_sniper" and not l_m_bIsScoped_0 then
                                            v121.in_attack2 = 1;
                                        end;
                                        if v124 < 0.009 and v121.choked_commands == 0 then
                                            v121.view_angles.x = v135.x;
                                            v121.view_angles.y = v135.y;
                                            v121.in_attack = 1;
                                            print_dev("[DA] Shot to " .. v132:get_name() .. " | DMG: " .. v136);
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
local v138 = {
    [1] = "RamboLavenda", 
    [2] = "1tapKing", 
    [3] = "LavendaDNA", 
    [4] = "CzipiHvh", 
    [5] = "SeviPizda", 
    [6] = "HitlerHVH", 
    [7] = "LavendaLord", 
    [8] = "Gang1tap", 
    [9] = "AdekGang", 
    [10] = "LavendaPro", 
    [11] = "\197\129ysyWWA", 
    [12] = "Kr\195\179lLavendy", 
    [13] = "CzipiMaster", 
    [14] = "RamborSevi", 
    [15] = "HvhGangsta", 
    [16] = "LavendaHvh", 
    [17] = "Sevi\197\129ysy", 
    [18] = "1tapLavenda", 
    [19] = "Hitlavenda", 
    [20] = "DNA1tap", 
    [21] = "CzipikaoRambo", 
    [22] = "Lavendziok", 
    [23] = "AdekPizda", 
    [24] = "RambmboraHVH", 
    [25] = "LavendaKing", 
    [26] = "HitlerSevi", 
    [27] = "1tapWWA", 
    [28] = "CzipiDNA", 
    [29] = "GangLavenda", 
    [30] = "LavendaCzipi", 
    [31] = "Kr\195\179lWWA", 
    [32] = "\197\129ysyGang", 
    [33] = "RamboDNA", 
    [34] = "HvhKing", 
    [35] = "SeviDNA", 
    [36] = "LavendaHitler", 
    [37] = "1tapKr\195\179l", 
    [38] = "DNAHvh", 
    [39] = "LavendaRambo", 
    [40] = "GangCzipikao"
};
v35.nickname_generator:set_callback(function()
    -- upvalues: v138 (ref)
    common.set_name(v138[math.random(1, #v138)]);
end);
local v139 = {
    [1] = "Co dzi\197\155 masz w planie. ~ quit ?", 
    [2] = ".... tyle ci powiem NN", 
    [3] = "Lavenda to topka tw\195\179j ojciec przegra\197\130 w totolotka", 
    [4] = "1 le\197\188y skibidi", 
    [5] = "Anotha day, anotha carry by LaVenda", 
    [6] = "Wyli\197\188 mi lewego palca u st\195\179pki", 
    [7] = "Wida\196\135 \197\188e podziwiasz mnie", 
    [8] = "\226\151\166\194\176\203\154\194\176\226\151\166. \226\157\128L\206\177V\210\189\201\179\212\131\206\177\226\157\128 .\226\151\166\194\176\203\154\194\176\226\151\166", 
    [9] = "L A V E N D A", 
    [10] = "W + Lavenda no kill ok ok", 
    [11] = "\226\157\128L\195\165V\195\170\195\177\195\144\195\165\226\157\128- \239\189\144\239\189\146\239\189\143\239\189\132. \239\189\130\239\189\153 \195\144\195\154\195\135H & V\195\136K\194\167\195\154R", 
    [12] = "\226\157\128L\206\177V\210\189\201\179\212\131\206\177\226\157\128- Mocarny Scrypt", 
    [13] = "Ja se tapie jak chce a ty p\197\130aczesz", 
    [14] = "Dawaj kup se lavende", 
    [15] = "\226\152\130\240\157\147\155\240\157\147\170\240\157\147\165\240\157\147\174\240\157\147\183\240\157\147\173\240\157\147\170 \240\157\147\163\240\157\147\184\240\157\147\185\226\152\130", 
    [16] = "To jest moc jak tam twoje lua ?", 
    [17] = "Lavenda m\195\179wi: koniec \197\188art\195\179w, le\197\188ysz", 
    [18] = "Wsta\197\132 i spr\195\179buj jeszcze raz... chocia\197\188 w sumie po co", 
    [19] = "GG ez, Lavenda rz\196\133dzi", 
    [20] = "Skibidi nie \197\188yje, a ty zaraz do\197\130\196\133czysz", 
    [21] = "Zam\195\179w pizz\196\153, bo na wygran\196\133 ju\197\188 nie ma szans", 
    [22] = "\226\157\128L\206\177V\210\189\201\179\212\131\206\177\226\157\128 rozjecha\197\130 ci\196\153 jak walec", 
    [23] = "Daj spok\195\179j, lepiej wyjd\197\186 z gry", 
    [24] = "Jak zwykle Lavenda to carry, reszta to t\197\130o", 
    [25] = "Le\197\188ysz szybciej ni\197\188 internet na wakacjach", 
    [26] = "Wyloguj si\196\153 i przemy\197\155l swoje decyzje", 
    [27] = "Lavenda lvl GOD \226\128\147 ty lvl bot", 
    [28] = "Nawet AI by si\196\153 ciebie wstydzi\197\130o", 
    [29] = "Nie p\197\130acz, Lavenda tylko robi swoje", 
    [30] = "Game over, Lavenda wins again", 
    [31] = "\226\157\128L\195\165V\195\170\195\177\195\144\195\165\226\157\128 m\195\179wi: lepiej nie wracaj", 
    [32] = "Dla Lavendy to by\197\130a rozgrzewka, a ty le\197\188ysz", 
    [33] = "\226\152\130\240\157\147\155\240\157\147\170\240\157\147\165\240\157\147\174\240\157\147\183\240\157\147\173\240\157\147\170 \240\157\147\163\240\157\147\184\240\157\147\185\226\152\130 i koniec twoich marze\197\132", 
    [34] = "Twoje staty s\196\133 jak memy \226\128\147 \197\155mieszne i \197\188a\197\130osne", 
    [35] = "\226\157\128Lavenda\226\157\128 rozdaje bilety do lobby", 
    [36] = "Runda sko\197\132czona, Lavenda to zrobi\197\130 z klas\196\133", 
    [37] = "Powiedz mamie, \197\188e dzisiaj przegra\197\130e\197\155 z Lavend\196\133", 
    [38] = "Anotha frag, Lavenda to kr\195\179l tej mapy"
};
local v140 = {
    [1] = "Ale mia\197\130e\197\155 szcz\196\153\197\155cie, nast\196\153pnym razem ci\196\153 zmiot\196\153.", 
    [2] = "Masz farta, Lavenda dzi\197\155 odpuszcza.", 
    [3] = "No bywa, nawet mistrz czasem ma pecha.", 
    [4] = "Strzeli\197\130em miss, ale dalej jeste\197\155 botem.", 
    [5] = "NL nie strzela, tylko si\196\153 bawi z tob\196\133.", 
    [6] = "Stupid idiot, naucz si\196\153 gra\196\135.", 
    [7] = "Shit resolver, a i tak jeste\197\155 s\197\130aby.", 
    [8] = "Zaliczy\197\130em miss, ale ty zaliczasz tylko pora\197\188ki.", 
    [9] = "Verdammter Idiot, nawet nie wiesz, jak ci si\196\153 uda\197\130o.", 
    [10] = "2k m\195\169dias xddddddd, a ja si\196\153 \197\155miej\196\153.", 
    [11] = "M\195\179j b\197\130\196\133d, tw\195\179j fart.", 
    [12] = "Trzeba ci\196\153 zostawi\196\135 na p\195\179\197\186niej, teraz szkoda czasu.", 
    [13] = "Miss, ale Lavenda nie odpuszcza.", 
    [14] = "Masz szcz\196\153\197\155cie, \197\188e Lavenda dzi\197\155 nie w formie.", 
    [15] = "Na razie ci daruj\196\153, ale to tylko wyj\196\133tek.", 
    [16] = "By\197\130o blisko, ale nast\196\153pnym razem nie b\196\153dzie.", 
    [17] = "Nie dzi\197\155, ale za chwil\196\153 ci\196\153 rozwale.", 
    [18] = "Zapisz ten moment, bo to jedyny raz, kiedy co\197\155 osi\196\133gn\196\133\197\130e\197\155.", 
    [19] = "To tylko op\195\179\197\186nienie wyroku.", 
    [20] = "Jak si\196\153 cieszysz, to znaczy, \197\188e to jedyny raz, kiedy wygra\197\130e\197\155.", 
    [21] = "Bierz to jako prezent od Lavendy.", 
    [22] = "Jak masz szcz\196\153\197\155cie, to id\197\186 zagra\196\135 w totka.", 
    [23] = "To tylko \197\130ut szcz\196\153\197\155cia, dalej jeste\197\155 zerem.", 
    [24] = "Zrobi\197\130e\197\155 to przez przypadek, przyznaj si\196\153.", 
    [25] = "To nie ty wygra\197\130e\197\155, to ja chwilowo przegra\197\130em.", 
    [26] = "NL bawi si\196\153 twoj\196\133 nadziej\196\133.", 
    [27] = "Nie zas\197\130u\197\188y\197\130e\197\155 na to, ale prosz\196\153.", 
    [28] = "Zachowaj to na pami\196\133tk\196\153, to si\196\153 wi\196\153cej nie powt\195\179rzy.", 
    [29] = "Strzeli\197\130em miss, ale dalej jeste\197\155 cienki.", 
    [30] = "Brawo, fart na pe\197\130nej.", 
    [31] = "Wygra\197\130e\197\155 rund\196\153, ale Lavenda wygra wszystko.", 
    [32] = "Dzi\197\155 ci odpuszczam, bo mi si\196\153 nie chce.", 
    [33] = "Uda\197\130o ci si\196\153, ale tylko dzi\196\153ki bugom.", 
    [34] = "To by\197\130o na pr\195\179b\196\153, nast\196\153pnym razem ju\197\188 nie masz szans.", 
    [35] = "Ale ty wiesz, \197\188e to by\197\130 czysty przypadek?", 
    [36] = "Miss, ale wci\196\133\197\188 jestem lepszy.", 
    [37] = "Jak to m\195\179wi klasyk: 'Raz na ruski rok'.", 
    [38] = "Pami\196\153taj, \197\188e to tylko chwilowe.", 
    [39] = "Dzi\197\155 ci\196\153 zostawi\196\153, ale jutro p\197\130aczesz.", 
    [40] = "Mog\196\153 strzela\196\135 missy, ale ty dalej nic nie potrafisz."
};
events.player_death:set(function(v141)
    -- upvalues: v35 (ref), v139 (ref), v140 (ref)
    if not v35.trashtalk:get() then
        return;
    else
        local v142 = entity.get_local_player();
        if v35.trashtalk_triggers:get("On Kill") and entity.get(v141.attacker, true) == v142 and entity.get(v141.userid, true) ~= v142 then
            utils.execute_after(3, utils.console_exec, "say " .. v139[math.random(1, #v139)]);
        end;
        if v35.trashtalk_triggers:get("On Death") and entity.get(v141.attacker, true) ~= v142 and entity.get(v141.userid, true) == v142 then
            utils.execute_after(3, utils.console_exec, "say " .. v140[math.random(1, #v140)]);
        end;
        return;
    end;
end);
local v143 = {};
local v144 = render.screen_size() / 2;
local _ = l_gradient_1.text_animate("\240\157\144\139 \240\157\144\128 \240\157\144\149 \240\157\144\132 \240\157\144\141 \240\157\144\131 \240\157\144\128", 1, {
    color(220, 220, 220), 
    color(220, 220, 220), 
    color(220, 220, 220)
});
v143.watermark = function()
    -- upvalues: v37 (ref), v144 (ref)
    local l_realtime_2 = globals.realtime;
    local v147 = math.abs(math.sin(l_realtime_2 * 2));
    local v148 = math.floor(30 + 165 * v147);
    local v149 = math.floor(30 + 225 * v147);
    local v150 = math.floor(30 + 157 * v147);
    local v151 = "*\224\169\136\226\156\169\226\128\167\203\154\224\188\186 \240\157\144\139 \240\157\144\128 \240\157\144\149 \240\157\144\132 \240\157\144\141 \240\157\144\131 \240\157\144\128 \224\188\187*\224\169\136\226\156\169\226\128\167";
    local v152 = render.measure_text(5, nil, v151);
    local v153 = nil;
    if v37.watermark_position:get() == "Left" then
        v153 = vector(25, v144.y);
    elseif v37.watermark_position:get() == "Right" then
        v153 = vector(v144.x * 2 - v152.x - 25, v144.y);
    elseif v37.watermark_position:get() == "Down" then
        v153 = vector(v144.x - v152.x / 2, v144.y * 2 - 20);
    end;
    if v153 then
        local v154 = color(v148, v149, v150, 255);
        render.text(5, v153 + vector(1, 1), color(0, 0, 0, 120), nil, v151);
        render.text(5, v153, v154, nil, v151);
    end;
end;
math.lerp = function(v155, v156, v157)
    return v155 + (v156 - v155) * globals.frametime * v157;
end;
v143.gs_indicator = function()
    -- upvalues: l_indicator_0 (ref)
    y = 30;
    local v158 = ui.get_binds();
    for v159 in pairs(v158) do
        if v158[v159].name == "Fake Latency" and v158[v159].active then
            l_indicator_0.indicator(color(), "\a22A419FFPING", y, true);
            y = y - 35;
        end;
        if v158[v159].name == "Hit Chance" and v158[v159].active then
            l_indicator_0.indicator(color(240, 240, 240, 240), "HC: " .. ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"):get(), y, true);
            y = y - 35;
        end;
        if v158[v159].name == "Min. Damage" and v158[v159].active then
            l_indicator_0.indicator(color(240, 240, 240, 240), "DMG: " .. ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get(), y, true);
            y = y - 35;
        end;
    end;
    if ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"):get() == "Force" then
        l_indicator_0.indicator(color(240, 240, 240, 240), "SAFE", y, true);
        y = y - 35;
    end;
    if ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"):get() == "Force" then
        l_indicator_0.indicator(color(240, 240, 240, 240), "BAIM", y, true);
        y = y - 35;
    end;
    if ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get() then
        l_indicator_0.indicator(color(240, 240, 240, 240), "DUCK", y, true);
        y = y - 35;
    end;
    if ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):get() then
        l_indicator_0.indicator(color(240, 240, 240, 240), "FS", y, true);
        y = y - 35;
    end;
    if ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() then
        l_indicator_0.indicator(color(240, 240, 240, 240), "OSAA", y, true);
        y = y - 35;
    end;
    if ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() then
        l_indicator_0.indicator(color(220, 220 * rage.exploit:get(), 260 * rage.exploit:get(), 255), "\a9cff99FFDT", y, true);
        y = y - 35;
    end;
    if ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"):get() then
        l_indicator_0.indicator(color(240, 240, 240, 240), "DA", y, true);
        y = y - 35;
    end;
end;
local v160 = 0;
local v161 = "GLOBAL";
v143.cross_ind = function()
    -- upvalues: v160 (ref), l_gradient_1 (ref), v36 (ref), v161 (ref), v144 (ref), v48 (ref), v21 (ref)
    local v162 = entity.get_local_player();
    if v162 == nil or not v162:is_alive() then
        return;
    else
        local v163 = ui.get_binds();
        local l_m_bIsScoped_1 = v162.m_bIsScoped;
        local v165 = 0;
        v160 = l_m_bIsScoped_1 and math.lerp(v160, 50, 20) or math.lerp(v160, 0, 20);
        local v166 = l_gradient_1.text_animate(" \240\157\153\135\240\157\152\188\240\157\153\145\240\157\153\128\240\157\153\137\240\157\152\191\240\157\152\188 ", 1, {
            v36.crosshair_ind_color1:get(), 
            v36.crosshair_ind_color2:get(), 
            v36.crosshair_ind_color3:get()
        });
        local v167 = l_gradient_1.text_animate("\240\157\144\139\240\157\144\154\240\157\144\175\240\157\144\158\240\157\144\167\240\157\144\157\240\157\144\154", 1, {
            v36.crosshair_ind_color1:get(), 
            v36.crosshair_ind_color2:get(), 
            v36.crosshair_ind_color3:get()
        });
        local v168 = l_gradient_1.text_animate("\240\157\149\131\240\157\149\146\240\157\149\167\240\157\149\150\240\157\149\159\240\157\149\149\240\157\149\146", 1, {
            v36.crosshair_ind_color1:get(), 
            v36.crosshair_ind_color2:get(), 
            v36.crosshair_ind_color3:get()
        });
        if v36.crosshair_ind_type:get() == "Default" then
            ind_font = 6;
            ind_text = v168:get_animated_text();
            state_text = v161;
            v166:animate();
        elseif v36.crosshair_ind_type:get() == "Modern" then
            ind_font = 7;
            ind_text = string.lower(v166:get_animated_text());
            state_text = string.lower(v161);
            v166:animate();
        else
            v167:animate();
            ind_font = 1;
            ind_text = v167:get_animated_text();
            state_text = string.lower(v161);
        end;
        render.text(ind_font, vector(v144.x + v160, v144.y + 15), color(255), "c", ind_text);
        if v36.crosshair_ind_key:get(8) then
            if v48 == 1 then
                v161 = "GLOBAL";
            elseif v48 == 2 then
                v161 = "stand";
            elseif v48 == 3 then
                v161 = "run";
            elseif v48 == 4 then
                v161 = "crouch";
            elseif v48 == 5 then
                v161 = "air";
            elseif v48 == 6 then
                v161 = "air+c";
            end;
            render.text(ind_font, vector(v144.x + v160, v144.y + 25), color(255), "c", state_text);
            v165 = v165 + 15;
        end;
        for v169 = 1, #v163 do
            if v36.crosshair_ind_key:get(4) and v163[v169].name == "Body Aim" then
                render.text(v36.crosshair_ind_type:get() == "Default" and 2 or 1, vector(v144.x + v160, v144.y + 22 + v165), color(255, 255, 255, 255), "c", v36.crosshair_ind_type:get() == "Default" and "BAIM" or "baim");
                v165 = v165 + 15;
            end;
            if v36.crosshair_ind_key:get(1) and v163[v169].name == "Min. Damage" then
                render.text(v36.crosshair_ind_type:get() == "Default" and 2 or 1, vector(v144.x + v160, v144.y + 22 + v165), color(255, 255, 255, 255), "c", v36.crosshair_ind_type:get() == "Default" and "DMG" or "dmg");
                v165 = v165 + 15;
            end;
            if v36.crosshair_ind_key:get(5) and v163[v169].name == "Safe Points" then
                render.text(v36.crosshair_ind_type:get() == "Default" and 2 or 1, vector(v144.x + v160, v144.y + 22 + v165), color(255, 255, 255, 255), "c", v36.crosshair_ind_type:get() == "Default" and "SAFE" or "safe");
                v165 = v165 + 15;
            end;
            if v36.crosshair_ind_key:get(7) and v163[v169].name == "Hit Chance" then
                render.text(v36.crosshair_ind_type:get() == "Default" and 2 or 1, vector(v144.x + v160, v144.y + 22 + v165), color(255, 255, 255, 255), "c", v36.crosshair_ind_type:get() == "Default" and "HC" or "hc");
                v165 = v165 + 15;
            end;
            if v36.crosshair_ind_key:get(6) and v163[v169].name == "Freestanding" then
                render.text(v36.crosshair_ind_type:get() == "Default" and 2 or 1, vector(v144.x + v160, v144.y + 22 + v165), color(255, 255, 255, 255), "c", v36.crosshair_ind_type:get() == "Default" and "FS" or "fs");
                v165 = v165 + 15;
            end;
        end;
        if v36.crosshair_ind_key:get(2) and v21.dt:get() then
            render.text(v36.crosshair_ind_type:get() == "Default" and 2 or 1, vector(v144.x + v160, v144.y + 21 + v165), color(255, rage.exploit:get() * 255, rage.exploit:get() * 255, 255), "c", v36.crosshair_ind_type:get() == "Default" and "DT" or "dt");
            v165 = v165 + 15;
        end;
        if v36.crosshair_ind_key:get(3) and v21.hs:get() then
            render.text(v36.crosshair_ind_type:get() == "Default" and 2 or 1, vector(v144.x + v160, v144.y + 22 + v165), color(255, rage.exploit:get() * 255, rage.exploit:get() * 255, 255), "c", v36.crosshair_ind_type:get() == "Default" and "HS" or "hs");
            v165 = v165 + 15;
        end;
        return;
    end;
end;
local v170 = render.load_font("Calibri", 20, "a");
local v171 = 0;
v143.arrows = function()
    -- upvalues: v171 (ref), v36 (ref), v170 (ref), v144 (ref), v58 (ref), v59 (ref)
    local v172 = entity.get_local_player();
    if v172 == nil then
        return;
    elseif not v172:is_alive() then
        return;
    else
        v171 = math.lerp(v171, v172.m_bIsScoped and 30 or 0, 20);
        local v173 = color(v36.aa_arrows_color:get().r, v36.aa_arrows_color:get().g, v36.aa_arrows_color:get().b, 255);
        local v174 = color(v36.aa_arrows_color2:get().r, v36.aa_arrows_color2:get().g, v36.aa_arrows_color2:get().b, 255);
        local v175 = render.measure_text(4, nil, ">");
        render.text(v170, vector(v144.x - 40 - v175.x / 2, v144.y - v175.y / 2 - v171), v58 and v174 or v173, "", "<");
        render.text(v170, vector(v144.x + 40, v144.y - v175.y / 2 - v171), v59 and v174 or v173, "", ">");
        return;
    end;
end;
local v176 = {};
local function v185()
    -- upvalues: v144 (ref), v176 (ref), v35 (ref)
    local v177 = 0;
    local v178 = v144.y * 1.43;
    for v179, v180 in ipairs(v176) do
        v180[2] = globals.curtime - v180[3] < 4 and (not (#v176 > 5) or v179 >= #v176 - 5) and math.lerp(v180[2], 255, 10) or math.lerp(v180[2], 0, 10);
        v177 = v177 - 40 * (v180[2] / 255);
        text_size = render.measure_text(1, "od", v180[1]);
        local v181 = 15;
        local v182 = v180[4] and v180[4].r or 255;
        local v183 = v180[4] and v180[4].g or 255;
        local v184 = v180[4] and v180[4].b or 255;
        if v35.logs_type_style:get() == "Default" then
            render.shadow(vector(v144.x - text_size.x / 2, v178 - v177 + 6), vector(v144.x + text_size.x / 2, v178 - v177 + 6), color(v182, v183, v184, v180[2]), 30, 0, 0);
        else
            render.shadow(vector(v144.x - text_size.x / 2 - 10, v178 - v177 - 5), vector(v144.x + text_size.x / 2 + 10, v178 - v177 + v181 + 5), color(v182, v183, v184, v180[2]), 30, 0, v35.logs_rounding:get());
            render.rect(vector(v144.x - text_size.x / 2 - 10, v178 - v177 - 5), vector(v144.x + text_size.x / 2 + 10, v178 - v177 + v181 + 5), color(20, 20, 20, v180[2]), v35.logs_rounding:get());
        end;
        render.text(1, vector(v144.x - text_size.x / 2, v178 - v177), color(255, 255, 255, v180[2] / 255 * 255), "od", v180[1]);
        if v180[2] < 0.1 or not entity.get_local_player() then
            table.remove(v176, v179);
        end;
    end;
end;
render.notify = function(v186, v187)
    -- upvalues: v176 (ref)
    table.insert(v176, {
        [1] = nil, 
        [2] = 0, 
        [1] = v186, 
        [3] = globals.curtime, 
        [4] = v187
    });
end;
render.notify("\aBAC4F9F7" .. ui.get_icon("flower-tulip") .. "\aFFFFFFFF Welcome back, \aBAC4F9F7" .. common.get_username(), color(v35.logs_hit:get().r, v35.logs_hit:get().g, v35.logs_hit:get().b, 255));
local v188 = {
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
local v189 = {};
events.aim_ack:set(function(v190)
    -- upvalues: v35 (ref), v188 (ref), v23 (ref), v189 (ref)
    local v191 = entity.get(v190.target);
    if not v191 then
        return;
    else
        if v190.state == nil then
            local v192 = color(v35.logs_hit:get().r, v35.logs_hit:get().g, v35.logs_hit:get().b, 255);
            local v193 = v192:to_hex();
            local v194 = ("\a8ef4ffFF[ H I T ]   \194\187  Registered shot in %s %s for %d damage (hitchance: %d%% | safety: 1 | BT ~ ( %d )"):format(v191:get_name(), v188[v190.hitgroup], v190.damage, v190.hitchance, v190.backtrack);
            if v35.logs_type_style:get() == "Default" then
                hit_scr = ("\a" .. v193 .. "LaVenda\aFFFFFFFF \194\187 Hit \a" .. v193 .. "%s's \aFFFFFFFF%s (%d%%) for \a" .. v193 .. "%d \aFFFFFFFFdmg"):format(v191:get_name(), v188[v190.hitgroup], v190.hitchance, v190.damage);
            else
                hit_scr = ("\a" .. v193 .. "" .. ui.get_icon("gun") .. " \aFFFFFFFFHit \a" .. v193 .. "%s's \aFFFFFFFF%s (%d%%) for \a" .. v193 .. "%d \aFFFFFFFFdmg"):format(v191:get_name(), v188[v190.hitgroup], v190.hitchance, v190.damage);
            end;
            if v35.logs:get() and v35.logs_type:get("Screen") then
                render.notify(hit_scr, v192);
            end;
            if v35.logs:get() and v35.logs_type:get("Event") then
                print_dev(v194);
            end;
            if v35.logs:get() and v35.logs_type:get("Console") then
                print_raw(v194);
            end;
            v23[1] = v23[1] + 1;
            v189[globals.tickcount] = {
                [1] = nil, 
                [2] = nil, 
                [3] = nil, 
                [4] = 0, 
                [1] = v190.aim, 
                [2] = v190.damage, 
                [3] = globals.curtime + 4
            };
        else
            local v195 = color(v35.logs_miss:get().r, v35.logs_miss:get().g, v35.logs_miss:get().b, 255);
            local v196 = v195:to_hex();
            local v197 = ("\aff9191FF [ M I S ]   \194\187  Missed shot at %s %s a(%d%%) due to %s dmg: %d safety: 1 & BT ~ ( %d )"):format(v191:get_name(), v188[v190.wanted_hitgroup], v190.hitchance, v190.state, v190.wanted_damage, v190.backtrack);
            if v35.logs_type_style:get() == "Default" then
                miss_scr = ("\a" .. v196 .. "LaVenda\aFFFFFFFF \194\187 Missed \a" .. v196 .. "%s's \aFFFFFFFF%s (%d%%) due to \a" .. v196 .. "%s"):format(v191:get_name(), v188[v190.wanted_hitgroup], v190.hitchance, v190.state);
            else
                miss_scr = ("\a" .. v196 .. "" .. ui.get_icon("gun") .. " \aFFFFFFFFMissed \a" .. v196 .. "%s's \aFFFFFFFF%s (%d%%) due to \a" .. v196 .. "%s"):format(v191:get_name(), v188[v190.wanted_hitgroup], v190.hitchance, v190.state);
            end;
            if v35.logs:get() and v35.logs_type:get("Screen") then
                render.notify(miss_scr, v195);
            end;
            if v35.logs:get() and v35.logs_type:get("Event") then
                print_dev(v197);
            end;
            if v35.logs:get() and v35.logs_type:get("Console") then
                print_raw(v197);
            end;
        end;
        return;
    end;
end);
local function v204(v198, v199)
    if v198 == nil then
        return;
    elseif v199 == nil then
        return;
    else
        local v200 = v198:get_player_weapon();
        if v200 == nil then
            return;
        else
            local v201 = v200:get_weapon_index();
            local v202 = v198:get_origin():dist((v199:get_origin()));
            local v203 = v199.m_ArmorValue == 0;
            if v201 ~= 64 or not v203 then
                return 0;
            elseif v202 < 585 and v202 > 511 then
                return 1;
            elseif v202 < 511 then
                return 2;
            else
                return 0;
            end;
        end;
    end;
end;
local _ = esp.enemy:new_text("R8 Helper", "DMG +", function(v205)
    -- upvalues: v38 (ref), v204 (ref)
    if not v38.r8_helper:get() then
        return;
    else
        local v206 = entity.get_local_player();
        if not v206 then
            return;
        elseif v204(v206, v205) == 1 then
            return "DMG";
        elseif v204(v206, v205) == 2 then
            return "DMG +";
        else
            return;
        end;
    end;
end);
v143.customscope = function()
    -- upvalues: v144 (ref), v36 (ref)
    local l_x_0 = v144.x;
    local l_y_0 = v144.y;
    local v210 = entity.get_local_player();
    if not v210 then
        return;
    elseif not v210:is_alive() then
        return;
    else
        local l_m_bIsScoped_2 = v210.m_bIsScoped;
        local v212 = v36.custom_scope_color:get();
        local v213 = color(v212.r, v212.g, v212.b, 1);
        if l_m_bIsScoped_2 then
            render.gradient(vector(l_x_0, l_y_0 + v36.custom_scope_offset:get()), vector(l_x_0 + 1, l_y_0 + v36.custom_scope_length:get() + v36.custom_scope_offset:get()), v212, v212, v213, v213);
            render.gradient(vector(l_x_0 + v36.custom_scope_length:get() + v36.custom_scope_offset:get(), l_y_0), vector(l_x_0 + v36.custom_scope_offset:get(), l_y_0 + 1), v213, v212, v213, v212);
            render.gradient(vector(l_x_0, l_y_0 - (v36.custom_scope_offset:get() - 1) - v36.custom_scope_length:get()), vector(l_x_0 + 1, l_y_0 - (v36.custom_scope_offset:get() - 1)), v213, v213, v212, v212);
            render.gradient(vector(l_x_0 - v36.custom_scope_length:get() - (v36.custom_scope_offset:get() - 1), l_y_0), vector(l_x_0 - (v36.custom_scope_offset:get() - 1), l_y_0 + 1), v213, v212, v213, v212);
        end;
        return;
    end;
end;
v143.world_damage = function()
    -- upvalues: v189 (ref), v36 (ref)
    local v214 = entity.get_local_player();
    if not v214 then
        v189 = {};
        return;
    elseif not v214:is_alive() then
        return;
    else
        for _, v216 in pairs(v189) do
            if globals.curtime <= v216[3] then
                if v216[1] == nil then
                    return;
                else
                    active_pos = render.world_to_screen(v216[1]);
                    if active_pos ~= nil then
                        local v217 = v216[3] - globals.curtime;
                        local v218 = math.floor(255 * (v217 / 2));
                        local v219 = color(v36.world_damage_color:get().r, v36.world_damage_color:get().g, v36.world_damage_color:get().b, v218);
                        v216[4] = math.lerp(v216[4], 20, 1);
                        render.text(v36.world_damage_font:get(), vector(active_pos.x * 1.02, active_pos.y * 0.96 - math.floor(v216[4])), v219, "c", v216[2]);
                    end;
                end;
            end;
        end;
        return;
    end;
end;
draw_circle_outline = function(v220, v221, v222, v223)
    if type(v223) ~= "userdata" then
        v223 = color(255, 255, 255, 255);
    end;
    local v224 = 2 * math.pi / v222;
    for v225 = 0, v222 - 1 do
        local v226 = v225 * v224;
        local v227 = (v225 + 1) * v224;
        local v228 = v220.x + math.cos(v226) * v221;
        local v229 = v220.y + math.sin(v226) * v221;
        local v230 = v220.x + math.cos(v227) * v221;
        local v231 = v220.y + math.sin(v227) * v221;
        render.line(vector(v228, v229), vector(v230, v231), v223);
    end;
end;
v143.hitmarker = function()
    -- upvalues: v189 (ref), v36 (ref)
    local v232 = entity.get_local_player();
    if not v232 or not v232:is_alive() then
        v189 = {};
        return;
    else
        for _, v234 in pairs(v189) do
            if globals.curtime <= v234[3] then
                if not v234[1] then
                    return;
                else
                    local v235 = render.world_to_screen(v234[1]);
                    if not v235 then
                        return;
                    else
                        local v236 = 1 - (v234[3] - globals.curtime) / 2;
                        local v237 = math.floor(255 * (1 - v236));
                        local v238 = v36.world_hitmarker_color:get();
                        local v239 = color(v238.r, v238.g, v238.b, v237);
                        local v240 = v36.world_hitmarker_size:get();
                        local v241 = v236 * 360;
                        local l_x_1 = v235.x;
                        local l_y_1 = v235.y;
                        ui.find("Visuals", "World", "Other", "Hit Marker"):override(false);
                        local v244 = v36.world_hitmarker_type:get();
                        do
                            local l_v236_0, l_l_x_1_0, l_l_y_1_0 = v236, l_x_1, l_y_1;
                            if v244 == "Kibit" then
                                local function v255(v248, v249)
                                    -- upvalues: l_v236_0 (ref), l_l_x_1_0 (ref), l_l_y_1_0 (ref)
                                    local v250 = l_v236_0 * math.pi * 2;
                                    local v251 = math.cos(v250);
                                    local v252 = math.sin(v250);
                                    local v253 = l_l_x_1_0 + (v248 * v251 - v249 * v252);
                                    local v254 = l_l_y_1_0 + (v248 * v252 + v249 * v251);
                                    return vector(v253, v254);
                                end;
                                render.line(v255(v240, -v240), v255(v240, v240), v239);
                                render.line(v255(0, 0), v255(v240 * 2, 0), v239);
                            elseif v244 == "Default" then
                                local function v263(v256, v257)
                                    -- upvalues: l_v236_0 (ref), l_l_x_1_0 (ref), l_l_y_1_0 (ref)
                                    local v258 = l_v236_0 * math.pi * 2;
                                    local v259 = math.cos(v258);
                                    local v260 = math.sin(v258);
                                    local v261 = l_l_x_1_0 + (v256 * v259 - v257 * v260);
                                    local v262 = l_l_y_1_0 + (v256 * v260 + v257 * v259);
                                    return vector(v261, v262);
                                end;
                                render.line(v263(-v240, -v240), v263(v240, v240), v239);
                                render.line(v263(v240, -v240), v263(-v240, v240), v239);
                            elseif v244 == "Circle" then
                                local l_v241_0 = v241;
                                local v265 = v241 + 270;
                                draw_circle_outline(vector(l_l_x_1_0, l_l_y_1_0), v240 + l_v236_0 * 5, l_v241_0, v265, v239, 64);
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
local l_x_2 = render.screen_size().x;
local l_y_2 = render.screen_size().y;
local v268 = 0;
local v269 = 1;
local _ = 0;
local v271 = 0;
local v272 = {
    [""] = {
        alphak = 0
    }
};
local _ = 1;
local v274 = 255;
local v275 = v22.visuals:slider("winx", 0, l_x_2, 400);
local v276 = v22.visuals:slider("winy", 0, l_y_2, 400);
local v277 = v22.visuals:slider("winx1", 0, l_x_2, 300);
local v278 = v22.visuals:slider("winy1", 0, l_y_2, 300);
v275:visibility(false);
v276:visibility(false);
v277:visibility(false);
v278:visibility(false);
render.window = function(v279, v280, v281, v282, v283, v284)
    -- upvalues: v36 (ref)
    if not entity.get_local_player() then
        return;
    else
        local v285 = render.measure_text(1, "", v283);
        local v286 = render.measure_text(1, "", ui.get_icon("knife-kitchen") .. " " .. v283);
        local v287 = v36.windows_ui_color:get();
        local l_r_0 = v287.r;
        local l_g_0 = v287.g;
        local l_b_0 = v287.b;
        if v36.windows_ui_type:get() == "Default" then
            render.rect(vector(v279, v280), vector(v279 + v281 + 3, v280 + 19), color(l_r_0, l_g_0, l_b_0, v284), 4);
            render.shadow(vector(v279, v280), vector(v279 + v281 + 3, v280 + 19), color(l_r_0, l_g_0, l_b_0, v284), 20, 0, 2);
            render.rect(vector(v279, v280 + 2), vector(v279 + v281 + 3, v280 + 19), color(20, 20, 20, v284 / 25), 0);
            render.text(1, vector(v279 + 3 + v281 / 2 + 1 - v285.x / 2, v280 + 2 + v282 / 2 - v285.y / 2), color(255, 255, 255, v284), "", v283);
        else
            render.shadow(vector(v279, v280), vector(v279 + v281 + 3, v280 + 19), color(l_r_0, l_g_0, l_b_0, v284), 20, 0, v36.windows_ui_round:get());
            render.rect(vector(v279, v280), vector(v279 + v281 + 3, v280 + 19), color(20, 20, 20, v284), v36.windows_ui_round:get());
            render.text(1, vector(v279 + 3 + v281 / 2 + 1 - v286.x / 2, v280 + 1 + v282 / 2 - v286.y / 2), color(255, 255, 255, v284), "", "\a" .. v287:to_hex() .. ui.get_icon("knife-kitchen") .. "\aFFFFFFFF " .. v283);
        end;
        return;
    end;
end;
local function v295()
    -- upvalues: l_mtools_0 (ref), v36 (ref), l_x_2 (ref)
    local v291 = common.get_date("%H:%M:%S");
    local v292 = globals.is_in_game and " | " .. l_mtools_0.Client.GetPing() .. "ms" or "";
    local v293 = "lavenda | " .. common.get_username() .. v292 .. " | " .. v291 .. " ";
    local v294 = nil;
    if v36.windows_ui_type:get() == "Default" then
        v294 = render.measure_text(1, "", v293).x;
    else
        v294 = render.measure_text(1, "", ui.get_icon("knife-kitchen") .. " " .. v293).x;
    end;
    render.window(l_x_2 - v294 - 19, 10, v294 + 4, 16, v293, 400);
end;
lerpx = function(v296, v297, v298)
    return v297 * (1 - v296) + v298 * v296;
end;
local v313 = l_system_0.register({
    [1] = v275, 
    [2] = v276
}, vector(130, 50), "Keybind", function(v299)
    -- upvalues: v272 (ref), v271 (ref), v269 (ref), v268 (ref)
    local v300 = 120;
    local _ = globals.frametime * 16;
    local v302 = 0;
    local v303 = {};
    local v304 = ui.get_binds();
    for v305 = 1, #v304 do
        local v306 = v304[v305];
        local v307 = v306.mode == 1 and "hold" or v306.mode == 2 and "toggle" or "[?]";
        local _ = v306.value;
        local l_name_0 = v306.name;
        local v310 = render.measure_text(1, "", v307);
        local v311 = render.measure_text(1, "", l_name_0);
        if v272[l_name_0] == nil then
            v272[l_name_0] = {
                alphak = 0
            };
        end;
        v272[l_name_0].alphak = math.lerp(v272[l_name_0].alphak, v306.active and 255 or 0, 20);
        render.text(1, vector(v299.position.x + 3, v299.position.y + 22 + v302), color(255, v272[l_name_0].alphak), "", l_name_0);
        render.text(1, vector(v299.position.x + (v271 - v310.x - 8), v299.position.y + 22 + v302), color(255, v272[l_name_0].alphak), "", "[" .. v307 .. "]");
        v302 = v302 + 16 * v272[l_name_0].alphak / 255;
        local v312 = v310.x + v311.x + 18;
        if v312 > 119 and v300 < v312 then
            v300 = v312;
        end;
    end;
    v269 = math.lerp(v269, (not (ui.get_alpha() <= 0) or v302 > 0) and 1 or 0, 20);
    v271 = math.lerp(v271, math.max(v300, 119), 20);
    if ui.get_alpha() > 0 or v302 > 6 then
        v268 = math.lerp(v268, math.max(ui.get_alpha() * 255, v302 > 1 and 255 or 0), 20);
    elseif v302 < 15.99 and ui.get_alpha() == 0 then
        v268 = math.lerp(v268, 0, 20);
    end;
    if ui.get_alpha() or #v303 > 0 then
        render.window(v299.position.x, v299.position.y, v271, 16, "keybinds", v268);
    end;
end);
local v322 = l_system_0.register({
    [1] = v277, 
    [2] = v278
}, vector(130, 50), "Spectator", function(v314)
    -- upvalues: v274 (ref)
    local v315 = 120;
    local v316 = entity.get_local_player();
    if v316 == nil then
        return;
    else
        local v317 = v316:get_spectators();
        if v317 == nil then
            return;
        else
            for v318, v319 in pairs(v317) do
                local v320 = v319:get_name();
                local _ = render.measure_text(1, "", v320).x;
                name_sub = string.len(v320) > 20 and string.sub(v320, 0, 20) .. "..." or v320;
                render.text(1, vector(v314.position.x + 10, v314.position.y + 5 + v318 * 15), color(), "u", name_sub);
            end;
            v274 = math.lerp(v274, (not (#v316:get_spectators() <= 0) or ui.get_alpha() > 0) and 255 or 0, 20);
            if v274 > 10 then
                render.window(v314.position.x, v314.position.y, v315, 16, "spectators", v274);
            end;
            return;
        end;
    end;
end);
local function v328(v323, v324)
    if not globals.is_connected then
        return;
    else
        local v325 = "               " .. v323 .. "                      ";
        local l_tickinterval_0 = globals.tickinterval;
        local v327 = (globals.tickcount + math.floor(utils.net_channel().avg_latency[0] + 0.22 / l_tickinterval_0 + 0.5)) / math.floor(0.3 / l_tickinterval_0 + 0.5);
        v327 = v324[math.floor(v327 % #v324) + 1] + 1;
        return string.sub(v325, v327, v327 + 15);
    end;
end;
local function v330()
    -- upvalues: v35 (ref), v328 (ref)
    if not entity.get_local_player() then
        return;
    elseif not globals.is_connected then
        return;
    else
        if v35.clantag:get() then
            if globals.is_connected and globals.choked_commands then
                local v329 = v328("\226\157\128,LaVenda,\226\157\128", {
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
                    [13] = 12, 
                    [14] = 13, 
                    [15] = 14, 
                    [16] = 14, 
                    [17] = 14, 
                    [18] = 13, 
                    [19] = 12, 
                    [20] = 11, 
                    [21] = 10, 
                    [22] = 9, 
                    [23] = 8, 
                    [24] = 7, 
                    [25] = 6, 
                    [26] = 5, 
                    [27] = 4, 
                    [28] = 3, 
                    [29] = 2, 
                    [30] = 1, 
                    [31] = 0
                });
                if entity.get_game_rules().m_gamePhase == 5 or entity.get_game_rules().m_gamePhase == 4 then
                    v329 = v328("\226\157\128,LaVenda,\226\157\128", {
                        [1] = 14
                    });
                    common.set_clan_tag(v329);
                elseif v329 ~= clanTagPrev then
                    common.set_clan_tag(v329);
                end;
                clanTagPrev = v329;
            end;
            enabledPrev = false;
        elseif not v35.clantag:get() and enabledPrev == false then
            common.set_clan_tag("");
            enabledPrev = true;
        end;
        return;
    end;
end;
local v331 = l_pui_0.setup({
    [1] = v29, 
    [2] = v30, 
    [3] = v31, 
    [4] = v40, 
    [5] = v35, 
    [6] = v36
}, true);
local v332 = {};
local v333 = {};
configs_db = db.lavendalua or {};
configs_db.cfg_list = configs_db.cfg_list or {
    [1] = {
        [1] = "Default", 
        [2] = "W1t7ImJvZHl5YXciOnRydWUsImJvZHl5YXdfb3B0aW9ucyI6WyJ+Il0sImJ1aWxkZXJfYm9keXlhdyI6ZmFsc2UsImJ1aWxkZXJfYm9keXlhd19vcHRpb25zIjpbIn4iXSwiYnVpbGRlcl9sZWZ0X2xpbWl0Ijo2MC4wLCJidWlsZGVyX29mZnNldCI6MC4wLCJidWlsZGVyX3JpZ2h0X2xpbWl0Ijo2MC4wLCJidWlsZGVyX3R5cGUiOiJEaXNhYmxlZCIsImJ1aWxkZXJfeWF3IjowLjAsImRlZmVuc2l2ZSI6WyJ+Il0sImRlbGF5X3R5cGUiOjAuMCwiaGlkZGVuIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRGlzYWJsZWQiLCJoaWRkZW5fcGl0Y2hfb2Zmc2V0IjowLjAsImhpZGRlbl90eXBlIjoiRGVmYXVsdCIsImhpZGRlbl95YXciOiJEaXNhYmxlZCIsImppdHRlcl9tb2RpZmllciI6IkRpc2FibGVkIiwiaml0dGVyX29mZnNldCI6MC4wLCJqaXR0ZXJfcmFuZG9tIjowLjAsImxieV9yYW5kb20iOjAuMCwibGVmdF9saW1pdCI6NjAuMCwib3ZlcnJpZGUiOmZhbHNlLCJyaWdodF9saW1pdCI6NjAuMCwieWF3X2xlZnQiOjAuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjAuMH0seyJib2R5eWF3Ijp0cnVlLCJib2R5eWF3X29wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJidWlsZGVyX2JvZHl5YXciOnRydWUsImJ1aWxkZXJfYm9keXlhd19vcHRpb25zIjpbIkppdHRlciIsIn4iXSwiYnVpbGRlcl9sZWZ0X2xpbWl0Ijo2MC4wLCJidWlsZGVyX29mZnNldCI6LTcwLjAsImJ1aWxkZXJfcmlnaHRfbGltaXQiOjYwLjAsImJ1aWxkZXJfdHlwZSI6IkNlbnRlciIsImJ1aWxkZXJfeWF3IjowLjAsImRlZmVuc2l2ZSI6WyJEb3VibGUgVGFwIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVsYXlfdHlwZSI6MC4wLCJoaWRkZW4iOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEaXNhYmxlZCIsImhpZGRlbl9waXRjaF9vZmZzZXQiOjAuMCwiaGlkZGVuX3R5cGUiOiJCdWlsZGVyIiwiaGlkZGVuX3lhdyI6IkRpc2FibGVkIiwiaml0dGVyX21vZGlmaWVyIjoiQ2VudGVyIiwiaml0dGVyX29mZnNldCI6LTU1LjAsImppdHRlcl9yYW5kb20iOjEwLjAsImxieV9yYW5kb20iOjEwLjAsImxlZnRfbGltaXQiOjYwLjAsIm92ZXJyaWRlIjp0cnVlLCJyaWdodF9saW1pdCI6NjAuMCwieWF3X2xlZnQiOjQuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjQuMH0seyJib2R5eWF3Ijp0cnVlLCJib2R5eWF3X29wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJidWlsZGVyX2JvZHl5YXciOnRydWUsImJ1aWxkZXJfYm9keXlhd19vcHRpb25zIjpbIkppdHRlciIsIn4iXSwiYnVpbGRlcl9sZWZ0X2xpbWl0Ijo2MC4wLCJidWlsZGVyX29mZnNldCI6LTEwMC4wLCJidWlsZGVyX3JpZ2h0X2xpbWl0Ijo2MC4wLCJidWlsZGVyX3R5cGUiOiJDZW50ZXIiLCJidWlsZGVyX3lhdyI6Mi4wLCJkZWZlbnNpdmUiOlsiRG91YmxlIFRhcCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlbGF5X3R5cGUiOjguMCwiaGlkZGVuIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiRGlzYWJsZWQiLCJoaWRkZW5fcGl0Y2hfb2Zmc2V0IjowLjAsImhpZGRlbl90eXBlIjoiQnVpbGRlciIsImhpZGRlbl95YXciOiJEaXNhYmxlZCIsImppdHRlcl9tb2RpZmllciI6IkRpc2FibGVkIiwiaml0dGVyX29mZnNldCI6LTY2LjAsImppdHRlcl9yYW5kb20iOjAuMCwibGJ5X3JhbmRvbSI6MTAuMCwibGVmdF9saW1pdCI6NjAuMCwib3ZlcnJpZGUiOnRydWUsInJpZ2h0X2xpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6LTMwLjAsInlhd19yYW5kb20iOjIwLjAsInlhd19yaWdodCI6MzMuMH0seyJib2R5eWF3IjpmYWxzZSwiYm9keXlhd19vcHRpb25zIjpbIn4iXSwiYnVpbGRlcl9ib2R5eWF3IjpmYWxzZSwiYnVpbGRlcl9ib2R5eWF3X29wdGlvbnMiOlsifiJdLCJidWlsZGVyX2xlZnRfbGltaXQiOjYwLjAsImJ1aWxkZXJfb2Zmc2V0IjowLjAsImJ1aWxkZXJfcmlnaHRfbGltaXQiOjYwLjAsImJ1aWxkZXJfdHlwZSI6IkRpc2FibGVkIiwiYnVpbGRlcl95YXciOjAuMCwiZGVmZW5zaXZlIjpbIn4iXSwiZGVsYXlfdHlwZSI6MC4wLCJoaWRkZW4iOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEaXNhYmxlZCIsImhpZGRlbl9waXRjaF9vZmZzZXQiOjAuMCwiaGlkZGVuX3R5cGUiOiJEZWZhdWx0IiwiaGlkZGVuX3lhdyI6IkRpc2FibGVkIiwiaml0dGVyX21vZGlmaWVyIjoiRGlzYWJsZWQiLCJqaXR0ZXJfb2Zmc2V0IjowLjAsImppdHRlcl9yYW5kb20iOjAuMCwibGJ5X3JhbmRvbSI6MC4wLCJsZWZ0X2xpbWl0Ijo2MC4wLCJvdmVycmlkZSI6ZmFsc2UsInJpZ2h0X2xpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MC4wfSx7ImJvZHl5YXciOnRydWUsImJvZHl5YXdfb3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sImJ1aWxkZXJfYm9keXlhdyI6dHJ1ZSwiYnVpbGRlcl9ib2R5eWF3X29wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJidWlsZGVyX2xlZnRfbGltaXQiOjYwLjAsImJ1aWxkZXJfb2Zmc2V0IjotOTAuMCwiYnVpbGRlcl9yaWdodF9saW1pdCI6NjAuMCwiYnVpbGRlcl90eXBlIjoiQ2VudGVyIiwiYnVpbGRlcl95YXciOjQuMCwiZGVmZW5zaXZlIjpbIkRvdWJsZSBUYXAiLCJIaWRlIFNob3RzIiwifiJdLCJkZWxheV90eXBlIjo0LjAsImhpZGRlbiI6dHJ1ZSwiaGlkZGVuX3BpdGNoIjoiQ3VzdG9tIiwiaGlkZGVuX3BpdGNoX29mZnNldCI6LTg5LjAsImhpZGRlbl90eXBlIjoiRGVmYXVsdCIsImhpZGRlbl95YXciOiJNZXRhLVdheXMiLCJqaXR0ZXJfbW9kaWZpZXIiOiJEaXNhYmxlZCIsImppdHRlcl9vZmZzZXQiOi00Ny4wLCJqaXR0ZXJfcmFuZG9tIjowLjAsImxieV9yYW5kb20iOjAuMCwibGVmdF9saW1pdCI6NjAuMCwib3ZlcnJpZGUiOnRydWUsInJpZ2h0X2xpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6LTE5LjAsInlhd19yYW5kb20iOjEwLjAsInlhd19yaWdodCI6MzkuMH0seyJib2R5eWF3Ijp0cnVlLCJib2R5eWF3X29wdGlvbnMiOlsiSml0dGVyIiwiUmFuZG9taXplIEppdHRlciIsIn4iXSwiYnVpbGRlcl9ib2R5eWF3Ijp0cnVlLCJidWlsZGVyX2JvZHl5YXdfb3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sImJ1aWxkZXJfbGVmdF9saW1pdCI6NjAuMCwiYnVpbGRlcl9vZmZzZXQiOi04MC4wLCJidWlsZGVyX3JpZ2h0X2xpbWl0Ijo2MC4wLCJidWlsZGVyX3R5cGUiOiJDZW50ZXIiLCJidWlsZGVyX3lhdyI6My4wLCJkZWZlbnNpdmUiOlsiRG91YmxlIFRhcCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlbGF5X3R5cGUiOjAuMCwiaGlkZGVuIjpmYWxzZSwiaGlkZGVuX3BpdGNoIjoiQ3VzdG9tIiwiaGlkZGVuX3BpdGNoX29mZnNldCI6ODkuMCwiaGlkZGVuX3R5cGUiOiJEZWZhdWx0IiwiaGlkZGVuX3lhdyI6IkRlZmF1bHQiLCJqaXR0ZXJfbW9kaWZpZXIiOiJEaXNhYmxlZCIsImppdHRlcl9vZmZzZXQiOi0xMC4wLCJqaXR0ZXJfcmFuZG9tIjoxMC4wLCJsYnlfcmFuZG9tIjoxMC4wLCJsZWZ0X2xpbWl0Ijo2MC4wLCJvdmVycmlkZSI6dHJ1ZSwicmlnaHRfbGltaXQiOjYwLjAsInlhd19sZWZ0Ijo0LjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0IjozLjB9LHsiYm9keXlhdyI6dHJ1ZSwiYm9keXlhd19vcHRpb25zIjpbIkppdHRlciIsIlJhbmRvbWl6ZSBKaXR0ZXIiLCJ+Il0sImJ1aWxkZXJfYm9keXlhdyI6dHJ1ZSwiYnVpbGRlcl9ib2R5eWF3X29wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJidWlsZGVyX2xlZnRfbGltaXQiOjYwLjAsImJ1aWxkZXJfb2Zmc2V0IjotOTAuMCwiYnVpbGRlcl9yaWdodF9saW1pdCI6NjAuMCwiYnVpbGRlcl90eXBlIjoiQ2VudGVyIiwiYnVpbGRlcl95YXciOjkuMCwiZGVmZW5zaXZlIjpbIkRvdWJsZSBUYXAiLCJIaWRlIFNob3RzIiwifiJdLCJkZWxheV90eXBlIjowLjAsImhpZGRlbiI6ZmFsc2UsImhpZGRlbl9waXRjaCI6Ik1ldGEtV2F5cyIsImhpZGRlbl9waXRjaF9vZmZzZXQiOi00OS4wLCJoaWRkZW5fdHlwZSI6IkRlZmF1bHQiLCJoaWRkZW5feWF3IjoiTWV0YS1XYXlzIiwiaml0dGVyX21vZGlmaWVyIjoiRGlzYWJsZWQiLCJqaXR0ZXJfb2Zmc2V0IjotMTAuMCwiaml0dGVyX3JhbmRvbSI6MjAuMCwibGJ5X3JhbmRvbSI6MTAuMCwibGVmdF9saW1pdCI6NjAuMCwib3ZlcnJpZGUiOnRydWUsInJpZ2h0X2xpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6OC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6Ny4wfSx7ImJvZHl5YXciOnRydWUsImJvZHl5YXdfb3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sImJ1aWxkZXJfYm9keXlhdyI6ZmFsc2UsImJ1aWxkZXJfYm9keXlhd19vcHRpb25zIjpbIn4iXSwiYnVpbGRlcl9sZWZ0X2xpbWl0Ijo2MC4wLCJidWlsZGVyX29mZnNldCI6MC4wLCJidWlsZGVyX3JpZ2h0X2xpbWl0Ijo2MC4wLCJidWlsZGVyX3R5cGUiOiJEaXNhYmxlZCIsImJ1aWxkZXJfeWF3IjowLjAsImRlZmVuc2l2ZSI6WyJEb3VibGUgVGFwIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVsYXlfdHlwZSI6MC4wLCJoaWRkZW4iOmZhbHNlLCJoaWRkZW5fcGl0Y2giOiJEaXNhYmxlZCIsImhpZGRlbl9waXRjaF9vZmZzZXQiOjAuMCwiaGlkZGVuX3R5cGUiOiJEZWZhdWx0IiwiaGlkZGVuX3lhdyI6IkRpc2FibGVkIiwiaml0dGVyX21vZGlmaWVyIjoiQ2VudGVyIiwiaml0dGVyX29mZnNldCI6LTE1LjAsImppdHRlcl9yYW5kb20iOjAuMCwibGJ5X3JhbmRvbSI6MC4wLCJsZWZ0X2xpbWl0Ijo2MC4wLCJvdmVycmlkZSI6dHJ1ZSwicmlnaHRfbGltaXQiOjYwLjAsInlhd19sZWZ0Ijo2LjAsInlhd19yYW5kb20iOjEwLjAsInlhd19yaWdodCI6OC4wfV1d"
    }
};
configs_db.menu_list = configs_db.menu_list or {
    [1] = "Default"
};
configs_db.cfg_list[1][2] = "W3siYW5pbV9icmVha2VyIjp0cnVlLCJhbmltX2JyZWFrZXJfYWlyIjoiU3RhdGljIExlZ3MiLCJhbmltX2JyZWFrZXJfZ3JvdW5kIjoiSml0dGVyIiwiYW5pbV9icmVha2VyX2xlYW4iOjU0LjAsImFuaW1fYnJlYWtlcl9vdGhlciI6WyJNb3ZlIExlYW4iLCJFYXJ0aHF1YWtlIiwifiJdLCJhdm9pZF9iYWNrc3RhYiI6dHJ1ZSwiZnJlZXN0YW5kaW5nIjpmYWxzZSwicGl0Y2giOiJEb3duIiwic2FmZV9oZWFkIjpbIkFpcitDIEtuaWZlIiwiQWlyK0MgVGFzZXIiLCJ+Il0sInN0YXRlIjoiRnJlZXN0YW5kaW5nIiwic3dpdGNoIjp0cnVlLCJ5YXciOiJBdCBUYXJnZXQifSx7InBoYXNlcyI6My4wLCJzd2l0Y2giOnRydWV9LFt7ImxlZnRfbGltaXQiOjUxLjAsIm1vZGlmaWVyIjoiQ2VudGVyIiwibW9kaWZpZXJfb2Zmc2V0IjotMy4wLCJyaWdodF9saW1pdCI6NTEuMCwidGltZXIiOjUuMCwieWF3X2wiOi0yNC4wLCJ5YXdfciI6MzAuMH0seyJsZWZ0X2xpbWl0Ijo2MC4wLCJtb2RpZmllciI6IkNlbnRlciIsIm1vZGlmaWVyX29mZnNldCI6LTguMCwicmlnaHRfbGltaXQiOjYwLjAsInRpbWVyIjoyLjAsInlhd19sIjotMTMuMCwieWF3X3IiOjI0LjB9LHsibGVmdF9saW1pdCI6NTEuMCwibW9kaWZpZXIiOiJEaXNhYmxlZCIsIm1vZGlmaWVyX29mZnNldCI6OC4wLCJyaWdodF9saW1pdCI6NTEuMCwidGltZXIiOjIuMCwieWF3X2wiOi0yNC4wLCJ5YXdfciI6MjQuMH1dLFt7ImJvZHlfeWF3IjpmYWxzZSwiYm9keWZzIjoiT2ZmIiwiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjowLjAsImZvcmNlX2RlZmVuc2l2ZSI6WyJ+Il0sImxlZnRfbGltaXQiOjYwLjAsIm1vZGlmaWVyIjoiRGlzYWJsZWQiLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwib3B0aW9ucyI6WyJ+Il0sInJpZ2h0X2xpbWl0Ijo2MC4wLCJzdGF0ZSI6ZmFsc2UsInlhdyI6MC4wLCJ5YXdfbCI6MC4wLCJ5YXdfciI6MC4wLCJ5YXdfdHlwZSI6IkRlZmF1bHQifSx7ImJvZHlfeWF3Ijp0cnVlLCJib2R5ZnMiOiJPZmYiLCJkZWZlbnNpdmUiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjAuMCwiZm9yY2VfZGVmZW5zaXZlIjpbIkRUIiwifiJdLCJsZWZ0X2xpbWl0Ijo2MC4wLCJtb2RpZmllciI6Ik9mZnNldCIsIm1vZGlmaWVyX29mZnNldCI6LTEyLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwiQW50aSBCcnV0ZWZvcmNlIiwifiJdLCJyaWdodF9saW1pdCI6NjAuMCwic3RhdGUiOnRydWUsInlhdyI6MC4wLCJ5YXdfbCI6MjEuMCwieWF3X3IiOjEyLjAsInlhd190eXBlIjoiTCZSIn0seyJib2R5X3lhdyI6dHJ1ZSwiYm9keWZzIjoiUGVlayBSZWFsIiwiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjowLjAsImZvcmNlX2RlZmVuc2l2ZSI6WyJEVCIsIn4iXSwibGVmdF9saW1pdCI6MzkuMCwibW9kaWZpZXIiOiIzLVdheSIsIm1vZGlmaWVyX29mZnNldCI6MTIuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJBbnRpIEJydXRlZm9yY2UiLCJ+Il0sInJpZ2h0X2xpbWl0Ijo0MS4wLCJzdGF0ZSI6dHJ1ZSwieWF3IjowLjAsInlhd19sIjotMzEuMCwieWF3X3IiOjMxLjAsInlhd190eXBlIjoiU2xvdyJ9LHsiYm9keV95YXciOnRydWUsImJvZHlmcyI6Ik9mZiIsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiU3dpdGNoIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfeWF3IjoiU3dpdGNoIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjAuMCwiZm9yY2VfZGVmZW5zaXZlIjpbIkRUIiwifiJdLCJsZWZ0X2xpbWl0IjozMC4wLCJtb2RpZmllciI6IlNwaW4iLCJtb2RpZmllcl9vZmZzZXQiOjIuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJSYW5kb21pemUgSml0dGVyIiwiQW50aSBCcnV0ZWZvcmNlIiwifiJdLCJyaWdodF9saW1pdCI6MjIuMCwic3RhdGUiOnRydWUsInlhdyI6MC4wLCJ5YXdfbCI6LTM2LjAsInlhd19yIjozNi4wLCJ5YXdfdHlwZSI6IlNsb3cifSx7ImJvZHlfeWF3Ijp0cnVlLCJib2R5ZnMiOiJPZmYiLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9waXRjaCI6IkN1c3RvbSIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi02MC4wLCJkZWZlbnNpdmVfeWF3IjoiU3dpdGNoIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjAuMCwiZm9yY2VfZGVmZW5zaXZlIjpbIkRUIiwifiJdLCJsZWZ0X2xpbWl0IjozNC4wLCJtb2RpZmllciI6IjMtV2F5IiwibW9kaWZpZXJfb2Zmc2V0IjotMjYuMCwib3B0aW9ucyI6WyJ+Il0sInJpZ2h0X2xpbWl0Ijo0MS4wLCJzdGF0ZSI6dHJ1ZSwieWF3IjowLjAsInlhd19sIjotMjYuMCwieWF3X3IiOjM2LjAsInlhd190eXBlIjoiU2xvdyJ9LHsiYm9keV95YXciOnRydWUsImJvZHlmcyI6IlBlZWsgRmFrZSIsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV95YXciOiJEZWZhdWx0IiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjAuMCwiZm9yY2VfZGVmZW5zaXZlIjpbIkRUIiwifiJdLCJsZWZ0X2xpbWl0IjozNi4wLCJtb2RpZmllciI6IjMtV2F5IiwibW9kaWZpZXJfb2Zmc2V0IjoyMi4wLCJvcHRpb25zIjpbIkppdHRlciIsIkFudGkgQnJ1dGVmb3JjZSIsIn4iXSwicmlnaHRfbGltaXQiOjM0LjAsInN0YXRlIjp0cnVlLCJ5YXciOjAuMCwieWF3X2wiOjcuMCwieWF3X3IiOjE3LjAsInlhd190eXBlIjoiTCZSIn0seyJib2R5X3lhdyI6dHJ1ZSwiYm9keWZzIjoiT2ZmIiwiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJDb3JuZXIiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0Ijo3OC4wLCJkZWZlbnNpdmVfeWF3IjoiRGVmYXVsdCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjowLjAsImZvcmNlX2RlZmVuc2l2ZSI6WyJEVCIsIn4iXSwibGVmdF9saW1pdCI6MzguMCwibW9kaWZpZXIiOiIzLVdheSIsIm1vZGlmaWVyX29mZnNldCI6MTIuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJBbnRpIEJydXRlZm9yY2UiLCJ+Il0sInJpZ2h0X2xpbWl0IjozMS4wLCJzdGF0ZSI6dHJ1ZSwieWF3IjowLjAsInlhd19sIjoxNy4wLCJ5YXdfciI6Ny4wLCJ5YXdfdHlwZSI6IlNsb3cifSx7ImJvZHlfeWF3IjpmYWxzZSwiYm9keWZzIjoiT2ZmIiwiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjowLjAsImZvcmNlX2RlZmVuc2l2ZSI6WyJ+Il0sImxlZnRfbGltaXQiOjYwLjAsIm1vZGlmaWVyIjoiQ2VudGVyIiwibW9kaWZpZXJfb2Zmc2V0Ijo1NS4wLCJvcHRpb25zIjpbIn4iXSwicmlnaHRfbGltaXQiOjYwLjAsInN0YXRlIjp0cnVlLCJ5YXciOjYwLjAsInlhd19sIjowLjAsInlhd19yIjowLjAsInlhd190eXBlIjoiRGVmYXVsdCJ9XSx7ImFzcGVjdF9yYXRpbyI6dHJ1ZSwiYXNwZWN0X3JhdGlvX29mZnNldCI6MTIuMCwiY2xhbnRhZyI6ZmFsc2UsImRvcm1hbnQiOnRydWUsImZha2VwaW5nIjpmYWxzZSwiZmFrZXBpbmdfYW1vdW50IjoxNTAuMCwiZmFzdF9sYWRkZXIiOnRydWUsImZwc19ib29zdCI6dHJ1ZSwianVtcHNjb3V0IjpmYWxzZSwianVtcHNjb3V0X2hpdGNoYW5jZSI6MzUuMCwianVtcHNjb3V0X2hpdGNoYW5jZV9hdXRvIjozNS4wLCJqdW1wc2NvdXRfaGl0Y2hhbmNlX2F3cCI6MzUuMCwianVtcHNjb3V0X2hpdGNoYW5jZV9waXN0b2xzIjozNS4wLCJqdW1wc2NvdXRfaGl0Y2hhbmNlX3I4IjozNS4wLCJqdW1wc2NvdXRfd2VhcG9uIjpbIn4iXSwianVtcHNjb3V0X3dlYXBvbl90eXBlIjpbIn4iXSwibG9ncyI6dHJ1ZSwibG9nc19oaXQiOiIjQUQ5Njg0RkYiLCJsb2dzX21pc3MiOiIjNTQyODA1RkYiLCJsb2dzX3JvdW5kaW5nIjo4LjAsImxvZ3NfdHlwZSI6WyJDb25zb2xlIiwiU2NyZWVuIiwifiJdLCJsb2dzX3R5cGVfc3R5bGUiOiJNb2Rlcm4iLCJub2ZhbGwiOmZhbHNlLCJyOF9oZWxwZXIiOnRydWUsInRlbGVwb3J0IjpmYWxzZSwidGVsZXBvcnRfYWlyIjp0cnVlLCJ0ZWxlcG9ydF93ZWFwb24iOlsiU2NvdXQiLCJUYXNlciIsIn4iXSwidHJhc2h0YWxrIjpmYWxzZSwidHJhc2h0YWxrX3RyaWdnZXJzIjpbIk9uIEtpbGwiLCJ+Il0sInZpZXdfbW9kZWwiOnRydWUsInZpZXdfbW9kZWxfZm92Ijo2OS4wLCJ2aWV3X21vZGVsX3giOjIuMCwidmlld19tb2RlbF95IjotNC4wLCJ2aWV3X21vZGVsX3oiOi0xLjB9LHsiYWFfYXJyb3dzIjpmYWxzZSwiYWFfYXJyb3dzX2NvbG9yIjoiI0M4QzhDOEZGIiwiYWFfYXJyb3dzX2NvbG9yMiI6IiNGRkZGRkZGRiIsImNyb3NzaGFpcl9pbmQiOmZhbHNlLCJjcm9zc2hhaXJfaW5kX2NvbG9yMSI6IiNEQ0RDRENGRiIsImNyb3NzaGFpcl9pbmRfY29sb3IyIjoiI0FBQUFBQUZGIiwiY3Jvc3NoYWlyX2luZF9jb2xvcjMiOiIjNzg3ODc4RkYiLCJjcm9zc2hhaXJfaW5kX2tleSI6WyJ+Il0sImNyb3NzaGFpcl9pbmRfdHlwZSI6IkRlZmF1bHQiLCJjdXN0b21fc2NvcGUiOnRydWUsImN1c3RvbV9zY29wZV9jb2xvciI6IiNGRkZGRkZGRiIsImN1c3RvbV9zY29wZV9sZW5ndGgiOjQ5LjAsImN1c3RvbV9zY29wZV9vZmZzZXQiOjE1LjAsImdzX2luZGljYXRvcnMiOnRydWUsIndhdGVybWFya19wb3NpdGlvbiI6IkRvd24iLCJ3aW5kb3dzX3VpIjpmYWxzZSwid2luZG93c191aV9jb2xvciI6IiM3ODc4NzhGRiIsIndpbmRvd3NfdWlfcm91bmQiOjMuMCwid2luZG93c191aV9zZWxlY3QiOlsifiJdLCJ3aW5kb3dzX3VpX3R5cGUiOiJEZWZhdWx0Iiwid29ybGRfZGFtYWdlIjp0cnVlLCJ3b3JsZF9kYW1hZ2VfY29sb3IiOiIjQUQ4NDg0RkYiLCJ3b3JsZF9kYW1hZ2VfZm9udCI6NC4wLCJ3b3JsZF9oaXRtYXJrZXIiOnRydWUsIndvcmxkX2hpdG1hcmtlcl9jb2xvciI6IiNGRkZGRkZGRiIsIndvcmxkX2hpdG1hcmtlcl9zaXplIjo1LjAsIndvcmxkX2hpdG1hcmtlcl90eXBlIjoiRGVmYXVsdCJ9XQ==";
v333.save_config = function(v334)
    -- upvalues: v331 (ref), l_base64_0 (ref)
    if v334 == 1 then
        return;
    else
        local v335 = v331:save();
        configs_db.cfg_list[v334][2] = l_base64_0.encode(json.stringify(v335));
        db.lavendalua = configs_db;
        return;
    end;
end;
v333.update_values = function(v336)
    local v337 = configs_db.cfg_list[v336][1] .. "\v - Active";
    for v338, v339 in ipairs(configs_db.cfg_list) do
        configs_db.menu_list[v338] = v339[1];
    end;
    configs_db.menu_list[v336] = v337;
end;
v333.create_config = function(v340)
    if type(v340) ~= "string" then
        return;
    elseif v340 == nil or v340 == "" or v340 == " " then
        common.add_notify("lavenda", "Wrong Name");
        return;
    else
        for v341 = #configs_db.menu_list, 1, -1 do
            if configs_db.menu_list[v341] == v340 then
                common.add_notify("lavenda", "Another config has the same name");
                return;
            end;
        end;
        if #configs_db.cfg_list > 6 then
            common.add_notify("lavenda", "Maximum number of configs: 6");
            return;
        else
            local v342 = {
                [1] = nil, 
                [2] = "", 
                [1] = v340
            };
            table.insert(configs_db.cfg_list, v342);
            table.insert(configs_db.menu_list, v340);
            db.lavendalua = configs_db;
            return;
        end;
    end;
end;
v333.remove_config = function(v343)
    if v343 == 1 then
        return;
    else
        local v344 = configs_db.cfg_list[v343][1];
        for v345 = #configs_db.cfg_list, 1, -1 do
            if configs_db.cfg_list[v345][1] == v344 then
                table.remove(configs_db.cfg_list, v345);
                table.remove(configs_db.menu_list, v345);
            end;
        end;
        db.lavendalua = configs_db;
        return;
    end;
end;
v333.load_config = function(v346)
    -- upvalues: v331 (ref), l_base64_0 (ref)
    if configs_db.cfg_list[v346][2] == nil or configs_db.cfg_list[v346][2] == "" then
        print("Problem with: " .. v346 .. " Config");
        return;
    elseif #configs_db.cfg_list < v346 then
        print("Problem with: " .. v346 .. " Config");
        return;
    else
        v331:load(json.parse(l_base64_0.decode(configs_db.cfg_list[v346][2])));
        cvar.play:call("ambient\\tones\\elev1");
        return;
    end;
end;
v332.cfg_selector = v22.cfg:list("", configs_db.menu_list):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v26
});
v332.name = v22.cfg:input("", "Main Preset"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v26
});
v332.create = v22.cfg:button("   \v" .. ui.get_icon("layer-plus") .. "   ", function()
    -- upvalues: v333 (ref), v332 (ref)
    v333.create_config(v332.name:get());
    v332.cfg_selector:update(configs_db.menu_list);
end, true):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v26
});
v332.create:tooltip("Create Config");
v332.remove = v22.cfg:button("   \v" .. ui.get_icon("trash-xmark") .. "   ", function()
    -- upvalues: v333 (ref), v332 (ref)
    v333.remove_config(v332.cfg_selector:get());
    v332.cfg_selector:update(configs_db.menu_list);
end, true):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v26
});
v332.remove:tooltip("Remove Config");
v332.save = v22.cfg:button("   \v" .. ui.get_icon("floppy-disk") .. "   ", function()
    -- upvalues: v333 (ref), v332 (ref)
    v333.save_config(v332.cfg_selector:get());
end, true):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v26
});
v332.save:tooltip("Save Config");
v332.load = v22.cfg:button("   \v" .. ui.get_icon("check") .. "   ", function()
    -- upvalues: v333 (ref), v332 (ref)
    v333.update_values(v332.cfg_selector:get());
    v333.load_config(v332.cfg_selector:get());
    v332.cfg_selector:update(configs_db.menu_list);
end, true):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v26
});
v332.load:tooltip("Load Config");
v332.import = v22.cfg:button("   \v" .. ui.get_icon("download") .. "   ", function()
    -- upvalues: v331 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
    v331:load(json.parse(l_base64_0.decode(l_clipboard_0.get())));
    cvar.play:call("ambient\\tones\\elev1");
end, true):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v26
});
v332.import:tooltip("Import Config");
v332.export = v22.cfg:button("  \v" .. ui.get_icon("share-nodes") .. "   ", function()
    -- upvalues: l_clipboard_0 (ref), l_base64_0 (ref), v331 (ref)
    l_clipboard_0.set(l_base64_0.encode(json.stringify(v331:save())));
    cvar.play:call("ambient\\tones\\elev1");
end, true):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v26
});
v332.export:tooltip("Export Config");
v35.fps_boost:set_callback(function(v347)
    cvar.r_dynamic:int(v347:get() and 0 or 1);
    cvar.func_break_max_pieces:int(v347:get() and 0 or 1);
    cvar.r_drawtracers_firstperson:int(v347:get() and 0 or 1);
    cvar.r_eyegloss:int(v347:get() and 0 or 1);
    cvar.r_eyemove:int(v347:get() and 0 or 1);
    cvar.r_eyeshift_x:int(v347:get() and 0 or 1);
    cvar.r_eyeshift_y:int(v347:get() and 0 or 1);
    cvar.r_eyeshift_z:int(v347:get() and 0 or 1);
    cvar.r_eyesize:int(v347:get() and 0 or 1);
    cvar.r_cheapwaterend:int(v347:get() and 1 or 0);
    cvar.r_cheapwaterstart:int(v347:get() and 1 or 0);
    cvar.fps_max:int(v347:get() and 0 or 400);
end);
events.render:set(function()
    -- upvalues: v14 (ref), v143 (ref), v36 (ref), v21 (ref), v295 (ref), v313 (ref), v322 (ref), v35 (ref), v330 (ref), v185 (ref)
    if ui.get_alpha() > 0 then
        v14();
    end;
    v143.watermark();
    if v36.crosshair_ind:get() then
        v143.cross_ind();
    end;
    if v36.custom_scope:get() then
        v21.scope_overlay:override("Remove All");
        v143.customscope();
    else
        v21.scope_overlay:override();
    end;
    if v36.windows_ui:get() then
        if v36.windows_ui_select:get(1) then
            v295();
        end;
        if v36.windows_ui_select:get(2) then
            v313:update();
        end;
        if v36.windows_ui_select:get(3) then
            v322:update();
        end;
    end;
    if v36.aa_arrows:get() then
        v143.arrows();
    end;
    if v36.world_damage:get() then
        v143.world_damage();
    end;
    if v35.fakeping:get() then
        ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):override(v35.fakeping_amount:get());
    else
        ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):override();
    end;
    if v36.gs_indicators:get() then
        v143.gs_indicator();
    end;
    if v36.world_hitmarker:get() then
        v143.hitmarker();
    end;
    v330();
    v185();
end);
events.mouse_input:set(function()
    return ui.get_alpha() <= 0;
end);
events.round_prestart:set(function()
    -- upvalues: v50 (ref), v189 (ref)
    v50 = 0;
    v189 = {};
end);
if events.aim_ack then
    events.aim_ack:set(function(v348)
        -- upvalues: v143 (ref)
        if v143.aim_ack then
            v143.aim_ack(v348);
        end;
        if ragebot and ragebot.aim_ack then
            ragebot.aim_ack(v348);
        end;
    end);
end;
events.shutdown:set(function()
    -- upvalues: l_curtime_0 (ref), v23 (ref)
    cvar.r_aspectratio:float(0);
    cvar.viewmodel_fov:int(68);
    cvar.viewmodel_offset_x:float(2.5);
    cvar.viewmodel_offset_y:float(0);
    cvar.viewmodel_offset_z:float(-1.5);
    common.set_clan_tag("");
    local v349 = globals.curtime - l_curtime_0;
    v23[3] = v23[3] + v349;
    db.lavendalua = configs_db;
    db.lavenda_info = v23;
end);
events.createmove:set(v84.daimbot);
events.createmove:set(v73);
events.createmove:set(v84.fast_ladder);
events.createmove:set(v84.teleport);
events.createmove:set(v84.jumpscout);
events.createmove:set(v84.nofall);
local function v355(v350)
    -- upvalues: v38 (ref)
    if not v38.super_toss:get() then
        return;
    else
        local v351 = entity.get_local_player();
        if not v351 or not v351:is_alive() then
            return;
        else
            local v352 = v351:get_player_weapon();
            if not v352 or not v352:get_name():find("grenade") and v352:get_name():find("grenade") and v352:get_name():find("grenade") then
                return;
            else
                local v353 = v352:get_name();
                if v38.super_toss_only_flash:get() and not v353:find("flash") then
                    return;
                else
                    local v354 = v38.super_toss_mode:get();
                    if v354 == "Hold" then
                        if v350.in_attack or v350.in_attack2 then
                            v350.in_attack = true;
                            v350.in_attack2 = false;
                        end;
                    elseif v354 == "Quick" then
                        if input.is_key_pressed(KEY_X) then
                            v350.in_attack = true;
                        end;
                    elseif v354 == "Smart" and v350.in_attack then
                        v350.in_attack = true;
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
events.createmove:set(v355);
v38.hsshoot = v22.rageui:switch(ui.get_icon("star") .. "   Auto Hide Shots"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v34
});
local v356 = v38.hsshoot:create();
v38.hsshoot_config = {};
v38.hsshoot_config.State = v356:selectable("State", {
    [1] = "stand", 
    [2] = "duck", 
    [3] = "duck move"
});
v38.hsshoot_config.Weapons = v356:selectable("Weapons", {
    [1] = "SMG", 
    [2] = "Rifles", 
    [3] = "Pistols", 
    [4] = "SSG-08", 
    [5] = "AWP", 
    [6] = "Auto Snipers", 
    [7] = "Desert Eagle"
});
events.createmove:set(function(_)
    -- upvalues: v38 (ref), v21 (ref)
    if not v38.hsshoot:get() then
        return;
    else
        local v358 = entity.get_local_player();
        if not v358 or not v358:is_alive() then
            return;
        else
            local v359 = v358:get_player_weapon();
            if not v359 then
                return;
            else
                local v360 = v359:get_classname();
                local v361 = v358.m_flDuckAmount > 0.5;
                local v362 = v358.m_vecVelocity:length2d();
                local v363 = "stand";
                if v361 and v362 < 5 then
                    v363 = "duck";
                elseif v361 and v362 >= 5 then
                    v363 = "duck move";
                end;
                local v364 = ({
                    CWeaponP90 = "SMG", 
                    CWeaponBizon = "SMG", 
                    CWeaponAWP = "AWP", 
                    CWeaponTEC9 = "Pistols", 
                    CWeaponSCAR20 = "Auto Snipers", 
                    CWeaponG3SG1 = "Auto Snipers", 
                    CWeaponMAC10 = "SMG", 
                    CWeaponSSG08 = "SSG-08", 
                    CWeaponGlock = "Pistols", 
                    CWeaponP250 = "Pistols", 
                    CWeaponFiveSeven = "Pistols", 
                    CWeaponElite = "Pistols", 
                    CWeaponHKP2000 = "Pistols", 
                    CWeaponGALILAR = "Rifles", 
                    CWeaponFAMAS = "Rifles", 
                    CWeaponAK47 = "Rifles", 
                    CWeaponM4A1 = "Rifles", 
                    CDEagle = "Desert Eagle", 
                    CWeaponUMP45 = "SMG", 
                    CWeaponMP7 = "SMG", 
                    CWeaponMP9 = "SMG"
                })[v360] or "UNKNOWN";
                if v38.hsshoot_config and v38.hsshoot_config.State and v38.hsshoot_config.Weapons then
                    local v365 = v38.hsshoot_config.State:get(v363);
                    local v366 = v38.hsshoot_config.Weapons:get(v364);
                    if v365 and v366 then
                        v21.dt:override(false);
                        v21.hs:override(true);
                    else
                        v21.dt:override();
                        v21.hs:override();
                    end;
                end;
                return;
            end;
        end;
    end;
end);
events.render:set(function()
    -- upvalues: v36 (ref)
    if v36.grenade_warning and v36.grenade_warning:get() then
        render.text(5, vector(20, 200), color(255, 100, 100, 255), nil, "\240\159\146\163");
    end;
    if v36.grenade_trajectory and v36.grenade_trajectory:get() then
        render.text(5, vector(20, 220), color(100, 255, 100, 255), nil, "\240\159\167\170");
    end;
end);
events.render:set(function()
    -- upvalues: v36 (ref)
    if v36.grenade_visuals and v36.grenade_visuals:get() then
        if v36.grenade_warning and v36.grenade_warning:get() then
            render.text(5, vector(20, 200), color(255, 100, 100, 255), nil, "\240\159\146\163");
        end;
        if v36.grenade_trajectory and v36.grenade_trajectory:get() then
            render.text(5, vector(20, 220), color(100, 255, 100, 255), nil, "\240\159\167\170");
        end;
    end;
end);
local v367 = 0;
local v368 = 40;
events.render:set(function()
    -- upvalues: v36 (ref), v367 (ref), v368 (ref)
    if v36.grenade_visuals and v36.grenade_visuals:get() and v36.grenade_warning and v36.grenade_warning:get() then
        v367 = math.min(v367 + globals.frametime * 300, 255);
        v368 = math.max(v368 - globals.frametime * 100, 0);
        local v369 = v36.grenade_warning_color:get() or color(255, 100, 100, 255);
        local v370 = vector(20 + v368, 200);
        render.text(5, v370 + vector(1, 1), color(0, 0, 0, v367 * 0.4), nil, "\226\154\160\239\184\143");
        render.text(5, v370, color(v369.r, v369.g, v369.b, v367), nil, "\226\154\160\239\184\143");
    else
        v367 = 0;
        v368 = 40;
    end;
end);
local v371 = v22.rageui:switch("\f<calculator-simple>   Nade Throw Fix"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v34
});
v371:create();
local function v376(v372)
    -- upvalues: v371 (ref)
    if not v371:get() then
        return;
    else
        local v373 = entity.get_local_player();
        if not v373 then
            return;
        else
            local v374 = v373:get_player_weapon();
            if not v374 then
                return;
            else
                local v375 = v374:get_classname();
                if not v375 or not v375:lower():find("grenade") then
                    return;
                else
                    if v372.in_attack or v372.in_attack2 then
                        v372.weaponselect = 0;
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
events.setup_command:set(v376);
events.render:set(function()
    -- upvalues: v371 (ref), v38 (ref)
    if v371:get() and v38.super_toss:get() then
        render.text(1, vector(20, 580), color(255, 80, 80), nil, "(Nade Throw Fix) Can break Supertoss");
    end;
end);
v38.fakeduck_speed = v22.rageui:switch("\f<person-running> Override Fakeduck Speed"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v34
});
v84.override_fakeduck_speed = function(v377)
    -- upvalues: v38 (ref), v21 (ref)
    if not v38.fakeduck_speed:get() then
        return;
    else
        local v378 = entity.get_local_player();
        if not v378 or not v378:is_alive() then
            return;
        else
            if v21.fd:get() and v378.m_flDuckAmount > 0.75 then
                v377.forwardmove = 450;
            end;
            return;
        end;
    end;
end;
events.setup_command:set(function(v379)
    -- upvalues: v84 (ref)
    v84.override_fakeduck_speed(v379);
end);
v38.air_duck_collision = v22.rageui:switch("\f<parachute-box>  Air Duck Collision"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v34
});
v84.air_duck_collision = function(v380)
    -- upvalues: v38 (ref)
    if not v38.air_duck_collision:get() then
        return;
    else
        local v381 = entity.get_local_player();
        if not v381 or not v381:is_alive() then
            return;
        else
            if v381.m_fFlags == 256 and v381.m_flDuckAmount > 0.1 then
                v380.sidemove = 0;
                v380.forwardmove = 0;
            end;
            return;
        end;
    end;
end;
events.setup_command:set(function(v382)
    -- upvalues: v84 (ref)
    v84.override_fakeduck_speed(v382);
    v84.air_duck_collision(v382);
end);
v84.freezetime_fakeduck = function()
    -- upvalues: v35 (ref)
    if not v35.freezetime_fd:get() then
        return;
    else
        local v383 = entity.get_local_player();
        if not v383 or not v383:is_alive() then
            return;
        else
            local v384 = v383.m_vecVelocity and v383.m_vecVelocity:length2d() or 0;
            local v385 = globals.tickcount or 0;
            if v384 == 0 and v385 < 300 then
                entity.set_prop(v383, "m_bClientSideAnimation", true);
            end;
            return;
        end;
    end;
end;
events.createmove:set(function()
    -- upvalues: v84 (ref)
    v84.freezetime_fakeduck();
end);
local v386 = db.lavenda_info or {
    [1] = 0, 
    [2] = 0, 
    [3] = 0
};
events.createmove:set(function(_)
    -- upvalues: v386 (ref)
    if not entity.get_local_player() or not entity.get_local_player():is_alive() then
        return;
    else
        v386[3] = v386[3] + globals.frametime;
        db.lavenda_info = v386;
        return;
    end;
end);
events.aim_ack:set(function(v388)
    -- upvalues: v386 (ref)
    if v388.target and v388.target:is_player() then
        v386[1] = v386[1] + 1;
        db.lavenda_info = v386;
    end;
end);
events.bullet_impact:set(function()
    -- upvalues: v386 (ref)
    if not entity.get_local_player() then
        return;
    else
        if not rage.exploit:get() then
            v386[2] = v386[2] + 1;
            db.lavenda_info = v386;
        end;
        return;
    end;
end);
events.shutdown:set(function()
    -- upvalues: v386 (ref)
    db.lavenda_info = v386;
end);
if #configs_db.cfg_list == 0 or not configs_db.cfg_list[1][2] or configs_db.cfg_list[1][2] == "" then
    local v389 = l_base64_0.decode("W3siYW5pbV9icmVha2VyIjp0cnVlLCJhbmltX2JyZWFrZXJfYWlyIjoiU3RhdGljIExlZ3MiLCJhbmltX2JyZWFrZXJfZ3JvdW5kIjoiSml0dGVyIiwiYW5pbV9icmVha2VyX2xlYW4iOjU0LjAsImFuaW1fYnJlYWtlcl9vdGhlciI6WyJNb3ZlIExlYW4iLCJFYXJ0aHF1YWtlIiwifiJdLCJhdm9pZF9iYWNrc3RhYiI6dHJ1ZSwiZnJlZXN0YW5kaW5nIjpmYWxzZSwicGl0Y2giOiJEb3duIiwic2FmZV9oZWFkIjpbIkFpcitDIEtuaWZlIiwiQWlyK0MgVGFzZXIiLCJ+Il0sInN0YXRlIjoiRnJlZXN0YW5kaW5nIiwic3dpdGNoIjp0cnVlLCJ5YXciOiJBdCBUYXJnZXQifSx7InBoYXNlcyI6My4wLCJzd2l0Y2giOnRydWV9");
    do
        local l_v389_0 = v389;
        local l_status_0, l_result_0 = pcall(function()
            -- upvalues: l_v389_0 (ref)
            return json.parse(l_v389_0);
        end);
        if l_status_0 and l_result_0 then
            v331:load(l_result_0);
            render.notify("Default config loaded.");
        else
            render.notify("Failed to load default config.");
        end;
    end;
end;
events.shutdown:set(function()
    -- upvalues: v332 (ref), v331 (ref), l_base64_0 (ref)
    if v332.cfg_selector and v332.cfg_selector:get() then
        local v393 = v332.cfg_selector:get();
        local v394 = v331:save();
        local v395 = l_base64_0.encode(json.stringify(v394));
        configs_db.cfg_list[v393 + 1][2] = v395;
        db.lavendalua = configs_db;
    end;
end);