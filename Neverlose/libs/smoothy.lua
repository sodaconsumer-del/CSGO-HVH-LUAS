local native_GetTimescale = utils.get_vfunc('engine.dll', 'VEngineClient014', 91, 'float(__thiscall*)(void*)')

local to_pairs = {
    vector = { 'x', 'y', 'z' },
    imcolor =  { 'r', 'g', 'b', 'a' }
}

local function get_type(value)
    local val_type = type(value)

    if val_type == 'userdata' and value.__type then
        return string.lower(value.__type.name)
    end

    if val_type == 'boolean' then
        value = value and 1 or 0
    end

    return val_type
end

local function copy_tables(destination, keysTable, valuesTable)
    valuesTable = valuesTable or keysTable
    local mt = getmetatable(keysTable)

    if mt and getmetatable(destination) == nil then
        setmetatable(destination, mt)
    end

    for k,v in pairs(keysTable) do
        if type(v) == 'table' then
            destination[k] = copy_tables({}, v, valuesTable[k])
        else
            local value = valuesTable[k]

            if type(value) == 'boolean' then
                value = value and 1 or 0
            end

            destination[k] = value
        end
    end

    return destination
end

local function resolve(easing_fn, previous, new, clock, duration)
    if type(new) == 'boolean' then new = new and 1 or 0 end
    if type(previous) == 'boolean' then previous = previous and 1 or 0 end

    local previous = easing_fn(clock, previous, new - previous, duration)

    if type(new) == 'number' then
        if math.abs(new-previous) <= .001 then
            previous = new
        end

        if previous % 1 < .0001 then
            previous = math.floor(previous)
        elseif previous % 1 > .9999 then
            previous = math.ceil(previous)
        end
    end

    return previous
end

local function perform_easing(ntype, easing_fn, previous, new, clock, duration)
    if to_pairs[ntype] then
        for _, key in ipairs(to_pairs[ntype]) do
            previous[key] = perform_easing(
                type(v), easing_fn,
                previous[key], new[key],
                clock, duration
            )
        end

        return previous
    end

    if ntype == 'table' then
        for k, v in pairs(new) do
            previous[k] = previous[k] or v
            previous[k] = perform_easing(
                type(v), easing_fn,
                previous[k], v,
                clock, duration
            )
        end

        return previous
    end

    return resolve(easing_fn, previous, new, clock, duration)
end

-- Make Smoothy
local adjusted_speed

local new = function(default, easing_fn)
    if type(default) == 'boolean' then
        default = default and 1 or 0
    end

    local mt = { }
    local mt_data = {
        value = default or 0,
        easing = easing_fn or function(t, b, c, d)
            return c * t / d + b
        end
    }

    function mt.update(self, duration, value, easing, ignore_adj_speed)
        if type(value) == 'boolean' then
            value = value and 1 or 0
        end

        local clock = globals.frametime / native_GetTimescale()
        local duration = duration or .15
        local value_type = get_type(value)
        local target_type = get_type(self.value)

        assert(value_type == target_type, string.format('type mismatch. expected %s (received %s)', target_type, value_type))

        if self.value == value then
            return value
        end

        if adjusted_speed and ignore_adj_speed ~= true then
            duration = duration * adjusted_speed
        end

        if clock <= 0 or clock >= duration then
            if target_type == 'imcolor' or target_type == 'vector' then
                self.value = value:clone()
            elseif target_type == 'table' then
                copy_tables(self.value, value)
            else
                self.value = value
            end
        else
            local easing = easing or self.easing

            self.value = perform_easing(
                target_type, easing,
                self.value, value,
                clock, duration
            )
        end

        return self.value
    end

    return setmetatable(mt, {
        __metatable = false,
        __call = mt.update,
        __index = mt_data
    })
end

local new_interp = function(initial_value)
    return setmetatable({
        previous = initial_value or 0
    }, {
        __call = function(self, new_value, mul)
            local mul = mul or 1
            local tickinterval = globals.tickinterval * mul
            local difference = math.abs(new_value - self.previous)

            if difference > 0 then
                local clock = globals.frametime / native_GetTimescale()
                local time = math.min(tickinterval, clock) / tickinterval

                self.previous = self.previous + time * (new_value - self.previous)
            else
                self.previous = new_value
            end

            self.previous = (self.previous % 1 < .0001) and 0 or self.previous

            return self.previous
        end
    })
end

local set_speed = function(new_speed)
    if new_speed == true then return adjusted_speed or 1 end
    if new_speed == nil then adjusted_speed = nil end

    if type(new_speed) == 'number' and new_speed >= 0 then
        adjusted_speed = new_speed
    end

    return adjusted_speed
end

return {
    new = new,
    new_interp = new_interp,
    set_speed = set_speed
}