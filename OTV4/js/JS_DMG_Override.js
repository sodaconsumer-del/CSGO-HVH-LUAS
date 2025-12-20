UI.AddHotkey(["Rage", "General", "General", "Key assignment"], "Minimum damage override", "MD");
var wep2tab = {"usp s" : "USP","glock 18" : "Glock","dual berettas" : "Dualies","r8 revolver" : "Revolver","desert eagle" : "Deagle","p250" : "P250","tec 9" : "Tec-9",
"mp9": "MP9","mac 10": "Mac10","pp bizon": "PP-Bizon","ump 45" : "UMP45","ak 47" : "AK47","sg 553" : "SG553","aug" : "AUG","m4a1 s": "M4A1-S","m4a4": "M4A4","ssg 08": "SSG08",
"awp" : "AWP","g3sg1" : "G3SG1","scar 20" : "SCAR20","xm1014" : "XM1014","mag 7" : "MAG7","m249" : "M249","negev" : "Negev","p2000" : "General","famas" : "FAMAS","five seven" : "Five Seven","mp7" : "MP7",
"ump 45" : "UMP45","p90" : "P90","cz75 auto" : "CZ-75","mp5 sd" : "MP5","galil ar" : "GALIL","sawed off" : "Sawed off"};
var tab_names = ["General","USP","Glock","Five Seven","Tec-9","Deagle","Revolver","Dualies","P250","CZ-75","Mac10","P90","MP5","MP7","MP9","UMP45","PP-Bizon","M4A1-S","M4A4","AK47","AUG","SG553","FAMAS","GALIL","AWP","SSG08","SCAR20","G3SG1","M249","XM1014","MAG7","Negev","Sawed off"];
function setup_menu() {
    for (k in tab_names) {
        UI.AddSliderInt(["Rage", "Target", tab_names[k]], "Minimum damage override", 0,100);
    }
}
setup_menu();

function pew(){
    if (UI.GetValue(["Rage", "General", "General", "Key assignment","Minimum damage override"])) {
        var tab = wep2tab[Entity.GetName(Entity.GetWeapon(Entity.GetLocalPlayer()))];
        if (tab == undefined) {tab = "General";}
        var override = UI.GetValue(["Rage", "Target", tab,"Minimum damage override"]);
        if (override == 0 && tab != "General") {override = UI.GetValue(["Rage", "Target", "General","Minimum damage override"])}
       
        var en = Entity.GetEnemies();
        for (e in en) {
            Ragebot.ForceTargetMinimumDamage(en[e], override);
        }
    }
}
Cheat.RegisterCallback("CreateMove","pew");