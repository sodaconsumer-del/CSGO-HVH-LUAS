local other_visuals_location = ui.create("Other", "Visuals")
local custom_scope = other_visuals_location:switch("Custom Scope")
scope_ref = custom_scope:create()
local scope_gap = scope_ref:slider("Scope Gap", 0,300,0)
local scope_length = scope_ref:slider("Scope Length", 0,300,0)
local scope_color = scope_ref:color_picker("Scope Color")

local lerp = function(time,a,b)
    return a * (1-time) + b * time
end

length = 0
gap = 0
events.render:set(function()
    if not custom_scope:get() then 
        ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):set("Remove Overlay")
        return 
    end

    local x = render.screen_size().x
    local y = render.screen_size().y
    local localplayer = entity.get_local_player()
    ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):set("Remove All")
    if localplayer == nil then return end
    if localplayer.m_iHealth < 1 then return end
    length = lerp(0.15, length, localplayer.m_bIsScoped and scope_length:get() or 0) 
    gap = lerp(0.15, gap, localplayer.m_bIsScoped and scope_gap:get() or 0) 
    local scope_color_x = color(scope_color:get().r, scope_color:get().g, scope_color:get().b, 255)
    local scope_color_y = color(scope_color:get().r, scope_color:get().g, scope_color:get().b, 0)
    render.gradient(vector(x / 2 - gap, y / 2), vector(x / 2 - gap - length, y / 2 + 1), scope_color_x, scope_color_y, scope_color_x, scope_color_y)
    render.gradient(vector(x / 2 + gap, y / 2), vector(x / 2 + gap + length, y / 2 + 1), scope_color_x, scope_color_y, scope_color_x, scope_color_y)
    render.gradient(vector(x / 2, y / 2 + gap), vector(x / 2 + 1, y / 2 + gap + length), scope_color_x, scope_color_x, scope_color_y, scope_color_y)
    render.gradient(vector(x / 2, y / 2 - gap), vector(x / 2 + 1, y / 2 - gap - length), scope_color_x, scope_color_x, scope_color_y, scope_color_y)
end)