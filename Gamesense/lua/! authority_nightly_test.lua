---@diagnostic disable: undefined-global, undefined-field, redefined-local, deprecated, cast-local-type
local csgo_weapons = require 'gamesense/csgo_weapons'
local c_entity = require 'gamesense/entity'
local inspect = require 'gamesense/inspect'
local msgpack = require 'gamesense/msgpack'
local clipboard = require 'gamesense/clipboard'
local base64 = require 'gamesense/base64'
local pui = require 'gamesense/pui'
local ffi = require 'ffi'
local vector = require 'vector'
local panorama = panorama.open()
local screen = vector(client.screen_size())

if not LPH_OBFUSCATED then
    LPH_JIT = function (f) return f end
    LPH_JIT_MAX = function (f) return f end
    LPH_NO_VIRTUALIZE = function (f) return f end
end

local db do
    db = {
        script = 'Authority',
        build = 'Nightly',
        optional = 'Testers',
        update = 'Developing',
        user = nil,
        current_time = nil
    }

    local config = {
        discord_links = {
            authority = 'https://discord.gg/q2nWmeYTd2',
        },
        admins = {
            ['76561198974529342'] = 'Admin',
            ['76561198140322821'] = 'Admin',
            ['76561198752550726'] = 'Admin'
        }
    }
    
    local steam_username = panorama.MyPersonaAPI.GetName()
    local current_xuid = panorama.MyPersonaAPI.GetXuid()
    local session_start = globals.realtime()
    
    db.user = config.admins[current_xuid] or (_USER_NAME or steam_username)
    
    local function open_discord(server)
        local link = config.discord_links[server] or config.discord_links.authority
        panorama.SteamOverlayAPI.OpenExternalBrowserURL(link)
    end
    
    db.open = {
        authority = function()
            open_discord('authority') 
        end,
    }
    
    db.is_admin = LPH_JIT(function()
        return config.admins[current_xuid] ~= nil
    end)
    
    db.get_xuid = LPH_JIT(function()
        return current_xuid
    end)
    
    db.get_info = LPH_JIT(function()
        return string.format('%s | %s | %s', db.script, db.user, db.build)
    end)

    db.current_time = LPH_JIT(function ()
        local elapsed = globals.realtime() - session_start
        local hours = math.floor(elapsed / 3600)
        local minutes = math.floor((elapsed % 3600) / 60)
        local seconds = math.floor(elapsed % 60)
        return string.format('%02d:%02d:%02d', hours, minutes, seconds)
    end)
end

