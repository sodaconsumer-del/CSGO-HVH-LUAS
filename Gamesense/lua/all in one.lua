--------------------------------------------------------------------------
--                              All in One                              --
--                       developer Iska and Shpex                       --
--          telegram Iska - @Iska_design, Shpex - @sh2wtylov3r          --
--------------------------------------------------------------------------
--                                LURAPH                                --
--------------------------------------------------------------------------

if not LPH_OBFUSCATED then
    LPH_NO_VIRTUALIZE = function (...)
        return ...;
    end
end

--------------------------------------------------------------------------
--                               LIBRARIES                              --
--------------------------------------------------------------------------

local libs = {
    pui = require("gamesense/pui") or error("Lua requires the PUI library to work."),
    ffi = require("ffi"),
    base64 = require("gamesense/base64") or error("Lua requires the BASE64 library to work."),
    http = require("gamesense/http") or error("Lua requires the HTTP library to work."),
    vector = require("vector"),
    anti_aim = require("gamesense/antiaim_funcs")  or error("Lua requires the ANTIAIM_FUNCS library to work."),
    color = require("gamesense/color")  or error("Lua requires the COLOR library to work."),
    websockets = require "gamesense/websockets" or error "Lua requires the websockets library to work.",
}

--------------------------------------------------------------------------
--                              SCRIPT INFO                             --
--------------------------------------------------------------------------

local script_info = {
    name = "All in One",
    user = _USER_NAME or "shpex",
    version = "Release",
    online_user = "0"
}

--------------------------------------------------------------------------
--                                 REFS                                 --
--------------------------------------------------------------------------

local reference = {
    rage = {
        weapon_type = ui.reference('RAGE', 'Weapon type', 'Weapon type'),
        aimbot = {
            enabled = ui.reference("RAGE", "Aimbot", "Enabled"),
            dt = {ui.reference("RAGE", "Aimbot", "Double tap")},
            dt_limit = ui.reference("RAGE", "Aimbot", "Double tap fake lag limit"),
            sp = ui.reference("RAGE", "Aimbot", "Force safe point"),
            baim = ui.reference("RAGE", "Aimbot", "Force body aim"),
            multipoint = ui.reference("RAGE", "Aimbot", "Multi-point scale"),
            hc = ui.reference("RAGE", "Aimbot", "Minimum hit chance"),
            dmg = ui.reference("RAGE", "Aimbot", "Minimum damage"),
            min_dmg = {ui.reference("RAGE", "Aimbot", "Minimum damage override")}
        },
        other = {
            fd = ui.reference("RAGE", "Other", "Duck peek assist"),
            quickpeek = {ui.reference("RAGE", "Other", "Quick peek assist")},
            delay = ui.reference('Rage', 'Other', 'Delay Shot'),
            boost = ui.reference('Rage', 'Other', 'Accuracy boost')
        }
    },

    aa = {
        other = {
            slow = {ui.reference("AA", "Other", "Slow motion")},
            leg_move = {ui.reference("AA", "Other", "Leg movement")},
            hs = {ui.reference("AA", "Other", "On shot anti-aim")},
            fake = {ui.reference("AA", "Other", "Fake Peek")},
        },
        fakelag = {
            enabled = {ui.reference("AA", "Fake lag", "Enabled")},
            amount = {ui.reference("AA", "Fake lag", "Amount")},
            variance = {ui.reference("AA", "Fake lag", "Variance")},
            limit = {ui.reference("AA", "Fake lag", "Limit")}
        },
        angles = {
            enabled = ui.reference("AA", "anti-aimbot angles", "enabled"),
            pitch = {ui.reference("AA", "anti-aimbot angles", "pitch")},
            base = ui.reference("AA", "anti-aimbot angles", "yaw base"),
            jitter = {ui.reference("AA", "anti-aimbot angles", "yaw jitter")},
            yaw = {ui.reference("AA", "anti-aimbot angles", "yaw")},
            body = {ui.reference("AA", "anti-aimbot angles", "body yaw")},
            fsbody = ui.reference("AA", "anti-aimbot angles", "freestanding body yaw"),
            edge = ui.reference("AA", "anti-aimbot angles", "edge yaw"),
            roll = {ui.reference("AA", "anti-aimbot angles", "roll")},
            fs = {ui.reference("AA", "anti-aimbot angles", "freestanding")},
            slow = {ui.reference("AA", "other", "slow motion")},
            fl = {ui.reference("AA", "Fake lag", "enabled")},
        }
    },

    legit = {
        weapon_type = {ui.reference("legit", "weapon type", "Weapon type")},
        aimbot = {
            enabled = {ui.reference("legit", "aimbot", "enabled")},
            speed = {ui.reference("legit", "aimbot", "speed")},
            speed_attack = {ui.reference("legit", "aimbot", "speed (in attack)")},
            speed_scale = {ui.reference("legit", "aimbot", "speed scale - fov")},
            max_lock = {ui.reference("legit", "aimbot", "maximum lock-on time")},
            reaction = {ui.reference("legit", "aimbot", "reaction time")},
            max_fov = {ui.reference("legit", "aimbot", "maximum fov")},
            recoil = {ui.reference("legit", "aimbot", "recoil compensation (p/y)")},
            recoil_1 = {ui.reference("legit", "aimbot", "\n")},
            quick_stop = {ui.reference("legit", "aimbot", "quick stop")},
            aim_smoke = {ui.reference("legit", "aimbot", "aim through smoke")},
            aim_blind = {ui.reference("legit", "aimbot", "aim while blind")},
            head = {ui.reference("legit", "aimbot", "head")},
            chest = {ui.reference("legit", "aimbot", "chest")},
            stomach = {ui.reference("legit", "aimbot", "stomach")}
        },
        triggerbot = {
            enabled = {ui.reference("legit", "triggerbot", "enabled")},
            min_hit = {ui.reference("legit", "triggerbot", "minimum hit chance")},
            reaction = {ui.reference("legit", "triggerbot", "reaction time")},
            burst = {ui.reference("legit", "triggerbot", "burst fire")},
            min_dmg = {ui.reference("legit", "triggerbot", "minimum damage")},
            auto_penetration = {ui.reference("legit", "triggerbot", "automatic penetration")},
            shoot_smoke = {ui.reference("legit", "triggerbot", "shoot through smoke")},
            shoot_blind = {ui.reference("legit", "triggerbot", "shoot while blind")},
            head = {ui.reference("legit", "triggerbot", "head")},
            chest = {ui.reference("legit", "triggerbot", "chest")},
            stomach = {ui.reference("legit", "triggerbot", "stomach")}
        },
        other = {
            accuracy = {ui.reference("legit", "other", "accuracy boost")},
            recoil = {ui.reference("legit", "other", "standalone recoil compensation")}
        },

    },

    visual = {
        esp = {
            mates = ui.reference("Visuals", "Player ESP", "Teammates")
        },
        effects = {
            remove_scope = ui.reference("Visuals", "Effects", "Remove scope overlay"),
            instant_scope = ui.reference("Visuals", "Effects", "Instant scope")
        }
    },

    misc = {
        settings = {
            menu_color = {ui.reference('MISC', 'Settings', 'Menu color')},
            menu_key = { ui.reference("MISC", "Settings", "Menu key") },
            dpi_scale = ui.reference("MISC", "Settings", "DPI scale")
        },

        misc = {
            ping = {ui.reference("MISC", "Miscellaneous", "Ping spike")},
            clan_tag_spammer = ui.reference("MISC", "Miscellaneous", "Clan tag spammer"),
        }
    }
}


--------------------------------------------------------------------------
--                                HELPS                                 --
--------------------------------------------------------------------------

