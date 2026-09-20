render.label = function(...)
    local rets = {...}

    local pos, col, text, size = vector(0, 0), color(255), "", 0

    for i = 1, #rets do
        k = rets[i]

        if type(k) ~= "table" then
            z = tostring(rets[i])

            if z:find('^color') then
                col = k
            end

            if z:find('^vector') then
                pos = k
            end
        end

        if type(k) == "table" then
            render.text(k[1], pos + vector(size, 0), col, nil, k[2])
            
            size = size + render.measure_text(k[1], nil, k[2]).x
        end
    end

    return size
end

return render