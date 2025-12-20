var flip = false;

function onDraw() {
  var me = Entity.GetLocalPlayer();

  var weapon = Entity.GetWeapon(me);
  var weapon_classname = Entity.GetClassName(weapon);

  if (weapon_classname == "CWeaponAWP") {
    var isSafePointEnabled = UI.GetValue(["Rage", "General", "General", "Key assignment", "Force safe point"])

    if (!isSafePointEnabled) {
      UI.ToggleHotkey(["Rage", "General", "General", "Key assignment", "Force safe point"])
      flip = true
    }
  } else if (flip) {
    UI.ToggleHotkey(["Rage", "General", "General", "Key assignment", "Force safe point"])
    flip = false;
  }
}

Cheat.RegisterCallback("Draw", "onDraw")
