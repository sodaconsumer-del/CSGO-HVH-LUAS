--by scriptleaks https://discord.gg/kTHUpjVQPV t.me/scriptleakslol

_DEBUG = false

files.create_folder("csgo\\models\\remaper")

slot_0_0_1 = {
	["csgo\\models\\remaper"] = {
		"lantern_bugs.mdl",
		"lantern_bugs.vvd",
		"lantern_bugs.dx90.vtx",
		"palacelightbugs.mdl",
		"palacelightbugs.vvd",
		"palacelightbugs.dx90.vtx",
		"polelightbugs.mdl",
		"polelightbugs.vvd",
		"polelightbugs.dx90.vtx"
	},
	["csgo\\materials\\remaper"] = {
		"irlflare.vtf",
		"light_glowirl.vmt"
	},
	["csgo\\materials\\models\\remaper"] = {
		"bugs_noise.vtf",
		"lanternbugs.vmt",
		"lanternbugs_chill.vmt"
	}
}

for iter_0_0, iter_0_1 in pairs(slot_0_0_1) do
	files.create_folder(iter_0_0)

	for iter_0_2, iter_0_3 in ipairs(iter_0_1) do
		slot_0_11_0 = iter_0_0 .. "\\" .. iter_0_3

		if files.read(slot_0_11_0) == nil then
			slot_0_12_0 = string.find(iter_0_3, ".vmt") ~= nil
			slot_0_13_0 = network.get("https://northon.dev/neverlose/remaper/" .. iter_0_3)

			if slot_0_13_0 == nil then
				print("Failed to download file")
			end

			files.write(slot_0_11_0, slot_0_13_0, not slot_0_12_0)
		end
	end
end

