-- Security is just an illusion.

local lua_name = "syphonic cracked"

local lua_color = {r = 147  , g = 132, b = 186}

local function try_require(module, msg)
    local success, result = pcall(require, module)
    if success then return result else return error(msg) end
end


local images = try_require("gamesense/images", "Download images library: https://gamesense.pub/forums/viewtopic.php?id=22917")

local bit = try_require("bit")

local base64 = try_require("gamesense/base64", "Download base64 encode/decode library: https://gamesense.pub/forums/viewtopic.php?id=21619")

local antiaim_funcs = try_require("gamesense/antiaim_funcs", "Download anti-aim functions library: https://gamesense.pub/forums/viewtopic.php?id=29665")

local ffi = try_require("ffi", "Failed to require FFI, please make sure Allow unsafe scripts is enabled!")

local vector = try_require("vector", "Missing vector")

local http = try_require("gamesense/http", "Download HTTP library: https://gamesense.pub/forums/viewtopic.php?id=21619")

local clipboard = try_require("gamesense/clipboard", "Download Clipboard library: https://gamesense.pub/forums/viewtopic.php?id=28678")

local ent = try_require("gamesense/entity", "Download Entity Object library: https://gamesense.pub/forums/viewtopic.php?id=27529")

local csgo_weapons = try_require("gamesense/csgo_weapons", "Download CS:GO weapon data library: https://gamesense.pub/forums/viewtopic.php?id=18807")


local syphonic_data = syphonic_fetch and syphonic_fetch() or {username = 'scriptleaks', build = 'debug', discord = ''}

-- Process user data
local userdata = {
    username = syphonic_data.username or 'scriptleaks',  -- If username is nil, fallback to default
    build = syphonic_data.build and syphonic_data.build:gsub("[Pp]rivate", "dev"):gsub("[Bb]eta", "dev"):gsub("[Uu]ser", "live") or 'debug' -- Replace occurrences of Private, Beta, and User with dev and live accordingly
}



local lua = {}
lua.database = {
    configs = ":" .. lua_name .. "::configs:"
}
local presets = {}
-- @region USERDATA end

-- @region REFERENCES start
local refs = {
    legit = ui.reference("LEGIT", "Aimbot", "Enabled"),
    dmgOverride = {ui.reference("RAGE", "Aimbot", "Minimum damage override")},
    fakeDuck = ui.reference("RAGE", "Other", "Duck peek assist"),
    minDmg = ui.reference("RAGE", "Aimbot", "Minimum damage"),
    hitChance = ui.reference("RAGE", "Aimbot", "Minimum hit chance"),
    safePoint = ui.reference("RAGE", "Aimbot", "Force safe point"),
    forceBaim = ui.reference("RAGE", "Aimbot", "Force body aim"),
    dtLimit = ui.reference("RAGE", "Aimbot", "Double tap fake lag limit"),
    quickPeek = {ui.reference("RAGE", "Other", "Quick peek assist")},
    dt = {ui.reference("RAGE", "Aimbot", "Double tap")},
    enabled = ui.reference("AA", "Anti-aimbot angles", "Enabled"),
    pitch = {ui.reference("AA", "Anti-aimbot angles", "pitch")},
    roll = ui.reference("AA", "Anti-aimbot angles", "roll"),
    yawBase = ui.reference("AA", "Anti-aimbot angles", "Yaw base"),
    yaw = {ui.reference("AA", "Anti-aimbot angles", "Yaw")},
    flLimit = ui.reference("AA", "Fake lag", "Limit"),
    fsBodyYaw = ui.reference("AA", "anti-aimbot angles", "Freestanding body yaw"),
    edgeYaw = ui.reference("AA", "Anti-aimbot angles", "Edge yaw"),
    yawJitter = {ui.reference("AA", "Anti-aimbot angles", "Yaw jitter")},
    bodyYaw = {ui.reference("AA", "Anti-aimbot angles", "Body yaw")},
    freeStand = {ui.reference("AA", "Anti-aimbot angles", "Freestanding")},
    os = {ui.reference("AA", "Other", "On shot anti-aim")},
    slow = {ui.reference("AA", "Other", "Slow motion")},
    fakeLag = {ui.reference("AA", "Fake lag", "Limit")},
    legMovement = ui.reference("AA", "Other", "Leg movement"),
    indicators = {ui.reference("VISUALS", "Other ESP", "Feature indicators")},
    ping = {ui.reference("MISC", "Miscellaneous", "Ping spike")},
}
-- @region REFERENCES end

-- @region VARIABLES start
local vars = {
    localPlayer = 0,
    hitgroup_names = { 'Generic', 'Head', 'Chest', 'Stomach', 'Left arm', 'Right arm', 'Left leg', 'Right leg', 'Neck', '?', 'Gear' },
    aaStates = {"Global", "Standing", "Moving", "Slowwalking", "Crouching", "Air", "Air-Crouching"},
    pStates = {"G", "S", "M", "SW", "C", "A", "AC"},
	sToInt = {["Global"] = 1, ["Standing"] = 2, ["Moving"] = 3, ["Slowwalking"] = 4, ["Crouching"] = 5, ["Air"] = 6, ["Air-Crouching"] = 7},
    intToS = {[1] = "Global", [2] = "Stand", [3] = "Move", [4] = "Slowwalk", [5] = "Crouch", [6] = "Air", [7] = "Air+C"},
    currentTab = 1,
    activeState = 1,
    pState = 1
}

local slurs = {
        "dont talking pls",
	"when u miss, cry u dont hev syphonic cracked",
	"you think you are is good but im best 1",
	"fokin dog, get ownet by syphonic cracked js rezolver",
	"if im lose = my team is dog",
	"never talking bad to me again, im always top1",
	"umad that you're miss? hs dog",
	"vico (top1 eu) vs all kelbs on hvh.",
	"you is mad that im ur papi?",
	"im will rape u're mother after i killed you",
	"stay mad that im unhitable",
	"god night brother, cya next raund ;)",
	"get executed from presidend of argentina",
	"you thinking ur have chencse vs boss?",
	"i killed gejmsense, now im kill you",
	"by luckbaysed config, cya twitter bro o/",
	"cy@ https://gamesense.pub/forums/viewforum.php?id=6",
	"_w_(its fuck)",
	"dont play vs me on train, im live there -.-",
	"by top1 uzbekistan holder umed?",
	"courage for play de_shortnuke vs me, my home there.",
	"bich.. dont test g4ngst3r in me.",
	"im rich princ here, dont toxic dog.",
	"for all thet say gamesense best, im try on parsec and is dog.",
	"WEAK DOG sanchezj vs ru bossman (owned on mein map)",
	"im want gamesense only for animbrejker, neverlose always top.",
	"this dog brandog thinking hes top, but reality say no.",
	"fawk you foking treny",
	"ur think ur good but its falsee.",
	"topdog nepbot get baits 24/7 -.-",
	"who this bot malva? im own him 9-0",
	"im beat all romania dogs with 1 finker",
	"im rejp this dog noobers with no problems",
	"gamesense hazey vs all -.-",
	"irelevent dog jompan try to stay popular but fail",
	"im user dev and ur dont, stay mad.",
	"dont talking, no syphonic cracked no talk pls",
	"when u miss, cry u dont hev syphonic cracked",
	"you think you are is good but syphonic cracked is best",
	"fkn dog, get own by syphonic cracked js rezolver",
	"if you luse = no syphonic cracked issue",
	"never talking bad to me again, syphonic cracked boosing me to top1",
	"umad that you're miss? get syphonic cracked d0g",
	"stay med that im unhitable ft syphonic cracked",
	"get executed from syphonic rednology",
	"you thinking ur have chencse vs syphonic?",
	"first i killed gejmsense, now syphonic kill you",
	"by syphonic boss aa, cya twitter bro o/",
}

local js = panorama.open()
local MyPersonaAPI, LobbyAPI, PartyListAPI, SteamOverlayAPI = js.MyPersonaAPI, js.LobbyAPI, js.PartyListAPI, js.SteamOverlayAPI
-- @region VARIABLES end

