local ffi = require "ffi"

local CCSWeaponInfo_t = ffi.typeof [[
    struct {
        char         __pad_0x0000[4];                       // 0x0000
        char*        console_name;                          // 0x0004
        char         __pad_0x0008[12];                      // 0x0008
        int          primary_clip_size;                     // 0x0014
        int          secondary_clip_size;                   // 0x0018
        int          primary_default_clip_size;             // 0x001c
        int          secondary_default_clip_size;           // 0x0020
        int          primary_reserve_ammo_max;              // 0x0024
        int          secondary_reserve_ammo_max;            // 0x0028
        char*        model_world;                           // 0x002c
        char*        model_player;                          // 0x0030
        char*        model_dropped;                         // 0x0034
        char*        sound_empty;                           // 0x0038
        char*        sound_single_shot;                     // 0x003c
        char*        sound_single_shot_accurate;            // 0x0040
        char         __pad_0x0044[12];                      // 0x0044
        char*        sound_burst;                           // 0x0050
        char*        sound_reload;                          // 0x0054
        char         __pad_0x0058[16];                      // 0x0058
        char*        sound_special1;                        // 0x0068
        char*        sound_special2;                        // 0x006c
        char*        sound_special3;                        // 0x0070
        char         __pad_0x0074[4];                       // 0x0074
        char*        sound_nearlyempty;                     // 0x0078
        char         __pad_0x007c[4];                       // 0x007c
        char*        primary_ammo;                          // 0x0080
        char*        secondary_ammo;                        // 0x0084
        char*        item_name;                             // 0x0088
        char*        item_class;                            // 0x008c
        bool         itemflag_exhaustible;                  // 0x0090
        bool         model_right_handed;                    // 0x0091
        bool         is_melee_weapon;                       // 0x0092
        char         __pad_0x0093[9];                       // 0x0093
        int          weapon_weight;                         // 0x009c
        char         __pad_0x00a0[8];                       // 0x00a0
        int          item_gear_slot_position;               // 0x00a8
        char         __pad_0x00ac[28];                      // 0x00ac
        int          weapon_type_int;                       // 0x00c8
        char         __pad_0x00cc[4];                       // 0x00cc
        int          in_game_price;                         // 0x00d0
        int          kill_award;                            // 0x00d4
        char*        player_animation_extension;            // 0x00d8
        float        cycletime;                             // 0x00dc
        float        cycletime_alt;                         // 0x00e0
        float        time_to_idle;                          // 0x00e4
        float        idle_interval;                         // 0x00e8
        bool         is_full_auto;                          // 0x00ec
        char         __pad_0x00ed[3];                       // 0x00ed
        int          damage;                                // 0x00f0
        float        headshot_multiplier;                   // 0x00f4
        float        armor_ratio;                           // 0x00f8
        int          bullets;                               // 0x00fc
        float        penetration;                           // 0x0100
        float        flinch_velocity_modifier_large;        // 0x0104
        float        flinch_velocity_modifier_small;        // 0x0108
        float        range;                                 // 0x010c
        float        range_modifier;                        // 0x0110
        float        throw_velocity;                        // 0x0114
        char         __pad_0x0118[12];                      // 0x0118
        int          has_silencer;                          // 0x0124
        char         __pad_0x0128[4];                       // 0x0128
        int          crosshair_min_distance;                // 0x012c
        int          crosshair_delta_distance;              // 0x0130
        float        max_player_speed;                      // 0x0134
        float        max_player_speed_alt;                  // 0x0138
        float        attack_movespeed_factor;               // 0x013c
        float        spread;                                // 0x0140
        float        spread_alt;                            // 0x0144
        float        inaccuracy_crouch;                     // 0x0148
        float        inaccuracy_crouch_alt;                 // 0x014c
        float        inaccuracy_stand;                      // 0x0150
        float        inaccuracy_stand_alt;                  // 0x0154
        float        inaccuracy_jump_initial;               // 0x0158
        float        inaccuracy_jump_apex;                  // 0x015c
        float        inaccuracy_jump;                       // 0x0160
        float        inaccuracy_jump_alt;                   // 0x0164
        float        inaccuracy_land;                       // 0x0168
        float        inaccuracy_land_alt;                   // 0x016c
        float        inaccuracy_ladder;                     // 0x0170
        float        inaccuracy_ladder_alt;                 // 0x0174
        float        inaccuracy_fire;                       // 0x0178
        float        inaccuracy_fire_alt;                   // 0x017c
        float        inaccuracy_move;                       // 0x0180
        float        inaccuracy_move_alt;                   // 0x0184
        float        inaccuracy_reload;                     // 0x0188
        int          recoil_seed;                           // 0x018c
        float        recoil_angle;                          // 0x0190
        float        recoil_angle_alt;                      // 0x0194
        float        recoil_angle_variance;                 // 0x0198
        float        recoil_angle_variance_alt;             // 0x019c
        float        recoil_magnitude;                      // 0x01a0
        float        recoil_magnitude_alt;                  // 0x01a4
        float        recoil_magnitude_variance;             // 0x01a8
        float        recoil_magnitude_variance_alt;         // 0x01ac
        int          spread_seed;                           // 0x01b0
        float        recovery_time_crouch;                  // 0x01b4
        float        recovery_time_stand;                   // 0x01b8
        float        recovery_time_crouch_final;            // 0x01bc
        float        recovery_time_stand_final;             // 0x01c0
        int          recovery_transition_start_bullet;      // 0x01c4
        int          recovery_transition_end_bullet;        // 0x01c8
        bool         unzoom_after_shot;                     // 0x01cc
        bool         hide_view_model_zoomed;                // 0x01cd
        char         __pad_0x01ce[2];                       // 0x01ce
        int          zoom_levels;                           // 0x01d0
        int          zoom_fov_1;                            // 0x01d4
        int          zoom_fov_2;                            // 0x01d8
        int          zoom_time_0;                           // 0x01dc
        int          zoom_time_1;                           // 0x01e0
        int          zoom_time_2;                           // 0x01e4
        char*        addon_location;                        // 0x01e8
        char         __pad_0x01ec[4];                       // 0x01ec
        float        addon_scale;                           // 0x01f0
        char*        eject_brass_effect;                    // 0x01f4
        char*        tracer_effect;                         // 0x01f8
        int          tracer_frequency;                      // 0x01fc
        int          tracer_frequency_alt;                  // 0x0200
        char*        muzzle_flash_effect_1st_person;        // 0x0204
        char*        muzzle_flash_effect_1st_person_alt;    // 0x0208
        char*        muzzle_flash_effect_3rd_person;        // 0x020c
        char*        muzzle_flash_effect_3rd_person_alt;    // 0x0210
        char*        heat_effect;                           // 0x0214
        float        heat_per_shot;                         // 0x0218
        char*        zoom_in_sound;                         // 0x021c
        char*        zoom_out_sound;                        // 0x0220
        char         __pad_0x0224[4];                       // 0x0224
        float        inaccuracy_alt_sound_threshold;        // 0x0228
        float        bot_audible_range;                     // 0x022c
        char         __pad_0x0230[12];                      // 0x0230
        bool         has_burst_mode;                        // 0x023c
        bool         is_revolver;                           // 0x023d
        char         __pad_0x023e[2];                       // 0x023e
    }
]]

