local animate = {id = {}}
animate.bf_spin = function(cid, state, min, max, speed)
if min == 0 then min = max > 0 and -1 or 1 end
if speed > speed / 2 then speed = speed / 2 end
if not animate.id[cid] then
animate.id[cid] = {}
animate.id[cid].value = min
end
if state and animate.id[cid].value < max - (max > 0 and max/1.3 or max*1.3) then
animate.id[cid].value = animate.id[cid].value + speed *0.90
elseif state and animate.id[cid].value < max - (max > 0 and max/1.7 or max*1.7) then
animate.id[cid].value = animate.id[cid].value + speed *0.80
elseif state and animate.id[cid].value < max - (max > 0 and max/2 or max*2) then
animate.id[cid].value = animate.id[cid].value + speed *0.73
elseif state and animate.id[cid].value < max - (max > 0 and max/3 or max*3) then
animate.id[cid].value = animate.id[cid].value + speed *0.68
elseif state and animate.id[cid].value < max - (max > 0 and max/5 or max*5) then
animate.id[cid].value = animate.id[cid].value + speed *0.50
elseif state and animate.id[cid].value < max - (max > 0 and max/8 or max*8) then
animate.id[cid].value = animate.id[cid].value + speed *0.35
elseif state and animate.id[cid].value < max then
animate.id[cid].value = animate.id[cid].value + speed *0.30
end


if not state and animate.id[cid].value > min then
if animate.id[cid].value > (min > 0 and min*3 or min/3) then
animate.id[cid].value = animate.id[cid].value - speed
elseif animate.id[cid].value > (min > 0 and min*2.6 or min/2.6) then
animate.id[cid].value = animate.id[cid].value - speed * 0.85
elseif animate.id[cid].value > (min > 0 and min*2.2 or min/2.2) then
animate.id[cid].value = animate.id[cid].value - speed * 0.74
elseif animate.id[cid].value > (min > 0 and min*1.80 or min/1.80) then
animate.id[cid].value = animate.id[cid].value - speed * 0.65
elseif animate.id[cid].value > (min > 0 and min*1.45 or min/1.45) then
animate.id[cid].value = animate.id[cid].value - speed * 0.59
elseif animate.id[cid].value > (min > 0 and min*1.28 or min/1.28) then
animate.id[cid].value = animate.id[cid].value - speed * 0.40
elseif animate.id[cid].value > (min > 0 and min*1.15 or min/1.15) then
animate.id[cid].value = animate.id[cid].value - speed * 0.30
elseif animate.id[cid].value > min then
animate.id[cid].value = animate.id[cid].value - speed * 0.15
end
end
return animate.id[cid].value
end
animate.spin = function(cid, state, min, max, speed)
if speed > speed / 2 then speed = speed / 2 end
if not animate.id[cid] then
animate.id[cid] = {}
animate.id[cid].value = min
end
if state and animate.id[cid].value < max then
animate.id[cid].value = animate.id[cid].value + speed*0.98
end
if not state and animate.id[cid].value > min then
animate.id[cid].value = animate.id[cid].value - speed*0.98
end
return animate.id[cid].value
end
animate.sway = function(cid, min, max, speed)
if speed > speed / 2 then speed = speed / 2 end
if not animate.id[cid] then
animate.id[cid] = {}
animate.id[cid].value = min
animate.id[cid].state = false
end
if animate.id[cid].state == false and animate.id[cid].value < max then
animate.id[cid].value = animate.id[cid].value + speed*0.98
elseif animate.id[cid].state == false then
animate.id[cid].state = true
end
if animate.id[cid].state == true and animate.id[cid].value > min then
animate.id[cid].value = animate.id[cid].value - speed*0.98
elseif animate.id[cid].state == true then
animate.id[cid].state = false
end
return animate.id[cid].value
end
return animate