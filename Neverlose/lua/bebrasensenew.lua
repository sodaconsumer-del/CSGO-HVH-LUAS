local l_pui_0 = require("neverlose/pui");
local v1 = 0;
local v2 = 0;
local v3 = ffi.load("Shell32");
local v4 = false;
ffi.cdef("    void* __stdcall ShellExecuteA(void* hwnd, const char* op, const char* file, const char* params, const char* dir, int show_cmd);\n    bool CreateDirectoryA(const char* lpPathName, void* lpSecurityAttributes);\n    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n    void* __stdcall ShellExecuteA(void* hwnd, const char* op, const char* file, const char* params, const char* dir, int show_cmd);\n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n");
local function v8(v5, v6, v7)
    return v5 + (v6 - v5) * v7;
end;
local l_liberia_0 = require("neverlose/liberia");
local l_clipboard_0 = require("neverlose/clipboard");
local l_lambotruck_0 = require("neverlose/lambotruck");
local l_base64_0 = require("neverlose/base64");
local l_monylinear_0 = require("neverlose/monylinear");
local l_smooth_0 = require("neverlose/smooth");
local _ = ffi.load("UrlMon");
local _ = ffi.load("WinInet");
local v17 = render.screen_size();
local _ = render.load_font("Verdana", vector(7, 10, 1), "a");
local v19 = render.load_font("Verdana", vector(20, 12, 3), "a");
info_groups = {
    home = {
        Main_select_all = l_pui_0.create("\238\131\140 Main", "\238\128\175 Information", 1), 
        Main_select_info = l_pui_0.create("\238\131\140 Main", "Other", 2), 
        Main_select_links = l_pui_0.create("\238\131\140 Main", "\239\131\129 Recomendations", 1)
    }
};
local function v20()
    -- upvalues: v3 (ref)
    v3.ShellExecuteA(nil, "open", "https://discord.gg/ThVZuxWFuu", nil, nil, 1);
end;
local function v21()
    -- upvalues: v3 (ref)
    v3.ShellExecuteA(nil, "open", "https://neverlose.cc/market/item?id=kmsDv8", nil, nil, 1);
end;
local function v22()
    -- upvalues: v3 (ref)
    v3.ShellExecuteA(nil, "open", "https://www.youtube.com/channel/UC9mPynuRjckv4eVuA6Bu4Mw", nil, nil, 1);
