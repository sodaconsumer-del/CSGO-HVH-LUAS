UI.AddHotkey(["Rage",  "Anti Aim",  "General" , "Key assignment"],"Low Delta","Low Delta")

function lowdelta()
{
if(UI.GetValue(["Rage",  "Anti Aim",  "General" , "Key assignment","Low Delta"])){
AntiAim.SetOverride(1)
AntiAim.SetFakeOffset(7)
AntiAim.SetRealOffset(-36)
AntiAim.SetLBYOffset(26)
}
else
{
    AntiAim.SetOverride(0)
}
}
Cheat.RegisterCallback("CreateMove", "lowdelta")
function unload()
{
    AntiAim.SetOverride(0)
}
Cheat.RegisterCallback("Unload", "unload")
