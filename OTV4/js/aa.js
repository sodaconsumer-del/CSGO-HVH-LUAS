var gui = require("storage/ui.js");



gui.AddSubTab("Rage", "Custom AntiAim");
var path = ["Rage", "Custom AntiAim", "Custom AntiAim"];
var use_caa = gui.AddCheckbox("Rage", "Custom AntiAim", "Custom AntiAim", "Use custom anti-aim");
var b_setting = gui.AddDropdown("Rage", "Custom AntiAim", "Custom AntiAim", "Builder setting", ["Right", "Left"], 0);
var r_real = gui.AddSliderInt("Rage", "Custom AntiAim", "Custom AntiAim", "Real (R)", -180,180);
var r_fake = gui.AddSliderInt("Rage", "Custom AntiAim", "Custom AntiAim", "Fake (R)", -60,60);
var r_r_offset = gui.AddSliderInt("Rage", "Custom AntiAim", "Custom AntiAim", "Real yaw offset (R)", 0,60);
var r_f_offset = gui.AddSliderInt("Rage", "Custom AntiAim", "Custom AntiAim","Fake yaw offset (R)", 0,60);
var r_ey = gui.AddCheckbox("Rage", "Custom AntiAim", "Custom AntiAim","Use eye yaw for LBY (R)");
var l_real = gui.AddSliderInt("Rage", "Custom AntiAim", "Custom AntiAim", "Real (L)", -180,180);
var l_fake = gui.AddSliderInt("Rage", "Custom AntiAim", "Custom AntiAim", "Fake (L)", -60,60);
var l_r_offset = gui.AddSliderInt("Rage", "Custom AntiAim", "Custom AntiAim", "Real yaw offset (L)", 0,60);
var l_f_offset = gui.AddSliderInt("Rage", "Custom AntiAim", "Custom AntiAim", "Fake yaw offset (L)", 0,60);
var l_ey = gui.AddCheckbox("Rage", "Custom AntiAim", "Custom AntiAim", "Use eye yaw for LBY (L)");
var invert = gui.AddHotkey("Rage", "General", "General", "Invert Custom AA", "Invert");
//fuck yall losers putting your UI initialization into functions like fucking clowns Ill fuck u up


function menu_cb() {
    var enabled = gui.GetValue(use_caa);
    var r_enabled = gui.GetValue(b_setting) == 0 && enabled;
    gui.SetEnabled(r_real, r_enabled);
    gui.SetEnabled(r_fake, r_enabled);
    gui.SetEnabled(r_r_offset, r_enabled);
    gui.SetEnabled(r_f_offset, r_enabled);
    gui.SetEnabled(r_ey, r_enabled);
  
    var l_enabled = gui.GetValue(b_setting) == 1 && enabled;
    gui.SetEnabled(l_real, l_enabled);
    gui.SetEnabled(l_fake, l_enabled);
    gui.SetEnabled(l_r_offset, l_enabled);
    gui.SetEnabled(l_f_offset, l_enabled);
    gui.SetEnabled(l_ey, l_enabled);
  
    gui.SetEnabled(b_setting, enabled);
    gui.SetEnabled(invert, enabled);
}
function draw_custom_aa() {
    if (UI.IsMenuOpen()) {menu_cb();}
}
//SetRealOffset operates like our target "real angle" but requires the math of (real - fake)
//SetFakeOffset set to our real angle to make our shit work
//SetLBYOffset operates as our fake angle
function aa_sys() {
    var enabled = gui.GetValue(use_caa);
    enabled ? AntiAim.SetOverride(1) : AntiAim.SetOverride(0);
  
    var m_side;//merp
    var m_invert = gui.GetValue(invert);
    if (m_invert) {
        m_side = " (L)";
    } else {
        m_side = " (R)";
    }
    var m_fake = gui.GetValue(["Rage", "Custom AntiAim", "Custom AntiAim", "Fake" + m_side]);
    var m_real = gui.GetValue(["Rage", "Custom AntiAim", "Custom AntiAim", "Real" + m_side]);
    var m_use_ey = gui.GetValue(["Rage", "Custom AntiAim", "Custom AntiAim", "Use eye yaw for LBY" + m_side]);
    var m_ryaw_offset_val = gui.GetValue(["Rage", "Custom AntiAim", "Custom AntiAim", "Real yaw offset" + m_side]);
    var m_fyaw_offset_val = gui.GetValue(["Rage", "Custom AntiAim", "Custom AntiAim", "Fake yaw offset" + m_side]);
    setAntiaim(m_real, m_fake, m_use_ey, m_ryaw_offset_val, m_fyaw_offset_val);
}

function setAntiaim(caa_real, caa_fake, caa_use_ey, caa_ryaw_offset_val, caa_fyaw_offset_val) {
  
    var caa_realyaw_offset = caa_use_ey ? caa_ryaw_offset_val : (caa_ryaw_offset_val * 2);
  
    AntiAim.SetFakeOffset(caa_real);
  
    if (caa_fake > 0) {
        AntiAim.SetRealOffset(caa_real - caa_fake + caa_realyaw_offset);
        if (caa_fake < caa_fyaw_offset_val) {
            caa_fyaw_offset_val = caa_fake;
        }//Clamp our fake yaw
        caa_use_ey ? AntiAim.SetLBYOffset(caa_real - caa_fyaw_offset_val) : AntiAim.SetLBYOffset(caa_real + caa_fake - caa_fyaw_offset_val * 2);
    } else {
        if (caa_fake > caa_fyaw_offset_val) {
            caa_fyaw_offset_val = caa_fake;
        }//Clamp our fake yaw (todo update this and above one to be more dynamic / working better x.x)
        AntiAim.SetRealOffset(caa_real - caa_fake - caa_realyaw_offset);
        caa_use_ey ? AntiAim.SetLBYOffset(caa_real + caa_fyaw_offset_val) : AntiAim.SetLBYOffset(caa_real + caa_fake + caa_fyaw_offset_val * 2);
    }
}

Cheat.RegisterCallback("Draw","draw_custom_aa");
Cheat.RegisterCallback("CreateMove","aa_sys");