local helps = { } do
    animation = {data = {}, list = {},  base_speed = 0.095}

    native_GetClipboardTextCount = vtable_bind("vgui2.dll", "VGUI_System010", 7, "int(__thiscall*)(void*)")
    native_SetClipboardText = vtable_bind("vgui2.dll", "VGUI_System010", 9, "void(__thiscall*)(void*, const char*, int)")
    native_GetClipboardText = vtable_bind("vgui2.dll", "VGUI_System010", 11, "int(__thiscall*)(void*, int, const char*, int)")
    new_char_arr = libs.ffi.typeof("char[?]")

    helps.link = function(link)
        panorama.open().SteamOverlayAPI.OpenExternalBrowserURL(link)
    end

    helps.normalize_yaw = function(yaw)
        while yaw > 180 do yaw = yaw - 360 end
        while yaw < -180 do yaw = yaw + 360 end
        return yaw
    end

    helps.frametime = function()
        local _ft = globals.frametime() * 8
        return _ft
    end 

    helps.lerp = function(a, b, t)
        return a + (b - a) * t
    end

    helps.RGBAtoHEX = function(redArg, greenArg, blueArg, alphaArg)
        return string.format('%.2x%.2x%.2x%.2x', redArg, greenArg, blueArg, alphaArg)
    end
    
    helps.gradient_text = function(time, string, r, g, b, a, r2, g2, b2, a2)
        local t_out, t_out_iter = {}, 1
    
        local r_add = (r2 - r)
        local g_add = (g2 - g)
        local b_add = (b2 - b)
        local a_add = (a2 - a)
    
        for i = 1, #string do
            local iter = (i - 1)/(#string - 1) + time
            t_out[t_out_iter] = "\a" .. helps.RGBAtoHEX(r + r_add * math.abs(math.cos(iter)), g + g_add * math.abs(math.cos(iter)), b + b_add * math.abs(math.cos(iter)), a + a_add * math.abs(math.cos(iter)))
    
            t_out[t_out_iter + 1] = string:sub(i, i)
    
            t_out_iter = t_out_iter + 2
        end
    
        return table.concat(t_out)
    end

    helps.math_lerp = function(start, end_pos, time)
        if start == end_pos then
            return end_pos
        end
    
        local frametime = globals.frametime() * 170
        time = time * math.min(frametime, (1 / 45) * 100)
    
        local val = start + (end_pos - start) * globals.frametime() * time
    
        if(math.abs(val - end_pos) < 0.01) then
            return end_pos
        end
    
        return val
    end

    helps.anim_old = function(name, new_value, speed, init)
        speed = speed or animation.base_speed
    
        if animation.list[name] == nil then
            animation.list[name] = (init and init) or 0
        end
    
        animation.list[name] = helps.math_lerp(animation.list[name], new_value, speed)
        
        return animation.list[name]
    end

    helps.contains = function(tbl, val) 
        for i=1, #tbl do
            if tbl[i] == val then return true end 
        end 
        return false 
    end
     
    helps.angle_forward = function(angle)
        local sin_pitch, cos_pitch = math.sin(math.rad(angle[1])), math.cos(math.rad(angle[1]))
        local sin_yaw, cos_yaw = math.sin(math.rad(angle[2])), math.cos(math.rad(angle[2]))
    
        return {cos_pitch * cos_yaw, cos_pitch * sin_yaw, -sin_pitch}
    end

    helps.print_log = function(text, text2)
        r, g, b = ui.get(reference.misc.settings.menu_color[1])
        client.color_log(r, g, b, "[".. script_info.name .."] \0")
        client.color_log(255, 255, 255, text .. " \0")
        client.color_log(r, g, b, text2)
    end

    helps.print_hit = function(r, g, b, target, hitbox, damage, left_hp, bt, hitchance)
        client.color_log(r, g, b, "[".. script_info.name .."] \0")
        client.color_log(255, 255, 255, "Hit" .. " \0")
        client.color_log(r, g, b, target .. " \0")
        client.color_log(255, 255, 255, "in the" .. " \0")
        client.color_log(r, g, b, hitbox .. " \0")
        client.color_log(255, 255, 255, "for" .. " \0")
        client.color_log(r, g, b, damage .. " \0")
        client.color_log(255, 255, 255, "[HP:" .. " \0")
        client.color_log(r, g, b, left_hp .. "," .. " \0")
        client.color_log(255, 255, 255, "BT:" .. " \0")
        client.color_log(r, g, b, bt .. "," .. " \0")
        client.color_log(255, 255, 255, "HC:" .. " \0")
        client.color_log(r, g, b, hitchance .. "\0")
        client.color_log(255, 255, 255, "]")
    end
    
    helps.print_hurt = function(r, g, b, hit_type, target, damage, left_hp)
        client.color_log(r, g, b, "[".. script_info.name .."] \0")
        client.color_log(255, 255, 255, hit_type .. " \0")
        client.color_log(r, g, b, target .. " \0")
        client.color_log(255, 255, 255, "for" .. " \0")
        client.color_log(r, g, b, damage .. " \0")
        client.color_log(255, 255, 255, "damage [HP:" .. " \0")
        client.color_log(r, g, b, left_hp .. "\0")
        client.color_log(255, 255, 255, "]")
    end

    helps.print_miss = function(r, g, b, reason, hitbox, target, bt, hitchance)
        client.color_log(r, g, b, "[".. script_info.name .."] \0")
        client.color_log(255, 255, 255, "Missed shot due to" .. " \0")
        client.color_log(r, g, b, reason .. " \0")
        client.color_log(255, 255, 255, "in" .. " \0")
        client.color_log(r, g, b, hitbox .. " \0")
        client.color_log(255, 255, 255, "for" .. " \0")
        client.color_log(r, g, b, target .. " \0")
        client.color_log(255, 255, 255, "[BT:" .. " \0")
        client.color_log(r, g, b, bt .. "," .. " \0")
        client.color_log(255, 255, 255, "HC:" .. " \0")
        client.color_log(r, g, b, hitchance .. "\0")
        client.color_log(255, 255, 255, "]")
    end

    helps.check_charge = function()
        local m_nTickBase = entity.get_prop(local_player, 'm_nTickBase')
        local client_latency = client.latency()
        local shift = math.floor(m_nTickBase - globals.tickcount() - 3 - toticks(client_latency) * .5 + .5 * (client_latency * 10))
    
        local wanted = -14 + (ui.get(reference.rage.aimbot.dt_limit) - 1) + 3 --error margin
    
        dt_charged = shift <= wanted
    end

    helps.clipboard_get = function()
        len = native_GetClipboardTextCount()

        if len > 0 then
            local char_arr = new_char_arr(len)
            native_GetClipboardText(0, char_arr, len)
            return libs.ffi.string(char_arr, len-1)
        end
    
    end


    helps.clipboard_set = function(text)
        text = tostring(text)

	    native_SetClipboardText(text, string.len(text))
    
    end


    helps.is_scoreboard_open = function()
        return client.key_state(0x09)
    end


end

local sha256 = { } do
    local band, bor, bxor = bit.band, bit.bor, bit.bxor
    local lshift, rshift = bit.lshift, bit.rshift
    local bnot = bit.bnot

    local k = {
        0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5,
        0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
        0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3,
        0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
        0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc,
        0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
        0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7,
        0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
        0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13,
        0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
        0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3,
        0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
        0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5,
        0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
        0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208,
        0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2
    }

    local function add(...)
        local sum = 0

        for i = 1, select("#", ...) do
            sum = (sum + select(i, ...)) % 2 ^ 32
        end

        return sum
    end

    local function num_to_bytes_64bit(high, low)
        return string.char(
            band(rshift(high, 24), 0xff), band(rshift(high, 16), 0xff),
            band(rshift(high, 8), 0xff), band(high, 0xff),
            band(rshift(low, 24), 0xff), band(rshift(low, 16), 0xff),
            band(rshift(low, 8), 0xff), band(low, 0xff)
        )
    end

    local function bytes_to_num(a, b, c, d)
        return lshift(a, 24) + lshift(b, 16) + lshift(c, 8) + d
    end

    local function rotr(n, b)
        return bor(rshift(n, b), lshift(band(n, rshift(0xffffffff, 32 - b)), 32 - b))
    end

    local function ch(x, y, z)
        return bxor(band(x, y), band(bnot(x), z))
    end

    local function maj(x, y, z)
        return bxor(bxor(band(x, y), band(x, z)), band(y, z))
    end

    local function sigma0(x)
        return bxor(bxor(rotr(x, 2), rotr(x, 13)), rotr(x, 22))
    end

    local function sigma1(x)
        return bxor(bxor(rotr(x, 6), rotr(x, 11)), rotr(x, 25))
    end

    local function gamma0(x)
        return bxor(bxor(rotr(x, 7), rotr(x, 18)), rshift(x, 3))
    end

    local function gamma1(x)
        return bxor(bxor(rotr(x, 17), rotr(x, 19)), rshift(x, 10))
    end

    function sha256.hash(msg)
        local h = {
            0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a,
            0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19
        }

        local msg_len = #msg
        local bit_len = msg_len * 8

        msg = string.format(
            '%s%s',
            msg,
            string.char(0x80)
        )

        local padding_len = 64 - ((msg_len + 9) % 64)

        if padding_len == 64 then
            padding_len = 0
        end

        msg = string.format(
            '%s%s',
            msg,
            string.rep(string.char(0), padding_len)
        )

        local high = math.floor(bit_len / 2 ^ 32)
        local low = bit_len % 2 ^ 32

        msg = string.format(
            '%s%s',
            msg,
            num_to_bytes_64bit(high, low)
        )

        for chunk_start = 1, #msg, 64 do
            local chunk = msg:sub(chunk_start, chunk_start + 63)
            local w = { }

            for i = 0, 15 do
                local offset = i * 4 + 1

                w[i] = bytes_to_num(
                    chunk:byte(
                        offset,
                        offset + 3
                    )
                )
            end

            for i = 16, 63 do
                w[i] = add(
                    gamma1(w[i-2]),
                    w[i-7],
                    gamma0(w[i-15]),
                    w[i-16]
                )
            end

            local a, b, c, d = h[1], h[2], h[3], h[4]
            local e, f, g, h_val = h[5], h[6], h[7], h[8]

            for i = 0, 63 do
                local t1 = add(
                    h_val,
                    sigma1(e),
                    ch(e, f, g),
                    k[i + 1],
                    w[i]
                )

                local t2 = add(
                    sigma0(a),
                    maj(a, b, c)
                )

                h_val = g
                g = f
                f = e
                e = add(d, t1)
                d = c
                c = b
                b = a
                a = add(t1, t2)
            end

            h[1] = add(h[1], a)
            h[2] = add(h[2], b)
            h[3] = add(h[3], c)
            h[4] = add(h[4], d)
            h[5] = add(h[5], e)
            h[6] = add(h[6], f)
            h[7] = add(h[7], g)
            h[8] = add(h[8], h_val)
        end

        local result = ''

        for i = 1, 8 do
            result = result .. string.format("%08x", h[i])
        end

        return result
    end
end

--------------------------------------------------------------------------
--                                 MENU                                 --
--------------------------------------------------------------------------

local menu_elements = { } do 
    groups = {
        antiaim = libs.pui.group("AA", "anti-aimbot angles"),
        fakelag = libs.pui.group("AA", "fake lag"),
        other = libs.pui.group("AA", "other"),
    }

    condition_list = {[1] = "Shared", [2] = "Standing", [3] = "Running", [4] = "Walking", [5] = "Crouching", [6] = "Sneaking", [7] = "Air", [8] = "Air Crouch"}
    aa_builder = {}

    log_date = "13.05.25"
    logs = {
        "Added Static on Fakelag for every condition",
        "Fix defensive AA on HS",
    }
    
    menu = {

        home = {
            info = {
                category_name = groups.fakelag:label("\a424242FF • \rWelcome to \vAll in One!"),
                category_name2 = groups.fakelag:label("\a424242FF • \r Helpers"),
                category_name3 = groups.fakelag:label("\a424242FF • \r RageBot"),
                line = groups.fakelag:label("\v────────────────────────────────"),
                user = groups.fakelag:label("\v \rUser: \v" .. script_info.user),
                build = groups.fakelag:label("\v \rBuild: \v" .. script_info.version),
                online = groups.fakelag:label("\v \rOnline: \v0"),
                selector = {
                    line1 = groups.fakelag:label("\v────────────────────────────────"),
                    state = groups.fakelag:combobox("\n ", {"Home", "Antiaim", "Misc"}),
                    line2 = groups.fakelag:label("\v────────────────────────────────"),
                },
                discord = groups.fakelag:button("\v \rDiscord", function() end),
                verify_discord = groups.fakelag:button("\v \rDiscord Verify", function() end),
            },
            
            change_log = {
                category_name = groups.other:label("\a424242FF • \r Change Log"),
                line = groups.other:label("\v────────────────────────────────"),
                update_date = groups.other:label("\a424242FF • \r Update " .. log_date),
            },

            configs = {
                category_name = groups.antiaim:label("\a424242FF \v• \r AntiAim"),
                line = groups.antiaim:label("\v────────────────────────────────"),
                list = groups.antiaim:listbox("\n", {}),
                input = groups.antiaim:textbox("\n"),
                create = groups.antiaim:button("\v \rCreate", function() end),
                save = groups.antiaim:button("\v \rSave", function() end),
                load = groups.antiaim:button("\v \rLoad", function() end),
                delete = groups.antiaim:button("\v \rDelete", function() end),
                import = groups.antiaim:button("\v \rImport", function() end),
                export = groups.antiaim:button("\v \rExport", function() end)
            }
        },

        antiaim = {
            builder = {
                category_name = groups.antiaim:label("\a424242FF • \r AntiAim"),
                line1 = groups.antiaim:label("\v────────────────────────────────"),
                condition_list = groups.antiaim:combobox("\v ~ \r Condition", condition_list),
            },

            helpers = {

                fakelag = {
                    enabled = groups.fakelag:checkbox("\v•\r  Fake Lag", 0x00),
                    amount = groups.fakelag:combobox("\v ~ \r Type", {"Dynamic", "Maximum", "Fluctuate"}),
                    limit = groups.fakelag:slider("\v ~ \r Limit", 1, 15, 1),
                    variance = groups.fakelag:slider("\v ~ \r Variance", 0, 100, 1, 1, "%"),
                },

                other = {
                    slow_motion = groups.fakelag:checkbox("\v•\r  Slow motion", 0x00),
                    leg_movement = groups.fakelag:combobox("\v ~ \r Leg movement", {"Off", "Always Slide", "Never Slide"}),
                    on_shot_aa = groups.fakelag:checkbox("\v•\r  On Shot Anti-Aim", 0x00),
                }
            },

            other = {
                header = {
                    category_name = groups.other:label("\a424242FF • \r Other"),
                    line = groups.other:label("\v────────────────────────────────"),
                },

                freestanding = {
                    enabled = groups.other:hotkey("\v•\r Freestanding"),
                    freestand_static = groups.other:checkbox("\v ~ \r Static freestand"),
                },

                manuals = {
                    enabled = groups.other:checkbox("\v•\r  Manuals"),
                    manual_static = groups.other:checkbox("\v ~ \r Static manual"),
                    manual_left = groups.other:hotkey("\v ~ \r Left"),
                    manual_right = groups.other:hotkey("\v ~ \r Right"),
                    manual_forward = groups.other:hotkey("\v ~ \r Forward"),
                    manual_reset = groups.other:hotkey("\v ~ \r Reset"),
                },
        
                aa_tweakers = {
                    avoid_backstab = groups.other:checkbox("\v•\r  Avoid Backstab"),
                    avoid_distance = groups.other:slider("\n\n", 150, 300, 200, true, "ft", 1),
                    safe_head = groups.other:checkbox("\v•\r  Safe Head"),
                },

                fast_ladder = {
                    enabled = groups.other:checkbox("\v•\r  Fast Ladder"),
                    types = groups.other:multiselect("\v ~ \r Types", {"Ascending", "Descending"}),
                },

                anim_breaker = {
                    enabled = groups.other:checkbox("\v•\r  Anim Breakers"),
                    a_ground = groups.other:combobox("\v ~ \r On Ground", "Disabled", "Walking"),
                    a_air = groups.other:combobox("\v ~ \r In Air", "Disabled", "Static", "Walking"),
                    a_other = groups.other:multiselect("\v ~ \r Other Animation", "Pitch 0 on Land", "Move Lean", "Earthquake"),
                    a_move_lean = groups.other:slider("\v ~ \r  Move Lean Value", 0, 100, 0, 1, "%")
                },

                -- warmup_aa = {
                --     enabled = groups.other:checkbox("\v•\r  Warmup AA"),
                --     force_on = groups.other:multiselect("Force On", {"On Round End", "On Warmup"}),
                -- }
            }
        },

        misc = {
            features = {
                header = {
                    category_name = groups.antiaim:label("\a424242FF • \r Features"),
                    line = groups.antiaim:label("\v────────────────────────────────"),
                },

                autobuy = {
                    enabled = groups.antiaim:checkbox("\v•\r  Autobuy"),
                    fast_buy = groups.antiaim:checkbox("\v ~ \r Fast buy primary"),
                    balance = groups.antiaim:slider("\v ~ \r Minimum balance for buy", 0, 16000, 8000, 100),
                    primary = groups.antiaim:combobox("\v ~ \r Primary", {"None", "AWP", "Auto", "Scout"}),
                    second = groups.antiaim:combobox("\v ~ \r Second", {"None", "Deagle | R8", "Dualies", "P250", "CZ | FN57 | Tec9"}),
                    nades = groups.antiaim:multiselect("\v ~ \r Nades", {'Molotov', 'Hegrenade', 'Smokegrenade'}),
                    other = groups.antiaim:multiselect("\v ~ \r Other", {'Vesthelm', 'Vest', 'Taser', 'Defuser'}),
                },

                thirdperson = {
                    enabled = groups.antiaim:checkbox("\v•\r  Thirdperson"),
                    distance = groups.antiaim:slider("\v ~ \r Distance", 30, 200, 150),
                },

                clantag = {
                    enabled = groups.antiaim:checkbox("\v•\r  Clantag"),
                    type = groups.antiaim:combobox("\v ~ \r Tags", {"None", "Legend Staff", "All in One"}),
                },

                aspect_ratio = {
                    enabled = groups.antiaim:checkbox("\v•\r  Aspect ratio"),
                    ratio = groups.antiaim:slider("\v ~ \r Force aspect ratio", 0.01, 200, 200, 0.01, "", 0.01),
                },

                baim_and_safe = {
                    enabled = groups.antiaim:checkbox("\v•\r  Baim and Safe"),
                    priority = groups.antiaim:checkbox("\v ~ \r High priority"),
                    esp_flags = groups.antiaim:checkbox("\v ~ \r ESP Flags"),
                    value_baim = groups.antiaim:slider("\v ~ \r BAIM > HP", 0, 100, 0),
                    value_safe = groups.antiaim:slider("\v ~ \r SAFE > HP", 0, 100, 0),
                },

                auto_delay = {
                    enabled = groups.antiaim:checkbox("\v•\r  Auto delay weapon"),
                    weapon = groups.antiaim:multiselect("\v ~ \r Weapons", {'SSG 08', 'R8 Revolver', 'Zeus', 'Pistol', 'Shotgun', 'AWP', 'G3SG1 / SCAR-20', 'Rifles', 'Desert Eagle'}),
                    disable_on_crouch = groups.antiaim:checkbox("\v ~ \r Disable delay on crouch"),
                },

                console = {
                    enabled = groups.antiaim:checkbox("\v•\r  Console commands"),
                    --warmap_settings = groups.antiaim:button("Default warmap settings", function() return client.exec('sv_cheats 1; mp_do_warmup_offine 1; bot_stop 1; sv_airaccelerate 100; sv_infinite_ammo 1; sv_regeneration_force_on 1; sv_grenade_trajectory 1; sv_grenade_trajectory_thickness 0.2; bot_kick; give weapon_hegrenade; give weapon_molotov; give weapon_smokegrenade; give weapon_ssg08; mp_warmuptime 9999999999999 mp_autoteambalance 0;mp_limitteams 0;mp_death_drop_gun 0;mp_buy_anywhere 1; impulse 101') end),
                    disabled_chat = groups.antiaim:checkbox("\v ~ \r Disabled chat"),
                    enemy_mute = groups.antiaim:checkbox("\v ~ \r Mute enemy team"),
                    filter = groups.antiaim:checkbox("\v ~ \r Filter"),
                },

                edge_stop = {
                    enabled = groups.antiaim:checkbox("\v•\r  Edge stop", 0x00)
                }
            },

            ragebot = {
                doubletap_improve = {
                    enabled = groups.fakelag:checkbox("\v•\r  Double Tap Improve"),
                },

                on_shot_fix = {
                    enabled = groups.fakelag:checkbox("\v•\r  Fix On Shot Anti-Aim"),
                },

                -- dormant_aimbot = {
                --     enabled = groups.fakelag:checkbox("\v•\r  Dormant Aimbot", 0x00),

                --     hitboxes = groups.fakelag:multiselect("Hitboxes", {"Head", "Chest", "Stomach", "Legs"}),
                --     accuracy = groups.fakelag:slider("Accuracy", 30, 100, 0, 1, "%"),
                --     minimum_damage = groups.fakelag:slider("Min. Damage", 0, 130, 0, 1)
                -- },

                aimbot_logs = {
                    enabled = groups.fakelag:checkbox("\v•\r  Aimbot Logs"),
                    input = groups.fakelag:multiselect("\v ~ \r Input", {"Console", "Screen"}),
                    color_hit = groups.fakelag:label("\v ~ \r Hit", {159, 207, 70, 255}),
                    color_spread = groups.fakelag:label("\v ~ \r Spread", {240, 240, 48, 255}),
                    color_death = groups.fakelag:label("\v ~ \r Death", {92, 86, 85, 255}),
                    color_unreg = groups.fakelag:label("\v ~ \r Unregistered shot", {92, 86, 85, 255}),
                    color_correction = groups.fakelag:label("\v ~ \r Resolver", {240, 74, 48, 255}),
                    color_pred = groups.fakelag:label("\v ~ \r Prediction error", {240, 74, 48, 255}),
                    checkup_colors = groups.fakelag:button("\v ~ \r Checkup colors", function() end),
                },
            },

            visuals = {
                header = {
                    category_name = groups.other:label("\a424242FF • \r Visuals"),
                    line = groups.other:label("\v────────────────────────────────"),
                },

                screen_indicators = {
                    enabled = groups.other:checkbox("\v•\r  Screen Indicators"),
                    color = groups.other:color_picker("\nScreen Indicators", 255, 255, 255, 255),
                },

                custom_scope = {
                    enabled = groups.other:checkbox("\v•\r  Custom Scope"),
                    scopetype = groups.other:combobox("\v ~ \r Type", {"Default", "Inverted"}),
                    scopeGap = groups.other:slider("\v ~ \r Gap", 4, 300, 5, 1, "px"),
                    scopeLength = groups.other:slider("\v ~ \r Length", 2, 300, 120, 1, "px"),
                    scopeColor = groups.other:color_picker("\nColor", 255, 255, 255, 255),
                },

                awall_crosshair = {
                    enabled = groups.other:checkbox("\v•\r  Awall crosshair"),
                },

                bullet_tracer = {
                    enabled = groups.other:checkbox("\v•\r  Bullet tracer", {255, 255, 255, 255}),
                    width = groups.other:slider("\v ~ \r Width", 1, 10, 3, 1, "px"),
                    duration = groups.other:slider("\v ~ \r Duration", 500, 4000, 2000, 1, "ms"),
                },

                -- netgraph = {
                --     enabled = groups.other:checkbox("\v•\r  Netgraph"),
                -- },

                healthshot = {
                    enabled = groups.other:checkbox("\v•\r  Healthshot effect"),

                },

                hitrate = {
                    enabled = groups.other:checkbox("\v•\r  Hit/Miss ratio"),
                },

                console_modulation = {
                    enabled = groups.other:checkbox("\v•\r  Console modulation", {20, 25, 30, 150}),
                },
                dmg_indicator = {
                    enabled = groups.other:checkbox("\v•\r  Damage indicator", {255, 255, 255, 255}),
                },
                enemy_dmg_print = {
                    enabled = groups.other:checkbox("\v•\r  3D Damage Marker"),
                },

                -- model_changer = {
                --     enabled = groups.other:checkbox("\v•\r  Model changer"),
                --     models = groups.other:combobox("Models", {"bomj", "ballas", "blue guy", "grove", "red guy", "tyan", "wuzimu", "artic_t"}),
                -- },
            }
        }

    }

    

    for i, log_text in ipairs(logs) do
        menu.home.change_log["log"..i] = groups.other:label("\a424242FF - \r " .. log_text)
    end
    

    for i = 1, #condition_list do
        aa_builder[i] = {
            enable = groups.antiaim:checkbox("Override " .. "\v" .. condition_list[i]),
            pitch = groups.antiaim:combobox("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Pitch", {"Off", "Down"}),
            yaw = groups.antiaim:combobox("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Yaw", {"Backward", "Static "}),
            yaw_type = groups.antiaim:combobox("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Yaw Type", {"Static ", "L&R"}),
            angle_yaw = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Angle Yaw", -180, 180, 0),
            left_yaw = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Left Yaw", -180, 180, 0),
            right_yaw = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Right Yaw", -180, 180, 0),
            lr_randomization = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Randomization", 0, 100, 0, 1, "%"),
            delayed = groups.antiaim:checkbox("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Delay"),
            delay_type = groups.antiaim:combobox("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Delay Type", {"Default", "Custom"}),
            body_yaw_delay = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Body Yaw Delay", 2, 16, 1, 1, "t"),
            stages_delay = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Stages Delay", 3, 10, 1),
            delay_1 = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Delay 1", 1, 16, 1, 1, "t"),
            delay_2 = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Delay 2", 1, 16, 1, 1, "t"),
            delay_3 = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Delay 3", 1, 16, 1, 1, "t"),
            delay_4 = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Delay 4", 1, 16, 1, 1, "t"),
            delay_5 = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Delay 5", 1, 16, 1, 1, "t"),
            delay_6 = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Delay 6", 1, 16, 1, 1, "t"),
            delay_7 = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Delay 7", 1, 16, 1, 1, "t"),
            delay_8 = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Delay 8", 1, 16, 1, 1, "t"),
            delay_9 = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Delay 9", 1, 16, 1, 1, "t"),
            delay_10 = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Delay 10", 1, 16, 1, 1, "t"),

            yaw_jitter = groups.antiaim:combobox("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Yaw Jitter", {"Off", "Center", "Offset", "Random", "Skitter"}),
            yaw_jitter_degree = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Yaw Jitter Degree", -90, 90, 0),
            yaw_jitter_randomization = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Yaw Jitter Randomization", -90, 90, 0),
            yaw_jitter_randomization_degree = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Yaw Jitter Randomization Degree", -90, 90, 0),

            body_yaw = groups.antiaim:combobox("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Body Yaw", {"Off", "Opposite", "Jitter", "Static"}),

            line5 = groups.antiaim:label("\v────────────────────────────────"),

            static_fakelag = groups.antiaim:checkbox("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Static Fakelag"),
            force_defensive = groups.antiaim:checkbox("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Force Defensive"),
            -- defensive_aa = groups.antiaim:checkbox("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Defensive AA"),

            defensive_pitch = groups.antiaim:combobox("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Defensive Pitch", {"Disabled", "Custom", "Jitter", "Spin", "Random"}),
            defensive_pitch_custom = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Defensive Pitch Custom", -89, 89, 0),
            defensive_pitch_jitter = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Defensive Pitch Jitter", -89, 89, 0),
            defensive_pitch_jitter_2 = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Defensive Pitch Jitter 2", -89, 89, 0),
            defensive_pitch_jitter_delay = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Defensive Pitch Jitter Delay", 2, 16, 1),
            defensive_pitch_spin = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Defensive Pitch Spin", -89, 89, 0),
            defensive_pitch_spin_2 = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Defensive Pitch Spin 2", -89, 89, 0),
            defensive_pitch_spin_speed = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Defensive Pitch Spin Speed", 1, 20, 1),
            defensive_pitch_random = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Defensive Pitch Random", -89, 89, 0),
            defensive_pitch_random_2 = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Defensive Pitch Random 2", -89, 89, 0),

            defensive_yaw = groups.antiaim:combobox("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Defensive Yaw", {"Disabled", "Custom", "Jitter", "Spin", "Random"}),
            defensive_yaw_custom = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Defensive Yaw Custom", -180, 180, 0),
            defensive_yaw_jitter = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Defensive Yaw Jitter", -180, 180, 0),
            defensive_yaw_jitter_2 = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Defensive Yaw Jitter 2", -180, 180, 0),
            defensive_yaw_jitter_delay = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Defensive Yaw Jitter Delay", 2, 16, 1),
            defensive_yaw_spin_speed = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Defensive Yaw Spin Speed", 1, 30, 1),
            defensive_yaw_random = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Defensive Yaw Random", -180, 180, 0),
            defensive_yaw_random_2 = groups.antiaim:slider("\v" .. condition_list[i] .. "\r ~ " .. "\v" .. "Defensive Yaw Random 2", -180, 180, 0),
        }
    end

    menu_visiblity = {
        home = {
            info = {
                menu.home.info.category_name:depend({menu.home.info.selector.state, "Home"}),
                menu.home.info.category_name2:depend({menu.home.info.selector.state, "Antiaim"}),
                menu.home.info.category_name3:depend({menu.home.info.selector.state, "Misc"}),
                menu.home.info.line:depend({menu.home.info.selector.state, "Home"}),
                menu.home.info.user:depend({menu.home.info.selector.state, "Home"}),
                menu.home.info.build:depend({menu.home.info.selector.state, "Home"}),
                menu.home.info.online:depend({menu.home.info.selector.state, "Home"}),
                menu.home.info.discord:depend({menu.home.info.selector.state, "Home"}),
                menu.home.info.verify_discord:depend({menu.home.info.selector.state, "Home"}),
            },

            change_log = {
                menu.home.change_log.category_name:depend({menu.home.info.selector.state, "Home"}),
                menu.home.change_log.line:depend({menu.home.info.selector.state, "Home"}),
                menu.home.change_log.update_date:depend({menu.home.info.selector.state, "Home"}),
                
            },

            configs = {
                menu.home.configs.category_name:depend({menu.home.info.selector.state, "Home"}),
                menu.home.configs.line:depend({menu.home.info.selector.state, "Home"}),
                menu.home.configs.list:depend({menu.home.info.selector.state, "Home"}),
                menu.home.configs.input:depend({menu.home.info.selector.state, "Home"}),
                menu.home.configs.create:depend({menu.home.info.selector.state, "Home"}),
                menu.home.configs.save:depend({menu.home.info.selector.state, "Home"}),
                menu.home.configs.load:depend({menu.home.info.selector.state, "Home"}),
                menu.home.configs.delete:depend({menu.home.info.selector.state, "Home"}),
                menu.home.configs.import:depend({menu.home.info.selector.state, "Home"}),
                menu.home.configs.export:depend({menu.home.info.selector.state, "Home"}),
            }
        },

        antiaim = {
            builder = {
                menu.antiaim.builder.category_name:depend({menu.home.info.selector.state, "Antiaim"}),
                menu.antiaim.builder.line1:depend({menu.home.info.selector.state, "Antiaim"}),
                menu.antiaim.builder.condition_list:depend({menu.home.info.selector.state, "Antiaim"}),
            },

            helpers = {
                fakelag = {
                    menu.antiaim.helpers.fakelag.enabled:depend({menu.home.info.selector.state, "Antiaim"}),
                    menu.antiaim.helpers.fakelag.amount:depend({menu.home.info.selector.state, "Antiaim"}, {menu.antiaim.helpers.fakelag.enabled, true}),
                    menu.antiaim.helpers.fakelag.limit:depend({menu.home.info.selector.state, "Antiaim"}, {menu.antiaim.helpers.fakelag.enabled, true}),
                    menu.antiaim.helpers.fakelag.variance:depend({menu.home.info.selector.state, "Antiaim"}, {menu.antiaim.helpers.fakelag.enabled, true}),
                },

                other = {
                    menu.antiaim.helpers.other.slow_motion:depend({menu.home.info.selector.state, "Antiaim"}),
                    menu.antiaim.helpers.other.leg_movement:depend({menu.home.info.selector.state, "Antiaim"}, {menu.antiaim.helpers.other.slow_motion, true}),
                    menu.antiaim.helpers.other.on_shot_aa:depend({menu.home.info.selector.state, "Antiaim"}),
                }
            },

            other = {
                header = {
                    menu.antiaim.other.header.category_name:depend({menu.home.info.selector.state, "Antiaim"}),
                    menu.antiaim.other.header.line:depend({menu.home.info.selector.state, "Antiaim"})
                },

                freestanding = {
                    menu.antiaim.other.freestanding.enabled:depend({menu.home.info.selector.state, "Antiaim"}),
                    menu.antiaim.other.freestanding.freestand_static:depend({menu.home.info.selector.state, "Antiaim"}),
                },

                manuals = {
                    menu.antiaim.other.manuals.enabled:depend({menu.home.info.selector.state, "Antiaim"}),
                    menu.antiaim.other.manuals.manual_static:depend({menu.home.info.selector.state, "Antiaim"}, {menu.antiaim.other.manuals.enabled, true}),
                    menu.antiaim.other.manuals.manual_left:depend({menu.home.info.selector.state, "Antiaim"}, {menu.antiaim.other.manuals.enabled, true}),
                    menu.antiaim.other.manuals.manual_right:depend({menu.home.info.selector.state, "Antiaim"}, {menu.antiaim.other.manuals.enabled, true}),
                    menu.antiaim.other.manuals.manual_forward:depend({menu.home.info.selector.state, "Antiaim"}, {menu.antiaim.other.manuals.enabled, true}),
                    menu.antiaim.other.manuals.manual_reset:depend({menu.home.info.selector.state, "Antiaim"}, {menu.antiaim.other.manuals.enabled, true}),
                },

                aa_tweakers = {
                    menu.antiaim.other.aa_tweakers.avoid_backstab:depend({menu.home.info.selector.state, "Antiaim"}),
                    menu.antiaim.other.aa_tweakers.avoid_distance:depend({menu.home.info.selector.state, "Antiaim"}, {menu.antiaim.other.aa_tweakers.avoid_backstab, true}),
                    menu.antiaim.other.aa_tweakers.safe_head:depend({menu.home.info.selector.state, "Antiaim"}),
                },

                fast_ladder = {
                    menu.antiaim.other.fast_ladder.enabled:depend({menu.home.info.selector.state, "Antiaim"}),
                    menu.antiaim.other.fast_ladder.types:depend({menu.home.info.selector.state, "Antiaim"}, {menu.antiaim.other.fast_ladder.enabled, true}),
                },

                anim_breaker = {
                    menu.antiaim.other.anim_breaker.enabled:depend({menu.home.info.selector.state, "Antiaim"}),
                    menu.antiaim.other.anim_breaker.a_ground:depend({menu.home.info.selector.state, "Antiaim"}, {menu.antiaim.other.anim_breaker.enabled, true}),
                    menu.antiaim.other.anim_breaker.a_air:depend({menu.home.info.selector.state, "Antiaim"}, {menu.antiaim.other.anim_breaker.enabled, true}),
                    menu.antiaim.other.anim_breaker.a_other:depend({menu.home.info.selector.state, "Antiaim"}, {menu.antiaim.other.anim_breaker.enabled, true}),
                    menu.antiaim.other.anim_breaker.a_move_lean:depend({menu.home.info.selector.state, "Antiaim"}, {menu.antiaim.other.anim_breaker.enabled, true}, {menu.antiaim.other.anim_breaker.a_other, "Move Lean"}),
                },
            }
        },

        misc = {
            features = {
                header = {
                    menu.misc.features.header.category_name:depend({menu.home.info.selector.state, "Misc"}),
                    menu.misc.features.header.line:depend({menu.home.info.selector.state, "Misc"}),
                },

                autobuy = {
                    menu.misc.features.autobuy.enabled:depend({menu.home.info.selector.state, "Misc"}),
                    menu.misc.features.autobuy.fast_buy:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.features.autobuy.enabled, true}),
                    menu.misc.features.autobuy.balance:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.features.autobuy.enabled, true}),
                    menu.misc.features.autobuy.primary:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.features.autobuy.enabled, true}),
                    menu.misc.features.autobuy.second:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.features.autobuy.enabled, true}),
                    menu.misc.features.autobuy.nades:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.features.autobuy.enabled, true}),
                    menu.misc.features.autobuy.other:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.features.autobuy.enabled, true}),
                },

                thirdperson = {
                    menu.misc.features.thirdperson.enabled:depend({menu.home.info.selector.state, "Misc"}),
                    menu.misc.features.thirdperson.distance:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.features.thirdperson.enabled, true}),
                },

                clantag = {
                    menu.misc.features.clantag.enabled:depend({menu.home.info.selector.state, "Misc"}),
                    menu.misc.features.clantag.type:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.features.clantag.enabled, true}),
                },

                aspect_ratio = {
                    menu.misc.features.aspect_ratio.enabled:depend({menu.home.info.selector.state, "Misc"}),
                    menu.misc.features.aspect_ratio.ratio:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.features.aspect_ratio.enabled, true}),
                },

                baim_and_safe = {
                    menu.misc.features.baim_and_safe.enabled:depend({menu.home.info.selector.state, "Misc"}),
                    menu.misc.features.baim_and_safe.priority:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.features.baim_and_safe.enabled, true}),
                    menu.misc.features.baim_and_safe.esp_flags:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.features.baim_and_safe.enabled, true}),
                    menu.misc.features.baim_and_safe.value_baim:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.features.baim_and_safe.enabled, true}),
                    menu.misc.features.baim_and_safe.value_safe:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.features.baim_and_safe.enabled, true}),
                },

                auto_delay = {
                    menu.misc.features.auto_delay.enabled:depend({menu.home.info.selector.state, "Misc"}),
                    menu.misc.features.auto_delay.weapon:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.features.auto_delay.enabled, true}),
                    menu.misc.features.auto_delay.disable_on_crouch:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.features.auto_delay.enabled, true}),
                },

                console = {
                    menu.misc.features.console.enabled:depend({menu.home.info.selector.state, "Misc"}),
                    menu.misc.features.console.disabled_chat:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.features.console.enabled, true}),
                    menu.misc.features.console.enemy_mute:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.features.console.enabled, true}),
                    menu.misc.features.console.filter:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.features.console.enabled, true}),
                },

                edge_stop = {
                    menu.misc.features.edge_stop.enabled:depend({menu.home.info.selector.state, "Misc"}),
                }

            },

            ragebot = {
                doubletap_improve = {
                    menu.misc.ragebot.doubletap_improve.enabled:depend({menu.home.info.selector.state, "Misc"}),
                },

                on_shot_fix = {
                    menu.misc.ragebot.on_shot_fix.enabled:depend({menu.home.info.selector.state, "Misc"}),
                },

                aimbot_logs = {
                    menu.misc.ragebot.aimbot_logs.enabled:depend({menu.home.info.selector.state, "Misc"}),
                    menu.misc.ragebot.aimbot_logs.input:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.ragebot.aimbot_logs.enabled, true}),
                    menu.misc.ragebot.aimbot_logs.color_hit:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.ragebot.aimbot_logs.enabled, true}),
                    menu.misc.ragebot.aimbot_logs.color_spread:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.ragebot.aimbot_logs.enabled, true}),
                    menu.misc.ragebot.aimbot_logs.color_death:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.ragebot.aimbot_logs.enabled, true}),
                    menu.misc.ragebot.aimbot_logs.color_unreg:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.ragebot.aimbot_logs.enabled, true}),
                    menu.misc.ragebot.aimbot_logs.color_correction:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.ragebot.aimbot_logs.enabled, true}),
                    menu.misc.ragebot.aimbot_logs.color_pred:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.ragebot.aimbot_logs.enabled, true}),
                    menu.misc.ragebot.aimbot_logs.checkup_colors:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.ragebot.aimbot_logs.enabled, true}),

                },
            },

            visuals = {
                header = {
                    menu.misc.visuals.header.category_name:depend({menu.home.info.selector.state, "Misc"}),
                    menu.misc.visuals.header.line:depend({menu.home.info.selector.state, "Misc"}),
                },

                screen_indicators = {
                    menu.misc.visuals.screen_indicators.enabled:depend({menu.home.info.selector.state, "Misc"}),
                    menu.misc.visuals.screen_indicators.color:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.visuals.screen_indicators.enabled, true}),
                },

                custom_scope = {
                    menu.misc.visuals.custom_scope.enabled:depend({menu.home.info.selector.state, "Misc"}),
                    menu.misc.visuals.custom_scope.scopetype:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.visuals.custom_scope.enabled, true}),
                    menu.misc.visuals.custom_scope.scopeGap:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.visuals.custom_scope.enabled, true}),
                    menu.misc.visuals.custom_scope.scopeLength:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.visuals.custom_scope.enabled, true}),
                    menu.misc.visuals.custom_scope.scopeColor:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.visuals.custom_scope.enabled, true}),
                },

                awall_crosshair = {
                    menu.misc.visuals.awall_crosshair.enabled:depend({menu.home.info.selector.state, "Misc"}),
                },
                bullet_tracer = {
                    menu.misc.visuals.bullet_tracer.enabled:depend({menu.home.info.selector.state, "Misc"}),
                    menu.misc.visuals.bullet_tracer.width:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.visuals.bullet_tracer.enabled, true}),
                    menu.misc.visuals.bullet_tracer.duration:depend({menu.home.info.selector.state, "Misc"}, {menu.misc.visuals.bullet_tracer.enabled, true})
                },
                healthshot = {
                    menu.misc.visuals.healthshot.enabled:depend({menu.home.info.selector.state, "Misc"}),
                },
                hitrate = {
                    menu.misc.visuals.hitrate.enabled:depend({menu.home.info.selector.state, "Misc"}),
                },
                console_modulation = {
                    menu.misc.visuals.console_modulation.enabled:depend({menu.home.info.selector.state, "Misc"}),
                },
                dmg_indicator = {
                    menu.misc.visuals.dmg_indicator.enabled:depend({menu.home.info.selector.state, "Misc"}),
                },
                enemy_dmg_print = {
                    menu.misc.visuals.enemy_dmg_print.enabled:depend({menu.home.info.selector.state, "Misc"}),
                }
            }
        }
    }

    for i = 1, #logs do
        menu.home.change_log["log"..i]:depend({menu.home.info.selector.state, "Home"})
    end

    for i = 1, #condition_list do
        local cond_check = {menu.antiaim.builder.condition_list, function() return (i ~= 1) end}
        local tab_cond = {menu.antiaim.builder.condition_list, condition_list[i]}
        local cnd_en = {aa_builder[i].enable, function() if (i == 1) then return true else return aa_builder[i].enable:get() end end}
        local aa_tab = {menu.home.info.selector.state, "Antiaim"}
        
        aa_builder[i].enable:depend(cond_check, tab_cond, aa_tab)
    
        aa_builder[i].pitch:depend(cnd_en, tab_cond, aa_tab)
        aa_builder[i].yaw:depend(cnd_en, tab_cond, aa_tab)
        aa_builder[i].yaw_type:depend(cnd_en, tab_cond, aa_tab)
        aa_builder[i].angle_yaw:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_type, "Static "})
        aa_builder[i].left_yaw:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_type, "L&R"})
        aa_builder[i].right_yaw:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_type, "L&R"})
        aa_builder[i].lr_randomization:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_type, "L&R"})
        aa_builder[i].yaw_jitter:depend(cnd_en, tab_cond, aa_tab)
        aa_builder[i].yaw_jitter_degree:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_jitter, "Center" or aa_builder[i].yaw_jitter, "Offset" or aa_builder[i].yaw_jitter, "Random" or aa_builder[i].yaw_jitter, "Skitter"})
        aa_builder[i].yaw_jitter_randomization:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_jitter, "Center"})
        aa_builder[i].yaw_jitter_randomization_degree:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_jitter, "Center"})
        aa_builder[i].delayed:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_type, "L&R"})
        aa_builder[i].delay_type:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_type, "L&R"}, {aa_builder[i].delayed, true})
        aa_builder[i].body_yaw_delay:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_type, "L&R"}, {aa_builder[i].delayed, true}, {aa_builder[i].delay_type, "Default"})
        aa_builder[i].stages_delay:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_type, "L&R"}, {aa_builder[i].delayed, true}, {aa_builder[i].delay_type, "Custom"})
        aa_builder[i].delay_1:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_type, "L&R"}, {aa_builder[i].delayed, true}, {aa_builder[i].delay_type, "Custom"}, {aa_builder[i].stages_delay, function() if aa_builder[i].stages_delay:get() > 0 then return true end end})
        aa_builder[i].delay_2:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_type, "L&R"}, {aa_builder[i].delayed, true}, {aa_builder[i].delay_type, "Custom"}, {aa_builder[i].stages_delay, function() if aa_builder[i].stages_delay:get() > 1 then return true end end})
        aa_builder[i].delay_3:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_type, "L&R"}, {aa_builder[i].delayed, true}, {aa_builder[i].delay_type, "Custom"}, {aa_builder[i].stages_delay, function() if aa_builder[i].stages_delay:get() > 2 then return true end end})
        aa_builder[i].delay_4:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_type, "L&R"}, {aa_builder[i].delayed, true}, {aa_builder[i].delay_type, "Custom"}, {aa_builder[i].stages_delay, function() if aa_builder[i].stages_delay:get() > 3 then return true end end})
        aa_builder[i].delay_5:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_type, "L&R"}, {aa_builder[i].delayed, true}, {aa_builder[i].delay_type, "Custom"}, {aa_builder[i].stages_delay, function() if aa_builder[i].stages_delay:get() > 4 then return true end end})
        aa_builder[i].delay_6:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_type, "L&R"}, {aa_builder[i].delayed, true}, {aa_builder[i].delay_type, "Custom"}, {aa_builder[i].stages_delay, function() if aa_builder[i].stages_delay:get() > 5 then return true end end})
        aa_builder[i].delay_7:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_type, "L&R"}, {aa_builder[i].delayed, true}, {aa_builder[i].delay_type, "Custom"}, {aa_builder[i].stages_delay, function() if aa_builder[i].stages_delay:get() > 6 then return true end end})
        aa_builder[i].delay_8:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_type, "L&R"}, {aa_builder[i].delayed, true}, {aa_builder[i].delay_type, "Custom"}, {aa_builder[i].stages_delay, function() if aa_builder[i].stages_delay:get() > 7 then return true end end})
        aa_builder[i].delay_9:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_type, "L&R"}, {aa_builder[i].delayed, true}, {aa_builder[i].delay_type, "Custom"}, {aa_builder[i].stages_delay, function() if aa_builder[i].stages_delay:get() > 8 then return true end end})
        aa_builder[i].delay_10:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].yaw_type, "L&R"}, {aa_builder[i].delayed, true}, {aa_builder[i].delay_type, "Custom"}, {aa_builder[i].stages_delay, function() if aa_builder[i].stages_delay:get() > 9 then return true end end})
        
        aa_builder[i].body_yaw:depend(cnd_en, tab_cond, aa_tab)

        aa_builder[i].line5:depend(cnd_en, tab_cond, aa_tab)
        aa_builder[i].static_fakelag:depend(cnd_en, tab_cond, aa_tab)
        aa_builder[i].force_defensive:depend(cnd_en, tab_cond, aa_tab)
        -- aa_builder[i].defensive_aa:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].force_defensive, true})
        aa_builder[i].defensive_pitch:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].force_defensive, true})
        aa_builder[i].defensive_pitch_custom:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].force_defensive, true}, {aa_builder[i].defensive_pitch, "Custom"})
        aa_builder[i].defensive_pitch_jitter:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].force_defensive, true}, {aa_builder[i].defensive_pitch, "Jitter"})
        aa_builder[i].defensive_pitch_jitter_2:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].force_defensive, true}, {aa_builder[i].defensive_pitch, "Jitter"})
        aa_builder[i].defensive_pitch_jitter_delay:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].force_defensive, true}, {aa_builder[i].defensive_pitch, "Jitter"})
        aa_builder[i].defensive_pitch_spin:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].force_defensive, true}, {aa_builder[i].defensive_pitch, "Spin"})
        aa_builder[i].defensive_pitch_spin_2:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].force_defensive, true}, {aa_builder[i].defensive_pitch, "Spin"})
        aa_builder[i].defensive_pitch_spin_speed:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].force_defensive, true}, {aa_builder[i].defensive_pitch, "Spin"})
        aa_builder[i].defensive_pitch_random:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].force_defensive, true}, {aa_builder[i].defensive_pitch, "Random"})
        aa_builder[i].defensive_pitch_random_2:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].force_defensive, true}, {aa_builder[i].defensive_pitch, "Random"})
    
        aa_builder[i].defensive_yaw:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].force_defensive, true})
        aa_builder[i].defensive_yaw_custom:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].force_defensive, true}, {aa_builder[i].defensive_yaw, "Custom"})
        aa_builder[i].defensive_yaw_jitter:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].force_defensive, true}, {aa_builder[i].defensive_yaw, "Jitter"})
        aa_builder[i].defensive_yaw_jitter_2:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].force_defensive, true}, {aa_builder[i].defensive_yaw, "Jitter"})
        aa_builder[i].defensive_yaw_jitter_delay:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].force_defensive, true}, {aa_builder[i].defensive_yaw, "Jitter"})
        aa_builder[i].defensive_yaw_spin_speed:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].force_defensive, true}, {aa_builder[i].defensive_yaw, "Spin"})
        aa_builder[i].defensive_yaw_random:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].force_defensive, true}, {aa_builder[i].defensive_yaw, "Random"})
        aa_builder[i].defensive_yaw_random_2:depend(cnd_en, tab_cond, aa_tab, {aa_builder[i].force_defensive, true}, {aa_builder[i].defensive_yaw, "Random"})

    end

    menu_elements.hide_orig_aa = function(visible)
        ui.set_visible(reference.aa.angles.enabled, visible)
        ui.set_visible(reference.aa.angles.pitch[1], visible)
        ui.set_visible(reference.aa.angles.pitch[2], visible)
        ui.set_visible(reference.aa.angles.base, visible)
        ui.set_visible(reference.aa.angles.yaw[1], visible)
        ui.set_visible(reference.aa.angles.yaw[2], visible)
        ui.set_visible(reference.aa.angles.jitter[1], visible)
        ui.set_visible(reference.aa.angles.roll[1], visible)
        ui.set_visible(reference.aa.angles.jitter[2], visible)
        ui.set_visible(reference.aa.angles.body[1], visible)
        ui.set_visible(reference.aa.angles.body[2], visible)
        ui.set_visible(reference.aa.angles.fsbody, visible)
        ui.set_visible(reference.aa.angles.edge, visible)
        ui.set_visible(reference.aa.angles.fs[1], visible)
        ui.set_visible(reference.aa.angles.fs[2], visible)
        ui.set_visible(reference.aa.fakelag.enabled[1], visible)
        ui.set_visible(reference.aa.fakelag.enabled[2], visible)
        ui.set_visible(reference.aa.fakelag.amount[1], visible)
        ui.set_visible(reference.aa.fakelag.variance[1], visible)
        ui.set_visible(reference.aa.fakelag.limit[1], visible)
    
        ui.set_visible(reference.aa.other.slow[1], visible)
        ui.set_visible(reference.aa.other.slow[2], visible)
        ui.set_visible(reference.aa.other.leg_move[1], visible)
        ui.set_visible(reference.aa.other.hs[1], visible)
        ui.set_visible(reference.aa.other.hs[2], visible)
        ui.set_visible(reference.aa.other.fake[1], visible)
        ui.set_visible(reference.aa.other.fake[2], visible)
    end
    
