local l_gradient_0 = require("neverlose/gradient");
cprint = require("neverlose/color_print");
exploits = require("neverlose/exploits");
drag_system = require("neverlose/drag_system");
pui = require("neverlose/pui");
base64 = require("neverlose/base64");
cp = require("neverlose/clipboard");
selection = pui.create("Selection", 1);
main = pui.create("Main page", 2);
builder = pui.create("Builder", 2);
other = pui.create("Other", 2);
visual = pui.create("Visual", 2);
misc = pui.create("Misc", 2);
hide = pui.create("Hide", 2);
cfgs = pui.create("Configs", 2);
cbuild = "beta";
cbuild_space = "b e t a";
groundticks = 0;
request_print = {};
states = {
    [1] = "Global", 
    [2] = "Standing", 
    [3] = "Moving", 
    [4] = "Walking", 
    [5] = "Crouching", 
    [6] = "Crouching + move", 
    [7] = "Air", 
    [8] = "Air+", 
    [9] = "Manual"
};
shrt = {
    [1] = "[G] ", 
    [2] = "[S] ", 
    [3] = "[M] ", 
    [4] = "[W] ", 
    [5] = "[C] ", 
    [6] = "[C+M] ", 
    [7] = "[A] ", 
    [8] = "[A+] ", 
    [9] = "[MN]"
};
AntiAim_builder = {};
stateNumber = 0;
stateName = "";
math.vec_length2d = function(v1)
    root = 0;
    sqst = v1.x * v1.x + v1.y * v1.y;
    root = math.sqrt(sqst);
    return root;
end;
render.log = function(v2, v3)
    local l_insert_0 = table.insert;
    local l_request_print_0 = request_print;
    local v6 = {
        [1] = nil, 
        [2] = 0, 
        [1] = v2, 
        [3] = globals.curtime / 2 * 2
    };
    local v7;
    if type(v3) == "string" then
        v7 = v3 == "Modern" and 1 or v3 == "Only text" and 3 or v3 == "Lonely" and 4 or 2;
    else
        v7 = v3;
    end;
    v6[4] = v7;
    l_insert_0(l_request_print_0, v6);
