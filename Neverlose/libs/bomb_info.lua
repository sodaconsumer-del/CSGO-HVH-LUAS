local results = {}

local c4_info =
{
    last_site = "",
    last_beep = 0,
    last_beep_diff = 1,

    planting_site = nil,
    planting_started_at = nil,
    planting_player = nil,
    planting_time = 3.125,

    mp_c4timer = cvar.mp_c4timer,

    reset = function(self, e)
        self.planting_site = nil
        self.planting_player = nil
    end,

    beep = function(self, c)
        self.last_beep_diff = math.clamp(globals.curtime - self.last_beep, 0, 1)
        self.last_beep = globals.curtime
    end,

    begin_plant = function(self, e)
        local player_resource = entity.get_player_resource()

        if not player_resource then
            return
        end

        local center_a, center_b =
            player_resource.m_bombsiteCenterA,
            player_resource.m_bombsiteCenterB

        local site = entity.get(e.site)

        if not site then
            return
        end

        local mins, maxs =
            site.m_vecMins, site.m_vecMaxs

        local center = mins:lerp(maxs, 0.5)
        local distance_a, distance_b = center:distsqr(center_a), center:distsqr(center_b)

        self.planting_site = distance_b > distance_a and "A" or "B"
        self.planting_started_at = globals.curtime
        self.planting_player = entity.get(e.userid, true)

        self.last_site = self.planting_site
    end,

    damage_apply_armor = function(self, damage, armor_value)
        local armor_ratio = 0.5
        local armor_bonus = 0.5

        if armor_value > 0 then
            local flNew = damage * armor_ratio
            local flArmor = (damage - flNew) * armor_bonus

            if flArmor > armor_value then
                flArmor = armor_value * (1 / armor_bonus)
                flNew = damage - flArmor
            end

            damage = flNew
        end

        return damage
    end,

    calculate_damage = function(self, from_player, other, armor_value)
        local eye_position = from_player:get_eye_position()
        local distance = eye_position:dist(other:get_origin())

        local damage, fatal = 500, false
        local radius = damage * 3.5

        damage = damage * math.exp(-((distance * distance) / ((radius * 2 / 3) * (radius / 3))))
        damage = math.floor(self:damage_apply_armor(math.max(damage, 0), armor_value))

        return damage
    end,

    get_active_bomb = function(self, from_player)
        local curtime = globals.curtime
        local from_player = from_player or entity.get_local_player()

        local armor_value = from_player.m_ArmorValue
        local health = from_player.m_iHealth

        if self.planting_player then
            local plant_percentage = (curtime - self.planting_started_at) / self.planting_time

            if plant_percentage > 0 and plant_percentage < 1 then
                local game_rules = entity.get_game_rules()

                if game_rules.m_bBombPlanted == 1 then
                    return
                end

                results = {
                    type = 1,
                    site = self.planting_site,
                    percentage = plant_percentage,
                    damage = self:calculate_damage(from_player, self.planting_player, armor_value)
                }
            end
        else

            entity.get_entities("CPlantedC4", true, function(c4)
                if c4.m_bBombDefused then
                    return
                end

                local explodes_at = c4.m_flC4Blow

                local site = c4.m_nBombSite == 0 and "A" or "B"
                local time_left = explodes_at - globals.curtime

                if time_left >= 0 then
                    local time_for_defuse = false
                    local barlength = -1
                    local defuselength = c4.m_flDefuseLength
                    local defusetimer = math.floor((c4.m_flDefuseCountDown - globals.curtime)*10) / 10
                    if defusetimer > 0 then
                        time_for_defuse = math.floor(time_left) > defusetimer
                        barlength = (((render.screen_size().y - 50) / defuselength) * (defusetimer))
                    end

                    local fatal = false
                    local damage = self:calculate_damage(from_player, c4, armor_value)

                    if from_player:is_alive() then
                        if damage >= 1 then
                            if damage >= health then
                                fatal = true
                            end
                        end
                    end

                    results = {
                        type = 2,
                        entity = c4,
                        from = from_player,
                        site = site,
                        damage = damage or -1,
                        defusetimer = defusetimer,
                        time_left = explodes_at - curtime,
                        time_for_defuse = time_for_defuse,
                        barlength = barlength,
                    }

                    return false
                end
            end)
        end
    end,
}

events.bomb_beginplant:set(function(e) c4_info:begin_plant(e) end)
events.bomb_abortplant:set(function() c4_info:reset() end)
events.bomb_planted:set(function() c4_info:reset() end)
events.round_start:set(function() c4_info:reset() end)

return results