end;
local v23 = "\a4C65CFAA" .. "ALPHA";
local v24 = "\a4C65CFAA" .. "17.02.2025";
local v25 = "\a4C65CFAA" .. common.get_username();
info_label = info_groups.home.Main_select_all:label(ui.get_icon("user-secret") .. " UserName: " .. v25);
info_label1 = info_groups.home.Main_select_all:label(ui.get_icon("wrench") .. " State: " .. v23);
info_label2 = info_groups.home.Main_select_all:label(ui.get_icon("list") .. " Last Update  " .. v24);
discord = info_groups.home.Main_select_links:button("\239\142\146 Discord", v20, true);
cfg = info_groups.home.Main_select_links:button("\239\130\133 Config", v21, true);
yt = info_groups.home.Main_select_links:button("\239\133\167 Youtube", v22, true);
watermark_position = info_groups.home.Main_select_info:combo("Watermark position", "Bottom", "Upper-left", "Upper-right");
load_def = info_groups.home.Main_select_info:button("                  \239\139\146 Load Wishenzz Config                   ", function()
    -- upvalues: l_clipboard_0 (ref), l_pui_0 (ref), l_base64_0 (ref)
    local _ = l_clipboard_0.get();
    l_pui_0.load(json.parse(l_base64_0.decode("eyJjb25kaXRpb25zIjp7ImJvZHlfeWF3Ijp7IkFpciI6dHJ1ZSwiQWlyIENyb3VjaCBDVCI6dHJ1ZSwiQWlyIENyb3VjaCBUIjp0cnVlLCJDcm91Y2ggQ1QiOnRydWUsIkNyb3VjaCBNb3ZlIENUIjp0cnVlLCJDcm91Y2ggTW92ZSBUIjp0cnVlLCJDcm91Y2ggVCI6dHJ1ZSwiTW92aW5nIjp0cnVlLCJTdGFuZGluZyI6dHJ1ZX0sImJvZHlfeWF3MiI6eyJBaXIiOmZhbHNlLCJBaXIgQ3JvdWNoIENUIjpmYWxzZSwiQWlyIENyb3VjaCBUIjpmYWxzZSwiQ3JvdWNoIENUIjpmYWxzZSwiQ3JvdWNoIE1vdmUgQ1QiOmZhbHNlLCJDcm91Y2ggTW92ZSBUIjpmYWxzZSwiQ3JvdWNoIFQiOmZhbHNlLCJNb3ZpbmciOmZhbHNlLCJTdGFuZGluZyI6ZmFsc2V9LCJib2R5X3lhd19qaXR0ZXIiOnsiQWlyIjp0cnVlLCJBaXIgQ3JvdWNoIENUIjp0cnVlLCJBaXIgQ3JvdWNoIFQiOnRydWUsIkNyb3VjaCBDVCI6dHJ1ZSwiQ3JvdWNoIE1vdmUgQ1QiOnRydWUsIkNyb3VjaCBNb3ZlIFQiOnRydWUsIkNyb3VjaCBUIjp0cnVlLCJNb3ZpbmciOnRydWUsIlN0YW5kaW5nIjp0cnVlfSwiYm9keV95YXdfbGVmdGxpbWl0Ijp7IkFpciI6NjAuMCwiQWlyIENyb3VjaCBDVCI6MzguMCwiQWlyIENyb3VjaCBUIjo0MS4wLCJDcm91Y2ggQ1QiOjYwLjAsIkNyb3VjaCBNb3ZlIENUIjo2MC4wLCJDcm91Y2ggTW92ZSBUIjo2MC4wLCJDcm91Y2ggVCI6NjAuMCwiTW92aW5nIjo2MC4wLCJTdGFuZGluZyI6NTEuMH0sImJvZHlfeWF3X3JpZ2h0bGltaXQiOnsiQWlyIjo2MC4wLCJBaXIgQ3JvdWNoIENUIjozNy4wLCJBaXIgQ3JvdWNoIFQiOjQ0LjAsIkNyb3VjaCBDVCI6NjAuMCwiQ3JvdWNoIE1vdmUgQ1QiOjYwLjAsIkNyb3VjaCBNb3ZlIFQiOjYwLjAsIkNyb3VjaCBUIjo2MC4wLCJNb3ZpbmciOjYwLjAsIlN0YW5kaW5nIjo0OC4wfSwiZGVmZW5zaXZlX2ZlYXR1cmUiOnsiQWlyIjoxLjAsIkFpciBDcm91Y2ggQ1QiOjQuMCwiQWlyIENyb3VjaCBUIjoyLjAsIkNyb3VjaCBDVCI6My4wLCJDcm91Y2ggTW92ZSBDVCI6My4wLCJDcm91Y2ggTW92ZSBUIjozLjAsIkNyb3VjaCBUIjo0LjAsIk1vdmluZyI6My4wLCJTdGFuZGluZyI6NC4wfSwiZGVmZW5zaXZlX3BpdGNoIjp7IkFpciI6ZmFsc2UsIkFpciBDcm91Y2ggQ1QiOmZhbHNlLCJBaXIgQ3JvdWNoIFQiOmZhbHNlLCJDcm91Y2ggQ1QiOmZhbHNlLCJDcm91Y2ggTW92ZSBDVCI6ZmFsc2UsIkNyb3VjaCBNb3ZlIFQiOmZhbHNlLCJDcm91Y2ggVCI6ZmFsc2UsIk1vdmluZyI6ZmFsc2UsIlN0YW5kaW5nIjpmYWxzZX0sImRlZmVuc2l2ZWZlYXR1cmVfY3VzdG9tIjp7IkFpciI6MS4wLCJBaXIgQ3JvdWNoIENUIjo1MC4wLCJBaXIgQ3JvdWNoIFQiOjI0LjAsIkNyb3VjaCBDVCI6NzYuMCwiQ3JvdWNoIE1vdmUgQ1QiOjcyLjAsIkNyb3VjaCBNb3ZlIFQiOjc2LjAsIkNyb3VjaCBUIjo1My4wLCJNb3ZpbmciOjY4LjAsIlN0YW5kaW5nIjo0Mi4wfSwiZGVmZW5zaXZlZmVhdHVyZV9jdXN0b20yIjp7IkFpciI6Mi4wLCJBaXIgQ3JvdWNoIENUIjozMi4wLCJBaXIgQ3JvdWNoIFQiOjM3LjAsIkNyb3VjaCBDVCI6MTguMCwiQ3JvdWNoIE1vdmUgQ1QiOjM2LjAsIkNyb3VjaCBNb3ZlIFQiOjQxLjAsIkNyb3VjaCBUIjozNS4wLCJNb3ZpbmciOjM3LjAsIlN0YW5kaW5nIjoyMC4wfSwiZGVsYXlfaml0dGVyIjp7IkFpciI6MTIuMCwiQWlyIENyb3VjaCBDVCI6NTMuMCwiQWlyIENyb3VjaCBUIjo1OS4wLCJDcm91Y2ggQ1QiOjU4LjAsIkNyb3VjaCBNb3ZlIENUIjoxMy4wLCJDcm91Y2ggTW92ZSBUIjozOS4wLCJDcm91Y2ggVCI6MzMuMCwiTW92aW5nIjo2MS4wLCJTdGFuZGluZyI6MjMuMH0sImRlbGF5X2ppdHRlcl9mYWtlbGFnIjp7IkFpciI6ZmFsc2UsIkFpciBDcm91Y2ggQ1QiOmZhbHNlLCJBaXIgQ3JvdWNoIFQiOmZhbHNlLCJDcm91Y2ggQ1QiOnRydWUsIkNyb3VjaCBNb3ZlIENUIjp0cnVlLCJDcm91Y2ggTW92ZSBUIjp0cnVlLCJDcm91Y2ggVCI6dHJ1ZSwiTW92aW5nIjpmYWxzZSwiU3RhbmRpbmciOnRydWV9LCJkZWxheV9qaXR0ZXJfZmFrZWxhZ19mZWF0dXJlIjp7IkFpciI6MS4wLCJBaXIgQ3JvdWNoIENUIjoxLjAsIkFpciBDcm91Y2ggVCI6MS4wLCJDcm91Y2ggQ1QiOjMuMCwiQ3JvdWNoIE1vdmUgQ1QiOjEuMCwiQ3JvdWNoIE1vdmUgVCI6My4wLCJDcm91Y2ggVCI6My4wLCJNb3ZpbmciOjEuMCwiU3RhbmRpbmciOjMuMH0sImRlbGF5X2ppdHRlcl92YWx1ZSI6eyJBaXIiOjIyLjAsIkFpciBDcm91Y2ggQ1QiOjM2LjAsIkFpciBDcm91Y2ggVCI6NDUuMCwiQ3JvdWNoIENUIjoyNi4wLCJDcm91Y2ggTW92ZSBDVCI6OS4wLCJDcm91Y2ggTW92ZSBUIjoxOC4wLCJDcm91Y2ggVCI6OC4wLCJNb3ZpbmciOjQ0LjAsIlN0YW5kaW5nIjoyNi4wfSwiZGVzeW5jX2Zha2VsYWciOnsiQWlyIjpmYWxzZSwiQWlyIENyb3VjaCBDVCI6ZmFsc2UsIkFpciBDcm91Y2ggVCI6ZmFsc2UsIkNyb3VjaCBDVCI6ZmFsc2UsIkNyb3VjaCBNb3ZlIENUIjpmYWxzZSwiQ3JvdWNoIE1vdmUgVCI6ZmFsc2UsIkNyb3VjaCBUIjpmYWxzZSwiTW92aW5nIjpmYWxzZSwiU3RhbmRpbmciOmZhbHNlfSwicHJvZ3Jlc3NpdmVfeWF3Ijp7IkFpciI6Ni4wLCJBaXIgQ3JvdWNoIENUIjo3LjAsIkFpciBDcm91Y2ggVCI6MTIuMCwiQ3JvdWNoIENUIjoxLjAsIkNyb3VjaCBNb3ZlIENUIjoxMS4wLCJDcm91Y2ggTW92ZSBUIjoxLjAsIkNyb3VjaCBUIjo2LjAsIk1vdmluZyI6MS4wLCJTdGFuZGluZyI6MS4wfSwicmVmcyI6eyJBaXIiOlsxLjAsMi4wLDMuMCw0LjAsIn4iXSwiQWlyIENyb3VjaCBDVCI6WzEuMCwyLjAsMy4wLDQuMCwifiJdLCJBaXIgQ3JvdWNoIFQiOlsxLjAsMi4wLDMuMCwifiJdLCJDcm91Y2ggQ1QiOlsxLjAsMi4wLDMuMCw0LjAsIn4iXSwiQ3JvdWNoIE1vdmUgQ1QiOlsxLjAsMi4wLDMuMCw0LjAsIn4iXSwiQ3JvdWNoIE1vdmUgVCI6WzEuMCwyLjAsMy4wLCJ+Il0sIkNyb3VjaCBUIjpbMS4wLDIuMCwzLjAsNC4wLCJ+Il0sIk1vdmluZyI6WzEuMCwyLjAsMy4wLDQuMCwifiJdLCJTdGFuZGluZyI6WzEuMCwyLjAsMy4wLCJ+Il19LCJzYWZlX2hlYWQiOnsiQWlyIjpbIn4iXSwiQWlyIENyb3VjaCBDVCI6WyJ+Il0sIkFpciBDcm91Y2ggVCI6WyJ+Il0sIkNyb3VjaCBDVCI6WyJ+Il0sIkNyb3VjaCBNb3ZlIENUIjpbIn4iXSwiQ3JvdWNoIE1vdmUgVCI6WyJ+Il0sIkNyb3VjaCBUIjpbIn4iXSwiTW92aW5nIjpbIn4iXSwiU3RhbmRpbmciOlsifiJdfSwidG9sZXJhbnRfeWF3Ijp7IkFpciI6MS4wLCJBaXIgQ3JvdWNoIENUIjoxLjAsIkFpciBDcm91Y2ggVCI6MS4wLCJDcm91Y2ggQ1QiOjEuMCwiQ3JvdWNoIE1vdmUgQ1QiOjEuMCwiQ3JvdWNoIE1vdmUgVCI6MS4wLCJDcm91Y2ggVCI6MS4wLCJNb3ZpbmciOjQuMCwiU3RhbmRpbmciOjEuMH0sInlhd19sZWZ0Ijp7IkFpciI6Ny4wLCJBaXIgQ3JvdWNoIENUIjotMTUuMCwiQWlyIENyb3VjaCBUIjotMTcuMCwiQ3JvdWNoIENUIjotMjYuMCwiQ3JvdWNoIE1vdmUgQ1QiOi0zNi4wLCJDcm91Y2ggTW92ZSBUIjotMzEuMCwiQ3JvdWNoIFQiOi00MS4wLCJNb3ZpbmciOi0yNi4wLCJTdGFuZGluZyI6LTE1LjB9LCJ5YXdfcmlnaHQiOnsiQWlyIjo3LjAsIkFpciBDcm91Y2ggQ1QiOjM2LjAsIkFpciBDcm91Y2ggVCI6NDEuMCwiQ3JvdWNoIENUIjozNi4wLCJDcm91Y2ggTW92ZSBDVCI6NDYuMCwiQ3JvdWNoIE1vdmUgVCI6MzEuMCwiQ3JvdWNoIFQiOjM2LjAsIk1vdmluZyI6MzYuMCwiU3RhbmRpbmciOjQxLjB9LCJ5YXdfdHlwZXMiOnsiQWlyIjoiUHJvZ3Jlc3NpdmUiLCJBaXIgQ3JvdWNoIENUIjoiUHJvZ3Jlc3NpdmUiLCJBaXIgQ3JvdWNoIFQiOiJQcm9ncmVzc2l2ZSIsIkNyb3VjaCBDVCI6IlByb2dyZXNzaXZlIiwiQ3JvdWNoIE1vdmUgQ1QiOiJQcm9ncmVzc2l2ZSIsIkNyb3VjaCBNb3ZlIFQiOiJQcm9ncmVzc2l2ZSIsIkNyb3VjaCBUIjoiUHJvZ3Jlc3NpdmUiLCJNb3ZpbmciOiJUb2xlcmFudGVkIiwiU3RhbmRpbmciOiJQcm9ncmVzc2l2ZSJ9fSwidmlzdWFscyI6eyJBV1Bfbm9zY29wZSI6MC4wLCJBdXRvX25vc2NvcGUiOjAuMCwiYW5pbV9icmVha2VycyI6eyJyZWZzIjpbMS4wLDIuMCwzLjAsIn4iXSwifnJlZnMiOnsiaml0dGVyX2xlZ3Nfb2Zmc2V0XzEiOjAuMCwiaml0dGVyX2xlZ3Nfb2Zmc2V0XzIiOjIxLjAsIm1vdmVfbGVhbiI6MTAwLjAsInN0YXRpY19sZWdzIjoxMDAuMH19LCJhc3BlY3RyYXRpb19sYWJlbCI6eyJhc3BlY3RyYXRpbyI6MTQwLjB9LCJjcm9zc2hhaXJfaGl0Ijp0cnVlLCJkbWdfaW5kaWMiOnRydWUsImZha2VsYWdfZGlzYWJsZXJzIjpbIn4iXSwiZmFzdF9sYWRkZXIiOnRydWUsImZyZWVzdGFuZCI6ZmFsc2UsImhpdGNoYW5jZSI6WyJ+Il0sImhpdG1hcmtlciI6dHJ1ZSwibG9ncyI6dHJ1ZSwibWFudWFscyI6Ik9mZiIsIm5vZmFsbCI6dHJ1ZSwicmVmcyI6WzEuMCwyLjAsMy4wLDQuMCwifiJdLCJyZXZvbGVyX2luX2FpciI6MC4wLCJzY29wZV9sYWJlbCI6eyJhbmlta2EiOnRydWUsImxlbmd0aCI6Ny4wLCJvZmZzZXQiOjY3LjB9LCJzc2dfYWlyIjowLjAsInNzZ19ub3Njb3BlIjowLjAsInZpZXdtb2RlbF9sYWJlbCI6eyJmb3YiOjYwMC4wLCJ4IjowLjAsInkiOjAuMCwieiI6MC4wfSwifm1hbnVhbHMiOnsibWFudWFsc19zdGF0aWMiOmZhbHNlfX19")));
end);
save = info_groups.home.Main_select_info:button("                        \239\139\146 Export config                           ", function(v27)
    -- upvalues: l_pui_0 (ref), l_base64_0 (ref), l_clipboard_0 (ref)
    if v27 then
        local v28 = l_pui_0.save();
        local v29 = json.stringify(v28);
        local v30 = l_base64_0.encode(v29);
        l_clipboard_0.set(v30);
    end;
end);
load = info_groups.home.Main_select_info:button("                        \239\139\146 Import config                          ", function(v31)
    -- upvalues: l_clipboard_0 (ref), l_pui_0 (ref), l_base64_0 (ref)
    if v31 then
        local v32 = l_clipboard_0.get();
        l_pui_0.load(json.parse(l_base64_0.decode(v32)));
    end;
end);
load_only_visuals = info_groups.home.Main_select_info:button(" \239\132\178 Import Anti-Aim", function(v33)
    -- upvalues: l_clipboard_0 (ref), l_pui_0 (ref), l_base64_0 (ref)
    if v33 then
        local v34 = l_clipboard_0.get();
        l_pui_0.load(json.parse(l_base64_0.decode(v34)), "conditions");
    end;
end);
load_only_aa = info_groups.home.Main_select_info:button("   \239\148\176 Import Other ", function(v35)
    -- upvalues: l_clipboard_0 (ref), l_pui_0 (ref), l_base64_0 (ref)
    if v35 then
        local v36 = l_clipboard_0.get();
        l_pui_0.load(json.parse(l_base64_0.decode(v36)), "visuals");
    end;
end);
local v37 = l_pui_0.create(ui.get_icon("shield-virus") .. " Anti-Aim", "Selectable");
local v38 = l_pui_0.create(ui.get_icon("shield-virus") .. " Anti-Aim", "\239\159\146 Builder");
local v39 = l_pui_0.create(ui.get_icon("shield-virus") .. " Anti-Aim", ui.get_icon("shield-quartered") .. "Defensive Customize");
local v40 = l_pui_0.create(ui.get_icon("shield-virus") .. " Anti-Aim", ui.get_icon("circle-exclamation") .. "Fakelag Customize", 1);
local v41 = l_pui_0.create(ui.get_icon("shield-virus") .. " Anti-Aim", "\238\134\176 Main");
local v42 = l_pui_0.create(ui.get_icon("shield-virus") .. " Anti-Aim", "\239\134\176 Animations");
local v43 = l_pui_0.create(ui.get_icon("shield-virus") .. " Anti-Aim", ui.get_icon("gun") .. "Hitchance");
local v44 = l_pui_0.create("\239\139\156 Visuals", "Selectable");
local v45 = l_pui_0.create("\239\139\156 Visuals", "Visuals");
local v46 = v37:list(ui.get_icon("ballot-check") .. " Select", ui.get_icon("house") .. " Main", ui.get_icon("building-user") .. " Builder", "\239\134\176 Anim Breakers");
local v47 = v44:listable("Visuals", "\239\144\142 Aspect Ratio", "\239\157\186 Viewmodel Changer", "\239\152\129 Custom Scope", "\239\129\155 HitMarker", "\238\137\167 Console Logs", "\239\129\170 Damage indicator", ui.get_icon("pushed") .. " Hitmarker in crosshair");
local v48 = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw");
local v49 = v38:label("Conditions");
local v50 = v49:create();
local v51 = 0;
local v52 = nil;
local v53 = 0;
local v54 = 0;
local v55 = false;
local v56 = 0;
local v57 = 1;
local v58 = 2;
local _ = false;
local v60 = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter");
local v61 = false;
local v62 = {
    [1] = "Standing", 
    [2] = "Moving", 
    [3] = "Crouch T", 
    [4] = "Crouch CT", 
    [5] = "Crouch Move T", 
    [6] = "Crouch Move CT", 
    [7] = "Air", 
    [8] = "Air Crouch T", 
    [9] = "Air Crouch CT"
};
local v63 = {
    [1] = "Left/Right", 
    [2] = "Body Yaw", 
    [3] = "Delay Jitter", 
    [4] = "Progressive/Toleranted", 
    [5] = "Safe Head", 
    [6] = "Random pitch on Defensive", 
    [7] = "Bebra Technology$$$"
};
local v64 = v50:combo("Condition", v62);
v49:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v46
});
local v76 = {
    conditions = {
        defensive_feature = {}, 
        refs = {}, 
        yaw_types = {}, 
        yaw_left = {}, 
        yaw_right = {}, 
        delay_jitter = {}, 
        delay_jitter_fakelag = {}, 
        body_yaw = {}, 
        defensive_pitch = {}, 
        body_yaw2 = {}, 
        body_yaw_leftlimit = {}, 
        body_yaw_rightlimit = {}, 
        body_yaw_jitter = {}, 
        tolerant_yaw = {}, 
        progressive_yaw = {}, 
        safe_head = {}, 
        delay_jitter_value = {}, 
        delay_jitter_fakelag_feature = {}, 
        desync_fakelag = {}, 
        defensivefeature_custom = {}, 
        defensivefeature_custom2 = {}, 
        delay_type = {}, 
        technology = {}, 
        tech_type = {}
    }, 
    visuals = {
        refs = v41:listable("Settings", "\239\130\142 Manuals", "\238\149\134 No Fall Damage", "\239\139\185 Freestanding", "\239\151\133 Fast Ladder", ui.get_icon("signal-slash") .. "Fakelag Disablers", ui.get_icon("bullseye-arrow") .. "Hitchance Manipulations"), 
        manuals = v41:combo("\239\130\142 Manuals", {
            [1] = "Off", 
            [2] = "\239\129\160 Left", 
            [3] = "\239\129\161 Right", 
            [4] = "\239\129\142 Forward"
        }, function(v65)
            return {
                manuals_static = v65:switch("Static on Manual", false)
            };
        end), 
        nofall = v41:switch("\238\149\134 No Fall Damage", false), 
        freestand = v41:switch("\239\139\185 Freestanding", false), 
        fast_ladder = v41:switch("\239\151\133 Fast Ladder", false), 
        fakelag_disablers = v41:selectable(ui.get_icon("signal-slash") .. "Fakelag Disablers", "On DT", "On Onshot", "On Standing", "On Knife"), 
        hitchance = v41:selectable(ui.get_icon("bullseye-arrow") .. "Select Weapon", "SSG-08", "AWP", "SCAR-20/G3SG1", "R8"), 
        ssg_air = v43:slider("SSG-08 In Air", 0, 100, 0, 1, function(v66)
            return v66 == 0 and "Rage" or v66 .. "%";
        end), 
        ssg_noscope = v43:slider("SSG-08 NoScope", 0, 100, 0, 1, function(v67)
            return v67 == 0 and "Rage" or v67 .. "%";
        end), 
        AWP_noscope = v43:slider("AWP NoScope", 0, 100, 0, 1, function(v68)
            return v68 == 0 and "Rage" or v68 .. "%";
        end), 
        Auto_noscope = v43:slider("AutoSnipers NoScope", 0, 100, 0, 1, function(v69)
            return v69 == 0 and "Rage" or v69 .. "%";
        end), 
        revoler_in_air = v43:slider("R8 In Air", 0, 100, 0, 1, function(v70)
            return v70 == 0 and "Rage" or v70 .. "%";
        end), 
        anim_breakers = {
            refs = v42:listable("Animation Breakers", {
                [1] = "\238\136\158 Static Legs in Air", 
                [2] = "\239\149\148 Move Lean", 
                [3] = "\238\139\142 Jitter Legs"
            }, function(v71)
                return {
                    static_legs = v71:slider("\238\136\158 Statis legs Value", 0, 100, 0), 
                    move_lean = v71:slider("\239\149\148 Move Lean", 0, 100, 0), 
                    jitter_legs_offset_1 = v71:slider("\238\139\142 Legs Offset [1]", 0, 100, 0), 
                    jitter_legs_offset_2 = v71:slider("\238\139\142 Legs Offset [2]", 0, 100, 0)
                };
            end)
        }, 
        aspectratio_label = v45:label("\239\144\142 Aspect Ratio", function(v72)
            return {
                aspectratio = v72:slider("Aspect Ratio", 100, 300, 140), 
                firstb = v72:button("4:3"), 
                secondb = v72:button("5:4"), 
                thirdb = v72:button("16:10")
            };
        end), 
        viewmodel_label = v45:label("\239\157\186 Viewmodel", function(v73)
            return {
                fov = v73:slider("Fov", 0, 1000, 1000, 0.1), 
                x = v73:slider("X", -100, 150, 0, 0.1), 
                y = v73:slider("Y", -150, 150, 0, 0.1), 
                z = v73:slider("Z", -150, 150, 0, 0.1)
            };
        end), 
        scope_label = v45:label("\239\152\129 Custom Scope", function(v74)
            return {
                offset = v74:slider("Offset", -500, 500, 0, 0.1), 
                length = v74:slider("Start", -100, 100, 0, 0.1), 
                animka = v74:switch("Scope Animation", false), 
                color = v74:label("Color Picker", color(255, 0, 0))
            };
        end), 
        hitmarker = v45:switch("\239\129\155 HitMarker", false, function(v75)
            return {
                color = v75:label("Color Picker", color(255, 0, 0))
            };
        end), 
        logs = v45:switch("\238\137\167 Console Hitlogs", false), 
        dmg_indic = v45:switch("\239\129\170 Damage Indicator", false), 
        crosshair_hit = v45:switch(ui.get_icon("pushed") .. "Hitmarker in crosshair", false)
    }
};
v76.visuals.aspectratio_label.firstb:set_callback(function(v77)
    -- upvalues: v76 (ref)
    if v77 then
        v76.visuals.aspectratio_label.aspectratio:set(133);
    end;
end, true);
v76.visuals.aspectratio_label.secondb:set_callback(function(v78)
    -- upvalues: v76 (ref)
    if v78 then
        v76.visuals.aspectratio_label.aspectratio:set(125);
    end;
end, true);
v76.visuals.aspectratio_label.thirdb:set_callback(function(v79)
    -- upvalues: v76 (ref)
    if v79 then
        v76.visuals.aspectratio_label.aspectratio:set(160);
    end;
end, true);
v76.visuals.refs:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v46
});
v76.visuals.manuals:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v46
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v76.visuals.refs
});
v76.visuals.nofall:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v46
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v76.visuals.refs
});
v76.visuals.freestand:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v46
}, {
    [1] = nil, 
    [2] = 3, 
    [1] = v76.visuals.refs
});
v76.visuals.fast_ladder:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v46
}, {
    [1] = nil, 
    [2] = 4, 
    [1] = v76.visuals.refs
});
v76.visuals.fakelag_disablers:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v46
}, {
    [1] = nil, 
    [2] = 5, 
    [1] = v76.visuals.refs
});
v76.visuals.hitchance:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v46
}, {
    [1] = nil, 
    [2] = 6, 
    [1] = v76.visuals.refs
});
v76.visuals.ssg_air:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v46
}, {
    [1] = nil, 
    [2] = 6, 
    [1] = v76.visuals.refs
}, {
    [1] = nil, 
    [2] = "SSG-08", 
    [1] = v76.visuals.hitchance
});
v76.visuals.ssg_noscope:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v46
}, {
    [1] = nil, 
    [2] = 6, 
    [1] = v76.visuals.refs
}, {
    [1] = nil, 
    [2] = "SSG-08", 
    [1] = v76.visuals.hitchance
});
v76.visuals.AWP_noscope:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v46
}, {
    [1] = nil, 
    [2] = 6, 
    [1] = v76.visuals.refs
}, {
    [1] = nil, 
    [2] = "AWP", 
    [1] = v76.visuals.hitchance
});
v76.visuals.Auto_noscope:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v46
}, {
    [1] = nil, 
    [2] = 6, 
    [1] = v76.visuals.refs
}, {
    [1] = nil, 
    [2] = "SCAR-20/G3SG1", 
    [1] = v76.visuals.hitchance
});
v76.visuals.revoler_in_air:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v46
}, {
    [1] = nil, 
    [2] = 6, 
    [1] = v76.visuals.refs
}, {
    [1] = nil, 
    [2] = "R8", 
    [1] = v76.visuals.hitchance
});
v76.visuals.anim_breakers.refs:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v46
});
v76.visuals.anim_breakers.refs.static_legs:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v46
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v76.visuals.anim_breakers.refs
});
v76.visuals.anim_breakers.refs.move_lean:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v46
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v76.visuals.anim_breakers.refs
});
v76.visuals.anim_breakers.refs.jitter_legs_offset_1:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v46
}, {
    [1] = nil, 
    [2] = 3, 
    [1] = v76.visuals.anim_breakers.refs
});
v76.visuals.anim_breakers.refs.jitter_legs_offset_2:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v46
}, {
    [1] = nil, 
    [2] = 3, 
    [1] = v76.visuals.anim_breakers.refs
});
v76.visuals.hitmarker:depend({
    [1] = nil, 
    [2] = 4, 
    [1] = v47
});
v76.visuals.aspectratio_label:depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v47
});
v76.visuals.viewmodel_label:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v47
});
v76.visuals.viewmodel_label.fov:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v47
});
v76.visuals.viewmodel_label.x:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v47
});
v76.visuals.viewmodel_label.y:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v47
});
v76.visuals.viewmodel_label.z:depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v47
});
v76.visuals.logs:depend({
    [1] = nil, 
    [2] = 5, 
    [1] = v47
});
v76.visuals.dmg_indic:depend({
    [1] = nil, 
    [2] = 6, 
    [1] = v47
});
v76.visuals.scope_label:depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v47
});
v76.visuals.crosshair_hit:depend({
    [1] = nil, 
    [2] = 7, 
    [1] = v47
});
for _, v81 in ipairs(v62) do
    local v82 = v38:listable(("%s"):format(v81), v63);
    v82:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    });
    v76.conditions.refs[v81] = v82;
    local v83 = v38:slider("Yaw right", -180, 180, 0);
    v83:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    });
    v76.conditions.yaw_right[v81] = v83;
    local v84 = v38:slider("Yaw left", -180, 180, 0);
    v84:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    });
    v76.conditions.yaw_left[v81] = v84;
    local v85 = v38:switch("Body yaw", false);
    v85:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    });
    v76.conditions.body_yaw[v81] = v85;
    local v86 = v85:create();
    local v87 = v86:slider("Left Limit", 0, 60, 0);
    v87:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    });
    v76.conditions.body_yaw_leftlimit[v81] = v87;
    local v88 = v86:slider("Right Limit", 0, 60, 0);
    v88:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    });
    v76.conditions.body_yaw_rightlimit[v81] = v88;
    local v89 = v86:switch("Optimize limits for fakelag", false);
    v89:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    });
    v76.conditions.desync_fakelag[v81] = v89;
    local v90 = v86:switch("Jitter", false);
    v90:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    });
    v76.conditions.body_yaw_jitter[v81] = v90;
    local v92 = v38:slider("Delay Jitter", 0, 100, 0, 1, function(v91)
        return v91 .. "%";
    end);
    v92:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    });
    v76.conditions.delay_jitter[v81] = v92;
    local v94 = v38:slider("Delay Jitter Amount", 2, 100, 26, 1, function(v93)
        return v93 .. "%";
    end);
    v94:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    });
    v76.conditions.delay_jitter_value[v81] = v94;
    local v95 = v38:combo("Delay type", {
        [1] = "Old", 
        [2] = "New"
    });
    v95:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    });
    v76.conditions.delay_type[v81] = v95;
    local v96 = v38:switch("Fakelag", false);
    v96:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    });
    v76.conditions.delay_jitter_fakelag[v81] = v96;
    local v97 = v40:list("Fakelag type", {
        [1] = ui.get_icon("circle-exclamation") .. " Default", 
        [2] = ui.get_icon("circle-exclamation") .. " On Jitter", 
        [3] = ui.get_icon("circle-exclamation") .. " On Defensive [working only]"
    }, 2);
    v97:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v96
    });
    v76.conditions.delay_jitter_fakelag_feature[v81] = v97;
    local v98 = v38:combo("Yaw type", {
        [1] = "Progressive", 
        [2] = "Toleranted"
    });
    local v99 = v98:create();
    v98:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 4, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    });
    v76.conditions.yaw_types[v81] = v98;
    local v100 = v99:slider("Tolerant Yaw", 1, 60, 1);
    v100:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 4, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    }, {
        [1] = nil, 
        [2] = "Toleranted", 
        [1] = v98
    });
    v76.conditions.tolerant_yaw[v81] = v100;
    local v101 = v99:slider("Progresive Yaw", 1, 60, 1);
    v101:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 4, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    }, {
        [1] = nil, 
        [2] = "Progressive", 
        [1] = v98
    });
    v76.conditions.progressive_yaw[v81] = v101;
    local v102 = v38:selectable("Safe Head On", "Knife", "Zeus");
    v102:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 5, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    });
    v76.conditions.safe_head[v81] = v102;
    local v103 = v38:switch("Sync Delay with Body yaw", false);
    v103:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    });
    v76.conditions.body_yaw2[v81] = v103;
    local v104 = v38:switch("Technologies", false);
    v104:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 7, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    });
    v76.conditions.technology[v81] = v104;
    local v105 = v104:create():combo("Logic", {
        [1] = "Original", 
        [2] = "Reversed"
    });
    v105:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 7, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    });
    v76.conditions.tech_type[v81] = v105;
    local v106 = v39:list("Defensive Feature", {
        [1] = ui.get_icon("shield-virus") .. " Off", 
        [2] = ui.get_icon("shield-virus") .. " Default", 
        [3] = ui.get_icon("shield-virus") .. " Group 1", 
        [4] = ui.get_icon("shield-virus") .. " Custom"
    });
    v106:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    });
    v76.conditions.defensive_feature[v81] = v106;
    local v107 = v39:slider("Delay Defensive", 0, 100, 1);
    v107:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    }, {
        [1] = nil, 
        [2] = 4, 
        [1] = v106
    });
    v76.conditions.defensivefeature_custom[v81] = v107;
    local v108 = v39:slider("Delay Defensive Amount", 2, 100, 1);
    v108:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 3, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    }, {
        [1] = nil, 
        [2] = 4, 
        [1] = v106
    });
    v76.conditions.defensivefeature_custom2[v81] = v108;
    local v109 = v38:switch("Random pitch on defensive", false);
    v109:depend({
        [1] = v64, 
        [2] = v81
    }, {
        [1] = nil, 
        [2] = 6, 
        [1] = v82
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v46
    });
    v76.conditions.defensive_pitch[v81] = v109;