local utils do
    utils = { }

    utils.clamp = LPH_JIT(function(value, min, max)
        return math.max(min, math.min(value, max))
    end)

    utils.round = LPH_JIT(function(num)
        return num >= 0 and math.floor(num + 0.5) or math.ceil(num - 0.5)
    end)

    utils.normalize = LPH_JIT(function(yaw, min, max)
        if min == nil then min = -180 end
        if max == nil then max = 180 end
        local d = max - min
        while yaw > max do yaw = yaw - d end
        while yaw < min do yaw = yaw + d end
        return yaw
    end)

    utils.closest_ray_point = LPH_JIT(function(p, s, e)
        local t, d = p - s, e - s
        local l = d:length()
        d = d / l
        local r = d:dot(t)
        if r < 0 then return s elseif r > l then return e end
        return s + d * r
    end)

    utils.lerp = LPH_JIT(function(start, ending, time)
        if type(ending) == 'boolean' then
            ending = ending and 1 or 0
        end

        local endlerp = start + (ending - start) * time
        return math.abs(ending - endlerp) < .01 and ending or endlerp
    end)

    utils.angle_diff = LPH_JIT(function (a, b)
       return utils.normalize(a - b, -180, 180)
    end)

    utils.vector_angles = LPH_JIT(function (x, y)
       return math.deg(math.atan2(y, x))
    end)

    utils.angle_to_positive = LPH_JIT(function (yaw)
       yaw = utils.normalize(yaw, -180, 180)
       if yaw < 0 then
           yaw = yaw + 360
       end
       return yaw
    end)

    utils.get_weapon_reload = LPH_JIT(function(player)
        local new_player = c_entity(player)
        if not new_player then
            return -1
        end

        local animlayer = new_player:get_anim_overlay(1)
        if not animlayer then
            return -1
        end

        local activity = new_player:get_sequence_activity(animlayer.sequence)
        if activity == 967 and animlayer.weight ~= 0 then
            return animlayer.cycle
        else
            return -1
        end
    end)

    utils.get_enemy_flag = LPH_JIT(function(player, flag)
        if not (player and entity.is_alive(player)) then
            return false
        end

        local flags = {
            [1] = 'Helmet',
            [2] = 'Kevlar',
            [4] = 'Helmet + Kevlar',
            [8] = 'Zoom',
            [16] = 'Blind',
            [32] = 'Reload',
            [64] = 'Bomb',
            [128] = 'Vip',
            [256] = 'Defuse',
            [512] = 'Fakeduck',
            [1024] = 'Pin pulled',
            [2048] = 'Hit',
            [4096] = 'Occluded',
            [8192] = 'Exploiter',
            [131072] = 'Defensive dt'
        }

        local esp_data = entity.get_esp_data(player)
        if esp_data == nil then
            return false
        end

        local result = false

        for i, name in pairs(flags) do
            if bit.band(esp_data.flags, i) == i and name == flag then
                result = true
                break
            end
        end

        return result
    end)

    utils.get_lethal = LPH_JIT(function(me, player, check_lethal)
        if not me or not player then
            return false, nil
        end

        local active_weapon = entity.get_player_weapon(me)
        if not active_weapon then
            return false, nil
        end

        local weapon_struct = csgo_weapons(active_weapon)
        if not weapon_struct then
            return false, nil
        end

        if weapon_struct.weapon_type_int == 9 or weapon_struct.weapon_type_int == 0 then
            return false, nil
        end

        local player_origin = vector(entity.get_origin(me))
        local distance = player_origin:dist(vector(entity.get_origin(player)))
        local health = entity.get_prop(player, 'm_iHealth')
        local dmg_after_range = (weapon_struct.damage * math.pow(weapon_struct.range_modifier, (distance * 0.002))) * 1.25
        local armor = entity.get_prop(player, 'm_ArmorValue')
        local newdmg = dmg_after_range * (weapon_struct.armor_ratio * 0.5)
        if dmg_after_range - (dmg_after_range * (weapon_struct.armor_ratio * 0.5)) * 0.5 > armor then
            newdmg = dmg_after_range - (armor / 0.5)
        end

        local result = not check_lethal and newdmg * 0.5 >= health or newdmg >= health
        return result, newdmg
    end)

    utils.get_xuid = LPH_JIT(function(idx, from_userid)
        local xuid = panorama.GameStateAPI.GetPlayerXuidStringFromEntIndex(idx)
        if from_userid or not xuid then
            return panorama.GameStateAPI.GetPlayerXuidFromUserID(idx)
        end

        return xuid
    end)

    utils.get_clantag = LPH_JIT(function(xuid)
        if not panorama.GameStateAPI.IsXuidValid(xuid) then
            return ''
        end

        return panorama.GameStateAPI.GetPlayerClanTag(xuid)
    end)

    utils.closest_enemy = LPH_JIT(function ()
        local me = entity.get_local_player()
        local closest_distance, closest_enemy = math.huge, nil
        for _, enemy in ipairs(utils.get_entities()) do
            if entity.is_dormant(enemy) then goto skip end
            local eye_pos = vector(entity.get_origin(enemy))
            local distance = eye_pos:dist(vector(entity.get_origin(me)))
            if distance < closest_distance then
                closest_distance = distance
                closest_enemy = enemy
            end
            ::skip::
        end

        return closest_distance, closest_enemy
    end)

    utils.extrapolate_position = LPH_JIT(function(position, tick, player)
        if position == nil or player == nil then
            return position
        end

        tick = utils.clamp(utils.round(tonumber(tick) or 0), 0, 64)
        if tick <= 0 then
            return position
        end

        local vx, vy, vz = entity.get_prop(player, 'm_vecVelocity')
        if vx == nil then
            return position
        end

        local interval = globals.tickinterval()
        local sv_gravity = cvar.sv_gravity:get_float() * interval
        local flags = entity.get_prop(player, 'm_fFlags') or 0
        local on_ground = bit.band(flags, bit.lshift(1, 0)) ~= 0
        local p_origin, prev_origin = position, position
        local velocity = vector(vx, vy, vz or 0)

        for i = 1, tick do
            prev_origin = p_origin

            if not on_ground then
                velocity.z = velocity.z - sv_gravity
            else
                velocity.z = 0
            end

            p_origin = p_origin + velocity * interval

            local fraction = client.trace_line(-1, prev_origin.x, prev_origin.y, prev_origin.z, p_origin.x, p_origin.y, p_origin.z)
            if fraction <= 0.99 then
                return prev_origin
            end
        end

        return p_origin
    end)

    utils.get_entities = LPH_JIT(function(all)
        local max_players = globals.maxplayers() or 64
        local alive = { }
        if all then
            for i = 1, max_players do
                if entity.get_classname(i) ~= 'CCSPlayer'
                    or not entity.is_enemy(i) then
                    goto skip
                end

                alive[#alive+1] = i
                ::skip::
            end
        else
            for i = 1, max_players do
                if entity.get_classname(i) ~= 'CCSPlayer' then
                    goto skip
                end
                if not entity.is_alive(i) or not entity.is_enemy(i) then
                    goto skip
                end
                alive[#alive+1] = i
                ::skip::
            end
        end
        return alive
    end)

    local pointer = vtable_bind('client.dll', 'VClientEntityList003', 3, 'void*(__thiscall*)(void*, int)')
    utils.get_simtime = LPH_JIT(function(ent_index)
        if not ent_index then
            ent_index = entity.get_local_player()
        end

        local entity_ptr = pointer(ent_index)
        if entity_ptr then
            return entity.get_prop(ent_index, 'm_flSimulationTime'),
                ffi.cast('float*', ffi.cast('uintptr_t', entity_ptr) + 0x26C)[0]
        else
            return 0, 0
        end
    end)

    utils.set_callback = LPH_JIT(function(event, func, boolean)
        local fn = (boolean or boolean == nil) and
            client.set_event_callback
            or client.unset_event_callback
        fn(event, func)
    end)

    local hex_to_rgb = LPH_JIT(function(hex)
        hex = hex:gsub('#', '')
        return tonumber('0x' .. hex:sub(1, 2)), tonumber('0x' .. hex:sub(3, 4)), tonumber('0x' .. hex:sub(5, 6))
    end)

    local decompose = LPH_JIT(function(str)
        local result, len = { }, #str

        local i, j = str:find('\a', 1)

        if i == nil then
            table.insert(result, {
                str, nil
            })
        end

        if i ~= nil and i > 1 then
            table.insert(result, {
                str:sub(1, i - 1), nil
            })
        end

        while i ~= nil do
            local hex = nil

            if str:sub(j + 1, j + 7) == 'DEFAULT' then
                j = j + 8
            else
                hex = str:sub(j + 1, j + 8)
                j = j + 9
            end

            local m, n = str:find('\a', j + 1)

            if m == nil then
                if j <= len then
                    table.insert(result, {
                        str:sub(j), hex
                    })
                end

                break
            end

            table.insert(result, {
                str:sub(j, m - 1), hex
            })

            i, j = m, n
        end

        return result
    end)

    utils.text_fmt_color = LPH_JIT(function(str)
        local list = decompose(str)
        local len = #list

        return list, len
    end)

    utils.print = LPH_JIT(function(text)
        local list, count = utils.text_fmt_color(text)

        for i = 1, count do
            local value = list[i]

            local str = value[1]
            local hex = value[2]

            if i ~= count then
                str = str .. '\0'
            end

            if hex == nil then
                client.color_log(
                    217, 217, 217, str
                )

                goto continue
            end

            local hex_r, hex_g, hex_b = hex_to_rgb(hex)

            client.color_log(
                hex_r, hex_g, hex_b, str
            )

            ::continue::
        end
    end)

    utils.uppername = LPH_JIT(function(string)
        if not string or #string <= 0 then return string end
        return string.upper(string:sub(1, 1)) .. string:sub(2)
    end)

    utils.random_int = LPH_JIT(function(min, max)
        if min > max then
            min, max = max, min
        end

        return client.random_int(min, max)
    end)

    utils.random_float = LPH_JIT(function(min, max)
        if min > max then
            min, max = max, min
        end

        return client.random_float(min, max)
    end)
end

local ref = {
    ragebot = {
        enabled = { pui.reference('rage', 'aimbot', 'enabled') },
        weapon_type = pui.reference('rage', 'weapon type', 'weapon type'),
        stop = { pui.reference('rage', 'aimbot', 'quick stop') },
        target_selection = pui.reference('rage', 'aimbot', 'target selection'),
        target_hitbox = pui.reference('rage', 'aimbot', 'target hitbox'),
        pointscale = pui.reference('rage', 'aimbot', 'multi-point scale'),
        minimum_damage = pui.reference('rage', 'aimbot', 'minimum damage'),
        minimum_damage_override = {pui.reference('rage', 'aimbot', 'minimum damage override')},
        minimum_hitchance = pui.reference('rage', 'aimbot', 'minimum hit chance'),
        double_tap = {pui.reference('rage', 'aimbot', 'double tap')},
        double_tap_hc = pui.reference('rage', 'aimbot', 'double tap hit chance'),
        body_aim = pui.reference('rage', 'aimbot', 'force body aim'),
        body_aim_on_peek = pui.reference('rage', 'aimbot', 'force body aim on peek'),
        prefer_body_aim_disablers = pui.reference('rage', 'aimbot', 'prefer body aim disablers'),
        safe_point = pui.reference('rage', 'aimbot', 'force safe point'),
        double_tap_fl = pui.reference('rage', 'aimbot', 'double tap fake lag limit'),
        double_tap_stop = pui.reference('rage', 'aimbot', 'double tap quick stop'),
        quickpeek = {pui.reference('rage', 'other', 'quick peek assist')},
        quickpeekm = {pui.reference('rage', 'other', 'quick peek assist mode')},
        fakeduck = pui.reference('rage', 'other', 'duck peek assist'),
        log_spread = pui.reference('rage', 'other', 'log misses due to spread'),
        delay_shot = pui.reference('rage', 'other', 'delay shot'),
        accuracy_boost = pui.reference('rage', 'other', 'accuracy boost'),
        avoid_unsafe_hitboxes = pui.reference('rage', 'aimbot', 'avoid unsafe hitboxes'),
    },
    antiaim = {
        angles = {
            enabled = pui.reference('aa', 'anti-aimbot angles', 'enabled'),
            pitch = {pui.reference('aa', 'anti-aimbot angles', 'pitch')}, -- [1] = type, [2] == value
            roll = pui.reference('aa', 'anti-aimbot angles', 'roll'),
            yaw_base = pui.reference('aa', 'anti-aimbot angles', 'yaw base'),
            yaw = {pui.reference('aa', 'anti-aimbot angles', 'yaw')}, -- [1] = type, [2] == value
            freestanding_body_yaw = pui.reference('aa', 'anti-aimbot angles', 'freestanding body yaw'),
            edge_yaw = pui.reference('aa', 'anti-aimbot angles', 'edge yaw'),
            yaw_jitter = {pui.reference('aa', 'anti-aimbot angles', 'yaw jitter')}, -- [1] = type, [2] == value
            body_yaw = {pui.reference('aa', 'anti-aimbot angles', 'body yaw')}, -- [1] = type, [2] == value
            freestanding = pui.reference('aa', 'anti-aimbot angles', 'freestanding'),
        },
        fakelag = {
            on = pui.reference('aa', 'fake lag', 'enabled'),
            amount = pui.reference('aa', 'fake lag', 'amount'),
            variance = pui.reference('aa', 'fake lag', 'variance'),
            limit = pui.reference('aa', 'fake lag', 'limit'),
        },
        other = {
            on_shot_antiaim = {pui.reference('aa', 'other', 'on shot anti-aim')},
            slow_motion = {pui.reference('aa', 'other', 'slow motion')},
            fake_peek = {pui.reference('aa', 'other', 'fake peek')},
            leg_movement = pui.reference('aa', 'other', 'leg movement')
        }
    },
    visuals = {
        thirdperson = { pui.reference('visuals', 'effects', 'force third person (alive)') },
        scope = pui.reference('visuals', 'effects', 'remove scope overlay'),
        dpi = pui.reference('misc', 'settings', 'dpi scale'),
        clrmenu = pui.reference('misc', 'settings', 'menu color'),
        output = pui.reference('misc', 'miscellaneous', 'draw console output'),
        name = { pui.reference('visuals', 'player esp', 'name') },
        ping = {pui.reference('misc', 'miscellaneous', 'ping spike')},
        fov = pui.reference('misc', 'miscellaneous', 'override fov'),
        clantag = pui.reference('misc', 'miscellaneous', 'clan tag spammer'),
        dormantesp = pui.reference('visuals', 'player esp', 'dormant'),
        zfov = pui.reference('misc', 'miscellaneous', 'override zoom fov'),
        edge_jump = {pui.reference('misc', 'movement', 'jump at edge')},
    },
    misc = {
        air_strafe = pui.reference('misc', 'movement', 'air strafe'),
        anti_untrusted = pui.reference('misc', 'settings', 'anti-untrusted'),
        usercmd = pui.reference('MISC', 'Settings', 'sv_maxusrcmdprocessticks2')
    },
} do
    function ref.is_fake_duck ()
        return ref.ragebot.fakeduck:get() == true
    end

    function ref.is_slow_motion ()
        return ref.antiaim.other.slow_motion[1]:get()
            and ref.antiaim.other.slow_motion[1].hotkey:get()
    end

    function ref.is_double_tap (type)
        if type == 'key' then
            return ref.ragebot.double_tap[1].hotkey:get()
                and not ref.is_fake_duck()
        else
            return (ref.ragebot.double_tap[1].hotkey:get() and ref.ragebot.double_tap[1]:get())
                and not ref.is_fake_duck()
        end
    end

    function ref.is_on_shot_antiaim (type)
        if type == 'no dt' then
            return (ref.antiaim.other.on_shot_antiaim[1].hotkey:get() and ref.antiaim.other.on_shot_antiaim[1]:get())
                and not ref.is_fake_duck()
        else
            return (ref.antiaim.other.on_shot_antiaim[1].hotkey:get() and ref.antiaim.other.on_shot_antiaim[1]:get())
                and not ref.is_double_tap() and not ref.is_fake_duck()
        end
    end

    function ref.is_minimum_damage ()
        return ref.ragebot.minimum_damage_override[1]:get()
            and ref.ragebot.minimum_damage_override[1].hotkey:get()
    end

    function ref.is_force_baim ()
        return ref.ragebot.body_aim:get() == true
    end

    function ref.is_force_safe_point ()
        return ref.ragebot.safe_point:get() == true
    end

    function ref.is_ping_spike ()
        return ref.visuals.ping[1]:get()
            and ref.visuals.ping[1].hotkey:get()
    end

    function ref.is_quick_peek ()
        return ref.ragebot.quickpeek[1]:get()
            and ref.ragebot.quickpeek[1].hotkey:get()
    end

    defer(function()
        pui.traverse(ref.ragebot, function (item, path)
            item:override()

            if item.hotkey ~= nil then
                item.hotkey:override()
            end
        end)

        pui.traverse(ref.antiaim, function (item, path)
            item:override()
            if item.hotkey ~= nil then
                item.hotkey:override()
            end
        end)

        pui.traverse(ref.visuals, function (item, path)
            item:override()

            if item.hotkey ~= nil then
                item.hotkey:override()
            end
        end)

        pui.traverse(ref.misc, function (item, path)
            item:override()

            if item.hotkey ~= nil then
                item.hotkey:override()
            end
        end)
    end)
end

local color do -- @shizauwu
    color = { }
    function color.new(r, g, b, a)
        if type(r) == 'string' then
            local hex = r:gsub('#', '')
            if #hex == 6 then
                r = tonumber(hex:sub(1,2), 16)
                g = tonumber(hex:sub(3,4), 16)
                b = tonumber(hex:sub(5,6), 16)
                a = 255
            elseif #hex == 8 then
                r = tonumber(hex:sub(1,2), 16)
                g = tonumber(hex:sub(3,4), 16)
                b = tonumber(hex:sub(5,6), 16)
                a = tonumber(hex:sub(7,8), 16)
            else
                error('HEX error, report this and wait fix!', 2)
            end
        elseif type(r) == 'table' then
            if #r == 3 then
                r, g, b, a = tonumber(r[1]), tonumber(r[2]), tonumber(r[3]), 255
            elseif #r == 4 then
                r, g, b, a = tonumber(r[1]), tonumber(r[2]), tonumber(r[3]), tonumber(r[4])
            else
                error('Table convert color error, report this and wait fix!', 2)
            end
        end

        local self = { r, g, b, a }
        self.r = utils.clamp(tonumber(r) or 255, 0, 255)
        self.g = utils.clamp(((b == nil) and self.r or tonumber(g)) or ((g ~= nil and b == nil) and self.r or 255), 0, 255)
        self.b = utils.clamp(tonumber(b) or ((g ~= nil) and self.r or 255), 0, 255)
        self.a = utils.clamp(tonumber(a) or ((g ~= nil and b == nil) and g or 255), 0, 255)

        setmetatable(self, {
            __index = color,
        })

        return self
    end

    function color:unpack()
        return self.r, self.g, self.b, self.a
    end

    function color:clone()
        return color.new(self.r, self.g, self.b, self.a)
    end

    function color:to_hex()
        return string.format('%02X%02X%02X%02X', self.r, self.g, self.b, self.a)
    end

    function color:lerp(second_color, anim)
        if type(anim) == 'boolean' then
            anim = anim and 1 or 0
        end

        anim = utils.clamp(anim, 0, 1)
        return color.new(
            utils.round(utils.lerp(self.r, second_color.r, anim)),
            utils.round(utils.lerp(self.g, second_color.g, anim)),
            utils.round(utils.lerp(self.b, second_color.b, anim)),
            utils.round(utils.lerp(self.a, second_color.a, anim))
        )
    end

    function color:new_alpha(value)
        return color.new(self.r, self.g, self.b, utils.clamp(value, 0, 255))
    end
end

local render do 
    render = {
        measure_text = function(flags, text)
            return vector(renderer.measure_text(flags, text))
        end,
        world_to_screen = function(position)
            return vector(renderer.world_to_screen(position.x, position.y, position.z))
        end,
        text = function(position, color, flags, max_width, text)
            if type(text) ~= 'string' then
                text = tostring(text)
            end

            if #text <= 0 or color.a <= 0 then
                return
            end

            local function hex_alpha_detector(change_text, new_alpha)
                local alpha = string.format('%02X', new_alpha)
                local function replace_color(hex)
                    local r, g, b, a = hex:match('(%x%x)(%x%x)(%x%x)(%x?%x?)')
                    if r and g and b then
                        a = (a ~= '' and a or 'FF')
                        return string.format('%s%s%s%s', r, g, b, alpha)
                    end

                    return hex
                end

                local reworked_text = change_text:gsub('\a(%x%x%x%x%x%x%x?%x?)', function(hex)
                    return '\a' .. replace_color(hex)
                end)

                return reworked_text
            end

            renderer.text(position.x, position.y, color.r, color.g, color.b, color.a, flags, max_width or 0, hex_alpha_detector(text, color.a))
        end,
        gradient_text = (function(text, clock, color1, color2, effect)
            if not text or text == '' then
                return ''
            end
        
            local buffer = { }

            if effect then
                local text_length = #text
                local speed = 1.5

                local t = clock % 2
                t = t > 1 and 2 - t or t

                local center_pos = t * (text_length - 1)

                local chars = { }
                for c in text:gmatch('.[\128-\191]*') do
                    table.insert(chars, c)
                end

                for i = 1, #chars do
                    local distance = math.abs((i - 1) - center_pos)
                    local gradient_t = math.min(distance / (text_length - 1), 1)

                    local new_color = color1:lerp(color2, gradient_t)
                    buffer[#buffer + 1] = '\a' .. new_color:to_hex() .. chars[i]
                end
            else
                local div = #text > 1 and 1 / (#text - 1) or 1
                for char in text:gmatch('.[\128-\191]*') do
                    local t = clock % 2
                    t = t > 1 and 2 - t or t

                    local new_color = color1:lerp(color2, t)
                    buffer[#buffer + 1] = '\a' .. new_color:to_hex() .. char
                    clock = clock + div
                end
            end
        
            return table.concat(buffer)
        end),
        blur = function(position, resolution, alpha, amount)
            if resolution.x <= 0 then
                return
            end

            renderer.blur(position.x, position.y, resolution.x, resolution.y, alpha, amount)
        end,
        line = function(position, second_position, color)
            if color.a <= 0 then
                return
            end

            renderer.line(position.x, position.y, second_position.x, second_position.y, color.r, color.g, color.b, color.a)
        end,
        texture = function(texture, position, resolution, color, mode)
            if color.a <= 0 then
                return
            end

            renderer.texture(texture, position.x, position.y, resolution.x, resolution.y, color.r, color.g, color.b, color.a, mode or '')
        end,
        indicator = function(color, ...)
            if color.a <= 0 then
                return
            end

            renderer.indicator(color.r, color.g, color.b, color.a, ...)
        end,
        gradient = function(position, resolution, color, second_color, direction)
            if color.a <= 0 and second_color.a <= 0 or resolution.x <= 0 then
                return
            end

            renderer.gradient(position.x, position.y, resolution.x, resolution.y, color.r, color.g, color.b, color.a, second_color.r, second_color.g, second_color.b, second_color.a, direction)
        end,
        circle = function(position, color, radius, start_degrees, percentage, thickness)
            if color.a <= 0 then
                return
            end

            if thickness ~= nil then
                renderer.circle_outline(position.x, position.y, color.r, color.g, color.b, color.a, radius, start_degrees, percentage or 1, thickness)
            else
                renderer.circle(position.x, position.y, color.r, color.g, color.b, color.a, radius, start_degrees, percentage or 1)
            end
        end,
        rectangle = function(position, resolution, color)
            if color.a <= 0 or resolution.x <= 0 then
                return
            end

            renderer.rectangle(position.x, position.y, resolution.x, resolution.y, color.r, color.g, color.b, color.a)
        end,
        triangle = function(position, second_position, third_position, color)
            if color.a <= 0 then
                return
            end

            renderer.triangle(position.x, position.y, second_position.x, second_position.y, third_position.x, third_position.y, color.r, color.g, color.b, color.a)
        end,
    }
    render.rounded_rectangle = LPH_JIT(function(position, resolution, color, radius)
        if color.a <= 0 or resolution.x <= 0 then
            return
        end

        local new_pos = position + vector(0, radius)
        local data_circle = {
            {new_pos.x + radius, new_pos.y, 180},
            {new_pos.x + resolution.x - radius, new_pos.y, 90},
            {new_pos.x + radius, new_pos.y + resolution.y - radius * 2, 270},
            {new_pos.x + resolution.x - radius, new_pos.y + resolution.y - radius * 2, 0},
        }

        local data_rect = {
            {new_pos.x + radius, new_pos.y, resolution.x - radius * 2, resolution.y - radius * 2},
            {new_pos.x + radius, new_pos.y - radius, resolution.x - radius * 2, radius},
            {new_pos.x + radius, new_pos.y + resolution.y - radius * 2, resolution.x - radius * 2, radius},
            {new_pos.x, new_pos.y, radius, resolution.y - radius * 2},
            {new_pos.x + resolution.x - radius, new_pos.y, radius, resolution.y - radius * 2},
        }

        for i, data in next, data_circle do
            render.circle(vector(data[1], data[2]), color, radius, data[3], 0.25)
        end

        for _, data in next, data_rect do
            render.rectangle(vector(data[1], data[2]), vector(data[3], data[4]), color)
        end
    end)

    render.rectangle_outline = LPH_JIT(function(position, resolution, color, thickness)
        if color.a <= 0 then return end

        render.line(position, position + vector(resolution.x, 0), color)
        render.line(position + vector(0, resolution.y), position + resolution, color)
        render.line(position, position + vector(0, resolution.y), color)
        render.line(position + vector(resolution.x, 0), position + resolution, color)
    end)

    render.rounded_glow = LPH_JIT_MAX(function(position, resolution, color, radius)
        local glow_color = color:clone()

        for i = 1, 5 do
            local expand = i * 1
            local alpha = math.floor(color.a * (0.2 - (i - 1) * 0.03))

            if alpha > 0 then
                render.rounded_rectangle(
                    vector(position.x - expand, position.y - expand),
                    vector(resolution.x + expand * 2, resolution.y + expand * 2),
                    glow_color:new_alpha(alpha),
                    radius + expand
                )
            end
        end
    end)
end

local animation do -- @shizauwu
    animation = { }
    local function converter_bool(value)
        if type(value) == 'boolean' then
            return value and 1 or 0
        end

        return value
    end

    local update_animation = function(animation, speed, new_value)
        speed = speed or 5
        new_value = converter_bool(new_value)

        if new_value == nil then
            return animation.value
        end

        local current_value = animation.value
        if current_value == new_value then
            return new_value
        end

        local frame_time = globals.absoluteframetime()
        local direction = new_value > current_value and 1 or -1
        local step = frame_time * speed * direction

        local next_value = current_value + step

        animation.value = utils.clamp(next_value, math.min(current_value, new_value), math.max(current_value, new_value))

        return animation.value
    end

    function animation.new(default_value)
        default_value = converter_bool(default_value) or 0
        return {
            value = default_value,
            update = function (self, speed, new_value)
                return update_animation(self, speed, new_value)
            end
        }
    end
end

local tables do
    tables = { }

    tables.conditions = {
        'Global',
        'Stand',
        'Move',
        'Slow-motion',
        'Duck',
        'Duck-move',
        'Air',
        'Air-crouch',
        'Manual'
    }

    tables.weapons = {
        'Autosnipers',
        'Scout',
        'AWP',
        'Deagle',
        'Revolver',
        'Pistols'
    }
end

local DRAG_DATABASE_KEY = 'authority_hud_drag_v1'
local drag_shared_positions = database.read(DRAG_DATABASE_KEY) or { }
local drag_config_slots = { }

local menu do
    menu = { 
        home = { },
        antiaim = { },
        interface = { },
        settings = { }
    }

    local aa = pui.group('AA', 'Anti-aimbot angles')
    local fl = pui.group('AA', 'Fake lag')
    local ot = pui.group('AA', 'Other')

    do -- colors
        pui.macros.gray = '\a'..color.new('5D5D5DFF'):to_hex()
        pui.macros.exploit = '\a'..color.new('BDC25DFF'):to_hex()
        pui.macros.menu_to_hex = color.new(ref.visuals.clrmenu:get()):to_hex()
        pui.macros.menu = color.new(ref.visuals.clrmenu:get()):to_hex()
        pui.macros.gradient = '\b\f<menu>\bFFFFFFFF\bFFFFFFFF\b\f<menu>'
    end

    do -- symbols
        pui.macros.left_arrow = ''
        pui.macros.left_arrow_d = ''
        pui.macros.right_arrow = ''
        pui.macros.right_arrow_d = ''
        pui.macros.dot = ''
    end
    
    local function auto_key(func, statement, key) -- qhouz
        if key ~= nil then
            return func .. '\n' .. key .. ':' .. statement
        else
            return func .. '\n' .. statement
        end
    end

    menu.switch = aa:combobox('\nmenu main switch', {'Home', 'Anti-aimbot', 'Interface', 'Settings'})

    local select do
        select = { }

        select.home = {menu.switch, 'Home'}
        select.aa = {menu.switch, 'Anti-aimbot'}
        select.int = {menu.switch, 'Interface'}
        select.settings = {menu.switch, 'Settings'}
    end

    do -- hidden drag config storage (saved by cheat config system)
        local hidden = {menu.switch, '__drag_hidden__'}

        drag_config_slots.version = aa:slider('\n:drag_cfg_version', 0, 1, 0):depend(hidden)

        drag_config_slots.damage_indicator = {
            x = aa:slider('\n:drag_di_x', 0, 8192, 0):depend(hidden),
            y = aa:slider('\n:drag_di_y', 0, 8192, 0):depend(hidden),
            sw = aa:slider('\n:drag_di_sw', 0, 8192, 0):depend(hidden),
            sh = aa:slider('\n:drag_di_sh', 0, 8192, 0):depend(hidden),
        }

        drag_config_slots.velocity_warning = {
            x = aa:slider('\n:drag_vw_x', 0, 8192, 0):depend(hidden),
            y = aa:slider('\n:drag_vw_y', 0, 8192, 0):depend(hidden),
            sw = aa:slider('\n:drag_vw_sw', 0, 8192, 0):depend(hidden),
            sh = aa:slider('\n:drag_vw_sh', 0, 8192, 0):depend(hidden),
        }

        drag_config_slots.aimbot_logs_under_crosshair = {
            x = aa:slider('\n:drag_logs_x', 0, 8192, 0):depend(hidden),
            y = aa:slider('\n:drag_logs_y', 0, 8192, 0):depend(hidden),
            sw = aa:slider('\n:drag_logs_sw', 0, 8192, 0):depend(hidden),
            sh = aa:slider('\n:drag_logs_sh', 0, 8192, 0):depend(hidden),
        }

        drag_config_slots.center_indicators = {
            x = aa:slider('\n:drag_ci_x', 0, 8192, 0):depend(hidden),
            y = aa:slider('\n:drag_ci_y', 0, 8192, 0):depend(hidden),
            sw = aa:slider('\n:drag_ci_sw', 0, 8192, 0):depend(hidden),
            sh = aa:slider('\n:drag_ci_sh', 0, 8192, 0):depend(hidden),
        }
    end

    do -- home
        menu.home.welcome = { } do
            local item = menu.home.welcome

            fl:label('\f<gray>'):depend({menu.switch, 'Home'})

            item.script = fl:label('\f<gray>\f<dot> \rWelcome to \v' .. db.script):depend({menu.switch, 'Home'})
            item.user = fl:label('\f<gray>\f<dot> \rUsername: \v' .. db.user):depend({menu.switch, 'Home'})
            item.build = fl:label('\f<gray>\f<dot> \rBuild: \v' .. db.build):depend({menu.switch, 'Home'})
            item.session_time = fl:label('\f<gray>\f<dot> \rSession time: \v' .. db.current_time()):depend({menu.switch, 'Home'})
            item.misses = fl:label('\f<gray>\f<dot> \rNumber of misses per session: \v' .. '0'):depend({menu.switch, 'Home'})

            fl:label('\f<gray>'):depend({menu.switch, 'Home'})
        end

        menu.home.links = { } do
            local item = menu.home.links

            item.ceos = ot:slider('\nceos home link', 0, 2, 0, true, '', 1, {[0] = 'Discord', [1] = 'CEO', [2] = 'Developer'}):depend({menu.switch, 'Home'})
            item.discord_server = ot:button('\bFFFFFF55\b\f<menu_to_hex>[Discord server]', db.open.authority):depend({menu.switch, 'Home'}, {item.ceos, 0})
        end
    end

    do -- anti-aimbot
        menu.antiaim.switch = aa:combobox('\n antiaim main switch', {'Settings', 'Angles'}):depend(select.aa)

        local st_switch = {menu.antiaim.switch, 'Settings'}
        local aa_switch = {menu.antiaim.switch, 'Angles'}

        menu.antiaim.settings = { } do
            local item = menu.antiaim.settings

            item.anti_backstab = { } do
                local new = item.anti_backstab

                new.enabled = aa:checkbox('\f<gray>\f<right_arrow> \rAnti-backstab'):depend(select.aa, st_switch)
                new.disabler = aa:checkbox('\f<gray>\f<right_arrow_d> \rDisable in dangerous situations'):depend(select.aa, st_switch, new.enabled)
            end

            item.safe_head = { } do
                local new = item.safe_head

                new.enabled = aa:checkbox('\f<gray>\f<right_arrow> \rSafe head'):depend(select.aa, st_switch)
                new.conditions = aa:multiselect('\nsafehead:conditions', {'Knife', 'Taser', 'Other weapons'}):depend(select.aa, st_switch, new.enabled)
                new.disabler = aa:checkbox('\f<gray>\f<right_arrow_d> \rDisable if lethal'):depend(select.aa, st_switch, new.enabled)
            end

            item.aa_disablers = { } do
                local new = item.aa_disablers

                new.enabled = aa:checkbox('\f<gray>\f<right_arrow> \rAnti-aim disablers'):depend(select.aa, st_switch)
                new.events = aa:multiselect('\naa_disablers:events', {'Warmup', 'No enemies'}):depend(select.aa, st_switch, new.enabled)
            end

            item.hotkeys = { } do
                local new = item.hotkeys

                new.left = ot:hotkey('\f<gray> \rLeft key'):depend(select.aa, st_switch)
                new.right = ot:hotkey('\f<gray> \rRight key'):depend(select.aa, st_switch)
                new.forward = ot:hotkey('\f<gray> \rForward key'):depend(select.aa, st_switch)
                new.freestand = ot:hotkey('\f<gray> \rFreestading'):depend(select.aa, st_switch)
                new.edgeyaw = ot:hotkey('\f<gray> \rEdge yaw'):depend(select.aa, st_switch)

                new.left:set('Toggle')
                new.right:set('Toggle')
                new.forward:set('Toggle')
            end

            item.antibrute = { } do
                local new = item.antibrute

                new.enabled = aa:checkbox('\f<gray>\f<right_arrow> \rAnti-bruteforce'):depend(select.aa, st_switch)
                new.mode = aa:combobox('\nantibrute:mode', {'Low', 'Medium', 'High'}):depend(select.aa, st_switch, new.enabled)
                new.time = aa:slider('\nantibrute:time', 1, 10, 1, true, 's', 1):depend(select.aa, st_switch, new.enabled)
            end 

            item.fakelag = { } do
                local new = item.fakelag

                new.enabled = fl:checkbox('\f<gray>\f<right_arrow> \rFake lag', 0):depend(select.aa, st_switch)
                new.method = fl:combobox('\f<gray>\f<right_arrow_d> \rMethod', {'Dynamic', 'Fluctuate', 'Maximum'}):depend(select.aa, st_switch, new.enabled)
                new.limit = fl:slider('\f<gray>\f<right_arrow_d> \rLimit', 1, 15, 13, true, 't', 1, {[1] = 'Off'}):depend(select.aa, st_switch, new.enabled)
                new.variance = fl:slider('\f<gray>\f<right_arrow_d> \rVariance', 0, 100, 10, true, '%', 1, {[0] = 'Off'}):depend(select.aa, st_switch, new.enabled)

                new.enabled:set(ref.antiaim.fakelag.on:get())
                new.enabled.hotkey:set(ref.antiaim.fakelag.on.hotkey:get())
                new.method:set(ref.antiaim.fakelag.amount:get())
                new.limit:set(ref.antiaim.fakelag.limit:get())
                new.variance:set(ref.antiaim.fakelag.variance:get())

            end

        end

        menu.antiaim.conditions = aa:combobox('\nantiaim:states', {unpack(tables.conditions)}, nil, false):depend(select.aa, aa_switch)
        aa:label('\nconiditions:space[1]'):depend(select.aa, aa_switch)

        menu.angles = { }
        for index, curstate in ipairs(tables.conditions) do
            local state = { }

            local current_state = {menu.antiaim.conditions, curstate}

            if curstate ~= 'Global' then
                state.enabled = aa:checkbox(auto_key('\f<gray>\f<right_arrow> \rEnable ' .. curstate, curstate)):depend(select.aa, aa_switch, current_state)
            end

            local is_state = state.enabled and {state.enabled, true}
            local visible = {select.aa, aa_switch, current_state, is_state}

            state.yaw = { } do
                local item = state.yaw
                
                item.mode = aa:combobox(auto_key('\f<gray>\f<right_arrow_d> \rYaw', curstate), {'Off', '180', 'Left & Right', 'Switch'}):depend(unpack(visible))
                item.value = aa:slider(auto_key('\nyaw:default_value', curstate), -180, 180, 0, true, '', 1, {[0] = 'Off'}):depend({item.mode, '180'}, unpack(visible))
                item.left = aa:slider(auto_key('\f<gray>\f<left_arrow> \rLeft', curstate), -180, 180, 0, true, '', 1, {[0] = 'Off'}):depend({item.mode, 'Left & Right', 'Switch'}, unpack(visible))
                item.left_rn = aa:slider(auto_key('\f<gray>\f<left_arrow> \rRandomize', curstate), 0, 100, 0, true, '%', 1, {[0] = 'Off'}):depend({item.mode, 'Left & Right', 'Switch'}, unpack(visible))
                item.right = aa:slider(auto_key('\f<gray>\f<right_arrow> \rRight', curstate), -180, 180, 0, true, '', 1, {[0] = 'Off'}):depend({item.mode, 'Left & Right', 'Switch'}, unpack(visible))
                item.right_rn = aa:slider(auto_key('\f<gray>\f<right_arrow> \rRandomize', curstate), 0, 100, 0, true, '%', 1, {[0] = 'Off'}):depend({item.mode, 'Left & Right', 'Switch'}, unpack(visible))
                item.switch = aa:slider(auto_key('\f<gray>\f<left_arrow>\f<right_arrow> \rSwitch', curstate), -90, 90, 0, true, '', 1):depend({item.mode, 'Switch'}, unpack(visible))
            end

            state.yaw_jitter = { } do
                local item = state.yaw_jitter

                item.mode = aa:combobox(auto_key('\f<gray>\f<right_arrow_d> \rYaw jitter', curstate), {'Off', 'Offset', 'Center', 'Random', 'Ways', 'Spin'}):depend(unpack(visible))
                item.ways = aa:combobox(auto_key('\f<gray>\f<right_arrow_d> \rWays mode', curstate), {'Skitter', '3 Ways', '5 Ways'}):depend({item.mode, 'Ways'}, unpack(visible))
                item.value = aa:slider(auto_key('\nyaw_jitter:default_value', curstate), -180, 180, 0, true, '', 1, {[0] = 'Off'}):depend({item.mode, 'Offset', 'Ways'}, unpack(visible))
                item.left = aa:slider(auto_key('\f<gray>\f<left_arrow> \rLeft \n:yaw_jitter', curstate), -180, 180, 0, true, '', 1, {[0] = 'Off'}):depend({item.mode, 'Center', 'Random', 'Spin'}, unpack(visible))
                item.right = aa:slider(auto_key('\f<gray>\f<right_arrow> \rRight \n:yaw_jitter', curstate), -180, 180, 0, true, '', 1, {[0] = 'Off'}):depend({item.mode, 'Center', 'Random', 'Spin'}, unpack(visible))
                item.random = aa:slider(auto_key('\f<gray> \rRandomize \n:yaw_jitter', curstate), 0, 100, 0, true, '%', 1, {[0] = 'Off'}):depend({item.mode, 'Center', 'Random', 'Ways'}, unpack(visible))
            
            end

            state.body_yaw = { } do
                local item = state.body_yaw

                item.mode = aa:combobox(auto_key('\f<gray>\f<right_arrow_d> \rBody yaw', curstate), {'Off', 'Static', 'Opposite', 'Jitter', 'Adaptive'}):depend(unpack(visible))
                item.value = aa:slider(auto_key('\nbody_yaw:default_value', curstate), -180, 180, 0, true, '', 1, {[0] = 'Off'}):depend({item.mode, 'Static', 'Jitter'}, unpack(visible))
                item.adaptive = aa:combobox(auto_key('\nbody_yaw:adaptive_mode', curstate), {'Safe', 'Break', 'Balance'}):depend({item.mode, 'Adaptive'}, unpack(visible))

                item.delay = { } do
                    local new = item.delay

                    new.mode = aa:combobox(auto_key('\f<gray>\f<right_arrow_d> \rDelay', curstate), {'Static', 'Dynamic'}):depend({item.mode, 'Jitter', 'Adaptive'}, unpack(visible))
                    new.dynamic = aa:combobox(auto_key('\f<gray>\f<right_arrow_d> \rDynamic mode', curstate), {'Cycle', 'Random', 'Similar'}):depend({item.mode, 'Jitter', 'Adaptive'}, {new.mode, 'Dynamic'}, unpack(visible))
                    new.left = aa:slider(auto_key('\f<gray>\f<left_arrow> \rLeft \n:delay', curstate), 1, 14, 1, true, 't', 1):depend({item.mode, 'Jitter', 'Adaptive'}, {new.mode, 'Static'}, unpack(visible))
                    new.right = aa:slider(auto_key('\f<gray>\f<right_arrow> \rRight \n:delay', curstate), 1, 14, 0, true, 't', 1):depend({item.mode, 'Jitter', 'Adaptive'}, {new.mode, 'Static'}, unpack(visible))
                    new.min = aa:slider(auto_key('\f<gray>\f<left_arrow> \rMin \n:delay', curstate), 1, 14, 1, true, 't', 1):depend({item.mode, 'Jitter', 'Adaptive'}, {new.mode, 'Dynamic'}, unpack(visible))
                    new.max = aa:slider(auto_key('\f<gray>\f<right_arrow> \rMax \n:delay', curstate), 1, 14, 0, true, 't', 1):depend({item.mode, 'Jitter', 'Adaptive'}, {new.mode, 'Dynamic'}, unpack(visible))

                    new.speed = aa:slider(auto_key('\f<gray>\f<right_arrow> \rSpeed \n:delay', curstate), 0, 100, 0, true, '%', 1):depend({item.mode, 'Jitter', 'Adaptive'}, {new.mode, 'Dynamic'}, unpack(visible))
                    new.random = aa:slider(auto_key('\f<gray>\f<left_arrow>\f<right_arrow> \rRandomize chance', curstate), 0, 100, 0, true, '%', 1):depend({item.mode, 'Jitter', 'Adaptive'}, {new.mode, 'Static', 'Dynamic'}, {new.dynamic, 'Random', true}, unpack(visible))

                end
            end

            state.defensive = { } do
                local item = state.defensive

                item.break_lc = ot:multiselect(auto_key('\f<gray>\f<right_arrow_d> \rForce defensive', curstate), {'On shot anti-aim', 'Double tap'}):depend(unpack(visible))
                item.mode = ot:combobox(auto_key('\nforce_defensive:mode', curstate), {'On peek', 'Always on'}):depend({item.break_lc, 'On shot anti-aim', 'Double tap'}, unpack(visible))
                item.tick = ot:slider(auto_key('\f<gray>\f<dot> \rDefensive lag on peek', curstate), 1, 14, 1, true, 't', 1):depend({item.break_lc, 'On shot anti-aim', 'Double tap'}, {item.mode, 'On peek'},  unpack(visible))
            
                item.enabled = fl:checkbox(auto_key('\f<gray>\f<right_arrow_d> \rDefensive anti-aim', curstate)):depend({item.break_lc, 'On shot anti-aim', 'Double tap'}, unpack(visible))

                local merge = {item.enabled, {item.break_lc, 'On shot anti-aim', 'Double tap'}, unpack(visible)}

                item.pitch = { } do
                    local new = item.pitch

                    new.mode = fl:combobox(auto_key('\f<gray>\f<right_arrow_d> \rPitch \n:defensive', curstate), {'Off', 'Static', 'Jitter', 'Spin', 'Ways', 'Random'}):depend(unpack(merge))
                    new.value = fl:slider(auto_key('\ndefensive_pitch:default_value', curstate), -180, 180, 0, true, '', 1, {[0] = 'Off'}):depend({new.mode, 'Static', 'Spin', 'Ways'}, unpack(merge))
                    new.min = fl:slider(auto_key('\ndefensive_pitch:min_value', curstate), -180, 180, 0, true, '', 1, {[0] = 'Off'}):depend({new.mode, 'Random', 'Jitter'}, unpack(merge))
                    new.max = fl:slider(auto_key('\ndefensive_pitch:max_value', curstate), -180, 180, 0, true, '', 1, {[0] = 'Off'}):depend({new.mode, 'Random', 'Jitter'}, unpack(merge))
                    new.delay = fl:slider(auto_key('\ndefensive_pitch:min_value', curstate), 1, 14, 1, true, 't', 1):depend({new.mode, 'Random', 'Jitter'}, unpack(merge))
                    new.static = fl:checkbox(auto_key('\f<gray>\f<dot> \rStatic mode \n:pitch', curstate)):depend({new.mode, 'Random'}, unpack(merge))
                end

                item.yaw = { } do
                    local new = item.yaw

                    new.mode = fl:combobox(auto_key('\f<gray>\f<right_arrow_d> \rYaw \n:defensive', curstate), {'Off', 'Static', 'Jitter', 'Spin', 'Ways', 'Random'}):depend(unpack(merge))
                    new.value = fl:slider(auto_key('\ndefensive_yaw:default_value', curstate), -180, 180, 0, true, '', 1, {[0] = 'Off'}):depend({new.mode, 'Static', 'Spin', 'Ways'}, unpack(merge))
                    new.min = fl:slider(auto_key('\ndefensive_yaw:min_value', curstate), -180, 180, 0, true, '', 1, {[0] = 'Off'}):depend({new.mode, 'Random', 'Jitter'}, unpack(merge))
                    new.max = fl:slider(auto_key('\ndefensive_yaw:max_value', curstate), -180, 180, 0, true, '', 1, {[0] = 'Off'}):depend({new.mode, 'Random', 'Jitter'}, unpack(merge))
                    new.delay = fl:slider(auto_key('\ndefensive_yaw:min_value', curstate), 1, 14, 1, true, 't', 1):depend({new.mode, 'Random', 'Jitter'}, unpack(merge))
                    new.static = fl:checkbox(auto_key('\f<gray>\f<dot> \rStatic mode \n:yaw', curstate)):depend({new.mode, 'Random'}, unpack(merge))


                end
            end
            menu.angles[curstate] = state
        end
    end

    do -- interface
        menu.interface.advert = { } do
            local item = menu.interface.advert

            item.watermark = { } do
                local new = item.watermark

                new.enabled = aa:checkbox('\f<gray>\f<right_arrow> \rWatermark'):depend(select.int)
                new.style = aa:combobox('\f<gray>\f<right_arrow_d> \rStyle', {'Minimify', 'Beatiful'}):depend(select.int, new.enabled)
                new.color1 = aa:label('\f<gray>\f<dot> \rMain color', {255, 255, 255, 255}):depend(select.int, new.enabled)
                new.display = aa:multiselect('\f<gray>\f<dot> \rDisplay', {'Script', 'Name', 'FPS', 'PING', 'K/D', 'Time'}):depend(select.int, new.enabled, {new.style, 'Beatiful'})
                new.position = aa:combobox('\f<gray>\f<dot> \rPosition', {'Right-upper', 'Bottom'}):depend(select.int, new.enabled, {new.style, 'Beatiful'})
            end

            item.indicate = { } do
                local new = item.indicate

                new.enabled = aa:checkbox('\f<gray>\f<right_arrow> \rCenter indicators'):depend(select.int)
                new.style = aa:combobox('\f<gray>\f<right_arrow_d> \rStyle\n:indicate', {'Minimify', 'Beatiful'}):depend(select.int, new.enabled)
                new.color1 = aa:label('\f<gray>\f<dot> \rMain color\n:indicate', {255, 255, 255, 255}):depend(select.int, new.enabled)
                new.color2 = aa:label('\f<gray>\f<dot> \rAlternative color\n:indicate', {255, 255, 255, 255}):depend(select.int, new.enabled, {new.style, 'Beatiful'})
            end
        end

        menu.interface.helpers = { } do
            local item = menu.interface.helpers

            item.manual_arrows = { } do
                local new = item.manual_arrows

                new.enabled = aa:checkbox('\f<gray>\f<right_arrow> \rManual arrows'):depend(select.int)
                new.color = aa:color_picker('colorpicker:manual_arrows', 255, 255, 255, 255):depend(select.int, new.enabled)
                new.style = aa:combobox('\f<gray>\f<right_arrow_d> \rStyle\n:manual_arrows', {'Default', 'Alternative'}):depend(select.int, new.enabled)
                new.offset = aa:slider('\f<gray>\f<right_arrow_d> \rOffset\n:manual_arrows', 10, 100, 45, true, 'px', 1):depend(select.int, new.enabled)
            end

            item.damage_indicator = { } do
                local new = item.damage_indicator

                new.enabled = aa:checkbox('\f<gray>\f<right_arrow> \rDamage indicator'):depend(select.int)
                new.color = aa:color_picker('colorpicker:damage_indicator', 255, 255, 255, 255):depend(select.int, new.enabled)
                new.always_on = aa:checkbox('\f<gray>\f<right_arrow> \rAlways on'):depend(select.int, new.enabled)
                new.font = aa:combobox('\f<gray>\f<right_arrow> \rFont', {'Default', 'Small'}):depend(select.int, new.enabled)
            end

            item.overlay = { } do
                local new = item.overlay
                new.enabled = aa:checkbox('\f<gray>\f<right_arrow> \rScope overlay'):depend(select.int)
                new.style = aa:combobox('\f<gray>\f<right_arrow> \rStyle', {'Default', 'T-Style', 'X-Style'}):depend(select.int, new.enabled)
                new.color_1 = aa:label('\f<gray>\f<dot> \rFirst', {255, 255, 255, 255}):depend(select.int, new.enabled)
                new.color_2 = aa:label('\f<gray>\f<dot> \rSecond', {255, 255, 255, 255}):depend(select.int, new.enabled)
                new.lines_gap = aa:slider('\f<gray>\f<dot> \rGap', 0, 100, 4):depend(select.int, new.enabled)
                new.lines_offset = aa:slider('\f<gray>\f<dot> \rLines', 0, 200, 10):depend(select.int, new.enabled)
                new.animations = aa:slider('\f<gray>\f<dot> \rAnimation', 0, 10, 5, true, '', 1, {[0] = 'Off'}):depend(select.int, new.enabled)
            end

            item.logs = { } do
                local new = item.logs

                new.enabled = aa:checkbox('\f<gray>\f<right_arrow> \rAimbot logs'):depend(select.int)
                new.output = aa:multiselect('\noutput logs', {'Event', 'Console', 'Under-crosshair'}):depend(select.int, new.enabled)
                new.hit_color = aa:label('\f<gray>\f<right_arrow> \rHit color', {150, 200, 10, 255}):depend(select.int, new.enabled)
                new.miss_color = aa:label('\f<gray>\f<right_arrow> \rMiss color', {255, 50, 50, 255}):depend(select.int, new.enabled)
                new.mismatch_color = aa:label('\f<gray>\f<right_arrow> \rMismatch color', {255, 120, 200, 255}):depend(select.int, new.enabled)
            end

            menu.settings.logs = item.logs

            item.velocity_warning = { } do
                local new = item.velocity_warning

                new.enabled = aa:checkbox('\f<gray>\f<right_arrow> \rVelocity warning'):depend(select.int)
                new.main_color = aa:color_picker('velocity_waring color', 255, 255, 255, 255):depend(select.int, new.enabled)
            end

            local tbl = {
                [0] = 'Off',
                [math.floor(16 / 9 * 100)] = '16:9',
                [math.floor(16 / 10 * 100)] = '16:10',
                [math.floor(3 / 2 * 100)] = '3:2',
                [math.floor(4 / 3 * 100)] = '4:3',
                [math.floor(5 / 4 * 100)] = '5:4',
            }

            item.thirdperson = { } do
                local new = item.thirdperson

                new.enabled = fl:checkbox('\f<gray>\f<right_arrow> \rThird person'):depend(select.int)
                new.distance = fl:slider('\nTHIRDPERSON_DIST', 0, 200, 90):depend(select.int, new.enabled)
                new.distance:set(cvar.cam_idealdist:get_int()) --default value
            end

            item.aspect_ratio = { }
            item.aspect_ratio.enabled = fl:checkbox('\f<gray>\f<right_arrow> \rAspect ratio'):depend(select.int)
            item.aspect_ratio.value = fl:slider('\nASPECT_RATIO_VALUE', 0, 177, 0, true, '', 0.01, tbl):depend(select.int, item.aspect_ratio.enabled)
            item.aspect_ratio.value:set(cvar.r_aspectratio:get_float() * 100) --default value

            item.revolver_helper = { } do
                local new = item.revolver_helper

                new.enabled = fl:checkbox('\f<gray>\f<right_arrow> \rRevolver helper'):depend(select.int)
                new.inactive = fl:label('\f<gray>\f<dot> \rInactive color', {200, 200, 200, 255}):depend(select.int, new.enabled)
                new.active = fl:label('\f<gray>\f<dot> \rActive color', {159, 202, 43, 255}):depend(select.int, new.enabled)
            end

            menu.settings.helpers = menu.settings.helpers or { }
            menu.settings.helpers.thirdperson = item.thirdperson.enabled
            menu.settings.helpers.thirdperson_dist = item.thirdperson.distance
            menu.settings.helpers.aspect_ratio = item.aspect_ratio.enabled
            menu.settings.helpers.aspect_ratio_value = item.aspect_ratio.value
            menu.settings.aimbot = menu.settings.aimbot or { }
            menu.settings.aimbot.revolver_helper = item.revolver_helper

            item.kibit_marker = fl:checkbox('\f<gray>\f<right_arrow> \rKibit marker'):depend(select.int)

            item.bullet_tracer = { } do
                local new = item.bullet_tracer

                new.enabled = fl:checkbox('\f<gray>\f<right_arrow> \rBullet tracer'):depend(select.int)
                new.main_color = fl:color_picker('bullet tracer color', 255, 255, 255, 255):depend(select.int, new.enabled)
            end

            item.zoom_fov = { } do
                local new = item.zoom_fov

                new.enabled = fl:checkbox('\f<gray>\f<right_arrow> \rZoom FOV'):depend(select.int)
                new.first_zoom = fl:slider('\f<gray>\f<dot> \rFirst zoom', 0, 100, 0, true, '%', 1):depend(select.int, new.enabled)
                new.second_zoom = fl:slider('\f<gray>\f<dot> \rSecond zoom', 0, 100, 0, true, '%', 1):depend(select.int, new.enabled)
                new.animation_zoom = fl:checkbox('\f<gray>\f<right_arrow_d> \rAnimation'):depend(select.int, new.enabled)
            end
        end
    end

    do -- settings
        menu.settings.helpers = menu.settings.helpers or { } do
            local item = menu.settings.helpers

            item.quick_ladder = aa:checkbox('\f<gray>\f<right_arrow> \rQuick ladder'):depend(select.settings)
            item.unlock_fd = aa:checkbox('\f<gray>\f<right_arrow> \rDuck fix with fake duck'):depend(select.settings)
            item.console_filter = aa:checkbox('\f<gray>\f<right_arrow> \rConsole filter'):depend(select.settings)
            item.charge_fix = aa:checkbox('\f<gray>\f<right_arrow> \rRecharge fix'):depend(select.settings)
            item.trashtalk = aa:checkbox('\f<gray>\f<right_arrow> \rTrashtalk'):depend(select.settings)
            item.trashtalk_delay = aa:slider('\f<gray>\f<right_arrow_d> \rTrashtalk delay', 5, 20, 5, true, 's', 0.1):depend(select.settings, item.trashtalk)
            item.trashtalk_hitchance = aa:slider('\f<gray>\f<right_arrow_d> \rTrashtalk chance', 0, 100, 100, true, '%', 1):depend(select.settings, item.trashtalk)
        end

        menu.settings.buybot = { } do
            local item = menu.settings.buybot

            item.enabled = aa:checkbox('\f<gray>\f<right_arrow> \rBuybot'):depend(select.settings)
            item.primary = aa:combobox('\f<gray>\f<right_arrow_d> \rPrimary weapon', {
                'Off',
                'Autosniper',
                'Scout',
                'AWP',
                'AK-47 / M4A1',
                'Galil / Famas',
                'MAC-10 / MP9',
                'MP7',
                'UMP-45',
                'P90',
                'Nova',
                'XM1014',
                'MAG-7 / Sawed-Off',
                'Negev',
                'M249'
            }):depend(select.settings, item.enabled)
            item.pistol = aa:combobox('\f<gray>\f<right_arrow_d> \rPistol', {
                'Off',
                'Dual Berettas',
                'P250',
                'Tec-9 / Five-SeveN',
                'CZ75-Auto',
                'Desert Eagle',
                'R8 Revolver'
            }):depend(select.settings, item.enabled)
            item.grenades = aa:multiselect('\f<gray>\f<right_arrow_d> \rGrenades', {
                'HE Grenade',
                'Molotov / Incendiary',
                'Smoke',
                'Flashbang',
                'Decoy'
            }):depend(select.settings, item.enabled)
            item.armor = aa:combobox('\f<gray>\f<right_arrow_d> \rArmor', {
                'Off',
                'Kevlar',
                'Helmet + Kevlar'
            }):depend(select.settings, item.enabled)
            item.defuse = aa:checkbox('\f<gray>\f<right_arrow_d> \rDefuse kit'):depend(select.settings, item.enabled)
            item.taser = aa:checkbox('\f<gray>\f<right_arrow_d> \rZeus x27'):depend(select.settings, item.enabled)
        end

        menu.settings.animations = { } do
            local item = menu.settings.animations

            item.enabled = aa:checkbox('\f<gray>\f<right_arrow> \rAnimations'):depend(select.settings)
            item.ground = aa:combobox('\f<gray>\f<right_arrow> \rOn ground', {'-', 'Static', 'Jitter', 'Jitter v2', 'Slide move'}):depend(select.settings, item.enabled)
            item.ground_jitter_strength = aa:slider('\f<gray>\f<right_arrow_d> \rJitter strength', 0, 10, 10, true, '', 0.1):depend(select.settings, item.enabled, {item.ground, function(el)
                local value = el:get()
                return value == 'Jitter' or value == 'Jitter v2'
            end})
            item.air = aa:combobox('\f<gray>\f<right_arrow> \rIn air', {'-', 'Static', 'Earthquake', 'Kangoroo'}):depend(select.settings, item.enabled)
            aa:label('\t\f<gray>\f<right_arrow> Works only with Move lean'):depend(select.settings, item.enabled, {item.air, 'Earthquake'})
            item.addons = aa:multiselect('\f<gray>\f<right_arrow> \rFeatures', {'Pitch zero on land', 'Move lean', 'Smooth animations'}):depend(select.settings, item.enabled)
        end

        menu.settings.aimbot = { } do
            local item = menu.settings.aimbot
        
            item.dormant_aimbot = { } do
                local new = item.dormant_aimbot
            
                new.enabled = ot:checkbox('\f<gray>\f<right_arrow> \rDormant aimbot', 0x0):depend(select.settings)
                new.hitboxes = ot:multiselect('\n:dormant_aimbot hitboxes', {'Head', 'Chest', 'Stomach', 'Legs'}):depend(select.settings, new.enabled)
                new.damage = ot:slider('\f<gray>\f<right_arrow> \rMinimum damage', 0, 100, 0, true, 'hp', 1, {[0] = 'Inherited'}):depend(select.settings, new.enabled)
                new.hitchance = ot:slider('\f<gray>\f<right_arrow> \rHit chance', 50, 100, 0, true, '%', 1):depend(select.settings, new.enabled)
            end

            item.prediction = { } do
                local new = item.prediction

                new.enabled = ot:checkbox('\f<gray>\f<right_arrow> \rPrediction', 0x0):depend(select.settings)
                new.enabled.hotkey:set('Toggle')
                new.extrapolate_ticks = ot:slider('\f<gray>\f<dot> \rExtrapolate limit', 1, 16, 8, true, 't', 1):depend(select.settings, new.enabled)
                new.status = ot:label('\f<gray>\f<right_arrow_d> \rPrediction: \vOff'):depend(select.settings)
            end
        
            local triggers = {
                'Enemy HP < X',
                'X missed shots',
                'Lethal',
            }
        
            local weapons_table = {
                'Autosnipers',
                'Scout',
                'AWP',
                'Deagle',
                'Revolver',
                'Pistols'
            }
        
            local delay_shot_options = {'Off', 'On'}
            local accuracy_boost_options = {'Low', 'Medium', 'High', 'Maximum'}
        
            item.single_shot = { } do
                local new = item.single_shot

                new.enabled = fl:checkbox('\f<gray>\f<right_arrow> \rSingle shot on DT (Quick Peek)'):depend(select.settings)
                new.weapons = fl:multiselect('\n:single_shot_on_dt', {'Autosnipers', 'Deagle', 'Pistols'}):depend(select.settings, new.enabled)
            end

            item.enabled = fl:checkbox('\f<gray>\f<right_arrow> \rAimbot helpers'):depend(select.settings)
            item.weapons = fl:combobox('\f<gray>\f<right_arrow> \rWeapons', weapons_table)
                :depend(select.settings, item.enabled)
        
            for i, weapon_name in ipairs(weapons_table) do
                local key = weapon_name:gsub(' ', '_'):lower()
            
                item[key .. '_force_safe_point'] = fl:checkbox('Force safe point\n' .. weapon_name)
                    :depend(select.settings, item.enabled, {item.weapons, weapon_name})
            
                item[key .. '_force_safe_point_triggers'] = fl:multiselect('\f<gray>\f<dot> \rTriggers for Force Safe\n' .. weapon_name, triggers)
                    :depend(select.settings, item.enabled, {item[key .. '_force_safe_point'], true}, {item.weapons, weapon_name})
            
                item[key .. '_force_safe_point_hp'] = fl:slider('Enemy HP <\n' .. weapon_name, 1, 100, 50, true, 'hp', 1)
                    :depend(select.settings, item.enabled, {item[key .. '_force_safe_point'], true}, 
                             {item[key .. '_force_safe_point_triggers'], 'Enemy HP < X'}, {item.weapons, weapon_name})
            
                item[key .. '_force_safe_point_misses'] = fl:slider('Misses >\n' .. weapon_name, 1, 10, 3, true, 'b', 1)
                    :depend(select.settings, item.enabled, {item[key .. '_force_safe_point'], true}, 
                             {item[key .. '_force_safe_point_triggers'], 'X missed shots'}, {item.weapons, weapon_name})
            
                item[key .. '_force_baim'] = fl:checkbox('Force body aim\n' .. weapon_name)
                    :depend(select.settings, item.enabled, {item.weapons, weapon_name})
            
                item[key .. '_force_baim_triggers'] = fl:multiselect('\f<gray>\f<dot> \rTriggers for Force Baim\n' .. weapon_name, triggers)
                    :depend(select.settings, item.enabled, {item[key .. '_force_baim'], true}, {item.weapons, weapon_name})
            
                item[key .. '_force_baim_hp'] = fl:slider('Enemy HP <\n' .. weapon_name, 1, 100, 50, true, 'hp', 1)
                    :depend(select.settings, item.enabled, {item[key .. '_force_baim'], true}, 
                             {item[key .. '_force_baim_triggers'], 'Enemy HP < X'}, {item.weapons, weapon_name})
            
                item[key .. '_force_baim_misses'] = fl:slider('Misses >\n' .. weapon_name, 1, 10, 3, true, 'b', 1)
                    :depend(select.settings, item.enabled, {item[key .. '_force_baim'], true}, 
                             {item[key .. '_force_baim_triggers'], 'X missed shots'}, {item.weapons, weapon_name})
            
                item[key .. '_prefer_safe_point'] = fl:checkbox('Prefer safe point\n' .. weapon_name)
                    :depend(select.settings, item.enabled, {item.weapons, weapon_name})
            
                item[key .. '_prefer_safe_point_triggers'] = fl:multiselect('\f<gray>\f<dot> \rTriggers for Prefer Safe\n' .. weapon_name, triggers)
                    :depend(select.settings, item.enabled, {item[key .. '_prefer_safe_point'], true}, {item.weapons, weapon_name})
            
                item[key .. '_prefer_safe_point_hp'] = fl:slider('Enemy HP <\n' .. weapon_name, 1, 100, 50, true, 'hp', 1)
                    :depend(select.settings, item.enabled, {item[key .. '_prefer_safe_point'], true}, 
                             {item[key .. '_prefer_safe_point_triggers'], 'Enemy HP < X'}, {item.weapons, weapon_name})
            
                item[key .. '_prefer_safe_point_misses'] = fl:slider('Misses >\n' .. weapon_name, 1, 10, 3, true, 'b', 1)
                    :depend(select.settings, item.enabled, {item[key .. '_prefer_safe_point'], true}, 
                             {item[key .. '_prefer_safe_point_triggers'], 'X missed shots'}, {item.weapons, weapon_name})
            
                item[key .. '_accuracy_boost'] = fl:checkbox('Accuracy boost\n' .. weapon_name)
                    :depend(select.settings, item.enabled, {item.weapons, weapon_name})
            
                item[key .. '_accuracy_boost_level'] = fl:combobox('Accuracy boost mode\n' .. weapon_name, accuracy_boost_options)
                    :depend(select.settings, item.enabled, {item[key .. '_accuracy_boost'], true}, {item.weapons, weapon_name})
            
                -- Delay Shot
                item[key .. '_delay_shot'] = fl:checkbox('Delay shot\n' .. weapon_name)
                    :depend(select.settings, item.enabled, {item.weapons, weapon_name})
            
                item[key .. '_delay_shot_mode'] = fl:combobox('Delay shot mode\n' .. weapon_name, delay_shot_options)
                    :depend(select.settings, item.enabled, {item[key .. '_delay_shot'], true}, {item.weapons, weapon_name})

                item[key .. '_disable_delay_shot_on_mindmg'] = fl:checkbox('Disable on min dmg override\n' .. weapon_name)
                    :depend(select.settings, item.enabled, {item[key .. '_delay_shot'], true}, {item.weapons, weapon_name})
            end
        end
    end

    menu.settings.aimbot.revolver_helper = menu.interface.helpers.revolver_helper
    menu.settings.aimbot.charge_fix = menu.settings.helpers.charge_fix

    menu.config = pui.setup(menu)

    local function clone_drag_positions(source)
        local out = { }
        if type(source) ~= 'table' then
            return out
        end

        for id, entry in pairs(source) do
            if type(entry) == 'table' then
                out[id] = {
                    x = tonumber(entry.x) or 0,
                    y = tonumber(entry.y) or 0,
                    sw = tonumber(entry.sw) or 0,
                    sh = tonumber(entry.sh) or 0
                }
            end
        end

        return out
    end

    local configs = { } do
        local DATABASE_KEY = 'authority'
        local DATABASE = database.read(DATABASE_KEY) or { }
        local CONFIG_SIGNATURE = 'AUTHORITY'

        local function encode(data)
            local packed_data = msgpack.pack(data)
            local encoded_data = base64.encode(packed_data)
            return table.concat({ CONFIG_SIGNATURE, encoded_data, CONFIG_SIGNATURE }, '::')
        end

        local function decode(config)
            local encoded = config:match(CONFIG_SIGNATURE .. '::(.+)::' .. CONFIG_SIGNATURE)
            if not encoded then
                print('Invalid config format.')
                return nil
            end

            local decoded_data = base64.decode(encoded)
            return msgpack.unpack(decoded_data)
        end

        function configs:export(name)
            local configuration = {
                name = name or 'Untitled',
                code = menu.config:save(),
                drag_positions = clone_drag_positions(drag_shared_positions)
            }

            return encode(configuration)
        end

        function configs:import(config, ...)
            local data = decode(config)
            if not data then
                return nil
            end

            menu.config:load(data.code, ...)

            if type(data.drag_positions) == 'table' then
                for k in pairs(drag_shared_positions) do
                    drag_shared_positions[k] = nil
                end

                local loaded_drag = clone_drag_positions(data.drag_positions)
                for id, entry in pairs(loaded_drag) do
                    drag_shared_positions[id] = entry
                end

                database.write(DRAG_DATABASE_KEY, drag_shared_positions)
            end

            return data
        end

        function configs:get_configs()
            local list = { }
            for i, data in ipairs(DATABASE) do
                list[i] = data.name
            end

            return list
        end

        function configs:get(id)
            return DATABASE[id]
        end

        function configs:delete(id)
            table.remove(DATABASE, id)
        end

        function configs:create(name, code)
            table.insert(DATABASE, { name = name, code = code })
        end

        function configs:save(id, code)
            if DATABASE[id] then
                DATABASE[id].code = code
            end
        end

        function configs:create_from_encoded_data(config)
            local data = decode(config)
            if not data then
                error('Invalid config data.')
                return
            end

            local original_name = data.name
            local candidate_name = original_name
            local counter = 0

            local existing_configs = configs:get_configs()

            local function name_exists(name)
                for _, existing_name in ipairs(existing_configs) do
                    if existing_name == name then
                        return true
                    end
                end
                return false
            end

            while name_exists(candidate_name) do
                counter = counter + 1
                candidate_name = original_name .. '(' .. counter .. ')'
            end

            data.name = candidate_name
            self:create(data.name, config)
        end

        defer(function ()
            database.write(DATABASE_KEY, DATABASE)
        end)
    end

    local config_info = { } do -- profile
        local tab = {menu.switch, 'Home'}
        menu.home.config_list = aa:listbox('Home', #configs:get_configs() > 0 and configs:get_configs() or {'\v\r No configs'}):depend(tab)
        local config_name = aa:textbox('Name config'):depend(tab)
        pui.macros.menu_to_hex = color.new(ref.visuals.clrmenu:get()):to_hex()

        local function validate_config_name()
            local name = config_name:get():gsub(' ', '')
            if name == '' then
                return true, 'Untitled'
            end

            return true, name
        end

        local function validate_config_exists(id)
            if #configs:get_configs() <= 0 then
                error('No configs available')
                return false, nil
            end

            local config = configs:get(id)
            if not config then
                error('Config not found')
                return false, nil
            end

            return true, config
        end

        local function load_config()
            local valid, config = validate_config_exists(menu.home.config_list:get()+1)
            if not valid or not config then
                error('Config issue')
                return
            end

            configs:import(config.code)

            utils.print('Config loaded successfully: ' .. config.name)
        end

        local function save_config()
            local valid, name = validate_config_name()
            if not valid then
                return
            end

            local code = configs:export(name)
            local current_config = configs:get(menu.home.config_list:get()+1)
            if not current_config or name ~= current_config.name then
                configs:create(name, code)
                utils.print('Config created successfully: ' .. name)
            else
                configs:save(menu.home.config_list:get()+1, code)
                utils.print('Config saved successfully: ' .. name)
            end
        end

        local function remove_config()
            local valid, config = validate_config_exists(menu.home.config_list:get()+1)
            if not valid or not config then
                return
            end
            configs:delete(menu.home.config_list:get()+1)
            utils.print('Config removed successfully: ' .. config.name)
        end

        local function export_config()
            local valid, name = validate_config_name()
            if not valid then
                return
            end

            clipboard.set(configs:export(name))
            utils.print('Copied to clipboard')
        end

        local function import_config()
            local code = clipboard.get()
            if not code then
                utils.print('Clipboard is empty')
                return
            end

            local ok = pcall(configs.create_from_encoded_data, configs, code)
            utils.print(ok and 'Config imported successfully' or 'Invalid config data')
        end

        local load   = aa:button(' \bFFFFFF55\b\f<menu_to_hex>[Load]', load_config):depend(tab)
        local save   = aa:button(' \bFFFFFF55\b96C83CFF[Save]', save_config):depend(tab)
        local delete = aa:button(' \bFFFFFF55\bFF0000FF[Delete]', remove_config):depend(tab)
        local export = aa:button(' \bFFFFFF55\b\f<menu_to_hex>[Export]', export_config):depend(tab)
        local import = aa:button(' \bFFFFFF55\b\f<menu_to_hex>[Import]', import_config):depend(tab)

        menu.home.config_list:set_callback(function(item)
            local list = configs:get_configs()
            if #list <= 0 then
                menu.home.config_list:update({ '\v\r No configs' })
                config_name:set('')
                load:set_enabled(false)
                delete:set_enabled(false)
                export:set_enabled(false)
                return
            end

            local config = configs:get(item:get() + 1)
            if config == nil then
                config_name:set('')
                load:set_enabled(false)
                delete:set_enabled(false)
                export:set_enabled(false)
                return
            end

            config_name:set(config.name)
            load:set_enabled(true)
            delete:set_enabled(true)
            export:set_enabled(true)
        end, true)
    end
    
    utils.set_callback('paint_ui', function ()
        menu.home.welcome.session_time:set('\f<gray>\f<right_arrow> \rSession time: \v' .. db.current_time())


        if not ui.is_menu_open() then
            return
        end

        if menu.switch:get() == 'Home' then
            local list = configs:get_configs()
            if #list ~= #config_info then
                config_info = list
                menu.home.config_list:update(#list <= 0 and {'\v\r No configs'} or list)
            end
        end

        pui.traverse(ref.antiaim.angles, function (r, path)
            r:set_visible(false)
        end)

        pui.traverse(ref.antiaim.fakelag, function (r, path)
            r:set_visible(false)
        end)

        pui.traverse(ref.antiaim.other, function (r, path)
            if menu.switch:get() == 'Interface' then
                r:set_visible(true)
            else
                r:set_visible(false)
            end
        end)
    end)
end

local localplayer do -- @from apex (kataro/shizauwu)
    localplayer = {
        weapon_type = '',
        weapon_ready = false,
        peeking = false,
        fired = false,
        air = false,
        moving = false,
        ducked = false,
        duck_amount = 0,
        body_yaw = 0,
        packets = 0,
        fakelag = 0,
        velocity = 0,
        exploits = {
            charged = false,
            choked = false,
            defensive = {
                left = 0,
                max = 0
            },
        },
    }

    local run_command_number, peeking_time,
        latest_time_peek = nil, nil, nil
    local pre_flags, post_flags,
        last_send_choke, max_tickbase = 0, 0, 0, 0
    local tickbase_difference = 0

    local weapon_types = {
        [0] = 'knife',
        'pistols',
        'smg',
        'rifles',
        'shotgun',
        'sniper',
        'machinegun',
        'c4',
        [9] = 'grenade',
        [11] = 'stackableitem',
        [12] = 'fists',
        [13] = 'breachcharge',
        [14] = 'bumpmine',
        [15] = 'tablet',
        [16] = 'melee',
        [19] = 'equipment'
    }

    local is_in_defensive = LPH_JIT(function()
        local data = localplayer.exploits.defensive
        return data.left > 0 and data.left < data.max
    end)

    local is_defensive_ended = LPH_JIT(function()
        local data = localplayer.exploits.defensive
        return not is_in_defensive() or (data.left >= 0 and data.left <= 5) and tickbase_difference > 0
    end)

    local is_lagcomp_broken = LPH_JIT(function()
        local me = entity.get_local_player()
        if not me then return false end
        local tickbase = entity.get_prop(me, 'm_nTickBase') or 0
        return not is_defensive_ended() or (tickbase_difference or 0) < tickbase
    end)

    --from aesthetic
    local get_body_yaw = LPH_JIT(function(player, cmd)
        local entity_info = c_entity(player)

        if entity_info == nil then
            return
        end

        local anim_state = entity_info:get_anim_state()

        if anim_state == nil then
            return
        end

        local eye_angles_y = anim_state.eye_angles_y
        local goal_feet_yaw = anim_state.goal_feet_yaw

        return utils.normalize(
            eye_angles_y - goal_feet_yaw, -180, 180
        )
    end)

    local update_freestand = LPH_JIT(function(me, threat) -- from aesthetic
        if me == nil then
            return 0
        end

        if threat == nil then
            return 0
        end

        local player_origin = vector(entity.get_origin(me))
        local target_origin = vector(entity.get_origin(threat))

        local angles = vector((target_origin - player_origin):angles())

        local eye_pos = vector(client.eye_position())
        local stomach = vector(entity.hitbox_position(threat, 3))

        local forward_left = vector():init_from_angles(0, angles.y + 90)
        local forward_right = vector():init_from_angles(0, angles.y - 90)

        local point_left = eye_pos + forward_left * 31
        local point_right = eye_pos + forward_right * 31

        local ent_left, damage_left = client.trace_bullet(
            me, point_left.x, point_left.y, point_left.z,
            stomach.x, stomach.y, stomach.z, false
        )

        local ent_right, damage_right = client.trace_bullet(
            me, point_right.x, point_right.y, point_right.z,
            stomach.x, stomach.y, stomach.z, false
        )

        if ent_left ~= threat then
            damage_left = 0
        end

        if ent_right ~= threat then
            damage_right = 0
        end

        local should_update = (
            (damage_left > 0 or damage_right > 0)
            and damage_left ~= damage_right
        )

        if should_update then
            return (damage_left > damage_right) and -1 or 1
        end

        return 0
    end)

    local get_peeking = LPH_JIT(function(me, threat)
        if not me or not localplayer.moving or not threat then
            return false
        end


        if utils.get_enemy_flag(threat, 'Occluded') then
            return false
        end

        if utils.get_enemy_flag(threat, 'Hit') and update_freestand(me, threat) ~= 0 then

            if latest_time_peek == nil then
                peeking_time = globals.tickcount()
                latest_time_peek = globals.tickcount()
            end

            if math.abs(globals.tickcount() - peeking_time) >= 16 then
                return false
            end

            return true
        end

        peeking_time = nil
        latest_time_peek = nil
        return false
    end)

    local get_shot_fire = LPH_JIT(function(me, weapon)
        local next_attack = entity.get_prop(weapon, 'm_flNextPrimaryAttack')
        if not next_attack then return false end

        local curtime = globals.curtime()
        if next_attack > curtime then
            return true
        end

        local since_last_shot = (
            curtime - (next_attack - .4)
        )

        return since_last_shot < .2
    end)

    utils.set_callback('setup_command', LPH_JIT(function (cmd)
        local me = entity.get_local_player()
        if not me then return end

        local weapon = entity.get_player_weapon(me)
        if not weapon then return end

        local wpn_info = csgo_weapons(weapon)
        if not wpn_info then return end

        local player = c_entity(me)
        if not player then return end

        local animstate = player:get_anim_state()
        if not animstate then return end

        local velocity = vector(entity.get_prop(me, 'm_vecVelocity'))

        localplayer.moving = velocity:length2dsqr() > 5 * 5
        localplayer.air = bit.band(pre_flags,post_flags,bit.lshift(1, 0)) == 0
        localplayer.fired = get_shot_fire(me, weapon)

        local duck_amount = entity.get_prop(me, 'm_flDuckAmount')

        if last_send_choke > cmd.chokedcommands then
            localplayer.fakelag = last_send_choke
        end
        localplayer.velocity = animstate.m_velocity

        last_send_choke = cmd.chokedcommands

        if cmd.chokedcommands == 0 then
            if cmd.allow_send_packet then
                localplayer.body_yaw = get_body_yaw(me, cmd)
            end
            localplayer.ducked = duck_amount > .5
            localplayer.duck_amount = duck_amount
            localplayer.packets = localplayer.packets + 1
        end

        local threat = client.current_threat()
        localplayer.peeking = get_peeking(me, threat)

        -- print(localplayer.peeking)

        local weapon_type = weapon_types[wpn_info.weapon_type_int]
        local console_name = wpn_info.console_name
        if weapon_type == 'knife' or weapon_type == 'sniper'
            or (console_name:gsub('weapon_', '') == 'deagle' or wpn_info.is_revolver) then
            localplayer.weapon_group = console_name:gsub('weapon_', '')
                :gsub('_.*', ''):gsub('bayonet', 'knife')
                :gsub('g3sg1', 'autosnipers'):gsub('scar20', 'autosnipers')
        else
            localplayer.weapon_group = weapon_type
        end

        local m_flNextSecondaryAttack = entity.get_prop(weapon, 'm_flNextSecondaryAttack')
        local m_flNextPrimaryAttack = entity.get_prop(weapon, 'm_flNextPrimaryAttack')
        local m_flNextAttack = entity.get_prop(me, 'm_flNextAttack')
        localplayer.weapon_ready = (
            (m_flNextAttack < globals.curtime())
            and (m_flNextSecondaryAttack < globals.curtime())
            and (m_flNextPrimaryAttack < globals.curtime())
        )

        local exploits_active = (
            ref.is_double_tap() or
            ref.is_on_shot_antiaim()
        )

        if exploits_active then
            localplayer.exploits.choked = (
                is_in_defensive() or
                (is_lagcomp_broken() and is_in_defensive())
            )
        else
            localplayer.exploits.choked = false
        end
    end))

    utils.set_callback('run_command', LPH_JIT(function (cmd)
        local me = entity.get_local_player()
        if not me then return end

        local shift = false do
            local tickbase = entity.get_prop(me, 'm_nTickBase')
            local hotkeys = (
                ref.is_double_tap()
                or ref.is_on_shot_antiaim()
            )

            if not hotkeys then
                shift = false
                goto continue
            end

            shift = globals.tickcount() > tickbase

            ::continue::
        end

        localplayer.exploits.charged = shift
        run_command_number = cmd.command_number
    end))

    utils.set_callback('pre_predict_command', LPH_JIT(function (cmd)
        local me = entity.get_local_player()
        if not me then return end

        pre_flags = entity.get_prop(me, 'm_fFlags')
    end))

    utils.set_callback('predict_command', LPH_JIT(function (cmd)
        local me = entity.get_local_player()
        if not me then return end

        post_flags = entity.get_prop(me, 'm_fFlags')

        if cmd.command_number == run_command_number then
            local data = localplayer.exploits.defensive
            local tickbase = entity.get_prop(me, 'm_nTickBase')
            if math.abs(tickbase - max_tickbase) > 64 then
                -- nullify highest tickbase if the difference is too big
                max_tickbase = 0
            end

            local defensive_ticks_left = 0

            -- defensive effect can be achieved because the lag compensation is made so that
            -- it doesn't write records if the current simulation time is less than/equals highest acknowledged simulation time
            -- https://gitlab.com/KittenPopo/csgo-2018-source/-/blame/main/game/server/player_lagcompensation.cpp#L723

            if tickbase > max_tickbase then
                max_tickbase = tickbase
            elseif max_tickbase > tickbase then
                defensive_ticks_left = math.min(14, math.max(0, max_tickbase - tickbase - 1))
            end

            if defensive_ticks_left > 0 then
                data.left = defensive_ticks_left

                if data.max == 0 then
                    data.max = defensive_ticks_left
                end
            else
                data.left = 0
                data.max = 0
            end

            tickbase_difference = math.max(tickbase, tickbase_difference or 0)

            run_command_number = nil
        end
    end))

    utils.set_callback('level_init', LPH_JIT(function ()
        max_tickbase = 0
        tickbase_difference = 0
        localplayer.exploits.choked = false
    end))
    
end

local state do -- @from apex (kataro/shizauwu)
    state = {
        current = 'Stand',
        manual = nil
    }

    local manual_data = { }
    local get_value = LPH_JIT(function(ref)
        local prev_active = manual_data[ref]
        local active, mode, key = ref:get()

        if prev_active == nil then
            manual_data[ref] = active
            return
        end

        if mode == 0 or mode == 3 or key == nil then
            return
        end

        if prev_active ~= active then
            manual_data[ref] = active
            return active, mode, key
        end
    end)

    local update_hotkey = LPH_JIT(function(ref, value)
        local active, mode = get_value(ref)
        if active == nil then
            return
        end

        if mode == 1 then
            if not active then
                state.manual = nil
                return
            end

            state.manual = value
            return
        end

        if mode == 2 then
            if state.manual == value then
                state.manual = nil
                return
            end

            state.manual = value
            return
        end
    end)

    local update_manual_hotkey = LPH_JIT(function()
        update_hotkey(menu.antiaim.settings.hotkeys.left, 'Left')
        update_hotkey(menu.antiaim.settings.hotkeys.right, 'Right')
        update_hotkey(menu.antiaim.settings.hotkeys.forward, 'Forward')
    end)

    local get_state = LPH_JIT(function(cmd)
        if state.manual ~= nil then
            return 'Manual'
        end

        if localplayer.air then
            return localplayer.ducked and 'Air-crouch' or 'Air'
        elseif localplayer.moving then
            return (localplayer.ducked or ref.is_fake_duck()) and 'Duck-move' or
                (ref.is_slow_motion() and 'Slow-motion' or 'Move')
        else
            return (localplayer.ducked or ref.is_fake_duck())
                and 'Duck' or 'Stand'
        end
    end)

    utils.set_callback('setup_command', LPH_JIT(function (cmd)
        update_manual_hotkey()
        state.current = get_state(cmd)
    end))
end

local angles do
    angles = {
        yaw = {
            base = 'At targets',
            type = '180',
            value = 0,
            add = 0,
            body = 0,
            inverter = false,
        },
        pitch = {
            inverter = false,
            type = 'Default',
            value = 0
        },
        body_yaw = {
            type = 'Off',
            value = 0,
            inverter = false,
            freestanding = false,
        },
        freestanding = false,
        freestanding_side = nil,
        hide_shots_break = false,
        edge_yaw = false,
        delay_packets = 0,
        inverts = 0,
        antibrute = 0,
        randomize = 0,
        randomize_jt = 0,
        updated = false,
        defensive_delay_packets = 0,
        defensive_pitch_data = {
            random_value = 0,
            last_change_tick = 0
        },
        defensive_yaw_data = {
            random_value = 0,
            last_change_tick = 0,
            inverter = false
        }
    }

    local debugging_lagcomp = false

    local skitter = {
        -1, 1, 0,
        -1, 1, 0,
        -1, 0, 1,
        -1, 0, 1
    }

    local get_current_preset = LPH_JIT(function(state)
        local state_settings = menu.angles[state]
        if not state_settings then
            return 'Global'
        end

        return (state_settings.enabled
            and (state_settings.enabled:get() and state_settings
                or menu.angles['Global'])
            or menu.angles['Global']
        )
    end)

    local manual_yaw = LPH_JIT(function(avoid_backstab)
        if avoid_backstab or state.manual == nil then
            return 0
        end

        local manuals = {
            ['Left'] = -90,
            ['Right'] = 90,
            ['Forward'] = 180,
        }

        return manuals[state.manual] or 0
    end)

    local avoid_backstab = LPH_JIT(function()
        if not menu.antiaim.settings.anti_backstab.enabled:get() then
            return false
        end

        local me = entity.get_local_player()
        if not me then
            return false
        end

        local closest_distance, closest_enemy = utils.closest_enemy()
        if not closest_enemy or not closest_distance then
            return false
        end

        local weapon = entity.get_player_weapon(closest_enemy)
        if not weapon then
            return false
        end

        if entity.get_classname(weapon) ~= 'CKnife' then
            return false
        end

        if not utils.get_enemy_flag(closest_enemy, 'Hit') then
            return false
        end

        local local_origin = vector(entity.get_origin(me))
        local origin = vector(entity.get_origin(closest_enemy))
        if local_origin:dist2d(origin) > 300 then
            return false
        end

        return true
    end)

    local is_value_near = LPH_JIT(function(value, target)
        return math.abs(target - value) <= 2.0
    end)

    local get_target_yaw = LPH_JIT(function(player)
        local threat = client.current_threat()

        if threat == nil then
            return nil
        end

        local player_origin = vector(
            entity.get_origin(player)
        )

        local threat_origin = vector(
            entity.get_origin(threat)
        )

        local delta = threat_origin - player_origin
        local _, yaw = delta:angles()

        return yaw - 180
    end)

    local get_approximated_side = LPH_JIT(function(yaw)
        if is_value_near(yaw, -90) then
            return -90
        end

        if is_value_near(yaw, 90) then
            return 90
        end

        return nil
    end)

    local get_side = LPH_JIT(function()
        local me = entity.get_local_player()

        if me == nil then
            return nil
        end

        local entity_data = c_entity(me)

        if entity_data == nil then
            return nil
        end

        local animstate = entity_data:get_anim_state()

        if animstate == nil then
            return nil
        end

        local target_yaw = get_target_yaw(me)

        if target_yaw == nil then
            return nil
        end

        return get_approximated_side(
            utils.normalize(animstate.eye_angles_y - target_yaw, -180, 180)
        )
    end)

    local reset_anti_brute = LPH_JIT(function()
        if not menu.antiaim.settings.antibrute.enabled:get() then
            return
        end

        angles.antibrute = 0
    end)

    local hitted_tick = 0
    local latest_active = 0
    local player_hurt = LPH_JIT(function(e)
        if client.userid_to_entindex(e.userid) == entity.get_local_player() then
            hitted_tick = globals.tickcount()
        end
    end)

    local get_miss = LPH_JIT(function(e)
        local elements = menu.antiaim.settings.antibrute
    
        if not elements.enabled:get() then
            angles.antibrute = 0
            return
        end
    
        local me = entity.get_local_player()
        if not (me and entity.is_alive(me)) or latest_active == globals.tickcount() then
            return
        end
    
        local entity_fire = client.userid_to_entindex(e.userid)
        if not entity_fire or entity.is_dormant(entity_fire) or not entity.is_enemy(entity_fire) then
            return
        end
    
        if hitted_tick ~= 0 and math.abs(globals.servertickcount() - hitted_tick) <= 50 or hitted_tick == globals.tickcount() then
            return
        end
    
        local impact_origin = vector(e.x, e.y, e.z)
        local entity_origin = vector(entity.get_origin(entity_fire)) + vector(entity.get_prop(entity_fire, 'm_vecViewOffset'))
        local head_pos = vector(entity.hitbox_position(me, 0))
        local closest_point = utils.closest_ray_point(head_pos, entity_origin, impact_origin)
        local dist = head_pos:dist(closest_point)
        if dist > 80 then
            return
        end
    
        if elements.mode:get() == 'Medium' then
            angles.antibrute = utils.random_int(-5, 5)
        elseif elements.mode:get() == 'High' then
            angles.antibrute = utils.random_int(-10, 10)
        else
            angles.antibrute = utils.random_int(-elements.min, elements.max)
        end
    
        angles.body_yaw.inverter = not angles.body_yaw.inverter
        local color = color.new(ref.visuals.clrmenu:get()):to_hex()
        utils.print(' \aFFFFFFFFKakoy-to eblan missnyl' )
        latest_active = globals.tickcount()
    end)

    angles.break_lc = LPH_JIT(function(self, cmd, current_preset)
        self.hide_shots_break = false
        self.activate_def_aa = false
        local me = entity.get_local_player()

        local reference = current_preset.defensive
        
        if not localplayer.exploits.charged then
            return
        end

        local defensive_aa = current_preset.defensive.enabled:get() and localplayer.exploits.defensive.left > 0

        local m_flNextAttack = entity.get_prop(me, 'm_flNextAttack')
        if m_flNextAttack > globals.curtime() then
            cmd.force_defensive = true
        end

        if utils.get_weapon_reload(me) ~= -1 then
            cmd.force_defensive = true
        end
        
        self.activate_def_aa = defensive_aa

        if reference.break_lc:get 'On shot anti-aim'
            and ref.is_on_shot_antiaim() then
            self.hide_shots_break = true
            cmd.force_defensive = true
            return
        elseif reference.break_lc:get 'Double tap' and ref.is_double_tap() then

            if localplayer.exploits.choked then -- defensive fix
                debugging_lagcomp = true
                cmd.no_choke = true
                cmd.allow_send_packet = false
            elseif not localplayer.exploits.choked then
                debugging_lagcomp = false
            end

            if reference.mode:get() == 'On peek' and localplayer.peeking then
                cmd.force_defensive = true
            elseif reference.mode:get() == 'Always on' then
                cmd.force_defensive = true
            end
            return
        end
                debugging_lagcomp = false
    end)



    angles.unset_aa = LPH_JIT(function(self)
        ref.antiaim.angles.enabled:override()
        ref.antiaim.angles.pitch[1]:override() do
            ref.antiaim.angles.pitch[2]:override()
        end

        ref.antiaim.angles.yaw[1]:override() do
            ref.antiaim.angles.yaw_base:override()
            ref.antiaim.angles.yaw[2]:override()
            ref.antiaim.angles.yaw_jitter[1]:override() do
                ref.antiaim.angles.yaw_jitter[2]:override()
            end
        end

        ref.antiaim.angles.body_yaw[1]:override() do
            ref.antiaim.angles.body_yaw[2]:override()
            ref.antiaim.angles.freestanding_body_yaw:override()
        end

        ref.antiaim.angles.freestanding:override() do
            ref.antiaim.angles.freestanding.hotkey:override()
        end

        ref.antiaim.angles.edge_yaw:override()
        ref.antiaim.angles.roll:override()
    end)

    angles.disabler = LPH_JIT(function(self, cmd)
        local function set()
            if ref.is_fake_duck() then
                self.pitch.type = 'Default'

                self.body_yaw.type = 'Off'
                self.body_yaw.freestanding = false

                self.yaw.base = 'At targets'
                self.yaw.type = '180'
                self.yaw.body = 0
                self.yaw.add = 0
                self.antibrute = 0
                self.yaw.value = 0
            else
                self.pitch.type = 'Off'

                self.body_yaw.type = 'Off'
                self.body_yaw.freestanding = false

                self.yaw.base = 'Local view'
                self.yaw.type = 'Spin'
                self.yaw.body = 0
                self.yaw.add = 0
                self.antibrute = 0
                self.yaw.value = 5
                cmd.no_choke = true
            end
        end

        if state.manual ~= nil then
            return false
        end
        
        local elements = menu.antiaim.settings.aa_disablers

        if not elements.enabled:get() then
            return
        end

        if elements.events:get('Warmup') then
            local game_rules = entity.get_game_rules()
            if not game_rules then
                goto continue
            end

            local m_bWarmupPeriod = entity.get_prop(
                game_rules, 'm_bWarmupPeriod'
            )

            if m_bWarmupPeriod == 1 then
                set()
                return true
            end

            ::continue::
        end

        if elements.events:get('No enemies') then
            local enemies = utils.get_entities()
            if #enemies == 0 then
                set()
                return true
            end
        end

        return false
    end)

    angles.fakelags = LPH_JIT(function(self, cmd)
        local reference = menu.antiaim.settings.fakelag

        ref.antiaim.fakelag.on:override(reference.enabled:get())
        ref.antiaim.fakelag.on.hotkey:override({reference.enabled.hotkey:get()})

        ref.antiaim.fakelag.amount:override(reference.method:get())
        ref.antiaim.fakelag.limit:override(reference.limit:get())

        ref.antiaim.fakelag.variance:override(reference.variance:get())
    end)

    angles.unset_fakelags = LPH_JIT(function(self)
        ref.antiaim.fakelag.on:override()
        ref.antiaim.fakelag.on.hotkey:override()

        ref.antiaim.fakelag.amount:override()
        ref.antiaim.fakelag.limit:override()

        ref.antiaim.fakelag.variance:override()
    end)

    angles.update_hotkeys = LPH_JIT(function(self, cmd)
        self.freestanding, self.edge_yaw = false, false
        ref.antiaim.angles.freestanding:override(false)
        ref.antiaim.angles.freestanding.hotkey:override({'On hotkey'})
        ref.antiaim.angles.edge_yaw:override(false)
        if avoid_backstab() or state.manual ~= nil then
            return
        end

        if menu.antiaim.settings.hotkeys.freestand:get() then
            ref.antiaim.angles.freestanding:override(true)
            ref.antiaim.angles.freestanding.hotkey:override({'Always on'})
            self.freestanding = true

            if cmd.chokedcommands == 0 then
                self.freestanding_side = get_side()
            end
        else
            self.freestanding_side = nil
        end

        if menu.antiaim.settings.hotkeys.edgeyaw:get() then
            ref.antiaim.angles.edge_yaw:override(true)
            self.edge_yaw = true
        end
    end)

    angles.update_safehead = LPH_JIT(function(self, state)
        local me = entity.get_local_player()
        if not menu.antiaim.settings.safe_head.enabled:get() then
            return false
        end

        local enemy = client.current_threat()
        if not enemy then
            return false
        end

        if utils.get_lethal(enemy, me) then
            return false
        end

        local moving = state == 'Move'
        if moving or avoid_backstab() or state.manual ~= nil then
            return false
        end

        local weapons = (
            localplayer.weapon_group == 'knife'
            or localplayer.weapon_group == 'taser'
        )

        local should_use_safehead = false


        local air_duck = state == 'Air-crouch'
        if air_duck and weapons then
            should_use_safehead = true
        end

        if should_use_safehead then
            self.pitch.type = 'Default'
            self.body_yaw.type = 'Off'
            self.body_yaw.freestanding = false
            self.yaw.base = 'At targets'
            self.yaw.type = '180'
            self.yaw.body = 1
            self.yaw.add = 0
            self.yaw.value = 0
            self.antibrute = 0
            self.freestanding = false
            self.edge_yaw = false
            return true
        end

        return false
    end)

    angles.update_delay = LPH_JIT_MAX(function(self, cmd, current_preset)
        local reference = current_preset.body_yaw
        local delays = current_preset.body_yaw.delay

        if not (reference.mode:get() == 'Jitter' or reference.mode:get() == 'Adaptive') then
            self.body_yaw.inverter = localplayer.body_yaw > 0
            return
        end

        if delays.mode:get() == 'Off' then
            self.body_yaw.inverter = not self.body_yaw.inverter
            self.delay_packets = 0
            self.inverts = self.inverts + 1
            return
        end

        self.delay_packets = self.delay_packets + 1

        if delays.mode:get() == 'Static' then
            local current_delay = (
                self.body_yaw.inverter
                and delays.left:get()
                or delays.right:get()
            )

            if self.delay_packets >= current_delay then
                local random = utils.random_float(0, 1.10)
                if delays.random:get() * 0.01 <= random then
                    self.body_yaw.inverter = not self.body_yaw.inverter
                    self.delay_packets = 0
                    self.inverts = self.inverts + 1
                end
            end
            return
        end

        if delays.mode:get() == 'Dynamic' then
            local min_delay = delays.min:get()
            local max_delay = delays.max:get()
            local speed = delays.speed:get() / 20
        
            if delays.dynamic:get() == 'Cycle' then
                if not self.dynamic_cycle then
                    self.dynamic_cycle = {
                        direction = 1,
                        current_delay = min_delay,
                        tick_counter = 0
                    }
                end
            
                self.dynamic_cycle.tick_counter = self.dynamic_cycle.tick_counter + 1
            
                local threshold = math.max(1, math.floor(self.dynamic_cycle.current_delay / speed + 0.5))
            
                if self.dynamic_cycle.tick_counter >= threshold then
                    self.body_yaw.inverter = not self.body_yaw.inverter
                    self.inverts = self.inverts + 1
                    self.dynamic_cycle.tick_counter = 0
                
                    if self.dynamic_cycle.direction == 1 then
                        if self.dynamic_cycle.current_delay < max_delay then
                            self.dynamic_cycle.current_delay = self.dynamic_cycle.current_delay + 1
                        else
                            self.dynamic_cycle.direction = -1
                            self.dynamic_cycle.current_delay = self.dynamic_cycle.current_delay - 1
                        end
                    else
                        if self.dynamic_cycle.current_delay > min_delay then
                            self.dynamic_cycle.current_delay = self.dynamic_cycle.current_delay - 1
                        else
                            self.dynamic_cycle.direction = 1
                            self.dynamic_cycle.current_delay = self.dynamic_cycle.current_delay + 1
                        end
                    end
                end
            
                return
            
            elseif delays.dynamic:get() == 'Random' then
                if not self.dynamic_random then
                    self.dynamic_random = {
                        next_delay = math.random(min_delay, max_delay)
                    }
                end
            
                local threshold = math.max(1, math.floor(self.dynamic_random.next_delay / speed + 0.5))
            
                if self.delay_packets >= threshold then
                    self.body_yaw.inverter = not self.body_yaw.inverter
                    self.delay_packets = 0
                    self.inverts = self.inverts + 1
                
                    self.dynamic_random.next_delay = math.random(min_delay, max_delay)
                end
            
                return

            elseif delays.dynamic:get() == 'Similar' then
                if not self.dynamic_similar then
                    self.dynamic_similar = {
                        base_delay = math.random(min_delay, max_delay),
                        next_delay = math.random(min_delay, max_delay),
                        jump_counter = 0,
                        jump_threshold = math.random(4, 8)
                    }
                end
            
                local s = self.dynamic_similar
                local threshold = math.max(1, math.floor(s.next_delay / speed + 0.5))
            
                if self.delay_packets >= threshold then
                    self.body_yaw.inverter = not self.body_yaw.inverter
                    self.delay_packets = 0
                    self.inverts = self.inverts + 1
                
                    s.jump_counter = s.jump_counter + 1
                
                    if s.jump_counter >= s.jump_threshold then
                        s.base_delay = math.random(min_delay, max_delay)
                        s.jump_counter = 0
                        s.jump_threshold = math.random(2, 3)
                    else
                        local drift = math.random(-2, 2)
                        s.base_delay = math.max(min_delay, math.min(max_delay, s.base_delay + drift))
                    end
                
                    local variance = math.random(0, math.max(1, math.floor((max_delay - min_delay) * 0.25)))
                    local offset = (math.random(0, 1) == 0 and 1 or -1) * variance
                    s.next_delay = math.max(min_delay, math.min(max_delay, s.base_delay + offset))
                end
            
                return
            end
        end
    end)

    angles.update_defensive_delay = LPH_JIT(function(self, cmd, current_preset)
        if not self.activate_def_aa then return end

        local defensive = current_preset.defensive

        -- -- Pitch delay
        -- if defensive.pitch.type:get() == 'Random' and defensive.pitch.delay:get() > 0 then
        --     if defensive.pitch.random_type:get() == 'Static' then
        --         if cmd.chokedcommands == 0 then
        --             self.defensive_delay_packets = self.defensive_delay_packets + 1
        --             if self.defensive_delay_packets >= defensive.pitch.delay:get() then
        --                 self.defensive_pitch_data.random_value = utils.random_int(
        --                     defensive.pitch.down:get(), defensive.pitch.up:get()
        --                 )
        --                 self.defensive_delay_packets = 0
        --             end
        --         end
        --     end
        -- end

        -- -- Yaw delay
        -- if defensive.yaw.type:get() == 'Random' and defensive.yaw.delay:get() > 0 then
        --     if defensive.yaw.random_type:get() == 'Static' then
        --         if cmd.chokedcommands == 0 then
        --             self.defensive_yaw_data.last_change_tick = self.defensive_yaw_data.last_change_tick + 1
        --             if self.defensive_yaw_data.last_change_tick >= defensive.yaw.delay:get() then
        --                 self.defensive_yaw_data.random_value = utils.random_int(
        --                     defensive.yaw.right:get(), defensive.yaw.left:get()
        --                 )
        --                 self.defensive_yaw_data.last_change_tick = 0
        --             end
        --         end
        --     end
        -- end

        -- -- Yaw L/R delay
        -- if defensive.yaw.type:get() == 'L/R' and defensive.yaw.delay:get() > 0 then
        --     if cmd.chokedcommands == 0 then
        --         self.defensive_yaw_data.last_change_tick = self.defensive_yaw_data.last_change_tick + 1
        --         if self.defensive_yaw_data.last_change_tick >= defensive.yaw.delay:get() then
        --             self.defensive_yaw_data.inverter = not self.defensive_yaw_data.inverter
        --             self.defensive_yaw_data.last_change_tick = 0
        --         end
        --     end
        -- end
    end)

    angles.update_body_yaw = LPH_JIT(function(self, cmd, current_preset)
        local reference = current_preset.body_yaw
        local inverter = self.body_yaw.inverter

        if self.activate_def_aa and current_preset.defensive.body_yaw.mode:get() ~= 'Default' then
            reference = current_preset.defensive.body_yaw
            inverter = self.yaw.inverter
        end

        if reference.mode:get() == 'Off' then
            self.body_yaw.type = 'Off'
            self.body_yaw.value = 0
            self.body_yaw.freestanding = false
            self.yaw.body = 0
            return
        end

        if reference.mode:get() == 'Static' then
            self.body_yaw.type = 'Static'
            self.body_yaw.value = reference.value:get()
            self.body_yaw.freestanding = false
            self.yaw.body = 0
            return
        end

        if reference.mode:get() == 'Opposite' then
            self.body_yaw.type = 'Opposite'
            self.body_yaw.value = 0
            self.body_yaw.freestanding = true
            self.yaw.body = 0
            return
        end

        if reference.mode:get() == 'Jitter' then
            local new_offset = reference.value:get()

            self.body_yaw.type = 'Static'
            self.body_yaw.freestanding = false

            if new_offset == 0 then
                new_offset = -1
            end

            if not self.body_yaw.inverter then
                new_offset = -new_offset
            end

            self.body_yaw.value = new_offset
            self.yaw.body = 0
            return
        end

        if reference.mode:get() == 'Adaptive' then
            local desync_value = 58
            
            if reference.adaptive:get() == 'Balance' then
                desync_value = desync_value * math.abs(math.sin(globals.curtime() * 3 * 2.5))
            elseif reference.adaptive:get() == 'Break' then
                if cmd.command_number % 7 == 0 then
                    desync_value = desync_value + (desync_value / 1.5)
                end
            end
            
            local base_offset = (
                self.body_yaw.inverter
                and desync_value
                or -desync_value
            )

            local new_offset = base_offset

            if localplayer.fired then
                self.body_yaw.type = 'Off'
                self.body_yaw.value = 0
                self.body_yaw.freestanding = false
                self.yaw.body = 0
                return
            end

            new_offset = utils.normalize(new_offset, -58, 58)
            self.body_yaw.freestanding = false

            local is_freestand = (
                self.freestanding and
                self.freestanding_side ~= nil
            )

            if not is_freestand then
                if cmd.chokedcommands == 0 then
                    cmd.allow_send_packet = false
                    self.yaw.body = new_offset
                    self.body_yaw.type = 'Static'
                    self.body_yaw.value = 0
                else
                    self.body_yaw.type = 'Off'
                    self.yaw.body = 0
                end
            else
                self.body_yaw.type = 'Static'
                self.body_yaw.value = new_offset
                self.yaw.body = 0
            end

            return
        end
    end)

    angles.update_yaw_jitter = LPH_JIT_MAX(function(self, current_preset)
        local reference = current_preset.yaw_jitter

        if reference.random:get() ~= 0 then
            self.randomize_jt = math.random(self.body_yaw.inverter and -reference.random:get() or reference.random:get()) * .5
        else
            self.randomize_jt = 0
        end

        if reference.mode:get() == 'Off' then
            self.yaw.add = 0

            return
        end

        if reference.mode:get() == 'Offset' then
            self.yaw.add = (
                self.body_yaw.inverter
                and reference.value:get() or 0
            )

            return
        end

        if reference.mode:get() == 'Center' then
            self.yaw.add = utils.round(
                self.body_yaw.inverter
                and reference.left:get() *.5
                or reference.right:get() *.5
            )

            return
        end

       if reference.mode:get() == 'Spin' then
            if not self.spin_data then
                self.spin_data = {
                    phase = 0,
                    last_update = 0
                }
            end

            local spin_left = reference.left:get()
            local spin_right = reference.right:get()
            local speed = 3

            local current_time = globals.curtime()
            local time_delta = current_time - self.spin_data.last_update
            self.spin_data.last_update = current_time

            self.spin_data.phase = (self.spin_data.phase + (speed * time_delta)) % 1

            local spin_value = self.body_yaw.inverter and spin_left or spin_right

            if self.spin_data.phase < 0.5 then
                local progress = self.spin_data.phase * 2
                self.yaw.add = spin_value * progress
            else
                local progress = (self.spin_data.phase - 0.5) * 2
                self.yaw.add = spin_value * (1 - progress)
            end
            return
        end

        if reference.mode:get() == 'Random' then
            self.yaw.add = utils.random_int(
                reference.left:get(), reference.right:get()
            )

            return
        end

        if reference.mode:get() == 'Ways' then
            if reference.ways:get() == 'Skitter' then
                local index = self.inverts % #skitter
                local add = skitter[index + 1] * reference.value:get()

                self.yaw.add = add
            elseif reference.ways:get() == '3 Ways' then
                local pattern = { -1.0, 0.0, 1.0 }
                local index = self.inverts % #pattern
                local add = pattern[index + 1] * reference.value:get()

                self.yaw.add = add
            elseif reference.ways:get() == '5 Ways' then
                local pattern = { -1.0, -0.5, 0.0, 0.5, 1.0 }
                local index = self.inverts % #pattern
                local add = pattern[index + 1] * reference.value:get()

                self.yaw.add = add
            end

            return
        end
    end)

    angles.update_yaw = LPH_JIT_MAX(function(self, cmd, current_preset)
        local reference = current_preset.yaw

        local defensive = current_preset.defensive.yaw
        -- if self.activate_def_aa and defensive.type:get() ~= 'Off' then
        --     local type_def = defensive.type:get()

        --     if type_def == '180' then
        --         self.yaw.type = '180'
        --         self.yaw.base = 'At targets'
        --         self.yaw.value = defensive.value:get()
        --         return true

        --     elseif type_def == 'Random' then
        --         self.yaw.type = '180'
        --         self.yaw.base = 'At targets'

        --         if defensive.random_type:get() == 'Default' then
        --             if cmd.chokedcommands == 0 then
        --                 random_yaw = utils.random_int(
        --                     defensive.right:get(), defensive.left:get()
        --                 )
        --             end
        --             self.yaw.value = random_yaw

        --         elseif defensive.random_type:get() == 'Static' then
        --             if self.defensive_yaw_data.random_value == 0 then
        --                 self.defensive_yaw_data.random_value = utils.random_int(
        --                     defensive.right:get(), defensive.left:get()
        --                 )
        --             end
        --             self.yaw.value = self.defensive_yaw_data.random_value
        --         end
        --         return true

        --     elseif type_def == 'L/R' then
        --         self.yaw.type = '180'
        --         self.yaw.base = 'At targets'

        --         local inverter = self.defensive_yaw_data.inverter
        --         self.yaw.value = inverter and defensive.left:get() or defensive.right:get()
        --         return true

        --     elseif type_def == 'Spin' and defensive.speed:get() ~= 0 then
        --         self.yaw.type = '180'
        --         self.yaw.base = 'At targets'

        --         if not self.defensive_yaw_spin then
        --             self.defensive_yaw_spin = {
        --                 phase = 0,
        --                 last_update = 0
        --             }
        --         end

        --         local current_time = globals.curtime()
        --         local time_delta = current_time - (self.defensive_yaw_spin.last_update or current_time)
        --         self.defensive_yaw_spin.last_update = current_time

        --         local speed = defensive.speed:get() * 0.05
        --         self.defensive_yaw_spin.phase = (self.defensive_yaw_spin.phase + (speed * time_delta)) % 1

        --         local spin_value = utils.lerp(defensive.right:get(), defensive.left:get(), 
        --             (math.sin(self.defensive_yaw_spin.phase * 2 * math.pi) + 1) / 2)

        --         self.yaw.value = utils.round(spin_value)
        --         return true
        --     end
        -- end

        if reference.left_rn:get() ~= 0 or reference.right_rn:get() then
            self.randomize = math.random(self.body_yaw.inverter and -reference.left_rn:get() or reference.right_rn:get()) * .5
        else
            self.randomize = 0
        end

        if reference.mode:get() == 'Off' then
            self.yaw.type = 'Off'
            return
        end
        
        if reference.mode:get() == '180' then
            self.yaw.type = '180'
            self.yaw.base = (
                state.manual ~= nil
                and 'Local view'
                or 'At targets'
            )
            self.yaw.value = reference.value:get()
            return
        end

        if reference.mode:get() == 'Left & Right' then
            self.yaw.type = '180'
            self.yaw.base = (
                state.manual ~= nil
                and 'Local view'
                or 'At targets'
            )
            self.yaw.value = (
                self.body_yaw.inverter
                and reference.left:get()
                or reference.right:get()
            )
            return

        end

        if reference.mode:get() == 'Switch' then
            self.yaw.type = '180'
            self.yaw.base = (
                state.manual ~= nil
                and 'Local view'
                or 'At targets'
            )

            local flicked_side = (
                self.body_yaw.inverter
                and reference.left_switch:get()
                or reference.right_switch:get()
            )

            local base_value = (
                self.body_yaw.inverter
                and reference.left:get()
                or reference.right:get()
            )

            local flick_time = globals.realtime() * 10 % 1

            if flick_time > 0.90 then
                self.yaw.value = base_value + flicked_side
            else
                self.yaw.value = base_value
            end
            return
            
        end

        if reference.mode:get() == 'Ways' then
            local ways_mode = reference.ways:get()
            local base_value = reference.value:get()

            self.yaw.type = '180'
            self.yaw.base = (
                state.manual ~= nil
                and 'Local view'
                or 'At targets'
            )

            if ways_mode == '3 Way' then
                local pattern = { -1.0, 0.0, 1.0 }
                local index = self.inverts % #pattern
                self.yaw.value = pattern[index + 1] * base_value

            elseif ways_mode == '5 Way' then
                local pattern = { -1.0, -0.5, 0.0, 0.5, 1.0 }
                local index = self.inverts % #pattern
                self.yaw.value = pattern[index + 1] * base_value
            end
            return

        end
    end)

    angles.update_pitch = LPH_JIT_MAX(function(self, cmd, current_preset)
        local defensive = current_preset.defensive.pitch

        if self.activate_def_aa and defensive.type:get() ~= 'Off' then
            local type_def = defensive.type:get()

            if type_def == 'Custom' then
                self.pitch.type = 'Custom'
                self.pitch.value = defensive.value:get()
                return

            elseif type_def == 'Random' then
                self.pitch.type = 'Custom'

                if defensive.random_type:get() == 'Default' then
                    if cmd.chokedcommands == 0 then
                        random_pitch = utils.random_int(
                            defensive.down:get(), defensive.up:get()
                        )
                    end
                    self.pitch.value = random_pitch

                elseif defensive.random_type:get() == 'Static' then
                    if self.defensive_pitch_data.random_value == 0 then
                        self.defensive_pitch_data.random_value = utils.random_int(
                            defensive.down:get(), defensive.up:get()
                        )
                    end
                    self.pitch.value = self.defensive_pitch_data.random_value
                end
                return

            elseif type_def == 'Jitter' then
                self.pitch.type = 'Custom'
                self.pitch.value = (
                    self.pitch.inverter
                    and defensive.up:get()
                    or defensive.down:get()
                )
                return

            elseif type_def == 'Spin' and defensive.speed:get() ~= 0 then
                if not self.defensive_spin_data then
                    self.defensive_spin_data = {
                        phase = 0,
                        last_update = 0
                    }
                end

                local current_time = globals.curtime()
                local time_delta = current_time - (self.defensive_spin_data.last_update or current_time)
                self.defensive_spin_data.last_update = current_time

                local speed = defensive.speed:get() * 0.05
                self.defensive_spin_data.phase = (self.defensive_spin_data.phase + (speed * time_delta)) % 1

                local spin_value = utils.lerp(defensive.down:get(), defensive.up:get(), 
                    (math.sin(self.defensive_spin_data.phase * 2 * math.pi) + 1) / 2)

                self.pitch.value = utils.round(spin_value)
                self.pitch.type = 'Custom'
                return
            end
        end

        self.pitch.type = 'Default'
        self.pitch.value = 0
    end)

    angles.set_aa = LPH_JIT(function(self)
        ref.antiaim.angles.enabled:override(true)

        ref.antiaim.angles.pitch[1]:override(self.pitch.type) do
            ref.antiaim.angles.pitch[2]:override(utils.normalize(
                self.pitch.value, -89, 89
            ))
        end

        ref.antiaim.angles.yaw[1]:override(self.yaw.type) do
            ref.antiaim.angles.yaw_base:override(self.yaw.base)

            local avoid_backstab = avoid_backstab()
            local manual = manual_yaw(avoid_backstab)

            local final_add = self.yaw.add

            if avoid_backstab then
                final_add = final_add + 180
            elseif manual ~= 0 then
                final_add = manual
            end

            -- print(final_add)

            ref.antiaim.angles.yaw[2]:override(
                utils.normalize(self.yaw.value
                + final_add + self.yaw.body 
                + self.antibrute + (self.randomize + self.randomize_jt), -180, 180)
            )

            ref.antiaim.angles.yaw_jitter[1]:override('Off') do
                ref.antiaim.angles.yaw_jitter[2]:override(0)
            end
        end

        ref.antiaim.angles.body_yaw[1]:override(self.body_yaw.type) do
            ref.antiaim.angles.body_yaw[2]:override(
                utils.normalize(self.body_yaw.value, -180, 180)
            )

            ref.antiaim.angles.freestanding_body_yaw:override(self.body_yaw.freestanding)
        end

        ref.antiaim.angles.freestanding:override(self.freestanding) do
            ref.antiaim.angles.freestanding.hotkey:override(
                self.freestanding and {'Always on'} or {'On hotkey'}
            )
        end

        ref.antiaim.angles.edge_yaw:override(self.edge_yaw)
        ref.antiaim.angles.roll:override(0)
    end)

    utils.set_callback('setup_command', function (cmd)
        angles:unset_aa()
        local current_preset = get_current_preset(state.current)
        angles:update_hotkeys(cmd)
        angles:fakelags(cmd)

        angles:break_lc(cmd, current_preset)
        angles:update_defensive_delay(cmd, current_preset)
        angles.updated = false do
            if angles:disabler(cmd) then
                goto continue
            end

            if angles:update_safehead(state.current) then
                goto continue
            end

            angles:update_pitch(cmd, current_preset)

            if cmd.chokedcommands == 0 then
                angles:update_delay(cmd, current_preset)
                angles.yaw.inverter = not angles.yaw.inverter
                angles.pitch.inverter = not angles.pitch.inverter
            end

            angles:update_body_yaw(cmd, current_preset)

            angles:update_yaw_jitter(current_preset)
            angles:update_yaw(cmd, current_preset)

            angles.updated = true
            ::continue::
        end

        angles:set_aa()
    end)

    utils.set_callback('pre_config_save', function ()
        angles:unset_aa()
        angles:unset_fakelags()
    end)

    local reset_defensive_data = LPH_JIT(function()
        angles.defensive_delay_packets = 0
        angles.defensive_pitch_data.random_value = 0
        angles.defensive_pitch_data.last_change_tick = 0
        angles.defensive_yaw_data.random_value = 0
        angles.defensive_yaw_data.last_change_tick = 0
        angles.defensive_yaw_data.inverter = false
    end)

    utils.set_callback('player_spawn', reset_defensive_data)
    utils.set_callback('round_start', reset_defensive_data)
    utils.set_callback('level_init', reset_defensive_data)

    utils.set_callback('bullet_impact', get_miss)
    utils.set_callback('player_hurt', player_hurt)
    utils.set_callback('round_end', reset_anti_brute)
    utils.set_callback('level_init', reset_anti_brute)
    utils.set_callback('pre_round_start', reset_anti_brute)
end

local function drag_sync_to_config_slots()
    if not drag_config_slots.version then
        return
    end

    drag_config_slots.version:set(1)

    for id, refs in pairs(drag_config_slots) do
        if id ~= 'version' then
            local entry = drag_shared_positions[id] or { }
            refs.x:set(utils.round(tonumber(entry.x) or 0))
            refs.y:set(utils.round(tonumber(entry.y) or 0))
            refs.sw:set(utils.round(tonumber(entry.sw) or 0))
            refs.sh:set(utils.round(tonumber(entry.sh) or 0))
        end
    end
end

local function drag_sync_from_config_slots()
    if not drag_config_slots.version or drag_config_slots.version:get() ~= 1 then
        return
    end

    for k in pairs(drag_shared_positions) do
        drag_shared_positions[k] = nil
    end

    for id, refs in pairs(drag_config_slots) do
        if id ~= 'version' then
            local x = refs.x:get()
            local y = refs.y:get()
            local sw = refs.sw:get()
            local sh = refs.sh:get()

            if sw > 0 and sh > 0 then
                drag_shared_positions[id] = {
                    x = x,
                    y = y,
                    sw = sw,
                    sh = sh
                }
            end
        end
    end

    database.write(DRAG_DATABASE_KEY, drag_shared_positions)
end

utils.set_callback('pre_config_save', LPH_JIT(function()
    drag_sync_to_config_slots()
end))

utils.set_callback('post_config_load', LPH_JIT(function()
    drag_sync_from_config_slots()
end))

local drag_system do
    drag_system = {
        key = DRAG_DATABASE_KEY,
        positions = drag_shared_positions,
        active = nil,
        default_marker_id = nil,
        offset = vector(0, 0),
        mouse = vector(0, 0),
        lmb_down = false,
        pressed = false,
        rmb_down = false,
        r_pressed = false,
        frame = -1,
        overlay_frame = -1,
        overlay_alpha = 0,
        snap_radius = 28,
        snap_lock = 0,
        snap_strength = 0.015,
        drag_smooth = 0.3,
        spring_states = { },
        return_states = { }
    }

    local function ensure_entry(id, default_pos, screen_size)
        local entry = drag_system.positions[id]
        if type(entry) ~= 'table' then
            entry = {
                x = default_pos.x,
                y = default_pos.y,
                sw = screen_size.x,
                sh = screen_size.y
            }
            drag_system.positions[id] = entry
        end

        -- Legacy migration: older build stored offsets from default position.
        if type(entry.sw) ~= 'number' or type(entry.sh) ~= 'number' then
            local ox = type(entry.x) == 'number' and entry.x or 0
            local oy = type(entry.y) == 'number' and entry.y or 0

            entry.x = default_pos.x + ox
            entry.y = default_pos.y + oy
            entry.sw = screen_size.x
            entry.sh = screen_size.y
        end

        if type(entry.x) ~= 'number' then entry.x = default_pos.x end
        if type(entry.y) ~= 'number' then entry.y = default_pos.y end

        return entry
    end

    local function update_input_state()
        local frame = globals.framecount()
        if drag_system.frame == frame then
            return
        end

        drag_system.frame = frame

        local mx, my = ui.mouse_position()
        drag_system.mouse = vector(mx or 0, my or 0)

        local down = client.key_state(0x01)
        drag_system.pressed = down and not drag_system.lmb_down
        drag_system.lmb_down = down

        local rdown = client.key_state(0x02)
        drag_system.r_pressed = rdown and not drag_system.rmb_down
        drag_system.rmb_down = rdown
    end

    local function get_damage_zone_hole(screen_size)
        local half_zone = 55
        local cx = screen_size.x * 0.5
        local cy = screen_size.y * 0.5
        return {
            x = cx - half_zone,
            y = cy - half_zone,
            w = half_zone * 2,
            h = half_zone * 2
        }
    end

    local function draw_drag_screen_dimming(screen_size)
        if not ui.is_menu_open() then
            return
        end

        local frame = globals.framecount()
        if drag_system.overlay_frame == frame then
            return
        end

        drag_system.overlay_frame = frame
        local target_alpha = drag_system.active ~= nil and 125 or 0
        drag_system.overlay_alpha = utils.lerp(drag_system.overlay_alpha, target_alpha, globals.frametime() * 10)
        if drag_system.overlay_alpha <= 1 then
            return
        end

        local overlay_color = color.new(0, 0, 0, drag_system.overlay_alpha)
        local hole = nil
        if drag_system.active == 'damage_indicator' then
            hole = get_damage_zone_hole(screen_size)
        end

        if type(hole) ~= 'table' then
            render.rectangle(vector(0, 0), screen_size, overlay_color)
            return
        end

        local hx = math.floor(utils.clamp(hole.x or 0, 0, screen_size.x))
        local hy = math.floor(utils.clamp(hole.y or 0, 0, screen_size.y))
        local hw = math.floor(utils.clamp(hole.w or 0, 0, screen_size.x - hx))
        local hh = math.floor(utils.clamp(hole.h or 0, 0, screen_size.y - hy))
        local right = hx + hw
        local bottom = hy + hh

        if hw <= 0 or hh <= 0 then
            render.rectangle(vector(0, 0), screen_size, overlay_color)
            return
        end

        local radius = math.floor(math.min(8, hw * 0.5, hh * 0.5))
        radius = math.max(radius, 0)

        if hy > 0 then
            render.rectangle(vector(0, 0), vector(screen_size.x, hy), overlay_color)
        end
        if bottom < screen_size.y then
            render.rectangle(vector(0, bottom), vector(screen_size.x, screen_size.y - bottom), overlay_color)
        end

        if radius == 0 then
            if hx > 0 then
                render.rectangle(vector(0, hy), vector(hx, hh), overlay_color)
            end
            if right < screen_size.x then
                render.rectangle(vector(right, hy), vector(screen_size.x - right, hh), overlay_color)
            end
            return
        end

        local mid_y = hy + radius
        local mid_h = hh - radius * 2

        if mid_h > 0 then
            if hx > 0 then
                render.rectangle(vector(0, mid_y), vector(hx, mid_h), overlay_color)
            end
            if right < screen_size.x then
                render.rectangle(vector(right, mid_y), vector(screen_size.x - right, mid_h), overlay_color)
            end
        end

        local r2 = radius * radius
        for yi = 0, radius - 1 do
            local dy = radius - yi - 0.5
            local cut_f = math.sqrt(math.max(r2 - dy * dy, 0))
            local cut = math.floor(cut_f)
            local inset = radius - cut

            local row_top = hy + yi
            local row_bottom = bottom - yi - 1

            local left_w = hx + inset
            local right_x = right - inset

            if left_w > 0 then
                render.rectangle(vector(0, row_top), vector(left_w, 1), overlay_color)
                render.rectangle(vector(0, row_bottom), vector(left_w, 1), overlay_color)
            end

            if right_x < screen_size.x then
                render.rectangle(vector(right_x, row_top), vector(screen_size.x - right_x, 1), overlay_color)
                render.rectangle(vector(right_x, row_bottom), vector(screen_size.x - right_x, 1), overlay_color)
            end

            local frac = cut_f - cut
            local edge_alpha = math.floor(overlay_color.a * (1 - frac) * 0.65 + 0.5)
            if edge_alpha > 0 then
                local edge_color = color.new(0, 0, 0, edge_alpha)
                local lx = left_w - 1
                local rx = right_x
                if lx >= 0 and lx < screen_size.x then
                    render.rectangle(vector(lx, row_top), vector(1, 1), edge_color)
                    render.rectangle(vector(lx, row_bottom), vector(1, 1), edge_color)
                end
                if rx >= 0 and rx < screen_size.x then
                    render.rectangle(vector(rx, row_top), vector(1, 1), edge_color)
                    render.rectangle(vector(rx, row_bottom), vector(1, 1), edge_color)
                end
            end
        end

    end

    drag_system.resolve = LPH_JIT(function(id, default_pos, size, mode, bounds, show_preview)
        update_input_state()

        local s = vector(client.screen_size())
        local entry = ensure_entry(id, default_pos, s)
        local pos = vector(entry.x, entry.y)
        local menu_open = ui.is_menu_open()
        local vertical_only = mode == 'vertical'
        local min_x = 0
        local max_x = math.max(s.x - size.x, 0)
        local min_y = 0
        local max_y = math.max(s.y - size.y, 0)

        if type(bounds) == 'table' then
            if type(bounds.min_x) == 'number' then min_x = bounds.min_x end
            if type(bounds.max_x) == 'number' then max_x = bounds.max_x end
            if type(bounds.min_y) == 'number' then min_y = bounds.min_y end
            if type(bounds.max_y) == 'number' then max_y = bounds.max_y end
        end

        min_x = utils.clamp(min_x, 0, math.max(s.x - size.x, 0))
        max_x = utils.clamp(max_x, min_x, math.max(s.x - size.x, 0))
        min_y = utils.clamp(min_y, 0, math.max(s.y - size.y, 0))
        max_y = utils.clamp(max_y, min_y, math.max(s.y - size.y, 0))

        if entry.sw ~= s.x or entry.sh ~= s.y then
            local sx = entry.sw ~= 0 and (s.x / entry.sw) or 1
            local sy = entry.sh ~= 0 and (s.y / entry.sh) or 1

            pos.x = pos.x * sx
            pos.y = pos.y * sy
            entry.x = pos.x
            entry.y = pos.y
            entry.sw = s.x
            entry.sh = s.y
            database.write(drag_system.key, drag_system.positions)
        end

        pos.x = utils.clamp(pos.x, min_x, max_x)
        pos.y = utils.clamp(pos.y, min_y, max_y)
        if vertical_only then
            pos.x = default_pos.x
        end
        entry.x = pos.x
        entry.y = pos.y

        local hovered = menu_open
            and drag_system.mouse.x >= pos.x
            and drag_system.mouse.x <= pos.x + size.x
            and drag_system.mouse.y >= pos.y
            and drag_system.mouse.y <= pos.y + size.y

        if menu_open and hovered and drag_system.r_pressed then
            entry.x = default_pos.x
            entry.y = default_pos.y
            entry.sw = s.x
            entry.sh = s.y
            pos = vector(default_pos.x, default_pos.y)
            drag_system.return_states[id] = nil
            if drag_system.active == id then
                drag_system.active = nil
                drag_system.default_marker_id = nil
            end
            database.write(drag_system.key, drag_system.positions)
        end

        if menu_open and hovered and drag_system.pressed and (drag_system.active == nil or drag_system.active == id) then
            drag_system.active = id
            drag_system.default_marker_id = id
            drag_system.offset = drag_system.mouse - pos
            drag_system.return_states[id] = nil
        end

        if drag_system.active == id then
            if menu_open and drag_system.lmb_down then
                local ny = utils.clamp(drag_system.mouse.y - drag_system.offset.y, min_y, max_y)
                local nx = vertical_only and default_pos.x or utils.clamp(drag_system.mouse.x - drag_system.offset.x, min_x, max_x)
                local target_x = nx
                local target_y = ny

                local dx = vertical_only and 0 or (default_pos.x - target_x)
                local dy = default_pos.y - target_y
                local dist = math.sqrt(dx * dx + dy * dy)

                local allow_snap = id ~= 'damage_indicator'
                if allow_snap and dist <= drag_system.snap_radius then
                    local state = drag_system.spring_states[id]
                    if type(state) ~= 'table' then
                        state = {vx = 0, vy = 0}
                        drag_system.spring_states[id] = state
                    end

                    local t = 1 - (dist / drag_system.snap_radius)
                    local pull = drag_system.snap_strength * (0.2 + t * t * 0.6)
                    target_x = target_x + (default_pos.x - target_x) * pull
                    target_y = target_y + (default_pos.y - target_y) * pull

                    local spring_k = 0.04
                    local damping = 0.76
                    if vertical_only then
                        pos.x = default_pos.x
                        state.vx = 0
                    else
                        state.vx = (state.vx + (target_x - pos.x) * spring_k) * damping
                        pos.x = pos.x + state.vx
                    end
                    state.vy = (state.vy + (target_y - pos.y) * spring_k) * damping
                    pos.y = pos.y + state.vy
                else
                    local state = drag_system.spring_states[id]
                    if type(state) == 'table' then
                        state.vx = 0
                        state.vy = 0
                    end
                    local smooth = utils.clamp(drag_system.drag_smooth or 0.3, 0.05, 1)
                    pos.x = pos.x + (nx - pos.x) * smooth
                    pos.y = pos.y + (ny - pos.y) * smooth
                end

                pos.x = vertical_only and default_pos.x or utils.clamp(pos.x, min_x, max_x)
                pos.y = utils.clamp(pos.y, min_y, max_y)

                entry.x = pos.x
                entry.y = pos.y
                entry.sw = s.x
                entry.sh = s.y
            else
                local release_dx = vertical_only and 0 or (default_pos.x - pos.x)
                local release_dy = default_pos.y - pos.y
                local release_dist = math.sqrt(release_dx * release_dx + release_dy * release_dy)
                if id ~= 'damage_indicator' and release_dist <= drag_system.snap_radius then
                    drag_system.return_states[id] = {
                        vx = 0,
                        vy = -0.25,
                        active = true
                    }
                else
                    drag_system.return_states[id] = nil
                end

                local state = drag_system.spring_states[id]
                if type(state) == 'table' then
                    state.vx = 0
                    state.vy = 0
                end
                drag_system.active = nil
                drag_system.default_marker_id = nil
                database.write(drag_system.key, drag_system.positions)
            end
        end

        if drag_system.active ~= id then
            local ret = drag_system.return_states[id]
            if type(ret) == 'table' and ret.active then
                local target_x = default_pos.x
                local target_y = default_pos.y

                local spring_x = 0.03
                local spring_y = 0.035
                local damping_x = 0.94
                local damping_y = 0.93

                if vertical_only then
                    pos.x = default_pos.x
                    ret.vx = 0
                else
                    ret.vx = ((ret.vx or 0) + (target_x - pos.x) * spring_x) * damping_x
                    pos.x = pos.x + ret.vx
                end
                ret.vy = ((ret.vy or 0) + (target_y - pos.y) * spring_y) * damping_y
                pos.y = pos.y + ret.vy

                pos.x = vertical_only and default_pos.x or utils.clamp(pos.x, min_x, max_x)
                pos.y = utils.clamp(pos.y, min_y, max_y)

                entry.x = pos.x
                entry.y = pos.y
                entry.sw = s.x
                entry.sh = s.y

                local done_x = vertical_only or (math.abs(target_x - pos.x) < 0.25 and math.abs(ret.vx or 0) < 0.06)
                local done_y = math.abs(target_y - pos.y) < 0.25 and math.abs(ret.vy or 0) < 0.06
                if done_x and done_y then
                    ret.active = false
                    ret.vx = 0
                    ret.vy = 0
                    pos.x = default_pos.x
                    pos.y = default_pos.y
                    entry.x = pos.x
                    entry.y = pos.y
                end
            end
        end

        draw_drag_screen_dimming(s)

        if menu_open and drag_system.default_marker_id == id and id ~= 'damage_indicator' then
            local marker_center = default_pos + size * 0.5
            local ring_color = color.new(255, 255, 255, 42)
            local core_color = color.new(255, 255, 255, 85)
            ring_color = color.new(255, 255, 255, 68)
            core_color = color.new(255, 255, 255, 130)

            render.circle(marker_center, ring_color, 5, 360, 1, 1)
            render.circle(marker_center, core_color, 2, 360, 1, 1)
        end

        if show_preview ~= false and menu_open and (hovered or drag_system.active == id) then
            render.rectangle(pos, size, color.new(255, 255, 255, 35))
        end

        return pos
    end)

    drag_system.should_block_attack = LPH_JIT(function()
        update_input_state()
        return ui.is_menu_open() and (drag_system.active ~= nil or drag_system.lmb_down or drag_system.rmb_down)
    end)

    utils.set_callback('setup_command', LPH_JIT(function(cmd)
        if not drag_system.should_block_attack() then
            return
        end

        cmd.in_attack = 0
        cmd.in_attack2 = 0

        if cmd.buttons ~= nil then
            cmd.buttons = bit.band(cmd.buttons, bit.bnot(1), bit.bnot(2048))
        end
    end))
end

local interface do
    interface = { }
    local items = menu.interface

    local scope_fov do
        scope_fov = { }
        local animation = 0
        local item = items.helpers
        scope_fov.override = LPH_JIT(function (e)

            local me = entity.get_local_player()
            if not me or not entity.is_alive(me) then return end

            local scoped = entity.get_prop(me, 'm_bIsScoped') == 1
            local weapon = entity.get_player_weapon(me)
            local m_zoomLevel = weapon and entity.get_prop(weapon, 'm_zoomLevel') or 0

            local animated = item.zoom_fov.animation_zoom:get()
            local first_zoom = item.zoom_fov.first_zoom:get()
            local second_zoom = item.zoom_fov.second_zoom:get()

            local targetFov

            if scoped then
                if m_zoomLevel == 2 then
                    targetFov = e.fov - second_zoom
                else
                    targetFov = e.fov - first_zoom
                end
            else
                targetFov = e.fov
            end

            if animated then
                if animation == nil or animation == 0 then
                    animation = e.fov
                end

                local ft = globals.frametime()
                animation = utils.lerp(animation, targetFov, ft * 10)

                e.fov = animation
            else
                e.fov = targetFov
            end
        end)

        item.zoom_fov.enabled:set_event('override_view', scope_fov.override)
    end

    local hitmarker do
        hitmarker = { }
        local item = items.helpers.kibit_marker
        local data, impacts = { }, { }

        local aim_fire = LPH_JIT(function(e)
            data.target = e.target
            data.vector = vector(e.x, e.y, e.z)
        end)

        local aim_hit = LPH_JIT(function(e)
            if e.target ~= data.target then
                return
            end

            impacts[#impacts+1] = {
                position = data.vector,
                time = globals.curtime()
            }
        end)

        hitmarker.paint = LPH_JIT(function()
            local first_color = color.new(0, 255, 100, 255)
            local second_color = color.new(0, 255, 100, 255)

            for index, marker in ipairs(impacts) do
                local time = marker.time
                if globals.curtime() >= time + 4 then
                    table.remove(impacts, index)
                    goto skipping
                end

                local size = vector(10, 2)
                local secondsize = vector(2, 10)
                local position = render.world_to_screen(marker.position)
                if position.x ~= 0 and position.y ~= 0 then
                    render.rectangle(position - vector(5, 1), size, first_color)
                    render.rectangle(position - vector(1, 5), secondsize, second_color)
                end

                ::skipping::
            end
        end)

        local round_start = LPH_JIT(function()
            data = { }
            impacts = { }
        end)

        item:set_event('aim_fire', aim_fire)
        item:set_event('aim_hit', aim_hit)
        item:set_event('round_start', round_start)
        item:set_event('paint', hitmarker.paint)
    end

    local scope_overlay do
        scope_overlay = { }
        local switch = items.helpers.overlay

        local style = switch.style
        local color_1 = switch.color_1 
        local color_2 = switch.color_2
        local animation_speed_setting = switch.animations
        local animation_speed = animation_speed_setting:get() or 0.12

        local progress = 0

        local animate_progress = LPH_JIT(function(scoped, speed)
            local target = scoped and 1 or 0
            speed = utils.clamp(speed, 0.01, animation_speed_setting:get() * 0.01)

            if animation_speed_setting:get() == 0 then
                progress = progress + (target - progress) * 1
            else
                progress = progress + (target - progress) * speed
            end

            if math.abs(target - progress) < 0.01 then
                progress = target
            end
        end)

        function scope_overlay.paint_ui()
            local me = entity.get_local_player()
            if not me then return end
            ref.visuals.scope:override(true)
        end

        scope_overlay.render = LPH_JIT(function()
            local me = entity.get_local_player()
            if not me then return end

            ref.visuals.scope:override(false)

            local scoped_state = entity.get_prop(me, 'm_bIsScoped') == 1

            animate_progress(scoped_state, animation_speed)

            if progress <= 0.01 then return end

            local screen_w, screen_h = client.screen_size()
            local cx = math.floor(screen_w / 2)
            local cy = math.floor(screen_h / 2)

            local r1, g1, b1, a1 = color_1:get_color()
            local r2, g2, b2, a2 = color_2:get_color()

            a1 = math.floor(((a1 ~= nil and a1) or 255))
            a2 = math.floor(((a2 ~= nil and a2) or 255))

            local gap_base = switch.lines_gap:get() or 4
            local offset_base = switch.lines_offset:get() or 10

            local gap = gap_base * progress
            local offset = offset_base * progress

            gap = math.floor(gap + 0.5)
            offset = math.floor(offset + 0.5)

            local style_val = style:get()

            if style_val == 'Default' then
                renderer.gradient(cx - gap - offset, cy, offset, 1, r1, g1, b1, a1, r2, g2, b2, a2, true)
                renderer.gradient(cx + gap + 1, cy, offset, 1, r2, g2, b2, a2, r1, g1, b1, a1, true)
                renderer.gradient(cx, cy - gap - offset, 1, offset, r1, g1, b1, a1, r2, g2, b2, a2, false)
                renderer.gradient(cx, cy + gap + 1, 1, offset, r2, g2, b2, a2, r1, g1, b1, a1, false)
            elseif style_val == 'T-Style' then
                renderer.gradient(cx - gap - offset, cy, offset, 1, r1, g1, b1, a1, r2, g2, b2, a2, true)
                renderer.gradient(cx + gap + 1, cy, offset, 1, r2, g2, b2, a2, r1, g1, b1, a1, true)
                renderer.gradient(cx, cy + gap + 1, 1, offset, r2, g2, b2, a2, r1, g1, b1, a1, false)
            elseif style_val == 'X-Style' then
                for i = 0, offset do
                    local alpha_factor = i / offset
                    local r = math.floor(r1 + (r2 - r1) * alpha_factor)
                    local g = math.floor(g1 + (g2 - g1) * alpha_factor)
                    local b = math.floor(b1 + (b2 - b1) * alpha_factor)
                    local a = math.floor(a1 + (a2 - a1) * alpha_factor)

                    renderer.rectangle(cx - gap - offset + i, cy - gap - offset + i, 1, 1, r, g, b, a)
                end

                for i = 0, offset do
                    local alpha_factor = i / offset
                    local r = math.floor(r1 + (r2 - r1) * alpha_factor)
                    local g = math.floor(g1 + (g2 - g1) * alpha_factor)
                    local b = math.floor(b1 + (b2 - b1) * alpha_factor)
                    local a = math.floor(a1 + (a2 - a1) * alpha_factor)

                    renderer.rectangle(cx + gap + 1 + offset - i, cy - gap - offset + i, 1, 1, r, g, b, a)
                end

                for i = 0, offset do
                    local alpha_factor = i / offset
                    local r = math.floor(r1 + (r2 - r1) * alpha_factor)
                    local g = math.floor(g1 + (g2 - g1) * alpha_factor)
                    local b = math.floor(b1 + (b2 - b1) * alpha_factor)
                    local a = math.floor(a1 + (a2 - a1) * alpha_factor)

                    renderer.rectangle(cx - gap - offset + i, cy + gap + 1 + offset - i, 1, 1, r, g, b, a)
                end

                for i = 0, offset do
                    local alpha_factor = i / offset
                    local r = math.floor(r1 + (r2 - r1) * alpha_factor)
                    local g = math.floor(g1 + (g2 - g1) * alpha_factor)
                    local b = math.floor(b1 + (b2 - b1) * alpha_factor)
                    local a = math.floor(a1 + (a2 - a1) * alpha_factor)

                    renderer.rectangle(cx + gap + 1 + offset - i, cy + gap + 1 + offset - i, 1, 1, r, g, b, a)
                end
            end
        end)

        switch.enabled:set_event('paint', scope_overlay.render, function(this)
            return this:get()
        end)

        switch.enabled:set_event('paint_ui', scope_overlay.paint_ui) 
    end

    local velocity_warning do
        velocity_warning = { }
        local menu_fade = animation.new()
        local preview_fill = animation.new()
        local preview_cycle = -1
        local function get_velocity_modifier()
            local me = entity.get_local_player()
            if not me then return nil end

            return entity.get_prop(me, 'm_flVelocityModifier')
        end

        velocity_warning.paint = LPH_JIT(function ()
            local velocity_mod = get_velocity_modifier()
            local menu_open = ui.is_menu_open()
            local me = entity.get_local_player()
            local alive = me and entity.is_alive(me)
            if not velocity_mod and not menu_open then return end

            local show_live = alive and velocity_mod ~= nil and velocity_mod < 1
            menu_fade:update(8, menu_open and not show_live)
            local fade = show_live and 1 or menu_fade.value
            if fade <= 0.01 then
                return
            end

            if show_live or fade > 0 then
                local preview_floor = 0.65
                local preview_mod = show_live and velocity_mod or preview_floor
                local restore_fraction = utils.clamp(1 - preview_mod, 0, 1)
                local display_fraction = restore_fraction

                if menu_open and not show_live then
                    local cycle_duration = 1.4
                    local cycle_now = math.floor(globals.realtime() / cycle_duration)
                    if cycle_now ~= preview_cycle then
                        preview_cycle = cycle_now
                        preview_fill.value = 0
                    end

                    local cycle_progress = (globals.realtime() % cycle_duration) / cycle_duration
                    local preview_fraction = utils.clamp((1 - preview_mod) / (1 - preview_floor), 0, 1)
                    local target_fraction = preview_fraction * utils.clamp(cycle_progress * 1.18, 0, 1)
                    display_fraction = preview_fill:update(3.8, target_fraction)
                else
                    preview_fill.value = restore_fraction
                    preview_cycle = -1
                end

                local slowed_percent = math.floor(display_fraction * 100)
                local panel_width = 164
                local panel_height = 22
                local track_height = 3

                local default_bar_position = vector(
                    (screen.x - panel_width) / 2,
                    screen.y / 2 - 290
                )
                local bar_size = vector(panel_width, panel_height)
                local crosshair_y = screen.y * 0.5
                local velocity_raw_min = 30
                local velocity_raw_max = crosshair_y - 22 - bar_size.y
                if velocity_raw_max < velocity_raw_min then
                    velocity_raw_max = velocity_raw_min
                end

                local velocity_center = (velocity_raw_min + velocity_raw_max) * 0.5
                local velocity_half = math.max((velocity_raw_max - velocity_raw_min) * 0.28, 10)
                local velocity_min = math.max(velocity_raw_min, velocity_center - velocity_half)
                local velocity_max = math.min(velocity_raw_max, velocity_center + velocity_half)

                local velocity_bounds = {
                    min_y = velocity_min,
                    max_y = velocity_max
                }

                local bar_position = drag_system.resolve('velocity_warning', default_bar_position, bar_size, 'vertical', velocity_bounds)

                if menu_open and drag_system.active == 'velocity_warning' then
                    local guide_x = bar_position.x + panel_width * 0.5
                    local line_top = velocity_bounds.min_y + bar_size.y * 0.5
                    local line_bottom = velocity_bounds.max_y + bar_size.y * 0.5
                    render.line(vector(guide_x, line_top), vector(guide_x, line_bottom), color.new(255, 255, 255, math.floor(58 * fade)))
                    render.line(vector(guide_x - 1, line_top), vector(guide_x - 1, line_bottom), color.new(255, 255, 255, math.floor(34 * fade)))
                    render.line(vector(guide_x + 1, line_top), vector(guide_x + 1, line_bottom), color.new(255, 255, 255, math.floor(34 * fade)))
                end

                local accent_color = color.new(items.helpers.velocity_warning.main_color:get())
                local bright_color = accent_color:lerp(color.new(255, 255, 255, accent_color.a), 0.22)
                local soft_color = accent_color:lerp(color.new(22, 24, 30, accent_color.a), 0.58)
                local pulse = (math.sin(globals.realtime() * 6) + 1) * 0.5

                local label_position = bar_position + vector(10, 1)
                local value_position = bar_position + vector(panel_width - 10, 1)
                local label_text = 'velocity restore'
                local value_text = string.format('%02d%%', slowed_percent)

                render.text(label_position, color.new(255, 255, 255, math.floor(190 * fade)), '', 0, label_text)
                render.text(value_position, bright_color:new_alpha(math.floor((125 + pulse * 45) * fade)), 'r', 0, value_text)

                local track_position = bar_position + vector(10, panel_height - 4)
                local track_size = vector(panel_width - 20, track_height)
                local track_color = color.new(255, 255, 255, math.floor(10 * fade))
                local track_inner = color.new(0, 0, 0, math.floor(90 * fade))
                local progress_width = math.floor(track_size.x * display_fraction)

                render.rounded_rectangle(track_position, track_size, track_color, 2)
                render.rounded_rectangle(track_position, track_size, track_inner, 2)

                if progress_width > 0 then
                    local fill_size = vector(progress_width, track_size.y)
                    if progress_width > 4 then
                        render.rounded_rectangle(track_position, fill_size, accent_color:new_alpha(math.floor(170 * fade)), 2)
                    else
                        render.rectangle(track_position, fill_size, accent_color:new_alpha(math.floor(170 * fade)))
                    end
                    render.gradient(
                        track_position,
                        fill_size,
                        bright_color:new_alpha(math.floor(160 * fade)),
                        soft_color:new_alpha(math.floor(105 * fade)),
                        true
                    )
                end

                local marker_x = track_position.x + progress_width
                marker_x = utils.clamp(marker_x, track_position.x, track_position.x + track_size.x)
                local marker_position = vector(marker_x, track_position.y + track_size.y * 0.5)
                render.circle(marker_position, bright_color:new_alpha(math.floor((80 + pulse * 40) * fade)), 3, 360, 1, 1)
                render.circle(marker_position, color.new(255, 255, 255, math.floor(185 * fade)), 1, 360, 1)
            end
        end)

        items.helpers.velocity_warning.enabled:set_event("paint", velocity_warning.paint)
    end

    do -- damage_indicator
        local damage_indicator_anim = animation.new()
        local animated_value = 0
        
        function interface.damage_indicator()
            local me = entity.get_local_player()
            local menu_open = ui.is_menu_open()
            if not menu_open and not (me and entity.is_alive(me)) then
                return
            end

            local weapon_group = localplayer and localplayer.weapon_group
            if not menu_open and (weapon_group == 'knife'
                or weapon_group == 'grenade'
                or weapon_group == 'c4') then
                return
            end

            damage_indicator_anim:update(7, menu_open or ref.is_minimum_damage())

            local default_damage = ref.ragebot.minimum_damage:get()
            local dmg_override = ref.ragebot.minimum_damage_override[2]:get()
            local current_value = ref.is_minimum_damage() and dmg_override or default_damage

            local always_on = items.helpers.damage_indicator.always_on:get()

            local y_offset = utils.round(damage_indicator_anim.value * 25)
            if always_on or menu_open then
                y_offset = 10
            end

            local a_mult = (always_on or menu_open) and 1 or damage_indicator_anim.value

            local base_color = color.new(255, 255, 255, 255 * a_mult)

            animated_value = utils.lerp(animated_value, current_value, 0.15 * globals.absoluteframetime() * 150)

            local display_text = tostring(utils.round(animated_value))
            if utils.round(animated_value) == 0 then
                display_text = 'Auto'
            end

            local font
            if items.helpers.damage_indicator.font:get() == 'Default' then
                font = ''
            else
                font = '-'
            end

            local text_size = render.measure_text(font, display_text)
            local current_screen = vector(client.screen_size())
            local base_default_position = vector(current_screen.x * 0.5 + 5, current_screen.y * 0.5 - 10)

            local horizontal_padding = 5
            local vertical_padding = 3
            local animation_range = always_on and 0 or 25
            local drag_size = vector(
                text_size.x + horizontal_padding * 2,
                text_size.y + vertical_padding * 2 + animation_range
            )

            local crosshair = vector(current_screen.x * 0.5, current_screen.y * 0.5)
            local half_zone = 55
            local zone_pos = vector(crosshair.x - half_zone, crosshair.y - half_zone)
            local zone_size = vector(half_zone * 2, half_zone * 2)

            if ui.is_menu_open() and drag_system.active == 'damage_indicator' then
                render.blur(zone_pos, zone_size, 72, 2)
                render.rounded_rectangle(zone_pos, zone_size, color.new(255, 255, 255, 42), 8)
            end

            local drag_bounds = {
                min_x = zone_pos.x,
                max_x = zone_pos.x + zone_size.x - drag_size.x,
                min_y = zone_pos.y,
                max_y = zone_pos.y + zone_size.y - drag_size.y
            }

            local anchor = drag_system.resolve('damage_indicator', base_default_position, drag_size, nil, drag_bounds, false)
            local text_x = anchor.x + (drag_size.x - text_size.x) * 0.5
            local text_y = anchor.y + vertical_padding + animation_range - (always_on and 0 or y_offset)
            local position = vector(text_x, text_y)

            render.text(position, base_color, font, 0, display_text)
        end
    end

    do -- manual_arrows
        local manual_left = animation.new()
        local manual_right = animation.new()
        local manual_back = animation.new()
        local function update_manual_animations()
            local me = entity.get_local_player()
            if not me or not entity.is_alive(me) then return end

            manual_left:update(6, state.manual == 'Left')
            manual_right:update(6, state.manual == 'Right')
            manual_back:update(6, state.manual == nil)
        end

        function interface.manual_arrows()
            local me = entity.get_local_player()
            if not me or not entity.is_alive(me) then
                return
            end

            local position = vector(screen.x * 0.5, screen.y * 0.5)
            local accent = color.new(items.helpers.manual_arrows.color:get())
            local offset = items.helpers.manual_arrows.offset:get()

            local left_color = color.new(100, 255 * (1 - manual_back.value)):lerp(accent, manual_left.value)
            local right_color = color.new(100, 255 * (1 - manual_back.value)):lerp(accent, manual_right.value)
            local back_color = color.new(100, 255 * manual_back.value):lerp(accent, manual_back.value)

            update_manual_animations()

            if items.helpers.manual_arrows.style:get() == 'Default' then
                render.text(position - vector(offset, 2), left_color, '+c', 0, '<')
                render.text(position + vector(offset, -2), right_color, '+c', 0, '>')
                return
            elseif items.helpers.manual_arrows.style:get() == 'Alternative' then
                local arrow_size = 7
                local left_center = position - vector(offset, 0)
                local right_center = position + vector(offset, 0)

                local function draw_soft_triangle(center, direction, clr)
                    local outer = clr:new_alpha(math.floor(clr.a * 0.18))
                    local mid = clr:new_alpha(math.floor(clr.a * 0.4))

                    if direction == 'left' then
                        render.triangle(
                            center + vector(-arrow_size - 2, 0),
                            center + vector(arrow_size + 1, -arrow_size - 1),
                            center + vector(arrow_size + 1, arrow_size + 1),
                            outer
                        )
                        render.triangle(
                            center + vector(-arrow_size - 1, 0),
                            center + vector(arrow_size, -arrow_size),
                            center + vector(arrow_size, arrow_size),
                            mid
                        )
                        render.triangle(
                            center + vector(-arrow_size, 0),
                            center + vector(arrow_size - 1, -arrow_size + 1),
                            center + vector(arrow_size - 1, arrow_size - 1),
                            clr
                        )
                    else
                        render.triangle(
                            center + vector(arrow_size + 2, 0),
                            center + vector(-arrow_size - 1, -arrow_size - 1),
                            center + vector(-arrow_size - 1, arrow_size + 1),
                            outer
                        )
                        render.triangle(
                            center + vector(arrow_size + 1, 0),
                            center + vector(-arrow_size, -arrow_size),
                            center + vector(-arrow_size, arrow_size),
                            mid
                        )
                        render.triangle(
                            center + vector(arrow_size, 0),
                            center + vector(-arrow_size + 1, -arrow_size + 1),
                            center + vector(-arrow_size + 1, arrow_size - 1),
                            clr
                        )
                    end
                end

                draw_soft_triangle(left_center, 'left', left_color)
                draw_soft_triangle(right_center, 'right', right_color)
                return
            end
        end
    end

    do -- centered indicators
        local scoped = animation.new()
        local dt_anim = animation.new()
        local uncharged_anim = animation.new()
        local charged_anim = animation.new()
        local hs_anim = animation.new()
        local grenade_holding = animation.new()
        local damage_anim = animation.new()
        local fs_anim = animation.new()
        local fs_side_anim = animation.new()
        local edgeyaw_anim = animation.new()
        local body_anim = animation.new()
        local safe_anim = animation.new()
        local ping_anim = animation.new()
        local statements = animation.new()
        local last_state = 'STATE'
        local center_indicator_labels = {'DT', 'OS', 'FS', 'EDGE', 'DMG', 'PING', 'BAIM', 'SAFE'}

        local function update_animation()
            local me = entity.get_local_player()
            if not (me and entity.is_alive(me)) then
                return false
            end

            hs_anim:update(7.5, ref.is_on_shot_antiaim())
            dt_anim:update(9, ref.is_double_tap())
            uncharged_anim:update(10, not (localplayer.exploits.charged and localplayer.weapon_ready))
            charged_anim:update(9, localplayer.exploits.charged and localplayer.weapon_ready and uncharged_anim.value == 0)
            damage_anim:update(7.5, ref.is_minimum_damage())
            safe_anim:update(7.5, ref.is_force_safe_point())
            body_anim:update(7.5, ref.is_force_baim())
            ping_anim:update(7.5, ref.is_ping_spike())
            fs_anim:update(7.5, angles.freestanding)
            fs_side_anim:update(7.5, angles.freestanding and angles.freestanding_side ~= nil)
            edgeyaw_anim:update(7.5, angles.edge_yaw)
            scoped:update(8.5, entity.get_prop(me, 'm_bIsScoped') == 1)
            statements:update(9, last_state == state.current:upper())
            if statements.value < 0.65 then
                last_state = state.current:upper()
            end
            grenade_holding:update(8.5, localplayer.weapon_group == 'grenade' and 0.5 or 1)
            return true
        end

        local function get_saved_vertical_drag_y(id, default_y, screen_height)
            local entry = drag_system.positions[id]
            if type(entry) ~= 'table' then
                return default_y
            end

            local y = tonumber(entry.y) or default_y
            local saved_height = tonumber(entry.sh) or screen_height
            if saved_height ~= 0 and saved_height ~= screen_height then
                y = y * (screen_height / saved_height)
            end

            return y
        end

        local function measure_center_indicator_layout(style)
            local space = 4
            local scoped_value = scoped.value or 0
            local charged_value = charged_anim.value or 0
            local cursor_y = 0
            local min_x, max_x = math.huge, -math.huge
            local max_y = 0

            local function push_bounds(center_x, width, top_y, height)
                if width <= 0 or height <= 0 then
                    return
                end

                local left = center_x - width * 0.5
                local right = center_x + width * 0.5
                min_x = math.min(min_x, left)
                max_x = math.max(max_x, right)
                max_y = math.max(max_y, top_y + height)
            end

            local function push_centered_row(flags, text, shift_x, anim, advance_scale)
                local measure = render.measure_text(flags, text) do
                    measure.x = measure.x + 1
                end

                local visible = anim == nil and 1 or anim
                if visible > 0.01 then
                    push_bounds(shift_x, measure.x * visible, cursor_y, measure.y)
                end

                cursor_y = cursor_y + measure.y * (advance_scale == nil and visible or advance_scale)
            end

            do
                local flags_label = style == 'Beatiful' and 'cb' or 'c'
                local label_measure = render.measure_text(flags_label, db.script:lower()) do
                    label_measure.x = label_measure.x + 1
                end
                local label_shift = utils.round(label_measure.x * 0.5 + space + 1) * scoped_value
                push_bounds(label_shift, label_measure.x, cursor_y, label_measure.y)
                cursor_y = cursor_y + label_measure.y * 0.85 + 1
            end

            if style == 'Beatiful' then
                local build_measure = render.measure_text('c-', db.build:upper()) do
                    build_measure.x = build_measure.x + 1
                end
                local build_shift = -1 + utils.round(build_measure.x * 0.5 + space + 1) * scoped_value
                push_bounds(build_shift, build_measure.x, cursor_y, build_measure.y)
                cursor_y = cursor_y + build_measure.y * 0.85 + 1
            end

            if style == 'Beatiful' then
                local dt_measure = render.measure_text('-c', 'DT') do
                    dt_measure.x = dt_measure.x + 1
                end
                local dt_shift = (dt_measure.x * 0.5 + 3) * scoped_value - (4 * (charged_value * (1 - scoped_value)))
                if dt_anim.value > 0.01 then
                    push_bounds(dt_shift, dt_measure.x, cursor_y, dt_measure.y)
                    local circle_x = (dt_measure.x + dt_measure.x - 1) * scoped_value + (7 * (charged_value * (1 - scoped_value)))
                    push_bounds(circle_x, 6, cursor_y, math.max(dt_measure.y, 6))
                end
                cursor_y = cursor_y + dt_measure.y * dt_anim.value
            else
                local dt_measure = render.measure_text('-c', 'DT') do
                    dt_measure.x = dt_measure.x + 1
                end
                local dt_shift = -1 + utils.round(dt_measure.x * 0.5 + space) * scoped_value
                if dt_anim.value > 0.01 then
                    push_bounds(dt_shift, dt_measure.x * dt_anim.value, cursor_y, dt_measure.y)
                end
                cursor_y = cursor_y + dt_measure.y * dt_anim.value
            end

            local function push_standard_indicator(label, anim)
                local measure = render.measure_text('-c', label) do
                    measure.x = measure.x + 1
                end
                local shift = utils.round(measure.x * 0.5 + space - 1) * scoped_value
                if anim > 0.01 then
                    push_bounds(shift, measure.x * anim, cursor_y, measure.y)
                end
                cursor_y = cursor_y + measure.y * anim
            end

            push_standard_indicator('OS', hs_anim.value)
            push_standard_indicator('FS', fs_anim.value)
            push_standard_indicator('EDGE', edgeyaw_anim.value)
            push_standard_indicator('DMG', damage_anim.value)
            push_standard_indicator('PING', ping_anim.value)
            push_standard_indicator('BAIM', body_anim.value)
            push_standard_indicator('SAFE', safe_anim.value)

            if min_x == math.huge then
                min_x = -12
                max_x = 12
                max_y = 14
            end

            return {
                min_x = min_x,
                max_x = max_x,
                height = math.max(max_y, 14),
                pad_x = 6,
                pad_y = 4
            }
        end

        local function resolve_center_indicator_anchor(style)
            local current_screen = vector(client.screen_size())
            local default_center_x = current_screen.x * 0.5
            local default_y = current_screen.y * 0.5 + 20
            local layout = measure_center_indicator_layout(style)
            local drag_size = vector(
                (layout.max_x - layout.min_x) + layout.pad_x * 2,
                layout.height + layout.pad_y * 2
            )
            local default_position = vector(default_center_x + layout.min_x - layout.pad_x, default_y - layout.pad_y)
            local logs_top = get_saved_vertical_drag_y('aimbot_logs_under_crosshair', current_screen.y * 0.75, current_screen.y)
            local gap_to_logs = 12
            local max_y = math.max(default_position.y, logs_top - drag_size.y - gap_to_logs)
            local drag_bounds = {
                min_y = default_position.y,
                max_y = max_y
            }

            return drag_system.resolve('center_indicators', default_position, drag_size, 'vertical', drag_bounds), layout, drag_bounds, drag_size
        end

        function interface.center_minimify()
            local me = entity.get_local_player()
            if not (me and entity.is_alive(me)) then
                return
            end

            update_animation()

            local anchor, layout, drag_bounds, drag_size = resolve_center_indicator_anchor('Minimify')
            local position = vector(anchor.x - layout.min_x + layout.pad_x, anchor.y + layout.pad_y)
            local space = 4
            local alpha_mult = 1 - scoped.value * 0.5

            if ui.is_menu_open() and drag_system.active == 'center_indicators' then
                local guide_x = anchor.x + drag_size.x * 0.5
                local line_top = drag_bounds.min_y + drag_size.y * 0.5
                local line_bottom = drag_bounds.max_y + drag_size.y * 0.5 - 10
                render.line(vector(guide_x, line_top), vector(guide_x, line_bottom), color.new(255, 255, 255, 58))
                render.line(vector(guide_x - 1, line_top), vector(guide_x - 1, line_bottom), color.new(255, 255, 255, 34))
                render.line(vector(guide_x + 1, line_top), vector(guide_x + 1, line_bottom), color.new(255, 255, 255, 34))
            end

            local accent_color = color.new(items.advert.indicate.color1:get_color()):new_alpha(255 * grenade_holding.value * alpha_mult)
            local white_color = color.new(255, 255 * grenade_holding.value * alpha_mult)

            do -- label
                local flags_label = 'c'
                local measure_label = render.measure_text(flags_label, db.script:lower()) do
                    measure_label.x = measure_label.x + 1
                end

                local text = db.script:lower()
                render.text(position + vector(utils.round(measure_label.x * .5 + space + 1) * scoped.value, 0), accent_color, flags_label, measure_label.x, text)

                position.y = position.y + measure_label.y * 0.85 + 1
            end

            do --dt
                local anim = dt_anim.value
                local color = color.new(255, 50, 50)
                    :lerp(white_color, charged_anim.value):new_alpha(white_color.a * anim)
                local flags = '-c'
                local label = 'DT'
                local measure = render.measure_text(flags, label) do
                    measure.x = measure.x + 1
                end

                render.text(position -vector(1) + vector(utils.round(measure.x * .5 + space) * scoped.value, 0), color, flags, measure.x * anim, label)
                position.y = position.y + measure.y * anim
            end

            do --hs
                local anim = hs_anim.value
                local color = color.new(255, 50, 50)
                    :lerp(white_color, charged_anim.value):new_alpha(white_color.a * anim)
                local flags = '-c'
                local label = 'OS'
                local measure = render.measure_text(flags, label) do
                    measure.x = measure.x + 1
                end

                render.text(position + vector(utils.round(measure.x * .5 + space-1) * scoped.value, 0), color, flags, measure.x * anim, label)
                position.y = position.y + measure.y * anim
            end

            do --fs
                local anim = fs_anim.value
                local color = color.new(255, 50, 50)
                    :lerp(white_color, fs_side_anim.value):new_alpha(white_color.a * anim)
                local flags = '-c'
                local label = 'FS'
                local measure = render.measure_text(flags, label) do
                    measure.x = measure.x + 1
                end

                render.text(position + vector(utils.round(measure.x * .5 + space-1) * scoped.value, 0), color, flags, measure.x * anim, label)
                position.y = position.y + measure.y * anim
            end

            do --edge yaw
                local anim = edgeyaw_anim.value
                local color = white_color:new_alpha(white_color.a * anim)
                local flags = '-c'
                local label = 'EDGE'
                local measure = render.measure_text(flags, label) do
                    measure.x = measure.x + 1
                end

                render.text(position + vector(utils.round(measure.x * .5 + space-1) * scoped.value, 0), color, flags, measure.x * anim, label)
                position.y = position.y + measure.y * anim
            end

            do --dmg
                local anim = damage_anim.value
                local color = white_color:new_alpha(white_color.a * anim)
                local flags = '-c'
                local label = 'DMG'
                local measure = render.measure_text(flags, label) do
                    measure.x = measure.x + 1
                end

                render.text(position + vector(utils.round(measure.x * .5 + space - 1) * scoped.value, 0), color, flags, measure.x * anim, label)
                position.y = position.y + measure.y * anim
            end

            do --ping
                local anim = ping_anim.value
                local color = white_color:new_alpha(white_color.a * anim)
                local flags = '-c'
                local label = 'PING'
                local measure = render.measure_text(flags, label) do
                    measure.x = measure.x + 1
                end

                render.text(position + vector(utils.round(measure.x * .5 + space - 1) * scoped.value, 0), color, flags, measure.x * anim, label)
                position.y = position.y + measure.y * anim
            end

            do --baim
                local anim = body_anim.value
                local color = white_color:new_alpha(white_color.a * anim)
                local flags = '-c'
                local label = 'BAIM'
                local measure = render.measure_text(flags, label) do
                    measure.x = measure.x + 1
                end

                render.text(position + vector(utils.round(measure.x * .5 + space-1) * scoped.value, 0), color, flags, measure.x * anim, label)
                position.y = position.y + measure.y * anim
            end

            do --safe
                local anim = safe_anim.value
                local color = white_color:new_alpha(white_color.a * anim)
                local flags = '-c'
                local label = 'SAFE'
                local measure = render.measure_text(flags, label) do
                    measure.x = measure.x + 1
                end

                render.text(position + vector(utils.round(measure.x * .5 + space-1) * scoped.value, 0), color, flags, measure.x * anim, label)
                position.y = position.y + measure.y * anim
            end
        end

        function interface.center_beatiful()
            local me = entity.get_local_player()
            if not (me and entity.is_alive(me)) then
                return
            end

            update_animation()

            local anchor, layout, drag_bounds, drag_size = resolve_center_indicator_anchor('Beatiful')
            local position = vector(anchor.x - layout.min_x + layout.pad_x, anchor.y + layout.pad_y)
            local space = 4
            local alpha_mult = 1 - scoped.value * 0.5

            if ui.is_menu_open() and drag_system.active == 'center_indicators' then
                local guide_x = anchor.x + drag_size.x * 0.5
                local line_top = drag_bounds.min_y + drag_size.y * 0.5
                local line_bottom = drag_bounds.max_y + drag_size.y * 0.5 - 10
                render.line(vector(guide_x, line_top), vector(guide_x, line_bottom), color.new(255, 255, 255, 58))
                render.line(vector(guide_x - 1, line_top), vector(guide_x - 1, line_bottom), color.new(255, 255, 255, 34))
                render.line(vector(guide_x + 1, line_top), vector(guide_x + 1, line_bottom), color.new(255, 255, 255, 34))
            end

            local accent_color = color.new(items.advert.indicate.color1:get_color()):new_alpha(255 * grenade_holding.value * alpha_mult)
            local second_color = color.new(items.advert.indicate.color2:get_color()):new_alpha(255 * grenade_holding.value * alpha_mult)
            local white_color = color.new(255, 255 * grenade_holding.value * alpha_mult)

            do -- build
                local flags_label = 'c-'
                local measure_label = render.measure_text(flags_label, db.build:upper()) do
                    measure_label.x = measure_label.x + 1
                end

                local text = render.gradient_text(db.build:upper(), globals.realtime() * 1.5, accent_color, second_color, true)
                render.text(position - vector(1) + vector(utils.round(measure_label.x * .5 + space + 1) * scoped.value, 0), accent_color, flags_label, measure_label.x, text)

                position.y = position.y + measure_label.y * 0.85 + 1
            end

            do -- label
                local flags_label = 'cb'
                local measure_label = render.measure_text(flags_label, db.script:lower()) do
                    measure_label.x = measure_label.x + 1
                end

                local text = render.gradient_text(db.script:lower(), globals.realtime() * 1.5, accent_color, second_color, true)
                render.text(position + vector(utils.round(measure_label.x * .5 + space + 1) * scoped.value, 0), accent_color, flags_label, measure_label.x, text)

                position.y = position.y + measure_label.y * 0.85 + 1
            end

            do --dt
                local anim = dt_anim.value
                local color = color.new(255, 50, 50)
                    :lerp(white_color, charged_anim.value):new_alpha(white_color.a * anim)
                local flags = '-c'
                local label = 'DT'
                local measure = render.measure_text(flags, label) do
                    measure.x = measure.x + 1
                end

                render.text(position + vector((measure.x * 0.5 +3) * scoped.value - (4 * (charged_anim.value * (1 - scoped.value))), 0), color, flags, 0, label)
                render.circle(position + vector((measure.x + measure.x - 1) * scoped.value + (7 * (charged_anim.value * (1 - scoped.value))), 1), color, 3, 360, charged_anim.value, 1.05)
                position.y = position.y + measure.y * anim
            end

            do --hs
                local anim = hs_anim.value
                local color = color.new(255, 50, 50)
                    :lerp(white_color, charged_anim.value):new_alpha(white_color.a * anim)
                local flags = '-c'
                local label = 'OS'
                local measure = render.measure_text(flags, label) do
                    measure.x = measure.x + 1
                end

                render.text(position + vector(utils.round(measure.x * .5 + space-1) * scoped.value, 0), color, flags, measure.x * anim, label)
                position.y = position.y + measure.y * anim
            end

            do --fs
                local anim = fs_anim.value
                local color = color.new(255, 50, 50)
                    :lerp(white_color, fs_side_anim.value):new_alpha(white_color.a * anim)
                local flags = '-c'
                local label = 'FS'
                local measure = render.measure_text(flags, label) do
                    measure.x = measure.x + 1
                end

                render.text(position + vector(utils.round(measure.x * .5 + space-1) * scoped.value, 0), color, flags, measure.x * anim, label)
                position.y = position.y + measure.y * anim
            end

            do --edge yaw
                local anim = edgeyaw_anim.value
                local color = white_color:new_alpha(white_color.a * anim)
                local flags = '-c'
                local label = 'EDGE'
                local measure = render.measure_text(flags, label) do
                    measure.x = measure.x + 1
                end

                render.text(position + vector(utils.round(measure.x * .5 + space-1) * scoped.value, 0), color, flags, measure.x * anim, label)
                position.y = position.y + measure.y * anim
            end

            do --dmg
                local anim = damage_anim.value
                local color = white_color:new_alpha(white_color.a * anim)
                local flags = '-c'
                local label = 'DMG'
                local measure = render.measure_text(flags, label) do
                    measure.x = measure.x + 1
                end

                render.text(position + vector(utils.round(measure.x * .5 + space - 1) * scoped.value, 0), color, flags, measure.x * anim, label)
                position.y = position.y + measure.y * anim
            end

            do --ping
                local anim = ping_anim.value
                local color = white_color:new_alpha(white_color.a * anim)
                local flags = '-c'
                local label = 'PING'
                local measure = render.measure_text(flags, label) do
                    measure.x = measure.x + 1
                end

                render.text(position + vector(utils.round(measure.x * .5 + space - 1) * scoped.value, 0), color, flags, measure.x * anim, label)
                position.y = position.y + measure.y * anim
            end

            do --baim
                local anim = body_anim.value
                local color = white_color:new_alpha(white_color.a * anim)
                local flags = '-c'
                local label = 'BAIM'
                local measure = render.measure_text(flags, label) do
                    measure.x = measure.x + 1
                end

                render.text(position + vector(utils.round(measure.x * .5 + space-1) * scoped.value, 0), color, flags, measure.x * anim, label)
                position.y = position.y + measure.y * anim
            end

            do --safe
                local anim = safe_anim.value
                local color = white_color:new_alpha(white_color.a * anim)
                local flags = '-c'
                local label = 'SAFE'
                local measure = render.measure_text(flags, label) do
                    measure.x = measure.x + 1
                end

                render.text(position + vector(utils.round(measure.x * .5 + space-1) * scoped.value, 0), color, flags, measure.x * anim, label)
                position.y = position.y + measure.y * anim
            end
        end
    end

    do -- watermark
        local scoped = animation.new()

        local counter = 0
        local fps = 0
        local last_time = globals.realtime()

        local get_player_kd = LPH_JIT(function(player)
            if player == nil then return nil end

            local player_resource = entity.get_player_resource()
            if player_resource == nil then return nil end

            local kills = entity.get_prop(player_resource, 'm_iKills', player) or 0
            local deaths = entity.get_prop(player_resource, 'm_iDeaths', player) or 0

            if deaths > 0 then
                return kills / deaths
            end
            return kills
        end)

        local get_shared_fps_value = LPH_JIT(function()
            counter = counter + 1
            local now = globals.realtime()
            if now - last_time >= 0.05 then
                fps = counter / (now - last_time)
                counter = 0
                last_time = now
            end
            return math.floor(fps + 0.5)
        end)

        interface.watermark_minimify = LPH_JIT(function()
            local me = entity.get_local_player()

            if not (me and entity.is_alive(me)) then
                return
            end

            local main_color = color.new(items.advert.watermark.color1:get_color())

            local position = vector(screen.x *.5, screen.y - 15)

            local is_scoped = entity.get_prop(me, 'm_bIsScoped') == 1
            scoped:update(7.5, is_scoped and 0 or 1)
            
            local final_color = main_color:new_alpha(utils.clamp(main_color.a, 70, 255) * scoped.value)
            render.text(position, final_color, 'cb', 0, db.script:lower())
        end)
        
        interface.watermark_beatiful = LPH_JIT(function()
            local me = entity.get_local_player()
        
            if not (me and entity.is_alive(me)) then
                return
            end
        
            local display = items.advert.watermark.display:get()
            local function has_option(display, value)
                for _, v in ipairs(display) do
                    if v == value then return true end
                end
                return false
            end

            local show_script = has_option(display, 'Script')
            local show_name = has_option(display, 'Name')
            local show_fps = has_option(display, 'FPS')
            local show_ping = has_option(display, 'PING')
            local show_kd = has_option(display, 'K/D')
            local show_time = has_option(display, 'Time')
        
            local dpi_scale = 1.0
        
            local main_color = color.new(items.advert.watermark.color1:get_color())
            local white = {255, 255, 255, 255}
            local gray = {200, 200, 200, 255}
            local mc_to_hex = main_color:to_hex()
            local function measure_width(flags, text)
                local width = renderer.measure_text(flags, text)
                return width
            end
        
            local fps_value = show_fps  and get_shared_fps_value() or nil
            local ping_value = show_ping and math.floor(client.latency() * 1000 + 0.5) or nil
            local kd = show_kd and (get_player_kd(me) or 0) or nil
            local time_text = show_time and (function()
                local h, m, s = client.system_time()
                return string.format('%02d:%02d:%02d', h, m, s)
            end)() or nil
            local authority = render.gradient_text(db.script:lower(), globals.realtime() * 0.5, main_color, color.new(gray), true)
        
            local sections = {}
        
            if show_script then
                sections[#sections + 1] = {
                    {color = gray, text = authority, shift_x = 0, shift_y = 0, flags = 0},
                }
            end
        
            if show_name then
                sections[#sections + 1] = {
                    {color = main_color, text = db.user:lower(), shift_x = 0, shift_y = 0, flags = 0},
                }
            end
        
            if show_fps then
                sections[#sections + 1] = {
                    {color = white, text = '\a' .. mc_to_hex .. tostring(fps_value), shift_x = 0, shift_y = 0, flags = string.byte('-')},
                    {color = gray,  text = 'FPS', shift_x = 1, shift_y = 2, flags = '-'},
                }
            end
        
            if show_ping then
                sections[#sections + 1] = {
                    {color = white, text = '\a' .. mc_to_hex .. tostring(ping_value), shift_x = 0, shift_y = 0, flags = string.byte('-')},
                    {color = gray,  text = 'PING', shift_x = 1, shift_y = 2, flags = '-'},
                }
            end
        
            if show_kd then
                sections[#sections + 1] = {
                    {color = white, text = '\a' .. mc_to_hex .. string.format('%.1f', kd), shift_x = 0, shift_y = 0, flags = string.byte('-')},
                    {color = gray,  text = 'K/D', shift_x = 1, shift_y = 2, flags = '-'},
                }
            end
        
            if show_time then
                sections[#sections + 1] = {
                    {color = white, text = '\a' .. mc_to_hex .. time_text, shift_x = 0, shift_y = 0, flags = 0},
                }
            end
        
            if #sections == 0 then return end
        
            local section_spacing = math.max(6,  math.floor(12 * dpi_scale + 0.5))
            local horizontal_padding = math.max(4,  math.floor(6  * dpi_scale + 0.5))
            local height = math.max(14, math.floor(20 * dpi_scale + 0.5))
            local text_base_offset_y = math.floor(6 * dpi_scale + 0.5)
        
            local measures = {}
            local total_width = 0
        
            for i, data in ipairs(sections) do
                local sizes = {}
                local section_width = 0
            
                for j, section in ipairs(data) do
                    local tw, th = renderer.measure_text(section.flags, section.text)
                    local shift_x = math.floor(section.shift_x * dpi_scale + 0.5)
                    section_width = section_width + tw + shift_x
                    sizes[j] = {tw, th}
                end

                total_width = total_width + section_width + (i ~= #sections and section_spacing or 0)
                measures[i] = sizes
            end
        
            local bg_width = total_width + horizontal_padding * 2 + 20

            local screen_w, screen_h = client.screen_size()
        
            local position = items.advert.watermark.position:get()
            local x_pos, y_pos
        
            if position == 'Right-upper' then
                x_pos = screen_w - bg_width - 10
                y_pos = 10
            else
                x_pos = screen_w / 2 - bg_width / 2
                y_pos = screen_h - 35
            end
        
            local bg_pos = vector(x_pos, y_pos)
            local bg_size = vector(bg_width, height)
            local bg_color = color.new(0, 0, 0, 58)
            local border_color = color.new(0, 0, 0, 98)
            local corner_radius = 6

            render.blur(bg_pos, bg_size, 72, 2)
            render.rounded_rectangle(bg_pos, bg_size, border_color, corner_radius)
            render.rounded_rectangle(bg_pos + vector(1, 1), bg_size - vector(2, 2), bg_color, corner_radius - 1)
        
            local draw_x = x_pos + horizontal_padding + 10
            local draw_y = y_pos + (height / 2)
            local offset = 0
        
            for i, data in ipairs(sections) do
                local sizes = measures[i]
                local section_offset = 0
            
                for j, section in ipairs(data) do
                    local text_size = sizes[j]
                    local clr = section.color
                    local shift_x = math.floor(section.shift_x * dpi_scale + 0.5)
                    local shift_y = math.floor(section.shift_y * dpi_scale + 0.5)
                    local flags = section.flags
                    local text_x = draw_x + offset + section_offset + shift_x
                
                    if type(clr) == 'table' then
                        renderer.text(
                            text_x,
                            draw_y - text_base_offset_y + shift_y,
                            clr[1], clr[2], clr[3], clr[4],
                            flags, nil, section.text
                        )
                    else
                        renderer.text(
                            text_x,
                            draw_y - text_base_offset_y + shift_y,
                            clr.r, clr.g, clr.b, clr.a,
                            flags, nil, section.text
                        )
                    end
                
                    section_offset = section_offset + text_size[1]
                end

                offset = offset + section_offset
            
                if i ~= #sections then
                    offset = offset + section_spacing
                end
            end
        end)
    end

    items.advert.indicate.enabled:set_event('paint', function ()
        if items.advert.indicate.style:get() == 'Minimify' then
            interface.center_minimify()
        elseif items.advert.indicate.style:get() == 'Beatiful' then
            interface.center_beatiful()
        end
    end)
    items.advert.watermark.enabled:set_event('paint', function ()
        if items.advert.watermark.style:get() == 'Minimify' then
            interface.watermark_minimify()
        elseif items.advert.watermark.style:get() == 'Beatiful' then
            interface.watermark_beatiful()
        end
    end)
    items.helpers.damage_indicator.enabled:set_event('paint', interface.damage_indicator)
    items.helpers.manual_arrows.enabled:set_event('paint', interface.manual_arrows)
end

local settings do
    local quickladder do
        quickladder = { }
        quickladder.setup_command = LPH_JIT(function(cmd)
            local me = entity.get_local_player()
            if entity.get_prop(me, 'm_MoveType') ~= 9 or not localplayer.air or localplayer.weapon_group == 'grenade' then
                return
            end

            local forward = vector(entity.get_prop(me, 'm_vecLadderNormal'))
            if forward:lengthsqr() == 0 then
                return
            end

            local view = vector(client.camera_angles())
            local angle = vector(forward:angles())

            local delta_yaw = angle.y - view.y + 180
            local delta_pitch = angle.x - view.x

            delta_yaw = utils.normalize(delta_yaw)
            delta_pitch = utils.clamp(delta_pitch, -89, 89)

            local abs_yaw = math.abs(delta_yaw)

            local pitch = 89
            local yaw_offset = -90

            local is_looking_down = delta_pitch < -45
            local is_looking_to_right = delta_yaw > 0

            local is_sidemove = cmd.sidemove > 0
            local is_forwardmove = cmd.forwardmove > 0

            if abs_yaw > 70 and abs_yaw < 135 then
                if cmd.forwardmove ~= 0 or cmd.sidemove == 0 then
                    return
                end

                if not is_looking_to_right then
                    yaw_offset = -yaw_offset
                end

                if is_looking_to_right then
                    is_sidemove = not is_sidemove
                end

                cmd.in_back = is_sidemove and 1 or 0
                cmd.in_forward = is_sidemove and 0 or 1

                if is_looking_to_right then
                    is_sidemove = not is_sidemove
                end

                cmd.in_moveleft = is_sidemove and 1 or 0
                cmd.in_moveright = is_sidemove and 0 or 1

                cmd.pitch = pitch
                cmd.yaw = utils.normalize(angle.y + yaw_offset)

                return
            end

            if cmd.sidemove ~= 0 or cmd.forwardmove == 0 then
                return
            end

            if not is_looking_to_right then
                yaw_offset = -yaw_offset
            end

            if not is_looking_down then
                is_forwardmove = not is_forwardmove
            end

            cmd.in_back = is_forwardmove and 0 or 1
            cmd.in_forward = is_forwardmove and 1 or 0

            if not is_looking_to_right then
                is_forwardmove = not is_forwardmove
            end

            cmd.in_moveleft = is_forwardmove and 1 or 0
            cmd.in_moveright = is_forwardmove and 0 or 1

            cmd.pitch = pitch
            cmd.yaw = utils.normalize(angle.y + yaw_offset)
        end)

        menu.settings.helpers.quick_ladder:set_event('setup_command', quickladder.setup_command)
    end

    local fakeduck_unlock do
        fakeduck_unlock = { }
        local should_override = false
        local item = menu.settings.helpers.unlock_fd

        fakeduck_unlock.setup_command = LPH_JIT(function(cmd)
            local me = entity.get_local_player()
            local m_flDuckAmount = entity.get_prop(me, 'm_flDuckAmount')

            local should_unoverride = (ui.is_menu_open() or cmd.in_duck == 0 or localplayer.air)
            if should_unoverride then
                should_override = false
            elseif m_flDuckAmount > 0.75 then
                should_override = true
            end

            ref.ragebot.fakeduck:override(should_override and {'On hotkey', 0} or nil)
        end)

        item:set_callback(function (this)
            local value = this:get()
            if not value then
                ref.ragebot.fakeduck:override()
            end

            utils.set_callback('setup_command', fakeduck_unlock.setup_command, value)
            utils.set_callback('pre_config_save', function () ref.ragebot.fakeduck:override() end, value)
        end, true)
    end

    local consolefilter do
        consolefilter = { }
        local item = menu.settings.helpers.console_filter

        item:set_callback(function(self)
            if self:get() then
                cvar.con_filter_enable:set_int(1)
                cvar.con_filter_text:set_string('IrWL5106TZZKNFPz4P4Gl3pSN?J370f5hi373ZjPg%VOVh6lN')
                client.exec('con_filter_enable 1')
            else
                cvar.con_filter_enable:set_int(0)
                cvar.con_filter_text:set_string('')
                client.exec('con_filter_enable 0')
            end
        end, true)

        defer(function ()
            cvar.con_filter_enable:set_int(0)
            cvar.con_filter_text:set_string('')
            client.exec('con_filter_enable 0')
        end)
    end

    local buybot do
        buybot = { }
        local item = menu.settings.buybot
        local last_buy_round = -1

        local primary_commands = {
            ['Autosniper'] = { t = 'g3sg1', ct = 'scar20' },
            ['Scout'] = { default = 'ssg08' },
            ['AWP'] = { default = 'awp' },
            ['AK-47 / M4A1'] = { t = 'ak47', ct = 'm4a1' },
            ['Galil / Famas'] = { t = 'galilar', ct = 'famas' },
            ['MAC-10 / MP9'] = { t = 'mac10', ct = 'mp9' },
            ['MP7'] = { default = 'mp7' },
            ['UMP-45'] = { default = 'ump45' },
            ['P90'] = { default = 'p90' },
            ['Nova'] = { default = 'nova' },
            ['XM1014'] = { default = 'xm1014' },
            ['MAG-7 / Sawed-Off'] = { t = 'sawedoff', ct = 'mag7' },
            ['Negev'] = { default = 'negev' },
            ['M249'] = { default = 'm249' }
        }

        local pistol_commands = {
            ['Dual Berettas'] = { default = 'elite' },
            ['P250'] = { default = 'p250' },
            ['Tec-9 / Five-SeveN'] = { t = 'tec9', ct = 'fn57' },
            ['CZ75-Auto'] = { default = 'cz75a' },
            ['Desert Eagle'] = { default = 'deagle' },
            ['R8 Revolver'] = { default = 'revolver' }
        }

        local grenade_commands = {
            ['HE Grenade'] = 'hegrenade',
            ['Molotov / Incendiary'] = { t = 'molotov', ct = 'incgrenade' },
            ['Smoke'] = 'smokegrenade',
            ['Flashbang'] = 'flashbang',
            ['Decoy'] = 'decoy'
        }

        local function resolve_buy(entry, team_num)
            if not entry then
                return nil
            end

            if type(entry) == 'string' then
                return entry
            end

            if team_num == 2 then
                return entry.t or entry.default or entry.ct
            end

            if team_num == 3 then
                return entry.ct or entry.default or entry.t
            end

            return entry.default or entry.t or entry.ct
        end

        local function append_buy(commands, value)
            if value and value ~= '' then
                table.insert(commands, 'buy ' .. value)
            end
        end

        buybot.round_start = LPH_JIT(function()
            if not item.enabled:get() then
                return
            end

            local current_round = entity.get_game_rules() and entity.get_prop(entity.get_game_rules(), 'm_totalRoundsPlayed') or globals.tickcount()
            if current_round == last_buy_round then
                return
            end

            last_buy_round = current_round

            client.delay_call(0.2, function()
                if not item.enabled:get() then
                    return
                end

                local me = entity.get_local_player()
                if not me or not entity.is_alive(me) then
                    return
                end

                local team_num = entity.get_prop(me, 'm_iTeamNum')
                if team_num ~= 2 and team_num ~= 3 then
                    return
                end

                local commands = { }

                append_buy(commands, resolve_buy(primary_commands[item.primary:get()], team_num))
                append_buy(commands, resolve_buy(pistol_commands[item.pistol:get()], team_num))

                local armor = item.armor:get()
                if armor == 'Kevlar' then
                    append_buy(commands, 'vest')
                elseif armor == 'Helmet + Kevlar' then
                    append_buy(commands, 'vesthelm')
                end

                if item.defuse:get() and team_num == 3 then
                    append_buy(commands, 'defuser')
                end

                if item.taser:get() then
                    append_buy(commands, 'taser')
                end

                for _, grenade_name in ipairs({
                    'HE Grenade',
                    'Molotov / Incendiary',
                    'Smoke',
                    'Flashbang',
                    'Decoy'
                }) do
                    if item.grenades:get(grenade_name) then
                        append_buy(commands, resolve_buy(grenade_commands[grenade_name], team_num))
                    end
                end

                if #commands > 0 then
                    client.exec(table.concat(commands, '; '))
                end
            end)
        end)

        utils.set_callback('round_start', buybot.round_start)
    end

    local thirdperson do
        thirdperson = { }
        local item = menu.settings.helpers
        local state = false
        local cam_idealdist = cvar.cam_idealdist
        local c_mindistance = cvar.c_mindistance
        local c_maxdistance = cvar.c_maxdistance
        local cam_idealdist_backup = tonumber(cam_idealdist:get_string())
        local c_mindistance_backup = tonumber(c_mindistance:get_string())
        local c_maxdistance_backup = tonumber(c_maxdistance:get_string())
        local distance = 0

        function thirdperson.shutdown()
            cam_idealdist:set_int(cam_idealdist_backup)
            c_mindistance:set_int(c_mindistance_backup)
            c_maxdistance:set_int(c_maxdistance_backup)
        end

        local function set_thirdperson()
            if not state then
                return
            end

            cam_idealdist:set_int(distance)
            c_mindistance:set_int(distance)
            c_maxdistance:set_int(distance)
        end

        item.thirdperson_dist:set_callback(function (item)
            distance = item:get()
            set_thirdperson()
        end, true)

        item.thirdperson:set_callback(function (item)
            state = item:get()
            if not state then
                thirdperson.shutdown()
                return
            end

            set_thirdperson()
        end, true)

        defer(thirdperson.shutdown)
    end

    local aspect_ratio do
        aspect_ratio = { }
        local item = menu.settings.helpers
        local state = false
        local r_aspectratio = cvar.r_aspectratio
        local default_ratio = tonumber(r_aspectratio:get_string())
        local ratio_value = 0

        local function set_aspect_ratio(ratio)
            if not state then
                return
            end

            r_aspectratio:set_float(ratio)
        end

        item.aspect_ratio_value:set_callback(function (item)
            ratio_value = item:get() * 0.01
            set_aspect_ratio(ratio_value)
        end, true)

        function aspect_ratio.shutdown()
            r_aspectratio:set_float(default_ratio)
        end

        item.aspect_ratio:set_callback(function (item)
            state = item:get()

            if not state then
                aspect_ratio.shutdown()
                return
            end

            set_aspect_ratio(ratio_value)
        end, true)

        defer(aspect_ratio.shutdown)
    end

    local prediction do
        prediction = { }
        local item = menu.settings.aimbot.prediction
        local was_active = false

        local cl_interp = cvar.cl_interp
        local cl_interpolate = cvar.cl_interpolate
        local cl_interp_ratio = cvar.cl_interp_ratio
        local cl_clock_correction = cvar.cl_clock_correction

        local defaults = {
            captured = false,
            interp = 0.015625,
            interpolate = 1,
            interp_ratio = 2,
            clock_correction = 1
        }

        local desired = {
            interp = -1,
            interpolate = 0,
            interp_ratio = 1,
            clock_correction = 0
        }

        local applied = { status = nil }
        local prediction_applied = false
        local extrapolation_applied = false
        local extrapolated_records = { }

        local function capture_defaults()
            if defaults.captured then
                return
            end

            defaults.interp = tonumber(cl_interp:get_string()) or defaults.interp
            defaults.interpolate = tonumber(cl_interpolate:get_string()) or defaults.interpolate
            defaults.interp_ratio = tonumber(cl_interp_ratio:get_string()) or defaults.interp_ratio
            defaults.clock_correction = tonumber(cl_clock_correction:get_string()) or defaults.clock_correction
            defaults.captured = true
        end

        local function is_active()
            return item.enabled:get() and item.enabled.hotkey:get()
        end

        local function time_to_ticks(time)
            return utils.round((time or 0) / globals.tickinterval())
        end

        local function read_origin(player)
            local ox, oy, oz = entity.get_prop(player, 'm_vecOrigin')
            if ox == nil then
                ox, oy, oz = entity.get_origin(player)
            end

            if ox == nil then
                return nil, nil
            end

            local ax, ay, az = entity.get_prop(player, 'm_vecAbsOrigin')
            if ax == nil then
                ax, ay, az = ox, oy, oz
            end

            return vector(ox, oy, oz), vector(ax, ay, az)
        end

        local function write_origin(player, origin, abs_origin)
            if not player or origin == nil then
                return
            end

            pcall(entity.set_prop, player, 'm_vecOrigin', origin.x, origin.y, origin.z)

            if abs_origin ~= nil then
                pcall(entity.set_prop, player, 'm_vecAbsOrigin', abs_origin.x, abs_origin.y, abs_origin.z)
            end
        end

        local function restore_extrapolation()
            if not extrapolation_applied and next(extrapolated_records) == nil then
                return
            end

            for player, data in pairs(extrapolated_records) do
                if data ~= nil and entity.get_classname(player) == 'CCSPlayer' then
                    write_origin(player, data.origin, data.abs_origin)
                end

                extrapolated_records[player] = nil
            end

            extrapolation_applied = false
        end

        local function get_extrapolate_ticks(player, speed)
            local max_ticks = item.extrapolate_ticks and item.extrapolate_ticks:get() or 8
            local sim_time, old_sim_time = utils.get_simtime(player)
            local choked_ticks = 0
            local server_delta = 0

            if sim_time ~= nil and old_sim_time ~= nil and sim_time > old_sim_time then
                choked_ticks = time_to_ticks(sim_time - old_sim_time)
            end

            if sim_time ~= nil and sim_time > 0 then
                server_delta = globals.tickcount() - time_to_ticks(sim_time)
            end

            local latency_ticks = time_to_ticks(client.latency())
            local ticks = math.max(choked_ticks, math.min(server_delta, choked_ticks + latency_ticks + 1))

            if ticks <= 0 and speed > 80 then
                ticks = 1
            end

            return utils.clamp(ticks, 0, max_ticks)
        end

        local function update_status(active, ticks)
            local text
            if not active then
                text = '\f<gray>\f<right_arrow_d> \rPrediction: \vOff'
            else
                if (ticks or 0) > 0 then
                    text = string.format('\f<gray>\f<right_arrow_d> \rPrediction: \vOn \f<gray>(interp + extrap %dt)', ticks or 0)
                else
                    text = '\f<gray>\f<right_arrow_d> \rPrediction: \vOn \f<gray>(interp + extrap)'
                end
            end

            if applied.status ~= text then
                applied.status = text
                item.status:set(text)
            end
        end

        local function apply_prediction()
            capture_defaults()
            cl_interp:set_float(desired.interp)
            cl_interpolate:set_int(desired.interpolate)
            cl_interp_ratio:set_int(desired.interp_ratio)
            cl_clock_correction:set_int(desired.clock_correction)
            prediction_applied = true
        end

        local function apply_extrapolation()
            restore_extrapolation()

            local highest_ticks = 0
            local extrapolated = 0

            for _, player in ipairs(utils.get_entities()) do
                repeat
                    if entity.is_dormant(player) then
                        break
                    end

                    local vx, vy, vz = entity.get_prop(player, 'm_vecVelocity')
                    if vx == nil then
                        break
                    end

                    local speed = math.sqrt(vx * vx + vy * vy)
                    if speed < 8 and math.abs(vz or 0) < 8 then
                        break
                    end

                    local ticks = get_extrapolate_ticks(player, speed)
                    if ticks <= 0 then
                        break
                    end

                    local origin, abs_origin = read_origin(player)
                    if origin == nil then
                        break
                    end

                    local predicted = utils.extrapolate_position(origin, ticks, player)
                    if predicted == nil or origin:dist(predicted) <= 0.1 then
                        break
                    end

                    local abs_offset = abs_origin - origin
                    extrapolated_records[player] = {
                        origin = origin,
                        abs_origin = abs_origin
                    }

                    write_origin(player, predicted, predicted + abs_offset)
                    extrapolated = extrapolated + 1
                    highest_ticks = math.max(highest_ticks, ticks)
                until true
            end

            extrapolation_applied = extrapolated > 0
            return extrapolated, highest_ticks
        end

        local function apply_defaults()
            restore_extrapolation()

            if not defaults.captured then
                update_status(false)
                return
            end

            cl_interp:set_float(defaults.interp)
            cl_interpolate:set_int(defaults.interpolate)
            cl_interp_ratio:set_int(defaults.interp_ratio)
            cl_clock_correction:set_int(defaults.clock_correction)
            prediction_applied = false
            defaults.captured = false
            update_status()
        end

        prediction.setup_command = LPH_JIT(function()
            local active = is_active()

            if not active then
                restore_extrapolation()
                if was_active then
                    apply_defaults()
                    was_active = false
                else
                    update_status(false)
                end
                return
            end

            local lp = entity.get_local_player()
            if not lp or not entity.is_alive(lp) then
                restore_extrapolation()
                if was_active then
                    apply_defaults()
                    was_active = false
                end
                update_status(false)
                return
            end

            if localplayer.air then
                restore_extrapolation()
                if was_active then
                    apply_defaults()
                    was_active = false
                else
                    update_status(false)
                end
                return
            end

            was_active = true
            apply_prediction()
            local _, ticks = apply_extrapolation()
            update_status(true, ticks)
        end)

        prediction.pre_config_save = LPH_JIT(function()
            if prediction_applied then
                apply_defaults()
            else
                restore_extrapolation()
            end
        end)

        function prediction.shutdown()
            was_active = false
            apply_defaults()
        end

        utils.set_callback('setup_command', prediction.setup_command, true)
        utils.set_callback('pre_config_save', prediction.pre_config_save, true)
        utils.set_callback('level_init', LPH_JIT(function()
            prediction.shutdown()
        end), true)

        defer(prediction.shutdown)
    end

    local animations do
        animations = { }
        local item = menu.settings.animations
        local strafe_yaw = 0
        local move_lean = LPH_JIT(function(me, player)
            if not item.addons:get('Move lean') then
                return false
            end

            if item.air:get() == 'Earthquake' then
                player:get_anim_overlay(12).weight = math.abs(math.sin(globals.realtime() * 24)) * 0.9
            else
                player:get_anim_overlay(12).weight = 50 * 0.01
            end

            return true
        end)

        local air = LPH_JIT(function(me, player)
            if item.air:get() == '-' then
                return false
            end

            if item.air:get() == 'Static' then
                entity.set_prop(me, 'm_flPoseParameter', 1, 6)
                return true
            end

            if item.air:get() == 'Legacy falling' then
                entity.set_prop(me, 'm_flPoseParameter', 0.3, 6)
                return true
            end

            if item.air:get() == 'Kangoroo' then
                entity.set_prop(me, 'm_flPoseParameter', client.random_float(0.1, 10.0)/10, 6)
                entity.set_prop(me, 'm_flPoseParameter', client.random_float(0.1, 10.0)/10, 9)
                entity.set_prop(me, 'm_flPoseParameter', client.random_float(0.1, 10.0)/10, 10)
                return true
            end
        end)

        local onground = LPH_JIT(function(cmd, me)
            ref.antiaim.other.leg_movement:override()

            if item.ground:get() == '-' or not localplayer.moving then
                return false
            end

            if item.ground:get() == 'Static' then
                entity.set_prop(me, 'm_flPoseParameter', 1, 0.5)
                ref.antiaim.other.leg_movement:override('Always slide')
                return true
            end

            if item.ground:get() == 'Jitter' then
                local strength = item.ground_jitter_strength:get() * 0.1

                if strength <= 0 then
                    ref.antiaim.other.leg_movement:override('Always slide')
                    entity.set_prop(me, 'm_flPoseParameter', 0.82, 0)
                    return true
                end

                local realtime = globals.realtime()
                local primary = math.abs(math.sin(realtime * (36 + strength * 18)))
                local secondary = math.abs(math.sin(realtime * (67 + strength * 26)))
                local wave = utils.clamp(primary * 0.78 + secondary * 0.34, 0, 1)
                local base = 0.68 + strength * 0.12
                local amplitude = 0.12 + strength * 0.15
                local pose = base + wave * amplitude

                ref.antiaim.other.leg_movement:override('Always slide')
                entity.set_prop(me, 'm_flPoseParameter', utils.clamp(pose, 0, 1), 0)
                return true
            end

            if item.ground:get() == 'Jitter v2' then
                local strength = item.ground_jitter_strength:get() * 0.1

                if strength <= 0 then
                    ref.antiaim.other.leg_movement:override('Never slide')
                    entity.set_prop(me, 'm_flPoseParameter', 0.5, 0)
                    return true
                end

                local wave = math.sin(globals.realtime() * (18 + strength * 10))
                local amplitude = 0.18 + strength * 0.17
                local pose = 0.5 + wave * amplitude

                ref.antiaim.other.leg_movement:override(wave > 0 and 'Always slide' or 'Never slide')
                entity.set_prop(me, 'm_flPoseParameter', utils.clamp(pose, 0, 1), 0)
                return true
            end

            if item.ground:get() == 'Ideal Yaw' then
                if not localplayer.peeking then
                    entity.set_prop(me, 'm_flPoseParameter', 0.5, 0)
                else
                    entity.set_prop(me, 'm_flPoseParameter', 1, globals.tickcount() % 2 > 0 and 1 or 0)
                end

                if cmd.chokedcommands ~= 0 then
                    if globals.tickcount() % 4 > 1 then
                        ref.antiaim.other.leg_movement:override('Never slide')
                    else
                        ref.antiaim.other.leg_movement:override('Always slide')
                    end
                end

                return true
            end

            if item.ground:get() == 'Slide move' then -- for improved thx javasense (@dataregister)
                local me = entity.get_local_player()
                if not me then
                    return
                end

                local vx, vy = entity.get_prop(me, 'm_vecVelocity')

                local view_yaw = select(2, client.camera_angles())

                local delta = utils.angle_diff(view_yaw, 0)
                local move_yaw = utils.angle_diff(utils.vector_angles(vx, vy), view_yaw)

                if globals.chokedcommands() == 0 then
                    strafe_yaw = utils.angle_to_positive(move_yaw + delta) / 360
                end

                entity.set_prop(me, 'm_flPoseParameter', strafe_yaw, 0)
                -- print(strafe_yaw)
            end
        end)

        local pitch_on_land = LPH_JIT(function(me, animstate)
            if not animstate.hit_in_ground_animation or localplayer.air then
                return false
            end

            entity.set_prop(me, 'm_flPoseParameter', 0.5, 12)
            return true
        end)

        local ANIMATION_LAYER_MOVEMENT_MOVE = 6
        local ANIMATION_LAYER_LEAN = 12

        local anim_data = {
            layers = {
                [0] = { cycle = 0, weight = 0 }, -- aim_matrix
                [1] = { cycle = 0, weight = 0 }, -- weapon_action
                [2] = { cycle = 0, weight = 0 }, -- weapon_action_recrouch
                [3] = { cycle = 0, weight = 0 }, -- adjust
                [4] = { cycle = 0, weight = 0 }, -- movement_move
                [5] = { cycle = 0, weight = 0 }, -- movement_strafe
                [6] = { cycle = 0, weight = 0 }, -- movement_strafechange
                [7] = { cycle = 0, weight = 0 }, -- whole_body
                [8] = { cycle = 0, weight = 0 }, -- flashed
                [9] = { cycle = 0, weight = 0 }, -- flinch
                [10] = { cycle = 0, weight = 0 }, -- aliveloop
                [11] = { cycle = 0, weight = 0 }, -- jump
                [12] = { cycle = 0, weight = 0 }, -- land
                [13] = { cycle = 0, weight = 0 }, -- move_blend_walk
                [14] = { cycle = 0, weight = 0 }, -- move_blend_run
                [15] = { cycle = 0, weight = 0 }, -- move_blend_crouch
            },

            server_anim_states = { },

            last_sim_time = 0,
            last_velocity = 0,
            last_duck_amount = 0,
            last_weapon = nil,
        }

        local animfix_data = LPH_JIT(function()
            local me = entity.get_local_player()

            if me == nil then
                return
            end

            local entity_info = c_entity(me)

            if entity_info == nil then
                return
            end

            local anim_state = entity_info:get_anim_state()

            if anim_state == nil then
                return
            end

            local sim_time = globals.servertickcount()
            local vel_x, vel_y = entity.get_prop(me, 'm_vecVelocity')
            local velocity = math.sqrt(vel_x * vel_x + vel_y * vel_y)
            local duck_amount = entity.get_prop(me, 'm_flDuckAmount')
            local ducking = entity.get_prop(me, 'm_bDucking') == 1
            local on_ground = bit.band(entity.get_prop(me, 'm_fFlags'), 1) == 1
            local current_weapon = entity.get_player_weapon(me)

            if velocity < 0.1 then
                velocity = 0
            end

            local server_state = {
                layers = { },
                time = sim_time,
                ducking = ducking,
                on_ground = on_ground,
                velocity = velocity,
                duck_amount = duck_amount,
                weapon = current_weapon
            }

            for layer_idx, _ in pairs(anim_data.layers) do
                local layer = entity_info:get_anim_overlay(layer_idx)

                if layer ~= nil then
                    server_state.layers[layer_idx] = {
                        cycle = layer.cycle,
                        weight = layer.weight
                    }
                end
            end

            table.insert(anim_data.server_anim_states, server_state)

            if #anim_data.server_anim_states > 60 then
                table.remove(anim_data.server_anim_states, 1)
            end
        end)

        local update_animfix_render = LPH_JIT(function()
            local me = entity.get_local_player()

            if me == nil then
                return
            end

            local entity_info = c_entity(me)

            if entity_info == nil then
                return
            end

            local anim_state = entity_info:get_anim_state()

            if anim_state == nil then
                return
            end

            local current_time = globals.realtime()
            local server_states = anim_data.server_anim_states

            if #server_states < 2 then
                return
            end

            local state1, state2

            for i = #server_states - 1, 1, -1 do
                if server_states[i].time <= current_time and server_states[i + 1].time >= current_time then
                    state1 = server_states[i]
                    state2 = server_states[i + 1]

                    break
                end
            end

            if not state1 or not state2 then
                state1 = server_states[#server_states - 1]
                state2 = server_states[#server_states]
            end

            local t = (current_time - state1.time) / (state2.time - state1.time)
            t = math.max(0, math.min(t, 1))

            for layer_idx, _ in pairs(anim_data.layers) do
                local layer = entity_info:get_anim_overlay(layer_idx)

                if layer and state1.layers[layer_idx] and state2.layers[layer_idx] then
                    local cycle1 = state1.layers[layer_idx].cycle
                    local cycle2 = state2.layers[layer_idx].cycle
                    local weight1 = state1.layers[layer_idx].weight
                    local weight2 = state2.layers[layer_idx].weight

                    if (layer_idx == 1 or layer_idx == 2) and state1.weapon ~= state2.weapon then
                        layer.cycle = cycle2
                        layer.weight = weight2
                    else
                        layer.cycle = utils.lerp(cycle1, cycle2, t)
                        layer.weight = utils.lerp(weight1, weight2, t)
                    end
                end
            end

            local velocity = utils.lerp(state1.velocity, state2.velocity, t)
            local duck_amount = utils.lerp(state1.duck_amount, state2.duck_amount, t)

            local current_weapon = state1.weapon

            anim_data.last_velocity = velocity
            anim_data.last_duck_amount = duck_amount
            anim_data.last_weapon = current_weapon
        end)

        animations.finish_command = LPH_JIT(function(cmd)
            local me = entity.get_local_player()
            if not me then
                return
            end

            local player = c_entity(me)
            if not player then
                return
            end

            local animstate = player:get_anim_state()
            if not animstate then
                return
            end

            move_lean(me, player)

            if not localplayer.air then
                onground(cmd, me)
                if item.addons:get 'Pitch zero on land' then
                    pitch_on_land(me, animstate)
                end
            else
                air(me, player)
            end
        end)

        item.enabled:set_event('finish_command', animations.finish_command)

        item.enabled:set_event('setup_command', function ()
            if menu.settings.animations.addons:get 'Smooth animations' then
                animfix_data()
            end
        end)

        item.enabled:set_event('pre_render', function ()
            if menu.settings.animations.addons:get 'Smooth animations' then
                update_animfix_render()
            end
        end)
    end

    local logs do
        logs = { shot = { }, data = { }, event_data = { } }
        local menu_preview_fade = animation.new()
        ref.visuals.output:override(false)
        local items = menu.settings.logs
        local trashtalk_items = menu.settings.helpers

        local is_fps_below_tickrate = LPH_JIT(function()
            return globals.absoluteframetime() > globals.tickinterval()
        end)

        local format_text = LPH_JIT(function(text, hex_a, hex_b)
            local result = string.gsub(text, '${(.-)}', string.format(
                '\a%s%%1\a%s', hex_a, hex_b
            ))

            if result:sub(1, 1) ~= '\a' then
                result = '\a' .. hex_b .. result
            end

            return result
        end)

        local hitgroup_str = {
            [0] = 'generic',
            'head', 'chest', 'stomach',
            'left arm', 'right arm',
            'left leg', 'right leg',
            'neck', 'generic', 'gear'
        }

        local get_prefix = LPH_JIT(function(weapon)
            if weapon == 'hegrenade' then
                return 'naded'
            end

            if weapon == 'inferno' then
                return 'burned'
            end

            if weapon == 'knife' then
                return 'knifed'
            end

            if weapon == 'taser' then
                return 'zeused'
            end

            return 'hit'
        end)

        local get_log_styles = LPH_JIT(function()
            local styles = items.output:get() or { }
            local result = {
                console = false,
                event = false,
                center = false
            }

            for _, style in ipairs(styles) do
                if style == 'Console' then result.console = true end
                if style == 'Event' then result.event = true end
                if style == 'Under-crosshair' then result.center = true end
            end

            return result
        end)

        local script_name = db.script:lower()
        local trashtalk_phrases = { '1' }
        local trashtalk_bonus_phrases = { " 1` ", " 1' ", " 1/ " }

        local add_log = LPH_JIT(function(text, color_type)
            local styles = get_log_styles()
        
            local prefix_hex
            if color_type == 'hit' then
                prefix_hex = color.new(items.hit_color.color:get()):to_hex()
            elseif color_type == 'miss' then
                prefix_hex = color.new(items.miss_color.color:get()):to_hex()
            else
                prefix_hex = color.new(items.mismatch_color.color:get()):to_hex()
            end
        
            local white = color.new():to_hex()
            local tagged_text_console = format_text(
                string.format('${%s} ${›} ', script_name), prefix_hex, white
            ) .. text
            local tagged_text = '\a' .. white .. text

            if styles.console then
                utils.print(tagged_text_console)
                ref.visuals.output:override(false)
            end

            if styles.event then
                local color_hex
                if color_type == 'hit' then
                    color_hex = color.new(items.hit_color.color:get()):to_hex()
                elseif color_type == 'miss' then
                    color_hex = color.new(items.miss_color.color:get()):to_hex()
                else
                    color_hex = color.new(items.mismatch_color.color:get()):to_hex()
                end

                table.insert(logs.event_data, {
                    text = tagged_text,
                    color = color_hex,
                    time = globals.realtime(),
                    alpha = animation.new()
                })
            end

            if styles.center then
                local color_hex
                if color_type == 'hit' then
                    color_hex = color.new(items.hit_color.color:get()):to_hex()
                elseif color_type == 'miss' then
                    color_hex = color.new(items.miss_color.color:get()):to_hex()
                else
                    color_hex = color.new(items.mismatch_color.color:get()):to_hex()
                end

                table.insert(logs.data, {
                    text = tagged_text,
                    color = color_hex,
                    time = globals.realtime(),
                    alpha = animation.new()
                })
            end
        end)

        local aim_fire = LPH_JIT(function(e)
            local me = entity.get_local_player()
            logs.shot.killed = false

            logs.shot[e.id] = {
                target = e.target,
                dmg = e.damage,
                hitgroup = e.hitgroup,
                bt = (globals.tickcount() - e.tick),
                teleported = e.teleported,
                m_totalHitsOnServer = entity.get_prop(me, 'm_totalHitsOnServer'),
                server_tick = globals.servertickcount(),
            }
        end)

        local player_hurt = LPH_JIT(function(e)
            local me = entity.get_local_player()
            local attacker = client.userid_to_entindex(e.attacker)
            if me ~= attacker then
                return
            end

            local remaining_health = e.health
            logs.shot.killed = remaining_health <= 0
            logs.shot.weapon = e.weapon

            local prefix = get_prefix(e.weapon)
            if prefix == 'hit' or prefix == 'zeused' then
                return
            end

            local userid = client.userid_to_entindex(e.userid)
            local name = entity.get_player_name(userid)
            local white = color.new():to_hex()
            local color_hit = color.new(items.hit_color.color:get()):to_hex()
            local health_damaged = e.dmg_health
            local text = format_text(string.format('${%s} %s for ${%d} dmg (${%d}hp)',
                prefix, name, health_damaged, remaining_health
            ), color_hit, white)

            if logs.shot.killed then
                if prefix == 'knifed' then
                    prefix = 'stabbed'
                else
                    prefix = 'killed'
                end

                text = format_text(string.format('${%s} %s for ${%d} dmg',
                    prefix, name, health_damaged
                ), color_hit, white)
            end

            add_log(text, 'hit')
        end)

        local aim_hit = LPH_JIT(function(e)
            local shot = logs.shot[e.id]
        
            if shot == nil then
                return
            end
        
            if e.target == nil then
                return
            end
        
            local bt = shot.bt .. 't'
            local hitbox = hitgroup_str[e.hitgroup]
            local hitchance = math.floor(e.hit_chance) .. '%'
            local damage = e.damage
            local prefix = get_prefix(logs.shot.weapon)
            local killed = logs.shot.killed
            if killed and prefix ~= 'zeused' then
                prefix = 'killed'
            end
        
            local wanted_damage = shot.dmg
            local wanted_hitbox = hitgroup_str[shot.hitgroup]
            local name = entity.get_player_name(e.target)
        
            local white = color.new():to_hex()
            local authority_color = color.new(items.hit_color.color:get()):to_hex()
            local mismatch_color = color.new(items.mismatch_color.color:get()):to_hex()
        
            local text
            local color_type = 'hit'
        
            local elapsed = math.floor(math.max(globals.servertickcount() - shot.server_tick - 1, 0) * globals.tickinterval() * 1000) .. 'ms'
        
            if wanted_damage ~= damage or wanted_hitbox ~= hitbox then
                local damage_str = damage
                local hitbox_str = hitbox

                if wanted_damage ~= damage and wanted_hitbox ~= hitbox then
                    damage_str = string.format('%d(%d)', damage, wanted_damage)
                    hitbox_str = string.format('%s(%s)', hitbox, wanted_hitbox)
                elseif wanted_damage ~= damage then
                    damage_str = string.format('%d(%d)', damage, wanted_damage)
                elseif wanted_hitbox ~= hitbox then
                    hitbox_str = string.format('%s(%s)', hitbox, wanted_hitbox)
                end

                text = format_text(string.format('Mismatch ${%s} for ${%s} damage to ${%s} (${%s}) (bt: ${%s} elapsed: ${%s})',
                    name:lower(), damage_str, hitbox_str, hitchance, bt, elapsed
                ), mismatch_color, white)
                color_type = 'mismatch'
            else
                text = format_text(string.format('Hit ${%s} for ${%d} damage to ${%s} (${%s}) (bt: ${%s} elapsed: ${%s})',
                    name:lower(), damage, hitbox, hitchance, bt, elapsed
                ), authority_color, white)
            end
        
            add_log(text, color_type)
        end)

        local aim_miss = LPH_JIT(function(e)
            local me = entity.get_local_player()
            if not me then
                return
            end

            local shot = logs.shot[e.id]

            if shot == nil then
                return
            end

            if e.target == nil then
                return
            end

            local m_totalHitsOnServer = entity.get_prop(me, 'm_totalHitsOnServer')
            local tp = shot.teleported
            local bt = shot.bt .. 't'
            local reason = e.reason
            if e.reason == 'death' and not entity.is_alive(e.target) then
                reason = 'player death'
            elseif e.reason == '?' and shot.m_totalHitsOnServer ~= m_totalHitsOnServer then
                reason = 'damage rejected'
            elseif e.reason == 'prediction error' and is_fps_below_tickrate() then
                reason = 'fps decrease'
            elseif e.reason == '?' then
                reason = tp and 'backtrack error' or 'unknown'
            end

            local prefix = 'Missed shot at'
            local hitbox = hitgroup_str[e.hitgroup]
            local hitchance = math.floor(e.hit_chance) .. '%'
            local name = entity.get_player_name(e.target)
            local white = color.new():to_hex()
            local color_miss = color.new(items.miss_color.color:get()):to_hex()
            local text = format_text(string.format('%s ${%s} to ${%s} due to %s (bt: ${%s}  hc: ${%s})',
                prefix, name, hitbox, reason, bt, hitchance
            ), color_miss, white)

            add_log(text, 'miss')
        end)

        local dormant_hit = LPH_JIT(function(e)
            local killed = e.health <= 0
            local prefix = killed and 'killed in dormant' or 'dormant hit'
            local white = color.new():to_hex()
            local main_color = color.new(items.hit_color.color:get()):to_hex()
            local name = entity.get_player_name(e.userid)
            local damage = e.dmg_health
            local accuracy = math.floor(e.accuracy * 100) .. '%'
            local hitbox = string.lower(e.aim_hitbox)
            local text = format_text(string.format('${%s} %s ${%s} for ${%d} dmg (hc: ${%s})',
                prefix, name, hitbox, damage, accuracy
            ), main_color, white)

            add_log(text, 'hit')
        end)

        local dormant_miss = LPH_JIT(function(e)
            local prefix = 'missed dormant'
            local white = color.new():to_hex()
            local main_color = color.new(items.miss_color.color:get()):to_hex()
            local name = entity.get_player_name(e.userid)
            local hitbox = string.lower(e.aim_hitbox)
            local accuracy = math.floor(e.accuracy * 100) .. '%'

            local text = format_text(string.format('${%s} %s ${%s} for ${%s} accuracy',
                prefix, name, hitbox, accuracy
            ), main_color, white)

            add_log(text, 'miss')
        end)

        local trashtalk = LPH_JIT(function(e)
            local lp = entity.get_local_player()
            if not lp or not entity.is_alive(lp) then
                return
            end

            local attacker = client.userid_to_entindex(e.attacker)
            local victim = client.userid_to_entindex(e.userid)
            if attacker ~= lp or not victim or not entity.is_enemy(victim) then
                return
            end

            client.delay_call(trashtalk_items.trashtalk_delay:get() * 0.1, function()
                local local_player = entity.get_local_player()
                if not local_player or not entity.is_alive(local_player) then
                    return
                end

                if math.random(1, 100) > trashtalk_items.trashtalk_hitchance:get() then
                    return
                end

                local message = trashtalk_phrases[1]
                if math.random(1, 100) <= 10 then
                    message = trashtalk_bonus_phrases[math.random(1, #trashtalk_bonus_phrases)]
                end

                client.exec('say ' .. message)
            end)
        end)

        local event_paint_handler = LPH_JIT(function()
            if not logs.event_data or #logs.event_data <= 0 then
                return
            end

            while #logs.event_data > 10 do
                table.remove(logs.event_data, 1)
            end

            for i = #logs.event_data, 1, -1 do
                local log = logs.event_data[i]
                if not log then
                    table.remove(logs.event_data, i)
                end

                log.alpha:update(7.5, (globals.realtime() - log.time < 3))
                if log.alpha.value <= 0 then
                    table.remove(logs.event_data, i)
                end
            end

            local position = vector(10, 10)

            for _, log in ipairs(logs.event_data) do
                local measure = render.measure_text('cd', log.text)

                render.text(position + vector(measure.x *.5, 0), color.new(255, 255 * log.alpha.value), 'cd', 0, log.text)

                position.y = position.y + utils.round((measure.y * 1.5) * log.alpha.value)
            end
        end)

        local get_center_preview_logs = LPH_JIT(function()
            local white = color.new():to_hex()
            local hit_color = color.new(items.hit_color.color:get()):to_hex()
            local miss_color = color.new(items.miss_color.color:get()):to_hex()
            local mismatch_color = color.new(items.mismatch_color.color:get()):to_hex()

            return {
                {
                    text = '\a' .. white .. format_text('Hit ${enemy name} for ${78} damage to ${head} (${82%}) (bt: ${6t} elapsed: ${41ms})', hit_color, white),
                    alpha = { value = menu_preview_fade.value }
                },
                {
                    text = '\a' .. white .. format_text('Missed shot at ${enemy name} to ${stomach} due to spread (bt: ${4t}  hc: ${68%})', miss_color, white),
                    alpha = { value = menu_preview_fade.value }
                },
                {
                    text = '\a' .. white .. format_text('Mismatch ${enemy name} for ${64(71)} damage to ${chest(stomach)} (${76%}) (bt: ${9t} elapsed: ${53ms})', mismatch_color, white),
                    alpha = { value = menu_preview_fade.value }
                }
            }
        end)

        local center_paint_handler = LPH_JIT_MAX(function()
            local styles = get_log_styles()
            if not styles.center then
                return
            end

            local menu_open = ui.is_menu_open()
            menu_preview_fade:update(8, menu_open)
            if not logs.data or (#logs.data <= 0 and menu_preview_fade.value <= 0.01) then
                return
            end

            while #logs.data > 10 do
                table.remove(logs.data, 1)
            end

            for i = #logs.data, 1, -1 do
                local log = logs.data[i]
                if not log then
                    table.remove(logs.data, i)
                end

                log.alpha:update(7.5, (globals.realtime() - log.time < 3))
                if log.alpha.value <= 0 then
                    table.remove(logs.data, i)
                end
            end

            local preview_logs = nil
            local active_logs = logs.data
            if #active_logs <= 0 and menu_preview_fade.value > 0.01 then
                preview_logs = get_center_preview_logs()
                active_logs = preview_logs
            end

            local screen = vector(client.screen_size())
            local padding = 15
            local top_offset = 8
            local max_width, total_height = 220, 20
            if #active_logs > 0 then
                max_width, total_height = 0, 0
                for _, log in ipairs(active_logs) do
                    local measure = render.measure_text('d', log.text)
                    max_width = math.max(max_width, measure.x + padding * 2)
                    total_height = total_height + measure.y * 2.2
                end
                if max_width <= 0 then
                    max_width = 220
                end
                if total_height <= 0 then
                    total_height = 20
                end
            end

            local default_position = vector(screen.x * 0.5 - max_width * 0.5, screen.y * 0.75)
            local logs_size = vector(max_width, total_height + top_offset)
            local crosshair_y = screen.y * 0.5
            local logs_raw_min = crosshair_y + 22
            local logs_raw_max = screen.y - logs_size.y - 30
            if logs_raw_max < logs_raw_min then
                logs_raw_max = logs_raw_min
            end

            local logs_center = (logs_raw_min + logs_raw_max) * 0.5
            local logs_half = math.max((logs_raw_max - logs_raw_min) * 0.28, 10)
            local logs_top_trim = 18
            local logs_bottom_extend = 24
            local logs_min = math.min(logs_raw_max, math.max(logs_raw_min, logs_center - logs_half) + logs_top_trim)
            local logs_max = math.min(logs_raw_max, math.max(logs_min, logs_center + logs_half + logs_bottom_extend))

            local logs_bounds = {
                min_y = logs_min,
                max_y = logs_max
            }

            local anchor = drag_system.resolve('aimbot_logs_under_crosshair', default_position, logs_size, 'vertical', logs_bounds)
            local start_y = anchor.y + top_offset

            if menu_open and drag_system.active == 'aimbot_logs_under_crosshair' then
                local guide_x = anchor.x + max_width * 0.5
                local line_top = logs_bounds.min_y + logs_size.y * 0.5
                local line_bottom = logs_bounds.max_y + logs_size.y * 0.5
                render.line(vector(guide_x, line_top), vector(guide_x, line_bottom), color.new(255, 255, 255, 58))
                render.line(vector(guide_x - 1, line_top), vector(guide_x - 1, line_bottom), color.new(255, 255, 255, 34))
                render.line(vector(guide_x + 1, line_top), vector(guide_x + 1, line_bottom), color.new(255, 255, 255, 34))
            end

            if #active_logs <= 0 then
                return
            end

            if preview_logs ~= nil then
                local preview_text = 'preview logs'
                local preview_measure = render.measure_text('d', preview_text)
                local preview_pos = vector(anchor.x + max_width * 0.5, start_y)
                local preview_alpha = 255 * menu_preview_fade.value
                local preview_shadow = color.new(0, 0, 0, preview_alpha * 0.18)
                local preview_glow_outer = color.new(255, 255, 255, preview_alpha * 0.10)
                local preview_glow_inner = color.new(255, 255, 255, preview_alpha * 0.12)
                local preview_color = color.new(245, 245, 245, preview_alpha)
                render.text(preview_pos + vector(0, 1), preview_shadow, 'c', 0, preview_text)
                render.text(preview_pos + vector(-2, 0), preview_glow_outer, 'c', 0, preview_text)
                render.text(preview_pos + vector(2, 0), preview_glow_outer, 'c', 0, preview_text)
                render.text(preview_pos + vector(0, -2), preview_glow_outer, 'c', 0, preview_text)
                render.text(preview_pos + vector(0, 2), preview_glow_outer, 'c', 0, preview_text)
                render.text(preview_pos + vector(-1, -1), preview_glow_inner, 'c', 0, preview_text)
                render.text(preview_pos + vector(1, -1), preview_glow_inner, 'c', 0, preview_text)
                render.text(preview_pos + vector(-1, 1), preview_glow_inner, 'c', 0, preview_text)
                render.text(preview_pos + vector(1, 1), preview_glow_inner, 'c', 0, preview_text)
                render.text(preview_pos + vector(-1, 0), preview_glow_inner, 'c', 0, preview_text)
                render.text(preview_pos + vector(1, 0), preview_glow_inner, 'c', 0, preview_text)
                render.text(preview_pos + vector(0, -1), preview_glow_inner, 'c', 0, preview_text)
                render.text(preview_pos + vector(0, 1), preview_glow_inner, 'c', 0, preview_text)
                render.text(preview_pos, preview_color, 'c', 0, preview_text)
                start_y = start_y + preview_measure.y * 1.55
            end

            for _, log in ipairs(active_logs) do
                local measure = render.measure_text('d', log.text)
                local text_pos = vector(anchor.x + max_width * 0.5, start_y)
                render.text(text_pos, color.new(255, 255 * log.alpha.value), 'c', 0, log.text)

                start_y = start_y + measure.y * 2.2
            end
        end)

        items.enabled:set_callback(function()
            local enabled = items.enabled:get()
            local styles = get_log_styles()

            utils.set_callback('aim_fire', aim_fire, enabled)
            utils.set_callback('aim_hit', aim_hit, enabled)
            utils.set_callback('aim_miss', aim_miss, enabled)
            utils.set_callback('player_hurt', player_hurt, enabled)
            utils.set_callback('dormant_hit', dormant_hit, enabled)
            utils.set_callback('dormant_miss', dormant_miss, enabled)

            utils.set_callback('paint', event_paint_handler, enabled)

            utils.set_callback('paint', center_paint_handler, enabled)
        end, true)

        trashtalk_items.trashtalk:set_callback(function()
            utils.set_callback('player_death', trashtalk, trashtalk_items.trashtalk:get())
        end, true)
    end
end

local aimtools do
    aimtools = { }
    local items = menu.settings.aimbot
    
    local neverlose_charge do
       local switch = items.charge_fix
       local buffer = ffi.new('char[?]', 0x1D)
       local ogbytes = ffi.new('char[?]', 0x1D)
       local ptr = ffi.cast('char*', 0x433AC04B)
       ffi.copy(ogbytes, ptr, 0x1D)
       ffi.copy(buffer, ogbytes, 0x1D)
       ffi.fill(buffer, 0x18, 0x90)
       buffer[0x18] = 0xE9
       switch:set_callback(function (this)
           if this:get() then
               ffi.copy(ptr, buffer, 0x1D)
           else
               ffi.copy(ptr, ogbytes, 0x1D)
           end
       end, true)
    end

    local dormant_aimbot do
        dormant_aimbot = { }
        local attack_on = false
        local dormant = false
        local shot_info = {
            target = nil,
            hitbox = nil,
            point = nil,
            accuracy = nil,
            shot = false,
            last_shot_tick = 0
        }

        local shot_targets = { }

        local function get_dormant_enemies()
            local enemies = { }
            local pr = entity.get_player_resource()

            for i = 1, globals.maxplayers() do
                if entity.get_prop(pr, 'm_bConnected', i) == 1 
                    and i ~= entity.get_local_player() 
                    and entity.is_enemy(i) 
                    and entity.is_dormant(i) then
                    table.insert(enemies, i)
                end
            end
            return enemies
        end

        local function point_multipoint(eye_pos, target_pos, scale)
            local _, yaw = eye_pos:to(target_pos):angles()
            local rad = math.rad(yaw + 90)
            local right = vector(math.cos(rad), math.sin(rad), 0) * scale

            return {
                { text = 'Middle', vec = target_pos },
                { text = 'Left', vec = target_pos + right },
                { text = 'Right', vec = target_pos - right }
            }
        end

        local limit_speed = LPH_JIT(function(cmd, max_speed)
            local speed = math.sqrt(cmd.forwardmove^2 + cmd.sidemove^2)
            if speed > max_speed then
                local mul = max_speed / speed
                cmd.forwardmove = cmd.forwardmove * mul
                cmd.sidemove    = cmd.sidemove * mul
            end
        end)

        local get_points = LPH_JIT(function(origin, duck)
            return {
                { vec = origin + vector(0, 0, 58 - duck * 10), hitbox = 'Head', scale = 5 },
                { vec = origin + vector(0, 0, 48 - duck * 5), hitbox = 'Chest', scale = 6 },
                { vec = origin + vector(0, 0, 40), hitbox = 'Stomach', scale = 4 },
                { vec = origin + vector(0, 0, 20), hitbox = 'Legs', scale = 3 }
            }
        end)

        local native_GetClientEntity = vtable_bind('client_panorama.dll', 'VClientEntityList003', 3, 'void*(__thiscall*)(void*,int)')
        local native_IsWeapon = vtable_thunk(166, 'bool(__thiscall*)(void*)')
        local native_GetInaccuracy = vtable_thunk(483, 'float(__thiscall*)(void*)')

        local get_inaccuracy = LPH_JIT(function(weapon_ent)
            local ptr = native_GetClientEntity(weapon_ent)
            if not ptr or not native_IsWeapon(ptr) then
                return 1.0
            end
            return native_GetInaccuracy(ptr) or 1.0
        end)

        local hitbox_priorities = {
            { hitbox = 'Head', vec_offset = vector(0, 0, 58), scale = 5 },
            { hitbox = 'Chest', vec_offset = vector(0, 0, 50), scale = 6 },
            { hitbox = 'Stomach', vec_offset = vector(0, 0, 40), scale = 4 },
            { hitbox = 'Legs', vec_offset = vector(0, 0, 20), scale = 3 }
        }

        dormant_aimbot.setup_command = LPH_JIT(function(cmd)
            dormant = false
            attack_on = false

            if not items.dormant_aimbot.enabled:get() or not items.dormant_aimbot.enabled.hotkey:get() then
                return
            end

            local lp = entity.get_local_player()
            if not lp or not entity.is_alive(lp) then
                return
            end

            local weapon = entity.get_player_weapon(lp)
            if not weapon then
                return
            end

            if not localplayer.weapon_ready then
                return
            end

            local weapon_data = csgo_weapons(weapon)
            if weapon_data.type == 'knife' or weapon_data.type == 'grenade' then
                return
            end

            local dormant_enemies = get_dormant_enemies()
            if #dormant_enemies == 0 then
                return
            end

            local eye = vector(client.eye_position())
            local best_target = nil
            local best_pos = nil
            local best_dmg = 0
            local best_hitbox = nil
            local best_point = nil
            local best_accuracy = 0

            for _, enemy in ipairs(dormant_enemies) do
                local origin = vector(entity.get_origin(enemy))
                if not origin then
                    goto continue
                end

                local _, _, _, _, alpha_multiplier = entity.get_bounding_box(enemy)
                if alpha_multiplier == 0 or alpha_multiplier < 0.500 then 
                    goto continue
                end

                local accuracy_score = math.floor(alpha_multiplier * 100) + 5
                if accuracy_score < items.dormant_aimbot.hitchance:get() then
                    goto continue
                end

                local duck = entity.get_prop(enemy, 'm_flDuckAmount') or 0

                for _, hitbox_info in ipairs(hitbox_priorities) do
                    local vec_offset = hitbox_info.vec_offset
                    if hitbox_info.hitbox == 'Head' then
                        vec_offset = vec_offset - vector(0, 0, duck * 10)
                    elseif hitbox_info.hitbox == 'Chest' then
                        vec_offset = vec_offset - vector(0, 0, duck * 4)
                    end

                    local pos = origin + vec_offset
                    local points = point_multipoint(eye, pos, hitbox_info.scale)

                    for _, point_info in ipairs(points) do
                        local _, dmg = client.trace_bullet(
                            lp,
                            eye.x, eye.y, eye.z,
                            point_info.vec.x, point_info.vec.y, point_info.vec.z,
                            true
                        )

                        if hitbox_info.hitbox == 'Head' then
                            dmg = dmg * 4
                        end

                        if dmg > best_dmg and dmg >= items.dormant_aimbot.damage:get() then
                            best_dmg = dmg
                            best_pos = point_info.vec
                            best_hitbox = hitbox_info.hitbox
                            best_point = point_info.text
                            best_target = enemy
                            best_accuracy = alpha_multiplier
                        end
                    end
                end

                ::continue::
            end

            if not best_target or not best_pos or not best_dmg then
                return
            end

            if client.visible(best_pos.x, best_pos.y, best_pos.z) then
                return
            end

            local inaccuracy = get_inaccuracy(weapon)

            shot_info.target = best_target
            shot_info.hitbox = best_hitbox
            shot_info.point = best_point
            shot_info.accuracy = best_accuracy
            shot_info.shot = true
            shot_info.last_shot_tick = globals.tickcount()

            shot_targets[best_target] = globals.tickcount()

            limit_speed(cmd, weapon_data.max_player_speed * 0.33)

            attack_on = true

            if inaccuracy <= 0.02 then
                local pitch, yaw = eye:to(best_pos):angles()
                cmd.pitch = pitch
                cmd.yaw = yaw
                cmd.in_attack = 1
            end
        end)

        utils.set_callback('paint', function()
            if not items.dormant_aimbot.enabled:get() or not items.dormant_aimbot.enabled.hotkey:get() then
                return
            end

            local lp = entity.get_local_player()
            if not lp or not entity.is_alive(lp) then
                return
            end

            local dormant_enemies = get_dormant_enemies()
            local indicator_color

            if #dormant_enemies > 0 then
                if shot_info.shot then
                    indicator_color = {143, 194, 21, 255}
                else
                    indicator_color = {255, 255, 255, 200}
                end
            else
                indicator_color = {255, 0, 50, 255}
            end

            renderer.indicator(indicator_color[1], indicator_color[2], indicator_color[3], indicator_color[4], 'DA')

            if shot_info.shot and globals.tickcount() - shot_info.last_shot_tick > 64 then
                if shot_info.target then
                    local name = entity.get_player_name(shot_info.target)
                    if shot_info.point then
                        utils.print(string.format('dormant aimbot ~ timeout'))
                    else
                        utils.print(string.format('dormant aimbot ~ timeout'))
                    end
                end
                shot_info.shot = false
            end
        end)

        utils.set_callback('weapon_fire', function(e)
            local lp = entity.get_local_player()
            if client.userid_to_entindex(e.userid) == lp and shot_info.shot then
                if shot_info.target and entity.is_alive(shot_info.target) then
                    local name = entity.get_player_name(shot_info.target)
                    if shot_info.point then
                        -- utils.print(string.format('dormant aimbot ~ fire at %s's %s [point: %s accuracy: %.0f%%]', 
                        --     name:lower(), shot_info.hitbox:lower(), shot_info.point:lower(), shot_info.accuracy * 100))
                    else
                        -- utils.print(string.format('dormant aimbot ~ fire at at %s's %s [accuracy: %.0f%%]', 
                        --     name:lower(), shot_info.hitbox:lower(), shot_info.accuracy * 100))
                    end
                end
            end
        end)

        utils.set_callback('player_hurt', function(e)
            local attacker = client.userid_to_entindex(e.attacker)
            local lp = entity.get_local_player()

            if attacker == lp and shot_info.shot then
                local hitgroup_names = {'Body', 'Head', 'Chest', 'Stomach', 'Left Arm', 'Right Arm', 'Left Leg', 'Right Leg', 'Neck', 'Unknown', 'Gear'}
                local target_name = entity.get_player_name(client.userid_to_entindex(e.userid))
                local target_idx = client.userid_to_entindex(e.userid)

                if target_idx == shot_info.target then
                    local hit_hitbox = hitgroup_names[e.hitgroup + 1]

                    if string.lower(hit_hitbox) == string.lower(shot_info.hitbox) or shot_info.hitbox == 'Head' then
                        -- utils.print(string.format('dormant aimbot ~ hit %s in %s for %d damage [remaining: %dhp accuracy: %.0f%%]', 
                        --     target_name:lower(), hit_hitbox:lower(), e.dmg_health, e.health, shot_info.accuracy * 100))
                    else
                        -- utils.print(string.format('dormant aimbot ~ hit %s in %s for %d damage [remaining: %dhp aimed: %s accuracy: %.0f%%]', 
                        --     target_name:lower(), hit_hitbox:lower(), e.dmg_health, e.health, shot_info.hitbox:lower(), shot_info.accuracy * 100))
                    end

                    shot_info.shot = false
                end
            end
        end)

        utils.set_callback('round_end', function()
            if shot_info.shot and shot_info.target then
                local name = entity.get_player_name(shot_info.target)
                if shot_info.point then
                    -- utils.print(string.format('dormant aimbot ~ reset tables'))
                else
                    -- utils.print(string.format('dormant aimbot ~ reset tables'))
                end
            end
            shot_info.shot = false
        end)

        utils.set_callback('round_start', function()
            if next(shot_targets) then
                -- utils.print('dormant aimbot ~ reset all shot tracking for new round')
            end

            shot_info = {
                target = nil,
                hitbox = nil,
                point = nil,
                accuracy = nil,
                shot = false,
                last_shot_tick = 0
            }
            shot_targets = { }
        end)

        utils.set_callback('player_death', function(e)
            local lp = entity.get_local_player()
            local dead_player = client.userid_to_entindex(e.userid)

            if dead_player == lp then
                if shot_info.shot and shot_info.target then
                    local name = entity.get_player_name(shot_info.target)
                    -- utils.print(string.format('dormant aimbot ~ shot canceled - player died (target: %s)', name:lower()))
                end
                shot_info.shot = false
            elseif dead_player == shot_info.target and shot_info.shot then
                local name = entity.get_player_name(dead_player)
                -- utils.print(string.format('dormant aimbot ~ target %s died from shot (%.0f%% accuracy)', 
                    -- name:lower(), shot_info.accuracy * 100))
                shot_info.shot = false
            end
        end)

        utils.set_callback('setup_command', dormant_aimbot.setup_command)

    end

    local aimbot do
        aimbot = { }

        local items = menu.settings.aimbot
        local active = false

        local missed_shots = { }

        local weapons_table = {
            'Autosnipers',
            'Scout',
            'AWP',
            'Deagle',
            'Revolver',
            'Pistols'
        }

        local weapon_group_map = {
            ['autosnipers'] = 'autosnipers',
            ['scar20']      = 'autosnipers',
            ['g3sg1']       = 'autosnipers',
            ['scout']       = 'scout',
            ['ssg08']       = 'scout',
            ['awp']         = 'awp',
            ['deagle']      = 'deagle',
            ['revolver']    = 'revolver',
            ['cz75a']       = 'revolver',
            ['pistols']     = 'pistols',
            ['glock']       = 'pistols',
            ['p2000']       = 'pistols',
            ['usp_silencer']= 'pistols',
            ['p250']        = 'pistols',
            ['fiveseven']   = 'pistols',
            ['tec9']        = 'pistols',
            ['elite']       = 'pistols',
        }

        local function get_weapon_key()
            return weapon_group_map[localplayer.weapon_group]
        end

        local function check_triggers(key, feature)
            local me = entity.get_local_player()
            local player = client.current_threat()

            local trigger_item = items[key .. '_' .. feature .. '_triggers']
            if not trigger_item then return true end

            local selected = { }
            for _, t in ipairs({'Enemy HP < X', 'X missed shots', 'Lethal'}) do
                if trigger_item:get(t) then selected[t] = true end
            end

            if not next(selected) then return false end

            if selected['Lethal'] and player and entity.is_alive(player) then
                local is_lethal, _ = utils.get_lethal(me, player, false)
                if is_lethal then return true end
            end

            if selected['Enemy HP < X'] then
                local hp_item = items[key .. '_' .. feature .. '_hp']
                if hp_item and player and entity.is_alive(player) then
                    local hp = entity.get_prop(player, 'm_iHealth')
                    if hp and hp < hp_item:get() then return true end
                end
            end

            if selected['X missed shots'] then
                local miss_item = items[key .. '_' .. feature .. '_misses']
                if miss_item and player then
                    local misses = missed_shots[player] or 0
                    if misses >= miss_item:get() then return true end
                end
            end

            return false
        end

        local adaptive_invoke

        local player_list do
            player_list = {
                players = { },
                my_ticks = 8,
                threat_ticks = 4,
            }

            for i = 1, 64 do
                player_list.players[i] = { }
            end

            local function baim_shutdown()
                local players = utils.get_entities(true)
                if #players <= 0 then return end
                for i = 1, #players do
                    if plist.get(players[i], 'Override prefer body aim') ~= '-' then
                        plist.set(players[i], 'Override prefer body aim', '-')
                        client.update_player_list()
                    end
                end
            end

            local function safe_shutdown()
                local players = utils.get_entities(true)
                if #players <= 0 then return end
                for i = 1, #players do
                    if plist.get(players[i], 'Override safe point') ~= '-' then
                        plist.set(players[i], 'Override safe point', '-')
                        client.update_player_list()
                    end
                end
            end

            local function round_start()
                baim_shutdown()
                safe_shutdown()
                missed_shots = { }
            end

            local function player_death(e)
                local player = client.userid_to_entindex(e.userid)
                if not entity.is_enemy(player) then return end
                plist.set(player, 'Override prefer body aim', '-')
                plist.set(player, 'Override safe point', '-')
                client.update_player_list()
                missed_shots[player] = nil
            end

            local function bullet_impact(e)
                local me = entity.get_local_player()
                local shooter = client.userid_to_entindex(e.userid)
                if shooter ~= me then return end

                local player = client.current_threat()
                if not player then return end

                local ent, _ = client.trace_bullet(
                    me, e.x, e.y, e.z,
                    entity.hitbox_position(player, 0)
                )
                if not ent or ent ~= player then
                    missed_shots[player] = (missed_shots[player] or 0) + 1
                else
                    missed_shots[player] = 0
                end
            end

            local function force_baim(cmd)
                local me = entity.get_local_player()
                local player = client.current_threat()
                local key = get_weapon_key()

                if not key or not items[key .. '_force_baim'] or not items[key .. '_force_baim']:get() then
                    baim_shutdown()
                    return
                end

                local hitboxes = ref.ragebot.target_hitbox:get()
                if #hitboxes == 1 and hitboxes[1] == 'Head' then
                    baim_shutdown()
                    return
                end

                if not player or not entity.is_alive(player) then
                    baim_shutdown()
                    return
                end

                if not check_triggers(key, 'force_baim') then
                    plist.set(player, 'Override prefer body aim', '-')
                    client.update_player_list()
                    return
                end

                plist.set(player, 'Override prefer body aim', '-')
                local is_lethal, _ = utils.get_lethal(me, player, false)

                if is_lethal then
                    local highest_damage_body = 0
                    local eye_pos = vector(client.eye_position())
                    local extrapolated_pos = utils.extrapolate_position(eye_pos, player_list.my_ticks, me)

                    for i = 2, 5 do
                        local hitbox = utils.extrapolate_position(
                            vector(entity.hitbox_position(player, i)),
                            player_list.threat_ticks, player
                        )
                        local ent, dmg = client.trace_bullet(
                            me,
                            extrapolated_pos.x, extrapolated_pos.y, extrapolated_pos.z,
                            hitbox.x, hitbox.y, hitbox.z, false
                        )
                        local ent2, dmg2 = client.trace_bullet(
                            me, eye_pos.x, eye_pos.y, eye_pos.z,
                            hitbox.x, hitbox.y, hitbox.z, false
                        )
                        if highest_damage_body < math.max(dmg, dmg2) then
                            highest_damage_body = math.max(dmg, dmg2)
                        end
                    end

                    local enemy_health = entity.get_prop(player, 'm_iHealth')
                    plist.set(player, 'Override prefer body aim', enemy_health <= highest_damage_body and 'Force' or 'On')
                end

                client.update_player_list()
            end

            local function force_safe(cmd)
                local me = entity.get_local_player()
                local player = client.current_threat()
                local key = get_weapon_key()

                if not key or not items[key .. '_force_safe_point'] or not items[key .. '_force_safe_point']:get() then
                    safe_shutdown()
                    return
                end

                if not player or not entity.is_alive(player) then
                    safe_shutdown()
                    return
                end

                if not check_triggers(key, 'force_safe_point') then
                    plist.set(player, 'Override safe point', '-')
                    client.update_player_list()
                    return
                end

                local is_lethal, _ = utils.get_lethal(me, player, false)
                plist.set(player, 'Override safe point', is_lethal and 'On' or '-')
                client.update_player_list()
            end

            client.register_esp_flag('BAIM', 255, 255, 255, function(ent)
                if not active then return end
                if not ent or not entity.is_enemy(ent) or entity.is_dormant(ent) then return end
                local baim_setting = plist.get(ent, 'Override prefer body aim')
                if baim_setting == '-' then return end
                local clr = color.new(255, 50, 50, 255):lerp(color.new(), baim_setting == 'On')
                return true, '\a' .. clr:to_hex() .. 'BAIM'
            end)

            client.register_esp_flag('SAFE', 255, 255, 255, function(ent)
                if not active then return end
                if not ent or not entity.is_enemy(ent) or entity.is_dormant(ent) then return end
                local safe_setting = plist.get(ent, 'Override safe point')
                if safe_setting == '-' then return end
                return true, '\a' .. color.new(217, 161, 78, 255):to_hex() .. 'SAFE'
            end)

            function player_list.invoke_callback()
                if not active then
                    utils.set_callback('round_start',   round_start,   false)
                    utils.set_callback('player_death',  player_death,  false)
                    utils.set_callback('bullet_impact', bullet_impact, false)
                    utils.set_callback('setup_command', force_baim,    false)
                    utils.set_callback('setup_command', force_safe,    false)
                    baim_shutdown()
                    safe_shutdown()
                    return
                end

                local any_baim, any_safe = false, false
                for _, weapon_name in ipairs(weapons_table) do
                    local key = weapon_name:gsub(' ', '_'):lower()
                    if items[key .. '_force_baim'] and items[key .. '_force_baim']:get() then
                        any_baim = true
                    end
                    if items[key .. '_force_safe_point'] and items[key .. '_force_safe_point']:get() then
                        any_safe = true
                    end
                end

                utils.set_callback('round_start',   round_start,   any_baim or any_safe)
                utils.set_callback('player_death',  player_death,  any_baim or any_safe)
                utils.set_callback('bullet_impact', bullet_impact, any_baim or any_safe)
                utils.set_callback('setup_command', force_baim,    any_baim)
                utils.set_callback('setup_command', force_safe,    any_safe)

                if not any_baim then baim_shutdown() end
                if not any_safe then safe_shutdown() end
            end

            for _, weapon_name in ipairs(weapons_table) do
                local key = weapon_name:gsub(' ', '_'):lower()

                if items[key .. '_force_baim'] then
                    items[key .. '_force_baim']:set_callback(player_list.invoke_callback, true)
                end
                if items[key .. '_force_safe_point'] then
                    items[key .. '_force_safe_point']:set_callback(player_list.invoke_callback, true)
                end
            end

            defer(function()
                baim_shutdown()
                safe_shutdown()
            end)
        end

        local adaptive do
            adaptive = { }

            local function on_setup_command()
                local key = get_weapon_key()
                if not key then return end

                local boost_item = items[key .. '_accuracy_boost']
                if boost_item and boost_item:get() then
                    local level_item = items[key .. '_accuracy_boost_level']
                    ref.ragebot.accuracy_boost:set(level_item and level_item:get() or 'Low')
                else
                    ref.ragebot.accuracy_boost:override()
                end

                local delay_item = items[key .. '_delay_shot']
                if delay_item and delay_item:get() then
                    local mode_item = items[key .. '_delay_shot_mode']
                    local block_item = items[key .. '_disable_delay_shot_on_mindmg']
                    local block_delay_shot = block_item
                        and block_item:get()
                        and ref.is_minimum_damage()

                    ref.ragebot.delay_shot:set(not block_delay_shot and (mode_item and mode_item:get() == 'On' or false))
                else
                    ref.ragebot.delay_shot:override()
                end
            end

            local function invoke_callback()
                if not active then
                    utils.set_callback('setup_command', on_setup_command, false)
                    ref.ragebot.accuracy_boost:override()
                    ref.ragebot.delay_shot:override()
                    return
                end

                local any_active = false
                for _, weapon_name in ipairs(weapons_table) do
                    local key = weapon_name:gsub(' ', '_'):lower()
                    if (items[key .. '_accuracy_boost'] and items[key .. '_accuracy_boost']:get()) or
                       (items[key .. '_delay_shot'] and items[key .. '_delay_shot']:get()) then
                        any_active = true
                        break
                    end
                end

                utils.set_callback('setup_command', on_setup_command, any_active)

                if not any_active then
                    ref.ragebot.accuracy_boost:override()
                    ref.ragebot.delay_shot:override()
                end
            end

            adaptive_invoke = invoke_callback

            for _, weapon_name in ipairs(weapons_table) do
                local key = weapon_name:gsub(' ', '_'):lower()

                if items[key .. '_accuracy_boost'] then
                    items[key .. '_accuracy_boost']:set_callback(invoke_callback, true)
                end
                if items[key .. '_delay_shot'] then
                    items[key .. '_delay_shot']:set_callback(invoke_callback, true)
                end
                if items[key .. '_disable_delay_shot_on_mindmg'] then
                    items[key .. '_disable_delay_shot_on_mindmg']:set_callback(invoke_callback, true)
                end
            end

            defer(function()
                ref.ragebot.accuracy_boost:override()
                ref.ragebot.delay_shot:override()
            end)
        end

        local single_shot do
            single_shot = {}

            local saved_hc = nil
            local was_peeking = false

            local function on_setup_command()
                local key = get_weapon_key()
                local ss_item = items.single_shot.enabled

                local allowed = false
                if key and ss_item and ss_item:get() then
                    local weapons_selected = items.single_shot.weapons
                    allowed = weapons_selected and (
                        (weapons_selected:get('Autosnipers') and key == 'autosnipers') or
                        (weapons_selected:get('Deagle')      and key == 'deagle')      or
                        (weapons_selected:get('Pistols')     and key == 'pistols')
                    )
                end

                local is_peeking = allowed and ref.is_quick_peek()

                if is_peeking and not was_peeking then
                    saved_hc = ref.ragebot.double_tap_hc:get()
                    ref.ragebot.double_tap_hc:set(100)
                elseif not is_peeking and was_peeking then
                    if saved_hc then
                        ref.ragebot.double_tap_hc:set(saved_hc)
                        saved_hc = nil
                    end
                elseif is_peeking then
                    ref.ragebot.double_tap_hc:set(100)
                end

                was_peeking = is_peeking
            end

            local function invoke_callback()
                if not active then
                    utils.set_callback('setup_command', on_setup_command, false)
                    if saved_hc then
                        ref.ragebot.double_tap_hc:set(saved_hc)
                        saved_hc = nil
                    end
                    was_peeking = false
                    return
                end

                local enabled = items.single_shot.enabled and items.single_shot.enabled:get()
                utils.set_callback('setup_command', on_setup_command, enabled or false)

                if not enabled and saved_hc then
                    ref.ragebot.double_tap_hc:set(saved_hc)
                    saved_hc = nil
                    was_peeking = false
                end
            end

            single_shot_invoke = invoke_callback

            if items.single_shot.enabled then
                items.single_shot.enabled:set_callback(invoke_callback, true)
            end

            defer(function()
                invoke_callback()
            end)

            defer(function()
                if saved_hc then
                    ref.ragebot.double_tap_hc:set(saved_hc)
                end
            end)
        end

        items.enabled:set_callback(function(this)
            active = this:get()
            player_list.invoke_callback()
            adaptive_invoke()
            single_shot_invoke()
        end, true)
    end

    local revolver_helper do
        revolver_helper = {}

        revolver_helper.paint = LPH_JIT(function()
            local me = entity.get_local_player()
            if not me or not entity.is_alive(me) or localplayer.weapon_group ~= 'revolver' then
                return
            end

            local weapon = csgo_weapons[entity.get_prop(entity.get_player_weapon(me), 'm_iItemDefinitionIndex')]
            if not weapon then
                return
            end

            local local_origin = vector(entity.get_prop(me, 'm_vecAbsOrigin'))
            local color_active = color.new(menu.settings.aimbot.revolver_helper.active:get_color())
            local color_inactive = color.new(menu.settings.aimbot.revolver_helper.inactive:get_color())

            for _, player_index in ipairs(entity.get_players(true)) do
                local distance = local_origin:dist(vector(entity.get_prop(player_index, 'm_vecOrigin')))
                local dmg = weapon.damage * math.pow(weapon.range_modifier, distance * 0.002)

                local armor = entity.get_prop(player_index, 'm_ArmorValue')
                local newdmg = dmg * (weapon.armor_ratio * 0.5)
                if dmg - newdmg * 0.5 > armor then
                    newdmg = dmg - (armor / 0.5)
                end

                local stomach_dmg = math.floor(newdmg * 1.25)

                local x1, y1, x2, y2, mult = entity.get_bounding_box(player_index)
                if not x1 or mult <= 0 then 
                    goto continue 
                end

                local screen_pos = vector(x1 + (x2 - x1) / 2, y1 - 17)
                local is_lethal  = stomach_dmg >= entity.get_prop(player_index, 'm_iHealth')

                render.text(screen_pos, is_lethal and color_active or color_inactive, 'cb', 0, tostring(stomach_dmg))

                ::continue::
            end
        end)

        items.revolver_helper.enabled:set_event('paint', revolver_helper.paint)
    end
end


