function fixUIBehaviour() {
    for (var _0xbdacx2 in UI) {
        if (!~_0xbdacx2['indexOf']('Add')) {
            continue
        };
        (function (_0xbdacx3) {
            UI[_0xbdacx2] = function () {
                _0xbdacx3['apply'](this, Array['prototype']['slice']['call'](arguments));
                return arguments[0]['concat'](arguments[1])
            }
        }(UI[_0xbdacx2]))
    }
}
fixUIBehaviour();
Render['OutlineString'] = function (_0xbdacx4, _0xbdacx5, _0xbdacx6, _0xbdacx7, _0xbdacx8, _0xbdacx9) {
    const _0xbdacxa = Math['min'](125, _0xbdacx8[3]);
    Render.String(_0xbdacx4 - 1, _0xbdacx5 - 1, _0xbdacx6, _0xbdacx7, [10, 10, 10, _0xbdacxa], _0xbdacx9);
    Render.String(_0xbdacx4 - 1, _0xbdacx5 + 1, _0xbdacx6, _0xbdacx7, [10, 10, 10, _0xbdacxa], _0xbdacx9);
    Render.String(_0xbdacx4 + 1, _0xbdacx5 - 1, _0xbdacx6, _0xbdacx7, [10, 10, 10, _0xbdacxa], _0xbdacx9);
    Render.String(_0xbdacx4 + 1, _0xbdacx5 + 1, _0xbdacx6, _0xbdacx7, [10, 10, 10, _0xbdacxa], _0xbdacx9);
    Render.String(_0xbdacx4, _0xbdacx5, _0xbdacx6, _0xbdacx7, _0xbdacx8, _0xbdacx9)
};
Render['Arc'] = function (_0xbdacx4, _0xbdacx5, _0xbdacxb, _0xbdacxc, _0xbdacxd, _0xbdacxe, _0xbdacxf, _0xbdacx10) {
    _0xbdacxf = 360 / _0xbdacxf;
    for (var _0xbdacx2 = _0xbdacxd; _0xbdacx2 < _0xbdacxd + _0xbdacxe; _0xbdacx2 = _0xbdacx2 + _0xbdacxf) {
        var _0xbdacx11 = _0xbdacx2 * Math['PI'] / 180;
        var _0xbdacx12 = (_0xbdacx2 + _0xbdacxf) * Math['PI'] / 180;
        var _0xbdacx13 = Math['cos'](_0xbdacx11);
        var _0xbdacx14 = Math['sin'](_0xbdacx11);
        var _0xbdacx15 = Math['cos'](_0xbdacx12);
        var _0xbdacx16 = Math['sin'](_0xbdacx12);
        var _0xbdacx17 = _0xbdacx4 + _0xbdacx13 * _0xbdacxc;
        var _0xbdacx18 = _0xbdacx5 + _0xbdacx14 * _0xbdacxc;
        var _0xbdacx19 = _0xbdacx4 + _0xbdacx13 * _0xbdacxb;
        var _0xbdacx1a = _0xbdacx5 + _0xbdacx14 * _0xbdacxb;
        var _0xbdacx1b = _0xbdacx4 + _0xbdacx15 * _0xbdacxc;
        var _0xbdacx1c = _0xbdacx5 + _0xbdacx16 * _0xbdacxc;
        var _0xbdacx1d = _0xbdacx4 + _0xbdacx15 * _0xbdacxb;
        var _0xbdacx1e = _0xbdacx5 + _0xbdacx16 * _0xbdacxb;
        Render.Polygon([
            [_0xbdacx19, _0xbdacx1a],
            [_0xbdacx1d, _0xbdacx1e],
            [_0xbdacx17, _0xbdacx18]
        ], _0xbdacx10);
        Render.Polygon([
            [_0xbdacx17, _0xbdacx18],
            [_0xbdacx1d, _0xbdacx1e],
            [_0xbdacx1b, _0xbdacx1c]
        ], _0xbdacx10)
    }
};

