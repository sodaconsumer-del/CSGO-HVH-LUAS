local v0 = true;
local l_get_icon_0 = ui.get_icon;
local v2 = "\a2020FFC8A\a2828FFC8p\a3030FFC8p\a3838FFC8l\a4040FFC8e\a4848FFC8 \a5050FFC8I\a5858FFC8n\a6060FFC8t\a6868FFC8e\a7070FFC8l\a7878FFC8l\a8078FFC8i\a8868FFC8g\a9060FFC8e\a9848FFC8n\aA030FFC8c\aA818FFC8e\aFFFFFFC8";
print = function(v3, v4)
    -- upvalues: v2 (ref)
    if v3 == "successful" then
        print_raw("\aFFFFFFC8[" .. v2 .. "]: \a00ff09c8[Successful] \aFFFFFFC8" .. v4 .. "");
    elseif v3 == "error" then
        print_raw("\aFFFFFFC8[" .. v2 .. "]: \aff1100C8[Error] \aFFFFFFC8" .. v4 .. "");
    elseif v3 == "info" then
        print_raw("\aFFFFFFC8[" .. v2 .. "]: \abcbcbcc8[Info] \aFFFFFFC8" .. v4 .. "");
    elseif v3 == "warning" then
        print_raw("\aFFFFFFC8[" .. v2 .. "]: \aFFA500C8[Warning] \aFFFFFFC8" .. v4 .. "");
    else
        print_raw("\aFFFFFFC8[" .. v2 .. "]: \aFFA500C8[Warning] \aFFFFFFC8You for got to use [print(type, text)]");
    end;
end;
local v5 = false;
local function v6()
    -- upvalues: v5 (ref)
    v5 = ui.get_alpha() == 1;
end;
events.render:set(v6);
local v7 = {};
local v8 = render.screen_size();
v7.list = {};
v7.windows = {};
v7.__index = v7;
v7.register = function(v9, v10, v11, v12)
    -- upvalues: v7 (ref)
    local v13 = {
        is_dragging = false, 
        size = v10, 
        position = vector(v9[1]:get(), v9[2]:get()), 
        drag_position = vector(), 
        global_name = v11, 
        ins_function = v12, 
        ui_callbacks = {
            x = v9[1], 
            y = v9[2]
        }
    };
    table.insert(v7.windows, v13);
    return setmetatable(v13, v7);
end;
v7.limit_positions = function(v14)
    -- upvalues: v8 (ref)
    if v14.position.x <= 0 then
        v14.position.x = 0;
    end;
    if v14.position.x + v14.size.x >= v8.x - 1 then
        v14.position.x = v8.x - v14.size.x - 1;
    end;
    if v14.position.y <= 0 then
        v14.position.y = 0;
    end;
    if v14.position.y + v14.size.y >= v8.y - 1 then
        v14.position.y = v8.y - v14.size.y - 1;
    end;
end;
v7.is_in_area = function(v15, v16)
    return v16.x >= v15.position.x and v16.x <= v15.position.x + v15.size.x and v16.y >= v15.position.y and v16.y <= v15.position.y + v15.size.y;
end;
v7.update = function(v17, ...)
    -- upvalues: v5 (ref), v7 (ref)
    if v5 then
        local v18 = ui.get_mouse_position();
        local v19 = v17:is_in_area(v18);
        local l_list_0 = v7.list;
        local v21 = common.is_button_down(1);
        if (v19 or v17.is_dragging) and v21 and (l_list_0.target == "" or l_list_0.target == v17.global_name) then
            l_list_0.target = v17.global_name;
            if not v17.is_dragging then
                v17.is_dragging = true;
                v17.drag_position = v18 - v17.position;
            else
                v17.position = v18 - v17.drag_position;
                v17:limit_positions();
                v17.ui_callbacks.x:set(math.floor(v17.position.x));
                v17.ui_callbacks.y:set(math.floor(v17.position.y));
            end;
        elseif not v21 then
            l_list_0.target = "";
            v17.is_dragging = false;
            v17.drag_position = vector();
        end;
    end;
    v17:ins_function(...);
end;
v7.resize = function(v22, v23)
    if v23 and v23.x and v23.y then
        local l_x_0 = v23.x;
        local l_y_0 = v23.y;
        if tonumber(l_x_0) and tonumber(l_y_0) and l_x_0 > 0 and l_y_0 > 0 then
            v22.size = vector(l_x_0, l_y_0);
            v22:limit_positions();
            if v22.ui_callbacks.width and v22.ui_callbacks.height then
                v22.ui_callbacks.width:set(math.floor(v22.size.x));
                v22.ui_callbacks.height:set(math.floor(v22.size.y));
            end;
        else
            print("error", "Invalid size provided: x and y must be greater than zero and valid numbers.");
        end;
    else
        print("error", "Invalid size provided: Expected a vector with x and y properties, got:", v23);
    end;
end;
v7.on_config_load = function()
    -- upvalues: v7 (ref)
    for _, v27 in pairs(v7.windows) do
        local v28 = v27.ui_callbacks.x:get();
        local v29 = v27.ui_callbacks.y:get();
        local v30 = v27.ui_callbacks.width and v27.ui_callbacks.width:get() or v27.size.x;
        local v31 = v27.ui_callbacks.height and v27.ui_callbacks.height:get() or v27.size.y;
        if v28 ~= 0 and v29 ~= 0 then
            v27.position = vector(v28, v29);
        else
            print("error", "values of system windows are " .. v28 .. ", " .. v29 .. " expected not 0");
        end;
        if v30 and v31 then
            v27.size.x = v30;
            v27.size.y = v31;
        end;
    end;
end;
v7.set_position = function(v32, v33)
    if v33 and v33.x and v33.y then
        local l_x_1 = v33.x;
        local l_y_1 = v33.y;
        if tonumber(l_x_1) and tonumber(l_y_1) then
            v32.position = vector(l_x_1, l_y_1);
            v32:limit_positions();
            v32.ui_callbacks.x:set(math.floor(v32.position.x));
            v32.ui_callbacks.y:set(math.floor(v32.position.y));
        else
            print("error", "Invalid position provided: x and y must be valid numbers.");
        end;
    else
        print("error", "Invalid position provided: Expected a vector with x and y properties, got:", v33);
    end;
end;
local v36 = nil;
rgbToHex = function()
    -- upvalues: v36 (ref)
    componentToHex = function(v37)
        hex = string.format("%X", v37);
        return #hex == 1 and "0" .. hex or hex;
    end;
    LuaGetThemeColor = ui.get_style("Link Active");
    hexColor = componentToHex(LuaGetThemeColor.r) .. componentToHex(LuaGetThemeColor.g) .. componentToHex(LuaGetThemeColor.b);
    v36 = "\a" .. hexColor .. "C8";
end;
rgbToHex();
local v38 = {
    imports = {
        MTools = require("neverlose/mtools") or error("error Mtools require failed!"), 
        interface = require("neverlose/rich_presence") or error("error rich_presence require failed!"), 
        clipboard = require("neverlose/clipboard") or error("error clipboard require failed!"), 
        base64 = require("neverlose/base64") or error("error cipherer require failed!"), 
        json = require("neverlose/nl_json") or error("error nl_json require failed!")
    }, 
    uisidebar = {
        ui.sidebar(v2, "apple")
    }, 
    uicreate = {
        HomeUI6 = ui.create("Home", "", 1), 
        HomeUI1 = ui.create("Home", "" .. v36 .. "" .. l_get_icon_0("apple") .. " " .. v2 .. "", 1), 
        HomeUI2 = ui.create("Home", "" .. v36 .. "" .. l_get_icon_0("files") .. "\aDEFAULT Configurations", 2), 
        HomeUI3 = ui.create("Home", "" .. v36 .. "" .. l_get_icon_0("server") .. "\aDEFAULT  Server", 2), 
        HomeUI4 = ui.create("Home", "" .. v36 .. "" .. l_get_icon_0("cloud") .. "\aDEFAULT Icloud Configurations", 1), 
        Anti_AimUI1 = ui.create("Anti-Aim", "" .. l_get_icon_0("jet-fighter") .. " Aimbot", 1), 
        Anti_AimUI2 = ui.create("Anti-Aim", "" .. l_get_icon_0("user-shield") .. " Anti-Aimbot", 2), 
        Anti_AimUI3 = ui.create("Anti-Aim", "" .. l_get_icon_0("user-shield") .. " Anti-Aimbot Extras", 1), 
        VisualsUI2 = ui.create("Visuals", "" .. l_get_icon_0("arrows-to-eye") .. " Visuals", 2), 
        VisualsUI1 = ui.create("Visuals", "" .. l_get_icon_0("wand-magic-sparkles") .. " Etc", 1)
    }, 
    folders = {
        normalfl = files.create_folder("nl\\Apple Intelligence"), 
        cfgfl = files.create_folder("nl\\Apple Intelligence\\config"), 
        images = files.create_folder("nl\\Apple Intelligence\\images"), 
        fonts = files.create_folder("nl\\Apple Intelligence\\fonts"), 
        Temp = files.create_folder("nl\\Apple Intelligence\\Temp"), 
        info = files.create_folder("nl\\Apple Intelligence\\info")
    }
};
v38.imports.MTools.Network.Download("https://iili.io/2uN36xt.png", "nl\\Apple Intelligence\\images\\logo.png", true, 128);
v38.imports.MTools.Network.Download("https://github.com/OneDuz/applelua/raw/refs/heads/main/MYRIADPRO-REGULAR.OTF", "nl\\Apple Intelligence\\fonts\\iphone-regural.otf", true, 128);
v38.imports.MTools.Network.Download("https://github.com/OneDuz/applelua/raw/refs/heads/main/MYRIADPRO-BOLD.OTF", "nl\\Apple Intelligence\\fonts\\iphone-bold.otf", true, 128);
v38.imports.MTools.Network.Download("https://github.com/OneDuz/applelua/raw/refs/heads/main/MYRIADPRO-SEMIBOLD.OTF", "nl\\Apple Intelligence\\fonts\\iphone-semibold.otf", true, 128);
v38.imports.MTools.Network.Download("https://raw.githubusercontent.com/OneDuz/applelua/refs/heads/main/appleconfigs/default1.cfg", "nl\\Apple Intelligence\\config\\default1.cfg", true, 128);
v38.imports.MTools.Network.Download("https://raw.githubusercontent.com/OneDuz/applelua/refs/heads/main/appleconfigs/default2.cfg", "nl\\Apple Intelligence\\config\\default2.cfg", true, 128);
v38.rich_presence = {
    key = v38.imports.interface.SetKey("AppleAI1"), 
    delay = v38.imports.interface.SetRequestDelay(5)
};
v38.refs = {
    tp = ui.find("Visuals", "World", "Main", "Force Thirdperson"), 
    dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    dt_opt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    dt_fl = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"), 
    hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    pa = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    dmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    sw = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    fl = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
    fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    fs2 = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    fs3 = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
    avoidbackstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
    bodyywa = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    Pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    Yawbase = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    Yawoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    Yawmodifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    YawmodifierOffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    DesyncLeft = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    DesyncRight = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    Options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    Options2 = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    Freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    fp = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    dormant = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    hideshots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    mindamage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    fakelag = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
    freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    fakeping = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
    dormant = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
    safepoint = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
    bodyaim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
    hiddendefensive = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    bodyinevert = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter")
};
anti_aim_state = {};
anti_aim_state.FLAGS = {
    IN_AIR = 256, 
    DUCKING = 263, 
    ON_GROUND = 257, 
    IN_AIR_DUCKING = 262
};
anti_aim_state.STATES = {
    WALK = 2, 
    STAND = 1, 
    AIR_DUCK = 6, 
    AIR = 5, 
    DUCK = 4, 
    SLOW_WALK = 3
};
if not v0 then
    v38.server = {
        SereverResponseTime = network.get("https://applelua.cc/server-status"), 
        Disconnect = network.post("https://applelua.cc/user-disconnect", common.get_username(), {
            ["Content-Type"] = "text/plain"
        }), 
        Connected = network.post("https://applelua.cc/user-connected", common.get_username(), {
            ["Content-Type"] = "text/plain"
        }), 
        Heartbeat = network.post("https://applelua.cc/user-heartbeat", common.get_username(), {
            ["Content-Type"] = "text/plain"
        }), 
        GetUsers = network.get("https://applelua.cc/get-users")
    };
else
    v38.server = {};
