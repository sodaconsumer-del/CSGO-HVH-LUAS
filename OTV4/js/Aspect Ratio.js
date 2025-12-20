UI.AddSubTab(["Config", "SUBTAB_MGR"], "Aspect");
UI.AddSliderFloat(["Config", "Aspect", "Aspect"], "Aspect Ratio", 0.0, 5.0);


function aspectratio( ) {
menu_val = UI.GetValue(["Config", "Aspect", "Aspect", "Aspect Ratio"] );
string_menu_val = menu_val.toString();

Convar.SetString ("r_aspectratio", string_menu_val );
}

Cheat.RegisterCallback( "FrameStageNotify", "aspectratio" );