end;
get = {
    slwlk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    yawbase = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yawoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    anti_bs = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    defdef = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    desync = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    desync_inv = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    desync_l = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    desync_r = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    desync_opt = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    desync_fr = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    freestand = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    fakelag = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
    fakelag_i = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
    fakelag_c = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"), 
    hslag = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
    modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    dtlag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options")
};
eui = {};
man = main:list("\208\154\208\187\208\184\208\186\208\176\208\177\208\184\208\187\209\140\208\189\208\190", {
    [1] = nil, 
    [2] = "Creator: skeerty", 
    [3] = "Discord", 
    [4] = "Youtube", 
    [5] = "Config for lua", 
    [1] = "This is a [" .. cbuild_space .. "] build"
});
man:set_callback(function(v8)
    if v8:get() == 1 then
        print("Version 1.0");
    end;
    if v8:get() == 2 then
        print("\208\144\208\144\208\144, \208\186\209\130\208\190 \208\182\208\181 \209\141\209\130\208\190? \208\173\208\162\208\158 \208\150\208\149 \208\145\208\149\208\162\208\156\208\149\208\157");
    end;
    if v8:get() == 3 then
        print("discord server is dsc.gg/aaisystem");
    end;
    if v8:get() == 4 then
        print("youtube is https://www.youtube.com/@skeertyhvh");
    end;
    if v8:get() == 5 then
        print("cfg is https://ru.neverlose.cc/market/item?id=6tjbmr");
    end;
end);
eui.selectbl = selection:combo("Menu", {
    [1] = "Main page", 
    [2] = "Anti-aim", 
    [3] = "Visual", 
    [4] = "Misc", 
    [5] = "Configs"
});
eui.ui = visual:selectable("UI", {
    [1] = "Indicators"
}, "Soon will made Watermark and Keybinds");
eui.enable = visual:switch("Enable logs", false);
eui.enabled = visual:selectable("Enabled", {
    [1] = "Console", 
    [2] = "Screen"
});
eui.style = visual:combo("Style", {
    [1] = "Modern", 
    [2] = "Other", 
    [3] = "Only text"
});
eui.accent_color = visual:color_picker("Accent color >_<");
eui.asp_a = visual:switch("Enable aspect ratio", false);
aspect_gr = eui.asp_a:create();
eui.asp = aspect_gr:slider("Aspect ratio", 0, 200);
eui.aas = selection:combo("Anti aims", {
    [1] = "Builder", 
    [2] = "Other"
});
eui.builders = selection:combo("Builder state", states, #states);
eui.clantag = misc:switch("Enable clantag", false);
eui.talks = misc:selectable("Talks", {
    [1] = "Kill", 
    [2] = "Dead", 
    [3] = "Revenge"
});
eui.jumpscout = misc:switch("Jump scout");
eui.jumpsc = eui.jumpscout:create():depend({
    [1] = nil, 
    [2] = true, 
    [1] = eui.jumpscout
});
eui.jumpscout_v = eui.jumpsc:slider("Jump scout value", 0, 100, 50);
eui.manuals = other:combo("Manuals", {
    [1] = "None", 
    [2] = "Left", 
    [3] = "Right", 
    [4] = "Forward"
});
eui.antibackstab = other:switch("Anti backstab");
eui.fakelag_j = other:switch("Fakelagging on jitter");
eui.fakeflicks = other:switch("Enable FakeFlicks");
eui.fakeflicks_mode = other:combo("Fakeflicks mode", {
    [1] = "Default", 
    [2] = "Customizable"
});
eui.fakeflicks_pitch = other:slider("Fakeflick pitch", -89, 89);
eui.fakeflicks_speed = other:slider("Fakeflicks speed", -20, 20, 7);
eui.fakeflicks_yaw = other:slider("Fakeflicks yaw left", -180, 180, 60);
eui.fakeflicks_yaw2 = other:slider("Fakeflicks yaw right", -180, 180, 80);
eui.fakeflicks_yaw_switch = other:combo("Yaw switch", {
    [1] = "Only left", 
    [2] = "Only right", 
    [3] = "Jitter", 
    [4] = "Switch"
});
eui.unmatched_mode = other:switch("Unmatched mode");
eui.safehead = other:switch("Enable safe head");
local v9 = "";
eui.configs = cfgs:combo("Configs", {
    [1] = "Skeerty's"
}, "every update i will add best configs (send their in the ticket in discord)");
eui.config_export = cfgs:button("Export config", function()
    local v10 = pui.setup({
        [1] = eui, 
        [2] = AntiAim_builder
    }, true);
    cp.set(base64.encode(json.stringify(v10:save())));
end);
eui.config_import = cfgs:button("Import config", function()
    pui.setup({
        [1] = eui, 
        [2] = AntiAim_builder
    }, true):load(json.parse(base64.decode(cp.get())));
end);
eui.config_import = cfgs:button("Load config", function()
    -- upvalues: v9 (ref)
    local v11 = pui.setup({
        [1] = eui, 
        [2] = AntiAim_builder
    }, true);
    if eui.configs:get() == "Skeerty" then
        v9 = "W3siYWFzIjoiQnVpbGRlciIsImFjY2VudF9jb2xvciI6IiM5QjAwRkZGRiIsImFudGliYWNrc3RhYiI6dHJ1ZSwiYXNwIjoyMy4wLCJhc3BfYSI6dHJ1ZSwiYnVpbGRlcnMiOiJNb3ZpbmciLCJjbGFudGFnIjp0cnVlLCJjb25maWdzIjoxLjAsImVuYWJsZSI6dHJ1ZSwiZW5hYmxlZCI6WyJDb25zb2xlIiwiU2NyZWVuIiwifiJdLCJmYWtlZmxpY2tzIjpmYWxzZSwiZmFrZWZsaWNrc19tb2RlIjoiQ3VzdG9taXphYmxlIiwiZmFrZWZsaWNrc19waXRjaCI6MzguMCwiZmFrZWZsaWNrc19zcGVlZCI6My4wLCJmYWtlZmxpY2tzX3lhdyI6LTYwLjAsImZha2VmbGlja3NfeWF3MiI6NjAuMCwiZmFrZWZsaWNrc195YXdfc3dpdGNoIjoiU3dpdGNoIiwiZmFrZWxhZ19qIjp0cnVlLCJqdW1wc2NvdXQiOnRydWUsImp1bXBzY291dF92Ijo2MC4wLCJtYW51YWxzIjoiTm9uZSIsInNhZmVoZWFkIjp0cnVlLCJzZWxlY3RibCI6IkNvbmZpZ3MiLCJzdHlsZSI6IlNrZWV0IiwidGFsa3MiOlsiS2lsbCIsIkRlYWQiLCJSZXZlbmdlIiwifiJdLCJ1aSI6WyJJbmRpY2F0b3JzIiwifiJdLCJ1bm1hdGNoZWRfbW9kZSI6ZmFsc2V9LFt7ImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiSGFsZiB1cCIsImRlZmVuc2l2ZV9waXRjaDEiOi04OS4wLCJkZWZlbnNpdmVfcGl0Y2gyIjotODkuMCwiZGVmZW5zaXZlX3NwZWVkX3AiOi0xMC4wLCJkZWZlbnNpdmVfc3BlZWRfeSI6LTEwLjAsImRlZmVuc2l2ZV90IjoiQWx3YXlzIE9uIiwiZGVmZW5zaXZlX3lhdyI6IlNpZGV3YXlzIiwiZGVmZW5zaXZlX3lhdzEiOi0xODAuMCwiZGVmZW5zaXZlX3lhdzIiOi0xODAuMCwiZGVzeW5jIjp0cnVlLCJkZXN5bmNfbCI6NjAuMCwiZGVzeW5jX3IiOjYwLjAsImRlc3luY19zaW5rIjpmYWxzZSwiZGVzeW5jX3QiOiJKaXR0ZXIiLCJlbmFibGUiOnRydWUsImppdHRlciI6dHJ1ZSwiaml0dGVyX2QiOjAuMCwiaml0dGVyX2RyIjpmYWxzZSwiaml0dGVyX3QiOiJDZW50ZXIiLCJqaXR0ZXJfdiI6LTIuMCwicGl0Y2giOiJEb3duIiwieWF3IjowLjAsInlhd2Jhc2UiOiJhdCBjcm9zc2hhaXIifSx7ImRlZmVuc2l2ZSI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IlVwIiwiZGVmZW5zaXZlX3BpdGNoMSI6LTg5LjAsImRlZmVuc2l2ZV9waXRjaDIiOi04OS4wLCJkZWZlbnNpdmVfc3BlZWRfcCI6LTEwLjAsImRlZmVuc2l2ZV9zcGVlZF95IjotMTAuMCwiZGVmZW5zaXZlX3QiOiJBbHdheXMgT24iLCJkZWZlbnNpdmVfeWF3IjoiRm9yd2FyZCIsImRlZmVuc2l2ZV95YXcxIjotMTgwLjAsImRlZmVuc2l2ZV95YXcyIjotMTgwLjAsImRlc3luYyI6dHJ1ZSwiZGVzeW5jX2wiOjYwLjAsImRlc3luY19yIjo2MC4wLCJkZXN5bmNfc2luayI6dHJ1ZSwiZGVzeW5jX3QiOiJKaXR0ZXIiLCJlbmFibGUiOnRydWUsImppdHRlciI6dHJ1ZSwiaml0dGVyX2QiOjAuMCwiaml0dGVyX2RyIjpmYWxzZSwiaml0dGVyX3QiOiJDZW50ZXIiLCJqaXR0ZXJfdiI6OC4wLCJwaXRjaCI6IkRvd24iLCJ5YXciOjAuMCwieWF3YmFzZSI6ImF0IGNyb3NzaGFpciJ9LHsiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJTcGluIiwiZGVmZW5zaXZlX3BpdGNoMSI6LTg5LjAsImRlZmVuc2l2ZV9waXRjaDIiOjg5LjAsImRlZmVuc2l2ZV9zcGVlZF9wIjoxMC4wLCJkZWZlbnNpdmVfc3BlZWRfeSI6LTEwLjAsImRlZmVuc2l2ZV90IjoiT24gUGVlayIsImRlZmVuc2l2ZV95YXciOiJSYW5kb20iLCJkZWZlbnNpdmVfeWF3MSI6LTE4MC4wLCJkZWZlbnNpdmVfeWF3MiI6MTgwLjAsImRlc3luYyI6dHJ1ZSwiZGVzeW5jX2wiOjYwLjAsImRlc3luY19yIjo2MC4wLCJkZXN5bmNfc2luayI6ZmFsc2UsImRlc3luY190IjoiU3RhdGljIiwiZW5hYmxlIjp0cnVlLCJqaXR0ZXIiOnRydWUsImppdHRlcl9kIjoxOC4wLCJqaXR0ZXJfZHIiOnRydWUsImppdHRlcl90IjoiRGVsYXkiLCJqaXR0ZXJfdiI6LTE4LjAsInBpdGNoIjoiRG93biIsInlhdyI6MjAuMCwieWF3YmFzZSI6ImF0IHRhcmdldCJ9LHsiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiVXAiLCJkZWZlbnNpdmVfcGl0Y2gxIjotODkuMCwiZGVmZW5zaXZlX3BpdGNoMiI6LTg5LjAsImRlZmVuc2l2ZV9zcGVlZF9wIjotMTAuMCwiZGVmZW5zaXZlX3NwZWVkX3kiOi0xMC4wLCJkZWZlbnNpdmVfdCI6IkFsd2F5cyBPbiIsImRlZmVuc2l2ZV95YXciOiJGb3J3YXJkIiwiZGVmZW5zaXZlX3lhdzEiOi0xODAuMCwiZGVmZW5zaXZlX3lhdzIiOi0xODAuMCwiZGVzeW5jIjpmYWxzZSwiZGVzeW5jX2wiOjAuMCwiZGVzeW5jX3IiOjAuMCwiZGVzeW5jX3NpbmsiOmZhbHNlLCJkZXN5bmNfdCI6IkppdHRlciIsImVuYWJsZSI6ZmFsc2UsImppdHRlciI6ZmFsc2UsImppdHRlcl9kIjowLjAsImppdHRlcl9kciI6ZmFsc2UsImppdHRlcl90IjoiQ2VudGVyIiwiaml0dGVyX3YiOi05MC4wLCJwaXRjaCI6IlVwIiwieWF3IjotMTgwLjAsInlhd2Jhc2UiOiJhdCBjcm9zc2hhaXIifSx7ImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiVXAiLCJkZWZlbnNpdmVfcGl0Y2gxIjotODkuMCwiZGVmZW5zaXZlX3BpdGNoMiI6LTg5LjAsImRlZmVuc2l2ZV9zcGVlZF9wIjotMTAuMCwiZGVmZW5zaXZlX3NwZWVkX3kiOjEwLjAsImRlZmVuc2l2ZV90IjoiQWx3YXlzIE9uIiwiZGVmZW5zaXZlX3lhdyI6IlNwaW4iLCJkZWZlbnNpdmVfeWF3MSI6LTE4MC4wLCJkZWZlbnNpdmVfeWF3MiI6LTE4MC4wLCJkZXN5bmMiOnRydWUsImRlc3luY19sIjowLjAsImRlc3luY19yIjowLjAsImRlc3luY19zaW5rIjpmYWxzZSwiZGVzeW5jX3QiOiJTdGF0aWMiLCJlbmFibGUiOnRydWUsImppdHRlciI6dHJ1ZSwiaml0dGVyX2QiOjAuMCwiaml0dGVyX2RyIjpmYWxzZSwiaml0dGVyX3QiOiJDZW50ZXIiLCJqaXR0ZXJfdiI6LTExLjAsInBpdGNoIjoiRG93biIsInlhdyI6My4wLCJ5YXdiYXNlIjoiYXQgdGFyZ2V0In0seyJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9waXRjaCI6IlVwIiwiZGVmZW5zaXZlX3BpdGNoMSI6LTg5LjAsImRlZmVuc2l2ZV9waXRjaDIiOi04OS4wLCJkZWZlbnNpdmVfc3BlZWRfcCI6LTEwLjAsImRlZmVuc2l2ZV9zcGVlZF95IjoxMC4wLCJkZWZlbnNpdmVfdCI6IkFsd2F5cyBPbiIsImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhdzEiOi0xODAuMCwiZGVmZW5zaXZlX3lhdzIiOi0xODAuMCwiZGVzeW5jIjp0cnVlLCJkZXN5bmNfbCI6NjAuMCwiZGVzeW5jX3IiOjYwLjAsImRlc3luY19zaW5rIjpmYWxzZSwiZGVzeW5jX3QiOiJTdGF0aWMiLCJlbmFibGUiOnRydWUsImppdHRlciI6dHJ1ZSwiaml0dGVyX2QiOjAuMCwiaml0dGVyX2RyIjpmYWxzZSwiaml0dGVyX3QiOiJDZW50ZXIiLCJqaXR0ZXJfdiI6LTE0LjAsInBpdGNoIjoiRG93biIsInlhdyI6MjIuMCwieWF3YmFzZSI6ImF0IHRhcmdldCJ9LHsiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJVcCIsImRlZmVuc2l2ZV9waXRjaDEiOi04OS4wLCJkZWZlbnNpdmVfcGl0Y2gyIjotODkuMCwiZGVmZW5zaXZlX3NwZWVkX3AiOi0xMC4wLCJkZWZlbnNpdmVfc3BlZWRfeSI6LTEwLjAsImRlZmVuc2l2ZV90IjoiQWx3YXlzIE9uIiwiZGVmZW5zaXZlX3lhdyI6IlNpZGV3YXlzIiwiZGVmZW5zaXZlX3lhdzEiOi0xODAuMCwiZGVmZW5zaXZlX3lhdzIiOi0xODAuMCwiZGVzeW5jIjp0cnVlLCJkZXN5bmNfbCI6NjAuMCwiZGVzeW5jX3IiOjYwLjAsImRlc3luY19zaW5rIjp0cnVlLCJkZXN5bmNfdCI6IlN0YXRpYyIsImVuYWJsZSI6dHJ1ZSwiaml0dGVyIjp0cnVlLCJqaXR0ZXJfZCI6NC4wLCJqaXR0ZXJfZHIiOnRydWUsImppdHRlcl90IjoiRGVsYXkiLCJqaXR0ZXJfdiI6LTIwLjAsInBpdGNoIjoiRG93biIsInlhdyI6Ny4wLCJ5YXdiYXNlIjoiYXQgY3Jvc3NoYWlyIn0seyJkZWZlbnNpdmUiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJVcCIsImRlZmVuc2l2ZV9waXRjaDEiOi04OS4wLCJkZWZlbnNpdmVfcGl0Y2gyIjotODkuMCwiZGVmZW5zaXZlX3NwZWVkX3AiOi0xMC4wLCJkZWZlbnNpdmVfc3BlZWRfeSI6LTEwLjAsImRlZmVuc2l2ZV90IjoiQWx3YXlzIE9uIiwiZGVmZW5zaXZlX3lhdyI6IkZvcndhcmQiLCJkZWZlbnNpdmVfeWF3MSI6LTE4MC4wLCJkZWZlbnNpdmVfeWF3MiI6LTE4MC4wLCJkZXN5bmMiOnRydWUsImRlc3luY19sIjo2MC4wLCJkZXN5bmNfciI6NjAuMCwiZGVzeW5jX3NpbmsiOmZhbHNlLCJkZXN5bmNfdCI6IlN0YXRpYyIsImVuYWJsZSI6dHJ1ZSwiaml0dGVyIjp0cnVlLCJqaXR0ZXJfZCI6MC4wLCJqaXR0ZXJfZHIiOmZhbHNlLCJqaXR0ZXJfdCI6IkNlbnRlciIsImppdHRlcl92IjotMTQuMCwicGl0Y2giOiJEb3duIiwieWF3IjoxNi4wLCJ5YXdiYXNlIjoiYXQgY3Jvc3NoYWlyIn0seyJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9waXRjaCI6Ilplcm8iLCJkZWZlbnNpdmVfcGl0Y2gxIjotODkuMCwiZGVmZW5zaXZlX3BpdGNoMiI6LTg5LjAsImRlZmVuc2l2ZV9zcGVlZF9wIjotMTAuMCwiZGVmZW5zaXZlX3NwZWVkX3kiOi0xMC4wLCJkZWZlbnNpdmVfdCI6IkFsd2F5cyBPbiIsImRlZmVuc2l2ZV95YXciOiJGb3J3YXJkIiwiZGVmZW5zaXZlX3lhdzEiOi0xODAuMCwiZGVmZW5zaXZlX3lhdzIiOi0xODAuMCwiZGVzeW5jIjp0cnVlLCJkZXN5bmNfbCI6NTUuMCwiZGVzeW5jX3IiOjAuMCwiZGVzeW5jX3NpbmsiOmZhbHNlLCJkZXN5bmNfdCI6IkppdHRlciIsImVuYWJsZSI6dHJ1ZSwiaml0dGVyIjpmYWxzZSwiaml0dGVyX2QiOjAuMCwiaml0dGVyX2RyIjpmYWxzZSwiaml0dGVyX3QiOiJDZW50ZXIiLCJqaXR0ZXJfdiI6LTkwLjAsInBpdGNoIjoiRG93biIsInlhdyI6MC4wLCJ5YXdiYXNlIjoiYXQgdGFyZ2V0In1dXQ==";
    end;
    v11:load(json.parse(base64.decode(v9)));
end);
switchnow = false;
jumpscout = function()
    if not eui.jumpscout:get() == true then
        ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"):override();
        ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", "Options"):override();
        return;
    else
        if groundticks < 3 and entity.get_local_player():get_player_weapon():get_weapon_info().weapon_name == "weapon_ssg08" then
            ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"):override(eui.jumpscout_v:get());
            ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", "Options"):override("In air");
        elseif groundticks > 3 and entity.get_local_player():get_player_weapon():get_weapon_info().weapon_name == "weapon_ssg08" then
            ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"):override();
            ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", "Options"):override();
        end;
        return;
    end;
end;
is_safehead = function()
    get.modifier:set("Disabled");
    local v12 = entity.get_local_player();
    if groundticks < 3 and can_safe == true then
        if eui.safehead:get() == false then
            return false;
        elseif v12 == nil then
            return false;
        elseif v12:is_alive() == false then
            return false;
        else
            if v12:get_player_weapon():get_weapon_info().weapon_name == "weapon_knife" or v12:get_player_weapon():get_weapon_info().weapon_name == "weapon_taser" then
                get.fakelag_i:override(globals.tickcount % 20 < 10 and 1 or 25);
                get.fakelag:override(true);
            end;
            return v12:get_player_weapon():get_weapon_info().weapon_name == "weapon_knife" or v12:get_player_weapon():get_weapon_info().weapon_name == "weapon_taser";
        end;
    else
        return false;
    end;
end;
fakeflick = function(v13)
    if eui.unmatched_mode:get() == true and eui.fakeflicks:get() == false or is_safehead() == true then
        get.defdef:override(false);
        get.defdef:set(false);
        return;
    elseif not eui.fakeflicks:get() then
        return;
    elseif rage.exploit:get() < 1 then
        return;
    else
        local v14 = nil;
        local v15 = nil;
        local v16 = nil;
        local v17 = nil;
        if eui.fakeflicks_mode:get() == "Default" then
            local v18 = 60;
            local v19 = 80;
            local v20 = 3;
            v17 = 9;
            v16 = v20;
            v15 = v19;
            v14 = v18;
        else
            local v21 = eui.fakeflicks_yaw:get();
            local v22 = eui.fakeflicks_yaw2:get();
            v16 = eui.fakeflicks_speed:get();
            v15 = v22;
            v14 = v21;
            if eui.fakeflicks_yaw_switch:get() == "Only left" then
                v17 = 12;
            elseif eui.fakeflicks_yaw_switch:get() == "Only right" then
                v17 = -1;
            elseif eui.fakeflicks_yaw_switch:get() == "Jitter" then
                v17 = v13.command_number % 4 < 2 and 5 or 10;
            else
                v17 = switchnow and 12 or -1;
            end;
        end;
        rage.antiaim:inverter(false);
        get.yawoffset:override(0);
        get.modifier:override("Disabled");
        get.desync:override(true);
        get.desync_opt:override("");
        get.desync_l:override(120);
        get.desync_r:override(120);
        get.freestand:override(false);
        get.defdef:override(true);
        rage.antiaim:override_hidden_pitch(eui.fakeflicks_mode:get() == "Default" and 89 or eui.fakeflicks_pitch:get());
        rage.antiaim:override_hidden_yaw_offset(v13.command_number % 10 < v17 and -v14 or -v15);
        get.hslag:override("Break LC");
        get.dtlag:override("Always On");
        v13.force_defensive = v13.command_number % v16 == 0;
        if exploits.InDefensive() then
            switchnow = not switchnow;
        end;
        return;
    end;
end;
not_see_x = hide:slider("X", render.screen_size().x / 2, render.screen_size().x / 2 + 1, render.screen_size().x / 2);
not_see_y = hide:slider("Y", render.screen_size().y / 2, render.screen_size().y / 2 + 1, render.screen_size().y / 2);
local v28 = {
    alpha_ = 0, 
    blue_d = 0, 
    green_d = 0, 
    red_d = 0, 
    alpha = 0, 
    _alpha_ = 0, 
    _alpha = 0, 
    alpha__ = 0, 
    is_dt = function(v23)
        if rage.exploit:get() == 1 and ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() == true then
            v23.red_d = 0;
            v23.green_d = 255;
            v23.blue_d = 0;
        elseif v23.alpha > 50 then
            v23.red_d = 255;
            v23.green_d = 0;
            v23.blue_d = 0;
        elseif v23.alpha < 50 then
            v23.red_d = 255;
            v23.green_d = 255;
            v23.blue_d = 255;
        end;
        if ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() == true then
            if v23.alpha < 255 then
                v23.alpha = v23.alpha + 3;
            end;
        elseif ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() == false and v23.alpha > 30 then
            v23.alpha = v23.alpha - 3;
        end;
        if v23.alpha < 30 then
            v23.alpha = v23.alpha + 5;
        end;
        return v23.red_d, v23.green_d, v23.blue_d, v23.alpha;
    end, 
    is_hs = function(v24)
        if ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() == true then
            if v24.alpha_ < 255 then
                v24.alpha_ = v24.alpha_ + 1;
            end;
        elseif v24.alpha_ > 30 then
            v24.alpha_ = v24.alpha_ - 1;
        end;
        if v24.alpha_ < 30 then
            v24.alpha_ = v24.alpha_ + 1;
        end;
        return v24.alpha_;
    end, 
    is_fs = function(v25)
        if ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):get() == true then
            if v25.alpha__ < 255 then
                v25.alpha__ = v25.alpha__ + 1;
            end;
        elseif v25.alpha__ > 30 then
            v25.alpha__ = v25.alpha__ - 1;
        end;
        if v25.alpha__ < 30 then
            v25.alpha__ = v25.alpha__ + 1;
        end;
        return v25.alpha__;
    end, 
    is_ap = function(v26)
        if ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"):get() == true then
            if v26._alpha < 255 then
                v26._alpha = v26._alpha + 1;
            end;
        elseif v26._alpha > 30 then
            v26._alpha = v26._alpha - 1;
        end;
        if v26._alpha < 30 then
            v26._alpha = v26._alpha + 1;
        end;
        return v26._alpha;
    end, 
    is_fd = function(v27)
        if ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get() == true then
            if v27._alpha_ < 255 then
                v27._alpha_ = v27._alpha_ + 1;
            end;
        elseif v27._alpha_ > 30 then
            v27._alpha_ = v27._alpha_ - 1;
        end;
        if v27._alpha_ < 30 then
            v27._alpha_ = v27._alpha_ + 1;
        end;
        return v27._alpha_;
    end
};
flag_exp = function()
    if not eui.fakelag_j:get() then
        return;
    else
        get.fakelag:override(true);
        get.fakelag_i:override(rage.antiaim:inverter() and utils.random_int(1, 14) or 5);
        get.fakelag_c:set(0);
        return;
    end;
