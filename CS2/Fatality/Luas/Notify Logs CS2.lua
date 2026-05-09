--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.checkbox(gui.control_id("enable_logs"))
slot_0_1_0 = gui.checkbox(gui.control_id("console_logs"))
slot_0_2_0 = gui.make_control("Notify Logs", slot_0_0_0)
slot_0_3_0 = gui.make_control("Console Logs", slot_0_1_0)
slot_0_4_0 = gui.ctx:find("lua>elements a")

slot_0_4_0:add(slot_0_2_0)
slot_0_4_0:reset()
slot_0_4_0:add(slot_0_3_0)
slot_0_4_0:reset()

slot_0_5_0 = {
        [0] = "generic",
        "head",
        "chest",
        "stomach",
        "left arm",
        "right arm",
        "left leg",
        "right leg"
}

setmetatable(slot_0_5_0, {
        __index = function(arg_1_0, arg_1_1)
                return arg_1_1
        end
})

slot_0_6_0 = {
        nova = "Nova",
        p250 = "P250",
        scar20 = "SCAR-20",
        sg556 = "SG 553",
        ssg08 = "SSG 08",
        flashbang = "Flashbang",
        hegrenade = "HE Grenade",
        inferno = "Fire",
        molotov = "Molotov",
        decoy = "Decoy",
        incgrenade = "Molotov",
        healthshot = "Healthshot",
        m4a1_silencer = "M4A1-S",
        usp_silencer = "USP-S",
        cz75a = "CZ75-Auto",
        revolver = "R8 Revolver",
        fists = "Bare Hands",
        deagle = "Desert Eagle",
        elite = "Dual Berettas",
        fiveseven = "Five-SeveN",
        hammer = "Hammer",
        ak47 = "AK-47",
        aug = "AUG",
        awp = "AWP",
        famas = "FAMAS",
        g3sg1 = "G3SG1",
        galilar = "Galil AR",
        m249 = "M249",
        m4a1 = "M4A4",
        mac10 = "MAC-10",
        p90 = "P90",
        mp5sd = "MP5-SD",
        ump45 = "UMP-45",
        xm1014 = "XM1014",
        bizon = "PP-Bizon",
        knife = "Knife",
        c4 = "C4",
        taser = "Zeus",
        glock = "Glock-18",
        smokegrenade = "Smoke",
        mag7 = "MAG-7",
        negev = "Negev",
        sawedoff = "Sawed-Off",
        tec9 = "Tec-9",
        hkp2000 = "P2000",
        mp7 = "MP7",
        mp9 = "MP9"
}

setmetatable(slot_0_6_0, {
        __index = function(arg_2_0, arg_2_1)
                return "undefined"
        end
})

slot_0_7_0 = {
        weapon_revolver = "R8 Revolver",
        weapon_mp5sd = "MP5-SD",
        weapon_m4a1_silencer = "M4A1-S",
        weapon_usp_silencer = "USP-S",
        weapon_cz75a = "CZ75-Auto"
}

setmetatable(slot_0_7_0, {
        __index = function(arg_3_0, arg_3_1)
                return arg_3_1
        end
})

slot_0_8_0 = {
        bomb_exploded = " Exploded the bomb",
        bomb_planted = " Planted the bomb",
        bomb_abortplant = " Cancelled planting the bomb",
        bomb_beginplant = " Began planting the bomb",
        bomb_defused = " Defused the bomb"
}

setmetatable(slot_0_8_0, {
        __index = function(arg_4_0, arg_4_1)
                return arg_4_1
        end
})

slot_0_9_0 = {
        round_start = {
                "Round started!",
                "Buy weapons and FIGHT!!!"
        },
        round_end = {
                "Round end.",
                "Better luck next time."
        }
}

setmetatable(slot_0_9_0, {
        __index = function(arg_5_0, arg_5_1)
                return {
                        arg_5_1,
                        "undefined"
                }
        end
})

function slot_0_10_0(arg_6_0, arg_6_1, arg_6_2)
        local var_6_0 = "undefined"

        if arg_6_0:get_controller("userid") ~= nil then
                var_6_0 = arg_6_0:get_controller("userid"):get_name()
        end

        local var_6_1 = "<" .. var_6_0 .. ">" .. slot_0_8_0[arg_6_0:get_name()]

        if arg_6_1 then
                print(var_6_1)
        end

        if arg_6_2 then
                gui.notify:add(gui.notification("<" .. var_6_0 .. ">", slot_0_8_0[arg_6_0:get_name()], draw.textures.icon_visuals))
        end
