local reloaded_0_0 = {
	elements = {}
}

reloaded_0_0.__index = reloaded_0_0

function reloaded_0_0.register(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	local reloaded_1_0 = {
		drag_delay = 0,
		name = arg_1_0,
		position = arg_1_1,
		start_position = vector(),
		size = arg_1_2,
		sliders = arg_1_3,
		pendingActions = {},
		render = arg_1_4
	}

	if arg_1_3 then
		if not arg_1_1 then
			reloaded_1_0.position = vector(arg_1_3[1]:get(), arg_1_3[2]:get())
		end

		reloaded_1_0.position.x = arg_1_3[1]:get()
		reloaded_1_0.position.y = arg_1_3[2]:get()
	end

	table.insert(reloaded_0_0.elements, reloaded_1_0)

	return setmetatable(reloaded_1_0, reloaded_0_0)
end

function reloaded_0_0.unregister(arg_2_0)
	for iter_2_0, iter_2_1 in pairs(reloaded_0_0.elements) do
		if iter_2_1 == arg_2_0 then
			table.remove(reloaded_0_0.elements, iter_2_0)

			return
		end
	end
end

function reloaded_0_0.load_config(...)
	for iter_3_0, iter_3_1 in pairs(reloaded_0_0.elements) do
		for iter_3_2, iter_3_3 in pairs(...) do
			if iter_3_1.name == iter_3_3.name then
				iter_3_1.position = iter_3_3.position
				iter_3_1.size = iter_3_3.size

				iter_3_1:update_sliders()
			end
		end
	end
end

function reloaded_0_0.get_config(...)
	local reloaded_4_0 = {}
	local reloaded_4_1 = reloaded_0_0.elements

	if #{
		...
	} > 0 then
		reloaded_4_1 = {
			...
		}
	end

	for iter_4_0, iter_4_1 in pairs(reloaded_4_1) do
		table.insert(reloaded_4_0, {
			name = iter_4_1.name,
			position = iter_4_1.position,
			size = iter_4_1.size
		})
	end

	return reloaded_4_0
end

function reloaded_0_0.set_size(arg_5_0, arg_5_1)
	arg_5_0.size = arg_5_1
end

function reloaded_0_0.set_position(arg_6_0, arg_6_1)
	arg_6_0.position = arg_6_1
end

function reloaded_0_0.set_drag_delay(arg_7_0, arg_7_1)
	arg_7_0.drag_delay = arg_7_1
end

function reloaded_0_0.is_dragging(arg_8_0)
	return arg_8_0 == reloaded_0_0.is_dragging
end

function reloaded_0_0.update_sliders(arg_9_0)
	if arg_9_0.sliders then
		arg_9_0.sliders[1]:set(arg_9_0.position.x)
		arg_9_0.sliders[2]:set(arg_9_0.position.y)
	end
end

function reloaded_0_0.update(arg_10_0, ...)
	if arg_10_0.sliders then
		arg_10_0.position.x = arg_10_0.sliders[1]:get()
		arg_10_0.position.y = arg_10_0.sliders[2]:get()
	end

	if ui.get_alpha() == 1 then
		local reloaded_10_0 = ui.get_mouse_position()
		local reloaded_10_1 = render.screen_size()
		local reloaded_10_2 = reloaded_10_0.x >= arg_10_0.position.x and reloaded_10_0.y >= arg_10_0.position.y and reloaded_10_0.x <= arg_10_0.position.x + arg_10_0.size.x and reloaded_10_0.y <= arg_10_0.position.y + arg_10_0.size.y

		if common.is_button_down(1) then
			if reloaded_0_0.dragging == nil and reloaded_10_2 then
				reloaded_0_0.dragging = arg_10_0
				arg_10_0.start_position = reloaded_10_0 - arg_10_0.position
			elseif reloaded_0_0.dragging == arg_10_0 then
				if arg_10_0.drag_delay > 0 then
					arg_10_0.pendingActions[#arg_10_0.pendingActions + 1] = {
						func = function(arg_11_0)
							arg_11_0.position = reloaded_10_0 - arg_11_0.start_position

							arg_11_0:update_sliders()
						end,
						delay = common.get_timestamp() + arg_10_0.drag_delay
					}
				else
					arg_10_0.position = reloaded_10_0 - arg_10_0.start_position

					arg_10_0:update_sliders()
				end
			end

			if #arg_10_0.pendingActions > 0 then
				local reloaded_10_3 = arg_10_0.pendingActions[1]

				if common.get_timestamp() >= reloaded_10_3.delay then
					reloaded_10_3.func(arg_10_0)
					table.remove(arg_10_0.pendingActions, 1)
				end
			end

			if arg_10_0.position.x < 0 then
				arg_10_0.position.x = 0
			end

			if arg_10_0.position.y < 0 then
				arg_10_0.position.y = 0
			end

			if arg_10_0.position.x + arg_10_0.size.x > reloaded_10_1.x then
				arg_10_0.position.x = reloaded_10_1.x - arg_10_0.size.x
			end

			if arg_10_0.position.y + arg_10_0.size.y > reloaded_10_1.y then
				arg_10_0.position.y = reloaded_10_1.y - arg_10_0.size.y
			end
		else
			if reloaded_0_0.dragging then
				reloaded_0_0.dragging.pendingActions = {}
				reloaded_0_0.dragging.start_position = vector()
			end

			reloaded_0_0.dragging = nil
		end
	end

	arg_10_0.render(arg_10_0, ...)
end

return reloaded_0_0