end;
trashtalk = function(v29)
    local v30 = entity.get(v29.attacker, true);
    victim = entity.get(v29.userid, true);
    lp = entity.get_local_player();
    teamname = "\209\129\209\139\208\189\209\133\209\131\208\185\208\189\208\1842015";
    for _, v32 in pairs(entity.get_players(false)) do
        local v33 = utils.random_int(1, v32:get_index());
        local v34 = v32:get_index();
        if not v32:is_enemy() then
            if v32 == lp and v33 == v34 then
                v33 = utils.random_int(1, v32:get_index());
                if v32 ~= lp and v33 == v34 then
                    teamname = v32:get_name();
                elseif v33 == v34 then
                    v33 = utils.random_int(1, v32:get_index());
                    if v32 ~= lp and v33 == v34 then
                        teamname = v32:get_name();
                    elseif v33 == v34 then
                        v33 = utils.random_int(1, v32:get_index());
                        if v32 ~= lp and v33 == v34 then
                            teamname = v32:get_name();
                        end;
                    end;
                end;
            elseif v33 == v34 then
                teamname = v32:get_name();
            end;
        end;
    end;
    msg_kill = {
        [1] = {
            [1] = "\208\159\208\155\208\154\208\168\208\155\208\159\208\151\208\168\208\158\208\163\208\158", 
            [2] = "\208\148\208\144 \208\156\208\158\208\175 \208\145\208\144\208\145\208\154\208\144 \208\162\208\144\208\154 \208\165\208\163\208\149\208\146\208\158 \208\157\208\149 \208\152\208\147\208\160\208\144\208\149\208\162"
        }, 
        [2] = {
            [1] = "1", 
            [2] = "Low iq warning"
        }, 
        [3] = {
            [1] = "\208\165\208\151\208\144\208\151\208\170\208\170\208\165\208\144\208\151\208\144\208\170\208\151", 
            [2] = "\208\175 \208\155\208\149\208\167\208\163 \208\161\208\158 \208\161\208\162\208\144\208\162\208\152\208\154\208\144\208\156\208\152 \208\162\208\171 \208\167\208\149"
        }, 
        [4] = {
            [1] = "\208\186\208\176\208\186\208\190\208\185 \209\130\209\139 \208\187\208\181\208\179\208\186\208\184\208\185", 
            [2] = "\209\143 \208\189\208\190\208\179\208\176\208\188\208\184 \208\184\208\179\209\128\208\176\208\187"
        }
    };
    msg_dead = {
        [1] = {
            [1] = "POGJRPOG", 
            [2] = "\208\146 \208\148\208\149\208\151 \208\156\208\152\208\161\208\157\208\163\208\155\208\158"
        }, 
        [2] = {
            "\208\144", 
            ("\208\179\208\180\208\181 %s \208\177\208\187\209\143\209\130\209\140"):format(teamname)
        }, 
        [3] = {
            "\208\157\209\131 \208\187\208\176\208\180\208\189\208\190", 
            ("\208\189\208\176 \209\130\208\184\208\188\208\181 \208\182\208\181 %s"):format(teamname)
        }, 
        [4] = {
            [1] = "WTF", 
            [2] = "\209\143 \208\189\208\181 \209\131\208\178\208\184\208\180\208\181\208\187 \209\130\209\143"
        }, 
        [5] = {
            [1] = "\208\155\208\176\208\180\208\189\208\190", 
            [2] = "\209\129\209\139\208\189\209\131 \209\136\208\187\209\142\209\133\208\184 \208\191\208\190\208\180\208\176\209\130\209\129\209\143 \208\188\208\190\208\182\208\189\208\190"
        }, 
        [6] = {
            [1] = "<KZNM", 
            [2] = "\208\154\208\144\208\154 \208\162\208\171 \208\156\208\149\208\157\208\175 \208\151\208\144\208\149\208\145\208\144\208\155 \208\175 \208\163\208\150\208\149 \208\146 \208\161\208\155\208\158\208\146\208\144\208\165 \208\159\208\163\208\162\208\144\208\174\208\161\208\172"
        }
    };
    if not victim or not lp or not v30 then
        return;
    else
        msg_revenge = {
            [1] = {
                [1] = "1", 
                [2] = "\209\130\208\184\208\188\208\181\208\185\209\130\209\139 \209\130\208\190\208\191\209\135\208\184\208\186"
            }, 
            [2] = {
                [1] = "\208\167\208\162\208\158\208\158", 
                [2] = "\208\162\208\152\208\156\208\149\208\153\208\162\208\171 \208\163\208\145\208\152\208\155\208\152 \208\149\208\147\208\158?????"
            }
        };
        if eui.talks:get("Kill") and lp == v30 and lp ~= victim then
            local v35 = msg_kill[utils.random_int(1, #msg_kill)];
            utils.console_exec("say " .. tostring(v35[1]));
            do
                local l_v35_0 = v35;
                utils.execute_after(1, function()
                    -- upvalues: l_v35_0 (ref)
                    utils.console_exec("say " .. tostring(l_v35_0[2]));
                end);
                name_killim = "";
            end;
        end;
        if eui.talks:get("Dead") and lp == victim and lp ~= v30 then
            local v37 = msg_dead[utils.random_int(1, #msg_dead)];
            utils.console_exec("say " .. tostring(v37[1]));
            do
                local l_v37_0 = v37;
                utils.execute_after(1, function()
                    -- upvalues: l_v37_0 (ref)
                    utils.console_exec("say " .. tostring(l_v37_0[2]));
                end);
                name_killim = v30:get_name();
            end;
        end;
        if eui.talks:get("Revenge") and victim:get_name() == name_killim then
            local v39 = msg_revenge[utils.random_int(1, #msg_revenge)];
            utils.console_exec("say " .. tostring(v39[1]));
            do
                local l_v39_0 = v39;
                utils.execute_after(1, function()
                    -- upvalues: l_v39_0 (ref)
                    utils.console_exec("say " .. tostring(l_v39_0[2]));
                end);
            end;
        end;
        return;
    end;
end;
for v41 = 1, #states do
    AntiAim_builder[v41] = {
        enable = builder:switch(shrt[v41] .. "enable", false), 
        pitch = builder:combo(shrt[v41] .. "pitch", {
            [1] = "Up", 
            [2] = "Down"
        }), 
        yawbase = builder:combo(shrt[v41] .. "yaw base", {
            [1] = "at crosshair", 
            [2] = "at target"
        }), 
        yaw = builder:slider(shrt[v41] .. "yaw", -180, 180, 0), 
        jitter = builder:switch(shrt[v41] .. "jitter enable", false), 
        jitter_t = builder:combo(shrt[v41] .. "jitter type", {
            [1] = "Center", 
            [2] = "Offset", 
            [3] = "Delay", 
            [4] = "3 way", 
            [5] = "5 way"
        }), 
        jitter_v = builder:slider(shrt[v41] .. "jitter value", -90, 90, 0), 
        jitter_d = builder:slider(shrt[v41] .. "jitter delay", 0, 20, 0), 
        jitter_dr = builder:switch(shrt[v41] .. "jitter delay random", false), 
        desync = builder:switch(shrt[v41] .. "desync enable", false), 
        desync_t = builder:combo(shrt[v41] .. "desync type", {
            [1] = "Jitter", 
            [2] = "Static"
        }), 
        desync_l = builder:slider(shrt[v41] .. "desync left", 0, 60, 0), 
        desync_r = builder:slider(shrt[v41] .. "desync right", 0, 60, 0), 
        desync_sink = builder:switch(shrt[v41] .. "desync synchronize", false, "synchronize desync jitter with jitter"), 
        defensive = builder:switch(shrt[v41] .. "defensive enable", false), 
        defensive_t = builder:combo(shrt[v41] .. "defensive trigger", {
            [1] = "Always On", 
            [2] = "On Peek"
        }), 
        defensive_pitch = builder:combo(shrt[v41] .. "defensive pitch", {
            [1] = "Up", 
            [2] = "Zero", 
            [3] = "Down", 
            [4] = "Spin", 
            [5] = "Better spin", 
            [6] = "Random", 
            [7] = "Half up", 
            [8] = "Half down", 
            [9] = "Custom"
        }), 
        defensive_speed_p = builder:slider(shrt[v41] .. "defensive speed", -10, 10, 0), 
        defensive_pitch1 = builder:slider(shrt[v41] .. "defensive custom pitch 1", -89, 89, 0), 
        defensive_pitch2 = builder:slider(shrt[v41] .. "defensive custom pitch 2", -89, 89, 0), 
        defensive_yaw = builder:combo(shrt[v41] .. "defensive yaw", {
            [1] = "Forward", 
            [2] = "Backward", 
            [3] = "Left", 
            [4] = "Right", 
            [5] = "Sideways", 
            [6] = "Spin", 
            [7] = "Better spin", 
            [8] = "Random", 
            [9] = "Custom"
        }), 
        defensive_speed_y = builder:slider(shrt[v41] .. "defensive speed", -10, 10, 0), 
        defensive_yaw1 = builder:slider(shrt[v41] .. "defensive custom yaw 1", -180, 180, 0), 
        defensive_yaw2 = builder:slider(shrt[v41] .. "defensive custom yaw 2", -180, 180, 0)
    };
    AntiAim_builder[v41].defme = AntiAim_builder[v41].jitter_dr:create():depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].jitter_dr
    });
    AntiAim_builder[v41].random_ticks = AntiAim_builder[v41].defme:slider(shrt[v41] .. "random ticks", 0, 20);
    AntiAim_builder[v41].random_ticks_mn = AntiAim_builder[v41].defme:slider(shrt[v41] .. "random min", 0, 20);
    AntiAim_builder[v41].random_ticks_mx = AntiAim_builder[v41].defme:slider(shrt[v41] .. "random max", 0, 20);
    AntiAim_builder[v41].enable:depend({
        [1] = eui.builders, 
        [2] = states[v41]
    });
    AntiAim_builder[v41].pitch:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    });
    AntiAim_builder[v41].yawbase:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    });
    AntiAim_builder[v41].yaw:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    });
    AntiAim_builder[v41].jitter:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    });
    AntiAim_builder[v41].jitter_t:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].jitter
    });
    AntiAim_builder[v41].jitter_v:depend({
        [1] = eui.builders, 
        [2] = states[v41]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].jitter
    });
    AntiAim_builder[v41].jitter_d:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].jitter
    }, {
        [1] = nil, 
        [2] = "Delay", 
        [1] = AntiAim_builder[v41].jitter_t
    });
    AntiAim_builder[v41].jitter_dr:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].jitter
    }, {
        [1] = nil, 
        [2] = "Delay", 
        [1] = AntiAim_builder[v41].jitter_t
    });
    AntiAim_builder[v41].desync:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    });
    AntiAim_builder[v41].desync_t:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].desync
    });
    AntiAim_builder[v41].desync_l:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].desync
    });
    AntiAim_builder[v41].desync_r:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].desync
    });
    AntiAim_builder[v41].desync_sink:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].desync
    }, {
        [1] = nil, 
        [2] = "Jitter", 
        [1] = AntiAim_builder[v41].desync_t
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].jitter
    });
    AntiAim_builder[v41].defensive:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    });
    AntiAim_builder[v41].defensive_t:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].defensive
    });
    AntiAim_builder[v41].defensive_pitch:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].defensive
    });
    AntiAim_builder[v41].defensive_speed_p:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].defensive
    }, {
        [1] = nil, 
        [2] = "Spin", 
        [3] = "Better spin", 
        [1] = AntiAim_builder[v41].defensive_pitch
    });
    AntiAim_builder[v41].defensive_pitch1:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].defensive
    }, {
        [1] = nil, 
        [2] = "Spin", 
        [3] = "Random", 
        [4] = "Custom", 
        [5] = "Better spin", 
        [1] = AntiAim_builder[v41].defensive_pitch
    });
    AntiAim_builder[v41].defensive_pitch2:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].defensive
    }, {
        [1] = nil, 
        [2] = "Spin", 
        [3] = "Random", 
        [4] = "Better spin", 
        [1] = AntiAim_builder[v41].defensive_pitch
    });
    AntiAim_builder[v41].defensive_yaw:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].defensive
    });
    AntiAim_builder[v41].defensive_speed_y:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].defensive
    }, {
        [1] = nil, 
        [2] = "Spin", 
        [3] = "Better spin", 
        [1] = AntiAim_builder[v41].defensive_yaw
    });
    AntiAim_builder[v41].defensive_yaw1:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].defensive
    }, {
        [1] = nil, 
        [2] = "Random", 
        [3] = "Custom", 
        [1] = AntiAim_builder[v41].defensive_yaw
    });
    AntiAim_builder[v41].defensive_yaw2:depend({
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].enable
    }, {
        [1] = eui.builders, 
        [2] = states[v41]
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = AntiAim_builder[v41].defensive
    }, {
        [1] = nil, 
        [2] = "Random", 
        [1] = AntiAim_builder[v41].defensive_yaw
    });
