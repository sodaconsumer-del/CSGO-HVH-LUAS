//region dependencies

//region helpers

function GetObjectKeys(obj)
{
    const arr = [];
    for (var i in obj)
        if (obj.hasOwnProperty(i))
            arr.push(i);
    return arr;
}
//endregion

//endregion

//region globals & variables

const WeaponGroups = {
    "Global":           [ ],
    "Autosnipers":      [ "scar 20", "g3sg1" ],
    "Heavy pistols":    [ "desert eagle", "r8 revolver" ],
    "Pistols":          [ "usp s", "tec 9", "glock 18", "cz75 auto", "five seven", "p250", "p2000", "dual berettas" ],
    "AWP":              [ "awp" ],
    "Scout":            [ "ssg 08" ],
    "Rifles":           [ "galil ar", "ak 47", "m4a4", "m4a1 s", "sg 553", "famas", "aug" ],
    "SMGs":             [ "mac 10", "mp9", "mp7", "ump 45", "pp bizon", "p90" ],
    "Heavy":            [ "nova", "xm1014", "sawed off", "mag 7", "m249", "negev" ]
};

const Exceptions = [ "CKnife", "CSmokeGrenade", "CFlashbang", "CHEGrenade", "CDecoyGrenade", "CIncendiaryGrenade", "CMolotovGrenade", "CC4" ];

const DropdownValues = {
    "Hitboxes": [ "Head", "Upper chest", "Chest", "Lower chest", "Stomach", "Pelvis", "Legs", "Feet" ],
    "Autostops": [ "Duck", "Early", "On center only", "Lethal only", "Visible only", "In air", "Between shots", "Force accuracy" ]
};

const AdaptivePath = [ "Rage", "Adaptive", "Adaptive" ];

const RagePaths = {
    "Damage":       ["Rage", "Target", "General", "Minimum damage"],
    "Hitboxes":     ["Rage", "Target", "General", "Hitboxes"],
    "Multipoint":   ["Rage", "Target", "General", "Multipoint hitboxes"],
    "Headps":       ["Rage", "Target", "General", "Head pointscale"],
    "Bodyps":       ["Rage", "Target", "General", "Body pointscale"],

    "Hitchance":    ["Rage", "Accuracy", "General", "Hitchance"],
    "Autoscope":    ["Rage", "Accuracy", "General", "Auto scope"],
    "Autostop":     ["Rage", "Accuracy", "General", "Auto stop"],
    "Stopmode":     ["Rage", "Accuracy", "General", "Auto stop mode"],
    "Prefersafe":   ["Rage", "Accuracy", "General", "Prefer safe point"],
    "Preferbaim":   ["Rage", "Accuracy", "General", "Prefer body aim"]
};

var Font, ActiveSelectionBit, ActiveWeaponGroup, SelectedWeaponGroup, CachedWeaponGroup;
//endregion

//region menu

function HandleMenu()
{
    const WeaponKeys = GetObjectKeys(WeaponGroups);
    ActiveSelectionBit = UI.GetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "Weapon group"]);
    SelectedWeaponGroup = WeaponKeys[ActiveSelectionBit];

    for (var i in WeaponKeys)
    {
        var WeaponGroupName = WeaponKeys[i];

        UI.SetEnabled([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + WeaponGroupName + "] Enabled"], i == ActiveSelectionBit ? 1 : 0);

        UI.SetEnabled([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + WeaponGroupName + "] Minimum damage"], i == ActiveSelectionBit ? 1 : 0);
        UI.SetEnabled([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + WeaponGroupName + "] Minimum damage override"], i == ActiveSelectionBit ? 1 : 0);
        UI.SetEnabled([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + WeaponGroupName + "] Hitboxes"], i == ActiveSelectionBit ? 1 : 0);
        UI.SetEnabled([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + WeaponGroupName + "] Multipoint hitboxes"], i == ActiveSelectionBit ? 1 : 0);
        UI.SetEnabled([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + WeaponGroupName + "] Head pointscale"], i == ActiveSelectionBit ? 1 : 0);
        UI.SetEnabled([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + WeaponGroupName + "] Body pointscale"], i == ActiveSelectionBit ? 1 : 0);

        UI.SetEnabled([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + WeaponGroupName + "] Hitchance"], i == ActiveSelectionBit ? 1 : 0);
        UI.SetEnabled([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + WeaponGroupName + "] Auto scope"], i == ActiveSelectionBit ? 1 : 0);
        UI.SetEnabled([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + WeaponGroupName + "] Auto stop"], i == ActiveSelectionBit ? 1 : 0);
        UI.SetEnabled([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + WeaponGroupName + "] Auto stop mode"], i == ActiveSelectionBit ? 1 : 0);
        UI.SetEnabled([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + WeaponGroupName + "] Prefer safe point"], i == ActiveSelectionBit ? 1 : 0);
        UI.SetEnabled([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + WeaponGroupName + "] Prefer body aim"], i == ActiveSelectionBit ? 1 : 0);

        UI.SetEnabled([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + WeaponGroupName + "] Hitchance in air"], i == ActiveSelectionBit ? 1 : 0);
        UI.SetEnabled([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + WeaponGroupName + "] Hitchance in air value"], i == ActiveSelectionBit ? 1 : 0);
    }
}

