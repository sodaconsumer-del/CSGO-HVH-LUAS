function lowdelta()
{
    localplayer_index = Entity.GetLocalPlayer( );


        if (UI.GetValue (["Rage", "Anti Aim", "General", "Key assignment", "Slow walk"]))
        {       
            AntiAim.SetOverride(1);
            AntiAim.SetFakeOffset(0);
            AntiAim.SetRealOffset(-17);
        }
        else
        {
            
            AntiAim.SetOverride(0);
        }
}

function Main()
{
    Cheat.RegisterCallback("CreateMove", "lowdelta");
}
Main();