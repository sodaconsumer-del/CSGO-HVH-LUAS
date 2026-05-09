--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

if ffi == nil then
        return gui.notify:add(gui.notification("WARNING!", "ENABLE \"UNSAFE LOCAL SCRIPTS\" IN LUA SETTINGS AND RELOAD THE SCRIPT!", draw.textures.icon_close))
end

group = gui.ctx:find("lua>elements a")

group:Reset()

btn_get_weather = gui.Button("btn_get_weather", "Get Weather")
row_get_weather = gui.MakeControl("Weather", btn_get_weather)

group:Add(row_get_weather)
btn_get_weather:AddCallback(function()
        http.Get("https://ipapi.co/json/", {}, function(arg_2_0, arg_2_1)
                if arg_2_0 == 200 then
                        local var_2_0 = utils.JsonDecode(arg_2_1)

                        if var_2_0 and var_2_0.city then
                                local var_2_1 = var_2_0.city

                                print("===== Weather in: " .. var_2_1 .. " =====")

                                local var_2_2 = "https://wttr.in/" .. var_2_1 .. "?format=%c+%t+%f+%w+%h+%p+%P+%u+%m"

                                http.Get(var_2_2, {}, function(arg_3_0, arg_3_1)
                                        if arg_3_0 == 200 then
                                                local var_3_0 = {}

                                                for iter_3_0 in arg_3_1:gmatch("%S+") do
                                                        table.insert(var_3_0, iter_3_0)
                                                end

                                                print("Condition:      " .. (var_3_0[1] or "N/A"))
                                                print("Temperature:    " .. (var_3_0[2] or "N/A"))
                                                print("Feels like:     " .. (var_3_0[3] or "N/A"))
                                                print("Wind:           " .. (var_3_0[4] or "N/A"))
                                                print("Humidity:       " .. (var_3_0[5] or "N/A"))
                                                print("Precipitation:  " .. (var_3_0[6] or "N/A"))
                                                print("Pressure:       " .. (var_3_0[7] or "N/A"))
                                                print("Wind speed:     " .. (var_3_0[8] or "N/A"))
                                                print("=====================================")
                                        else
                                                print("Failed to get weather. Status: " .. tostring(arg_3_0))
                                        end
                                end)
                        else
                                print("Could not determine city")
                        end
                else
                        print("HTTP request failed with status: " .. tostring(arg_2_0))
                end
        end)
end)
