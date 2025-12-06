local v0 = ui.create("custom clantag"):switch("enable custom clantag", false);
local v1 = v0:create():input("clantag");
local v2 = "";
v0:set_callback(function()
    -- upvalues: v0 (ref), v1 (ref)
    if not v0:get() then
        common.set_clan_tag("");
    else
        common.set_clan_tag(v1:get());
    end;
end, true);
events.net_update_start:set(function()
    -- upvalues: v0 (ref), v2 (ref), v1 (ref)
    if not v0:get() then
        return;
    else
        if not entity.get_local_player():is_alive() then
            v2 = "";
        end;
        local v3 = v1:get();
        if v2 ~= v3 then
            v2 = v3;
            common.set_clan_tag(v3);
            return;
        else
            return;
        end;
    end;
end);
events.shutdown:set(function()
    common.set_clan_tag("");
end);