end;
v38.locals = {
    animation_speed = 5, 
    slide_speed = 0.1, 
    extraaaexecutedalready = false, 
    extraaaexecutedalready2 = false, 
    extraaaexecutedalready3 = false, 
    shouldinvert = false, 
    resolveractive = false, 
    heighornormal = "Normal", 
    current_stage = 1, 
    extraaaexecutedalready5 = false, 
    extraaaexecutedalready4 = false, 
    p_state = 0, 
    max_text_size = 0, 
    has_logged_miss = false, 
    can_talk = true, 
    currentphrase = "", 
    Configlist = {
        [1] = "Empty"
    }, 
    CloudConfiglist = {
        [1] = "Empty"
    }, 
    player_states = {
        [1] = "Standing", 
        [2] = "Moving", 
        [3] = "Air", 
        [4] = "Air-Duck", 
        [5] = "Crouching", 
        [6] = "Slowwalk", 
        [7] = "Fake-Lag"
    }, 
    player_states_idx = {
        ["Fake-Lag"] = 7, 
        Slowwalk = 6, 
        Crouching = 5, 
        ["Air-Duck"] = 4, 
        Air = 3, 
        Moving = 2, 
        Standing = 1
    }, 
    tick_to_distance = {
        [1] = 0, 
        [2] = 0.33566926072059, 
        [3] = 0.90550823109139, 
        [4] = 1.7094571925458, 
        [5] = 2.7475758645732, 
        [6] = 4.0198045277169, 
        [7] = 5.5243356897069, 
        [8] = 7.2423273783409, 
        [9] = 9.1564213090631, 
        [10] = 11.250673856852, 
        [11] = 13.510480438002, 
        [12] = 15.922361837797, 
        [13] = 18.473989413581, 
        [14] = 21.153990043142, 
        [15] = 23.951936812474, 
        [16] = 26.858254779359, 
        [17] = 29.864120158319, 
        [18] = 32.961441695549, 
        [19] = 36.142785057665, 
        [20] = 39.401338315411, 
        [21] = 42.730817707458, 
        [22] = 46.125502156263, 
        [23] = 49.580063421207, 
        [24] = 53.08964170921, 
        [25] = 56.649735547569, 
        [26] = 60.256252190999, 
        [27] = 63.905432011078, 
        [28] = 67.59383918326, 
        [29] = 71.318242246617, 
        [30] = 75.075708340563, 
        [31] = 78.863628408227, 
        [32] = 82.67942790961, 
        [33] = 86.520915828495, 
        [34] = 90.385926351936, 
        [35] = 94.272651987509, 
        [36] = 98.17890171902, 
        [37] = 102.08515145053, 
        [38] = 105.99140118205, 
        [39] = 109.89765091356, 
        [40] = 113.80390064508, 
        [41] = 117.7101503766, 
        [42] = 121.61640010812, 
        [43] = 125.52264983965, 
        [44] = 129.42889957117, 
        [45] = 133.3351493027, 
        [46] = 137.24139903422, 
        [47] = 141.14764876575, 
        [48] = 145.05389849727, 
        [49] = 148.9601482288, 
        [50] = 152.86639796033, 
        [51] = 156.77264769186, 
        [52] = 160.67889742339, 
        [53] = 164.58514715492, 
        [54] = 168.49139688645, 
        [55] = 172.39764661798, 
        [56] = 176.30389634951, 
        [57] = 180.21014608104, 
        [58] = 184.11639581258, 
        [59] = 188.02264554411, 
        [60] = 191.92889527564, 
        [61] = 195.83514500718, 
        [62] = 199.74139473871, 
        [63] = 203.64764447024, 
        [64] = 207.55389420178
    }, 
    players_states = {}, 
    last_known_states = {}, 
    weapon_name_mappings = {
        weapon_awp = "AWP", 
        weapon_ssg08 = "SSG-08", 
        weapon_aug = "AUG/SG 553", 
        weapon_sg556 = "AUG/SG 553", 
        weapon_ak47 = "AK-47", 
        weapon_m4a1_silencer = "M4A1/M4A4", 
        weapon_m4a1 = "M4A1/M4A4", 
        weapon_galilar = "Rifles", 
        weapon_famas = "Rifles", 
        weapon_bizon = "SMGs", 
        weapon_p90 = "SMGs", 
        weapon_ump45 = "SMGs", 
        weapon_mp5sd = "SMGs", 
        weapon_mp7 = "SMGs", 
        weapon_mac10 = "SMGs", 
        weapon_mp9 = "SMGs", 
        weapon_revolver = "R8 Revolver", 
        weapon_deagle = "Desert Eagle", 
        weapon_cz75a = "Pistols", 
        weapon_tec9 = "Pistols", 
        weapon_fiveseven = "Pistols", 
        weapon_p250 = "Pistols", 
        weapon_usp_silencer = "Pistols", 
        weapon_hkp2000 = "Pistols", 
        weapon_glock = "Pistols", 
        weapon_taser = "Taser", 
        weapon_mag7 = "Shotguns", 
        weapon_sawedoff = "Shotguns", 
        weapon_xm1014 = "Shotguns", 
        weapon_nova = "Shotguns", 
        weapon_negev = "Machineguns", 
        weapon_m249 = "Machineguns", 
        weapon_scar20 = "AutoSnipers", 
        weapon_g3sg1 = "AutoSnipers"
    }, 
    last_states = {}, 
    missed_shots_logs = {}, 
    successful_shots_logs = {}, 
    player_headscales = {}, 
    aim_shot_logs = {}, 
    fade_values = {}, 
    current_binds = {}, 
    screensize = render.screen_size(), 
    logoimg = render.load_image_from_file("nl\\Apple Intelligence\\images\\logo.png"), 
    steamavatarlogo = v38.imports.MTools.Client.GetAvatar(3, false, vector(40, 40)), 
    fontnorml = render.load_font("nl\\Apple Intelligence\\fonts\\iphone-regural.otf", vector(12, 12), "a"), 
    fontsemibold = render.load_font("nl\\Apple Intelligence\\fonts\\iphone-semibold.otf", vector(12, 12), "a"), 
    fontbolt = render.load_font("nl\\Apple Intelligence\\fonts\\iphone-bold.otf", vector(12, 12), "a"), 
    lastusedcfg = files.read("nl\\Apple Intelligence\\info\\apple1.info"), 
    lastwhatcfg = files.read("nl\\Apple Intelligence\\info\\apple2.info"), 
    one_kill_phrases = {
        [1] = {
            [1] = "wallam you dead a aint we diffrent"
        }, 
        [2] = {
            [1] = "Hey you! what happened? get yourself https:// applelua .cc be happy"
        }, 
        [3] = {
            [1] = "Ayh ayh dog down soo sadd get yourself https:// applelua .cc"
        }, 
        [4] = {
            [1] = "i was drunk while coding this killsay"
        }, 
        [5] = {
            [1] = "i have best lua you dont we diffrent fix it get https:// applelua .cc"
        }, 
        [6] = {
            [1] = "OI DOINKED LIKE A BITCH"
        }, 
        [7] = {
            [1] = "that hs i gave you isnt even close enough in size on my weed collection"
        }, 
        [8] = {
            [1] = "that hs was nasty like your mother fatass"
        }
    }, 
    double_kill_phrases = {
        [1] = {
            [1] = "Boing Boing im playing with bots", 
            [2] = "oh wait hallam they real?"
        }, 
        [2] = {
            [1] = "Sorry", 
            [2] = "Wait no not sorry be dead:)"
        }, 
        [3] = {
            [1] = "Wallam fuckded", 
            [2] = "hard?"
        }, 
        [4] = {
            [1] = "womp womp someones father is gone", 
            [2] = "is it yours??"
        }, 
        [5] = {
            [1] = "im soo sorry", 
            [2] = "that you are black"
        }, 
        [6] = {
            [1] = "WHY WONT YOU ADOPT ME", 
            [2] = "BECAUSE YOU ARE BLACK hehe"
        }, 
        [7] = {
            [1] = "Destroyed", 
            [2] = "By https:// applelua .cc"
        }, 
        [8] = {
            [1] = "dont be shy come here", 
            [2] = "if you can come from the dead ofc"
        }
    }, 
    triple_kill_phrases = {
        [1] = {
            [1] = "hallam you died", 
            [2] = "get in the meta get", 
            [3] = "https:// applelua .cc"
        }, 
        [2] = {
            [1] = "Ill call the ambulance for you", 
            [2] = "nvm you already dead asf bye", 
            [3] = "woops"
        }, 
        [3] = {
            [1] = "hey there how are you", 
            [2] = "you are dead?", 
            [3] = "that cant be nvm im using the best lua https:// applelua .cc"
        }, 
        [4] = {
            [1] = "walla you dead?", 
            [2] = "Press [F] to pay respects", 
            [3] = "i press skip cutscene"
        }
    }, 
    antiaimdelay = {
        defpitch = common.get_timestamp(), 
        defmode = common.get_timestamp(), 
        defpitch2 = common.get_timestamp(), 
        defmode2 = common.get_timestamp(), 
        defpitch3 = common.get_timestamp(), 
        defpitch4 = common.get_timestamp(), 
        tpspammer = common.get_timestamp(), 
        tpspammer2 = common.get_timestamp()
    }
};
v38.uicreates = {
    HomeUI1 = {
        MainPagesel = v38.uicreate.HomeUI6:list("", {
            [1] = "Info", 
            [2] = "Config"
        }), 
        mainslider1 = v38.uicreate.HomeUI1:label("Welcome to Apple Intelligence Anti-Aim! We use advanced algorithms and mathematical models for anti-aim, rage bot, and visual assistance.")
    }, 
    HomeUI2 = {
        CfgList = v38.uicreate.HomeUI2:list("", v38.locals.Configlist), 
        Loadedcfg = v38.uicreate.HomeUI2:label("Currently Loaded: " .. v36 .. "" .. l_get_icon_0("loader") .. "\aDEFAULT "), 
        InputCFG = v38.uicreate.HomeUI2:input("" .. v36 .. "" .. l_get_icon_0("input-text") .. "\aDEFAULT Config Name"), 
        Save = v38.uicreate.HomeUI2:button("   Save " .. l_get_icon_0("download") .. "   "), 
        Load = v38.uicreate.HomeUI2:button("   Load " .. l_get_icon_0("upload") .. "   "), 
        Delete = v38.uicreate.HomeUI2:button("   Delete " .. l_get_icon_0("trash") .. "   "), 
        Import = v38.uicreate.HomeUI2:button("         Import " .. l_get_icon_0("share") .. "         "), 
        Export = v38.uicreate.HomeUI2:button("         Export " .. l_get_icon_0("file-import") .. "         ")
    }, 
    HomeUI3 = {
        ServerData = v38.uicreate.HomeUI3:label("")
    }, 
    HomeUI4 = {
        CfgList = v38.uicreate.HomeUI4:list("", v38.locals.CloudConfiglist), 
        Loadedcfg = v38.uicreate.HomeUI4:label("CCurrently Loaded: " .. v36 .. "" .. l_get_icon_0("loader") .. "\aDEFAULT "), 
        InputCFG = v38.uicreate.HomeUI4:input("" .. v36 .. "" .. l_get_icon_0("input-text") .. "\aDEFAULT Config Name"), 
        Save = v38.uicreate.HomeUI4:button("   Save " .. l_get_icon_0("download") .. "   "), 
        Load = v38.uicreate.HomeUI4:button("   Load " .. l_get_icon_0("upload") .. "   "), 
        Delete = v38.uicreate.HomeUI4:button("   Delete " .. l_get_icon_0("trash") .. "   ")
    }, 
    HomeUI5 = {
        DiscordLink = v38.uicreate.HomeUI1:button("Discord " .. l_get_icon_0("discord") .. ""), 
        Websitelink = v38.uicreate.HomeUI1:button("Website " .. l_get_icon_0("browser") .. ""), 
        WebtokenLink = v38.uicreate.HomeUI1:button("Invite Code " .. l_get_icon_0("browser") .. "")
    }, 
    VisualsUI1 = {
        Keybinds = v38.uicreate.VisualsUI2:switch("" .. v36 .. "" .. l_get_icon_0("list-dropdown") .. "\aDEFAULT Keybinds", false), 
        Spectators = v38.uicreate.VisualsUI2:switch("" .. v36 .. "" .. l_get_icon_0("ghost") .. "\aDEFAULT Spectators", false), 
        Idealtick = v38.uicreate.VisualsUI2:switch("" .. v36 .. "" .. l_get_icon_0("transporter-3") .. "\aDEFAULT Ideal tick", false), 
        forcepredict = v38.uicreate.VisualsUI2:switch("" .. v36 .. "" .. l_get_icon_0("bullseye-arrow") .. "\aDEFAULT Force Prediction", false), 
        notifications = v38.uicreate.VisualsUI2:switch("" .. v36 .. "" .. l_get_icon_0("octagon-xmark") .. "\aDEFAULT Iphone Notifications", false), 
        consolelogsragebot = v38.uicreate.VisualsUI2:switch("" .. v36 .. "" .. l_get_icon_0("octagon-xmark") .. "\aDEFAULT Ragebot Console Logs", false), 
        crosshair_ind = v38.uicreate.VisualsUI2:switch("" .. v36 .. "" .. l_get_icon_0("panel-fire") .. "\aDEFAULT Crosshair Indicators", false), 
        infopanel = v38.uicreate.VisualsUI2:switch("" .. v36 .. "" .. l_get_icon_0("panel-fire") .. "\aDEFAULT Info Panel", false), 
        Viewmodel = v38.uicreate.VisualsUI2:switch("" .. v36 .. "" .. l_get_icon_0("street-view") .. "\aDEFAULT Viewmodel", false), 
        AspectRatio = v38.uicreate.VisualsUI2:slider("" .. v36 .. "" .. l_get_icon_0("expand-wide") .. "\aDEFAULT Aspect Ratio", 0, 200, 0, 0.01, function(v39)
            if v39 == 0 then
                return "Off";
            else
                return;
            end;
        end)
    }, 
    VisualsUI2 = {
        Clantag = v38.uicreate.VisualsUI1:switch("" .. v36 .. "" .. l_get_icon_0("flag-usa") .. "\aDEFAULT Clantag", false), 
        DropNades = v38.uicreate.VisualsUI1:switch("" .. v36 .. "" .. l_get_icon_0("bomb") .. "\aDEFAULT Quick Drop", false), 
        NadeFix = v38.uicreate.VisualsUI1:switch("" .. v36 .. "" .. l_get_icon_0("wrench") .. "\aDEFAULT Nade Fix", false), 
        TrashTalk = v38.uicreate.VisualsUI1:switch("" .. v36 .. "" .. l_get_icon_0("face-nose-steam") .. "\aDEFAULT TrashTalk", false), 
        FastLadder = v38.uicreate.VisualsUI1:switch("" .. v36 .. "" .. l_get_icon_0("water-ladder") .. "\aDEFAULT Fast Ladder", false), 
        Fakepingunlocker = v38.uicreate.VisualsUI2:slider("" .. v36 .. "" .. l_get_icon_0("wifi") .. "\aDEFAULT Ping Unlocker", 20, 70, 0, 0.1, function(v40)
            if v40 == 20 then
                return "Off";
            else
                return;
            end;
        end)
    }, 
    Anti_AimUI1 = {
        Idealtickhelper = v38.uicreate.Anti_AimUI1:switch("" .. v36 .. "" .. l_get_icon_0("poo-storm") .. "\aDEFAULT Ideal tick helper", false), 
        Resolver = v38.uicreate.Anti_AimUI1:switch("" .. v36 .. "" .. l_get_icon_0("cross") .. "\aDEFAULT Ragebot Improvements", false), 
        Jumpscout = v38.uicreate.Anti_AimUI1:switch("" .. v36 .. "" .. l_get_icon_0("cloud-bolt") .. "\aDEFAULT Jumpscout", false)
    }, 
    Anti_AimUI2 = {}, 
    Anti_AimUI3 = {
        extras = v38.uicreate.Anti_AimUI3:selectable("" .. v36 .. "" .. l_get_icon_0("ufo") .. "\aDEFAULT Extras", {
            [1] = "TP-Spammer", 
            [2] = "Better Air-Duck", 
            [3] = "Air Lag!"
        }), 
        Defensive_Flick = v38.uicreate.Anti_AimUI3:switch("Defensive Flick FUN!", false), 
        FreestandingBetter = v38.uicreate.Anti_AimUI3:switch("Freestanding", false)
    }
};
v38.groups = {
    idealtickerhelper_group = v38.uicreates.Anti_AimUI1.Idealtickhelper:create(), 
    Keybinds_group = v38.uicreates.VisualsUI1.Keybinds:create(), 
    forcepredict_group = v38.uicreates.VisualsUI1.forcepredict:create(), 
    resolver_group = v38.uicreates.Anti_AimUI1.Resolver:create(), 
    Jumpscout_group = v38.uicreates.Anti_AimUI1.Jumpscout:create(), 
    Extras_group = v38.uicreates.Anti_AimUI3.extras:create(), 
    Defensive_Flick_group = v38.uicreates.Anti_AimUI3.Defensive_Flick:create(), 
    FreestandingBetter_group = v38.uicreates.Anti_AimUI3.FreestandingBetter:create(), 
    Notifications_group = v38.uicreates.VisualsUI1.notifications:create(), 
    Viewmodel_group = v38.uicreates.VisualsUI1.Viewmodel:create()
};
v38.groups.Anti_AimUI1 = {
    warning = v38.groups.idealtickerhelper_group:label("If you experience FPS drops while using this, please check the [Render Check Positions]. It will show how many checks are being performed\226\128\148the fewer the checks, the higher the FPS; the more checks, the greater the accuracy."), 
    stepzise = v38.groups.idealtickerhelper_group:slider("step size", 0, 50, 15), 
    maxdistance = v38.groups.idealtickerhelper_group:slider("max distance", 0, 200, 57), 
    debugrenderhelper = v38.groups.idealtickerhelper_group:switch("Render check positions", false), 
    colorpickerhelper = v38.groups.idealtickerhelper_group:color_picker("Color picker"), 
    Resolverlabel1 = v38.groups.resolver_group:label("The Ragebot Improvements is currently in beta and may reduce FPS, but it enhances cheat performance."), 
    Resolverlabel2 = v38.groups.resolver_group:label("Version: 0.4\nBuild: EARLY ACCESS"), 
    forceresetresolverdata = v38.groups.resolver_group:button("Force reset resolver data"), 
    resolverversion = v38.groups.resolver_group:combo("Version", "V1", "V2"), 
    Resolverguns = v38.groups.resolver_group:selectable("Resolver boost on", {
        [1] = "Pistols", 
        [2] = "AutoSnipers", 
        [3] = "AWP", 
        [4] = "SSG-08", 
        [5] = "Desert Eagle", 
        [6] = "Snipers", 
        [7] = "Rifles", 
        [8] = "SMGs", 
        [9] = "Shotguns", 
        [10] = "Machineguns", 
        [11] = "AK-47", 
        [12] = "M4A1/M4A4", 
        [13] = "R8 Revolver", 
        [14] = "AUG/SG 553", 
        [15] = "Taser [BODY RESOLVER]"
    }), 
    jumpscout_select1 = v38.groups.Jumpscout_group:selectable("Conditions", {
        [1] = "Air", 
        [2] = "Air Duck"
    }, 0), 
    jumpscout_select2 = v38.groups.Jumpscout_group:combo("Settings", "Preset Dev", "Preset Dev2")
};
v38.groups.Anti_AimUI3 = {
    LCbreakDelay = v38.groups.Extras_group:combo("Delay", "Ticks", "Milliseconds"), 
    LCbreakmethod = v38.groups.Extras_group:combo("Method", "1", "2"), 
    LCbreakTicks = v38.groups.Extras_group:slider("TP-Spammer Ticks", 1, 28, 21, nil, function(v41)
        if v41 == 21 then
            return "Default";
        else
            return "" .. v41 .. "t";
        end;
    end), 
    LCbreakms = v38.groups.Extras_group:slider("TP-Spammer MS", 1, 4000, 1000, nil, function(v42)
        return "" .. v42 .. "ms";
    end), 
    FreestandingBetterconditions = v38.groups.FreestandingBetter_group:selectable("Conditions:", {
        [1] = "Standing", 
        [2] = "Moving", 
        [3] = "Air", 
        [4] = "Air-Duck", 
        [5] = "Crouching", 
        [6] = "Slowwalk"
    }, 0), 
    FreestandingBetterDisablers = v38.groups.FreestandingBetter_group:selectable("Disablers:", {
        [1] = "Enemy below", 
        [2] = "Enemy too close", 
        [3] = "Enemy Visable"
    }, 0), 
    Defensive_Flicksides = v38.groups.Defensive_Flick_group:switch("Switch sides", false), 
    Defensive_Flickconditions = v38.groups.Defensive_Flick_group:selectable("Conditions:", {
        [1] = "Standing", 
        [2] = "Moving", 
        [3] = "Air", 
        [4] = "Air-Duck", 
        [5] = "Crouching", 
        [6] = "Slowwalk"
    }, 0)
};
v38.groups.VisualsUI1 = {
    locationx = v38.groups.Keybinds_group:slider("Position X", 0, v38.locals.screensize.x), 
    locationy = v38.groups.Keybinds_group:slider("Position Y", 0, v38.locals.screensize.y), 
    locationx2 = v38.groups.Keybinds_group:slider("Position X2", 0, v38.locals.screensize.x), 
    locationy2 = v38.groups.Keybinds_group:slider("Position Y2", 0, v38.locals.screensize.y), 
    locationx3 = v38.groups.Keybinds_group:slider("Position X3", 0, v38.locals.screensize.x), 
    locationy3 = v38.groups.Keybinds_group:slider("Position Y3", 0, v38.locals.screensize.y), 
    locationx4 = v38.groups.Keybinds_group:slider("Position X4", 0, v38.locals.screensize.x), 
    locationy4 = v38.groups.Keybinds_group:slider("Position Y4", 0, v38.locals.screensize.y), 
    locationx5 = v38.groups.Keybinds_group:slider("Position X5", 0, v38.locals.screensize.x), 
    locationy5 = v38.groups.Keybinds_group:slider("Position Y5", 0, v38.locals.screensize.y), 
    colorpicker1 = v38.groups.Keybinds_group:color_picker("Color lines", color(255, 255, 255, 255)), 
    colorpicker2 = v38.groups.Keybinds_group:color_picker("Color background", color(255, 255, 255, 50)), 
    colorpicker3 = v38.groups.Keybinds_group:color_picker("Color text", color(255, 255, 255, 255)), 
    colorpicker4 = v38.groups.Keybinds_group:color_picker("Color glow", color(255, 255, 255, 255)), 
    glowheader = v38.groups.Keybinds_group:switch("Glow", false), 
    glowbindsthickness2 = v38.groups.Keybinds_group:slider("Glow intensity", 0, 10, 1, 0.1), 
    diffrentcolors = v38.groups.Keybinds_group:switch("Change binds color", false), 
    colorpicker5 = v38.groups.Keybinds_group:color_picker("Color lines BINDS", color(255, 255, 255, 255)), 
    colorpicker6 = v38.groups.Keybinds_group:color_picker("Color background BINDS", color(255, 255, 255, 50)), 
    colorpicker7 = v38.groups.Keybinds_group:color_picker("Color text BINDS", color(255, 255, 255, 255)), 
    colorpicker8 = v38.groups.Keybinds_group:color_picker("Color glow BINDS", color(255, 255, 255, 255)), 
    glowbinds = v38.groups.Keybinds_group:switch("Glow on BINDS", false), 
    glowbindsthickness = v38.groups.Keybinds_group:slider("Glow intensity", 0, 10, 1, 0.1), 
    showvalues = v38.groups.Keybinds_group:switch("Show bind values", false), 
    aheadforpred = v38.groups.forcepredict_group:slider("Ahead", -64, 64, -2), 
    colorpickernotify = v38.groups.Notifications_group:color_picker("Color", color(0, 0, 0, 255)), 
    glownotify = v38.groups.Notifications_group:switch("Glow", false), 
    showavatars = v38.groups.Notifications_group:switch("Show Steam avatars", false), 
    glownotifysthickness = v38.groups.Notifications_group:slider("Glow intensity", 0, 100, 1, 1), 
    glowcolornotify = v38.groups.Notifications_group:color_picker("Glow Color", color(0, 0, 0, 255)), 
    Textcolornotify = v38.groups.Notifications_group:color_picker("Text Color", color(255, 255, 255, 255)), 
    viewmodel_fov = v38.groups.Viewmodel_group:slider("FOV", -100, 100, 68), 
    viewmodel_x = v38.groups.Viewmodel_group:slider("X", -100, 100, 2.5), 
    viewmodel_y = v38.groups.Viewmodel_group:slider("Y", -100, 100, 0), 
    viewmodel_z = v38.groups.Viewmodel_group:slider("Z", -100, 100, -1.5)
};
Antiaim = {};
Defensive_AA = {};
Yawmode_AA = {};
Yawmodifier_AA = {};
Desync_AA = {};
yawmode_groupo = {};
Yawmodifier_groupo = {};
defensive_aa_group = {};
Antiaim2 = {};
Defensive_AA2 = {};
Yawmode_AA2 = {};
Yawmodifier_AA2 = {};
Desync_AA2 = {};
yawmode_groupo2 = {};
Yawmodifier_groupo2 = {};
defensive_aa_group2 = {};
Antiaim[0] = {
    enable_antiaim = v38.uicreate.Anti_AimUI2:switch("" .. v36 .. "" .. l_get_icon_0("shield") .. "\aDEFAULT Enable Anti-Aim"), 
    antiaim_tab2 = v38.uicreate.Anti_AimUI2:combo("" .. v36 .. "" .. l_get_icon_0("person-running") .. "\aDEFAULT Anti-Aim:", "Normal", "High advantage"), 
    enable_antiaim3 = v38.uicreate.Anti_AimUI2:switch("" .. v36 .. "" .. l_get_icon_0("shield") .. "\aDEFAULT Enable Normal"), 
    enable_antiaim2 = v38.uicreate.Anti_AimUI2:switch("" .. v36 .. "" .. l_get_icon_0("shield") .. "\aDEFAULT Enable High Advantage"), 
    Vertical_Advantage = v38.uicreate.Anti_AimUI2:slider("" .. v36 .. "" .. l_get_icon_0("shield") .. "\aDEFAULT Vertical Advantage", 5, 100, 20, nil, function(v43)
        return "" .. v43 .. "units";
    end), 
    antiaim_tab = v38.uicreate.Anti_AimUI2:combo("" .. v36 .. "" .. l_get_icon_0("person-running") .. "\aDEFAULT Condition:", v38.locals.player_states), 
    antiaim_tab3 = v38.uicreate.Anti_AimUI2:combo("" .. v36 .. "" .. l_get_icon_0("person-running") .. "\aDEFAULT Condition:", v38.locals.player_states)
};
for v44 = 1, 7 do
    Antiaim[v44] = {
        antiaim_mode = v38.uicreate.Anti_AimUI2:combo("" .. v36 .. "" .. l_get_icon_0("rotate-exclamation") .. "\aDEFAULT Anti-Aim mode", "L&R", "Delay", "Tick-Switcher", "Sway", "3-Way", "5-Way", "Slow Yaw", "100-Way"), 
        Jitter_Mode = v38.uicreate.Anti_AimUI2:combo("" .. v36 .. "" .. l_get_icon_0("street-view") .. "\aDEFAULT Yaw modifier", "Disabled", "Center", "Offset"), 
        BodyYaw = v38.uicreate.Anti_AimUI2:switch("" .. v36 .. "" .. l_get_icon_0("rotate") .. "\aDEFAULT Body Yaw"), 
        Defensive_AA = v38.uicreate.Anti_AimUI2:switch("" .. v36 .. "" .. l_get_icon_0("odysee") .. "\aDEFAULT Defensive AA")
    };
    Antiaim2[v44] = {
        antiaim_mode = v38.uicreate.Anti_AimUI2:combo("" .. v36 .. "" .. l_get_icon_0("rotate-exclamation") .. "\aDEFAULT Anti-Aim mode", "L&R", "Delay", "Tick-Switcher", "Sway", "3-Way", "5-Way", "Slow Yaw", "100-Way"), 
        Jitter_Mode = v38.uicreate.Anti_AimUI2:combo("" .. v36 .. "" .. l_get_icon_0("street-view") .. "\aDEFAULT Yaw modifier", "Disabled", "Center", "Offset"), 
        BodyYaw = v38.uicreate.Anti_AimUI2:switch("" .. v36 .. "" .. l_get_icon_0("rotate") .. "\aDEFAULT Body Yaw"), 
        Defensive_AA = v38.uicreate.Anti_AimUI2:switch("" .. v36 .. "" .. l_get_icon_0("odysee") .. "\aDEFAULT Defensive AA")
    };
    yawmode_groupo = Antiaim[v44].antiaim_mode:create();
    Yawmode_AA[v44] = {
        Yaw_Base = yawmode_groupo:combo("Yaw Base", "At Target", "Local View"), 
        Yaw_Left = yawmode_groupo:slider("Yaw Left", -180, 180, 0), 
        Yaw_Right = yawmode_groupo:slider("Yaw Right", -180, 180, 0), 
        f_offset = yawmode_groupo:slider("5-Way Offset", -180, 180, 0), 
        t_offset = yawmode_groupo:slider("3-Way Offset", -180, 180, 0), 
        Tickswitch = yawmode_groupo:slider("Switch in ticks", 1, 30, 15, 1, function(v45)
            if v45 == 15 then
                return "NL";
            else
                return "" .. v45 .. "t";
            end;
        end)
    };
    yawmode_groupo2 = Antiaim2[v44].antiaim_mode:create();
    Yawmode_AA2[v44] = {
        Yaw_Base = yawmode_groupo2:combo("Yaw Base", "At Target", "Local View"), 
        Yaw_Left = yawmode_groupo2:slider("Yaw Left", -180, 180, 0), 
        Yaw_Right = yawmode_groupo2:slider("Yaw Right", -180, 180, 0), 
        f_offset = yawmode_groupo2:slider("5-Way Offset", -180, 180, 0), 
        t_offset = yawmode_groupo2:slider("3-Way Offset", -180, 180, 0), 
        Tickswitch = yawmode_groupo2:slider("Switch in ticks", 1, 30, 15, 1, function(v46)
            if v46 == 15 then
                return "NL";
            else
                return "" .. v46 .. "t";
            end;
        end)
    };
    Yawmodifier_groupo = Antiaim[v44].BodyYaw:create();
    Desync_AA[v44] = {
        Options = Yawmodifier_groupo:selectable("Options", "Avoid Overlap", "Jitter", "Randomize Jitter", "Anti Bruteforce"), 
        Freestanding = Yawmodifier_groupo:combo("Freestanding", "Off", "Peek Fake", "Peek Real"), 
        Desync_switch = Yawmodifier_groupo:combo("Desync Type", {
            [1] = "Static", 
            [2] = "Jitter", 
            [3] = "Random", 
            [4] = "Switch"
        }), 
        Tickswitch = Yawmodifier_groupo:slider("Switch in ticks", 1, 30, 15, 1, function(v47)
            if v47 == 15 then
                return "NL";
            else
                return "" .. v47 .. "t";
            end;
        end), 
        Desync_Leftswitch1 = Yawmodifier_groupo:slider("Switch1 Left Value", 0, 60, 58), 
        Desync_Rightswitch1 = Yawmodifier_groupo:slider("Switch1 Right Value", 0, 60, 58), 
        Desync_Leftswitch2 = Yawmodifier_groupo:slider("Switch2 Left Value", 0, 60, 58), 
        Desync_Rightswitch2 = Yawmodifier_groupo:slider("Switch2 Right Value", 0, 60, 58), 
        Desync_Left = Yawmodifier_groupo:slider("Desync Left Value", 0, 60, 58), 
        Desync_Right = Yawmodifier_groupo:slider("Desync Right Value", 0, 60, 58), 
        Inveter = Yawmodifier_groupo:switch("Inverter")
    };
    Yawmodifier_groupo2 = Antiaim2[v44].BodyYaw:create();
    Desync_AA2[v44] = {
        Options = Yawmodifier_groupo2:selectable("Options", "Avoid Overlap", "Jitter", "Randomize Jitter", "Anti Bruteforce"), 
        Freestanding = Yawmodifier_groupo2:combo("Freestanding", "Off", "Peek Fake", "Peek Real"), 
        Desync_switch = Yawmodifier_groupo2:combo("Desync Type", {
            [1] = "Static", 
            [2] = "Jitter", 
            [3] = "Random", 
            [4] = "Switch"
        }), 
        Tickswitch = Yawmodifier_groupo2:slider("Switch in ticks", 1, 30, 15, 1, function(v48)
            if v48 == 15 then
                return "NL";
            else
                return "" .. v48 .. "t";
            end;
        end), 
        Desync_Leftswitch1 = Yawmodifier_groupo2:slider("Switch1 Left Value", 0, 60, 58), 
        Desync_Rightswitch1 = Yawmodifier_groupo2:slider("Switch1 Right Value", 0, 60, 58), 
        Desync_Leftswitch2 = Yawmodifier_groupo2:slider("Switch2 Left Value", 0, 60, 58), 
        Desync_Rightswitch2 = Yawmodifier_groupo2:slider("Switch2 Right Value", 0, 60, 58), 
        Desync_Left = Yawmodifier_groupo2:slider("Desync Left Value", 0, 60, 58), 
        Desync_Right = Yawmodifier_groupo2:slider("Desync Right Value", 0, 60, 58), 
        Inveter = Yawmodifier_groupo2:switch("Inverter")
    };
    Yawmodifier_groupo = Antiaim[v44].Jitter_Mode:create();
    Yawmodifier_AA[v44] = {
        Jitter_Value = Yawmodifier_groupo:slider("Yaw modifier offset", -180, 180, 0)
    };
    Yawmodifier_groupo2 = Antiaim2[v44].Jitter_Mode:create();
    Yawmodifier_AA2[v44] = {
        Jitter_Value = Yawmodifier_groupo2:slider("Yaw modifier offset", -180, 180, 0)
    };
    defensive_aa_group = Antiaim[v44].Defensive_AA:create();
    Defensive_AA[v44] = {
        defensive_mode = defensive_aa_group:combo("Defensive mode", "L&R", "Tick-Switcher", "MS-Switcher", "Normal", "100-Way", "Mental Mode"), 
        defensive_mode_offset = defensive_aa_group:slider("Mode Offset", -180, 180, 0), 
        defensive_mode_Left = defensive_aa_group:slider("Mode Left", -180, 180, 0), 
        defensive_mode_Right = defensive_aa_group:slider("Mode Right", -180, 180, 0), 
        defensive_mode_f = defensive_aa_group:slider("5-Way Offset", -180, 180, 0), 
        defensive_mode_t = defensive_aa_group:slider("3-Way Offset", -180, 180, 0), 
        defensive_tick_mode = defensive_aa_group:slider("T Switch [MODE]", 1, 30, 15, 1, function(v49)
            if v49 == 15 then
                return "NL";
            else
                return "" .. v49 .. "t";
            end;
        end), 
        defensive_MS_mode = defensive_aa_group:slider("MS Switch [MODE]", 1, 5000, 500, 1, function(v50)
            return "" .. v50 .. "MS";
        end), 
        defensive_tick_mode2 = defensive_aa_group:slider("T Switch [MODE]", 1, 30, 15, 1, function(v51)
            if v51 == 15 then
                return "NL";
            else
                return "" .. v51 .. "t";
            end;
        end), 
        defensive_pitch = defensive_aa_group:combo("Pitch", {
            [1] = "Disabled", 
            [2] = "Down", 
            [3] = "Fake Down", 
            [4] = "Fake Up", 
            [5] = "MS-Switcher", 
            [6] = "Custom", 
            [7] = "Mental Mode"
        }), 
        defensive_tick_pitch = defensive_aa_group:slider("T Switch [PITCH]", 1, 30, 15, 1, function(v52)
            if v52 == 15 then
                return "NL";
            else
                return "" .. v52 .. "t";
            end;
        end), 
        defensive_MS_pitch = defensive_aa_group:slider("MS Switch [MODE]", 1, 5000, 500, 1, function(v53)
            return "" .. v53 .. "MS";
        end), 
        defensive_tick_pitch2 = defensive_aa_group:slider("T Switch [PITCH]", 1, 30, 15, 1, function(v54)
            if v54 == 15 then
                return "NL";
            else
                return "" .. v54 .. "t";
            end;
        end), 
        defensive_pitch_Left = defensive_aa_group:slider("Pitch 1", -89, 89, 0), 
        defensive_pitch_Right = defensive_aa_group:slider("Pitch 2", -89, 89, 0)
    };
    defensive_aa_group2 = Antiaim2[v44].Defensive_AA:create();
    Defensive_AA2[v44] = {
        defensive_mode = defensive_aa_group2:combo("Defensive mode", "L&R", "Tick-Switcher", "MS-Switcher", "Normal", "100-Way", "Mental Mode"), 
        defensive_mode_offset = defensive_aa_group2:slider("Mode Offset", -180, 180, 0), 
        defensive_mode_Left = defensive_aa_group2:slider("Mode Left", -180, 180, 0), 
        defensive_mode_Right = defensive_aa_group2:slider("Mode Right", -180, 180, 0), 
        defensive_mode_f = defensive_aa_group2:slider("5-Way Offset", -180, 180, 0), 
        defensive_mode_t = defensive_aa_group2:slider("3-Way Offset", -180, 180, 0), 
        defensive_tick_mode = defensive_aa_group2:slider("T Switch [MODE]", 1, 30, 15, 1, function(v55)
            if v55 == 15 then
                return "NL";
            else
                return "" .. v55 .. "t";
            end;
        end), 
        defensive_MS_mode = defensive_aa_group2:slider("MS Switch [MODE]", 1, 5000, 500, 1, function(v56)
            return "" .. v56 .. "MS";
        end), 
        defensive_tick_mode2 = defensive_aa_group2:slider("T Switch [MODE]", 1, 30, 15, 1, function(v57)
            if v57 == 15 then
                return "NL";
            else
                return "" .. v57 .. "t";
            end;
        end), 
        defensive_pitch = defensive_aa_group2:combo("Pitch", {
            [1] = "Disabled", 
            [2] = "Down", 
            [3] = "Fake Down", 
            [4] = "Fake Up", 
            [5] = "MS-Switcher", 
            [6] = "Custom", 
            [7] = "Mental Mode"
        }), 
        defensive_tick_pitch = defensive_aa_group2:slider("T Switch [PITCH]", 1, 30, 15, 1, function(v58)
            if v58 == 15 then
                return "NL";
            else
                return "" .. v58 .. "t";
            end;
        end), 
        defensive_MS_pitch = defensive_aa_group2:slider("MS Switch [MODE]", 1, 5000, 500, 1, function(v59)
            return "" .. v59 .. "MS";
        end), 
        defensive_tick_pitch2 = defensive_aa_group2:slider("T Switch [PITCH]", 1, 30, 15, 1, function(v60)
            if v60 == 15 then
                return "NL";
            else
                return "" .. v60 .. "t";
            end;
        end), 
        defensive_pitch_Left = defensive_aa_group2:slider("Pitch 1", -89, 89, 0), 
        defensive_pitch_Right = defensive_aa_group2:slider("Pitch 2", -89, 89, 0)
    };