end;
local _ = l_pui_0.setup(v76);
local v111 = 0;
local function v115()
    -- upvalues: v4 (ref), v111 (ref)
    local v112 = entity.get_local_player();
    if not v112 then
        v4 = false;
    end;
    local v113 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
    if not v113 or not v113:get() then
        v4 = false;
    end;
    local l_m_nTickBase_0 = v112.m_nTickBase;
    if v111 < l_m_nTickBase_0 then
        v111 = l_m_nTickBase_0;
        v4 = false;
        return false;
    else
        v4 = true;
        return true;
    end;
end;
events.net_update_end:set(function()
    -- upvalues: v115 (ref)
    v115();
end);
local function v130(v116)
    -- upvalues: v76 (ref), v60 (ref), v51 (ref), v52 (ref), v61 (ref), v48 (ref), v4 (ref), v54 (ref), v53 (ref), l_liberia_0 (ref), v55 (ref), v56 (ref), v58 (ref), v57 (ref), v2 (ref)
    local v117 = 0;
    local v118 = entity.get_local_player();
    local v119 = v118:get_player_weapon();
    if not v119 then
        return;
    else
        local v120 = v119:get_weapon_info();
        v117 = 2;
        if not v118 or not v118:is_alive() then
            return;
        else
            if not v76.visuals.refs:get(1) or v76.visuals.manuals:get() == "Off" then
                ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):override(v76.visuals.refs:get("\239\139\185 Freestanding") and v76.visuals.freestand:get());
            end;
            if v116.choked_commands == 0 then
                invert = not invert;
            end;
            if v76.visuals.manuals:get() ~= "Off" and v76.visuals.refs:get(1) then
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(v76.visuals.manuals:get() == "\239\129\160 Left" and -90 or v76.visuals.manuals:get() == "\239\129\142 Forward" and 180 or 90);
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"):override("Local View");
                if not v76.visuals.manuals.manuals_static:get() then
                    v60:override(invert);
                elseif v76.visuals.manuals:get() == "Left" then
                    v60:override(false);
                elseif v76.visuals.manuals:get() == "Right" then
                    v60:override(true);
                end;
                return;
            elseif rage.antiaim:get_target(true) ~= nil and ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):get() then
                v60:override(false);
                return;
            else
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"):override();
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"):override("");
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"):override("");
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):override("Backward");
                ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):override("Disabled");
                ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):override("Down");
                local l_m_iTeamNum_0 = v118.m_iTeamNum;
                local v122 = l_m_iTeamNum_0 == 3 and "CT" or l_m_iTeamNum_0 == 2 and "T" or "CT";
                local l_m_fFlags_0 = v118.m_fFlags;
                local v124 = l_m_fFlags_0 == bit.bor(l_m_fFlags_0, bit.lshift(1, 0));
                local v125 = l_m_fFlags_0 == bit.bor(l_m_fFlags_0, bit.lshift(2, 0));
                local v126 = v118.m_vecVelocity:length2d();
                v51 = v124 and math.clamp(v51 + 1, 0, 2) or 0;
                if v51 > 1 and not v125 and v126 > 5 then
                    v52 = "Moving";
                elseif v125 and v51 > 1 and v126 < 5 and v122 == "CT" then
                    v52 = "Crouch CT";
                elseif v125 and v51 > 1 and v126 < 5 and v122 == "T" then
                    v52 = "Crouch T";
                elseif v51 <= 1 and v125 and v122 == "CT" then
                    v52 = "Air Crouch CT";
                elseif v51 <= 1 and v125 and v122 == "T" then
                    v52 = "Air Crouch T";
                elseif v51 <= 1 and not v125 then
                    v52 = "Air";
                elseif v126 < 5 and v51 > 1 and not v125 then
                    v52 = "Standing";
                elseif v126 > 5 and v51 > 1 and v125 and v122 == "CT" then
                    v52 = "Crouch Move CT";
                elseif v126 > 5 and v51 > 1 and v125 and v122 == "T" then
                    v52 = "Crouch Move T";
                end;
                if v76.conditions.refs[v52]:get(5) then
                    v61 = v76.conditions.safe_head[v52]:get("Knife") and v120.weapon_name == "weapon_knife" or v76.conditions.safe_head[v52]:get("Zeus") and v120.weapon_name == "weapon_taser";
                else
                    v61 = false;
                end;
                if v61 then
                    return;
                else
                    if not v76.conditions.refs[v52]:get(7) and not v76.conditions.technology[v52]:get() then
                        if v76.conditions.refs[v52]:get(2) then
                            v48:override(v76.conditions.body_yaw[v52]:get());
                        else
                            v48:override(true);
                        end;
                    elseif v117 == 1 then
                        if v76.conditions.tech_type[v52]:get() == "Original" then
                            if v4 then
                                v48:override(false);
                            else
                                v48:override(true);
                            end;
                        elseif v4 then
                            v48:override(true);
                        else
                            v48:override(false);
                        end;
                    else
                        v48:override(true);
                    end;
                    if not v76.conditions.refs[v52]:get(7) and not v76.conditions.technology[v52]:get() then
                        if v76.conditions.refs[v52]:get(2) and v76.conditions.body_yaw[v52]:get() and not v76.conditions.desync_fakelag[v52]:get() then
                            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):override(v76.conditions.body_yaw_leftlimit[v52]:get());
                            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):override(v76.conditions.body_yaw_rightlimit[v52]:get());
                        end;
                    elseif v76.conditions.refs[v52]:get(2) and v76.conditions.body_yaw[v52]:get() and not v76.conditions.desync_fakelag[v52]:get() then
                        if v76.conditions.tech_type[v52]:get() == "Original" then
                            if v117 == 2 then
                                if v4 then
                                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):override(math.floor(v76.conditions.body_yaw_leftlimit[v52]:get() / math.random(2, 4)));
                                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):override(math.floor(v76.conditions.body_yaw_rightlimit[v52]:get() / math.random(2, 4)));
                                else
                                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):override(v76.conditions.body_yaw_leftlimit[v52]:get());
                                    ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):override(v76.conditions.body_yaw_rightlimit[v52]:get());
                                end;
                            end;
                        elseif not v4 then
                            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):override(math.floor(v76.conditions.body_yaw_leftlimit[v52]:get() / math.random(2, 4)));
                            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):override(math.floor(v76.conditions.body_yaw_rightlimit[v52]:get() / math.random(2, 4)));
                        else
                            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):override(v76.conditions.body_yaw_leftlimit[v52]:get());
                            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):override(v76.conditions.body_yaw_rightlimit[v52]:get());
                        end;
                    end;
                    if v76.conditions.yaw_types[v52]:get() == "Toleranted" and v76.conditions.refs[v52]:get(4) then
                        v54 = globals.tickcount % 3 >= 2 and v76.conditions.tolerant_yaw[v52]:get("Toleranted") or -v76.conditions.tolerant_yaw[v52]:get("Toleranted");
                    else
                        v54 = 0;
                    end;
                    if v76.conditions.yaw_types[v52]:get() == "Progressive" and v76.conditions.refs[v52]:get(4) then
                        v53 = l_liberia_0.number.round(globals.realtime * 40 % v76.conditions.progressive_yaw[v52]:get("Progressive"));
                    elseif v76.conditions.yaw_types[v52]:get() ~= "Progressive" or not v76.conditions.refs[v52]:get(4) then
                        v53 = 0;
                    end;
                    if v76.conditions.refs[v52]:get(1) and not v76.conditions.refs[v52]:get(3) then
                        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(invert and v76.conditions.yaw_left[v52]:get() + v54 + v53 or v76.conditions.yaw_right[v52]:get() + v54 + v53);
                    elseif v76.conditions.refs[v52]:get(3) then
                        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"):override(delay_invert and v76.conditions.yaw_left[v52]:get() + v54 + v53 or v76.conditions.yaw_right[v52]:get() + v54 + v53);
                    end;
                    if v76.conditions.defensive_pitch[v52]:get() and v76.conditions.refs[v52]:get(6) and v4 then
                        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override(true);
                        rage.antiaim:override_hidden_pitch(math.random(0, 90));
                    else
                        ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override();
                    end;
                    if v76.conditions.body_yaw_jitter[v52]:get() and not v76.conditions.refs[v52]:get(3) then
                        v60:override(invert);
                    end;
                    if globals.choked_commands == 0 then
                        local v127 = v76.conditions.delay_jitter[v52]:get();
                        if v76.conditions.delay_jitter_fakelag[v52]:get() then
                            local _ = not ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"):get();
                        end;
                        local _ = v76.conditions.delay_jitter_fakelag_feature[v52]:get();
                        if not v76.conditions.refs[v52]:get(3) then
                            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override();
                            return;
                        elseif v76.conditions.body_yaw_jitter[v52]:get() and v127 ~= 0 then
                            if v76.conditions.delay_type[v52]:get() ~= "New" then
                                if v127 > 0 then
                                    v127 = 0.05 * v127;
                                    v55 = true;
                                end;
                                v56 = v56 + 0.05 * v58;
                                if v58 >= v76.conditions.delay_jitter_value[v52]:get() then
                                    v58 = 0;
                                end;
                            else
                                v127 = 0.05 * v127;
                                v56 = v56 + 0.05 * v58;
                                if v127 <= v56 then
                                    if v57 % 2 == 0 then
                                        delay_invert = v58 % 3 ~= 0;
                                    else
                                        delay_invert = v58 % 2 == 0;
                                    end;
                                    v57 = v57 + 1;
                                    v56 = 0;
                                end;
                                if v57 >= 4 then
                                    v58 = v58 + 1;
                                end;
                                if v58 >= v76.conditions.delay_jitter_value[v52]:get() then
                                    v58 = 1;
                                end;
                                v60:override(delay_invert);
                            end;
                            if v127 < v56 then
                                if ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"):get() or v2 ~= 2 then
                                    ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override();
                                end;
                                if v76.conditions.defensive_feature[v52]:get() == 5 then
                                    v2 = math.random(3, 4);
                                else
                                    v2 = v76.conditions.defensive_feature[v52]:get();
                                end;
                                if v76.conditions.defensive_feature[v52]:get() == 1 then
                                    ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override();
                                end;
                                if v76.conditions.delay_type[v52]:get() ~= "New" then
                                    delay_invert = not delay_invert;
                                end;
                                if not ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"):get() and v2 ~= 1 then
                                    if v2 == 3 then
                                        v116.force_defensive = true;
                                    elseif v2 == 2 then
                                        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Always On");
                                    end;
                                end;
                                if v76.conditions.delay_type[v52]:get() ~= "New" then
                                    v56 = 0;
                                    v57 = v57 + 1;
                                end;
                            elseif not ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"):get() and v2 ~= 1 and v2 == 2 then
                                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Always On");
                            end;
                            if v76.conditions.delay_type[v52]:get() ~= "New" then
                                if v57 >= 2 then
                                    v58 = v58 + 2;
                                end;
                                v60:override(delay_invert);
                            end;
                        elseif v76.conditions.delay_type[v52]:get() ~= "New" then
                            delay_invert = not delay_invert;
                            v56 = 0;
                            v57 = v57 + 1;
                        end;
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
events.round_start:set(function()
    -- upvalues: v4 (ref), v53 (ref), v58 (ref), v57 (ref), v56 (ref), v61 (ref), v111 (ref)
    v4 = false;
    v53 = 0;
    v58 = 2;
    v57 = 1;
    v56 = 0;
    delay = 0;
    v61 = false;
    v111 = 0;
    type_lol = 0;
end);
local v131 = {
    lp = {}
};
v131.lp.self = entity.get_local_player();
v131.gear = {};
events.post_update_clientside_animation:set(function(_)
    -- upvalues: l_lambotruck_0 (ref), v76 (ref)
    local v133 = entity.get_local_player();
    local v134 = entity.get_local_player();
    ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override(nil);
    if not v134 or not v134:is_alive() then
        return;
    else
        local v135 = math.abs(math.floor(v134.m_vecVelocity:length() - 1)) - 1;
        local v136 = {
            [6] = l_lambotruck_0.animation.overlay(v133[0], 6), 
            [12] = l_lambotruck_0.animation.overlay(v133[0], 12)
        };
        if v76.visuals.anim_breakers.refs:get(3) then
            local v137 = v76.visuals.anim_breakers.refs.jitter_legs_offset_1:get();
            local v138 = v76.visuals.anim_breakers.refs.jitter_legs_offset_2:get();
            ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Sliding");
            v133.m_flPoseParameter[0] = globals.tickcount % 4 >= 2 and v137 / 200 or v138 / 200;
            v133.m_flPoseParameter[7] = globals.tickcount % 4 >= 2 and v137 / 200 or v138 / 200;
        end;
        if v76.visuals.anim_breakers.refs:get(1) then
            local v139 = v76.visuals.anim_breakers.refs.static_legs:get();
            local v140 = entity.get_local_player();
            if not v140 then
                return;
            else
                local l_m_fFlags_1 = v140.m_fFlags;
                local v142 = l_m_fFlags_1 == bit.bor(l_m_fFlags_1, bit.lshift(1, 0));
                if v139 ~= 0 and not v142 then
                    v133.m_flPoseParameter[6] = v139 / 100;
                    v136[6].m_flWeight = 0;
                end;
            end;
        end;
        if v76.visuals.anim_breakers.refs:get(2) then
            local v143 = v76.visuals.anim_breakers.refs.move_lean:get() / 100;
            if v135 >= 3 and v143 ~= -1 then
                v136[12].m_flWeight = v143;
            end;
        end;
        return;
    end;
end);
local v144 = nil;
events.pre_render:set(function()
    -- upvalues: v144 (ref), v76 (ref)
    local v145 = entity.get_local_player();
    v144 = nil;
    if not v145 or not globals.is_connected or not globals.is_in_game or not v145:is_alive() or not v76.visuals.nofall:get() and v76.visuals.refs:get(2) then
        return;
    else
        local v146 = v145:get_origin();
        if not v146 then
            return;
        else
            if v145.m_vecVelocity.z <= -500 then
                local l_fraction_0 = utils.trace_line(v146, v146 + vector(0, 0, -256), v145).fraction;
                if l_fraction_0 < 0.8 and l_fraction_0 >= 0.07 then
                    v144 = true;
                elseif l_fraction_0 <= 0.06 then
                    v144 = false;
                end;
            end;
            return;
        end;
    end;
end);
fast_ladder = function(v148)
    -- upvalues: v76 (ref)
    if not v76.visuals.fast_ladder:get() or not v76.visuals.refs:get(4) then
        return;
    else
        local v149 = render.camera_angles();
        local v150 = v148.forwardmove < 0 or v149.x > 45;
        if entity.get_local_player().m_MoveType ~= 9 or v148.forwardmove == 0 then
            return;
        else
            local v151 = v150 and 1 or 0;
            v148.in_moveright = not v150 and 1 or 0;
            v148.in_moveleft = v151;
            v151 = v150 and 1 or 0;
            v148.in_back = not v150 and 1 or 0;
            v148.in_forward = v151;
            v151 = v148.view_angles;
            local l_view_angles_0 = v148.view_angles;
            local v153 = math.normalize_yaw(v148.view_angles.x + 89);
            l_view_angles_0.y = math.normalize_yaw(v148.view_angles.y + 90);
            v151.x = v153;
            return;
        end;
    end;
