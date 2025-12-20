var weaponTabNames = {
    "usp s": "USP", "glock 18": "Glock", "dual berettas": "Dualies", "r8 revolver": "Revolver", "desert eagle": "Deagle", "p250": "P250", "tec 9": "Tec-9",
    "mp9": "MP9", "mac 10": "Mac10", "pp bizon": "PP-Bizon", "ump 45": "UMP45", "ak 47": "AK47", "sg 553": "SG553", "aug": "AUG", "m4a1 s": "M4A1-S", "m4a4": "M4A4", "ssg 08": "SSG08",
    "awp": "AWP", "g3sg1": "G3SG1", "scar 20": "SCAR20", "xm1014": "XM1014", "mag 7": "MAG7", "m249": "M249", "negev": "Negev", "p2000": "P2000", "famas": "FAMAS", "five seven": "Five Seven", "mp7": "MP7",
    "ump 45": "UMP45", "p90": "P90", "cz75 auto": "CZ-75", "mp5 sd": "MP5", "galil ar": "GALIL", "sawed off": "Sawed off"
};
function updateDamageValues() {
    if (!Entity.IsAlive(Entity.GetLocalPlayer()))
        return;
    var weaponName = Entity.GetName(Entity.GetWeapon(Entity.GetLocalPlayer()))
    if (!weaponTabNames.hasOwnProperty(weaponName)) {
        return;
    }
    var isOverride = UI.GetValue(["Rage", "General", "General", "Key assignment", "Damage Override"]) ? true : false;
    if (isOverride) {
        var target = Entity.GetEnemies();
        for (var i in target) {
            if (UI.GetValue(["Rage", "Target", weaponTabNames[weaponName], "Damage Override"]) != 0) {
                Ragebot.ForceTargetMinimumDamage(target[i], UI.GetValue(["Rage", "Target", weaponTabNames[weaponName], "Damage Override"]))
            }
            else {
                Ragebot.ForceTargetMinimumDamage(target[i], UI.GetValue(["Rage", "Target", "General", "Damage Override"]))
            }
        }
    }
}
var font;
function onDraw() {
    if (UI.GetValue(["Visuals", "Extra", "Extra", "Min damage indicator"])) {
        if (!font)
            font = Render.AddFont("tahoma.ttf", 16, 400)
        if (Entity.IsAlive(Entity.GetLocalPlayer())) {
            var color = UI.GetColor(["Visuals", "Extra", "Extra", "Min damage indicator color"])
            var screenSize = Render.GetScreenSize();
            var weaponName = Entity.GetName(Entity.GetWeapon(Entity.GetLocalPlayer()))
            if (weaponTabNames.hasOwnProperty(weaponName)) {
                var isOverride = UI.GetValue(["Rage", "General", "General", "Key assignment", "Damage Override"]) ? true : false;
                if (isOverride) {
                    if (UI.GetValue(["Rage", "Target", weaponTabNames[weaponName], "Damage Override"]) != 0) {
                        Render.String(screenSize[0] / 2 + 7, screenSize[1] / 2 + 7, 0, UI.GetValue(["Rage", "Target", weaponTabNames[weaponName], "Damage Override"]).toString(), color, font);
                    }
                    else{
                        Render.String(screenSize[0] / 2 + 7, screenSize[1] / 2 + 7, 0, UI.GetValue(["Rage", "Target", "General", "Damage Override"]).toString(), color, font);
                    }
                }
                else {
                    if (UI.GetValue(["Rage", "Target", weaponTabNames[weaponName], "Hitboxes"]) != 0) {
                        Render.String(screenSize[0] / 2 + 7, screenSize[1] / 2 + 7, 0, UI.GetValue(["Rage", "Target", weaponTabNames[weaponName], "Minimum damage"]).toString(), color, font);
                    }
                    else{
                        Render.String(screenSize[0] / 2 + 7, screenSize[1] / 2 + 7, 0, UI.GetValue(["Rage", "Target", "General", "Minimum damage"]).toString(), color, font);
                    }
                }
            }
        }
    }
}
function main() {
    UI.AddCheckbox(["Visuals", "Extra", "Extra"], "Min damage indicator")
    UI.AddColorPicker(["Visuals", "Extra", "Extra"], "Min damage indicator color")
    UI.AddSliderInt(["Rage", "Target", "General"], "Damage Override", 0, 130)
    for (var name in weaponTabNames) {
        UI.AddSliderInt(["Rage", "Target", weaponTabNames[name]], "Damage Override", 0, 130)
    }
    UI.AddHotkey(["Rage", "General", "General", "Key assignment"], "Damage Override", "Damage Override")
    Cheat.RegisterCallback("Draw", "onDraw")
    Cheat.RegisterCallback("CreateMove", "updateDamageValues")
}
main();