function Normalize(_0xbdacx20) {
    if (_0xbdacx20 < -180) {
        _0xbdacx20 += 360
    };
    if (_0xbdacx20 > 180) {
        _0xbdacx20 -= 360
    };
    return _0xbdacx20
}
UI.AddSubTab(['Config', 'SUBTAB_MGR'], 'Panul');
const path = ['Config', 'Panul', 'Panul'];
const path_hk = ['Config', 'Scripts', 'Keys', 'JS Keybinds'];
const enable = UI.AddCheckbox(path, 'Enabled');
const modules = UI.AddMultiDropdown(path, 'Active modules', ['Manual anti-aim arrows', 'Desync circles', 'Anti-aim mode', 'Others']);
const aa_clr = UI.AddColorPicker(path, 'Anti-aim arrow color');
const aa_mode_clr = UI.AddColorPicker(path, 'Anti-aim mode color');
const others_active_clr = UI.AddColorPicker(path, 'Others primary color');
const others_active_clr2 = UI.AddColorPicker(path, 'Others secondary color');
const others_active_clr3 = UI.AddColorPicker(path, 'Others tertiary color');
const left = UI.AddHotkey(path_hk, 'Left', '');
const right = UI.AddHotkey(path_hk, 'Right', '');
const back = UI.AddHotkey(path_hk, 'Back', '');
const ref_yaw_offset = ['Rage', 'Anti Aim', 'Directions', 'Yaw offset'];
const Renderer = {
    setup_fonts: true,
    fonts: {
        arrows: null,
        antiaim: null,
        antiaim_small: null,
        misc: null
    },
    length: 0,
    yaw: 0
};
Renderer['Arrows'] = function () {
    const _0xbdacx4 = screen_size[0] / 2,
        _0xbdacx5 = screen_size[1] / 2;
    const _0xbdacx10 = UI.GetColor(aa_clr);
    Render.String(_0xbdacx4 - 65, _0xbdacx5 - 15, 1, '<', input['state'] == 1 ? _0xbdacx10 : [100, 100, 100, 155], this['fonts']['arrows']);
    Render.String(_0xbdacx4 + 65, _0xbdacx5 - 15, 1, '>', input['state'] == 2 ? _0xbdacx10 : [100, 100, 100, 155], this['fonts']['arrows'])
};
Renderer['Desync'] = function () {
    const _0xbdacx4 = screen_size[0],
        _0xbdacx5 = screen_size[1];
    const _0xbdacx2f = UI.GetValue(['Rage', 'Anti Aim', 'General', 'Key assignment', 'AA Direction inverter']);
    const _0xbdacx30 = Local.GetViewAngles()[1] - Local.GetRealYaw();
    const _0xbdacx31 = [192 - (Math['abs'](this['length']) * 71 / 60), 32 + (Math['abs'](this['length']) * 146 / 60), 28, 255];
    for (var _0xbdacx2 = 0; _0xbdacx2 < 6; _0xbdacx2++) {
        Render.Circle(_0xbdacx4 / 2, _0xbdacx5 / 2, 5 + _0xbdacx2, [10, 10, 10, 155])
    };
    if (_0xbdacx2f) {
        Render.Arc(_0xbdacx4 / 2, _0xbdacx5 / 2, 10, 5, 270, 180, 18, _0xbdacx31)
    } else {
        Render.Arc(_0xbdacx4 / 2, _0xbdacx5 / 2, 10, 5, 90, 180, 18, _0xbdacx31)
    };
    Render.Arc(_0xbdacx4 / 2, _0xbdacx5 / 2, 20, 16, _0xbdacx30 - 135, 45, 24, _0xbdacx31)
};
Renderer['Mode'] = function () {
    const _0xbdacx4 = screen_size[0] / 2,
        _0xbdacx5 = screen_size[1] / 2 + 10;
    const _0xbdacx10 = UI.GetColor(aa_mode_clr);
    const _0xbdacx32 = UI.GetValue(modules);
    if (_0xbdacx32 & (1 << 1)) {
        _0xbdacx5 += 25
    };
    Render.OutlineString(_0xbdacx4, _0xbdacx5, 1, input['state'] ? 'MANUAL AA' : 'TACO YAW', _0xbdacx10, Renderer['fonts']['antiaim']);
    Render.OutlineString(_0xbdacx4, _0xbdacx5 + 15, 1, (this['length']['toFixed'](0)).toString(), _0xbdacx10, Renderer['fonts']['antiaim_small']);
    Render.Circle(_0xbdacx4 + 8, _0xbdacx5 + 17, 1, _0xbdacx10)
};
Renderer['Others'] = function () {
    const _0xbdacx4 = screen_size[0] / 2,
        _0xbdacx5 = screen_size[1] / 2 + 15;
    const _0xbdacx33 = UI.GetColor(others_active_clr),
        _0xbdacx34 = UI.GetColor(others_active_clr2),
        _0xbdacx35 = UI.GetColor(others_active_clr3);
    const _0xbdacx32 = UI.GetValue(modules);
    if (_0xbdacx32 & (1 << 1)) {
        _0xbdacx5 += 25
    };
    if (_0xbdacx32 & (1 << 2)) {
        _0xbdacx5 += 25
    };
    const _0xbdacx36 = Entity.GetEnemies();
    const _0xbdacx37 = UI.GetValue(['Rage', 'Exploits', 'General', 'Double tap']) && UI.GetValue(['Rage', 'Exploits', 'Keys', 'Key assignment', 'Double tap']);
    const _0xbdacx38 = UI.GetValue(['Rage', 'Exploits', 'General', 'Hide shots']) && UI.GetValue(['Rage', 'Exploits', 'Keys', 'Key assignment', 'Hide shots']);
    const _0xbdacx39 = Exploit.GetCharge();
    const _0xbdacx3a = UI.GetValue(['Rage', 'Anti Aim', 'Directions', 'At targets']);
    var _0xbdacx3b = true;
    const _0xbdacxa = Math['sin'](Globals.Tickcount() * Globals.TickInterval() * 4) * 127 + 128;
    for (var _0xbdacx2 = 0; _0xbdacx2 < _0xbdacx36['length']; _0xbdacx2++) {
        if (!Entity.IsDormant(_0xbdacx36[_0xbdacx2])) {
            _0xbdacx3b = false;
            break
        }
    };
    const _0xbdacx3c = _0xbdacx37 ? 'DT' : 'DT';
    Render.OutlineString(_0xbdacx4, _0xbdacx5 + 10, 1, _0xbdacx3b ? 'DORMANT' : 'REVERSED', _0xbdacx33, Renderer['fonts']['misc']);
    Render.OutlineString(_0xbdacx4, _0xbdacx5 + 20, 1, _0xbdacx3a ? 'TARGET' : 'EYE', _0xbdacx34, Renderer['fonts']['misc']);
    Render.OutlineString(_0xbdacx4, _0xbdacx5, 1, _0xbdacx3a ? 'OPPOSITE' : 'OPPOSITE', [250, 128, 114, _0xbdacxa], Renderer['fonts']['misc']);
    if (_0xbdacx38) {
        Render.OutlineString(_0xbdacx4, _0xbdacx5 + 30, 1, 'HIDESHOTS', _0xbdacx35, Renderer['fonts']['misc'])
    };
    Render.OutlineString(_0xbdacx4, _0xbdacx5 + 30 + (_0xbdacx38 ? 10 : 0), 1, _0xbdacx3c, _0xbdacx37 ? [255 - _0xbdacx39 * 255, _0xbdacx39 * 255, 0, 225] : [255, 0, 0, 255], Renderer['fonts']['misc'])
};

