_DEBUG = true;
local v0 = render.screen_size();
local v1 = "Trial";
local v2 = common.get_username();
local v3 = "RealPaste";
local v4 = "senkotech";
local v5 = "f9305f67131b228e14008189ef6101bb";
local l_unzip_0 = require("neverlose/unzip");
local l_system_0 = require("neverlose/drag_system");
local l_monylinear_0 = require("neverlose/monylinear");
local _ = require("neverlose/clipboard");
local l_mtools_0 = require("neverlose/mtools");
local l_hook_0 = require("neverlose/excellent_hook");
local l_lambotruck_0 = require("neverlose/lambotruck");
local l_minterface_0 = require("neverlose/minterface");
local l_find_0 = ui.find;
scripttextpasxa = v3;
l_mtools_0.FileSystem.CreateDir("nl\\RealPaste");
l_mtools_0.FileSystem.CreateDir("nl\\RealPaste\\killmarks");
l_mtools_0.FileSystem.CreateDir("csgo\\sound\\killmarks");
l_mtools_0.FileSystem.CreateDir("csgo\\sound\\killmarks\\sound");
l_mtools_0.FileSystem.CreateDir("csgo\\resource\\overviews\\senko");
l_mtools_0.Network.Download("https://nopublic.myarena.site/dwnfilesnl/nl.rar", "nl\\RealPaste\\rpl.rar", true);
l_mtools_0.Network.Download("https://nopublic.myarena.site/dwnfilesnl/nl.rar", "nl\\RealPaste\\sound.rar", true);
l_unzip_0.unzip_file("nl\\RealPaste", "nl\\", "rpl.rar");
l_unzip_0.unzip_file("nl\\RealPaste", "csgo\\", "sound.rar");
lerp = function(v15, v16, v17)
    return v15 + (v16 - v15) * v17;
end;
style = function(v18, v19, v20, v21, v22, v23, v24)
    local l_r_0 = v22.r;
    local l_g_0 = v22.g;
    local l_b_0 = v22.b;
    local l_a_0 = v22.a;
    if not v24:get() then
        render.blur(vector(v18, v19), vector(v18 + v20, v19 + v21), 1, v23);
    end;
    render.rect(vector(v18, v19), vector(v18 + v20, v19 + v21), color(bakolor.r, bakolor.g, bakolor.b, bakolor.a * v23), 2);
    render.rect(vector(v18, v19), vector(v18 + v20, v19 + 1), color(l_r_0, l_g_0, l_b_0, l_a_0));
    render.gradient(vector(v18, v19), vector(v18 + 1, v19 + 1 + v21), color(l_r_0, l_g_0, l_b_0, l_a_0), color(l_r_0, l_g_0, l_b_0, l_a_0), color(l_r_0, l_g_0, l_b_0, v23), color(l_r_0, l_g_0, l_b_0, v23));
    render.gradient(vector(v18 + v20 - 1, v19), vector(v18 + v20, v19 + 1 + v21), color(l_r_0, l_g_0, l_b_0, l_a_0), color(l_r_0, l_g_0, l_b_0, l_a_0), color(l_r_0, l_g_0, l_b_0, v23), color(l_r_0, l_g_0, l_b_0, v23));
    render.rect(vector(v18, v19 + v21 - 1), vector(v18 + v20, v19 + v21), color(l_r_0, l_g_0, l_b_0, v23));
end;
style2 = function(v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, _, v41, v42, v43, v44, v45)
    -- upvalues: l_mtools_0 (ref)
    local l_r_1 = v33.r;
    local l_g_1 = v33.g;
    local l_b_1 = v33.b;
    local _ = v33.a;
    if v41:get() == "Simple" then
        if v36:get() == "Round" then
            if not v45:get() then
                render.blur(vector(v29, v30), vector(v29 + v31, v30 + v32), 1, v34, v35:get());
            end;
            render.rect(vector(v29, v30), vector(v29 + v31, v30 + v32), color(bakolor.r, bakolor.g, bakolor.b, bakolor.a * v34), v35:get());
            render.rect_outline(vector(v29, v30), vector(v29 + v31, v30 + v32), color(l_r_1, l_g_1, l_b_1, 255 * v34), 1, v35:get());
            if v37:get() and not v45:get() then
                l_mtools_0.Render.Box_Outline_Glow({
                    vector(v29, v30), 
                    vector(v29 + v31, v30 + v32)
                }, color(l_r_1, l_g_1, l_b_1, v34 * 255), v38:get() * 5, v35:get());
            end;
        elseif v36:get() == "Up" then
            if not v45:get() then
                render.blur(vector(v29, v30), vector(v29 + v31, v30 + v32), 1, v34, 0);
            end;
            render.rect(vector(v29, v30), vector(v29 + v31, v30 + v32), color(bakolor.r, bakolor.g, bakolor.b, bakolor.a * v34), 0);
            render.rect(vector(v29, v30), vector(v29 + v31, v30 + 2), color(l_r_1, l_g_1, l_b_1, 255 * v34), 0);
            if v37:get() and not v45:get() then
                render.shadow(vector(v29, v30), vector(v29 + v31, v30 + v32), color(l_r_1, l_g_1, l_b_1, 255 * v34), v38:get(), nil, 0);
            end;
        elseif v36:get() == "Down" then
            if not v45:get() then
                render.blur(vector(v29, v30), vector(v29 + v31, v30 + v32), 1, v34, 0);
            end;
            render.rect(vector(v29, v30), vector(v29 + v31, v30 + v32), color(bakolor.r, bakolor.g, bakolor.b, bakolor.a * v34), 0);
            render.rect(vector(v29, v30 + v32 - 2), vector(v29 + v31, v30 + v32), color(l_r_1, l_g_1, l_b_1, 255 * v34), 0);
            if v37:get() and not v45:get() then
                render.shadow(vector(v29, v30), vector(v29 + v31, v30 + v32), color(l_r_1, l_g_1, l_b_1, 255 * v34), v38:get(), nil, 0);
            end;
        elseif v36:get() == "Left+Right" then
            if not v45:get() then
                render.blur(vector(v29, v30), vector(v29 + v31, v30 + v32), 1, v34, 0);
            end;
            render.rect(vector(v29, v30), vector(v29 + v31, v30 + v32), color(bakolor.r, bakolor.g, bakolor.b, bakolor.a * v34), 0);
            render.rect(vector(v29 - 2, v30 + v39:get() / 2), vector(v29, v30 + v32 - v39:get() / 2), color(l_r_1, l_g_1, l_b_1, 255 * v34), 0);
            render.rect(vector(v29 + v31, v30 + v39:get() / 2), vector(v29 + v31 + 2, v30 + v32 - v39:get() / 2), color(l_r_1, l_g_1, l_b_1, 255 * v34), 0);
            if v37:get() and not v45:get() then
                render.shadow(vector(v29 - 2, v30 + v39:get() / 2), vector(v29, v30 + v32 - v39:get() / 2), color(l_r_1, l_g_1, l_b_1, 255 * v34), v38:get(), nil, 0);
                render.shadow(vector(v29 + v31, v30 + v39:get() / 2), vector(v29 + v31 + 2, v30 + v32 - v39:get() / 2), color(l_r_1, l_g_1, l_b_1, 255 * v34), v38:get(), nil, 0);
            end;
        elseif v36:get() == "Off" then
            if not v45:get() then
                render.blur(vector(v29, v30), vector(v29 + v31, v30 + v32), 1, v34, v35:get());
            end;
            render.rect(vector(v29, v30), vector(v29 + v31, v30 + v32), color(bakolor.r, bakolor.g, bakolor.b, bakolor.a * v34), v35:get());
            if v37:get() and not v45:get() then
                l_mtools_0.Render.Box_Outline_Glow({
                    vector(v29, v30), 
                    vector(v29 + v31, v30 + v32)
                }, color(l_r_1, l_g_1, l_b_1, v34 * 255), v38:get() * 5, v35:get());
            end;
        end;
    elseif v41:get() == "Gradient" then
        if v42:get() == "Not Rounded" then
            if v43:get() == "Up" then
                if not v45:get() then
                    render.blur(vector(v29, v30), vector(v29 + v31, v30 + v32), 1, v34, 0);
                end;
                render.rect(vector(v29, v30), vector(v29 + v31, v30 + v32), color(bakolor.r, bakolor.g, bakolor.b, bakolor.a * v34), 0);
                render.gradient(vector(v29, v30), vector(v29 + v31 / 2, v30 + 2), color(0, 0, 0, v34), color(l_r_1, l_g_1, l_b_1, 255 * v34), color(0, 0, 0, v34), color(l_r_1, l_g_1, l_b_1, 255 * v34));
                render.gradient(vector(v29 + v31 / 2, v30), vector(v29 + v31, v30 + 2), color(l_r_1, l_g_1, l_b_1, 255 * v34), color(0, 0, 0, v34), color(l_r_1, l_g_1, l_b_1, 255 * v34), color(0, 0, 0, v34));
            elseif v43:get() == "Down" then
                if not v45:get() then
                    render.blur(vector(v29, v30), vector(v29 + v31, v30 + v32), 1, v34, 0);
                end;
                render.rect(vector(v29, v30), vector(v29 + v31, v30 + v32), color(bakolor.r, bakolor.g, bakolor.b, bakolor.a * v34), 0);
                render.gradient(vector(v29, v30 + v32), vector(v29 + v31 / 2, v30 + v32 - 2), color(0, 0, 0, v34), color(l_r_1, l_g_1, l_b_1, 255 * v34), color(0, 0, 0, v34), color(l_r_1, l_g_1, l_b_1, 255 * v34));
                render.gradient(vector(v29 + v31 / 2, v30 + v32), vector(v29 + v31, v30 + v32 - 2), color(l_r_1, l_g_1, l_b_1, 255 * v34), color(0, 0, 0, v34), color(l_r_1, l_g_1, l_b_1, 255 * v34), color(0, 0, 0, v34));
            end;
            if v37:get() and not v45:get() then
                render.shadow(vector(v29, v30), vector(v29 + v31, v30 + v32), color(l_r_1, l_g_1, l_b_1, 255 * v34), v38:get(), nil, 0);
            end;
        elseif v42:get() == "Rounded" then
            if v44:get() == "Up" then
                if not v45:get() then
                    render.blur(vector(v29, v30), vector(v29 + v31, v30 + v32), 1, v34, 5);
                end;
                render.rect(vector(v29, v30), vector(v29 + v31, v30 + v32), color(bakolor.r, bakolor.g, bakolor.b, bakolor.a * v34), 5);
                render.circle_outline(vector(v29 + 7, v30 + 7), color(l_r_1, l_g_1, l_b_1, 255 * v34), 8, 180, 0.25, 1);
                render.circle_outline(vector(v29 + v31 - 7, v30 + 7), color(l_r_1, l_g_1, l_b_1, 255 * v34), 8, -90, 0.25, 1);
                render.gradient(vector(v29, v30 + 7), vector(v29 - 1, v30 + v32 - 5), color(l_r_1, l_g_1, l_b_1, 255 * v34), color(l_r_1, l_g_1, l_b_1, 255 * v34), color(l_r_1 / 4, l_g_1 / 4, l_b_1 / 4, 255 * v34), color(l_r_1 / 4, l_g_1 / 4, l_b_1 / 4, 255 * v34));
                render.gradient(vector(v29 + v31, v30 + 7), vector(v29 + v31 + 1, v30 + v32 - 5), color(l_r_1, l_g_1, l_b_1, 255 * v34), color(l_r_1, l_g_1, l_b_1, 255 * v34), color(l_r_1 / 4, l_g_1 / 4, l_b_1 / 4, 255 * v34), color(l_r_1 / 4, l_g_1 / 4, l_b_1 / 4, 255 * v34));
                render.rect(vector(v29 + 3, v30), vector(v29 + v31 - 3, v30 + 1), color(l_r_1, l_g_1, l_b_1, 255 * v34), 0);
            elseif v44:get() == "Down" then
                if not v45:get() then
                    render.blur(vector(v29, v30), vector(v29 + v31, v30 + v32), 1, v34, 5);
                end;
                render.rect(vector(v29, v30), vector(v29 + v31, v30 + v32), color(bakolor.r, bakolor.g, bakolor.b, bakolor.a * v34), 5);
                render.circle_outline(vector(v29 + 7, v30 + v32 - 7), color(l_r_1, l_g_1, l_b_1, 255 * v34), 8, 90, 0.25, 1);
                render.circle_outline(vector(v29 + v31 - 7, v30 + v32 - 7), color(l_r_1, l_g_1, l_b_1, 255 * v34), 8, 0, 0.25, 1);
                render.gradient(vector(v29, v30 + 6), vector(v29 + 1, v30 + v32 - 5), color(l_r_1 / 4, l_g_1 / 4, l_b_1 / 4, 255 * v34), color(l_r_1 / 4, l_g_1 / 4, l_b_1 / 4, 255 * v34), color(l_r_1, l_g_1, l_b_1, 255 * v34), color(l_r_1, l_g_1, l_b_1, 255 * v34));
                render.gradient(vector(v29 + v31, v30 + 6), vector(v29 + v31 - 1, v30 + v32 - 5), color(l_r_1 / 4, l_g_1 / 4, l_b_1 / 4, 255 * v34), color(l_r_1 / 4, l_g_1 / 4, l_b_1 / 4, 255 * v34), color(l_r_1, l_g_1, l_b_1, 255 * v34), color(l_r_1, l_g_1, l_b_1, 255 * v34));
                render.rect(vector(v29 + 4, v30 + v32 - 1), vector(v29 + v31 - 4, v30 + v32), color(l_r_1, l_g_1, l_b_1, 255 * v34), 0);
            end;
            if v37:get() and not v45:get() then
                l_mtools_0.Render.Box_Outline_Glow({
                    vector(v29, v30), 
                    vector(v29 + v31, v30 + v32)
                }, color(l_r_1, l_g_1, l_b_1, v34 * 255), v38:get() * 5, 5);
            end;
        end;
    end;
end;
local v50 = 0;
getInfoFPS = function()
    -- upvalues: v50 (ref)
    v50 = 0.9 * v50 + 0.09999999999999998 * globals.absoluteframetime;
    return math.floor(1 / v50 + 0.5);
end;
getInfoPING = function()
    local v51 = utils.net_channel();
    if v51 == nil then
        return "0";
    else
        local v52 = v51.latency[1];
        return string.format("%1.f", math.max(0, v52) * 1000);
    end;
end;
local v53 = {
    time = "", 
    ping = getInfoPING(), 
    fps = getInfoFPS(), 
    oldFps = getInfoFPS()
};
cvar.clear:call();
common.add_notify("RealPaste", "Welcome back," .. v2 .. "!");
print_raw("\aDEFAULT======================================");
print_raw("\aDEFAULTRealPaste \a8699FFFF[" .. v1 .. "]");
print_raw("\aDEFAULTUser: \a8699FFFF" .. v2 .. "");
print_raw("\aDEFAULTDiscord: \a8699FFFFhttps://discord.gg/jFQ8aT3BMT");
print_raw("\aDEFAULT======================================");
local v54 = {};
local v55 = false;
LoadImagesKillMark = function()
    -- upvalues: v54 (ref), v55 (ref)
    if pcall(function()
        -- upvalues: v54 (ref)
        v54.Headshot = render.load_image_from_file("nl\\RealPaste\\killmarks\\headkill.png", vector(100, 100));
        v54["1"] = render.load_image_from_file("nl\\RealPaste\\killmarks\\kill.png", vector(100, 100));
        v54["2"] = render.load_image_from_file("nl\\RealPaste\\killmarks\\kill2.png", vector(100, 100));
        v54["3"] = render.load_image_from_file("nl\\RealPaste\\killmarks\\kill3.png", vector(100, 100));
        v54["4"] = render.load_image_from_file("nl\\RealPaste\\killmarks\\kill4.png", vector(100, 100));
        v54["5"] = render.load_image_from_file("nl\\RealPaste\\killmarks\\kill5.png", vector(100, 100));
        v54["6"] = render.load_image_from_file("nl\\RealPaste\\killmarks\\kill6.png", vector(100, 100));
        v54.headdown = render.load_image_from_file("nl\\RealPaste\\killmarks\\headkilldown.png", vector(100, 100));
        v54.bodydown = render.load_image_from_file("nl\\RealPaste\\killmarks\\killdown.png", vector(100, 100));
        dog = render.load_image_from_file("nl\\RealPaste\\dog.png", vector(103.83333333333333, 148.5));
        typdog = render.load_image_from_file("nl\\RealPaste\\typdog.png", vector(400, 400));
    end) then
        v55 = true;
    else
        v55 = false;
    end;
