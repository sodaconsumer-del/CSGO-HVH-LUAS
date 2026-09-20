local function reloaded_0_0(arg_1_0, arg_1_1, arg_1_2)
	return arg_1_0.x >= arg_1_1.x and arg_1_0.y >= arg_1_1.y and arg_1_0.x <= arg_1_1.x + arg_1_2.x and arg_1_0.y <= arg_1_1.y + arg_1_2.y
end

local reloaded_0_1 = {
	__index = {
		get = function(arg_2_0)
			return vector(arg_2_0.reference.x:get(), arg_2_0.reference.y:get()) / arg_2_0.max * render.screen_size()
		end,
		set = function(arg_3_0, arg_3_1)
			arg_3_1 = arg_3_1 / render.screen_size() * arg_3_0.max

			arg_3_0.reference.x:set(arg_3_1.x)
			arg_3_0.reference.y:set(arg_3_1.y)
		end,
		update = function(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
			arg_4_0.drag.begin = arg_4_0.drag.endl
			arg_4_0.state.begin = arg_4_0.state.endl
			arg_4_0.mouse.begin = arg_4_0.mouse.mouse_endl
			arg_4_0.drag.endl = false
			arg_4_0.state.endl = common.is_button_down(1)
			arg_4_0.mouse.mouse_endl = ui.get_mouse_position()

			if ui.get_alpha() == 0 or arg_4_0.state.begin == nil then
				return
			end

			arg_4_1 = vector() + arg_4_1

			local reloaded_4_0 = arg_4_0:get()
			local reloaded_4_1 = render.screen_size()

			if (not arg_4_0.state.begin or arg_4_0.drag.begin) and arg_4_0.state.endl and reloaded_0_0(arg_4_0.mouse.begin, reloaded_4_0, arg_4_1) then
				arg_4_0.drag.endl = true

				local reloaded_4_2 = reloaded_4_0 + (arg_4_0.mouse.mouse_endl - arg_4_0.mouse.begin)
				local reloaded_4_3, reloaded_4_4 = (reloaded_4_1 - arg_4_1):unpack()

				arg_4_2 = vector() + (arg_4_2 or 0)
				arg_4_3 = vector(reloaded_4_3, reloaded_4_4) + (arg_4_3 or 0)
				reloaded_4_2.x = math.max(arg_4_2.x or 0, math.min(arg_4_3.x, reloaded_4_2.x))
				reloaded_4_2.y = math.max(arg_4_2.y or 0, math.min(arg_4_3.y, reloaded_4_2.y))

				arg_4_0:set(reloaded_4_2)

				return false
			end
		end,
		new = function(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
			arg_5_0.max = arg_5_3 or 10000

			local reloaded_5_0, reloaded_5_1 = (arg_5_2 / render.screen_size() * arg_5_0.max):unpack()

			arg_5_0.reference.x = arg_5_1:create():slider("X", 0, arg_5_0.max, reloaded_5_0)
			arg_5_0.reference.y = arg_5_1:create():slider("Y", 0, arg_5_0.max, reloaded_5_1)

			if not _DEBUG then
				arg_5_0.reference.x:visibility(false)
				arg_5_0.reference.y:visibility(false)
			end

			return arg_5_0
		end
	}
}

return {
	new = function(arg_6_0, arg_6_1)
		return setmetatable({
			drag = {},
			state = {},
			mouse = {},
			reference = {}
		}, reloaded_0_1):new(arg_6_0, vector() + arg_6_1)
	end
}