-- @region FUNCS start
local func = {
    render_text = function(x, y, ...)
        local x_Offset = 0
        
        local args = {...}
    
        for i, line in pairs(args) do
            local r, g, b, a, text = unpack(line)
            local size = vector(renderer.measure_text("-d", text))
            renderer.text(x + x_Offset, y, r, g, b, a, "-d", 0, text)
            x_Offset = x_Offset + size.x
        end
    end,
    easeInOut = function(t)
        return (t > 0.5) and 4*((t-1)^3)+1 or 4*t^3;
    end,
    rec = function(x, y, w, h, radius, color)
        radius = math.min(x/2, y/2, radius)
        local r, g, b, a = unpack(color)
        renderer.rectangle(x, y + radius, w, h - radius*2, r, g, b, a)
        renderer.rectangle(x + radius, y, w - radius*2, radius, r, g, b, a)
        renderer.rectangle(x + radius, y + h - radius, w - radius*2, radius, r, g, b, a)
        renderer.circle(x + radius, y + radius, r, g, b, a, radius, 180, 0.25)
        renderer.circle(x - radius + w, y + radius, r, g, b, a, radius, 90, 0.25)
        renderer.circle(x - radius + w, y - radius + h, r, g, b, a, radius, 0, 0.25)
        renderer.circle(x + radius, y - radius + h, r, g, b, a, radius, -90, 0.25)
    end,
    rec_outline = function(x, y, w, h, radius, thickness, color)
        radius = math.min(w/2, h/2, radius)
        local r, g, b, a = unpack(color)
        if radius == 1 then
            renderer.rectangle(x, y, w, thickness, r, g, b, a)
            renderer.rectangle(x, y + h - thickness, w , thickness, r, g, b, a)
        else
            renderer.rectangle(x + radius, y, w - radius*2, thickness, r, g, b, a)
            renderer.rectangle(x + radius, y + h - thickness, w - radius*2, thickness, r, g, b, a)
            renderer.rectangle(x, y + radius, thickness, h - radius*2, r, g, b, a)
            renderer.rectangle(x + w - thickness, y + radius, thickness, h - radius*2, r, g, b, a)
            renderer.circle_outline(x + radius, y + radius, r, g, b, a, radius, 180, 0.25, thickness)
            renderer.circle_outline(x + radius, y + h - radius, r, g, b, a, radius, 90, 0.25, thickness)
            renderer.circle_outline(x + w - radius, y + radius, r, g, b, a, radius, -90, 0.25, thickness)
            renderer.circle_outline(x + w - radius, y + h - radius, r, g, b, a, radius, 0, 0.25, thickness)
        end
    end,
    clamp = function(x, min, max)
        return x < min and min or x > max and max or x
    end,
    table_contains = function(tbl, value)
        for i = 1, #tbl do
            if tbl[i] == value then
                return true
            end
        end
        return false
    end,
    setAATab = function(ref)
        ui.set_visible(refs.enabled, ref)
        ui.set_visible(refs.pitch[1], ref)
        ui.set_visible(refs.pitch[2], ref)
        ui.set_visible(refs.roll, ref)
        ui.set_visible(refs.yawBase, ref)
        ui.set_visible(refs.yaw[1], ref)
        ui.set_visible(refs.yaw[2], ref)
        ui.set_visible(refs.yawJitter[1], ref)
        ui.set_visible(refs.yawJitter[2], ref)
        ui.set_visible(refs.bodyYaw[1], ref)
        ui.set_visible(refs.bodyYaw[2], ref)
        ui.set_visible(refs.freeStand[1], ref)
        ui.set_visible(refs.freeStand[2], ref)
        ui.set_visible(refs.fsBodyYaw, ref)
        ui.set_visible(refs.edgeYaw, ref)
    end,
    findDist = function (x1, y1, z1, x2, y2, z2)
        return math.sqrt((x2 - x1)^2 + (y2 - y1)^2 + (z2 - z1)^2)
    end,
    resetAATab = function()
        ui.set(refs.enabled, false)
        ui.set(refs.pitch[1], "Off")
        ui.set(refs.pitch[2], 0)
        ui.set(refs.roll, 0)
        ui.set(refs.yawBase, "local view")
        ui.set(refs.yaw[1], "Off")
        ui.set(refs.yaw[2], 0)
        ui.set(refs.yawJitter[1], "Off")
        ui.set(refs.yawJitter[2], 0)
        ui.set(refs.bodyYaw[1], "Off")
        ui.set(refs.bodyYaw[2], 0)
        ui.set(refs.freeStand[1], false)
        ui.set(refs.freeStand[2], "On hotkey")
        ui.set(refs.fsBodyYaw, false)
        ui.set(refs.edgeYaw, false)
    end,
    type_from_string = function(input)
        if type(input) ~= "string" then return input end

        local value = input:lower()

        if value == "true" then
            return true
        elseif value == "false" then
            return false
        elseif tonumber(value) ~= nil then
            return tonumber(value)
        else
            return tostring(input)
        end
    end,
    lerp = function(start, vend, time)
        return start + (vend - start) * time
    end,
    vec_angles = function(angle_x, angle_y)
        local sy = math.sin(math.rad(angle_y))
        local cy = math.cos(math.rad(angle_y))
        local sp = math.sin(math.rad(angle_x))
        local cp = math.cos(math.rad(angle_x))
        return cp * cy, cp * sy, -sp
    end,
    hex = function(arg)
        local result = "\a"
        for key, value in next, arg do
            local output = ""
            while value > 0 do
                local index = math.fmod(value, 16) + 1
                value = math.floor(value / 16)
                output = string.sub("0123456789ABCDEF", index, index) .. output 
            end
            if #output == 0 then 
                output = "00" 
            elseif #output == 1 then 
                output = "0" .. output 
            end 
            result = result .. output
        end 
        return result .. "FF"
    end,
    split = function( inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
    end,
    RGBAtoHEX = function(redArg, greenArg, blueArg, alphaArg)
        return string.format('%.2x%.2x%.2x%.2x', redArg, greenArg, blueArg, alphaArg)
    end,
    create_color_array = function(r, g, b, string)
        local colors = {}
        for i = 0, #string do
            local color = {r, g, b, 255 * math.abs(1 * math.cos(2 * math.pi * globals.curtime() / 4 + i * 5 / 30))}
            table.insert(colors, color)
        end
        return colors
    end,
    textArray = function(string)
        local result = {}
        for i=1, #string do
            result[i] = string.sub(string, i, i)
        end
        return result
    end,
    gradient_text = function(r1, g1, b1, a1, r2, g2, b2, a2, text)
        local output = ''
    
        local len = #text-1
    
        local rinc = (r2 - r1) / len
        local ginc = (g2 - g1) / len
        local binc = (b2 - b1) / len
        local ainc = (a2 - a1) / len
    
        for i=1, len+1 do
            output = output .. ('\a%02x%02x%02x%02x%s'):format(r1, g1, b1, a1, text:sub(i, i))
    
            r1 = r1 + rinc
            g1 = g1 + ginc
            b1 = b1 + binc
            a1 = a1 + ainc
        end
    
        return output
    end
,    
    time_to_ticks = function(t)
        return math.floor(0.5 + (t / globals.tickinterval()))
    end,
    headVisible = function(enemy)
        local_player = entity.get_local_player()
        if local_player == nil then return end
        local ex, ey, ez = entity.hitbox_position(enemy, 1)
    
        local hx, hy, hz = entity.hitbox_position(local_player, 1)
        local head_fraction, head_entindex_hit = client.trace_line(enemy, ex, ey, ez, hx, hy, hz)
        if head_entindex_hit == local_player or head_fraction == 1 then return true else return false end
    end
}

local clantag = function(text, indices)
    local text_anim = "               " .. text .. "                      " 
    local tickinterval = globals.tickinterval()
    local tickcount = globals.tickcount() + func.time_to_ticks(client.latency())
    local i = tickcount / func.time_to_ticks(0.3)
    i = math.floor(i % #indices)
    i = indices[i+1]+1

    return string.sub(text_anim, i, i+15)
end

local trashtalk = function(e)

    local victim_userid, attacker_userid = e.userid, e.attacker
    if victim_userid == nil or attacker_userid == nil then
        return
    end

    local victim_entindex   = client.userid_to_entindex(victim_userid)
    local attacker_entindex = client.userid_to_entindex(attacker_userid)
    if attacker_entindex == entity.get_local_player() and entity.is_enemy(victim_entindex) then
        local phrase = slurs[math.random(1, #slurs)]
        local say = 'say ' .. phrase
        client.exec(say)
    end
end

local color_text = function( string, r, g, b, a)
    local accent = "\a" .. func.RGBAtoHEX(r, g, b, a)
    local white = "\a" .. func.RGBAtoHEX(255, 255, 255, a)

    local str = ""
    for i, s in ipairs(func.split(string, "$")) do
        str = str .. (i % 2 ==( string:sub(1, 1) == "$" and 0 or 1) and white or accent) .. s
    end

    return str
end

local animate_text = function(time, string, r, g, b, a)
    local t_out, t_out_iter = { }, 1

    local l = string:len( ) - 1

    local r_add = (255 - r)
    local g_add = (255 - g)
    local b_add = (255 - b)
    local a_add = (155 - a)

    for i = 1, #string do
        local iter = (i - 1)/(#string - 1) + time
        t_out[t_out_iter] = "\a" .. func.RGBAtoHEX( r + r_add * math.abs(math.cos( iter )), g + g_add * math.abs(math.cos( iter )), b + b_add * math.abs(math.cos( iter )), a + a_add * math.abs(math.cos( iter )) )

        t_out[t_out_iter + 1] = string:sub( i, i )

        t_out_iter = t_out_iter + 2
    end

    return t_out
end

local glow_module = function(x, y, w, h, width, rounding, accent, accent_inner)
    local thickness = 1
    local Offset = 1
    local r, g, b, a = unpack(accent)
    if accent_inner then
        func.rec(x, y, w, h + 1, rounding, accent_inner)
    end
    for k = 0, width do
        if a * (k/width)^(1) > 5 then
            local accent = {r, g, b, a * (k/width)^(2)}
            func.rec_outline(x + (k - width - Offset)*thickness, y + (k - width - Offset) * thickness, w - (k - width - Offset)*thickness*2, h + 1 - (k - width - Offset)*thickness*2, rounding + thickness * (width - k + Offset), thickness, accent)
        end
    end
end

local colorful_text = {
    lerp = function(self, from, to, duration)
        if type(from) == 'table' and type(to) == 'table' then
            return { 
                self:lerp(from[1], to[1], duration), 
                self:lerp(from[2], to[2], duration), 
                self:lerp(from[3], to[3], duration) 
            };
        end
    
        return from + (to - from) * duration;
    end,
    console = function(self, ...)
        for i, v in ipairs({ ... }) do
            if type(v[1]) == 'table' and type(v[2]) == 'table' and type(v[3]) == 'string' then
                for k = 1, #v[3] do
                    local l = self:lerp(v[1], v[2], k / #v[3]);
                    client.color_log(l[1], l[2], l[3], v[3]:sub(k, k) .. '\0');
                end
            elseif type(v[1]) == 'table' and type(v[2]) == 'string' then
                client.color_log(v[1][1], v[1][2], v[1][3], v[2] .. '\0');
            end
        end
    end,
    text = function(self, ...)
        local menu = false;
        local alpha = 255
        local f = '';
        
        for i, v in ipairs({ ... }) do
            if type(v) == 'boolean' then
                menu = v;
            elseif type(v) == 'number' then
                alpha = v;
            elseif type(v) == 'string' then
                f = f .. v;
            elseif type(v) == 'table' then
                if type(v[1]) == 'table' and type(v[2]) == 'string' then
                    f = f .. ('\a%02x%02x%02x%02x'):format(v[1][1], v[1][2], v[1][3], alpha) .. v[2];
                elseif type(v[1]) == 'table' and type(v[2]) == 'table' and type(v[3]) == 'string' then
                    for k = 1, #v[3] do
                        local g = self:lerp(v[1], v[2], k / #v[3])
                        f = f .. ('\a%02x%02x%02x%02x'):format(g[1], g[2], g[3], alpha) .. v[3]:sub(k, k)
                    end
                end
            end
        end
    
        return ('%s\a%s%02x'):format(f, (menu) and 'cdcdcd' or 'ffffff', alpha);
    end,
    log = function(self, ...)
        for i, v in ipairs({ ... }) do
            if type(v) == 'table' then
                if type(v[1]) == 'table' then
                    if type(v[2]) == 'string' then
                        self:console({ v[1], v[1], v[2] })
                        if (v[3]) then
                            self:console({ { 255, 255, 255 }, '\n' })
                        end
                    elseif type(v[2]) == 'table' then
                        self:console({ v[1], v[2], v[3] })
                        if v[4] then
                            self:console({ { 255, 255, 255 }, '\n' })
                        end
                    end
                elseif type(v[1]) == 'string' then
                    self:console({ { 205, 205, 205 }, v[1] });
                    if v[2] then
                        self:console({ { 255, 255, 255 }, '\n' })
                    end
                end
            end
        end
    end
}
local download
local function downloadFile()
	http.get(string.format("https://flagsapi.com/%s/flat/64.png", MyPersonaAPI.GetMyCountryCode()), function(success, response)
		if not success or response.status ~= 200 then
			print("couldnt fetch the flag image")
            return
		end

		download = response.body
	end)

    http.get("https://cdn.discordapp.com/attachments/1309916087818784861/1309916147612913684/Hunter_x_Hunter.jpg?ex=674351fa&is=6742007a&hm=b59a05bfbf508b8b55d1818492d88548adb39a3fbf8862b3ac881683c94ff2f1&", function(success, response)
		if not success or response.status ~= 200 then
			print("couldnt fetch the logo image")
            return
		end

		writefile("logo.png", response.body)
	end)
end
downloadFile()
-- @region FUNCS end

-- @region UI_LAYOUT start
local tab, container = "AA", "Anti-aimbot angles"
local label = ui.new_label(tab, container, lua_name)
local tabPicker = ui.new_combobox(tab, container, "\nTab", "Anti-aim", "Builder", "Visuals", "Misc", "Config")

local menu = {
    aaTab = {
        welcomeback = ui.new_label("AA", "Anti-aimbot angles", " \aB0AEE3FF✨\affffffc8 Welcome back › \aB0AEE3FFsyphonic-shit"),
        authbuild = ui.new_label("AA", "Anti-aimbot angles", " \aB0AEE3FF✨\affffffc8 Authenticated branch › \aB0AEE3FFcracked-debug"),
        lefttime = ui.new_label("AA", "Anti-aimbot angles", " \aB0AEE3FF✨\affffffc8 Time left › \aB0AEE3FFinfinity"),
        discord = ui.new_label("AA", "Anti-aimbot angles", " \aB0AEE3FF✨\affffffc8 Authenticated Discord › \aB0AEE3FFhazeyshitpaster"),
    
        manuals = ui.new_combobox("AA", "Other", "› Manu\aB0AEE3FFals", "Off", "Default", "Static"),
        manualTab = {
            manualLeft = ui.new_hotkey("AA", "Anti-aimbot angles", "Manual " .. func.hex({200,200,200}) .. "left"),
            manualRight = ui.new_hotkey("AA", "Anti-aimbot angles", "Manual " .. func.hex({200,200,200}) .. "right"),
            manualForward = ui.new_hotkey("AA", "Anti-aimbot angles", "Manual " .. func.hex({200,200,200}) .. "forward"),
        },
    },
    builderTab = {
        state = ui.new_combobox(tab, container, "Anti-aim state", vars.aaStates)
    },
    visualsTab = {
        indicators = ui.new_checkbox(tab, container, "› Display \aB0AEE3FFIndicators"),
indicatorsClr = ui.new_color_picker(tab, container, "› Indicator Color", lua_color.r, lua_color.g, lua_color.b, 255),
indicatorsType = ui.new_combobox(tab, container, "\n Indicator Type", "-", "Classic", "Modern"),
indicatorsStyle = ui.new_multiselect(tab, container, "› Components \aB0AEE3FFSelection", "Name", "State", "Doubletap", "Hideshots", "Freestand", "Safepoint", "Body aim", "Fakeduck"),
arrows = ui.new_checkbox(tab, container, "› Directional \aB0AEE3FFArrows"),
arrowClr = ui.new_color_picker(tab, container, "› Arrow Color", lua_color.r, lua_color.g, lua_color.b, 255),
arrowIndicatorStyle = ui.new_combobox(tab, container, "\n Arrow Style", "-", "Simple", "Advanced"),
watermark = ui.new_checkbox(tab, container, "› Custom \aB0AEE3FFLogo"),
watermarkClr = ui.new_color_picker(tab, container, "› Logo Color", lua_color.r, lua_color.g, lua_color.b, 255),
minDmgIndicator = ui.new_checkbox(tab, container, "› Minimum \aB0AEE3FFDamage Display"),
logs = ui.new_checkbox(tab, container, "› Combat \aB0AEE3FFLogs"),
logsClr = ui.new_color_picker(tab, container, "› Logs Color", lua_color.r, lua_color.g, lua_color.b, 255),
logOffset = ui.new_slider(tab, container, "› Log Offset", 0, 500, 100, true, "px", 1)

    },
    miscTab = {
        fixHideshots = ui.new_checkbox(tab, container, "› Correct hide\aB0AEE3FFshots"),
        manualsOverFs = ui.new_checkbox(tab, container, "› Override Free\aB0AEE3FFstanding"),
        dtDischarge = ui.new_checkbox(tab, container, "› Auto DT Dis\aB0AEE3FFcharge"),
        clanTag = ui.new_checkbox(tab, container, "› Custom Clan\aB0AEE3FFtag"),
        trashTalk = ui.new_checkbox(tab, container, "› Verbal \aB0AEE3FFTaunts"),
        fastLadderEnabled = ui.new_checkbox(tab, container, "› Quick \aB0AEE3FFLadder"),
        fastLadder = ui.new_multiselect(tab, container, "\n Ladder Speed", "Ascending", "Descending"),
        animationsEnabled = ui.new_checkbox(tab, container, "› Animation \aB0AEE3FFModifiers"),
        animations = ui.new_multiselect(tab, container, "\n Animation Modifiers", "Static legs", "Leg fixer", "0 pitch on landing", "Fast legs"),
        freestandHotkey = ui.new_hotkey(tab, container, "› Free\aB0AEE3FFstand Hotkey"),
        legitAAHotkey = ui.new_hotkey(tab, container, "› Legitimate Anti-\aB0AEE3FFaim"),
        edgeYawHotkey = ui.new_hotkey(tab, container, "› Boundary \aB0AEE3FFYaw"),
        avoidBackstab = ui.new_slider(tab, container, "› Prevent Back\aB0AEE3FFstab", 0, 300, 0, true, "u", 1, {[0] = "Off"})
        
    },
    configTab = {
        list = ui.new_listbox(tab, container, "› Pre\aB0AEE3FFsets", ""),
        name = ui.new_textbox(tab, container, "› Pre\aB0AEE3FFset Name", ""),
        load = ui.new_button(tab, container, "› Lo\aB0AEE3FFad Preset", function() end),
        save = ui.new_button(tab, container, "› Sa\aB0AEE3FFve Preset", function() end),
        delete = ui.new_button(tab, container, "› Del\aB0AEE3FFete Preset", function() end),
        import = ui.new_button(tab, container, "› Im\aB0AEE3FFport Preset", function() end),
        export = ui.new_button(tab, container, "› Ex\aB0AEE3FFport Preset", function() end)
        
    }
}

local aaBuilder = {}
local aaContainer = {}
for i=1, #vars.aaStates do
    aaContainer[i] = func.hex({200,200,200}) .. "(" .. func.hex({222,55,55}) .. "" .. vars.pStates[i] .. "" .. func.hex({200,200,200}) .. ")" .. func.hex({155,155,155}) .. " "
    aaBuilder[i] = {
        enableState = ui.new_checkbox(tab, container, "Ena\aB0AEE3FFble " .. func.hex({lua_color.r, lua_color.g, lua_color.b}) .. vars.aaStates[i] .. func.hex({200,200,200}) .. " state"),
        forceDefensive = ui.new_checkbox(tab, container, "Force \aB0AEE3FFDefensive\n" .. aaContainer[i]),
        pitch = ui.new_combobox(tab, container, "Pitch\n" .. aaContainer[i], "Off", "Default", "Up", "Down", "Minimal", "Random", "Custom"),
        pitchSlider = ui.new_slider(tab, container, "\nPitch add" .. aaContainer[i], -89, 89, 0, true, "°", 1),
        yawBase = ui.new_combobox(tab, container, "Yaw base\n" .. aaContainer[i], "Local view", "At targets"),
        yaw = ui.new_combobox(tab, container, "Yaw\n" .. aaContainer[i], "Off", "180", "180 Z", "Spin", "Slow Yaw", "L&R"),
        yawStatic = ui.new_slider(tab, container, "\nyaw" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawLeft = ui.new_slider(tab, container, "Left\nyaw" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawRight = ui.new_slider(tab, container, "Right\nyaw" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawJitter = ui.new_combobox(tab, container, "Yaw jitter\n" .. aaContainer[i], "Off", "Offset", "Center", "Skitter", "Random", "3-Way", "L&R"),
        wayFirst = ui.new_slider(tab, container, "First\nyaw jitter" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        waySecond = ui.new_slider(tab, container, "Second\nyaw jitter" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        wayThird = ui.new_slider(tab, container, "Third\nyaw jitter" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawJitterStatic = ui.new_slider(tab, container, "\nyaw jitter" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawJitterLeft = ui.new_slider(tab, container, "Left\nyaw jitter" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        yawJitterRight = ui.new_slider(tab, container, "Right\nyaw jitter" .. aaContainer[i], -180, 180, 0, true, "°", 1),
        bodyYaw = ui.new_combobox(tab, container, "Body yaw\n" .. aaContainer[i], "Off", "Opposite", "Jitter", "Static"),
        bodyYawStatic = ui.new_slider(tab, container, "\nbody yaw" .. aaContainer[i], -180, 180, 0, true, "°", 1),
    }
end

local function getConfig(name)
    local database = database.read(lua.database.configs) or {}

    for i, v in pairs(database) do
        if v.name == name then
            return {
                config = v.config,
                index = i
            }
        end
    end

    for i, v in pairs(presets) do
        if v.name == name then
            return {
                config = v.config,
                index = i
            }
        end
    end

    return false
end
local function saveConfig(name)
    local db = database.read(lua.database.configs) or {}
    local config = {}

    if name:match("[^%w]") ~= nil then
        return
    end

    for key, value in pairs(vars.pStates) do
        config[value] = {}
        for k, v in pairs(aaBuilder[key]) do
            config[value][k] = ui.get(v)
        end
    end

    local cfg = getConfig(name)

    if not cfg then
        table.insert(db, { name = name, config = config })
    else
        db[cfg.index].config = config
    end

    database.write(lua.database.configs, db)
end
local function deleteConfig(name)
    local db = database.read(lua.database.configs) or {}

    for i, v in pairs(db) do
        if v.name == name then
            table.remove(db, i)
            break
        end
    end

    for i, v in pairs(presets) do
        if v.name == name then
            return false
        end
    end

    database.write(lua.database.configs, db)
end
local function getConfigList()
    local database = database.read(lua.database.configs) or {}
    local config = {}

    for i, v in pairs(presets) do
        table.insert(config, v.name)
    end

    for i, v in pairs(database) do
        table.insert(config, v.name)
    end

    return config
end
local function typeFromString(input)
    if type(input) ~= "string" then return input end

    local value = input:lower()

    if value == "true" then
        return true
    elseif value == "false" then
        return false
    elseif tonumber(value) ~= nil then
        return tonumber(value)
    else
        return tostring(input)
    end
end
local function loadSettings(config)
    for key, value in pairs(vars.pStates) do
        for k, v in pairs(aaBuilder[key]) do
            if (config[value][k] ~= nil) then
                ui.set(v, config[value][k])
            end
        end 
    end
end
local function importSettings()
    loadSettings(json.parse(clipboard.get()))
end
local function exportSettings(name)
    local config = getConfig(name)
    clipboard.set(json.stringify(config.config))
end
local function loadConfig(name)
    local config = getConfig(name)
    loadSettings(config.config)
end

local function initDatabase()
    if database.read(lua.database.configs) == nil then
        database.write(lua.database.configs, {})
    end

    local link = "nofile"

    http.get(link, function(success, response)
        if not success then
            return
        end
    
        data = json.parse(response.body)
    
        for i, preset in pairs(data.presets) do
            table.insert(presets, { name = "*"..preset.name, config = preset.config})
            ui.set(menu.configTab.name, "*"..preset.name)
        end
        ui.update(menu.configTab.list, getConfigList())
    end)
end
initDatabase()
-- @region UI_LAYOUT end

-- @region NOTIFICATION_ANIM start
local anim_time = 0.75
local max_notifs = 6
local data = {}
local icon = base64.decode("iVBORw0KGgoAAAANSUhEUgAAAfQAAAH0CAYAAADL1t+KAAAAAXNSR0IArs4c6QAAIABJREFUeF7snQd4FFXXx8+ULSlA6F0poVdBKaKoVCsCAoKKIlhABFFEX1EQBDsqIEURKyjYuyg2ug2UJh0Jvfck26Z837kzs5md7GbTk5096+MDJFPu/d27859z7ykc0IcIEAEiQASIABGIeQJczPeAOkAEiAARIAJEgAgACTpNAiJABIgAESACNiBAgm6DQaQuEAEiQASIABEgQac5QASIABEgAkTABgRI0G0wiNQFIkAEiAARIAIk6DQHiAARIAJEgAjYgAAJug0GkbpABIgAESACRIAEneYAESACRIAIEAEbECBBt8EgUheIABEgAkSACJCg0xwgAkSACBABImADAiToNhhE6gIRIAJEgAgQARJ0mgNEgAgQASJABGxAgATdBoNIXSACRIAIEAEiQIJOc4AIEAEiQASIgA0IkKDbYBCpC0SACBABIkAESNBpDhABIkAEiAARsAEBEnQbDCJ1gQgQASJABIgACTrNASJABIgAESACNiBAgm6DQaQuEAEiQASIABEgQac5QASIABEgAkTABgRI0G0wiNQFIkAEiAARIAIk6DQHiAARIAJEgAjYgAAJug0GkbpABIgAESACRIAEneYAESACRIAIEAEbECBBt8EgUheIABEgAkSACJCg0xwgAkSACBABImADAiToNhhE6gIRIAJEgAgQARJ0mgNEgAgQASJABGxAgATdBoNIXSACRIAIEAEiQIJOc4AIEAEiQASIgA0IkKDbYBCpC0SACBABIkAESNBpDhABIkAEiAARsAEBEnQbDCJ1gQgQASJABIgACTrNASJABIgAESACNiBAgm6DQaQuEAEiQASIABEgQac5QASIABEgAkTABgRI0G0wiNQFIkAEiAARIAIk6DQHiAARIAJEgAjYgAAJug0GkbpABIgAESACRIAEneYAESACRIAIEAEbECBBt8EgUheIABEgAkSACJCg0xwgAkSACBABImADAiToNhhE6gIRIAJEgAgQARJ0mgNEgAgQASJABGxAgATdBoNIXSACRIAIEAEiQIJOc4AIEAEiQASIgA0IkKDbYBCpC0SACBABIkAESNBpDhABIkAEiAARsAEBEnQbDCJ1gQgQASJABIgACTrNASJABIgAESACNiBAgm6DQaQuEAEiQASIABEgQac5QASIABEgAkTABgRI0G0wiNQFIkAEiAARIAIk6DQHiAARIAJEgAjYgAAJug0GkbpABIgAESACRIAEneYAESACRIAIEAEbECBBt8EgUheIABEgAkSACJCg0xwgAkSACBABImADAiToNhhE6gIRIAJEgAgQARJ0mgNEgAgQASJABGxAgATdBoNIXSACRIAIEAEiQIJOc4AIEAEiQASIgA0IkKDbYBCpC0SACBABIkAESNBpDhABIkAEiAARsAEBEnQbDCJ1gQgQASJABIgACTrNASJABIgAESACNiBAgm6DQaQuEAEiQASIABEgQac5QASIABEgAkTABgRI0G0wiNQFIkAEiAARIAIk6DQHiAARIAJEgAjYgAAJug0GkbpABIgAESACRIAEneYAESACRIAIEAEbECBBt8EgUheIABEgAkSACJCg0xwgAkSACBABImADAiToNhhE6gIRIAJEgAgQARJ0mgNEgAgQASJABGxAgATdBoNIXSACRIAIEAEiQIJOc4AIEAEiQASIgA0IkKDbYBCpC0SACBABIkAESNBpDhABIkAEiAARsAEBEnQbDCJ1gQgQASJABIgACTrNASJABIgAESACNiBAgm6DQaQuEAEiQASIABEgQac5QASIABEgAkTABgRI0G0wiNQFIkAEiAARIAIk6DQHiAARIAJEgAjYgAAJug0GkbpABIgAESACRIAEneYAESACRIAIEAEbECBBt8EgUheIABEgAkSACJCg0xwgAkSACBABImADAiToNhhE6gIRIAJEgAgQARJ0mgNEgAgQASJABGxAgATdBoNIXSACRIAIEAEiQIJOc4AIEAEikH8CPADgcxT/xE8g/5eiM4lAwQiQoBeMH51NBIhAHBFIrVmz1kWtLrmq1w3X39ixY4ebqlWrpuhirp47f57bvHnzvqU/LZ316y/Lf163deMGAJDjCA91tYQJkKCX8ADQ7YkAESj9BFKrVavcs/vVt9455I5hjRs1bp5UpixAIAAgiqD4/cA7RFABQFEUAIGHnTt3nvj111++f2Pe68/+s2vXltLfQ2qhHQiQoNthFKkPRIAIFBmBGmXKVHpywqQ5A/r3v6lsUjLPczwoAQl4UdQE3etlgg48B76AH5xOJ3CCAOnnz8OWLVu2TJs27cmPly75pMgaSBcmAjoBEnSa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")
local notifications = {

    new = function(string, r, g, b)
        table.insert(data, {
            time = globals.curtime(),
            string = string,
            color = {r, g, b, 255},
            fraction = 0
        })
        local time = 5
        for i = #data, 1, -1 do
            local notif = data[i]
            if #data - i + 1 > max_notifs and notif.time + time - globals.curtime() > 0 then
                notif.time = globals.curtime() - time
            end
        end
    end,

    render = function()
        local x, y = client.screen_size()
        local to_remove = {}
        local Offset = 0
        for i = 1, #data do
            local notif = data[i]
    
            local data = {rounding = 4, size = 2, glow = 1, time = 4}  -- Decrease size and glow values
    
            if notif.time + data.time - globals.curtime() > 0 then
                notif.fraction = func.clamp(notif.fraction + globals.frametime() / anim_time, 0, 1)
            else
                notif.fraction = func.clamp(notif.fraction - globals.frametime() / anim_time, 0, 1)
            end
    
            if notif.fraction <= 0 and notif.time + data.time - globals.curtime() <= 0 then
                table.insert(to_remove, i)
            end
            local fraction = func.easeInOut(notif.fraction)
    
            local r, g, b, a = unpack(notif.color)
            local string = color_text(notif.string, r, g, b, a * fraction)
    
            local strw, strh = renderer.measure_text("", string)
            local strw2 = renderer.measure_text("b", "      ")
    
            local paddingx, paddingy = 5, data.size * 2  -- Decrease padding values
            local offsetY = ui.get(menu.visualsTab.logOffset)
    
            Offset = Offset + (strh + paddingy * 2 + math.sqrt(data.glow / 10) * 10 + 3) * fraction
    
            -- Draw the icon in its own box
            local icon_x = x / 2 - (strw + strw2) / 2 - paddingx - 20  -- Adjusted position for icon
            local icon_y = y - offsetY - strh / 2 - paddingy - Offset
            local icon_width = 20
            local icon_height = 20
    
            glow_module(icon_x - 5, icon_y - 5, icon_width + 10, icon_height + 10, data.glow, data.rounding, {r, g, b, 45 * fraction}, {25, 25, 25, 140 * fraction})
    
            local icon = images.load_png(icon, 8, 8)
            icon:draw(icon_x, icon_y, icon_width, icon_height, r, g, b, 255 * fraction, "f")
    
            -- Draw the text next to the icon
            local text_x = x / 2 - (strw + strw2) / 2
            local text_y = y - offsetY - Offset
            glow_module(text_x - paddingx, text_y - paddingy, strw + strw2 + paddingx * 2, strh + paddingy * 2, data.glow, data.rounding, {r, g, b, 45 * fraction}, {25, 25, 25, 140 * fraction})
            renderer.text(text_x + icon_width + paddingx, text_y, 255, 255, 255, 255 * fraction, "c", 0, string)
        end
    end
    
    
}
local function onHit(e)
    local group = vars.hitgroup_names[e.hitgroup + 1] or '?'
	local r, g, b, a = ui.get(menu.visualsTab.logsClr)
	notifications.new(string.format("Hit %s's $%s$ for $%d$ damage", entity.get_player_name(e.target), group:lower(), e.damage, entity.get_prop(e.target, 'm_iHealth')), r, g, b) 

end

local function onMiss(e)
    local group = vars.hitgroup_names[e.hitgroup + 1] or '?'
    local ping = math.min(999, client.real_latency() * 1000)
    local ping_col = (ping >= 100) and { 255, 0, 0 } or { 150, 200, 60 }
    local hc = math.floor(e.hit_chance + 0.5);
    local hc_col = (hc < ui.get(refs.hitChance)) and { 255, 0, 0 } or { 150, 200, 60 };
    e.reason = e.reason == "?" and "resolver" or e.reason
	notifications.new(string.format("Missed %s's $%s$ due to $%s$", entity.get_player_name(e.target), group:lower(), e.reason), 255, 120, 120)
    notifications.new("Changed [$'jitter'$] due to shot missed", 255, 120, 120)

end

client.set_event_callback("client_disconnect", function()  notifications.clear() end)
client.set_event_callback("level_init", function() notifications.clear() end)
client.set_event_callback('player_connect_full', function(e) if client.userid_to_entindex(e.userid) == entity.get_local_player() then notifications.clear() end end)
-- @region NOTIFICATION_ANIM end

-- @region AA_CALLBACKS start
local aa = {
	ignore = false,
	manualAA= 0,
	input = 0,
}
client.set_event_callback("player_connect_full", function() 
	aa.ignore = false
	aa.manualAA= 0
	aa.input = 0
end) 

local current_tick = func.time_to_ticks(globals.realtime())
client.set_event_callback("setup_command", function(cmd)
    vars.localPlayer = entity.get_local_player()
    if ui.get(menu.miscTab.clanTag) then
        if clanTag == nil then
            clanTag = true
        end
		local clan_tag = clantag("syphonic-cracked", {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 11, 11, 11, 11, 11, 11, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22})
		if clan_tag ~= clan_tag_prev then
			client.set_clan_tag(clan_tag)
		end
		clan_tag_prev = clan_tag
    elseif clanTag == true then
        client.set_clan_tag("")
        clanTag = false
    end

    if not vars.localPlayer  or not entity.is_alive(vars.localPlayer) then return end
	local flags = entity.get_prop(vars.localPlayer, "m_fFlags")
    local onground = bit.band(flags, 1) ~= 0 and cmd.in_jump == 0
	local valve = entity.get_prop(entity.get_game_rules(), "m_bIsValveDS")
	local origin = vector(entity.get_prop(vars.localPlayer, "m_vecOrigin"))
	local velocity = vector(entity.get_prop(vars.localPlayer, "m_vecVelocity"))
	local camera = vector(client.camera_angles())
	local eye = vector(client.eye_position())
	local speed = math.sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y) + (velocity.z * velocity.z))
    local weapon = entity.get_player_weapon()
	local pStill = math.sqrt(velocity.x ^ 2 + velocity.y ^ 2) < 5
    local bodyYaw = entity.get_prop(vars.localPlayer, "m_flPoseParameter", 11) * 120 - 60

    local isSlow = ui.get(refs.slow[1]) and ui.get(refs.slow[2])
	local isOs = ui.get(refs.os[1]) and ui.get(refs.os[2])
	local isFd = ui.get(refs.fakeDuck)
	local isDt = ui.get(refs.dt[1]) and ui.get(refs.dt[2])
    local isLegitAA = ui.get(menu.miscTab.legitAAHotkey)

    local manualsOverFs = ui.get(menu.miscTab.manualsOverFs) == true and true or false

    
    -- search for states
    vars.pState = 1
    if pStill then vars.pState = 2 end
    if not pStill then vars.pState = 3 end
    if isSlow then vars.pState = 4 end
    if entity.get_prop(vars.localPlayer, "m_flDuckAmount") > 0.1 then vars.pState = 5 end
    if not onground then vars.pState = 6 end
    if not onground and entity.get_prop(vars.localPlayer, "m_flDuckAmount") > 0.1 then vars.pState = 7 end

    if ui.get(aaBuilder[vars.pState].enableState) == false and vars.pState ~= 1 then
        vars.pState = 1
    end

    local nextAttack = entity.get_prop(vars.localPlayer, "m_flNextAttack")
    local nextPrimaryAttack = entity.get_prop(entity.get_player_weapon(vars.localPlayer), "m_flNextPrimaryAttack")
    local dtActive = false
    local isFl = ui.get(ui.reference("AA", "Fake lag", "Enabled"))
    if nextPrimaryAttack ~= nil then
        dtActive = not (math.max(nextPrimaryAttack, nextAttack) > globals.curtime())
    end

    -- apply antiaim set
    local side = bodyYaw > 0 and 1 or -1

        -- manual aa
        if ui.get(menu.aaTab.manuals) ~= "Off" then
            ui.set(menu.aaTab.manualTab.manualLeft, "On hotkey")
            ui.set(menu.aaTab.manualTab.manualRight, "On hotkey")
            ui.set(menu.aaTab.manualTab.manualForward, "On hotkey")
            if aa.input + 0.22 < globals.curtime() then
                if aa.manualAA == 0 then
                    if ui.get(menu.aaTab.manualTab.manualLeft) then
                        aa.manualAA = 1
                        aa.input = globals.curtime()
                    elseif ui.get(menu.aaTab.manualTab.manualRight) then
                        aa.manualAA = 2
                        aa.input = globals.curtime()
                    elseif ui.get(menu.aaTab.manualTab.manualForward) then
                        aa.manualAA = 3
                        aa.input = globals.curtime()
                    end
                elseif aa.manualAA == 1 then
                    if ui.get(menu.aaTab.manualTab.manualRight) then
                        aa.manualAA = 2
                        aa.input = globals.curtime()
                    elseif ui.get(menu.aaTab.manualTab.manualForward) then
                        aa.manualAA = 3
                        aa.input = globals.curtime()
                    elseif ui.get(menu.aaTab.manualTab.manualLeft) then
                        aa.manualAA = 0
                        aa.input = globals.curtime()
                    end
                elseif aa.manualAA == 2 then
                    if ui.get(menu.aaTab.manualTab.manualLeft) then
                        aa.manualAA = 1
                        aa.input = globals.curtime()
                    elseif ui.get(menu.aaTab.manualTab.manualForward) then
                        aa.manualAA = 3
                        aa.input = globals.curtime()
                    elseif ui.get(menu.aaTab.manualTab.manualRight) then
                        aa.manualAA = 0
                        aa.input = globals.curtime()
                    end
                elseif aa.manualAA == 3 then
                    if ui.get(menu.aaTab.manualTab.manualForward) then
                        aa.manualAA = 0
                        aa.input = globals.curtime()
                    elseif ui.get(menu.aaTab.manualTab.manualLeft) then
                        aa.manualAA = 1
                        aa.input = globals.curtime()
                    elseif ui.get(menu.aaTab.manualTab.manualRight) then
                        aa.manualAA = 2
                        aa.input = globals.curtime()
                    end
                end
            end
            if aa.manualAA == 1 or aa.manualAA == 2 or aa.manualAA == 3 then
                aa.ignore = true

                if ui.get(menu.aaTab.manuals) == "Static" then
                    ui.set(refs.yawJitter[1], "Off")
                    ui.set(refs.yawJitter[2], 0)
                    ui.set(refs.bodyYaw[1], "Static")
                    ui.set(refs.bodyYaw[2], -180)

                    if aa.manualAA == 1 then
                        ui.set(refs.yawBase, "local view")
                        ui.set(refs.yaw[1], "180")
                        ui.set(refs.yaw[2], -90)
                    elseif aa.manualAA == 2 then
                        ui.set(refs.yawBase, "local view")
                        ui.set(refs.yaw[1], "180")
                        ui.set(refs.yaw[2], 90)
                    elseif aa.manualAA == 3 then
                        ui.set(refs.yawBase, "local view")
                        ui.set(refs.yaw[1], "180")
                        ui.set(refs.yaw[2], 180)
                    end
                elseif ui.get(menu.aaTab.manuals) == "Default" and ui.get(aaBuilder[vars.pState].enableState) then
                    if ui.get(aaBuilder[vars.pState].yawJitter) == "3-Way" then
                        ui.set(refs.yawJitter[1], "Center")
                        ui.set(refs.yawJitter[2], (side == 1 and ui.get(aaBuilder[vars.pState].yawJitterLeft)*math.random(-1, 1)  or ui.get(aaBuilder[vars.pState].yawJitterRight)*math.random(-1, 1) ))
                    elseif ui.get(aaBuilder[vars.pState].yawJitter) == "L&R" then
                        ui.set(refs.yawJitter[1], "Center")
                        ui.set(refs.yawJitter[2], (side == 1 and ui.get(aaBuilder[vars.pState].yawJitterLeft) or ui.get(aaBuilder[vars.pState].yawJitterRight)))
                    else
                        ui.set(refs.yawJitter[1], ui.get(aaBuilder[vars.pState].yawJitter))
                        ui.set(refs.yawJitter[2], ui.get(aaBuilder[vars.pState].yawJitterStatic))
                    end

                    ui.set(refs.bodyYaw[1], "Static")
                    ui.set(refs.bodyYaw[2], -180)

                    if aa.manualAA == 1 then
                        ui.set(refs.yawBase, "local view")
                        ui.set(refs.yaw[1], "180")
                        ui.set(refs.yaw[2], -90)
                    elseif aa.manualAA == 2 then
                        ui.set(refs.yawBase, "local view")
                        ui.set(refs.yaw[1], "180")
                        ui.set(refs.yaw[2], 90)
                    elseif aa.manualAA == 3 then
                        ui.set(refs.yawBase, "local view")
                        ui.set(refs.yaw[1], "180")
                        ui.set(refs.yaw[2], 180)
                    end
                end
            else
                aa.ignore = false
            end
        else
            aa.ignore = false
            aa.manualAA= 0
            aa.input = 0
        end

    if not ui.get(menu.miscTab.legitAAHotkey) and aa.ignore == false then
        if ui.get(aaBuilder[vars.pState].enableState) then

            cmd.force_defensive = ui.get(aaBuilder[vars.pState].forceDefensive)

            if ui.get(aaBuilder[vars.pState].pitch) ~= "Custom" then
                ui.set(refs.pitch[1], ui.get(aaBuilder[vars.pState].pitch))
            else
                ui.set(refs.pitch[1], ui.get(aaBuilder[vars.pState].pitch))
                ui.set(refs.pitch[2], ui.get(aaBuilder[vars.pState].pitchSlider))
            end

            ui.set(refs.yawBase, ui.get(aaBuilder[vars.pState].yawBase))

            local switch = false
            if ui.get(aaBuilder[vars.pState].yaw) == "Slow Yaw" then
                ui.set(refs.yaw[1], "180")
                local switch_ticks = func.time_to_ticks(globals.realtime()) - current_tick
            
                if switch_ticks * 2 >= 3 then
                    switch = true
                else
                    switch = false
                end
                if switch_ticks >= 3 then
                    current_tick = func.time_to_ticks(globals.realtime())
                end
                ui.set(refs.yaw[2], switch and ui.get(aaBuilder[vars.pState].yawRight) or ui.get(aaBuilder[vars.pState].yawLeft))
            elseif ui.get(aaBuilder[vars.pState].yaw) == "L&R" then
                ui.set(refs.yaw[1], "180")
                ui.set(refs.yaw[2],(side == 1 and ui.get(aaBuilder[vars.pState].yawLeft) or ui.get(aaBuilder[vars.pState].yawRight)))
            else
                ui.set(refs.yaw[1], ui.get(aaBuilder[vars.pState].yaw))
                ui.set(refs.yaw[2], ui.get(aaBuilder[vars.pState].yawStatic))
            end


            if ui.get(aaBuilder[vars.pState].yawJitter) == "3-Way" then
                ui.set(refs.yawJitter[1], "Center")
                local ways = {
                    ui.get(aaBuilder[vars.pState].wayFirst),
                    ui.get(aaBuilder[vars.pState].waySecond),
                    ui.get(aaBuilder[vars.pState].wayThird)
                }
                    ui.set(refs.yawJitter[2], ways[(globals.tickcount()%3) + 1])
            elseif ui.get(aaBuilder[vars.pState].yawJitter) == "L&R" then 
                ui.set(refs.yawJitter[1], "Center")
                ui.set(refs.yawJitter[2], (side == 1 and ui.get(aaBuilder[vars.pState].yawJitterLeft) or ui.get(aaBuilder[vars.pState].yawJitterRight)))
            else
                ui.set(refs.yawJitter[1], ui.get(aaBuilder[vars.pState].yawJitter))
                ui.set(refs.yawJitter[2], ui.get(aaBuilder[vars.pState].yawJitterStatic))
            end

            ui.set(refs.bodyYaw[1], ui.get(aaBuilder[vars.pState].bodyYaw))
            ui.set(refs.bodyYaw[2], (ui.get(aaBuilder[vars.pState].bodyYawStatic)))
            ui.set(refs.fsBodyYaw, false)
        elseif not ui.get(aaBuilder[vars.pState].enableState) then
            ui.set(refs.pitch[1], "Off")
            ui.set(refs.yawBase, "Local view")
            ui.set(refs.yaw[1], "Off")
            ui.set(refs.yaw[2], 0)
            ui.set(refs.yawJitter[1], "Off")
            ui.set(refs.yawJitter[2], 0)
            ui.set(refs.bodyYaw[1], "Off")
            ui.set(refs.bodyYaw[2], 0)
            ui.set(refs.fsBodyYaw, false)
            ui.set(refs.edgeYaw, false)
            ui.set(refs.roll, 0)
        end
    elseif ui.get(menu.aaTab.legitAAHotkey) and aa.ignore == false then
        if entity.get_classname(entity.get_player_weapon(vars.localPlayer)) == "CC4" then 
            return 
        end
    
        local should_disable = false
        local planted_bomb = entity.get_all("CPlantedC4")[1]
    
        if planted_bomb ~= nil then
            bomb_distance = vector(entity.get_origin(vars.localPlayer)):dist(vector(entity.get_origin(planted_bomb)))
            
            if bomb_distance <= 64 and entity.get_prop(vars.localPlayer, "m_iTeamNum") == 3 then
                should_disable = true
            end
        end
    
        local pitch, yaw = client.camera_angles()
        local direct_vec = vector(func.vec_angles(pitch, yaw))
    
        local eye_pos = vector(client.eye_position())
        local fraction, ent = client.trace_line(vars.localPlayer, eye_pos.x, eye_pos.y, eye_pos.z, eye_pos.x + (direct_vec.x * 8192), eye_pos.y + (direct_vec.y * 8192), eye_pos.z + (direct_vec.z * 8192))
    
        if ent ~= nil and ent ~= -1 then
            if entity.get_classname(ent) == "CPropDoorRotating" then
                should_disable = true
            elseif entity.get_classname(ent) == "CHostage" then
                should_disable = true
            end
        end
        
        if should_disable ~= true and cmd.in_use == 1 then
            ui.set(refs.pitch[1], "Off")
            ui.set(refs.yawBase, "Local view")
            ui.set(refs.yaw[1], "Off")
            ui.set(refs.yaw[2], 0)
            ui.set(refs.yawJitter[1], "Off")
            ui.set(refs.yawJitter[2], 0)
            ui.set(refs.bodyYaw[1], "Opposite")
            ui.set(refs.fsBodyYaw, true)
            ui.set(refs.edgeYaw, false)
            ui.set(refs.roll, 0)
    
            cmd.in_use = 0
            cmd.roll = 0
        end
    end

    -- fix hideshots

	if ui.get(menu.miscTab.fixHideshots) then
		if isOs and not isDt and not isFd then
            if not hsSaved then
                hsValue = ui.get(refs.fakeLag[1])
                hsSaved = true
            end
			ui.set(refs.fakeLag[1], 1)
		elseif hsSaved then
			ui.set(refs.fakeLag[1], hsValue)
            hsSaved = false
		end
	end

    -- Avoid backstab
    if ui.get(menu.miscTab.avoidBackstab) ~= 0 then
        local players = entity.get_players(true)
        for i=1, #players do
            local x, y, z = entity.get_prop(players[i], "m_vecOrigin")
            local distance = func.findDist(origin.x, origin.y, origin.z, x, y, z)
            local weapon = entity.get_player_weapon(players[i])
            if entity.get_classname(weapon) == "CKnife" and distance <= ui.get(menu.aaTab.avoidBackstab) then
                ui.set(refs.yaw[2], 180)
                ui.set(refs.pitch[1], "Off")
            end
        end
    end

    -- freestand
    if ( ui.get(menu.miscTab.freestandHotkey)) then
        if manualsOverFs == true and aa.ignore == true then
            ui.set(refs.freeStand[2], "On hotkey")
            return
        else
            ui.set(refs.freeStand[2], "Always on")
            ui.set(refs.freeStand[1], true)
        end
    else
        ui.set(refs.freeStand[1], false)
        ui.set(refs.freeStand[2], "On hotkey")
    end

    -- dt discharge
    if ui.get(menu.miscTab.dtDischarge) then
        if dtEnabled == nil then
            dtEnabled = true
        end
        local enemies = entity.get_players(true)
        local vis = false
        local health = entity.get_prop(vars.localPlayer, "m_iHealth")
        for i=1, #enemies do
            local entindex = enemies[i]
            local body_x,body_y,body_z = entity.hitbox_position(entindex, 1)
            if client.visible(body_x, body_y, body_z + 20) then
                vis = true
            end
        end	

        if vis then
            ui.set(refs.dt[1],false)
            client.delay_call(0.01, function() 
                ui.set(refs.dt[1],true)
            end)
        end
    else
        if dtEnabled == true then
            ui.set(refs.dt[1], dtEnabled)
            dtEnabled = false
        end
    end
    
    -- fast ladder
    if ui.get(menu.miscTab.fastLadderEnabled) then
        local pitch, yaw = client.camera_angles()
        if entity.get_prop(vars.localPlayer, "m_MoveType") == 9 then
            cmd.yaw = math.floor(cmd.yaw+0.5)
            cmd.roll = 0
    
            if func.table_contains(ui.get(menu.miscTab.fastLadder), "Ascending") then
                if cmd.forwardmove > 0 then
                    if pitch < 45 then
                        cmd.pitch = 89
                        cmd.in_moveright = 1
                        cmd.in_moveleft = 0
                        cmd.in_forward = 0
                        cmd.in_back = 1
                        if cmd.sidemove == 0 then
                            cmd.yaw = cmd.yaw + 90
                        end
                        if cmd.sidemove < 0 then
                            cmd.yaw = cmd.yaw + 150
                        end
                        if cmd.sidemove > 0 then
                            cmd.yaw = cmd.yaw + 30
                        end
                    end 
                end
            end
            if func.table_contains(ui.get(menu.miscTab.fastLadder), "Descending") then
                if cmd.forwardmove < 0 then
                    cmd.pitch = 89
                    cmd.in_moveleft = 1
                    cmd.in_moveright = 0
                    cmd.in_forward = 1
                    cmd.in_back = 0
                    if cmd.sidemove == 0 then
                        cmd.yaw = cmd.yaw + 90
                    end
                    if cmd.sidemove > 0 then
                        cmd.yaw = cmd.yaw + 150
                    end
                    if cmd.sidemove < 0 then
                        cmd.yaw = cmd.yaw + 30
                    end
                end
            end
        end
    end

    -- edgeyaw
    ui.set(refs.edgeYaw, ui.get(menu.miscTab.edgeYawHotkey))
    
end)

ui.set_callback(menu.miscTab.trashTalk, function() 
    local callback = ui.get(menu.miscTab.trashTalk) and client.set_event_callback or client.unset_event_callback
    callback('player_death', trashtalk)
end)

ui.set_callback(menu.visualsTab.logs, function() 
    local callback = ui.get(menu.visualsTab.logs) and client.set_event_callback or client.unset_event_callback
    callback("aim_miss", onMiss)
    callback("aim_hit", onHit)
end)

local legsSaved = false
local legsTypes = {[1] = "Off", [2] = "Always slide", [3] = "Never slide"}
local ground_ticks = 0
client.set_event_callback("pre_render", function()
    if not entity.get_local_player() then return end
    if ui.get(menu.miscTab.animationsEnabled) == false then return end
    local flags = entity.get_prop(entity.get_local_player(), "m_fFlags")
    ground_ticks = bit.band(flags, 1) == 0 and 0 or (ground_ticks < 5 and ground_ticks + 1 or ground_ticks)

    if func.table_contains(ui.get(menu.miscTab.animations), "Static legs") then
        entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 6) 
    end

    if func.table_contains(ui.get(menu.miscTab.animations), "Leg fucker") then
        if not legsSaved then
            legsSaved = ui.get(refs.legMovement)
        end
        ui.set_visible(refs.legMovement, false)
        if func.table_contains(ui.get(menu.miscTab.animations), "Leg fucker") then
            ui.set(refs.legMovement, legsTypes[math.random(1, 3)])
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 8, 0)
        end

    elseif (legsSaved == "Off" or legsSaved == "Always slide" or legsSaved == "Never slide") then
        ui.set_visible(refs.legMovement, true)
        ui.set(refs.legMovement, legsSaved)
        legsSaved = false
    end

    if func.table_contains(ui.get(menu.miscTab.animations), "0 pitch on landing") then
        ground_ticks = bit.band(flags, 1) == 1 and ground_ticks + 1 or 0

        if ground_ticks > 20 and ground_ticks < 150 then
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0.5, 12)
        end
    end

    if func.table_contains(ui.get(menu.miscTab.animations), "Allah legs") then
        entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0, 7)
    end
end)
-- @region AA_CALLBACKS end

-- @region INDICATORS start
local alpha = 0
local scopedFraction = 0

local mainIndClr = {r = 0, g = 0, b = 0, a = 0}
local dtClr = {r = 0, g = 0, b = 0, a = 0}
local chargeClr = {r = 0, g = 0, b = 0, a = 0}
local chargeInd = {w = 0, x = 0, y = 25}
local psClr = {r = 0, g = 0, b = 0, a = 0}
local dtInd = {w = 0, x = 0, y = 25}
local qpInd = {w = 0, x = 0, y = 25, a = 0}
local fdInd = {w = 0, x = 0, y = 25, a = 0}
local spInd = {w = 0, x = 0, y = 25, a = 0}
local baInd = {w = 0, x = 0, y = 25, a = 0}
local fsInd = {w = 0, x = 0, y = 25, a = 0}
local osInd = {w = 0, x = 0, y = 25, a = 0}
local psInd = {w = 0, x = 0, y = 25}
local wAlpha = 0
client.set_event_callback("paint", function()
    local local_player = entity.get_local_player()
    if local_player == nil or entity.is_alive(local_player) == false then return end
    local sizeX, sizeY = client.screen_size()
    local weapon = entity.get_player_weapon(local_player)
    local bodyYaw = entity.get_prop(local_player, "m_flPoseParameter", 11) * 120 - 60
    local side = bodyYaw > 0 and 1 or -1
    local state = "MOVING"
    local mainClr = {}
    mainClr.r, mainClr.g, mainClr.b, mainClr.a = ui.get(menu.visualsTab.indicatorsClr)
    local arrowClr = {}
    arrowClr.r, arrowClr.g, arrowClr.b, arrowClr.a = ui.get(menu.visualsTab.arrowClr)
    local fake = math.floor(antiaim_funcs.get_desync(1))

    local indicators = 0

    if ui.get(menu.visualsTab.watermark) then
        indicators = indicators + 1
        wAlpha = func.lerp(wAlpha, 255, globals.frametime() * 3)
    else
        wAlpha = func.lerp(wAlpha, 0, globals.frametime() * 11)
    end

    local watermarkClr = {}
    watermarkClr.r, watermarkClr.g, watermarkClr.b = ui.get(menu.visualsTab.watermarkClr)

   -- Modernized Lua Script
if readfile("logo.png") ~= nil then
    local mainY = 10
    -- Measure the text dimensions for positioning
    local marginX, marginY = renderer.measure_text("d", "S Y P H O N I C ")

    -- Load and draw the PNG image
    local png = images.load_png(readfile("logo.png"))
    png:draw(15, sizeY / 2 - 9, 32, 42, 255, 255, 255, wAlpha, true, "f")

    -- Render the main watermark text with dynamic color and alpha
    renderer.text(47, sizeY / 2 - 2 + mainY, watermarkClr.r, watermarkClr.g, watermarkClr.b, wAlpha, "d", nil, 
        string.format("A N C I E N T \a%s [%s]", 
            func.RGBAtoHEX(255, 255, 255, wAlpha), 
            userdata.build:upper()
        )
    )

    -- Render the username line below the watermark with custom colors
    renderer.text(47, sizeY / 2 - 4 + marginY + mainY, 255, 255, 255, wAlpha, "d", nil, 
        string.format("USER - \a%s %s", 
            func.RGBAtoHEX(watermarkClr.r, watermarkClr.g, watermarkClr.b, wAlpha), 
            userdata.username:upper()
        )
    )
end

    
    -- draw arrows
    if ui.get(menu.visualsTab.arrows) then
        if ui.get(menu.visualsTab.arrowIndicatorStyle) == "Modern" then
            alpha = (aa.manualAA == 2 or aa.manualAA == 1) and func.lerp(alpha, 255, globals.frametime() * 3) or func.lerp(alpha, 0, globals.frametime() * 11)
            renderer.text(sizeX / 2 + 45, sizeY / 2 - 2.5, aa.manualAA == 2 and arrowClr.r or 200, aa.manualAA == 2 and arrowClr.g or 200, aa.manualAA == 2 and arrowClr.b or 200, alpha, "c+", 0, '>')
            renderer.text(sizeX / 2 - 45, sizeY / 2 - 2.5, aa.manualAA == 1 and arrowClr.r or 200, aa.manualAA == 1 and arrowClr.g or 200, aa.manualAA == 1 and arrowClr.b or 200, alpha, "c+", 0, '<')
        end
    
        if ui.get(menu.visualsTab.arrowIndicatorStyle) == "Teamskeet" then
            renderer.triangle(sizeX / 2 + 55, sizeY / 2 + 2, sizeX / 2 + 42, sizeY / 2 - 7, sizeX / 2 + 42, sizeY / 2 + 11, 
            aa.manualAA == 2 and arrowClr.r or 25, 
            aa.manualAA == 2 and arrowClr.g or 25, 
            aa.manualAA == 2 and arrowClr.b or 25, 
            aa.manualAA == 2 and arrowClr.a or 160)
    
            renderer.triangle(sizeX / 2 - 55, sizeY / 2 + 2, sizeX / 2 - 42, sizeY / 2 - 7, sizeX / 2 - 42, sizeY / 2 + 11, 
            aa.manualAA == 1 and arrowClr.r or 25, 
            aa.manualAA == 1 and arrowClr.g or 25, 
            aa.manualAA == 1 and arrowClr.b or 25, 
            aa.manualAA == 1 and arrowClr.a or 160)
        
            renderer.rectangle(sizeX / 2 + 38, sizeY / 2 - 7, 2, 18, 
            bodyYaw < -10 and arrowClr.r or 25,
            bodyYaw < -10 and arrowClr.g or 25,
            bodyYaw < -10 and arrowClr.b or 25,
            bodyYaw < -10 and arrowClr.a or 160)
            renderer.rectangle(sizeX / 2 - 40, sizeY / 2 - 7, 2, 18,			
            bodyYaw > 10 and arrowClr.r or 25,
            bodyYaw > 10 and arrowClr.g or 25,
            bodyYaw > 10 and arrowClr.b or 25,
            bodyYaw > 10 and arrowClr.a or 160)
        end
    end

    -- move on scope
    local scopeLevel = entity.get_prop(weapon, 'm_zoomLevel')
    local scoped = entity.get_prop(local_player, 'm_bIsScoped') == 1
    local resumeZoom = entity.get_prop(local_player, 'm_bResumeZoom') == 1
    local isValid = weapon ~= nil and scopeLevel ~= nil
    local act = isValid and scopeLevel > 0 and scoped and not resumeZoom
    local time = globals.frametime() * 30

    if act then
        if scopedFraction < 1 then
            scopedFraction = func.lerp(scopedFraction, 1 + 0.1, time)
        else
            scopedFraction = 1
        end
    else
        scopedFraction = func.lerp(scopedFraction, 0, time)
    end

    -- draw indicators
    if ui.get(menu.visualsTab.indicators) and ui.get(menu.visualsTab.indicatorsType) ~= "-" then
        local dpi = ui.get(ui.reference("MISC", "Settings", "DPI scale")):gsub('%%', '') - 100
        local globalFlag = ui.get(menu.visualsTab.indicatorsType) == "syphonic old" and "cd-" or "cd"
        local globalMoveY = 0
        local indX, indY = renderer.measure_text(globalFlag, "DT")
        local yDefault = 16
        local indCount = 0
        indY = globalFlag == "cd-" and indY - 3 or indY - 2
    
        local isCharged = antiaim_funcs.get_double_tap()
        local isFs = ui.get(menu.miscTab.freestandHotkey)
        local isBa = ui.get(refs.forceBaim)
        local isSp = ui.get(refs.safePoint)
        local isQp = ui.get(refs.quickPeek[2])
        local isSlow = ui.get(refs.slow[1]) and ui.get(refs.slow[2])
        local isOs = ui.get(refs.os[1]) and ui.get(refs.os[2])
        local isFd = ui.get(refs.fakeDuck)
        local isDt = ui.get(refs.dt[1]) and ui.get(refs.dt[2])
    
        local state = vars.intToS[vars.pState]:upper()
    
        if func.table_contains(ui.get(menu.visualsTab.indicatorsStyle), "Name") then
            indicators = indicators + 1
            local namex, namey = renderer.measure_text(globalFlag, globalFlag == "cd-" and lua_name:upper() or lua_name:lower())
            local logo = animate_text(globals.curtime(), globalFlag == "cd-" and lua_name:upper() or lua_name:lower(), mainClr.r, mainClr.g, mainClr.b, 255)
    
            renderer.text(sizeX/2 + ((namex + 2)/2) * scopedFraction, sizeY/2 + 20 - dpi/10, 255, 255, 255, 255, globalFlag, nil, unpack(logo))
        end 
    
        if func.table_contains(ui.get(menu.visualsTab.indicatorsStyle), "State") then
            indicators = indicators + 1
            indCount = indCount + 1
            local namex, namey = renderer.measure_text(globalFlag, globalFlag == "cd-" and lua_name:upper() or lua_name:lower())
            local stateX, stateY = renderer.measure_text(globalFlag, globalFlag == "cd-" and func.hex({mainClr.r, mainClr.g, mainClr.b}) .. '%' .. func.hex({255, 255, 255}) ..  state:upper() .. func.hex({mainClr.r, mainClr.g, mainClr.b}) .. '%' or userdata.build:lower())
            local string = globalFlag == "cd-" and func.hex({mainClr.r, mainClr.g, mainClr.b}) .. '%' .. func.hex({255, 255, 255}) ..  state:upper() .. func.hex({mainClr.r, mainClr.g, mainClr.b}) .. '%' or userdata.build:lower()
            renderer.text(sizeX/2 + (stateX + 2)/2 * scopedFraction, sizeY/2 + 20 + namey/1.2, 255, 255, 255, globalFlag == "cd-" and 255 or math.sin(math.abs(-math.pi + (globals.realtime() * (1 / 0.5)) % (math.pi * 1))) * 255, globalFlag, 0, string)
        end
    
        if func.table_contains(ui.get(menu.visualsTab.indicatorsStyle), "Doubletap") then
            indicators = indicators + 1
            if isDt then 
                dtClr.a = func.lerp(dtClr.a, 255, time)
                if dtInd.y < yDefault + indY * indCount then
                    dtInd.y = func.lerp(dtInd.y, yDefault + indY * indCount + 1, time)
                else
                    dtInd.y = yDefault + indY * indCount
                end
                chargeInd.w = 0.1
                if not isCharged then
                    dtClr.r = func.lerp(dtClr.r, 222, time)
                    dtClr.g = func.lerp(dtClr.g, 55, time)
                    dtClr.b = func.lerp(dtClr.b, 55, time)
                else
                    dtClr.r = func.lerp(dtClr.r, 144, time)
                    dtClr.g = func.lerp(dtClr.g, 238, time)
                    dtClr.b = func.lerp(dtClr.b, 144, time)
                end
                indCount = indCount + 1
            elseif not isDt then 
                dtClr.a = func.lerp(dtClr.a, 0, time)
                dtInd.y = func.lerp(dtInd.y, yDefault - 5, time)
            end
    
            renderer.text(sizeX / 2 + ((renderer.measure_text(globalFlag, globalFlag == "cd-" and "DT" or "dt") + 2)/2) * scopedFraction , sizeY / 2 + dtInd.y + 13 + globalMoveY, dtClr.r, dtClr.g, dtClr.b, dtClr.a, globalFlag, dtInd.w, globalFlag == "cd-" and "DT" or "dt")
        end
    
        if func.table_contains(ui.get(menu.visualsTab.indicatorsStyle), "Hideshots") then
            indicators = indicators + 1
            if isOs then 
                osInd.a = func.lerp(osInd.a, 255, time)
                if osInd.y < yDefault + indY * indCount then
                    osInd.y = func.lerp(osInd.y, yDefault + indY * indCount + 1, time)
                else
                    osInd.y = yDefault + indY * indCount
                end
        
                indCount = indCount + 1
            elseif not isOs then
                osInd.a = func.lerp(osInd.a, 0, time)
                osInd.y = func.lerp(osInd.y, yDefault - 5, time)
            end
            renderer.text(sizeX / 2 + ((renderer.measure_text(globalFlag, globalFlag == "cd-" and "HS" or "hs") + 2)/2) * scopedFraction, sizeY / 2 + osInd.y + 13 + globalMoveY, 255, 255, 255, osInd.a, globalFlag, osInd.w, globalFlag == "cd-" and "HS" or "hs")
        end
    
        if func.table_contains(ui.get(menu.visualsTab.indicatorsStyle), "Freestand") then
            indicators = indicators + 1
            if isFs then 
                fsInd.a = func.lerp(fsInd.a, 255, time)
                if fsInd.y < yDefault + indY * indCount then
                    fsInd.y = func.lerp(fsInd.y, yDefault + indY * indCount + 1, time)
                else
                    fsInd.y = yDefault + indY * indCount
                end
                indCount = indCount + 1
            elseif not isFs then 
                fsInd.a = func.lerp(fsInd.a, 0, time)
                fsInd.y = func.lerp(fsInd.y, yDefault - 5, time)
            end
            renderer.text(sizeX / 2 + fsInd.x + ((renderer.measure_text(globalFlag, globalFlag == "cd-" and "FS" or "fs") + 2)/2) * scopedFraction, sizeY / 2 + fsInd.y + 13 + globalMoveY, 255, 255, 255, fsInd.a, globalFlag, fsInd.w, globalFlag == "cd-" and "FS" or "fs")
        end
    
        if func.table_contains(ui.get(menu.visualsTab.indicatorsStyle), "Safepoint") then
            indicators = indicators + 1
            if isSp then 
                spInd.a = func.lerp(spInd.a, 255, time)
                if spInd.y < yDefault + indY * indCount then
                    spInd.y = func.lerp(spInd.y, yDefault + indY * indCount + 1, time)
                else
                    spInd.y = yDefault + indY * indCount
                end
                indCount = indCount + 1
            elseif not isSp then 
                spInd.a = func.lerp(spInd.a, 0, time)
                spInd.y = func.lerp(spInd.y, yDefault - 5, time)
            end
            renderer.text(sizeX / 2 + ((renderer.measure_text(globalFlag, globalFlag == "cd-" and "SP" or "sp") + 2)/2) * scopedFraction, sizeY / 2 + spInd.y + 13 + globalMoveY, 255, 255, 255, spInd.a, globalFlag, 0, globalFlag == "cd-" and "SP" or "sp")
        end
    
        if func.table_contains(ui.get(menu.visualsTab.indicatorsStyle), "Body aim") then
            indicators = indicators + 1
            if isBa then
                baInd.a = func.lerp(baInd.a, 255, time)
                if baInd.y < yDefault + indY * indCount then
                    baInd.y = func.lerp(baInd.y, yDefault + indY * indCount + 1, time)
                else
                    baInd.y = yDefault + indY * indCount
                end
                indCount = indCount + 1
            elseif not isBa then 
                baInd.a = func.lerp(baInd.a, 0, time)
                baInd.y = func.lerp(baInd.y, yDefault - 5, time)
            end
            renderer.text(sizeX / 2 + ((renderer.measure_text(globalFlag, globalFlag == "cd-" and "BA" or "ba") + 2)/2) * scopedFraction, sizeY / 2 + baInd.y + 13 + globalMoveY, 255, 255, 255, baInd.a, globalFlag, 0, globalFlag == "cd-" and "BA" or "ba")
        end
    
        if func.table_contains(ui.get(menu.visualsTab.indicatorsStyle), "Fakeduck") then
            indicators = indicators + 1
            if isFd then
                fdInd.a = func.lerp(fdInd.a, 255, time)
                if fdInd.y < yDefault + indY * indCount then
                    fdInd.y = func.lerp(fdInd.y, yDefault + indY * indCount + 1, time)
                else
                    fdInd.y = yDefault + indY * indCount
                end
                indCount = indCount + 1
            elseif not isFd then 
                fdInd.a = func.lerp(fdInd.a, 0, time)
                fdInd.y = func.lerp(fdInd.y, yDefault - 5, time)
            end
            renderer.text(sizeX / 2 + ((renderer.measure_text(globalFlag, globalFlag == "cd-" and "FD" or "fd") + 2)/2) * scopedFraction, sizeY / 2 + fdInd.y + 13 + globalMoveY, 255, 255, 255, fdInd.a, globalFlag, 0, globalFlag == "cd-" and "FD" or "fd")
        end
    end

    -- draw dmg indicator
    if ui.get(menu.visualsTab.minDmgIndicator) and entity.get_classname(weapon) ~= "CKnife" and ui.get(refs.dmgOverride[1]) and ui.get(refs.dmgOverride[2]) then
        local dmg = ui.get(refs.dmgOverride[3])
        renderer.text(sizeX / 2 + 3, sizeY / 2 - 15, 255, 255, 255, 255, "", 0, dmg)
    end

    -- draw watermark
    if indicators == 0 then
        local watermarkX, watermarkY = renderer.measure_text("c", "dsc.gg/crackedbybianca")
        glow_module(sizeX - 58 - watermarkX/2, 10, watermarkX - 3, 0, 10, 0, {255, 255, 255, 100 * math.abs(math.cos(globals.curtime()*2))}, {255, 255, 255, 100 * math.abs(math.cos(globals.curtime()*2))})
        renderer.text(sizeX - 60, 10,  mainClr.r, mainClr.g, mainClr.b, 255, "c", 0, func.hex({255, 255, 255}) .. "dsc.gg/" .. func.hex({210, 166, 255}) .. "antiaimbot")
    end

    -- draw logs
    local call_back = ui.get(menu.visualsTab.logs) and client.set_event_callback or client.unset_event_callback

    notifications.render()
end)
-- @region INDICATORS end

-- @region UI_CALLBACKS start
ui.update(menu.configTab.list,getConfigList())
if database.read(lua.database.configs) == nil then
    database.write(lua.database.configs, {})
end
ui.set(menu.configTab.name, #database.read(lua.database.configs) == 0 and "" or database.read(lua.database.configs)[ui.get(menu.configTab.list)+1].name)
ui.set_callback(menu.configTab.list, function(value)
    local protected = function()
        if value == nil then return end
        local name = ""
    
        local configs = getConfigList()
        if configs == nil then return end
    
        name = configs[ui.get(value)+1] or ""
    
        ui.set(menu.configTab.name, name)
    end

    if pcall(protected) then

    end
end)

ui.set_callback(menu.configTab.load, function()
    local r, g, b = ui.get(menu.visualsTab.logsClr)
    local name = ui.get(menu.configTab.name)
    if name == "" then return end
    local protected = function()
        loadConfig(name)
    end

    if pcall(protected) then
        name = name:gsub('*', '')
        notifications.new(string.format('Successfully loaded "$%s$"', name), r, g, b)
    else
        notifications.new(string.format('Failed to load "$%s$"', name), 255, 120, 120)
    end
end)

ui.set_callback(menu.configTab.save, function()
    local r, g, b = ui.get(menu.visualsTab.logsClr)

        local name = ui.get(menu.configTab.name)
        if name == "" then return end
    
        for i, v in pairs(presets) do
            if v.name == name:gsub('*', '') then
                notifications.new(string.format('You can`t save built-in preset "$%s$"', name:gsub('*', '')), 255, 120, 120)
                return
            end
        end

        if name:match("[^%w]") ~= nil then
            notifications.new(string.format('Failed to save "$%s$" due to invalid characters', name), 255, 120, 120)
            return
        end
    local protected = function()
        saveConfig(name)
        ui.update(menu.configTab.list, getConfigList())
    end
    if pcall(protected) then
        notifications.new(string.format('Successfully saved "$%s$"', name), r, g, b)
    end
end)

ui.set_callback(menu.configTab.delete, function()
    local name = ui.get(menu.configTab.name)
    if name == "" then return end
    local r, g, b = ui.get(menu.visualsTab.logsClr)
    if deleteConfig(name) == false then
        notifications.new(string.format('Failed to delete "$%s$"', name), 255, 120, 120)
        ui.update(menu.configTab.list, getConfigList())
        return
    end

    for i, v in pairs(presets) do
        if v.name == name:gsub('*', '') then
            notifications.new(string.format('You can`t delete built-in preset "$%s$"', name:gsub('*', '')), 255, 120, 120)
            return
        end
    end

    local protected = function()
        deleteConfig(name)
    end

    if pcall(protected) then
        ui.update(menu.configTab.list, getConfigList())
        ui.set(menu.configTab.list, #presets + #database.read(lua.database.configs) - #database.read(lua.database.configs))
        ui.set(menu.configTab.name, #database.read(lua.database.configs) == 0 and "" or getConfigList()[#presets + #database.read(lua.database.configs) - #database.read(lua.database.configs)+1])
        notifications.new(string.format('Successfully deleted "$%s$"', name), r, g, b)
    end
end)

ui.set_callback(menu.configTab.import, function()
    local r, g, b = ui.get(menu.visualsTab.logsClr)

    local protected = function()
        importSettings()
    end

    if pcall(protected) then
        notifications.new(string.format('Successfully imported settings', name), r, g, b)
    else
        notifications.new(string.format('Failed to import settings', name), 255, 120, 120)
    end
end)

ui.set_callback(menu.configTab.export, function()
    local name = ui.get(menu.configTab.name)
    if name == "" then return end

    local protected = function()
        exportSettings(name)
    end
    local r, g, b = ui.get(menu.visualsTab.logsClr)
    if pcall(protected) then
        notifications.new(string.format('Successfully exported settings', name), r, g, b)
    else
        notifications.new(string.format('Failed to export settings', name), 255, 120, 120)
    end
end)
-- @region UI_CALLBACKS end

-- @region UI_RENDER start
client.set_event_callback("paint_ui", function()
    vars.activeState = vars.sToInt[ui.get(menu.builderTab.state)]
    local isEnabled = true
    local isAATab = ui.get(tabPicker) == "Anti-aim" 
    local isBuilderTab = ui.get(tabPicker) == "Builder" 
    local isVisualsTab = ui.get(tabPicker) == "Visuals" 
    local isMiscTab = ui.get(tabPicker) == "Misc" 
    local isCFGTab = ui.get(tabPicker) == "Config" 

    local aA = func.create_color_array(lua_color.r, lua_color.g, lua_color.b, "✨ syphonic cracked")
    ui.set(label, string.format("✨ \a%sS \a%sY \a%sP \a%sH \a%sO \a%sN \a%sI \a%sC", 
    func.RGBAtoHEX(unpack(aA[1])), 
    func.RGBAtoHEX(unpack(aA[2])), 
    func.RGBAtoHEX(unpack(aA[3])), 
    func.RGBAtoHEX(unpack(aA[4])), 
    func.RGBAtoHEX(unpack(aA[5])), 
    func.RGBAtoHEX(unpack(aA[6])), 
    func.RGBAtoHEX(unpack(aA[7])),
    func.RGBAtoHEX(unpack(aA[8])) 
    
))
ui.set(aaBuilder[1].enableState, true)

    for i = 1, #vars.aaStates do
        local stateEnabled = ui.get(aaBuilder[i].enableState)
        ui.set_visible(aaBuilder[i].enableState, vars.activeState == i and i~=1 and isBuilderTab and isEnabled)
        ui.set_visible(aaBuilder[i].forceDefensive, vars.activeState == i and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].pitch, vars.activeState == i and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].pitchSlider , vars.activeState == i and isBuilderTab and stateEnabled and ui.get(aaBuilder[i].pitch) == "Custom" and isEnabled)
        ui.set_visible(aaBuilder[i].yawBase, vars.activeState == i and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yaw, vars.activeState == i and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawStatic, vars.activeState == i and ui.get(aaBuilder[i].yaw) ~= "Off" and ui.get(aaBuilder[i].yaw) ~= "Slow Yaw" and ui.get(aaBuilder[i].yaw) ~= "L&R" and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawLeft, vars.activeState == i and ui.get(aaBuilder[i].yaw) ~= "Off" and (ui.get(aaBuilder[i].yaw) == "Slow Yaw" or ui.get(aaBuilder[i].yaw) == "L&R") and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawRight, vars.activeState == i and ui.get(aaBuilder[i].yaw) ~= "Off" and (ui.get(aaBuilder[i].yaw) == "Slow Yaw" or ui.get(aaBuilder[i].yaw) == "L&R") and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawJitter, vars.activeState == i and ui.get(aaBuilder[i].yaw) ~= "Off" and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].wayFirst, vars.activeState == i and ui.get(aaBuilder[i].yaw) ~= "Off" and ui.get(aaBuilder[i].yawJitter) == "3-Way"  and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].waySecond, vars.activeState == i and ui.get(aaBuilder[i].yaw) ~= "Off" and ui.get(aaBuilder[i].yawJitter) == "3-Way"  and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].wayThird, vars.activeState == i and ui.get(aaBuilder[i].yaw) ~= "Off" and ui.get(aaBuilder[i].yawJitter) == "3-Way"  and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawJitterStatic, vars.activeState == i and ui.get(aaBuilder[i].yaw) ~= "Off" and ui.get(aaBuilder[i].yawJitter) ~= "Off" and ui.get(aaBuilder[i].yawJitter) ~= "L&R" and ui.get(aaBuilder[i].yawJitter) ~= "3-Way" and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawJitterLeft, vars.activeState == i and ui.get(aaBuilder[i].yaw) ~= "Off" and ui.get(aaBuilder[i].yawJitter) == "L&R" and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].yawJitterRight, vars.activeState == i and ui.get(aaBuilder[i].yaw) ~= "Off" and ui.get(aaBuilder[i].yawJitter) == "L&R" and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].bodyYaw, vars.activeState == i and isBuilderTab and stateEnabled and isEnabled)
        ui.set_visible(aaBuilder[i].bodyYawStatic, vars.activeState == i and ui.get(aaBuilder[i].bodyYaw) ~= "Off" and ui.get(aaBuilder[i].bodyYaw) ~= "Opposite" and isBuilderTab and stateEnabled and isEnabled)
    end

    for i, feature in pairs(menu.aaTab) do
        if type(feature) ~= "table" then
            ui.set_visible(feature, isAATab and isEnabled)
        end
	end 

    for i, feature in pairs(menu.aaTab.manualTab) do
        if type(feature) ~= "table" then
            ui.set_visible(feature, isAATab and isEnabled and ui.get(menu.aaTab.manuals) ~= "Off")
        end
	end 

    for i, feature in pairs(menu.builderTab) do
		ui.set_visible(feature, isBuilderTab and isEnabled)
	end

    for i, feature in pairs(menu.visualsTab) do
        if type(feature) ~= "table" then
            ui.set_visible(feature, isVisualsTab and isEnabled)
        end
	end 
    ui.set_visible(menu.visualsTab.logOffset, ui.get(menu.visualsTab.logs) and isVisualsTab and isEnabled)
    ui.set_visible(menu.visualsTab.logsClr, ui.get(menu.visualsTab.logs) and isVisualsTab and isEnabled)
    ui.set_visible(menu.visualsTab.indicatorsStyle, ui.get(menu.visualsTab.indicatorsType) ~= "-" and ui.get(menu.visualsTab.indicators) and isVisualsTab and isEnabled)
    ui.set_visible(menu.visualsTab.indicatorsClr, ui.get(menu.visualsTab.indicators) and isVisualsTab and isEnabled)
    ui.set_visible(menu.visualsTab.indicatorsType, ui.get(menu.visualsTab.indicators) and isVisualsTab and isEnabled)
    ui.set_visible(menu.visualsTab.arrowIndicatorStyle, ui.get(menu.visualsTab.arrows) and isVisualsTab and isEnabled)
    ui.set_visible(menu.visualsTab.arrowClr, ui.get(menu.visualsTab.arrows) and isVisualsTab and isEnabled)
    ui.set_visible(menu.visualsTab.watermarkClr, ui.get(menu.visualsTab.watermark) and isVisualsTab and isEnabled)
    
    for i, feature in pairs(menu.miscTab) do
        if type(feature) ~= "table" then
            ui.set_visible(feature, isMiscTab and isEnabled)
        end
	end
    ui.set_visible(menu.miscTab.fastLadder, ui.get(menu.miscTab.fastLadderEnabled) and isMiscTab and isEnabled)
    ui.set_visible(menu.miscTab.animations, ui.get(menu.miscTab.animationsEnabled) and isMiscTab and isEnabled)

    for i, feature in pairs(menu.configTab) do
		ui.set_visible(feature, isCFGTab and isEnabled)
	end

    if not isEnabled and not saved then
        func.resetAATab()
        ui.set(refs.fsBodyYaw, isEnabled)
        ui.set(refs.enabled, isEnabled)
        saved = true
    elseif isEnabled and saved then
        ui.set(refs.fsBodyYaw, not isEnabled)
        ui.set(refs.enabled, isEnabled)
        saved = false
    end
    func.setAATab(not isEnabled)

end)
-- @region UI_RENDER end

client.set_event_callback("shutdown", function()
    if legsSaved ~= false then
        ui.set(refs.legMovement, legsSaved)
    end
    if hsValue ~= nil then
        ui.set(refs.fakeLag[1], hsValue)
    end
    if clanTag ~= nil then
        client.set_clan_tag("")
    end
    if dtSaved ~= nil then
        ui.set(refs.dt[3], "Defensive")
    end
    func.setAATab(true)
end)