function SetupMenu()
{
    const WeaponKeys = GetObjectKeys(WeaponGroups);

    UI.AddSubTab(["Rage", "SUBTAB_MGR"], "Adaptive");
    UI.AddCheckbox(AdaptivePath, "Draw indicators");
    UI.AddDropdown(AdaptivePath, "Weapon group", WeaponKeys, 1);
    UI.AddHotkey(["Rage", "General", "Key assignment"], "Damage override key", "Damage override");

    for (var i in WeaponKeys)
    {
        var WeaponGroupName = WeaponKeys[i];

        UI.AddCheckbox(AdaptivePath,        "[" + WeaponGroupName + "] Enabled");

        UI.AddMultiDropdown(AdaptivePath,   "[" + WeaponGroupName + "] Hitboxes", DropdownValues.Hitboxes);
        UI.AddMultiDropdown(AdaptivePath,   "[" + WeaponGroupName + "] Multipoint hitboxes", DropdownValues.Hitboxes);
        UI.AddSliderInt(AdaptivePath,       "[" + WeaponGroupName + "] Head pointscale", 0, 100);
        UI.AddSliderInt(AdaptivePath,       "[" + WeaponGroupName + "] Body pointscale", 0, 100);

        UI.AddSliderInt(AdaptivePath,       "[" + WeaponGroupName + "] Hitchance", 0, 100);
        UI.AddSliderInt(AdaptivePath,       "[" + WeaponGroupName + "] Minimum damage", 0, 130);
        UI.AddSliderInt(AdaptivePath,       "[" + WeaponGroupName + "] Minimum damage override", 0, 130);
        
        UI.AddCheckbox(AdaptivePath,        "[" + WeaponGroupName + "] Auto scope");
        UI.AddCheckbox(AdaptivePath,        "[" + WeaponGroupName + "] Auto stop");
        UI.AddMultiDropdown(AdaptivePath,   "[" + WeaponGroupName + "] Auto stop mode", DropdownValues.Autostops);
        UI.AddCheckbox(AdaptivePath,        "[" + WeaponGroupName + "] Prefer safe point");
        UI.AddCheckbox(AdaptivePath,        "[" + WeaponGroupName + "] Prefer body aim");

        UI.AddCheckbox(AdaptivePath,        "[" + WeaponGroupName + "] Hitchance in air");
        UI.AddSliderInt(AdaptivePath,       "[" + WeaponGroupName + "] Hitchance in air value", 0, 100);
    }
}

//endregion

//region main

function GetWeaponGroup(wpn)
{
    if (wpn == null) 
        return "Global";

    for (var i in WeaponGroups)
        for (var j in WeaponGroups[i])
            if (WeaponGroups[i][j] == wpn)
                return i;
    
    return "Global";
}