end;
events.createmove:set(function(v154)
    -- upvalues: v130 (ref), v76 (ref), v144 (ref)
    fast_ladder(v154);
    v130(v154);
    if v76.visuals.nofall:get() and v76.visuals.refs:get(2) then
        v154.in_duck = v144;
    end;
end);
local v155 = 0;
local v156 = 0;
local function v160(v157, v158, v159)
    if v159 < v157 then
        return v159;
    elseif v157 < v158 then
        return v158;
    else
        return v157;
    end;
end;
calculate_color = function(v161, v162, v163)
    -- upvalues: v160 (ref)
    v163 = math.min(1, v163);
    local v164 = v162[1];
    local v165 = v162[2];
    local v166 = v162[3];
    s_a = v162[4];
    s_b = v166;
    s_g = v165;
    s_r = v164;
    v164 = v161[1];
    v165 = v161[2];
    v166 = v161[3];
    s2_a = v161[4];
    s2_b = v166;
    s2_g = v165;
    s2_r = v164;
    v164 = 0;
    v165 = 0;
    v166 = 0;
    local v167 = 0;
    if s2_r < s_r then
        local v168 = s_r - s2_r;
        v164 = v160(s_r - v168 * v163, s2_r, s_r);
    else
        local v169 = s2_r - s_r;
        v164 = v160(s_r + v169 * v163, s_r, s2_r);
    end;
    if s2_g < s_g then
        local v170 = s_g - s2_g;
        v165 = v160(s_g - v170 * v163, s2_g, s_g);
    else
        local v171 = s2_g - s_g;
        v165 = v160(s_g + v171 * v163, s_g, s2_g);
    end;
    if s2_b < s_b then
        local v172 = s_b - s2_b;
        v166 = v160(s_b - v172 * v163, s2_b, s_b);
    else
        local v173 = s2_b - s_b;
        v166 = v160(s_b + v173 * v163, s_b, s2_b);
    end;
    if s2_a < s_a then
        local v174 = s_a - s2_a;
        v167 = v160(s_a - v174 * v163, s2_a, s_a);
    else
        local v175 = s2_a - s_a;
        v167 = v160(s_a + v175 * v163, s_a, s2_a);
    end;
    return {
        [1] = v164, 
        [2] = v165, 
        [3] = v166, 
        [4] = v167
    };
