local library = {}
library.__index = library

library.list = {}
library.new = function(name, start_value)
    if not library.list[name] then
        library.list[name] = start_value or 0 --- @note: by that you can create your animation variable in render function.
    end

    return setmetatable({name = name}, library)
end

--- @region: prepare animation functions
library.types = {
    LERP = 1,
    SINE3 = 2,

    IN_SINE = 3,
    OUT_SINE = 4,
    IN_OUT_SINE = 5,

    IN_CUBIC = 6,
    OUT_CUBIC = 7,
    IN_OUT_CUBIC = 8,

    IN_QUINT = 9,
    OUT_QUINT = 10,
    IN_OUT_QUINT = 11,
    
    IN_CIRC = 12,
    OUT_CIRC = 13,
    IN_OUT_CIRC = 14
}


library.animations = {
    --- @note: default
    [library.types.LERP] = function(start_value, final_value, time, minimum_delta)
        time = time or 0.095
        minimum_delta = minimum_delta or 1

        if math.abs(start_value - final_value) < minimum_delta then
            return final_value
        end
    
        time = math.clamp(globals.frametime * time * 175, 0.01, 1)
        return (final_value - start_value) * time + start_value
    end,

    [library.types.SINE3] = function(start_value, final_value, time, minimum_delta)
        time = time or 0.065
        minimum_delta = minimum_delta or 2

        if math.abs(start_value - final_value) < minimum_delta then
            return final_value
        end

        local delta = final_value - start_value
        return delta > 0 and (start_value + (math.sin(delta) ^ 3 + delta) * time) or (start_value - (math.sin(delta) ^ 3 - delta) * time)
    end,

    --- @note: from easings.net
    [library.types.IN_SINE] = function(start_value, final_value, time, minimum_delta)
        time = time or 0.2
        minimum_delta = minimum_delta or 1

        if math.abs(start_value - final_value) < minimum_delta then
            return final_value
        end

        time = math.clamp(globals.frametime * time * 175, 0.01, 1)
        return -(final_value - start_value) * math.cos(time * (math.pi / 2)) + (final_value - start_value) + start_value
    end,

    [library.types.OUT_SINE] = function(start_value, final_value, time, minimum_delta)
        time = time or 0.065
        minimum_delta = minimum_delta or 1

        if math.abs(start_value - final_value) < minimum_delta then
            return final_value
        end

        time = math.clamp(globals.frametime * time * 175, 0.01, 1)
        return (final_value - start_value) * math.sin(time * (math.pi / 2)) + start_value
    end,

    [library.types.IN_OUT_SINE] = function(start_value, final_value, time, minimum_delta)
        time = time or 0.095
        minimum_delta = minimum_delta or 0.1

        if math.abs(start_value - final_value) < minimum_delta then
            return final_value
        end

        time = math.clamp(globals.frametime * time * 175, 0.01, 1)
        return -(final_value - start_value) / 2 * (math.cos(math.pi * time) - 1) + start_value
    end,

    [library.types.IN_CUBIC] = function(start_value, final_value, time, minimum_delta)
        time = time or 0.5
        minimum_delta = minimum_delta or 0.1

        if math.abs(start_value - final_value) < minimum_delta then
            return final_value
        end

        time = math.clamp(globals.frametime * time * 175, 0.01, 1)
        return (final_value - start_value) * (time ^ 3) + start_value
    end,

    [library.types.OUT_CUBIC] = function(start_value, final_value, time, minimum_delta)
        time = time or 0.1
        minimum_delta = minimum_delta or 0.1

        if math.abs(start_value - final_value) < minimum_delta then
            return final_value
        end

        time = math.clamp(globals.frametime * time * 175, 0.01, 1)
        return (final_value - start_value) * ((time - 1) ^ 3 + 1) + start_value
    end,

    [library.types.IN_OUT_CUBIC] = function(start_value, final_value, time, minimum_delta)
        time = time or 0.3
        minimum_delta = minimum_delta or 0.1

        if math.abs(start_value - final_value) < minimum_delta then
            return final_value
        end

        time = math.clamp(globals.frametime * time * 175, 0.01, 1)
        time = time * 2

        if time < 1 then
            return (final_value - start_value) / 2 * (time ^ 3) + start_value
        else
            return (final_value - start_value) / 2 * ((time - 2) ^ 3 + 2) + start_value
        end
    end,

    [library.types.IN_QUINT] = function(start_value, final_value, time, minimum_delta)
        time = time or 0.75
        minimum_delta = minimum_delta or 1

        if math.abs(start_value - final_value) < minimum_delta then
            return final_value
        end

        time = math.clamp(globals.frametime * time * 175, 0.01, 1)
        return (final_value - start_value) * (time ^ 5) + start_value
    end,

    [library.types.OUT_QUINT] = function(start_value, final_value, time, minimum_delta)
        time = time or 0.01
        minimum_delta = minimum_delta or 1

        if math.abs(start_value - final_value) < minimum_delta then
            return final_value
        end

        time = math.clamp(globals.frametime * time * 175, 0.01, 1)
        return (final_value - start_value) * ((time - 1) ^ 5 + 1) + start_value
    end,

    [library.types.IN_OUT_QUINT] = function(start_value, final_value, time, minimum_delta)
        time = time or 0.35
        minimum_delta = minimum_delta or 0.5

        if math.abs(start_value - final_value) < minimum_delta then
            return final_value
        end

        time = math.clamp(globals.frametime * time * 175, 0.01, 1)
        time = time * 2

        if time < 1 then
            return (final_value - start_value) / 2 * (time ^ 5) + start_value
        else
            return (final_value - start_value) / 2 * ((time - 2) ^ 5 + 2) + start_value
        end
    end,

    [library.types.IN_CIRC] = function(start_value, final_value, time, minimum_delta)
        time = time or 0.5
        minimum_delta = minimum_delta or 1

        if math.abs(start_value - final_value) < minimum_delta then
            return final_value
        end

        time = math.clamp(globals.frametime * time * 175, 0.01, 1)
        return -(final_value - start_value) * (math.sqrt(1 - time ^ 2) - 1) + start_value
    end,

    [library.types.OUT_CIRC] = function(start_value, final_value, time, minimum_delta)
        time = time or 0.7
        minimum_delta = minimum_delta or 1

        if math.abs(start_value - final_value) < minimum_delta then
            return final_value
        end

        time = math.clamp(globals.frametime * time * 175, 0.01, 1)
        return (final_value - start_value) * (1 - math.sqrt(1 - time ^ 2)) + start_value
    end,

    [library.types.IN_OUT_CIRC] = function(start_value, final_value, time, minimum_delta)
        time = time or 0.3
        minimum_delta = minimum_delta or 1.2

        if math.abs(start_value - final_value) < minimum_delta then
            return final_value
        end

        time = math.clamp(globals.frametime * time * 175, 0.01, 1)
        time = time * 2

        if time < 1 then
            return -(final_value - start_value) / 2 * (math.sqrt(1 - time ^ 2) - 1) + start_value
        else
            return (final_value - start_value) / 2 * (math.sqrt(1 - (time - 2) ^ 2) + 1) + start_value
        end
    end
}
--- @endregion

