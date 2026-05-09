--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

ref = {
        group = gui.ctx:find("lua>elements a")
}
menuid = {
        hitgroupcb = gui.checkbox(gui.control_id("notificationhitlog>showhitgroup")),
        personcb = gui.checkbox(gui.control_id("notificationhitlog>showpersonwhocauseddamage")),
        hitforcb = gui.checkbox(gui.control_id("notificationhitlog>showdamage")),
        hpleftcb = gui.checkbox(gui.control_id("notificationhitlog>showhpleft")),
        weaponcb = gui.checkbox(gui.control_id("notificationhitlog>showweapon")),
        enabledcb = gui.checkbox(gui.control_id("notificationhitlog>enablenotificationhitlog")),
        consolelogcb = gui.checkbox(gui.control_id("notificationhitlog>loginconsole")),
        weaponidasweaponcb = gui.checkbox(gui.control_id("notificationhitlog>weaponidinsteadofweaponname"))
}
menurow = {
        customizationmenu = gui.make_control("NHl Menu: ", menuid.weaponcb),
        weaponidasweaponcb = gui.make_control("Weapon ID instead of Weapon Name ", menuid.weaponidasweaponcb)
}

menurow.customizationmenu:add(menuid.hpleftcb)
menurow.customizationmenu:add(menuid.hitforcb)
menurow.customizationmenu:add(menuid.personcb)
menurow.customizationmenu:add(menuid.hitgroupcb)
menurow.customizationmenu:add(menuid.consolelogcb)
menurow.customizationmenu:add(menuid.enabledcb)

menuid.enabledcb.tooltip = "Enable notification hitlog"
menuid.consolelogcb.tooltip = "Enable log in console"
menuid.weaponcb.tooltip = "Add weapon to hitlog"
menuid.personcb.tooltip = "Add person who caused hurt to hitlog"
menuid.hpleftcb.tooltip = "Add HP left to hitlog"
menuid.hitforcb.tooltip = "Add Damage to hitlog"
menuid.hitgroupcb.tooltip = "Add hitbox to hitlog"
menuid.weaponidasweaponcb.tooltip = "Show Weapon ID instead of Weapon Name (example: Glock-18 as glock, P2000 as hkp2000)"

menuid.weaponcb:add_callback(function()
        if menuid.weaponcb:get_value():get() then
                menurow.weaponidasweaponcb:set_visible(true)
        else
                menurow.weaponidasweaponcb:set_visible(false)
        end
end)
ref.group:add(menurow.customizationmenu)
ref.group:add(menurow.weaponidasweaponcb)
ref.group:reset()

function slot_0_0_0(arg_2_0)
        if arg_2_0 == 0 then
                return "generic"
        elseif arg_2_0 == 1 then
                return "head"
        elseif arg_2_0 == 2 then
                return "chest"
        elseif arg_2_0 == 3 then
                return "stomach"
        elseif arg_2_0 == 4 then
                return "left arm"
        elseif arg_2_0 == 5 then
                return "right arm"
        elseif arg_2_0 == 6 then
                return "left leg"
        elseif arg_2_0 == 7 then
                return "right leg"
        elseif arg_2_0 == 10 then
                return "gear"
        end
end