end;
eui.fakeflicks_mode:depend({
    [1] = nil, 
    [2] = true, 
    [1] = eui.fakeflicks
});
eui.fakeflicks_pitch:depend({
    [1] = nil, 
    [2] = "Customizable", 
    [1] = eui.fakeflicks_mode
}, {
    [1] = nil, 
    [2] = true, 
    [1] = eui.fakeflicks
});
eui.fakeflicks_speed:depend({
    [1] = nil, 
    [2] = "Customizable", 
    [1] = eui.fakeflicks_mode
}, {
    [1] = nil, 
    [2] = true, 
    [1] = eui.fakeflicks
});
eui.fakeflicks_yaw:depend({
    [1] = nil, 
    [2] = "Customizable", 
    [1] = eui.fakeflicks_mode
}, {
    [1] = nil, 
    [2] = true, 
    [1] = eui.fakeflicks
});
eui.fakeflicks_yaw2:depend({
    [1] = nil, 
    [2] = "Customizable", 
    [1] = eui.fakeflicks_mode
}, {
    [1] = nil, 
    [2] = true, 
    [1] = eui.fakeflicks
});
eui.fakeflicks_yaw_switch:depend({
    [1] = nil, 
    [2] = "Customizable", 
    [1] = eui.fakeflicks_mode
}, {
    [1] = nil, 
    [2] = true, 
    [1] = eui.fakeflicks
});
eui.builders:depend({
    [1] = nil, 
    [2] = "Anti-aim", 
    [1] = eui.selectbl
}, {
    [1] = nil, 
    [2] = "Builder", 
    [1] = eui.aas
});
builder:depend({
    [1] = nil, 
    [2] = "Anti-aim", 
    [1] = eui.selectbl
}, {
    [1] = nil, 
    [2] = "Builder", 
    [1] = eui.aas
});
other:depend({
    [1] = nil, 
    [2] = "Anti-aim", 
    [1] = eui.selectbl
}, {
    [1] = nil, 
    [2] = "Other", 
    [1] = eui.aas
});
visual:depend({
    [1] = nil, 
    [2] = "Visual", 
    [1] = eui.selectbl
});
misc:depend({
    [1] = nil, 
    [2] = "Misc", 
    [1] = eui.selectbl
});
eui.aas:depend({
    [1] = nil, 
    [2] = "Anti-aim", 
    [1] = eui.selectbl
});
cfgs:depend({
    [1] = nil, 
    [2] = "Configs", 
    [1] = eui.selectbl
});
main:depend({
    [1] = nil, 
    [2] = "Main page", 
    [1] = eui.selectbl
});
aspect_gr:depend({
    [1] = nil, 
    [2] = true, 
    [1] = eui.asp_a
});
hide:depend({
    [1] = nil, 
    [2] = "\208\157\209\131 \209\130\208\184\208\191\208\176 \208\178\209\139\208\186\208\187\209\142\209\135\208\181\208\189\208\189\208\190", 
    [1] = eui.selectbl
});
eui.style:depend({
    [1] = nil, 
    [2] = true, 
    [1] = eui.enable
}, {
    [1] = nil, 
    [2] = "Console", 
    [3] = "Screen", 
    [1] = eui.enabled
});
eui.accent_color:depend({
    [1] = nil, 
    [2] = true, 
    [1] = eui.enable
}, {
    [1] = nil, 
    [2] = "Console", 
    [3] = "Screen", 
    [1] = eui.enabled
});
eui.enabled:depend({
    [1] = nil, 
    [2] = true, 
    [1] = eui.enable
});
local v42 = 0;
curpitch = 0;
switchit = false;
desync_invert = false;
othermode = false;
curyaw = 0;
delay_tick = 0;
AAbuilder = function(v43)
    -- upvalues: v42 (ref)
    fakeflick(v43);
    if eui.fakeflicks:get() == true then
        get.pitch:set("Down");
        return;
    else
        get.anti_bs:set(eui.antibackstab:get());
        if is_safehead() == true then
            get.pitch:set("Down");
            get.yawoffset:set(22);
            get.desync:set(true);
            get.desync_inv:set(false);
            get.desync_l:set(globals.tickcount % 10 < 2 and 52 or 60);
            get.desync_r:set(globals.tickcount % 10 < 2 and 90 or 60);
            get.yawbase:set("At Target");
            return;
        else
            for v44 = 1, #states do
                if v44 == stateNumber then
                    local v45 = v44 == 9 and (eui.manuals:get() == "Left" and -90 - AntiAim_builder[v44].yaw:get() or (eui.manuals:get() == "Right" and 90 or 180) - AntiAim_builder[v44].yaw:get()) or AntiAim_builder[v44].yaw:get();
                    if exploits.InDefensive() == false or eui.unmatched_mode:get() == true then
                        get.pitch:set(AntiAim_builder[v44].pitch:get() == "Up" and "Fake Up" or "Down");
                        get.yawbase:set(AntiAim_builder[v44].yawbase:get() == "at crosshair" and "Local View" or "At Target");
                        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):set("Backward");
                        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):set("Disabled");
                        if AntiAim_builder[v44].jitter:get() then
                            if AntiAim_builder[v44].jitter_t:get() == "Center" then
                                if globals.tickcount % 4 < 2 then
                                    flag_exp();
                                end;
                                desync_invert = globals.tickcount % 4 < 2;
                                get.yawoffset:set((globals.tickcount % 4 < 2 and AntiAim_builder[v44].jitter_v:get() or -AntiAim_builder[v44].jitter_v:get()) + v45);
                            elseif AntiAim_builder[v44].jitter_t:get() == "Offset" then
                                if globals.tickcount % 4 < 2 then
                                    flag_exp();
                                end;
                                get.yawoffset:set((globals.tickcount % 4 < 2 and AntiAim_builder[v44].jitter_v:get() or 0) + v45);
                                desync_invert = globals.tickcount % 4 < 2;
                            elseif AntiAim_builder[v44].jitter_t:get() == "Delay" then
                                if AntiAim_builder[v44].jitter_dr:get() == true then
                                    delay_tick = globals.tickcount % 20 < AntiAim_builder[v44].random_ticks:get() and utils.random_int(AntiAim_builder[v44].random_ticks_mn:get(), AntiAim_builder[v44].random_ticks_mx:get()) or delay_tick;
                                else
                                    delay_tick = AntiAim_builder[v44].jitter_d:get();
                                end;
                                if v42 + delay_tick + 1 < globals.tickcount then
                                    v42 = globals.tickcount;
                                    switchit = not switchit;
                                end;
                                if switchit then
                                    flag_exp();
                                end;
                                desync_invert = switchit and true or false;
                                get.yawoffset:set((switchit and AntiAim_builder[v44].jitter_v:get() or -AntiAim_builder[v44].jitter_v:get()) + v45);
                            elseif AntiAim_builder[v44].jitter_t:get() == "3 way" then
                                if globals.tickcount % 8 < 2 then
                                    flag_exp();
                                    get.yawoffset:set(AntiAim_builder[v44].jitter_v:get() + v45);
                                elseif globals.tickcount % 8 > 6 then
                                    get.yawoffset:set(-AntiAim_builder[v44].jitter_v:get() + v45);
                                elseif globals.tickcount % 8 > 2 and globals.tickcount % 8 < 6 then
                                    flag_exp();
                                    get.yawoffset:set(v45);
                                end;
                            elseif AntiAim_builder[v44].jitter_t:get() == "5 way" then
                                if globals.tickcount % 10 < 2 then
                                    get.yawoffset:set(AntiAim_builder[v44].jitter_v:get() + v45);
                                elseif globals.tickcount % 10 > 8 then
                                    flag_exp();
                                    get.yawoffset:set(-AntiAim_builder[v44].jitter_v:get() + v45);
                                elseif globals.tickcount % 10 > 2 and globals.tickcount % 10 < 4 then
                                    get.yawoffset:set(v45);
                                elseif globals.tickcount % 10 > 4 and globals.tickcount % 10 < 6 then
                                    get.yawoffset:set(AntiAim_builder[v44].jitter_v:get() / 2 + v45);
                                elseif globals.tickcount % 10 > 6 and globals.tickcount % 10 < 8 then
                                    get.yawoffset:set(-AntiAim_builder[v44].jitter_v:get() / 2 + v45);
                                    flag_exp();
                                end;
                            end;
                        else
                            get.yawoffset:set(v45);
                        end;
                        if AntiAim_builder[v44].desync:get() then
                            get.desync:set(true);
                            get.desync_l:set(AntiAim_builder[v44].desync_l:get());
                            get.desync_r:set(AntiAim_builder[v44].desync_r:get());
                            if AntiAim_builder[v44].desync_sink:get() and AntiAim_builder[v44].jitter:get() and AntiAim_builder[v44].desync_t:get() == "Jitter" then
                                othermode = true;
                            else
                                othermode = false;
                            end;
                            if not othermode then
                                if AntiAim_builder[v44].desync_t:get() == "Jitter" then
                                    get.desync_opt:set("Jitter");
                                    get.desync_inv:override();
                                else
                                    get.desync_inv:set(false);
                                    get.desync_opt:set("");
                                    get.desync_inv:override();
                                end;
                            end;
                            if othermode then
                                get.desync_inv:override(desync_invert and true or false);
                                get.desync_opt:set("");
                            end;
                        else
                            get.desync:set(false);
                        end;
                    end;
                    if AntiAim_builder[v44].defensive:get() and eui.unmatched_mode:get() == false then
                        get.defdef:set(AntiAim_builder[v44].defensive:get());
                        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):set(AntiAim_builder[v44].defensive_t:get());
                        if exploits.InDefensive() then
                            get.desync_opt:set("");
                            get.desync_l:set(60);
                            get.desync_r:set(60);
                            if v44 ~= 9 then
                                get.yawoffset:override();
                                get.yawoffset:set(0);
                            end;
                            if v44 == 9 then
                                get.yawbase:set("Local View");
                            end;
                        end;
                        if AntiAim_builder[v44].defensive_pitch:get() == "Up" then
                            curpitch = -89;
                        elseif AntiAim_builder[v44].defensive_pitch:get() == "Zero" then
                            curpitch = 0;
                        elseif AntiAim_builder[v44].defensive_pitch:get() == "Down" then
                            curpitch = 89;
                        elseif AntiAim_builder[v44].defensive_pitch:get() == "Spin" then
                            if AntiAim_builder[v44].defensive_speed_p:get() > 0 then
                                curpitch = curpitch + AntiAim_builder[v44].defensive_speed_p:get();
                                if curpitch > AntiAim_builder[v44].defensive_pitch2:get() then
                                    curpitch = AntiAim_builder[v44].defensive_pitch1:get();
                                end;
                            elseif AntiAim_builder[v44].defensive_speed_p:get() < 0 then
                                curpitch = curpitch + AntiAim_builder[v44].defensive_speed_p:get();
                                if curpitch < AntiAim_builder[v44].defensive_pitch1:get() then
                                    curpitch = AntiAim_builder[v44].defensive_pitch2:get();
                                end;
                            end;
                        elseif AntiAim_builder[v44].defensive_pitch:get() == "Better spin" then
                            if globals.tickcount % 10 >= 7 then
                                if AntiAim_builder[v44].defensive_speed_p:get() > 0 then
                                    curpitch = curpitch + AntiAim_builder[v44].defensive_speed_p:get();
                                    if curpitch > AntiAim_builder[v44].defensive_pitch2:get() then
                                        curpitch = AntiAim_builder[v44].defensive_pitch1:get();
                                    end;
                                elseif AntiAim_builder[v44].defensive_speed_p:get() < 0 then
                                    curpitch = curpitch + AntiAim_builder[v44].defensive_speed_p:get();
                                    if curpitch < AntiAim_builder[v44].defensive_pitch1:get() then
                                        curpitch = AntiAim_builder[v44].defensive_pitch2:get();
                                    end;
                                end;
                            end;
                        elseif AntiAim_builder[v44].defensive_pitch:get() == "Random" then
                            curpitch = utils.random_int(AntiAim_builder[v44].defensive_pitch1:get(), AntiAim_builder[v44].defensive_pitch2:get());
                        elseif AntiAim_builder[v44].defensive_pitch:get() == "Half up" then
                            curpitch = -45;
                        elseif AntiAim_builder[v44].defensive_pitch:get() == "Half down" then
                            curpitch = 45;
                        elseif AntiAim_builder[v44].defensive_pitch:get() == "Custom" then
                            curpitch = AntiAim_builder[v44].defensive_pitch1:get();
                        end;
                        rage.antiaim:override_hidden_pitch(curpitch);
                        if AntiAim_builder[v44].defensive_yaw:get() == "Forward" then
                            rage.antiaim:override_hidden_yaw_offset(180);
                        elseif AntiAim_builder[v44].defensive_yaw:get() == "Backward" then
                            rage.antiaim:override_hidden_yaw_offset(0);
                        elseif AntiAim_builder[v44].defensive_yaw:get() == "Left" then
                            rage.antiaim:override_hidden_yaw_offset(90);
                        elseif AntiAim_builder[v44].defensive_yaw:get() == "Right" then
                            rage.antiaim:override_hidden_yaw_offset(-90);
                        elseif AntiAim_builder[v44].defensive_yaw:get() == "Sideways" then
                            rage.antiaim:override_hidden_yaw_offset(globals.tickcount % 20 < 10 and 90 or -90);
                        elseif AntiAim_builder[v44].defensive_yaw:get() == "Spin" then
                            curyaw = globals.tickcount * AntiAim_builder[v44].defensive_speed_y:get() * 4 / 3 % 360;
                        elseif AntiAim_builder[v44].defensive_yaw:get() == "Better spin" then
                            curyaw = globals.tickcount % 10 < 7 and curyaw or (curyaw + AntiAim_builder[v44].defensive_speed_y:get() * 2) % 360;
                            rage.antiaim:override_hidden_yaw_offset(curyaw);
                        elseif AntiAim_builder[v44].defensive_yaw:get() == "Random" then
                            rage.antiaim:override_hidden_yaw_offset(utils.random_int(AntiAim_builder[v44].defensive_yaw1:get(), AntiAim_builder[v44].defensive_yaw2:get()));
                        elseif AntiAim_builder[v44].defensive_yaw:get() == "Custom" then
                            rage.antiaim:override_hidden_yaw_offset(AntiAim_builder[v44].defensive_yaw1:get());
                        end;
                    else
                        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):set("On peek");
                    end;
                    if AntiAim_builder[v44].defensive:get() ~= true or eui.unmatched_mode:get() == true then
                        get.defdef:set(false);
                    end;
                end;
            end;
            return;
        end;
    end;
