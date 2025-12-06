version = {
    build = "STABLE", 
    username = common.get_username()
};
local v0 = {
    real_yaw = 0
};
theme_color = function()
    return "\a" .. ui.get_style("Link Active"):to_hex();
end;
local function _(v1, v2)
    return function(...)
        -- upvalues: v1 (ref), v2 (ref)
        return v1(v2, ...);
    end;
end;
local v4 = {};
ref = {
    hiddenthing = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    doubletapdoubletaplagoptions = ui.find("aimbot", "ragebot", "main", "double tap", "Lag Options"), 
    doubletapfakelaglimit = ui.find("aimbot", "ragebot", "main", "double tap", "Fake Lag Limit"), 
    hideshots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    yaw2 = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    moffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    limit1 = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    limit2 = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    Options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    freestand = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    antistab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    enableaa = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    airstrafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe"), 
    legmov = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    fakelag = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
    asoptions = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Stop", "Options"), 
    asdtoptions = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Stop", "Double Tap"), 
    fake_lag_limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
    fake_lag_variability = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"), 
    Backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    scouthtcmod = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance", "Double Tap"), 
    scouthtcmodd = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Min. Damage"), 
    awphtcmod = ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance", "Double Tap"), 
    autohtcmod = ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance", "Double Tap"), 
    pistolshtcmod = ui.find("Aimbot", "Ragebot", "Selection", "Pistols", "Hit Chance", "Double Tap"), 
    deaglehtcmod = ui.find("Aimbot", "Ragebot", "Selection", "Desert Eagle", "Hit Chance", "Double Tap"), 
    dmgforindicators = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    r8htcmod = ui.find("Aimbot", "Ragebot", "Selection", "R8 Revolver", "Hit Chance", "Double Tap"), 
    leftlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    rightlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    aa_enable = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
    scoutbodyaim = ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim"), 
    awpbodyaim = ui.find("Aimbot", "Ragebot", "Safety", "AWP", "Body Aim"), 
    r8bodyaim = ui.find("Aimbot", "Ragebot", "Safety", "R8 Revolver", "Body Aim"), 
    fakelagforme = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    optiuninoifrtui = ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim", "Disablers"), 
    optiuninoifrtui2 = ui.find("Aimbot", "Ragebot", "Safety", "R8 Revolver", "Body Aim", "Disablers"), 
    optiuninoifrtui3 = ui.find("Aimbot", "Ragebot", "Safety", "AWP", "Body Aim", "Disablers"), 
    freeyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    freebody = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
    smekeriacumagnetu = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    hideshotsfl = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
};
local l_gradient_0 = require("neverlose/gradient");
local function v22(v6, v7, v8, v9, v10, v11, v12, v13, v14)
    local v15 = "";
    local v16 = #v14 - 1;
    local v17 = (v10 - v6) / v16;
    local v18 = (v11 - v7) / v16;
    local v19 = (v12 - v8) / v16;
    local v20 = (v13 - v9) / v16;
    for v21 = 1, v16 + 1 do
        v15 = v15 .. ("\a%02x%02x%02x%02x%s"):format(v6, v7, v8, v9, v14:sub(v21, v21));
        v6 = v6 + v17;
        v7 = v7 + v18;
        v8 = v8 + v19;
        v9 = v9 + v20;
    end;
    return v15;
end;
ffi_helpers = {
    open_link = function(v23)
        panorama.SteamOverlayAPI.OpenExternalBrowserURL(v23);
    end
};
ffi.cdef("    typedef struct \n    {\n        uint8_t r;\n        uint8_t g;\n        uint8_t b;\n        uint8_t a;\n    } uint_colors_t;\n\n    typedef void (__cdecl* console_color_print)(void*, const uint_colors_t&, const char*, ...);\n    void* __stdcall ShellExecuteA(void* hwnd, const char* op, const char* file, const char* params, const char* dir, int show_cmd);\n\n    bool CreateDirectoryA(const char* lpPathName, void* lpSecurityAttributes);\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);  \n    void* __stdcall ShellExecuteA(void* hwnd, const char* op, const char* file, const char* params, const char* dir, int show_cmd);\n\n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n");
local v24 = ffi.load("UrlMon");
local v25 = ffi.load("WinInet");
local _ = ffi.load("Shell32");
v4.contains = function(_, v28, v29)
    for _, v31 in pairs(v28) do
        if v31 == v29 then
            return true;
        end;
    end;
    return false;
end;
v4.get_neverlose_path = function(_)
    return common.get_game_directory():sub(1, -5) .. "nl/";
end;
v4.file_exists = function(_, v34, v35)
    return ffi.cast("bool (__thiscall*)(void*, const char*, const char*)", ffi.cast(ffi.typeof("void***"), utils.create_interface("filesystem_stdio.dll", "VBaseFileSystem011"))[0][10])(ffi.cast(ffi.typeof("void***"), utils.create_interface("filesystem_stdio.dll", "VBaseFileSystem011")), v34, v35);
end;
files.create_folder(common.get_game_directory());
v4.Download = function(_, v37, v38)
    -- upvalues: v25 (ref), v24 (ref)
    v25.DeleteUrlCacheEntryA(v37);
    v24.URLDownloadToFileA(nil, v37, v38, 0, 0);
end;
local v39 = ui.create(texd2, "");
stable = ui.get_icon("user-beard-bolt");
style_color = ui.get_style("Link Active");
events.render:set(function(_)
    -- upvalues: l_gradient_0 (ref)
    style_color = ui.get_style("Link Active");
    side_bar_final_text = l_gradient_0.text_animate("APOLLO " .. version.build .. "", 1, {
        style_color, 
        color(48, 50, 52), 
        color(48, 50, 52), 
        color(48, 50, 52), 
        color(48, 50, 52), 
        color(48, 50, 52)
    });
    side_bar_final_text:animate();
    ui.sidebar(side_bar_final_text:get_animated_text(), ui.get_icon("pi"));
end);
(function()
    -- upvalues: v25 (ref), v24 (ref)
    local _ = files.read("nl/ApolloForYou/apollo.gif");
    local _ = files.read("nl/ApolloForYou/totem.gif");
    local _ = files.read("nl/ApolloForYou/y.gif");
    local _ = files.read("nl/ApolloForYou/x.gif");
    if files.read("nl/ApolloForYou/Papuc.gif") == nil then
        utils.console_exec("play ui/beepclear");
        download = function(v45, v46)
            -- upvalues: v25 (ref), v24 (ref)
            v25.DeleteUrlCacheEntryA(v45);
            v24.URLDownloadToFileA(nil, v45, v46, 0, 0);
        end;
        files.create_folder("nl/ApolloForYou/");
        download("https://forum.neverlose.cc/uploads/default/original/3X/e/f/ef2e75e4e80febfb3c11c09af9e458620dc2a128.gif", "nl/ApolloForYou/apollo.gif");
        download("https://forum.neverlose.cc/uploads/default/original/3X/b/1/b189250ce33e5b582d31d4393f8f9fc61fe65f37.gif", "nl/ApolloForYou/totem.gif");
        download("https://forum.neverlose.cc/uploads/default/original/3X/b/5/b554946cefc93ba1cb85bbe429ddda5031e80edc.png", "nl/ApolloForYou/y.gif");
        download("https://forum.neverlose.cc/uploads/default/original/3X/1/d/1dc3550060daad8dc2ea768fe2869297d8c626a3.png", "nl/ApolloForYou/x.gif");
        download("https://forum.neverlose.cc/uploads/default/original/3X/4/e/4e9a82419e21a0abe0e0432921c0db1b0778cda1.png", "nl/ApolloForYou/Papuc.gif");
    end;
end)();
username = common.get_username();
renderer_window = function(_, _, _, _, _, _, _, _, _)

