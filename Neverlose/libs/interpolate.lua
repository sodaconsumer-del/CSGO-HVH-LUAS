local library = { __easing_functions = {}, prototype = {} };

-- Easing types is shown below, use the table index keys at every interpolation function.
library.__easing_functions = {
    Linear = function(x) return x; end, 

    InQuad = function(x) return x * x; end,
    OutQuad = function(x) return math.sin((x * math.pi) / 2); end,
    InOutQuad = function(x) return ((x < 0.5) and (2 * x * x) or (1 - math.pow(-2 * x + 2, 2) / 2)) end,

    InQuart = function(x) return x * x * x * x; end,
    OutQuart = function(x) return (1 - math.pow(1 - x, 4)); end,
    InOutQuart = function(x) return ((x < 0.5) and (8 * x * x * x * x) or (1 - math.pow(-2 * x + 2, 4) / 2)) end,
};

library.prototype.between = function(easing_type, progress, ...)
    local easing_function = library.__easing_functions[easing_type];
    if (not easing_function) then 
        return false;
    end 

    local values = { ... };
    if (#values % 2 ~= 0) then 
        return false;
    end 

    progress = easing_function(math.clamp(progress, 0, 1));

    local returned_values = {};
    for i = 1, #values / 2 do 
        local start_value, end_value = values[i], values[#values / 2 + i];
        table.insert(returned_values, start_value + (progress * (end_value - start_value)));
    end 
    
    return unpack(returned_values);
end 

library.prototype.color = function(easing_type, progress, ...)
    local easing_function = library.__easing_functions[easing_type];
    if (not easing_function) then 
        return false;
    end 

    local values = { ... };
    if (#values % 2 ~= 0) then 
        return false;
    end 

    progress = easing_function(math.clamp(progress, 0, 1));

    local returned_values = {};
    for i = 1, #values / 2 do 
        local start_color, end_color = values[i], values[#values / 2 + i];

        if (
            not type(start_color) ~= "userdata" or 
            not type(end_color) ~= "userdata"
        ) then 
            return false;
        end 

        table.insert(
            returned_values, 
            color(
                start_color.r + (progress * (end_color.r - start_color.r)),
                start_color.g + (progress * (end_color.g - start_color.g)),
                start_color.b + (progress * (end_color.b - start_color.b)),
                start_color.a + (progress * (end_color.a - start_color.a))
            )
        );
    end 
    
    return unpack(returned_values);
end 

library.prototype.vector = function(easing_type, progress, ...)
    local easing_function = library.__easing_functions[easing_type];
    if (not easing_function) then 
        return false;
    end 

    local values = { ... };
    if (#values % 2 ~= 0) then 
        return false;
    end 

    progress = easing_function(math.clamp(progress, 0, 1));

    local returned_values = {};
    for i = 1, #values / 2 do 
        local start_vector, end_vector = values[i], values[#values / 2 + i];

        if (
            type(start_vector) ~= "userdata" or 
            type(end_vector) ~= "userdata"
        ) then 
            return false;
        end 

        table.insert(
            returned_values, 
            vector(
                start_vector.x + (progress * (end_vector.x - start_vector.x)),
                start_vector.y + (progress * (end_vector.y - start_vector.y)),
                (start_vector.z and end_vector.z) and (progress * (end_vector.z - start_vector.z)) or nil
            )
        );
    end 
    
    return unpack(returned_values);
end 

return library.prototype;