function library:update(type, final_value, time, minimum_delta)
    self.list[self.name] = library.animations[type](self.list[self.name], final_value, time, minimum_delta)
    return math.floor(self.list[self.name])
end

function library:get()
    return self.list[self.name]
end
--- @endregion

--- @region: example
--[[
    local c_screen_size = render.screen_size() / 2
    events.render:set(function()
        local self = entity.get_local_player()
        if not self or not self:is_alive() then
            return
        end

        local first_x_value = library.new("First scope x-value", c_screen_size.x):update(library.types.IN_OUT_CIRC, self.m_bIsScoped and c_screen_size.x + 30 or c_screen_size.x)

        local second_x_value = library.new("Second scope x-value", c_screen_size.x - 35)
        second_x_value:update(library.types.IN_QUINT, self.m_bIsScoped and c_screen_size.x - 70 or c_screen_size.x - 35)

        local third_y_value = library.new("Third scope y-value", c_screen_size.y)
        local new_y_value = third_y_value:update(library.types.SINE3, self.m_bIsScoped and c_screen_size.y + 50 or c_screen_size.y)

        render.text(2, vector(first_x_value, c_screen_size.y + 30), color(), nil, "IDEAL YAW")
        render.text(2, vector(second_x_value:get(), c_screen_size.y + 30), color(), nil, "IDEAL YAW")
        render.text(2, vector(first_x_value, new_y_value), color(), nil, "IDEAL YAW")
    end)
]]
--- @endregion

return library