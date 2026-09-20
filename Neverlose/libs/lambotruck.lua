pcall(function()
	ffi.cdef("        typedef struct {\n            char pad20[24];\n            uint32_t m_nSequence;\n            float m_flPrevCycle;\n            float m_flWeight;\n            char pad20[8];\n            float m_flCycle;\n            void *m_pOwner;\n            char pad_0038[ 4 ];\n        } animation_layer_t_12389890123890321890089123;\n\n        typedef struct {\n            float x;\n            float y;\n            float z;\n        } Vector_t;\n    \n        typedef struct {\n            char     pad0[0x60];\n            void*    pEntity;\n            void*    pActiveWeapon;\n            void*    pLastActiveWeapon;\n            float    flLastUpdateTime;\n            int      iLastUpdateFrame;\n            float    flLastUpdateIncrement;\n            float    flEyeYaw;\n            float    flEyePitch;\n            float    flGoalFeetYaw;\n            float    flLastFeetYaw;\n            float    flMoveYaw;\n            float    flLastMoveYaw;\n            float    flLeanAmount;\n            char     pad1[0x4];\n            float    flFeetCycle;\n            float    flMoveWeight;\n            float    flMoveWeightSmoothed;\n            float    flDuckAmount;\n            float    flHitGroundCycle;\n            float    flRecrouchWeight;\n            Vector_t vecOrigin;\n            Vector_t vecLastOrigin;\n            Vector_t vecVelocity;\n            Vector_t vecVelocityNormalized;\n            Vector_t vecVelocityNormalizedNonZero;\n            float    flVelocityLenght2D;\n            float    flJumpFallVelocity;\n            float    flSpeedNormalized;\n            float    flRunningSpeed;\n            float    flDuckingSpeed;\n            float    flDurationMoving;\n            float    flDurationStill;\n            bool     bOnGround;\n            bool     bHitGroundAnimation;\n            char     pad2[0x2];\n            float    flNextLowerBodyYawUpdateTime;\n            float    flDurationInAir;\n            float    flLeftGroundHeight;\n            float    flHitGroundWeight;\n            float    flWalkToRunTransition;\n            char     pad3[0x4];\n            float    flAffectedFraction;\n            char     pad4[0x208];\n            float    flMinBodyYaw;\n            float    flMaxBodyYaw;\n            float    flMinPitch;\n            float    flMaxPitch;\n            int      iAnimsetVersion;\n        } CCSGOPlayerAnimationState_534535_t;\n    ")
end)

local reloaded_0_0 = {
	animation = false,
	numbers = {
		ways = {}
	},
	defensive = {
		defensive = true,
		is_break_defensive = true,
		time_to_ticks = function(arg_2_0)
			return math.floor(0.5 + arg_2_0 / globals.tickinterval)
		end,
		net_data = {},
		sim_ticks = {}
	}
}
local reloaded_0_1 = {
	active = function(arg_3_0)
		reloaded_0_0.animation = arg_3_0
	end,
	overlay = function(arg_4_0, arg_4_1)
		arg_4_1 = arg_4_1 or 12

		if entity.get_local_player() == nil or ffi.cast("uintptr_t**", arg_4_0) == nil then
			return
		end

		return ffi.cast("animation_layer_t_12389890123890321890089123**", ffi.cast("char*", arg_4_0) + 10640)[0][arg_4_1]
	end,
	state = function(arg_5_0)
		if entity.get_local_player() == nil or ffi.cast("uintptr_t**", arg_5_0) == nil then
			return
		end

		return ffi.cast("CCSGOPlayerAnimationState_534535_t**", ffi.cast("char*", arg_5_0) + 39264)[0]
	end
}
local reloaded_0_2 = {
	ways = function(arg_6_0, arg_6_1)
		if reloaded_0_0.numbers.ways[arg_6_0] == nil then
			reloaded_0_0.numbers.ways[arg_6_0] = {
				init = 1
			}
		end

		if globals.choked_commands == 0 then
			reloaded_0_0.numbers.ways[arg_6_0].init = reloaded_0_0.numbers.ways[arg_6_0].init + 1
		end

		if reloaded_0_0.numbers.ways[arg_6_0].init > #arg_6_1 then
			reloaded_0_0.numbers.ways[arg_6_0].init = 1
		end

		return arg_6_1[reloaded_0_0.numbers.ways[arg_6_0].init]
	end
}
local reloaded_0_3 = {
	defensive = {
		update = function()
			local reloaded_7_0 = entity.get_entities(false, true)

			for iter_7_0 = 1, #reloaded_7_0 do
				local reloaded_7_1 = reloaded_7_0[iter_7_0]
				local reloaded_7_2 = reloaded_7_1:get_index()
				local reloaded_7_3 = reloaded_0_0.defensive.sim_ticks[reloaded_7_2]

				if reloaded_7_1:is_dormant() or not reloaded_7_1:is_alive() then
					reloaded_0_0.defensive.sim_ticks[reloaded_7_2] = nil
				else
					local reloaded_7_4 = reloaded_0_0.defensive.time_to_ticks(reloaded_7_1:get_simulation_time().current)

					if reloaded_7_3 ~= nil then
						local reloaded_7_5 = reloaded_7_4 - reloaded_7_3

						if reloaded_7_5 < 0 or reloaded_7_5 > 0 and reloaded_7_5 <= 64 then
							reloaded_0_0.defensive.net_data[reloaded_7_2] = reloaded_7_5 - 1
						end
					end

					reloaded_0_0.defensive.sim_ticks[reloaded_7_2] = reloaded_7_4
				end
			end
		end,
		get = function()
			if ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() or ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() then
				local reloaded_8_0 = entity.get_local_player()

				if reloaded_8_0 == nil or not reloaded_8_0:is_alive() then
					return
				end

				for iter_8_0, iter_8_1 in pairs(reloaded_0_0.defensive.net_data) do
					iter_8_0 = entity.get(iter_8_0)

					if iter_8_0 == reloaded_8_0 then
						reloaded_0_0.defensive.defensive = iter_8_1 >= 0
					end
				end

				reloaded_0_0.defensive.is_break_defensive = reloaded_0_0.defensive.defensive

				if ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):get() == "Always On" or ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):get() == "Favor Fire Rate" then
					reloaded_0_0.defensive.is_break_defensive = not reloaded_0_0.defensive.is_break_defensive
				end
			else
				reloaded_0_0.defensive.is_break_defensive = true
			end

			return reloaded_0_0.defensive.is_break_defensive
		end
	}
}

events.createmove:set(function(arg_9_0)
	arg_9_0.animate_move_lean = reloaded_0_0.animation
end)

return {
	animation = reloaded_0_1,
	numbers = reloaded_0_2,
	rage = reloaded_0_3
}
