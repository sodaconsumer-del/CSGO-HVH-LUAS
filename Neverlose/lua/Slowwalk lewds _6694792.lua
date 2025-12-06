local group = ui.create("Slowwalk")
local slowwalk_slider = group:slider("Slowwalk Speed", 1, 50, 10, 1)
local set_slowwalk_speed = function(cmd)
    local player = entity.get_local_player()
	local slowwalk_speed = slowwalk_slider:get()
	local slowwalk_ref = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk")
	if not slowwalk_ref:get() then
		return
	end

	local min_speed = math.sqrt((cmd.forwardmove * cmd.forwardmove) + (cmd.sidemove * cmd.sidemove))
	if min_speed <= 0 then
		return
	end

	if player.m_fFlags == 262 or player.m_fFlags == 263 then
		slowwalk_speed = slowwalk_speed * 2.94117647
	end

	if min_speed <= slowwalk_speed then
		return
	end

	local speed_factor = slowwalk_speed / min_speed
	cmd.forwardmove = cmd.forwardmove * speed_factor
	cmd.sidemove = cmd.sidemove * speed_factor
end

local function is_local_player_alive()
    local player = entity.get_local_player()
	if player == nil then
		return false
	end

	if player.m_iHealth <= 0 then
		return false
	end
	return true
end

events.createmove:set(function(cmd)
	if not is_local_player_alive() then
		return
	end
	set_slowwalk_speed(cmd)
end)