end

function slot_0_11_0(arg_7_0, arg_7_1, arg_7_2)
        local var_7_0 = "undefined"
        local var_7_1 = "undefined"
        local var_7_2 = "undefined"

        if arg_7_0:get_string("weapon") ~= nil then
                var_7_1 = arg_7_0:get_string("weapon")
        end

        if arg_7_0:get_pawn_from_id("attacker") ~= nil then
                var_7_2 = arg_7_0:get_pawn_from_id("attacker"):get_active_weapon():get_data().name
        end

        if slot_0_6_0[var_7_1] ~= "undefined" and slot_0_7_0[var_7_2] == var_7_2 then
                var_7_0 = slot_0_6_0[var_7_1]
        else
                var_7_0 = slot_0_7_0[var_7_2]
        end

        local var_7_3 = "undefined"

        if arg_7_0:get_controller("userid") ~= nil then
                var_7_3 = arg_7_0:get_controller("userid"):get_name()
        end

        local var_7_4 = "Hit <" .. var_7_3 .. "> for " .. arg_7_0:get_int("dmg_health") .. " (" .. arg_7_0:get_int("health") .. ") hp in " .. slot_0_5_0[arg_7_0:get_int("hitgroup")] .. " with " .. var_7_0

        if arg_7_1 then
                print(var_7_4)
        end

        if arg_7_2 then
                gui.notify:add(gui.notification("Hit!", var_7_4, draw.textures.icon_rage))
        end
end

function slot_0_12_0(arg_8_0, arg_8_1, arg_8_2)
        local var_8_0 = "undefined"

        if arg_8_0:get_controller("attacker") ~= nil then
                var_8_0 = arg_8_0:get_controller("attacker"):get_name()
        end

        local var_8_1 = "Hurt by <" .. var_8_0 .. "> for " .. arg_8_0:get_int("dmg_health") .. " (" .. arg_8_0:get_int("health") .. ") hp in " .. slot_0_5_0[arg_8_0:get_int("hitgroup")] .. " with " .. slot_0_6_0[arg_8_0:get_string("weapon")]

        if arg_8_1 then
                print(var_8_1)
        end

        if arg_8_2 then
                gui.notify:add(gui.notification("Hurt!", var_8_1, draw.textures.icon_legit))
        end
end

function slot_0_13_0(arg_9_0, arg_9_1, arg_9_2)
        local var_9_0 = arg_9_0:get_name()
        local var_9_1 = slot_0_9_0[var_9_0]

        if arg_9_0:get_string("message") ~= nil then
                if string.find(arg_9_0:get_string("message"), "_Terrorists") then
                        var_9_1[2] = "Terrorists win!"
                elseif string.find(arg_9_0:get_string("message"), "_CTs_") then
                        var_9_1[2] = "Counter-Terrorists win!"
                end
        end

        if arg_9_1 then
                print(var_9_1[1] .. var_9_1[2])
        end

        if arg_9_2 then
                gui.notify:add(gui.notification(var_9_1[1], var_9_1[2], draw.textures.icon_visuals))
        end
end

function slot_0_14_0(arg_10_0)
        local var_10_0 = slot_0_0_0:get_value():get()
        local var_10_1 = slot_0_1_0:get_value():get()
        local var_10_2 = arg_10_0:get_name()

        if var_10_0 or var_10_1 then
                if var_10_2 == "player_hurt" then
                        if arg_10_0:get_controller("attacker") == entities.get_local_controller() then
                                return slot_0_11_0(arg_10_0, var_10_1, var_10_0)
                        elseif arg_10_0:get_controller("userid") == entities.get_local_controller() then
                                return slot_0_12_0(arg_10_0, var_10_1, var_10_0)
                        end
                end

                if string.find(var_10_2, "round_") then
                        return slot_0_13_0(arg_10_0, var_10_1, var_10_0)
                end

                if string.find(var_10_2, "bomb_") then
                        return slot_0_10_0(arg_10_0, var_10_1, var_10_0)
                end
        end
end

mods.events:add_listener("round_end")
events.event:add(slot_0_14_0)