end;
l_mtools_0.Network.Download("https://i.imgur.com/fivXyPZ.png", "csgo\\resource\\overviews\\senko\\senko.png", true, 5);
senkopngda = render.load_image_from_file("csgo\\resource\\overviews\\senko\\senko.png", vector(560, 670));
LoadImagesKillMark();
local v56 = {
    pixel200 = render.load_font("nl\\RealPaste\\Pixel.ttf", 200, "a"), 
    pixel100 = render.load_font("nl\\RealPaste\\Pixel.ttf", 100, "a"), 
    pixel = render.load_font("nl\\RealPaste\\Pixel.ttf", 10, "ao"), 
    pixel11 = render.load_font("nl\\RealPaste\\Pixel.ttf", 11), 
    pixel30 = render.load_font("nl\\RealPaste\\Pixel.ttf", 30), 
    pixel35 = render.load_font("nl\\RealPaste\\Pixel.ttf", 35), 
    pixel24 = render.load_font("nl\\RealPaste\\Pixel.ttf", 24), 
    verdana = render.load_font("nl\\RealPaste\\Verdana.ttf", 14), 
    verdanaind = render.load_font("nl\\RealPaste\\Verdana.ttf", 12, "ao"), 
    verdana12 = render.load_font("nl\\RealPaste\\Verdana.ttf", 11), 
    verdana18 = render.load_font("nl\\RealPaste\\Verdana.ttf", 18)
};
local v57 = {
    view_fov = cvar.viewmodel_fov, 
    view_off_x = cvar.viewmodel_offset_x, 
    view_off_y = cvar.viewmodel_offset_y, 
    view_off_z = cvar.viewmodel_offset_z, 
    aspectratio = cvar.r_aspectratio, 
    bob_low = cvar.cl_bob_lower_amt, 
    bob_lat = cvar.cl_bobamt_lat, 
    bob_vert = cvar.cl_bobamt_vert, 
    bobcyc = cvar.cl_bobcycle, 
    view_shift_l = cvar.cl_viewmodel_shift_left_amt, 
    view_shift_r = cvar.cl_viewmodel_shift_right_amt, 
    view_rec = cvar.viewmodel_recoil
};
oldfov = v57.view_fov:int();
oldofx = v57.view_off_x:float();
oldofy = v57.view_off_y:float();
oldofz = v57.view_off_z:float();
RealPaste = {
    Main = {
        discord = l_minterface_0.Button({
            [1] = nil, 
            [2] = nil, 
            [3] = 1, 
            [1] = ui.get_icon("thumbs-up") .. " Main", 
            [2] = ui.get_icon("vihara") .. " Main"
        }, ui.get_icon("blog") .. " Discord Link", {}, "Opens a link to the script's discord", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/jFQ8aT3BMT");
        end), 
        downkill = l_minterface_0.Button({
            [1] = nil, 
            [2] = nil, 
            [3] = 2, 
            [1] = ui.get_icon("thumbs-up") .. " Main", 
            [2] = ui.get_icon("vihara") .. " Main"
        }, ui.get_icon("play") .. " Download Materials", {}, "Download materials for killmarks and pictures for Dog", function()
            -- upvalues: l_mtools_0 (ref)
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998958739883302964/badge_headshot.png", "nl\\RealPaste\\killmarks\\kill.png", true, 5);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998958740244005025/badge_headshot_gold.png", "nl\\RealPaste\\killmarks\\headkill.png", true, 5);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998958740558598224/badge_multi2.png", "nl\\RealPaste\\killmarks\\kill2.png", true, 5);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998958740873162812/badge_multi3.png", "nl\\RealPaste\\killmarks\\kill3.png", true, 5);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998958741183528990/badge_multi4.png", "nl\\RealPaste\\killmarks\\kill4.png", true, 5);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998958741577809970/badge_multi5.png", "nl\\RealPaste\\killmarks\\kill5.png", true, 5);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998958738880872549/badge_multi6.png", "nl\\RealPaste\\killmarks\\kill6.png", true, 5);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998958739522588804/badge_elite.png", "nl\\RealPaste\\killmarks\\killdown.png", true, 5);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998958739199631390/badge_crosshair.png", "nl\\RealPaste\\killmarks\\headkilldown.png", true, 5);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998958937623773254/Headshot_BL.wav", "csgo\\sound\\killmarks\\sound\\Headshot_1.wav", true, 12576);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998958937955106916/Headshot_GR.wav", "csgo\\sound\\killmarks\\sound\\Headshot_2.wav", true, 5);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998958938303242280/Headshot_SP.wav", "csgo\\sound\\killmarks\\sound\\Headshot_3.wav", true, 5);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998958960897949706/MultiKill_2_GR.wav", "csgo\\sound\\killmarks\\sound\\MultiKill_21.wav", true, 13520);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998958961187377193/MultiKill_2_SP.wav", "csgo\\sound\\killmarks\\sound\\MultiKill_22.wav", true, 5);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998958961556459641/MultiKill_2_BL.wav", "csgo\\sound\\killmarks\\sound\\MultiKill_23.wav", true, 12404);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998958976517554307/MultiKill_3_SP.wav", "csgo\\sound\\killmarks\\sound\\MultiKill_31.wav", true, 14860);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998958976785993818/MultiKill_3_BL.wav", "csgo\\sound\\killmarks\\sound\\MultiKill_32.wav", true, 15192);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998958977058611250/MultiKill_3_GR.wav", "csgo\\sound\\killmarks\\sound\\MultiKill_33.wav", true, 11760);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998959071057158164/MultiKill_4_SP.wav", "csgo\\sound\\killmarks\\sound\\MultiKill_41.wav", true, 14812);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998959071338184864/MultiKill_4_BL.wav", "csgo\\sound\\killmarks\\sound\\MultiKill_42.wav", true, 14276);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998959071677906984/MultiKill_4_GR.wav", "csgo\\sound\\killmarks\\sound\\MultiKill_43.wav", true, 12924);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998959090866864219/MultiKill_5_SP.wav", "csgo\\sound\\killmarks\\sound\\MultiKill_51.wav", true, 13076);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998959091118518312/MultiKill_5_BL.wav", "csgo\\sound\\killmarks\\sound\\MultiKill_52.wav", true, 13872);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998959091349213224/MultiKill_5_GR.wav", "csgo\\sound\\killmarks\\sound\\MultiKill_53.wav", true, 12016);
            l_mtools_0.Network.Download("https://cdn.discordapp.com/attachments/998958536908349501/998959091349213224/MultiKill_5_GR.wav", "csgo\\sound\\killmarks\\sound\\MultiKill_53.wav", true, 12016);
            LoadImagesKillMark();
        end), 
        dogonscreen = l_minterface_0.Switch({
            [1] = nil, 
            [2] = nil, 
            [3] = 2, 
            [1] = ui.get_icon("thumbs-up") .. " Main", 
            [2] = ui.get_icon("vihara") .. " Main"
        }, "Dog", {
            [1] = false
        }, nil, function(v58)
            -- upvalues: l_minterface_0 (ref), v0 (ref)
            return {
                X = l_minterface_0.Slider(v58, "X", {
                    [1] = 25, 
                    [2] = 0, 
                    [3] = v0.x
                }), 
                Y = l_minterface_0.Slider(v58, "Y", {
                    [1] = nil, 
                    [2] = 0, 
                    [1] = v0.y / 2 + 25, 
                    [3] = v0.y
                }), 
                dogstyle = l_minterface_0.Combo(v58, "Dog Style", {
                    [1] = {
                        [1] = "Elite", 
                        [2] = "Typical"
                    }
                })
            };
        end), 
        optimize = l_minterface_0.Switch({
            [1] = nil, 
            [2] = nil, 
            [3] = 1, 
            [1] = ui.get_icon("thumbs-up") .. " Main", 
            [2] = ui.get_icon("vihara") .. " Main"
        }, "Optimisation", {
            [1] = false
        }, "Remove some customisations and boost fps"), 
        nothing = l_minterface_0.Button({
            [1] = nil, 
            [2] = nil, 
            [3] = 1, 
            [1] = ui.get_icon("thumbs-up") .. " Main", 
            [2] = ui.get_icon("vihara") .. " Main"
        }, "Nothing", {}, nil, function()
            cvar.quit:call();
        end)
    }, 
    Configs = {
        copycfg = l_minterface_0.Button({
            [1] = nil, 
            [2] = nil, 
            [3] = 2, 
            [1] = ui.get_icon("thumbs-up") .. " Main", 
            [2] = ui.get_icon("gear") .. " Config"
        }, ui.get_icon("upload") .. "   Copy  ", {}, nil, function()
            Config("Save");
        end), 
        insertcfg = l_minterface_0.Button({
            [1] = nil, 
            [2] = nil, 
            [3] = 2, 
            [1] = ui.get_icon("thumbs-up") .. " Main", 
            [2] = ui.get_icon("gear") .. " Config"
        }, ui.get_icon("download") .. "   Insert  ", {}, nil, function()
            Config("Load");
        end), 
        defcfg = l_minterface_0.Button({
            [1] = nil, 
            [2] = nil, 
            [3] = 2, 
            [1] = ui.get_icon("thumbs-up") .. " Main", 
            [2] = ui.get_icon("gear") .. " Config"
        }, ui.get_icon("folder") .. "   Default  ", {}, nil, function()
            -- upvalues: v1 (ref)
            if v1 == "Debug" then
                network.get("https://nopublic.myarena.site/rplnllua/deffbugcfg.php", nil, function(v59)
                    Config("Load", "" .. v59 .. "");
                end);
            else
                network.get("https://nopublic.myarena.site/rplnllua/deffcfg.php", nil, function(v60)
                    Config("Load", "" .. v60 .. "");
                end);
            end;
        end)
    }, 
    Rage = {
        idealpeek = l_minterface_0.Switch({
            [1] = ui.get_icon("thumbs-up") .. " Main", 
            [2] = ui.get_icon("wheelchair") .. " Rage"
        }, "Ideal Peek", {
            [1] = false
        }, "Freestanding + Peek Assist + Double Tap \nOnly for binding!", function(v61)
            -- upvalues: l_minterface_0 (ref)
            return {
                mode = l_minterface_0.Combo(v61, "Mode", {
                    [1] = {
                        [1] = "Default", 
                        [2] = "Custom"
                    }
                }), 
                custom = l_minterface_0.MultiCombo(v61, "Custom", {
                    [1] = {
                        [1] = "DoubleTap", 
                        [2] = "AutoPeek", 
                        [3] = "Freestand", 
                        [4] = "Extended Backtrack", 
                        [5] = "Min Damage"
                    }
                }), 
                mdmg = l_minterface_0.Slider(v61, "Min. Damage", {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = 50
                })
            };
        end), 
        hitchance = l_minterface_0.MultiCombo({
            [1] = ui.get_icon("thumbs-up") .. " Main", 
            [2] = ui.get_icon("wheelchair") .. " Rage"
        }, "Custom hitchance", {
            [1] = {
                [1] = "Air", 
                [2] = "NoScope", 
                [3] = "Crouch"
            }
        }, nil, function(v62)
            -- upvalues: l_minterface_0 (ref)
            return {
                wahc = l_minterface_0.MultiCombo(v62, "Air Weapon", {
                    [1] = {
                        [1] = "Autosniper", 
                        [2] = "SSG 08", 
                        [3] = "AWP", 
                        [4] = "R8 Revolver", 
                        [5] = "Shotgun", 
                        [6] = "Others"
                    }
                }), 
                ahc = l_minterface_0.Slider(v62, "Air Value", {
                    [1] = 35, 
                    [2] = 0, 
                    [3] = 70
                }), 
                wnshc = l_minterface_0.MultiCombo(v62, "Noscope Weapon", {
                    [1] = {
                        [1] = "Autosniper", 
                        [2] = "SSG 08", 
                        [3] = "AWP"
                    }
                }), 
                nshc = l_minterface_0.Slider(v62, "NoScope Value", {
                    [1] = 45, 
                    [2] = 0, 
                    [3] = 70
                }), 
                wcrhc = l_minterface_0.MultiCombo(v62, "Crouch Weapon", {
                    [1] = {
                        [1] = "Autosniper", 
                        [2] = "SSG 08", 
                        [3] = "AWP"
                    }
                }), 
                crhc = l_minterface_0.Slider(v62, "Crouch Value", {
                    [1] = 30, 
                    [2] = 0, 
                    [3] = 50
                })
            };
        end), 
        adaptiveexp = l_minterface_0.Switch({
            [1] = ui.get_icon("thumbs-up") .. " Main", 
            [2] = ui.get_icon("wheelchair") .. " Rage"
        }, "Force Break LC", {
            [1] = false
        }, "Always On and Break LC in doubletap and hideshots respectively", function(v63)
            -- upvalues: l_minterface_0 (ref)
            return {
                cond = l_minterface_0.MultiCombo(v63, "Enable when", {
                    [1] = {
                        [1] = "Standing", 
                        [2] = "Moving", 
                        [3] = "Slow walking", 
                        [4] = "Air", 
                        [5] = "Crouching", 
                        [6] = "Air-Crouch"
                    }, 
                    [2] = {
                        [1] = "Air", 
                        [2] = "Air-Crouch"
                    }
                })
            };
        end)
    }, 
    AntiAim = {
        preset = l_minterface_0.Combo({
            [1] = ui.get_icon("user-shield") .. " AntiAim", 
            [2] = ui.get_icon("user-circle") .. " Main"
        }, "Presets", {
            [1] = {
                [1] = "Disabled", 
                [2] = "Half-Jitter", 
                [3] = "Static", 
                [4] = "SH1ZA", 
                [5] = "kysmeow\226\157\164\239\184\143", 
                [6] = "Custom"
            }
        }), 
        ybase = l_minterface_0.Combo({
            [1] = ui.get_icon("user-shield") .. " AntiAim", 
            [2] = ui.get_icon("user-circle") .. " Main"
        }, "Manual Yaw Base", {
            [1] = {
                [1] = "Preset", 
                [2] = "Forward", 
                [3] = "Left", 
                [4] = "Right"
            }
        }), 
        abrik = l_minterface_0.MultiCombo({
            [1] = ui.get_icon("user-shield") .. " AntiAim", 
            [2] = ui.get_icon("user-circle") .. " Main"
        }, "\a84A166FFAnim Breakers", {
            [1] = {
                [1] = "Legs", 
                [2] = "Pitch 0 on Land", 
                [3] = "Disable Move Lean"
            }
        }, nil, function(v64)
            -- upvalues: l_minterface_0 (ref)
            return {
                wmode = l_minterface_0.Combo(v64, "Legs When Move", {
                    [1] = {
                        [1] = "Disabled", 
                        [2] = "Static", 
                        [3] = "Dog"
                    }
                }), 
                amode = l_minterface_0.Combo(v64, "Legs In Air", {
                    [1] = {
                        [1] = "Disabled", 
                        [2] = "Static", 
                        [3] = "Dog"
                    }
                })
            };
        end), 
        tweek = l_minterface_0.MultiCombo({
            [1] = ui.get_icon("user-shield") .. " AntiAim", 
            [2] = ui.get_icon("user-circle") .. " Main"
        }, "Tweaks", {
            [1] = {
                [1] = "Static Manuals", 
                [2] = "Disable AA On Warmup", 
                [3] = "Fast Ladder", 
                [4] = "Edge Yaw"
            }
        }), 
        legitaa = l_minterface_0.Switch({
            [1] = ui.get_icon("user-shield") .. " AntiAim", 
            [2] = ui.get_icon("user-circle") .. " Main"
        }, "Legit AA on E", {
            [1] = false
        }, nil, function(v65)
            -- upvalues: l_minterface_0 (ref)
            return {
                mode = l_minterface_0.Combo(v65, "Mode", {
                    [1] = {
                        [1] = "Static", 
                        [2] = "Jitter", 
                        [3] = "Custom"
                    }
                }), 
                base = l_minterface_0.Combo(v65, "Base", {
                    [1] = {
                        [1] = "Local View", 
                        [2] = "At Target"
                    }
                }), 
                cbase = l_minterface_0.Combo(v65, "Yaw Base", {
                    [1] = {
                        [1] = "Disabled", 
                        [2] = "Backward", 
                        [3] = "At Target"
                    }
                }), 
                caddl = l_minterface_0.Slider(v65, "Yaw Add Left", {
                    [1] = -100, 
                    [2] = -180, 
                    [3] = -100
                }), 
                caddr = l_minterface_0.Slider(v65, "Yaw Add Right", {
                    [1] = 100, 
                    [2] = 100, 
                    [3] = 180
                }), 
                cmod = l_minterface_0.Combo(v65, "Yaw Modifier", {
                    [1] = {
                        [1] = "Disabled", 
                        [2] = "Center", 
                        [3] = "Offset", 
                        [4] = "Random", 
                        [5] = "Spin", 
                        [6] = "3-Way", 
                        [7] = "5-Way"
                    }
                }, nil), 
                cdegr = l_minterface_0.Slider(v65, "Modifier Degree", {
                    [1] = 0, 
                    [2] = -180, 
                    [3] = 180
                }), 
                cbody = l_minterface_0.Switch(v65, "Body Yaw", {
                    [1] = false
                }, nil), 
                cdesl = l_minterface_0.Slider(v65, "Left Limit", {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = 60
                }), 
                cdesr = l_minterface_0.Slider(v65, "Right Limit", {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = 60
                }), 
                copt = l_minterface_0.MultiCombo(v65, "Fake Options", {
                    [1] = {
                        [1] = "Avoid Overlap", 
                        [2] = "Jitter", 
                        [3] = "Randomize Jitter", 
                        [4] = "Anti Bruteforce"
                    }
                }), 
                cfres = l_minterface_0.Combo(v65, "FreeStand Desync", {
                    [1] = {
                        [1] = "Off", 
                        [2] = "Peek Fake", 
                        [3] = "Peek Real"
                    }
                })
            };
        end), 
        defaa = l_minterface_0.Switch({
            [1] = ui.get_icon("user-shield") .. " AntiAim", 
            [2] = ui.get_icon("user-circle") .. " Main"
        }, "Fishing AA", {
            [1] = false
        }, nil, function(v66)
            -- upvalues: l_minterface_0 (ref)
            return {
                pitch = l_minterface_0.Switch(v66, "Pitch Exploit", {
                    [1] = false
                }, nil), 
                cpitch = l_minterface_0.Combo(v66, "Pitch Settings", {
                    [1] = {
                        [1] = "Up", 
                        [2] = "Up Half", 
                        [3] = "Down Half", 
                        [4] = "Random"
                    }
                }), 
                base = l_minterface_0.Switch(v66, "Yaw Flicker", {
                    [1] = false
                }, nil), 
                cbase = l_minterface_0.Combo(v66, "Yaw Settings", {
                    [1] = {
                        [1] = "RealFish", 
                        [2] = "Forward", 
                        [3] = "3-Way", 
                        [4] = "5-Way", 
                        [5] = "Random"
                    }
                }), 
                cond = l_minterface_0.MultiCombo(v66, "Disable when", {
                    [1] = {
                        [1] = "Standing", 
                        [2] = "Moving", 
                        [3] = "Slow walking", 
                        [4] = "Air", 
                        [5] = "Crouching", 
                        [6] = "Air-Crouch", 
                        [7] = "Legit AA", 
                        [8] = "Auto Peek"
                    }, 
                    [2] = {
                        [1] = "Legit AA", 
                        [2] = "Auto Peek"
                    }
                })
            };
        end), 
        Condition = l_minterface_0.Combo({
            [1] = nil, 
            [2] = "Custom", 
            [1] = ui.get_icon("user-shield") .. " AntiAim"
        }, "Condition", {
            [1] = {
                [1] = "Global", 
                [2] = "Standing", 
                [3] = "Moving", 
                [4] = "Slow walking", 
                [5] = "Air", 
                [6] = "Crouching", 
                [7] = "Air-Crouch"
            }
        })
    }, 
    AACfgs = {
        copyaa = l_minterface_0.Button({
            [1] = nil, 
            [2] = nil, 
            [3] = 1, 
            [1] = ui.get_icon("user-shield") .. " AntiAim", 
            [2] = ui.get_icon("gear") .. " Config"
        }, ui.get_icon("upload") .. " Copy AntiAim", {}, nil, function()
            Config("Save AA");
        end), 
        insertaa = l_minterface_0.Button({
            [1] = nil, 
            [2] = nil, 
            [3] = 1, 
            [1] = ui.get_icon("user-shield") .. " AntiAim", 
            [2] = ui.get_icon("gear") .. " Config"
        }, ui.get_icon("download") .. " Insert AntiAim", {}, nil, function()
            Config("Load");
        end)
    }, 
    Visuals = {
        watermark = l_minterface_0.Switch({
            [1] = ui.get_icon("tv") .. " Visuals", 
            [2] = ui.get_icon("window-maximize") .. " Main"
        }, "Watermark", {
            [1] = false
        }, nil, function(v67)
            -- upvalues: l_minterface_0 (ref), v0 (ref)
            return {
                pos = l_minterface_0.Combo(v67, "Position", {
                    [1] = nil, 
                    [2] = "Top Right", 
                    [1] = {
                        [1] = "None", 
                        [2] = "Top Right", 
                        [3] = "Top Left", 
                        [4] = "Down"
                    }
                }), 
                name = l_minterface_0.Combo(v67, "Script Name", {
                    [1] = {
                        [1] = "Default", 
                        [2] = "Icon"
                    }
                }), 
                nmode = l_minterface_0.Combo(v67, "Name Mode", {
                    [1] = {
                        [1] = "Static", 
                        [2] = "Gradient"
                    }
                }), 
                X = l_minterface_0.Slider(v67, "X", {
                    [1] = nil, 
                    [2] = 0, 
                    [1] = v0.x / 1.2, 
                    [3] = v0.x
                }), 
                Y = l_minterface_0.Slider(v67, "Y", {
                    [1] = nil, 
                    [2] = 0, 
                    [1] = v0.y / 30, 
                    [3] = v0.y
                })
            };
        end), 
        keybinds = l_minterface_0.Switch({
            [1] = ui.get_icon("tv") .. " Visuals", 
            [2] = ui.get_icon("window-maximize") .. " Main"
        }, "Keybinds", {
            [1] = false
        }, nil, function(v68)
            -- upvalues: l_minterface_0 (ref), v0 (ref)
            return {
                X = l_minterface_0.Slider(v68, "X", {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = v0.x
                }), 
                Y = l_minterface_0.Slider(v68, "Y", {
                    [1] = nil, 
                    [2] = 0, 
                    [1] = v0.y / 2 + 25, 
                    [3] = v0.y
                }), 
                before = l_minterface_0.Slider(v68, "Before UI", {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = 10
                }), 
                between = l_minterface_0.Slider(v68, "Between binds", {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = 10
                })
            };
        end), 
        spectators = l_minterface_0.Switch({
            [1] = ui.get_icon("tv") .. " Visuals", 
            [2] = ui.get_icon("window-maximize") .. " Main"
        }, "Spectators", {
            [1] = false
        }, nil, function(v69)
            -- upvalues: l_minterface_0 (ref), v0 (ref)
            return {
                X = l_minterface_0.Slider(v69, "X", {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = v0.x
                }), 
                Y = l_minterface_0.Slider(v69, "Y", {
                    [1] = nil, 
                    [2] = 0, 
                    [1] = v0.y / 2 - 5, 
                    [3] = v0.y
                }), 
                before = l_minterface_0.Slider(v69, "Before UI", {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = 10
                }), 
                between = l_minterface_0.Slider(v69, "Between specs", {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = 10
                })
            };
        end), 
        indicators = l_minterface_0.Switch({
            [1] = ui.get_icon("tv") .. " Visuals", 
            [2] = ui.get_icon("window-maximize") .. " Main"
        }, "Indicators", {
            [1] = false
        }, nil, function(v70)
            -- upvalues: l_minterface_0 (ref)
            return {
                arrow = l_minterface_0.MultiCombo(v70, "Arrows", {
                    [1] = {
                        [1] = "Manual", 
                        [2] = "Desync"
                    }
                }), 
                sarrow = l_minterface_0.Combo(v70, "Arrows style", {
                    [1] = {
                        [1] = "Default", 
                        [2] = "Mini", 
                        [3] = "Primo", 
                        [4] = "Simple"
                    }
                }), 
                atype = l_minterface_0.Combo(v70, "Type Simple", {
                    [1] = {
                        [1] = "Manual", 
                        [2] = "Desync"
                    }
                }), 
                desynccolor = l_minterface_0.ColorEdit(v70, "Desync Color", {
                    color(255, 255, 255, 255)
                }), 
                xpos = l_minterface_0.Slider(v70, "X Pos Arrows", {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = 32
                }), 
                enind = l_minterface_0.Switch(v70, "Under Crosshair", {
                    [1] = true
                }, nil), 
                ypos = l_minterface_0.Slider(v70, "Y Pos Indicators", {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = 32
                }), 
                inditheme = l_minterface_0.Combo(v70, "Indicator Theme", {
                    [1] = {
                        [1] = "Default", 
                        [2] = "Gradient"
                    }
                }), 
                englow = l_minterface_0.Switch(v70, "Glow", {
                    [1] = false
                }), 
                huinya = l_minterface_0.Combo(v70, "Desync Indicator", {
                    [1] = {
                        [1] = "Disabled", 
                        [2] = "-", 
                        [3] = "/"
                    }
                }), 
                font = l_minterface_0.Combo(v70, "Gradient Font", {
                    [1] = {
                        [1] = "Verdana", 
                        [2] = "Pixel", 
                        [3] = "4"
                    }
                })
            };
        end), 
        infopanel = l_minterface_0.Switch({
            [1] = ui.get_icon("tv") .. " Visuals", 
            [2] = ui.get_icon("window-maximize") .. " Main"
        }, "Info Panel", {
            [1] = false
        }, nil, function(v71)
            -- upvalues: l_minterface_0 (ref), v0 (ref)
            return {
                theme = l_minterface_0.Combo(v71, "InfoPanel Theme", {
                    [1] = {
                        [1] = "Default", 
                        [2] = "Script"
                    }
                }), 
                gradback = l_minterface_0.Switch(v71, "Gradient Background", {
                    [1] = false
                }), 
                X = l_minterface_0.Slider(v71, "X", {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = v0.x
                }), 
                Y = l_minterface_0.Slider(v71, "Y", {
                    [1] = nil, 
                    [2] = 0, 
                    [1] = v0.y / 2 + 5, 
                    [3] = v0.y
                })
            };
        end), 
        velocity = l_minterface_0.Switch({
            [1] = ui.get_icon("tv") .. " Visuals", 
            [2] = ui.get_icon("window-maximize") .. " Main"
        }, "Velocity Warning", {
            [1] = false
        }, nil, function(v72)
            -- upvalues: l_minterface_0 (ref), v0 (ref)
            return {
                theme = l_minterface_0.Combo(v72, "Velocity Theme", {
                    [1] = {
                        [1] = "Default", 
                        [2] = "Script"
                    }
                }), 
                velcol = l_minterface_0.ColorEdit(v72, "Velocity Color", {
                    color(176, 208, 255, 255)
                }), 
                glow = l_minterface_0.Switch(v72, "Glow", {
                    [1] = true
                }, nil), 
                X = l_minterface_0.Slider(v72, "X", {
                    [1] = nil, 
                    [2] = 0, 
                    [1] = v0.x / 2.15, 
                    [3] = v0.x
                }), 
                Y = l_minterface_0.Slider(v72, "Y", {
                    [1] = nil, 
                    [2] = 0, 
                    [1] = v0.y / 7, 
                    [3] = v0.y
                })
            };
        end), 
        selecttheme = l_minterface_0.Combo({
            [1] = ui.get_icon("tv") .. " Visuals", 
            [2] = ui.get_icon("window-maximize") .. " Main"
        }, "Select Theme", {
            [1] = {
                [1] = "Default", 
                [2] = "Custom"
            }
        }, nil, function(v73)
            -- upvalues: l_minterface_0 (ref)
            return {
                type = l_minterface_0.Combo(v73, "Type Of Line", {
                    [1] = {
                        [1] = "Simple", 
                        [2] = "Gradient"
                    }
                }), 
                line = l_minterface_0.Combo(v73, "Line", {
                    [1] = {
                        [1] = "Off", 
                        [2] = "Up", 
                        [3] = "Down", 
                        [4] = "Left+Right", 
                        [5] = "Round"
                    }
                }), 
                gbox = l_minterface_0.Combo(v73, "Background Type", {
                    [1] = {
                        [1] = "Not Rounded", 
                        [2] = "Rounded"
                    }
                }), 
                gpos = l_minterface_0.Combo(v73, "Gradient Line", {
                    [1] = {
                        [1] = "Up", 
                        [2] = "Down"
                    }
                }), 
                grpos = l_minterface_0.Combo(v73, "G Round Line", {
                    [1] = {
                        [1] = "Up", 
                        [2] = "Down"
                    }
                }), 
                poshalf = l_minterface_0.Combo(v73, "Pos Line", {
                    [1] = {
                        [1] = "Up", 
                        [2] = "Down", 
                        [3] = "Left+Right"
                    }
                }), 
                sizeline = l_minterface_0.Slider(v73, "Size Line", {
                    [1] = 5, 
                    [2] = 0, 
                    [3] = 10
                }), 
                rounding = l_minterface_0.Slider(v73, "Rounding", {
                    [1] = 5, 
                    [2] = 0, 
                    [3] = 10
                }), 
                englow = l_minterface_0.Switch(v73, "Glow", {
                    [1] = false
                }), 
                glowscale = l_minterface_0.Slider(v73, "Size Glow", {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = 15
                })
            };
        end), 
        themecolor = l_minterface_0.ColorEdit({
            [1] = ui.get_icon("tv") .. " Visuals", 
            [2] = ui.get_icon("window-maximize") .. " Main"
        }, "Theme Color", {
            color(110, 150, 240, 255)
        }), 
        menucolor = l_minterface_0.Switch({
            [1] = ui.get_icon("tv") .. " Visuals", 
            [2] = ui.get_icon("window-maximize") .. " Main"
        }, "Colors From Menu", {
            [1] = false
        }, nil, function(v74)
            -- upvalues: l_minterface_0 (ref)
            return {
                sync = l_minterface_0.Switch(v74, "Sync Text", {
                    [1] = false
                }, "Sync text with menu text"), 
                back = l_minterface_0.Switch(v74, "Custom Background Color", {
                    [1] = false
                }, "For UI elements"), 
                backlor = l_minterface_0.ColorEdit(v74, "Background Color", {
                    color(0, 0, 0, 255)
                })
            };
        end), 
        dmgon = l_minterface_0.Switch({
            [1] = ui.get_icon("tv") .. " Visuals", 
            [2] = ui.get_icon("window-restore") .. " Other"
        }, "Damage Indicator", {
            [1] = false
        }, nil, function(v75)
            -- upvalues: l_minterface_0 (ref), v0 (ref)
            return {
                X = l_minterface_0.Slider(v75, "X", {
                    [1] = nil, 
                    [2] = 0, 
                    [1] = v0.x * 0.51 + 5, 
                    [3] = v0.x
                }), 
                Y = l_minterface_0.Slider(v75, "Y", {
                    [1] = nil, 
                    [2] = 0, 
                    [1] = v0.y * 0.47, 
                    [3] = v0.y
                }), 
                mode = l_minterface_0.Switch(v75, "If Damage Bind Turn On", {
                    [1] = false
                }, nil)
            };
        end), 
        chams = l_minterface_0.Switch({
            [1] = ui.get_icon("tv") .. " Visuals", 
            [2] = ui.get_icon("window-restore") .. " Other"
        }, "Disable Chams On Knife", {
            [1] = false
        }, nil), 
        spcirl = l_minterface_0.Switch({
            [1] = ui.get_icon("tv") .. " Visuals", 
            [2] = ui.get_icon("window-restore") .. " Other"
        }, "Spread Circle", {
            [1] = false
        }, nil, function(v76)
            -- upvalues: l_minterface_0 (ref)
            return {
                theme = l_minterface_0.Combo(v76, "Circle Style", {
                    [1] = {
                        [1] = "Flat", 
                        [2] = "Outline", 
                        [3] = "Gradient"
                    }
                }), 
                selectcolor = l_minterface_0.ColorEdit(v76, "Circle Color", {
                    color(0, 0, 0, 100)
                }), 
                reverse = l_minterface_0.Switch(v76, "Reverse Gradient", {
                    [1] = false
                })
            };
        end), 
        killmark = l_minterface_0.Switch({
            [1] = ui.get_icon("tv") .. " Visuals", 
            [2] = ui.get_icon("window-restore") .. " Other"
        }, "Kill Marks", {
            [1] = false
        }, nil, function(v77)
            -- upvalues: l_minterface_0 (ref)
            return {
                mode = l_minterface_0.MultiCombo(v77, "Mode", {
                    [1] = {
                        [1] = "Image", 
                        [2] = "Sound"
                    }, 
                    [2] = {
                        [1] = "Image", 
                        [2] = "Sound"
                    }
                }), 
                volume = l_minterface_0.Slider(v77, "Volume", {
                    [1] = 100, 
                    [2] = 0, 
                    [3] = 100
                })
            };
        end), 
        scope = l_minterface_0.Switch({
            [1] = ui.get_icon("tv") .. " Visuals", 
            [2] = ui.get_icon("window-restore") .. " Other"
        }, "Custom Scope", {
            [1] = false
        }, nil, function(v78)
            -- upvalues: l_minterface_0 (ref)
            return {
                offsetscop = l_minterface_0.Slider(v78, "Offset", {
                    [1] = 10, 
                    [2] = 0, 
                    [3] = 500
                }), 
                lengthscop = l_minterface_0.Slider(v78, "Length", {
                    [1] = 60, 
                    [2] = 10, 
                    [3] = 1000
                }), 
                animscop = l_minterface_0.Slider(v78, "Anim Speed", {
                    [1] = 15, 
                    [2] = 1, 
                    [3] = 30
                }), 
                invert = l_minterface_0.Switch(v78, "Invert Scope", {
                    [1] = false
                }), 
                style = l_minterface_0.Combo(v78, "Scope Style", {
                    [1] = {
                        [1] = "Default", 
                        [2] = "T", 
                        [3] = "X"
                    }
                }), 
                color_1 = l_minterface_0.ColorEdit(v78, "Color 1", {
                    color(255, 255, 255, 255)
                }), 
                color_2 = l_minterface_0.ColorEdit(v78, "Color 2", {
                    color(255, 255, 255, 0)
                })
            };
        end), 
        grenrad = l_minterface_0.Switch({
            [1] = ui.get_icon("tv") .. " Visuals", 
            [2] = ui.get_icon("window-restore") .. " Other"
        }, "Grenade Radius", {
            [1] = false
        }, nil, function(v79)
            -- upvalues: l_minterface_0 (ref)
            return {
                select = l_minterface_0.MultiCombo(v79, "Grenades", {
                    [1] = {
                        [1] = "Smoke", 
                        [2] = "Molotov"
                    }
                }), 
                mode = l_minterface_0.Combo(v79, "Radius", {
                    [1] = {
                        [1] = "Default", 
                        [2] = "Outline", 
                        [3] = "Gradient"
                    }
                }), 
                scolor = l_minterface_0.ColorEdit(v79, "Smoke Color", {
                    color(61, 145, 250, 179)
                }), 
                mcolor = l_minterface_0.ColorEdit(v79, "Molotov Color", {
                    color(255, 64, 64, 189)
                }), 
                reverse = l_minterface_0.Switch(v79, "Reverse Gradient", {
                    [1] = false
                })
            };
        end), 
        logs = l_minterface_0.MultiCombo({
            [1] = ui.get_icon("tv") .. " Visuals", 
            [2] = ui.get_icon("window-restore") .. " Other"
        }, "Logs", {
            [1] = {
                [1] = "In Console", 
                [2] = "Top Left", 
                [3] = "Under Crosshair"
            }
        }, nil, function(v80)
            -- upvalues: l_minterface_0 (ref)
            return {
                hitclr = l_minterface_0.ColorEdit(v80, "Hit Color", {
                    color(104, 254, 35, 200)
                }), 
                misclr = l_minterface_0.ColorEdit(v80, "Miss Color", {
                    color(255, 52, 52, 200)
                })
            };
        end), 
        shit = l_minterface_0.MultiCombo({
            [1] = ui.get_icon("tv") .. " Visuals", 
            [2] = ui.get_icon("window-restore") .. " Other"
        }, "Useless Functions", {
            [1] = {
                [1] = "Disable Panorama Blur", 
                [2] = "Skeet Line", 
                [3] = "Custom HUD", 
                [4] = "Thanos Snap"
            }
        }, nil, function(v81)
            -- upvalues: l_minterface_0 (ref)
            return {
                cuscol = l_minterface_0.ColorEdit(v81, "HUD Color", {
                    color(255, 255, 255, 255)
                })
            };
        end)
    }, 
    Misc = {
        panel = l_minterface_0.Switch({
            [1] = ui.get_icon("thumbs-up") .. " Main", 
            [2] = ui.get_icon("wrench") .. " Misc"
        }, "Panel On Menu", {
            [1] = false
        }, nil), 
        clantag = l_minterface_0.Switch({
            [1] = ui.get_icon("thumbs-up") .. " Main", 
            [2] = ui.get_icon("wrench") .. " Misc"
        }, "Clan Tag", {
            [1] = false
        }, nil), 
        shared = l_minterface_0.Switch({
            [1] = ui.get_icon("thumbs-up") .. " Main", 
            [2] = ui.get_icon("wrench") .. " Misc"
        }, "Shared Logo", {
            [1] = false
        }, nil), 
        anmut = l_minterface_0.Switch({
            [1] = ui.get_icon("thumbs-up") .. " Main", 
            [2] = ui.get_icon("wrench") .. " Misc"
        }, "Unmute/Mute", {
            [1] = false
        }, nil, function(v82)
            -- upvalues: l_minterface_0 (ref)
            return {
                enemy = l_minterface_0.Switch(v82, "Only Enemy Team", {
                    [1] = false
                }, nil), 
                mode = l_minterface_0.Combo(v82, "Mode", {
                    [1] = {
                        [1] = "Unmute", 
                        [2] = "Mute"
                    }
                })
            };
        end), 
        aspectratio = l_minterface_0.Switch({
            [1] = ui.get_icon("thumbs-up") .. " Main", 
            [2] = ui.get_icon("wrench") .. " Misc"
        }, "Aspect Ratio", {
            [1] = false
        }, nil, function(v83)
            -- upvalues: l_minterface_0 (ref)
            return {
                preset = l_minterface_0.Combo(v83, "Ratio Presets", {
                    [1] = {
                        [1] = "Custom", 
                        [2] = "16:9", 
                        [3] = "16:10", 
                        [4] = "3:2", 
                        [5] = "4:3", 
                        [6] = "5:4"
                    }
                }), 
                ratiovalue = l_minterface_0.Slider(v83, "Ratio Value", {
                    [1] = 0, 
                    [2] = 0, 
                    [3] = 20, 
                    [4] = 0.1
                })
            };
        end), 
        viewmodel = l_minterface_0.Switch({
            [1] = ui.get_icon("thumbs-up") .. " Main", 
            [2] = ui.get_icon("wrench") .. " Misc"
        }, "ViewModel", {
            [1] = false
        }, nil, function(v84)
            -- upvalues: l_minterface_0 (ref)
            return {
                viewfov = l_minterface_0.Slider(v84, "ViewModel fov", {
                    [1] = nil, 
                    [2] = -10, 
                    [3] = 100, 
                    [1] = oldfov
                }), 
                viewx = l_minterface_0.Slider(v84, "ViewModel x", {
                    [1] = nil, 
                    [2] = -10, 
                    [3] = 10, 
                    [1] = oldofx
                }), 
                viewy = l_minterface_0.Slider(v84, "ViewModel y", {
                    [1] = nil, 
                    [2] = -10, 
                    [3] = 10, 
                    [1] = oldofy
                }), 
                viewz = l_minterface_0.Slider(v84, "ViewModel z", {
                    [1] = nil, 
                    [2] = -10, 
                    [3] = 10, 
                    [1] = oldofz
                }), 
                viewresbut = l_minterface_0.Button(v84, "Reset", {
                    [1] = false
                }, nil), 
                static = l_minterface_0.Switch(v84, "Static ViewModel", {
                    [1] = false
                }, nil)
            };
        end)
    }
};
RealPaste.Misc.viewmodel[0].viewresbut.ref:set_callback(function()
    RealPaste.Misc.viewmodel[0].viewfov.ref:reset();
    RealPaste.Misc.viewmodel[0].viewx.ref:reset();
    RealPaste.Misc.viewmodel[0].viewy.ref:reset();
    RealPaste.Misc.viewmodel[0].viewz.ref:reset();
end);
local v85 = {
    Pitch = l_find_0("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    Yaw = l_find_0("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    YawBase = l_find_0("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    YawAdd = l_find_0("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    AntiBS = l_find_0("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    YawModifier = l_find_0("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    ModifierDegree = l_find_0("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    BodyYaw = l_find_0("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    LeftLimit = l_find_0("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    RightLimit = l_find_0("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    FakeOptions = l_find_0("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    FSDesync = l_find_0("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    FreeStand = l_find_0("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    FsDisModDegr = l_find_0("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    FsBdFs = l_find_0("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
    ExtendedDes = l_find_0("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
    ExtendedValue = l_find_0("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"), 
    DT = l_find_0("Aimbot", "Ragebot", "Main", "Double Tap"), 
    HS = l_find_0("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    AP = l_find_0("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    FD = l_find_0("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    SW = l_find_0("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    DMG = l_find_0("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    chams = l_find_0("Visuals", "Players", "Self", "Chams", "Weapon"), 
    removescope = l_find_0("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
    ssghc = l_find_0("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"), 
    scarhc = l_find_0("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"), 
    awphc = l_find_0("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"), 
    r8hc = l_find_0("Aimbot", "Ragebot", "Selection", "R8 Revolver", "Hit Chance"), 
    shghc = l_find_0("Aimbot", "Ragebot", "Selection", "Shotguns", "Hit Chance")
};
LoadImagesKillMark();
getnum = function(v86)
    local v87 = v86:list();
    local v88 = v86:get();
    for v89, v90 in pairs(v87) do
        if v90 == v88 then
            return v89;
        end;
    end;
end;
get = function(v91, v92)
    local v93 = 1;
    local v94 = {};
    for v95, v96 in pairs(v92) do
        if v91:get(v93) then
            v94[v95] = v96;
        end;
        v93 = v93 + 1;
    end;
    return v94;
end;
ConsoleColor = function(v97)
    local v98 = string.reverse(v97:to_hex());
    return (string.reverse(v98:sub(3)));
end;
GetNL = function(v99)
    local v100 = ui.get_binds();
    for _, v102 in pairs(v100) do
        if v102.name == v99 then
            return true;
        end;
    end;
    return false;
end;
mencolor = function()
    if RealPaste.Visuals.menucolor:get() then
        colors = ui.get_style("Link Active");
        if RealPaste.Visuals.menucolor[0].back:get() then
            bakolor = RealPaste.Visuals.menucolor[0].backlor:get();
        else
            bakolor = ui.get_style("Main Window Background");
        end;
        if RealPaste.Visuals.menucolor[0].sync:get() then
            txtcloror = ui.get_style("Sidebar Text");
        else
            txtcloror = color(255, 255, 255, 255);
        end;
    else
        colors = RealPaste.Visuals.themecolor:get();
        bakolor = color(0, 0, 0, colors.a);
        txtcloror = color(255, 255, 255, 255);
    end;
end;
sidebar = function()
    -- upvalues: l_monylinear_0 (ref), v1 (ref)
    if RealPaste.Visuals.menucolor[0].sync:get() and RealPaste.Visuals.menucolor:get() then
        colorseses = txtcloror;
    else
        colorseses = colors;
    end;
    local v103 = l_monylinear_0:Animate(scripttextpasxa .. " [" .. v1 .. "]", {
        color(colorseses.r, colorseses.g, colorseses.b), 
        color(colorseses.r / 2, colorseses.g / 2, colorseses.b / 2), 
        color(colorseses.r / 3, colorseses.g / 3, colorseses.b / 3)
    }, 2);
    ui.sidebar(v103, "vihara");
end;
local v104 = {
    [1] = "G", 
    [2] = "S", 
    [3] = "M", 
    [4] = "SW", 
    [5] = "A", 
    [6] = "C", 
    [7] = "A-C"
};
for v105, v106 in pairs(v104) do
    RealPaste.AntiAim[v106 .. ".Enable"] = l_minterface_0.Switch({
        [1] = nil, 
        [2] = "Custom", 
        [1] = ui.get_icon("user-shield") .. " AntiAim"
    }, "Enable Condition", {
        [1] = false
    }, nil);
    do
        local l_v105_0 = v105;
        RealPaste.AntiAim[v106 .. ".Yaw Base"] = l_minterface_0.Combo({
            [1] = nil, 
            [2] = "Custom", 
            [1] = ui.get_icon("user-shield") .. " AntiAim"
        }, "[" .. v104[l_v105_0] .. "] Yaw Base", {
            [1] = {
                [1] = "Disabled", 
                [2] = "Backward", 
                [3] = "At Target"
            }
        }, nil, function(v108)
            -- upvalues: l_minterface_0 (ref), v104 (ref), l_v105_0 (ref)
            return {
                mode = l_minterface_0.Combo(v108, "[" .. v104[l_v105_0] .. "] Modes", {
                    [1] = {
                        [1] = "Default", 
                        [2] = "Flicker", 
                        [3] = "Delay"
                    }
                }, nil)
            };
        end);
        RealPaste.AntiAim[v106 .. ".Ticks"] = l_minterface_0.Slider({
            [1] = nil, 
            [2] = "Custom", 
            [1] = ui.get_icon("user-shield") .. " AntiAim"
        }, "[" .. v104[l_v105_0] .. "] Ticks", {
            [1] = 25, 
            [2] = 1, 
            [3] = 50
        });
        for v109 = 1, 2 do
            RealPaste.AntiAim[v106 .. v109 .. ".Phase Yaw"] = l_minterface_0.Slider({
                [1] = nil, 
                [2] = "Custom", 
                [1] = ui.get_icon("user-shield") .. " AntiAim"
            }, "[" .. v104[l_v105_0] .. "] " .. v109 .. " Yaw", {
                [1] = 0, 
                [2] = -180, 
                [3] = 180
            });
        end;
        RealPaste.AntiAim[v106 .. ".Delay"] = l_minterface_0.Slider({
            [1] = nil, 
            [2] = "Custom", 
            [1] = ui.get_icon("user-shield") .. " AntiAim"
        }, "[" .. v104[l_v105_0] .. "] Delay", {
            [1] = 16, 
            [2] = 0, 
            [3] = 32
        });
        RealPaste.AntiAim[v106 .. ".Randomize"] = l_minterface_0.Slider({
            [1] = nil, 
            [2] = "Custom", 
            [1] = ui.get_icon("user-shield") .. " AntiAim"
        }, "[" .. v104[l_v105_0] .. "] Randomize", {
            [1] = 16, 
            [2] = 0, 
            [3] = 32
        });
        RealPaste.AntiAim[v106 .. ".L Delay Yaw"] = l_minterface_0.Slider({
            [1] = nil, 
            [2] = "Custom", 
            [1] = ui.get_icon("user-shield") .. " AntiAim"
        }, "[" .. v104[l_v105_0] .. "] L Delay Yaw", {
            [1] = 0, 
            [2] = -180, 
            [3] = 180
        });
        RealPaste.AntiAim[v106 .. ".R Delay Yaw"] = l_minterface_0.Slider({
            [1] = nil, 
            [2] = "Custom", 
            [1] = ui.get_icon("user-shield") .. " AntiAim"
        }, "[" .. v104[l_v105_0] .. "] R Delay Yaw", {
            [1] = 0, 
            [2] = -180, 
            [3] = 180
        });
        RealPaste.AntiAim[v106 .. ".Yaw Add"] = l_minterface_0.Slider({
            [1] = nil, 
            [2] = "Custom", 
            [1] = ui.get_icon("user-shield") .. " AntiAim"
        }, "[" .. v104[l_v105_0] .. "] Yaw Add", {
            [1] = 0, 
            [2] = -180, 
            [3] = 180
        });
        RealPaste.AntiAim[v106 .. ".Yaw Add Left"] = l_minterface_0.Slider({
            [1] = nil, 
            [2] = "Custom", 
            [1] = ui.get_icon("user-shield") .. " AntiAim"
        }, "[" .. v104[l_v105_0] .. "] Yaw Add Left", {
            [1] = 0, 
            [2] = -180, 
            [3] = 180
        });
        RealPaste.AntiAim[v106 .. ".Yaw Add Right"] = l_minterface_0.Slider({
            [1] = nil, 
            [2] = "Custom", 
            [1] = ui.get_icon("user-shield") .. " AntiAim"
        }, "[" .. v104[l_v105_0] .. "] Yaw Add Right", {
            [1] = 0, 
            [2] = -180, 
            [3] = 180
        });
        RealPaste.AntiAim[v106 .. ".2 Side"] = l_minterface_0.MultiCombo({
            [1] = ui.get_icon("user-shield") .. " AntiAim", 
            [2] = ui.get_icon("user-circle") .. " Main"
        }, "[" .. v104[l_v105_0] .. "] 2 Side", {
            [1] = {
                [1] = "Yaw Add", 
                [2] = "Desync"
            }
        });
        RealPaste.AntiAim[v106 .. ".Yaw Modifier"] = l_minterface_0.Combo({
            [1] = nil, 
            [2] = "Custom", 
            [1] = ui.get_icon("user-shield") .. " AntiAim"
        }, "[" .. v104[l_v105_0] .. "] Yaw Modifier", {
            [1] = {
                [1] = "Disabled", 
                [2] = "Center", 
                [3] = "Offset", 
                [4] = "Random", 
                [5] = "Spin", 
                [6] = "3-Way", 
                [7] = "5-Way"
            }
        }, nil);
        RealPaste.AntiAim[v106 .. ".Modifier Degree"] = l_minterface_0.Slider({
            [1] = nil, 
            [2] = "Custom", 
            [1] = ui.get_icon("user-shield") .. " AntiAim"
        }, "[" .. v104[l_v105_0] .. "] Modifier Degree", {
            [1] = 0, 
            [2] = -180, 
            [3] = 180
        });
        RealPaste.AntiAim[v106 .. ".Body Yaw"] = l_minterface_0.Switch({
            [1] = nil, 
            [2] = "Custom", 
            [1] = ui.get_icon("user-shield") .. " AntiAim"
        }, "[" .. v104[l_v105_0] .. "] Body Yaw", {
            [1] = true
        }, nil);
        RealPaste.AntiAim[v106 .. ".Desync Limit"] = l_minterface_0.Slider({
            [1] = nil, 
            [2] = "Custom", 
            [1] = ui.get_icon("user-shield") .. " AntiAim"
        }, "[" .. v104[l_v105_0] .. "] Desync Limit", {
            [1] = 0, 
            [2] = 0, 
            [3] = 60
        });
        RealPaste.AntiAim[v106 .. ".Left Limit"] = l_minterface_0.Slider({
            [1] = nil, 
            [2] = "Custom", 
            [1] = ui.get_icon("user-shield") .. " AntiAim"
        }, "[" .. v104[l_v105_0] .. "] Left Limit", {
            [1] = 0, 
            [2] = 0, 
            [3] = 60
        });
        RealPaste.AntiAim[v106 .. ".Right Limit"] = l_minterface_0.Slider({
            [1] = nil, 
            [2] = "Custom", 
            [1] = ui.get_icon("user-shield") .. " AntiAim"
        }, "[" .. v104[l_v105_0] .. "] Right Limit", {
            [1] = 0, 
            [2] = 0, 
            [3] = 60
        });
        RealPaste.AntiAim[v106 .. ".Fake Options"] = l_minterface_0.MultiCombo({
            [1] = nil, 
            [2] = "Custom", 
            [1] = ui.get_icon("user-shield") .. " AntiAim"
        }, "[" .. v104[l_v105_0] .. "] Fake Options", {
            [1] = {
                [1] = "Avoid Overlap", 
                [2] = "Jitter", 
                [3] = "Randomize Jitter"
            }
        });
        RealPaste.AntiAim[v106 .. ".FreeStand Desync"] = l_minterface_0.Combo({
            [1] = nil, 
            [2] = "Custom", 
            [1] = ui.get_icon("user-shield") .. " AntiAim"
        }, "[" .. v104[l_v105_0] .. "] FreeStand Desync", {
            [1] = {
                [1] = "Off", 
                [2] = "Peek Fake", 
                [3] = "Peek Real"
            }
        });
    end;
end;
Fix = function()
    -- upvalues: v104 (ref), l_mtools_0 (ref)
    for v110, v111 in pairs(v104) do
        local v112 = v110 == getnum(RealPaste.AntiAim.Condition);
        RealPaste.AntiAim[v111 .. ".Enable"]:visibility(v112 and RealPaste.AntiAim.preset:get() == "Custom");
        if getnum(RealPaste.AntiAim.Condition) == 1 then
            RealPaste.AntiAim[v111 .. ".Enable"]:visibility(false);
            RealPaste.AntiAim["G" .. ".Enable"]:set(true);
        end;
        RealPaste.AntiAim[v111 .. ".Yaw Base"]:visibility(v112 and RealPaste.AntiAim[v111 .. ".Enable"]:get() and RealPaste.AntiAim.preset:get() == "Custom");
        if RealPaste.AntiAim[v111 .. ".Yaw Base"]:get() == "Disabled" then
            RealPaste.AntiAim[v111 .. ".Yaw Add"]:visibility(false);
            RealPaste.AntiAim[v111 .. ".Yaw Add Left"]:visibility(false);
            RealPaste.AntiAim[v111 .. ".Yaw Add Right"]:visibility(false);
            RealPaste.AntiAim[v111 .. ".Ticks"]:visibility(false);
            for v113 = 1, 2 do
                RealPaste.AntiAim[v111 .. v113 .. ".Phase Yaw"]:visibility(false);
            end;
            RealPaste.AntiAim[v111 .. ".2 Side"]:visibility(false);
            RealPaste.AntiAim[v111 .. ".Yaw Modifier"]:visibility(false);
            RealPaste.AntiAim[v111 .. ".Modifier Degree"]:visibility(false);
            RealPaste.AntiAim[v111 .. ".Yaw Base"][0].mode:visibility(false);
            RealPaste.AntiAim[v111 .. ".L Delay Yaw"]:visibility(false);
            RealPaste.AntiAim[v111 .. ".R Delay Yaw"]:visibility(false);
            RealPaste.AntiAim[v111 .. ".Randomize"]:visibility(false);
            RealPaste.AntiAim[v111 .. ".Delay"]:visibility(false);
        else
            RealPaste.AntiAim[v111 .. ".Yaw Base"][0].mode:visibility(true);
            if RealPaste.AntiAim[v111 .. ".Yaw Base"][0].mode:get() == "Flicker" then
                for v114 = 1, 2 do
                    RealPaste.AntiAim[v111 .. v114 .. ".Phase Yaw"]:visibility(v112 and RealPaste.AntiAim[v111 .. ".Enable"]:get() and RealPaste.AntiAim.preset:get() == "Custom");
                end;
                RealPaste.AntiAim[v111 .. ".Ticks"]:visibility(v112 and RealPaste.AntiAim[v111 .. ".Enable"]:get() and RealPaste.AntiAim.preset:get() == "Custom");
                RealPaste.AntiAim[v111 .. ".Yaw Add"]:visibility(false);
                RealPaste.AntiAim[v111 .. ".Yaw Add Left"]:visibility(false);
                RealPaste.AntiAim[v111 .. ".Yaw Add Right"]:visibility(false);
                RealPaste.AntiAim[v111 .. ".L Delay Yaw"]:visibility(false);
                RealPaste.AntiAim[v111 .. ".R Delay Yaw"]:visibility(false);
                RealPaste.AntiAim[v111 .. ".Randomize"]:visibility(false);
                RealPaste.AntiAim[v111 .. ".Delay"]:visibility(false);
            elseif RealPaste.AntiAim[v111 .. ".Yaw Base"][0].mode:get() == "Delay" then
                RealPaste.AntiAim[v111 .. ".L Delay Yaw"]:visibility(v112 and RealPaste.AntiAim[v111 .. ".Enable"]:get() and RealPaste.AntiAim.preset:get() == "Custom");
                RealPaste.AntiAim[v111 .. ".R Delay Yaw"]:visibility(v112 and RealPaste.AntiAim[v111 .. ".Enable"]:get() and RealPaste.AntiAim.preset:get() == "Custom");
                RealPaste.AntiAim[v111 .. ".Randomize"]:visibility(v112 and RealPaste.AntiAim[v111 .. ".Enable"]:get() and RealPaste.AntiAim.preset:get() == "Custom");
                RealPaste.AntiAim[v111 .. ".Delay"]:visibility(v112 and RealPaste.AntiAim[v111 .. ".Enable"]:get() and RealPaste.AntiAim.preset:get() == "Custom");
                RealPaste.AntiAim[v111 .. ".Yaw Add"]:visibility(false);
                RealPaste.AntiAim[v111 .. ".Yaw Add Left"]:visibility(false);
                RealPaste.AntiAim[v111 .. ".Yaw Add Right"]:visibility(false);
                RealPaste.AntiAim[v111 .. ".Ticks"]:visibility(false);
                for v115 = 1, 2 do
                    RealPaste.AntiAim[v111 .. v115 .. ".Phase Yaw"]:visibility(false);
                end;
            elseif l_mtools_0.Table.Find(RealPaste.AntiAim[v111 .. ".2 Side"]:get(), "Yaw Add") ~= 0 then
                RealPaste.AntiAim[v111 .. ".Yaw Add Left"]:visibility(v112 and RealPaste.AntiAim[v111 .. ".Enable"]:get() and RealPaste.AntiAim.preset:get() == "Custom");
                RealPaste.AntiAim[v111 .. ".Yaw Add Right"]:visibility(v112 and RealPaste.AntiAim[v111 .. ".Enable"]:get() and RealPaste.AntiAim.preset:get() == "Custom");
                RealPaste.AntiAim[v111 .. ".Yaw Add"]:visibility(false);
                RealPaste.AntiAim[v111 .. ".Ticks"]:visibility(false);
                for v116 = 1, 2 do
                    RealPaste.AntiAim[v111 .. v116 .. ".Phase Yaw"]:visibility(false);
                end;
                RealPaste.AntiAim[v111 .. ".L Delay Yaw"]:visibility(false);
                RealPaste.AntiAim[v111 .. ".R Delay Yaw"]:visibility(false);
                RealPaste.AntiAim[v111 .. ".Randomize"]:visibility(false);
                RealPaste.AntiAim[v111 .. ".Delay"]:visibility(false);
            else
                RealPaste.AntiAim[v111 .. ".Yaw Add"]:visibility(v112 and RealPaste.AntiAim[v111 .. ".Enable"]:get() and RealPaste.AntiAim.preset:get() == "Custom");
                RealPaste.AntiAim[v111 .. ".Yaw Add Left"]:visibility(false);
                RealPaste.AntiAim[v111 .. ".Yaw Add Right"]:visibility(false);
                RealPaste.AntiAim[v111 .. ".Ticks"]:visibility(false);
                for v117 = 1, 2 do
                    RealPaste.AntiAim[v111 .. v117 .. ".Phase Yaw"]:visibility(false);
                end;
                RealPaste.AntiAim[v111 .. ".L Delay Yaw"]:visibility(false);
                RealPaste.AntiAim[v111 .. ".R Delay Yaw"]:visibility(false);
                RealPaste.AntiAim[v111 .. ".Randomize"]:visibility(false);
                RealPaste.AntiAim[v111 .. ".Delay"]:visibility(false);
            end;
            RealPaste.AntiAim[v111 .. ".2 Side"]:visibility(v112 and RealPaste.AntiAim[v111 .. ".Enable"]:get() and RealPaste.AntiAim.preset:get() == "Custom");
            RealPaste.AntiAim[v111 .. ".Yaw Modifier"]:visibility(v112 and RealPaste.AntiAim[v111 .. ".Enable"]:get() and RealPaste.AntiAim.preset:get() == "Custom");
            RealPaste.AntiAim[v111 .. ".Modifier Degree"]:visibility(v112 and getnum(RealPaste.AntiAim[v111 .. ".Yaw Modifier"]) ~= 1 and RealPaste.AntiAim[v111 .. ".Enable"]:get() and RealPaste.AntiAim.preset:get() == "Custom");
        end;
        RealPaste.AntiAim[v111 .. ".Body Yaw"]:visibility(v112 and RealPaste.AntiAim[v111 .. ".Enable"]:get() and RealPaste.AntiAim.preset:get() == "Custom");
        if RealPaste.AntiAim[v111 .. ".Body Yaw"]:get() then
            if l_mtools_0.Table.Find(RealPaste.AntiAim[v111 .. ".2 Side"]:get(), "Desync") ~= 0 then
                RealPaste.AntiAim[v111 .. ".Left Limit"]:visibility(v112 and RealPaste.AntiAim[v111 .. ".Enable"]:get() and RealPaste.AntiAim.preset:get() == "Custom");
                RealPaste.AntiAim[v111 .. ".Right Limit"]:visibility(v112 and RealPaste.AntiAim[v111 .. ".Enable"]:get() and RealPaste.AntiAim.preset:get() == "Custom");
                RealPaste.AntiAim[v111 .. ".Desync Limit"]:visibility(false);
            else
                RealPaste.AntiAim[v111 .. ".Desync Limit"]:visibility(v112 and RealPaste.AntiAim[v111 .. ".Enable"]:get() and RealPaste.AntiAim.preset:get() == "Custom");
                RealPaste.AntiAim[v111 .. ".Left Limit"]:visibility(false);
                RealPaste.AntiAim[v111 .. ".Right Limit"]:visibility(false);
            end;
            RealPaste.AntiAim[v111 .. ".Fake Options"]:visibility(v112 and RealPaste.AntiAim[v111 .. ".Enable"]:get() and RealPaste.AntiAim.preset:get() == "Custom");
            RealPaste.AntiAim[v111 .. ".FreeStand Desync"]:visibility(v112 and RealPaste.AntiAim[v111 .. ".Enable"]:get() and RealPaste.AntiAim.preset:get() == "Custom");
        else
            RealPaste.AntiAim[v111 .. ".Desync Limit"]:visibility(false);
            RealPaste.AntiAim[v111 .. ".Left Limit"]:visibility(false);
            RealPaste.AntiAim[v111 .. ".Right Limit"]:visibility(false);
            RealPaste.AntiAim[v111 .. ".Fake Options"]:visibility(false);
            RealPaste.AntiAim[v111 .. ".FreeStand Desync"]:visibility(false);
        end;
    end;
end;
vislegti = function()
    RealPaste.AntiAim.legitaa[0].mode:visibility(RealPaste.AntiAim.legitaa:get());
    RealPaste.AntiAim.legitaa[0].base:visibility(RealPaste.AntiAim.legitaa:get() and RealPaste.AntiAim.legitaa[0].mode:get() ~= "Custom");
    RealPaste.AntiAim.legitaa[0].cbase:visibility(RealPaste.AntiAim.legitaa[0].mode:get() == "Custom" and RealPaste.AntiAim.legitaa:get());
    RealPaste.AntiAim.legitaa[0].caddl:visibility(RealPaste.AntiAim.legitaa[0].mode:get() == "Custom" and RealPaste.AntiAim.legitaa:get() and RealPaste.AntiAim.legitaa[0].cbase:get() ~= "Disabled");
    RealPaste.AntiAim.legitaa[0].caddr:visibility(RealPaste.AntiAim.legitaa[0].mode:get() == "Custom" and RealPaste.AntiAim.legitaa:get() and RealPaste.AntiAim.legitaa[0].cbase:get() ~= "Disabled");
    RealPaste.AntiAim.legitaa[0].cmod:visibility(RealPaste.AntiAim.legitaa[0].mode:get() == "Custom" and RealPaste.AntiAim.legitaa:get() and RealPaste.AntiAim.legitaa[0].cbase:get() ~= "Disabled");
    RealPaste.AntiAim.legitaa[0].cdegr:visibility(RealPaste.AntiAim.legitaa[0].mode:get() == "Custom" and RealPaste.AntiAim.legitaa:get() and RealPaste.AntiAim.legitaa[0].cbase:get() ~= "Disabled" and RealPaste.AntiAim.legitaa[0].cmod:get() ~= "Disabled");
    RealPaste.AntiAim.legitaa[0].cbody:visibility(RealPaste.AntiAim.legitaa[0].mode:get() == "Custom" and RealPaste.AntiAim.legitaa:get());
    RealPaste.AntiAim.legitaa[0].cdesl:visibility(RealPaste.AntiAim.legitaa[0].mode:get() == "Custom" and RealPaste.AntiAim.legitaa:get() and RealPaste.AntiAim.legitaa[0].cbody:get());
    RealPaste.AntiAim.legitaa[0].cdesr:visibility(RealPaste.AntiAim.legitaa[0].mode:get() == "Custom" and RealPaste.AntiAim.legitaa:get() and RealPaste.AntiAim.legitaa[0].cbody:get());
    RealPaste.AntiAim.legitaa[0].copt:visibility(RealPaste.AntiAim.legitaa[0].mode:get() == "Custom" and RealPaste.AntiAim.legitaa:get() and RealPaste.AntiAim.legitaa[0].cbody:get());
    RealPaste.AntiAim.legitaa[0].cfres:visibility(RealPaste.AntiAim.legitaa[0].mode:get() == "Custom" and RealPaste.AntiAim.legitaa:get() and RealPaste.AntiAim.legitaa[0].cbody:get());
end;
menuvis = function()
    -- upvalues: l_mtools_0 (ref)
    vislegti();
    if RealPaste.Visuals.menucolor:get() then
        RealPaste.Visuals.themecolor:visibility(false);
    else
        RealPaste.Visuals.themecolor:visibility(true);
    end;
    RealPaste.Visuals.indicators[0].desynccolor:visibility(RealPaste.Visuals.indicators:get() and l_mtools_0.Table.Find(RealPaste.Visuals.indicators[0].arrow:get(), "Desync") ~= 0);
    RealPaste.AntiAim.Condition:visibility(RealPaste.AntiAim.preset:get() == "Custom");
    RealPaste.Misc.aspectratio[0].ratiovalue:visibility(RealPaste.Misc.aspectratio:get() and RealPaste.Misc.aspectratio[0].preset:get() == "Custom");
    RealPaste.Misc.aspectratio[0].preset:visibility(RealPaste.Misc.aspectratio:get());
    RealPaste.Misc.viewmodel[0].viewfov:visibility(RealPaste.Misc.viewmodel:get());
    RealPaste.Misc.viewmodel[0].viewx:visibility(RealPaste.Misc.viewmodel:get());
    RealPaste.Misc.viewmodel[0].viewy:visibility(RealPaste.Misc.viewmodel:get());
    RealPaste.Misc.viewmodel[0].viewz:visibility(RealPaste.Misc.viewmodel:get());
    RealPaste.Misc.viewmodel[0].viewresbut:visibility(RealPaste.Misc.viewmodel:get());
    RealPaste.Visuals.scope[0].offsetscop:visibility(RealPaste.Visuals.scope:get());
    RealPaste.Visuals.scope[0].lengthscop:visibility(RealPaste.Visuals.scope:get());
    RealPaste.Visuals.scope[0].animscop:visibility(RealPaste.Visuals.scope:get());
    RealPaste.Visuals.scope[0].color_1:visibility(RealPaste.Visuals.scope:get());
    RealPaste.Visuals.scope[0].color_2:visibility(RealPaste.Visuals.scope:get());
    RealPaste.Visuals.indicators[0].enind:visibility(RealPaste.Visuals.indicators:get());
    RealPaste.Visuals.indicators[0].arrow:visibility(RealPaste.Visuals.indicators:get());
    RealPaste.Visuals.indicators[0].ypos:visibility(RealPaste.Visuals.indicators:get() and RealPaste.Visuals.indicators[0].enind:get());
    RealPaste.Visuals.indicators[0].huinya:visibility(RealPaste.Visuals.indicators:get() and RealPaste.Visuals.indicators[0].enind:get());
    RealPaste.Rage.hitchance[0].ahc:visibility(l_mtools_0.Table.Find(RealPaste.Rage.hitchance:get(), "Air") ~= 0 and (not (l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wahc:get(), "Autosniper") == 0) or not (l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wahc:get(), "SSG 08") == 0) or not (l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wahc:get(), "AWP") == 0) or not (l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wahc:get(), "Shotgun") == 0) or not (l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wahc:get(), "R8 Revolver") == 0) or l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wahc:get(), "Others") ~= 0));
    RealPaste.Rage.hitchance[0].nshc:visibility(l_mtools_0.Table.Find(RealPaste.Rage.hitchance:get(), "NoScope") ~= 0 and (not (l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wnshc:get(), "Autosniper") == 0) or not (l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wnshc:get(), "SSG 08") == 0) or l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wnshc:get(), "AWP") ~= 0));
    RealPaste.Rage.hitchance[0].crhc:visibility(l_mtools_0.Table.Find(RealPaste.Rage.hitchance:get(), "Crouch") ~= 0 and (not (l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wcrhc:get(), "Autosniper") == 0) or not (l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wcrhc:get(), "SSG 08") == 0) or l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wcrhc:get(), "AWP") ~= 0));
    RealPaste.Rage.hitchance[0].wcrhc:visibility(l_mtools_0.Table.Find(RealPaste.Rage.hitchance:get(), "Crouch") ~= 0);
    RealPaste.Rage.hitchance[0].wnshc:visibility(l_mtools_0.Table.Find(RealPaste.Rage.hitchance:get(), "NoScope") ~= 0);
    RealPaste.Rage.hitchance[0].wahc:visibility(l_mtools_0.Table.Find(RealPaste.Rage.hitchance:get(), "Air") ~= 0);
    RealPaste.Rage.idealpeek[0].mode:visibility(RealPaste.Rage.idealpeek:get());
    RealPaste.Rage.idealpeek[0].custom:visibility(RealPaste.Rage.idealpeek:get() and RealPaste.Rage.idealpeek[0].mode:get() == "Custom");
    RealPaste.Rage.idealpeek[0].mdmg:visibility(RealPaste.Rage.idealpeek:get() and RealPaste.Rage.idealpeek[0].mode:get() == "Custom" and l_mtools_0.Table.Find(RealPaste.Rage.idealpeek[0].custom:get(), "Min Damage") ~= 0);
    RealPaste.Visuals.infopanel[0].theme:visibility(RealPaste.Visuals.infopanel:get());
    RealPaste.Visuals.spcirl[0].selectcolor:visibility(RealPaste.Visuals.spcirl:get());
    RealPaste.Main.dogonscreen[0].dogstyle:visibility(RealPaste.Main.dogonscreen:get());
    RealPaste.Visuals.killmark[0].volume:visibility(RealPaste.Visuals.killmark:get() and l_mtools_0.Table.Find(RealPaste.Visuals.killmark[0].mode:get(), "Sound") ~= 0);
    RealPaste.Visuals.killmark[0].mode:visibility(RealPaste.Visuals.killmark:get());
    RealPaste.Visuals.scope[0].invert:visibility(RealPaste.Visuals.scope:get());
    RealPaste.Visuals.scope[0].style:visibility(RealPaste.Visuals.scope:get());
    RealPaste.Visuals.indicators[0].xpos:visibility((not (l_mtools_0.Table.Find(RealPaste.Visuals.indicators[0].arrow:get(), "Manual") == 0) or l_mtools_0.Table.Find(RealPaste.Visuals.indicators[0].arrow:get(), "Desync") ~= 0) and RealPaste.Visuals.indicators:get() and RealPaste.Visuals.indicators[0].sarrow:get() ~= "Default");
    RealPaste.Visuals.indicators[0].atype:visibility(RealPaste.Visuals.indicators:get() and (not (l_mtools_0.Table.Find(RealPaste.Visuals.indicators[0].arrow:get(), "Manual") == 0) or l_mtools_0.Table.Find(RealPaste.Visuals.indicators[0].arrow:get(), "Desync") ~= 0) and RealPaste.Visuals.indicators[0].sarrow:get() == "Simple");
    RealPaste.Visuals.indicators[0].sarrow:visibility((not (l_mtools_0.Table.Find(RealPaste.Visuals.indicators[0].arrow:get(), "Manual") == 0) or l_mtools_0.Table.Find(RealPaste.Visuals.indicators[0].arrow:get(), "Desync") ~= 0) and RealPaste.Visuals.indicators:get());
    RealPaste.Visuals.logs[0].hitclr:visibility(l_mtools_0.Table.Find(RealPaste.Visuals.logs:get(), "Under Crosshair") ~= 0);
    RealPaste.Visuals.logs[0].misclr:visibility(l_mtools_0.Table.Find(RealPaste.Visuals.logs:get(), "Under Crosshair") ~= 0);
    RealPaste.Visuals.menucolor[0].sync:visibility(RealPaste.Visuals.menucolor:get());
    RealPaste.Visuals.menucolor[0].back:visibility(RealPaste.Visuals.menucolor:get());
    RealPaste.Visuals.menucolor[0].backlor:visibility(RealPaste.Visuals.menucolor:get() and RealPaste.Visuals.menucolor[0].back:get());
    RealPaste.Visuals.keybinds[0].before:visibility(RealPaste.Visuals.keybinds:get());
    RealPaste.Visuals.keybinds[0].between:visibility(RealPaste.Visuals.keybinds:get());
    RealPaste.Visuals.spectators[0].before:visibility(RealPaste.Visuals.spectators:get());
    RealPaste.Visuals.spectators[0].between:visibility(RealPaste.Visuals.spectators:get());
    RealPaste.Visuals.watermark[0].pos:visibility(RealPaste.Visuals.watermark:get());
    if RealPaste.Visuals.selecttheme:get_override() == "Default" then
        RealPaste.Visuals.watermark[0].name:visibility(false);
        RealPaste.Visuals.watermark[0].nmode:visibility(false);
    else
        RealPaste.Visuals.watermark[0].name:visibility(RealPaste.Visuals.watermark:get() and RealPaste.Visuals.selecttheme:get() == "Custom");
        RealPaste.Visuals.watermark[0].nmode:visibility(RealPaste.Visuals.watermark:get() and RealPaste.Visuals.selecttheme:get() == "Custom");
    end;
    RealPaste.Visuals.velocity[0].velcol:visibility(RealPaste.Visuals.velocity:get());
    RealPaste.Visuals.velocity[0].theme:visibility(RealPaste.Visuals.velocity:get());
    RealPaste.Visuals.dmgon[0].mode:visibility(RealPaste.Visuals.dmgon:get());
    RealPaste.Visuals.grenrad[0].select:visibility(RealPaste.Visuals.grenrad:get());
    RealPaste.Visuals.grenrad[0].scolor:visibility(RealPaste.Visuals.grenrad:get() and l_mtools_0.Table.Find(RealPaste.Visuals.grenrad[0].select:get(), "Smoke") ~= 0);
    RealPaste.Visuals.grenrad[0].mcolor:visibility(RealPaste.Visuals.grenrad:get() and l_mtools_0.Table.Find(RealPaste.Visuals.grenrad[0].select:get(), "Molotov") ~= 0);
    RealPaste.Visuals.shit[0].cuscol:visibility(l_mtools_0.Table.Find(RealPaste.Visuals.shit:get(), "Custom HUD") ~= 0);
    RealPaste.AntiAim.defaa[0].pitch:visibility(RealPaste.AntiAim.defaa:get());
    RealPaste.AntiAim.defaa[0].base:visibility(RealPaste.AntiAim.defaa:get());
    RealPaste.AntiAim.defaa[0].cpitch:visibility(RealPaste.AntiAim.defaa:get() and RealPaste.AntiAim.defaa[0].pitch:get());
    RealPaste.AntiAim.defaa[0].cbase:visibility(RealPaste.AntiAim.defaa:get() and RealPaste.AntiAim.defaa[0].base:get());
    RealPaste.Misc.viewmodel[0].static:visibility(RealPaste.Misc.viewmodel:get());
    RealPaste.Misc.anmut[0].mode:visibility(RealPaste.Misc.anmut:get());
    RealPaste.Misc.anmut[0].enemy:visibility(RealPaste.Misc.anmut:get());
    RealPaste.Rage.adaptiveexp[0].cond:visibility(RealPaste.Rage.adaptiveexp:get());
    RealPaste.AntiAim.defaa[0].cond:visibility(RealPaste.AntiAim.defaa:get());
    RealPaste.AntiAim.abrik[0].wmode:visibility(l_mtools_0.Table.Find(RealPaste.AntiAim.abrik:get(), "Legs") ~= 0);
    RealPaste.AntiAim.abrik[0].amode:visibility(l_mtools_0.Table.Find(RealPaste.AntiAim.abrik:get(), "Legs") ~= 0);
    RealPaste.Main.nothing:visibility(checkxoyaw == true);
    RealPaste.Visuals.infopanel[0].X:visibility(false);
    RealPaste.Visuals.infopanel[0].Y:visibility(false);
    RealPaste.Visuals.dmgon[0].X:visibility(false);
    RealPaste.Visuals.dmgon[0].Y:visibility(false);
    RealPaste.Visuals.keybinds[0].X:visibility(false);
    RealPaste.Visuals.keybinds[0].Y:visibility(false);
    RealPaste.Main.dogonscreen[0].X:visibility(false);
    RealPaste.Main.dogonscreen[0].Y:visibility(false);
    RealPaste.Visuals.spectators[0].X:visibility(false);
    RealPaste.Visuals.spectators[0].Y:visibility(false);
    RealPaste.Visuals.watermark[0].X:visibility(false);
    RealPaste.Visuals.watermark[0].Y:visibility(false);
    RealPaste.Visuals.velocity[0].X:visibility(false);
    RealPaste.Visuals.velocity[0].Y:visibility(false);
    if not RealPaste.Main.optimize:get() then
        RealPaste.Visuals.selecttheme:override();
        RealPaste.Visuals.selecttheme:visibility(RealPaste.Visuals.watermark:get() or RealPaste.Visuals.keybinds:get() or RealPaste.Visuals.infopanel:get() and RealPaste.Visuals.infopanel[0].theme:get() == "Script" or RealPaste.Visuals.spectators:get());
        RealPaste.Visuals.selecttheme[0].type:visibility((not (not (not not RealPaste.Visuals.watermark:get() or RealPaste.Visuals.keybinds:get()) and (not RealPaste.Visuals.infopanel:get() or RealPaste.Visuals.infopanel[0].theme:get() ~= "Script")) or RealPaste.Visuals.spectators:get()) and RealPaste.Visuals.selecttheme:get() == "Custom" or RealPaste.Visuals.selecttheme:get_override() == "Custom");
        RealPaste.Visuals.selecttheme[0].rounding:visibility((not (RealPaste.Visuals.selecttheme[0].line:get() ~= "Off") or RealPaste.Visuals.selecttheme[0].line:get() == "Round") and RealPaste.Visuals.selecttheme:get() == "Custom" or RealPaste.Visuals.selecttheme:get_override() == "Custom" and RealPaste.Visuals.selecttheme[0].type:get() == "Simple");
        RealPaste.Visuals.selecttheme[0].line:visibility(RealPaste.Visuals.selecttheme[0].type:get() == "Simple" and not (RealPaste.Visuals.selecttheme:get() ~= "Custom") or RealPaste.Visuals.selecttheme:get_override() == "Custom");
        RealPaste.Visuals.selecttheme[0].englow:visibility(RealPaste.Visuals.selecttheme:get() == "Custom" or RealPaste.Visuals.selecttheme:get_override() == "Custom");
        RealPaste.Visuals.selecttheme[0].glowscale:visibility(RealPaste.Visuals.selecttheme[0].englow:get() and not (RealPaste.Visuals.selecttheme:get() ~= "Custom") or RealPaste.Visuals.selecttheme:get_override() == "Custom");
        RealPaste.Visuals.selecttheme[0].sizeline:visibility(RealPaste.Visuals.selecttheme[0].line:get() == "Left+Right" and not (RealPaste.Visuals.selecttheme:get() ~= "Custom") or RealPaste.Visuals.selecttheme:get_override() == "Custom");
        RealPaste.Visuals.selecttheme[0].poshalf:visibility(RealPaste.Visuals.selecttheme[0].line:get() == "Half-Round" and not (RealPaste.Visuals.selecttheme:get() ~= "Custom") or RealPaste.Visuals.selecttheme:get_override() == "Custom");
        RealPaste.Visuals.selecttheme[0].gbox:visibility(RealPaste.Visuals.selecttheme[0].type:get() ~= "Simple" and not (RealPaste.Visuals.selecttheme:get() ~= "Custom") or RealPaste.Visuals.selecttheme:get_override() == "Custom");
        RealPaste.Visuals.selecttheme[0].gpos:visibility(RealPaste.Visuals.selecttheme[0].type:get() ~= "Simple" and not (RealPaste.Visuals.selecttheme:get() ~= "Custom") or RealPaste.Visuals.selecttheme:get_override() == "Custom" and RealPaste.Visuals.selecttheme[0].gbox:get() ~= "Rounded");
        RealPaste.Visuals.selecttheme[0].grpos:visibility(RealPaste.Visuals.selecttheme[0].type:get() ~= "Simple" and not (RealPaste.Visuals.selecttheme:get() ~= "Custom") or RealPaste.Visuals.selecttheme:get_override() == "Custom" and RealPaste.Visuals.selecttheme[0].gbox:get() == "Rounded");
        RealPaste.Visuals.velocity[0].glow:visibility(RealPaste.Visuals.velocity:get() and RealPaste.Visuals.velocity[0].theme:get() == "Default");
        RealPaste.Visuals.indicators[0].inditheme.ref:override();
        RealPaste.Visuals.indicators[0].inditheme:visibility(RealPaste.Visuals.indicators:get() and RealPaste.Visuals.indicators[0].enind:get());
        RealPaste.Visuals.indicators[0].font:visibility(RealPaste.Visuals.indicators:get() and RealPaste.Visuals.indicators[0].enind:get() and RealPaste.Visuals.indicators[0].inditheme:get() == "Gradient");
        RealPaste.Visuals.indicators[0].englow:visibility(RealPaste.Visuals.indicators:get() and RealPaste.Visuals.indicators[0].enind:get() and RealPaste.Visuals.indicators[0].inditheme:get() == "Gradient");
        RealPaste.Visuals.infopanel[0].gradback:visibility(RealPaste.Visuals.infopanel:get() and RealPaste.Visuals.infopanel[0].theme:get() == "Default");
        RealPaste.Visuals.spcirl[0].theme.ref:override();
        RealPaste.Visuals.spcirl[0].theme:visibility(RealPaste.Visuals.spcirl:get());
        RealPaste.Visuals.spcirl[0].reverse:visibility(RealPaste.Visuals.spcirl:get() and RealPaste.Visuals.spcirl[0].theme:get() == "Gradient");
        RealPaste.Visuals.grenrad[0].mode.ref:override();
        RealPaste.Visuals.grenrad[0].mode:visibility(RealPaste.Visuals.grenrad:get() and (l_mtools_0.Table.Find(RealPaste.Visuals.grenrad[0].select:get(), "Smoke") ~= 0 or l_mtools_0.Table.Find(RealPaste.Visuals.grenrad[0].select:get(), "Molotov") ~= 0));
        RealPaste.Visuals.grenrad[0].reverse:visibility(RealPaste.Visuals.grenrad:get() and (not (l_mtools_0.Table.Find(RealPaste.Visuals.grenrad[0].select:get(), "Smoke") == 0) or l_mtools_0.Table.Find(RealPaste.Visuals.grenrad[0].select:get(), "Molotov") ~= 0) and RealPaste.Visuals.grenrad[0].mode:get() == "Gradient");
    else
        RealPaste.Visuals.selecttheme:override("Default");
        RealPaste.Visuals.selecttheme:visibility(false);
        RealPaste.Visuals.selecttheme[0].type:visibility(false);
        RealPaste.Visuals.selecttheme[0].rounding:visibility(false);
        RealPaste.Visuals.selecttheme[0].line:visibility(false);
        RealPaste.Visuals.selecttheme[0].englow:visibility(false);
        RealPaste.Visuals.selecttheme[0].glowscale:visibility(false);
        RealPaste.Visuals.selecttheme[0].sizeline:visibility(false);
        RealPaste.Visuals.selecttheme[0].poshalf:visibility(false);
        RealPaste.Visuals.selecttheme[0].gbox:visibility(false);
        RealPaste.Visuals.selecttheme[0].gpos:visibility(false);
        RealPaste.Visuals.selecttheme[0].grpos:visibility(false);
        RealPaste.Visuals.velocity[0].glow:visibility(false);
        RealPaste.Visuals.indicators[0].inditheme:visibility(false);
        RealPaste.Visuals.indicators[0].inditheme.ref:override("Default");
        RealPaste.Visuals.indicators[0].font:visibility(false);
        RealPaste.Visuals.indicators[0].englow:visibility(false);
        RealPaste.Visuals.infopanel[0].gradback:visibility(false);
        RealPaste.Visuals.spcirl[0].theme.ref:override("Flat");
        RealPaste.Visuals.spcirl[0].theme:visibility(false);
        RealPaste.Visuals.spcirl[0].reverse:visibility(false);
        RealPaste.Visuals.grenrad[0].mode.ref:override("Default");
        RealPaste.Visuals.grenrad[0].mode:visibility(false);
        RealPaste.Visuals.grenrad[0].reverse:visibility(false);
    end;
end;
aspectratio = function()
    -- upvalues: v57 (ref)
    if RealPaste.Misc.aspectratio:get() then
        if RealPaste.Misc.aspectratio[0].preset:get() == "Custom" then
            v57.aspectratio:float(RealPaste.Misc.aspectratio[0].ratiovalue:get() / 10);
        elseif RealPaste.Misc.aspectratio[0].preset:get() == "16:9" then
            v57.aspectratio:float(1.77);
        elseif RealPaste.Misc.aspectratio[0].preset:get() == "16:10" then
            v57.aspectratio:float(1.6);
        elseif RealPaste.Misc.aspectratio[0].preset:get() == "3:2" then
            v57.aspectratio:float(1.5);
        elseif RealPaste.Misc.aspectratio[0].preset:get() == "4:3" then
            v57.aspectratio:float(1.33);
        elseif RealPaste.Misc.aspectratio[0].preset:get() == "5:4" then
            v57.aspectratio:float(1.25);
        end;
    else
        v57.aspectratio:float(0);
    end;
end;
oldbob = v57.bob_low:int();
oldlat = v57.bob_lat:float();
oldvert = v57.bob_vert:float();
olddcycl = v57.bobcyc:float();
oldleft = v57.view_shift_l:float();
oldright = v57.view_shift_r:float();
oldrec = v57.view_rec:float();
viewmodel = function()
    -- upvalues: v57 (ref)
    if RealPaste.Misc.viewmodel:get() then
        v57.view_fov:int(RealPaste.Misc.viewmodel[0].viewfov:get(), true);
        v57.view_off_x:float(RealPaste.Misc.viewmodel[0].viewx:get(), true);
        v57.view_off_y:float(RealPaste.Misc.viewmodel[0].viewy:get(), true);
        v57.view_off_z:float(RealPaste.Misc.viewmodel[0].viewz:get(), true);
        if RealPaste.Misc.viewmodel[0].static:get() then
            v57.bob_low:int(5);
            v57.bob_lat:float(0.1);
            v57.bob_vert:float(0.1);
            v57.bobcyc:float(0.98);
            v57.view_shift_l:float(0.5);
            v57.view_shift_r:float(0.25);
            v57.view_rec:float(0);
        else
            v57.bob_low:int(oldbob);
            v57.bob_lat:float(oldlat);
            v57.bob_vert:float(oldvert);
            v57.bobcyc:float(olddcycl);
            v57.view_shift_l:float(oldleft);
            v57.view_shift_r:float(oldright);
            v57.view_rec:float(oldrec);
        end;
    else
        v57.view_fov:int(oldfov);
        v57.view_off_x:float(oldofx);
        v57.view_off_y:float(oldofy);
        v57.view_off_z:float(oldofz);
        v57.bob_low:int(oldbob);
        v57.bob_lat:float(oldlat);
        v57.bob_vert:float(oldvert);
        v57.bobcyc:float(olddcycl);
        v57.view_shift_l:float(oldleft);
        v57.view_shift_r:float(oldright);
        v57.view_rec:float(oldrec);
    end;
end;
local v118 = 10 * globals.frametime;
local v119 = false;
local v120 = 0;
idealpeek = function()
    -- upvalues: v0 (ref), v120 (ref), v118 (ref), v119 (ref), v56 (ref), v85 (ref), l_find_0 (ref), l_mtools_0 (ref)
    if not globals.is_in_game then
        return;
    else
        local v121 = math.min(math.floor(math.sin(rage.exploit:get() % 2 * 1) * 122), 100);
        local _ = v0.x / 2;
        local _ = v0.y / 2;
        local v124 = entity.get_local_player();
        local v125 = v124:get_player_weapon();
        pos = v0 / 2;
        scopecheck = v124.m_bIsScoped;
        local l_m_bIsScoped_0 = v124.m_bIsScoped;
        v120 = lerp(v120, l_m_bIsScoped_0 and 1 or 0, v118);
        if RealPaste.Visuals.scope[0].style:get() ~= "X" then
            if v125 ~= nil then
                pos.x = pos.x + 70 * v120;
            else
                pos.x = pos.x;
            end;
        elseif v125 ~= nil then
            pos.y = pos.y - 50 * v120;
        else
            pos.y = pos.y;
        end;
        if not v124:is_alive() then
            return;
        else
            if RealPaste.Rage.idealpeek:get() then
                if RealPaste.Rage.idealpeek[0].mode:get() == "Default" then
                    if v119 == true then
                        v119 = false;
                    end;
                    render.text(v56.pixel, pos - vector(0, 50), color(255, 255, 255), "c", "Charged Ideal Peek: " .. v121 .. "%");
                    v85.YawBase:override("Local View");
                    v85.FreeStand:override(true);
                    v85.DT:override(true);
                    v85.AP:override(true);
                    ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Extended Backtrack"):override();
                    l_find_0("Aimbot", "Ragebot", "Selection", "Min. Damage"):override();
                    v119 = true;
                elseif RealPaste.Rage.idealpeek[0].mode:get() == "Custom" then
                    if v119 == true then
                        v119 = false;
                    end;
                    if v85.DT:get_override() then
                        render.text(v56.pixel, pos - vector(0, 50), color(255, 255, 255), "c", "Charged Ideal Peek: " .. v121 .. "%");
                    end;
                    if l_mtools_0.Table.Find(RealPaste.Rage.idealpeek[0].custom:get(), "Freestand") ~= 0 then
                        v85.YawBase:override("Local View");
                        v85.FreeStand:override(true);
                    else
                        v85.FreeStand:override();
                        v85.YawBase:override();
                    end;
                    if l_mtools_0.Table.Find(RealPaste.Rage.idealpeek[0].custom:get(), "DoubleTap") ~= 0 then
                        v85.DT:override(true);
                    else
                        v85.DT:override();
                    end;
                    if l_mtools_0.Table.Find(RealPaste.Rage.idealpeek[0].custom:get(), "AutoPeek") ~= 0 then
                        v85.AP:override(true);
                    else
                        v85.AP:override();
                    end;
                    if l_mtools_0.Table.Find(RealPaste.Rage.idealpeek[0].custom:get(), "Extended Backtrack") ~= 0 then
                        l_find_0("Aimbot", "Ragebot", "Main", "Enabled", "Extended Backtrack"):override(true);
                    else
                        ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Extended Backtrack"):override();
                    end;
                    if l_mtools_0.Table.Find(RealPaste.Rage.idealpeek[0].custom:get(), "Min Damage") ~= 0 then
                        l_find_0("Aimbot", "Ragebot", "Selection", "Min. Damage"):override(RealPaste.Rage.idealpeek[0].mdmg:get());
                    else
                        l_find_0("Aimbot", "Ragebot", "Selection", "Min. Damage"):override();
                    end;
                    v119 = true;
                elseif v119 == true then
                    v85.FreeStand:override();
                    v85.YawBase:override();
                    v85.DT:override();
                    v85.AP:override();
                    ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Extended Backtrack"):override();
                    l_find_0("Aimbot", "Ragebot", "Selection", "Min. Damage"):override();
                    v119 = false;
                end;
            elseif v119 == true then
                v85.FreeStand:override();
                v85.YawBase:override();
                v85.DT:override();
                v85.AP:override();
                ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Extended Backtrack"):override();
                l_find_0("Aimbot", "Ragebot", "Selection", "Min. Damage"):override();
                v119 = false;
            end;
            return;
        end;
    end;
end;
customhitchance = function()
    -- upvalues: l_mtools_0 (ref), l_find_0 (ref), v85 (ref)
    if not globals.is_in_game then
        return;
    else
        l_mtools_0.AntiAims.Condition:Update();
        local v127 = entity.get_local_player();
        local l_Dev_0 = l_mtools_0.AntiAims.Condition:GetDev("Air");
        local l_Dev_1 = l_mtools_0.AntiAims.Condition:GetDev("Crouch");
        if not v127:is_alive() then
            return;
        else
            local v130 = RealPaste.Rage.hitchance[0].ahc:get();
            local v131 = RealPaste.Rage.hitchance[0].nshc:get();
            local v132 = RealPaste.Rage.hitchance[0].crhc:get();
            local l_m_bIsScoped_1 = v127.m_bIsScoped;
            local _ = v127:get_player_weapon();
            l_find_0("Aimbot", "Ragebot", "Selection", "Hit Chance"):override();
            if l_mtools_0.Table.Find(RealPaste.Rage.hitchance:get(), "NoScope") ~= 0 and l_m_bIsScoped_1 == false then
                if l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wnshc:get(), "SSG 08") ~= 0 then
                    v85.ssghc:override(v131);
                end;
                if l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wnshc:get(), "Autosniper") ~= 0 then
                    v85.scarhc:override(v131);
                end;
                if l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wnshc:get(), "AWP") ~= 0 then
                    v85.awphc:override(v131);
                end;
            end;
            if l_mtools_0.Table.Find(RealPaste.Rage.hitchance:get(), "Air") ~= 0 and l_Dev_0 then
                if l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wahc:get(), "Autosniper") ~= 0 then
                    v85.scarhc:override(v130);
                end;
                if l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wahc:get(), "SSG 08") ~= 0 then
                    v85.ssghc:override(v130);
                end;
                if l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wahc:get(), "AWP") ~= 0 then
                    v85.awphc:override(v130);
                end;
                if l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wahc:get(), "Shotgun") ~= 0 then
                    v85.shghc:override(v130);
                end;
                if l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wahc:get(), "Others") ~= 0 then
                    v85.shghc:override(v130);
                    l_find_0("Aimbot", "Ragebot", "Selection", "Global", "Hit Chance"):override(v130);
                    l_find_0("Aimbot", "Ragebot", "Selection", "Rifles", "Hit Chance"):override(v130);
                    l_find_0("Aimbot", "Ragebot", "Selection", "SMGs", "Hit Chance"):override(v130);
                    l_find_0("Aimbot", "Ragebot", "Selection", "Machineguns", "Hit Chance"):override(v130);
                    l_find_0("Aimbot", "Ragebot", "Selection", "AK-47", "Hit Chance"):override(v130);
                    l_find_0("Aimbot", "Ragebot", "Selection", "M4A1/M4A4", "Min. Damage"):override(v130);
                    l_find_0("Aimbot", "Ragebot", "Selection", "AUG/SG 553", "Hit Chance"):override(v130);
                end;
            end;
            if l_mtools_0.Table.Find(RealPaste.Rage.hitchance:get(), "Crouch") ~= 0 and l_Dev_1 then
                if l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wcrhc:get(), "Autosniper") ~= 0 then
                    v85.scarhc:override(v132);
                end;
                if l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wcrhc:get(), "SSG 08") ~= 0 then
                    v85.ssghc:override(v132);
                end;
                if l_mtools_0.Table.Find(RealPaste.Rage.hitchance[0].wcrhc:get(), "AWP") ~= 0 then
                    v85.awphc:override(v132);
                end;
            end;
            return;
        end;
    end;
