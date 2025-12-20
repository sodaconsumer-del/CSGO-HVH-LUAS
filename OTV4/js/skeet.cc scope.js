const global_choked_commands = Globals.ChokedCommands, global_realtime = Globals.Realtime, global_frametime = Globals.Frametime, global_curtime = Globals.Curtime, global_tick_interval = Globals.TickInterval, global_tickrate = Globals.Tickrate, global_tickcount = Globals.Tickcount, global_frame_stage = Globals.FrameStage, ui_get_menu_position = UI.GetMenuPosition, ui_update_list = UI.UpdateList, ui_remove_item = UI.RemoveItem, ui_get_hotkey = UI.GetHotkey, ui_set_hotkey_state = UI.SetHotkeyState, ui_get_hotkey_state = UI.GetHotkeyState, ui_toggle_hotkey = UI.ToggleHotkey, ui_set_color = UI.SetColor, ui_add_sub_tab = UI.AddSubTab, ui_add_textbox = UI.AddTextbox, ui_add_color_picker = UI.AddColorPicker, ui_add_multi_dropdown = UI.AddMultiDropdown, ui_add_dropdown = UI.AddDropdown, ui_add_hotkey = UI.AddHotkey, ui_add_slider_float = UI.AddSliderFloat, ui_add_slider_int = UI.AddSliderInt, ui_add_checkbox = UI.AddCheckbox, ui_set_value = UI.SetValue, ui_get_children = UI.GetChildren, ui_get_value = UI.GetValue, ui_get_string = UI.GetString, ui_get_color = UI.GetColor, ui_is_menu_open = UI.IsMenuOpen, ui_set_enabled = UI.SetEnabled, entity_draw_flag = Entity.DrawFlag, entity_get_ccs_weapon_info = Entity.GetCCSWeaponInfo, entity_get_render_box = Entity.GetRenderBox, entity_get_weapons = Entity.GetWeapons, entity_get_entities_by_class_id = Entity.GetEntitiesByClassID, entity_get_hitbox_position = Entity.GetHitboxPosition, entity_get_eye_position = Entity.GeteyePosition, entity_get_game_rules_proxy = Entity.GetGameRulesProxy, entity_is_bot = Entity.IsBot, entity_get_weapon = Entity.GetWeapon, entity_set_prop = Entity.SetProp, entity_get_prop = Entity.GetProp, entity_get_render_origin = Entity.GetRenderOrigin, entity_get_name = Entity.GetName, entity_get_class_name = Entity.GetClassName, entity_get_class_id = Entity.GetClassID, entity_is_dormant = Entity.IsDormant, entity_is_alive = Entity.IsAlive, entity_is_valid = Entity.IsValid, entity_is_local_player = Entity.IsLocalPlayer, entity_is_enemy = Entity.IsEnemy, entity_is_teammate = Entity.IsTeammate, entity_get_entity_from_user_id = Entity.GetEntityFromUserID, entity_get_local_player = Entity.GetLocalPlayer, entity_get_teammates = Entity.GetTeammates, entity_get_enemies = Entity.GetEnemies, entity_get_players = Entity.GetPlayers, entity_get_entities = Entity.GetEntities, render_text_size = Render.TextSize, render_string = Render.String, render_filled_circle = Render.FilledCircle, render_textured_rect = Render.TexturedRect, render_add_texture = Render.AddTexture, render_find_font = Render.FindFont, render_add_font = Render.AddFont, render_polygon = Render.Polygon, render_gradient_rect = Render.GradientRect, render_get_screen_size = Render.GetScreenSize, render_world_to_screen = Render.WorldToScreen, render_circle = Render.Circle, render_filled_rect = Render.FilledRect, render_rect = Render.Rect, render_line = Render.Line, convar_set_string = Convar.SetString, convar_get_string = Convar.GetString, convar_set_float = Convar.SetFloat, convar_get_float = Convar.GetFloat, convar_set_int = Convar.SetInt, convar_get_int = Convar.GetInt, event_get_string = Event.GetString, event_get_float = Event.GetFloat, event_get_int = Event.GetInt, trace_raw_line = Trace.RawLine, trace_smoke = Trace.Smoke, trace_bullet = Trace.Bullet, trace_line = Trace.Line, usercmd_get_movement = UserCMD.GetMovement, usercmd_set_view_angles = UserCMD.SetViewAngles, usercmd_send = UserCMD.Send, usercmd_choke = UserCMD.Choke, usercmd_set_buttons = UserCMD.SetButtons, usercmd_get_buttons = UserCMD.GetButtons, usercmd_set_movement = UserCMD.SetMovement, sound_stop_microphone = Sound.StopMicrophone, sound_play_microphone = Sound.PlayMicrophone, sound_play = Sound.Play, local_get_inaccuracy = Local.GetInaccuracy, local_get_spread = Local.GetSpread, local_get_fake_yaw = Local.GetFakeYaw, local_get_real_yaw = Local.GetRealYaw, local_set_clan_tag = Local.SetClanTag, local_set_view_angles = Local.SetViewAngles, local_get_view_angles = Local.GetViewAngles, local_latency = Local.Latency, cheat_is_legit_config_active = Cheat.IsLegitConfigActive, cheat_is_rage_config_active = Cheat.IsRageConfigActive, cheat_get_username = Cheat.GetUsername, cheat_print_chat = Cheat.PrintChat, cheat_register_callback = Cheat.RegisterCallback, cheat_execute_command = Cheat.ExecuteCommand, cheat_print_color = Cheat.PrintColor, cheat_print = Cheat.Print, input_force_cursor = Input.ForceCursor, input_get_cursor_position = Input.GetCursorPosition, input_is_key_pressed = Input.IsKeyPressed, world_get_server_string = World.GetServerString, world_get_map_name = World.GetMapName, antiaim_set_lby_offset = AntiAim.SetLBYOffset, antiaim_set_real_offset = AntiAim.SetRealOffset, antiaim_set_fake_offset = AntiAim.SetFakeOffset, antiaim_get_override = AntiAim.GetOverride, antiaim_set_override = AntiAim.SetOverride, exploit_override_tolerance = Exploit.OverrideTolerance, exploit_override_shift = Exploit.OverrideShift, exploit_enable_recharge = Exploit.EnableRecharge, exploit_disable_recharge = Exploit.DisableRecharge, exploit_recharge = Exploit.Recharge, exploit_get_charge = Exploit.GetCharge, ragebot_get_targets = Ragebot.GetTargets, ragebot_ignore_target = Ragebot.IgnoreTarget, ragebot_force_hitbox_safety = Ragebot.ForceHitboxSafety, ragebot_force_target_minimum_damage = Ragebot.ForceTargetMinimumDamage, ragebot_force_target_hitchance = Ragebot.ForceTargetHitchance, ragebot_force_target_safety = Ragebot.ForceTargetSafety, ragebot_force_target = Ragebot.ForceTarget, ragebot_get_target = Ragebot.GetTarget, material_refresh = Material.Refresh, material_set_key_value = Material.SetKeyValue, material_get = Material.Get, material_destroy = Material.Destroy, material_create = Material.Create;