function slot_0_1_0(arg_3_0)
        if menuid.weaponidasweaponcb:get_value():get() then
                return arg_3_0
        end

        if arg_3_0 == "hkp2000" then
                return "P2000"
        elseif arg_3_0 == "deagle" then
                return "Desert Eagle"
        elseif arg_3_0 == "elite" then
                return "Dual Berettas"
        elseif arg_3_0 == "knife" then
                return "Knife"
        elseif arg_3_0 == "fiveseven" then
                return "Five-SeveN"
        elseif arg_3_0 == "glock" then
                return "Glock-18"
        elseif arg_3_0 == "ak47" then
                return "AK-47"
        elseif arg_3_0 == "aug" then
                return "AUG"
        elseif arg_3_0 == "awp" then
                return "AWP"
        elseif arg_3_0 == "famas" then
                return "FAMAS"
        elseif arg_3_0 == "g3sg1" then
                return "G3SG1"
        elseif arg_3_0 == "galilar" then
                return "Galil AR"
        elseif arg_3_0 == "m249" then
                return "M249"
        elseif arg_3_0 == "m4a1" then
                return "M4A4"
        elseif arg_3_0 == "m4a1_silencer" then
                return "M4A1-S"
        elseif arg_3_0 == "mac10" then
                return "MAC-10"
        elseif arg_3_0 == "p90" then
                return "P90"
        elseif arg_3_0 == "zone_repulsor" then
                return "Zone Repulsor"
        elseif arg_3_0 == "mp5sd" then
                return "MP5-SD"
        elseif arg_3_0 == "ump45" then
                return "UMP-45"
        elseif arg_3_0 == "xm1014" then
                return "XM1014"
        elseif arg_3_0 == "bizon" then
                return "PP-Bizon"
        elseif arg_3_0 == "mag7" then
                return "MAG-7"
        elseif arg_3_0 == "negev" then
                return "Negev"
        elseif arg_3_0 == "sawedoff" then
                return "Sawed-Off"
        elseif arg_3_0 == "tec9" then
                return "Tec-9"
        elseif arg_3_0 == "taser" then
                return "Zeus x27"
        elseif arg_3_0 == "mp7" then
                return "MP7"
        elseif arg_3_0 == "mp9" then
                return "MP9"
        elseif arg_3_0 == "nova" then
                return "Nova"
        elseif arg_3_0 == "p250" then
                return "P250"
        elseif arg_3_0 == "scar20" then
                return "SCAR-20"
        elseif arg_3_0 == "sg556" then
                return "SG 553"
        elseif arg_3_0 == "ssg08" then
                return "SSG 08"
        elseif arg_3_0 == "knifegg" then
                return "Golden Knife"
        elseif arg_3_0 == "flashbang" then
                return "Flashbang"
        elseif arg_3_0 == "hegrenade" then
                return "High Explosive Grenade"
        elseif arg_3_0 == "smokegrenade" then
                return "Smoke Grenade"
        elseif arg_3_0 == "molotov" then
                return "Molotov"
        elseif arg_3_0 == "decoy" then
                return "Decoy"
        elseif arg_3_0 == "incgrenade" then
                return "Incendiary Grenade"
        elseif arg_3_0 == "c4" then
                return "C4 Explosive"
        elseif arg_3_0 == "healthshot" then
                return "Health shot"
        elseif arg_3_0 == "usp_silencer" then
                return "USP-S"
        elseif arg_3_0 == "cz75a" then
                return "CZ75-Auto"
        elseif arg_3_0 == "revolver" then
                return "R8 Revolver"
        elseif arg_3_0 == "tagrenade" then
                return "Tactical Awareness Grenade"
        elseif arg_3_0 == "fists" then
                return "Fists"
        elseif arg_3_0 == "breachcharge" then
                return "Breach Charge"
        elseif arg_3_0 == "tablet" then
                return "Tablet"
        elseif arg_3_0 == "melee" then
                return "Generic Melee Weapon"
        elseif arg_3_0 == "axe" then
                return "Axe"
        elseif arg_3_0 == "hammer" then
                return "Hammer"
        elseif arg_3_0 == "spanner" then
                return "Spanner (Wrench)"
        elseif arg_3_0 == "firebomb" then
                return "Firebomb Grenade"
        elseif arg_3_0 == "knife_ghost" then
                return "Ghost Knife"
        elseif arg_3_0 == "diversion" then
                return "Diversion Device"
        elseif arg_3_0 == "fraggrenade" then
                return "Fragmentation Grenade"
        elseif arg_3_0 == "snowball" then
                return "Snowball"
        elseif arg_3_0 == "bumpmine" then
                return "Bump Mine"
        elseif string.sub(arg_3_0, 1, 5) == "knife" then
                return "Knife"
        end

        return arg_3_0
end

