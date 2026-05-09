--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = {
        radius_tweak_factor = 2.74,
        default_base_fov = 90,
        circle = {
                thickness = 1.5,
                segments = 64,
                color = {
                        255,
                        255,
                        255,
                        200
                }
        }
}
slot_0_1_0 = {
        current_setup_fov = 90,
        base_fov = 90,
        screen_height = 1080,
        screen_width = 1920
}

function slot_0_2_0()
        if not gui or not gui.ctx or not gui.ctx.Find then
                return false
        end

        slot_0_1_0.aim_fov_control = gui.ctx:Find("rage>aimbot>general>maximum fov")
        slot_0_1_0.fov_override_control = gui.ctx:Find("visuals>misc>local>fov override")
        slot_0_1_0.fov_override_value_control = gui.ctx:Find("visuals>misc>local>fov override>settings>fov")
        slot_0_1_0.rage_aimbot_control = gui.ctx:Find("rage>aimbot>general>aimbot")

        return true
end

function slot_0_3_0(arg_2_0)
        if arg_2_0 and arg_2_0.fov then
                slot_0_1_0.current_setup_fov = arg_2_0.fov
        end
end

function slot_0_4_0()
        if game and game.engine and game.engine.GetScreenSize then
                slot_0_1_0.screen_width, slot_0_1_0.screen_height = game.engine:GetScreenSize()
        end

        local var_3_0 = false

        if slot_0_1_0.fov_override_control then
                local var_3_1 = slot_0_1_0.fov_override_control:GetValue()

                if var_3_1 then
                        var_3_0 = var_3_1:Get() or false
                end
        end

        if var_3_0 and slot_0_1_0.fov_override_value_control then
                local var_3_2 = slot_0_1_0.fov_override_value_control:GetValue()

                if var_3_2 then
                        slot_0_1_0.base_fov = var_3_2:Get() or slot_0_0_0.default_base_fov
                end
        else
                slot_0_1_0.base_fov = slot_0_0_0.default_base_fov
        end

        if not slot_0_1_0.current_setup_fov or slot_0_1_0.current_setup_fov <= 0 then
                slot_0_1_0.current_setup_fov = slot_0_1_0.base_fov
        end
end

function slot_0_5_0(arg_4_0)
        local var_4_0 = slot_0_1_0.screen_width
        local var_4_1 = var_4_0 / slot_0_1_0.screen_height
        local var_4_2 = math.deg(2 * math.atan(math.tan(math.rad(slot_0_1_0.current_setup_fov) / 2) * var_4_1))

        return var_4_0 / 2 / math.tan(math.rad(var_4_2 / 2)) * math.tan(math.rad(arg_4_0 / 2)) * slot_0_0_0.radius_tweak_factor
end

function slot_0_6_0()
        slot_0_4_0()

        if not slot_0_1_0.aim_fov_control or not slot_0_1_0.rage_aimbot_control then
                return
        end

        if not slot_0_1_0.rage_aimbot_control:GetValue():Get() then
                return
        end

        if not game or not game.engine or not game.engine.InGame or not game.engine:InGame() then
                return
        end

        local var_5_0 = entities and entities.GetLocalPawn and entities.GetLocalPawn()

        if not var_5_0 then
                return
        end

        if var_5_0.m_iHealth then
                local var_5_1 = var_5_0.m_iHealth:Get()

                if not var_5_1 or var_5_1 <= 0 then
                        return
                end
        end

        local var_5_2 = slot_0_1_0.aim_fov_control:GetValue():Get()

        if not var_5_2 or var_5_2 <= 0 then
                return
        end

        local var_5_3 = slot_0_5_0(var_5_2)
        local var_5_4 = slot_0_1_0.screen_width / 2
        local var_5_5 = slot_0_1_0.screen_height / 2

        draw.surface:AddCircle(draw.Vec2(var_5_4, var_5_5), var_5_3, draw.Color(slot_0_0_0.circle.color[1], slot_0_0_0.circle.color[2], slot_0_0_0.circle.color[3], slot_0_0_0.circle.color[4]), slot_0_0_0.circle.segments, 1, slot_0_0_0.circle.thickness)
end

if not _AIM_FOV_CIRCLE_REGISTERED then
        slot_0_2_0()
        events.presentQueue:Add(slot_0_6_0)
        events.overrideView:Add(slot_0_3_0)

        _AIM_FOV_CIRCLE_REGISTERED = true
end
