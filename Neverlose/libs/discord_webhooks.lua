local library = {}

--- @region: prepare message structure
local msg_structure = {}
msg_structure.options = {}

function msg_structure:set_content(content)
    self.options.content = content
end

function msg_structure:set_username(name)
    self.options.username = name
end

function msg_structure:set_avatar(url)
    self.options.avatar_url = url
end

library.new_data = function()
    return setmetatable({}, {
        __index = msg_structure
    })
end
--- @endregion

--- @region: prepare embeds structure
local embed_data = {}
embed_data.options = {}

function embed_data:set_title(title)
    self.options.title = title
end

function embed_data:set_description(description) 
    self.options.description = description
end

function embed_data:set_URL(url) 
    self.options.url = url
end

function embed_data:set_timestamp(timestamp) 
    self.options.timestamp = timestamp
end

function embed_data:set_color(color) 
    self.options.color = color
end

function embed_data:set_footer(text, icon, proxy_icon) 
    self.options.footer = {
        text = text,
        icon_url = icon or "", 
        proxy_icon_url = proxy_icon or ""
    }
end

function embed_data:set_image(icon, proxy_icon, height, width)
    self.options.image = {
        url = icon or "", 
        proxy_url = proxy_icon or "",
        height = height or nil, 
        width = width or nil
    }
end

function embed_data:set_thumbnail(icon, proxy_icon, height, width) 
    self.options.thumbnail = {
        url = icon or "", 
        proxy_url = proxy_icon or "",
        height = height or nil, 
        width = width or nil
    }
end

function embed_data:set_video(url, height, width)
    self.options.video = {
        url = url or "", 
        height = height or nil, 
        width = width or nil
    } 
end

function embed_data:set_author(name, url, icon, proxy_icon)
    self.options.author = {
        name = name or "",
        url = url or "",
        icon_url = icon or "",
        proxy_icon_url = proxy_icon or ""
    }
end

function embed_data:add_field(name, value, inline) 
    if not self.options.fields then
        self.options.fields = {}
    end
    
    table.insert(self.options.fields, {
        name = name, 
        value = value, 
        inline = inline or false
    })
end

library.new_embed = function()
    return setmetatable({}, {
        __index = embed_data
    })
end
--- @endregion

--- @region: prepare webhooks
local web_hooks = {}
web_hooks.url_api = ""

function web_hooks:send(data, embeds)
    local body = {embeds = {embeds.options}}
    for id, parameter in pairs(data.options) do
        body[id] = parameter
    end

    local json_body = json.stringify(body)
    network.post(web_hooks.url_api, json_body, {["Content-Length"] = tostring(#json_body), ["Content-Type"] = "application/json"})
end

library.new = function(url)
    web_hooks.url_api = url
    return setmetatable({}, {
        __index = web_hooks
    })
end
--- @endregion

--- @region: example
--[[
    local data = library.new_data()
    local embeds = library.new_embed()

    data:set_username("Neverlose.cc")
    data:set_content("Bara bara bara bere bere bere")

    embeds:set_color(7973872) --- @note: only decimal colors
    embeds:set_description("This is test.")

    local url = ""
    library.new(url):send(data, embeds)

    --- @note: result: https://imgur.com/Z3ANMJ4
]]
--- @endregion

return library