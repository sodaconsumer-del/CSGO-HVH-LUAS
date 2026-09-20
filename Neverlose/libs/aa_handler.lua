local reloaded_0_0 = {
	enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"),
	pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
	yaw = {
		main = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
		base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
		offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
		hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden")
	},
	yaw_modifier = {
		main = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
		offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset")
	},
	body_yaw = {
		main = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
		inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
		left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
		right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
		options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
		freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
	},
	freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
	extended_angles = {
		main = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"),
		pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"),
		roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll")
	}
}
local reloaded_0_1
local reloaded_0_2 = {}
local reloaded_0_3 = {}
local reloaded_0_4 = {}
local reloaded_0_5 = {}

for iter_0_0, iter_0_1 in pairs(reloaded_0_0) do
	local reloaded_0_6 = type(iter_0_1) == "table"

	reloaded_0_5[iter_0_0] = reloaded_0_6

	if reloaded_0_6 then
		reloaded_0_4[iter_0_0] = {}

		for iter_0_2, iter_0_3 in pairs(iter_0_1) do
			reloaded_0_4[iter_0_0][iter_0_2] = {
				0,
				-1
			}
		end
	else
		reloaded_0_4[iter_0_0] = {
			0,
			-1
		}
	end
end

local reloaded_0_7 = {}
local reloaded_0_8 = -1
local reloaded_0_9 = {
	run = function(arg_1_0)
		reloaded_0_8 = math.max(arg_1_0.layer, reloaded_0_8)

		for iter_1_0, iter_1_1 in pairs(arg_1_0.overrides) do
			local reloaded_1_0 = reloaded_0_4[iter_1_0]

			if reloaded_0_5[iter_1_0] then
				for iter_1_2, iter_1_3 in pairs(iter_1_1) do
					if iter_1_2 ~= "__mt" and reloaded_1_0[iter_1_2][2] <= arg_1_0.layer then
						reloaded_1_0[iter_1_2][1] = iter_1_3
						reloaded_1_0[iter_1_2][2] = arg_1_0.layer
					end
				end
			else
				reloaded_1_0[1] = iter_1_1
				reloaded_1_0[2] = arg_1_0.layer
			end
		end
	end,
	tick = function(arg_2_0)
		arg_2_0.overrides = {}
	end
}
local reloaded_0_10 = {
	__newindex = function(arg_3_0, arg_3_1, arg_3_2)
		if reloaded_0_5[arg_3_1] ~= nil then
			if not reloaded_0_5[arg_3_1] then
				arg_3_0.overrides[arg_3_1] = arg_3_2
			end
		else
			print("failed to index " .. arg_3_1)
		end
	end,
	__index = function(arg_4_0, arg_4_1)
		if reloaded_0_9[arg_4_1] then
			return reloaded_0_9[arg_4_1]
		end

		if reloaded_0_5[arg_4_1] ~= nil then
			if reloaded_0_5[arg_4_1] then
				if arg_4_0.overrides[arg_4_1] == nil then
					arg_4_0.overrides[arg_4_1] = {}
					arg_4_0.overrides[arg_4_1].__mt = setmetatable({}, {
						__newindex = function(arg_5_0, arg_5_1, arg_5_2)
							arg_4_0.overrides[arg_4_1][arg_5_1] = arg_5_2
						end
					})
				end

				return arg_4_0.overrides[arg_4_1].__mt
			end
		else
			print("[antiaims] failed to index " .. arg_4_1)
		end
	end
}
local reloaded_0_11 = {}

function reloaded_0_2.new(arg_6_0, arg_6_1)
	assert(reloaded_0_3[arg_6_0] == nil, "Failed to Create. Layer already exist.")
	assert(reloaded_0_11[arg_6_1] == nil, "Failed to Create. Name already exist.")

	reloaded_0_11[arg_6_1] = true
	reloaded_0_3[arg_6_0] = {
		name = arg_6_0,
		layer = arg_6_1,
		overrides = {}
	}

	return setmetatable(reloaded_0_3[arg_6_0], reloaded_0_10)
end

reloaded_0_2.override = -1

function reloaded_0_2.on_createmove()
	for iter_7_0, iter_7_1 in pairs(reloaded_0_0) do
		if type(iter_7_1) == "table" then
			for iter_7_2, iter_7_3 in pairs(iter_7_1) do
				iter_7_3:override()
			end
		else
			iter_7_1:override()
		end
	end

	for iter_7_4, iter_7_5 in pairs(reloaded_0_4) do
		if reloaded_0_5[iter_7_4] then
			for iter_7_6, iter_7_7 in pairs(iter_7_5) do
				if iter_7_7[2] ~= -1 then
					reloaded_0_0[iter_7_4][iter_7_6]:override(iter_7_7[1])

					iter_7_7[2] = -1
				else
					reloaded_0_0[iter_7_4][iter_7_6]:override()
				end
			end
		elseif iter_7_5[2] ~= -1 then
			reloaded_0_0[iter_7_4]:override(iter_7_5[1])

			iter_7_5[2] = -1
		else
			reloaded_0_0[iter_7_4]:override()
		end
	end

	reloaded_0_7 = {}
	reloaded_0_8 = -1
end

return reloaded_0_2