function onDraw() {
    if (Renderer['setup_fonts']) {
        Renderer['setup_fonts'] = false;
        Renderer['fonts']['arrows'] = Render.AddFont('verdanab', 20, 0);
        Renderer['fonts']['antiaim'] = Render.AddFont('verdanab', 9, 0);
        Renderer['fonts']['antiaim_small'] = Render.AddFont('verdanab', 8, 0);
        Renderer['fonts']['misc'] = Render.AddFont('seguisb', 8, 0)
    };
    const _0xbdacx32 = UI.GetValue(modules);
    Renderer['length'] = Normalize(Local.GetRealYaw() - Local.GetFakeYaw()) / 2;
    screen_size = Render.GetScreenSize();
    if (_0xbdacx32 & (1 << 0)) {
        Renderer.Arrows()
    };
    if (_0xbdacx32 & (1 << 1)) {
        Renderer.Desync()
    };
    if (_0xbdacx32 & (1 << 2)) {
        Renderer.Mode()
    };
    if (_0xbdacx32 & (1 << 3)) {
        Renderer.Others()
    }
}
var input = {
    state: 0,
    left: false,
    right: false,
    back: false
};

function onCreateMove() {
    const _0xbdacx40 = UI.GetValue(left),
        _0xbdacx41 = UI.GetValue(right),
        _0xbdacx42 = UI.GetValue(back);
    if (_0xbdacx40 == input['left'] && _0xbdacx41 == input['right'] && _0xbdacx42 == input['back']) {
        return
    };
    input['left'] = _0xbdacx40;
    input['right'] = _0xbdacx41;
    input['back'] = _0xbdacx42;
    if ((input['left'] && input['state'] == 1) || (input['right'] && input['state'] == 2)) {
        input['state'] = 0;
        UI.SetValue(ref_yaw_offset, 0);
        return
    };
    if (input['back'] && input['state'] != 0) {
        input['state'] = 0;
        UI.SetValue(ref_yaw_offset, 0)
    };
    if (input['left'] && input['state'] != 1) {
        input['state'] = 1;
        UI.SetValue(ref_yaw_offset, -90)
    };
    if (input['right'] && input['state'] != 2) {
        input['state'] = 2;
        UI.SetValue(ref_yaw_offset, 90)
    }
}
Cheat.RegisterCallback('Draw', 'onDraw');
Cheat.RegisterCallback('CreateMove', 'onCreateMove')