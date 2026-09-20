local anti_aim_state = {}

anti_aim_state.FLAGS = {
    ON_GROUND = 257,
    DUCKING = 263,
    IN_AIR = 256,
    IN_AIR_DUCKING = 262,
}

anti_aim_state.STATES = {
    STAND = 1,
    WALK = 2,
    SLOW_WALK = 3,
    DUCK = 4,
    AIR = 5,
    AIR_DUCK = 6,
}

function anti_aim_state.anti_aim_states()
    local lp = entity.get_local_player()
    if not lp then
        return false
    end
    local velocity = lp.m_vecVelocity:length2d()
    local flags = lp.m_fFlags

    local state_table = {
        [anti_aim_state.FLAGS.ON_GROUND] = {
            [velocity < 3] = anti_aim_state.STATES.STAND,
            [velocity > 3 and velocity < 81] = anti_aim_state.STATES.SLOW_WALK,
            [velocity > 81] = anti_aim_state.STATES.WALK,
        },
        [anti_aim_state.FLAGS.DUCKING] = anti_aim_state.STATES.DUCK,
        [anti_aim_state.FLAGS.IN_AIR] = anti_aim_state.STATES.AIR,
        [anti_aim_state.FLAGS.IN_AIR_DUCKING] = anti_aim_state.STATES.AIR_DUCK,
    }

    local state = state_table[flags]
    if state then
        if type(state) == "table" then
            for condition, value in pairs(state) do
                if condition then
                    return value
                end
            end
        else
            return state
        end
    end
end

return anti_aim_state