end

--------------------------------------------------------------------------
--                                ANTIAIM                               --
--------------------------------------------------------------------------

local builder = { } do 
    aa_state = { }
    debug_state = "Shared"
    stateid = 1
    builder.last_input_time  = 0

    -- defensive active check
    active = false
    untils = 0
    ticks = 0
    lastsimtime = 0

    local time2tick = function(t)
        return math.floor(0.5 + (t / globals.tickinterval()))
    end

    -- 
    

    data = {
        is_inverted = false,
        ticks = 0,
        switch = false,
        pitch = {
            type = "Off",
            amount = 0
        },
        yaw = {
            base = "At targets",
            type = "Off",
            degree = 0,
            lr = {
                yaw = 0,
                left_yaw = 0,
                right_yaw = 0,
            },
            jitter = {
                type = "Off",
                degree = 0,
                amount = 0,
            }
        },
        body_yaw = {
            type = "Off",
            amount = 0
        },
        freestanding = false,
        manual_direction = 0,
        ticks_yaw = 0,
        pitch_jitter = false,
        yaw_jitter = false,

    }

    builder.avoid_distance = function(x1, y1, z1, x2, y2, z2)
        return math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))
    end
    
    builder.avoid_extrapolate = function(player, ticks, x, y, z)
        local xv, yv, zv =  entity.get_prop(player, "m_vecVelocity")
        local new_x = x + globals.tickinterval() * xv * ticks
        local new_y = y + globals.tickinterval() * yv * ticks
        local new_z = z + globals.tickinterval() * zv * ticks
        return new_x, new_y, new_z
    end

    builder.get_desync_side = function(cmd)
        local lp = entity.get_local_player()
        if lp == nil then return end
    
        local body_yaw = entity.get_prop(lp, "m_flPoseParameter", 11) * 120 - 60
    
        return body_yaw > 0
    end

    builder.getstate = function(crouch, on_ground, moving, slow, air, velocity)
        if on_ground and not moving and not crouch then return "Standing" end
        if not air and not crouch and not slow then return "Running" end
        if on_ground and (slow and not air) then return "Walking" end
        if crouch and not moving and (not air and on_ground) then return "Crouching" end
        if crouch and moving and (not air and on_ground) and not slow then return "Sneaking" end
        if not crouch and (air or not on_ground) then return "Air" end
        if crouch and (air or not on_ground) then return "Air Crouch" end
        return "Shared"
    end
    
    builder.set_states = function(cmd)
        local local_player = entity.get_local_player()
        local flags = entity.get_prop(local_player, 'm_fFlags')
        local m_vecVelocity = { entity.get_prop(local_player, 'm_vecVelocity') }
        local velocity = math.sqrt(m_vecVelocity[1] ^ 2 + m_vecVelocity[2] ^ 2)
        
        
        local crouch = entity.get_prop(local_player, 'm_flDuckAmount') == 1 or ui.get(reference.rage.other.fd)
        local on_ground = bit.band(flags, bit.lshift(1, 0)) ~= 0
        local moving = math.sqrt(m_vecVelocity[1] ^ 2 + m_vecVelocity[2] ^ 2) > 1.1 * 3.3
        local slow = ui.get(reference.aa.other.slow[1]) and ui.get(reference.aa.other.slow[2])
        local air = cmd.in_jump ~= 0
        
        aa_state = builder.getstate(crouch, on_ground, moving, slow, air, velocity)
    end

    builder.defensive = function()
        local cursimtime = time2tick(entity.get_prop(entity.get_local_player(), "m_flSimulationTime"))
        local simdif = cursimtime - lastsimtime
        local active = false
        
        
        if not ui.get(reference.rage.aimbot.dt[2]) and not ui.get(reference.aa.other.hs[2]) then
            untils = 0
            ticks = 0
            return false
        end

        if (simdif < 0) then
            untils = globals.tickcount() + math.abs(simdif) -- - time2tick(client.latency())
            ticks = untils - globals.tickcount()
        end

        if ui.get(reference.rage.aimbot.dt[2]) or ui.get(reference.aa.other.hs[2]) then
            active = untils > globals.tickcount()
            lastsimtime = cursimtime
            time = ticks - (untils - globals.tickcount())
        end
    
        return active
    end

    builder.gamesense_add = function()
        if menu.antiaim.helpers.fakelag.enabled:get() then
            ui.set(reference.aa.fakelag.enabled[2], "Always on")
            ui.set(reference.aa.fakelag.enabled[1], true)
            ui.set(reference.aa.fakelag.amount[1], menu.antiaim.helpers.fakelag.amount:get())
            ui.set(reference.aa.fakelag.limit[1], menu.antiaim.helpers.fakelag.limit:get())
            ui.set(reference.aa.fakelag.variance[1], menu.antiaim.helpers.fakelag.variance:get())
        else
            ui.set(reference.aa.fakelag.enabled[1], false)
        end

        if menu.antiaim.helpers.other.on_shot_aa:get() then
            if menu.antiaim.helpers.other.on_shot_aa.hotkey:get() then
                ui.set(reference.aa.other.hs[2], "Always on")
                ui.set(reference.aa.other.hs[1], true) 
            else
                ui.set(reference.aa.other.hs[1], false) 
            end
        else
            ui.set(reference.aa.other.hs[1], false) 
        end

        if menu.antiaim.helpers.other.slow_motion:get() then
            if menu.antiaim.helpers.other.slow_motion.hotkey:get(true) then
                ui.set(reference.aa.angles.slow[2], "Always on")
                ui.set(reference.aa.angles.slow[1], true) 
            else
                ui.set(reference.aa.angles.slow[1], false)
            end

            ui.set(reference.aa.other.leg_move[1], menu.antiaim.helpers.other.leg_movement:get())
        else
            ui.set(reference.aa.other.leg_move[1], "Off")
        end
    end

    builder.avoid_backstab = function(cmd)
        if menu.antiaim.other.aa_tweakers.avoid_backstab:get() then
            local enemy = client.current_threat()
            if enemy == nil then return end
            
            local lp = entity.get_local_player()
            local weapon = entity.get_player_weapon(enemy)

            if weapon == nil or entity.get_classname(weapon) ~= "CKnife" then return end

            local ex,ey,ez = entity.get_origin(enemy)
            local lx,ly,lz = entity.get_origin(lp)

            if ex == nil or lx == nil then return end


            for ticks = 1, 9 do
                local tex, tey, tez = builder.avoid_extrapolate(lp, ticks, lx, ly, lz)
                local distance = builder.avoid_distance(ex, ey, ez, tex, tey, tez)
                if math.abs(distance) < menu.antiaim.other.aa_tweakers.avoid_distance:get() then
                    data.yaw.base = "At targets"
                    data.yaw.degree = -180
                    cmd.force_defensive = false

                    return true
                end
            end
        end
    end

    builder.safe_head = function(cmd)
        if menu.antiaim.other.aa_tweakers.safe_head:get() then
            local lp = entity.get_local_player()
            if lp == nil or not entity.is_alive(lp) then return end

            local weapon = entity.get_player_weapon(lp)
            if weapon == nil then return end

            local lp_threat = client.current_threat()

            local threat_origin = libs.vector(entity.get_prop(lp_threat, "m_vecOrigin"))
            local lp_origin = libs.vector(entity.get_prop(lp, "m_vecOrigin"))

            local is_knife = entity.get_classname(weapon) == "CKnife"
            local knife_state = aa_state == "Air Crouch" and is_knife
            -- local is_defensive = builder.defensive()

            if knife_state then
                data.pitch.type = "Down"
                data.pitch.amount = 0
                data.yaw.base = "At targets"
                data.yaw.type = "180"
                data.yaw.degree = 0
                data.yaw.jitter.amount = 0
                data.body_yaw.type = "Static"
                data.body_yaw.amount = 0

                cmd.force_defensive = false
            end
        end
    end

    builder.fast_ladder = function(cmd)
        if menu.antiaim.other.fast_ladder.enabled:get() then
            local local_player = entity.get_local_player()
            local pitch, yaw = client.camera_angles()
            if entity.get_prop(local_player, "m_MoveType") ~= 9 then return end
            cmd.yaw = math.floor(cmd.yaw + 0.5)
            cmd.roll = 0

            if menu.antiaim.other.fast_ladder.types:get("Ascending") then
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
            
            if menu.antiaim.other.fast_ladder.types:get("Descending") then
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


    builder.manual = function()
        menu.antiaim.other.manuals.manual_left:set("On hotkey")
        menu.antiaim.other.manuals.manual_right:set("On hotkey")
        menu.antiaim.other.manuals.manual_forward:set("On hotkey")
        menu.antiaim.other.manuals.manual_reset:set("On hotkey")

        if not menu.antiaim.other.manuals.enabled:get() then return end
        

        if globals.curtime() > builder.last_input_time + 0.15 then
            -- Сохраняем предыдущее направление для toggle логики
            local prev_direction = data.manual_direction or 0
            
            -- Обрабатываем ввод с toggle логикой
            if menu.antiaim.other.manuals.manual_left:get() then
                data.manual_direction = (prev_direction == -90) and 0 or -90
                builder.last_input_time = globals.curtime()
            elseif menu.antiaim.other.manuals.manual_right:get() then
                data.manual_direction = (prev_direction == 90) and 0 or 90
                builder.last_input_time = globals.curtime()
            elseif menu.antiaim.other.manuals.manual_forward:get() then
                data.manual_direction = (prev_direction == 180) and 0 or 180
                builder.last_input_time = globals.curtime()
            elseif menu.antiaim.other.manuals.manual_reset:get() then
                data.manual_direction = 0
                builder.last_input_time = globals.curtime()
            end
        end

        if data.manual_direction == 0 then
            data.yaw.base = "At targets"
            return 
        end

        if menu.antiaim.other.manuals.manual_static:get() then
            data.body_yaw.type = "Static"
            data.body_yaw.amount = 0
        end

        data.is_inverted = false
        data.yaw.type = "180"
        data.yaw.degree = data.manual_direction
        data.pitch.type = "Down"
        data.yaw.base = "Local view"
        data.yaw.jitter.type = "Off"
        data.freestanding = false
    end


    builder.static_fakelag = function(cmd, fakelag_active)
        if not fakelag_active then return end
        if (ui.get(reference.rage.aimbot.dt[2]) and ui.get(reference.rage.aimbot.dt[1])) or (ui.get(reference.aa.other.hs[2]) and ui.get(reference.aa.other.hs[1])) then return end

        data.pitch.type = "Down"
        data.pitch.amount = 0
        data.yaw.base = "At targets"
        data.yaw.type = "180"
        data.yaw.degree = 0
        data.yaw.jitter.amount = 0
        data.body_yaw.type = "Static"
        data.body_yaw.amount = 0
    end



    builder.setup_command = function(cmd)
        local lp = entity.get_local_player()
        if lp == nil or not entity.is_alive(lp) then return end

        debug_state = aa_state
        if aa_state == "Air Crouch" and aa_builder[8].enable:get() then stateid = 8
        elseif aa_state == "Air" and aa_builder[7].enable:get() then stateid = 7
        elseif aa_state == "Sneaking" and aa_builder[6].enable:get() then stateid = 6
        elseif aa_state == "Crouching" and aa_builder[5].enable:get() then stateid = 5
        elseif aa_state == "Walking" and aa_builder[4].enable:get() then stateid = 4
        elseif aa_state == "Running" and aa_builder[3].enable:get() then stateid = 3
        elseif aa_state == "Standing" and aa_builder[2].enable:get() then stateid = 2
        else stateid = 1 end

        data.is_inverted = builder.get_desync_side(cmd)
        add_delay = math.floor(globals.realtime() * data.ticks) % aa_builder[stateid].stages_delay:get()

        if cmd.chokedcommands == 0 then
            if aa_builder[stateid].yaw_type:get() == "L&R" then 
                if aa_builder[stateid].delayed:get() then
                    if aa_builder[stateid].delay_type:get() == "Default" then 
                        data.ticks = data.ticks + 1.5
                        
                        if data.ticks > aa_builder[stateid].body_yaw_delay:get() then
                            data.ticks = 0
                            data.switch = not data.switch
                        end
                    
                        data.is_inverted = data.switch
                    end
    
                    if aa_builder[stateid].delay_type:get() == "Custom" then 
                        data.ticks = data.ticks + 1.5
                        
                        if add_delay == 1 then
                            if data.ticks > aa_builder[stateid].delay_1:get() then
                                data.ticks = 0
                                data.switch = not data.switch
                            end
                        elseif add_delay == 2 then
                            if data.ticks > aa_builder[stateid].delay_2:get() then
                                data.ticks = 0
                                data.switch = not data.switch
                            end
                        elseif add_delay == 3 then
                            if data.ticks > aa_builder[stateid].delay_3:get() then
                                data.ticks = 0
                                data.switch = not data.switch
                            end
                        elseif add_delay == 4 then
                            if data.ticks > aa_builder[stateid].delay_4:get() then
                                data.ticks = 0
                                data.switch = not data.switch
                            end
                        elseif add_delay == 5 then
                            if data.ticks > aa_builder[stateid].delay_5:get() then
                                data.ticks = 0
                                data.switch = not data.switch
                            end
    
                        elseif add_delay == 6 then
                            if data.ticks > aa_builder[stateid].delay_6:get() then
                                data.ticks = 0
                                data.switch = not data.switch
                            end
    
                        elseif add_delay == 7 then
                            if data.ticks > aa_builder[stateid].delay_7:get() then
                                data.ticks = 0
                                data.switch = not data.switch
                            end
    
                        elseif add_delay == 8 then
                            if data.ticks > aa_builder[stateid].delay_8:get() then
                                data.ticks = 0
                                data.switch = not data.switch
                            end
    
                        elseif add_delay == 9 then
                            if data.ticks > aa_builder[stateid].delay_9:get() then
                                data.ticks = 0
                                data.switch = not data.switch
                            end
    
                        elseif add_delay == 10 then
                            if data.ticks > aa_builder[stateid].delay_10:get() then
                                data.ticks = 0
                                data.switch = not data.switch
                            end
    
                        end
                        data.is_inverted = data.switch
                    end
                end
            end
        end

        if cmd.chokedcommands == 0 then
            data.pitch.type = aa_builder[stateid].pitch:get()
            data.yaw.type = "180"

            data.yaw.lr.left_yaw = aa_builder[stateid].left_yaw:get()
            data.yaw.lr.right_yaw = aa_builder[stateid].right_yaw:get()

            data.yaw.lr.yaw = aa_builder[stateid].angle_yaw:get()

            data.yaw.jitter.type = aa_builder[stateid].yaw_jitter:get()
            data.yaw.jitter.degree = aa_builder[stateid].yaw_jitter_degree:get()

            if globals.chokedcommands() == 0 then
                if aa_builder[stateid].yaw_type:get() == "L&R" then
                    data.yaw.degree = ((data.is_inverted and data.yaw.lr.left_yaw or data.yaw.lr.right_yaw) + data.yaw.lr.yaw) + client.random_float(-aa_builder[stateid].lr_randomization:get() / 5, aa_builder[stateid].lr_randomization:get() / 5)
                else
                    data.yaw.degree = data.yaw.lr.yaw
                end
            end

            if aa_builder[stateid].yaw_jitter:get() ~= "Off" then
                if aa_builder[stateid].yaw_jitter:get() == "Center" then
                    data.yaw.jitter.amount = data.yaw.jitter.degree + client.random_float(aa_builder[stateid].yaw_jitter_randomization:get(), aa_builder[stateid].yaw_jitter_randomization_degree:get())
                else
                    data.yaw.jitter.amount = data.yaw.jitter.degree
                end
            end 

            if aa_builder[stateid].delayed:get() and aa_builder[stateid].body_yaw:get() == "Jitter" then
                data.body_yaw.type = "Static"
                                
                if globals.chokedcommands() == 0 then
                    data.body_yaw.amount = data.is_inverted and -1 or 1
                end
            else
                data.body_yaw.type = aa_builder[stateid].body_yaw:get()
                data.body_yaw.amount = -1
            end
        end
        
        if aa_builder[stateid].force_defensive:get() then 
            if builder.defensive() then
                if aa_builder[stateid].defensive_pitch:get() == "Custom" then
                    data.pitch.type = "Custom"
                    data.pitch.amount = aa_builder[stateid].defensive_pitch_custom:get()
                elseif aa_builder[stateid].defensive_pitch:get() == "Jitter" then
                    data.ticks = data.ticks + 1.5
                    if data.ticks > aa_builder[stateid].defensive_pitch_jitter_delay:get() then
                        data.ticks = 0
                        data.pitch_jitter = not data.pitch_jitter
                    end
                    data.pitch.type = "Custom"
                    data.pitch.amount = data.pitch_jitter and aa_builder[stateid].defensive_pitch_jitter:get() or aa_builder[stateid].defensive_pitch_jitter_2:get()
                elseif aa_builder[stateid].defensive_pitch:get() == "Spin" then
                    data.pitch.type = "Custom"
                    data.pitch.amount = helps.lerp(aa_builder[stateid].defensive_pitch_spin:get(), aa_builder[stateid].defensive_pitch_spin_2:get(), globals.curtime() * aa_builder[stateid].defensive_pitch_spin_speed:get() * 0.1 % 1)
                elseif aa_builder[stateid].defensive_pitch:get() == "Random" then
                    data.pitch.type = "Custom"
                    data.pitch.amount = math.random(aa_builder[stateid].defensive_pitch_random:get(), aa_builder[stateid].defensive_pitch_random_2:get())
                end
        
                if aa_builder[stateid].defensive_yaw:get() == "Custom" then
                    data.yaw.type = "180"
                    data.yaw.degree = aa_builder[stateid].defensive_yaw_custom:get()
                elseif aa_builder[stateid].defensive_yaw:get() == "Jitter" then
                    data.ticks_yaw = data.ticks_yaw + 1.5
                    if data.ticks_yaw > aa_builder[stateid].defensive_yaw_jitter_delay:get() then
                        data.ticks_yaw = 0
                        data.yaw_jitter = not data.yaw_jitter
                    end
                    data.yaw.type = "180"
                    data.yaw.degree = data.yaw_jitter and aa_builder[stateid].defensive_yaw_jitter:get() or aa_builder[stateid].defensive_yaw_jitter_2:get()
                elseif aa_builder[stateid].defensive_yaw:get() == "Spin" then
                    local speed = aa_builder[stateid].defensive_yaw_spin_speed:get()
                    data.yaw.type = "Spin"
                    data.yaw.degree = speed * 6
                elseif aa_builder[stateid].defensive_yaw:get() == "Random" then
                    data.yaw.type = "180"
                    data.yaw.degree = math.random(aa_builder[stateid].defensive_yaw_random:get(), aa_builder[stateid].defensive_yaw_random_2:get())
                end

                data.body_yaw.type = "Static"
                        
                if globals.chokedcommands() == 0 then
                    local should_invert = false
                    
                    if aa_builder[stateid].defensive_yaw:get() == "Jitter" then
                        should_invert = data.yaw_jitter
                    else
                        should_invert = data.is_inverted
                    end
                    
                    data.body_yaw.amount = should_invert and -1 or 1
                end

            end
        end

        cmd.force_defensive = aa_builder[stateid].force_defensive:get()

        data.freestanding = menu.antiaim.other.freestanding.enabled:get() and true and (data.manual_direction == 0) or false
        ui.set(reference.aa.angles.fs[1], data.freestanding)


        if data.freestanding == true then
            ui.set(reference.aa.angles.fs[2], "Always on")
            if menu.antiaim.other.freestanding.freestand_static:get() then
                data.is_inverted = false
                data.yaw.type = "180"
                data.yaw.degree = 0
                data.pitch.type = "Down"
                data.yaw.jitter.type = "Off"
                data.body_yaw.type = "Static"
                data.body_yaw.amount = 0
            end
        else
            ui.set(reference.aa.angles.fs[2], "On hotkey")
        end

        builder.gamesense_add()

        builder.safe_head(cmd)

        builder.avoid_backstab(cmd)

        builder.fast_ladder(cmd)

        builder.manual()

        builder.static_fakelag(cmd, aa_builder[stateid].static_fakelag:get())

        ui.set(reference.aa.angles.pitch[1], data.pitch.type)
        ui.set(reference.aa.angles.pitch[2], data.pitch.amount)
        ui.set(reference.aa.angles.yaw[1], data.yaw.type)
        ui.set(reference.aa.angles.yaw[2], helps.normalize_yaw(data.yaw.degree))
        ui.set(reference.aa.angles.base, data.yaw.base)
        ui.set(reference.aa.angles.jitter[1], data.yaw.jitter.type)
        ui.set(reference.aa.angles.jitter[2], data.yaw.jitter.amount)
        ui.set(reference.aa.angles.body[1], data.body_yaw.type)
        ui.set(reference.aa.angles.body[2], data.body_yaw.amount)
    end