function slot_0_2_0(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5)
        local var_4_0 = ""

        if menuid.personcb:get_value():get() and arg_4_0 == 1 then
                var_4_0 = var_4_0.format("%s%s ", var_4_0, arg_4_1)
        end

        if menuid.personcb:get_value():get() and arg_4_0 == 2 then
                var_4_0 = var_4_0.format("%sby %s ", var_4_0, arg_4_1)
        end

        if menuid.hitforcb:get_value():get() then
                var_4_0 = var_4_0.format("%sfor %dHP ", var_4_0, arg_4_2)
        end

        if menuid.hpleftcb:get_value():get() then
                var_4_0 = var_4_0.format("%s(%dHP left) ", var_4_0, arg_4_3)
        end

        if menuid.hitgroupcb:get_value():get() then
                var_4_0 = var_4_0.format("%sto %s ", var_4_0, arg_4_4)
        end

        if menuid.weaponcb:get_value():get() then
                var_4_0 = var_4_0.format("%swith %s ", var_4_0, slot_0_1_0(arg_4_5))
        end

        if not menuid.personcb:get_value():get() and not menuid.hitforcb:get_value():get() and not menuid.hpleftcb:get_value():get() and not menuid.hitgroupcb:get_value():get() and not menuid.weaponcb:get_value():get() then
                var_4_0 = "Please select needed checkboxes to add information to hitlogs!"
        end

        return var_4_0
end

function slot_0_3_0(arg_5_0)
        if not menuid.enabledcb:get_value():get() then
                return
        end

        if arg_5_0:get_name() == "player_hurt" then
                slot_5_1_0 = arg_5_0:get_pawn_from_id("attacker")
                slot_5_2_0 = arg_5_0:get_pawn_from_id("attacker"):get_name()
                slot_5_3_0 = arg_5_0:get_pawn_from_id("userid"):get_name()
                slot_5_4_0 = arg_5_0:get_int("dmg_health")
                slot_5_5_0 = arg_5_0:get_int("health")
                slot_5_6_0 = arg_5_0:get_int("hitgroup")
                slot_5_7_0 = arg_5_0:get_string("weapon")

                if slot_5_1_0 and slot_5_1_0:get_name() == entities.get_local_pawn():get_name() and slot_5_5_0 > 0 then
                        slot_5_8_3 = slot_0_2_0(1, slot_5_3_0, slot_5_4_0, slot_5_5_0, slot_0_0_0(slot_5_6_0), slot_5_7_0)
                        slot_5_9_3 = gui.notification("Hit", slot_5_8_3, draw.textures.icon_legit)

                        gui.notify:add(slot_5_9_3)

                        if menuid.consolelogcb:get_value():get() then
                                print("Hit " .. slot_5_8_3)
                        end
                elseif slot_5_1_0 and slot_5_1_0:get_name() == entities.get_local_pawn():get_name() and slot_5_5_0 <= 0 then
                        slot_5_8_2 = slot_0_2_0(1, slot_5_3_0, slot_5_4_0, slot_5_5_0, slot_0_0_0(slot_5_6_0), slot_5_7_0)
                        slot_5_9_2 = gui.notification("Killed", slot_5_8_2, draw.textures.icon_rage)

                        gui.notify:add(slot_5_9_2)

                        if menuid.consolelogcb:get_value():get() then
                                print("Killed " .. slot_5_8_2)
                        end
                elseif slot_5_1_0 and slot_5_3_0 == entities.get_local_pawn():get_name() and slot_5_5_0 > 0 then
                        slot_5_8_1 = slot_0_2_0(2, slot_5_2_0, slot_5_4_0, slot_5_5_0, slot_0_0_0(slot_5_6_0), slot_5_7_0)
                        slot_5_9_1 = gui.notification("Hurt", slot_5_8_1, draw.textures.icon_legit)

                        gui.notify:add(slot_5_9_1)

                        if menuid.consolelogcb:get_value():get() then
                                print("Hurt " .. slot_5_8_1)
                        end
                elseif slot_5_1_0 and slot_5_3_0 == entities.get_local_pawn():get_name() and slot_5_5_0 <= 0 then
                        slot_5_8_0 = slot_0_2_0(2, slot_5_2_0, slot_5_4_0, slot_5_5_0, slot_0_0_0(slot_5_6_0), slot_5_7_0)
                        slot_5_9_0 = gui.notification("Death", slot_5_8_0, draw.textures.icon_rage)

                        gui.notify:add(slot_5_9_0)

                        if menuid.consolelogcb:get_value():get() then
                                print("Death " .. slot_5_8_0)
                        end
                end
        end
end

mods.events:add_listener("player_death")
events.event:add(slot_0_3_0)
