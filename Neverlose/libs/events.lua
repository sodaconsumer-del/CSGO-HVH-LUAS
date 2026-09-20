local reloaded_0_0 = ffi.cast("void**", ffi.cast("char*", utils.opcode_scan("client.dll", "B9 ? ? ? ? 8B 40 38 FF D0 84 C0 0F 85") or error("invalid signature")) + 1)[0]
local reloaded_0_1 = ffi.typeof("\tstruct {\n\t\tvoid*\tvtbl;\n\t\tint\t\tcommand_number;\n\t\tint\t\ttick_count;\n\t\tfloat\tviewangles[3];\n\t\tfloat\taimdirection[3];\n\t\tfloat\tforwardmove;\n\t\tfloat\tsidemove;\n\t\tfloat\tupmove;\n\t\tunion {\n\t\t\tstruct {\n\t\t\t\tunsigned in_attack : 1;\n\t\t\t\tunsigned in_jump : 1;\n\t\t\t\tunsigned in_duck : 1;\n\t\t\t\tunsigned in_forward : 1;\n\t\t\t\tunsigned in_back : 1;\n\t\t\t\tunsigned in_use : 1;\n\t\t\t\tunsigned in_cancel : 1;\n\t\t\t\tunsigned in_left : 1;\n\t\t\t\tunsigned in_right : 1;\n\t\t\t\tunsigned in_moveleft : 1;\n\t\t\t\tunsigned in_moveright : 1;\n\t\t\t\tunsigned in_attack2 : 1;\n\t\t\t\tunsigned in_run : 1;\n\t\t\t\tunsigned in_reload : 1;\n\t\t\t\tunsigned in_alt1 : 1;\n\t\t\t\tunsigned in_alt2 : 1;\n\t\t\t\tunsigned in_score : 1;\n\t\t\t\tunsigned in_speed : 1;\n\t\t\t\tunsigned in_walk : 1;\n\t\t\t\tunsigned in_zoom : 1;\n\t\t\t\tunsigned in_weapon1 : 1;\n\t\t\t\tunsigned in_weapon2 : 1;\n\t\t\t\tunsigned in_bullrush : 1;\n\t\t\t\tunsigned in_grenade1 : 1;\n\t\t\t\tunsigned in_grenade2 : 1;\n\t\t\t\tunsigned in_attack3 : 1;\n\t\t\t} bits;\n\t\t\tint int_value;\n\t\t} buttons;\n\t\tchar\timpulse;\n\t\tint\t\tweaponselect;\n\t\tint\t\tweaponsubtype;\n\t\tint\t\trandom_seed;\n\t\tshort\tmousedx;\n\t\tshort\tmousedy;\n\t\tbool\thasbeenpredicted;\n\t}\n")
local reloaded_0_2 = ffi.typeof("\tstruct {\n\t\tint tick_count;\n\t\t/*int buttons;\n\t\tunsigned in_attack : 1;\n\t\tunsigned in_jump : 1;\n\t\tunsigned in_duck : 1;\n\t\tunsigned in_forward : 1;\n\t\tunsigned in_back : 1;\n\t\tunsigned in_use : 1;\n\t\tunsigned in_cancel : 1;\n\t\tunsigned in_left : 1;\n\t\tunsigned in_right : 1;\n\t\tunsigned in_moveleft : 1;\n\t\tunsigned in_moveright : 1;\n\t\tunsigned in_attack2 : 1;\n\t\tunsigned in_run : 1;\n\t\tunsigned in_reload : 1;\n\t\tunsigned in_alt1 : 1;\n\t\tunsigned in_alt2 : 1;\n\t\tunsigned in_score : 1;\n\t\tunsigned in_speed : 1;\n\t\tunsigned in_walk : 1;\n\t\tunsigned in_zoom : 1;\n\t\tunsigned in_weapon1 : 1;\n\t\tunsigned in_weapon2 : 1;\n\t\tunsigned in_bullrush : 1;\n\t\tunsigned in_grenade1 : 1;\n\t\tunsigned in_grenade2 : 1;\n\t\tunsigned in_attack3 : 1;*/\n\t}\n")
local reloaded_0_3 = ffi.new(reloaded_0_2)
local reloaded_0_4 = utils.get_vfunc(8, "$*(__thiscall*)(void*, int, int)", reloaded_0_1)

events.createmove(function(arg_1_0)
	local reloaded_1_0 = reloaded_0_4(reloaded_0_0, 0, arg_1_0.command_number)
	local reloaded_1_1 = {
		tick_count = reloaded_1_0.tick_count
	}

	events.setup_command:call(reloaded_1_1)

	reloaded_1_0.tick_count = reloaded_1_1.tick_count
end)
events.createmove_run(function(arg_2_0)
	local reloaded_2_0 = reloaded_0_4(reloaded_0_0, 0, arg_2_0.command_number)
	local reloaded_2_1 = {
		tick_count = reloaded_2_0.tick_count
	}

	events.run_command:call(reloaded_2_1)

	reloaded_2_0.tick_count = reloaded_2_1.tick_count
end)

events.pre_update_client_side_animation = events.pre_update_clientside_animation
events.post_update_client_side_animation = events.post_update_clientside_animation

return events
