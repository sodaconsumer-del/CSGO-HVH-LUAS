-- DaCrib OWNS me & all,  https://discord.gg/EtjunmbdA2



ui.sidebar("Anime Lua", "heart")
local group1 = ui.create("Anime girls")

local combo = {
	group1:combo("Top", {"Off" ,"Astolfo", "Megumin", "Rias DXD", "Sitting Loli"}),
	group1:combo("Left", {"Off" ,"Eromanga Sensei", "Loli", "Neko Loli #1", "Neko Loli #2", "Hentai #1"}),
	group1:combo("Right", {"Off", "Kanzaki", "Neko Footfetish", "Swimsuit + stockings", "Mona Genshin"})
}

local imagesize = {
	top = {
		vector(754 / 3.8, 1220 / 3.8),
		vector(663 / 4, 1458 / 4),
		vector(1138 / 5, 1614 / 5),
		vector(1024 / 5, 1571 / 5),
	},
	left = {
		vector(878 / 4, 2073 / 4),
		vector(1079 / 3, 744 / 3),
		vector(598 / 3, 1178 / 3),
		vector(351 / 1.5, 661 / 1.5),
		vector(521 / 2, 909 / 2),
	},
	right = {
		vector(707 / 2.5, 1065 / 2.5),
		vector(790 / 3, 1097 / 3),
		vector(761 / 2.9, 1378 / 2.9),
		vector(1310 / 4, 1802 / 4),
	}
}

local url = {
	top = {
		"https://steamuserimages-a.akamaihd.net/ugc/780728056600893177/5D12C67046AC71F22CB243D79569008D49602AD9/?imw=512&amp;imh=828&amp;ima=fit&amp;impolicy=Letterbox&amp;imcolor=%23000000&amp;letterbox=true",
		"https://cdn.discordapp.com/attachments/798169474716925962/798337585495539732/ecchi-drawing-human-4.png",
		"https://i.pinimg.com/originals/33/fb/7b/33fb7b953c5f533229067491a1f67715.png",
		"https://cdn.discordapp.com/attachments/798169474716925962/798374483617644564/kawaii_anime_girl_tie_hair__3_by_alyssaholt13_dchkvxy-fullview.png"
	},
	left = {
		"https://i.ibb.co/M2YSB61/eromangawithgun.png",
		"https://i.ibb.co/4S4kNHp/pinkhairgirl.png",
		"https://i.ibb.co/XY1Jc5c/nekololi.png",
		"https://i.ibb.co/K2p1T0s/pngkey-com-anime-girls-png-1883325.png",
		"https://i.ibb.co/0Dff9wQ/hentai1.png",
	},
	right = {
		"https://i.ibb.co/vXFWMZg/blendstrap.png",
		"https://i.ibb.co/jyZRqdb/nekostockings.png",
		"https://i.ibb.co/1bcHFg1/stokingsandswimsuit.png",
		"https://i.ibb.co/JBqcbgK/monagenshin.png",
	}
}

local imageloaded = {
	top = {nil, nil, nil, nil},
	left = {nil, nil, nil, nil, nil},
	right = {nil, nil, nil, nil}
}