var screen_size = render_get_screen_size();
var sv_cheats_cache = 0;
var removals_cache = 0;

ui_add_sub_tab(["Config", "SUBTAB_MGR"], "Custom scope overlay");
ui_add_checkbox(["Config", "Custom scope overlay", "Custom scope overlay"], "Custom scope lines");
ui_add_color_picker(["Config", "Custom scope overlay", "Custom scope overlay"], "Scope lines color");
ui_add_slider_int(["Config", "Custom scope overlay", "Custom scope overlay"], "Scope lines height", 0, 500);
ui_add_slider_int(["Config", "Custom scope overlay", "Custom scope overlay"], "Scope lines offset", 0, 500);

function get_weapon(entity) {
    if (entity_get_name(entity_get_weapon(entity)) == 'g3sg1' || entity_get_name(entity_get_weapon(entity)) == 'scar 20') return 'auto';
    else if (entity_get_name(entity_get_weapon(entity)) == 'awp') return 'awp';
    else if (entity_get_name(entity_get_weapon(entity)) == 'desert eagle') return 'deagle';
    else if (entity_get_name(entity_get_weapon(entity)) == 'r8 revolver') return 'revolver';
    else if (entity_get_name(entity_get_weapon(entity)) == 'ssg 08') return 'scout';
    else return 'other';
}