end;
math.lerp = function(v46, v47, v48)
    return v46 + (v47 - v46) * globals.absoluteframetime * v48;
end;
local v50 = {
    ntick = 0, 
    btick = 0, 
    current_state = 0, 
    simbol = 1, 
    clantag = function(v49)
        if eui.clantag:get() == false then
            return;
        else
            if globals.tickcount - v49.ntick > 1 then
                v49.ntick = globals.tickcount;
                v49.tag = {
                    [1] = "", 
                    [2] = "1", 
                    [3] = "A", 
                    [4] = "A1", 
                    [5] = "AA", 
                    [6] = "AA|", 
                    [7] = "AAI", 
                    [8] = "AAI ", 
                    [9] = "AAI 3", 
                    [10] = "AAI S", 
                    [11] = "AAI S7", 
                    [12] = "AAI SY", 
                    [13] = "AAI SY3", 
                    [14] = "AAI SYS", 
                    [15] = "AAI SYS1", 
                    [16] = "AAI SYST", 
                    [17] = "AAI SYST4", 
                    [18] = "AAI SYSTE", 
                    [19] = "AAI SYSTE_", 
                    [20] = "AAI SYSTEM", 
                    [21] = "AAI SYSTEM", 
                    speed = 10
                };
                if v49.btick + v49.tag.speed < v49.ntick then
                    v49.btick = v49.ntick;
                    v49.current_state = v49.current_state + v49.simbol;
                    if v49.current_state > #v49.tag - 1 then
                        v49.simbol = -1;
                    end;
                    if v49.current_state < 2 then
                        v49.simbol = 1;
                    end;
                    common.set_clan_tag(v49.tag[v49.current_state]);
                end;
            end;
            return;
        end;
    end
};
local v51 = 0;
scop_anim = function()
    -- upvalues: v51 (ref)
    if not eui.ui:get("Indicators") or entity.get_local_player() == nil then
        return;
    else
        is_scoped = entity.get_local_player().m_bIsScoped;
        if is_scoped and v51 < 35 then
            v51 = v51 + 0.1;
        elseif not is_scoped and v51 > 0 then
            v51 = v51 - 0.1;
        end;
        return v51;
    end;
