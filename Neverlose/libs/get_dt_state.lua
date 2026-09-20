function get_dt_state()
	local reloaded_1_0 = entity.get_local_player()

	if reloaded_1_0 ~= nil and reloaded_1_0:is_alive() then
		g_state = false

		if reloaded_1_0.m_hActiveWeapon ~= nil then
			attack, next_shot, shot_delay = reloaded_1_0.m_flNextAttack, reloaded_1_0.m_hActiveWeapon.m_flNextPrimaryAttack, reloaded_1_0.m_hActiveWeapon.m_flNextSecondaryAttack

			if attack ~= nil and next_shot ~= nil and shot_delay ~= nil then
				attack = attack + 0.5
				next_shot = next_shot + 0.5
				shot_delay = shot_delay + 0.5
			end
		end

		if ui.find("aimbot", "ragebot", "main", "double tap"):get() then
			if math.max(next_shot, shot_delay) < attack then
				if attack - globals.curtime > 0 then
					g_state = false
				else
					g_state = true
				end
			elseif math.max(next_shot, shot_delay) - globals.curtime > 0 then
				g_state = false
			elseif math.max(next_shot, shot_delay) - globals.curtime < 0 then
				g_state = true
			else
				g_state = true
			end
		end

		if rage.exploit:get() ~= 1 then
			g_state = false
		end
	end

	return g_state
end

return get_dt_state
