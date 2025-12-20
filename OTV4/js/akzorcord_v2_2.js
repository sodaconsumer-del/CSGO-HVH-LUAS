Cheat.PrintColor([0,139,255,255], " " + "\n")
Cheat.PrintColor([127, 255, 0, 255], "Welcome to akcord " + Cheat.GetUsername() + "\n")
Cheat.PrintColor([159, 161, 159, 255], "Add me on ds akzor#2067" + "\n")
Cheat.PrintColor([127, 255, 0, 255], "Thank you for choosing akcord" + "\n")
Cheat.PrintColor([159, 161, 159, 255], "Also Join my dc https://discord.gg/adXpJTt" + "\n")





UI.AddSubTab(["Config", "SUBTAB_MGR"], "akcord");

UI.AddSliderFloat(["Config", "akcord", "akcord"], "                              Misc", 0, 0);
UI.AddCheckbox(["Config", "akcord", "akcord"], "Hit Logs");
UI.AddCheckbox(["Config", "akcord", "akcord"], "speed dt");
UI.AddCheckbox(["Config", "akcord", "akcord"], "recharge");
//dt
function dt() {

}
dt();
fogxkycp6v();

function canShiftShot(val) {
    var localPlayer = Entity.GetLocalPlayer(),
        localWeapon = Entity.GetWeapon(localPlayer);
    if (null == localPlayer || null == localWeapon) return !1;
    var tickBase = Entity.GetProp(localPlayer, "CCSPlayer", "m_nTickBase"),
        _tickBase = Globals.TickInterval() * (tickBase - val);
    return !(_tickBase < Entity.GetProp(localPlayer, "CCSPlayer", "m_flNextAttack")) && !(_tickBase < Entity.GetProp(localWeapon, "CBaseCombatWeapon", "m_flNextPrimaryAttack"))
}
 
function fasterDoubleTap() {
    if (UI.GetValue(["Config", "akcord", "akcord", "speed dt"])) {
        var exploitCharge = Exploit.GetCharge();
 
        Exploit[(1 != exploitCharge ? "Enable" : "Disable") + "Recharge"](), Convar.SetInt("cl_clock_correction", 1), Convar.SetInt("sv_maxusrcmdprocessticks", 19), Exploit.OverrideShift(19),
            Exploit.OverrideTolerance(0), canShiftShot(19) && 1 != exploitCharge && (Exploit.DisableRecharge(), Exploit.Recharge())
    } else
        Exploit.EnableRecharge(), Exploit.OverrideShift(17), Exploit.OverrideTolerance(0)
}
 
function fasterDoubleTapUnload() {
    Exploit.EnableRecharge(), Exploit.OverrideShift(21), Exploit.OverrideTolerance(0)
}
 
var rechargeTime = 0x0, updateTime = !![], shouldDisableRecharge = !![];
function instantRecharge() {
    if (UI.GetValue(["Config", "akcord", "akcord", "recharge"])) {
        const _0x96a898 = new Date().getTime() / 0x3e8;
        Exploit.DisableRecharge(), shouldDisableRecharge = !![];
        if (Exploit.GetCharge() >= 0x1) updateTime = !![];
        Exploit.GetCharge() < 0x1 && (updateTime && (rechargeTime = _0x96a898, updateTime = ![]), _0x96a898 - rechargeTime > 1 && updateTime == ![] && (Exploit.Recharge(), rechargeTime = _0x96a898));
    } else shouldDisableRecharge && (Exploit.EnableRecharge(), shouldDisableRecharge = ![]);
}


function clearData() {
    firedThisTick = []
    storedShotTime = [];
} 
storedShotTime = []
firedThisTick = []

function createMove() {
    if (!Entity.IsValid(Entity.GetLocalPlayer())) return;
    if (!Entity.IsAlive(Entity.GetLocalPlayer())) return;
 
    fasterDoubleTap();
    instantRecharge();
}
 
function fogxkycp6v() {
    Cheat.RegisterCallback("CreateMove", "createMove");
    Cheat.RegisterCallback("Unload", "fasterDoubleTapUnload");
}

//log
var logs = [];
var logsct = [];
var logsalpha = [];
var shots = 0;

hitboxes = [
    'general',
    'head',
    'chest',
    'stomach',
    'left arm',
    'right arm',
    'left leg',
    'right leg',
    '?'
];