end

--------------------------------------------------------------------------
--                               NOTIFICATIONS                          --
--------------------------------------------------------------------------


local notifications = { } do
    local max_notifs = 6
    local data = {}
    
    -- Add SVG icon texture
    local icon_svg = [[
        <svg width="12" height="12" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path fill-rule="evenodd" clip-rule="evenodd" d="M8.06427 0.00148313C7.83263 -0.0175697 7.69686 0.153241 7.69686 0.153241C7.69686 0.153241 5.7401 2.66125 5.99557 6.60696C6.14192 8.86736 7.05787 10.4648 7.05787 10.4648L9.69767 15.7883C9.69767 15.7883 9.7319 15.8643 9.82946 15.9241C9.95326 16 10.0172 16 10.0172 16L15.6202 15.992C15.6202 15.992 15.824 15.9601 15.9397 15.7684C16.0603 15.5687 15.9837 15.365 15.9837 15.365L8.40772 0.221133C8.40772 0.221133 8.2959 0.020536 8.06427 0.00148313ZM3.99469 7.4536L0.01303 15.4289C0.01303 15.4289 -0.0428803 15.5727 0.0769296 15.7843C0.194479 15.992 0.404406 15.996 0.404406 15.996H5.96355C5.96355 15.996 6.07556 15.9891 6.13927 15.9601C6.21775 15.9242 6.30701 15.8163 6.30701 15.8163C6.30701 15.8163 7.38734 14.2308 6.65445 10.968C6.13596 8.65968 4.62169 7.27389 4.62169 7.27389C4.62169 7.27389 4.45795 7.16727 4.25827 7.22996C4.09453 7.28136 3.99469 7.4536 3.99469 7.4536Z" fill="white"/>
        </svg>
    ]]
    local icon_texture = renderer.load_svg(icon_svg, 12, 12)

    local rec = function(x, y, w, h, radius, color)
        radius = math.min(x/2, y/2, radius)
        local r, g, b, a = unpack(color)
        renderer.rectangle(x, y + radius, w, h - radius*2, r, g, b, a)
        renderer.rectangle(x + radius, y, w - radius*2, radius, r, g, b, a)
        renderer.rectangle(x + radius, y + h - radius, w - radius*2, radius, r, g, b, a)
        renderer.circle(x + radius, y + radius, r, g, b, a, radius, 180, 0.25)
        renderer.circle(x - radius + w, y + radius, r, g, b, a, radius, 90, 0.25)
        renderer.circle(x - radius + w, y - radius + h, r, g, b, a, radius, 0, 0.25)
        renderer.circle(x + radius, y - radius + h, r, g, b, a, radius, -90, 0.25)
    end

    local rec_outline = function(x, y, w, h, radius, thickness, color)
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
    end

    local glow_module = function(x, y, w, h, width, rounding, accent, accent_inner)
        local thickness = 1
        local Offset = 1
        local r, g, b, a = unpack(accent)
        if accent_inner then
            rec(x, y, w, h + 1, rounding, accent_inner)
        end
        for k = 0, width do
            if a * (k/width)^(1) > 5 then
                local accent = {r, g, b, a * (k/width)^(2)}
                rec_outline(x + (k - width - Offset)*thickness, y + (k - width - Offset) * thickness, w - (k - width - Offset)*thickness*2, h + 1 - (k - width - Offset)*thickness*2, rounding + thickness * (width - k + Offset), thickness, accent)
            end
        end
    end

    local split = function(inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
    end

    local RGBAtoHEX = function(redArg, greenArg, blueArg, alphaArg)
        return string.format('%.2x%.2x%.2x%.2x', redArg, greenArg, blueArg, alphaArg)
    end

    local clamp = function(x, min, max)
        return x < min and min or x > max and max or x
    end

    local easeInOut = function(t)
        return (t > 0.5) and 4*((t-1)^3)+1 or 4*t^3;
    end

    local color_text = function(string, r, g, b, a)
        local accent = "\a" .. RGBAtoHEX(r, g, b, a)
        local white = "\a" .. RGBAtoHEX(255, 255, 255, a)
    
        local str = ""
        for i, s in ipairs(split(string, "$")) do
            str = str .. (i % 2 ==( string:sub(1, 1) == "$" and 0 or 1) and white or accent) .. s
        end
    
        return str
    end

    notifications.new = function(string, r, g, b)
        -- Добавляем новое уведомление с временем создания
        local current_time = globals.curtime()
        table.insert(data, {
            time = current_time,
            create_time = current_time, -- Время создания
            end_time = current_time + 3.5, -- 3.5 секунды жизни (0.25 появление + 3.0 видимость + 0.25 исчезновение)
            string = string,
            color = {r, g, b, 255},
            fraction = 0,
            use_icon = true
        })
        
        -- Удаляем устаревшие уведомления (те, у которых end_time прошло)
        for i = #data, 1, -1 do
            if data[i].end_time < current_time then
                table.remove(data, i)
            end
        end
        
        -- Если все еще превысили максимальное количество - удаляем самые старые
        while #data > max_notifs do
            -- Ищем самое старое уведомление
            local oldest_index = 1
            local oldest_time = data[1].create_time
            
            for i = 2, #data do
                if data[i].create_time < oldest_time then
                    oldest_time = data[i].create_time
                    oldest_index = i
                end
            end
            
            -- Удаляем самое старое
            table.remove(data, oldest_index)
        end
    end
    
    notifications.render = function()
        local x, y = client.screen_size()
        local current_time = globals.curtime()
        local Offset = 0
        
        -- Параметры времени
        local fade_in_time = .25        -- 0.25 сек на появление
        local fade_out_time = .25       -- 0.25 сек на исчезновение
        
        -- Временная копия для безопасного рендера
        local temp_data = {}
        
        for i = 1, #data do
            local notif = data[i]
            
            -- Рассчитываем прогресс анимации
            local time_passed = current_time - notif.create_time
            local time_remaining = notif.end_time - current_time
            
            -- Определяем состояние анимации
            if time_passed < fade_in_time then
                -- Анимация появления
                notif.fraction = time_passed / fade_in_time
            elseif time_remaining < fade_out_time then
                -- Анимация исчезновения
                notif.fraction = time_remaining / fade_out_time
            else
                -- Полная видимость
                notif.fraction = 1
            end
            
            -- Копируем только актуальные уведомления (те, которые еще не истекли)
            if current_time < notif.end_time then
                table.insert(temp_data, notif)
                
                -- Рендерим только если видимо
                if notif.fraction > 0 then
                    local fraction = easeInOut(notif.fraction)
                    local r, g, b, a = unpack(notif.color)
                    local string = color_text(notif.string, r, g, b, a * fraction)
    
                    -- Измеряем размер текста
                    local strw, strh = renderer.measure_text("", string)
                    local strw2 = renderer.measure_text("b", "")
    
                    -- Настройки размеров и отступов
                    local padding = 10
                    local icon_size = 12
                    local icon_padding = 5
                    local offsetY = 100
    
                    -- Вычисляем размеры
                    local text_height = strh
                    local content_height = math.max(text_height, icon_size)
                    local total_height = content_height + padding * 2
                    
                    local icon_area_width = notif.use_icon and (icon_size + icon_padding) or 0
                    local text_width = strw + strw2
                    local total_width = text_width + padding * 2 + icon_area_width
                    
                    -- Позиционирование
                    Offset = Offset + (total_height + math.sqrt(20/10)*10 + 5) * fraction
                    
                    local bg_x = x/2 - total_width/2
                    local bg_y = y - offsetY - total_height/2 - Offset
                    
                    -- Рендерим фон
                    glow_module(bg_x, bg_y, total_width, total_height, 
                              10, 10, 
                              {r, g, b, 45 * fraction}, {10,10,10,100 * fraction})
                    
                    -- Рендерим иконку
                    if notif.use_icon and icon_texture then
                        local icon_x = bg_x + padding
                        local icon_y = bg_y + (total_height - icon_size)/2
                        
                        renderer.texture(icon_texture, icon_x, icon_y, 
                                       icon_size, icon_size, 
                                       r, g, b, 255 * fraction)
                    end
                    
                    -- Рендерим текст
                    local text_x = bg_x + padding + icon_area_width + text_width/2
                    local text_y = y - offsetY - Offset
                    
                    renderer.text(text_x, text_y, 
                                 255, 255, 255, 255 * fraction, 
                                 "c", 0, string)
                end
            end
        end
        
        -- Обновляем основной массив (удаляем истекшие уведомления)
        data = temp_data
    end


    notifications.clear = function()
        data = {}
    end
end

--------------------------------------------------------------------------
--                            RAGEBOT TWEAKS                            --
--------------------------------------------------------------------------

local ragebot = { } do

    aim_logs = {}
    hitgroup_names = {'Generic', 'Head', 'Chest', 'Stomach', 'Left arm', 'Right arm', 'Left leg', 'Right leg', 'Neck', '?', 'Gear'}
    player_hp_on_fire = 100

    hit_data = {
        hitchance = 0,
        backtrack = 0,
        predicted_damage = 0,
        predicted_hitgroup = 0
    }

    hit_types = {
        knife = 'Knifed',
        inferno = 'Burned',
        hegrenade = 'Naded'
    }

    ragebot.aim_fire = function(e)
        player_hp_on_fire = entity.get_prop(e.target,"m_iHealth")
        hit_data.hitchance = math.floor(e.hit_chance)
        hit_data.backtrack = globals.tickcount() - e.tick
        hit_data.predicted_damage = e.damage
        hit_data.predicted_hitgroup = e.hitgroup
    end

    ragebot.aim_hit = function(e)
        if menu.misc.ragebot.aimbot_logs.enabled:get() then
            local hitbox_str = ''
            local damage_str = ''
        
            if e.hitgroup == hit_data.predicted_hitgroup then
                hitbox_str = hitgroup_names[e.hitgroup +  1]
            else
                hitbox_str = string.format("%s [%s]", hitgroup_names[e.hitgroup +  1], hitgroup_names[hit_data.predicted_hitgroup +  1])
            end
        
            if e.damage == hit_data.predicted_damage then
                damage_str = e.damage
            else
                damage_str = string.format("%s [%s]", e.damage, hit_data.predicted_damage)
            end

            hit = {menu.misc.ragebot.aimbot_logs.color_hit.color:get()}
            r, g, b = hit[1], hit[2], hit[3]

            if menu.misc.ragebot.aimbot_logs.input:get('Console') then
                
                helps.print_hit(r, g, b,
                    entity.get_player_name(e.target), 
                    hitbox_str,
                    damage_str,
                    entity.get_prop(e.target, 'm_iHealth'),
                    globals.tickcount() - e.tick,
                    math.floor(e.hit_chance)
                )
            end

            if menu.misc.ragebot.aimbot_logs.input:get('Screen') then
                notifications.new(string.format("Hit %s in $%s$ for $%d$ damage [HP: $%d$, BT: $%d$, HC: $%d$]", entity.get_player_name(e.target), hitgroup_names[e.hitgroup +  1], e.damage, entity.get_prop(e.target, 'm_iHealth'), globals.tickcount() - e.tick, math.floor(e.hit_chance)), r, g, b)
            end

        end
    end

    ragebot.aim_miss = function(e)
        if menu.misc.ragebot.aimbot_logs.enabled:get() then
            miss = {
                spread = {menu.misc.ragebot.aimbot_logs.color_spread.color:get()},
                ['?'] = {menu.misc.ragebot.aimbot_logs.color_correction.color:get()},
                death = {menu.misc.ragebot.aimbot_logs.color_death.color:get()},
                ['prediction error'] = {menu.misc.ragebot.aimbot_logs.color_pred.color:get()},
                ['unregistered shot'] = {menu.misc.ragebot.aimbot_logs.color_unreg.color:get()}
            }

            r, g, b = miss[e.reason][1], miss[e.reason][2], miss[e.reason][3]
            if menu.misc.ragebot.aimbot_logs.input:get('Console') then
                helps.print_miss(r, g, b,
                    e.reason,
                    hitgroup_names[e.hitgroup +  1],
                    entity.get_player_name(e.target), 
                    globals.tickcount() - e.tick,
                    math.floor(e.hit_chance)
                )
            end

            if menu.misc.ragebot.aimbot_logs.input:get('Screen') then
                notifications.new(string.format("Missed %s in $%s$ due to $%s$ [BT: $%d$, HC: $%d$]", entity.get_player_name(e.target), hitgroup_names[e.hitgroup +  1], e.reason, globals.tickcount() - e.tick, math.floor(e.hit_chance)), r, g, b)
            end
        end
    end

    ragebot.player_hurt = function(e)
        if menu.misc.ragebot.aimbot_logs.enabled:get() then
            local hit_type, left_hp, damage_hp

            local local_player = entity.get_local_player()
            local attacker = client.userid_to_entindex(e.attacker)
            local user_id = client.userid_to_entindex(e.userid)
        
            if not entity.get_local_player() then
                return
            end
        
            if attacker ~= local_player then
                return
            end
        
            if user_id == local_player then
                return
            end
        
            if e.health == 0 then
                hit_type = 'Killed'
                left_hp = 0
            else
                hit_type = hit_types[e.weapon]
                left_hp = e.health
            end
        
            damage_hp = e.dmg_health
        
            if not hit_type or hit_type == 'Killed' then
                return
            end

            hit = {menu.misc.ragebot.aimbot_logs.color_hit.color:get()}
            
            r, g, b = hit[1], hit[2], hit[3]

            if menu.misc.ragebot.aimbot_logs.input:get('Console') then
                helps.print_hurt(r, g, b,
                    hit_type,
                    entity.get_player_name(user_id), 
                    damage_hp,
                    left_hp
                )
            end

            if menu.misc.ragebot.aimbot_logs.input:get('Screen') then
                notifications.new(string.format("%s %s for $%s$ damage", hit_type, entity.get_player_name(user_id), damage_hp), r, g, b)
            end
            

        end
    end

    ragebot.setup_command = function()
        
        if menu.misc.ragebot.doubletap_improve.enabled:get() then
            if (not ui.get(reference.rage.aimbot.dt[2]) or not ui.get(reference.rage.aimbot.dt[1])) and (not ui.get(reference.aa.other.hs[2]) or not ui.get(reference.aa.other.hs[1])) then
                ui.set(reference.rage.aimbot.enabled, true)
        
                if callback_reg then
                    client.unset_event_callback('run_command', helps.check_charge)
                    callback_reg = false
                end
                return
            end
        
            local_player = entity.get_local_player()
        
            if not callback_reg then
                client.set_event_callback('run_command', helps.check_charge)
                callback_reg = true
            end
        
            local threat = client.current_threat()
        
            if not dt_charged
            and threat
            and bit.band(entity.get_prop(local_player, 'm_fFlags'), 1) == 0
            and bit.band(entity.get_esp_data(threat).flags, bit.lshift(1, 11)) == 2048 then
                ui.set(reference.rage.aimbot.enabled, false)
            else
                ui.set(reference.rage.aimbot.enabled, true)
            end
        end

        if menu.misc.ragebot.on_shot_fix.enabled:get() then
            ui.set(reference.aa.fakelag.enabled[1], not menu.antiaim.helpers.other.on_shot_aa.hotkey:get())
        end
    end
end

--------------------------------------------------------------------------
--                               VISUALS                                --
--------------------------------------------------------------------------

local visuals = { } do
    screen_x, screen_y = client.screen_size()
    screen_size = client.screen_size()
    screen_center =  screen_size * 0.5
    watermark_lerp = {enabled = 0}
    text_anim = {0, 0, 0, 0, 0, 0, 0, 0}
    add_y = {0,0}
    space = 25

    -- bullet tracer
    impacts = {}
    last_impact_time = 0
    
    -- hitrate
    hitrate = {
        total_shots = 0,
        hits = 0,
        color = {
            default = {200, 200, 200, 255},
            bad = {194, 50, 21, 255},
            half = {194, 139, 21, 255},
            good = {143, 194, 21, 255}
        }
    }


    arrow_left = renderer.load_svg([[
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M15 18L9 12L15 6" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
    ]], 24, 24)
    
    -- SVG стрелка вправо
    arrow_right = renderer.load_svg([[
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M9 6L15 12L9 18" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
    ]], 24, 24)
    
    -- SVG стрелка вверх
    arrow_up = renderer.load_svg([[
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M18 15L12 9L6 15" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg>
    ]], 24, 24)
    

    -- console modulation
    UPDATE_COOLDOWN = 0
    MAX_RETRIES = 3
    last_update = 0
    last_color = {255, 255, 255, 255}
    error_count = 0
    cache_valid = false

    material_cache = {}
    materials_to_change = {
        'vgui_white',
        'vgui/hud/800corner1', 
        'vgui/hud/800corner2', 
        'vgui/hud/800corner3', 
        'vgui/hud/800corner4'
    }

    current_damage = 0
    text_alpha = 0
    transition_speed = 10
    WEAPON_IN_HANDLE = {
        ["CWeaponGlock"] = true, ["CWeaponHKP2000"] = true, ["CWeaponUSP"] = true,
        ["CWeaponP250"] = true, ["CWeaponFiveSeven"] = true, ["CWeaponTec9"] = true,
        ["CWeaponElite"] = true, ["CWeaponCZ75A"] = true, ["CDEagle"] = true,
        ["CWeaponMP9"] = true, ["CWeaponMP7"] = true, ["CWeaponMP5Navy"] = true,
        ["CWeaponUMP45"] = true, ["CWeaponP90"] = true, ["CWeaponBizon"] = true,
        ["CWeaponMac10"] = true, ["CWeaponAK47"] = true, ["CWeaponM4A1"] = true,
        ["CWeaponM4A1_Silencer"] = true, ["CWeaponGalilAR"] = true, ["CWeaponFamas"] = true,
        ["CWeaponSSG08"] = true, ["CWeaponAUG"] = true, ["CWeaponSG556"] = true,
        ["CWeaponAWP"] = true, ["CWeaponG3SG1"] = true, ["CWeaponSCAR20"] = true,
        ["CWeaponNova"] = true, ["CWeaponXM1014"] = true, ["CWeaponSawedoff"] = true,
        ["CWeaponMag7"] = true, ["CWeaponM249"] = true, ["CWeaponNegev"] = true,
        ["CWeaponTaser"] = true
    }

    visuals.damage_data = {}

    get_eye_position = function(player)
        if not entity.is_alive(player) then return nil end
        
        local origin = {entity.get_prop(player, "m_vecOrigin")}
        local view_offset = {entity.get_prop(player, "m_vecViewOffset")}
        
        return {
            origin[1] + view_offset[1],
            origin[2] + view_offset[2],
            origin[3] + view_offset[3]
        }
    end

    safe_world_to_screen = function(x, y, z)
        if not x or not y or not z then return nil, nil end
        local sx, sy = renderer.world_to_screen(x, y, z)
        return sx or nil, sy or nil
    end

    build_material_cache = function()
        material_cache = {}
        
        if first_material == nil or next_material == nil or invalid_material == nil or find_material == nil then
            return false
        end

        local i = first_material(matsys)
        while i ~= invalid_material(matsys) do
            local mat_ptr = find_material(matsys, i)
            if mat_ptr ~= nil then
                local mat = libs.ffi.cast("void***", mat_ptr)
                local get_name = get_vfunc(mat, 0, 'const char*(__thiscall*)(void*)')
                
                if get_name ~= nil then
                    local name = libs.ffi.string(get_name(mat))
                    for _, material in ipairs(materials_to_change) do
                        if name == material then
                            material_cache[material] = {
                                ptr = mat,
                                alpha_mod = get_vfunc(mat, 27, "void(__thiscall*)(void*, float)"),
                                color_mod = get_vfunc(mat, 28, "void(__thiscall*)(void*, float, float, float)")
                            }
                            break
                        end
                    end
                end
            end
            i = next_material(matsys, i)
        end
        
        cache_valid = true
        return true
    end

    update_cached_materials = function(color)
        if not cache_valid then
            if not build_material_cache() then
                return false
            end
        end

        for name, mat_data in pairs(material_cache) do
            if mat_data.alpha_mod ~= nil then
                mat_data.alpha_mod(mat_data.ptr, color[4] / 255)
            end
            if mat_data.color_mod ~= nil then
                mat_data.color_mod(mat_data.ptr, color[1] / 255, color[2] / 255, color[3] / 255)
            end
        end
        
        return true
    end

    get_interface = function(dll, name)
        local ptr = client.create_interface(dll, name)
        if ptr == nil then
            error("Не удалось получить интерфейс "..name.." из "..dll)
        end
        return libs.ffi.cast("void***", ptr)
    end

    get_vfunc = function(interface, index, signature)
        if interface == nil or interface[0] == nil then return nil end
        return libs.ffi.cast(signature, interface[0][index])
    end

    matsys = get_interface("materialsystem.dll", "VMaterialSystem080")
    engine = get_interface("engine.dll", "VEngineClient014")
    first_material = get_vfunc(matsys, 86, "int(__thiscall*)(void*)")
    next_material = get_vfunc(matsys, 87, "int(__thiscall*)(void*, int)")
    invalid_material = get_vfunc(matsys, 88, "int(__thiscall*)(void*)")
    find_material = get_vfunc(matsys, 89, "void*(__thiscall*)(void*, int)")
    is_console_visible = get_vfunc(engine, 11, "bool(__thiscall*)(void*)")

    visuals.add_tracer = function(e)

        if menu.misc.visuals.bullet_tracer.enabled:get() then
    
            local local_player = entity.get_local_player()
            if not local_player then return end
            
            -- Correct player identification
            local shooter = client.userid_to_entindex(e.userid)
            if shooter ~= local_player then return end
            
            -- Double impact protection
            local current_time = globals.curtime()
            if current_time - last_impact_time < 0.05 then return end
            last_impact_time = current_time
            
            local eye_pos = get_eye_position(local_player)
            if not eye_pos then return end
            
            table.insert(impacts, {
                start_pos = eye_pos,
                end_pos = {e.x, e.y, e.z},
                color = {menu.misc.visuals.bullet_tracer.enabled.color:get()},
                start_time = current_time,
                end_time = current_time + (menu.misc.visuals.bullet_tracer.duration:get() / 1000),
                width = menu.misc.visuals.bullet_tracer.width:get()
            })
        end
    end

    draw_tracer = function(impact)
        local x1, y1 = safe_world_to_screen(impact.start_pos[1], impact.start_pos[2], impact.start_pos[3])
        local x2, y2 = safe_world_to_screen(impact.end_pos[1], impact.end_pos[2], impact.end_pos[3])
        
        if not x1 or not x2 then return false end
        
        local progress = (globals.curtime() - impact.start_time) / (impact.end_time - impact.start_time)
        if progress >= 1 then return false end
        
        local alpha = impact.color[4] * (1 - progress)
        
        -- Main line
        renderer.line(x1, y1, x2, y2, impact.color[1], impact.color[2], impact.color[3], alpha)
        
        -- Side lines for width effect
        for i = 1, impact.width do
            local offset = (i - impact.width/2) * 0.5
            renderer.line(
                x1 + offset, y1 + offset,
                x2 + offset, y2 + offset,
                impact.color[1], impact.color[2], impact.color[3], alpha * 0.6
            )
        end
        
        return true
    end

    visuals.healthshot = function(cmd)
        if menu.misc.visuals.healthshot.enabled:get() then
            local local_player = entity.get_local_player()
            local victim = client.userid_to_entindex(cmd.userid)
            local attacker = client.userid_to_entindex(cmd.attacker)
            if attacker == local_player and entity.is_enemy(victim) then
                entity.set_prop(local_player, "m_flHealthShotBoostExpirationTime", globals.curtime() + 1)
            end
        end
    end

    visuals.player_hurt = function(cmd)
        if menu.misc.visuals.enemy_dmg_print.enabled:get() then
            local attacker = client.userid_to_entindex(cmd.attacker)
            if attacker ~= entity.get_local_player() then return end

            local victim = client.userid_to_entindex(cmd.userid)
            if not entity.is_alive(victim) then return end

            local pos = { entity.hitbox_position(victim, 0) }
            if not pos[1] then return end

            local dir_x = math.random(-25, 25)
            local dir_y = math.random(-15, 15)

            table.insert(visuals.damage_data, {
                x = pos[1],
                y = pos[2],
                z = pos[3] + 10,
                dx = dir_x,
                dy = dir_y,
                damage = cmd.dmg_health,
                fatal = cmd.health == 0,
                time = globals.curtime(),
                expire = globals.curtime() + 2
            })
        end
    end
    
    visuals.render = function()

        if menu.misc.visuals.bullet_tracer.enabled:get() then
    
            for i = #impacts, 1, -1 do
                if not draw_tracer(impacts[i]) then
                    table.remove(impacts, i)
                end
            end
        
        end

        if menu.misc.visuals.console_modulation.enabled:get() and is_console_visible(engine) then
            local color = {menu.misc.visuals.console_modulation.enabled.color:get()}
            local current_time = globals.realtime()
            
            -- Проверяем необходимость обновления
            local color_changed = color[1] ~= last_color[1] or color[2] ~= last_color[2] or
                                color[3] ~= last_color[3] or color[4] ~= last_color[4]
            
            local console_or_menu = ui.is_menu_open() or (is_console_visible ~= nil and is_console_visible(engine))
            
            if (color_changed or console_or_menu) and (current_time - last_update) > UPDATE_COOLDOWN then
                local success, err = pcall(update_cached_materials, color)
                
                if success then
                    last_color = color
                    last_update = current_time
                    error_count = 0
                else
                    error_count = error_count + 1
                    -- client.log("Ошибка обновления материалов ("..error_count.."): "..tostring(err))
                    
                    -- При нескольких ошибках сбрасываем кэш
                    if error_count >= MAX_RETRIES then
                        cache_valid = false
                        error_count = 0
                        -- client.log("Сбрасываем кэш материалов")
                    end
                end
            end
        else
            if last_color[1] ~= 255 and last_color[2] ~= 255 and last_color[3] ~= 255 and last_color[4] ~= 255 then
                pcall(update_cached_materials, {255, 255, 255, 255})
            end
        end


        if menu.misc.visuals.dmg_indicator.enabled:get() and not helps.is_scoreboard_open() then
            local localplayer = entity.get_local_player()
            if localplayer or entity.is_alive(localplayer) then

                local weapon_entindex = entity.get_player_weapon(localplayer)
                local weapon_classname = entity.get_classname(weapon_entindex)
                local weapon_name = WEAPON_IN_HANDLE[weapon_classname]
                

                local r, g, b, a = unpack({menu.misc.visuals.dmg_indicator.enabled.color:get()})
                local target_dmg

                if ui.get(reference.rage.aimbot.min_dmg[2]) then
                    target_dmg = ui.get(reference.rage.aimbot.min_dmg[3])
                    text_alpha = helps.lerp(text_alpha, weapon_name and a or 0, globals.frametime() * transition_speed)
                else
                    target_dmg = ui.get(reference.rage.aimbot.dmg)
                    text_alpha = helps.lerp(text_alpha, weapon_name and 100 or 0, globals.frametime() * transition_speed)
                end

                if text_alpha > 0.09 then 
                    current_damage = helps.lerp(current_damage, weapon_name and target_dmg or 0, globals.frametime() * transition_speed)

                    local screen_width, screen_height = client.screen_size()
                    local x = screen_width / 2 + 20
                    local y = screen_height / 2 - 20

                    renderer.text(
                        x,
                        y,
                        r, g, b,
                        math.floor(text_alpha),
                        "с", 0,
                        string.format("%.0f", current_damage)
                    )
                end
            end
        end

        if menu.misc.visuals.enemy_dmg_print.enabled:get() and not helps.is_scoreboard_open() then
            local now = globals.curtime()

            for i = #visuals.damage_data, 1, -1 do
                local data = visuals.damage_data[i]
                local elapsed = now - data.time
                local duration = data.expire - data.time

                if now > data.expire then
                    table.remove(visuals.damage_data, i)
                else
                    local progress = elapsed / duration
                    local alpha = math.floor(200 * (1 - progress))
                    local lift = 50 * progress

                    local sx, sy = renderer.world_to_screen(
                        data.x + data.dx * progress,
                        data.y + data.dy * progress,
                        data.z + lift
                    )

                    if sx and sy then
                        local r, g, b = data.fatal and 255 or 255, data.fatal and 0 or 255, data.fatal and 0 or 255
                        renderer.text(sx, sy, r, g, b, alpha, "+", 0, tostring(data.damage))
                    end
                end
            end
        end

        if menu.misc.visuals.screen_indicators.enabled:get() and not helps.is_scoreboard_open() then
            local lp = entity.get_local_player()
            if lp == nil or not entity.is_alive(lp) then return end

            local clr_r, clr_g, clr_b = menu.misc.visuals.screen_indicators.color:get()
            local w, h = client.screen_size()
            local scoped = entity.get_prop(entity.get_local_player(), "m_bIsScoped") == 1 and true or false
            
            -- Начальная позиция Y
            local base_y = screen_y / 2 + 25
            local current_offset = 0
            
            -- Отрисовка основного названия
            renderer.text(screen_x / 2 + math.ceil(text_anim[1]) - 1, base_y + current_offset, clr_r, clr_g, clr_b, 255, "c-", 0, helps.gradient_text(globals.curtime() * -2, script_info.name:upper(), clr_r, clr_g, clr_b, 255, 255, 255, 255, 255))
            current_offset = current_offset + 10
            
            local manual_direction = data.manual_direction or 0
            local aa_text = aa_state
            local aa_alpha = 125

            local arrow_size = 24
            local arrow_color = {clr_r, clr_g, clr_b, 255}

            
            if menu.antiaim.other.manuals.enabled:get() and manual_direction ~= 0 then
                if manual_direction == -90 then
                    aa_text = "LEFT"
                    aa_alpha = 255
                    -- Стрелка влево (центр по Y, отступ 30 по X)
                    renderer.texture(arrow_left, screen_x / 2 - 50 - arrow_size/2, screen_y / 2 - arrow_size/2, 
                                   arrow_size, arrow_size, arrow_color[1], arrow_color[2], arrow_color[3], arrow_color[4])
                elseif manual_direction == 90 then
                    aa_text = "RIGHT"
                    aa_alpha = 255
                    -- Стрелка вправо (центр по Y, отступ 30 по X)
                    renderer.texture(arrow_right, screen_x / 2 + 50 - arrow_size/2, screen_y / 2 - arrow_size/2, 
                                   arrow_size, arrow_size, arrow_color[1], arrow_color[2], arrow_color[3], arrow_color[4])
                elseif manual_direction == 180 then
                    aa_text = "FORWARD"
                    aa_alpha = 255
                    -- Стрелка вперед (центр по X, отступ 30 по Y)
                    renderer.texture(arrow_up, screen_x / 2 - arrow_size/2, screen_y / 2 - 50 - arrow_size/2, 
                                   arrow_size, arrow_size, arrow_color[1], arrow_color[2], arrow_color[3], arrow_color[4])
                end
            end
        
            
            renderer.text(screen_x / 2 + math.ceil(text_anim[2]) - 1, base_y + current_offset, 255, 255, 255, aa_alpha, "c-", 0, string.upper(tostring(aa_text)))
            current_offset = current_offset + 10
            
            -- Динамическое управление отступами для остальных индикаторов
            if ui.get(reference.rage.aimbot.dt[1]) and ui.get(reference.rage.aimbot.dt[2]) then 
                renderer.text(screen_x / 2 + math.ceil(text_anim[3]) - 1, base_y + current_offset, 255, libs.anti_aim.get_double_tap() and 255 or 0, libs.anti_aim.get_double_tap() and 255 or 0, libs.anti_aim.get_double_tap() and 255 or 255, "c-", 0, "DT")
                current_offset = current_offset + 10
            end

            if ui.get(reference.aa.other.hs[1]) then
                local offset = (ui.get(reference.rage.aimbot.dt[2]) and 10 or 0)
                renderer.text(screen_x / 2 + math.ceil(text_anim[4]) - 1, base_y + current_offset, 255, 255, 255, ui.get(reference.rage.aimbot.dt[2]) and 125 or 255, "c-", 0, "OSAA")
                current_offset = current_offset + 10
            end

            if ui.get(reference.aa.angles.fs[1]) then
                renderer.text(screen_x / 2 + math.ceil(text_anim[5]) - 1, base_y + current_offset, 255, 255, 255, 255, "c-", 0, "FS")
                current_offset = current_offset + 10
            end

            if ui.get(reference.rage.aimbot.baim) then
                renderer.text(screen_x / 2 + math.ceil(text_anim[6]) - 1, base_y + current_offset, 255, 255, 255, 255, "c-", 0, "BAIM")
                current_offset = current_offset + 10
            end
            
            if ui.get(reference.rage.aimbot.sp) then
                renderer.text(screen_x / 2 + math.ceil(text_anim[7]) - 1, base_y + current_offset, 255, 255, 255, 255, "c-", 0, "SAFE")
                current_offset = current_offset + 10
            end
            
            if ui.get(reference.rage.other.fd) then
                renderer.text(screen_x / 2 + math.ceil(text_anim[8]) - 1, base_y + current_offset, 255, 255, 255, 255, "c-", 0, "FD")
            end
            
            -- Анимация текста
            local text = {script_info.name:upper(), string.upper(tostring(aa_text)), "DT", "OSAA", "FS", "BAIM", "SAFE", "FD"}
            for i = 1, #text do
                local measure = libs.vector(renderer.measure_text("c-", text[i]))
                text_anim[i] = helps.lerp(text_anim[i], scoped and measure.x / 2 + 13 or 0, globals.frametime() * 15)
            end
        end

        if not menu.misc.visuals.screen_indicators.enabled:get() then
            watermark_lerp.enabled = helps.lerp(watermark_lerp.enabled,  1 or 0, helps.frametime()*3) 
            renderer.text(screen_x/2 - renderer.measure_text("b", script_info.name)/2, screen_y - watermark_lerp.enabled*25, 255, 255, 255, watermark_lerp.enabled*255, 'b', 0, script_info.name)
            --renderer.text(screen_x / 2, screen_y - 22, 255, 255, 255, 255, "c", 0, "debug")
        end

        if menu.misc.visuals.awall_crosshair.enabled:get() and not helps.is_scoreboard_open() then
            local local_player = entity.get_local_player()
            local position = -30
            local weapon = entity.get_player_weapon(local_player)
            local r, g, b, a = ui.get(reference.misc.settings.menu_color[1])
        
            local w, h = client.screen_size()
        
            weapon_ignored = {
                'CKnife',
                'CWeaponTaser',
                'CC4',
                'CHEGrenade',
                'CSmokeGrenade',
                'CMolotovGrenade',
                'CSensorGrenade',
                'CFlashbang',
                'CDecoyGrenade',
                'CIncendiaryGrenade'
            }
        
            if weapon == nil or helps.contains(weapon_ignored, entity.get_classname(weapon)) then
                return
            end
        
            local pitch, yaw = client.camera_angles()
            local fwd = helps.angle_forward({ pitch, yaw, 0 })
            local start_pos = { client.eye_position() }
            
            local fraction = client.trace_line(local_player, start_pos[1], start_pos[2], start_pos[3], start_pos[1] + (fwd[1] * 8192), start_pos[2] + (fwd[2] * 8192), start_pos[3] + (fwd[3] * 8192))
        
            if fraction < 1 then
                local end_pos = {
                    start_pos[1] + (fwd[1] * (8192 * fraction + 128)),
                    start_pos[2] + (fwd[2] * (8192 * fraction + 128)),
                    start_pos[3] + (fwd[3] * (8192 * fraction + 128)),
                }
        
                local ent, dmg = client.trace_bullet(local_player, start_pos[1], start_pos[2], start_pos[3], end_pos[1], end_pos[2], end_pos[3])
        
                if ent == nil then
                    ent = -1
                end
        
                if dmg > 0 and not rainbow then
                    renderer.text((w / 2), (h / 2 + position), r, g, b, a, 'cbd', 0, dmg)
                elseif dmg > 0 and rainbow then
                    local r2, g2, b2 = rgb_rainbow(ui.get(speed) / 100, 1)  
                    renderer.text((w / 2), (h / 2 + position), r2, g2, b2, a, 'cbd', 0, dmg)
                end
            end
        end


        if menu.misc.visuals.hitrate.enabled:get() then
            if hitrate.total_shots == 0 then
                renderer.indicator(hitrate.color.default[1], hitrate.color.default[2], hitrate.color.default[3], hitrate.color.default[4], string.format("%s", string.format("%i", hitrate.total_shots ~= 0 and (hitrate.hits / hitrate.total_shots * 100) or 0)) .. '%')
            elseif (hitrate.hits / hitrate.total_shots * 100) < 40 then
                renderer.indicator(hitrate.color.bad[1], hitrate.color.bad[2], hitrate.color.bad[3], hitrate.color.bad[4], string.format("%s", string.format("%i", hitrate.total_shots ~= 0 and (hitrate.hits / hitrate.total_shots * 100) or 0)) .. '%')
            elseif (hitrate.hits / hitrate.total_shots * 100) < 70 then
                renderer.indicator(hitrate.color.half[1], hitrate.color.half[2], hitrate.color.half[3], hitrate.color.half[4], string.format("%s", string.format("%i", hitrate.total_shots ~= 0 and (hitrate.hits / hitrate.total_shots * 100) or 0)) .. '%')
            else
                renderer.indicator(hitrate.color.good[1], hitrate.color.good[2], hitrate.color.good[3], hitrate.color.good[4], string.format("%s", string.format("%i", hitrate.total_shots ~= 0 and (hitrate.hits / hitrate.total_shots * 100) or 0)) .. '%')
            end
        end

        if menu.misc.visuals.custom_scope.enabled:get() and not helps.is_scoreboard_open() then
            ui.set(reference.visual.effects.remove_scope, false)

            local screen_x, screen_y = client.screen_size()
            local lp = entity.get_local_player()
            local scoped = entity.get_prop(lp, "m_bIsScoped") == 1

            local r, g, b, a = menu.misc.visuals.custom_scope.scopeColor:get()
            
            local position = helps.anim_old("lenght", scoped and menu.misc.visuals.custom_scope.scopeLength:get() or 0, 10) 
            local offset = helps.anim_old("gap", scoped and menu.misc.visuals.custom_scope.scopeGap:get()  or 0, 10) 

            if menu.misc.visuals.custom_scope.scopetype:get() == "Inverted" then
                renderer.gradient(screen_x / 2, screen_y / 2 + offset, 1, position, 0, 0, 0, 0, r, g, b, 255, false)
                renderer.gradient(screen_x / 2, screen_y / 2 - offset, 1, -position, 0, 0, 0, 0, r, g, b, 255, false)
    
                renderer.gradient(screen_x / 2 + offset, screen_y / 2, position, 1, 0, 0, 0, 0, r, g, b, 255, true)
                renderer.gradient(screen_x / 2 - offset, screen_y / 2, -position, 1, 0, 0, 0, 0, r, g, b, 255, true)
            else
                renderer.gradient(screen_x / 2, screen_y / 2 + offset, 1, position, r, g, b, 255, 0, 0, 0, 0, false)
                renderer.gradient(screen_x / 2, screen_y / 2 - offset, 1, -position, r, g, b, 255, 0, 0, 0, 0, false)
    
                renderer.gradient(screen_x / 2 + offset, screen_y / 2, position, 1, r, g, b, 255, 0, 0, 0, 0, true)
                renderer.gradient(screen_x / 2 + 1 - offset, screen_y / 2, -position, 1, r, g, b, 255, 0, 0, 0, 0, true)
            end
        end
    end
end


--------------------------------------------------------------------------
--                                MISC                                  --
--------------------------------------------------------------------------

local misc = { } do 
    aspect_ratio_lerp = {smooth = 0}

    leetifyTable = {A = "4", B = "6", C = "<", D = "d", E = "3", F = "f", G = "&", H = "#", I = "!", J = "j", K = "k", L = "1", M = "m", N = "|\\|", O = "0", P = "p", Q = "q", R = "r", S = "5", T = "7", U = "u", V = "\\/", W = "w", X = "x", Y = "y", Z = "z"}
    previousTag = ''
    tagSpeed = 5
    ground_ticks, end_time = 1, 0


    langs = {
        ad = {
            "У тебя все еще нет All In One? - прикупи на дискорд сервере all in one",
            "С All in One такого бы не было",
            "Ебать попрыгунчик, попрыгал в светлое будущее и без All In One",
            "Мне нравятся твои слезы, выпиши мне что я нищий, я куплю твою семью и за одно All In One",
            "discord.gg / allinone - GODMODE",
            "Увы, мне нечего сказать, ты просто без All In One",
            "Почему в 2к25 без All In One?",
            "Написал это, пока покупал All In One",
            "Теперь ты на медии DS сервера All In One",
            "Заведи ютуб, стань популярным, а то опускаю нн'а без All In One",
            "Умные мысли преследуют тебя, но оказывается ты мог купить All In One",
            "Пришло время учить алфавит, выпала буква к - купи All In One",
            "ты нихуя не ледженд, потому что без лучшего lua scripts All In One",
            "OWNED BY ALL IN ONE",
            "12$ FOR GODMODE - ALL IN ONE",
            "Без All In One ты как пешеход на трассе – рано или поздно переедут.",
            "Ты бы мог быть легендой, но All In One не купил – теперь ты просто мем.",
            "discord.gg / allinone – там, где заканчивается твое терпение и начинается GODMODE.",
            "Тыыыыы, а че без All In One? В 2025 так жить нельзя!",
            "Купи All In One или будешь вечно в тильте, как новичок.",
            "Твоя игра – это pain, а мог бы быть All In One.",
            "12$ за власть над лобби? All In One – легкий выбор.",
            "Ты не проиграл, ты просто не купил All In One.",
            "Без All In One ты как Wi-Fi без роутера – сигнал есть, но толку ноль.",
            "All In One – единственный скрипт, который не бросит тебя, в отличие от тиммейтов.",
            "Ты думал, что хорош? Без All In One ты просто фон.",
            "Купи All In One или оставайся в 2012, как твой скилл.",
            "Ты не нищий, ты просто пока не оформил подписку на All In One.",
            "discord.gg / allinone – место, где заканчиваются твои отмазки.",
            "All In One – потому что играть на харде уже не модно."
        },
        ru = {},
        eng = {},
        facts = {}

    }

    -- edge stop
    max_distance = 70
    step_distance = 2
    safe_step_height = 40
    drop_depth = 40
    outer_distance = 80
    coyote_allowance = 20
    blocked_directions = {}


    check_direction_dual = function(player, yaw, offset)
        local ox, oy, oz = entity.get_prop(player, "m_vecOrigin")
        local rad = math.rad(yaw + offset)
        local dx, dy = math.cos(rad), math.sin(rad)

        local safe_dist = 0
        local edge_point = nil
        local outer_safe = false

        for dist = step_distance, max_distance, step_distance do
            local fx = ox + dx * dist
            local fy = oy + dy * dist
            local fz = oz + 5

            local frac_down = select(1, client.trace_line(player, fx, fy, fz, fx, fy, fz - drop_depth))

            if frac_down == 1.0 or (frac_down * drop_depth) > safe_step_height then
                edge_point = {fx, fy, fz}
                break
            end

            safe_dist = dist
        end

        local ox2 = ox + dx * outer_distance
        local oy2 = oy + dy * outer_distance
        local oz2 = oz + 5
        local frac_outer = select(1, client.trace_line(player, ox2, oy2, oz2, ox2, oy2, oz2 - drop_depth))
        outer_safe = not (frac_outer == 1.0 or (frac_outer * drop_depth) > safe_step_height)

        return safe_dist, edge_point, outer_safe
    end



    misc.edge_stop = function(cmd)
        if not menu.misc.features.edge_stop.enabled:get() then return end
        if not menu.misc.features.edge_stop.enabled.hotkey:get(true) then return end
        
        local lp = entity.get_local_player()
        if not lp or not entity.is_alive(lp) then return end
        local flags = entity.get_prop(lp, "m_fFlags") or 0
        if bit.band(flags, 1) == 0 then return end

        local _, yaw = client.camera_angles()
        if not yaw then return end
    
        blocked_directions = { forward = 0, back = 0, left = 0, right = 0 }
    
        local dirs = { forward = 0, back = 180, left = 90, right = -90 }
        
        for name, ang in pairs(dirs) do
            local safe_dist, _, outer_safe = check_direction_dual(lp, yaw, ang)
            if safe_dist < max_distance then
                if outer_safe then
                    blocked_directions[name] = safe_dist + coyote_allowance
                else
                    blocked_directions[name] = safe_dist
                end
            else
                blocked_directions[name] = nil
            end
        end
    
        if cmd.forwardmove ~= 0 then
            local sign = cmd.forwardmove > 0 and 1 or -1
            local key = sign == 1 and "forward" or "back"
            local safe = blocked_directions[key]
            if safe and safe < max_distance then
                cmd.forwardmove = cmd.forwardmove * (safe / max_distance)
            end
        end
        if cmd.sidemove ~= 0 then
            local sign = cmd.sidemove > 0 and 1 or -1
            local key = sign == 1 and "right" or "left"
            local safe = blocked_directions[key]
            if safe and safe < max_distance then
                cmd.sidemove = cmd.sidemove * (safe / max_distance)
            end
        end
    end
    

    anim_in_air = function()
        local lp = entity.get_local_player()
        if not lp then return end
        local flags = entity.get_prop(lp, "m_fFlags")
        ground_ticks = bit.band(flags, 1) == 1 and ground_ticks + 1 or 0
        
        return ground_ticks > 20 and ground_ticks < 150
    end


    libs.ffi.cdef[[
        typedef void*(__thiscall* get_client_entity_t)(void*, int);
        typedef struct {
            char  pad_0000[20];
            int m_nOrder; //0x0014
            int m_nSequence; //0x0018
            float m_flPrevCycle; //0x001C
            float m_flWeight; //0x0020
            float m_flWeightDeltaRate; //0x0024
            float m_flPlaybackRate; //0x0028
            float m_flCycle; //0x002C
            void *m_pOwner; //0x0030
            char  pad_0038[4]; //0x0034
        } animstate_layer_t;
    ]]
    
    uintptr_t = libs.ffi.typeof("uintptr_t**")
    get_entity_address = vtable_bind("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)")
    animslsg = nil


    misc.render = function()
        local lp = entity.get_local_player()
        if lp == nil then return end

        if menu.misc.features.aspect_ratio.enabled:get() then 
            aspect_ratio_lerp.smooth = helps.lerp(aspect_ratio_lerp.smooth, menu.misc.features.aspect_ratio.ratio:get() or 177, helps.frametime())
            client.set_cvar("r_aspectratio", menu.misc.features.aspect_ratio.ratio:get() > 0.40 and (aspect_ratio_lerp.smooth)/100 or 0) 
        else
            client.set_cvar("r_aspectratio", 0)
        end

        -- NEED FIX
        if menu.misc.features.thirdperson.enabled:get() then
            cvar.cam_idealdist:set_int(menu.misc.features.thirdperson.distance:get())
        end

        if menu.misc.features.edge_stop.enabled:get() and menu.misc.features.edge_stop.enabled.hotkey:get(true) then
            renderer.indicator(255, 255, 255, 200, "EDGE STOP")
        end
    end

    misc.run_command = function(cmd)
        if menu.misc.features.auto_delay.enabled:get() then
    
            local dw = menu.misc.features.auto_delay.weapon:get()
            
    
            if #dw > 0 then
                for i = 1, #dw do
                    if dw[i] == ui.get(reference.rage.weapon_type) then
                        if menu.misc.features.auto_delay.disable_on_crouch:get() and (aa_state == "Crouching" or aa_state == "Sneaking") then
                            ui.set(reference.rage.other.delay, false)
                        else
                            return ui.set(reference.rage.other.delay, true)
                        end
                    else 
                        ui.set(reference.rage.other.delay, false)
                    end
                end
            end
        end

        if menu.misc.features.baim_and_safe.enabled:get() then
            local lp = entity.get_local_player()
            local weapon = entity.get_player_weapon(lp)
            local force_teammates = false or ui.get(reference.visual.esp.mates)
            local players = entity.get_players(not false or ui.get())

            if weapon == nil then return end

            for i=1, #players do

                local target_health = entity.get_prop(players[i], "m_iHealth")  

                if target_health <= 0 then return end
                if target_health <= menu.misc.features.baim_and_safe.value_baim:get() then
                    plist.set(players[i], "Override prefer body aim", "Force")
                    if menu.misc.features.baim_and_safe.priority:get() then
                        plist.set(players[i], "High priority", true)
                    end
                else
                    plist.set(players[i], "Override prefer body aim", "-")
                    plist.set(players[i], "High priority", false)
                end

                if target_health <= menu.misc.features.baim_and_safe.value_safe:get() then
                    plist.set(players[i], "Override safe point", "On")
                    if menu.misc.features.baim_and_safe.priority:get() then
                        plist.set(players[i], "High priority", true)
                    end
                else
                    plist.set(players[i], "Override safe point", "-")
                    plist.set(players[i], "High priority", false)
                end
                
            end
        end

        
    end

    misc.net_update_end = function()
        if menu.misc.features.clantag.enabled:get() then
            if ui.get(reference.misc.misc.clan_tag_spammer) then return end

            curTime = globals.curtime()
            tag = menu.misc.features.clantag.type:get() .. "          "
            tagLength = string.len(tag)

            if menu.misc.features.clantag.type:get() == "None" then 
                client.set_clan_tag('')
                return 
            end

            tagLength = 0
            for i=1, #tag do
                local tmpChar = string.sub(tag, i, i)
                local leetChar = leetifyTable[string.upper(tmpChar)]
                
                if (leetChar ~= nil and leetChar ~= tmpChar) then
                    tagLength = tagLength + string.len(leetChar) + 1
                else
                    tagLength = tagLength + 1
                end
            end

            tagLength = tagLength * 2
	
            tagIndex = math.floor(curTime * tagSpeed % tagLength + 1)
        
            setTag = ""
            modLeft = -1
            
            realI = 0
            fakeI = 1
            
            backwards = false
            
            power = tagIndex
            setTag = ""
            realI = 0

            for i=1, tagLength/2 do
                local iChar = string.sub(tag, i, i)
                local leetChar = leetifyTable[string.upper(iChar)]
                
                if (leetChar == nil or string.lower(iChar) == leetChar) then --Doesnt have a leetify
                    if (power > 0) then
                        setTag = setTag .. iChar
                        power = power - 1
                    end
                else
                    local tmpChars = ""
                    for j=1, #leetChar do
                        if (power > 0) then
                            tmpChars = tmpChars .. string.sub(leetChar, j, j)
                            power = power - 1
                        end
                    end
                    
                    if (power > 0) then
                        setTag = setTag .. iChar
                        power = power - 1
                    else
                        setTag = setTag .. tmpChars
                    end
                end
            end

            if (tagIndex > tagLength/2) then
                setTag = ""
                power = tagLength - tagIndex
                
                for i=1, tagLength/2 do
                    local iChar = string.sub(tag, i, i)
                    local leetChar = leetifyTable[string.upper(iChar)]
                    
                    if (leetChar == nil or string.lower(iChar) == leetChar) then --Doesnt have a leetify
                        if (power > 0) then
                            setTag = setTag .. iChar
                            power = power - 1
                        end
                    else
                        local tmpChars = ""
                        for j=1, #leetChar do
                            if (power > 0) then
                                tmpChars = tmpChars .. string.sub(leetChar, j, j)
                                power = power - 1
                            end
                        end
                        
                        if (power > 0) then
                            setTag = setTag .. iChar
                            power = power - 1
                        else
                            setTag = setTag .. tmpChars
                        end
                    end
                end
            end

            if previousTag ~= setTag then
                client.set_clan_tag(setTag)
                previousTag = setTag
            end
        end
    end

    misc.player_spawn = function(e)
        if menu.misc.features.autobuy.enabled:get() then
            local lp = entity.get_local_player()
            if client.userid_to_entindex(e.userid) ~= lp then return end
            if entity.get_prop(lp, "m_iAccount") <= menu.misc.features.autobuy.balance:get() then return end

            local primary = menu.misc.features.autobuy.primary:get()
            local second = menu.misc.features.autobuy.second:get()
            local nades = menu.misc.features.autobuy.nades:get()
            local other = menu.misc.features.autobuy.other:get()
            local fast_buy = menu.misc.features.autobuy.fast_buy:get()

            local buy_commands = ""

            local primary_weapons = {
                Auto = "buy scar20; buy g3sg1;",
                Scout = "buy ssg08;",
                AWP = "buy awp;"
            }

            local secondary_weapons = {
                ["Deagle | R8"] = "buy deagle;",
                Dualies = "buy elite;",
                P250 = "buy p250;",
                ["CZ | FN57 | Tec9"] = "buy tec9;"
            }

            if fast_buy and primary_weapons[primary] then
                buy_commands = buy_commands .. primary_weapons[primary]
            end

            for _, item in ipairs(other) do
                buy_commands = buy_commands .. "buy " .. item:lower() .. ";"
            end

            if not fast_buy and primary_weapons[primary] then
                buy_commands = buy_commands .. primary_weapons[primary]
            end

            if secondary_weapons[second] then
                buy_commands = buy_commands .. secondary_weapons[second]
            end

            for _, nade in ipairs(nades) do
                buy_commands = buy_commands .. "buy " .. nade:lower() .. ";"
            end

            if buy_commands ~= "" then
                client.exec(buy_commands)
            end
        end
    end

    misc.pre_render = function()
        lp = entity.get_local_player()
        if not lp or not entity.is_alive(lp) then return end

        animslsg = get_entity_address(lp)

        local m_vecVelocity = { entity.get_prop(lp, 'm_vecVelocity') }
        move = math.sqrt(m_vecVelocity[1] ^ 2 + m_vecVelocity[2] ^ 2) > 5
        jump = bit.band(entity.get_prop(lp, 'm_fFlags'), 1) == 0

        if menu.antiaim.other.anim_breaker.a_ground:get() == "Walking" and menu.antiaim.other.anim_breaker.enabled:get() then
            entity.set_prop(lp, "m_flPoseParameter", 1, 7) 
            ui.set(reference.aa.other.leg_move[1], "Never Slide")
        end

        if menu.antiaim.other.anim_breaker.a_air:get() == "Static" and menu.antiaim.other.anim_breaker.enabled:get() then
            entity.set_prop(lp, "m_flPoseParameter", 1, 6) 
        end

        if menu.antiaim.other.anim_breaker.a_air:get() == "Walking" and menu.antiaim.other.anim_breaker.enabled:get() then
            if jump and move then
                libs.ffi.cast('animstate_layer_t**', libs.ffi.cast('uintptr_t', animslsg) + 0x2990)[0][6].m_flWeight = 1
            end
        end

        if menu.antiaim.other.anim_breaker.a_other:get("Pitch 0 on Land") and menu.antiaim.other.anim_breaker.enabled:get() then
            if anim_in_air() then
                entity.set_prop(lp, "m_flPoseParameter", 0.5, 12) 
            end
        end

        if menu.antiaim.other.anim_breaker.a_other:get("Move Lean") and menu.antiaim.other.anim_breaker.enabled:get() then
            if jump then
                libs.ffi.cast('animstate_layer_t**', libs.ffi.cast('uintptr_t', animslsg) + 0x2990)[0][12].m_flWeight = menu.antiaim.other.anim_breaker.a_move_lean:get() / 100
                
                entity.set_prop(lp, "m_flModelScale", 1)
                entity.set_prop(lp, "m_ScaleType", 0)
            end
        end

        if menu.antiaim.other.anim_breaker.a_other:get("Earthquake") and menu.antiaim.other.anim_breaker.enabled:get() then
            entity.set_prop(lp, "m_flPoseParameter", math.random(0, 10) / 10, 3)
            entity.set_prop(lp, "m_flPoseParameter", math.random(0, 10) / 10, 7) 
            entity.set_prop(lp, "m_flPoseParameter", math.random(0, 10) / 10, 6)
        end
    end

    menu.misc.features.console.filter:set_callback(function(el) 
        if el:get() and menu.misc.features.console.enabled:get() then
            cvar.con_filter_text:set_string("cool text")
            cvar.con_filter_enable:set_int(1)
            helps.print_log("Console filter", "[enable]")
        else
            cvar.con_filter_enable:set_int(0)
            cvar.con_filter_text:set_int(0)
            helps.print_log("Console filter", "[disable]")
        end

        client.exec("play ui\\beepclear")
    end)

    menu.misc.features.console.disabled_chat:set_callback(function(el) 
        if el:get() and menu.misc.features.console.enabled:get() then
            client.exec('cl_chatfilters 0')
            helps.print_log("Disabled chat", "[enable]")
        else
            client.exec('cl_chatfilters 1')
            helps.print_log("Disabled chat", "[disable]")
        end

        client.exec("play ui\\beepclear")
    end)

    menu.misc.features.console.enemy_mute:set_callback(function(el) 
        if el:get() and menu.misc.features.console.enabled:get() then
            client.exec('cl_mute_enemy_team 1')
            helps.print_log("Mute enemy", "[enable]")
        else
            client.exec('cl_mute_enemy_team 0')
            helps.print_log("Mute enemy", "[disable]")
        end
    
        client.exec("play ui\\beepclear")
    end)

    menu.misc.features.clantag.enabled:set_callback(function(el) if not el:get() then client.set_clan_tag("\0") end end)
end

---------------------------------------------------------------------------
--                            CFG SYSTEM                                 --
---------------------------------------------------------------------------

local web_server = { } do
    local API_URL = "https://a2ep24pv.allinone.guru"
    local SECRET_KEY = "k6RlAJTa0RkkQYatjZbc2dOh7zkK3DXM"

    local SCRIPT_NAME = "allinone"
    local PRODUCT_NAME = "gamesense"

    function generate_nonce(length)
        length = length or 16
        local chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
        local result = ''

        for i = 1, length do
            local random_index = math.random(1, #chars)

            result = string.format(
                '%s%s',
                result,
                chars:sub(random_index, random_index)
            )
        end

        return result
    end

    local function get_sorted_keys(t)
        local keys = { }

        for k in pairs(t) do
            table.insert(keys, k)
        end

        table.sort(keys)

        return keys
    end

    function create_signature(data, secret_key)
        local sorted_keys = get_sorted_keys(data)
        local concatenated = ''

        for _, key in ipairs(sorted_keys) do
            concatenated = string.format(
                '%s%s%s',
                concatenated,
                key,
                tostring(data[key])
            )
        end

        concatenated = string.format(
            '%s%s',
            concatenated,
            secret_key
        )

        return sha256.hash(concatenated)
    end

    function web_server.verify()
        local request_data = {
            username = script_info.user,
            cheat = PRODUCT_NAME,
            nonce = generate_nonce(16)
        }

        local signature = create_signature(request_data, SECRET_KEY)

        request_data.signature = signature

        local url = string.format(
            "%s%s",
            API_URL,
            "/token/generate"
        )

        local payload = json.stringify(request_data)

        local headers = {
            ["Content-Type"] = "application/json"
        }

        libs.http.post(url, {body = payload, headers = headers}, function(success, response)
            if not success or response.status ~= 200 then
                return
            end

            local data = json.parse(response.body)
            if not data or data.error then
                return
            end

            local token = data.token
            if not token then
                return
            end

            helps.print_log("Your Token:", token)
            helps.clipboard_set(token)

            local r, g, b = ui.get(reference.misc.settings.menu_color[1])
            notifications.new("Copy token to clipboard and send in console", r, g, b)
            client.exec("play ui\\beepclear")
        end)
    end
end

local configs_system = { } do
    configs_system.db = "_allinone"

    cfg_package = libs.pui.setup({menu.antiaim, aa_builder, menu.misc})

    configs_db = database.read(configs_system.db) or { }
    configs_db.cfg_list = configs_db.cfg_list or {"Default"}
    configs_db.menu_list = configs_db.menu_list or {"Default"}
    configs_db.cfg_list[1] = "allinone_W3sic2VsZWN0b3IiOiJNaXNjIiwidGVzdCI6dHJ1ZX1d"

    configs_system.create = function()
        c_input = menu.home.configs.input:get()
        if c_input == "" then print("Failed to create config: empty config name") client.exec("play resource\\warning.wav") return end
        for i, v in pairs(configs_db.menu_list) do if c_input == v then print("Failed to create config: config with this name already exists") client.exec("play resource\\warning.wav") return end end
    
        local data = cfg_package:save()
        local encrypted = "allinone_"..libs.base64.encode(json.stringify(data))
    
        table.insert(configs_db.menu_list, c_input)
        table.insert(configs_db.cfg_list, encrypted)
        menu.home.configs.input:set("")
    
        database.write(configs_system.db, configs_db)
        
        menu.home.configs.list:update(configs_db.menu_list)
        
        r, g, b = ui.get(reference.misc.settings.menu_color[1])
        notifications.new(string.format("Сonfig $%s$ create", c_input),  r, g, b)
        client.exec("play ui\\beepclear")
        
    end

    configs_system.save = function(id)
        if id == 1 then print("Failed to save config: you cant change default config") client.exec("play resource/warning.wav") return end

        
        local data = cfg_package:save()
        local encrypted = "allinone_"..libs.base64.encode(json.stringify(data))
        configs_db.cfg_list[id] = encrypted

        database.write(configs_system.db, configs_db)
    
        menu.home.configs.list:update(configs_db.menu_list)
    
        r, g, b = ui.get(reference.misc.settings.menu_color[1])
        notifications.new(string.format("Сonfig $%s$ saved", configs_db.menu_list[id]),  r, g, b)
        client.exec("play ui\\beepclear")
    end

    configs_system.load = function(id)

        selected_config = string.gsub(configs_db.cfg_list[id], "allinone_", "")
        local decrypted = json.parse(libs.base64.decode(selected_config))
        cfg_package:load(decrypted)
    
        menu.home.configs.input:set("")
    
        menu.home.configs.list:update(configs_db.menu_list)
        
        r, g, b = ui.get(reference.misc.settings.menu_color[1])
        notifications.new(string.format("Сonfig $%s$ loaded", configs_db.menu_list[id]), r, g, b)
        client.exec("play ui\\beepclear")
    end

    configs_system.delete = function(id)
        if id == 1 then print("Failed to delete config: you cant delete default config") client.exec("play resource\\warning.wav") return end
        
        local cfg_name = configs_db.menu_list[id]

        for i = #configs_db.cfg_list, 1, -1 do
            if id == i then
                table.remove(configs_db.cfg_list, i)
                table.remove(configs_db.menu_list, i)
            end
        end
    
        database.write(configs_system.db, configs_db)
        menu.home.configs.list:update(configs_db.menu_list)
        
        r, g, b = ui.get(reference.misc.settings.menu_color[1])
        notifications.new(string.format("Сonfig $%s$ deleted", cfg_name), r, g, b)
        client.exec("play ui\\beepclear")
    end

    configs_system.export = function()
        local data = cfg_package:save()
    
        local encrypted = libs.base64.encode(json.stringify(data))
        helps.clipboard_set("allinone_"..encrypted)
    
        r, g, b = ui.get(reference.misc.settings.menu_color[1])
        notifications.new("Config exported", r, g, b)

        client.exec("play ui\\beepclear")
    end

    configs_system.import = function()
        local data = (helps.clipboard_get() or (input ~= nil and input))
        if data == nil or not data:find("allinone_") then print("Failed to import config") client.exec("play resource\\warning.wav") return end
    
        decrypted = json.parse(libs.base64.decode(input ~= nil and input:gsub("allinone_", "") or helps.clipboard_get():gsub("allinone_", "")))
        cfg_package:load(decrypted)

        r, g, b = ui.get(reference.misc.settings.menu_color[1])
        notifications.new("Config imported", r, g, b)
        client.exec("play ui\\beepclear")
    end

    checkup_color = function()
        hit = {menu.misc.ragebot.aimbot_logs.color_hit.color:get()}

        notifications.new(string.format("Hit %s in $%s$ for $%d$ damage [HP: $%d$, BT: $%d$, HC: $%d$]", 
                _USER_NAME or "shpex", 
                "Head",
                client.random_int(100, 186),
                0,
                client.random_int(0, 40),
                client.random_int(80, 100)
            ), 
            hit[1], hit[2], hit[3]
        )

        notifications.new(string.format("%s %s for $%s$ damage", 
                "Naded", 
                _USER_NAME or "shpex",
                client.random_int(0, 50)
            ), 
            hit[1], hit[2], hit[3]
        )

        miss = {
            spread = {menu.misc.ragebot.aimbot_logs.color_spread.color:get()},
            ['?'] = {menu.misc.ragebot.aimbot_logs.color_correction.color:get()},
            death = {menu.misc.ragebot.aimbot_logs.color_death.color:get()},
            ['prediction error'] = {menu.misc.ragebot.aimbot_logs.color_pred.color:get()},
            ['unregistered shot'] = {menu.misc.ragebot.aimbot_logs.color_unreg.color:get()}
        }

        notifications.new(string.format("Missed %s in $%s$ due to $%s$ [BT: $%d$, HC: $%d$]", 
                _USER_NAME or "shpex", 
                "Head",
                "spread", 
                client.random_int(0, 40),
                client.random_int(80, 100)
            ), 
            miss["spread"][1], miss["spread"][2], miss["spread"][3]
        )

        notifications.new(string.format("Missed %s in $%s$ due to $%s$ [BT: $%d$, HC: $%d$]", 
                _USER_NAME or "shpex", 
                "Head",
                "resolver", 
                client.random_int(0, 40),
                client.random_int(80, 100)
            ), 
            miss["?"][1], miss["?"][2], miss["?"][3]
        )

        notifications.new(string.format("Missed %s in $%s$ due to $%s$ [BT: $%d$, HC: $%d$]", 
                _USER_NAME or "shpex", 
                "Head",
                "death", 
                client.random_int(0, 40),
                client.random_int(80, 100)
            ), 
            miss["death"][1], miss["death"][2], miss["death"][3]
        )

        notifications.new(string.format("Missed %s in $%s$ due to $%s$ [BT: $%d$, HC: $%d$]", 
                _USER_NAME or "shpex", 
                "Head",
                "prediction error", 
                client.random_int(0, 40),
                client.random_int(80, 100)
            ), 
            miss["prediction error"][1], miss["prediction error"][2], miss["prediction error"][3]
        )

        notifications.new(string.format("Missed %s in $%s$ due to $%s$ [BT: $%d$, HC: $%d$]", 
                _USER_NAME or "shpex", 
                "Head",
                "unregistered shot", 
                client.random_int(0, 40),
                client.random_int(80, 100)
            ), 
            miss["unregistered shot"][1], miss["unregistered shot"][2], miss["unregistered shot"][3]
        )



    end

    menu.home.configs.create:set_callback(function() 
        configs_system.create()
    end)

    menu.home.configs.save:set_callback(function() 
        configs_system.save(menu.home.configs.list:get() + 1)
    end)

    menu.home.configs.load:set_callback(function() 
        configs_system.load(menu.home.configs.list:get() + 1)
    end)

    menu.home.configs.delete:set_callback(function() 
        configs_system.delete(menu.home.configs.list:get() + 1)
    end)

    menu.home.configs.import:set_callback(function() 
        configs_system.import()
    end)

    menu.home.configs.export:set_callback(function() 
        configs_system.export()
    end)

    menu.home.info.discord:set_callback(function()
        helps.link('https://discord.gg/allinone')
    end)

    menu.home.info.verify_discord:set_callback(function()
        web_server.verify()
    end)

    menu.misc.ragebot.aimbot_logs.checkup_colors:set_callback(function()
        checkup_color()
    end)

    menu.home.configs.list:update(configs_db.menu_list)
    
end

---------------------------------------------------------------------------
--                            WEB SOCKETS                                --
---------------------------------------------------------------------------

local sockets = { } do
    local API_LINK = "wss://a2ep24pv.allinone.guru"
    local API_SECRET_KEY = "k6RlAJTa0RkkQYatjZbc2dOh7zkK3DXM"

    local SCRIPT_NAME = "allinone"
    local PRODUCT = "gamesense"

    local socket = nil
    local last_keepalive_time = 0
    local connection_attempts = 0
    local is_connecting = false
    local should_reconnect = true

    local KEEPALIVE_INTERVAL = 30
    local MAX_RECONNECT_ATTEMPTS = 10
    local RECONNECT_DELAY = 3

    local function create_http_params(url, params)
        if type(params) == "table" and next(params) ~= nil then
            local query = ""

            for k, v in pairs(params) do
                if query ~= "" then
                    query = query .. "&"
                end

                query = query .. string.format("%s=%s", k, v)
            end

            url = string.format(
                "%s?%s", url, query
            )
        end

        return url
    end

    local function update_users()
        local text = string.format(
            "\v \rOnline: \v%s",
            script_info.online_user
        )

        menu.home.info.online:set(text)
    end

    local function update_active_users(data)
        script_info.online_user = data.active_users
        update_users()
    end

    local function send_keepalive()
        if socket and socket.open then
            local keepalive_message = json.stringify({
                type = "get_active_users"
            })

            socket:send(keepalive_message)
            last_keepalive_time = globals.realtime
        end
    end

    local function on_message_received(data)
        local success, result = pcall(json.parse, data)

        if not success then
            return
        end

        if result.ct == 1 then
            update_active_users(result)
            return
        end
    end

    local function schedule_reconnect()
        if connection_attempts >= MAX_RECONNECT_ATTEMPTS then
            should_reconnect = false
            return
        end

        connection_attempts = connection_attempts + 1
        is_connecting = false

        client.delay_call(RECONNECT_DELAY, function()
            if should_reconnect then
                sockets:init()
            end
        end)
    end

    local callbacks = { } do
        function callbacks:open()
            connection_attempts = 0
            is_connecting = false
            last_keepalive_time = globals.realtime

            send_keepalive()
        end

        function callbacks:message(data)
            on_message_received(data)
        end

        function callbacks:close(msg)
            is_connecting = false

            if should_reconnect then
                schedule_reconnect()
            end
        end

        function callbacks:error(msg)
            is_connecting = false

            if should_reconnect then
                schedule_reconnect()
            end
        end
    end

    function sockets:init()
        if is_connecting then
            return
        end

        if socket and socket.open then
            return
        end

        is_connecting = true

        local nonce = generate_nonce(16)
        local signature_data = {
            username = script_info.user,
            product = PRODUCT,
            script = SCRIPT_NAME,
            nonce = nonce
        }

        local signature = create_signature(signature_data, API_SECRET_KEY)

        local url = create_http_params(
            API_LINK, {
                ["username"] = script_info.user,
                ["product"] = PRODUCT,
                ["script"] = SCRIPT_NAME,
                ["nonce"] = nonce,
                ["signature"] = signature
            }
        )

        socket = libs.websockets.connect(url, callbacks)
    end

    function sockets:check_connection()
        if not socket or not socket.open then
            if should_reconnect and not is_connecting then
                self:init()
            end

            return
        end

        local current_time = globals.realtime()
        if (current_time - last_keepalive_time()) >= KEEPALIVE_INTERVAL then
            send_keepalive()
        end
    end

    function sockets:is_connected()
        return socket and socket.open
    end

    function sockets:force_reconnect()
        connection_attempts = 0
        should_reconnect = true

        if socket and socket.open then
            socket:close()
        else
            self:init()
        end
    end

    function sockets:on_shutdown()
        should_reconnect = false

        if socket == nil then
            return
        end

        if not socket.open then
            return
        end

        socket:close()
    end

    sockets:init()

    client.set_event_callback("pre_render", LPH_NO_VIRTUALIZE(function()
        sockets:check_connection()
    end))
end

--------------------------------------------------------------------------
--                                EVENTS                                --
--------------------------------------------------------------------------

local events = { } do
    client.set_event_callback('paint_ui', LPH_NO_VIRTUALIZE(function()
        ui.set(reference.visual.effects.remove_scope, true)
        menu_elements.hide_orig_aa(false)
    end))

    client.set_event_callback('paint', LPH_NO_VIRTUALIZE(function()
        visuals.render()
        misc.render()
        notifications.render()
    end))

    client.set_event_callback('shutdown', LPH_NO_VIRTUALIZE(function()
        menu_elements.hide_orig_aa(true)
        cvar.cam_idealdist:set_int(100)
    end))

    client.set_event_callback("setup_command", LPH_NO_VIRTUALIZE(function(cmd) 
        builder.set_states(cmd)
        builder.setup_command(cmd)
        ragebot.setup_command()
        misc.edge_stop(cmd)
    end))

    client.set_event_callback("net_update_end", LPH_NO_VIRTUALIZE(function()
        misc.net_update_end()
        queue = {}
    end))

    client.set_event_callback("player_spawn", LPH_NO_VIRTUALIZE(function(cmd)
        misc.player_spawn(cmd)
        builder.last_input_time = 0
    end))

    client.set_event_callback("pre_render", LPH_NO_VIRTUALIZE(function()
            misc.pre_render()
    end))

    client.set_event_callback("aim_fire", LPH_NO_VIRTUALIZE(function(cmd)
        ragebot.aim_fire(cmd)
    end))

    client.set_event_callback("aim_hit", LPH_NO_VIRTUALIZE(function(cmd)
        ragebot.aim_hit(cmd)

        hitrate.total_shots = hitrate.total_shots + 1
        hitrate.hits = hitrate.hits + 1
    end))

    client.set_event_callback("aim_miss", LPH_NO_VIRTUALIZE(function(cmd)
        ragebot.aim_miss(cmd)

        if cmd.reason ~= "death" or cmd.reason ~= "unregistered shot" then
            hitrate.total_shots = hitrate.total_shots + 1
        end
    end))

    client.set_event_callback('player_hurt', LPH_NO_VIRTUALIZE(function(cmd)
        ragebot.player_hurt(cmd)
        visuals.player_hurt(cmd)
    end))

    client.set_event_callback("bullet_impact", LPH_NO_VIRTUALIZE(function(cmd)
        visuals.add_tracer(cmd)
    end))

    client.set_event_callback("player_death", LPH_NO_VIRTUALIZE(function(cmd)
        visuals.healthshot(cmd)
    end))

    client.set_event_callback("player_connect_full", LPH_NO_VIRTUALIZE(function(cmd)
        if client.userid_to_entindex(cmd.userid) == entity.get_local_player() then
            hitrate.total_shots = 0
            hitrate.hits = 0
            notifications.clear()
        end
    end))

    client.set_event_callback("run_command", LPH_NO_VIRTUALIZE(function(cmd)
        -- baim()
        -- predict()
        -- misc.auto_delay_weapon(cmd)
        misc.run_command(cmd)
    end))
end

-- Я хз куда это спрятать

client.register_esp_flag("BAIM", 245, 82, 64, LPH_NO_VIRTUALIZE(function(player)
    if not menu.misc.features.baim_and_safe.enabled:get() then return false end
    if not menu.misc.features.baim_and_safe.esp_flags:get() then return false end

    return plist.get(player, "Override prefer body aim") == "Force"
end))

client.register_esp_flag("SAFE", 245, 236, 64, LPH_NO_VIRTUALIZE(function(player)
    if not menu.misc.features.baim_and_safe.enabled:get() then return false end
    if not menu.misc.features.baim_and_safe.esp_flags:get() then return false end

    return plist.get(player, "Override safe point") == "On"
end))

-- AA tab icon: exact copy of osmanhook's auto_change_aa_icon, but reads from disk
local function set_aa_tab_icon()
    local tabs_list = {"RAGE", "AA", "LEGIT", "VISUALS", "MISC", "SKINS", "PLIST", "Tab"}
    local tabsptr = libs.ffi.cast("intptr_t*", 0x434799AC + 0x54)
    local tabsinfo = {}
    -- Use intptr_t* for the tab array (pointer-sized elements, works on both 32/64-bit)
    local tab_array = libs.ffi.cast("intptr_t*", tabsptr[0])
    for i = 0, #tabs_list do
        local tab = libs.ffi.cast("int*", tab_array[i])
        tabsinfo[i] = {
            id = libs.ffi.cast("int*", tab_array[i] + 0x80),
            offset = libs.ffi.cast("int*", tab_array[i] + 0x84),
            width = libs.ffi.cast("int*", tab_array[i] + 0x8C),
            height = libs.ffi.cast("int*", tab_array[i] + 0x90)
        }
    end

    local function write_icon(body)
        local texture_id = renderer.load_png(body, 64, 64)
        if texture_id and texture_id > 0 then
            for i = 0, #tabs_list do
                if tabs_list[i + 1] == "AA" then
                    tabsinfo[i].id[0]     = texture_id
                    tabsinfo[i].width[0]  = 64
                    tabsinfo[i].height[0] = 64
                    break
                end
            end
        end
    end

    local png_data = readfile("aa_icon.png")
    if png_data and type(png_data) == "string" and #png_data > 8 then
        write_icon(png_data)
        return
    end

    libs.http.get("https://raw.githubusercontent.com/masonfoxforth/gamesense/refs/heads/main/asd1.png", function(status, resp)
        if status and resp and resp.body then
            write_icon(resp.body)
        end
    end)
end

client.delay_call(0.001, set_aa_tab_icon)
