refs = {
    enableaanl = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"),
    disable = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
    base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
    yawoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
    backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
    hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"),
    modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
    modoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
    bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
    inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
    leftlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
    rightlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
    options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
    bodyyawfs = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"),
    extended = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"),
    extendedpitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"),
    extendedroll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"),
    fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
    fss = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"),
    fsb = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"),
    fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
    sw = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
    leg = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"),
    pa = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"),
    dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
    hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
    hslag = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"),
    dtlag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
    scope = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"),
    fov = ui.find("Visuals", "World", "Main", "Field of View"),
    weaponact = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"),
    spike = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
    bodyaim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"),
    dormant = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"),
    min_damage_ui = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
    dmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
    clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"),
    ragebot_find = ui.find("Aimbot", "Ragebot", "Main"),
    hc_find = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"),
}
local fakeflick = ui.find("Aimbot", "Anti Aim", "Angles"):switch("Fake Flick")
local fakeflick = function(cmd)
local low_delta_enable = ui.find("Aimbot", "Anti Aim", "Angles", "Fake Flick"):get()
        if not low_delta_enable == 0 then
            return
        end

        if rage.exploit:get() < 1 then
            return
        end

         if ui.find("Aimbot", "Anti Aim", "Angles", "Fake Flick"):get() then
            rage.antiaim:inverter(false)

            refs.yawoffset:override(5)
            refs.modifier:override("Random")
            refs.modoffset:override(5)
            refs.bodyyaw:override(true)
            refs.options:override("")
            refs.leftlimit:override(42)
            refs.rightlimit:override(42)
            refs.fs:override(false)

            refs.hidden:override(true)
            rage.antiaim:override_hidden_pitch(89)
            rage.antiaim:override_hidden_yaw_offset(-70 or 90)
            rage.antiaim:override_hidden_yaw_offset(-90 or 70)

            refs.hslag:override("Break LC" or nil)
            refs.dtlag:override("Always On" or nil)

           cmd.force_defensive = cmd.command_number % 7 == 0
         end
        end
         events.createmove:set(function(cmd)
            fakeflick(cmd)
         end)