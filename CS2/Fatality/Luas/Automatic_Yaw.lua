--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol

slot_0_0_0, slot_0_1_0 = gui.MakeControlEasy("visualize", "Visualize", "checkbox")
slot_0_2_0 = gui.Settings("visualize_settings")
slot_0_3_0, slot_0_4_0 = gui.MakeControlEasy("disableOnFP", "Disable on firstperson", "checkbox")
slot_0_5_0, slot_0_6_0 = gui.MakeControlEasy("visualizeLine", "Visualize Line", "checkbox")
slot_0_7_0, slot_0_8_0 = gui.MakeControlEasy("visualizeHit", "Visualize Hit", "checkbox")
slot_0_9_0 = gui.ColorPicker("color")

if slot_0_9_0:GetValue():Get():GetA() == 0 then
	slot_0_9_0:GetValue():Set(draw.Color(255, 255, 255))
	slot_0_5_0:GetValue():Set(true)
	slot_0_7_0:GetValue():Set(true)
end

slot_0_10_0 = gui.MakeControl("Color", slot_0_9_0)
slot_0_11_0 = gui.ctx:Find("lua>elements b")

slot_0_11_0:Add(slot_0_1_0)
slot_0_1_0:Add(slot_0_2_0)
slot_0_2_0:Add(slot_0_4_0)
slot_0_2_0:Add(slot_0_6_0)
slot_0_2_0:Add(slot_0_8_0)
slot_0_11_0:Add(slot_0_10_0)

function slot_0_12_0()
	local var_1_0, var_1_1 = game.engine:GetScreenSize()
	local var_1_2 = math.Vec2(var_1_0 / 2, var_1_1 / 2)
	local var_1_3
	local var_1_4 = math.huge

	entities.players:ForEach(function(arg_2_0)
		local var_2_0 = arg_2_0.entity

		if var_2_0 == nil then
			return
		end

		if not var_2_0:IsAlive() then
			return
		end

		local var_2_1 = var_2_0.m_iTeamNum

		if not var_2_1 or not var_2_1:Get() then
			return
		end

		local var_2_2 = entities.GetLocalPawn().m_iTeamNum

		if not var_2_2 or not var_2_2:Get() then
			return
		end

		if var_2_1:Get() == var_2_2:Get() then
			return
		end

		local var_2_3 = var_2_0:GetEyePos()

		if var_2_3 == nil then
			return
		end

		local var_2_4 = math.WorldToScreen(var_2_3)

		if var_2_4 == nil then
			return
		end

		local var_2_5 = var_2_4.x - var_1_2.x
		local var_2_6 = var_2_4.y - var_1_2.y
		local var_2_7 = var_2_5 * var_2_5 + var_2_6 * var_2_6

		if var_2_7 < var_1_4 then
			var_1_4 = var_2_7
			var_1_3 = var_2_0
		end
	end)

	return var_1_3
end

slot_0_13_0 = Vector(0, 0, 0)

function slot_0_14_0(arg_3_0)
	slot_0_13_0 = Vector(0, 0, 0)

	local var_3_0 = gui.ctx:Find("rage>anti-aim>angles>yaw")
	local var_3_1 = var_3_0:GetValue()
	local var_3_2 = var_3_1:Get()

	if var_3_2:GetRaw() ~= 4 then
		var_3_2:SetRaw(4)
		var_3_1:Set(var_3_2)
		var_3_0:Reset()
	end

	local var_3_3 = entities.GetLocalPawn()

	if not var_3_3 then
		gui.ctx:Find("rage>anti-aim>angles>yaw>settings>amount"):GetValue():Set(180)

		return
	end

	local var_3_4 = slot_0_12_0()

	if not var_3_4 then
		gui.ctx:Find("rage>anti-aim>angles>yaw>settings>amount"):GetValue():Set(180)

		return
	end

	local var_3_5 = var_3_4:GetEyePos()
	local var_3_6 = var_3_3:GetEyePos()
	local var_3_7 = var_3_3:GetHitboxCenter(EHitBox.NECK)
	local var_3_8 = var_3_3:GetHitboxCenter(EHitBox.HEAD)
	local var_3_9 = var_3_7 + (var_3_8 - var_3_7) * 1.5

	var_3_9.z = var_3_8.z + 7

	local var_3_10 = gui.ctx:Find("rage>anti-aim>angles>yaw>settings>amount"):GetValue():Get()

	slot_0_13_0 = var_3_5

	local var_3_11 = math.CalcAngle(var_3_5, var_3_6)
	local var_3_12 = math.CalcAngle(var_3_6, var_3_9)
	local var_3_13 = math.AngleNormalize(var_3_11.y - var_3_12.y)
	local var_3_14 = math.AngleNormalize(var_3_10 + var_3_13)

	gui.ctx:Find("rage>anti-aim>angles>yaw>settings>amount"):GetValue():Set(var_3_14)
end

function slot_0_15_0()
	if not slot_0_0_0:GetValue():Get() then
		return
	end

	if slot_0_3_0:GetValue():Get() and not gui.ctx:Find("visuals>misc>local>thirdperson"):GetValue():Get() then
		return
	end

	local var_4_0 = entities.GetLocalPawn()

	if not var_4_0 or not var_4_0:IsAlive() then
		return
	end

	if slot_0_13_0.x == 0 and slot_0_13_0.y == 0 and slot_0_13_0.z == 0 then
		return
	end

	local var_4_1 = var_4_0:GetHitboxCenter(EHitBox.NECK)
	local var_4_2 = var_4_0:GetHitboxCenter(EHitBox.HEAD)
	local var_4_3 = var_4_1 + (var_4_2 - var_4_1) * 1.5

	var_4_3.z = var_4_2.z + 5

	local var_4_4 = math.WorldToScreen(var_4_3)
	local var_4_5 = draw.surface
	local var_4_6 = slot_0_9_0:GetValue():Get():A(0)

	if slot_0_5_0:GetValue():Get() then
		var_4_5:AddCircleFilledMulticolor(var_4_4, 20, {
			slot_0_9_0:GetValue():Get(),
			var_4_6
		})
	end

	if slot_0_7_0:GetValue():Get() then
		var_4_5:AddLine(var_4_4, math.WorldToScreen(slot_0_13_0), slot_0_9_0:GetValue():Get())
	end
end

events.createMove:Add(slot_0_14_0)
events.presentQueue:Add(slot_0_15_0)
slot_0_11_0:reset()