end;
events.render:set(function()
    -- upvalues: l_monylinear_0 (ref), l_pui_0 (ref), v155 (ref), v17 (ref), v156 (ref), v19 (ref)
    if not entity.get_local_player() then
        return;
    else
        local v176 = l_monylinear_0:Animate("BebraSense.lua", {
            color(255, 255, 255, 255), 
            l_pui_0.get_style("Link Active")
        }, 3);
        local _ = l_monylinear_0:Animate("[" .. common.get_username() .. "]", {
            color(255, 255, 255, 255), 
            l_pui_0.get_style("Link Active")
        }, 10);
        if watermark_position:get() == "Bottom" then
            v155 = vector(v17.x * 0.5, v17.y - 15);
            v156 = vector(v17.x * 0.5, v17.y - 15);
            render.text(v19 == "Default" and v19 or 1, v155, color(255, 255, 255, 255), "c", " " .. v176 .. "\aDEFAULT ");
        elseif watermark_position:get() == "Upper-right" then
            v155 = vector(v17.x - 45, 515);
            v156 = vector(v17.x - 40, 500);
            render.text(v19 == "Default" and v19 or 1, v155, color(255, 255, 255, 255), "c", " " .. v176 .. "\aDEFAULT ");
        elseif watermark_position:get() == "Upper-left" then
            v155 = vector(50, 515);
            v156 = vector(50, 500);
            render.text(v19 == "Default" and v19 or 1, v155, color(255, 255, 255, 255), "c", " " .. v176 .. "\aDEFAULT ");
        end;
        local v178 = 55;
        render.shadow(v155 - vector(v178 - 15), v155 + vector(v178 - 15), l_pui_0.get_style("Link Active"):alpha_modulate(150), 32);
        return;
    end;
end);
local v179 = {};
events.render:set(function()
    -- upvalues: v76 (ref), v47 (ref), v179 (ref), l_smooth_0 (ref)
    if not v76.visuals.hitmarker:get() or not v47:get(5) then
        return;
    else
        local l_value_0 = v76.visuals.hitmarker.color.color.value;
        for v181 = 1, #v179 do
            local v182 = v179[v181];
            if globals.realtime - v182.realtime < 3.5 then
                v182.alpha = l_smooth_0.lerp(v182.alpha, 255, 6);
            else
                v182.alpha = l_smooth_0.lerp(v182.alpha, -1, 6);
                if v182.alpha < 1 then
                    v182.remove = true;
                end;
            end;
            local v183 = v182.alpha / 255;
            local v184 = v182.position:to_screen();
            if v184 then
                local v185 = 5;
                local _ = 150;
                local _ = 16;
                render.shadow(v184 - vector(0, 5), v184 + vector(0, 5), color(l_value_0.r, l_value_0.g, l_value_0.b, 255 * v183), v185);
                render.shadow(v184 - vector(5, 0), v184 + vector(5, 0), color(l_value_0.r, l_value_0.g, l_value_0.b, 255 * v183), v185);
                render.line(v184 - vector(0, 5), v184 + vector(0, 5), color(l_value_0.r, l_value_0.g, l_value_0.b, v182.color.a * v183));
                render.line(v184 - vector(5, 1), v184 + vector(5, 0), color(l_value_0.r, l_value_0.g, l_value_0.b, v182.color.a * v183));
            end;
        end;
        for v188 = 1, #v179 do
            local v189 = v179[v188];
            if not v189 or v189.remove then
                table.remove(v179, v188);
            end;
        end;
        return;
    end;
end);
events.aim_ack:set(function(v190)
    -- upvalues: v179 (ref)
    table.insert(v179, {
        alpha = 0, 
        remove = false, 
        position = v190.aim, 
        realtime = globals.realtime, 
        color = color(255, 255, 255)
    });
end);
local _ = {};
hit_groups = {
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
push = function(v192)
    -- upvalues: v76 (ref)
    if not v76.visuals.logs:get() then
        return;
    else
        local v193 = "";
        for _, v195 in pairs(v192) do
            v193 = v193 .. ("\a%02x%02x%02x%02x%s"):format(v195[1].r, v195[1].g, v195[1].b, v195[1].a, v195[2]);
        end;
        print_raw(v193);
        return;
    end;
end;
v76.visuals.viewmodel_label.fov:set_callback(function(v196)
    cvar.sv_competitive_minspec:int(0);
    cvar.viewmodel_fov:float(v196:get() / 10);
end, true);
v76.visuals.viewmodel_label.x:set_callback(function(v197)
    cvar.viewmodel_offset_x:float(v197:get() / 10);
end, true);
v76.visuals.viewmodel_label.y:set_callback(function(v198)
    cvar.viewmodel_offset_y:float(v198:get() / 10);
end, true);
v76.visuals.viewmodel_label.z:set_callback(function(v199)
    cvar.viewmodel_offset_z:float(v199:get() / 10);
end, true);
v76.visuals.aspectratio_label.aspectratio:set_callback(function(v200)
    cvar.r_aspectratio:float(v200:get() / 100);
end, true);
events.aim_ack:set(function(v201)
    -- upvalues: v76 (ref), v47 (ref)
    if not v76.visuals.logs:get() or not v47:get(5) then
        return;
    elseif not entity.get_local_player() then
        return;
    else
        local v202 = {
            entity = v201.target
        };
        if not v202.entity or not entity.get(v202.entity) then
            return;
        else
            v202.name = v202.entity:get_name():gsub("\n", "");
            v202.health = v202.entity.m_iHealth;
            local v203 = {
                hit = color(52, 107, 235), 
                miss = color(209, 50, 50, 255)
            };
            if not v201.state then
                push({
                    [1] = {
                        [1] = nil, 
                        [2] = "[BEBRASENSE] ", 
                        [1] = color(38, 34, 38, 255)
                    }, 
                    [2] = {
                        [1] = nil, 
                        [2] = "Hit ", 
                        [1] = color(255, 255, 255, 255)
                    }, 
                    [3] = {
                        [1] = v203.hit, 
                        [2] = v202.name
                    }, 
                    [4] = {
                        [1] = nil, 
                        [2] = " in the ", 
                        [1] = color(255, 255, 255, 255)
                    }, 
                    [5] = {
                        [1] = v203.hit, 
                        [2] = hit_groups[v201.hitgroup] .. "(" .. hit_groups[v201.wanted_hitgroup] .. ")"
                    }, 
                    [6] = {
                        [1] = nil, 
                        [2] = " for ", 
                        [1] = color(255, 255, 255, 255)
                    }, 
                    [7] = {
                        [1] = v203.hit, 
                        [2] = v201.damage .. "(" .. v201.wanted_damage .. ")"
                    }, 
                    [8] = {
                        [1] = nil, 
                        [2] = " state (", 
                        [1] = color(255, 255, 255, 255)
                    }, 
                    [9] = {
                        [1] = v203.hit, 
                        [2] = v202.health == 0 and "dead" or v202.health
                    }, 
                    [10] = {
                        [1] = color(255, 255, 255, 255), 
                        [2] = v202.health == 0 and ") " or " hp remaining) "
                    }, 
                    [11] = {
                        [1] = nil, 
                        [2] = "HC: ", 
                        [1] = color(255, 255, 255, 255)
                    }, 
                    [12] = {
                        [1] = v203.hit, 
                        [2] = v201.hitchance
                    }, 
                    [13] = {
                        [1] = nil, 
                        [2] = " bt: ", 
                        [1] = color(255, 255, 255, 255)
                    }, 
                    [14] = {
                        [1] = v203.hit, 
                        [2] = v201.backtrack .. "t"
                    }
                });
            else
                state = state == "correction" and "resolver" or state;
                push({
                    [1] = {
                        [1] = nil, 
                        [2] = "[BEBRASENSE] ", 
                        [1] = color(38, 34, 38, 255)
                    }, 
                    [2] = {
                        [1] = nil, 
                        [2] = "MISS ", 
                        [1] = color(255, 255, 255, 255)
                    }, 
                    [3] = {
                        [1] = v203.miss, 
                        [2] = v202.name
                    }, 
                    [4] = {
                        [1] = nil, 
                        [2] = " IN ", 
                        [1] = color(255, 255, 255, 255)
                    }, 
                    [5] = {
                        [1] = v203.miss, 
                        [2] = hit_groups[v201.wanted_hitgroup]
                    }, 
                    [6] = {
                        [1] = nil, 
                        [2] = " HC: ", 
                        [1] = color(255, 255, 255, 255)
                    }, 
                    [7] = {
                        [1] = v203.miss, 
                        [2] = v201.hitchance
                    }, 
                    [8] = {
                        [1] = nil, 
                        [2] = " bt: ", 
                        [1] = color(255, 255, 255, 255)
                    }, 
                    [9] = {
                        [1] = v203.miss, 
                        [2] = v201.backtrack .. "t"
                    }, 
                    [10] = {
                        [1] = nil, 
                        [2] = " due to ", 
                        [1] = color(255, 255, 255, 255)
                    }, 
                    [11] = {
                        [1] = v203.miss, 
                        [2] = v201.state
                    }
                });
            end;
            return;
        end;
    end;
end);
sidebar = {};
sidebar.executer = function(v204)
    -- upvalues: l_pui_0 (ref), l_monylinear_0 (ref)
    if l_pui_0.get_alpha() < 0.25 and not v204 then
        return;
    else
        local v205 = {
            [1] = "", 
            [2] = "", 
            [1] = l_monylinear_0:Animate("BEBRASENSE BETA", {
                l_pui_0.get_style("Text"), 
                l_pui_0.get_style("Link Active"), 
                color(255, 255, 255, 10)
            }, 3, 2), 
            [2] = l_monylinear_0:Animate(ui.get_icon("user-secret"), {
                l_pui_0.get_style("Link Active"), 
                color(255, 255, 255, 10)
            }, 3)
        };
        l_pui_0.sidebar(v205[1], v205[2]);
        return;
    end;
end;
safe_call = function(v206, v207)
    local l_status_0, _ = pcall(function()
        -- upvalues: v206 (ref)
        v206();
    end);
    if v207 then
        if l_status_0 then
            v207[1]();
        else
            v207[2]();
        end;
    end;
end;
sidebar.executer(true);
local function v212()
    -- upvalues: v76 (ref), v47 (ref), v17 (ref)
    if not v76.visuals.dmg_indic:get() or not v47:get(6) then
        return;
    else
        local v210 = entity.get_local_player();
        if not v210 or not v210:is_alive() then
            return;
        else
            local v211 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get();
            if v211 == 0 then
                v211 = "AUTO";
            end;
            render.text(2, vector(v17.x * 0.5 + 1 + 5, v17.y * 0.5 - 10 - 5), color(255, 255, 255, 255), "l", v211);
            return;
        end;
    end;
end;
local function v217()
    -- upvalues: v47 (ref), v1 (ref), v8 (ref), v76 (ref), v17 (ref)
    local v213 = entity.get_local_player();
    if not v213 or not v213:is_alive() then
        return;
    else
        if v47:get(3) then
            ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):override("Remove All");
        else
            ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):override();
        end;
        if not v47:get(3) then
            return;
        else
            local v214 = v213.m_bIsScoped and 1 or 0;
            v1 = v8(v1, v214 and 1 or 0, 5 * globals.frametime);
            local v215 = {};
            if v76.visuals.scope_label.animka:get() then
                v215.start = v76.visuals.scope_label.length:get() * v1;
                v215.offset = v76.visuals.scope_label.offset:get() * v1;
                v215.color = v76.visuals.scope_label.color.color.value * v1;
            else
                v215.start = v76.visuals.scope_label.length:get();
                v215.offset = v76.visuals.scope_label.offset:get();
                v215.color = v76.visuals.scope_label.color.color.value;
            end;
            local v216 = {
                [1] = v215.color:alpha_modulate(v215.color.a * v214), 
                [2] = v215.color:alpha_modulate(0)
            };
            if v214 == 0 and v1 ~= 0 then
                v1 = v1 - 1 * v1;
            end;
            render.gradient(vector(v17.x * 0.5 - v215.start + 1, v17.y * 0.5), vector(v17.x * 0.5 - v215.start - v215.offset + 1, v17.y * 0.5 + 1), v216[1], v216[2], v216[1], v216[2]);
            render.gradient(vector(v17.x * 0.5 + v215.start, v17.y * 0.5), vector(v17.x * 0.5 + v215.start + v215.offset, v17.y * 0.5 + 1), v216[1], v216[2], v216[1], v216[2]);
            render.gradient(vector(v17.x * 0.5, v17.y * 0.5 + v215.start), vector(v17.x * 0.5 + 1, v17.y * 0.5 + v215.start + v215.offset), v216[1], v216[1], v216[2], v216[2]);
            render.gradient(vector(v17.x * 0.5, v17.y * 0.5 - v215.start + 1), vector(v17.x * 0.5 + 1, v17.y * 0.5 - v215.start - v215.offset + 1), v216[1], v216[1], v216[2], v216[2]);
            return;
        end;
    end;
