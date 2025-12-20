var weaponTabNames = {
    "usp s": "USP", "glock 18": "Glock", "dual berettas": "Dualies", "r8 revolver": "Revolver", "desert eagle": "Deagle", "p250": "P250", "tec 9": "Tec-9",
    "mp9": "MP9", "mac 10": "Mac10", "pp bizon": "PP-Bizon", "ump 45": "UMP45", "ak 47": "AK47", "sg 553": "SG553", "aug": "AUG", "m4a1 s": "M4A1-S", "m4a4": "M4A4", "ssg 08": "SSG08",
    "awp": "AWP", "g3sg1": "G3SG1", "scar 20": "SCAR20", "xm1014": "XM1014", "mag 7": "MAG7", "m249": "M249", "negev": "Negev", "p2000": "General", "famas": "FAMAS", "five seven": "Five Seven", "mp7": "MP7",
    "ump 45": "UMP45", "p90": "P90", "cz75 auto": "CZ-75", "mp5 sd": "MP5", "galil ar": "GALIL", "sawed off": "Sawed off"
};
var otherNames = ["knife", "flashbang", "decoy", "high explosive grenade", "incendiary grenade", "molotov", "smoke grenade", "c4 explosive", "zeus x27"]
var isOverride = false;
function updateDamageValues() {
    if (!Entity.IsAlive(Entity.GetLocalPlayer()))
        return;
    isOverride = UI.GetValue(["Rage", "General", "General", "Key assignment", "Damage Override"]) ? true : false;
    var weaponName = Entity.GetName(Entity.GetWeapon(Entity.GetLocalPlayer()))
    if (otherNames.indexOf(weaponName.toString()) != -1) {
        return;
    }
    var target;
    if (isOverride) {
        for (var i in Entity.GetEnemies()) {
            target = Entity.GetEnemies()[i];
            if (UI.GetValue(["Rage", "Target", weaponTabNames[weaponName], "Enable Override"])) {
                Ragebot.ForceTargetMinimumDamage(target, UI.GetValue(["Rage", "Target", weaponTabNames[weaponName], "Damage Override"]))
            }
            else {
                Ragebot.ForceTargetMinimumDamage(target, UI.GetValue(["Rage", "Target", "General", "Damage Override"]))
            }
        }
    }
}
var font = 0;
function onDraw() {
    if (!Entity.IsAlive(Entity.GetLocalPlayer()))
        return;
    isOverride = UI.GetValue(["Rage", "General", "General", "Key assignment", "Damage Override"]) ? true : false;
    var screenSize = Render.GetScreenSize();
    var weaponName = Entity.GetName(Entity.GetWeapon(Entity.GetLocalPlayer()))
    if (otherNames.indexOf(weaponName.toString()) != -1) {
        return;
    }
    if (!font)
        font = Render.AddFont("tahoma.ttf", 18, 800)
    var color = UI.GetColor(["Visuals", "Extra", "Extra", "Damage override color"])
    if (isOverride) {
        if (UI.GetValue(["Rage", "Target", weaponTabNames[weaponName], "Enable Override"])) {
            Render.String(screenSize[0] / 1, screenSize[1] / 1, 0, UI.GetValue(["Rage", "Target", weaponTabNames[weaponName], "Damage Override"]).toString(), color, font)
        }
        else {
            Render.String(screenSize[0] / 1, screenSize[1] / 1, 0, UI.GetValue(["Rage", "Target", "General", "Damage Override"]).toString(), color, font)
        }
    }

}

function main() {
    for (var name in weaponTabNames) {
        UI.AddCheckbox(["Rage", "Target", weaponTabNames[name]], "Enable Override")
        UI.AddSliderInt(["Rage", "Target", weaponTabNames[name]], "Damage Override", 0, 130)
    }
    UI.AddColorPicker(["Visuals", "Extra", "Extra"], "Damage override color")
    UI.AddHotkey(["Rage", "General", "General", "Key assignment"], "Damage Override", "Damage Override")




    Cheat.RegisterCallback("CreateMove", "updateDamageValues")
    Cheat.RegisterCallback("Draw", "onDraw")
}
main();