function set_dropdown_value(value, index, enable) /*credits to ed*/ {
    var mask = 1 << index;
    return enable ? (value | mask) : (value & ~mask);
}

function draw() {
    var local_player = entity_get_local_player();

    if (entity_is_alive(local_player))
    {
        if (ui_get_value(["Config", "Custom scope overlay", "Custom scope overlay", "Custom scope lines"])) {
            var scoped = entity_get_prop(local_player, "CCSPlayer", "m_bIsScoped");
            var offset = ui_get_value(["Config", "Custom scope overlay", "Custom scope overlay", "Scope lines offset"]);
            var height = ui_get_value(["Config", "Custom scope overlay", "Custom scope overlay", "Scope lines height"]);
            var color = ui_get_color(["Config", "Custom scope overlay", "Custom scope overlay", "Scope lines color"]);
            sv_cheats_cache = ui_get_value(["Misc.", "Helpers", "Client", "Force sv_cheats"]);
            removals_cache = ui_get_value(["Visuals", "Extra", "Removals", "Removals"]);
            if (scoped) {
                if (get_weapon(local_player) == "auto" || get_weapon(local_player) == "awp"  || get_weapon(local_player) == "scout") {
                    ui_set_value(["Misc.", "Helpers", "Client", "Force sv_cheats"], 1);
                    convar_set_float("r_drawvgui", 0);
                    ui_set_value(["Visuals", "Extra", "Removals", "Removals"], set_dropdown_value(removals_cache, 2, false));
                    render_gradient_rect(screen_size[0] / 2 + offset, screen_size[1] / 2, height, 1, 1, [color[0], color[1], color[2], color[3]], [color[0], color[1], color[2], 0]);
                    render_gradient_rect(screen_size[0] / 2 - height - offset, screen_size[1] / 2, height, 1, 1, [color[0], color[1], color[2], 0], [color[0], color[1], color[2], color[3]]);
                    render_gradient_rect(screen_size[0] / 2, screen_size[1] / 2 + offset, 1, height, 0, [color[0], color[1], color[2], color[3]], [color[0], color[1], color[2], 0]);
                    render_gradient_rect(screen_size[0] / 2, screen_size[1] / 2 - height - offset, 1, height, 0, [color[0], color[1], color[2], 0], [color[0], color[1], color[2], color[3]]);
                }
            } if (!scoped) {
                convar_set_float("r_drawvgui", 1);
                ui_set_value(["Misc.", "Helpers", "Client", "Force sv_cheats"], 1);
                ui_set_value(["Visuals", "Extra", "Removals", "Removals"], set_dropdown_value(removals_cache, 2, true));
            }
        }
    } else {
        convar_set_float("r_drawvgui", 1);
    }
}

function unload() {
    convar_set_float("r_drawvgui", 1);
    ui_set_value(["Visuals", "Extra", "Removals", "Removals"], set_dropdown_value(removals_cache, 2, true));
    ui_set_value(["Misc.", "Helpers", "Client", "Force sv_cheats"], sv_cheats_cache);
}

cheat_register_callback("Unload", "unload");
cheat_register_callback("Draw", "draw");