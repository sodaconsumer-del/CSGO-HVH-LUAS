local reloaded_0_0 = {
	screensize = render.screen_size(),
	scale_y = render.screen_size().y / 1080,
	indicator_cache = {}
}
local reloaded_0_1 = {}

reloaded_0_0.indicator_font = render.load_font("calibri", 24 * reloaded_0_0.scale_y, "ab")
reloaded_0_0.start_y = reloaded_0_0.screensize.y / 1.8
reloaded_0_0.gap = reloaded_0_0.screensize.y / 90

local function reloaded_0_2(arg_1_0, arg_1_1, arg_1_2)
	if reloaded_0_1[arg_1_0 .. arg_1_1:to_hex() .. arg_1_2:to_hex()] then
		return reloaded_0_1[arg_1_0 .. arg_1_1:to_hex() .. arg_1_2:to_hex()]
	end

	local reloaded_1_0 = {
		r = (arg_1_2.r - arg_1_1.r) / #arg_1_0,
		g = (arg_1_2.g - arg_1_1.g) / #arg_1_0,
		b = (arg_1_2.b - arg_1_1.b) / #arg_1_0,
		a = (arg_1_2.a - arg_1_2.a) / #arg_1_0
	}
	local reloaded_1_1 = ""

	for iter_1_0 = 1, #arg_1_0 do
		reloaded_1_1 = reloaded_1_1 .. "\a" .. color(arg_1_1.r + reloaded_1_0.r * iter_1_0, arg_1_1.g + reloaded_1_0.g * iter_1_0, arg_1_1.b + reloaded_1_0.b * iter_1_0, arg_1_1.a + reloaded_1_0.a * iter_1_0):to_hex() .. string.sub(arg_1_0, iter_1_0, iter_1_0)
	end

	reloaded_0_1[arg_1_0 .. arg_1_1:to_hex() .. arg_1_2:to_hex()] = reloaded_1_1

	return reloaded_1_1
end

local reloaded_0_3 = setmetatable(reloaded_0_0, {
	__call = function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
		if arg_2_1 and arg_2_0.indicator_font then
			local reloaded_2_0 = render.measure_text(arg_2_0.indicator_font, "s", arg_2_1)
			local reloaded_2_1 = vector(10 * arg_2_0.scale_y, arg_2_0.start_y * arg_2_0.scale_y + (reloaded_2_0.y + arg_2_0.gap * arg_2_0.scale_y) * #arg_2_0.indicator_cache)

			arg_2_1 = arg_2_3 and reloaded_0_2(arg_2_1, arg_2_2, arg_2_3) or arg_2_1

			local reloaded_2_2 = {
				vector(reloaded_2_1.x, reloaded_2_1.y - reloaded_2_0.y * 1 / 6),
				vector(reloaded_2_1.x + reloaded_2_0.x, reloaded_2_1.y + reloaded_2_0.y)
			}

			render.gradient(reloaded_2_2[1], vector(reloaded_2_1.x + reloaded_2_0.x / 2, reloaded_2_1.y + reloaded_2_0.y), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50))
			render.gradient(vector(reloaded_2_1.x + reloaded_2_0.x / 2, reloaded_2_1.y - reloaded_2_0.y * 1 / 6), reloaded_2_2[2], color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0))
			render.text(arg_2_0.indicator_font, reloaded_2_1, arg_2_2 or color(), "s", arg_2_1)
			table.insert(arg_2_0.indicator_cache, true)

			return reloaded_2_2
		end

		return false
	end,
	__newindex = function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_1 == "scale" and arg_3_2 then
			arg_3_0.indicator_font = render.load_font("calibri", 24 * arg_3_0.scale_y * arg_3_2, "ab")
			arg_3_0.scale = nil
		end
	end
})

events.render:set(function()
	reloaded_0_3.indicator_cache = {}
end)

return reloaded_0_3