---@format disable-next
local struct_keys = {"console_name", "primary_clip_size", "secondary_clip_size", "primary_default_clip_size", "secondary_default_clip_size", "primary_reserve_ammo_max", "secondary_reserve_ammo_max", "model_world", "model_player", "model_dropped", "sound_empty", "sound_single_shot", "sound_single_shot_accurate", "sound_burst", "sound_reload", "sound_special1", "sound_special2", "sound_special3", "sound_nearlyempty", "primary_ammo", "secondary_ammo", "item_name", "item_class", "itemflag_exhaustible", "model_right_handed", "is_melee_weapon", "weapon_weight", "item_gear_slot_position", "weapon_type_int", "in_game_price", "kill_award", "player_animation_extension", "cycletime", "cycletime_alt", "time_to_idle", "idle_interval", "is_full_auto", "damage", "armor_ratio", "bullets", "penetration", "flinch_velocity_modifier_large", "flinch_velocity_modifier_small", "range", "range_modifier", "throw_velocity", "has_silencer", "crosshair_min_distance", "crosshair_delta_distance", "max_player_speed", "max_player_speed_alt", "attack_movespeed_factor", "spread", "spread_alt", "inaccuracy_crouch", "inaccuracy_crouch_alt", "inaccuracy_stand", "inaccuracy_stand_alt", "inaccuracy_jump_initial", "inaccuracy_jump_apex", "inaccuracy_jump", "inaccuracy_jump_alt", "inaccuracy_land", "inaccuracy_land_alt", "inaccuracy_ladder", "inaccuracy_ladder_alt", "inaccuracy_fire", "inaccuracy_fire_alt", "inaccuracy_move", "inaccuracy_move_alt", "inaccuracy_reload", "recoil_seed", "recoil_angle", "recoil_angle_alt", "recoil_angle_variance", "recoil_angle_variance_alt", "recoil_magnitude", "recoil_magnitude_alt", "recoil_magnitude_variance", "recoil_magnitude_variance_alt", "spread_seed", "recovery_time_crouch", "recovery_time_stand", "recovery_time_crouch_final", "recovery_time_stand_final", "recovery_transition_start_bullet", "recovery_transition_end_bullet", "unzoom_after_shot", "hide_view_model_zoomed", "zoom_levels", "zoom_fov_1", "zoom_fov_2", "zoom_time_0", "zoom_time_1", "zoom_time_2", "addon_location", "addon_scale", "eject_brass_effect", "tracer_effect", "tracer_frequency", "tracer_frequency_alt", "muzzle_flash_effect_1st_person", "muzzle_flash_effect_1st_person_alt", "muzzle_flash_effect_3rd_person", "muzzle_flash_effect_3rd_person_alt", "heat_effect", "heat_per_shot", "zoom_in_sound", "zoom_out_sound", "inaccuracy_alt_sound_threshold", "bot_audible_range", "has_burst_mode", "is_revolver"}
---@format disable-next
local weapon_idx = {1, 2, 3, 4, 7, 8, 9, 10, 11, 13, 14, 16, 17, 19, 20, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 55, 56, 57, 59, 60, 61, 63, 64, 68, 69, 70, 72, 74, 75, 76, 78, 80, 81, 82, 83, 84, 85, 500, 503, 505, 506, 507, 508, 509, 512, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 525}

