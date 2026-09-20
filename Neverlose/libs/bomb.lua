local reloaded_0_0 = {
	plant_percentage = 0
}
local reloaded_0_1 = 0
local reloaded_0_2
local reloaded_0_3 = 3.125
local reloaded_0_4 = -1

events.item_pickup:set(function(arg_1_0)
	if arg_1_0.item == "defuser" then
		reloaded_0_1 = reloaded_0_1 + 1
	end
end)
events.item_remove:set(function(arg_2_0)
	if arg_2_0.item == "defuser" and reloaded_0_1 >= 1 then
		reloaded_0_1 = reloaded_0_1 - 1
	end
end)

local function reloaded_0_5(arg_3_0)
	local reloaded_3_0 = arg_3_0:get_resource().m_bombsiteCenterA
	local reloaded_3_1 = arg_3_0:get_resource().m_bombsiteCenterB
	local reloaded_3_2 = arg_3_0:get_origin()

	return reloaded_3_2:dist(reloaded_3_0) < reloaded_3_2:dist(reloaded_3_1) and "A" or "B"
end

events.bomb_beginplant:set(function(arg_4_0)
	reloaded_0_2 = globals.curtime
	p_site = reloaded_0_5(entity.get(arg_4_0.userid, true))
end)

local function reloaded_0_6()
	reloaded_0_2 = nil
	reloaded_0_0.state = nil
end

events.round_start:set(reloaded_0_6)
events.bomb_abortplant:set(reloaded_0_6)
events.bomb_planted:set(reloaded_0_6)
events.render:set(function()
	if entity.get_local_player() ~= nil then
		if reloaded_0_2 ~= nil then
			local reloaded_6_0 = entity.get_game_rules()

			if reloaded_6_0.m_bBombPlanted == 1 then
				reloaded_0_0.state = nil

				return
			end

			local reloaded_6_1

			reloaded_6_1 = reloaded_0_2 + reloaded_0_3 < reloaded_6_0.m_fRoundStartTime + reloaded_6_0.m_iRoundTime

			local reloaded_6_2 = p_site
			local reloaded_6_3 = (globals.curtime - reloaded_0_2) / reloaded_0_3

			reloaded_0_0.plant_percentage = reloaded_6_3
			reloaded_0_0.state = false
			reloaded_0_0.site = reloaded_6_2
			reloaded_0_0.plant_time = math.floor((globals.curtime - reloaded_0_2) / reloaded_0_3 * 100)
		else
			reloaded_0_0.plant_time = 0

			local reloaded_6_4 = entity.get_entities("CPlantedC4", true)

			for iter_6_0 = 1, #reloaded_6_4 do
				local reloaded_6_5 = reloaded_6_4[iter_6_0]

				if not reloaded_6_5.m_bBombDefused then
					local reloaded_6_6 = (reloaded_6_5.m_flC4Blow - globals.curtime) * 10 / 10
					local reloaded_6_7 = reloaded_6_5.m_bBombDefused

					if reloaded_6_6 > 0.001 and not reloaded_6_7 then
						local reloaded_6_8 = reloaded_6_5.m_hBombDefuser ~= 4294967295
						local reloaded_6_9 = reloaded_6_5.m_flDefuseLength

						reloaded_0_4 = reloaded_6_8 and math.floor((reloaded_6_5.m_flDefuseCountDown - globals.curtime) * 128) / 128 or -1

						if reloaded_6_5.m_hBombDefuser ~= nil and reloaded_0_4 > 0 then
							local reloaded_6_10 = (render.screen_size().y - 50) / reloaded_6_9 * reloaded_0_4

							render.rect(vector(0, 0), vector(16, render.screen_size().y), color(25, 25, 25, 160))
							render.rect(vector(0, 0), vector(16, render.screen_size().y), color(25, 25, 25, 160))
							render.rect(vector(0, render.screen_size().y - reloaded_6_10), vector(16, render.screen_size().y), reloaded_6_6 > reloaded_0_4 and color(58, 191, 54, 160) or color(252, 18, 19, 125))
						end

						if reloaded_0_4 < 0 then
							reloaded_0_4 = -1
						end
					end

					local reloaded_6_11 = entity.get_local_player().m_hObserverTarget == nil and entity.get_local_player() or entity.get_local_player().m_hObserverTarget
					local reloaded_6_12 = reloaded_6_5.m_flC4Blow - globals.curtime
					local reloaded_6_13 = entity.get_entities("CPlantedC4", true)[1].m_nBombSite == 0 and "A" or "B"
					local reloaded_6_14 = reloaded_6_5:get_origin():dist(reloaded_6_11:get_origin())
					local reloaded_6_15 = 450.7
					local reloaded_6_16 = 75.68
					local reloaded_6_17 = 789.2
					local reloaded_6_18 = (reloaded_6_14 - reloaded_6_16) / reloaded_6_17
					local reloaded_6_19 = reloaded_6_15 * math.exp(-reloaded_6_18 * reloaded_6_18)

					if reloaded_6_11.m_ArmorValue == nil and true or reloaded_6_11.m_ArmorValue > 0 then
						local reloaded_6_20 = reloaded_6_19 * 0.5
						local reloaded_6_21 = (reloaded_6_19 - reloaded_6_20) * 0.5

						if reloaded_6_21 > entity.get_local_player().m_ArmorValue then
							armor = entity.get_local_player().m_ArmorValue * 2
							reloaded_6_20 = reloaded_6_19 - reloaded_6_21
						end

						reloaded_6_19 = reloaded_6_20
					end

					Dmg = reloaded_6_19 > reloaded_6_11.m_iHealth - 1 and "FATAL" or "-" .. math.floor(reloaded_6_19 - 1) .. " HP"

					if entity.get_entities("CPlantedC4", true) ~= nil and reloaded_6_12 < 0.01 ~= true and not reloaded_6_5.m_bBombDefused then
						reloaded_0_0.c4time = reloaded_6_12
						reloaded_0_0.site = reloaded_6_13
					end

					if entity.get_entities("CPlantedC4", true) ~= nil and reloaded_6_12 < -0.99 ~= true and reloaded_6_19 < 1 ~= true and not reloaded_6_5.m_bBombDefused then
						reloaded_0_0.dmg = Dmg
						reloaded_0_0.lethal = Dmg == "FATAL" and true or false
					end

					reloaded_0_0.state = true

					if entity.get_entities("CPlantedC4", true) == nil then
						reloaded_0_0.state = nil
					end

					if reloaded_6_12 < -1 then
						reloaded_0_0.state = nil
					end

					if reloaded_0_4 == 0 then
						reloaded_0_0.state = nil
					end
				end
			end
		end
	end
end)

return reloaded_0_0