end;
v38.Luafunctions = {
    animateTyping = function(v61, v62)
        local v63 = 0.1;
        local v64 = 0;
        local v65 = 0;
        local v66 = "";
        local v67 = false;
        (function()
            -- upvalues: v67 (ref), v65 (ref), v63 (ref), v64 (ref), v61 (ref), v66 (ref), v62 (ref)
            if v67 then
                return;
            else
                v67 = true;
                local function v68()
                    -- upvalues: v65 (ref), v63 (ref), v64 (ref), v61 (ref), v66 (ref), v62 (ref), v68 (ref), v67 (ref)
                    v65 = v65 + v63;
                    local v69 = math.floor(v65 / v63);
                    if v64 < v69 then
                        local l_v61_0 = v61;
                        if l_v61_0:sub(-4) == ".cfg" then
                            l_v61_0 = l_v61_0:sub(1, -5);
                        end;
                        v66 = l_v61_0.sub(l_v61_0, 1, v69);
                        v62:set(v66);
                        v64 = v69;
                    end;
                    if v69 < #v61 then
                        utils.execute_after(v63, function()
                            -- upvalues: v68 (ref)
                            v68();
                        end);
                    else
                        v67 = false;
                    end;
                end;
                if v67 then
                    v67 = false;
                    v64 = 0;
                    v65 = 0;
                end;
                v68();
                return;
            end;
        end)();
    end, 
    animateTyping2 = function(v71, v72)
        local v73 = 0.1;
        local v74 = 0;
        local v75 = 0;
        local v76 = "";
        local v77 = false;
        (function()
            -- upvalues: v77 (ref), v75 (ref), v73 (ref), v74 (ref), v71 (ref), v76 (ref), v72 (ref)
            if v77 then
                return;
            else
                v77 = true;
                local function v78()
                    -- upvalues: v75 (ref), v73 (ref), v74 (ref), v71 (ref), v76 (ref), v72 (ref), v78 (ref), v77 (ref)
                    v75 = v75 + v73;
                    local v79 = math.floor(v75 / v73);
                    if v74 < v79 then
                        local l_v71_0 = v71;
                        if l_v71_0:sub(-4) == ".cfg" then
                            l_v71_0 = l_v71_0:sub(1, -5);
                        end;
                        v76 = l_v71_0.sub(l_v71_0, 1, v79);
                        v72:set(v76);
                        v74 = v79;
                    end;
                    if v79 < #v71 then
                        utils.execute_after(v73, function()
                            -- upvalues: v78 (ref)
                            v78();
                        end);
                    else
                        v77 = false;
                    end;
                end;
                if v77 then
                    v77 = false;
                    v74 = 0;
                    v75 = 0;
                end;
                v78();
                return;
            end;
        end)();
    end, 
    clantaganim = function()
        -- upvalues: v38 (ref)
        local v81 = "Apple AI";
        local v82 = 0.15;
        local v83 = 0;
        local v84 = 0;
        local v85 = "";
        local v86 = false;
        local v87 = false;
        local v88 = true;
        (function()
            -- upvalues: v86 (ref), v38 (ref), v88 (ref), v84 (ref), v82 (ref), v81 (ref), v87 (ref), v83 (ref), v85 (ref)
            if v86 then
                return;
            else
                v86 = true;
                local function v89()
                    -- upvalues: v38 (ref), v88 (ref), v86 (ref), v84 (ref), v82 (ref), v81 (ref), v87 (ref), v83 (ref), v85 (ref), v89 (ref)
                    if not v38.uicreates.VisualsUI2.Clantag:get() then
                        v88 = false;
                        v86 = false;
                        common.set_clan_tag("");
                        return;
                    else
                        v88 = true;
                        v86 = true;
                        v84 = v84 + v82;
                        local v90 = math.floor(v84 / v82) % (#v81 + 1);
                        if v87 then
                            v90 = #v81 - v90;
                        end;
                        if v83 < v90 or v87 then
                            v85 = v81:sub(1, v90);
                            common.set_clan_tag(v85);
                            v83 = v90;
                        end;
                        if #v81 <= v90 then
                            v87 = true;
                        elseif v90 <= 0 then
                            v87 = false;
                        end;
                        if v86 and v88 then
                            utils.execute_after(v82, v89);
                        end;
                        return;
                    end;
                end;
                v89();
                return;
            end;
        end)();
    end, 
    getallconfigsfromfolder = function()
        -- upvalues: v38 (ref)
        local v91 = {};
        local v92 = 0;
        for _, v94 in pairs(v38.imports.MTools.FileSystem:ReadFolder("nl\\Apple Intelligence\\config", true)) do
            if files.read("nl\\Apple Intelligence\\config\\" .. v94) then
                if v94:sub(-4) == ".cfg" then
                    v92 = v92 + 1;
                    v94 = v94:sub(1, -5);
                    table.insert(v91, v94);
                else
                    print("warning", "Found not supported config file [" .. v94 .. "]");
                end;
            end;
        end;
        if v92 == 0 then
            table.insert(v91, "Empty");
        end;
        v38.locals.Configlist = v91;
        v38.uicreates.HomeUI2.CfgList:update(v38.locals.Configlist);
    end, 
    ui_callbackselectedconfig = function()
        -- upvalues: v38 (ref)
        local v95 = v38.uicreates.HomeUI2.CfgList:get();
        local v96 = v38.uicreates.HomeUI2.CfgList:list()[v95];
        v38.Luafunctions.animateTyping(v96, v38.uicreates.HomeUI2.InputCFG);
    end, 
    ui_callbackselectedconfig2 = function()
        -- upvalues: v38 (ref), l_get_icon_0 (ref)
        local v97 = v38.uicreates.HomeUI2.CfgList:get();
        local v98 = v38.uicreates.HomeUI2.CfgList:list();
        local v99 = v38.uicreates.HomeUI2.InputCFG:get();
        local v100 = false;
        local v101 = {};
        for _, v103 in ipairs(v98) do
            if v103 == v99 then
                v100 = true;
                break;
            elseif string.find(v103, v99) then
                table.insert(v101, v103);
            end;
        end;
        if not v100 then
            if #v101 == 0 then
                v38.uicreates.HomeUI2.Save:name("   Create " .. l_get_icon_0("download") .. "   ");
            else
                v38.uicreates.HomeUI2.Save:name("   Save " .. l_get_icon_0("download") .. "   ");
            end;
        else
            local _ = v98[v97];
            v38.uicreates.HomeUI2.Save:name("   Save " .. l_get_icon_0("download") .. "   ");
        end;
    end, 
    ui_callbackselectedconfig3 = function()
        -- upvalues: v38 (ref)
        local v105 = v38.uicreates.HomeUI4.CfgList:get();
        local v106 = v38.uicreates.HomeUI4.CfgList:list()[v105];
        v38.Luafunctions.animateTyping2(v106, v38.uicreates.HomeUI4.InputCFG);
    end, 
    ui_callbackselectedconfig4 = function()
        -- upvalues: v38 (ref), l_get_icon_0 (ref)
        local v107 = v38.uicreates.HomeUI4.CfgList:get();
        local v108 = v38.uicreates.HomeUI4.CfgList:list();
        local v109 = v38.uicreates.HomeUI4.InputCFG:get();
        local v110 = false;
        local v111 = {};
        for _, v113 in ipairs(v108) do
            if v113 == v109 then
                v110 = true;
                break;
            elseif string.find(v113, v109) then
                table.insert(v111, v113);
            end;
        end;
        if not v110 then
            if #v111 == 0 then
                v38.uicreates.HomeUI4.Save:name("   Create " .. l_get_icon_0("download") .. "   ");
            else
                v38.uicreates.HomeUI4.Save:name("   Save " .. l_get_icon_0("download") .. "   ");
            end;
        else
            local _ = v108[v107];
            v38.uicreates.HomeUI4.Save:name("   Save " .. l_get_icon_0("download") .. "   ");
        end;
    end, 
    Antiaimvisibler = function()
        -- upvalues: v38 (ref)
        local v115 = v38.locals.player_states_idx[Antiaim[0].antiaim_tab:get()];
        local v116 = v38.locals.player_states_idx[Antiaim[0].antiaim_tab3:get()];
        local v117 = Antiaim[0].enable_antiaim:get();
        local v118 = Antiaim[0].enable_antiaim3:get();
        local v119 = Antiaim[0].enable_antiaim2:get();
        local v120 = Antiaim[0].antiaim_tab2:get();
        for v121 = 1, 7 do
            local v122 = Antiaim[v121].antiaim_mode:get();
            local v123 = Defensive_AA[v121].defensive_mode:get();
            local v124 = Defensive_AA[v121].defensive_pitch:get();
            local v125 = Desync_AA[v121].Desync_switch:get();
            local v126 = Antiaim2[v121].antiaim_mode:get();
            local v127 = Defensive_AA2[v121].defensive_mode:get();
            local v128 = Defensive_AA2[v121].defensive_pitch:get();
            local v129 = Desync_AA2[v121].Desync_switch:get();
            local v130 = v115 == v121 and v118 and v117 and v120 == "Normal";
            local v131 = v116 == v121 and v119 and v117 and v120 == "High advantage";
            Antiaim[0].antiaim_tab2:visibility(v117);
            Antiaim[0].enable_antiaim2:visibility(v117 and v120 == "High advantage");
            Antiaim[0].enable_antiaim3:visibility(v117 and v120 == "Normal");
            Antiaim[0].antiaim_tab:visibility(v117 and v118 and v120 == "Normal");
            Antiaim[v121].antiaim_mode:visibility(v130);
            Antiaim[v121].BodyYaw:visibility(v130);
            Desync_AA[v121].Freestanding:visibility(v130);
            Desync_AA[v121].Desync_Left:visibility(v130 and v125 ~= "Switch");
            Desync_AA[v121].Desync_Right:visibility(v130 and v125 ~= "Switch");
            Desync_AA[v121].Desync_Leftswitch1:visibility(v130 and v125 == "Switch");
            Desync_AA[v121].Desync_Leftswitch2:visibility(v130 and v125 == "Switch");
            Desync_AA[v121].Desync_Rightswitch1:visibility(v130 and v125 == "Switch");
            Desync_AA[v121].Desync_Rightswitch2:visibility(v130 and v125 == "Switch");
            Desync_AA[v121].Tickswitch:visibility(v130 and v125 == "Switch");
            Desync_AA[v121].Options:visibility(v130 and (v122 == "L&R" or not (v122 ~= "Tick-Switcher") or not (v122 ~= "Delay") or not (v122 ~= "100-Way") or not (v122 ~= "3-Way") or v122 == "5-Way"));
            Antiaim[v121].Defensive_AA:visibility(v130);
            Yawmode_AA[v121].Yaw_Base:visibility(v130);
            Yawmode_AA[v121].Yaw_Left:visibility(v130 and (v122 == "L&R" or not (v122 ~= "Sway") or not (v122 ~= "Tick-Switcher") or not (v122 ~= "Delay") or not (v122 ~= "Slow Yaw") or v122 == "100-Way"));
            Yawmode_AA[v121].Yaw_Right:visibility(v130 and (v122 == "L&R" or not (v122 ~= "Sway") or not (v122 ~= "Tick-Switcher") or not (v122 ~= "Delay") or not (v122 ~= "Slow Yaw") or v122 == "100-Way"));
            Yawmode_AA[v121].f_offset:visibility(v130 and v122 == "5-Way");
            Yawmode_AA[v121].t_offset:visibility(v130 and v122 == "3-Way");
            Yawmode_AA[v121].Tickswitch:visibility(v130 and not (v122 ~= "Tick-Switcher") or v122 == "Delay");
            Yawmodifier_AA[v121].Jitter_Value:visibility(v130 and (v122 == "L&R" or not (v122 ~= "100-Way") or not (v122 ~= "Tick-Switcher") or v122 == "Delay"));
            Antiaim[v121].Jitter_Mode:visibility(v130 and (v122 == "L&R" or not (v122 ~= "Tick-Switcher") or v122 == "Delay"));
            Defensive_AA[v121].defensive_mode:visibility(v130);
            Defensive_AA[v121].defensive_mode_offset:visibility(v130 and v123 == "Normal");
            Defensive_AA[v121].defensive_mode_Left:visibility(v130 and (v123 == "Tick-Switcher" or not (v123 ~= "L&R") or not (v123 ~= "MS-Switcher") or v123 == "100-Way"));
            Defensive_AA[v121].defensive_mode_Right:visibility(v130 and (v123 == "Tick-Switcher" or not (v123 ~= "L&R") or not (v123 ~= "MS-Switcher") or v123 == "100-Way"));
            Defensive_AA[v121].defensive_tick_mode:visibility(v130 and v123 == "Tick-Switcher");
            Defensive_AA[v121].defensive_MS_mode:visibility(v130 and v123 == "MS-Switcher");
            Defensive_AA[v121].defensive_tick_mode2:visibility(v130 and v123 == "Mental Mode");
            Defensive_AA[v121].defensive_mode_f:visibility(v130 and v123 == "5-Way");
            Defensive_AA[v121].defensive_mode_t:visibility(v130 and v123 == "3-Way");
            Defensive_AA[v121].defensive_pitch:visibility(v130);
            Defensive_AA[v121].defensive_tick_pitch:visibility(v130 and v124 ~= "Mental Mode" and v124 ~= "MS-Switcher");
            Defensive_AA[v121].defensive_tick_pitch2:visibility(v130 and v124 == "Mental Mode");
            Defensive_AA[v121].defensive_MS_pitch:visibility(v130 and v124 == "MS-Switcher");
            Defensive_AA[v121].defensive_pitch_Left:visibility(v130 and (v124 == "Custom" or v124 == "MS-Switcher"));
            Defensive_AA[v121].defensive_pitch_Right:visibility(v130 and (v124 == "Custom" or v124 == "MS-Switcher"));
            Antiaim[0].Vertical_Advantage:visibility(v117 and v119 and v120 == "High advantage");
            Antiaim[0].antiaim_tab3:visibility(v117 and v119 and v120 == "High advantage");
            Antiaim2[v121].antiaim_mode:visibility(v131);
            Antiaim2[v121].BodyYaw:visibility(v131);
            Desync_AA2[v121].Freestanding:visibility(v131);
            Desync_AA2[v121].Desync_Left:visibility(v131 and v129 ~= "Switch");
            Desync_AA2[v121].Desync_Right:visibility(v131 and v129 ~= "Switch");
            Desync_AA2[v121].Desync_Leftswitch1:visibility(v131 and v129 == "Switch");
            Desync_AA2[v121].Desync_Leftswitch2:visibility(v131 and v129 == "Switch");
            Desync_AA2[v121].Desync_Rightswitch1:visibility(v131 and v129 == "Switch");
            Desync_AA2[v121].Desync_Rightswitch2:visibility(v131 and v129 == "Switch");
            Desync_AA2[v121].Tickswitch:visibility(v131 and v129 == "Switch");
            Desync_AA2[v121].Options:visibility(v131 and (v126 == "L&R" or not (v126 ~= "Tick-Switcher") or not (v126 ~= "Delay") or not (v126 ~= "100-Way") or not (v126 ~= "3-Way") or v126 == "5-Way"));
            Antiaim2[v121].Defensive_AA:visibility(v131);
            Yawmode_AA2[v121].Yaw_Base:visibility(v131);
            Yawmode_AA2[v121].Yaw_Left:visibility(v131 and (v126 == "L&R" or not (v126 ~= "Sway") or not (v126 ~= "Tick-Switcher") or not (v126 ~= "Delay") or not (v126 ~= "Slow Yaw") or v126 == "100-Way"));
            Yawmode_AA2[v121].Yaw_Right:visibility(v131 and (v126 == "L&R" or not (v126 ~= "Sway") or not (v126 ~= "Tick-Switcher") or not (v126 ~= "Delay") or not (v126 ~= "Slow Yaw") or v126 == "100-Way"));
            Yawmode_AA2[v121].f_offset:visibility(v131 and v126 == "5-Way");
            Yawmode_AA2[v121].t_offset:visibility(v131 and v126 == "3-Way");
            Yawmode_AA2[v121].Tickswitch:visibility(v131 and not (v126 ~= "Tick-Switcher") or v126 == "Delay");
            Yawmodifier_AA2[v121].Jitter_Value:visibility(v131 and (v126 == "L&R" or not (v126 ~= "100-Way") or not (v126 ~= "Tick-Switcher") or v126 == "Delay"));
            Antiaim2[v121].Jitter_Mode:visibility(v131 and (v126 == "L&R" or not (v126 ~= "Tick-Switcher") or v126 == "Delay"));
            Defensive_AA2[v121].defensive_mode:visibility(v131);
            Defensive_AA2[v121].defensive_mode_offset:visibility(v131 and v127 == "Normal");
            Defensive_AA2[v121].defensive_mode_Left:visibility(v131 and (v127 == "Tick-Switcher" or not (v127 ~= "L&R") or not (v127 ~= "MS-Switcher") or v127 == "100-Way"));
            Defensive_AA2[v121].defensive_mode_Right:visibility(v131 and (v127 == "Tick-Switcher" or not (v127 ~= "L&R") or not (v127 ~= "MS-Switcher") or v127 == "100-Way"));
            Defensive_AA2[v121].defensive_tick_mode:visibility(v131 and v127 == "Tick-Switcher");
            Defensive_AA2[v121].defensive_tick_mode2:visibility(v131 and v127 == "Mental Mode");
            Defensive_AA2[v121].defensive_MS_mode:visibility(v131 and v127 == "MS-Switcher");
            Defensive_AA2[v121].defensive_mode_f:visibility(v131 and v127 == "5-Way");
            Defensive_AA2[v121].defensive_mode_t:visibility(v131 and v127 == "3-Way");
            Defensive_AA2[v121].defensive_pitch:visibility(v131);
            Defensive_AA2[v121].defensive_tick_pitch:visibility(v131 and v128 ~= "Mental Mode" and v128 ~= "MS-Switcher");
            Defensive_AA2[v121].defensive_tick_pitch2:visibility(v131 and v128 == "Mental Mode");
            Defensive_AA2[v121].defensive_MS_pitch:visibility(v131 and v128 == "MS-Switcher");
            Defensive_AA2[v121].defensive_pitch_Left:visibility(v131 and (v128 == "Custom" or v128 == "MS-Switcher"));
            Defensive_AA2[v121].defensive_pitch_Right:visibility(v131 and (v128 == "Custom" or v128 == "MS-Switcher"));
        end;
    end, 
    ui_callback2 = function()
        -- upvalues: v38 (ref)
        local v132 = v38.uicreates.Anti_AimUI1.Idealtickhelper:get();
        local v133 = {
            [1] = v38.groups.Anti_AimUI1.warning, 
            [2] = v38.groups.Anti_AimUI1.stepzise, 
            [3] = v38.groups.Anti_AimUI1.maxdistance, 
            [4] = v38.groups.Anti_AimUI1.debugrenderhelper, 
            [5] = v38.groups.Anti_AimUI1.colorpickerhelper
        };
        local v134 = 0;
        for _, v136 in ipairs(v133) do
            do
                local l_v136_0 = v136;
                utils.execute_after(v134, function()
                    -- upvalues: l_v136_0 (ref), v132 (ref)
                    l_v136_0:visibility(v132);
                end);
                v134 = v134 + 0.2;
            end;
        end;
    end, 
    ui_callback3 = function()
        -- upvalues: v38 (ref)
        local v138 = v38.groups.VisualsUI1.diffrentcolors:get();
        local v139 = {
            [1] = v38.groups.VisualsUI1.colorpicker5, 
            [2] = v38.groups.VisualsUI1.colorpicker6, 
            [3] = v38.groups.VisualsUI1.colorpicker7, 
            [4] = v38.groups.VisualsUI1.colorpicker8, 
            [5] = v38.groups.VisualsUI1.glowbinds, 
            [6] = v38.groups.VisualsUI1.glowbindsthickness
        };
        local v140 = 0;
        for _, v142 in ipairs(v139) do
            do
                local l_v142_0 = v142;
                utils.execute_after(v140, function()
                    -- upvalues: l_v142_0 (ref), v138 (ref)
                    l_v142_0:visibility(v138);
                end);
                v140 = v140 + 0.2;
            end;
        end;
    end, 
    ui_callback4 = function()
        -- upvalues: v38 (ref)
        local v144 = v38.uicreates.VisualsUI1.Keybinds:get();
        local v145 = {
            [1] = v38.groups.VisualsUI1.colorpicker1, 
            [2] = v38.groups.VisualsUI1.colorpicker2, 
            [3] = v38.groups.VisualsUI1.colorpicker3, 
            [4] = v38.groups.VisualsUI1.colorpicker4, 
            [5] = v38.groups.VisualsUI1.glowheader, 
            [6] = v38.groups.VisualsUI1.glowbindsthickness2, 
            [7] = v38.groups.VisualsUI1.diffrentcolors, 
            [8] = v38.groups.VisualsUI1.showvalues
        };
        if v38.groups.VisualsUI1.diffrentcolors:get() then
            table.insert(v145, v38.groups.VisualsUI1.colorpicker5);
            table.insert(v145, v38.groups.VisualsUI1.colorpicker6);
            table.insert(v145, v38.groups.VisualsUI1.colorpicker7);
            table.insert(v145, v38.groups.VisualsUI1.colorpicker8);
            table.insert(v145, v38.groups.VisualsUI1.glowbinds);
            table.insert(v145, v38.groups.VisualsUI1.glowbindsthickness);
        end;
        local v146 = 0;
        for _, v148 in ipairs(v145) do
            do
                local l_v148_0 = v148;
                utils.execute_after(v146, function()
                    -- upvalues: l_v148_0 (ref), v144 (ref)
                    l_v148_0:visibility(v144);
                end);
                v146 = v146 + 0.2;
            end;
        end;
    end, 
    ui_callback5 = function()
        -- upvalues: v38 (ref)
        local v150 = v38.uicreates.Anti_AimUI1.Resolver:get();
        local v151 = {
            [1] = v38.groups.Anti_AimUI1.Resolverlabel1, 
            [2] = v38.groups.Anti_AimUI1.Resolverlabel2, 
            [3] = v38.groups.Anti_AimUI1.forceresetresolverdata, 
            [4] = v38.groups.Anti_AimUI1.Resolverguns, 
            [5] = v38.groups.Anti_AimUI1.resolverversion
        };
        local v152 = 0;
        for _, v154 in ipairs(v151) do
            do
                local l_v154_0 = v154;
                utils.execute_after(v152, function()
                    -- upvalues: l_v154_0 (ref), v150 (ref)
                    l_v154_0:visibility(v150);
                end);
                v152 = v152 + 0.2;
            end;
        end;
    end, 
    ui_callback6 = function()
        -- upvalues: v38 (ref)
        local v156 = Antiaim[0].enable_antiaim:get();
        local v157 = {
            [1] = v38.refs.Pitch, 
            [2] = v38.refs.Yawbase, 
            [3] = v38.refs.yaw, 
            [4] = v38.refs.Yawoffset, 
            [5] = v38.refs.Yawmodifier, 
            [6] = v38.refs.YawmodifierOffset, 
            [7] = v38.refs.DesyncLeft, 
            [8] = v38.refs.DesyncRight, 
            [9] = v38.refs.bodyywa, 
            [10] = v38.refs.Options, 
            [11] = v38.refs.Options2, 
            [12] = v38.refs.Freestanding
        };
        local v158 = 0;
        for _, v160 in ipairs(v157) do
            do
                local l_v160_0 = v160;
                utils.execute_after(v158, function()
                    -- upvalues: l_v160_0 (ref), v156 (ref)
                    l_v160_0:disabled(v156);
                end);
                v158 = v158 + 0.2;
            end;
        end;
    end, 
    ui_callback8 = function()
        -- upvalues: v38 (ref)
        local v162 = v38.uicreates.VisualsUI1.notifications:get();
        local v163 = {
            [1] = v38.groups.VisualsUI1.colorpickernotify, 
            [2] = v38.groups.VisualsUI1.glownotify, 
            [3] = v38.groups.VisualsUI1.showavatars, 
            [4] = v38.groups.VisualsUI1.glownotifysthickness, 
            [5] = v38.groups.VisualsUI1.glowcolornotify, 
            [6] = v38.groups.VisualsUI1.Textcolornotify
        };
        local v164 = 0;
        for _, v166 in ipairs(v163) do
            do
                local l_v166_0 = v166;
                utils.execute_after(v164, function()
                    -- upvalues: l_v166_0 (ref), v162 (ref)
                    l_v166_0:visibility(v162);
                end);
                v164 = v164 + 0.2;
            end;
        end;
    end, 
    ui_callback9 = function()
        -- upvalues: v38 (ref)
        local v168 = v38.uicreates.VisualsUI1.Viewmodel:get();
        local v169 = {
            [1] = v38.groups.VisualsUI1.viewmodel_fov, 
            [2] = v38.groups.VisualsUI1.viewmodel_x, 
            [3] = v38.groups.VisualsUI1.viewmodel_y, 
            [4] = v38.groups.VisualsUI1.viewmodel_z
        };
        local v170 = 0;
        for _, v172 in ipairs(v169) do
            do
                local l_v172_0 = v172;
                utils.execute_after(v170, function()
                    -- upvalues: l_v172_0 (ref), v168 (ref)
                    l_v172_0:visibility(v168);
                end);
                v170 = v170 + 0.2;
            end;
        end;
    end, 
    ui_callback10 = function()
        -- upvalues: v38 (ref)
        v38.groups.Anti_AimUI3.LCbreakTicks:visibility(v38.groups.Anti_AimUI3.LCbreakDelay:get() == "Ticks");
        v38.groups.Anti_AimUI3.LCbreakms:visibility(v38.groups.Anti_AimUI3.LCbreakDelay:get() == "Milliseconds");
    end, 
    viewmodelchange = function()
        -- upvalues: v38 (ref)
        if v38.uicreates.VisualsUI1.Viewmodel:get() then
            cvar.viewmodel_fov:int(v38.groups.VisualsUI1.viewmodel_fov:get(), true);
            cvar.viewmodel_offset_x:float(v38.groups.VisualsUI1.viewmodel_x:get(), true);
            cvar.viewmodel_offset_y:float(v38.groups.VisualsUI1.viewmodel_y:get(), true);
            cvar.viewmodel_offset_z:float(v38.groups.VisualsUI1.viewmodel_z:get(), true);
        else
            cvar.viewmodel_fov:int(60);
            cvar.viewmodel_offset_x:float(1);
            cvar.viewmodel_offset_y:float(1);
            cvar.viewmodel_offset_z:float(-1.5);
        end;
    end, 
    aspect_ratio2 = function()
        -- upvalues: v38 (ref)
        if v38.uicreates.VisualsUI1.AspectRatio:get() ~= 100 then
            if cvar.r_aspectratio:float() ~= v38.uicreates.VisualsUI1.AspectRatio:get() / 100 then
                cvar.r_aspectratio:float(v38.uicreates.VisualsUI1.AspectRatio:get() / 100);
            end;
        else
            cvar.r_aspectratio:float(0);
        end;
    end, 
    fakepingunlocker = function()
        -- upvalues: v38 (ref)
        if v38.uicreates.VisualsUI2.Fakepingunlocker:get() / 100 ~= 0.2 then
            cvar.sv_maxunlag:float(v38.uicreates.VisualsUI2.Fakepingunlocker:get());
        else
            cvar.sv_maxunlag:float(0.2);
        end;
    end, 
    MainPage = function()
        -- upvalues: v38 (ref), v36 (ref)
        local l_MainPagesel_0 = v38.uicreates.HomeUI1.MainPagesel;
        local v175 = {
            [1] = v38.uicreates.HomeUI1.mainslider1, 
            [2] = v38.uicreates.HomeUI3.ServerData, 
            [3] = v38.uicreates.HomeUI5.DiscordLink, 
            [4] = v38.uicreates.HomeUI5.Websitelink, 
            [5] = v38.uicreates.HomeUI5.WebtokenLink
        };
        local v176 = {
            [1] = v38.uicreates.HomeUI2.CfgList, 
            [2] = v38.uicreates.HomeUI2.Loadedcfg, 
            [3] = v38.uicreates.HomeUI2.InputCFG, 
            [4] = v38.uicreates.HomeUI2.Save, 
            [5] = v38.uicreates.HomeUI2.Load, 
            [6] = v38.uicreates.HomeUI2.Delete, 
            [7] = v38.uicreates.HomeUI2.Import, 
            [8] = v38.uicreates.HomeUI2.Export, 
            [9] = v38.uicreates.HomeUI4.CfgList, 
            [10] = v38.uicreates.HomeUI4.Loadedcfg, 
            [11] = v38.uicreates.HomeUI4.InputCFG, 
            [12] = v38.uicreates.HomeUI4.Save, 
            [13] = v38.uicreates.HomeUI4.Load, 
            [14] = v38.uicreates.HomeUI4.Delete
        };
        local v177 = {};
        if l_MainPagesel_0:get() == 1 then
            v177 = v175;
            v38.uicreates.HomeUI1.MainPagesel:update("" .. v36 .. "\226\150\184 \aDEFAULT Info", "Config");
        elseif l_MainPagesel_0:get() == 2 then
            v177 = v176;
            v38.uicreates.HomeUI1.MainPagesel:update("Info", "" .. v36 .. "\226\150\184 \aDEFAULT Config");
        end;
        local v178 = l_MainPagesel_0:get() == 1 and v176 or v175;
        local v179 = 0;
        for _, v181 in ipairs(v178) do
            do
                local l_v181_0 = v181;
                utils.execute_after(v179, function()
                    -- upvalues: l_v181_0 (ref)
                    l_v181_0:visibility(false);
                end);
                v179 = v179 + 0.1;
            end;
        end;
        local l_v179_0 = v179;
        for _, v185 in ipairs(v177) do
            do
                local l_v185_0 = v185;
                utils.execute_after(l_v179_0, function()
                    -- upvalues: l_v185_0 (ref)
                    l_v185_0:visibility(true);
                end);
                l_v179_0 = l_v179_0 + 0.1;
            end;
        end;
    end, 
    jumpscoutvisibility = function()
        -- upvalues: v38 (ref)
        v38.groups.Anti_AimUI1.jumpscout_select1:visibility(v38.uicreates.Anti_AimUI1.Jumpscout:get());
        v38.groups.Anti_AimUI1.jumpscout_select2:visibility(v38.uicreates.Anti_AimUI1.Jumpscout:get());
    end, 
    get_spectator_info = function(v187)
        if not globals.is_connected or v187 == nil then
            return;
        else
            local l_v187_0 = v187;
            if not v187:is_alive() then
                local l_m_hObserverTarget_0 = v187.m_hObserverTarget;
                local l_m_iObserverMode_0 = v187.m_iObserverMode;
                if l_m_hObserverTarget_0 and l_m_hObserverTarget_0:is_player() and l_m_iObserverMode_0 ~= 6 then
                    l_v187_0 = l_m_hObserverTarget_0;
                else
                    return;
                end;
            end;
            local v191 = {};
            local v192 = l_v187_0.get_spectators(l_v187_0);
            for _, v194 in pairs(v192) do
                if v194:get_index() ~= l_v187_0.get_index(l_v187_0) and not v194:is_alive() then
                    local v195 = v194:get_player_info();
                    table.insert(v191, {
                        id = v195.steamid, 
                        id64 = v195.steamid64, 
                        name = v194:get_name(), 
                        avatar = v194:get_steam_avatar()
                    });
                end;
            end;
            return v191;
        end;
    end, 
    BT = function(v196, v197, v198)
        -- upvalues: v38 (ref)
        local v199 = v197 / 250;
        return v196 * v199 <= v38.locals.tick_to_distance[v198] * v199;
    end, 
    get_state_name = function(v200)
        for v201, v202 in pairs(anti_aim_state.STATES) do
            if v202 == v200 then
                return v201;
            end;
        end;
        return "Unknown State";
    end, 
    anti_aim_states = function(v203)
        -- upvalues: v38 (ref)
        if not v203 then
            return false;
        elseif v203:is_alive() then
            local v204 = v203.m_vecVelocity:length2d();
            local l_m_fFlags_0 = v203.m_fFlags;
            local v206 = ({
                [anti_aim_state.FLAGS.ON_GROUND] = {
                    [v204 < 3] = anti_aim_state.STATES.STAND, 
                    [v204 > 3 and v204 < 81] = anti_aim_state.STATES.SLOW_WALK, 
                    [v204 > 81] = anti_aim_state.STATES.WALK
                }, 
                [anti_aim_state.FLAGS.DUCKING] = anti_aim_state.STATES.DUCK, 
                [anti_aim_state.FLAGS.IN_AIR] = v204 < 10 and anti_aim_state.STATES.STAND or anti_aim_state.STATES.AIR, 
                [anti_aim_state.FLAGS.IN_AIR_DUCKING] = v204 < 10 and anti_aim_state.STATES.DUCK or anti_aim_state.STATES.AIR_DUCK
            })[l_m_fFlags_0];
            local v207 = nil;
            if v206 then
                if type(v206) == "table" then
                    for v208, v209 in pairs(v206) do
                        if v208 then
                            v207 = v38.Luafunctions.get_state_name(v209);
                            break;
                        end;
                    end;
                else
                    v207 = v38.Luafunctions.get_state_name(v206);
                end;
            end;
            if v207 then
                v38.locals.players_states[v203] = v38.locals.players_states[v203] or {};
                table.insert(v38.locals.players_states[v203], v207);
                v38.locals.last_known_states[v203] = v207;
                if #v38.locals.players_states[v203] > 100 then
                    table.remove(v38.locals.players_states[v203], 1);
                end;
            end;
            return v207;
        else
            return v38.locals.last_known_states[v203] or "DEAD";
        end;
    end, 
    say_trash_talk = function(v210)
        -- upvalues: v38 (ref)
        v38.locals.can_talk = false;
        local v211 = 1;
        for v212 = 1, #v210 do
            do
                local l_v212_0 = v212;
                utils.execute_after(v211, function()
                    -- upvalues: v210 (ref), l_v212_0 (ref)
                    if v210[l_v212_0] == nil then
                        return;
                    else
                        utils.console_exec("say \"" .. v210[l_v212_0]:gsub("\"", "") .. "\"");
                        return;
                    end;
                end);
                v211 = v211 + (v38.locals.trash_talk_type_end == v38.locals.double_kill_phrases and 1 or 1);
            end;
        end;
        utils.execute_after(v211, function()
            -- upvalues: v38 (ref)
            v38.locals.can_talk = true;
        end);
        v38.locals.trash_talk_type_end = nil;
    end, 
    trashtalkitself = function(v214)
        -- upvalues: v38 (ref)
        if not v38.locals.can_talk then
            return;
        else
            local v215 = entity.get(v214.userid, true);
            local v216 = entity.get(v214.attacker, true);
            if v216 == entity.get_local_player() and v215 ~= v216 then
                local v217 = math.random(1, 3);
                if v217 == 1 then
                    v38.locals.trash_talk_type_end = v38.locals.one_kill_phrases;
                elseif v217 == 2 then
                    v38.locals.trash_talk_type_end = v38.locals.double_kill_phrases;
                elseif v217 == 3 then
                    v38.locals.trash_talk_type_end = v38.locals.triple_kill_phrases;
                end;
                v38.Luafunctions.say_trash_talk(v38.locals.trash_talk_type_end[math.random(1, #v38.locals.trash_talk_type_end)]);
            end;
            return;
        end;
    end, 
    is_adaptive_scale_weapon = function(v218)
        -- upvalues: v38 (ref)
        local v219 = v38.locals.weapon_name_mappings[v218];
        if not v219 then
            return false;
        else
            for _, v221 in ipairs(v38.groups.Anti_AimUI1.Resolverguns:get()) do
                if v219 == v221 then
                    return true, v219;
                end;
            end;
            return false, v219;
        end;
    end, 
    calculate_headscale = function(v222)
        -- upvalues: v38 (ref)
        local v223 = v222.m_vecVelocity:length2d();
        local v224 = v38.Luafunctions.anti_aim_states(v222);
        local v225 = 0;
        if v38.groups.Anti_AimUI1.resolverversion:get(1) then
            if v224 then
                local l_v224_0 = v224;
                if l_v224_0 == "STAND" then
                    v225 = 55;
                elseif l_v224_0 == "WALK" then
                    v225 = 50;
                elseif l_v224_0 == "SLOW_WALK" then
                    v225 = 60;
                elseif l_v224_0 == "DUCK" then
                    v225 = 80;
                elseif l_v224_0 == "AIR" then
                    v225 = 70;
                elseif l_v224_0 == "AIR_DUCK" then
                    v225 = 90;
                end;
            end;
            v225 = v225 + v223 / 10;
            v225 = math.max(40, math.min(100, v225));
        else
            if v224 then
                local l_v224_1 = v224;
                if l_v224_1 == "STAND" then
                    v225 = math.random(1, 55);
                elseif l_v224_1 == "WALK" then
                    v225 = math.random(10, 50);
                elseif l_v224_1 == "SLOW_WALK" then
                    v225 = math.random(30, 60);
                elseif l_v224_1 == "DUCK" then
                    v225 = math.random(60, 80);
                elseif l_v224_1 == "AIR" then
                    v225 = math.random(60, 70);
                elseif l_v224_1 == "AIR_DUCK" then
                    v225 = math.random(70, 90);
                end;
            end;
            v225 = v225 + v223 / math.random(6, 10);
            v225 = math.max(5, math.min(100, v225));
        end;
        v38.locals.player_headscales[v222] = v38.locals.player_headscales[v222] or {};
        if v225 > 0 then
            table.insert(v38.locals.player_headscales[v222], v225);
            if #v38.locals.player_headscales[v222] > 10 then
                table.remove(v38.locals.player_headscales[v222], 1);
            end;
        end;
        for v228 = #v38.locals.player_headscales[v222], 1, -1 do
            if v38.locals.player_headscales[v222][v228] > 0 then
                v225 = v38.locals.player_headscales[v222][v228];
                break;
            end;
        end;
        if v225 == 0 then
            print("error", string.format("Error: No valid headscale values for %s. All values in the array are zero or invalid.", v222:get_name()));
        end;
        return v225;
    end, 
    forece_reset_data = function()
        -- upvalues: v38 (ref)
        print("info", "Resolver data reseted due to force reset");
        v38.locals.players_states = {};
        v38.locals.last_known_states = {};
        v38.locals.last_states = {};
        v38.locals.missed_shots_logs = {};
        v38.locals.successful_shots_logs = {};
        v38.locals.last_missed_player = nil;
        v38.locals.has_logged_miss = false;
        v38.locals.player_headscales = {};
        v38.locals.aim_shot_logs = {};
    end, 
    lerp = function(v229, v230, v231)
        return v229 + (v230 - v229) * v231;
    end, 
    scoreboard = function()
        -- upvalues: v38 (ref)
        if not globals.is_in_game then
            return;
        else
            local v232 = {};
            local v233 = {};
            local v234 = "AppleAI1";
            local v235 = "AppleAI2";
            for _, v237 in pairs(entity.get_players()) do
                local v238 = v237:get_xuid();
                if v38.imports.interface.GetRichSearch(v238, v234) then
                    table.insert(v232, v237);
                    v237:set_icon("https://iili.io/2z50K3Q.png");
                elseif v38.imports.interface.GetRichSearch(v238, v235) then
                    table.insert(v233, v237);
                    v237:set_icon("https://iili.io/2z5036x.png");
                end;
            end;
            return;
        end;
    end, 
    resetscoreboard = function()
        for _, v240 in pairs(entity.get_players()) do
            v240:set_icon("");
        end;
    end, 
    loadedcfg = function()
        -- upvalues: v38 (ref), v36 (ref), l_get_icon_0 (ref)
        if v38.locals.lastusedcfg and v38.locals.lastwhatcfg then
            if v38.locals.lastwhatcfg == "cloud" then
                v38.uicreates.HomeUI4.Loadedcfg:name("Currently Loaded: " .. v36 .. "" .. v38.locals.lastusedcfg .. "");
                v38.uicreates.HomeUI2.Loadedcfg:name("Currently Loaded: " .. v36 .. "" .. l_get_icon_0("loader") .. "\aDEFAULT");
            elseif v38.locals.lastwhatcfg == "local" then
                v38.uicreates.HomeUI2.Loadedcfg:name("Currently Loaded: " .. v36 .. "" .. v38.locals.lastusedcfg .. "");
                v38.uicreates.HomeUI4.Loadedcfg:name("Currently Loaded: " .. v36 .. "" .. l_get_icon_0("loader") .. "\aDEFAULT");
            end;
        end;
    end, 
    discordlink = function()
        -- upvalues: v38 (ref)
        v38.imports.MTools.Panorama:OpenLink("https://discord.gg/X6bVf4PZXp");
    end, 
    Websitelink = function()
        -- upvalues: v38 (ref)
        v38.imports.MTools.Panorama:OpenLink("https://applelua.cc");
    end, 
    webtokenlink = function()
        -- upvalues: v38 (ref)
        network.post("https://applelua.cc/src/lib/invite.php", {
            apiKey = "hatching-banister-finalize", 
            Build = "Tester", 
            username = common.get_username()
        }, {
            ["Content-Type"] = "application/json"
        }, function(v241)
            -- upvalues: v38 (ref)
            response = json.parse(v241);
            if response.success == true then
                print("successful", "" .. response.message .. ": " .. response.invite_code .. " and copied to clipboard sending client to website");
                utils.console_exec("playvol  buttons/bell1.wav 1");
                v38.imports.clipboard.set(response.invite_code);
                utils.execute_after(3, function()
                    -- upvalues: v38 (ref)
                    v38.imports.MTools.Panorama:OpenLink("https://applelua.cc");
                end);
            else
                print("error", "Something went wrong on the serverside please contact support!");
            end;
        end);
    end, 
    QuickNadeDrop = function()
        -- upvalues: v38 (ref)
        local v242 = false;
        local v243 = {
            [1] = "weapon_hegrenade", 
            [2] = "weapon_molotov"
        };
        local v244 = entity.get_local_player();
        if v244 == nil or not v244:is_alive() then
            return;
        else
            if v244.m_iTeamNum == 3 then
                v243 = {
                    [1] = "weapon_hegrenade", 
                    [2] = "weapon_incgrenade"
                };
            else
                v243 = {
                    [1] = "weapon_hegrenade", 
                    [2] = "weapon_molotov"
                };
            end;
            if v38.uicreates.VisualsUI2.DropNades:get() and not v242 then
                for v245, v246 in pairs(v243) do
                    do
                        local l_v245_0, l_v246_0 = v245, v246;
                        utils.execute_after(0.1 * l_v245_0, function()
                            -- upvalues: l_v246_0 (ref), l_v245_0 (ref)
                            utils.console_exec(string.format("use %s", l_v246_0));
                            utils.execute_after(0.05 * l_v245_0, function()
                                utils.console_exec("drop");
                            end);
                        end);
                    end;
                end;
            end;
            v242 = v38.uicreates.VisualsUI2.DropNades:get();
            return;
        end;
    end, 
    Nadefix = function()
        local v249 = entity.get_local_player();
        if not v249 then
            return;
        else
            rage.exploit:allow_defensive(true);
            local v250 = v249:get_player_weapon();
            if v250 == nil then
                return;
            else
                local v251 = v250:get_classname();
                if string.match(v251, "Grenade") then
                    rage.exploit:allow_defensive(false);
                end;
                return;
            end;
        end;
    end
};
v38.rendersneed = {
    idealtickhelper = function()
        -- upvalues: v38 (ref)
        local v252 = entity.get_local_player();
        if not v252 or not v252:is_alive() then
            return;
        else
            local v253 = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Min. Damage"):get();
            local v254 = render.camera_angles();
            local v255 = v252:get_origin();
            local v256 = v252:get_eye_position().z - v255.z;
            local v257 = v252:get_origin() + vector(0, 0, 0 + v256);
            local v258 = v252:get_eye_position();
            local v259 = entity.get_threat();
            local v260 = nil;
            local v261 = -math.huge;
            if not v259 then
                return;
            else
                local function v270(v262, v263, v264, v265)
                    -- upvalues: v257 (ref), v38 (ref), v252 (ref)
                    local v266 = (v262 - v257):length2d();
                    if not v38.Luafunctions.BT(v266, 250, v265) then
                        return false, 0;
                    else
                        local v267, v268 = utils.trace_bullet(v252, v262, v263:get_hitbox_position(1), {
                            [1] = v252
                        });
                        local l_m_iHealth_0 = v263.m_iHealth;
                        return v268 and v268.entity == v263 and (not (v264 > v267) or l_m_iHealth_0 <= v267), v267;
                    end;
                end;
                (function()
                    -- upvalues: v38 (ref), v254 (ref), v257 (ref), v258 (ref), v270 (ref), v259 (ref), v253 (ref), v261 (ref), v260 (ref)
                    local v271 = v38.groups.Anti_AimUI1.stepzise:get();
                    local v272 = v38.groups.Anti_AimUI1.maxdistance:get();
                    local v273 = 64;
                    local v274 = {
                        vector():angles(v254 + vector(0, -90, 0)), 
                        vector():angles(v254 + vector(0, 90, 0))
                    };
                    for _, v276 in ipairs(v274) do
                        for v277 = v271, v272, v271 do
                            local v278 = v257 + v276 * v277;
                            if v38.groups.Anti_AimUI1.debugrenderhelper:get() then
                                render.circle_3d(v278, color(0, 0, 255, 100), 5, 0, 1, true);
                            end;
                            if utils.trace_line(v258, v278, entity.get_players()).fraction == 1 then
                                local v279, v280 = v270(v278, v259, v253, v273);
                                if v279 then
                                    local v281 = v280 + -v278:dist(v257) * 0.5;
                                    if v261 < v281 then
                                        v260 = v278 - vector(0, 0, 20);
                                        v261 = v281;
                                        break;
                                    else
                                        break;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end)();
                if v260 and not v259:is_visible() then
                    local v282 = 10;
                    local v283 = 32;
                    local v284 = {
                        [1] = v260 + vector(v282, v282, v283), 
                        [2] = v260 + vector(v282, -v282, v283), 
                        [3] = v260 + vector(-v282, -v282, v283), 
                        [4] = v260 + vector(-v282, v282, v283), 
                        [5] = v260 + vector(v282, v282, -v283), 
                        [6] = v260 + vector(v282, -v282, -v283), 
                        [7] = v260 + vector(-v282, -v282, -v283), 
                        [8] = v260 + vector(-v282, v282, -v283)
                    };
                    local v285 = {};
                    for v286, v287 in ipairs(v284) do
                        local v288 = render.world_to_screen(v287);
                        if v288 then
                            v285[v286] = v288;
                        else
                            return;
                        end;
                    end;
                    local v289 = v38.groups.Anti_AimUI1.colorpickerhelper:get();
                    for v290 = 1, 4 do
                        render.line(v285[v290], v285[v290 % 4 + 1], color(v289.r, v289.g, v289.b, v289.a));
                        render.line(v285[v290 + 4], v285[(v290 - 1) % 4 + 5], color(v289.r, v289.g, v289.b, v289.a));
                        render.line(v285[v290], v285[v290 + 4], color(v289.r, v289.g, v289.b, v289.a));
                    end;
                    render.line(v285[5], v285[6], color(v289.r, v289.g, v289.b, v289.a));
                    render.line(v285[6], v285[7], color(v289.r, v289.g, v289.b, v289.a));
                    render.line(v285[7], v285[8], color(v289.r, v289.g, v289.b, v289.a));
                    render.line(v285[8], v285[5], color(v289.r, v289.g, v289.b, v289.a));
                end;
                return;
            end;
        end;
    end, 
    crosshair_incd = function()
        -- upvalues: v38 (ref)
        local v291 = v38.locals.screensize * 0.5;
        local v292 = {};
        local v293 = rage.exploit:get();
        local function v298(v294)
            if v294 <= 0.9 then
                local v295 = 255;
                local v296 = math.floor(255 * (v294 / 0.5));
                return color(v295, v296, 0, 255);
            else
                local v297 = math.floor(255 * ((1 - v294) / 0.5));
                return color(v297, 255, 0, 255);
            end;
        end;
        local v299 = v298(v293);
        if v38.refs.dt:get() then
            data = {
                text = "DT:", 
                color = v298(v293)
            };
            table.insert(v292, data);
        end;
        if v38.refs.bodyaim:get() == "Force" then
            data = {
                text = "BAIM", 
                color = v298(v293)
            };
            table.insert(v292, data);
        end;
        if v38.refs.safepoint:get() == "Force" then
            data = {
                text = "SPF", 
                color = v298(v293)
            };
            table.insert(v292, data);
        end;
        if v38.refs.hs:get() then
            if v38.refs.dt:get() then
                data = {
                    text = "HS:", 
                    color = color(255, 0, 0, 255)
                };
            else
                data = {
                    text = "HS:", 
                    color = v298(v293)
                };
            end;
            table.insert(v292, data);
        end;
        render.text(3, vector(v291.x, v291.y + 15), color(), "cd", "Apple \239\133\185");
        local v300 = 15;
        for _, v302 in ipairs(v292) do
            v300 = v300 + 15;
            if v302.text == "DT:" then
                render.text(3, vector(v291.x, v291.y + v300), v302.color, "cd", v302.text);
                render.circle_outline(vector(v291.x + 15, v291.y + v300 + 1), v299, 5, 90, v293, 2);
            elseif v302.text == "HS:" then
                if v38.refs.dt:get() then
                    render.text(3, vector(v291.x, v291.y + v300), v302.color, "cd", v302.text);
                else
                    render.text(3, vector(v291.x, v291.y + v300), v302.color, "cd", v302.text);
                    render.circle_outline(vector(v291.x + 15, v291.y + v300 + 1), v299, 5, 90, v293, 2);
                end;
            else
                render.text(3, vector(v291.x, v291.y + v300), v302.color, "cd", v302.text);
            end;
        end;
    end
};
v38.rendersneed.new_drag_object2 = v7.register({
    [1] = v38.groups.VisualsUI1.locationx, 
    [2] = v38.groups.VisualsUI1.locationy
}, vector(140, 50), "Test2", function(v303)
    -- upvalues: v38 (ref)
    if not v38.uicreates.VisualsUI1.Keybinds:get() then
        return;
    else
        local v304 = ui.get_binds();
        local v305 = 100;
        local v306 = 104;
        local _ = "";
        for _, v309 in ipairs(v304) do
            local l_x_2 = render.measure_text(v38.locals.fontsemibold, nil, "" .. v309.name .. "").x;
            if v305 - 40 < l_x_2 then
                v305 = l_x_2 + 45;
            end;
            if v306 - 40 < l_x_2 then
                v306 = l_x_2 + 43;
            else
                v306 = 104;
            end;
        end;
        v38.imports.MTools.Render.Modern.Box({
            vector(v303.position.x, v303.position.y), 
            vector(v303.position.x + v305, v303.position.y + 20)
        }, {
            [1] = 9, 
            [2] = 9, 
            [3] = 9, 
            [4] = 9
        }, color(15, 15, 15, 140));
        render.rect_outline(vector(v303.position.x, v303.position.y), vector(v303.position.x + v305, v303.position.y + 20), color(15, 15, 15, 255), 1.4, 9);
        render.text(v38.locals.fontbolt, vector(v303.position.x + 35, v303.position.y + 5), color(255, 255, 255, 255), nil, "Keybinds");
        render.text(v38.locals.fontbolt, vector(v303.position.x + 9, v303.position.y + 5), color(255, 255, 255, 255), nil, "\238\135\128");
        render.line(vector(v303.position.x + 27, v303.position.y), vector(v303.position.x + 27, v303.position.y + 20), color(15, 15, 15, 255));
        local v311 = 0;
        for _, v313 in ipairs(v304) do
            v311 = v311 + 25;
            local v314 = render.measure_text(v38.locals.fontsemibold, nil, "" .. v313.name .. "").x + 43;
            render.blur(vector(v303.position.x + 30, v303.position.y + v311), vector(v303.position.x + v314, v303.position.y + 20 + v311), 5, 200, 7);
            render.rect_outline(vector(v303.position.x + 30, v303.position.y + v311), vector(v303.position.x + v314, v303.position.y + 20 + v311), color(15, 15, 15, 140), 1.4, 5);
            render.text(v38.locals.fontsemibold, vector(v303.position.x + 36, v303.position.y + 5 + v311), color(255, 255, 255, 255), nil, "" .. v313.name .. "");
            render.blur(vector(v303.position.x, v303.position.y + v311), vector(v303.position.x + 25, v303.position.y + 20 + v311), 5, 200, 7);
            render.rect_outline(vector(v303.position.x, v303.position.y + v311), vector(v303.position.x + 25, v303.position.y + 20 + v311), color(15, 15, 15, 140), 1.4, 5);
            if type(v313.value) == "table" then
                render.text(v38.locals.fontbolt, vector(v303.position.x + 7, v303.position.y + 5 + v311), color(255, 255, 255, 255), nil, "\238\150\177");
            elseif type(v313.value) == "number" then
                render.text(v38.locals.fontbolt, vector(v303.position.x + 7, v303.position.y + 5 + v311), color(255, 255, 255, 255), nil, "\238\150\177");
            elseif tostring(v313.active) == "true" and not v313.value == false then
                render.text(v38.locals.fontbolt, vector(v303.position.x + 7, v303.position.y + 5 + v311), color(255, 255, 255, 255), nil, "\238\150\177");
            elseif tostring(v313.value) == "false" then
                render.text(v38.locals.fontbolt, vector(v303.position.x + 7, v303.position.y + 5 + v311), color(255, 255, 255, 255), nil, "\239\136\132");
            else
                render.text(v38.locals.fontbolt, vector(v303.position.x + 7, v303.position.y + 5 + v311), color(255, 255, 255, 255), nil, "\239\136\132");
            end;
        end;
        return;
    end;
end);
v38.rendersneed.new_drag_object6 = v7.register({
    [1] = v38.groups.VisualsUI1.locationx4, 
    [2] = v38.groups.VisualsUI1.locationy4
}, vector(140, 50), "spec", function(v315)
    -- upvalues: v38 (ref)
    if not v38.uicreates.VisualsUI1.Spectators:get() then
        return;
    else
        local v316 = entity.get_local_player();
        if v316 == nil then
            return;
        else
            local v317 = v38.Luafunctions.get_spectator_info(v316);
            local v318 = 100;
            local v319 = 104;
            local v320 = 0;
            if v317 then
                for _, v322 in ipairs(v317) do
                    local l_x_3 = render.measure_text(v38.locals.fontsemibold, nil, v322.name).x;
                    v318 = math.max(v318, l_x_3 + 45);
                    v319 = math.max(v319, l_x_3 + 43);
                end;
            end;
            v38.imports.MTools.Render.Modern.Box({
                vector(v315.position.x, v315.position.y), 
                vector(v315.position.x + v318, v315.position.y + 20)
            }, {
                [1] = 9, 
                [2] = 9, 
                [3] = 9, 
                [4] = 9
            }, color(15, 15, 15, 140));
            render.rect_outline(vector(v315.position.x, v315.position.y), vector(v315.position.x + v318, v315.position.y + 20), color(15, 15, 15, 255), 1.4, 9);
            render.text(v38.locals.fontbolt, vector(v315.position.x + 35, v315.position.y + 5), color(255, 255, 255, 255), nil, "Spectators");
            render.text(v38.locals.fontbolt, vector(v315.position.x + 9, v315.position.y + 5), color(255, 255, 255, 255), nil, "\239\129\174");
            render.line(vector(v315.position.x + 27, v315.position.y), vector(v315.position.x + 27, v315.position.y + 20), color(15, 15, 15, 255));
            if v317 then
                for _, v325 in ipairs(v317) do
                    v320 = v320 + 25;
                    local v326 = render.measure_text(v38.locals.fontsemibold, nil, v325.name).x + 43;
                    render.blur(vector(v315.position.x + 30, v315.position.y + v320), vector(v315.position.x + v326, v315.position.y + 20 + v320), 5, 200, 7);
                    render.rect_outline(vector(v315.position.x + 30, v315.position.y + v320), vector(v315.position.x + v326, v315.position.y + 20 + v320), color(15, 15, 15, 140), 1.4, 5);
                    render.text(v38.locals.fontsemibold, vector(v315.position.x + 36, v315.position.y + 5 + v320), color(255, 255, 255, 255), nil, v325.name);
                    render.blur(vector(v315.position.x, v315.position.y + v320), vector(v315.position.x + 25, v315.position.y + 20 + v320), 5, 200, 7);
                    render.rect_outline(vector(v315.position.x, v315.position.y + v320), vector(v315.position.x + 25, v315.position.y + 20 + v320), color(15, 15, 15, 140), 1.4, 5);
                    render.texture(v325.avatar, vector(v315.position.x + 7, v315.position.y + 5 + v320), vector(12, 12), color(255, 255, 255, 255), "f", 0);
                end;
            end;
            return;
        end;
    end;
end);
local v339 = {
    displayTime = 5000, 
    maxNotifications = 5, 
    fadeTime = 1000, 
    notifications = {}, 
    addNotification = function(v327, v328, v329, v330)
        -- upvalues: v38 (ref)
        if #v327.notifications >= v327.maxNotifications then
            table.remove(v327.notifications, 1);
        end;
        if not v330 then
            if v38.groups.VisualsUI1.showavatars:get() then
                v330 = v38.imports.MTools.Client.GetAvatar(3, false, vector(40, 40));
            else
                v330 = nil;
            end;
        end;
        local v331 = common.get_timestamp();
        local v332 = {
            fadingOut = false, 
            alpha = 0, 
            title = v328, 
            description = v329, 
            entavatar = v330, 
            startTime = v331
        };
        table.insert(v327.notifications, v332);
    end, 
    update = function(v333)
        local v334 = common.get_timestamp();
        for v335 = #v333.notifications, 1, -1 do
            local v336 = v333.notifications[v335];
            if not v336.fadingOut then
                local v337 = v334 - v336.startTime;
                if v337 < v333.fadeTime then
                    v336.alpha = v337 / v333.fadeTime;
                else
                    v336.alpha = 1;
                    if v333.fadeTime + v333.displayTime <= v337 then
                        v336.fadingOut = true;
                        v336.startTime = v334;
                    end;
                end;
            else
                local v338 = v334 - v336.startTime;
                if v338 < v333.fadeTime then
                    v336.alpha = 1 - v338 / v333.fadeTime;
                else
                    v336.alpha = 0;
                    table.remove(v333.notifications, v335);
                end;
            end;
        end;
    end
};
v38.rendersneed.new_drag_object4 = v7.register({
    [1] = v38.groups.VisualsUI1.locationx3, 
    [2] = v38.groups.VisualsUI1.locationy3
}, vector(200, 200), "InfoPanel", function(v340)
    -- upvalues: v38 (ref), v2 (ref)
    if not v38.uicreates.VisualsUI1.infopanel:get() then
        return;
    elseif not globals.is_connected then
        return;
    else
        local v341 = entity.get_local_player();
        v38.imports.MTools.Render.Modern.Box({
            vector(v340.position.x, v340.position.y), 
            vector(v340.position.x + 200, v340.position.y + 200)
        }, {
            [1] = 10, 
            [2] = 10, 
            [3] = 10, 
            [4] = 10
        }, color(0, 0, 0, 150));
        local v342 = entity.get_threat();
        if v342 == nil then
            v342 = entity.get_local_player();
        end;
        local v343 = v342.get_network_state(v342);
        local v344 = rage.antiaim:get_target();
        local v345 = ({
            [0] = "The entity is not dormant", 
            [1] = "Dormant, cheat has 100% info", 
            [2] = "Dormant (Shared ESP update)", 
            [3] = "Dormant (Sounds update)", 
            [4] = "Dormant (not updated)", 
            [5] = "Dormant (data unavailable)"
        })[v343] or "Unknown network state";
        local l_extras_0 = v38.uicreates.Anti_AimUI3.extras;
        local v347 = "None";
        if l_extras_0:get(2) then
            v347 = "Better Air-Duck";
        elseif l_extras_0:get(1) then
            v347 = "TP-spamer";
        elseif l_extras_0:get(3) then
            v347 = "Air-Lag";
        end;
        local v348 = "None";
        if v38.refs.fakeduck:get() then
            v348 = "FD";
        elseif v38.refs.dt:get() then
            v348 = "DT";
        elseif v38.refs.hs:get() and not v38.refs.dt:get() then
            v348 = "HS";
        end;
        local v349 = rage.exploit:get();
        local v354 = (function(v350)
            if v350 <= 0.9 then
                local v351 = 255;
                local v352 = math.floor(255 * (v350 / 0.5));
                return color(v351, v352, 0, 255);
            else
                local v353 = math.floor(255 * ((1 - v350) / 0.5));
                return color(v353, 255, 0, 255);
            end;
        end)(v349);
        local v355 = v38.Luafunctions.anti_aim_states(v341) or " ";
        render.text(v38.locals.fontbolt, vector(v340.position.x + 5, v340.position.y + 10), color(255, 255, 255, 255), nil, v2);
        render.text(v38.locals.fontsemibold, vector(v340.position.x + 5, v340.position.y + 22), color(255, 255, 255, 255), nil, "Anti-Aim Mode: " .. v38.locals.heighornormal .. "");
        render.text(v38.locals.fontsemibold, vector(v340.position.x + 5, v340.position.y + 34), color(255, 255, 255, 255), nil, "Condition: " .. v355 .. "");
        render.text(v38.locals.fontsemibold, vector(v340.position.x + 5, v340.position.y + 46), color(255, 255, 255, 255), nil, "Extra: " .. tostring(v347) .. "");
        render.text(v38.locals.fontsemibold, vector(v340.position.x + 5, v340.position.y + 58), color(255, 255, 255, 255), nil, "Exploit: " .. tostring(v348) .. "");
        render.text(v38.locals.fontsemibold, vector(v340.position.x + 5, v340.position.y + 70), color(255, 255, 255, 255), nil, "Charge: ");
        render.circle_outline(vector(v340.position.x + 54, v340.position.y + 75), v354, 5, 90, v349, 2);
        if v342 then
            render.text(v38.locals.fontsemibold, vector(v340.position.x + 5, v340.position.y + 82), color(255, 255, 255, 255), nil, "Target: " .. v342.get_name(v342) .. "");
            if v344 then
                render.text(v38.locals.fontsemibold, vector(v340.position.x + 5, v340.position.y + 94), color(255, 255, 255, 255), nil, "Target Yaw: " .. math.floor(v344) .. "");
            end;
            render.text(v38.locals.fontsemibold, vector(v340.position.x + 5, v340.position.y + 106), color(255, 255, 255, 255), nil, "Target Angles: X:" .. math.floor(v342.get_angles(v342).x) .. " Y:" .. math.floor(v342.get_angles(v342).y) .. "");
            render.text(v38.locals.fontsemibold, vector(v340.position.x + 5, v340.position.y + 118), color(255, 255, 255, 255), nil, "State: " .. v345 .. "");
        end;
        render.text(v38.locals.fontsemibold, vector(v340.position.x + 5, v340.position.y + 130), color(255, 255, 255, 255), nil, "Ragebot Improvements: " .. tostring(v38.uicreates.Anti_AimUI1.Resolver:get()) .. "");
        return;
    end;
end);
v38.rendersneed.new_drag_object7 = v7.register({
    [1] = v38.groups.VisualsUI1.locationx5, 
    [2] = v38.groups.VisualsUI1.locationy5
}, vector(830, 615), "Test2", function(v356)
    -- upvalues: v38 (ref)
    if ui.get_alpha() <= 0.9 then
        return;
    else
        v38.imports.MTools.Render.Modern.Box({
            vector(v356.position.x, v356.position.y), 
            vector(v356.position.x + 830, v356.position.y + 615)
        }, {
            [1] = 9, 
            [2] = 9, 
            [3] = 9, 
            [4] = 9
        }, color(15, 15, 15, 190));
        v38.imports.MTools.Render.Modern.Box({
            vector(v356.position.x + 10, v356.position.y + 10), 
            vector(v356.position.x + 200, v356.position.y + 60)
        }, {
            [1] = 10, 
            [2] = 10, 
            [3] = 10, 
            [4] = 10
        }, color(15, 15, 15, 200));
        v38.imports.MTools.Render.Modern.Box({
            vector(v356.position.x + 230, v356.position.y + 20), 
            vector(v356.position.x + 360, v356.position.y + 50)
        }, {
            [1] = 10, 
            [2] = 10, 
            [3] = 10, 
            [4] = 10
        }, color(15, 15, 15, 200));
        render.text(v38.locals.fontbolt, vector(v356.position.x + 273, v356.position.y + 30), color(255, 255, 255, 255), nil, "Anti-Aim");
        v38.imports.MTools.Render.Modern.Box({
            vector(v356.position.x + 390, v356.position.y + 20), 
            vector(v356.position.x + 520, v356.position.y + 50)
        }, {
            [1] = 10, 
            [2] = 10, 
            [3] = 10, 
            [4] = 10
        }, color(15, 15, 15, 200));
        render.text(v38.locals.fontbolt, vector(v356.position.x + 433, v356.position.y + 30), color(255, 255, 255, 255), nil, "Ragebot");
        v38.imports.MTools.Render.Modern.Box({
            vector(v356.position.x + 550, v356.position.y + 20), 
            vector(v356.position.x + 680, v356.position.y + 50)
        }, {
            [1] = 10, 
            [2] = 10, 
            [3] = 10, 
            [4] = 10
        }, color(15, 15, 15, 200));
        render.text(v38.locals.fontbolt, vector(v356.position.x + 603, v356.position.y + 30), color(255, 255, 255, 255), nil, "Misc");
        v38.imports.MTools.Render.Modern.Box({
            vector(v356.position.x + 220, v356.position.y + 70), 
            vector(v356.position.x + 800, v356.position.y + 600)
        }, {
            [1] = 10, 
            [2] = 10, 
            [3] = 10, 
            [4] = 10
        }, color(15, 15, 15, 230));
        render.text(v38.locals.fontbolt, vector(v356.position.x + 403, v356.position.y + 250), color(255, 255, 255, 255), nil, "Still being made! its only a little preview");
        render.texture(v38.locals.logoimg, vector(v356.position.x + 10, v356.position.y + 15), vector(40, 40), color(255, 255, 255, 255), nil, 0);
        render.text(v38.locals.fontbolt, vector(v356.position.x + 55, v356.position.y + 15), color(255, 255, 255, 255), nil, "Apple Intelligence");
        render.text(v38.locals.fontbolt, vector(v356.position.x + 55, v356.position.y + 30), color(255, 255, 255, 255), nil, "Experimental Menu");
        render.text(v38.locals.fontbolt, vector(v356.position.x + 55, v356.position.y + 45), color(255, 255, 255, 255), nil, "User:  " .. common.get_username() .. "");
        return;
    end;
end);
v38.rendersneed.new_drag_object3 = v7.register({
    [1] = v38.groups.VisualsUI1.locationx2, 
    [2] = v38.groups.VisualsUI1.locationy2
}, vector(300, 50), "Notifications", function(v357)
    -- upvalues: v38 (ref), v339 (ref)
    local v358 = v38.groups.VisualsUI1.colorpickernotify:get();
    local v359 = v38.groups.VisualsUI1.Textcolornotify:get();
    local v360 = v38.groups.VisualsUI1.glownotifysthickness:get();
    local v361 = v38.groups.VisualsUI1.glowcolornotify:get();
    if ui.get_alpha() == 1 then
        v38.imports.MTools.Render.Modern.Box({
            vector(v357.position.x, v357.position.y), 
            vector(v357.position.x + 300, v357.position.y + 50)
        }, {
            [1] = 10, 
            [2] = 10, 
            [3] = 10, 
            [4] = 10
        }, color(v358.r, v358.g, v358.b, math.min(200, v358.a)));
        if v38.groups.VisualsUI1.glownotify:get() then
            v38.imports.MTools.Render.Box_Outline_Glow({
                vector(v357.position.x, v357.position.y), 
                vector(v357.position.x + 300, v357.position.y + 50)
            }, color(v361.r, v361.g, v361.b, v361.a), v360, 7.5);
        end;
        if v38.groups.VisualsUI1.showavatars:get() then
            render.texture(v38.locals.steamavatarlogo, vector(v357.position.x + 4, v357.position.y + 4), vector(40, 40), color(255, 255, 255, 255), nil, 7);
        else
            render.texture(v38.locals.logoimg, vector(v357.position.x + 4, v357.position.y + 4), vector(40, 40), color(255, 255, 255, 255), nil, 0);
        end;
        render.text(v38.locals.fontbolt, vector(v357.position.x + 50, v357.position.y + 10), color(v359.r, v359.g, v359.b, v359.a), nil, "Ragebot");
        render.text(v38.locals.fontsemibold, vector(v357.position.x + 50, v357.position.y + 22), color(v359.r, v359.g, v359.b, v359.a), nil, "Missed shot due to correction");
    else
        for v362, v363 in ipairs(v339.notifications) do
            local l_x_4 = v357.position.x;
            local v365 = v357.position.y + 60 * (v362 - 1);
            local v366 = 300;
            local v367 = 50;
            v38.imports.MTools.Render.Modern.Box({
                vector(l_x_4, v365), 
                vector(l_x_4 + v366, v365 + v367)
            }, {
                [1] = 10, 
                [2] = 10, 
                [3] = 10, 
                [4] = 10
            }, color(v358.r, v358.g, v358.b, math.min(200, 200 * v363.alpha)));
            if v38.groups.VisualsUI1.glownotify:get() then
                v38.imports.MTools.Render.Box_Outline_Glow({
                    vector(l_x_4, v365), 
                    vector(l_x_4 + v366, v365 + v367)
                }, color(v361.r, v361.g, v361.b, math.floor(v361.a * v363.alpha)), v360, 7.5);
            end;
            if v38.groups.VisualsUI1.showavatars:get() then
                render.texture(v363.entavatar, vector(l_x_4 + 4, v365 + 4), vector(40, 40), color(255, 255, 255, math.floor(255 * v363.alpha)), nil, 7);
            else
                render.texture(v38.locals.logoimg, vector(l_x_4 + 4, v365 + 4), vector(40, 40), color(255, 255, 255, math.floor(255 * v363.alpha)), nil, 0);
            end;
            render.text(v38.locals.fontbolt, vector(l_x_4 + 50, v365 + 10), color(v359.r, v359.g, v359.b, math.floor(v359.a * v363.alpha)), nil, v363.title);
            render.text(v38.locals.fontsemibold, vector(l_x_4 + 50, v365 + 22), color(v359.r, v359.g, v359.b, math.floor(v359.a * v363.alpha)), nil, v363.description);
        end;
    end;
    v339:update();
end);
v339:addNotification("System", "Welcome to " .. v2 .. ".");
v38.aim_fireneed = {
    resolveraim_fire = function(v368)
        -- upvalues: v38 (ref)
        local l_target_0 = v368.target;
        local v370 = l_target_0 and l_target_0:get_name();
        if not v370 or not l_target_0 then
            return;
        else
            local v371 = v38.Luafunctions.anti_aim_states(l_target_0);
            local v372 = v38.Luafunctions.calculate_headscale(l_target_0);
            if not v371 or not v372 then
                return;
            else
                v38.locals.aim_shot_logs[v370] = v38.locals.aim_shot_logs[v370] or {};
                table.insert(v38.locals.aim_shot_logs[v370], {
                    shot_id = v368.id, 
                    state = v371, 
                    headscale = v372, 
                    damage = v368.damage, 
                    hitchance = v368.hitchance, 
                    hitgroup = v368.hitgroup, 
                    aim_position = v368.aim, 
                    angle = v368.angle
                });
                print("info", string.format("Shot at %s | State: %s | Headscale: %d | Damage: %d | Hitchance: %d", v370, v371, v372, v368.damage, v368.hitchance));
                return;
            end;
        end;
    end
};
local v373 = {};
v38.createmoveneed = {
    resolvercreatemove = function()
        -- upvalues: v38 (ref)
        if not v38.uicreates.Anti_AimUI1.Resolver:get() then
            return;
        else
            local v374 = entity.get_threat();
            local v375 = entity.get_local_player();
            if not v375 or not v375:is_alive() or not v374 then
                return;
            else
                local v376 = v374:get_name();
                local v377 = v38.Luafunctions.calculate_headscale(v374);
                if not v377 then
                    return;
                else
                    local v378 = v38.Luafunctions.anti_aim_states(v374);
                    local v379 = v38.Luafunctions.anti_aim_states(v375);
                    local v380 = v378 and v378.name or "Unknown";
                    local v381 = nil;
                    if v38.locals.successful_shots_logs[v376] then
                        for _, v383 in ipairs(v38.locals.successful_shots_logs[v376]) do
                            if v383.state == v380 then
                                v381 = v383.headscale;
                                break;
                            end;
                        end;
                    end;
                    local v384 = false;
                    if v38.locals.missed_shots_logs[v376] then
                        for _, v386 in ipairs(v38.locals.missed_shots_logs[v376]) do
                            if v386.state == v380 and v386.headscale == v377 then
                                v384 = true;
                                break;
                            end;
                        end;
                    end;
                    local v387 = v375:get_player_weapon();
                    if not v387 then
                        return;
                    else
                        local l_weapon_name_0 = v387:get_weapon_info().weapon_name;
                        if l_weapon_name_0 == "weapon_taser" then
                            ui.find("Aimbot", "Ragebot", "Selection", "Taser", "Multipoint", "Body Scale"):override(math.floor(v377));
                        else
                            local v389, v390 = v38.Luafunctions.is_adaptive_scale_weapon(l_weapon_name_0);
                            if v390 == nil then
                                return;
                            elseif v390 == nil then
                                return;
                            else
                                if v38.uicreates.Anti_AimUI1.Jumpscout:get() then
                                    if v38.groups.Anti_AimUI1.jumpscout_select1:get(1) and v379 == "AIR" then
                                        return;
                                    elseif v38.groups.Anti_AimUI1.jumpscout_select1:get(2) and v379 == "AIR DUCK" then
                                        return;
                                    end;
                                end;
                                if v389 then
                                    v38.locals.resolveractive = true;
                                    if v381 then
                                        ui.find("Aimbot", "Ragebot", "Selection", v390, "Multipoint", "Head Scale"):override(math.floor(v381));
                                    elseif not v384 then
                                        ui.find("Aimbot", "Ragebot", "Selection", v390, "Multipoint", "Head Scale"):override(math.floor(v377));
                                    else
                                        v38.locals.resolveractive = false;
                                        ui.find("Aimbot", "Ragebot", "Selection", v390, "Multipoint", "Head Scale"):override();
                                    end;
                                else
                                    v38.locals.resolveractive = false;
                                    ui.find("Aimbot", "Ragebot", "Selection", v390, "Multipoint", "Head Scale"):override();
                                end;
                                ui.find("Aimbot", "Ragebot", "Selection", "Taser", "Multipoint", "Body Scale"):override();
                            end;
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end, 
    jumpscoutcreatemove = function()
        -- upvalues: v38 (ref)
        if not v38.uicreates.Anti_AimUI1.Jumpscout:get() then
            return;
        else
            local v391 = entity.get_local_player();
            if v391 == nil or not v391:is_alive() then
                return nil;
            else
                local v392 = v391:get_player_weapon():get_weapon_info().console_name == "weapon_ssg08";
                local v393 = v38.Luafunctions.anti_aim_states(v391);
                local v394 = entity.get_threat();
                local v395 = v391:get_hitbox_position(1);
                local v396 = v391:get_player_weapon();
                if not v396 then
                    return;
                else
                    local l_weapon_name_1 = v396:get_weapon_info().weapon_name;
                    local v398, v399 = v38.Luafunctions.is_adaptive_scale_weapon(l_weapon_name_1);
                    if v394 == nil then
                        return;
                    elseif v394 and not v394:is_alive() then
                        ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", "Options"):override();
                        ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", "Double Tap"):override();
                        ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"):override();
                        ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance", "Double Tap"):override();
                        if v398 and not v399 == "SSG-08" then
                            ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Multipoint", "Head Scale"):override();
                        end;
                        ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Multipoint", "Body Scale"):override();
                        ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Min. Damage"):override();
                        ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim"):override();
                        ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim", "Disablers"):override();
                        ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim", "Force on Peek"):override();
                        ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Safe Points"):override();
                        ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Ensure Hitbox Safety"):override();
                        return;
                    else
                        local v400 = v394:get_hitbox_position(1):dist(v395);
                        if v400 < 1000 and v393 == "AIR" and v38.groups.Anti_AimUI1.jumpscout_select1:get(1) and v392 or v393 == "AIR DUCK" and v38.groups.Anti_AimUI1.jumpscout_select1:get(2) and v392 and v400 < 1000 then
                            if (function(v401)
                                -- upvalues: v391 (ref)
                                local v402, v403 = utils.trace_bullet(v401, v401:get_hitbox_position(0), v391:get_hitbox_position(0));
                                if v402 ~= 0 and v403.entity and v403.entity == v391 and (v402 >= 5 or v402 == 5) then
                                    return true;
                                else
                                    return false;
                                end;
                            end)(v394) then
                                ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", "Options"):override("In Air");
                            end;
                            if v38.groups.Anti_AimUI1.jumpscout_select2:get() == "Preset Dev" then
                                ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Multipoint", "Head Scale"):override(70);
                                ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Multipoint", "Body Scale"):override(30);
                                ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Min. Damage"):override(101);
                                ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim"):override("Prefer");
                                ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim", "Disablers"):override("Head Safepoint", "Target Resolved");
                                ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim", "Force on Peek"):override(false);
                                ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Safe Points"):override("Prefer");
                                ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Ensure Hitbox Safety"):override("");
                            elseif v38.groups.Anti_AimUI1.jumpscout_select2:get() == "Preset Dev2" then
                                ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Multipoint", "Head Scale"):override(75);
                                ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Multipoint", "Body Scale"):override(10);
                                ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Min. Damage"):override(100);
                                ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim"):override("Prefer");
                                ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim", "Disablers"):override("Head Safepoint");
                                ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim", "Force on Peek"):override(false);
                                ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Safe Points"):override("Default");
                                ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Ensure Hitbox Safety"):override("");
                            end;
                            ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", "Double Tap"):override("");
                            ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"):override(35);
                            ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance", "Double Tap"):override(35);
                            rage.exploit:force_charge();
                        else
                            ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", "Options"):override();
                            ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", "Double Tap"):override();
                            ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"):override();
                            ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance", "Double Tap"):override();
                            if v398 and not v399 == "SSG-08" then
                                ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Multipoint", "Head Scale"):override();
                            end;
                            ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Multipoint", "Body Scale"):override();
                            ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Min. Damage"):override();
                            ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim"):override();
                            ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim", "Disablers"):override();
                            ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim", "Force on Peek"):override();
                            ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Safe Points"):override();
                            ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Ensure Hitbox Safety"):override();
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end, 
    fastladder = function(v404)
        local v405 = entity.get_local_player();
        if not v405 then
            return;
        else
            if v405.m_MoveType == 9 then
                if v404.sidemove == 0 then
                    v404.view_angles.y = v404.view_angles.y + 45;
                end;
                if v404.sidemove < 0 and v404.in_forward then
                    v404.view_angles.y = v404.view_angles.y + 90;
                end;
                if v404.sidemove > 0 and v404.in_back then
                    v404.view_angles.y = v404.view_angles.y + 90;
                end;
                v404.in_moveleft = v404.in_back;
                v404.in_moveright = v404.in_forward;
                if v404.view_angles.x < 0 then
                    v404.view_angles.x = -45;
                end;
            end;
            return;
        end;
    end, 
    get_conditions = function()
        -- upvalues: v38 (ref)
        local v406 = entity.get_local_player();
        if not v406 then
            return 99;
        else
            local l_m_vecVelocity_0 = v406.m_vecVelocity;
            local v408 = math.sqrt(l_m_vecVelocity_0.x * l_m_vecVelocity_0.x + l_m_vecVelocity_0.y * l_m_vecVelocity_0.y);
            if v38.refs.sw:get() then
                v38.locals.p_state = 6;
            elseif not v38.refs.hideshots:get() and not v38.refs.doubletap:get() and not v38.refs.fd:get() then
                v38.locals.p_state = 7;
            elseif v406.m_fFlags == 262 and v406.m_flDuckAmount > 0.8 then
                v38.locals.p_state = 4;
            elseif v406.m_fFlags == 256 then
                v38.locals.p_state = 3;
            elseif v406.m_flDuckAmount > 0.8 then
                v38.locals.p_state = 5;
            elseif v408 <= 2 then
                v38.locals.p_state = 1;
            elseif v408 >= 3 then
                v38.locals.p_state = 2;
            end;
            return;
        end;
    end, 
    choking = function(v409)
        local _ = false;
        return v409.send_packet == false or globals.choked_commands > 1;
    end, 
    Antiaim_worker = function(v411)
        -- upvalues: v38 (ref)
        if not Antiaim[0].enable_antiaim:get() then
            return;
        else
            local v412 = {
                Antiaim = Antiaim, 
                Defensive_AA = Defensive_AA, 
                Yawmode_AA = Yawmode_AA, 
                Yawmodifier_AA = Yawmodifier_AA, 
                Desync_AA = Desync_AA
            };
            local v413 = {
                Yawmode_AA = Yawmode_AA2, 
                Yawmodifier_AA = Yawmodifier_AA2, 
                Antiaim = Antiaim2, 
                Desync_AA = Desync_AA2, 
                Defensive_AA = Defensive_AA2
            };
            local l_v412_0 = v412;
            if not Antiaim[0].enable_antiaim2:get() then
                l_v412_0 = v412;
            end;
            local v415 = entity.get_local_player();
            local v416 = entity.get_threat(false);
            local v417 = Antiaim[0].Vertical_Advantage:get();
            if v415 and v416 then
                local v418 = v416:get_origin();
                if v417 < v415:get_origin().z - v418.z and Antiaim[0].enable_antiaim2:get() and v416:is_alive() and v416:get_network_state() == 0 then
                    v38.locals.heighornormal = "Height Advantage";
                    l_v412_0 = v413;
                else
                    l_v412_0 = v412;
                    v38.locals.heighornormal = "Normal";
                end;
            end;
            local _ = common.get_timestamp();
            local _ = {
                yaw = 180, 
                pitch = 89
            };
            local v421 = v411.command_number % 6 > 3;
            if l_v412_0.Antiaim[v38.locals.p_state].antiaim_mode:get() == "Tick-Switcher" and not v38.refs.fs:get() then
                if globals.client_tick % 30 > l_v412_0.Yawmode_AA[v38.locals.p_state].Tickswitch:get() then
                    v38.refs.Yawoffset:override(l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get());
                else
                    v38.refs.Yawoffset:override(l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get());
                end;
                v38.refs.YawmodifierOffset:override(l_v412_0.Yawmodifier_AA[v38.locals.p_state].Jitter_Value:get());
                v38.refs.Yawmodifier:override(l_v412_0.Antiaim[v38.locals.p_state].Jitter_Mode:get());
                v38.refs.Options:override(l_v412_0.Desync_AA[v38.locals.p_state].Options:get());
            elseif l_v412_0.Antiaim[v38.locals.p_state].antiaim_mode:get() == "Delay" and not v38.refs.fs:get() then
                if globals.tickcount % l_v412_0.Yawmode_AA[v38.locals.p_state].Tickswitch:get() == l_v412_0.Yawmode_AA[v38.locals.p_state].Tickswitch:get() - 1 then
                    v38.locals.shouldinvert = not v38.locals.shouldinvert;
                    v38.refs.bodyinevert:override(v38.locals.shouldinvert);
                    if v38.locals.shouldinvert then
                        v38.refs.Yawoffset:override(l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get());
                    else
                        v38.refs.Yawoffset:override(l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get());
                    end;
                end;
            elseif l_v412_0.Antiaim[v38.locals.p_state].antiaim_mode:get() == "L&R" and not v38.refs.fs:get() then
                if v421 then
                    v38.refs.Yawoffset:override(l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get());
                else
                    v38.refs.Yawoffset:override(l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get());
                end;
                v38.refs.YawmodifierOffset:override(l_v412_0.Yawmodifier_AA[v38.locals.p_state].Jitter_Value:get());
                v38.refs.Yawmodifier:override(l_v412_0.Antiaim[v38.locals.p_state].Jitter_Mode:get());
                v38.refs.Options:override(l_v412_0.Desync_AA[v38.locals.p_state].Options:get());
            elseif l_v412_0.Antiaim[v38.locals.p_state].antiaim_mode:get() == "Sway" and not v38.refs.fs:get() then
                local v422 = {
                    nil, 
                    nil, 
                    nil, 
                    nil, 
                    0, 
                    [1] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get(), 
                    [2] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get() / 2, 
                    [3] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get() / 3, 
                    [4] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get() / 4, 
                    l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get() / 4, 
                    l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get() / 3, 
                    l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get() / 2, 
                    l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get()
                };
                if v411.command_number % 1024 > 1 and v38.createmoveneed.choking(v411) == false then
                    v38.locals.current_stage = v38.locals.current_stage + 1;
                end;
                if v38.locals.current_stage >= 10 and l_v412_0.Antiaim[v38.locals.p_state].antiaim_mode:get() == "Sway" then
                    v38.locals.current_stage = 1;
                end;
                v38.refs.Yawoffset:set(l_v412_0.Antiaim[v38.locals.p_state].antiaim_mode:get() == "Sway" and v422[v38.locals.current_stage]);
                v38.refs.YawmodifierOffset:override(0);
                v38.refs.Yawmodifier:override("Disabled");
                v38.refs.Options:override("");
            elseif l_v412_0.Antiaim[v38.locals.p_state].antiaim_mode:get() == "100-Way" and not v38.refs.fs:get() then
                local v423 = {
                    [1] = nil, 
                    [2] = nil, 
                    [3] = nil, 
                    [4] = nil, 
                    [5] = nil, 
                    [6] = nil, 
                    [7] = nil, 
                    [8] = nil, 
                    [9] = nil, 
                    [10] = nil, 
                    [11] = nil, 
                    [12] = nil, 
                    [13] = 0, 
                    [1] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get() * 1.6, 
                    [2] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get() / 2, 
                    [3] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get() / 3.5, 
                    [4] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get() / 3, 
                    [5] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get() / 2.5, 
                    [6] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get() / 2.3, 
                    [7] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get() / 2, 
                    [8] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get() / 1.7, 
                    [9] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get() / 1.5, 
                    [10] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get() / 1.3, 
                    [11] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get() * 1.2, 
                    [12] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get() * 1.5, 
                    [14] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get() * 1.5, 
                    [15] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get() * 1.2, 
                    [16] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get() / 1.3, 
                    [17] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get() / 1.5, 
                    [18] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get() / 1.7, 
                    [19] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get() / 2, 
                    [20] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get() / 2.3, 
                    [21] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get() / 2.5, 
                    [22] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get() / 3, 
                    [23] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get() / 3.5, 
                    [24] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get() / 2, 
                    [25] = l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get() * 1.6
                };
                if v411.command_number % 1024 > 1 and v38.createmoveneed.choking(v411) == false then
                    v38.locals.current_stage = v38.locals.current_stage + 1;
                end;
                if v38.locals.current_stage >= 10 and l_v412_0.Antiaim[v38.locals.p_state].antiaim_mode:get() == "100-Way" then
                    v38.locals.current_stage = 1;
                end;
                v38.refs.Yawoffset:set(l_v412_0.Antiaim[v38.locals.p_state].antiaim_mode:get() == "100-Way" and v423[v38.locals.current_stage]);
                v38.refs.YawmodifierOffset:override(l_v412_0.Yawmodifier_AA[v38.locals.p_state].Jitter_Value:get());
                v38.refs.Yawmodifier:override(l_v412_0.Antiaim[v38.locals.p_state].Jitter_Mode:get());
                v38.refs.Options:override(l_v412_0.Desync_AA[v38.locals.p_state].Options:get());
            elseif l_v412_0.Antiaim[v38.locals.p_state].antiaim_mode:get() == "Slow Yaw" and not v38.refs.fs:get() then
                local v424 = v411.command_number % 10 > 5 and l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Right:get() or l_v412_0.Yawmode_AA[v38.locals.p_state].Yaw_Left:get();
                v38.refs.Yawoffset:override(v424);
                v38.refs.YawmodifierOffset:override(0);
                v38.refs.Yawmodifier:override("Disabled");
                v38.refs.Options:override("");
            elseif l_v412_0.Antiaim[v38.locals.p_state].antiaim_mode:get() == "5-Way" and not v38.refs.fs:get() then
                v38.refs.Yawoffset:override(0);
                v38.refs.Yawmodifier:override("5-Way");
                v38.refs.YawmodifierOffset:override(l_v412_0.Yawmode_AA[v38.locals.p_state].f_offset:get());
                v38.refs.Options:override(l_v412_0.Desync_AA[v38.locals.p_state].Options:get());
            elseif l_v412_0.Antiaim[v38.locals.p_state].antiaim_mode:get() == "3-Way" and not v38.refs.fs:get() then
                v38.refs.Yawoffset:override(0);
                v38.refs.Yawmodifier:override("3-Way");
                v38.refs.YawmodifierOffset:override(l_v412_0.Yawmode_AA[v38.locals.p_state].t_offset:get());
                v38.refs.Options:override(l_v412_0.Desync_AA[v38.locals.p_state].Options:get());
            end;
            v38.refs.Freestanding:override(l_v412_0.Desync_AA[v38.locals.p_state].Freestanding:get());
            if l_v412_0.Desync_AA[v38.locals.p_state].Desync_switch:get() == "Switch" then
                tick = globals.client_tick % 30 > l_v412_0.Desync_AA[v38.locals.p_state].Tickswitch:get();
                if tick then
                    v38.refs.DesyncLeft:override(l_v412_0.Desync_AA[v38.locals.p_state].Desync_Leftswitch1:get());
                    v38.refs.DesyncRight:override(l_v412_0.Desync_AA[v38.locals.p_state].Desync_Rightswitch1:get());
                else
                    v38.refs.DesyncLeft:override(l_v412_0.Desync_AA[v38.locals.p_state].Desync_Leftswitch2:get());
                    v38.refs.DesyncRight:override(l_v412_0.Desync_AA[v38.locals.p_state].Desync_Rightswitch2:get());
                end;
            elseif l_v412_0.Desync_AA[v38.locals.p_state].Desync_switch:get() == "Jitter" then
                v38.refs.DesyncLeft:override(utils.random_float(0, l_v412_0.Desync_AA[v38.locals.p_state].Desync_Left:get()));
                v38.refs.DesyncRight:override(utils.random_float(0, l_v412_0.Desync_AA[v38.locals.p_state].Desync_Right:get()));
            elseif l_v412_0.Desync_AA[v38.locals.p_state].Desync_switch:get() == "Random" then
                v38.refs.DesyncLeft:override(math.random(0, l_v412_0.Desync_AA[v38.locals.p_state].Desync_Left:get()));
                v38.refs.DesyncRight:override(math.random(0, l_v412_0.Desync_AA[v38.locals.p_state].Desync_Right:get()));
            elseif l_v412_0.Desync_AA[v38.locals.p_state].Desync_switch:get() == "Static" then
                v38.refs.DesyncLeft:override(l_v412_0.Desync_AA[v38.locals.p_state].Desync_Left:get());
                v38.refs.DesyncRight:override(l_v412_0.Desync_AA[v38.locals.p_state].Desync_Right:get());
            end;
            if l_v412_0.Antiaim[v38.locals.p_state].Defensive_AA:get() then
                if l_v412_0.Defensive_AA[v38.locals.p_state].defensive_pitch:get() == "Disabled" then
                    if globals.client_tick % 30 > l_v412_0.Defensive_AA[v38.locals.p_state].defensive_tick_pitch:get() then
                        rage.antiaim:override_hidden_pitch(0);
                    end;
                elseif l_v412_0.Defensive_AA[v38.locals.p_state].defensive_pitch:get() == "Down" then
                    if globals.client_tick % 30 > l_v412_0.Defensive_AA[v38.locals.p_state].defensive_tick_pitch:get() then
                        rage.antiaim:override_hidden_pitch(-89);
                    else
                        rage.antiaim:override_hidden_pitch(89);
                    end;
                elseif l_v412_0.Defensive_AA[v38.locals.p_state].defensive_pitch:get() == "Fake Down" then
                    if globals.client_tick % 30 > l_v412_0.Defensive_AA[v38.locals.p_state].defensive_tick_pitch:get() then
                        rage.antiaim:override_hidden_pitch(-89);
                    else
                        rage.antiaim:override_hidden_pitch(89);
                    end;
                elseif l_v412_0.Defensive_AA[v38.locals.p_state].defensive_pitch:get() == "Fake Up" then
                    if globals.client_tick % 30 > l_v412_0.Defensive_AA[v38.locals.p_state].defensive_tick_pitch:get() then
                        rage.antiaim:override_hidden_pitch(89);
                    else
                        rage.antiaim:override_hidden_pitch(-89);
                    end;
                elseif l_v412_0.Defensive_AA[v38.locals.p_state].defensive_pitch:get() == "Custom" then
                    if globals.client_tick % 30 > l_v412_0.Defensive_AA[v38.locals.p_state].defensive_tick_pitch:get() then
                        rage.antiaim:override_hidden_pitch(l_v412_0.Defensive_AA[v38.locals.p_state].defensive_pitch_Left:get());
                    else
                        rage.antiaim:override_hidden_pitch(l_v412_0.Defensive_AA[v38.locals.p_state].defensive_pitch_Right:get());
                    end;
                elseif l_v412_0.Defensive_AA[v38.locals.p_state].defensive_pitch:get() == "MS-Switcher" then
                    if common.get_timestamp() - v38.locals.antiaimdelay.defpitch >= l_v412_0.Defensive_AA[v38.locals.p_state].defensive_MS_pitch:get() then
                        v38.locals.antiaimdelay.defpitch = common.get_timestamp();
                        rage.antiaim:override_hidden_pitch(l_v412_0.Defensive_AA[v38.locals.p_state].defensive_pitch_Left:get());
                    else
                        rage.antiaim:override_hidden_pitch(l_v412_0.Defensive_AA[v38.locals.p_state].defensive_pitch_Right:get());
                    end;
                elseif l_v412_0.Defensive_AA[v38.locals.p_state].defensive_pitch:get() == "Mental Mode" then
                    if globals.client_tick % 30 > l_v412_0.Defensive_AA[v38.locals.p_state].defensive_tick_pitch2:get() then
                        rage.antiaim:override_hidden_pitch(math.random(-89, 89));
                    else
                        rage.antiaim:override_hidden_pitch(math.random(-89, 89));
                    end;
                end;
                if l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode:get() == "L&R" then
                    if v421 then
                        rage.antiaim:override_hidden_yaw_offset(l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Right:get());
                    else
                        rage.antiaim:override_hidden_yaw_offset(l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Left:get());
                    end;
                elseif l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode:get() == "Tick-Switcher" then
                    if globals.client_tick % 30 > l_v412_0.Defensive_AA[v38.locals.p_state].defensive_tick_mode:get() then
                        rage.antiaim:override_hidden_yaw_offset(l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Left:get());
                    else
                        rage.antiaim:override_hidden_yaw_offset(l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Right:get());
                    end;
                elseif l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode:get() == "MS-Switcher" then
                    if common.get_timestamp() - v38.locals.antiaimdelay.defmode >= l_v412_0.Defensive_AA[v38.locals.p_state].defensive_MS_mode:get() then
                        v38.locals.antiaimdelay.defmode = common.get_timestamp();
                        rage.antiaim:override_hidden_yaw_offset(l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Left:get());
                    else
                        rage.antiaim:override_hidden_yaw_offset(l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Right:get());
                    end;
                elseif l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode:get() == "100-Way" then
                    local v425 = {
                        [1] = nil, 
                        [2] = nil, 
                        [3] = nil, 
                        [4] = nil, 
                        [5] = nil, 
                        [6] = nil, 
                        [7] = nil, 
                        [8] = nil, 
                        [9] = nil, 
                        [10] = nil, 
                        [11] = nil, 
                        [12] = nil, 
                        [13] = 0, 
                        [1] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Left:get() * 1.6, 
                        [2] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Left:get() / 2, 
                        [3] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Left:get() / 3.5, 
                        [4] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Left:get() / 3, 
                        [5] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Left:get() / 2.5, 
                        [6] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Left:get() / 2.3, 
                        [7] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Left:get() / 2, 
                        [8] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Left:get() / 1.7, 
                        [9] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Left:get() / 1.5, 
                        [10] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Left:get() / 1.3, 
                        [11] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Left:get() * 1.2, 
                        [12] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Left:get() * 1.5, 
                        [14] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Right:get() * 1.5, 
                        [15] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Right:get() * 1.2, 
                        [16] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Right:get() / 1.3, 
                        [17] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Right:get() / 1.5, 
                        [18] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Right:get() / 1.7, 
                        [19] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Right:get() / 2, 
                        [20] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Right:get() / 2.3, 
                        [21] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Right:get() / 2.5, 
                        [22] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Right:get() / 3, 
                        [23] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Right:get() / 3.5, 
                        [24] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Right:get() / 2, 
                        [25] = l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_Right:get() * 1.6
                    };
                    if v411.command_number % 1024 > 1 and v38.createmoveneed.choking(v411) == false then
                        v38.locals.current_stage = v38.locals.current_stage + 1;
                    end;
                    if v38.locals.current_stage >= 10 and l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode:get() == "100-Way" then
                        v38.locals.current_stage = 1;
                    end;
                    rage.antiaim:override_hidden_yaw_offset(l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode:get() == "100-Way" and v425[v38.locals.current_stage]);
                elseif l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode:get() == "Normal" then
                    rage.antiaim:override_hidden_yaw_offset(l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode_offset:get());
                elseif l_v412_0.Defensive_AA[v38.locals.p_state].defensive_mode:get() == "Mental Mode" then
                    if globals.client_tick % 30 > l_v412_0.Defensive_AA[v38.locals.p_state].defensive_tick_mode2:get() then
                        rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                    else
                        rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                    end;
                end;
            end;
            v38.refs.hiddendefensive:override(l_v412_0.Antiaim[v38.locals.p_state].Defensive_AA:get());
            v38.refs.bodyywa:override(l_v412_0.Antiaim[v38.locals.p_state].BodyYaw:get());
            v38.refs.bodyinevert:override(l_v412_0.Desync_AA[v38.locals.p_state].Inveter:get());
            return;
        end;
    end, 
    extrasantiaim = function(v426)
        -- upvalues: v38 (ref)
        local l_p_state_0 = v38.locals.p_state;
        if v38.uicreates.Anti_AimUI3.Defensive_Flick:get() then
            v38.locals.extraaaexecutedalready4 = false;
            for v428 = 1, 7 do
                if v38.groups.Anti_AimUI3.Defensive_Flickconditions:get(v428) then
                    if l_p_state_0 == v428 then
                        Antiaim[v428].Defensive_AA:override(false);
                        Antiaim[v428].Defensive_AA:disabled(true);
                    else
                        Antiaim[v428].Defensive_AA:override();
                        Antiaim[v428].Defensive_AA:disabled(false);
                    end;
                else
                    Antiaim[v428].Defensive_AA:override();
                    Antiaim[v428].Defensive_AA:disabled(false);
                end;
            end;
            if v38.groups.Anti_AimUI3.Defensive_Flickconditions:get(l_p_state_0) then
                v38.refs.hiddendefensive:override(true);
                if v38.groups.Anti_AimUI3.Defensive_Flicksides:get() then
                    if globals.client_tick % 30 > 15 then
                        rage.antiaim:override_hidden_yaw_offset(math.random(80, 98));
                    else
                        rage.antiaim:override_hidden_yaw_offset(math.random(80, 98));
                    end;
                elseif globals.client_tick % 30 > 15 then
                    rage.antiaim:override_hidden_yaw_offset(math.random(-80, -98));
                else
                    rage.antiaim:override_hidden_yaw_offset(math.random(-80, -98));
                end;
            end;
        elseif not v38.locals.extraaaexecutedalready4 then
            v38.locals.extraaaexecutedalready4 = true;
            v38.refs.hiddendefensive:override();
            for v429 = 1, 7 do
                Antiaim[v429].Defensive_AA:override();
                Antiaim[v429].Defensive_AA:disabled(false);
            end;
        end;
        if v38.uicreates.Anti_AimUI3.FreestandingBetter:get() then
            v38.locals.extraaaexecutedalready5 = false;
            if v38.groups.Anti_AimUI3.FreestandingBetterconditions:get(l_p_state_0) then
                v38.refs.freestanding:override(true);
            else
                v38.refs.freestanding:override(false);
            end;
        elseif not v38.locals.extraaaexecutedalready5 then
            v38.locals.extraaaexecutedalready5 = true;
            v38.refs.freestanding:override();
        end;
        if v38.uicreates.Anti_AimUI3.extras:get(3) then
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override();
            local v430 = entity.get_local_player();
            if not v430 then
                return;
            elseif bit.band(v430.m_fFlags, bit.lshift(1, 0)) == 0 then
                if globals.tickcount % 10 == 0 and v426.in_jump then
                    v426.force_defensive = true;
                    ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override(math.random(10));
                    rage.exploit:force_teleport();
                    rage.exploit:allow_charge(false);
                elseif rage.exploit:get() == 0 then
                    rage.exploit:allow_charge(true);
                    rage.exploit:force_charge();
                end;
            end;
        end;
        if v38.uicreates.Anti_AimUI3.extras:get(2) and v38.locals.p_state == 4 then
            ui.find("Miscellaneous", "Main", "Movement", "Air Duck", "Mode"):override("Spam");
            ui.find("Miscellaneous", "Main", "Movement", "Air Duck"):override(true);
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Always On");
            if globals.client_tick % 30 > 15 then
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override(6);
            else
                ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override(1);
            end;
            v38.locals.extraaaexecutedalready = false;
        elseif v38.locals.extraaaexecutedalready == false then
            v38.locals.extraaaexecutedalready = true;
            ui.find("Miscellaneous", "Main", "Movement", "Air Duck", "Mode"):override();
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"):override();
            ui.find("Miscellaneous", "Main", "Movement", "Air Duck"):override();
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override();
        end;
        if v38.groups.Anti_AimUI3.LCbreakmethod:get() == "1" and not v38.uicreates.Anti_AimUI3.extras:get(3) then
            if v38.groups.Anti_AimUI3.LCbreakDelay:get() == "Ticks" then
                if v38.uicreates.Anti_AimUI3.extras:get(1) and (v38.locals.p_state == 4 or v38.locals.p_state == 3) then
                    if globals.client_tick % 30 > v38.groups.Anti_AimUI3.LCbreakTicks:get() then
                        rage.exploit:force_teleport();
                        rage.exploit:allow_charge(false);
                    else
                        rage.exploit:force_charge();
                        rage.exploit:allow_charge(true);
                    end;
                    v38.locals.extraaaexecutedalready2 = false;
                elseif v38.locals.extraaaexecutedalready2 == false then
                    v38.locals.extraaaexecutedalready2 = true;
                    rage.exploit:allow_charge(true);
                end;
            elseif v38.groups.Anti_AimUI3.LCbreakDelay:get() == "Milliseconds" then
                if v38.uicreates.Anti_AimUI3.extras:get(1) and (v38.locals.p_state == 4 or v38.locals.p_state == 3) then
                    if common.get_timestamp() - v38.locals.antiaimdelay.tpspammer >= v38.groups.Anti_AimUI3.LCbreakms:get() then
                        rage.exploit:force_teleport();
                        rage.exploit:allow_charge(false);
                        v38.locals.antiaimdelay.tpspammer = common.get_timestamp();
                    else
                        rage.exploit:force_charge();
                        rage.exploit:allow_charge(true);
                    end;
                    v38.locals.extraaaexecutedalready3 = false;
                elseif v38.locals.extraaaexecutedalready3 == false then
                    v38.locals.extraaaexecutedalready3 = true;
                    rage.exploit:allow_charge(true);
                end;
            end;
        elseif v38.groups.Anti_AimUI3.LCbreakmethod:get() == "2" and not v38.uicreates.Anti_AimUI3.extras:get(3) then
            if v38.groups.Anti_AimUI3.LCbreakDelay:get() == "Ticks" then
                if v38.uicreates.Anti_AimUI3.extras:get(1) and (v38.locals.p_state == 4 or v38.locals.p_state == 3) and globals.client_tick % 30 > v38.groups.Anti_AimUI3.LCbreakTicks:get() then
                    rage.exploit:force_teleport();
                    rage.exploit:force_charge();
                end;
            elseif v38.groups.Anti_AimUI3.LCbreakDelay:get() == "Milliseconds" and v38.uicreates.Anti_AimUI3.extras:get(1) and (v38.locals.p_state == 4 or v38.locals.p_state == 3) and common.get_timestamp() - v38.locals.antiaimdelay.tpspammer2 >= v38.groups.Anti_AimUI3.LCbreakms:get() then
                rage.exploit:force_teleport();
                rage.exploit:force_charge();
                v38.locals.antiaimdelay.tpspammer2 = common.get_timestamp();
            end;
        end;
    end, 
    idealtickinghelp = function()
        -- upvalues: v38 (ref)
        local _, _ = (function(v431, v432, v433, v434)
            -- upvalues: v38 (ref)
            local v435 = (v431 - local_position):length2d();
            if not v38.Luafunctions.BT(v435, 250, v434) then
                return false, 0;
            else
                local v436, v437 = utils.trace_bullet(local_player, v431, v432:get_hitbox_position(1), {
                    [1] = local_player
                });
                local l_m_iHealth_1 = v432.m_iHealth;
                return v437 and v437.entity == v432 and (not (v433 > v436) or l_m_iHealth_1 <= v436), v436;
            end;
        end)(check_position, closest_enemy, min_damage, 64);
        local _ = function()
            local v441 = {};
            for _, v443 in ipairs(ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes"):get()) do
                if string.find(v443, "Head") then
                    table.insert(v441, 0);
                end;
                if string.find(v443, "Chest") then
                    table.insert(v441, 4);
                    table.insert(v441, 5);
                    table.insert(v441, 6);
                end;
                if string.find(v443, "Stomach") then
                    table.insert(v441, 2);
                    table.insert(v441, 3);
                end;
                if string.find(v443, "Arms") then
                    table.insert(v441, 13);
                    table.insert(v441, 14);
                    table.insert(v441, 15);
                    table.insert(v441, 16);
                    table.insert(v441, 17);
                    table.insert(v441, 18);
                end;
                if string.find(v443, "Legs") then
                    table.insert(v441, 7);
                    table.insert(v441, 8);
                    table.insert(v441, 9);
                    table.insert(v441, 10);
                end;
                if string.find(v443, "Feet") then
                    table.insert(v441, 11);
                    table.insert(v441, 12);
                end;
            end;
            return v441;
        end;
        if not v38.refs.freestanding:get() and not v38.uicreates.Anti_AimUI3.FreestandingBetter or v38.refs.doubletap:get() then

        end;
    end, 
    autostop = function(v445)
        local v446 = math.sqrt(v445.forwardmove * v445.forwardmove + v445.sidemove * v445.sidemove);
        local v447 = entity.get_local_player();
        local v448 = v447:get_player_weapon():get_weapon_info();
        local v449 = v447.m_bIsScoped and v448.max_player_speed_alt or v448.max_player_speed;
        if v449 > 0 and v446 > 0 then
            if not v445.in_duck then
                v449 = v449 * 0.33;
            end;
            if v449 < v446 then
                local v450 = v449 / v446;
                v445.forwardmove = v445.forwardmove * v450;
                v445.sidemove = v445.sidemove * v450;
            end;
        end;
    end, 
    forcepred = function(v451)
        -- upvalues: v373 (ref), v38 (ref)
        v373 = {};
        forcepred = {};
        local v452 = entity.get_local_player();
        if not v452 or not v452:is_alive() then
            return;
        else
            if not forcepred.last_shot_time then
                forcepred.last_shot_time = 0;
            end;
            local v453 = 30;
            local v454 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get();
            local _ = render.camera_angles();
            local v456 = v452:get_origin();
            local v457 = v452:get_eye_position().z - v456.z;
            local v458 = v456 + vector(0, 0, v457);
            local v459 = entity.get_threat();
            if not v459 then
                return;
            else
                local v460 = {
                    [1] = {
                        id = 4, 
                        priority = 1
                    }, 
                    [2] = {
                        id = 5, 
                        priority = 1
                    }, 
                    [3] = {
                        id = 6, 
                        priority = 1
                    }, 
                    [4] = {
                        id = 2, 
                        priority = 1
                    }, 
                    [5] = {
                        id = 3, 
                        priority = 1
                    }
                };
                table.sort(v460, function(v461, v462)
                    return v461.priority < v462.priority;
                end);
                local function v467(v463, v464)
                    local v465 = v463:simulate_movement();
                    local _ = v465:think(v464);
                    return v465.origin;
                end;
                local v468 = nil;
                local v469 = 0;
                local v470 = nil;
                for _, v472 in ipairs(v460) do
                    local l_id_0 = v472.id;
                    local l_priority_0 = v472.priority;
                    local v475 = v454 + (l_priority_0 - 1) * 5;
                    local v476 = v467(v459, v38.groups.VisualsUI1.aheadforpred:get() or 0);
                    local v477 = v476 + (v476 - v459:get_hitbox_position(l_id_0)) + vector(0, 0, 80);
                    local v478, _ = utils.trace_bullet(v452, v458, v477, {
                        [1] = v452
                    });
                    if v469 < v478 and v475 <= v478 then
                        v468 = l_id_0;
                        v469 = v478;
                        v470 = v477;
                    end;
                    if v475 <= v469 and l_priority_0 <= 2 then
                        break;
                    end;
                end;
                if not v468 or v469 < v454 then
                    return;
                else
                    local v480, _ = utils.trace_bullet(v452, v458, v470, {
                        [1] = v452
                    });
                    local v482 = render.world_to_screen(v470);
                    local v483 = render.world_to_screen(v458);
                    table.insert(v373, {
                        predicted_position = v470
                    });
                    if v483 and v482 then
                        local v484 = v452:get_eye_position():to(v470):angles();
                        if v453 < globals.tickcount - forcepred.last_shot_time and v454 < v480 then
                            v451.in_attack2 = true;
                            v38.createmoveneed.autostop(v451);
                            v451.view_angles = v484;
                            v451.in_attack = true;
                            forcepred.last_shot_time = globals.tickcount;
                        end;
                        table.insert(v373, {
                            line_start = v483, 
                            line_end = v482, 
                            damage = v480, 
                            predicted_position = v470
                        });
                    end;
                    return;
                end;
            end;
        end;
    end, 
    render_predictions = function()
        -- upvalues: v373 (ref)
        for _, v486 in ipairs(v373) do
            if v486.line_start and v486.line_end and v486.damage then
                render.line(v486.line_start, v486.line_end, color(255, 255, 0, 255));
                local v487 = (v486.line_start + v486.line_end) / 2;
                render.text(1, v487, color(255, 0, 0, 255), nil, tostring(math.floor(v486.damage)));
            end;
            if v486.predicted_position then
                render.circle_3d(v486.predicted_position, color(255, 0, 0, 100), 5, 0, 1);
            end;
        end;
    end
};
v38.aim_ackneed = {
    resolveraim_ack = function(v488)
        -- upvalues: v38 (ref)
        local l_target_1 = v488.target;
        if l_target_1 then
            local v490 = l_target_1:get_name();
            if not v490 then
                return;
            else
                local v491 = nil;
                if v38.locals.aim_shot_logs[v490] then
                    for _, v493 in ipairs(v38.locals.aim_shot_logs[v490]) do
                        if v493.shot_id == v488.id then
                            v491 = v493;
                            break;
                        end;
                    end;
                end;
                if not v491 then
                    print("info", "No matching shot data found.");
                    return;
                else
                    local l_headscale_0 = v491.headscale;
                    local l_state_0 = v491.state;
                    if v488.hitgroup == 1 and v488.damage > 99 and not v488.state then
                        v38.locals.successful_shots_logs[v490] = v38.locals.successful_shots_logs[v490] or {};
                        table.insert(v38.locals.successful_shots_logs[v490], {
                            headscale = math.floor(l_headscale_0), 
                            state = l_state_0
                        });
                        print("successful", string.format("Hit and killed %s with Headscale: %d | State: %s", v490, l_headscale_0, l_state_0));
                    elseif v38.locals.last_missed_player ~= v490 or not v38.locals.has_logged_miss then
                        v38.locals.missed_shots_logs[v490] = v38.locals.missed_shots_logs[v490] or {};
                        table.insert(v38.locals.missed_shots_logs[v490], {
                            headscale = math.floor(l_headscale_0), 
                            state = l_state_0
                        });
                        v38.locals.last_missed_player = v490;
                        v38.locals.has_logged_miss = true;
                        print("info", string.format("Shot missed on %s with Headscale: %d | State: %s", v490, l_headscale_0, l_state_0));
                    end;
                end;
            end;
        end;
    end
};
pairsort = function(v496)
    local v497 = {};
    for v498 in pairs(v496) do
        v497[#v497 + 1] = v498;
    end;
    table.sort(v497);
    local v499 = 0;
    return function()
        -- upvalues: v499 (ref), v497 (ref), v496 (ref)
        v499 = v499 + 1;
        return v497[v499], v496[v497[v499]];
    end;
end;
local v500 = {
    bools = {}, 
    tables = {}, 
    ints = {}, 
    numbers = {}
};
local v501 = {
    bools = {}, 
    tables = {}, 
    ints = {}, 
    numbers = {}
};
local function v504(v502, v503)
    -- upvalues: v501 (ref)
    if not v501[v502] then
        v501[v502] = {};
    end;
    v501[v502][#v501[v502] + 1] = v503;
end;
local function v510(v505)
    -- upvalues: v500 (ref), v504 (ref)
    for _, v507 in pairsort(v505) do
        local v508 = v507:id();
        local v509 = v507:get();
        if type(v509) == "boolean" then
            table.insert(v500.bools, v507);
            v504("bools", v508);
        elseif type(v509) == "table" then
            table.insert(v500.tables, v507);
            v504("tables", v508);
        elseif type(v509) == "string" then
            table.insert(v500.ints, v507);
            v504("ints", v508);
        else
            table.insert(v500.numbers, v507);
            v504("numbers", v508);
        end;
    end;
end;
v510(v38.uicreates.VisualsUI1);
v510(v38.uicreates.VisualsUI2);
v510(v38.uicreates.Anti_AimUI1);
v510(v38.uicreates.Anti_AimUI2);
v510(v38.groups.Anti_AimUI1);
v510(v38.groups.VisualsUI1);
v510(Antiaim[0]);
for v511 = 1, 7 do
    if Antiaim[v511] then
        v510(Antiaim[v511]);
    end;
    if Defensive_AA[v511] then
        v510(Defensive_AA[v511]);
    end;
    if Yawmode_AA[v511] then
        v510(Yawmode_AA[v511]);
    end;
    if Yawmodifier_AA[v511] then
        v510(Yawmodifier_AA[v511]);
    end;
    if Desync_AA[v511] then
        v510(Desync_AA[v511]);
    end;
    if Antiaim2[v511] then
        v510(Antiaim2[v511]);
    end;
    if Defensive_AA2[v511] then
        v510(Defensive_AA2[v511]);
    end;
    if Yawmode_AA2[v511] then
        v510(Yawmode_AA2[v511]);
    end;
    if Yawmodifier_AA2[v511] then
        v510(Yawmodifier_AA2[v511]);
    end;
    if Desync_AA2[v511] then
        v510(Desync_AA2[v511]);
    end;
end;
local function v525()
    -- upvalues: v501 (ref), v500 (ref), v38 (ref)
    local v512 = {
        [1] = {}, 
        [2] = {}, 
        [3] = {}, 
        [4] = {}
    };
    for v513, v514 in pairs(v501) do
        for _, v516 in pairs(v514) do
            for _, v518 in pairs(v500[v513]) do
                if v518:id() == v516 then
                    table.insert(v512[({
                        ints = 3, 
                        tables = 2, 
                        bools = 1, 
                        numbers = 4
                    })[v513]], v518:get());
                end;
            end;
        end;
    end;
    local v519 = v38.uicreates.HomeUI2.CfgList:get();
    if v519 >= 1 and v519 <= #v38.locals.Configlist then
        local v520 = v38.locals.Configlist[v519];
        local v521 = "nl/Apple Intelligence/config/" .. v520 .. ".cfg";
        local v522 = "<Apple>_" .. v38.imports.base64.encode(json.stringify(v512));
        local v523 = v38.uicreates.HomeUI2.InputCFG:get();
        local v524 = "nl/Apple Intelligence/config/" .. v523 .. ".cfg";
        if not files.read(v524) then
            files.write(v524, "<Apple>_W1tmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZSxmYWxzZV0sW1tdLFsiQWlyIiwiQWlyIER1Y2siXSxbXSxbXSxbXSxbXSxbXSxbXSxbXSxbXSxbXSxbXSxbXSxbXSxbXSxbXV0sWyJQcmVzZXQgRGV2IiwiVjEiLCJTdGFuZGluZyIsIk5vcm1hbCIsIlN0YW5kaW5nIiwiRGlzYWJsZWQiLCJMJlIiLCJMJlIiLCJEaXNhYmxlZCIsIkF0IFRhcmdldCIsIlN0YXRpYyIsIk9mZiIsIkRpc2FibGVkIiwiTCZSIiwiTCZSIiwiRGlzYWJsZWQiLCJBdCBUYXJnZXQiLCJTdGF0aWMiLCJPZmYiLCJEaXNhYmxlZCIsIkwmUiIsIkwmUiIsIkRpc2FibGVkIiwiQXQgVGFyZ2V0IiwiU3RhdGljIiwiT2ZmIiwiRGlzYWJsZWQiLCJMJlIiLCJMJlIiLCJEaXNhYmxlZCIsIkF0IFRhcmdldCIsIlN0YXRpYyIsIk9mZiIsIkRpc2FibGVkIiwiTCZSIiwiTCZSIiwiRGlzYWJsZWQiLCJBdCBUYXJnZXQiLCJTdGF0aWMiLCJPZmYiLCJEaXNhYmxlZCIsIkwmUiIsIkwmUiIsIkRpc2FibGVkIiwiQXQgVGFyZ2V0IiwiU3RhdGljIiwiT2ZmIiwiRGlzYWJsZWQiLCJMJlIiLCJMJlIiLCJEaXNhYmxlZCIsIkF0IFRhcmdldCIsIlN0YXRpYyIsIk9mZiIsIkRpc2FibGVkIiwiTCZSIiwiTCZSIiwiRGlzYWJsZWQiLCJBdCBUYXJnZXQiLCJTdGF0aWMiLCJPZmYiLCJEaXNhYmxlZCIsIkwmUiIsIkwmUiIsIkRpc2FibGVkIiwiQXQgVGFyZ2V0IiwiU3RhdGljIiwiT2ZmIiwiRGlzYWJsZWQiLCJMJlIiLCJMJlIiLCJEaXNhYmxlZCIsIkF0IFRhcmdldCIsIlN0YXRpYyIsIk9mZiIsIkRpc2FibGVkIiwiTCZSIiwiTCZSIiwiRGlzYWJsZWQiLCJBdCBUYXJnZXQiLCJTdGF0aWMiLCJPZmYiLCJEaXNhYmxlZCIsIkwmUiIsIkwmUiIsIkRpc2FibGVkIiwiQXQgVGFyZ2V0IiwiU3RhdGljIiwiT2ZmIiwiRGlzYWJsZWQiLCJMJlIiLCJMJlIiLCJEaXNhYmxlZCIsIkF0IFRhcmdldCIsIlN0YXRpYyIsIk9mZiIsIkRpc2FibGVkIiwiTCZSIiwiTCZSIiwiRGlzYWJsZWQiLCJBdCBUYXJnZXQiLCJTdGF0aWMiLCJPZmYiXSxbMC4wLDIwLjAsMTM4MDI5NjM4Ny4wLDEwOTc4NzE3NzAuMCxudWxsLDU3LjAsMTUuMCw2MjI3NjIxNzQuMCxudWxsLG51bGwsbnVsbCxudWxsLG51bGwsbnVsbCxudWxsLG51bGwsbnVsbCxudWxsLG51bGwsMS4wLDEuMCxudWxsLDEuMCw0OTUuMCwwLjAsMC4wLDAuMCw4Ni4wLDAuMCwwLjAsMC4wLDY4LjAsMy4wLDAuMCwtMi4wLDIwLjAsNTAwLjAsNTAwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDE1LjAsMTUuMCwxNS4wLDE1LjAsMTUuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDU4LjAsNTguMCw1OC4wLDU4LjAsNTguMCw1OC4wLDE1LjAsNTAwLjAsNTAwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwxLjAsMS4wLDEuMCwxNS4wLDE1LjAsMTUuMCwxNS4wLDE1LjAsMC4wLDAuMCwwLjAsMC4wLDAuMCw1OC4wLDU4LjAsNTguMCwzMC4wLDMwLjAsMzAuMCwxNS4wLDE4MC4wLDE4MC4wLDAuMCwwLjAsMC4wLDAuMCw1OC4wLDU4LjAsMS4wLDEuMCwzMC4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDE1LjAsMTUuMCwxNS4wLDE1LjAsMTUuMCwwLjAsMC4wLDEuMCwxLjAsMS4wLDMwLjAsNTguMCw1OC4wLDMwLjAsNTguMCw1OC4wLDU4LjAsMC4wLDAuMCwzMC4wLDEuMCwzMC4wLDEuMCwzMC4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxNS4wLDE1LjAsMTUuMCwxNS4wLDE1LjAsMC4wLDEuMCwxLjAsMS4wLDAuMCwwLjAsMTUuMCwxNS4wLDMwLjAsMzAuMCwzMC4wLDEuMCwzMC4wLDU4LjAsNTguMCwxNS4wLDMwLjAsMzAuMCwxLjAsMS4wLDYwLjAsNjAuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDAuMCwwLjAsMTUuMCwxNS4wLDE1LjAsMTUuMCwxNS4wLDAuMCwwLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCw1OC4wLDU4LjAsNTguMCwwLjAsMzAuMCwzMC4wLDMwLjAsMzAuMCwxNS4wLDYwLjAsNjAuMCwzMC4wLDU4LjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwwLjAsMC4wLDAuMCwxLjAsMS4wLDEuMCwxNS4wLDE1LjAsMTUuMCwxNS4wLDE1LjAsMC4wLDU4LjAsMC4wLDEuMCwxNS4wLDEuMCwxLjAsMzAuMCwzMC4wLDMwLjAsMzAuMCw1OC4wLDU4LjAsNTguMCw1OC4wLDU4LjAsMzAuMCwzMC4wLDEuMCwxLjAsNTguMCw1OC4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMC4wLDAuMCwxNS4wLDE1LjAsMS4wLDE1LjAsMTUuMCwwLjAsMTUuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDU4LjAsNTguMCw1OC4wLDU4LjAsNTguMCw1OC4wLDU4LjAsMC4wLDAuMCwzMC4wLDE1LjAsMzAuMCwzMC4wLDEuMCwxLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwxNS4wLDAuMCwwLjAsMC4wLDE1LjAsMTUuMCwxNS4wLDE1LjAsMTUuMCwxLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCw1OC4wLDMwLjAsMzAuMCwxLjAsMS4wLDMwLjAsMzAuMCwzMC4wLDE1LjAsMzAuMCwxODAuMCwwLjAsMC4wLDAuMCwwLjAsMC4wLDAuMCwxLjAsMS4wLDEuMCwxLjAsMTUuMCwxNS4wLDE1LjAsMTUuMCwxNS4wLDE1LjAsMTUuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDU4LjAsMzAuMCwzMC4wLDMwLjAsMzAuMCwzMC4wLDE1LjAsNjAuMCw2MC4wLDAuMCwwLjAsMzAuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDAuMCwxNS4wLDE1LjAsMTUuMCwwLjAsMC4wLDE1LjAsMTUuMCwxLjAsMS4wLDEuMCwwLjAsMC4wLDEuMCwzMC4wLDMwLjAsMzAuMCwzMC4wLDMwLjAsNTguMCwxNS4wLDAuMCwzMC4wLDg5LjAsNTguMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDAuMCwwLjAsMS4wLDEuMCwxLjAsMTUuMCwxNS4wLDE1LjAsMTUuMCwxNS4wLDAuMCwwLjAsMC4wLDEuMCwxLjAsMS4wLDEuMCwzMC4wLDMwLjAsMzAuMCwzMC4wLDg5LjAsNTguMCw1OC4wLDMwLjAsMTUuMCwzMC4wLDMwLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDEuMCwxLjAsMS4wLDE1LjAsMTUuMCwxNS4wLDE1LjAsMTUuMCwxLjAsMS4wLDE1LjAsMTUuMCwxLjBdXQ==", false);
            v38.Luafunctions.getallconfigsfromfolder();
            utils.console_exec("playvol  buttons/bell1.wav 1");
            print("info", "Created new config file:", v523);
            return;
        else
            files.write(v521, v522, false);
            utils.console_exec("playvol  buttons/bell1.wav 1");
            print("info", "Saved config at index:", v519, "Config name:", v520);
            v38.uicreates.HomeUI2.CfgList:update(v38.locals.Configlist);
        end;
    else
        print("info", "Invalid config index selected:", v519);
    end;
end;
local function v539()
    -- upvalues: v38 (ref), v500 (ref), v501 (ref), v7 (ref)
    local v526 = v38.uicreates.HomeUI2.CfgList:get();
    if v526 >= 1 and v526 <= #v38.locals.Configlist then
        local v527 = v38.locals.Configlist[v526];
        local v528 = "nl/Apple Intelligence/config/" .. v527 .. ".cfg";
        if not files.read(v528) then
            print("info", "Config file doesn't exist or is corrupted: " .. v528);
            v38.Luafunctions.getallconfigsfromfolder();
            return;
        else
            local v529 = files.read(v528);
            v38.uicreates.HomeUI2.CfgList:update(v38.locals.Configlist);
            utils.console_exec("playvol  buttons/bell1.wav 1");
            print("info", "Reading config file: " .. v528);
            if v529 == " " then
                print("info", "Config file is empty: " .. v528);
                return;
            else
                local v530 = v529:gsub("<Apple>_", "");
                local v531 = json.parse(v38.imports.base64.decode(v530));
                print("info", "Decoded config data from file: " .. v527);
                for v532, v533 in pairs(v500) do
                    local v534 = ({
                        ints = 3, 
                        tables = 2, 
                        bools = 1, 
                        numbers = 4
                    })[v532];
                    local l_pairs_0 = pairs;
                    local v536 = v531[v534] or {};
                    for v537, v538 in l_pairs_0(v536) do
                        if v533[v537] and v533[v537]:id() == v501[v532][v537] then
                            v533[v537]:set(v538);
                        end;
                    end;
                end;
                v7.on_config_load();
                print("info", "Config has been loaded successfully: " .. v527);
            end;
        end;
    else
        print("info", "Invalid config index selected: " .. v526);
    end;
end;
local function v554()
    -- upvalues: v501 (ref), v500 (ref), v38 (ref)
    local v540 = {
        [1] = {}, 
        [2] = {}, 
        [3] = {}, 
        [4] = {}
    };
    for v541, v542 in pairs(v501) do
        for _, v544 in pairs(v542) do
            for _, v546 in pairs(v500[v541]) do
                if v546:id() == v544 then
                    table.insert(v540[({
                        ints = 3, 
                        tables = 2, 
                        bools = 1, 
                        numbers = 4
                    })[v541]], v546:get());
                end;
            end;
        end;
    end;
    local v547 = v38.uicreates.HomeUI4.CfgList:get();
    if v547 >= 1 and v547 <= #v38.locals.CloudConfiglist then
        local _ = v38.locals.CloudConfiglist[v547];
        local v549 = "<Apple>_" .. v38.imports.base64.encode(json.stringify(v540));
        local v550 = v38.uicreates.HomeUI4.InputCFG:get();
        local v551 = {
            username = common.get_username(), 
            configName = v550, 
            configData = v549
        };
        do
            local l_v550_0 = v550;
            network.post("https://applelua.cc/save-config", v551, {
                ["Content-Type"] = "text/plain"
            }, function(v553)
                -- upvalues: l_v550_0 (ref)
                if json.parse(v553).status then
                    GetcloudConfigs();
                    print("info", "Config saved successfully to the cloud: " .. l_v550_0);
                    utils.console_exec("playvol buttons/bell1.wav 1");
                else
                    print("error", "Failed to save config to the cloud: " .. json.parse(v553).status .. "");
                end;
            end);
        end;
    else
        print("info", "Invalid index: " .. v547);
    end;
end;
local function v570()
    -- upvalues: v38 (ref), v500 (ref), v501 (ref), v7 (ref)
    local v555 = v38.uicreates.HomeUI4.CfgList:get();
    if v555 >= 1 and v555 <= #v38.locals.CloudConfiglist then
        local v556 = v38.locals.CloudConfiglist[v555];
        local v557 = common.get_username();
        local v558 = "?username=" .. tostring(v557) .. "&configName=" .. tostring(v556);
        v38.imports.MTools.Network.Download("https://applelua.cc/load-config" .. v558, "nl\\Apple Intelligence\\temp\\temp.cfg", true, 128);
        local v559 = "temp.cfg";
        if not files.read("nl/Apple Intelligence/Temp/" .. v559 .. "") then
            print("info", "Config Doesn't exist or is corrupted");
            return;
        else
            local v560 = files.read("nl/Apple Intelligence/temp/" .. v559 .. "");
            utils.console_exec("playvol  buttons/bell1.wav 1");
            if v560 == " " then
                print("info", "Config is empty");
                return;
            else
                files.write("nl/Apple Intelligence/info/apple1.info", "" .. v556 .. "", false);
                files.write("nl/Apple Intelligence/info/apple2.info", "cloud", false);
                v38.locals.lastusedcfg = files.read("nl\\Apple Intelligence\\info\\apple1.info");
                v38.locals.lastwhatcfg = files.read("nl\\Apple Intelligence\\info\\apple2.info");
                v38.Luafunctions.loadedcfg();
                print("info", "Config has been loaded");
                local v561 = v560:gsub("<Apple>_", "");
                local v562 = json.parse(v38.imports.base64.decode(v561));
                for v563, v564 in pairs(v500) do
                    local v565 = ({
                        ints = 3, 
                        tables = 2, 
                        bools = 1, 
                        numbers = 4
                    })[v563];
                    local l_pairs_1 = pairs;
                    local v567 = v562[v565] or {};
                    for v568, v569 in l_pairs_1(v567) do
                        if v564[v568] and v564[v568]:id() == v501[v563][v568] then
                            v564[v568]:set(v569);
                        end;
                    end;
                end;
                v7.on_config_load();
                print("info", "Config has been loaded successfully: " .. v556);
                v38.imports.MTools.FileSystem:DeleteFile("nl/Apple Intelligence/Temp/", "" .. v559 .. "", true);
            end;
        end;
    end;
end;
local function v577()
    -- upvalues: v38 (ref)
    local v571 = v38.uicreates.HomeUI4.CfgList:get();
    if v571 >= 1 and v571 <= #v38.locals.CloudConfiglist then
        local v572 = v38.locals.CloudConfiglist[v571];
        local v573 = common.get_username();
        local v574 = "?username=" .. tostring(v573) .. "&configName=" .. tostring(v572);
        do
            local l_v572_0 = v572;
            network.post("https://applelua.cc/delete-cfg" .. v574, nil, nil, function(v576)
                -- upvalues: v571 (ref), l_v572_0 (ref)
                if json.parse(v576).status then
                    GetcloudConfigs();
                    utils.console_exec("playvol buttons/bell1.wav 1");
                    GetcloudConfigs();
                    utils.console_exec("playvol  buttons/bell1.wav 1");
                    print("info", "Deleted config at index " .. v571 .. ": " .. l_v572_0);
                else
                    print("error", "Failed to save config to the cloud: " .. json.parse(v576).status .. "");
                end;
            end);
        end;
    else
        print("info", "Invalid index: " .. v571);
    end;
end;
local function v581()
    -- upvalues: v38 (ref)
    local v578 = v38.uicreates.HomeUI2.CfgList:get();
    if v578 >= 1 and v578 <= #v38.locals.Configlist then
        local v579 = v38.locals.Configlist[v578];
        local v580 = "" .. v579 .. ".cfg";
        v38.imports.MTools.FileSystem:DeleteFile("nl/Apple Intelligence/config/", v580, false);
        v38.Luafunctions.getallconfigsfromfolder();
        utils.console_exec("playvol  buttons/bell1.wav 1");
        print("info", "Deleted config at index " .. v578 .. ": " .. v579);
    else
        print("info", "Invalid index: " .. v578);
    end;
end;
local function v589()
    -- upvalues: v501 (ref), v500 (ref), v38 (ref)
    print("info", "Config has been Exported");
    utils.console_exec("playvol  buttons/bell1.wav 1");
    local v582 = {
        [1] = {}, 
        [2] = {}, 
        [3] = {}, 
        [4] = {}
    };
    for v583, v584 in pairs(v501) do
        for _, v586 in pairs(v584) do
            for _, v588 in pairs(v500[v583]) do
                if v588:id() == v586 then
                    table.insert(v582[({
                        ints = 3, 
                        tables = 2, 
                        bools = 1, 
                        numbers = 4
                    })[v583]], v588:get());
                end;
            end;
        end;
    end;
    v38.imports.clipboard.set("<Apple>_" .. v38.imports.base64.encode(json.stringify(v582)));
end;
local function v599()
    -- upvalues: v38 (ref), v500 (ref), v501 (ref), v7 (ref)
    print("info", "Config has been imported");
    utils.console_exec("playvol  buttons/bell1.wav 1");
    local v590 = v38.imports.clipboard.get():gsub("<Apple>_", "");
    local v591 = json.parse(v38.imports.base64.decode(v590));
    for v592, v593 in pairs(v500) do
        local v594 = ({
            ints = 3, 
            tables = 2, 
            bools = 1, 
            numbers = 4
        })[v592];
        local l_pairs_2 = pairs;
        local v596 = v591[v594] or {};
        for v597, v598 in l_pairs_2(v596) do
            if v593[v597] and v593[v597]:id() == v501[v592][v597] then
                v593[v597]:set(v598);
            end;
        end;
    end;
    v7.on_config_load();
    print("info", "Config has been loaded successfully");
end;
v38.set_callback = {
    v38.uicreates.HomeUI2.CfgList:set_callback(v38.Luafunctions.ui_callbackselectedconfig), 
    v38.uicreates.HomeUI2.InputCFG:set_callback(v38.Luafunctions.ui_callbackselectedconfig2), 
    v38.uicreates.HomeUI4.CfgList:set_callback(v38.Luafunctions.ui_callbackselectedconfig3), 
    v38.uicreates.HomeUI4.InputCFG:set_callback(v38.Luafunctions.ui_callbackselectedconfig4), 
    v38.uicreates.Anti_AimUI1.Idealtickhelper:set_callback(v38.Luafunctions.ui_callback2), 
    v38.groups.VisualsUI1.diffrentcolors:set_callback(v38.Luafunctions.ui_callback3), 
    v38.uicreates.VisualsUI1.Keybinds:set_callback(v38.Luafunctions.ui_callback4), 
    v38.uicreates.Anti_AimUI1.Resolver:set_callback(v38.Luafunctions.ui_callback5), 
    Antiaim[0].enable_antiaim:set_callback(v38.Luafunctions.ui_callback6), 
    v38.uicreates.VisualsUI1.notifications:set_callback(v38.Luafunctions.ui_callback8), 
    v38.uicreates.VisualsUI1.Viewmodel:set_callback(v38.Luafunctions.ui_callback9), 
    v38.uicreates.VisualsUI1.Viewmodel:set_callback(v38.Luafunctions.viewmodelchange), 
    v38.groups.VisualsUI1.viewmodel_fov:set_callback(v38.Luafunctions.viewmodelchange), 
    v38.groups.VisualsUI1.viewmodel_x:set_callback(v38.Luafunctions.viewmodelchange), 
    v38.groups.VisualsUI1.viewmodel_y:set_callback(v38.Luafunctions.viewmodelchange), 
    v38.groups.VisualsUI1.viewmodel_z:set_callback(v38.Luafunctions.viewmodelchange), 
    v38.groups.Anti_AimUI3.LCbreakDelay:set_callback(v38.Luafunctions.ui_callback10), 
    v38.uicreates.Anti_AimUI1.Jumpscout:set_callback(v38.Luafunctions.jumpscoutvisibility), 
    v38.groups.Anti_AimUI1.forceresetresolverdata:set_callback(v38.Luafunctions.forece_reset_data), 
    v38.uicreates.VisualsUI2.Clantag:set_callback(v38.Luafunctions.clantaganim), 
    v38.uicreates.HomeUI2.Delete:set_callback(v581), 
    v38.uicreates.HomeUI2.Export:set_callback(v589), 
    v38.uicreates.HomeUI2.Import:set_callback(v599), 
    v38.uicreates.HomeUI2.Load:set_callback(v539), 
    v38.uicreates.HomeUI2.Save:set_callback(v525), 
    v38.uicreates.HomeUI4.Load:set_callback(v570), 
    v38.uicreates.HomeUI4.Save:set_callback(v554), 
    v38.uicreates.HomeUI4.Delete:set_callback(v577), 
    v38.uicreates.HomeUI5.DiscordLink:set_callback(v38.Luafunctions.discordlink), 
    v38.uicreates.HomeUI5.Websitelink:set_callback(v38.Luafunctions.Websitelink), 
    v38.uicreates.HomeUI5.WebtokenLink:set_callback(v38.Luafunctions.webtokenlink), 
    v38.uicreates.HomeUI1.MainPagesel:set_callback(v38.Luafunctions.MainPage), 
    v38.uicreates.VisualsUI2.DropNades:set_callback(v38.Luafunctions.QuickNadeDrop), 
    v38.uicreates.VisualsUI1.AspectRatio:set_callback(v38.Luafunctions.aspect_ratio2), 
    v38.uicreates.VisualsUI2.Fakepingunlocker:set_callback(v38.Luafunctions.fakepingunlocker)
};
v38.startup = {
    v38.Luafunctions.getallconfigsfromfolder(), 
    v38.Luafunctions.ui_callback2(), 
    v38.Luafunctions.ui_callback3(), 
    v38.Luafunctions.ui_callback4(), 
    v38.Luafunctions.ui_callback5(), 
    v38.Luafunctions.ui_callback6(), 
    v38.Luafunctions.resetscoreboard(), 
    v38.Luafunctions.scoreboard(), 
    v38.Luafunctions.jumpscoutvisibility(), 
    v38.groups.VisualsUI1.locationx:visibility(false), 
    v38.groups.VisualsUI1.locationy:visibility(false), 
    v38.groups.VisualsUI1.locationx2:visibility(false), 
    v38.groups.VisualsUI1.locationy2:visibility(false), 
    v38.groups.VisualsUI1.locationx3:visibility(false), 
    v38.groups.VisualsUI1.locationy3:visibility(false), 
    v38.groups.VisualsUI1.locationx4:visibility(false), 
    v38.groups.VisualsUI1.locationy4:visibility(false), 
    v38.groups.VisualsUI1.locationx5:visibility(false), 
    v38.groups.VisualsUI1.locationy5:visibility(false), 
    v38.uicreates.VisualsUI1.Idealtick:disabled(true), 
    v38.Luafunctions.loadedcfg(), 
    v38.groups.VisualsUI1.colorpicker1:disabled(true), 
    v38.groups.VisualsUI1.colorpicker2:disabled(true), 
    v38.groups.VisualsUI1.colorpicker3:disabled(true), 
    v38.groups.VisualsUI1.colorpicker4:disabled(true), 
    v38.groups.VisualsUI1.glowheader:disabled(true), 
    v38.groups.VisualsUI1.glowbindsthickness2:disabled(true), 
    v38.groups.VisualsUI1.diffrentcolors:disabled(true), 
    v38.groups.VisualsUI1.showvalues:disabled(true), 
    v38.groups.VisualsUI1.colorpicker5:disabled(true), 
    v38.groups.VisualsUI1.colorpicker6:disabled(true), 
    v38.groups.VisualsUI1.colorpicker7:disabled(true), 
    v38.groups.VisualsUI1.colorpicker8:disabled(true), 
    v38.groups.VisualsUI1.glowbinds:disabled(true), 
    v38.groups.Anti_AimUI3.FreestandingBetterDisablers:disabled(true), 
    v38.groups.VisualsUI1.glowbindsthickness:disabled(true), 
    v38.Luafunctions.aspect_ratio2()
};
v7.on_config_load();
events.render:set(function()
    -- upvalues: v38 (ref)
    if v38.uicreates.VisualsUI1.forcepredict:get() then
        v38.createmoveneed.render_predictions();
    end;
    v38.Luafunctions.Antiaimvisibler();
    if v38.uicreates.VisualsUI1.infopanel:get() then
        v38.rendersneed.new_drag_object4:update();
    end;
    if v38.uicreates.VisualsUI1.notifications:get() then
        v38.rendersneed.new_drag_object3:update();
    end;
    if v38.uicreates.VisualsUI1.crosshair_ind:get() then
        v38.rendersneed.crosshair_incd();
    end;
    if v38.uicreates.Anti_AimUI1.Idealtickhelper:get() then
        v38.rendersneed.idealtickhelper();
    end;
    if v38.uicreates.VisualsUI1.Keybinds:get() then
        v38.rendersneed.new_drag_object2:update();
    end;
    if v38.uicreates.VisualsUI1.Spectators:get() then
        v38.rendersneed.new_drag_object6:update();
    end;
end);
events.createmove:set(function(v600)
    -- upvalues: v38 (ref)
    if v38.uicreates.VisualsUI1.forcepredict:get() then
        v38.createmoveneed.forcepred(v600);
    end;
    if Antiaim[0].enable_antiaim:get() then
        v38.createmoveneed.get_conditions();
        v38.createmoveneed.Antiaim_worker(v600);
    end;
    if v38.uicreates.Anti_AimUI1.Resolver:get() then
        v38.createmoveneed.resolvercreatemove();
    end;
    if v38.uicreates.Anti_AimUI1.Jumpscout:get() then
        v38.createmoveneed.jumpscoutcreatemove();
    end;
    if v38.uicreates.VisualsUI2.NadeFix:get() then
        v38.Luafunctions.Nadefix();
    end;
    if v38.uicreates.VisualsUI2.FastLadder:get() then
        v38.createmoveneed.fastladder(v600);
    end;
    v38.createmoveneed.extrasantiaim(v600);
end);
events.aim_fire:set(function(v601)
    -- upvalues: v38 (ref)
    if v38.uicreates.Anti_AimUI1.Resolver:get() then
        v38.aim_fireneed.resolveraim_fire(v601);
    end;
end);
local v602 = {
    [0] = "generic", 
    [1] = "head", 
    [2] = "chest", 
    [3] = "stomach", 
    [4] = "left arm", 
    [5] = "right arm", 
    [6] = "left leg", 
    [7] = "right leg", 
    [8] = "neck", 
    [9] = "generic", 
    [10] = "gear"
};
events.aim_ack:set(function(v603)
    -- upvalues: v38 (ref), v602 (ref), v339 (ref)
    local v604 = entity.get(v603.target, true):get_steam_avatar();
    if v603.state then
        if v38.uicreates.VisualsUI1.consolelogsragebot:get() then
            print("error", "You missed " .. v603.state .. " in " .. v602[v603.wanted_hitgroup] .. " for " .. v603.wanted_damage .. " BT:" .. v603.backtrack .. "");
        end;
        v339:addNotification("Ragebot", "You missed " .. v602[v603.wanted_hitgroup] .. " due to " .. v603.state .. " for " .. v603.wanted_damage .. ".", v604);
    else
        if v38.uicreates.VisualsUI1.consolelogsragebot:get() then
            print("successful", "You hit " .. v602[v603.hitgroup] .. " for " .. v603.damage .. " BT:" .. v603.backtrack .. "");
        end;
        v339:addNotification("Ragebot", "You hit " .. v602[v603.hitgroup] .. " for " .. v603.damage .. ".", v604);
    end;
    if v38.uicreates.Anti_AimUI1.Resolver:get() then
        v38.aim_ackneed.resolveraim_ack(v603);
    end;
end);
events.cs_game_disconnected:set(function()
    -- upvalues: v38 (ref)
    if v38.uicreates.Anti_AimUI1.Resolver:get() then
        print("info", "Resolver data reseted due to cs game disconnected");
    end;
    v38.locals.players_states = {};
    v38.locals.last_known_states = {};
    v38.locals.last_states = {};
    v38.locals.missed_shots_logs = {};
    v38.locals.successful_shots_logs = {};
    v38.locals.last_missed_player = nil;
    v38.locals.has_logged_miss = false;
    v38.locals.player_headscales = {};
    v38.locals.aim_shot_logs = {};
end);
events.round_start:set(function()
    -- upvalues: v38 (ref)
    v38.Luafunctions.resetscoreboard();
    utils.execute_after(1, function()
        -- upvalues: v38 (ref)
        v38.Luafunctions.scoreboard();
    end);
end);
events.round_end:set(function()
    -- upvalues: v38 (ref)
    v38.Luafunctions.resetscoreboard();
    utils.execute_after(1, function()
        -- upvalues: v38 (ref)
        v38.Luafunctions.scoreboard();
    end);
end);
events.shutdown:set(function()
    -- upvalues: v38 (ref), v0 (ref)
    v38.Luafunctions.resetscoreboard();
    if not v0 then
        print("info", "Server connection: " .. v38.imports.json.decode(v38.server.Disconnect).status .. "");
    end;
    cvar.sv_maxunlag:float(0.2);
    cvar.viewmodel_fov:int(60);
    cvar.viewmodel_offset_x:float(1);
    cvar.viewmodel_offset_y:float(1);
    cvar.viewmodel_offset_z:float(-1.5);
end);
events.player_death:set(function(v605)
    -- upvalues: v38 (ref)
    if v38.uicreates.VisualsUI2.TrashTalk:get() then
        v38.Luafunctions.trashtalkitself(v605);
    end;
end);
v38.tooltips = {
    tooltip1 = v38.uicreates.HomeUI2.Delete:tooltip("May not work as intended"), 
    tooltip1 = v38.uicreates.HomeUI2.Export:tooltip("May not work as intended"), 
    tooltip1 = v38.uicreates.HomeUI2.Import:tooltip("May not work as intended"), 
    tooltip1 = v38.uicreates.HomeUI2.Load:tooltip("May not work as intended"), 
    tooltip1 = v38.uicreates.HomeUI2.Save:tooltip("May not work as intended"), 
    tooltip1 = v38.uicreates.VisualsUI1.Idealtick:tooltip("Still in being made!"), 
    tooltip1 = v38.uicreates.VisualsUI1.Spectators:tooltip("Still in being made!"), 
    tooltip1 = v38.uicreates.VisualsUI1.forcepredict:tooltip("Force prediction something new!\n\nMay not work as intended and its early access still testing stage maybe not even possible to do this who knows! may decrease performance"), 
    tooltip1 = v38.uicreates.Anti_AimUI3.extras:tooltip("Warning don't use (TP-Spammer and Better Air-Duck) and don't use (Air-Lag with TP-Spammer) they will conflict\n\nDont use Better Air-Duck in server's that dont allow fake duck\n\nTP-Spammer works only on [Air, Air-Duck]\n\nBetter Air-Duck only on [Air-Duck]"), 
    tooltip1 = v38.uicreates.VisualsUI2.DropNades:tooltip("Make this a bind and btw it works it just instantly disables it!"), 
    tooltip1 = v38.uicreates.Anti_AimUI3.FreestandingBetter:tooltip("BIND ME please:) otherwise i won't work as needed and unbind from the cheats anti-aim section freestanding")
};
Server = function(v606)
    -- upvalues: v38 (ref)
    local v607 = {
        status = "Offline", 
        responseTime = "0 ms"
    };
    local v608 = {
        onlineUsers = "0"
    };
    local function v609()
        -- upvalues: v607 (ref), v38 (ref), v608 (ref)
        v607 = v38.imports.json.decode(v38.server.SereverResponseTime or "{}");
        v608 = v38.imports.json.decode(v38.server.GetUsers or "{}");
    end;
    local function v610()
        -- upvalues: v38 (ref)
        v38.uicreates.HomeUI4.CfgList:disabled(true);
        v38.uicreates.HomeUI4.Delete:disabled(true);
        v38.uicreates.HomeUI4.InputCFG:disabled(true);
        v38.uicreates.HomeUI4.Load:disabled(true);
        v38.uicreates.HomeUI4.Save:disabled(true);
    end;
    if v606 ~= "refresh" then
        if not v38.server.SereverResponseTime or v38.server.SereverResponseTime:match("^%s*$") then
            v610();
        else
            print("info", "Server connection: " .. (v38.imports.json.decode(v38.server.Connected).status or "Unknown"));
            v609();
            GetcloudConfigs();
        end;
    else
        v609();
    end;
    local v611 = v607.responseTime or "0 ms";
    local v612 = "Server status: " .. (v607.status or "Offline") .. "\n\nServer response time: " .. v611 .. "\n\nUsers Online: " .. tostring(v608.onlineUsers or "0");
    v38.uicreates.HomeUI3.ServerData:name(v612);
end;
GetcloudConfigs = function()
    -- upvalues: v38 (ref)
    network.get("https://applelua.cc/get-configs?username=" .. common.get_username(), {
        ["Content-Type"] = "application/json"
    }, function(v613)
        -- upvalues: v38 (ref)
        local v614 = {};
        local v615 = 0;
        if not v613 or v613 == "" then
            print_raw("No response received or empty response.");
            return;
        else
            local v616 = v38.imports.json.decode(v613);
            if not v616.status then
                return;
            elseif not v616.configs then
                return;
            else
                print_raw(v616.status);
                for _, v618 in pairs(v616.configs) do
                    if v618:sub(-4) == ".cfg" then
                        v615 = v615 + 1;
                        v618 = v618:sub(1, -5);
                        table.insert(v614, v618);
                    else
                        print("warning", "Found not supported config file [" .. v618 .. "]");
                    end;
                    if v615 == 0 then
                        table.insert(v614, "Empty");
                    end;
                    v38.locals.CloudConfiglist = v614;
                    v38.uicreates.HomeUI4.CfgList:update(v38.locals.CloudConfiglist);
                end;
                return;
            end;
        end;
    end);
end;
if not v0 then
    Server("start");
else
    v38.uicreates.HomeUI4.CfgList:disabled(true);
    v38.uicreates.HomeUI4.Delete:disabled(true);
    v38.uicreates.HomeUI4.InputCFG:disabled(true);
    v38.uicreates.HomeUI4.Load:disabled(true);
    v38.uicreates.HomeUI4.Save:disabled(true);
end;
utils.execute_after(1, function()
    -- upvalues: v7 (ref), v38 (ref)
    v7.on_config_load();
    v38.Luafunctions.MainPage();
end);
local v619 = "    ______                  ___               ______          __           ___    ___                                                \n    /\\  _  \\                /\\_ \\             /\\__  _\\        /\\ \\__       /\\_ \\  /\\_ \\    __                                         \n    \\ \\ \\L\\ \\  _____   _____\\//\\ \\      __    \\/_/\\ \\/     ___\\ \\ ,_\\    __\\//\\ \\ \\//\\ \\  /\\_\\     __      __    ___     ___     __   \n     \\ \\  __ \\/\\ '__`\\/\\ '__`\\\\ \\ \\   /'__`\\     \\ \\ \\   /' _ `\\ \\ \\/  /'__`\\\\ \\ \\  \\ \\ \\ \\/\\ \\  /'_ `\\  /'__`\\/' _ `\\  /'___\\ /'__`\\ \n      \\ \\ \\/\\ \\ \\ \\L\\ \\ \\ \\L\\ \\\\_\\ \\_/\\  __/      \\_\\ \\__/\\ \\/\\ \\ \\ \\_/\\  __/ \\_\\ \\_ \\_\\ \\_\\ \\ \\/\\ \\L\\ \\/\\  __//\\ \\/\\ \\/\\ \\__//\\  __/ \n       \\ \\_\\ \\_\\ \\ ,__/\\ \\ ,__//\\____\\ \\____\\     /\\_____\\ \\_\\ \\_\\ \\__\\ \\____\\/\\____\\/\\____\\\\ \\_\\ \\____ \\ \\____\\ \\_\\ \\_\\ \\____\\ \\____\\\n        \\/_/\\/_/\\ \\ \\/  \\ \\ \\/ \\/____/\\/____/     \\/_____/\\/_/\\/_/\\/__/\\/____/\\/____/\\/____/ \\/_/\\/___L\\ \\/____/\\/_/\\/_/\\/____/\\/____/\n                 \\ \\_\\   \\ \\_\\                                                                     /\\____/                            \n                  \\/_/    \\/_/                                                                     \\_/__/                             \n";
local v620 = {
    [1] = 32, 
    [2] = 32, 
    [3] = 255
};
local v621 = {
    [1] = 255, 
    [2] = 200, 
    [3] = 200
};
local v622 = 200;
local function v626(v623)
    local v624 = {};
    for v625 in v623:gmatch("([^\n]*)\n?") do
        table.insert(v624, v625);
    end;
    return v624;
end;
local function v631(v627, v628, v629, v630)
    return math.floor(v627 + (v628 - v627) * (v629 / v630));
end;
local v632 = v626(v619);
local v633 = {};
for _, v635 in ipairs(v632) do
    local v636 = "";
    for v637 = 1, #v635 do
        local v638 = v631(v620[1], v621[1], v637, #v635);
        local v639 = v631(v620[2], v621[2], v637, #v635);
        local v640 = v631(v620[3], v621[3], v637, #v635);
        v636 = v636 .. string.format("\a%02X%02X%02X%02X%s", v638, v639, v640, v622, v635:sub(v637, v637));
    end;
    table.insert(v633, v636);
end;
utils.execute_after(0.5, function()
    -- upvalues: v633 (ref)
    for _, v642 in ipairs(v633) do
        print_raw(v642);
    end;
    print("info", "Welcome " .. common.get_username() .. " to Apple Intelligence ");
end);