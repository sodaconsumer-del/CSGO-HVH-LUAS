local lerp = {}

lerp.cache = {}

---@param Name string
lerp.new = function(Name)
    lerp.cache[Name] = 0
end

---@param Name string
---@param LerpTo number
---@param Speed number
lerp.lerp = function(Name, LerpTo, Speed)
    if lerp.cache[Name] == nil then
        lerp.new(Name);
    end

    lerp.cache[Name] = lerp.cache[Name] + (LerpTo - lerp.cache[Name]) * (globals.frametime * Speed);

    return lerp.cache[Name];
end;

---@param Name string
lerp.get = function(Name)
    if lerp.cache[Name] == nil then return print("Lerp( " .. Name .. " ) does not exisit in function get") end;
    return lerp.cache[Name];
end

---@param Name string
lerp.reset = function(Name)
    if lerp.cache[Name] == nil then return print("Lerp( " .. Name .. " ) does not exisit in function reset") end
    lerp.cache[Name] = 0;
end

---@param Name string
lerp.delete = function(Name)
    lerp.cache[Name] = nil;
end

return lerp