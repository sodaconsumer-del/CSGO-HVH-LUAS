local l_gradient_0 = require("neverlose/gradient");
ui.sidebar("NameChanger", "repeat");
local v1 = ui.create(ui.get_icon("disease") .. " About", ui.get_icon("repeat") .. "NameChanger");
local v2 = ui.create(ui.get_icon("disease") .. " About", ui.get_icon("disease") .. " AmmaSense");
ammasenseexperience = l_gradient_0.text_animate("AmmaSense Experience", -1, {
    color(143, 0, 203), 
    color(86, 181, 254)
});
local _ = v2:label(ammasenseexperience:get_animated_text());
local _ = v2:label("If you have any questions, please contact me through the following contact ways.");
local _ = v2:button(ui.get_icon("users") .. " Q Group", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://jq.qq.com/?_wv=1027&k=5aoiW8Og");
end, true);
local _ = v2:button(ui.get_icon("sms") .. " QQ", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://d.4rxb.com/s/ozcnni");
end, true);
local v7 = v1:switch("NameChanger", false);
local v8 = v1:input("Custom Text", "AmmaSense");
events.render:set(function()
    -- upvalues: v7 (ref), v8 (ref)
    if not globals.is_connected then
        return;
    else
        if v7:get() then
            common.set_name(v8:get());
        end;
        return;
    end;
end);
events.render:set(function()
    -- upvalues: v7 (ref), v8 (ref)
    if v7:get() then
        v8:visibility(true);
    else
        v8:visibility(false);
    end;
end);