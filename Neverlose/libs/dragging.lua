local reloaded_0_0 = require("neverlose/inspect")
local reloaded_0_1 = {
	objects = {},
	group = ui.create("Dragging")
}

reloaded_0_1.__index = reloaded_0_1

function reloaded_0_1.new(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	arg_1_3 = arg_1_3 or function()
		return vector(0, 0)
	end

	local reloaded_1_0 = {}

	for iter_1_0, iter_1_1 in pairs(arg_1_1) do
		reloaded_1_0[iter_1_0] = reloaded_0_1.group:slider(("%s %s position"):format(arg_1_0, iter_1_0), -10000, 10000, arg_1_1[iter_1_0] or 0, 1, "px"):visibility(false)
	end

	local reloaded_1_1 = {
		is_dragging = false,
		name = arg_1_0,
		pos = vector(reloaded_1_0.x ~= nil and reloaded_1_0.x:get() or 0, reloaded_1_0.y ~= nil and reloaded_1_0.y:get() or 0),
		size = arg_1_2,
		get_origin = arg_1_3,
		get_pos_limits = function()
			local reloaded_3_0 = arg_1_3()
			local reloaded_3_1 = arg_1_4 ~= nil and arg_1_4() or {
				min = vector(0, 0) - reloaded_3_0,
				max = render.screen_size() - reloaded_3_0
			}

			return {
				min = reloaded_3_1.min,
				max = reloaded_3_1.max
			}
		end,
		ui_pos = reloaded_1_0,
		prev_mouse_pos = vector(0, 0),
		id = #reloaded_0_1.objects + 1
	}

	table.insert(reloaded_0_1.objects, reloaded_1_1)

	return setmetatable(reloaded_1_1, reloaded_0_1)
end

function reloaded_0_1.get_pos(arg_4_0)
	return arg_4_0.get_origin() + arg_4_0.pos
end

function reloaded_0_1.in_range(arg_5_0, arg_5_1)
	local reloaded_5_0 = arg_5_0:get_pos()
	local reloaded_5_1 = reloaded_5_0 + arg_5_0.size

	return arg_5_1.x >= reloaded_5_0.x and arg_5_1.x <= reloaded_5_1.x and arg_5_1.y >= reloaded_5_0.y and arg_5_1.y <= reloaded_5_1.y
end

function reloaded_0_1.clamp_pos(arg_6_0, arg_6_1)
	local reloaded_6_0 = arg_6_0.get_pos_limits()
	local reloaded_6_1 = reloaded_6_0.max - arg_6_0.size
	local reloaded_6_2 = reloaded_6_0.min
	local reloaded_6_3 = vector(arg_6_0.pos.x, arg_6_0.pos.y)

	for iter_6_0, iter_6_1 in pairs(arg_6_0.ui_pos) do
		reloaded_6_3[iter_6_0] = math.clamp(arg_6_1[iter_6_0], reloaded_6_2[iter_6_0], reloaded_6_1[iter_6_0])
	end

	return reloaded_6_3
end

function reloaded_0_1.update_size(arg_7_0, arg_7_1)
	arg_7_0.size = arg_7_1

	arg_7_0:update_pos(arg_7_0.pos)
end

function reloaded_0_1.update_pos(arg_8_0, arg_8_1)
	arg_8_0.pos = arg_8_0:clamp_pos(arg_8_1)

	for iter_8_0, iter_8_1 in pairs(arg_8_0.ui_pos) do
		iter_8_1:set(math.floor(arg_8_0.pos[iter_8_0]))
	end
end

function reloaded_0_1.drag(arg_9_0, arg_9_1)
	local reloaded_9_0 = common.is_button_down(1) and (arg_9_0.is_dragging or arg_9_0:in_range(arg_9_0.prev_mouse_pos))

	if reloaded_9_0 then
		arg_9_0:update_pos(arg_9_0.pos - (arg_9_0.prev_mouse_pos - arg_9_1))
	end

	arg_9_0.prev_mouse_pos = arg_9_1
	arg_9_0.is_dragging = reloaded_9_0

	return reloaded_9_0
end

function reloaded_0_1.update(arg_10_0)
	if ui.get_alpha() ~= 1 then
		return false
	end

	local reloaded_10_0 = ui.get_mouse_position()

	if arg_10_0.last_object ~= nil then
		if arg_10_0.last_object:drag(reloaded_10_0) then
			return true
		else
			arg_10_0.last_object = nil
		end
	end

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.objects) do
		if iter_10_1:drag(reloaded_10_0) then
			arg_10_0.last_object = iter_10_1

			return true
		end
	end

	return false
end

return reloaded_0_1
