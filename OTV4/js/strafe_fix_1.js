var a = UI.AddSliderInt(["Misc.", "SUBTAB_MGR", "Movement", "SHEET_MGR","General"], "Fix Turn speed", 0, 500)

function d()
{
    UI.SetValue(["Misc.", "SUBTAB_MGR", "Movement", "SHEET_MGR","General","Turn speed"],UI.GetValue(["Misc.", "SUBTAB_MGR", "Movement", "SHEET_MGR","General","Fix Turn speed"]))

}
Cheat.RegisterCallback("Draw", "d")