end;
local v135 = 0;
local function v137(v136)
    -- upvalues: v135 (ref)
    if v136.choked_commands == 0 then
        v135 = v135 + 1;
    end;
end;
local function v139(v138)
    -- upvalues: v135 (ref)
    return v135 % v138 + 1;
end;
Condidionos = function()
    -- upvalues: l_mtools_0 (ref)
    l_mtools_0.AntiAims.Condition:Update();
    local v140 = l_mtools_0.AntiAims.Condition:Get({
        [1] = RealPaste.AntiAim["S" .. ".Enable"]:get() and "S" or "", 
        [2] = RealPaste.AntiAim["M" .. ".Enable"]:get() and "W" or "", 
        [3] = RealPaste.AntiAim["SW" .. ".Enable"]:get() and "SW" or "", 
        [4] = RealPaste.AntiAim["C" .. ".Enable"]:get() and "C" or "", 
        [5] = RealPaste.AntiAim["A" .. ".Enable"]:get() and "A" or "", 
        [6] = RealPaste.AntiAim["A-C" .. ".Enable"]:get() and "AC" or ""
    });
    if v140 == "S" then
        v140 = "S";
    end;
    if v140 == "W" then
        v140 = "M";
    end;
    if v140 == "SW" then
        v140 = "SW";
    end;
    if v140 == "C" then
        v140 = "C";
    end;
    if v140 == "A" then
        v140 = "A";
    end;
    if v140 == "AC" then
        v140 = "A-C";
    end;
    return v140;