end;
infoicon = ui.get_icon("info");
texd2 = ui.get_icon("door-open") .. "\a{Link Active}  Info";
texd3 = ui.get_icon("folder") .. "\a{Link Active} Settings";
texd6 = infoicon .. "\a{Link Active} Home";
global6 = ui.create(texd2, texd6);
global66 = ui.create(texd2, texd3);
text4 = v22(254, 122, 152, 255, 255, 206, 134, 255, "                                  Best Config                                ");
text5 = v22(254, 122, 152, 255, 255, 206, 134, 255, "                                Apollo Alpha                                ");
v39 = ui.create(texd2, "");
icon = {
    loader = ui.get_icon("loader")
};
cfgicon = ui.get_icon("cog");
hearticon = ui.get_icon("heart");
verifiedpepole = ui.get_icon("user-check");
usercog = ui.get_icon("user-cog");
cartplus = ui.get_icon("cart-plus");
cart = ui.get_icon("cart-shopping");
bug = ui.get_icon("bug");
Widgets = ui.get_icon("sad-cry");
defaa = ui.get_icon("shield-halved");
local _ = {
    blue = "\aA9B7FFFF", 
    bright_red = "\aFF9A9AFF", 
    grey = "\aFFFFFF8D", 
    bright = "\aE3E9FFFF", 
    blue_nonhex = color(169, 183, 255), 
    bright_red_non_hex = color(255, 154, 154), 
    link_active = ui.get_style("Link Active")
};
global6:label(verifiedpepole .. "\a{Link Active} Logged in as " .. common.get_username() .. "\n");
global6:label("\a{Link Active}" .. usercog .. "Version: " .. version.build);
global6:label("\a{Link Active}" .. bug .. "\aff4040ff       *Please report bugs / issues if you \n                 encounter them on discord!*");
global6:button("\a{Link Active}" .. cart .. "                RECOMMENDED CONFIG            ", function()
    ffi_helpers.open_link("https://en.neverlose.cc/market/item?id=XmekLp");
end, true);
global6:button("\a{Link Active}" .. ui.get_icon("discord") .. "                             DISCORD                                ", function()
    ffi_helpers.open_link("https://discord.gg/fuwFwqWV8m");
end, true);
menutablistui = ui.create(ui.get_icon("globe") .. "\a{Link Active}  General", "._.");
menutablistui2 = ui.create(ui.get_icon("globe") .. "\a{Link Active}  General", " ");
menutablistui7 = ui.create(ui.get_icon("globe") .. "\a{Link Active}  General", "\227\133\164");
menutablistui4 = ui.create(ui.get_icon("globe") .. "\a{Link Active}  General", "\227\133\164\227\133\164");
menutablistui3 = ui.create(ui.get_icon("globe") .. "\a{Link Active}  General", "Movement");
menutablist = menutablistui:list("\a{Link Active}Select", {
    [1] = ui.get_icon("user-shield") .. "Anti Aim", 
    [2] = ui.get_icon("fill-drip") .. "Visuals", 
    [3] = ui.get_icon("user-shield") .. "Misc"
}, 0);
menutablist:set_callback(function(v57)
    selected = v57:get();
    list = v57:list();
    if selected == 1 then
        list[selected] = "\a{Link Active} > " .. ui.get_icon("user-shield") .. "\a{Link Active} Anti-Aim & Ragebot";
        utils.console_exec("playvol  buttons/bell1.wav 1");
    else
        list[1] = ui.get_icon("user-shield") .. "\a{Link Active} Anti-Aim & Ragebot";
    end;
    if selected == 2 then
        list[selected] = "\a{Link Active} > " .. ui.get_icon("fill-drip") .. "\a{Link Active} Visuals";
        utils.console_exec("playvol  buttons/bell1.wav 1");
    else
        list[2] = ui.get_icon("fill-drip") .. "\a{Link Active} Visuals";
    end;
    if selected == 3 then
        list[selected] = "\a{Link Active} > " .. ui.get_icon("folder-user") .. "\a{Link Active} Misc";
        utils.console_exec("playvol  buttons/bell1.wav 1");
    else
        list[3] = ui.get_icon("folder-user") .. "\a{Link Active} Misc";
    end;
    v57:update(list);
end, true);
texd2 = v22(37, 249, 245, 255, 8, 70, 218, 255, "Master Switch");
apollopresetname2 = menutablistui7:label("                     Apollo.lua - 2025 \194\169");
conditional = menutablistui2:list("", {
    [1] = "Disable", 
    [2] = "Conditional Anti-Aim", 
    [3] = "Apollo Stable", 
    [4] = "Defensive"
}, 0);
apollopresetname = menutablistui:label("        You are using new meta preset.\nEverything is automatically setup. Enjoy!");
defensivepresetname = menutablistui:label("        You are using new defensive preset.\nEverything is automatically setup. Enjoy!");
byalexcod = menutablistui:selectable("\a{Link Active}Tweaks", {
    [1] = "Bombsite E Fix", 
    [2] = "Anti-Backstab"
}, 0);
conditions = menutablistui2:combo("\a{Link Active}  Conditions", {
    [1] = "Stand", 
    [2] = "Move", 
    [3] = "Air", 
    [4] = "Air Crouching", 
    [5] = "Crouch", 
    [6] = "Slow-walk"
}, 0);
conditions4 = menutablistui2:selectable(ui.get_icon("person-rifle") .. " Break LC", {
    [1] = "Stand", 
    [2] = "Move", 
    [3] = "Air", 
    [4] = "Air Crouching", 
    [5] = "Crouch", 
    [6] = "Slow-walk"
}, 0);
byalexcheat = menutablistui2:switch(ui.get_icon("shield-halved") .. " Meta AA", false);
conditions6 = menutablistui2:selectable(ui.get_icon("head-side-heart") .. " Safe Head", {
    [1] = "Taser", 
    [2] = "Knife"
}, 0);
apollo_fl = menutablistui:switch(ui.get_icon("person-walking-arrow-loop-left") .. " Fake-lag Alternative", false);
pingunlocker1 = menutablistui:switch(ui.get_icon("wifi-exclamation") .. " Ping Unlocker", false);
pingthing = pingunlocker1:create();
pingunlocker = pingthing:slider("Amount", 0, 200, 0);
apollo_freestand = menutablistui:switch(ui.get_icon("people-arrows") .. " Freestand", false);
byalexcheat2 = byalexcheat:create();
byalexcod1999 = byalexcheat2:combo("Defensive Type", {
    [1] = "Custom", 
    [2] = "Simple"
}, 0);
byalexcod55 = byalexcheat2:slider("Pitch", -89, 89, 0);
byalexcod1998 = byalexcheat2:combo("Pitch", {
    [1] = "Disable", 
    [2] = "Semi Up", 
    [3] = "Semi Down", 
    [4] = "Down", 
    [5] = "Up", 
    [6] = "Random"
}, 0);
byalexcod56 = byalexcheat2:combo("Yaw", {
    [1] = "Disable", 
    [2] = "Spin", 
    [3] = "3-Way", 
    [4] = "5-Way", 
    [5] = "Stable"
}, 0);
byalexcod57 = byalexcheat2:slider("Yaw", -180, 180, 0);
baimifxhp = menutablistui:switch(ui.get_icon("skull") .. " Baim If Lethal", false);
baimifxhp2 = baimifxhp:create();
baimifxhp3 = baimifxhp2:listable("Weapon Selection", {
    [1] = "Scout", 
    [2] = "AWP", 
    [3] = "R8"
});
apolloexpolit = menutablistui:switch(ui.get_icon("hat-witch") .. " Teleport exploit (In air only)", false);
byalexintercode = byalexcod:create();
byalexcod3 = byalexintercode:selectable("\aecb48fFFAnim. Breakers", {
    [1] = "Static legs in air", 
    [2] = "Follow direction", 
    [3] = "Moonwalk"
}, 0);
main_visuals = ui.create(theme_color() .. ui.get_icon("eye") .. "  Visuals", "                                                               Visuals");
indicators_enable = menutablistui2:switch(ui.get_icon("paintbrush") .. " Indicators", false);
indicators_ref = indicators_enable:create();
indicators_mode = indicators_ref:combo("Mode", {
    [1] = "New"
});
indicators_extras = indicators_ref:listable("Extras \nff4040ff*Glow can reduce your FPS", {
    [1] = "Glow"
});
modernwatermark = menutablistui2:combo(ui.get_icon("image") .. " Watermark", {
    [1] = "Bottom", 
    [2] = "Left", 
    [3] = "Right"
});
sols_nou = menutablistui2:selectable(ui.get_icon("panorama") .. " Solus UI", {
    [1] = "Spectators", 
    [2] = "Keybinds"
});
solus_master = sols_nou:create();
theme_solus = solus_master:combo("Theme", {
    [1] = "Simple", 
    [2] = "Rounded", 
    [3] = "Optimized"
}, 0);
sol_accent = solus_master:color_picker("Global color");
sol_key_x = solus_master:slider("keybinds_x", 1, render.screen_size().x, render.screen_size().x / 2 - 250, "", "");
sol_key_y = solus_master:slider("keybinds_y", 1, render.screen_size().y, render.screen_size().y / 2 - 50, "", "");
sol_spec_x = solus_master:slider("spectators_x", 1, render.screen_size().x, render.screen_size().x / 2 - 550, "", "");
sol_spec_y = solus_master:slider("spectators_y", 1, render.screen_size().y, render.screen_size().y / 2 - 50, "", "");
accent_color = indicators_ref:color_picker("Accent Color                                 " .. ui.get_icon("palette"), color(255, 165, 0, 255));
infopanelmadafakar = menutablistui2:switch(ui.get_icon("sparkles") .. " Info panel", false);
velocity_ind = menutablistui2:switch(ui.get_icon("rabbit-running") .. " Velocity Indicator                    " .. ui.get_icon("palette"));
velocity_ind_col = velocity_ind:color_picker(color(255, 165, 0, 255));
gsindicators = menutablistui2:switch(ui.get_icon("face-raised-eyebrow") .. " \aAFFF0BFF250$ Indicators");
shared_icon = menutablistui2:switch(ui.get_icon("images") .. " Shared Icon", false);
custom_scope = menutablistui2:switch(ui.get_icon("crosshairs") .. " Custom Scope");
scope_ref = custom_scope:create();
scope_gap = scope_ref:slider("Scope Gap", 0, 300, 46);
scope_length = scope_ref:slider("Scope Length", 0, 300, 138);
MinDMGvis = menutablistui2:switch(ui.get_icon("circle-exclamation") .. " Minimum DMG indicator");
MinDMGX = MinDMGvis:create();
mindmgcomboo = MinDMGX:combo("Min DMG Position", "Top middle", "Top left", "Top right", "Lower left", "Lower right");
scope_color = scope_ref:color_picker("Scope Color                                   " .. ui.get_icon("palette"));
arrows_enable = menutablistui2:switch(ui.get_icon("arrows-left-right") .. " Arrows", false);
snaplines = menutablistui2:switch(ui.get_icon("lines-leaning") .. " Snaplines", false);
snaplinesslpit = snaplines:create();
snaplinescolor = snaplinesslpit:color_picker("\208\161olor                                                " .. ui.get_icon("palette"), color(255));
arrows_ref = arrows_enable:create();
arrows_col = arrows_ref:color_picker("Arrows Color                                " .. ui.get_icon("palette"));
state_col = indicators_ref:color_picker("State Color                                     " .. ui.get_icon("palette"));
hitlogsvar = menutablistui2:selectable(ui.get_icon("bullseye-arrow") .. " Hitlogs", "Under Crosshair", "Console");
hitlogssetts = hitlogsvar:create();
hitedshoots = hitlogssetts:color_picker("Color                                                " .. ui.get_icon("palette"), color(255, 165, 0, 255));
screen_size = render.screen_size();
keybinds_x = menutablistui2:slider("x_pos", 1, screen_size.x, screen_size.x / 2 - 250);
keybinds_y = menutablistui2:slider("y_pos", 1, screen_size.y, screen_size.y / 2 - 50);
spectators_x = menutablistui2:slider("x_poss", 1, screen_size.x, screen_size.x / 2 - 550);
spectators_y = menutablistui2:slider("y_poss", 1, screen_size.y, screen_size.y / 2 - 50);
infotab_x = menutablistui2:slider("x_posss", 1, screen_size.x, screen_size.x / 2 - 550);
infotab_y = menutablistui2:slider("y_posss", 1, screen_size.y, screen_size.y / 2 - 50);
infotab_x:visibility(false);
infotab_y:visibility(false);
keybinds_x:visibility(false);
keybinds_y:visibility(false);
spectators_x:visibility(false);
spectators_y:visibility(false);
sol_key_x:visibility(false);
sol_key_y:visibility(false);
sol_spec_x:visibility(false);
sol_spec_y:visibility(false);
cltgn = menutablistui2:switch(ui.get_icon("tag") .. " Clan-Tag");
trashtalk_switch = menutablistui2:switch(ui.get_icon("dog") .. " Trashtalk", false);
aspect_ratio_switch = menutablistui2:switch(ui.get_icon("percent") .. " Aspect ratio", false);
unmute_player = menutablistui2:switch(ui.get_icon("microphone-slash") .. " Unmute Silenced Players");
fast_ledder = menutablistui3:switch(ui.get_icon("water-ladder") .. " Fast Ladder", false);
fall_exploit = menutablistui3:switch(ui.get_icon("person-falling-burst") .. " No Fall Damage", false);
aspectratio_ref = aspect_ratio_switch:create();
aspect_ratio_slider = aspectratio_ref:slider("Value", 0, 200, 0, 0.01);
viewmodel_switch = menutablistui2:switch(ui.get_icon("street-view") .. " Viewmodel", false);
viewmodel_ref = viewmodel_switch:create();
viewmodel_fov = viewmodel_ref:slider("FOV", 1, 180, 0, 0.1);
viewmodel_x = viewmodel_ref:slider("X", -300, 300, 0, 0.1);
viewmodel_y = viewmodel_ref:slider("Y", -300, 300, 0, 0.1);
viewmodel_z = viewmodel_ref:slider("Z", -300, 300, 0, 0.1);
local v58 = render.load_font("Verdana", 10, "a o b");
local function v78()
    -- upvalues: v58 (ref), l_gradient_0 (ref)
    local v59 = entity.get_local_player();
    if not v59 or not v59:is_alive() or not globals.is_connected then
        return;
    else
        local l_x_0 = render.screen_size().x;
        local l_y_0 = render.screen_size().y;
        local v62 = "APOLLO.LUA";
        local v63 = "STABLE";
        local v64 = nil;
        local _ = nil;
        local v66 = nil;
        local v67 = nil;
        local v68 = 12;
        local v69 = 20;
        local v70 = (#v62 + #v63) * v68 - 48;
        if modernwatermark:get() == "Bottom" then
            v64 = vector(l_x_0 / 2 - v70 / 2, l_y_0 - 18);
            local v71 = vector(v64.x + 4, v64.y + 4);
            v67 = vector(v64.x + 104, v64.y + 4);
            v66 = v71;
        elseif modernwatermark:get() == "Left" then
            v64 = vector(20, l_y_0 / 2 - v69 / 2);
            local v72 = vector(v64.x - 1, v64.y + 7);
            v67 = vector(v64.x + 4 + #v62 * v68, v64.y + 7);
            v66 = v72;
        else
            v64 = vector(l_x_0 - 20 - #v62 * v68, l_y_0 / 2 - v69 / 2 - 1);
            local v73 = vector(v64.x - 2, v64.y + 7);
            v67 = vector(v64.x + 7 + #v62 * v68, v64.y + 7);
            v66 = v73;
        end;
        local v74 = color(0, 0, 0, 150);
        local v75 = color(255, 255, 255, 255);
        local v76 = color(255, 255, 255, 10);
        render.text(v58, vector(v64.x + 1, v64.y + 1), v74, "l", v62);
        render.text(v58, vector(v64.x - 1, v64.y - 1), v76, "l", v62);
        render.text(v58, vector(v64.x + 1, v64.y + 1), v76, "l", v62);
        render.shadow(v66, v67, v75, 30, 2, 0);
        render.text(v58, v64, v75, "l", v62);
        local v77 = l_gradient_0.text_animate("STABLE", -0.8, {
            color(255, 165, 0), 
            color(255, 200, 100), 
            color(255, 255, 255)
        });
        v77:animate();
        render.text(v58, vector(v64.x + #v62 * v68 - 48, v64.y + 0.5), v75, "l", v77:get_animated_text());
        return;
    end;
end;
events.render:set(v78);
damage_trace = function(v79)
    local v80 = entity.get_local_player();
    local l_x_1 = v80:get_origin().x;
    local l_y_1 = v80:get_origin().y;
    z = v80:get_origin().z;
    y = l_y_1;
    x = l_x_1;
    for v83 = 0, math.pi * 2, math.pi * 2 / 8 do
        if utils.trace_line(vector(10 * math.cos(v83) + x, 10 * math.sin(v83) + y, z), vector(10 * math.cos(v83) + x, 10 * math.sin(v83) + y, z - v79), self).fraction ~= 1 then
            return true;
        end;
    end;
    return false;
end;
local v84 = false;
damage_setup = function()
    -- upvalues: v84 (ref)
    if not fall_exploit:get() then
        return;
    else
        local v85 = entity.get_local_player();
        if v85 == nil then
            return;
        else
            if v85.m_vecVelocity.z >= -500 then
                v84 = false;
            elseif damage_trace(15) then
                v84 = false;
            elseif damage_trace(75) then
                v84 = true;
            end;
            return;
        end;
    end;
end;
events.createmove:set(damage_setup);
damage_duck = function(v86)
    -- upvalues: v84 (ref)
    if not fall_exploit:get() then
        return;
    else
        local v87 = entity.get_local_player();
        if v87 == nil then
            return;
        else
            if v87.m_vecVelocity.z < -500 then
                if v84 then
                    v86.in_duck = 1;
                else
                    v86.in_duck = 0;
                end;
            end;
            return;
        end;
    end;
end;
events.createmove:set(damage_duck);
local v88 = "250ab07ed7a5812e861ad78e3af37a29";
local v89 = "https://forum.neverlose.cc/uploads/default/original/3X/a/4/a42b1dc07240d0b069477702eb85a87789ddabec.png";
local function v91()
    -- upvalues: v88 (ref)
    events.voice_message:call(function(v90)
        -- upvalues: v88 (ref)
        v90:write_bits(20852, 128);
        v90:crypt(v88);
    end);
end;
local function v95()
    -- upvalues: v88 (ref)
    local v92 = entity.get_local_player();
    if v92 == nil then
        return;
    else
        v92:set_icon();
        events.voice_message:call(function(v93)
            -- upvalues: v88 (ref)
            v93:write_bits(25729, 128);
            v93:crypt(v88);
        end);
        entity.get_players(false, true, function(v94)
            v94:set_icon();
        end);
        return;
    end;
end;
local function v98()
    -- upvalues: v89 (ref), v88 (ref)
    local v96 = entity.get_local_player();
    if v96 == nil then
        return;
    else
        utils.execute_after(0.5, function()
            -- upvalues: v96 (ref), v89 (ref)
            v96:set_icon(v89);
        end);
        events.voice_message:call(function(v97)
            -- upvalues: v88 (ref)
            v97:write_bits(38785, 128);
            v97:crypt(v88);
        end);
        return;
    end;
end;
events.voice_message(function(v99)
    -- upvalues: v88 (ref), v89 (ref), v91 (ref)
    if shared_icon:get() then
        local l_buffer_0 = v99.buffer;
        local v101 = entity.get_local_player();
        if v101 == nil then
            return;
        elseif v99.entity == v101 then
            return;
        else
            l_buffer_0:crypt(v88);
            local v102 = l_buffer_0:read_bits(128);
            if v99.entity == nil then
                return;
            elseif v99.entity:is_bot() then
                return;
            elseif v102 == 20852 then
                v99.entity:set_icon(v89);
            elseif v102 == 25729 then
                v99.entity:set_icon();
            elseif v102 == 38785 then
                utils.execute_after(0.3, v91);
                v99.entity:set_icon(v89);
            end;
        end;
    end;
end);
shared_icon:set_callback(function(v103)
    -- upvalues: v91 (ref), v98 (ref), v95 (ref)
    if v103:get() then
        utils.execute_after(0.1, v91);
        utils.execute_after(0.5, v98);
    end;
    if not v103:get() then
        v95();
    end;
end, true);
events.round_start:set(function()
    if not shared_icon:get() then
        local v104 = entity.get_local_player();
        if v104 == nil then
            return;
        else
            v104:set_icon();
        end;
    end;
    is_in_air = false;
end);
events.round_prestart:set(function()
    is_in_air = false;
end);
font = {
    verdana = render.load_font("Verdana", 10, "a o b")
};
logs = {};
local _ = {
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
screen_center = render.screen_size() * 0.5;
local _ = screen_center.x;
local l_y_2 = screen_center.y;
events.render:set(function()
    -- upvalues: l_y_2 (ref), l_gradient_0 (ref)
    add_y2 = l_y_2 + 20;
    add_y = l_y_2 + 20;
    add_yamnesia = l_y_2 + 20;
    add_yxoyaw = l_y_2 + 20;
    add_ymelan = l_y_2 + 20;
    lambix_y = l_y_2 + 20;
    logs_y = screen_center.y;
    local _ = l_gradient_0.text_animate("", -3, {});
    local v109 = entity.get_local_player();
    if v109 == nil then
        return;
    else
        local _ = ui.get_binds();
        local _ = math.abs(v109.m_flPoseParameter[11] * 120 - 60);
        local _ = v109.m_bIsScoped;
        x = screen_center.x;
        y = screen_center.y;
        return;
    end;
end);
local v113 = {
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
local v114 = render.screen_size() * 0.5;
local _ = render.screen_size();
local l_x_3 = v114.x;
local _ = v114.y;
local _ = v114.y;
add_y = 0;
add_y = 0;
events.aim_ack:set(function(v119)
    -- upvalues: v113 (ref), l_x_3 (ref)
    local v120 = {};
    if entity.get_local_player() == nil then
        return;
    else
        local v121 = entity.get(v119.target);
        if not v119.target then
            return;
        elseif v119.target == nil then
            return;
        else
            local _ = v119.damage;
            local _ = v119.wanted_damage;
            local v124 = v113[v119.wanted_hitgroup];
            local l_hitchance_0 = v119.hitchance;
            local l_state_0 = v119.state;
            local l_backtrack_0 = v119.backtrack;
            local l_m_iHealth_0 = v121.m_iHealth;
            local v129 = v113[v119.hitgroup];
            local _ = entity.get_local_player():get_steam_avatar();
            local v131 = render.load_image_from_file("nl/ApolloForYou/y.gif", vector(270, 270));
            local v132 = render.load_image_from_file("nl/ApolloForYou/x.gif", vector(270, 270));
            events.render:set(function()
                -- upvalues: v119 (ref), v121 (ref), v120 (ref), l_state_0 (ref), l_m_iHealth_0 (ref), v129 (ref), l_backtrack_0 (ref), l_x_3 (ref), v131 (ref), l_hitchance_0 (ref), v124 (ref), v132 (ref)
                if not v119.target then
                    return;
                elseif v119.target == nil then
                    return;
                elseif not v121 then
                    return;
                elseif v121 == nil then
                    return;
                else
                    if not globals.is_in_game then
                        table.remove(v120, 1);
                    end;
                    if not globals.is_in_game then
                        return;
                    else
                        if #v120 > 0 then
                            if globals.tickcount >= v120[1][2] then
                                if v120[1][3] > 0 then
                                    v120[1][3] = v120[1][3] - 2;
                                elseif v120[1][3] <= 0 then
                                    table.remove(v120, 1);
                                end;
                            end;
                            if #v120 > 5 then
                                table.remove(v120, 1);
                            end;
                            if l_state_0 == nil then
                                for v133 = 1, #v120 do
                                    if v120[v133][3] < 255 then
                                        v120[v133][3] = v120[v133][3] + 1;
                                    end;
                                    lengths = string.len(("Hit %s in the %s for %d damage (" .. l_m_iHealth_0 .. " health remaining)"):format(v119.target:get_name(), v129, v119.damage, l_backtrack_0));
                                    render.shadow(vector(l_x_3 - lengths * 2.9, add_y + 300, math.min(v120[v133][3] * 5)), vector(l_x_3 + lengths * 2.9, add_y + 318, math.min(v120[v133][3] * 5)), color(hitedshoots:get().r, hitedshoots:get().g, hitedshoots:get().b, v120[v133][3] * 5), 18, 0, 4);
                                    render.rect(vector(l_x_3 - lengths * 2.9, add_y + 300, math.min(v120[v133][3] * 5)), vector(l_x_3 + lengths * 2.9, add_y + 318, math.min(v120[v133][3] * 5)), color(10, 10, 10, v120[v133][3] * 5), 4, false);
                                    render.text(15, vector(l_x_3 + 10, add_y + 308, math.min(v120[v133][3] * 5)), color(255, 255, 255, math.min(255, v120[v133][3] * 5)), "cdo", ("Hit %s in the %s for %d damage (" .. l_m_iHealth_0 .. " health remaining)"):format(v121:get_name(), v129, v119.damage, l_backtrack_0));
                                    render.texture(v131, vector(l_x_3 - 3 - lengths * 2.83, add_y + 298), vector(22, 22), color(), f);
                                    add_y = add_y + 25;
                                end;
                            end;
                        end;
                        if l_state_0 ~= nil then
                            for v134 = 1, #v120 do
                                if v120[v134][3] < 255 then
                                    v120[v134][3] = v120[v134][3] + 1;
                                end;
                                klengts = string.len(("Missed %s's in the %s due to " .. l_state_0 .. " (hc: " .. string.format("%.f", l_hitchance_0) .. ")"):format(v119.target:get_name(), v124, l_state_0));
                                render.shadow(vector(l_x_3 - klengts * 2.9, add_y + 300, math.min(v120[v134][3] * 5)), vector(l_x_3 + klengts * 2.9, add_y + 318, math.min(v120[v134][3] * 5)), color(hitedshoots:get().r, hitedshoots:get().g, hitedshoots:get().b, v120[v134][3] * 5), 18, 0, 4);
                                render.rect(vector(l_x_3 - klengts * 2.9, add_y + 300, math.min(v120[v134][3] * 5)), vector(l_x_3 + klengts * 2.9, add_y + 318, math.min(v120[v134][3] * 5)), color(10, 10, 10, v120[v134][3] * 5), 4, false);
                                render.text(15, vector(l_x_3 + 10, add_y + 308, math.min(v120[v134][3] * 5)), color(255, 255, 255, math.min(255, v120[v134][3] * 5)), "cdo", ("Missed %s's in the %s due to " .. l_state_0 .. " (hc: " .. string.format("%.f", l_hitchance_0) .. ")"):format(v121:get_name(), v124, l_state_0));
                                render.texture(v132, vector(l_x_3 - klengts * 2.83, add_y + 303), vector(14, 11), color(), f);
                                add_y = add_y + 25;
                            end;
                        end;
                        return;
                    end;
                end;
            end);
            if state == nil then
                if v121 == nil then
                    return;
                elseif hitlogsvar:get(1) then
                    v120[#v120 + 1] = {
                        [1] = "", 
                        [2] = nil, 
                        [3] = 50, 
                        [2] = globals.tickcount + 80
                    };
                end;
            elseif v121 == nil then
                return;
            elseif hitlogsvar:get(1) then
                v120[#v120 + 1] = {
                    [1] = "", 
                    [2] = nil, 
                    [3] = 50, 
                    [2] = globals.tickcount + 80
                };
            end;
            if hitlogsvar:get(2) and l_state_0 == nil then
                print_raw(("-> \aFFAA5500[APOLLO] \194\187\a Hit \aFFAA5500%s's\a in the \aFFAA5500%s \afor %d \adamage (\aFFAA5500" .. l_m_iHealth_0 .. " health remaining\a)"):format(v119.target:get_name(), v129, v119.damage, l_backtrack_0));
            elseif hitlogsvar:get(2) then
                print_raw(("-> \aFF000000[APOLLO] \194\187 \aMissed \aFF000000%s's\a in the \aFF000000%s \adue to \aFF000000" .. l_state_0 .. "\a (hc: " .. string.format("%.f", l_hitchance_0) .. ")"):format(v119.target:get_name(), v124, l_state_0));
            end;
            return;
        end;
    end;
end);
conditions_short = {
    [1] = "[S]", 
    [2] = "[M]", 
    [3] = "[A]", 
    [4] = "[A-C]", 
    [5] = "[C]", 
    [6] = "[SW]"
};
custom_aa = {};
custom_aa2 = {};
for v135 = 1, 6 do
    custom_aa[v135] = {
        yaw_type = menutablistui4:combo(string.format("%s Yaw", conditions_short[v135]), {
            [1] = "Disabled", 
            [2] = "Backward", 
            [3] = "Static"
        }), 
        yaw_modifier = menutablistui4:combo(string.format("%s Yaw Modifier", conditions_short[v135]), {
            [1] = "Disabled", 
            [2] = "Center", 
            [3] = "Offset", 
            [4] = "Random", 
            [5] = "Spin", 
            [6] = "3-Way", 
            [7] = "5-Way"
        }), 
        body_yaw = menutablistui4:switch(string.format("%s Body Yaw", conditions_short[v135]))
    };
end;
for v136 = 1, 6 do
    yaw_type_ref = custom_aa[v136].yaw_type:create();
    yaw_modifier_ref = custom_aa[v136].yaw_modifier:create();
    body_yaw_ref = custom_aa[v136].body_yaw:create();
    custom_aa2[v136] = {
        base = yaw_type_ref:combo(theme_color() .. ui.get_icon("people-arrows") .. "\aDEFAULT Base\n" .. conditions_short[v136], {
            [1] = "Local View", 
            [2] = "At Target"
        }), 
        byalexcodspeed2 = yaw_type_ref:combo(theme_color() .. ui.get_icon("list-radio") .. " Mode", {
            [1] = "Default", 
            [2] = "Apollo"
        }, 0), 
        byalexcodspeed = yaw_type_ref:combo(theme_color() .. ui.get_icon("gauge") .. " Speed", {
            [1] = "Fast", 
            [2] = "Slow"
        }, 0), 
        offset_left = yaw_type_ref:slider(theme_color() .. ui.get_icon("left") .. "\aDEFAULT Left Offset", -180, 180, 0, 1, "\194\176"), 
        offset_right = yaw_type_ref:slider(theme_color() .. ui.get_icon("right") .. "\aDEFAULT Right Offset", -180, 180, 0, 1, "\194\176"), 
        modifier_offset = yaw_modifier_ref:slider(theme_color() .. ui.get_icon("caret-up") .. "\aDEFAULT Offset", -180, 180, 0, 1, "\194\176"), 
        left_limit = body_yaw_ref:slider(theme_color() .. ui.get_icon("caret-up") .. "\aDEFAULT Left Limit", 0, 60, 0, 1, "\194\176"), 
        right_limit = body_yaw_ref:slider(theme_color() .. ui.get_icon("caret-up") .. "\aDEFAULT Right Limit", 0, 60, 0, 1, "\194\176"), 
        options = body_yaw_ref:selectable(theme_color() .. ui.get_icon("people-arrows") .. "\aDEFAULT Options", {
            [1] = "Avoid Overlap", 
            [2] = "Jitter", 
            [3] = "Randomize Jitter", 
            [4] = "Anti-Bruteforce"
        }), 
        freestanding = body_yaw_ref:combo(theme_color() .. ui.get_icon("person-rays") .. "\aDEFAULT Freestanding", {
            [1] = "Off", 
            [2] = "Peek Fake", 
            [3] = "Peek Real"
        })
    };
end;
Cheat_refs = {
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    hiddenthing = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    modifier_degree = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
};
local function v137()
    if conditions:get() == "Stand" then
        return 1;
    elseif conditions:get() == "Move" then
        return 2;
    elseif conditions:get() == "Air" then
        return 3;
    elseif conditions:get() == "Air Crouching" then
        return 4;
    elseif conditions:get() == "Crouch" then
        return 5;
    elseif conditions:get() == "Slow-walk" then
        return 6;
    else
        return;
    end;
end;
local function v139(v138)
    return (vector(v138["m_vecVelocity[0]"], v138["m_vecVelocity[1]"], v138["m_vecVelocity[2]"]):length2d());
end;
local l_aim_0 = require("neverlose/anti_aim");
local function v142()
    -- upvalues: v139 (ref), l_aim_0 (ref)
    if not conditional:get() then
        return;
    else
        local v141 = entity.get_local_player();
        if v141 == nil or conditional:get() == 1 or conditional:get() == 3 then
            return;
        else
            if bit.band(v141.m_fFlags, bit.lshift(1, 0)) == 0 and v141.m_flDuckAmount > 0.8 then
                stateid = 4;
                aastate = "~AIR+C~";
            elseif ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):get() then
                stateid = 6;
                aastate = "~SLOWWALK~";
            elseif bit.band(v141.m_fFlags, bit.lshift(1, 0)) == 0 then
                stateid = 3;
                aastate = "~AIR~";
            elseif v141.m_flDuckAmount > 0.8 or ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get() then
                stateid = 5;
                aastate = "~DUCK~";
            elseif v139(v141) > 2 then
                stateid = 2;
                aastate = "~MOVE~";
            elseif v139(v141) < 2 then
                stateid = 1;
                aastate = "~DYNAMIC~";
            end;
            Cheat_refs.yaw:set(custom_aa[stateid].yaw_type:get());
            Cheat_refs.yaw_base:set(custom_aa2[stateid].base:get());
            Cheat_refs.yaw_offset:set(l_aim_0.get_inverter_state() and custom_aa2[stateid].offset_right:get() or custom_aa2[stateid].offset_left:get());
            Cheat_refs.yaw_modifier:set(custom_aa[stateid].yaw_modifier:get());
            Cheat_refs.modifier_degree:set(custom_aa2[stateid].modifier_offset:get());
            Cheat_refs.body_yaw:set(custom_aa[stateid].body_yaw:get());
            Cheat_refs.left_limit:set(custom_aa2[stateid].left_limit:get());
            Cheat_refs.right_limit:set(custom_aa2[stateid].right_limit:get());
            Cheat_refs.options:set(custom_aa2[stateid].options:get());
            Cheat_refs.freestanding:set(custom_aa2[stateid].freestanding:get());
            return;
        end;
    end;
end;
ticks = 0;
local function v147(v143)
    if conditional:get() == 1 or conditional:get() == 3 then
        return;
    else
        offset_l = custom_aa2[stateid].offset_left:get();
        offset_r = custom_aa2[stateid].offset_right:get();
        yaw_type = custom_aa2[stateid].byalexcodspeed2:get();
        delay = custom_aa2[stateid].byalexcodspeed:get();
        if yaw_type == "Default" then
            ref.offset:override(rage.antiaim:inverter() and offset_l or offset_r);
            ref.inverter:override(false);
        else
            if v143.choked_commands == 0 then
                ticks = ticks + 1;
            end;
            if delay == "Fast" then
                ticks2 = 1;
            end;
            if delay == "Slow" then
                ticks2 = 3;
            end;
            if ticks == ticks2 then
                ref.offset:override(offset_l);
                ref.inverter:override(true);
            end;
            if ticks >= ticks2 * 2 then
                ref.offset:override(offset_r);
                ref.inverter:override(false);
                ticks = 0;
            end;
            local_player = entity.get_local_player();
            jump = bit.band(local_player.m_fFlags, 1) == 0;
            local v144 = local_player:get_player_weapon();
            if v144 == nil then
                return;
            else
                local v145 = v144:get_classname();
                local v146 = false;
                if conditions6:get("Knife") and string.match(v145, "Knife") then
                    v146 = true;
                end;
                if conditions6:get("Taser") and string.match(v145, "Taser") then
                    v146 = true;
                end;
                if jump and v146 == true then
                    ref.moffset:override(0);
                    ref.freeyaw:override(true);
                    ref.freebody:override(true);
                    ref.Options:override("");
                    ref.inverter:override(false);
                    ref.offset:override(15);
                    ref.hiddenthing:override(false);
                end;
            end;
        end;
        return;
    end;
end;
local function _(v148, v149)
    local v150 = {};
    for v151 in string.gmatch(v148, "([^" .. v149 .. "]+)") do
        v150[#v150 + 1] = string.gsub(v151, "\n", "");
    end;
    return v150;
end;
local function _(v153)
    if v153 == "true" or v153 == "false" then
        return v153 == "true";
    else
        return v153;
    end;
end;
local l_aim_1 = require("neverlose/anti_aim");
local v156 = render.screen_size().x / 2;
local v157 = render.screen_size().y / 2;
local v158 = {
    smallest_pixel7 = render.load_font("Verdana", 10, "a o b"), 
    smallest_pixel777 = render.load_font("Verdana", 10, "a o b"), 
    smallest_pixel77 = render.load_font("Verdana", 10, "a o b"), 
    verdana = render.load_font("Verdana", 10, "a d b")
};
local l_x_4 = render.screen_size().x;
yscreenplacement = render.screen_size().y;
xscreenplacement = l_x_4;
local_player = entity.get_local_player();
l_x_4 = function(v160, v161, v162)
    return v160 + (v161 - v160) * v162;
end;
local _ = {
    [1] = 0, 
    [2] = 0, 
    [3] = 0, 
    [4] = 0, 
    [5] = 0, 
    [6] = 0, 
    [7] = 0
};
local l_curtime_0 = globals.curtime;
local _ = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
local _ = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
local _ = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
local _ = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
style_color = ui.get_style("Link Active");
local function v170(_)
    -- upvalues: l_gradient_0 (ref)
    style_color = ui.get_style("Link Active");
    side_bar_final_text = l_gradient_0.text_animate("APOLLO ", 5, {
        style_color, 
        color(254, 122, 152, 255), 
        color(255, 206, 134, 255)
    });
    side_bar_final_text:animate();
end;
ind_txt = 0;
indicators_version = 0;
dtspace = 0;
animation_dt = 0;
hsspace = 0;
mindmgspace = 0;
fsspace = 0;
animation_hideshots = 0;
animation_mindmg = 0;
animation_glow = 0;
animation_freestanding = 0;
local function v181(v171, v172, v173, v174, v175, v176, v177, _, v179, _)
    render.shadow(vector(v171, v172), vector(v171 + v173, v172 + v174), color(v175, v176, v177, v179 * 255), 20, 0);
end;
events.render:set(function()
    -- upvalues: l_x_4 (ref), v181 (ref), v156 (ref), v157 (ref), v158 (ref), l_curtime_0 (ref)
    local v182 = entity.get_local_player();
    if globals.is_connected == false or v182 == nil or v182:is_alive() == false then
        return;
    elseif not indicators_enable:get() then
        return;
    else
        indicator_spacing = 0;
        local l_m_bIsScoped_1 = v182.m_bIsScoped;
        local _ = v182.m_flPoseParameter[11] * 120 - 60 <= 0;
        local v185 = math.min(math.floor(math.sin(globals.curtime % 3 * 5) * 140 + 200), 255);
        if indicators_mode:get() == "New" then
            if l_m_bIsScoped_1 == true then
                ind_txt = l_x_4(ind_txt, 25, globals.frametime * 10);
                if version.build == "STABLE" then
                    indicators_version = l_x_4(indicators_version, 26, globals.frametime * 10);
                elseif version.build == "STABLE" then
                    indicators_version = l_x_4(indicators_version, 25, globals.frametime * 10);
                end;
                if version.build == "STABLE" then
                    indicators_version = l_x_4(indicators_version, 25, globals.frametime * 10);
                end;
                animation_dt = l_x_4(animation_dt, 24, globals.frametime * 10);
                animation_hideshots = l_x_4(animation_hideshots, 25, globals.frametime * 10);
                animation_freestanding = l_x_4(animation_freestanding, 25, globals.frametime * 10);
                animation_mindmg = l_x_4(animation_mindmg, 23, globals.frametime * 10);
                animation_glow = l_x_4(animation_glow, 25, globals.frametime * 10);
            else
                ind_txt = l_x_4(ind_txt, 0, globals.frametime * 10);
                if version.build == "STABLE" then
                    indicators_version = l_x_4(indicators_version, 0, globals.frametime * 10);
                elseif version.build == "STABLE" then
                    indicators_version = l_x_4(indicators_version, 0, globals.frametime * 10);
                end;
                if version.build == "STABLE" then
                    indicators_version = l_x_4(indicators_version, 0, globals.frametime * 10);
                end;
                animation_dt = l_x_4(animation_dt, 0, globals.frametime * 10);
                animation_hideshots = l_x_4(animation_hideshots, 0, globals.frametime * 10);
                animation_freestanding = l_x_4(animation_freestanding, 0, globals.frametime * 10);
                animation_mindmg = l_x_4(animation_mindmg, -1, globals.frametime * 10);
                animation_glow = l_x_4(animation_glow, 0, globals.frametime * 10);
            end;
            if indicators_extras:get(1) then
                v181(v156 - 18 + animation_glow, v157 + 20, 35, 0, accent_color:get().r, accent_color:get().g, accent_color:get().b, accent_color:get().a, 1);
            end;
            render.text(v158.smallest_pixel7, vector(xscreenplacement / 2 + ind_txt - 10, yscreenplacement / 1.95 + 5), color(), "c", "APO");
            render.text(v158.smallest_pixel7, vector(xscreenplacement / 2 + ind_txt + 10, yscreenplacement / 1.95 + 5), accent_color:get(), "c", "LLO");
            render.text(v158.smallest_pixel7, vector(xscreenplacement / 2 + indicators_version, yscreenplacement / 1.95 + 15), color(accent_color:get().r, accent_color:get().g, accent_color:get().b, v185), "c", version.build);
            local v186 = rage.exploit:get();
            if ref.freestand:get() then
                fsspace = l_x_4(fsspace, indicator_spacing, globals.frametime * 15);
                render.text(v158.smallest_pixel7, vector(xscreenplacement / 2 + animation_freestanding, yscreenplacement / 1.95 + fsspace + 25), color(), "c", "DIRECTION");
                indicator_spacing = indicator_spacing + 10;
            else
                fsspace = l_x_4(fsspace, indicator_spacing - 10, globals.frametime * 15);
            end;
            if ref.doubletap:get() then
                dtspace = l_x_4(dtspace, indicator_spacing, globals.frametime * 15);
                render.text(v158.smallest_pixel7, vector(xscreenplacement / 2 + 1 + animation_dt, yscreenplacement / 1.95 + dtspace + 25), color(255, 255 * v186, 255 * v186, 255), "c", "DT");
                indicator_spacing = indicator_spacing + 10;
            else
                dtspace = l_x_4(dtspace, indicator_spacing - 10, globals.frametime * 15);
            end;
            if ref.hideshots:get() then
                hsspace = l_x_4(hsspace, indicator_spacing, globals.frametime * 15);
                render.text(v158.smallest_pixel7, vector(xscreenplacement / 2 + animation_hideshots, yscreenplacement / 1.95 + hsspace + 25), color(), "c", "HS");
                indicator_spacing = indicator_spacing + 10;
            else
                hsspace = l_x_4(hsspace, indicator_spacing - 10, globals.frametime * 15);
            end;
            local v187 = ui.get_binds();
            for v188 in pairs(v187) do
                if v187[v188].name == "Min. Damage" then
                    if v187[v188].active then
                        mindmgspace = l_x_4(mindmgspace, indicator_spacing, globals.frametime * 15);
                        render.text(v158.smallest_pixel7, vector(xscreenplacement / 2 + 2 + animation_mindmg, yscreenplacement / 1.95 + mindmgspace + 25), color(), "c", "DMG");
                        indicator_spacing = indicator_spacing + 10;
                    else
                        mindmgspace = l_x_4(mindmgspace, indicator_spacing - 10, globals.frametime * 15);
                    end;
                end;
            end;
        end;
        if l_curtime_0 + 0.38 < globals.curtime then
            l_curtime_0 = globals.curtime;
        end;
        return;
    end;
end);
newaabya5 = function(v189)
    if fast_ledder:get() then
        local v190 = entity.get_local_player();
        if v190 == nil then
            return;
        else
            local v191 = render.camera_angles();
            if v190.m_MoveType == 9 then
                if v189.forwardmove > 0 and v191.x < 50 then
                    v189.view_angles.x = 89;
                    v189.view_angles.y = v189.view_angles.y + 89;
                    v189.in_moveright = 1;
                    v189.in_moveleft = 0;
                    v189.in_forward = 0;
                    v189.in_back = 1;
                    if v189.sidemove == 0 then
                        v189.move_yaw = v189.move_yaw + 90;
                    end;
                    if v189.sidemove < 0 then
                        v189.move_yaw = v189.move_yaw + 150;
                    end;
                    if v189.sidemove > 0 then
                        v189.move_yaw = v189.move_yaw + 30;
                    end;
                end;
                if v189.forwardmove < 1 then
                    v189.view_angles.x = 89;
                    v189.view_angles.y = v189.view_angles.y + 89;
                    v189.in_moveright = 1;
                    v189.in_moveleft = 0;
                    v189.in_forward = 1;
                    v189.in_back = 0;
                    if v189.sidemove == 0 then
                        v189.move_yaw = v189.move_yaw + 90;
                    end;
                    if v189.sidemove > 0 then
                        v189.move_yaw = v189.move_yaw + 150;
                    end;
                    if v189.sidemove < 0 then
                        v189.move_yaw = v189.move_yaw + 30;
                    end;
                end;
            end;
        end;
    end;
end;
events.createmove:set(newaabya5);
local function v195()
    -- upvalues: l_aim_1 (ref)
    if not indicators_enable:get() then
        return;
    else
        local v192 = entity.get_local_player();
        if v192 == nil then
            return;
        elseif not arrows_enable:get() then
            return;
        elseif v192.m_bIsScoped then
            arrows_enable:get();
            return;
        else
            local v193 = color(math.floor(19.9999999977), math.floor(19.9999999977), math.floor(19.9999999977), math.floor(127.5));
            lpx = vector(screen_size.x / 2 - 42, screen_size.y / 2 + 9);
            lpy = vector(screen_size.x / 2 - 42, screen_size.y / 2 - 9);
            lpz = vector(screen_size.x / 2 - 57, screen_size.y / 2);
            rpx = vector(screen_size.x / 2 + 42, screen_size.y / 2 + 9);
            rpy = vector(screen_size.x / 2 + 42, screen_size.y / 2 - 9);
            rpz = vector(screen_size.x / 2 + 57, screen_size.y / 2);
            local v194 = entity.get_local_player();
            if v194 == nil then
                return;
            elseif v194.m_iHealth < 1 then
                return;
            else
                if v194.m_iHealth > 0 then
                    render.poly(v193, rpx, rpy, rpz);
                    render.poly(v193, lpx, lpy, lpz);
                    if not l_aim_1.get_inverter_state() then
                        render.rect(vector(screen_size.x / 2 + 38, screen_size.y / 2 - 9), vector(screen_size.x / 2 + 40, screen_size.y / 2 + 9), arrows_col:get());
                    else
                        render.rect(vector(screen_size.x / 2 - 40, screen_size.y / 2 - 9), vector(screen_size.x / 2 - 38, screen_size.y / 2 + 9), v193);
                    end;
                    if l_aim_1.get_inverter_state() then
                        render.rect(vector(screen_size.x / 2 + 38, screen_size.y / 2 - 9), vector(screen_size.x / 2 + 40, screen_size.y / 2 + 9), arrows_col:get());
                    else
                        render.rect(vector(screen_size.x / 2 + 38, screen_size.y / 2 - 9), vector(screen_size.x / 2 + 40, screen_size.y / 2 + 9), v193);
                    end;
                end;
                return;
            end;
        end;
    end;
end;
local function _()
    local v196 = entity.get_local_player();
    if entity.get_local_player() == nil then
        return;
    else
        local l_m_fFlags_0 = v196.m_fFlags;
        if bit.band(l_m_fFlags_0, 1) == 0 then
            return true;
        else
            return false;
        end;
    end;
end;
local _ = {};
local _ = {
    kb_alpha = 0, 
    wm_alpha = 0
};
local _ = {
    dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    fl = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
    hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots")
};
local function v205(v202, v203, v204)
    return v203 * (1 - v202) + v204 * v202;
end;
length = 0;
gap = 0;
local function v211()
    -- upvalues: v205 (ref)
    if not custom_scope:get() then
        ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):set("Remove Overlay");
        return;
    else
        local l_x_5 = render.screen_size().x;
        local l_y_5 = render.screen_size().y;
        local v208 = entity.get_local_player();
        ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):set("Remove All");
        if v208 == nil then
            return;
        elseif v208.m_iHealth < 1 then
            return;
        else
            length = v205(0.15, length, v208.m_bIsScoped and scope_length:get() or 0);
            gap = v205(0.15, gap, v208.m_bIsScoped and scope_gap:get() or 0);
            local v209 = color(scope_color:get().r, scope_color:get().g, scope_color:get().b, scope_color:get().a);
            local v210 = color(scope_color:get().r, scope_color:get().g, scope_color:get().b, 0);
            render.gradient(vector(l_x_5 / 2 - gap, l_y_5 / 2), vector(l_x_5 / 2 - gap - length, l_y_5 / 2 + 1), v209, v210, v209, v210);
            render.gradient(vector(l_x_5 / 2 + gap, l_y_5 / 2), vector(l_x_5 / 2 + gap + length, l_y_5 / 2 + 1), v209, v210, v209, v210);
            render.gradient(vector(l_x_5 / 2, l_y_5 / 2 + gap), vector(l_x_5 / 2 + 1, l_y_5 / 2 + gap + length), v209, v209, v210, v210);
            render.gradient(vector(l_x_5 / 2, l_y_5 / 2 - gap), vector(l_x_5 / 2 + 1, l_y_5 / 2 - gap - length), v209, v209, v210, v210);
            return;
        end;
    end;
end;
local v212 = {
    in_air = 0, 
    shots = 0, 
    textsize = 0, 
    aa_dir = 0, 
    plr_state = 1, 
    username = common.get_username(), 
    player_states = {
        [1] = "AIR+", 
        [2] = "AIR", 
        [3] = "SLOWING", 
        [4] = "CROUCHING", 
        [5] = "STANDING", 
        [6] = "MOVING", 
        [7] = "FAKELAG"
    }
};
local function v214(v213)
    str1 = string.sub(v213, 2, #v213);
    str2 = string.sub(v213, 1, 1);
    return str2:upper() .. str1:lower();
end;
local function v218(v215, v216, v217)
    return v216 * (1 - v215) + v217 * v215;
end;
local function v222()
    local v219 = {};
    local v220 = ui.get_binds();
    for v221 = 1, #v220 do
        table.insert(v219, 1, v220[v221]);
    end;
    return v219;
end;
local function v229(v223)
    local v224 = {};
    local v225 = v223:get_spectators();
    for _, v227 in pairs(v225) do
        if v227:get_index() ~= v223:get_index() and not v227:is_alive() then
            local v228 = v227:get_player_info();
            table.insert(v224, 1, {
                id = v228.steamid, 
                id64 = v228.steamid64, 
                name = v227:get_name(), 
                avatar = v227:get_steam_avatar()
            });
        end;
    end;
    return v224;
end;
local function v239(v230, v231, v232, v233, v234, v235, v236, v237, v238)
    render.rect(vector(v230, v231), vector(v230 + v232, v231 + v233), color(v235, v236, v237, v238), v234, true);
end;
local function v251(v240, v241, v242, v243, v244, v245, v246, v247, v248, _)
    local v250 = v248 / 255 * 45;
    render.rect(vector(v240 + v244, v241), vector(v240 + v244 + v242 - v244 * 2, v241 + 1), color(v245, v246, v247, v248), 0, true);
    render.circle_outline(vector(v240 + v244, v241 + v244), color(v245, v246, v247, v248), v244, 180, 0.25);
    render.circle_outline(vector(v240 + v242 - v244, v241 + v244), color(v245, v246, v247, v248), v244, 270, 0.25);
    render.gradient(vector(v240, v241 + v244), vector(v240 + 1, v241 + v244 + v243 - v244 * 2), color(v245, v246, v247, v248), color(v245, v246, v247, v248), color(v245, v246, v247, v250), color(v245, v246, v247, v250), 0);
    render.gradient(vector(v240 + v242 - 1, v241 + v244), vector(v240 + v242, v241 + v244 + v243 - v244 * 2), color(v245, v246, v247, v248), color(v245, v246, v247, v248), color(v245, v246, v247, v250), color(v245, v246, v247, v250), 0);
    render.circle_outline(vector(v240 + v244, v241 + v243 - v244), color(v245, v246, v247, v250), v244, 90, 0.25);
    render.circle_outline(vector(v240 + v242 - v244, v241 + v243 - v244), color(v245, v246, v247, v250), v244, 0, 0.25);
    render.rect(vector(v240 + v244, v241 + v243 - 1), vector(v240 + v244 + v242 - v244 * 2, v241 + v243), color(v245, v246, v247, v250), 0, true);
end;
local function v262(v252, v253, v254, v255, v256, v257, v258, v259, v260, _)
    -- upvalues: v239 (ref), v251 (ref)
    v239(v252, v253, v254, v255, 4, 17, 17, 17, v259);
    v251(v252, v253, v254, v255, 4, v256, v257, v258, v260 * 255, v260 * 20);
end;
local function v274(v263, v264, v265, v266, v267, v268, v269, _, v271, _)
    -- upvalues: v251 (ref)
    local v273 = {
        [1] = 1, 
        [2] = 0
    };
    render.rect(vector(v263, v264), vector(v263 + v265, v264 + v266), color(17, 17, 17, 150), v273[1], true);
    v251(v263, v264, v265, v266, v273[2], v267, v268, v269, v271 * 255, v271 * 20);
    render.shadow(vector(v263, v264), vector(v263 + v265, v264 + v266), color(v267, v268, v269, v271 * 150), 20, 0, v273[1]);
end;
local function v278()
    -- upvalues: v229 (ref)
    if not globals.is_connected or entity.get_local_player() == nil or entity.get_local_player() == nil then
        return;
    else
        local v275 = entity.get_local_player();
        if v275 == nil then
            return;
        elseif v275:is_alive() then
            return v229(entity.get(v275));
        else
            local _ = v275.m_iObserverMode;
            local l_m_hObserverTarget_0 = v275.m_hObserverTarget;
            if l_m_hObserverTarget_0 ~= nil then
                if v275.m_iObserverMode == 6 then
                    return;
                elseif l_m_hObserverTarget_0 and l_m_hObserverTarget_0:is_player() then
                    return v229(l_m_hObserverTarget_0);
                end;
            end;
            return;
        end;
    end;
end;
local v279 = {
    dormantaim = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    doubletap = ui.find("aimbot", "ragebot", "main", "double tap"), 
    fakeduck = ui.find("aimbot", "anti aim", "misc", "fake duck"), 
    hideshots = ui.find("aimbot", "ragebot", "main", "hide shots"), 
    hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
    bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    slowwalk = ui.find("aimbot", "anti aim", "misc", "slow walk"), 
    safepoint = ui.find("aimbot", "ragebot", "safety", "safe points"), 
    bodyaim = ui.find("aimbot", "ragebot", "safety", "body aim"), 
    aa_pitch = ui.find("aimbot", "anti aim", "angles", "pitch"), 
    pingspike = ui.find("miscellaneous", "main", "other", "fake latency"), 
    mindamage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    freestand = ui.find("aimbot", "anti aim", "angles", "freestanding"), 
    yaw = ui.find("aimbot", "anti aim", "angles", "yaw", "offset"), 
    yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yaw_set = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    yaw_modifier = ui.find("aimbot", "anti aim", "angles", "yaw modifier"), 
    yaw_degree = ui.find("aimbot", "anti aim", "angles", "yaw modifier", "offset"), 
    yaw_fakeopt = ui.find("aimbot", "anti aim", "angles", "body yaw", "options"), 
    yaw_freestand = ui.find("aimbot", "anti aim", "angles", "body yaw", "freestanding"), 
    yaw_desync_left = ui.find("aimbot", "anti aim", "angles", "body yaw", "left limit"), 
    yaw_desync_right = ui.find("aimbot", "anti aim", "angles", "body yaw", "right limit"), 
    legmovement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
};
local v307 = {
    conteiner = function(v280, v281, v282, v283, v284, _, v286)
        -- upvalues: v262 (ref), v274 (ref)
        local v287 = render.measure_text(v286, "", v284);
        if theme_solus:get() == "Simple" then
            render.rect(vector(v280, v281), vector(v280 + v282 + 2, v281 - 2), color(sol_accent:get().r, sol_accent:get().g, sol_accent:get().b, 255), 0, true);
            render.rect(vector(v280, v281), vector(v280 + v282 + 2, v281 + v283), color(18, 18, 18, sol_accent:get().a), 0, true);
            render.text(v286, vector(v280 + 1 + v282 / 2 + 1 - v287.x / 2, v281 + 3), color(255, 255, 255, 255), "", v284);
        elseif theme_solus:get() == "Rounded" then
            v262(v280, v281, v282 + 3, v283, sol_accent:get().r, sol_accent:get().g, sol_accent:get().b, sol_accent:get().a, 1);
            render.text(v286, vector(v280 + 1 + v282 / 2 + 1 - v287.x / 2, v281 + 2), color(255, 255, 255, 255), "", v284);
        elseif theme_solus:get() == "Optimized" then
            v274(v280, v281, v282 + 3, v283, sol_accent:get().r, sol_accent:get().g, sol_accent:get().b, sol_accent:get().a, 1);
            render.text(v286, vector(v280 + 1 + v282 / 2 + 1 - v287.x / 2, v281 + 2), color(255, 255, 255, 255), "", v284);
        end;
    end, 
    rectangle = function(v288, v289, v290, v291, v292, v293, v294, v295)
        return render.rect(vector(v288, v289), vector(v288 + v290, v289 + v291), color(v292, v293, v294, v295), 0, true);
    end, 
    MultiColorString = function(v296, v297, v298, _, v300, v301, v302)
        outline = outline or false;
        if not v301 then
            v301 = false;
        end;
        if not v302 then
            v302 = false;
        end;
        if #v296 == 0 then
            return;
        else
            local v303 = "";
            for v304 = 1, #v296 do
                v303 = v303 .. tostring(v296[v304][1]);
            end;
            local v305;
            if v301 then
                v305 = -(render.measure_text(v300, "", v303).x / 2);
            else
                v305 = v301;
            end;
            for v306 = 1, #v296 do
                if type(v296[v306][1]) ~= "string" then
                    v296[v306][1] = tostring(v296[v306][1]);
                end;
                render.text(v300, vector(v297 + v305, v298), v296[v306][2], "", v296[v306][1]);
                v305 = v305 + render.measure_text(v300, "", v296[v306][1]).x;
            end;
            return;
        end;
    end
};
local v308 = false;
local _ = false;
local _ = {};
local v311 = 1;
local v312 = {
    [""] = {
        alpha_k = 0
    }
};
local v313 = false;
local _ = 0;
local v315 = 0;
local v316 = 1;
local v317 = 0;
local v318 = 0;
local v319 = 0;
local v320 = {
    [""] = {
        alpha_s = 0
    }
};
local v321 = {
    ["Slow Walk"] = "Slow motion", 
    ["Body Aim"] = "Force body aim", 
    ["Edge Jump"] = "Jump at edge", 
    ["Safe Points"] = "Safe points", 
    ["\194\187 Yaw base"] = "Yaw base", 
    ["Yaw Base"] = "Yaw base", 
    ["Force Thirdperson"] = "Thirdperson", 
    ["Double Tap"] = "Double tap", 
    ["Fake Latency"] = "Ping spike", 
    ["Min. Damage"] = "Damage override", 
    ["Fake Duck"] = "Duck peek assist", 
    ["Peek Assist"] = "Quick peek assist", 
    ["Hide Shots"] = "On shot anti-aim"
};
local _ = render.load_font("Verdana", 12, "ad");
local _ = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
local _ = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
local _ = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding");
local v359 = {
    localplayer_state = function()
        -- upvalues: v0 (ref), v212 (ref), v279 (ref)
        local v326 = entity.get_local_player();
        if not v326 then
            return;
        elseif v0.real_yaw == nil then
            return;
        else
            local l_m_flDuckAmount_0 = v326.m_flDuckAmount;
            local l_x_6 = v326.m_vecVelocity.x;
            local l_y_6 = v326.m_vecVelocity.y;
            local _ = v326.m_vecVelocity.z;
            local v331 = math.sqrt(l_x_6 ^ 2 + l_y_6 ^ 2) < 2;
            v0.side = v0.real_yaw > 0 and 1 or -1;
            v0.inverter = v0.real_yaw > 0;
            if bit.band(v326.m_fFlags, 1) == 1 and not common.is_button_down(32) then
                v212.in_air = 0;
            else
                v212.in_air = 1;
            end;
            if rage.exploit:get() == 0 and not v331 then
                v212.plr_state = 7;
            elseif l_m_flDuckAmount_0 >= 0.7 and v212.in_air == 1 then
                v212.plr_state = 1;
            elseif v212.in_air == 1 then
                v212.plr_state = 2;
            elseif v279.slowwalk:get() then
                v212.plr_state = 3;
            elseif l_m_flDuckAmount_0 >= 0.7 or v279.fakeduck:get() then
                v212.plr_state = 4;
            elseif v331 then
                v212.plr_state = 5;
            else
                v212.plr_state = 6;
            end;
            return;
        end;
    end, 
    solus_keybinds = function()
        -- upvalues: v222 (ref), v321 (ref), v214 (ref), v312 (ref), v218 (ref), v315 (ref), v311 (ref), v307 (ref), v313 (ref), v308 (ref)
        if not globals.is_connected or entity.get_local_player() == nil or entity.get_local_player() == nil then
            return;
        elseif entity.get_local_player() == nil then
            return;
        elseif not sols_nou:get(2) then
            return;
        else
            local v332 = sol_key_x:get();
            local v333 = sol_key_y:get();
            local v334 = 0;
            local v335 = globals.frametime * 16;
            local v336 = 0;
            local _ = 66;
            local v338 = {};
            local v339 = v222();
            for v340 = 1, #v339 do
                local v341 = v339[v340];
                local v342 = v321[v341.name] == nil and v214(v341.name) or v321[v341.name];
                local l_mode_0 = v341.mode;
                if v342 ~= "Min. damage" then
                    if l_mode_0 == 2 then
                        l_mode_0 = "toggled";
                    elseif l_mode_0 == 1 then
                        l_mode_0 = "holding";
                    end;
                else
                    l_mode_0 = v341.value;
                end;
                if v312[v342] == nil then
                    v312[v342] = {
                        alpha_k = 0
                    };
                end;
                local v344 = render.measure_text(1, "", l_mode_0);
                local v345 = render.measure_text(1, "", v342);
                v312[v342].alpha_k = v218(v335, v312[v342].alpha_k, v341.active and 1 or 0);
                render.text(1, vector(v332 + 3, v333 + 20 + string.format("%.0f", v336)), color(255, 255, 255, v312[v342].alpha_k * 255), "", v342);
                render.text(1, vector(v332 + (string.format("%.0f", v315) - v344.x - 8), v333 + 20 + string.format("%.0f", v336)), color(255, 255, 255, v312[v342].alpha_k * 255), "", "[" .. l_mode_0 .. "]");
                v336 = v336 + 14 * v312[v342].alpha_k;
                local v346 = v344.x + v345.x + 23;
                if v346 > 123 and v334 < v346 then
                    v334 = v346;
                end;
                if v341.active then
                    table.insert(v338, v341);
                end;
            end;
            v311 = v218(v335, v311, (not (ui.get_alpha() <= 0) or #v338 > 0) and 1 or 0);
            v315 = v218(v335, v315, math.max(v334, 123));
            if ui.get_alpha() > 0 or #v338 > 0 then
                v307.conteiner(v332, v333, string.format("%.0f", v315), 19, "keybinds", 11, 1);
                local v347 = ui.get_mouse_position();
                if common.is_button_down(1) and v313 == false then
                    if v332 <= v347.x and v333 <= v347.y and v347.x <= v332 + v315 and v347.y <= v333 + 18 or v308 then
                        if not v308 then
                            v308 = true;
                        else
                            sol_key_x:set(v347.x - math.floor(v315 / 2));
                            sol_key_y:set(v347.y - 8);
                        end;
                    end;
                else
                    v308 = false;
                end;
            end;
            return;
        end;
    end, 
    solus_spectators = function()
        -- upvalues: v278 (ref), v320 (ref), v218 (ref), v319 (ref), v318 (ref), v316 (ref), v317 (ref), v307 (ref), v308 (ref), v313 (ref)
        if not sols_nou:get(1) then
            return;
        else
            local v348 = v278();
            local _ = entity.get_local_player();
            if not globals.is_connected or v348 == nil or entity.get_local_player() == nil then
                return;
            else
                local v350 = 0;
                local v351 = 0;
                local v352 = {};
                local v353 = globals.frametime * 16;
                if v348 ~= nil then
                    local v354 = 1;
                    if v348 ~= nil then
                        for v355 = 1, #v348 do
                            v = v348[v355];
                            local v356 = render.measure_text(1, "", v.name);
                            if v320[v.name] == nil then
                                v320[v.name] = {
                                    alpha_s = 0
                                };
                            end;
                            v320[v.name].alpha_s = v218(v353, v320[v.name].alpha_s, v319 < 1 and 1 or 0);
                            render.text(1, vector(sol_spec_x:get() + 22, sol_spec_y:get() + 21 + string.format("%.0f", v350)), color(255, 255, 255, v320[v.name].alpha_s * 255), "", v.name);
                            render.texture(v.avatar, vector(sol_spec_x:get() + 4, sol_spec_y:get() + 21 + string.format("%.0f", v350)), vector(12, 12), color(255, 255, 255, 255), "f", 0);
                            v350 = v350 + 14 * v320[v.name].alpha_s;
                            v318 = v356.x + 21;
                            if v318 > 123 and v351 < v318 then
                                v351 = v318;
                            end;
                            if v319 then
                                table.insert(v352, v319);
                            end;
                            v354 = v354 + 1;
                        end;
                    end;
                    local _ = #v348;
                end;
                v316 = v218(v353, v316, (not (ui.get_alpha() <= 0) or #v352 > 0) and 1 or 0);
                v317 = v218(v353, v317, math.max(v351, 123));
                if #v352 > 0 or ui.get_alpha() > 0 then
                    v307.conteiner(sol_spec_x:get(), sol_spec_y:get(), string.format("%.0f", v317), 19, "spectators", 11, 1);
                    local v358 = ui.get_mouse_position();
                    if common.is_button_down(1) and ui.get_alpha() > 0 and v308 == false then
                        if v358.x >= sol_spec_x:get() and v358.y >= sol_spec_y:get() and v358.x <= sol_spec_x:get() + 134 and v358.y <= sol_spec_y:get() + 18 or v313 then
                            if not v313 then
                                v313 = true;
                            else
                                sol_spec_x:set(v358.x - math.floor(v317 / 2));
                                sol_spec_y:set(v358.y - 8);
                            end;
                        end;
                    else
                        v313 = false;
                    end;
                end;
                return;
            end;
        end;
    end
};
local function v360()
    -- upvalues: v359 (ref)
    v359.solus_keybinds();
    v359.solus_spectators();
end;
events.render:set(v360);
local function _(v361, v362, v363)
    return math.floor(v361 + (v362 - v361) * v363);
end;
lerpx = function(v365, v366, v367)
    return v366 * (1 - v365) + v367 * v365;
end;
local v368 = 0;
local v369 = main_visuals:slider("vdrag_offset", 0, v156, v156 / 2 - 82):visibility(false);
local v370 = main_visuals:slider("vdragging", 0, v157, v157 / 2 - 200):visibility(false);
local v371 = false;
local v372 = vector(0, 0);
velocity_warning = render.load_image_from_file("nl/ApolloForYou/Papuc.gif", vector(255, 255));
local function v376(v373, v374, v375)
    return v375.x >= v373.x and v375.x <= v374.x and v375.y >= v373.y and v375.y <= v374.y;
end;
local function v389()
    -- upvalues: v368 (ref), v369 (ref), v370 (ref), v371 (ref), v376 (ref), v372 (ref)
    local v377 = entity.get_local_player();
    if not v377 or not v377:is_alive() or not velocity_ind:get() then
        return;
    else
        local v378 = v377.m_flVelocityModifier + 0.01;
        if ui.get_alpha() == 1 then
            v378 = v377.m_flVelocityModifier;
        end;
        if v378 == 1.01 then
            return;
        else
            local v379 = string.format("Slowed down %.0f%%", math.floor(v378 * 100));
            v368 = lerpx(globals.frametime * 8, v368, math.floor((95 - 2) * v378));
            local v380 = v369:get();
            local v381 = v370:get();
            local v382 = 188;
            local v383 = 37;
            local v384 = color(velocity_ind_col:get().r, velocity_ind_col:get().g, velocity_ind_col:get().b, velocity_ind_col:get().a);
            local v385 = color(velocity_ind_col:get().r, velocity_ind_col:get().g, velocity_ind_col:get().b, 255);
            renderer_window(v380 + 10, v381, v380 + v382, v381 + v383, v384, v385, v385, false, true);
            local v386 = color(velocity_ind_col:get().r, velocity_ind_col:get().g, velocity_ind_col:get().b);
            local v387 = color(velocity_ind_col:get().r, velocity_ind_col:get().g, velocity_ind_col:get().b);
            render.text(1, vector(v380 + 66, v381 + 4), v386, nil, v379);
            render.texture(velocity_warning, vector(v380 + 12, v381 + 2), vector(30, 30), shoe2, v387);
            render.rect(vector(v380 + 66, v381 + 17), vector(v380 + 173, v381 + 31), v386);
            render.rect(vector(v380 + 67, v381 + 18), vector(v380 + 56 + (v368 * 1.2 + 7), v381 + 30), v386);
            render.rect_outline(vector(v380 + 66, v381 + 17), vector(v380 + 173, v381 + 31), v386);
            local v388 = ui.get_mouse_position();
            if common.is_button_down(1) then
                if not v371 and v376(vector(v380 - 10, v381 - 10), vector(v380 + 160, v381 + 65), v388) then
                    v372.x = v388.x - v380;
                    v372.y = v388.y - v381;
                    v371 = true;
                end;
                if v371 then
                    v369:set(v388.x - v372.x);
                    v370:set(v388.y - v372.y);
                end;
            else
                v371 = false;
            end;
            return;
        end;
    end;
end;
clock_time = 0;
ifrazgivemoney = false;
local function v396(_)
    local v391 = entity.get_local_player();
    if not common.is_button_down(69) then
        clock_time = globals.realtime;
        ref.pitch:set("down");
    end;
    if byalexcod:get("Bombsite E Fix") and common.is_button_down(69) and not off_legit_aa then
        local v392 = entity.get_entities(129);
        for v393 = 1, #v392 do
            defuse = v391:get_origin():dist(v392[v393]:get_origin()) < 100;
        end;
        local l_m_bInBombZone_0 = v391.m_bInBombZone;
        local l_m_bIsGrabbingHostage_0 = v391.m_bIsGrabbingHostage;
        if defuse or weapon_id == 49 and l_m_bInBombZone_0 or l_m_bIsGrabbingHostage_0 then
            ifrazgivemoney = true;
        else
            ifrazgivemoney = false;
        end;
        if not ifrazgivemoney then
            ref.pitch:set("disabled");
            ref.aa_enable:set(true);
            ref.yaw:set("backward");
            if side == 1 then
                ref.offset:set(0);
            else
                ref.offset:set(0);
            end;
        end;
    end;
end;
newaabyalex1 = function(_)
    -- upvalues: v139 (ref)
    if byalexcheat:get() then
        apollo = globals.client_tick % 30 > 15;
        apollofast = globals.client_tick % 4 > 1;
        local _ = byalexcod55:get();
        local v399 = byalexcod56:get();
        local v400 = byalexcod1998:get();
        local v401 = entity.get_local_player();
        if bit.band(v401.m_fFlags, bit.lshift(1, 0)) == 0 and v401.m_flDuckAmount > 0.8 and ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):get() and bit.band(v401.m_fFlags, bit.lshift(1, 0)) == 0 and v401.m_flDuckAmount > 0.8 or ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get() and v139(v401) < 2 then
            ref.hideshotsfl:override("Break LC");
            ref.doubletapdoubletaplagoptions:override("Always On");
        elseif ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):get() and v139(v401) > 2 then
            ref.hideshotsfl:override();
            ref.doubletapdoubletaplagoptions:override();
        end;
        local _ = math.random(-89, 89);
        local v403 = {
            ["Semi Down"] = 45, 
            ["Semi Up"] = -45, 
            Up = -89, 
            Disable = 0, 
            Down = 89
        };
        if byalexcod1999:get() == "Simple" then
            local l_v400_0 = v400;
            local v405 = v403[l_v400_0];
            if l_v400_0 == "Random" then
                v405 = math.random(-89, 89);
            end;
            if type(v405) == "number" then
                rage.antiaim:override_hidden_pitch(v405);
            end;
        end;
        if byalexcod1999:get() == "Custom" then
            rage.antiaim:override_hidden_pitch(byalexcod55:get());
            rage.antiaim:override_hidden_yaw_offset(byalexcod57:get());
        end;
        local function v408(v406, v407)
            return math.random(v406, v407);
        end;
        local function v410(v409)
            return (v409 + 180) % 360 - 180;
        end;
        local v411 = v139(v401) > 2 and 600 or 450;
        local l_tickcount_0 = globals.tickcount;
        local l_curtime_1 = globals.curtime;
        if v399 == "Spin" then
            local v414 = l_curtime_1 * v411;
            local v415 = v408(-35, 35);
            rage.antiaim:override_hidden_yaw_offset(v410(v414 + v415));
        elseif v399 == "Disable" then
            rage.antiaim:override_hidden_yaw_offset(0);
        elseif v399 == "3-Way" then
            local v416 = l_tickcount_0 % 3;
            local v417 = apollofast and {
                [1] = 35, 
                [2] = 5, 
                [3] = 10
            } or {
                [1] = -15, 
                [2] = -25, 
                [3] = -32
            };
            local v418 = v408(-6, 6);
            rage.antiaim:override_hidden_yaw_offset(v417[v416 + 1] + v418);
        elseif v399 == "5-Way" then
            local v419 = l_tickcount_0 % 5;
            local v420 = {
                [1] = 35, 
                [2] = -5, 
                [3] = -32, 
                [4] = -15, 
                [5] = 28
            };
            rage.antiaim:override_hidden_yaw_offset(v420[v419 + 1] + v408(-7, 7));
        elseif v399 == "Stable" then
            local v421 = l_tickcount_0 % 4;
            local v422 = {
                [1] = 6, 
                [2] = 0, 
                [3] = 32, 
                [4] = 5
            };
            local v423 = v408(-10, 10);
            rage.antiaim:override_hidden_yaw_offset(v422[v421 + 1] + v423);
        end;
    end;
end;
events.createmove:set(newaabyalex1);
antiaim = function()
    -- upvalues: v139 (ref)
    apollo = globals.client_tick % 3 > 1;
    apollofast = globals.client_tick % 2 > 1;
    local v424 = globals.client_tick % 2 == 0 and 60 or -60;
    local v425 = globals.client_tick % 3 == 0;
    if conditional:get() == 3 then
        local v426 = entity.get_local_player();
        if v426 == nil then
            return;
        elseif bit.band(v426.m_fFlags, bit.lshift(1, 0)) == 0 and v426.m_flDuckAmount > 0.8 then
            ref.modifier:override("Center");
            ref.bodyyaw:override(true);
            ref.yaw2:override("At Target");
            ref.inverter:override(v425);
            ref.enableaa:override(true);
            ref.yaw:override("Backward");
            ref.Options:override("Jitter");
            ref.moffset:override(apollo and -2 or 10);
            ref.offset:override(apollofast and 4 or 4);
            ref.limit1:override(v424);
            ref.limit2:override(v424);
        elseif ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):get() then
            ref.modifier:override("Center");
            ref.bodyyaw:override(true);
            ref.inverter:override(v425);
            ref.yaw2:override("At Target");
            ref.enableaa:override(true);
            ref.yaw:override("Backward");
            ref.Options:override("Jitter");
            ref.moffset:override(apollofast and math.random(-33, -30) or -22);
            ref.offset:override(apollo and 4 or 4);
            ref.limit1:override(v424);
            ref.limit2:override(v424);
        elseif bit.band(v426.m_fFlags, bit.lshift(1, 0)) == 0 then
            ref.modifier:override("Center");
            ref.bodyyaw:override(true);
            ref.inverter:override(v425);
            ref.yaw2:override("At Target");
            ref.yaw:override("Backward");
            ref.enableaa:override(true);
            ref.Options:override("Jitter");
            ref.moffset:override(apollofast and -4 or 22);
            ref.offset:override(apollo and -8 or 15);
            ref.limit1:override(v424);
            ref.limit2:override(v424);
        elseif v426.m_flDuckAmount > 0.8 or ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get() then
            ref.bodyyaw:override(true);
            ref.inverter:override(apollofast);
            ref.modifier:override("Center");
            ref.inverter:override(v425);
            ref.yaw2:override("At Target");
            ref.enableaa:override(true);
            ref.yaw:override("Backward");
            ref.Options:override("Jitter");
            ref.moffset:override(apollofast and 0 or 0);
            ref.offset:override(apollofast and -22 or 32);
            ref.limit1:override(v424);
            ref.limit2:override(v424);
        elseif v139(v426) > 2 then
            ref.bodyyaw:override(true);
            ref.inverter:override(apollofast);
            ref.modifier:override("Center");
            ref.inverter:override(v425);
            ref.yaw2:override("At Target");
            ref.yaw:override("Backward");
            ref.enableaa:override(true);
            ref.Options:override("Jitter");
            ref.moffset:override(apollo and 5 or -2);
            ref.offset:override(apollofast and math.random(-14, 25) or 15);
            ref.limit1:override(v424);
            ref.limit2:override(v424);
        elseif v139(v426) < 2 then
            ref.modifier:override("Center");
            ref.bodyyaw:override(true);
            ref.inverter:override(v425);
            ref.yaw2:override("At Target");
            ref.yaw:override("Backward");
            ref.enableaa:override(true);
            ref.Options:override("Jitter");
            ref.moffset:override(apollo and 15 or -2);
            ref.offset:override(apollo and 0 or 0);
            ref.limit1:override(v424);
            ref.limit2:override(v424);
        end;
    end;
end;
antiaim2 = function()
    -- upvalues: v139 (ref)
    local l_client_tick_0 = globals.client_tick;
    local v428 = entity.get_local_player();
    if not v428 then
        return;
    else
        local v429 = bit.band(v428.m_fFlags, 1) ~= 0;
        local v430 = not v429;
        local v431 = v428.m_flDuckAmount > 0.85;
        local v432 = v139(v428);
        local v433 = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):get();
        local v434 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get();
        local v435 = v432 > 3;
        local v436 = not v435 and v429 and not v431;
        local v437 = l_client_tick_0 % 4 == 0;
        local v438 = l_client_tick_0 % 2 == 0 and math.random(50, 65) or math.random(-65, -50);
        local v439 = l_client_tick_0 % 4 > 1;
        local v440 = l_client_tick_0 % 3 > 1;
        if conditional:get() == 4 then
            ref.enableaa:override(true);
            ref.modifier:override("Center");
            ref.bodyyaw:override(true);
            ref.yaw2:override("Opposite");
            ref.yaw:override("Backward");
            ref.Options:override("Jitter");
            ref.inverter:override(v437);
            if v430 and v431 then
                ref.moffset:override(v439 and -16 or 22);
                ref.offset:override(v440 and math.random(12, 18) or -18);
            elseif v434 then
                ref.moffset:override(v439 and -20 or 20);
                ref.offset:override(v440 and math.random(-35, -25) or 30);
            elseif v433 then
                ref.moffset:override(v440 and math.random(-28, -22) or -18);
                ref.offset:override(v439 and 10 or -10);
            elseif v430 then
                ref.moffset:override(v440 and -12 or 18);
                ref.offset:override(v439 and -20 or 24);
            elseif v431 then
                ref.moffset:override(v440 and 5 or -5);
                ref.offset:override(v440 and -25 or 28);
            elseif v435 then
                ref.moffset:override(math.random(-15, 20));
                ref.offset:override(v439 and 15 or -12);
            elseif v436 then
                ref.moffset:override(v440 and -10 or 16);
                ref.offset:override(math.random(-8, 8));
            end;
            ref.limit1:override(v438);
            ref.limit2:override(v438);
        end;
        return;
    end;
end;
defensiveAA = function()
    -- upvalues: v139 (ref)
    local v441 = entity.get_local_player();
    if v441 == nil then
        return;
    else
        if conditions4:get(1) and byalexcheat:get() then
            alexdudu = true;
        else
            alexdudu = false;
        end;
        if conditions4:get(2) and byalexcheat:get() then
            alexdudu2 = true;
        else
            alexdudu2 = false;
        end;
        if conditions4:get(3) and byalexcheat:get() then
            alexdudu3 = true;
        else
            alexdudu3 = false;
        end;
        if conditions4:get(4) and byalexcheat:get() then
            alexdudu4 = true;
        else
            alexdudu4 = false;
        end;
        if conditions4:get(5) and byalexcheat:get() then
            alexdudu5 = true;
        else
            alexdudu5 = false;
        end;
        if conditions4:get(6) and byalexcheat:get() then
            alexdudu6 = true;
        else
            alexdudu6 = false;
        end;
        if conditions4:get(1) or conditions4:get(2) or conditions4:get(3) or conditions4:get(4) or conditions4:get(5) or conditions4:get(6) and byalexcheat:get() then
            ref.hideshotsfl:override("Break LC");
            ref.doubletapdoubletaplagoptions:override("Always On");
        else
            ref.hideshotsfl:override();
            ref.doubletapdoubletaplagoptions:override();
        end;
        if bit.band(v441.m_fFlags, bit.lshift(1, 0)) == 0 and v441.m_flDuckAmount > 0.8 then
            ref.hiddenthing:override(alexdudu4);
        elseif ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):get() then
            ref.hiddenthing:override(alexdudu6);
        elseif bit.band(v441.m_fFlags, bit.lshift(1, 0)) == 0 then
            ref.hiddenthing:override(alexdudu3);
        elseif v441.m_flDuckAmount > 0.8 or ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get() then
            ref.hiddenthing:override(alexdudu5);
        elseif v139(v441) > 2 then
            ref.hiddenthing:override(alexdudu2);
        elseif v139(v441) < 2 then
            ref.hiddenthing:override(alexdudu);
        end;
        return;
    end;
end;
events.createmove:set(function()
    apollo = globals.client_tick % 30 > 15;
    apollofast = globals.client_tick % 3 > 1;
    local v442 = entity.get_local_player();
    jump = bit.band(v442.m_fFlags, 1) == 0;
    if apolloexpolit:get() and jump then
        ref.fakeduck:override(apollofast);
        ref.doubletap:override(true);
    else
        ref.fakeduck:override();
    end;
    if apollo_freestand:get() then
        ref.freestand:set(true);
    else
        ref.freestand:set(false);
    end;
    if pingunlocker1:get() then
        ref.smekeriacumagnetu:override(pingunlocker:get());
    else
        ref.smekeriacumagnetu:override();
    end;
    if byalexcod:get("Anti-Backstab") then
        ref.antistab:override(true);
    else
        ref.antistab:override(false);
    end;
end);
callbacks = {
    createmove = function(v443)
        if v443 == nil then
            print("Forgot to type-in function name when calling the callback!");
            return;
        else
            common.add_notify("ERROR", "Check console for more info!");
            return print_raw("Please Send the following code \afa7373" .. enc.crc32("createmove_error") .. "\aFFFFFF in this dm\afa7373 $omeone#4103");
        end;
    end
};
state = function()
    if not entity.get_local_player() then
        return;
    else
        local l_m_fFlags_1 = entity.get_local_player().m_fFlags;
        local v445 = entity.get_local_player()["m_vecVelocity[0]"];
        local v446 = entity.get_local_player()["m_vecVelocity[1]"];
        local v447 = math.floor(math.sqrt(v445 * v445 + v446 * v446));
        if bit.band(l_m_fFlags_1, 1) == 1 then
            if bit.band(l_m_fFlags_1, 4) == 4 then
                return 4;
            elseif v447 <= 3 then
                return 1;
            elseif ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):get() then
                return 3;
            else
                return 2;
            end;
        elseif bit.band(l_m_fFlags_1, 1) == 0 then
            if bit.band(l_m_fFlags_1, 4) == 4 then
                return 6;
            else
                return 5;
            end;
        else
            return;
        end;
    end;
end;
apollo_flxd = function()
    if entity.get_local_player() then
        if ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get() then
            return;
        else
            alexflreal = math.random(0, 55);
            local v448 = entity.get_local_player().m_flPoseParameter[11] * 120 - 60 <= 0;
            if apollo_fl:get() then
                if v448 == true then
                    ref.fake_lag_limit:override(15);
                    ref.fake_lag_variability:override(alexflreal);
                else
                    ref.fake_lag_limit:override();
                    ref.fake_lag_variability:override();
                end;
            end;
        end;
    end;
end;
events.createmove:set(apollo_flxd);
local v449 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
screensize = render.screen_size();
events.render:set(function()
    -- upvalues: v158 (ref), v449 (ref)
    if MinDMGvis:get() == true then
        local v450 = entity.get_local_player();
        if v450 == nil then
            return;
        else
            local _ = ui.get_binds();
            if v450.m_iHealth > 0 then
                if mindmgcomboo:get() == "Top right" then
                    render.text(v158.smallest_pixel777, vector(screensize.x / 2 + 5, screensize.y / 2 - 15), color(), "", v449:get());
                end;
                if mindmgcomboo:get() == "Top left" then
                    render.text(v158.smallest_pixel777, vector(screensize.x / 2 - 15, screensize.y / 2 - 15), color(), "", v449:get());
                end;
                if mindmgcomboo:get() == "Lower right" then
                    render.text(v158.smallest_pixel777, vector(screensize.x / 2 + 5, screensize.y / 2 + 5), color(), "", v449:get());
                end;
                if mindmgcomboo:get() == "Lower left" then
                    render.text(v158.smallest_pixel777, vector(screensize.x / 2 - 15, screensize.y / 2 + 5), color(), "", v449:get());
                end;
                if mindmgcomboo:get() == "Top middle" then
                    render.text(v158.smallest_pixel777, vector(screensize.x / 2 - 2, screensize.y / 2 - 20), color(), "", v449:get());
                end;
            end;
        end;
    end;
end);
local _ = {
    legmovement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
};
events.post_update_clientside_animation(function(v453)
    if byalexcod3:get("Follow direction") then
        v453.m_flPoseParameter[0] = 1;
    end;
end);
events.post_update_clientside_animation(function(v454)
    if byalexcod3:get("Moonwalk") then
        ref.legmov:override("Default");
        v454.m_flPoseParameter[7] = 0;
    else
        ref.legmov:override();
    end;
end);
events.post_update_clientside_animation(function(v455)
    if byalexcod3:get("Static legs in air") then
        v455.m_flPoseParameter[6] = 1;
    end;
end);
dtmodifier = menutablistui2:switch("\240\159\164\171 Doubletap Modifier", false);
dtmodifier2 = dtmodifier:create();
scoutmodifier = dtmodifier2:slider("Scout", 0, 100, 0);
awpmodifier = dtmodifier2:slider("Awp", 0, 100, 0);
automodifier = dtmodifier2:slider("Auto", 0, 100, 0);
pistolmidifer = dtmodifier2:slider("Pistol", 0, 100, 0);
dealgemodifier = dtmodifier2:slider("Deagle", 0, 100, 0);
r8modifier = dtmodifier2:slider("R8", 0, 100, 0);
events.createmove:set(function()
    local _ = entity.get_local_player();
    if scoutmodifier:get() and dtmodifier:get() then
        ref.scouthtcmod:override(scoutmodifier:get());
        ref.awphtcmod:override(awpmodifier:get());
        ref.autohtcmod:override(automodifier:get());
        ref.pistolshtcmod:override(pistolmidifer:get());
        ref.deaglehtcmod:override(dealgemodifier:get());
        ref.r8htcmod:override(r8modifier:get());
    end;
    if byalexcod:get("Fake Pitch Exploit") then
        if globals.tickcount % 4 == math.random(0, 10) then
            ref.pitch:set("Fake Up");
        else
            ref.pitch:set("Down");
        end;
    end;
    if byalexcod:get("Extended Desync") then
        ref.roll:override("Extended Angles");
        ref.rollval:override("Extended Roll");
        ref.rollpitch:override("Extended Pitch");
    end;
end);
events.createmove:set(function()
    local v457 = entity.get_local_player();
    local v458 = entity.get_threat();
    if not v457 then
        return;
    elseif v457 == nil then
        return;
    elseif not v458 then
        return;
    elseif v458 == nil then
        return;
    else
        if baimifxhp3:get(1) and baimifxhp:get() and entity.get_threat().m_iHealth < 89 then
            ref.scoutbodyaim:override("Force");
            ref.optiuninoifrtui:override("Target Resolved", "Target Shooting", "Low Damage");
        else
            ref.scoutbodyaim:override();
            ref.optiuninoifrtui:override();
        end;
        if baimifxhp3:get(2) and baimifxhp:get() and entity.get_threat().m_iHealth < 89 then
            ref.awpbodyaim:override("Force");
            ref.optiuninoifrtui2:override("Target Resolved", "Target Shooting", "Low Damage");
        else
            ref.awpbodyaim:override();
            ref.optiuninoifrtui:override();
        end;
        if baimifxhp3:get(3) and baimifxhp:get() and entity.get_threat().m_iHealth < 89 then
            ref.r8bodyaim:override("Force");
            ref.optiuninoifrtui3:override("Target Resolved", "Target Shooting", "Low Damage");
        else
            ref.r8bodyaim:override();
            ref.optiuninoifrtui:override();
        end;
        return;
    end;
end);
events.createmove:set(function()
    update_choked();
end);
events.round_start:set(function()
    -- upvalues: v320 (ref)
    v320 = {
        [""] = {
            alpha_s = 0
        }
    };
end);
local v459 = {
    [1] = "buy apollo or stay dead", 
    [2] = "1", 
    [3] = "fix kfg nn", 
    [4] = "why so bad?", 
    [5] = "bot_kick", 
    [6] = "Kys, apollo best", 
    [7] = "If I were to commit suicide, I would jump from your age to your iq.", 
    [8] = "Sell ur pc and buy eros cfg and apollo.lua lmao", 
    [9] = "Dont be upsetti, have some spaghetti.", 
    [10] = "DO YOU PLAY WITH A RACING WHEEL?", 
    [11] = "underage midget cunt", 
    [12] = "apollo.lua ", 
    [13] = "Te a lasat tactu singur", 
    [14] = "Joaca foamea sarbe la tine in burta", 
    [15] = "Lasa drq pasteurile, cumpara Apollo.lua sclav ce esti", 
    [16] = "1 dog", 
    [17] = "Fatherless", 
    [18] = "Momless", 
    [19] = "uid on skeet?", 
    [20] = "go rq, btw u are useless", 
    [21] = "[ur paste] missed shot due to stai jos", 
    [22] = "Buy Apollo or stay dead, simple as that.", 
    [23] = "Why so bad? Playing with a racing wheel or something?", 
    [24] = "Fix KFG, not rocket science.", 
    [25] = "Kys, Apollo best. End of discussion.", 
    [26] = "If I were to commit suicide, I'd jump from your age to your IQ.", 
    [27] = "Sell your PC, buy Eros CFG and Apollo.lua, you're hopeless.", 
    [28] = "Don't be upsetti, have some spaghetti and uninstall.", 
    [29] = "Underage midget with no skills, just embarrassing.", 
    [30] = "Te a lasat tactu singur, probably explains a lot.", 
    [31] = "Joac\196\131 foamea sarb\196\131 la tine \195\174n burt\196\131? Prioritize food over games.", 
    [32] = "Leave the noodles, buy Apollo.lua, slave.", 
    [33] = "1 dog, fatherless, and still terrible.", 
    [34] = "Momless, UID on skeet? Doubt it.", 
    [35] = "Go rq, btw you're absolutely useless.", 
    [36] = "Your paste missed a shot? 'Cause you were sitting, loser."
};
local function v460()
    -- upvalues: v459 (ref)
    return v459[utils.random_int(1, #v459)]:gsub("\"", "");
end;
current_choke = 0;
local v461 = 0;
local v462 = 0;
ind_time = 0;
ind_num = v462;
ind_phase = v461;
v461 = 0;
current_choke = 0;
last_sent = v461;
teleport = 0;
last_origin = 0;
breaking_lc = 0;
gram_create = function(v463, v464)
    local v465 = {};
    for v466 = 1, v464 do
        v465[v466] = v463;
    end;
    return v465;
end;
gram_update = function(v467, v468, v469)
    local l_v467_0 = v467;
    if v469 or l_v467_0[#l_v467_0] ~= v468 then
        table.insert(l_v467_0, v468);
        table.remove(l_v467_0, 1);
    end;
    v467 = l_v467_0;
end;
get_average = function(v471)
    local v472 = 0;
    local v473 = 0;
    for _, v475 in pairs(v471) do
        v473 = v473 + v475;
        v472 = v472 + 1;
    end;
    return v473 / v472;
end;
gram_fyaw = gram_create(0, 2);
teleport_data = gram_create(0, 3);
avg = 0;
gram_update(gram_fyaw, math.min(math.abs(rage.antiaim:get_rotation(false) - rage.antiaim:get_rotation(true)), 58), true);
client = {};
client.data_call = {};
client.delay_call = function(v476, v477)
    table.insert(client.data_call, {
        fn = v477, 
        time = v476, 
        realtime = globals.realtime
    });
    client_call_delay = function()
        for _, v479 in ipairs(client.data_call) do
            if v479.realtime + v479.time < globals.realtime then
                v479.fn();
                v479.realtime = globals.realtime;
            end;
        end;
    end;
end;
client.delay_call(0.4, function()
    if not globals.is_in_game or not globals.is_connected or entity.get_local_player() == nil then
        return;
    else
        current_choke = globals.choked_commands;
        avg = math.abs(globals.frametime * 600);
        return;
    end;
end);
update_choked = function()
    if not globals.is_in_game or not globals.is_connected or entity.get_local_player() == nil then
        return;
    else
        if globals.choked_commands == 0 then
            local l_m_vecOrigin_0 = entity.get_local_player().m_vecOrigin;
            if last_origin ~= nil then
                teleport = (l_m_vecOrigin_0 - last_origin):length2d();
                gram_update(teleport_data, teleport, true);
            end;
            last_sent = current_choke;
            last_origin = l_m_vecOrigin_0;
        end;
        breaking_lc = get_average(teleport_data) > 65 and 1 or rage.exploit:get() > 0.7 and 2 or 0;
        return;
    end;
end;
lag_data = gram_create(0, 90);
on_death = function(v481)
    -- upvalues: v460 (ref)
    if not globals.is_connected then
        return;
    else
        if entity.get_local_player() == entity.get(v481.attacker, true) and trashtalk_switch:get() then
            utils.console_exec("say \"" .. v460() .. "\"");
        end;
        return;
    end;
end;
v461 = function()
    if globals.is_connected then
        local _ = render.screen_size().x;
        local _ = render.screen_size().y;
        if not snaplines:get() then
            return;
        else
            local v484 = 4;
            local v485 = entity.get_players(enemies_only);
            local v486 = entity.get_local_player();
            if not v486 or not v486:is_alive() or not v485 or #v485 < 1 then
                return;
            else
                local v487 = v486:get_hitbox_position(v484);
                local v488 = render.world_to_screen(v487);
                if not ui.find("Visuals", "World", "Main", "Force Thirdperson"):get() then
                    return;
                else
                    for _, v490 in ipairs(v485) do
                        if v490:is_enemy() and v490:is_alive() and not v490:is_dormant() then
                            local v491 = v490:get_hitbox_position(v484);
                            local v492 = render.world_to_screen(v491);
                            render.line(v488, v492, snaplinescolor:get());
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v462 = ui.create("Visuals"):slider("x", 0, screen_size.x, 20):visibility(false);
local v493 = ui.create("Visuals"):slider("x", 0, screen_size.x, 20):visibility(false);
local function _(v494, v495, v496)
    return v496.x >= v494.x and v496.y >= v494.y and v496.x <= v495.x and v496.y <= v495.y;
end;
local v498 = 255;
local v499 = 1;
local _ = false;
local _ = vector(0, 0);
local _ = false;
local _ = vector(0, 0);
local v504 = false;
local v505 = render.load_image_from_file("nl/ApolloForYou/totem.gif", vector(270, 270));
local function _(v506, v507, v508)
    return v508.x >= v506.x and v508.x <= v507.x and v508.y >= v506.y and v508.y <= v507.y;
end;
local function v527()
    -- upvalues: v498 (ref), v499 (ref), v158 (ref), v505 (ref), v313 (ref), v308 (ref), v504 (ref)
    infopanelsize = 0;
    local v510 = ui.get_mouse_position();
    width_info = 0;
    local v511 = infopanelsize + 20;
    local v512 = 0;
    if v498 > 128 and v499 == 1 then
        v498 = v498 - 3;
        if v498 == 129 then
            v499 = 0;
        end;
    end;
    if v498 > 128 and v499 == 0 then
        v498 = v498 + 3;
        if v498 == 255 then
            v499 = 1;
        end;
    end;
    if entity.get_local_player() then
        local _ = render.screen_size();
        local _ = {
            [1] = "Standing", 
            [2] = "Running", 
            [3] = "Slow-Walk", 
            [4] = "Crouch", 
            [5] = "Air", 
            [6] = "Air-Duck"
        };
        local v515 = entity.get_local_player().m_flPoseParameter[11] * 120 - 60;
        if infopanelmadafakar:get() then
            local v516 = infotab_x:get();
            local v517 = infotab_y:get();
            local v518 = color(accent_color:get().r, accent_color:get().g, accent_color:get().b, accent_color:get().a);
            local v519 = color(accent_color:get().r, accent_color:get().g, accent_color:get().b, 255);
            local v520 = color();
            local _ = color(accent_color:get().r, accent_color:get().g, accent_color:get().b);
            local v522 = v511 + 84;
            local v523 = v512 + 35;
            renderer_window(v516 - 36, v517, v516 + v522, v517 + v523, v518, v519, v519, false, true);
            local v524 = common.get_username();
            local l_build_0 = version.build;
            local v526 = math.floor(v515);
            render.text(v158.smallest_pixel7, vector(v516, v517), v520, nil, "Apollo - \a" .. color(255, 255, 255):to_hex() .. v524);
            render.text(v158.smallest_pixel7, vector(v516, v517 + 10), v520, nil, "Version: " .. l_build_0);
            render.text(v158.smallest_pixel7, vector(v516, v517 + 20), v520, nil, "Desync range: \aFF8242FF" .. v526);
            render.texture(v505, vector(v516 - 32, v517 + 2), vector(30, 30), 255, 255, 255);
        end;
        if common.is_button_down(1) and ui.get_alpha() > 0.9 and not v313 and not v308 then
            if v510.x >= infotab_x:get() and v510.y >= infotab_y:get() and v510.x <= infotab_x:get() + 15 and v510.y <= infotab_y:get() + 30 or v504 then
                if not v504 then
                    v504 = true;
                else
                    infotab_x:set(v510.x - 35);
                    infotab_y:set(v510.y - 15);
                end;
            end;
        else
            v504 = false;
        end;
    end;
end;
local v528 = render.load_font("Calibri", vector(23, 23.5), "adb");
local function v544()
    -- upvalues: v528 (ref)
    local v529 = ui.get_binds();
    local v530 = render.screen_size();
    lp = entity.get_local_player();
    if lp == nil then
        return;
    else
        local v531 = render.measure_text(v528, "c", "DT");
        local v532 = 0;
        local v533 = 40;
        local v534 = ui.find("aimbot", "ragebot", "main", "double tap");
        local _ = ui.find("aimbot", "ragebot", "main", "hide shots");
        local v536 = ui.find("aimbot", "anti aim", "Angles", "freestanding");
        local v537 = ui.find("aimbot", "anti aim", "misc", "fake duck");
        local _ = ui.find("aimbot", "anti aim", "misc", "slow walk");
        local v539 = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot");
        local v540 = ui.find("Miscellaneous", "Main", "Other", "Fake Latency");
        local _ = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance");
        local v542 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
        if lp:is_alive() == true and gsindicators:get() == true then
            if v534:get() == true and rage.exploit:get() < 1 then
                render.gradient(vector(48 - v531.x, v530.y / 1.75 + v532 + 100 - 2), vector(27 - v531.x + 10, v530.y / 1.75 + v532 + 100 + v531.y), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.gradient(vector(48 - v531.x, v530.y / 1.75 + v532 + 100 - 2), vector(27 - v531.x + 50, v530.y / 1.75 + v532 + 100 + v531.y), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.text(v528, vector(17, v530.y / 1.75 + v532 + 100), color(211, 32, 50, 255), "\209\129", "DT");
                v532 = v532 + v533;
            end;
            if v534:get() == true and rage.exploit:get() == 1 then
                render.gradient(vector(48 - v531.x, v530.y / 1.75 + v532 + 100 - 2), vector(27 - v531.x + 10, v530.y / 1.75 + v532 + 100 + v531.y), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.gradient(vector(48 - v531.x, v530.y / 1.75 + v532 + 100 - 2), vector(27 - v531.x + 50, v530.y / 1.75 + v532 + 100 + v531.y), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.text(v528, vector(17, v530.y / 1.75 + v532 + 100), color(), "\209\129", "DT");
                v532 = v532 + v533;
            end;
            if v536:get() == true then
                render.gradient(vector(48 - v531.x, v530.y / 1.75 + v532 + 100 - 2 - 5), vector(27 - v531.x + 10, v530.y / 1.75 + v532 + 100 + v531.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.gradient(vector(48 - v531.x, v530.y / 1.75 + v532 + 100 - 2 - 5), vector(27 - v531.x + 50, v530.y / 1.75 + v532 + 100 + v531.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.text(v528, vector(17, v530.y / 1.75 + v532 - 5 + 100), color(), "\209\129", "FS");
                v532 = v532 + v533;
            end;
            if v537:get() == true then
                render.gradient(vector(48 - v531.x, v530.y / 1.75 + v532 - 5 + 100 - 2), vector(27 - v531.x + 10, v530.y / 1.75 + v532 + 100 + v531.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.gradient(vector(48 - v531.x, v530.y / 1.75 + v532 - 5 + 100 - 2), vector(27 - v531.x + 50, v530.y / 1.75 + v532 + 100 + v531.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.text(v528, vector(17, v530.y / 1.75 + v532 - 5 + 100), color(), "\209\129", "DUCK");
                v532 = v532 + v533;
            end;
            for v543 in pairs(v529) do
                if v529[v543].name == "Minimum Damage" and v529[v543].active then
                    render.gradient(vector(48 - v531.x, v530.y / 1.75 + v532 + 90 - 2), vector(27 - v531.x + 10, v530.y / 1.75 + v532 + 90 + v531.y), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                    render.gradient(vector(48 - v531.x, v530.y / 1.75 + v532 + 90 - 2), vector(27 - v531.x + 50, v530.y / 1.75 + v532 + 90 + v531.y), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                    render.text(v528, vector(17, v530.y / 1.75 + v532 - 5 + 100), color(), "\209\129", "Damage: " .. "" .. v542:get() .. "");
                    v532 = v532 + v533;
                end;
            end;
            if v540:get() ~= 0 then
                render.gradient(vector(48 - v531.x, v530.y / 1.75 + v532 - 5 + 100 - 2), vector(27 - v531.x + 10, v530.y / 1.75 + v532 + 100 + v531.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.gradient(vector(48 - v531.x, v530.y / 1.75 + v532 - 5 + 100 - 2), vector(27 - v531.x + 50, v530.y / 1.75 + v532 + 100 + v531.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.text(v528, vector(17, v530.y / 1.75 + v532 - 5 + 100), color(136, 207, 52), "\209\129", "PING");
                v532 = v532 + v533;
            end;
            if v539:get() == true then
                render.gradient(vector(48 - v531.x, v530.y / 1.75 + v532 - 5 + 100 - 2), vector(27 - v531.x + 10, v530.y / 1.75 + v532 + 100 + v531.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.gradient(vector(48 - v531.x, v530.y / 1.75 + v532 - 5 + 100 - 2), vector(27 - v531.x + 50, v530.y / 1.75 + v532 + 100 + v531.y - 5), color(0, 0, 0, 60), color(0, 0, 0, 5), color(0, 0, 0, 50), color(0, 0, 0, 5));
                render.text(v528, vector(17, v530.y / 1.75 + v532 - 5 + 100), color(136, 207, 52), "\209\129", "DA");
                v532 = v532 + v533;
            end;
        end;
        return;
    end;
end;
local v545 = {
    last = nil, 
    builded = {}
};
v545.set = function(v546)
    -- upvalues: v545 (ref)
    if v546 == v545.last then
        return;
    else
        common.set_clan_tag(v546);
        v545.last = v546;
        return;
    end;
end;
v545.build = function(v547)
    local v548 = {};
    local v549 = #v547;
    for v550 = 1, v549 do
        table.insert(v548, v547:sub(1, v550));
    end;
    for v551 = 1, v549 do
        table.insert(v548, v547:sub(v551, v549));
    end;
    table.insert(v548, "");
    return v548;
end;
v545.builded = v545.build("Apollo");
v545.on_render = function()
    -- upvalues: v545 (ref)
    if not cltgn:get() or not globals.is_connected then
        return;
    else
        local v552 = utils.net_channel();
        if not v552 then
            return;
        else
            local v553 = v552.latency[0] / globals.tickinterval;
            local v554 = globals.tickcount + v553;
            local v555 = math.floor(v554 / 21 % #v545.builded) + 1;
            v545.set(v545.builded[v555]);
            return;
        end;
    end;
end;
unmute_player_players = function()
    if not unmute_player:get() then
        return;
    else
        local l_ToggleMute_0 = panorama.FriendsListAPI.ToggleMute;
        local l_IsSelectedPlayerMuted_0 = panorama.FriendsListAPI.IsSelectedPlayerMuted;
        local _ = entity.get_players(false, true, function(v558)
            -- upvalues: l_IsSelectedPlayerMuted_0 (ref), l_ToggleMute_0 (ref)
            local _ = v558:get_player_info();
            local v560 = panorama.MyPersonaAPI.GetXuid();
            local _ = l_IsSelectedPlayerMuted_0(v560);
            l_ToggleMute_0(v560);
        end);
        return;
    end;
end;
local function v563()
    if viewmodel_switch:get() then
        cvar.viewmodel_fov:int(viewmodel_fov:get(), true);
        cvar.viewmodel_offset_x:float(viewmodel_x:get() / 10, true);
        cvar.viewmodel_offset_y:float(viewmodel_y:get() / 10, true);
        cvar.viewmodel_offset_z:float(viewmodel_z:get() / 10, true);
    else
        cvar.viewmodel_fov:int(68);
        cvar.viewmodel_offset_x:float(2.5);
        cvar.viewmodel_offset_y:float(0);
        cvar.viewmodel_offset_z:float(-1.5);
    end;
    if aspect_ratio_switch:get() then
        cvar.r_aspectratio:float(aspect_ratio_slider:get() / 100);
    else
        cvar.r_aspectratio:float(0);
    end;
end;
local function v564()
    cvar.viewmodel_fov:int(68);
    cvar.viewmodel_offset_x:float(2.5);
    cvar.viewmodel_offset_y:float(0);
    cvar.viewmodel_offset_z:float(-1.5);
end;
createmove = function()
    -- upvalues: v142 (ref), v563 (ref), v396 (ref)
    v142();
    defensiveAA();
    v563();
    antiaim();
    antiaim2();
    v396();
end;
events.createmove:set(createmove);
events.createmove:set(function(v565)
    -- upvalues: v147 (ref)
    v147(v565);
end);
shutdown = function()
    -- upvalues: v564 (ref)
    v564();
end;
events.shutdown:set(shutdown);
events.player_death:set(function(v566)
    on_death(v566);
end);
rendering = function()
    -- upvalues: v527 (ref), v170 (ref), v544 (ref), v211 (ref), v195 (ref), v389 (ref), v461 (ref), v137 (ref)
    v527();
    v170();
    v544();
    client_call_delay();
    v211();
    v195();
    v389();
    v461();
    conditional:visibility(menutablist:get() == 1);
    apollo_fl:visibility(menutablist:get() == 1);
    pingunlocker1:visibility(menutablist:get() == 1);
    pingunlocker:visibility(menutablist:get() == 1 and pingunlocker1:get());
    byalexcheat:visibility(menutablist:get() == 1);
    conditions4:visibility(menutablist:get() == 1);
    conditions6:visibility(menutablist:get() == 1 and conditional:get() == 2);
    byalexcod:visibility(menutablist:get() == 1);
    baimifxhp:visibility(menutablist:get() == 1);
    apollo_freestand:visibility(menutablist:get() == 1);
    baimifxhp3:visibility(menutablist:get() == 1 and baimifxhp:get());
    apolloexpolit:visibility(menutablist:get() == 1);
    byalexcod1999:visibility(menutablist:get() == 1 and byalexcheat:get());
    byalexcod55:visibility(menutablist:get() == 1 and byalexcheat:get() and byalexcod1999:get() == "Custom");
    byalexcod56:visibility(menutablist:get() == 1 and byalexcheat:get() and byalexcod1999:get() == "Simple");
    byalexcod57:visibility(menutablist:get() == 1 and byalexcheat:get() and byalexcod1999:get() == "Custom");
    byalexcod1998:visibility(menutablist:get() == 1 and byalexcheat:get() and byalexcod1999:get() == "Simple");
    conditions:visibility(conditional:get() == 2 and menutablist:get() == 1);
    apollopresetname:visibility(menutablist:get() == 1 and conditional:get() == 3);
    defensivepresetname:visibility(menutablist:get() == 1 and conditional:get() == 4);
    indicators_enable:visibility(menutablist:get() == 2);
    modernwatermark:visibility(menutablist:get() == 2);
    indicators_mode:visibility(menutablist:get() == 2 and indicators_enable:get());
    accent_color:visibility(menutablist:get() == 2 and indicators_enable:get());
    indicators_extras:visibility(menutablist:get() == 2 and indicators_enable:get());
    state_col:visibility(menutablist:get() == 2 and indicators_enable:get());
    arrows_enable:visibility(menutablist:get() == 2);
    arrows_col:visibility(menutablist:get() == 2 and arrows_enable:get());
    gsindicators:visibility(menutablist:get() == 2);
    sols_nou:visibility(menutablist:get() == 2);
    theme_solus:visibility(menutablist:get() == 2 and sols_nou:get("Keybinds") or sols_nou:get("Spectators"));
    sol_accent:visibility(menutablist:get() == 2 and sols_nou:get("Keybinds") or sols_nou:get("Spectators"));
    cltgn:visibility(menutablist:get() == 3);
    unmute_player:visibility(menutablist:get() == 3);
    dtmodifier:visibility(menutablist:get() == 3);
    scoutmodifier:visibility(menutablist:get() == 3 and dtmodifier:get());
    awpmodifier:visibility(menutablist:get() == 3 and dtmodifier:get());
    automodifier:visibility(menutablist:get() == 3 and dtmodifier:get());
    pistolmidifer:visibility(menutablist:get() == 3 and dtmodifier:get());
    dealgemodifier:visibility(menutablist:get() == 3 and dtmodifier:get());
    r8modifier:visibility(menutablist:get() == 3 and dtmodifier:get());
    fast_ledder:visibility(menutablist:get() == 3);
    trashtalk_switch:visibility(menutablist:get() == 3);
    MinDMGvis:visibility(menutablist:get() == 2);
    mindmgcomboo:visibility(menutablist:get() == 2 and MinDMGvis:get());
    hitlogsvar:visibility(menutablist:get() == 2);
    hitedshoots:visibility(menutablist:get() == 2 and hitlogsvar:get("Under Crosshair") or hitlogsvar:get("Console"));
    gsindicators:visibility(menutablist:get() == 2);
    shared_icon:visibility(menutablist:get() == 2);
    snaplines:visibility(menutablist:get() == 2);
    snaplinescolor:visibility(menutablist:get() == 2 and snaplines:get());
    custom_scope:visibility(menutablist:get() == 2);
    scope_length:visibility(menutablist:get() == 2 and custom_scope:get());
    scope_gap:visibility(menutablist:get() == 2 and custom_scope:get());
    scope_color:visibility(menutablist:get() == 2 and custom_scope:get());
    infopanelmadafakar:visibility(menutablist:get() == 2);
    velocity_ind:visibility(menutablist:get() == 2);
    aspect_ratio_switch:visibility(menutablist:get() == 3);
    aspect_ratio_slider:visibility(menutablist:get() == 3 and aspect_ratio_switch:get());
    fall_exploit:visibility(menutablist:get() == 3);
    viewmodel_switch:visibility(menutablist:get() == 3);
    viewmodel_fov:visibility(menutablist:get() == 3 and viewmodel_switch:get());
    viewmodel_x:visibility(menutablist:get() == 3 and viewmodel_switch:get());
    viewmodel_y:visibility(menutablist:get() == 3 and viewmodel_switch:get());
    viewmodel_z:visibility(menutablist:get() == 3 and viewmodel_switch:get());
    current_condition = v137();
    for v567 = 1, 6 do
        if custom_aa[v567].yaw_type:get() == "Disabled" and current_condition == v567 then
            custom_aa2[v567].byalexcodspeed2:visibility(false);
            custom_aa2[v567].byalexcodspeed:visibility(false);
            custom_aa2[v567].base:visibility(false);
            custom_aa2[v567].offset_left:visibility(false);
            custom_aa2[v567].offset_right:visibility(false);
        else
            custom_aa2[v567].byalexcodspeed2:visibility(true);
            custom_aa2[v567].byalexcodspeed:visibility(true);
            custom_aa2[v567].base:visibility(true);
            custom_aa2[v567].offset_left:visibility(true);
            custom_aa2[v567].offset_right:visibility(true);
            if custom_aa2[v567].byalexcodspeed2:get() == "Default" and current_condition == v567 then
                custom_aa2[v567].byalexcodspeed:visibility(false);
            else
                custom_aa2[v567].byalexcodspeed:visibility(true);
            end;
        end;
        if custom_aa[v567].yaw_modifier:get() == "Disabled" and current_condition == v567 then
            custom_aa2[v567].modifier_offset:visibility(false);
        else
            custom_aa2[v567].modifier_offset:visibility(true);
        end;
        if custom_aa[v567].body_yaw:get() and current_condition == v567 then
            custom_aa2[v567].left_limit:visibility(true);
            custom_aa2[v567].right_limit:visibility(true);
            custom_aa2[v567].options:visibility(true);
            custom_aa2[v567].freestanding:visibility(true);
        else
            custom_aa2[v567].left_limit:visibility(false);
            custom_aa2[v567].right_limit:visibility(false);
            custom_aa2[v567].options:visibility(false);
            custom_aa2[v567].freestanding:visibility(false);
        end;
    end;
    current_condition = v137();
    for v568 = 1, 6 do
        custom_aa[v568].yaw_type:visibility(conditional:get() and current_condition == v568 and conditional:get() == 2 and menutablist:get() == 1);
        custom_aa[v568].yaw_modifier:visibility(conditional:get() and current_condition == v568 and conditional:get() == 2 and menutablist:get() == 1);
        custom_aa[v568].body_yaw:visibility(conditional:get() and current_condition == v568 and conditional:get() == 2 and menutablist:get() == 1);
    end;
end;
events.render:set(rendering);
v545.destroy = function()
    -- upvalues: v545 (ref)
    v545.set("");
end;
events.render:set(v545.on_render);
events.shutdown:set(v545.destroy);
cltgn:set_callback(v545.destroy);
local function _(v569, v570)
    local v571 = {};
    for v572 in string.gmatch(v569, "([^" .. v570 .. "]+)") do
        v571[#v571 + 1] = string.gsub(v572, "\n", "");
    end;
    return v571;
end;
local function _(v574)
    if v574 == "true" or v574 == "false" then
        return v574 == "true";
    else
        return v574;
    end;
end;
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local v578 = {
    bools = {
        [1] = modernwatermark, 
        [2] = conditions, 
        [3] = byalexcod1999, 
        [4] = byalexcod1998, 
        [5] = byalexcod56, 
        [6] = indicators_mode, 
        [7] = theme_solus, 
        [8] = mindmgcomboo, 
        [9] = byalexcod, 
        [10] = conditions4, 
        [11] = byalexcod3, 
        [12] = sols_nou, 
        [13] = hitlogsvar, 
        [14] = byalexcheat, 
        [15] = apollo_fl, 
        [16] = apollo_freestand, 
        [17] = baimifxhp, 
        [18] = apolloexpolit, 
        [19] = indicators_enable, 
        [20] = infopanelmadafakar, 
        [21] = velocity_ind, 
        [22] = gsindicators, 
        [23] = shared_icon, 
        [24] = custom_scope, 
        [25] = MinDMGvis, 
        [26] = arrows_enable, 
        [27] = snaplines, 
        [28] = cltgn, 
        [29] = trashtalk_switch, 
        [30] = aspect_ratio_switch, 
        [31] = unmute_player, 
        [32] = fast_ledder, 
        [33] = fall_exploit, 
        [34] = conditions6, 
        [35] = viewmodel_switch, 
        [36] = dtmodifier, 
        [37] = byalexcod55, 
        [38] = byalexcod57, 
        [39] = sol_key_x, 
        [40] = sol_key_y, 
        [41] = sol_spec_x, 
        [42] = sol_spec_y, 
        [43] = scope_gap, 
        [44] = pingunlocker1, 
        [45] = scope_length, 
        [46] = keybinds_x, 
        [47] = keybinds_y, 
        [48] = spectators_x, 
        [49] = spectators_y, 
        [50] = infotab_x, 
        [51] = infotab_y, 
        [52] = aspect_ratio_slider, 
        [53] = viewmodel_fov, 
        [54] = viewmodel_x, 
        [55] = viewmodel_y, 
        [56] = viewmodel_z, 
        [57] = v369, 
        [58] = v370, 
        [59] = scoutmodifier, 
        [60] = awpmodifier, 
        [61] = automodifier, 
        [62] = pistolmidifer, 
        [63] = dealgemodifier, 
        [64] = r8modifier, 
        [65] = v462, 
        [66] = v493, 
        [67] = baimifxhp3, 
        [68] = indicators_extras, 
        [69] = conditional, 
        [70] = custom_aa[1].yaw_type, 
        [71] = custom_aa[1].yaw_modifier, 
        [72] = custom_aa[1].body_yaw, 
        [73] = custom_aa2[1].base, 
        [74] = custom_aa2[1].offset_left, 
        [75] = custom_aa2[1].byalexcodspeed2, 
        [76] = custom_aa2[1].byalexcodspeed, 
        [77] = custom_aa2[1].offset_right, 
        [78] = custom_aa2[1].modifier_offset, 
        [79] = custom_aa2[1].left_limit, 
        [80] = custom_aa2[1].right_limit, 
        [81] = custom_aa2[1].freestanding, 
        [82] = custom_aa2[1].options, 
        [83] = custom_aa[2].yaw_type, 
        [84] = custom_aa[2].yaw_modifier, 
        [85] = custom_aa[2].body_yaw, 
        [86] = custom_aa2[2].base, 
        [87] = custom_aa2[2].offset_left, 
        [88] = custom_aa2[2].byalexcodspeed2, 
        [89] = custom_aa2[2].byalexcodspeed, 
        [90] = custom_aa2[2].offset_right, 
        [91] = custom_aa2[2].modifier_offset, 
        [92] = custom_aa2[2].left_limit, 
        [93] = custom_aa2[2].right_limit, 
        [94] = custom_aa2[2].freestanding, 
        [95] = custom_aa2[2].options, 
        [96] = custom_aa[3].yaw_type, 
        [97] = custom_aa[3].yaw_modifier, 
        [98] = custom_aa[3].body_yaw, 
        [99] = custom_aa2[3].base, 
        [100] = custom_aa2[3].offset_left, 
        [101] = custom_aa2[3].byalexcodspeed2, 
        [102] = custom_aa2[3].byalexcodspeed, 
        [103] = custom_aa2[3].offset_right, 
        [104] = custom_aa2[3].modifier_offset, 
        [105] = custom_aa2[3].left_limit, 
        [106] = custom_aa2[3].right_limit, 
        [107] = custom_aa2[3].freestanding, 
        [108] = custom_aa2[3].options, 
        [109] = custom_aa[4].yaw_type, 
        [110] = custom_aa[4].yaw_modifier, 
        [111] = custom_aa[4].body_yaw, 
        [112] = custom_aa2[4].base, 
        [113] = custom_aa2[4].offset_left, 
        [114] = custom_aa2[4].byalexcodspeed2, 
        [115] = custom_aa2[4].byalexcodspeed, 
        [116] = custom_aa2[4].offset_right, 
        [117] = custom_aa2[4].modifier_offset, 
        [118] = custom_aa2[4].left_limit, 
        [119] = custom_aa2[4].right_limit, 
        [120] = custom_aa2[4].freestanding, 
        [121] = custom_aa2[4].options, 
        [122] = custom_aa[5].yaw_type, 
        [123] = custom_aa[5].yaw_modifier, 
        [124] = custom_aa[5].body_yaw, 
        [125] = custom_aa2[5].base, 
        [126] = custom_aa2[5].offset_left, 
        [127] = custom_aa2[5].byalexcodspeed2, 
        [128] = custom_aa2[5].byalexcodspeed, 
        [129] = custom_aa2[5].offset_right, 
        [130] = custom_aa2[5].modifier_offset, 
        [131] = custom_aa2[5].left_limit, 
        [132] = custom_aa2[5].right_limit, 
        [133] = custom_aa2[5].freestanding, 
        [134] = custom_aa2[5].options, 
        [135] = custom_aa[6].yaw_type, 
        [136] = custom_aa[6].yaw_modifier, 
        [137] = custom_aa[6].body_yaw, 
        [138] = custom_aa2[6].base, 
        [139] = custom_aa2[6].offset_left, 
        [140] = custom_aa2[6].byalexcodspeed2, 
        [141] = custom_aa2[6].byalexcodspeed, 
        [142] = custom_aa2[6].offset_right, 
        [143] = custom_aa2[6].modifier_offset, 
        [144] = custom_aa2[6].left_limit, 
        [145] = custom_aa2[6].right_limit, 
        [146] = custom_aa2[6].freestanding, 
        [147] = custom_aa2[6].options
    }, 
    colors = {
        [1] = sol_accent, 
        [2] = accent_color, 
        [3] = velocity_ind_col, 
        [4] = scope_color, 
        [5] = snaplinescolor, 
        [6] = arrows_col, 
        [7] = state_col, 
        [8] = hitedshoots
    }
};
global66:button("\a{Link Active}" .. ui.get_icon("file-export") .. " Export", function()
    -- upvalues: v578 (ref), l_clipboard_0 (ref), l_base64_0 (ref)
    utils.console_exec("playvol  buttons/bell1.wav 1");
    local v579 = {
        [1] = {}, 
        [2] = {}
    };
    for _, v581 in pairs(v578.bools) do
        table.insert(v579[1], v581:get());
    end;
    for _, v583 in pairs(v578.colors) do
        local v584 = v583:get();
        table.insert(v579[2], string.format("%02X%02X%02X%02X", math.floor(v584.r), math.floor(v584.g), math.floor(v584.b), math.floor(v584.a)));
    end;
    l_clipboard_0.set(l_base64_0.encode(json.stringify(v579)));
    common.add_notify("Config system", "\a69C953FFConfig successfully exported!");
end, true);
import = function(v585)
    -- upvalues: l_base64_0 (ref), v578 (ref)
    local l_status_0, l_result_0 = pcall(function()
        -- upvalues: l_base64_0 (ref), v585 (ref)
        return json.parse(l_base64_0.decode(v585));
    end);
    if not l_status_0 or l_status_0 == nil then
        common.add_notify("Config system", "\aFF0000FFAn error appear while importing!");
        return;
    else
        for v588, v589 in pairs(l_result_0) do
            v588 = ({
                [1] = "bools", 
                [2] = "colors"
            })[v588];
            for v590, v591 in pairs(v589) do
                if v588 == "bools" then
                    v578[v588][v590]:set(v591);
                end;
                if v588 == "colors" then
                    v578[v588][v590]:set(color(tonumber("0x" .. v591:sub(1, 2)), tonumber("0x" .. v591:sub(3, 4)), tonumber("0x" .. v591:sub(5, 6)), tonumber("0x" .. v591:sub(7, 8))));
                end;
            end;
        end;
        common.add_notify("Config system", "\a69C953FFConfig successfully imported!");
        return;
    end;
end;
global66:button("\a{Link Active}" .. ui.get_icon("file-import") .. " Import", function()
    -- upvalues: l_clipboard_0 (ref)
    utils.console_exec("playvol  buttons/bell1.wav 1");
    import(l_clipboard_0.get());
end, true);
global66:button("\a{Link Active}" .. icon.loader .. " Default Config", function()
    utils.console_exec("playvol buttons/arena_switch_press_02.wav 0.5");
    import("W1siQm90dG9tIiwiU3RhbmQiLCJTaW1wbGUiLCJEaXNhYmxlIiwiWmVwaHlyIiwiTmV3IiwiT3B0aW1pemVkIiwiVG9wIG1pZGRsZSIsWyJCb21ic2l0ZSBFIEZpeCIsIkFudGktQmFja3N0YWIiXSxbIkFpciIsIkFpciBDcm91Y2hpbmciLCJDcm91Y2giXSxbXSxbIlNwZWN0YXRvcnMiLCJLZXliaW5kcyJdLFsiVW5kZXIgQ3Jvc3NoYWlyIiwiQ29uc29sZSJdLHRydWUsdHJ1ZSxmYWxzZSxmYWxzZSxmYWxzZSx0cnVlLHRydWUsdHJ1ZSxmYWxzZSx0cnVlLHRydWUsdHJ1ZSxmYWxzZSxmYWxzZSx0cnVlLGZhbHNlLHRydWUsZmFsc2UsZmFsc2UsZmFsc2UsW10sdHJ1ZSxmYWxzZSwwLjAsNC4wLDMxLjAsNDEwLjAsMzA0LjAsMTc4LjAsNC4wLGZhbHNlLDEzOC4wLDcxMC4wLDQ5MC4wLDQxMC4wLDQ5MC4wLDQxMC4wLDQ5MC4wLDEzMi4wLDMzLjAsLTQuMCwtMTMuMCwwLjAsMzk4LjAsNzAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwyMC4wLDIwLjAsW10sW10sMy4wLCJEaXNhYmxlZCIsIkRpc2FibGVkIixmYWxzZSwiTG9jYWwgVmlldyIsMC4wLCJEZWZhdWx0IiwiRmFzdCIsMC4wLDAuMCwwLjAsMC4wLCJPZmYiLFtdLCJEaXNhYmxlZCIsIkRpc2FibGVkIixmYWxzZSwiTG9jYWwgVmlldyIsMC4wLCJEZWZhdWx0IiwiRmFzdCIsMC4wLDAuMCwwLjAsMC4wLCJPZmYiLFtdLCJEaXNhYmxlZCIsIkRpc2FibGVkIixmYWxzZSwiTG9jYWwgVmlldyIsMC4wLCJEZWZhdWx0IiwiRmFzdCIsMC4wLDAuMCwwLjAsMC4wLCJPZmYiLFtdLCJEaXNhYmxlZCIsIkRpc2FibGVkIixmYWxzZSwiTG9jYWwgVmlldyIsMC4wLCJEZWZhdWx0IiwiRmFzdCIsMC4wLDAuMCwwLjAsMC4wLCJPZmYiLFtdLCJEaXNhYmxlZCIsIkRpc2FibGVkIixmYWxzZSwiTG9jYWwgVmlldyIsMC4wLCJEZWZhdWx0IiwiRmFzdCIsMC4wLDAuMCwwLjAsMC4wLCJPZmYiLFtdLCJEaXNhYmxlZCIsIkRpc2FibGVkIixmYWxzZSwiTG9jYWwgVmlldyIsMC4wLCJEZWZhdWx0IiwiRmFzdCIsMC4wLDAuMCwwLjAsMC4wLCJPZmYiLFtdXSxbIkZGOUYwMEZGIiwiRkZBNTAwRkYiLCJGRkE1MDBGRiIsIkZGRkZGRkZGIiwiRkZGRkZGRkYiLCJGRkZGRkZGRiIsIkZGRkZGRkZGIiwiRkZBNTAwRkYiXV0=");
end, true);
global66:button("\a{Link Active}" .. icon.loader .. " Alex Config", function()
    utils.console_exec("playvol buttons/arena_switch_press_02.wav 0.5");
    import("W1siQm90dG9tIiwiU3RhbmQiLCJTaW1wbGUiLCJVcCIsIlplcGh5ciIsIk5ldyIsIk9wdGltaXplZCIsIlRvcCBsZWZ0IixbIkJvbWJzaXRlIEUgRml4IiwiQW50aS1CYWNrc3RhYiJdLFsiQWlyIiwiQWlyIENyb3VjaGluZyIsIkNyb3VjaCJdLFtdLFsiU3BlY3RhdG9ycyIsIktleWJpbmRzIl0sWyJVbmRlciBDcm9zc2hhaXIiLCJDb25zb2xlIl0sdHJ1ZSx0cnVlLGZhbHNlLGZhbHNlLGZhbHNlLGZhbHNlLHRydWUsdHJ1ZSxmYWxzZSx0cnVlLHRydWUsdHJ1ZSxmYWxzZSxmYWxzZSx0cnVlLHRydWUsdHJ1ZSxmYWxzZSxmYWxzZSxmYWxzZSxbXSx0cnVlLGZhbHNlLDAuMCw0LjAsMS4wLDQxMi4wLDMwNC4wLDE3OC4wLDQuMCx0cnVlLDEzOC4wLDcxMC4wLDQ5MC4wLDQxMC4wLDQ5MC4wLDQxMC4wLDQ5MC4wLDEzMi4wLDI2LjAsLTQuMCwyMi4wLC0yMi4wLDM5OC4wLDcwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMjAuMCwyMC4wLFtdLFsxLjBdLDQuMCwiRGlzYWJsZWQiLCJEaXNhYmxlZCIsZmFsc2UsIkxvY2FsIFZpZXciLDAuMCwiRGVmYXVsdCIsIkZhc3QiLDAuMCwwLjAsMC4wLDAuMCwiT2ZmIixbXSwiRGlzYWJsZWQiLCJEaXNhYmxlZCIsZmFsc2UsIkxvY2FsIFZpZXciLDAuMCwiRGVmYXVsdCIsIkZhc3QiLDAuMCwwLjAsMC4wLDAuMCwiT2ZmIixbXSwiRGlzYWJsZWQiLCJEaXNhYmxlZCIsZmFsc2UsIkxvY2FsIFZpZXciLDAuMCwiRGVmYXVsdCIsIkZhc3QiLDAuMCwwLjAsMC4wLDAuMCwiT2ZmIixbXSwiRGlzYWJsZWQiLCJEaXNhYmxlZCIsZmFsc2UsIkxvY2FsIFZpZXciLDAuMCwiRGVmYXVsdCIsIkZhc3QiLDAuMCwwLjAsMC4wLDAuMCwiT2ZmIixbXSwiRGlzYWJsZWQiLCJEaXNhYmxlZCIsZmFsc2UsIkxvY2FsIFZpZXciLDAuMCwiRGVmYXVsdCIsIkZhc3QiLDAuMCwwLjAsMC4wLDAuMCwiT2ZmIixbXSwiRGlzYWJsZWQiLCJEaXNhYmxlZCIsZmFsc2UsIkxvY2FsIFZpZXciLDAuMCwiRGVmYXVsdCIsIkZhc3QiLDAuMCwwLjAsMC4wLDAuMCwiT2ZmIixbXV0sWyJGRjIwMDBGRiIsIkZGMUYwMEZGIiwiRkYyMDAwRkYiLCJGRkZGRkZGRiIsIkZGRkZGRkZGIiwiRkZGRkZGRkYiLCJGRkZGRkZGRiIsIkZGMjAwMEZGIl1d");
end, true);