UI.AddSliderInt(["Misc.", "Movement", "General"], "New turn speed", 0, 500)

function strafespeed(){
    UI.SetValue(["Misc.", "Movement", "General", "Turn speed"], UI.GetValue(["Misc.", "Movement", "General", "New turn speed"]));
}
Cheat.RegisterCallback("Draw", "strafespeed")