function SetConfig()
{
    if (UI.GetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + ActiveWeaponGroup + "] Enabled"]) == 0)
        ActiveWeaponGroup = "Global";

    UI.SetValue(RagePaths.Hitboxes, UI.GetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + ActiveWeaponGroup + "] Hitboxes"]));
    UI.SetValue(RagePaths.Multipoint, UI.GetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + ActiveWeaponGroup + "] Multipoint hitboxes"]));
    UI.SetValue(RagePaths.Headps, UI.GetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + ActiveWeaponGroup + "] Head pointscale"]));
    UI.SetValue(RagePaths.Bodyps, UI.GetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + ActiveWeaponGroup + "] Body pointscale"]));

    var FLAGS = Entity.GetProp(Entity.GetLocalPlayer(), "CBasePlayer", "m_fFlags");

    if (UI.GetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + ActiveWeaponGroup + "] Hitchance in air"]) && FLAGS == 256)
        UI.SetValue(RagePaths.Hitchance, UI.GetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + ActiveWeaponGroup + "] Hitchance in air value"]));
    else
        UI.SetValue(RagePaths.Hitchance, UI.GetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + ActiveWeaponGroup + "] Hitchance"]));

    if (UI.GetValue(["Rage", "General", "Key assignment", "Damage override key"]) == 1)
        UI.SetValue(RagePaths.Damage, UI.GetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + ActiveWeaponGroup + "] Minimum damage override"]));
    else
        UI.SetValue(RagePaths.Damage, UI.GetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + ActiveWeaponGroup + "] Minimum damage"]));

    UI.SetValue(RagePaths.Autoscope, UI.GetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + ActiveWeaponGroup + "] Auto scope"]));
    UI.SetValue(RagePaths.Autostop, UI.GetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + ActiveWeaponGroup + "] Auto stop"]));
    UI.SetValue(RagePaths.Stopmode, UI.GetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + ActiveWeaponGroup + "] Auto stop mode"]));
    UI.SetValue(RagePaths.Prefersafe, UI.GetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + ActiveWeaponGroup + "] Prefer safe point"]));
    UI.SetValue(RagePaths.Preferbaim, UI.GetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + ActiveWeaponGroup + "] Prefer body aim"]));
}
//endregion

//region init

function DrawController()
{
    if (Font == null)
        Font = Render.AddFont("verdanab.ttf", 28, 800);

    if (UI.GetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "Weapon group"]) != ActiveSelectionBit) 
        HandleMenu();

    const Me = Entity.GetLocalPlayer();

    if (!Entity.IsValid(Me) || !Entity.IsAlive(Me))
        return;
    
    if (UI.GetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "Draw indicators"]) == 0)
        return;

    const Size = Render.GetScreenSize();
    
    if (UI.GetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[" + ActiveWeaponGroup + "] Enabled"]) != 0)
        if (UI.GetValue(["Rage", "General", "Key assignment", "Damage override key"]) == 1)
        {
            Render.String(Size[0] - Size[0] + 11, Size[1]/2 + 11, 0, "DMG " + UI.GetValue(RagePaths.Damage), [0, 0, 0, 255], Font);
            Render.String(Size[0] - Size[0] + 10, Size[1]/2 + 10, 0, "DMG " + UI.GetValue(RagePaths.Damage), [255, 255, 255, 255], Font);
        }
}

function CommandHandler()
{
    const Me = Entity.GetLocalPlayer();

    if (!Entity.IsValid(Me) || !Entity.IsAlive(Me))
        return;

    const wpn = Entity.GetWeapon(Me);

    for (var i in Exceptions)
        if (Entity.GetClassName(wpn) == Exceptions[i])
            return;

    ActiveWeaponGroup = GetWeaponGroup(Entity.GetName(wpn));

    // if (ActiveWeaponGroup != CachedWeaponGroup)
    // {
        SetConfig();
        //CachedWeaponGroup = ActiveWeaponGroup;
    //}
}

function Initialize()
{
    SetupMenu();
    UI.SetValue([AdaptivePath[0], AdaptivePath[1], AdaptivePath[2], "[Global] Enabled"], 1);

    Cheat.RegisterCallback("Draw", "DrawController");
    Cheat.RegisterCallback("CreateMove", "CommandHandler");
}

Initialize();
//endregion