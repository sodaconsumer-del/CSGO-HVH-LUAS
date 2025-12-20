var traceContainer = [];
function tracer(eyepos, hitpos, time) {
    this.eyepos = eyepos
    this.position = hitpos
    this.time = time
}
var impact = 0;
function onBulletImpact() {
    if (Globals.Tickcount() > impact) {
        if (Entity.GetEntityFromUserID(Event.GetInt("userid")) == Entity.GetLocalPlayer()) {
            var x = Event.GetFloat("x")
            var y = Event.GetFloat("y")
            var z = Event.GetFloat("z")

            var pos = [x, y, z]

            var view = Entity.GetEyePosition(Entity.GetLocalPlayer());

            traceContainer.push(new tracer(view, pos, Globals.Tickcount()))
            impact = Globals.Tickcount()
        }
    }
}
function onDraw() {
    if (Entity.IsAlive(Entity.GetLocalPlayer()) == false) {
        traceContainer = [];
        return
    }
    var t = UI.GetValue(["Config","SUBTAB_MGR", "Bullet tracer", "SHEET_MGR", "Bullet tracer",  "Ticks tracers last"])
    var col = UI.GetColor(["Config","SUBTAB_MGR", "Bullet tracer", "SHEET_MGR", "Bullet tracer",  "Local tracer color"])
    for (i in traceContainer) {
        var ss = Render.GetScreenSize()
        var view2s = Render.WorldToScreen(traceContainer[i].eyepos)
        var pos2s = Render.WorldToScreen(traceContainer[i].position)
        if (pos2s[2] != 0 && view2s[2] != 0) {
            if ((view2s[0] < -1000 || view2s[0] > ss[0] + 1000 || pos2s[0] < -1000 || pos2s[0] > ss[0] + 1000
                || view2s[1] < -1000 || view2s[1] > ss[1] + 1000 || pos2s[1] < -1000 || pos2s[1] > ss[1] + 1000) == false) {
                currenteye = Entity.GetEyePosition(Entity.GetLocalPlayer())
                var dx = currenteye[0] - traceContainer[i].eyepos[0];
                var dy = currenteye[1] - traceContainer[i].eyepos[1];
                var dz = currenteye[2] - traceContainer[i].eyepos[2];

                var dist = Math.sqrt(dx * dx + dy * dy + dz * dz);

                if (UI.GetValue(["Misc.", "Keys", "General", "Thirdperson"]) == 0 || dist > 0.3) {
                    Render.Line(view2s[0], view2s[1], pos2s[0], pos2s[1], col)

                    if (UI.GetValue(["Config","SUBTAB_MGR", "Bullet tracer", "SHEET_MGR", "Bullet tracer", "Local tracer type"]) == 1) {
                        Render.Line(view2s[0] + 1, view2s[1], pos2s[0] + 1, pos2s[1], col)

                        Render.Line(view2s[0], view2s[1] + 1, pos2s[0], pos2s[1] + 1, col)

                        Render.Line(view2s[0] - 1, view2s[1], pos2s[0] - 1, pos2s[1], col)

                        Render.Line(view2s[0], view2s[1] - 1, pos2s[0], pos2s[1] - 1, col)
                    }
                }
            }
        }
        if (traceContainer[i].time + t < Globals.Tickcount()) {
            traceContainer.shift()
        }
        if (UI.GetValue(["Config","SUBTAB_MGR", "Bullet tracer", "SHEET_MGR", "Bullet tracer", "Max tracers"]) < traceContainer.length) {
            traceContainer.shift()
        }
    }
}

UI.AddSubTab(["Config", "SUBTAB_MGR"] , "Bullet tracer");
UI.AddDropdown(["Config","SUBTAB_MGR", "Bullet tracer", "SHEET_MGR", "Bullet tracer"], "Local tracer type", ["Thin", "Thick"], 0)
UI.AddColorPicker(["Config","SUBTAB_MGR", "Bullet tracer", "SHEET_MGR", "Bullet tracer"],  "Local tracer color")
UI.AddSliderInt(["Config","SUBTAB_MGR", "Bullet tracer", "SHEET_MGR", "Bullet tracer"],  "Ticks tracers last", 1, 640)
UI.AddSliderInt(["Config","SUBTAB_MGR", "Bullet tracer", "SHEET_MGR", "Bullet tracer"],  "Max tracers", 1, 50)
Cheat.RegisterCallback("Draw", "onDraw")
Cheat.RegisterCallback("bullet_impact", "onBulletImpact")