end;
screen = {
    [1] = render.screen_size().x, 
    [2] = render.screen_size().y
};
indicators = function()
    -- upvalues: l_gradient_0 (ref), v28 (ref)
    if not eui.ui:get("Indicators") or entity.get_local_player() == nil then
        return;
    else
        is_scoped = entity.get_local_player().m_bIsScoped;
        position = {
            [1] = render.screen_size().x / 2 - 28, 
            [2] = render.screen_size().y / 2 + 30
        };
        text2 = entity.get_local_player() ~= nil and eui.fakeflicks:get() and exploits.InDefensive() and "flicking" or eui.fakeflicks:get() and "charging" or "disabled";
        gradient_text2 = l_gradient_0.text_animate("AAI SYSTEM", -2, {
            color(0, 0, 0), 
            color()
        });
        gd2text = l_gradient_0.text_animate("[" .. stateName .. "]", -2.5, {
            color(150, 150, 150), 
            color()
        });
        betteranim = l_gradient_0.text_animate(text2, -7, {
            color(0, 255, 0), 
            color()
        });
        render.text(3, vector(position[1] - 5 + scop_anim(), position[2]), color(1, 1, 255), "", "" .. gradient_text2:get_animated_text());
        render.text(3, vector(position[1] + 30 + scop_anim() * render.measure_text(3, gd2text:get_animated_text(), gd2text:get_animated_text()).x / 70 - render.measure_text(3, gd2text:get_animated_text(), gd2text:get_animated_text()).x / 2, position[2] + 10), color(1, 1, 255), "", gd2text:get_animated_text());
        render.text(3, vector(position[1] - 30 + scop_anim() * 1.7, position[2] + 20), color(255, 255, 255), "", "FAKE FLICKS " .. betteranim:get_animated_text());
        render.text(3, vector(position[1] - 7 + scop_anim(), position[2] + 30), color(v28:is_dt()), "", "DT");
        render.text(3, vector(position[1] + 10 + scop_anim(), position[2] + 30), color(255, 255, 255, v28:is_hs()), "", "HS");
        render.text(3, vector(position[1] + 27 + scop_anim(), position[2] + 30), color(255, 255, 255, v28:is_fs()), "", "FS");
        render.text(3, vector(position[1] + 42 + scop_anim(), position[2] + 30), color(255, 255, 255, v28:is_ap()), "", "AP");
        render.text(3, vector(position[1] + 59 + scop_anim(), position[2] + 30), color(255, 255, 255, v28:is_fd()), "", "FD");
        gradient_text2:animate();
        gd2text:animate();
        betteranim:animate();
        return;
    end;
