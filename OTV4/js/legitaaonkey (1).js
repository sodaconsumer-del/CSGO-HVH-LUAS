var original_aa = true;

UI.AddHotkey(["Rage", "Anti Aim", "General", "Key assignment"], "Legit aa", "legit aa");

function legit_aa()
{
    if (UI.GetValue(["Rage", "Anti Aim", "General", "Key assignment", "Legit aa"]) == true)
    {
        if (original_aa)
        {
            restrictions_cache = UI.GetValue(["Config", "Cheat", "General", "Restrictions"]);
            yaw_offset_cache = UI.GetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"]);
            jitter_offset_cache = UI.GetValue(["Rage", "Anti Aim", "Directions", "Jitter offset"]);
            pitch_cache = UI.GetValue(["Rage", "Anti Aim", "General", "Pitch mode"]);
            original_aa = false;
        }
        UI.SetValue(["Config", "Cheat", "General", "Restrictions"], 0);
        UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], 180);
        UI.SetValue(["Rage", "Anti Aim", "Directions", "Jitter offset"], 0);
        UI.SetValue(["Rage", "Anti Aim", "General", "Pitch mode"], 0);
    }
    else
    {
        if (!original_aa)
        {
            UI.SetValue(["Config", "Cheat", "General", "Restrictions"], restrictions_cache);
            UI.SetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"], yaw_offset_cache);
            UI.SetValue(["Rage", "Anti Aim", "Directions", "Jitter offset"], jitter_offset_cache);
            UI.SetValue(["Rage", "Anti Aim", "General", "Pitch mode"], pitch_cache);
            original_aa = true;
        }
    }
}

Cheat.RegisterCallback("CreateMove", "legit_aa");