function slot_0_0_0()
	slot_1_0_0 = ffi.cast
	slot_1_1_0 = ffi.new
	slot_1_2_0 = ffi.string
	slot_1_3_0 = ffi.typeof
	slot_1_4_0 = ffi.C
	slot_1_5_0 = string.sub
	slot_1_6_0 = string.gsub
	slot_1_7_0 = string.format
	slot_1_8_0 = string.find
	slot_1_9_0 = string.match
	slot_1_10_0 = string.gmatch
	slot_1_11_0 = tostring
	slot_1_12_0 = tonumber
	slot_1_13_0 = pairs
	slot_1_14_0 = ipairs
	slot_1_15_0 = type
	slot_1_16_0 = next
	slot_1_17_0 = setmetatable
	slot_1_18_0 = getmetatable
	slot_1_19_0 = table.remove
	slot_1_20_0 = table.sort
	slot_1_21_0 = entity.get
	slot_1_22_0 = entity.get_local_player
	slot_1_23_0 = render.camera_angles
	slot_1_24_0 = render.world_to_screen
	slot_1_25_0 = render.circle
	slot_1_26_0 = utils.trace_line
	slot_1_27_0 = utils.execute_after
	slot_1_28_0 = materials.create
	slot_1_29_0 = materials.get_materials
	slot_1_30_0 = materials.get
	slot_1_31_0 = require("neverlose/base64")
	slot_1_32_0 = require("neverlose/memory")
	slot_1_33_0 = require("neverlose/clipboard")
	slot_1_34_1 = nil
	slot_1_35_2 = slot_1_3_0("            struct {\n                uint32_t signature;\n                uint32_t version;\n                uint32_t tree_size;\n                uint32_t file_data_section_size;\n                uint32_t archive_md5_section_size;\n                uint32_t other_md5_section_size;\n                uint32_t signature_section_size;\n            } *\n        ")
	slot_1_36_2 = slot_1_3_0("            struct {\n                uint32_t crc;\n                uint16_t preload_bytes;\n                uint16_t archive_index;\n                uint32_t entry_offset;\n                uint32_t entry_length;\n                uint16_t terminator;\n            } *\n        ")

	function slot_1_37_2(arg_2_0)
		local var_2_0 = arg_2_0

		while arg_2_0[0] ~= 0 do
			arg_2_0 = arg_2_0 + 1
		end

		return slot_1_2_0(var_2_0, slot_1_12_0(arg_2_0 - var_2_0)), arg_2_0 + 1
	end

	function slot_1_34_0(arg_3_0)
		local var_3_0 = files.read(arg_3_0, true)

		if var_3_0 == nil then
			return print("Failed to read VPK")
		end

		local var_3_1 = {}
		local var_3_2 = slot_1_0_0("uint8_t*", var_3_0)
		local var_3_3 = slot_1_0_0(slot_1_35_2, var_3_2)
		local var_3_4 = 28

		if var_3_3.signature ~= 1437209140 then
			return print("Invalid VPK signature")
		end

		local var_3_5 = var_3_2 + var_3_4

		while true do
			local var_3_6, var_3_7 = slot_1_37_2(var_3_5)

			var_3_5 = var_3_7

			if var_3_6 == "" then
				break
			end

			local var_3_8 = var_3_1[var_3_6]

			if var_3_8 == nil then
				var_3_8 = {}
				var_3_1[var_3_6] = var_3_8
			end

			while true do
				local var_3_9, var_3_10 = slot_1_37_2(var_3_5)

				var_3_5 = var_3_10

				if var_3_9 == "" then
					break
				end

				while true do
					local var_3_11, var_3_12 = slot_1_37_2(var_3_5)

					var_3_5 = var_3_12

					if var_3_11 == "" then
						break
					end

					local var_3_13 = slot_1_7_0("%s/%s.%s", var_3_9, var_3_11, var_3_6)
					local var_3_14 = slot_1_0_0(slot_1_36_2, var_3_5).preload_bytes

					var_3_5 = var_3_5 + 18 + var_3_14
					var_3_8[#var_3_8 + 1] = var_3_13
				end
			end
		end

		return var_3_1
	end

	slot_1_35_1 = nil
	slot_1_36_1 = nil
	slot_1_37_1 = nil
	slot_1_38_1 = {
		"ads/",
		"cable/",
		"carpet/",
		"ceiling/",
		"christmas/",
		"composite/",
		"console/",
		"coop_cementplant",
		"cstrike/",
		"cubemaps/",
		"de_cache/",
		"de_shacks/",
		"de_tides/",
		"debug/",
		"decals/",
		"dev/",
		"dust2_legacy/",
		"editor/",
		"effects/",
		"engine/",
		"environment maps/",
		"halflife/",
		"heatmap/",
		"hlmv/",
		"hud/",
		"icons/",
		"lights/",
		"liquids/",
		"lobby_mapveto/",
		"models/",
		"newde_cache/",
		"overlays/",
		"panorama/",
		"particle/",
		"props/",
		"road_markings/",
		"rubber/",
		"sewage",
		"signs/",
		"sixense_controller_manager/",
		"skybox/",
		"sprites/",
		"storefront_template",
		"sun/",
		"tarps/",
		"tech/",
		"tools/",
		"training/",
		"vehicle/",
		"vgui/",
		"voice/",
		"graffiti",
		"_normal",
		"_nrm",
		"ssbump"
	}
	slot_1_35_0 = slot_1_34_0("csgo\\pak01_dir.vpk").vtf

	for iter_1_0 = #slot_1_35_0, 1, -1 do
		slot_1_44_4 = slot_1_35_0[iter_1_0]
		slot_1_44_3 = slot_1_6_0(slot_1_44_4, "materials/", "")
		slot_1_35_0[iter_1_0] = slot_1_44_3

		for iter_1_1, iter_1_2 in slot_1_14_0(slot_1_38_1) do
			if slot_1_8_0(slot_1_44_3, iter_1_2) ~= nil then
				slot_1_19_0(slot_1_35_0, iter_1_0)

				break
			end
		end
	end

	slot_1_20_0(slot_1_35_0)

	slot_1_36_0, slot_1_37_0 = {}, {}

	for iter_1_3 = 1, #slot_1_35_0 do
		slot_1_44_2 = slot_1_35_0[iter_1_3]
		slot_1_45_3 = slot_1_8_0(slot_1_44_2, "/")
		slot_1_46_3 = slot_1_5_0(slot_1_44_2, 1, slot_1_45_3 - 1)
		slot_1_47_4 = slot_1_36_0[slot_1_46_3]

		if slot_1_47_4 == nil then
			slot_1_47_4 = {}
			slot_1_36_0[slot_1_46_3] = slot_1_47_4
			slot_1_37_0[#slot_1_37_0 + 1] = slot_1_46_3
		end

		slot_1_47_4[#slot_1_47_4 + 1] = slot_1_44_2
	end

	slot_1_38_0 = slot_1_3_0("        struct {\n            float x;\n            float y;\n            float z;\n        }\n    ")

	ffi.cdef("        void* VirtualProtect(void* address, unsigned long size, unsigned long new_protect, unsigned long* old_protect);\n\n        void* GetProcAddress(void*, const char*);\n        void* GetModuleHandleA(const char*);\n    ")

	slot_1_39_0 = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)")
	slot_1_40_1 = nil
	slot_1_41_1 = nil
	slot_1_42_1 = nil
	slot_1_43_1 = nil
	slot_1_40_0 = {
		"molotov_child_flame01b",
		"molotov_child_flame02b",
		"molotov_child_flame03b",
		"molotov_child_glow01b",
		"molotov_child_glow02b",
		"burning_gib_01",
		"env_fire_large",
		"env_fire_large_smoke",
		"env_fire_medium",
		"env_fire_medium_smoke",
		"env_fire_small",
		"env_fire_small_coverage",
		"env_fire_small_smoke",
		"env_fire_tiny",
		"env_fire_tiny_smoke",
		"monastery_candle_flame",
		"smoke_gib_01",
		"copter_land_loop_1",
		"copter_land_loop_1_dust_low",
		"copter_takeoff_1",
		"dust_devil",
		"dust_embers",
		"inferno_fountain_bot_rings",
		"inferno_fountain_bot_ringsplashes",
		"inferno_fountain_low_rings",
		"inferno_fountain_low_ringsplashes",
		"inferno_fountain_master",
		"inferno_fountain_top_spout",
		"light_gaslamp_glow",
		"nuke_steam_rising",
		"office_child_embers01a",
		"office_child_flame01b",
		"office_fire",
		"shacks_exhaust",
		"shacks_policelight_blue",
		"shacks_policelight_blue_core",
		"shacks_policelight_blue_fallback",
		"shacks_policelight_red",
		"shacks_policelight_red_core",
		"shacks_steam_child_base",
		"shacks_steam_short",
		"shacks_steam_short_child_cloud",
		"shacks_steam_short_child_mist"
	}
	slot_1_41_0 = {
		"remaper/light_glowirl.vmt",
		"sprites/light_glow02.vmt",
		"sprites/light_glow03.vmt",
		"sprites/glow.vmt",
		"sprites/glow01.vmt",
		"sprites/glow03.vmt",
		"sprites/glow04.vmt",
		"sprites/glow04_noz.vmt",
		"sprites/glow06.vmt",
		"sprites/glow07.vmt",
		"sprites/glow_test01.vmt",
		"sprites/glow_test01b.vmt",
		"sprites/glow_test02.vmt",
		"sprites/glow_test02_nofog.vmt",
		"sprites/halo.vmt",
		"sprites/ledglow.vmt",
		"sprites/nuke_sunflare_001.vmt",
		"sprites/purplelaser1.vmt",
		"sprites/bubble.vmt",
		"sprites/glow01.spr"
	}
	slot_1_42_0 = {
		"models/remaper/lantern_bugs.mdl",
		"models/remaper/polelightbugs.mdl",
		"models/remaper/palacelightbugs.mdl",
		"models/props/gg_tibet/candlestickwideshortonplate.mdl",
		"models/props/de_vertigo/construction_safety_lamp.mdl",
		"models/props/de_aztec/hr_aztec/aztec_lighting/aztec_lighting_lantern_01_unlit.mdl",
		"models/props/de_aztec/hr_aztec/aztec_lighting/aztec_lighting_lantern_01_lit.mdl",
		"models/props/de_aztec/hr_aztec/aztec_lighting/aztec_lighting_lantern_01_hanger.mdl",
		"models/props/de_dust/hr_dust/dust_lights/dust_street_lantern_03_small.mdl",
		"models/props/de_dust/hr_dust/dust_lights/dust_street_lantern_03.mdl",
		"models/props/de_dust/hr_dust/dust_lights/dust_street_lantern_02_small.mdl",
		"models/props/de_dust/hr_dust/dust_lights/dust_street_lantern_02.mdl",
		"models/props/de_dust/hr_dust/dust_lights/dust_street_lantern_01_small.mdl",
		"models/props/de_dust/hr_dust/dust_lights/dust_street_lantern_01.mdl",
		"models/props/de_dust/hr_dust/dust_lights/dust_ornate_lantern_chain_48.mdl",
		"models/props/de_dust/hr_dust/dust_lights/dust_ornate_lantern_chain_32.mdl",
		"models/props/de_dust/hr_dust/dust_lights/dust_ornate_lantern_chain_16.mdl",
		"models/props/de_dust/hr_dust/dust_lights/dust_ornate_lantern_chain_08.mdl",
		"models/props/de_dust/hr_dust/dust_lights/dust_ornate_lantern_bracket_01.mdl",
		"models/props/de_dust/hr_dust/dust_lights/dust_ornate_lantern_06.mdl",
		"models/props/de_dust/hr_dust/dust_lights/dust_ornate_lantern_05.mdl",
		"models/props/de_dust/hr_dust/dust_lights/dust_ornate_lantern_04.mdl",
		"models/props/de_dust/hr_dust/dust_lights/dust_ornate_lantern_03.mdl",
		"models/props/de_dust/hr_dust/dust_lights/dust_ornate_lantern_02.mdl",
		"models/props/de_dust/hr_dust/dust_lights/dust_ornate_lantern_01.mdl",
		"models/props/de_dust/hr_dust/dust_lights/dust_hanging_lantern_01_small.mdl",
		"models/props/gg_vietnam/street_lanterns02.mdl",
		"models/props/gg_vietnam/street_lanterns01.mdl",
		"models/props/cs_italy/it_lantern2.mdl",
		"models/props/cs_italy/it_lantern1_off.mdl",
		"models/props/cs_italy/it_lantern1.mdl",
		"models/props/coop_kashbah/floor_lamp/floor_lamp.mdl",
		"models/props/coop_kashbah/sick_bed/surgical_lamp.mdl",
		"models/props/hr_massive/survival_telephone_poles/telephone_pole_lamp.mdl",
		"models/props/hr_massive/survival_lighting/survival_ceiling_lamp.mdl",
		"models/props/de_inferno/hr_i/ornate_lamp/ornate_lamp.mdl",
		"models/props_interiors/lamp_table02_gib2.mdl",
		"models/props_interiors/lamp_table02_gib1.mdl",
		"models/props_interiors/lamp_table02.mdl",
		"models/props_interiors/lamp_floor_gib2.mdl",
		"models/props_interiors/lamp_floor_gib1.mdl",
		"models/props_interiors/lamp_floor.mdl",
		"models/props_interiors/furniture_lamp01a_static.mdl",
		"models/props_c17/lamppost03a_off.mdl",
		"models/props/de_mirage/lamp_ver5.mdl",
		"models/props/de_mirage/lamp_ver4.mdl",
		"models/props/de_mirage/lamp_ver3.mdl",
		"models/props/de_mirage/lamp_ver2.mdl",
		"models/props/de_mirage/lamp_ver1.mdl",
		"models/props/de_inferno/wall_lamp3.mdl",
		"models/props/de_inferno/wall_lamp2.mdl",
		"models/props/de_inferno/wall_lamp.mdl",
		"models/props/de_cbble/lamp_a/lamp_a.mdl",
		"models/props/cs_italy/it_streetlampleg.mdl",
		"models/props/cs_italy/it_lampholder2.mdl",
		"models/props/cs_italy/it_lampholder1.mdl",
		"models/props_urban/telephone_streetlight001.mdl",
		"models/props_urban/streetlight001.mdl",
		"models/props_urban/porch_light003.mdl",
		"models/props_urban/porch_light002_02.mdl",
		"models/props_urban/porch_light001.mdl",
		"models/props/de_inferno/ceiling_light.mdl",
		"models/props_equipment/light_floodlight.mdl"
	}
	slot_1_43_0 = {
		"sprites/glow_test01.vmt",
		"sprites/glow_test01b.vmt",
		"sprites/glow_test02.vmt",
		"sprites/glow_test02_nofog.vmt"
	}
	slot_1_44_1 = nil
	slot_1_44_0 = {}

	ui.sidebar("\a{Link Active}World Editor", "")

	slot_1_44_0.is_editing = false
	slot_1_44_0.is_point_custom_position = false
	slot_1_45_2 = false
	slot_1_46_2 = ui.create("Main", "\n Map Name", 1)
	slot_1_47_3 = ui.create("Main", "Presets", 1)
	slot_1_48_3 = ui.create("Main", "Point: Position", 2)
	slot_1_49_4 = ui.create("Main", "Point: Settings", 2)
	slot_1_50_3 = ui.create("Main", "Ambient per map", 2)
	slot_1_51_3 = ui.create("Main", "Weather per map", 2)
	slot_1_44_0.current_map_name = slot_1_46_2:label("Settings for: ")
	slot_1_44_0.presets = slot_1_47_3:list("\n Presets", "+ Create New")
	slot_1_44_0.enabled = slot_1_47_3:switch("Enabled")
	slot_1_44_0.name = slot_1_47_3:input("\n Name")
	slot_1_44_0.create = slot_1_47_3:button("Create")
	slot_1_44_0.edit = slot_1_47_3:button("Edit")
	slot_1_44_0.delete = slot_1_47_3:button("Delete")
	slot_1_44_0.points_list = slot_1_47_3:list("Points", "+ Create New")
	slot_1_44_0.back = slot_1_47_3:button("Back")

	slot_1_44_0.presets:set_callback(function(arg_4_0)
		local var_4_0 = arg_4_0:get()
		local var_4_1 = #arg_4_0:list()
		local var_4_2 = var_4_0 == 1
		local var_4_3 = var_4_0 == var_4_1
		local var_4_4 = not var_4_3

		slot_1_44_0.name:visibility(var_4_3 and not var_4_2)
		slot_1_44_0.create:visibility(var_4_3 and not var_4_2)
		slot_1_44_0.enabled:visibility(not var_4_3)
		slot_1_44_0.edit:visibility(var_4_4 and not var_4_2)
		slot_1_44_0.back:visibility(false)
		slot_1_44_0.delete:visibility(var_4_4 and not var_4_2)
		slot_1_44_0.points_list:visibility(false)
		slot_1_48_3:visibility(false)
		slot_1_49_4:visibility(false)

		local var_4_5 = slot_1_44_0.point_delete

		if var_4_5 ~= nil then
			var_4_5:visibility(false)
		end
	end, true)
	slot_1_44_0.edit:set_callback(function(arg_5_0)
		slot_1_44_0.is_editing = true

		slot_1_44_0.presets:visibility(false)
		slot_1_44_0.enabled:visibility(false)
		slot_1_44_0.name:visibility(false)
		slot_1_44_0.create:visibility(false)
		slot_1_44_0.edit:visibility(false)
		slot_1_44_0.delete:visibility(false)
		slot_1_44_0.back:visibility(true)
		slot_1_44_0.points_list:visibility(true)
		slot_1_48_3:visibility(true)
		slot_1_49_4:visibility(false)

		local var_5_0 = slot_1_44_0.point_delete

		if var_5_0 ~= nil then
			var_5_0:visibility(false)
		end

		slot_1_50_3:visibility(false)
		slot_1_51_3:visibility(false)
	end)
	slot_1_44_0.back:set_callback(function(arg_6_0)
		slot_1_44_0.is_editing = false

		slot_1_44_0.presets:visibility(true)
		slot_1_44_0.presets:set(1)
		slot_1_44_0.points_list:visibility(false)
		slot_1_50_3:visibility(true)
		slot_1_51_3:visibility(true)
	end)
	slot_1_44_0.points_list:set_callback(function(arg_7_0)
		local var_7_0 = arg_7_0:get() == #arg_7_0:list()
		local var_7_1 = slot_1_44_0.is_editing

		slot_1_48_3:visibility(var_7_0 and var_7_1)
		slot_1_49_4:visibility(not var_7_0 and var_7_1)

		local var_7_2 = slot_1_44_0.point_delete

		if var_7_2 ~= nil then
			var_7_2:visibility(not var_7_0)
		end
	end)

	slot_1_44_0.point_delete = slot_1_47_3:button("Delete \n Point")
	slot_1_44_0.static_props = slot_1_48_3:list("Static Props (Sorted by Crosshair)", "")
	slot_1_44_0.set_position = slot_1_48_3:button("Set")

	slot_1_44_0.set_position:set_callback(function()
		slot_1_48_3:visibility(false)
		slot_1_49_4:visibility(true)
	end)

	slot_1_44_0.position_label = slot_1_49_4:label("Position")
	slot_1_44_0.point_name = slot_1_49_4:input("Name")
	slot_1_44_0.point_position_x = slot_1_49_4:slider("Position X", -20000, 20000, 0, 1)
	slot_1_44_0.point_position_y = slot_1_49_4:slider("Position Y", -20000, 20000, 0, 1)
	slot_1_44_0.point_position_z = slot_1_49_4:slider("Position Z", -20000, 20000, 0, 1)
	slot_1_44_0.point_type = slot_1_49_4:combo("Type", "Particle", "Model", "Sprite", "Beam")
	slot_1_44_0.point_model = slot_1_49_4:combo("\n Model", "")
	slot_1_44_0.point_angles_offset = slot_1_49_4:slider("Angles Offset", -300, 300, 0, 1, function(arg_9_0)
		if arg_9_0 == 0 then
			return "Off"
		end

		return arg_9_0
	end)
	slot_1_44_0.point_custom_yaw_offset = slot_1_44_0.point_angles_offset:create():slider("Custom Yaw Offset", -180, 180, 0, 1, function(arg_10_0)
		if arg_10_0 == 0 then
			return "Off"
		end

		return arg_10_0
	end)
	slot_1_44_0.point_position_z_offset = slot_1_49_4:slider("Position Z Offset", -300, 300, 0, 1, function(arg_11_0)
		if arg_11_0 == 0 then
			return "Off"
		end

		return arg_11_0
	end)
	slot_1_44_0.point_end_position_offset = slot_1_49_4:slider("End Position Offset", -300, 300, 0, 1, function(arg_12_0)
		if arg_12_0 == 0 then
			return "Off"
		end

		return arg_12_0
	end)
	slot_1_44_0.point_start_width = slot_1_49_4:slider("Start Width", 1, 150, 20)
	slot_1_44_0.point_end_width = slot_1_49_4:slider("End Width", 1, 150, 20)
	slot_1_44_0.point_scale = slot_1_49_4:slider("Scale", 10, 500, 100, 0.01)
	slot_1_44_0.point_set_angles = slot_1_49_4:switch("Set Angles")
	slot_1_53_5 = slot_1_44_0.point_set_angles:create()
	slot_1_44_0.point_set_angles_x_offset = slot_1_53_5:slider("Angles X Offset", -180, 180, 0)
	slot_1_44_0.point_set_angles_y_offset = slot_1_53_5:slider("Angles Y Offset", -180, 180, 0)
	slot_1_44_0.point_set_angles_z_offset = slot_1_53_5:slider("Angles Z Offset", -180, 180, 0)
	slot_1_44_0.point_hdr_color_scale = slot_1_49_4:slider("HDR Color Scale", 1, 30, 10, 0.1)
	slot_1_44_0.point_color = slot_1_49_4:color_picker("Color")
	slot_1_44_0.point_render_mode = slot_1_49_4:combo("Render Mode", "Normal", "Transparent Color Blend", "Transparent Texture Blend", "Glow Ignore Z", "Alpha Based Transparency", "Additive Glow", "Additive With Frame Blending", "Alpha Additive", "World Glow")
	slot_1_44_0.point_save = slot_1_49_4:button("Save")
	slot_1_54_5 = {
		Particle = slot_1_40_0,
		Model = slot_1_42_0,
		Sprite = slot_1_41_0,
		Beam = slot_1_43_0
	}

	slot_1_44_0.point_type:set_callback(function(arg_13_0)
		local var_13_0 = arg_13_0:get()
		local var_13_1 = slot_1_54_5[var_13_0]
		local var_13_2 = {}

		for iter_13_0, iter_13_1 in slot_1_14_0(var_13_1) do
			var_13_2[#var_13_2 + 1] = iter_13_1
		end

		slot_1_44_0.point_model:update(var_13_2)

		local var_13_3 = slot_1_44_0.is_point_custom_position
		local var_13_4 = var_13_0 == "Particle"
		local var_13_5 = var_13_0 == "Model"
		local var_13_6 = var_13_0 == "Sprite"
		local var_13_7 = var_13_0 == "Beam"

		slot_1_44_0.point_angles_offset:visibility(not var_13_3)
		slot_1_44_0.point_set_angles:visibility(var_13_5)
		slot_1_44_0.point_scale:visibility(not var_13_4 and not var_13_7)
		slot_1_44_0.point_color:visibility(not var_13_4)
		slot_1_44_0.point_hdr_color_scale:visibility(var_13_6)
		slot_1_44_0.point_render_mode:visibility(var_13_6)
		slot_1_44_0.point_end_position_offset:visibility(var_13_7)
		slot_1_44_0.point_start_width:visibility(var_13_7)
		slot_1_44_0.point_end_width:visibility(var_13_7)
		slot_1_44_0.point_position_z_offset:visibility(not var_13_3)
		slot_1_44_0.point_position_x:visibility(var_13_3)
		slot_1_44_0.point_position_y:visibility(var_13_3)
		slot_1_44_0.point_position_z:visibility(var_13_3)
	end, true)

	slot_1_44_0.override_night_mode = slot_1_50_3:switch("Night Mode")
	slot_1_44_0.override_night_mode_color = slot_1_44_0.override_night_mode:color_picker()
	slot_1_44_0.override_static_props = slot_1_50_3:switch("Static Props")
	slot_1_44_0.override_static_props_color = slot_1_44_0.override_static_props:color_picker()
	slot_1_44_0.override_post_processing = slot_1_50_3:switch("Post Processing")
	slot_1_44_0.override_post_processing_color = slot_1_44_0.override_post_processing:color_picker()
	slot_1_44_0.override_fog_changer = slot_1_50_3:combo("Fog Changer", "Off", "Clean", "Override")
	slot_1_52_7 = slot_1_44_0.override_fog_changer:create()
	slot_1_44_0.override_fog_changer_color = slot_1_52_7:color_picker("Color")
	slot_1_44_0.override_fog_changer_start = slot_1_52_7:slider("Start", -50, 150, 0, 1)
	slot_1_44_0.override_fog_changer_distance = slot_1_52_7:slider("Distance", -50, 150, 0, 1)
	slot_1_44_0.override_illumination = slot_1_50_3:combo("Illumination", "Off", "Bright", "Sunlight")
	slot_1_52_6 = slot_1_44_0.override_illumination:create()
	slot_1_44_0.override_illumination_pitch = slot_1_52_6:slider("Pitch", 0, 89, 0, 1)
	slot_1_44_0.override_illumination_yaw = slot_1_52_6:slider("Yaw", -179, 179, 0, 1)
	slot_1_44_0.override_illumination_distance = slot_1_52_6:slider("Distance", 50, 1500, 50, 1)
	slot_1_44_0.override_illumination_enabled_color = slot_1_52_6:switch("Color")
	slot_1_44_0.override_illumination_color = slot_1_44_0.override_illumination_enabled_color:color_picker()
	slot_1_44_0.weather_enabled = slot_1_51_3:switch("Enabled")
	slot_1_52_5 = slot_1_44_0.weather_enabled:create()
	slot_1_44_0.weather_type = slot_1_52_5:combo("Type", "Rain", "Rain 2", "Particle Rain", "Particle Ash", "Particle Snow")
	slot_1_44_0.weather_radius = slot_1_52_5:slider("Radius", 0, 1500, 1000)
	slot_1_44_0.weather_width = slot_1_52_5:slider("Width", 0, 100, 50, 0.01)
	slot_1_44_0.weather_density = slot_1_52_5:slider("Density", 10, 200, 65, 0.01)
	slot_1_52_4 = nil
	slot_1_52_3 = {}
	slot_1_52_3.is_editing = false
	slot_1_53_4 = ui.create("Textures", "Presets", 1)
	slot_1_54_4 = ui.create("Textures", "Preset Editing", 1)
	slot_1_55_5 = ui.create("Textures", "Texture", 2)
	slot_1_56_7 = ui.create("Textures", "Textures", 2)
	slot_1_52_3.presets = slot_1_53_4:list("\n Presets", "+ Create New")
	slot_1_52_3.preset_enabled = slot_1_53_4:switch("Enabled")
	slot_1_52_3.preset_edit = slot_1_53_4:button("Edit")
	slot_1_52_3.preset_delete = slot_1_53_4:button("Delete")
	slot_1_52_3.preset_name = slot_1_53_4:input("\n Name")
	slot_1_52_3.preset_create = slot_1_53_4:button("Create")
	slot_1_52_3.is_editing_create_new = false
	slot_1_52_3.preset_editing_list = slot_1_54_4:list("\n Preset Editing List", "+ Create New")
	slot_1_52_3.preset_editing_delete = slot_1_54_4:button("Delete \n")
	slot_1_52_3.back = slot_1_54_4:button("Back")

	slot_1_52_3.preset_editing_list:set_callback(function(arg_14_0)
		local var_14_0 = arg_14_0:get() == #arg_14_0:list()

		slot_1_52_3.is_editing_create_new = var_14_0

		slot_1_52_3.preset_editing_delete:visibility(not var_14_0)

		local var_14_1 = slot_1_52_3.selected_material

		if var_14_1 ~= nil then
			slot_1_52_3.material_by_crosshair:visibility(var_14_0)
			slot_1_52_3.select_material_by_crosshair:visibility(var_14_0)
			var_14_1:visibility(not var_14_0)

			slot_1_52_3.is_material_selected = not var_14_0

			slot_1_52_3.color:visibility(not var_14_0)
			slot_1_52_3.selected_texture:visibility(not var_14_0)
			slot_1_52_3.selected_texture:name("Selected Texture: None")
			slot_1_52_3.select_texture:visibility(not var_14_0)
			slot_1_52_3.texture_save:visibility(not var_14_0)
			slot_1_52_3.texture_teleport:visibility(not var_14_0)
		end

		slot_1_56_7:visibility(false)
	end, true)

	slot_1_52_3.is_material_selected = false
	slot_1_52_3.material_by_crosshair = slot_1_55_5:label("Material By Crosshair: ")
	slot_1_52_3.select_material_by_crosshair = slot_1_55_5:button("Select Material")
	slot_1_52_3.selected_material = slot_1_55_5:label("Selected Material: ")
	slot_1_52_3.selected_texture = slot_1_55_5:label("Selected Texture: None")
	slot_1_52_3.select_texture = slot_1_55_5:button("Select")
	slot_1_52_3.color = slot_1_55_5:color_picker("Color")
	slot_1_52_3.texture_teleport = slot_1_55_5:button("Teleport")
	slot_1_52_3.texture_save = slot_1_55_5:button("Save \n")

	slot_1_52_3.select_material_by_crosshair:set_callback(function()
		slot_1_52_3.is_material_selected = true

		slot_1_52_3.material_by_crosshair:visibility(false)
		slot_1_52_3.select_material_by_crosshair:visibility(false)
		slot_1_52_3.selected_material:visibility(true)
		slot_1_52_3.color:visibility(true)
		slot_1_52_3.selected_texture:visibility(true)
		slot_1_52_3.selected_texture:name("Selected Texture: None")
		slot_1_52_3.select_texture:visibility(true)
		slot_1_52_3.texture_save:visibility(true)
		slot_1_52_3.texture_teleport:visibility(false)
	end)
	slot_1_52_3.select_texture:set_callback(function()
		slot_1_55_5:visibility(false)
		slot_1_56_7:visibility(true)
	end)

	slot_1_52_3.textures_group = slot_1_56_7:combo("\n Groups", slot_1_37_0)
	slot_1_57_10 = nil
	slot_1_57_9 = {}

	for iter_1_4, iter_1_5 in slot_1_14_0(slot_1_37_0) do
		slot_1_63_12 = slot_1_36_0[iter_1_5]
		slot_1_64_12 = {}

		for iter_1_6, iter_1_7 in slot_1_14_0(slot_1_63_12) do
			iter_1_7 = slot_1_6_0(iter_1_7, iter_1_5 .. "/", "")
			iter_1_7 = slot_1_6_0(iter_1_7, ".vtf", "")
			slot_1_64_12[#slot_1_64_12 + 1] = iter_1_7
		end

		slot_1_57_9[iter_1_5] = slot_1_56_7:list("\n Textures " .. iter_1_5, slot_1_64_12)
	end

	slot_1_52_3.textures_group:set_callback(function(arg_17_0)
		local var_17_0 = arg_17_0:get()

		for iter_17_0, iter_17_1 in slot_1_13_0(slot_1_57_9) do
			local var_17_1 = var_17_0 == iter_17_0

			iter_17_1:visibility(var_17_1)
		end
	end, true)

	slot_1_52_3.textures_group_lists = slot_1_57_9
	slot_1_52_3.texture_select = slot_1_56_7:button("Select Texture")

	slot_1_52_3.texture_select:set_callback(function()
		slot_1_55_5:visibility(true)
		slot_1_56_7:visibility(false)
	end)
	slot_1_52_3.presets:set_callback(function(arg_19_0)
		local var_19_0 = arg_19_0:get()
		local var_19_1 = #arg_19_0:list()
		local var_19_2 = var_19_0 == 1
		local var_19_3 = var_19_0 == var_19_1
		local var_19_4 = not var_19_3

		slot_1_52_3.preset_enabled:visibility(not var_19_3)
		slot_1_52_3.preset_edit:visibility(var_19_4 and not var_19_2)
		slot_1_52_3.preset_delete:visibility(var_19_4 and not var_19_2)
		slot_1_52_3.preset_name:visibility(var_19_3 and not var_19_2)
		slot_1_52_3.preset_create:visibility(var_19_3 and not var_19_2)
	end, true)
	slot_1_52_3.preset_edit:set_callback(function()
		slot_1_52_3.is_editing = true

		slot_1_53_4:visibility(false)
		slot_1_54_4:visibility(true)
		slot_1_55_5:visibility(true)

		slot_1_52_3.is_editing_create_new = false

		slot_1_52_3.selected_material:visibility(false)
		slot_1_52_3.material_by_crosshair:visibility(true)
		slot_1_52_3.select_material_by_crosshair:visibility(true)

		slot_1_52_3.is_material_selected = false

		slot_1_52_3.color:visibility(false)
		slot_1_52_3.selected_texture:visibility(false)
		slot_1_52_3.selected_texture:name("Selected Texture: None")
		slot_1_52_3.select_texture:visibility(false)
		slot_1_52_3.texture_save:visibility(false)
	end)
	slot_1_52_3.back:set_callback(function()
		slot_1_52_3.is_editing = false

		slot_1_53_4:visibility(true)
		slot_1_54_4:visibility(false)
		slot_1_55_5:visibility(false)
		slot_1_56_7:visibility(false)

		slot_1_52_3.is_editing_create_new = false

		slot_1_52_3.selected_material:visibility(false)
		slot_1_52_3.material_by_crosshair:visibility(true)
		slot_1_52_3.select_material_by_crosshair:visibility(true)

		slot_1_52_3.is_material_selected = false

		slot_1_52_3.color:visibility(false)
		slot_1_52_3.selected_texture:visibility(false)
		slot_1_52_3.selected_texture:name("Selected Texture: None")
		slot_1_52_3.select_texture:visibility(false)
		slot_1_52_3.texture_save:visibility(false)
	end, true)

	slot_1_44_0.textures = slot_1_52_3

	slot_1_27_0(0.05, slot_1_44_0.presets.set, slot_1_44_0.presets, 1)

	slot_1_45_1 = nil

	function slot_1_45_0(arg_22_0, arg_22_1)
		local var_22_0 = slot_1_1_0("unsigned long[1]")

		slot_1_4_0.VirtualProtect(slot_1_0_0("void*", arg_22_0), 1, 64, var_22_0)

		slot_1_0_0("uint8_t*", arg_22_0)[0] = arg_22_1

		slot_1_4_0.VirtualProtect(slot_1_0_0("void*", arg_22_0), 1, var_22_0[0], var_22_0)
	end

	slot_1_46_1 = nil
	slot_1_47_2 = utils.opcode_scan("client.dll", "55 8B EC 83 E4 F8 83 EC 30 C6")
	slot_1_48_2 = slot_1_0_0("void(__thiscall*)(void*)", slot_1_47_2)
	slot_1_49_3 = {}

	function slot_1_46_0(arg_23_0)
		slot_1_49_3[#slot_1_49_3 + 1] = arg_23_0
	end

	slot_1_32_0.hook_func(slot_1_48_2, function(arg_24_0, arg_24_1)
		for iter_24_0 = 1, #slot_1_49_3 do
			slot_1_49_3[iter_24_0]()
		end

		arg_24_0:get_original(arg_24_1)
	end)

	slot_1_47_1 = nil
	slot_1_48_1 = nil
	slot_1_49_2 = slot_1_3_0("            struct {\n                $ m_vOrigin;\n                $ m_vStart;\n                $ m_vNormal;\n                $ m_vAngles;\n\n                int m_fFlags;\n                void* m_hEntity;\n                void* pad_0x34;\n\n                float m_flScale;\n                float m_flMagnitude;\n                float m_flRadius;\n\n                int m_nAttachmentIndex;\n                int m_nSurfaceProp;\n                int m_nMaterial;\n                int m_nDamageType;\n                int m_nHitBox;\n                int m_nOtherEntIndex;\n                int m_nColor;\n                bool m_bPositionsAreRelativeToEntity;\n                char pad2[3];\n                int m_iEffectName;\n            }\n        ", slot_1_38_0, slot_1_38_0, slot_1_38_0, slot_1_38_0)
	slot_1_50_2 = utils.opcode_scan("client.dll", "55 8B EC 83 EC 18 A1 ?? ?? ?? ?? 89 55")
	slot_1_51_2 = slot_1_0_0(slot_1_3_0("int(__fastcall*)(const char*, $&)", slot_1_49_2), slot_1_50_2)
	slot_1_52_2 = utils.opcode_scan("client.dll", "56 8B F1 85 F6 74 22")
	slot_1_53_3 = slot_1_0_0("int (__thiscall*)(const char*)", slot_1_52_2)
	slot_1_54_3 = utils.opcode_scan("client.dll", "56 57 8B F9 8B 0D ?? ?? ?? ?? 6A 00 6A FF")
	slot_1_55_4 = slot_1_0_0("int (__thiscall*)(const char*)", slot_1_54_3)
	slot_1_56_6 = utils.opcode_scan("client.dll", "7E 42 8B 57 08")
	slot_1_57_8 = utils.opcode_scan("client.dll", "7E 42 5F 5E 5D")
	slot_1_58_7 = {}

	function slot_1_47_0(arg_25_0, arg_25_1)
		local var_25_0 = slot_1_53_3(arg_25_0)

		if var_25_0 == 0 then
			var_25_0 = slot_1_55_4(arg_25_0)
		end

		if var_25_0 == 0 then
			return print("failed to create: " .. arg_25_0)
		end

		slot_1_58_7[var_25_0] = true

		local var_25_1 = slot_1_49_2()

		var_25_1.m_vOrigin = slot_1_38_0(arg_25_1.x, arg_25_1.y, arg_25_1.z)

		local var_25_2 = slot_1_0_0("uintptr_t", slot_1_39_0(0))
		local var_25_3 = slot_1_0_0("uintptr_t*", var_25_2 + 652)[0]

		var_25_1.m_hEntity = slot_1_0_0("void*", var_25_3)
		var_25_1.m_nHitBox = var_25_0

		slot_1_51_2("ParticleEffect", var_25_1)
	end

	function slot_1_59_8()
		local var_26_0 = slot_1_0_0("uintptr_t", slot_1_39_0(0))

		if var_26_0 == 0 then
			return
		end

		local var_26_1 = slot_1_0_0("uintptr_t*", var_26_0 + 652)[0]

		for iter_26_0 in slot_1_13_0(slot_1_58_7) do
			if iter_26_0 < 0 then
				slot_1_45_0(slot_1_56_6, 127)
				slot_1_45_0(slot_1_57_8, 127)
			end

			local var_26_2 = slot_1_49_2()

			var_26_2.m_hEntity = slot_1_0_0("void*", var_26_1)
			var_26_2.m_nHitBox = iter_26_0

			slot_1_51_2("ParticleEffectStop", var_26_2)

			if iter_26_0 < 0 then
				slot_1_45_0(slot_1_56_6, 126)
				slot_1_45_0(slot_1_57_8, 126)
			end
		end

		slot_1_58_7 = {}
	end

	slot_1_48_0 = slot_1_59_8

	events.shutdown(slot_1_59_8)

	slot_1_49_1 = nil
	slot_1_50_1 = nil
	slot_1_51_1 = nil
	slot_1_52_1 = nil
	slot_1_53_2 = slot_1_0_0("void*", 0)
	slot_1_54_2 = slot_1_3_0("            struct {\n                int type;\n                void* start_entity;\n                int start_attachment;\n                void* end_entity;\n                int end_attachment;\n                $ start_position;\n                $ end_position;\n                int model_index;\n                const char* model_name;\n                int halo_index;\n                const char* halo_name;\n                float halo_scale;\n                float life;\n                float start_width;\n                float end_width;\n                float fade_length;\n                float amplitude;\n                float brightness;\n                float speed;\n                int start_frame;\n                float frame_rate;\n                float red;\n                float green;\n                float blue;\n                bool renderable;\n                int segments;\n                int flags;\n\n                $ center_position;\n                float start_radius;\n                float end_radius;\n            }\n        ", slot_1_38_0, slot_1_38_0, slot_1_38_0)
	slot_1_55_3 = utils.opcode_scan("client.dll", "A1 ?? ?? ?? ?? 56 57 8B F9 8B 08 8D")
	slot_1_56_5 = slot_1_0_0("void*(__fastcall*)(size_t)", slot_1_55_3)
	slot_1_57_7 = utils.opcode_scan("client.dll", "55 8B EC 83 EC 0C 53 56 57 8B F1 E8 ?? ?? ?? ?? C7")
	slot_1_58_6 = slot_1_0_0("void*(__fastcall*)(void*)", slot_1_57_7)
	slot_1_59_7 = utils.opcode_scan("client.dll", "55 8B EC 8B 55 08 56 57 8B F9 85 D2 74 1B")
	slot_1_60_6 = slot_1_0_0("bool(__thiscall*)(void*, const char*, bool)", slot_1_59_7)
	slot_1_61_9 = utils.opcode_scan("client.dll", "55 8B EC 83 E4 F8 51 53 56 57 8B F1 E8 ?? ?? ?? ?? 8B 7D")
	slot_1_62_10 = slot_1_0_0(slot_1_3_0("void(__thiscall*)(void*, $*)", slot_1_38_0), slot_1_61_9)
	slot_1_63_11 = utils.opcode_scan("client.dll", "55 8B EC 83 E4 F8 83 EC 64 53 56 57 8B F1")
	slot_1_64_11 = slot_1_0_0(slot_1_3_0("void(__thiscall*)(void*, $*)", slot_1_38_0), slot_1_63_11)
	slot_1_65_11 = utils.opcode_scan("client.dll", "56 8B F1 6A 3C")
	slot_1_65_10 = slot_1_0_0("uintptr_t", slot_1_65_11) - 32
	slot_1_66_8 = slot_1_0_0("void(__thiscall*)(void*)", slot_1_65_10)
	slot_1_67_10 = 10640
	slot_1_68_9 = utils.opcode_scan("client.dll", "55 8B EC 83 EC 08 56 8B F1 E8 ?? ?? ?? ?? C7 86")
	slot_1_69_7 = slot_1_0_0("void*(__fastcall*)(void*)", slot_1_68_9)
	slot_1_70_6 = utils.opcode_scan("client.dll", "55 8B EC 83 E4 F8 83 EC 08 BA")
	slot_1_71_8 = slot_1_0_0("bool(__thiscall*)(void*, const char*, const char*)", slot_1_70_6)
	slot_1_72_7 = utils.opcode_scan("client.dll", "55 8B EC 83 EC 1C 56 8B F1 6A")
	slot_1_73_4 = slot_1_0_0("bool(__thiscall*)(void*)", slot_1_72_7)
	slot_1_74_2 = utils.opcode_scan("client.dll", "83 3D ?? ?? ?? ?? ?? 7E 20 0F 1F 80 00 00 00 00 A1 ?? ?? ?? ?? 8B 08 8B 41 08 83 C1 08 FF 50 ?? 83 3D ?? ?? ?? ?? ?? 7F E7 C3")
	slot_1_75_3 = slot_1_0_0("void (__fastcall*)()", slot_1_74_2)
	slot_1_76_0 = 2643
	slot_1_77_3 = utils.opcode_scan("client.dll", "A1 ?? ?? ?? ?? FF 50 ?? 5F 5E 33 C0")
	slot_1_77_2 = slot_1_0_0("uintptr_t", slot_1_77_3) + 1
	slot_1_77_1 = slot_1_0_0("uintptr_t*", slot_1_77_2)[0]
	slot_1_77_0 = slot_1_0_0("void*", slot_1_77_1)
	slot_1_78_0 = utils.opcode_scan("client.dll", "55 8B EC 83 E4 F8 83 EC 28 89")
	slot_1_79_1 = slot_1_0_0("void (__thiscall*)(void*, void*)", slot_1_78_0)
	slot_1_80_1 = utils.opcode_scan("client.dll", "55 8B EC 56 8B 75 08 0F 57 C9 57 8B F9 F3 0F 10 46 40 0F 2E C1 9F F6 C4 44 7B 17")
	slot_1_81_0 = slot_1_0_0(slot_1_3_0("void*(__thiscall*)(void*, $*)", slot_1_54_2), slot_1_80_1)
	slot_1_82_0 = utils.opcode_scan("client.dll", "55 8B EC 56 8B 75 08 57 8B F9 8D 86")
	slot_1_83_0 = slot_1_0_0("void (__thiscall*)(void*, void*)", slot_1_82_0)
	slot_1_84_0 = utils.get_vfunc("engine.dll", "VModelInfoClient004", 2, "int(__thiscall*)(void*, const char*)")
	slot_1_85_0 = utils.get_vfunc("engine.dll", "VModelInfoClient004", 39, "void*(__thiscall*)(void*, const char*)")
	slot_1_86_0 = utils.get_vfunc("engine.dll", "VEngineClientStringTable001", 3, "void*(__thiscall*)(void*, const char*)")

	function slot_1_87_0(arg_27_0)
		local var_27_0 = slot_1_86_0("modelprecache")

		if var_27_0 == nil then
			return false
		end

		local var_27_1 = slot_1_0_0("void***", var_27_0)

		if var_27_1 == nil then
			return false
		end

		slot_1_85_0(arg_27_0)

		if slot_1_0_0("int(__thiscall*)(void*, bool, const char*, int, const void*)", var_27_1[0][8])(var_27_1, false, arg_27_0, -1, nil) > 0 then
			return true
		end

		return false
	end

	function slot_1_88_0(arg_28_0)
		local var_28_0 = slot_1_0_0("uintptr_t", arg_28_0) + 8

		arg_28_0 = slot_1_0_0("void*", var_28_0)

		slot_1_66_8(arg_28_0)
	end

	slot_1_89_0 = {}

	function slot_1_49_0(arg_29_0)
		local var_29_0 = arg_29_0.model_name

		if slot_1_84_0(var_29_0) == -1 and not slot_1_87_0(var_29_0) then
			return print(slot_1_7_0("[Draw Model] Failed to precache: %s", var_29_0))
		end

		local var_29_1 = slot_1_56_5(slot_1_67_10)
		local var_29_2 = slot_1_58_6(var_29_1)

		if not slot_1_60_6(var_29_2, var_29_0, false) then
			print(slot_1_7_0("[Draw Model] Failed to initialize: %s", var_29_0))

			return slot_1_88_0(var_29_2)
		end

		local var_29_3 = arg_29_0.position

		if var_29_3 ~= nil then
			local var_29_4 = slot_1_38_0(var_29_3.x, var_29_3.y, var_29_3.z)

			slot_1_62_10(var_29_2, var_29_4)
		end

		local var_29_5 = arg_29_0.abs_angles

		if var_29_5 ~= nil then
			local var_29_6 = slot_1_38_0(var_29_5.x, var_29_5.y, var_29_5.z)

			slot_1_64_11(var_29_2, var_29_6)
		end

		slot_1_89_0[#slot_1_89_0 + 1] = var_29_2

		local var_29_7 = arg_29_0.color

		if var_29_7 ~= nil then
			slot_1_0_0("char*", slot_1_0_0("uintptr_t", var_29_2) + 112)[0] = var_29_7[1]
			slot_1_0_0("char*", slot_1_0_0("uintptr_t", var_29_2) + 112 + 1)[0] = var_29_7[2]
			slot_1_0_0("char*", slot_1_0_0("uintptr_t", var_29_2) + 112 + 2)[0] = var_29_7[3]
		end

		local var_29_8 = arg_29_0.model_scale

		if var_29_8 ~= nil then
			slot_1_0_0("float*", slot_1_0_0("uintptr_t", var_29_2) + 10060)[0] = var_29_8
		end

		if _DEBUG then
			print(slot_1_7_0("[Draw Model] created entity: 0x%X", slot_1_12_0(slot_1_0_0("uintptr_t", var_29_2))))
		end
	end

	slot_1_90_1 = 1.75
	slot_1_90_0 = slot_1_90_1 * 0.01
	slot_1_91_0 = 0
	slot_1_92_0 = 2580

	events.render(function()
		slot_1_91_0 = slot_1_91_0 + globals.frametime * slot_1_90_0

		for iter_30_0 = 1, #slot_1_89_0 do
			local var_30_0 = slot_1_89_0[iter_30_0]
			local var_30_1 = slot_1_0_0("uintptr_t", var_30_0)

			slot_1_0_0("float*", var_30_1 + slot_1_92_0)[0] = slot_1_91_0
		end
	end)

	function slot_1_50_0(arg_31_0)
		local var_31_0 = arg_31_0.model

		if slot_1_84_0(var_31_0) == -1 and not slot_1_87_0(var_31_0) then
			return print(slot_1_7_0("Failed to precache: %s", var_31_0))
		end

		local var_31_1 = slot_1_56_5(slot_1_76_0)
		local var_31_2 = slot_1_69_7(var_31_1)

		for iter_31_0, iter_31_1 in slot_1_13_0(arg_31_0) do
			if iter_31_0 ~= "position" then
				slot_1_71_8(var_31_2, iter_31_0, slot_1_11_0(iter_31_1))
			end
		end

		local var_31_3 = arg_31_0.position

		slot_1_71_8(var_31_2, "origin", slot_1_7_0("%s %s %s", var_31_3.x, var_31_3.y, var_31_3.z))

		if slot_1_73_4(var_31_2) then
			if _DEBUG then
				print(slot_1_7_0("[Sprite] created entity: 0x%X", slot_1_12_0(slot_1_0_0("uintptr_t", var_31_2))))
			end

			return
		end

		print(slot_1_7_0("[Sprite] Failed to initialize: %s", var_31_0))
		slot_1_88_0(var_31_2)
	end

	slot_1_93_0 = {}

	function slot_1_51_0(arg_32_0)
		local var_32_0 = arg_32_0.model_name

		if slot_1_84_0(var_32_0) == -1 and not slot_1_87_0(var_32_0) then
			return print(slot_1_7_0("[Beam] Failed to precache: %s", var_32_0))
		end

		local var_32_1 = slot_1_1_0(slot_1_54_2)

		for iter_32_0, iter_32_1 in slot_1_13_0(arg_32_0) do
			if iter_32_0 == "start_position" or iter_32_0 == "end_position" then
				iter_32_1 = slot_1_38_0(iter_32_1.x, iter_32_1.y, iter_32_1.z)
			end

			var_32_1[iter_32_0] = iter_32_1
		end

		var_32_1.renderable = true

		local var_32_2 = slot_1_81_0(slot_1_77_0, var_32_1)

		if var_32_2 == slot_1_53_2 then
			return print(slot_1_7_0("[Beam] Failed to create: %s", var_32_0))
		end

		slot_1_79_1(slot_1_77_0, var_32_2)

		slot_1_93_0[#slot_1_93_0 + 1] = var_32_2

		if _DEBUG then
			print(slot_1_7_0("[Beam] created: 0x%X", slot_1_12_0(slot_1_0_0("uintptr_t", var_32_2))))
		end
	end

	events.level_init(function()
		slot_1_89_0 = {}
		slot_1_93_0 = {}
	end)
	slot_1_46_0(function()
		slot_1_89_0 = {}
		slot_1_93_0 = {}
	end)

	function slot_1_94_0()
		for iter_35_0 = #slot_1_89_0, 1, -1 do
			local var_35_0 = slot_1_89_0[iter_35_0]

			slot_1_88_0(var_35_0)
		end

		slot_1_89_0 = {}

		slot_1_75_3()

		for iter_35_1 = 1, #slot_1_93_0 do
			local var_35_1 = slot_1_93_0[iter_35_1]

			slot_1_0_0("float*", slot_1_0_0("uintptr_t", var_35_1) + 52)[0] = 0
			slot_1_0_0("float*", slot_1_0_0("uintptr_t", var_35_1) + 200)[0] = 0
		end

		slot_1_93_0 = {}
	end

	slot_1_52_0 = slot_1_94_0

	events.shutdown(slot_1_94_0)

	slot_1_53_1 = nil

	function slot_1_53_0(arg_36_0)
		local var_36_0, var_36_1 = slot_1_15_0(arg_36_0)

		if var_36_0 == "table" then
			var_36_1 = {}

			for iter_36_0, iter_36_1 in slot_1_16_0, arg_36_0 do
				var_36_1[slot_1_53_0(iter_36_0)] = slot_1_53_0(iter_36_1)
			end

			slot_1_17_0(var_36_1, slot_1_53_0(slot_1_18_0(arg_36_0)))
		else
			var_36_1 = arg_36_0
		end

		return var_36_1
	end

	slot_1_54_1 = nil
	slot_1_54_0 = {}
	slot_1_55_2 = utils.opcode_scan("engine.dll", "A1 ?? ?? ?? ?? B9 ?? ?? ?? ?? 56 8B 40 30")
	slot_1_55_1 = slot_1_0_0("uintptr_t", slot_1_55_2) + 1

	function parse_static_props()
		slot_1_54_0 = {}

		if not globals.is_in_game then
			return
		end

		local var_37_0 = slot_1_0_0("uintptr_t*", slot_1_55_1)[0]
		local var_37_1 = slot_1_0_0("uintptr_t*", var_37_0 + 32)[0]
		local var_37_2 = slot_1_0_0("int*", var_37_0 + 36)[0]
		local var_37_3 = 256

		for iter_37_0 = 0, var_37_2 - 1 do
			local var_37_4 = slot_1_0_0("uintptr_t", var_37_1 + var_37_3 * iter_37_0)
			local var_37_5 = slot_1_0_0("float*", var_37_4 + 16)[0]
			local var_37_6 = slot_1_0_0("float*", var_37_4 + 16 + 4)[0]
			local var_37_7 = slot_1_0_0("float*", var_37_4 + 16 + 8)[0]
			local var_37_8 = slot_1_0_0("float*", var_37_4 + 28)[0]
			local var_37_9 = slot_1_0_0("float*", var_37_4 + 28 + 4)[0]
			local var_37_10 = slot_1_0_0("float*", var_37_4 + 28 + 8)[0]
			local var_37_11 = slot_1_0_0("uintptr_t*", var_37_4 + 44)[0]
			local var_37_12 = slot_1_0_0("const char*", var_37_11 + 4)
			local var_37_13 = slot_1_2_0(var_37_12)

			slot_1_54_0[#slot_1_54_0 + 1] = {
				position = vector(var_37_5, var_37_6, var_37_7),
				angles = vector(var_37_8, var_37_9, var_37_10),
				model = slot_1_0_0("void*", var_37_11),
				model_name = var_37_13
			}
		end
	end

	parse_static_props()
	events.level_init(parse_static_props)
	slot_1_46_0(function()
		slot_1_54_0 = {}
	end)

	slot_1_55_0 = nil

	function slot_1_56_4()
		slot_1_55_0 = nil

		local var_39_0 = common.get_map_data()

		if var_39_0 == nil then
			return
		end

		slot_1_55_0 = var_39_0.shortname
	end

	events.level_init(slot_1_56_4)
	slot_1_46_0(slot_1_56_4)
	slot_1_56_4()

	slot_1_56_3 = db["World Editor"] or {}
	slot_1_57_6 = 1
	slot_1_58_5 = {
		de_mirage = "3gAVAYuzZW5kX3Bvc2l0aW9uX29mZnNldACrc3RhcnRfd2lkdGgUqWVuZF93aWR0aBSlc2NhbGXLP9MzMzMzMzSocG9zaXRpb27ZKW1vZGVscy9wcm9wcy9jc19pdGFseS9pdF9sYW50ZXJuMV9vZmYubWRsqm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDMudm10r2hkcl9jb2xvcl9zY2FsZQGrcmVuZGVyX21vZGUJpG5hbWWsbGFudGVybiBnbG93pWNvbG9ylMywzNXM/8z/pHR5cGWmU3ByaXRlAouzZW5kX3Bvc2l0aW9uX29mZnNldACrc3RhcnRfd2lkdGgUqWVuZF93aWR0aBSlc2NhbGXLP/MzMzMzMzSocG9zaXRpb27ZKW1vZGVscy9wcm9wcy9jc19pdGFseS9pdF9sYW50ZXJuMV9vZmYubWRsqm1vZGVsX25hbWW/bW9kZWxzL3JlbWFwZXIvbGFudGVybl9idWdzLm1kbK9oZHJfY29sb3Jfc2NhbGUBq3JlbmRlcl9tb2RlCaRuYW1lrWxhbnRlcm4gbW9kZWylY29sb3KUzLDM1cz/zP+kdHlwZaVNb2RlbAOLs2VuZF9wb3NpdGlvbl9vZmZzZXQAq3N0YXJ0X3dpZHRoFKllbmRfd2lkdGgUpXNjYWxlyz/MKPXCj1wpqHBvc2l0aW9u2Sltb2RlbHMvcHJvcHMvY3NfaXRhbHkvaXRfbGFudGVybjFfb2ZmLm1kbKptb2RlbF9uYW1luXJlbWFwZXIvbGlnaHRfZ2xvd2lybC52bXSvaGRyX2NvbG9yX3NjYWxlyz/TMzMzMzM0q3JlbmRlcl9tb2RlA6RuYW1lrmxhbnRlcm4gZ2xvdyAypWNvbG9ylMywzNXM/8z/pHR5cGWmU3ByaXRlBIyzZW5kX3Bvc2l0aW9uX29mZnNldACrc3RhcnRfd2lkdGgUqWVuZF93aWR0aBSlc2NhbGXKPoAAAKhwb3NpdGlvbtkkbW9kZWxzL3Byb3BzL2RlX21pcmFnZS9sYW1wX3ZlcjIubWRspHR5cGWmU3ByaXRlqm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10r2hkcl9jb2xvcl9zY2FsZQGrcmVuZGVyX21vZGUJpG5hbWWwcGFsYWNlIGxhbXAgZ2xvd6Vjb2xvcpTM6cy2zIPM/7Fwb3NpdGlvbl96X29mZnNldPsFjLNlbmRfcG9zaXRpb25fb2Zmc2V0AKtzdGFydF93aWR0aBSpZW5kX3dpZHRoFKVzY2FsZco+gAAAqHBvc2l0aW9u2SRtb2RlbHMvcHJvcHMvZGVfbWlyYWdlL2xhbXBfdmVyMi5tZGykdHlwZaZTcHJpdGWqbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSvaGRyX2NvbG9yX3NjYWxlAatyZW5kZXJfbW9kZQmkbmFtZbJwYWxhY2UgbGFtcCBnbG93IDKlY29sb3KUzOnMtsyDzP+xcG9zaXRpb25fel9vZmZzZXQcBo2zZW5kX3Bvc2l0aW9uX29mZnNldACrc3RhcnRfd2lkdGgUqWVuZF93aWR0aBSkdHlwZahQYXJ0aWNsZaVzY2FsZco+gAAArWFuZ2xlc19vZmZzZXQeqHBvc2l0aW9u2SRtb2RlbHMvcHJvcHMvZGVfbWlyYWdlL2xhbXBfdmVyMS5tZGyqbW9kZWxfbmFtZbZtb2xvdG92X2NoaWxkX2ZsYW1lMDNir2hkcl9jb2xvcl9zY2FsZQGrcmVuZGVyX21vZGUJpG5hbWWtZmlyZSBwYXJ0aWNsZaVjb2xvcpTM6cy2zIPM/7Fwb3NpdGlvbl96X29mZnNldAcHjbNlbmRfcG9zaXRpb25fb2Zmc2V0AKtzdGFydF93aWR0aBSpZW5kX3dpZHRoFKR0eXBlqFBhcnRpY2xlpXNjYWxlyj6AAACtYW5nbGVzX29mZnNldB6ocG9zaXRpb27ZJG1vZGVscy9wcm9wcy9kZV9taXJhZ2UvbGFtcF92ZXIxLm1kbKptb2RlbF9uYW1lrHNtb2tlX2dpYl8wMa9oZHJfY29sb3Jfc2NhbGUBq3JlbmRlcl9tb2RlCaRuYW1ls2ZpcmUgc21va2UgcGFydGljbGWlY29sb3KUzOnMtsyDzP+xcG9zaXRpb25fel9vZmZzZXQHCI2zZW5kX3Bvc2l0aW9uX29mZnNldACrc3RhcnRfd2lkdGgUqWVuZF93aWR0aBSkdHlwZaZTcHJpdGWlc2NhbGXKPwAAAK1hbmdsZXNfb2Zmc2V0Hqhwb3NpdGlvbtkkbW9kZWxzL3Byb3BzL2RlX21pcmFnZS9sYW1wX3ZlcjEubWRsqm1vZGVsX25hbWW5cmVtYXBlci9saWdodF9nbG93aXJsLnZtdK9oZHJfY29sb3Jfc2NhbGXLP/mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWrZmlyZSBzcHJpdGWlY29sb3KUzP95AMz/sXBvc2l0aW9uX3pfb2Zmc2V0BwmMqnNldF9hbmdsZXPDs2VuZF9wb3NpdGlvbl9vZmZzZXQAq3N0YXJ0X3dpZHRoFKllbmRfd2lkdGgUpXNjYWxlyz/zMzMzMzMzqHBvc2l0aW9u2SRtb2RlbHMvcHJvcHMvZGVfbWlyYWdlL2xhbXBfdmVyMi5tZGyqbW9kZWxfbmFtZdkibW9kZWxzL3JlbWFwZXIvcGFsYWNlbGlnaHRidWdzLm1kbK9oZHJfY29sb3Jfc2NhbGUBq3JlbmRlcl9tb2RlCaRuYW1lsXBhbGFjZSBsYW1wIG1vZGVspWNvbG9ylMz/zP/M/8z/pHR5cGWlTW9kZWwKjLNlbmRfcG9zaXRpb25fb2Zmc2V0AKtzdGFydF93aWR0aBSpZW5kX3dpZHRoFKVzY2FsZco/wAAAqHBvc2l0aW9u2SRtb2RlbHMvcHJvcHMvZGVfbWlyYWdlL2xhbXBfdmVyNS5tZGykdHlwZaVNb2RlbKptb2RlbF9uYW1lv21vZGVscy9yZW1hcGVyL2xhbnRlcm5fYnVncy5tZGyvaGRyX2NvbG9yX3NjYWxlAatyZW5kZXJfbW9kZQmkbmFtZbljZWlsaW5nIHBhbGFjZSBsYW1wIG1vZGVspWNvbG9ylMz/zP/M/8z/sXBvc2l0aW9uX3pfb2Zmc2V05wuMs2VuZF9wb3NpdGlvbl9vZmZzZXQAq3N0YXJ0X3dpZHRoFKllbmRfd2lkdGgUpXNjYWxlyz/ZmZmZmZmaqHBvc2l0aW9u2SRtb2RlbHMvcHJvcHMvZGVfbWlyYWdlL2xhbXBfdmVyNS5tZGykdHlwZaZTcHJpdGWqbW9kZWxfbmFtZblyZW1hcGVyL2xpZ2h0X2dsb3dpcmwudm10r2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZbpjZWlsaW5nIHBhbGFjZSBsYW1wIHNwcml0ZaVjb2xvcpTM/8y6dcz/sXBvc2l0aW9uX3pfb2Zmc2V05wyNqnNldF9hbmdsZXPDs2VuZF9wb3NpdGlvbl9vZmZzZXQAq3N0YXJ0X3dpZHRoFKllbmRfd2lkdGgUpXNjYWxlyj/AAACocG9zaXRpb27ZL21vZGVscy9wcm9wc191cmJhbi90ZWxlcGhvbmVfc3RyZWV0bGlnaHQwMDEubWRspHR5cGWlTW9kZWyqbW9kZWxfbmFtZdkgbW9kZWxzL3JlbWFwZXIvcG9sZWxpZ2h0YnVncy5tZGyvaGRyX2NvbG9yX3NjYWxlAatyZW5kZXJfbW9kZQmkbmFtZbFzdHJlZXRsaWdodCBtb2RlbKVjb2xvcpTM/8y4TMz/sXBvc2l0aW9uX3pfb2Zmc2V00N0NjbNlbmRfcG9zaXRpb25fb2Zmc2V00f9qq3N0YXJ0X3dpZHRoNqllbmRfd2lkdGg3pHR5cGWkQmVhbaVzY2FsZco+gAAArWFuZ2xlc19vZmZzZXTQ06hwb3NpdGlvbtkvbW9kZWxzL3Byb3BzX3VyYmFuL3RlbGVwaG9uZV9zdHJlZXRsaWdodDAwMS5tZGyqbW9kZWxfbmFtZbdzcHJpdGVzL2dsb3dfdGVzdDAyLnZtdK9oZHJfY29sb3Jfc2NhbGUBq3JlbmRlcl9tb2RlCaRuYW1lsHBhbGFjZSBsYW1wIGJlYW2lY29sb3KUzOnMtsyDzMixcG9zaXRpb25fel9vZmZzZXQZDo2zZW5kX3Bvc2l0aW9uX29mZnNldNH/VqtzdGFydF93aWR0aDapZW5kX3dpZHRoN6R0eXBlplNwcml0ZaVzY2FsZQGtYW5nbGVzX29mZnNldNDTqHBvc2l0aW9u2S9tb2RlbHMvcHJvcHNfdXJiYW4vdGVsZXBob25lX3N0cmVldGxpZ2h0MDAxLm1kbKptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAzLnZtdK9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWW0cGFsYWNlIGxhbXAgc3ByaXRlIDGlY29sb3KUzOnMtsyDzP+xcG9zaXRpb25fel9vZmZzZXQZD42zZW5kX3Bvc2l0aW9uX29mZnNldNH/VqtzdGFydF93aWR0aDapZW5kX3dpZHRoN6R0eXBlplNwcml0ZaVzY2FsZcs/6ZmZmZmZmq1hbmdsZXNfb2Zmc2V00NOocG9zaXRpb27ZL21vZGVscy9wcm9wc191cmJhbi90ZWxlcGhvbmVfc3RyZWV0bGlnaHQwMDEubWRsqm1vZGVsX25hbWW5cmVtYXBlci9saWdodF9nbG93aXJsLnZtdK9oZHJfY29sb3Jfc2NhbGXKPwAAAKtyZW5kZXJfbW9kZQmkbmFtZbRwYWxhY2UgbGFtcCBzcHJpdGUgMqVjb2xvcpTM6cy2zIPM/7Fwb3NpdGlvbl96X29mZnNldBkQjqpzZXRfYW5nbGVzw7NlbmRfcG9zaXRpb25fb2Zmc2V0AKtzdGFydF93aWR0aBSpZW5kX3dpZHRoFKhwb3NpdGlvbtklbW9kZWxzL3Byb3BzX3VyYmFuL3BvcmNoX2xpZ2h0MDAzLm1kbKVzY2FsZco/wAAAq3JlbmRlcl9tb2RlCaR0eXBlpU1vZGVsqm1vZGVsX25hbWW/bW9kZWxzL3JlbWFwZXIvbGFudGVybl9idWdzLm1kbK9oZHJfY29sb3Jfc2NhbGUBrWFuZ2xlc19vZmZzZXTspG5hbWWxcG9yY2ggbGlnaHQgbW9kZWylY29sb3KUzP/M/8z/zP+xcG9zaXRpb25fel9vZmZzZXTiEY6qc2V0X2FuZ2xlc8OzZW5kX3Bvc2l0aW9uX29mZnNldNH/VqtzdGFydF93aWR0aDWpZW5kX3dpZHRoNqhwb3NpdGlvbtklbW9kZWxzL3Byb3BzX3VyYmFuL3BvcmNoX2xpZ2h0MDAzLm1kbKVzY2FsZco/wAAAq3JlbmRlcl9tb2RlCaR0eXBlpEJlYW2qbW9kZWxfbmFtZbdzcHJpdGVzL2dsb3dfdGVzdDAyLnZtdK9oZHJfY29sb3Jfc2NhbGUBrWFuZ2xlc19vZmZzZXTspG5hbWWwcG9yY2ggbGlnaHQgYmVhbaVjb2xvcpTM/8zmzN5QsXBvc2l0aW9uX3pfb2Zmc2V0BRKOqnNldF9hbmdsZXPDs2VuZF9wb3NpdGlvbl9vZmZzZXTR/1arc3RhcnRfd2lkdGg1qWVuZF93aWR0aDaocG9zaXRpb27ZJW1vZGVscy9wcm9wc191cmJhbi9wb3JjaF9saWdodDAwMy5tZGylc2NhbGXLP/MzMzMzMzOrcmVuZGVyX21vZGUJpHR5cGWmU3ByaXRlqm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDMudm10r2hkcl9jb2xvcl9zY2FsZQGtYW5nbGVzX29mZnNldOykbmFtZbJwb3JjaCBsaWdodCBzcHJpdGWlY29sb3KUzP/M5szezMixcG9zaXRpb25fel9vZmZzZXQFE4yzZW5kX3Bvc2l0aW9uX29mZnNldACrc3RhcnRfd2lkdGgUqWVuZF93aWR0aBSlc2NhbGXKP8AAAKhwb3NpdGlvbtkpbW9kZWxzL3Byb3BzL2RlX2luZmVybm8vY2VpbGluZ19saWdodC5tZGykdHlwZaVNb2RlbKptb2RlbF9uYW1lv21vZGVscy9yZW1hcGVyL2xhbnRlcm5fYnVncy5tZGyvaGRyX2NvbG9yX3NjYWxlAatyZW5kZXJfbW9kZQmkbmFtZbNjZWlsaW5nIGxpZ2h0IG1vZGVspWNvbG9ylMz/zP/M/8z/sXBvc2l0aW9uX3pfb2Zmc2V0+hSMs2VuZF9wb3NpdGlvbl9vZmZzZXQAq3N0YXJ0X3dpZHRoFKllbmRfd2lkdGgUpXNjYWxlyz/TMzMzMzMzqHBvc2l0aW9u2Sltb2RlbHMvcHJvcHMvZGVfaW5mZXJuby9jZWlsaW5nX2xpZ2h0Lm1kbKR0eXBlplNwcml0Zaptb2RlbF9uYW1luXJlbWFwZXIvbGlnaHRfZ2xvd2lybC52bXSvaGRyX2NvbG9yX3NjYWxlyz/jMzMzMzM0q3JlbmRlcl9tb2RlCaRuYW1ltGNlaWxpbmcgbGlnaHQgc3ByaXRlpWNvbG9ylMybzMzM/8z/sXBvc2l0aW9uX3pfb2Zmc2V0+qRkYXRhkA==",
		de_vertigo = "3AAbjKVzY2FsZQGvaGRyX2NvbG9yX3NjYWxlAatyZW5kZXJfbW9kZQCkbmFtZbVnYXJiYWdlIGZpcmUgcGFydGljbGWocG9zaXRpb27ZSm1vZGVscy9wcm9wcy9kZV9kdXN0L2hyX2R1c3QvZHVzdF9nYXJiYWdlX2NvbnRhaW5lci9kdXN0X3RyYXNoX3BpbGVfMDIubWRsqm1vZGVsX25hbWWuZW52X2ZpcmVfbGFyZ2WlY29sb3KUzP/M/8z/zP+zZW5kX3Bvc2l0aW9uX29mZnNldACrc3RhcnRfd2lkdGgUqWVuZF93aWR0aBSkdHlwZahQYXJ0aWNsZbFwb3NpdGlvbl96X29mZnNldC2MpXNjYWxly0ABCj1wo9cKr2hkcl9jb2xvcl9zY2FsZQGrcmVuZGVyX21vZGUDpG5hbWWzZ2FyYmFnZSBmaXJlIHNwcml0Zahwb3NpdGlvbtlWbW9kZWxzL3Byb3BzL2RlX2R1c3QvaHJfZHVzdC9kdXN0X2dhcmJhZ2VfY29udGFpbmVyL2R1c3RfZ2FyYmFnZV9jb250YWluZXJfb3Blbl8wMi5tZGyqbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSlY29sb3KUzP/MjEfM/7NlbmRfcG9zaXRpb25fb2Zmc2V0AKtzdGFydF93aWR0aBSpZW5kX3dpZHRoFKR0eXBlplNwcml0ZbFwb3NpdGlvbl96X29mZnNldCyLpXNjYWxlAa9oZHJfY29sb3Jfc2NhbGUBq3JlbmRlcl9tb2RlAKRuYW1lsFsxXSBjYW5kbGUgbW9kZWyqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGylY29sb3KUzP/M/8z/zP+zZW5kX3Bvc2l0aW9uX29mZnNldACrc3RhcnRfd2lkdGgUqWVuZF93aWR0aBSkdHlwZaVNb2RlbKhwb3NpdGlvbpPR+qgFzS4Ai6VzY2FsZQGvaGRyX2NvbG9yX3NjYWxlAatyZW5kZXJfbW9kZQCkbmFtZa9bMV0gY2FuZGxlIGZpcmWqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpWNvbG9ylMz/zP/M/8z/s2VuZF9wb3NpdGlvbl9vZmZzZXQAq3N0YXJ0X3dpZHRoFKllbmRfd2lkdGgUpHR5cGWoUGFydGljbGWocG9zaXRpb26T0fqoBc0uCoulc2NhbGXLP9mZmZmZmZqvaGRyX2NvbG9yX3NjYWxlAatyZW5kZXJfbW9kZQmkbmFtZbFbMV0gY2FuZGxlIHNwcml0Zaptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAzLnZtdKVjb2xvcpTM/8ybZ8z/s2VuZF9wb3NpdGlvbl9vZmZzZXQAq3N0YXJ0X3dpZHRoFKllbmRfd2lkdGgUpHR5cGWmU3ByaXRlqHBvc2l0aW9uk9H6qQXNLgaLpXNjYWxlyz/ZmZmZmZmar2hkcl9jb2xvcl9zY2FsZQGrcmVuZGVyX21vZGUJpG5hbWWrc2FmZXR5IGxhbXCqbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMy52bXSlY29sb3KUzP/Mm2fM/7NlbmRfcG9zaXRpb25fb2Zmc2V0AKtzdGFydF93aWR0aBSpZW5kX3dpZHRoFKR0eXBlplNwcml0Zahwb3NpdGlvbtk0bW9kZWxzL3Byb3BzL2RlX3ZlcnRpZ28vY29uc3RydWN0aW9uX3NhZmV0eV9sYW1wLm1kbIulc2NhbGUBr2hkcl9jb2xvcl9zY2FsZQGrcmVuZGVyX21vZGUApG5hbWW1WzFdIHBvcmNoIGxpZ2h0IG1vZGVsqm1vZGVsX25hbWXZJW1vZGVscy9wcm9wc191cmJhbi9wb3JjaF9saWdodDAwMS5tZGylY29sb3KUzP/M/8z/zP+zZW5kX3Bvc2l0aW9uX29mZnNldACrc3RhcnRfd2lkdGgUqWVuZF93aWR0aBSkdHlwZaVNb2RlbKhwb3NpdGlvbpPR+YAMzS65i6VzY2FsZcs/164UeuFHrq9oZHJfY29sb3Jfc2NhbGUBq3JlbmRlcl9tb2RlCaRuYW1ltlsxXSBwb3JjaCBsaWdodCBzcHJpdGWqbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMy52bXSlY29sb3KUzP/MrMyCzP+zZW5kX3Bvc2l0aW9uX29mZnNldACrc3RhcnRfd2lkdGgUqWVuZF93aWR0aBSkdHlwZaZTcHJpdGWocG9zaXRpb26T0fl7DM0uvd4AEKVzY2FsZQGzc2V0X2FuZ2xlc196X29mZnNldMy0r2hkcl9jb2xvcl9zY2FsZQGrcmVuZGVyX21vZGUArWFuZ2xlc19vZmZzZXQBpHR5cGWlTW9kZWykbmFtZa1wbGF0Zm9ybSBsYW1wqHBvc2l0aW9u2VBtb2RlbHMvcHJvcHMvaHJfdmVydGlnby92ZXJ0aWdvX3BsYXRmb3JtX3JhaWxpbmcvdmVydGlnb19wbGF0Zm9ybV9yYWlsaW5nXzAyLm1kbLFjdXN0b21feWF3X29mZnNldACqbW9kZWxfbmFtZdk0bW9kZWxzL3Byb3BzL2RlX3ZlcnRpZ28vY29uc3RydWN0aW9uX3NhZmV0eV9sYW1wLm1kbKVjb2xvcpTM/8z/zP/M/7NlbmRfcG9zaXRpb25fb2Zmc2V0AKtzdGFydF93aWR0aBSpZW5kX3dpZHRoFKpzZXRfYW5nbGVzw7Fwb3NpdGlvbl96X29mZnNldB6LpXNjYWxlAa9oZHJfY29sb3Jfc2NhbGUBq3JlbmRlcl9tb2RlAKRuYW1lsFsyXSBjYW5kbGUgbW9kZWyqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGylY29sb3KUzP/M/8z/zP+zZW5kX3Bvc2l0aW9uX29mZnNldACrc3RhcnRfd2lkdGgUqWVuZF93aWR0aBSkdHlwZaVNb2RlbKhwb3NpdGlvbpPR+ErR/w7NLgCLpXNjYWxlAa9oZHJfY29sb3Jfc2NhbGUBq3JlbmRlcl9tb2RlAKRuYW1lr1syXSBjYW5kbGUgZmlyZaptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWlY29sb3KUzP/M/8z/zP+zZW5kX3Bvc2l0aW9uX29mZnNldACrc3RhcnRfd2lkdGgUqWVuZF93aWR0aBSkdHlwZahQYXJ0aWNsZahwb3NpdGlvbpPR+ErR/w7NLguLpXNjYWxlyz/ZmZmZmZmar2hkcl9jb2xvcl9zY2FsZQGrcmVuZGVyX21vZGUJpG5hbWWxWzJdIGNhbmRsZSBzcHJpdGWqbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMy52bXSlY29sb3KUzP/Mm2fM/7NlbmRfcG9zaXRpb25fb2Zmc2V0AKtzdGFydF93aWR0aBSpZW5kX3dpZHRoFKR0eXBlplNwcml0Zahwb3NpdGlvbpPR+ErR/w7NLgeOpXNjYWxlyz/ZmZmZmZmar2hkcl9jb2xvcl9zY2FsZQGrcmVuZGVyX21vZGUJqm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDMudm10pG5hbWW0cGxhdGZvcm0gbGFtcCBzcHJpdGWtYW5nbGVzX29mZnNldAGxY3VzdG9tX3lhd19vZmZzZXQApHR5cGWmU3ByaXRlpWNvbG9ylMz/zJtnzP+zZW5kX3Bvc2l0aW9uX29mZnNldACrc3RhcnRfd2lkdGgUqWVuZF93aWR0aBSocG9zaXRpb27ZUG1vZGVscy9wcm9wcy9ocl92ZXJ0aWdvL3ZlcnRpZ29fcGxhdGZvcm1fcmFpbGluZy92ZXJ0aWdvX3BsYXRmb3JtX3JhaWxpbmdfMDIubWRssXBvc2l0aW9uX3pfb2Zmc2V0Houlc2NhbGXLP9MzMzMzMzOvaGRyX2NvbG9yX3NjYWxlAatyZW5kZXJfbW9kZQmkbmFtZa1saWdodCBjZWlsaW5nqm1vZGVsX25hbWW5cmVtYXBlci9saWdodF9nbG93aXJsLnZtdKVjb2xvcpTM/8z/zP/M/7NlbmRfcG9zaXRpb25fb2Zmc2V0AKtzdGFydF93aWR0aBSpZW5kX3dpZHRoFKR0eXBlplNwcml0Zahwb3NpdGlvbtkobW9kZWxzL3Byb3BzL2NzX29mZmljZS9MaWdodF9jZWlsaW5nLm1kbIulc2NhbGUBr2hkcl9jb2xvcl9zY2FsZQGrcmVuZGVyX21vZGUApG5hbWWwWzNdIGNhbmRsZSBtb2RlbKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKVjb2xvcpTM/8z/zP/M/6hwb3NpdGlvbpPR9/3lzS5cq3N0YXJ0X3dpZHRoFKllbmRfd2lkdGgUs2VuZF9wb3NpdGlvbl9vZmZzZXQApHR5cGWlTW9kZWyLpXNjYWxlAa9oZHJfY29sb3Jfc2NhbGUBq3JlbmRlcl9tb2RlAKRuYW1lr1szXSBjYW5kbGUgZmlyZaR0eXBlqFBhcnRpY2xlpWNvbG9ylMz/zP/M/8z/qHBvc2l0aW9uk9H3/eXNLmerc3RhcnRfd2lkdGgUqWVuZF93aWR0aBSzZW5kX3Bvc2l0aW9uX29mZnNldACqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1li6VzY2FsZcs/2ZmZmZmZmq9oZHJfY29sb3Jfc2NhbGUBq3JlbmRlcl9tb2RlCaRuYW1lsVszXSBjYW5kbGUgc3ByaXRlpHR5cGWmU3ByaXRlpWNvbG9ylMz/zJtnzP+ocG9zaXRpb26T0ff95c0uYatzdGFydF93aWR0aBSpZW5kX3dpZHRoFKptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAzLnZtdLNlbmRfcG9zaXRpb25fb2Zmc2V0AI+lc2NhbGUBs3NldF9hbmdsZXNfel9vZmZzZXQAr2hkcl9jb2xvcl9zY2FsZQGrcmVuZGVyX21vZGUAs3NldF9hbmdsZXNfeV9vZmZzZXRapG5hbWW1WzJdIHBvcmNoIGxpZ2h0IG1vZGVspHR5cGWlTW9kZWyocG9zaXRpb26T0fjSzQHJzS69qm1vZGVsX25hbWXZJW1vZGVscy9wcm9wc191cmJhbi9wb3JjaF9saWdodDAwMS5tZGylY29sb3KUzP/M/8z/zP+zZW5kX3Bvc2l0aW9uX29mZnNldACrc3RhcnRfd2lkdGgUqWVuZF93aWR0aBSqc2V0X2FuZ2xlc8Ozc2V0X2FuZ2xlc194X29mZnNldACLpXNjYWxlyz/ZmZmZmZmar2hkcl9jb2xvcl9zY2FsZQGrcmVuZGVyX21vZGUJpG5hbWW2WzJdIHBvcmNoIGxpZ2h0IHNwcml0Zaptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAzLnZtdKVjb2xvcpTM/8ybZ8z/s2VuZF9wb3NpdGlvbl9vZmZzZXQAq3N0YXJ0X3dpZHRoFKllbmRfd2lkdGgUqHBvc2l0aW9uk9H40s0BxM0uwqR0eXBlplNwcml0ZYulc2NhbGXLP9zMzMzMzM2vaGRyX2NvbG9yX3NjYWxlAatyZW5kZXJfbW9kZQmkbmFtZbhbMl0gcG9yY2ggbGlnaHQgc3ByaXRlIDKkdHlwZaZTcHJpdGWlY29sb3KUzP/Mm2fM/6hwb3NpdGlvbpPR+NLNAcTNLsKrc3RhcnRfd2lkdGgUqWVuZF93aWR0aBSzZW5kX3Bvc2l0aW9uX29mZnNldACqbW9kZWxfbmFtZblyZW1hcGVyL2xpZ2h0X2dsb3dpcmwudm10i6VzY2FsZcs/3MzMzMzMza9oZHJfY29sb3Jfc2NhbGUBq3JlbmRlcl9tb2RlCaRuYW1luFsxXSBwb3JjaCBsaWdodCBzcHJpdGUgMqptb2RlbF9uYW1luXJlbWFwZXIvbGlnaHRfZ2xvd2lybC52bXSlY29sb3KUzP/Mm2fM/6hwb3NpdGlvbpPR+XsMzS69q3N0YXJ0X3dpZHRoFKllbmRfd2lkdGgUs2VuZF9wb3NpdGlvbl9vZmZzZXQApHR5cGWmU3ByaXRli6VzY2FsZQGvaGRyX2NvbG9yX3NjYWxlAatyZW5kZXJfbW9kZQCkbmFtZbRjZWxpbmcgbGFudGVybiBtb2RlbKptb2RlbF9uYW1l2UNtb2RlbHMvcHJvcHMvZGVfZHVzdC9ocl9kdXN0L2R1c3RfbGlnaHRzL2R1c3Rfb3JuYXRlX2xhbnRlcm5fMDMubWRspWNvbG9ylMz/bm7M/6hwb3NpdGlvbpPR+bzNAQPNLwOrc3RhcnRfd2lkdGgUqWVuZF93aWR0aBSkdHlwZaVNb2RlbLNlbmRfcG9zaXRpb25fb2Zmc2V0AIulc2NhbGXKPwAAAK9oZHJfY29sb3Jfc2NhbGUBq3JlbmRlcl9tb2RlCaRuYW1ltWNlbGluZyBsYW50ZXJuIHNwcml0ZaR0eXBlplNwcml0ZaVjb2xvcpTM/8ybZ8z/s2VuZF9wb3NpdGlvbl9vZmZzZXQAq3N0YXJ0X3dpZHRoFKllbmRfd2lkdGgUqHBvc2l0aW9uk9H5vM0BA80u4qptb2RlbF9uYW1luXJlbWFwZXIvbGlnaHRfZ2xvd2lybC52bXSLpXNjYWxlyz/mZmZmZmZnr2hkcl9jb2xvcl9zY2FsZQGrcmVuZGVyX21vZGUJpG5hbWW3Y2VsaW5nIGxhbnRlcm4gc3ByaXRlIDKkdHlwZaZTcHJpdGWlY29sb3KUzP/Mm2fM/6hwb3NpdGlvbpPR+bzNAQPNLuCrc3RhcnRfd2lkdGgUqWVuZF93aWR0aBSzZW5kX3Bvc2l0aW9uX29mZnNldACqbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMy52bXSPpXNjYWxlAbNzZXRfYW5nbGVzX3pfb2Zmc2V0AK9oZHJfY29sb3Jfc2NhbGUBq3JlbmRlcl9tb2RlALNzZXRfYW5nbGVzX3lfb2Zmc2V00KakbmFtZbBmbG9vZGxpZ2h0IG1vZGVspHR5cGWlTW9kZWyzZW5kX3Bvc2l0aW9uX29mZnNldACqbW9kZWxfbmFtZdkrbW9kZWxzL3Byb3BzX2VxdWlwbWVudC9saWdodF9mbG9vZGxpZ2h0Lm1kbKVjb2xvcpTM/8z/zP/M/6hwb3NpdGlvbpPR+LbNAajNLgCrc3RhcnRfd2lkdGgUqWVuZF93aWR0aBSqc2V0X2FuZ2xlc8Ozc2V0X2FuZ2xlc194X29mZnNldACLpXNjYWxlyz/DMzMzMzMzr2hkcl9jb2xvcl9zY2FsZQGrcmVuZGVyX21vZGUJpG5hbWW3Zmxvb2RsaWdodCBtb2RlbCBzcHJpdGWkdHlwZaZTcHJpdGWlY29sb3KUzP/M/8z/zP+ocG9zaXRpb26T0fjCzQGmzS5Rq3N0YXJ0X3dpZHRoFKllbmRfd2lkdGgUs2VuZF9wb3NpdGlvbl9vZmZzZXQAqm1vZGVsX25hbWW9c3ByaXRlcy9udWtlX3N1bmZsYXJlXzAwMS52bXSLpXNjYWxlyz/DMzMzMzMzr2hkcl9jb2xvcl9zY2FsZQGrcmVuZGVyX21vZGUJpG5hbWW5Zmxvb2RsaWdodCBtb2RlbCBzcHJpdGUgMqptb2RlbF9uYW1lvXNwcml0ZXMvbnVrZV9zdW5mbGFyZV8wMDEudm10pWNvbG9ylMz/zP/M/8z/qHBvc2l0aW9uk9H4q80Bps0uUKtzdGFydF93aWR0aBSpZW5kX3dpZHRoFLNlbmRfcG9zaXRpb25fb2Zmc2V0AKR0eXBlplNwcml0ZQ==",
		de_cbble = "3AK/hKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpVsxXSAxqHBvc2l0aW9uk8rEVzj2ykUYdcPR/06kdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWlWzFdIDKocG9zaXRpb26TysRXOPbKRRh1w9H/WKR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEVzj2ykUYdcPR/1OvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpVsxXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWlWzJdIDGocG9zaXRpb26TysRRzyvKRRitmtH/TqR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaVbMl0gMqhwb3NpdGlvbpPKxFHPK8pFGK2a0f9YpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysRRzyvKRRitmtH/U69oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWlWzJdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaVbM10gMahwb3NpdGlvbpPKxE/2qMpFF3Y90f9OpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpVszXSAyqHBvc2l0aW9uk8rET/aoykUXdj3R/1ikdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxE/2qMpFF3Y90f9Tr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaVbM10gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpVs0XSAxqHBvc2l0aW9uk8rET5WRykUIpmbR/06kdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWlWzRdIDKocG9zaXRpb26TysRPlZHKRQimZtH/WKR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rET5WRykUIpmbR/1OvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpVs0XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWlWzVdIDGocG9zaXRpb26TysRRWwLKRQdaPdH/TqR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaVbNV0gMqhwb3NpdGlvbpPKxFFbAspFB1o90f9YpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysRRWwLKRQdaPdH/U69oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWlWzVdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaVbNl0gMahwb3NpdGlvbpPKxFaEOcpFB4QA0f9OpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpVs2XSAyqHBvc2l0aW9uk8rEVoQ5ykUHhADR/1ikdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxFaEOcpFB4QA0f9Tr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaVbNl0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpVs3XSAxqHBvc2l0aW9uk8rEzTcKykSU6Uj/pHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpVs3XSAyqHBvc2l0aW9uk8rEzTcKykSU6UgJpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysTNNwrKRJTpSASvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpVs3XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWlWzhdIDGocG9zaXRpb26TysTKq4XKRJPkKf+kdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWlWzhdIDKocG9zaXRpb26TysTKq4XKRJPkKQmkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxMqrhcpEk+QpBK9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWlWzhdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaVbOV0gMahwb3NpdGlvbpPKxMshmspEkVTN/6R0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaVbOV0gMqhwb3NpdGlvbpPKxMshmspEkVTNCaR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEyyGaykSRVM0Er2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaVbOV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lplsxMF0gMahwb3NpdGlvbpPR+bXNA+M/pHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lplsxMF0gMqhwb3NpdGlvbpPR+bXNA+NJpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26T0fm1zQPjRK9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzEwXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzExXSAxqHBvc2l0aW9uk9H4YtH8+9DapHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lplsxMV0gMqhwb3NpdGlvbpPR+GLR/PvkpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26T0fhi0fz70N+vaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lplsxMV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lplsxMl0gMahwb3NpdGlvbpPR+DXR/ajQkqR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbMTJdIDKocG9zaXRpb26T0fg10f2o0JykdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPR+DXR/ajQl69oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzEyXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzEzXSAxqHBvc2l0aW9uk9H3h8rDn5N10f8bpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lplsxM10gMqhwb3NpdGlvbpPR94fKw5+TddH/JaR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk9H3h8rDn5N10f8gr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbMTNdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbMTRdIDGocG9zaXRpb26TysUAWM3Kw8PwANH/SaR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbMTRdIDKocG9zaXRpb26TysUAWM3Kw8PwANH/U6R0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rFAFjNysPD8ADR/06vaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lplsxNF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lplsxNV0gMahwb3NpdGlvbpPKxP7fXMrDzCGJ0f9JpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lplsxNV0gMqhwb3NpdGlvbpPKxP7fXMrDzCGJ0f9TpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysT+31zKw8whidH/Tq9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzE1XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzE2XSAxqHBvc2l0aW9uk8rFADa4ysPUeJPR/0mkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzE2XSAyqHBvc2l0aW9uk8rFADa4ysPUeJPR/1OkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxQA2uMrD1HiT0f9Or2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbMTZdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbMTddIDGocG9zaXRpb26TysT2azPKxC2SsNDCpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lplsxN10gMqhwb3NpdGlvbpPKxPZrM8rELZKw0MykdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxPZrM8rELZKw0MevaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lplsxN10gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lplsxOF0gMahwb3NpdGlvbpPKxPVGZsrEMo5m0MKkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzE4XSAyqHBvc2l0aW9uk8rE9UZmysQyjmbQzKR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rE9UZmysQyjmbQx69oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzE4XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzE5XSAxqHBvc2l0aW9uk8rE918KysQ1on/QwqR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbMTldIDKocG9zaXRpb26TysT3XwrKxDWif9DMpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysT3XwrKxDWif9DHr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbMTldIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbMjBdIDGocG9zaXRpb26TysUiU9fKRRleuA+kdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzIwXSAyqHBvc2l0aW9uk8rFIlPXykUZXrgZpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysUiU9fKRRleuBSvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lplsyMF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lplsyMV0gMahwb3NpdGlvbpPKxSOPrspFGfeuD6R0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbMjFdIDKocG9zaXRpb26TysUjj67KRRn3rhmkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxSOPrspFGfeuFK9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzIxXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzIyXSAxqHBvc2l0aW9uk8rFIz3sykUbOmYPpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lplsyMl0gMqhwb3NpdGlvbpPKxSM97MpFGzpmGaR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rFIz3sykUbOmYUr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbMjJdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbMjNdIDGocG9zaXRpb26TysVTAPbKw7BKwf+kdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzIzXSAyqHBvc2l0aW9uk8rFUwD2ysOwSsEJpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysVTAPbKw7BKwQSvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lplsyM10gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lplsyNF0gMahwb3NpdGlvbpPKxVLRH8rDpW3T/6R0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbMjRdIDKocG9zaXRpb26TysVS0R/Kw6Vt0wmkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxVLRH8rDpW3TBK9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzI0XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzI1XSAxqHBvc2l0aW9uk8rFUYT2ysOkvhT/pHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lplsyNV0gMqhwb3NpdGlvbpPKxVGE9srDpL4UCaR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rFUYT2ysOkvhQEr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbMjVdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbMjZdIDGocG9zaXRpb26TykQcMKTKw9MKHQCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzI2XSAyqHBvc2l0aW9uk8pEHDCkysPTCh0KpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TykQcMKTKw9MKHQWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lplsyNl0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lplsyN10gMahwb3NpdGlvbpPKRBdBecrDzkItAKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbMjddIDKocG9zaXRpb26TykQXQXnKw85CLQqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKRBdBecrDzkItBa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzI3XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzI4XSAxqHBvc2l0aW9uk8pEGIiDysPELEoApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lplsyOF0gMqhwb3NpdGlvbpPKRBiIg8rDxCxKCqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8pEGIiDysPELEoFr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbMjhdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbMjldIDGocG9zaXRpb26T0fX90f4T0J6kdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzI5XSAyqHBvc2l0aW9uk9H1/dH+E9CopHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26T0fX90f4T0KOvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lplsyOV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lplszMF0gMahwb3NpdGlvbpPR9hXR/mjR/3KkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzMwXSAyqHBvc2l0aW9uk9H2FdH+aNH/fKR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk9H2FdH+aNH/d69oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzMwXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzMxXSAxqHBvc2l0aW9uk8rE/xmaysTd+ADypHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lplszMV0gMqhwb3NpdGlvbpPKxP8ZmsrE3fgA/KR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rE/xmaysTd+AD3r2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbMzFdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbMzJdIDGocG9zaXRpb26TysT9vCnKxNuXXPKkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzMyXSAyqHBvc2l0aW9uk8rE/bwpysTbl1z8pHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysT9vCnKxNuXXPevaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lplszMl0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lplszM10gMahwb3NpdGlvbpPKxPtDhcrE3Gdc8qR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbMzNdIDKocG9zaXRpb26TysT7Q4XKxNxnXPykdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxPtDhcrE3Gdc969oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzMzXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzM0XSAxqHBvc2l0aW9uk8pELBsCysSAdM3Qk6R0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbMzRdIDKocG9zaXRpb26TykQsGwLKxIB0zdCdpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TykQsGwLKxIB0zdCYr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbMzRdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbMzVdIDGocG9zaXRpb26TykQqFQ7KxHvRSNCTpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lplszNV0gMqhwb3NpdGlvbpPKRCoVDsrEe9FI0J2kdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKRCoVDsrEe9FI0JivaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lplszNV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lplszNl0gMahwb3NpdGlvbpPKRC5uZsrEePYl0JOkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzM2XSAyqHBvc2l0aW9uk8pELm5mysR49iXQnaR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8pELm5mysR49iXQmK9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzM2XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzM3XSAxqHBvc2l0aW9uk80By9H7E+CkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzM3XSAyqHBvc2l0aW9uk80By9H7E+qkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPNAcvR+xPlr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbMzddIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbMzhdIDGocG9zaXRpb26TykMFR/DKw8vnz9DApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lplszOF0gMqhwb3NpdGlvbpPKQwVH8MrDy+fP0MqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKQwVH8MrDy+fP0MWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lplszOF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lplszOV0gMahwb3NpdGlvbpPKQxj3jcrDxxKP0MCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzM5XSAyqHBvc2l0aW9uk8pDGPeNysPHEo/QyqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8pDGPeNysPHEo/Qxa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzM5XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzQwXSAxqHBvc2l0aW9uk8pDJbdMysPPS6bQwKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbNDBdIDKocG9zaXRpb26TykMlt0zKw89LptDKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TykMlt0zKw89LptDFr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbNDBdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbNDFdIDGocG9zaXRpb26TysLrY9fKxAdPruCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzQxXSAyqHBvc2l0aW9uk8rC62PXysQHT67qpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysLrY9fKxAdPruWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpls0MV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpls0Ml0gMahwb3NpdGlvbpPKwtmn8MrEAkvn4KR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbNDJdIDKocG9zaXRpb26TysLZp/DKxAJL5+qkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKwtmn8MrEAkvn5a9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzQyXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzQzXSAxqHBvc2l0aW9uk8rCsPsjysQDZbLgpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpls0M10gMqhwb3NpdGlvbpPKwrD7I8rEA2Wy6qR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rCsPsjysQDZbLlr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbNDNdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbNDRdIDGocG9zaXRpb26T0fbT0fxk/aR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbNDRdIDKocG9zaXRpb26T0fbT0fxkB6R0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk9H209H8ZAKvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpls0NF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpls0NV0gMahwb3NpdGlvbpPR9uvR+6UDpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpls0NV0gMqhwb3NpdGlvbpPR9uvR+6UNpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26T0fbr0fulCK9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzQ1XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzQ2XSAxqHBvc2l0aW9uk9H3h9H8IQKkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzQ2XSAyqHBvc2l0aW9uk9H3h9H8IQykdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPR94fR/CEHr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbNDZdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbNDddIDGocG9zaXRpb26T0fXMzQS80f96pHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpls0N10gMqhwb3NpdGlvbpPR9czNBLzQhKR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk9H1zM0EvNH/f69oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzQ3XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzQ4XSAxqHBvc2l0aW9uk9H1880FDNC2pHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpls0OF0gMqhwb3NpdGlvbpPR9fPNBQzQwKR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk9H1880FDNC7r2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbNDhdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbNDldIDGocG9zaXRpb26TysU2fADKxD9M7gmkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzQ5XSAyqHBvc2l0aW9uk8rFNnwAysQ/TO4TpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysU2fADKxD9M7g6vaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpls0OV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpls1MF0gMahwb3NpdGlvbpPKxTdge8rEOyQICaR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbNTBdIDKocG9zaXRpb26TysU3YHvKxDskCBOkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxTdge8rEOyQIDq9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzUwXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzUxXSAxqHBvc2l0aW9uk8rFNpTNysQ3BocJpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpls1MV0gMqhwb3NpdGlvbpPKxTaUzcrENwaHE6R0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rFNpTNysQ3BocOr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbNTFdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbNTJdIDGocG9zaXRpb26TysUSXwrKwqjU5NH/B6R0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbNTJdIDKocG9zaXRpb26TysUSXwrKwqjU5NH/EaR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rFEl8KysKo1OTR/wyvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpls1Ml0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpls1M10gMahwb3NpdGlvbpPKxRKO4crC1Ei00f8HpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpls1M10gMqhwb3NpdGlvbpPKxRKO4crC1Ei00f8RpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysUSjuHKwtRItNH/DK9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzUzXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzU0XSAxqHBvc2l0aW9uk8rFE9sKysLXB67R/wekdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzU0XSAyqHBvc2l0aW9uk8rFE9sKysLXB67R/xGkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxRPbCsrC1weu0f8Mr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbNTRdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbNTVdIDGocG9zaXRpb26T0fdpzQR70f9ppHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpls1NV0gMqhwb3NpdGlvbpPR92nNBHvR/3OkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPR92nNBHvR/26vaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpls1NV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpls1Nl0gMahwb3NpdGlvbpPR9mvNBQ7Q26R0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbNTZdIDKocG9zaXRpb26T0fZrzQUO5aR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk9H2a80FDuCvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpls1Nl0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpls1N10gMahwb3NpdGlvbpPR9ajNBH7R/0mkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzU3XSAyqHBvc2l0aW9uk9H1qM0EftH/U6R0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk9H1qM0EftH/Tq9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzU3XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzU4XSAxqHBvc2l0aW9uk8pDcfqgysLDUarspHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpls1OF0gMqhwb3NpdGlvbpPKQ3H6oMrCw1Gq9qR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8pDcfqgysLDUarxr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbNThdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbNTldIDGocG9zaXRpb26TykNcDVDKwsQzguykdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzU5XSAyqHBvc2l0aW9uk8pDXA1QysLEM4L2pHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TykNcDVDKwsQzgvGvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpls1OV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpls2MF0gMahwb3NpdGlvbpPKQ1dysMrCm51+7KR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbNjBdIDKocG9zaXRpb26TykNXcrDKwpudfvakdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKQ1dysMrCm51+8a9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzYwXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzYxXSAxqHBvc2l0aW9uk8rDHAJOysJ9gifQ36R0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbNjFdIDKocG9zaXRpb26TysMcAk7Kwn2CJ+mkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKwxwCTsrCfYIn5K9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzYxXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzYyXSAxqHBvc2l0aW9uk8rDCMxKysKT6ujQ36R0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbNjJdIDKocG9zaXRpb26TysMIzErKwpPq6OmkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKwwjMSsrCk+ro5K9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzYyXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzYzXSAxqHBvc2l0aW9uk8rDDvU/ysK7q3jQ36R0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbNjNdIDKocG9zaXRpb26TysMO9T/KwrureOmkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKww71P8rCu6t45K9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzYzXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzY0XSAxqHBvc2l0aW9uk8pD+MFIysSu9R/Qr6R0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbNjRdIDKocG9zaXRpb26TykP4wUjKxK71H9C5pHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TykP4wUjKxK71H9C0r2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbNjRdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbNjVdIDGocG9zaXRpb26TykPzACHKxKyfrtCvpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpls2NV0gMqhwb3NpdGlvbpPKQ/MAIcrErJ+u0LmkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKQ/MAIcrErJ+u0LSvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpls2NV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpls2Nl0gMahwb3NpdGlvbpPKQ/qTM8rEqtcK0K+kdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzY2XSAyqHBvc2l0aW9uk8pD+pMzysSq1wrQuaR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8pD+pMzysSq1wrQtK9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzY2XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzY3XSAxqHBvc2l0aW9uk8pDqiVgysSw6zPQr6R0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbNjddIDKocG9zaXRpb26TykOqJWDKxLDrM9C5pHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TykOqJWDKxLDrM9C0r2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbNjddIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbNjhdIDGocG9zaXRpb26TykO0HM3KxK/GZtCvpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpls2OF0gMqhwb3NpdGlvbpPKQ7QczcrEr8Zm0LmkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKQ7QczcrEr8Zm0LSvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpls2OF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpls2OV0gMahwb3NpdGlvbpPKQ7pE/srEsd8K0K+kdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzY5XSAyqHBvc2l0aW9uk8pDukT+ysSx3wrQuaR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8pDukT+ysSx3wrQtK9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzY5XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzcwXSAxqHBvc2l0aW9uk8pEFYeNysSyRM3Qr6R0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbNzBdIDKocG9zaXRpb26TykQVh43KxLJEzdC5pHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TykQVh43KxLJEzdC0r2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbNzBdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbNzFdIDGocG9zaXRpb26TykQW+wLR+oPQr6R0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbNzFdIDKocG9zaXRpb26TykQW+wLR+oPQuaR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8pEFvsC0fqD0LSvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpls3MV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpls3Ml0gMahwb3NpdGlvbpPKRBwr+MrEr8sz0K+kdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzcyXSAyqHBvc2l0aW9uk8pEHCv4ysSvyzPQuaR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8pEHCv4ysSvyzPQtK9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzcyXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzczXSAxqHBvc2l0aW9uk8rFIJQAysQ7cuEEpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpls3M10gMqhwb3NpdGlvbpPKxSCUAMrEO3LhDqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rFIJQAysQ7cuEJr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbNzNdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbNzRdIDGocG9zaXRpb26TysUhxFLKxDi4UgSkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzc0XSAyqHBvc2l0aW9uk8rFIcRSysQ4uFIOpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysUhxFLKxDi4UgmvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpls3NF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpls3NV0gMahwb3NpdGlvbpPKxSFcUsrEM8dMBKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbNzVdIDKocG9zaXRpb26TysUhXFLKxDPHTA6kdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxSFcUsrEM8dMCa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzc1XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzc2XSAxqHBvc2l0aW9uk8rEbVOmykQ3zKw5pHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpls3Nl0gMqhwb3NpdGlvbpPKxG1TpspEN8ysQ6R0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEbVOmykQ3zKw+r2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbNzZdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbNzddIDGocG9zaXRpb26TysRpEzPKRDtC4TmkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzc3XSAyqHBvc2l0aW9uk8rEaRMzykQ7QuFDpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysRpEzPKRDtC4T6vaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpls3N10gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpls3OF0gMahwb3NpdGlvbpPKxGULZMpEN/jlOaR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbNzhdIDKocG9zaXRpb26TysRlC2TKRDf45UOkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxGULZMpEN/jlPq9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzc4XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzc5XSAxqHBvc2l0aW9uk8rFR849ykQSmGIwpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpls3OV0gMqhwb3NpdGlvbpPKxUfOPcpEEphiOqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rFR849ykQSmGI1r2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbNzldIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbODBdIDGocG9zaXRpb26TysVISezKRBe5yzCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzgwXSAyqHBvc2l0aW9uk8rFSEnsykQXucs6pHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysVISezKRBe5yzWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpls4MF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpls4MV0gMahwb3NpdGlvbpPKxUcwe8pEGoEXMKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbODFdIDKocG9zaXRpb26TysVHMHvKRBqBFzqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxUcwe8pEGoEXNa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzgxXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzgyXSAxqHBvc2l0aW9uk8rE1i1xykOy964ApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpls4Ml0gMqhwb3NpdGlvbpPKxNYtccpDsveuCqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rE1i1xykOy964Fr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbODJdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbODNdIDGocG9zaXRpb26TysTY5HvKQ7R3CgCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzgzXSAyqHBvc2l0aW9uk8rE2OR7ykO0dwoKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysTY5HvKQ7R3CgWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpls4M10gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpls4NF0gMahwb3NpdGlvbpPKxNkQUspDvti0AKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbODRdIDKocG9zaXRpb26TysTZEFLKQ77YtAqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxNkQUspDvti0Ba9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzg0XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzg1XSAxqHBvc2l0aW9uk8rEzz5mykRCHrjQwKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbODVdIDKocG9zaXRpb26TysTPPmbKREIeuNDKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysTPPmbKREIeuNDFr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbODVdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbODZdIDGocG9zaXRpb26TysTR/CnKREH2RtDApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpls4Nl0gMqhwb3NpdGlvbpPKxNH8KcpEQfZG0MqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxNH8KcpEQfZG0MWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpls4Nl0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpls4N10gMahwb3NpdGlvbpPKxNKVH8pERwZm0MCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzg3XSAyqHBvc2l0aW9uk8rE0pUfykRHBmbQyqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rE0pUfykRHBmbQxa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzg3XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzg4XSAxqHBvc2l0aW9uk8rE543DykQ541TQwKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbODhdIDKocG9zaXRpb26TysTnjcPKRDnjVNDKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysTnjcPKRDnjVNDFr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbODhdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbODldIDGocG9zaXRpb26TysTl/rjKRDVgtNDApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpls4OV0gMqhwb3NpdGlvbpPKxOX+uMpENWC00MqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxOX+uMpENWC00MWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpls4OV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpls5MF0gMahwb3NpdGlvbpPKxOfK4cpEMZ4l0MCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzkwXSAyqHBvc2l0aW9uk8rE58rhykQxniXQyqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rE58rhykQxniXQxa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzkwXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzkxXSAxqHBvc2l0aW9uk8rE3UYUykPcYQbR/1CkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzkxXSAyqHBvc2l0aW9uk8rE3UYUykPcYQbR/1qkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxN1GFMpD3GEG0f9Vr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbOTFdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbOTJdIDGocG9zaXRpb26TysTdmezKQ9F9stH/UKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbOTJdIDKocG9zaXRpb26TysTdmezKQ9F9stH/WqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rE3ZnsykPRfbLR/1WvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpls5Ml0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpls5M10gMahwb3NpdGlvbpPKxOAxSMpD0J+e0f9QpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpls5M10gMqhwb3NpdGlvbpPKxOAxSMpD0J+e0f9apHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysTgMUjKQ9CfntH/Va9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzkzXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzk0XSAxqHBvc2l0aW9uk8rE75j2ykQxdR/R/1CkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzk0XSAyqHBvc2l0aW9uk8rE75j2ykQxdR/R/1qkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxO+Y9spEMXUf0f9Vr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbOTRdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbOTVdIDGocG9zaXRpb26TysTyRCnKRDA1w9H/UKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbOTVdIDKocG9zaXRpb26TysTyRCnKRDA1w9H/WqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rE8kQpykQwNcPR/1WvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpls5NV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpls5Nl0gMahwb3NpdGlvbpPKxPNbhcpENO7Z0f9QpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpls5Nl0gMqhwb3NpdGlvbpPKxPNbhcpENO7Z0f9apHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysTzW4XKRDTu2dH/Va9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzk2XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWmWzk3XSAxqHBvc2l0aW9uk8rE8sgAykPXaTfR/1CkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWmWzk3XSAyqHBvc2l0aW9uk8rE8sgAykPXaTfR/1qkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxPLIAMpD12k30f9Vr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZaZbOTddIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZaZbOThdIDGocG9zaXRpb26TysT1dXHKQ9nBidH/UKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZaZbOThdIDKocG9zaXRpb26TysT1dXHKQ9nBidH/WqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rE9XVxykPZwYnR/1WvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lpls5OF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lpls5OV0gMahwb3NpdGlvbpPKxPVtH8pD5CjV0f9QpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lpls5OV0gMqhwb3NpdGlvbpPKxPVtH8pD5CjV0f9apHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysT1bR/KQ+Qo1dH/Va9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWmWzk5XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzEwMF0gMahwb3NpdGlvbpPKxTMDXMpEJZMSAKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTAwXSAyqHBvc2l0aW9uk8rFMwNcykQlkxIKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysUzA1zKRCWTEgWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxMDBdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTAxXSAxqHBvc2l0aW9uk8rFMv49ykQrDocApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxMDFdIDKocG9zaXRpb26TysUy/j3KRCsOhwqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxTL+PcpEKw6HBa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzEwMV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxMDJdIDGocG9zaXRpb26TysUxtzPKRCwHrgCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzEwMl0gMqhwb3NpdGlvbpPKxTG3M8pELAeuCqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rFMbczykQsB64Fr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTAyXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzEwM10gMahwb3NpdGlvbpPKxFg0GcrCxBMmzICkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzEwM10gMqhwb3NpdGlvbpPKxFg0GcrCxBMmzIqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxFg0GcrCxBMmzIWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxMDNdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTA0XSAxqHBvc2l0aW9uk8rEVyv4ysKY/sXMgKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTA0XSAyqHBvc2l0aW9uk8rEVyv4ysKY/sXMiqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEVyv4ysKY/sXMha9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzEwNF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxMDVdIDGocG9zaXRpb26TysRR+FLKwphtUMyApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxMDVdIDKocG9zaXRpb26TysRR+FLKwphtUMyKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysRR+FLKwphtUMyFr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTA1XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzEwNl0gMahwb3NpdGlvbpPKxDzEGcrDnAdMzICkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzEwNl0gMqhwb3NpdGlvbpPKxDzEGcrDnAdMzIqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxDzEGcrDnAdMzIWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxMDZdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTA3XSAxqHBvc2l0aW9uk8rEPdhCysOmx67MgKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTA3XSAyqHBvc2l0aW9uk8rEPdhCysOmx67MiqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEPdhCysOmx67Mha9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzEwN10gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxMDhdIDGocG9zaXRpb26TysRDC/jKw6bU3cyApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxMDhdIDKocG9zaXRpb26TysRDC/jKw6bU3cyKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysRDC/jKw6bU3cyFr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTA4XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzEwOV0gMahwb3NpdGlvbpPKxEV03crETE9M4KR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTA5XSAyqHBvc2l0aW9uk8rERXTdysRMT0zqpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysRFdN3KxExPTOWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxMDldIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTEwXSAxqHBvc2l0aW9uk8rESu76ysRMkDHgpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxMTBdIDKocG9zaXRpb26TysRK7vrKxEyQMeqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxEru+srETJAx5a9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzExMF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxMTFdIDGocG9zaXRpb26TysRMN43KxEeFouCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzExMV0gMqhwb3NpdGlvbpPKxEw3jcrER4Wi6qR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rETDeNysRHhaLlr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTExXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzExMl0gMahwb3NpdGlvbpPKxTSZccrEi4o9IKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTEyXSAyqHBvc2l0aW9uk8rFNJlxysSLij0qpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysU0mXHKxIuKPSWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxMTJdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTEzXSAxqHBvc2l0aW9uk8rFNfQpysSLHhQgpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxMTNdIDKocG9zaXRpb26TysU19CnKxIseFCqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxTX0KcrEix4UJa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzExM10gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxMTRdIDGocG9zaXRpb26TysU2BFLKxIiFHyCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzExNF0gMqhwb3NpdGlvbpPKxTYEUsrEiIUfKqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rFNgRSysSIhR8lr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTE0XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzExNV0gMahwb3NpdGlvbpPKxQUbCspDjHsj0f8QpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxMTVdIDKocG9zaXRpb26TysUFGwrKQ4x7I9H/GqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rFBRsKykOMeyPR/xWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxMTVdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTE2XSAxqHBvc2l0aW9uk8rFA9maykOQ4UjR/xCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzExNl0gMqhwb3NpdGlvbpPKxQPZmspDkOFI0f8apHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysUD2ZrKQ5DhSNH/Fa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzExNl0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxMTddIDGocG9zaXRpb26TysUDGXHKQ4hjEtH/EKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTE3XSAyqHBvc2l0aW9uk8rFAxlxykOIYxLR/xqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxQMZccpDiGMS0f8Vr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTE3XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzExOF0gMahwb3NpdGlvbpPKxOrgUsrElVKPAKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTE4XSAyqHBvc2l0aW9uk8rE6uBSysSVUo8KpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysTq4FLKxJVSjwWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxMThdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTE5XSAxqHBvc2l0aW9uk8rE6CVxysSVk9cApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxMTldIDKocG9zaXRpb26TysToJXHKxJWT1wqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxOglccrElZPXBa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzExOV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxMjBdIDGocG9zaXRpb26TysTn3M3KxJgp7ACkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzEyMF0gMqhwb3NpdGlvbpPKxOfczcrEmCnsCqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rE59zNysSYKewFr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTIwXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzEyMV0gMahwb3NpdGlvbpPKxOQB7MrEqyCkAKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTIxXSAyqHBvc2l0aW9uk8rE5AHsysSrIKQKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysTkAezKxKsgpAWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxMjFdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTIyXSAxqHBvc2l0aW9uk8rE4XAAysSsFHsApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxMjJdIDKocG9zaXRpb26TysThcADKxKwUewqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxOFwAMrErBR7Ba9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzEyMl0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxMjNdIDGocG9zaXRpb26TysTh1M3KxK6muACkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzEyM10gMqhwb3NpdGlvbpPKxOHUzcrErqa4CqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rE4dTNysSuprgFr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTIzXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzEyNF0gMahwb3NpdGlvbpPKxO9uFMrErRZmAKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTI0XSAyqHBvc2l0aW9uk8rE724UysStFmYKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysTvbhTKxK0WZgWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxMjRdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTI1XSAxqHBvc2l0aW9uk8rE7ecKysSqz1wApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxMjVdIDKocG9zaXRpb26TysTt5wrKxKrPXAqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxO3nCsrEqs9cBa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzEyNV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxMjZdIDGocG9zaXRpb26TysTrfrjKxKvLMwCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzEyNl0gMqhwb3NpdGlvbpPKxOt+uMrEq8szCqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rE6364ysSryzMFr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTI2XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzEyN10gMahwb3NpdGlvbpPKxPmI9srEnOlIAKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTI3XSAyqHBvc2l0aW9uk8rE+Yj2ysSc6UgKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysT5iPbKxJzpSAWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxMjddIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTI4XSAxqHBvc2l0aW9uk8rE/BR7ysSb5CkApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxMjhdIDKocG9zaXRpb26TysT8FHvKxJvkKQqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxPwUe8rEm+QpBa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzEyOF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxMjldIDGocG9zaXRpb26TysT7nmbKxJlUzQCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzEyOV0gMqhwb3NpdGlvbpPKxPueZsrEmVTNCqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rE+55mysSZVM0Fr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTI5XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzEzMF0gMahwb3NpdGlvbpPKxOTHCsrEyS3DYKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTMwXSAyqHBvc2l0aW9uk8rE5McKysTJLcNqpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysTkxwrKxMktw2WvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxMzBdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTMxXSAxqHBvc2l0aW9uk8rE4hPXysTJpcNgpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxMzFdIDKocG9zaXRpb26TysTiE9fKxMmlw2qkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxOIT18rEyaXDZa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzEzMV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxMzJdIDGocG9zaXRpb26TysTh/wrKxMw/XGCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzEzMl0gMqhwb3NpdGlvbpPKxOH/CsrEzD9caqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rE4f8KysTMP1xlr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTMyXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzEzM10gMahwb3NpdGlvbpPKQ9IsrMrEX2o90LikdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzEzM10gMqhwb3NpdGlvbpPKQ9IsrMrEX2o90MKkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKQ9IsrMrEX2o90L2vaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxMzNdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTM0XSAxqHBvc2l0aW9uk8pD2QYlysRjsm/QuKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTM0XSAyqHBvc2l0aW9uk8pD2QYlysRjsm/QwqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8pD2QYlysRjsm/Qva9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzEzNF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxMzVdIDGocG9zaXRpb26TykPSYCHKxGey0dC4pHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxMzVdIDKocG9zaXRpb26TykPSYCHKxGey0dDCpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TykPSYCHKxGey0dC9r2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTM1XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzEzNl0gMahwb3NpdGlvbpPKQ1Hc7srEjVHs0LikdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzEzNl0gMqhwb3NpdGlvbpPKQ1Hc7srEjVHs0MKkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKQ1Hc7srEjVHs0L2vaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxMzZdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTM3XSAxqHBvc2l0aW9uk8pDQkLRysSPPwrQuKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTM3XSAyqHBvc2l0aW9uk8pDQkLRysSPPwrQwqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8pDQkLRysSPPwrQva9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzEzN10gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxMzhdIDGocG9zaXRpb26TykMw8/jKxI3NcdC4pHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxMzhdIDKocG9zaXRpb26TykMw8/jKxI3NcdDCpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TykMw8/jKxI3NcdC9r2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTM4XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzEzOV0gMahwb3NpdGlvbpPKweOS18rEZ8gA0LikdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzEzOV0gMqhwb3NpdGlvbpPKweOS18rEZ8gA0MKkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKweOS18rEZ8gA0L2vaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxMzldIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTQwXSAxqHBvc2l0aW9uk8rCLBdZysRjrzvQuKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTQwXSAyqHBvc2l0aW9uk8rCLBdZysRjrzvQwqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rCLBdZysRjrzvQva9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE0MF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxNDFdIDGocG9zaXRpb26TysH0p7vKxF+DttC4pHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxNDFdIDKocG9zaXRpb26TysH0p7vKxF+DttDCpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysH0p7vKxF+DttC9r2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTQxXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE0Ml0gMahwb3NpdGlvbpPKxTGaZspDtsn8AKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTQyXSAyqHBvc2l0aW9uk8rFMZpmykO2yfwKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysUxmmbKQ7bJ/AWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxNDJdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTQzXSAxqHBvc2l0aW9uk8rFMFRSykO61eMApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxNDNdIDKocG9zaXRpb26TysUwVFLKQ7rV4wqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxTBUUspDutXjBa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE0M10gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxNDRdIDGocG9zaXRpb26TysUvnZrKQ7IjMwCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzE0NF0gMqhwb3NpdGlvbpPKxS+dmspDsiMzCqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rFL52aykOyIzMFr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTQ0XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE0NV0gMahwb3NpdGlvbpPKxErSHcrD26vn9aR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTQ1XSAyqHBvc2l0aW9uk8rEStIdysPbq+f/pHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysRK0h3Kw9ur5/qvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxNDVdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTQ2XSAxqHBvc2l0aW9uk8rET8NkysPga0T1pHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxNDZdIDKocG9zaXRpb26TysRPw2TKw+BrRP+kdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxE/DZMrD4GtE+q9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE0Nl0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxNDddIDGocG9zaXRpb26TysRS6h3Kw9gj+PWkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzE0N10gMqhwb3NpdGlvbpPKxFLqHcrD2CP4/6R0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEUuodysPYI/j6r2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTQ3XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE0OF0gMahwb3NpdGlvbpPKxCcZ/MpD0OCk/6R0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTQ4XSAyqHBvc2l0aW9uk8rEJxn8ykPQ4KQJpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysQnGfzKQ9DgpASvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxNDhdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTQ5XSAxqHBvc2l0aW9uk8rEIaAQykPQVT//pHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxNDldIDKocG9zaXRpb26TysQhoBDKQ9BVPwmkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxCGgEMpD0FU/BK9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE0OV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxNTBdIDGocG9zaXRpb26TysQg1LzKQ8YM7v+kdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzE1MF0gMqhwb3NpdGlvbpPKxCDUvMpDxgzuCaR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEINS8ykPGDO4Er2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTUwXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE1MV0gMahwb3NpdGlvbpPKxCigAMpEN92iEKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTUxXSAyqHBvc2l0aW9uk8rEKKAAykQ33aIapHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysQooADKRDfdohWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxNTFdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTUyXSAxqHBvc2l0aW9uk8rELEhzykQzyAAQpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxNTJdIDKocG9zaXRpb26TysQsSHPKRDPIABqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxCxIc8pEM8gAFa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE1Ml0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxNTNdIDGocG9zaXRpb26TysQwxzvKRDZmRhCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzE1M10gMqhwb3NpdGlvbpPKxDDHO8pENmZGGqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEMMc7ykQ2ZkYVr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTUzXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE1NF0gMahwb3NpdGlvbpPKxAgfvspEOMxKEKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTU0XSAyqHBvc2l0aW9uk8rECB++ykQ4zEoapHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysQIH77KRDjMShWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxNTRdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTU1XSAxqHBvc2l0aW9uk8rEArLyykQ4AIMQpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxNTVdIDKocG9zaXRpb26TysQCsvLKRDgAgxqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxAKy8spEOACDFa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE1NV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxNTZdIDGocG9zaXRpb26TysQCZrjKRDLO6RCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzE1Nl0gMqhwb3NpdGlvbpPKxAJmuMpEMs7pGqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEAma4ykQyzukVr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTU2XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE1N10gMahwb3NpdGlvbpPKxDTC4cpCbhRGAKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTU3XSAyqHBvc2l0aW9uk8rENMLhykJuFEYKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysQ0wuHKQm4URgWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxNTddIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTU4XSAxqHBvc2l0aW9uk8rEL0ffykJwm9oApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxNThdIDKocG9zaXRpb26TysQvR9/KQnCb2gqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxC9H38pCcJvaBa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE1OF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxNTldIDGocG9zaXRpb26TysQuFePKQh+ZzgCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzE1OV0gMqhwb3NpdGlvbpPKxC4V48pCH5nOCqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rELhXjykIfmc4Fr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTU5XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE2MF0gMahwb3NpdGlvbpPKxAX19MpDnFcK/6R0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTYwXSAyqHBvc2l0aW9uk8rEBfX0ykOcVwoJpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysQF9fTKQ5xXCgSvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxNjBdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTYxXSAxqHBvc2l0aW9uk8rEAILhykObIKT/pHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxNjFdIDKocG9zaXRpb26TysQAguHKQ5sgpAmkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxACC4cpDmyCkBK9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE2MV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxNjJdIDGocG9zaXRpb26TysQACFLKQ5DEe/+kdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzE2Ml0gMqhwb3NpdGlvbpPKxAAIUspDkMR7CaR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEAAhSykOQxHsEr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTYyXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE2M10gMahwb3NpdGlvbpPKxGwaoMq/iE39zICkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzE2M10gMqhwb3NpdGlvbpPKxGwaoMq/iE39zIqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxGwaoMq/iE39zIWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxNjNdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTY0XSAxqHBvc2l0aW9uk8rEcYkXyj/2/sXMgKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTY0XSAyqHBvc2l0aW9uk8rEcYkXyj/2/sXMiqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEcYkXyj/2/sXMha9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE2NF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxNjVdIDGocG9zaXRpb26TysRx4PbKQbWLRMyApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxNjVdIDKocG9zaXRpb26TysRx4PbKQbWLRMyKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysRx4PbKQbWLRMyFr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTY1XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE2Nl0gMahwb3NpdGlvbpPKxE+jdcpC3IYlzICkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzE2Nl0gMqhwb3NpdGlvbpPKxE+jdcpC3IYlzIqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxE+jdcpC3IYlzIWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxNjZdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTY3XSAxqHBvc2l0aW9uk8rEUjMjykK1vaXMgKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTY3XSAyqHBvc2l0aW9uk8rEUjMjykK1vaXMiqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEUjMjykK1vaXMha9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE2N10gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxNjhdIDGocG9zaXRpb26TysRXMdvKQsFdIsyApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxNjhdIDKocG9zaXRpb26TysRXMdvKQsFdIsyKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysRXMdvKQsFdIsyFr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTY4XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE2OV0gMahwb3NpdGlvbpPKxIAQAMpD1piTAKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTY5XSAyqHBvc2l0aW9uk8rEgBAAykPWmJMKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysSAEADKQ9aYkwWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxNjldIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTcwXSAxqHBvc2l0aW9uk8rEerMzykPVAQYApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxNzBdIDKocG9zaXRpb26TysR6szPKQ9UBBgqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxHqzM8pD1QEGBa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE3MF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxNzFdIDGocG9zaXRpb26TysR6ZmbKQ8qd0wCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzE3MV0gMqhwb3NpdGlvbpPKxHpmZspDyp3TCqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEemZmykPKndMFr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTcxXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE3Ml0gMahwb3NpdGlvbpPKxIhwpMrD7wXD4KR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTcyXSAyqHBvc2l0aW9uk8rEiHCkysPvBcPqpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysSIcKTKw+8Fw+WvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxNzJdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTczXSAxqHBvc2l0aW9uk8rEiITNysPkD77gpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxNzNdIDKocG9zaXRpb26TysSIhM3Kw+QPvuqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxIiEzcrD5A++5a9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE3M10gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxNzRdIDGocG9zaXRpb26TysSF/M3Kw+Grx+CkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzE3NF0gMqhwb3NpdGlvbpPKxIX8zcrD4avH6qR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEhfzNysPhq8flr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTc0XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE3NV0gMahwb3NpdGlvbpPKxIEWFMrEEoNk4KR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTc1XSAyqHBvc2l0aW9uk8rEgRYUysQSg2TqpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysSBFhTKxBKDZOWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxNzVdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTc2XSAxqHBvc2l0aW9uk8rEfLuFysQR1JzgpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxNzZdIDKocG9zaXRpb26TysR8u4XKxBHUnOqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxHy7hcrEEdSc5a9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE3Nl0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxNzddIDGocG9zaXRpb26TysR7DrjKxBbBeeCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzE3N10gMqhwb3NpdGlvbpPKxHsOuMrEFsF56qR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEew64ysQWwXnlr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTc3XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE3OF0gMahwb3NpdGlvbpPKxCWYYsrEPPkn4KR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTc4XSAyqHBvc2l0aW9uk8rEJZhiysQ8+SfqpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysQlmGLKxDz5J+WvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxNzhdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTc5XSAxqHBvc2l0aW9uk8rEJHzdysRCV8/gpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxNzldIDKocG9zaXRpb26TysQkfN3KxEJXz+qkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxCR83crEQlfP5a9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE3OV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxODBdIDGocG9zaXRpb26TysQpRCnKxERmNeCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzE4MF0gMqhwb3NpdGlvbpPKxClEKcrERGY16qR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEKUQpysREZjXlr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTgwXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE4MV0gMahwb3NpdGlvbpPKxCHbpsrEGBys4KR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTgxXSAyqHBvc2l0aW9uk8rEIdumysQYHKzqpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysQh26bKxBgcrOWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxODFdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTgyXSAxqHBvc2l0aW9uk8rEHr2RysQcn0zgpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxODJdIDKocG9zaXRpb26TysQevZHKxByfTOqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxB69kcrEHJ9M5a9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE4Ml0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxODNdIDGocG9zaXRpb26TysQiVfTKxCBh2+CkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzE4M10gMqhwb3NpdGlvbpPKxCJV9MrEIGHb6qR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEIlX0ysQgYdvlr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTgzXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE4NF0gMahwb3NpdGlvbpPKxRfpSMpDxcao0f8QpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxODRdIDKocG9zaXRpb26TysUX6UjKQ8XGqNH/GqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rFF+lIykPFxqjR/xWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxODRdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTg1XSAxqHBvc2l0aW9uk8rFGDpmykO7G0TR/xCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzE4NV0gMqhwb3NpdGlvbpPKxRg6ZspDuxtE0f8apHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysUYOmbKQ7sbRNH/Fa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE4NV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxODZdIDGocG9zaXRpb26TysUZhzPKQ7trI9H/EKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTg2XSAyqHBvc2l0aW9uk8rFGYczykO7ayPR/xqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxRmHM8pDu2sj0f8Vr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTg2XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE4N10gMahwb3NpdGlvbpPKxQKIzcpCmv0I0f8QpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxODddIDKocG9zaXRpb26TysUCiM3KQpr9CNH/GqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rFAojNykKa/QjR/xWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxODddIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTg4XSAxqHBvc2l0aW9uk8rFAhpmykLEnzvR/xCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzE4OF0gMqhwb3NpdGlvbpPKxQIaZspCxJ870f8apHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysUCGmbKQsSfO9H/Fa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE4OF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxODldIDGocG9zaXRpb26TysUAz67KQr/A+dH/EKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTg5XSAyqHBvc2l0aW9uk8rFAM+uykK/wPnR/xqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxQDPrspCv8D50f8Vr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTg5XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE5MF0gMahwb3NpdGlvbpPKxQ4UKcpD3xl50f8QpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxOTBdIDKocG9zaXRpb26TysUOFCnKQ98ZedH/GqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rFDhQpykPfGXnR/xWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxOTBdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTkxXSAxqHBvc2l0aW9uk8rFD2/XykPdo5bR/xCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzE5MV0gMqhwb3NpdGlvbpPKxQ9v18pD3aOW0f8apHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysUPb9fKQ92jltH/Fa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE5MV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxOTJdIDGocG9zaXRpb26TysUP3cPKQ+d1otH/EKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTkyXSAyqHBvc2l0aW9uk8rFD93DykPndaLR/xqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxQ/dw8pD53Wi0f8Vr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTkyXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE5M10gMahwb3NpdGlvbpPKxRpHCspCJYpY0f8QpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxOTNdIDKocG9zaXRpb26TysUaRwrKQiWKWNH/GqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rFGkcKykIliljR/xWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxOTNdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTk0XSAxqHBvc2l0aW9uk8rFGduFykJ5C6zR/xCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzE5NF0gMqhwb3NpdGlvbpPKxRnbhcpCeQus0f8apHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysUZ24XKQnkLrNH/Fa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE5NF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxOTVdIDGocG9zaXRpb26TysUYkKTKQnAH49H/EKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTk1XSAyqHBvc2l0aW9uk8rFGJCkykJwB+PR/xqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxRiQpMpCcAfj0f8Vr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTk1XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE5Nl0gMahwb3NpdGlvbpPKxRWyZspCh8PK0f8QpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxOTZdIDKocG9zaXRpb26TysUVsmbKQofDytH/GqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rFFbJmykKHw8rR/xWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxOTZdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMTk3XSAxqHBvc2l0aW9uk9H2uspCeE920f8QpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1sxOTddIDKocG9zaXRpb26T0fa6ykJ4T3bR/xqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPR9rrKQnhPdtH/Fa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzE5N10gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1sxOThdIDGocG9zaXRpb26TysUUdZrKQiVAT9H/EKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTk4XSAyqHBvc2l0aW9uk8rFFHWaykIlQE/R/xqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxRR1mspCJUBP0f8Vr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMTk4XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzE5OV0gMahwb3NpdGlvbpPKxKX8zcpD9R5WAKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMTk5XSAyqHBvc2l0aW9uk8rEpfzNykP1HlYKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysSl/M3KQ/UeVgWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1sxOTldIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMjAwXSAxqHBvc2l0aW9uk8rEpdZmykPqK0QApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1syMDBdIDKocG9zaXRpb26TysSl1mbKQ+orRAqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxKXWZspD6itEBa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzIwMF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1syMDFdIDGocG9zaXRpb26TysSoWj3KQ+eDtgCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzIwMV0gMqhwb3NpdGlvbpPKxKhaPcpD54O2CqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEqFo9ykPng7YFr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMjAxXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzIwMl0gMahwb3NpdGlvbpPKxJd2uMpED2R7K6R0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMjAyXSAyqHBvc2l0aW9uk8rEl3a4ykQPZHs1pHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysSXdrjKRA9kezCvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1syMDJdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMjAzXSAxqHBvc2l0aW9uk8rElQwpykQR+sErpHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1syMDNdIDKocG9zaXRpb26TysSVDCnKRBH6wTWkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxJUMKcpEEfrBMK9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzIwM10gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1syMDRdIDGocG9zaXRpb26TysSTYezKRA37VCukdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzIwNF0gMqhwb3NpdGlvbpPKxJNh7MpEDftUNaR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEk2HsykQN+1Qwr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMjA0XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzIwNV0gMahwb3NpdGlvbpPKxJBnrspDrmm6/6R0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMjA1XSAyqHBvc2l0aW9uk8rEkGeuykOuaboJpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysSQZ67KQ65pugSvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1syMDVdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMjA2XSAxqHBvc2l0aW9uk8rEkIgAykO5XfT/pHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1syMDZdIDKocG9zaXRpb26TysSQiADKQ7ld9AmkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxJCIAMpDuV30BK9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzIwNl0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1syMDddIDGocG9zaXRpb26TysSOAuHKQ7vvG/+kdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzIwN10gMqhwb3NpdGlvbpPKxI4C4cpDu+8bCaR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEjgLhykO77xsEr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMjA3XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzIwOF0gMahwb3NpdGlvbpPKxKK6j8pFJBY9zQFApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1syMDhdIDKocG9zaXRpb26TysSiuo/KRSQWPc0BSqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEorqPykUkFj3NAUWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1syMDhdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMjA5XSAxqHBvc2l0aW9uk8rEpL0fykUlBM3NAUCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzIwOV0gMqhwb3NpdGlvbpPKxKS9H8pFJQTNzQFKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysSkvR/KRSUEzc0BRa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzIwOV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1syMTBdIDGocG9zaXRpb26TysSjY9fKRSYhms0BQKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMjEwXSAyqHBvc2l0aW9uk8rEo2PXykUmIZrNAUqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxKNj18pFJiGazQFFr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMjEwXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzIxMV0gMahwb3NpdGlvbpPKxJKpmspFGfykzQFApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1syMTFdIDKocG9zaXRpb26TysSSqZrKRRn8pM0BSqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEkqmaykUZ/KTNAUWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1syMTFdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMjEyXSAxqHBvc2l0aW9uk8rElWdcykUaAcPNAUCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzIxMl0gMqhwb3NpdGlvbpPKxJVnXMpFGgHDzQFKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysSVZ1zKRRoBw80BRa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzIxMl0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1syMTNdIDGocG9zaXRpb26TysSV49fKRRtIzc0BQKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMjEzXSAyqHBvc2l0aW9uk8rElePXykUbSM3NAUqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxJXj18pFG0jNzQFFr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMjEzXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzIxNF0gMahwb3NpdGlvbpPKxIsy4cpFKvrhzQFApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1syMTRdIDKocG9zaXRpb26TysSLMuHKRSr64c0BSqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEizLhykUq+uHNAUWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1syMTRdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMjE1XSAxqHBvc2l0aW9uk8rEjehSykUrMPbNAUCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzIxNV0gMqhwb3NpdGlvbpPKxI3oUspFKzD2zQFKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysSN6FLKRSsw9s0BRa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzIxNV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1syMTZdIDGocG9zaXRpb26TysSOCKTKRSx9cc0BQKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMjE2XSAyqHBvc2l0aW9uk8rEjgikykUsfXHNAUqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxI4IpMpFLH1xzQFFr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMjE2XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzIxN10gMahwb3NpdGlvbpPKxMX3CspDvqWi/6R0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMjE3XSAyqHBvc2l0aW9uk8rExfcKykO+paIJpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysTF9wrKQ76logSvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1syMTddIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMjE4XSAxqHBvc2l0aW9uk8rEw2uFykO6kOX/pHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1syMThdIDKocG9zaXRpb26TysTDa4XKQ7qQ5QmkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxMNrhcpDupDlBK9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzIxOF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1syMTldIDGocG9zaXRpb26TysTD4ZrKQ7BTtv+kdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzIxOV0gMqhwb3NpdGlvbpPKxMPhmspDsFO2CaR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rEw+GaykOwU7YEr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMjE5XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzIyMF0gMahwb3NpdGlvbpPKxTAYKcpEAWOWAKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMjIwXSAyqHBvc2l0aW9uk8rFMBgpykQBY5YKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysUwGCnKRAFjlgWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1syMjBdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMjIxXSAxqHBvc2l0aW9uk8rFMCOFykP30WgApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1syMjFdIDKocG9zaXRpb26TysUwI4XKQ/fRaAqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxTAjhcpD99FoBa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzIyMV0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1syMjJdIDGocG9zaXRpb26TysUxa67KQ/YMzQCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzIyMl0gMqhwb3NpdGlvbpPKxTFrrspD9gzNCqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rFMWuuykP2DM0Fr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMjIyXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzIyM10gMahwb3NpdGlvbpPKxSbPXMpELIAxAKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMjIzXSAyqHBvc2l0aW9uk8rFJs9cykQsgDEKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysUmz1zKRCyAMQWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1syMjNdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMjI0XSAxqHBvc2l0aW9uk8rFKCD2ykQt/30ApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1syMjRdIDKocG9zaXRpb26TysUoIPbKRC3/fQqkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxSgg9spELf99Ba9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzIyNF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1syMjVdIDGocG9zaXRpb26TysUoCHvKRDMvrgCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzIyNV0gMqhwb3NpdGlvbpPKxSgIe8pEMy+uCqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rFKAh7ykQzL64Fr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMjI1XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzIyNl0gMahwb3NpdGlvbpPKxK53CspESlLRQKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMjI2XSAyqHBvc2l0aW9uk8rErncKykRKUtFKpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysSudwrKREpS0UWvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1syMjZdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMjI3XSAxqHBvc2l0aW9uk8rEq+uFykRISINApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1syMjddIDKocG9zaXRpb26TysSr64XKREhIg0qkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxKvrhcpESEiDRa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzIyN10gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1syMjhdIDGocG9zaXRpb26TysSsYZrKREMp20CkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzIyOF0gMqhwb3NpdGlvbpPKxKxhmspEQynbSqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rErGGaykRDKdtFr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMjI4XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzIyOV0gMahwb3NpdGlvbpPKxMG49spESrUfQKR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMjI5XSAyqHBvc2l0aW9uk8rEwbj2ykRKtR9KpHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26TysTBuPbKREq1H0WvaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1syMjldIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMjMwXSAxqHBvc2l0aW9uk8rEwoQpykRFdcNApHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1syMzBdIDKocG9zaXRpb26TysTChCnKREV1w0qkdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPKxMKEKcpERXXDRa9oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzIzMF0gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1syMzFdIDGocG9zaXRpb26TysTFG4XKREXu2UCkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzIzMV0gMqhwb3NpdGlvbpPKxMUbhcpERe7ZSqR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk8rExRuFykRF7tlFr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMjMxXSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWEqm1vZGVsX25hbWXZNW1vZGVscy9wcm9wcy9nZ190aWJldC9jYW5kbGVzdGlja3dpZGVzaG9ydG9ucGxhdGUubWRspG5hbWWnWzIzMl0gMahwb3NpdGlvbpPR/UHR/sripHR5cGWlTW9kZWyEqm1vZGVsX25hbWW2bW9uYXN0ZXJ5X2NhbmRsZV9mbGFtZaRuYW1lp1syMzJdIDKocG9zaXRpb26T0f1B0f7K7KR0eXBlqFBhcnRpY2xliKVjb2xvcpTM/8yCAMz/qm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDIudm10qHBvc2l0aW9uk9H9QdH+yuevaGRyX2NvbG9yX3NjYWxlyz/pmZmZmZmaq3JlbmRlcl9tb2RlCaRuYW1lp1syMzJdIDOlc2NhbGXKPwAAAKR0eXBlplNwcml0ZYSqbW9kZWxfbmFtZdk1bW9kZWxzL3Byb3BzL2dnX3RpYmV0L2NhbmRsZXN0aWNrd2lkZXNob3J0b25wbGF0ZS5tZGykbmFtZadbMjMzXSAxqHBvc2l0aW9uk9H9UNH+u+KkdHlwZaVNb2RlbISqbW9kZWxfbmFtZbZtb25hc3RlcnlfY2FuZGxlX2ZsYW1lpG5hbWWnWzIzM10gMqhwb3NpdGlvbpPR/VDR/rvspHR5cGWoUGFydGljbGWIpWNvbG9ylMz/zIIAzP+qbW9kZWxfbmFtZbhzcHJpdGVzL2xpZ2h0X2dsb3cwMi52bXSocG9zaXRpb26T0f1Q0f67569oZHJfY29sb3Jfc2NhbGXLP+mZmZmZmZqrcmVuZGVyX21vZGUJpG5hbWWnWzIzM10gM6VzY2FsZco/AAAApHR5cGWmU3ByaXRlhKptb2RlbF9uYW1l2TVtb2RlbHMvcHJvcHMvZ2dfdGliZXQvY2FuZGxlc3RpY2t3aWRlc2hvcnRvbnBsYXRlLm1kbKRuYW1lp1syMzRdIDGocG9zaXRpb26T0f1T0f7s4qR0eXBlpU1vZGVshKptb2RlbF9uYW1ltm1vbmFzdGVyeV9jYW5kbGVfZmxhbWWkbmFtZadbMjM0XSAyqHBvc2l0aW9uk9H9U9H+7OykdHlwZahQYXJ0aWNsZYilY29sb3KUzP/MggDM/6ptb2RlbF9uYW1luHNwcml0ZXMvbGlnaHRfZ2xvdzAyLnZtdKhwb3NpdGlvbpPR/VPR/uznr2hkcl9jb2xvcl9zY2FsZcs/6ZmZmZmZmqtyZW5kZXJfbW9kZQmkbmFtZadbMjM0XSAzpXNjYWxlyj8AAACkdHlwZaZTcHJpdGWKqm1vZGVsX25hbWW4c3ByaXRlcy9saWdodF9nbG93MDMudm10qHBvc2l0aW9u2Thtb2RlbHMvcHJvcHMvZGVfaW5mZXJuby9ocl9pL29ybmF0ZV9sYW1wL29ybmF0ZV9sYW1wLm1kbKtyZW5kZXJfbW9kZQmvaGRyX2NvbG9yX3NjYWxlyz/szMzMzMzNpXNjYWxlyz/pmZmZmZmarWFuZ2xlc19vZmZzZXQKsWN1c3RvbV95YXdfb2Zmc2V0WqRuYW1lpGdsb3elY29sb3KUzP/M4czSzP+kdHlwZaZTcHJpdGU="
	}

	for iter_1_8, iter_1_9 in slot_1_13_0(slot_1_58_5) do
		slot_1_64_10 = slot_1_56_3[iter_1_8]

		if slot_1_64_10 == nil then
			slot_1_64_10 = {}
			slot_1_56_3[iter_1_8] = slot_1_64_10
		end

		slot_1_65_9 = slot_1_31_0.decode(iter_1_9)
		slot_1_65_8 = msgpack.unpack(slot_1_65_9)
		slot_1_66_7 = slot_1_64_10[slot_1_57_6]
		slot_1_67_9 = true

		if slot_1_66_7 ~= nil then
			slot_1_67_9 = slot_1_66_7.enabled
		end

		slot_1_64_10[slot_1_57_6] = {
			name = "Default",
			points = slot_1_65_8,
			enabled = slot_1_67_9
		}
	end

	slot_1_57_5 = nil
	slot_1_58_4 = nil
	slot_1_59_6 = nil
	slot_1_60_5 = false
	slot_1_61_8 = nil

	function slot_1_61_7()
		if slot_1_55_0 == nil then
			return {}
		end

		local var_40_0 = slot_1_56_3[slot_1_55_0]

		if var_40_0 == nil then
			return {}
		end

		local var_40_1 = {}

		for iter_40_0, iter_40_1 in slot_1_14_0(var_40_0) do
			local var_40_2 = iter_40_1.enabled

			if var_40_2 == nil then
				var_40_2 = true
			end

			if var_40_2 then
				local var_40_3 = iter_40_1.points

				for iter_40_2, iter_40_3 in slot_1_14_0(var_40_3) do
					if iter_40_0 == slot_1_58_4 then
						if iter_40_2 ~= slot_1_59_6 then
							var_40_1[#var_40_1 + 1] = iter_40_3
						end
					else
						var_40_1[#var_40_1 + 1] = iter_40_3
					end
				end
			end
		end

		return var_40_1
	end

	slot_1_62_8 = nil

	function slot_1_63_9(arg_41_0)
		local var_41_0 = {}
		local var_41_1 = {}

		for iter_41_0, iter_41_1 in slot_1_14_0(arg_41_0) do
			local var_41_2 = iter_41_1.position

			if slot_1_15_0(var_41_2) == "string" then
				local var_41_3 = var_41_0[var_41_2]

				if var_41_3 == nil then
					var_41_3 = {}
					var_41_0[var_41_2] = var_41_3
				end

				var_41_3[#var_41_3 + 1] = iter_41_1
			else
				var_41_1[#var_41_1 + 1] = iter_41_1
			end
		end

		return var_41_0, var_41_1
	end

	function slot_1_62_7()
		slot_1_48_0()
		slot_1_52_0()

		slot_42_0_0 = slot_1_61_7()

		if slot_1_57_5 ~= nil then
			slot_42_0_0[#slot_42_0_0 + 1] = slot_1_57_5
		end

		slot_42_1_0, slot_42_2_0 = slot_1_63_9(slot_42_0_0)

		for iter_42_0, iter_42_1 in slot_1_14_0(slot_1_54_0) do
			slot_42_9_1 = slot_42_1_0[iter_42_1.model_name]

			if slot_42_9_1 ~= nil then
				slot_42_10_2 = iter_42_1.position
				slot_42_11_1 = iter_42_1.angles

				for iter_42_2, iter_42_3 in slot_1_14_0(slot_42_9_1) do
					slot_42_17_1 = iter_42_3.type
					slot_42_18_0 = iter_42_3.model_name
					slot_42_19_0 = slot_42_10_2
					slot_42_20_0 = iter_42_3.angles_offset

					if slot_42_20_0 ~= nil then
						slot_42_21_1 = iter_42_3.custom_yaw_offset or 0
						slot_42_22_3 = math.rad(math.abs(slot_42_11_1.y + slot_42_21_1))
						slot_42_23_3 = math.cos(slot_42_22_3)
						slot_42_24_2 = math.sin(slot_42_22_3)
						slot_42_19_0 = slot_42_19_0 + vector(slot_42_23_3 * slot_42_20_0, slot_42_24_2 * slot_42_20_0, 0)
					end

					slot_42_21_0 = iter_42_3.position_z_offset

					if slot_42_21_0 ~= nil then
						slot_42_19_0 = slot_42_19_0 + vector(0, 0, slot_42_21_0)
					end

					if slot_42_17_1 == "Particle" then
						slot_1_47_0(slot_42_18_0, slot_42_19_0)
					end

					if slot_42_17_1 == "Model" then
						slot_42_22_2 = iter_42_3.scale
						slot_42_23_2 = {
							position = slot_42_19_0,
							model_name = slot_42_18_0,
							model_scale = slot_42_22_2
						}

						if iter_42_3.set_angles then
							slot_42_25_2 = iter_42_3.set_angles_x_offset or 0
							slot_42_26_2 = iter_42_3.set_angles_y_offset or 0
							slot_42_27_0 = iter_42_3.set_angles_z_offset or 0
							slot_42_11_1 = slot_42_11_1 + vector(slot_42_25_2, slot_42_26_2, slot_42_27_0)
							slot_42_23_2.abs_angles = slot_42_11_1
						end

						slot_42_23_2.color = iter_42_3.color

						slot_1_49_0(slot_42_23_2)
					end

					if slot_42_17_1 == "Sprite" then
						slot_42_22_1 = iter_42_3.scale
						slot_42_23_1 = iter_42_3.hdr_color_scale
						slot_42_24_1 = iter_42_3.render_mode
						slot_42_25_1 = iter_42_3.color
						slot_42_26_1 = {
							GlowProxySize = 10,
							framerate = 10,
							position = slot_42_19_0,
							model = slot_42_18_0,
							scale = slot_42_22_1,
							HDRColorScale = slot_42_23_1,
							rendermode = slot_42_24_1,
							rendercolor = slot_1_7_0("%s %s %s %s", slot_42_25_1[1], slot_42_25_1[2], slot_42_25_1[3], slot_42_25_1[4])
						}

						slot_1_50_0(slot_42_26_1)
					end

					if slot_42_17_1 == "Beam" then
						slot_42_22_0 = iter_42_3.end_position_offset
						slot_42_23_0 = iter_42_3.start_width
						slot_42_24_0 = iter_42_3.end_width
						slot_42_25_0 = iter_42_3.color
						slot_42_26_0 = {
							segments = 2,
							life = 0,
							model_index = -1,
							start_position = slot_42_19_0,
							end_position = slot_42_19_0 + vector(0, 0, slot_42_22_0),
							model_name = slot_42_18_0,
							start_width = slot_42_23_0,
							end_width = slot_42_24_0,
							red = slot_42_25_0[1],
							green = slot_42_25_0[2],
							blue = slot_42_25_0[3],
							brightness = slot_42_25_0[4],
							flags = bit.bor(128, 256, 512)
						}

						slot_1_51_0(slot_42_26_0)
					end
				end
			end
		end

		for iter_42_4, iter_42_5 in slot_1_14_0(slot_42_2_0) do
			slot_42_8_0 = iter_42_5.type
			slot_42_9_0 = iter_42_5.model_name
			slot_42_10_1 = iter_42_5.position
			slot_42_10_0 = vector(slot_42_10_1[1], slot_42_10_1[2], slot_42_10_1[3])
			slot_42_11_0 = iter_42_5.position_z_offset

			if slot_42_11_0 ~= nil then
				slot_42_10_0 = slot_42_10_0 + vector(0, 0, slot_42_11_0)
			end

			if slot_42_8_0 == "Particle" then
				slot_1_47_0(slot_42_9_0, slot_42_10_0)
			end

			if slot_42_8_0 == "Model" then
				slot_42_12_2 = iter_42_5.scale
				slot_42_13_2 = {
					position = slot_42_10_0,
					model_name = slot_42_9_0,
					model_scale = slot_42_12_2
				}

				if iter_42_5.set_angles then
					slot_42_15_2 = iter_42_5.set_angles_x_offset or 0
					slot_42_16_2 = iter_42_5.set_angles_y_offset or 0
					slot_42_17_0 = iter_42_5.set_angles_z_offset or 0
					slot_42_13_2.abs_angles = vector(slot_42_15_2, slot_42_16_2, slot_42_17_0)
				end

				slot_42_13_2.color = iter_42_5.color

				slot_1_49_0(slot_42_13_2)
			end

			if slot_42_8_0 == "Sprite" then
				slot_42_12_1 = iter_42_5.scale
				slot_42_13_1 = iter_42_5.hdr_color_scale
				slot_42_14_1 = iter_42_5.render_mode
				slot_42_15_1 = iter_42_5.color
				slot_42_16_1 = {
					GlowProxySize = 10,
					framerate = 10,
					position = slot_42_10_0,
					model = slot_42_9_0,
					scale = slot_42_12_1,
					HDRColorScale = slot_42_13_1,
					rendermode = slot_42_14_1,
					rendercolor = slot_1_7_0("%s %s %s %s", slot_42_15_1[1], slot_42_15_1[2], slot_42_15_1[3], slot_42_15_1[4])
				}

				slot_1_50_0(slot_42_16_1)
			end

			if slot_42_8_0 == "Beam" then
				slot_42_12_0 = iter_42_5.end_position_offset
				slot_42_13_0 = iter_42_5.start_width
				slot_42_14_0 = iter_42_5.end_width
				slot_42_15_0 = iter_42_5.color
				slot_42_16_0 = {
					segments = 2,
					life = 0,
					model_index = -1,
					start_position = slot_42_10_0,
					end_position = slot_42_10_0 + vector(0, 0, slot_42_12_0),
					model_name = slot_42_9_0,
					start_width = slot_42_13_0,
					end_width = slot_42_14_0,
					red = slot_42_15_0[1],
					green = slot_42_15_0[2],
					blue = slot_42_15_0[3],
					brightness = slot_42_15_0[4],
					flags = bit.bor(128, 256, 512)
				}

				slot_1_51_0(slot_42_16_0)
			end
		end
	end

	slot_1_62_7()
	events.round_start(slot_1_62_7)
	events.level_init(slot_1_62_7)

	slot_1_63_8 = nil
	slot_1_64_9 = "\a{Link Active}\aDEFAULT   "
	slot_1_65_7 = "\a{Link Active}\aDEFAULT   "

	function slot_1_63_7(arg_43_0)
		local var_43_0 = {}

		for iter_43_0, iter_43_1 in slot_1_14_0(arg_43_0) do
			local var_43_1 = iter_43_1.enabled

			if var_43_1 == nil then
				var_43_1 = true
			end

			var_43_0[#var_43_0 + 1] = (var_43_1 and slot_1_64_9 or slot_1_65_7) .. iter_43_1.name
		end

		var_43_0[#var_43_0 + 1] = "+ Create New"

		slot_1_44_0.presets:update(var_43_0)
		slot_1_27_0(0.01, slot_1_44_0.presets.set, slot_1_44_0.presets, 1)
	end

	slot_1_64_8 = nil

	function slot_1_64_7()
		if slot_1_55_0 == nil then
			return
		end

		local var_44_0 = slot_1_56_3[slot_1_55_0]

		if var_44_0 == nil then
			var_44_0 = {
				{
					name = "Default ~ Soon",
					enabled = true,
					points = {}
				}
			}
			slot_1_56_3[slot_1_55_0] = var_44_0
		end

		slot_1_63_7(var_44_0)
		slot_1_44_0.current_map_name:name("Settings for: " .. slot_1_55_0)
	end

	slot_1_64_7()
	slot_1_46_0(slot_1_64_7)
	events.level_init(slot_1_64_7)
	slot_1_44_0.enabled:set_callback(function(arg_45_0)
		if slot_1_55_0 == nil then
			return
		end

		local var_45_0 = slot_1_44_0.presets:get()
		local var_45_1 = slot_1_56_3[slot_1_55_0][var_45_0]
		local var_45_2 = arg_45_0:get()

		if var_45_1.enabled == var_45_2 then
			return
		end

		var_45_1.enabled = var_45_2

		slot_1_64_7()
		slot_1_62_7()
	end)
	slot_1_44_0.presets:set_callback(function(arg_46_0)
		if slot_1_55_0 == nil then
			return
		end

		local var_46_0 = slot_1_56_3[slot_1_55_0][arg_46_0:get()]

		if var_46_0 == nil then
			return
		end

		local var_46_1 = var_46_0.enabled

		slot_1_44_0.enabled:set(var_46_1)
	end, true)
	slot_1_44_0.create:set_callback(function()
		if slot_1_55_0 == nil then
			return
		end

		local var_47_0 = slot_1_56_3[slot_1_55_0]

		if var_47_0 == nil then
			var_47_0 = {}
			slot_1_56_3[slot_1_55_0] = var_47_0
		end

		local var_47_1 = slot_1_44_0.name:get()

		var_47_0[#var_47_0 + 1] = {
			enabled = true,
			name = var_47_1,
			points = {}
		}

		slot_1_63_7(var_47_0)
	end)
	slot_1_44_0.delete:set_callback(function()
		if slot_1_55_0 == nil then
			return
		end

		local var_48_0 = slot_1_44_0.presets:get()
		local var_48_1 = slot_1_56_3[slot_1_55_0]

		slot_1_19_0(var_48_1, var_48_0)
		slot_1_64_7(var_48_1)
	end)

	slot_1_65_6 = nil

	function slot_1_65_5()
		if slot_1_58_4 == nil then
			return
		end

		if slot_1_55_0 == nil then
			return
		end

		local var_49_0 = slot_1_56_3[slot_1_55_0][slot_1_58_4].points
		local var_49_1 = {}

		for iter_49_0, iter_49_1 in slot_1_14_0(var_49_0) do
			var_49_1[#var_49_1 + 1] = iter_49_1.name
		end

		var_49_1[#var_49_1 + 1] = "+ Create New"

		slot_1_44_0.points_list:update(var_49_1)
		slot_1_44_0.points_list:set(slot_1_59_6 or 1)
	end

	slot_1_44_0.points_list:set_callback(function(arg_50_0)
		slot_1_59_6 = arg_50_0:get()
	end)
	slot_1_44_0.edit:set_callback(function()
		slot_1_58_4 = slot_1_44_0.presets:get()

		slot_1_65_5()
	end)
	slot_1_44_0.back:set_callback(function()
		slot_1_58_4 = nil
		slot_1_57_5 = nil
		slot_1_60_5 = false

		slot_1_62_7()
	end)
	slot_1_46_0(function()
		slot_1_44_0.back:set(1)
	end)

	slot_1_66_6 = nil
	slot_1_66_5 = {}

	function slot_1_67_8(arg_54_0, arg_54_1)
		return arg_54_0.distance < arg_54_1.distance
	end

	events.createmove(function()
		slot_1_66_5 = {
			{}
		}

		if ui.get_alpha() == 0 then
			return
		end

		if not slot_1_44_0.is_editing then
			return
		end

		local var_55_0 = slot_1_22_0()

		if var_55_0 == nil or not var_55_0:is_alive() then
			return
		end

		local var_55_1 = var_55_0:get_eye_position()
		local var_55_2 = slot_1_23_0()
		local var_55_3 = var_55_1 + vector():angles(var_55_2) * 4096
		local var_55_4 = slot_1_26_0(var_55_1, var_55_3, nil, 4294967295).end_pos
		local var_55_5 = {
			"By Crosshair"
		}

		for iter_55_0, iter_55_1 in slot_1_14_0(slot_1_54_0) do
			local var_55_6 = iter_55_1.position

			iter_55_1.distance = var_55_4:dist(var_55_6)
		end

		slot_1_20_0(slot_1_54_0, slot_1_67_8)

		local var_55_7 = {}

		for iter_55_2, iter_55_3 in slot_1_14_0(slot_1_54_0) do
			local var_55_8 = iter_55_3.model_name

			if var_55_7[var_55_8] == nil then
				var_55_7[var_55_8] = true

				local var_55_9 = slot_1_9_0(var_55_8, "([^/]+)%.mdl$")

				var_55_5[#var_55_5 + 1] = var_55_9
				slot_1_66_5[#slot_1_66_5 + 1] = iter_55_3
			end
		end

		slot_1_44_0.static_props:update(var_55_5)
	end)

	slot_1_67_7 = nil
	slot_1_68_8 = {
		["World Glow"] = 9,
		["Alpha Additive"] = 8,
		["Additive With Frame Blending"] = 7,
		["Additive Glow"] = 5,
		["Alpha Based Transparency"] = 4,
		["Glow Ignore Z"] = 3,
		["Transparent Texture Blend"] = 2,
		["Transparent Color Blend"] = 1,
		Normal = 0
	}

	function slot_1_67_6(arg_56_0)
		slot_1_60_5 = false

		if slot_1_57_5 == nil then
			return
		end

		local var_56_0 = slot_1_44_0.point_name:get()

		slot_1_57_5.name = var_56_0

		if slot_1_44_0.is_point_custom_position then
			local var_56_1 = slot_1_57_5.position

			var_56_1[1] = slot_1_44_0.point_position_x:get()
			var_56_1[2] = slot_1_44_0.point_position_y:get()
			var_56_1[3] = slot_1_44_0.point_position_z:get()
		end

		local var_56_2 = slot_1_44_0.point_type:get()

		slot_1_57_5.type = var_56_2
		model_name = slot_1_44_0.point_model:get()
		slot_1_57_5.model_name = model_name

		local var_56_3 = slot_1_44_0.point_angles_offset:get()

		if var_56_3 ~= 0 then
			slot_1_57_5.angles_offset = var_56_3

			local var_56_4 = slot_1_44_0.point_custom_yaw_offset:get()

			slot_1_57_5.custom_yaw_offset = var_56_4
		else
			slot_1_57_5.angles_offset = nil
			slot_1_57_5.custom_yaw_offset = nil
		end

		local var_56_5 = slot_1_44_0.point_position_z_offset:get()

		if var_56_5 ~= 0 then
			slot_1_57_5.position_z_offset = var_56_5
		else
			slot_1_57_5.position_z_offset = nil
		end

		slot_1_57_5.scale = slot_1_44_0.point_scale:get() * 0.01

		if slot_1_44_0.point_set_angles:get() then
			slot_1_57_5.set_angles = true
			slot_1_57_5.set_angles_x_offset = slot_1_44_0.point_set_angles_x_offset:get()
			slot_1_57_5.set_angles_y_offset = slot_1_44_0.point_set_angles_y_offset:get()
			slot_1_57_5.set_angles_z_offset = slot_1_44_0.point_set_angles_z_offset:get()
		else
			slot_1_57_5.set_angles = nil
			slot_1_57_5.set_angles_x_offset = nil
			slot_1_57_5.set_angles_y_offset = nil
			slot_1_57_5.set_angles_z_offset = nil
		end

		local var_56_6 = slot_1_44_0.point_color:get()

		slot_1_57_5.color = {
			var_56_6.r,
			var_56_6.g,
			var_56_6.b,
			var_56_6.a
		}
		slot_1_57_5.hdr_color_scale = slot_1_44_0.point_hdr_color_scale:get() * 0.1

		local var_56_7 = slot_1_44_0.point_render_mode:get()

		slot_1_57_5.render_mode = slot_1_68_8[var_56_7]
		slot_1_57_5.end_position_offset = slot_1_44_0.point_end_position_offset:get()
		slot_1_57_5.start_width = slot_1_44_0.point_start_width:get()
		slot_1_57_5.end_width = slot_1_44_0.point_end_width:get()

		if arg_56_0 == nil or arg_56_0:name() ~= "Name" then
			slot_1_62_7()
		end
	end

	slot_1_44_0.point_name:set_callback(slot_1_67_6)
	slot_1_44_0.point_position_x:set_callback(slot_1_67_6)
	slot_1_44_0.point_position_y:set_callback(slot_1_67_6)
	slot_1_44_0.point_position_z:set_callback(slot_1_67_6)
	slot_1_44_0.point_type:set_callback(slot_1_67_6)
	slot_1_44_0.point_model:set_callback(slot_1_67_6)
	slot_1_44_0.point_angles_offset:set_callback(slot_1_67_6)
	slot_1_44_0.point_custom_yaw_offset:set_callback(slot_1_67_6)
	slot_1_44_0.point_position_z_offset:set_callback(slot_1_67_6)
	slot_1_44_0.point_scale:set_callback(slot_1_67_6)
	slot_1_44_0.point_set_angles:set_callback(slot_1_67_6)
	slot_1_44_0.point_set_angles_x_offset:set_callback(slot_1_67_6)
	slot_1_44_0.point_set_angles_y_offset:set_callback(slot_1_67_6)
	slot_1_44_0.point_set_angles_z_offset:set_callback(slot_1_67_6)
	slot_1_44_0.point_color:set_callback(slot_1_67_6)
	slot_1_44_0.point_hdr_color_scale:set_callback(slot_1_67_6)
	slot_1_44_0.point_render_mode:set_callback(slot_1_67_6)
	slot_1_44_0.point_end_position_offset:set_callback(slot_1_67_6)
	slot_1_44_0.point_start_width:set_callback(slot_1_67_6)
	slot_1_44_0.point_end_width:set_callback(slot_1_67_6)

	slot_1_68_7 = {
		[0] = "Normal",
		"Transparent Color Blend",
		"Transparent Texture Blend",
		"Glow Ignore Z",
		"Alpha Based Transparency",
		"Additive Glow",
		nil,
		"Additive With Frame Blending",
		"Alpha Additive",
		"World Glow"
	}

	slot_1_44_0.points_list:set_callback(function(arg_57_0)
		if slot_1_58_4 == nil then
			return
		end

		if slot_1_55_0 == nil then
			return
		end

		local var_57_0 = slot_1_56_3[slot_1_55_0][slot_1_58_4].points
		local var_57_1 = #arg_57_0:list()
		local var_57_2 = arg_57_0:get()

		slot_1_60_5 = var_57_2 == var_57_1

		local var_57_3 = var_57_0[var_57_2]

		if var_57_3 == nil then
			return
		end

		slot_1_57_5 = slot_1_53_0(var_57_3)

		slot_1_44_0.point_name:set(slot_1_57_5.name)

		local var_57_4 = slot_1_57_5.position

		if slot_1_15_0(var_57_4) ~= "string" then
			slot_1_44_0.point_position_x:set(var_57_4[1])
			slot_1_44_0.point_position_y:set(var_57_4[2])
			slot_1_44_0.point_position_z:set(var_57_4[3])
			slot_1_44_0.position_label:name("Position: Custom")

			slot_1_44_0.is_point_custom_position = true
		else
			slot_1_44_0.point_position_x:reset()
			slot_1_44_0.point_position_y:reset()
			slot_1_44_0.point_position_z:reset()

			local var_57_5 = slot_1_57_5.position
			local var_57_6 = slot_1_9_0(var_57_5, "([^/]+)%.mdl$")

			slot_1_44_0.position_label:name("Position: " .. var_57_6)

			slot_1_44_0.is_point_custom_position = false
		end

		slot_1_44_0.point_type:set(slot_1_57_5.type)
		slot_1_27_0(0.01, slot_1_44_0.point_model.set, slot_1_44_0.point_model, slot_1_57_5.model_name)
		slot_1_44_0.point_angles_offset:set(slot_1_57_5.angles_offset or 0)
		slot_1_44_0.point_custom_yaw_offset:set(slot_1_57_5.custom_yaw_offset or 0)
		slot_1_44_0.point_position_z_offset:set(slot_1_57_5.position_z_offset or 0)
		slot_1_44_0.point_scale:set(slot_1_57_5.scale * 100)
		slot_1_44_0.point_set_angles:set(slot_1_57_5.set_angles or false)
		slot_1_44_0.point_set_angles_x_offset:set(slot_1_57_5.set_angles_x_offset or 0)
		slot_1_44_0.point_set_angles_y_offset:set(slot_1_57_5.set_angles_y_offset or 0)
		slot_1_44_0.point_set_angles_z_offset:set(slot_1_57_5.set_angles_z_offset or 0)
		slot_1_44_0.point_color:set(color(unpack(slot_1_57_5.color)))
		slot_1_44_0.point_hdr_color_scale:set(slot_1_57_5.hdr_color_scale * 10)
		slot_1_44_0.point_render_mode:set(slot_1_68_7[slot_1_57_5.render_mode])
		slot_1_44_0.point_end_position_offset:set(slot_1_57_5.end_position_offset)
		slot_1_44_0.point_start_width:set(slot_1_57_5.start_width)
		slot_1_44_0.point_end_width:set(slot_1_57_5.end_width)
	end)
	slot_1_44_0.set_position:set_callback(function()
		slot_1_57_5 = {}

		local var_58_0 = slot_1_44_0.static_props:get()

		if var_58_0 == 1 then
			local var_58_1 = slot_1_22_0()

			if var_58_1 == nil or not var_58_1:is_alive() then
				slot_1_57_5 = nil

				return
			end

			local var_58_2 = var_58_1:get_eye_position()
			local var_58_3 = slot_1_23_0()
			local var_58_4 = var_58_2 + vector():angles(var_58_3) * 4096
			local var_58_5 = slot_1_26_0(var_58_2, var_58_4, nil, 4294967295).end_pos

			slot_1_60_5 = false
			slot_1_57_5.position = {
				var_58_5.x,
				var_58_5.y,
				var_58_5.z
			}

			slot_1_44_0.position_label:name("Position: Custom")
			slot_1_44_0.point_position_x:set(var_58_5.x)
			slot_1_44_0.point_position_y:set(var_58_5.y)
			slot_1_44_0.point_position_z:set(var_58_5.z)

			slot_1_44_0.is_point_custom_position = true
		else
			local var_58_6 = slot_1_66_5[var_58_0]

			if var_58_6 == nil then
				slot_1_57_5 = nil

				return
			end

			local var_58_7 = var_58_6.model_name

			slot_1_60_5 = false
			slot_1_57_5.position = var_58_7

			local var_58_8 = slot_1_9_0(var_58_7, "([^/]+)%.mdl$")

			slot_1_44_0.position_label:name("Position: " .. var_58_8)
			slot_1_44_0.point_position_x:reset()
			slot_1_44_0.point_position_y:reset()
			slot_1_44_0.point_position_z:reset()

			slot_1_44_0.is_point_custom_position = false
		end

		slot_1_44_0.point_name:reset()
		slot_1_44_0.point_type:reset()
		slot_1_44_0.point_model:reset()
		slot_1_44_0.point_angles_offset:reset()
		slot_1_44_0.point_custom_yaw_offset:reset()
		slot_1_44_0.point_position_z_offset:reset()
		slot_1_44_0.point_scale:reset()
		slot_1_44_0.point_set_angles:reset()
		slot_1_44_0.point_set_angles_x_offset:reset()
		slot_1_44_0.point_set_angles_y_offset:reset()
		slot_1_44_0.point_set_angles_z_offset:reset()
		slot_1_44_0.point_color:reset()
		slot_1_44_0.point_hdr_color_scale:reset()
		slot_1_44_0.point_render_mode:reset()
		slot_1_44_0.point_end_position_offset:reset()
		slot_1_44_0.point_start_width:reset()
		slot_1_44_0.point_end_width:reset()
		slot_1_67_6()
	end)
	slot_1_44_0.point_save:set_callback(function()
		if slot_1_58_4 == nil or slot_1_59_6 == nil then
			return
		end

		if slot_1_55_0 == nil then
			return
		end

		slot_1_56_3[slot_1_55_0][slot_1_58_4].points[slot_1_59_6] = slot_1_53_0(slot_1_57_5)

		slot_1_65_5()

		db["World Editor"] = slot_1_56_3
	end)
	slot_1_44_0.point_delete:set_callback(function()
		if slot_1_58_4 == nil or slot_1_59_6 == nil then
			return
		end

		if slot_1_55_0 == nil then
			return
		end

		local var_60_0 = slot_1_56_3[slot_1_55_0][slot_1_58_4].points

		slot_1_19_0(var_60_0, slot_1_59_6)
		slot_1_65_5()

		db["World Editor"] = slot_1_56_3
	end)
	events.render(function()
		if not slot_1_60_5 then
			return
		end

		local var_61_0 = slot_1_44_0.static_props:get()
		local var_61_1 = slot_1_66_5[var_61_0]

		if var_61_1 == nil then
			return
		end

		local var_61_2 = var_61_1.model_name

		for iter_61_0, iter_61_1 in slot_1_14_0(slot_1_54_0) do
			if iter_61_1.model_name == var_61_2 then
				local var_61_3 = iter_61_1.position
				local var_61_4 = slot_1_24_0(var_61_3)

				if var_61_4 ~= nil then
					slot_1_25_0(var_61_4, color(255, 255, 255, 255), 5, 0, 1)
				end
			end
		end
	end)
	events.shutdown(function()
		db["World Editor"] = slot_1_56_3
	end)

	slot_1_56_2 = db["World Editor::Ambients"] or {}
	slot_1_57_4 = {
		de_mirage = "3gARq2ZvZ19jaGFuZ2VyqE92ZXJyaWRlsWZvZ19jaGFuZ2VyX2NvbG9ylFBQWmSxZm9nX2NoYW5nZXJfc3RhcnQCtGZvZ19jaGFuZ2VyX2Rpc3RhbmNlI7Vmb2dfY2hhbmdlcl9vbl9za3lib3jCrGlsbHVtaW5hdGlvbqhTdW5saWdodLJpbGx1bWluYXRpb25fcGl0Y2gZsGlsbHVtaW5hdGlvbl95YXfQybVpbGx1bWluYXRpb25fZGlzdGFuY2XNBdyyaWxsdW1pbmF0aW9uX2NvbG9ylFU4JMz/sG5pZ2h0X21vZGVfY29sb3KUBgcNzP+ybmlnaHRfbW9kZV9lbmFibGVkw7JzdGF0aWNfcHJvcHNfY29sb3KUUFFXzP+0c3RhdGljX3Byb3BzX2VuYWJsZWTDtXBvc3RfcHJvY2Vzc2luZ19jb2xvcpQCAgLM/7dwb3N0X3Byb2Nlc3NpbmdfZW5hYmxlZMO6aWxsdW1pbmF0aW9uX2NvbG9yX2VuYWJsZWTC",
		de_cbble = "3gARq2ZvZ19jaGFuZ2VyqE92ZXJyaWRlsWZvZ19jaGFuZ2VyX2NvbG9ylFBQWkGxZm9nX2NoYW5nZXJfc3RhcnT7tGZvZ19jaGFuZ2VyX2Rpc3RhbmNlI7Vmb2dfY2hhbmdlcl9vbl9za3lib3jCrGlsbHVtaW5hdGlvbqhTdW5saWdodLJpbGx1bWluYXRpb25fcGl0Y2gAsGlsbHVtaW5hdGlvbl95YXfMs7VpbGx1bWluYXRpb25fZGlzdGFuY2XNBdyyaWxsdW1pbmF0aW9uX2NvbG9ylFU4JMz/sG5pZ2h0X21vZGVfY29sb3KUISEkzP+ybmlnaHRfbW9kZV9lbmFibGVkw7JzdGF0aWNfcHJvcHNfY29sb3KUUVRbzP+0c3RhdGljX3Byb3BzX2VuYWJsZWTDtXBvc3RfcHJvY2Vzc2luZ19jb2xvcpTM/8z/zP/M/7dwb3N0X3Byb2Nlc3NpbmdfZW5hYmxlZMK6aWxsdW1pbmF0aW9uX2NvbG9yX2VuYWJsZWTC"
	}

	for iter_1_10, iter_1_11 in slot_1_13_0(slot_1_57_4) do
		if slot_1_56_2[iter_1_10] == nil then
			iter_1_11 = slot_1_31_0.decode(iter_1_11)
			iter_1_11 = msgpack.unpack(iter_1_11)
			slot_1_56_2[iter_1_10] = iter_1_11
		end
	end

	slot_1_57_3 = {
		ui.find("Visuals", "World", "Ambient", "Night Mode")
	}
	slot_1_58_3 = {
		ui.find("Visuals", "World", "Ambient", "Static Props")
	}
	slot_1_59_5 = {
		ui.find("Visuals", "World", "Ambient", "Post Processing")
	}
	slot_1_60_4 = ui.find("Visuals", "World", "Ambient", "Fog Changer")
	slot_1_61_5 = ui.find("Visuals", "World", "Ambient", "Fog Changer", "Color")
	slot_1_62_5 = ui.find("Visuals", "World", "Ambient", "Fog Changer", "Start")
	slot_1_63_6 = ui.find("Visuals", "World", "Ambient", "Fog Changer", "Distance")
	slot_1_64_6 = ui.find("Visuals", "World", "Ambient", "Illumination")
	slot_1_65_4 = ui.find("Visuals", "World", "Ambient", "Illumination", "Pitch")
	slot_1_66_4 = ui.find("Visuals", "World", "Ambient", "Illumination", "Yaw")
	slot_1_67_5 = ui.find("Visuals", "World", "Ambient", "Illumination", "Distance")
	slot_1_68_6 = {
		ui.find("Visuals", "World", "Ambient", "Illumination", "Color")
	}

	function slot_1_69_6()
		slot_1_44_0.override_night_mode:reset()
		slot_1_44_0.override_night_mode_color:reset()
		slot_1_44_0.override_static_props:reset()
		slot_1_44_0.override_static_props_color:reset()
		slot_1_44_0.override_post_processing:reset()
		slot_1_44_0.override_post_processing_color:reset()
		slot_1_44_0.override_fog_changer:reset()
		slot_1_44_0.override_fog_changer_color:reset()
		slot_1_44_0.override_fog_changer_start:reset()
		slot_1_44_0.override_fog_changer_distance:reset()
		slot_1_44_0.override_illumination:reset()
		slot_1_44_0.override_illumination_pitch:reset()
		slot_1_44_0.override_illumination_yaw:reset()
		slot_1_44_0.override_illumination_distance:reset()
		slot_1_44_0.override_illumination_enabled_color:reset()
		slot_1_44_0.override_illumination_color:reset()
		slot_1_57_3[1]:override()
		slot_1_57_3[2]:override()
		slot_1_58_3[1]:override()
		slot_1_58_3[2]:override()
		slot_1_59_5[1]:override()
		slot_1_59_5[2]:override()
		slot_1_60_4:override()
		slot_1_61_5:override()
		slot_1_62_5:override()
		slot_1_63_6:override()
		slot_1_64_6:override()
		slot_1_65_4:override()
		slot_1_66_4:override()
		slot_1_67_5:override()
		slot_1_68_6[1]:override()
		slot_1_68_6[2]:override()
	end

	function slot_1_70_5()
		if slot_1_55_0 == nil then
			return slot_1_69_6()
		end

		local var_64_0 = slot_1_56_2[slot_1_55_0]

		if var_64_0 == nil then
			return slot_1_69_6()
		end

		local var_64_1 = slot_1_44_0.override_night_mode:get()
		local var_64_2 = slot_1_44_0.override_night_mode_color:get()

		var_64_0.night_mode_enabled = var_64_1
		var_64_0.night_mode_color = {
			var_64_2.r,
			var_64_2.g,
			var_64_2.b,
			var_64_2.a
		}

		slot_1_57_3[1]:override(var_64_1)
		slot_1_57_3[2]:override(var_64_2)

		local var_64_3 = slot_1_44_0.override_static_props:get()
		local var_64_4 = slot_1_44_0.override_static_props_color:get()

		var_64_0.static_props_enabled = var_64_3
		var_64_0.static_props_color = {
			var_64_4.r,
			var_64_4.g,
			var_64_4.b,
			var_64_4.a
		}

		slot_1_58_3[1]:override(var_64_3)
		slot_1_58_3[2]:override(var_64_4)

		local var_64_5 = slot_1_44_0.override_post_processing:get()
		local var_64_6 = slot_1_44_0.override_post_processing_color:get()

		var_64_0.post_processing_enabled = var_64_5
		var_64_0.post_processing_color = {
			var_64_6.r,
			var_64_6.g,
			var_64_6.b,
			var_64_6.a
		}

		slot_1_59_5[1]:override(var_64_5)
		slot_1_59_5[2]:override(var_64_6)

		local var_64_7 = slot_1_44_0.override_fog_changer:get()
		local var_64_8 = slot_1_44_0.override_fog_changer_color:get()
		local var_64_9 = slot_1_44_0.override_fog_changer_start:get()
		local var_64_10 = slot_1_44_0.override_fog_changer_distance:get()

		var_64_0.fog_changer = var_64_7
		var_64_0.fog_changer_color = {
			var_64_8.r,
			var_64_8.g,
			var_64_8.b,
			var_64_8.a
		}
		var_64_0.fog_changer_start = var_64_9
		var_64_0.fog_changer_distance = var_64_10

		slot_1_60_4:override(var_64_7)
		slot_1_61_5:override(var_64_8)
		slot_1_62_5:override(var_64_9)
		slot_1_63_6:override(var_64_10)

		local var_64_11 = slot_1_44_0.override_illumination:get()
		local var_64_12 = slot_1_44_0.override_illumination_pitch:get()
		local var_64_13 = slot_1_44_0.override_illumination_yaw:get()
		local var_64_14 = slot_1_44_0.override_illumination_distance:get()
		local var_64_15 = slot_1_44_0.override_illumination_enabled_color:get()
		local var_64_16 = slot_1_44_0.override_illumination_color:get()

		var_64_0.illumination = var_64_11
		var_64_0.illumination_pitch = var_64_12
		var_64_0.illumination_yaw = var_64_13
		var_64_0.illumination_distance = var_64_14
		var_64_0.illumination_color_enabled = var_64_15
		var_64_0.illumination_color = {
			var_64_16.r,
			var_64_16.g,
			var_64_16.b,
			var_64_16.a
		}

		slot_1_64_6:override(var_64_11)
		slot_1_65_4:override(var_64_12)
		slot_1_66_4:override(var_64_13)
		slot_1_67_5:override(var_64_14)
		slot_1_68_6[1]:override(var_64_15)
		slot_1_68_6[2]:override(var_64_16)
	end

	function slot_1_71_7()
		if slot_1_55_0 == nil then
			return slot_1_69_6()
		end

		slot_65_0_0 = slot_1_56_2[slot_1_55_0]

		if slot_65_0_0 == nil then
			slot_65_1_1 = slot_1_57_3[2]:get()
			slot_65_2_1 = slot_1_58_3[2]:get()
			slot_65_3_1 = slot_1_59_5[2]:get()
			slot_65_4_1 = slot_1_61_5:get()
			slot_65_5_1 = slot_1_68_6[2]:get()
			slot_65_0_0 = {
				night_mode_enabled = slot_1_57_3[1]:get(),
				night_mode_color = {
					slot_65_1_1.r,
					slot_65_1_1.g,
					slot_65_1_1.b,
					slot_65_1_1.a
				},
				static_props_enabled = slot_1_58_3[1]:get(),
				static_props_color = {
					slot_65_2_1.r,
					slot_65_2_1.g,
					slot_65_2_1.b,
					slot_65_2_1.a
				},
				post_processing_enabled = slot_1_59_5[1]:get(),
				post_processing_color = {
					slot_65_3_1.r,
					slot_65_3_1.g,
					slot_65_3_1.b,
					slot_65_3_1.a
				},
				fog_changer = slot_1_60_4:get(),
				fog_changer_color = {
					slot_65_4_1.r,
					slot_65_4_1.g,
					slot_65_4_1.b,
					slot_65_4_1.a
				},
				fog_changer_start = slot_1_62_5:get(),
				fog_changer_distance = slot_1_63_6:get(),
				illumination = slot_1_64_6:get(),
				illumination_pitch = slot_1_65_4:get(),
				illumination_yaw = slot_1_66_4:get(),
				illumination_distance = slot_1_67_5:get(),
				illumination_color_enabled = slot_1_68_6[1]:get(),
				illumination_color = {
					slot_65_5_1.r,
					slot_65_5_1.g,
					slot_65_5_1.b,
					slot_65_5_1.a
				}
			}
			slot_1_56_2[slot_1_55_0] = slot_65_0_0
		end

		slot_65_1_0 = slot_65_0_0.night_mode_color

		slot_1_44_0.override_night_mode:set(slot_65_0_0.night_mode_enabled)
		slot_1_44_0.override_night_mode_color:set(color(slot_65_1_0[1], slot_65_1_0[2], slot_65_1_0[3], slot_65_1_0[4]))

		slot_65_2_0 = slot_65_0_0.static_props_color

		slot_1_44_0.override_static_props:set(slot_65_0_0.static_props_enabled)
		slot_1_44_0.override_static_props_color:set(color(slot_65_2_0[1], slot_65_2_0[2], slot_65_2_0[3], slot_65_2_0[4]))

		slot_65_3_0 = slot_65_0_0.post_processing_color

		slot_1_44_0.override_post_processing:set(slot_65_0_0.post_processing_enabled)
		slot_1_44_0.override_post_processing_color:set(color(slot_65_3_0[1], slot_65_3_0[2], slot_65_3_0[3], slot_65_3_0[4]))

		slot_65_4_0 = slot_65_0_0.fog_changer_color

		slot_1_44_0.override_fog_changer:set(slot_65_0_0.fog_changer)
		slot_1_44_0.override_fog_changer_color:set(color(slot_65_4_0[1], slot_65_4_0[2], slot_65_4_0[3], slot_65_4_0[4]))
		slot_1_44_0.override_fog_changer_start:set(slot_65_0_0.fog_changer_start)
		slot_1_44_0.override_fog_changer_distance:set(slot_65_0_0.fog_changer_distance)

		slot_65_5_0 = slot_65_0_0.illumination_color

		slot_1_44_0.override_illumination:set(slot_65_0_0.illumination)
		slot_1_44_0.override_illumination_pitch:set(slot_65_0_0.illumination_pitch)
		slot_1_44_0.override_illumination_yaw:set(slot_65_0_0.illumination_yaw)
		slot_1_44_0.override_illumination_distance:set(slot_65_0_0.illumination_distance)
		slot_1_44_0.override_illumination_enabled_color:set(slot_65_0_0.illumination_color_enabled)
		slot_1_44_0.override_illumination_color:set(color(slot_65_5_0[1], slot_65_5_0[2], slot_65_5_0[3], slot_65_5_0[4]))
		slot_1_70_5()
	end

	slot_1_27_0(0.01, slot_1_71_7)
	events.level_init(slot_1_71_7)
	slot_1_46_0(slot_1_70_5)
	events.shutdown(slot_1_69_6)
	slot_1_44_0.override_night_mode:set_callback(slot_1_70_5)
	slot_1_44_0.override_night_mode_color:set_callback(slot_1_70_5)
	slot_1_44_0.override_static_props:set_callback(slot_1_70_5)
	slot_1_44_0.override_static_props_color:set_callback(slot_1_70_5)
	slot_1_44_0.override_post_processing:set_callback(slot_1_70_5)
	slot_1_44_0.override_post_processing_color:set_callback(slot_1_70_5)
	slot_1_44_0.override_fog_changer:set_callback(slot_1_70_5)
	slot_1_44_0.override_fog_changer_color:set_callback(slot_1_70_5)
	slot_1_44_0.override_fog_changer_start:set_callback(slot_1_70_5)
	slot_1_44_0.override_fog_changer_distance:set_callback(slot_1_70_5)
	slot_1_44_0.override_illumination:set_callback(slot_1_70_5)
	slot_1_44_0.override_illumination_pitch:set_callback(slot_1_70_5)
	slot_1_44_0.override_illumination_yaw:set_callback(slot_1_70_5)
	slot_1_44_0.override_illumination_distance:set_callback(slot_1_70_5)
	slot_1_44_0.override_illumination_enabled_color:set_callback(slot_1_70_5)
	slot_1_44_0.override_illumination_color:set_callback(slot_1_70_5)
	events.shutdown(function()
		db["World Editor::Ambients"] = slot_1_56_2
	end)

	slot_1_56_1 = db["World Editor::Weather"] or {}
	slot_1_57_2 = cvar.r_rainradius
	slot_1_58_2 = cvar.r_rainwidth
	slot_1_59_4 = cvar.r_RainParticleDensity
	slot_1_60_3 = 2048
	slot_1_61_4 = 138

	ffi.cdef("            typedef void*(* create_class_t)(int, int);\n        ")

	slot_1_62_4 = slot_1_3_0("            struct {\n                create_class_t create_class;\n                void* create_event;\n                char* network_name;\n                void* recv_table;\n                void* next;\n                int class_id;\n            }\n        ")
	slot_1_63_5 = utils.get_vfunc("client.dll", "VClient018", 8, slot_1_3_0("$*(__thiscall*)(void*)", slot_1_62_4))
	slot_1_64_5 = nil
	slot_1_65_3 = nil
	slot_1_66_3 = nil

	function slot_1_67_4()
		if slot_1_65_3 ~= nil or slot_1_66_3 ~= nil then
			return
		end

		if slot_1_64_5 == nil then
			local var_67_0 = slot_1_63_5()

			while var_67_0 ~= nil do
				if var_67_0.class_id == slot_1_61_4 then
					slot_1_64_5 = var_67_0

					break
				end

				var_67_0 = slot_1_0_0(slot_1_3_0("$*", slot_1_62_4), var_67_0.next)
			end
		end

		slot_1_65_3 = slot_1_64_5.create_class(slot_1_60_3 - 1, 0)
		slot_1_66_3 = slot_1_0_0("uintptr_t", slot_1_65_3) - 8
	end

	slot_1_68_5 = nil

	function slot_1_68_4()
		if slot_1_65_3 == nil or slot_1_66_3 == nil then
			return
		end

		local var_68_0 = slot_1_0_0("void***", slot_1_65_3)[0]

		slot_1_0_0("void(__thiscall*)(void*)", var_68_0[1])(slot_1_65_3)

		slot_1_65_3 = nil
		slot_1_66_3 = nil
	end

	events.shutdown(slot_1_68_4)
	slot_1_46_0(slot_1_68_4)

	slot_1_69_5 = {
		["Particle Snow"] = 7,
		["Particle Ash"] = 5,
		["Particle Rain"] = 6,
		["Rain 2"] = 1,
		Rain = 0
	}

	function slot_1_70_4()
		if slot_1_65_3 == nil or slot_1_66_3 == nil then
			return
		end

		local var_69_0 = slot_1_56_1[slot_1_55_0]

		if var_69_0 == nil then
			return
		end

		local var_69_1 = slot_1_69_5[var_69_0.type]

		if var_69_1 == nil then
			var_69_1 = 0
		end

		local var_69_2 = slot_1_21_0(0)
		local var_69_3 = var_69_2.m_WorldMins
		local var_69_4 = var_69_2.m_WorldMaxs
		local var_69_5 = slot_1_0_0("void***", slot_1_65_3)[0]
		local var_69_6 = slot_1_0_0("void(__thiscall*)(void*, int)", var_69_5[4])
		local var_69_7 = slot_1_0_0("void(__thiscall*)(void*, int)", var_69_5[5])
		local var_69_8 = slot_1_0_0("void(__thiscall*)(void*, int)", var_69_5[6])
		local var_69_9 = slot_1_0_0("void(__thiscall*)(void*, int)", var_69_5[7])

		var_69_8(slot_1_65_3, 0)
		var_69_6(slot_1_65_3, 0)

		slot_1_0_0("int*", slot_1_66_3 + 600)[0] = 1
		slot_1_0_0("int*", slot_1_66_3 + 2560)[0] = var_69_1

		local var_69_10 = slot_1_66_3 + 800

		slot_1_0_0(slot_1_3_0("$*", slot_1_38_0), var_69_10 + 8)[0] = slot_1_38_0(var_69_3.x, var_69_3.y, var_69_3.z)
		slot_1_0_0(slot_1_3_0("$*", slot_1_38_0), var_69_10 + 20)[0] = slot_1_38_0(var_69_4.x, var_69_4.y, var_69_4.z)

		var_69_7(slot_1_65_3, 0)
		var_69_9(slot_1_65_3, 0)
	end

	function slot_1_71_6()
		slot_1_44_0.weather_enabled:reset()
		slot_1_44_0.weather_type:reset()
		slot_1_44_0.weather_radius:reset()
		slot_1_44_0.weather_width:reset()
		slot_1_44_0.weather_density:reset()
	end

	function slot_1_72_6()
		if slot_1_55_0 == nil then
			return
		end

		local var_71_0 = slot_1_56_1[slot_1_55_0]

		if var_71_0 == nil then
			slot_1_71_6()

			var_71_0 = {
				enabled = slot_1_44_0.weather_enabled:get(),
				type = slot_1_44_0.weather_type:get(),
				radius = slot_1_44_0.weather_radius:get(),
				width = slot_1_44_0.weather_width:get(),
				density = slot_1_44_0.weather_density:get()
			}
			slot_1_56_1[slot_1_55_0] = var_71_0

			return
		end

		slot_1_44_0.weather_enabled:set(var_71_0.enabled)
		slot_1_44_0.weather_type:set(var_71_0.type)
		slot_1_57_2:int(var_71_0.radius)
		slot_1_58_2:float(var_71_0.width * 0.01)

		local var_71_1 = var_71_0.density

		if var_71_1 == nil then
			var_71_1 = slot_1_44_0.weather_density:get()
			var_71_0.density = var_71_1
		end

		slot_1_59_4:float(var_71_1 * 0.01)
	end

	function slot_1_73_3(arg_72_0)
		local var_72_0 = slot_1_56_1[slot_1_55_0]

		if var_72_0 == nil then
			return
		end

		local var_72_1 = slot_1_44_0.weather_enabled:get()

		var_72_0.enabled = var_72_1
		var_72_0.type = slot_1_44_0.weather_type:get()
		var_72_0.radius = slot_1_44_0.weather_radius:get()
		var_72_0.width = slot_1_44_0.weather_width:get()
		var_72_0.density = slot_1_44_0.weather_density:get()

		local var_72_2 = arg_72_0:name()
		local var_72_3 = var_72_2 == slot_1_44_0.weather_enabled:name() or var_72_2 == slot_1_44_0.weather_type:name()

		if var_72_1 then
			if var_72_3 then
				slot_1_68_4()
				slot_1_67_4()
				slot_1_70_4()
			end
		else
			slot_1_68_4()
		end

		slot_1_57_2:int(var_72_0.radius)
		slot_1_58_2:float(var_72_0.width * 0.01)
		slot_1_59_4:float(var_72_0.density * 0.01)
	end

	slot_1_44_0.weather_enabled:set_callback(slot_1_73_3)
	slot_1_44_0.weather_type:set_callback(slot_1_73_3)
	slot_1_44_0.weather_radius:set_callback(slot_1_73_3)
	slot_1_44_0.weather_width:set_callback(slot_1_73_3)
	slot_1_44_0.weather_density:set_callback(slot_1_73_3)
	slot_1_27_0(0.01, slot_1_72_6)
	events.level_init(slot_1_72_6)
	events.round_start(function()
		local var_73_0 = slot_1_56_1[slot_1_55_0]

		if var_73_0 == nil then
			return
		end

		if var_73_0.enabled then
			slot_1_67_4()
			slot_1_70_4()
		else
			slot_1_68_4()
		end
	end)

	slot_1_71_5 = utils.opcode_scan("client.dll", "55 8B EC 83 E4 F8 83 EC 54 53 8B D9")
	slot_1_72_5 = slot_1_0_0("int(__thiscall*)(void*, uintptr_t, void*)", slot_1_71_5)

	slot_1_32_0.hook_func(slot_1_72_5, function(arg_74_0, arg_74_1, arg_74_2, arg_74_3)
		local var_74_0 = slot_1_0_0("uint32_t*", arg_74_1)
		local var_74_1 = false

		if var_74_0[239] == 2047 then
			var_74_0[239] = -1
			var_74_1 = true
		end

		local var_74_2 = arg_74_0:get_original(arg_74_1, arg_74_2, arg_74_3)

		if var_74_1 then
			var_74_0[239] = 2047
		end

		return var_74_2
	end)

	slot_1_71_4 = utils.opcode_scan("client.dll", "55 8B EC 51 8B 0D ?? ?? ?? ?? 56 8B 75 08 6A")
	slot_1_72_4 = slot_1_0_0("bool(__thiscall*)(void*, int)", slot_1_71_4)

	slot_1_32_0.hook_func(slot_1_72_4, function(arg_75_0, arg_75_1, arg_75_2)
		local var_75_0 = arg_75_0:get_original(arg_75_1, arg_75_2)

		if var_75_0 and slot_1_55_0 == "de_vertigo" and slot_1_0_0("float*", arg_75_2 + 8)[0] < 11500 then
			return false
		end

		return var_75_0
	end)
	events.shutdown(function()
		db["World Editor::Weather"] = slot_1_56_1
	end)

	slot_1_56_0 = slot_1_44_0.textures
	slot_1_57_1 = nil
	slot_1_58_1 = nil
	slot_1_59_3 = utils.create_interface("materialsystem.dll", "VMaterialSystem080")
	slot_1_59_2 = ffi.cast("void*", slot_1_59_3)
	slot_1_60_2 = ffi.cast("void***", slot_1_59_2)[0]
	slot_1_61_3 = nil
	slot_1_62_3 = nil
	slot_1_63_4 = ffi.C.GetProcAddress(ffi.C.GetModuleHandleA("vstdlib.dll"), "KeyValuesSystem")
	slot_1_64_4 = ffi.cast("void*(__thiscall*)()", slot_1_63_4)()
	slot_1_65_2 = ffi.cast("void***", slot_1_64_4)[0]
	slot_1_66_2 = ffi.cast("void*(__thiscall*)(void*, size_t)", slot_1_65_2[2])
	slot_1_67_3 = ffi.cast("void(__thiscall*)(void*, void*)", slot_1_65_2[3])
	slot_1_68_3 = utils.opcode_scan("client.dll", "55 8B EC 56 8B F1 33 C0 8B 4D 0C 81")
	slot_1_69_4 = ffi.cast("void*(__thiscall*)(void*, const char*, int, int)", slot_1_68_3)
	slot_1_70_3 = utils.opcode_scan("client.dll", "55 8B EC 83 EC 1C 53 8B D9 85")
	slot_1_71_3 = ffi.cast("void*(__thiscall*)(void*, const char*, int)", slot_1_70_3)
	slot_1_72_3 = utils.opcode_scan("client.dll", "55 8B EC A1 ?? ?? ?? ?? 53 56 57 8B F9 8B 08 8B")
	slot_1_73_2 = ffi.cast("void(__thiscall*)(void*, const char*)", slot_1_72_3)

	function slot_1_61_2(arg_77_0, arg_77_1)
		local var_77_0 = slot_1_66_2(slot_1_64_4, 44)

		slot_1_69_4(var_77_0, arg_77_0, 0, 0)

		for iter_77_0, iter_77_1 in slot_1_13_0(arg_77_1) do
			local var_77_1 = slot_1_71_3(var_77_0, iter_77_0, 1)

			slot_1_73_2(var_77_1, iter_77_1)
		end

		return var_77_0
	end

	function slot_1_62_2(arg_78_0)
		slot_1_67_3(slot_1_64_4, arg_78_0)
	end

	slot_1_63_3 = ffi.cast("void*(__thiscall*)(void*, const char*, const char*, bool, int)", slot_1_60_2[84])
	slot_1_64_3 = nil

	function slot_1_57_0(arg_79_0, arg_79_1)
		local var_79_0 = slot_1_63_3(slot_1_59_2, arg_79_0, arg_79_1, false, 0)

		if slot_1_64_3 == nil then
			local var_79_1 = ffi.cast("void***", var_79_0)[0]

			slot_1_64_3 = ffi.cast("bool(__thiscall*)(void*)", var_79_1[42])
		end

		if slot_1_64_3(var_79_0) then
			return
		end

		return var_79_0
	end

	slot_1_63_2 = ffi.cast("void*", 0)
	slot_1_64_2 = nil

	function slot_1_58_0(arg_80_0, arg_80_1, arg_80_2)
		if slot_1_64_2 == nil then
			local var_80_0 = ffi.cast("void***", arg_80_0)[0]

			slot_1_64_2 = ffi.cast("void*(__thiscall*)(void*, void*)", var_80_0[48])
		end

		if arg_80_1 == nil and arg_80_2 == nil then
			return slot_1_64_2(arg_80_0, slot_1_63_2)
		end

		local var_80_1 = slot_1_61_2(arg_80_1, arg_80_2)

		slot_1_64_2(arg_80_0, var_80_1)
		slot_1_62_2(var_80_1)
	end

	slot_1_59_1 = nil
	slot_1_60_1 = utils.opcode_scan("engine.dll", "55 8B EC 83 EC 18 F3 0F 10 0D ?? ?? ?? ?? 8D 45 E8 F3 0F 10 05 ?? ?? ?? ?? 8D 55 F4 F3 0F 59 C1 83")
	slot_1_61_1 = slot_1_0_0("void*(__thiscall*)()", slot_1_60_1)
	slot_1_62_1 = utils.opcode_scan("engine.dll", "55 8B EC 51 53 8B D9 56 57 8B FA 33")
	slot_1_63_1 = slot_1_0_0("int(__fastcall*)(void*, int, void*)", slot_1_62_1)
	slot_1_64_1 = slot_1_3_0("void* [128]")
	slot_1_65_1 = nil

	function slot_1_59_0()
		local var_81_0 = slot_1_22_0()

		if var_81_0 == nil or not var_81_0:is_alive() then
			return
		end

		local var_81_1 = var_81_0:get_eye_position()
		local var_81_2 = slot_1_23_0()
		local var_81_3 = var_81_1 + vector():angles(var_81_2) * 4096
		local var_81_4 = slot_1_26_0(var_81_1, var_81_3, nil, 33570827).hitbox

		if var_81_4 ~= 0 then
			local var_81_5 = slot_1_54_0[var_81_4]

			if var_81_5 ~= nil then
				local var_81_6 = var_81_5.material_name

				if var_81_6 ~= nil then
					return var_81_6
				end

				local var_81_7 = slot_1_64_1()

				if slot_1_63_1(var_81_5.model, 128, var_81_7) > 0 then
					local var_81_8 = var_81_7[0]

					if slot_1_65_1 == nil then
						local var_81_9 = slot_1_0_0("void***", var_81_8)[0]

						slot_1_65_1 = slot_1_0_0("const char*(__thiscall*)(void*)", var_81_9[0])
					end

					local var_81_10 = slot_1_65_1(var_81_8)
					local var_81_11 = slot_1_2_0(var_81_10)

					var_81_5.material_name = var_81_11

					return var_81_11
				end
			end
		end

		local var_81_12 = slot_1_61_1()

		if slot_1_65_1 == nil then
			local var_81_13 = slot_1_0_0("void***", var_81_12)[0]

			slot_1_65_1 = slot_1_0_0("const char*(__thiscall*)(void*)", var_81_13[0])
		end

		local var_81_14 = slot_1_65_1(var_81_12)

		return (slot_1_2_0(var_81_14))
	end

	slot_1_60_0 = {
		ui.find("Visuals", "World", "Ambient", "Night Mode")
	}
	slot_1_61_0 = slot_1_60_0[1]
	slot_1_62_0 = slot_1_60_0[2]
	slot_1_63_0 = nil
	slot_1_64_0 = nil

	slot_1_61_0:set_callback(function(arg_82_0)
		slot_1_63_0 = arg_82_0:get()
	end, true)
	slot_1_62_0:set_callback(function(arg_83_0)
		current_nightmode_color = arg_83_0:get()
		slot_1_64_0 = {
			current_nightmode_color.r,
			current_nightmode_color.g,
			current_nightmode_color.b,
			current_nightmode_color.a
		}
	end, true)

	slot_1_65_0 = db["World Editor::Textures"] or {}
	slot_1_66_1 = 1
	slot_1_67_2 = {
		de_mirage = "3ABNhax0ZXh0dXJlX3BhdGixZ3JvdW5kL3Nub3cwMS52dGaqdmlld2FuZ2xlc5LKQQSAdcpCs5EMqHBvc2l0aW9uk8rEyRWeysUNmwnKw3t8wKVjb2xvcpTM/8z/zP/M/61tYXRlcmlhbF9uYW1l2TZkZV9taXJhZ2UvZ3JvdW5kL2RlX21pcmFnZV9ncm91bmRfdGlsZWhfYmxlbmRfZGlmZnVzZSCFrHRleHR1cmVfcGF0aLFncm91bmQvc25vdzAxLnZ0Zqp2aWV3YW5nbGVzkspBBIB1ykKzkQyocG9zaXRpb26TysTFGpPKxLEaC8rDhD0ipWNvbG9ylMz/zP/M/8z/rW1hdGVyaWFsX25hbWXZNmRlX21pcmFnZS9ncm91bmQvZGVfbWlyYWdlX2dyb3VuZF90aWxlaF9ibGVuZDJfZGlmZnVzZYWsdGV4dHVyZV9wYXRosWdyb3VuZC9zbm93MDEudnRmqnZpZXdhbmdsZXOSykGgf6XKQspiAKhwb3NpdGlvbpPKxBS95MrE4tNyysMgtFilY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZdk5bWFwcy9kZV9taXJhZ2UvZGVfbWlyYWdlL21hcmJsZS9tYXJibGVfMDFfLTcxMV8tMTQzOF8tMTIzhax0ZXh0dXJlX3BhdGixZ3JvdW5kL3Nub3cwMS52dGaqdmlld2FuZ2xlc5LKQSsnycrBGynaqHBvc2l0aW9uk8rEwyj5ysUOqwHKw3hZYKVjb2xvcpTM/8z/zP/M/61tYXRlcmlhbF9uYW1l2SpkZV9taXJhZ2UvdGlsZS9kZV9taXJhZ2VfdGlsZV92ZXI0X2RpZmZ1c2WFrHRleHR1cmVfcGF0aLFncm91bmQvc25vdzAxLnZ0Zqp2aWV3YW5nbGVzkspAzsqOykKy4T2ocG9zaXRpb26TysTHnJTKxJ7j1crDgsFhpWNvbG9ylMz/zP/M/8z/rW1hdGVyaWFsX25hbWXZNmRlX21pcmFnZS9ncm91bmQvZGVfbWlyYWdlX2dyb3VuZF90aWxlaF9ibGVuZDJfZGlmZnVzZYWsdGV4dHVyZV9wYXRosWdyb3VuZC9zbm93MDEudnRmqnZpZXdhbmdsZXOSykGdV4PKQr8zHKhwb3NpdGlvbpPKxQ1GJcrCuEUqysMV2rOlY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZdkoZGVfbWlyYWdlL3RpbGUvZGVfbWlyYWdlX3RpbGVfdmVyNF9ibGVuZIWsdGV4dHVyZV9wYXRosWdyb3VuZC9zbm93MDEudnRmqnZpZXdhbmdsZXOSykFxYSrKwkLyeqhwb3NpdGlvbpPKxMk2eMpEC81YysMn+oalY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZdk2ZGVfbWlyYWdlL2dyb3VuZC9kZV9taXJhZ2VfZ3JvdW5kX3RpbGVjX2JsZW5kX2RpZmZ1c2Ughax0ZXh0dXJlX3BhdGixZ3JvdW5kL3Nub3cwMS52dGaqdmlld2FuZ2xlc5LKQXFhKsrCQvJ6qHBvc2l0aW9uk8rEzYcjykQNooDKwyf6hqVjb2xvcpTM/8z/zP/M/61tYXRlcmlhbF9uYW1ls2RlX2R1c3QvdGlsZWZsb29yMDGFrHRleHR1cmVfcGF0aLFncm91bmQvc25vdzAxLnZ0Zqp2aWV3YW5nbGVzkspBqZWyyr/hU7+ocG9zaXRpb26TykSg7kvKwyWte8rDJ/gApWNvbG9ylMz/zP/M/8z/rW1hdGVyaWFsX25hbWWzZGVfZHVzdC9zdG9uZXN0ZXAwM4WsdGV4dHVyZV9wYXRosWdyb3VuZC9zbm93MDEudnRmqnZpZXdhbmdsZXOSykH1qRzKQgAEjahwb3NpdGlvbpPKw4KSfcrEFf2jysNggk+lY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZdkoZGVfbWlyYWdlL2dyb3VuZC9kZV9taXJhZ2VfdGlsZWZfZGlmZnVzZYWsdGV4dHVyZV9wYXRosWdyb3VuZC9zbm93MDEudnRmqnZpZXdhbmdsZXOSykD5mnzKQzKc1Khwb3NpdGlvbpPKRHxRRcpEGzDXysNknFulY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZbNkZV9kdXN0L3N0b25lc3RlcDAyhax0ZXh0dXJlX3BhdGixZ3JvdW5kL3Nub3cwMS52dGaqdmlld2FuZ2xlc5LKQSNVO8rCr0bRqHBvc2l0aW9uk8rEGVJGysQeeyHKw3EqHqVjb2xvcpTM/8z/zP/M/61tYXRlcmlhbF9uYW1l2TJtYXBzL2RlX21pcmFnZS9kZV9kdXN0L3RpbGVmbG9vcjAyXy02NjJfLTEwMTVfLTE2N4WsdGV4dHVyZV9wYXRo2SNicmljay9ocl9icmljay9pbmZlcm5vL2JyaWNrX2YxLnZ0Zqp2aWV3YW5nbGVzksrA3v3yysL2RTaocG9zaXRpb26TysQ/dT/KxLWlZsrDJ/gApWNvbG9ylBwcHMz/rW1hdGVyaWFsX25hbWXZLGRlX21pcmFnZS9icmljay9kZV9taXJhZ2VfYnJpY2tfdmVyMV9kaWZmdXNlhax0ZXh0dXJlX3BhdGjZI2JyaWNrL2hyX2JyaWNrL2luZmVybm8vYnJpY2tfZjEudnRmqnZpZXdhbmdsZXOSykAdsjTKwxKU3Khwb3NpdGlvbpPKxB7tbsrEzZK8ysMqBy2lY29sb3KUHBwczP+tbWF0ZXJpYWxfbmFtZdkxZGVfbWlyYWdlL2JyaWNrL2RlX21pcmFnZV9icmlja192ZXIyX2JsZW5kX3VwZGF0ZYWsdGV4dHVyZV9wYXRo2SNicmljay9ocl9icmljay9pbmZlcm5vL2JyaWNrX2YxLnZ0Zqp2aWV3YW5nbGVzksrBfcrAyr9INZCocG9zaXRpb26TysPVnXjKxOFZlcrDLaAfpWNvbG9ylBwcHMz/rW1hdGVyaWFsX25hbWXZKmRlX21pcmFnZS9ocl9taXJhZ2UvbWlyYWdlX3BsYXN0ZXJfYmxlbmRfM4WsdGV4dHVyZV9wYXRo2SNicmljay9ocl9icmljay9pbmZlcm5vL2JyaWNrX2YxLnZ0Zqp2aWV3YW5nbGVzksrBR5VxysKsHnWocG9zaXRpb26TysO+1q3KxONbh8rDKkoJpWNvbG9ylBwcHMz/rW1hdGVyaWFsX25hbWXZJGRlX21pcmFnZS9ocl9taXJhZ2UvbWlyYWdlX3BsYXN0ZXJfMoWsdGV4dHVyZV9wYXRo2SNicmljay9ocl9icmljay9pbmZlcm5vL2JyaWNrX2YxLnZ0Zqp2aWV3YW5nbGVzksrAzb5aysKwCy2ocG9zaXRpb26TysP+dIHKxBS/M8rDilzopWNvbG9ylBwcHMz/rW1hdGVyaWFsX25hbWXZJ2RlX21pcmFnZS9iYXNlL2RlX21pcmFnZV90b3BfdmVyMV9ibGVuZIWsdGV4dHVyZV9wYXRo2SNicmljay9ocl9icmljay9pbmZlcm5vL2JyaWNrX2YxLnZ0Zqp2aWV3YW5nbGVzkspAtlYeysKvCvuocG9zaXRpb26TysNzHM7KxBeN08rDeiBLpWNvbG9ylBwcHMz/rW1hdGVyaWFsX25hbWXZNGRlX21pcmFnZS9icmljay9kZV9taXJhZ2VfYnJpY2tfdmVyMXBsX2JsZW5kX2RpZmZ1c2WFrHRleHR1cmVfcGF0aNkjYnJpY2svaHJfYnJpY2svaW5mZXJuby9icmlja19mMS52dGaqdmlld2FuZ2xlc5LKwUvlTcrCyzl8qHBvc2l0aW9uk8rD8yIUysPq4c7KwyeW16Vjb2xvcpQcHBzM/61tYXRlcmlhbF9uYW1l2SlkZV9taXJhZ2UvYmFzZS9kZV9taXJhZ2VfdG9wX3ZlcjFfZGlmZnVzZYWsdGV4dHVyZV9wYXRo2SNicmljay9ocl9icmljay9pbmZlcm5vL2JyaWNrX2YxLnZ0Zqp2aWV3YW5nbGVzksrADHJ3ysK4XD+ocG9zaXRpb26TykLrBi/KxDz1AcrDJ/gApWNvbG9ylBwcHMz/rW1hdGVyaWFsX25hbWW4Y29uY3JldGUvY29uY3JldGVfZXh0XzA3hax0ZXh0dXJlX3BhdGjZI2JyaWNrL2hyX2JyaWNrL2luZmVybm8vYnJpY2tfZjEudnRmqnZpZXdhbmdsZXOSysF8j7zKwydLIahwb3NpdGlvbpPKxDkyqMrEK0BgysOGUkKlY29sb3KUHBwczP+tbWF0ZXJpYWxfbmFtZbJicmljay9icmlja19leHRfMDSFrHRleHR1cmVfcGF0aNkjYnJpY2svaHJfYnJpY2svaW5mZXJuby9icmlja19mMS52dGaqdmlld2FuZ2xlc5LKwT26T8rDFp4gqHBvc2l0aW9uk8rEJrmDysSM8GvKwyg1d6Vjb2xvcpQ8PDzM/61tYXRlcmlhbF9uYW1ltGRlX2R1c3Qvc2l0ZWJ3YWxsMDdhhax0ZXh0dXJlX3BhdGjZI2JyaWNrL2hyX2JyaWNrL2luZmVybm8vYnJpY2tfZjEudnRmqnZpZXdhbmdsZXOSykEvGRTKwoj5sKhwb3NpdGlvbpPKxSNI5spDheRIysMmyn6lY29sb3KUPDw8zP+tbWF0ZXJpYWxfbmFtZbRkZV9kdXN0L3NpdGVid2FsbDEzYYWsdGV4dHVyZV9wYXRo2SNicmljay9ocl9icmljay9pbmZlcm5vL2JyaWNrX2YxLnZ0Zqp2aWV3YW5nbGVzksrAmuyKykLIZlyocG9zaXRpb26TykLN8QvKxAMTTcrDKx8upWNvbG9ylBwcHMz/rW1hdGVyaWFsX25hbWXZL2RlX21pcmFnZS9wbGFzdGVyL2RlX21pcmFnZV9wbGFzdGVyX2JsdWUxX2JsZW5khax0ZXh0dXJlX3BhdGjZI2JyaWNrL2hyX2JyaWNrL2luZmVybm8vYnJpY2tfZjEudnRmqnZpZXdhbmdsZXOSysGKNv/KQrbEyahwb3NpdGlvbpPKxAuuocrD8xNHysMn14SlY29sb3KUPDw8zP+tbWF0ZXJpYWxfbmFtZdkxZGVfbWlyYWdlL3BsYXN0ZXIvZGVfbWlyYWdlX3BsYXN0ZXJfYmx1ZTFfZGlmZnVzZYWsdGV4dHVyZV9wYXRo2SNicmljay9ocl9icmljay9pbmZlcm5vL2JyaWNrX2YxLnZ0Zqp2aWV3YW5nbGVzksrBeo62ysMFQAKocG9zaXRpb26TysP7eeHKw9RsbMrDKPijpWNvbG9ylDw8PMz/rW1hdGVyaWFsX25hbWXZM2RlX21pcmFnZS9wbGFzdGVyL2RlX21pcmFnZV9wbGFzdGVyX3NhbG1vbjFfZGlmZnVzZYWsdGV4dHVyZV9wYXRo2SNicmljay9ocl9icmljay9pbmZlcm5vL2JyaWNrX2YxLnZ0Zqp2aWV3YW5nbGVzksrBeo62ysMFQAKocG9zaXRpb26TysPZCjzKw8UqDcrDJ/gApWNvbG9ylDw8PMz/rW1hdGVyaWFsX25hbWXZMWRlX21pcmFnZS9wbGFzdGVyL2RlX21pcmFnZV9wbGFzdGVyX3NhbG1vbjFfYmxlbmSFrHRleHR1cmVfcGF0aNkjYnJpY2svaHJfYnJpY2svaW5mZXJuby9icmlja19mMS52dGaqdmlld2FuZ2xlc5LKwO1hZMrBgi+BqHBvc2l0aW9uk8pDnpKzykOG+MHKw4N4hqVjb2xvcpQ8PDzM/61tYXRlcmlhbF9uYW1l2ShkZV9taXJhZ2UvYmFzZS9kZV9taXJhZ2VfYmFzZV92ZXIxX2JsZW5khax0ZXh0dXJlX3BhdGixZ3JvdW5kL3Nub3cwMS52dGaqdmlld2FuZ2xlc5LKQZ0t68pC2wM2qHBvc2l0aW9uk8rFBGL+ykQB++3KwyX+3qVjb2xvcpTM/8z/zP/M/61tYXRlcmlhbF9uYW1lvmNvbmNyZXRlL2JsZW5kX2JsYWNrdG9wc2FuZF8wMYWsdGV4dHVyZV9wYXRo2SNicmljay9ocl9icmljay9pbmZlcm5vL2JyaWNrX2YxLnZ0Zqp2aWV3YW5nbGVzksrB9dAtysKNvRyocG9zaXRpb26TysRDHy7KxQrRGsrDM/gApWNvbG9ylBwcHMz/rW1hdGVyaWFsX25hbWXZN2RlX21pcmFnZS9wbGFzdGVyX3dvcm4vZGVfbWlyYWdlX3BsYXN0ZXJfYnJpY2s0X2RpZmZ1c2WFrHRleHR1cmVfcGF0aNkiYnJpY2svaHJfYnJpY2svaW5mZXJuby9icmlja19mLnZ0Zqp2aWV3YW5nbGVzksrAIQJ8ykJVjuCocG9zaXRpb26TysPFFUPKxCs0xsrDiHV1pWNvbG9ylBwcHMz/rW1hdGVyaWFsX25hbWW0ZGVfZHVzdC9tYXJrZXR3YWxsMDKFrHRleHR1cmVfcGF0aNkjYnJpY2svaHJfYnJpY2svaW5mZXJuby9icmlja19mMS52dGaqdmlld2FuZ2xlc5LKvyx44spCgaxNqHBvc2l0aW9uk8rC4xA1ysTd8hLKwyf4AKVjb2xvcpQcHBzM/61tYXRlcmlhbF9uYW1l2TNkZV9taXJhZ2UvYnJpY2svZGVfbWlyYWdlX2JyaWNrX3ZlcjJfYmxlbmQyX2RpZmZ1c2WFrHRleHR1cmVfcGF0aNkjYnJpY2svaHJfYnJpY2svaW5mZXJuby9icmlja19mMS52dGaqdmlld2FuZ2xlc5LKPoAggMpDFh0wqHBvc2l0aW9uk8rEgj5pysSuoDvKwygzoqVjb2xvcpQcHBzM/61tYXRlcmlhbF9uYW1l2SlkZV9taXJhZ2UvYmFzZS9kZV9taXJhZ2VfbWlkX3ZlcjFfZGlmZnVzZYWsdGV4dHVyZV9wYXRosWdyb3VuZC9zbm93MDEudnRmqnZpZXdhbmdsZXOSykH2PvbKQrv2VKhwb3NpdGlvbpPKQiCrEcrFBXQfysIP4AClY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZa53b29kL3BseXdvb2QwMoWsdGV4dHVyZV9wYXRo2SNicmljay9ocl9icmljay9pbmZlcm5vL2JyaWNrX2YxLnZ0Zqp2aWV3YW5nbGVzkspAkf3sykMuLWmocG9zaXRpb26TykR26jLKxQlvP8rCH+AApWNvbG9ylBwcHMz/rW1hdGVyaWFsX25hbWW9Y3NfaXRhbHkvaHBlX3BsYXN0ZXJfdGFuX3dhbGyFrHRleHR1cmVfcGF0aLxhbnViaXMvaHJfc3RvbmVfZ3JvdW5kMDMudnRmqnZpZXdhbmdsZXOSykA1GpPKwxHvz6hwb3NpdGlvbpPKRHHX8srFBn7jysIf4AClY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZdkxbWFwcy9kZV9taXJhZ2UvdGlsZS90aWxlX21hbGxfZmxvb3IwMF81NTFfLTIyODFfOYWsdGV4dHVyZV9wYXRo2SNicmljay9ocl9icmljay9pbmZlcm5vL2JyaWNrX2YxLnZ0Zqp2aWV3YW5nbGVzksrCBKHsysMyv4qocG9zaXRpb26TykQ+jwbKxQ4iyMrCH+AApWNvbG9ylBwcHMz/rW1hdGVyaWFsX25hbWWwd29vZC93b29kX2ludF8wMoWsdGV4dHVyZV9wYXRo2SNicmljay9ocl9icmljay9pbmZlcm5vL2JyaWNrX2YxLnZ0Zqp2aWV3YW5nbGVzksrCBKHsysMyv4qocG9zaXRpb26TykQ9axTKxQ4kYcrCH+AApWNvbG9ylBwcHMz/rW1hdGVyaWFsX25hbWWyd29vZC93b29kZmxvb3IwMDVhhax0ZXh0dXJlX3BhdGjZI2JyaWNrL2hyX2JyaWNrL2luZmVybm8vYnJpY2tfZjEudnRmqnZpZXdhbmdsZXOSyr9z7+jKwyzldahwb3NpdGlvbpPKQ2yOd8rFEazsysIf4AClY29sb3KUHBwczP+tbWF0ZXJpYWxfbmFtZb9jc19pdGFseS9ocGVfcGxhc3Rlcl90cmltX2xpZ2h0hax0ZXh0dXJlX3BhdGjZI2JyaWNrL2hyX2JyaWNrL2luZmVybm8vYnJpY2tfZjEudnRmqnZpZXdhbmdsZXOSysBJbqzKwo55iahwb3NpdGlvbpPKw9rE2srEw6cOysIf4AClY29sb3KUHBwczP+tbWF0ZXJpYWxfbmFtZdkvbW9kZWxzL3Byb3BzL2RlX21pcmFnZS93YWxsX2FyY2hfYS93YWxsX2FyY2hfYTGFrHRleHR1cmVfcGF0aNkjYnJpY2svaHJfYnJpY2svaW5mZXJuby9icmlja19mMS52dGaqdmlld2FuZ2xlc5LKPsUc4MrCspf5qHBvc2l0aW9uk8rEAAHkysTC+QbKwh/gAKVjb2xvcpQcHBzM/61tYXRlcmlhbF9uYW1l2TBtb2RlbHMvcHJvcHMvZGVfbWlyYWdlL2xhcmdlX2Rvb3JfYi9sYXJnZV9kb29yX2KFrHRleHR1cmVfcGF0aLFncm91bmQvc25vdzAxLnZ0Zqp2aWV3YW5nbGVzkso+RHA+ykIx1eCocG9zaXRpb26TysRAuXHKxRTkDsrDL4XDpWNvbG9ylMz/zP/M/8z/rW1hdGVyaWFsX25hbWXZJW1vZGVscy9wcm9wcy9kZV9pbmZlcm5vL2FtbW9fcGFsbGV0MDGFrHRleHR1cmVfcGF0aLFncm91bmQvc25vdzAxLnZ0Zqp2aWV3YW5nbGVzkspCP0PJykMzvzyocG9zaXRpb26TysP9TC7KxP6MO8rCzqMzpWNvbG9ylMz/zP/M/8z/rW1hdGVyaWFsX25hbWWwd29vZC9taWxiZWFtczAwM4WsdGV4dHVyZV9wYXRosWdyb3VuZC9zbm93MDEudnRmqnZpZXdhbmdsZXOSykASjdXKwySHdqhwb3NpdGlvbpPKww3PqsrE/utvysMn+AClY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZdkibW9kZWxzL3Byb3BzL2RlX2luZmVybm8vYm9tYl90YW5rc4WsdGV4dHVyZV9wYXRosWdyb3VuZC9zbm93MDEudnRmqnZpZXdhbmdsZXOSykJLgg7KwjXLT6hwb3NpdGlvbpPKw5A4PsrE/YscysIT4AClY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZbF3b29kL3dvb2RiZWFtMDAxYYWsdGV4dHVyZV9wYXRosWdyb3VuZC9zbm93MDEudnRmqnZpZXdhbmdsZXOSykCqnCzKQy7E1Khwb3NpdGlvbpPKQ0zDLcrEwqA/ysMUTWKlY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZdkkbW9kZWxzL2RlX2R1c3Qvb2JqZWN0cy9zdG9uZWJsb2NrczAxhax0ZXh0dXJlX3BhdGixZ3JvdW5kL3Nub3cwMS52dGaqdmlld2FuZ2xlc5LKQSQnJMrDM3ltqHBvc2l0aW9uk8pDA42vysS7nMPKwy/4AKVjb2xvcpTM/8z/zP/M/61tYXRlcmlhbF9uYW1l2Uptb2RlbHMvcHJvcHMvZGVfZHVzdC9ocl9kdXN0L2R1c3RfY3JhdGVzL2R1c3Rfc2hpcHBpbmdfY3JhdGVfMDJfd29vZF9jb2xvcoWsdGV4dHVyZV9wYXRosWdyb3VuZC9zbm93MDEudnRmqnZpZXdhbmdsZXOSykEUIxTKwprSfahwb3NpdGlvbpPKQR4Hb8rExhh4ysMqkZKlY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZdktbW9kZWxzL3Byb3BzL2dnX3ZpZXRuYW0vdmlldG5hbV9odXRfd29vZF9nYW5nhax0ZXh0dXJlX3BhdGixZ3JvdW5kL3Nub3cwMS52dGaqdmlld2FuZ2xlc5LKQUkdFsrDBHmyqHBvc2l0aW9uk8rEAXJUysS6GETKwh//gKVjb2xvcpTM/8z/zP/M/61tYXRlcmlhbF9uYW1l2SZtb2RlbHMvcHJvcHMvZGVfbWlyYWdlL2JlbmNoX2EvYmVuY2hfYYWsdGV4dHVyZV9wYXRosWdyb3VuZC9zbm93MDEudnRmqnZpZXdhbmdsZXOSykDGU6HKQy1FT6hwb3NpdGlvbpPKQ+E97crEPrD2ysMf+AClY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZdklbW9kZWxzL3Byb3BzL2RlX2R1c3QvZHVzdF9mb29kX2NyYXRlc4WsdGV4dHVyZV9wYXRosWdyb3VuZC9zbm93MDEudnRmqnZpZXdhbmdsZXOSykA4v+HKQzPQ4Khwb3NpdGlvbpPKQ+ODPMrEKsQfysMf+AClY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZdklbW9kZWxzL3Byb3BzL2RlX2luZmVybm8vZmxvd2VyX2JhcnJlbIWsdGV4dHVyZV9wYXRo2SNicmljay9ocl9icmljay9pbmZlcm5vL2JyaWNrX2YxLnZ0Zqp2aWV3YW5nbGVzksrBOlm/ysLgdiWocG9zaXRpb26TysSw0bHKRADnVMrDJUwZpWNvbG9ylBwcHMz/rW1hdGVyaWFsX25hbWXZJG1vZGVscy9wcm9wcy9kZV9kdXN0L2R1c3RfYXJjaF9zbWFsbIWsdGV4dHVyZV9wYXRo2SNicmljay9ocl9icmljay9pbmZlcm5vL2JyaWNrX2YxLnZ0Zqp2aWV3YW5nbGVzkspA8hE/ysEKp6+ocG9zaXRpb26TysUa16PKQ8cT0srDJ/gApWNvbG9ylMz/zP/M/8z/rW1hdGVyaWFsX25hbWXZMm1vZGVscy9wcm9wcy9kZV9taXJhZ2UvYnJva2VuX3dhbGxfMS9icm9rZW5fd2FsbF8xhax0ZXh0dXJlX3BhdGjZImJyaWNrL2hyX2JyaWNrL2luZmVybm8vYnJpY2tfZi52dGaqdmlld2FuZ2xlc5LKQSdVu8pDGRvqqHBvc2l0aW9uk8rEcFXOysQOXr3Kw4mz+KVjb2xvcpTM/8z/zP/M/61tYXRlcmlhbF9uYW1ltWRlX2R1c3QvbWFya2V0d2FsbDA1YYWsdGV4dHVyZV9wYXRo2SNicmljay9ocl9icmljay9pbmZlcm5vL2JyaWNrX2YxLnZ0Zqp2aWV3YW5nbGVzkspAJtD2ykK1sLmocG9zaXRpb26TysRr40HKxBQ55crDg/wApWNvbG9ylMz/zP/M/8z/rW1hdGVyaWFsX25hbWXZIm1vZGVscy9wcm9wcy9jc19pdGFseS9icmlja19hcmNoMDGFrHRleHR1cmVfcGF0aNkhYW51YmlzL2hyX3N0b25lX2Zsb29yMDFfYmxlbmQudnRmqnZpZXdhbmdsZXOSyj+CxCbKQzPJSKhwb3NpdGlvbpPKRAqCPMpESQwIysMH+AClY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZdkgY3NfaXRhbHkvaHBlX3BsYXN0ZXJfeWVsbG93X3dhbGyFrHRleHR1cmVfcGF0aNkhYW51YmlzL2hyX3N0b25lX2Zsb29yMDFfYmxlbmQudnRmqnZpZXdhbmdsZXOSyr/p53jKwuURO6hwb3NpdGlvbpPKxPZMEsrD9/wxysMn+AClY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZbZwbGFzdGVyL3BsYXN0ZXJfaW50XzAyhax0ZXh0dXJlX3BhdGi8YW51YmlzL2hyX3N0b25lX2dyb3VuZDAzLnZ0Zqp2aWV3YW5nbGVzkspAWxjPykJLlpGocG9zaXRpb26TysUJPR/KxAX49srDJ/gApWNvbG9ylMz/zP/M/8z/rW1hdGVyaWFsX25hbWXZLW1hcHMvZGVfbWlyYWdlL3RpbGUvbWlsZmxyMDAyXy0xOTk5Xy01MjhfLTE0OIWsdGV4dHVyZV9wYXRovGFudWJpcy9ocl9zdG9uZV9ncm91bmQwMy52dGaqdmlld2FuZ2xlc5LKQZFto8pCtp/5qHBvc2l0aW9uk8rEmm+iysR8FA3Kwyf4AKVjb2xvcpTM/8z/zP/M/61tYXRlcmlhbF9uYW1lsHRpbGUvdGlsZV9pbnRfMDKFrHRleHR1cmVfcGF0aNkhYW51YmlzL2hyX3N0b25lX2Zsb29yMDFfYmxlbmQudnRmqnZpZXdhbmdsZXOSyr2QQrDKQptdw6hwb3NpdGlvbpPKxJngCsrEqQ4BysMr4KSlY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZb1jc19pdGFseS9ocGVfcGxhc3Rlcl90aW50X3RhboWsdGV4dHVyZV9wYXRo2SFhbnViaXMvaHJfc3RvbmVfZmxvb3IwMV9ibGVuZC52dGaqdmlld2FuZ2xlc5LKPm754cpB/vwgqHBvc2l0aW9uk8rEkxajysQWwarKwyf4AKVjb2xvcpTM/8z/zP/M/61tYXRlcmlhbF9uYW1lrWJyaWNrL2luZndsbGeFrHRleHR1cmVfcGF0aL1tZXRhbC9iYWdnYWdlX3RyYWNrX3JhaWxzLnZ0Zqp2aWV3YW5nbGVzkspAkq7pykKIj6uocG9zaXRpb26TysSRCIjKxDMJacrDJ/gApWNvbG9ylMz/zP/M/8z/rW1hdGVyaWFsX25hbWXZMm1hcHMvZGVfbWlyYWdlL21ldGFsL21ldGFsZG9vcjAzNGFfLTExODFfLTYzOV8tMTE5hax0ZXh0dXJlX3BhdGi+YXJfZGl6enkvZGl6enlfZmFjYWRlX21hc2sudnRmqnZpZXdhbmdsZXOSysCDctHKwQphgKhwb3NpdGlvbpPKxOQ40MrE5/ZbysOEjcClY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZa9kZV9kdXN0L2Rvb3IwMTGFrHRleHR1cmVfcGF0aL5hcl9kaXp6eS9kaXp6eV9mYWNhZGVfbWFzay52dGaqdmlld2FuZ2xlc5LKQGD5jspAwKFXqHBvc2l0aW9uk8rE9F51ysTvucjKw424I6Vjb2xvcpTM/8z/zP/M/61tYXRlcmlhbF9uYW1lrmRlX2R1c3QvZG9vcjA0hax0ZXh0dXJlX3BhdGi9bWV0YWwvYmFnZ2FnZV90cmFja19yYWlscy52dGaqdmlld2FuZ2xlc5LKwKctNMrBR1zqqHBvc2l0aW9uk8rExSN5ysRhtJPKwzIzxKVjb2xvcpTM/8z/zP/M/61tYXRlcmlhbF9uYW1l2S5tb2RlbHMvcHJvcHMvZGVfYXp0ZWMvYXp0ZWNfc2NhZmZvbGRpbmdfc3lzdGVthax0ZXh0dXJlX3BhdGjZI2JyaWNrL2hyX2JyaWNrL2luZmVybm8vYnJpY2tfZjEudnRmqnZpZXdhbmdsZXOSykDdwqzKQymXkKhwb3NpdGlvbpPKQ8zDtcrEy9m4ysNKVnOlY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZbNkZV9kdXN0L3N0b25lc3RlcDAxhax0ZXh0dXJlX3BhdGjZI2JyaWNrL2hyX2JyaWNrL2luZmVybm8vYnJpY2tfZjEudnRmqnZpZXdhbmdsZXOSykDdwsfKwkkvqKhwb3NpdGlvbpPKxI1st8rC2IJaysJXYAClY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZbZjc19pdGFseS9wbGFzdGVyd2FsbDA0hax0ZXh0dXJlX3BhdGixZ3JvdW5kL3Nub3cwMS52dGaqdmlld2FuZ2xlc5LKv6eJ5srCEypWqHBvc2l0aW9uk8rE0XpRysRZPYbKwyiHI6Vjb2xvcpTM/8z/zP/M/61tYXRlcmlhbF9uYW1l2SZtb2RlbHMvcHJvcHMvZGVfdmVydGlnby93b29kX3BhbGxldF8wMYWsdGV4dHVyZV9wYXRo2SNicmljay9ocl9icmljay9pbmZlcm5vL2JyaWNrX2YxLnZ0Zqp2aWV3YW5nbGVzksrCB6qxysKfa1OocG9zaXRpb26TysP4k+vKxMcY/8rCH+AApWNvbG9ylMz/zP/M/8z/rW1hdGVyaWFsX25hbWXZJGRlX21pcmFnZS9ocl9taXJhZ2UvbWlyYWdlX3BsYXN0ZXJfMYWsdGV4dHVyZV9wYXRosWdyb3VuZC9zbm93MDEudnRmqnZpZXdhbmdsZXOSykHSyHbKwzN0c6hwb3NpdGlvbpPKRDZKccpEG4F2ysMH+AClY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZbpjb25jcmV0ZS9jb25jcmV0ZV9mbG9vcl8wNIWsdGV4dHVyZV9wYXRosWdyb3VuZC9zbm93MDEudnRmqnZpZXdhbmdsZXOSykEfxBbKwwq456hwb3NpdGlvbpPKw28//MpEHBDjysKf8AClY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZdkqZGVfbWlyYWdlL3dvb2QvZGVfbWlyYWdlX3dvb2RfdmVyM19kaWZmdXNlhax0ZXh0dXJlX3BhdGjZI2JyaWNrL2hyX2JyaWNrL2luZmVybm8vYnJpY2tfZjEudnRmqnZpZXdhbmdsZXOSysIj9FvKwyCNM6hwb3NpdGlvbpPKw4Vnt8pEIcNpysKf8AClY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZdksbW9kZWxzL3Byb3BzL2RlX21pcmFnZS90b3dlcnRvcF9lL3Rvd2VydG9wX2WFrHRleHR1cmVfcGF0aLFncm91bmQvc25vdzAxLnZ0Zqp2aWV3YW5nbGVzkspB+pdYykMw+aSocG9zaXRpb26TysUOEsnKRBGzK8rDGdZPpWNvbG9ylMz/zP/M/8z/rW1hdGVyaWFsX25hbWXZN21hcHMvZGVfbWlyYWdlL2NvbmNyZXRlL2JsZW5kX2JsYWNrdG9wc2FuZF8wMV93dnRfcGF0Y2iFrHRleHR1cmVfcGF0aL5hcl9kaXp6eS9kaXp6eV9mYWNhZGVfbWFzay52dGaqdmlld2FuZ2xlc5LKQJ4i+MpCr9ZPqHBvc2l0aW9uk8rD+MamysTIHgzKwh/gAKVjb2xvcpTM/8z/zP/M/61tYXRlcmlhbF9uYW1ltmRlX21pcmFnZS9kb29ycy9kb29yX2OFrHRleHR1cmVfcGF0aL5hcl9kaXp6eS9kaXp6eV9mYWNhZGVfbWFzay52dGaqdmlld2FuZ2xlc5LKv4+dP8pCug/iqHBvc2l0aW9uk8rCju8eysP1w/TKwyX4AKVjb2xvcpTM/8z/zP/M/61tYXRlcmlhbF9uYW1ltW1vZGVscy9jc19pdGFseS9kb29yYYWsdGV4dHVyZV9wYXRosWdyb3VuZC9zbm93MDEudnRmqnZpZXdhbmdsZXOSysHBY8LKwho2kKhwb3NpdGlvbpPKxGjAW8pDNvjuysMt/EilY29sb3KUzP/M/8z/zP+tbWF0ZXJpYWxfbmFtZbptb2RlbHMvcHJvcHMvZGVfZHVzdC9ydWcwM4WsdGV4dHVyZV9wYXRo2SNicmljay9ocl9icmljay9pbmZlcm5vL2JyaWNrX2YxLnZ0Zqp2aWV3YW5nbGVzkspAShDPysMjCJSocG9zaXRpb26TykSYJA3KxJVSCcrDTIMwpWNvbG9ylBwcHMz/rW1hdGVyaWFsX25hbWXZSm1hcHMvZGVfbWlyYWdlL2RlX21pcmFnZS9icmljay9kZV9taXJhZ2VfYnJpY2tfdmVyMl9ibGVuZF91cGRhdGVfd3Z0X3BhdGNo"
	}

	for iter_1_12, iter_1_13 in slot_1_13_0(slot_1_67_2) do
		slot_1_73_1 = slot_1_65_0[iter_1_12]

		if slot_1_73_1 == nil then
			slot_1_73_1 = {}
			slot_1_65_0[iter_1_12] = slot_1_73_1
		end

		if slot_1_73_1.enabled == nil then
			slot_1_73_1.enabled = 1
		end

		slot_1_75_2 = slot_1_31_0.decode(iter_1_13)
		slot_1_75_1 = msgpack.unpack(slot_1_75_2)
		slot_1_73_1[slot_1_66_1] = {
			name = "Default",
			textures = slot_1_75_1
		}
	end

	slot_1_66_0 = nil
	slot_1_67_1 = nil
	slot_1_68_2 = {}
	slot_1_69_3 = {}

	function slot_1_70_2()
		local var_84_0 = {}
		local var_84_1 = slot_1_65_0[slot_1_55_0]

		if var_84_1 == nil then
			return var_84_0
		end

		local var_84_2 = var_84_1[var_84_1.enabled]

		if var_84_2 == nil then
			return var_84_0
		end

		local var_84_3 = var_84_2.textures

		for iter_84_0, iter_84_1 in slot_1_14_0(var_84_3) do
			local var_84_4 = iter_84_1.material_name
			local var_84_5 = iter_84_1.texture_path
			local var_84_6 = iter_84_1.color

			if var_84_4 ~= nil and var_84_5 ~= nil and var_84_6 ~= nil then
				var_84_0[#var_84_0 + 1] = iter_84_1
			end
		end

		return var_84_0
	end

	function slot_1_71_1()
		local var_85_0 = {}
		local var_85_1 = slot_1_70_2()

		if slot_1_66_0 ~= nil then
			local var_85_2 = slot_1_66_0.material_name

			if var_85_2 ~= nil and slot_1_66_0.texture_path ~= nil and slot_1_66_0.color ~= nil then
				for iter_85_0, iter_85_1 in slot_1_14_0(var_85_1) do
					if var_85_2 == iter_85_1.material_name then
						slot_1_19_0(var_85_1, iter_85_0)
					end
				end

				var_85_1[#var_85_1 + 1] = slot_1_66_0
			end
		end

		local var_85_3 = 0

		for iter_85_2, iter_85_3 in slot_1_14_0(var_85_1) do
			local var_85_4 = iter_85_3.material_name
			local var_85_5 = slot_1_8_0(var_85_4, "(_%-?%d+_%-?%d+_%-?%d+)$") ~= nil

			if var_85_5 then
				var_85_4 = slot_1_9_0(var_85_4, "^(.-)_%-?%d+_%-?%d+_%-?%d+$")
			end

			local var_85_6 = iter_85_3.texture_path
			local var_85_7 = iter_85_3.color

			if slot_1_63_0 then
				var_85_7 = slot_1_64_0
			end

			local var_85_8 = slot_1_5_0(var_85_4, 1, 7) == "models/" and "VertexLitGeneric" or "LightmappedGeneric"
			local var_85_9 = {
				["$basetexture"] = var_85_6,
				["$color"] = slot_1_7_0("{ %s %s %s }", var_85_7[1], var_85_7[2], var_85_7[3])
			}

			if var_85_5 then
				local var_85_10 = slot_1_29_0(var_85_4)

				for iter_85_4, iter_85_5 in slot_1_14_0(var_85_10) do
					local var_85_11 = iter_85_5:get_name()
					local var_85_12 = slot_1_69_3[var_85_11]
					local var_85_13 = var_85_12 == nil

					if not var_85_13 then
						if var_85_12.texture_path ~= var_85_6 then
							var_85_13 = true
						end

						if var_85_12.texture_color ~= var_85_7 then
							var_85_13 = true
						end
					end

					if var_85_13 then
						local var_85_14 = iter_85_5:get_texture_group_name()
						local var_85_15 = slot_1_57_0(var_85_11, var_85_14)

						if var_85_15 ~= nil then
							slot_1_27_0(0.01 * var_85_3, slot_1_58_0, var_85_15, var_85_8, var_85_9)

							var_85_3 = var_85_3 + 1
						end
					end

					slot_1_69_3[var_85_11] = {
						texture_group_name = texture_group_name,
						texture_path = var_85_6,
						texture_color = var_85_7
					}
					var_85_0[var_85_11] = true
				end
			else
				local var_85_16 = slot_1_30_0(var_85_4)
				local var_85_17 = var_85_16:get_name()
				local var_85_18 = slot_1_69_3[var_85_17]
				local var_85_19 = var_85_18 == nil

				if not var_85_19 then
					if var_85_18.texture_path ~= var_85_6 then
						var_85_19 = true
					end

					if var_85_18.texture_color ~= var_85_7 then
						var_85_19 = true
					end
				end

				if var_85_19 then
					local var_85_20 = var_85_16:get_texture_group_name()
					local var_85_21 = slot_1_57_0(var_85_17, var_85_20)

					if var_85_21 ~= nil then
						slot_1_27_0(0.01 * var_85_3, slot_1_58_0, var_85_21, var_85_8, var_85_9)

						var_85_3 = var_85_3 + 1
					end
				end

				slot_1_69_3[var_85_17] = {
					texture_group_name = texture_group_name,
					texture_path = var_85_6,
					texture_color = var_85_7
				}
				var_85_0[var_85_17] = true
			end
		end

		return var_85_0
	end

	function slot_1_67_0()
		if slot_1_55_0 == nil then
			return
		end

		if not globals.is_in_game then
			return
		end

		local var_86_0 = slot_1_71_1()
		local var_86_1 = 0
		local var_86_2 = 0

		for iter_86_0, iter_86_1 in slot_1_13_0(slot_1_69_3) do
			if var_86_0[iter_86_0] == nil then
				local var_86_3 = slot_1_57_0(iter_86_0, iter_86_1.texture_group_name)

				if var_86_3 ~= nil then
					slot_1_27_0(0.01 * var_86_1, function()
						var_86_2 = var_86_2 + 1

						slot_1_58_0(var_86_3)

						if var_86_1 == var_86_2 then
							cvar.mat_reloadallmaterials:call()
							slot_1_62_0:override(color())
							slot_1_27_0(0.01, slot_1_62_0.override, slot_1_62_0)
						end
					end)

					var_86_1 = var_86_1 + 1
				end

				slot_1_69_3[iter_86_0] = nil
			end
		end
	end

	slot_1_68_1 = nil
	slot_1_69_2 = "\a{Link Active}\aDEFAULT   "
	slot_1_70_1 = "\a{Link Active}\aDEFAULT   "

	function slot_1_68_0(arg_88_0)
		local var_88_0 = {}
		local var_88_1 = arg_88_0.enabled

		for iter_88_0, iter_88_1 in slot_1_14_0(arg_88_0) do
			local var_88_2 = iter_88_0 == var_88_1

			var_88_0[#var_88_0 + 1] = (var_88_2 and slot_1_69_2 or slot_1_70_1) .. iter_88_1.name
		end

		var_88_0[#var_88_0 + 1] = "+ Create New"

		slot_1_56_0.presets:update(var_88_0)
		slot_1_27_0(0.01, slot_1_56_0.presets.set, slot_1_56_0.presets, 1)
		slot_1_67_0()
	end

	slot_1_69_1 = nil

	function slot_1_69_0()
		if slot_1_55_0 == nil then
			return
		end

		local var_89_0 = slot_1_65_0[slot_1_55_0]

		if var_89_0 == nil then
			var_89_0 = {
				{
					name = "Default ~ Soon",
					textures = {}
				},
				enabled = 1
			}
			slot_1_65_0[slot_1_55_0] = var_89_0
		end

		slot_1_68_0(var_89_0)
	end

	slot_1_69_0()
	slot_1_46_0(slot_1_69_0)
	events.level_init(slot_1_69_0)
	slot_1_56_0.preset_enabled:set_callback(function(arg_90_0)
		if slot_1_55_0 == nil then
			return
		end

		local var_90_0 = slot_1_56_0.presets:get()
		local var_90_1 = slot_1_65_0[slot_1_55_0]
		local var_90_2 = arg_90_0:get()
		local var_90_3 = var_90_0 == var_90_1.enabled

		if var_90_3 == var_90_2 then
			return
		end

		var_90_1.enabled = var_90_0

		if var_90_3 and not var_90_2 then
			var_90_1.enabled = 0
		end

		slot_1_69_0()
	end)
	slot_1_56_0.presets:set_callback(function(arg_91_0)
		if slot_1_55_0 == nil then
			return
		end

		local var_91_0 = slot_1_65_0[slot_1_55_0]
		local var_91_1 = arg_91_0:get() == var_91_0.enabled

		slot_1_56_0.preset_enabled:set(var_91_1)
	end, true)
	slot_1_56_0.preset_create:set_callback(function()
		if slot_1_55_0 == nil then
			return
		end

		local var_92_0 = slot_1_65_0[slot_1_55_0]

		if var_92_0 == nil then
			var_92_0 = {
				{
					name = "Default ~ Soon",
					textures = {}
				},
				enabled = 1
			}
			slot_1_65_0[slot_1_55_0] = var_92_0
		end

		local var_92_1 = slot_1_56_0.preset_name:get()

		if slot_1_6_0(var_92_1, " ", "") == "" then
			var_92_1 = "Unnamed"
		end

		var_92_0[#var_92_0 + 1] = {
			enabled = true,
			name = var_92_1,
			textures = {}
		}

		slot_1_68_0(var_92_0)

		db["World Editor::Textures"] = slot_1_65_0
	end)
	slot_1_56_0.preset_delete:set_callback(function()
		if slot_1_55_0 == nil then
			return
		end

		local var_93_0 = slot_1_56_0.presets:get()
		local var_93_1 = slot_1_65_0[slot_1_55_0]

		slot_1_19_0(var_93_1, var_93_0)
		slot_1_69_0(var_93_1)
		slot_1_67_0()

		db["World Editor::Textures"] = slot_1_65_0
	end)

	slot_1_70_0 = nil
	slot_1_71_0 = nil
	slot_1_72_1 = nil

	function slot_1_72_0()
		if slot_1_70_0 == nil then
			return
		end

		if slot_1_55_0 == nil then
			return
		end

		local var_94_0 = slot_1_65_0[slot_1_55_0][slot_1_70_0].textures
		local var_94_1 = {}

		for iter_94_0, iter_94_1 in slot_1_14_0(var_94_0) do
			var_94_1[#var_94_1 + 1] = iter_94_1.material_name
		end

		var_94_1[#var_94_1 + 1] = "+ Create New"

		slot_1_56_0.preset_editing_list:update(var_94_1)
		slot_1_56_0.preset_editing_list:set(slot_1_71_0 or 1)
	end

	slot_1_56_0.preset_editing_list:set_callback(function(arg_95_0)
		slot_1_71_0 = arg_95_0:get()
	end)
	slot_1_56_0.preset_edit:set_callback(function()
		if slot_1_55_0 == nil then
			return
		end

		local var_96_0 = slot_1_65_0[slot_1_55_0].enabled

		slot_1_70_0 = slot_1_56_0.presets:get()

		if slot_1_70_0 ~= var_96_0 then
			slot_1_56_0.back:set(1)

			slot_1_70_0 = nil

			return
		end

		slot_1_72_0()
	end)
	slot_1_56_0.back:set_callback(function()
		slot_1_70_0 = nil
		slot_1_66_0 = nil
		debug_props = false

		slot_1_67_0()
	end)
	slot_1_46_0(function()
		slot_1_56_0.back:set(1)
	end)

	slot_1_73_0 = nil

	function slot_1_74_1()
		if not slot_1_56_0.is_editing then
			return
		end

		if not slot_1_56_0.is_editing_create_new then
			return
		end

		if slot_1_56_0.is_material_selected then
			return
		end

		local var_99_0 = slot_1_22_0()

		if var_99_0 == nil or not var_99_0:is_alive() then
			return
		end

		slot_1_73_0 = slot_1_59_0()

		slot_1_56_0.material_by_crosshair:name("Material By Crosshair: " .. slot_1_73_0)
	end

	events.createmove(slot_1_74_1)

	slot_1_74_0 = slot_1_56_0.textures_group_lists

	slot_1_56_0.select_material_by_crosshair:set_callback(function()
		if slot_1_73_0 == nil then
			return
		end

		local var_100_0 = slot_1_65_0[slot_1_55_0]

		if var_100_0 == nil then
			return loaded_textures
		end

		local var_100_1 = var_100_0[var_100_0.enabled]

		if var_100_1 == nil then
			return loaded_textures
		end

		local var_100_2 = var_100_1.textures

		for iter_100_0, iter_100_1 in slot_1_14_0(var_100_2) do
			if iter_100_1.material_name == slot_1_73_0 then
				slot_1_56_0.preset_editing_list:set(iter_100_0)

				return
			end
		end

		slot_1_66_0 = {
			material_name = slot_1_73_0
		}

		slot_1_56_0.selected_material:name("Selected Material: " .. slot_1_73_0)
	end)
	slot_1_56_0.texture_select:set_callback(function()
		if slot_1_66_0 == nil then
			return
		end

		local var_101_0 = slot_1_22_0()

		if var_101_0 == nil or not var_101_0:is_alive() then
			return
		end

		local var_101_1 = var_101_0:get_origin()
		local var_101_2 = slot_1_23_0()

		slot_1_66_0.position = {
			var_101_1.x,
			var_101_1.y,
			var_101_1.z
		}
		slot_1_66_0.viewangles = {
			var_101_2.x,
			var_101_2.y
		}

		local var_101_3 = slot_1_56_0.textures_group:get()
		local var_101_4 = slot_1_74_0[var_101_3]:get()
		local var_101_5 = slot_1_36_0[var_101_3][var_101_4]

		slot_1_66_0.texture_path = var_101_5

		local var_101_6 = slot_1_6_0(var_101_5, ".vtf", "")

		slot_1_56_0.selected_texture:name("Selected Texture: " .. var_101_6)
		slot_1_67_0()
	end)

	function slot_1_75_0()
		if slot_1_66_0 == nil then
			return
		end

		local var_102_0 = slot_1_56_0.textures_group:get()
		local var_102_1 = slot_1_74_0[var_102_0]:get()
		local var_102_2 = slot_1_36_0[var_102_0][var_102_1]

		slot_1_66_0.texture_path = var_102_2

		slot_1_67_0()
	end

	slot_1_56_0.select_texture:set_callback(function()
		slot_1_56_0.textures_group:reset()
		slot_1_56_0.color:reset()
	end)
	slot_1_56_0.textures_group:set_callback(slot_1_75_0)

	for iter_1_14, iter_1_15 in slot_1_13_0(slot_1_74_0) do
		iter_1_15:set_callback(slot_1_75_0)
	end

	slot_1_56_0.color:set_callback(function(arg_104_0)
		if slot_1_66_0 == nil then
			return
		end

		local var_104_0 = arg_104_0:get()

		slot_1_66_0.color = {
			var_104_0.r,
			var_104_0.g,
			var_104_0.b,
			var_104_0.a
		}

		slot_1_67_0()
	end)
	slot_1_56_0.preset_editing_list:set_callback(function(arg_105_0)
		if slot_1_70_0 == nil or slot_1_71_0 == nil then
			return
		end

		if slot_1_55_0 == nil then
			return
		end

		local var_105_0 = slot_1_65_0[slot_1_55_0][slot_1_70_0].textures[slot_1_71_0]

		if var_105_0 == nil then
			return
		end

		slot_1_66_0 = slot_1_53_0(var_105_0)

		slot_1_56_0.selected_material:name("Selected Material: " .. slot_1_66_0.material_name)

		local var_105_1 = slot_1_66_0.texture_path
		local var_105_2 = slot_1_6_0(var_105_1, ".vtf", "")

		slot_1_56_0.selected_texture:name("Selected Texture: " .. var_105_2)

		local var_105_3 = slot_1_66_0.color

		slot_1_56_0.color:set(color(var_105_3[1], var_105_3[2], var_105_3[3], var_105_3[4]))
	end)
	slot_1_56_0.texture_teleport:set_callback(function()
		if slot_1_70_0 == nil or slot_1_71_0 == nil then
			return
		end

		if slot_1_66_0 == nil then
			return
		end

		if slot_1_66_0.material_name == nil or slot_1_66_0.texture_path == nil or slot_1_66_0.color == nil then
			return
		end

		if slot_1_55_0 == nil then
			return
		end

		local var_106_0 = slot_1_65_0[slot_1_55_0][slot_1_70_0].textures[slot_1_71_0]
		local var_106_1 = var_106_0.position
		local var_106_2 = var_106_0.viewangles

		utils.console_exec(slot_1_7_0("noclip off; setpos_exact %s %s %s; setang %s %s", var_106_1[1], var_106_1[2], var_106_1[3], var_106_2[1], var_106_2[2]))
	end)
	slot_1_56_0.texture_save:set_callback(function()
		if slot_1_70_0 == nil or slot_1_71_0 == nil then
			return
		end

		if slot_1_66_0 == nil then
			return
		end

		if slot_1_66_0.material_name == nil or slot_1_66_0.texture_path == nil or slot_1_66_0.color == nil then
			return
		end

		if slot_1_55_0 == nil then
			return
		end

		slot_1_65_0[slot_1_55_0][slot_1_70_0].textures[slot_1_71_0] = slot_1_53_0(slot_1_66_0)
		slot_1_66_0 = nil

		slot_1_72_0()
		slot_1_67_0()

		db["World Editor::Textures"] = slot_1_65_0
	end)
	slot_1_56_0.preset_editing_delete:set_callback(function()
		if slot_1_70_0 == nil or slot_1_71_0 == nil then
			return
		end

		if slot_1_55_0 == nil then
			return
		end

		local var_108_0 = slot_1_65_0[slot_1_55_0][slot_1_70_0].textures

		slot_1_19_0(var_108_0, slot_1_71_0)

		slot_1_66_0 = nil

		slot_1_72_0()
		slot_1_67_0()

		db["World Editor::Textures"] = slot_1_65_0
	end)
	events.shutdown(function()
		db["World Editor::Textures"] = slot_1_65_0
	end)
end

utils.execute_after(0.05, function()
	local var_110_0, var_110_1 = pcall(slot_0_0_0)

	if not var_110_0 then
		print_error(var_110_1)
	end
end)