end;
events.render:set(function()
    -- upvalues: v217 (ref), v212 (ref)
    v217();
    sidebar.executer();
    v212();
end);
local _ = esp.enemy:new_text("BEBRASENSE r8 helper", "DMG +", function(v218)
    local v219 = entity.get_local_player();
    local v220 = v219:get_origin();
    local l_m_vecOrigin_0 = v218.m_vecOrigin;
    local v222 = v219:get_player_weapon();
    if not v222 then
        return;
    else
        local v223 = v222:get_weapon_index();
        local v224 = (v218.m_ArmorValue > 0 and 99 or 107) * 0.94 ^ ((l_m_vecOrigin_0:dist(v220) - 30) / 500);
        local l_m_iHealth_0 = v218.m_iHealth;
        if v223 ~= 64 then
            return;
        elseif l_m_iHealth_0 <= v224 + 1 then
            return "DMG +";
        else
            return;
        end;
    end;
end);
events.createmove:set(function()
    -- upvalues: v76 (ref)
    local v227 = entity.get_local_player();
    if not v227 then
        return;
    else
        local l_m_fFlags_2 = v227.m_fFlags;
        local _ = l_m_fFlags_2 == bit.bor(l_m_fFlags_2, bit.lshift(1, 0));
        local v230 = l_m_fFlags_2 == bit.bor(l_m_fFlags_2, bit.lshift(2, 0));
        local v231 = v227.m_vecVelocity:length2d();
        local v232 = v227:get_player_weapon();
        if not v232 then
            return;
        else
            local v233 = v232:get_weapon_info();
            if not v76.visuals.refs:get(5) or ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get() then
                ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"):override();
                return;
            else
                if v76.visuals.fakelag_disablers:get("On DT") and ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() then
                    ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"):override(false);
                elseif v76.visuals.fakelag_disablers:get("On Onshot") and ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() then
                    ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"):override(false);
                elseif v76.visuals.fakelag_disablers:get("On Standing") and v231 < 5 and not v230 then
                    ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"):override(false);
                elseif v233.weapon_name == "weapon_knife" and v76.visuals.fakelag_disablers:get("On Knife") then
                    ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"):override(false);
                else
                    ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"):override();
                end;
                return;
            end;
        end;
    end;
end);
hitchance_func = function()
    -- upvalues: v76 (ref)
    local v234 = entity.get_local_player();
    local l_m_fFlags_3 = v234.m_fFlags;
    local v236 = l_m_fFlags_3 == bit.bor(l_m_fFlags_3, bit.lshift(1, 0));
    if not v234 then
        return;
    elseif not v76.visuals.refs:get(6) then
        ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"):override();
        ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"):override();
        ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"):override();
        ui.find("Aimbot", "Ragebot", "Selection", "R8 Revolver", "Hit Chance"):override();
        return;
    else
        if v76.visuals.hitchance:get("AWP") and not v234.m_bIsScoped and v76.visuals.AWP_noscope:get() and v236 ~= 0 then
            ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"):override(v76.visuals.AWP_noscope:get());
        else
            ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"):override();
        end;
        if v76.visuals.hitchance:get("SSG-08") and not v234.m_bIsScoped and v76.visuals.ssg_noscope:get() ~= 0 and v236 then
            ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"):override(v76.visuals.ssg_noscope:get());
        elseif v76.visuals.hitchance:get("SSG-08") and not v236 and v76.visuals.ssg_air:get() ~= 0 then
            ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"):override(v76.visuals.ssg_air:get());
        else
            ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"):override();
        end;
        if v76.visuals.hitchance:get("SCAR-20/G3SG1") and not v234.m_bIsScoped and v76.visuals.Auto_noscope:get() ~= 0 and v236 then
            ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"):override(v76.visuals.Auto_noscope:get());
        else
            ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"):override();
        end;
        if v76.visuals.hitchance:get("R8") and not v234.m_bIsScoped and v76.visuals.revoler_in_air:get() ~= 0 and not v236 then
            ui.find("Aimbot", "Ragebot", "Selection", "R8 Revolver", "Hit Chance"):override(v76.visuals.revoler_in_air:get());
        else
            ui.find("Aimbot", "Ragebot", "Selection", "R8 Revolver", "Hit Chance"):override();
        end;
        return;
    end;