local weapon_types = {
    [0] = "knife",
    [1] = "pistol",
    [2] = "smg",
    [3] = "rifle",
    [4] = "shotgun",
    [5] = "sniperrifle",
    [6] = "machinegun",
    [7] = "c4",
    [9] = "grenade",
    [11] = "stackableitem",
    [12] = "fists",
    [13] = "breachcharge",
    [14] = "bumpmine",
    [15] = "tablet",
    [16] = "melee",
    [19] = "equipment"
}

local iweaponsystem = ffi.cast("void**", utils.opcode_scan("client.dll", "8B 35 CC CC CC CC FF 10 0F B7 C0", 2))[0]
local native_GetCSWeaponInfo = utils.get_vfunc(2, "$*(__thiscall*)(void*, unsigned int)", CCSWeaponInfo_t)

local cstr = ffi.typeof "char*"
local extract_field = function(val) return ffi.istype(cstr, val) and ffi.string(val) or val end

local js = panorama.loadstring([[
        return {
            get_weapon_info: (idx) => {
                const item = InventoryAPI.GetFauxItemIDFromDefAndPaintIndex(idx)

                return item && item > 0 ? InventoryAPI.BuildItemSchemaDefJSON(item): "null"
            },
            localize: (str) => {
                return $.Localize(str)
            }
        }
]], "CSGOMainMenu")()

local weapons, weapons_index = {}, {}

for x = 1, #weapon_idx do
    local idx = weapon_idx[x]
    local res = native_GetCSWeaponInfo(iweaponsystem, idx)
    if res == nil then break end

    local weapon = {}
    for y = 1, #struct_keys do
        local key = struct_keys[y]
        weapon[key] = extract_field(res[key])
    end

    weapon.idx = idx
    weapon.type = idx == 31 and "taser" or weapon_types[res.weapon_type_int]
    weapon.name = js.localize(weapon.item_name)
    weapon.raw = res

    weapon.schema = json.parse(js.get_weapon_info(idx))

    weapons[idx] = weapon
    weapons_index[weapon.console_name] = weapon
end

setmetatable(weapons, {
    __index = weapons_index,
    __metatable = false,
    __call = function(t, ent)
        if type(ent) ~= "userdata" or not ent:is_weapon() then return end

        return t[ent:get_weapon_index()]
    end
})

return weapons
