local lib = {draw={}, animation={},data_ease={},data_spin={},data_rotate={},data_breaker={}}
lib.draw:glow_outline = function(vector1, vector2, clr, round, steps)
	steps = math.max(2, steps)
	local rect = render.rect_outline
	for i = 1, steps do 
		rect(vector(vector1.x - i, vector1.y - i), vector(vector2.x + i, vector2.y + i), color(125, 125, 255, (15 * (1 - i / steps))*clr.a), -2, round, true) 
	end
end
lib.draw:glow = function(vector1, vector2, clr, round, steps)
	steps = math.max(2, steps)
	local rect = render.rect
	for i = 1, steps do 
		rect(vector(vector1.x - i, vector1.y - i), vector(vector2.x + i, vector2.y + i), color(125, 125, 255, (15 * (1 - i / steps))*clr.a), round, true) 
	end
end
lib.animation.ease = function(name, startvalue, tovalue, speed)
	if not lib.data_ease[name] then lib.data_ease[name] = startvalue end
	lib.data_ease[name].value = lib.data_ease[name].value + ((tovalue - lib.data_ease[name].value) * globals.absoluteframetime * speed)
	return lib.data_ease[name]
end

lib.animation.spin = function(name, startvalue, tovalue, speed)
	if not lib.data_spin[name] then lib.data_spin [name] = startvalue end
	lib.data_spin[name] = lib.data_spin[name] < tovalue and lib.data_spin[name] + speed*.1 or lib.data_spin[name]
	return math.floor(lib.data_spin[name]+.5)
end

lib.random_boolean = function(priority)
	if priority == true then
		return math.random(0,6) <= 4
	elseif priority == false then
		return math.random(0,6) > 4
	end
	return math.random(-1,1) == 0
end

lib.rotate = function(name, firstvalue, secondvalue, speed)
	if not lib.data_rotate[name] then lib.data_rotate[name] = firstvalue end
	lib.data_rotate[name] = lib.data_rotate[name] < secondvalue and lib.data_rotate[name] + speed*.1 or firstvalue
	return lib.data_rotate[name]
end

lib.get_gs_accent = function()
	return color(169, 205, 49)
end

lib.breaker_yaw = function(name, speed)--Will work
	if not lib.data_breaker[name] then lib.data_breaker[name] = 0 end
		if lib.data_breaker[name] == 0 then
			lib.data_breaker[name] = math.lerp(lib.data_breaker[name], 90, 25)
		elseif lib.data_breaker[name] == 90 then
			lib.data_breaker[name] = math.lerp(lib.data_breaker[name], 180, 25)
		elseif lib.data_breaker[name] == 180 then
			lib.data_breaker[name] = math.lerp(lib.data_breaker[name], -90, 25)
		elseif lib.data_breaker[name] == -90 then
			lib.data_breaker[name] = math.lerp(lib.data_breaker[name], 0, 25)
		end
	return lib.data_breaker[name]
end

lib.in_range = function(number, above_value, range)
if not number then return false end
if not above_value then return false end
if not range then range = 10 end
	return number > above_value-range and number < above_value+range
end

return lib