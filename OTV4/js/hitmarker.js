var hit = 0, i = 0;
function playerHurt() {
    var local = Entity.GetLocalPlayer()
    var attacker = Entity.GetEntityFromUserID(Event.GetInt("attacker"));
    if(local == attacker){
        hit++;
    }
}
function drawHit() {
    var delayspeed = 1
    if(hit == 1){
        i = i + delayspeed;
        var center = Global.GetScreenSize();
        var color = [255, 255, 255, 255 - i]
        Render.Line( (center[0] / 2) - 5, (center[1] / 2) - 5, (center[0] / 2) - 10, (center[1] / 2) - 10, color )
        Render.Line( (center[0] / 2) + 5, (center[1] / 2) - 5, (center[0] / 2) + 10, (center[1] / 2) - 10, color )

        Render.Line( (center[0] / 2) - 5, (center[1] / 2) + 5, (center[0] / 2) - 10, (center[1] / 2) + 10, color )
        Render.Line( (center[0] / 2) + 5, (center[1] / 2) + 5, (center[0] / 2) + 10, (center[1] / 2) + 10, color )
        if(color[3] <= 5){
            hit--;
            i = 0

        }
    } else if (hit > 1){
        i = 0
        hit = 1;
    }
}
Cheat.RegisterCallback("Draw", "drawHit");
Cheat.RegisterCallback("player_hurt", "playerHurt");