function getHitboxName(index) {
    switch (index) {
        case 0:
            hitboxName = "general";
            break;
        case 1:
            hitboxName = "head";
            break;
        case 2:
            hitboxName = "chest";
            break;
        case 3:
            hitboxName = "stomach";
            break;
        case 4:
            hitboxName = "left hand";
            break;
        case 5:
            hitboxName = "right hand";
            break;
        case 6:
            hitboxName = "left leg";
            break;
        case 7:
            hitboxName = "right leg";
            break;

    }
    return hitboxName;
}

function HitgroupName(index) {
    return hitboxes[index] || 'body';
}

//Hit Logs

function hurt() {
    if (UI.GetValue(["Config", "akcord", "akcord", "Hit Logs"])) {
        var attacker = Event.GetInt("attacker");
        var player = Entity.GetEntityFromUserID(Event.GetInt("userid"));
        var weapon = Event.GetString("weapon");
        var health = Event.GetInt("dmg_health");
        var hitbox = Event.GetString("hitgroup");
        var hp = Event.GetInt("health");
        var name = Entity.GetName(player);
        var bone = HitgroupName(hitbox);

        if (Entity.IsLocalPlayer(Entity.GetEntityFromUserID(attacker))) {

            Cheat.PrintColor([180, 230, 20, 0], '[akzord] ')
            Cheat.PrintColor([255, 255, 255, 255], '[' + shots.toString() + '] Hit ' + name + ' in the ' + bone + ' for ' + health + ' damage' + ' (' + hp + ' health remaining)\n')
            logs.push('[' + shots.toString() + '] Hit ' + name + ' in the ' + bone + ' for ' + health + ' damage' + ' (' + hp + ' health remaining)');
            logsct.push(Globals.Curtime());
            logsalpha.push(255);

            if (shots == 99)
                shots = 0;
            else
                shots++;
        }


    }


}
//mindamag 
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
            font = Render.AddFont("tahoma.ttf", 31, 400)
        if (Entity.IsAlive(Entity.GetLocalPlayer())) {
            var color = UI.GetColor(["Visuals", "Extra", "Extra", "Min damage indicator color"])
            var screenSize = Render.GetScreenSize();
            var weaponName = Entity.GetName(Entity.GetWeapon(Entity.GetLocalPlayer()))
            if (weaponTabNames.hasOwnProperty(weaponName)) {
                var isOverride = UI.GetValue(["Rage", "General", "General", "Key assignment", "Damage Override"]) ? true : false;
                if (isOverride) {
                    if (UI.GetValue(["Rage", "Target", weaponTabNames[weaponName], "Damage Override"]) != 0) {
                        Render.String(screenSize[5] / 10000 + 700, screenSize[1] / 10000 + 700, 0, UI.GetValue(["Rage", "Target", weaponTabNames[weaponName], "Damage Override"]).toString(), color, font);
                    }
                    else{
                        Render.String(screenSize[5] / 10000 + 700, screenSize[1] / 10000 + 700, 0, UI.GetValue(["Rage", "Target", "General", "Damage Override"]).toString(), color, font);
                    }
                }
                else {
                    if (UI.GetValue(["Rage", "Target", weaponTabNames[weaponName], "Hitboxes"]) != 0) {
                        Render.String(screenSize[5] / 10000 + 700, screenSize[1] / 10000 + 700, 0, UI.GetValue(["Rage", "Target", weaponTabNames[weaponName], "Minimum damage"]).toString(), color, font);
                    }
                    else{
                        Render.String(screenSize[5] / 10000 + 700, screenSize[1] / 10000 + 700, 0, UI.GetValue(["Rage", "Target", "General", "Minimum damage"]).toString(), color, font);
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
//legs
UI.AddSubTab(["Config", "SUBTAB_MGR"], "Tick")
UI.AddSliderInt(["Config", "Tick", "Tick"], "Tick speed", 1, 10)

var old_tick_count = 0

function onMove() {
    if ((Globals.Tickcount() - old_tick_count) > UI.GetValue(["Config", "Tick", "Tick", "Tick speed"])) {
        if (UI.GetValue(["Misc.", "Movement", "Leg movement"])) {
            UI.SetValue(["Misc.", "Movement", "Leg movement"], 0)
        }
        else {
            UI.SetValue(["Misc.", "Movement", "Leg movement"], 1)
        }
        old_tick_count = Globals.Tickcount()
    }
}

function onUnload() {
    UI.SetValue(["Misc.", "Movement", "Leg movement"], 0)
}

Cheat.RegisterCallback("CreateMove", "onMove")
Cheat.RegisterCallback("Unload", "onUnload")