end;
local v141 = 2;
local v142 = false;
local v143 = 0;
makeAA = function(v144)
    -- upvalues: l_mtools_0 (ref), v85 (ref), v141 (ref), v143 (ref), v142 (ref), l_find_0 (ref), v139 (ref)
    l_mtools_0.AntiAims.Condition:Update();
    local v145 = l_mtools_0.AntiAims.Condition:Get({
        [1] = "S", 
        [2] = "W", 
        [3] = "SW", 
        [4] = "C", 
        [5] = "A", 
        [6] = "AC"
    });
    local v146 = v145 == "S";
    local v147 = v145 == "W";
    local v148 = v145 == "SW";
    local v149 = v145 == "C";
    local v150 = v145 == "A";
    local v151 = v145 == "AC";
    local _ = entity.get_local_player();
    if RealPaste.AntiAim.preset:get() == "Half-Jitter" then
        v85.Pitch:override("Down");
        v85.Yaw:override("Backward");
        v85.YawBase:override("At Target");
        v85.YawAdd:override(0);
        v85.AntiBS:override(true);
        v85.YawModifier:override("Spin");
        v85.ModifierDegree:override(-12);
        v85.BodyYaw:override(true);
        v85.LeftLimit:override(60);
        v85.RightLimit:override(60);
        v85.FakeOptions:override("");
        v85.FSDesync:override("Peek Fake");
    elseif RealPaste.AntiAim.preset:get() == "Static" then
        v85.Pitch:override("Down");
        v85.Yaw:override("Backward");
        v85.YawBase:override("At Target");
        v85.YawAdd:override(15);
        v85.AntiBS:override(true);
        v85.YawModifier:override("Disabled");
        v85.ModifierDegree:override(0);
        v85.BodyYaw:override(true);
        v85.LeftLimit:override(45);
        v85.RightLimit:override(50);
        v85.FakeOptions:override({
            [1] = "Anti Bruteforce"
        });
        v85.FSDesync:override("Peek Fake");
    elseif RealPaste.AntiAim.preset:get() == "SH1ZA" then
        if v146 then
            v85.Pitch:override("Down");
            v85.Yaw:override("Backward");
            v85.YawBase:override("At Target");
            v85.YawAdd:override(rage.antiaim:inverter() and 12 or -12);
            v85.AntiBS:override(true);
            v85.YawModifier:override("Offset");
            v85.ModifierDegree:override(39);
            v85.BodyYaw:override(true);
            v85.LeftLimit:override(50);
            v85.RightLimit:override(50);
            v85.FakeOptions:override({
                [1] = "Jitter"
            });
            v85.FSDesync:override("Off");
        elseif v147 then
            v85.Pitch:override("Down");
            v85.Yaw:override("Backward");
            v85.YawBase:override("At Target");
            v85.YawAdd:override(rage.antiaim:inverter() and -19 or 19);
            v85.AntiBS:override(true);
            v85.YawModifier:override("Center");
            v85.ModifierDegree:override(70);
            v85.BodyYaw:override(true);
            v85.LeftLimit:override(18);
            v85.RightLimit:override(18);
            v85.FakeOptions:override({
                [1] = "Jitter"
            });
            v85.FSDesync:override("Off");
        elseif v148 then
            v85.Pitch:override("Down");
            v85.Yaw:override("Backward");
            v85.YawBase:override("At Target");
            v85.YawAdd:override(rage.antiaim:inverter() and -12 or 4);
            v85.AntiBS:override(true);
            v85.YawModifier:override("Offset");
            v85.ModifierDegree:override(69);
            v85.BodyYaw:override(true);
            v85.LeftLimit:override(30);
            v85.RightLimit:override(20);
            v85.FakeOptions:override({
                [1] = "Jitter"
            });
            v85.FSDesync:override("Off");
        elseif v149 then
            v85.Pitch:override("Down");
            v85.Yaw:override("Backward");
            v85.YawBase:override("At Target");
            v85.YawAdd:override(0);
            v85.AntiBS:override(true);
            v85.YawModifier:override("Disabled");
            v85.ModifierDegree:override(0);
            v85.BodyYaw:override(true);
            v85.LeftLimit:override(5);
            v85.RightLimit:override(2);
            v85.FakeOptions:override({
                [1] = "Anti Bruteforce"
            });
            v85.FSDesync:override("Peek Fake");
        elseif v151 then
            v85.Pitch:override("Down");
            v85.Yaw:override("Backward");
            v85.YawBase:override("At Target");
            v85.YawAdd:override(0);
            v85.AntiBS:override(true);
            v85.YawModifier:override("Disabled");
            v85.ModifierDegree:override(0);
            v85.BodyYaw:override(true);
            v85.LeftLimit:override(0);
            v85.RightLimit:override(0);
            v85.FakeOptions:override({});
            v85.FSDesync:override("Off");
        elseif v150 then
            v85.Pitch:override("Down");
            v85.Yaw:override("Backward");
            v85.YawBase:override("At Target");
            v85.YawAdd:override(rage.antiaim:inverter() and -17 or 17);
            v85.AntiBS:override(true);
            v85.YawModifier:override("Spin");
            v85.ModifierDegree:override(-15);
            v85.BodyYaw:override(true);
            v85.LeftLimit:override(30);
            v85.RightLimit:override(12);
            v85.FakeOptions:override({
                [1] = "Avoid Overlap", 
                [2] = "Jitter"
            });
            v85.FSDesync:override("Off");
        end;
    elseif RealPaste.AntiAim.preset:get() == "kysmeow\226\157\164\239\184\143" then
        if v146 then
            v85.Pitch:override("Down");
            v85.Yaw:override("Backward");
            v85.YawBase:override("At Target");
            v85.YawAdd:override(0);
            v85.AntiBS:override(true);
            v85.YawModifier:override("Center");
            v85.ModifierDegree:override(-65);
            v85.BodyYaw:override(true);
            v85.LeftLimit:override(60);
            v85.RightLimit:override(60);
            v85.FakeOptions:override({
                [1] = "Jitter"
            });
            v85.FSDesync:override("Off");
        elseif v147 then
            v85.Pitch:override("Down");
            v85.Yaw:override("Backward");
            v85.YawBase:override("At Target");
            v85.YawAdd:override(rage.antiaim:inverter() and -2 or -7);
            v85.AntiBS:override(true);
            v85.YawModifier:override("Center");
            v85.ModifierDegree:override(-79);
            v85.BodyYaw:override(true);
            v85.LeftLimit:override(60);
            v85.RightLimit:override(60);
            v85.FakeOptions:override({
                [1] = "Jitter"
            });
            v85.FSDesync:override("Off");
        elseif v148 then
            v85.Pitch:override("Down");
            v85.Yaw:override("Backward");
            v85.YawBase:override("At Target");
            v85.YawAdd:override(-7);
            v85.AntiBS:override(true);
            v85.YawModifier:override("Center");
            v85.ModifierDegree:override(-74);
            v85.BodyYaw:override(true);
            v85.LeftLimit:override(60);
            v85.RightLimit:override(60);
            v85.FakeOptions:override({
                [1] = "Jitter"
            });
            v85.FSDesync:override("Off");
        elseif v149 then
            v85.Pitch:override("Down");
            v85.Yaw:override("Backward");
            v85.YawBase:override("At Target");
            v85.YawAdd:override(7);
            v85.AntiBS:override(true);
            v85.YawModifier:override("Center");
            v85.ModifierDegree:override(-74);
            v85.BodyYaw:override(true);
            v85.LeftLimit:override(60);
            v85.RightLimit:override(60);
            v85.FakeOptions:override({
                [1] = "Jitter"
            });
            v85.FSDesync:override("Off");
        elseif v151 then
            v85.Pitch:override("Down");
            v85.Yaw:override("Backward");
            v85.YawBase:override("At Target");
            v85.YawAdd:override(7);
            v85.AntiBS:override(true);
            v85.YawModifier:override("Center");
            v85.ModifierDegree:override(-70);
            v85.BodyYaw:override(true);
            v85.LeftLimit:override(60);
            v85.RightLimit:override(60);
            v85.FakeOptions:override({
                [1] = "Jitter"
            });
            v85.FSDesync:override("Off");
        elseif v150 then
            v85.Pitch:override("Down");
            v85.Yaw:override("Backward");
            v85.YawBase:override("At Target");
            v85.YawAdd:override(7);
            v85.AntiBS:override(true);
            v85.YawModifier:override("Center");
            v85.ModifierDegree:override(-74);
            v85.BodyYaw:override(true);
            v85.LeftLimit:override(60);
            v85.RightLimit:override(60);
            v85.FakeOptions:override({
                [1] = "Jitter"
            });
            v85.FSDesync:override("Off");
        end;
    elseif RealPaste.AntiAim.preset:get() == "Custom" then
        if getnum(RealPaste.AntiAim[Condidionos() .. ".Yaw Base"]) == 1 then
            v85.YawBase:override("Local View");
            v85.Yaw:override("Disabled");
        elseif getnum(RealPaste.AntiAim[Condidionos() .. ".Yaw Base"]) == 2 then
            v85.YawBase:override("Local View");
            v85.Yaw:override("Backward");
        elseif getnum(RealPaste.AntiAim[Condidionos() .. ".Yaw Base"]) == 3 then
            v85.Yaw:override("Backward");
            v85.YawBase:override("At Target");
        end;
        if globals.tickcount % RealPaste.AntiAim[Condidionos() .. ".Ticks"]:get() == 1 then
            v141 = v141 + 1;
        end;
        if v141 > 2 then
            v141 = 1;
        end;
        if RealPaste.AntiAim[Condidionos() .. ".Yaw Base"][0].mode:get() == "Flicker" then
            v85.YawAdd:override(RealPaste.AntiAim[Condidionos() .. v141 .. ".Phase Yaw"]:get());
        elseif RealPaste.AntiAim[Condidionos() .. ".Yaw Base"][0].mode:get() == "Delay" then
            if globals.tickcount > v143 + (RealPaste.AntiAim[Condidionos() .. ".Delay"]:get() + math.random(RealPaste.AntiAim[Condidionos() .. ".Randomize"]:get())) then
                if v144.choked_commands == 0 then
                    v142 = not v142;
                    v143 = globals.tickcount;
                end;
            elseif globals.tickcount < v143 then
                v143 = globals.tickcount;
            end;
            rage.antiaim:inverter(v142);
            v85.YawAdd:override(rage.antiaim:inverter() and RealPaste.AntiAim[Condidionos() .. ".L Delay Yaw"]:get() or RealPaste.AntiAim[Condidionos() .. ".R Delay Yaw"]:get());
        elseif l_mtools_0.Table.Find(RealPaste.AntiAim[Condidionos() .. ".2 Side"]:get(), "Yaw Add") ~= 0 then
            v85.YawAdd:override(rage.antiaim:inverter() and RealPaste.AntiAim[Condidionos() .. ".Yaw Add Left"]:get() or RealPaste.AntiAim[Condidionos() .. ".Yaw Add Right"]:get());
        else
            v85.YawAdd:override(RealPaste.AntiAim[Condidionos() .. ".Yaw Add"]:get());
        end;
        v85.YawModifier:override(RealPaste.AntiAim[Condidionos() .. ".Yaw Modifier"]:get());
        v85.ModifierDegree:override(RealPaste.AntiAim[Condidionos() .. ".Modifier Degree"]:get());
        v85.BodyYaw:override(RealPaste.AntiAim[Condidionos() .. ".Body Yaw"]:get());
        if l_mtools_0.Table.Find(RealPaste.AntiAim[Condidionos() .. ".2 Side"]:get(), "Desync") ~= 0 then
            v85.LeftLimit:override(RealPaste.AntiAim[Condidionos() .. ".Left Limit"]:get());
            v85.RightLimit:override(RealPaste.AntiAim[Condidionos() .. ".Right Limit"]:get());
        else
            v85.LeftLimit:override(RealPaste.AntiAim[Condidionos() .. ".Desync Limit"]:get());
            v85.RightLimit:override(RealPaste.AntiAim[Condidionos() .. ".Desync Limit"]:get());
        end;
        v85.FakeOptions:override(RealPaste.AntiAim[Condidionos() .. ".Fake Options"]:get());
        if getnum(RealPaste.AntiAim[Condidionos() .. ".FreeStand Desync"]) == 2 then
            v85.FSDesync:override("Peek Fake");
        elseif getnum(RealPaste.AntiAim[Condidionos() .. ".FreeStand Desync"]) == 3 then
            v85.FSDesync:override("Peek Real");
        else
            v85.FSDesync:override("Off");
        end;
    else
        v85.Yaw:override();
        v85.YawBase:override();
        v85.YawAdd:override();
        v85.YawModifier:override();
        v85.ModifierDegree:override();
        v85.BodyYaw:override();
        v85.LeftLimit:override();
        v85.RightLimit:override();
        v85.FakeOptions:override();
        v85.FSDesync:override();
        v85.FreeStand:override();
        v85.FsDisModDegr:override();
        v85.FsBdFs:override();
    end;
    if getnum(RealPaste.AntiAim.ybase) == 1 then
        if RealPaste.AntiAim.preset:get() == "Custom" then
            if getnum(RealPaste.AntiAim[Condidionos() .. ".Yaw Base"]) == 1 then
                v85.YawBase:override("Local View");
                v85.Yaw:override("Disabled");
                v85.FreeStand:override();
            elseif getnum(RealPaste.AntiAim[Condidionos() .. ".Yaw Base"]) == 2 then
                v85.YawBase:override("Local View");
                v85.Yaw:override("Backward");
                v85.FreeStand:override();
            elseif getnum(RealPaste.AntiAim[Condidionos() .. ".Yaw Base"]) == 3 then
                v85.Yaw:override("Backward");
                v85.YawBase:override("At Target");
                v85.FreeStand:override();
            end;
        end;
    elseif getnum(RealPaste.AntiAim.ybase) == 2 then
        v85.YawBase:override("Local View");
        v85.Yaw:override("Backward");
        v85.YawAdd:override(180);
        v85.FreeStand:override();
    elseif getnum(RealPaste.AntiAim.ybase) == 3 then
        v85.YawBase:override("Local View");
        v85.Yaw:override("Backward");
        v85.YawAdd:override(-90);
        v85.FreeStand:override();
    elseif getnum(RealPaste.AntiAim.ybase) == 4 then
        v85.YawBase:override("Local View");
        v85.Yaw:override("Backward");
        v85.YawAdd:override(90);
        v85.FreeStand:override();
    end;
    if ui.get_alpha() > 0.5 and RealPaste.AntiAim.preset:get() ~= "Disabled" and RealPaste.AntiAim.preset:get() ~= "Custom" then
        v85.Yaw:override("Backward");
        v85.YawBase:override("Local View");
        v85.YawAdd:override(0);
        v85.YawModifier:override("Disabled");
        v85.ModifierDegree:override(0);
        v85.BodyYaw:override(true);
        v85.LeftLimit:override(60);
        v85.RightLimit:override(60);
        v85.FakeOptions:override({});
        v85.FSDesync:override("Off");
        v85.FreeStand:override();
        v85.FsDisModDegr:override();
        v85.FsBdFs:override();
    end;
    if l_mtools_0.Table.Find(RealPaste.AntiAim.tweek:get(), "Disable AA On Warmup") ~= 0 and entity.get_game_rules().m_bWarmupPeriod == true then
        l_find_0("Aimbot", "Anti Aim", "Angles", "Enabled"):override(false);
    else
        l_find_0("Aimbot", "Anti Aim", "Angles", "Enabled"):override();
    end;
    local v153 = v85.FakeOptions:get();
    if l_mtools_0.Table.Find(RealPaste.AntiAim.tweek:get(), "Static Manuals") ~= 0 and (RealPaste.AntiAim.ybase:get() == "Left" or RealPaste.AntiAim.ybase:get() == "Right" or RealPaste.AntiAim.ybase:get() == "Forward") then
        table.remove(v153, FindIndex(v153, "Jitter"));
        v85.YawModifier:override("Disabled");
        v85.FakeOptions:override(v153);
        v85.FreeStand:override(false);
    else
        v85.FreeStand:override();
    end;
    if l_mtools_0.Table.Find(RealPaste.AntiAim.tweek:get(), "Edge Yaw") ~= 0 and is_edging1 then
        v85.YawAdd:override(angle1);
        v85.YawBase:override("Local View");
        v85.Yaw:override("Backward");
        v85.FreeStand:override(false);
    else
        v85.FreeStand:override();
    end;
    if RealPaste.AntiAim.defaa:get() then
        local v154 = l_mtools_0.AntiAims.Condition:Get({
            [1] = "S", 
            [2] = "W", 
            [3] = "SW", 
            [4] = "C", 
            [5] = "A", 
            [6] = "AC"
        });
        local v155 = v154 == "S";
        local v156 = v154 == "W";
        local v157 = v154 == "SW";
        local v158 = v154 == "C";
        local v159 = v154 == "A";
        local v160 = v154 == "AC";
        local v161 = l_mtools_0.Table.Find(RealPaste.AntiAim.defaa[0].cond:get(), "Standing") ~= 0 and v155;
        local v162 = l_mtools_0.Table.Find(RealPaste.AntiAim.defaa[0].cond:get(), "Moving") ~= 0 and v156;
        local v163 = l_mtools_0.Table.Find(RealPaste.AntiAim.defaa[0].cond:get(), "Slow walking") ~= 0 and v157;
        local v164 = l_mtools_0.Table.Find(RealPaste.AntiAim.defaa[0].cond:get(), "Crouching") ~= 0 and v158;
        local v165 = l_mtools_0.Table.Find(RealPaste.AntiAim.defaa[0].cond:get(), "Air") ~= 0 and v159;
        local v166 = l_mtools_0.Table.Find(RealPaste.AntiAim.defaa[0].cond:get(), "Air-Crouch") ~= 0 and v160;
        local v167 = RealPaste.AntiAim.legitaa:get() and common.is_button_down(69) and l_mtools_0.Table.Find(RealPaste.AntiAim.defaa[0].cond:get(), "Legit AA") ~= 0;
        local v168 = (not not v85.AP:get() or v85.AP:get_override()) and l_mtools_0.Table.Find(RealPaste.AntiAim.defaa[0].cond:get(), "Auto Peek") ~= 0;
        local v169 = RealPaste.AntiAim.defaa[0].pitch:get() or RealPaste.AntiAim.defaa[0].base:get() or RealPaste.AntiAim.defaa[0].pitch:get() and RealPaste.AntiAim.defaa[0].base:get();
        l_find_0("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override(v169 and not v161 and not v162 and not v163 and not v164 and not v165 and not v166 and not v167 and not v168);
        if RealPaste.AntiAim.defaa[0].pitch:get() and rage.exploit:get() then
            if RealPaste.AntiAim.defaa[0].cpitch:get() == "Up" then
                rage.antiaim:override_hidden_pitch(-89);
            elseif RealPaste.AntiAim.defaa[0].cpitch:get() == "Up Half" then
                rage.antiaim:override_hidden_pitch(-45);
            elseif RealPaste.AntiAim.defaa[0].cpitch:get() == "Down Half" then
                rage.antiaim:override_hidden_pitch(45);
            elseif RealPaste.AntiAim.defaa[0].cpitch:get() == "Random" then
                rage.antiaim:override_hidden_pitch(math.random(-89, 45));
            end;
        end;
        if not RealPaste.AntiAim.defaa[0].base:get() then
            rage.antiaim:override_hidden_yaw_offset(0);
        elseif RealPaste.AntiAim.defaa[0].cbase:get() == "RealFish" then
            if v144.in_moveleft then
                rage.antiaim:override_hidden_yaw_offset(globals.tickcount % 2 and 90);
            elseif v144.in_moveright then
                rage.antiaim:override_hidden_yaw_offset(globals.tickcount % 2 and -90);
            end;
        elseif RealPaste.AntiAim.defaa[0].cbase:get() == "Forward" then
            rage.antiaim:override_hidden_yaw_offset(180);
        elseif RealPaste.AntiAim.defaa[0].cbase:get() == "3-Way" then
            rage.antiaim:override_hidden_yaw_offset(90 * (v139(3) - 2));
        elseif RealPaste.AntiAim.defaa[0].cbase:get() == "5-Way" then
            local v170 = {
                [1] = -1, 
                [2] = -0.5, 
                [3] = 0, 
                [4] = 0.5, 
                [5] = 1
            };
            rage.antiaim:override_hidden_yaw_offset(90 * v170[v139(5)]);
        elseif RealPaste.AntiAim.defaa[0].cbase:get() == "Random" then
            rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
        end;
    else
        l_find_0("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override();
    end;
end;
local _ = l_find_0("Miscellaneous", "Main", "Other", "Windows"):get();
FindIndex = function(v172, v173)
    for v174, v175 in pairs(v172) do
        if v175 == v173 then
            return v174;
        end;
    end;
    return -1;
end;
local v183 = l_system_0.register({
    [1] = RealPaste.Visuals.watermark[0].X, 
    [2] = RealPaste.Visuals.watermark[0].Y
}, vector(300, 25), "watermal", function(v176)
    -- upvalues: l_mtools_0 (ref), v53 (ref), v2 (ref), l_monylinear_0 (ref), v56 (ref)
    v176:on_config_load();
    l_mtools_0.Animation:Register("MTools");
    l_mtools_0.Animation:Update("MTools", 6);
    local v177 = common.get_system_time();
    local v178 = string.format("%02d:%02d:%02d", v177.hours, v177.minutes, v177.seconds);
    if globals.tickcount % 20 == 1 then
        v53.fps = getInfoFPS();
        v53.ping = getInfoPING();
    end;
    local l_fps_0 = v53.fps;
    if string.len(l_fps_0) == 1 then
        l_fps_0 = "  " .. l_fps_0;
    end;
    if string.len(l_fps_0) == 2 then
        l_fps_0 = " " .. l_fps_0;
    end;
    local v180 = scripttextpasxa .. " | " .. v2 .. " | " .. v53.ping .. "ms | " .. l_fps_0 .. " fps | " .. v178;
    if RealPaste.Visuals.watermark[0].nmode:get() == "Gradient" then
        pixelluatext213 = l_monylinear_0:Animate("RPL", {
            color(colors.r, colors.g, colors.b), 
            color(colors.r / 4, colors.g / 4, colors.b / 4)
        }, 2.5);
        luatext213 = l_monylinear_0:Animate(scripttextpasxa, {
            color(colors.r, colors.g, colors.b), 
            color(colors.r / 4, colors.g / 4, colors.b / 4)
        }, 2.5);
    else
        luatext213 = scripttextpasxa;
        pixelluatext213 = "RPL";
    end;
    if RealPaste.Visuals.watermark[0].name:get() == "Default" then
        textwm23 = luatext213 .. "\aDEFAULT | " .. v2 .. " | " .. v53.ping .. "ms | " .. l_fps_0 .. " fps | " .. v178;
    elseif RealPaste.Visuals.watermark[0].name:get() == "Icon" then
        textwm23 = v2 .. " | " .. v53.ping .. "ms | " .. l_fps_0 .. " fps | " .. v178;
    end;
    local l_x_0 = render.measure_text(v56.verdana12, nil, v180).x;
    if RealPaste.Visuals.watermark:get() and RealPaste.Visuals.watermark[0].pos:get() == "None" then
        if RealPaste.Visuals.selecttheme:get() == "Default" or RealPaste.Visuals.selecttheme:get_override() == "Default" then
            style(v176.position.x + 10, v176.position.y, l_x_0 + v176.size.x / 12, 20, color(colors.r, colors.g, colors.b, 255), 1, RealPaste.Main.optimize);
            render.text(v56.verdana12, vector(v176.position.x + 22, v176.position.y + 5), color(txtcloror.r, txtcloror.g, txtcloror.b, 255), nil, v180);
        elseif RealPaste.Visuals.selecttheme:get() == "Custom" or RealPaste.Visuals.selecttheme:get_override() == "Custom" then
            local l_x_1 = render.measure_text(v56.verdana12, nil, textwm23).x;
            if RealPaste.Visuals.watermark[0].name:get() == "Icon" then
                style2(v176.position.x + 15, v176.position.y - 2, l_x_1 + v176.size.x / 4, 25, color(colors.r, colors.g, colors.b, 255), 1, RealPaste.Visuals.selecttheme[0].rounding, RealPaste.Visuals.selecttheme[0].line, RealPaste.Visuals.selecttheme[0].englow, RealPaste.Visuals.selecttheme[0].glowscale, RealPaste.Visuals.selecttheme[0].sizeline, RealPaste.Visuals.selecttheme[0].poshalf, RealPaste.Visuals.selecttheme[0].type, RealPaste.Visuals.selecttheme[0].gbox, RealPaste.Visuals.selecttheme[0].gpos, RealPaste.Visuals.selecttheme[0].grpos, RealPaste.Main.optimize);
                if senkopasxa == true then
                    render.texture(senkopngda, vector(v176.position.x + l_x_1 / 6, v176.position.y - 1), vector(25, 25), color());
                else
                    render.text(v56.pixel24, vector(v176.position.x + l_x_1 / 4, v176.position.y + 10), color(colors.r, colors.g, colors.b, 255), "c", pixelluatext213);
                end;
                render.text(v56.verdana12, vector(v176.position.x + l_x_1 / 2.5, v176.position.y + 5), color(txtcloror.r, txtcloror.g, txtcloror.b, 255), nil, textwm23);
            elseif RealPaste.Visuals.watermark[0].name:get() == "Default" then
                style2(v176.position.x + 10, v176.position.y, l_x_1 + v176.size.x / 12, 20, color(colors.r, colors.g, colors.b, 255), 1, RealPaste.Visuals.selecttheme[0].rounding, RealPaste.Visuals.selecttheme[0].line, RealPaste.Visuals.selecttheme[0].englow, RealPaste.Visuals.selecttheme[0].glowscale, RealPaste.Visuals.selecttheme[0].sizeline, RealPaste.Visuals.selecttheme[0].poshalf, RealPaste.Visuals.selecttheme[0].type, RealPaste.Visuals.selecttheme[0].gbox, RealPaste.Visuals.selecttheme[0].gpos, RealPaste.Visuals.selecttheme[0].grpos, RealPaste.Main.optimize);
                render.text(v56.verdana12, vector(v176.position.x + 22, v176.position.y + 5), color(txtcloror.r, txtcloror.g, txtcloror.b, 255), nil, textwm23);
            end;
        end;
    end;
end);
drawmark = function()
    -- upvalues: l_mtools_0 (ref), v53 (ref), v2 (ref), l_monylinear_0 (ref), v56 (ref), v0 (ref), v183 (ref)
    l_mtools_0.Animation:Register("MTools");
    l_mtools_0.Animation:Update("MTools", 6);
    local v184 = common.get_system_time();
    local v185 = string.format("%02d:%02d:%02d", v184.hours, v184.minutes, v184.seconds);
    if globals.tickcount % 20 == 1 then
        v53.fps = getInfoFPS();
        v53.ping = getInfoPING();
    end;
    local l_fps_1 = v53.fps;
    if string.len(l_fps_1) == 1 then
        l_fps_1 = "  " .. l_fps_1;
    end;
    if string.len(l_fps_1) == 2 then
        l_fps_1 = " " .. l_fps_1;
    end;
    local v187 = scripttextpasxa .. " | " .. v2 .. " | " .. v53.ping .. "ms | " .. l_fps_1 .. " fps | " .. v185;
    if RealPaste.Visuals.watermark[0].nmode:get() == "Gradient" then
        pixelluatext213 = l_monylinear_0:Animate("RPL", {
            color(colors.r, colors.g, colors.b), 
            color(colors.r / 4, colors.g / 4, colors.b / 4)
        }, 2.5);
        luatext213 = l_monylinear_0:Animate(scripttextpasxa, {
            color(colors.r, colors.g, colors.b), 
            color(colors.r / 4, colors.g / 4, colors.b / 4)
        }, 2.5);
    else
        luatext213 = scripttextpasxa;
        pixelluatext213 = "RPL";
    end;
    if RealPaste.Visuals.watermark[0].name:get() == "Default" then
        textwm23 = luatext213 .. "\aDEFAULT | " .. v2 .. " | " .. v53.ping .. "ms | " .. l_fps_1 .. " fps | " .. v185;
    elseif RealPaste.Visuals.watermark[0].name:get() == "Icon" then
        textwm23 = v2 .. " | " .. v53.ping .. "ms | " .. l_fps_1 .. " fps | " .. v185;
    end;
    local l_x_2 = render.measure_text(v56.verdana12, nil, v187).x;
    if RealPaste.Visuals.watermark:get() then
        if RealPaste.Visuals.watermark[0].pos:get() == "Top Right" then
            if RealPaste.Visuals.selecttheme:get() == "Default" or RealPaste.Visuals.selecttheme:get_override() == "Default" then
                style(v0.x - 23 - l_x_2, 10, 15 + l_x_2, 20, color(colors.r, colors.g, colors.b, 255), 1, RealPaste.Main.optimize);
                render.text(v56.verdana12, vector(v0.x - 15 - l_x_2, 15), color(txtcloror.r, txtcloror.g, txtcloror.b, 255), nil, v187);
            elseif RealPaste.Visuals.selecttheme:get() == "Custom" or RealPaste.Visuals.selecttheme:get_override() == "Custom" then
                local l_x_3 = render.measure_text(v56.verdana12, nil, textwm23).x;
                if RealPaste.Visuals.watermark[0].name:get() == "Icon" then
                    style2(v0.x - 88 - l_x_3, 15, l_x_3 + 70, 25, color(colors.r, colors.g, colors.b, 255), 1, RealPaste.Visuals.selecttheme[0].rounding, RealPaste.Visuals.selecttheme[0].line, RealPaste.Visuals.selecttheme[0].englow, RealPaste.Visuals.selecttheme[0].glowscale, RealPaste.Visuals.selecttheme[0].sizeline, RealPaste.Visuals.selecttheme[0].poshalf, RealPaste.Visuals.selecttheme[0].type, RealPaste.Visuals.selecttheme[0].gbox, RealPaste.Visuals.selecttheme[0].gpos, RealPaste.Visuals.selecttheme[0].grpos, RealPaste.Main.optimize);
                    if senkopasxa == true then
                        render.texture(senkopngda, vector(v0.x - 70 - l_x_3, 16), vector(25, 25), color());
                    else
                        render.text(v56.pixel24, vector(v0.x - 60 - l_x_3, 28), color(colors.r, colors.g, colors.b, 255), "c", pixelluatext213);
                    end;
                elseif RealPaste.Visuals.watermark[0].name:get() == "Default" then
                    style2(v0.x - 38 - l_x_3, 15, l_x_3 + 20, 25, color(colors.r, colors.g, colors.b, 255), 1, RealPaste.Visuals.selecttheme[0].rounding, RealPaste.Visuals.selecttheme[0].line, RealPaste.Visuals.selecttheme[0].englow, RealPaste.Visuals.selecttheme[0].glowscale, RealPaste.Visuals.selecttheme[0].sizeline, RealPaste.Visuals.selecttheme[0].poshalf, RealPaste.Visuals.selecttheme[0].type, RealPaste.Visuals.selecttheme[0].gbox, RealPaste.Visuals.selecttheme[0].gpos, RealPaste.Visuals.selecttheme[0].grpos, RealPaste.Main.optimize);
                end;
                render.text(v56.verdana12, vector(v0.x - 30 - l_x_3, 22), color(txtcloror.r, txtcloror.g, txtcloror.b, 255), nil, textwm23);
            end;
        elseif RealPaste.Visuals.watermark[0].pos:get() == "Top Left" then
            if RealPaste.Visuals.selecttheme:get() == "Default" or RealPaste.Visuals.selecttheme:get_override() == "Default" then
                style(15, 10, 15 + l_x_2, 20, color(colors.r, colors.g, colors.b, 255), 1, RealPaste.Main.optimize);
                render.text(v56.verdana12, vector(22, 15), color(txtcloror.r, txtcloror.g, txtcloror.b, 255), nil, v187);
            elseif RealPaste.Visuals.selecttheme:get() == "Custom" or RealPaste.Visuals.selecttheme:get_override() == "Custom" then
                local l_x_4 = render.measure_text(v56.verdana12, nil, textwm23).x;
                if RealPaste.Visuals.watermark[0].name:get() == "Icon" then
                    style2(5, 15, l_x_4 + 60, 25, color(colors.r, colors.g, colors.b, 255), 1, RealPaste.Visuals.selecttheme[0].rounding, RealPaste.Visuals.selecttheme[0].line, RealPaste.Visuals.selecttheme[0].englow, RealPaste.Visuals.selecttheme[0].glowscale, RealPaste.Visuals.selecttheme[0].sizeline, RealPaste.Visuals.selecttheme[0].poshalf, RealPaste.Visuals.selecttheme[0].type, RealPaste.Visuals.selecttheme[0].gbox, RealPaste.Visuals.selecttheme[0].gpos, RealPaste.Visuals.selecttheme[0].grpos, RealPaste.Main.optimize);
                    render.text(v56.verdana12, vector(60, 22), color(txtcloror.r, txtcloror.g, txtcloror.b, 255), nil, textwm23);
                    if senkopasxa == true then
                        render.texture(senkopngda, vector(15, 16), vector(25, 25), color());
                    else
                        render.text(v56.pixel24, vector(30, 28), color(colors.r, colors.g, colors.b, 255), "c", pixelluatext213);
                    end;
                elseif RealPaste.Visuals.watermark[0].name:get() == "Default" then
                    style2(5, 15, l_x_4 + 10, 25, color(colors.r, colors.g, colors.b, 255), 1, RealPaste.Visuals.selecttheme[0].rounding, RealPaste.Visuals.selecttheme[0].line, RealPaste.Visuals.selecttheme[0].englow, RealPaste.Visuals.selecttheme[0].glowscale, RealPaste.Visuals.selecttheme[0].sizeline, RealPaste.Visuals.selecttheme[0].poshalf, RealPaste.Visuals.selecttheme[0].type, RealPaste.Visuals.selecttheme[0].gbox, RealPaste.Visuals.selecttheme[0].gpos, RealPaste.Visuals.selecttheme[0].grpos, RealPaste.Main.optimize);
                    render.text(v56.verdana12, vector(10, 22), color(txtcloror.r, txtcloror.g, txtcloror.b, 255), nil, luatext213 .. " | " .. v2 .. " | " .. v53.ping .. "ms | " .. l_fps_1 .. " fps | " .. v185);
                end;
            end;
        elseif RealPaste.Visuals.watermark[0].pos:get() == "Down" then
            if RealPaste.Visuals.selecttheme:get() == "Default" or RealPaste.Visuals.selecttheme:get_override() == "Default" then
                style(v0.x / 2 - l_x_2 / 2, v0.y - 30, l_x_2 + 15, 20, color(colors.r, colors.g, colors.b, 255), 1, RealPaste.Main.optimize);
                render.text(v56.verdana12, vector(v0.x / 2 - l_x_2 / 2 + 7, v0.y - 25), color(txtcloror.r, txtcloror.g, txtcloror.b, 255), nil, v187);
            elseif RealPaste.Visuals.selecttheme:get() == "Custom" or RealPaste.Visuals.selecttheme:get_override() == "Custom" then
                local l_x_5 = render.measure_text(v56.verdana12, nil, textwm23).x;
                if RealPaste.Visuals.watermark[0].name:get() == "Icon" then
                    style2(v0.x / 2 - l_x_5 / 2 - 30, v0.y - 33, l_x_5 + 70, 25, color(colors.r, colors.g, colors.b, 255), 1, RealPaste.Visuals.selecttheme[0].rounding, RealPaste.Visuals.selecttheme[0].line, RealPaste.Visuals.selecttheme[0].englow, RealPaste.Visuals.selecttheme[0].glowscale, RealPaste.Visuals.selecttheme[0].sizeline, RealPaste.Visuals.selecttheme[0].poshalf, RealPaste.Visuals.selecttheme[0].type, RealPaste.Visuals.selecttheme[0].gbox, RealPaste.Visuals.selecttheme[0].gpos, RealPaste.Visuals.selecttheme[0].grpos, RealPaste.Main.optimize);
                    if senkopasxa == true then
                        render.texture(senkopngda, vector(v0.x / 2 - l_x_5 / 1.8, v0.y - 32), vector(25, 25), color());
                    else
                        render.text(v56.pixel24, vector(v0.x / 2 - l_x_5 / 2, v0.y - 20), color(colors.r, colors.g, colors.b, 255), "c", pixelluatext213);
                    end;
                    render.text(v56.verdana12, vector(v0.x / 2 - l_x_5 / 2 + 30, v0.y - 25), color(txtcloror.r, txtcloror.g, txtcloror.b, 255), nil, textwm23);
                elseif RealPaste.Visuals.watermark[0].name:get() == "Default" then
                    style2(v0.x / 2 - l_x_5 / 2, v0.y - 33, l_x_5 + 20, 25, color(colors.r, colors.g, colors.b, 255), 1, RealPaste.Visuals.selecttheme[0].rounding, RealPaste.Visuals.selecttheme[0].line, RealPaste.Visuals.selecttheme[0].englow, RealPaste.Visuals.selecttheme[0].glowscale, RealPaste.Visuals.selecttheme[0].sizeline, RealPaste.Visuals.selecttheme[0].poshalf, RealPaste.Visuals.selecttheme[0].type, RealPaste.Visuals.selecttheme[0].gbox, RealPaste.Visuals.selecttheme[0].gpos, RealPaste.Visuals.selecttheme[0].grpos, RealPaste.Main.optimize);
                    render.text(v56.verdana12, vector(v0.x / 2 - l_x_5 / 2 + 10, v0.y - 25), color(txtcloror.r, txtcloror.g, txtcloror.b, 255), nil, luatext213 .. " | " .. v2 .. " | " .. v53.ping .. "ms | " .. l_fps_1 .. " fps | " .. v185);
                end;
            end;
        end;
    end;
    if RealPaste.Visuals.watermark:get() and RealPaste.Visuals.watermark[0].pos:get() == "None" then
        v183:update();
    end;
end;
local v192 = nil;
local v193 = 0;
drawcustom = function()
    -- upvalues: v192 (ref), v85 (ref), v193 (ref), v0 (ref)
    if not globals.is_in_game then
        return;
    else
        local v194 = entity.get_local_player();
        if v194 == nil or not v194:is_alive() then
            return;
        elseif v194:get_player_weapon() == nil then
            return;
        else
            if v192 == nil then
                v192 = v85.removescope:get();
            end;
            if not RealPaste.Visuals.scope:get() then
                v85.removescope:override(v192);
                v85.removescope:override();
                return;
            else
                v85.removescope:override("Remove All");
                local_player = entity.get_local_player();
                anim_speed = RealPaste.Visuals.scope[0].animscop:get() / 1.5;
                if not local_player or not local_player:is_alive() or not local_player.m_bIsScoped then
                    v193 = lerp(v193, 0, anim_speed * globals.frametime);
                else
                    v193 = lerp(v193, 1, anim_speed * globals.frametime);
                end;
                offset = RealPaste.Visuals.scope[0].offsetscop:get() * v193;
                length = RealPaste.Visuals.scope[0].lengthscop:get() * v193;
                col_1 = (RealPaste.Visuals.scope[0].invert:get() and RealPaste.Visuals.scope[0].color_2:get() or RealPaste.Visuals.scope[0].color_1:get()) * color(255, 255, 255, 255 * v193);
                col_2 = (RealPaste.Visuals.scope[0].invert:get() and RealPaste.Visuals.scope[0].color_1:get() or RealPaste.Visuals.scope[0].color_2:get()) * color(255, 255, 255, 255 * v193);
                width = 1;
                start_x = v0.x / 2;
                start_y = v0.y / 2;
                if RealPaste.Visuals.scope[0].style:get() == "X" then
                    render.push_rotation(45);
                    render.gradient(vector(start_x - offset, start_y), vector(start_x - offset - length, start_y + width), col_1, col_2, col_1, col_2);
                    render.gradient(vector(start_x + offset, start_y), vector(start_x + offset + length, start_y + width), col_1, col_2, col_1, col_2);
                    render.gradient(vector(start_x, start_y + offset + 1), vector(start_x + width, start_y + offset + length), col_1, col_1, col_2, col_2);
                    render.gradient(vector(start_x, start_y - offset), vector(start_x + width, start_y - offset - length), col_1, col_1, col_2, col_2);
                    render.pop_rotation();
                end;
                if RealPaste.Visuals.scope[0].style:get() == "Default" then
                    render.gradient(vector(start_x - offset, start_y), vector(start_x - offset - length, start_y + width), col_1, col_2, col_1, col_2);
                    render.gradient(vector(start_x + offset, start_y), vector(start_x + offset + length, start_y + width), col_1, col_2, col_1, col_2);
                    render.gradient(vector(start_x, start_y + offset + 1), vector(start_x + width, start_y + offset + length), col_1, col_1, col_2, col_2);
                    render.gradient(vector(start_x, start_y - offset), vector(start_x + width, start_y - offset - length), col_1, col_1, col_2, col_2);
                end;
                if RealPaste.Visuals.scope[0].style:get() == "T" then
                    render.gradient(vector(start_x - offset, start_y), vector(start_x - offset - length, start_y + width), col_1, col_2, col_1, col_2);
                    render.gradient(vector(start_x + offset, start_y), vector(start_x + offset + length, start_y + width), col_1, col_2, col_1, col_2);
                    render.gradient(vector(start_x, start_y + offset + 1), vector(start_x + width, start_y + offset + length), col_1, col_1, col_2, col_2);
                end;
                return;
            end;
        end;
    end;
end;
local v196 = l_system_0.register({
    [1] = RealPaste.Visuals.dmgon[0].X, 
    [2] = RealPaste.Visuals.dmgon[0].Y
}, vector(15, 15), "drawdnmg", function(v195)
    -- upvalues: v56 (ref)
    mdmg123321 = GetNL("Min. Damage");
    dmsizx = render.measure_text(v56.pixel, "s", skokdmg).x;
    if ui.get_alpha() > 0 then
        render.rect_outline(vector(v195.position.x, v195.position.y), vector(v195.position.x + dmsizx + 3, v195.position.y + v195.size.y - 2), color(255, 255, 255, 255 * ui.get_alpha()));
    end;
    if RealPaste.Visuals.dmgon[0].mode:get() and mdmg123321 == true then
        render.text(v56.pixel, vector(v195.position.x + 2, v195.position.y), color(255, 255, 255, 255), nil, skokdmg);
    elseif not RealPaste.Visuals.dmgon[0].mode:get() then
        render.text(v56.pixel, vector(v195.position.x + 2, v195.position.y), color(255, 255, 255, 255), nil, skokdmg);
    end;
end);
drawdmg = function()
    -- upvalues: v85 (ref), v196 (ref)
    if not globals.is_in_game then
        return;
    elseif not entity.get_local_player():is_alive() then
        return;
    else
        if RealPaste.Visuals.dmgon:get() then
            skokdmg = ("%.f"):format(v85.DMG:get());
            if v85.DMG:get() == 0 then
                skokdmg = "Auto";
            end;
            v196:update();
        end;
        return;
    end;
end;
inddilepts = 0;
inddilepts2 = 0;
indicators = function()
    -- upvalues: l_mtools_0 (ref), v0 (ref), v120 (ref), v56 (ref), v1 (ref), l_monylinear_0 (ref), v85 (ref)
    l_mtools_0.Animation:Register("MTools1");
    l_mtools_0.Animation:Update("MTools1", 6);
    l_mtools_0.Animation:Register("Indicators");
    l_mtools_0.Animation:Update("Indicators", 7.5);
    l_mtools_0.AntiAims.Condition:Update();
    local l_Dev_2 = l_mtools_0.AntiAims.Condition:GetDev("Air");
    local v198 = color(255, 255, 255, 255);
    local _ = v0.x / 2;
    local _ = v0.y;
    local v201 = RealPaste.Visuals.indicators[0].ypos:get();
    local v202 = entity.get_local_player();
    if not globals.is_in_game then
        return;
    elseif not v202:is_alive() then
        return;
    else
        if RealPaste.Visuals.indicators[0].huinya:get() == "/" then
            iside = rage.antiaim:inverter() == true and "/" or "\\";
        elseif RealPaste.Visuals.indicators[0].huinya:get() == "-" then
            iside = "-";
        else
            iside = "";
        end;
        local v203 = math.min(math.floor(math.sin(globals.realtime % 3 * 4) * 255), 255);
        local v204 = bit.band(v202.m_fFlags, bit.lshift(2, 0)) ~= 0;
        local v205 = vector(v202["m_vecVelocity[0]"], v202["m_vecVelocity[1]"], v202["m_vecVelocity[2]"]):length2d();
        scopecheck = v202.m_bIsScoped;
        pos = v0 / 2;
        scopecheck = v202.m_bIsScoped;
        v120 = l_mtools_0.Animation:Lerp("MTools1", "Number", not v202.m_bIsScoped, 0, 1);
        local v206 = v202:get_player_weapon();
        if RealPaste.Visuals.scope[0].style:get() ~= "X" then
            if v206 ~= nil then
                pos.x = pos.x + 50 * v120;
            else
                pos.x = pos.x;
            end;
        elseif v206 ~= nil then
            pos.y = pos.y + 25 * v120;
        else
            pos.y = pos.y;
        end;
        local v207 = render.measure_text(v56.pixel, "cs", "Real");
        local v208 = render.measure_text(v56.pixel, "cs", "Paste");
        local _ = vector(v207.x + v208.x, math.max(v207.y, v208.y));
        local v210 = GetNL("Min. Damage");
        indrealall = render.measure_text(v56.pixel, "cs", scripttextpasxa).y;
        indrealallx = render.measure_text(v56.pixel, "cs", scripttextpasxa).x;
        if RealPaste.Visuals.indicators:get() then
            if not RealPaste.Visuals.indicators[0].enind:get() then
                return;
            else
                local v211 = render.measure_text(v56.pixel, "cs", "Real");
                inddilepts2 = l_mtools_0.Animation:OldLerp(inddilepts2, rage.antiaim:inverter() and color(v198.r, v198.g, v198.b, 255) or color(colors.r, colors.g, colors.b, 255), 24);
                inddilepts = l_mtools_0.Animation:OldLerp(inddilepts, rage.antiaim:inverter() and color(colors.r, colors.g, colors.b, 255) or color(v198.r, v198.g, v198.b, 255), 24);
                local _ = render.measure_text(v56.pixel, "cs", "Paste");
                if getnum(RealPaste.Visuals.indicators[0].inditheme) == 1 or RealPaste.Visuals.indicators[0].inditheme:get_override() == "Default" then
                    if senkopasxa == true then
                        render.text(v56.pixel, pos - vector(-1, -20 - v201), inddilepts, "c", "senko\a" .. inddilepts2:to_hex() .. "tech\194\176");
                    else
                        render.text(v56.pixel, pos - vector(-1, -20 - v201), inddilepts, "c", "Real\a" .. inddilepts2:to_hex() .. "Paste");
                    end;
                    render.text(v56.pixel, pos - vector(-2, -11 - v201), color(colors.r, colors.g, colors.b, v203), "c", v1);
                elseif getnum(RealPaste.Visuals.indicators[0].inditheme) == 2 or RealPaste.Visuals.indicators[0].inditheme:get_override() == "Gradient" then
                    local v213 = l_monylinear_0:Animate(scripttextpasxa, {
                        color(colors.r, colors.g, colors.b), 
                        color(colors.r / 4, colors.g / 4, colors.b / 4)
                    }, 2.5);
                    local v214 = render.measure_text(RealPaste.Visuals.indicators[0].font:get() == "Pixel" and v56.pixel or RealPaste.Visuals.indicators[0].font:get() == "Verdana" and v56.verdanaind or RealPaste.Visuals.indicators[0].font:get() == "4" and 4, "cs", v213);
                    if RealPaste.Visuals.indicators[0].englow:get() and not RealPaste.Main.optimize:get() then
                        render.shadow(pos - vector(-1 + v214.x / 2, -20 - v201), pos - vector(1 - v214.x / 2, -20 - v201 - 2), color(colors.r, colors.g, colors.b), 20, 0, 0);
                    end;
                    render.text(RealPaste.Visuals.indicators[0].font:get() == "Pixel" and v56.pixel or RealPaste.Visuals.indicators[0].font:get() == "Verdana" and v56.verdanaind or RealPaste.Visuals.indicators[0].font:get() == "4" and 4, pos - vector(0, -20 - v201), color(255, 255, 255), "c", v213);
                end;
                if RealPaste.AntiAim.legitaa:get() and common.is_button_down(69) then
                    render.text(v56.pixel, pos - vector(v211.x / 2 - 11, -23 - indrealall / 2 - v201), color(255, 255, 255, 255), "c", "" .. iside .. "LegitAA" .. iside .. "");
                elseif l_Dev_2 then
                    render.text(v56.pixel, pos - vector(v211.x / 2 - 11, -23 - indrealall / 2 - v201), color(255, 255, 255, 255), "c", "" .. iside .. "Air" .. iside .. "");
                elseif v205 > 100 then
                    render.text(v56.pixel, pos - vector(v211.x / 2 - 12, -23 - indrealall / 2 - v201), color(255, 255, 255, 255), "c", "" .. iside .. "Moving" .. iside .. "");
                elseif v85.SW:get() then
                    render.text(v56.pixel, pos - vector(v211.x / 2 - 12, -23 - indrealall / 2 - v201), color(255, 255, 255, 255), "c", "" .. iside .. "SlowWalk" .. iside .. "");
                elseif v204 then
                    render.text(v56.pixel, pos - vector(v211.x / 2 - 12, -23 - indrealall / 2 - v201), color(255, 255, 255, 255), "c", "" .. iside .. "Crouch" .. iside .. "");
                else
                    render.text(v56.pixel, pos - vector(v211.x / 2 - 12, -23 - indrealall / 2 - v201), color(255, 255, 255, 255), "c", "" .. iside .. "Standing" .. iside .. "");
                end;
                local l_y_1 = render.measure_text(v56.pixel, "cs", "Standing").y;
                local v216 = {
                    DT = l_mtools_0.Animation:Lerp("Indicators", "Anim.DT", not v85.DT:get()), 
                    PEEK = l_mtools_0.Animation:Lerp("Indicators", "Anim.PEEK", not v85.AP:get()), 
                    ONSHOT = l_mtools_0.Animation:Lerp("Indicators", "Anim.HS", not v85.HS:get()), 
                    DUCK = l_mtools_0.Animation:Lerp("Indicators", "Anim.DUCK", not v85.FD:get()), 
                    MDMG = l_mtools_0.Animation:Lerp("Indicators", "Anim.MDMG", not v210)
                };
                render.text(2, pos + vector(1, 14 + indrealall / 2 + v201 + l_y_1 + 6 * v216.DT), rage.exploit:get() == 1 and color(0, 255, 0, 255 * v216.DT) or color(255, 0, 0, 255 * v216.DT), "c", "DT");
                local v217 = l_mtools_0.Animation:Lerp("Indicators", "Anim.UP1", v216.DT <= 0);
                render.text(2, pos + vector(1, 14 + indrealall / 2 + v201 + l_y_1 + 9 * v217 + 6 * v216.ONSHOT), color(238, 179, 177, 255 * v216.ONSHOT), "c", "ONSHOT");
                local v218 = v217 + v216.ONSHOT;
                render.text(2, pos + vector(1, 14 + indrealall / 2 + v201 + l_y_1 + 9 * v218 + 6 * v216.PEEK), color(255, 255, 255, 255 * v216.PEEK), "c", "PEEK");
                local v219 = v218 + v216.PEEK;
                render.text(2, pos + vector(1, 14 + indrealall / 2 + v201 + l_y_1 + 9 * v219 + 6 * v216.DUCK), color(255, 255, 255, 255 * v216.DUCK), "c", "DUCK");
                local v220 = v219 + v216.DUCK;
                render.text(2, pos + vector(1, 14 + indrealall / 2 + v201 + l_y_1 + 9 * v220 + 6 * v216.MDMG), color(255, 255, 255, 255 * v216.MDMG), "c", "DMG");
            end;
        end;
        return;
    end;
end;
drawarrow = function()
    -- upvalues: v0 (ref), l_mtools_0 (ref), v56 (ref)
    local v221 = v0.x / 2;
    local v222 = v0.y / 2;
    local v223 = entity.get_local_player();
    local v224 = RealPaste.Visuals.indicators[0].xpos:get();
    local v225 = RealPaste.Visuals.indicators[0].desynccolor:get();
    if not globals.is_in_game then
        return;
    elseif not v223:is_alive() then
        return;
    elseif not RealPaste.Visuals.indicators:get() then
        return;
    else
        scopecheck = v223.m_bIsScoped;
        if scopecheck then
            return;
        else
            if l_mtools_0.Table.Find(RealPaste.Visuals.indicators[0].arrow:get(), "Manual") ~= 0 then
                if RealPaste.Visuals.indicators[0].sarrow:get() == "Default" then
                    render.poly(RealPaste.AntiAim.ybase:get() == "Right" and color(colors.r, colors.g, colors.b, 255) or color(35, 35, 35, 150), vector(v221 + 55, v222), vector(v221 + 42, v222 - 9), vector(v221 + 42, v222 + 9));
                    render.poly(RealPaste.AntiAim.ybase:get() == "Left" and color(colors.r, colors.g, colors.b, 255) or color(35, 35, 35, 150), vector(v221 - 55, v222), vector(v221 - 42, v222 - 9), vector(v221 - 42, v222 + 9));
                elseif RealPaste.Visuals.indicators[0].sarrow:get() == "Mini" then
                    render.poly(RealPaste.AntiAim.ybase:get() == "Right" and color(colors.r, colors.g, colors.b, 255) or color(35, 35, 35, 150), vector(v221 + 35 + v224, v222), vector(v221 + 22 + v224, v222 - 7), vector(v221 + 22 + v224, v222 + 7));
                    render.poly(RealPaste.AntiAim.ybase:get() == "Left" and color(colors.r, colors.g, colors.b, 255) or color(35, 35, 35, 150), vector(v221 - 35 - v224, v222), vector(v221 - 22 - v224, v222 - 7), vector(v221 - 22 - v224, v222 + 7));
                end;
            end;
            if l_mtools_0.Table.Find(RealPaste.Visuals.indicators[0].arrow:get(), "Desync") ~= 0 then
                if RealPaste.Visuals.indicators[0].sarrow:get() == "Default" then
                    render.rect(vector(v221 + 38, v222 - 9), vector(v221 + 40, v222 + 9), rage.antiaim:inverter() == true and color(v225.r, v225.g, v225.b, 255) or color(35, 35, 35, 150));
                    render.rect(vector(v221 - 40, v222 - 9), vector(v221 - 38, v222 + 9), rage.antiaim:inverter() == false and color(v225.r, v225.g, v225.b, 255) or color(35, 35, 35, 150));
                elseif RealPaste.Visuals.indicators[0].sarrow:get() == "Mini" then
                    render.rect(vector(v221 + 20 + v224, v222 - 7), vector(v221 + 22 + v224, v222 + 7), rage.antiaim:inverter() == true and color(v225.r, v225.g, v225.b, 255) or color(35, 35, 35, 150));
                    render.rect(vector(v221 - 22 - v224, v222 - 7), vector(v221 - 20 - v224, v222 + 7), rage.antiaim:inverter() == true and color(35, 35, 35, 150) or color(v225.r, v225.g, v225.b, 255));
                end;
            end;
            if (l_mtools_0.Table.Find(RealPaste.Visuals.indicators[0].arrow:get(), "Manual") ~= 0 or l_mtools_0.Table.Find(RealPaste.Visuals.indicators[0].arrow:get(), "Desync") ~= 0) and RealPaste.Visuals.indicators[0].sarrow:get() == "Primo" then
                render.poly(l_mtools_0.Table.Find(RealPaste.Visuals.indicators[0].arrow:get(), "Manual") ~= 0 and RealPaste.AntiAim.ybase:get() == "Right" and not l_mtools_0.Table.Find(RealPaste.Visuals.indicators[0].arrow:get(), "Desync") ~= 0 and color(colors.r, colors.g, colors.b, 255) or color(35, 35, 35, 150), vector(v221 + 35 + v224, v222), vector(v221 + 22 + v224, v222 - 7), vector(v221 + 22 + v224, v222 + 7));
                render.poly(l_mtools_0.Table.Find(RealPaste.Visuals.indicators[0].arrow:get(), "Manual") ~= 0 and RealPaste.AntiAim.ybase:get() == "Left" and not l_mtools_0.Table.Find(RealPaste.Visuals.indicators[0].arrow:get(), "Desync") ~= 0 and color(colors.r, colors.g, colors.b, 255) or color(35, 35, 35, 150), vector(v221 - 35 - v224, v222), vector(v221 - 22 - v224, v222 - 7), vector(v221 - 22 - v224, v222 + 7));
                render.poly(l_mtools_0.Table.Find(RealPaste.Visuals.indicators[0].arrow:get(), "Desync") ~= 0 and rage.antiaim:inverter() == true and RealPaste.AntiAim.ybase:get() ~= "Left" and RealPaste.AntiAim.ybase:get() ~= "Right" and color(v225.r, v225.g, v225.b, 255) or color(35, 35, 35, 0), vector(v221 + 35 + v224, v222), vector(v221 + 22 + v224, v222 - 7), vector(v221 + 22 + v224, v222 + 7));
                render.poly(l_mtools_0.Table.Find(RealPaste.Visuals.indicators[0].arrow:get(), "Desync") ~= 0 and rage.antiaim:inverter() == false and RealPaste.AntiAim.ybase:get() ~= "Left" and RealPaste.AntiAim.ybase:get() ~= "Right" and color(v225.r, v225.g, v225.b, 255) or color(35, 35, 35, 0), vector(v221 - 35 - v224, v222), vector(v221 - 22 - v224, v222 - 7), vector(v221 - 22 - v224, v222 + 7));
            end;
            if (l_mtools_0.Table.Find(RealPaste.Visuals.indicators[0].arrow:get(), "Manual") ~= 0 or l_mtools_0.Table.Find(RealPaste.Visuals.indicators[0].arrow:get(), "Desync") ~= 0) and RealPaste.Visuals.indicators[0].sarrow:get() == "Simple" then
                if RealPaste.Visuals.indicators[0].atype:get() == "Manual" then
                    render.text(v56.verdana, vector(v221 + 27 + v224, v222), RealPaste.AntiAim.ybase:get() == "Right" and color(colors.r, colors.g, colors.b, 255) or color(35, 35, 35, 150), "c", ">");
                    render.text(v56.verdana, vector(v221 - 27 - v224, v222), RealPaste.AntiAim.ybase:get() == "Left" and color(colors.r, colors.g, colors.b, 255) or color(35, 35, 35, 150), "c", "<");
                elseif RealPaste.Visuals.indicators[0].atype:get() == "Desync" then
                    render.text(v56.verdana, vector(v221 + 27 + v224, v222), rage.antiaim:inverter() == true and color(v225.r, v225.g, v225.b, 255) or color(35, 35, 35, 150), "c", ">");
                    render.text(v56.verdana, vector(v221 - 27 - v224, v222), rage.antiaim:inverter() == true and color(35, 35, 35, 150) or color(v225.r, v225.g, v225.b, 255), "c", "<");
                end;
            end;
            return;
        end;
    end;
end;
local v229 = l_system_0.register({
    [1] = RealPaste.Visuals.infopanel[0].X, 
    [2] = RealPaste.Visuals.infopanel[0].Y
}, vector(120, 40), "infoscript", function(v226)
    -- upvalues: v56 (ref), v2 (ref), v1 (ref)
    local l_x_6 = render.measure_text(v56.pixel30, "cs", "RPL").x;
    local l_x_7 = render.measure_text(v56.pixel, "cs", "" .. v2).x;
    if l_x_7 > 50 then
        l_x_7 = 55;
    end;
    v226:on_config_load();
    if RealPaste.Visuals.selecttheme:get() == "Default" or RealPaste.Visuals.selecttheme:get_override() == "Default" then
        style(v226.position.x, v226.position.y, v226.size.x + l_x_7 - 15, v226.size.y, color(colors.r, colors.g, colors.b, 255), 1, RealPaste.Main.optimize);
    elseif RealPaste.Visuals.selecttheme:get() == "Custom" or RealPaste.Visuals.selecttheme:get_override() == "Custom" then
        style2(v226.position.x, v226.position.y, v226.size.x + l_x_7 - 15, v226.size.y, color(colors.r, colors.g, colors.b, 255), 1, RealPaste.Visuals.selecttheme[0].rounding, RealPaste.Visuals.selecttheme[0].line, RealPaste.Visuals.selecttheme[0].englow, RealPaste.Visuals.selecttheme[0].glowscale, RealPaste.Visuals.selecttheme[0].sizeline, RealPaste.Visuals.selecttheme[0].poshalf, RealPaste.Visuals.selecttheme[0].type, RealPaste.Visuals.selecttheme[0].gbox, RealPaste.Visuals.selecttheme[0].gpos, RealPaste.Visuals.selecttheme[0].grpos, RealPaste.Main.optimize);
    end;
    if senkopasxa == true then
        render.texture(senkopngda, vector(v226.position.x + 5, v226.position.y + 2), vector(40, 40), color());
    else
        render.text(v56.pixel30, vector(v226.position.x + 30, v226.position.y + 20), color(colors.r, colors.g, colors.b, 255), "c", "RPL");
    end;
    render.text(v56.pixel, vector(v226.position.x + 30 + l_x_6, v226.position.y + 10), color(255, 255, 255, 255), "c", scripttextpasxa);
    render.text(v56.pixel, vector(v226.position.x + 29 + l_x_6, v226.position.y + 20), color(255, 255, 255, 255), "c", "User:    ");
    render.text(v56.pixel, vector(v226.position.x + 4 + l_x_6 + l_x_7, v226.position.y + 20), color(colors.r, colors.g, colors.b, 255), "c", "    " .. v2);
    render.text(v56.pixel, vector(v226.position.x + 29 + l_x_6, v226.position.y + 30), color(255, 255, 255, 255), "c", "Build:   ");
    render.text(v56.pixel, vector(v226.position.x + 29 + l_x_6, v226.position.y + 30), color(colors.r, colors.g, colors.b, 255), "c", "        " .. v1);
end);
drawpanel = function()
    -- upvalues: v0 (ref), v56 (ref), v2 (ref), v1 (ref), v229 (ref)
    local _ = v0.x / 2;
    local _ = v0.y / 2;
    local l_x_8 = render.measure_text(v56.pixel, "cs", "" .. v2).x;
    if l_x_8 > 50 then
        l_x_8 = 55;
    end;
    if not RealPaste.Visuals.infopanel:get() then
        return;
    else
        if RealPaste.Visuals.infopanel[0].theme:get() == "Default" then
            if not globals.is_in_game then
                return;
            else
                if RealPaste.Visuals.infopanel[0].gradback:get() and not RealPaste.Main.optimize:get() then
                    render.gradient(vector(0, v0.y / 2 - 2), vector(50 + l_x_8, v0.y / 2 - 31), color(colors.r, colors.g, colors.b, 255), color(colors.r / 3, colors.g / 3, colors.b / 3, 0), color(colors.r, colors.g, colors.b, 255), color(colors.r / 3, colors.g / 3, colors.b / 3, 0));
                end;
                if senkopasxa == true then
                    render.texture(senkopngda, vector(-11, v0.y / 2 - 120), vector(100, 100), color());
                end;
                render.text(v56.pixel, vector(31, v0.y / 2 - 25), color(255, 255, 255, 255), "c", scripttextpasxa);
                render.text(v56.pixel, vector(30, v0.y / 2 - 17), color(255, 255, 255, 255), "c", "User:    ");
                render.text(v56.pixel, vector(4 + l_x_8, v0.y / 2 - 17), color(colors.r, colors.g, colors.b, 255), "c", "    " .. v2);
                render.text(v56.pixel, vector(30, v0.y / 2 - 9), color(255, 255, 255, 255), "c", "Build:   ");
                render.text(v56.pixel, vector(30, v0.y / 2 - 9), color(colors.r, colors.g, colors.b, 255), "c", "        " .. v1);
            end;
        elseif RealPaste.Visuals.infopanel[0].theme:get() == "Script" then
            v229:update();
        end;
        return;
    end;
end;
keyalpha = 0;
keysize = 0;
local v241 = l_system_0.register({
    [1] = RealPaste.Visuals.keybinds[0].X, 
    [2] = RealPaste.Visuals.keybinds[0].Y
}, vector(125, 20), "Keybinds", function(v233)
    -- upvalues: v56 (ref), l_mtools_0 (ref)
    keysize = 100;
    v233:on_config_load();
    if RealPaste.Visuals.selecttheme:get() == "Default" or RealPaste.Visuals.selecttheme:get_override() == "Default" then
        style(v233.position.x, v233.position.y, v233.size.x, v233.size.y, color(colors.r, colors.g, colors.b, 255 * keyalpha), keyalpha, RealPaste.Main.optimize);
    elseif RealPaste.Visuals.selecttheme:get() == "Custom" or RealPaste.Visuals.selecttheme:get_override() == "Custom" then
        style2(v233.position.x, v233.position.y, v233.size.x, v233.size.y, color(colors.r, colors.g, colors.b, colors.a * keyalpha), keyalpha, RealPaste.Visuals.selecttheme[0].rounding, RealPaste.Visuals.selecttheme[0].line, RealPaste.Visuals.selecttheme[0].englow, RealPaste.Visuals.selecttheme[0].glowscale, RealPaste.Visuals.selecttheme[0].sizeline, RealPaste.Visuals.selecttheme[0].poshalf, RealPaste.Visuals.selecttheme[0].type, RealPaste.Visuals.selecttheme[0].gbox, RealPaste.Visuals.selecttheme[0].gpos, RealPaste.Visuals.selecttheme[0].grpos, RealPaste.Main.optimize);
    end;
    render.text(v56.verdana12, vector(v233.position.x + v233.size.x / 2, v233.position.y + v233.size.y / 2), color(txtcloror.r, txtcloror.g, txtcloror.b, 255 * keyalpha), "c", "Keybinds");
    local v234 = {
        Alpha = false, 
        Y = 20 + RealPaste.Visuals.keybinds[0].before:get(), 
        Binds = ui.get_binds()
    };
    for _, v236 in pairs(v234.Binds) do
        local v237 = v236.mode == 1 and "[holding]" or "[toggled]";
        local v238 = {
            Name = render.measure_text(1, nil, v236.name).x, 
            Mode = render.measure_text(1, nil, v237).x
        };
        if v236.active then
            v234.Alpha = true;
        end;
        if v238.Name + v238.Mode + 16 > keysize then
            keysize = v238.Name + v238.Mode + 16;
        end;
        local v239 = l_mtools_0.Animation:Lerp("Keybinds", v236.name, not v236.active) * keyalpha;
        render.text(1, vector(v233.position.x + 3, v233.position.y + v234.Y), color(255, 255, 255, 255 * v239), "o", v236.name);
        render.text(1, vector(v233.position.x + v233.size.x - v238.Mode - 3, v233.position.y + v234.Y), color(255, 255, 255, 255 * v239), "o", v237);
        v234.Y = v234.Y + 12.5 + RealPaste.Visuals.keybinds[0].between:get() * v239;
    end;
    local v240 = l_mtools_0.Animation:Lerp("Keybinds", "GlobalAlpha", not v234.Alpha and ui.get_alpha() <= 0.5);
    keyalpha = l_mtools_0.Animation:OldLerp(keyalpha, v240, 16);
    v233.size.x = l_mtools_0.Animation:OldLerp(v233.size.x, keysize, 16);
end);
drawbinds = function()
    -- upvalues: l_mtools_0 (ref), v241 (ref)
    if RealPaste.Visuals.keybinds:get() then
        l_mtools_0.Animation:Register("Keybinds");
        l_mtools_0.Animation:Update("Keybinds", 7.5);
        v241:update();
    end;
end;
specalpha = 0;
specsize = 0;
local v245 = l_system_0.register({
    [1] = RealPaste.Visuals.spectators[0].X, 
    [2] = RealPaste.Visuals.spectators[0].Y
}, vector(125, 20), "Spectators", function(v242)
    -- upvalues: v56 (ref), l_mtools_0 (ref)
    specsize = 100;
    v242:on_config_load();
    if RealPaste.Visuals.selecttheme:get() == "Default" or RealPaste.Visuals.selecttheme:get_override() == "Default" then
        style(v242.position.x, v242.position.y, v242.size.x, v242.size.y, color(colors.r, colors.g, colors.b, 255 * specalpha), 1 * specalpha, RealPaste.Main.optimize);
    elseif RealPaste.Visuals.selecttheme:get() == "Custom" or RealPaste.Visuals.selecttheme:get_override() == "Custom" then
        style2(v242.position.x, v242.position.y, v242.size.x, v242.size.y, color(colors.r, colors.g, colors.b, colors.a * specalpha), 1 * specalpha, RealPaste.Visuals.selecttheme[0].rounding, RealPaste.Visuals.selecttheme[0].line, RealPaste.Visuals.selecttheme[0].englow, RealPaste.Visuals.selecttheme[0].glowscale, RealPaste.Visuals.selecttheme[0].sizeline, RealPaste.Visuals.selecttheme[0].poshalf, RealPaste.Visuals.selecttheme[0].type, RealPaste.Visuals.selecttheme[0].gbox, RealPaste.Visuals.selecttheme[0].gpos, RealPaste.Visuals.selecttheme[0].grpos, RealPaste.Main.optimize);
    end;
    render.text(v56.verdana12, vector(v242.position.x + v242.size.x / 2, v242.position.y + v242.size.y / 2), color(txtcloror.r, txtcloror.g, txtcloror.b, 255 * specalpha), "c", "Spectators");
    local v243 = l_mtools_0.Widget:Template({
        AVASize = 11, 
        Between = 24, 
        Index = "2", 
        NameLimit = 19, 
        Name = "Spectators", 
        Position = vector(v242.position.x + 3, v242.position.y + RealPaste.Visuals.spectators[0].before:get() / 2), 
        Size = v242.size, 
        Alpha = specalpha, 
        Indent = 14 + RealPaste.Visuals.spectators[0].between:get() / 2
    });
    local v244 = l_mtools_0.Animation:Lerp("Spectators", "GlobalatAlpha", not v243.Alpha and ui.get_alpha() <= 0.5);
    specalpha = l_mtools_0.Animation:OldLerp(specalpha, v244, 16);
    v242.size.x = l_mtools_0.Animation:OldLerp(v242.size.x, v243.Length, 16);
end);
drawspecs = function()
    -- upvalues: l_mtools_0 (ref), v245 (ref)
    l_mtools_0.Animation:Register("Spectators");
    l_mtools_0.Animation:Update("Spectators", 7.5);
    if RealPaste.Visuals.spectators:get() then
        v245:update();
    end;
end;
local l_curtime_0 = globals.curtime;
local v247 = true;
legitaa = function(v248)
    -- upvalues: l_curtime_0 (ref), v247 (ref), v85 (ref)
    local v249 = entity.get_local_player();
    local v250 = true;
    if not v249 then
        return;
    elseif not RealPaste.AntiAim.legitaa:get() then
        return;
    else
        local l_m_iTeamNum_0 = v249.m_iTeamNum;
        for _, v253 in pairs({
            entity.get_entities("CPlantedC4"), 
            entity.get_entities("CHostage")
        }) do
            for _, v255 in pairs(v253) do
                local v256 = v249:get_origin():dist((v255:get_origin()));
                if v256 < 65 and v256 > 1 and l_m_iTeamNum_0 == 3 then
                    v250 = false;
                end;
            end;
        end;
        if l_m_iTeamNum_0 == 2 and v249.m_bInBombZone and v249:get_player_weapon():get_weapon_index() == 49 then
            v250 = false;
        end;
        if bit.band(v248.buttons, 32) == 32 and v250 then
            if globals.curtime - l_curtime_0 > 0.02 then
                v248.buttons = bit.band(v248.buttons, bit.bnot(32));
                if v247 then
                    v247 = false;
                end;
                if RealPaste.AntiAim.legitaa[0].mode:get() == "Static" then
                    v85.Pitch:override("Disabled");
                    v85.Yaw:override("Backward");
                    v85.YawBase:override(RealPaste.AntiAim.legitaa[0].base:get());
                    v85.YawAdd:override(180);
                    v85.YawModifier:override("Disabled");
                    v85.ModifierDegree:override(0);
                    v85.LeftLimit:override(50);
                    v85.RightLimit:override(50);
                    v85.FakeOptions:override({});
                    v85.FSDesync:override("Off");
                elseif RealPaste.AntiAim.legitaa[0].mode:get() == "Jitter" then
                    v85.Pitch:override("Disabled");
                    v85.Yaw:override("Backward");
                    v85.YawBase:override(RealPaste.AntiAim.legitaa[0].base:get());
                    v85.YawAdd:override(180);
                    v85.YawModifier:override("Center");
                    v85.ModifierDegree:override(30);
                    v85.LeftLimit:override(50);
                    v85.RightLimit:override(50);
                    v85.FakeOptions:override({
                        [1] = "Jitter"
                    });
                    v85.FSDesync:override("Off");
                elseif RealPaste.AntiAim.legitaa[0].mode:get() == "Custom" then
                    v85.Pitch:override("Disabled");
                    if getnum(RealPaste.AntiAim.legitaa[0].cbase) == 1 then
                        v85.YawBase:override("Local View");
                        v85.Yaw:override("Disabled");
                        v85.FreeStand:override(false);
                    elseif getnum(RealPaste.AntiAim.legitaa[0].cbase) == 2 then
                        v85.YawBase:override("Local View");
                        v85.Yaw:override("Backward");
                        v85.FreeStand:override(false);
                    elseif getnum(RealPaste.AntiAim.legitaa[0].cbase) == 3 then
                        v85.Yaw:override("Backward");
                        v85.YawBase:override("At Target");
                        v85.FreeStand:override(false);
                    elseif getnum(RealPaste.AntiAim.legitaa[0].cbase) == 4 then
                        v85.YawBase:override("Local View");
                        v85.FreeStand:override(true);
                    end;
                    v85.YawAdd:override(rage.antiaim:inverter() and RealPaste.AntiAim.legitaa[0].caddl:get() or RealPaste.AntiAim.legitaa[0].caddr:get());
                    v85.YawModifier:override(RealPaste.AntiAim.legitaa[0].cmod:get());
                    v85.ModifierDegree:override(RealPaste.AntiAim.legitaa[0].cdegr:get());
                    v85.LeftLimit:override(RealPaste.AntiAim.legitaa[0].cdesl:get());
                    v85.RightLimit:override(RealPaste.AntiAim.legitaa[0].cdesr:get());
                    v85.FakeOptions:override(RealPaste.AntiAim.legitaa[0].copt:get());
                    v85.FSDesync:override(RealPaste.AntiAim.legitaa[0].cfres:get());
                end;
            end;
        else
            if not v247 then
                v85.Pitch:override();
                v85.Yaw:override();
                v85.YawBase:override();
                v85.YawAdd:override();
                v85.YawModifier:override();
                v85.ModifierDegree:override();
                v85.BodyYaw:override();
                v85.LeftLimit:override();
                v85.RightLimit:override();
                v85.FakeOptions:override();
                v85.FSDesync:override();
                v85.FreeStand:override();
                v85.FsDisModDegr:override();
                v85.FsBdFs:override();
                v85.ExtendedDes:override();
                v85.ExtendedValue:override();
                v247 = true;
            end;
            l_curtime_0 = globals.curtime;
        end;
        return;
    end;
end;
disableChamsKnife = function()
    -- upvalues: v85 (ref)
    if not RealPaste.Visuals.chams:get() then
        v85.chams:override();
        return;
    else
        local v257 = entity.get_local_player();
        if v257 == nil or not v257:is_alive() then
            return;
        else
            local v258 = v257:get_player_weapon();
            if v258 == nil then
                return;
            else
                v85.chams:override(v258:get_classname() ~= "CKnife");
                return;
            end;
        end;
    end;
end;
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
local v260 = {
    last = nil
};
v260.set = function(v261)
    -- upvalues: v260 (ref)
    if v261 == v260.last then
        return;
    else
        common.set_clan_tag(v261);
        v260.last = v261;
        return;
    end;
end;
v260.build = function(v262)
    local v263 = {};
    for v264 = 1, #v262 do
        table.insert(v263, v262:sub(1, v264));
    end;
    for v265 = 1, #v262 do
        table.insert(v263, v262:sub(v265, #v262));
    end;
    table.insert(v263, "");
    return v263;
end;
v260.builded = v260.build("RealPaste");
v260.on_render = function()
    -- upvalues: l_find_0 (ref), v260 (ref)
    if not RealPaste.Misc.clantag:get() then
        l_find_0("Miscellaneous", "Main", "In-Game", "Clan Tag"):override();
        return;
    elseif not globals.is_connected then
        return;
    else
        local v266 = utils.net_channel();
        if not v266 then
            return;
        else
            local v267 = v266.latency[0] / globals.tickinterval;
            local v268 = globals.tickcount + v267;
            local v269 = math.floor(math.fmod(v268 / 13, #v260.builded)) + 1;
            if RealPaste.Misc.clantag:get() then
                l_find_0("Miscellaneous", "Main", "In-Game", "Clan Tag"):override(false);
                v260.set(v260.builded[v269]);
            end;
            return;
        end;
    end;
end;
v260.destroy = function()
    -- upvalues: v260 (ref)
    v260.set("");
end;
panelonmenu = function()
    -- upvalues: v56 (ref), v2 (ref), v1 (ref)
    if ui.get_alpha() < 0.5 then
        return;
    else
        local v270 = ui.get_position();
        local v271 = ui.get_size();
        local v272 = common.get_system_time();
        local v273 = string.format("%02d:%02d:%02d", v272.hours, v272.minutes, v272.seconds);
        if RealPaste.Misc.panel:get() then
            if not RealPaste.Main.optimize:get() then
                render.blur(vector(v270.x, v270.y - 50), vector(v270.x + v271.x, v270.y - 5), 1, ui.get_alpha());
            end;
            render.rect(vector(v270.x, v270.y - 50), vector(v270.x + v271.x, v270.y - 5), color(bakolor.r, bakolor.g, bakolor.b, bakolor.a * ui.get_alpha()), 5);
            if senkopasxa == true then
                render.texture(senkopngda, vector(v270.x + 18.5, v270.y - 47), vector(40, 40), color());
            else
                render.text(v56.pixel30, vector(v270.x + 18.5, v270.y - 41.5), color(colors.r, colors.g, colors.b, 255 * ui.get_alpha()), nil, "RPL");
            end;
            local l_x_9 = render.measure_text(v56.pixel30, nil, "User: ").x;
            local l_x_10 = render.measure_text(v56.pixel30, nil, "" .. v2).x;
            local l_x_11 = render.measure_text(v56.pixel30, nil, "Build: ").x;
            local l_x_12 = render.measure_text(v56.pixel30, nil, "" .. v273).x;
            render.text(v56.pixel30, vector(v270.x + 125.5, v270.y - 41.5), color(colors.r, colors.g, colors.b, 255 * ui.get_alpha()), nil, "User: ");
            render.text(v56.pixel30, vector(v270.x + 125.5 + l_x_9, v270.y - 41.5), color(colors.r, colors.g, colors.b, 255 * ui.get_alpha()), nil, "" .. v2);
            render.text(v56.pixel30, vector(v270.x + 175.5 + l_x_9 + l_x_10, v270.y - 41.5), color(colors.r, colors.g, colors.b, 255 * ui.get_alpha()), nil, "Build: ");
            render.text(v56.pixel30, vector(v270.x + 175.5 + l_x_9 + l_x_10 + l_x_11, v270.y - 41.5), color(colors.r, colors.g, colors.b, 255 * ui.get_alpha()), nil, "" .. v1);
            render.text(v56.pixel30, vector(v270.x + v271.x - 18.5 - l_x_12, v270.y - 41.5), color(colors.r, colors.g, colors.b, 255 * ui.get_alpha()), nil, "" .. v273);
        end;
        return;
    end;
end;
local v278 = {
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
local v279 = {};
local v280 = 1;
local _ = {
    inferno = "Burned", 
    hegrenade = "Naded", 
    knife = "Knifed"
};
secondlogs = function(v282)
    -- upvalues: l_mtools_0 (ref), v278 (ref), v279 (ref), v280 (ref)
    local v283 = RealPaste.Visuals.logs[0].hitclr:get();
    if l_mtools_0.Table.Find(RealPaste.Visuals.logs:get(), "Under Crosshair") ~= 0 and entity.get_local_player() == entity.get(v282.attacker, true) then
        local l_dmg_health_0 = v282.dmg_health;
        local v285 = entity.get(v282.userid, true);
        local v286 = v278[v282.hitgroup];
        local l_weapon_0 = v282.weapon;
        local _ = v282.health;
        if l_weapon_0 == "hegrenade" or l_weapon_0 == "inferno" or l_weapon_0 == "knife" then
            return;
        else
            if result == nil then
                v279[#v279 + 1] = {
                    [1] = nil, 
                    [2] = nil, 
                    [3] = 0, 
                    [1] = "\aFFFFFFC8Hit \a" .. color(v283.r, v283.g, v283.b, 255):to_hex() .. v285:get_name() .. " \aFFFFFFC8in the \a" .. color(v283.r, v283.g, v283.b, 255):to_hex() .. v286 .. " \aFFFFFFC8for \a" .. color(v283.r, v283.g, v283.b, 255):to_hex() .. l_dmg_health_0 .. " \aFFFFFFC8damage", 
                    [2] = globals.tickcount + 250
                };
            end;
            v280 = v280 == 999 and 1 or v280 + 1;
        end;
    end;
end;
seconddloges = function(v289)
    -- upvalues: l_mtools_0 (ref), v279 (ref)
    local v290 = RealPaste.Visuals.logs[0].hitclr:get();
    if l_mtools_0.Table.Find(RealPaste.Visuals.logs:get(), "Under Crosshair") ~= 0 then
        local v291 = entity.get_local_player();
        local v292 = entity.get(v289.attacker, true);
        local l_weapon_1 = v289.weapon;
        local v294 = "Hit";
        if l_weapon_1 == "hegrenade" then
            v294 = "Naded";
        end;
        if l_weapon_1 == "inferno" then
            v294 = "Burned";
        end;
        if l_weapon_1 == "knife" then
            v294 = "Knifed";
        end;
        if (l_weapon_1 == "hegrenade" or l_weapon_1 == "inferno" or l_weapon_1 == "knife") and v291 == v292 then
            local v295 = entity.get(v289.userid, true);
            v279[#v279 + 1] = {
                [1] = nil, 
                [2] = nil, 
                [3] = 0, 
                [1] = ("\aFFFFFFC8" .. v294 .. " \a" .. color(v290.r, v290.g, v290.b, 255):to_hex() .. "%s \aFFFFFFC8for \a" .. color(v290.r, v290.g, v290.b, 255):to_hex() .. "%s \aFFFFFFC8damage"):format(v295:get_name(), v289.dmg_health, v289.health), 
                [2] = globals.tickcount + 250
            };
        end;
    end;
end;
seconnnedloges = function(v296)
    -- upvalues: l_mtools_0 (ref), v278 (ref), v279 (ref), v280 (ref)
    local v297 = RealPaste.Visuals.logs[0].misclr:get();
    if l_mtools_0.Table.Find(RealPaste.Visuals.logs:get(), "Under Crosshair") ~= 0 then
        player_name = v296.target:get_name();
        damage = v296.damage;
        hitchance = v296.hitchance;
        hitgroup = v278[v296.hitgroup];
        backtrack = v296.backtrack;
        wanted_damage = v296.wanted_damage;
        hitchance = v296.hitchance;
        wanted_hitgroup = v278[v296.wanted_hitgroup];
        state = v296.state;
        local _ = "%";
        if state ~= nil then
            v279[#v279 + 1] = {
                [1] = nil, 
                [2] = nil, 
                [3] = 0, 
                [1] = "\aFFFFFFC8Missed shot in \a" .. color(v297.r, v297.g, v297.b, 255):to_hex() .. player_name .. " \aFFFFFFC8in the \a" .. color(v297.r, v297.g, v297.b, 255):to_hex() .. wanted_hitgroup .. " \aFFFFFFC8due to \a" .. color(v297.r, v297.g, v297.b, 255):to_hex() .. state .. "", 
                [2] = globals.tickcount + 250
            };
        end;
        v280 = v280 == 999 and 1 or v280 + 1;
    end;
end;
renderunderlogs = function()
    -- upvalues: v279 (ref), l_mtools_0 (ref), v0 (ref)
    if #v279 > 0 then
        if globals.tickcount >= v279[1][2] then
            if v279[1][3] > 0 then
                v279[1][3] = v279[1][3] - 20;
            elseif v279[1][3] <= 0 then
                table.remove(v279, 1);
            end;
        end;
        if #v279 > 6 then
            table.remove(v279, 1);
        end;
        if globals.is_connected == false then
            table.remove(v279, #v279);
        end;
        for v299 = 1, #v279 do
            text_size = render.measure_text(1, nil, v279[v299][1]).x;
            if v279[v299][3] < 255 then
                v279[v299][3] = v279[v299][3] + 10;
            end;
            if l_mtools_0.Table.Find(RealPaste.Visuals.logs:get(), "Under Crosshair") ~= 0 then
                render.text(1, vector(v0.x / 2 - text_size / 2 + v279[v299][3] / 35, v0.y / 1.3 + 13 * v299), color(255, 255, 255, v279[v299][3]), nil, v279[v299][1]);
            end;
        end;
    end;
end;
drawspread = function()
    -- upvalues: v0 (ref)
    if not globals.is_in_game then
        return;
    else
        local v300 = entity.get_local_player();
        if not v300:is_alive() then
            return;
        else
            local v301 = v300:get_player_weapon();
            if not v301 then
                return;
            else
                local v302 = v301:get_inaccuracy();
                local v303 = RealPaste.Visuals.spcirl[0].selectcolor:get();
                if not RealPaste.Visuals.spcirl:get() then
                    return;
                else
                    if RealPaste.Visuals.spcirl[0].theme:get() == "Flat" or RealPaste.Visuals.spcirl[0].theme.ref:get_override() == "Flat" then
                        render.circle(vector(v0.x / 2, v0.y / 2), color(v303.r, v303.g, v303.b, v303.a), v302 * 550, 0, 1);
                    elseif RealPaste.Visuals.spcirl[0].theme:get() == "Outline" and not RealPaste.Main.optimize:get() then
                        render.circle_outline(vector(v0.x / 2, v0.y / 2), color(v303.r, v303.g, v303.b, v303.a), v302 * 550, 0, 1);
                    elseif RealPaste.Visuals.spcirl[0].theme:get() == "Gradient" and not RealPaste.Main.optimize:get() then
                        if RealPaste.Visuals.spcirl[0].reverse:get() then
                            render.circle_gradient(vector(v0.x / 2, v0.y / 2), color(v303.r, v303.g, v303.b, v303.a), color(v303.r / 2, v303.g / 2, v303.b / 2, 0), v302 * 550, 0, 1);
                        else
                            render.circle_gradient(vector(v0.x / 2, v0.y / 2), color(v303.r / 2, v303.g / 2, v303.b / 2, v303.a / 2), color(v303.r, v303.g, v303.b, v303.a), v302 * 550, 0, 1);
                        end;
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
LoadImagesKillMark();
local v304 = 0;
local v305 = {};
local v306 = {};
MakeKillMark = function()
    -- upvalues: v55 (ref), v304 (ref), v306 (ref), v305 (ref), l_mtools_0 (ref), v54 (ref), v0 (ref)
    if not v55 then
        return;
    else
        if v304 == 0 and #v306 ~= 0 then
            v306 = {};
        end;
        if entity.get_local_player() == nil then
            v304 = 0;
            return;
        else
            for v307, v308 in pairs(v305) do
                if globals.curtime - v308.time > 1 then
                    v308.y = lerp(v308.y, -150, 5 * globals.frametime);
                    v308.x = lerp(v308.x, 0, 7.5 * globals.frametime);
                    if v308.x < 10 and v308.y < -80 then
                        table.remove(v305, v307);
                    end;
                else
                    v308.x = lerp(v308.x, 100 * (v307 - 1), 7.5 * globals.frametime);
                    v308.y = lerp(v308.y, 150, 10 * globals.frametime);
                end;
                if RealPaste.Visuals.killmark:get() and l_mtools_0.Table.Find(RealPaste.Visuals.killmark[0].mode:get(), "Image") ~= 0 then
                    if v308.headshot then
                        render.texture(v54.Headshot, vector(v0.x / 2 - 50 + v308.x, v0.y - v308.y), vector(100, 100), color(255, 255, 255, 255));
                    elseif v308.kill == 1 then
                        render.texture(v54["1"], vector(v0.x / 2 - 50 + v308.x, v0.y - v308.y), vector(100, 100), color(255, 255, 255, 255));
                    elseif v308.kill >= 2 then
                        if v308.kill > 6 then
                            v308.kill = 6;
                        end;
                        render.texture(v54["" .. v308.kill .. ""], vector(v0.x / 2 - 50 + v308.x, v0.y - v308.y), vector(100, 100), color(255, 255, 255, 255));
                    end;
                end;
            end;
            for v309 = 1, #v306 do
                v306[v309].x = lerp(v306[v309].x, 20 * v309, 25 * globals.frametime);
                if RealPaste.Visuals.killmark:get() and l_mtools_0.Table.Find(RealPaste.Visuals.killmark[0].mode:get(), "Image") ~= 0 then
                    if v306[v309].headshot then
                        render.texture(v54.headdown, vector(v0.x - 350 - v306[v309].x, v0.y - 65), vector(100, 100), color(255, 255, 255, 255));
                    else
                        render.texture(v54.bodydown, vector(v0.x - 350 - v306[v309].x, v0.y - 65), vector(100, 100), color(255, 255, 255, 255));
                    end;
                end;
            end;
            return;
        end;
    end;
end;
MakeKillMarkE = function(v310, v311)
    -- upvalues: l_mtools_0 (ref)
    if RealPaste.Visuals.killmark:get() and l_mtools_0.Table.Find(RealPaste.Visuals.killmark[0].mode:get(), "Sound") ~= 0 then
        if v310 then
            utils.console_exec("playvol killmarks/sound/Headshot_" .. utils.random_int(1, 3) .. ".wav " .. RealPaste.Visuals.killmark[0].volume:get() / 100);
        elseif v311 >= 2 then
            if v311 > 5 then
                v311 = 5;
            end;
            utils.console_exec("playvol killmarks/sound/MultiKill_" .. v311 .. "" .. utils.random_int(1, 3) .. ".wav " .. RealPaste.Visuals.killmark[0].volume:get() / 100);
        end;
    end;
end;
UpdateWindowsNL = function()
    -- upvalues: l_find_0 (ref)
    local v312 = l_find_0("Miscellaneous", "Main", "Other", "Windows");
    local v313 = v312:get();
    if RealPaste.Visuals.watermark:get() then
        table.remove(v313, FindIndex(v313, "Watermark"));
    end;
    if RealPaste.Visuals.keybinds:get() then
        table.remove(v313, FindIndex(v313, "Hotkeys"));
    end;
    if RealPaste.Visuals.spectators:get() then
        table.remove(v313, FindIndex(v313, "Spectators"));
    end;
    v312:override(v313);
end;
adaptepx = function()
    -- upvalues: l_mtools_0 (ref), l_find_0 (ref)
    if not globals.is_in_game then
        return;
    elseif not entity.get_local_player():is_alive() then
        return;
    else
        local v314 = l_mtools_0.AntiAims.Condition:Get({
            [1] = "S", 
            [2] = "W", 
            [3] = "SW", 
            [4] = "C", 
            [5] = "A", 
            [6] = "AC"
        });
        local v315 = v314 == "S";
        local v316 = v314 == "W";
        local v317 = v314 == "SW";
        local v318 = v314 == "C";
        local v319 = v314 == "A";
        local v320 = v314 == "AC";
        local v321 = l_mtools_0.Table.Find(RealPaste.Rage.adaptiveexp[0].cond:get(), "Standing") ~= 0 and v315;
        local v322 = l_mtools_0.Table.Find(RealPaste.Rage.adaptiveexp[0].cond:get(), "Moving") ~= 0 and v316;
        local v323 = l_mtools_0.Table.Find(RealPaste.Rage.adaptiveexp[0].cond:get(), "Slow walking") ~= 0 and v317;
        local v324 = l_mtools_0.Table.Find(RealPaste.Rage.adaptiveexp[0].cond:get(), "Crouching") ~= 0 and v318;
        local v325 = l_mtools_0.Table.Find(RealPaste.Rage.adaptiveexp[0].cond:get(), "Air") ~= 0 and v319;
        local v326 = l_mtools_0.Table.Find(RealPaste.Rage.adaptiveexp[0].cond:get(), "Air-Crouch") ~= 0 and v320;
        l_mtools_0.AntiAims.Condition:Update();
        if RealPaste.Rage.adaptiveexp:get() then
            if v321 or v322 or v323 or v324 or v325 or v326 then
                l_find_0("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override("Break LC");
                l_find_0("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Always On");
            else
                l_find_0("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override();
                l_find_0("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override();
            end;
        else
            l_find_0("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override();
            l_find_0("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override();
        end;
        return;
    end;
end;
local v328 = l_system_0.register({
    [1] = RealPaste.Main.dogonscreen[0].X, 
    [2] = RealPaste.Main.dogonscreen[0].Y
}, vector(100, 125), "Dogus", function(v327)
    v327:on_config_load();
    if RealPaste.Main.dogonscreen:get() then
        if RealPaste.Main.dogonscreen[0].dogstyle:get() == "Elite" then
            render.texture(dog, vector(v327.position.x, v327.position.y - 12), color(255, 255, 255, 255));
        else
            render.texture(typdog, vector(v327.position.x, v327.position.y + 23), vector(100, 100), color(255, 255, 255, 255));
        end;
    end;
    render.rect_outline(vector(v327.position.x, v327.position.y), vector(v327.position.x + v327.size.x, v327.position.y + v327.size.y), color(255, 255, 255, 255 * ui.get_alpha()));
end);
fundogus = function()
    -- upvalues: v328 (ref)
    if RealPaste.Main.dogonscreen:get() then
        v328:update();
    end;
end;
local v329 = {
    ETime = 0, 
    GTicks = 0
};
MakeHook = function(_)
    -- upvalues: l_mtools_0 (ref), l_hook_0 (ref), l_lambotruck_0 (ref), v329 (ref), l_find_0 (ref)
    local v331 = entity.get_local_player();
    if v331 == nil then
        return;
    else
        local v332 = v331[0];
        if v332 == nil then
            return;
        else
            local l_Dev_3 = l_mtools_0.AntiAims.Condition:GetDev("Air");
            local l_Dev_4 = l_mtools_0.AntiAims.Condition:GetDev("Walk");
            l_hook_0.call = function()
                -- upvalues: l_lambotruck_0 (ref), l_mtools_0 (ref), l_Dev_3 (ref), v329 (ref), v331 (ref), v332 (ref), l_find_0 (ref), l_Dev_4 (ref)
                pcall(function()
                    -- upvalues: l_lambotruck_0 (ref), l_mtools_0 (ref), l_Dev_3 (ref), v329 (ref), v331 (ref), v332 (ref), l_find_0 (ref), l_Dev_4 (ref)
                    l_lambotruck_0.animation.active(l_mtools_0.Table.Find(RealPaste.AntiAim.abrik:get(), "Disable Move Lean") ~= 0);
                    if l_mtools_0.Table.Find(RealPaste.AntiAim.abrik:get(), "Pitch 0 on Land") ~= 0 then
                        if not l_Dev_3 then
                            v329.GTicks = v329.GTicks + 1;
                        else
                            v329.GTicks = 0;
                            v329.ETime = globals.curtime + 1;
                        end;
                        if not l_Dev_3 and v329.GTicks > 1 and v329.ETime > globals.curtime then
                            v331.m_flPoseParameter[12] = 0.5;
                        end;
                    end;
                    if l_mtools_0.Table.Find(RealPaste.AntiAim.abrik:get(), "Disable Move Lean") ~= 0 then
                        local v335 = l_lambotruck_0.animation.overlay(v332, 12);
                        v335.m_flWeight = v335.m_flWeight * 0.06666666666666667;
                    end;
                    l_find_0("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override();
                    if (v331.m_vecVelocity * vector(1, 1, 0)):length() > 3 and l_mtools_0.Table.Find(RealPaste.AntiAim.abrik:get(), "Legs") ~= 0 then
                        local v336 = l_lambotruck_0.animation.overlay(v332, 6);
                        if l_Dev_4 then
                            if RealPaste.AntiAim.abrik[0].wmode:get() == "Dog" then
                                v331.m_flPoseParameter[7] = 1;
                                l_find_0("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Walking");
                            elseif RealPaste.AntiAim.abrik[0].wmode:get() == "Static" then
                                v331.m_flPoseParameter[0] = 1;
                                l_find_0("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Sliding");
                            end;
                        end;
                        if l_Dev_3 then
                            if RealPaste.AntiAim.abrik[0].amode:get() == "Dog" then
                                v336.m_flWeight = 1;
                                l_find_0("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Walking");
                            elseif RealPaste.AntiAim.abrik[0].amode:get() == "Static" then
                                v331.m_flPoseParameter[6] = 1;
                            end;
                        end;
                    else
                        l_find_0("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override();
                    end;
                end);
            end;
            return;
        end;
    end;
end;
local function v339(v337, v338)
    return math.sqrt((v338.x - v337.x) ^ 2 + (v338.y - v337.y) ^ 2);
end;
local function v343(v340, v341, v342)
    return vector((v341.x - v340.x) * v342 + v340.x, (v341.y - v340.y) * v342 + v340.y, (v341.z - v340.z) * v342 + v340.z);
end;
lept = 0;
lept2 = 0;
drawgrenrad = function()
    -- upvalues: l_mtools_0 (ref), v339 (ref), v343 (ref)
    if not RealPaste.Visuals.grenrad:get() then
        return;
    else
        if l_mtools_0.Table.Find(RealPaste.Visuals.grenrad[0].select:get(), "Smoke") ~= 0 then
            local v344 = entity.get_entities("CSmokeGrenadeProjectile");
            for v345 = 1, #v344 do
                local v346 = v344[v345];
                lept = lerp(lept, v346.m_bDidSmokeEffect == true and 1 or 0, 6.666666666666667 * globals.frametime);
                print(lept);
                if v346.m_bDidSmokeEffect == true then
                    for v347 = 1, 1 do
                        if RealPaste.Visuals.grenrad[0].mode:get() == "Default" or RealPaste.Visuals.grenrad[0].mode.ref:get_override() == "Default" then
                            render.circle_3d(v346:get_origin(), RealPaste.Visuals.grenrad[0].scolor:get(), (125 - 0.05 * v347) * lept, 0, 1, 1);
                        elseif RealPaste.Visuals.grenrad[0].mode:get() == "Outline" and not RealPaste.Main.optimize:get() then
                            render.circle_3d_outline(v346:get_origin(), RealPaste.Visuals.grenrad[0].scolor:get(), (125 - 0.05 * v347) * lept, 0, 1, 1);
                        elseif RealPaste.Visuals.grenrad[0].mode:get() == "Gradient" and not RealPaste.Main.optimize:get() then
                            if not RealPaste.Visuals.grenrad[0].reverse:get() then
                                render.circle_3d_gradient(v346:get_origin(), RealPaste.Visuals.grenrad[0].scolor:get() / 4, RealPaste.Visuals.grenrad[0].scolor:get():alpha_modulate(lept), 125 - 0.05 * v347 * lept, 0, 1, 1);
                            else
                                render.circle_3d_gradient(v346:get_origin(), RealPaste.Visuals.grenrad[0].scolor:get(), color(0, 0, 0, 0), 125 - 0.05 * v347 * lept, 0, 1, 1);
                            end;
                        end;
                    end;
                end;
            end;
        end;
        if l_mtools_0.Table.Find(RealPaste.Visuals.grenrad[0].select:get(), "Molotov") ~= 0 then
            local v348 = entity.get_entities("CInferno");
            for v349 = 1, #v348 do
                local v350 = v348[v349];
                local v351 = v350:get_origin();
                local v352 = 40;
                local _ = 0;
                local v354 = {};
                local v355 = 0;
                local v356 = nil;
                local v357 = nil;
                for v358 = 1, 64 do
                    lept2 = l_mtools_0.Animation:OldLerp(lept2, v350.m_fireCount > 0 and 1 or 0, 16);
                    if v350.m_bFireIsBurning[v358] == true then
                        table.insert(v354, vector(v350.m_fireXDelta[v358], v350.m_fireYDelta[v358], v350.m_fireZDelta[v358]));
                    end;
                end;
                for v359 = 1, #v354 do
                    for v360 = 1, #v354 do
                        local v361 = v339(v354[v359], v354[v360]);
                        if v355 < v361 then
                            v355 = v361;
                            v356 = v354[v359];
                            v357 = v354[v360];
                        end;
                    end;
                end;
                if v356 ~= nil and v357 ~= nil then
                    local v362 = v351 + v343(v356, v357, 0.5);
                    for v363 = 1, 1 do
                        if RealPaste.Visuals.grenrad[0].mode:get() == "Default" or RealPaste.Visuals.grenrad[0].mode.ref:get_override() == "Default" then
                            render.circle_3d(v362, RealPaste.Visuals.grenrad[0].mcolor:get(), v355 / 2 + v352 - 0.05 * v363, 0, 1, 1);
                        elseif RealPaste.Visuals.grenrad[0].mode:get() == "Outline" and not RealPaste.Main.optimize:get() then
                            render.circle_3d_outline(v362, RealPaste.Visuals.grenrad[0].mcolor:get(), (v355 / 2 + v352 - 0.05 * v363) * lept2, 0, 1, 1);
                        elseif RealPaste.Visuals.grenrad[0].mode:get() == "Gradient" and not RealPaste.Main.optimize:get() then
                            if not RealPaste.Visuals.grenrad[0].reverse:get() then
                                render.circle_3d_gradient(v362, RealPaste.Visuals.grenrad[0].mcolor:get() / 4, RealPaste.Visuals.grenrad[0].mcolor:get(), v355 / 2 + v352 - 0.05 * v363, 0, 1, 1);
                            else
                                render.circle_3d_gradient(v362, RealPaste.Visuals.grenrad[0].mcolor:get(), color(0, 0, 0, 0), v355 / 2 + v352 - 0.05 * v363, 0, 1, 1);
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
local l_cl_ragdoll_physics_enable_0 = cvar.cl_ragdoll_physics_enable;
local l_int_0 = cvar.cl_ragdoll_physics_enable.int;
local _ = math.floor(globals.realtime);
shitmoment = function()
    -- upvalues: l_mtools_0 (ref), v0 (ref), v56 (ref), l_int_0 (ref), l_cl_ragdoll_physics_enable_0 (ref)
    if l_mtools_0.Table.Find(RealPaste.Visuals.shit:get(), "Disable Panorama Blur") ~= 0 then
        cvar["@panorama_disable_blur"]:int(1);
    else
        cvar["@panorama_disable_blur"]:int(0);
    end;
    if l_mtools_0.Table.Find(RealPaste.Visuals.shit:get(), "Skeet Line") ~= 0 then
        local v367 = color(0, 255, 0);
        local v368 = color(130, 0, 150);
        render.gradient(vector(0, 0), vector(v0.x, 2), v367, v368, v367, v368);
    end;
    if l_mtools_0.Table.Find(RealPaste.Visuals.shit:get(), "Custom HUD") ~= 0 then
        if not globals.is_in_game then
            return;
        else
            local v369 = entity.get_local_player();
            if v369 == nil then
                return;
            else
                local v370 = RealPaste.Visuals.shit[0].cuscol:get();
                local l_cl_draw_only_deathnotices_0 = cvar.cl_draw_only_deathnotices;
                local l_m_iHealth_0 = v369.m_iHealth;
                local l_m_ArmorValue_0 = v369.m_ArmorValue;
                local v374 = v369:get_player_weapon();
                if v374 == nil then
                    return;
                else
                    local _ = v369:get_player_weapon(true);
                    local l_m_iClip1_0 = v374.m_iClip1;
                    local l_m_iPrimaryReserveAmmoCount_0 = v374.m_iPrimaryReserveAmmoCount;
                    local v378, _ = tostring(v369:get_player_weapon():get_weapon_icon()):gsub("texture", ""):gsub("%(", ""):gsub("%)", ""):gsub("x", "    ");
                    local v380 = vector(tonumber(l_mtools_0.String.Trim(l_mtools_0.String.Cut(v378, -5))), tonumber(l_mtools_0.String.Trim(l_mtools_0.String.Cut(v378, 5))));
                    local _ = v374:get_classname();
                    local l_x_13 = render.measure_text(v56.pixel35, "c", "RPL").x;
                    local l_x_14 = render.measure_text(v56.pixel35, "c", " HP:" .. l_m_iHealth_0).x;
                    local l_x_15 = render.measure_text(v56.pixel35, "c", " Armor:" .. l_m_ArmorValue_0).x;
                    local l_y_2 = render.measure_text(v56.pixel35, "c", " Ammo " .. l_m_iClip1_0 .. ":" .. l_m_iPrimaryReserveAmmoCount_0).y;
                    l_cl_draw_only_deathnotices_0:int(1);
                    if senkopasxa == true then
                        render.texture(senkopngda, vector(v0.x * 0.02, v0.y * 0.9), vector(100, 100), color());
                    else
                        render.text(v56.pixel35, vector(v0.x * 0.05, v0.y * 0.96), color(v370.r, v370.g, v370.b, 255), "c", "RPL");
                    end;
                    render.text(v56.pixel35, vector(v0.x * 0.09 + l_x_13, v0.y * 0.96), color(v370.r, v370.g, v370.b, 255), "c", " HP:" .. l_m_iHealth_0);
                    render.text(v56.pixel35, vector(v0.x * 0.09 + l_x_13 + l_x_14 + l_x_15 / 4, v0.y * 0.96), color(v370.r, v370.g, v370.b, 255), "c", " Armor:" .. l_m_ArmorValue_0);
                    if l_m_iClip1_0 >= 0 then
                        render.text(v56.pixel35, vector(v0.x * 0.9, v0.y * 0.96), color(v370.r, v370.g, v370.b, 255), "c", " Ammo " .. l_m_iClip1_0 .. ":" .. l_m_iPrimaryReserveAmmoCount_0);
                    end;
                    render.texture(v374:get_weapon_icon(), vector(v0.x * 0.87, v0.y * 0.96 - l_y_2 * 2), v380 * 2.01, color(0, 0, 0, 255));
                    render.texture(v374:get_weapon_icon(), vector(v0.x * 0.87, v0.y * 0.96 - l_y_2 * 2), v380 * 2, color(v370.r, v370.g, v370.b, 255));
                end;
            end;
        end;
    else
        cvar.cl_draw_only_deathnotices:int(0);
    end;
    if (l_mtools_0.Table.Find(RealPaste.Visuals.shit:get(), "Thanos Snap") ~= 0 and 0 or 1) ~= l_int_0(l_cl_ragdoll_physics_enable_0) then
        l_int_0(l_cl_ragdoll_physics_enable_0, l_mtools_0.Table.Find(RealPaste.Visuals.shit:get(), "Thanos Snap") ~= 0 and 0 or 1);
    end;
end;
local v386 = 0;
local v390 = l_system_0.register({
    [1] = RealPaste.Visuals.velocity[0].X, 
    [2] = RealPaste.Visuals.velocity[0].Y
}, vector(140, 50), "Warning", function(v387)
    -- upvalues: v386 (ref), l_mtools_0 (ref), v56 (ref)
    v387:on_config_load();
    local v388 = entity.get_local_player();
    if v388 == nil then
        return;
    else
        local v389 = RealPaste.Visuals.velocity[0].velcol:get();
        m_flVelocityModifier = ui.get_alpha() > 0 and v388.m_flVelocityModifier == 1 and 1 - ui.get_alpha() / 2 or v388:is_alive() and v388.m_flVelocityModifier or 1;
        v386 = l_mtools_0.Animation:OldLerp(v386, RealPaste.Visuals.velocity:get() and m_flVelocityModifier ~= 1 and 1 or 0, 16);
        if RealPaste.Visuals.velocity[0].theme:get() == "Default" then
            render.text(1, vector(v387.position.x + v387.size.x / 2, v387.position.y - 40 + v387.size.y), color(255, 255, 255, 255 * v386), "c", "Velocity");
            render.rect(vector(v387.position.x + 1 * v386, v387.position.y + v387.size.y / 2), vector(v387.position.x + 140 * v386, v387.position.y + v387.size.y / 2), color(v389.r, v389.g, v389.b, 255 * v386));
            if RealPaste.Visuals.velocity[0].glow:get() and not RealPaste.Main.optimize:get() then
                render.shadow(vector(v387.position.x + 1 * v386, v387.position.y + v387.size.y / 2), vector(v387.position.x + 140 * v386, v387.position.y + v387.size.y / 2), color(v389.r, v389.g, v389.b, 255 * v386), 20);
            end;
        elseif senkopasxa == true then
            render.texture(senkopngda, vector(v387.position.x + v387.size.x / 4 - 25, v387.position.y + v387.size.y / 4 - 40), vector(100, 100), color(255, 255, 255, 255 * v386));
        else
            render.text(v56.pixel35, vector(v387.position.x + v387.size.x / 1.9, v387.position.y + v387.size.y / 1.7), color(v389.r, v389.g, v389.b, 255 * v386), "c", "Velocity");
        end;
        return;
    end;
end);
warning = function()
    -- upvalues: v390 (ref)
    if RealPaste.Visuals.velocity:get() then
        v390:update();
    end;
end;
drawunmuten = function()
    local l_ToggleMute_0 = panorama.FriendsListAPI.ToggleMute;
    local l_IsSelectedPlayerMuted_0 = panorama.FriendsListAPI.IsSelectedPlayerMuted;
    local _ = entity.get_local_player();
    if not RealPaste.Misc.anmut:get() then
        return;
    else
        local _ = entity.get_players(RealPaste.Misc.anmut[0].enemy:get(), true, function(v394)
            -- upvalues: l_IsSelectedPlayerMuted_0 (ref), l_ToggleMute_0 (ref)
            local l_steamid64_0 = v394:get_player_info().steamid64;
            local v396 = l_IsSelectedPlayerMuted_0(l_steamid64_0);
            if RealPaste.Misc.anmut[0].mode:get() == "Unmute" and v396 then
                l_ToggleMute_0(l_steamid64_0);
            elseif RealPaste.Misc.anmut[0].mode:get() == "Mute" and not v396 then
                l_ToggleMute_0(l_steamid64_0);
            end;
        end);
        return;
    end;
end;
fallad = function(v398)
    -- upvalues: l_mtools_0 (ref)
    if l_mtools_0.Table.Find(RealPaste.AntiAim.tweek:get(), "Fast Ladder") == 0 then
        return;
    elseif entity.get_local_player().m_MoveType ~= 9 then
        return;
    else
        if v398.sidemove == 0 then
            v398.view_angles.y = v398.view_angles.y + 45;
        end;
        if v398.in_forward and v398.sidemove < 0 then
            v398.view_angles.y = v398.view_angles.y + 90;
        end;
        if v398.in_back and v398.sidemove > 0 then
            v398.view_angles.y = v398.view_angles.y + 90;
        end;
        v398.in_moveleft = v398.in_back;
        v398.in_moveright = v398.in_forward;
        if v398.view_angles.x < 0 then
            v398.view_angles.x = -45;
        end;
        return;
    end;
end;
is_edging1 = false;
angle1 = 0;
vecTraceStart1 = vector(0, 0, 0);
edyaymom = function(v399)
    -- upvalues: l_mtools_0 (ref)
    l_mtools_0.AntiAims.Condition:Update();
    local v400 = l_mtools_0.AntiAims.Condition:Get({
        [1] = "S", 
        [2] = "W", 
        [3] = "SW", 
        [4] = "C", 
        [5] = "A", 
        [6] = "AC"
    });
    local v401 = v400 == "A";
    local v402 = v400 == "AC";
    is_edging1 = false;
    if v401 or v402 then
        return;
    elseif l_mtools_0.Table.Find(RealPaste.AntiAim.tweek:get(), "Edge Yaw") == 0 then
        return;
    else
        local v403 = entity.get_local_player();
        if v399.send_packet then
            vecTraceStart1 = v403:get_eye_position();
        end;
        local v404 = {};
        local v405 = render.camera_angles();
        local v406 = {};
        for v407 = 18, 360, 18 do
            v407 = math.normalize_yaw(v407);
            local v408 = vecTraceStart1 + vector():angles(0, v407) * 198;
            local v409 = utils.trace_line(vecTraceStart1, v408, v403, 1174421507);
            table.insert(v406, vecTraceStart1:dist(v409.end_pos));
            local l_fraction_0 = v409.fraction;
            local l_entity_0 = v409.entity;
            if l_entity_0 and l_entity_0:get_classname() == "CWorld" and l_fraction_0 < 0.3 then
                v404[#v404 + 1] = {
                    vecTraceEnd = v408, 
                    flYaw = v407
                };
            end;
        end;
        table.sort(v406);
        if v406[1] > 30 then
            return;
        else
            table.sort(v404, function(v412, v413)
                return v412.flYaw < v413.flYaw;
            end);
            table.remove(v404, #v404);
            local v414 = nil;
            if #v404 >= 3 then
                local v415 = v404[1].vecTraceEnd:lerp(v404[#v404].vecTraceEnd, 0.5);
                v414 = (vecTraceStart1 - v415):angles();
            end;
            if v414 then
                local l_y_3 = v405.y;
                local l_y_4 = v414.y;
                local v418 = math.normalize_yaw(l_y_4 - l_y_3);
                if math.abs(v418) < 90 then
                    v418 = 0;
                    l_y_3 = math.normalize_yaw(l_y_4 + 180);
                end;
                local v419 = -l_y_3;
                angle1 = math.normalize_yaw(v419 + l_y_4 + v418 + 180);
                is_edging1 = true;
            end;
            return;
        end;
    end;
end;
local v420 = "https://nopublic.myarena.site/dwnfilesnl/rplscoretrial.png";
local v421 = "https://nopublic.myarena.site/dwnfilesnl/rplscore.png";
local v422 = "https://nopublic.myarena.site/dwnfilesnl/rplscorealpha.png";
local v423 = "https://nopublic.myarena.site/dwnfilesnl/rplscoredebug.png";
local function v425()
    -- upvalues: v1 (ref), v5 (ref)
    events.voice_message:call(function(v424)
        -- upvalues: v1 (ref), v5 (ref)
        if v1 == "Trial" then
            v424:write_bits(26214, 128);
        elseif v1 == "Stable" then
            v424:write_bits(38241, 128);
        elseif v1 == "Alpha" then
            v424:write_bits(22400, 128);
        elseif v1 == "Debug" then
            v424:write_bits(34151, 128);
        end;
        v424:crypt(v5);
    end);
end;
local function v429()
    -- upvalues: v5 (ref)
    local v426 = entity.get_local_player();
    if v426 == nil then
        return;
    else
        v426:set_icon();
        events.voice_message:call(function(v427)
            -- upvalues: v5 (ref)
            v427:write_bits(18439, 128);
            v427:crypt(v5);
        end);
        entity.get_players(false, true, function(v428)
            v428:set_icon();
        end);
        return;
    end;
end;
local function v432()
    -- upvalues: v1 (ref), v421 (ref), v422 (ref), v423 (ref), v420 (ref), v5 (ref)
    local v430 = entity.get_local_player();
    if v430 == nil then
        return;
    else
        utils.execute_after(0.5, function()
            -- upvalues: v1 (ref), v430 (ref), v421 (ref), v422 (ref), v423 (ref), v420 (ref)
            if v1 == "Stable" then
                v430:set_icon(v421);
            elseif v1 == "Alpha" then
                v430:set_icon(v422);
            elseif v1 == "Debug" then
                v430:set_icon(v423);
            elseif v1 == "Trial" then
                v430:set_icon(v420);
            end;
        end);
        events.voice_message:call(function(v431)
            -- upvalues: v1 (ref), v5 (ref)
            if v1 == "Stable" then
                v431:write_bits(38241, 128);
            elseif v1 == "Alpha" then
                v431:write_bits(22400, 128);
            elseif v1 == "Debug" then
                v431:write_bits(34151, 128);
            elseif v1 == "Trial" then
                v431:write_bits(26214, 128);
            end;
            v431:crypt(v5);
        end);
        return;
    end;
end;
events.voice_message(function(v433)
    -- upvalues: v5 (ref), v425 (ref), v421 (ref), v422 (ref), v423 (ref), v420 (ref)
    if RealPaste.Misc.shared:get() then
        local l_buffer_0 = v433.buffer;
        local v435 = entity.get_local_player();
        if v435 == nil then
            return;
        elseif v433.entity == v435 then
            return;
        else
            l_buffer_0:crypt(v5);
            local v436 = l_buffer_0:read_bits(128);
            if v433.entity == nil then
                return;
            elseif v433.entity:is_bot() then
                return;
            elseif v436 == 18439 then
                v433.entity:set_icon();
            elseif v436 == 38241 then
                utils.execute_after(0.3, v425);
                v433.entity:set_icon(v421);
            elseif v436 == 22400 then
                utils.execute_after(0.3, v425);
                v433.entity:set_icon(v422);
            elseif v436 == 34151 then
                utils.execute_after(0.3, v425);
                v433.entity:set_icon(v423);
            elseif v436 == 26214 then
                utils.execute_after(0.3, v425);
                v433.entity:set_icon(v420);
            end;
        end;
    end;
end);
RealPaste.Misc.shared.ref:set_callback(function(v437)
    -- upvalues: v425 (ref), v432 (ref), v429 (ref)
    if v437:get() then
        utils.execute_after(0.1, v425);
        utils.execute_after(0.5, v432);
    end;
    if not v437:get() then
        v429();
    end;
end, true);
Config = function(v438, v439, v440)
    -- upvalues: l_minterface_0 (ref)
    if v438 == "Save" then
        if l_minterface_0.CSave(scripttextpasxa, RealPaste, {
            [1] = "Main", 
            [2] = "Rage", 
            [3] = "AntiAim", 
            [4] = "Visuals", 
            [5] = "Misc"
        }, false, v440) == "Yes" then
            common.add_notify(scripttextpasxa, "Config copyied!");
        else
            common.add_notify(scripttextpasxa, "Error");
        end;
    elseif v438 == "Save AA" then
        if l_minterface_0.CSave(scripttextpasxa, RealPaste, {
            [1] = "AntiAim"
        }, false, v440) == "Yes" then
            common.add_notify(scripttextpasxa, "Config copyied!");
        else
            common.add_notify(scripttextpasxa, "Error");
        end;
    elseif v438 == "Load" then
        if l_minterface_0.CLoad(RealPaste, v439, v440) == "Yes" then
            common.add_notify(scripttextpasxa, "Config loaded!");
        else
            common.add_notify(scripttextpasxa, "Error");
        end;
    end;
end;
disaasutdon = function()
    -- upvalues: v85 (ref)
    v85.Yaw:override();
    v85.YawBase:override();
    v85.YawAdd:override();
    v85.YawModifier:override();
    v85.ModifierDegree:override();
    v85.BodyYaw:override();
    v85.LeftLimit:override();
    v85.RightLimit:override();
    v85.FakeOptions:override();
    v85.FSDesync:override();
    v85.FreeStand:override();
    v85.FsDisModDegr:override();
    v85.FsBdFs:override();
end;
menureturnshitdn = function()
    -- upvalues: l_find_0 (ref), v260 (ref), v85 (ref)
    l_find_0("Aimbot", "Ragebot", "Main", "Enabled", "Extended Backtrack"):override();
    v260.destroy();
    l_find_0("Aimbot", "Ragebot", "Selection", "Min. Damage"):override();
    l_find_0("Aimbot", "Ragebot", "Safety", "Body Aim"):override();
    l_find_0("Aimbot", "Ragebot", "Selection", "Hit Chance"):override();
    l_find_0("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override();
    l_find_0("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override();
    l_find_0("Miscellaneous", "Main", "Other", "Windows"):override();
    l_find_0("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override();
    l_find_0("Aimbot", "Anti Aim", "Angles", "Enabled"):override();
    v85.AP:override();
    v85.FreeStand:override();
    v85.DT:override();
    v85.removescope:override();
    v85.chams:override();
end;
cvarshitdn = function()
    -- upvalues: v57 (ref)
    cvar.cl_draw_only_deathnotices:int(0);
    v57.aspectratio:float(0);
    cvar.cl_ragdoll_physics_enable:int(1);
    v57.view_fov:int(oldfov);
    v57.view_off_x:float(oldofx);
    v57.view_off_y:float(oldofy);
    v57.view_off_z:float(oldofz);
    v57.bob_low:int(oldbob);
    v57.bob_lat:float(oldlat);
    v57.bob_vert:float(oldvert);
    v57.bobcyc:float(olddcycl);
    v57.view_shift_l:float(oldleft);
    v57.view_shift_r:float(oldright);
    v57.view_rec:float(oldrec);
    cvar["@panorama_disable_blur"]:int(0);
end;
events.shutdown:set(function()
    -- upvalues: v429 (ref)
    disaasutdon();
    menureturnshitdn();
    cvarshitdn();
    v429();
end);
RealPaste.Misc.clantag.ref:set_callback(v260.destroy);
events.createmove:set(function(v441)
    -- upvalues: v137 (ref), v329 (ref)
    pcall(function()
        -- upvalues: v441 (ref)
        MakeHook(v441);
    end);
    v137(v441);
    makeAA(v441);
    legitaa(v441);
    fallad(v441);
    edyaymom(v441);
    if entity.get_local_player() == nil then
        v329 = {
            ETime = 0, 
            GTicks = 0
        };
        return;
    else
        return;
    end;
end);
renderererervis = function()
    fundogus();
    drawmark();
    drawpanel();
    drawbinds();
    drawspecs();
    drawdmg();
    warning();
    disableChamsKnife();
    drawspread();
    indicators();
    drawcustom();
    drawarrow();
    MakeKillMark();
    shitmoment();
    renderunderlogs();
    drawgrenrad();
end;
events.render:set(function()
    -- upvalues: v260 (ref), v4 (ref), v3 (ref), l_mtools_0 (ref), l_find_0 (ref)
    mencolor();
    sidebar();
    UpdateWindowsNL();
    renderererervis();
    customhitchance();
    adaptepx();
    idealpeek();
    menuvis();
    v260.on_render();
    Fix();
    panelonmenu();
    aspectratio();
    viewmodel();
    if senkopasxa == true then
        scripttextpasxa = v4;
    else
        scripttextpasxa = v3;
    end;
    if l_mtools_0.Table.Find(RealPaste.Visuals.logs:get(), "Under Crosshair") ~= 0 or l_mtools_0.Table.Find(RealPaste.Visuals.logs:get(), "Top Left") ~= 0 or l_mtools_0.Table.Find(RealPaste.Visuals.logs:get(), "In Console") ~= 0 then
        l_find_0("Miscellaneous", "Main", "Other", "Log Events"):override({});
    else
        l_find_0("Miscellaneous", "Main", "Other", "Log Events"):override();
    end;
end);
firstlogs = function(v442)
    -- upvalues: v0 (ref), v278 (ref), l_mtools_0 (ref)
    local _ = v0.x / 2;
    local _ = v0.y / 2;
    local _ = entity.get_local_player();
    local v446 = entity.get(v442.target);
    local _ = v442.damage;
    local l_wanted_damage_0 = v442.wanted_damage;
    local v449 = v278[v442.wanted_hitgroup];
    local l_hitchance_0 = v442.hitchance;
    local l_state_0 = v442.state;
    local l_backtrack_0 = v442.backtrack;
    if not v446 then
        return;
    elseif v446 == nil then
        return;
    else
        local l_m_iHealth_1 = v446.m_iHealth;
        local v454 = v278[v442.hitgroup];
        if l_mtools_0.Table.Find(RealPaste.Visuals.logs:get(), "In Console") ~= 0 then
            if l_state_0 == nil then
                print_raw(("\a" .. ConsoleColor(color(colors.r, colors.g, colors.b)) .. "FF[" .. scripttextpasxa .. "] \aA0FB87FF(+) \aD5D5D5FFRegistered shot at %s's %s for %d(" .. string.format("%.f", l_wanted_damage_0) .. ") damage (hp: " .. l_m_iHealth_1 .. ") (aimed: " .. v449 .. ") (bt: %s)"):format(v446:get_name(), v454, v442.damage, l_backtrack_0));
            else
                print_raw(("\a" .. ConsoleColor(color(colors.r, colors.g, colors.b)) .. "FF[" .. scripttextpasxa .. "] \aF96D6DFF(-) \aD5D5D5FFMissed shot in %s in the %s due to " .. l_state_0 .. " (hc: " .. string.format("%.f", l_hitchance_0) .. ") (damage: " .. string.format("%.f", l_wanted_damage_0) .. ")"):format(v446:get_name(), v449, state1));
            end;
        end;
        if l_mtools_0.Table.Find(RealPaste.Visuals.logs:get(), "Top Left") ~= 0 then
            if l_state_0 == nil then
                print_dev(("Registered shot at %s's %s for %d damage"):format(v446:get_name(), v454, v442.damage));
            else
                print_dev(("Missed shot in %s due to " .. l_state_0 .. ""):format(v446:get_name(), state1));
            end;
        end;
        return;
    end;
end;
firstlogst = function(v455)
    -- upvalues: l_mtools_0 (ref)
    local v456 = entity.get_local_player();
    local v457 = entity.get(v455.attacker, true);
    local l_weapon_2 = v455.weapon;
    local v459 = "Hit";
    if l_weapon_2 == "hegrenade" or l_weapon_2 == "inferno" then
        v459 = "Naded";
    end;
    if l_weapon_2 == "knife" then
        v459 = "Knifed";
    end;
    if (l_weapon_2 == "hegrenade" or l_weapon_2 == "inferno" or l_weapon_2 == "knife") and v456 == v457 then
        local v460 = entity.get(v455.userid, true);
        if l_mtools_0.Table.Find(RealPaste.Visuals.logs:get(), "In Console") ~= 0 then
            print_raw(("\a" .. ConsoleColor(color(colors.r, colors.g, colors.b)) .. "FF[" .. scripttextpasxa .. "] " .. "\aDEFAULT" .. v459 .. " %s for %d damage (%d health remaining)"):format(v460:get_name(), v455.dmg_health, v455.health));
        end;
        if l_mtools_0.Table.Find(RealPaste.Visuals.logs:get(), "Top Left") ~= 0 then
            print_dev(("" .. v459 .. " %s for %d damage (%d health remaining)"):format(v460:get_name(), v455.dmg_health, v455.health));
        end;
    end;
end;
events.round_start:set(function()
    -- upvalues: v304 (ref)
    v304 = 0;
    drawunmuten();
    if not RealPaste.Misc.shared:get() then
        local v461 = entity.get_local_player();
        if v461 == nil then
            return;
        else
            v461:set_icon();
        end;
    end;
end);
events.round_end:set(function()
    if not RealPaste.Misc.shared:get() then
        local v462 = entity.get_local_player();
        if v462 == nil then
            return;
        else
            v462:set_icon();
        end;
    end;
end);
events.aim_ack:set(function(v463)
    firstlogs(v463);
    seconnnedloges(v463);
end);
events.player_hurt:set(function(v464)
    firstlogst(v464);
    secondlogs(v464);
    seconddloges(v464);
end);
local function v470(v465)
    -- upvalues: v304 (ref), v305 (ref), v306 (ref)
    local v466 = entity.get_local_player();
    local v467 = entity.get(v465.userid, true);
    local v468 = entity.get(v465.attacker, true);
    if v467 == v466 then
        v304 = 0;
        return;
    elseif v467 == v468 or v468 ~= v466 then
        return;
    else
        local l_headshot_0 = v465.headshot;
        v304 = v304 + 1;
        table.insert(v305, {
            y = -150, 
            x = 0, 
            headshot = l_headshot_0, 
            kill = v304, 
            time = globals.curtime
        });
        table.insert(v306, {
            x = 0, 
            headshot = l_headshot_0
        });
        if #v306 >= 10 then
            table.remove(v306, 1);
        end;
        MakeKillMarkE(l_headshot_0, v304);
        return;
    end;
end;
events.player_death:set(function(v471)
    -- upvalues: v470 (ref)
    v470(v471);
    drawunmuten();
end);
events.level_init:set(function()
    -- upvalues: v432 (ref)
    v432();
end);
events.mouse_input:set(function()
    return ui.get_alpha() < 0.3;
end);
senkopasxa = false;
checkxoyaw = false;
events.console_input:set(function(v472)
    if v472 == "senkotech" or v472 == "senkotech " then
        senkopasxa = true;
        common.add_notify("senkotech", "\208\159\208\176\209\129\209\133\208\176\208\187\208\186\208\176 \208\189\208\176\208\185\208\180\208\181\208\189\208\176!");
    elseif v472 == "rpl" or v472 == "rpl " then
        senkopasxa = false;
        common.add_notify("RealPaste", "\208\146\208\190\208\183\208\178\209\128\208\176\209\137\208\176\208\181\208\188 \208\178\209\129\209\145 \208\189\208\176 \208\188\208\181\209\129\209\130\208\190");
    end;
    if v472 == "xoyaw" or v472 == "xo-yaw" or v472 == "xoyaw " or v472 == "xo-yaw " or v472 == "\209\133\208\190\209\143\208\178" or v472 == "\209\133\208\190\209\143\208\178 " then
        checkxoyaw = true;
    end;
end);