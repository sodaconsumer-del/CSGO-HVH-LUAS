local animatables = {
	data = {},
}
    
animatables.create = function(speed, state, id, min, max)
	min = min or 0; max = max or 1
	if not animatables.data[id] then
        animatables.data[id] = {}
		animatables.data[id].time = globals.realtime
		animatables.data[id].prev_time = globals.realtime
        animatables.data[id].frame = 0
        animatables.data[id].value = 0
    end

	animatables.data[id].prev_time = animatables.data[id].time
	animatables.data[id].time = globals.realtime
	animatables.data[id].frame = (animatables.data[id].time - animatables.data[id].prev_time) * speed

	local value = math.clamp(animatables.data[id].value, min, max) 
    value = math.clamp(value + (animatables.data[id].frame * (state and 1 or -1)), min, max)

    animatables.data[id].value = value

    return value
end

return animatables

--[[
@region: example
*
* example_rendering = function()
* 	#setting vars
* 	local alpha = 0
* 	local state = false
*	 
* 	#switching state value for see animation
* 	local switch = math.clamp(math.ceil(globals.curtime * 2) % 2, 0, 1)
*	state = switch > 0.5 and true or false
*
*	#animating alpha value
*	#arg id may be a integer value
* 	alpha = animatables.create(4.2, state, 1, 0, 1)
*	#or a string value
* 	alpha = animatables.create(2000, state, "Animatables Example", 0, 255) #higher max value, higher speed should be
*
* 	#rendering rectangle
* 	render.rect(vector(200, 200), vector(400, 400), color(255, alpha)) #or color(255, 255 * alpha)
* end
*
* #function call
* events.render:set(example_rendering)
*
@region end.
]]