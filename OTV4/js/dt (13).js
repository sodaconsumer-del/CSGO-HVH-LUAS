UI.AddDropdown(["Rage", "SUBTAB_MGR", "Exploits", "SHEET_MGR", "General"], "Player controller", ["Matt", "Tim", "Jerry"], 1)
UI.AddSliderInt(["Rage", "SUBTAB_MGR", "Exploits", "SHEET_MGR", "General"], "Shift amount", 0, 62)
UI.AddSliderInt(["Rage", "SUBTAB_MGR", "Exploits", "SHEET_MGR", "General"], "Tolerance", 0, 8)
UI.AddSliderInt(["Rage", "SUBTAB_MGR", "Exploits", "SHEET_MGR", "General"], "Max process ticks", 0, 62)
UI.AddCheckbox(["Rage", "SUBTAB_MGR", "Exploits", "SHEET_MGR", "General"], "Automatic Shift")
UI.AddCheckbox(["Rage", "SUBTAB_MGR", "Exploits", "SHEET_MGR", "General"], "Automatic Tolerance")
UI.AddCheckbox(["Rage", "SUBTAB_MGR", "Exploits", "SHEET_MGR", "General"], "Automatic max process ticks")
function can_shift_shot(ticks_to_shift) {
    var me = Entity.GetLocalPlayer();
    var wpn = Entity.GetWeapon(me);

    if (me == null || wpn == null)
        return false;

    var tickbase = Entity.GetProp(me, "CCSPlayer", "m_nTickBase");
    var curtime = Globals.TickInterval() * (tickbase-ticks_to_shift)

    if (curtime < Entity.GetProp(me, "CCSPlayer", "m_flNextAttack"))
        return false;

    if (curtime < Entity.GetProp(wpn, "CBaseCombatWeapon", "m_flNextPrimaryAttack"))
        return false;

    return true;
}
function cm() {
    var is_charged = Exploit.GetCharge()

    Exploit[(is_charged != 1 ? "Enable" : "Disable") + "Recharge"]()
    if (can_shift_shot(14) && is_charged != 1) {
        Exploit.DisableRecharge();
        Exploit.Recharge()
    }
    var local = Entity.GetLocalPlayer()
    var info = Entity.GetCCSWeaponInfo(local)
    var time = info.cycle_time
    var ticks = Math.round(time / Globals.TickInterval())
    var automatic_shift = UI.GetValue(["Rage", "SUBTAB_MGR", "Exploits", "SHEET_MGR", "General", "Automatic Shift"])
    var automatic_tolerance = UI.GetValue(["Rage", "SUBTAB_MGR", "Exploits", "SHEET_MGR", "General", "Automatic Tolerance"])
    var automatic_mpt = UI.GetValue(["Rage", "SUBTAB_MGR", "Exploits", "SHEET_MGR", "General", "Automatic max process ticks"])
    var maxprocessticks = UI.GetValue(["Rage", "SUBTAB_MGR", "Exploits", "SHEET_MGR", "General", "Max process ticks"])
    var shift = UI.GetValue(["Rage", "SUBTAB_MGR", "Exploits", "SHEET_MGR", "General", "Shift amount"])
    var tolerance = UI.GetValue(["Rage", "SUBTAB_MGR", "Exploits", "SHEET_MGR", "General", "Tolerance"])
    if(automatic_shift) {
        shift = ticks
    }
    if(automatic_tolerance) {
        tolerance = Math.round(Local.Latency() / Globals.TickInterval())
    }
    if(automatic_mpt) {
        maxprocessticks = 16 
    }
    shift = Math.max(Math.min(shift, maxprocessticks), 0)
    Exploit.OverrideMaxProcessTicks(maxprocessticks)
    Exploit.OverrideShift(shift)
    Exploit.OverrideTolerance(tolerance)

}
Cheat.RegisterCallback("CreateMove", "cm")