local bytes = {
	top = {
		network.get(url.top[1], {}, function(response)
			imageloaded.top[1] = render.load_image(response, imagesize.top[1])
		end
	),
		network.get(url.top[2], {}, function(response)
			imageloaded.top[2] = render.load_image(response, imagesize.top[2])
		end
	),
		network.get(url.top[3], {}, function(response)
			imageloaded.top[3] = render.load_image(response, imagesize.top[3])
		end
	),
		network.get(url.top[4], {}, function(response)
			imageloaded.top[4] = render.load_image(response, imagesize.top[4])
		end
	),
	},
	left = {
		network.get(url.left[1], {}, function(response)
			imageloaded.left[1] = render.load_image(response, imagesize.left[1])
		end
	),
		network.get(url.left[2], {}, function(response)
			imageloaded.left[2] = render.load_image(response, imagesize.left[2])
		end
	),
		network.get(url.left[3], {}, function(response)
			imageloaded.left[3] = render.load_image(response, imagesize.left[3])
		end
	),
		network.get(url.left[4], {}, function(response)
			imageloaded.left[4] = render.load_image(response, imagesize.left[4])
		end
	),
		network.get(url.left[5], {}, function(response)
			imageloaded.left[5] = render.load_image(response, imagesize.left[5])
		end
	),
	},
	right = {
		network.get(url.right[1], {}, function(response)
			imageloaded.right[1] = render.load_image(response, imagesize.right[1])
		end
	),
		network.get(url.right[2], {}, function(response)
			imageloaded.right[2] = render.load_image(response, imagesize.right[2])
		end
	),
		network.get(url.right[3], {}, function(response)
			imageloaded.right[3] = render.load_image(response, imagesize.right[3])
		end
	),
		network.get(url.right[4], {}, function(response)
			imageloaded.right[4] = render.load_image(response, imagesize.right[4])
		end
	),
	}
}

events.render:set(function()
	local menu_pos = ui.get_position()
	local menu_size = ui.get_size()
	if ui.get_alpha() == 1 then
    	if combo[1]:get() == "Astolfo" then
                render.texture(imageloaded.top[1], vector(menu_pos.x, menu_pos.y-315)) 
                else if combo[1]:get() == "Megumin" then
                render.texture(imageloaded.top[2], vector(menu_pos.x+300, menu_pos.y-330)) 
                else if combo[1]:get() == "Rias DXD" then
                render.texture(imageloaded.top[3], vector(menu_pos.x+600, menu_pos.y-315))
                else if combo[1]:get() == "Sitting Loli" then
                render.texture(imageloaded.top[4], vector(menu_pos.x, menu_pos.y-304))
        end end end end
		if combo[2]:get() == "Eromanga Sensei" then
                render.texture(imageloaded.left[1], vector(menu_pos.x-imagesize.left[1].x, menu_pos.y + (menu_size.y - imagesize.left[1].y)), imagesize.left[1])
                else if combo[2]:get() ==  "Loli" then
                render.texture(imageloaded.left[2], vector(menu_pos.x-imagesize.left[2].x, menu_pos.y + (menu_size.y - imagesize.left[2].y)), imagesize.left[2])
                else if combo[2]:get() == "Neko Loli #1" then
                render.texture(imageloaded.left[3], vector(menu_pos.x-imagesize.left[3].x, menu_pos.y + (menu_size.y - imagesize.left[3].y)), imagesize.left[3])
                else if combo[2]:get() == "Neko Loli #2" then
                render.texture(imageloaded.left[4], vector(menu_pos.x-imagesize.left[4].x, menu_pos.y + (menu_size.y - imagesize.left[4].y)), imagesize.left[4])
                else if combo[2]:get() == "Hentai #1" then
                render.texture(imageloaded.left[5], vector(menu_pos.x-imagesize.left[5].x, menu_pos.y + (menu_size.y - imagesize.left[5].y)), imagesize.left[5])
                end end end end end
		if combo[3]:get() == "Kanzaki" then
                render.texture(imageloaded.right[1], vector(menu_pos.x + menu_size.x, menu_pos.y + (menu_size.y - imagesize.right[1].y)), imagesize.right[1])
                else if combo[3]:get() ==  "Neko Footfetish" then
                render.texture(imageloaded.right[2], vector(menu_pos.x + menu_size.x, menu_pos.y + (menu_size.y - imagesize.right[2].y)), imagesize.right[2])
                else if combo[3]:get() == "Swimsuit + stockings" then
                render.texture(imageloaded.right[3], vector(menu_pos.x + menu_size.x, menu_pos.y + (menu_size.y - imagesize.right[3].y)), imagesize.right[3])
                else if combo[3]:get() == "Mona Genshin" then
                render.texture(imageloaded.right[4], vector(menu_pos.x + menu_size.x, menu_pos.y + (menu_size.y - imagesize.right[4].y)), imagesize.right[4])
                end end end end
	end
end)