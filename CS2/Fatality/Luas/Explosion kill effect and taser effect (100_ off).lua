--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.checkbox(gui.control_id("explosion enabled"))
slot_0_1_0 = gui.checkbox(gui.control_id("explosion nuke"))
slot_0_2_0 = gui.checkbox(gui.control_id("explosion taser effect bonus lul"))
slot_0_3_0 = gui.ctx:find("lua>elements a")

slot_0_3_0:add(gui.make_control("[Explosion kill effect] Enabled", slot_0_0_0))
slot_0_3_0:add(gui.make_control("[Explosion kill effect] Nuke", slot_0_1_0))
slot_0_3_0:add(gui.make_control("[Explosion extra] Force electrify yourself", slot_0_2_0))
slot_0_3_0:reset()

slot_0_4_0 = ffi.cast("__int64 (__fastcall*) (const char* a1,int a2,__int64 a3,char a4,int a5,char a6,unsigned int a7,int a8,char a9)", utils.find_pattern("client.dll", "48 89 5C 24 ? 48 89 74 24 ? 55 57 41 57 48 8D 6C 24 ? 48 81 EC ? ? ? ? 48 8B F9"))

function slot_0_5_0(arg_1_0, arg_1_1)
        if arg_1_0 == nil then
                return
        end

        local var_1_0 = ffi.cast("uintptr_t*", arg_1_0)[0]

        if var_1_0 == 0 then
                return
        end

        slot_0_4_0(arg_1_1, 3, var_1_0, 0, 0, 0, 4294967295, 0, 0)
end

function slot_0_6_0(arg_2_0)
        if slot_0_0_0:get_value():get() and arg_2_0:get_name() == "player_death" then
                slot_0_5_0(arg_2_0:get_pawn_from_id("userid"), slot_0_1_0:get_value():get() and "particles/explosions_fx/explosion_c4_500.vpcf" or "particles/explosions_fx/explosion_basic.vpcf")
                slot_0_5_0(arg_2_0:get_pawn_from_id("attacker"), "particles/blood_impact/impact_taser_bodyfx.vpcf")
                slot_0_5_0(arg_2_0:get_pawn_from_id("assister"), "particles/blood_impact/impact_taser_bodyfx.vpcf")
        end
end

function slot_0_7_0()
        if not slot_0_2_0:get_value():get() then
                return
        end

        if game.global_vars.tick_count % 64 ~= 0 then
                return
        end

        local var_3_0 = entities.get_local_pawn()

        if not var_3_0 or not var_3_0:is_alive() then
                return
        end

        slot_0_5_0(var_3_0, "particles/blood_impact/impact_taser_bodyfx.vpcf")
end

mods.events:add_listener("player_death")
events.event:add(slot_0_6_0)
events.present_queue:add(slot_0_7_0)