end;
events.createmove:set(function()
    hitchance_func();
end);
local v237 = false;
local v238 = true;
events.player_hurt:set(function(v239)
    -- upvalues: v237 (ref)
    localplayer = entity.get_local_player();
    if not localplayer then
        return;
    else
        local v240 = entity.get(v239.userid, true);
        if entity.get(v239.attacker, true) ~= localplayer or v240 == localplayer then
            return;
        else
            v237 = true;
            return;
        end;
    end;
end);
local v241 = 255;
events.render:set(function()
    -- upvalues: v76 (ref), v47 (ref), v241 (ref), v237 (ref), v238 (ref)
    if not v76.visuals.crosshair_hit:get() or not v47:get(7) then
        return;
    else
        local v242 = render.screen_size();
        if not entity.get_local_player() then
            return;
        else
            if cycle == 1 then
                v241 = v241 - 3;
            else
                v241 = v241 + 1;
            end;
            if v241 <= 0 then
                cycle = 0;
            elseif v241 >= 255 then
                cycle = 1;
            end;
            if v237 then
                v241 = 255;
                v237 = false;
                v238 = true;
            end;
            if v238 then
                render.line(vector(v242.x / 2 + 4, v242.y / 2 + 4), vector(v242.x / 2 + 10, v242.y / 2 + 10), color(255, 255, 255, v241));
                render.line(vector(v242.x / 2 + 4, v242.y / 2 - 4), vector(v242.x / 2 + 10, v242.y / 2 - 10), color(255, 255, 255, v241));
                render.line(vector(v242.x / 2 - 4, v242.y / 2 + 4), vector(v242.x / 2 - 10, v242.y / 2 + 10), color(255, 255, 255, v241));
                render.line(vector(v242.x / 2 - 4, v242.y / 2 - 4), vector(v242.x / 2 - 10, v242.y / 2 - 10), color(255, 255, 255, v241));
            end;
            if v241 == 0 then
                v238 = false;
            end;
            return;
        end;
    end;
end);
local v243 = 2;
local v244 = 1;
local v245 = 0;
local v246 = 0;
events.createmove:set(function(v247)
    -- upvalues: v76 (ref), v52 (ref), v245 (ref), v243 (ref), v244 (ref)
    if not v76.conditions.defensive_feature[v52]:get() == 4 or ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"):get() then
        return;
    else
        if v247.choked_commands == 0 then
            local v248 = v76.conditions.defensivefeature_custom[v52]:get();
            if v76.conditions.body_yaw_jitter[v52]:get() and v248 ~= 0 then
                if v248 > 0 then
                    v248 = 0.05 * v248;
                end;
                v245 = v245 + 0.05;
                if v243 >= v76.conditions.defensivefeature_custom2[v52]:get() then
                    v243 = 0;
                    if v76.conditions.desync_fakelag[v52]:get() then
                        ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):override(v76.conditions.body_yaw_leftlimit[v52]:get());
                        ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):override(v76.conditions.body_yaw_rightlimit[v52]:get());
                    end;
                end;
                if v248 < v245 then
                    if v76.conditions.delay_jitter_fakelag_feature[v52]:get() == 3 and v76.conditions.refs[v52]:get(3) then
                        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override(math.random(1, 3));
                    else
                        ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override(1);
                    end;
                    if v76.conditions.defensive_feature[v52]:get() == 4 then
                        v247.force_defensive = true;
                        if v76.conditions.desync_fakelag[v52]:get() then
                            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):override(v76.conditions.body_yaw_leftlimit[v52]:get() / 3);
                            ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):override(v76.conditions.body_yaw_rightlimit[v52]:get() / 3);
                        end;
                    end;
                    v245 = 0;
                    v244 = v244 + 1;
                elseif v76.conditions.defensive_feature[v52]:get() == 4 then
                    ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override();
                    if v76.conditions.desync_fakelag[v52]:get() then
                        ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"):override(v76.conditions.body_yaw_leftlimit[v52]:get() / 2);
                        ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"):override(v76.conditions.body_yaw_rightlimit[v52]:get() / 2);
                    end;
                end;
                if v244 >= 2 then
                    v243 = v243 + 2;
                end;
            else
                if v76.conditions.delay_jitter_fakelag_feature[v52]:get() == 3 and v76.conditions.refs[v52]:get(3) then
                    ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override();
                end;
                v245 = 0;
                v244 = v244 + 1;
            end;
        end;
        return;
    end;
end);
events.round_start:set(function()
    -- upvalues: v243 (ref), v244 (ref), v245 (ref), v246 (ref)
    v243 = 2;
    v244 = 1;
    v245 = 0;
    v246 = 0;
end);