end;
render.log("Welcome back " .. common.get_username(), 2);
utils.execute_after(1, function()
    render.log("This is a " .. cbuild .. " build", 2);
end);
local _ = "";
local v53 = eui.accent_color:get();
local l_r_0 = eui.accent_color:get().r;
local l_g_0 = eui.accent_color:get().g;
local l_b_0 = eui.accent_color:get().b;
local l_a_0 = eui.accent_color:get().a;
local v58 = eui.accent_color:get():to_hex();
hitboxes = {
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
updateicon = function()
    -- upvalues: l_gradient_0 (ref), l_r_0 (ref), l_g_0 (ref), l_b_0 (ref)
    gdtext = l_gradient_0.text_animate("\240\157\153\176\240\157\153\176\240\157\153\184 \240\157\154\130\240\157\154\136\240\157\154\130\240\157\154\131\240\157\153\180\240\157\153\188", -1, {
        color(0, 0, 0), 
        color(l_r_0, l_g_0, l_b_0), 
        color(0, 0, 0), 
        color(0, 0, 0), 
        color(0, 0, 0), 
        color(0, 0, 0)
    });
    ui.sidebar(gdtext:get_animated_text(), "\240\159\142\129");
    gdtext:animate();
end;
func = {
    aspectratio = function(_)
        if eui.asp_a:get() == false then
            return;
        else
            cvar.r_aspectratio:float(eui.asp:get() / 20);
            return;
        end;
    end, 
    cstate = function(_)
        local l_m_vecVelocity_0 = entity.get_local_player().m_vecVelocity;
        local v62 = math.vec_length2d(l_m_vecVelocity_0);
        local l_m_fFlags_0 = entity.get_local_player().m_fFlags;
        if not l_m_vecVelocity_0 or not v62 or not l_m_fFlags_0 then
            return;
        else
            local v64 = bit.lshift(1, 1);
            local v65 = bit.lshift(1, 0);
            if eui.manuals:get() == "None" then
                if bit.band(l_m_fFlags_0, v65) == 1 and v62 > 80 and bit.band(l_m_fFlags_0, v64) == 0 then
                    groundticks = groundticks + 1;
                    if groundticks < 4 then
                        return;
                    elseif AntiAim_builder[3].enable:get() == true then
                        stateNumber = 3;
                        stateName = "Moving";
                    else
                        stateNumber = 1;
                        stateName = "Global";
                    end;
                end;
                if bit.band(l_m_fFlags_0, v65) == 0 and bit.band(l_m_fFlags_0, v64) == 0 then
                    groundticks = 0;
                    can_safe = false;
                    if AntiAim_builder[7].enable:get() == true then
                        stateName = "Air";
                        stateNumber = 7;
                    else
                        stateNumber = 1;
                        stateName = "Global";
                    end;
                end;
                if bit.band(l_m_fFlags_0, v65) == 0 and bit.band(l_m_fFlags_0, v64) > 0.9 then
                    groundticks = 0;
                    can_safe = true;
                    if AntiAim_builder[8].enable:get() == true then
                        stateNumber = 8;
                        stateName = "Air+";
                    else
                        stateNumber = 1;
                        stateName = "Global";
                    end;
                end;
                if bit.band(l_m_fFlags_0, v65) == 1 and v62 < 3 and bit.band(l_m_fFlags_0, v64) == 0 then
                    groundticks = groundticks + 1;
                    if groundticks < 4 then
                        return;
                    elseif AntiAim_builder[2].enable:get() == true then
                        stateNumber = 2;
                        stateName = "Standing";
                    else
                        stateNumber = 1;
                        stateName = "Global";
                    end;
                end;
                if get.slwlk:get() then
                    groundticks = groundticks + 1;
                    if groundticks < 4 then
                        return;
                    elseif AntiAim_builder[4].enable:get() == true then
                        stateNumber = 4;
                        stateName = "Slow motion";
                    else
                        stateNumber = 1;
                        stateName = "Global";
                    end;
                end;
                if bit.band(l_m_fFlags_0, v65) == 1 and bit.band(l_m_fFlags_0, v64) > 0.9 and v62 < 15 then
                    groundticks = groundticks + 1;
                    if groundticks < 4 then
                        return;
                    elseif AntiAim_builder[5].enable:get() == true then
                        stateNumber = 5;
                        stateName = "Crouching";
                    else
                        stateNumber = 1;
                        stateName = "Global";
                    end;
                end;
                if bit.band(l_m_fFlags_0, v65) == 1 and bit.band(l_m_fFlags_0, v64) > 0.9 and v62 > 15 then
                    groundticks = groundticks + 1;
                    if groundticks < 4 then
                        return;
                    elseif AntiAim_builder[6].enable:get() == true then
                        stateNumber = 6;
                        stateName = "Crouching move";
                    else
                        stateNumber = 1;
                        stateName = "Global";
                    end;
                end;
            end;
            if eui.manuals:get() == "Left" or eui.manuals:get() == "Right" or eui.manuals:get() == "Forward" then
                stateNumber = 9;
                stateName = "Manual";
            end;
            return;
        end;
    end, 
    paint = function()
        AntiAim_builder[9].enable:set(true);
        AntiAim_builder[9].enable:disabled(true);
        AntiAim_builder[1].enable:set(true);
        AntiAim_builder[1].enable:disabled(true);
    end, 
    hitlogs = function(_, v67)
        -- upvalues: v53 (ref)
        if not eui.enabled:get("Console") then
            return;
        else
            if v67.state == nil then
                local v68 = entity.get(v67.target, true);
                attacker = entity.get(v67.attacker, true);
                victim = entity.get(v67.userid, true);
                localplayer = entity.get_local_player();
                hitet = hitboxes[v67.hitgroup];
                wanted = hitboxes[v67.hitgroup] ~= hitboxes[v67.wanted_hitgroup] and "(" .. hitboxes[v67.wanted_hitgroup] .. ")" or "";
                cprint(string.format("[AAI] hit in the " .. v68:get_name() .. " for " .. v67.damage .. "hp in " .. hitet .. " " .. wanted .. " with backtrack " .. v67.backtrack .. "t\n"), v53);
                print_dev(string.format("[AAI] hit in the " .. v68:get_name() .. " for " .. v67.damage .. "hp in " .. hitet .. " " .. wanted .. " with backtrack " .. v67.backtrack .. "t"));
            end;
            return;
        end;
    end, 
    misslogs = function(_, v70)
        -- upvalues: v53 (ref)
        if not eui.enabled:get("Console") then
            return;
        else
            if v70.state ~= nil then
                local v71 = entity.get(v70.target, true);
                attacker = entity.get(v70.attacker, true);
                victim = entity.get(v70.userid, true);
                localplayer = entity.get_local_player();
                wanted = hitboxes[v70.wanted_hitgroup];
                cprint(string.format("[AAI] missed in the " .. v71:get_name() .. " due to " .. v70.state .. " aimed in " .. wanted .. " with backtrack " .. v70.backtrack .. "t\n"), v53);
                print_dev(string.format("[AAI] missed in the " .. v71:get_name() .. " due to " .. v70.state .. " aimed in " .. wanted .. " with backtrack " .. v70.backtrack .. "t"));
            end;
            return;
        end;
    end, 
    hurtlogs = function(_, v73)
        -- upvalues: v53 (ref)
        if not eui.enabled:get("Console") then
            return;
        else
            local v74 = entity.get(v73.attacker, true);
            victim = entity.get(v73.userid, true);
            localplayer = entity.get_local_player();
            hitet = hitboxes[v73.hitgroup];
            if victim == localplayer and localplayer ~= v74 then
                cprint(string.format("[AAI] hurted by " .. v74:get_name() .. " for " .. v73.dmg_health .. "hp in " .. hitet .. "\n"), v53);
            end;
            return;
        end;
    end, 
    screenlogs = function(v75, v76)
        -- upvalues: v58 (ref)
        local v77 = entity.get(v76.target, true);
        attacker = entity.get(v76.attacker, true);
        victim = entity.get(v76.userid, true);
        localplayer = entity.get_local_player();
        hitet = hitboxes[v76.hitgroup];
        if v76.state == nil then
            wanted = hitet ~= hitboxes[v76.wanted_hitgroup] and "(" .. hitboxes[v76.wanted_hitgroup] .. ")" or "(ok)";
            v75.msg = string.format("[AAI] hit in the \a" .. v58 .. "" .. v77:get_name() .. "\afffffffc for \a" .. v58 .. "" .. v76.damage .. "hp\afffffffc in \a" .. v58 .. "" .. hitet .. " " .. wanted .. "\afffffffc with backtrack \a" .. v58 .. "" .. v76.backtrack .. "t");
        else
            wanted = hitboxes[v76.wanted_hitgroup];
            v75.msg = string.format("[AAI] missed in the \a" .. v58 .. "" .. v77:get_name() .. "\afffffffc due to \a" .. v58 .. "" .. v76.state .. "\afffffffc aimed in \a" .. v58 .. "" .. wanted .. "\afffffffc with backtrack \a" .. v58 .. "" .. v76.backtrack .. "t");
        end;
        if eui.enabled:get("Screen") then
            render.log(v75.msg, eui.style:get());
        end;
    end, 
    screenlogs_hurt = function(v78, v79)
        -- upvalues: v58 (ref)
        local v80 = entity.get(v79.attacker, true);
        victim = entity.get(v79.userid, true);
        localplayer = entity.get_local_player();
        hitet = hitboxes[v79.hitgroup];
        if v80 == localplayer or localplayer ~= victim or not eui.enabled:get("Screen") then
            return;
        else
            v78.msg = string.format("[AAI] \a" .. v58 .. "hurted\afffffffc by \a" .. v58 .. "" .. v80:get_name() .. "\afffffffc for \a" .. v58 .. "" .. v79.dmg_health .. "hp\afffffffc in \a" .. v58 .. "" .. hitet);
            render.log(v78.msg, eui.style:get());
            return;
        end;
    end, 
    logs_render = function(_)
        -- upvalues: v53 (ref), l_r_0 (ref), l_g_0 (ref), l_b_0 (ref), l_a_0 (ref), v58 (ref)
        local v82 = eui.accent_color:get();
        local l_r_1 = eui.accent_color:get().r;
        local l_g_1 = eui.accent_color:get().g;
        local l_b_1 = eui.accent_color:get().b;
        local l_a_1 = eui.accent_color:get().a;
        v58 = eui.accent_color:get():to_hex();
        l_a_0 = l_a_1;
        l_b_0 = l_b_1;
        l_g_0 = l_g_1;
        l_r_0 = l_r_1;
        v53 = v82;
        v82 = render.screen_size().x;
        l_r_1 = render.screen_size().y;
        l_g_1 = 0;
        l_b_1 = screen[1] / 2;
        l_a_1 = screen[2] / 1.4;
        if #request_print < 1 then
            return;
        else
            for v87 = 1, #request_print do
                if request_print[v87] == nil then
                    return;
                else
                    if globals.curtime / 2 * 2 - request_print[v87][3] < 4 and (#request_print <= 5 or v87 >= #request_print - 5) then
                        request_print[v87][2] = math.lerp(request_print[v87][2], 255, 10);
                    else
                        request_print[v87][2] = math.lerp(request_print[v87][2], 0, 10);
                    end;
                    local l_x_0 = render.measure_text(1, request_print[v87][1], request_print[v87][1]).x;
                    text_sise_y = render.measure_text(1, request_print[v87][1], request_print[v87][1]).y;
                    text_size_x = l_x_0;
                    l_g_1 = l_g_1 - 34 * (request_print[v87][2] / 255);
                    if request_print[v87][4] == 1 then
                        render.rect(vector(l_b_1 - 5 - text_size_x / 2, l_a_1 - l_g_1 + text_sise_y + 5), vector(l_b_1 + 5 + text_size_x / 2, l_a_1 - l_g_1 - text_sise_y / 2), color(l_r_0, l_g_0, l_b_0, request_print[v87][2]), 7, true);
                        render.rect(vector(l_b_1 - 4 - text_size_x / 2, l_a_1 - l_g_1 + text_sise_y + 5), vector(l_b_1 + 4 + text_size_x / 2, l_a_1 - l_g_1 - text_sise_y / 2), color(0, 0, 0, request_print[v87][2]), 7, true);
                    elseif request_print[v87][4] == 2 then
                        render.rect(vector(l_b_1 - 5 - text_size_x / 2, l_a_1 - l_g_1 + text_sise_y + 7), vector(l_b_1 + 5 + text_size_x / 2, l_a_1 - l_g_1 - text_sise_y / 2 - 2), color(20, 20, 20, request_print[v87][2]), 0, true);
                        render.rect(vector(l_b_1 - 3 - text_size_x / 2, l_a_1 - l_g_1 + text_sise_y + 5), vector(l_b_1 + 3 + text_size_x / 2, l_a_1 - l_g_1 - text_sise_y / 2), color(0, 0, 0, request_print[v87][2]), 0, true);
                    elseif request_print[v87][4] == 3 or request_print[v87][4] == 4 then

                    end;
                    render.text(1, vector(l_b_1 - 1 - text_size_x / 2, l_a_1 - l_g_1 - 1), color(255, 255, 255, request_print[v87][2]), nil, request_print[v87][1]);
                    if request_print[v87][2] < 0.1 or not entity.get_local_player() then
                        table.remove(request_print, v87);
                    end;
                end;
            end;
            return;
        end;
    end
};
events.render:set(function()
    -- upvalues: v42 (ref), v50 (ref)
    func:logs_render();
    func:paint();
    func:aspectratio();
    indicators();
    updateicon();
    if not globals.is_in_game then
        v42 = 0;
        return;
    else
        v50:clantag();
        return;
    end;
end);
events.aim_ack:set(function(v89)
    if not eui.enable:get() then
        return;
    else
        func:hitlogs(v89);
        func:misslogs(v89);
        func:screenlogs(v89);
        return;
    end;
end);
events.player_hurt:set(function(v90)
    if not eui.enable:get() then
        return;
    else
        func:screenlogs_hurt(v90);
        func:hurtlogs(v90);
        return;
    end;
end);
events.player_death:set(function(v91)
    trashtalk(v91);
end);
events.createmove:set(function(v92)
    -- upvalues: v42 (ref)
    func:cstate();
    AAbuilder(v92);
    jumpscout();
    if entity.get_local_player():is_alive() == false then
        v42 = 0;
    end;
end);
events.round_end:set(function()
    name_killim = "";
end);