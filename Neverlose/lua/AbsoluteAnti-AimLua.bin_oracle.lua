local l_pui_0 = require("neverlose/pui");
local l_system_0 = require("neverlose/drag_system");
local l_clipboard_0 = require("neverlose/clipboard");
local l_base64_0 = require("neverlose/base64");
local l_animations_0 = require("neverlose/animations");
local l_gradient_0 = require("neverlose/gradient");
local function v7(v6)
    return ui.get_icon(v6) .. " ";
end;
local function v11(v8, v9, v10)
    return v8 - (v8 - v9) * v10;
end;
local function v16(v12, v13, v14)
    local l_curtime_0 = globals.curtime;
    return v12 + (v13 - v12) * 0.5 * (math.sin(l_curtime_0 * v14) + 1);
end;
local _ = render.screen_size() / 2;
local _ = l_pui_0.create(v7("house") .. "Home", "Home", 1);
local v19 = l_pui_0.create(v7("house") .. "Home", "Information");
local v20 = l_pui_0.create(v7("house") .. "Home", "Stats");
local v21 = l_pui_0.create(v7("house") .. "Home", "Links");
local _ = l_pui_0.create(v7("shield-halved") .. "Main", "Main", 2);
local v23 = l_pui_0.create(v7("gears") .. "Misc", "");
local v24 = l_pui_0.create(v7("shield-halved") .. "Main", "", 1);
local _ = l_pui_0.create(v7("gears") .. "Misc", "Misc", 3);
local v26 = render.load_font("Arial", 10, "ab");
local _ = v20:label(v7("skull") .. "Kills");
local v28 = v20:button("0", function()

end, true);
local _ = v20:label(v7("user-xmark") .. "Misses at you");
local v30 = v20:button("0", function()

end, true);
local _ = v19:label("Who asked?");
v19:button(""):set_name(tostring(common.get_username()));
local _ = v19:label("Created by");
local _ = v19:button("Tokyo", function()

end, true);
local _ = v21:label("  Creator Telegram  ");
local _ = v21:button("Click", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://t.me/DqrkTqrget");
end, true);
local _ = v21:label("  Discord Server  ");
local _ = v21:button("Click", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/8PF8yQH5dW");
end, true);
local _ = v21:label("  Lua Link  ");
local _ = v21:button("Click", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://ru.neverlose.cc/market/item?id=P859gO");
end, true);
local v40 = {
    [1] = "\208\156\208\189\208\181 \208\191\208\190\208\180\208\178\208\187\208\176\209\129\209\130\208\189\208\190 \208\178\208\184\208\180\208\181\209\130\209\140 \208\177\209\131\208\180\209\131\209\137\208\181\208\181, \208\184 \208\189\208\181 \209\129\208\190\209\129\209\130\208\176\208\178\208\184\208\187\208\190 \208\190\209\129\208\190\208\177\208\190\208\179\208\190 \209\130\209\128\209\131\208\180\208\176 \208\181\208\179\208\190 \208\184\208\183\208\188\208\181\208\189\208\184\209\130\209\140", 
    [2] = "\208\161\209\130\208\190\208\184\209\130 \208\189\208\176\209\135\208\176\209\130\209\140 \208\177\208\181\209\129\208\191\208\190\208\186\208\190\208\184\209\130\209\140\209\129\209\143...", 
    [3] = "\208\162\209\139 \209\131\208\188\208\181\209\128 \209\130\208\176\208\186 \208\182\208\181 \208\177\208\181\209\129\209\129\208\188\209\139\209\129\208\187\208\181\208\189\208\189\208\190, \208\186\208\176\208\186 \208\184 \208\182\208\184\208\187. \208\147\209\128\209\143\208\183\209\140 \208\190\209\129\209\130\208\176\209\145\209\130\209\129\209\143 \208\179\209\128\209\143\208\183\209\140\209\142.", 
    [4] = "\208\161\208\188\208\181\209\128\209\130\209\140 \209\130\208\181\208\177\209\143 \208\189\208\181 \209\129\208\191\208\176\209\129\208\187\208\176, \209\131\209\128\208\190\208\180. \208\162\209\139 \208\178\209\129\208\181\208\179\208\180\208\176 \208\177\209\139\208\187 \208\189\208\184\209\135\209\130\208\190\208\182\208\181\209\129\209\130\208\178\208\190\208\188 \208\184 \209\130\208\176\208\186\208\184\208\188 \208\190\209\129\209\130\208\176\208\187\209\129\209\143.", 
    [5] = "\208\161\208\180\208\190\209\133, \209\131\208\177\208\187\209\142\208\180\208\190\208\186. \208\148\208\176\208\182\208\181 \208\178 \209\129\208\178\208\190\208\181\208\185 \209\129\208\188\208\181\209\128\209\130\208\184 \209\130\209\139 \208\190\209\129\209\130\208\176\209\145\209\136\209\140\209\129\209\143 \208\177\208\181\209\129\208\191\208\190\208\187\208\181\208\183\208\189\208\190\208\185 \209\130\208\178\208\176\209\128\209\140\209\142.", 
    [6] = "1", 
    [7] = "\208\162\208\176\208\186 \208\186\208\176\208\186 \209\143 \208\178\209\129\208\181\208\179\208\180\208\176 \208\191\208\190\208\177\208\181\208\182\208\180\208\176\209\142, \209\143 \208\178\209\129\208\181\208\179\208\180\208\176 \208\191\209\128\208\176\208\178", 
    [8] = "\208\158\209\129\209\130\208\176\208\178\208\176\208\185\209\129\209\143 \208\178 \209\141\209\130\208\190\208\185 \208\191\208\190\208\183\208\181 \208\191\209\128\208\184\208\186\208\187\208\190\208\189\208\181\208\189\208\184\209\143 \208\184 \208\190\209\129\208\190\208\183\208\189\208\190\208\178\208\176\208\185 \208\189\208\176\209\129\208\186\208\190\208\187\209\140\208\186\208\190 \208\177\208\181\208\183\208\180\208\176\209\128\208\181\208\189", 
    [9] = "\208\175 \208\189\208\181\208\191\208\190\208\179\209\128\208\181\209\136\208\184\208\188 c Absolute.lua.", 
    [10] = "\208\161\208\190\208\191\209\128\208\190\209\130\208\184\208\178\208\187\208\181\208\189\208\184\208\181 \226\128\147 \208\191\209\131\209\129\209\130\208\176\209\143 \209\130\209\128\208\176\209\130\208\176 \208\178\209\128\208\181\208\188\208\181\208\189\208\184. \208\175 \209\131\208\182\208\181 \208\191\208\190\208\177\208\181\208\180\208\184\208\187.", 
    [11] = "\208\162\209\139 \208\191\209\128\208\190\208\184\208\179\209\128\208\176\208\187 \208\178 \209\130\208\190\209\130 \208\188\208\190\208\188\208\181\208\189\209\130, \208\186\208\190\208\179\208\180\208\176 \208\190\209\129\208\188\208\181\208\187\208\184\208\187\209\129\209\143 \209\129\209\130\208\190\209\143\209\130\209\140 \208\191\209\128\208\190\209\130\208\184\208\178 \208\188\208\181\208\189\209\143.", 
    [12] = "\208\162\208\178\208\190\209\145 \208\191\208\190\209\128\208\176\208\182\208\181\208\189\208\184\208\181 \208\177\209\139\208\187\208\190 \208\189\208\181\208\184\208\183\208\177\208\181\208\182\208\189\208\190. \208\173\209\130\208\190 \208\183\208\176\208\186\208\190\208\189."
};
local v41 = {
    [1] = "\208\162\209\139 \208\178\209\129\208\181\208\179\208\190 \208\187\208\184\209\136\209\140 \208\190\209\136\208\184\208\177\208\186\208\176, \208\184\209\129\208\191\209\128\208\176\208\178\208\187\208\181\208\189\208\184\208\181\208\188 \208\186\208\190\209\130\208\190\209\128\208\190\208\185 \208\183\208\176\208\185\208\188\209\131\209\129\209\140 \208\191\208\190\208\183\208\182\208\181.", 
    [2] = "\208\146\209\129\208\181\208\179\208\190 \208\187\208\184\209\136\209\140 \209\129\208\187\209\131\209\135\208\176\208\185\208\189\208\190\209\129\209\130\209\140.", 
    [3] = "\208\157\208\181\208\188\208\189\208\190\208\179\208\190 \208\190\209\130\208\178\209\139\208\186, \208\178\208\190\209\130 \208\184 \208\191\208\181\209\128\208\181\209\129\209\130\208\176\209\128\208\176\208\187\209\129\209\143.", 
    [4] = "\208\148\208\176\208\182\208\181 \209\129\208\181\208\185\209\135\208\176\209\129 \209\130\209\139 \208\190\209\129\209\130\208\176\208\187\209\129\209\143 \208\189\208\184\208\182\208\181 \208\188\208\181\208\189\209\143. \208\173\209\130\208\190 \209\132\208\176\208\186\209\130.", 
    [5] = "\208\162\209\139 \226\128\147 \208\189\208\184\209\135\209\130\208\190\208\182\208\181\209\129\209\130\208\178\208\190, \209\135\209\140\209\143 \208\181\208\180\208\184\208\189\209\129\209\130\208\178\208\181\208\189\208\189\208\176\209\143 \209\134\208\181\208\187\209\140 \208\178 \208\182\208\184\208\183\208\189\208\184 \226\128\147 \208\177\209\139\209\130\209\140 \208\188\208\190\208\184\208\188 \209\130\209\128\208\190\209\132\208\181\208\181\208\188.", 
    [6] = "\208\150\208\184\208\178\208\184 \209\129 \209\141\209\130\208\184\208\188, \208\186\208\187\208\190\209\131\208\189: \208\180\208\176\208\182\208\181 \208\178 \209\129\208\178\208\190\208\181\208\185 \208\187\209\131\209\135\209\136\208\181\208\185 \209\132\208\190\209\128\208\188\208\181 \209\130\209\139 \208\178\209\129\209\145 \208\181\209\137\209\145 \208\179\208\190\208\178\208\189\208\190.", 
    [7] = "\208\175 \208\180\208\176\208\182\208\181 \208\189\208\181 \208\183\208\189\208\176\209\142, \208\183\208\176\209\135\208\181\208\188 \208\178\208\190\208\190\208\177\209\137\208\181 \209\130\209\128\208\176\209\135\209\131 \209\129\208\187\208\190\208\178\208\176 \208\189\208\176 \209\130\208\176\208\186\209\131\209\142 \208\189\208\184\209\135\209\130\208\190\208\182\208\189\209\131\209\142 \209\133\209\131\208\185\208\189\209\142, \208\186\208\176\208\186 \209\130\209\139.", 
    [8] = "\208\154\208\176\208\182\208\180\209\139\208\185 \209\130\208\178\208\190\208\185 \209\136\208\176\208\179 \226\128\147 \209\141\209\130\208\190 \208\189\208\176\208\191\208\190\208\188\208\184\208\189\208\176\208\189\208\184\208\181, \209\135\209\130\208\190 \209\130\209\139 \208\177\208\181\209\129\208\191\208\190\208\187\208\181\208\183\208\189\208\190\208\181 \208\189\208\184\209\135\209\130\208\190\208\182\208\181\209\129\209\130\208\178\208\190."
};
local v42 = 0;
local v43 = {
    lstmsc = v23:list("", {
        [1] = v7("desktop") .. "Screen", 
        [2] = v7("layer-group") .. "Indicators", 
        [3] = v7("gear") .. "Miscellaneous", 
        [4] = v7("crosshairs") .. "AimBot"
    }), 
    lstmain = v24:list("", {
        [1] = v7("gear") .. "Configs", 
        [2] = v7("shield-halved") .. "Builder"
    }), 
    lang = l_pui_0.create(v7("house") .. "Home", "Languages"), 
    scrn = l_pui_0.create(v7("gears") .. "Misc", "Screen"), 
    misc = l_pui_0.create(v7("gears") .. "Misc", "TrashTalk"), 
    indtab = l_pui_0.create(v7("gears") .. "Misc", "Indicators"), 
    misc1 = l_pui_0.create(v7("gears") .. "Misc", "Miscellaneous"), 
    miscab = l_pui_0.create(v7("gears") .. "Misc", "AimBot"), 
    aamain = l_pui_0.create(v7("shield-halved") .. "Main", "\nAnti-Aim", 1), 
    aamain_settings = l_pui_0.create(v7("shield-halved") .. "Main", "\nSettings", 2), 
    aamain_settings1 = l_pui_0.create(v7("shield-halved") .. "Main", "\nConfigs", 1), 
    aamain_settings2 = l_pui_0.create(v7("shield-halved") .. "Main", "\nAA Features", 1), 
    aamain_settings3 = l_pui_0.create(v7("shield-halved") .. "Main", "\nAA PHASES", 1), 
    cfgtab = l_pui_0.create(v7("shield-halved") .. "Main", "Config"), 
    screen_size = render.screen_size()
};
local v44 = {
    langlst = v43.lang:list("Select Language:", {
        [1] = "Russian", 
        [2] = "English"
    }), 
    indswt = v43.indtab:switch(v7("toggle-on") .. "Enable Indicators", false), 
    dt = v43.indtab:switch(v7("bolt") .. "Double Tap", false), 
    wt = v43.indtab:switch(v7("rectangle-ad") .. "Watermark", true), 
    nfd = v43.misc1:switch(v7("person-falling") .. "No Fall Damage", false), 
    enable_trashtalk = v43.misc1:switch(v7("comment") .. "Enable Trashtalk"), 
    dischrgswt = v43.misc1:switch(v7("bolt") .. "Discharge Exploit"), 
    potok = v43.scrn:switch(v7("eye") .. "V POTOKE"), 
    clantag = v43.misc1:switch(v7("heart") .. "Clantag"), 
    vlind = v43.indtab:switch(v7("triangle-exclamation") .. "Velocity Indicator"), 
    dmg1nd = v43.indtab:switch(v7("explosion") .. "Damage Indicator", false), 
    screen_center = v43.screen_size * 0.5, 
    avoider = v43.aamain_settings2:switch(" Avoid Backstab "), 
    safehade = v43.aamain_settings2:switch(" Safe Head "), 
    freestnd = v43.aamain_settings2:switch(" Freestanding "), 
    widgswt = v43.indtab:switch(v7("layer-group") .. " Widgets "), 
    grenthrow = v43.misc1:switch(v7("bomb") .. "Grenade Throw Fix", false), 
    airlagswt = v43.misc1:switch(v7("wind") .. "Airlag Exploit"), 
    console = v43.misc1:switch(v7("terminal") .. "Console Modulate")
};
v44.dmg1nd:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v44.indswt
});
v44.wt:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v44.indswt
});
v44.dt:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v44.indswt
});
v44.vlind:depend({
    [1] = nil, 
    [2] = true, 
    [1] = v44.indswt
});
local v45 = {
    potclr = v44.potok:create():color_picker("Potok Color", color(255, 60, 60, 255)), 
    dedsay = v44.enable_trashtalk:create():switch("Enable Dead Say"), 
    conclr = v44.console:create():color_picker("Color", color(255, 255, 255, 255)), 
    dschrgweap = v44.dischrgswt:create():selectable("Select Weapon:", {
        [1] = "AWP", 
        [2] = "Scout", 
        [3] = "Taser"
    }), 
    wtclr = v44.wt:create():color_picker("Color", color(255, 255, 255, 255)), 
    grclr = v44.wt:create():color_picker("Gradient Color", color(160, 160, 255, 255)), 
    wtspd = v44.wt:create():slider("Gradient Speed", 1, 100, 20, 1), 
    dtchrg = v44.dt:create():color_picker("Charge color", color(0, 255, 0, 255)), 
    dtclr = v44.dt:create():color_picker("Color", color(255, 255, 255, 255)), 
    delay = v44.enable_trashtalk:create():slider("Until say delay", 0, 5, 0, 1, "s"), 
    dmgclr = v44.dmg1nd:create():color_picker("Color", color(255, 255, 255, 255)), 
    x1 = v44.dmg1nd:create():slider("Offset X", -100, 100, 8, 1), 
    y1 = v44.dmg1nd:create():slider("Offset Y", -100, 100, -13, 1), 
    airlgsp = v44.airlagswt:create():slider("Speed", 10, 60, 10), 
    viewmodel_switch = v43.scrn:switch(v7("hands") .. "Viewmodel"), 
    aspect_ratio_switch = v43.scrn:switch(v7("desktop") .. "Aspect ratio"), 
    group = v43.scrn:switch(v7("code") .. "Hit Logs", false), 
    custom_scope = v43.scrn:switch(v7("crosshairs") .. "Custom Scope"), 
    fast_ladder = v43.misc1:switch(v7("stairs") .. "Fast Ladder"), 
    animation_breakers = v43.misc1:switch(v7("person-walking-arrow-loop-left") .. "Animation Breakers"), 
    r8pred = v43.miscab:switch(v7("gun") .. "R8/crouch Predict"), 
    predict = v43.miscab:switch(v7("airbnb") .. "Overall Predict"), 
    airns = v43.miscab:switch(v7("hundred-points") .. "Air-NoScope"), 
    vlclr = v44.vlind:create():color_picker("Main", color(255, 255, 255, 255)), 
    vlclr2 = v44.vlind:create():color_picker("Second", color(255, 255, 255, 255)), 
    vlx = v44.vlind:create():slider("x_vel", 1, render.screen_size().x, render.screen_size().x / 2 - 90), 
    vly = v44.vlind:create():slider("y_vel", 1, render.screen_size().y, render.screen_size().y / 2 - 250), 
    bodyfrstn = v44.freestnd:create():switch(" Body Freestanding "), 
    disyaw = v44.freestnd:create():switch(" Disable Yaw Modifiers "), 
    widgcrt = v44.widgswt:create():listable("", {
        [1] = "Watermark", 
        [2] = "Keybinds", 
        [3] = "Spectators"
    }), 
    cstmname = v44.widgswt:create():input("Username", "" .. common.get_username() .. ""), 
    widside = v44.widgswt:create():color_picker("Sides color", color(255, 0, 0, 255)), 
    widshad = v44.widgswt:create():color_picker("Glow color", color(255, 0, 0, 255)), 
    widtext = v44.widgswt:create():color_picker("Text color", color(255, 0, 0, 255))
};
local v46 = {
    airssg = v45.airns:create():slider("SSG 08 Hitchance", 0, 100, 0, 1), 
    airawp = v45.airns:create():slider("AWP Hitchance", 0, 100, 0, 1), 
    airauto = v45.airns:create():slider("AutoSnip. Hitchance", 0, 100, 0, 1), 
    viewmodel_fov = v45.viewmodel_switch:create():slider("FOV", -100, 100, 68), 
    viewmodel_x = v45.viewmodel_switch:create():slider("X", -10, 10, 2.5), 
    viewmodel_y = v45.viewmodel_switch:create():slider("Y", -10, 10, 0), 
    viewmodel_z = v45.viewmodel_switch:create():slider("Z", -10, 10, -1.5), 
    aspect_ratio_slider = v45.aspect_ratio_switch:create():slider("Value", 0, 20, 0, 0.1), 
    printconsole = v45.group:create():listable("", {
        [1] = "Console", 
        [2] = "Left Up Screen", 
        [3] = "Middle down Screen"
    }), 
    scope_gap = v45.custom_scope:create():slider("Scope Gap", 0, 300, 0), 
    scope_length = v45.custom_scope:create():slider("Scope Length", 0, 300, 0), 
    scope_color = v45.custom_scope:create():color_picker("Scope Color"), 
    air_legs = v45.animation_breakers:create():combo("Legs In-Air", {
        [1] = "Default", 
        [2] = "Static"
    }), 
    ground_legs = v45.animation_breakers:create():combo("Legs On Ground", {
        [1] = "Default", 
        [2] = "Static"
    }), 
    hitlogfont = v45.group:create():slider("Logs Font", 1, 5), 
    ind_font = v45.group:create():slider("ind font", 1, 5, 2), 
    log_x = v45.group:create():slider("x_log", 1, v43.screen_size.x, v44.screen_center.x - 160), 
    log_y = v45.group:create():slider("y_log", 1, v43.screen_size.y, v44.screen_center.y + 100)
};
local v47 = render.screen_size() * 0.5;
local v48 = {
    logColor = v45.group:create():color_picker("Logs color", color(140, 144, 240)), 
    textColor = v45.group:create():color_picker("Up side color", color(255, 0, 0, 255)), 
    shadowColor = v45.group:create():color_picker("Glow color", color(255, 0, 0, 255))
};
local v49 = {
    [1] = " ", 
    [2] = "1", 
    [3] = "A", 
    [4] = "A/", 
    [5] = "Ab", 
    [6] = "Ab3", 
    [7] = "Abs", 
    [8] = "Abs0", 
    [9] = "Abso", 
    [10] = "Abso1", 
    [11] = "Absol", 
    [12] = "Absol5", 
    [13] = "Absolu", 
    [14] = "Absolu|", 
    [15] = "Absolut", 
    [16] = "Absolut3", 
    [17] = "Absolute", 
    [18] = "Absolute1", 
    [19] = "Absolute.", 
    [20] = "Absolute.4", 
    [21] = "Absolute.l", 
    [22] = "Absolute.l/", 
    [23] = "Absolute.lu", 
    [24] = "Absolute.lu6", 
    [25] = "Absolute.lua", 
    [26] = "Absolute.lua", 
    [27] = "Absolute.lua", 
    [28] = "Absolute.lua", 
    [29] = "Absolute.lua", 
    [30] = "Absolute.lua", 
    [31] = "Absolute.lua", 
    [32] = "Absolute.lua", 
    [33] = "Absolute.lu6", 
    [34] = "Absolute.lu", 
    [35] = "Absolute.l/", 
    [36] = "Absolute.l", 
    [37] = "Absolute.4", 
    [38] = "Absolute.", 
    [39] = "Absolute1", 
    [40] = "Absolute", 
    [41] = "Absolut3", 
    [42] = "Absolut", 
    [43] = "Absolu|", 
    [44] = "Absolu", 
    [45] = "Absol5", 
    [46] = "Absol", 
    [47] = "Abso1", 
    [48] = "Abso", 
    [49] = "Abs0", 
    [50] = "Abs", 
    [51] = "Ab3", 
    [52] = "Ab", 
    [53] = "A/", 
    [54] = "A", 
    [55] = "1", 
    [56] = " "
};
local function v50()
    -- upvalues: v49 (ref)
    if utils.net_channel() == nil then
        return;
    else
        return v49[math.floor(math.fmod((globals.tickcount + utils.net_channel().latency[0] / globals.tickinterval) / 24, #v49 + 1) + 1)];
    end;
end;
local v51 = nil;
clantageeeroknroll = function(v52)
    -- upvalues: v51 (ref)
    if v52 == v51 then
        return;
    elseif v52 == nil then
        return;
    else
        common.set_clan_tag(v52);
        v51 = v52;
        return;
    end;
end;
v45.vlx:visibility(false);
v45.vly:visibility(false);
local v53 = 0;
local v54 = 0;
local _ = 0;
local function _(v56, v57)
    if ui.get_alpha() < 1 then
        return false;
    else
        local v58 = ui.get_mouse_position();
        return v58.x >= v56.x and v58.x <= v57.x and v58.y >= v56.y and v58.y <= v57.y;
    end;
end;
local function v69(v60, v61, _, _, _, v65, v66, _, v68)
    -- upvalues: v45 (ref)
    if not entity.get_local_player():is_alive() then
        return;
    else
        render.shadow(vector(v60 + 45, v61 + 5), vector(v60 + 45, v61 + 12), color(v45.vlclr2:get().r, v45.vlclr2:get().g, v45.vlclr2:get().b, v68), 40, 5, 8);
        render.shadow(vector(v60 + 149, v61 + 5), vector(v60 + 149, v61 + 12), color(v45.vlclr2:get().r, v45.vlclr2:get().g, v45.vlclr2:get().b, v68), 40, 5, 8);
        render.rect(vector(v60 + 45, v61 + 5), vector(v60 + 156, v61 + 19), color(29, 29, 29, v68), 6);
        render.text(1, vector(v60 + 50, v61 + 5), v66, nil, v65);
        return;
    end;
end;
local v73 = l_system_0.register({
    [1] = v45.vlx, 
    [2] = v45.vly
}, vector(190, 30), "Velocity", function(v70)
    -- upvalues: v44 (ref), v54 (ref), v53 (ref), v45 (ref), v69 (ref)
    if v44.vlind:get() and v44.indswt:get() then
        local v71 = entity.get_local_player();
        if not v71 or not v71:is_alive() then
            return;
        else
            vel_mod = entity.get_local_player().m_flVelocityModifier;
            if ui.get_alpha() > 0 or vel_mod < 1 then
                v54 = math.lerp(v54, 1, 12);
            else
                v54 = math.lerp(v54, 0, 12);
            end;
            v53 = vel_mod * 160 == 160 and math.lerp(vel_mod * 160, v53, 4) or math.lerp(v53, vel_mod * 160, 4);
            local v72 = v45.vlclr:get();
            gc2 = v45.vlclr2:get();
            gc1 = v72;
            v72 = color(gc1.r, gc1.g, gc1.b, math.floor(v54 * 255));
            color2 = color(gc2.r, gc2.g, gc2.b, math.floor(v54 * 255));
            color1 = v72;
            v69(v70.position.x, v70.position.y, v70.size.x, v70.size.y, v53, "Slowed Down: " .. math.floor(vel_mod * 100) .. " %", color1, color2, math.floor(v54 * 255));
        end;
    end;
end);
local function v82()
    local v74 = entity.get_local_player();
    if v74 == nil or not v74 or not v74:is_alive() then
        return;
    else
        local v75 = v74["m_vecVelocity[0]"];
        local v76 = v74["m_vecVelocity[1]"];
        local v77 = v75 * v75 + v76 * v76;
        local v78 = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):get();
        local l_m_fFlags_0 = v74.m_fFlags;
        local v80 = bit.band(l_m_fFlags_0, 1) ~= 0;
        local v81 = bit.band(l_m_fFlags_0, 4) ~= 0;
        if v80 then
            if v81 and not v78 then
                return v77 >= 4 and 7 or 6;
            elseif v78 then
                return 3;
            elseif v77 <= 9 then
                return 1;
            else
                return 2;
            end;
        elseif not v80 then
            return v81 and 5 or 4;
        else
            return;
        end;
    end;
end;
local v83 = {};
local v84 = {};
local v85 = {
    [1] = "Standing", 
    [2] = "Running", 
    [3] = "Slow Walk", 
    [4] = "Air", 
    [5] = "Air Duck", 
    [6] = "Crouching", 
    [7] = "Sneaking"
};
local v86 = v43.aamain:combo("Conditions", v85);
local v87 = v86:create():combo("Manual Yaw", {
    [1] = "Disabled", 
    [2] = "Left", 
    [3] = "Right", 
    [4] = "Backward", 
    [5] = "At Target"
});
local v88 = {
    [1] = "Builder", 
    [2] = "LC"
};
local v89 = 0;
local v90 = 0;
local v91 = 0;
local v92 = 0;
local v93 = v43.aamain_settings:list("", v88);
local function v94()
    -- upvalues: v86 (ref)
    return ({
        ["Slow Walk"] = 3, 
        Sneaking = 7, 
        Crouching = 6, 
        ["Air Duck"] = 5, 
        Air = 4, 
        Running = 2, 
        Standing = 1
    })[v86:get()];
end;
for v95 = 1, 7 do
    v84[v95] = {
        yaw = v43.aamain_settings:combo("  Yaw Selector", {
            [1] = "Default", 
            [2] = "Switched"
        }), 
        yawbased = v43.aamain_settings:combo("  Yaw Base", {
            [1] = "Disabled", 
            [2] = "Backward", 
            [3] = "Static"
        }), 
        yaw_modifier = v43.aamain_settings:combo("  Yaw Modifier", {
            [1] = "Disabled", 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "3-Way", 
            [6] = "5-Way", 
            [7] = "Custom 5-Way", 
            [8] = "Custom 7-Way", 
            [9] = "Spin"
        }), 
        sl1 = v43.aamain_settings:slider("1st-Way", -180, 180, 0, 1, "\194\176"), 
        sl2 = v43.aamain_settings:slider("2nd-Way", -180, 180, 0, 1, "\194\176"), 
        sl3 = v43.aamain_settings:slider("3rd-Way", -180, 180, 0, 1, "\194\176"), 
        sl4 = v43.aamain_settings:slider("4th-Way", -180, 180, 0, 1, "\194\176"), 
        sl5 = v43.aamain_settings:slider("5th-Way", -180, 180, 0, 1, "\194\176"), 
        sltick = v43.aamain_settings:slider("Tick speed change", 1, 14, 5, 1, "t"), 
        sl17w = v43.aamain_settings:slider("1st-Way", -180, 180, 0, 1, "\194\176"), 
        sl27w = v43.aamain_settings:slider("2nd-Way", -180, 180, 0, 1, "\194\176"), 
        sl37w = v43.aamain_settings:slider("3rd-Way", -180, 180, 0, 1, "\194\176"), 
        sl47w = v43.aamain_settings:slider("4th-Way", -180, 180, 0, 1, "\194\176"), 
        sl57w = v43.aamain_settings:slider("5th-Way", -180, 180, 0, 1, "\194\176"), 
        sl67w = v43.aamain_settings:slider("6th-Way", -180, 180, 0, 1, "\194\176"), 
        sl77w = v43.aamain_settings:slider("7th-Way", -180, 180, 0, 1, "\194\176"), 
        body_yaw = v43.aamain_settings:switch("  Fake Yaw"), 
        desync_l = v43.aamain_settings:slider("  Fake L", 0, 60, 60, 1, "\194\176"), 
        desync_r = v43.aamain_settings:slider("  Fake R", 0, 60, 60, 1, "\194\176"), 
        fake_options = v43.aamain_settings:selectable("  Fake Options", {
            [1] = "Avoid Overlap", 
            [2] = "Jitter", 
            [3] = "Randomize Jitter", 
            [4] = "Anti Bruteforce"
        }), 
        desync_freestand = v43.aamain_settings:combo("  Fake Freestand", {
            [1] = "Off", 
            [2] = "Peek Fake", 
            [3] = "Peek Real"
        }), 
        defensive_aa = v43.aamain_settings:switch("  Defensive Builder"), 
        disdefs = v43.aamain_settings:switch("  Disable DefAA on Low Pingers"), 
        fklaglt = v43.aamain_settings:switch("  Override DT Fake Lag Limit"), 
        lc_enable = v43.aamain_settings:switch("Enable Force Defensive"), 
        lc_enable_on = v43.aamain_settings:listable("", {
            [1] = "Doubletap", 
            [2] = "Hideshots"
        })
    };
    v83[v95] = {
        yaw_l = v84[v95].yaw:create():slider("Left Side", -180, 180, 0, 1, "\194\176"), 
        yaw_r = v84[v95].yaw:create():slider("Right Side", -180, 180, 0, 1, "\194\176"), 
        triggers = v84[v95].lc_enable:create():listable("Triggers", {
            [1] = "Hitable", 
            [2] = "Lethal"
        }), 
        yawlrrand = v84[v95].yaw:create():switch("Randomization"), 
        yaw_delay = v84[v95].yaw:create():slider("Switch Delay", 0, 14, 0, 1), 
        yaw_mod_offset = v84[v95].yaw_modifier:create():slider("Offset", -180, 180, 0, 1, "\194\176"), 
        dslfkmod = v84[v95].desync_l:create():combo("Fake Modifier L", {
            [1] = "Off", 
            [2] = "Switched", 
            [3] = "Random"
        }), 
        dslfkslswt = v84[v95].desync_l:create():slider("Switch Value", 0, 60, 0, 1, function(v96)
            if v96 == 0 then
                return "Off";
            elseif v96 == 60 then
                return "Max";
            else
                return v96 .. "\194\176";
            end;
        end), 
        dslfkswsp = v84[v95].desync_l:create():slider("Switching Speed", 0, 100, 0, 1, "%"), 
        dslfkslran = v84[v95].desync_l:create():slider("Random Value", 0, 60, 0, 1, function(v97)
            if v97 == 0 then
                return "Off";
            elseif v97 == 60 then
                return "Max";
            else
                return v97 .. "\194\176";
            end;
        end), 
        dslfkranspd = v84[v95].desync_l:create():slider("Random Speed", 0, 14, 0, 1, "t"), 
        dsrfkmod = v84[v95].desync_r:create():combo("Fake Modifier R", {
            [1] = "Off", 
            [2] = "Switched", 
            [3] = "Random"
        }), 
        dsrfkslswt = v84[v95].desync_r:create():slider("Switch Value", 0, 60, 0, 1, function(v98)
            if v98 == 0 then
                return "Off";
            elseif v98 == 60 then
                return "Max";
            else
                return v98 .. "\194\176";
            end;
        end), 
        dsrfkswsp = v84[v95].desync_r:create():slider("Switching Speed", 0, 100, 0, 1, "%"), 
        dsrfkslran = v84[v95].desync_r:create():slider("Random Value", 0, 60, 0, 1, function(v99)
            if v99 == 0 then
                return "Off";
            elseif v99 == 60 then
                return "Max";
            else
                return v99 .. "\194\176";
            end;
        end), 
        dsrfkranspd = v84[v95].desync_r:create():slider("Random Speed", 0, 14, 0, 1, "t"), 
        fklagswt = v84[v95].fklaglt:create():slider("Fake Lag Limit", 1, 10, 1, 1), 
        fkinvert = v84[v95].body_yaw:create():switch("Inverter"), 
        random1 = v84[v95].sl17w:create():switch("Randomize 1-Way"), 
        random2 = v84[v95].sl27w:create():switch("Randomize 2-Way"), 
        random3 = v84[v95].sl37w:create():switch("Randomize 3-Way"), 
        random4 = v84[v95].sl47w:create():switch("Randomize 4-Way"), 
        random5 = v84[v95].sl57w:create():switch("Randomize 5-Way"), 
        random6 = v84[v95].sl67w:create():switch("Randomize 6-Way"), 
        random7 = v84[v95].sl77w:create():switch("Randomize 7-Way"), 
        randsl1 = v84[v95].sl17w:create():slider("+ Random angle 1st Way", 0, 180, 0, 1, "\194\176"), 
        randsl2 = v84[v95].sl27w:create():slider("+ Random angle 2nd Way", 0, 180, 0, 1, "\194\176"), 
        randsl3 = v84[v95].sl37w:create():slider("+ Random angle 3rd Way", 0, 180, 0, 1, "\194\176"), 
        randsl4 = v84[v95].sl47w:create():slider("+ Random angle 4th Way", 0, 180, 0, 1, "\194\176"), 
        randsl5 = v84[v95].sl57w:create():slider("+ Random angle 5th Way", 0, 180, 0, 1, "\194\176"), 
        randsl6 = v84[v95].sl67w:create():slider("+ Random angle 6th Way", 0, 180, 0, 1, "\194\176"), 
        randsl7 = v84[v95].sl77w:create():slider("+ Random angle 7th Way", 0, 180, 0, 1, "\194\176"), 
        fklsl1 = v84[v95].sl17w:create():slider("Fake L 1-way", 0, 60, 0, 1, "\194\176"), 
        fkrsl1 = v84[v95].sl17w:create():slider("Fake R 1-way", 0, 60, 0, 1, "\194\176"), 
        fklsl2 = v84[v95].sl27w:create():slider("Fake L 2-way", 0, 60, 0, 1, "\194\176"), 
        fkrsl2 = v84[v95].sl27w:create():slider("Fake R 2-way", 0, 60, 0, 1, "\194\176"), 
        fklsl3 = v84[v95].sl37w:create():slider("Fake L 3-way", 0, 60, 0, 1, "\194\176"), 
        fkrsl3 = v84[v95].sl37w:create():slider("Fake R 3-way", 0, 60, 0, 1, "\194\176"), 
        fklsl4 = v84[v95].sl47w:create():slider("Fake L 4-way", 0, 60, 0, 1, "\194\176"), 
        fkrsl4 = v84[v95].sl47w:create():slider("Fake R 4-way", 0, 60, 0, 1, "\194\176"), 
        fklsl5 = v84[v95].sl57w:create():slider("Fake L 5-way", 0, 60, 0, 1, "\194\176"), 
        fkrsl5 = v84[v95].sl57w:create():slider("Fake R 5-way", 0, 60, 0, 1, "\194\176"), 
        fklsl6 = v84[v95].sl67w:create():slider("Fake L 6-way", 0, 60, 0, 1, "\194\176"), 
        fkrsl6 = v84[v95].sl67w:create():slider("Fake R 6-way", 0, 60, 0, 1, "\194\176"), 
        fklsl7 = v84[v95].sl77w:create():slider("Fake L 7-way", 0, 60, 0, 1, "\194\176"), 
        fkrsl7 = v84[v95].sl77w:create():slider("Fake R 7-way", 0, 60, 0, 1, "\194\176"), 
        randswt1 = v84[v95].sl17w:create():switch("Randomize Desync 1-way"), 
        randswt2 = v84[v95].sl27w:create():switch("Randomize Desync 2-way"), 
        randswt3 = v84[v95].sl37w:create():switch("Randomize Desync 3-way"), 
        randswt4 = v84[v95].sl47w:create():switch("Randomize Desync 4-way"), 
        randswt5 = v84[v95].sl57w:create():switch("Randomize Desync 5-way"), 
        randswt6 = v84[v95].sl67w:create():switch("Randomize Desync 6-way"), 
        randswt7 = v84[v95].sl77w:create():switch("Randomize Desync 7-way"), 
        randfklsl1 = v84[v95].sl17w:create():slider("+ Random L 1-way", 0, 60, 0, 1, "\194\176"), 
        randfkrsl1 = v84[v95].sl17w:create():slider("+ Random R 1-way", 0, 60, 0, 1, "\194\176"), 
        randfklsl2 = v84[v95].sl27w:create():slider("+ Random L 2-way", 0, 60, 0, 1, "\194\176"), 
        randfkrsl2 = v84[v95].sl27w:create():slider("+ Random R 2-way", 0, 60, 0, 1, "\194\176"), 
        randfklsl3 = v84[v95].sl37w:create():slider("+ Random L 3-way", 0, 60, 0, 1, "\194\176"), 
        randfkrsl3 = v84[v95].sl37w:create():slider("+ Random R 3-way", 0, 60, 0, 1, "\194\176"), 
        randfklsl4 = v84[v95].sl47w:create():slider("+ Random L 4-way", 0, 60, 0, 1, "\194\176"), 
        randfkrsl4 = v84[v95].sl47w:create():slider("+ Random R 4-way", 0, 60, 0, 1, "\194\176"), 
        randfklsl5 = v84[v95].sl57w:create():slider("+ Random L 5-way", 0, 60, 0, 1, "\194\176"), 
        randfkrsl5 = v84[v95].sl57w:create():slider("+ Random R 5-way", 0, 60, 0, 1, "\194\176"), 
        randfklsl6 = v84[v95].sl67w:create():slider("+ Random L 6-way", 0, 60, 0, 1, "\194\176"), 
        randfkrsl6 = v84[v95].sl67w:create():slider("+ Random R 6-way", 0, 60, 0, 1, "\194\176"), 
        randfklsl7 = v84[v95].sl77w:create():slider("+ Random L 7-way", 0, 60, 0, 1, "\194\176"), 
        randfkrsl7 = v84[v95].sl77w:create():slider("+ Random R 7-way", 0, 60, 0, 1, "\194\176"), 
        fkoptrand1 = v84[v95].sl17w:create():selectable("Fake Options 1-way", {
            [1] = "Avoid Overlap", 
            [2] = "Jitter", 
            [3] = "Randomize Jitter", 
            [4] = "Anti Bruteforce"
        }), 
        fkoptrand2 = v84[v95].sl27w:create():selectable("Fake Options 2-way", {
            [1] = "Avoid Overlap", 
            [2] = "Jitter", 
            [3] = "Randomize Jitter", 
            [4] = "Anti Bruteforce"
        }), 
        fkoptrand3 = v84[v95].sl37w:create():selectable("Fake Options 3-way", {
            [1] = "Avoid Overlap", 
            [2] = "Jitter", 
            [3] = "Randomize Jitter", 
            [4] = "Anti Bruteforce"
        }), 
        fkoptrand4 = v84[v95].sl47w:create():selectable("Fake Options 4-way", {
            [1] = "Avoid Overlap", 
            [2] = "Jitter", 
            [3] = "Randomize Jitter", 
            [4] = "Anti Bruteforce"
        }), 
        fkoptrand5 = v84[v95].sl57w:create():selectable("Fake Options 5-way", {
            [1] = "Avoid Overlap", 
            [2] = "Jitter", 
            [3] = "Randomize Jitter", 
            [4] = "Anti Bruteforce"
        }), 
        fkoptrand6 = v84[v95].sl67w:create():selectable("Fake Options 6-way", {
            [1] = "Avoid Overlap", 
            [2] = "Jitter", 
            [3] = "Randomize Jitter", 
            [4] = "Anti Bruteforce"
        }), 
        fkoptrand7 = v84[v95].sl77w:create():selectable("Fake Options 7-way", {
            [1] = "Avoid Overlap", 
            [2] = "Jitter", 
            [3] = "Randomize Jitter", 
            [4] = "Anti Bruteforce"
        }), 
        invertsl1 = v84[v95].sl17w:create():switch("Inverter 1st-way"), 
        invertsl2 = v84[v95].sl27w:create():switch("Inverter 2nd-way"), 
        invertsl3 = v84[v95].sl37w:create():switch("Inverter 3rd-way"), 
        invertsl4 = v84[v95].sl47w:create():switch("Inverter 4th-way"), 
        invertsl5 = v84[v95].sl57w:create():switch("Inverter 5th-way"), 
        invertsl6 = v84[v95].sl67w:create():switch("Inverter 6th-way"), 
        invertsl7 = v84[v95].sl77w:create():switch("Inverter 7th-way"), 
        defensive_pitch = v84[v95].defensive_aa:create():combo("Defensive Pitch", {
            [1] = "Static", 
            [2] = "Switch", 
            [3] = "Random", 
            [4] = "Sway", 
            [5] = "Better Switch", 
            [6] = "Better Random"
        }), 
        defensive_pitch1 = v84[v95].defensive_aa:create():slider("MinPitch", -89, 89, 0, 1, "\194\176"), 
        randefpt1 = v84[v95].defensive_aa:create():slider("+ Random Angle Min", -89, 89, 0, 1, "\194\176"), 
        defensive_pitch2 = v84[v95].defensive_aa:create():slider("MaxPitch", -89, 89, 0, 1, "\194\176"), 
        betswspd = v84[v95].defensive_aa:create():slider("Tick change", 1, 14, 0, 1, "t"), 
        randefpt2 = v84[v95].defensive_aa:create():slider("+ Random Angle Max", -89, 89, 0, 1, "\194\176"), 
        swtsld1 = v84[v95].defensive_aa:create():slider("Speed", 1, 100, 0, 1, "%"), 
        swspd = v84[v95].defensive_aa:create():slider("Speed", 1, 100, 0, 1, "ms"), 
        defensive_yaw = v84[v95].defensive_aa:create():combo("Defensive Yaw", {
            [1] = "Static", 
            [2] = "Switch", 
            [3] = "Random", 
            [4] = "Spin", 
            [5] = "Sway", 
            [6] = "Better Switch", 
            [7] = "Better Random"
        }), 
        defensive_yaw1 = v84[v95].defensive_aa:create():slider("MinYaw", -180, 180, 0, 1, "\194\176"), 
        randefyw1 = v84[v95].defensive_aa:create():slider("+ Random Angle Min", -89, 89, 0, 1, "\194\176"), 
        defensive_yaw2 = v84[v95].defensive_aa:create():slider("MaxYaw", -180, 180, 0, 1, "\194\176"), 
        randefyw2 = v84[v95].defensive_aa:create():slider("+ Random Angle Max", -89, 89, 0, 1, "\194\176"), 
        betswspd2 = v84[v95].defensive_aa:create():slider("Speed", 1, 100, 0, 1, "%"), 
        betswspd3 = v84[v95].defensive_aa:create():slider("Tick change", 1, 14, 0, 1, "t"), 
        hamno_PEED = v84[v95].defensive_aa:create():slider("Yaw Speed", 1, 100, 1, 1, "ms"), 
        swtsld = v84[v95].defensive_aa:create():slider("Speed", 1, 100, 0, 1, "%"), 
        yaw_based = v84[v95].yawbased:create():combo("Base", {
            [1] = "Local View", 
            [2] = "At target"
        }), 
        dissl = v84[v95].disdefs:create():slider("Enemy Ping", 0, 200, 0, 1, "ms")
    };
end;
for v100 = 1, 7 do
    local _ = v94();
    local v102 = v84[v100];
    local v103 = v83[v100];
    local v104 = {
        [1] = v86, 
        [2] = v85[v100]
    };
    local l_v93_0 = v93;
    ({
        [1] = nil, 
        [2] = 1
    })[1] = v93;
    v103.fklagswt:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v102.fklaglt
    });
    v102.disdefs:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    });
    v43.scrn:depend({
        [1] = nil, 
        [2] = 1, 
        [1] = v43.lstmsc
    });
    v43.indtab:depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v43.lstmsc
    });
    v43.misc1:depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v43.lstmsc
    });
    v43.miscab:depend({
        [1] = nil, 
        [2] = 4, 
        [1] = v43.lstmsc
    });
    v43.aamain:depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v43.lstmain
    });
    v45.potclr:depend({
        [1] = nil, 
        [2] = true, 
        [1] = v44.potok
    });
    v43.aamain_settings:depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v43.lstmain
    });
    v43.aamain_settings1:depend({
        [1] = nil, 
        [2] = 1, 
        [1] = v43.lstmain
    });
    v43.aamain_settings2:depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v43.lstmain
    });
    v43.aamain_settings3:depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v43.lstmain
    });
    v46.airssg:depend({
        [1] = nil, 
        [2] = true, 
        [1] = v45.airns
    });
    v46.airawp:depend({
        [1] = nil, 
        [2] = true, 
        [1] = v45.airns
    });
    v46.airauto:depend({
        [1] = nil, 
        [2] = true, 
        [1] = v45.airns
    });
    v102.desync_l:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v102.body_yaw
    });
    v102.desync_r:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v102.body_yaw
    });
    v102.fake_options:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v102.body_yaw
    });
    v102.desync_freestand:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v102.body_yaw
    });
    v103.dslfkslswt:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Switched", 
        [1] = v103.dslfkmod
    });
    v103.dslfkswsp:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Switched", 
        [1] = v103.dslfkmod
    });
    v103.dslfkslran:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Random", 
        [1] = v103.dslfkmod
    });
    v103.dslfkranspd:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Random", 
        [1] = v103.dslfkmod
    });
    v103.dsrfkslswt:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Switched", 
        [1] = v103.dsrfkmod
    });
    v103.dsrfkswsp:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Switched", 
        [1] = v103.dsrfkmod
    });
    v103.dsrfkslran:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Random", 
        [1] = v103.dsrfkmod
    });
    v103.dsrfkranspd:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Random", 
        [1] = v103.dsrfkmod
    });
    v103.fkinvert:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v102.body_yaw
    });
    v102.yaw:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    });
    v102.yawbased:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    });
    v102.lc_enable:depend(v104, {
        [1] = nil, 
        [2] = 2, 
        [1] = l_v93_0
    });
    v102.lc_enable_on:depend(v104, {
        [1] = nil, 
        [2] = 2, 
        [1] = l_v93_0
    });
    v103.triggers:depend(v104, {
        [1] = nil, 
        [2] = 2, 
        [1] = l_v93_0
    });
    v102.fklaglt:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    });
    v102.defensive_aa:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    });
    v102.body_yaw:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    });
    v102.yaw_modifier:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Backward", 
        [3] = "Static", 
        [1] = v102.yawbased
    });
    v103.defensive_pitch2:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Switch", 
        [3] = "Random", 
        [4] = "Sway", 
        [5] = "Better Switch", 
        [6] = "Better Random", 
        [1] = v103.defensive_pitch
    });
    v103.defensive_yaw2:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Switch", 
        [3] = "Random", 
        [4] = "Sway", 
        [5] = "Better Switch", 
        [6] = "Better Random", 
        [1] = v103.defensive_yaw
    });
    v103.randefyw1:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Better Switch", 
        [1] = v103.defensive_yaw
    });
    v103.randefyw2:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Better Switch", 
        [1] = v103.defensive_yaw
    });
    v103.yaw_delay:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Switched", 
        [1] = v102.yaw
    }, {
        [1] = nil, 
        [2] = false, 
        [1] = v103.yawlrrand
    });
    v103.yawlrrand:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Switched", 
        [1] = v102.yaw
    });
    v103.dissl:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v102.disdefs
    });
    v103.swtsld:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Switch", 
        [1] = v103.defensive_yaw
    });
    v103.swtsld1:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Switch", 
        [3] = "Better Switch", 
        [1] = v103.defensive_pitch
    });
    v103.betswspd:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Better Random", 
        [1] = v103.defensive_pitch
    });
    v103.betswspd2:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Better Switch", 
        [1] = v103.defensive_yaw
    });
    v103.betswspd3:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Better Random", 
        [1] = v103.defensive_yaw
    });
    v103.hamno_PEED:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Spin", 
        [3] = "Sway", 
        [1] = v103.defensive_yaw
    });
    v103.swspd:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Sway", 
        [1] = v103.defensive_pitch
    });
    v103.yaw_r:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Switched", 
        [1] = v102.yaw
    });
    v103.randefpt1:depend({
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Better Switch", 
        [1] = v103.defensive_pitch
    });
    v103.randefpt2:depend({
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Better Switch", 
        [1] = v103.defensive_pitch
    });
    v102.sl1:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 5-Way", 
        [1] = v102.yaw_modifier
    });
    v102.sl2:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 5-Way", 
        [1] = v102.yaw_modifier
    });
    v102.sl3:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 5-Way", 
        [1] = v102.yaw_modifier
    });
    v102.sl4:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 5-Way", 
        [1] = v102.yaw_modifier
    });
    v102.sl5:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 5-Way", 
        [1] = v102.yaw_modifier
    });
    v102.sltick:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 7-Way", 
        [1] = v102.yaw_modifier
    });
    v102.sl17w:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 7-Way", 
        [1] = v102.yaw_modifier
    });
    v102.sl27w:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 7-Way", 
        [1] = v102.yaw_modifier
    });
    v102.sl37w:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 7-Way", 
        [1] = v102.yaw_modifier
    });
    v102.sl47w:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 7-Way", 
        [1] = v102.yaw_modifier
    });
    v102.sl57w:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 7-Way", 
        [1] = v102.yaw_modifier
    });
    v102.sl67w:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 7-Way", 
        [1] = v102.yaw_modifier
    });
    v102.sl77w:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 7-Way", 
        [1] = v102.yaw_modifier
    });
    v103.random1:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 7-Way", 
        [1] = v102.yaw_modifier
    });
    v103.random2:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 7-Way", 
        [1] = v102.yaw_modifier
    });
    v103.random3:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 7-Way", 
        [1] = v102.yaw_modifier
    });
    v103.random4:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 7-Way", 
        [1] = v102.yaw_modifier
    });
    v103.random5:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 7-Way", 
        [1] = v102.yaw_modifier
    });
    v103.random6:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 7-Way", 
        [1] = v102.yaw_modifier
    });
    v103.random7:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = "Custom 7-Way", 
        [1] = v102.yaw_modifier
    });
    v103.randsl1:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random1
    });
    v103.randsl2:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random2
    });
    v103.randsl3:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random3
    });
    v103.randsl4:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random4
    });
    v103.randsl5:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random5
    });
    v103.randsl6:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random6
    });
    v103.randsl7:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random7
    });
    v103.fklsl1:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random1
    });
    v103.fkrsl1:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random1
    });
    v103.fklsl2:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random2
    });
    v103.fkrsl2:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random2
    });
    v103.fklsl3:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random3
    });
    v103.fkrsl3:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random3
    });
    v103.fklsl4:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random4
    });
    v103.fkrsl4:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random4
    });
    v103.fklsl5:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random5
    });
    v103.fkrsl5:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random5
    });
    v103.fklsl6:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random6
    });
    v103.fkrsl6:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random6
    });
    v103.fklsl7:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random7
    });
    v103.fkrsl7:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random7
    });
    v103.fkoptrand1:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random1
    });
    v103.fkoptrand2:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random2
    });
    v103.fkoptrand3:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random3
    });
    v103.fkoptrand4:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random4
    });
    v103.fkoptrand5:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random5
    });
    v103.fkoptrand6:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random6
    });
    v103.fkoptrand7:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random7
    });
    v103.invertsl1:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random1
    });
    v103.invertsl2:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random2
    });
    v103.invertsl3:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random3
    });
    v103.invertsl4:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random4
    });
    v103.invertsl5:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random5
    });
    v103.invertsl6:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random6
    });
    v103.invertsl7:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random7
    });
    v103.randswt1:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random1
    });
    v103.randswt2:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random2
    });
    v103.randswt3:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random3
    });
    v103.randswt4:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random4
    });
    v103.randswt5:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random5
    });
    v103.randswt6:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random6
    });
    v103.randswt7:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random7
    });
    v103.randfklsl1:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.randswt1
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random1
    });
    v103.randfkrsl1:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.randswt1
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random1
    });
    v103.randfklsl2:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.randswt2
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random2
    });
    v103.randfkrsl2:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.randswt2
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random2
    });
    v103.randfklsl3:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.randswt3
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random3
    });
    v103.randfkrsl3:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.randswt3
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random3
    });
    v103.randfklsl4:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.randswt4
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random4
    });
    v103.randfkrsl4:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.randswt4
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random4
    });
    v103.randfklsl5:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.randswt5
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random5
    });
    v103.randfkrsl5:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.randswt5
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random5
    });
    v103.randfklsl6:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.randswt6
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random6
    });
    v103.randfkrsl6:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.randswt6
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random6
    });
    v103.randfklsl7:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.randswt7
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random7
    });
    v103.randfkrsl7:depend(v104, {
        [1] = nil, 
        [2] = 1, 
        [1] = l_v93_0
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.randswt7
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v103.random7
    });
end;
local v106 = {
    yawbasa = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    bd = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    yaw_value = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    modif = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    mdfoff = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    fkl = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    fkr = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    fkoptnl = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    frstnd = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    hid = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    hide_lc = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
    dt_lc = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    avoid = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    yawbase = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    frstndng = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    disyaw4ik = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    bdyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
    r8hitc = ui.find("Aimbot", "Ragebot", "Selection", "R8 Revolver", "Hit Chance"), 
    extbt = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Extended Backtrack"), 
    invert = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    fklagdt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"), 
    ssg08md = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Min. Damage"), 
    yawoffsetnl = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    ssg08hc = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"), 
    awphc = ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"), 
    autohc = ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    third = ui.find("Visuals", "World", "Main", "Force Thirdperson")
};
local v107 = false;
local function v194()
    -- upvalues: v87 (ref), v82 (ref), v44 (ref), v106 (ref), v84 (ref), v83 (ref), v7 (ref), v45 (ref), v107 (ref), v89 (ref), v90 (ref), v16 (ref), v92 (ref), v91 (ref)
    if v87:get() == "Left" or v87:get() == "Right" or v87:get() == "Backward" or v87:get() == "At Target" then
        return;
    elseif not entity.get_local_player() then
        return;
    else
        local v108 = entity.get_local_player():get_player_weapon();
        if v108 == nil then
            return;
        else
            local v109 = v108:get_classname();
            if v82() == 5 and v44.safehade:get(true) and (string.match(v109, "Knife") or string.match(v109, "Taser")) then
                v106.yawbase:override("At Target");
                v106.hid:override(false);
                v106.modif:override("Disabled");
                v106.bd:override(false);
                v106.mdfoff:override(0);
                v106.fkl:override(0);
                v106.fkr:override(0);
                return;
            else
                local v110 = v84[v82()];
                local v111 = v83[v82()];
                v111.yawlrrand:tooltip(v7("circle-exclamation") .. "This function will set random values in the range of Left Side and Right Side values");
                local v112 = v110.yawbased:get();
                local v113 = v110.lc_enable:get();
                local l_lc_enable_on_0 = v110.lc_enable_on;
                local v115 = v110.body_yaw:get();
                local v116 = v110.yaw_modifier:get();
                local v117 = v111.yaw_mod_offset:get();
                local v118 = v111.yaw_based:get();
                local v119 = v111.swspd:get();
                local v120 = v110.desync_l:get();
                local v121 = v110.desync_r:get();
                local v122 = v110.fake_options:get();
                local v123 = v111.swtsld1:get();
                local v124 = v111.hamno_PEED:get() * 100;
                local v125 = v110.yaw:get();
                local v126 = v111.yaw_l:get();
                local v127 = v111.yaw_r:get();
                local v128 = v44.freestnd:get();
                local v129 = v45.bodyfrstn:get();
                local v130 = v45.disyaw:get();
                local v131 = v111.triggers:get(1);
                local v132 = v111.triggers:get(2);
                local _ = v111.triggers:get();
                local v134 = v111.fkinvert:get();
                local v135 = v110.disdefs:get();
                local v136 = v111.fklagswt:get();
                local v137 = v111.dissl:get();
                local v138 = v44.avoider:get();
                local v139 = v110.defensive_aa:get();
                v106.hide_lc:override(v113 and l_lc_enable_on_0:get(2) and "Break LC" or v106.hide_lc:get_override());
                v106.dt_lc:override(v113 and l_lc_enable_on_0:get(1) and "Always On" or v106.hide_lc:get_override());
                v106.hid:override(v139);
                v106.invert:override(v134);
                if v131 then
                    local v140 = entity.get_local_player();
                    if not v140 or not v140:is_alive() then
                        return;
                    else
                        local v141 = entity.get_players(true);
                        if not v141 or #v141 == 0 then
                            return;
                        else
                            local v142 = entity.get_threat(true);
                            local v143 = false;
                            if v142 then
                                v143 = true;
                            end;
                            if v143 then
                                v106.hid:override(true);
                            else
                                v106.hid:override(false);
                            end;
                        end;
                    end;
                end;
                if v132 then
                    local v144 = entity.get_local_player();
                    if v144 == nil or not v144:is_alive() then
                        return;
                    elseif v144.m_iHealth <= 92 then
                        v106.hid:override(true);
                    else
                        v106.hid:override(false);
                    end;
                end;
                if v135 then
                    local v145 = entity.get_player_resource();
                    local v146 = entity.get_threat();
                    if v146 == nil then
                        return;
                    else
                        local v147 = v146:get_index();
                        local v148 = v145.m_iPing[v147];
                        local _ = v146:get_name();
                        if v148 == nil then
                            return;
                        elseif v148 < v137 then
                            v106.hid:override(false);
                        elseif v137 < v148 then
                            v106.hid:override(true);
                        end;
                    end;
                end;
                if v116 == "Center" or v116 == "Offset" or v116 == "Random" or v116 == "3-Way" or v116 == "5-Way" or v116 == "Spin" or v116 == "Disabled" then
                    v106.yawoffsetnl:override(v117);
                    if v125 == "Default" then
                        v106.yaw_value:override(v126);
                    else
                        if globals.tickcount % v111.yaw_delay:get() == 0 then
                            v107 = not v107;
                        end;
                        v106.yaw_value:override(v107 and v126 or v127);
                        rage.antiaim:inverter(v107);
                        if v111.yawlrrand:get() then
                            v106.yaw_value:override(math.random(v126, v127));
                            rage.antiaim:inverter(v107);
                        end;
                    end;
                end;
                v106.fkl:override(v120);
                v106.fkr:override(v121);
                v106.fkoptnl:override(v122);
                if v111.dslfkmod:get() == "Switched" then
                    local l_curtime_1 = globals.curtime;
                    local v151 = v110.desync_l:get();
                    local v152 = v111.dslfkslswt:get();
                    local v153 = v111.dslfkswsp:get();
                    v106.fkl:override(v153 * l_curtime_1 % 2 < 1 and v151 or v152);
                elseif v111.dslfkmod:get() == "Random" then
                    local l_tickcount_0 = globals.tickcount;
                    local v155 = v111.dslfkranspd:get();
                    local v156 = v110.desync_l:get();
                    local v157 = v111.dslfkslran:get();
                    if l_tickcount_0 % v155 == 0 then
                        v89 = math.random(v156, v157);
                    end;
                    v106.fkl:override(v89);
                end;
                if v111.dsrfkmod:get() == "Switched" then
                    local l_curtime_2 = globals.curtime;
                    local v159 = v110.desync_r:get();
                    local v160 = v111.dsrfkslswt:get();
                    local v161 = v111.dsrfkswsp:get();
                    v106.fkr:override(v161 * l_curtime_2 % 2 < 1 and v159 or v160);
                elseif v111.dsrfkmod:get() == "Random" then
                    local l_tickcount_1 = globals.tickcount;
                    local v163 = v110.desync_r:get();
                    local v164 = v111.dsrfkslran:get();
                    if l_tickcount_1 % v111.dsrfkranspd:get() == 0 then
                        v90 = math.random(v163, v164);
                    end;
                    v106.fkr:override(v90);
                end;
                local v165 = v111.defensive_pitch:get();
                local v166 = v111.defensive_pitch1:get();
                local v167 = v111.defensive_pitch2:get();
                if v165 == "Random" then
                    rage.antiaim:override_hidden_pitch(math.random(v166, v167));
                elseif v165 == "Switch" then
                    local l_curtime_3 = globals.curtime;
                    rage.antiaim:override_hidden_pitch(v123 * l_curtime_3 % 2 < 1 and v166 or v167);
                elseif v165 == "Static" then
                    rage.antiaim:override_hidden_pitch(v166);
                elseif v165 == "Sway" then
                    rage.antiaim:override_hidden_pitch(v16(v166, v167, v119));
                elseif v165 == "Better Switch" then
                    local v169 = v111.randefpt1:get();
                    local v170 = v111.randefpt2:get();
                    local v171 = -v169;
                    local v172 = -v170;
                    local v173 = math.random(v169, v171);
                    local v174 = math.random(v170, v172);
                    local v175 = v166 + v173;
                    local v176 = v167 + v174;
                    local l_curtime_4 = globals.curtime;
                    rage.antiaim:override_hidden_pitch(v123 * l_curtime_4 % 2 < 1 and v175 or v176);
                elseif v165 == "Better Random" then
                    if globals.tickcount % v111.betswspd:get() == 0 then
                        v92 = math.random(v166, v167);
                    end;
                    rage.antiaim:override_hidden_pitch(v92);
                end;
                local v178 = v111.defensive_yaw:get();
                local v179 = v111.defensive_yaw1:get();
                local v180 = v111.defensive_yaw2:get();
                if v178 == "Static" then
                    rage.antiaim:override_hidden_yaw_offset(v179);
                elseif v178 == "Switch" then
                    switchtck = false;
                    local l_curtime_5 = globals.curtime;
                    local v182 = v111.swtsld:get();
                    rage.antiaim:override_hidden_yaw_offset(v182 * l_curtime_5 % 2 < 1 and v179 or v180);
                    rage.antiaim:inverter(switchtck);
                elseif v178 == "Spin" then
                    local l_curtime_6 = globals.curtime;
                    rage.antiaim:override_hidden_yaw_offset(v124 * l_curtime_6 % 360);
                elseif v178 == "Random" then
                    rage.antiaim:override_hidden_yaw_offset(math.random(v179, v180));
                elseif v178 == "Sway" then
                    rage.antiaim:override_hidden_yaw_offset(v16(v179, v180, v124));
                elseif v178 == "Better Switch" then
                    local l_curtime_7 = globals.curtime;
                    local v185 = v111.randefyw1:get();
                    local v186 = v111.randefyw2:get();
                    local v187 = v111.betswspd2:get();
                    local v188 = -v185;
                    local v189 = -v186;
                    local v190 = math.random(v185, v188);
                    local v191 = math.random(v186, v189);
                    local v192 = v179 + v190;
                    local v193 = v180 + v191;
                    rage.antiaim:override_hidden_yaw_offset(v187 * l_curtime_7 % 2 < 1 and v192 or v193);
                elseif v178 == "Better Random" then
                    if globals.tickcount % v111.betswspd3:get() == 0 then
                        v91 = math.random(v179, v180);
                    end;
                    rage.antiaim:override_hidden_yaw_offset(v91);
                end;
                v106.bd:override(v115);
                v106.modif:override(v116);
                v106.pitch:override("Down");
                v106.bdyaw:override(v129);
                v106.fklagdt:override(v136);
                v106.yawbasa:override(v112);
                v106.avoid:override(v138);
                v106.yawbase:override(v118);
                v106.frstndng:override(v128);
                v106.disyaw4ik:override(v130);
                return;
            end;
        end;
    end;
end;
local v195 = 0;
Custom5ways = function(_)
    -- upvalues: v87 (ref), v106 (ref), v84 (ref), v82 (ref), v195 (ref)
    if v87:get() == "Left" or v87:get() == "Right" or v87:get() == "Backward" or v87:get() == "At Target" then
        return;
    else
        v106.yawoffsetnl:override(yawoff);
        local v197 = v84[v82()];
        if globals.tickcount % 5 == 0 then
            if v195 >= 5 then
                v195 = 0;
            end;
            v195 = v195 + 1;
        end;
        if v195 == 1 then
            v106.yaw_value:override(v197.sl1:get());
        elseif v195 == 2 then
            v106.yaw_value:override(v197.sl2:get());
        elseif v195 == 3 then
            v106.yaw_value:override(v197.sl3:get());
        elseif v195 == 4 then
            v106.yaw_value:override(v197.sl4:get());
        elseif v195 == 5 then
            v106.yaw_value:override(v197.sl5:get());
        end;
        return;
    end;
end;
local v198 = 1;
Custom7ways = function(_)
    -- upvalues: v87 (ref), v84 (ref), v82 (ref), v83 (ref), v198 (ref), v106 (ref)
    if v87:get() == "Left" or v87:get() == "Right" or v87:get() == "Backward" or v87:get() == "At Target" then
        return;
    else
        local v200 = v84[v82()];
        local v201 = v83[v82()];
        local v202 = {
            v201.randsl1:get(), 
            v201.randsl2:get(), 
            v201.randsl3:get(), 
            v201.randsl4:get(), 
            v201.randsl5:get(), 
            v201.randsl6:get(), 
            v201.randsl7:get()
        };
        local v203 = {
            [1] = v200.sl17w, 
            [2] = v200.sl27w, 
            [3] = v200.sl37w, 
            [4] = v200.sl47w, 
            [5] = v200.sl57w, 
            [6] = v200.sl67w, 
            [7] = v200.sl77w
        };
        local l_tickcount_2 = globals.tickcount;
        local v205 = v200.sltick:get();
        local v206 = v201.yaw_l:get();
        if l_tickcount_2 % v205 == 0 then
            if v198 >= 7 then
                v198 = 0;
            end;
            v198 = v198 + 1;
        end;
        local v207 = v201["random" .. v198]:get();
        local v208 = v201["randswt" .. v198]:get();
        local v209 = v203[v198]:get();
        local v210 = v202[v198];
        local v211 = v206 + v209 + math.random(-v210, v210);
        v106.yaw_value:override(v211);
        if v207 then
            v106.fkoptnl:override(v201["fkoptrand" .. v198]:get());
            v106.fkl:override(v201["fklsl" .. v198]:get());
            v106.fkr:override(v201["fkrsl" .. v198]:get());
            v106.invert:override(v201["invertsl" .. v198]:get());
        end;
        if v208 then
            local v212 = v201["fklsl" .. v198]:get() + math.random(-v201["randfklsl" .. v198]:get(), v201["randfklsl" .. v198]:get());
            local v213 = v201["fkrsl" .. v198]:get() + math.random(-v201["randfkrsl" .. v198]:get(), v201["randfkrsl" .. v198]:get());
            v106.fkl:override(v212);
            v106.fkr:override(v213);
        end;
        return;
    end;
end;
local v214 = {
    impcfg1 = "\208\164\208\176\208\183\209\139 \209\131\209\129\208\191\208\181\209\136\208\189\208\190 \208\183\208\176\208\179\209\128\209\131\208\182\208\181\208\189\209\139.", 
    savephs = "\208\148\208\176\208\189\208\189\209\139\208\181 \209\132\208\176\208\183\209\139 \209\129\208\190\209\133\209\128\208\176\208\189\208\181\208\189\209\139: ", 
    errimpcfg5 = "\208\158\209\136\208\184\208\177\208\186\208\176 \208\191\209\128\208\184 \208\183\208\176\208\179\209\128\209\131\208\183\208\186\208\181 \209\132\208\176\208\183: ", 
    errsavecfg3 = "\208\148\208\176\208\189\208\189\209\139\208\181 \209\132\208\176\208\183 \208\191\209\131\209\129\209\130\209\139 \208\184\208\187\208\184 \208\189\208\181\208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\209\139.", 
    errimpcfg4 = "\208\148\208\176\208\189\208\189\209\139\208\181 \208\186\208\190\208\189\209\132\208\184\208\179\209\131\209\128\208\176\209\134\208\184\208\184 \208\190\209\130\209\129\209\131\209\130\209\129\209\130\208\178\209\131\209\142\209\130 \208\184\208\187\208\184 \208\189\208\181\208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\209\139.", 
    errsavecfg2 = "\208\148\208\176\208\189\208\189\209\139\208\181 \208\186\208\190\208\189\209\132\208\184\208\179\208\176 \208\191\209\131\209\129\209\130\209\139 \208\184\208\187\208\184 \208\189\208\181\208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\209\139.", 
    errimpcfg3 = "\208\157\208\181\208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\209\139\208\181 \208\180\208\176\208\189\208\189\209\139\208\181 \208\180\208\187\209\143 \208\184\208\188\208\191\208\190\209\128\209\130\208\176.", 
    errsavecfg1 = "\208\157\208\181\208\190\208\177\209\133\208\190\208\180\208\184\208\188\208\190 \208\178\209\139\208\177\209\128\208\176\209\130\209\140 \208\186\208\190\208\189\209\132\208\184\208\179 \208\180\208\187\209\143 \209\129\208\190\209\133\209\128\208\176\208\189\208\181\208\189\208\184\209\143.", 
    errimpcfg2 = "\208\145\209\131\209\132\208\181\209\128 \208\190\208\177\208\188\208\181\208\189\208\176 \208\191\209\131\209\129\209\130.", 
    cfgsave2 = "\208\154\208\190\208\189\209\132\208\184\208\179 \208\184 \209\132\208\176\208\183\209\139 \209\129\208\190\209\133\209\128\208\176\208\189\208\181\208\189\209\139 \209\131\209\129\208\191\208\181\209\136\208\189\208\190.", 
    errimpcfg1 = "\208\157\208\181\208\190\208\177\209\133\208\190\208\180\208\184\208\188\208\190 \208\178\209\139\208\177\209\128\208\176\209\130\209\140 \208\186\208\190\208\189\209\132\208\184\208\179 \208\180\208\187\209\143 \208\184\208\188\208\191\208\190\209\128\209\130\208\176.", 
    cfgsave1 = "\208\161\208\190\209\133\209\128\208\176\208\189\209\143\208\181\208\188 \208\154\208\190\208\189\209\132\208\184\208\179:", 
    errimpcfg6 = "\208\164\208\176\208\183\209\139 \208\190\209\130\209\129\209\131\209\130\209\129\209\130\208\178\209\131\209\142\209\130 \208\178 \208\183\208\176\208\179\209\128\209\131\208\182\208\176\208\181\208\188\209\139\209\133 \208\180\208\176\208\189\208\189\209\139\209\133.", 
    errexpphs = "\208\157\208\181\208\178\208\190\208\183\208\188\208\190\208\182\208\189\208\190 \209\141\208\186\209\129\208\191\208\190\209\128\209\130\208\184\209\128\208\190\208\178\208\176\209\130\209\140 \208\191\209\131\209\129\209\130\209\131\209\142 \208\164\208\176\208\183\209\131.", 
    expphs = "\208\164\208\176\208\183\208\176 \209\141\208\186\209\129\208\191\208\190\209\128\209\130\208\184\209\128\208\190\208\178\208\176\208\189 \208\178 \208\177\209\131\209\132\208\181\209\128 \208\190\208\177\208\188\208\181\208\189\208\176.", 
    impphs = "\208\164\208\176\208\183\208\176 \208\184\208\188\208\191\208\190\209\128\209\130\208\184\209\128\208\190\208\178\208\176\208\189\208\176 \208\178: ", 
    impcfg2 = "\208\154\208\190\208\189\209\132\208\184\208\179 \209\131\209\129\208\191\208\181\209\136\208\189\208\190 \208\184\208\188\208\191\208\190\209\128\209\130\208\184\209\128\208\190\208\178\208\176\208\189.", 
    errimpphs3 = "\208\148\208\176\208\189\208\189\209\139\208\181 \208\184\208\188\208\191\208\190\209\128\209\130\208\176 \208\189\208\181\208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\209\139.", 
    errexpcfg1 = "\208\157\208\181\208\190\208\177\209\133\208\190\208\180\208\184\208\188\208\190 \208\178\209\139\208\177\209\128\208\176\209\130\209\140 \208\186\208\190\208\189\209\132\208\184\208\179 \208\180\208\187\209\143 \209\141\208\186\209\129\208\191\208\190\209\128\209\130\208\176.", 
    errimpphs2 = "\208\145\209\131\209\132\208\181\209\128 \208\190\208\177\208\188\208\181\208\189\208\176 \208\191\209\131\209\129\209\130.", 
    errexpcfg2 = "\208\158\209\136\208\184\208\177\208\186\208\176 \208\191\209\128\208\184 \208\186\208\190\208\191\208\184\209\128\208\190\208\178\208\176\208\189\208\184\208\184 \208\180\208\176\208\189\208\189\209\139\209\133 \208\178 \208\177\209\131\209\132\208\181\209\128 \208\190\208\177\208\188\208\181\208\189\208\176: ", 
    errimpphs1 = "\208\157\208\181\208\190\208\177\209\133\208\190\208\180\208\184\208\188\208\190 \208\178\209\139\208\177\209\128\208\176\209\130\209\140 \209\132\208\176\208\183\209\131 \208\180\208\187\209\143 \208\184\208\188\208\191\208\190\209\128\209\130\208\176.", 
    loadphs = "\208\151\208\176\208\179\209\128\209\131\208\182\208\176\208\181\209\130\209\129\209\143 \209\132\208\176\208\183\208\176:", 
    errloadphs3 = "\208\158\209\136\208\184\208\177\208\186\208\176 \208\191\209\128\208\184 \208\183\208\176\208\179\209\128\209\131\208\183\208\186\208\181 \208\164\208\176\208\183\209\139 ", 
    expcfg = "\208\154\208\190\208\189\209\132\208\184\208\179 \208\184 \209\132\208\176\208\183\209\139 \209\131\209\129\208\191\208\181\209\136\208\189\208\190 \209\141\208\186\209\129\208\191\208\190\209\128\209\130\208\184\209\128\208\190\208\178\208\176\208\189\209\139 \208\178 \208\177\209\131\209\132\208\181\209\128 \208\190\208\177\208\188\208\181\208\189\208\176.", 
    errloadphs2 = "\208\148\208\176\208\189\208\189\209\139\208\181 \209\132\208\176\208\183\209\139 \208\189\208\181\208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\209\139.", 
    errloadphs1 = "\208\164\208\176\208\183\208\176 \208\191\209\131\209\129\209\130\208\176 \208\184\208\187\208\184 \208\189\208\181 \208\184\208\188\208\181\208\181\209\130 \208\180\208\176\208\189\208\189\209\139\209\133: ", 
    errloadcfg6 = "\208\164\208\176\208\183\209\139 \208\190\209\130\209\129\209\131\209\130\209\129\209\130\208\178\209\131\209\142\209\130 \208\178 \208\183\208\176\208\179\209\128\209\131\208\182\208\176\208\181\208\188\209\139\209\133 \208\180\208\176\208\189\208\189\209\139\209\133.", 
    errloadcfg5 = "\208\158\209\136\208\184\208\177\208\186\208\176 \208\191\209\128\208\184 \208\183\208\176\208\179\209\128\209\131\208\183\208\186\208\181 \209\132\208\176\208\183: ", 
    errloadcfg4 = "\208\148\208\176\208\189\208\189\209\139\208\181 \208\186\208\190\208\189\209\132\208\184\208\179\208\176 \208\190\209\130\209\129\209\131\209\130\209\129\209\130\208\178\209\131\209\142\209\130.", 
    errloadcfg3 = "\208\148\208\176\208\189\208\189\209\139\208\181 \208\186\208\190\208\189\209\132\208\184\208\179\208\176 \208\189\208\181\208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\209\139.", 
    errloadcfg2 = "\208\154\208\190\208\189\209\132\208\184\208\179 \208\191\209\131\209\129\209\130 \208\184\208\187\208\184 \208\189\208\181 \209\129\208\190\208\180\208\181\209\128\208\182\208\184\209\130 \208\180\208\176\208\189\208\189\209\139\209\133.", 
    errloadcfg1 = "\208\157\208\181\208\190\208\177\209\133\208\190\208\180\208\184\208\188\208\190 \208\178\209\139\208\177\209\128\208\176\209\130\209\140 \208\186\208\190\208\189\209\132\208\184\208\179 \208\180\208\187\209\143 \208\183\208\176\208\179\209\128\209\131\208\183\208\186\208\184.", 
    loadcfg2 = "\208\164\208\176\208\183\209\139 \209\131\209\129\208\191\208\181\209\136\208\189\208\190 \208\183\208\176\208\179\209\128\209\131\208\182\208\181\208\189\209\139.", 
    loadcfg1 = "\208\151\208\176\208\179\209\128\209\131\208\182\208\176\208\181\208\188 \208\186\208\190\208\189\209\132\208\184\208\179: ", 
    errremphs = "\208\157\208\181\208\190\208\177\209\133\208\190\208\180\208\184\208\188\208\190 \208\178\209\139\208\177\209\128\208\176\209\130\209\140 \209\132\208\176\208\183\209\131 \208\180\208\187\209\143 \209\131\208\180\208\176\208\187\208\181\208\189\208\184\209\143.", 
    remphs = "\208\163\208\180\208\176\208\187\209\143\208\181\208\188 \209\132\208\176\208\183\209\131: ", 
    remcfg = "[Config System] \208\163\208\180\208\176\208\187\209\143\208\181\208\188 \208\186\208\190\208\189\209\132\208\184\208\179:", 
    errcrtphs = "\208\161\208\187\208\184\209\136\208\186\208\190\208\188 \208\188\208\189\208\190\208\179\208\190 \208\164\208\176\208\183.", 
    crtphs = "[Phase System] \208\161\208\190\208\183\208\180\208\176\208\181\208\188 \208\189\208\190\208\178\209\131\209\142 \208\164\208\176\208\183\209\131:", 
    errcrtcfg3 = "\208\161\208\187\208\184\209\136\208\186\208\190\208\188 \208\188\208\189\208\190\208\179\208\190 \208\186\208\190\208\189\209\132\208\184\208\179\208\190\208\178.", 
    errcrtcfg2 = "\208\154\208\190\208\189\209\132\208\184\208\179 \209\129 \209\130\208\176\208\186\208\184\208\188 \208\184\208\188\208\181\208\189\208\181\208\188 \209\131\208\182\208\181 \209\129\209\131\209\137\208\181\209\129\209\130\208\178\209\131\208\181\209\130.", 
    errcrtcfg1 = "\208\152\208\188\209\143 \208\186\208\190\208\189\209\132\208\184\208\179\208\176 \208\189\208\181\208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\208\190.", 
    crtcfg = "[Config System] \208\161\208\190\208\183\208\180\208\176\208\181\208\188 \208\189\208\190\208\178\209\139\208\185 \208\186\208\190\208\189\209\132\208\184\208\179:", 
    errphs = "\208\148\208\176\208\189\208\189\209\139\208\181 \208\180\208\187\209\143 \209\129\208\190\209\133\209\128\208\176\208\189\208\181\208\189\208\184\209\143 \208\191\209\131\209\129\209\130\209\139 \208\184\208\187\208\184 \208\189\208\181\208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\209\139."
};
v44.langlst:set_callback(function()
    -- upvalues: v44 (ref), v214 (ref), v7 (ref), v45 (ref)
    if v44.langlst:get() == 1 then
        v214.cfgsave1 = "\208\161\208\190\209\133\209\128\208\176\208\189\209\143\208\181\208\188 \208\154\208\190\208\189\209\132\208\184\208\179:";
        v214.cfgsave2 = "\208\154\208\190\208\189\209\132\208\184\208\179 \208\184 \209\132\208\176\208\183\209\139 \209\129\208\190\209\133\209\128\208\176\208\189\208\181\208\189\209\139 \209\131\209\129\208\191\208\181\209\136\208\189\208\190.";
        v214.errsavecfg1 = "\208\157\208\181\208\190\208\177\209\133\208\190\208\180\208\184\208\188\208\190 \208\178\209\139\208\177\209\128\208\176\209\130\209\140 \208\186\208\190\208\189\209\132\208\184\208\179 \208\180\208\187\209\143 \209\129\208\190\209\133\209\128\208\176\208\189\208\181\208\189\208\184\209\143.";
        v214.errsavecfg2 = "\208\148\208\176\208\189\208\189\209\139\208\181 \208\186\208\190\208\189\209\132\208\184\208\179\208\176 \208\191\209\131\209\129\209\130\209\139 \208\184\208\187\208\184 \208\189\208\181\208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\209\139.";
        v214.errsavecfg3 = "\208\148\208\176\208\189\208\189\209\139\208\181 \209\132\208\176\208\183 \208\191\209\131\209\129\209\130\209\139 \208\184\208\187\208\184 \208\189\208\181\208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\209\139.";
        v214.savephs = "\208\148\208\176\208\189\208\189\209\139\208\181 \209\132\208\176\208\183\209\139 \209\129\208\190\209\133\209\128\208\176\208\189\208\181\208\189\209\139: ";
        v214.errphs = "\208\148\208\176\208\189\208\189\209\139\208\181 \208\180\208\187\209\143 \209\129\208\190\209\133\209\128\208\176\208\189\208\181\208\189\208\184\209\143 \208\191\209\131\209\129\209\130\209\139 \208\184\208\187\208\184 \208\189\208\181\208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\209\139.";
        v214.crtcfg = "[Config System] \208\161\208\190\208\183\208\180\208\176\208\181\208\188 \208\189\208\190\208\178\209\139\208\185 \208\186\208\190\208\189\209\132\208\184\208\179:";
        v214.errcrtcfg1 = "\208\152\208\188\209\143 \208\186\208\190\208\189\209\132\208\184\208\179\208\176 \208\189\208\181\208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\208\190.";
        v214.errcrtcfg2 = "\208\154\208\190\208\189\209\132\208\184\208\179 \209\129 \209\130\208\176\208\186\208\184\208\188 \208\184\208\188\208\181\208\189\208\181\208\188 \209\131\208\182\208\181 \209\129\209\131\209\137\208\181\209\129\209\130\208\178\209\131\208\181\209\130.";
        v214.errcrtcfg3 = "\208\161\208\187\208\184\209\136\208\186\208\190\208\188 \208\188\208\189\208\190\208\179\208\190 \208\186\208\190\208\189\209\132\208\184\208\179\208\190\208\178.";
        v214.crtphs = "[Phase System] \208\161\208\190\208\183\208\180\208\176\208\181\208\188 \208\189\208\190\208\178\209\131\209\142 \208\164\208\176\208\183\209\131:";
        v214.errcrtphs = "\208\161\208\187\208\184\209\136\208\186\208\190\208\188 \208\188\208\189\208\190\208\179\208\190 \208\164\208\176\208\183.";
        v214.remcfg = "[Config System] \208\163\208\180\208\176\208\187\209\143\208\181\208\188 \208\186\208\190\208\189\209\132\208\184\208\179:";
        v214.remphs = "\208\163\208\180\208\176\208\187\209\143\208\181\208\188 \209\132\208\176\208\183\209\131: ";
        v214.errremphs = "\208\157\208\181\208\190\208\177\209\133\208\190\208\180\208\184\208\188\208\190 \208\178\209\139\208\177\209\128\208\176\209\130\209\140 \209\132\208\176\208\183\209\131 \208\180\208\187\209\143 \209\131\208\180\208\176\208\187\208\181\208\189\208\184\209\143.";
        v214.loadcfg1 = "\208\151\208\176\208\179\209\128\209\131\208\182\208\176\208\181\208\188 \208\186\208\190\208\189\209\132\208\184\208\179: ";
        v214.loadcfg2 = "\208\164\208\176\208\183\209\139 \209\131\209\129\208\191\208\181\209\136\208\189\208\190 \208\183\208\176\208\179\209\128\209\131\208\182\208\181\208\189\209\139.";
        v214.errloadcfg1 = "\208\157\208\181\208\190\208\177\209\133\208\190\208\180\208\184\208\188\208\190 \208\178\209\139\208\177\209\128\208\176\209\130\209\140 \208\186\208\190\208\189\209\132\208\184\208\179 \208\180\208\187\209\143 \208\183\208\176\208\179\209\128\209\131\208\183\208\186\208\184.";
        v214.errloadcfg2 = "\208\154\208\190\208\189\209\132\208\184\208\179 \208\191\209\131\209\129\209\130 \208\184\208\187\208\184 \208\189\208\181 \209\129\208\190\208\180\208\181\209\128\208\182\208\184\209\130 \208\180\208\176\208\189\208\189\209\139\209\133.";
        v214.errloadcfg3 = "\208\148\208\176\208\189\208\189\209\139\208\181 \208\186\208\190\208\189\209\132\208\184\208\179\208\176 \208\189\208\181\208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\209\139.";
        v214.errloadcfg4 = "\208\148\208\176\208\189\208\189\209\139\208\181 \208\186\208\190\208\189\209\132\208\184\208\179\208\176 \208\190\209\130\209\129\209\131\209\130\209\129\209\130\208\178\209\131\209\142\209\130.";
        v214.errloadcfg5 = "\208\158\209\136\208\184\208\177\208\186\208\176 \208\191\209\128\208\184 \208\183\208\176\208\179\209\128\209\131\208\183\208\186\208\181 \209\132\208\176\208\183: ";
        v214.errloadcfg6 = "\208\164\208\176\208\183\209\139 \208\190\209\130\209\129\209\131\209\130\209\129\209\130\208\178\209\131\209\142\209\130 \208\178 \208\183\208\176\208\179\209\128\209\131\208\182\208\176\208\181\208\188\209\139\209\133 \208\180\208\176\208\189\208\189\209\139\209\133.";
        v214.errloadphs1 = "\208\164\208\176\208\183\208\176 \208\191\209\131\209\129\209\130\208\176 \208\184\208\187\208\184 \208\189\208\181 \208\184\208\188\208\181\208\181\209\130 \208\180\208\176\208\189\208\189\209\139\209\133: ";
        v214.errloadphs2 = "\208\148\208\176\208\189\208\189\209\139\208\181 \209\132\208\176\208\183\209\139 \208\189\208\181\208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\209\139.";
        v214.errloadphs3 = "\208\158\209\136\208\184\208\177\208\186\208\176 \208\191\209\128\208\184 \208\183\208\176\208\179\209\128\209\131\208\183\208\186\208\181 \208\164\208\176\208\183\209\139 ";
        v214.errimpphs1 = "\208\157\208\181\208\190\208\177\209\133\208\190\208\180\208\184\208\188\208\190 \208\178\209\139\208\177\209\128\208\176\209\130\209\140 \209\132\208\176\208\183\209\131 \208\180\208\187\209\143 \208\184\208\188\208\191\208\190\209\128\209\130\208\176.";
        v214.errimpphs2 = "\208\145\209\131\209\132\208\181\209\128 \208\190\208\177\208\188\208\181\208\189\208\176 \208\191\209\131\209\129\209\130.";
        v214.errimpphs3 = "\208\148\208\176\208\189\208\189\209\139\208\181 \208\184\208\188\208\191\208\190\209\128\209\130\208\176 \208\189\208\181\208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\209\139.";
        v214.impphs = "\208\164\208\176\208\183\208\176 \208\184\208\188\208\191\208\190\209\128\209\130\208\184\209\128\208\190\208\178\208\176\208\189\208\176 \208\178: ";
        v214.errexpphs = "\208\157\208\181\208\178\208\190\208\183\208\188\208\190\208\182\208\189\208\190 \209\141\208\186\209\129\208\191\208\190\209\128\209\130\208\184\209\128\208\190\208\178\208\176\209\130\209\140 \208\191\209\131\209\129\209\130\209\131\209\142 \208\164\208\176\208\183\209\131.";
        v214.expphs = "\208\164\208\176\208\183\208\176 \209\141\208\186\209\129\208\191\208\190\209\128\209\130\208\184\209\128\208\190\208\178\208\176\208\189 \208\178 \208\177\209\131\209\132\208\181\209\128 \208\190\208\177\208\188\208\181\208\189\208\176.";
        v214.errimpcfg1 = "\208\157\208\181\208\190\208\177\209\133\208\190\208\180\208\184\208\188\208\190 \208\178\209\139\208\177\209\128\208\176\209\130\209\140 \208\186\208\190\208\189\209\132\208\184\208\179 \208\180\208\187\209\143 \208\184\208\188\208\191\208\190\209\128\209\130\208\176.";
        v214.errimpcfg2 = "\208\145\209\131\209\132\208\181\209\128 \208\190\208\177\208\188\208\181\208\189\208\176 \208\191\209\131\209\129\209\130.";
        v214.errimpcfg3 = "\208\157\208\181\208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\209\139\208\181 \208\180\208\176\208\189\208\189\209\139\208\181 \208\180\208\187\209\143 \208\184\208\188\208\191\208\190\209\128\209\130\208\176.";
        v214.errimpcfg4 = "\208\148\208\176\208\189\208\189\209\139\208\181 \208\186\208\190\208\189\209\132\208\184\208\179\209\131\209\128\208\176\209\134\208\184\208\184 \208\190\209\130\209\129\209\131\209\130\209\129\209\130\208\178\209\131\209\142\209\130 \208\184\208\187\208\184 \208\189\208\181\208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\209\139.";
        v214.errimpcfg5 = "\208\158\209\136\208\184\208\177\208\186\208\176 \208\191\209\128\208\184 \208\183\208\176\208\179\209\128\209\131\208\183\208\186\208\181 \209\132\208\176\208\183: ";
        v214.errimpcfg6 = "\208\164\208\176\208\183\209\139 \208\190\209\130\209\129\209\131\209\130\209\129\209\130\208\178\209\131\209\142\209\130 \208\178 \208\183\208\176\208\179\209\128\209\131\208\182\208\176\208\181\208\188\209\139\209\133 \208\180\208\176\208\189\208\189\209\139\209\133.";
        v214.impcfg1 = "\208\164\208\176\208\183\209\139 \209\131\209\129\208\191\208\181\209\136\208\189\208\190 \208\183\208\176\208\179\209\128\209\131\208\182\208\181\208\189\209\139.";
        v214.impcfg2 = "\208\154\208\190\208\189\209\132\208\184\208\179 \209\131\209\129\208\191\208\181\209\136\208\189\208\190 \208\184\208\188\208\191\208\190\209\128\209\130\208\184\209\128\208\190\208\178\208\176\208\189.";
        v214.errexpcfg1 = "\208\157\208\181\208\190\208\177\209\133\208\190\208\180\208\184\208\188\208\190 \208\178\209\139\208\177\209\128\208\176\209\130\209\140 \208\186\208\190\208\189\209\132\208\184\208\179 \208\180\208\187\209\143 \209\141\208\186\209\129\208\191\208\190\209\128\209\130\208\176.";
        v214.errexpcfg2 = "\208\158\209\136\208\184\208\177\208\186\208\176 \208\191\209\128\208\184 \208\186\208\190\208\191\208\184\209\128\208\190\208\178\208\176\208\189\208\184\208\184 \208\180\208\176\208\189\208\189\209\139\209\133 \208\178 \208\177\209\131\209\132\208\181\209\128 \208\190\208\177\208\188\208\181\208\189\208\176: ";
        v214.loadphs = "\208\151\208\176\208\179\209\128\209\131\208\182\208\176\208\181\209\130\209\129\209\143 \209\132\208\176\208\183\208\176:";
        v214.expcfg = "\208\154\208\190\208\189\209\132\208\184\208\179 \208\184 \209\132\208\176\208\183\209\139 \209\131\209\129\208\191\208\181\209\136\208\189\208\190 \209\141\208\186\209\129\208\191\208\190\209\128\209\130\208\184\209\128\208\190\208\178\208\176\208\189\209\139 \208\178 \208\177\209\131\209\132\208\181\209\128 \208\190\208\177\208\188\208\181\208\189\208\176.";
        v44.nfd:tooltip(v7("circle-exclamation") .. "\208\146\209\139 \208\189\208\181 \208\177\209\131\208\180\208\181\209\130\208\181 \208\191\208\190\208\187\209\131\209\135\208\176\209\130\209\140 \209\131\209\128\208\190\208\189 \208\190\209\130 \208\191\208\176\208\180\208\181\208\189\208\184\209\143.");
        v44.clantag:tooltip(v7("circle-exclamation") .. "\208\146\209\139 \208\188\208\190\208\182\208\181\209\130\208\181 \209\131\209\129\209\130\208\176\208\189\208\190\208\178\208\184\209\130\209\140 \209\129\208\178\208\190\208\185 \209\129\208\190\208\177\209\129\209\130\208\178\208\181\208\189\208\189\209\139\208\185 \208\186\208\187\208\176\208\189\209\130\208\181\208\179. \208\159\209\128\208\184\208\188\208\181\209\135\208\176\208\189\208\184\208\181: \208\190\208\177\208\189\208\190\208\178\208\187\208\181\208\189\208\184\208\181 \208\186\208\187\208\176\208\189\209\130\208\181\208\179\208\176 \208\191\209\128\208\190\208\184\209\129\209\133\208\190\208\180\208\184\209\130 \209\130\208\190\208\187\209\140\208\186\208\190 \208\191\209\128\208\184 \208\178\209\139\209\129\209\130\209\128\208\181\208\187\208\181 \208\184\208\183 \208\176\208\184\208\188\208\177\208\190\209\130\208\176, \209\130\208\176\208\186 \208\186\208\176\208\186 \208\178 \208\191\209\128\208\190\209\130\208\184\208\178\208\189\208\190\208\188 \209\129\208\187\209\131\209\135\208\176\208\181 \209\141\209\130\208\190 \209\129\208\189\208\184\208\182\208\176\208\181\209\130 FPS \208\184 \208\188\208\190\208\182\208\181\209\130 \209\130\208\181\208\187\208\181\208\191\208\190\209\128\209\130\208\184\209\128\208\190\208\178\208\176\209\130\209\140 \208\178\208\176\209\129.");
        v45.fast_ladder:tooltip(v7("circle-exclamation") .. "\208\161 \209\141\209\130\208\190\208\185 \209\132\209\131\208\189\208\186\209\134\208\184\208\181\208\185 \208\178\209\139 \208\177\209\131\208\180\208\181\209\130\208\181 \208\183\208\176\208\177\208\184\209\128\208\176\209\130\209\140\209\129\209\143 \208\191\208\190 \208\187\208\181\209\129\209\130\208\189\208\184\209\134\208\181 \208\177\209\139\209\129\209\130\209\128\208\181\208\181.");
        v44.grenthrow:tooltip(v7("circle-exclamation") .. "\208\161 \209\141\209\130\208\190\208\185 \209\132\209\131\208\189\208\186\209\134\208\184\208\181\208\185 \208\178\209\139 \208\188\208\190\208\182\208\181\209\130\208\181 \208\177\209\128\208\190\209\129\208\176\209\130\209\140 \208\179\209\128\208\176\208\189\208\176\209\130\209\139 \208\177\208\181\208\183 \208\177\208\176\208\179\208\190\208\178 \208\184 \208\184\208\189\208\181\209\128\209\134\208\184\208\184.");
        v45.r8pred:tooltip(v7("circle-exclamation") .. "\208\173\209\130\208\176 \209\132\209\131\208\189\208\186\209\134\208\184\209\143 \208\191\208\190\208\183\208\178\208\190\208\187\208\184\209\130 \208\178\208\176\208\188 \208\187\209\131\209\135\209\136\208\181 \208\191\209\128\208\181\208\180\209\129\208\186\208\176\208\183\209\139\208\178\208\176\209\130\209\140. \208\163\208\177\208\181\208\180\208\184\209\130\208\181\209\129\209\140, \209\135\209\130\208\190 \208\178\209\139 \208\180\208\181\209\128\208\182\208\184\209\130\208\181 R8 \208\178 \209\128\209\131\208\186\208\176\209\133 \208\184 \208\189\208\176\209\133\208\190\208\180\208\184\209\130\208\181\209\129\209\140 \208\178 \208\191\208\190\208\187\208\190\208\182\208\181\208\189\208\184\208\184 \208\191\209\128\208\184\209\129\208\181\208\180\208\176.");
        configs.importphs:tooltip("\208\152\208\188\208\191\208\190\209\128\209\130\208\184\209\128\208\190\208\178\208\176\209\130\209\140 \208\189\208\176\209\129\209\130\209\128\208\190\208\185\208\186\208\184 \208\184\208\183 \208\177\209\131\209\132\208\181\209\128\208\176 \208\190\208\177\208\188\208\181\208\189\208\176 \208\178 \208\178\209\139\208\177\209\128\208\176\208\189\208\189\209\131\209\142 \209\132\208\176\208\183\209\131.");
        configs.exportphs:tooltip("\208\173\208\186\209\129\208\191\208\190\209\128\209\130\208\184\209\128\208\190\208\178\208\176\209\130\209\140 \208\189\208\176\209\129\209\130\209\128\208\190\208\185\208\186\208\184 \209\130\208\181\208\186\209\131\209\137\208\181\208\185 \209\132\208\176\208\183\209\139 \208\178 \208\177\209\131\209\132\208\181\209\128 \208\190\208\177\208\188\208\181\208\189\208\176.");
    elseif v44.langlst:get() == 2 then
        v214.cfgsave1 = "Saving Config:";
        v214.cfgsave2 = "Config and Phases saved successfully.";
        v214.errsavecfg1 = "You need to select a config to save.";
        v214.errsavecfg2 = "The config data is empty or invalid.";
        v214.errsavecfg3 = "The phase data is empty or invalid.";
        v214.savephs = "Phase data saved: ";
        v214.errphs = "Data for saving is empty or invalid.";
        v214.crtcfg = "[Config System] Creating a new config:";
        v214.errcrtcfg1 = "The config name is invalid.";
        v214.errcrtcfg2 = "A config with this name already exists.";
        v214.errcrtcfg3 = "Too many configs.";
        v214.crtphs = "[Phase System] Creating a new phase:";
        v214.errcrtphs = "Too many phases.";
        v214.remcfg = "[Config System] Deleting config:";
        v214.remphs = "Deleting phase: ";
        v214.errremphs = "You need to select a phase to delete.";
        v214.loadcfg1 = "Loading config: ";
        v214.loadcfg2 = "Phases successfully loaded.";
        v214.errloadcfg1 = "You need to select a config to load.";
        v214.errloadcfg2 = "The config is empty or contains no data.";
        v214.errloadcfg3 = "The config data is invalid.";
        v214.errloadcfg4 = "The config data is missing.";
        v214.errloadcfg5 = "Error loading phases: ";
        v214.errloadcfg6 = "Phases are missing in the loaded data.";
        v214.errloadphs1 = "The phase is empty or has no data: ";
        v214.errloadphs2 = "The phase data is invalid.";
        v214.errloadphs3 = "Error loading phase ";
        v214.errimpphs1 = "You need to select a phase to import.";
        v214.errimpphs2 = "The clipboard is empty.";
        v214.errimpphs3 = "The import data is invalid.";
        v214.impphs = "Phase imported into: ";
        v214.errexpphs = "Cannot export an empty phase.";
        v214.expphs = "Phase exported to clipboard.";
        v214.errimpcfg1 = "You need to select a config to import.";
        v214.errimpcfg2 = "The clipboard is empty.";
        v214.errimpcfg3 = "The import data is invalid.";
        v214.errimpcfg4 = "The configuration data is missing or invalid.";
        v214.errimpcfg5 = "Error loading phases: ";
        v214.errimpcfg6 = "Phases are missing in the loaded data.";
        v214.impcfg1 = "Phases successfully loaded.";
        v214.impcfg2 = "Config successfully imported.";
        v214.errexpcfg1 = "You need to select a config to export.";
        v214.errexpcfg2 = "Error copying data to clipboard: ";
        v214.loadphs = "Loading Phase:";
        v214.expcfg = "Config and phases successfully exported to clipboard.";
        v44.nfd:tooltip(v7("circle-exclamation") .. "You will not take damage from a fall.");
        v44.clantag:tooltip(v7("circle-exclamation") .. "You can set your own Clantag. Note: the clan tag update only happens when the aimbot is fired, because otherwise it reduces fps and can teleport you.");
        v45.fast_ladder:tooltip(v7("circle-exclamation") .. "With this feature you will be climbing faster.");
        v44.grenthrow:tooltip(v7("circle-exclamation") .. "With this feature you can throw ur nades w.o. bugs and inertia");
        v45.r8pred:tooltip(v7("circle-exclamation") .. "This Feature will allow you to better predict, Be sure you holding R8 in hands and on duck.");
        configs.importphs:tooltip("Import settings from the clipboard to selected phase");
        configs.exportphs:tooltip("Export setts from selected phase to clipboard");
    end;
end);
local v215 = l_pui_0.setup({
    [1] = v44, 
    [2] = v45, 
    [3] = v46, 
    [4] = v84, 
    [5] = v83
}, true);
local v216 = {};
configs_db = db.configs_debug or {};
configs_db.cfg_list = configs_db.cfg_list or {};
configs_db.menu_list = configs_db.menu_list or {};
local v217 = {
    triggersphs = v43.aamain_settings3:selectable("Trigger:", {
        [1] = "None", 
        [2] = "Round Start", 
        [3] = "Miss At you", 
        [4] = "You Get Hit"
    })
};
local v218 = l_pui_0.setup({
    [1] = v84, 
    [2] = v83, 
    [3] = v217
}, true);
local v219 = {};
local v220 = db.phase_debug or {};
v220.phaselist = v220.phaselist or {};
v220.menulist = v220.menulist or {};
local function v223(v221, v222)
    common.add_notify(v221, v222);
end;
v216.save_config = function(v224)
    -- upvalues: v223 (ref), v214 (ref), v215 (ref), v218 (ref), v220 (ref), l_base64_0 (ref)
    if not v224 or not configs_db.cfg_list[v224] then
        v223("[Config System]", v214.errsavecfg1);
        return;
    else
        v223(v214.cfgsave1, configs_db.cfg_list[v224][1]);
        local v225 = v215:save();
        if not v225 or type(v225) ~= "table" then
            v223("[Config System]", v214.errsavecfg2);
            return;
        else
            local v226 = v218:save();
            if not v226 or type(v226) ~= "table" then
                v223("[Phase System]", v214.errsavecfg3);
                return;
            else
                local v227 = {
                    config = v225, 
                    phases = v226, 
                    phase_list = v220.phaselist
                };
                configs_db.cfg_list[v224][2] = l_base64_0.encode(json.stringify(v227));
                db.configs_debug = configs_db;
                v223("[Config System]", v214.cfgsave2);
                return;
            end;
        end;
    end;
end;
v219.savephase1 = function(v228)
    -- upvalues: v218 (ref), v223 (ref), v214 (ref), v217 (ref), v220 (ref), l_base64_0 (ref)
    local v229 = v218:save();
    if not v229 or type(v229) ~= "table" then
        v223("\208\158\209\136\208\184\208\177\208\186\208\176", v214.errphs);
        return;
    else
        local v230 = v217.triggersphs:get();
        if type(v230) ~= "table" or not v230[1] then
            local _ = v230;
        end;
        v220.phaselist[v228][2] = l_base64_0.encode(json.stringify(v229));
        v220.phaselist[v228][3] = v230;
        v223("[Phase System]", v214.savephs .. v220.phaselist[v228][1]);
        db.phase_debug = v220;
        return;
    end;
end;
v216.update_values = function(v232)
    local v233 = configs_db.cfg_list[v232][1] .. " - Active";
    for v234, v235 in ipairs(configs_db.cfg_list) do
        configs_db.menu_list[v234] = v235[1];
    end;
    configs_db.menu_list[v232] = v233;
end;
v216.create_config = function(v236)
    -- upvalues: v223 (ref), v214 (ref)
    if type(v236) ~= "string" or v236:match("^%s*$") then
        v223("[Config System]", v214.errcrtcfg1);
        return;
    else
        for _, v238 in ipairs(configs_db.menu_list) do
            if v238 == v236 then
                v223("[Config System]", v214.errcrtcfg2);
                return;
            end;
        end;
        if #configs_db.cfg_list > 6 then
            v223("[Config System]", v214.errcrtcfg3);
            return;
        else
            v223(v214.crtcfg, v236);
            table.insert(configs_db.cfg_list, {
                [1] = nil, 
                [2] = "", 
                [1] = v236
            });
            table.insert(configs_db.menu_list, v236);
            db.configs_debug = configs_db;
            return;
        end;
    end;
end;
v219.createphasa1 = function()
    -- upvalues: v220 (ref), v223 (ref), v214 (ref)
    local v239 = nil;
    local v240 = 1;
    while true do
        v239 = tostring(v240);
        local v241 = false;
        for _, v243 in ipairs(v220.menulist) do
            if v243 == v239 then
                v241 = true;
                break;
            end;
        end;
        if v241 then
            v240 = v240 + 1;
        else
            break;
        end;
    end;
    if #v220.phaselist > 4 then
        v223("[Phase System]", v214.errcrtphs);
        return;
    else
        v223(v214.crtphs, v239);
        table.insert(v220.phaselist, {
            [1] = nil, 
            [2] = "", 
            [3] = "None", 
            [1] = v239
        });
        table.insert(v220.menulist, v239);
        db.phase_debug = v220;
        return;
    end;
end;
v216.remove_config = function(v244)
    -- upvalues: v223 (ref), v214 (ref)
    v223(v214.remcfg, configs_db.cfg_list[v244][1]);
    table.remove(configs_db.cfg_list, v244);
    table.remove(configs_db.menu_list, v244);
    db.configs_debug = configs_db;
end;
v219.removephasa1 = function(v245)
    -- upvalues: v220 (ref), v223 (ref), v214 (ref)
    if not v245 or not v220.phaselist[v245] then
        v223("[Phase System]", errremphs);
        return;
    else
        v223("[Phase System]", v214.remphs .. v220.phaselist[v245][1]);
        table.remove(v220.phaselist, v245);
        table.remove(v220.menulist, v245);
        db.phase_debug = v220;
        return;
    end;
end;
v216.load_config = function(v246)
    -- upvalues: v223 (ref), v214 (ref), l_base64_0 (ref), v215 (ref), v218 (ref), v220 (ref)
    if not v246 or not configs_db.cfg_list[v246] then
        v223("[Config System]", v214.errloadcfg1);
        return;
    else
        v223("[Config System]", v214.loadcfg1 .. configs_db.cfg_list[v246][1]);
        local v247 = configs_db.cfg_list[v246][2];
        if not v247 or v247 == "" then
            v223("[Config System]", v214.errloadcfg2);
            return;
        else
            local v248 = l_base64_0.decode(v247);
            local v249 = json.parse(v248);
            if not v249 or type(v249) ~= "table" then
                v223("[Config System]", v214.errloadcfg3);
                return;
            else
                local l_config_0 = v249.config;
                local l_phases_0 = v249.phases;
                local l_phase_list_0 = v249.phase_list;
                if l_config_0 and type(l_config_0) == "table" then
                    v215:load(l_config_0);
                else
                    v223("[Config System]", v214.errloadcfg4);
                end;
                if l_phases_0 and type(l_phases_0) == "table" and l_phase_list_0 then
                    local l_status_0, l_result_0 = pcall(function()
                        -- upvalues: v218 (ref), l_phases_0 (ref)
                        v218:load(l_phases_0);
                    end);
                    if not l_status_0 then
                        v223("[Phase System]", v214.errloadcfg5 .. tostring(l_result_0));
                        return;
                    else
                        for _, v256 in ipairs(l_phase_list_0) do
                            local v257 = v256[1];
                            local v258 = false;
                            for _, v260 in ipairs(v220.phaselist) do
                                if v260[1] == v257 then
                                    v258 = true;
                                    break;
                                end;
                            end;
                            if not v258 then
                                local v261 = 0;
                                for _, v263 in ipairs(v220.phaselist) do
                                    local v264 = tonumber(v263[1]) or 0;
                                    v261 = math.max(v261, v264);
                                end;
                                local v265 = tostring(v261 + 1);
                                table.insert(v220.phaselist, {
                                    [1] = nil, 
                                    [2] = "", 
                                    [3] = "None", 
                                    [1] = v265
                                });
                                v220.menulist = {};
                                for _, v267 in ipairs(v220.phaselist) do
                                    table.insert(v220.menulist, v267[1]);
                                end;
                            end;
                        end;
                        db.phase_debug = v220;
                        for _, v269 in ipairs(l_phase_list_0) do
                            local v270 = v269[1];
                            for _, v272 in ipairs(v220.phaselist) do
                                if v272[1] == v270 then
                                    v272[2] = v269[2];
                                    v272[3] = v269[3];
                                end;
                            end;
                        end;
                        configs.phaseselect:update(v220.menulist);
                        v223("[Phase System]", v214.loadcfg2);
                    end;
                else
                    v223("[Phase System]", v214.errloadcfg6);
                end;
                return;
            end;
        end;
    end;
end;
v219.loadphasa1 = function(v273)
    -- upvalues: v220 (ref), v223 (ref), v214 (ref), l_base64_0 (ref), v218 (ref)
    local v274 = v220.phaselist[v273] and v220.phaselist[v273][2];
    if not v274 or v274 == "" then
        v223("[Phase System]", v214.errloadphs1 .. v220.phaselist[v273][1]);
        return;
    else
        local v275 = l_base64_0.decode(v274);
        local v276 = json.parse(v275);
        if not v276 or type(v276) ~= "table" then
            v223("\208\158\209\136\208\184\208\177\208\186\208\176", v214.errloadphs2);
            return;
        else
            local l_status_1, l_result_1 = pcall(function()
                -- upvalues: v218 (ref), v276 (ref)
                v218:load(v276);
            end);
            if not l_status_1 then
                v223("[Phase System]", v214.errloadphs3 .. tostring(l_result_1));
                return;
            else
                return;
            end;
        end;
    end;
end;
v216.load_default_config = function(v279)
    -- upvalues: v223 (ref), l_base64_0 (ref), v215 (ref)
    v223("[Config System]", "\208\151\208\176\208\179\209\128\209\131\208\182\208\176\208\181\208\188 \208\186\208\190\208\189\209\132\208\184\208\179:", configs_db.cfg_list[v279][1]);
    local v280 = l_base64_0.decode(raw_data);
    local v281 = json.parse(v280);
    if not v281 or type(v281) ~= "table" then
        v223("\208\158\209\136\208\184\208\177\208\186\208\176", "\208\148\208\176\208\189\208\189\209\139\208\181 \208\180\208\187\209\143 \208\183\208\176\208\179\209\128\209\131\208\183\208\186\208\184 \208\189\208\181\208\186\208\190\209\128\209\128\208\181\208\186\209\130\208\189\209\139.");
        return;
    else
        v215:load(v281);
        return;
    end;
end;
v219.importphase = function(v282)
    -- upvalues: v220 (ref), v223 (ref), v214 (ref), l_clipboard_0 (ref), l_base64_0 (ref), v218 (ref)
    if not v282 or not v220.phaselist[v282] then
        v223("[Phase System]", v214.errimpphs1);
        return;
    else
        local v283 = l_clipboard_0.get();
        if not v283 or v283 == "" then
            v223("[Phase System]", v214.errimpphs2);
            return;
        else
            local v284 = l_base64_0.decode(v283);
            local v285 = json.parse(v284);
            if not v285 or type(v285) ~= "table" then
                v223("[Phase System]", v214.errimpphs3);
                return;
            else
                v218:load(v285.data);
                v220.phaselist[v282][2] = l_base64_0.encode(json.stringify(v285));
                v220.phaselist[v282][3] = v285.trigger;
                db.phase_debug = v220;
                v223("[Phase System]", v214.impphs .. v220.phaselist[v282][1]);
                return;
            end;
        end;
    end;
end;
v219.exportphase = function()
    -- upvalues: v218 (ref), v223 (ref), v214 (ref), l_clipboard_0 (ref), l_base64_0 (ref)
    local v286 = v218:save();
    if not v286 or type(v286) ~= "table" then
        v223("[Phase System]", v214.errexpphs);
        return;
    else
        l_clipboard_0.set(l_base64_0.encode(json.stringify(v286)));
        v223("[Phase System]", v214.expphs);
        return;
    end;
end;
configs = {
    cfg_selector = v43.aamain_settings1:list("Configs", configs_db.menu_list), 
    name = v43.aamain_settings1:input("Config Name", "New Config"), 
    Defaultcfg = v43.aamain_settings1:button("Default CFG", function()
        -- upvalues: l_base64_0 (ref), v215 (ref), v223 (ref), v218 (ref), v220 (ref)
        local v287 = l_base64_0.decode("eyJwaGFzZV9saXN0IjpbWyIxIiwgIlcxdDdJbk5zTVNJNk1Dd2dJbVJsYzNsdVkxOW1jbVZsYzNSaGJtUWlPaUpQWm1ZaUxDQWljMnd5SWpvd0xDQWljMnd6SWpvd0xDQWlaR1ZtWlc1emFYWmxYMkZoSWpwMGNuVmxMQ0FpYzJ3MElqb3dMQ0FpWkdselpHVm1jeUk2Wm1Gc2MyVXNJQ0p6YkRVaU9qQXNJQ0ptYTJ4aFoyeDBJanBtWVd4elpTd2dJbk5zZEdsamF5STZOU3dnSW14algyVnVZV0pzWlNJNmRISjFaU3dnSW5Oc01UZDNJam93TENBaWMyd3lOM2NpT2pBc0lDSnpiRE0zZHlJNk1Dd2dJbk5zTkRkM0lqb3dMQ0FpYzJ3MU4zY2lPakFzSUNKemJEWTNkeUk2TUN3Z0luTnNOemQzSWpvd0xDQWllV0YzWW1GelpXUWlPaUpDWVdOcmQyRnlaQ0lzSUNKaWIyUjVYM2xoZHlJNmRISjFaU3dnSW5saGQxOXRiMlJwWm1sbGNpSTZJa05sYm5SbGNpSXNJQ0prWlhONWJtTmZiQ0k2TlRZc0lDSnNZMTlsYm1GaWJHVmZiMjRpT2xzeExDQXlMQ0FpZmlKZExDQWllV0YzSWpvaVUzZHBkR05vWldRaUxDQWlaR1Z6ZVc1algzSWlPak16TENBaVptRnJaVjl2Y0hScGIyNXpJanBiSWtGMmIybGtJRTkyWlhKc1lYQWlMQ0FpU21sMGRHVnlJaXdnSW40aVhYMHNJSHNpYzJ3eElqb3dMQ0FpWkdWemVXNWpYMlp5WldWemRHRnVaQ0k2SWs5bVppSXNJQ0p6YkRJaU9qQXNJQ0p6YkRNaU9qQXNJQ0prWldabGJuTnBkbVZmWVdFaU9tWmhiSE5sTENBaWMydzBJam93TENBaVpHbHpaR1ZtY3lJNlptRnNjMlVzSUNKemJEVWlPakFzSUNKbWEyeGhaMngwSWpwMGNuVmxMQ0FpYzJ4MGFXTnJJam8xTENBaWJHTmZaVzVoWW14bElqcDBjblZsTENBaWMyd3hOM2NpT2pFeUxDQWljMnd5TjNjaU9qZ3NJQ0p6YkRNM2R5STZOQ3dnSW5Oc05EZDNJam80TENBaWMydzFOM2NpT2pFd0xDQWljMncyTjNjaU9qZ3NJQ0p6YkRjM2R5STZNVElzSUNKNVlYZGlZWE5sWkNJNklrSmhZMnQzWVhKa0lpd2dJbUp2WkhsZmVXRjNJanAwY25WbExDQWllV0YzWDIxdlpHbG1hV1Z5SWpvaVEzVnpkRzl0SURjdFYyRjVJaXdnSW1SbGMzbHVZMTlzSWpvMk1Dd2dJbXhqWDJWdVlXSnNaVjl2YmlJNld6RXNJRElzSUNKK0lsMHNJQ0o1WVhjaU9pSkVaV1poZFd4MElpd2dJbVJsYzNsdVkxOXlJam95TlN3Z0ltWmhhMlZmYjNCMGFXOXVjeUk2V3lKS2FYUjBaWElpTENBaVVtRnVaRzl0YVhwbElFcHBkSFJsY2lJc0lDSitJbDE5TENCN0luTnNNU0k2TUN3Z0ltUmxjM2x1WTE5bWNtVmxjM1JoYm1RaU9pSlBabVlpTENBaWMyd3lJam93TENBaWMyd3pJam93TENBaVpHVm1aVzV6YVhabFgyRmhJanAwY25WbExDQWljMncwSWpvd0xDQWlaR2x6WkdWbWN5STZabUZzYzJVc0lDSnpiRFVpT2pBc0lDSm1hMnhoWjJ4MElqcDBjblZsTENBaWMyeDBhV05ySWpvMUxDQWliR05mWlc1aFlteGxJanAwY25WbExDQWljMnd4TjNjaU9qQXNJQ0p6YkRJM2R5STZNQ3dnSW5Oc016ZDNJam93TENBaWMydzBOM2NpT2pBc0lDSnpiRFUzZHlJNk1Dd2dJbk5zTmpkM0lqb3dMQ0FpYzJ3M04zY2lPakFzSUNKNVlYZGlZWE5sWkNJNklrSmhZMnQzWVhKa0lpd2dJbUp2WkhsZmVXRjNJanAwY25WbExDQWllV0YzWDIxdlpHbG1hV1Z5SWpvaVEyVnVkR1Z5SWl3Z0ltUmxjM2x1WTE5c0lqbzFOQ3dnSW14algyVnVZV0pzWlY5dmJpSTZXekVzSURJc0lDSitJbDBzSUNKNVlYY2lPaUpUZDJsMFkyaGxaQ0lzSUNKa1pYTjVibU5mY2lJNk16SXNJQ0ptWVd0bFgyOXdkR2x2Ym5NaU9sc2lTbWwwZEdWeUlpd2dJbEpoYm1SdmJXbDZaU0JLYVhSMFpYSWlMQ0FpZmlKZGZTd2dleUp6YkRFaU9qQXNJQ0prWlhONWJtTmZabkpsWlhOMFlXNWtJam9pVDJabUlpd2dJbk5zTWlJNk1Dd2dJbk5zTXlJNk1Dd2dJbVJsWm1WdWMybDJaVjloWVNJNmRISjFaU3dnSW5Oc05DSTZNQ3dnSW1ScGMyUmxabk1pT21aaGJITmxMQ0FpYzJ3MUlqb3dMQ0FpWm10c1lXZHNkQ0k2ZEhKMVpTd2dJbk5zZEdsamF5STZOU3dnSW14algyVnVZV0pzWlNJNmRISjFaU3dnSW5Oc01UZDNJam93TENBaWMyd3lOM2NpT2pBc0lDSnpiRE0zZHlJNk1Dd2dJbk5zTkRkM0lqb3dMQ0FpYzJ3MU4zY2lPakFzSUNKemJEWTNkeUk2TUN3Z0luTnNOemQzSWpvd0xDQWllV0YzWW1GelpXUWlPaUpDWVdOcmQyRnlaQ0lzSUNKaWIyUjVYM2xoZHlJNmRISjFaU3dnSW5saGQxOXRiMlJwWm1sbGNpSTZJa05sYm5SbGNpSXNJQ0prWlhONWJtTmZiQ0k2TWpRc0lDSnNZMTlsYm1GaWJHVmZiMjRpT2xzeExDQXlMQ0FpZmlKZExDQWllV0YzSWpvaVUzZHBkR05vWldRaUxDQWlaR1Z6ZVc1algzSWlPalV4TENBaVptRnJaVjl2Y0hScGIyNXpJanBiSWtGMmIybGtJRTkyWlhKc1lYQWlMQ0FpU21sMGRHVnlJaXdnSW40aVhYMHNJSHNpYzJ3eElqb3dMQ0FpWkdWemVXNWpYMlp5WldWemRHRnVaQ0k2SWs5bVppSXNJQ0p6YkRJaU9qQXNJQ0p6YkRNaU9qQXNJQ0prWldabGJuTnBkbVZmWVdFaU9uUnlkV1VzSUNKemJEUWlPakFzSUNKa2FYTmtaV1p6SWpwbVlXeHpaU3dnSW5Oc05TSTZNQ3dnSW1acmJHRm5iSFFpT25SeWRXVXNJQ0p6YkhScFkyc2lPalVzSUNKc1kxOWxibUZpYkdVaU9uUnlkV1VzSUNKemJERTNkeUk2TUN3Z0luTnNNamQzSWpvd0xDQWljMnd6TjNjaU9qQXNJQ0p6YkRRM2R5STZNQ3dnSW5Oc05UZDNJam93TENBaWMydzJOM2NpT2pBc0lDSnpiRGMzZHlJNk1Dd2dJbmxoZDJKaGMyVmtJam9pUW1GamEzZGhjbVFpTENBaVltOWtlVjk1WVhjaU9uUnlkV1VzSUNKNVlYZGZiVzlrYVdacFpYSWlPaUpEWlc1MFpYSWlMQ0FpWkdWemVXNWpYMndpT2pVNExDQWliR05mWlc1aFlteGxYMjl1SWpwYk1Td2dNaXdnSW40aVhTd2dJbmxoZHlJNklsTjNhWFJqYUdWa0lpd2dJbVJsYzNsdVkxOXlJam95TVN3Z0ltWmhhMlZmYjNCMGFXOXVjeUk2V3lKS2FYUjBaWElpTENBaVVtRnVaRzl0YVhwbElFcHBkSFJsY2lJc0lDSitJbDE5TENCN0luTnNNU0k2TUN3Z0ltUmxjM2x1WTE5bWNtVmxjM1JoYm1RaU9pSlBabVlpTENBaWMyd3lJam93TENBaWMyd3pJam93TENBaVpHVm1aVzV6YVhabFgyRmhJanAwY25WbExDQWljMncwSWpvd0xDQWlaR2x6WkdWbWN5STZabUZzYzJVc0lDSnpiRFVpT2pBc0lDSm1hMnhoWjJ4MElqcG1ZV3h6WlN3Z0luTnNkR2xqYXlJNk5Td2dJbXhqWDJWdVlXSnNaU0k2ZEhKMVpTd2dJbk5zTVRkM0lqb3dMQ0FpYzJ3eU4zY2lPakFzSUNKemJETTNkeUk2TUN3Z0luTnNORGQzSWpvd0xDQWljMncxTjNjaU9qQXNJQ0p6YkRZM2R5STZNQ3dnSW5Oc056ZDNJam93TENBaWVXRjNZbUZ6WldRaU9pSkNZV05yZDJGeVpDSXNJQ0ppYjJSNVgzbGhkeUk2ZEhKMVpTd2dJbmxoZDE5dGIyUnBabWxsY2lJNklrTmxiblJsY2lJc0lDSmtaWE41Ym1OZmJDSTZNamNzSUNKc1kxOWxibUZpYkdWZmIyNGlPbHN4TENBeUxDQWlmaUpkTENBaWVXRjNJam9pVTNkcGRHTm9aV1FpTENBaVpHVnplVzVqWDNJaU9qRXlMQ0FpWm1GclpWOXZjSFJwYjI1eklqcGJJa0YyYjJsa0lFOTJaWEpzWVhBaUxDQWlTbWwwZEdWeUlpd2dJbjRpWFgwc0lIc2ljMnd4SWpvd0xDQWlaR1Z6ZVc1algyWnlaV1Z6ZEdGdVpDSTZJazltWmlJc0lDSnpiRElpT2pBc0lDSnpiRE1pT2pBc0lDSmtaV1psYm5OcGRtVmZZV0VpT21aaGJITmxMQ0FpYzJ3MElqb3dMQ0FpWkdselpHVm1jeUk2Wm1Gc2MyVXNJQ0p6YkRVaU9qQXNJQ0ptYTJ4aFoyeDBJanBtWVd4elpTd2dJbk5zZEdsamF5STZOU3dnSW14algyVnVZV0pzWlNJNmRISjFaU3dnSW5Oc01UZDNJam93TENBaWMyd3lOM2NpT2pBc0lDSnpiRE0zZHlJNk1Dd2dJbk5zTkRkM0lqb3dMQ0FpYzJ3MU4zY2lPakFzSUNKemJEWTNkeUk2TUN3Z0luTnNOemQzSWpvd0xDQWllV0YzWW1GelpXUWlPaUpDWVdOcmQyRnlaQ0lzSUNKaWIyUjVYM2xoZHlJNmRISjFaU3dnSW5saGQxOXRiMlJwWm1sbGNpSTZJa05sYm5SbGNpSXNJQ0prWlhONWJtTmZiQ0k2TkRVc0lDSnNZMTlsYm1GaWJHVmZiMjRpT2xzeExDQXlMQ0FpZmlKZExDQWllV0YzSWpvaVJHVm1ZWFZzZENJc0lDSmtaWE41Ym1OZmNpSTZNVFVzSUNKbVlXdGxYMjl3ZEdsdmJuTWlPbHNpUVhadmFXUWdUM1psY214aGNDSXNJQ0pLYVhSMFpYSWlMQ0FpZmlKZGZWMHNJRnQ3SW5KaGJtUm1hM0p6YkRJaU9qQXNJQ0p5WVc1a1ptdHNjMnd6SWpvd0xDQWljbUZ1WkdacmNuTnNNeUk2TUN3Z0luSmhibVJtYTJ4emJEUWlPakFzSUNKeVlXNWtabXR5YzJ3MElqb3dMQ0FpY21GdVpHWnJiSE5zTlNJNk1Dd2dJbkpoYm1SbWEzSnpiRFVpT2pBc0lDSjVZWGRmYkNJNkxUZ3NJQ0o1WVhkZmNpSTZPU3dnSW5SeWFXZG5aWEp6SWpwYkluNGlYU3dnSW5saGQyeHljbUZ1WkNJNlptRnNjMlVzSUNKNVlYZGZaR1ZzWVhraU9qVXNJQ0p5WVc1a1ptdHNjMncySWpvd0xDQWllV0YzWDIxdlpGOXZabVp6WlhRaU9qQXNJQ0prYzJ4bWEyMXZaQ0k2SWxOM2FYUmphR1ZrSWl3Z0ltUnpiR1pyYzJ4emQzUWlPak00TENBaWNtRnVaR1pyY25Oc055STZNQ3dnSW1SemJHWnJjM2R6Y0NJNk9Td2dJbVpyYjNCMGNtRnVaREVpT2xzaWZpSmRMQ0FpWkhOc1ptdHpiSEpoYmlJNk1Dd2dJbVpyYjNCMGNtRnVaRElpT2xzaWZpSmRMQ0FpWkhOc1ptdHlZVzV6Y0dRaU9qQXNJQ0ptYTI5d2RISmhibVF6SWpwYkluNGlYU3dnSW1SemNtWnJiVzlrSWpvaVUzZHBkR05vWldRaUxDQWlabXR2Y0hSeVlXNWtOQ0k2V3lKK0lsMHNJQ0prYzNKbWEzTnNjM2QwSWpveE55d2dJbVJ6Y21acmMzZHpjQ0k2TVRFc0lDSmtjM0ptYTNOc2NtRnVJam93TENBaVpITnlabXR5WVc1emNHUWlPakFzSUNKbWEyeGhaM04zZENJNk1Td2dJbVpyYjNCMGNtRnVaRGNpT2xzaWZpSmRMQ0FpWm10cGJuWmxjblFpT21aaGJITmxMQ0FpYVc1MlpYSjBjMnd4SWpwbVlXeHpaU3dnSW5KaGJtUnZiVEVpT21aaGJITmxMQ0FpYVc1MlpYSjBjMnd5SWpwbVlXeHpaU3dnSW5KaGJtUnZiVElpT21aaGJITmxMQ0FpYVc1MlpYSjBjMnd6SWpwbVlXeHpaU3dnSW5KaGJtUnZiVE1pT21aaGJITmxMQ0FpYVc1MlpYSjBjMncwSWpwbVlXeHpaU3dnSW5KaGJtUnZiVFFpT21aaGJITmxMQ0FpYVc1MlpYSjBjMncxSWpwbVlXeHpaU3dnSW5KaGJtUnZiVFVpT21aaGJITmxMQ0FpYVc1MlpYSjBjMncySWpwbVlXeHpaU3dnSW5KaGJtUnZiVFlpT21aaGJITmxMQ0FpYVc1MlpYSjBjMnczSWpwbVlXeHpaU3dnSW5KaGJtUnZiVGNpT21aaGJITmxMQ0FpWkdWbVpXNXphWFpsWDNCcGRHTm9Jam9pVTNSaGRHbGpJaXdnSW5KaGJtUnpiREVpT2pBc0lDSnlZVzVrYzJ3eUlqb3dMQ0FpY21GdVpITnNNeUk2TUN3Z0ltUmxabVZ1YzJsMlpWOXdhWFJqYURFaU9qZzVMQ0FpY21GdVpITnNOQ0k2TUN3Z0luSmhibVJsWm5CME1TSTZNQ3dnSW5KaGJtUnpiRFVpT2pBc0lDSmtaV1psYm5OcGRtVmZjR2wwWTJneUlqb3dMQ0FpY21GdVpITnNOaUk2TUN3Z0ltSmxkSE4zYzNCa0lqb3hMQ0FpY21GdVpITnNOeUk2TUN3Z0luSmhibVJsWm5CME1pSTZNQ3dnSW1acmJITnNNU0k2TUN3Z0luTjNkSE5zWkRFaU9qRXNJQ0ptYTNKemJERWlPakFzSUNKbWEyeHpiRElpT2pBc0lDSm1hM0p6YkRJaU9qQXNJQ0ptYTJ4emJETWlPakFzSUNKa1pXWmxibk5wZG1WZmVXRjNNaUk2Tml3Z0ltWnJjbk5zTXlJNk1Dd2dJbVpyYkhOc05DSTZNQ3dnSW1acmNuTnNOQ0k2TUN3Z0ltWnJiSE5zTlNJNk1Dd2dJbVJwYzNOc0lqb3dMQ0FpWm10eWMydzFJam93TENBaWVXRjNYMkpoYzJWa0lqb2lURzlqWVd3Z1ZtbGxkeUlzSUNKbWEyeHpiRFlpT2pBc0lDSnpkM1J6YkdRaU9qRXNJQ0ptYTNKemJEWWlPakFzSUNKb1lXMXViMTlRUlVWRUlqb3hMQ0FpWm10c2MydzNJam93TENBaVltVjBjM2R6Y0dReklqb3hMQ0FpWm10eWMydzNJam93TENBaVltVjBjM2R6Y0dReUlqb3hNU3dnSW5KaGJtUnpkM1F4SWpwbVlXeHpaU3dnSW5KaGJtUmxabmwzTWlJNk1pd2dJbkpoYm1SemQzUXlJanBtWVd4elpTd2dJbkpoYm1SbFpubDNNU0k2TVN3Z0luSmhibVJ6ZDNReklqcG1ZV3h6WlN3Z0ltUmxabVZ1YzJsMlpWOTVZWGN4SWpvdE9Dd2dJbkpoYm1SemQzUTBJanBtWVd4elpTd2dJbVJsWm1WdWMybDJaVjk1WVhjaU9pSkNaWFIwWlhJZ1UzZHBkR05vSWl3Z0luSmhibVJ6ZDNRMUlqcG1ZV3h6WlN3Z0luTjNjM0JrSWpveExDQWljbUZ1WkhOM2REWWlPbVpoYkhObExDQWlabXR2Y0hSeVlXNWtOaUk2V3lKK0lsMHNJQ0p5WVc1a2MzZDBOeUk2Wm1Gc2MyVXNJQ0ptYTI5d2RISmhibVExSWpwYkluNGlYU3dnSW5KaGJtUm1hMnh6YkRFaU9qQXNJQ0p5WVc1a1ptdHNjMnczSWpvd0xDQWljbUZ1WkdacmNuTnNNU0k2TUN3Z0luSmhibVJtYTNKemJEWWlPakFzSUNKeVlXNWtabXRzYzJ3eUlqb3dmU3dnZXlKeVlXNWtabXR5YzJ3eUlqbzFMQ0FpY21GdVpHWnJiSE5zTXlJNk1Dd2dJbkpoYm1SbWEzSnpiRE1pT2pBc0lDSnlZVzVrWm10c2MydzBJam94TENBaWNtRnVaR1pyY25Oc05DSTZOQ3dnSW5KaGJtUm1hMnh6YkRVaU9qVXNJQ0p5WVc1a1ptdHljMncxSWpveUxDQWllV0YzWDJ3aU9qQXNJQ0o1WVhkZmNpSTZNQ3dnSW5SeWFXZG5aWEp6SWpwYkluNGlYU3dnSW5saGQyeHljbUZ1WkNJNlptRnNjMlVzSUNKNVlYZGZaR1ZzWVhraU9qQXNJQ0p5WVc1a1ptdHNjMncySWpvMExDQWllV0YzWDIxdlpGOXZabVp6WlhRaU9qQXNJQ0prYzJ4bWEyMXZaQ0k2SWxOM2FYUmphR1ZrSWl3Z0ltUnpiR1pyYzJ4emQzUWlPak14TENBaWNtRnVaR1pyY25Oc055STZOU3dnSW1SemJHWnJjM2R6Y0NJNk1URXNJQ0ptYTI5d2RISmhibVF4SWpwYklrRjJiMmxrSUU5MlpYSnNZWEFpTENBaVNtbDBkR1Z5SWl3Z0luNGlYU3dnSW1SemJHWnJjMnh5WVc0aU9qQXNJQ0ptYTI5d2RISmhibVF5SWpwYklrcHBkSFJsY2lJc0lDSitJbDBzSUNKa2MyeG1hM0poYm5Od1pDSTZNQ3dnSW1acmIzQjBjbUZ1WkRNaU9sc2lTbWwwZEdWeUlpd2dJbEpoYm1SdmJXbDZaU0JLYVhSMFpYSWlMQ0FpZmlKZExDQWlaSE55Wm10dGIyUWlPaUpUZDJsMFkyaGxaQ0lzSUNKbWEyOXdkSEpoYm1RMElqcGJJa3BwZEhSbGNpSXNJQ0orSWwwc0lDSmtjM0ptYTNOc2MzZDBJam94TVN3Z0ltUnpjbVpyYzNkemNDSTZOU3dnSW1SemNtWnJjMnh5WVc0aU9qQXNJQ0prYzNKbWEzSmhibk53WkNJNk1Dd2dJbVpyYkdGbmMzZDBJam96TENBaVptdHZjSFJ5WVc1a055STZXeUpCZG05cFpDQlBkbVZ5YkdGd0lpd2dJa3BwZEhSbGNpSXNJQ0orSWwwc0lDSm1hMmx1ZG1WeWRDSTZabUZzYzJVc0lDSnBiblpsY25SemJERWlPblJ5ZFdVc0lDSnlZVzVrYjIweElqcDBjblZsTENBaWFXNTJaWEowYzJ3eUlqcG1ZV3h6WlN3Z0luSmhibVJ2YlRJaU9uUnlkV1VzSUNKcGJuWmxjblJ6YkRNaU9tWmhiSE5sTENBaWNtRnVaRzl0TXlJNmRISjFaU3dnSW1sdWRtVnlkSE5zTkNJNmRISjFaU3dnSW5KaGJtUnZiVFFpT25SeWRXVXNJQ0pwYm5abGNuUnpiRFVpT25SeWRXVXNJQ0p5WVc1a2IyMDFJanAwY25WbExDQWlhVzUyWlhKMGMydzJJanBtWVd4elpTd2dJbkpoYm1SdmJUWWlPblJ5ZFdVc0lDSnBiblpsY25SemJEY2lPbVpoYkhObExDQWljbUZ1Wkc5dE55STZkSEoxWlN3Z0ltUmxabVZ1YzJsMlpWOXdhWFJqYUNJNklsTjBZWFJwWXlJc0lDSnlZVzVrYzJ3eElqb3pMQ0FpY21GdVpITnNNaUk2TVN3Z0luSmhibVJ6YkRNaU9qQXNJQ0prWldabGJuTnBkbVZmY0dsMFkyZ3hJam93TENBaWNtRnVaSE5zTkNJNk1pd2dJbkpoYm1SbFpuQjBNU0k2TUN3Z0luSmhibVJ6YkRVaU9qRXNJQ0prWldabGJuTnBkbVZmY0dsMFkyZ3lJam93TENBaWNtRnVaSE5zTmlJNk15d2dJbUpsZEhOM2MzQmtJam94TENBaWNtRnVaSE5zTnlJNk15d2dJbkpoYm1SbFpuQjBNaUk2TUN3Z0ltWnJiSE5zTVNJNk16a3NJQ0p6ZDNSemJHUXhJam94TENBaVptdHljMnd4SWpveE5Td2dJbVpyYkhOc01pSTZNVGdzSUNKbWEzSnpiRElpT2pNNUxDQWlabXRzYzJ3eklqbzBPQ3dnSW1SbFptVnVjMmwyWlY5NVlYY3lJam93TENBaVptdHljMnd6SWpvMU15d2dJbVpyYkhOc05DSTZNVEVzSUNKbWEzSnpiRFFpT2pRMExDQWlabXRzYzJ3MUlqbzFNeXdnSW1ScGMzTnNJam93TENBaVptdHljMncxSWpveE9Dd2dJbmxoZDE5aVlYTmxaQ0k2SWt4dlkyRnNJRlpwWlhjaUxDQWlabXRzYzJ3MklqbzFOU3dnSW5OM2RITnNaQ0k2TVN3Z0ltWnJjbk5zTmlJNk1Ua3NJQ0pvWVcxdWIxOVFSVVZFSWpveExDQWlabXRzYzJ3M0lqb3hNeXdnSW1KbGRITjNjM0JrTXlJNk1Td2dJbVpyY25Oc055STZOVEFzSUNKaVpYUnpkM053WkRJaU9qRXNJQ0p5WVc1a2MzZDBNU0k2ZEhKMVpTd2dJbkpoYm1SbFpubDNNaUk2TUN3Z0luSmhibVJ6ZDNReUlqcDBjblZsTENBaWNtRnVaR1ZtZVhjeElqb3dMQ0FpY21GdVpITjNkRE1pT21aaGJITmxMQ0FpWkdWbVpXNXphWFpsWDNsaGR6RWlPakFzSUNKeVlXNWtjM2QwTkNJNmRISjFaU3dnSW1SbFptVnVjMmwyWlY5NVlYY2lPaUpUZEdGMGFXTWlMQ0FpY21GdVpITjNkRFVpT25SeWRXVXNJQ0p6ZDNOd1pDSTZNU3dnSW5KaGJtUnpkM1EySWpwMGNuVmxMQ0FpWm10dmNIUnlZVzVrTmlJNld5SkthWFIwWlhJaUxDQWlmaUpkTENBaWNtRnVaSE4zZERjaU9uUnlkV1VzSUNKbWEyOXdkSEpoYm1RMUlqcGJJa0YyYjJsa0lFOTJaWEpzWVhBaUxDQWlTbWwwZEdWeUlpd2dJbjRpWFN3Z0luSmhibVJtYTJ4emJERWlPakU0TENBaWNtRnVaR1pyYkhOc055STZNeXdnSW5KaGJtUm1hM0p6YkRFaU9qVXNJQ0p5WVc1a1ptdHljMncySWpveExDQWljbUZ1WkdacmJITnNNaUk2TTMwc0lIc2ljbUZ1WkdacmNuTnNNaUk2TUN3Z0luSmhibVJtYTJ4emJETWlPakFzSUNKeVlXNWtabXR5YzJ3eklqb3dMQ0FpY21GdVpHWnJiSE5zTkNJNk1Dd2dJbkpoYm1SbWEzSnpiRFFpT2pBc0lDSnlZVzVrWm10c2MydzFJam93TENBaWNtRnVaR1pyY25Oc05TSTZNQ3dnSW5saGQxOXNJam90TVRRc0lDSjVZWGRmY2lJNk1UWXNJQ0owY21sbloyVnljeUk2V3lKK0lsMHNJQ0o1WVhkc2NuSmhibVFpT21aaGJITmxMQ0FpZVdGM1gyUmxiR0Y1SWpvekxDQWljbUZ1WkdacmJITnNOaUk2TUN3Z0lubGhkMTl0YjJSZmIyWm1jMlYwSWpvd0xDQWlaSE5zWm10dGIyUWlPaUpUZDJsMFkyaGxaQ0lzSUNKa2MyeG1hM05zYzNkMElqbzBNU3dnSW5KaGJtUm1hM0p6YkRjaU9qQXNJQ0prYzJ4bWEzTjNjM0FpT2pnc0lDSm1hMjl3ZEhKaGJtUXhJanBiSW40aVhTd2dJbVJ6YkdacmMyeHlZVzRpT2pBc0lDSm1hMjl3ZEhKaGJtUXlJanBiSW40aVhTd2dJbVJ6YkdacmNtRnVjM0JrSWpvd0xDQWlabXR2Y0hSeVlXNWtNeUk2V3lKK0lsMHNJQ0prYzNKbWEyMXZaQ0k2SWxOM2FYUmphR1ZrSWl3Z0ltWnJiM0IwY21GdVpEUWlPbHNpZmlKZExDQWlaSE55Wm10emJITjNkQ0k2TWpjc0lDSmtjM0ptYTNOM2MzQWlPakUxTENBaVpITnlabXR6YkhKaGJpSTZNQ3dnSW1SemNtWnJjbUZ1YzNCa0lqb3dMQ0FpWm10c1lXZHpkM1FpT2pFc0lDSm1hMjl3ZEhKaGJtUTNJanBiSW40aVhTd2dJbVpyYVc1MlpYSjBJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNNU0k2Wm1Gc2MyVXNJQ0p5WVc1a2IyMHhJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNNaUk2Wm1Gc2MyVXNJQ0p5WVc1a2IyMHlJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNNeUk2Wm1Gc2MyVXNJQ0p5WVc1a2IyMHpJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNOQ0k2Wm1Gc2MyVXNJQ0p5WVc1a2IyMDBJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNOU0k2Wm1Gc2MyVXNJQ0p5WVc1a2IyMDFJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNOaUk2Wm1Gc2MyVXNJQ0p5WVc1a2IyMDJJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNOeUk2Wm1Gc2MyVXNJQ0p5WVc1a2IyMDNJanBtWVd4elpTd2dJbVJsWm1WdWMybDJaVjl3YVhSamFDSTZJa0psZEhSbGNpQlNZVzVrYjIwaUxDQWljbUZ1WkhOc01TSTZNQ3dnSW5KaGJtUnpiRElpT2pBc0lDSnlZVzVrYzJ3eklqb3dMQ0FpWkdWbVpXNXphWFpsWDNCcGRHTm9NU0k2TFRZMUxDQWljbUZ1WkhOc05DSTZNQ3dnSW5KaGJtUmxabkIwTVNJNk1Dd2dJbkpoYm1SemJEVWlPakFzSUNKa1pXWmxibk5wZG1WZmNHbDBZMmd5SWpveE1pd2dJbkpoYm1SemJEWWlPakFzSUNKaVpYUnpkM053WkNJNk5pd2dJbkpoYm1SemJEY2lPakFzSUNKeVlXNWtaV1p3ZERJaU9qQXNJQ0ptYTJ4emJERWlPakFzSUNKemQzUnpiR1F4SWpveExDQWlabXR5YzJ3eElqb3dMQ0FpWm10c2Myd3lJam93TENBaVptdHljMnd5SWpvd0xDQWlabXRzYzJ3eklqb3dMQ0FpWkdWbVpXNXphWFpsWDNsaGR6SWlPalEwTENBaVptdHljMnd6SWpvd0xDQWlabXRzYzJ3MElqb3dMQ0FpWm10eWMydzBJam93TENBaVptdHNjMncxSWpvd0xDQWlaR2x6YzJ3aU9qQXNJQ0ptYTNKemJEVWlPakFzSUNKNVlYZGZZbUZ6WldRaU9pSk1iMk5oYkNCV2FXVjNJaXdnSW1acmJITnNOaUk2TUN3Z0luTjNkSE5zWkNJNk1Td2dJbVpyY25Oc05pSTZNQ3dnSW1oaGJXNXZYMUJGUlVRaU9qRXNJQ0ptYTJ4emJEY2lPakFzSUNKaVpYUnpkM053WkRNaU9qTXNJQ0ptYTNKemJEY2lPakFzSUNKaVpYUnpkM053WkRJaU9qRXNJQ0p5WVc1a2MzZDBNU0k2Wm1Gc2MyVXNJQ0p5WVc1a1pXWjVkeklpT2pBc0lDSnlZVzVrYzNkME1pSTZabUZzYzJVc0lDSnlZVzVrWldaNWR6RWlPakFzSUNKeVlXNWtjM2QwTXlJNlptRnNjMlVzSUNKa1pXWmxibk5wZG1WZmVXRjNNU0k2TFRRNUxDQWljbUZ1WkhOM2REUWlPbVpoYkhObExDQWlaR1ZtWlc1emFYWmxYM2xoZHlJNklrSmxkSFJsY2lCU1lXNWtiMjBpTENBaWNtRnVaSE4zZERVaU9tWmhiSE5sTENBaWMzZHpjR1FpT2pFc0lDSnlZVzVrYzNkME5pSTZabUZzYzJVc0lDSm1hMjl3ZEhKaGJtUTJJanBiSW40aVhTd2dJbkpoYm1SemQzUTNJanBtWVd4elpTd2dJbVpyYjNCMGNtRnVaRFVpT2xzaWZpSmRMQ0FpY21GdVpHWnJiSE5zTVNJNk1Dd2dJbkpoYm1SbWEyeHpiRGNpT2pBc0lDSnlZVzVrWm10eWMyd3hJam93TENBaWNtRnVaR1pyY25Oc05pSTZNQ3dnSW5KaGJtUm1hMnh6YkRJaU9qQjlMQ0I3SW5KaGJtUm1hM0p6YkRJaU9qQXNJQ0p5WVc1a1ptdHNjMnd6SWpvd0xDQWljbUZ1WkdacmNuTnNNeUk2TUN3Z0luSmhibVJtYTJ4emJEUWlPakFzSUNKeVlXNWtabXR5YzJ3MElqb3dMQ0FpY21GdVpHWnJiSE5zTlNJNk1Dd2dJbkpoYm1SbWEzSnpiRFVpT2pBc0lDSjVZWGRmYkNJNkxURTFMQ0FpZVdGM1gzSWlPakUzTENBaWRISnBaMmRsY25NaU9sc2lmaUpkTENBaWVXRjNiSEp5WVc1a0lqcG1ZV3h6WlN3Z0lubGhkMTlrWld4aGVTSTZOU3dnSW5KaGJtUm1hMnh6YkRZaU9qQXNJQ0o1WVhkZmJXOWtYMjltWm5ObGRDSTZNQ3dnSW1SemJHWnJiVzlrSWpvaVUzZHBkR05vWldRaUxDQWlaSE5zWm10emJITjNkQ0k2TVRZc0lDSnlZVzVrWm10eWMydzNJam93TENBaVpITnNabXR6ZDNOd0lqb3pMQ0FpWm10dmNIUnlZVzVrTVNJNld5SitJbDBzSUNKa2MyeG1hM05zY21GdUlqb3dMQ0FpWm10dmNIUnlZVzVrTWlJNld5SitJbDBzSUNKa2MyeG1hM0poYm5Od1pDSTZNQ3dnSW1acmIzQjBjbUZ1WkRNaU9sc2lmaUpkTENBaVpITnlabXR0YjJRaU9pSlRkMmwwWTJobFpDSXNJQ0ptYTI5d2RISmhibVEwSWpwYkluNGlYU3dnSW1SemNtWnJjMnh6ZDNRaU9qUXlMQ0FpWkhOeVptdHpkM053SWpveE9Dd2dJbVJ6Y21acmMyeHlZVzRpT2pBc0lDSmtjM0ptYTNKaGJuTndaQ0k2TUN3Z0ltWnJiR0ZuYzNkMElqb3hMQ0FpWm10dmNIUnlZVzVrTnlJNld5SitJbDBzSUNKbWEybHVkbVZ5ZENJNmRISjFaU3dnSW1sdWRtVnlkSE5zTVNJNlptRnNjMlVzSUNKeVlXNWtiMjB4SWpwbVlXeHpaU3dnSW1sdWRtVnlkSE5zTWlJNlptRnNjMlVzSUNKeVlXNWtiMjB5SWpwbVlXeHpaU3dnSW1sdWRtVnlkSE5zTXlJNlptRnNjMlVzSUNKeVlXNWtiMjB6SWpwbVlXeHpaU3dnSW1sdWRtVnlkSE5zTkNJNlptRnNjMlVzSUNKeVlXNWtiMjAwSWpwbVlXeHpaU3dnSW1sdWRtVnlkSE5zTlNJNlptRnNjMlVzSUNKeVlXNWtiMjAxSWpwbVlXeHpaU3dnSW1sdWRtVnlkSE5zTmlJNlptRnNjMlVzSUNKeVlXNWtiMjAySWpwbVlXeHpaU3dnSW1sdWRtVnlkSE5zTnlJNlptRnNjMlVzSUNKeVlXNWtiMjAzSWpwbVlXeHpaU3dnSW1SbFptVnVjMmwyWlY5d2FYUmphQ0k2SWtKbGRIUmxjaUJTWVc1a2IyMGlMQ0FpY21GdVpITnNNU0k2TUN3Z0luSmhibVJ6YkRJaU9qQXNJQ0p5WVc1a2Myd3pJam93TENBaVpHVm1aVzV6YVhabFgzQnBkR05vTVNJNkxUYzJMQ0FpY21GdVpITnNOQ0k2TUN3Z0luSmhibVJsWm5CME1TSTZNQ3dnSW5KaGJtUnpiRFVpT2pBc0lDSmtaV1psYm5OcGRtVmZjR2wwWTJneUlqb3hOeXdnSW5KaGJtUnpiRFlpT2pBc0lDSmlaWFJ6ZDNOd1pDSTZNaXdnSW5KaGJtUnpiRGNpT2pBc0lDSnlZVzVrWldad2RESWlPakFzSUNKbWEyeHpiREVpT2pBc0lDSnpkM1J6YkdReElqb3hMQ0FpWm10eWMyd3hJam93TENBaVptdHNjMnd5SWpvd0xDQWlabXR5YzJ3eUlqb3dMQ0FpWm10c2Myd3pJam93TENBaVpHVm1aVzV6YVhabFgzbGhkeklpT2pBc0lDSm1hM0p6YkRNaU9qQXNJQ0ptYTJ4emJEUWlPakFzSUNKbWEzSnpiRFFpT2pBc0lDSm1hMnh6YkRVaU9qQXNJQ0prYVhOemJDSTZNQ3dnSW1acmNuTnNOU0k2TUN3Z0lubGhkMTlpWVhObFpDSTZJa3h2WTJGc0lGWnBaWGNpTENBaVptdHNjMncySWpvd0xDQWljM2QwYzJ4a0lqb3hMQ0FpWm10eWMydzJJam93TENBaWFHRnRibTlmVUVWRlJDSTZPU3dnSW1acmJITnNOeUk2TUN3Z0ltSmxkSE4zYzNCa015STZNU3dnSW1acmNuTnNOeUk2TUN3Z0ltSmxkSE4zYzNCa01pSTZNU3dnSW5KaGJtUnpkM1F4SWpwbVlXeHpaU3dnSW5KaGJtUmxabmwzTWlJNk1Dd2dJbkpoYm1SemQzUXlJanBtWVd4elpTd2dJbkpoYm1SbFpubDNNU0k2TUN3Z0luSmhibVJ6ZDNReklqcG1ZV3h6WlN3Z0ltUmxabVZ1YzJsMlpWOTVZWGN4SWpveE5qY3NJQ0p5WVc1a2MzZDBOQ0k2Wm1Gc2MyVXNJQ0prWldabGJuTnBkbVZmZVdGM0lqb2lVM0JwYmlJc0lDSnlZVzVrYzNkME5TSTZabUZzYzJVc0lDSnpkM053WkNJNk1Td2dJbkpoYm1SemQzUTJJanBtWVd4elpTd2dJbVpyYjNCMGNtRnVaRFlpT2xzaWZpSmRMQ0FpY21GdVpITjNkRGNpT21aaGJITmxMQ0FpWm10dmNIUnlZVzVrTlNJNld5SitJbDBzSUNKeVlXNWtabXRzYzJ3eElqb3dMQ0FpY21GdVpHWnJiSE5zTnlJNk1Dd2dJbkpoYm1SbWEzSnpiREVpT2pBc0lDSnlZVzVrWm10eWMydzJJam93TENBaWNtRnVaR1pyYkhOc01pSTZNSDBzSUhzaWNtRnVaR1pyY25Oc01pSTZNQ3dnSW5KaGJtUm1hMnh6YkRNaU9qQXNJQ0p5WVc1a1ptdHljMnd6SWpvd0xDQWljbUZ1WkdacmJITnNOQ0k2TUN3Z0luSmhibVJtYTNKemJEUWlPakFzSUNKeVlXNWtabXRzYzJ3MUlqb3dMQ0FpY21GdVpHWnJjbk5zTlNJNk1Dd2dJbmxoZDE5c0lqb3RNakVzSUNKNVlYZGZjaUk2TVRnc0lDSjBjbWxuWjJWeWN5STZXeUorSWwwc0lDSjVZWGRzY25KaGJtUWlPbVpoYkhObExDQWllV0YzWDJSbGJHRjVJam96TENBaWNtRnVaR1pyYkhOc05pSTZNQ3dnSW5saGQxOXRiMlJmYjJabWMyVjBJam93TENBaVpITnNabXR0YjJRaU9pSlRkMmwwWTJobFpDSXNJQ0prYzJ4bWEzTnNjM2QwSWpvek9Td2dJbkpoYm1SbWEzSnpiRGNpT2pBc0lDSmtjMnhtYTNOM2MzQWlPakl3TENBaVptdHZjSFJ5WVc1a01TSTZXeUorSWwwc0lDSmtjMnhtYTNOc2NtRnVJam93TENBaVptdHZjSFJ5WVc1a01pSTZXeUorSWwwc0lDSmtjMnhtYTNKaGJuTndaQ0k2TUN3Z0ltWnJiM0IwY21GdVpETWlPbHNpZmlKZExDQWlaSE55Wm10dGIyUWlPaUpTWVc1a2IyMGlMQ0FpWm10dmNIUnlZVzVrTkNJNld5SitJbDBzSUNKa2MzSm1hM05zYzNkMElqb3lNeXdnSW1SemNtWnJjM2R6Y0NJNk1Dd2dJbVJ6Y21acmMyeHlZVzRpT2pFeUxDQWlaSE55Wm10eVlXNXpjR1FpT2pRc0lDSm1hMnhoWjNOM2RDSTZNU3dnSW1acmIzQjBjbUZ1WkRjaU9sc2lmaUpkTENBaVptdHBiblpsY25RaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3eElqcG1ZV3h6WlN3Z0luSmhibVJ2YlRFaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3eUlqcG1ZV3h6WlN3Z0luSmhibVJ2YlRJaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3eklqcG1ZV3h6WlN3Z0luSmhibVJ2YlRNaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3MElqcG1ZV3h6WlN3Z0luSmhibVJ2YlRRaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3MUlqcG1ZV3h6WlN3Z0luSmhibVJ2YlRVaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3MklqcG1ZV3h6WlN3Z0luSmhibVJ2YlRZaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3M0lqcG1ZV3h6WlN3Z0luSmhibVJ2YlRjaU9tWmhiSE5sTENBaVpHVm1aVzV6YVhabFgzQnBkR05vSWpvaVFtVjBkR1Z5SUZOM2FYUmphQ0lzSUNKeVlXNWtjMnd4SWpvd0xDQWljbUZ1WkhOc01pSTZNQ3dnSW5KaGJtUnpiRE1pT2pBc0lDSmtaV1psYm5OcGRtVmZjR2wwWTJneElqb3ROalVzSUNKeVlXNWtjMncwSWpvd0xDQWljbUZ1WkdWbWNIUXhJam94TXl3Z0luSmhibVJ6YkRVaU9qQXNJQ0prWldabGJuTnBkbVZmY0dsMFkyZ3lJam96TWl3Z0luSmhibVJ6YkRZaU9qQXNJQ0ppWlhSemQzTndaQ0k2TVN3Z0luSmhibVJ6YkRjaU9qQXNJQ0p5WVc1a1pXWndkRElpT2pNd0xDQWlabXRzYzJ3eElqb3dMQ0FpYzNkMGMyeGtNU0k2TVRFc0lDSm1hM0p6YkRFaU9qQXNJQ0ptYTJ4emJESWlPakFzSUNKbWEzSnpiRElpT2pBc0lDSm1hMnh6YkRNaU9qQXNJQ0prWldabGJuTnBkbVZmZVdGM01pSTZORElzSUNKbWEzSnpiRE1pT2pBc0lDSm1hMnh6YkRRaU9qQXNJQ0ptYTNKemJEUWlPakFzSUNKbWEyeHpiRFVpT2pBc0lDSmthWE56YkNJNk1Dd2dJbVpyY25Oc05TSTZNQ3dnSW5saGQxOWlZWE5sWkNJNklreHZZMkZzSUZacFpYY2lMQ0FpWm10c2MydzJJam93TENBaWMzZDBjMnhrSWpveExDQWlabXR5YzJ3Mklqb3dMQ0FpYUdGdGJtOWZVRVZGUkNJNk1Td2dJbVpyYkhOc055STZNQ3dnSW1KbGRITjNjM0JrTXlJNk1Td2dJbVpyY25Oc055STZNQ3dnSW1KbGRITjNjM0JrTWlJNk9Td2dJbkpoYm1SemQzUXhJanBtWVd4elpTd2dJbkpoYm1SbFpubDNNaUk2Tml3Z0luSmhibVJ6ZDNReUlqcG1ZV3h6WlN3Z0luSmhibVJsWm5sM01TSTZPQ3dnSW5KaGJtUnpkM1F6SWpwbVlXeHpaU3dnSW1SbFptVnVjMmwyWlY5NVlYY3hJam90TmpNc0lDSnlZVzVrYzNkME5DSTZabUZzYzJVc0lDSmtaV1psYm5OcGRtVmZlV0YzSWpvaVFtVjBkR1Z5SUZOM2FYUmphQ0lzSUNKeVlXNWtjM2QwTlNJNlptRnNjMlVzSUNKemQzTndaQ0k2TVN3Z0luSmhibVJ6ZDNRMklqcG1ZV3h6WlN3Z0ltWnJiM0IwY21GdVpEWWlPbHNpZmlKZExDQWljbUZ1WkhOM2REY2lPbVpoYkhObExDQWlabXR2Y0hSeVlXNWtOU0k2V3lKK0lsMHNJQ0p5WVc1a1ptdHNjMnd4SWpvd0xDQWljbUZ1WkdacmJITnNOeUk2TUN3Z0luSmhibVJtYTNKemJERWlPakFzSUNKeVlXNWtabXR5YzJ3Mklqb3dMQ0FpY21GdVpHWnJiSE5zTWlJNk1IMHNJSHNpY21GdVpHWnJjbk5zTWlJNk1Dd2dJbkpoYm1SbWEyeHpiRE1pT2pBc0lDSnlZVzVrWm10eWMyd3pJam93TENBaWNtRnVaR1pyYkhOc05DSTZNQ3dnSW5KaGJtUm1hM0p6YkRRaU9qQXNJQ0p5WVc1a1ptdHNjMncxSWpvd0xDQWljbUZ1WkdacmNuTnNOU0k2TUN3Z0lubGhkMTlzSWpvdE15d2dJbmxoZDE5eUlqb3pMQ0FpZEhKcFoyZGxjbk1pT2xzaWZpSmRMQ0FpZVdGM2JISnlZVzVrSWpwbVlXeHpaU3dnSW5saGQxOWtaV3hoZVNJNk55d2dJbkpoYm1SbWEyeHpiRFlpT2pBc0lDSjVZWGRmYlc5a1gyOW1abk5sZENJNk1Dd2dJbVJ6YkdacmJXOWtJam9pVTNkcGRHTm9aV1FpTENBaVpITnNabXR6YkhOM2RDSTZNakVzSUNKeVlXNWtabXR5YzJ3M0lqb3dMQ0FpWkhOc1ptdHpkM053SWpvMUxDQWlabXR2Y0hSeVlXNWtNU0k2V3lKK0lsMHNJQ0prYzJ4bWEzTnNjbUZ1SWpvd0xDQWlabXR2Y0hSeVlXNWtNaUk2V3lKK0lsMHNJQ0prYzJ4bWEzSmhibk53WkNJNk1Dd2dJbVpyYjNCMGNtRnVaRE1pT2xzaWZpSmRMQ0FpWkhOeVptdHRiMlFpT2lKU1lXNWtiMjBpTENBaVptdHZjSFJ5WVc1a05DSTZXeUorSWwwc0lDSmtjM0ptYTNOc2MzZDBJam93TENBaVpITnlabXR6ZDNOd0lqb3dMQ0FpWkhOeVptdHpiSEpoYmlJNk9Dd2dJbVJ6Y21acmNtRnVjM0JrSWpvMExDQWlabXRzWVdkemQzUWlPakVzSUNKbWEyOXdkSEpoYm1RM0lqcGJJbjRpWFN3Z0ltWnJhVzUyWlhKMElqcG1ZV3h6WlN3Z0ltbHVkbVZ5ZEhOc01TSTZabUZzYzJVc0lDSnlZVzVrYjIweElqcG1ZV3h6WlN3Z0ltbHVkbVZ5ZEhOc01pSTZabUZzYzJVc0lDSnlZVzVrYjIweUlqcG1ZV3h6WlN3Z0ltbHVkbVZ5ZEhOc015STZabUZzYzJVc0lDSnlZVzVrYjIweklqcG1ZV3h6WlN3Z0ltbHVkbVZ5ZEhOc05DSTZabUZzYzJVc0lDSnlZVzVrYjIwMElqcG1ZV3h6WlN3Z0ltbHVkbVZ5ZEhOc05TSTZabUZzYzJVc0lDSnlZVzVrYjIwMUlqcG1ZV3h6WlN3Z0ltbHVkbVZ5ZEhOc05pSTZabUZzYzJVc0lDSnlZVzVrYjIwMklqcG1ZV3h6WlN3Z0ltbHVkbVZ5ZEhOc055STZabUZzYzJVc0lDSnlZVzVrYjIwM0lqcG1ZV3h6WlN3Z0ltUmxabVZ1YzJsMlpWOXdhWFJqYUNJNklsTjBZWFJwWXlJc0lDSnlZVzVrYzJ3eElqb3dMQ0FpY21GdVpITnNNaUk2TUN3Z0luSmhibVJ6YkRNaU9qQXNJQ0prWldabGJuTnBkbVZmY0dsMFkyZ3hJam80T1N3Z0luSmhibVJ6YkRRaU9qQXNJQ0p5WVc1a1pXWndkREVpT2pBc0lDSnlZVzVrYzJ3MUlqb3dMQ0FpWkdWbVpXNXphWFpsWDNCcGRHTm9NaUk2TUN3Z0luSmhibVJ6YkRZaU9qQXNJQ0ppWlhSemQzTndaQ0k2TVN3Z0luSmhibVJ6YkRjaU9qQXNJQ0p5WVc1a1pXWndkRElpT2pBc0lDSm1hMnh6YkRFaU9qQXNJQ0p6ZDNSemJHUXhJam94TENBaVptdHljMnd4SWpvd0xDQWlabXRzYzJ3eUlqb3dMQ0FpWm10eWMyd3lJam93TENBaVptdHNjMnd6SWpvd0xDQWlaR1ZtWlc1emFYWmxYM2xoZHpJaU9qa3NJQ0ptYTNKemJETWlPakFzSUNKbWEyeHpiRFFpT2pBc0lDSm1hM0p6YkRRaU9qQXNJQ0ptYTJ4emJEVWlPakFzSUNKa2FYTnpiQ0k2TUN3Z0ltWnJjbk5zTlNJNk1Dd2dJbmxoZDE5aVlYTmxaQ0k2SWt4dlkyRnNJRlpwWlhjaUxDQWlabXRzYzJ3Mklqb3dMQ0FpYzNkMGMyeGtJam94TUN3Z0ltWnJjbk5zTmlJNk1Dd2dJbWhoYlc1dlgxQkZSVVFpT2pFc0lDSm1hMnh6YkRjaU9qQXNJQ0ppWlhSemQzTndaRE1pT2pFc0lDSm1hM0p6YkRjaU9qQXNJQ0ppWlhSemQzTndaRElpT2pFc0lDSnlZVzVrYzNkME1TSTZabUZzYzJVc0lDSnlZVzVrWldaNWR6SWlPakFzSUNKeVlXNWtjM2QwTWlJNlptRnNjMlVzSUNKeVlXNWtaV1o1ZHpFaU9qQXNJQ0p5WVc1a2MzZDBNeUk2Wm1Gc2MyVXNJQ0prWldabGJuTnBkbVZmZVdGM01TSTZMVGdzSUNKeVlXNWtjM2QwTkNJNlptRnNjMlVzSUNKa1pXWmxibk5wZG1WZmVXRjNJam9pVTNkcGRHTm9JaXdnSW5KaGJtUnpkM1ExSWpwbVlXeHpaU3dnSW5OM2MzQmtJam94TENBaWNtRnVaSE4zZERZaU9tWmhiSE5sTENBaVptdHZjSFJ5WVc1a05pSTZXeUorSWwwc0lDSnlZVzVrYzNkME55STZabUZzYzJVc0lDSm1hMjl3ZEhKaGJtUTFJanBiSW40aVhTd2dJbkpoYm1SbWEyeHpiREVpT2pBc0lDSnlZVzVrWm10c2MydzNJam93TENBaWNtRnVaR1pyY25Oc01TSTZNQ3dnSW5KaGJtUm1hM0p6YkRZaU9qQXNJQ0p5WVc1a1ptdHNjMnd5SWpvd2ZTd2dleUp5WVc1a1ptdHljMnd5SWpvd0xDQWljbUZ1WkdacmJITnNNeUk2TUN3Z0luSmhibVJtYTNKemJETWlPakFzSUNKeVlXNWtabXRzYzJ3MElqb3dMQ0FpY21GdVpHWnJjbk5zTkNJNk1Dd2dJbkpoYm1SbWEyeHpiRFVpT2pBc0lDSnlZVzVrWm10eWMydzFJam93TENBaWVXRjNYMndpT2pBc0lDSjVZWGRmY2lJNk1Dd2dJblJ5YVdkblpYSnpJanBiSW40aVhTd2dJbmxoZDJ4eWNtRnVaQ0k2Wm1Gc2MyVXNJQ0o1WVhkZlpHVnNZWGtpT2pBc0lDSnlZVzVrWm10c2MydzJJam93TENBaWVXRjNYMjF2WkY5dlptWnpaWFFpT2pBc0lDSmtjMnhtYTIxdlpDSTZJbEpoYm1SdmJTSXNJQ0prYzJ4bWEzTnNjM2QwSWpvd0xDQWljbUZ1WkdacmNuTnNOeUk2TUN3Z0ltUnpiR1pyYzNkemNDSTZNQ3dnSW1acmIzQjBjbUZ1WkRFaU9sc2lmaUpkTENBaVpITnNabXR6YkhKaGJpSTZNakFzSUNKbWEyOXdkSEpoYm1ReUlqcGJJbjRpWFN3Z0ltUnpiR1pyY21GdWMzQmtJam80TENBaVptdHZjSFJ5WVc1a015STZXeUorSWwwc0lDSmtjM0ptYTIxdlpDSTZJbE4zYVhSamFHVmtJaXdnSW1acmIzQjBjbUZ1WkRRaU9sc2lmaUpkTENBaVpITnlabXR6YkhOM2RDSTZOeXdnSW1SemNtWnJjM2R6Y0NJNk1qVXNJQ0prYzNKbWEzTnNjbUZ1SWpvd0xDQWlaSE55Wm10eVlXNXpjR1FpT2pBc0lDSm1hMnhoWjNOM2RDSTZNU3dnSW1acmIzQjBjbUZ1WkRjaU9sc2lmaUpkTENBaVptdHBiblpsY25RaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3eElqcG1ZV3h6WlN3Z0luSmhibVJ2YlRFaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3eUlqcG1ZV3h6WlN3Z0luSmhibVJ2YlRJaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3eklqcG1ZV3h6WlN3Z0luSmhibVJ2YlRNaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3MElqcG1ZV3h6WlN3Z0luSmhibVJ2YlRRaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3MUlqcG1ZV3h6WlN3Z0luSmhibVJ2YlRVaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3MklqcG1ZV3h6WlN3Z0luSmhibVJ2YlRZaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3M0lqcG1ZV3h6WlN3Z0luSmhibVJ2YlRjaU9tWmhiSE5sTENBaVpHVm1aVzV6YVhabFgzQnBkR05vSWpvaVUzUmhkR2xqSWl3Z0luSmhibVJ6YkRFaU9qQXNJQ0p5WVc1a2Myd3lJam93TENBaWNtRnVaSE5zTXlJNk1Dd2dJbVJsWm1WdWMybDJaVjl3YVhSamFERWlPakFzSUNKeVlXNWtjMncwSWpvd0xDQWljbUZ1WkdWbWNIUXhJam93TENBaWNtRnVaSE5zTlNJNk1Dd2dJbVJsWm1WdWMybDJaVjl3YVhSamFESWlPakFzSUNKeVlXNWtjMncySWpvd0xDQWlZbVYwYzNkemNHUWlPakVzSUNKeVlXNWtjMnczSWpvd0xDQWljbUZ1WkdWbWNIUXlJam93TENBaVptdHNjMnd4SWpvd0xDQWljM2QwYzJ4a01TSTZNU3dnSW1acmNuTnNNU0k2TUN3Z0ltWnJiSE5zTWlJNk1Dd2dJbVpyY25Oc01pSTZNQ3dnSW1acmJITnNNeUk2TUN3Z0ltUmxabVZ1YzJsMlpWOTVZWGN5SWpvd0xDQWlabXR5YzJ3eklqb3dMQ0FpWm10c2MydzBJam93TENBaVptdHljMncwSWpvd0xDQWlabXRzYzJ3MUlqb3dMQ0FpWkdsemMyd2lPakFzSUNKbWEzSnpiRFVpT2pBc0lDSjVZWGRmWW1GelpXUWlPaUpNYjJOaGJDQldhV1YzSWl3Z0ltWnJiSE5zTmlJNk1Dd2dJbk4zZEhOc1pDSTZNU3dnSW1acmNuTnNOaUk2TUN3Z0ltaGhiVzV2WDFCRlJVUWlPakVzSUNKbWEyeHpiRGNpT2pBc0lDSmlaWFJ6ZDNOd1pETWlPakVzSUNKbWEzSnpiRGNpT2pBc0lDSmlaWFJ6ZDNOd1pESWlPakVzSUNKeVlXNWtjM2QwTVNJNlptRnNjMlVzSUNKeVlXNWtaV1o1ZHpJaU9qQXNJQ0p5WVc1a2MzZDBNaUk2Wm1Gc2MyVXNJQ0p5WVc1a1pXWjVkekVpT2pBc0lDSnlZVzVrYzNkME15STZabUZzYzJVc0lDSmtaV1psYm5OcGRtVmZlV0YzTVNJNk1Dd2dJbkpoYm1SemQzUTBJanBtWVd4elpTd2dJbVJsWm1WdWMybDJaVjk1WVhjaU9pSlRkR0YwYVdNaUxDQWljbUZ1WkhOM2REVWlPbVpoYkhObExDQWljM2R6Y0dRaU9qRXNJQ0p5WVc1a2MzZDBOaUk2Wm1Gc2MyVXNJQ0ptYTI5d2RISmhibVEySWpwYkluNGlYU3dnSW5KaGJtUnpkM1EzSWpwbVlXeHpaU3dnSW1acmIzQjBjbUZ1WkRVaU9sc2lmaUpkTENBaWNtRnVaR1pyYkhOc01TSTZNQ3dnSW5KaGJtUm1hMnh6YkRjaU9qQXNJQ0p5WVc1a1ptdHljMnd4SWpvd0xDQWljbUZ1WkdacmNuTnNOaUk2TUN3Z0luSmhibVJtYTJ4emJESWlPakI5WFN3Z2V5SjBjbWxuWjJWeWMzQm9jeUk2V3lKU2IzVnVaQ0JUZEdGeWRDSXNJQ0orSWwxOVhRPT0iLCBbIlJvdW5kIFN0YXJ0Il1dLCBbIjIiLCAiVzF0N0luTnNNU0k2TUN3Z0ltUmxjM2x1WTE5bWNtVmxjM1JoYm1RaU9pSlBabVlpTENBaWMyd3lJam93TENBaWMyd3pJam93TENBaVpHVm1aVzV6YVhabFgyRmhJanAwY25WbExDQWljMncwSWpvd0xDQWlaR2x6WkdWbWN5STZabUZzYzJVc0lDSnpiRFVpT2pBc0lDSm1hMnhoWjJ4MElqcG1ZV3h6WlN3Z0luTnNkR2xqYXlJNk5Td2dJbXhqWDJWdVlXSnNaU0k2ZEhKMVpTd2dJbk5zTVRkM0lqb3dMQ0FpYzJ3eU4zY2lPakFzSUNKemJETTNkeUk2TUN3Z0luTnNORGQzSWpvd0xDQWljMncxTjNjaU9qQXNJQ0p6YkRZM2R5STZNQ3dnSW5Oc056ZDNJam93TENBaWVXRjNZbUZ6WldRaU9pSkNZV05yZDJGeVpDSXNJQ0ppYjJSNVgzbGhkeUk2ZEhKMVpTd2dJbmxoZDE5dGIyUnBabWxsY2lJNklrTmxiblJsY2lJc0lDSmtaWE41Ym1OZmJDSTZOVFlzSUNKc1kxOWxibUZpYkdWZmIyNGlPbHN4TENBeUxDQWlmaUpkTENBaWVXRjNJam9pVTNkcGRHTm9aV1FpTENBaVpHVnplVzVqWDNJaU9qTXpMQ0FpWm1GclpWOXZjSFJwYjI1eklqcGJJa0YyYjJsa0lFOTJaWEpzWVhBaUxDQWlTbWwwZEdWeUlpd2dJbjRpWFgwc0lIc2ljMnd4SWpvd0xDQWlaR1Z6ZVc1algyWnlaV1Z6ZEdGdVpDSTZJazltWmlJc0lDSnpiRElpT2pBc0lDSnpiRE1pT2pBc0lDSmtaV1psYm5OcGRtVmZZV0VpT25SeWRXVXNJQ0p6YkRRaU9qQXNJQ0prYVhOa1pXWnpJanBtWVd4elpTd2dJbk5zTlNJNk1Dd2dJbVpyYkdGbmJIUWlPblJ5ZFdVc0lDSnpiSFJwWTJzaU9qVXNJQ0pzWTE5bGJtRmliR1VpT25SeWRXVXNJQ0p6YkRFM2R5STZNVElzSUNKemJESTNkeUk2T0N3Z0luTnNNemQzSWpvMExDQWljMncwTjNjaU9qZ3NJQ0p6YkRVM2R5STZPU3dnSW5Oc05qZDNJam80TENBaWMydzNOM2NpT2prc0lDSjVZWGRpWVhObFpDSTZJa0poWTJ0M1lYSmtJaXdnSW1KdlpIbGZlV0YzSWpwMGNuVmxMQ0FpZVdGM1gyMXZaR2xtYVdWeUlqb2lRM1Z6ZEc5dElEY3RWMkY1SWl3Z0ltUmxjM2x1WTE5c0lqbzJNQ3dnSW14algyVnVZV0pzWlY5dmJpSTZXekVzSURJc0lDSitJbDBzSUNKNVlYY2lPaUpFWldaaGRXeDBJaXdnSW1SbGMzbHVZMTl5SWpveU5Td2dJbVpoYTJWZmIzQjBhVzl1Y3lJNld5SkthWFIwWlhJaUxDQWlVbUZ1Wkc5dGFYcGxJRXBwZEhSbGNpSXNJQ0orSWwxOUxDQjdJbk5zTVNJNk1Dd2dJbVJsYzNsdVkxOW1jbVZsYzNSaGJtUWlPaUpQWm1ZaUxDQWljMnd5SWpvd0xDQWljMnd6SWpvd0xDQWlaR1ZtWlc1emFYWmxYMkZoSWpwMGNuVmxMQ0FpYzJ3MElqb3dMQ0FpWkdselpHVm1jeUk2Wm1Gc2MyVXNJQ0p6YkRVaU9qQXNJQ0ptYTJ4aFoyeDBJanAwY25WbExDQWljMngwYVdOcklqbzFMQ0FpYkdOZlpXNWhZbXhsSWpwMGNuVmxMQ0FpYzJ3eE4zY2lPakFzSUNKemJESTNkeUk2TUN3Z0luTnNNemQzSWpvd0xDQWljMncwTjNjaU9qQXNJQ0p6YkRVM2R5STZNQ3dnSW5Oc05qZDNJam93TENBaWMydzNOM2NpT2pBc0lDSjVZWGRpWVhObFpDSTZJa0poWTJ0M1lYSmtJaXdnSW1KdlpIbGZlV0YzSWpwMGNuVmxMQ0FpZVdGM1gyMXZaR2xtYVdWeUlqb2lRMlZ1ZEdWeUlpd2dJbVJsYzNsdVkxOXNJam8xTkN3Z0lteGpYMlZ1WVdKc1pWOXZiaUk2V3pFc0lESXNJQ0orSWwwc0lDSjVZWGNpT2lKVGQybDBZMmhsWkNJc0lDSmtaWE41Ym1OZmNpSTZNeklzSUNKbVlXdGxYMjl3ZEdsdmJuTWlPbHNpU21sMGRHVnlJaXdnSWxKaGJtUnZiV2w2WlNCS2FYUjBaWElpTENBaWZpSmRmU3dnZXlKemJERWlPakFzSUNKa1pYTjVibU5mWm5KbFpYTjBZVzVrSWpvaVQyWm1JaXdnSW5Oc01pSTZNQ3dnSW5Oc015STZNQ3dnSW1SbFptVnVjMmwyWlY5aFlTSTZkSEoxWlN3Z0luTnNOQ0k2TUN3Z0ltUnBjMlJsWm5NaU9tWmhiSE5sTENBaWMydzFJam93TENBaVptdHNZV2RzZENJNmRISjFaU3dnSW5Oc2RHbGpheUk2TlN3Z0lteGpYMlZ1WVdKc1pTSTZkSEoxWlN3Z0luTnNNVGQzSWpvd0xDQWljMnd5TjNjaU9qQXNJQ0p6YkRNM2R5STZNQ3dnSW5Oc05EZDNJam93TENBaWMydzFOM2NpT2pBc0lDSnpiRFkzZHlJNk1Dd2dJbk5zTnpkM0lqb3dMQ0FpZVdGM1ltRnpaV1FpT2lKQ1lXTnJkMkZ5WkNJc0lDSmliMlI1WDNsaGR5STZkSEoxWlN3Z0lubGhkMTl0YjJScFptbGxjaUk2SWtObGJuUmxjaUlzSUNKa1pYTjVibU5mYkNJNk1qUXNJQ0pzWTE5bGJtRmliR1ZmYjI0aU9sc3hMQ0F5TENBaWZpSmRMQ0FpZVdGM0lqb2lVM2RwZEdOb1pXUWlMQ0FpWkdWemVXNWpYM0lpT2pVeExDQWlabUZyWlY5dmNIUnBiMjV6SWpwYklrcHBkSFJsY2lJc0lDSitJbDE5TENCN0luTnNNU0k2TUN3Z0ltUmxjM2x1WTE5bWNtVmxjM1JoYm1RaU9pSlBabVlpTENBaWMyd3lJam93TENBaWMyd3pJam93TENBaVpHVm1aVzV6YVhabFgyRmhJanAwY25WbExDQWljMncwSWpvd0xDQWlaR2x6WkdWbWN5STZabUZzYzJVc0lDSnpiRFVpT2pBc0lDSm1hMnhoWjJ4MElqcDBjblZsTENBaWMyeDBhV05ySWpvMUxDQWliR05mWlc1aFlteGxJanAwY25WbExDQWljMnd4TjNjaU9qQXNJQ0p6YkRJM2R5STZNQ3dnSW5Oc016ZDNJam93TENBaWMydzBOM2NpT2pBc0lDSnpiRFUzZHlJNk1Dd2dJbk5zTmpkM0lqb3dMQ0FpYzJ3M04zY2lPakFzSUNKNVlYZGlZWE5sWkNJNklrSmhZMnQzWVhKa0lpd2dJbUp2WkhsZmVXRjNJanAwY25WbExDQWllV0YzWDIxdlpHbG1hV1Z5SWpvaVEyVnVkR1Z5SWl3Z0ltUmxjM2x1WTE5c0lqbzFPQ3dnSW14algyVnVZV0pzWlY5dmJpSTZXekVzSURJc0lDSitJbDBzSUNKNVlYY2lPaUpUZDJsMFkyaGxaQ0lzSUNKa1pYTjVibU5mY2lJNk1qRXNJQ0ptWVd0bFgyOXdkR2x2Ym5NaU9sc2lTbWwwZEdWeUlpd2dJbEpoYm1SdmJXbDZaU0JLYVhSMFpYSWlMQ0FpZmlKZGZTd2dleUp6YkRFaU9qQXNJQ0prWlhONWJtTmZabkpsWlhOMFlXNWtJam9pVDJabUlpd2dJbk5zTWlJNk1Dd2dJbk5zTXlJNk1Dd2dJbVJsWm1WdWMybDJaVjloWVNJNmRISjFaU3dnSW5Oc05DSTZNQ3dnSW1ScGMyUmxabk1pT21aaGJITmxMQ0FpYzJ3MUlqb3dMQ0FpWm10c1lXZHNkQ0k2Wm1Gc2MyVXNJQ0p6YkhScFkyc2lPalVzSUNKc1kxOWxibUZpYkdVaU9uUnlkV1VzSUNKemJERTNkeUk2TUN3Z0luTnNNamQzSWpvd0xDQWljMnd6TjNjaU9qQXNJQ0p6YkRRM2R5STZNQ3dnSW5Oc05UZDNJam93TENBaWMydzJOM2NpT2pBc0lDSnpiRGMzZHlJNk1Dd2dJbmxoZDJKaGMyVmtJam9pUW1GamEzZGhjbVFpTENBaVltOWtlVjk1WVhjaU9uUnlkV1VzSUNKNVlYZGZiVzlrYVdacFpYSWlPaUpEWlc1MFpYSWlMQ0FpWkdWemVXNWpYMndpT2pJM0xDQWliR05mWlc1aFlteGxYMjl1SWpwYk1Td2dNaXdnSW40aVhTd2dJbmxoZHlJNklsTjNhWFJqYUdWa0lpd2dJbVJsYzNsdVkxOXlJam94TWl3Z0ltWmhhMlZmYjNCMGFXOXVjeUk2V3lKQmRtOXBaQ0JQZG1WeWJHRndJaXdnSWtwcGRIUmxjaUlzSUNKK0lsMTlMQ0I3SW5Oc01TSTZNQ3dnSW1SbGMzbHVZMTltY21WbGMzUmhibVFpT2lKUFptWWlMQ0FpYzJ3eUlqb3dMQ0FpYzJ3eklqb3dMQ0FpWkdWbVpXNXphWFpsWDJGaElqcG1ZV3h6WlN3Z0luTnNOQ0k2TUN3Z0ltUnBjMlJsWm5NaU9tWmhiSE5sTENBaWMydzFJam93TENBaVptdHNZV2RzZENJNlptRnNjMlVzSUNKemJIUnBZMnNpT2pVc0lDSnNZMTlsYm1GaWJHVWlPblJ5ZFdVc0lDSnpiREUzZHlJNk1Dd2dJbk5zTWpkM0lqb3dMQ0FpYzJ3ek4zY2lPakFzSUNKemJEUTNkeUk2TUN3Z0luTnNOVGQzSWpvd0xDQWljMncyTjNjaU9qQXNJQ0p6YkRjM2R5STZNQ3dnSW5saGQySmhjMlZrSWpvaVFtRmphM2RoY21RaUxDQWlZbTlrZVY5NVlYY2lPblJ5ZFdVc0lDSjVZWGRmYlc5a2FXWnBaWElpT2lKRFpXNTBaWElpTENBaVpHVnplVzVqWDJ3aU9qUTFMQ0FpYkdOZlpXNWhZbXhsWDI5dUlqcGJNU3dnTWl3Z0luNGlYU3dnSW5saGR5STZJa1JsWm1GMWJIUWlMQ0FpWkdWemVXNWpYM0lpT2pFMUxDQWlabUZyWlY5dmNIUnBiMjV6SWpwYklrRjJiMmxrSUU5MlpYSnNZWEFpTENBaVNtbDBkR1Z5SWl3Z0luNGlYWDFkTENCYmV5SnlZVzVrWm10eWMyd3lJam93TENBaWNtRnVaR1pyYkhOc015STZNQ3dnSW5KaGJtUm1hM0p6YkRNaU9qQXNJQ0p5WVc1a1ptdHNjMncwSWpvd0xDQWljbUZ1WkdacmNuTnNOQ0k2TUN3Z0luSmhibVJtYTJ4emJEVWlPakFzSUNKeVlXNWtabXR5YzJ3MUlqb3dMQ0FpZVdGM1gyd2lPaTA0TENBaWVXRjNYM0lpT2prc0lDSjBjbWxuWjJWeWN5STZXeUorSWwwc0lDSjVZWGRzY25KaGJtUWlPbVpoYkhObExDQWllV0YzWDJSbGJHRjVJam8xTENBaWNtRnVaR1pyYkhOc05pSTZNQ3dnSW5saGQxOXRiMlJmYjJabWMyVjBJam93TENBaVpITnNabXR0YjJRaU9pSlRkMmwwWTJobFpDSXNJQ0prYzJ4bWEzTnNjM2QwSWpvek9Dd2dJbkpoYm1SbWEzSnpiRGNpT2pBc0lDSmtjMnhtYTNOM2MzQWlPamtzSUNKbWEyOXdkSEpoYm1ReElqcGJJbjRpWFN3Z0ltUnpiR1pyYzJ4eVlXNGlPakFzSUNKbWEyOXdkSEpoYm1ReUlqcGJJbjRpWFN3Z0ltUnpiR1pyY21GdWMzQmtJam93TENBaVptdHZjSFJ5WVc1a015STZXeUorSWwwc0lDSmtjM0ptYTIxdlpDSTZJbE4zYVhSamFHVmtJaXdnSW1acmIzQjBjbUZ1WkRRaU9sc2lmaUpkTENBaVpITnlabXR6YkhOM2RDSTZNVGNzSUNKa2MzSm1hM04zYzNBaU9qRXhMQ0FpWkhOeVptdHpiSEpoYmlJNk1Dd2dJbVJ6Y21acmNtRnVjM0JrSWpvd0xDQWlabXRzWVdkemQzUWlPakVzSUNKbWEyOXdkSEpoYm1RM0lqcGJJbjRpWFN3Z0ltWnJhVzUyWlhKMElqcG1ZV3h6WlN3Z0ltbHVkbVZ5ZEhOc01TSTZabUZzYzJVc0lDSnlZVzVrYjIweElqcG1ZV3h6WlN3Z0ltbHVkbVZ5ZEhOc01pSTZabUZzYzJVc0lDSnlZVzVrYjIweUlqcG1ZV3h6WlN3Z0ltbHVkbVZ5ZEhOc015STZabUZzYzJVc0lDSnlZVzVrYjIweklqcG1ZV3h6WlN3Z0ltbHVkbVZ5ZEhOc05DSTZabUZzYzJVc0lDSnlZVzVrYjIwMElqcG1ZV3h6WlN3Z0ltbHVkbVZ5ZEhOc05TSTZabUZzYzJVc0lDSnlZVzVrYjIwMUlqcG1ZV3h6WlN3Z0ltbHVkbVZ5ZEhOc05pSTZabUZzYzJVc0lDSnlZVzVrYjIwMklqcG1ZV3h6WlN3Z0ltbHVkbVZ5ZEhOc055STZabUZzYzJVc0lDSnlZVzVrYjIwM0lqcG1ZV3h6WlN3Z0ltUmxabVZ1YzJsMlpWOXdhWFJqYUNJNklsTjBZWFJwWXlJc0lDSnlZVzVrYzJ3eElqb3dMQ0FpY21GdVpITnNNaUk2TUN3Z0luSmhibVJ6YkRNaU9qQXNJQ0prWldabGJuTnBkbVZmY0dsMFkyZ3hJam80T1N3Z0luSmhibVJ6YkRRaU9qQXNJQ0p5WVc1a1pXWndkREVpT2pBc0lDSnlZVzVrYzJ3MUlqb3dMQ0FpWkdWbVpXNXphWFpsWDNCcGRHTm9NaUk2TUN3Z0luSmhibVJ6YkRZaU9qQXNJQ0ppWlhSemQzTndaQ0k2TVN3Z0luSmhibVJ6YkRjaU9qQXNJQ0p5WVc1a1pXWndkRElpT2pBc0lDSm1hMnh6YkRFaU9qQXNJQ0p6ZDNSemJHUXhJam94TENBaVptdHljMnd4SWpvd0xDQWlabXRzYzJ3eUlqb3dMQ0FpWm10eWMyd3lJam93TENBaVptdHNjMnd6SWpvd0xDQWlaR1ZtWlc1emFYWmxYM2xoZHpJaU9qWXNJQ0ptYTNKemJETWlPakFzSUNKbWEyeHpiRFFpT2pBc0lDSm1hM0p6YkRRaU9qQXNJQ0ptYTJ4emJEVWlPakFzSUNKa2FYTnpiQ0k2TUN3Z0ltWnJjbk5zTlNJNk1Dd2dJbmxoZDE5aVlYTmxaQ0k2SWt4dlkyRnNJRlpwWlhjaUxDQWlabXRzYzJ3Mklqb3dMQ0FpYzNkMGMyeGtJam94TENBaVptdHljMncySWpvd0xDQWlhR0Z0Ym05ZlVFVkZSQ0k2TVN3Z0ltWnJiSE5zTnlJNk1Dd2dJbUpsZEhOM2MzQmtNeUk2TVN3Z0ltWnJjbk5zTnlJNk1Dd2dJbUpsZEhOM2MzQmtNaUk2TVRFc0lDSnlZVzVrYzNkME1TSTZabUZzYzJVc0lDSnlZVzVrWldaNWR6SWlPaklzSUNKeVlXNWtjM2QwTWlJNlptRnNjMlVzSUNKeVlXNWtaV1o1ZHpFaU9qRXNJQ0p5WVc1a2MzZDBNeUk2Wm1Gc2MyVXNJQ0prWldabGJuTnBkbVZmZVdGM01TSTZMVGdzSUNKeVlXNWtjM2QwTkNJNlptRnNjMlVzSUNKa1pXWmxibk5wZG1WZmVXRjNJam9pUW1WMGRHVnlJRk4zYVhSamFDSXNJQ0p5WVc1a2MzZDBOU0k2Wm1Gc2MyVXNJQ0p6ZDNOd1pDSTZNU3dnSW5KaGJtUnpkM1EySWpwbVlXeHpaU3dnSW1acmIzQjBjbUZ1WkRZaU9sc2lmaUpkTENBaWNtRnVaSE4zZERjaU9tWmhiSE5sTENBaVptdHZjSFJ5WVc1a05TSTZXeUorSWwwc0lDSnlZVzVrWm10c2Myd3hJam93TENBaWNtRnVaR1pyYkhOc055STZNQ3dnSW5KaGJtUm1hM0p6YkRFaU9qQXNJQ0p5WVc1a1ptdHljMncySWpvd0xDQWljbUZ1WkdacmJITnNNaUk2TUgwc0lIc2ljbUZ1WkdacmNuTnNNaUk2TlN3Z0luSmhibVJtYTJ4emJETWlPakFzSUNKeVlXNWtabXR5YzJ3eklqb3dMQ0FpY21GdVpHWnJiSE5zTkNJNk1Td2dJbkpoYm1SbWEzSnpiRFFpT2pRc0lDSnlZVzVrWm10c2MydzFJam8xTENBaWNtRnVaR1pyY25Oc05TSTZNaXdnSW5saGQxOXNJam93TENBaWVXRjNYM0lpT2pBc0lDSjBjbWxuWjJWeWN5STZXekVzSUNKK0lsMHNJQ0o1WVhkc2NuSmhibVFpT21aaGJITmxMQ0FpZVdGM1gyUmxiR0Y1SWpvd0xDQWljbUZ1WkdacmJITnNOaUk2TkN3Z0lubGhkMTl0YjJSZmIyWm1jMlYwSWpvd0xDQWlaSE5zWm10dGIyUWlPaUpUZDJsMFkyaGxaQ0lzSUNKa2MyeG1hM05zYzNkMElqb3pNU3dnSW5KaGJtUm1hM0p6YkRjaU9qVXNJQ0prYzJ4bWEzTjNjM0FpT2pFeExDQWlabXR2Y0hSeVlXNWtNU0k2V3lKQmRtOXBaQ0JQZG1WeWJHRndJaXdnSWtwcGRIUmxjaUlzSUNKK0lsMHNJQ0prYzJ4bWEzTnNjbUZ1SWpvd0xDQWlabXR2Y0hSeVlXNWtNaUk2V3lKS2FYUjBaWElpTENBaWZpSmRMQ0FpWkhOc1ptdHlZVzV6Y0dRaU9qQXNJQ0ptYTI5d2RISmhibVF6SWpwYklrcHBkSFJsY2lJc0lDSlNZVzVrYjIxcGVtVWdTbWwwZEdWeUlpd2dJbjRpWFN3Z0ltUnpjbVpyYlc5a0lqb2lVM2RwZEdOb1pXUWlMQ0FpWm10dmNIUnlZVzVrTkNJNld5SkthWFIwWlhJaUxDQWlmaUpkTENBaVpITnlabXR6YkhOM2RDSTZNVEVzSUNKa2MzSm1hM04zYzNBaU9qVXNJQ0prYzNKbWEzTnNjbUZ1SWpvd0xDQWlaSE55Wm10eVlXNXpjR1FpT2pBc0lDSm1hMnhoWjNOM2RDSTZNeXdnSW1acmIzQjBjbUZ1WkRjaU9sc2lRWFp2YVdRZ1QzWmxjbXhoY0NJc0lDSkthWFIwWlhJaUxDQWlmaUpkTENBaVptdHBiblpsY25RaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3eElqcDBjblZsTENBaWNtRnVaRzl0TVNJNmRISjFaU3dnSW1sdWRtVnlkSE5zTWlJNlptRnNjMlVzSUNKeVlXNWtiMjB5SWpwMGNuVmxMQ0FpYVc1MlpYSjBjMnd6SWpwbVlXeHpaU3dnSW5KaGJtUnZiVE1pT25SeWRXVXNJQ0pwYm5abGNuUnpiRFFpT25SeWRXVXNJQ0p5WVc1a2IyMDBJanAwY25WbExDQWlhVzUyWlhKMGMydzFJanAwY25WbExDQWljbUZ1Wkc5dE5TSTZkSEoxWlN3Z0ltbHVkbVZ5ZEhOc05pSTZabUZzYzJVc0lDSnlZVzVrYjIwMklqcDBjblZsTENBaWFXNTJaWEowYzJ3M0lqcG1ZV3h6WlN3Z0luSmhibVJ2YlRjaU9uUnlkV1VzSUNKa1pXWmxibk5wZG1WZmNHbDBZMmdpT2lKQ1pYUjBaWElnVW1GdVpHOXRJaXdnSW5KaGJtUnpiREVpT2pNc0lDSnlZVzVrYzJ3eUlqb3hMQ0FpY21GdVpITnNNeUk2TUN3Z0ltUmxabVZ1YzJsMlpWOXdhWFJqYURFaU9pMDNPU3dnSW5KaGJtUnpiRFFpT2pJc0lDSnlZVzVrWldad2RERWlPakFzSUNKeVlXNWtjMncxSWpveExDQWlaR1ZtWlc1emFYWmxYM0JwZEdOb01pSTZMVFVzSUNKeVlXNWtjMncySWpvekxDQWlZbVYwYzNkemNHUWlPalFzSUNKeVlXNWtjMnczSWpvekxDQWljbUZ1WkdWbWNIUXlJam93TENBaVptdHNjMnd4SWpvek9Td2dJbk4zZEhOc1pERWlPakVzSUNKbWEzSnpiREVpT2pFMUxDQWlabXRzYzJ3eUlqb3hPQ3dnSW1acmNuTnNNaUk2TXprc0lDSm1hMnh6YkRNaU9qUTRMQ0FpWkdWbVpXNXphWFpsWDNsaGR6SWlPakl3TENBaVptdHljMnd6SWpvMU15d2dJbVpyYkhOc05DSTZNVEVzSUNKbWEzSnpiRFFpT2pRMExDQWlabXRzYzJ3MUlqbzFNeXdnSW1ScGMzTnNJam93TENBaVptdHljMncxSWpveE9Dd2dJbmxoZDE5aVlYTmxaQ0k2SWt4dlkyRnNJRlpwWlhjaUxDQWlabXRzYzJ3MklqbzFOU3dnSW5OM2RITnNaQ0k2TVN3Z0ltWnJjbk5zTmlJNk1Ua3NJQ0pvWVcxdWIxOVFSVVZFSWpvM0xDQWlabXRzYzJ3M0lqb3hNeXdnSW1KbGRITjNjM0JrTXlJNk1Td2dJbVpyY25Oc055STZOVEFzSUNKaVpYUnpkM053WkRJaU9qRXNJQ0p5WVc1a2MzZDBNU0k2ZEhKMVpTd2dJbkpoYm1SbFpubDNNaUk2TUN3Z0luSmhibVJ6ZDNReUlqcDBjblZsTENBaWNtRnVaR1ZtZVhjeElqb3dMQ0FpY21GdVpITjNkRE1pT21aaGJITmxMQ0FpWkdWbVpXNXphWFpsWDNsaGR6RWlPaTB4TlN3Z0luSmhibVJ6ZDNRMElqcDBjblZsTENBaVpHVm1aVzV6YVhabFgzbGhkeUk2SWxOM1lYa2lMQ0FpY21GdVpITjNkRFVpT25SeWRXVXNJQ0p6ZDNOd1pDSTZNU3dnSW5KaGJtUnpkM1EySWpwMGNuVmxMQ0FpWm10dmNIUnlZVzVrTmlJNld5SkthWFIwWlhJaUxDQWlmaUpkTENBaWNtRnVaSE4zZERjaU9uUnlkV1VzSUNKbWEyOXdkSEpoYm1RMUlqcGJJa0YyYjJsa0lFOTJaWEpzWVhBaUxDQWlTbWwwZEdWeUlpd2dJbjRpWFN3Z0luSmhibVJtYTJ4emJERWlPakU0TENBaWNtRnVaR1pyYkhOc055STZNeXdnSW5KaGJtUm1hM0p6YkRFaU9qVXNJQ0p5WVc1a1ptdHljMncySWpveExDQWljbUZ1WkdacmJITnNNaUk2TTMwc0lIc2ljbUZ1WkdacmNuTnNNaUk2TUN3Z0luSmhibVJtYTJ4emJETWlPakFzSUNKeVlXNWtabXR5YzJ3eklqb3dMQ0FpY21GdVpHWnJiSE5zTkNJNk1Dd2dJbkpoYm1SbWEzSnpiRFFpT2pBc0lDSnlZVzVrWm10c2MydzFJam93TENBaWNtRnVaR1pyY25Oc05TSTZNQ3dnSW5saGQxOXNJam90TVRRc0lDSjVZWGRmY2lJNk1UWXNJQ0owY21sbloyVnljeUk2V3lKK0lsMHNJQ0o1WVhkc2NuSmhibVFpT21aaGJITmxMQ0FpZVdGM1gyUmxiR0Y1SWpvekxDQWljbUZ1WkdacmJITnNOaUk2TUN3Z0lubGhkMTl0YjJSZmIyWm1jMlYwSWpvd0xDQWlaSE5zWm10dGIyUWlPaUpUZDJsMFkyaGxaQ0lzSUNKa2MyeG1hM05zYzNkMElqbzBNU3dnSW5KaGJtUm1hM0p6YkRjaU9qQXNJQ0prYzJ4bWEzTjNjM0FpT2pnc0lDSm1hMjl3ZEhKaGJtUXhJanBiSW40aVhTd2dJbVJ6YkdacmMyeHlZVzRpT2pBc0lDSm1hMjl3ZEhKaGJtUXlJanBiSW40aVhTd2dJbVJ6YkdacmNtRnVjM0JrSWpvd0xDQWlabXR2Y0hSeVlXNWtNeUk2V3lKK0lsMHNJQ0prYzNKbWEyMXZaQ0k2SWxOM2FYUmphR1ZrSWl3Z0ltWnJiM0IwY21GdVpEUWlPbHNpZmlKZExDQWlaSE55Wm10emJITjNkQ0k2TWpjc0lDSmtjM0ptYTNOM2MzQWlPakUxTENBaVpITnlabXR6YkhKaGJpSTZNQ3dnSW1SemNtWnJjbUZ1YzNCa0lqb3dMQ0FpWm10c1lXZHpkM1FpT2pFc0lDSm1hMjl3ZEhKaGJtUTNJanBiSW40aVhTd2dJbVpyYVc1MlpYSjBJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNNU0k2Wm1Gc2MyVXNJQ0p5WVc1a2IyMHhJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNNaUk2Wm1Gc2MyVXNJQ0p5WVc1a2IyMHlJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNNeUk2Wm1Gc2MyVXNJQ0p5WVc1a2IyMHpJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNOQ0k2Wm1Gc2MyVXNJQ0p5WVc1a2IyMDBJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNOU0k2Wm1Gc2MyVXNJQ0p5WVc1a2IyMDFJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNOaUk2Wm1Gc2MyVXNJQ0p5WVc1a2IyMDJJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNOeUk2Wm1Gc2MyVXNJQ0p5WVc1a2IyMDNJanBtWVd4elpTd2dJbVJsWm1WdWMybDJaVjl3YVhSamFDSTZJa0psZEhSbGNpQlNZVzVrYjIwaUxDQWljbUZ1WkhOc01TSTZNQ3dnSW5KaGJtUnpiRElpT2pBc0lDSnlZVzVrYzJ3eklqb3dMQ0FpWkdWbVpXNXphWFpsWDNCcGRHTm9NU0k2TFRZMUxDQWljbUZ1WkhOc05DSTZNQ3dnSW5KaGJtUmxabkIwTVNJNk1Dd2dJbkpoYm1SemJEVWlPakFzSUNKa1pXWmxibk5wZG1WZmNHbDBZMmd5SWpveE1pd2dJbkpoYm1SemJEWWlPakFzSUNKaVpYUnpkM053WkNJNk5pd2dJbkpoYm1SemJEY2lPakFzSUNKeVlXNWtaV1p3ZERJaU9qQXNJQ0ptYTJ4emJERWlPakFzSUNKemQzUnpiR1F4SWpveExDQWlabXR5YzJ3eElqb3dMQ0FpWm10c2Myd3lJam93TENBaVptdHljMnd5SWpvd0xDQWlabXRzYzJ3eklqb3dMQ0FpWkdWbVpXNXphWFpsWDNsaGR6SWlPalEwTENBaVptdHljMnd6SWpvd0xDQWlabXRzYzJ3MElqb3dMQ0FpWm10eWMydzBJam93TENBaVptdHNjMncxSWpvd0xDQWlaR2x6YzJ3aU9qQXNJQ0ptYTNKemJEVWlPakFzSUNKNVlYZGZZbUZ6WldRaU9pSk1iMk5oYkNCV2FXVjNJaXdnSW1acmJITnNOaUk2TUN3Z0luTjNkSE5zWkNJNk1Td2dJbVpyY25Oc05pSTZNQ3dnSW1oaGJXNXZYMUJGUlVRaU9qRXNJQ0ptYTJ4emJEY2lPakFzSUNKaVpYUnpkM053WkRNaU9qTXNJQ0ptYTNKemJEY2lPakFzSUNKaVpYUnpkM053WkRJaU9qRXNJQ0p5WVc1a2MzZDBNU0k2Wm1Gc2MyVXNJQ0p5WVc1a1pXWjVkeklpT2pBc0lDSnlZVzVrYzNkME1pSTZabUZzYzJVc0lDSnlZVzVrWldaNWR6RWlPakFzSUNKeVlXNWtjM2QwTXlJNlptRnNjMlVzSUNKa1pXWmxibk5wZG1WZmVXRjNNU0k2TFRRNUxDQWljbUZ1WkhOM2REUWlPbVpoYkhObExDQWlaR1ZtWlc1emFYWmxYM2xoZHlJNklrSmxkSFJsY2lCU1lXNWtiMjBpTENBaWNtRnVaSE4zZERVaU9tWmhiSE5sTENBaWMzZHpjR1FpT2pFc0lDSnlZVzVrYzNkME5pSTZabUZzYzJVc0lDSm1hMjl3ZEhKaGJtUTJJanBiSW40aVhTd2dJbkpoYm1SemQzUTNJanBtWVd4elpTd2dJbVpyYjNCMGNtRnVaRFVpT2xzaWZpSmRMQ0FpY21GdVpHWnJiSE5zTVNJNk1Dd2dJbkpoYm1SbWEyeHpiRGNpT2pBc0lDSnlZVzVrWm10eWMyd3hJam93TENBaWNtRnVaR1pyY25Oc05pSTZNQ3dnSW5KaGJtUm1hMnh6YkRJaU9qQjlMQ0I3SW5KaGJtUm1hM0p6YkRJaU9qQXNJQ0p5WVc1a1ptdHNjMnd6SWpvd0xDQWljbUZ1WkdacmNuTnNNeUk2TUN3Z0luSmhibVJtYTJ4emJEUWlPakFzSUNKeVlXNWtabXR5YzJ3MElqb3dMQ0FpY21GdVpHWnJiSE5zTlNJNk1Dd2dJbkpoYm1SbWEzSnpiRFVpT2pBc0lDSjVZWGRmYkNJNkxURTFMQ0FpZVdGM1gzSWlPakUzTENBaWRISnBaMmRsY25NaU9sc2lmaUpkTENBaWVXRjNiSEp5WVc1a0lqcG1ZV3h6WlN3Z0lubGhkMTlrWld4aGVTSTZOaXdnSW5KaGJtUm1hMnh6YkRZaU9qQXNJQ0o1WVhkZmJXOWtYMjltWm5ObGRDSTZOQ3dnSW1SemJHWnJiVzlrSWpvaVUzZHBkR05vWldRaUxDQWlaSE5zWm10emJITjNkQ0k2TVRZc0lDSnlZVzVrWm10eWMydzNJam93TENBaVpITnNabXR6ZDNOd0lqbzJMQ0FpWm10dmNIUnlZVzVrTVNJNld5SitJbDBzSUNKa2MyeG1hM05zY21GdUlqb3dMQ0FpWm10dmNIUnlZVzVrTWlJNld5SitJbDBzSUNKa2MyeG1hM0poYm5Od1pDSTZNQ3dnSW1acmIzQjBjbUZ1WkRNaU9sc2lmaUpkTENBaVpITnlabXR0YjJRaU9pSlRkMmwwWTJobFpDSXNJQ0ptYTI5d2RISmhibVEwSWpwYkluNGlYU3dnSW1SemNtWnJjMnh6ZDNRaU9qUXlMQ0FpWkhOeVptdHpkM053SWpveE9Dd2dJbVJ6Y21acmMyeHlZVzRpT2pBc0lDSmtjM0ptYTNKaGJuTndaQ0k2TUN3Z0ltWnJiR0ZuYzNkMElqb3hMQ0FpWm10dmNIUnlZVzVrTnlJNld5SitJbDBzSUNKbWEybHVkbVZ5ZENJNmRISjFaU3dnSW1sdWRtVnlkSE5zTVNJNlptRnNjMlVzSUNKeVlXNWtiMjB4SWpwbVlXeHpaU3dnSW1sdWRtVnlkSE5zTWlJNlptRnNjMlVzSUNKeVlXNWtiMjB5SWpwbVlXeHpaU3dnSW1sdWRtVnlkSE5zTXlJNlptRnNjMlVzSUNKeVlXNWtiMjB6SWpwbVlXeHpaU3dnSW1sdWRtVnlkSE5zTkNJNlptRnNjMlVzSUNKeVlXNWtiMjAwSWpwbVlXeHpaU3dnSW1sdWRtVnlkSE5zTlNJNlptRnNjMlVzSUNKeVlXNWtiMjAxSWpwbVlXeHpaU3dnSW1sdWRtVnlkSE5zTmlJNlptRnNjMlVzSUNKeVlXNWtiMjAySWpwbVlXeHpaU3dnSW1sdWRtVnlkSE5zTnlJNlptRnNjMlVzSUNKeVlXNWtiMjAzSWpwbVlXeHpaU3dnSW1SbFptVnVjMmwyWlY5d2FYUmphQ0k2SWtKbGRIUmxjaUJUZDJsMFkyZ2lMQ0FpY21GdVpITnNNU0k2TUN3Z0luSmhibVJ6YkRJaU9qQXNJQ0p5WVc1a2Myd3pJam93TENBaVpHVm1aVzV6YVhabFgzQnBkR05vTVNJNkxUWTRMQ0FpY21GdVpITnNOQ0k2TUN3Z0luSmhibVJsWm5CME1TSTZOeXdnSW5KaGJtUnpiRFVpT2pBc0lDSmtaV1psYm5OcGRtVmZjR2wwWTJneUlqb3hOU3dnSW5KaGJtUnpiRFlpT2pBc0lDSmlaWFJ6ZDNOd1pDSTZNaXdnSW5KaGJtUnpiRGNpT2pBc0lDSnlZVzVrWldad2RESWlPaklzSUNKbWEyeHpiREVpT2pBc0lDSnpkM1J6YkdReElqb3hNaXdnSW1acmNuTnNNU0k2TUN3Z0ltWnJiSE5zTWlJNk1Dd2dJbVpyY25Oc01pSTZNQ3dnSW1acmJITnNNeUk2TUN3Z0ltUmxabVZ1YzJsMlpWOTVZWGN5SWpvM01pd2dJbVpyY25Oc015STZNQ3dnSW1acmJITnNOQ0k2TUN3Z0ltWnJjbk5zTkNJNk1Dd2dJbVpyYkhOc05TSTZNQ3dnSW1ScGMzTnNJam93TENBaVptdHljMncxSWpvd0xDQWllV0YzWDJKaGMyVmtJam9pVEc5allXd2dWbWxsZHlJc0lDSm1hMnh6YkRZaU9qQXNJQ0p6ZDNSemJHUWlPakVzSUNKbWEzSnpiRFlpT2pBc0lDSm9ZVzF1YjE5UVJVVkVJam81TENBaVptdHNjMnczSWpvd0xDQWlZbVYwYzNkemNHUXpJam8wTENBaVptdHljMnczSWpvd0xDQWlZbVYwYzNkemNHUXlJam94TENBaWNtRnVaSE4zZERFaU9tWmhiSE5sTENBaWNtRnVaR1ZtZVhjeUlqb3dMQ0FpY21GdVpITjNkRElpT21aaGJITmxMQ0FpY21GdVpHVm1lWGN4SWpvd0xDQWljbUZ1WkhOM2RETWlPbVpoYkhObExDQWlaR1ZtWlc1emFYWmxYM2xoZHpFaU9pMDRPQ3dnSW5KaGJtUnpkM1EwSWpwbVlXeHpaU3dnSW1SbFptVnVjMmwyWlY5NVlYY2lPaUpDWlhSMFpYSWdVbUZ1Wkc5dElpd2dJbkpoYm1SemQzUTFJanBtWVd4elpTd2dJbk4zYzNCa0lqb3hMQ0FpY21GdVpITjNkRFlpT21aaGJITmxMQ0FpWm10dmNIUnlZVzVrTmlJNld5SitJbDBzSUNKeVlXNWtjM2QwTnlJNlptRnNjMlVzSUNKbWEyOXdkSEpoYm1RMUlqcGJJbjRpWFN3Z0luSmhibVJtYTJ4emJERWlPakFzSUNKeVlXNWtabXRzYzJ3M0lqb3dMQ0FpY21GdVpHWnJjbk5zTVNJNk1Dd2dJbkpoYm1SbWEzSnpiRFlpT2pBc0lDSnlZVzVrWm10c2Myd3lJam93ZlN3Z2V5SnlZVzVrWm10eWMyd3lJam93TENBaWNtRnVaR1pyYkhOc015STZNQ3dnSW5KaGJtUm1hM0p6YkRNaU9qQXNJQ0p5WVc1a1ptdHNjMncwSWpvd0xDQWljbUZ1WkdacmNuTnNOQ0k2TUN3Z0luSmhibVJtYTJ4emJEVWlPakFzSUNKeVlXNWtabXR5YzJ3MUlqb3dMQ0FpZVdGM1gyd2lPaTB5TVN3Z0lubGhkMTl5SWpveE9Dd2dJblJ5YVdkblpYSnpJanBiSW40aVhTd2dJbmxoZDJ4eWNtRnVaQ0k2Wm1Gc2MyVXNJQ0o1WVhkZlpHVnNZWGtpT2pJc0lDSnlZVzVrWm10c2MydzJJam93TENBaWVXRjNYMjF2WkY5dlptWnpaWFFpT2pBc0lDSmtjMnhtYTIxdlpDSTZJbE4zYVhSamFHVmtJaXdnSW1SemJHWnJjMnh6ZDNRaU9qTTVMQ0FpY21GdVpHWnJjbk5zTnlJNk1Dd2dJbVJ6YkdacmMzZHpjQ0k2TVRRc0lDSm1hMjl3ZEhKaGJtUXhJanBiSW40aVhTd2dJbVJ6YkdacmMyeHlZVzRpT2pBc0lDSm1hMjl3ZEhKaGJtUXlJanBiSW40aVhTd2dJbVJ6YkdacmNtRnVjM0JrSWpvd0xDQWlabXR2Y0hSeVlXNWtNeUk2V3lKK0lsMHNJQ0prYzNKbWEyMXZaQ0k2SWxKaGJtUnZiU0lzSUNKbWEyOXdkSEpoYm1RMElqcGJJbjRpWFN3Z0ltUnpjbVpyYzJ4emQzUWlPakl6TENBaVpITnlabXR6ZDNOd0lqb3dMQ0FpWkhOeVptdHpiSEpoYmlJNk1USXNJQ0prYzNKbWEzSmhibk53WkNJNk15d2dJbVpyYkdGbmMzZDBJam94TENBaVptdHZjSFJ5WVc1a055STZXeUorSWwwc0lDSm1hMmx1ZG1WeWRDSTZabUZzYzJVc0lDSnBiblpsY25SemJERWlPbVpoYkhObExDQWljbUZ1Wkc5dE1TSTZabUZzYzJVc0lDSnBiblpsY25SemJESWlPbVpoYkhObExDQWljbUZ1Wkc5dE1pSTZabUZzYzJVc0lDSnBiblpsY25SemJETWlPbVpoYkhObExDQWljbUZ1Wkc5dE15STZabUZzYzJVc0lDSnBiblpsY25SemJEUWlPbVpoYkhObExDQWljbUZ1Wkc5dE5DSTZabUZzYzJVc0lDSnBiblpsY25SemJEVWlPbVpoYkhObExDQWljbUZ1Wkc5dE5TSTZabUZzYzJVc0lDSnBiblpsY25SemJEWWlPbVpoYkhObExDQWljbUZ1Wkc5dE5pSTZabUZzYzJVc0lDSnBiblpsY25SemJEY2lPbVpoYkhObExDQWljbUZ1Wkc5dE55STZabUZzYzJVc0lDSmtaV1psYm5OcGRtVmZjR2wwWTJnaU9pSkNaWFIwWlhJZ1VtRnVaRzl0SWl3Z0luSmhibVJ6YkRFaU9qQXNJQ0p5WVc1a2Myd3lJam93TENBaWNtRnVaSE5zTXlJNk1Dd2dJbVJsWm1WdWMybDJaVjl3YVhSamFERWlPaTAzTXl3Z0luSmhibVJ6YkRRaU9qQXNJQ0p5WVc1a1pXWndkREVpT2pFekxDQWljbUZ1WkhOc05TSTZNQ3dnSW1SbFptVnVjMmwyWlY5d2FYUmphRElpT2pJMkxDQWljbUZ1WkhOc05pSTZNQ3dnSW1KbGRITjNjM0JrSWpvekxDQWljbUZ1WkhOc055STZNQ3dnSW5KaGJtUmxabkIwTWlJNk16QXNJQ0ptYTJ4emJERWlPakFzSUNKemQzUnpiR1F4SWpveE5pd2dJbVpyY25Oc01TSTZNQ3dnSW1acmJITnNNaUk2TUN3Z0ltWnJjbk5zTWlJNk1Dd2dJbVpyYkhOc015STZNQ3dnSW1SbFptVnVjMmwyWlY5NVlYY3lJam8xTVN3Z0ltWnJjbk5zTXlJNk1Dd2dJbVpyYkhOc05DSTZNQ3dnSW1acmNuTnNOQ0k2TUN3Z0ltWnJiSE5zTlNJNk1Dd2dJbVJwYzNOc0lqb3dMQ0FpWm10eWMydzFJam93TENBaWVXRjNYMkpoYzJWa0lqb2lURzlqWVd3Z1ZtbGxkeUlzSUNKbWEyeHpiRFlpT2pBc0lDSnpkM1J6YkdRaU9qRXNJQ0ptYTNKemJEWWlPakFzSUNKb1lXMXViMTlRUlVWRUlqb3hMQ0FpWm10c2MydzNJam93TENBaVltVjBjM2R6Y0dReklqb3hMQ0FpWm10eWMydzNJam93TENBaVltVjBjM2R6Y0dReUlqbzJMQ0FpY21GdVpITjNkREVpT21aaGJITmxMQ0FpY21GdVpHVm1lWGN5SWpvM0xDQWljbUZ1WkhOM2RESWlPbVpoYkhObExDQWljbUZ1WkdWbWVYY3hJam94TlN3Z0luSmhibVJ6ZDNReklqcG1ZV3h6WlN3Z0ltUmxabVZ1YzJsMlpWOTVZWGN4SWpvdE56QXNJQ0p5WVc1a2MzZDBOQ0k2Wm1Gc2MyVXNJQ0prWldabGJuTnBkbVZmZVdGM0lqb2lRbVYwZEdWeUlGTjNhWFJqYUNJc0lDSnlZVzVrYzNkME5TSTZabUZzYzJVc0lDSnpkM053WkNJNk1Td2dJbkpoYm1SemQzUTJJanBtWVd4elpTd2dJbVpyYjNCMGNtRnVaRFlpT2xzaWZpSmRMQ0FpY21GdVpITjNkRGNpT21aaGJITmxMQ0FpWm10dmNIUnlZVzVrTlNJNld5SitJbDBzSUNKeVlXNWtabXRzYzJ3eElqb3dMQ0FpY21GdVpHWnJiSE5zTnlJNk1Dd2dJbkpoYm1SbWEzSnpiREVpT2pBc0lDSnlZVzVrWm10eWMydzJJam93TENBaWNtRnVaR1pyYkhOc01pSTZNSDBzSUhzaWNtRnVaR1pyY25Oc01pSTZNQ3dnSW5KaGJtUm1hMnh6YkRNaU9qQXNJQ0p5WVc1a1ptdHljMnd6SWpvd0xDQWljbUZ1WkdacmJITnNOQ0k2TUN3Z0luSmhibVJtYTNKemJEUWlPakFzSUNKeVlXNWtabXRzYzJ3MUlqb3dMQ0FpY21GdVpHWnJjbk5zTlNJNk1Dd2dJbmxoZDE5c0lqb3RNeXdnSW5saGQxOXlJam96TENBaWRISnBaMmRsY25NaU9sc2lmaUpkTENBaWVXRjNiSEp5WVc1a0lqcG1ZV3h6WlN3Z0lubGhkMTlrWld4aGVTSTZOeXdnSW5KaGJtUm1hMnh6YkRZaU9qQXNJQ0o1WVhkZmJXOWtYMjltWm5ObGRDSTZNQ3dnSW1SemJHWnJiVzlrSWpvaVUzZHBkR05vWldRaUxDQWlaSE5zWm10emJITjNkQ0k2TWpFc0lDSnlZVzVrWm10eWMydzNJam93TENBaVpITnNabXR6ZDNOd0lqbzFMQ0FpWm10dmNIUnlZVzVrTVNJNld5SitJbDBzSUNKa2MyeG1hM05zY21GdUlqb3dMQ0FpWm10dmNIUnlZVzVrTWlJNld5SitJbDBzSUNKa2MyeG1hM0poYm5Od1pDSTZNQ3dnSW1acmIzQjBjbUZ1WkRNaU9sc2lmaUpkTENBaVpITnlabXR0YjJRaU9pSlNZVzVrYjIwaUxDQWlabXR2Y0hSeVlXNWtOQ0k2V3lKK0lsMHNJQ0prYzNKbWEzTnNjM2QwSWpvd0xDQWlaSE55Wm10emQzTndJam93TENBaVpITnlabXR6YkhKaGJpSTZPQ3dnSW1SemNtWnJjbUZ1YzNCa0lqbzBMQ0FpWm10c1lXZHpkM1FpT2pFc0lDSm1hMjl3ZEhKaGJtUTNJanBiSW40aVhTd2dJbVpyYVc1MlpYSjBJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNNU0k2Wm1Gc2MyVXNJQ0p5WVc1a2IyMHhJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNNaUk2Wm1Gc2MyVXNJQ0p5WVc1a2IyMHlJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNNeUk2Wm1Gc2MyVXNJQ0p5WVc1a2IyMHpJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNOQ0k2Wm1Gc2MyVXNJQ0p5WVc1a2IyMDBJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNOU0k2Wm1Gc2MyVXNJQ0p5WVc1a2IyMDFJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNOaUk2Wm1Gc2MyVXNJQ0p5WVc1a2IyMDJJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNOeUk2Wm1Gc2MyVXNJQ0p5WVc1a2IyMDNJanBtWVd4elpTd2dJbVJsWm1WdWMybDJaVjl3YVhSamFDSTZJbE4wWVhScFl5SXNJQ0p5WVc1a2Myd3hJam93TENBaWNtRnVaSE5zTWlJNk1Dd2dJbkpoYm1SemJETWlPakFzSUNKa1pXWmxibk5wZG1WZmNHbDBZMmd4SWpvNE9Td2dJbkpoYm1SemJEUWlPakFzSUNKeVlXNWtaV1p3ZERFaU9qQXNJQ0p5WVc1a2MydzFJam93TENBaVpHVm1aVzV6YVhabFgzQnBkR05vTWlJNk1Dd2dJbkpoYm1SemJEWWlPakFzSUNKaVpYUnpkM053WkNJNk1Td2dJbkpoYm1SemJEY2lPakFzSUNKeVlXNWtaV1p3ZERJaU9qQXNJQ0ptYTJ4emJERWlPakFzSUNKemQzUnpiR1F4SWpveExDQWlabXR5YzJ3eElqb3dMQ0FpWm10c2Myd3lJam93TENBaVptdHljMnd5SWpvd0xDQWlabXRzYzJ3eklqb3dMQ0FpWkdWbVpXNXphWFpsWDNsaGR6SWlPamtzSUNKbWEzSnpiRE1pT2pBc0lDSm1hMnh6YkRRaU9qQXNJQ0ptYTNKemJEUWlPakFzSUNKbWEyeHpiRFVpT2pBc0lDSmthWE56YkNJNk1Dd2dJbVpyY25Oc05TSTZNQ3dnSW5saGQxOWlZWE5sWkNJNklreHZZMkZzSUZacFpYY2lMQ0FpWm10c2MydzJJam93TENBaWMzZDBjMnhrSWpveE1Dd2dJbVpyY25Oc05pSTZNQ3dnSW1oaGJXNXZYMUJGUlVRaU9qRXNJQ0ptYTJ4emJEY2lPakFzSUNKaVpYUnpkM053WkRNaU9qRXNJQ0ptYTNKemJEY2lPakFzSUNKaVpYUnpkM053WkRJaU9qRXNJQ0p5WVc1a2MzZDBNU0k2Wm1Gc2MyVXNJQ0p5WVc1a1pXWjVkeklpT2pBc0lDSnlZVzVrYzNkME1pSTZabUZzYzJVc0lDSnlZVzVrWldaNWR6RWlPakFzSUNKeVlXNWtjM2QwTXlJNlptRnNjMlVzSUNKa1pXWmxibk5wZG1WZmVXRjNNU0k2TFRnc0lDSnlZVzVrYzNkME5DSTZabUZzYzJVc0lDSmtaV1psYm5OcGRtVmZlV0YzSWpvaVUzZHBkR05vSWl3Z0luSmhibVJ6ZDNRMUlqcG1ZV3h6WlN3Z0luTjNjM0JrSWpveExDQWljbUZ1WkhOM2REWWlPbVpoYkhObExDQWlabXR2Y0hSeVlXNWtOaUk2V3lKK0lsMHNJQ0p5WVc1a2MzZDBOeUk2Wm1Gc2MyVXNJQ0ptYTI5d2RISmhibVExSWpwYkluNGlYU3dnSW5KaGJtUm1hMnh6YkRFaU9qQXNJQ0p5WVc1a1ptdHNjMnczSWpvd0xDQWljbUZ1WkdacmNuTnNNU0k2TUN3Z0luSmhibVJtYTNKemJEWWlPakFzSUNKeVlXNWtabXRzYzJ3eUlqb3dmU3dnZXlKeVlXNWtabXR5YzJ3eUlqb3dMQ0FpY21GdVpHWnJiSE5zTXlJNk1Dd2dJbkpoYm1SbWEzSnpiRE1pT2pBc0lDSnlZVzVrWm10c2MydzBJam93TENBaWNtRnVaR1pyY25Oc05DSTZNQ3dnSW5KaGJtUm1hMnh6YkRVaU9qQXNJQ0p5WVc1a1ptdHljMncxSWpvd0xDQWllV0YzWDJ3aU9qQXNJQ0o1WVhkZmNpSTZNQ3dnSW5SeWFXZG5aWEp6SWpwYkluNGlYU3dnSW5saGQyeHljbUZ1WkNJNlptRnNjMlVzSUNKNVlYZGZaR1ZzWVhraU9qQXNJQ0p5WVc1a1ptdHNjMncySWpvd0xDQWllV0YzWDIxdlpGOXZabVp6WlhRaU9qQXNJQ0prYzJ4bWEyMXZaQ0k2SWxKaGJtUnZiU0lzSUNKa2MyeG1hM05zYzNkMElqb3dMQ0FpY21GdVpHWnJjbk5zTnlJNk1Dd2dJbVJ6YkdacmMzZHpjQ0k2TUN3Z0ltWnJiM0IwY21GdVpERWlPbHNpZmlKZExDQWlaSE5zWm10emJISmhiaUk2TWpBc0lDSm1hMjl3ZEhKaGJtUXlJanBiSW40aVhTd2dJbVJ6YkdacmNtRnVjM0JrSWpvNExDQWlabXR2Y0hSeVlXNWtNeUk2V3lKK0lsMHNJQ0prYzNKbWEyMXZaQ0k2SWxOM2FYUmphR1ZrSWl3Z0ltWnJiM0IwY21GdVpEUWlPbHNpZmlKZExDQWlaSE55Wm10emJITjNkQ0k2Tnl3Z0ltUnpjbVpyYzNkemNDSTZNalVzSUNKa2MzSm1hM05zY21GdUlqb3dMQ0FpWkhOeVptdHlZVzV6Y0dRaU9qQXNJQ0ptYTJ4aFozTjNkQ0k2TVN3Z0ltWnJiM0IwY21GdVpEY2lPbHNpZmlKZExDQWlabXRwYm5abGNuUWlPbVpoYkhObExDQWlhVzUyWlhKMGMyd3hJanBtWVd4elpTd2dJbkpoYm1SdmJURWlPbVpoYkhObExDQWlhVzUyWlhKMGMyd3lJanBtWVd4elpTd2dJbkpoYm1SdmJUSWlPbVpoYkhObExDQWlhVzUyWlhKMGMyd3pJanBtWVd4elpTd2dJbkpoYm1SdmJUTWlPbVpoYkhObExDQWlhVzUyWlhKMGMydzBJanBtWVd4elpTd2dJbkpoYm1SdmJUUWlPbVpoYkhObExDQWlhVzUyWlhKMGMydzFJanBtWVd4elpTd2dJbkpoYm1SdmJUVWlPbVpoYkhObExDQWlhVzUyWlhKMGMydzJJanBtWVd4elpTd2dJbkpoYm1SdmJUWWlPbVpoYkhObExDQWlhVzUyWlhKMGMydzNJanBtWVd4elpTd2dJbkpoYm1SdmJUY2lPbVpoYkhObExDQWlaR1ZtWlc1emFYWmxYM0JwZEdOb0lqb2lVM1JoZEdsaklpd2dJbkpoYm1SemJERWlPakFzSUNKeVlXNWtjMnd5SWpvd0xDQWljbUZ1WkhOc015STZNQ3dnSW1SbFptVnVjMmwyWlY5d2FYUmphREVpT2pBc0lDSnlZVzVrYzJ3MElqb3dMQ0FpY21GdVpHVm1jSFF4SWpvd0xDQWljbUZ1WkhOc05TSTZNQ3dnSW1SbFptVnVjMmwyWlY5d2FYUmphRElpT2pBc0lDSnlZVzVrYzJ3Mklqb3dMQ0FpWW1WMGMzZHpjR1FpT2pFc0lDSnlZVzVrYzJ3M0lqb3dMQ0FpY21GdVpHVm1jSFF5SWpvd0xDQWlabXRzYzJ3eElqb3dMQ0FpYzNkMGMyeGtNU0k2TVN3Z0ltWnJjbk5zTVNJNk1Dd2dJbVpyYkhOc01pSTZNQ3dnSW1acmNuTnNNaUk2TUN3Z0ltWnJiSE5zTXlJNk1Dd2dJbVJsWm1WdWMybDJaVjk1WVhjeUlqb3dMQ0FpWm10eWMyd3pJam93TENBaVptdHNjMncwSWpvd0xDQWlabXR5YzJ3MElqb3dMQ0FpWm10c2MydzFJam93TENBaVpHbHpjMndpT2pBc0lDSm1hM0p6YkRVaU9qQXNJQ0o1WVhkZlltRnpaV1FpT2lKTWIyTmhiQ0JXYVdWM0lpd2dJbVpyYkhOc05pSTZNQ3dnSW5OM2RITnNaQ0k2TVN3Z0ltWnJjbk5zTmlJNk1Dd2dJbWhoYlc1dlgxQkZSVVFpT2pFc0lDSm1hMnh6YkRjaU9qQXNJQ0ppWlhSemQzTndaRE1pT2pFc0lDSm1hM0p6YkRjaU9qQXNJQ0ppWlhSemQzTndaRElpT2pFc0lDSnlZVzVrYzNkME1TSTZabUZzYzJVc0lDSnlZVzVrWldaNWR6SWlPakFzSUNKeVlXNWtjM2QwTWlJNlptRnNjMlVzSUNKeVlXNWtaV1o1ZHpFaU9qQXNJQ0p5WVc1a2MzZDBNeUk2Wm1Gc2MyVXNJQ0prWldabGJuTnBkbVZmZVdGM01TSTZNQ3dnSW5KaGJtUnpkM1EwSWpwbVlXeHpaU3dnSW1SbFptVnVjMmwyWlY5NVlYY2lPaUpUZEdGMGFXTWlMQ0FpY21GdVpITjNkRFVpT21aaGJITmxMQ0FpYzNkemNHUWlPakVzSUNKeVlXNWtjM2QwTmlJNlptRnNjMlVzSUNKbWEyOXdkSEpoYm1RMklqcGJJbjRpWFN3Z0luSmhibVJ6ZDNRM0lqcG1ZV3h6WlN3Z0ltWnJiM0IwY21GdVpEVWlPbHNpZmlKZExDQWljbUZ1WkdacmJITnNNU0k2TUN3Z0luSmhibVJtYTJ4emJEY2lPakFzSUNKeVlXNWtabXR5YzJ3eElqb3dMQ0FpY21GdVpHWnJjbk5zTmlJNk1Dd2dJbkpoYm1SbWEyeHpiRElpT2pCOVhTd2dleUowY21sbloyVnljM0JvY3lJNld5Sk5hWE56SUVGMElIbHZkU0lzSUNKK0lsMTlYUT09IiwgWyJNaXNzIEF0IHlvdSJdXSwgWyIzIiwgIlcxdDdJbk5zTVNJNk1Dd2dJbVJsYzNsdVkxOW1jbVZsYzNSaGJtUWlPaUpQWm1ZaUxDQWljMnd5SWpvd0xDQWljMnd6SWpvd0xDQWlaR1ZtWlc1emFYWmxYMkZoSWpwMGNuVmxMQ0FpYzJ3MElqb3dMQ0FpWkdselpHVm1jeUk2Wm1Gc2MyVXNJQ0p6YkRVaU9qQXNJQ0ptYTJ4aFoyeDBJanBtWVd4elpTd2dJbk5zZEdsamF5STZOU3dnSW14algyVnVZV0pzWlNJNmRISjFaU3dnSW5Oc01UZDNJam93TENBaWMyd3lOM2NpT2pBc0lDSnpiRE0zZHlJNk1Dd2dJbk5zTkRkM0lqb3dMQ0FpYzJ3MU4zY2lPakFzSUNKemJEWTNkeUk2TUN3Z0luTnNOemQzSWpvd0xDQWllV0YzWW1GelpXUWlPaUpDWVdOcmQyRnlaQ0lzSUNKaWIyUjVYM2xoZHlJNmRISjFaU3dnSW5saGQxOXRiMlJwWm1sbGNpSTZJa05sYm5SbGNpSXNJQ0prWlhONWJtTmZiQ0k2TlRZc0lDSnNZMTlsYm1GaWJHVmZiMjRpT2xzeExDQXlMQ0FpZmlKZExDQWllV0YzSWpvaVUzZHBkR05vWldRaUxDQWlaR1Z6ZVc1algzSWlPak16TENBaVptRnJaVjl2Y0hScGIyNXpJanBiSWtGMmIybGtJRTkyWlhKc1lYQWlMQ0FpU21sMGRHVnlJaXdnSW40aVhYMHNJSHNpYzJ3eElqb3dMQ0FpWkdWemVXNWpYMlp5WldWemRHRnVaQ0k2SWs5bVppSXNJQ0p6YkRJaU9qQXNJQ0p6YkRNaU9qQXNJQ0prWldabGJuTnBkbVZmWVdFaU9tWmhiSE5sTENBaWMydzBJam93TENBaVpHbHpaR1ZtY3lJNlptRnNjMlVzSUNKemJEVWlPakFzSUNKbWEyeGhaMngwSWpwMGNuVmxMQ0FpYzJ4MGFXTnJJam8wTENBaWJHTmZaVzVoWW14bElqcDBjblZsTENBaWMyd3hOM2NpT2pFeUxDQWljMnd5TjNjaU9qZ3NJQ0p6YkRNM2R5STZOQ3dnSW5Oc05EZDNJam80TENBaWMydzFOM2NpT2prc0lDSnpiRFkzZHlJNk9Dd2dJbk5zTnpkM0lqbzVMQ0FpZVdGM1ltRnpaV1FpT2lKQ1lXTnJkMkZ5WkNJc0lDSmliMlI1WDNsaGR5STZkSEoxWlN3Z0lubGhkMTl0YjJScFptbGxjaUk2SWtOMWMzUnZiU0EzTFZkaGVTSXNJQ0prWlhONWJtTmZiQ0k2TmpBc0lDSnNZMTlsYm1GaWJHVmZiMjRpT2xzeExDQXlMQ0FpZmlKZExDQWllV0YzSWpvaVJHVm1ZWFZzZENJc0lDSmtaWE41Ym1OZmNpSTZNalVzSUNKbVlXdGxYMjl3ZEdsdmJuTWlPbHNpU21sMGRHVnlJaXdnSWxKaGJtUnZiV2w2WlNCS2FYUjBaWElpTENBaWZpSmRmU3dnZXlKemJERWlPakFzSUNKa1pYTjVibU5mWm5KbFpYTjBZVzVrSWpvaVQyWm1JaXdnSW5Oc01pSTZNQ3dnSW5Oc015STZNQ3dnSW1SbFptVnVjMmwyWlY5aFlTSTZkSEoxWlN3Z0luTnNOQ0k2TUN3Z0ltUnBjMlJsWm5NaU9tWmhiSE5sTENBaWMydzFJam93TENBaVptdHNZV2RzZENJNmRISjFaU3dnSW5Oc2RHbGpheUk2TlN3Z0lteGpYMlZ1WVdKc1pTSTZkSEoxWlN3Z0luTnNNVGQzSWpvd0xDQWljMnd5TjNjaU9qQXNJQ0p6YkRNM2R5STZNQ3dnSW5Oc05EZDNJam93TENBaWMydzFOM2NpT2pBc0lDSnpiRFkzZHlJNk1Dd2dJbk5zTnpkM0lqb3dMQ0FpZVdGM1ltRnpaV1FpT2lKQ1lXTnJkMkZ5WkNJc0lDSmliMlI1WDNsaGR5STZkSEoxWlN3Z0lubGhkMTl0YjJScFptbGxjaUk2SWtObGJuUmxjaUlzSUNKa1pYTjVibU5mYkNJNk5UUXNJQ0pzWTE5bGJtRmliR1ZmYjI0aU9sc3hMQ0F5TENBaWZpSmRMQ0FpZVdGM0lqb2lVM2RwZEdOb1pXUWlMQ0FpWkdWemVXNWpYM0lpT2pNeUxDQWlabUZyWlY5dmNIUnBiMjV6SWpwYklrcHBkSFJsY2lJc0lDSlNZVzVrYjIxcGVtVWdTbWwwZEdWeUlpd2dJbjRpWFgwc0lIc2ljMnd4SWpvd0xDQWlaR1Z6ZVc1algyWnlaV1Z6ZEdGdVpDSTZJazltWmlJc0lDSnpiRElpT2pBc0lDSnpiRE1pT2pBc0lDSmtaV1psYm5OcGRtVmZZV0VpT25SeWRXVXNJQ0p6YkRRaU9qQXNJQ0prYVhOa1pXWnpJanBtWVd4elpTd2dJbk5zTlNJNk1Dd2dJbVpyYkdGbmJIUWlPblJ5ZFdVc0lDSnpiSFJwWTJzaU9qVXNJQ0pzWTE5bGJtRmliR1VpT25SeWRXVXNJQ0p6YkRFM2R5STZNQ3dnSW5Oc01qZDNJam93TENBaWMyd3pOM2NpT2pBc0lDSnpiRFEzZHlJNk1Dd2dJbk5zTlRkM0lqb3dMQ0FpYzJ3Mk4zY2lPakFzSUNKemJEYzNkeUk2TUN3Z0lubGhkMkpoYzJWa0lqb2lRbUZqYTNkaGNtUWlMQ0FpWW05a2VWOTVZWGNpT25SeWRXVXNJQ0o1WVhkZmJXOWthV1pwWlhJaU9pSkRaVzUwWlhJaUxDQWlaR1Z6ZVc1algyd2lPakkwTENBaWJHTmZaVzVoWW14bFgyOXVJanBiTVN3Z01pd2dJbjRpWFN3Z0lubGhkeUk2SWxOM2FYUmphR1ZrSWl3Z0ltUmxjM2x1WTE5eUlqbzFNU3dnSW1aaGEyVmZiM0IwYVc5dWN5STZXeUpCZG05cFpDQlBkbVZ5YkdGd0lpd2dJa3BwZEhSbGNpSXNJQ0pTWVc1a2IyMXBlbVVnU21sMGRHVnlJaXdnSW40aVhYMHNJSHNpYzJ3eElqb3dMQ0FpWkdWemVXNWpYMlp5WldWemRHRnVaQ0k2SWs5bVppSXNJQ0p6YkRJaU9qQXNJQ0p6YkRNaU9qQXNJQ0prWldabGJuTnBkbVZmWVdFaU9uUnlkV1VzSUNKemJEUWlPakFzSUNKa2FYTmtaV1p6SWpwbVlXeHpaU3dnSW5Oc05TSTZNQ3dnSW1acmJHRm5iSFFpT25SeWRXVXNJQ0p6YkhScFkyc2lPalVzSUNKc1kxOWxibUZpYkdVaU9uUnlkV1VzSUNKemJERTNkeUk2TUN3Z0luTnNNamQzSWpvd0xDQWljMnd6TjNjaU9qQXNJQ0p6YkRRM2R5STZNQ3dnSW5Oc05UZDNJam93TENBaWMydzJOM2NpT2pBc0lDSnpiRGMzZHlJNk1Dd2dJbmxoZDJKaGMyVmtJam9pUW1GamEzZGhjbVFpTENBaVltOWtlVjk1WVhjaU9uUnlkV1VzSUNKNVlYZGZiVzlrYVdacFpYSWlPaUpEWlc1MFpYSWlMQ0FpWkdWemVXNWpYMndpT2pVNExDQWliR05mWlc1aFlteGxYMjl1SWpwYk1Td2dNaXdnSW40aVhTd2dJbmxoZHlJNklsTjNhWFJqYUdWa0lpd2dJbVJsYzNsdVkxOXlJam95TVN3Z0ltWmhhMlZmYjNCMGFXOXVjeUk2V3lKS2FYUjBaWElpTENBaVVtRnVaRzl0YVhwbElFcHBkSFJsY2lJc0lDSitJbDE5TENCN0luTnNNU0k2TUN3Z0ltUmxjM2x1WTE5bWNtVmxjM1JoYm1RaU9pSlBabVlpTENBaWMyd3lJam93TENBaWMyd3pJam93TENBaVpHVm1aVzV6YVhabFgyRmhJanAwY25WbExDQWljMncwSWpvd0xDQWlaR2x6WkdWbWN5STZabUZzYzJVc0lDSnpiRFVpT2pBc0lDSm1hMnhoWjJ4MElqcG1ZV3h6WlN3Z0luTnNkR2xqYXlJNk5Td2dJbXhqWDJWdVlXSnNaU0k2ZEhKMVpTd2dJbk5zTVRkM0lqb3dMQ0FpYzJ3eU4zY2lPakFzSUNKemJETTNkeUk2TUN3Z0luTnNORGQzSWpvd0xDQWljMncxTjNjaU9qQXNJQ0p6YkRZM2R5STZNQ3dnSW5Oc056ZDNJam93TENBaWVXRjNZbUZ6WldRaU9pSkNZV05yZDJGeVpDSXNJQ0ppYjJSNVgzbGhkeUk2ZEhKMVpTd2dJbmxoZDE5dGIyUnBabWxsY2lJNklrTmxiblJsY2lJc0lDSmtaWE41Ym1OZmJDSTZNamNzSUNKc1kxOWxibUZpYkdWZmIyNGlPbHN4TENBeUxDQWlmaUpkTENBaWVXRjNJam9pVTNkcGRHTm9aV1FpTENBaVpHVnplVzVqWDNJaU9qRXlMQ0FpWm1GclpWOXZjSFJwYjI1eklqcGJJa0YyYjJsa0lFOTJaWEpzWVhBaUxDQWlTbWwwZEdWeUlpd2dJbjRpWFgwc0lIc2ljMnd4SWpvd0xDQWlaR1Z6ZVc1algyWnlaV1Z6ZEdGdVpDSTZJazltWmlJc0lDSnpiRElpT2pBc0lDSnpiRE1pT2pBc0lDSmtaV1psYm5OcGRtVmZZV0VpT21aaGJITmxMQ0FpYzJ3MElqb3dMQ0FpWkdselpHVm1jeUk2Wm1Gc2MyVXNJQ0p6YkRVaU9qQXNJQ0ptYTJ4aFoyeDBJanBtWVd4elpTd2dJbk5zZEdsamF5STZOU3dnSW14algyVnVZV0pzWlNJNmRISjFaU3dnSW5Oc01UZDNJam93TENBaWMyd3lOM2NpT2pBc0lDSnpiRE0zZHlJNk1Dd2dJbk5zTkRkM0lqb3dMQ0FpYzJ3MU4zY2lPakFzSUNKemJEWTNkeUk2TUN3Z0luTnNOemQzSWpvd0xDQWllV0YzWW1GelpXUWlPaUpDWVdOcmQyRnlaQ0lzSUNKaWIyUjVYM2xoZHlJNmRISjFaU3dnSW5saGQxOXRiMlJwWm1sbGNpSTZJa05sYm5SbGNpSXNJQ0prWlhONWJtTmZiQ0k2TkRVc0lDSnNZMTlsYm1GaWJHVmZiMjRpT2xzeExDQXlMQ0FpZmlKZExDQWllV0YzSWpvaVJHVm1ZWFZzZENJc0lDSmtaWE41Ym1OZmNpSTZNVFVzSUNKbVlXdGxYMjl3ZEdsdmJuTWlPbHNpUVhadmFXUWdUM1psY214aGNDSXNJQ0pLYVhSMFpYSWlMQ0FpZmlKZGZWMHNJRnQ3SW5KaGJtUm1hM0p6YkRJaU9qQXNJQ0p5WVc1a1ptdHNjMnd6SWpvd0xDQWljbUZ1WkdacmNuTnNNeUk2TUN3Z0luSmhibVJtYTJ4emJEUWlPakFzSUNKeVlXNWtabXR5YzJ3MElqb3dMQ0FpY21GdVpHWnJiSE5zTlNJNk1Dd2dJbkpoYm1SbWEzSnpiRFVpT2pBc0lDSjVZWGRmYkNJNkxUZ3NJQ0o1WVhkZmNpSTZPU3dnSW5SeWFXZG5aWEp6SWpwYkluNGlYU3dnSW5saGQyeHljbUZ1WkNJNlptRnNjMlVzSUNKNVlYZGZaR1ZzWVhraU9qVXNJQ0p5WVc1a1ptdHNjMncySWpvd0xDQWllV0YzWDIxdlpGOXZabVp6WlhRaU9qQXNJQ0prYzJ4bWEyMXZaQ0k2SWxOM2FYUmphR1ZrSWl3Z0ltUnpiR1pyYzJ4emQzUWlPak00TENBaWNtRnVaR1pyY25Oc055STZNQ3dnSW1SemJHWnJjM2R6Y0NJNk9Td2dJbVpyYjNCMGNtRnVaREVpT2xzaWZpSmRMQ0FpWkhOc1ptdHpiSEpoYmlJNk1Dd2dJbVpyYjNCMGNtRnVaRElpT2xzaWZpSmRMQ0FpWkhOc1ptdHlZVzV6Y0dRaU9qQXNJQ0ptYTI5d2RISmhibVF6SWpwYkluNGlYU3dnSW1SemNtWnJiVzlrSWpvaVUzZHBkR05vWldRaUxDQWlabXR2Y0hSeVlXNWtOQ0k2V3lKK0lsMHNJQ0prYzNKbWEzTnNjM2QwSWpveE55d2dJbVJ6Y21acmMzZHpjQ0k2TVRFc0lDSmtjM0ptYTNOc2NtRnVJam93TENBaVpITnlabXR5WVc1emNHUWlPakFzSUNKbWEyeGhaM04zZENJNk1Td2dJbVpyYjNCMGNtRnVaRGNpT2xzaWZpSmRMQ0FpWm10cGJuWmxjblFpT21aaGJITmxMQ0FpYVc1MlpYSjBjMnd4SWpwbVlXeHpaU3dnSW5KaGJtUnZiVEVpT21aaGJITmxMQ0FpYVc1MlpYSjBjMnd5SWpwbVlXeHpaU3dnSW5KaGJtUnZiVElpT21aaGJITmxMQ0FpYVc1MlpYSjBjMnd6SWpwbVlXeHpaU3dnSW5KaGJtUnZiVE1pT21aaGJITmxMQ0FpYVc1MlpYSjBjMncwSWpwbVlXeHpaU3dnSW5KaGJtUnZiVFFpT21aaGJITmxMQ0FpYVc1MlpYSjBjMncxSWpwbVlXeHpaU3dnSW5KaGJtUnZiVFVpT21aaGJITmxMQ0FpYVc1MlpYSjBjMncySWpwbVlXeHpaU3dnSW5KaGJtUnZiVFlpT21aaGJITmxMQ0FpYVc1MlpYSjBjMnczSWpwbVlXeHpaU3dnSW5KaGJtUnZiVGNpT21aaGJITmxMQ0FpWkdWbVpXNXphWFpsWDNCcGRHTm9Jam9pVTNSaGRHbGpJaXdnSW5KaGJtUnpiREVpT2pBc0lDSnlZVzVrYzJ3eUlqb3dMQ0FpY21GdVpITnNNeUk2TUN3Z0ltUmxabVZ1YzJsMlpWOXdhWFJqYURFaU9qZzVMQ0FpY21GdVpITnNOQ0k2TUN3Z0luSmhibVJsWm5CME1TSTZNQ3dnSW5KaGJtUnpiRFVpT2pBc0lDSmtaV1psYm5OcGRtVmZjR2wwWTJneUlqb3dMQ0FpY21GdVpITnNOaUk2TUN3Z0ltSmxkSE4zYzNCa0lqb3hMQ0FpY21GdVpITnNOeUk2TUN3Z0luSmhibVJsWm5CME1pSTZNQ3dnSW1acmJITnNNU0k2TUN3Z0luTjNkSE5zWkRFaU9qRXNJQ0ptYTNKemJERWlPakFzSUNKbWEyeHpiRElpT2pBc0lDSm1hM0p6YkRJaU9qQXNJQ0ptYTJ4emJETWlPakFzSUNKa1pXWmxibk5wZG1WZmVXRjNNaUk2Tml3Z0ltWnJjbk5zTXlJNk1Dd2dJbVpyYkhOc05DSTZNQ3dnSW1acmNuTnNOQ0k2TUN3Z0ltWnJiSE5zTlNJNk1Dd2dJbVJwYzNOc0lqb3dMQ0FpWm10eWMydzFJam93TENBaWVXRjNYMkpoYzJWa0lqb2lURzlqWVd3Z1ZtbGxkeUlzSUNKbWEyeHpiRFlpT2pBc0lDSnpkM1J6YkdRaU9qRXNJQ0ptYTNKemJEWWlPakFzSUNKb1lXMXViMTlRUlVWRUlqb3hMQ0FpWm10c2MydzNJam93TENBaVltVjBjM2R6Y0dReklqb3hMQ0FpWm10eWMydzNJam93TENBaVltVjBjM2R6Y0dReUlqb3hNU3dnSW5KaGJtUnpkM1F4SWpwbVlXeHpaU3dnSW5KaGJtUmxabmwzTWlJNk1pd2dJbkpoYm1SemQzUXlJanBtWVd4elpTd2dJbkpoYm1SbFpubDNNU0k2TVN3Z0luSmhibVJ6ZDNReklqcG1ZV3h6WlN3Z0ltUmxabVZ1YzJsMlpWOTVZWGN4SWpvdE9Dd2dJbkpoYm1SemQzUTBJanBtWVd4elpTd2dJbVJsWm1WdWMybDJaVjk1WVhjaU9pSkNaWFIwWlhJZ1UzZHBkR05vSWl3Z0luSmhibVJ6ZDNRMUlqcG1ZV3h6WlN3Z0luTjNjM0JrSWpveExDQWljbUZ1WkhOM2REWWlPbVpoYkhObExDQWlabXR2Y0hSeVlXNWtOaUk2V3lKK0lsMHNJQ0p5WVc1a2MzZDBOeUk2Wm1Gc2MyVXNJQ0ptYTI5d2RISmhibVExSWpwYkluNGlYU3dnSW5KaGJtUm1hMnh6YkRFaU9qQXNJQ0p5WVc1a1ptdHNjMnczSWpvd0xDQWljbUZ1WkdacmNuTnNNU0k2TUN3Z0luSmhibVJtYTNKemJEWWlPakFzSUNKeVlXNWtabXRzYzJ3eUlqb3dmU3dnZXlKeVlXNWtabXR5YzJ3eUlqbzFMQ0FpY21GdVpHWnJiSE5zTXlJNk1Dd2dJbkpoYm1SbWEzSnpiRE1pT2pBc0lDSnlZVzVrWm10c2MydzBJam94TENBaWNtRnVaR1pyY25Oc05DSTZOQ3dnSW5KaGJtUm1hMnh6YkRVaU9qVXNJQ0p5WVc1a1ptdHljMncxSWpveUxDQWllV0YzWDJ3aU9qQXNJQ0o1WVhkZmNpSTZNQ3dnSW5SeWFXZG5aWEp6SWpwYkluNGlYU3dnSW5saGQyeHljbUZ1WkNJNlptRnNjMlVzSUNKNVlYZGZaR1ZzWVhraU9qQXNJQ0p5WVc1a1ptdHNjMncySWpvMExDQWllV0YzWDIxdlpGOXZabVp6WlhRaU9qQXNJQ0prYzJ4bWEyMXZaQ0k2SWxOM2FYUmphR1ZrSWl3Z0ltUnpiR1pyYzJ4emQzUWlPak14TENBaWNtRnVaR1pyY25Oc055STZOU3dnSW1SemJHWnJjM2R6Y0NJNk1URXNJQ0ptYTI5d2RISmhibVF4SWpwYklrRjJiMmxrSUU5MlpYSnNZWEFpTENBaVNtbDBkR1Z5SWl3Z0luNGlYU3dnSW1SemJHWnJjMnh5WVc0aU9qQXNJQ0ptYTI5d2RISmhibVF5SWpwYklrcHBkSFJsY2lJc0lDSitJbDBzSUNKa2MyeG1hM0poYm5Od1pDSTZNQ3dnSW1acmIzQjBjbUZ1WkRNaU9sc2lTbWwwZEdWeUlpd2dJbEpoYm1SdmJXbDZaU0JLYVhSMFpYSWlMQ0FpZmlKZExDQWlaSE55Wm10dGIyUWlPaUpUZDJsMFkyaGxaQ0lzSUNKbWEyOXdkSEpoYm1RMElqcGJJa3BwZEhSbGNpSXNJQ0orSWwwc0lDSmtjM0ptYTNOc2MzZDBJam94TVN3Z0ltUnpjbVpyYzNkemNDSTZOU3dnSW1SemNtWnJjMnh5WVc0aU9qQXNJQ0prYzNKbWEzSmhibk53WkNJNk1Dd2dJbVpyYkdGbmMzZDBJam96TENBaVptdHZjSFJ5WVc1a055STZXeUpCZG05cFpDQlBkbVZ5YkdGd0lpd2dJa3BwZEhSbGNpSXNJQ0orSWwwc0lDSm1hMmx1ZG1WeWRDSTZabUZzYzJVc0lDSnBiblpsY25SemJERWlPblJ5ZFdVc0lDSnlZVzVrYjIweElqcDBjblZsTENBaWFXNTJaWEowYzJ3eUlqcG1ZV3h6WlN3Z0luSmhibVJ2YlRJaU9uUnlkV1VzSUNKcGJuWmxjblJ6YkRNaU9tWmhiSE5sTENBaWNtRnVaRzl0TXlJNmRISjFaU3dnSW1sdWRtVnlkSE5zTkNJNmRISjFaU3dnSW5KaGJtUnZiVFFpT25SeWRXVXNJQ0pwYm5abGNuUnpiRFVpT25SeWRXVXNJQ0p5WVc1a2IyMDFJanAwY25WbExDQWlhVzUyWlhKMGMydzJJanBtWVd4elpTd2dJbkpoYm1SdmJUWWlPblJ5ZFdVc0lDSnBiblpsY25SemJEY2lPbVpoYkhObExDQWljbUZ1Wkc5dE55STZkSEoxWlN3Z0ltUmxabVZ1YzJsMlpWOXdhWFJqYUNJNklrSmxkSFJsY2lCU1lXNWtiMjBpTENBaWNtRnVaSE5zTVNJNk15d2dJbkpoYm1SemJESWlPakVzSUNKeVlXNWtjMnd6SWpvd0xDQWlaR1ZtWlc1emFYWmxYM0JwZEdOb01TSTZMVGM1TENBaWNtRnVaSE5zTkNJNk1pd2dJbkpoYm1SbFpuQjBNU0k2TUN3Z0luSmhibVJ6YkRVaU9qRXNJQ0prWldabGJuTnBkbVZmY0dsMFkyZ3lJam90TlN3Z0luSmhibVJ6YkRZaU9qTXNJQ0ppWlhSemQzTndaQ0k2TkN3Z0luSmhibVJ6YkRjaU9qTXNJQ0p5WVc1a1pXWndkRElpT2pBc0lDSm1hMnh6YkRFaU9qTTVMQ0FpYzNkMGMyeGtNU0k2TVN3Z0ltWnJjbk5zTVNJNk1UVXNJQ0ptYTJ4emJESWlPakU0TENBaVptdHljMnd5SWpvek9Td2dJbVpyYkhOc015STZORGdzSUNKa1pXWmxibk5wZG1WZmVXRjNNaUk2TWpBc0lDSm1hM0p6YkRNaU9qVXpMQ0FpWm10c2MydzBJam94TVN3Z0ltWnJjbk5zTkNJNk5EUXNJQ0ptYTJ4emJEVWlPalV6TENBaVpHbHpjMndpT2pBc0lDSm1hM0p6YkRVaU9qRTRMQ0FpZVdGM1gySmhjMlZrSWpvaVRHOWpZV3dnVm1sbGR5SXNJQ0ptYTJ4emJEWWlPalUxTENBaWMzZDBjMnhrSWpveExDQWlabXR5YzJ3Mklqb3hPU3dnSW1oaGJXNXZYMUJGUlVRaU9qY3NJQ0ptYTJ4emJEY2lPakV6TENBaVltVjBjM2R6Y0dReklqb3hMQ0FpWm10eWMydzNJam8xTUN3Z0ltSmxkSE4zYzNCa01pSTZNU3dnSW5KaGJtUnpkM1F4SWpwMGNuVmxMQ0FpY21GdVpHVm1lWGN5SWpvd0xDQWljbUZ1WkhOM2RESWlPblJ5ZFdVc0lDSnlZVzVrWldaNWR6RWlPakFzSUNKeVlXNWtjM2QwTXlJNlptRnNjMlVzSUNKa1pXWmxibk5wZG1WZmVXRjNNU0k2TFRFMUxDQWljbUZ1WkhOM2REUWlPblJ5ZFdVc0lDSmtaV1psYm5OcGRtVmZlV0YzSWpvaVUzZGhlU0lzSUNKeVlXNWtjM2QwTlNJNmRISjFaU3dnSW5OM2MzQmtJam94TENBaWNtRnVaSE4zZERZaU9uUnlkV1VzSUNKbWEyOXdkSEpoYm1RMklqcGJJa3BwZEhSbGNpSXNJQ0orSWwwc0lDSnlZVzVrYzNkME55STZkSEoxWlN3Z0ltWnJiM0IwY21GdVpEVWlPbHNpUVhadmFXUWdUM1psY214aGNDSXNJQ0pLYVhSMFpYSWlMQ0FpZmlKZExDQWljbUZ1WkdacmJITnNNU0k2TVRnc0lDSnlZVzVrWm10c2MydzNJam96TENBaWNtRnVaR1pyY25Oc01TSTZOU3dnSW5KaGJtUm1hM0p6YkRZaU9qRXNJQ0p5WVc1a1ptdHNjMnd5SWpvemZTd2dleUp5WVc1a1ptdHljMnd5SWpvd0xDQWljbUZ1WkdacmJITnNNeUk2TUN3Z0luSmhibVJtYTNKemJETWlPakFzSUNKeVlXNWtabXRzYzJ3MElqb3dMQ0FpY21GdVpHWnJjbk5zTkNJNk1Dd2dJbkpoYm1SbWEyeHpiRFVpT2pBc0lDSnlZVzVrWm10eWMydzFJam93TENBaWVXRjNYMndpT2kweE5Dd2dJbmxoZDE5eUlqb3hOaXdnSW5SeWFXZG5aWEp6SWpwYkluNGlYU3dnSW5saGQyeHljbUZ1WkNJNlptRnNjMlVzSUNKNVlYZGZaR1ZzWVhraU9qTXNJQ0p5WVc1a1ptdHNjMncySWpvd0xDQWllV0YzWDIxdlpGOXZabVp6WlhRaU9qQXNJQ0prYzJ4bWEyMXZaQ0k2SWxOM2FYUmphR1ZrSWl3Z0ltUnpiR1pyYzJ4emQzUWlPalF4TENBaWNtRnVaR1pyY25Oc055STZNQ3dnSW1SemJHWnJjM2R6Y0NJNk9Dd2dJbVpyYjNCMGNtRnVaREVpT2xzaWZpSmRMQ0FpWkhOc1ptdHpiSEpoYmlJNk1Dd2dJbVpyYjNCMGNtRnVaRElpT2xzaWZpSmRMQ0FpWkhOc1ptdHlZVzV6Y0dRaU9qQXNJQ0ptYTI5d2RISmhibVF6SWpwYkluNGlYU3dnSW1SemNtWnJiVzlrSWpvaVUzZHBkR05vWldRaUxDQWlabXR2Y0hSeVlXNWtOQ0k2V3lKK0lsMHNJQ0prYzNKbWEzTnNjM2QwSWpveU55d2dJbVJ6Y21acmMzZHpjQ0k2TVRVc0lDSmtjM0ptYTNOc2NtRnVJam93TENBaVpITnlabXR5WVc1emNHUWlPakFzSUNKbWEyeGhaM04zZENJNk1Td2dJbVpyYjNCMGNtRnVaRGNpT2xzaWZpSmRMQ0FpWm10cGJuWmxjblFpT21aaGJITmxMQ0FpYVc1MlpYSjBjMnd4SWpwbVlXeHpaU3dnSW5KaGJtUnZiVEVpT21aaGJITmxMQ0FpYVc1MlpYSjBjMnd5SWpwbVlXeHpaU3dnSW5KaGJtUnZiVElpT21aaGJITmxMQ0FpYVc1MlpYSjBjMnd6SWpwbVlXeHpaU3dnSW5KaGJtUnZiVE1pT21aaGJITmxMQ0FpYVc1MlpYSjBjMncwSWpwbVlXeHpaU3dnSW5KaGJtUnZiVFFpT21aaGJITmxMQ0FpYVc1MlpYSjBjMncxSWpwbVlXeHpaU3dnSW5KaGJtUnZiVFVpT21aaGJITmxMQ0FpYVc1MlpYSjBjMncySWpwbVlXeHpaU3dnSW5KaGJtUnZiVFlpT21aaGJITmxMQ0FpYVc1MlpYSjBjMnczSWpwbVlXeHpaU3dnSW5KaGJtUnZiVGNpT21aaGJITmxMQ0FpWkdWbVpXNXphWFpsWDNCcGRHTm9Jam9pUW1WMGRHVnlJRkpoYm1SdmJTSXNJQ0p5WVc1a2Myd3hJam93TENBaWNtRnVaSE5zTWlJNk1Dd2dJbkpoYm1SemJETWlPakFzSUNKa1pXWmxibk5wZG1WZmNHbDBZMmd4SWpvdE5qVXNJQ0p5WVc1a2MydzBJam93TENBaWNtRnVaR1ZtY0hReElqb3dMQ0FpY21GdVpITnNOU0k2TUN3Z0ltUmxabVZ1YzJsMlpWOXdhWFJqYURJaU9qRXlMQ0FpY21GdVpITnNOaUk2TUN3Z0ltSmxkSE4zYzNCa0lqbzJMQ0FpY21GdVpITnNOeUk2TUN3Z0luSmhibVJsWm5CME1pSTZNQ3dnSW1acmJITnNNU0k2TUN3Z0luTjNkSE5zWkRFaU9qRXNJQ0ptYTNKemJERWlPakFzSUNKbWEyeHpiRElpT2pBc0lDSm1hM0p6YkRJaU9qQXNJQ0ptYTJ4emJETWlPakFzSUNKa1pXWmxibk5wZG1WZmVXRjNNaUk2TkRRc0lDSm1hM0p6YkRNaU9qQXNJQ0ptYTJ4emJEUWlPakFzSUNKbWEzSnpiRFFpT2pBc0lDSm1hMnh6YkRVaU9qQXNJQ0prYVhOemJDSTZNQ3dnSW1acmNuTnNOU0k2TUN3Z0lubGhkMTlpWVhObFpDSTZJa3h2WTJGc0lGWnBaWGNpTENBaVptdHNjMncySWpvd0xDQWljM2QwYzJ4a0lqb3hMQ0FpWm10eWMydzJJam93TENBaWFHRnRibTlmVUVWRlJDSTZNU3dnSW1acmJITnNOeUk2TUN3Z0ltSmxkSE4zYzNCa015STZNeXdnSW1acmNuTnNOeUk2TUN3Z0ltSmxkSE4zYzNCa01pSTZNU3dnSW5KaGJtUnpkM1F4SWpwbVlXeHpaU3dnSW5KaGJtUmxabmwzTWlJNk1Dd2dJbkpoYm1SemQzUXlJanBtWVd4elpTd2dJbkpoYm1SbFpubDNNU0k2TUN3Z0luSmhibVJ6ZDNReklqcG1ZV3h6WlN3Z0ltUmxabVZ1YzJsMlpWOTVZWGN4SWpvdE5Ea3NJQ0p5WVc1a2MzZDBOQ0k2Wm1Gc2MyVXNJQ0prWldabGJuTnBkbVZmZVdGM0lqb2lRbVYwZEdWeUlGSmhibVJ2YlNJc0lDSnlZVzVrYzNkME5TSTZabUZzYzJVc0lDSnpkM053WkNJNk1Td2dJbkpoYm1SemQzUTJJanBtWVd4elpTd2dJbVpyYjNCMGNtRnVaRFlpT2xzaWZpSmRMQ0FpY21GdVpITjNkRGNpT21aaGJITmxMQ0FpWm10dmNIUnlZVzVrTlNJNld5SitJbDBzSUNKeVlXNWtabXRzYzJ3eElqb3dMQ0FpY21GdVpHWnJiSE5zTnlJNk1Dd2dJbkpoYm1SbWEzSnpiREVpT2pBc0lDSnlZVzVrWm10eWMydzJJam93TENBaWNtRnVaR1pyYkhOc01pSTZNSDBzSUhzaWNtRnVaR1pyY25Oc01pSTZNQ3dnSW5KaGJtUm1hMnh6YkRNaU9qQXNJQ0p5WVc1a1ptdHljMnd6SWpvd0xDQWljbUZ1WkdacmJITnNOQ0k2TUN3Z0luSmhibVJtYTNKemJEUWlPakFzSUNKeVlXNWtabXRzYzJ3MUlqb3dMQ0FpY21GdVpHWnJjbk5zTlNJNk1Dd2dJbmxoZDE5c0lqb3RNVE1zSUNKNVlYZGZjaUk2TVRFc0lDSjBjbWxuWjJWeWN5STZXeUorSWwwc0lDSjVZWGRzY25KaGJtUWlPbVpoYkhObExDQWllV0YzWDJSbGJHRjVJam96TENBaWNtRnVaR1pyYkhOc05pSTZNQ3dnSW5saGQxOXRiMlJmYjJabWMyVjBJam93TENBaVpITnNabXR0YjJRaU9pSlRkMmwwWTJobFpDSXNJQ0prYzJ4bWEzTnNjM2QwSWpveE5pd2dJbkpoYm1SbWEzSnpiRGNpT2pBc0lDSmtjMnhtYTNOM2MzQWlPak1zSUNKbWEyOXdkSEpoYm1ReElqcGJJbjRpWFN3Z0ltUnpiR1pyYzJ4eVlXNGlPakFzSUNKbWEyOXdkSEpoYm1ReUlqcGJJbjRpWFN3Z0ltUnpiR1pyY21GdWMzQmtJam93TENBaVptdHZjSFJ5WVc1a015STZXeUorSWwwc0lDSmtjM0ptYTIxdlpDSTZJbE4zYVhSamFHVmtJaXdnSW1acmIzQjBjbUZ1WkRRaU9sc2lmaUpkTENBaVpITnlabXR6YkhOM2RDSTZORElzSUNKa2MzSm1hM04zYzNBaU9qRTRMQ0FpWkhOeVptdHpiSEpoYmlJNk1Dd2dJbVJ6Y21acmNtRnVjM0JrSWpvd0xDQWlabXRzWVdkemQzUWlPakVzSUNKbWEyOXdkSEpoYm1RM0lqcGJJbjRpWFN3Z0ltWnJhVzUyWlhKMElqcDBjblZsTENBaWFXNTJaWEowYzJ3eElqcG1ZV3h6WlN3Z0luSmhibVJ2YlRFaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3eUlqcG1ZV3h6WlN3Z0luSmhibVJ2YlRJaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3eklqcG1ZV3h6WlN3Z0luSmhibVJ2YlRNaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3MElqcG1ZV3h6WlN3Z0luSmhibVJ2YlRRaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3MUlqcG1ZV3h6WlN3Z0luSmhibVJ2YlRVaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3MklqcG1ZV3h6WlN3Z0luSmhibVJ2YlRZaU9tWmhiSE5sTENBaWFXNTJaWEowYzJ3M0lqcG1ZV3h6WlN3Z0luSmhibVJ2YlRjaU9tWmhiSE5sTENBaVpHVm1aVzV6YVhabFgzQnBkR05vSWpvaVFtVjBkR1Z5SUZKaGJtUnZiU0lzSUNKeVlXNWtjMnd4SWpvd0xDQWljbUZ1WkhOc01pSTZNQ3dnSW5KaGJtUnpiRE1pT2pBc0lDSmtaV1psYm5OcGRtVmZjR2wwWTJneElqb3ROek1zSUNKeVlXNWtjMncwSWpvd0xDQWljbUZ1WkdWbWNIUXhJam8zTENBaWNtRnVaSE5zTlNJNk1Dd2dJbVJsWm1WdWMybDJaVjl3YVhSamFESWlPakV6TENBaWNtRnVaSE5zTmlJNk1Dd2dJbUpsZEhOM2MzQmtJam95TENBaWNtRnVaSE5zTnlJNk1Dd2dJbkpoYm1SbFpuQjBNaUk2TWl3Z0ltWnJiSE5zTVNJNk1Dd2dJbk4zZEhOc1pERWlPamNzSUNKbWEzSnpiREVpT2pBc0lDSm1hMnh6YkRJaU9qQXNJQ0ptYTNKemJESWlPakFzSUNKbWEyeHpiRE1pT2pBc0lDSmtaV1psYm5OcGRtVmZlV0YzTWlJNk1qWXNJQ0ptYTNKemJETWlPakFzSUNKbWEyeHpiRFFpT2pBc0lDSm1hM0p6YkRRaU9qQXNJQ0ptYTJ4emJEVWlPakFzSUNKa2FYTnpiQ0k2TUN3Z0ltWnJjbk5zTlNJNk1Dd2dJbmxoZDE5aVlYTmxaQ0k2SWt4dlkyRnNJRlpwWlhjaUxDQWlabXRzYzJ3Mklqb3dMQ0FpYzNkMGMyeGtJam94TENBaVptdHljMncySWpvd0xDQWlhR0Z0Ym05ZlVFVkZSQ0k2TVRRc0lDSm1hMnh6YkRjaU9qQXNJQ0ppWlhSemQzTndaRE1pT2pNc0lDSm1hM0p6YkRjaU9qQXNJQ0ppWlhSemQzTndaRElpT2pFc0lDSnlZVzVrYzNkME1TSTZabUZzYzJVc0lDSnlZVzVrWldaNWR6SWlPakFzSUNKeVlXNWtjM2QwTWlJNlptRnNjMlVzSUNKeVlXNWtaV1o1ZHpFaU9qQXNJQ0p5WVc1a2MzZDBNeUk2Wm1Gc2MyVXNJQ0prWldabGJuTnBkbVZmZVdGM01TSTZNVGd3TENBaWNtRnVaSE4zZERRaU9tWmhiSE5sTENBaVpHVm1aVzV6YVhabFgzbGhkeUk2SWxOd2FXNGlMQ0FpY21GdVpITjNkRFVpT21aaGJITmxMQ0FpYzNkemNHUWlPakVzSUNKeVlXNWtjM2QwTmlJNlptRnNjMlVzSUNKbWEyOXdkSEpoYm1RMklqcGJJbjRpWFN3Z0luSmhibVJ6ZDNRM0lqcG1ZV3h6WlN3Z0ltWnJiM0IwY21GdVpEVWlPbHNpZmlKZExDQWljbUZ1WkdacmJITnNNU0k2TUN3Z0luSmhibVJtYTJ4emJEY2lPakFzSUNKeVlXNWtabXR5YzJ3eElqb3dMQ0FpY21GdVpHWnJjbk5zTmlJNk1Dd2dJbkpoYm1SbWEyeHpiRElpT2pCOUxDQjdJbkpoYm1SbWEzSnpiRElpT2pBc0lDSnlZVzVrWm10c2Myd3pJam93TENBaWNtRnVaR1pyY25Oc015STZNQ3dnSW5KaGJtUm1hMnh6YkRRaU9qQXNJQ0p5WVc1a1ptdHljMncwSWpvd0xDQWljbUZ1WkdacmJITnNOU0k2TUN3Z0luSmhibVJtYTNKemJEVWlPakFzSUNKNVlYZGZiQ0k2TFRFM0xDQWllV0YzWDNJaU9qRTFMQ0FpZEhKcFoyZGxjbk1pT2xzaWZpSmRMQ0FpZVdGM2JISnlZVzVrSWpwbVlXeHpaU3dnSW5saGQxOWtaV3hoZVNJNk15d2dJbkpoYm1SbWEyeHpiRFlpT2pBc0lDSjVZWGRmYlc5a1gyOW1abk5sZENJNk1Dd2dJbVJ6YkdacmJXOWtJam9pVTNkcGRHTm9aV1FpTENBaVpITnNabXR6YkhOM2RDSTZNemtzSUNKeVlXNWtabXR5YzJ3M0lqb3dMQ0FpWkhOc1ptdHpkM053SWpveE5pd2dJbVpyYjNCMGNtRnVaREVpT2xzaWZpSmRMQ0FpWkhOc1ptdHpiSEpoYmlJNk1Dd2dJbVpyYjNCMGNtRnVaRElpT2xzaWZpSmRMQ0FpWkhOc1ptdHlZVzV6Y0dRaU9qQXNJQ0ptYTI5d2RISmhibVF6SWpwYkluNGlYU3dnSW1SemNtWnJiVzlrSWpvaVVtRnVaRzl0SWl3Z0ltWnJiM0IwY21GdVpEUWlPbHNpZmlKZExDQWlaSE55Wm10emJITjNkQ0k2TWpNc0lDSmtjM0ptYTNOM2MzQWlPakFzSUNKa2MzSm1hM05zY21GdUlqb3hNaXdnSW1SemNtWnJjbUZ1YzNCa0lqbzBMQ0FpWm10c1lXZHpkM1FpT2pFc0lDSm1hMjl3ZEhKaGJtUTNJanBiSW40aVhTd2dJbVpyYVc1MlpYSjBJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNNU0k2Wm1Gc2MyVXNJQ0p5WVc1a2IyMHhJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNNaUk2Wm1Gc2MyVXNJQ0p5WVc1a2IyMHlJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNNeUk2Wm1Gc2MyVXNJQ0p5WVc1a2IyMHpJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNOQ0k2Wm1Gc2MyVXNJQ0p5WVc1a2IyMDBJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNOU0k2Wm1Gc2MyVXNJQ0p5WVc1a2IyMDFJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNOaUk2Wm1Gc2MyVXNJQ0p5WVc1a2IyMDJJanBtWVd4elpTd2dJbWx1ZG1WeWRITnNOeUk2Wm1Gc2MyVXNJQ0p5WVc1a2IyMDNJanBtWVd4elpTd2dJbVJsWm1WdWMybDJaVjl3YVhSamFDSTZJa0psZEhSbGNpQlNZVzVrYjIwaUxDQWljbUZ1WkhOc01TSTZNQ3dnSW5KaGJtUnpiRElpT2pBc0lDSnlZVzVrYzJ3eklqb3dMQ0FpWkdWbVpXNXphWFpsWDNCcGRHTm9NU0k2TFRjekxDQWljbUZ1WkhOc05DSTZNQ3dnSW5KaGJtUmxabkIwTVNJNk1UTXNJQ0p5WVc1a2MydzFJam93TENBaVpHVm1aVzV6YVhabFgzQnBkR05vTWlJNk1qWXNJQ0p5WVc1a2MydzJJam93TENBaVltVjBjM2R6Y0dRaU9qTXNJQ0p5WVc1a2MydzNJam93TENBaWNtRnVaR1ZtY0hReUlqb3pNQ3dnSW1acmJITnNNU0k2TUN3Z0luTjNkSE5zWkRFaU9qRTJMQ0FpWm10eWMyd3hJam93TENBaVptdHNjMnd5SWpvd0xDQWlabXR5YzJ3eUlqb3dMQ0FpWm10c2Myd3pJam93TENBaVpHVm1aVzV6YVhabFgzbGhkeklpT2pjeUxDQWlabXR5YzJ3eklqb3dMQ0FpWm10c2MydzBJam93TENBaVptdHljMncwSWpvd0xDQWlabXRzYzJ3MUlqb3dMQ0FpWkdsemMyd2lPakFzSUNKbWEzSnpiRFVpT2pBc0lDSjVZWGRmWW1GelpXUWlPaUpNYjJOaGJDQldhV1YzSWl3Z0ltWnJiSE5zTmlJNk1Dd2dJbk4zZEhOc1pDSTZNU3dnSW1acmNuTnNOaUk2TUN3Z0ltaGhiVzV2WDFCRlJVUWlPamtzSUNKbWEyeHpiRGNpT2pBc0lDSmlaWFJ6ZDNOd1pETWlPakVzSUNKbWEzSnpiRGNpT2pBc0lDSmlaWFJ6ZDNOd1pESWlPakUxTENBaWNtRnVaSE4zZERFaU9tWmhiSE5sTENBaWNtRnVaR1ZtZVhjeUlqbzBMQ0FpY21GdVpITjNkRElpT21aaGJITmxMQ0FpY21GdVpHVm1lWGN4SWpvMUxDQWljbUZ1WkhOM2RETWlPbVpoYkhObExDQWlaR1ZtWlc1emFYWmxYM2xoZHpFaU9pMDROaXdnSW5KaGJtUnpkM1EwSWpwbVlXeHpaU3dnSW1SbFptVnVjMmwyWlY5NVlYY2lPaUpUZDJGNUlpd2dJbkpoYm1SemQzUTFJanBtWVd4elpTd2dJbk4zYzNCa0lqb3hMQ0FpY21GdVpITjNkRFlpT21aaGJITmxMQ0FpWm10dmNIUnlZVzVrTmlJNld5SitJbDBzSUNKeVlXNWtjM2QwTnlJNlptRnNjMlVzSUNKbWEyOXdkSEpoYm1RMUlqcGJJbjRpWFN3Z0luSmhibVJtYTJ4emJERWlPakFzSUNKeVlXNWtabXRzYzJ3M0lqb3dMQ0FpY21GdVpHWnJjbk5zTVNJNk1Dd2dJbkpoYm1SbWEzSnpiRFlpT2pBc0lDSnlZVzVrWm10c2Myd3lJam93ZlN3Z2V5SnlZVzVrWm10eWMyd3lJam93TENBaWNtRnVaR1pyYkhOc015STZNQ3dnSW5KaGJtUm1hM0p6YkRNaU9qQXNJQ0p5WVc1a1ptdHNjMncwSWpvd0xDQWljbUZ1WkdacmNuTnNOQ0k2TUN3Z0luSmhibVJtYTJ4emJEVWlPakFzSUNKeVlXNWtabXR5YzJ3MUlqb3dMQ0FpZVdGM1gyd2lPaTB6TENBaWVXRjNYM0lpT2pNc0lDSjBjbWxuWjJWeWN5STZXeUorSWwwc0lDSjVZWGRzY25KaGJtUWlPbVpoYkhObExDQWllV0YzWDJSbGJHRjVJam8zTENBaWNtRnVaR1pyYkhOc05pSTZNQ3dnSW5saGQxOXRiMlJmYjJabWMyVjBJam93TENBaVpITnNabXR0YjJRaU9pSlRkMmwwWTJobFpDSXNJQ0prYzJ4bWEzTnNjM2QwSWpveU1Td2dJbkpoYm1SbWEzSnpiRGNpT2pBc0lDSmtjMnhtYTNOM2MzQWlPalVzSUNKbWEyOXdkSEpoYm1ReElqcGJJbjRpWFN3Z0ltUnpiR1pyYzJ4eVlXNGlPakFzSUNKbWEyOXdkSEpoYm1ReUlqcGJJbjRpWFN3Z0ltUnpiR1pyY21GdWMzQmtJam93TENBaVptdHZjSFJ5WVc1a015STZXeUorSWwwc0lDSmtjM0ptYTIxdlpDSTZJbEpoYm1SdmJTSXNJQ0ptYTI5d2RISmhibVEwSWpwYkluNGlYU3dnSW1SemNtWnJjMnh6ZDNRaU9qQXNJQ0prYzNKbWEzTjNjM0FpT2pBc0lDSmtjM0ptYTNOc2NtRnVJam80TENBaVpITnlabXR5WVc1emNHUWlPalFzSUNKbWEyeGhaM04zZENJNk1Td2dJbVpyYjNCMGNtRnVaRGNpT2xzaWZpSmRMQ0FpWm10cGJuWmxjblFpT21aaGJITmxMQ0FpYVc1MlpYSjBjMnd4SWpwbVlXeHpaU3dnSW5KaGJtUnZiVEVpT21aaGJITmxMQ0FpYVc1MlpYSjBjMnd5SWpwbVlXeHpaU3dnSW5KaGJtUnZiVElpT21aaGJITmxMQ0FpYVc1MlpYSjBjMnd6SWpwbVlXeHpaU3dnSW5KaGJtUnZiVE1pT21aaGJITmxMQ0FpYVc1MlpYSjBjMncwSWpwbVlXeHpaU3dnSW5KaGJtUnZiVFFpT21aaGJITmxMQ0FpYVc1MlpYSjBjMncxSWpwbVlXeHpaU3dnSW5KaGJtUnZiVFVpT21aaGJITmxMQ0FpYVc1MlpYSjBjMncySWpwbVlXeHpaU3dnSW5KaGJtUnZiVFlpT21aaGJITmxMQ0FpYVc1MlpYSjBjMnczSWpwbVlXeHpaU3dnSW5KaGJtUnZiVGNpT21aaGJITmxMQ0FpWkdWbVpXNXphWFpsWDNCcGRHTm9Jam9pVTNSaGRHbGpJaXdnSW5KaGJtUnpiREVpT2pBc0lDSnlZVzVrYzJ3eUlqb3dMQ0FpY21GdVpITnNNeUk2TUN3Z0ltUmxabVZ1YzJsMlpWOXdhWFJqYURFaU9qZzVMQ0FpY21GdVpITnNOQ0k2TUN3Z0luSmhibVJsWm5CME1TSTZNQ3dnSW5KaGJtUnpiRFVpT2pBc0lDSmtaV1psYm5OcGRtVmZjR2wwWTJneUlqb3dMQ0FpY21GdVpITnNOaUk2TUN3Z0ltSmxkSE4zYzNCa0lqb3hMQ0FpY21GdVpITnNOeUk2TUN3Z0luSmhibVJsWm5CME1pSTZNQ3dnSW1acmJITnNNU0k2TUN3Z0luTjNkSE5zWkRFaU9qRXNJQ0ptYTNKemJERWlPakFzSUNKbWEyeHpiRElpT2pBc0lDSm1hM0p6YkRJaU9qQXNJQ0ptYTJ4emJETWlPakFzSUNKa1pXWmxibk5wZG1WZmVXRjNNaUk2T1N3Z0ltWnJjbk5zTXlJNk1Dd2dJbVpyYkhOc05DSTZNQ3dnSW1acmNuTnNOQ0k2TUN3Z0ltWnJiSE5zTlNJNk1Dd2dJbVJwYzNOc0lqb3dMQ0FpWm10eWMydzFJam93TENBaWVXRjNYMkpoYzJWa0lqb2lURzlqWVd3Z1ZtbGxkeUlzSUNKbWEyeHpiRFlpT2pBc0lDSnpkM1J6YkdRaU9qRXdMQ0FpWm10eWMydzJJam93TENBaWFHRnRibTlmVUVWRlJDSTZNU3dnSW1acmJITnNOeUk2TUN3Z0ltSmxkSE4zYzNCa015STZNU3dnSW1acmNuTnNOeUk2TUN3Z0ltSmxkSE4zYzNCa01pSTZNU3dnSW5KaGJtUnpkM1F4SWpwbVlXeHpaU3dnSW5KaGJtUmxabmwzTWlJNk1Dd2dJbkpoYm1SemQzUXlJanBtWVd4elpTd2dJbkpoYm1SbFpubDNNU0k2TUN3Z0luSmhibVJ6ZDNReklqcG1ZV3h6WlN3Z0ltUmxabVZ1YzJsMlpWOTVZWGN4SWpvdE9Dd2dJbkpoYm1SemQzUTBJanBtWVd4elpTd2dJbVJsWm1WdWMybDJaVjk1WVhjaU9pSlRkMmwwWTJnaUxDQWljbUZ1WkhOM2REVWlPbVpoYkhObExDQWljM2R6Y0dRaU9qRXNJQ0p5WVc1a2MzZDBOaUk2Wm1Gc2MyVXNJQ0ptYTI5d2RISmhibVEySWpwYkluNGlYU3dnSW5KaGJtUnpkM1EzSWpwbVlXeHpaU3dnSW1acmIzQjBjbUZ1WkRVaU9sc2lmaUpkTENBaWNtRnVaR1pyYkhOc01TSTZNQ3dnSW5KaGJtUm1hMnh6YkRjaU9qQXNJQ0p5WVc1a1ptdHljMnd4SWpvd0xDQWljbUZ1WkdacmNuTnNOaUk2TUN3Z0luSmhibVJtYTJ4emJESWlPakI5TENCN0luSmhibVJtYTNKemJESWlPakFzSUNKeVlXNWtabXRzYzJ3eklqb3dMQ0FpY21GdVpHWnJjbk5zTXlJNk1Dd2dJbkpoYm1SbWEyeHpiRFFpT2pBc0lDSnlZVzVrWm10eWMydzBJam93TENBaWNtRnVaR1pyYkhOc05TSTZNQ3dnSW5KaGJtUm1hM0p6YkRVaU9qQXNJQ0o1WVhkZmJDSTZNQ3dnSW5saGQxOXlJam93TENBaWRISnBaMmRsY25NaU9sc2lmaUpkTENBaWVXRjNiSEp5WVc1a0lqcG1ZV3h6WlN3Z0lubGhkMTlrWld4aGVTSTZNQ3dnSW5KaGJtUm1hMnh6YkRZaU9qQXNJQ0o1WVhkZmJXOWtYMjltWm5ObGRDSTZNQ3dnSW1SemJHWnJiVzlrSWpvaVVtRnVaRzl0SWl3Z0ltUnpiR1pyYzJ4emQzUWlPakFzSUNKeVlXNWtabXR5YzJ3M0lqb3dMQ0FpWkhOc1ptdHpkM053SWpvd0xDQWlabXR2Y0hSeVlXNWtNU0k2V3lKK0lsMHNJQ0prYzJ4bWEzTnNjbUZ1SWpveU1Dd2dJbVpyYjNCMGNtRnVaRElpT2xzaWZpSmRMQ0FpWkhOc1ptdHlZVzV6Y0dRaU9qZ3NJQ0ptYTI5d2RISmhibVF6SWpwYkluNGlYU3dnSW1SemNtWnJiVzlrSWpvaVUzZHBkR05vWldRaUxDQWlabXR2Y0hSeVlXNWtOQ0k2V3lKK0lsMHNJQ0prYzNKbWEzTnNjM2QwSWpvM0xDQWlaSE55Wm10emQzTndJam95TlN3Z0ltUnpjbVpyYzJ4eVlXNGlPakFzSUNKa2MzSm1hM0poYm5Od1pDSTZNQ3dnSW1acmJHRm5jM2QwSWpveExDQWlabXR2Y0hSeVlXNWtOeUk2V3lKK0lsMHNJQ0ptYTJsdWRtVnlkQ0k2Wm1Gc2MyVXNJQ0pwYm5abGNuUnpiREVpT21aaGJITmxMQ0FpY21GdVpHOXRNU0k2Wm1Gc2MyVXNJQ0pwYm5abGNuUnpiRElpT21aaGJITmxMQ0FpY21GdVpHOXRNaUk2Wm1Gc2MyVXNJQ0pwYm5abGNuUnpiRE1pT21aaGJITmxMQ0FpY21GdVpHOXRNeUk2Wm1Gc2MyVXNJQ0pwYm5abGNuUnpiRFFpT21aaGJITmxMQ0FpY21GdVpHOXROQ0k2Wm1Gc2MyVXNJQ0pwYm5abGNuUnpiRFVpT21aaGJITmxMQ0FpY21GdVpHOXROU0k2Wm1Gc2MyVXNJQ0pwYm5abGNuUnpiRFlpT21aaGJITmxMQ0FpY21GdVpHOXROaUk2Wm1Gc2MyVXNJQ0pwYm5abGNuUnpiRGNpT21aaGJITmxMQ0FpY21GdVpHOXROeUk2Wm1Gc2MyVXNJQ0prWldabGJuTnBkbVZmY0dsMFkyZ2lPaUpUZEdGMGFXTWlMQ0FpY21GdVpITnNNU0k2TUN3Z0luSmhibVJ6YkRJaU9qQXNJQ0p5WVc1a2Myd3pJam93TENBaVpHVm1aVzV6YVhabFgzQnBkR05vTVNJNk1Dd2dJbkpoYm1SemJEUWlPakFzSUNKeVlXNWtaV1p3ZERFaU9qQXNJQ0p5WVc1a2MydzFJam93TENBaVpHVm1aVzV6YVhabFgzQnBkR05vTWlJNk1Dd2dJbkpoYm1SemJEWWlPakFzSUNKaVpYUnpkM053WkNJNk1Td2dJbkpoYm1SemJEY2lPakFzSUNKeVlXNWtaV1p3ZERJaU9qQXNJQ0ptYTJ4emJERWlPakFzSUNKemQzUnpiR1F4SWpveExDQWlabXR5YzJ3eElqb3dMQ0FpWm10c2Myd3lJam93TENBaVptdHljMnd5SWpvd0xDQWlabXRzYzJ3eklqb3dMQ0FpWkdWbVpXNXphWFpsWDNsaGR6SWlPakFzSUNKbWEzSnpiRE1pT2pBc0lDSm1hMnh6YkRRaU9qQXNJQ0ptYTNKemJEUWlPakFzSUNKbWEyeHpiRFVpT2pBc0lDSmthWE56YkNJNk1Dd2dJbVpyY25Oc05TSTZNQ3dnSW5saGQxOWlZWE5sWkNJNklreHZZMkZzSUZacFpYY2lMQ0FpWm10c2MydzJJam93TENBaWMzZDBjMnhrSWpveExDQWlabXR5YzJ3Mklqb3dMQ0FpYUdGdGJtOWZVRVZGUkNJNk1Td2dJbVpyYkhOc055STZNQ3dnSW1KbGRITjNjM0JrTXlJNk1Td2dJbVpyY25Oc055STZNQ3dnSW1KbGRITjNjM0JrTWlJNk1Td2dJbkpoYm1SemQzUXhJanBtWVd4elpTd2dJbkpoYm1SbFpubDNNaUk2TUN3Z0luSmhibVJ6ZDNReUlqcG1ZV3h6WlN3Z0luSmhibVJsWm5sM01TSTZNQ3dnSW5KaGJtUnpkM1F6SWpwbVlXeHpaU3dnSW1SbFptVnVjMmwyWlY5NVlYY3hJam93TENBaWNtRnVaSE4zZERRaU9tWmhiSE5sTENBaVpHVm1aVzV6YVhabFgzbGhkeUk2SWxOMFlYUnBZeUlzSUNKeVlXNWtjM2QwTlNJNlptRnNjMlVzSUNKemQzTndaQ0k2TVN3Z0luSmhibVJ6ZDNRMklqcG1ZV3h6WlN3Z0ltWnJiM0IwY21GdVpEWWlPbHNpZmlKZExDQWljbUZ1WkhOM2REY2lPbVpoYkhObExDQWlabXR2Y0hSeVlXNWtOU0k2V3lKK0lsMHNJQ0p5WVc1a1ptdHNjMnd4SWpvd0xDQWljbUZ1WkdacmJITnNOeUk2TUN3Z0luSmhibVJtYTNKemJERWlPakFzSUNKeVlXNWtabXR5YzJ3Mklqb3dMQ0FpY21GdVpHWnJiSE5zTWlJNk1IMWRMQ0I3SW5SeWFXZG5aWEp6Y0doeklqcGJJbGx2ZFNCSFpYUWdTR2wwSWl3Z0luNGlYWDFkIiwgWyJZb3UgR2V0IEhpdCJdXV0sICJwaGFzZXMiOltbeyJzbDEiOjAsICJkZXN5bmNfZnJlZXN0YW5kIjoiT2ZmIiwgInNsMiI6MCwgInNsMyI6MCwgImRlZmVuc2l2ZV9hYSI6dHJ1ZSwgInNsNCI6MCwgImRpc2RlZnMiOmZhbHNlLCAic2w1IjowLCAiZmtsYWdsdCI6ZmFsc2UsICJzbHRpY2siOjUsICJsY19lbmFibGUiOnRydWUsICJzbDE3dyI6MCwgInNsMjd3IjowLCAic2wzN3ciOjAsICJzbDQ3dyI6MCwgInNsNTd3IjowLCAic2w2N3ciOjAsICJzbDc3dyI6MCwgInlhd2Jhc2VkIjoiQmFja3dhcmQiLCAiYm9keV95YXciOnRydWUsICJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCAiZGVzeW5jX2wiOjU2LCAibGNfZW5hYmxlX29uIjpbMSwgMiwgIn4iXSwgInlhdyI6IlN3aXRjaGVkIiwgImRlc3luY19yIjozMywgImZha2Vfb3B0aW9ucyI6WyJBdm9pZCBPdmVybGFwIiwgIkppdHRlciIsICJ+Il19LCB7InNsMSI6MCwgImRlc3luY19mcmVlc3RhbmQiOiJPZmYiLCAic2wyIjowLCAic2wzIjowLCAiZGVmZW5zaXZlX2FhIjpmYWxzZSwgInNsNCI6MCwgImRpc2RlZnMiOmZhbHNlLCAic2w1IjowLCAiZmtsYWdsdCI6dHJ1ZSwgInNsdGljayI6NCwgImxjX2VuYWJsZSI6dHJ1ZSwgInNsMTd3IjoxMiwgInNsMjd3Ijo4LCAic2wzN3ciOjQsICJzbDQ3dyI6OCwgInNsNTd3Ijo5LCAic2w2N3ciOjgsICJzbDc3dyI6OSwgInlhd2Jhc2VkIjoiQmFja3dhcmQiLCAiYm9keV95YXciOnRydWUsICJ5YXdfbW9kaWZpZXIiOiJDdXN0b20gNy1XYXkiLCAiZGVzeW5jX2wiOjYwLCAibGNfZW5hYmxlX29uIjpbMSwgMiwgIn4iXSwgInlhdyI6IkRlZmF1bHQiLCAiZGVzeW5jX3IiOjI1LCAiZmFrZV9vcHRpb25zIjpbIkppdHRlciIsICJSYW5kb21pemUgSml0dGVyIiwgIn4iXX0sIHsic2wxIjowLCAiZGVzeW5jX2ZyZWVzdGFuZCI6Ik9mZiIsICJzbDIiOjAsICJzbDMiOjAsICJkZWZlbnNpdmVfYWEiOnRydWUsICJzbDQiOjAsICJkaXNkZWZzIjpmYWxzZSwgInNsNSI6MCwgImZrbGFnbHQiOnRydWUsICJzbHRpY2siOjUsICJsY19lbmFibGUiOnRydWUsICJzbDE3dyI6MCwgInNsMjd3IjowLCAic2wzN3ciOjAsICJzbDQ3dyI6MCwgInNsNTd3IjowLCAic2w2N3ciOjAsICJzbDc3dyI6MCwgInlhd2Jhc2VkIjoiQmFja3dhcmQiLCAiYm9keV95YXciOnRydWUsICJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCAiZGVzeW5jX2wiOjU0LCAibGNfZW5hYmxlX29uIjpbMSwgMiwgIn4iXSwgInlhdyI6IlN3aXRjaGVkIiwgImRlc3luY19yIjozMiwgImZha2Vfb3B0aW9ucyI6WyJKaXR0ZXIiLCAiUmFuZG9taXplIEppdHRlciIsICJ+Il19LCB7InNsMSI6MCwgImRlc3luY19mcmVlc3RhbmQiOiJPZmYiLCAic2wyIjowLCAic2wzIjowLCAiZGVmZW5zaXZlX2FhIjp0cnVlLCAic2w0IjowLCAiZGlzZGVmcyI6ZmFsc2UsICJzbDUiOjAsICJma2xhZ2x0Ijp0cnVlLCAic2x0aWNrIjo1LCAibGNfZW5hYmxlIjp0cnVlLCAic2wxN3ciOjAsICJzbDI3dyI6MCwgInNsMzd3IjowLCAic2w0N3ciOjAsICJzbDU3dyI6MCwgInNsNjd3IjowLCAic2w3N3ciOjAsICJ5YXdiYXNlZCI6IkJhY2t3YXJkIiwgImJvZHlfeWF3Ijp0cnVlLCAieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwgImRlc3luY19sIjoyNCwgImxjX2VuYWJsZV9vbiI6WzEsIDIsICJ+Il0sICJ5YXciOiJTd2l0Y2hlZCIsICJkZXN5bmNfciI6NTEsICJmYWtlX29wdGlvbnMiOlsiQXZvaWQgT3ZlcmxhcCIsICJKaXR0ZXIiLCAiUmFuZG9taXplIEppdHRlciIsICJ+Il19LCB7InNsMSI6MCwgImRlc3luY19mcmVlc3RhbmQiOiJPZmYiLCAic2wyIjowLCAic2wzIjowLCAiZGVmZW5zaXZlX2FhIjp0cnVlLCAic2w0IjowLCAiZGlzZGVmcyI6ZmFsc2UsICJzbDUiOjAsICJma2xhZ2x0Ijp0cnVlLCAic2x0aWNrIjo1LCAibGNfZW5hYmxlIjp0cnVlLCAic2wxN3ciOjAsICJzbDI3dyI6MCwgInNsMzd3IjowLCAic2w0N3ciOjAsICJzbDU3dyI6MCwgInNsNjd3IjowLCAic2w3N3ciOjAsICJ5YXdiYXNlZCI6IkJhY2t3YXJkIiwgImJvZHlfeWF3Ijp0cnVlLCAieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwgImRlc3luY19sIjo1OCwgImxjX2VuYWJsZV9vbiI6WzEsIDIsICJ+Il0sICJ5YXciOiJTd2l0Y2hlZCIsICJkZXN5bmNfciI6MjEsICJmYWtlX29wdGlvbnMiOlsiSml0dGVyIiwgIlJhbmRvbWl6ZSBKaXR0ZXIiLCAifiJdfSwgeyJzbDEiOjAsICJkZXN5bmNfZnJlZXN0YW5kIjoiT2ZmIiwgInNsMiI6MCwgInNsMyI6MCwgImRlZmVuc2l2ZV9hYSI6dHJ1ZSwgInNsNCI6MCwgImRpc2RlZnMiOmZhbHNlLCAic2w1IjowLCAiZmtsYWdsdCI6ZmFsc2UsICJzbHRpY2siOjUsICJsY19lbmFibGUiOnRydWUsICJzbDE3dyI6MCwgInNsMjd3IjowLCAic2wzN3ciOjAsICJzbDQ3dyI6MCwgInNsNTd3IjowLCAic2w2N3ciOjAsICJzbDc3dyI6MCwgInlhd2Jhc2VkIjoiQmFja3dhcmQiLCAiYm9keV95YXciOnRydWUsICJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCAiZGVzeW5jX2wiOjI3LCAibGNfZW5hYmxlX29uIjpbMSwgMiwgIn4iXSwgInlhdyI6IlN3aXRjaGVkIiwgImRlc3luY19yIjoxMiwgImZha2Vfb3B0aW9ucyI6WyJBdm9pZCBPdmVybGFwIiwgIkppdHRlciIsICJ+Il19LCB7InNsMSI6MCwgImRlc3luY19mcmVlc3RhbmQiOiJPZmYiLCAic2wyIjowLCAic2wzIjowLCAiZGVmZW5zaXZlX2FhIjpmYWxzZSwgInNsNCI6MCwgImRpc2RlZnMiOmZhbHNlLCAic2w1IjowLCAiZmtsYWdsdCI6ZmFsc2UsICJzbHRpY2siOjUsICJsY19lbmFibGUiOnRydWUsICJzbDE3dyI6MCwgInNsMjd3IjowLCAic2wzN3ciOjAsICJzbDQ3dyI6MCwgInNsNTd3IjowLCAic2w2N3ciOjAsICJzbDc3dyI6MCwgInlhd2Jhc2VkIjoiQmFja3dhcmQiLCAiYm9keV95YXciOnRydWUsICJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCAiZGVzeW5jX2wiOjQ1LCAibGNfZW5hYmxlX29uIjpbMSwgMiwgIn4iXSwgInlhdyI6IkRlZmF1bHQiLCAiZGVzeW5jX3IiOjE1LCAiZmFrZV9vcHRpb25zIjpbIkF2b2lkIE92ZXJsYXAiLCAiSml0dGVyIiwgIn4iXX1dLCBbeyJyYW5kZmtyc2wyIjowLCAicmFuZGZrbHNsMyI6MCwgInJhbmRma3JzbDMiOjAsICJyYW5kZmtsc2w0IjowLCAicmFuZGZrcnNsNCI6MCwgInJhbmRma2xzbDUiOjAsICJyYW5kZmtyc2w1IjowLCAieWF3X2wiOi04LCAieWF3X3IiOjksICJ0cmlnZ2VycyI6WyJ+Il0sICJ5YXdscnJhbmQiOmZhbHNlLCAieWF3X2RlbGF5Ijo1LCAicmFuZGZrbHNsNiI6MCwgInlhd19tb2Rfb2Zmc2V0IjowLCAiZHNsZmttb2QiOiJTd2l0Y2hlZCIsICJkc2xma3Nsc3d0IjozOCwgInJhbmRma3JzbDciOjAsICJkc2xma3N3c3AiOjksICJma29wdHJhbmQxIjpbIn4iXSwgImRzbGZrc2xyYW4iOjAsICJma29wdHJhbmQyIjpbIn4iXSwgImRzbGZrcmFuc3BkIjowLCAiZmtvcHRyYW5kMyI6WyJ+Il0sICJkc3Jma21vZCI6IlN3aXRjaGVkIiwgImZrb3B0cmFuZDQiOlsifiJdLCAiZHNyZmtzbHN3dCI6MTcsICJkc3Jma3N3c3AiOjExLCAiZHNyZmtzbHJhbiI6MCwgImRzcmZrcmFuc3BkIjowLCAiZmtsYWdzd3QiOjEsICJma29wdHJhbmQ3IjpbIn4iXSwgImZraW52ZXJ0IjpmYWxzZSwgImludmVydHNsMSI6ZmFsc2UsICJyYW5kb20xIjpmYWxzZSwgImludmVydHNsMiI6ZmFsc2UsICJyYW5kb20yIjpmYWxzZSwgImludmVydHNsMyI6ZmFsc2UsICJyYW5kb20zIjpmYWxzZSwgImludmVydHNsNCI6ZmFsc2UsICJyYW5kb200IjpmYWxzZSwgImludmVydHNsNSI6ZmFsc2UsICJyYW5kb201IjpmYWxzZSwgImludmVydHNsNiI6ZmFsc2UsICJyYW5kb202IjpmYWxzZSwgImludmVydHNsNyI6ZmFsc2UsICJyYW5kb203IjpmYWxzZSwgImRlZmVuc2l2ZV9waXRjaCI6IlN0YXRpYyIsICJyYW5kc2wxIjowLCAicmFuZHNsMiI6MCwgInJhbmRzbDMiOjAsICJkZWZlbnNpdmVfcGl0Y2gxIjo4OSwgInJhbmRzbDQiOjAsICJyYW5kZWZwdDEiOjAsICJyYW5kc2w1IjowLCAiZGVmZW5zaXZlX3BpdGNoMiI6MCwgInJhbmRzbDYiOjAsICJiZXRzd3NwZCI6MSwgInJhbmRzbDciOjAsICJyYW5kZWZwdDIiOjAsICJma2xzbDEiOjAsICJzd3RzbGQxIjoxLCAiZmtyc2wxIjowLCAiZmtsc2wyIjowLCAiZmtyc2wyIjowLCAiZmtsc2wzIjowLCAiZGVmZW5zaXZlX3lhdzIiOjYsICJma3JzbDMiOjAsICJma2xzbDQiOjAsICJma3JzbDQiOjAsICJma2xzbDUiOjAsICJkaXNzbCI6MCwgImZrcnNsNSI6MCwgInlhd19iYXNlZCI6IkxvY2FsIFZpZXciLCAiZmtsc2w2IjowLCAic3d0c2xkIjoxLCAiZmtyc2w2IjowLCAiaGFtbm9fUEVFRCI6MSwgImZrbHNsNyI6MCwgImJldHN3c3BkMyI6MSwgImZrcnNsNyI6MCwgImJldHN3c3BkMiI6MTEsICJyYW5kc3d0MSI6ZmFsc2UsICJyYW5kZWZ5dzIiOjIsICJyYW5kc3d0MiI6ZmFsc2UsICJyYW5kZWZ5dzEiOjEsICJyYW5kc3d0MyI6ZmFsc2UsICJkZWZlbnNpdmVfeWF3MSI6LTgsICJyYW5kc3d0NCI6ZmFsc2UsICJkZWZlbnNpdmVfeWF3IjoiQmV0dGVyIFN3aXRjaCIsICJyYW5kc3d0NSI6ZmFsc2UsICJzd3NwZCI6MSwgInJhbmRzd3Q2IjpmYWxzZSwgImZrb3B0cmFuZDYiOlsifiJdLCAicmFuZHN3dDciOmZhbHNlLCAiZmtvcHRyYW5kNSI6WyJ+Il0sICJyYW5kZmtsc2wxIjowLCAicmFuZGZrbHNsNyI6MCwgInJhbmRma3JzbDEiOjAsICJyYW5kZmtyc2w2IjowLCAicmFuZGZrbHNsMiI6MH0sIHsicmFuZGZrcnNsMiI6NSwgInJhbmRma2xzbDMiOjAsICJyYW5kZmtyc2wzIjowLCAicmFuZGZrbHNsNCI6MSwgInJhbmRma3JzbDQiOjQsICJyYW5kZmtsc2w1Ijo1LCAicmFuZGZrcnNsNSI6MiwgInlhd19sIjowLCAieWF3X3IiOjAsICJ0cmlnZ2VycyI6WyJ+Il0sICJ5YXdscnJhbmQiOmZhbHNlLCAieWF3X2RlbGF5IjowLCAicmFuZGZrbHNsNiI6NCwgInlhd19tb2Rfb2Zmc2V0IjowLCAiZHNsZmttb2QiOiJTd2l0Y2hlZCIsICJkc2xma3Nsc3d0IjozMSwgInJhbmRma3JzbDciOjUsICJkc2xma3N3c3AiOjExLCAiZmtvcHRyYW5kMSI6WyJBdm9pZCBPdmVybGFwIiwgIkppdHRlciIsICJ+Il0sICJkc2xma3NscmFuIjowLCAiZmtvcHRyYW5kMiI6WyJKaXR0ZXIiLCAifiJdLCAiZHNsZmtyYW5zcGQiOjAsICJma29wdHJhbmQzIjpbIkppdHRlciIsICJSYW5kb21pemUgSml0dGVyIiwgIn4iXSwgImRzcmZrbW9kIjoiU3dpdGNoZWQiLCAiZmtvcHRyYW5kNCI6WyJKaXR0ZXIiLCAifiJdLCAiZHNyZmtzbHN3dCI6MTEsICJkc3Jma3N3c3AiOjUsICJkc3Jma3NscmFuIjowLCAiZHNyZmtyYW5zcGQiOjAsICJma2xhZ3N3dCI6MywgImZrb3B0cmFuZDciOlsiQXZvaWQgT3ZlcmxhcCIsICJKaXR0ZXIiLCAifiJdLCAiZmtpbnZlcnQiOmZhbHNlLCAiaW52ZXJ0c2wxIjp0cnVlLCAicmFuZG9tMSI6dHJ1ZSwgImludmVydHNsMiI6ZmFsc2UsICJyYW5kb20yIjp0cnVlLCAiaW52ZXJ0c2wzIjpmYWxzZSwgInJhbmRvbTMiOnRydWUsICJpbnZlcnRzbDQiOnRydWUsICJyYW5kb200Ijp0cnVlLCAiaW52ZXJ0c2w1Ijp0cnVlLCAicmFuZG9tNSI6dHJ1ZSwgImludmVydHNsNiI6ZmFsc2UsICJyYW5kb202Ijp0cnVlLCAiaW52ZXJ0c2w3IjpmYWxzZSwgInJhbmRvbTciOnRydWUsICJkZWZlbnNpdmVfcGl0Y2giOiJCZXR0ZXIgUmFuZG9tIiwgInJhbmRzbDEiOjMsICJyYW5kc2wyIjoxLCAicmFuZHNsMyI6MCwgImRlZmVuc2l2ZV9waXRjaDEiOi03OSwgInJhbmRzbDQiOjIsICJyYW5kZWZwdDEiOjAsICJyYW5kc2w1IjoxLCAiZGVmZW5zaXZlX3BpdGNoMiI6LTUsICJyYW5kc2w2IjozLCAiYmV0c3dzcGQiOjQsICJyYW5kc2w3IjozLCAicmFuZGVmcHQyIjowLCAiZmtsc2wxIjozOSwgInN3dHNsZDEiOjEsICJma3JzbDEiOjE1LCAiZmtsc2wyIjoxOCwgImZrcnNsMiI6MzksICJma2xzbDMiOjQ4LCAiZGVmZW5zaXZlX3lhdzIiOjIwLCAiZmtyc2wzIjo1MywgImZrbHNsNCI6MTEsICJma3JzbDQiOjQ0LCAiZmtsc2w1Ijo1MywgImRpc3NsIjowLCAiZmtyc2w1IjoxOCwgInlhd19iYXNlZCI6IkxvY2FsIFZpZXciLCAiZmtsc2w2Ijo1NSwgInN3dHNsZCI6MSwgImZrcnNsNiI6MTksICJoYW1ub19QRUVEIjo3LCAiZmtsc2w3IjoxMywgImJldHN3c3BkMyI6MSwgImZrcnNsNyI6NTAsICJiZXRzd3NwZDIiOjEsICJyYW5kc3d0MSI6dHJ1ZSwgInJhbmRlZnl3MiI6MCwgInJhbmRzd3QyIjp0cnVlLCAicmFuZGVmeXcxIjowLCAicmFuZHN3dDMiOmZhbHNlLCAiZGVmZW5zaXZlX3lhdzEiOi0xNSwgInJhbmRzd3Q0Ijp0cnVlLCAiZGVmZW5zaXZlX3lhdyI6IlN3YXkiLCAicmFuZHN3dDUiOnRydWUsICJzd3NwZCI6MSwgInJhbmRzd3Q2Ijp0cnVlLCAiZmtvcHRyYW5kNiI6WyJKaXR0ZXIiLCAifiJdLCAicmFuZHN3dDciOnRydWUsICJma29wdHJhbmQ1IjpbIkF2b2lkIE92ZXJsYXAiLCAiSml0dGVyIiwgIn4iXSwgInJhbmRma2xzbDEiOjE4LCAicmFuZGZrbHNsNyI6MywgInJhbmRma3JzbDEiOjUsICJyYW5kZmtyc2w2IjoxLCAicmFuZGZrbHNsMiI6M30sIHsicmFuZGZrcnNsMiI6MCwgInJhbmRma2xzbDMiOjAsICJyYW5kZmtyc2wzIjowLCAicmFuZGZrbHNsNCI6MCwgInJhbmRma3JzbDQiOjAsICJyYW5kZmtsc2w1IjowLCAicmFuZGZrcnNsNSI6MCwgInlhd19sIjotMTQsICJ5YXdfciI6MTYsICJ0cmlnZ2VycyI6WyJ+Il0sICJ5YXdscnJhbmQiOmZhbHNlLCAieWF3X2RlbGF5IjozLCAicmFuZGZrbHNsNiI6MCwgInlhd19tb2Rfb2Zmc2V0IjowLCAiZHNsZmttb2QiOiJTd2l0Y2hlZCIsICJkc2xma3Nsc3d0Ijo0MSwgInJhbmRma3JzbDciOjAsICJkc2xma3N3c3AiOjgsICJma29wdHJhbmQxIjpbIn4iXSwgImRzbGZrc2xyYW4iOjAsICJma29wdHJhbmQyIjpbIn4iXSwgImRzbGZrcmFuc3BkIjowLCAiZmtvcHRyYW5kMyI6WyJ+Il0sICJkc3Jma21vZCI6IlN3aXRjaGVkIiwgImZrb3B0cmFuZDQiOlsifiJdLCAiZHNyZmtzbHN3dCI6MjcsICJkc3Jma3N3c3AiOjE1LCAiZHNyZmtzbHJhbiI6MCwgImRzcmZrcmFuc3BkIjowLCAiZmtsYWdzd3QiOjEsICJma29wdHJhbmQ3IjpbIn4iXSwgImZraW52ZXJ0IjpmYWxzZSwgImludmVydHNsMSI6ZmFsc2UsICJyYW5kb20xIjpmYWxzZSwgImludmVydHNsMiI6ZmFsc2UsICJyYW5kb20yIjpmYWxzZSwgImludmVydHNsMyI6ZmFsc2UsICJyYW5kb20zIjpmYWxzZSwgImludmVydHNsNCI6ZmFsc2UsICJyYW5kb200IjpmYWxzZSwgImludmVydHNsNSI6ZmFsc2UsICJyYW5kb201IjpmYWxzZSwgImludmVydHNsNiI6ZmFsc2UsICJyYW5kb202IjpmYWxzZSwgImludmVydHNsNyI6ZmFsc2UsICJyYW5kb203IjpmYWxzZSwgImRlZmVuc2l2ZV9waXRjaCI6IkJldHRlciBSYW5kb20iLCAicmFuZHNsMSI6MCwgInJhbmRzbDIiOjAsICJyYW5kc2wzIjowLCAiZGVmZW5zaXZlX3BpdGNoMSI6LTY1LCAicmFuZHNsNCI6MCwgInJhbmRlZnB0MSI6MCwgInJhbmRzbDUiOjAsICJkZWZlbnNpdmVfcGl0Y2gyIjoxMiwgInJhbmRzbDYiOjAsICJiZXRzd3NwZCI6NiwgInJhbmRzbDciOjAsICJyYW5kZWZwdDIiOjAsICJma2xzbDEiOjAsICJzd3RzbGQxIjoxLCAiZmtyc2wxIjowLCAiZmtsc2wyIjowLCAiZmtyc2wyIjowLCAiZmtsc2wzIjowLCAiZGVmZW5zaXZlX3lhdzIiOjQ0LCAiZmtyc2wzIjowLCAiZmtsc2w0IjowLCAiZmtyc2w0IjowLCAiZmtsc2w1IjowLCAiZGlzc2wiOjAsICJma3JzbDUiOjAsICJ5YXdfYmFzZWQiOiJMb2NhbCBWaWV3IiwgImZrbHNsNiI6MCwgInN3dHNsZCI6MSwgImZrcnNsNiI6MCwgImhhbW5vX1BFRUQiOjEsICJma2xzbDciOjAsICJiZXRzd3NwZDMiOjMsICJma3JzbDciOjAsICJiZXRzd3NwZDIiOjEsICJyYW5kc3d0MSI6ZmFsc2UsICJyYW5kZWZ5dzIiOjAsICJyYW5kc3d0MiI6ZmFsc2UsICJyYW5kZWZ5dzEiOjAsICJyYW5kc3d0MyI6ZmFsc2UsICJkZWZlbnNpdmVfeWF3MSI6LTQ5LCAicmFuZHN3dDQiOmZhbHNlLCAiZGVmZW5zaXZlX3lhdyI6IkJldHRlciBSYW5kb20iLCAicmFuZHN3dDUiOmZhbHNlLCAic3dzcGQiOjEsICJyYW5kc3d0NiI6ZmFsc2UsICJma29wdHJhbmQ2IjpbIn4iXSwgInJhbmRzd3Q3IjpmYWxzZSwgImZrb3B0cmFuZDUiOlsifiJdLCAicmFuZGZrbHNsMSI6MCwgInJhbmRma2xzbDciOjAsICJyYW5kZmtyc2wxIjowLCAicmFuZGZrcnNsNiI6MCwgInJhbmRma2xzbDIiOjB9LCB7InJhbmRma3JzbDIiOjAsICJyYW5kZmtsc2wzIjowLCAicmFuZGZrcnNsMyI6MCwgInJhbmRma2xzbDQiOjAsICJyYW5kZmtyc2w0IjowLCAicmFuZGZrbHNsNSI6MCwgInJhbmRma3JzbDUiOjAsICJ5YXdfbCI6LTEzLCAieWF3X3IiOjExLCAidHJpZ2dlcnMiOlsifiJdLCAieWF3bHJyYW5kIjpmYWxzZSwgInlhd19kZWxheSI6MywgInJhbmRma2xzbDYiOjAsICJ5YXdfbW9kX29mZnNldCI6MCwgImRzbGZrbW9kIjoiU3dpdGNoZWQiLCAiZHNsZmtzbHN3dCI6MTYsICJyYW5kZmtyc2w3IjowLCAiZHNsZmtzd3NwIjozLCAiZmtvcHRyYW5kMSI6WyJ+Il0sICJkc2xma3NscmFuIjowLCAiZmtvcHRyYW5kMiI6WyJ+Il0sICJkc2xma3JhbnNwZCI6MCwgImZrb3B0cmFuZDMiOlsifiJdLCAiZHNyZmttb2QiOiJTd2l0Y2hlZCIsICJma29wdHJhbmQ0IjpbIn4iXSwgImRzcmZrc2xzd3QiOjQyLCAiZHNyZmtzd3NwIjoxOCwgImRzcmZrc2xyYW4iOjAsICJkc3Jma3JhbnNwZCI6MCwgImZrbGFnc3d0IjoxLCAiZmtvcHRyYW5kNyI6WyJ+Il0sICJma2ludmVydCI6dHJ1ZSwgImludmVydHNsMSI6ZmFsc2UsICJyYW5kb20xIjpmYWxzZSwgImludmVydHNsMiI6ZmFsc2UsICJyYW5kb20yIjpmYWxzZSwgImludmVydHNsMyI6ZmFsc2UsICJyYW5kb20zIjpmYWxzZSwgImludmVydHNsNCI6ZmFsc2UsICJyYW5kb200IjpmYWxzZSwgImludmVydHNsNSI6ZmFsc2UsICJyYW5kb201IjpmYWxzZSwgImludmVydHNsNiI6ZmFsc2UsICJyYW5kb202IjpmYWxzZSwgImludmVydHNsNyI6ZmFsc2UsICJyYW5kb203IjpmYWxzZSwgImRlZmVuc2l2ZV9waXRjaCI6IkJldHRlciBSYW5kb20iLCAicmFuZHNsMSI6MCwgInJhbmRzbDIiOjAsICJyYW5kc2wzIjowLCAiZGVmZW5zaXZlX3BpdGNoMSI6LTczLCAicmFuZHNsNCI6MCwgInJhbmRlZnB0MSI6NywgInJhbmRzbDUiOjAsICJkZWZlbnNpdmVfcGl0Y2gyIjoxMywgInJhbmRzbDYiOjAsICJiZXRzd3NwZCI6MiwgInJhbmRzbDciOjAsICJyYW5kZWZwdDIiOjIsICJma2xzbDEiOjAsICJzd3RzbGQxIjo3LCAiZmtyc2wxIjowLCAiZmtsc2wyIjowLCAiZmtyc2wyIjowLCAiZmtsc2wzIjowLCAiZGVmZW5zaXZlX3lhdzIiOjI2LCAiZmtyc2wzIjowLCAiZmtsc2w0IjowLCAiZmtyc2w0IjowLCAiZmtsc2w1IjowLCAiZGlzc2wiOjAsICJma3JzbDUiOjAsICJ5YXdfYmFzZWQiOiJMb2NhbCBWaWV3IiwgImZrbHNsNiI6MCwgInN3dHNsZCI6MSwgImZrcnNsNiI6MCwgImhhbW5vX1BFRUQiOjE0LCAiZmtsc2w3IjowLCAiYmV0c3dzcGQzIjozLCAiZmtyc2w3IjowLCAiYmV0c3dzcGQyIjoxLCAicmFuZHN3dDEiOmZhbHNlLCAicmFuZGVmeXcyIjowLCAicmFuZHN3dDIiOmZhbHNlLCAicmFuZGVmeXcxIjowLCAicmFuZHN3dDMiOmZhbHNlLCAiZGVmZW5zaXZlX3lhdzEiOjE4MCwgInJhbmRzd3Q0IjpmYWxzZSwgImRlZmVuc2l2ZV95YXciOiJTcGluIiwgInJhbmRzd3Q1IjpmYWxzZSwgInN3c3BkIjoxLCAicmFuZHN3dDYiOmZhbHNlLCAiZmtvcHRyYW5kNiI6WyJ+Il0sICJyYW5kc3d0NyI6ZmFsc2UsICJma29wdHJhbmQ1IjpbIn4iXSwgInJhbmRma2xzbDEiOjAsICJyYW5kZmtsc2w3IjowLCAicmFuZGZrcnNsMSI6MCwgInJhbmRma3JzbDYiOjAsICJyYW5kZmtsc2wyIjowfSwgeyJyYW5kZmtyc2wyIjowLCAicmFuZGZrbHNsMyI6MCwgInJhbmRma3JzbDMiOjAsICJyYW5kZmtsc2w0IjowLCAicmFuZGZrcnNsNCI6MCwgInJhbmRma2xzbDUiOjAsICJyYW5kZmtyc2w1IjowLCAieWF3X2wiOi0xNywgInlhd19yIjoxNSwgInRyaWdnZXJzIjpbIn4iXSwgInlhd2xycmFuZCI6ZmFsc2UsICJ5YXdfZGVsYXkiOjMsICJyYW5kZmtsc2w2IjowLCAieWF3X21vZF9vZmZzZXQiOjAsICJkc2xma21vZCI6IlN3aXRjaGVkIiwgImRzbGZrc2xzd3QiOjM5LCAicmFuZGZrcnNsNyI6MCwgImRzbGZrc3dzcCI6MTYsICJma29wdHJhbmQxIjpbIn4iXSwgImRzbGZrc2xyYW4iOjAsICJma29wdHJhbmQyIjpbIn4iXSwgImRzbGZrcmFuc3BkIjowLCAiZmtvcHRyYW5kMyI6WyJ+Il0sICJkc3Jma21vZCI6IlJhbmRvbSIsICJma29wdHJhbmQ0IjpbIn4iXSwgImRzcmZrc2xzd3QiOjIzLCAiZHNyZmtzd3NwIjowLCAiZHNyZmtzbHJhbiI6MTIsICJkc3Jma3JhbnNwZCI6NCwgImZrbGFnc3d0IjoxLCAiZmtvcHRyYW5kNyI6WyJ+Il0sICJma2ludmVydCI6ZmFsc2UsICJpbnZlcnRzbDEiOmZhbHNlLCAicmFuZG9tMSI6ZmFsc2UsICJpbnZlcnRzbDIiOmZhbHNlLCAicmFuZG9tMiI6ZmFsc2UsICJpbnZlcnRzbDMiOmZhbHNlLCAicmFuZG9tMyI6ZmFsc2UsICJpbnZlcnRzbDQiOmZhbHNlLCAicmFuZG9tNCI6ZmFsc2UsICJpbnZlcnRzbDUiOmZhbHNlLCAicmFuZG9tNSI6ZmFsc2UsICJpbnZlcnRzbDYiOmZhbHNlLCAicmFuZG9tNiI6ZmFsc2UsICJpbnZlcnRzbDciOmZhbHNlLCAicmFuZG9tNyI6ZmFsc2UsICJkZWZlbnNpdmVfcGl0Y2giOiJCZXR0ZXIgUmFuZG9tIiwgInJhbmRzbDEiOjAsICJyYW5kc2wyIjowLCAicmFuZHNsMyI6MCwgImRlZmVuc2l2ZV9waXRjaDEiOi03MywgInJhbmRzbDQiOjAsICJyYW5kZWZwdDEiOjEzLCAicmFuZHNsNSI6MCwgImRlZmVuc2l2ZV9waXRjaDIiOjI2LCAicmFuZHNsNiI6MCwgImJldHN3c3BkIjozLCAicmFuZHNsNyI6MCwgInJhbmRlZnB0MiI6MzAsICJma2xzbDEiOjAsICJzd3RzbGQxIjoxNiwgImZrcnNsMSI6MCwgImZrbHNsMiI6MCwgImZrcnNsMiI6MCwgImZrbHNsMyI6MCwgImRlZmVuc2l2ZV95YXcyIjo3MiwgImZrcnNsMyI6MCwgImZrbHNsNCI6MCwgImZrcnNsNCI6MCwgImZrbHNsNSI6MCwgImRpc3NsIjowLCAiZmtyc2w1IjowLCAieWF3X2Jhc2VkIjoiTG9jYWwgVmlldyIsICJma2xzbDYiOjAsICJzd3RzbGQiOjEsICJma3JzbDYiOjAsICJoYW1ub19QRUVEIjo5LCAiZmtsc2w3IjowLCAiYmV0c3dzcGQzIjoxLCAiZmtyc2w3IjowLCAiYmV0c3dzcGQyIjoxNSwgInJhbmRzd3QxIjpmYWxzZSwgInJhbmRlZnl3MiI6NCwgInJhbmRzd3QyIjpmYWxzZSwgInJhbmRlZnl3MSI6NSwgInJhbmRzd3QzIjpmYWxzZSwgImRlZmVuc2l2ZV95YXcxIjotODYsICJyYW5kc3d0NCI6ZmFsc2UsICJkZWZlbnNpdmVfeWF3IjoiU3dheSIsICJyYW5kc3d0NSI6ZmFsc2UsICJzd3NwZCI6MSwgInJhbmRzd3Q2IjpmYWxzZSwgImZrb3B0cmFuZDYiOlsifiJdLCAicmFuZHN3dDciOmZhbHNlLCAiZmtvcHRyYW5kNSI6WyJ+Il0sICJyYW5kZmtsc2wxIjowLCAicmFuZGZrbHNsNyI6MCwgInJhbmRma3JzbDEiOjAsICJyYW5kZmtyc2w2IjowLCAicmFuZGZrbHNsMiI6MH0sIHsicmFuZGZrcnNsMiI6MCwgInJhbmRma2xzbDMiOjAsICJyYW5kZmtyc2wzIjowLCAicmFuZGZrbHNsNCI6MCwgInJhbmRma3JzbDQiOjAsICJyYW5kZmtsc2w1IjowLCAicmFuZGZrcnNsNSI6MCwgInlhd19sIjotMywgInlhd19yIjozLCAidHJpZ2dlcnMiOlsifiJdLCAieWF3bHJyYW5kIjpmYWxzZSwgInlhd19kZWxheSI6NywgInJhbmRma2xzbDYiOjAsICJ5YXdfbW9kX29mZnNldCI6MCwgImRzbGZrbW9kIjoiU3dpdGNoZWQiLCAiZHNsZmtzbHN3dCI6MjEsICJyYW5kZmtyc2w3IjowLCAiZHNsZmtzd3NwIjo1LCAiZmtvcHRyYW5kMSI6WyJ+Il0sICJkc2xma3NscmFuIjowLCAiZmtvcHRyYW5kMiI6WyJ+Il0sICJkc2xma3JhbnNwZCI6MCwgImZrb3B0cmFuZDMiOlsifiJdLCAiZHNyZmttb2QiOiJSYW5kb20iLCAiZmtvcHRyYW5kNCI6WyJ+Il0sICJkc3Jma3Nsc3d0IjowLCAiZHNyZmtzd3NwIjowLCAiZHNyZmtzbHJhbiI6OCwgImRzcmZrcmFuc3BkIjo0LCAiZmtsYWdzd3QiOjEsICJma29wdHJhbmQ3IjpbIn4iXSwgImZraW52ZXJ0IjpmYWxzZSwgImludmVydHNsMSI6ZmFsc2UsICJyYW5kb20xIjpmYWxzZSwgImludmVydHNsMiI6ZmFsc2UsICJyYW5kb20yIjpmYWxzZSwgImludmVydHNsMyI6ZmFsc2UsICJyYW5kb20zIjpmYWxzZSwgImludmVydHNsNCI6ZmFsc2UsICJyYW5kb200IjpmYWxzZSwgImludmVydHNsNSI6ZmFsc2UsICJyYW5kb201IjpmYWxzZSwgImludmVydHNsNiI6ZmFsc2UsICJyYW5kb202IjpmYWxzZSwgImludmVydHNsNyI6ZmFsc2UsICJyYW5kb203IjpmYWxzZSwgImRlZmVuc2l2ZV9waXRjaCI6IlN0YXRpYyIsICJyYW5kc2wxIjowLCAicmFuZHNsMiI6MCwgInJhbmRzbDMiOjAsICJkZWZlbnNpdmVfcGl0Y2gxIjo4OSwgInJhbmRzbDQiOjAsICJyYW5kZWZwdDEiOjAsICJyYW5kc2w1IjowLCAiZGVmZW5zaXZlX3BpdGNoMiI6MCwgInJhbmRzbDYiOjAsICJiZXRzd3NwZCI6MSwgInJhbmRzbDciOjAsICJyYW5kZWZwdDIiOjAsICJma2xzbDEiOjAsICJzd3RzbGQxIjoxLCAiZmtyc2wxIjowLCAiZmtsc2wyIjowLCAiZmtyc2wyIjowLCAiZmtsc2wzIjowLCAiZGVmZW5zaXZlX3lhdzIiOjksICJma3JzbDMiOjAsICJma2xzbDQiOjAsICJma3JzbDQiOjAsICJma2xzbDUiOjAsICJkaXNzbCI6MCwgImZrcnNsNSI6MCwgInlhd19iYXNlZCI6IkxvY2FsIFZpZXciLCAiZmtsc2w2IjowLCAic3d0c2xkIjoxMCwgImZrcnNsNiI6MCwgImhhbW5vX1BFRUQiOjEsICJma2xzbDciOjAsICJiZXRzd3NwZDMiOjEsICJma3JzbDciOjAsICJiZXRzd3NwZDIiOjEsICJyYW5kc3d0MSI6ZmFsc2UsICJyYW5kZWZ5dzIiOjAsICJyYW5kc3d0MiI6ZmFsc2UsICJyYW5kZWZ5dzEiOjAsICJyYW5kc3d0MyI6ZmFsc2UsICJkZWZlbnNpdmVfeWF3MSI6LTgsICJyYW5kc3d0NCI6ZmFsc2UsICJkZWZlbnNpdmVfeWF3IjoiU3dpdGNoIiwgInJhbmRzd3Q1IjpmYWxzZSwgInN3c3BkIjoxLCAicmFuZHN3dDYiOmZhbHNlLCAiZmtvcHRyYW5kNiI6WyJ+Il0sICJyYW5kc3d0NyI6ZmFsc2UsICJma29wdHJhbmQ1IjpbIn4iXSwgInJhbmRma2xzbDEiOjAsICJyYW5kZmtsc2w3IjowLCAicmFuZGZrcnNsMSI6MCwgInJhbmRma3JzbDYiOjAsICJyYW5kZmtsc2wyIjowfSwgeyJyYW5kZmtyc2wyIjowLCAicmFuZGZrbHNsMyI6MCwgInJhbmRma3JzbDMiOjAsICJyYW5kZmtsc2w0IjowLCAicmFuZGZrcnNsNCI6MCwgInJhbmRma2xzbDUiOjAsICJyYW5kZmtyc2w1IjowLCAieWF3X2wiOjAsICJ5YXdfciI6MCwgInRyaWdnZXJzIjpbIn4iXSwgInlhd2xycmFuZCI6ZmFsc2UsICJ5YXdfZGVsYXkiOjAsICJyYW5kZmtsc2w2IjowLCAieWF3X21vZF9vZmZzZXQiOjAsICJkc2xma21vZCI6IlJhbmRvbSIsICJkc2xma3Nsc3d0IjowLCAicmFuZGZrcnNsNyI6MCwgImRzbGZrc3dzcCI6MCwgImZrb3B0cmFuZDEiOlsifiJdLCAiZHNsZmtzbHJhbiI6MjAsICJma29wdHJhbmQyIjpbIn4iXSwgImRzbGZrcmFuc3BkIjo4LCAiZmtvcHRyYW5kMyI6WyJ+Il0sICJkc3Jma21vZCI6IlN3aXRjaGVkIiwgImZrb3B0cmFuZDQiOlsifiJdLCAiZHNyZmtzbHN3dCI6NywgImRzcmZrc3dzcCI6MjUsICJkc3Jma3NscmFuIjowLCAiZHNyZmtyYW5zcGQiOjAsICJma2xhZ3N3dCI6MSwgImZrb3B0cmFuZDciOlsifiJdLCAiZmtpbnZlcnQiOmZhbHNlLCAiaW52ZXJ0c2wxIjpmYWxzZSwgInJhbmRvbTEiOmZhbHNlLCAiaW52ZXJ0c2wyIjpmYWxzZSwgInJhbmRvbTIiOmZhbHNlLCAiaW52ZXJ0c2wzIjpmYWxzZSwgInJhbmRvbTMiOmZhbHNlLCAiaW52ZXJ0c2w0IjpmYWxzZSwgInJhbmRvbTQiOmZhbHNlLCAiaW52ZXJ0c2w1IjpmYWxzZSwgInJhbmRvbTUiOmZhbHNlLCAiaW52ZXJ0c2w2IjpmYWxzZSwgInJhbmRvbTYiOmZhbHNlLCAiaW52ZXJ0c2w3IjpmYWxzZSwgInJhbmRvbTciOmZhbHNlLCAiZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwgInJhbmRzbDEiOjAsICJyYW5kc2wyIjowLCAicmFuZHNsMyI6MCwgImRlZmVuc2l2ZV9waXRjaDEiOjAsICJyYW5kc2w0IjowLCAicmFuZGVmcHQxIjowLCAicmFuZHNsNSI6MCwgImRlZmVuc2l2ZV9waXRjaDIiOjAsICJyYW5kc2w2IjowLCAiYmV0c3dzcGQiOjEsICJyYW5kc2w3IjowLCAicmFuZGVmcHQyIjowLCAiZmtsc2wxIjowLCAic3d0c2xkMSI6MSwgImZrcnNsMSI6MCwgImZrbHNsMiI6MCwgImZrcnNsMiI6MCwgImZrbHNsMyI6MCwgImRlZmVuc2l2ZV95YXcyIjowLCAiZmtyc2wzIjowLCAiZmtsc2w0IjowLCAiZmtyc2w0IjowLCAiZmtsc2w1IjowLCAiZGlzc2wiOjAsICJma3JzbDUiOjAsICJ5YXdfYmFzZWQiOiJMb2NhbCBWaWV3IiwgImZrbHNsNiI6MCwgInN3dHNsZCI6MSwgImZrcnNsNiI6MCwgImhhbW5vX1BFRUQiOjEsICJma2xzbDciOjAsICJiZXRzd3NwZDMiOjEsICJma3JzbDciOjAsICJiZXRzd3NwZDIiOjEsICJyYW5kc3d0MSI6ZmFsc2UsICJyYW5kZWZ5dzIiOjAsICJyYW5kc3d0MiI6ZmFsc2UsICJyYW5kZWZ5dzEiOjAsICJyYW5kc3d0MyI6ZmFsc2UsICJkZWZlbnNpdmVfeWF3MSI6MCwgInJhbmRzd3Q0IjpmYWxzZSwgImRlZmVuc2l2ZV95YXciOiJTdGF0aWMiLCAicmFuZHN3dDUiOmZhbHNlLCAic3dzcGQiOjEsICJyYW5kc3d0NiI6ZmFsc2UsICJma29wdHJhbmQ2IjpbIn4iXSwgInJhbmRzd3Q3IjpmYWxzZSwgImZrb3B0cmFuZDUiOlsifiJdLCAicmFuZGZrbHNsMSI6MCwgInJhbmRma2xzbDciOjAsICJyYW5kZmtyc2wxIjowLCAicmFuZGZrcnNsNiI6MCwgInJhbmRma2xzbDIiOjB9XSwgeyJ0cmlnZ2Vyc3BocyI6WyJZb3UgR2V0IEhpdCIsICJ+Il19XSwgImNvbmZpZyI6W3sid3QiOnRydWUsICJjb25zb2xlIjp0cnVlLCAiZW5hYmxlX3RyYXNodGFsayI6ZmFsc2UsICJkaXNjaHJnc3d0IjpmYWxzZSwgImNsYW50YWciOnRydWUsICJ2bGluZCI6dHJ1ZSwgImRtZzFuZCI6dHJ1ZSwgImF2b2lkZXIiOnRydWUsICJsYW5nbHN0IjoxLCAic2FmZWhhZGUiOnRydWUsICJmcmVlc3RuZCI6ZmFsc2UsICJpbmRzd3QiOnRydWUsICJ3aWRnc3d0Ijp0cnVlLCAiYWlybGFnc3d0IjpmYWxzZSwgImdyZW50aHJvdyI6dHJ1ZSwgImR0Ijp0cnVlLCAibmZkIjp0cnVlfSwgeyJ2aWV3bW9kZWxfc3dpdGNoIjp0cnVlLCAiY3VzdG9tX3Njb3BlIjp0cnVlLCAiYXNwZWN0X3JhdGlvX3N3aXRjaCI6dHJ1ZSwgImdyb3VwIjp0cnVlLCAiYW5pbWF0aW9uX2JyZWFrZXJzIjp0cnVlLCAicjhwcmVkIjpmYWxzZSwgInByZWRpY3QiOmZhbHNlLCAiYWlybnMiOmZhbHNlLCAidmxjbHIiOiIjRkZGRkZGRkYiLCAidmxjbHIyIjoiI0ZGRkZGRkZGIiwgInZseCI6ODcwLCAidmx5IjoyOTAsICJib2R5ZnJzdG4iOmZhbHNlLCAiZGlzeWF3IjpmYWxzZSwgImRlbGF5IjowLCAiY3N0bW5hbWUiOiJEcXJrVHFyZ2V0IiwgIndpZHNpZGUiOiIjRkYwMDAwRkYiLCAid2lkc2hhZCI6IiNGRjAwMDBGRiIsICJ3aWR0ZXh0IjoiI0ZGMDAwMEZGIiwgImRlZHNheSI6ZmFsc2UsICJjb25jbHIiOiIjNDg0MTQxN0MiLCAiZHNjaHJnd2VhcCI6WyJ+Il0sICJ3dGNsciI6IiNGRkZGRkZGRiIsICJncmNsciI6IiNGRjAwMDBGRiIsICJ3dHNwZCI6MjAsICJkdGNocmciOiIjMDBGRjAwRkYiLCAiZHRjbHIiOiIjRkZGRkZGRkYiLCAiZG1nY2xyIjoiI0ZGRkZGRkZGIiwgIngxIjo4LCAieTEiOi0xMywgImZhc3RfbGFkZGVyIjp0cnVlLCAiYWlybGdzcCI6MTAsICJ3aWRnY3J0IjpbMSwgMiwgMywgIn4iXX0sIHsiYWlyX2xlZ3MiOiJTdGF0aWMiLCAiZ3JvdW5kX2xlZ3MiOiJTdGF0aWMiLCAiaGl0bG9nZm9udCI6MSwgImluZF9mb250IjoyLCAiYWlyc3NnIjowLCAibG9nX3giOjgwMCwgImFpcmF3cCI6MCwgImxvZ195Ijo3MDAsICJhaXJhdXRvIjowLCAidmlld21vZGVsX2ZvdiI6NjgsICJ2aWV3bW9kZWxfeCI6MywgInZpZXdtb2RlbF95IjowLCAidmlld21vZGVsX3oiOi0yLCAiYXNwZWN0X3JhdGlvX3NsaWRlciI6MTIsICJwcmludGNvbnNvbGUiOlsxLCAyLCAzLCAifiJdLCAic2NvcGVfZ2FwIjo5LCAic2NvcGVfbGVuZ3RoIjoyMjQsICJzY29wZV9jb2xvciI6IiNGRkZGRkZGRiJ9LCBbeyJzbDEiOjAsICJkZXN5bmNfZnJlZXN0YW5kIjoiT2ZmIiwgInNsMiI6MCwgInNsMyI6MCwgImRlZmVuc2l2ZV9hYSI6dHJ1ZSwgInNsNCI6MCwgImRpc2RlZnMiOmZhbHNlLCAic2w1IjowLCAiZmtsYWdsdCI6ZmFsc2UsICJzbHRpY2siOjUsICJsY19lbmFibGUiOnRydWUsICJzbDE3dyI6MCwgInNsMjd3IjowLCAic2wzN3ciOjAsICJzbDQ3dyI6MCwgInNsNTd3IjowLCAic2w2N3ciOjAsICJzbDc3dyI6MCwgInlhd2Jhc2VkIjoiQmFja3dhcmQiLCAiYm9keV95YXciOnRydWUsICJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCAiZGVzeW5jX2wiOjU2LCAibGNfZW5hYmxlX29uIjpbMSwgMiwgIn4iXSwgInlhdyI6IlN3aXRjaGVkIiwgImRlc3luY19yIjozMywgImZha2Vfb3B0aW9ucyI6WyJBdm9pZCBPdmVybGFwIiwgIkppdHRlciIsICJ+Il19LCB7InNsMSI6MCwgImRlc3luY19mcmVlc3RhbmQiOiJPZmYiLCAic2wyIjowLCAic2wzIjowLCAiZGVmZW5zaXZlX2FhIjpmYWxzZSwgInNsNCI6MCwgImRpc2RlZnMiOmZhbHNlLCAic2w1IjowLCAiZmtsYWdsdCI6dHJ1ZSwgInNsdGljayI6NCwgImxjX2VuYWJsZSI6dHJ1ZSwgInNsMTd3IjoxMiwgInNsMjd3Ijo4LCAic2wzN3ciOjQsICJzbDQ3dyI6OCwgInNsNTd3Ijo5LCAic2w2N3ciOjgsICJzbDc3dyI6OSwgInlhd2Jhc2VkIjoiQmFja3dhcmQiLCAiYm9keV95YXciOnRydWUsICJ5YXdfbW9kaWZpZXIiOiJDdXN0b20gNy1XYXkiLCAiZGVzeW5jX2wiOjYwLCAibGNfZW5hYmxlX29uIjpbMSwgMiwgIn4iXSwgInlhdyI6IkRlZmF1bHQiLCAiZGVzeW5jX3IiOjI1LCAiZmFrZV9vcHRpb25zIjpbIkppdHRlciIsICJSYW5kb21pemUgSml0dGVyIiwgIn4iXX0sIHsic2wxIjowLCAiZGVzeW5jX2ZyZWVzdGFuZCI6Ik9mZiIsICJzbDIiOjAsICJzbDMiOjAsICJkZWZlbnNpdmVfYWEiOnRydWUsICJzbDQiOjAsICJkaXNkZWZzIjpmYWxzZSwgInNsNSI6MCwgImZrbGFnbHQiOnRydWUsICJzbHRpY2siOjUsICJsY19lbmFibGUiOnRydWUsICJzbDE3dyI6MCwgInNsMjd3IjowLCAic2wzN3ciOjAsICJzbDQ3dyI6MCwgInNsNTd3IjowLCAic2w2N3ciOjAsICJzbDc3dyI6MCwgInlhd2Jhc2VkIjoiQmFja3dhcmQiLCAiYm9keV95YXciOnRydWUsICJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCAiZGVzeW5jX2wiOjU0LCAibGNfZW5hYmxlX29uIjpbMSwgMiwgIn4iXSwgInlhdyI6IlN3aXRjaGVkIiwgImRlc3luY19yIjozMiwgImZha2Vfb3B0aW9ucyI6WyJKaXR0ZXIiLCAiUmFuZG9taXplIEppdHRlciIsICJ+Il19LCB7InNsMSI6MCwgImRlc3luY19mcmVlc3RhbmQiOiJPZmYiLCAic2wyIjowLCAic2wzIjowLCAiZGVmZW5zaXZlX2FhIjp0cnVlLCAic2w0IjowLCAiZGlzZGVmcyI6ZmFsc2UsICJzbDUiOjAsICJma2xhZ2x0Ijp0cnVlLCAic2x0aWNrIjo1LCAibGNfZW5hYmxlIjp0cnVlLCAic2wxN3ciOjAsICJzbDI3dyI6MCwgInNsMzd3IjowLCAic2w0N3ciOjAsICJzbDU3dyI6MCwgInNsNjd3IjowLCAic2w3N3ciOjAsICJ5YXdiYXNlZCI6IkJhY2t3YXJkIiwgImJvZHlfeWF3Ijp0cnVlLCAieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwgImRlc3luY19sIjoyNCwgImxjX2VuYWJsZV9vbiI6WzEsIDIsICJ+Il0sICJ5YXciOiJTd2l0Y2hlZCIsICJkZXN5bmNfciI6NTEsICJmYWtlX29wdGlvbnMiOlsiQXZvaWQgT3ZlcmxhcCIsICJKaXR0ZXIiLCAiUmFuZG9taXplIEppdHRlciIsICJ+Il19LCB7InNsMSI6MCwgImRlc3luY19mcmVlc3RhbmQiOiJPZmYiLCAic2wyIjowLCAic2wzIjowLCAiZGVmZW5zaXZlX2FhIjp0cnVlLCAic2w0IjowLCAiZGlzZGVmcyI6ZmFsc2UsICJzbDUiOjAsICJma2xhZ2x0Ijp0cnVlLCAic2x0aWNrIjo1LCAibGNfZW5hYmxlIjp0cnVlLCAic2wxN3ciOjAsICJzbDI3dyI6MCwgInNsMzd3IjowLCAic2w0N3ciOjAsICJzbDU3dyI6MCwgInNsNjd3IjowLCAic2w3N3ciOjAsICJ5YXdiYXNlZCI6IkJhY2t3YXJkIiwgImJvZHlfeWF3Ijp0cnVlLCAieWF3X21vZGlmaWVyIjoiQ2VudGVyIiwgImRlc3luY19sIjo1OCwgImxjX2VuYWJsZV9vbiI6WzEsIDIsICJ+Il0sICJ5YXciOiJTd2l0Y2hlZCIsICJkZXN5bmNfciI6MjEsICJmYWtlX29wdGlvbnMiOlsiSml0dGVyIiwgIlJhbmRvbWl6ZSBKaXR0ZXIiLCAifiJdfSwgeyJzbDEiOjAsICJkZXN5bmNfZnJlZXN0YW5kIjoiT2ZmIiwgInNsMiI6MCwgInNsMyI6MCwgImRlZmVuc2l2ZV9hYSI6dHJ1ZSwgInNsNCI6MCwgImRpc2RlZnMiOmZhbHNlLCAic2w1IjowLCAiZmtsYWdsdCI6ZmFsc2UsICJzbHRpY2siOjUsICJsY19lbmFibGUiOnRydWUsICJzbDE3dyI6MCwgInNsMjd3IjowLCAic2wzN3ciOjAsICJzbDQ3dyI6MCwgInNsNTd3IjowLCAic2w2N3ciOjAsICJzbDc3dyI6MCwgInlhd2Jhc2VkIjoiQmFja3dhcmQiLCAiYm9keV95YXciOnRydWUsICJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCAiZGVzeW5jX2wiOjI3LCAibGNfZW5hYmxlX29uIjpbMSwgMiwgIn4iXSwgInlhdyI6IlN3aXRjaGVkIiwgImRlc3luY19yIjoxMiwgImZha2Vfb3B0aW9ucyI6WyJBdm9pZCBPdmVybGFwIiwgIkppdHRlciIsICJ+Il19LCB7InNsMSI6MCwgImRlc3luY19mcmVlc3RhbmQiOiJPZmYiLCAic2wyIjowLCAic2wzIjowLCAiZGVmZW5zaXZlX2FhIjpmYWxzZSwgInNsNCI6MCwgImRpc2RlZnMiOmZhbHNlLCAic2w1IjowLCAiZmtsYWdsdCI6ZmFsc2UsICJzbHRpY2siOjUsICJsY19lbmFibGUiOnRydWUsICJzbDE3dyI6MCwgInNsMjd3IjowLCAic2wzN3ciOjAsICJzbDQ3dyI6MCwgInNsNTd3IjowLCAic2w2N3ciOjAsICJzbDc3dyI6MCwgInlhd2Jhc2VkIjoiQmFja3dhcmQiLCAiYm9keV95YXciOnRydWUsICJ5YXdfbW9kaWZpZXIiOiJDZW50ZXIiLCAiZGVzeW5jX2wiOjQ1LCAibGNfZW5hYmxlX29uIjpbMSwgMiwgIn4iXSwgInlhdyI6IkRlZmF1bHQiLCAiZGVzeW5jX3IiOjE1LCAiZmFrZV9vcHRpb25zIjpbIkF2b2lkIE92ZXJsYXAiLCAiSml0dGVyIiwgIn4iXX1dLCBbeyJyYW5kZmtyc2wyIjowLCAicmFuZGZrbHNsMyI6MCwgInJhbmRma3JzbDMiOjAsICJyYW5kZmtsc2w0IjowLCAicmFuZGZrcnNsNCI6MCwgInJhbmRma2xzbDUiOjAsICJyYW5kZmtyc2w1IjowLCAieWF3X2wiOi04LCAieWF3X3IiOjksICJ0cmlnZ2VycyI6WyJ+Il0sICJ5YXdscnJhbmQiOmZhbHNlLCAieWF3X2RlbGF5Ijo1LCAicmFuZGZrbHNsNiI6MCwgInlhd19tb2Rfb2Zmc2V0IjowLCAiZHNsZmttb2QiOiJTd2l0Y2hlZCIsICJkc2xma3Nsc3d0IjozOCwgInJhbmRma3JzbDciOjAsICJkc2xma3N3c3AiOjksICJma29wdHJhbmQxIjpbIn4iXSwgImRzbGZrc2xyYW4iOjAsICJma29wdHJhbmQyIjpbIn4iXSwgImRzbGZrcmFuc3BkIjowLCAiZmtvcHRyYW5kMyI6WyJ+Il0sICJkc3Jma21vZCI6IlN3aXRjaGVkIiwgImZrb3B0cmFuZDQiOlsifiJdLCAiZHNyZmtzbHN3dCI6MTcsICJkc3Jma3N3c3AiOjExLCAiZHNyZmtzbHJhbiI6MCwgImRzcmZrcmFuc3BkIjowLCAiZmtsYWdzd3QiOjEsICJma29wdHJhbmQ3IjpbIn4iXSwgImZraW52ZXJ0IjpmYWxzZSwgImludmVydHNsMSI6ZmFsc2UsICJyYW5kb20xIjpmYWxzZSwgImludmVydHNsMiI6ZmFsc2UsICJyYW5kb20yIjpmYWxzZSwgImludmVydHNsMyI6ZmFsc2UsICJyYW5kb20zIjpmYWxzZSwgImludmVydHNsNCI6ZmFsc2UsICJyYW5kb200IjpmYWxzZSwgImludmVydHNsNSI6ZmFsc2UsICJyYW5kb201IjpmYWxzZSwgImludmVydHNsNiI6ZmFsc2UsICJyYW5kb202IjpmYWxzZSwgImludmVydHNsNyI6ZmFsc2UsICJyYW5kb203IjpmYWxzZSwgImRlZmVuc2l2ZV9waXRjaCI6IlN0YXRpYyIsICJyYW5kc2wxIjowLCAicmFuZHNsMiI6MCwgInJhbmRzbDMiOjAsICJkZWZlbnNpdmVfcGl0Y2gxIjo4OSwgInJhbmRzbDQiOjAsICJyYW5kZWZwdDEiOjAsICJyYW5kc2w1IjowLCAiZGVmZW5zaXZlX3BpdGNoMiI6MCwgInJhbmRzbDYiOjAsICJiZXRzd3NwZCI6MSwgInJhbmRzbDciOjAsICJyYW5kZWZwdDIiOjAsICJma2xzbDEiOjAsICJzd3RzbGQxIjoxLCAiZmtyc2wxIjowLCAiZmtsc2wyIjowLCAiZmtyc2wyIjowLCAiZmtsc2wzIjowLCAiZGVmZW5zaXZlX3lhdzIiOjYsICJma3JzbDMiOjAsICJma2xzbDQiOjAsICJma3JzbDQiOjAsICJma2xzbDUiOjAsICJkaXNzbCI6MCwgImZrcnNsNSI6MCwgInlhd19iYXNlZCI6IkxvY2FsIFZpZXciLCAiZmtsc2w2IjowLCAic3d0c2xkIjoxLCAiZmtyc2w2IjowLCAiaGFtbm9fUEVFRCI6MSwgImZrbHNsNyI6MCwgImJldHN3c3BkMyI6MSwgImZrcnNsNyI6MCwgImJldHN3c3BkMiI6MTEsICJyYW5kc3d0MSI6ZmFsc2UsICJyYW5kZWZ5dzIiOjIsICJyYW5kc3d0MiI6ZmFsc2UsICJyYW5kZWZ5dzEiOjEsICJyYW5kc3d0MyI6ZmFsc2UsICJkZWZlbnNpdmVfeWF3MSI6LTgsICJyYW5kc3d0NCI6ZmFsc2UsICJkZWZlbnNpdmVfeWF3IjoiQmV0dGVyIFN3aXRjaCIsICJyYW5kc3d0NSI6ZmFsc2UsICJzd3NwZCI6MSwgInJhbmRzd3Q2IjpmYWxzZSwgImZrb3B0cmFuZDYiOlsifiJdLCAicmFuZHN3dDciOmZhbHNlLCAiZmtvcHRyYW5kNSI6WyJ+Il0sICJyYW5kZmtsc2wxIjowLCAicmFuZGZrbHNsNyI6MCwgInJhbmRma3JzbDEiOjAsICJyYW5kZmtyc2w2IjowLCAicmFuZGZrbHNsMiI6MH0sIHsicmFuZGZrcnNsMiI6NSwgInJhbmRma2xzbDMiOjAsICJyYW5kZmtyc2wzIjowLCAicmFuZGZrbHNsNCI6MSwgInJhbmRma3JzbDQiOjQsICJyYW5kZmtsc2w1Ijo1LCAicmFuZGZrcnNsNSI6MiwgInlhd19sIjowLCAieWF3X3IiOjAsICJ0cmlnZ2VycyI6WyJ+Il0sICJ5YXdscnJhbmQiOmZhbHNlLCAieWF3X2RlbGF5IjowLCAicmFuZGZrbHNsNiI6NCwgInlhd19tb2Rfb2Zmc2V0IjowLCAiZHNsZmttb2QiOiJTd2l0Y2hlZCIsICJkc2xma3Nsc3d0IjozMSwgInJhbmRma3JzbDciOjUsICJkc2xma3N3c3AiOjExLCAiZmtvcHRyYW5kMSI6WyJBdm9pZCBPdmVybGFwIiwgIkppdHRlciIsICJ+Il0sICJkc2xma3NscmFuIjowLCAiZmtvcHRyYW5kMiI6WyJKaXR0ZXIiLCAifiJdLCAiZHNsZmtyYW5zcGQiOjAsICJma29wdHJhbmQzIjpbIkppdHRlciIsICJSYW5kb21pemUgSml0dGVyIiwgIn4iXSwgImRzcmZrbW9kIjoiU3dpdGNoZWQiLCAiZmtvcHRyYW5kNCI6WyJKaXR0ZXIiLCAifiJdLCAiZHNyZmtzbHN3dCI6MTEsICJkc3Jma3N3c3AiOjUsICJkc3Jma3NscmFuIjowLCAiZHNyZmtyYW5zcGQiOjAsICJma2xhZ3N3dCI6MywgImZrb3B0cmFuZDciOlsiQXZvaWQgT3ZlcmxhcCIsICJKaXR0ZXIiLCAifiJdLCAiZmtpbnZlcnQiOmZhbHNlLCAiaW52ZXJ0c2wxIjp0cnVlLCAicmFuZG9tMSI6dHJ1ZSwgImludmVydHNsMiI6ZmFsc2UsICJyYW5kb20yIjp0cnVlLCAiaW52ZXJ0c2wzIjpmYWxzZSwgInJhbmRvbTMiOnRydWUsICJpbnZlcnRzbDQiOnRydWUsICJyYW5kb200Ijp0cnVlLCAiaW52ZXJ0c2w1Ijp0cnVlLCAicmFuZG9tNSI6dHJ1ZSwgImludmVydHNsNiI6ZmFsc2UsICJyYW5kb202Ijp0cnVlLCAiaW52ZXJ0c2w3IjpmYWxzZSwgInJhbmRvbTciOnRydWUsICJkZWZlbnNpdmVfcGl0Y2giOiJCZXR0ZXIgUmFuZG9tIiwgInJhbmRzbDEiOjMsICJyYW5kc2wyIjoxLCAicmFuZHNsMyI6MCwgImRlZmVuc2l2ZV9waXRjaDEiOi03OSwgInJhbmRzbDQiOjIsICJyYW5kZWZwdDEiOjAsICJyYW5kc2w1IjoxLCAiZGVmZW5zaXZlX3BpdGNoMiI6LTUsICJyYW5kc2w2IjozLCAiYmV0c3dzcGQiOjQsICJyYW5kc2w3IjozLCAicmFuZGVmcHQyIjowLCAiZmtsc2wxIjozOSwgInN3dHNsZDEiOjEsICJma3JzbDEiOjE1LCAiZmtsc2wyIjoxOCwgImZrcnNsMiI6MzksICJma2xzbDMiOjQ4LCAiZGVmZW5zaXZlX3lhdzIiOjIwLCAiZmtyc2wzIjo1MywgImZrbHNsNCI6MTEsICJma3JzbDQiOjQ0LCAiZmtsc2w1Ijo1MywgImRpc3NsIjowLCAiZmtyc2w1IjoxOCwgInlhd19iYXNlZCI6IkxvY2FsIFZpZXciLCAiZmtsc2w2Ijo1NSwgInN3dHNsZCI6MSwgImZrcnNsNiI6MTksICJoYW1ub19QRUVEIjo3LCAiZmtsc2w3IjoxMywgImJldHN3c3BkMyI6MSwgImZrcnNsNyI6NTAsICJiZXRzd3NwZDIiOjEsICJyYW5kc3d0MSI6dHJ1ZSwgInJhbmRlZnl3MiI6MCwgInJhbmRzd3QyIjp0cnVlLCAicmFuZGVmeXcxIjowLCAicmFuZHN3dDMiOmZhbHNlLCAiZGVmZW5zaXZlX3lhdzEiOi0xNSwgInJhbmRzd3Q0Ijp0cnVlLCAiZGVmZW5zaXZlX3lhdyI6IlN3YXkiLCAicmFuZHN3dDUiOnRydWUsICJzd3NwZCI6MSwgInJhbmRzd3Q2Ijp0cnVlLCAiZmtvcHRyYW5kNiI6WyJKaXR0ZXIiLCAifiJdLCAicmFuZHN3dDciOnRydWUsICJma29wdHJhbmQ1IjpbIkF2b2lkIE92ZXJsYXAiLCAiSml0dGVyIiwgIn4iXSwgInJhbmRma2xzbDEiOjE4LCAicmFuZGZrbHNsNyI6MywgInJhbmRma3JzbDEiOjUsICJyYW5kZmtyc2w2IjoxLCAicmFuZGZrbHNsMiI6M30sIHsicmFuZGZrcnNsMiI6MCwgInJhbmRma2xzbDMiOjAsICJyYW5kZmtyc2wzIjowLCAicmFuZGZrbHNsNCI6MCwgInJhbmRma3JzbDQiOjAsICJyYW5kZmtsc2w1IjowLCAicmFuZGZrcnNsNSI6MCwgInlhd19sIjotMTQsICJ5YXdfciI6MTYsICJ0cmlnZ2VycyI6WyJ+Il0sICJ5YXdscnJhbmQiOmZhbHNlLCAieWF3X2RlbGF5IjozLCAicmFuZGZrbHNsNiI6MCwgInlhd19tb2Rfb2Zmc2V0IjowLCAiZHNsZmttb2QiOiJTd2l0Y2hlZCIsICJkc2xma3Nsc3d0Ijo0MSwgInJhbmRma3JzbDciOjAsICJkc2xma3N3c3AiOjgsICJma29wdHJhbmQxIjpbIn4iXSwgImRzbGZrc2xyYW4iOjAsICJma29wdHJhbmQyIjpbIn4iXSwgImRzbGZrcmFuc3BkIjowLCAiZmtvcHRyYW5kMyI6WyJ+Il0sICJkc3Jma21vZCI6IlN3aXRjaGVkIiwgImZrb3B0cmFuZDQiOlsifiJdLCAiZHNyZmtzbHN3dCI6MjcsICJkc3Jma3N3c3AiOjE1LCAiZHNyZmtzbHJhbiI6MCwgImRzcmZrcmFuc3BkIjowLCAiZmtsYWdzd3QiOjEsICJma29wdHJhbmQ3IjpbIn4iXSwgImZraW52ZXJ0IjpmYWxzZSwgImludmVydHNsMSI6ZmFsc2UsICJyYW5kb20xIjpmYWxzZSwgImludmVydHNsMiI6ZmFsc2UsICJyYW5kb20yIjpmYWxzZSwgImludmVydHNsMyI6ZmFsc2UsICJyYW5kb20zIjpmYWxzZSwgImludmVydHNsNCI6ZmFsc2UsICJyYW5kb200IjpmYWxzZSwgImludmVydHNsNSI6ZmFsc2UsICJyYW5kb201IjpmYWxzZSwgImludmVydHNsNiI6ZmFsc2UsICJyYW5kb202IjpmYWxzZSwgImludmVydHNsNyI6ZmFsc2UsICJyYW5kb203IjpmYWxzZSwgImRlZmVuc2l2ZV9waXRjaCI6IkJldHRlciBSYW5kb20iLCAicmFuZHNsMSI6MCwgInJhbmRzbDIiOjAsICJyYW5kc2wzIjowLCAiZGVmZW5zaXZlX3BpdGNoMSI6LTY1LCAicmFuZHNsNCI6MCwgInJhbmRlZnB0MSI6MCwgInJhbmRzbDUiOjAsICJkZWZlbnNpdmVfcGl0Y2gyIjoxMiwgInJhbmRzbDYiOjAsICJiZXRzd3NwZCI6NiwgInJhbmRzbDciOjAsICJyYW5kZWZwdDIiOjAsICJma2xzbDEiOjAsICJzd3RzbGQxIjoxLCAiZmtyc2wxIjowLCAiZmtsc2wyIjowLCAiZmtyc2wyIjowLCAiZmtsc2wzIjowLCAiZGVmZW5zaXZlX3lhdzIiOjQ0LCAiZmtyc2wzIjowLCAiZmtsc2w0IjowLCAiZmtyc2w0IjowLCAiZmtsc2w1IjowLCAiZGlzc2wiOjAsICJma3JzbDUiOjAsICJ5YXdfYmFzZWQiOiJMb2NhbCBWaWV3IiwgImZrbHNsNiI6MCwgInN3dHNsZCI6MSwgImZrcnNsNiI6MCwgImhhbW5vX1BFRUQiOjEsICJma2xzbDciOjAsICJiZXRzd3NwZDMiOjMsICJma3JzbDciOjAsICJiZXRzd3NwZDIiOjEsICJyYW5kc3d0MSI6ZmFsc2UsICJyYW5kZWZ5dzIiOjAsICJyYW5kc3d0MiI6ZmFsc2UsICJyYW5kZWZ5dzEiOjAsICJyYW5kc3d0MyI6ZmFsc2UsICJkZWZlbnNpdmVfeWF3MSI6LTQ5LCAicmFuZHN3dDQiOmZhbHNlLCAiZGVmZW5zaXZlX3lhdyI6IkJldHRlciBSYW5kb20iLCAicmFuZHN3dDUiOmZhbHNlLCAic3dzcGQiOjEsICJyYW5kc3d0NiI6ZmFsc2UsICJma29wdHJhbmQ2IjpbIn4iXSwgInJhbmRzd3Q3IjpmYWxzZSwgImZrb3B0cmFuZDUiOlsifiJdLCAicmFuZGZrbHNsMSI6MCwgInJhbmRma2xzbDciOjAsICJyYW5kZmtyc2wxIjowLCAicmFuZGZrcnNsNiI6MCwgInJhbmRma2xzbDIiOjB9LCB7InJhbmRma3JzbDIiOjAsICJyYW5kZmtsc2wzIjowLCAicmFuZGZrcnNsMyI6MCwgInJhbmRma2xzbDQiOjAsICJyYW5kZmtyc2w0IjowLCAicmFuZGZrbHNsNSI6MCwgInJhbmRma3JzbDUiOjAsICJ5YXdfbCI6LTEzLCAieWF3X3IiOjExLCAidHJpZ2dlcnMiOlsifiJdLCAieWF3bHJyYW5kIjpmYWxzZSwgInlhd19kZWxheSI6MywgInJhbmRma2xzbDYiOjAsICJ5YXdfbW9kX29mZnNldCI6MCwgImRzbGZrbW9kIjoiU3dpdGNoZWQiLCAiZHNsZmtzbHN3dCI6MTYsICJyYW5kZmtyc2w3IjowLCAiZHNsZmtzd3NwIjozLCAiZmtvcHRyYW5kMSI6WyJ+Il0sICJkc2xma3NscmFuIjowLCAiZmtvcHRyYW5kMiI6WyJ+Il0sICJkc2xma3JhbnNwZCI6MCwgImZrb3B0cmFuZDMiOlsifiJdLCAiZHNyZmttb2QiOiJTd2l0Y2hlZCIsICJma29wdHJhbmQ0IjpbIn4iXSwgImRzcmZrc2xzd3QiOjQyLCAiZHNyZmtzd3NwIjoxOCwgImRzcmZrc2xyYW4iOjAsICJkc3Jma3JhbnNwZCI6MCwgImZrbGFnc3d0IjoxLCAiZmtvcHRyYW5kNyI6WyJ+Il0sICJma2ludmVydCI6dHJ1ZSwgImludmVydHNsMSI6ZmFsc2UsICJyYW5kb20xIjpmYWxzZSwgImludmVydHNsMiI6ZmFsc2UsICJyYW5kb20yIjpmYWxzZSwgImludmVydHNsMyI6ZmFsc2UsICJyYW5kb20zIjpmYWxzZSwgImludmVydHNsNCI6ZmFsc2UsICJyYW5kb200IjpmYWxzZSwgImludmVydHNsNSI6ZmFsc2UsICJyYW5kb201IjpmYWxzZSwgImludmVydHNsNiI6ZmFsc2UsICJyYW5kb202IjpmYWxzZSwgImludmVydHNsNyI6ZmFsc2UsICJyYW5kb203IjpmYWxzZSwgImRlZmVuc2l2ZV9waXRjaCI6IkJldHRlciBSYW5kb20iLCAicmFuZHNsMSI6MCwgInJhbmRzbDIiOjAsICJyYW5kc2wzIjowLCAiZGVmZW5zaXZlX3BpdGNoMSI6LTczLCAicmFuZHNsNCI6MCwgInJhbmRlZnB0MSI6NywgInJhbmRzbDUiOjAsICJkZWZlbnNpdmVfcGl0Y2gyIjoxMywgInJhbmRzbDYiOjAsICJiZXRzd3NwZCI6MiwgInJhbmRzbDciOjAsICJyYW5kZWZwdDIiOjIsICJma2xzbDEiOjAsICJzd3RzbGQxIjo3LCAiZmtyc2wxIjowLCAiZmtsc2wyIjowLCAiZmtyc2wyIjowLCAiZmtsc2wzIjowLCAiZGVmZW5zaXZlX3lhdzIiOjI2LCAiZmtyc2wzIjowLCAiZmtsc2w0IjowLCAiZmtyc2w0IjowLCAiZmtsc2w1IjowLCAiZGlzc2wiOjAsICJma3JzbDUiOjAsICJ5YXdfYmFzZWQiOiJMb2NhbCBWaWV3IiwgImZrbHNsNiI6MCwgInN3dHNsZCI6MSwgImZrcnNsNiI6MCwgImhhbW5vX1BFRUQiOjE0LCAiZmtsc2w3IjowLCAiYmV0c3dzcGQzIjozLCAiZmtyc2w3IjowLCAiYmV0c3dzcGQyIjoxLCAicmFuZHN3dDEiOmZhbHNlLCAicmFuZGVmeXcyIjowLCAicmFuZHN3dDIiOmZhbHNlLCAicmFuZGVmeXcxIjowLCAicmFuZHN3dDMiOmZhbHNlLCAiZGVmZW5zaXZlX3lhdzEiOjE4MCwgInJhbmRzd3Q0IjpmYWxzZSwgImRlZmVuc2l2ZV95YXciOiJTcGluIiwgInJhbmRzd3Q1IjpmYWxzZSwgInN3c3BkIjoxLCAicmFuZHN3dDYiOmZhbHNlLCAiZmtvcHRyYW5kNiI6WyJ+Il0sICJyYW5kc3d0NyI6ZmFsc2UsICJma29wdHJhbmQ1IjpbIn4iXSwgInJhbmRma2xzbDEiOjAsICJyYW5kZmtsc2w3IjowLCAicmFuZGZrcnNsMSI6MCwgInJhbmRma3JzbDYiOjAsICJyYW5kZmtsc2wyIjowfSwgeyJyYW5kZmtyc2wyIjowLCAicmFuZGZrbHNsMyI6MCwgInJhbmRma3JzbDMiOjAsICJyYW5kZmtsc2w0IjowLCAicmFuZGZrcnNsNCI6MCwgInJhbmRma2xzbDUiOjAsICJyYW5kZmtyc2w1IjowLCAieWF3X2wiOi0xNywgInlhd19yIjoxNSwgInRyaWdnZXJzIjpbIn4iXSwgInlhd2xycmFuZCI6ZmFsc2UsICJ5YXdfZGVsYXkiOjMsICJyYW5kZmtsc2w2IjowLCAieWF3X21vZF9vZmZzZXQiOjAsICJkc2xma21vZCI6IlN3aXRjaGVkIiwgImRzbGZrc2xzd3QiOjM5LCAicmFuZGZrcnNsNyI6MCwgImRzbGZrc3dzcCI6MTYsICJma29wdHJhbmQxIjpbIn4iXSwgImRzbGZrc2xyYW4iOjAsICJma29wdHJhbmQyIjpbIn4iXSwgImRzbGZrcmFuc3BkIjowLCAiZmtvcHRyYW5kMyI6WyJ+Il0sICJkc3Jma21vZCI6IlJhbmRvbSIsICJma29wdHJhbmQ0IjpbIn4iXSwgImRzcmZrc2xzd3QiOjIzLCAiZHNyZmtzd3NwIjowLCAiZHNyZmtzbHJhbiI6MTIsICJkc3Jma3JhbnNwZCI6NCwgImZrbGFnc3d0IjoxLCAiZmtvcHRyYW5kNyI6WyJ+Il0sICJma2ludmVydCI6ZmFsc2UsICJpbnZlcnRzbDEiOmZhbHNlLCAicmFuZG9tMSI6ZmFsc2UsICJpbnZlcnRzbDIiOmZhbHNlLCAicmFuZG9tMiI6ZmFsc2UsICJpbnZlcnRzbDMiOmZhbHNlLCAicmFuZG9tMyI6ZmFsc2UsICJpbnZlcnRzbDQiOmZhbHNlLCAicmFuZG9tNCI6ZmFsc2UsICJpbnZlcnRzbDUiOmZhbHNlLCAicmFuZG9tNSI6ZmFsc2UsICJpbnZlcnRzbDYiOmZhbHNlLCAicmFuZG9tNiI6ZmFsc2UsICJpbnZlcnRzbDciOmZhbHNlLCAicmFuZG9tNyI6ZmFsc2UsICJkZWZlbnNpdmVfcGl0Y2giOiJCZXR0ZXIgUmFuZG9tIiwgInJhbmRzbDEiOjAsICJyYW5kc2wyIjowLCAicmFuZHNsMyI6MCwgImRlZmVuc2l2ZV9waXRjaDEiOi03MywgInJhbmRzbDQiOjAsICJyYW5kZWZwdDEiOjEzLCAicmFuZHNsNSI6MCwgImRlZmVuc2l2ZV9waXRjaDIiOjI2LCAicmFuZHNsNiI6MCwgImJldHN3c3BkIjozLCAicmFuZHNsNyI6MCwgInJhbmRlZnB0MiI6MzAsICJma2xzbDEiOjAsICJzd3RzbGQxIjoxNiwgImZrcnNsMSI6MCwgImZrbHNsMiI6MCwgImZrcnNsMiI6MCwgImZrbHNsMyI6MCwgImRlZmVuc2l2ZV95YXcyIjo3MiwgImZrcnNsMyI6MCwgImZrbHNsNCI6MCwgImZrcnNsNCI6MCwgImZrbHNsNSI6MCwgImRpc3NsIjowLCAiZmtyc2w1IjowLCAieWF3X2Jhc2VkIjoiTG9jYWwgVmlldyIsICJma2xzbDYiOjAsICJzd3RzbGQiOjEsICJma3JzbDYiOjAsICJoYW1ub19QRUVEIjo5LCAiZmtsc2w3IjowLCAiYmV0c3dzcGQzIjoxLCAiZmtyc2w3IjowLCAiYmV0c3dzcGQyIjoxNSwgInJhbmRzd3QxIjpmYWxzZSwgInJhbmRlZnl3MiI6NCwgInJhbmRzd3QyIjpmYWxzZSwgInJhbmRlZnl3MSI6NSwgInJhbmRzd3QzIjpmYWxzZSwgImRlZmVuc2l2ZV95YXcxIjotODYsICJyYW5kc3d0NCI6ZmFsc2UsICJkZWZlbnNpdmVfeWF3IjoiU3dheSIsICJyYW5kc3d0NSI6ZmFsc2UsICJzd3NwZCI6MSwgInJhbmRzd3Q2IjpmYWxzZSwgImZrb3B0cmFuZDYiOlsifiJdLCAicmFuZHN3dDciOmZhbHNlLCAiZmtvcHRyYW5kNSI6WyJ+Il0sICJyYW5kZmtsc2wxIjowLCAicmFuZGZrbHNsNyI6MCwgInJhbmRma3JzbDEiOjAsICJyYW5kZmtyc2w2IjowLCAicmFuZGZrbHNsMiI6MH0sIHsicmFuZGZrcnNsMiI6MCwgInJhbmRma2xzbDMiOjAsICJyYW5kZmtyc2wzIjowLCAicmFuZGZrbHNsNCI6MCwgInJhbmRma3JzbDQiOjAsICJyYW5kZmtsc2w1IjowLCAicmFuZGZrcnNsNSI6MCwgInlhd19sIjotMywgInlhd19yIjozLCAidHJpZ2dlcnMiOlsifiJdLCAieWF3bHJyYW5kIjpmYWxzZSwgInlhd19kZWxheSI6NywgInJhbmRma2xzbDYiOjAsICJ5YXdfbW9kX29mZnNldCI6MCwgImRzbGZrbW9kIjoiU3dpdGNoZWQiLCAiZHNsZmtzbHN3dCI6MjEsICJyYW5kZmtyc2w3IjowLCAiZHNsZmtzd3NwIjo1LCAiZmtvcHRyYW5kMSI6WyJ+Il0sICJkc2xma3NscmFuIjowLCAiZmtvcHRyYW5kMiI6WyJ+Il0sICJkc2xma3JhbnNwZCI6MCwgImZrb3B0cmFuZDMiOlsifiJdLCAiZHNyZmttb2QiOiJSYW5kb20iLCAiZmtvcHRyYW5kNCI6WyJ+Il0sICJkc3Jma3Nsc3d0IjowLCAiZHNyZmtzd3NwIjowLCAiZHNyZmtzbHJhbiI6OCwgImRzcmZrcmFuc3BkIjo0LCAiZmtsYWdzd3QiOjEsICJma29wdHJhbmQ3IjpbIn4iXSwgImZraW52ZXJ0IjpmYWxzZSwgImludmVydHNsMSI6ZmFsc2UsICJyYW5kb20xIjpmYWxzZSwgImludmVydHNsMiI6ZmFsc2UsICJyYW5kb20yIjpmYWxzZSwgImludmVydHNsMyI6ZmFsc2UsICJyYW5kb20zIjpmYWxzZSwgImludmVydHNsNCI6ZmFsc2UsICJyYW5kb200IjpmYWxzZSwgImludmVydHNsNSI6ZmFsc2UsICJyYW5kb201IjpmYWxzZSwgImludmVydHNsNiI6ZmFsc2UsICJyYW5kb202IjpmYWxzZSwgImludmVydHNsNyI6ZmFsc2UsICJyYW5kb203IjpmYWxzZSwgImRlZmVuc2l2ZV9waXRjaCI6IlN0YXRpYyIsICJyYW5kc2wxIjowLCAicmFuZHNsMiI6MCwgInJhbmRzbDMiOjAsICJkZWZlbnNpdmVfcGl0Y2gxIjo4OSwgInJhbmRzbDQiOjAsICJyYW5kZWZwdDEiOjAsICJyYW5kc2w1IjowLCAiZGVmZW5zaXZlX3BpdGNoMiI6MCwgInJhbmRzbDYiOjAsICJiZXRzd3NwZCI6MSwgInJhbmRzbDciOjAsICJyYW5kZWZwdDIiOjAsICJma2xzbDEiOjAsICJzd3RzbGQxIjoxLCAiZmtyc2wxIjowLCAiZmtsc2wyIjowLCAiZmtyc2wyIjowLCAiZmtsc2wzIjowLCAiZGVmZW5zaXZlX3lhdzIiOjksICJma3JzbDMiOjAsICJma2xzbDQiOjAsICJma3JzbDQiOjAsICJma2xzbDUiOjAsICJkaXNzbCI6MCwgImZrcnNsNSI6MCwgInlhd19iYXNlZCI6IkxvY2FsIFZpZXciLCAiZmtsc2w2IjowLCAic3d0c2xkIjoxMCwgImZrcnNsNiI6MCwgImhhbW5vX1BFRUQiOjEsICJma2xzbDciOjAsICJiZXRzd3NwZDMiOjEsICJma3JzbDciOjAsICJiZXRzd3NwZDIiOjEsICJyYW5kc3d0MSI6ZmFsc2UsICJyYW5kZWZ5dzIiOjAsICJyYW5kc3d0MiI6ZmFsc2UsICJyYW5kZWZ5dzEiOjAsICJyYW5kc3d0MyI6ZmFsc2UsICJkZWZlbnNpdmVfeWF3MSI6LTgsICJyYW5kc3d0NCI6ZmFsc2UsICJkZWZlbnNpdmVfeWF3IjoiU3dpdGNoIiwgInJhbmRzd3Q1IjpmYWxzZSwgInN3c3BkIjoxLCAicmFuZHN3dDYiOmZhbHNlLCAiZmtvcHRyYW5kNiI6WyJ+Il0sICJyYW5kc3d0NyI6ZmFsc2UsICJma29wdHJhbmQ1IjpbIn4iXSwgInJhbmRma2xzbDEiOjAsICJyYW5kZmtsc2w3IjowLCAicmFuZGZrcnNsMSI6MCwgInJhbmRma3JzbDYiOjAsICJyYW5kZmtsc2wyIjowfSwgeyJyYW5kZmtyc2wyIjowLCAicmFuZGZrbHNsMyI6MCwgInJhbmRma3JzbDMiOjAsICJyYW5kZmtsc2w0IjowLCAicmFuZGZrcnNsNCI6MCwgInJhbmRma2xzbDUiOjAsICJyYW5kZmtyc2w1IjowLCAieWF3X2wiOjAsICJ5YXdfciI6MCwgInRyaWdnZXJzIjpbIn4iXSwgInlhd2xycmFuZCI6ZmFsc2UsICJ5YXdfZGVsYXkiOjAsICJyYW5kZmtsc2w2IjowLCAieWF3X21vZF9vZmZzZXQiOjAsICJkc2xma21vZCI6IlJhbmRvbSIsICJkc2xma3Nsc3d0IjowLCAicmFuZGZrcnNsNyI6MCwgImRzbGZrc3dzcCI6MCwgImZrb3B0cmFuZDEiOlsifiJdLCAiZHNsZmtzbHJhbiI6MjAsICJma29wdHJhbmQyIjpbIn4iXSwgImRzbGZrcmFuc3BkIjo4LCAiZmtvcHRyYW5kMyI6WyJ+Il0sICJkc3Jma21vZCI6IlN3aXRjaGVkIiwgImZrb3B0cmFuZDQiOlsifiJdLCAiZHNyZmtzbHN3dCI6NywgImRzcmZrc3dzcCI6MjUsICJkc3Jma3NscmFuIjowLCAiZHNyZmtyYW5zcGQiOjAsICJma2xhZ3N3dCI6MSwgImZrb3B0cmFuZDciOlsifiJdLCAiZmtpbnZlcnQiOmZhbHNlLCAiaW52ZXJ0c2wxIjpmYWxzZSwgInJhbmRvbTEiOmZhbHNlLCAiaW52ZXJ0c2wyIjpmYWxzZSwgInJhbmRvbTIiOmZhbHNlLCAiaW52ZXJ0c2wzIjpmYWxzZSwgInJhbmRvbTMiOmZhbHNlLCAiaW52ZXJ0c2w0IjpmYWxzZSwgInJhbmRvbTQiOmZhbHNlLCAiaW52ZXJ0c2w1IjpmYWxzZSwgInJhbmRvbTUiOmZhbHNlLCAiaW52ZXJ0c2w2IjpmYWxzZSwgInJhbmRvbTYiOmZhbHNlLCAiaW52ZXJ0c2w3IjpmYWxzZSwgInJhbmRvbTciOmZhbHNlLCAiZGVmZW5zaXZlX3BpdGNoIjoiU3RhdGljIiwgInJhbmRzbDEiOjAsICJyYW5kc2wyIjowLCAicmFuZHNsMyI6MCwgImRlZmVuc2l2ZV9waXRjaDEiOjAsICJyYW5kc2w0IjowLCAicmFuZGVmcHQxIjowLCAicmFuZHNsNSI6MCwgImRlZmVuc2l2ZV9waXRjaDIiOjAsICJyYW5kc2w2IjowLCAiYmV0c3dzcGQiOjEsICJyYW5kc2w3IjowLCAicmFuZGVmcHQyIjowLCAiZmtsc2wxIjowLCAic3d0c2xkMSI6MSwgImZrcnNsMSI6MCwgImZrbHNsMiI6MCwgImZrcnNsMiI6MCwgImZrbHNsMyI6MCwgImRlZmVuc2l2ZV95YXcyIjowLCAiZmtyc2wzIjowLCAiZmtsc2w0IjowLCAiZmtyc2w0IjowLCAiZmtsc2w1IjowLCAiZGlzc2wiOjAsICJma3JzbDUiOjAsICJ5YXdfYmFzZWQiOiJMb2NhbCBWaWV3IiwgImZrbHNsNiI6MCwgInN3dHNsZCI6MSwgImZrcnNsNiI6MCwgImhhbW5vX1BFRUQiOjEsICJma2xzbDciOjAsICJiZXRzd3NwZDMiOjEsICJma3JzbDciOjAsICJiZXRzd3NwZDIiOjEsICJyYW5kc3d0MSI6ZmFsc2UsICJyYW5kZWZ5dzIiOjAsICJyYW5kc3d0MiI6ZmFsc2UsICJyYW5kZWZ5dzEiOjAsICJyYW5kc3d0MyI6ZmFsc2UsICJkZWZlbnNpdmVfeWF3MSI6MCwgInJhbmRzd3Q0IjpmYWxzZSwgImRlZmVuc2l2ZV95YXciOiJTdGF0aWMiLCAicmFuZHN3dDUiOmZhbHNlLCAic3dzcGQiOjEsICJyYW5kc3d0NiI6ZmFsc2UsICJma29wdHJhbmQ2IjpbIn4iXSwgInJhbmRzd3Q3IjpmYWxzZSwgImZrb3B0cmFuZDUiOlsifiJdLCAicmFuZGZrbHNsMSI6MCwgInJhbmRma2xzbDciOjAsICJyYW5kZmtyc2wxIjowLCAicmFuZGZrcnNsNiI6MCwgInJhbmRma2xzbDIiOjB9XV19");
        local v288 = json.parse(v287);
        local l_config_1 = v288.config;
        local l_phases_1 = v288.phases;
        local l_phase_list_1 = v288.phase_list;
        if l_config_1 and type(l_config_1) == "table" then
            v215:load(l_config_1);
        else
            v223("[Config System]", "\208\148\208\176\208\189\208\189\209\139\208\181 \208\186\208\190\208\189\209\132\208\184\208\179\208\176 \208\190\209\130\209\129\209\131\209\130\209\129\209\130\208\178\209\131\209\142\209\130.");
        end;
        if l_phases_1 and type(l_phases_1) == "table" and l_phase_list_1 then
            local l_status_2, l_result_2 = pcall(function()
                -- upvalues: v218 (ref), l_phases_1 (ref)
                v218:load(l_phases_1);
            end);
            if not l_status_2 then
                v223("[Phase System]", "\208\158\209\136\208\184\208\177\208\186\208\176 \208\191\209\128\208\184 \208\183\208\176\208\179\209\128\209\131\208\183\208\186\208\181 \209\132\208\176\208\183: " .. tostring(l_result_2));
                return;
            else
                for _, v295 in ipairs(l_phase_list_1) do
                    local v296 = v295[1];
                    local v297 = false;
                    for _, v299 in ipairs(v220.phaselist) do
                        if v299[1] == v296 then
                            v297 = true;
                            break;
                        end;
                    end;
                    if not v297 then
                        local v300 = 0;
                        for _, v302 in ipairs(v220.phaselist) do
                            local v303 = tonumber(v302[1]) or 0;
                            v300 = math.max(v300, v303);
                        end;
                        local v304 = tostring(v300 + 1);
                        table.insert(v220.phaselist, {
                            [1] = nil, 
                            [2] = "", 
                            [3] = "None", 
                            [1] = v304
                        });
                        v220.menulist = {};
                        for _, v306 in ipairs(v220.phaselist) do
                            table.insert(v220.menulist, v306[1]);
                        end;
                    end;
                end;
                db.phase_debug = v220;
                for _, v308 in ipairs(l_phase_list_1) do
                    local v309 = v308[1];
                    for _, v311 in ipairs(v220.phaselist) do
                        if v311[1] == v309 then
                            v311[2] = v308[2];
                            v311[3] = v308[3];
                        end;
                    end;
                end;
                configs.phaseselect:update(v220.menulist);
                v223("[Phase System]", "\208\148\208\181\209\132\208\190\208\187\209\130\208\189\209\139\208\185 \208\186\208\190\208\189\209\132\208\184\208\179 \208\183\208\176\208\179\209\128\209\131\208\182\208\181\208\189.");
            end;
        else
            v223("[Phase System]", "\208\164\208\176\208\183\209\139 \208\190\209\130\209\129\209\131\209\130\209\129\209\130\208\178\209\131\209\142\209\130 \208\178 \208\183\208\176\208\179\209\128\209\131\208\182\208\176\208\181\208\188\209\139\209\133 \208\180\208\176\208\189\208\189\209\139\209\133.");
        end;
    end), 
    create = v43.aamain_settings1:button("\v\f<plus>", function()
        -- upvalues: v216 (ref)
        v216.create_config(configs.name:get());
        configs.cfg_selector:update(configs_db.menu_list);
    end, true), 
    remove = v43.aamain_settings1:button("\v\f<trash>", function()
        -- upvalues: v216 (ref)
        v216.remove_config(configs.cfg_selector:get());
        configs.cfg_selector:update(configs_db.menu_list);
    end, true), 
    save = v43.aamain_settings1:button("\v\f<floppy-disk>", function()
        -- upvalues: v216 (ref)
        v216.save_config(configs.cfg_selector:get());
    end, true), 
    load = v43.aamain_settings1:button("\v\f<loader>", function()
        -- upvalues: v216 (ref)
        v216.update_values(configs.cfg_selector:get());
        v216.load_config(configs.cfg_selector:get());
        configs.cfg_selector:update(configs_db.menu_list);
    end, true), 
    import = v43.aamain_settings1:button("Import Config", function()
        -- upvalues: v223 (ref), v214 (ref), l_clipboard_0 (ref), l_base64_0 (ref), v215 (ref), v218 (ref), v220 (ref)
        local v312 = configs.cfg_selector:get();
        if not v312 or not configs_db.cfg_list[v312] then
            v223("[Config System]", v214.errimpcfg1);
            return;
        else
            local v313 = l_clipboard_0.get();
            if not v313 or v313 == "" then
                v223("[Config System]", v214.errimpcfg2);
                return;
            else
                local v314 = l_base64_0.decode(v313);
                local v315 = json.parse(v314);
                if not v315 or type(v315) ~= "table" then
                    v223("[Config System]", v214.errimpcfg3);
                    return;
                else
                    local l_config_2 = v315.config;
                    local l_phases_2 = v315.phases;
                    local l_phase_list_2 = v315.phase_list;
                    if l_config_2 and type(l_config_2) == "table" then
                        v215:load(l_config_2);
                        if l_phases_2 and type(l_phases_2) == "table" and l_phase_list_2 then
                            local l_status_3, l_result_3 = pcall(function()
                                -- upvalues: v218 (ref), l_phases_2 (ref)
                                v218:load(l_phases_2);
                            end);
                            if not l_status_3 then
                                v223("[Phase System]", v214.errimpcfg5 .. tostring(l_result_3));
                                return;
                            else
                                for _, v322 in ipairs(l_phase_list_2) do
                                    local v323 = v322[1];
                                    local v324 = false;
                                    for _, v326 in ipairs(v220.phaselist) do
                                        if v326[1] == v323 then
                                            v324 = true;
                                            break;
                                        end;
                                    end;
                                    if not v324 then
                                        local v327 = 0;
                                        for _, v329 in ipairs(v220.phaselist) do
                                            local v330 = tonumber(v329[1]) or 0;
                                            v327 = math.max(v327, v330);
                                        end;
                                        local v331 = tostring(v327 + 1);
                                        table.insert(v220.phaselist, {
                                            [1] = nil, 
                                            [2] = "", 
                                            [3] = "None", 
                                            [1] = v331
                                        });
                                        v220.menulist = {};
                                        for _, v333 in ipairs(v220.phaselist) do
                                            table.insert(v220.menulist, v333[1]);
                                        end;
                                    end;
                                end;
                                db.phase_debug = v220;
                                for _, v335 in ipairs(l_phase_list_2) do
                                    local v336 = v335[1];
                                    for _, v338 in ipairs(v220.phaselist) do
                                        if v338[1] == v336 then
                                            v338[2] = v335[2];
                                            v338[3] = v335[3];
                                        end;
                                    end;
                                end;
                                configs.phaseselect:update(v220.menulist);
                                v223("[Phase System]", v214.impcfg1);
                            end;
                        else
                            v223("[Phase System]", v214.errimpcfg6);
                        end;
                        v223("[Config System]", v214.impcfg2);
                        return;
                    else
                        v223("[Config System]", v214.errimpcfg4);
                        return;
                    end;
                end;
            end;
        end;
    end, true), 
    export = v43.aamain_settings1:button("Export Config", function()
        -- upvalues: v223 (ref), v214 (ref), l_clipboard_0 (ref)
        local v339 = configs.cfg_selector:get();
        if not v339 or not configs_db.cfg_list[v339] then
            v223("[Config System]", v214.errexpcfg1);
            return;
        else
            local v340 = configs_db.cfg_list[v339][2];
            local l_status_4, l_result_4 = pcall(function()
                -- upvalues: l_clipboard_0 (ref), v340 (ref)
                l_clipboard_0.set(v340);
            end);
            if not l_status_4 then
                v223("[Config System]", v214.errexpcfg2 .. tostring(l_result_4));
                return;
            else
                v223("[Config System]", v214.expcfg);
                return;
            end;
        end;
    end, true), 
    phaseselect = v43.aamain_settings3:list("Phases:", {
        [1] = ""
    }), 
    createphs = v43.aamain_settings3:button(v7("plus") .. "", function()
        -- upvalues: v219 (ref), v220 (ref)
        v219.createphasa1();
        configs.phaseselect:update(v220.menulist);
    end, true), 
    removephs = v43.aamain_settings3:button(v7("trash") .. "", function()
        -- upvalues: v219 (ref), v220 (ref)
        local v343 = configs.phaseselect:get();
        v219.removephasa1(v343);
        configs.phaseselect:update(v220.menulist);
    end, true), 
    savephs = v43.aamain_settings3:button(v7("floppy-disk") .. "", function()
        -- upvalues: v220 (ref), v219 (ref)
        local v344 = configs.phaseselect:get();
        v220.phaselist[v344][3] = trigger_value;
        v219.savephase1(v344);
    end, true), 
    loadphs = v43.aamain_settings3:button(v7("loader") .. "", function()
        -- upvalues: v219 (ref), v223 (ref), v214 (ref)
        local v345 = configs.phaseselect:get();
        v219.loadphasa1(v345);
        v223(v214.loadphs, tostring(v345));
    end, true), 
    importphs = v43.aamain_settings3:button(v7("file-import") .. "", function()
        -- upvalues: v219 (ref)
        local v346 = configs.phaseselect:get();
        v219.importphase(v346);
    end, true), 
    exportphs = v43.aamain_settings3:button(v7("file-export") .. "", function()
        -- upvalues: v219 (ref)
        v219.exportphase();
    end, true)
};
local function v348(v347)
    return type(v347) == "table" and v347[1] or v347;
end;
events.round_start:set(function()
    -- upvalues: v220 (ref), v348 (ref), v223 (ref), v219 (ref)
    for v349, v350 in ipairs(v220.phaselist) do
        if v348(v350[3]) == "Round Start" then
            v223("[Phase Loader]", "\208\151\208\176\208\179\209\128\209\131\208\182\208\176\208\181\209\130\209\129\209\143 \209\132\208\176\208\183\208\176: " .. v350[1]);
            v219.loadphasa1(v349);
            break;
        end;
    end;
end);
events.bullet_impact:set(function(v351)
    -- upvalues: v220 (ref), v348 (ref), v223 (ref), v219 (ref)
    local v352 = entity.get_local_player();
    if not v352:is_alive() then
        return;
    else
        local v353 = entity.get(v351.userid, true);
        if not v353 or not v353:is_enemy() then
            return;
        else
            local v354 = v352 and v352:get_eye_position();
            local v355 = v353:get_eye_position();
            if v354 and v355 then
                local v356 = v354:closest_ray_point(v355, (vector(v351.x, v351.y, v351.z)));
                if v356 and v356:dist(v354) < 45 and v356:dist(v354) > 10 then
                    for v357, v358 in ipairs(v220.phaselist) do
                        local v359 = v348(v358[3]);
                        if string.lower(v359) == string.lower("Miss At You") then
                            v223("[Phase Loader]", "\208\151\208\176\208\179\209\128\209\131\208\182\208\176\208\181\209\130\209\129\209\143 \209\132\208\176\208\183\208\176: " .. v358[1]);
                            v219.loadphasa1(v357);
                            break;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end);
events.player_hurt:set(function(v360)
    -- upvalues: v220 (ref), v348 (ref), v223 (ref), v219 (ref)
    local v361 = entity.get_local_player();
    if not v361 or v361 == nil or not v361:is_alive() then
        return;
    else
        local _ = entity.get(v360.attacker, true);
        if entity.get(v360.userid, true):get_name() == v361:get_name() then
            for v363, v364 in ipairs(v220.phaselist) do
                if v348(v364[3]) == "You Get Hit" then
                    v223("[Phase Loader]", "\208\151\208\176\208\179\209\128\209\131\208\182\208\176\208\181\209\130\209\129\209\143 \209\132\208\176\208\183\208\176: " .. v364[1]);
                    v219.loadphasa1(v363);
                    break;
                end;
            end;
        end;
        return;
    end;
end);
local function v369()
    -- upvalues: v45 (ref), v106 (ref)
    if v45.r8pred:get() then
        local v365 = entity.get_local_player();
        if v365 == nil or not v365:is_alive() then
            return;
        else
            local v366 = v365:get_player_weapon();
            if v366 == nil then
                return;
            else
                local v367 = v366:get_classname();
                if v365 == nil or not v365:is_alive() then
                    return;
                else
                    local v368 = v366:get_inaccuracy();
                    if v367 == "CDEagle" and v368 <= 0.0050000003539026 then
                        cvar.sv_maxunlag:float(0.15);
                        cvar.cl_interp:float(0.041);
                        v106.r8hitc:override(0);
                        v106.extbt:override(true);
                    else
                        cvar.sv_maxunlag:float(0.2);
                        cvar.cl_interp:float(0.1);
                        v106.r8hitc:override(52);
                        v106.extbt:override(false);
                    end;
                end;
            end;
        end;
    end;
end;
local function v371()
    -- upvalues: v45 (ref), v106 (ref)
    local v370 = entity.get_local_player();
    if v370 == nil or not v370:is_alive() then
        return;
    else
        if v45.predict:get() then
            cvar.sv_maxunlag:float(0.15);
            cvar.cl_interp:float(0.031);
            v106.extbt:override(true);
        else
            cvar.sv_maxunlag:float(0.2);
            cvar.cl_interp:float(0.1);
            v106.extbt:override(false);
        end;
        return;
    end;
end;
local function v377()
    -- upvalues: v45 (ref), v44 (ref)
    local v372 = false;
    local v373 = entity.get_local_player();
    if not v373 or v373 == nil or not v373:is_alive() then
        return;
    else
        local v374 = bit.band(v373.m_fFlags, 1) == 0 and math.sqrt(v373.m_vecVelocity.x ^ 2 + v373.m_vecVelocity.y ^ 2) > 150;
        local v375 = v373:get_player_weapon();
        if v375 == nil then
            return;
        else
            local v376 = v375:get_classname();
            if v45.dschrgweap:get("AWP") and string.match(v376, "AWP") then
                v372 = true;
            end;
            if v45.dschrgweap:get("Scout") and string.match(v376, "SSG08") then
                v372 = true;
            end;
            if v45.dschrgweap:get("Taser") and string.match(v376, "Taser") then
                v372 = true;
            end;
            if v44.dischrgswt:get() and v374 and v372 == true and entity.get_threat(true) then
                rage.exploit:force_teleport();
                v372 = false;
            end;
            return;
        end;
    end;
end;
local v378 = render.screen_size() / 2;
local _ = v378.x;
local _ = v378.y;
v11 = function(v381, v382, v383)
    if not v382 then
        v382 = 0;
    end;
    if not v383 then
        v383 = 0;
    end;
    if not v381 then
        v381 = 0;
    end;
    if type(v382) ~= "number" or type(v383) ~= "number" or type(v381) ~= "number" then
        error("Invalid arguments: 'a', 'b', and 'time' must be numbers");
    end;
    return v382 * (1 - v381) + v383 * v381;
end;
windowkeybinds = function(v384, v385, v386, v387, v388, v389)
    -- upvalues: v45 (ref), v44 (ref), v26 (ref)
    local v390 = entity.get_local_player();
    if v390 == nil or not v390:is_alive() then
        return;
    else
        local v391 = render.measure_text(1, "", v388);
        local l_r_0 = v45.widside:get().r;
        local l_g_0 = v45.widside:get().g;
        local l_b_0 = v45.widside:get().b;
        local l_r_1 = v45.widshad:get().r;
        local l_g_1 = v45.widshad:get().g;
        local l_b_1 = v45.widshad:get().b;
        local l_a_0 = v45.widshad:get().a;
        if v44.widgswt:get() then
            render.shadow(vector(v384, v385 - 1), vector(v384 + v386 + 3, v385 + 19), color(l_r_1, l_g_1, l_b_1, v389 * (l_a_0 / 255)), 30, 0, 7);
            render.gradient(vector(v384 - 2, v385 - 1), vector(v384 + 9, v385 + 19), color(l_r_0, l_g_0, l_b_0, v389), color(l_r_0, l_g_0, l_b_0, v389), color(l_r_0, l_g_0, l_b_0, v389), color(l_r_0, l_g_0, l_b_0, v389), 3);
            render.gradient(vector(v384 + v386 + 2 - 9, v385 - 1), vector(v384 + 5 + v386, v385 + 19), color(l_r_0, l_g_0, l_b_0, v389), color(l_r_0, l_g_0, l_b_0, v389), color(l_r_0, l_g_0, l_b_0, v389), color(l_r_0, l_g_0, l_b_0, v389), 3);
            render.rect(vector(v384, v385 - 1), vector(v384 + v386 + 3, v385 + 19), color(29, 29, 29, v389), 7);
            render.text(v26, vector(v384 + 3 + v386 / 2 + 1 - v391.x / 2, v385 + v387 / 2 - v391.y / 2), color(255, 255, 255, v389), "", v388);
        end;
        return;
    end;
end;
windowspectatorsandwater = function(v399, v400, v401, v402, v403, v404)
    -- upvalues: v45 (ref), v44 (ref), v26 (ref)
    if entity.get_local_player() == nil then
        return;
    else
        local v405 = render.measure_text(1, "", v403);
        local l_r_2 = v45.widside:get().r;
        local l_g_2 = v45.widside:get().g;
        local l_b_2 = v45.widside:get().b;
        local l_r_3 = v45.widshad:get().r;
        local l_g_3 = v45.widshad:get().g;
        local l_b_3 = v45.widshad:get().b;
        local l_a_1 = v45.widshad:get().a;
        if v44.widgswt:get() then
            render.shadow(vector(v399, v400 - 1), vector(v399 + v401 + 3, v400 + 19), color(l_r_3, l_g_3, l_b_3, v404 * (l_a_1 / 255)), 30, 0, 7);
            render.gradient(vector(v399 - 2, v400 - 1), vector(v399 + 9, v400 + 19), color(l_r_2, l_g_2, l_b_2, v404), color(l_r_2, l_g_2, l_b_2, v404), color(l_r_2, l_g_2, l_b_2, v404), color(l_r_2, l_g_2, l_b_2, v404), 3);
            render.gradient(vector(v399 + v401 + 2 - 9, v400 - 1), vector(v399 + 5 + v401, v400 + 19), color(l_r_2, l_g_2, l_b_2, v404), color(l_r_2, l_g_2, l_b_2, v404), color(l_r_2, l_g_2, l_b_2, v404), color(l_r_2, l_g_2, l_b_2, v404), 3);
            render.rect(vector(v399, v400 - 1), vector(v399 + v401 + 3, v400 + 19), color(29, 29, 29, v404), 7);
            render.text(v26, vector(v399 + 3 + v401 / 2 + 1 - v405.x / 2, v400 + v402 / 2 - v405.y / 2), color(255, 255, 255, v404), "", v403);
        end;
        return;
    end;
end;
local l_x_1 = render.screen_size().x;
local l_y_1 = render.screen_size().y;
local v415 = 0;
local v416 = 1;
local _ = 0;
local v418 = 0;
local v419 = {
    [""] = {
        alpha1 = 0
    }
};
local _ = 1;
local v421 = v44.widgswt:create():slider("posx", 0, l_x_1, 200);
local v422 = v44.widgswt:create():slider("posy", 0, l_y_1, 200);
local v423 = v44.widgswt:create():slider("posx1", 0, l_x_1, 300);
local v424 = v44.widgswt:create():slider("posy1", 0, l_y_1, 300);
v421:visibility(false);
v422:visibility(false);
v423:visibility(false);
v424:visibility(false);
local function v429()
    -- upvalues: v45 (ref), l_x_1 (ref)
    local _ = "";
    local v426 = common.get_date("%H:%M");
    local v427 = "";
    v427 = "\aF65B8CFF Abso\a" .. "\aF65B8CFFlute \aFFFFFFFF| " .. v45.cstmname:get() .. " | " .. v426 .. " ";
    local l_x_2 = render.measure_text(1, "", v427).x;
    windowspectatorsandwater(l_x_1 - l_x_2 - 19, 10, l_x_2 + 4, 16, v427, 255);
end;
local v449 = l_system_0.register({
    [1] = v421, 
    [2] = v422
}, vector(120, 60), "Key Bindings", function(v430)
    -- upvalues: v419 (ref), v11 (ref), v418 (ref), v416 (ref), v415 (ref)
    local v431 = entity.get_local_player();
    if not v431 or not v431:is_alive() then
        return;
    else
        local v432 = globals.frametime * 16;
        local v433 = 0;
        local v434 = 0;
        local v435 = ui.get_binds();
        local l_x_3 = v430.position.x;
        local l_y_2 = v430.position.y;
        local v438 = {
            [1] = "holding", 
            [2] = "toggled"
        };
        for _, v440 in ipairs(v435) do
            local v441 = v438[v440.mode] or "[?]";
            local l_name_0 = v440.name;
            local v443 = render.measure_text(1, "", v441);
            local v444 = render.measure_text(1, "", l_name_0);
            if not v419[l_name_0] then
                v419[l_name_0] = {
                    alpha1 = 0
                };
            end;
            v419[l_name_0].alpha1 = v11(v432, v419[l_name_0].alpha1, v440.active and 255 or 0);
            local v445 = l_y_2 + 22 + v434;
            local l_alpha1_0 = v419[l_name_0].alpha1;
            render.text(1, vector(l_x_3 + 3, v445), color(255, l_alpha1_0), "", l_name_0);
            render.text(1, vector(l_x_3 + (v418 - v443.x - 8), v445), color(255, l_alpha1_0), "", "[" .. v441 .. "]");
            v434 = v434 + 16 * l_alpha1_0 / 255;
            local v447 = v443.x + v444.x + 18;
            v433 = math.max(v433, v447);
        end;
        local v448 = ui.get_alpha();
        v416 = v11(v432, v416, (not (v448 <= 0) or v434 > 0) and 1 or 0);
        v418 = v11(v432, v418, math.max(v433, 119));
        if v448 > 0 or v434 > 6 then
            v415 = v11(v432, v415, math.max(v448 * 255, v434 > 1 and 255 or 0));
        elseif v434 < 15.99 and v448 == 0 then
            v415 = v11(v432, v415, 0);
        end;
        if v448 > 0 or #v435 > 0 then
            windowkeybinds(l_x_3, l_y_2, v418, 16, "keybinds", v415);
        end;
        return;
    end;
end);
local v458 = l_system_0.register({
    [1] = v423, 
    [2] = v424
}, vector(120, 60), "Spectators List", function(v450)
    local v451 = 120;
    if ui.get_alpha() > 0.3 then
        windowspectatorsandwater(v450.position.x, v450.position.y, v451, 16, "spectators", 255);
    end;
    local v452 = entity.get_local_player();
    if not v452 then
        return;
    else
        if v452.m_hObserverTarget and (v452.m_iObserverMode == 4 or v452.m_iObserverMode == 5) then
            v452 = v452.m_hObserverTarget;
        end;
        local v453 = v452.get_spectators(v452);
        if not v453 or #v453 == 0 then
            return;
        else
            for v454, v455 in pairs(v453) do
                if not v455:is_bot() or v455:is_player() then
                    local v456 = v455:get_name();
                    local v457 = #v456 > 20 and v456:sub(1, 20) .. "..." or v456;
                    render.text(1, vector(v450.position.x + 10, v450.position.y + 5 + v454 * 15), color(), "u", v457);
                end;
            end;
            if #v453 > 0 or v452.m_iObserverMode == 4 or v452.m_iObserverMode == 5 then
                windowspectatorsandwater(v450.position.x, v450.position.y, v451, 16, "spectators", 255);
            end;
            return;
        end;
    end;
end);
get_word = function(v459)
    -- upvalues: v42 (ref)
    v42 = v42 + 1;
    if v42 > #v459 then
        v42 = 1;
    end;
    return v459[v42]:gsub("'", "");
end;
events.player_death:set(function(v460)
    -- upvalues: v44 (ref), v45 (ref), v40 (ref), v41 (ref)
    local v461 = entity.get_local_player();
    if not v44.enable_trashtalk:get() or not v461 then
        return;
    else
        local v462 = entity.get(v460.userid, true);
        local v463 = entity.get(v460.attacker, true);
        local v464 = entity.get(v460.userid, true);
        if v463 == v461 and v462 ~= v461 and v44.enable_trashtalk:get() then
            utils.execute_after(v45.delay:get(), function()
                -- upvalues: v40 (ref)
                utils.console_exec("say " .. get_word(v40));
            end);
        end;
        if v461 ~= v463 and v464 == v461 and v45.dedsay:get() then
            utils.execute_after(v45.delay:get(), function()
                -- upvalues: v41 (ref)
                utils.console_exec("say " .. get_word(v41));
            end);
        end;
        return;
    end;
end);
v45.aspect_ratio_switch:create():button("16:9", function()
    -- upvalues: v46 (ref)
    v46.aspect_ratio_slider:set(18);
end);
v45.aspect_ratio_switch:create():button("16:10", function()
    -- upvalues: v46 (ref)
    v46.aspect_ratio_slider:set(16);
end);
v45.aspect_ratio_switch:create():button("4:3", function()
    -- upvalues: v46 (ref)
    v46.aspect_ratio_slider:set(13);
end);
v45.aspect_ratio_switch:create():button("5:4", function()
    -- upvalues: v46 (ref)
    v46.aspect_ratio_slider:set(12);
end);
local v465 = 0;
local v466 = 0;
local function v468()
    -- upvalues: v465 (ref), v466 (ref)
    local l_m_nTickBase_0 = entity.get_local_player().m_nTickBase;
    if math.abs(l_m_nTickBase_0 - v465) > 64 then
        v465 = 0;
    end;
    if v465 < l_m_nTickBase_0 then
        v465 = l_m_nTickBase_0;
    elseif l_m_nTickBase_0 < v465 then
        v466 = math.min(14, math.max(0, v465 - l_m_nTickBase_0 - 1));
    end;
    return v466 < 0;
end;
local v469 = 0;
local v470 = 0.013;
local function v473(v471, v472)
    render.circle(vector(v471, v472), color(0, 0, 0, 120), 6, 0, 1);
end;
local function v477(v474, v475, v476)
    -- upvalues: v45 (ref)
    render.circle_outline(vector(v474, v475), color(v45.dtchrg:get().r, v45.dtchrg:get().g, v45.dtchrg:get().b, v45.dtchrg:get().a), 6, 0, v476, 2);
end;
local function v485()
    -- upvalues: v44 (ref), l_animations_0 (ref), v466 (ref), v469 (ref), v470 (ref), v473 (ref), v477 (ref)
    local v478 = entity.get_local_player();
    if v478 == nil or not v478:is_alive() then
        return;
    else
        if v44.dt:get() and v44.indswt:get() and ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() then
            local _ = render.screen_size().x / 2;
            local _ = render.screen_size().y / 2;
            local v481 = render.screen_size() / 2;
            local v482 = l_animations_0.new("First scope x-value", v481.x):update(l_animations_0.types.IN_OUT_CIRC, v478.m_bIsScoped and v481.x + 30 or v481.x) - 20 + 40;
            local v483 = v481.y + 30 + 25;
            local v484 = rage.exploit:get();
            if v466 > 0 then
                v469 = math.min(math.max(v469 + (v484 == 1 and v470 or -v470), 0), 1);
            end;
            if v466 < 1 then
                v469 = math.min(math.max(v469 + (v484 == 0 and v470 or -v470), 0), 0);
            end;
            v473(v482, v483);
            v477(v482, v483, v469);
        end;
        return;
    end;
end;
local function v494()
    -- upvalues: v44 (ref), l_gradient_0 (ref), v45 (ref), l_animations_0 (ref), v26 (ref)
    local v486 = entity.get_local_player();
    if v486 == nil or not v486:is_alive() then
        return;
    else
        if v44.dt:get() and v44.indswt:get() then
            gradient_animation2 = l_gradient_0.text_animate("DT", -1, {
                color(v45.grclr:get().r, v45.grclr:get().g, v45.grclr:get().b), 
                color(v45.dtchrg:get().r, v45.dtchrg:get().g, v45.dtchrg:get().b)
            });
            gradient_animation3 = l_gradient_0.text_animate("DT", -1, {
                color(v45.grclr:get().r, v45.grclr:get().g, v45.grclr:get().b), 
                color(v45.dtclr:get().r, v45.dtclr:get().g, v45.dtclr:get().b)
            });
            local _ = render.screen_size().x / 2;
            local _ = render.screen_size().y / 2;
            local v489 = render.screen_size() / 2;
            local v490 = entity.get_local_player();
            local v491 = l_animations_0.new("First scope x-value", v489.x):update(l_animations_0.types.IN_OUT_CIRC, v490.m_bIsScoped and v489.x + 30 or v489.x);
            local _ = 0;
            DT = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get();
            if DT then
                local _ = rage.exploit:get();
                render.text(v26, vector(v491 - 20 + 11, v489.y + 30 + 20), color(v45.dtclr:get().r, v45.dtclr:get().g, v45.dtclr:get().b, v45.dtclr:get().a), "", gradient_animation3:get_animated_text());
            end;
            gradient_animation3:animate();
            gradient_animation2:animate();
        end;
        return;
    end;
end;
local function v501()
    -- upvalues: v44 (ref), l_gradient_0 (ref), v45 (ref), l_animations_0 (ref), v26 (ref)
    local v495 = entity.get_local_player();
    if v495 == nil then
        return;
    else
        if v44.wt:get() then
            gradient_animation4 = l_gradient_0.text_animate("Absolute", -1, {
                color(v45.grclr:get().r, v45.grclr:get().g, v45.grclr:get().b), 
                color(v45.wtclr:get().r, v45.wtclr:get().g, v45.wtclr:get().b)
            });
            local _ = render.screen_size().x / 2;
            local _ = render.screen_size().y / 2;
            local v498 = render.screen_size() / 2;
            local v499 = l_animations_0.new("First scope x-value", v498.x):update(l_animations_0.types.IN_OUT_CIRC, v495.m_bIsScoped and v498.x + 30 or v498.x);
            local _ = render.measure_text(v26, nil, "ABSOLUTE YAW").x;
            render.text(v26, vector(v499 - 18, v498.y + 30), color(17, 17, 17, 115), nil, "Absolute");
            render.push_rotation(360);
            render.text(v26, vector(v499 - 20, v498.y + 30), color(v45.wtclr:get().r, v45.wtclr:get().g, v45.wtclr:get().b, v45.wtclr:get().a), nil, gradient_animation4:get_animated_text());
            gradient_animation4:animate();
            gradient_animation4:set_speed(-v45.wtspd:get() / 10);
            render.shadow(vector(v499 - 16 - 4, v498.y + 34), vector(v499 - 16 + 38, v498.y + 34 + 4), color(v45.grclr:get().r, v45.grclr:get().g, v45.grclr:get().b, v45.grclr:get().a), 45, 0, 7.5);
        end;
        return;
    end;
end;
local function v506(v502)
    -- upvalues: v45 (ref), v44 (ref)
    local v503 = entity.get_local_player();
    local v504 = v45.airlgsp:get();
    local v505 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit");
    if not v503 or v503 == nil or not v503:is_alive() then
        return;
    else
        if v44.airlagswt:get() then
            if bit.band(v503.m_fFlags, bit.lshift(1, 0)) == 0 or v502.in_jump then
                if globals.tickcount % v504 > 1 then
                    v502.force_defensive = true;
                    v505:override(math.random(10));
                    rage.exploit:force_teleport();
                else
                    rage.exploit:force_charge();
                end;
            end;
        else
            v505:override();
        end;
        return;
    end;
end;
local v507 = {
    [1] = "vgui_white", 
    [2] = "vgui/hud/800corner1", 
    [3] = "vgui/hud/800corner2", 
    [4] = "vgui/hud/800corner3", 
    [5] = "vgui/hud/800corner4"
};
local v508 = color(255);
local l_v508_0 = v508;
local function v513(v510)
    -- upvalues: l_v508_0 (ref), v507 (ref)
    if l_v508_0 ~= v510 then
        for _, v512 in pairs(v507) do
            materials.get_materials(v512)[1]:alpha_modulate(v510.a / 255);
            materials.get_materials(v512)[1]:color_modulate(color(v510.r, v510.g, v510.b));
        end;
        l_v508_0 = v510;
    end;
end;
local function v515()
    -- upvalues: v45 (ref), v508 (ref), v513 (ref)
    local v514 = v45.conclr:get() or v508;
    v513(v514);
end;
local function v521()
    -- upvalues: v44 (ref), v45 (ref)
    local v516 = entity.get_local_player();
    if v516 == nil or not v516:is_alive() then
        return;
    else
        if v44.dmg1nd:get() and v44.indswt:get() then
            local v517 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get();
            local _ = render.screen_size();
            local v519 = render.screen_size().x / 2 + v45.x1:get();
            local v520 = render.screen_size().y / 2 + v45.y1:get();
            render.text(4, vector(v519, v520), color(v45.dmgclr:get().r, v45.dmgclr:get().g, v45.dmgclr:get().b, v45.dmgclr:get().a), nil, v517);
        end;
        return;
    end;
end;
local function v523()
    -- upvalues: l_gradient_0 (ref)
    gradient_animationxz = l_gradient_0.text_animate("Absolute", -1, {
        color(255, 0, 0), 
        color(255, 255, 255)
    });
    local _ = ui.sidebar(gradient_animationxz:get_animated_text(), "joint");
    gradient_animationxz:animate();
end;
local v524 = {};
local function v534(v525, v526)
    local v527, v528, v529 = v525.m_vecOrigin:unpack();
    local v530 = math.pi * 2;
    for v531 = 0, v530, v530 / 8 do
        local v532 = 10 * math.cos(v531) + v527;
        local v533 = 10 * math.sin(v531) + v528;
        if utils.trace_line(vector(v532, v533, v529), vector(v532, v533, v529 - v526), v525).fraction < 1 then
            return true;
        end;
    end;
    return false;
end;
do
    local l_v534_0 = v534;
    v524.update = function(v536)
        -- upvalues: v44 (ref), l_v534_0 (ref)
        local v537 = entity.get_local_player();
        if not v537 or not v44.nfd:get() or not v537:is_alive() then
            return;
        else
            if v537.m_vecVelocity.z < -500 then
                if l_v534_0(v537, 15) then
                    v536.in_duck = 0;
                elseif l_v534_0(v537, 75) then
                    v536.in_duck = 1;
                end;
            end;
            return;
        end;
    end;
end;
v46.ind_font:visibility(false);
v48.logColor:visibility(false);
v48.textColor:visibility(true);
v46.log_x:visibility(false);
v46.log_y:visibility(false);
v534 = render.screen_size();
local function v541(v538, v539)
    if ui.get_alpha() < 1 then
        return false;
    else
        local v540 = ui.get_mouse_position();
        return v540.x >= v538.x and v540.x <= v539.x and v540.y >= v538.y and v540.y <= v539.y;
    end;
end;
local v542 = v46.ind_font:get();
v46.ind_font:set_callback(function()
    -- upvalues: v542 (ref), v46 (ref)
    v542 = v46.ind_font:get();
end);
local v543 = v46.hitlogfont:get();
v46.hitlogfont:set_callback(function()
    -- upvalues: v543 (ref), v46 (ref)
    v543 = v46.hitlogfont:get();
end);
local v544 = {};
local v545 = 0;
math.lerp = function(v546, v547, v548)
    return v546 + (v547 - v546) * globals.frametime * v548;
end;
local function v550(v549)
    return font_log == 2 and string.upper(string.gsub(v549, " ", "    ")) or v549 or v549;
end;
local v564 = l_system_0.register({
    [1] = v46.log_x, 
    [2] = v46.log_y
}, vector(320, 130), "Logs", function(v551)
    -- upvalues: v544 (ref), v45 (ref), v543 (ref), v550 (ref), v48 (ref), v46 (ref), v541 (ref), v545 (ref), v47 (ref)
    local v552 = 0;
    local v553 = v551.position.x + 151;
    local v554 = v551.position.y - 10;
    for v555, v556 in ipairs(v544) do
        if globals.curtime - v556[3] < 4 and (#v544 <= 5 or v555 >= #v544 - 5) then
            v556[2] = math.lerp(v556[2], 255, 15);
        else
            v556[2] = math.lerp(v556[2], -2, 55);
        end;
        v552 = v552 - (v45.group:get() and 20 or 40) * (v556[2] / 255);
        local v557 = render.measure_text(v543, "", v550(v556[1]));
        local l_r_4 = v48.textColor:get().r;
        local l_g_4 = v48.textColor:get().g;
        local l_b_4 = v48.textColor:get().b;
        local v561 = 255;
        if ui.get_alpha() == 0 and v45.group:get() then
            render.shadow(vector(v553 + 13 - v557.x / 2, v554 - v552 + v557.y - 5), vector(v553 + 3 + v557.x / 2, v554 - v552 + v557.y - 5), color(v48.shadowColor:get().r, v48.shadowColor:get().g, v48.shadowColor:get().b, v556[2] / 255 * v48.shadowColor:get().a), 35, -1, 0);
            render.gradient(vector(v553 - 6 + 13 - v557.x / 2, v554 - v552 + v557.y - 13), vector(v553 + 6 + 3 + v557.x / 2, v554 - v552 + v557.y - 13 + 1), color(l_r_4, l_g_4, l_b_4, v561), color(l_r_4, l_g_4, l_b_4, v561), color(l_r_4, l_g_4, l_b_4, v561), color(l_r_4, l_g_4, l_b_4, v561), 3);
            render.text(v543, vector(v553 + 9 - v557.x / 2, v554 - v552), color(255, 255, 255, v556[2] / 255 * 255), "od", v550(v556[1]));
        end;
        if v556[2] < 0.1 or not entity.get_local_player() then
            table.remove(v544, v555);
        end;
    end;
    if ui.get_alpha() > 0 and v46.printconsole:get(3) then
        local v562 = "\a10FF00FFHit \aF65B8CFFAbsolute's \aFFFFFFFFstomach for \aA1FF8FFF100\aFFFFFFFF (100) bt: \aFF0000FF30 \aFFFFFFFF| hp: \aFF0000FF0\aFFFFFFFF";
        local v563 = render.measure_text(v543, "od", v550(v562));
        if v45.group:get() then
            render.shadow(vector(v553 + 13 - v563.x / 2, v554 + 20 + v563.y - 5), vector(v553 + 3 + v563.x / 2, v554 + 20 + v563.y - 5), color(v48.shadowColor:get().r, v48.shadowColor:get().g, v48.shadowColor:get().b, v48.shadowColor:get().a * ui.get_alpha()), 35, -1, 0);
            render.text(v543, vector(v553 + 9 - v563.x / 2, v554 + 20), color(255, 255, 255, 255 * ui.get_alpha()), "od", v550(v562));
        end;
    end;
    if v541(vector(v46.log_x:get(), v46.log_y:get()), vector(v46.log_x:get() + v551.size.x, v46.log_y:get() + v551.size.y)) then
        render.text(v543, vector(v551.position.x + 65, v551.position.y - 35), color(255, 255, 255, 255 * v545), "od", v550("Click Right Mouse To Center Widget"));
        v545 = math.lerp(v545, 1, 12);
        if common.is_button_down(2) then
            v46.log_x:set(v47.x - 160);
            v551.position.x = v47.x - 160;
            v46.log_y:set(v47.y + 160);
            v551.position.y = v47.y + 160;
        end;
    else
        v545 = v545 > 0 and 0 or v545;
    end;
end);
local v565 = "misses_button";
local v566 = db[v565] or {
    name = "0"
};
v30:set_name(v566.name);
events.bullet_impact:set(function(v567)
    -- upvalues: v30 (ref), v566 (ref)
    local v568 = entity.get_local_player();
    if not v568:is_alive() then
        return;
    else
        local v569 = entity.get(v567.userid, true);
        if not v569 or not v569:is_enemy() then
            return;
        else
            local v570 = v568 and v568:get_eye_position();
            local v571 = v569:get_eye_position();
            if v570 and v571 then
                local v572 = v570:closest_ray_point(v571, (vector(v567.x, v567.y, v567.z)));
                if v572 and v572:dist(v570) < 45 then
                    local v573 = (tonumber(v30:get_name()) or 0) + 1;
                    local v574 = tostring(v573);
                    v30:set_name(v574);
                    v566.name = v574;
                end;
            end;
            return;
        end;
    end;
end);
local v575 = "kills_button";
local v576 = db[v575] or {
    name = "0"
};
v28:set_name(v576.name);
events.aim_ack:set(function(v577)
    -- upvalues: v220 (ref), v28 (ref), v576 (ref)
    configs.phaseselect:update(v220.menulist);
    local v578 = entity.get_local_player();
    if v578 == nil or not v578 or not v578:is_alive() then
        return;
    else
        local v579 = entity.get(v577.target);
        if not v579 or v579:is_alive() then
            return;
        else
            local v580 = (tonumber(v28:get_name()) or 0) + 1;
            local v581 = tostring(v580);
            v28:set_name(v581);
            v576.name = v581;
            return;
        end;
    end;
end);
events.shutdown:set(function()
    -- upvalues: v575 (ref), v576 (ref), v220 (ref), v565 (ref), v566 (ref)
    db[v575] = v576;
    db.configs_debug = configs_db;
    db.phase_debug = v220;
    db[v565] = v566;
    cvar.viewmodel_fov:int(68);
    cvar.viewmodel_offset_x:float(2.5);
    cvar.viewmodel_offset_y:float(0);
    cvar.viewmodel_offset_z:float(-1.5);
    common.set_clan_tag("\000", "\000");
    cvar.sv_maxunlag:float(0.2);
    cvar.cl_interp:float(0.1);
end);
render.log = function(v582, v583)
    -- upvalues: v544 (ref)
    table.insert(v544, {
        [1] = nil, 
        [2] = 0, 
        [1] = v582, 
        [3] = globals.curtime, 
        [4] = v583
    });
end;
local v584 = {
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
local function v593(v585, v586, v587, v588, v589, v590, _)
    local v592 = ("\a10FF00FFHit \a927C7CFF%s's \aFFFFFFFF%s for \a10FF00FF%d\aFFFFFFFF (%.f) bt: \aFF0000FF%s \aFFFFFFFF| hp: \aFF0000FF%d"):format(v585:get_name(), v586, v587, v588, v589, v590);
    render.log(v592);
end;
local function v601(v594, v595, v596, v597, v598, _)
    local v600 = ("Missed \a927C7CFF%s's \aFFFFFFFF%s due to \aE94B4BFF%s \aFFFFFFFFbt: %s | dmg: %.f"):format(v594:get_name(), v595, v596 or "unknown", v597, v598);
    render.log(v600);
end;
local function v604(v602, v603)
    if v603 then
        v603(v602);
    end;
end;
local function v612(v605, v606, v607, v608, v609, v610, v611)
    return ("\aF65B8CFF[Absolute] \194\187 \a10FF00FFHit \aD5D5D5AA %s %s for \a10FF00FF%d \a10FF00FF(%.f) \aD5D5D5AAdamage (hp: \aFF0000FF%d\aD5D5D5AA) \aD5D5D5AA(aimed: \aFF0000FF%s\aD5D5D5AA) (bt: \aFF0000FF%s\aD5D5D5AA)"):format(v605:get_name(), v606, v607, v608, v609, v610, v611);
end;
local function v619(v613, v614, v615, v616, v617, v618)
    return ("\aF65B8CFF[Absolute] \194\187 \aFF0000FFMissed \aFFFFFFAAshot in %s in the %s due to \aFF0000FF%s \aFFFFFFAA(hc: %.f) \aFF0000FF(dmg: %.f) (bt: \aFF0000FF%s\aD5D5D5AA)"):format(v613:get_name(), v614, v615 or "unknown", v616 or 0, v617, v618);
end;
local function v630(v620)
    -- upvalues: v584 (ref), v46 (ref), v593 (ref), v604 (ref), v612 (ref), v601 (ref), v619 (ref)
    local _ = entity.get_local_player();
    local v622 = entity.get(v620.target);
    if not v622 then
        return;
    else
        local l_m_iHealth_0 = v622.m_iHealth;
        local v624 = v584[v620.hitgroup];
        local v625 = v620.damage or 0;
        local v626 = v620.wanted_damage or 0;
        local l_backtrack_0 = v620.backtrack;
        local l_state_0 = v620.state;
        local v629 = v584[v620.wanted_hitgroup];
        if not l_state_0 then
            if v46.printconsole:get(3) then
                v593(v622, v624, v625, v626, l_backtrack_0, l_m_iHealth_0, v629);
            end;
            if v46.printconsole:get(2) then
                v604(v612(v622, v624, v625, v626, l_m_iHealth_0, v629, l_backtrack_0), print_dev);
            end;
            if v46.printconsole:get(1) then
                v604(v612(v622, v624, v625, v626, l_m_iHealth_0, v629, l_backtrack_0), print_raw);
            end;
        else
            if v46.printconsole:get(3) then
                v601(v622, v629, l_state_0, l_backtrack_0, v626, v620.hitchance);
            end;
            if v46.printconsole:get(2) then
                v604(v619(v622, v629, l_state_0, v620.hitchance, v626, l_backtrack_0), print_dev);
            end;
            if v46.printconsole:get(1) then
                v604(v619(v622, v629, l_state_0, v620.hitchance, v626, l_backtrack_0), print_raw);
            end;
        end;
        return;
    end;
end;
local function v637(v631)
    -- upvalues: v46 (ref)
    local v632 = entity.get_local_player();
    local v633 = entity.get(v631.attacker, true);
    local l_weapon_0 = v631.weapon;
    local v635 = "Hit";
    if v632 ~= v633 then
        return;
    else
        if l_weapon_0 == "hegrenade" then
            v635 = "Naded";
        end;
        if l_weapon_0 == "inferno" then
            v635 = "Burned";
        end;
        if l_weapon_0 == "knife" then
            v635 = "Knifed";
        end;
        if l_weapon_0 == "hegrenade" or l_weapon_0 == "inferno" or l_weapon_0 == "knife" then
            local v636 = entity.get(v631.userid, true);
            if v46.printconsole:get(1) then
                print_raw(("\aF65B8CFF[Absolute] \aD5D5D5AA%s %s for \a10FF00FF%d damage \aFFFFFFAA(\aFF0000FF%d \aFFFFFFAAhealth remaining)"):format(v635, v636:get_name(), v631.dmg_health, v631.health));
            end;
            if v46.printconsole:get(2) then
                print_dev(("\aF65B8CFF[Absolute] \aD5D5D5AA%s %s for \a10FF00FF%d damage \aFFFFFFAA(\aFF0000FF%d \aFFFFFFAAhealth remaining)"):format(v635, v636:get_name(), v631.dmg_health, v631.health));
            end;
            if v46.printconsole:get(3) then
                render.log(("\a10FF00FF%s \aFFFFFFFF%s \aD5D5D5AAfor \a10FF00FF%d damage \aFFFFFFAA(\aFF0000FF%d \aFFFFFFAAhealth remaining)"):format(v635, v636:get_name(), v631.dmg_health, v631.health));
            end;
        end;
        return;
    end;
end;
local function v641()
    local v638 = entity.get_local_player();
    rage.exploit:allow_defensive(true);
    local v639 = v638:get_player_weapon();
    if v639 == nil then
        return;
    else
        local v640 = v639:get_classname();
        throwtime = v639.m_fThrowTime;
        if throwtime ~= nil and throwtime ~= 0 and string.match(v640, "Grenade") then
            rage.exploit:allow_defensive(false);
        end;
        return;
    end;
end;
local function v645(v642, v643, v644)
    return v643 * (1 - v642) + v644 * v642;
end;
length = 0;
gap = 0;
local function v651()
    -- upvalues: v45 (ref), v645 (ref), v46 (ref)
    if not v45.custom_scope:get() then
        ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):set("Remove Overlay");
        return;
    else
        local l_x_5 = render.screen_size().x;
        local l_y_3 = render.screen_size().y;
        local v648 = entity.get_local_player();
        ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):set("Remove All");
        if v648 == nil then
            return;
        elseif v648.m_iHealth < 1 then
            return;
        else
            length = v645(0.15, length, v648.m_bIsScoped and v46.scope_length:get() or 0);
            gap = v645(0.15, gap, v648.m_bIsScoped and v46.scope_gap:get() or 0);
            local v649 = color(v46.scope_color:get().r, v46.scope_color:get().g, v46.scope_color:get().b, 255);
            local v650 = color(v46.scope_color:get().r, v46.scope_color:get().g, v46.scope_color:get().b, 0);
            render.gradient(vector(l_x_5 / 2 - gap, l_y_3 / 2), vector(l_x_5 / 2 - gap - length, l_y_3 / 2 + 1), v649, v650, v649, v650);
            render.gradient(vector(l_x_5 / 2 + gap, l_y_3 / 2), vector(l_x_5 / 2 + gap + length, l_y_3 / 2 + 1), v649, v650, v649, v650);
            render.gradient(vector(l_x_5 / 2, l_y_3 / 2 + gap), vector(l_x_5 / 2 + 1, l_y_3 / 2 + gap + length), v649, v649, v650, v650);
            render.gradient(vector(l_x_5 / 2, l_y_3 / 2 - gap), vector(l_x_5 / 2 + 1, l_y_3 / 2 - gap - length), v649, v649, v650, v650);
            return;
        end;
    end;
end;
fast_ladder_func = function(v652)
    if not entity.get_local_player() then
        return;
    elseif entity.get_local_player().m_MoveType ~= 9 then
        return;
    else
        v652.in_moveleft = v652.in_back;
        if v652.sidemove == 0 then
            v652.view_angles.y = v652.view_angles.y + 45;
        end;
        if v652.in_forward and v652.sidemove < 0 then
            v652.view_angles.y = v652.view_angles.y + 90;
        end;
        if v652.in_back and v652.sidemove > 0 then
            v652.view_angles.y = v652.view_angles.y + 90;
        end;
        if v652.view_angles.x < 0 then
            v652.view_angles.x = -45;
        end;
        v652.in_moveright = v652.in_forward;
        return;
    end;
end;
events.render:set(function()
    -- upvalues: v44 (ref), v73 (ref), v45 (ref), v564 (ref), v523 (ref), v50 (ref), v429 (ref), v449 (ref), v458 (ref)
    if v44.vlind:get() then
        v73:update();
    end;
    if v45.group:get() then
        v564:update();
    end;
    v523();
    if v44.clantag:get() then
        clantageeeroknroll(v50());
    else
        clantageeeroknroll(" ");
    end;
    if v45.widgcrt:get(1) and v44.widgswt:get() then
        v429();
    end;
    if v45.widgcrt:get(2) and v44.widgswt:get() then
        v449:update();
    end;
    if v45.widgcrt:get(3) and v44.widgswt:get() then
        v458:update();
    end;
end);
local l_ffi_0 = require("ffi");
local v654 = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement");
l_ffi_0.cdef("    int URLDownloadToFileA(void* pCaller, const char* szURL, const char* szFileName, unsigned long dwReserved, void* lpfnCB);\n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder; //0x0014\n        int m_nSequence; //0x0018\n        float m_flPrevCycle; //0x001C\n        float m_flWeight; //0x0020\n        float m_flWeightDeltaRate; //0x0024\n        float m_flPlaybackRate; //0x0028\n        float m_flCycle; //0x002C\n        void *m_pOwner; //0x0030\n        char  pad_0038[4]; //0x0034\n    } animstate_layer_t;\n");
local _ = l_ffi_0.typeof("uintptr_t**");
local _ = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)");
local function v659(_)
    -- upvalues: v46 (ref), v45 (ref), v654 (ref)
    local v658 = entity.get_local_player();
    if v658 == nil or not v658:is_alive() then
        return;
    else
        if v46.ground_legs:get() == "Static" and v45.animation_breakers:get() then
            v658.m_flPoseParameter[0] = 1;
            v654:override("Sliding");
        else
            v654:override("Default");
        end;
        if v46.air_legs:get() == "Static" and v45.animation_breakers:get() then
            v658.m_flPoseParameter[6] = 1;
        end;
        return;
    end;
end;
local function v660()
    -- upvalues: v45 (ref), v46 (ref)
    if v45.aspect_ratio_switch:get() then
        cvar.r_aspectratio:float(v46.aspect_ratio_slider:get() / 10);
    else
        cvar.r_aspectratio:float(0);
    end;
end;
local v661 = l_ffi_0.load("UrlMon");
local v662 = l_ffi_0.load("WinInet");
local function v666(v663, v664)
    -- upvalues: v662 (ref), v661 (ref)
    assert(type(v663) == "string", "Invalid type of download URL");
    assert(type(v664) == "string", "Invalid type of file path");
    if not pcall(v662.DeleteUrlCacheEntryA, v663) then
        print("Warning: Failed to clear cache for URL:", v663);
    end;
    local v665 = v661.URLDownloadToFileA(nil, v663, v664, 0, nil);
    if v665 ~= 0 then
        print("Error: Failed to download file from URL:", v663, "Result code:", v665);
    end;
end;
v666("https://github.com/DqrkTqrget/sound1/raw/refs/heads/main/Zettai%20wa%20bodu%20da.wav", "csgo\\sound\\Zettai_wa_bodu_da.wav");
v666("https://github.com/DqrkTqrget/sound1/raw/refs/heads/main/emperor1.wav", "csgo\\sound\\emperor1.wav");
local v667 = utils.get_vfunc("engine.dll", "IEngineSoundClient003", 12, "void*(__thiscall*)(void*, const char*, float, int, int, float)");
local function v671(v668, v669)
    -- upvalues: v667 (ref)
    local v670 = v668:lower():find(".wav") and v668 or ("%s.wav"):format(v668);
    pcall(v667, v670, tonumber(v669) / 100, 100, 0, 0);
end;
utils.execute_after(1, function()
    -- upvalues: v671 (ref)
    v671("Zettai_wa_bodu_da.wav", 100);
end);
v44.potok:set_callback(function()
    -- upvalues: v671 (ref)
    v671("emperor1.wav", 100);
end);
local v672 = {};
local v673 = {};
local function v689(v674)
    -- upvalues: v45 (ref), v106 (ref), v672 (ref), v673 (ref)
    local v675 = entity.get_local_player();
    local v676 = v45.potclr:get();
    if not v106.third:get() then
        return;
    else
        if v675 then
            local _ = v675:get_eye_position();
            local v678 = v675:get_hitbox_position(0);
            v672[#v672 + 1] = {
                draw = true, 
                x = v678.x + 2, 
                y = v678.y + 2, 
                z = v678.z - 2, 
                tick = tonumber(globals.tickcount) + 50
            };
            v673[#v673 + 1] = {
                draw = true, 
                x = v678.x + 2, 
                y = v678.y - 2, 
                z = v678.z - 2, 
                tick = tonumber(globals.tickcount) + 50
            };
            for v679 = 1, #v672 do
                if v679 > 2 then
                    local v680 = v672[v679];
                    local _ = v672[v679 - 68];
                    local v682 = v672[v679 - 1];
                    local v683 = vector(v680.x, v680.y, v680.z);
                    v674:render(vector(v682.x, v682.y, v682.z), v683, 0.1, "lg", color(v676.r, v676.g, v676.b, v676.a));
                    if v679 > 69 then
                        table.remove(v672, v679 - 69);
                    end;
                end;
            end;
            for v684 = 1, #v673 do
                if v684 > 2 then
                    local v685 = v673[v684];
                    local _ = v673[v684 - 68];
                    local v687 = v673[v684 - 1];
                    local v688 = vector(v685.x, v685.y, v685.z);
                    v674:render(vector(v687.x, v687.y, v687.z), v688, 0.1, "lg", color(v676.r, v676.g, v676.b, v676.a));
                    if v684 > 69 then
                        table.remove(v673, v684 - 69);
                    end;
                end;
            end;
        end;
        return;
    end;
end;
v44.potok:set_event("render_glow", v689);
v44.potok:tooltip("This is Absolute Zone, If u have bad pc dont turn it on, Cuz its very it's very taxing on the PC");
local function v690()
    -- upvalues: v45 (ref), v46 (ref)
    if v45.viewmodel_switch:get() then
        cvar.viewmodel_fov:int(v46.viewmodel_fov:get(), true);
        cvar.viewmodel_offset_x:float(v46.viewmodel_x:get(), true);
        cvar.viewmodel_offset_y:float(v46.viewmodel_y:get(), true);
        cvar.viewmodel_offset_z:float(v46.viewmodel_z:get(), true);
    else
        cvar.viewmodel_fov:int(68);
        cvar.viewmodel_offset_x:float(2.5);
        cvar.viewmodel_offset_y:float(0);
        cvar.viewmodel_offset_z:float(-1.5);
    end;
end;
local function v691()
    -- upvalues: v87 (ref), v106 (ref)
    if v87:get() == "Left" then
        v106.yaw_value:override(-90);
    elseif v87:get() == "Right" then
        v106.yaw_value:override(90);
    elseif v87:get() == "Backward" then
        v106.yaw_value:override(0);
        v106.yawbase:override("Local View");
    elseif v87:get() == "At Target" then
        v106.yawbase:override("At Target");
    end;
end;
local function v694()
    -- upvalues: v106 (ref), v46 (ref)
    local v692 = entity.get_local_player();
    if not v692 or v692 == nil or not v692:is_alive() then
        return;
    else
        local v693 = v692:get_player_weapon():get_weapon_index();
        if not v692.m_bIsScoped and bit.band(v692.m_fFlags, bit.lshift(1, 0)) == 0 then
            if v693 == 40 then
                v106.ssg08hc:override(v46.airssg:get());
            elseif v693 == 9 then
                v106.awphc:override(v46.airawp:get());
            elseif v693 == 38 or v693 == 11 then
                v106.autohc:override(v46.airauto:get());
            end;
        else
            v106.ssg08hc:override();
            v106.awphc:override();
            v106.autohc:override();
        end;
        return;
    end;
end;
events.post_update_clientside_animation:set(v659);
local _ = v84[v82()];
v44.nfd:set_event("createmove", v524.update);
v44.dischrgswt:set_event("createmove", v377);
v87:set_event("createmove", v194, "Disabled");
v87:set_event("createmove", v691, "Left");
v87:set_event("createmove", v691, "Right");
v87:set_event("createmove", v691, "Backward");
v87:set_event("createmove", v691, "At Target");
v44.grenthrow:set_event("createmove", v641);
v45.aspect_ratio_switch:set_event("createmove", v660);
v45.viewmodel_switch:set_event("createmove", v690);
v45.r8pred:set_event("createmove", v369);
v45.predict:set_event("createmove", v371);
v45.custom_scope:set_event("render", v651);
v45.airns:set_event("createmove", v694);
v44.dt:set_event("render", v494);
v44.dt:set_event("render", v485);
v44.dt:set_event("createmove", v468);
v44.wt:set_event("render", v501);
v44.dmg1nd:set_event("render", v521);
v44.airlagswt:set_event("createmove", v506);
v45.fast_ladder:set_event("createmove", fast_ladder_func);
v45.group:set_event("aim_ack", v630);
v45.group:set_event("player_hurt", v637);
v44.console:set_event("render", v515);
events.createmove:set(function()
    -- upvalues: v84 (ref), v82 (ref)
    local v696 = v84[v82()];
    if v696.yaw_modifier:get() == "Custom 5-Way" then
        Custom5ways(cmd);
    end;
    if v696.yaw_modifier:get() == "Custom 7-Way" then
        Custom7ways(cmd);
    end;
end);